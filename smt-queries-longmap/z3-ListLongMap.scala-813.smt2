; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19800 () Bool)

(assert start!19800)

(declare-fun b!194001 () Bool)

(declare-fun b_free!4717 () Bool)

(declare-fun b_next!4717 () Bool)

(assert (=> b!194001 (= b_free!4717 (not b_next!4717))))

(declare-fun tp!17020 () Bool)

(declare-fun b_and!11445 () Bool)

(assert (=> b!194001 (= tp!17020 b_and!11445)))

(declare-fun b!193993 () Bool)

(declare-fun e!127625 () Bool)

(declare-fun e!127630 () Bool)

(declare-fun mapRes!7766 () Bool)

(assert (=> b!193993 (= e!127625 (and e!127630 mapRes!7766))))

(declare-fun condMapEmpty!7766 () Bool)

(declare-datatypes ((V!5633 0))(
  ( (V!5634 (val!2289 Int)) )
))
(declare-datatypes ((ValueCell!1901 0))(
  ( (ValueCellFull!1901 (v!4252 V!5633)) (EmptyCell!1901) )
))
(declare-datatypes ((array!8215 0))(
  ( (array!8216 (arr!3866 (Array (_ BitVec 32) (_ BitVec 64))) (size!4190 (_ BitVec 32))) )
))
(declare-datatypes ((array!8217 0))(
  ( (array!8218 (arr!3867 (Array (_ BitVec 32) ValueCell!1901)) (size!4191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2710 0))(
  ( (LongMapFixedSize!2711 (defaultEntry!3959 Int) (mask!9222 (_ BitVec 32)) (extraKeys!3696 (_ BitVec 32)) (zeroValue!3800 V!5633) (minValue!3800 V!5633) (_size!1404 (_ BitVec 32)) (_keys!5953 array!8215) (_values!3942 array!8217) (_vacant!1404 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2710)

(declare-fun mapDefault!7766 () ValueCell!1901)

(assert (=> b!193993 (= condMapEmpty!7766 (= (arr!3867 (_values!3942 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1901)) mapDefault!7766)))))

(declare-fun b!193994 () Bool)

(declare-fun e!127633 () Bool)

(declare-fun tp_is_empty!4489 () Bool)

(assert (=> b!193994 (= e!127633 tp_is_empty!4489)))

(declare-fun res!91689 () Bool)

(declare-fun e!127628 () Bool)

(assert (=> start!19800 (=> (not res!91689) (not e!127628))))

(declare-fun valid!1132 (LongMapFixedSize!2710) Bool)

(assert (=> start!19800 (= res!91689 (valid!1132 thiss!1248))))

(assert (=> start!19800 e!127628))

(declare-fun e!127631 () Bool)

(assert (=> start!19800 e!127631))

(assert (=> start!19800 true))

(assert (=> start!19800 tp_is_empty!4489))

(declare-fun b!193995 () Bool)

(declare-datatypes ((Unit!5858 0))(
  ( (Unit!5859) )
))
(declare-fun e!127632 () Unit!5858)

(declare-fun lt!96699 () Unit!5858)

(assert (=> b!193995 (= e!127632 lt!96699)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5858)

(assert (=> b!193995 (= lt!96699 (lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(declare-fun res!91690 () Bool)

(declare-datatypes ((SeekEntryResult!682 0))(
  ( (MissingZero!682 (index!4898 (_ BitVec 32))) (Found!682 (index!4899 (_ BitVec 32))) (Intermediate!682 (undefined!1494 Bool) (index!4900 (_ BitVec 32)) (x!20678 (_ BitVec 32))) (Undefined!682) (MissingVacant!682 (index!4901 (_ BitVec 32))) )
))
(declare-fun lt!96691 () SeekEntryResult!682)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193995 (= res!91690 (inRange!0 (index!4899 lt!96691) (mask!9222 thiss!1248)))))

(declare-fun e!127627 () Bool)

(assert (=> b!193995 (=> (not res!91690) (not e!127627))))

(assert (=> b!193995 e!127627))

(declare-fun b!193996 () Bool)

(declare-fun Unit!5860 () Unit!5858)

(assert (=> b!193996 (= e!127632 Unit!5860)))

(declare-fun lt!96698 () Unit!5858)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!182 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5858)

(assert (=> b!193996 (= lt!96698 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!182 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(assert (=> b!193996 false))

(declare-fun b!193997 () Bool)

(declare-fun e!127629 () Bool)

(declare-fun e!127624 () Bool)

(assert (=> b!193997 (= e!127629 e!127624)))

(declare-fun res!91687 () Bool)

(assert (=> b!193997 (=> (not res!91687) (not e!127624))))

(declare-datatypes ((tuple2!3500 0))(
  ( (tuple2!3501 (_1!1761 (_ BitVec 64)) (_2!1761 V!5633)) )
))
(declare-datatypes ((List!2408 0))(
  ( (Nil!2405) (Cons!2404 (h!3045 tuple2!3500) (t!7326 List!2408)) )
))
(declare-datatypes ((ListLongMap!2421 0))(
  ( (ListLongMap!2422 (toList!1226 List!2408)) )
))
(declare-fun lt!96696 () ListLongMap!2421)

(declare-fun contains!1363 (ListLongMap!2421 (_ BitVec 64)) Bool)

(assert (=> b!193997 (= res!91687 (contains!1363 lt!96696 key!828))))

(declare-fun lt!96692 () LongMapFixedSize!2710)

(declare-fun map!2018 (LongMapFixedSize!2710) ListLongMap!2421)

(assert (=> b!193997 (= lt!96696 (map!2018 lt!96692))))

(declare-fun mapNonEmpty!7766 () Bool)

(declare-fun tp!17021 () Bool)

(assert (=> mapNonEmpty!7766 (= mapRes!7766 (and tp!17021 e!127633))))

(declare-fun mapValue!7766 () ValueCell!1901)

(declare-fun mapRest!7766 () (Array (_ BitVec 32) ValueCell!1901))

(declare-fun mapKey!7766 () (_ BitVec 32))

(assert (=> mapNonEmpty!7766 (= (arr!3867 (_values!3942 thiss!1248)) (store mapRest!7766 mapKey!7766 mapValue!7766))))

(declare-fun lt!96690 () tuple2!3500)

(declare-fun b!193998 () Bool)

(declare-fun +!319 (ListLongMap!2421 tuple2!3500) ListLongMap!2421)

(assert (=> b!193998 (= e!127624 (= lt!96696 (+!319 (map!2018 thiss!1248) lt!96690)))))

(declare-fun b!193999 () Bool)

(declare-fun res!91685 () Bool)

(assert (=> b!193999 (=> (not res!91685) (not e!127628))))

(assert (=> b!193999 (= res!91685 (not (= key!828 (bvneg key!828))))))

(declare-fun b!194000 () Bool)

(declare-fun e!127626 () Bool)

(assert (=> b!194000 (= e!127626 (not e!127629))))

(declare-fun res!91688 () Bool)

(assert (=> b!194000 (=> (not res!91688) (not e!127629))))

(assert (=> b!194000 (= res!91688 (valid!1132 lt!96692))))

(declare-fun lt!96701 () ListLongMap!2421)

(assert (=> b!194000 (contains!1363 lt!96701 (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))

(declare-fun lt!96689 () array!8217)

(declare-fun lt!96694 () Unit!5858)

(declare-fun lemmaValidKeyInArrayIsInListMap!143 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) Unit!5858)

(assert (=> b!194000 (= lt!96694 (lemmaValidKeyInArrayIsInListMap!143 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4899 lt!96691) (defaultEntry!3959 thiss!1248)))))

(assert (=> b!194000 (= lt!96692 (LongMapFixedSize!2711 (defaultEntry!3959 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (_size!1404 thiss!1248) (_keys!5953 thiss!1248) lt!96689 (_vacant!1404 thiss!1248)))))

(declare-fun lt!96697 () ListLongMap!2421)

(assert (=> b!194000 (= lt!96697 lt!96701)))

(declare-fun getCurrentListMap!878 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) ListLongMap!2421)

(assert (=> b!194000 (= lt!96701 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96700 () ListLongMap!2421)

(assert (=> b!194000 (= lt!96697 (+!319 lt!96700 lt!96690))))

(declare-fun v!309 () V!5633)

(assert (=> b!194000 (= lt!96689 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))))))

(assert (=> b!194000 (= lt!96690 (tuple2!3501 key!828 v!309))))

(declare-fun lt!96695 () Unit!5858)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) (_ BitVec 64) V!5633 Int) Unit!5858)

(assert (=> b!194000 (= lt!96695 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4899 lt!96691) key!828 v!309 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96693 () Unit!5858)

(assert (=> b!194000 (= lt!96693 e!127632)))

(declare-fun c!34992 () Bool)

(assert (=> b!194000 (= c!34992 (contains!1363 lt!96700 key!828))))

(assert (=> b!194000 (= lt!96700 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun array_inv!2497 (array!8215) Bool)

(declare-fun array_inv!2498 (array!8217) Bool)

(assert (=> b!194001 (= e!127631 (and tp!17020 tp_is_empty!4489 (array_inv!2497 (_keys!5953 thiss!1248)) (array_inv!2498 (_values!3942 thiss!1248)) e!127625))))

(declare-fun b!194002 () Bool)

(assert (=> b!194002 (= e!127627 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)) key!828))))

(declare-fun mapIsEmpty!7766 () Bool)

(assert (=> mapIsEmpty!7766 mapRes!7766))

(declare-fun b!194003 () Bool)

(assert (=> b!194003 (= e!127630 tp_is_empty!4489)))

(declare-fun b!194004 () Bool)

(assert (=> b!194004 (= e!127628 e!127626)))

(declare-fun res!91686 () Bool)

(assert (=> b!194004 (=> (not res!91686) (not e!127626))))

(get-info :version)

(assert (=> b!194004 (= res!91686 (and (not ((_ is Undefined!682) lt!96691)) (not ((_ is MissingVacant!682) lt!96691)) (not ((_ is MissingZero!682) lt!96691)) ((_ is Found!682) lt!96691)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8215 (_ BitVec 32)) SeekEntryResult!682)

(assert (=> b!194004 (= lt!96691 (seekEntryOrOpen!0 key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(assert (= (and start!19800 res!91689) b!193999))

(assert (= (and b!193999 res!91685) b!194004))

(assert (= (and b!194004 res!91686) b!194000))

(assert (= (and b!194000 c!34992) b!193995))

(assert (= (and b!194000 (not c!34992)) b!193996))

(assert (= (and b!193995 res!91690) b!194002))

(assert (= (and b!194000 res!91688) b!193997))

(assert (= (and b!193997 res!91687) b!193998))

(assert (= (and b!193993 condMapEmpty!7766) mapIsEmpty!7766))

(assert (= (and b!193993 (not condMapEmpty!7766)) mapNonEmpty!7766))

(assert (= (and mapNonEmpty!7766 ((_ is ValueCellFull!1901) mapValue!7766)) b!193994))

(assert (= (and b!193993 ((_ is ValueCellFull!1901) mapDefault!7766)) b!194003))

(assert (= b!194001 b!193993))

(assert (= start!19800 b!194001))

(declare-fun m!220867 () Bool)

(assert (=> b!193995 m!220867))

(declare-fun m!220869 () Bool)

(assert (=> b!193995 m!220869))

(declare-fun m!220871 () Bool)

(assert (=> b!194002 m!220871))

(declare-fun m!220873 () Bool)

(assert (=> b!193996 m!220873))

(declare-fun m!220875 () Bool)

(assert (=> mapNonEmpty!7766 m!220875))

(declare-fun m!220877 () Bool)

(assert (=> start!19800 m!220877))

(declare-fun m!220879 () Bool)

(assert (=> b!193997 m!220879))

(declare-fun m!220881 () Bool)

(assert (=> b!193997 m!220881))

(declare-fun m!220883 () Bool)

(assert (=> b!194001 m!220883))

(declare-fun m!220885 () Bool)

(assert (=> b!194001 m!220885))

(declare-fun m!220887 () Bool)

(assert (=> b!194000 m!220887))

(declare-fun m!220889 () Bool)

(assert (=> b!194000 m!220889))

(declare-fun m!220891 () Bool)

(assert (=> b!194000 m!220891))

(declare-fun m!220893 () Bool)

(assert (=> b!194000 m!220893))

(declare-fun m!220895 () Bool)

(assert (=> b!194000 m!220895))

(declare-fun m!220897 () Bool)

(assert (=> b!194000 m!220897))

(assert (=> b!194000 m!220871))

(declare-fun m!220899 () Bool)

(assert (=> b!194000 m!220899))

(declare-fun m!220901 () Bool)

(assert (=> b!194000 m!220901))

(declare-fun m!220903 () Bool)

(assert (=> b!194000 m!220903))

(assert (=> b!194000 m!220871))

(declare-fun m!220905 () Bool)

(assert (=> b!193998 m!220905))

(assert (=> b!193998 m!220905))

(declare-fun m!220907 () Bool)

(assert (=> b!193998 m!220907))

(declare-fun m!220909 () Bool)

(assert (=> b!194004 m!220909))

(check-sat (not b!193997) (not mapNonEmpty!7766) (not b!193996) (not start!19800) (not b!193998) (not b!194001) (not b!194000) (not b!194004) b_and!11445 (not b_next!4717) (not b!193995) tp_is_empty!4489)
(check-sat b_and!11445 (not b_next!4717))
(get-model)

(declare-fun d!56713 () Bool)

(assert (=> d!56713 (= (array_inv!2497 (_keys!5953 thiss!1248)) (bvsge (size!4190 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194001 d!56713))

(declare-fun d!56715 () Bool)

(assert (=> d!56715 (= (array_inv!2498 (_values!3942 thiss!1248)) (bvsge (size!4191 (_values!3942 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194001 d!56715))

(declare-fun d!56717 () Bool)

(declare-fun e!127705 () Bool)

(assert (=> d!56717 e!127705))

(declare-fun res!91729 () Bool)

(assert (=> d!56717 (=> res!91729 e!127705)))

(declare-fun lt!96789 () Bool)

(assert (=> d!56717 (= res!91729 (not lt!96789))))

(declare-fun lt!96791 () Bool)

(assert (=> d!56717 (= lt!96789 lt!96791)))

(declare-fun lt!96788 () Unit!5858)

(declare-fun e!127704 () Unit!5858)

(assert (=> d!56717 (= lt!96788 e!127704)))

(declare-fun c!35001 () Bool)

(assert (=> d!56717 (= c!35001 lt!96791)))

(declare-fun containsKey!249 (List!2408 (_ BitVec 64)) Bool)

(assert (=> d!56717 (= lt!96791 (containsKey!249 (toList!1226 lt!96696) key!828))))

(assert (=> d!56717 (= (contains!1363 lt!96696 key!828) lt!96789)))

(declare-fun b!194083 () Bool)

(declare-fun lt!96790 () Unit!5858)

(assert (=> b!194083 (= e!127704 lt!96790)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!197 (List!2408 (_ BitVec 64)) Unit!5858)

(assert (=> b!194083 (= lt!96790 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96696) key!828))))

(declare-datatypes ((Option!252 0))(
  ( (Some!251 (v!4257 V!5633)) (None!250) )
))
(declare-fun isDefined!198 (Option!252) Bool)

(declare-fun getValueByKey!246 (List!2408 (_ BitVec 64)) Option!252)

(assert (=> b!194083 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96696) key!828))))

(declare-fun b!194084 () Bool)

(declare-fun Unit!5864 () Unit!5858)

(assert (=> b!194084 (= e!127704 Unit!5864)))

(declare-fun b!194085 () Bool)

(assert (=> b!194085 (= e!127705 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96696) key!828)))))

(assert (= (and d!56717 c!35001) b!194083))

(assert (= (and d!56717 (not c!35001)) b!194084))

(assert (= (and d!56717 (not res!91729)) b!194085))

(declare-fun m!220999 () Bool)

(assert (=> d!56717 m!220999))

(declare-fun m!221001 () Bool)

(assert (=> b!194083 m!221001))

(declare-fun m!221003 () Bool)

(assert (=> b!194083 m!221003))

(assert (=> b!194083 m!221003))

(declare-fun m!221005 () Bool)

(assert (=> b!194083 m!221005))

(assert (=> b!194085 m!221003))

(assert (=> b!194085 m!221003))

(assert (=> b!194085 m!221005))

(assert (=> b!193997 d!56717))

(declare-fun d!56719 () Bool)

(assert (=> d!56719 (= (map!2018 lt!96692) (getCurrentListMap!878 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96692)))))

(declare-fun bs!7745 () Bool)

(assert (= bs!7745 d!56719))

(declare-fun m!221007 () Bool)

(assert (=> bs!7745 m!221007))

(assert (=> b!193997 d!56719))

(declare-fun d!56721 () Bool)

(declare-fun e!127708 () Bool)

(assert (=> d!56721 e!127708))

(declare-fun res!91735 () Bool)

(assert (=> d!56721 (=> (not res!91735) (not e!127708))))

(declare-fun lt!96796 () SeekEntryResult!682)

(assert (=> d!56721 (= res!91735 ((_ is Found!682) lt!96796))))

(assert (=> d!56721 (= lt!96796 (seekEntryOrOpen!0 key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun lt!96797 () Unit!5858)

(declare-fun choose!1070 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5858)

(assert (=> d!56721 (= lt!96797 (choose!1070 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!56721 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56721 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)) lt!96797)))

(declare-fun b!194090 () Bool)

(declare-fun res!91734 () Bool)

(assert (=> b!194090 (=> (not res!91734) (not e!127708))))

(assert (=> b!194090 (= res!91734 (inRange!0 (index!4899 lt!96796) (mask!9222 thiss!1248)))))

(declare-fun b!194091 () Bool)

(assert (=> b!194091 (= e!127708 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96796)) key!828))))

(assert (=> b!194091 (and (bvsge (index!4899 lt!96796) #b00000000000000000000000000000000) (bvslt (index!4899 lt!96796) (size!4190 (_keys!5953 thiss!1248))))))

(assert (= (and d!56721 res!91735) b!194090))

(assert (= (and b!194090 res!91734) b!194091))

(assert (=> d!56721 m!220909))

(declare-fun m!221009 () Bool)

(assert (=> d!56721 m!221009))

(declare-fun m!221011 () Bool)

(assert (=> d!56721 m!221011))

(declare-fun m!221013 () Bool)

(assert (=> b!194090 m!221013))

(declare-fun m!221015 () Bool)

(assert (=> b!194091 m!221015))

(assert (=> b!193995 d!56721))

(declare-fun d!56723 () Bool)

(assert (=> d!56723 (= (inRange!0 (index!4899 lt!96691) (mask!9222 thiss!1248)) (and (bvsge (index!4899 lt!96691) #b00000000000000000000000000000000) (bvslt (index!4899 lt!96691) (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193995 d!56723))

(declare-fun b!194104 () Bool)

(declare-fun e!127716 () SeekEntryResult!682)

(declare-fun lt!96805 () SeekEntryResult!682)

(assert (=> b!194104 (= e!127716 (Found!682 (index!4900 lt!96805)))))

(declare-fun b!194105 () Bool)

(declare-fun e!127715 () SeekEntryResult!682)

(assert (=> b!194105 (= e!127715 Undefined!682)))

(declare-fun b!194106 () Bool)

(declare-fun c!35009 () Bool)

(declare-fun lt!96804 () (_ BitVec 64))

(assert (=> b!194106 (= c!35009 (= lt!96804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127717 () SeekEntryResult!682)

(assert (=> b!194106 (= e!127716 e!127717)))

(declare-fun b!194107 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8215 (_ BitVec 32)) SeekEntryResult!682)

(assert (=> b!194107 (= e!127717 (seekKeyOrZeroReturnVacant!0 (x!20678 lt!96805) (index!4900 lt!96805) (index!4900 lt!96805) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun d!56725 () Bool)

(declare-fun lt!96806 () SeekEntryResult!682)

(assert (=> d!56725 (and (or ((_ is Undefined!682) lt!96806) (not ((_ is Found!682) lt!96806)) (and (bvsge (index!4899 lt!96806) #b00000000000000000000000000000000) (bvslt (index!4899 lt!96806) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!96806) ((_ is Found!682) lt!96806) (not ((_ is MissingZero!682) lt!96806)) (and (bvsge (index!4898 lt!96806) #b00000000000000000000000000000000) (bvslt (index!4898 lt!96806) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!96806) ((_ is Found!682) lt!96806) ((_ is MissingZero!682) lt!96806) (not ((_ is MissingVacant!682) lt!96806)) (and (bvsge (index!4901 lt!96806) #b00000000000000000000000000000000) (bvslt (index!4901 lt!96806) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!96806) (ite ((_ is Found!682) lt!96806) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96806)) key!828) (ite ((_ is MissingZero!682) lt!96806) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4898 lt!96806)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!682) lt!96806) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4901 lt!96806)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56725 (= lt!96806 e!127715)))

(declare-fun c!35010 () Bool)

(assert (=> d!56725 (= c!35010 (and ((_ is Intermediate!682) lt!96805) (undefined!1494 lt!96805)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8215 (_ BitVec 32)) SeekEntryResult!682)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56725 (= lt!96805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9222 thiss!1248)) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(assert (=> d!56725 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56725 (= (seekEntryOrOpen!0 key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) lt!96806)))

(declare-fun b!194108 () Bool)

(assert (=> b!194108 (= e!127717 (MissingZero!682 (index!4900 lt!96805)))))

(declare-fun b!194109 () Bool)

(assert (=> b!194109 (= e!127715 e!127716)))

(assert (=> b!194109 (= lt!96804 (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!96805)))))

(declare-fun c!35008 () Bool)

(assert (=> b!194109 (= c!35008 (= lt!96804 key!828))))

(assert (= (and d!56725 c!35010) b!194105))

(assert (= (and d!56725 (not c!35010)) b!194109))

(assert (= (and b!194109 c!35008) b!194104))

(assert (= (and b!194109 (not c!35008)) b!194106))

(assert (= (and b!194106 c!35009) b!194108))

(assert (= (and b!194106 (not c!35009)) b!194107))

(declare-fun m!221017 () Bool)

(assert (=> b!194107 m!221017))

(declare-fun m!221019 () Bool)

(assert (=> d!56725 m!221019))

(declare-fun m!221021 () Bool)

(assert (=> d!56725 m!221021))

(declare-fun m!221023 () Bool)

(assert (=> d!56725 m!221023))

(declare-fun m!221025 () Bool)

(assert (=> d!56725 m!221025))

(declare-fun m!221027 () Bool)

(assert (=> d!56725 m!221027))

(assert (=> d!56725 m!221011))

(assert (=> d!56725 m!221023))

(declare-fun m!221029 () Bool)

(assert (=> b!194109 m!221029))

(assert (=> b!194004 d!56725))

(declare-fun d!56727 () Bool)

(declare-fun e!127719 () Bool)

(assert (=> d!56727 e!127719))

(declare-fun res!91736 () Bool)

(assert (=> d!56727 (=> res!91736 e!127719)))

(declare-fun lt!96808 () Bool)

(assert (=> d!56727 (= res!91736 (not lt!96808))))

(declare-fun lt!96810 () Bool)

(assert (=> d!56727 (= lt!96808 lt!96810)))

(declare-fun lt!96807 () Unit!5858)

(declare-fun e!127718 () Unit!5858)

(assert (=> d!56727 (= lt!96807 e!127718)))

(declare-fun c!35011 () Bool)

(assert (=> d!56727 (= c!35011 lt!96810)))

(assert (=> d!56727 (= lt!96810 (containsKey!249 (toList!1226 lt!96700) key!828))))

(assert (=> d!56727 (= (contains!1363 lt!96700 key!828) lt!96808)))

(declare-fun b!194110 () Bool)

(declare-fun lt!96809 () Unit!5858)

(assert (=> b!194110 (= e!127718 lt!96809)))

(assert (=> b!194110 (= lt!96809 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96700) key!828))))

(assert (=> b!194110 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96700) key!828))))

(declare-fun b!194111 () Bool)

(declare-fun Unit!5865 () Unit!5858)

(assert (=> b!194111 (= e!127718 Unit!5865)))

(declare-fun b!194112 () Bool)

(assert (=> b!194112 (= e!127719 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96700) key!828)))))

(assert (= (and d!56727 c!35011) b!194110))

(assert (= (and d!56727 (not c!35011)) b!194111))

(assert (= (and d!56727 (not res!91736)) b!194112))

(declare-fun m!221031 () Bool)

(assert (=> d!56727 m!221031))

(declare-fun m!221033 () Bool)

(assert (=> b!194110 m!221033))

(declare-fun m!221035 () Bool)

(assert (=> b!194110 m!221035))

(assert (=> b!194110 m!221035))

(declare-fun m!221037 () Bool)

(assert (=> b!194110 m!221037))

(assert (=> b!194112 m!221035))

(assert (=> b!194112 m!221035))

(assert (=> b!194112 m!221037))

(assert (=> b!194000 d!56727))

(declare-fun bm!19609 () Bool)

(declare-fun call!19617 () ListLongMap!2421)

(declare-fun getCurrentListMapNoExtraKeys!219 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) ListLongMap!2421)

(assert (=> bm!19609 (= call!19617 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194155 () Bool)

(declare-fun e!127755 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!194155 (= e!127755 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19610 () Bool)

(declare-fun call!19612 () Bool)

(declare-fun lt!96864 () ListLongMap!2421)

(assert (=> bm!19610 (= call!19612 (contains!1363 lt!96864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194156 () Bool)

(declare-fun e!127751 () Bool)

(assert (=> b!194156 (= e!127751 (not call!19612))))

(declare-fun b!194157 () Bool)

(declare-fun e!127756 () Bool)

(declare-fun apply!188 (ListLongMap!2421 (_ BitVec 64)) V!5633)

(declare-fun get!2243 (ValueCell!1901 V!5633) V!5633)

(declare-fun dynLambda!531 (Int (_ BitVec 64)) V!5633)

(assert (=> b!194157 (= e!127756 (= (apply!188 lt!96864 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4191 (_values!3942 thiss!1248))))))

(assert (=> b!194157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun bm!19611 () Bool)

(declare-fun call!19615 () Bool)

(assert (=> bm!19611 (= call!19615 (contains!1363 lt!96864 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194158 () Bool)

(declare-fun res!91755 () Bool)

(declare-fun e!127747 () Bool)

(assert (=> b!194158 (=> (not res!91755) (not e!127747))))

(declare-fun e!127758 () Bool)

(assert (=> b!194158 (= res!91755 e!127758)))

(declare-fun res!91763 () Bool)

(assert (=> b!194158 (=> res!91763 e!127758)))

(declare-fun e!127754 () Bool)

(assert (=> b!194158 (= res!91763 (not e!127754))))

(declare-fun res!91758 () Bool)

(assert (=> b!194158 (=> (not res!91758) (not e!127754))))

(assert (=> b!194158 (= res!91758 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun d!56729 () Bool)

(assert (=> d!56729 e!127747))

(declare-fun res!91761 () Bool)

(assert (=> d!56729 (=> (not res!91761) (not e!127747))))

(assert (=> d!56729 (= res!91761 (or (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))))

(declare-fun lt!96855 () ListLongMap!2421)

(assert (=> d!56729 (= lt!96864 lt!96855)))

(declare-fun lt!96867 () Unit!5858)

(declare-fun e!127750 () Unit!5858)

(assert (=> d!56729 (= lt!96867 e!127750)))

(declare-fun c!35025 () Bool)

(assert (=> d!56729 (= c!35025 e!127755)))

(declare-fun res!91760 () Bool)

(assert (=> d!56729 (=> (not res!91760) (not e!127755))))

(assert (=> d!56729 (= res!91760 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun e!127748 () ListLongMap!2421)

(assert (=> d!56729 (= lt!96855 e!127748)))

(declare-fun c!35029 () Bool)

(assert (=> d!56729 (= c!35029 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56729 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56729 (= (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!96864)))

(declare-fun b!194159 () Bool)

(declare-fun e!127749 () Bool)

(assert (=> b!194159 (= e!127747 e!127749)))

(declare-fun c!35027 () Bool)

(assert (=> b!194159 (= c!35027 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194160 () Bool)

(declare-fun e!127757 () Bool)

(assert (=> b!194160 (= e!127749 e!127757)))

(declare-fun res!91757 () Bool)

(assert (=> b!194160 (= res!91757 call!19615)))

(assert (=> b!194160 (=> (not res!91757) (not e!127757))))

(declare-fun bm!19612 () Bool)

(declare-fun call!19614 () ListLongMap!2421)

(assert (=> bm!19612 (= call!19614 call!19617)))

(declare-fun b!194161 () Bool)

(declare-fun res!91759 () Bool)

(assert (=> b!194161 (=> (not res!91759) (not e!127747))))

(assert (=> b!194161 (= res!91759 e!127751)))

(declare-fun c!35024 () Bool)

(assert (=> b!194161 (= c!35024 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19613 () Bool)

(declare-fun call!19616 () ListLongMap!2421)

(declare-fun call!19613 () ListLongMap!2421)

(assert (=> bm!19613 (= call!19616 call!19613)))

(declare-fun b!194162 () Bool)

(declare-fun e!127753 () Bool)

(assert (=> b!194162 (= e!127751 e!127753)))

(declare-fun res!91762 () Bool)

(assert (=> b!194162 (= res!91762 call!19612)))

(assert (=> b!194162 (=> (not res!91762) (not e!127753))))

(declare-fun b!194163 () Bool)

(declare-fun Unit!5866 () Unit!5858)

(assert (=> b!194163 (= e!127750 Unit!5866)))

(declare-fun b!194164 () Bool)

(declare-fun lt!96860 () Unit!5858)

(assert (=> b!194164 (= e!127750 lt!96860)))

(declare-fun lt!96873 () ListLongMap!2421)

(assert (=> b!194164 (= lt!96873 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96858 () (_ BitVec 64))

(assert (=> b!194164 (= lt!96858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96871 () (_ BitVec 64))

(assert (=> b!194164 (= lt!96871 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96863 () Unit!5858)

(declare-fun addStillContains!164 (ListLongMap!2421 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5858)

(assert (=> b!194164 (= lt!96863 (addStillContains!164 lt!96873 lt!96858 (zeroValue!3800 thiss!1248) lt!96871))))

(assert (=> b!194164 (contains!1363 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) lt!96871)))

(declare-fun lt!96859 () Unit!5858)

(assert (=> b!194164 (= lt!96859 lt!96863)))

(declare-fun lt!96876 () ListLongMap!2421)

(assert (=> b!194164 (= lt!96876 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96868 () (_ BitVec 64))

(assert (=> b!194164 (= lt!96868 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96870 () (_ BitVec 64))

(assert (=> b!194164 (= lt!96870 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96862 () Unit!5858)

(declare-fun addApplyDifferent!164 (ListLongMap!2421 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5858)

(assert (=> b!194164 (= lt!96862 (addApplyDifferent!164 lt!96876 lt!96868 (minValue!3800 thiss!1248) lt!96870))))

(assert (=> b!194164 (= (apply!188 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) lt!96870) (apply!188 lt!96876 lt!96870))))

(declare-fun lt!96857 () Unit!5858)

(assert (=> b!194164 (= lt!96857 lt!96862)))

(declare-fun lt!96875 () ListLongMap!2421)

(assert (=> b!194164 (= lt!96875 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96866 () (_ BitVec 64))

(assert (=> b!194164 (= lt!96866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96872 () (_ BitVec 64))

(assert (=> b!194164 (= lt!96872 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96861 () Unit!5858)

(assert (=> b!194164 (= lt!96861 (addApplyDifferent!164 lt!96875 lt!96866 (zeroValue!3800 thiss!1248) lt!96872))))

(assert (=> b!194164 (= (apply!188 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) lt!96872) (apply!188 lt!96875 lt!96872))))

(declare-fun lt!96874 () Unit!5858)

(assert (=> b!194164 (= lt!96874 lt!96861)))

(declare-fun lt!96869 () ListLongMap!2421)

(assert (=> b!194164 (= lt!96869 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96865 () (_ BitVec 64))

(assert (=> b!194164 (= lt!96865 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96856 () (_ BitVec 64))

(assert (=> b!194164 (= lt!96856 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194164 (= lt!96860 (addApplyDifferent!164 lt!96869 lt!96865 (minValue!3800 thiss!1248) lt!96856))))

(assert (=> b!194164 (= (apply!188 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) lt!96856) (apply!188 lt!96869 lt!96856))))

(declare-fun b!194165 () Bool)

(assert (=> b!194165 (= e!127758 e!127756)))

(declare-fun res!91756 () Bool)

(assert (=> b!194165 (=> (not res!91756) (not e!127756))))

(assert (=> b!194165 (= res!91756 (contains!1363 lt!96864 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194166 () Bool)

(assert (=> b!194166 (= e!127749 (not call!19615))))

(declare-fun b!194167 () Bool)

(declare-fun e!127752 () ListLongMap!2421)

(assert (=> b!194167 (= e!127748 e!127752)))

(declare-fun c!35028 () Bool)

(assert (=> b!194167 (= c!35028 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194168 () Bool)

(assert (=> b!194168 (= e!127757 (= (apply!188 lt!96864 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3800 thiss!1248)))))

(declare-fun b!194169 () Bool)

(assert (=> b!194169 (= e!127753 (= (apply!188 lt!96864 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3800 thiss!1248)))))

(declare-fun b!194170 () Bool)

(assert (=> b!194170 (= e!127752 call!19616)))

(declare-fun b!194171 () Bool)

(declare-fun e!127746 () ListLongMap!2421)

(assert (=> b!194171 (= e!127746 call!19616)))

(declare-fun bm!19614 () Bool)

(declare-fun call!19618 () ListLongMap!2421)

(assert (=> bm!19614 (= call!19613 (+!319 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)) (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194172 () Bool)

(declare-fun c!35026 () Bool)

(assert (=> b!194172 (= c!35026 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!194172 (= e!127752 e!127746)))

(declare-fun b!194173 () Bool)

(assert (=> b!194173 (= e!127748 (+!319 call!19613 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!194174 () Bool)

(assert (=> b!194174 (= e!127746 call!19618)))

(declare-fun b!194175 () Bool)

(assert (=> b!194175 (= e!127754 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19615 () Bool)

(assert (=> bm!19615 (= call!19618 call!19614)))

(assert (= (and d!56729 c!35029) b!194173))

(assert (= (and d!56729 (not c!35029)) b!194167))

(assert (= (and b!194167 c!35028) b!194170))

(assert (= (and b!194167 (not c!35028)) b!194172))

(assert (= (and b!194172 c!35026) b!194171))

(assert (= (and b!194172 (not c!35026)) b!194174))

(assert (= (or b!194171 b!194174) bm!19615))

(assert (= (or b!194170 bm!19615) bm!19612))

(assert (= (or b!194170 b!194171) bm!19613))

(assert (= (or b!194173 bm!19612) bm!19609))

(assert (= (or b!194173 bm!19613) bm!19614))

(assert (= (and d!56729 res!91760) b!194155))

(assert (= (and d!56729 c!35025) b!194164))

(assert (= (and d!56729 (not c!35025)) b!194163))

(assert (= (and d!56729 res!91761) b!194158))

(assert (= (and b!194158 res!91758) b!194175))

(assert (= (and b!194158 (not res!91763)) b!194165))

(assert (= (and b!194165 res!91756) b!194157))

(assert (= (and b!194158 res!91755) b!194161))

(assert (= (and b!194161 c!35024) b!194162))

(assert (= (and b!194161 (not c!35024)) b!194156))

(assert (= (and b!194162 res!91762) b!194169))

(assert (= (or b!194162 b!194156) bm!19610))

(assert (= (and b!194161 res!91759) b!194159))

(assert (= (and b!194159 c!35027) b!194160))

(assert (= (and b!194159 (not c!35027)) b!194166))

(assert (= (and b!194160 res!91757) b!194168))

(assert (= (or b!194160 b!194166) bm!19611))

(declare-fun b_lambda!7501 () Bool)

(assert (=> (not b_lambda!7501) (not b!194157)))

(declare-fun t!7329 () Bool)

(declare-fun tb!2879 () Bool)

(assert (=> (and b!194001 (= (defaultEntry!3959 thiss!1248) (defaultEntry!3959 thiss!1248)) t!7329) tb!2879))

(declare-fun result!4931 () Bool)

(assert (=> tb!2879 (= result!4931 tp_is_empty!4489)))

(assert (=> b!194157 t!7329))

(declare-fun b_and!11451 () Bool)

(assert (= b_and!11445 (and (=> t!7329 result!4931) b_and!11451)))

(declare-fun m!221039 () Bool)

(assert (=> bm!19610 m!221039))

(declare-fun m!221041 () Bool)

(assert (=> b!194165 m!221041))

(assert (=> b!194165 m!221041))

(declare-fun m!221043 () Bool)

(assert (=> b!194165 m!221043))

(declare-fun m!221045 () Bool)

(assert (=> bm!19611 m!221045))

(declare-fun m!221047 () Bool)

(assert (=> bm!19609 m!221047))

(assert (=> d!56729 m!221011))

(assert (=> b!194175 m!221041))

(assert (=> b!194175 m!221041))

(declare-fun m!221049 () Bool)

(assert (=> b!194175 m!221049))

(declare-fun m!221051 () Bool)

(assert (=> b!194173 m!221051))

(declare-fun m!221053 () Bool)

(assert (=> bm!19614 m!221053))

(assert (=> b!194155 m!221041))

(assert (=> b!194155 m!221041))

(assert (=> b!194155 m!221049))

(declare-fun m!221055 () Bool)

(assert (=> b!194157 m!221055))

(assert (=> b!194157 m!221055))

(declare-fun m!221057 () Bool)

(assert (=> b!194157 m!221057))

(declare-fun m!221059 () Bool)

(assert (=> b!194157 m!221059))

(assert (=> b!194157 m!221057))

(assert (=> b!194157 m!221041))

(assert (=> b!194157 m!221041))

(declare-fun m!221061 () Bool)

(assert (=> b!194157 m!221061))

(declare-fun m!221063 () Bool)

(assert (=> b!194169 m!221063))

(declare-fun m!221065 () Bool)

(assert (=> b!194164 m!221065))

(declare-fun m!221067 () Bool)

(assert (=> b!194164 m!221067))

(assert (=> b!194164 m!221067))

(declare-fun m!221069 () Bool)

(assert (=> b!194164 m!221069))

(declare-fun m!221071 () Bool)

(assert (=> b!194164 m!221071))

(declare-fun m!221073 () Bool)

(assert (=> b!194164 m!221073))

(declare-fun m!221075 () Bool)

(assert (=> b!194164 m!221075))

(declare-fun m!221077 () Bool)

(assert (=> b!194164 m!221077))

(assert (=> b!194164 m!221071))

(declare-fun m!221079 () Bool)

(assert (=> b!194164 m!221079))

(declare-fun m!221081 () Bool)

(assert (=> b!194164 m!221081))

(declare-fun m!221083 () Bool)

(assert (=> b!194164 m!221083))

(declare-fun m!221085 () Bool)

(assert (=> b!194164 m!221085))

(declare-fun m!221087 () Bool)

(assert (=> b!194164 m!221087))

(assert (=> b!194164 m!221041))

(assert (=> b!194164 m!221047))

(declare-fun m!221089 () Bool)

(assert (=> b!194164 m!221089))

(declare-fun m!221091 () Bool)

(assert (=> b!194164 m!221091))

(assert (=> b!194164 m!221085))

(declare-fun m!221093 () Bool)

(assert (=> b!194164 m!221093))

(assert (=> b!194164 m!221081))

(declare-fun m!221095 () Bool)

(assert (=> b!194168 m!221095))

(assert (=> b!194000 d!56729))

(declare-fun d!56731 () Bool)

(declare-fun e!127761 () Bool)

(assert (=> d!56731 e!127761))

(declare-fun res!91769 () Bool)

(assert (=> d!56731 (=> (not res!91769) (not e!127761))))

(declare-fun lt!96885 () ListLongMap!2421)

(assert (=> d!56731 (= res!91769 (contains!1363 lt!96885 (_1!1761 lt!96690)))))

(declare-fun lt!96887 () List!2408)

(assert (=> d!56731 (= lt!96885 (ListLongMap!2422 lt!96887))))

(declare-fun lt!96888 () Unit!5858)

(declare-fun lt!96886 () Unit!5858)

(assert (=> d!56731 (= lt!96888 lt!96886)))

(assert (=> d!56731 (= (getValueByKey!246 lt!96887 (_1!1761 lt!96690)) (Some!251 (_2!1761 lt!96690)))))

(declare-fun lemmaContainsTupThenGetReturnValue!133 (List!2408 (_ BitVec 64) V!5633) Unit!5858)

(assert (=> d!56731 (= lt!96886 (lemmaContainsTupThenGetReturnValue!133 lt!96887 (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(declare-fun insertStrictlySorted!136 (List!2408 (_ BitVec 64) V!5633) List!2408)

(assert (=> d!56731 (= lt!96887 (insertStrictlySorted!136 (toList!1226 lt!96700) (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(assert (=> d!56731 (= (+!319 lt!96700 lt!96690) lt!96885)))

(declare-fun b!194182 () Bool)

(declare-fun res!91768 () Bool)

(assert (=> b!194182 (=> (not res!91768) (not e!127761))))

(assert (=> b!194182 (= res!91768 (= (getValueByKey!246 (toList!1226 lt!96885) (_1!1761 lt!96690)) (Some!251 (_2!1761 lt!96690))))))

(declare-fun b!194183 () Bool)

(declare-fun contains!1365 (List!2408 tuple2!3500) Bool)

(assert (=> b!194183 (= e!127761 (contains!1365 (toList!1226 lt!96885) lt!96690))))

(assert (= (and d!56731 res!91769) b!194182))

(assert (= (and b!194182 res!91768) b!194183))

(declare-fun m!221097 () Bool)

(assert (=> d!56731 m!221097))

(declare-fun m!221099 () Bool)

(assert (=> d!56731 m!221099))

(declare-fun m!221101 () Bool)

(assert (=> d!56731 m!221101))

(declare-fun m!221103 () Bool)

(assert (=> d!56731 m!221103))

(declare-fun m!221105 () Bool)

(assert (=> b!194182 m!221105))

(declare-fun m!221107 () Bool)

(assert (=> b!194183 m!221107))

(assert (=> b!194000 d!56731))

(declare-fun d!56733 () Bool)

(declare-fun e!127764 () Bool)

(assert (=> d!56733 e!127764))

(declare-fun res!91772 () Bool)

(assert (=> d!56733 (=> (not res!91772) (not e!127764))))

(assert (=> d!56733 (= res!91772 (and (bvsge (index!4899 lt!96691) #b00000000000000000000000000000000) (bvslt (index!4899 lt!96691) (size!4191 (_values!3942 thiss!1248)))))))

(declare-fun lt!96891 () Unit!5858)

(declare-fun choose!1071 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) (_ BitVec 64) V!5633 Int) Unit!5858)

(assert (=> d!56733 (= lt!96891 (choose!1071 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4899 lt!96691) key!828 v!309 (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56733 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56733 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4899 lt!96691) key!828 v!309 (defaultEntry!3959 thiss!1248)) lt!96891)))

(declare-fun b!194186 () Bool)

(assert (=> b!194186 (= e!127764 (= (+!319 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (tuple2!3501 key!828 v!309)) (getCurrentListMap!878 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))))

(assert (= (and d!56733 res!91772) b!194186))

(declare-fun m!221109 () Bool)

(assert (=> d!56733 m!221109))

(assert (=> d!56733 m!221011))

(assert (=> b!194186 m!220887))

(assert (=> b!194186 m!220887))

(declare-fun m!221111 () Bool)

(assert (=> b!194186 m!221111))

(assert (=> b!194186 m!220897))

(declare-fun m!221113 () Bool)

(assert (=> b!194186 m!221113))

(assert (=> b!194000 d!56733))

(declare-fun d!56735 () Bool)

(declare-fun e!127766 () Bool)

(assert (=> d!56735 e!127766))

(declare-fun res!91773 () Bool)

(assert (=> d!56735 (=> res!91773 e!127766)))

(declare-fun lt!96893 () Bool)

(assert (=> d!56735 (= res!91773 (not lt!96893))))

(declare-fun lt!96895 () Bool)

(assert (=> d!56735 (= lt!96893 lt!96895)))

(declare-fun lt!96892 () Unit!5858)

(declare-fun e!127765 () Unit!5858)

(assert (=> d!56735 (= lt!96892 e!127765)))

(declare-fun c!35030 () Bool)

(assert (=> d!56735 (= c!35030 lt!96895)))

(assert (=> d!56735 (= lt!96895 (containsKey!249 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (=> d!56735 (= (contains!1363 lt!96701 (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) lt!96893)))

(declare-fun b!194187 () Bool)

(declare-fun lt!96894 () Unit!5858)

(assert (=> b!194187 (= e!127765 lt!96894)))

(assert (=> b!194187 (= lt!96894 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (=> b!194187 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun b!194188 () Bool)

(declare-fun Unit!5867 () Unit!5858)

(assert (=> b!194188 (= e!127765 Unit!5867)))

(declare-fun b!194189 () Bool)

(assert (=> b!194189 (= e!127766 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(assert (= (and d!56735 c!35030) b!194187))

(assert (= (and d!56735 (not c!35030)) b!194188))

(assert (= (and d!56735 (not res!91773)) b!194189))

(assert (=> d!56735 m!220871))

(declare-fun m!221115 () Bool)

(assert (=> d!56735 m!221115))

(assert (=> b!194187 m!220871))

(declare-fun m!221117 () Bool)

(assert (=> b!194187 m!221117))

(assert (=> b!194187 m!220871))

(declare-fun m!221119 () Bool)

(assert (=> b!194187 m!221119))

(assert (=> b!194187 m!221119))

(declare-fun m!221121 () Bool)

(assert (=> b!194187 m!221121))

(assert (=> b!194189 m!220871))

(assert (=> b!194189 m!221119))

(assert (=> b!194189 m!221119))

(assert (=> b!194189 m!221121))

(assert (=> b!194000 d!56735))

(declare-fun d!56737 () Bool)

(declare-fun res!91780 () Bool)

(declare-fun e!127769 () Bool)

(assert (=> d!56737 (=> (not res!91780) (not e!127769))))

(declare-fun simpleValid!204 (LongMapFixedSize!2710) Bool)

(assert (=> d!56737 (= res!91780 (simpleValid!204 lt!96692))))

(assert (=> d!56737 (= (valid!1132 lt!96692) e!127769)))

(declare-fun b!194196 () Bool)

(declare-fun res!91781 () Bool)

(assert (=> b!194196 (=> (not res!91781) (not e!127769))))

(declare-fun arrayCountValidKeys!0 (array!8215 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!194196 (= res!91781 (= (arrayCountValidKeys!0 (_keys!5953 lt!96692) #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))) (_size!1404 lt!96692)))))

(declare-fun b!194197 () Bool)

(declare-fun res!91782 () Bool)

(assert (=> b!194197 (=> (not res!91782) (not e!127769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8215 (_ BitVec 32)) Bool)

(assert (=> b!194197 (= res!91782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5953 lt!96692) (mask!9222 lt!96692)))))

(declare-fun b!194198 () Bool)

(declare-datatypes ((List!2410 0))(
  ( (Nil!2407) (Cons!2406 (h!3047 (_ BitVec 64)) (t!7330 List!2410)) )
))
(declare-fun arrayNoDuplicates!0 (array!8215 (_ BitVec 32) List!2410) Bool)

(assert (=> b!194198 (= e!127769 (arrayNoDuplicates!0 (_keys!5953 lt!96692) #b00000000000000000000000000000000 Nil!2407))))

(assert (= (and d!56737 res!91780) b!194196))

(assert (= (and b!194196 res!91781) b!194197))

(assert (= (and b!194197 res!91782) b!194198))

(declare-fun m!221123 () Bool)

(assert (=> d!56737 m!221123))

(declare-fun m!221125 () Bool)

(assert (=> b!194196 m!221125))

(declare-fun m!221127 () Bool)

(assert (=> b!194197 m!221127))

(declare-fun m!221129 () Bool)

(assert (=> b!194198 m!221129))

(assert (=> b!194000 d!56737))

(declare-fun d!56739 () Bool)

(declare-fun e!127772 () Bool)

(assert (=> d!56739 e!127772))

(declare-fun res!91785 () Bool)

(assert (=> d!56739 (=> (not res!91785) (not e!127772))))

(assert (=> d!56739 (= res!91785 (and (bvsge (index!4899 lt!96691) #b00000000000000000000000000000000) (bvslt (index!4899 lt!96691) (size!4190 (_keys!5953 thiss!1248)))))))

(declare-fun lt!96898 () Unit!5858)

(declare-fun choose!1072 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) Unit!5858)

(assert (=> d!56739 (= lt!96898 (choose!1072 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4899 lt!96691) (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56739 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56739 (= (lemmaValidKeyInArrayIsInListMap!143 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4899 lt!96691) (defaultEntry!3959 thiss!1248)) lt!96898)))

(declare-fun b!194201 () Bool)

(assert (=> b!194201 (= e!127772 (contains!1363 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (= (and d!56739 res!91785) b!194201))

(declare-fun m!221131 () Bool)

(assert (=> d!56739 m!221131))

(assert (=> d!56739 m!221011))

(assert (=> b!194201 m!220901))

(assert (=> b!194201 m!220871))

(assert (=> b!194201 m!220901))

(assert (=> b!194201 m!220871))

(declare-fun m!221133 () Bool)

(assert (=> b!194201 m!221133))

(assert (=> b!194000 d!56739))

(declare-fun bm!19616 () Bool)

(declare-fun call!19624 () ListLongMap!2421)

(assert (=> bm!19616 (= call!19624 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194202 () Bool)

(declare-fun e!127782 () Bool)

(assert (=> b!194202 (= e!127782 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19617 () Bool)

(declare-fun call!19619 () Bool)

(declare-fun lt!96908 () ListLongMap!2421)

(assert (=> bm!19617 (= call!19619 (contains!1363 lt!96908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194203 () Bool)

(declare-fun e!127778 () Bool)

(assert (=> b!194203 (= e!127778 (not call!19619))))

(declare-fun b!194204 () Bool)

(declare-fun e!127783 () Bool)

(assert (=> b!194204 (= e!127783 (= (apply!188 lt!96908 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4191 lt!96689)))))

(assert (=> b!194204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun bm!19618 () Bool)

(declare-fun call!19622 () Bool)

(assert (=> bm!19618 (= call!19622 (contains!1363 lt!96908 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194205 () Bool)

(declare-fun res!91786 () Bool)

(declare-fun e!127774 () Bool)

(assert (=> b!194205 (=> (not res!91786) (not e!127774))))

(declare-fun e!127785 () Bool)

(assert (=> b!194205 (= res!91786 e!127785)))

(declare-fun res!91794 () Bool)

(assert (=> b!194205 (=> res!91794 e!127785)))

(declare-fun e!127781 () Bool)

(assert (=> b!194205 (= res!91794 (not e!127781))))

(declare-fun res!91789 () Bool)

(assert (=> b!194205 (=> (not res!91789) (not e!127781))))

(assert (=> b!194205 (= res!91789 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun d!56741 () Bool)

(assert (=> d!56741 e!127774))

(declare-fun res!91792 () Bool)

(assert (=> d!56741 (=> (not res!91792) (not e!127774))))

(assert (=> d!56741 (= res!91792 (or (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))))

(declare-fun lt!96899 () ListLongMap!2421)

(assert (=> d!56741 (= lt!96908 lt!96899)))

(declare-fun lt!96911 () Unit!5858)

(declare-fun e!127777 () Unit!5858)

(assert (=> d!56741 (= lt!96911 e!127777)))

(declare-fun c!35032 () Bool)

(assert (=> d!56741 (= c!35032 e!127782)))

(declare-fun res!91791 () Bool)

(assert (=> d!56741 (=> (not res!91791) (not e!127782))))

(assert (=> d!56741 (= res!91791 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun e!127775 () ListLongMap!2421)

(assert (=> d!56741 (= lt!96899 e!127775)))

(declare-fun c!35036 () Bool)

(assert (=> d!56741 (= c!35036 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56741 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56741 (= (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!96908)))

(declare-fun b!194206 () Bool)

(declare-fun e!127776 () Bool)

(assert (=> b!194206 (= e!127774 e!127776)))

(declare-fun c!35034 () Bool)

(assert (=> b!194206 (= c!35034 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194207 () Bool)

(declare-fun e!127784 () Bool)

(assert (=> b!194207 (= e!127776 e!127784)))

(declare-fun res!91788 () Bool)

(assert (=> b!194207 (= res!91788 call!19622)))

(assert (=> b!194207 (=> (not res!91788) (not e!127784))))

(declare-fun bm!19619 () Bool)

(declare-fun call!19621 () ListLongMap!2421)

(assert (=> bm!19619 (= call!19621 call!19624)))

(declare-fun b!194208 () Bool)

(declare-fun res!91790 () Bool)

(assert (=> b!194208 (=> (not res!91790) (not e!127774))))

(assert (=> b!194208 (= res!91790 e!127778)))

(declare-fun c!35031 () Bool)

(assert (=> b!194208 (= c!35031 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19620 () Bool)

(declare-fun call!19623 () ListLongMap!2421)

(declare-fun call!19620 () ListLongMap!2421)

(assert (=> bm!19620 (= call!19623 call!19620)))

(declare-fun b!194209 () Bool)

(declare-fun e!127780 () Bool)

(assert (=> b!194209 (= e!127778 e!127780)))

(declare-fun res!91793 () Bool)

(assert (=> b!194209 (= res!91793 call!19619)))

(assert (=> b!194209 (=> (not res!91793) (not e!127780))))

(declare-fun b!194210 () Bool)

(declare-fun Unit!5868 () Unit!5858)

(assert (=> b!194210 (= e!127777 Unit!5868)))

(declare-fun b!194211 () Bool)

(declare-fun lt!96904 () Unit!5858)

(assert (=> b!194211 (= e!127777 lt!96904)))

(declare-fun lt!96917 () ListLongMap!2421)

(assert (=> b!194211 (= lt!96917 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96902 () (_ BitVec 64))

(assert (=> b!194211 (= lt!96902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96915 () (_ BitVec 64))

(assert (=> b!194211 (= lt!96915 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96907 () Unit!5858)

(assert (=> b!194211 (= lt!96907 (addStillContains!164 lt!96917 lt!96902 (zeroValue!3800 thiss!1248) lt!96915))))

(assert (=> b!194211 (contains!1363 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) lt!96915)))

(declare-fun lt!96903 () Unit!5858)

(assert (=> b!194211 (= lt!96903 lt!96907)))

(declare-fun lt!96920 () ListLongMap!2421)

(assert (=> b!194211 (= lt!96920 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96912 () (_ BitVec 64))

(assert (=> b!194211 (= lt!96912 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96914 () (_ BitVec 64))

(assert (=> b!194211 (= lt!96914 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96906 () Unit!5858)

(assert (=> b!194211 (= lt!96906 (addApplyDifferent!164 lt!96920 lt!96912 (minValue!3800 thiss!1248) lt!96914))))

(assert (=> b!194211 (= (apply!188 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) lt!96914) (apply!188 lt!96920 lt!96914))))

(declare-fun lt!96901 () Unit!5858)

(assert (=> b!194211 (= lt!96901 lt!96906)))

(declare-fun lt!96919 () ListLongMap!2421)

(assert (=> b!194211 (= lt!96919 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96910 () (_ BitVec 64))

(assert (=> b!194211 (= lt!96910 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96916 () (_ BitVec 64))

(assert (=> b!194211 (= lt!96916 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96905 () Unit!5858)

(assert (=> b!194211 (= lt!96905 (addApplyDifferent!164 lt!96919 lt!96910 (zeroValue!3800 thiss!1248) lt!96916))))

(assert (=> b!194211 (= (apply!188 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) lt!96916) (apply!188 lt!96919 lt!96916))))

(declare-fun lt!96918 () Unit!5858)

(assert (=> b!194211 (= lt!96918 lt!96905)))

(declare-fun lt!96913 () ListLongMap!2421)

(assert (=> b!194211 (= lt!96913 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96909 () (_ BitVec 64))

(assert (=> b!194211 (= lt!96909 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96900 () (_ BitVec 64))

(assert (=> b!194211 (= lt!96900 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194211 (= lt!96904 (addApplyDifferent!164 lt!96913 lt!96909 (minValue!3800 thiss!1248) lt!96900))))

(assert (=> b!194211 (= (apply!188 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) lt!96900) (apply!188 lt!96913 lt!96900))))

(declare-fun b!194212 () Bool)

(assert (=> b!194212 (= e!127785 e!127783)))

(declare-fun res!91787 () Bool)

(assert (=> b!194212 (=> (not res!91787) (not e!127783))))

(assert (=> b!194212 (= res!91787 (contains!1363 lt!96908 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194213 () Bool)

(assert (=> b!194213 (= e!127776 (not call!19622))))

(declare-fun b!194214 () Bool)

(declare-fun e!127779 () ListLongMap!2421)

(assert (=> b!194214 (= e!127775 e!127779)))

(declare-fun c!35035 () Bool)

(assert (=> b!194214 (= c!35035 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194215 () Bool)

(assert (=> b!194215 (= e!127784 (= (apply!188 lt!96908 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3800 thiss!1248)))))

(declare-fun b!194216 () Bool)

(assert (=> b!194216 (= e!127780 (= (apply!188 lt!96908 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3800 thiss!1248)))))

(declare-fun b!194217 () Bool)

(assert (=> b!194217 (= e!127779 call!19623)))

(declare-fun b!194218 () Bool)

(declare-fun e!127773 () ListLongMap!2421)

(assert (=> b!194218 (= e!127773 call!19623)))

(declare-fun call!19625 () ListLongMap!2421)

(declare-fun bm!19621 () Bool)

(assert (=> bm!19621 (= call!19620 (+!319 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)) (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194219 () Bool)

(declare-fun c!35033 () Bool)

(assert (=> b!194219 (= c!35033 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!194219 (= e!127779 e!127773)))

(declare-fun b!194220 () Bool)

(assert (=> b!194220 (= e!127775 (+!319 call!19620 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!194221 () Bool)

(assert (=> b!194221 (= e!127773 call!19625)))

(declare-fun b!194222 () Bool)

(assert (=> b!194222 (= e!127781 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19622 () Bool)

(assert (=> bm!19622 (= call!19625 call!19621)))

(assert (= (and d!56741 c!35036) b!194220))

(assert (= (and d!56741 (not c!35036)) b!194214))

(assert (= (and b!194214 c!35035) b!194217))

(assert (= (and b!194214 (not c!35035)) b!194219))

(assert (= (and b!194219 c!35033) b!194218))

(assert (= (and b!194219 (not c!35033)) b!194221))

(assert (= (or b!194218 b!194221) bm!19622))

(assert (= (or b!194217 bm!19622) bm!19619))

(assert (= (or b!194217 b!194218) bm!19620))

(assert (= (or b!194220 bm!19619) bm!19616))

(assert (= (or b!194220 bm!19620) bm!19621))

(assert (= (and d!56741 res!91791) b!194202))

(assert (= (and d!56741 c!35032) b!194211))

(assert (= (and d!56741 (not c!35032)) b!194210))

(assert (= (and d!56741 res!91792) b!194205))

(assert (= (and b!194205 res!91789) b!194222))

(assert (= (and b!194205 (not res!91794)) b!194212))

(assert (= (and b!194212 res!91787) b!194204))

(assert (= (and b!194205 res!91786) b!194208))

(assert (= (and b!194208 c!35031) b!194209))

(assert (= (and b!194208 (not c!35031)) b!194203))

(assert (= (and b!194209 res!91793) b!194216))

(assert (= (or b!194209 b!194203) bm!19617))

(assert (= (and b!194208 res!91790) b!194206))

(assert (= (and b!194206 c!35034) b!194207))

(assert (= (and b!194206 (not c!35034)) b!194213))

(assert (= (and b!194207 res!91788) b!194215))

(assert (= (or b!194207 b!194213) bm!19618))

(declare-fun b_lambda!7503 () Bool)

(assert (=> (not b_lambda!7503) (not b!194204)))

(assert (=> b!194204 t!7329))

(declare-fun b_and!11453 () Bool)

(assert (= b_and!11451 (and (=> t!7329 result!4931) b_and!11453)))

(declare-fun m!221135 () Bool)

(assert (=> bm!19617 m!221135))

(assert (=> b!194212 m!221041))

(assert (=> b!194212 m!221041))

(declare-fun m!221137 () Bool)

(assert (=> b!194212 m!221137))

(declare-fun m!221139 () Bool)

(assert (=> bm!19618 m!221139))

(declare-fun m!221141 () Bool)

(assert (=> bm!19616 m!221141))

(assert (=> d!56741 m!221011))

(assert (=> b!194222 m!221041))

(assert (=> b!194222 m!221041))

(assert (=> b!194222 m!221049))

(declare-fun m!221143 () Bool)

(assert (=> b!194220 m!221143))

(declare-fun m!221145 () Bool)

(assert (=> bm!19621 m!221145))

(assert (=> b!194202 m!221041))

(assert (=> b!194202 m!221041))

(assert (=> b!194202 m!221049))

(declare-fun m!221147 () Bool)

(assert (=> b!194204 m!221147))

(assert (=> b!194204 m!221147))

(assert (=> b!194204 m!221057))

(declare-fun m!221149 () Bool)

(assert (=> b!194204 m!221149))

(assert (=> b!194204 m!221057))

(assert (=> b!194204 m!221041))

(assert (=> b!194204 m!221041))

(declare-fun m!221151 () Bool)

(assert (=> b!194204 m!221151))

(declare-fun m!221153 () Bool)

(assert (=> b!194216 m!221153))

(declare-fun m!221155 () Bool)

(assert (=> b!194211 m!221155))

(declare-fun m!221157 () Bool)

(assert (=> b!194211 m!221157))

(assert (=> b!194211 m!221157))

(declare-fun m!221159 () Bool)

(assert (=> b!194211 m!221159))

(declare-fun m!221161 () Bool)

(assert (=> b!194211 m!221161))

(declare-fun m!221163 () Bool)

(assert (=> b!194211 m!221163))

(declare-fun m!221165 () Bool)

(assert (=> b!194211 m!221165))

(declare-fun m!221167 () Bool)

(assert (=> b!194211 m!221167))

(assert (=> b!194211 m!221161))

(declare-fun m!221169 () Bool)

(assert (=> b!194211 m!221169))

(declare-fun m!221171 () Bool)

(assert (=> b!194211 m!221171))

(declare-fun m!221173 () Bool)

(assert (=> b!194211 m!221173))

(declare-fun m!221175 () Bool)

(assert (=> b!194211 m!221175))

(declare-fun m!221177 () Bool)

(assert (=> b!194211 m!221177))

(assert (=> b!194211 m!221041))

(assert (=> b!194211 m!221141))

(declare-fun m!221179 () Bool)

(assert (=> b!194211 m!221179))

(declare-fun m!221181 () Bool)

(assert (=> b!194211 m!221181))

(assert (=> b!194211 m!221175))

(declare-fun m!221183 () Bool)

(assert (=> b!194211 m!221183))

(assert (=> b!194211 m!221171))

(declare-fun m!221185 () Bool)

(assert (=> b!194215 m!221185))

(assert (=> b!194000 d!56741))

(declare-fun b!194239 () Bool)

(declare-fun e!127797 () Bool)

(declare-fun e!127795 () Bool)

(assert (=> b!194239 (= e!127797 e!127795)))

(declare-fun c!35042 () Bool)

(declare-fun lt!96926 () SeekEntryResult!682)

(assert (=> b!194239 (= c!35042 ((_ is MissingVacant!682) lt!96926))))

(declare-fun b!194240 () Bool)

(declare-fun e!127796 () Bool)

(assert (=> b!194240 (= e!127797 e!127796)))

(declare-fun res!91804 () Bool)

(declare-fun call!19630 () Bool)

(assert (=> b!194240 (= res!91804 call!19630)))

(assert (=> b!194240 (=> (not res!91804) (not e!127796))))

(declare-fun b!194241 () Bool)

(declare-fun e!127794 () Bool)

(declare-fun call!19631 () Bool)

(assert (=> b!194241 (= e!127794 (not call!19631))))

(declare-fun b!194242 () Bool)

(assert (=> b!194242 (and (bvsge (index!4898 lt!96926) #b00000000000000000000000000000000) (bvslt (index!4898 lt!96926) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!91806 () Bool)

(assert (=> b!194242 (= res!91806 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4898 lt!96926)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194242 (=> (not res!91806) (not e!127796))))

(declare-fun d!56743 () Bool)

(assert (=> d!56743 e!127797))

(declare-fun c!35041 () Bool)

(assert (=> d!56743 (= c!35041 ((_ is MissingZero!682) lt!96926))))

(assert (=> d!56743 (= lt!96926 (seekEntryOrOpen!0 key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun lt!96925 () Unit!5858)

(declare-fun choose!1073 (array!8215 array!8217 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5858)

(assert (=> d!56743 (= lt!96925 (choose!1073 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56743 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56743 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!182 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)) lt!96925)))

(declare-fun b!194243 () Bool)

(assert (=> b!194243 (= e!127796 (not call!19631))))

(declare-fun b!194244 () Bool)

(assert (=> b!194244 (= e!127795 ((_ is Undefined!682) lt!96926))))

(declare-fun bm!19627 () Bool)

(declare-fun arrayContainsKey!0 (array!8215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19627 (= call!19631 (arrayContainsKey!0 (_keys!5953 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!194245 () Bool)

(declare-fun res!91803 () Bool)

(assert (=> b!194245 (=> (not res!91803) (not e!127794))))

(assert (=> b!194245 (= res!91803 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4901 lt!96926)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194245 (and (bvsge (index!4901 lt!96926) #b00000000000000000000000000000000) (bvslt (index!4901 lt!96926) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194246 () Bool)

(declare-fun res!91805 () Bool)

(assert (=> b!194246 (=> (not res!91805) (not e!127794))))

(assert (=> b!194246 (= res!91805 call!19630)))

(assert (=> b!194246 (= e!127795 e!127794)))

(declare-fun bm!19628 () Bool)

(assert (=> bm!19628 (= call!19630 (inRange!0 (ite c!35041 (index!4898 lt!96926) (index!4901 lt!96926)) (mask!9222 thiss!1248)))))

(assert (= (and d!56743 c!35041) b!194240))

(assert (= (and d!56743 (not c!35041)) b!194239))

(assert (= (and b!194240 res!91804) b!194242))

(assert (= (and b!194242 res!91806) b!194243))

(assert (= (and b!194239 c!35042) b!194246))

(assert (= (and b!194239 (not c!35042)) b!194244))

(assert (= (and b!194246 res!91805) b!194245))

(assert (= (and b!194245 res!91803) b!194241))

(assert (= (or b!194240 b!194246) bm!19628))

(assert (= (or b!194243 b!194241) bm!19627))

(declare-fun m!221187 () Bool)

(assert (=> b!194242 m!221187))

(assert (=> d!56743 m!220909))

(declare-fun m!221189 () Bool)

(assert (=> d!56743 m!221189))

(assert (=> d!56743 m!221011))

(declare-fun m!221191 () Bool)

(assert (=> bm!19627 m!221191))

(declare-fun m!221193 () Bool)

(assert (=> b!194245 m!221193))

(declare-fun m!221195 () Bool)

(assert (=> bm!19628 m!221195))

(assert (=> b!193996 d!56743))

(declare-fun d!56745 () Bool)

(declare-fun e!127798 () Bool)

(assert (=> d!56745 e!127798))

(declare-fun res!91808 () Bool)

(assert (=> d!56745 (=> (not res!91808) (not e!127798))))

(declare-fun lt!96927 () ListLongMap!2421)

(assert (=> d!56745 (= res!91808 (contains!1363 lt!96927 (_1!1761 lt!96690)))))

(declare-fun lt!96929 () List!2408)

(assert (=> d!56745 (= lt!96927 (ListLongMap!2422 lt!96929))))

(declare-fun lt!96930 () Unit!5858)

(declare-fun lt!96928 () Unit!5858)

(assert (=> d!56745 (= lt!96930 lt!96928)))

(assert (=> d!56745 (= (getValueByKey!246 lt!96929 (_1!1761 lt!96690)) (Some!251 (_2!1761 lt!96690)))))

(assert (=> d!56745 (= lt!96928 (lemmaContainsTupThenGetReturnValue!133 lt!96929 (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(assert (=> d!56745 (= lt!96929 (insertStrictlySorted!136 (toList!1226 (map!2018 thiss!1248)) (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(assert (=> d!56745 (= (+!319 (map!2018 thiss!1248) lt!96690) lt!96927)))

(declare-fun b!194247 () Bool)

(declare-fun res!91807 () Bool)

(assert (=> b!194247 (=> (not res!91807) (not e!127798))))

(assert (=> b!194247 (= res!91807 (= (getValueByKey!246 (toList!1226 lt!96927) (_1!1761 lt!96690)) (Some!251 (_2!1761 lt!96690))))))

(declare-fun b!194248 () Bool)

(assert (=> b!194248 (= e!127798 (contains!1365 (toList!1226 lt!96927) lt!96690))))

(assert (= (and d!56745 res!91808) b!194247))

(assert (= (and b!194247 res!91807) b!194248))

(declare-fun m!221197 () Bool)

(assert (=> d!56745 m!221197))

(declare-fun m!221199 () Bool)

(assert (=> d!56745 m!221199))

(declare-fun m!221201 () Bool)

(assert (=> d!56745 m!221201))

(declare-fun m!221203 () Bool)

(assert (=> d!56745 m!221203))

(declare-fun m!221205 () Bool)

(assert (=> b!194247 m!221205))

(declare-fun m!221207 () Bool)

(assert (=> b!194248 m!221207))

(assert (=> b!193998 d!56745))

(declare-fun d!56747 () Bool)

(assert (=> d!56747 (= (map!2018 thiss!1248) (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun bs!7746 () Bool)

(assert (= bs!7746 d!56747))

(assert (=> bs!7746 m!220887))

(assert (=> b!193998 d!56747))

(declare-fun d!56749 () Bool)

(declare-fun res!91809 () Bool)

(declare-fun e!127799 () Bool)

(assert (=> d!56749 (=> (not res!91809) (not e!127799))))

(assert (=> d!56749 (= res!91809 (simpleValid!204 thiss!1248))))

(assert (=> d!56749 (= (valid!1132 thiss!1248) e!127799)))

(declare-fun b!194249 () Bool)

(declare-fun res!91810 () Bool)

(assert (=> b!194249 (=> (not res!91810) (not e!127799))))

(assert (=> b!194249 (= res!91810 (= (arrayCountValidKeys!0 (_keys!5953 thiss!1248) #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))) (_size!1404 thiss!1248)))))

(declare-fun b!194250 () Bool)

(declare-fun res!91811 () Bool)

(assert (=> b!194250 (=> (not res!91811) (not e!127799))))

(assert (=> b!194250 (= res!91811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun b!194251 () Bool)

(assert (=> b!194251 (= e!127799 (arrayNoDuplicates!0 (_keys!5953 thiss!1248) #b00000000000000000000000000000000 Nil!2407))))

(assert (= (and d!56749 res!91809) b!194249))

(assert (= (and b!194249 res!91810) b!194250))

(assert (= (and b!194250 res!91811) b!194251))

(declare-fun m!221209 () Bool)

(assert (=> d!56749 m!221209))

(declare-fun m!221211 () Bool)

(assert (=> b!194249 m!221211))

(declare-fun m!221213 () Bool)

(assert (=> b!194250 m!221213))

(declare-fun m!221215 () Bool)

(assert (=> b!194251 m!221215))

(assert (=> start!19800 d!56749))

(declare-fun mapNonEmpty!7775 () Bool)

(declare-fun mapRes!7775 () Bool)

(declare-fun tp!17036 () Bool)

(declare-fun e!127804 () Bool)

(assert (=> mapNonEmpty!7775 (= mapRes!7775 (and tp!17036 e!127804))))

(declare-fun mapKey!7775 () (_ BitVec 32))

(declare-fun mapRest!7775 () (Array (_ BitVec 32) ValueCell!1901))

(declare-fun mapValue!7775 () ValueCell!1901)

(assert (=> mapNonEmpty!7775 (= mapRest!7766 (store mapRest!7775 mapKey!7775 mapValue!7775))))

(declare-fun b!194259 () Bool)

(declare-fun e!127805 () Bool)

(assert (=> b!194259 (= e!127805 tp_is_empty!4489)))

(declare-fun condMapEmpty!7775 () Bool)

(declare-fun mapDefault!7775 () ValueCell!1901)

(assert (=> mapNonEmpty!7766 (= condMapEmpty!7775 (= mapRest!7766 ((as const (Array (_ BitVec 32) ValueCell!1901)) mapDefault!7775)))))

(assert (=> mapNonEmpty!7766 (= tp!17021 (and e!127805 mapRes!7775))))

(declare-fun b!194258 () Bool)

(assert (=> b!194258 (= e!127804 tp_is_empty!4489)))

(declare-fun mapIsEmpty!7775 () Bool)

(assert (=> mapIsEmpty!7775 mapRes!7775))

(assert (= (and mapNonEmpty!7766 condMapEmpty!7775) mapIsEmpty!7775))

(assert (= (and mapNonEmpty!7766 (not condMapEmpty!7775)) mapNonEmpty!7775))

(assert (= (and mapNonEmpty!7775 ((_ is ValueCellFull!1901) mapValue!7775)) b!194258))

(assert (= (and mapNonEmpty!7766 ((_ is ValueCellFull!1901) mapDefault!7775)) b!194259))

(declare-fun m!221217 () Bool)

(assert (=> mapNonEmpty!7775 m!221217))

(declare-fun b_lambda!7505 () Bool)

(assert (= b_lambda!7501 (or (and b!194001 b_free!4717) b_lambda!7505)))

(declare-fun b_lambda!7507 () Bool)

(assert (= b_lambda!7503 (or (and b!194001 b_free!4717) b_lambda!7507)))

(check-sat b_and!11453 (not b!194251) (not d!56731) (not b!194250) (not bm!19628) (not b!194189) (not b!194211) (not b!194201) (not b!194249) (not b!194090) (not bm!19611) (not d!56727) (not d!56721) (not b!194197) (not b_lambda!7507) (not d!56735) (not b!194202) (not b!194222) (not b!194182) (not mapNonEmpty!7775) (not b!194110) (not d!56745) (not b!194220) (not d!56739) (not b!194248) (not d!56717) (not b_lambda!7505) (not d!56749) (not b!194183) (not bm!19614) (not b!194157) (not bm!19609) (not b!194198) (not b!194169) (not d!56747) (not bm!19616) (not bm!19617) (not b!194083) (not b!194085) (not b!194204) (not d!56729) (not b!194173) (not bm!19618) (not b!194186) (not b!194187) (not b!194107) (not bm!19627) (not d!56719) (not b!194164) (not bm!19621) (not b!194165) (not b!194175) (not b!194212) (not b!194215) (not b!194112) (not b!194216) (not d!56741) (not b!194168) (not b!194196) (not b_next!4717) (not d!56733) (not d!56737) (not d!56725) (not d!56743) (not b!194247) tp_is_empty!4489 (not bm!19610) (not b!194155))
(check-sat b_and!11453 (not b_next!4717))
(get-model)

(declare-fun b!194284 () Bool)

(assert (=> b!194284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> b!194284 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4191 lt!96689)))))

(declare-fun lt!96950 () ListLongMap!2421)

(declare-fun e!127822 () Bool)

(assert (=> b!194284 (= e!127822 (= (apply!188 lt!96950 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19631 () Bool)

(declare-fun call!19634 () ListLongMap!2421)

(assert (=> bm!19631 (= call!19634 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194285 () Bool)

(declare-fun res!91822 () Bool)

(declare-fun e!127825 () Bool)

(assert (=> b!194285 (=> (not res!91822) (not e!127825))))

(assert (=> b!194285 (= res!91822 (not (contains!1363 lt!96950 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!127824 () Bool)

(declare-fun b!194286 () Bool)

(assert (=> b!194286 (= e!127824 (= lt!96950 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(declare-fun d!56751 () Bool)

(assert (=> d!56751 e!127825))

(declare-fun res!91821 () Bool)

(assert (=> d!56751 (=> (not res!91821) (not e!127825))))

(assert (=> d!56751 (= res!91821 (not (contains!1363 lt!96950 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!127821 () ListLongMap!2421)

(assert (=> d!56751 (= lt!96950 e!127821)))

(declare-fun c!35052 () Bool)

(assert (=> d!56751 (= c!35052 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!56751 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56751 (= (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!96950)))

(declare-fun b!194287 () Bool)

(declare-fun e!127820 () Bool)

(assert (=> b!194287 (= e!127825 e!127820)))

(declare-fun c!35053 () Bool)

(declare-fun e!127823 () Bool)

(assert (=> b!194287 (= c!35053 e!127823)))

(declare-fun res!91820 () Bool)

(assert (=> b!194287 (=> (not res!91820) (not e!127823))))

(assert (=> b!194287 (= res!91820 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194288 () Bool)

(assert (=> b!194288 (= e!127821 (ListLongMap!2422 Nil!2405))))

(declare-fun b!194289 () Bool)

(declare-fun e!127826 () ListLongMap!2421)

(assert (=> b!194289 (= e!127821 e!127826)))

(declare-fun c!35054 () Bool)

(assert (=> b!194289 (= c!35054 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194290 () Bool)

(declare-fun lt!96951 () Unit!5858)

(declare-fun lt!96946 () Unit!5858)

(assert (=> b!194290 (= lt!96951 lt!96946)))

(declare-fun lt!96949 () ListLongMap!2421)

(declare-fun lt!96945 () V!5633)

(declare-fun lt!96948 () (_ BitVec 64))

(declare-fun lt!96947 () (_ BitVec 64))

(assert (=> b!194290 (not (contains!1363 (+!319 lt!96949 (tuple2!3501 lt!96948 lt!96945)) lt!96947))))

(declare-fun addStillNotContains!99 (ListLongMap!2421 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5858)

(assert (=> b!194290 (= lt!96946 (addStillNotContains!99 lt!96949 lt!96948 lt!96945 lt!96947))))

(assert (=> b!194290 (= lt!96947 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194290 (= lt!96945 (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194290 (= lt!96948 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194290 (= lt!96949 call!19634)))

(assert (=> b!194290 (= e!127826 (+!319 call!19634 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194291 () Bool)

(declare-fun isEmpty!493 (ListLongMap!2421) Bool)

(assert (=> b!194291 (= e!127824 (isEmpty!493 lt!96950))))

(declare-fun b!194292 () Bool)

(assert (=> b!194292 (= e!127823 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194292 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!194293 () Bool)

(assert (=> b!194293 (= e!127820 e!127822)))

(assert (=> b!194293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!91823 () Bool)

(assert (=> b!194293 (= res!91823 (contains!1363 lt!96950 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194293 (=> (not res!91823) (not e!127822))))

(declare-fun b!194294 () Bool)

(assert (=> b!194294 (= e!127820 e!127824)))

(declare-fun c!35051 () Bool)

(assert (=> b!194294 (= c!35051 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194295 () Bool)

(assert (=> b!194295 (= e!127826 call!19634)))

(assert (= (and d!56751 c!35052) b!194288))

(assert (= (and d!56751 (not c!35052)) b!194289))

(assert (= (and b!194289 c!35054) b!194290))

(assert (= (and b!194289 (not c!35054)) b!194295))

(assert (= (or b!194290 b!194295) bm!19631))

(assert (= (and d!56751 res!91821) b!194285))

(assert (= (and b!194285 res!91822) b!194287))

(assert (= (and b!194287 res!91820) b!194292))

(assert (= (and b!194287 c!35053) b!194293))

(assert (= (and b!194287 (not c!35053)) b!194294))

(assert (= (and b!194293 res!91823) b!194284))

(assert (= (and b!194294 c!35051) b!194286))

(assert (= (and b!194294 (not c!35051)) b!194291))

(declare-fun b_lambda!7509 () Bool)

(assert (=> (not b_lambda!7509) (not b!194284)))

(assert (=> b!194284 t!7329))

(declare-fun b_and!11455 () Bool)

(assert (= b_and!11453 (and (=> t!7329 result!4931) b_and!11455)))

(declare-fun b_lambda!7511 () Bool)

(assert (=> (not b_lambda!7511) (not b!194290)))

(assert (=> b!194290 t!7329))

(declare-fun b_and!11457 () Bool)

(assert (= b_and!11455 (and (=> t!7329 result!4931) b_and!11457)))

(declare-fun m!221219 () Bool)

(assert (=> bm!19631 m!221219))

(assert (=> b!194290 m!221057))

(declare-fun m!221221 () Bool)

(assert (=> b!194290 m!221221))

(declare-fun m!221223 () Bool)

(assert (=> b!194290 m!221223))

(assert (=> b!194290 m!221147))

(assert (=> b!194290 m!221147))

(assert (=> b!194290 m!221057))

(assert (=> b!194290 m!221149))

(declare-fun m!221225 () Bool)

(assert (=> b!194290 m!221225))

(assert (=> b!194290 m!221041))

(assert (=> b!194290 m!221221))

(declare-fun m!221227 () Bool)

(assert (=> b!194290 m!221227))

(assert (=> b!194289 m!221041))

(assert (=> b!194289 m!221041))

(assert (=> b!194289 m!221049))

(declare-fun m!221229 () Bool)

(assert (=> b!194285 m!221229))

(declare-fun m!221231 () Bool)

(assert (=> d!56751 m!221231))

(assert (=> d!56751 m!221011))

(assert (=> b!194292 m!221041))

(assert (=> b!194292 m!221041))

(assert (=> b!194292 m!221049))

(assert (=> b!194293 m!221041))

(assert (=> b!194293 m!221041))

(declare-fun m!221233 () Bool)

(assert (=> b!194293 m!221233))

(declare-fun m!221235 () Bool)

(assert (=> b!194291 m!221235))

(assert (=> b!194286 m!221219))

(assert (=> b!194284 m!221057))

(assert (=> b!194284 m!221041))

(declare-fun m!221237 () Bool)

(assert (=> b!194284 m!221237))

(assert (=> b!194284 m!221147))

(assert (=> b!194284 m!221147))

(assert (=> b!194284 m!221057))

(assert (=> b!194284 m!221149))

(assert (=> b!194284 m!221041))

(assert (=> b!194211 d!56751))

(declare-fun d!56753 () Bool)

(declare-fun get!2244 (Option!252) V!5633)

(assert (=> d!56753 (= (apply!188 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) lt!96914) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) lt!96914)))))

(declare-fun bs!7747 () Bool)

(assert (= bs!7747 d!56753))

(declare-fun m!221239 () Bool)

(assert (=> bs!7747 m!221239))

(assert (=> bs!7747 m!221239))

(declare-fun m!221241 () Bool)

(assert (=> bs!7747 m!221241))

(assert (=> b!194211 d!56753))

(declare-fun d!56755 () Bool)

(declare-fun e!127827 () Bool)

(assert (=> d!56755 e!127827))

(declare-fun res!91825 () Bool)

(assert (=> d!56755 (=> (not res!91825) (not e!127827))))

(declare-fun lt!96952 () ListLongMap!2421)

(assert (=> d!56755 (= res!91825 (contains!1363 lt!96952 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96954 () List!2408)

(assert (=> d!56755 (= lt!96952 (ListLongMap!2422 lt!96954))))

(declare-fun lt!96955 () Unit!5858)

(declare-fun lt!96953 () Unit!5858)

(assert (=> d!56755 (= lt!96955 lt!96953)))

(assert (=> d!56755 (= (getValueByKey!246 lt!96954 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(assert (=> d!56755 (= lt!96953 (lemmaContainsTupThenGetReturnValue!133 lt!96954 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(assert (=> d!56755 (= lt!96954 (insertStrictlySorted!136 (toList!1226 lt!96920) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(assert (=> d!56755 (= (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) lt!96952)))

(declare-fun b!194296 () Bool)

(declare-fun res!91824 () Bool)

(assert (=> b!194296 (=> (not res!91824) (not e!127827))))

(assert (=> b!194296 (= res!91824 (= (getValueByKey!246 (toList!1226 lt!96952) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(declare-fun b!194297 () Bool)

(assert (=> b!194297 (= e!127827 (contains!1365 (toList!1226 lt!96952) (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))

(assert (= (and d!56755 res!91825) b!194296))

(assert (= (and b!194296 res!91824) b!194297))

(declare-fun m!221243 () Bool)

(assert (=> d!56755 m!221243))

(declare-fun m!221245 () Bool)

(assert (=> d!56755 m!221245))

(declare-fun m!221247 () Bool)

(assert (=> d!56755 m!221247))

(declare-fun m!221249 () Bool)

(assert (=> d!56755 m!221249))

(declare-fun m!221251 () Bool)

(assert (=> b!194296 m!221251))

(declare-fun m!221253 () Bool)

(assert (=> b!194297 m!221253))

(assert (=> b!194211 d!56755))

(declare-fun d!56757 () Bool)

(declare-fun e!127828 () Bool)

(assert (=> d!56757 e!127828))

(declare-fun res!91827 () Bool)

(assert (=> d!56757 (=> (not res!91827) (not e!127828))))

(declare-fun lt!96956 () ListLongMap!2421)

(assert (=> d!56757 (= res!91827 (contains!1363 lt!96956 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!96958 () List!2408)

(assert (=> d!56757 (= lt!96956 (ListLongMap!2422 lt!96958))))

(declare-fun lt!96959 () Unit!5858)

(declare-fun lt!96957 () Unit!5858)

(assert (=> d!56757 (= lt!96959 lt!96957)))

(assert (=> d!56757 (= (getValueByKey!246 lt!96958 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56757 (= lt!96957 (lemmaContainsTupThenGetReturnValue!133 lt!96958 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56757 (= lt!96958 (insertStrictlySorted!136 (toList!1226 lt!96919) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56757 (= (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) lt!96956)))

(declare-fun b!194298 () Bool)

(declare-fun res!91826 () Bool)

(assert (=> b!194298 (=> (not res!91826) (not e!127828))))

(assert (=> b!194298 (= res!91826 (= (getValueByKey!246 (toList!1226 lt!96956) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194299 () Bool)

(assert (=> b!194299 (= e!127828 (contains!1365 (toList!1226 lt!96956) (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56757 res!91827) b!194298))

(assert (= (and b!194298 res!91826) b!194299))

(declare-fun m!221255 () Bool)

(assert (=> d!56757 m!221255))

(declare-fun m!221257 () Bool)

(assert (=> d!56757 m!221257))

(declare-fun m!221259 () Bool)

(assert (=> d!56757 m!221259))

(declare-fun m!221261 () Bool)

(assert (=> d!56757 m!221261))

(declare-fun m!221263 () Bool)

(assert (=> b!194298 m!221263))

(declare-fun m!221265 () Bool)

(assert (=> b!194299 m!221265))

(assert (=> b!194211 d!56757))

(declare-fun d!56759 () Bool)

(assert (=> d!56759 (= (apply!188 lt!96920 lt!96914) (get!2244 (getValueByKey!246 (toList!1226 lt!96920) lt!96914)))))

(declare-fun bs!7748 () Bool)

(assert (= bs!7748 d!56759))

(declare-fun m!221267 () Bool)

(assert (=> bs!7748 m!221267))

(assert (=> bs!7748 m!221267))

(declare-fun m!221269 () Bool)

(assert (=> bs!7748 m!221269))

(assert (=> b!194211 d!56759))

(declare-fun d!56761 () Bool)

(declare-fun e!127830 () Bool)

(assert (=> d!56761 e!127830))

(declare-fun res!91828 () Bool)

(assert (=> d!56761 (=> res!91828 e!127830)))

(declare-fun lt!96961 () Bool)

(assert (=> d!56761 (= res!91828 (not lt!96961))))

(declare-fun lt!96963 () Bool)

(assert (=> d!56761 (= lt!96961 lt!96963)))

(declare-fun lt!96960 () Unit!5858)

(declare-fun e!127829 () Unit!5858)

(assert (=> d!56761 (= lt!96960 e!127829)))

(declare-fun c!35055 () Bool)

(assert (=> d!56761 (= c!35055 lt!96963)))

(assert (=> d!56761 (= lt!96963 (containsKey!249 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915))))

(assert (=> d!56761 (= (contains!1363 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) lt!96915) lt!96961)))

(declare-fun b!194300 () Bool)

(declare-fun lt!96962 () Unit!5858)

(assert (=> b!194300 (= e!127829 lt!96962)))

(assert (=> b!194300 (= lt!96962 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915))))

(assert (=> b!194300 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915))))

(declare-fun b!194301 () Bool)

(declare-fun Unit!5869 () Unit!5858)

(assert (=> b!194301 (= e!127829 Unit!5869)))

(declare-fun b!194302 () Bool)

(assert (=> b!194302 (= e!127830 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915)))))

(assert (= (and d!56761 c!35055) b!194300))

(assert (= (and d!56761 (not c!35055)) b!194301))

(assert (= (and d!56761 (not res!91828)) b!194302))

(declare-fun m!221271 () Bool)

(assert (=> d!56761 m!221271))

(declare-fun m!221273 () Bool)

(assert (=> b!194300 m!221273))

(declare-fun m!221275 () Bool)

(assert (=> b!194300 m!221275))

(assert (=> b!194300 m!221275))

(declare-fun m!221277 () Bool)

(assert (=> b!194300 m!221277))

(assert (=> b!194302 m!221275))

(assert (=> b!194302 m!221275))

(assert (=> b!194302 m!221277))

(assert (=> b!194211 d!56761))

(declare-fun d!56763 () Bool)

(assert (=> d!56763 (= (apply!188 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) lt!96916) (apply!188 lt!96919 lt!96916))))

(declare-fun lt!96966 () Unit!5858)

(declare-fun choose!1074 (ListLongMap!2421 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5858)

(assert (=> d!56763 (= lt!96966 (choose!1074 lt!96919 lt!96910 (zeroValue!3800 thiss!1248) lt!96916))))

(declare-fun e!127833 () Bool)

(assert (=> d!56763 e!127833))

(declare-fun res!91831 () Bool)

(assert (=> d!56763 (=> (not res!91831) (not e!127833))))

(assert (=> d!56763 (= res!91831 (contains!1363 lt!96919 lt!96916))))

(assert (=> d!56763 (= (addApplyDifferent!164 lt!96919 lt!96910 (zeroValue!3800 thiss!1248) lt!96916) lt!96966)))

(declare-fun b!194306 () Bool)

(assert (=> b!194306 (= e!127833 (not (= lt!96916 lt!96910)))))

(assert (= (and d!56763 res!91831) b!194306))

(declare-fun m!221279 () Bool)

(assert (=> d!56763 m!221279))

(assert (=> d!56763 m!221175))

(assert (=> d!56763 m!221167))

(assert (=> d!56763 m!221175))

(assert (=> d!56763 m!221183))

(declare-fun m!221281 () Bool)

(assert (=> d!56763 m!221281))

(assert (=> b!194211 d!56763))

(declare-fun d!56765 () Bool)

(assert (=> d!56765 (contains!1363 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) lt!96915)))

(declare-fun lt!96969 () Unit!5858)

(declare-fun choose!1075 (ListLongMap!2421 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5858)

(assert (=> d!56765 (= lt!96969 (choose!1075 lt!96917 lt!96902 (zeroValue!3800 thiss!1248) lt!96915))))

(assert (=> d!56765 (contains!1363 lt!96917 lt!96915)))

(assert (=> d!56765 (= (addStillContains!164 lt!96917 lt!96902 (zeroValue!3800 thiss!1248) lt!96915) lt!96969)))

(declare-fun bs!7749 () Bool)

(assert (= bs!7749 d!56765))

(assert (=> bs!7749 m!221161))

(assert (=> bs!7749 m!221161))

(assert (=> bs!7749 m!221169))

(declare-fun m!221283 () Bool)

(assert (=> bs!7749 m!221283))

(declare-fun m!221285 () Bool)

(assert (=> bs!7749 m!221285))

(assert (=> b!194211 d!56765))

(declare-fun d!56767 () Bool)

(assert (=> d!56767 (= (apply!188 lt!96919 lt!96916) (get!2244 (getValueByKey!246 (toList!1226 lt!96919) lt!96916)))))

(declare-fun bs!7750 () Bool)

(assert (= bs!7750 d!56767))

(declare-fun m!221287 () Bool)

(assert (=> bs!7750 m!221287))

(assert (=> bs!7750 m!221287))

(declare-fun m!221289 () Bool)

(assert (=> bs!7750 m!221289))

(assert (=> b!194211 d!56767))

(declare-fun d!56769 () Bool)

(assert (=> d!56769 (= (apply!188 lt!96913 lt!96900) (get!2244 (getValueByKey!246 (toList!1226 lt!96913) lt!96900)))))

(declare-fun bs!7751 () Bool)

(assert (= bs!7751 d!56769))

(declare-fun m!221291 () Bool)

(assert (=> bs!7751 m!221291))

(assert (=> bs!7751 m!221291))

(declare-fun m!221293 () Bool)

(assert (=> bs!7751 m!221293))

(assert (=> b!194211 d!56769))

(declare-fun d!56771 () Bool)

(declare-fun e!127834 () Bool)

(assert (=> d!56771 e!127834))

(declare-fun res!91833 () Bool)

(assert (=> d!56771 (=> (not res!91833) (not e!127834))))

(declare-fun lt!96970 () ListLongMap!2421)

(assert (=> d!56771 (= res!91833 (contains!1363 lt!96970 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!96972 () List!2408)

(assert (=> d!56771 (= lt!96970 (ListLongMap!2422 lt!96972))))

(declare-fun lt!96973 () Unit!5858)

(declare-fun lt!96971 () Unit!5858)

(assert (=> d!56771 (= lt!96973 lt!96971)))

(assert (=> d!56771 (= (getValueByKey!246 lt!96972 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56771 (= lt!96971 (lemmaContainsTupThenGetReturnValue!133 lt!96972 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56771 (= lt!96972 (insertStrictlySorted!136 (toList!1226 lt!96917) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56771 (= (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) lt!96970)))

(declare-fun b!194308 () Bool)

(declare-fun res!91832 () Bool)

(assert (=> b!194308 (=> (not res!91832) (not e!127834))))

(assert (=> b!194308 (= res!91832 (= (getValueByKey!246 (toList!1226 lt!96970) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194309 () Bool)

(assert (=> b!194309 (= e!127834 (contains!1365 (toList!1226 lt!96970) (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56771 res!91833) b!194308))

(assert (= (and b!194308 res!91832) b!194309))

(declare-fun m!221295 () Bool)

(assert (=> d!56771 m!221295))

(declare-fun m!221297 () Bool)

(assert (=> d!56771 m!221297))

(declare-fun m!221299 () Bool)

(assert (=> d!56771 m!221299))

(declare-fun m!221301 () Bool)

(assert (=> d!56771 m!221301))

(declare-fun m!221303 () Bool)

(assert (=> b!194308 m!221303))

(declare-fun m!221305 () Bool)

(assert (=> b!194309 m!221305))

(assert (=> b!194211 d!56771))

(declare-fun d!56773 () Bool)

(assert (=> d!56773 (= (apply!188 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) lt!96900) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) lt!96900)))))

(declare-fun bs!7752 () Bool)

(assert (= bs!7752 d!56773))

(declare-fun m!221307 () Bool)

(assert (=> bs!7752 m!221307))

(assert (=> bs!7752 m!221307))

(declare-fun m!221309 () Bool)

(assert (=> bs!7752 m!221309))

(assert (=> b!194211 d!56773))

(declare-fun d!56775 () Bool)

(assert (=> d!56775 (= (apply!188 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) lt!96900) (apply!188 lt!96913 lt!96900))))

(declare-fun lt!96974 () Unit!5858)

(assert (=> d!56775 (= lt!96974 (choose!1074 lt!96913 lt!96909 (minValue!3800 thiss!1248) lt!96900))))

(declare-fun e!127835 () Bool)

(assert (=> d!56775 e!127835))

(declare-fun res!91834 () Bool)

(assert (=> d!56775 (=> (not res!91834) (not e!127835))))

(assert (=> d!56775 (= res!91834 (contains!1363 lt!96913 lt!96900))))

(assert (=> d!56775 (= (addApplyDifferent!164 lt!96913 lt!96909 (minValue!3800 thiss!1248) lt!96900) lt!96974)))

(declare-fun b!194310 () Bool)

(assert (=> b!194310 (= e!127835 (not (= lt!96900 lt!96909)))))

(assert (= (and d!56775 res!91834) b!194310))

(declare-fun m!221311 () Bool)

(assert (=> d!56775 m!221311))

(assert (=> d!56775 m!221171))

(assert (=> d!56775 m!221181))

(assert (=> d!56775 m!221171))

(assert (=> d!56775 m!221173))

(declare-fun m!221313 () Bool)

(assert (=> d!56775 m!221313))

(assert (=> b!194211 d!56775))

(declare-fun d!56777 () Bool)

(declare-fun e!127836 () Bool)

(assert (=> d!56777 e!127836))

(declare-fun res!91836 () Bool)

(assert (=> d!56777 (=> (not res!91836) (not e!127836))))

(declare-fun lt!96975 () ListLongMap!2421)

(assert (=> d!56777 (= res!91836 (contains!1363 lt!96975 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96977 () List!2408)

(assert (=> d!56777 (= lt!96975 (ListLongMap!2422 lt!96977))))

(declare-fun lt!96978 () Unit!5858)

(declare-fun lt!96976 () Unit!5858)

(assert (=> d!56777 (= lt!96978 lt!96976)))

(assert (=> d!56777 (= (getValueByKey!246 lt!96977 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(assert (=> d!56777 (= lt!96976 (lemmaContainsTupThenGetReturnValue!133 lt!96977 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(assert (=> d!56777 (= lt!96977 (insertStrictlySorted!136 (toList!1226 lt!96913) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(assert (=> d!56777 (= (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) lt!96975)))

(declare-fun b!194311 () Bool)

(declare-fun res!91835 () Bool)

(assert (=> b!194311 (=> (not res!91835) (not e!127836))))

(assert (=> b!194311 (= res!91835 (= (getValueByKey!246 (toList!1226 lt!96975) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(declare-fun b!194312 () Bool)

(assert (=> b!194312 (= e!127836 (contains!1365 (toList!1226 lt!96975) (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))

(assert (= (and d!56777 res!91836) b!194311))

(assert (= (and b!194311 res!91835) b!194312))

(declare-fun m!221315 () Bool)

(assert (=> d!56777 m!221315))

(declare-fun m!221317 () Bool)

(assert (=> d!56777 m!221317))

(declare-fun m!221319 () Bool)

(assert (=> d!56777 m!221319))

(declare-fun m!221321 () Bool)

(assert (=> d!56777 m!221321))

(declare-fun m!221323 () Bool)

(assert (=> b!194311 m!221323))

(declare-fun m!221325 () Bool)

(assert (=> b!194312 m!221325))

(assert (=> b!194211 d!56777))

(declare-fun d!56779 () Bool)

(assert (=> d!56779 (= (apply!188 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) lt!96914) (apply!188 lt!96920 lt!96914))))

(declare-fun lt!96979 () Unit!5858)

(assert (=> d!56779 (= lt!96979 (choose!1074 lt!96920 lt!96912 (minValue!3800 thiss!1248) lt!96914))))

(declare-fun e!127837 () Bool)

(assert (=> d!56779 e!127837))

(declare-fun res!91837 () Bool)

(assert (=> d!56779 (=> (not res!91837) (not e!127837))))

(assert (=> d!56779 (= res!91837 (contains!1363 lt!96920 lt!96914))))

(assert (=> d!56779 (= (addApplyDifferent!164 lt!96920 lt!96912 (minValue!3800 thiss!1248) lt!96914) lt!96979)))

(declare-fun b!194313 () Bool)

(assert (=> b!194313 (= e!127837 (not (= lt!96914 lt!96912)))))

(assert (= (and d!56779 res!91837) b!194313))

(declare-fun m!221327 () Bool)

(assert (=> d!56779 m!221327))

(assert (=> d!56779 m!221157))

(assert (=> d!56779 m!221177))

(assert (=> d!56779 m!221157))

(assert (=> d!56779 m!221159))

(declare-fun m!221329 () Bool)

(assert (=> d!56779 m!221329))

(assert (=> b!194211 d!56779))

(declare-fun d!56781 () Bool)

(assert (=> d!56781 (= (apply!188 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) lt!96916) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) lt!96916)))))

(declare-fun bs!7753 () Bool)

(assert (= bs!7753 d!56781))

(declare-fun m!221331 () Bool)

(assert (=> bs!7753 m!221331))

(assert (=> bs!7753 m!221331))

(declare-fun m!221333 () Bool)

(assert (=> bs!7753 m!221333))

(assert (=> b!194211 d!56781))

(declare-fun b!194323 () Bool)

(declare-fun res!91848 () Bool)

(declare-fun e!127840 () Bool)

(assert (=> b!194323 (=> (not res!91848) (not e!127840))))

(declare-fun size!4196 (LongMapFixedSize!2710) (_ BitVec 32))

(assert (=> b!194323 (= res!91848 (bvsge (size!4196 thiss!1248) (_size!1404 thiss!1248)))))

(declare-fun d!56783 () Bool)

(declare-fun res!91847 () Bool)

(assert (=> d!56783 (=> (not res!91847) (not e!127840))))

(assert (=> d!56783 (= res!91847 (validMask!0 (mask!9222 thiss!1248)))))

(assert (=> d!56783 (= (simpleValid!204 thiss!1248) e!127840)))

(declare-fun b!194322 () Bool)

(declare-fun res!91846 () Bool)

(assert (=> b!194322 (=> (not res!91846) (not e!127840))))

(assert (=> b!194322 (= res!91846 (and (= (size!4191 (_values!3942 thiss!1248)) (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001)) (= (size!4190 (_keys!5953 thiss!1248)) (size!4191 (_values!3942 thiss!1248))) (bvsge (_size!1404 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1404 thiss!1248) (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!194325 () Bool)

(assert (=> b!194325 (= e!127840 (and (bvsge (extraKeys!3696 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3696 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1404 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!194324 () Bool)

(declare-fun res!91849 () Bool)

(assert (=> b!194324 (=> (not res!91849) (not e!127840))))

(assert (=> b!194324 (= res!91849 (= (size!4196 thiss!1248) (bvadd (_size!1404 thiss!1248) (bvsdiv (bvadd (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!56783 res!91847) b!194322))

(assert (= (and b!194322 res!91846) b!194323))

(assert (= (and b!194323 res!91848) b!194324))

(assert (= (and b!194324 res!91849) b!194325))

(declare-fun m!221335 () Bool)

(assert (=> b!194323 m!221335))

(assert (=> d!56783 m!221011))

(assert (=> b!194324 m!221335))

(assert (=> d!56749 d!56783))

(declare-fun d!56785 () Bool)

(declare-fun e!127842 () Bool)

(assert (=> d!56785 e!127842))

(declare-fun res!91850 () Bool)

(assert (=> d!56785 (=> res!91850 e!127842)))

(declare-fun lt!96981 () Bool)

(assert (=> d!56785 (= res!91850 (not lt!96981))))

(declare-fun lt!96983 () Bool)

(assert (=> d!56785 (= lt!96981 lt!96983)))

(declare-fun lt!96980 () Unit!5858)

(declare-fun e!127841 () Unit!5858)

(assert (=> d!56785 (= lt!96980 e!127841)))

(declare-fun c!35056 () Bool)

(assert (=> d!56785 (= c!35056 lt!96983)))

(assert (=> d!56785 (= lt!96983 (containsKey!249 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56785 (= (contains!1363 lt!96864 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) lt!96981)))

(declare-fun b!194326 () Bool)

(declare-fun lt!96982 () Unit!5858)

(assert (=> b!194326 (= e!127841 lt!96982)))

(assert (=> b!194326 (= lt!96982 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194326 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194327 () Bool)

(declare-fun Unit!5870 () Unit!5858)

(assert (=> b!194327 (= e!127841 Unit!5870)))

(declare-fun b!194328 () Bool)

(assert (=> b!194328 (= e!127842 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56785 c!35056) b!194326))

(assert (= (and d!56785 (not c!35056)) b!194327))

(assert (= (and d!56785 (not res!91850)) b!194328))

(assert (=> d!56785 m!221041))

(declare-fun m!221337 () Bool)

(assert (=> d!56785 m!221337))

(assert (=> b!194326 m!221041))

(declare-fun m!221339 () Bool)

(assert (=> b!194326 m!221339))

(assert (=> b!194326 m!221041))

(declare-fun m!221341 () Bool)

(assert (=> b!194326 m!221341))

(assert (=> b!194326 m!221341))

(declare-fun m!221343 () Bool)

(assert (=> b!194326 m!221343))

(assert (=> b!194328 m!221041))

(assert (=> b!194328 m!221341))

(assert (=> b!194328 m!221341))

(assert (=> b!194328 m!221343))

(assert (=> b!194165 d!56785))

(declare-fun d!56787 () Bool)

(declare-fun e!127844 () Bool)

(assert (=> d!56787 e!127844))

(declare-fun res!91851 () Bool)

(assert (=> d!56787 (=> res!91851 e!127844)))

(declare-fun lt!96985 () Bool)

(assert (=> d!56787 (= res!91851 (not lt!96985))))

(declare-fun lt!96987 () Bool)

(assert (=> d!56787 (= lt!96985 lt!96987)))

(declare-fun lt!96984 () Unit!5858)

(declare-fun e!127843 () Unit!5858)

(assert (=> d!56787 (= lt!96984 e!127843)))

(declare-fun c!35057 () Bool)

(assert (=> d!56787 (= c!35057 lt!96987)))

(assert (=> d!56787 (= lt!96987 (containsKey!249 (toList!1226 lt!96885) (_1!1761 lt!96690)))))

(assert (=> d!56787 (= (contains!1363 lt!96885 (_1!1761 lt!96690)) lt!96985)))

(declare-fun b!194329 () Bool)

(declare-fun lt!96986 () Unit!5858)

(assert (=> b!194329 (= e!127843 lt!96986)))

(assert (=> b!194329 (= lt!96986 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96885) (_1!1761 lt!96690)))))

(assert (=> b!194329 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96885) (_1!1761 lt!96690)))))

(declare-fun b!194330 () Bool)

(declare-fun Unit!5871 () Unit!5858)

(assert (=> b!194330 (= e!127843 Unit!5871)))

(declare-fun b!194331 () Bool)

(assert (=> b!194331 (= e!127844 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96885) (_1!1761 lt!96690))))))

(assert (= (and d!56787 c!35057) b!194329))

(assert (= (and d!56787 (not c!35057)) b!194330))

(assert (= (and d!56787 (not res!91851)) b!194331))

(declare-fun m!221345 () Bool)

(assert (=> d!56787 m!221345))

(declare-fun m!221347 () Bool)

(assert (=> b!194329 m!221347))

(assert (=> b!194329 m!221105))

(assert (=> b!194329 m!221105))

(declare-fun m!221349 () Bool)

(assert (=> b!194329 m!221349))

(assert (=> b!194331 m!221105))

(assert (=> b!194331 m!221105))

(assert (=> b!194331 m!221349))

(assert (=> d!56731 d!56787))

(declare-fun b!194341 () Bool)

(declare-fun e!127849 () Option!252)

(declare-fun e!127850 () Option!252)

(assert (=> b!194341 (= e!127849 e!127850)))

(declare-fun c!35063 () Bool)

(assert (=> b!194341 (= c!35063 (and ((_ is Cons!2404) lt!96887) (not (= (_1!1761 (h!3045 lt!96887)) (_1!1761 lt!96690)))))))

(declare-fun b!194343 () Bool)

(assert (=> b!194343 (= e!127850 None!250)))

(declare-fun d!56789 () Bool)

(declare-fun c!35062 () Bool)

(assert (=> d!56789 (= c!35062 (and ((_ is Cons!2404) lt!96887) (= (_1!1761 (h!3045 lt!96887)) (_1!1761 lt!96690))))))

(assert (=> d!56789 (= (getValueByKey!246 lt!96887 (_1!1761 lt!96690)) e!127849)))

(declare-fun b!194342 () Bool)

(assert (=> b!194342 (= e!127850 (getValueByKey!246 (t!7326 lt!96887) (_1!1761 lt!96690)))))

(declare-fun b!194340 () Bool)

(assert (=> b!194340 (= e!127849 (Some!251 (_2!1761 (h!3045 lt!96887))))))

(assert (= (and d!56789 c!35062) b!194340))

(assert (= (and d!56789 (not c!35062)) b!194341))

(assert (= (and b!194341 c!35063) b!194342))

(assert (= (and b!194341 (not c!35063)) b!194343))

(declare-fun m!221351 () Bool)

(assert (=> b!194342 m!221351))

(assert (=> d!56731 d!56789))

(declare-fun d!56791 () Bool)

(assert (=> d!56791 (= (getValueByKey!246 lt!96887 (_1!1761 lt!96690)) (Some!251 (_2!1761 lt!96690)))))

(declare-fun lt!96990 () Unit!5858)

(declare-fun choose!1076 (List!2408 (_ BitVec 64) V!5633) Unit!5858)

(assert (=> d!56791 (= lt!96990 (choose!1076 lt!96887 (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(declare-fun e!127853 () Bool)

(assert (=> d!56791 e!127853))

(declare-fun res!91856 () Bool)

(assert (=> d!56791 (=> (not res!91856) (not e!127853))))

(declare-fun isStrictlySorted!344 (List!2408) Bool)

(assert (=> d!56791 (= res!91856 (isStrictlySorted!344 lt!96887))))

(assert (=> d!56791 (= (lemmaContainsTupThenGetReturnValue!133 lt!96887 (_1!1761 lt!96690) (_2!1761 lt!96690)) lt!96990)))

(declare-fun b!194348 () Bool)

(declare-fun res!91857 () Bool)

(assert (=> b!194348 (=> (not res!91857) (not e!127853))))

(assert (=> b!194348 (= res!91857 (containsKey!249 lt!96887 (_1!1761 lt!96690)))))

(declare-fun b!194349 () Bool)

(assert (=> b!194349 (= e!127853 (contains!1365 lt!96887 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(assert (= (and d!56791 res!91856) b!194348))

(assert (= (and b!194348 res!91857) b!194349))

(assert (=> d!56791 m!221099))

(declare-fun m!221353 () Bool)

(assert (=> d!56791 m!221353))

(declare-fun m!221355 () Bool)

(assert (=> d!56791 m!221355))

(declare-fun m!221357 () Bool)

(assert (=> b!194348 m!221357))

(declare-fun m!221359 () Bool)

(assert (=> b!194349 m!221359))

(assert (=> d!56731 d!56791))

(declare-fun b!194370 () Bool)

(declare-fun e!127865 () Bool)

(declare-fun lt!96993 () List!2408)

(assert (=> b!194370 (= e!127865 (contains!1365 lt!96993 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun bm!19638 () Bool)

(declare-fun call!19643 () List!2408)

(declare-fun call!19641 () List!2408)

(assert (=> bm!19638 (= call!19643 call!19641)))

(declare-fun b!194371 () Bool)

(declare-fun e!127864 () List!2408)

(assert (=> b!194371 (= e!127864 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96700)) (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(declare-fun b!194372 () Bool)

(declare-fun e!127868 () List!2408)

(declare-fun call!19642 () List!2408)

(assert (=> b!194372 (= e!127868 call!19642)))

(declare-fun b!194373 () Bool)

(declare-fun res!91862 () Bool)

(assert (=> b!194373 (=> (not res!91862) (not e!127865))))

(assert (=> b!194373 (= res!91862 (containsKey!249 lt!96993 (_1!1761 lt!96690)))))

(declare-fun bm!19639 () Bool)

(assert (=> bm!19639 (= call!19642 call!19643)))

(declare-fun b!194374 () Bool)

(declare-fun c!35074 () Bool)

(assert (=> b!194374 (= c!35074 (and ((_ is Cons!2404) (toList!1226 lt!96700)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96700))) (_1!1761 lt!96690))))))

(declare-fun e!127867 () List!2408)

(assert (=> b!194374 (= e!127867 e!127868)))

(declare-fun b!194375 () Bool)

(assert (=> b!194375 (= e!127867 call!19643)))

(declare-fun b!194376 () Bool)

(declare-fun e!127866 () List!2408)

(assert (=> b!194376 (= e!127866 e!127867)))

(declare-fun c!35072 () Bool)

(assert (=> b!194376 (= c!35072 (and ((_ is Cons!2404) (toList!1226 lt!96700)) (= (_1!1761 (h!3045 (toList!1226 lt!96700))) (_1!1761 lt!96690))))))

(declare-fun b!194378 () Bool)

(assert (=> b!194378 (= e!127868 call!19642)))

(declare-fun bm!19640 () Bool)

(declare-fun c!35075 () Bool)

(declare-fun $colon$colon!102 (List!2408 tuple2!3500) List!2408)

(assert (=> bm!19640 (= call!19641 ($colon$colon!102 e!127864 (ite c!35075 (h!3045 (toList!1226 lt!96700)) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690)))))))

(declare-fun c!35073 () Bool)

(assert (=> bm!19640 (= c!35073 c!35075)))

(declare-fun b!194379 () Bool)

(assert (=> b!194379 (= e!127866 call!19641)))

(declare-fun b!194377 () Bool)

(assert (=> b!194377 (= e!127864 (ite c!35072 (t!7326 (toList!1226 lt!96700)) (ite c!35074 (Cons!2404 (h!3045 (toList!1226 lt!96700)) (t!7326 (toList!1226 lt!96700))) Nil!2405)))))

(declare-fun d!56793 () Bool)

(assert (=> d!56793 e!127865))

(declare-fun res!91863 () Bool)

(assert (=> d!56793 (=> (not res!91863) (not e!127865))))

(assert (=> d!56793 (= res!91863 (isStrictlySorted!344 lt!96993))))

(assert (=> d!56793 (= lt!96993 e!127866)))

(assert (=> d!56793 (= c!35075 (and ((_ is Cons!2404) (toList!1226 lt!96700)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96700))) (_1!1761 lt!96690))))))

(assert (=> d!56793 (isStrictlySorted!344 (toList!1226 lt!96700))))

(assert (=> d!56793 (= (insertStrictlySorted!136 (toList!1226 lt!96700) (_1!1761 lt!96690) (_2!1761 lt!96690)) lt!96993)))

(assert (= (and d!56793 c!35075) b!194379))

(assert (= (and d!56793 (not c!35075)) b!194376))

(assert (= (and b!194376 c!35072) b!194375))

(assert (= (and b!194376 (not c!35072)) b!194374))

(assert (= (and b!194374 c!35074) b!194378))

(assert (= (and b!194374 (not c!35074)) b!194372))

(assert (= (or b!194378 b!194372) bm!19639))

(assert (= (or b!194375 bm!19639) bm!19638))

(assert (= (or b!194379 bm!19638) bm!19640))

(assert (= (and bm!19640 c!35073) b!194371))

(assert (= (and bm!19640 (not c!35073)) b!194377))

(assert (= (and d!56793 res!91863) b!194373))

(assert (= (and b!194373 res!91862) b!194370))

(declare-fun m!221361 () Bool)

(assert (=> b!194373 m!221361))

(declare-fun m!221363 () Bool)

(assert (=> b!194371 m!221363))

(declare-fun m!221365 () Bool)

(assert (=> bm!19640 m!221365))

(declare-fun m!221367 () Bool)

(assert (=> b!194370 m!221367))

(declare-fun m!221369 () Bool)

(assert (=> d!56793 m!221369))

(declare-fun m!221371 () Bool)

(assert (=> d!56793 m!221371))

(assert (=> d!56731 d!56793))

(declare-fun d!56795 () Bool)

(assert (=> d!56795 (= (apply!188 lt!96908 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2244 (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7754 () Bool)

(assert (= bs!7754 d!56795))

(declare-fun m!221373 () Bool)

(assert (=> bs!7754 m!221373))

(assert (=> bs!7754 m!221373))

(declare-fun m!221375 () Bool)

(assert (=> bs!7754 m!221375))

(assert (=> b!194215 d!56795))

(declare-fun d!56797 () Bool)

(declare-fun res!91868 () Bool)

(declare-fun e!127873 () Bool)

(assert (=> d!56797 (=> res!91868 e!127873)))

(assert (=> d!56797 (= res!91868 (and ((_ is Cons!2404) (toList!1226 lt!96696)) (= (_1!1761 (h!3045 (toList!1226 lt!96696))) key!828)))))

(assert (=> d!56797 (= (containsKey!249 (toList!1226 lt!96696) key!828) e!127873)))

(declare-fun b!194384 () Bool)

(declare-fun e!127874 () Bool)

(assert (=> b!194384 (= e!127873 e!127874)))

(declare-fun res!91869 () Bool)

(assert (=> b!194384 (=> (not res!91869) (not e!127874))))

(assert (=> b!194384 (= res!91869 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96696))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96696))) key!828)) ((_ is Cons!2404) (toList!1226 lt!96696)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96696))) key!828)))))

(declare-fun b!194385 () Bool)

(assert (=> b!194385 (= e!127874 (containsKey!249 (t!7326 (toList!1226 lt!96696)) key!828))))

(assert (= (and d!56797 (not res!91868)) b!194384))

(assert (= (and b!194384 res!91869) b!194385))

(declare-fun m!221377 () Bool)

(assert (=> b!194385 m!221377))

(assert (=> d!56717 d!56797))

(declare-fun d!56799 () Bool)

(assert (=> d!56799 (= (inRange!0 (ite c!35041 (index!4898 lt!96926) (index!4901 lt!96926)) (mask!9222 thiss!1248)) (and (bvsge (ite c!35041 (index!4898 lt!96926) (index!4901 lt!96926)) #b00000000000000000000000000000000) (bvslt (ite c!35041 (index!4898 lt!96926) (index!4901 lt!96926)) (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19628 d!56799))

(declare-fun d!56801 () Bool)

(declare-fun lt!96996 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!156 (List!2408) (InoxSet tuple2!3500))

(assert (=> d!56801 (= lt!96996 (select (content!156 (toList!1226 lt!96927)) lt!96690))))

(declare-fun e!127880 () Bool)

(assert (=> d!56801 (= lt!96996 e!127880)))

(declare-fun res!91874 () Bool)

(assert (=> d!56801 (=> (not res!91874) (not e!127880))))

(assert (=> d!56801 (= res!91874 ((_ is Cons!2404) (toList!1226 lt!96927)))))

(assert (=> d!56801 (= (contains!1365 (toList!1226 lt!96927) lt!96690) lt!96996)))

(declare-fun b!194390 () Bool)

(declare-fun e!127879 () Bool)

(assert (=> b!194390 (= e!127880 e!127879)))

(declare-fun res!91875 () Bool)

(assert (=> b!194390 (=> res!91875 e!127879)))

(assert (=> b!194390 (= res!91875 (= (h!3045 (toList!1226 lt!96927)) lt!96690))))

(declare-fun b!194391 () Bool)

(assert (=> b!194391 (= e!127879 (contains!1365 (t!7326 (toList!1226 lt!96927)) lt!96690))))

(assert (= (and d!56801 res!91874) b!194390))

(assert (= (and b!194390 (not res!91875)) b!194391))

(declare-fun m!221379 () Bool)

(assert (=> d!56801 m!221379))

(declare-fun m!221381 () Bool)

(assert (=> d!56801 m!221381))

(declare-fun m!221383 () Bool)

(assert (=> b!194391 m!221383))

(assert (=> b!194248 d!56801))

(declare-fun d!56803 () Bool)

(assert (=> d!56803 (= (apply!188 lt!96864 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2244 (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7755 () Bool)

(assert (= bs!7755 d!56803))

(declare-fun m!221385 () Bool)

(assert (=> bs!7755 m!221385))

(assert (=> bs!7755 m!221385))

(declare-fun m!221387 () Bool)

(assert (=> bs!7755 m!221387))

(assert (=> b!194169 d!56803))

(declare-fun b!194392 () Bool)

(assert (=> b!194392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> b!194392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4191 (_values!3942 thiss!1248))))))

(declare-fun e!127883 () Bool)

(declare-fun lt!97002 () ListLongMap!2421)

(assert (=> b!194392 (= e!127883 (= (apply!188 lt!97002 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19641 () Bool)

(declare-fun call!19644 () ListLongMap!2421)

(assert (=> bm!19641 (= call!19644 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194393 () Bool)

(declare-fun res!91878 () Bool)

(declare-fun e!127886 () Bool)

(assert (=> b!194393 (=> (not res!91878) (not e!127886))))

(assert (=> b!194393 (= res!91878 (not (contains!1363 lt!97002 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194394 () Bool)

(declare-fun e!127885 () Bool)

(assert (=> b!194394 (= e!127885 (= lt!97002 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(declare-fun d!56805 () Bool)

(assert (=> d!56805 e!127886))

(declare-fun res!91877 () Bool)

(assert (=> d!56805 (=> (not res!91877) (not e!127886))))

(assert (=> d!56805 (= res!91877 (not (contains!1363 lt!97002 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!127882 () ListLongMap!2421)

(assert (=> d!56805 (= lt!97002 e!127882)))

(declare-fun c!35077 () Bool)

(assert (=> d!56805 (= c!35077 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!56805 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56805 (= (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!97002)))

(declare-fun b!194395 () Bool)

(declare-fun e!127881 () Bool)

(assert (=> b!194395 (= e!127886 e!127881)))

(declare-fun c!35078 () Bool)

(declare-fun e!127884 () Bool)

(assert (=> b!194395 (= c!35078 e!127884)))

(declare-fun res!91876 () Bool)

(assert (=> b!194395 (=> (not res!91876) (not e!127884))))

(assert (=> b!194395 (= res!91876 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194396 () Bool)

(assert (=> b!194396 (= e!127882 (ListLongMap!2422 Nil!2405))))

(declare-fun b!194397 () Bool)

(declare-fun e!127887 () ListLongMap!2421)

(assert (=> b!194397 (= e!127882 e!127887)))

(declare-fun c!35079 () Bool)

(assert (=> b!194397 (= c!35079 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194398 () Bool)

(declare-fun lt!97003 () Unit!5858)

(declare-fun lt!96998 () Unit!5858)

(assert (=> b!194398 (= lt!97003 lt!96998)))

(declare-fun lt!96999 () (_ BitVec 64))

(declare-fun lt!96997 () V!5633)

(declare-fun lt!97001 () ListLongMap!2421)

(declare-fun lt!97000 () (_ BitVec 64))

(assert (=> b!194398 (not (contains!1363 (+!319 lt!97001 (tuple2!3501 lt!97000 lt!96997)) lt!96999))))

(assert (=> b!194398 (= lt!96998 (addStillNotContains!99 lt!97001 lt!97000 lt!96997 lt!96999))))

(assert (=> b!194398 (= lt!96999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194398 (= lt!96997 (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194398 (= lt!97000 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194398 (= lt!97001 call!19644)))

(assert (=> b!194398 (= e!127887 (+!319 call!19644 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194399 () Bool)

(assert (=> b!194399 (= e!127885 (isEmpty!493 lt!97002))))

(declare-fun b!194400 () Bool)

(assert (=> b!194400 (= e!127884 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194400 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!194401 () Bool)

(assert (=> b!194401 (= e!127881 e!127883)))

(assert (=> b!194401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!91879 () Bool)

(assert (=> b!194401 (= res!91879 (contains!1363 lt!97002 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194401 (=> (not res!91879) (not e!127883))))

(declare-fun b!194402 () Bool)

(assert (=> b!194402 (= e!127881 e!127885)))

(declare-fun c!35076 () Bool)

(assert (=> b!194402 (= c!35076 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194403 () Bool)

(assert (=> b!194403 (= e!127887 call!19644)))

(assert (= (and d!56805 c!35077) b!194396))

(assert (= (and d!56805 (not c!35077)) b!194397))

(assert (= (and b!194397 c!35079) b!194398))

(assert (= (and b!194397 (not c!35079)) b!194403))

(assert (= (or b!194398 b!194403) bm!19641))

(assert (= (and d!56805 res!91877) b!194393))

(assert (= (and b!194393 res!91878) b!194395))

(assert (= (and b!194395 res!91876) b!194400))

(assert (= (and b!194395 c!35078) b!194401))

(assert (= (and b!194395 (not c!35078)) b!194402))

(assert (= (and b!194401 res!91879) b!194392))

(assert (= (and b!194402 c!35076) b!194394))

(assert (= (and b!194402 (not c!35076)) b!194399))

(declare-fun b_lambda!7513 () Bool)

(assert (=> (not b_lambda!7513) (not b!194392)))

(assert (=> b!194392 t!7329))

(declare-fun b_and!11459 () Bool)

(assert (= b_and!11457 (and (=> t!7329 result!4931) b_and!11459)))

(declare-fun b_lambda!7515 () Bool)

(assert (=> (not b_lambda!7515) (not b!194398)))

(assert (=> b!194398 t!7329))

(declare-fun b_and!11461 () Bool)

(assert (= b_and!11459 (and (=> t!7329 result!4931) b_and!11461)))

(declare-fun m!221389 () Bool)

(assert (=> bm!19641 m!221389))

(assert (=> b!194398 m!221057))

(declare-fun m!221391 () Bool)

(assert (=> b!194398 m!221391))

(declare-fun m!221393 () Bool)

(assert (=> b!194398 m!221393))

(assert (=> b!194398 m!221055))

(assert (=> b!194398 m!221055))

(assert (=> b!194398 m!221057))

(assert (=> b!194398 m!221059))

(declare-fun m!221395 () Bool)

(assert (=> b!194398 m!221395))

(assert (=> b!194398 m!221041))

(assert (=> b!194398 m!221391))

(declare-fun m!221397 () Bool)

(assert (=> b!194398 m!221397))

(assert (=> b!194397 m!221041))

(assert (=> b!194397 m!221041))

(assert (=> b!194397 m!221049))

(declare-fun m!221399 () Bool)

(assert (=> b!194393 m!221399))

(declare-fun m!221401 () Bool)

(assert (=> d!56805 m!221401))

(assert (=> d!56805 m!221011))

(assert (=> b!194400 m!221041))

(assert (=> b!194400 m!221041))

(assert (=> b!194400 m!221049))

(assert (=> b!194401 m!221041))

(assert (=> b!194401 m!221041))

(declare-fun m!221403 () Bool)

(assert (=> b!194401 m!221403))

(declare-fun m!221405 () Bool)

(assert (=> b!194399 m!221405))

(assert (=> b!194394 m!221389))

(assert (=> b!194392 m!221057))

(assert (=> b!194392 m!221041))

(declare-fun m!221407 () Bool)

(assert (=> b!194392 m!221407))

(assert (=> b!194392 m!221055))

(assert (=> b!194392 m!221055))

(assert (=> b!194392 m!221057))

(assert (=> b!194392 m!221059))

(assert (=> b!194392 m!221041))

(assert (=> bm!19609 d!56805))

(declare-fun bm!19644 () Bool)

(declare-fun call!19647 () Bool)

(assert (=> bm!19644 (= call!19647 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun d!56807 () Bool)

(declare-fun res!91885 () Bool)

(declare-fun e!127896 () Bool)

(assert (=> d!56807 (=> res!91885 e!127896)))

(assert (=> d!56807 (= res!91885 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!56807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) e!127896)))

(declare-fun b!194412 () Bool)

(declare-fun e!127894 () Bool)

(assert (=> b!194412 (= e!127894 call!19647)))

(declare-fun b!194413 () Bool)

(declare-fun e!127895 () Bool)

(assert (=> b!194413 (= e!127895 e!127894)))

(declare-fun lt!97011 () (_ BitVec 64))

(assert (=> b!194413 (= lt!97011 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!97010 () Unit!5858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8215 (_ BitVec 64) (_ BitVec 32)) Unit!5858)

(assert (=> b!194413 (= lt!97010 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5953 thiss!1248) lt!97011 #b00000000000000000000000000000000))))

(assert (=> b!194413 (arrayContainsKey!0 (_keys!5953 thiss!1248) lt!97011 #b00000000000000000000000000000000)))

(declare-fun lt!97012 () Unit!5858)

(assert (=> b!194413 (= lt!97012 lt!97010)))

(declare-fun res!91884 () Bool)

(assert (=> b!194413 (= res!91884 (= (seekEntryOrOpen!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) (Found!682 #b00000000000000000000000000000000)))))

(assert (=> b!194413 (=> (not res!91884) (not e!127894))))

(declare-fun b!194414 () Bool)

(assert (=> b!194414 (= e!127895 call!19647)))

(declare-fun b!194415 () Bool)

(assert (=> b!194415 (= e!127896 e!127895)))

(declare-fun c!35082 () Bool)

(assert (=> b!194415 (= c!35082 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56807 (not res!91885)) b!194415))

(assert (= (and b!194415 c!35082) b!194413))

(assert (= (and b!194415 (not c!35082)) b!194414))

(assert (= (and b!194413 res!91884) b!194412))

(assert (= (or b!194412 b!194414) bm!19644))

(declare-fun m!221409 () Bool)

(assert (=> bm!19644 m!221409))

(assert (=> b!194413 m!221041))

(declare-fun m!221411 () Bool)

(assert (=> b!194413 m!221411))

(declare-fun m!221413 () Bool)

(assert (=> b!194413 m!221413))

(assert (=> b!194413 m!221041))

(declare-fun m!221415 () Bool)

(assert (=> b!194413 m!221415))

(assert (=> b!194415 m!221041))

(assert (=> b!194415 m!221041))

(assert (=> b!194415 m!221049))

(assert (=> b!194250 d!56807))

(declare-fun b!194428 () Bool)

(declare-fun e!127903 () SeekEntryResult!682)

(assert (=> b!194428 (= e!127903 Undefined!682)))

(declare-fun b!194429 () Bool)

(declare-fun e!127904 () SeekEntryResult!682)

(assert (=> b!194429 (= e!127904 (MissingVacant!682 (index!4900 lt!96805)))))

(declare-fun lt!97017 () SeekEntryResult!682)

(declare-fun d!56809 () Bool)

(assert (=> d!56809 (and (or ((_ is Undefined!682) lt!97017) (not ((_ is Found!682) lt!97017)) (and (bvsge (index!4899 lt!97017) #b00000000000000000000000000000000) (bvslt (index!4899 lt!97017) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!97017) ((_ is Found!682) lt!97017) (not ((_ is MissingVacant!682) lt!97017)) (not (= (index!4901 lt!97017) (index!4900 lt!96805))) (and (bvsge (index!4901 lt!97017) #b00000000000000000000000000000000) (bvslt (index!4901 lt!97017) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!97017) (ite ((_ is Found!682) lt!97017) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!97017)) key!828) (and ((_ is MissingVacant!682) lt!97017) (= (index!4901 lt!97017) (index!4900 lt!96805)) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4901 lt!97017)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56809 (= lt!97017 e!127903)))

(declare-fun c!35090 () Bool)

(assert (=> d!56809 (= c!35090 (bvsge (x!20678 lt!96805) #b01111111111111111111111111111110))))

(declare-fun lt!97018 () (_ BitVec 64))

(assert (=> d!56809 (= lt!97018 (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!96805)))))

(assert (=> d!56809 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56809 (= (seekKeyOrZeroReturnVacant!0 (x!20678 lt!96805) (index!4900 lt!96805) (index!4900 lt!96805) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) lt!97017)))

(declare-fun b!194430 () Bool)

(declare-fun c!35091 () Bool)

(assert (=> b!194430 (= c!35091 (= lt!97018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127905 () SeekEntryResult!682)

(assert (=> b!194430 (= e!127905 e!127904)))

(declare-fun b!194431 () Bool)

(assert (=> b!194431 (= e!127905 (Found!682 (index!4900 lt!96805)))))

(declare-fun b!194432 () Bool)

(assert (=> b!194432 (= e!127903 e!127905)))

(declare-fun c!35089 () Bool)

(assert (=> b!194432 (= c!35089 (= lt!97018 key!828))))

(declare-fun b!194433 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!194433 (= e!127904 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (nextIndex!0 (index!4900 lt!96805) (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (mask!9222 thiss!1248)) (index!4900 lt!96805) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(assert (= (and d!56809 c!35090) b!194428))

(assert (= (and d!56809 (not c!35090)) b!194432))

(assert (= (and b!194432 c!35089) b!194431))

(assert (= (and b!194432 (not c!35089)) b!194430))

(assert (= (and b!194430 c!35091) b!194429))

(assert (= (and b!194430 (not c!35091)) b!194433))

(declare-fun m!221417 () Bool)

(assert (=> d!56809 m!221417))

(declare-fun m!221419 () Bool)

(assert (=> d!56809 m!221419))

(assert (=> d!56809 m!221029))

(assert (=> d!56809 m!221011))

(declare-fun m!221421 () Bool)

(assert (=> b!194433 m!221421))

(assert (=> b!194433 m!221421))

(declare-fun m!221423 () Bool)

(assert (=> b!194433 m!221423))

(assert (=> b!194107 d!56809))

(declare-fun d!56811 () Bool)

(declare-fun e!127906 () Bool)

(assert (=> d!56811 e!127906))

(declare-fun res!91887 () Bool)

(assert (=> d!56811 (=> (not res!91887) (not e!127906))))

(declare-fun lt!97019 () ListLongMap!2421)

(assert (=> d!56811 (= res!91887 (contains!1363 lt!97019 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97021 () List!2408)

(assert (=> d!56811 (= lt!97019 (ListLongMap!2422 lt!97021))))

(declare-fun lt!97022 () Unit!5858)

(declare-fun lt!97020 () Unit!5858)

(assert (=> d!56811 (= lt!97022 lt!97020)))

(assert (=> d!56811 (= (getValueByKey!246 lt!97021 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56811 (= lt!97020 (lemmaContainsTupThenGetReturnValue!133 lt!97021 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56811 (= lt!97021 (insertStrictlySorted!136 (toList!1226 call!19613) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56811 (= (+!319 call!19613 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!97019)))

(declare-fun b!194434 () Bool)

(declare-fun res!91886 () Bool)

(assert (=> b!194434 (=> (not res!91886) (not e!127906))))

(assert (=> b!194434 (= res!91886 (= (getValueByKey!246 (toList!1226 lt!97019) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194435 () Bool)

(assert (=> b!194435 (= e!127906 (contains!1365 (toList!1226 lt!97019) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!56811 res!91887) b!194434))

(assert (= (and b!194434 res!91886) b!194435))

(declare-fun m!221425 () Bool)

(assert (=> d!56811 m!221425))

(declare-fun m!221427 () Bool)

(assert (=> d!56811 m!221427))

(declare-fun m!221429 () Bool)

(assert (=> d!56811 m!221429))

(declare-fun m!221431 () Bool)

(assert (=> d!56811 m!221431))

(declare-fun m!221433 () Bool)

(assert (=> b!194434 m!221433))

(declare-fun m!221435 () Bool)

(assert (=> b!194435 m!221435))

(assert (=> b!194173 d!56811))

(declare-fun d!56813 () Bool)

(declare-fun e!127907 () Bool)

(assert (=> d!56813 e!127907))

(declare-fun res!91889 () Bool)

(assert (=> d!56813 (=> (not res!91889) (not e!127907))))

(declare-fun lt!97023 () ListLongMap!2421)

(assert (=> d!56813 (= res!91889 (contains!1363 lt!97023 (_1!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun lt!97025 () List!2408)

(assert (=> d!56813 (= lt!97023 (ListLongMap!2422 lt!97025))))

(declare-fun lt!97026 () Unit!5858)

(declare-fun lt!97024 () Unit!5858)

(assert (=> d!56813 (= lt!97026 lt!97024)))

(assert (=> d!56813 (= (getValueByKey!246 lt!97025 (_1!1761 (tuple2!3501 key!828 v!309))) (Some!251 (_2!1761 (tuple2!3501 key!828 v!309))))))

(assert (=> d!56813 (= lt!97024 (lemmaContainsTupThenGetReturnValue!133 lt!97025 (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309))))))

(assert (=> d!56813 (= lt!97025 (insertStrictlySorted!136 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309))))))

(assert (=> d!56813 (= (+!319 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (tuple2!3501 key!828 v!309)) lt!97023)))

(declare-fun b!194436 () Bool)

(declare-fun res!91888 () Bool)

(assert (=> b!194436 (=> (not res!91888) (not e!127907))))

(assert (=> b!194436 (= res!91888 (= (getValueByKey!246 (toList!1226 lt!97023) (_1!1761 (tuple2!3501 key!828 v!309))) (Some!251 (_2!1761 (tuple2!3501 key!828 v!309)))))))

(declare-fun b!194437 () Bool)

(assert (=> b!194437 (= e!127907 (contains!1365 (toList!1226 lt!97023) (tuple2!3501 key!828 v!309)))))

(assert (= (and d!56813 res!91889) b!194436))

(assert (= (and b!194436 res!91888) b!194437))

(declare-fun m!221437 () Bool)

(assert (=> d!56813 m!221437))

(declare-fun m!221439 () Bool)

(assert (=> d!56813 m!221439))

(declare-fun m!221441 () Bool)

(assert (=> d!56813 m!221441))

(declare-fun m!221443 () Bool)

(assert (=> d!56813 m!221443))

(declare-fun m!221445 () Bool)

(assert (=> b!194436 m!221445))

(declare-fun m!221447 () Bool)

(assert (=> b!194437 m!221447))

(assert (=> b!194186 d!56813))

(assert (=> b!194186 d!56729))

(declare-fun call!19653 () ListLongMap!2421)

(declare-fun bm!19645 () Bool)

(assert (=> bm!19645 (= call!19653 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194438 () Bool)

(declare-fun e!127917 () Bool)

(assert (=> b!194438 (= e!127917 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19646 () Bool)

(declare-fun call!19648 () Bool)

(declare-fun lt!97036 () ListLongMap!2421)

(assert (=> bm!19646 (= call!19648 (contains!1363 lt!97036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194439 () Bool)

(declare-fun e!127913 () Bool)

(assert (=> b!194439 (= e!127913 (not call!19648))))

(declare-fun e!127918 () Bool)

(declare-fun b!194440 () Bool)

(assert (=> b!194440 (= e!127918 (= (apply!188 lt!97036 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2243 (select (arr!3867 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4191 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))))))))

(assert (=> b!194440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun bm!19647 () Bool)

(declare-fun call!19651 () Bool)

(assert (=> bm!19647 (= call!19651 (contains!1363 lt!97036 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194441 () Bool)

(declare-fun res!91890 () Bool)

(declare-fun e!127909 () Bool)

(assert (=> b!194441 (=> (not res!91890) (not e!127909))))

(declare-fun e!127920 () Bool)

(assert (=> b!194441 (= res!91890 e!127920)))

(declare-fun res!91898 () Bool)

(assert (=> b!194441 (=> res!91898 e!127920)))

(declare-fun e!127916 () Bool)

(assert (=> b!194441 (= res!91898 (not e!127916))))

(declare-fun res!91893 () Bool)

(assert (=> b!194441 (=> (not res!91893) (not e!127916))))

(assert (=> b!194441 (= res!91893 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun d!56815 () Bool)

(assert (=> d!56815 e!127909))

(declare-fun res!91896 () Bool)

(assert (=> d!56815 (=> (not res!91896) (not e!127909))))

(assert (=> d!56815 (= res!91896 (or (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))))

(declare-fun lt!97027 () ListLongMap!2421)

(assert (=> d!56815 (= lt!97036 lt!97027)))

(declare-fun lt!97039 () Unit!5858)

(declare-fun e!127912 () Unit!5858)

(assert (=> d!56815 (= lt!97039 e!127912)))

(declare-fun c!35093 () Bool)

(assert (=> d!56815 (= c!35093 e!127917)))

(declare-fun res!91895 () Bool)

(assert (=> d!56815 (=> (not res!91895) (not e!127917))))

(assert (=> d!56815 (= res!91895 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun e!127910 () ListLongMap!2421)

(assert (=> d!56815 (= lt!97027 e!127910)))

(declare-fun c!35097 () Bool)

(assert (=> d!56815 (= c!35097 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56815 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56815 (= (getCurrentListMap!878 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!97036)))

(declare-fun b!194442 () Bool)

(declare-fun e!127911 () Bool)

(assert (=> b!194442 (= e!127909 e!127911)))

(declare-fun c!35095 () Bool)

(assert (=> b!194442 (= c!35095 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194443 () Bool)

(declare-fun e!127919 () Bool)

(assert (=> b!194443 (= e!127911 e!127919)))

(declare-fun res!91892 () Bool)

(assert (=> b!194443 (= res!91892 call!19651)))

(assert (=> b!194443 (=> (not res!91892) (not e!127919))))

(declare-fun bm!19648 () Bool)

(declare-fun call!19650 () ListLongMap!2421)

(assert (=> bm!19648 (= call!19650 call!19653)))

(declare-fun b!194444 () Bool)

(declare-fun res!91894 () Bool)

(assert (=> b!194444 (=> (not res!91894) (not e!127909))))

(assert (=> b!194444 (= res!91894 e!127913)))

(declare-fun c!35092 () Bool)

(assert (=> b!194444 (= c!35092 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19649 () Bool)

(declare-fun call!19652 () ListLongMap!2421)

(declare-fun call!19649 () ListLongMap!2421)

(assert (=> bm!19649 (= call!19652 call!19649)))

(declare-fun b!194445 () Bool)

(declare-fun e!127915 () Bool)

(assert (=> b!194445 (= e!127913 e!127915)))

(declare-fun res!91897 () Bool)

(assert (=> b!194445 (= res!91897 call!19648)))

(assert (=> b!194445 (=> (not res!91897) (not e!127915))))

(declare-fun b!194446 () Bool)

(declare-fun Unit!5872 () Unit!5858)

(assert (=> b!194446 (= e!127912 Unit!5872)))

(declare-fun b!194447 () Bool)

(declare-fun lt!97032 () Unit!5858)

(assert (=> b!194447 (= e!127912 lt!97032)))

(declare-fun lt!97045 () ListLongMap!2421)

(assert (=> b!194447 (= lt!97045 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!97030 () (_ BitVec 64))

(assert (=> b!194447 (= lt!97030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97043 () (_ BitVec 64))

(assert (=> b!194447 (= lt!97043 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!97035 () Unit!5858)

(assert (=> b!194447 (= lt!97035 (addStillContains!164 lt!97045 lt!97030 (zeroValue!3800 thiss!1248) lt!97043))))

(assert (=> b!194447 (contains!1363 (+!319 lt!97045 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248))) lt!97043)))

(declare-fun lt!97031 () Unit!5858)

(assert (=> b!194447 (= lt!97031 lt!97035)))

(declare-fun lt!97048 () ListLongMap!2421)

(assert (=> b!194447 (= lt!97048 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!97040 () (_ BitVec 64))

(assert (=> b!194447 (= lt!97040 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97042 () (_ BitVec 64))

(assert (=> b!194447 (= lt!97042 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!97034 () Unit!5858)

(assert (=> b!194447 (= lt!97034 (addApplyDifferent!164 lt!97048 lt!97040 (minValue!3800 thiss!1248) lt!97042))))

(assert (=> b!194447 (= (apply!188 (+!319 lt!97048 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248))) lt!97042) (apply!188 lt!97048 lt!97042))))

(declare-fun lt!97029 () Unit!5858)

(assert (=> b!194447 (= lt!97029 lt!97034)))

(declare-fun lt!97047 () ListLongMap!2421)

(assert (=> b!194447 (= lt!97047 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!97038 () (_ BitVec 64))

(assert (=> b!194447 (= lt!97038 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97044 () (_ BitVec 64))

(assert (=> b!194447 (= lt!97044 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!97033 () Unit!5858)

(assert (=> b!194447 (= lt!97033 (addApplyDifferent!164 lt!97047 lt!97038 (zeroValue!3800 thiss!1248) lt!97044))))

(assert (=> b!194447 (= (apply!188 (+!319 lt!97047 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248))) lt!97044) (apply!188 lt!97047 lt!97044))))

(declare-fun lt!97046 () Unit!5858)

(assert (=> b!194447 (= lt!97046 lt!97033)))

(declare-fun lt!97041 () ListLongMap!2421)

(assert (=> b!194447 (= lt!97041 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!97037 () (_ BitVec 64))

(assert (=> b!194447 (= lt!97037 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97028 () (_ BitVec 64))

(assert (=> b!194447 (= lt!97028 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194447 (= lt!97032 (addApplyDifferent!164 lt!97041 lt!97037 (minValue!3800 thiss!1248) lt!97028))))

(assert (=> b!194447 (= (apply!188 (+!319 lt!97041 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248))) lt!97028) (apply!188 lt!97041 lt!97028))))

(declare-fun b!194448 () Bool)

(assert (=> b!194448 (= e!127920 e!127918)))

(declare-fun res!91891 () Bool)

(assert (=> b!194448 (=> (not res!91891) (not e!127918))))

(assert (=> b!194448 (= res!91891 (contains!1363 lt!97036 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194449 () Bool)

(assert (=> b!194449 (= e!127911 (not call!19651))))

(declare-fun b!194450 () Bool)

(declare-fun e!127914 () ListLongMap!2421)

(assert (=> b!194450 (= e!127910 e!127914)))

(declare-fun c!35096 () Bool)

(assert (=> b!194450 (= c!35096 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194451 () Bool)

(assert (=> b!194451 (= e!127919 (= (apply!188 lt!97036 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3800 thiss!1248)))))

(declare-fun b!194452 () Bool)

(assert (=> b!194452 (= e!127915 (= (apply!188 lt!97036 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3800 thiss!1248)))))

(declare-fun b!194453 () Bool)

(assert (=> b!194453 (= e!127914 call!19652)))

(declare-fun b!194454 () Bool)

(declare-fun e!127908 () ListLongMap!2421)

(assert (=> b!194454 (= e!127908 call!19652)))

(declare-fun bm!19650 () Bool)

(declare-fun call!19654 () ListLongMap!2421)

(assert (=> bm!19650 (= call!19649 (+!319 (ite c!35097 call!19653 (ite c!35096 call!19650 call!19654)) (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194455 () Bool)

(declare-fun c!35094 () Bool)

(assert (=> b!194455 (= c!35094 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!194455 (= e!127914 e!127908)))

(declare-fun b!194456 () Bool)

(assert (=> b!194456 (= e!127910 (+!319 call!19649 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!194457 () Bool)

(assert (=> b!194457 (= e!127908 call!19654)))

(declare-fun b!194458 () Bool)

(assert (=> b!194458 (= e!127916 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19651 () Bool)

(assert (=> bm!19651 (= call!19654 call!19650)))

(assert (= (and d!56815 c!35097) b!194456))

(assert (= (and d!56815 (not c!35097)) b!194450))

(assert (= (and b!194450 c!35096) b!194453))

(assert (= (and b!194450 (not c!35096)) b!194455))

(assert (= (and b!194455 c!35094) b!194454))

(assert (= (and b!194455 (not c!35094)) b!194457))

(assert (= (or b!194454 b!194457) bm!19651))

(assert (= (or b!194453 bm!19651) bm!19648))

(assert (= (or b!194453 b!194454) bm!19649))

(assert (= (or b!194456 bm!19648) bm!19645))

(assert (= (or b!194456 bm!19649) bm!19650))

(assert (= (and d!56815 res!91895) b!194438))

(assert (= (and d!56815 c!35093) b!194447))

(assert (= (and d!56815 (not c!35093)) b!194446))

(assert (= (and d!56815 res!91896) b!194441))

(assert (= (and b!194441 res!91893) b!194458))

(assert (= (and b!194441 (not res!91898)) b!194448))

(assert (= (and b!194448 res!91891) b!194440))

(assert (= (and b!194441 res!91890) b!194444))

(assert (= (and b!194444 c!35092) b!194445))

(assert (= (and b!194444 (not c!35092)) b!194439))

(assert (= (and b!194445 res!91897) b!194452))

(assert (= (or b!194445 b!194439) bm!19646))

(assert (= (and b!194444 res!91894) b!194442))

(assert (= (and b!194442 c!35095) b!194443))

(assert (= (and b!194442 (not c!35095)) b!194449))

(assert (= (and b!194443 res!91892) b!194451))

(assert (= (or b!194443 b!194449) bm!19647))

(declare-fun b_lambda!7517 () Bool)

(assert (=> (not b_lambda!7517) (not b!194440)))

(assert (=> b!194440 t!7329))

(declare-fun b_and!11463 () Bool)

(assert (= b_and!11461 (and (=> t!7329 result!4931) b_and!11463)))

(declare-fun m!221449 () Bool)

(assert (=> bm!19646 m!221449))

(assert (=> b!194448 m!221041))

(assert (=> b!194448 m!221041))

(declare-fun m!221451 () Bool)

(assert (=> b!194448 m!221451))

(declare-fun m!221453 () Bool)

(assert (=> bm!19647 m!221453))

(declare-fun m!221455 () Bool)

(assert (=> bm!19645 m!221455))

(assert (=> d!56815 m!221011))

(assert (=> b!194458 m!221041))

(assert (=> b!194458 m!221041))

(assert (=> b!194458 m!221049))

(declare-fun m!221457 () Bool)

(assert (=> b!194456 m!221457))

(declare-fun m!221459 () Bool)

(assert (=> bm!19650 m!221459))

(assert (=> b!194438 m!221041))

(assert (=> b!194438 m!221041))

(assert (=> b!194438 m!221049))

(declare-fun m!221461 () Bool)

(assert (=> b!194440 m!221461))

(assert (=> b!194440 m!221461))

(assert (=> b!194440 m!221057))

(declare-fun m!221463 () Bool)

(assert (=> b!194440 m!221463))

(assert (=> b!194440 m!221057))

(assert (=> b!194440 m!221041))

(assert (=> b!194440 m!221041))

(declare-fun m!221465 () Bool)

(assert (=> b!194440 m!221465))

(declare-fun m!221467 () Bool)

(assert (=> b!194452 m!221467))

(declare-fun m!221469 () Bool)

(assert (=> b!194447 m!221469))

(declare-fun m!221471 () Bool)

(assert (=> b!194447 m!221471))

(assert (=> b!194447 m!221471))

(declare-fun m!221473 () Bool)

(assert (=> b!194447 m!221473))

(declare-fun m!221475 () Bool)

(assert (=> b!194447 m!221475))

(declare-fun m!221477 () Bool)

(assert (=> b!194447 m!221477))

(declare-fun m!221479 () Bool)

(assert (=> b!194447 m!221479))

(declare-fun m!221481 () Bool)

(assert (=> b!194447 m!221481))

(assert (=> b!194447 m!221475))

(declare-fun m!221483 () Bool)

(assert (=> b!194447 m!221483))

(declare-fun m!221485 () Bool)

(assert (=> b!194447 m!221485))

(declare-fun m!221487 () Bool)

(assert (=> b!194447 m!221487))

(declare-fun m!221489 () Bool)

(assert (=> b!194447 m!221489))

(declare-fun m!221491 () Bool)

(assert (=> b!194447 m!221491))

(assert (=> b!194447 m!221041))

(assert (=> b!194447 m!221455))

(declare-fun m!221493 () Bool)

(assert (=> b!194447 m!221493))

(declare-fun m!221495 () Bool)

(assert (=> b!194447 m!221495))

(assert (=> b!194447 m!221489))

(declare-fun m!221497 () Bool)

(assert (=> b!194447 m!221497))

(assert (=> b!194447 m!221485))

(declare-fun m!221499 () Bool)

(assert (=> b!194451 m!221499))

(assert (=> b!194186 d!56815))

(assert (=> bm!19616 d!56751))

(declare-fun d!56817 () Bool)

(declare-fun e!127922 () Bool)

(assert (=> d!56817 e!127922))

(declare-fun res!91899 () Bool)

(assert (=> d!56817 (=> res!91899 e!127922)))

(declare-fun lt!97050 () Bool)

(assert (=> d!56817 (= res!91899 (not lt!97050))))

(declare-fun lt!97052 () Bool)

(assert (=> d!56817 (= lt!97050 lt!97052)))

(declare-fun lt!97049 () Unit!5858)

(declare-fun e!127921 () Unit!5858)

(assert (=> d!56817 (= lt!97049 e!127921)))

(declare-fun c!35098 () Bool)

(assert (=> d!56817 (= c!35098 lt!97052)))

(assert (=> d!56817 (= lt!97052 (containsKey!249 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56817 (= (contains!1363 lt!96908 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97050)))

(declare-fun b!194459 () Bool)

(declare-fun lt!97051 () Unit!5858)

(assert (=> b!194459 (= e!127921 lt!97051)))

(assert (=> b!194459 (= lt!97051 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194459 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194460 () Bool)

(declare-fun Unit!5873 () Unit!5858)

(assert (=> b!194460 (= e!127921 Unit!5873)))

(declare-fun b!194461 () Bool)

(assert (=> b!194461 (= e!127922 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56817 c!35098) b!194459))

(assert (= (and d!56817 (not c!35098)) b!194460))

(assert (= (and d!56817 (not res!91899)) b!194461))

(declare-fun m!221501 () Bool)

(assert (=> d!56817 m!221501))

(declare-fun m!221503 () Bool)

(assert (=> b!194459 m!221503))

(declare-fun m!221505 () Bool)

(assert (=> b!194459 m!221505))

(assert (=> b!194459 m!221505))

(declare-fun m!221507 () Bool)

(assert (=> b!194459 m!221507))

(assert (=> b!194461 m!221505))

(assert (=> b!194461 m!221505))

(assert (=> b!194461 m!221507))

(assert (=> bm!19617 d!56817))

(declare-fun b!194463 () Bool)

(declare-fun e!127923 () Option!252)

(declare-fun e!127924 () Option!252)

(assert (=> b!194463 (= e!127923 e!127924)))

(declare-fun c!35100 () Bool)

(assert (=> b!194463 (= c!35100 (and ((_ is Cons!2404) (toList!1226 lt!96885)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96885))) (_1!1761 lt!96690)))))))

(declare-fun b!194465 () Bool)

(assert (=> b!194465 (= e!127924 None!250)))

(declare-fun d!56819 () Bool)

(declare-fun c!35099 () Bool)

(assert (=> d!56819 (= c!35099 (and ((_ is Cons!2404) (toList!1226 lt!96885)) (= (_1!1761 (h!3045 (toList!1226 lt!96885))) (_1!1761 lt!96690))))))

(assert (=> d!56819 (= (getValueByKey!246 (toList!1226 lt!96885) (_1!1761 lt!96690)) e!127923)))

(declare-fun b!194464 () Bool)

(assert (=> b!194464 (= e!127924 (getValueByKey!246 (t!7326 (toList!1226 lt!96885)) (_1!1761 lt!96690)))))

(declare-fun b!194462 () Bool)

(assert (=> b!194462 (= e!127923 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96885)))))))

(assert (= (and d!56819 c!35099) b!194462))

(assert (= (and d!56819 (not c!35099)) b!194463))

(assert (= (and b!194463 c!35100) b!194464))

(assert (= (and b!194463 (not c!35100)) b!194465))

(declare-fun m!221509 () Bool)

(assert (=> b!194464 m!221509))

(assert (=> b!194182 d!56819))

(declare-fun d!56821 () Bool)

(declare-fun e!127926 () Bool)

(assert (=> d!56821 e!127926))

(declare-fun res!91900 () Bool)

(assert (=> d!56821 (=> res!91900 e!127926)))

(declare-fun lt!97054 () Bool)

(assert (=> d!56821 (= res!91900 (not lt!97054))))

(declare-fun lt!97056 () Bool)

(assert (=> d!56821 (= lt!97054 lt!97056)))

(declare-fun lt!97053 () Unit!5858)

(declare-fun e!127925 () Unit!5858)

(assert (=> d!56821 (= lt!97053 e!127925)))

(declare-fun c!35101 () Bool)

(assert (=> d!56821 (= c!35101 lt!97056)))

(assert (=> d!56821 (= lt!97056 (containsKey!249 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56821 (= (contains!1363 lt!96864 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97054)))

(declare-fun b!194466 () Bool)

(declare-fun lt!97055 () Unit!5858)

(assert (=> b!194466 (= e!127925 lt!97055)))

(assert (=> b!194466 (= lt!97055 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194466 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194467 () Bool)

(declare-fun Unit!5874 () Unit!5858)

(assert (=> b!194467 (= e!127925 Unit!5874)))

(declare-fun b!194468 () Bool)

(assert (=> b!194468 (= e!127926 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56821 c!35101) b!194466))

(assert (= (and d!56821 (not c!35101)) b!194467))

(assert (= (and d!56821 (not res!91900)) b!194468))

(declare-fun m!221511 () Bool)

(assert (=> d!56821 m!221511))

(declare-fun m!221513 () Bool)

(assert (=> b!194466 m!221513))

(declare-fun m!221515 () Bool)

(assert (=> b!194466 m!221515))

(assert (=> b!194466 m!221515))

(declare-fun m!221517 () Bool)

(assert (=> b!194466 m!221517))

(assert (=> b!194468 m!221515))

(assert (=> b!194468 m!221515))

(assert (=> b!194468 m!221517))

(assert (=> bm!19611 d!56821))

(declare-fun d!56823 () Bool)

(assert (=> d!56823 (= (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194175 d!56823))

(declare-fun d!56825 () Bool)

(assert (=> d!56825 (= (apply!188 lt!96908 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2244 (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7756 () Bool)

(assert (= bs!7756 d!56825))

(assert (=> bs!7756 m!221041))

(declare-fun m!221519 () Bool)

(assert (=> bs!7756 m!221519))

(assert (=> bs!7756 m!221519))

(declare-fun m!221521 () Bool)

(assert (=> bs!7756 m!221521))

(assert (=> b!194204 d!56825))

(declare-fun d!56827 () Bool)

(declare-fun c!35104 () Bool)

(assert (=> d!56827 (= c!35104 ((_ is ValueCellFull!1901) (select (arr!3867 lt!96689) #b00000000000000000000000000000000)))))

(declare-fun e!127929 () V!5633)

(assert (=> d!56827 (= (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!127929)))

(declare-fun b!194473 () Bool)

(declare-fun get!2245 (ValueCell!1901 V!5633) V!5633)

(assert (=> b!194473 (= e!127929 (get!2245 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194474 () Bool)

(declare-fun get!2246 (ValueCell!1901 V!5633) V!5633)

(assert (=> b!194474 (= e!127929 (get!2246 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56827 c!35104) b!194473))

(assert (= (and d!56827 (not c!35104)) b!194474))

(assert (=> b!194473 m!221147))

(assert (=> b!194473 m!221057))

(declare-fun m!221523 () Bool)

(assert (=> b!194473 m!221523))

(assert (=> b!194474 m!221147))

(assert (=> b!194474 m!221057))

(declare-fun m!221525 () Bool)

(assert (=> b!194474 m!221525))

(assert (=> b!194204 d!56827))

(assert (=> d!56721 d!56725))

(declare-fun d!56829 () Bool)

(declare-fun e!127932 () Bool)

(assert (=> d!56829 e!127932))

(declare-fun res!91905 () Bool)

(assert (=> d!56829 (=> (not res!91905) (not e!127932))))

(declare-fun lt!97059 () SeekEntryResult!682)

(assert (=> d!56829 (= res!91905 ((_ is Found!682) lt!97059))))

(assert (=> d!56829 (= lt!97059 (seekEntryOrOpen!0 key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(assert (=> d!56829 true))

(declare-fun _$33!150 () Unit!5858)

(assert (=> d!56829 (= (choose!1070 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)) _$33!150)))

(declare-fun b!194479 () Bool)

(declare-fun res!91906 () Bool)

(assert (=> b!194479 (=> (not res!91906) (not e!127932))))

(assert (=> b!194479 (= res!91906 (inRange!0 (index!4899 lt!97059) (mask!9222 thiss!1248)))))

(declare-fun b!194480 () Bool)

(assert (=> b!194480 (= e!127932 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!97059)) key!828))))

(assert (= (and d!56829 res!91905) b!194479))

(assert (= (and b!194479 res!91906) b!194480))

(assert (=> d!56829 m!220909))

(declare-fun m!221527 () Bool)

(assert (=> b!194479 m!221527))

(declare-fun m!221529 () Bool)

(assert (=> b!194480 m!221529))

(assert (=> d!56721 d!56829))

(declare-fun d!56831 () Bool)

(assert (=> d!56831 (= (validMask!0 (mask!9222 thiss!1248)) (and (or (= (mask!9222 thiss!1248) #b00000000000000000000000000000111) (= (mask!9222 thiss!1248) #b00000000000000000000000000001111) (= (mask!9222 thiss!1248) #b00000000000000000000000000011111) (= (mask!9222 thiss!1248) #b00000000000000000000000000111111) (= (mask!9222 thiss!1248) #b00000000000000000000000001111111) (= (mask!9222 thiss!1248) #b00000000000000000000000011111111) (= (mask!9222 thiss!1248) #b00000000000000000000000111111111) (= (mask!9222 thiss!1248) #b00000000000000000000001111111111) (= (mask!9222 thiss!1248) #b00000000000000000000011111111111) (= (mask!9222 thiss!1248) #b00000000000000000000111111111111) (= (mask!9222 thiss!1248) #b00000000000000000001111111111111) (= (mask!9222 thiss!1248) #b00000000000000000011111111111111) (= (mask!9222 thiss!1248) #b00000000000000000111111111111111) (= (mask!9222 thiss!1248) #b00000000000000001111111111111111) (= (mask!9222 thiss!1248) #b00000000000000011111111111111111) (= (mask!9222 thiss!1248) #b00000000000000111111111111111111) (= (mask!9222 thiss!1248) #b00000000000001111111111111111111) (= (mask!9222 thiss!1248) #b00000000000011111111111111111111) (= (mask!9222 thiss!1248) #b00000000000111111111111111111111) (= (mask!9222 thiss!1248) #b00000000001111111111111111111111) (= (mask!9222 thiss!1248) #b00000000011111111111111111111111) (= (mask!9222 thiss!1248) #b00000000111111111111111111111111) (= (mask!9222 thiss!1248) #b00000001111111111111111111111111) (= (mask!9222 thiss!1248) #b00000011111111111111111111111111) (= (mask!9222 thiss!1248) #b00000111111111111111111111111111) (= (mask!9222 thiss!1248) #b00001111111111111111111111111111) (= (mask!9222 thiss!1248) #b00011111111111111111111111111111) (= (mask!9222 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9222 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!56721 d!56831))

(declare-fun d!56833 () Bool)

(declare-fun res!91907 () Bool)

(declare-fun e!127933 () Bool)

(assert (=> d!56833 (=> res!91907 e!127933)))

(assert (=> d!56833 (= res!91907 (and ((_ is Cons!2404) (toList!1226 lt!96701)) (= (_1!1761 (h!3045 (toList!1226 lt!96701))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(assert (=> d!56833 (= (containsKey!249 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) e!127933)))

(declare-fun b!194481 () Bool)

(declare-fun e!127934 () Bool)

(assert (=> b!194481 (= e!127933 e!127934)))

(declare-fun res!91908 () Bool)

(assert (=> b!194481 (=> (not res!91908) (not e!127934))))

(assert (=> b!194481 (= res!91908 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96701))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96701))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))) ((_ is Cons!2404) (toList!1226 lt!96701)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96701))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(declare-fun b!194482 () Bool)

(assert (=> b!194482 (= e!127934 (containsKey!249 (t!7326 (toList!1226 lt!96701)) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (= (and d!56833 (not res!91907)) b!194481))

(assert (= (and b!194481 res!91908) b!194482))

(assert (=> b!194482 m!220871))

(declare-fun m!221531 () Bool)

(assert (=> b!194482 m!221531))

(assert (=> d!56735 d!56833))

(declare-fun b!194484 () Bool)

(declare-fun res!91911 () Bool)

(declare-fun e!127935 () Bool)

(assert (=> b!194484 (=> (not res!91911) (not e!127935))))

(assert (=> b!194484 (= res!91911 (bvsge (size!4196 lt!96692) (_size!1404 lt!96692)))))

(declare-fun d!56835 () Bool)

(declare-fun res!91910 () Bool)

(assert (=> d!56835 (=> (not res!91910) (not e!127935))))

(assert (=> d!56835 (= res!91910 (validMask!0 (mask!9222 lt!96692)))))

(assert (=> d!56835 (= (simpleValid!204 lt!96692) e!127935)))

(declare-fun b!194483 () Bool)

(declare-fun res!91909 () Bool)

(assert (=> b!194483 (=> (not res!91909) (not e!127935))))

(assert (=> b!194483 (= res!91909 (and (= (size!4191 (_values!3942 lt!96692)) (bvadd (mask!9222 lt!96692) #b00000000000000000000000000000001)) (= (size!4190 (_keys!5953 lt!96692)) (size!4191 (_values!3942 lt!96692))) (bvsge (_size!1404 lt!96692) #b00000000000000000000000000000000) (bvsle (_size!1404 lt!96692) (bvadd (mask!9222 lt!96692) #b00000000000000000000000000000001))))))

(declare-fun b!194486 () Bool)

(assert (=> b!194486 (= e!127935 (and (bvsge (extraKeys!3696 lt!96692) #b00000000000000000000000000000000) (bvsle (extraKeys!3696 lt!96692) #b00000000000000000000000000000011) (bvsge (_vacant!1404 lt!96692) #b00000000000000000000000000000000)))))

(declare-fun b!194485 () Bool)

(declare-fun res!91912 () Bool)

(assert (=> b!194485 (=> (not res!91912) (not e!127935))))

(assert (=> b!194485 (= res!91912 (= (size!4196 lt!96692) (bvadd (_size!1404 lt!96692) (bvsdiv (bvadd (extraKeys!3696 lt!96692) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!56835 res!91910) b!194483))

(assert (= (and b!194483 res!91909) b!194484))

(assert (= (and b!194484 res!91911) b!194485))

(assert (= (and b!194485 res!91912) b!194486))

(declare-fun m!221533 () Bool)

(assert (=> b!194484 m!221533))

(declare-fun m!221535 () Bool)

(assert (=> d!56835 m!221535))

(assert (=> b!194485 m!221533))

(assert (=> d!56737 d!56835))

(declare-fun bm!19652 () Bool)

(declare-fun call!19655 () Bool)

(assert (=> bm!19652 (= call!19655 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5953 lt!96692) (mask!9222 lt!96692)))))

(declare-fun d!56837 () Bool)

(declare-fun res!91914 () Bool)

(declare-fun e!127938 () Bool)

(assert (=> d!56837 (=> res!91914 e!127938)))

(assert (=> d!56837 (= res!91914 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!56837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5953 lt!96692) (mask!9222 lt!96692)) e!127938)))

(declare-fun b!194487 () Bool)

(declare-fun e!127936 () Bool)

(assert (=> b!194487 (= e!127936 call!19655)))

(declare-fun b!194488 () Bool)

(declare-fun e!127937 () Bool)

(assert (=> b!194488 (= e!127937 e!127936)))

(declare-fun lt!97061 () (_ BitVec 64))

(assert (=> b!194488 (= lt!97061 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000))))

(declare-fun lt!97060 () Unit!5858)

(assert (=> b!194488 (= lt!97060 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5953 lt!96692) lt!97061 #b00000000000000000000000000000000))))

(assert (=> b!194488 (arrayContainsKey!0 (_keys!5953 lt!96692) lt!97061 #b00000000000000000000000000000000)))

(declare-fun lt!97062 () Unit!5858)

(assert (=> b!194488 (= lt!97062 lt!97060)))

(declare-fun res!91913 () Bool)

(assert (=> b!194488 (= res!91913 (= (seekEntryOrOpen!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) (_keys!5953 lt!96692) (mask!9222 lt!96692)) (Found!682 #b00000000000000000000000000000000)))))

(assert (=> b!194488 (=> (not res!91913) (not e!127936))))

(declare-fun b!194489 () Bool)

(assert (=> b!194489 (= e!127937 call!19655)))

(declare-fun b!194490 () Bool)

(assert (=> b!194490 (= e!127938 e!127937)))

(declare-fun c!35105 () Bool)

(assert (=> b!194490 (= c!35105 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (= (and d!56837 (not res!91914)) b!194490))

(assert (= (and b!194490 c!35105) b!194488))

(assert (= (and b!194490 (not c!35105)) b!194489))

(assert (= (and b!194488 res!91913) b!194487))

(assert (= (or b!194487 b!194489) bm!19652))

(declare-fun m!221537 () Bool)

(assert (=> bm!19652 m!221537))

(declare-fun m!221539 () Bool)

(assert (=> b!194488 m!221539))

(declare-fun m!221541 () Bool)

(assert (=> b!194488 m!221541))

(declare-fun m!221543 () Bool)

(assert (=> b!194488 m!221543))

(assert (=> b!194488 m!221539))

(declare-fun m!221545 () Bool)

(assert (=> b!194488 m!221545))

(assert (=> b!194490 m!221539))

(assert (=> b!194490 m!221539))

(declare-fun m!221547 () Bool)

(assert (=> b!194490 m!221547))

(assert (=> b!194197 d!56837))

(declare-fun b!194509 () Bool)

(declare-fun e!127953 () SeekEntryResult!682)

(assert (=> b!194509 (= e!127953 (Intermediate!682 false (toIndex!0 key!828 (mask!9222 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!194510 () Bool)

(declare-fun e!127951 () SeekEntryResult!682)

(assert (=> b!194510 (= e!127951 (Intermediate!682 true (toIndex!0 key!828 (mask!9222 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!194511 () Bool)

(assert (=> b!194511 (= e!127953 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9222 thiss!1248)) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun b!194512 () Bool)

(declare-fun lt!97068 () SeekEntryResult!682)

(assert (=> b!194512 (and (bvsge (index!4900 lt!97068) #b00000000000000000000000000000000) (bvslt (index!4900 lt!97068) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun e!127949 () Bool)

(assert (=> b!194512 (= e!127949 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!97068)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!56839 () Bool)

(declare-fun e!127950 () Bool)

(assert (=> d!56839 e!127950))

(declare-fun c!35113 () Bool)

(assert (=> d!56839 (= c!35113 (and ((_ is Intermediate!682) lt!97068) (undefined!1494 lt!97068)))))

(assert (=> d!56839 (= lt!97068 e!127951)))

(declare-fun c!35112 () Bool)

(assert (=> d!56839 (= c!35112 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!97067 () (_ BitVec 64))

(assert (=> d!56839 (= lt!97067 (select (arr!3866 (_keys!5953 thiss!1248)) (toIndex!0 key!828 (mask!9222 thiss!1248))))))

(assert (=> d!56839 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9222 thiss!1248)) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) lt!97068)))

(declare-fun b!194513 () Bool)

(assert (=> b!194513 (= e!127951 e!127953)))

(declare-fun c!35114 () Bool)

(assert (=> b!194513 (= c!35114 (or (= lt!97067 key!828) (= (bvadd lt!97067 lt!97067) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194514 () Bool)

(assert (=> b!194514 (and (bvsge (index!4900 lt!97068) #b00000000000000000000000000000000) (bvslt (index!4900 lt!97068) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!91922 () Bool)

(assert (=> b!194514 (= res!91922 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!97068)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194514 (=> res!91922 e!127949)))

(declare-fun b!194515 () Bool)

(assert (=> b!194515 (= e!127950 (bvsge (x!20678 lt!97068) #b01111111111111111111111111111110))))

(declare-fun b!194516 () Bool)

(declare-fun e!127952 () Bool)

(assert (=> b!194516 (= e!127950 e!127952)))

(declare-fun res!91921 () Bool)

(assert (=> b!194516 (= res!91921 (and ((_ is Intermediate!682) lt!97068) (not (undefined!1494 lt!97068)) (bvslt (x!20678 lt!97068) #b01111111111111111111111111111110) (bvsge (x!20678 lt!97068) #b00000000000000000000000000000000) (bvsge (x!20678 lt!97068) #b00000000000000000000000000000000)))))

(assert (=> b!194516 (=> (not res!91921) (not e!127952))))

(declare-fun b!194517 () Bool)

(assert (=> b!194517 (and (bvsge (index!4900 lt!97068) #b00000000000000000000000000000000) (bvslt (index!4900 lt!97068) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!91923 () Bool)

(assert (=> b!194517 (= res!91923 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!97068)) key!828))))

(assert (=> b!194517 (=> res!91923 e!127949)))

(assert (=> b!194517 (= e!127952 e!127949)))

(assert (= (and d!56839 c!35112) b!194510))

(assert (= (and d!56839 (not c!35112)) b!194513))

(assert (= (and b!194513 c!35114) b!194509))

(assert (= (and b!194513 (not c!35114)) b!194511))

(assert (= (and d!56839 c!35113) b!194515))

(assert (= (and d!56839 (not c!35113)) b!194516))

(assert (= (and b!194516 res!91921) b!194517))

(assert (= (and b!194517 (not res!91923)) b!194514))

(assert (= (and b!194514 (not res!91922)) b!194512))

(declare-fun m!221549 () Bool)

(assert (=> b!194512 m!221549))

(assert (=> b!194517 m!221549))

(assert (=> d!56839 m!221023))

(declare-fun m!221551 () Bool)

(assert (=> d!56839 m!221551))

(assert (=> d!56839 m!221011))

(assert (=> b!194511 m!221023))

(declare-fun m!221553 () Bool)

(assert (=> b!194511 m!221553))

(assert (=> b!194511 m!221553))

(declare-fun m!221555 () Bool)

(assert (=> b!194511 m!221555))

(assert (=> b!194514 m!221549))

(assert (=> d!56725 d!56839))

(declare-fun d!56841 () Bool)

(declare-fun lt!97074 () (_ BitVec 32))

(declare-fun lt!97073 () (_ BitVec 32))

(assert (=> d!56841 (= lt!97074 (bvmul (bvxor lt!97073 (bvlshr lt!97073 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56841 (= lt!97073 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56841 (and (bvsge (mask!9222 thiss!1248) #b00000000000000000000000000000000) (let ((res!91924 (let ((h!3048 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20706 (bvmul (bvxor h!3048 (bvlshr h!3048 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20706 (bvlshr x!20706 #b00000000000000000000000000001101)) (mask!9222 thiss!1248)))))) (and (bvslt res!91924 (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!91924 #b00000000000000000000000000000000))))))

(assert (=> d!56841 (= (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvand (bvxor lt!97074 (bvlshr lt!97074 #b00000000000000000000000000001101)) (mask!9222 thiss!1248)))))

(assert (=> d!56725 d!56841))

(assert (=> d!56725 d!56831))

(declare-fun b!194529 () Bool)

(declare-fun e!127963 () Bool)

(declare-fun call!19658 () Bool)

(assert (=> b!194529 (= e!127963 call!19658)))

(declare-fun b!194530 () Bool)

(declare-fun e!127965 () Bool)

(assert (=> b!194530 (= e!127965 e!127963)))

(declare-fun c!35117 () Bool)

(assert (=> b!194530 (= c!35117 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun b!194531 () Bool)

(assert (=> b!194531 (= e!127963 call!19658)))

(declare-fun bm!19655 () Bool)

(assert (=> bm!19655 (= call!19658 (arrayNoDuplicates!0 (_keys!5953 lt!96692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35117 (Cons!2406 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) Nil!2407) Nil!2407)))))

(declare-fun b!194532 () Bool)

(declare-fun e!127962 () Bool)

(declare-fun contains!1366 (List!2410 (_ BitVec 64)) Bool)

(assert (=> b!194532 (= e!127962 (contains!1366 Nil!2407 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun d!56843 () Bool)

(declare-fun res!91932 () Bool)

(declare-fun e!127964 () Bool)

(assert (=> d!56843 (=> res!91932 e!127964)))

(assert (=> d!56843 (= res!91932 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!56843 (= (arrayNoDuplicates!0 (_keys!5953 lt!96692) #b00000000000000000000000000000000 Nil!2407) e!127964)))

(declare-fun b!194528 () Bool)

(assert (=> b!194528 (= e!127964 e!127965)))

(declare-fun res!91933 () Bool)

(assert (=> b!194528 (=> (not res!91933) (not e!127965))))

(assert (=> b!194528 (= res!91933 (not e!127962))))

(declare-fun res!91931 () Bool)

(assert (=> b!194528 (=> (not res!91931) (not e!127962))))

(assert (=> b!194528 (= res!91931 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (= (and d!56843 (not res!91932)) b!194528))

(assert (= (and b!194528 res!91931) b!194532))

(assert (= (and b!194528 res!91933) b!194530))

(assert (= (and b!194530 c!35117) b!194529))

(assert (= (and b!194530 (not c!35117)) b!194531))

(assert (= (or b!194529 b!194531) bm!19655))

(assert (=> b!194530 m!221539))

(assert (=> b!194530 m!221539))

(assert (=> b!194530 m!221547))

(assert (=> bm!19655 m!221539))

(declare-fun m!221557 () Bool)

(assert (=> bm!19655 m!221557))

(assert (=> b!194532 m!221539))

(assert (=> b!194532 m!221539))

(declare-fun m!221559 () Bool)

(assert (=> b!194532 m!221559))

(assert (=> b!194528 m!221539))

(assert (=> b!194528 m!221539))

(assert (=> b!194528 m!221547))

(assert (=> b!194198 d!56843))

(declare-fun d!56845 () Bool)

(declare-fun isEmpty!494 (Option!252) Bool)

(assert (=> d!56845 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96696) key!828)) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96696) key!828))))))

(declare-fun bs!7757 () Bool)

(assert (= bs!7757 d!56845))

(assert (=> bs!7757 m!221003))

(declare-fun m!221561 () Bool)

(assert (=> bs!7757 m!221561))

(assert (=> b!194085 d!56845))

(declare-fun b!194534 () Bool)

(declare-fun e!127966 () Option!252)

(declare-fun e!127967 () Option!252)

(assert (=> b!194534 (= e!127966 e!127967)))

(declare-fun c!35119 () Bool)

(assert (=> b!194534 (= c!35119 (and ((_ is Cons!2404) (toList!1226 lt!96696)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96696))) key!828))))))

(declare-fun b!194536 () Bool)

(assert (=> b!194536 (= e!127967 None!250)))

(declare-fun d!56847 () Bool)

(declare-fun c!35118 () Bool)

(assert (=> d!56847 (= c!35118 (and ((_ is Cons!2404) (toList!1226 lt!96696)) (= (_1!1761 (h!3045 (toList!1226 lt!96696))) key!828)))))

(assert (=> d!56847 (= (getValueByKey!246 (toList!1226 lt!96696) key!828) e!127966)))

(declare-fun b!194535 () Bool)

(assert (=> b!194535 (= e!127967 (getValueByKey!246 (t!7326 (toList!1226 lt!96696)) key!828))))

(declare-fun b!194533 () Bool)

(assert (=> b!194533 (= e!127966 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96696)))))))

(assert (= (and d!56847 c!35118) b!194533))

(assert (= (and d!56847 (not c!35118)) b!194534))

(assert (= (and b!194534 c!35119) b!194535))

(assert (= (and b!194534 (not c!35119)) b!194536))

(declare-fun m!221563 () Bool)

(assert (=> b!194535 m!221563))

(assert (=> b!194085 d!56847))

(declare-fun d!56849 () Bool)

(declare-fun e!127968 () Bool)

(assert (=> d!56849 e!127968))

(declare-fun res!91935 () Bool)

(assert (=> d!56849 (=> (not res!91935) (not e!127968))))

(declare-fun lt!97075 () ListLongMap!2421)

(assert (=> d!56849 (= res!91935 (contains!1363 lt!97075 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97077 () List!2408)

(assert (=> d!56849 (= lt!97075 (ListLongMap!2422 lt!97077))))

(declare-fun lt!97078 () Unit!5858)

(declare-fun lt!97076 () Unit!5858)

(assert (=> d!56849 (= lt!97078 lt!97076)))

(assert (=> d!56849 (= (getValueByKey!246 lt!97077 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(assert (=> d!56849 (= lt!97076 (lemmaContainsTupThenGetReturnValue!133 lt!97077 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(assert (=> d!56849 (= lt!97077 (insertStrictlySorted!136 (toList!1226 lt!96869) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(assert (=> d!56849 (= (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) lt!97075)))

(declare-fun b!194537 () Bool)

(declare-fun res!91934 () Bool)

(assert (=> b!194537 (=> (not res!91934) (not e!127968))))

(assert (=> b!194537 (= res!91934 (= (getValueByKey!246 (toList!1226 lt!97075) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(declare-fun b!194538 () Bool)

(assert (=> b!194538 (= e!127968 (contains!1365 (toList!1226 lt!97075) (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))

(assert (= (and d!56849 res!91935) b!194537))

(assert (= (and b!194537 res!91934) b!194538))

(declare-fun m!221565 () Bool)

(assert (=> d!56849 m!221565))

(declare-fun m!221567 () Bool)

(assert (=> d!56849 m!221567))

(declare-fun m!221569 () Bool)

(assert (=> d!56849 m!221569))

(declare-fun m!221571 () Bool)

(assert (=> d!56849 m!221571))

(declare-fun m!221573 () Bool)

(assert (=> b!194537 m!221573))

(declare-fun m!221575 () Bool)

(assert (=> b!194538 m!221575))

(assert (=> b!194164 d!56849))

(assert (=> b!194164 d!56805))

(declare-fun d!56851 () Bool)

(assert (=> d!56851 (= (apply!188 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) lt!96856) (apply!188 lt!96869 lt!96856))))

(declare-fun lt!97079 () Unit!5858)

(assert (=> d!56851 (= lt!97079 (choose!1074 lt!96869 lt!96865 (minValue!3800 thiss!1248) lt!96856))))

(declare-fun e!127969 () Bool)

(assert (=> d!56851 e!127969))

(declare-fun res!91936 () Bool)

(assert (=> d!56851 (=> (not res!91936) (not e!127969))))

(assert (=> d!56851 (= res!91936 (contains!1363 lt!96869 lt!96856))))

(assert (=> d!56851 (= (addApplyDifferent!164 lt!96869 lt!96865 (minValue!3800 thiss!1248) lt!96856) lt!97079)))

(declare-fun b!194539 () Bool)

(assert (=> b!194539 (= e!127969 (not (= lt!96856 lt!96865)))))

(assert (= (and d!56851 res!91936) b!194539))

(declare-fun m!221577 () Bool)

(assert (=> d!56851 m!221577))

(assert (=> d!56851 m!221081))

(assert (=> d!56851 m!221091))

(assert (=> d!56851 m!221081))

(assert (=> d!56851 m!221083))

(declare-fun m!221579 () Bool)

(assert (=> d!56851 m!221579))

(assert (=> b!194164 d!56851))

(declare-fun d!56853 () Bool)

(declare-fun e!127970 () Bool)

(assert (=> d!56853 e!127970))

(declare-fun res!91938 () Bool)

(assert (=> d!56853 (=> (not res!91938) (not e!127970))))

(declare-fun lt!97080 () ListLongMap!2421)

(assert (=> d!56853 (= res!91938 (contains!1363 lt!97080 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97082 () List!2408)

(assert (=> d!56853 (= lt!97080 (ListLongMap!2422 lt!97082))))

(declare-fun lt!97083 () Unit!5858)

(declare-fun lt!97081 () Unit!5858)

(assert (=> d!56853 (= lt!97083 lt!97081)))

(assert (=> d!56853 (= (getValueByKey!246 lt!97082 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56853 (= lt!97081 (lemmaContainsTupThenGetReturnValue!133 lt!97082 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56853 (= lt!97082 (insertStrictlySorted!136 (toList!1226 lt!96875) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56853 (= (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) lt!97080)))

(declare-fun b!194540 () Bool)

(declare-fun res!91937 () Bool)

(assert (=> b!194540 (=> (not res!91937) (not e!127970))))

(assert (=> b!194540 (= res!91937 (= (getValueByKey!246 (toList!1226 lt!97080) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194541 () Bool)

(assert (=> b!194541 (= e!127970 (contains!1365 (toList!1226 lt!97080) (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56853 res!91938) b!194540))

(assert (= (and b!194540 res!91937) b!194541))

(declare-fun m!221581 () Bool)

(assert (=> d!56853 m!221581))

(declare-fun m!221583 () Bool)

(assert (=> d!56853 m!221583))

(declare-fun m!221585 () Bool)

(assert (=> d!56853 m!221585))

(declare-fun m!221587 () Bool)

(assert (=> d!56853 m!221587))

(declare-fun m!221589 () Bool)

(assert (=> b!194540 m!221589))

(declare-fun m!221591 () Bool)

(assert (=> b!194541 m!221591))

(assert (=> b!194164 d!56853))

(declare-fun d!56855 () Bool)

(assert (=> d!56855 (= (apply!188 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) lt!96872) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) lt!96872)))))

(declare-fun bs!7758 () Bool)

(assert (= bs!7758 d!56855))

(declare-fun m!221593 () Bool)

(assert (=> bs!7758 m!221593))

(assert (=> bs!7758 m!221593))

(declare-fun m!221595 () Bool)

(assert (=> bs!7758 m!221595))

(assert (=> b!194164 d!56855))

(declare-fun d!56857 () Bool)

(declare-fun e!127971 () Bool)

(assert (=> d!56857 e!127971))

(declare-fun res!91940 () Bool)

(assert (=> d!56857 (=> (not res!91940) (not e!127971))))

(declare-fun lt!97084 () ListLongMap!2421)

(assert (=> d!56857 (= res!91940 (contains!1363 lt!97084 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97086 () List!2408)

(assert (=> d!56857 (= lt!97084 (ListLongMap!2422 lt!97086))))

(declare-fun lt!97087 () Unit!5858)

(declare-fun lt!97085 () Unit!5858)

(assert (=> d!56857 (= lt!97087 lt!97085)))

(assert (=> d!56857 (= (getValueByKey!246 lt!97086 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56857 (= lt!97085 (lemmaContainsTupThenGetReturnValue!133 lt!97086 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56857 (= lt!97086 (insertStrictlySorted!136 (toList!1226 lt!96873) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56857 (= (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) lt!97084)))

(declare-fun b!194542 () Bool)

(declare-fun res!91939 () Bool)

(assert (=> b!194542 (=> (not res!91939) (not e!127971))))

(assert (=> b!194542 (= res!91939 (= (getValueByKey!246 (toList!1226 lt!97084) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194543 () Bool)

(assert (=> b!194543 (= e!127971 (contains!1365 (toList!1226 lt!97084) (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56857 res!91940) b!194542))

(assert (= (and b!194542 res!91939) b!194543))

(declare-fun m!221597 () Bool)

(assert (=> d!56857 m!221597))

(declare-fun m!221599 () Bool)

(assert (=> d!56857 m!221599))

(declare-fun m!221601 () Bool)

(assert (=> d!56857 m!221601))

(declare-fun m!221603 () Bool)

(assert (=> d!56857 m!221603))

(declare-fun m!221605 () Bool)

(assert (=> b!194542 m!221605))

(declare-fun m!221607 () Bool)

(assert (=> b!194543 m!221607))

(assert (=> b!194164 d!56857))

(declare-fun d!56859 () Bool)

(assert (=> d!56859 (contains!1363 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) lt!96871)))

(declare-fun lt!97088 () Unit!5858)

(assert (=> d!56859 (= lt!97088 (choose!1075 lt!96873 lt!96858 (zeroValue!3800 thiss!1248) lt!96871))))

(assert (=> d!56859 (contains!1363 lt!96873 lt!96871)))

(assert (=> d!56859 (= (addStillContains!164 lt!96873 lt!96858 (zeroValue!3800 thiss!1248) lt!96871) lt!97088)))

(declare-fun bs!7759 () Bool)

(assert (= bs!7759 d!56859))

(assert (=> bs!7759 m!221071))

(assert (=> bs!7759 m!221071))

(assert (=> bs!7759 m!221079))

(declare-fun m!221609 () Bool)

(assert (=> bs!7759 m!221609))

(declare-fun m!221611 () Bool)

(assert (=> bs!7759 m!221611))

(assert (=> b!194164 d!56859))

(declare-fun d!56861 () Bool)

(declare-fun e!127972 () Bool)

(assert (=> d!56861 e!127972))

(declare-fun res!91942 () Bool)

(assert (=> d!56861 (=> (not res!91942) (not e!127972))))

(declare-fun lt!97089 () ListLongMap!2421)

(assert (=> d!56861 (= res!91942 (contains!1363 lt!97089 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97091 () List!2408)

(assert (=> d!56861 (= lt!97089 (ListLongMap!2422 lt!97091))))

(declare-fun lt!97092 () Unit!5858)

(declare-fun lt!97090 () Unit!5858)

(assert (=> d!56861 (= lt!97092 lt!97090)))

(assert (=> d!56861 (= (getValueByKey!246 lt!97091 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(assert (=> d!56861 (= lt!97090 (lemmaContainsTupThenGetReturnValue!133 lt!97091 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(assert (=> d!56861 (= lt!97091 (insertStrictlySorted!136 (toList!1226 lt!96876) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(assert (=> d!56861 (= (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) lt!97089)))

(declare-fun b!194544 () Bool)

(declare-fun res!91941 () Bool)

(assert (=> b!194544 (=> (not res!91941) (not e!127972))))

(assert (=> b!194544 (= res!91941 (= (getValueByKey!246 (toList!1226 lt!97089) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(declare-fun b!194545 () Bool)

(assert (=> b!194545 (= e!127972 (contains!1365 (toList!1226 lt!97089) (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))

(assert (= (and d!56861 res!91942) b!194544))

(assert (= (and b!194544 res!91941) b!194545))

(declare-fun m!221613 () Bool)

(assert (=> d!56861 m!221613))

(declare-fun m!221615 () Bool)

(assert (=> d!56861 m!221615))

(declare-fun m!221617 () Bool)

(assert (=> d!56861 m!221617))

(declare-fun m!221619 () Bool)

(assert (=> d!56861 m!221619))

(declare-fun m!221621 () Bool)

(assert (=> b!194544 m!221621))

(declare-fun m!221623 () Bool)

(assert (=> b!194545 m!221623))

(assert (=> b!194164 d!56861))

(declare-fun d!56863 () Bool)

(declare-fun e!127974 () Bool)

(assert (=> d!56863 e!127974))

(declare-fun res!91943 () Bool)

(assert (=> d!56863 (=> res!91943 e!127974)))

(declare-fun lt!97094 () Bool)

(assert (=> d!56863 (= res!91943 (not lt!97094))))

(declare-fun lt!97096 () Bool)

(assert (=> d!56863 (= lt!97094 lt!97096)))

(declare-fun lt!97093 () Unit!5858)

(declare-fun e!127973 () Unit!5858)

(assert (=> d!56863 (= lt!97093 e!127973)))

(declare-fun c!35120 () Bool)

(assert (=> d!56863 (= c!35120 lt!97096)))

(assert (=> d!56863 (= lt!97096 (containsKey!249 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871))))

(assert (=> d!56863 (= (contains!1363 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) lt!96871) lt!97094)))

(declare-fun b!194546 () Bool)

(declare-fun lt!97095 () Unit!5858)

(assert (=> b!194546 (= e!127973 lt!97095)))

(assert (=> b!194546 (= lt!97095 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871))))

(assert (=> b!194546 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871))))

(declare-fun b!194547 () Bool)

(declare-fun Unit!5875 () Unit!5858)

(assert (=> b!194547 (= e!127973 Unit!5875)))

(declare-fun b!194548 () Bool)

(assert (=> b!194548 (= e!127974 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871)))))

(assert (= (and d!56863 c!35120) b!194546))

(assert (= (and d!56863 (not c!35120)) b!194547))

(assert (= (and d!56863 (not res!91943)) b!194548))

(declare-fun m!221625 () Bool)

(assert (=> d!56863 m!221625))

(declare-fun m!221627 () Bool)

(assert (=> b!194546 m!221627))

(declare-fun m!221629 () Bool)

(assert (=> b!194546 m!221629))

(assert (=> b!194546 m!221629))

(declare-fun m!221631 () Bool)

(assert (=> b!194546 m!221631))

(assert (=> b!194548 m!221629))

(assert (=> b!194548 m!221629))

(assert (=> b!194548 m!221631))

(assert (=> b!194164 d!56863))

(declare-fun d!56865 () Bool)

(assert (=> d!56865 (= (apply!188 lt!96869 lt!96856) (get!2244 (getValueByKey!246 (toList!1226 lt!96869) lt!96856)))))

(declare-fun bs!7760 () Bool)

(assert (= bs!7760 d!56865))

(declare-fun m!221633 () Bool)

(assert (=> bs!7760 m!221633))

(assert (=> bs!7760 m!221633))

(declare-fun m!221635 () Bool)

(assert (=> bs!7760 m!221635))

(assert (=> b!194164 d!56865))

(declare-fun d!56867 () Bool)

(assert (=> d!56867 (= (apply!188 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) lt!96872) (apply!188 lt!96875 lt!96872))))

(declare-fun lt!97097 () Unit!5858)

(assert (=> d!56867 (= lt!97097 (choose!1074 lt!96875 lt!96866 (zeroValue!3800 thiss!1248) lt!96872))))

(declare-fun e!127975 () Bool)

(assert (=> d!56867 e!127975))

(declare-fun res!91944 () Bool)

(assert (=> d!56867 (=> (not res!91944) (not e!127975))))

(assert (=> d!56867 (= res!91944 (contains!1363 lt!96875 lt!96872))))

(assert (=> d!56867 (= (addApplyDifferent!164 lt!96875 lt!96866 (zeroValue!3800 thiss!1248) lt!96872) lt!97097)))

(declare-fun b!194549 () Bool)

(assert (=> b!194549 (= e!127975 (not (= lt!96872 lt!96866)))))

(assert (= (and d!56867 res!91944) b!194549))

(declare-fun m!221637 () Bool)

(assert (=> d!56867 m!221637))

(assert (=> d!56867 m!221085))

(assert (=> d!56867 m!221077))

(assert (=> d!56867 m!221085))

(assert (=> d!56867 m!221093))

(declare-fun m!221639 () Bool)

(assert (=> d!56867 m!221639))

(assert (=> b!194164 d!56867))

(declare-fun d!56869 () Bool)

(assert (=> d!56869 (= (apply!188 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) lt!96870) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) lt!96870)))))

(declare-fun bs!7761 () Bool)

(assert (= bs!7761 d!56869))

(declare-fun m!221641 () Bool)

(assert (=> bs!7761 m!221641))

(assert (=> bs!7761 m!221641))

(declare-fun m!221643 () Bool)

(assert (=> bs!7761 m!221643))

(assert (=> b!194164 d!56869))

(declare-fun d!56871 () Bool)

(assert (=> d!56871 (= (apply!188 lt!96875 lt!96872) (get!2244 (getValueByKey!246 (toList!1226 lt!96875) lt!96872)))))

(declare-fun bs!7762 () Bool)

(assert (= bs!7762 d!56871))

(declare-fun m!221645 () Bool)

(assert (=> bs!7762 m!221645))

(assert (=> bs!7762 m!221645))

(declare-fun m!221647 () Bool)

(assert (=> bs!7762 m!221647))

(assert (=> b!194164 d!56871))

(declare-fun d!56873 () Bool)

(assert (=> d!56873 (= (apply!188 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) lt!96870) (apply!188 lt!96876 lt!96870))))

(declare-fun lt!97098 () Unit!5858)

(assert (=> d!56873 (= lt!97098 (choose!1074 lt!96876 lt!96868 (minValue!3800 thiss!1248) lt!96870))))

(declare-fun e!127976 () Bool)

(assert (=> d!56873 e!127976))

(declare-fun res!91945 () Bool)

(assert (=> d!56873 (=> (not res!91945) (not e!127976))))

(assert (=> d!56873 (= res!91945 (contains!1363 lt!96876 lt!96870))))

(assert (=> d!56873 (= (addApplyDifferent!164 lt!96876 lt!96868 (minValue!3800 thiss!1248) lt!96870) lt!97098)))

(declare-fun b!194550 () Bool)

(assert (=> b!194550 (= e!127976 (not (= lt!96870 lt!96868)))))

(assert (= (and d!56873 res!91945) b!194550))

(declare-fun m!221649 () Bool)

(assert (=> d!56873 m!221649))

(assert (=> d!56873 m!221067))

(assert (=> d!56873 m!221087))

(assert (=> d!56873 m!221067))

(assert (=> d!56873 m!221069))

(declare-fun m!221651 () Bool)

(assert (=> d!56873 m!221651))

(assert (=> b!194164 d!56873))

(declare-fun d!56875 () Bool)

(assert (=> d!56875 (= (apply!188 lt!96876 lt!96870) (get!2244 (getValueByKey!246 (toList!1226 lt!96876) lt!96870)))))

(declare-fun bs!7763 () Bool)

(assert (= bs!7763 d!56875))

(declare-fun m!221653 () Bool)

(assert (=> bs!7763 m!221653))

(assert (=> bs!7763 m!221653))

(declare-fun m!221655 () Bool)

(assert (=> bs!7763 m!221655))

(assert (=> b!194164 d!56875))

(declare-fun d!56877 () Bool)

(assert (=> d!56877 (= (apply!188 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) lt!96856) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) lt!96856)))))

(declare-fun bs!7764 () Bool)

(assert (= bs!7764 d!56877))

(declare-fun m!221657 () Bool)

(assert (=> bs!7764 m!221657))

(assert (=> bs!7764 m!221657))

(declare-fun m!221659 () Bool)

(assert (=> bs!7764 m!221659))

(assert (=> b!194164 d!56877))

(declare-fun d!56879 () Bool)

(declare-fun e!127978 () Bool)

(assert (=> d!56879 e!127978))

(declare-fun res!91946 () Bool)

(assert (=> d!56879 (=> res!91946 e!127978)))

(declare-fun lt!97100 () Bool)

(assert (=> d!56879 (= res!91946 (not lt!97100))))

(declare-fun lt!97102 () Bool)

(assert (=> d!56879 (= lt!97100 lt!97102)))

(declare-fun lt!97099 () Unit!5858)

(declare-fun e!127977 () Unit!5858)

(assert (=> d!56879 (= lt!97099 e!127977)))

(declare-fun c!35121 () Bool)

(assert (=> d!56879 (= c!35121 lt!97102)))

(assert (=> d!56879 (= lt!97102 (containsKey!249 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56879 (= (contains!1363 lt!96908 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) lt!97100)))

(declare-fun b!194551 () Bool)

(declare-fun lt!97101 () Unit!5858)

(assert (=> b!194551 (= e!127977 lt!97101)))

(assert (=> b!194551 (= lt!97101 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194551 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194552 () Bool)

(declare-fun Unit!5876 () Unit!5858)

(assert (=> b!194552 (= e!127977 Unit!5876)))

(declare-fun b!194553 () Bool)

(assert (=> b!194553 (= e!127978 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56879 c!35121) b!194551))

(assert (= (and d!56879 (not c!35121)) b!194552))

(assert (= (and d!56879 (not res!91946)) b!194553))

(assert (=> d!56879 m!221041))

(declare-fun m!221661 () Bool)

(assert (=> d!56879 m!221661))

(assert (=> b!194551 m!221041))

(declare-fun m!221663 () Bool)

(assert (=> b!194551 m!221663))

(assert (=> b!194551 m!221041))

(assert (=> b!194551 m!221519))

(assert (=> b!194551 m!221519))

(declare-fun m!221665 () Bool)

(assert (=> b!194551 m!221665))

(assert (=> b!194553 m!221041))

(assert (=> b!194553 m!221519))

(assert (=> b!194553 m!221519))

(assert (=> b!194553 m!221665))

(assert (=> b!194212 d!56879))

(declare-fun d!56881 () Bool)

(declare-fun res!91951 () Bool)

(declare-fun e!127983 () Bool)

(assert (=> d!56881 (=> res!91951 e!127983)))

(assert (=> d!56881 (= res!91951 (= (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56881 (= (arrayContainsKey!0 (_keys!5953 thiss!1248) key!828 #b00000000000000000000000000000000) e!127983)))

(declare-fun b!194558 () Bool)

(declare-fun e!127984 () Bool)

(assert (=> b!194558 (= e!127983 e!127984)))

(declare-fun res!91952 () Bool)

(assert (=> b!194558 (=> (not res!91952) (not e!127984))))

(assert (=> b!194558 (= res!91952 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194559 () Bool)

(assert (=> b!194559 (= e!127984 (arrayContainsKey!0 (_keys!5953 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56881 (not res!91951)) b!194558))

(assert (= (and b!194558 res!91952) b!194559))

(assert (=> d!56881 m!221041))

(declare-fun m!221667 () Bool)

(assert (=> b!194559 m!221667))

(assert (=> bm!19627 d!56881))

(declare-fun b!194561 () Bool)

(declare-fun e!127985 () Option!252)

(declare-fun e!127986 () Option!252)

(assert (=> b!194561 (= e!127985 e!127986)))

(declare-fun c!35123 () Bool)

(assert (=> b!194561 (= c!35123 (and ((_ is Cons!2404) (toList!1226 lt!96927)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96927))) (_1!1761 lt!96690)))))))

(declare-fun b!194563 () Bool)

(assert (=> b!194563 (= e!127986 None!250)))

(declare-fun d!56883 () Bool)

(declare-fun c!35122 () Bool)

(assert (=> d!56883 (= c!35122 (and ((_ is Cons!2404) (toList!1226 lt!96927)) (= (_1!1761 (h!3045 (toList!1226 lt!96927))) (_1!1761 lt!96690))))))

(assert (=> d!56883 (= (getValueByKey!246 (toList!1226 lt!96927) (_1!1761 lt!96690)) e!127985)))

(declare-fun b!194562 () Bool)

(assert (=> b!194562 (= e!127986 (getValueByKey!246 (t!7326 (toList!1226 lt!96927)) (_1!1761 lt!96690)))))

(declare-fun b!194560 () Bool)

(assert (=> b!194560 (= e!127985 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96927)))))))

(assert (= (and d!56883 c!35122) b!194560))

(assert (= (and d!56883 (not c!35122)) b!194561))

(assert (= (and b!194561 c!35123) b!194562))

(assert (= (and b!194561 (not c!35123)) b!194563))

(declare-fun m!221669 () Bool)

(assert (=> b!194562 m!221669))

(assert (=> b!194247 d!56883))

(declare-fun d!56885 () Bool)

(declare-fun res!91953 () Bool)

(declare-fun e!127987 () Bool)

(assert (=> d!56885 (=> res!91953 e!127987)))

(assert (=> d!56885 (= res!91953 (and ((_ is Cons!2404) (toList!1226 lt!96700)) (= (_1!1761 (h!3045 (toList!1226 lt!96700))) key!828)))))

(assert (=> d!56885 (= (containsKey!249 (toList!1226 lt!96700) key!828) e!127987)))

(declare-fun b!194564 () Bool)

(declare-fun e!127988 () Bool)

(assert (=> b!194564 (= e!127987 e!127988)))

(declare-fun res!91954 () Bool)

(assert (=> b!194564 (=> (not res!91954) (not e!127988))))

(assert (=> b!194564 (= res!91954 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96700))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96700))) key!828)) ((_ is Cons!2404) (toList!1226 lt!96700)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96700))) key!828)))))

(declare-fun b!194565 () Bool)

(assert (=> b!194565 (= e!127988 (containsKey!249 (t!7326 (toList!1226 lt!96700)) key!828))))

(assert (= (and d!56885 (not res!91953)) b!194564))

(assert (= (and b!194564 res!91954) b!194565))

(declare-fun m!221671 () Bool)

(assert (=> b!194565 m!221671))

(assert (=> d!56727 d!56885))

(declare-fun d!56887 () Bool)

(assert (=> d!56887 (= (apply!188 lt!96864 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2244 (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7765 () Bool)

(assert (= bs!7765 d!56887))

(assert (=> bs!7765 m!221515))

(assert (=> bs!7765 m!221515))

(declare-fun m!221673 () Bool)

(assert (=> bs!7765 m!221673))

(assert (=> b!194168 d!56887))

(assert (=> d!56729 d!56831))

(declare-fun d!56889 () Bool)

(assert (=> d!56889 (= (inRange!0 (index!4899 lt!96796) (mask!9222 thiss!1248)) (and (bvsge (index!4899 lt!96796) #b00000000000000000000000000000000) (bvslt (index!4899 lt!96796) (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!194090 d!56889))

(declare-fun d!56891 () Bool)

(declare-fun lt!97105 () (_ BitVec 32))

(assert (=> d!56891 (and (bvsge lt!97105 #b00000000000000000000000000000000) (bvsle lt!97105 (bvsub (size!4190 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!127994 () (_ BitVec 32))

(assert (=> d!56891 (= lt!97105 e!127994)))

(declare-fun c!35129 () Bool)

(assert (=> d!56891 (= c!35129 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!56891 (and (bvsle #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4190 (_keys!5953 thiss!1248)) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!56891 (= (arrayCountValidKeys!0 (_keys!5953 thiss!1248) #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))) lt!97105)))

(declare-fun b!194574 () Bool)

(declare-fun e!127993 () (_ BitVec 32))

(assert (=> b!194574 (= e!127994 e!127993)))

(declare-fun c!35128 () Bool)

(assert (=> b!194574 (= c!35128 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194575 () Bool)

(declare-fun call!19661 () (_ BitVec 32))

(assert (=> b!194575 (= e!127993 (bvadd #b00000000000000000000000000000001 call!19661))))

(declare-fun b!194576 () Bool)

(assert (=> b!194576 (= e!127994 #b00000000000000000000000000000000)))

(declare-fun b!194577 () Bool)

(assert (=> b!194577 (= e!127993 call!19661)))

(declare-fun bm!19658 () Bool)

(assert (=> bm!19658 (= call!19661 (arrayCountValidKeys!0 (_keys!5953 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (= (and d!56891 c!35129) b!194576))

(assert (= (and d!56891 (not c!35129)) b!194574))

(assert (= (and b!194574 c!35128) b!194575))

(assert (= (and b!194574 (not c!35128)) b!194577))

(assert (= (or b!194575 b!194577) bm!19658))

(assert (=> b!194574 m!221041))

(assert (=> b!194574 m!221041))

(assert (=> b!194574 m!221049))

(declare-fun m!221675 () Bool)

(assert (=> bm!19658 m!221675))

(assert (=> b!194249 d!56891))

(declare-fun d!56893 () Bool)

(assert (=> d!56893 (= (+!319 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (tuple2!3501 key!828 v!309)) (getCurrentListMap!878 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56893 true))

(declare-fun _$5!158 () Unit!5858)

(assert (=> d!56893 (= (choose!1071 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4899 lt!96691) key!828 v!309 (defaultEntry!3959 thiss!1248)) _$5!158)))

(declare-fun bs!7766 () Bool)

(assert (= bs!7766 d!56893))

(assert (=> bs!7766 m!220887))

(assert (=> bs!7766 m!220887))

(assert (=> bs!7766 m!221111))

(assert (=> bs!7766 m!220897))

(assert (=> bs!7766 m!221113))

(assert (=> d!56733 d!56893))

(assert (=> d!56733 d!56831))

(declare-fun d!56895 () Bool)

(assert (=> d!56895 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun lt!97108 () Unit!5858)

(declare-fun choose!1077 (List!2408 (_ BitVec 64)) Unit!5858)

(assert (=> d!56895 (= lt!97108 (choose!1077 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun e!127997 () Bool)

(assert (=> d!56895 e!127997))

(declare-fun res!91957 () Bool)

(assert (=> d!56895 (=> (not res!91957) (not e!127997))))

(assert (=> d!56895 (= res!91957 (isStrictlySorted!344 (toList!1226 lt!96701)))))

(assert (=> d!56895 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) lt!97108)))

(declare-fun b!194580 () Bool)

(assert (=> b!194580 (= e!127997 (containsKey!249 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (= (and d!56895 res!91957) b!194580))

(assert (=> d!56895 m!220871))

(assert (=> d!56895 m!221119))

(assert (=> d!56895 m!221119))

(assert (=> d!56895 m!221121))

(assert (=> d!56895 m!220871))

(declare-fun m!221677 () Bool)

(assert (=> d!56895 m!221677))

(declare-fun m!221679 () Bool)

(assert (=> d!56895 m!221679))

(assert (=> b!194580 m!220871))

(assert (=> b!194580 m!221115))

(assert (=> b!194187 d!56895))

(declare-fun d!56897 () Bool)

(assert (=> d!56897 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))))

(declare-fun bs!7767 () Bool)

(assert (= bs!7767 d!56897))

(assert (=> bs!7767 m!221119))

(declare-fun m!221681 () Bool)

(assert (=> bs!7767 m!221681))

(assert (=> b!194187 d!56897))

(declare-fun b!194582 () Bool)

(declare-fun e!127998 () Option!252)

(declare-fun e!127999 () Option!252)

(assert (=> b!194582 (= e!127998 e!127999)))

(declare-fun c!35131 () Bool)

(assert (=> b!194582 (= c!35131 (and ((_ is Cons!2404) (toList!1226 lt!96701)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96701))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))))

(declare-fun b!194584 () Bool)

(assert (=> b!194584 (= e!127999 None!250)))

(declare-fun c!35130 () Bool)

(declare-fun d!56899 () Bool)

(assert (=> d!56899 (= c!35130 (and ((_ is Cons!2404) (toList!1226 lt!96701)) (= (_1!1761 (h!3045 (toList!1226 lt!96701))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(assert (=> d!56899 (= (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) e!127998)))

(declare-fun b!194583 () Bool)

(assert (=> b!194583 (= e!127999 (getValueByKey!246 (t!7326 (toList!1226 lt!96701)) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun b!194581 () Bool)

(assert (=> b!194581 (= e!127998 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96701)))))))

(assert (= (and d!56899 c!35130) b!194581))

(assert (= (and d!56899 (not c!35130)) b!194582))

(assert (= (and b!194582 c!35131) b!194583))

(assert (= (and b!194582 (not c!35131)) b!194584))

(assert (=> b!194583 m!220871))

(declare-fun m!221683 () Bool)

(assert (=> b!194583 m!221683))

(assert (=> b!194187 d!56899))

(assert (=> b!194189 d!56897))

(assert (=> b!194189 d!56899))

(declare-fun d!56901 () Bool)

(assert (=> d!56901 (= (apply!188 lt!96908 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2244 (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7768 () Bool)

(assert (= bs!7768 d!56901))

(assert (=> bs!7768 m!221505))

(assert (=> bs!7768 m!221505))

(declare-fun m!221685 () Bool)

(assert (=> bs!7768 m!221685))

(assert (=> b!194216 d!56901))

(declare-fun bm!19659 () Bool)

(declare-fun call!19667 () ListLongMap!2421)

(assert (=> bm!19659 (= call!19667 (getCurrentListMapNoExtraKeys!219 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96692)))))

(declare-fun b!194585 () Bool)

(declare-fun e!128009 () Bool)

(assert (=> b!194585 (= e!128009 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun bm!19660 () Bool)

(declare-fun call!19662 () Bool)

(declare-fun lt!97118 () ListLongMap!2421)

(assert (=> bm!19660 (= call!19662 (contains!1363 lt!97118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194586 () Bool)

(declare-fun e!128005 () Bool)

(assert (=> b!194586 (= e!128005 (not call!19662))))

(declare-fun b!194587 () Bool)

(declare-fun e!128010 () Bool)

(assert (=> b!194587 (= e!128010 (= (apply!188 lt!97118 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)) (get!2243 (select (arr!3867 (_values!3942 lt!96692)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 lt!96692) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194587 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4191 (_values!3942 lt!96692))))))

(assert (=> b!194587 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(declare-fun bm!19661 () Bool)

(declare-fun call!19665 () Bool)

(assert (=> bm!19661 (= call!19665 (contains!1363 lt!97118 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194588 () Bool)

(declare-fun res!91958 () Bool)

(declare-fun e!128001 () Bool)

(assert (=> b!194588 (=> (not res!91958) (not e!128001))))

(declare-fun e!128012 () Bool)

(assert (=> b!194588 (= res!91958 e!128012)))

(declare-fun res!91966 () Bool)

(assert (=> b!194588 (=> res!91966 e!128012)))

(declare-fun e!128008 () Bool)

(assert (=> b!194588 (= res!91966 (not e!128008))))

(declare-fun res!91961 () Bool)

(assert (=> b!194588 (=> (not res!91961) (not e!128008))))

(assert (=> b!194588 (= res!91961 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(declare-fun d!56903 () Bool)

(assert (=> d!56903 e!128001))

(declare-fun res!91964 () Bool)

(assert (=> d!56903 (=> (not res!91964) (not e!128001))))

(assert (=> d!56903 (= res!91964 (or (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))))

(declare-fun lt!97109 () ListLongMap!2421)

(assert (=> d!56903 (= lt!97118 lt!97109)))

(declare-fun lt!97121 () Unit!5858)

(declare-fun e!128004 () Unit!5858)

(assert (=> d!56903 (= lt!97121 e!128004)))

(declare-fun c!35133 () Bool)

(assert (=> d!56903 (= c!35133 e!128009)))

(declare-fun res!91963 () Bool)

(assert (=> d!56903 (=> (not res!91963) (not e!128009))))

(assert (=> d!56903 (= res!91963 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(declare-fun e!128002 () ListLongMap!2421)

(assert (=> d!56903 (= lt!97109 e!128002)))

(declare-fun c!35137 () Bool)

(assert (=> d!56903 (= c!35137 (and (not (= (bvand (extraKeys!3696 lt!96692) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3696 lt!96692) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56903 (validMask!0 (mask!9222 lt!96692))))

(assert (=> d!56903 (= (getCurrentListMap!878 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96692)) lt!97118)))

(declare-fun b!194589 () Bool)

(declare-fun e!128003 () Bool)

(assert (=> b!194589 (= e!128001 e!128003)))

(declare-fun c!35135 () Bool)

(assert (=> b!194589 (= c!35135 (not (= (bvand (extraKeys!3696 lt!96692) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194590 () Bool)

(declare-fun e!128011 () Bool)

(assert (=> b!194590 (= e!128003 e!128011)))

(declare-fun res!91960 () Bool)

(assert (=> b!194590 (= res!91960 call!19665)))

(assert (=> b!194590 (=> (not res!91960) (not e!128011))))

(declare-fun bm!19662 () Bool)

(declare-fun call!19664 () ListLongMap!2421)

(assert (=> bm!19662 (= call!19664 call!19667)))

(declare-fun b!194591 () Bool)

(declare-fun res!91962 () Bool)

(assert (=> b!194591 (=> (not res!91962) (not e!128001))))

(assert (=> b!194591 (= res!91962 e!128005)))

(declare-fun c!35132 () Bool)

(assert (=> b!194591 (= c!35132 (not (= (bvand (extraKeys!3696 lt!96692) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19663 () Bool)

(declare-fun call!19666 () ListLongMap!2421)

(declare-fun call!19663 () ListLongMap!2421)

(assert (=> bm!19663 (= call!19666 call!19663)))

(declare-fun b!194592 () Bool)

(declare-fun e!128007 () Bool)

(assert (=> b!194592 (= e!128005 e!128007)))

(declare-fun res!91965 () Bool)

(assert (=> b!194592 (= res!91965 call!19662)))

(assert (=> b!194592 (=> (not res!91965) (not e!128007))))

(declare-fun b!194593 () Bool)

(declare-fun Unit!5877 () Unit!5858)

(assert (=> b!194593 (= e!128004 Unit!5877)))

(declare-fun b!194594 () Bool)

(declare-fun lt!97114 () Unit!5858)

(assert (=> b!194594 (= e!128004 lt!97114)))

(declare-fun lt!97127 () ListLongMap!2421)

(assert (=> b!194594 (= lt!97127 (getCurrentListMapNoExtraKeys!219 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96692)))))

(declare-fun lt!97112 () (_ BitVec 64))

(assert (=> b!194594 (= lt!97112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97125 () (_ BitVec 64))

(assert (=> b!194594 (= lt!97125 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000))))

(declare-fun lt!97117 () Unit!5858)

(assert (=> b!194594 (= lt!97117 (addStillContains!164 lt!97127 lt!97112 (zeroValue!3800 lt!96692) lt!97125))))

(assert (=> b!194594 (contains!1363 (+!319 lt!97127 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692))) lt!97125)))

(declare-fun lt!97113 () Unit!5858)

(assert (=> b!194594 (= lt!97113 lt!97117)))

(declare-fun lt!97130 () ListLongMap!2421)

(assert (=> b!194594 (= lt!97130 (getCurrentListMapNoExtraKeys!219 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96692)))))

(declare-fun lt!97122 () (_ BitVec 64))

(assert (=> b!194594 (= lt!97122 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97124 () (_ BitVec 64))

(assert (=> b!194594 (= lt!97124 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000))))

(declare-fun lt!97116 () Unit!5858)

(assert (=> b!194594 (= lt!97116 (addApplyDifferent!164 lt!97130 lt!97122 (minValue!3800 lt!96692) lt!97124))))

(assert (=> b!194594 (= (apply!188 (+!319 lt!97130 (tuple2!3501 lt!97122 (minValue!3800 lt!96692))) lt!97124) (apply!188 lt!97130 lt!97124))))

(declare-fun lt!97111 () Unit!5858)

(assert (=> b!194594 (= lt!97111 lt!97116)))

(declare-fun lt!97129 () ListLongMap!2421)

(assert (=> b!194594 (= lt!97129 (getCurrentListMapNoExtraKeys!219 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96692)))))

(declare-fun lt!97120 () (_ BitVec 64))

(assert (=> b!194594 (= lt!97120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97126 () (_ BitVec 64))

(assert (=> b!194594 (= lt!97126 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000))))

(declare-fun lt!97115 () Unit!5858)

(assert (=> b!194594 (= lt!97115 (addApplyDifferent!164 lt!97129 lt!97120 (zeroValue!3800 lt!96692) lt!97126))))

(assert (=> b!194594 (= (apply!188 (+!319 lt!97129 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692))) lt!97126) (apply!188 lt!97129 lt!97126))))

(declare-fun lt!97128 () Unit!5858)

(assert (=> b!194594 (= lt!97128 lt!97115)))

(declare-fun lt!97123 () ListLongMap!2421)

(assert (=> b!194594 (= lt!97123 (getCurrentListMapNoExtraKeys!219 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96692)))))

(declare-fun lt!97119 () (_ BitVec 64))

(assert (=> b!194594 (= lt!97119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97110 () (_ BitVec 64))

(assert (=> b!194594 (= lt!97110 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000))))

(assert (=> b!194594 (= lt!97114 (addApplyDifferent!164 lt!97123 lt!97119 (minValue!3800 lt!96692) lt!97110))))

(assert (=> b!194594 (= (apply!188 (+!319 lt!97123 (tuple2!3501 lt!97119 (minValue!3800 lt!96692))) lt!97110) (apply!188 lt!97123 lt!97110))))

(declare-fun b!194595 () Bool)

(assert (=> b!194595 (= e!128012 e!128010)))

(declare-fun res!91959 () Bool)

(assert (=> b!194595 (=> (not res!91959) (not e!128010))))

(assert (=> b!194595 (= res!91959 (contains!1363 lt!97118 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (=> b!194595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(declare-fun b!194596 () Bool)

(assert (=> b!194596 (= e!128003 (not call!19665))))

(declare-fun b!194597 () Bool)

(declare-fun e!128006 () ListLongMap!2421)

(assert (=> b!194597 (= e!128002 e!128006)))

(declare-fun c!35136 () Bool)

(assert (=> b!194597 (= c!35136 (and (not (= (bvand (extraKeys!3696 lt!96692) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 lt!96692) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194598 () Bool)

(assert (=> b!194598 (= e!128011 (= (apply!188 lt!97118 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3800 lt!96692)))))

(declare-fun b!194599 () Bool)

(assert (=> b!194599 (= e!128007 (= (apply!188 lt!97118 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3800 lt!96692)))))

(declare-fun b!194600 () Bool)

(assert (=> b!194600 (= e!128006 call!19666)))

(declare-fun b!194601 () Bool)

(declare-fun e!128000 () ListLongMap!2421)

(assert (=> b!194601 (= e!128000 call!19666)))

(declare-fun bm!19664 () Bool)

(declare-fun call!19668 () ListLongMap!2421)

(assert (=> bm!19664 (= call!19663 (+!319 (ite c!35137 call!19667 (ite c!35136 call!19664 call!19668)) (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))))))

(declare-fun b!194602 () Bool)

(declare-fun c!35134 () Bool)

(assert (=> b!194602 (= c!35134 (and (not (= (bvand (extraKeys!3696 lt!96692) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 lt!96692) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!194602 (= e!128006 e!128000)))

(declare-fun b!194603 () Bool)

(assert (=> b!194603 (= e!128002 (+!319 call!19663 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))))

(declare-fun b!194604 () Bool)

(assert (=> b!194604 (= e!128000 call!19668)))

(declare-fun b!194605 () Bool)

(assert (=> b!194605 (= e!128008 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun bm!19665 () Bool)

(assert (=> bm!19665 (= call!19668 call!19664)))

(assert (= (and d!56903 c!35137) b!194603))

(assert (= (and d!56903 (not c!35137)) b!194597))

(assert (= (and b!194597 c!35136) b!194600))

(assert (= (and b!194597 (not c!35136)) b!194602))

(assert (= (and b!194602 c!35134) b!194601))

(assert (= (and b!194602 (not c!35134)) b!194604))

(assert (= (or b!194601 b!194604) bm!19665))

(assert (= (or b!194600 bm!19665) bm!19662))

(assert (= (or b!194600 b!194601) bm!19663))

(assert (= (or b!194603 bm!19662) bm!19659))

(assert (= (or b!194603 bm!19663) bm!19664))

(assert (= (and d!56903 res!91963) b!194585))

(assert (= (and d!56903 c!35133) b!194594))

(assert (= (and d!56903 (not c!35133)) b!194593))

(assert (= (and d!56903 res!91964) b!194588))

(assert (= (and b!194588 res!91961) b!194605))

(assert (= (and b!194588 (not res!91966)) b!194595))

(assert (= (and b!194595 res!91959) b!194587))

(assert (= (and b!194588 res!91958) b!194591))

(assert (= (and b!194591 c!35132) b!194592))

(assert (= (and b!194591 (not c!35132)) b!194586))

(assert (= (and b!194592 res!91965) b!194599))

(assert (= (or b!194592 b!194586) bm!19660))

(assert (= (and b!194591 res!91962) b!194589))

(assert (= (and b!194589 c!35135) b!194590))

(assert (= (and b!194589 (not c!35135)) b!194596))

(assert (= (and b!194590 res!91960) b!194598))

(assert (= (or b!194590 b!194596) bm!19661))

(declare-fun b_lambda!7519 () Bool)

(assert (=> (not b_lambda!7519) (not b!194587)))

(declare-fun tb!2881 () Bool)

(declare-fun t!7332 () Bool)

(assert (=> (and b!194001 (= (defaultEntry!3959 thiss!1248) (defaultEntry!3959 lt!96692)) t!7332) tb!2881))

(declare-fun result!4937 () Bool)

(assert (=> tb!2881 (= result!4937 tp_is_empty!4489)))

(assert (=> b!194587 t!7332))

(declare-fun b_and!11465 () Bool)

(assert (= b_and!11463 (and (=> t!7332 result!4937) b_and!11465)))

(declare-fun m!221687 () Bool)

(assert (=> bm!19660 m!221687))

(assert (=> b!194595 m!221539))

(assert (=> b!194595 m!221539))

(declare-fun m!221689 () Bool)

(assert (=> b!194595 m!221689))

(declare-fun m!221691 () Bool)

(assert (=> bm!19661 m!221691))

(declare-fun m!221693 () Bool)

(assert (=> bm!19659 m!221693))

(assert (=> d!56903 m!221535))

(assert (=> b!194605 m!221539))

(assert (=> b!194605 m!221539))

(assert (=> b!194605 m!221547))

(declare-fun m!221695 () Bool)

(assert (=> b!194603 m!221695))

(declare-fun m!221697 () Bool)

(assert (=> bm!19664 m!221697))

(assert (=> b!194585 m!221539))

(assert (=> b!194585 m!221539))

(assert (=> b!194585 m!221547))

(declare-fun m!221699 () Bool)

(assert (=> b!194587 m!221699))

(assert (=> b!194587 m!221699))

(declare-fun m!221701 () Bool)

(assert (=> b!194587 m!221701))

(declare-fun m!221703 () Bool)

(assert (=> b!194587 m!221703))

(assert (=> b!194587 m!221701))

(assert (=> b!194587 m!221539))

(assert (=> b!194587 m!221539))

(declare-fun m!221705 () Bool)

(assert (=> b!194587 m!221705))

(declare-fun m!221707 () Bool)

(assert (=> b!194599 m!221707))

(declare-fun m!221709 () Bool)

(assert (=> b!194594 m!221709))

(declare-fun m!221711 () Bool)

(assert (=> b!194594 m!221711))

(assert (=> b!194594 m!221711))

(declare-fun m!221713 () Bool)

(assert (=> b!194594 m!221713))

(declare-fun m!221715 () Bool)

(assert (=> b!194594 m!221715))

(declare-fun m!221717 () Bool)

(assert (=> b!194594 m!221717))

(declare-fun m!221719 () Bool)

(assert (=> b!194594 m!221719))

(declare-fun m!221721 () Bool)

(assert (=> b!194594 m!221721))

(assert (=> b!194594 m!221715))

(declare-fun m!221723 () Bool)

(assert (=> b!194594 m!221723))

(declare-fun m!221725 () Bool)

(assert (=> b!194594 m!221725))

(declare-fun m!221727 () Bool)

(assert (=> b!194594 m!221727))

(declare-fun m!221729 () Bool)

(assert (=> b!194594 m!221729))

(declare-fun m!221731 () Bool)

(assert (=> b!194594 m!221731))

(assert (=> b!194594 m!221539))

(assert (=> b!194594 m!221693))

(declare-fun m!221733 () Bool)

(assert (=> b!194594 m!221733))

(declare-fun m!221735 () Bool)

(assert (=> b!194594 m!221735))

(assert (=> b!194594 m!221729))

(declare-fun m!221737 () Bool)

(assert (=> b!194594 m!221737))

(assert (=> b!194594 m!221725))

(declare-fun m!221739 () Bool)

(assert (=> b!194598 m!221739))

(assert (=> d!56719 d!56903))

(declare-fun d!56905 () Bool)

(assert (=> d!56905 (contains!1363 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))

(assert (=> d!56905 true))

(declare-fun _$16!166 () Unit!5858)

(assert (=> d!56905 (= (choose!1072 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4899 lt!96691) (defaultEntry!3959 thiss!1248)) _$16!166)))

(declare-fun bs!7769 () Bool)

(assert (= bs!7769 d!56905))

(assert (=> bs!7769 m!220901))

(assert (=> bs!7769 m!220871))

(assert (=> bs!7769 m!220901))

(assert (=> bs!7769 m!220871))

(assert (=> bs!7769 m!221133))

(assert (=> d!56739 d!56905))

(assert (=> d!56739 d!56831))

(assert (=> b!194155 d!56823))

(declare-fun b!194607 () Bool)

(declare-fun e!128014 () Bool)

(declare-fun call!19669 () Bool)

(assert (=> b!194607 (= e!128014 call!19669)))

(declare-fun b!194608 () Bool)

(declare-fun e!128016 () Bool)

(assert (=> b!194608 (= e!128016 e!128014)))

(declare-fun c!35138 () Bool)

(assert (=> b!194608 (= c!35138 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194609 () Bool)

(assert (=> b!194609 (= e!128014 call!19669)))

(declare-fun bm!19666 () Bool)

(assert (=> bm!19666 (= call!19669 (arrayNoDuplicates!0 (_keys!5953 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35138 (Cons!2406 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) Nil!2407) Nil!2407)))))

(declare-fun b!194610 () Bool)

(declare-fun e!128013 () Bool)

(assert (=> b!194610 (= e!128013 (contains!1366 Nil!2407 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56907 () Bool)

(declare-fun res!91968 () Bool)

(declare-fun e!128015 () Bool)

(assert (=> d!56907 (=> res!91968 e!128015)))

(assert (=> d!56907 (= res!91968 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!56907 (= (arrayNoDuplicates!0 (_keys!5953 thiss!1248) #b00000000000000000000000000000000 Nil!2407) e!128015)))

(declare-fun b!194606 () Bool)

(assert (=> b!194606 (= e!128015 e!128016)))

(declare-fun res!91969 () Bool)

(assert (=> b!194606 (=> (not res!91969) (not e!128016))))

(assert (=> b!194606 (= res!91969 (not e!128013))))

(declare-fun res!91967 () Bool)

(assert (=> b!194606 (=> (not res!91967) (not e!128013))))

(assert (=> b!194606 (= res!91967 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56907 (not res!91968)) b!194606))

(assert (= (and b!194606 res!91967) b!194610))

(assert (= (and b!194606 res!91969) b!194608))

(assert (= (and b!194608 c!35138) b!194607))

(assert (= (and b!194608 (not c!35138)) b!194609))

(assert (= (or b!194607 b!194609) bm!19666))

(assert (=> b!194608 m!221041))

(assert (=> b!194608 m!221041))

(assert (=> b!194608 m!221049))

(assert (=> bm!19666 m!221041))

(declare-fun m!221741 () Bool)

(assert (=> bm!19666 m!221741))

(assert (=> b!194610 m!221041))

(assert (=> b!194610 m!221041))

(declare-fun m!221743 () Bool)

(assert (=> b!194610 m!221743))

(assert (=> b!194606 m!221041))

(assert (=> b!194606 m!221041))

(assert (=> b!194606 m!221049))

(assert (=> b!194251 d!56907))

(declare-fun d!56909 () Bool)

(declare-fun e!128017 () Bool)

(assert (=> d!56909 e!128017))

(declare-fun res!91971 () Bool)

(assert (=> d!56909 (=> (not res!91971) (not e!128017))))

(declare-fun lt!97131 () ListLongMap!2421)

(assert (=> d!56909 (= res!91971 (contains!1363 lt!97131 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!97133 () List!2408)

(assert (=> d!56909 (= lt!97131 (ListLongMap!2422 lt!97133))))

(declare-fun lt!97134 () Unit!5858)

(declare-fun lt!97132 () Unit!5858)

(assert (=> d!56909 (= lt!97134 lt!97132)))

(assert (=> d!56909 (= (getValueByKey!246 lt!97133 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!251 (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56909 (= lt!97132 (lemmaContainsTupThenGetReturnValue!133 lt!97133 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56909 (= lt!97133 (insertStrictlySorted!136 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618))) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56909 (= (+!319 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)) (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97131)))

(declare-fun b!194611 () Bool)

(declare-fun res!91970 () Bool)

(assert (=> b!194611 (=> (not res!91970) (not e!128017))))

(assert (=> b!194611 (= res!91970 (= (getValueByKey!246 (toList!1226 lt!97131) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!251 (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194612 () Bool)

(assert (=> b!194612 (= e!128017 (contains!1365 (toList!1226 lt!97131) (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!56909 res!91971) b!194611))

(assert (= (and b!194611 res!91970) b!194612))

(declare-fun m!221745 () Bool)

(assert (=> d!56909 m!221745))

(declare-fun m!221747 () Bool)

(assert (=> d!56909 m!221747))

(declare-fun m!221749 () Bool)

(assert (=> d!56909 m!221749))

(declare-fun m!221751 () Bool)

(assert (=> d!56909 m!221751))

(declare-fun m!221753 () Bool)

(assert (=> b!194611 m!221753))

(declare-fun m!221755 () Bool)

(assert (=> b!194612 m!221755))

(assert (=> bm!19614 d!56909))

(declare-fun d!56911 () Bool)

(declare-fun e!128018 () Bool)

(assert (=> d!56911 e!128018))

(declare-fun res!91973 () Bool)

(assert (=> d!56911 (=> (not res!91973) (not e!128018))))

(declare-fun lt!97135 () ListLongMap!2421)

(assert (=> d!56911 (= res!91973 (contains!1363 lt!97135 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!97137 () List!2408)

(assert (=> d!56911 (= lt!97135 (ListLongMap!2422 lt!97137))))

(declare-fun lt!97138 () Unit!5858)

(declare-fun lt!97136 () Unit!5858)

(assert (=> d!56911 (= lt!97138 lt!97136)))

(assert (=> d!56911 (= (getValueByKey!246 lt!97137 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!251 (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56911 (= lt!97136 (lemmaContainsTupThenGetReturnValue!133 lt!97137 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56911 (= lt!97137 (insertStrictlySorted!136 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625))) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56911 (= (+!319 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)) (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97135)))

(declare-fun b!194613 () Bool)

(declare-fun res!91972 () Bool)

(assert (=> b!194613 (=> (not res!91972) (not e!128018))))

(assert (=> b!194613 (= res!91972 (= (getValueByKey!246 (toList!1226 lt!97135) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!251 (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194614 () Bool)

(assert (=> b!194614 (= e!128018 (contains!1365 (toList!1226 lt!97135) (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!56911 res!91973) b!194613))

(assert (= (and b!194613 res!91972) b!194614))

(declare-fun m!221757 () Bool)

(assert (=> d!56911 m!221757))

(declare-fun m!221759 () Bool)

(assert (=> d!56911 m!221759))

(declare-fun m!221761 () Bool)

(assert (=> d!56911 m!221761))

(declare-fun m!221763 () Bool)

(assert (=> d!56911 m!221763))

(declare-fun m!221765 () Bool)

(assert (=> b!194613 m!221765))

(declare-fun m!221767 () Bool)

(assert (=> b!194614 m!221767))

(assert (=> bm!19621 d!56911))

(declare-fun d!56913 () Bool)

(declare-fun e!128020 () Bool)

(assert (=> d!56913 e!128020))

(declare-fun res!91974 () Bool)

(assert (=> d!56913 (=> res!91974 e!128020)))

(declare-fun lt!97140 () Bool)

(assert (=> d!56913 (= res!91974 (not lt!97140))))

(declare-fun lt!97142 () Bool)

(assert (=> d!56913 (= lt!97140 lt!97142)))

(declare-fun lt!97139 () Unit!5858)

(declare-fun e!128019 () Unit!5858)

(assert (=> d!56913 (= lt!97139 e!128019)))

(declare-fun c!35139 () Bool)

(assert (=> d!56913 (= c!35139 lt!97142)))

(assert (=> d!56913 (= lt!97142 (containsKey!249 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (=> d!56913 (= (contains!1363 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) lt!97140)))

(declare-fun b!194615 () Bool)

(declare-fun lt!97141 () Unit!5858)

(assert (=> b!194615 (= e!128019 lt!97141)))

(assert (=> b!194615 (= lt!97141 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (=> b!194615 (isDefined!198 (getValueByKey!246 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun b!194616 () Bool)

(declare-fun Unit!5878 () Unit!5858)

(assert (=> b!194616 (= e!128019 Unit!5878)))

(declare-fun b!194617 () Bool)

(assert (=> b!194617 (= e!128020 (isDefined!198 (getValueByKey!246 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(assert (= (and d!56913 c!35139) b!194615))

(assert (= (and d!56913 (not c!35139)) b!194616))

(assert (= (and d!56913 (not res!91974)) b!194617))

(assert (=> d!56913 m!220871))

(declare-fun m!221769 () Bool)

(assert (=> d!56913 m!221769))

(assert (=> b!194615 m!220871))

(declare-fun m!221771 () Bool)

(assert (=> b!194615 m!221771))

(assert (=> b!194615 m!220871))

(declare-fun m!221773 () Bool)

(assert (=> b!194615 m!221773))

(assert (=> b!194615 m!221773))

(declare-fun m!221775 () Bool)

(assert (=> b!194615 m!221775))

(assert (=> b!194617 m!220871))

(assert (=> b!194617 m!221773))

(assert (=> b!194617 m!221773))

(assert (=> b!194617 m!221775))

(assert (=> b!194201 d!56913))

(assert (=> b!194201 d!56741))

(declare-fun d!56915 () Bool)

(declare-fun e!128022 () Bool)

(assert (=> d!56915 e!128022))

(declare-fun res!91975 () Bool)

(assert (=> d!56915 (=> res!91975 e!128022)))

(declare-fun lt!97144 () Bool)

(assert (=> d!56915 (= res!91975 (not lt!97144))))

(declare-fun lt!97146 () Bool)

(assert (=> d!56915 (= lt!97144 lt!97146)))

(declare-fun lt!97143 () Unit!5858)

(declare-fun e!128021 () Unit!5858)

(assert (=> d!56915 (= lt!97143 e!128021)))

(declare-fun c!35140 () Bool)

(assert (=> d!56915 (= c!35140 lt!97146)))

(assert (=> d!56915 (= lt!97146 (containsKey!249 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56915 (= (contains!1363 lt!96864 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97144)))

(declare-fun b!194618 () Bool)

(declare-fun lt!97145 () Unit!5858)

(assert (=> b!194618 (= e!128021 lt!97145)))

(assert (=> b!194618 (= lt!97145 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194618 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194619 () Bool)

(declare-fun Unit!5879 () Unit!5858)

(assert (=> b!194619 (= e!128021 Unit!5879)))

(declare-fun b!194620 () Bool)

(assert (=> b!194620 (= e!128022 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56915 c!35140) b!194618))

(assert (= (and d!56915 (not c!35140)) b!194619))

(assert (= (and d!56915 (not res!91975)) b!194620))

(declare-fun m!221777 () Bool)

(assert (=> d!56915 m!221777))

(declare-fun m!221779 () Bool)

(assert (=> b!194618 m!221779))

(assert (=> b!194618 m!221385))

(assert (=> b!194618 m!221385))

(declare-fun m!221781 () Bool)

(assert (=> b!194618 m!221781))

(assert (=> b!194620 m!221385))

(assert (=> b!194620 m!221385))

(assert (=> b!194620 m!221781))

(assert (=> bm!19610 d!56915))

(assert (=> d!56743 d!56725))

(declare-fun d!56917 () Bool)

(declare-fun e!128032 () Bool)

(assert (=> d!56917 e!128032))

(declare-fun c!35145 () Bool)

(declare-fun lt!97149 () SeekEntryResult!682)

(assert (=> d!56917 (= c!35145 ((_ is MissingZero!682) lt!97149))))

(assert (=> d!56917 (= lt!97149 (seekEntryOrOpen!0 key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(assert (=> d!56917 true))

(declare-fun _$34!1087 () Unit!5858)

(assert (=> d!56917 (= (choose!1073 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)) _$34!1087)))

(declare-fun b!194637 () Bool)

(declare-fun res!91986 () Bool)

(assert (=> b!194637 (= res!91986 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4898 lt!97149)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128033 () Bool)

(assert (=> b!194637 (=> (not res!91986) (not e!128033))))

(declare-fun b!194638 () Bool)

(declare-fun e!128031 () Bool)

(assert (=> b!194638 (= e!128031 ((_ is Undefined!682) lt!97149))))

(declare-fun bm!19671 () Bool)

(declare-fun call!19674 () Bool)

(assert (=> bm!19671 (= call!19674 (arrayContainsKey!0 (_keys!5953 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!194639 () Bool)

(assert (=> b!194639 (= e!128032 e!128031)))

(declare-fun c!35146 () Bool)

(assert (=> b!194639 (= c!35146 ((_ is MissingVacant!682) lt!97149))))

(declare-fun b!194640 () Bool)

(declare-fun e!128034 () Bool)

(assert (=> b!194640 (= e!128034 (not call!19674))))

(declare-fun b!194641 () Bool)

(declare-fun res!91985 () Bool)

(assert (=> b!194641 (=> (not res!91985) (not e!128034))))

(assert (=> b!194641 (= res!91985 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4901 lt!97149)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194642 () Bool)

(assert (=> b!194642 (= e!128032 e!128033)))

(declare-fun res!91987 () Bool)

(declare-fun call!19675 () Bool)

(assert (=> b!194642 (= res!91987 call!19675)))

(assert (=> b!194642 (=> (not res!91987) (not e!128033))))

(declare-fun bm!19672 () Bool)

(assert (=> bm!19672 (= call!19675 (inRange!0 (ite c!35145 (index!4898 lt!97149) (index!4901 lt!97149)) (mask!9222 thiss!1248)))))

(declare-fun b!194643 () Bool)

(declare-fun res!91984 () Bool)

(assert (=> b!194643 (=> (not res!91984) (not e!128034))))

(assert (=> b!194643 (= res!91984 call!19675)))

(assert (=> b!194643 (= e!128031 e!128034)))

(declare-fun b!194644 () Bool)

(assert (=> b!194644 (= e!128033 (not call!19674))))

(assert (= (and d!56917 c!35145) b!194642))

(assert (= (and d!56917 (not c!35145)) b!194639))

(assert (= (and b!194642 res!91987) b!194637))

(assert (= (and b!194637 res!91986) b!194644))

(assert (= (and b!194639 c!35146) b!194643))

(assert (= (and b!194639 (not c!35146)) b!194638))

(assert (= (and b!194643 res!91984) b!194641))

(assert (= (and b!194641 res!91985) b!194640))

(assert (= (or b!194642 b!194643) bm!19672))

(assert (= (or b!194644 b!194640) bm!19671))

(declare-fun m!221783 () Bool)

(assert (=> b!194637 m!221783))

(declare-fun m!221785 () Bool)

(assert (=> bm!19672 m!221785))

(assert (=> d!56917 m!220909))

(declare-fun m!221787 () Bool)

(assert (=> b!194641 m!221787))

(assert (=> bm!19671 m!221191))

(assert (=> d!56743 d!56917))

(assert (=> d!56743 d!56831))

(declare-fun d!56919 () Bool)

(assert (=> d!56919 (= (apply!188 lt!96864 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2244 (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7770 () Bool)

(assert (= bs!7770 d!56919))

(assert (=> bs!7770 m!221041))

(assert (=> bs!7770 m!221341))

(assert (=> bs!7770 m!221341))

(declare-fun m!221789 () Bool)

(assert (=> bs!7770 m!221789))

(assert (=> b!194157 d!56919))

(declare-fun d!56921 () Bool)

(declare-fun c!35147 () Bool)

(assert (=> d!56921 (= c!35147 ((_ is ValueCellFull!1901) (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128035 () V!5633)

(assert (=> d!56921 (= (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!128035)))

(declare-fun b!194645 () Bool)

(assert (=> b!194645 (= e!128035 (get!2245 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194646 () Bool)

(assert (=> b!194646 (= e!128035 (get!2246 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56921 c!35147) b!194645))

(assert (= (and d!56921 (not c!35147)) b!194646))

(assert (=> b!194645 m!221055))

(assert (=> b!194645 m!221057))

(declare-fun m!221791 () Bool)

(assert (=> b!194645 m!221791))

(assert (=> b!194646 m!221055))

(assert (=> b!194646 m!221057))

(declare-fun m!221793 () Bool)

(assert (=> b!194646 m!221793))

(assert (=> b!194157 d!56921))

(assert (=> b!194202 d!56823))

(declare-fun d!56923 () Bool)

(declare-fun e!128036 () Bool)

(assert (=> d!56923 e!128036))

(declare-fun res!91989 () Bool)

(assert (=> d!56923 (=> (not res!91989) (not e!128036))))

(declare-fun lt!97150 () ListLongMap!2421)

(assert (=> d!56923 (= res!91989 (contains!1363 lt!97150 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97152 () List!2408)

(assert (=> d!56923 (= lt!97150 (ListLongMap!2422 lt!97152))))

(declare-fun lt!97153 () Unit!5858)

(declare-fun lt!97151 () Unit!5858)

(assert (=> d!56923 (= lt!97153 lt!97151)))

(assert (=> d!56923 (= (getValueByKey!246 lt!97152 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56923 (= lt!97151 (lemmaContainsTupThenGetReturnValue!133 lt!97152 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56923 (= lt!97152 (insertStrictlySorted!136 (toList!1226 call!19620) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56923 (= (+!319 call!19620 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!97150)))

(declare-fun b!194647 () Bool)

(declare-fun res!91988 () Bool)

(assert (=> b!194647 (=> (not res!91988) (not e!128036))))

(assert (=> b!194647 (= res!91988 (= (getValueByKey!246 (toList!1226 lt!97150) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194648 () Bool)

(assert (=> b!194648 (= e!128036 (contains!1365 (toList!1226 lt!97150) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!56923 res!91989) b!194647))

(assert (= (and b!194647 res!91988) b!194648))

(declare-fun m!221795 () Bool)

(assert (=> d!56923 m!221795))

(declare-fun m!221797 () Bool)

(assert (=> d!56923 m!221797))

(declare-fun m!221799 () Bool)

(assert (=> d!56923 m!221799))

(declare-fun m!221801 () Bool)

(assert (=> d!56923 m!221801))

(declare-fun m!221803 () Bool)

(assert (=> b!194647 m!221803))

(declare-fun m!221805 () Bool)

(assert (=> b!194648 m!221805))

(assert (=> b!194220 d!56923))

(assert (=> b!194222 d!56823))

(declare-fun d!56925 () Bool)

(declare-fun lt!97154 () Bool)

(assert (=> d!56925 (= lt!97154 (select (content!156 (toList!1226 lt!96885)) lt!96690))))

(declare-fun e!128038 () Bool)

(assert (=> d!56925 (= lt!97154 e!128038)))

(declare-fun res!91990 () Bool)

(assert (=> d!56925 (=> (not res!91990) (not e!128038))))

(assert (=> d!56925 (= res!91990 ((_ is Cons!2404) (toList!1226 lt!96885)))))

(assert (=> d!56925 (= (contains!1365 (toList!1226 lt!96885) lt!96690) lt!97154)))

(declare-fun b!194649 () Bool)

(declare-fun e!128037 () Bool)

(assert (=> b!194649 (= e!128038 e!128037)))

(declare-fun res!91991 () Bool)

(assert (=> b!194649 (=> res!91991 e!128037)))

(assert (=> b!194649 (= res!91991 (= (h!3045 (toList!1226 lt!96885)) lt!96690))))

(declare-fun b!194650 () Bool)

(assert (=> b!194650 (= e!128037 (contains!1365 (t!7326 (toList!1226 lt!96885)) lt!96690))))

(assert (= (and d!56925 res!91990) b!194649))

(assert (= (and b!194649 (not res!91991)) b!194650))

(declare-fun m!221807 () Bool)

(assert (=> d!56925 m!221807))

(declare-fun m!221809 () Bool)

(assert (=> d!56925 m!221809))

(declare-fun m!221811 () Bool)

(assert (=> b!194650 m!221811))

(assert (=> b!194183 d!56925))

(declare-fun d!56927 () Bool)

(assert (=> d!56927 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96700) key!828))))

(declare-fun lt!97155 () Unit!5858)

(assert (=> d!56927 (= lt!97155 (choose!1077 (toList!1226 lt!96700) key!828))))

(declare-fun e!128039 () Bool)

(assert (=> d!56927 e!128039))

(declare-fun res!91992 () Bool)

(assert (=> d!56927 (=> (not res!91992) (not e!128039))))

(assert (=> d!56927 (= res!91992 (isStrictlySorted!344 (toList!1226 lt!96700)))))

(assert (=> d!56927 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96700) key!828) lt!97155)))

(declare-fun b!194651 () Bool)

(assert (=> b!194651 (= e!128039 (containsKey!249 (toList!1226 lt!96700) key!828))))

(assert (= (and d!56927 res!91992) b!194651))

(assert (=> d!56927 m!221035))

(assert (=> d!56927 m!221035))

(assert (=> d!56927 m!221037))

(declare-fun m!221813 () Bool)

(assert (=> d!56927 m!221813))

(assert (=> d!56927 m!221371))

(assert (=> b!194651 m!221031))

(assert (=> b!194110 d!56927))

(declare-fun d!56929 () Bool)

(assert (=> d!56929 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96700) key!828)) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96700) key!828))))))

(declare-fun bs!7771 () Bool)

(assert (= bs!7771 d!56929))

(assert (=> bs!7771 m!221035))

(declare-fun m!221815 () Bool)

(assert (=> bs!7771 m!221815))

(assert (=> b!194110 d!56929))

(declare-fun b!194653 () Bool)

(declare-fun e!128040 () Option!252)

(declare-fun e!128041 () Option!252)

(assert (=> b!194653 (= e!128040 e!128041)))

(declare-fun c!35149 () Bool)

(assert (=> b!194653 (= c!35149 (and ((_ is Cons!2404) (toList!1226 lt!96700)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96700))) key!828))))))

(declare-fun b!194655 () Bool)

(assert (=> b!194655 (= e!128041 None!250)))

(declare-fun d!56931 () Bool)

(declare-fun c!35148 () Bool)

(assert (=> d!56931 (= c!35148 (and ((_ is Cons!2404) (toList!1226 lt!96700)) (= (_1!1761 (h!3045 (toList!1226 lt!96700))) key!828)))))

(assert (=> d!56931 (= (getValueByKey!246 (toList!1226 lt!96700) key!828) e!128040)))

(declare-fun b!194654 () Bool)

(assert (=> b!194654 (= e!128041 (getValueByKey!246 (t!7326 (toList!1226 lt!96700)) key!828))))

(declare-fun b!194652 () Bool)

(assert (=> b!194652 (= e!128040 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96700)))))))

(assert (= (and d!56931 c!35148) b!194652))

(assert (= (and d!56931 (not c!35148)) b!194653))

(assert (= (and b!194653 c!35149) b!194654))

(assert (= (and b!194653 (not c!35149)) b!194655))

(declare-fun m!221817 () Bool)

(assert (=> b!194654 m!221817))

(assert (=> b!194110 d!56931))

(assert (=> d!56741 d!56831))

(assert (=> b!194112 d!56929))

(assert (=> b!194112 d!56931))

(declare-fun d!56933 () Bool)

(declare-fun e!128043 () Bool)

(assert (=> d!56933 e!128043))

(declare-fun res!91993 () Bool)

(assert (=> d!56933 (=> res!91993 e!128043)))

(declare-fun lt!97157 () Bool)

(assert (=> d!56933 (= res!91993 (not lt!97157))))

(declare-fun lt!97159 () Bool)

(assert (=> d!56933 (= lt!97157 lt!97159)))

(declare-fun lt!97156 () Unit!5858)

(declare-fun e!128042 () Unit!5858)

(assert (=> d!56933 (= lt!97156 e!128042)))

(declare-fun c!35150 () Bool)

(assert (=> d!56933 (= c!35150 lt!97159)))

(assert (=> d!56933 (= lt!97159 (containsKey!249 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56933 (= (contains!1363 lt!96908 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97157)))

(declare-fun b!194656 () Bool)

(declare-fun lt!97158 () Unit!5858)

(assert (=> b!194656 (= e!128042 lt!97158)))

(assert (=> b!194656 (= lt!97158 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194656 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194657 () Bool)

(declare-fun Unit!5880 () Unit!5858)

(assert (=> b!194657 (= e!128042 Unit!5880)))

(declare-fun b!194658 () Bool)

(assert (=> b!194658 (= e!128043 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56933 c!35150) b!194656))

(assert (= (and d!56933 (not c!35150)) b!194657))

(assert (= (and d!56933 (not res!91993)) b!194658))

(declare-fun m!221819 () Bool)

(assert (=> d!56933 m!221819))

(declare-fun m!221821 () Bool)

(assert (=> b!194656 m!221821))

(assert (=> b!194656 m!221373))

(assert (=> b!194656 m!221373))

(declare-fun m!221823 () Bool)

(assert (=> b!194656 m!221823))

(assert (=> b!194658 m!221373))

(assert (=> b!194658 m!221373))

(assert (=> b!194658 m!221823))

(assert (=> bm!19618 d!56933))

(declare-fun d!56935 () Bool)

(declare-fun lt!97160 () (_ BitVec 32))

(assert (=> d!56935 (and (bvsge lt!97160 #b00000000000000000000000000000000) (bvsle lt!97160 (bvsub (size!4190 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun e!128045 () (_ BitVec 32))

(assert (=> d!56935 (= lt!97160 e!128045)))

(declare-fun c!35152 () Bool)

(assert (=> d!56935 (= c!35152 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!56935 (and (bvsle #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4190 (_keys!5953 lt!96692)) (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!56935 (= (arrayCountValidKeys!0 (_keys!5953 lt!96692) #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))) lt!97160)))

(declare-fun b!194659 () Bool)

(declare-fun e!128044 () (_ BitVec 32))

(assert (=> b!194659 (= e!128045 e!128044)))

(declare-fun c!35151 () Bool)

(assert (=> b!194659 (= c!35151 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun b!194660 () Bool)

(declare-fun call!19676 () (_ BitVec 32))

(assert (=> b!194660 (= e!128044 (bvadd #b00000000000000000000000000000001 call!19676))))

(declare-fun b!194661 () Bool)

(assert (=> b!194661 (= e!128045 #b00000000000000000000000000000000)))

(declare-fun b!194662 () Bool)

(assert (=> b!194662 (= e!128044 call!19676)))

(declare-fun bm!19673 () Bool)

(assert (=> bm!19673 (= call!19676 (arrayCountValidKeys!0 (_keys!5953 lt!96692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 lt!96692))))))

(assert (= (and d!56935 c!35152) b!194661))

(assert (= (and d!56935 (not c!35152)) b!194659))

(assert (= (and b!194659 c!35151) b!194660))

(assert (= (and b!194659 (not c!35151)) b!194662))

(assert (= (or b!194660 b!194662) bm!19673))

(assert (=> b!194659 m!221539))

(assert (=> b!194659 m!221539))

(assert (=> b!194659 m!221547))

(declare-fun m!221825 () Bool)

(assert (=> bm!19673 m!221825))

(assert (=> b!194196 d!56935))

(declare-fun d!56937 () Bool)

(declare-fun e!128047 () Bool)

(assert (=> d!56937 e!128047))

(declare-fun res!91994 () Bool)

(assert (=> d!56937 (=> res!91994 e!128047)))

(declare-fun lt!97162 () Bool)

(assert (=> d!56937 (= res!91994 (not lt!97162))))

(declare-fun lt!97164 () Bool)

(assert (=> d!56937 (= lt!97162 lt!97164)))

(declare-fun lt!97161 () Unit!5858)

(declare-fun e!128046 () Unit!5858)

(assert (=> d!56937 (= lt!97161 e!128046)))

(declare-fun c!35153 () Bool)

(assert (=> d!56937 (= c!35153 lt!97164)))

(assert (=> d!56937 (= lt!97164 (containsKey!249 (toList!1226 lt!96927) (_1!1761 lt!96690)))))

(assert (=> d!56937 (= (contains!1363 lt!96927 (_1!1761 lt!96690)) lt!97162)))

(declare-fun b!194663 () Bool)

(declare-fun lt!97163 () Unit!5858)

(assert (=> b!194663 (= e!128046 lt!97163)))

(assert (=> b!194663 (= lt!97163 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96927) (_1!1761 lt!96690)))))

(assert (=> b!194663 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96927) (_1!1761 lt!96690)))))

(declare-fun b!194664 () Bool)

(declare-fun Unit!5881 () Unit!5858)

(assert (=> b!194664 (= e!128046 Unit!5881)))

(declare-fun b!194665 () Bool)

(assert (=> b!194665 (= e!128047 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96927) (_1!1761 lt!96690))))))

(assert (= (and d!56937 c!35153) b!194663))

(assert (= (and d!56937 (not c!35153)) b!194664))

(assert (= (and d!56937 (not res!91994)) b!194665))

(declare-fun m!221827 () Bool)

(assert (=> d!56937 m!221827))

(declare-fun m!221829 () Bool)

(assert (=> b!194663 m!221829))

(assert (=> b!194663 m!221205))

(assert (=> b!194663 m!221205))

(declare-fun m!221831 () Bool)

(assert (=> b!194663 m!221831))

(assert (=> b!194665 m!221205))

(assert (=> b!194665 m!221205))

(assert (=> b!194665 m!221831))

(assert (=> d!56745 d!56937))

(declare-fun b!194667 () Bool)

(declare-fun e!128048 () Option!252)

(declare-fun e!128049 () Option!252)

(assert (=> b!194667 (= e!128048 e!128049)))

(declare-fun c!35155 () Bool)

(assert (=> b!194667 (= c!35155 (and ((_ is Cons!2404) lt!96929) (not (= (_1!1761 (h!3045 lt!96929)) (_1!1761 lt!96690)))))))

(declare-fun b!194669 () Bool)

(assert (=> b!194669 (= e!128049 None!250)))

(declare-fun d!56939 () Bool)

(declare-fun c!35154 () Bool)

(assert (=> d!56939 (= c!35154 (and ((_ is Cons!2404) lt!96929) (= (_1!1761 (h!3045 lt!96929)) (_1!1761 lt!96690))))))

(assert (=> d!56939 (= (getValueByKey!246 lt!96929 (_1!1761 lt!96690)) e!128048)))

(declare-fun b!194668 () Bool)

(assert (=> b!194668 (= e!128049 (getValueByKey!246 (t!7326 lt!96929) (_1!1761 lt!96690)))))

(declare-fun b!194666 () Bool)

(assert (=> b!194666 (= e!128048 (Some!251 (_2!1761 (h!3045 lt!96929))))))

(assert (= (and d!56939 c!35154) b!194666))

(assert (= (and d!56939 (not c!35154)) b!194667))

(assert (= (and b!194667 c!35155) b!194668))

(assert (= (and b!194667 (not c!35155)) b!194669))

(declare-fun m!221833 () Bool)

(assert (=> b!194668 m!221833))

(assert (=> d!56745 d!56939))

(declare-fun d!56941 () Bool)

(assert (=> d!56941 (= (getValueByKey!246 lt!96929 (_1!1761 lt!96690)) (Some!251 (_2!1761 lt!96690)))))

(declare-fun lt!97165 () Unit!5858)

(assert (=> d!56941 (= lt!97165 (choose!1076 lt!96929 (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(declare-fun e!128050 () Bool)

(assert (=> d!56941 e!128050))

(declare-fun res!91995 () Bool)

(assert (=> d!56941 (=> (not res!91995) (not e!128050))))

(assert (=> d!56941 (= res!91995 (isStrictlySorted!344 lt!96929))))

(assert (=> d!56941 (= (lemmaContainsTupThenGetReturnValue!133 lt!96929 (_1!1761 lt!96690) (_2!1761 lt!96690)) lt!97165)))

(declare-fun b!194670 () Bool)

(declare-fun res!91996 () Bool)

(assert (=> b!194670 (=> (not res!91996) (not e!128050))))

(assert (=> b!194670 (= res!91996 (containsKey!249 lt!96929 (_1!1761 lt!96690)))))

(declare-fun b!194671 () Bool)

(assert (=> b!194671 (= e!128050 (contains!1365 lt!96929 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(assert (= (and d!56941 res!91995) b!194670))

(assert (= (and b!194670 res!91996) b!194671))

(assert (=> d!56941 m!221199))

(declare-fun m!221835 () Bool)

(assert (=> d!56941 m!221835))

(declare-fun m!221837 () Bool)

(assert (=> d!56941 m!221837))

(declare-fun m!221839 () Bool)

(assert (=> b!194670 m!221839))

(declare-fun m!221841 () Bool)

(assert (=> b!194671 m!221841))

(assert (=> d!56745 d!56941))

(declare-fun b!194672 () Bool)

(declare-fun e!128052 () Bool)

(declare-fun lt!97166 () List!2408)

(assert (=> b!194672 (= e!128052 (contains!1365 lt!97166 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun bm!19674 () Bool)

(declare-fun call!19679 () List!2408)

(declare-fun call!19677 () List!2408)

(assert (=> bm!19674 (= call!19679 call!19677)))

(declare-fun b!194673 () Bool)

(declare-fun e!128051 () List!2408)

(assert (=> b!194673 (= e!128051 (insertStrictlySorted!136 (t!7326 (toList!1226 (map!2018 thiss!1248))) (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(declare-fun b!194674 () Bool)

(declare-fun e!128055 () List!2408)

(declare-fun call!19678 () List!2408)

(assert (=> b!194674 (= e!128055 call!19678)))

(declare-fun b!194675 () Bool)

(declare-fun res!91997 () Bool)

(assert (=> b!194675 (=> (not res!91997) (not e!128052))))

(assert (=> b!194675 (= res!91997 (containsKey!249 lt!97166 (_1!1761 lt!96690)))))

(declare-fun bm!19675 () Bool)

(assert (=> bm!19675 (= call!19678 call!19679)))

(declare-fun b!194676 () Bool)

(declare-fun c!35158 () Bool)

(assert (=> b!194676 (= c!35158 (and ((_ is Cons!2404) (toList!1226 (map!2018 thiss!1248))) (bvsgt (_1!1761 (h!3045 (toList!1226 (map!2018 thiss!1248)))) (_1!1761 lt!96690))))))

(declare-fun e!128054 () List!2408)

(assert (=> b!194676 (= e!128054 e!128055)))

(declare-fun b!194677 () Bool)

(assert (=> b!194677 (= e!128054 call!19679)))

(declare-fun b!194678 () Bool)

(declare-fun e!128053 () List!2408)

(assert (=> b!194678 (= e!128053 e!128054)))

(declare-fun c!35156 () Bool)

(assert (=> b!194678 (= c!35156 (and ((_ is Cons!2404) (toList!1226 (map!2018 thiss!1248))) (= (_1!1761 (h!3045 (toList!1226 (map!2018 thiss!1248)))) (_1!1761 lt!96690))))))

(declare-fun b!194680 () Bool)

(assert (=> b!194680 (= e!128055 call!19678)))

(declare-fun bm!19676 () Bool)

(declare-fun c!35159 () Bool)

(assert (=> bm!19676 (= call!19677 ($colon$colon!102 e!128051 (ite c!35159 (h!3045 (toList!1226 (map!2018 thiss!1248))) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690)))))))

(declare-fun c!35157 () Bool)

(assert (=> bm!19676 (= c!35157 c!35159)))

(declare-fun b!194681 () Bool)

(assert (=> b!194681 (= e!128053 call!19677)))

(declare-fun b!194679 () Bool)

(assert (=> b!194679 (= e!128051 (ite c!35156 (t!7326 (toList!1226 (map!2018 thiss!1248))) (ite c!35158 (Cons!2404 (h!3045 (toList!1226 (map!2018 thiss!1248))) (t!7326 (toList!1226 (map!2018 thiss!1248)))) Nil!2405)))))

(declare-fun d!56943 () Bool)

(assert (=> d!56943 e!128052))

(declare-fun res!91998 () Bool)

(assert (=> d!56943 (=> (not res!91998) (not e!128052))))

(assert (=> d!56943 (= res!91998 (isStrictlySorted!344 lt!97166))))

(assert (=> d!56943 (= lt!97166 e!128053)))

(assert (=> d!56943 (= c!35159 (and ((_ is Cons!2404) (toList!1226 (map!2018 thiss!1248))) (bvslt (_1!1761 (h!3045 (toList!1226 (map!2018 thiss!1248)))) (_1!1761 lt!96690))))))

(assert (=> d!56943 (isStrictlySorted!344 (toList!1226 (map!2018 thiss!1248)))))

(assert (=> d!56943 (= (insertStrictlySorted!136 (toList!1226 (map!2018 thiss!1248)) (_1!1761 lt!96690) (_2!1761 lt!96690)) lt!97166)))

(assert (= (and d!56943 c!35159) b!194681))

(assert (= (and d!56943 (not c!35159)) b!194678))

(assert (= (and b!194678 c!35156) b!194677))

(assert (= (and b!194678 (not c!35156)) b!194676))

(assert (= (and b!194676 c!35158) b!194680))

(assert (= (and b!194676 (not c!35158)) b!194674))

(assert (= (or b!194680 b!194674) bm!19675))

(assert (= (or b!194677 bm!19675) bm!19674))

(assert (= (or b!194681 bm!19674) bm!19676))

(assert (= (and bm!19676 c!35157) b!194673))

(assert (= (and bm!19676 (not c!35157)) b!194679))

(assert (= (and d!56943 res!91998) b!194675))

(assert (= (and b!194675 res!91997) b!194672))

(declare-fun m!221843 () Bool)

(assert (=> b!194675 m!221843))

(declare-fun m!221845 () Bool)

(assert (=> b!194673 m!221845))

(declare-fun m!221847 () Bool)

(assert (=> bm!19676 m!221847))

(declare-fun m!221849 () Bool)

(assert (=> b!194672 m!221849))

(declare-fun m!221851 () Bool)

(assert (=> d!56943 m!221851))

(declare-fun m!221853 () Bool)

(assert (=> d!56943 m!221853))

(assert (=> d!56745 d!56943))

(assert (=> d!56747 d!56729))

(declare-fun d!56945 () Bool)

(assert (=> d!56945 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96696) key!828))))

(declare-fun lt!97167 () Unit!5858)

(assert (=> d!56945 (= lt!97167 (choose!1077 (toList!1226 lt!96696) key!828))))

(declare-fun e!128056 () Bool)

(assert (=> d!56945 e!128056))

(declare-fun res!91999 () Bool)

(assert (=> d!56945 (=> (not res!91999) (not e!128056))))

(assert (=> d!56945 (= res!91999 (isStrictlySorted!344 (toList!1226 lt!96696)))))

(assert (=> d!56945 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96696) key!828) lt!97167)))

(declare-fun b!194682 () Bool)

(assert (=> b!194682 (= e!128056 (containsKey!249 (toList!1226 lt!96696) key!828))))

(assert (= (and d!56945 res!91999) b!194682))

(assert (=> d!56945 m!221003))

(assert (=> d!56945 m!221003))

(assert (=> d!56945 m!221005))

(declare-fun m!221855 () Bool)

(assert (=> d!56945 m!221855))

(declare-fun m!221857 () Bool)

(assert (=> d!56945 m!221857))

(assert (=> b!194682 m!220999))

(assert (=> b!194083 d!56945))

(assert (=> b!194083 d!56845))

(assert (=> b!194083 d!56847))

(declare-fun mapNonEmpty!7776 () Bool)

(declare-fun mapRes!7776 () Bool)

(declare-fun tp!17037 () Bool)

(declare-fun e!128057 () Bool)

(assert (=> mapNonEmpty!7776 (= mapRes!7776 (and tp!17037 e!128057))))

(declare-fun mapKey!7776 () (_ BitVec 32))

(declare-fun mapRest!7776 () (Array (_ BitVec 32) ValueCell!1901))

(declare-fun mapValue!7776 () ValueCell!1901)

(assert (=> mapNonEmpty!7776 (= mapRest!7775 (store mapRest!7776 mapKey!7776 mapValue!7776))))

(declare-fun b!194684 () Bool)

(declare-fun e!128058 () Bool)

(assert (=> b!194684 (= e!128058 tp_is_empty!4489)))

(declare-fun condMapEmpty!7776 () Bool)

(declare-fun mapDefault!7776 () ValueCell!1901)

(assert (=> mapNonEmpty!7775 (= condMapEmpty!7776 (= mapRest!7775 ((as const (Array (_ BitVec 32) ValueCell!1901)) mapDefault!7776)))))

(assert (=> mapNonEmpty!7775 (= tp!17036 (and e!128058 mapRes!7776))))

(declare-fun b!194683 () Bool)

(assert (=> b!194683 (= e!128057 tp_is_empty!4489)))

(declare-fun mapIsEmpty!7776 () Bool)

(assert (=> mapIsEmpty!7776 mapRes!7776))

(assert (= (and mapNonEmpty!7775 condMapEmpty!7776) mapIsEmpty!7776))

(assert (= (and mapNonEmpty!7775 (not condMapEmpty!7776)) mapNonEmpty!7776))

(assert (= (and mapNonEmpty!7776 ((_ is ValueCellFull!1901) mapValue!7776)) b!194683))

(assert (= (and mapNonEmpty!7775 ((_ is ValueCellFull!1901) mapDefault!7776)) b!194684))

(declare-fun m!221859 () Bool)

(assert (=> mapNonEmpty!7776 m!221859))

(declare-fun b_lambda!7521 () Bool)

(assert (= b_lambda!7515 (or (and b!194001 b_free!4717) b_lambda!7521)))

(declare-fun b_lambda!7523 () Bool)

(assert (= b_lambda!7511 (or (and b!194001 b_free!4717) b_lambda!7523)))

(declare-fun b_lambda!7525 () Bool)

(assert (= b_lambda!7513 (or (and b!194001 b_free!4717) b_lambda!7525)))

(declare-fun b_lambda!7527 () Bool)

(assert (= b_lambda!7517 (or (and b!194001 b_free!4717) b_lambda!7527)))

(declare-fun b_lambda!7529 () Bool)

(assert (= b_lambda!7509 (or (and b!194001 b_free!4717) b_lambda!7529)))

(check-sat (not d!56793) (not b!194528) (not d!56863) (not b!194342) (not d!56887) (not b!194672) (not b!194438) (not d!56817) (not b!194535) (not b!194398) (not b!194675) (not bm!19650) (not b!194289) (not d!56925) (not bm!19645) (not d!56781) (not b!194603) (not b!194371) (not b!194648) (not b!194565) (not b!194324) (not b!194309) (not b!194544) (not b!194606) (not b_lambda!7507) (not b!194646) (not d!56945) (not b!194415) (not d!56771) (not d!56897) (not d!56879) (not bm!19641) (not d!56941) (not b!194614) (not b!194459) (not b_lambda!7525) (not b!194308) (not b!194451) (not d!56861) (not b!194537) (not d!56905) (not b!194348) (not b!194645) (not b!194370) (not b!194542) (not d!56869) (not b!194654) (not b!194659) (not b!194647) (not b!194479) (not b_lambda!7523) (not b!194452) (not b!194464) (not d!56933) (not b_lambda!7529) (not b!194329) (not d!56801) (not b!194618) (not bm!19672) (not d!56875) (not d!56767) (not b!194298) (not d!56867) (not b_lambda!7505) (not b!194436) (not b!194433) (not d!56909) (not d!56913) (not b!194615) (not b_lambda!7527) (not b!194474) (not d!56821) (not b!194583) (not b!194559) (not b!194620) (not d!56855) (not b!194656) (not b!194331) (not d!56783) (not b!194532) (not d!56777) (not b!194605) (not d!56787) (not b!194538) (not bm!19671) (not b!194328) (not b!194299) (not bm!19644) (not d!56929) (not d!56753) (not b!194482) (not b!194580) (not bm!19673) (not d!56849) (not d!56829) (not d!56755) (not b!194435) (not b!194323) (not bm!19655) (not d!56853) (not b!194671) (not d!56813) b_and!11465 (not b!194284) (not b!194311) (not d!56773) (not d!56943) (not b!194612) (not bm!19664) (not b!194545) (not b!194413) (not b!194599) (not b!194595) (not d!56779) (not b!194447) (not b!194611) (not d!56871) (not b!194399) (not b!194437) (not b_lambda!7521) (not b!194608) (not b!194562) (not d!56901) (not b!194670) (not b!194587) (not d!56759) (not d!56937) (not b!194466) (not b!194394) (not bm!19660) (not d!56877) (not b!194594) (not d!56805) (not b!194302) (not b!194617) (not bm!19647) (not b!194551) (not b!194585) (not b!194448) (not bm!19652) (not b!194682) (not b!194385) (not d!56915) (not b!194548) (not d!56839) (not b!194291) (not d!56903) (not b!194297) (not b!194292) (not b!194663) (not bm!19666) (not d!56911) (not b!194349) (not b!194290) (not d!56763) (not d!56851) (not b!194300) (not d!56927) (not d!56919) (not d!56825) (not b!194373) (not d!56803) (not bm!19659) (not b!194458) (not b!194530) (not b!194650) (not b!194488) (not b!194546) (not d!56761) (not b!194397) (not b!194440) (not d!56795) (not b!194574) (not d!56865) (not d!56769) (not b!194285) (not b!194540) (not bm!19646) (not bm!19631) (not b!194610) (not b!194468) (not b!194541) (not b!194286) (not d!56845) (not b!194511) (not d!56757) (not d!56791) (not d!56785) (not b!194473) (not d!56809) (not b!194553) (not b_next!4717) (not bm!19640) (not d!56765) (not bm!19676) (not b!194326) (not d!56917) (not b!194461) (not b!194484) (not b!194392) (not mapNonEmpty!7776) (not d!56857) (not b!194434) (not b!194543) (not b!194665) (not d!56811) (not d!56923) (not d!56873) (not b!194293) (not bm!19658) (not b!194598) (not b!194391) (not d!56815) (not b!194456) (not d!56775) (not b_lambda!7519) (not b!194312) (not d!56859) (not bm!19661) (not d!56751) (not d!56895) (not b!194658) (not b!194490) (not b!194651) tp_is_empty!4489 (not b!194613) (not b!194400) (not b!194393) (not b!194673) (not b!194668) (not b!194485) (not b!194296) (not b!194401) (not d!56835) (not d!56893))
(check-sat b_and!11465 (not b_next!4717))
(get-model)

(declare-fun d!56947 () Bool)

(assert (=> d!56947 (arrayContainsKey!0 (_keys!5953 lt!96692) lt!97061 #b00000000000000000000000000000000)))

(declare-fun lt!97170 () Unit!5858)

(declare-fun choose!13 (array!8215 (_ BitVec 64) (_ BitVec 32)) Unit!5858)

(assert (=> d!56947 (= lt!97170 (choose!13 (_keys!5953 lt!96692) lt!97061 #b00000000000000000000000000000000))))

(assert (=> d!56947 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!56947 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5953 lt!96692) lt!97061 #b00000000000000000000000000000000) lt!97170)))

(declare-fun bs!7772 () Bool)

(assert (= bs!7772 d!56947))

(assert (=> bs!7772 m!221543))

(declare-fun m!221861 () Bool)

(assert (=> bs!7772 m!221861))

(assert (=> b!194488 d!56947))

(declare-fun d!56949 () Bool)

(declare-fun res!92000 () Bool)

(declare-fun e!128059 () Bool)

(assert (=> d!56949 (=> res!92000 e!128059)))

(assert (=> d!56949 (= res!92000 (= (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) lt!97061))))

(assert (=> d!56949 (= (arrayContainsKey!0 (_keys!5953 lt!96692) lt!97061 #b00000000000000000000000000000000) e!128059)))

(declare-fun b!194685 () Bool)

(declare-fun e!128060 () Bool)

(assert (=> b!194685 (= e!128059 e!128060)))

(declare-fun res!92001 () Bool)

(assert (=> b!194685 (=> (not res!92001) (not e!128060))))

(assert (=> b!194685 (= res!92001 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 lt!96692))))))

(declare-fun b!194686 () Bool)

(assert (=> b!194686 (= e!128060 (arrayContainsKey!0 (_keys!5953 lt!96692) lt!97061 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56949 (not res!92000)) b!194685))

(assert (= (and b!194685 res!92001) b!194686))

(assert (=> d!56949 m!221539))

(declare-fun m!221863 () Bool)

(assert (=> b!194686 m!221863))

(assert (=> b!194488 d!56949))

(declare-fun b!194687 () Bool)

(declare-fun e!128062 () SeekEntryResult!682)

(declare-fun lt!97172 () SeekEntryResult!682)

(assert (=> b!194687 (= e!128062 (Found!682 (index!4900 lt!97172)))))

(declare-fun b!194688 () Bool)

(declare-fun e!128061 () SeekEntryResult!682)

(assert (=> b!194688 (= e!128061 Undefined!682)))

(declare-fun b!194689 () Bool)

(declare-fun c!35161 () Bool)

(declare-fun lt!97171 () (_ BitVec 64))

(assert (=> b!194689 (= c!35161 (= lt!97171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128063 () SeekEntryResult!682)

(assert (=> b!194689 (= e!128062 e!128063)))

(declare-fun b!194690 () Bool)

(assert (=> b!194690 (= e!128063 (seekKeyOrZeroReturnVacant!0 (x!20678 lt!97172) (index!4900 lt!97172) (index!4900 lt!97172) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) (_keys!5953 lt!96692) (mask!9222 lt!96692)))))

(declare-fun d!56951 () Bool)

(declare-fun lt!97173 () SeekEntryResult!682)

(assert (=> d!56951 (and (or ((_ is Undefined!682) lt!97173) (not ((_ is Found!682) lt!97173)) (and (bvsge (index!4899 lt!97173) #b00000000000000000000000000000000) (bvslt (index!4899 lt!97173) (size!4190 (_keys!5953 lt!96692))))) (or ((_ is Undefined!682) lt!97173) ((_ is Found!682) lt!97173) (not ((_ is MissingZero!682) lt!97173)) (and (bvsge (index!4898 lt!97173) #b00000000000000000000000000000000) (bvslt (index!4898 lt!97173) (size!4190 (_keys!5953 lt!96692))))) (or ((_ is Undefined!682) lt!97173) ((_ is Found!682) lt!97173) ((_ is MissingZero!682) lt!97173) (not ((_ is MissingVacant!682) lt!97173)) (and (bvsge (index!4901 lt!97173) #b00000000000000000000000000000000) (bvslt (index!4901 lt!97173) (size!4190 (_keys!5953 lt!96692))))) (or ((_ is Undefined!682) lt!97173) (ite ((_ is Found!682) lt!97173) (= (select (arr!3866 (_keys!5953 lt!96692)) (index!4899 lt!97173)) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!682) lt!97173) (= (select (arr!3866 (_keys!5953 lt!96692)) (index!4898 lt!97173)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!682) lt!97173) (= (select (arr!3866 (_keys!5953 lt!96692)) (index!4901 lt!97173)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56951 (= lt!97173 e!128061)))

(declare-fun c!35162 () Bool)

(assert (=> d!56951 (= c!35162 (and ((_ is Intermediate!682) lt!97172) (undefined!1494 lt!97172)))))

(assert (=> d!56951 (= lt!97172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) (mask!9222 lt!96692)) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) (_keys!5953 lt!96692) (mask!9222 lt!96692)))))

(assert (=> d!56951 (validMask!0 (mask!9222 lt!96692))))

(assert (=> d!56951 (= (seekEntryOrOpen!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) (_keys!5953 lt!96692) (mask!9222 lt!96692)) lt!97173)))

(declare-fun b!194691 () Bool)

(assert (=> b!194691 (= e!128063 (MissingZero!682 (index!4900 lt!97172)))))

(declare-fun b!194692 () Bool)

(assert (=> b!194692 (= e!128061 e!128062)))

(assert (=> b!194692 (= lt!97171 (select (arr!3866 (_keys!5953 lt!96692)) (index!4900 lt!97172)))))

(declare-fun c!35160 () Bool)

(assert (=> b!194692 (= c!35160 (= lt!97171 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (= (and d!56951 c!35162) b!194688))

(assert (= (and d!56951 (not c!35162)) b!194692))

(assert (= (and b!194692 c!35160) b!194687))

(assert (= (and b!194692 (not c!35160)) b!194689))

(assert (= (and b!194689 c!35161) b!194691))

(assert (= (and b!194689 (not c!35161)) b!194690))

(assert (=> b!194690 m!221539))

(declare-fun m!221865 () Bool)

(assert (=> b!194690 m!221865))

(declare-fun m!221867 () Bool)

(assert (=> d!56951 m!221867))

(declare-fun m!221869 () Bool)

(assert (=> d!56951 m!221869))

(declare-fun m!221871 () Bool)

(assert (=> d!56951 m!221871))

(assert (=> d!56951 m!221539))

(declare-fun m!221873 () Bool)

(assert (=> d!56951 m!221873))

(declare-fun m!221875 () Bool)

(assert (=> d!56951 m!221875))

(assert (=> d!56951 m!221535))

(assert (=> d!56951 m!221539))

(assert (=> d!56951 m!221871))

(declare-fun m!221877 () Bool)

(assert (=> b!194692 m!221877))

(assert (=> b!194488 d!56951))

(declare-fun d!56953 () Bool)

(assert (=> d!56953 (= (apply!188 lt!97036 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2244 (getValueByKey!246 (toList!1226 lt!97036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7773 () Bool)

(assert (= bs!7773 d!56953))

(declare-fun m!221879 () Bool)

(assert (=> bs!7773 m!221879))

(assert (=> bs!7773 m!221879))

(declare-fun m!221881 () Bool)

(assert (=> bs!7773 m!221881))

(assert (=> b!194451 d!56953))

(assert (=> b!194400 d!56823))

(declare-fun d!56955 () Bool)

(assert (=> d!56955 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96920) lt!96914)) (v!4257 (getValueByKey!246 (toList!1226 lt!96920) lt!96914)))))

(assert (=> d!56759 d!56955))

(declare-fun b!194694 () Bool)

(declare-fun e!128064 () Option!252)

(declare-fun e!128065 () Option!252)

(assert (=> b!194694 (= e!128064 e!128065)))

(declare-fun c!35164 () Bool)

(assert (=> b!194694 (= c!35164 (and ((_ is Cons!2404) (toList!1226 lt!96920)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96920))) lt!96914))))))

(declare-fun b!194696 () Bool)

(assert (=> b!194696 (= e!128065 None!250)))

(declare-fun d!56957 () Bool)

(declare-fun c!35163 () Bool)

(assert (=> d!56957 (= c!35163 (and ((_ is Cons!2404) (toList!1226 lt!96920)) (= (_1!1761 (h!3045 (toList!1226 lt!96920))) lt!96914)))))

(assert (=> d!56957 (= (getValueByKey!246 (toList!1226 lt!96920) lt!96914) e!128064)))

(declare-fun b!194695 () Bool)

(assert (=> b!194695 (= e!128065 (getValueByKey!246 (t!7326 (toList!1226 lt!96920)) lt!96914))))

(declare-fun b!194693 () Bool)

(assert (=> b!194693 (= e!128064 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96920)))))))

(assert (= (and d!56957 c!35163) b!194693))

(assert (= (and d!56957 (not c!35163)) b!194694))

(assert (= (and b!194694 c!35164) b!194695))

(assert (= (and b!194694 (not c!35164)) b!194696))

(declare-fun m!221883 () Bool)

(assert (=> b!194695 m!221883))

(assert (=> d!56759 d!56957))

(declare-fun d!56959 () Bool)

(assert (=> d!56959 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97174 () Unit!5858)

(assert (=> d!56959 (= lt!97174 (choose!1077 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128066 () Bool)

(assert (=> d!56959 e!128066))

(declare-fun res!92002 () Bool)

(assert (=> d!56959 (=> (not res!92002) (not e!128066))))

(assert (=> d!56959 (= res!92002 (isStrictlySorted!344 (toList!1226 lt!96864)))))

(assert (=> d!56959 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000) lt!97174)))

(declare-fun b!194697 () Bool)

(assert (=> b!194697 (= e!128066 (containsKey!249 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56959 res!92002) b!194697))

(assert (=> d!56959 m!221515))

(assert (=> d!56959 m!221515))

(assert (=> d!56959 m!221517))

(declare-fun m!221885 () Bool)

(assert (=> d!56959 m!221885))

(declare-fun m!221887 () Bool)

(assert (=> d!56959 m!221887))

(assert (=> b!194697 m!221511))

(assert (=> b!194466 d!56959))

(declare-fun d!56961 () Bool)

(assert (=> d!56961 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7774 () Bool)

(assert (= bs!7774 d!56961))

(assert (=> bs!7774 m!221515))

(declare-fun m!221889 () Bool)

(assert (=> bs!7774 m!221889))

(assert (=> b!194466 d!56961))

(declare-fun b!194699 () Bool)

(declare-fun e!128067 () Option!252)

(declare-fun e!128068 () Option!252)

(assert (=> b!194699 (= e!128067 e!128068)))

(declare-fun c!35166 () Bool)

(assert (=> b!194699 (= c!35166 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96864))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194701 () Bool)

(assert (=> b!194701 (= e!128068 None!250)))

(declare-fun d!56963 () Bool)

(declare-fun c!35165 () Bool)

(assert (=> d!56963 (= c!35165 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (= (_1!1761 (h!3045 (toList!1226 lt!96864))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56963 (= (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000) e!128067)))

(declare-fun b!194700 () Bool)

(assert (=> b!194700 (= e!128068 (getValueByKey!246 (t!7326 (toList!1226 lt!96864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194698 () Bool)

(assert (=> b!194698 (= e!128067 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96864)))))))

(assert (= (and d!56963 c!35165) b!194698))

(assert (= (and d!56963 (not c!35165)) b!194699))

(assert (= (and b!194699 c!35166) b!194700))

(assert (= (and b!194699 (not c!35166)) b!194701))

(declare-fun m!221891 () Bool)

(assert (=> b!194700 m!221891))

(assert (=> b!194466 d!56963))

(declare-fun d!56965 () Bool)

(assert (=> d!56965 (= (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194585 d!56965))

(declare-fun d!56967 () Bool)

(declare-fun res!92003 () Bool)

(declare-fun e!128069 () Bool)

(assert (=> d!56967 (=> res!92003 e!128069)))

(assert (=> d!56967 (= res!92003 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (= (_1!1761 (h!3045 (toList!1226 lt!96908))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56967 (= (containsKey!249 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000) e!128069)))

(declare-fun b!194702 () Bool)

(declare-fun e!128070 () Bool)

(assert (=> b!194702 (= e!128069 e!128070)))

(declare-fun res!92004 () Bool)

(assert (=> b!194702 (=> (not res!92004) (not e!128070))))

(assert (=> b!194702 (= res!92004 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96908))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96908))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2404) (toList!1226 lt!96908)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96908))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194703 () Bool)

(assert (=> b!194703 (= e!128070 (containsKey!249 (t!7326 (toList!1226 lt!96908)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56967 (not res!92003)) b!194702))

(assert (= (and b!194702 res!92004) b!194703))

(declare-fun m!221893 () Bool)

(assert (=> b!194703 m!221893))

(assert (=> d!56817 d!56967))

(declare-fun d!56969 () Bool)

(assert (=> d!56969 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96927) (_1!1761 lt!96690))) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96927) (_1!1761 lt!96690)))))))

(declare-fun bs!7775 () Bool)

(assert (= bs!7775 d!56969))

(assert (=> bs!7775 m!221205))

(declare-fun m!221895 () Bool)

(assert (=> bs!7775 m!221895))

(assert (=> b!194665 d!56969))

(assert (=> b!194665 d!56883))

(assert (=> b!194438 d!56823))

(assert (=> b!194605 d!56965))

(declare-fun d!56971 () Bool)

(assert (=> d!56971 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96876) lt!96870)) (v!4257 (getValueByKey!246 (toList!1226 lt!96876) lt!96870)))))

(assert (=> d!56875 d!56971))

(declare-fun b!194705 () Bool)

(declare-fun e!128071 () Option!252)

(declare-fun e!128072 () Option!252)

(assert (=> b!194705 (= e!128071 e!128072)))

(declare-fun c!35168 () Bool)

(assert (=> b!194705 (= c!35168 (and ((_ is Cons!2404) (toList!1226 lt!96876)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96876))) lt!96870))))))

(declare-fun b!194707 () Bool)

(assert (=> b!194707 (= e!128072 None!250)))

(declare-fun d!56973 () Bool)

(declare-fun c!35167 () Bool)

(assert (=> d!56973 (= c!35167 (and ((_ is Cons!2404) (toList!1226 lt!96876)) (= (_1!1761 (h!3045 (toList!1226 lt!96876))) lt!96870)))))

(assert (=> d!56973 (= (getValueByKey!246 (toList!1226 lt!96876) lt!96870) e!128071)))

(declare-fun b!194706 () Bool)

(assert (=> b!194706 (= e!128072 (getValueByKey!246 (t!7326 (toList!1226 lt!96876)) lt!96870))))

(declare-fun b!194704 () Bool)

(assert (=> b!194704 (= e!128071 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96876)))))))

(assert (= (and d!56973 c!35167) b!194704))

(assert (= (and d!56973 (not c!35167)) b!194705))

(assert (= (and b!194705 c!35168) b!194706))

(assert (= (and b!194705 (not c!35168)) b!194707))

(declare-fun m!221897 () Bool)

(assert (=> b!194706 m!221897))

(assert (=> d!56875 d!56973))

(declare-fun d!56975 () Bool)

(assert (=> d!56975 (= (validMask!0 (mask!9222 lt!96692)) (and (or (= (mask!9222 lt!96692) #b00000000000000000000000000000111) (= (mask!9222 lt!96692) #b00000000000000000000000000001111) (= (mask!9222 lt!96692) #b00000000000000000000000000011111) (= (mask!9222 lt!96692) #b00000000000000000000000000111111) (= (mask!9222 lt!96692) #b00000000000000000000000001111111) (= (mask!9222 lt!96692) #b00000000000000000000000011111111) (= (mask!9222 lt!96692) #b00000000000000000000000111111111) (= (mask!9222 lt!96692) #b00000000000000000000001111111111) (= (mask!9222 lt!96692) #b00000000000000000000011111111111) (= (mask!9222 lt!96692) #b00000000000000000000111111111111) (= (mask!9222 lt!96692) #b00000000000000000001111111111111) (= (mask!9222 lt!96692) #b00000000000000000011111111111111) (= (mask!9222 lt!96692) #b00000000000000000111111111111111) (= (mask!9222 lt!96692) #b00000000000000001111111111111111) (= (mask!9222 lt!96692) #b00000000000000011111111111111111) (= (mask!9222 lt!96692) #b00000000000000111111111111111111) (= (mask!9222 lt!96692) #b00000000000001111111111111111111) (= (mask!9222 lt!96692) #b00000000000011111111111111111111) (= (mask!9222 lt!96692) #b00000000000111111111111111111111) (= (mask!9222 lt!96692) #b00000000001111111111111111111111) (= (mask!9222 lt!96692) #b00000000011111111111111111111111) (= (mask!9222 lt!96692) #b00000000111111111111111111111111) (= (mask!9222 lt!96692) #b00000001111111111111111111111111) (= (mask!9222 lt!96692) #b00000011111111111111111111111111) (= (mask!9222 lt!96692) #b00000111111111111111111111111111) (= (mask!9222 lt!96692) #b00001111111111111111111111111111) (= (mask!9222 lt!96692) #b00011111111111111111111111111111) (= (mask!9222 lt!96692) #b00111111111111111111111111111111)) (bvsle (mask!9222 lt!96692) #b00111111111111111111111111111111)))))

(assert (=> d!56903 d!56975))

(declare-fun d!56977 () Bool)

(declare-fun res!92005 () Bool)

(declare-fun e!128073 () Bool)

(assert (=> d!56977 (=> res!92005 e!128073)))

(assert (=> d!56977 (= res!92005 (and ((_ is Cons!2404) lt!96929) (= (_1!1761 (h!3045 lt!96929)) (_1!1761 lt!96690))))))

(assert (=> d!56977 (= (containsKey!249 lt!96929 (_1!1761 lt!96690)) e!128073)))

(declare-fun b!194708 () Bool)

(declare-fun e!128074 () Bool)

(assert (=> b!194708 (= e!128073 e!128074)))

(declare-fun res!92006 () Bool)

(assert (=> b!194708 (=> (not res!92006) (not e!128074))))

(assert (=> b!194708 (= res!92006 (and (or (not ((_ is Cons!2404) lt!96929)) (bvsle (_1!1761 (h!3045 lt!96929)) (_1!1761 lt!96690))) ((_ is Cons!2404) lt!96929) (bvslt (_1!1761 (h!3045 lt!96929)) (_1!1761 lt!96690))))))

(declare-fun b!194709 () Bool)

(assert (=> b!194709 (= e!128074 (containsKey!249 (t!7326 lt!96929) (_1!1761 lt!96690)))))

(assert (= (and d!56977 (not res!92005)) b!194708))

(assert (= (and b!194708 res!92006) b!194709))

(declare-fun m!221899 () Bool)

(assert (=> b!194709 m!221899))

(assert (=> b!194670 d!56977))

(assert (=> b!194458 d!56823))

(declare-fun d!56979 () Bool)

(declare-fun e!128076 () Bool)

(assert (=> d!56979 e!128076))

(declare-fun res!92007 () Bool)

(assert (=> d!56979 (=> res!92007 e!128076)))

(declare-fun lt!97176 () Bool)

(assert (=> d!56979 (= res!92007 (not lt!97176))))

(declare-fun lt!97178 () Bool)

(assert (=> d!56979 (= lt!97176 lt!97178)))

(declare-fun lt!97175 () Unit!5858)

(declare-fun e!128075 () Unit!5858)

(assert (=> d!56979 (= lt!97175 e!128075)))

(declare-fun c!35169 () Bool)

(assert (=> d!56979 (= c!35169 lt!97178)))

(assert (=> d!56979 (= lt!97178 (containsKey!249 (toList!1226 lt!97002) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56979 (= (contains!1363 lt!97002 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97176)))

(declare-fun b!194710 () Bool)

(declare-fun lt!97177 () Unit!5858)

(assert (=> b!194710 (= e!128075 lt!97177)))

(assert (=> b!194710 (= lt!97177 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97002) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194710 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97002) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194711 () Bool)

(declare-fun Unit!5882 () Unit!5858)

(assert (=> b!194711 (= e!128075 Unit!5882)))

(declare-fun b!194712 () Bool)

(assert (=> b!194712 (= e!128076 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97002) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56979 c!35169) b!194710))

(assert (= (and d!56979 (not c!35169)) b!194711))

(assert (= (and d!56979 (not res!92007)) b!194712))

(declare-fun m!221901 () Bool)

(assert (=> d!56979 m!221901))

(declare-fun m!221903 () Bool)

(assert (=> b!194710 m!221903))

(declare-fun m!221905 () Bool)

(assert (=> b!194710 m!221905))

(assert (=> b!194710 m!221905))

(declare-fun m!221907 () Bool)

(assert (=> b!194710 m!221907))

(assert (=> b!194712 m!221905))

(assert (=> b!194712 m!221905))

(assert (=> b!194712 m!221907))

(assert (=> d!56805 d!56979))

(assert (=> d!56805 d!56831))

(declare-fun b!194714 () Bool)

(declare-fun e!128077 () Option!252)

(declare-fun e!128078 () Option!252)

(assert (=> b!194714 (= e!128077 e!128078)))

(declare-fun c!35171 () Bool)

(assert (=> b!194714 (= c!35171 (and ((_ is Cons!2404) (toList!1226 lt!97150)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97150))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194716 () Bool)

(assert (=> b!194716 (= e!128078 None!250)))

(declare-fun d!56981 () Bool)

(declare-fun c!35170 () Bool)

(assert (=> d!56981 (= c!35170 (and ((_ is Cons!2404) (toList!1226 lt!97150)) (= (_1!1761 (h!3045 (toList!1226 lt!97150))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56981 (= (getValueByKey!246 (toList!1226 lt!97150) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) e!128077)))

(declare-fun b!194715 () Bool)

(assert (=> b!194715 (= e!128078 (getValueByKey!246 (t!7326 (toList!1226 lt!97150)) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194713 () Bool)

(assert (=> b!194713 (= e!128077 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97150)))))))

(assert (= (and d!56981 c!35170) b!194713))

(assert (= (and d!56981 (not c!35170)) b!194714))

(assert (= (and b!194714 c!35171) b!194715))

(assert (= (and b!194714 (not c!35171)) b!194716))

(declare-fun m!221909 () Bool)

(assert (=> b!194715 m!221909))

(assert (=> b!194647 d!56981))

(declare-fun d!56983 () Bool)

(assert (=> d!56983 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97179 () Unit!5858)

(assert (=> d!56983 (= lt!97179 (choose!1077 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128079 () Bool)

(assert (=> d!56983 e!128079))

(declare-fun res!92008 () Bool)

(assert (=> d!56983 (=> (not res!92008) (not e!128079))))

(assert (=> d!56983 (= res!92008 (isStrictlySorted!344 (toList!1226 lt!96908)))))

(assert (=> d!56983 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000) lt!97179)))

(declare-fun b!194717 () Bool)

(assert (=> b!194717 (= e!128079 (containsKey!249 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56983 res!92008) b!194717))

(assert (=> d!56983 m!221505))

(assert (=> d!56983 m!221505))

(assert (=> d!56983 m!221507))

(declare-fun m!221911 () Bool)

(assert (=> d!56983 m!221911))

(declare-fun m!221913 () Bool)

(assert (=> d!56983 m!221913))

(assert (=> b!194717 m!221501))

(assert (=> b!194459 d!56983))

(declare-fun d!56985 () Bool)

(assert (=> d!56985 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7776 () Bool)

(assert (= bs!7776 d!56985))

(assert (=> bs!7776 m!221505))

(declare-fun m!221915 () Bool)

(assert (=> bs!7776 m!221915))

(assert (=> b!194459 d!56985))

(declare-fun b!194719 () Bool)

(declare-fun e!128080 () Option!252)

(declare-fun e!128081 () Option!252)

(assert (=> b!194719 (= e!128080 e!128081)))

(declare-fun c!35173 () Bool)

(assert (=> b!194719 (= c!35173 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96908))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194721 () Bool)

(assert (=> b!194721 (= e!128081 None!250)))

(declare-fun d!56987 () Bool)

(declare-fun c!35172 () Bool)

(assert (=> d!56987 (= c!35172 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (= (_1!1761 (h!3045 (toList!1226 lt!96908))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56987 (= (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000) e!128080)))

(declare-fun b!194720 () Bool)

(assert (=> b!194720 (= e!128081 (getValueByKey!246 (t!7326 (toList!1226 lt!96908)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194718 () Bool)

(assert (=> b!194718 (= e!128080 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96908)))))))

(assert (= (and d!56987 c!35172) b!194718))

(assert (= (and d!56987 (not c!35172)) b!194719))

(assert (= (and b!194719 c!35173) b!194720))

(assert (= (and b!194719 (not c!35173)) b!194721))

(declare-fun m!221917 () Bool)

(assert (=> b!194720 m!221917))

(assert (=> b!194459 d!56987))

(declare-fun b!194723 () Bool)

(declare-fun e!128082 () Option!252)

(declare-fun e!128083 () Option!252)

(assert (=> b!194723 (= e!128082 e!128083)))

(declare-fun c!35175 () Bool)

(assert (=> b!194723 (= c!35175 (and ((_ is Cons!2404) (toList!1226 lt!97135)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97135))) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun b!194725 () Bool)

(assert (=> b!194725 (= e!128083 None!250)))

(declare-fun d!56989 () Bool)

(declare-fun c!35174 () Bool)

(assert (=> d!56989 (= c!35174 (and ((_ is Cons!2404) (toList!1226 lt!97135)) (= (_1!1761 (h!3045 (toList!1226 lt!97135))) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> d!56989 (= (getValueByKey!246 (toList!1226 lt!97135) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) e!128082)))

(declare-fun b!194724 () Bool)

(assert (=> b!194724 (= e!128083 (getValueByKey!246 (t!7326 (toList!1226 lt!97135)) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194722 () Bool)

(assert (=> b!194722 (= e!128082 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97135)))))))

(assert (= (and d!56989 c!35174) b!194722))

(assert (= (and d!56989 (not c!35174)) b!194723))

(assert (= (and b!194723 c!35175) b!194724))

(assert (= (and b!194723 (not c!35175)) b!194725))

(declare-fun m!221919 () Bool)

(assert (=> b!194724 m!221919))

(assert (=> b!194613 d!56989))

(declare-fun d!56991 () Bool)

(assert (=> d!56991 (= (inRange!0 (index!4899 lt!97059) (mask!9222 thiss!1248)) (and (bvsge (index!4899 lt!97059) #b00000000000000000000000000000000) (bvslt (index!4899 lt!97059) (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!194479 d!56991))

(declare-fun b!194726 () Bool)

(assert (=> b!194726 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> b!194726 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4191 (_values!3942 thiss!1248))))))

(declare-fun e!128086 () Bool)

(declare-fun lt!97185 () ListLongMap!2421)

(assert (=> b!194726 (= e!128086 (= (apply!188 lt!97185 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19677 () Bool)

(declare-fun call!19680 () ListLongMap!2421)

(assert (=> bm!19677 (= call!19680 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194727 () Bool)

(declare-fun res!92011 () Bool)

(declare-fun e!128089 () Bool)

(assert (=> b!194727 (=> (not res!92011) (not e!128089))))

(assert (=> b!194727 (= res!92011 (not (contains!1363 lt!97185 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194728 () Bool)

(declare-fun e!128088 () Bool)

(assert (=> b!194728 (= e!128088 (= lt!97185 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(declare-fun d!56993 () Bool)

(assert (=> d!56993 e!128089))

(declare-fun res!92010 () Bool)

(assert (=> d!56993 (=> (not res!92010) (not e!128089))))

(assert (=> d!56993 (= res!92010 (not (contains!1363 lt!97185 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128085 () ListLongMap!2421)

(assert (=> d!56993 (= lt!97185 e!128085)))

(declare-fun c!35177 () Bool)

(assert (=> d!56993 (= c!35177 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!56993 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!56993 (= (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)) lt!97185)))

(declare-fun b!194729 () Bool)

(declare-fun e!128084 () Bool)

(assert (=> b!194729 (= e!128089 e!128084)))

(declare-fun c!35178 () Bool)

(declare-fun e!128087 () Bool)

(assert (=> b!194729 (= c!35178 e!128087)))

(declare-fun res!92009 () Bool)

(assert (=> b!194729 (=> (not res!92009) (not e!128087))))

(assert (=> b!194729 (= res!92009 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194730 () Bool)

(assert (=> b!194730 (= e!128085 (ListLongMap!2422 Nil!2405))))

(declare-fun b!194731 () Bool)

(declare-fun e!128090 () ListLongMap!2421)

(assert (=> b!194731 (= e!128085 e!128090)))

(declare-fun c!35179 () Bool)

(assert (=> b!194731 (= c!35179 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194732 () Bool)

(declare-fun lt!97186 () Unit!5858)

(declare-fun lt!97181 () Unit!5858)

(assert (=> b!194732 (= lt!97186 lt!97181)))

(declare-fun lt!97182 () (_ BitVec 64))

(declare-fun lt!97180 () V!5633)

(declare-fun lt!97183 () (_ BitVec 64))

(declare-fun lt!97184 () ListLongMap!2421)

(assert (=> b!194732 (not (contains!1363 (+!319 lt!97184 (tuple2!3501 lt!97183 lt!97180)) lt!97182))))

(assert (=> b!194732 (= lt!97181 (addStillNotContains!99 lt!97184 lt!97183 lt!97180 lt!97182))))

(assert (=> b!194732 (= lt!97182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194732 (= lt!97180 (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194732 (= lt!97183 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!194732 (= lt!97184 call!19680)))

(assert (=> b!194732 (= e!128090 (+!319 call!19680 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194733 () Bool)

(assert (=> b!194733 (= e!128088 (isEmpty!493 lt!97185))))

(declare-fun b!194734 () Bool)

(assert (=> b!194734 (= e!128087 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194734 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!194735 () Bool)

(assert (=> b!194735 (= e!128084 e!128086)))

(assert (=> b!194735 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!92012 () Bool)

(assert (=> b!194735 (= res!92012 (contains!1363 lt!97185 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194735 (=> (not res!92012) (not e!128086))))

(declare-fun b!194736 () Bool)

(assert (=> b!194736 (= e!128084 e!128088)))

(declare-fun c!35176 () Bool)

(assert (=> b!194736 (= c!35176 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194737 () Bool)

(assert (=> b!194737 (= e!128090 call!19680)))

(assert (= (and d!56993 c!35177) b!194730))

(assert (= (and d!56993 (not c!35177)) b!194731))

(assert (= (and b!194731 c!35179) b!194732))

(assert (= (and b!194731 (not c!35179)) b!194737))

(assert (= (or b!194732 b!194737) bm!19677))

(assert (= (and d!56993 res!92010) b!194727))

(assert (= (and b!194727 res!92011) b!194729))

(assert (= (and b!194729 res!92009) b!194734))

(assert (= (and b!194729 c!35178) b!194735))

(assert (= (and b!194729 (not c!35178)) b!194736))

(assert (= (and b!194735 res!92012) b!194726))

(assert (= (and b!194736 c!35176) b!194728))

(assert (= (and b!194736 (not c!35176)) b!194733))

(declare-fun b_lambda!7531 () Bool)

(assert (=> (not b_lambda!7531) (not b!194726)))

(assert (=> b!194726 t!7329))

(declare-fun b_and!11467 () Bool)

(assert (= b_and!11465 (and (=> t!7329 result!4931) b_and!11467)))

(declare-fun b_lambda!7533 () Bool)

(assert (=> (not b_lambda!7533) (not b!194732)))

(assert (=> b!194732 t!7329))

(declare-fun b_and!11469 () Bool)

(assert (= b_and!11467 (and (=> t!7329 result!4931) b_and!11469)))

(declare-fun m!221921 () Bool)

(assert (=> bm!19677 m!221921))

(assert (=> b!194732 m!221057))

(declare-fun m!221923 () Bool)

(assert (=> b!194732 m!221923))

(declare-fun m!221925 () Bool)

(assert (=> b!194732 m!221925))

(declare-fun m!221927 () Bool)

(assert (=> b!194732 m!221927))

(assert (=> b!194732 m!221927))

(assert (=> b!194732 m!221057))

(declare-fun m!221929 () Bool)

(assert (=> b!194732 m!221929))

(declare-fun m!221931 () Bool)

(assert (=> b!194732 m!221931))

(declare-fun m!221933 () Bool)

(assert (=> b!194732 m!221933))

(assert (=> b!194732 m!221923))

(declare-fun m!221935 () Bool)

(assert (=> b!194732 m!221935))

(assert (=> b!194731 m!221933))

(assert (=> b!194731 m!221933))

(declare-fun m!221937 () Bool)

(assert (=> b!194731 m!221937))

(declare-fun m!221939 () Bool)

(assert (=> b!194727 m!221939))

(declare-fun m!221941 () Bool)

(assert (=> d!56993 m!221941))

(assert (=> d!56993 m!221011))

(assert (=> b!194734 m!221933))

(assert (=> b!194734 m!221933))

(assert (=> b!194734 m!221937))

(assert (=> b!194735 m!221933))

(assert (=> b!194735 m!221933))

(declare-fun m!221943 () Bool)

(assert (=> b!194735 m!221943))

(declare-fun m!221945 () Bool)

(assert (=> b!194733 m!221945))

(assert (=> b!194728 m!221921))

(assert (=> b!194726 m!221057))

(assert (=> b!194726 m!221933))

(declare-fun m!221947 () Bool)

(assert (=> b!194726 m!221947))

(assert (=> b!194726 m!221927))

(assert (=> b!194726 m!221927))

(assert (=> b!194726 m!221057))

(assert (=> b!194726 m!221929))

(assert (=> b!194726 m!221933))

(assert (=> bm!19641 d!56993))

(assert (=> b!194606 d!56823))

(declare-fun d!56995 () Bool)

(declare-fun lt!97187 () Bool)

(assert (=> d!56995 (= lt!97187 (select (content!156 lt!96993) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun e!128092 () Bool)

(assert (=> d!56995 (= lt!97187 e!128092)))

(declare-fun res!92013 () Bool)

(assert (=> d!56995 (=> (not res!92013) (not e!128092))))

(assert (=> d!56995 (= res!92013 ((_ is Cons!2404) lt!96993))))

(assert (=> d!56995 (= (contains!1365 lt!96993 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))) lt!97187)))

(declare-fun b!194738 () Bool)

(declare-fun e!128091 () Bool)

(assert (=> b!194738 (= e!128092 e!128091)))

(declare-fun res!92014 () Bool)

(assert (=> b!194738 (=> res!92014 e!128091)))

(assert (=> b!194738 (= res!92014 (= (h!3045 lt!96993) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun b!194739 () Bool)

(assert (=> b!194739 (= e!128091 (contains!1365 (t!7326 lt!96993) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(assert (= (and d!56995 res!92013) b!194738))

(assert (= (and b!194738 (not res!92014)) b!194739))

(declare-fun m!221949 () Bool)

(assert (=> d!56995 m!221949))

(declare-fun m!221951 () Bool)

(assert (=> d!56995 m!221951))

(declare-fun m!221953 () Bool)

(assert (=> b!194739 m!221953))

(assert (=> b!194370 d!56995))

(declare-fun b!194741 () Bool)

(declare-fun e!128093 () Option!252)

(declare-fun e!128094 () Option!252)

(assert (=> b!194741 (= e!128093 e!128094)))

(declare-fun c!35181 () Bool)

(assert (=> b!194741 (= c!35181 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96696))) (not (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96696)))) key!828))))))

(declare-fun b!194743 () Bool)

(assert (=> b!194743 (= e!128094 None!250)))

(declare-fun d!56997 () Bool)

(declare-fun c!35180 () Bool)

(assert (=> d!56997 (= c!35180 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96696))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96696)))) key!828)))))

(assert (=> d!56997 (= (getValueByKey!246 (t!7326 (toList!1226 lt!96696)) key!828) e!128093)))

(declare-fun b!194742 () Bool)

(assert (=> b!194742 (= e!128094 (getValueByKey!246 (t!7326 (t!7326 (toList!1226 lt!96696))) key!828))))

(declare-fun b!194740 () Bool)

(assert (=> b!194740 (= e!128093 (Some!251 (_2!1761 (h!3045 (t!7326 (toList!1226 lt!96696))))))))

(assert (= (and d!56997 c!35180) b!194740))

(assert (= (and d!56997 (not c!35180)) b!194741))

(assert (= (and b!194741 c!35181) b!194742))

(assert (= (and b!194741 (not c!35181)) b!194743))

(declare-fun m!221955 () Bool)

(assert (=> b!194742 m!221955))

(assert (=> b!194535 d!56997))

(declare-fun d!56999 () Bool)

(declare-fun e!128095 () Bool)

(assert (=> d!56999 e!128095))

(declare-fun res!92016 () Bool)

(assert (=> d!56999 (=> (not res!92016) (not e!128095))))

(declare-fun lt!97188 () ListLongMap!2421)

(assert (=> d!56999 (= res!92016 (contains!1363 lt!97188 (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!97190 () List!2408)

(assert (=> d!56999 (= lt!97188 (ListLongMap!2422 lt!97190))))

(declare-fun lt!97191 () Unit!5858)

(declare-fun lt!97189 () Unit!5858)

(assert (=> d!56999 (= lt!97191 lt!97189)))

(assert (=> d!56999 (= (getValueByKey!246 lt!97190 (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!251 (_2!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56999 (= lt!97189 (lemmaContainsTupThenGetReturnValue!133 lt!97190 (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56999 (= lt!97190 (insertStrictlySorted!136 (toList!1226 call!19634) (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56999 (= (+!319 call!19634 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!97188)))

(declare-fun b!194744 () Bool)

(declare-fun res!92015 () Bool)

(assert (=> b!194744 (=> (not res!92015) (not e!128095))))

(assert (=> b!194744 (= res!92015 (= (getValueByKey!246 (toList!1226 lt!97188) (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!251 (_2!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!194745 () Bool)

(assert (=> b!194745 (= e!128095 (contains!1365 (toList!1226 lt!97188) (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!56999 res!92016) b!194744))

(assert (= (and b!194744 res!92015) b!194745))

(declare-fun m!221957 () Bool)

(assert (=> d!56999 m!221957))

(declare-fun m!221959 () Bool)

(assert (=> d!56999 m!221959))

(declare-fun m!221961 () Bool)

(assert (=> d!56999 m!221961))

(declare-fun m!221963 () Bool)

(assert (=> d!56999 m!221963))

(declare-fun m!221965 () Bool)

(assert (=> b!194744 m!221965))

(declare-fun m!221967 () Bool)

(assert (=> b!194745 m!221967))

(assert (=> b!194290 d!56999))

(declare-fun d!57001 () Bool)

(assert (=> d!57001 (not (contains!1363 (+!319 lt!96949 (tuple2!3501 lt!96948 lt!96945)) lt!96947))))

(declare-fun lt!97194 () Unit!5858)

(declare-fun choose!1078 (ListLongMap!2421 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5858)

(assert (=> d!57001 (= lt!97194 (choose!1078 lt!96949 lt!96948 lt!96945 lt!96947))))

(declare-fun e!128098 () Bool)

(assert (=> d!57001 e!128098))

(declare-fun res!92019 () Bool)

(assert (=> d!57001 (=> (not res!92019) (not e!128098))))

(assert (=> d!57001 (= res!92019 (not (contains!1363 lt!96949 lt!96947)))))

(assert (=> d!57001 (= (addStillNotContains!99 lt!96949 lt!96948 lt!96945 lt!96947) lt!97194)))

(declare-fun b!194749 () Bool)

(assert (=> b!194749 (= e!128098 (not (= lt!96948 lt!96947)))))

(assert (= (and d!57001 res!92019) b!194749))

(assert (=> d!57001 m!221221))

(assert (=> d!57001 m!221221))

(assert (=> d!57001 m!221223))

(declare-fun m!221969 () Bool)

(assert (=> d!57001 m!221969))

(declare-fun m!221971 () Bool)

(assert (=> d!57001 m!221971))

(assert (=> b!194290 d!57001))

(declare-fun d!57003 () Bool)

(declare-fun e!128100 () Bool)

(assert (=> d!57003 e!128100))

(declare-fun res!92020 () Bool)

(assert (=> d!57003 (=> res!92020 e!128100)))

(declare-fun lt!97196 () Bool)

(assert (=> d!57003 (= res!92020 (not lt!97196))))

(declare-fun lt!97198 () Bool)

(assert (=> d!57003 (= lt!97196 lt!97198)))

(declare-fun lt!97195 () Unit!5858)

(declare-fun e!128099 () Unit!5858)

(assert (=> d!57003 (= lt!97195 e!128099)))

(declare-fun c!35182 () Bool)

(assert (=> d!57003 (= c!35182 lt!97198)))

(assert (=> d!57003 (= lt!97198 (containsKey!249 (toList!1226 (+!319 lt!96949 (tuple2!3501 lt!96948 lt!96945))) lt!96947))))

(assert (=> d!57003 (= (contains!1363 (+!319 lt!96949 (tuple2!3501 lt!96948 lt!96945)) lt!96947) lt!97196)))

(declare-fun b!194750 () Bool)

(declare-fun lt!97197 () Unit!5858)

(assert (=> b!194750 (= e!128099 lt!97197)))

(assert (=> b!194750 (= lt!97197 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (+!319 lt!96949 (tuple2!3501 lt!96948 lt!96945))) lt!96947))))

(assert (=> b!194750 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96949 (tuple2!3501 lt!96948 lt!96945))) lt!96947))))

(declare-fun b!194751 () Bool)

(declare-fun Unit!5883 () Unit!5858)

(assert (=> b!194751 (= e!128099 Unit!5883)))

(declare-fun b!194752 () Bool)

(assert (=> b!194752 (= e!128100 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96949 (tuple2!3501 lt!96948 lt!96945))) lt!96947)))))

(assert (= (and d!57003 c!35182) b!194750))

(assert (= (and d!57003 (not c!35182)) b!194751))

(assert (= (and d!57003 (not res!92020)) b!194752))

(declare-fun m!221973 () Bool)

(assert (=> d!57003 m!221973))

(declare-fun m!221975 () Bool)

(assert (=> b!194750 m!221975))

(declare-fun m!221977 () Bool)

(assert (=> b!194750 m!221977))

(assert (=> b!194750 m!221977))

(declare-fun m!221979 () Bool)

(assert (=> b!194750 m!221979))

(assert (=> b!194752 m!221977))

(assert (=> b!194752 m!221977))

(assert (=> b!194752 m!221979))

(assert (=> b!194290 d!57003))

(assert (=> b!194290 d!56827))

(declare-fun d!57005 () Bool)

(declare-fun e!128101 () Bool)

(assert (=> d!57005 e!128101))

(declare-fun res!92022 () Bool)

(assert (=> d!57005 (=> (not res!92022) (not e!128101))))

(declare-fun lt!97199 () ListLongMap!2421)

(assert (=> d!57005 (= res!92022 (contains!1363 lt!97199 (_1!1761 (tuple2!3501 lt!96948 lt!96945))))))

(declare-fun lt!97201 () List!2408)

(assert (=> d!57005 (= lt!97199 (ListLongMap!2422 lt!97201))))

(declare-fun lt!97202 () Unit!5858)

(declare-fun lt!97200 () Unit!5858)

(assert (=> d!57005 (= lt!97202 lt!97200)))

(assert (=> d!57005 (= (getValueByKey!246 lt!97201 (_1!1761 (tuple2!3501 lt!96948 lt!96945))) (Some!251 (_2!1761 (tuple2!3501 lt!96948 lt!96945))))))

(assert (=> d!57005 (= lt!97200 (lemmaContainsTupThenGetReturnValue!133 lt!97201 (_1!1761 (tuple2!3501 lt!96948 lt!96945)) (_2!1761 (tuple2!3501 lt!96948 lt!96945))))))

(assert (=> d!57005 (= lt!97201 (insertStrictlySorted!136 (toList!1226 lt!96949) (_1!1761 (tuple2!3501 lt!96948 lt!96945)) (_2!1761 (tuple2!3501 lt!96948 lt!96945))))))

(assert (=> d!57005 (= (+!319 lt!96949 (tuple2!3501 lt!96948 lt!96945)) lt!97199)))

(declare-fun b!194753 () Bool)

(declare-fun res!92021 () Bool)

(assert (=> b!194753 (=> (not res!92021) (not e!128101))))

(assert (=> b!194753 (= res!92021 (= (getValueByKey!246 (toList!1226 lt!97199) (_1!1761 (tuple2!3501 lt!96948 lt!96945))) (Some!251 (_2!1761 (tuple2!3501 lt!96948 lt!96945)))))))

(declare-fun b!194754 () Bool)

(assert (=> b!194754 (= e!128101 (contains!1365 (toList!1226 lt!97199) (tuple2!3501 lt!96948 lt!96945)))))

(assert (= (and d!57005 res!92022) b!194753))

(assert (= (and b!194753 res!92021) b!194754))

(declare-fun m!221981 () Bool)

(assert (=> d!57005 m!221981))

(declare-fun m!221983 () Bool)

(assert (=> d!57005 m!221983))

(declare-fun m!221985 () Bool)

(assert (=> d!57005 m!221985))

(declare-fun m!221987 () Bool)

(assert (=> d!57005 m!221987))

(declare-fun m!221989 () Bool)

(assert (=> b!194753 m!221989))

(declare-fun m!221991 () Bool)

(assert (=> b!194754 m!221991))

(assert (=> b!194290 d!57005))

(declare-fun b!194756 () Bool)

(declare-fun e!128102 () Option!252)

(declare-fun e!128103 () Option!252)

(assert (=> b!194756 (= e!128102 e!128103)))

(declare-fun c!35184 () Bool)

(assert (=> b!194756 (= c!35184 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96700))) (not (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700)))) key!828))))))

(declare-fun b!194758 () Bool)

(assert (=> b!194758 (= e!128103 None!250)))

(declare-fun d!57007 () Bool)

(declare-fun c!35183 () Bool)

(assert (=> d!57007 (= c!35183 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96700))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700)))) key!828)))))

(assert (=> d!57007 (= (getValueByKey!246 (t!7326 (toList!1226 lt!96700)) key!828) e!128102)))

(declare-fun b!194757 () Bool)

(assert (=> b!194757 (= e!128103 (getValueByKey!246 (t!7326 (t!7326 (toList!1226 lt!96700))) key!828))))

(declare-fun b!194755 () Bool)

(assert (=> b!194755 (= e!128102 (Some!251 (_2!1761 (h!3045 (t!7326 (toList!1226 lt!96700))))))))

(assert (= (and d!57007 c!35183) b!194755))

(assert (= (and d!57007 (not c!35183)) b!194756))

(assert (= (and b!194756 c!35184) b!194757))

(assert (= (and b!194756 (not c!35184)) b!194758))

(declare-fun m!221993 () Bool)

(assert (=> b!194757 m!221993))

(assert (=> b!194654 d!57007))

(declare-fun d!57009 () Bool)

(assert (=> d!57009 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))) (v!4257 (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!56825 d!57009))

(declare-fun b!194760 () Bool)

(declare-fun e!128104 () Option!252)

(declare-fun e!128105 () Option!252)

(assert (=> b!194760 (= e!128104 e!128105)))

(declare-fun c!35186 () Bool)

(assert (=> b!194760 (= c!35186 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96908))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!194762 () Bool)

(assert (=> b!194762 (= e!128105 None!250)))

(declare-fun d!57011 () Bool)

(declare-fun c!35185 () Bool)

(assert (=> d!57011 (= c!35185 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (= (_1!1761 (h!3045 (toList!1226 lt!96908))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!57011 (= (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) e!128104)))

(declare-fun b!194761 () Bool)

(assert (=> b!194761 (= e!128105 (getValueByKey!246 (t!7326 (toList!1226 lt!96908)) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194759 () Bool)

(assert (=> b!194759 (= e!128104 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96908)))))))

(assert (= (and d!57011 c!35185) b!194759))

(assert (= (and d!57011 (not c!35185)) b!194760))

(assert (= (and b!194760 c!35186) b!194761))

(assert (= (and b!194760 (not c!35186)) b!194762))

(assert (=> b!194761 m!221041))

(declare-fun m!221995 () Bool)

(assert (=> b!194761 m!221995))

(assert (=> d!56825 d!57011))

(declare-fun d!57013 () Bool)

(assert (=> d!57013 (= (apply!188 lt!97118 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2244 (getValueByKey!246 (toList!1226 lt!97118) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7777 () Bool)

(assert (= bs!7777 d!57013))

(declare-fun m!221997 () Bool)

(assert (=> bs!7777 m!221997))

(assert (=> bs!7777 m!221997))

(declare-fun m!221999 () Bool)

(assert (=> bs!7777 m!221999))

(assert (=> b!194598 d!57013))

(declare-fun d!57015 () Bool)

(declare-fun isEmpty!495 (List!2408) Bool)

(assert (=> d!57015 (= (isEmpty!493 lt!97002) (isEmpty!495 (toList!1226 lt!97002)))))

(declare-fun bs!7778 () Bool)

(assert (= bs!7778 d!57015))

(declare-fun m!222001 () Bool)

(assert (=> bs!7778 m!222001))

(assert (=> b!194399 d!57015))

(assert (=> d!56859 d!56863))

(assert (=> d!56859 d!56857))

(declare-fun d!57017 () Bool)

(assert (=> d!57017 (contains!1363 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) lt!96871)))

(assert (=> d!57017 true))

(declare-fun _$35!416 () Unit!5858)

(assert (=> d!57017 (= (choose!1075 lt!96873 lt!96858 (zeroValue!3800 thiss!1248) lt!96871) _$35!416)))

(declare-fun bs!7779 () Bool)

(assert (= bs!7779 d!57017))

(assert (=> bs!7779 m!221071))

(assert (=> bs!7779 m!221071))

(assert (=> bs!7779 m!221079))

(assert (=> d!56859 d!57017))

(declare-fun d!57019 () Bool)

(declare-fun e!128107 () Bool)

(assert (=> d!57019 e!128107))

(declare-fun res!92023 () Bool)

(assert (=> d!57019 (=> res!92023 e!128107)))

(declare-fun lt!97204 () Bool)

(assert (=> d!57019 (= res!92023 (not lt!97204))))

(declare-fun lt!97206 () Bool)

(assert (=> d!57019 (= lt!97204 lt!97206)))

(declare-fun lt!97203 () Unit!5858)

(declare-fun e!128106 () Unit!5858)

(assert (=> d!57019 (= lt!97203 e!128106)))

(declare-fun c!35187 () Bool)

(assert (=> d!57019 (= c!35187 lt!97206)))

(assert (=> d!57019 (= lt!97206 (containsKey!249 (toList!1226 lt!96873) lt!96871))))

(assert (=> d!57019 (= (contains!1363 lt!96873 lt!96871) lt!97204)))

(declare-fun b!194764 () Bool)

(declare-fun lt!97205 () Unit!5858)

(assert (=> b!194764 (= e!128106 lt!97205)))

(assert (=> b!194764 (= lt!97205 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96873) lt!96871))))

(assert (=> b!194764 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96873) lt!96871))))

(declare-fun b!194765 () Bool)

(declare-fun Unit!5884 () Unit!5858)

(assert (=> b!194765 (= e!128106 Unit!5884)))

(declare-fun b!194766 () Bool)

(assert (=> b!194766 (= e!128107 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96873) lt!96871)))))

(assert (= (and d!57019 c!35187) b!194764))

(assert (= (and d!57019 (not c!35187)) b!194765))

(assert (= (and d!57019 (not res!92023)) b!194766))

(declare-fun m!222003 () Bool)

(assert (=> d!57019 m!222003))

(declare-fun m!222005 () Bool)

(assert (=> b!194764 m!222005))

(declare-fun m!222007 () Bool)

(assert (=> b!194764 m!222007))

(assert (=> b!194764 m!222007))

(declare-fun m!222009 () Bool)

(assert (=> b!194764 m!222009))

(assert (=> b!194766 m!222007))

(assert (=> b!194766 m!222007))

(assert (=> b!194766 m!222009))

(assert (=> d!56859 d!57019))

(declare-fun b!194767 () Bool)

(assert (=> b!194767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(assert (=> b!194767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4191 (_values!3942 lt!96692))))))

(declare-fun e!128110 () Bool)

(declare-fun lt!97212 () ListLongMap!2421)

(assert (=> b!194767 (= e!128110 (= (apply!188 lt!97212 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)) (get!2243 (select (arr!3867 (_values!3942 lt!96692)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 lt!96692) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19678 () Bool)

(declare-fun call!19681 () ListLongMap!2421)

(assert (=> bm!19678 (= call!19681 (getCurrentListMapNoExtraKeys!219 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 lt!96692)))))

(declare-fun b!194768 () Bool)

(declare-fun res!92026 () Bool)

(declare-fun e!128113 () Bool)

(assert (=> b!194768 (=> (not res!92026) (not e!128113))))

(assert (=> b!194768 (= res!92026 (not (contains!1363 lt!97212 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194769 () Bool)

(declare-fun e!128112 () Bool)

(assert (=> b!194769 (= e!128112 (= lt!97212 (getCurrentListMapNoExtraKeys!219 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 lt!96692))))))

(declare-fun d!57021 () Bool)

(assert (=> d!57021 e!128113))

(declare-fun res!92025 () Bool)

(assert (=> d!57021 (=> (not res!92025) (not e!128113))))

(assert (=> d!57021 (= res!92025 (not (contains!1363 lt!97212 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128109 () ListLongMap!2421)

(assert (=> d!57021 (= lt!97212 e!128109)))

(declare-fun c!35189 () Bool)

(assert (=> d!57021 (= c!35189 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!57021 (validMask!0 (mask!9222 lt!96692))))

(assert (=> d!57021 (= (getCurrentListMapNoExtraKeys!219 (_keys!5953 lt!96692) (_values!3942 lt!96692) (mask!9222 lt!96692) (extraKeys!3696 lt!96692) (zeroValue!3800 lt!96692) (minValue!3800 lt!96692) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96692)) lt!97212)))

(declare-fun b!194770 () Bool)

(declare-fun e!128108 () Bool)

(assert (=> b!194770 (= e!128113 e!128108)))

(declare-fun c!35190 () Bool)

(declare-fun e!128111 () Bool)

(assert (=> b!194770 (= c!35190 e!128111)))

(declare-fun res!92024 () Bool)

(assert (=> b!194770 (=> (not res!92024) (not e!128111))))

(assert (=> b!194770 (= res!92024 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(declare-fun b!194771 () Bool)

(assert (=> b!194771 (= e!128109 (ListLongMap!2422 Nil!2405))))

(declare-fun b!194772 () Bool)

(declare-fun e!128114 () ListLongMap!2421)

(assert (=> b!194772 (= e!128109 e!128114)))

(declare-fun c!35191 () Bool)

(assert (=> b!194772 (= c!35191 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun b!194773 () Bool)

(declare-fun lt!97213 () Unit!5858)

(declare-fun lt!97208 () Unit!5858)

(assert (=> b!194773 (= lt!97213 lt!97208)))

(declare-fun lt!97210 () (_ BitVec 64))

(declare-fun lt!97211 () ListLongMap!2421)

(declare-fun lt!97209 () (_ BitVec 64))

(declare-fun lt!97207 () V!5633)

(assert (=> b!194773 (not (contains!1363 (+!319 lt!97211 (tuple2!3501 lt!97210 lt!97207)) lt!97209))))

(assert (=> b!194773 (= lt!97208 (addStillNotContains!99 lt!97211 lt!97210 lt!97207 lt!97209))))

(assert (=> b!194773 (= lt!97209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194773 (= lt!97207 (get!2243 (select (arr!3867 (_values!3942 lt!96692)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 lt!96692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194773 (= lt!97210 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000))))

(assert (=> b!194773 (= lt!97211 call!19681)))

(assert (=> b!194773 (= e!128114 (+!319 call!19681 (tuple2!3501 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 lt!96692)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 lt!96692) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194774 () Bool)

(assert (=> b!194774 (= e!128112 (isEmpty!493 lt!97212))))

(declare-fun b!194775 () Bool)

(assert (=> b!194775 (= e!128111 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (=> b!194775 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!194776 () Bool)

(assert (=> b!194776 (= e!128108 e!128110)))

(assert (=> b!194776 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(declare-fun res!92027 () Bool)

(assert (=> b!194776 (= res!92027 (contains!1363 lt!97212 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (=> b!194776 (=> (not res!92027) (not e!128110))))

(declare-fun b!194777 () Bool)

(assert (=> b!194777 (= e!128108 e!128112)))

(declare-fun c!35188 () Bool)

(assert (=> b!194777 (= c!35188 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 lt!96692))))))

(declare-fun b!194778 () Bool)

(assert (=> b!194778 (= e!128114 call!19681)))

(assert (= (and d!57021 c!35189) b!194771))

(assert (= (and d!57021 (not c!35189)) b!194772))

(assert (= (and b!194772 c!35191) b!194773))

(assert (= (and b!194772 (not c!35191)) b!194778))

(assert (= (or b!194773 b!194778) bm!19678))

(assert (= (and d!57021 res!92025) b!194768))

(assert (= (and b!194768 res!92026) b!194770))

(assert (= (and b!194770 res!92024) b!194775))

(assert (= (and b!194770 c!35190) b!194776))

(assert (= (and b!194770 (not c!35190)) b!194777))

(assert (= (and b!194776 res!92027) b!194767))

(assert (= (and b!194777 c!35188) b!194769))

(assert (= (and b!194777 (not c!35188)) b!194774))

(declare-fun b_lambda!7535 () Bool)

(assert (=> (not b_lambda!7535) (not b!194767)))

(assert (=> b!194767 t!7332))

(declare-fun b_and!11471 () Bool)

(assert (= b_and!11469 (and (=> t!7332 result!4937) b_and!11471)))

(declare-fun b_lambda!7537 () Bool)

(assert (=> (not b_lambda!7537) (not b!194773)))

(assert (=> b!194773 t!7332))

(declare-fun b_and!11473 () Bool)

(assert (= b_and!11471 (and (=> t!7332 result!4937) b_and!11473)))

(declare-fun m!222011 () Bool)

(assert (=> bm!19678 m!222011))

(assert (=> b!194773 m!221701))

(declare-fun m!222013 () Bool)

(assert (=> b!194773 m!222013))

(declare-fun m!222015 () Bool)

(assert (=> b!194773 m!222015))

(assert (=> b!194773 m!221699))

(assert (=> b!194773 m!221699))

(assert (=> b!194773 m!221701))

(assert (=> b!194773 m!221703))

(declare-fun m!222017 () Bool)

(assert (=> b!194773 m!222017))

(assert (=> b!194773 m!221539))

(assert (=> b!194773 m!222013))

(declare-fun m!222019 () Bool)

(assert (=> b!194773 m!222019))

(assert (=> b!194772 m!221539))

(assert (=> b!194772 m!221539))

(assert (=> b!194772 m!221547))

(declare-fun m!222021 () Bool)

(assert (=> b!194768 m!222021))

(declare-fun m!222023 () Bool)

(assert (=> d!57021 m!222023))

(assert (=> d!57021 m!221535))

(assert (=> b!194775 m!221539))

(assert (=> b!194775 m!221539))

(assert (=> b!194775 m!221547))

(assert (=> b!194776 m!221539))

(assert (=> b!194776 m!221539))

(declare-fun m!222025 () Bool)

(assert (=> b!194776 m!222025))

(declare-fun m!222027 () Bool)

(assert (=> b!194774 m!222027))

(assert (=> b!194769 m!222011))

(assert (=> b!194767 m!221701))

(assert (=> b!194767 m!221539))

(declare-fun m!222029 () Bool)

(assert (=> b!194767 m!222029))

(assert (=> b!194767 m!221699))

(assert (=> b!194767 m!221699))

(assert (=> b!194767 m!221701))

(assert (=> b!194767 m!221703))

(assert (=> b!194767 m!221539))

(assert (=> bm!19659 d!57021))

(declare-fun b!194779 () Bool)

(assert (=> b!194779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> b!194779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4191 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))))))))

(declare-fun lt!97219 () ListLongMap!2421)

(declare-fun e!128117 () Bool)

(assert (=> b!194779 (= e!128117 (= (apply!188 lt!97219 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2243 (select (arr!3867 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!19682 () ListLongMap!2421)

(declare-fun bm!19679 () Bool)

(assert (=> bm!19679 (= call!19682 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194780 () Bool)

(declare-fun res!92030 () Bool)

(declare-fun e!128120 () Bool)

(assert (=> b!194780 (=> (not res!92030) (not e!128120))))

(assert (=> b!194780 (= res!92030 (not (contains!1363 lt!97219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128119 () Bool)

(declare-fun b!194781 () Bool)

(assert (=> b!194781 (= e!128119 (= lt!97219 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(declare-fun d!57023 () Bool)

(assert (=> d!57023 e!128120))

(declare-fun res!92029 () Bool)

(assert (=> d!57023 (=> (not res!92029) (not e!128120))))

(assert (=> d!57023 (= res!92029 (not (contains!1363 lt!97219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128116 () ListLongMap!2421)

(assert (=> d!57023 (= lt!97219 e!128116)))

(declare-fun c!35193 () Bool)

(assert (=> d!57023 (= c!35193 (bvsge #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!57023 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!57023 (= (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248))) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!97219)))

(declare-fun b!194782 () Bool)

(declare-fun e!128115 () Bool)

(assert (=> b!194782 (= e!128120 e!128115)))

(declare-fun c!35194 () Bool)

(declare-fun e!128118 () Bool)

(assert (=> b!194782 (= c!35194 e!128118)))

(declare-fun res!92028 () Bool)

(assert (=> b!194782 (=> (not res!92028) (not e!128118))))

(assert (=> b!194782 (= res!92028 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194783 () Bool)

(assert (=> b!194783 (= e!128116 (ListLongMap!2422 Nil!2405))))

(declare-fun b!194784 () Bool)

(declare-fun e!128121 () ListLongMap!2421)

(assert (=> b!194784 (= e!128116 e!128121)))

(declare-fun c!35195 () Bool)

(assert (=> b!194784 (= c!35195 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194785 () Bool)

(declare-fun lt!97220 () Unit!5858)

(declare-fun lt!97215 () Unit!5858)

(assert (=> b!194785 (= lt!97220 lt!97215)))

(declare-fun lt!97216 () (_ BitVec 64))

(declare-fun lt!97218 () ListLongMap!2421)

(declare-fun lt!97214 () V!5633)

(declare-fun lt!97217 () (_ BitVec 64))

(assert (=> b!194785 (not (contains!1363 (+!319 lt!97218 (tuple2!3501 lt!97217 lt!97214)) lt!97216))))

(assert (=> b!194785 (= lt!97215 (addStillNotContains!99 lt!97218 lt!97217 lt!97214 lt!97216))))

(assert (=> b!194785 (= lt!97216 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194785 (= lt!97214 (get!2243 (select (arr!3867 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194785 (= lt!97217 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194785 (= lt!97218 call!19682)))

(assert (=> b!194785 (= e!128121 (+!319 call!19682 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194786 () Bool)

(assert (=> b!194786 (= e!128119 (isEmpty!493 lt!97219))))

(declare-fun b!194787 () Bool)

(assert (=> b!194787 (= e!128118 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194787 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!194788 () Bool)

(assert (=> b!194788 (= e!128115 e!128117)))

(assert (=> b!194788 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!92031 () Bool)

(assert (=> b!194788 (= res!92031 (contains!1363 lt!97219 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194788 (=> (not res!92031) (not e!128117))))

(declare-fun b!194789 () Bool)

(assert (=> b!194789 (= e!128115 e!128119)))

(declare-fun c!35192 () Bool)

(assert (=> b!194789 (= c!35192 (bvslt #b00000000000000000000000000000000 (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194790 () Bool)

(assert (=> b!194790 (= e!128121 call!19682)))

(assert (= (and d!57023 c!35193) b!194783))

(assert (= (and d!57023 (not c!35193)) b!194784))

(assert (= (and b!194784 c!35195) b!194785))

(assert (= (and b!194784 (not c!35195)) b!194790))

(assert (= (or b!194785 b!194790) bm!19679))

(assert (= (and d!57023 res!92029) b!194780))

(assert (= (and b!194780 res!92030) b!194782))

(assert (= (and b!194782 res!92028) b!194787))

(assert (= (and b!194782 c!35194) b!194788))

(assert (= (and b!194782 (not c!35194)) b!194789))

(assert (= (and b!194788 res!92031) b!194779))

(assert (= (and b!194789 c!35192) b!194781))

(assert (= (and b!194789 (not c!35192)) b!194786))

(declare-fun b_lambda!7539 () Bool)

(assert (=> (not b_lambda!7539) (not b!194779)))

(assert (=> b!194779 t!7329))

(declare-fun b_and!11475 () Bool)

(assert (= b_and!11473 (and (=> t!7329 result!4931) b_and!11475)))

(declare-fun b_lambda!7541 () Bool)

(assert (=> (not b_lambda!7541) (not b!194785)))

(assert (=> b!194785 t!7329))

(declare-fun b_and!11477 () Bool)

(assert (= b_and!11475 (and (=> t!7329 result!4931) b_and!11477)))

(declare-fun m!222031 () Bool)

(assert (=> bm!19679 m!222031))

(assert (=> b!194785 m!221057))

(declare-fun m!222033 () Bool)

(assert (=> b!194785 m!222033))

(declare-fun m!222035 () Bool)

(assert (=> b!194785 m!222035))

(assert (=> b!194785 m!221461))

(assert (=> b!194785 m!221461))

(assert (=> b!194785 m!221057))

(assert (=> b!194785 m!221463))

(declare-fun m!222037 () Bool)

(assert (=> b!194785 m!222037))

(assert (=> b!194785 m!221041))

(assert (=> b!194785 m!222033))

(declare-fun m!222039 () Bool)

(assert (=> b!194785 m!222039))

(assert (=> b!194784 m!221041))

(assert (=> b!194784 m!221041))

(assert (=> b!194784 m!221049))

(declare-fun m!222041 () Bool)

(assert (=> b!194780 m!222041))

(declare-fun m!222043 () Bool)

(assert (=> d!57023 m!222043))

(assert (=> d!57023 m!221011))

(assert (=> b!194787 m!221041))

(assert (=> b!194787 m!221041))

(assert (=> b!194787 m!221049))

(assert (=> b!194788 m!221041))

(assert (=> b!194788 m!221041))

(declare-fun m!222045 () Bool)

(assert (=> b!194788 m!222045))

(declare-fun m!222047 () Bool)

(assert (=> b!194786 m!222047))

(assert (=> b!194781 m!222031))

(assert (=> b!194779 m!221057))

(assert (=> b!194779 m!221041))

(declare-fun m!222049 () Bool)

(assert (=> b!194779 m!222049))

(assert (=> b!194779 m!221461))

(assert (=> b!194779 m!221461))

(assert (=> b!194779 m!221057))

(assert (=> b!194779 m!221463))

(assert (=> b!194779 m!221041))

(assert (=> bm!19645 d!57023))

(declare-fun d!57025 () Bool)

(declare-fun res!92036 () Bool)

(declare-fun e!128126 () Bool)

(assert (=> d!57025 (=> res!92036 e!128126)))

(assert (=> d!57025 (= res!92036 (or ((_ is Nil!2405) lt!96993) ((_ is Nil!2405) (t!7326 lt!96993))))))

(assert (=> d!57025 (= (isStrictlySorted!344 lt!96993) e!128126)))

(declare-fun b!194795 () Bool)

(declare-fun e!128127 () Bool)

(assert (=> b!194795 (= e!128126 e!128127)))

(declare-fun res!92037 () Bool)

(assert (=> b!194795 (=> (not res!92037) (not e!128127))))

(assert (=> b!194795 (= res!92037 (bvslt (_1!1761 (h!3045 lt!96993)) (_1!1761 (h!3045 (t!7326 lt!96993)))))))

(declare-fun b!194796 () Bool)

(assert (=> b!194796 (= e!128127 (isStrictlySorted!344 (t!7326 lt!96993)))))

(assert (= (and d!57025 (not res!92036)) b!194795))

(assert (= (and b!194795 res!92037) b!194796))

(declare-fun m!222051 () Bool)

(assert (=> b!194796 m!222051))

(assert (=> d!56793 d!57025))

(declare-fun d!57027 () Bool)

(declare-fun res!92038 () Bool)

(declare-fun e!128128 () Bool)

(assert (=> d!57027 (=> res!92038 e!128128)))

(assert (=> d!57027 (= res!92038 (or ((_ is Nil!2405) (toList!1226 lt!96700)) ((_ is Nil!2405) (t!7326 (toList!1226 lt!96700)))))))

(assert (=> d!57027 (= (isStrictlySorted!344 (toList!1226 lt!96700)) e!128128)))

(declare-fun b!194797 () Bool)

(declare-fun e!128129 () Bool)

(assert (=> b!194797 (= e!128128 e!128129)))

(declare-fun res!92039 () Bool)

(assert (=> b!194797 (=> (not res!92039) (not e!128129))))

(assert (=> b!194797 (= res!92039 (bvslt (_1!1761 (h!3045 (toList!1226 lt!96700))) (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700))))))))

(declare-fun b!194798 () Bool)

(assert (=> b!194798 (= e!128129 (isStrictlySorted!344 (t!7326 (toList!1226 lt!96700))))))

(assert (= (and d!57027 (not res!92038)) b!194797))

(assert (= (and b!194797 res!92039) b!194798))

(declare-fun m!222053 () Bool)

(assert (=> b!194798 m!222053))

(assert (=> d!56793 d!57027))

(declare-fun d!57029 () Bool)

(declare-fun c!35198 () Bool)

(assert (=> d!57029 (= c!35198 ((_ is Nil!2405) (toList!1226 lt!96885)))))

(declare-fun e!128132 () (InoxSet tuple2!3500))

(assert (=> d!57029 (= (content!156 (toList!1226 lt!96885)) e!128132)))

(declare-fun b!194803 () Bool)

(assert (=> b!194803 (= e!128132 ((as const (Array tuple2!3500 Bool)) false))))

(declare-fun b!194804 () Bool)

(assert (=> b!194804 (= e!128132 ((_ map or) (store ((as const (Array tuple2!3500 Bool)) false) (h!3045 (toList!1226 lt!96885)) true) (content!156 (t!7326 (toList!1226 lt!96885)))))))

(assert (= (and d!57029 c!35198) b!194803))

(assert (= (and d!57029 (not c!35198)) b!194804))

(declare-fun m!222055 () Bool)

(assert (=> b!194804 m!222055))

(declare-fun m!222057 () Bool)

(assert (=> b!194804 m!222057))

(assert (=> d!56925 d!57029))

(declare-fun d!57031 () Bool)

(declare-fun res!92040 () Bool)

(declare-fun e!128133 () Bool)

(assert (=> d!57031 (=> res!92040 e!128133)))

(assert (=> d!57031 (= res!92040 (and ((_ is Cons!2404) (toList!1226 lt!96885)) (= (_1!1761 (h!3045 (toList!1226 lt!96885))) (_1!1761 lt!96690))))))

(assert (=> d!57031 (= (containsKey!249 (toList!1226 lt!96885) (_1!1761 lt!96690)) e!128133)))

(declare-fun b!194805 () Bool)

(declare-fun e!128134 () Bool)

(assert (=> b!194805 (= e!128133 e!128134)))

(declare-fun res!92041 () Bool)

(assert (=> b!194805 (=> (not res!92041) (not e!128134))))

(assert (=> b!194805 (= res!92041 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96885))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96885))) (_1!1761 lt!96690))) ((_ is Cons!2404) (toList!1226 lt!96885)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96885))) (_1!1761 lt!96690))))))

(declare-fun b!194806 () Bool)

(assert (=> b!194806 (= e!128134 (containsKey!249 (t!7326 (toList!1226 lt!96885)) (_1!1761 lt!96690)))))

(assert (= (and d!57031 (not res!92040)) b!194805))

(assert (= (and b!194805 res!92041) b!194806))

(declare-fun m!222059 () Bool)

(assert (=> b!194806 m!222059))

(assert (=> d!56787 d!57031))

(declare-fun lt!97221 () Bool)

(declare-fun d!57033 () Bool)

(assert (=> d!57033 (= lt!97221 (select (content!156 (toList!1226 lt!96970)) (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))

(declare-fun e!128136 () Bool)

(assert (=> d!57033 (= lt!97221 e!128136)))

(declare-fun res!92042 () Bool)

(assert (=> d!57033 (=> (not res!92042) (not e!128136))))

(assert (=> d!57033 (= res!92042 ((_ is Cons!2404) (toList!1226 lt!96970)))))

(assert (=> d!57033 (= (contains!1365 (toList!1226 lt!96970) (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) lt!97221)))

(declare-fun b!194807 () Bool)

(declare-fun e!128135 () Bool)

(assert (=> b!194807 (= e!128136 e!128135)))

(declare-fun res!92043 () Bool)

(assert (=> b!194807 (=> res!92043 e!128135)))

(assert (=> b!194807 (= res!92043 (= (h!3045 (toList!1226 lt!96970)) (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))

(declare-fun b!194808 () Bool)

(assert (=> b!194808 (= e!128135 (contains!1365 (t!7326 (toList!1226 lt!96970)) (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57033 res!92042) b!194807))

(assert (= (and b!194807 (not res!92043)) b!194808))

(declare-fun m!222061 () Bool)

(assert (=> d!57033 m!222061))

(declare-fun m!222063 () Bool)

(assert (=> d!57033 m!222063))

(declare-fun m!222065 () Bool)

(assert (=> b!194808 m!222065))

(assert (=> b!194309 d!57033))

(declare-fun d!57035 () Bool)

(declare-fun res!92044 () Bool)

(declare-fun e!128137 () Bool)

(assert (=> d!57035 (=> res!92044 e!128137)))

(assert (=> d!57035 (= res!92044 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))) lt!96915)))))

(assert (=> d!57035 (= (containsKey!249 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915) e!128137)))

(declare-fun b!194809 () Bool)

(declare-fun e!128138 () Bool)

(assert (=> b!194809 (= e!128137 e!128138)))

(declare-fun res!92045 () Bool)

(assert (=> b!194809 (=> (not res!92045) (not e!128138))))

(assert (=> b!194809 (= res!92045 (and (or (not ((_ is Cons!2404) (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))) (bvsle (_1!1761 (h!3045 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))) lt!96915)) ((_ is Cons!2404) (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))) (bvslt (_1!1761 (h!3045 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))) lt!96915)))))

(declare-fun b!194810 () Bool)

(assert (=> b!194810 (= e!128138 (containsKey!249 (t!7326 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))) lt!96915))))

(assert (= (and d!57035 (not res!92044)) b!194809))

(assert (= (and b!194809 res!92045) b!194810))

(declare-fun m!222067 () Bool)

(assert (=> b!194810 m!222067))

(assert (=> d!56761 d!57035))

(declare-fun d!57037 () Bool)

(declare-fun res!92046 () Bool)

(declare-fun e!128139 () Bool)

(assert (=> d!57037 (=> res!92046 e!128139)))

(assert (=> d!57037 (= res!92046 (and ((_ is Cons!2404) (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (= (_1!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(assert (=> d!57037 (= (containsKey!249 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) e!128139)))

(declare-fun b!194811 () Bool)

(declare-fun e!128140 () Bool)

(assert (=> b!194811 (= e!128139 e!128140)))

(declare-fun res!92047 () Bool)

(assert (=> b!194811 (=> (not res!92047) (not e!128140))))

(assert (=> b!194811 (= res!92047 (and (or (not ((_ is Cons!2404) (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (bvsle (_1!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))) ((_ is Cons!2404) (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (bvslt (_1!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(declare-fun b!194812 () Bool)

(assert (=> b!194812 (= e!128140 (containsKey!249 (t!7326 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (= (and d!57037 (not res!92046)) b!194811))

(assert (= (and b!194811 res!92047) b!194812))

(assert (=> b!194812 m!220871))

(declare-fun m!222069 () Bool)

(assert (=> b!194812 m!222069))

(assert (=> d!56913 d!57037))

(declare-fun d!57039 () Bool)

(declare-fun e!128142 () Bool)

(assert (=> d!57039 e!128142))

(declare-fun res!92048 () Bool)

(assert (=> d!57039 (=> res!92048 e!128142)))

(declare-fun lt!97223 () Bool)

(assert (=> d!57039 (= res!92048 (not lt!97223))))

(declare-fun lt!97225 () Bool)

(assert (=> d!57039 (= lt!97223 lt!97225)))

(declare-fun lt!97222 () Unit!5858)

(declare-fun e!128141 () Unit!5858)

(assert (=> d!57039 (= lt!97222 e!128141)))

(declare-fun c!35199 () Bool)

(assert (=> d!57039 (= c!35199 lt!97225)))

(assert (=> d!57039 (= lt!97225 (containsKey!249 (toList!1226 lt!97089) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(assert (=> d!57039 (= (contains!1363 lt!97089 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) lt!97223)))

(declare-fun b!194813 () Bool)

(declare-fun lt!97224 () Unit!5858)

(assert (=> b!194813 (= e!128141 lt!97224)))

(assert (=> b!194813 (= lt!97224 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97089) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(assert (=> b!194813 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97089) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun b!194814 () Bool)

(declare-fun Unit!5885 () Unit!5858)

(assert (=> b!194814 (= e!128141 Unit!5885)))

(declare-fun b!194815 () Bool)

(assert (=> b!194815 (= e!128142 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97089) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57039 c!35199) b!194813))

(assert (= (and d!57039 (not c!35199)) b!194814))

(assert (= (and d!57039 (not res!92048)) b!194815))

(declare-fun m!222071 () Bool)

(assert (=> d!57039 m!222071))

(declare-fun m!222073 () Bool)

(assert (=> b!194813 m!222073))

(assert (=> b!194813 m!221621))

(assert (=> b!194813 m!221621))

(declare-fun m!222075 () Bool)

(assert (=> b!194813 m!222075))

(assert (=> b!194815 m!221621))

(assert (=> b!194815 m!221621))

(assert (=> b!194815 m!222075))

(assert (=> d!56861 d!57039))

(declare-fun b!194817 () Bool)

(declare-fun e!128143 () Option!252)

(declare-fun e!128144 () Option!252)

(assert (=> b!194817 (= e!128143 e!128144)))

(declare-fun c!35201 () Bool)

(assert (=> b!194817 (= c!35201 (and ((_ is Cons!2404) lt!97091) (not (= (_1!1761 (h!3045 lt!97091)) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194819 () Bool)

(assert (=> b!194819 (= e!128144 None!250)))

(declare-fun c!35200 () Bool)

(declare-fun d!57041 () Bool)

(assert (=> d!57041 (= c!35200 (and ((_ is Cons!2404) lt!97091) (= (_1!1761 (h!3045 lt!97091)) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(assert (=> d!57041 (= (getValueByKey!246 lt!97091 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) e!128143)))

(declare-fun b!194818 () Bool)

(assert (=> b!194818 (= e!128144 (getValueByKey!246 (t!7326 lt!97091) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun b!194816 () Bool)

(assert (=> b!194816 (= e!128143 (Some!251 (_2!1761 (h!3045 lt!97091))))))

(assert (= (and d!57041 c!35200) b!194816))

(assert (= (and d!57041 (not c!35200)) b!194817))

(assert (= (and b!194817 c!35201) b!194818))

(assert (= (and b!194817 (not c!35201)) b!194819))

(declare-fun m!222077 () Bool)

(assert (=> b!194818 m!222077))

(assert (=> d!56861 d!57041))

(declare-fun d!57043 () Bool)

(assert (=> d!57043 (= (getValueByKey!246 lt!97091 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97226 () Unit!5858)

(assert (=> d!57043 (= lt!97226 (choose!1076 lt!97091 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun e!128145 () Bool)

(assert (=> d!57043 e!128145))

(declare-fun res!92049 () Bool)

(assert (=> d!57043 (=> (not res!92049) (not e!128145))))

(assert (=> d!57043 (= res!92049 (isStrictlySorted!344 lt!97091))))

(assert (=> d!57043 (= (lemmaContainsTupThenGetReturnValue!133 lt!97091 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) lt!97226)))

(declare-fun b!194820 () Bool)

(declare-fun res!92050 () Bool)

(assert (=> b!194820 (=> (not res!92050) (not e!128145))))

(assert (=> b!194820 (= res!92050 (containsKey!249 lt!97091 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun b!194821 () Bool)

(assert (=> b!194821 (= e!128145 (contains!1365 lt!97091 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57043 res!92049) b!194820))

(assert (= (and b!194820 res!92050) b!194821))

(assert (=> d!57043 m!221615))

(declare-fun m!222079 () Bool)

(assert (=> d!57043 m!222079))

(declare-fun m!222081 () Bool)

(assert (=> d!57043 m!222081))

(declare-fun m!222083 () Bool)

(assert (=> b!194820 m!222083))

(declare-fun m!222085 () Bool)

(assert (=> b!194821 m!222085))

(assert (=> d!56861 d!57043))

(declare-fun lt!97227 () List!2408)

(declare-fun b!194822 () Bool)

(declare-fun e!128147 () Bool)

(assert (=> b!194822 (= e!128147 (contains!1365 lt!97227 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(declare-fun bm!19680 () Bool)

(declare-fun call!19685 () List!2408)

(declare-fun call!19683 () List!2408)

(assert (=> bm!19680 (= call!19685 call!19683)))

(declare-fun e!128146 () List!2408)

(declare-fun b!194823 () Bool)

(assert (=> b!194823 (= e!128146 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96876)) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun b!194824 () Bool)

(declare-fun e!128150 () List!2408)

(declare-fun call!19684 () List!2408)

(assert (=> b!194824 (= e!128150 call!19684)))

(declare-fun b!194825 () Bool)

(declare-fun res!92051 () Bool)

(assert (=> b!194825 (=> (not res!92051) (not e!128147))))

(assert (=> b!194825 (= res!92051 (containsKey!249 lt!97227 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19681 () Bool)

(assert (=> bm!19681 (= call!19684 call!19685)))

(declare-fun c!35204 () Bool)

(declare-fun b!194826 () Bool)

(assert (=> b!194826 (= c!35204 (and ((_ is Cons!2404) (toList!1226 lt!96876)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96876))) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(declare-fun e!128149 () List!2408)

(assert (=> b!194826 (= e!128149 e!128150)))

(declare-fun b!194827 () Bool)

(assert (=> b!194827 (= e!128149 call!19685)))

(declare-fun b!194828 () Bool)

(declare-fun e!128148 () List!2408)

(assert (=> b!194828 (= e!128148 e!128149)))

(declare-fun c!35202 () Bool)

(assert (=> b!194828 (= c!35202 (and ((_ is Cons!2404) (toList!1226 lt!96876)) (= (_1!1761 (h!3045 (toList!1226 lt!96876))) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(declare-fun b!194830 () Bool)

(assert (=> b!194830 (= e!128150 call!19684)))

(declare-fun c!35205 () Bool)

(declare-fun bm!19682 () Bool)

(assert (=> bm!19682 (= call!19683 ($colon$colon!102 e!128146 (ite c!35205 (h!3045 (toList!1226 lt!96876)) (tuple2!3501 (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35203 () Bool)

(assert (=> bm!19682 (= c!35203 c!35205)))

(declare-fun b!194831 () Bool)

(assert (=> b!194831 (= e!128148 call!19683)))

(declare-fun b!194829 () Bool)

(assert (=> b!194829 (= e!128146 (ite c!35202 (t!7326 (toList!1226 lt!96876)) (ite c!35204 (Cons!2404 (h!3045 (toList!1226 lt!96876)) (t!7326 (toList!1226 lt!96876))) Nil!2405)))))

(declare-fun d!57045 () Bool)

(assert (=> d!57045 e!128147))

(declare-fun res!92052 () Bool)

(assert (=> d!57045 (=> (not res!92052) (not e!128147))))

(assert (=> d!57045 (= res!92052 (isStrictlySorted!344 lt!97227))))

(assert (=> d!57045 (= lt!97227 e!128148)))

(assert (=> d!57045 (= c!35205 (and ((_ is Cons!2404) (toList!1226 lt!96876)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96876))) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(assert (=> d!57045 (isStrictlySorted!344 (toList!1226 lt!96876))))

(assert (=> d!57045 (= (insertStrictlySorted!136 (toList!1226 lt!96876) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) lt!97227)))

(assert (= (and d!57045 c!35205) b!194831))

(assert (= (and d!57045 (not c!35205)) b!194828))

(assert (= (and b!194828 c!35202) b!194827))

(assert (= (and b!194828 (not c!35202)) b!194826))

(assert (= (and b!194826 c!35204) b!194830))

(assert (= (and b!194826 (not c!35204)) b!194824))

(assert (= (or b!194830 b!194824) bm!19681))

(assert (= (or b!194827 bm!19681) bm!19680))

(assert (= (or b!194831 bm!19680) bm!19682))

(assert (= (and bm!19682 c!35203) b!194823))

(assert (= (and bm!19682 (not c!35203)) b!194829))

(assert (= (and d!57045 res!92052) b!194825))

(assert (= (and b!194825 res!92051) b!194822))

(declare-fun m!222087 () Bool)

(assert (=> b!194825 m!222087))

(declare-fun m!222089 () Bool)

(assert (=> b!194823 m!222089))

(declare-fun m!222091 () Bool)

(assert (=> bm!19682 m!222091))

(declare-fun m!222093 () Bool)

(assert (=> b!194822 m!222093))

(declare-fun m!222095 () Bool)

(assert (=> d!57045 m!222095))

(declare-fun m!222097 () Bool)

(assert (=> d!57045 m!222097))

(assert (=> d!56861 d!57045))

(declare-fun b!194833 () Bool)

(declare-fun e!128151 () Option!252)

(declare-fun e!128152 () Option!252)

(assert (=> b!194833 (= e!128151 e!128152)))

(declare-fun c!35207 () Bool)

(assert (=> b!194833 (= c!35207 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96927))) (not (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96927)))) (_1!1761 lt!96690)))))))

(declare-fun b!194835 () Bool)

(assert (=> b!194835 (= e!128152 None!250)))

(declare-fun d!57047 () Bool)

(declare-fun c!35206 () Bool)

(assert (=> d!57047 (= c!35206 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96927))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96927)))) (_1!1761 lt!96690))))))

(assert (=> d!57047 (= (getValueByKey!246 (t!7326 (toList!1226 lt!96927)) (_1!1761 lt!96690)) e!128151)))

(declare-fun b!194834 () Bool)

(assert (=> b!194834 (= e!128152 (getValueByKey!246 (t!7326 (t!7326 (toList!1226 lt!96927))) (_1!1761 lt!96690)))))

(declare-fun b!194832 () Bool)

(assert (=> b!194832 (= e!128151 (Some!251 (_2!1761 (h!3045 (t!7326 (toList!1226 lt!96927))))))))

(assert (= (and d!57047 c!35206) b!194832))

(assert (= (and d!57047 (not c!35206)) b!194833))

(assert (= (and b!194833 c!35207) b!194834))

(assert (= (and b!194833 (not c!35207)) b!194835))

(declare-fun m!222099 () Bool)

(assert (=> b!194834 m!222099))

(assert (=> b!194562 d!57047))

(assert (=> d!56905 d!56913))

(assert (=> d!56905 d!56741))

(assert (=> d!56815 d!56831))

(declare-fun d!57049 () Bool)

(assert (=> d!57049 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7780 () Bool)

(assert (= bs!7780 d!57049))

(assert (=> bs!7780 m!221519))

(declare-fun m!222101 () Bool)

(assert (=> bs!7780 m!222101))

(assert (=> b!194553 d!57049))

(assert (=> b!194553 d!57011))

(assert (=> b!194528 d!56965))

(declare-fun d!57051 () Bool)

(assert (=> d!57051 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96913) lt!96900)) (v!4257 (getValueByKey!246 (toList!1226 lt!96913) lt!96900)))))

(assert (=> d!56769 d!57051))

(declare-fun b!194837 () Bool)

(declare-fun e!128153 () Option!252)

(declare-fun e!128154 () Option!252)

(assert (=> b!194837 (= e!128153 e!128154)))

(declare-fun c!35209 () Bool)

(assert (=> b!194837 (= c!35209 (and ((_ is Cons!2404) (toList!1226 lt!96913)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96913))) lt!96900))))))

(declare-fun b!194839 () Bool)

(assert (=> b!194839 (= e!128154 None!250)))

(declare-fun d!57053 () Bool)

(declare-fun c!35208 () Bool)

(assert (=> d!57053 (= c!35208 (and ((_ is Cons!2404) (toList!1226 lt!96913)) (= (_1!1761 (h!3045 (toList!1226 lt!96913))) lt!96900)))))

(assert (=> d!57053 (= (getValueByKey!246 (toList!1226 lt!96913) lt!96900) e!128153)))

(declare-fun b!194838 () Bool)

(assert (=> b!194838 (= e!128154 (getValueByKey!246 (t!7326 (toList!1226 lt!96913)) lt!96900))))

(declare-fun b!194836 () Bool)

(assert (=> b!194836 (= e!128153 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96913)))))))

(assert (= (and d!57053 c!35208) b!194836))

(assert (= (and d!57053 (not c!35208)) b!194837))

(assert (= (and b!194837 c!35209) b!194838))

(assert (= (and b!194837 (not c!35209)) b!194839))

(declare-fun m!222103 () Bool)

(assert (=> b!194838 m!222103))

(assert (=> d!56769 d!57053))

(declare-fun d!57055 () Bool)

(assert (=> d!57055 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96875) lt!96872)) (v!4257 (getValueByKey!246 (toList!1226 lt!96875) lt!96872)))))

(assert (=> d!56871 d!57055))

(declare-fun b!194841 () Bool)

(declare-fun e!128155 () Option!252)

(declare-fun e!128156 () Option!252)

(assert (=> b!194841 (= e!128155 e!128156)))

(declare-fun c!35211 () Bool)

(assert (=> b!194841 (= c!35211 (and ((_ is Cons!2404) (toList!1226 lt!96875)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96875))) lt!96872))))))

(declare-fun b!194843 () Bool)

(assert (=> b!194843 (= e!128156 None!250)))

(declare-fun d!57057 () Bool)

(declare-fun c!35210 () Bool)

(assert (=> d!57057 (= c!35210 (and ((_ is Cons!2404) (toList!1226 lt!96875)) (= (_1!1761 (h!3045 (toList!1226 lt!96875))) lt!96872)))))

(assert (=> d!57057 (= (getValueByKey!246 (toList!1226 lt!96875) lt!96872) e!128155)))

(declare-fun b!194842 () Bool)

(assert (=> b!194842 (= e!128156 (getValueByKey!246 (t!7326 (toList!1226 lt!96875)) lt!96872))))

(declare-fun b!194840 () Bool)

(assert (=> b!194840 (= e!128155 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96875)))))))

(assert (= (and d!57057 c!35210) b!194840))

(assert (= (and d!57057 (not c!35210)) b!194841))

(assert (= (and b!194841 c!35211) b!194842))

(assert (= (and b!194841 (not c!35211)) b!194843))

(declare-fun m!222105 () Bool)

(assert (=> b!194842 m!222105))

(assert (=> d!56871 d!57057))

(declare-fun d!57059 () Bool)

(assert (=> d!57059 (= (apply!188 lt!97002 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2244 (getValueByKey!246 (toList!1226 lt!97002) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7781 () Bool)

(assert (= bs!7781 d!57059))

(assert (=> bs!7781 m!221041))

(declare-fun m!222107 () Bool)

(assert (=> bs!7781 m!222107))

(assert (=> bs!7781 m!222107))

(declare-fun m!222109 () Bool)

(assert (=> bs!7781 m!222109))

(assert (=> b!194392 d!57059))

(assert (=> b!194392 d!56921))

(declare-fun d!57061 () Bool)

(assert (=> d!57061 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96885) (_1!1761 lt!96690)))))

(declare-fun lt!97228 () Unit!5858)

(assert (=> d!57061 (= lt!97228 (choose!1077 (toList!1226 lt!96885) (_1!1761 lt!96690)))))

(declare-fun e!128157 () Bool)

(assert (=> d!57061 e!128157))

(declare-fun res!92053 () Bool)

(assert (=> d!57061 (=> (not res!92053) (not e!128157))))

(assert (=> d!57061 (= res!92053 (isStrictlySorted!344 (toList!1226 lt!96885)))))

(assert (=> d!57061 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96885) (_1!1761 lt!96690)) lt!97228)))

(declare-fun b!194844 () Bool)

(assert (=> b!194844 (= e!128157 (containsKey!249 (toList!1226 lt!96885) (_1!1761 lt!96690)))))

(assert (= (and d!57061 res!92053) b!194844))

(assert (=> d!57061 m!221105))

(assert (=> d!57061 m!221105))

(assert (=> d!57061 m!221349))

(declare-fun m!222111 () Bool)

(assert (=> d!57061 m!222111))

(declare-fun m!222113 () Bool)

(assert (=> d!57061 m!222113))

(assert (=> b!194844 m!221345))

(assert (=> b!194329 d!57061))

(declare-fun d!57063 () Bool)

(assert (=> d!57063 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96885) (_1!1761 lt!96690))) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96885) (_1!1761 lt!96690)))))))

(declare-fun bs!7782 () Bool)

(assert (= bs!7782 d!57063))

(assert (=> bs!7782 m!221105))

(declare-fun m!222115 () Bool)

(assert (=> bs!7782 m!222115))

(assert (=> b!194329 d!57063))

(assert (=> b!194329 d!56819))

(declare-fun d!57065 () Bool)

(assert (=> d!57065 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7783 () Bool)

(assert (= bs!7783 d!57065))

(assert (=> bs!7783 m!221373))

(declare-fun m!222117 () Bool)

(assert (=> bs!7783 m!222117))

(assert (=> b!194658 d!57065))

(declare-fun b!194846 () Bool)

(declare-fun e!128158 () Option!252)

(declare-fun e!128159 () Option!252)

(assert (=> b!194846 (= e!128158 e!128159)))

(declare-fun c!35213 () Bool)

(assert (=> b!194846 (= c!35213 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96908))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194848 () Bool)

(assert (=> b!194848 (= e!128159 None!250)))

(declare-fun d!57067 () Bool)

(declare-fun c!35212 () Bool)

(assert (=> d!57067 (= c!35212 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (= (_1!1761 (h!3045 (toList!1226 lt!96908))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57067 (= (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000) e!128158)))

(declare-fun b!194847 () Bool)

(assert (=> b!194847 (= e!128159 (getValueByKey!246 (t!7326 (toList!1226 lt!96908)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194845 () Bool)

(assert (=> b!194845 (= e!128158 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96908)))))))

(assert (= (and d!57067 c!35212) b!194845))

(assert (= (and d!57067 (not c!35212)) b!194846))

(assert (= (and b!194846 c!35213) b!194847))

(assert (= (and b!194846 (not c!35213)) b!194848))

(declare-fun m!222119 () Bool)

(assert (=> b!194847 m!222119))

(assert (=> b!194658 d!57067))

(assert (=> d!56791 d!56789))

(declare-fun d!57069 () Bool)

(assert (=> d!57069 (= (getValueByKey!246 lt!96887 (_1!1761 lt!96690)) (Some!251 (_2!1761 lt!96690)))))

(assert (=> d!57069 true))

(declare-fun _$22!539 () Unit!5858)

(assert (=> d!57069 (= (choose!1076 lt!96887 (_1!1761 lt!96690) (_2!1761 lt!96690)) _$22!539)))

(declare-fun bs!7784 () Bool)

(assert (= bs!7784 d!57069))

(assert (=> bs!7784 m!221099))

(assert (=> d!56791 d!57069))

(declare-fun d!57071 () Bool)

(declare-fun res!92054 () Bool)

(declare-fun e!128160 () Bool)

(assert (=> d!57071 (=> res!92054 e!128160)))

(assert (=> d!57071 (= res!92054 (or ((_ is Nil!2405) lt!96887) ((_ is Nil!2405) (t!7326 lt!96887))))))

(assert (=> d!57071 (= (isStrictlySorted!344 lt!96887) e!128160)))

(declare-fun b!194849 () Bool)

(declare-fun e!128161 () Bool)

(assert (=> b!194849 (= e!128160 e!128161)))

(declare-fun res!92055 () Bool)

(assert (=> b!194849 (=> (not res!92055) (not e!128161))))

(assert (=> b!194849 (= res!92055 (bvslt (_1!1761 (h!3045 lt!96887)) (_1!1761 (h!3045 (t!7326 lt!96887)))))))

(declare-fun b!194850 () Bool)

(assert (=> b!194850 (= e!128161 (isStrictlySorted!344 (t!7326 lt!96887)))))

(assert (= (and d!57071 (not res!92054)) b!194849))

(assert (= (and b!194849 res!92055) b!194850))

(declare-fun m!222121 () Bool)

(assert (=> b!194850 m!222121))

(assert (=> d!56791 d!57071))

(assert (=> b!194289 d!56823))

(declare-fun d!57073 () Bool)

(declare-fun res!92056 () Bool)

(declare-fun e!128162 () Bool)

(assert (=> d!57073 (=> res!92056 e!128162)))

(assert (=> d!57073 (= res!92056 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (= (_1!1761 (h!3045 (toList!1226 lt!96864))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57073 (= (containsKey!249 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000) e!128162)))

(declare-fun b!194851 () Bool)

(declare-fun e!128163 () Bool)

(assert (=> b!194851 (= e!128162 e!128163)))

(declare-fun res!92057 () Bool)

(assert (=> b!194851 (=> (not res!92057) (not e!128163))))

(assert (=> b!194851 (= res!92057 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96864))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96864))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2404) (toList!1226 lt!96864)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96864))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194852 () Bool)

(assert (=> b!194852 (= e!128163 (containsKey!249 (t!7326 (toList!1226 lt!96864)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57073 (not res!92056)) b!194851))

(assert (= (and b!194851 res!92057) b!194852))

(declare-fun m!222123 () Bool)

(assert (=> b!194852 m!222123))

(assert (=> d!56821 d!57073))

(declare-fun d!57075 () Bool)

(declare-fun e!128165 () Bool)

(assert (=> d!57075 e!128165))

(declare-fun res!92058 () Bool)

(assert (=> d!57075 (=> res!92058 e!128165)))

(declare-fun lt!97230 () Bool)

(assert (=> d!57075 (= res!92058 (not lt!97230))))

(declare-fun lt!97232 () Bool)

(assert (=> d!57075 (= lt!97230 lt!97232)))

(declare-fun lt!97229 () Unit!5858)

(declare-fun e!128164 () Unit!5858)

(assert (=> d!57075 (= lt!97229 e!128164)))

(declare-fun c!35214 () Bool)

(assert (=> d!57075 (= c!35214 lt!97232)))

(assert (=> d!57075 (= lt!97232 (containsKey!249 (toList!1226 lt!96875) lt!96872))))

(assert (=> d!57075 (= (contains!1363 lt!96875 lt!96872) lt!97230)))

(declare-fun b!194853 () Bool)

(declare-fun lt!97231 () Unit!5858)

(assert (=> b!194853 (= e!128164 lt!97231)))

(assert (=> b!194853 (= lt!97231 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96875) lt!96872))))

(assert (=> b!194853 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96875) lt!96872))))

(declare-fun b!194854 () Bool)

(declare-fun Unit!5886 () Unit!5858)

(assert (=> b!194854 (= e!128164 Unit!5886)))

(declare-fun b!194855 () Bool)

(assert (=> b!194855 (= e!128165 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96875) lt!96872)))))

(assert (= (and d!57075 c!35214) b!194853))

(assert (= (and d!57075 (not c!35214)) b!194854))

(assert (= (and d!57075 (not res!92058)) b!194855))

(declare-fun m!222125 () Bool)

(assert (=> d!57075 m!222125))

(declare-fun m!222127 () Bool)

(assert (=> b!194853 m!222127))

(assert (=> b!194853 m!221645))

(assert (=> b!194853 m!221645))

(declare-fun m!222129 () Bool)

(assert (=> b!194853 m!222129))

(assert (=> b!194855 m!221645))

(assert (=> b!194855 m!221645))

(assert (=> b!194855 m!222129))

(assert (=> d!56867 d!57075))

(assert (=> d!56867 d!56853))

(assert (=> d!56867 d!56871))

(assert (=> d!56867 d!56855))

(declare-fun d!57077 () Bool)

(assert (=> d!57077 (= (apply!188 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) lt!96872) (apply!188 lt!96875 lt!96872))))

(assert (=> d!57077 true))

(declare-fun _$34!1090 () Unit!5858)

(assert (=> d!57077 (= (choose!1074 lt!96875 lt!96866 (zeroValue!3800 thiss!1248) lt!96872) _$34!1090)))

(declare-fun bs!7785 () Bool)

(assert (= bs!7785 d!57077))

(assert (=> bs!7785 m!221085))

(assert (=> bs!7785 m!221085))

(assert (=> bs!7785 m!221093))

(assert (=> bs!7785 m!221077))

(assert (=> d!56867 d!57077))

(assert (=> d!56839 d!56831))

(declare-fun d!57079 () Bool)

(assert (=> d!57079 (isDefined!198 (getValueByKey!246 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun lt!97233 () Unit!5858)

(assert (=> d!57079 (= lt!97233 (choose!1077 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun e!128166 () Bool)

(assert (=> d!57079 e!128166))

(declare-fun res!92059 () Bool)

(assert (=> d!57079 (=> (not res!92059) (not e!128166))))

(assert (=> d!57079 (= res!92059 (isStrictlySorted!344 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))))

(assert (=> d!57079 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) lt!97233)))

(declare-fun b!194857 () Bool)

(assert (=> b!194857 (= e!128166 (containsKey!249 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (= (and d!57079 res!92059) b!194857))

(assert (=> d!57079 m!220871))

(assert (=> d!57079 m!221773))

(assert (=> d!57079 m!221773))

(assert (=> d!57079 m!221775))

(assert (=> d!57079 m!220871))

(declare-fun m!222131 () Bool)

(assert (=> d!57079 m!222131))

(declare-fun m!222133 () Bool)

(assert (=> d!57079 m!222133))

(assert (=> b!194857 m!220871))

(assert (=> b!194857 m!221769))

(assert (=> b!194615 d!57079))

(declare-fun d!57081 () Bool)

(assert (=> d!57081 (= (isDefined!198 (getValueByKey!246 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))) (not (isEmpty!494 (getValueByKey!246 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))))

(declare-fun bs!7786 () Bool)

(assert (= bs!7786 d!57081))

(assert (=> bs!7786 m!221773))

(declare-fun m!222135 () Bool)

(assert (=> bs!7786 m!222135))

(assert (=> b!194615 d!57081))

(declare-fun b!194859 () Bool)

(declare-fun e!128167 () Option!252)

(declare-fun e!128168 () Option!252)

(assert (=> b!194859 (= e!128167 e!128168)))

(declare-fun c!35216 () Bool)

(assert (=> b!194859 (= c!35216 (and ((_ is Cons!2404) (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (not (= (_1!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))))

(declare-fun b!194861 () Bool)

(assert (=> b!194861 (= e!128168 None!250)))

(declare-fun d!57083 () Bool)

(declare-fun c!35215 () Bool)

(assert (=> d!57083 (= c!35215 (and ((_ is Cons!2404) (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (= (_1!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(assert (=> d!57083 (= (getValueByKey!246 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) e!128167)))

(declare-fun b!194860 () Bool)

(assert (=> b!194860 (= e!128168 (getValueByKey!246 (t!7326 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun b!194858 () Bool)

(assert (=> b!194858 (= e!128167 (Some!251 (_2!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))))))

(assert (= (and d!57083 c!35215) b!194858))

(assert (= (and d!57083 (not c!35215)) b!194859))

(assert (= (and b!194859 c!35216) b!194860))

(assert (= (and b!194859 (not c!35216)) b!194861))

(assert (=> b!194860 m!220871))

(declare-fun m!222137 () Bool)

(assert (=> b!194860 m!222137))

(assert (=> b!194615 d!57083))

(declare-fun d!57085 () Bool)

(declare-fun lt!97234 () Bool)

(assert (=> d!57085 (= lt!97234 (select (content!156 (toList!1226 lt!97089)) (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))

(declare-fun e!128170 () Bool)

(assert (=> d!57085 (= lt!97234 e!128170)))

(declare-fun res!92060 () Bool)

(assert (=> d!57085 (=> (not res!92060) (not e!128170))))

(assert (=> d!57085 (= res!92060 ((_ is Cons!2404) (toList!1226 lt!97089)))))

(assert (=> d!57085 (= (contains!1365 (toList!1226 lt!97089) (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) lt!97234)))

(declare-fun b!194862 () Bool)

(declare-fun e!128169 () Bool)

(assert (=> b!194862 (= e!128170 e!128169)))

(declare-fun res!92061 () Bool)

(assert (=> b!194862 (=> res!92061 e!128169)))

(assert (=> b!194862 (= res!92061 (= (h!3045 (toList!1226 lt!97089)) (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))

(declare-fun b!194863 () Bool)

(assert (=> b!194863 (= e!128169 (contains!1365 (t!7326 (toList!1226 lt!97089)) (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))

(assert (= (and d!57085 res!92060) b!194862))

(assert (= (and b!194862 (not res!92061)) b!194863))

(declare-fun m!222139 () Bool)

(assert (=> d!57085 m!222139))

(declare-fun m!222141 () Bool)

(assert (=> d!57085 m!222141))

(declare-fun m!222143 () Bool)

(assert (=> b!194863 m!222143))

(assert (=> b!194545 d!57085))

(declare-fun d!57087 () Bool)

(assert (=> d!57087 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915))))

(declare-fun lt!97235 () Unit!5858)

(assert (=> d!57087 (= lt!97235 (choose!1077 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915))))

(declare-fun e!128171 () Bool)

(assert (=> d!57087 e!128171))

(declare-fun res!92062 () Bool)

(assert (=> d!57087 (=> (not res!92062) (not e!128171))))

(assert (=> d!57087 (= res!92062 (isStrictlySorted!344 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57087 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915) lt!97235)))

(declare-fun b!194864 () Bool)

(assert (=> b!194864 (= e!128171 (containsKey!249 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915))))

(assert (= (and d!57087 res!92062) b!194864))

(assert (=> d!57087 m!221275))

(assert (=> d!57087 m!221275))

(assert (=> d!57087 m!221277))

(declare-fun m!222145 () Bool)

(assert (=> d!57087 m!222145))

(declare-fun m!222147 () Bool)

(assert (=> d!57087 m!222147))

(assert (=> b!194864 m!221271))

(assert (=> b!194300 d!57087))

(declare-fun d!57089 () Bool)

(assert (=> d!57089 (= (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915)) (not (isEmpty!494 (getValueByKey!246 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915))))))

(declare-fun bs!7787 () Bool)

(assert (= bs!7787 d!57089))

(assert (=> bs!7787 m!221275))

(declare-fun m!222149 () Bool)

(assert (=> bs!7787 m!222149))

(assert (=> b!194300 d!57089))

(declare-fun b!194866 () Bool)

(declare-fun e!128172 () Option!252)

(declare-fun e!128173 () Option!252)

(assert (=> b!194866 (= e!128172 e!128173)))

(declare-fun c!35218 () Bool)

(assert (=> b!194866 (= c!35218 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))) (not (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))) lt!96915))))))

(declare-fun b!194868 () Bool)

(assert (=> b!194868 (= e!128173 None!250)))

(declare-fun c!35217 () Bool)

(declare-fun d!57091 () Bool)

(assert (=> d!57091 (= c!35217 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))) lt!96915)))))

(assert (=> d!57091 (= (getValueByKey!246 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!96915) e!128172)))

(declare-fun b!194867 () Bool)

(assert (=> b!194867 (= e!128173 (getValueByKey!246 (t!7326 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))) lt!96915))))

(declare-fun b!194865 () Bool)

(assert (=> b!194865 (= e!128172 (Some!251 (_2!1761 (h!3045 (toList!1226 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))))

(assert (= (and d!57091 c!35217) b!194865))

(assert (= (and d!57091 (not c!35217)) b!194866))

(assert (= (and b!194866 c!35218) b!194867))

(assert (= (and b!194866 (not c!35218)) b!194868))

(declare-fun m!222151 () Bool)

(assert (=> b!194867 m!222151))

(assert (=> b!194300 d!57091))

(assert (=> b!194415 d!56823))

(declare-fun d!57093 () Bool)

(assert (=> d!57093 (= (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871)) (not (isEmpty!494 (getValueByKey!246 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871))))))

(declare-fun bs!7788 () Bool)

(assert (= bs!7788 d!57093))

(assert (=> bs!7788 m!221629))

(declare-fun m!222153 () Bool)

(assert (=> bs!7788 m!222153))

(assert (=> b!194548 d!57093))

(declare-fun b!194870 () Bool)

(declare-fun e!128174 () Option!252)

(declare-fun e!128175 () Option!252)

(assert (=> b!194870 (= e!128174 e!128175)))

(declare-fun c!35220 () Bool)

(assert (=> b!194870 (= c!35220 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))) (not (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))) lt!96871))))))

(declare-fun b!194872 () Bool)

(assert (=> b!194872 (= e!128175 None!250)))

(declare-fun d!57095 () Bool)

(declare-fun c!35219 () Bool)

(assert (=> d!57095 (= c!35219 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))) lt!96871)))))

(assert (=> d!57095 (= (getValueByKey!246 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871) e!128174)))

(declare-fun b!194871 () Bool)

(assert (=> b!194871 (= e!128175 (getValueByKey!246 (t!7326 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))) lt!96871))))

(declare-fun b!194869 () Bool)

(assert (=> b!194869 (= e!128174 (Some!251 (_2!1761 (h!3045 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))))

(assert (= (and d!57095 c!35219) b!194869))

(assert (= (and d!57095 (not c!35219)) b!194870))

(assert (= (and b!194870 c!35220) b!194871))

(assert (= (and b!194870 (not c!35220)) b!194872))

(declare-fun m!222155 () Bool)

(assert (=> b!194871 m!222155))

(assert (=> b!194548 d!57095))

(declare-fun b!194873 () Bool)

(declare-fun e!128180 () SeekEntryResult!682)

(assert (=> b!194873 (= e!128180 (Intermediate!682 false (nextIndex!0 (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!194874 () Bool)

(declare-fun e!128178 () SeekEntryResult!682)

(assert (=> b!194874 (= e!128178 (Intermediate!682 true (nextIndex!0 (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!194875 () Bool)

(assert (=> b!194875 (= e!128180 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (mask!9222 thiss!1248)) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun b!194876 () Bool)

(declare-fun lt!97237 () SeekEntryResult!682)

(assert (=> b!194876 (and (bvsge (index!4900 lt!97237) #b00000000000000000000000000000000) (bvslt (index!4900 lt!97237) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun e!128176 () Bool)

(assert (=> b!194876 (= e!128176 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!97237)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!57097 () Bool)

(declare-fun e!128177 () Bool)

(assert (=> d!57097 e!128177))

(declare-fun c!35222 () Bool)

(assert (=> d!57097 (= c!35222 (and ((_ is Intermediate!682) lt!97237) (undefined!1494 lt!97237)))))

(assert (=> d!57097 (= lt!97237 e!128178)))

(declare-fun c!35221 () Bool)

(assert (=> d!57097 (= c!35221 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!97236 () (_ BitVec 64))

(assert (=> d!57097 (= lt!97236 (select (arr!3866 (_keys!5953 thiss!1248)) (nextIndex!0 (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9222 thiss!1248))))))

(assert (=> d!57097 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!57097 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9222 thiss!1248)) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) lt!97237)))

(declare-fun b!194877 () Bool)

(assert (=> b!194877 (= e!128178 e!128180)))

(declare-fun c!35223 () Bool)

(assert (=> b!194877 (= c!35223 (or (= lt!97236 key!828) (= (bvadd lt!97236 lt!97236) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194878 () Bool)

(assert (=> b!194878 (and (bvsge (index!4900 lt!97237) #b00000000000000000000000000000000) (bvslt (index!4900 lt!97237) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!92064 () Bool)

(assert (=> b!194878 (= res!92064 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!97237)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194878 (=> res!92064 e!128176)))

(declare-fun b!194879 () Bool)

(assert (=> b!194879 (= e!128177 (bvsge (x!20678 lt!97237) #b01111111111111111111111111111110))))

(declare-fun b!194880 () Bool)

(declare-fun e!128179 () Bool)

(assert (=> b!194880 (= e!128177 e!128179)))

(declare-fun res!92063 () Bool)

(assert (=> b!194880 (= res!92063 (and ((_ is Intermediate!682) lt!97237) (not (undefined!1494 lt!97237)) (bvslt (x!20678 lt!97237) #b01111111111111111111111111111110) (bvsge (x!20678 lt!97237) #b00000000000000000000000000000000) (bvsge (x!20678 lt!97237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194880 (=> (not res!92063) (not e!128179))))

(declare-fun b!194881 () Bool)

(assert (=> b!194881 (and (bvsge (index!4900 lt!97237) #b00000000000000000000000000000000) (bvslt (index!4900 lt!97237) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!92065 () Bool)

(assert (=> b!194881 (= res!92065 (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!97237)) key!828))))

(assert (=> b!194881 (=> res!92065 e!128176)))

(assert (=> b!194881 (= e!128179 e!128176)))

(assert (= (and d!57097 c!35221) b!194874))

(assert (= (and d!57097 (not c!35221)) b!194877))

(assert (= (and b!194877 c!35223) b!194873))

(assert (= (and b!194877 (not c!35223)) b!194875))

(assert (= (and d!57097 c!35222) b!194879))

(assert (= (and d!57097 (not c!35222)) b!194880))

(assert (= (and b!194880 res!92063) b!194881))

(assert (= (and b!194881 (not res!92065)) b!194878))

(assert (= (and b!194878 (not res!92064)) b!194876))

(declare-fun m!222157 () Bool)

(assert (=> b!194876 m!222157))

(assert (=> b!194881 m!222157))

(assert (=> d!57097 m!221553))

(declare-fun m!222159 () Bool)

(assert (=> d!57097 m!222159))

(assert (=> d!57097 m!221011))

(assert (=> b!194875 m!221553))

(declare-fun m!222161 () Bool)

(assert (=> b!194875 m!222161))

(assert (=> b!194875 m!222161))

(declare-fun m!222163 () Bool)

(assert (=> b!194875 m!222163))

(assert (=> b!194878 m!222157))

(assert (=> b!194511 d!57097))

(declare-fun d!57099 () Bool)

(declare-fun lt!97240 () (_ BitVec 32))

(assert (=> d!57099 (and (bvsge lt!97240 #b00000000000000000000000000000000) (bvslt lt!97240 (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57099 (= lt!97240 (choose!52 (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9222 thiss!1248)))))

(assert (=> d!57099 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!57099 (= (nextIndex!0 (toIndex!0 key!828 (mask!9222 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9222 thiss!1248)) lt!97240)))

(declare-fun bs!7789 () Bool)

(assert (= bs!7789 d!57099))

(assert (=> bs!7789 m!221023))

(declare-fun m!222165 () Bool)

(assert (=> bs!7789 m!222165))

(assert (=> bs!7789 m!221011))

(assert (=> b!194511 d!57099))

(declare-fun d!57101 () Bool)

(assert (=> d!57101 (= (size!4196 thiss!1248) (bvadd (_size!1404 thiss!1248) (bvsdiv (bvadd (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!194324 d!57101))

(declare-fun d!57103 () Bool)

(assert (=> d!57103 (= (get!2246 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194474 d!57103))

(assert (=> b!194682 d!56797))

(declare-fun d!57105 () Bool)

(assert (=> d!57105 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96927) (_1!1761 lt!96690)))))

(declare-fun lt!97241 () Unit!5858)

(assert (=> d!57105 (= lt!97241 (choose!1077 (toList!1226 lt!96927) (_1!1761 lt!96690)))))

(declare-fun e!128181 () Bool)

(assert (=> d!57105 e!128181))

(declare-fun res!92066 () Bool)

(assert (=> d!57105 (=> (not res!92066) (not e!128181))))

(assert (=> d!57105 (= res!92066 (isStrictlySorted!344 (toList!1226 lt!96927)))))

(assert (=> d!57105 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96927) (_1!1761 lt!96690)) lt!97241)))

(declare-fun b!194882 () Bool)

(assert (=> b!194882 (= e!128181 (containsKey!249 (toList!1226 lt!96927) (_1!1761 lt!96690)))))

(assert (= (and d!57105 res!92066) b!194882))

(assert (=> d!57105 m!221205))

(assert (=> d!57105 m!221205))

(assert (=> d!57105 m!221831))

(declare-fun m!222167 () Bool)

(assert (=> d!57105 m!222167))

(declare-fun m!222169 () Bool)

(assert (=> d!57105 m!222169))

(assert (=> b!194882 m!221827))

(assert (=> b!194663 d!57105))

(assert (=> b!194663 d!56969))

(assert (=> b!194663 d!56883))

(declare-fun d!57107 () Bool)

(assert (=> d!57107 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!4257 (getValueByKey!246 (toList!1226 lt!96864) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56887 d!57107))

(assert (=> d!56887 d!56963))

(declare-fun d!57109 () Bool)

(declare-fun e!128182 () Bool)

(assert (=> d!57109 e!128182))

(declare-fun res!92068 () Bool)

(assert (=> d!57109 (=> (not res!92068) (not e!128182))))

(declare-fun lt!97242 () ListLongMap!2421)

(assert (=> d!57109 (= res!92068 (contains!1363 lt!97242 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))))))

(declare-fun lt!97244 () List!2408)

(assert (=> d!57109 (= lt!97242 (ListLongMap!2422 lt!97244))))

(declare-fun lt!97245 () Unit!5858)

(declare-fun lt!97243 () Unit!5858)

(assert (=> d!57109 (= lt!97245 lt!97243)))

(assert (=> d!57109 (= (getValueByKey!246 lt!97244 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))))))

(assert (=> d!57109 (= lt!97243 (lemmaContainsTupThenGetReturnValue!133 lt!97244 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))))))

(assert (=> d!57109 (= lt!97244 (insertStrictlySorted!136 (toList!1226 call!19663) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))))))

(assert (=> d!57109 (= (+!319 call!19663 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))) lt!97242)))

(declare-fun b!194883 () Bool)

(declare-fun res!92067 () Bool)

(assert (=> b!194883 (=> (not res!92067) (not e!128182))))

(assert (=> b!194883 (= res!92067 (= (getValueByKey!246 (toList!1226 lt!97242) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))))))

(declare-fun b!194884 () Bool)

(assert (=> b!194884 (= e!128182 (contains!1365 (toList!1226 lt!97242) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))))

(assert (= (and d!57109 res!92068) b!194883))

(assert (= (and b!194883 res!92067) b!194884))

(declare-fun m!222171 () Bool)

(assert (=> d!57109 m!222171))

(declare-fun m!222173 () Bool)

(assert (=> d!57109 m!222173))

(declare-fun m!222175 () Bool)

(assert (=> d!57109 m!222175))

(declare-fun m!222177 () Bool)

(assert (=> d!57109 m!222177))

(declare-fun m!222179 () Bool)

(assert (=> b!194883 m!222179))

(declare-fun m!222181 () Bool)

(assert (=> b!194884 m!222181))

(assert (=> b!194603 d!57109))

(declare-fun b!194886 () Bool)

(declare-fun e!128183 () Option!252)

(declare-fun e!128184 () Option!252)

(assert (=> b!194886 (= e!128183 e!128184)))

(declare-fun c!35225 () Bool)

(assert (=> b!194886 (= c!35225 (and ((_ is Cons!2404) (toList!1226 lt!96970)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96970))) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194888 () Bool)

(assert (=> b!194888 (= e!128184 None!250)))

(declare-fun d!57111 () Bool)

(declare-fun c!35224 () Bool)

(assert (=> d!57111 (= c!35224 (and ((_ is Cons!2404) (toList!1226 lt!96970)) (= (_1!1761 (h!3045 (toList!1226 lt!96970))) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57111 (= (getValueByKey!246 (toList!1226 lt!96970) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) e!128183)))

(declare-fun b!194887 () Bool)

(assert (=> b!194887 (= e!128184 (getValueByKey!246 (t!7326 (toList!1226 lt!96970)) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194885 () Bool)

(assert (=> b!194885 (= e!128183 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96970)))))))

(assert (= (and d!57111 c!35224) b!194885))

(assert (= (and d!57111 (not c!35224)) b!194886))

(assert (= (and b!194886 c!35225) b!194887))

(assert (= (and b!194886 (not c!35225)) b!194888))

(declare-fun m!222183 () Bool)

(assert (=> b!194887 m!222183))

(assert (=> b!194308 d!57111))

(declare-fun d!57113 () Bool)

(declare-fun e!128185 () Bool)

(assert (=> d!57113 e!128185))

(declare-fun res!92070 () Bool)

(assert (=> d!57113 (=> (not res!92070) (not e!128185))))

(declare-fun lt!97246 () ListLongMap!2421)

(assert (=> d!57113 (= res!92070 (contains!1363 lt!97246 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97248 () List!2408)

(assert (=> d!57113 (= lt!97246 (ListLongMap!2422 lt!97248))))

(declare-fun lt!97249 () Unit!5858)

(declare-fun lt!97247 () Unit!5858)

(assert (=> d!57113 (= lt!97249 lt!97247)))

(assert (=> d!57113 (= (getValueByKey!246 lt!97248 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57113 (= lt!97247 (lemmaContainsTupThenGetReturnValue!133 lt!97248 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57113 (= lt!97248 (insertStrictlySorted!136 (toList!1226 call!19649) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57113 (= (+!319 call!19649 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!97246)))

(declare-fun b!194889 () Bool)

(declare-fun res!92069 () Bool)

(assert (=> b!194889 (=> (not res!92069) (not e!128185))))

(assert (=> b!194889 (= res!92069 (= (getValueByKey!246 (toList!1226 lt!97246) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194890 () Bool)

(assert (=> b!194890 (= e!128185 (contains!1365 (toList!1226 lt!97246) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!57113 res!92070) b!194889))

(assert (= (and b!194889 res!92069) b!194890))

(declare-fun m!222185 () Bool)

(assert (=> d!57113 m!222185))

(declare-fun m!222187 () Bool)

(assert (=> d!57113 m!222187))

(declare-fun m!222189 () Bool)

(assert (=> d!57113 m!222189))

(declare-fun m!222191 () Bool)

(assert (=> d!57113 m!222191))

(declare-fun m!222193 () Bool)

(assert (=> b!194889 m!222193))

(declare-fun m!222195 () Bool)

(assert (=> b!194890 m!222195))

(assert (=> b!194456 d!57113))

(assert (=> d!56895 d!56897))

(assert (=> d!56895 d!56899))

(declare-fun d!57115 () Bool)

(assert (=> d!57115 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (=> d!57115 true))

(declare-fun _$12!449 () Unit!5858)

(assert (=> d!57115 (= (choose!1077 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) _$12!449)))

(declare-fun bs!7790 () Bool)

(assert (= bs!7790 d!57115))

(assert (=> bs!7790 m!220871))

(assert (=> bs!7790 m!221119))

(assert (=> bs!7790 m!221119))

(assert (=> bs!7790 m!221121))

(assert (=> d!56895 d!57115))

(declare-fun d!57117 () Bool)

(declare-fun res!92071 () Bool)

(declare-fun e!128186 () Bool)

(assert (=> d!57117 (=> res!92071 e!128186)))

(assert (=> d!57117 (= res!92071 (or ((_ is Nil!2405) (toList!1226 lt!96701)) ((_ is Nil!2405) (t!7326 (toList!1226 lt!96701)))))))

(assert (=> d!57117 (= (isStrictlySorted!344 (toList!1226 lt!96701)) e!128186)))

(declare-fun b!194891 () Bool)

(declare-fun e!128187 () Bool)

(assert (=> b!194891 (= e!128186 e!128187)))

(declare-fun res!92072 () Bool)

(assert (=> b!194891 (=> (not res!92072) (not e!128187))))

(assert (=> b!194891 (= res!92072 (bvslt (_1!1761 (h!3045 (toList!1226 lt!96701))) (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96701))))))))

(declare-fun b!194892 () Bool)

(assert (=> b!194892 (= e!128187 (isStrictlySorted!344 (t!7326 (toList!1226 lt!96701))))))

(assert (= (and d!57117 (not res!92071)) b!194891))

(assert (= (and b!194891 res!92072) b!194892))

(declare-fun m!222197 () Bool)

(assert (=> b!194892 m!222197))

(assert (=> d!56895 d!57117))

(assert (=> b!194659 d!56965))

(declare-fun lt!97250 () Bool)

(declare-fun d!57119 () Bool)

(assert (=> d!57119 (= lt!97250 (select (content!156 (toList!1226 lt!97075)) (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))

(declare-fun e!128189 () Bool)

(assert (=> d!57119 (= lt!97250 e!128189)))

(declare-fun res!92073 () Bool)

(assert (=> d!57119 (=> (not res!92073) (not e!128189))))

(assert (=> d!57119 (= res!92073 ((_ is Cons!2404) (toList!1226 lt!97075)))))

(assert (=> d!57119 (= (contains!1365 (toList!1226 lt!97075) (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) lt!97250)))

(declare-fun b!194893 () Bool)

(declare-fun e!128188 () Bool)

(assert (=> b!194893 (= e!128189 e!128188)))

(declare-fun res!92074 () Bool)

(assert (=> b!194893 (=> res!92074 e!128188)))

(assert (=> b!194893 (= res!92074 (= (h!3045 (toList!1226 lt!97075)) (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))

(declare-fun b!194894 () Bool)

(assert (=> b!194894 (= e!128188 (contains!1365 (t!7326 (toList!1226 lt!97075)) (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))

(assert (= (and d!57119 res!92073) b!194893))

(assert (= (and b!194893 (not res!92074)) b!194894))

(declare-fun m!222199 () Bool)

(assert (=> d!57119 m!222199))

(declare-fun m!222201 () Bool)

(assert (=> d!57119 m!222201))

(declare-fun m!222203 () Bool)

(assert (=> b!194894 m!222203))

(assert (=> b!194538 d!57119))

(declare-fun d!57121 () Bool)

(assert (=> d!57121 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!97251 () Unit!5858)

(assert (=> d!57121 (= lt!97251 (choose!1077 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128190 () Bool)

(assert (=> d!57121 e!128190))

(declare-fun res!92075 () Bool)

(assert (=> d!57121 (=> (not res!92075) (not e!128190))))

(assert (=> d!57121 (= res!92075 (isStrictlySorted!344 (toList!1226 lt!96908)))))

(assert (=> d!57121 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) lt!97251)))

(declare-fun b!194895 () Bool)

(assert (=> b!194895 (= e!128190 (containsKey!249 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57121 res!92075) b!194895))

(assert (=> d!57121 m!221041))

(assert (=> d!57121 m!221519))

(assert (=> d!57121 m!221519))

(assert (=> d!57121 m!221665))

(assert (=> d!57121 m!221041))

(declare-fun m!222205 () Bool)

(assert (=> d!57121 m!222205))

(assert (=> d!57121 m!221913))

(assert (=> b!194895 m!221041))

(assert (=> b!194895 m!221661))

(assert (=> b!194551 d!57121))

(assert (=> b!194551 d!57049))

(assert (=> b!194551 d!57011))

(declare-fun d!57123 () Bool)

(assert (=> d!57123 (= (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) lt!96856)) (v!4257 (getValueByKey!246 (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) lt!96856)))))

(assert (=> d!56877 d!57123))

(declare-fun b!194897 () Bool)

(declare-fun e!128191 () Option!252)

(declare-fun e!128192 () Option!252)

(assert (=> b!194897 (= e!128191 e!128192)))

(declare-fun c!35227 () Bool)

(assert (=> b!194897 (= c!35227 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))) (not (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))) lt!96856))))))

(declare-fun b!194899 () Bool)

(assert (=> b!194899 (= e!128192 None!250)))

(declare-fun d!57125 () Bool)

(declare-fun c!35226 () Bool)

(assert (=> d!57125 (= c!35226 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))) lt!96856)))))

(assert (=> d!57125 (= (getValueByKey!246 (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) lt!96856) e!128191)))

(declare-fun b!194898 () Bool)

(assert (=> b!194898 (= e!128192 (getValueByKey!246 (t!7326 (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))) lt!96856))))

(declare-fun b!194896 () Bool)

(assert (=> b!194896 (= e!128191 (Some!251 (_2!1761 (h!3045 (toList!1226 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))))

(assert (= (and d!57125 c!35226) b!194896))

(assert (= (and d!57125 (not c!35226)) b!194897))

(assert (= (and b!194897 c!35227) b!194898))

(assert (= (and b!194897 (not c!35227)) b!194899))

(declare-fun m!222207 () Bool)

(assert (=> b!194898 m!222207))

(assert (=> d!56877 d!57125))

(declare-fun b!194901 () Bool)

(declare-fun e!128193 () Option!252)

(declare-fun e!128194 () Option!252)

(assert (=> b!194901 (= e!128193 e!128194)))

(declare-fun c!35229 () Bool)

(assert (=> b!194901 (= c!35229 (and ((_ is Cons!2404) (toList!1226 lt!97089)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97089))) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194903 () Bool)

(assert (=> b!194903 (= e!128194 None!250)))

(declare-fun d!57127 () Bool)

(declare-fun c!35228 () Bool)

(assert (=> d!57127 (= c!35228 (and ((_ is Cons!2404) (toList!1226 lt!97089)) (= (_1!1761 (h!3045 (toList!1226 lt!97089))) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))

(assert (=> d!57127 (= (getValueByKey!246 (toList!1226 lt!97089) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) e!128193)))

(declare-fun b!194902 () Bool)

(assert (=> b!194902 (= e!128194 (getValueByKey!246 (t!7326 (toList!1226 lt!97089)) (_1!1761 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))))

(declare-fun b!194900 () Bool)

(assert (=> b!194900 (= e!128193 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97089)))))))

(assert (= (and d!57127 c!35228) b!194900))

(assert (= (and d!57127 (not c!35228)) b!194901))

(assert (= (and b!194901 c!35229) b!194902))

(assert (= (and b!194901 (not c!35229)) b!194903))

(declare-fun m!222209 () Bool)

(assert (=> b!194902 m!222209))

(assert (=> b!194544 d!57127))

(declare-fun d!57129 () Bool)

(declare-fun e!128196 () Bool)

(assert (=> d!57129 e!128196))

(declare-fun res!92076 () Bool)

(assert (=> d!57129 (=> res!92076 e!128196)))

(declare-fun lt!97253 () Bool)

(assert (=> d!57129 (= res!92076 (not lt!97253))))

(declare-fun lt!97255 () Bool)

(assert (=> d!57129 (= lt!97253 lt!97255)))

(declare-fun lt!97252 () Unit!5858)

(declare-fun e!128195 () Unit!5858)

(assert (=> d!57129 (= lt!97252 e!128195)))

(declare-fun c!35230 () Bool)

(assert (=> d!57129 (= c!35230 lt!97255)))

(assert (=> d!57129 (= lt!97255 (containsKey!249 (toList!1226 lt!96970) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57129 (= (contains!1363 lt!96970 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!97253)))

(declare-fun b!194904 () Bool)

(declare-fun lt!97254 () Unit!5858)

(assert (=> b!194904 (= e!128195 lt!97254)))

(assert (=> b!194904 (= lt!97254 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96970) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(assert (=> b!194904 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96970) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194905 () Bool)

(declare-fun Unit!5887 () Unit!5858)

(assert (=> b!194905 (= e!128195 Unit!5887)))

(declare-fun b!194906 () Bool)

(assert (=> b!194906 (= e!128196 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96970) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57129 c!35230) b!194904))

(assert (= (and d!57129 (not c!35230)) b!194905))

(assert (= (and d!57129 (not res!92076)) b!194906))

(declare-fun m!222211 () Bool)

(assert (=> d!57129 m!222211))

(declare-fun m!222213 () Bool)

(assert (=> b!194904 m!222213))

(assert (=> b!194904 m!221303))

(assert (=> b!194904 m!221303))

(declare-fun m!222215 () Bool)

(assert (=> b!194904 m!222215))

(assert (=> b!194906 m!221303))

(assert (=> b!194906 m!221303))

(assert (=> b!194906 m!222215))

(assert (=> d!56771 d!57129))

(declare-fun b!194908 () Bool)

(declare-fun e!128197 () Option!252)

(declare-fun e!128198 () Option!252)

(assert (=> b!194908 (= e!128197 e!128198)))

(declare-fun c!35232 () Bool)

(assert (=> b!194908 (= c!35232 (and ((_ is Cons!2404) lt!96972) (not (= (_1!1761 (h!3045 lt!96972)) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194910 () Bool)

(assert (=> b!194910 (= e!128198 None!250)))

(declare-fun c!35231 () Bool)

(declare-fun d!57131 () Bool)

(assert (=> d!57131 (= c!35231 (and ((_ is Cons!2404) lt!96972) (= (_1!1761 (h!3045 lt!96972)) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57131 (= (getValueByKey!246 lt!96972 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) e!128197)))

(declare-fun b!194909 () Bool)

(assert (=> b!194909 (= e!128198 (getValueByKey!246 (t!7326 lt!96972) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194907 () Bool)

(assert (=> b!194907 (= e!128197 (Some!251 (_2!1761 (h!3045 lt!96972))))))

(assert (= (and d!57131 c!35231) b!194907))

(assert (= (and d!57131 (not c!35231)) b!194908))

(assert (= (and b!194908 c!35232) b!194909))

(assert (= (and b!194908 (not c!35232)) b!194910))

(declare-fun m!222217 () Bool)

(assert (=> b!194909 m!222217))

(assert (=> d!56771 d!57131))

(declare-fun d!57133 () Bool)

(assert (=> d!57133 (= (getValueByKey!246 lt!96972 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97256 () Unit!5858)

(assert (=> d!57133 (= lt!97256 (choose!1076 lt!96972 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun e!128199 () Bool)

(assert (=> d!57133 e!128199))

(declare-fun res!92077 () Bool)

(assert (=> d!57133 (=> (not res!92077) (not e!128199))))

(assert (=> d!57133 (= res!92077 (isStrictlySorted!344 lt!96972))))

(assert (=> d!57133 (= (lemmaContainsTupThenGetReturnValue!133 lt!96972 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!97256)))

(declare-fun b!194911 () Bool)

(declare-fun res!92078 () Bool)

(assert (=> b!194911 (=> (not res!92078) (not e!128199))))

(assert (=> b!194911 (= res!92078 (containsKey!249 lt!96972 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194912 () Bool)

(assert (=> b!194912 (= e!128199 (contains!1365 lt!96972 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57133 res!92077) b!194911))

(assert (= (and b!194911 res!92078) b!194912))

(assert (=> d!57133 m!221297))

(declare-fun m!222219 () Bool)

(assert (=> d!57133 m!222219))

(declare-fun m!222221 () Bool)

(assert (=> d!57133 m!222221))

(declare-fun m!222223 () Bool)

(assert (=> b!194911 m!222223))

(declare-fun m!222225 () Bool)

(assert (=> b!194912 m!222225))

(assert (=> d!56771 d!57133))

(declare-fun lt!97257 () List!2408)

(declare-fun b!194913 () Bool)

(declare-fun e!128201 () Bool)

(assert (=> b!194913 (= e!128201 (contains!1365 lt!97257 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(declare-fun bm!19683 () Bool)

(declare-fun call!19688 () List!2408)

(declare-fun call!19686 () List!2408)

(assert (=> bm!19683 (= call!19688 call!19686)))

(declare-fun b!194914 () Bool)

(declare-fun e!128200 () List!2408)

(assert (=> b!194914 (= e!128200 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96917)) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194915 () Bool)

(declare-fun e!128204 () List!2408)

(declare-fun call!19687 () List!2408)

(assert (=> b!194915 (= e!128204 call!19687)))

(declare-fun b!194916 () Bool)

(declare-fun res!92079 () Bool)

(assert (=> b!194916 (=> (not res!92079) (not e!128201))))

(assert (=> b!194916 (= res!92079 (containsKey!249 lt!97257 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))

(declare-fun bm!19684 () Bool)

(assert (=> bm!19684 (= call!19687 call!19688)))

(declare-fun c!35235 () Bool)

(declare-fun b!194917 () Bool)

(assert (=> b!194917 (= c!35235 (and ((_ is Cons!2404) (toList!1226 lt!96917)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96917))) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128203 () List!2408)

(assert (=> b!194917 (= e!128203 e!128204)))

(declare-fun b!194918 () Bool)

(assert (=> b!194918 (= e!128203 call!19688)))

(declare-fun b!194919 () Bool)

(declare-fun e!128202 () List!2408)

(assert (=> b!194919 (= e!128202 e!128203)))

(declare-fun c!35233 () Bool)

(assert (=> b!194919 (= c!35233 (and ((_ is Cons!2404) (toList!1226 lt!96917)) (= (_1!1761 (h!3045 (toList!1226 lt!96917))) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194921 () Bool)

(assert (=> b!194921 (= e!128204 call!19687)))

(declare-fun c!35236 () Bool)

(declare-fun bm!19685 () Bool)

(assert (=> bm!19685 (= call!19686 ($colon$colon!102 e!128200 (ite c!35236 (h!3045 (toList!1226 lt!96917)) (tuple2!3501 (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))))))))

(declare-fun c!35234 () Bool)

(assert (=> bm!19685 (= c!35234 c!35236)))

(declare-fun b!194922 () Bool)

(assert (=> b!194922 (= e!128202 call!19686)))

(declare-fun b!194920 () Bool)

(assert (=> b!194920 (= e!128200 (ite c!35233 (t!7326 (toList!1226 lt!96917)) (ite c!35235 (Cons!2404 (h!3045 (toList!1226 lt!96917)) (t!7326 (toList!1226 lt!96917))) Nil!2405)))))

(declare-fun d!57135 () Bool)

(assert (=> d!57135 e!128201))

(declare-fun res!92080 () Bool)

(assert (=> d!57135 (=> (not res!92080) (not e!128201))))

(assert (=> d!57135 (= res!92080 (isStrictlySorted!344 lt!97257))))

(assert (=> d!57135 (= lt!97257 e!128202)))

(assert (=> d!57135 (= c!35236 (and ((_ is Cons!2404) (toList!1226 lt!96917)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96917))) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57135 (isStrictlySorted!344 (toList!1226 lt!96917))))

(assert (=> d!57135 (= (insertStrictlySorted!136 (toList!1226 lt!96917) (_1!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248)))) lt!97257)))

(assert (= (and d!57135 c!35236) b!194922))

(assert (= (and d!57135 (not c!35236)) b!194919))

(assert (= (and b!194919 c!35233) b!194918))

(assert (= (and b!194919 (not c!35233)) b!194917))

(assert (= (and b!194917 c!35235) b!194921))

(assert (= (and b!194917 (not c!35235)) b!194915))

(assert (= (or b!194921 b!194915) bm!19684))

(assert (= (or b!194918 bm!19684) bm!19683))

(assert (= (or b!194922 bm!19683) bm!19685))

(assert (= (and bm!19685 c!35234) b!194914))

(assert (= (and bm!19685 (not c!35234)) b!194920))

(assert (= (and d!57135 res!92080) b!194916))

(assert (= (and b!194916 res!92079) b!194913))

(declare-fun m!222227 () Bool)

(assert (=> b!194916 m!222227))

(declare-fun m!222229 () Bool)

(assert (=> b!194914 m!222229))

(declare-fun m!222231 () Bool)

(assert (=> bm!19685 m!222231))

(declare-fun m!222233 () Bool)

(assert (=> b!194913 m!222233))

(declare-fun m!222235 () Bool)

(assert (=> d!57135 m!222235))

(declare-fun m!222237 () Bool)

(assert (=> d!57135 m!222237))

(assert (=> d!56771 d!57135))

(declare-fun d!57137 () Bool)

(assert (=> d!57137 (= (apply!188 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))) lt!96870) (apply!188 lt!96876 lt!96870))))

(assert (=> d!57137 true))

(declare-fun _$34!1091 () Unit!5858)

(assert (=> d!57137 (= (choose!1074 lt!96876 lt!96868 (minValue!3800 thiss!1248) lt!96870) _$34!1091)))

(declare-fun bs!7791 () Bool)

(assert (= bs!7791 d!57137))

(assert (=> bs!7791 m!221067))

(assert (=> bs!7791 m!221067))

(assert (=> bs!7791 m!221069))

(assert (=> bs!7791 m!221087))

(assert (=> d!56873 d!57137))

(assert (=> d!56873 d!56869))

(declare-fun d!57139 () Bool)

(declare-fun e!128206 () Bool)

(assert (=> d!57139 e!128206))

(declare-fun res!92081 () Bool)

(assert (=> d!57139 (=> res!92081 e!128206)))

(declare-fun lt!97259 () Bool)

(assert (=> d!57139 (= res!92081 (not lt!97259))))

(declare-fun lt!97261 () Bool)

(assert (=> d!57139 (= lt!97259 lt!97261)))

(declare-fun lt!97258 () Unit!5858)

(declare-fun e!128205 () Unit!5858)

(assert (=> d!57139 (= lt!97258 e!128205)))

(declare-fun c!35237 () Bool)

(assert (=> d!57139 (= c!35237 lt!97261)))

(assert (=> d!57139 (= lt!97261 (containsKey!249 (toList!1226 lt!96876) lt!96870))))

(assert (=> d!57139 (= (contains!1363 lt!96876 lt!96870) lt!97259)))

(declare-fun b!194923 () Bool)

(declare-fun lt!97260 () Unit!5858)

(assert (=> b!194923 (= e!128205 lt!97260)))

(assert (=> b!194923 (= lt!97260 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96876) lt!96870))))

(assert (=> b!194923 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96876) lt!96870))))

(declare-fun b!194924 () Bool)

(declare-fun Unit!5888 () Unit!5858)

(assert (=> b!194924 (= e!128205 Unit!5888)))

(declare-fun b!194925 () Bool)

(assert (=> b!194925 (= e!128206 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96876) lt!96870)))))

(assert (= (and d!57139 c!35237) b!194923))

(assert (= (and d!57139 (not c!35237)) b!194924))

(assert (= (and d!57139 (not res!92081)) b!194925))

(declare-fun m!222239 () Bool)

(assert (=> d!57139 m!222239))

(declare-fun m!222241 () Bool)

(assert (=> b!194923 m!222241))

(assert (=> b!194923 m!221653))

(assert (=> b!194923 m!221653))

(declare-fun m!222243 () Bool)

(assert (=> b!194923 m!222243))

(assert (=> b!194925 m!221653))

(assert (=> b!194925 m!221653))

(assert (=> b!194925 m!222243))

(assert (=> d!56873 d!57139))

(assert (=> d!56873 d!56875))

(assert (=> d!56873 d!56861))

(declare-fun b!194927 () Bool)

(declare-fun e!128207 () Option!252)

(declare-fun e!128208 () Option!252)

(assert (=> b!194927 (= e!128207 e!128208)))

(declare-fun c!35239 () Bool)

(assert (=> b!194927 (= c!35239 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96701))) (not (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96701)))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))))

(declare-fun b!194929 () Bool)

(assert (=> b!194929 (= e!128208 None!250)))

(declare-fun d!57141 () Bool)

(declare-fun c!35238 () Bool)

(assert (=> d!57141 (= c!35238 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96701))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96701)))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(assert (=> d!57141 (= (getValueByKey!246 (t!7326 (toList!1226 lt!96701)) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) e!128207)))

(declare-fun b!194928 () Bool)

(assert (=> b!194928 (= e!128208 (getValueByKey!246 (t!7326 (t!7326 (toList!1226 lt!96701))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(declare-fun b!194926 () Bool)

(assert (=> b!194926 (= e!128207 (Some!251 (_2!1761 (h!3045 (t!7326 (toList!1226 lt!96701))))))))

(assert (= (and d!57141 c!35238) b!194926))

(assert (= (and d!57141 (not c!35238)) b!194927))

(assert (= (and b!194927 c!35239) b!194928))

(assert (= (and b!194927 (not c!35239)) b!194929))

(assert (=> b!194928 m!220871))

(declare-fun m!222245 () Bool)

(assert (=> b!194928 m!222245))

(assert (=> b!194583 d!57141))

(declare-fun d!57143 () Bool)

(declare-fun e!128209 () Bool)

(assert (=> d!57143 e!128209))

(declare-fun res!92083 () Bool)

(assert (=> d!57143 (=> (not res!92083) (not e!128209))))

(declare-fun lt!97262 () ListLongMap!2421)

(assert (=> d!57143 (= res!92083 (contains!1363 lt!97262 (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!97264 () List!2408)

(assert (=> d!57143 (= lt!97262 (ListLongMap!2422 lt!97264))))

(declare-fun lt!97265 () Unit!5858)

(declare-fun lt!97263 () Unit!5858)

(assert (=> d!57143 (= lt!97265 lt!97263)))

(assert (=> d!57143 (= (getValueByKey!246 lt!97264 (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!251 (_2!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57143 (= lt!97263 (lemmaContainsTupThenGetReturnValue!133 lt!97264 (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57143 (= lt!97264 (insertStrictlySorted!136 (toList!1226 call!19644) (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57143 (= (+!319 call!19644 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!97262)))

(declare-fun b!194930 () Bool)

(declare-fun res!92082 () Bool)

(assert (=> b!194930 (=> (not res!92082) (not e!128209))))

(assert (=> b!194930 (= res!92082 (= (getValueByKey!246 (toList!1226 lt!97262) (_1!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!251 (_2!1761 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!194931 () Bool)

(assert (=> b!194931 (= e!128209 (contains!1365 (toList!1226 lt!97262) (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (get!2243 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!57143 res!92083) b!194930))

(assert (= (and b!194930 res!92082) b!194931))

(declare-fun m!222247 () Bool)

(assert (=> d!57143 m!222247))

(declare-fun m!222249 () Bool)

(assert (=> d!57143 m!222249))

(declare-fun m!222251 () Bool)

(assert (=> d!57143 m!222251))

(declare-fun m!222253 () Bool)

(assert (=> d!57143 m!222253))

(declare-fun m!222255 () Bool)

(assert (=> b!194930 m!222255))

(declare-fun m!222257 () Bool)

(assert (=> b!194931 m!222257))

(assert (=> b!194398 d!57143))

(declare-fun d!57145 () Bool)

(declare-fun e!128211 () Bool)

(assert (=> d!57145 e!128211))

(declare-fun res!92084 () Bool)

(assert (=> d!57145 (=> res!92084 e!128211)))

(declare-fun lt!97267 () Bool)

(assert (=> d!57145 (= res!92084 (not lt!97267))))

(declare-fun lt!97269 () Bool)

(assert (=> d!57145 (= lt!97267 lt!97269)))

(declare-fun lt!97266 () Unit!5858)

(declare-fun e!128210 () Unit!5858)

(assert (=> d!57145 (= lt!97266 e!128210)))

(declare-fun c!35240 () Bool)

(assert (=> d!57145 (= c!35240 lt!97269)))

(assert (=> d!57145 (= lt!97269 (containsKey!249 (toList!1226 (+!319 lt!97001 (tuple2!3501 lt!97000 lt!96997))) lt!96999))))

(assert (=> d!57145 (= (contains!1363 (+!319 lt!97001 (tuple2!3501 lt!97000 lt!96997)) lt!96999) lt!97267)))

(declare-fun b!194932 () Bool)

(declare-fun lt!97268 () Unit!5858)

(assert (=> b!194932 (= e!128210 lt!97268)))

(assert (=> b!194932 (= lt!97268 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (+!319 lt!97001 (tuple2!3501 lt!97000 lt!96997))) lt!96999))))

(assert (=> b!194932 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!97001 (tuple2!3501 lt!97000 lt!96997))) lt!96999))))

(declare-fun b!194933 () Bool)

(declare-fun Unit!5889 () Unit!5858)

(assert (=> b!194933 (= e!128210 Unit!5889)))

(declare-fun b!194934 () Bool)

(assert (=> b!194934 (= e!128211 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!97001 (tuple2!3501 lt!97000 lt!96997))) lt!96999)))))

(assert (= (and d!57145 c!35240) b!194932))

(assert (= (and d!57145 (not c!35240)) b!194933))

(assert (= (and d!57145 (not res!92084)) b!194934))

(declare-fun m!222259 () Bool)

(assert (=> d!57145 m!222259))

(declare-fun m!222261 () Bool)

(assert (=> b!194932 m!222261))

(declare-fun m!222263 () Bool)

(assert (=> b!194932 m!222263))

(assert (=> b!194932 m!222263))

(declare-fun m!222265 () Bool)

(assert (=> b!194932 m!222265))

(assert (=> b!194934 m!222263))

(assert (=> b!194934 m!222263))

(assert (=> b!194934 m!222265))

(assert (=> b!194398 d!57145))

(declare-fun d!57147 () Bool)

(assert (=> d!57147 (not (contains!1363 (+!319 lt!97001 (tuple2!3501 lt!97000 lt!96997)) lt!96999))))

(declare-fun lt!97270 () Unit!5858)

(assert (=> d!57147 (= lt!97270 (choose!1078 lt!97001 lt!97000 lt!96997 lt!96999))))

(declare-fun e!128212 () Bool)

(assert (=> d!57147 e!128212))

(declare-fun res!92085 () Bool)

(assert (=> d!57147 (=> (not res!92085) (not e!128212))))

(assert (=> d!57147 (= res!92085 (not (contains!1363 lt!97001 lt!96999)))))

(assert (=> d!57147 (= (addStillNotContains!99 lt!97001 lt!97000 lt!96997 lt!96999) lt!97270)))

(declare-fun b!194935 () Bool)

(assert (=> b!194935 (= e!128212 (not (= lt!97000 lt!96999)))))

(assert (= (and d!57147 res!92085) b!194935))

(assert (=> d!57147 m!221391))

(assert (=> d!57147 m!221391))

(assert (=> d!57147 m!221393))

(declare-fun m!222267 () Bool)

(assert (=> d!57147 m!222267))

(declare-fun m!222269 () Bool)

(assert (=> d!57147 m!222269))

(assert (=> b!194398 d!57147))

(assert (=> b!194398 d!56921))

(declare-fun d!57149 () Bool)

(declare-fun e!128213 () Bool)

(assert (=> d!57149 e!128213))

(declare-fun res!92087 () Bool)

(assert (=> d!57149 (=> (not res!92087) (not e!128213))))

(declare-fun lt!97271 () ListLongMap!2421)

(assert (=> d!57149 (= res!92087 (contains!1363 lt!97271 (_1!1761 (tuple2!3501 lt!97000 lt!96997))))))

(declare-fun lt!97273 () List!2408)

(assert (=> d!57149 (= lt!97271 (ListLongMap!2422 lt!97273))))

(declare-fun lt!97274 () Unit!5858)

(declare-fun lt!97272 () Unit!5858)

(assert (=> d!57149 (= lt!97274 lt!97272)))

(assert (=> d!57149 (= (getValueByKey!246 lt!97273 (_1!1761 (tuple2!3501 lt!97000 lt!96997))) (Some!251 (_2!1761 (tuple2!3501 lt!97000 lt!96997))))))

(assert (=> d!57149 (= lt!97272 (lemmaContainsTupThenGetReturnValue!133 lt!97273 (_1!1761 (tuple2!3501 lt!97000 lt!96997)) (_2!1761 (tuple2!3501 lt!97000 lt!96997))))))

(assert (=> d!57149 (= lt!97273 (insertStrictlySorted!136 (toList!1226 lt!97001) (_1!1761 (tuple2!3501 lt!97000 lt!96997)) (_2!1761 (tuple2!3501 lt!97000 lt!96997))))))

(assert (=> d!57149 (= (+!319 lt!97001 (tuple2!3501 lt!97000 lt!96997)) lt!97271)))

(declare-fun b!194936 () Bool)

(declare-fun res!92086 () Bool)

(assert (=> b!194936 (=> (not res!92086) (not e!128213))))

(assert (=> b!194936 (= res!92086 (= (getValueByKey!246 (toList!1226 lt!97271) (_1!1761 (tuple2!3501 lt!97000 lt!96997))) (Some!251 (_2!1761 (tuple2!3501 lt!97000 lt!96997)))))))

(declare-fun b!194937 () Bool)

(assert (=> b!194937 (= e!128213 (contains!1365 (toList!1226 lt!97271) (tuple2!3501 lt!97000 lt!96997)))))

(assert (= (and d!57149 res!92087) b!194936))

(assert (= (and b!194936 res!92086) b!194937))

(declare-fun m!222271 () Bool)

(assert (=> d!57149 m!222271))

(declare-fun m!222273 () Bool)

(assert (=> d!57149 m!222273))

(declare-fun m!222275 () Bool)

(assert (=> d!57149 m!222275))

(declare-fun m!222277 () Bool)

(assert (=> d!57149 m!222277))

(declare-fun m!222279 () Bool)

(assert (=> b!194936 m!222279))

(declare-fun m!222281 () Bool)

(assert (=> b!194937 m!222281))

(assert (=> b!194398 d!57149))

(declare-fun b!194939 () Bool)

(declare-fun e!128214 () Option!252)

(declare-fun e!128215 () Option!252)

(assert (=> b!194939 (= e!128214 e!128215)))

(declare-fun c!35242 () Bool)

(assert (=> b!194939 (= c!35242 (and ((_ is Cons!2404) (t!7326 lt!96929)) (not (= (_1!1761 (h!3045 (t!7326 lt!96929))) (_1!1761 lt!96690)))))))

(declare-fun b!194941 () Bool)

(assert (=> b!194941 (= e!128215 None!250)))

(declare-fun d!57151 () Bool)

(declare-fun c!35241 () Bool)

(assert (=> d!57151 (= c!35241 (and ((_ is Cons!2404) (t!7326 lt!96929)) (= (_1!1761 (h!3045 (t!7326 lt!96929))) (_1!1761 lt!96690))))))

(assert (=> d!57151 (= (getValueByKey!246 (t!7326 lt!96929) (_1!1761 lt!96690)) e!128214)))

(declare-fun b!194940 () Bool)

(assert (=> b!194940 (= e!128215 (getValueByKey!246 (t!7326 (t!7326 lt!96929)) (_1!1761 lt!96690)))))

(declare-fun b!194938 () Bool)

(assert (=> b!194938 (= e!128214 (Some!251 (_2!1761 (h!3045 (t!7326 lt!96929)))))))

(assert (= (and d!57151 c!35241) b!194938))

(assert (= (and d!57151 (not c!35241)) b!194939))

(assert (= (and b!194939 c!35242) b!194940))

(assert (= (and b!194939 (not c!35242)) b!194941))

(declare-fun m!222283 () Bool)

(assert (=> b!194940 m!222283))

(assert (=> b!194668 d!57151))

(declare-fun bm!19686 () Bool)

(declare-fun call!19689 () Bool)

(assert (=> bm!19686 (= call!19689 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5953 lt!96692) (mask!9222 lt!96692)))))

(declare-fun d!57153 () Bool)

(declare-fun res!92089 () Bool)

(declare-fun e!128218 () Bool)

(assert (=> d!57153 (=> res!92089 e!128218)))

(assert (=> d!57153 (= res!92089 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!57153 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5953 lt!96692) (mask!9222 lt!96692)) e!128218)))

(declare-fun b!194942 () Bool)

(declare-fun e!128216 () Bool)

(assert (=> b!194942 (= e!128216 call!19689)))

(declare-fun b!194943 () Bool)

(declare-fun e!128217 () Bool)

(assert (=> b!194943 (= e!128217 e!128216)))

(declare-fun lt!97276 () (_ BitVec 64))

(assert (=> b!194943 (= lt!97276 (select (arr!3866 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!97275 () Unit!5858)

(assert (=> b!194943 (= lt!97275 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5953 lt!96692) lt!97276 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!194943 (arrayContainsKey!0 (_keys!5953 lt!96692) lt!97276 #b00000000000000000000000000000000)))

(declare-fun lt!97277 () Unit!5858)

(assert (=> b!194943 (= lt!97277 lt!97275)))

(declare-fun res!92088 () Bool)

(assert (=> b!194943 (= res!92088 (= (seekEntryOrOpen!0 (select (arr!3866 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5953 lt!96692) (mask!9222 lt!96692)) (Found!682 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194943 (=> (not res!92088) (not e!128216))))

(declare-fun b!194944 () Bool)

(assert (=> b!194944 (= e!128217 call!19689)))

(declare-fun b!194945 () Bool)

(assert (=> b!194945 (= e!128218 e!128217)))

(declare-fun c!35243 () Bool)

(assert (=> b!194945 (= c!35243 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!57153 (not res!92089)) b!194945))

(assert (= (and b!194945 c!35243) b!194943))

(assert (= (and b!194945 (not c!35243)) b!194944))

(assert (= (and b!194943 res!92088) b!194942))

(assert (= (or b!194942 b!194944) bm!19686))

(declare-fun m!222285 () Bool)

(assert (=> bm!19686 m!222285))

(declare-fun m!222287 () Bool)

(assert (=> b!194943 m!222287))

(declare-fun m!222289 () Bool)

(assert (=> b!194943 m!222289))

(declare-fun m!222291 () Bool)

(assert (=> b!194943 m!222291))

(assert (=> b!194943 m!222287))

(declare-fun m!222293 () Bool)

(assert (=> b!194943 m!222293))

(assert (=> b!194945 m!222287))

(assert (=> b!194945 m!222287))

(declare-fun m!222295 () Bool)

(assert (=> b!194945 m!222295))

(assert (=> bm!19652 d!57153))

(declare-fun d!57155 () Bool)

(declare-fun res!92090 () Bool)

(declare-fun e!128219 () Bool)

(assert (=> d!57155 (=> res!92090 e!128219)))

(assert (=> d!57155 (= res!92090 (= (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!828))))

(assert (=> d!57155 (= (arrayContainsKey!0 (_keys!5953 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!128219)))

(declare-fun b!194946 () Bool)

(declare-fun e!128220 () Bool)

(assert (=> b!194946 (= e!128219 e!128220)))

(declare-fun res!92091 () Bool)

(assert (=> b!194946 (=> (not res!92091) (not e!128220))))

(assert (=> b!194946 (= res!92091 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194947 () Bool)

(assert (=> b!194947 (= e!128220 (arrayContainsKey!0 (_keys!5953 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!57155 (not res!92090)) b!194946))

(assert (= (and b!194946 res!92091) b!194947))

(assert (=> d!57155 m!221933))

(declare-fun m!222297 () Bool)

(assert (=> b!194947 m!222297))

(assert (=> b!194559 d!57155))

(declare-fun d!57157 () Bool)

(assert (=> d!57157 (= (get!2245 (select (arr!3867 lt!96689) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4252 (select (arr!3867 lt!96689) #b00000000000000000000000000000000)))))

(assert (=> b!194473 d!57157))

(declare-fun d!57159 () Bool)

(declare-fun res!92092 () Bool)

(declare-fun e!128221 () Bool)

(assert (=> d!57159 (=> res!92092 e!128221)))

(assert (=> d!57159 (= res!92092 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (= (_1!1761 (h!3045 (toList!1226 lt!96908))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!57159 (= (containsKey!249 (toList!1226 lt!96908) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) e!128221)))

(declare-fun b!194948 () Bool)

(declare-fun e!128222 () Bool)

(assert (=> b!194948 (= e!128221 e!128222)))

(declare-fun res!92093 () Bool)

(assert (=> b!194948 (=> (not res!92093) (not e!128222))))

(assert (=> b!194948 (= res!92093 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96908))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96908))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2404) (toList!1226 lt!96908)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96908))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!194949 () Bool)

(assert (=> b!194949 (= e!128222 (containsKey!249 (t!7326 (toList!1226 lt!96908)) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57159 (not res!92092)) b!194948))

(assert (= (and b!194948 res!92093) b!194949))

(assert (=> b!194949 m!221041))

(declare-fun m!222299 () Bool)

(assert (=> b!194949 m!222299))

(assert (=> d!56879 d!57159))

(assert (=> b!194580 d!56833))

(declare-fun d!57161 () Bool)

(declare-fun res!92094 () Bool)

(declare-fun e!128223 () Bool)

(assert (=> d!57161 (=> res!92094 e!128223)))

(assert (=> d!57161 (= res!92094 (and ((_ is Cons!2404) (toList!1226 lt!96908)) (= (_1!1761 (h!3045 (toList!1226 lt!96908))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57161 (= (containsKey!249 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000) e!128223)))

(declare-fun b!194950 () Bool)

(declare-fun e!128224 () Bool)

(assert (=> b!194950 (= e!128223 e!128224)))

(declare-fun res!92095 () Bool)

(assert (=> b!194950 (=> (not res!92095) (not e!128224))))

(assert (=> b!194950 (= res!92095 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96908))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96908))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2404) (toList!1226 lt!96908)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96908))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194951 () Bool)

(assert (=> b!194951 (= e!128224 (containsKey!249 (t!7326 (toList!1226 lt!96908)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57161 (not res!92094)) b!194950))

(assert (= (and b!194950 res!92095) b!194951))

(declare-fun m!222301 () Bool)

(assert (=> b!194951 m!222301))

(assert (=> d!56933 d!57161))

(assert (=> b!194574 d!56823))

(declare-fun d!57163 () Bool)

(assert (=> d!57163 (= (size!4196 lt!96692) (bvadd (_size!1404 lt!96692) (bvsdiv (bvadd (extraKeys!3696 lt!96692) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!194485 d!57163))

(declare-fun lt!97278 () Bool)

(declare-fun d!57165 () Bool)

(assert (=> d!57165 (= lt!97278 (select (content!156 (toList!1226 lt!96975)) (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))

(declare-fun e!128226 () Bool)

(assert (=> d!57165 (= lt!97278 e!128226)))

(declare-fun res!92096 () Bool)

(assert (=> d!57165 (=> (not res!92096) (not e!128226))))

(assert (=> d!57165 (= res!92096 ((_ is Cons!2404) (toList!1226 lt!96975)))))

(assert (=> d!57165 (= (contains!1365 (toList!1226 lt!96975) (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) lt!97278)))

(declare-fun b!194952 () Bool)

(declare-fun e!128225 () Bool)

(assert (=> b!194952 (= e!128226 e!128225)))

(declare-fun res!92097 () Bool)

(assert (=> b!194952 (=> res!92097 e!128225)))

(assert (=> b!194952 (= res!92097 (= (h!3045 (toList!1226 lt!96975)) (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))

(declare-fun b!194953 () Bool)

(assert (=> b!194953 (= e!128225 (contains!1365 (t!7326 (toList!1226 lt!96975)) (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))

(assert (= (and d!57165 res!92096) b!194952))

(assert (= (and b!194952 (not res!92097)) b!194953))

(declare-fun m!222303 () Bool)

(assert (=> d!57165 m!222303))

(declare-fun m!222305 () Bool)

(assert (=> d!57165 m!222305))

(declare-fun m!222307 () Bool)

(assert (=> b!194953 m!222307))

(assert (=> b!194312 d!57165))

(assert (=> d!56917 d!56725))

(declare-fun d!57167 () Bool)

(declare-fun lt!97279 () Bool)

(assert (=> d!57167 (= lt!97279 (select (content!156 (toList!1226 lt!96952)) (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))

(declare-fun e!128228 () Bool)

(assert (=> d!57167 (= lt!97279 e!128228)))

(declare-fun res!92098 () Bool)

(assert (=> d!57167 (=> (not res!92098) (not e!128228))))

(assert (=> d!57167 (= res!92098 ((_ is Cons!2404) (toList!1226 lt!96952)))))

(assert (=> d!57167 (= (contains!1365 (toList!1226 lt!96952) (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) lt!97279)))

(declare-fun b!194954 () Bool)

(declare-fun e!128227 () Bool)

(assert (=> b!194954 (= e!128228 e!128227)))

(declare-fun res!92099 () Bool)

(assert (=> b!194954 (=> res!92099 e!128227)))

(assert (=> b!194954 (= res!92099 (= (h!3045 (toList!1226 lt!96952)) (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))

(declare-fun b!194955 () Bool)

(assert (=> b!194955 (= e!128227 (contains!1365 (t!7326 (toList!1226 lt!96952)) (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))

(assert (= (and d!57167 res!92098) b!194954))

(assert (= (and b!194954 (not res!92099)) b!194955))

(declare-fun m!222309 () Bool)

(assert (=> d!57167 m!222309))

(declare-fun m!222311 () Bool)

(assert (=> d!57167 m!222311))

(declare-fun m!222313 () Bool)

(assert (=> b!194955 m!222313))

(assert (=> b!194297 d!57167))

(declare-fun b!194957 () Bool)

(declare-fun e!128229 () Option!252)

(declare-fun e!128230 () Option!252)

(assert (=> b!194957 (= e!128229 e!128230)))

(declare-fun c!35245 () Bool)

(assert (=> b!194957 (= c!35245 (and ((_ is Cons!2404) (toList!1226 lt!97075)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97075))) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194959 () Bool)

(assert (=> b!194959 (= e!128230 None!250)))

(declare-fun d!57169 () Bool)

(declare-fun c!35244 () Bool)

(assert (=> d!57169 (= c!35244 (and ((_ is Cons!2404) (toList!1226 lt!97075)) (= (_1!1761 (h!3045 (toList!1226 lt!97075))) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(assert (=> d!57169 (= (getValueByKey!246 (toList!1226 lt!97075) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) e!128229)))

(declare-fun b!194958 () Bool)

(assert (=> b!194958 (= e!128230 (getValueByKey!246 (t!7326 (toList!1226 lt!97075)) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun b!194956 () Bool)

(assert (=> b!194956 (= e!128229 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97075)))))))

(assert (= (and d!57169 c!35244) b!194956))

(assert (= (and d!57169 (not c!35244)) b!194957))

(assert (= (and b!194957 c!35245) b!194958))

(assert (= (and b!194957 (not c!35245)) b!194959))

(declare-fun m!222315 () Bool)

(assert (=> b!194958 m!222315))

(assert (=> b!194537 d!57169))

(declare-fun d!57171 () Bool)

(assert (=> d!57171 (= (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96700) key!828)) (not ((_ is Some!251) (getValueByKey!246 (toList!1226 lt!96700) key!828))))))

(assert (=> d!56929 d!57171))

(declare-fun d!57173 () Bool)

(declare-fun res!92100 () Bool)

(declare-fun e!128231 () Bool)

(assert (=> d!57173 (=> res!92100 e!128231)))

(assert (=> d!57173 (= res!92100 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96696))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96696)))) key!828)))))

(assert (=> d!57173 (= (containsKey!249 (t!7326 (toList!1226 lt!96696)) key!828) e!128231)))

(declare-fun b!194960 () Bool)

(declare-fun e!128232 () Bool)

(assert (=> b!194960 (= e!128231 e!128232)))

(declare-fun res!92101 () Bool)

(assert (=> b!194960 (=> (not res!92101) (not e!128232))))

(assert (=> b!194960 (= res!92101 (and (or (not ((_ is Cons!2404) (t!7326 (toList!1226 lt!96696)))) (bvsle (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96696)))) key!828)) ((_ is Cons!2404) (t!7326 (toList!1226 lt!96696))) (bvslt (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96696)))) key!828)))))

(declare-fun b!194961 () Bool)

(assert (=> b!194961 (= e!128232 (containsKey!249 (t!7326 (t!7326 (toList!1226 lt!96696))) key!828))))

(assert (= (and d!57173 (not res!92100)) b!194960))

(assert (= (and b!194960 res!92101) b!194961))

(declare-fun m!222317 () Bool)

(assert (=> b!194961 m!222317))

(assert (=> b!194385 d!57173))

(declare-fun d!57175 () Bool)

(declare-fun res!92102 () Bool)

(declare-fun e!128233 () Bool)

(assert (=> d!57175 (=> res!92102 e!128233)))

(assert (=> d!57175 (= res!92102 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))) lt!96871)))))

(assert (=> d!57175 (= (containsKey!249 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871) e!128233)))

(declare-fun b!194962 () Bool)

(declare-fun e!128234 () Bool)

(assert (=> b!194962 (= e!128233 e!128234)))

(declare-fun res!92103 () Bool)

(assert (=> b!194962 (=> (not res!92103) (not e!128234))))

(assert (=> b!194962 (= res!92103 (and (or (not ((_ is Cons!2404) (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))) (bvsle (_1!1761 (h!3045 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))) lt!96871)) ((_ is Cons!2404) (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))) (bvslt (_1!1761 (h!3045 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))) lt!96871)))))

(declare-fun b!194963 () Bool)

(assert (=> b!194963 (= e!128234 (containsKey!249 (t!7326 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))) lt!96871))))

(assert (= (and d!57175 (not res!92102)) b!194962))

(assert (= (and b!194962 res!92103) b!194963))

(declare-fun m!222319 () Bool)

(assert (=> b!194963 m!222319))

(assert (=> d!56863 d!57175))

(declare-fun d!57177 () Bool)

(assert (=> d!57177 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97280 () Unit!5858)

(assert (=> d!57177 (= lt!97280 (choose!1077 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128235 () Bool)

(assert (=> d!57177 e!128235))

(declare-fun res!92104 () Bool)

(assert (=> d!57177 (=> (not res!92104) (not e!128235))))

(assert (=> d!57177 (= res!92104 (isStrictlySorted!344 (toList!1226 lt!96908)))))

(assert (=> d!57177 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000) lt!97280)))

(declare-fun b!194964 () Bool)

(assert (=> b!194964 (= e!128235 (containsKey!249 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57177 res!92104) b!194964))

(assert (=> d!57177 m!221373))

(assert (=> d!57177 m!221373))

(assert (=> d!57177 m!221823))

(declare-fun m!222321 () Bool)

(assert (=> d!57177 m!222321))

(assert (=> d!57177 m!221913))

(assert (=> b!194964 m!221819))

(assert (=> b!194656 d!57177))

(assert (=> b!194656 d!57065))

(assert (=> b!194656 d!57067))

(declare-fun d!57179 () Bool)

(declare-fun lt!97281 () Bool)

(assert (=> d!57179 (= lt!97281 (select (content!156 (t!7326 (toList!1226 lt!96885))) lt!96690))))

(declare-fun e!128237 () Bool)

(assert (=> d!57179 (= lt!97281 e!128237)))

(declare-fun res!92105 () Bool)

(assert (=> d!57179 (=> (not res!92105) (not e!128237))))

(assert (=> d!57179 (= res!92105 ((_ is Cons!2404) (t!7326 (toList!1226 lt!96885))))))

(assert (=> d!57179 (= (contains!1365 (t!7326 (toList!1226 lt!96885)) lt!96690) lt!97281)))

(declare-fun b!194965 () Bool)

(declare-fun e!128236 () Bool)

(assert (=> b!194965 (= e!128237 e!128236)))

(declare-fun res!92106 () Bool)

(assert (=> b!194965 (=> res!92106 e!128236)))

(assert (=> b!194965 (= res!92106 (= (h!3045 (t!7326 (toList!1226 lt!96885))) lt!96690))))

(declare-fun b!194966 () Bool)

(assert (=> b!194966 (= e!128236 (contains!1365 (t!7326 (t!7326 (toList!1226 lt!96885))) lt!96690))))

(assert (= (and d!57179 res!92105) b!194965))

(assert (= (and b!194965 (not res!92106)) b!194966))

(assert (=> d!57179 m!222057))

(declare-fun m!222323 () Bool)

(assert (=> d!57179 m!222323))

(declare-fun m!222325 () Bool)

(assert (=> b!194966 m!222325))

(assert (=> b!194650 d!57179))

(declare-fun d!57181 () Bool)

(declare-fun lt!97282 () Bool)

(assert (=> d!57181 (= lt!97282 (select (content!156 lt!96887) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun e!128239 () Bool)

(assert (=> d!57181 (= lt!97282 e!128239)))

(declare-fun res!92107 () Bool)

(assert (=> d!57181 (=> (not res!92107) (not e!128239))))

(assert (=> d!57181 (= res!92107 ((_ is Cons!2404) lt!96887))))

(assert (=> d!57181 (= (contains!1365 lt!96887 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))) lt!97282)))

(declare-fun b!194967 () Bool)

(declare-fun e!128238 () Bool)

(assert (=> b!194967 (= e!128239 e!128238)))

(declare-fun res!92108 () Bool)

(assert (=> b!194967 (=> res!92108 e!128238)))

(assert (=> b!194967 (= res!92108 (= (h!3045 lt!96887) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun b!194968 () Bool)

(assert (=> b!194968 (= e!128238 (contains!1365 (t!7326 lt!96887) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(assert (= (and d!57181 res!92107) b!194967))

(assert (= (and b!194967 (not res!92108)) b!194968))

(declare-fun m!222327 () Bool)

(assert (=> d!57181 m!222327))

(declare-fun m!222329 () Bool)

(assert (=> d!57181 m!222329))

(declare-fun m!222331 () Bool)

(assert (=> b!194968 m!222331))

(assert (=> b!194349 d!57181))

(declare-fun d!57183 () Bool)

(declare-fun res!92109 () Bool)

(declare-fun e!128240 () Bool)

(assert (=> d!57183 (=> res!92109 e!128240)))

(assert (=> d!57183 (= res!92109 (and ((_ is Cons!2404) (toList!1226 lt!96927)) (= (_1!1761 (h!3045 (toList!1226 lt!96927))) (_1!1761 lt!96690))))))

(assert (=> d!57183 (= (containsKey!249 (toList!1226 lt!96927) (_1!1761 lt!96690)) e!128240)))

(declare-fun b!194969 () Bool)

(declare-fun e!128241 () Bool)

(assert (=> b!194969 (= e!128240 e!128241)))

(declare-fun res!92110 () Bool)

(assert (=> b!194969 (=> (not res!92110) (not e!128241))))

(assert (=> b!194969 (= res!92110 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96927))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96927))) (_1!1761 lt!96690))) ((_ is Cons!2404) (toList!1226 lt!96927)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96927))) (_1!1761 lt!96690))))))

(declare-fun b!194970 () Bool)

(assert (=> b!194970 (= e!128241 (containsKey!249 (t!7326 (toList!1226 lt!96927)) (_1!1761 lt!96690)))))

(assert (= (and d!57183 (not res!92109)) b!194969))

(assert (= (and b!194969 res!92110) b!194970))

(declare-fun m!222333 () Bool)

(assert (=> b!194970 m!222333))

(assert (=> d!56937 d!57183))

(declare-fun d!57185 () Bool)

(assert (=> d!57185 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7792 () Bool)

(assert (= bs!7792 d!57185))

(assert (=> bs!7792 m!221341))

(declare-fun m!222335 () Bool)

(assert (=> bs!7792 m!222335))

(assert (=> b!194328 d!57185))

(declare-fun b!194972 () Bool)

(declare-fun e!128242 () Option!252)

(declare-fun e!128243 () Option!252)

(assert (=> b!194972 (= e!128242 e!128243)))

(declare-fun c!35247 () Bool)

(assert (=> b!194972 (= c!35247 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96864))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!194974 () Bool)

(assert (=> b!194974 (= e!128243 None!250)))

(declare-fun d!57187 () Bool)

(declare-fun c!35246 () Bool)

(assert (=> d!57187 (= c!35246 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (= (_1!1761 (h!3045 (toList!1226 lt!96864))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!57187 (= (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) e!128242)))

(declare-fun b!194973 () Bool)

(assert (=> b!194973 (= e!128243 (getValueByKey!246 (t!7326 (toList!1226 lt!96864)) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194971 () Bool)

(assert (=> b!194971 (= e!128242 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96864)))))))

(assert (= (and d!57187 c!35246) b!194971))

(assert (= (and d!57187 (not c!35246)) b!194972))

(assert (= (and b!194972 c!35247) b!194973))

(assert (= (and b!194972 (not c!35247)) b!194974))

(assert (=> b!194973 m!221041))

(declare-fun m!222337 () Bool)

(assert (=> b!194973 m!222337))

(assert (=> b!194328 d!57187))

(assert (=> d!56835 d!56975))

(declare-fun d!57189 () Bool)

(declare-fun e!128245 () Bool)

(assert (=> d!57189 e!128245))

(declare-fun res!92111 () Bool)

(assert (=> d!57189 (=> res!92111 e!128245)))

(declare-fun lt!97284 () Bool)

(assert (=> d!57189 (= res!92111 (not lt!97284))))

(declare-fun lt!97286 () Bool)

(assert (=> d!57189 (= lt!97284 lt!97286)))

(declare-fun lt!97283 () Unit!5858)

(declare-fun e!128244 () Unit!5858)

(assert (=> d!57189 (= lt!97283 e!128244)))

(declare-fun c!35248 () Bool)

(assert (=> d!57189 (= c!35248 lt!97286)))

(assert (=> d!57189 (= lt!97286 (containsKey!249 (toList!1226 lt!97118) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (=> d!57189 (= (contains!1363 lt!97118 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)) lt!97284)))

(declare-fun b!194975 () Bool)

(declare-fun lt!97285 () Unit!5858)

(assert (=> b!194975 (= e!128244 lt!97285)))

(assert (=> b!194975 (= lt!97285 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97118) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (=> b!194975 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97118) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun b!194976 () Bool)

(declare-fun Unit!5890 () Unit!5858)

(assert (=> b!194976 (= e!128244 Unit!5890)))

(declare-fun b!194977 () Bool)

(assert (=> b!194977 (= e!128245 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97118) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000))))))

(assert (= (and d!57189 c!35248) b!194975))

(assert (= (and d!57189 (not c!35248)) b!194976))

(assert (= (and d!57189 (not res!92111)) b!194977))

(assert (=> d!57189 m!221539))

(declare-fun m!222339 () Bool)

(assert (=> d!57189 m!222339))

(assert (=> b!194975 m!221539))

(declare-fun m!222341 () Bool)

(assert (=> b!194975 m!222341))

(assert (=> b!194975 m!221539))

(declare-fun m!222343 () Bool)

(assert (=> b!194975 m!222343))

(assert (=> b!194975 m!222343))

(declare-fun m!222345 () Bool)

(assert (=> b!194975 m!222345))

(assert (=> b!194977 m!221539))

(assert (=> b!194977 m!222343))

(assert (=> b!194977 m!222343))

(assert (=> b!194977 m!222345))

(assert (=> b!194595 d!57189))

(declare-fun d!57191 () Bool)

(assert (=> d!57191 (= (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7793 () Bool)

(assert (= bs!7793 d!57191))

(assert (=> bs!7793 m!221385))

(declare-fun m!222347 () Bool)

(assert (=> bs!7793 m!222347))

(assert (=> b!194620 d!57191))

(declare-fun b!194979 () Bool)

(declare-fun e!128246 () Option!252)

(declare-fun e!128247 () Option!252)

(assert (=> b!194979 (= e!128246 e!128247)))

(declare-fun c!35250 () Bool)

(assert (=> b!194979 (= c!35250 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96864))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194981 () Bool)

(assert (=> b!194981 (= e!128247 None!250)))

(declare-fun d!57193 () Bool)

(declare-fun c!35249 () Bool)

(assert (=> d!57193 (= c!35249 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (= (_1!1761 (h!3045 (toList!1226 lt!96864))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57193 (= (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000) e!128246)))

(declare-fun b!194980 () Bool)

(assert (=> b!194980 (= e!128247 (getValueByKey!246 (t!7326 (toList!1226 lt!96864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194978 () Bool)

(assert (=> b!194978 (= e!128246 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96864)))))))

(assert (= (and d!57193 c!35249) b!194978))

(assert (= (and d!57193 (not c!35249)) b!194979))

(assert (= (and b!194979 c!35250) b!194980))

(assert (= (and b!194979 (not c!35250)) b!194981))

(declare-fun m!222349 () Bool)

(assert (=> b!194980 m!222349))

(assert (=> b!194620 d!57193))

(declare-fun d!57195 () Bool)

(assert (=> d!57195 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871))))

(declare-fun lt!97287 () Unit!5858)

(assert (=> d!57195 (= lt!97287 (choose!1077 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871))))

(declare-fun e!128248 () Bool)

(assert (=> d!57195 e!128248))

(declare-fun res!92112 () Bool)

(assert (=> d!57195 (=> (not res!92112) (not e!128248))))

(assert (=> d!57195 (= res!92112 (isStrictlySorted!344 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57195 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871) lt!97287)))

(declare-fun b!194982 () Bool)

(assert (=> b!194982 (= e!128248 (containsKey!249 (toList!1226 (+!319 lt!96873 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!96871))))

(assert (= (and d!57195 res!92112) b!194982))

(assert (=> d!57195 m!221629))

(assert (=> d!57195 m!221629))

(assert (=> d!57195 m!221631))

(declare-fun m!222351 () Bool)

(assert (=> d!57195 m!222351))

(declare-fun m!222353 () Bool)

(assert (=> d!57195 m!222353))

(assert (=> b!194982 m!221625))

(assert (=> b!194546 d!57195))

(assert (=> b!194546 d!57093))

(assert (=> b!194546 d!57095))

(declare-fun d!57197 () Bool)

(declare-fun res!92113 () Bool)

(declare-fun e!128249 () Bool)

(assert (=> d!57197 (=> res!92113 e!128249)))

(assert (=> d!57197 (= res!92113 (and ((_ is Cons!2404) lt!97166) (= (_1!1761 (h!3045 lt!97166)) (_1!1761 lt!96690))))))

(assert (=> d!57197 (= (containsKey!249 lt!97166 (_1!1761 lt!96690)) e!128249)))

(declare-fun b!194983 () Bool)

(declare-fun e!128250 () Bool)

(assert (=> b!194983 (= e!128249 e!128250)))

(declare-fun res!92114 () Bool)

(assert (=> b!194983 (=> (not res!92114) (not e!128250))))

(assert (=> b!194983 (= res!92114 (and (or (not ((_ is Cons!2404) lt!97166)) (bvsle (_1!1761 (h!3045 lt!97166)) (_1!1761 lt!96690))) ((_ is Cons!2404) lt!97166) (bvslt (_1!1761 (h!3045 lt!97166)) (_1!1761 lt!96690))))))

(declare-fun b!194984 () Bool)

(assert (=> b!194984 (= e!128250 (containsKey!249 (t!7326 lt!97166) (_1!1761 lt!96690)))))

(assert (= (and d!57197 (not res!92113)) b!194983))

(assert (= (and b!194983 res!92114) b!194984))

(declare-fun m!222355 () Bool)

(assert (=> b!194984 m!222355))

(assert (=> b!194675 d!57197))

(declare-fun d!57199 () Bool)

(declare-fun e!128252 () Bool)

(assert (=> d!57199 e!128252))

(declare-fun res!92115 () Bool)

(assert (=> d!57199 (=> res!92115 e!128252)))

(declare-fun lt!97289 () Bool)

(assert (=> d!57199 (= res!92115 (not lt!97289))))

(declare-fun lt!97291 () Bool)

(assert (=> d!57199 (= lt!97289 lt!97291)))

(declare-fun lt!97288 () Unit!5858)

(declare-fun e!128251 () Unit!5858)

(assert (=> d!57199 (= lt!97288 e!128251)))

(declare-fun c!35251 () Bool)

(assert (=> d!57199 (= c!35251 lt!97291)))

(assert (=> d!57199 (= lt!97291 (containsKey!249 (toList!1226 lt!97036) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!57199 (= (contains!1363 lt!97036 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) lt!97289)))

(declare-fun b!194985 () Bool)

(declare-fun lt!97290 () Unit!5858)

(assert (=> b!194985 (= e!128251 lt!97290)))

(assert (=> b!194985 (= lt!97290 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97036) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194985 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97036) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194986 () Bool)

(declare-fun Unit!5891 () Unit!5858)

(assert (=> b!194986 (= e!128251 Unit!5891)))

(declare-fun b!194987 () Bool)

(assert (=> b!194987 (= e!128252 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97036) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!57199 c!35251) b!194985))

(assert (= (and d!57199 (not c!35251)) b!194986))

(assert (= (and d!57199 (not res!92115)) b!194987))

(assert (=> d!57199 m!221041))

(declare-fun m!222357 () Bool)

(assert (=> d!57199 m!222357))

(assert (=> b!194985 m!221041))

(declare-fun m!222359 () Bool)

(assert (=> b!194985 m!222359))

(assert (=> b!194985 m!221041))

(declare-fun m!222361 () Bool)

(assert (=> b!194985 m!222361))

(assert (=> b!194985 m!222361))

(declare-fun m!222363 () Bool)

(assert (=> b!194985 m!222363))

(assert (=> b!194987 m!221041))

(assert (=> b!194987 m!222361))

(assert (=> b!194987 m!222361))

(assert (=> b!194987 m!222363))

(assert (=> b!194448 d!57199))

(declare-fun d!57201 () Bool)

(assert (=> d!57201 (arrayContainsKey!0 (_keys!5953 thiss!1248) lt!97011 #b00000000000000000000000000000000)))

(declare-fun lt!97292 () Unit!5858)

(assert (=> d!57201 (= lt!97292 (choose!13 (_keys!5953 thiss!1248) lt!97011 #b00000000000000000000000000000000))))

(assert (=> d!57201 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!57201 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5953 thiss!1248) lt!97011 #b00000000000000000000000000000000) lt!97292)))

(declare-fun bs!7794 () Bool)

(assert (= bs!7794 d!57201))

(assert (=> bs!7794 m!221413))

(declare-fun m!222365 () Bool)

(assert (=> bs!7794 m!222365))

(assert (=> b!194413 d!57201))

(declare-fun d!57203 () Bool)

(declare-fun res!92116 () Bool)

(declare-fun e!128253 () Bool)

(assert (=> d!57203 (=> res!92116 e!128253)))

(assert (=> d!57203 (= res!92116 (= (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) lt!97011))))

(assert (=> d!57203 (= (arrayContainsKey!0 (_keys!5953 thiss!1248) lt!97011 #b00000000000000000000000000000000) e!128253)))

(declare-fun b!194988 () Bool)

(declare-fun e!128254 () Bool)

(assert (=> b!194988 (= e!128253 e!128254)))

(declare-fun res!92117 () Bool)

(assert (=> b!194988 (=> (not res!92117) (not e!128254))))

(assert (=> b!194988 (= res!92117 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!194989 () Bool)

(assert (=> b!194989 (= e!128254 (arrayContainsKey!0 (_keys!5953 thiss!1248) lt!97011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!57203 (not res!92116)) b!194988))

(assert (= (and b!194988 res!92117) b!194989))

(assert (=> d!57203 m!221041))

(declare-fun m!222367 () Bool)

(assert (=> b!194989 m!222367))

(assert (=> b!194413 d!57203))

(declare-fun b!194990 () Bool)

(declare-fun e!128256 () SeekEntryResult!682)

(declare-fun lt!97294 () SeekEntryResult!682)

(assert (=> b!194990 (= e!128256 (Found!682 (index!4900 lt!97294)))))

(declare-fun b!194991 () Bool)

(declare-fun e!128255 () SeekEntryResult!682)

(assert (=> b!194991 (= e!128255 Undefined!682)))

(declare-fun b!194992 () Bool)

(declare-fun c!35253 () Bool)

(declare-fun lt!97293 () (_ BitVec 64))

(assert (=> b!194992 (= c!35253 (= lt!97293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128257 () SeekEntryResult!682)

(assert (=> b!194992 (= e!128256 e!128257)))

(declare-fun b!194993 () Bool)

(assert (=> b!194993 (= e!128257 (seekKeyOrZeroReturnVacant!0 (x!20678 lt!97294) (index!4900 lt!97294) (index!4900 lt!97294) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun d!57205 () Bool)

(declare-fun lt!97295 () SeekEntryResult!682)

(assert (=> d!57205 (and (or ((_ is Undefined!682) lt!97295) (not ((_ is Found!682) lt!97295)) (and (bvsge (index!4899 lt!97295) #b00000000000000000000000000000000) (bvslt (index!4899 lt!97295) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!97295) ((_ is Found!682) lt!97295) (not ((_ is MissingZero!682) lt!97295)) (and (bvsge (index!4898 lt!97295) #b00000000000000000000000000000000) (bvslt (index!4898 lt!97295) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!97295) ((_ is Found!682) lt!97295) ((_ is MissingZero!682) lt!97295) (not ((_ is MissingVacant!682) lt!97295)) (and (bvsge (index!4901 lt!97295) #b00000000000000000000000000000000) (bvslt (index!4901 lt!97295) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!97295) (ite ((_ is Found!682) lt!97295) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!97295)) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!682) lt!97295) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4898 lt!97295)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!682) lt!97295) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4901 lt!97295)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57205 (= lt!97295 e!128255)))

(declare-fun c!35254 () Bool)

(assert (=> d!57205 (= c!35254 (and ((_ is Intermediate!682) lt!97294) (undefined!1494 lt!97294)))))

(assert (=> d!57205 (= lt!97294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (mask!9222 thiss!1248)) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(assert (=> d!57205 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!57205 (= (seekEntryOrOpen!0 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) lt!97295)))

(declare-fun b!194994 () Bool)

(assert (=> b!194994 (= e!128257 (MissingZero!682 (index!4900 lt!97294)))))

(declare-fun b!194995 () Bool)

(assert (=> b!194995 (= e!128255 e!128256)))

(assert (=> b!194995 (= lt!97293 (select (arr!3866 (_keys!5953 thiss!1248)) (index!4900 lt!97294)))))

(declare-fun c!35252 () Bool)

(assert (=> b!194995 (= c!35252 (= lt!97293 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57205 c!35254) b!194991))

(assert (= (and d!57205 (not c!35254)) b!194995))

(assert (= (and b!194995 c!35252) b!194990))

(assert (= (and b!194995 (not c!35252)) b!194992))

(assert (= (and b!194992 c!35253) b!194994))

(assert (= (and b!194992 (not c!35253)) b!194993))

(assert (=> b!194993 m!221041))

(declare-fun m!222369 () Bool)

(assert (=> b!194993 m!222369))

(declare-fun m!222371 () Bool)

(assert (=> d!57205 m!222371))

(declare-fun m!222373 () Bool)

(assert (=> d!57205 m!222373))

(declare-fun m!222375 () Bool)

(assert (=> d!57205 m!222375))

(assert (=> d!57205 m!221041))

(declare-fun m!222377 () Bool)

(assert (=> d!57205 m!222377))

(declare-fun m!222379 () Bool)

(assert (=> d!57205 m!222379))

(assert (=> d!57205 m!221011))

(assert (=> d!57205 m!221041))

(assert (=> d!57205 m!222375))

(declare-fun m!222381 () Bool)

(assert (=> b!194995 m!222381))

(assert (=> b!194413 d!57205))

(declare-fun d!57207 () Bool)

(declare-fun lt!97298 () Bool)

(declare-fun content!157 (List!2410) (InoxSet (_ BitVec 64)))

(assert (=> d!57207 (= lt!97298 (select (content!157 Nil!2407) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128263 () Bool)

(assert (=> d!57207 (= lt!97298 e!128263)))

(declare-fun res!92123 () Bool)

(assert (=> d!57207 (=> (not res!92123) (not e!128263))))

(assert (=> d!57207 (= res!92123 ((_ is Cons!2406) Nil!2407))))

(assert (=> d!57207 (= (contains!1366 Nil!2407 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) lt!97298)))

(declare-fun b!195000 () Bool)

(declare-fun e!128262 () Bool)

(assert (=> b!195000 (= e!128263 e!128262)))

(declare-fun res!92122 () Bool)

(assert (=> b!195000 (=> res!92122 e!128262)))

(assert (=> b!195000 (= res!92122 (= (h!3047 Nil!2407) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!195001 () Bool)

(assert (=> b!195001 (= e!128262 (contains!1366 (t!7330 Nil!2407) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57207 res!92123) b!195000))

(assert (= (and b!195000 (not res!92122)) b!195001))

(declare-fun m!222383 () Bool)

(assert (=> d!57207 m!222383))

(assert (=> d!57207 m!221041))

(declare-fun m!222385 () Bool)

(assert (=> d!57207 m!222385))

(assert (=> b!195001 m!221041))

(declare-fun m!222387 () Bool)

(assert (=> b!195001 m!222387))

(assert (=> b!194610 d!57207))

(declare-fun lt!97299 () Bool)

(declare-fun d!57209 () Bool)

(assert (=> d!57209 (= lt!97299 (select (content!156 (toList!1226 lt!97080)) (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))

(declare-fun e!128265 () Bool)

(assert (=> d!57209 (= lt!97299 e!128265)))

(declare-fun res!92124 () Bool)

(assert (=> d!57209 (=> (not res!92124) (not e!128265))))

(assert (=> d!57209 (= res!92124 ((_ is Cons!2404) (toList!1226 lt!97080)))))

(assert (=> d!57209 (= (contains!1365 (toList!1226 lt!97080) (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) lt!97299)))

(declare-fun b!195002 () Bool)

(declare-fun e!128264 () Bool)

(assert (=> b!195002 (= e!128265 e!128264)))

(declare-fun res!92125 () Bool)

(assert (=> b!195002 (=> res!92125 e!128264)))

(assert (=> b!195002 (= res!92125 (= (h!3045 (toList!1226 lt!97080)) (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))

(declare-fun b!195003 () Bool)

(assert (=> b!195003 (= e!128264 (contains!1365 (t!7326 (toList!1226 lt!97080)) (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57209 res!92124) b!195002))

(assert (= (and b!195002 (not res!92125)) b!195003))

(declare-fun m!222389 () Bool)

(assert (=> d!57209 m!222389))

(declare-fun m!222391 () Bool)

(assert (=> d!57209 m!222391))

(declare-fun m!222393 () Bool)

(assert (=> b!195003 m!222393))

(assert (=> b!194541 d!57209))

(assert (=> b!194323 d!57101))

(assert (=> b!194397 d!56823))

(declare-fun d!57211 () Bool)

(declare-fun e!128267 () Bool)

(assert (=> d!57211 e!128267))

(declare-fun res!92126 () Bool)

(assert (=> d!57211 (=> res!92126 e!128267)))

(declare-fun lt!97301 () Bool)

(assert (=> d!57211 (= res!92126 (not lt!97301))))

(declare-fun lt!97303 () Bool)

(assert (=> d!57211 (= lt!97301 lt!97303)))

(declare-fun lt!97300 () Unit!5858)

(declare-fun e!128266 () Unit!5858)

(assert (=> d!57211 (= lt!97300 e!128266)))

(declare-fun c!35255 () Bool)

(assert (=> d!57211 (= c!35255 lt!97303)))

(assert (=> d!57211 (= lt!97303 (containsKey!249 (toList!1226 lt!97075) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(assert (=> d!57211 (= (contains!1363 lt!97075 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) lt!97301)))

(declare-fun b!195004 () Bool)

(declare-fun lt!97302 () Unit!5858)

(assert (=> b!195004 (= e!128266 lt!97302)))

(assert (=> b!195004 (= lt!97302 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97075) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(assert (=> b!195004 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97075) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun b!195005 () Bool)

(declare-fun Unit!5892 () Unit!5858)

(assert (=> b!195005 (= e!128266 Unit!5892)))

(declare-fun b!195006 () Bool)

(assert (=> b!195006 (= e!128267 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97075) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57211 c!35255) b!195004))

(assert (= (and d!57211 (not c!35255)) b!195005))

(assert (= (and d!57211 (not res!92126)) b!195006))

(declare-fun m!222395 () Bool)

(assert (=> d!57211 m!222395))

(declare-fun m!222397 () Bool)

(assert (=> b!195004 m!222397))

(assert (=> b!195004 m!221573))

(assert (=> b!195004 m!221573))

(declare-fun m!222399 () Bool)

(assert (=> b!195004 m!222399))

(assert (=> b!195006 m!221573))

(assert (=> b!195006 m!221573))

(assert (=> b!195006 m!222399))

(assert (=> d!56849 d!57211))

(declare-fun b!195008 () Bool)

(declare-fun e!128268 () Option!252)

(declare-fun e!128269 () Option!252)

(assert (=> b!195008 (= e!128268 e!128269)))

(declare-fun c!35257 () Bool)

(assert (=> b!195008 (= c!35257 (and ((_ is Cons!2404) lt!97077) (not (= (_1!1761 (h!3045 lt!97077)) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195010 () Bool)

(assert (=> b!195010 (= e!128269 None!250)))

(declare-fun d!57213 () Bool)

(declare-fun c!35256 () Bool)

(assert (=> d!57213 (= c!35256 (and ((_ is Cons!2404) lt!97077) (= (_1!1761 (h!3045 lt!97077)) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(assert (=> d!57213 (= (getValueByKey!246 lt!97077 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) e!128268)))

(declare-fun b!195009 () Bool)

(assert (=> b!195009 (= e!128269 (getValueByKey!246 (t!7326 lt!97077) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun b!195007 () Bool)

(assert (=> b!195007 (= e!128268 (Some!251 (_2!1761 (h!3045 lt!97077))))))

(assert (= (and d!57213 c!35256) b!195007))

(assert (= (and d!57213 (not c!35256)) b!195008))

(assert (= (and b!195008 c!35257) b!195009))

(assert (= (and b!195008 (not c!35257)) b!195010))

(declare-fun m!222401 () Bool)

(assert (=> b!195009 m!222401))

(assert (=> d!56849 d!57213))

(declare-fun d!57215 () Bool)

(assert (=> d!57215 (= (getValueByKey!246 lt!97077 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97304 () Unit!5858)

(assert (=> d!57215 (= lt!97304 (choose!1076 lt!97077 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun e!128270 () Bool)

(assert (=> d!57215 e!128270))

(declare-fun res!92127 () Bool)

(assert (=> d!57215 (=> (not res!92127) (not e!128270))))

(assert (=> d!57215 (= res!92127 (isStrictlySorted!344 lt!97077))))

(assert (=> d!57215 (= (lemmaContainsTupThenGetReturnValue!133 lt!97077 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) lt!97304)))

(declare-fun b!195011 () Bool)

(declare-fun res!92128 () Bool)

(assert (=> b!195011 (=> (not res!92128) (not e!128270))))

(assert (=> b!195011 (= res!92128 (containsKey!249 lt!97077 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun b!195012 () Bool)

(assert (=> b!195012 (= e!128270 (contains!1365 lt!97077 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57215 res!92127) b!195011))

(assert (= (and b!195011 res!92128) b!195012))

(assert (=> d!57215 m!221567))

(declare-fun m!222403 () Bool)

(assert (=> d!57215 m!222403))

(declare-fun m!222405 () Bool)

(assert (=> d!57215 m!222405))

(declare-fun m!222407 () Bool)

(assert (=> b!195011 m!222407))

(declare-fun m!222409 () Bool)

(assert (=> b!195012 m!222409))

(assert (=> d!56849 d!57215))

(declare-fun lt!97305 () List!2408)

(declare-fun b!195013 () Bool)

(declare-fun e!128272 () Bool)

(assert (=> b!195013 (= e!128272 (contains!1365 lt!97305 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(declare-fun bm!19687 () Bool)

(declare-fun call!19692 () List!2408)

(declare-fun call!19690 () List!2408)

(assert (=> bm!19687 (= call!19692 call!19690)))

(declare-fun e!128271 () List!2408)

(declare-fun b!195014 () Bool)

(assert (=> b!195014 (= e!128271 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96869)) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun b!195015 () Bool)

(declare-fun e!128275 () List!2408)

(declare-fun call!19691 () List!2408)

(assert (=> b!195015 (= e!128275 call!19691)))

(declare-fun b!195016 () Bool)

(declare-fun res!92129 () Bool)

(assert (=> b!195016 (=> (not res!92129) (not e!128272))))

(assert (=> b!195016 (= res!92129 (containsKey!249 lt!97305 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19688 () Bool)

(assert (=> bm!19688 (= call!19691 call!19692)))

(declare-fun b!195017 () Bool)

(declare-fun c!35260 () Bool)

(assert (=> b!195017 (= c!35260 (and ((_ is Cons!2404) (toList!1226 lt!96869)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96869))) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(declare-fun e!128274 () List!2408)

(assert (=> b!195017 (= e!128274 e!128275)))

(declare-fun b!195018 () Bool)

(assert (=> b!195018 (= e!128274 call!19692)))

(declare-fun b!195019 () Bool)

(declare-fun e!128273 () List!2408)

(assert (=> b!195019 (= e!128273 e!128274)))

(declare-fun c!35258 () Bool)

(assert (=> b!195019 (= c!35258 (and ((_ is Cons!2404) (toList!1226 lt!96869)) (= (_1!1761 (h!3045 (toList!1226 lt!96869))) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(declare-fun b!195021 () Bool)

(assert (=> b!195021 (= e!128275 call!19691)))

(declare-fun c!35261 () Bool)

(declare-fun bm!19689 () Bool)

(assert (=> bm!19689 (= call!19690 ($colon$colon!102 e!128271 (ite c!35261 (h!3045 (toList!1226 lt!96869)) (tuple2!3501 (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35259 () Bool)

(assert (=> bm!19689 (= c!35259 c!35261)))

(declare-fun b!195022 () Bool)

(assert (=> b!195022 (= e!128273 call!19690)))

(declare-fun b!195020 () Bool)

(assert (=> b!195020 (= e!128271 (ite c!35258 (t!7326 (toList!1226 lt!96869)) (ite c!35260 (Cons!2404 (h!3045 (toList!1226 lt!96869)) (t!7326 (toList!1226 lt!96869))) Nil!2405)))))

(declare-fun d!57217 () Bool)

(assert (=> d!57217 e!128272))

(declare-fun res!92130 () Bool)

(assert (=> d!57217 (=> (not res!92130) (not e!128272))))

(assert (=> d!57217 (= res!92130 (isStrictlySorted!344 lt!97305))))

(assert (=> d!57217 (= lt!97305 e!128273)))

(assert (=> d!57217 (= c!35261 (and ((_ is Cons!2404) (toList!1226 lt!96869)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96869))) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))))))))

(assert (=> d!57217 (isStrictlySorted!344 (toList!1226 lt!96869))))

(assert (=> d!57217 (= (insertStrictlySorted!136 (toList!1226 lt!96869) (_1!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248)))) lt!97305)))

(assert (= (and d!57217 c!35261) b!195022))

(assert (= (and d!57217 (not c!35261)) b!195019))

(assert (= (and b!195019 c!35258) b!195018))

(assert (= (and b!195019 (not c!35258)) b!195017))

(assert (= (and b!195017 c!35260) b!195021))

(assert (= (and b!195017 (not c!35260)) b!195015))

(assert (= (or b!195021 b!195015) bm!19688))

(assert (= (or b!195018 bm!19688) bm!19687))

(assert (= (or b!195022 bm!19687) bm!19689))

(assert (= (and bm!19689 c!35259) b!195014))

(assert (= (and bm!19689 (not c!35259)) b!195020))

(assert (= (and d!57217 res!92130) b!195016))

(assert (= (and b!195016 res!92129) b!195013))

(declare-fun m!222411 () Bool)

(assert (=> b!195016 m!222411))

(declare-fun m!222413 () Bool)

(assert (=> b!195014 m!222413))

(declare-fun m!222415 () Bool)

(assert (=> bm!19689 m!222415))

(declare-fun m!222417 () Bool)

(assert (=> b!195013 m!222417))

(declare-fun m!222419 () Bool)

(assert (=> d!57217 m!222419))

(declare-fun m!222421 () Bool)

(assert (=> d!57217 m!222421))

(assert (=> d!56849 d!57217))

(assert (=> d!56927 d!56929))

(assert (=> d!56927 d!56931))

(declare-fun d!57219 () Bool)

(assert (=> d!57219 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96700) key!828))))

(assert (=> d!57219 true))

(declare-fun _$12!450 () Unit!5858)

(assert (=> d!57219 (= (choose!1077 (toList!1226 lt!96700) key!828) _$12!450)))

(declare-fun bs!7795 () Bool)

(assert (= bs!7795 d!57219))

(assert (=> bs!7795 m!221035))

(assert (=> bs!7795 m!221035))

(assert (=> bs!7795 m!221037))

(assert (=> d!56927 d!57219))

(assert (=> d!56927 d!57027))

(declare-fun d!57221 () Bool)

(assert (=> d!57221 (= (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) lt!96900)) (v!4257 (getValueByKey!246 (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) lt!96900)))))

(assert (=> d!56773 d!57221))

(declare-fun b!195024 () Bool)

(declare-fun e!128276 () Option!252)

(declare-fun e!128277 () Option!252)

(assert (=> b!195024 (= e!128276 e!128277)))

(declare-fun c!35263 () Bool)

(assert (=> b!195024 (= c!35263 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))) (not (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))) lt!96900))))))

(declare-fun b!195026 () Bool)

(assert (=> b!195026 (= e!128277 None!250)))

(declare-fun c!35262 () Bool)

(declare-fun d!57223 () Bool)

(assert (=> d!57223 (= c!35262 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))) lt!96900)))))

(assert (=> d!57223 (= (getValueByKey!246 (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) lt!96900) e!128276)))

(declare-fun b!195025 () Bool)

(assert (=> b!195025 (= e!128277 (getValueByKey!246 (t!7326 (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))) lt!96900))))

(declare-fun b!195023 () Bool)

(assert (=> b!195023 (= e!128276 (Some!251 (_2!1761 (h!3045 (toList!1226 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))))

(assert (= (and d!57223 c!35262) b!195023))

(assert (= (and d!57223 (not c!35262)) b!195024))

(assert (= (and b!195024 c!35263) b!195025))

(assert (= (and b!195024 (not c!35263)) b!195026))

(declare-fun m!222423 () Bool)

(assert (=> b!195025 m!222423))

(assert (=> d!56773 d!57223))

(assert (=> b!194484 d!57163))

(declare-fun b!195028 () Bool)

(declare-fun e!128278 () Option!252)

(declare-fun e!128279 () Option!252)

(assert (=> b!195028 (= e!128278 e!128279)))

(declare-fun c!35265 () Bool)

(assert (=> b!195028 (= c!35265 (and ((_ is Cons!2404) (toList!1226 lt!96975)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96975))) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195030 () Bool)

(assert (=> b!195030 (= e!128279 None!250)))

(declare-fun d!57225 () Bool)

(declare-fun c!35264 () Bool)

(assert (=> d!57225 (= c!35264 (and ((_ is Cons!2404) (toList!1226 lt!96975)) (= (_1!1761 (h!3045 (toList!1226 lt!96975))) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(assert (=> d!57225 (= (getValueByKey!246 (toList!1226 lt!96975) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) e!128278)))

(declare-fun b!195029 () Bool)

(assert (=> b!195029 (= e!128279 (getValueByKey!246 (t!7326 (toList!1226 lt!96975)) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun b!195027 () Bool)

(assert (=> b!195027 (= e!128278 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96975)))))))

(assert (= (and d!57225 c!35264) b!195027))

(assert (= (and d!57225 (not c!35264)) b!195028))

(assert (= (and b!195028 c!35265) b!195029))

(assert (= (and b!195028 (not c!35265)) b!195030))

(declare-fun m!222425 () Bool)

(assert (=> b!195029 m!222425))

(assert (=> b!194311 d!57225))

(declare-fun d!57227 () Bool)

(declare-fun e!128280 () Bool)

(assert (=> d!57227 e!128280))

(declare-fun res!92132 () Bool)

(assert (=> d!57227 (=> (not res!92132) (not e!128280))))

(declare-fun lt!97306 () ListLongMap!2421)

(assert (=> d!57227 (= res!92132 (contains!1363 lt!97306 (_1!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))))))

(declare-fun lt!97308 () List!2408)

(assert (=> d!57227 (= lt!97306 (ListLongMap!2422 lt!97308))))

(declare-fun lt!97309 () Unit!5858)

(declare-fun lt!97307 () Unit!5858)

(assert (=> d!57227 (= lt!97309 lt!97307)))

(assert (=> d!57227 (= (getValueByKey!246 lt!97308 (_1!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))) (Some!251 (_2!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))))))

(assert (=> d!57227 (= lt!97307 (lemmaContainsTupThenGetReturnValue!133 lt!97308 (_1!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))) (_2!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))))))

(assert (=> d!57227 (= lt!97308 (insertStrictlySorted!136 (toList!1226 (ite c!35137 call!19667 (ite c!35136 call!19664 call!19668))) (_1!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))) (_2!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))))))

(assert (=> d!57227 (= (+!319 (ite c!35137 call!19667 (ite c!35136 call!19664 call!19668)) (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))) lt!97306)))

(declare-fun b!195031 () Bool)

(declare-fun res!92131 () Bool)

(assert (=> b!195031 (=> (not res!92131) (not e!128280))))

(assert (=> b!195031 (= res!92131 (= (getValueByKey!246 (toList!1226 lt!97306) (_1!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692))))) (Some!251 (_2!1761 (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))))))))

(declare-fun b!195032 () Bool)

(assert (=> b!195032 (= e!128280 (contains!1365 (toList!1226 lt!97306) (ite (or c!35137 c!35136) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96692)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96692)))))))

(assert (= (and d!57227 res!92132) b!195031))

(assert (= (and b!195031 res!92131) b!195032))

(declare-fun m!222427 () Bool)

(assert (=> d!57227 m!222427))

(declare-fun m!222429 () Bool)

(assert (=> d!57227 m!222429))

(declare-fun m!222431 () Bool)

(assert (=> d!57227 m!222431))

(declare-fun m!222433 () Bool)

(assert (=> d!57227 m!222433))

(declare-fun m!222435 () Bool)

(assert (=> b!195031 m!222435))

(declare-fun m!222437 () Bool)

(assert (=> b!195032 m!222437))

(assert (=> bm!19664 d!57227))

(declare-fun d!57229 () Bool)

(assert (=> d!57229 (= ($colon$colon!102 e!128051 (ite c!35159 (h!3045 (toList!1226 (map!2018 thiss!1248))) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690)))) (Cons!2404 (ite c!35159 (h!3045 (toList!1226 (map!2018 thiss!1248))) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))) e!128051))))

(assert (=> bm!19676 d!57229))

(declare-fun b!195034 () Bool)

(declare-fun e!128281 () Option!252)

(declare-fun e!128282 () Option!252)

(assert (=> b!195034 (= e!128281 e!128282)))

(declare-fun c!35267 () Bool)

(assert (=> b!195034 (= c!35267 (and ((_ is Cons!2404) (toList!1226 lt!96952)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96952))) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195036 () Bool)

(assert (=> b!195036 (= e!128282 None!250)))

(declare-fun d!57231 () Bool)

(declare-fun c!35266 () Bool)

(assert (=> d!57231 (= c!35266 (and ((_ is Cons!2404) (toList!1226 lt!96952)) (= (_1!1761 (h!3045 (toList!1226 lt!96952))) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(assert (=> d!57231 (= (getValueByKey!246 (toList!1226 lt!96952) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) e!128281)))

(declare-fun b!195035 () Bool)

(assert (=> b!195035 (= e!128282 (getValueByKey!246 (t!7326 (toList!1226 lt!96952)) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun b!195033 () Bool)

(assert (=> b!195033 (= e!128281 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96952)))))))

(assert (= (and d!57231 c!35266) b!195033))

(assert (= (and d!57231 (not c!35266)) b!195034))

(assert (= (and b!195034 c!35267) b!195035))

(assert (= (and b!195034 (not c!35267)) b!195036))

(declare-fun m!222439 () Bool)

(assert (=> b!195035 m!222439))

(assert (=> b!194296 d!57231))

(declare-fun d!57233 () Bool)

(declare-fun e!128283 () Bool)

(assert (=> d!57233 e!128283))

(declare-fun res!92134 () Bool)

(assert (=> d!57233 (=> (not res!92134) (not e!128283))))

(declare-fun lt!97310 () ListLongMap!2421)

(assert (=> d!57233 (= res!92134 (contains!1363 lt!97310 (_1!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!97312 () List!2408)

(assert (=> d!57233 (= lt!97310 (ListLongMap!2422 lt!97312))))

(declare-fun lt!97313 () Unit!5858)

(declare-fun lt!97311 () Unit!5858)

(assert (=> d!57233 (= lt!97313 lt!97311)))

(assert (=> d!57233 (= (getValueByKey!246 lt!97312 (_1!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!251 (_2!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57233 (= lt!97311 (lemmaContainsTupThenGetReturnValue!133 lt!97312 (_1!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57233 (= lt!97312 (insertStrictlySorted!136 (toList!1226 (ite c!35097 call!19653 (ite c!35096 call!19650 call!19654))) (_1!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57233 (= (+!319 (ite c!35097 call!19653 (ite c!35096 call!19650 call!19654)) (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97310)))

(declare-fun b!195037 () Bool)

(declare-fun res!92133 () Bool)

(assert (=> b!195037 (=> (not res!92133) (not e!128283))))

(assert (=> b!195037 (= res!92133 (= (getValueByKey!246 (toList!1226 lt!97310) (_1!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!251 (_2!1761 (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195038 () Bool)

(assert (=> b!195038 (= e!128283 (contains!1365 (toList!1226 lt!97310) (ite (or c!35097 c!35096) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!57233 res!92134) b!195037))

(assert (= (and b!195037 res!92133) b!195038))

(declare-fun m!222441 () Bool)

(assert (=> d!57233 m!222441))

(declare-fun m!222443 () Bool)

(assert (=> d!57233 m!222443))

(declare-fun m!222445 () Bool)

(assert (=> d!57233 m!222445))

(declare-fun m!222447 () Bool)

(assert (=> d!57233 m!222447))

(declare-fun m!222449 () Bool)

(assert (=> b!195037 m!222449))

(declare-fun m!222451 () Bool)

(assert (=> b!195038 m!222451))

(assert (=> bm!19650 d!57233))

(declare-fun d!57235 () Bool)

(declare-fun e!128285 () Bool)

(assert (=> d!57235 e!128285))

(declare-fun res!92135 () Bool)

(assert (=> d!57235 (=> res!92135 e!128285)))

(declare-fun lt!97315 () Bool)

(assert (=> d!57235 (= res!92135 (not lt!97315))))

(declare-fun lt!97317 () Bool)

(assert (=> d!57235 (= lt!97315 lt!97317)))

(declare-fun lt!97314 () Unit!5858)

(declare-fun e!128284 () Unit!5858)

(assert (=> d!57235 (= lt!97314 e!128284)))

(declare-fun c!35268 () Bool)

(assert (=> d!57235 (= c!35268 lt!97317)))

(assert (=> d!57235 (= lt!97317 (containsKey!249 (toList!1226 lt!97019) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57235 (= (contains!1363 lt!97019 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97315)))

(declare-fun b!195039 () Bool)

(declare-fun lt!97316 () Unit!5858)

(assert (=> b!195039 (= e!128284 lt!97316)))

(assert (=> b!195039 (= lt!97316 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97019) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> b!195039 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97019) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195040 () Bool)

(declare-fun Unit!5893 () Unit!5858)

(assert (=> b!195040 (= e!128284 Unit!5893)))

(declare-fun b!195041 () Bool)

(assert (=> b!195041 (= e!128285 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97019) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57235 c!35268) b!195039))

(assert (= (and d!57235 (not c!35268)) b!195040))

(assert (= (and d!57235 (not res!92135)) b!195041))

(declare-fun m!222453 () Bool)

(assert (=> d!57235 m!222453))

(declare-fun m!222455 () Bool)

(assert (=> b!195039 m!222455))

(assert (=> b!195039 m!221433))

(assert (=> b!195039 m!221433))

(declare-fun m!222457 () Bool)

(assert (=> b!195039 m!222457))

(assert (=> b!195041 m!221433))

(assert (=> b!195041 m!221433))

(assert (=> b!195041 m!222457))

(assert (=> d!56811 d!57235))

(declare-fun b!195043 () Bool)

(declare-fun e!128286 () Option!252)

(declare-fun e!128287 () Option!252)

(assert (=> b!195043 (= e!128286 e!128287)))

(declare-fun c!35270 () Bool)

(assert (=> b!195043 (= c!35270 (and ((_ is Cons!2404) lt!97021) (not (= (_1!1761 (h!3045 lt!97021)) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195045 () Bool)

(assert (=> b!195045 (= e!128287 None!250)))

(declare-fun d!57237 () Bool)

(declare-fun c!35269 () Bool)

(assert (=> d!57237 (= c!35269 (and ((_ is Cons!2404) lt!97021) (= (_1!1761 (h!3045 lt!97021)) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57237 (= (getValueByKey!246 lt!97021 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) e!128286)))

(declare-fun b!195044 () Bool)

(assert (=> b!195044 (= e!128287 (getValueByKey!246 (t!7326 lt!97021) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195042 () Bool)

(assert (=> b!195042 (= e!128286 (Some!251 (_2!1761 (h!3045 lt!97021))))))

(assert (= (and d!57237 c!35269) b!195042))

(assert (= (and d!57237 (not c!35269)) b!195043))

(assert (= (and b!195043 c!35270) b!195044))

(assert (= (and b!195043 (not c!35270)) b!195045))

(declare-fun m!222459 () Bool)

(assert (=> b!195044 m!222459))

(assert (=> d!56811 d!57237))

(declare-fun d!57239 () Bool)

(assert (=> d!57239 (= (getValueByKey!246 lt!97021 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97318 () Unit!5858)

(assert (=> d!57239 (= lt!97318 (choose!1076 lt!97021 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun e!128288 () Bool)

(assert (=> d!57239 e!128288))

(declare-fun res!92136 () Bool)

(assert (=> d!57239 (=> (not res!92136) (not e!128288))))

(assert (=> d!57239 (= res!92136 (isStrictlySorted!344 lt!97021))))

(assert (=> d!57239 (= (lemmaContainsTupThenGetReturnValue!133 lt!97021 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97318)))

(declare-fun b!195046 () Bool)

(declare-fun res!92137 () Bool)

(assert (=> b!195046 (=> (not res!92137) (not e!128288))))

(assert (=> b!195046 (= res!92137 (containsKey!249 lt!97021 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195047 () Bool)

(assert (=> b!195047 (= e!128288 (contains!1365 lt!97021 (tuple2!3501 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57239 res!92136) b!195046))

(assert (= (and b!195046 res!92137) b!195047))

(assert (=> d!57239 m!221427))

(declare-fun m!222461 () Bool)

(assert (=> d!57239 m!222461))

(declare-fun m!222463 () Bool)

(assert (=> d!57239 m!222463))

(declare-fun m!222465 () Bool)

(assert (=> b!195046 m!222465))

(declare-fun m!222467 () Bool)

(assert (=> b!195047 m!222467))

(assert (=> d!56811 d!57239))

(declare-fun b!195048 () Bool)

(declare-fun e!128290 () Bool)

(declare-fun lt!97319 () List!2408)

(assert (=> b!195048 (= e!128290 (contains!1365 lt!97319 (tuple2!3501 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun bm!19690 () Bool)

(declare-fun call!19695 () List!2408)

(declare-fun call!19693 () List!2408)

(assert (=> bm!19690 (= call!19695 call!19693)))

(declare-fun b!195049 () Bool)

(declare-fun e!128289 () List!2408)

(assert (=> b!195049 (= e!128289 (insertStrictlySorted!136 (t!7326 (toList!1226 call!19613)) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195050 () Bool)

(declare-fun e!128293 () List!2408)

(declare-fun call!19694 () List!2408)

(assert (=> b!195050 (= e!128293 call!19694)))

(declare-fun b!195051 () Bool)

(declare-fun res!92138 () Bool)

(assert (=> b!195051 (=> (not res!92138) (not e!128290))))

(assert (=> b!195051 (= res!92138 (containsKey!249 lt!97319 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19691 () Bool)

(assert (=> bm!19691 (= call!19694 call!19695)))

(declare-fun b!195052 () Bool)

(declare-fun c!35273 () Bool)

(assert (=> b!195052 (= c!35273 (and ((_ is Cons!2404) (toList!1226 call!19613)) (bvsgt (_1!1761 (h!3045 (toList!1226 call!19613))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128292 () List!2408)

(assert (=> b!195052 (= e!128292 e!128293)))

(declare-fun b!195053 () Bool)

(assert (=> b!195053 (= e!128292 call!19695)))

(declare-fun b!195054 () Bool)

(declare-fun e!128291 () List!2408)

(assert (=> b!195054 (= e!128291 e!128292)))

(declare-fun c!35271 () Bool)

(assert (=> b!195054 (= c!35271 (and ((_ is Cons!2404) (toList!1226 call!19613)) (= (_1!1761 (h!3045 (toList!1226 call!19613))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195056 () Bool)

(assert (=> b!195056 (= e!128293 call!19694)))

(declare-fun bm!19692 () Bool)

(declare-fun c!35274 () Bool)

(assert (=> bm!19692 (= call!19693 ($colon$colon!102 e!128289 (ite c!35274 (h!3045 (toList!1226 call!19613)) (tuple2!3501 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35272 () Bool)

(assert (=> bm!19692 (= c!35272 c!35274)))

(declare-fun b!195057 () Bool)

(assert (=> b!195057 (= e!128291 call!19693)))

(declare-fun b!195055 () Bool)

(assert (=> b!195055 (= e!128289 (ite c!35271 (t!7326 (toList!1226 call!19613)) (ite c!35273 (Cons!2404 (h!3045 (toList!1226 call!19613)) (t!7326 (toList!1226 call!19613))) Nil!2405)))))

(declare-fun d!57241 () Bool)

(assert (=> d!57241 e!128290))

(declare-fun res!92139 () Bool)

(assert (=> d!57241 (=> (not res!92139) (not e!128290))))

(assert (=> d!57241 (= res!92139 (isStrictlySorted!344 lt!97319))))

(assert (=> d!57241 (= lt!97319 e!128291)))

(assert (=> d!57241 (= c!35274 (and ((_ is Cons!2404) (toList!1226 call!19613)) (bvslt (_1!1761 (h!3045 (toList!1226 call!19613))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57241 (isStrictlySorted!344 (toList!1226 call!19613))))

(assert (=> d!57241 (= (insertStrictlySorted!136 (toList!1226 call!19613) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97319)))

(assert (= (and d!57241 c!35274) b!195057))

(assert (= (and d!57241 (not c!35274)) b!195054))

(assert (= (and b!195054 c!35271) b!195053))

(assert (= (and b!195054 (not c!35271)) b!195052))

(assert (= (and b!195052 c!35273) b!195056))

(assert (= (and b!195052 (not c!35273)) b!195050))

(assert (= (or b!195056 b!195050) bm!19691))

(assert (= (or b!195053 bm!19691) bm!19690))

(assert (= (or b!195057 bm!19690) bm!19692))

(assert (= (and bm!19692 c!35272) b!195049))

(assert (= (and bm!19692 (not c!35272)) b!195055))

(assert (= (and d!57241 res!92139) b!195051))

(assert (= (and b!195051 res!92138) b!195048))

(declare-fun m!222469 () Bool)

(assert (=> b!195051 m!222469))

(declare-fun m!222471 () Bool)

(assert (=> b!195049 m!222471))

(declare-fun m!222473 () Bool)

(assert (=> bm!19692 m!222473))

(declare-fun m!222475 () Bool)

(assert (=> b!195048 m!222475))

(declare-fun m!222477 () Bool)

(assert (=> d!57241 m!222477))

(declare-fun m!222479 () Bool)

(assert (=> d!57241 m!222479))

(assert (=> d!56811 d!57241))

(declare-fun d!57243 () Bool)

(assert (=> d!57243 (= (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) lt!96916)) (v!4257 (getValueByKey!246 (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) lt!96916)))))

(assert (=> d!56781 d!57243))

(declare-fun b!195059 () Bool)

(declare-fun e!128294 () Option!252)

(declare-fun e!128295 () Option!252)

(assert (=> b!195059 (= e!128294 e!128295)))

(declare-fun c!35276 () Bool)

(assert (=> b!195059 (= c!35276 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))) (not (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))) lt!96916))))))

(declare-fun b!195061 () Bool)

(assert (=> b!195061 (= e!128295 None!250)))

(declare-fun c!35275 () Bool)

(declare-fun d!57245 () Bool)

(assert (=> d!57245 (= c!35275 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))) lt!96916)))))

(assert (=> d!57245 (= (getValueByKey!246 (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) lt!96916) e!128294)))

(declare-fun b!195060 () Bool)

(assert (=> b!195060 (= e!128295 (getValueByKey!246 (t!7326 (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))) lt!96916))))

(declare-fun b!195058 () Bool)

(assert (=> b!195058 (= e!128294 (Some!251 (_2!1761 (h!3045 (toList!1226 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))))

(assert (= (and d!57245 c!35275) b!195058))

(assert (= (and d!57245 (not c!35275)) b!195059))

(assert (= (and b!195059 c!35276) b!195060))

(assert (= (and b!195059 (not c!35276)) b!195061))

(declare-fun m!222481 () Bool)

(assert (=> b!195060 m!222481))

(assert (=> d!56781 d!57245))

(assert (=> d!56829 d!56725))

(declare-fun d!57247 () Bool)

(declare-fun e!128297 () Bool)

(assert (=> d!57247 e!128297))

(declare-fun res!92140 () Bool)

(assert (=> d!57247 (=> res!92140 e!128297)))

(declare-fun lt!97321 () Bool)

(assert (=> d!57247 (= res!92140 (not lt!97321))))

(declare-fun lt!97323 () Bool)

(assert (=> d!57247 (= lt!97321 lt!97323)))

(declare-fun lt!97320 () Unit!5858)

(declare-fun e!128296 () Unit!5858)

(assert (=> d!57247 (= lt!97320 e!128296)))

(declare-fun c!35277 () Bool)

(assert (=> d!57247 (= c!35277 lt!97323)))

(assert (=> d!57247 (= lt!97323 (containsKey!249 (toList!1226 lt!96950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57247 (= (contains!1363 lt!96950 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97321)))

(declare-fun b!195062 () Bool)

(declare-fun lt!97322 () Unit!5858)

(assert (=> b!195062 (= e!128296 lt!97322)))

(assert (=> b!195062 (= lt!97322 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195062 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96950) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195063 () Bool)

(declare-fun Unit!5894 () Unit!5858)

(assert (=> b!195063 (= e!128296 Unit!5894)))

(declare-fun b!195064 () Bool)

(assert (=> b!195064 (= e!128297 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96950) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57247 c!35277) b!195062))

(assert (= (and d!57247 (not c!35277)) b!195063))

(assert (= (and d!57247 (not res!92140)) b!195064))

(declare-fun m!222483 () Bool)

(assert (=> d!57247 m!222483))

(declare-fun m!222485 () Bool)

(assert (=> b!195062 m!222485))

(declare-fun m!222487 () Bool)

(assert (=> b!195062 m!222487))

(assert (=> b!195062 m!222487))

(declare-fun m!222489 () Bool)

(assert (=> b!195062 m!222489))

(assert (=> b!195064 m!222487))

(assert (=> b!195064 m!222487))

(assert (=> b!195064 m!222489))

(assert (=> d!56751 d!57247))

(assert (=> d!56751 d!56831))

(declare-fun d!57249 () Bool)

(declare-fun e!128299 () Bool)

(assert (=> d!57249 e!128299))

(declare-fun res!92141 () Bool)

(assert (=> d!57249 (=> res!92141 e!128299)))

(declare-fun lt!97325 () Bool)

(assert (=> d!57249 (= res!92141 (not lt!97325))))

(declare-fun lt!97327 () Bool)

(assert (=> d!57249 (= lt!97325 lt!97327)))

(declare-fun lt!97324 () Unit!5858)

(declare-fun e!128298 () Unit!5858)

(assert (=> d!57249 (= lt!97324 e!128298)))

(declare-fun c!35278 () Bool)

(assert (=> d!57249 (= c!35278 lt!97327)))

(assert (=> d!57249 (= lt!97327 (containsKey!249 (toList!1226 lt!97118) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57249 (= (contains!1363 lt!97118 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97325)))

(declare-fun b!195065 () Bool)

(declare-fun lt!97326 () Unit!5858)

(assert (=> b!195065 (= e!128298 lt!97326)))

(assert (=> b!195065 (= lt!97326 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97118) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195065 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97118) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195066 () Bool)

(declare-fun Unit!5895 () Unit!5858)

(assert (=> b!195066 (= e!128298 Unit!5895)))

(declare-fun b!195067 () Bool)

(assert (=> b!195067 (= e!128299 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97118) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57249 c!35278) b!195065))

(assert (= (and d!57249 (not c!35278)) b!195066))

(assert (= (and d!57249 (not res!92141)) b!195067))

(declare-fun m!222491 () Bool)

(assert (=> d!57249 m!222491))

(declare-fun m!222493 () Bool)

(assert (=> b!195065 m!222493))

(assert (=> b!195065 m!221997))

(assert (=> b!195065 m!221997))

(declare-fun m!222495 () Bool)

(assert (=> b!195065 m!222495))

(assert (=> b!195067 m!221997))

(assert (=> b!195067 m!221997))

(assert (=> b!195067 m!222495))

(assert (=> bm!19661 d!57249))

(declare-fun d!57251 () Bool)

(declare-fun e!128301 () Bool)

(assert (=> d!57251 e!128301))

(declare-fun res!92142 () Bool)

(assert (=> d!57251 (=> res!92142 e!128301)))

(declare-fun lt!97329 () Bool)

(assert (=> d!57251 (= res!92142 (not lt!97329))))

(declare-fun lt!97331 () Bool)

(assert (=> d!57251 (= lt!97329 lt!97331)))

(declare-fun lt!97328 () Unit!5858)

(declare-fun e!128300 () Unit!5858)

(assert (=> d!57251 (= lt!97328 e!128300)))

(declare-fun c!35279 () Bool)

(assert (=> d!57251 (= c!35279 lt!97331)))

(assert (=> d!57251 (= lt!97331 (containsKey!249 (toList!1226 lt!97036) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57251 (= (contains!1363 lt!97036 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97329)))

(declare-fun b!195068 () Bool)

(declare-fun lt!97330 () Unit!5858)

(assert (=> b!195068 (= e!128300 lt!97330)))

(assert (=> b!195068 (= lt!97330 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97036) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195068 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97036) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195069 () Bool)

(declare-fun Unit!5896 () Unit!5858)

(assert (=> b!195069 (= e!128300 Unit!5896)))

(declare-fun b!195070 () Bool)

(assert (=> b!195070 (= e!128301 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57251 c!35279) b!195068))

(assert (= (and d!57251 (not c!35279)) b!195069))

(assert (= (and d!57251 (not res!92142)) b!195070))

(declare-fun m!222497 () Bool)

(assert (=> d!57251 m!222497))

(declare-fun m!222499 () Bool)

(assert (=> b!195068 m!222499))

(assert (=> b!195068 m!221879))

(assert (=> b!195068 m!221879))

(declare-fun m!222501 () Bool)

(assert (=> b!195068 m!222501))

(assert (=> b!195070 m!221879))

(assert (=> b!195070 m!221879))

(assert (=> b!195070 m!222501))

(assert (=> bm!19647 d!57251))

(assert (=> d!56893 d!56813))

(assert (=> d!56893 d!56729))

(assert (=> d!56893 d!56815))

(declare-fun d!57253 () Bool)

(declare-fun e!128303 () Bool)

(assert (=> d!57253 e!128303))

(declare-fun res!92143 () Bool)

(assert (=> d!57253 (=> res!92143 e!128303)))

(declare-fun lt!97333 () Bool)

(assert (=> d!57253 (= res!92143 (not lt!97333))))

(declare-fun lt!97335 () Bool)

(assert (=> d!57253 (= lt!97333 lt!97335)))

(declare-fun lt!97332 () Unit!5858)

(declare-fun e!128302 () Unit!5858)

(assert (=> d!57253 (= lt!97332 e!128302)))

(declare-fun c!35280 () Bool)

(assert (=> d!57253 (= c!35280 lt!97335)))

(assert (=> d!57253 (= lt!97335 (containsKey!249 (toList!1226 lt!97080) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57253 (= (contains!1363 lt!97080 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) lt!97333)))

(declare-fun b!195071 () Bool)

(declare-fun lt!97334 () Unit!5858)

(assert (=> b!195071 (= e!128302 lt!97334)))

(assert (=> b!195071 (= lt!97334 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97080) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(assert (=> b!195071 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97080) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195072 () Bool)

(declare-fun Unit!5897 () Unit!5858)

(assert (=> b!195072 (= e!128302 Unit!5897)))

(declare-fun b!195073 () Bool)

(assert (=> b!195073 (= e!128303 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97080) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57253 c!35280) b!195071))

(assert (= (and d!57253 (not c!35280)) b!195072))

(assert (= (and d!57253 (not res!92143)) b!195073))

(declare-fun m!222503 () Bool)

(assert (=> d!57253 m!222503))

(declare-fun m!222505 () Bool)

(assert (=> b!195071 m!222505))

(assert (=> b!195071 m!221589))

(assert (=> b!195071 m!221589))

(declare-fun m!222507 () Bool)

(assert (=> b!195071 m!222507))

(assert (=> b!195073 m!221589))

(assert (=> b!195073 m!221589))

(assert (=> b!195073 m!222507))

(assert (=> d!56853 d!57253))

(declare-fun b!195075 () Bool)

(declare-fun e!128304 () Option!252)

(declare-fun e!128305 () Option!252)

(assert (=> b!195075 (= e!128304 e!128305)))

(declare-fun c!35282 () Bool)

(assert (=> b!195075 (= c!35282 (and ((_ is Cons!2404) lt!97082) (not (= (_1!1761 (h!3045 lt!97082)) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!195077 () Bool)

(assert (=> b!195077 (= e!128305 None!250)))

(declare-fun c!35281 () Bool)

(declare-fun d!57255 () Bool)

(assert (=> d!57255 (= c!35281 (and ((_ is Cons!2404) lt!97082) (= (_1!1761 (h!3045 lt!97082)) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57255 (= (getValueByKey!246 lt!97082 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) e!128304)))

(declare-fun b!195076 () Bool)

(assert (=> b!195076 (= e!128305 (getValueByKey!246 (t!7326 lt!97082) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195074 () Bool)

(assert (=> b!195074 (= e!128304 (Some!251 (_2!1761 (h!3045 lt!97082))))))

(assert (= (and d!57255 c!35281) b!195074))

(assert (= (and d!57255 (not c!35281)) b!195075))

(assert (= (and b!195075 c!35282) b!195076))

(assert (= (and b!195075 (not c!35282)) b!195077))

(declare-fun m!222509 () Bool)

(assert (=> b!195076 m!222509))

(assert (=> d!56853 d!57255))

(declare-fun d!57257 () Bool)

(assert (=> d!57257 (= (getValueByKey!246 lt!97082 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97336 () Unit!5858)

(assert (=> d!57257 (= lt!97336 (choose!1076 lt!97082 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun e!128306 () Bool)

(assert (=> d!57257 e!128306))

(declare-fun res!92144 () Bool)

(assert (=> d!57257 (=> (not res!92144) (not e!128306))))

(assert (=> d!57257 (= res!92144 (isStrictlySorted!344 lt!97082))))

(assert (=> d!57257 (= (lemmaContainsTupThenGetReturnValue!133 lt!97082 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) lt!97336)))

(declare-fun b!195078 () Bool)

(declare-fun res!92145 () Bool)

(assert (=> b!195078 (=> (not res!92145) (not e!128306))))

(assert (=> b!195078 (= res!92145 (containsKey!249 lt!97082 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195079 () Bool)

(assert (=> b!195079 (= e!128306 (contains!1365 lt!97082 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57257 res!92144) b!195078))

(assert (= (and b!195078 res!92145) b!195079))

(assert (=> d!57257 m!221583))

(declare-fun m!222511 () Bool)

(assert (=> d!57257 m!222511))

(declare-fun m!222513 () Bool)

(assert (=> d!57257 m!222513))

(declare-fun m!222515 () Bool)

(assert (=> b!195078 m!222515))

(declare-fun m!222517 () Bool)

(assert (=> b!195079 m!222517))

(assert (=> d!56853 d!57257))

(declare-fun b!195080 () Bool)

(declare-fun e!128308 () Bool)

(declare-fun lt!97337 () List!2408)

(assert (=> b!195080 (= e!128308 (contains!1365 lt!97337 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(declare-fun bm!19693 () Bool)

(declare-fun call!19698 () List!2408)

(declare-fun call!19696 () List!2408)

(assert (=> bm!19693 (= call!19698 call!19696)))

(declare-fun e!128307 () List!2408)

(declare-fun b!195081 () Bool)

(assert (=> b!195081 (= e!128307 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96875)) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195082 () Bool)

(declare-fun e!128311 () List!2408)

(declare-fun call!19697 () List!2408)

(assert (=> b!195082 (= e!128311 call!19697)))

(declare-fun b!195083 () Bool)

(declare-fun res!92146 () Bool)

(assert (=> b!195083 (=> (not res!92146) (not e!128308))))

(assert (=> b!195083 (= res!92146 (containsKey!249 lt!97337 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun bm!19694 () Bool)

(assert (=> bm!19694 (= call!19697 call!19698)))

(declare-fun c!35285 () Bool)

(declare-fun b!195084 () Bool)

(assert (=> b!195084 (= c!35285 (and ((_ is Cons!2404) (toList!1226 lt!96875)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96875))) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128310 () List!2408)

(assert (=> b!195084 (= e!128310 e!128311)))

(declare-fun b!195085 () Bool)

(assert (=> b!195085 (= e!128310 call!19698)))

(declare-fun b!195086 () Bool)

(declare-fun e!128309 () List!2408)

(assert (=> b!195086 (= e!128309 e!128310)))

(declare-fun c!35283 () Bool)

(assert (=> b!195086 (= c!35283 (and ((_ is Cons!2404) (toList!1226 lt!96875)) (= (_1!1761 (h!3045 (toList!1226 lt!96875))) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!195088 () Bool)

(assert (=> b!195088 (= e!128311 call!19697)))

(declare-fun bm!19695 () Bool)

(declare-fun c!35286 () Bool)

(assert (=> bm!19695 (= call!19696 ($colon$colon!102 e!128307 (ite c!35286 (h!3045 (toList!1226 lt!96875)) (tuple2!3501 (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))))

(declare-fun c!35284 () Bool)

(assert (=> bm!19695 (= c!35284 c!35286)))

(declare-fun b!195089 () Bool)

(assert (=> b!195089 (= e!128309 call!19696)))

(declare-fun b!195087 () Bool)

(assert (=> b!195087 (= e!128307 (ite c!35283 (t!7326 (toList!1226 lt!96875)) (ite c!35285 (Cons!2404 (h!3045 (toList!1226 lt!96875)) (t!7326 (toList!1226 lt!96875))) Nil!2405)))))

(declare-fun d!57259 () Bool)

(assert (=> d!57259 e!128308))

(declare-fun res!92147 () Bool)

(assert (=> d!57259 (=> (not res!92147) (not e!128308))))

(assert (=> d!57259 (= res!92147 (isStrictlySorted!344 lt!97337))))

(assert (=> d!57259 (= lt!97337 e!128309)))

(assert (=> d!57259 (= c!35286 (and ((_ is Cons!2404) (toList!1226 lt!96875)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96875))) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57259 (isStrictlySorted!344 (toList!1226 lt!96875))))

(assert (=> d!57259 (= (insertStrictlySorted!136 (toList!1226 lt!96875) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) lt!97337)))

(assert (= (and d!57259 c!35286) b!195089))

(assert (= (and d!57259 (not c!35286)) b!195086))

(assert (= (and b!195086 c!35283) b!195085))

(assert (= (and b!195086 (not c!35283)) b!195084))

(assert (= (and b!195084 c!35285) b!195088))

(assert (= (and b!195084 (not c!35285)) b!195082))

(assert (= (or b!195088 b!195082) bm!19694))

(assert (= (or b!195085 bm!19694) bm!19693))

(assert (= (or b!195089 bm!19693) bm!19695))

(assert (= (and bm!19695 c!35284) b!195081))

(assert (= (and bm!19695 (not c!35284)) b!195087))

(assert (= (and d!57259 res!92147) b!195083))

(assert (= (and b!195083 res!92146) b!195080))

(declare-fun m!222519 () Bool)

(assert (=> b!195083 m!222519))

(declare-fun m!222521 () Bool)

(assert (=> b!195081 m!222521))

(declare-fun m!222523 () Bool)

(assert (=> bm!19695 m!222523))

(declare-fun m!222525 () Bool)

(assert (=> b!195080 m!222525))

(declare-fun m!222527 () Bool)

(assert (=> d!57259 m!222527))

(declare-fun m!222529 () Bool)

(assert (=> d!57259 m!222529))

(assert (=> d!56853 d!57259))

(declare-fun b!195090 () Bool)

(assert (=> b!195090 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> b!195090 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4191 lt!96689)))))

(declare-fun e!128314 () Bool)

(declare-fun lt!97343 () ListLongMap!2421)

(assert (=> b!195090 (= e!128314 (= (apply!188 lt!97343 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!2243 (select (arr!3867 lt!96689) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19696 () Bool)

(declare-fun call!19699 () ListLongMap!2421)

(assert (=> bm!19696 (= call!19699 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!195091 () Bool)

(declare-fun res!92150 () Bool)

(declare-fun e!128317 () Bool)

(assert (=> b!195091 (=> (not res!92150) (not e!128317))))

(assert (=> b!195091 (= res!92150 (not (contains!1363 lt!97343 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128316 () Bool)

(declare-fun b!195092 () Bool)

(assert (=> b!195092 (= e!128316 (= lt!97343 (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(declare-fun d!57261 () Bool)

(assert (=> d!57261 e!128317))

(declare-fun res!92149 () Bool)

(assert (=> d!57261 (=> (not res!92149) (not e!128317))))

(assert (=> d!57261 (= res!92149 (not (contains!1363 lt!97343 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128313 () ListLongMap!2421)

(assert (=> d!57261 (= lt!97343 e!128313)))

(declare-fun c!35288 () Bool)

(assert (=> d!57261 (= c!35288 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!57261 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!57261 (= (getCurrentListMapNoExtraKeys!219 (_keys!5953 thiss!1248) lt!96689 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)) lt!97343)))

(declare-fun b!195093 () Bool)

(declare-fun e!128312 () Bool)

(assert (=> b!195093 (= e!128317 e!128312)))

(declare-fun c!35289 () Bool)

(declare-fun e!128315 () Bool)

(assert (=> b!195093 (= c!35289 e!128315)))

(declare-fun res!92148 () Bool)

(assert (=> b!195093 (=> (not res!92148) (not e!128315))))

(assert (=> b!195093 (= res!92148 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!195094 () Bool)

(assert (=> b!195094 (= e!128313 (ListLongMap!2422 Nil!2405))))

(declare-fun b!195095 () Bool)

(declare-fun e!128318 () ListLongMap!2421)

(assert (=> b!195095 (= e!128313 e!128318)))

(declare-fun c!35290 () Bool)

(assert (=> b!195095 (= c!35290 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195096 () Bool)

(declare-fun lt!97344 () Unit!5858)

(declare-fun lt!97339 () Unit!5858)

(assert (=> b!195096 (= lt!97344 lt!97339)))

(declare-fun lt!97341 () (_ BitVec 64))

(declare-fun lt!97342 () ListLongMap!2421)

(declare-fun lt!97338 () V!5633)

(declare-fun lt!97340 () (_ BitVec 64))

(assert (=> b!195096 (not (contains!1363 (+!319 lt!97342 (tuple2!3501 lt!97341 lt!97338)) lt!97340))))

(assert (=> b!195096 (= lt!97339 (addStillNotContains!99 lt!97342 lt!97341 lt!97338 lt!97340))))

(assert (=> b!195096 (= lt!97340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!195096 (= lt!97338 (get!2243 (select (arr!3867 lt!96689) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195096 (= lt!97341 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!195096 (= lt!97342 call!19699)))

(assert (=> b!195096 (= e!128318 (+!319 call!19699 (tuple2!3501 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!2243 (select (arr!3867 lt!96689) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!195097 () Bool)

(assert (=> b!195097 (= e!128316 (isEmpty!493 lt!97343))))

(declare-fun b!195098 () Bool)

(assert (=> b!195098 (= e!128315 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195098 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!195099 () Bool)

(assert (=> b!195099 (= e!128312 e!128314)))

(assert (=> b!195099 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun res!92151 () Bool)

(assert (=> b!195099 (= res!92151 (contains!1363 lt!97343 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195099 (=> (not res!92151) (not e!128314))))

(declare-fun b!195100 () Bool)

(assert (=> b!195100 (= e!128312 e!128316)))

(declare-fun c!35287 () Bool)

(assert (=> b!195100 (= c!35287 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(declare-fun b!195101 () Bool)

(assert (=> b!195101 (= e!128318 call!19699)))

(assert (= (and d!57261 c!35288) b!195094))

(assert (= (and d!57261 (not c!35288)) b!195095))

(assert (= (and b!195095 c!35290) b!195096))

(assert (= (and b!195095 (not c!35290)) b!195101))

(assert (= (or b!195096 b!195101) bm!19696))

(assert (= (and d!57261 res!92149) b!195091))

(assert (= (and b!195091 res!92150) b!195093))

(assert (= (and b!195093 res!92148) b!195098))

(assert (= (and b!195093 c!35289) b!195099))

(assert (= (and b!195093 (not c!35289)) b!195100))

(assert (= (and b!195099 res!92151) b!195090))

(assert (= (and b!195100 c!35287) b!195092))

(assert (= (and b!195100 (not c!35287)) b!195097))

(declare-fun b_lambda!7543 () Bool)

(assert (=> (not b_lambda!7543) (not b!195090)))

(assert (=> b!195090 t!7329))

(declare-fun b_and!11479 () Bool)

(assert (= b_and!11477 (and (=> t!7329 result!4931) b_and!11479)))

(declare-fun b_lambda!7545 () Bool)

(assert (=> (not b_lambda!7545) (not b!195096)))

(assert (=> b!195096 t!7329))

(declare-fun b_and!11481 () Bool)

(assert (= b_and!11479 (and (=> t!7329 result!4931) b_and!11481)))

(declare-fun m!222531 () Bool)

(assert (=> bm!19696 m!222531))

(assert (=> b!195096 m!221057))

(declare-fun m!222533 () Bool)

(assert (=> b!195096 m!222533))

(declare-fun m!222535 () Bool)

(assert (=> b!195096 m!222535))

(declare-fun m!222537 () Bool)

(assert (=> b!195096 m!222537))

(assert (=> b!195096 m!222537))

(assert (=> b!195096 m!221057))

(declare-fun m!222539 () Bool)

(assert (=> b!195096 m!222539))

(declare-fun m!222541 () Bool)

(assert (=> b!195096 m!222541))

(assert (=> b!195096 m!221933))

(assert (=> b!195096 m!222533))

(declare-fun m!222543 () Bool)

(assert (=> b!195096 m!222543))

(assert (=> b!195095 m!221933))

(assert (=> b!195095 m!221933))

(assert (=> b!195095 m!221937))

(declare-fun m!222545 () Bool)

(assert (=> b!195091 m!222545))

(declare-fun m!222547 () Bool)

(assert (=> d!57261 m!222547))

(assert (=> d!57261 m!221011))

(assert (=> b!195098 m!221933))

(assert (=> b!195098 m!221933))

(assert (=> b!195098 m!221937))

(assert (=> b!195099 m!221933))

(assert (=> b!195099 m!221933))

(declare-fun m!222549 () Bool)

(assert (=> b!195099 m!222549))

(declare-fun m!222551 () Bool)

(assert (=> b!195097 m!222551))

(assert (=> b!195092 m!222531))

(assert (=> b!195090 m!221057))

(assert (=> b!195090 m!221933))

(declare-fun m!222553 () Bool)

(assert (=> b!195090 m!222553))

(assert (=> b!195090 m!222537))

(assert (=> b!195090 m!222537))

(assert (=> b!195090 m!221057))

(assert (=> b!195090 m!222539))

(assert (=> b!195090 m!221933))

(assert (=> b!194286 d!57261))

(declare-fun d!57263 () Bool)

(declare-fun res!92152 () Bool)

(declare-fun e!128319 () Bool)

(assert (=> d!57263 (=> res!92152 e!128319)))

(assert (=> d!57263 (= res!92152 (and ((_ is Cons!2404) lt!96887) (= (_1!1761 (h!3045 lt!96887)) (_1!1761 lt!96690))))))

(assert (=> d!57263 (= (containsKey!249 lt!96887 (_1!1761 lt!96690)) e!128319)))

(declare-fun b!195102 () Bool)

(declare-fun e!128320 () Bool)

(assert (=> b!195102 (= e!128319 e!128320)))

(declare-fun res!92153 () Bool)

(assert (=> b!195102 (=> (not res!92153) (not e!128320))))

(assert (=> b!195102 (= res!92153 (and (or (not ((_ is Cons!2404) lt!96887)) (bvsle (_1!1761 (h!3045 lt!96887)) (_1!1761 lt!96690))) ((_ is Cons!2404) lt!96887) (bvslt (_1!1761 (h!3045 lt!96887)) (_1!1761 lt!96690))))))

(declare-fun b!195103 () Bool)

(assert (=> b!195103 (= e!128320 (containsKey!249 (t!7326 lt!96887) (_1!1761 lt!96690)))))

(assert (= (and d!57263 (not res!92152)) b!195102))

(assert (= (and b!195102 res!92153) b!195103))

(declare-fun m!222555 () Bool)

(assert (=> b!195103 m!222555))

(assert (=> b!194348 d!57263))

(declare-fun d!57265 () Bool)

(declare-fun lt!97345 () Bool)

(assert (=> d!57265 (= lt!97345 (select (content!157 Nil!2407) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun e!128322 () Bool)

(assert (=> d!57265 (= lt!97345 e!128322)))

(declare-fun res!92155 () Bool)

(assert (=> d!57265 (=> (not res!92155) (not e!128322))))

(assert (=> d!57265 (= res!92155 ((_ is Cons!2406) Nil!2407))))

(assert (=> d!57265 (= (contains!1366 Nil!2407 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)) lt!97345)))

(declare-fun b!195104 () Bool)

(declare-fun e!128321 () Bool)

(assert (=> b!195104 (= e!128322 e!128321)))

(declare-fun res!92154 () Bool)

(assert (=> b!195104 (=> res!92154 e!128321)))

(assert (=> b!195104 (= res!92154 (= (h!3047 Nil!2407) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun b!195105 () Bool)

(assert (=> b!195105 (= e!128321 (contains!1366 (t!7330 Nil!2407) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)))))

(assert (= (and d!57265 res!92155) b!195104))

(assert (= (and b!195104 (not res!92154)) b!195105))

(assert (=> d!57265 m!222383))

(assert (=> d!57265 m!221539))

(declare-fun m!222557 () Bool)

(assert (=> d!57265 m!222557))

(assert (=> b!195105 m!221539))

(declare-fun m!222559 () Bool)

(assert (=> b!195105 m!222559))

(assert (=> b!194532 d!57265))

(declare-fun d!57267 () Bool)

(declare-fun e!128324 () Bool)

(assert (=> d!57267 e!128324))

(declare-fun res!92156 () Bool)

(assert (=> d!57267 (=> res!92156 e!128324)))

(declare-fun lt!97347 () Bool)

(assert (=> d!57267 (= res!92156 (not lt!97347))))

(declare-fun lt!97349 () Bool)

(assert (=> d!57267 (= lt!97347 lt!97349)))

(declare-fun lt!97346 () Unit!5858)

(declare-fun e!128323 () Unit!5858)

(assert (=> d!57267 (= lt!97346 e!128323)))

(declare-fun c!35291 () Bool)

(assert (=> d!57267 (= c!35291 lt!97349)))

(assert (=> d!57267 (= lt!97349 (containsKey!249 (toList!1226 lt!96975) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(assert (=> d!57267 (= (contains!1363 lt!96975 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) lt!97347)))

(declare-fun b!195106 () Bool)

(declare-fun lt!97348 () Unit!5858)

(assert (=> b!195106 (= e!128323 lt!97348)))

(assert (=> b!195106 (= lt!97348 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96975) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(assert (=> b!195106 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96975) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun b!195107 () Bool)

(declare-fun Unit!5898 () Unit!5858)

(assert (=> b!195107 (= e!128323 Unit!5898)))

(declare-fun b!195108 () Bool)

(assert (=> b!195108 (= e!128324 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96975) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57267 c!35291) b!195106))

(assert (= (and d!57267 (not c!35291)) b!195107))

(assert (= (and d!57267 (not res!92156)) b!195108))

(declare-fun m!222561 () Bool)

(assert (=> d!57267 m!222561))

(declare-fun m!222563 () Bool)

(assert (=> b!195106 m!222563))

(assert (=> b!195106 m!221323))

(assert (=> b!195106 m!221323))

(declare-fun m!222565 () Bool)

(assert (=> b!195106 m!222565))

(assert (=> b!195108 m!221323))

(assert (=> b!195108 m!221323))

(assert (=> b!195108 m!222565))

(assert (=> d!56777 d!57267))

(declare-fun b!195110 () Bool)

(declare-fun e!128325 () Option!252)

(declare-fun e!128326 () Option!252)

(assert (=> b!195110 (= e!128325 e!128326)))

(declare-fun c!35293 () Bool)

(assert (=> b!195110 (= c!35293 (and ((_ is Cons!2404) lt!96977) (not (= (_1!1761 (h!3045 lt!96977)) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195112 () Bool)

(assert (=> b!195112 (= e!128326 None!250)))

(declare-fun c!35292 () Bool)

(declare-fun d!57269 () Bool)

(assert (=> d!57269 (= c!35292 (and ((_ is Cons!2404) lt!96977) (= (_1!1761 (h!3045 lt!96977)) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(assert (=> d!57269 (= (getValueByKey!246 lt!96977 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) e!128325)))

(declare-fun b!195111 () Bool)

(assert (=> b!195111 (= e!128326 (getValueByKey!246 (t!7326 lt!96977) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun b!195109 () Bool)

(assert (=> b!195109 (= e!128325 (Some!251 (_2!1761 (h!3045 lt!96977))))))

(assert (= (and d!57269 c!35292) b!195109))

(assert (= (and d!57269 (not c!35292)) b!195110))

(assert (= (and b!195110 c!35293) b!195111))

(assert (= (and b!195110 (not c!35293)) b!195112))

(declare-fun m!222567 () Bool)

(assert (=> b!195111 m!222567))

(assert (=> d!56777 d!57269))

(declare-fun d!57271 () Bool)

(assert (=> d!57271 (= (getValueByKey!246 lt!96977 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97350 () Unit!5858)

(assert (=> d!57271 (= lt!97350 (choose!1076 lt!96977 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun e!128327 () Bool)

(assert (=> d!57271 e!128327))

(declare-fun res!92157 () Bool)

(assert (=> d!57271 (=> (not res!92157) (not e!128327))))

(assert (=> d!57271 (= res!92157 (isStrictlySorted!344 lt!96977))))

(assert (=> d!57271 (= (lemmaContainsTupThenGetReturnValue!133 lt!96977 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) lt!97350)))

(declare-fun b!195113 () Bool)

(declare-fun res!92158 () Bool)

(assert (=> b!195113 (=> (not res!92158) (not e!128327))))

(assert (=> b!195113 (= res!92158 (containsKey!249 lt!96977 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun b!195114 () Bool)

(assert (=> b!195114 (= e!128327 (contains!1365 lt!96977 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57271 res!92157) b!195113))

(assert (= (and b!195113 res!92158) b!195114))

(assert (=> d!57271 m!221317))

(declare-fun m!222569 () Bool)

(assert (=> d!57271 m!222569))

(declare-fun m!222571 () Bool)

(assert (=> d!57271 m!222571))

(declare-fun m!222573 () Bool)

(assert (=> b!195113 m!222573))

(declare-fun m!222575 () Bool)

(assert (=> b!195114 m!222575))

(assert (=> d!56777 d!57271))

(declare-fun e!128329 () Bool)

(declare-fun b!195115 () Bool)

(declare-fun lt!97351 () List!2408)

(assert (=> b!195115 (= e!128329 (contains!1365 lt!97351 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(declare-fun bm!19697 () Bool)

(declare-fun call!19702 () List!2408)

(declare-fun call!19700 () List!2408)

(assert (=> bm!19697 (= call!19702 call!19700)))

(declare-fun e!128328 () List!2408)

(declare-fun b!195116 () Bool)

(assert (=> b!195116 (= e!128328 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96913)) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun b!195117 () Bool)

(declare-fun e!128332 () List!2408)

(declare-fun call!19701 () List!2408)

(assert (=> b!195117 (= e!128332 call!19701)))

(declare-fun b!195118 () Bool)

(declare-fun res!92159 () Bool)

(assert (=> b!195118 (=> (not res!92159) (not e!128329))))

(assert (=> b!195118 (= res!92159 (containsKey!249 lt!97351 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19698 () Bool)

(assert (=> bm!19698 (= call!19701 call!19702)))

(declare-fun c!35296 () Bool)

(declare-fun b!195119 () Bool)

(assert (=> b!195119 (= c!35296 (and ((_ is Cons!2404) (toList!1226 lt!96913)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96913))) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(declare-fun e!128331 () List!2408)

(assert (=> b!195119 (= e!128331 e!128332)))

(declare-fun b!195120 () Bool)

(assert (=> b!195120 (= e!128331 call!19702)))

(declare-fun b!195121 () Bool)

(declare-fun e!128330 () List!2408)

(assert (=> b!195121 (= e!128330 e!128331)))

(declare-fun c!35294 () Bool)

(assert (=> b!195121 (= c!35294 (and ((_ is Cons!2404) (toList!1226 lt!96913)) (= (_1!1761 (h!3045 (toList!1226 lt!96913))) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(declare-fun b!195123 () Bool)

(assert (=> b!195123 (= e!128332 call!19701)))

(declare-fun bm!19699 () Bool)

(declare-fun c!35297 () Bool)

(assert (=> bm!19699 (= call!19700 ($colon$colon!102 e!128328 (ite c!35297 (h!3045 (toList!1226 lt!96913)) (tuple2!3501 (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35295 () Bool)

(assert (=> bm!19699 (= c!35295 c!35297)))

(declare-fun b!195124 () Bool)

(assert (=> b!195124 (= e!128330 call!19700)))

(declare-fun b!195122 () Bool)

(assert (=> b!195122 (= e!128328 (ite c!35294 (t!7326 (toList!1226 lt!96913)) (ite c!35296 (Cons!2404 (h!3045 (toList!1226 lt!96913)) (t!7326 (toList!1226 lt!96913))) Nil!2405)))))

(declare-fun d!57273 () Bool)

(assert (=> d!57273 e!128329))

(declare-fun res!92160 () Bool)

(assert (=> d!57273 (=> (not res!92160) (not e!128329))))

(assert (=> d!57273 (= res!92160 (isStrictlySorted!344 lt!97351))))

(assert (=> d!57273 (= lt!97351 e!128330)))

(assert (=> d!57273 (= c!35297 (and ((_ is Cons!2404) (toList!1226 lt!96913)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96913))) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))))))))

(assert (=> d!57273 (isStrictlySorted!344 (toList!1226 lt!96913))))

(assert (=> d!57273 (= (insertStrictlySorted!136 (toList!1226 lt!96913) (_1!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248)))) lt!97351)))

(assert (= (and d!57273 c!35297) b!195124))

(assert (= (and d!57273 (not c!35297)) b!195121))

(assert (= (and b!195121 c!35294) b!195120))

(assert (= (and b!195121 (not c!35294)) b!195119))

(assert (= (and b!195119 c!35296) b!195123))

(assert (= (and b!195119 (not c!35296)) b!195117))

(assert (= (or b!195123 b!195117) bm!19698))

(assert (= (or b!195120 bm!19698) bm!19697))

(assert (= (or b!195124 bm!19697) bm!19699))

(assert (= (and bm!19699 c!35295) b!195116))

(assert (= (and bm!19699 (not c!35295)) b!195122))

(assert (= (and d!57273 res!92160) b!195118))

(assert (= (and b!195118 res!92159) b!195115))

(declare-fun m!222577 () Bool)

(assert (=> b!195118 m!222577))

(declare-fun m!222579 () Bool)

(assert (=> b!195116 m!222579))

(declare-fun m!222581 () Bool)

(assert (=> bm!19699 m!222581))

(declare-fun m!222583 () Bool)

(assert (=> b!195115 m!222583))

(declare-fun m!222585 () Bool)

(assert (=> d!57273 m!222585))

(declare-fun m!222587 () Bool)

(assert (=> d!57273 m!222587))

(assert (=> d!56777 d!57273))

(declare-fun d!57275 () Bool)

(assert (=> d!57275 (= (apply!188 (+!319 lt!97123 (tuple2!3501 lt!97119 (minValue!3800 lt!96692))) lt!97110) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!97123 (tuple2!3501 lt!97119 (minValue!3800 lt!96692)))) lt!97110)))))

(declare-fun bs!7796 () Bool)

(assert (= bs!7796 d!57275))

(declare-fun m!222589 () Bool)

(assert (=> bs!7796 m!222589))

(assert (=> bs!7796 m!222589))

(declare-fun m!222591 () Bool)

(assert (=> bs!7796 m!222591))

(assert (=> b!194594 d!57275))

(declare-fun d!57277 () Bool)

(assert (=> d!57277 (= (apply!188 lt!97129 lt!97126) (get!2244 (getValueByKey!246 (toList!1226 lt!97129) lt!97126)))))

(declare-fun bs!7797 () Bool)

(assert (= bs!7797 d!57277))

(declare-fun m!222593 () Bool)

(assert (=> bs!7797 m!222593))

(assert (=> bs!7797 m!222593))

(declare-fun m!222595 () Bool)

(assert (=> bs!7797 m!222595))

(assert (=> b!194594 d!57277))

(declare-fun d!57279 () Bool)

(declare-fun e!128333 () Bool)

(assert (=> d!57279 e!128333))

(declare-fun res!92162 () Bool)

(assert (=> d!57279 (=> (not res!92162) (not e!128333))))

(declare-fun lt!97352 () ListLongMap!2421)

(assert (=> d!57279 (= res!92162 (contains!1363 lt!97352 (_1!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692)))))))

(declare-fun lt!97354 () List!2408)

(assert (=> d!57279 (= lt!97352 (ListLongMap!2422 lt!97354))))

(declare-fun lt!97355 () Unit!5858)

(declare-fun lt!97353 () Unit!5858)

(assert (=> d!57279 (= lt!97355 lt!97353)))

(assert (=> d!57279 (= (getValueByKey!246 lt!97354 (_1!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692)))))))

(assert (=> d!57279 (= lt!97353 (lemmaContainsTupThenGetReturnValue!133 lt!97354 (_1!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692))) (_2!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692)))))))

(assert (=> d!57279 (= lt!97354 (insertStrictlySorted!136 (toList!1226 lt!97130) (_1!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692))) (_2!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692)))))))

(assert (=> d!57279 (= (+!319 lt!97130 (tuple2!3501 lt!97122 (minValue!3800 lt!96692))) lt!97352)))

(declare-fun b!195125 () Bool)

(declare-fun res!92161 () Bool)

(assert (=> b!195125 (=> (not res!92161) (not e!128333))))

(assert (=> b!195125 (= res!92161 (= (getValueByKey!246 (toList!1226 lt!97352) (_1!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 lt!97122 (minValue!3800 lt!96692))))))))

(declare-fun b!195126 () Bool)

(assert (=> b!195126 (= e!128333 (contains!1365 (toList!1226 lt!97352) (tuple2!3501 lt!97122 (minValue!3800 lt!96692))))))

(assert (= (and d!57279 res!92162) b!195125))

(assert (= (and b!195125 res!92161) b!195126))

(declare-fun m!222597 () Bool)

(assert (=> d!57279 m!222597))

(declare-fun m!222599 () Bool)

(assert (=> d!57279 m!222599))

(declare-fun m!222601 () Bool)

(assert (=> d!57279 m!222601))

(declare-fun m!222603 () Bool)

(assert (=> d!57279 m!222603))

(declare-fun m!222605 () Bool)

(assert (=> b!195125 m!222605))

(declare-fun m!222607 () Bool)

(assert (=> b!195126 m!222607))

(assert (=> b!194594 d!57279))

(declare-fun d!57281 () Bool)

(assert (=> d!57281 (= (apply!188 (+!319 lt!97130 (tuple2!3501 lt!97122 (minValue!3800 lt!96692))) lt!97124) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!97130 (tuple2!3501 lt!97122 (minValue!3800 lt!96692)))) lt!97124)))))

(declare-fun bs!7798 () Bool)

(assert (= bs!7798 d!57281))

(declare-fun m!222609 () Bool)

(assert (=> bs!7798 m!222609))

(assert (=> bs!7798 m!222609))

(declare-fun m!222611 () Bool)

(assert (=> bs!7798 m!222611))

(assert (=> b!194594 d!57281))

(declare-fun d!57283 () Bool)

(assert (=> d!57283 (= (apply!188 (+!319 lt!97129 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692))) lt!97126) (apply!188 lt!97129 lt!97126))))

(declare-fun lt!97356 () Unit!5858)

(assert (=> d!57283 (= lt!97356 (choose!1074 lt!97129 lt!97120 (zeroValue!3800 lt!96692) lt!97126))))

(declare-fun e!128334 () Bool)

(assert (=> d!57283 e!128334))

(declare-fun res!92163 () Bool)

(assert (=> d!57283 (=> (not res!92163) (not e!128334))))

(assert (=> d!57283 (= res!92163 (contains!1363 lt!97129 lt!97126))))

(assert (=> d!57283 (= (addApplyDifferent!164 lt!97129 lt!97120 (zeroValue!3800 lt!96692) lt!97126) lt!97356)))

(declare-fun b!195127 () Bool)

(assert (=> b!195127 (= e!128334 (not (= lt!97126 lt!97120)))))

(assert (= (and d!57283 res!92163) b!195127))

(declare-fun m!222613 () Bool)

(assert (=> d!57283 m!222613))

(assert (=> d!57283 m!221729))

(assert (=> d!57283 m!221721))

(assert (=> d!57283 m!221729))

(assert (=> d!57283 m!221737))

(declare-fun m!222615 () Bool)

(assert (=> d!57283 m!222615))

(assert (=> b!194594 d!57283))

(declare-fun d!57285 () Bool)

(declare-fun e!128335 () Bool)

(assert (=> d!57285 e!128335))

(declare-fun res!92165 () Bool)

(assert (=> d!57285 (=> (not res!92165) (not e!128335))))

(declare-fun lt!97357 () ListLongMap!2421)

(assert (=> d!57285 (= res!92165 (contains!1363 lt!97357 (_1!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692)))))))

(declare-fun lt!97359 () List!2408)

(assert (=> d!57285 (= lt!97357 (ListLongMap!2422 lt!97359))))

(declare-fun lt!97360 () Unit!5858)

(declare-fun lt!97358 () Unit!5858)

(assert (=> d!57285 (= lt!97360 lt!97358)))

(assert (=> d!57285 (= (getValueByKey!246 lt!97359 (_1!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692)))))))

(assert (=> d!57285 (= lt!97358 (lemmaContainsTupThenGetReturnValue!133 lt!97359 (_1!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692))) (_2!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692)))))))

(assert (=> d!57285 (= lt!97359 (insertStrictlySorted!136 (toList!1226 lt!97123) (_1!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692))) (_2!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692)))))))

(assert (=> d!57285 (= (+!319 lt!97123 (tuple2!3501 lt!97119 (minValue!3800 lt!96692))) lt!97357)))

(declare-fun b!195128 () Bool)

(declare-fun res!92164 () Bool)

(assert (=> b!195128 (=> (not res!92164) (not e!128335))))

(assert (=> b!195128 (= res!92164 (= (getValueByKey!246 (toList!1226 lt!97357) (_1!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 lt!97119 (minValue!3800 lt!96692))))))))

(declare-fun b!195129 () Bool)

(assert (=> b!195129 (= e!128335 (contains!1365 (toList!1226 lt!97357) (tuple2!3501 lt!97119 (minValue!3800 lt!96692))))))

(assert (= (and d!57285 res!92165) b!195128))

(assert (= (and b!195128 res!92164) b!195129))

(declare-fun m!222617 () Bool)

(assert (=> d!57285 m!222617))

(declare-fun m!222619 () Bool)

(assert (=> d!57285 m!222619))

(declare-fun m!222621 () Bool)

(assert (=> d!57285 m!222621))

(declare-fun m!222623 () Bool)

(assert (=> d!57285 m!222623))

(declare-fun m!222625 () Bool)

(assert (=> b!195128 m!222625))

(declare-fun m!222627 () Bool)

(assert (=> b!195129 m!222627))

(assert (=> b!194594 d!57285))

(declare-fun d!57287 () Bool)

(declare-fun e!128336 () Bool)

(assert (=> d!57287 e!128336))

(declare-fun res!92167 () Bool)

(assert (=> d!57287 (=> (not res!92167) (not e!128336))))

(declare-fun lt!97361 () ListLongMap!2421)

(assert (=> d!57287 (= res!92167 (contains!1363 lt!97361 (_1!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))))))

(declare-fun lt!97363 () List!2408)

(assert (=> d!57287 (= lt!97361 (ListLongMap!2422 lt!97363))))

(declare-fun lt!97364 () Unit!5858)

(declare-fun lt!97362 () Unit!5858)

(assert (=> d!57287 (= lt!97364 lt!97362)))

(assert (=> d!57287 (= (getValueByKey!246 lt!97363 (_1!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))))))

(assert (=> d!57287 (= lt!97362 (lemmaContainsTupThenGetReturnValue!133 lt!97363 (_1!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692))) (_2!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))))))

(assert (=> d!57287 (= lt!97363 (insertStrictlySorted!136 (toList!1226 lt!97127) (_1!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692))) (_2!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))))))

(assert (=> d!57287 (= (+!319 lt!97127 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692))) lt!97361)))

(declare-fun b!195130 () Bool)

(declare-fun res!92166 () Bool)

(assert (=> b!195130 (=> (not res!92166) (not e!128336))))

(assert (=> b!195130 (= res!92166 (= (getValueByKey!246 (toList!1226 lt!97361) (_1!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692))))))))

(declare-fun b!195131 () Bool)

(assert (=> b!195131 (= e!128336 (contains!1365 (toList!1226 lt!97361) (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692))))))

(assert (= (and d!57287 res!92167) b!195130))

(assert (= (and b!195130 res!92166) b!195131))

(declare-fun m!222629 () Bool)

(assert (=> d!57287 m!222629))

(declare-fun m!222631 () Bool)

(assert (=> d!57287 m!222631))

(declare-fun m!222633 () Bool)

(assert (=> d!57287 m!222633))

(declare-fun m!222635 () Bool)

(assert (=> d!57287 m!222635))

(declare-fun m!222637 () Bool)

(assert (=> b!195130 m!222637))

(declare-fun m!222639 () Bool)

(assert (=> b!195131 m!222639))

(assert (=> b!194594 d!57287))

(declare-fun d!57289 () Bool)

(declare-fun e!128338 () Bool)

(assert (=> d!57289 e!128338))

(declare-fun res!92168 () Bool)

(assert (=> d!57289 (=> res!92168 e!128338)))

(declare-fun lt!97366 () Bool)

(assert (=> d!57289 (= res!92168 (not lt!97366))))

(declare-fun lt!97368 () Bool)

(assert (=> d!57289 (= lt!97366 lt!97368)))

(declare-fun lt!97365 () Unit!5858)

(declare-fun e!128337 () Unit!5858)

(assert (=> d!57289 (= lt!97365 e!128337)))

(declare-fun c!35298 () Bool)

(assert (=> d!57289 (= c!35298 lt!97368)))

(assert (=> d!57289 (= lt!97368 (containsKey!249 (toList!1226 (+!319 lt!97127 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))) lt!97125))))

(assert (=> d!57289 (= (contains!1363 (+!319 lt!97127 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692))) lt!97125) lt!97366)))

(declare-fun b!195132 () Bool)

(declare-fun lt!97367 () Unit!5858)

(assert (=> b!195132 (= e!128337 lt!97367)))

(assert (=> b!195132 (= lt!97367 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (+!319 lt!97127 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))) lt!97125))))

(assert (=> b!195132 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!97127 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))) lt!97125))))

(declare-fun b!195133 () Bool)

(declare-fun Unit!5899 () Unit!5858)

(assert (=> b!195133 (= e!128337 Unit!5899)))

(declare-fun b!195134 () Bool)

(assert (=> b!195134 (= e!128338 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!97127 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692)))) lt!97125)))))

(assert (= (and d!57289 c!35298) b!195132))

(assert (= (and d!57289 (not c!35298)) b!195133))

(assert (= (and d!57289 (not res!92168)) b!195134))

(declare-fun m!222641 () Bool)

(assert (=> d!57289 m!222641))

(declare-fun m!222643 () Bool)

(assert (=> b!195132 m!222643))

(declare-fun m!222645 () Bool)

(assert (=> b!195132 m!222645))

(assert (=> b!195132 m!222645))

(declare-fun m!222647 () Bool)

(assert (=> b!195132 m!222647))

(assert (=> b!195134 m!222645))

(assert (=> b!195134 m!222645))

(assert (=> b!195134 m!222647))

(assert (=> b!194594 d!57289))

(declare-fun d!57291 () Bool)

(assert (=> d!57291 (= (apply!188 (+!319 lt!97123 (tuple2!3501 lt!97119 (minValue!3800 lt!96692))) lt!97110) (apply!188 lt!97123 lt!97110))))

(declare-fun lt!97369 () Unit!5858)

(assert (=> d!57291 (= lt!97369 (choose!1074 lt!97123 lt!97119 (minValue!3800 lt!96692) lt!97110))))

(declare-fun e!128339 () Bool)

(assert (=> d!57291 e!128339))

(declare-fun res!92169 () Bool)

(assert (=> d!57291 (=> (not res!92169) (not e!128339))))

(assert (=> d!57291 (= res!92169 (contains!1363 lt!97123 lt!97110))))

(assert (=> d!57291 (= (addApplyDifferent!164 lt!97123 lt!97119 (minValue!3800 lt!96692) lt!97110) lt!97369)))

(declare-fun b!195135 () Bool)

(assert (=> b!195135 (= e!128339 (not (= lt!97110 lt!97119)))))

(assert (= (and d!57291 res!92169) b!195135))

(declare-fun m!222649 () Bool)

(assert (=> d!57291 m!222649))

(assert (=> d!57291 m!221725))

(assert (=> d!57291 m!221735))

(assert (=> d!57291 m!221725))

(assert (=> d!57291 m!221727))

(declare-fun m!222651 () Bool)

(assert (=> d!57291 m!222651))

(assert (=> b!194594 d!57291))

(declare-fun d!57293 () Bool)

(assert (=> d!57293 (= (apply!188 (+!319 lt!97130 (tuple2!3501 lt!97122 (minValue!3800 lt!96692))) lt!97124) (apply!188 lt!97130 lt!97124))))

(declare-fun lt!97370 () Unit!5858)

(assert (=> d!57293 (= lt!97370 (choose!1074 lt!97130 lt!97122 (minValue!3800 lt!96692) lt!97124))))

(declare-fun e!128340 () Bool)

(assert (=> d!57293 e!128340))

(declare-fun res!92170 () Bool)

(assert (=> d!57293 (=> (not res!92170) (not e!128340))))

(assert (=> d!57293 (= res!92170 (contains!1363 lt!97130 lt!97124))))

(assert (=> d!57293 (= (addApplyDifferent!164 lt!97130 lt!97122 (minValue!3800 lt!96692) lt!97124) lt!97370)))

(declare-fun b!195136 () Bool)

(assert (=> b!195136 (= e!128340 (not (= lt!97124 lt!97122)))))

(assert (= (and d!57293 res!92170) b!195136))

(declare-fun m!222653 () Bool)

(assert (=> d!57293 m!222653))

(assert (=> d!57293 m!221711))

(assert (=> d!57293 m!221731))

(assert (=> d!57293 m!221711))

(assert (=> d!57293 m!221713))

(declare-fun m!222655 () Bool)

(assert (=> d!57293 m!222655))

(assert (=> b!194594 d!57293))

(declare-fun d!57295 () Bool)

(assert (=> d!57295 (= (apply!188 (+!319 lt!97129 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692))) lt!97126) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!97129 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692)))) lt!97126)))))

(declare-fun bs!7799 () Bool)

(assert (= bs!7799 d!57295))

(declare-fun m!222657 () Bool)

(assert (=> bs!7799 m!222657))

(assert (=> bs!7799 m!222657))

(declare-fun m!222659 () Bool)

(assert (=> bs!7799 m!222659))

(assert (=> b!194594 d!57295))

(declare-fun d!57297 () Bool)

(assert (=> d!57297 (contains!1363 (+!319 lt!97127 (tuple2!3501 lt!97112 (zeroValue!3800 lt!96692))) lt!97125)))

(declare-fun lt!97371 () Unit!5858)

(assert (=> d!57297 (= lt!97371 (choose!1075 lt!97127 lt!97112 (zeroValue!3800 lt!96692) lt!97125))))

(assert (=> d!57297 (contains!1363 lt!97127 lt!97125)))

(assert (=> d!57297 (= (addStillContains!164 lt!97127 lt!97112 (zeroValue!3800 lt!96692) lt!97125) lt!97371)))

(declare-fun bs!7800 () Bool)

(assert (= bs!7800 d!57297))

(assert (=> bs!7800 m!221715))

(assert (=> bs!7800 m!221715))

(assert (=> bs!7800 m!221723))

(declare-fun m!222661 () Bool)

(assert (=> bs!7800 m!222661))

(declare-fun m!222663 () Bool)

(assert (=> bs!7800 m!222663))

(assert (=> b!194594 d!57297))

(assert (=> b!194594 d!57021))

(declare-fun d!57299 () Bool)

(assert (=> d!57299 (= (apply!188 lt!97130 lt!97124) (get!2244 (getValueByKey!246 (toList!1226 lt!97130) lt!97124)))))

(declare-fun bs!7801 () Bool)

(assert (= bs!7801 d!57299))

(declare-fun m!222665 () Bool)

(assert (=> bs!7801 m!222665))

(assert (=> bs!7801 m!222665))

(declare-fun m!222667 () Bool)

(assert (=> bs!7801 m!222667))

(assert (=> b!194594 d!57299))

(declare-fun d!57301 () Bool)

(assert (=> d!57301 (= (apply!188 lt!97123 lt!97110) (get!2244 (getValueByKey!246 (toList!1226 lt!97123) lt!97110)))))

(declare-fun bs!7802 () Bool)

(assert (= bs!7802 d!57301))

(declare-fun m!222669 () Bool)

(assert (=> bs!7802 m!222669))

(assert (=> bs!7802 m!222669))

(declare-fun m!222671 () Bool)

(assert (=> bs!7802 m!222671))

(assert (=> b!194594 d!57301))

(declare-fun d!57303 () Bool)

(declare-fun e!128341 () Bool)

(assert (=> d!57303 e!128341))

(declare-fun res!92172 () Bool)

(assert (=> d!57303 (=> (not res!92172) (not e!128341))))

(declare-fun lt!97372 () ListLongMap!2421)

(assert (=> d!57303 (= res!92172 (contains!1363 lt!97372 (_1!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692)))))))

(declare-fun lt!97374 () List!2408)

(assert (=> d!57303 (= lt!97372 (ListLongMap!2422 lt!97374))))

(declare-fun lt!97375 () Unit!5858)

(declare-fun lt!97373 () Unit!5858)

(assert (=> d!57303 (= lt!97375 lt!97373)))

(assert (=> d!57303 (= (getValueByKey!246 lt!97374 (_1!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692)))))))

(assert (=> d!57303 (= lt!97373 (lemmaContainsTupThenGetReturnValue!133 lt!97374 (_1!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692))) (_2!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692)))))))

(assert (=> d!57303 (= lt!97374 (insertStrictlySorted!136 (toList!1226 lt!97129) (_1!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692))) (_2!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692)))))))

(assert (=> d!57303 (= (+!319 lt!97129 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692))) lt!97372)))

(declare-fun b!195137 () Bool)

(declare-fun res!92171 () Bool)

(assert (=> b!195137 (=> (not res!92171) (not e!128341))))

(assert (=> b!195137 (= res!92171 (= (getValueByKey!246 (toList!1226 lt!97372) (_1!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692)))) (Some!251 (_2!1761 (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692))))))))

(declare-fun b!195138 () Bool)

(assert (=> b!195138 (= e!128341 (contains!1365 (toList!1226 lt!97372) (tuple2!3501 lt!97120 (zeroValue!3800 lt!96692))))))

(assert (= (and d!57303 res!92172) b!195137))

(assert (= (and b!195137 res!92171) b!195138))

(declare-fun m!222673 () Bool)

(assert (=> d!57303 m!222673))

(declare-fun m!222675 () Bool)

(assert (=> d!57303 m!222675))

(declare-fun m!222677 () Bool)

(assert (=> d!57303 m!222677))

(declare-fun m!222679 () Bool)

(assert (=> d!57303 m!222679))

(declare-fun m!222681 () Bool)

(assert (=> b!195137 m!222681))

(declare-fun m!222683 () Bool)

(assert (=> b!195138 m!222683))

(assert (=> b!194594 d!57303))

(declare-fun d!57305 () Bool)

(declare-fun lt!97376 () Bool)

(assert (=> d!57305 (= lt!97376 (select (content!156 (toList!1226 lt!97019)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun e!128343 () Bool)

(assert (=> d!57305 (= lt!97376 e!128343)))

(declare-fun res!92173 () Bool)

(assert (=> d!57305 (=> (not res!92173) (not e!128343))))

(assert (=> d!57305 (= res!92173 ((_ is Cons!2404) (toList!1226 lt!97019)))))

(assert (=> d!57305 (= (contains!1365 (toList!1226 lt!97019) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!97376)))

(declare-fun b!195139 () Bool)

(declare-fun e!128342 () Bool)

(assert (=> b!195139 (= e!128343 e!128342)))

(declare-fun res!92174 () Bool)

(assert (=> b!195139 (=> res!92174 e!128342)))

(assert (=> b!195139 (= res!92174 (= (h!3045 (toList!1226 lt!97019)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!195140 () Bool)

(assert (=> b!195140 (= e!128342 (contains!1365 (t!7326 (toList!1226 lt!97019)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!57305 res!92173) b!195139))

(assert (= (and b!195139 (not res!92174)) b!195140))

(declare-fun m!222685 () Bool)

(assert (=> d!57305 m!222685))

(declare-fun m!222687 () Bool)

(assert (=> d!57305 m!222687))

(declare-fun m!222689 () Bool)

(assert (=> b!195140 m!222689))

(assert (=> b!194435 d!57305))

(assert (=> bm!19671 d!56881))

(declare-fun d!57307 () Bool)

(declare-fun e!128345 () Bool)

(assert (=> d!57307 e!128345))

(declare-fun res!92175 () Bool)

(assert (=> d!57307 (=> res!92175 e!128345)))

(declare-fun lt!97378 () Bool)

(assert (=> d!57307 (= res!92175 (not lt!97378))))

(declare-fun lt!97380 () Bool)

(assert (=> d!57307 (= lt!97378 lt!97380)))

(declare-fun lt!97377 () Unit!5858)

(declare-fun e!128344 () Unit!5858)

(assert (=> d!57307 (= lt!97377 e!128344)))

(declare-fun c!35299 () Bool)

(assert (=> d!57307 (= c!35299 lt!97380)))

(assert (=> d!57307 (= lt!97380 (containsKey!249 (toList!1226 lt!96952) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(assert (=> d!57307 (= (contains!1363 lt!96952 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) lt!97378)))

(declare-fun b!195141 () Bool)

(declare-fun lt!97379 () Unit!5858)

(assert (=> b!195141 (= e!128344 lt!97379)))

(assert (=> b!195141 (= lt!97379 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96952) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(assert (=> b!195141 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96952) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun b!195142 () Bool)

(declare-fun Unit!5900 () Unit!5858)

(assert (=> b!195142 (= e!128344 Unit!5900)))

(declare-fun b!195143 () Bool)

(assert (=> b!195143 (= e!128345 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96952) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57307 c!35299) b!195141))

(assert (= (and d!57307 (not c!35299)) b!195142))

(assert (= (and d!57307 (not res!92175)) b!195143))

(declare-fun m!222691 () Bool)

(assert (=> d!57307 m!222691))

(declare-fun m!222693 () Bool)

(assert (=> b!195141 m!222693))

(assert (=> b!195141 m!221251))

(assert (=> b!195141 m!221251))

(declare-fun m!222695 () Bool)

(assert (=> b!195141 m!222695))

(assert (=> b!195143 m!221251))

(assert (=> b!195143 m!221251))

(assert (=> b!195143 m!222695))

(assert (=> d!56755 d!57307))

(declare-fun b!195145 () Bool)

(declare-fun e!128346 () Option!252)

(declare-fun e!128347 () Option!252)

(assert (=> b!195145 (= e!128346 e!128347)))

(declare-fun c!35301 () Bool)

(assert (=> b!195145 (= c!35301 (and ((_ is Cons!2404) lt!96954) (not (= (_1!1761 (h!3045 lt!96954)) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195147 () Bool)

(assert (=> b!195147 (= e!128347 None!250)))

(declare-fun d!57309 () Bool)

(declare-fun c!35300 () Bool)

(assert (=> d!57309 (= c!35300 (and ((_ is Cons!2404) lt!96954) (= (_1!1761 (h!3045 lt!96954)) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(assert (=> d!57309 (= (getValueByKey!246 lt!96954 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) e!128346)))

(declare-fun b!195146 () Bool)

(assert (=> b!195146 (= e!128347 (getValueByKey!246 (t!7326 lt!96954) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun b!195144 () Bool)

(assert (=> b!195144 (= e!128346 (Some!251 (_2!1761 (h!3045 lt!96954))))))

(assert (= (and d!57309 c!35300) b!195144))

(assert (= (and d!57309 (not c!35300)) b!195145))

(assert (= (and b!195145 c!35301) b!195146))

(assert (= (and b!195145 (not c!35301)) b!195147))

(declare-fun m!222697 () Bool)

(assert (=> b!195146 m!222697))

(assert (=> d!56755 d!57309))

(declare-fun d!57311 () Bool)

(assert (=> d!57311 (= (getValueByKey!246 lt!96954 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97381 () Unit!5858)

(assert (=> d!57311 (= lt!97381 (choose!1076 lt!96954 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun e!128348 () Bool)

(assert (=> d!57311 e!128348))

(declare-fun res!92176 () Bool)

(assert (=> d!57311 (=> (not res!92176) (not e!128348))))

(assert (=> d!57311 (= res!92176 (isStrictlySorted!344 lt!96954))))

(assert (=> d!57311 (= (lemmaContainsTupThenGetReturnValue!133 lt!96954 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) lt!97381)))

(declare-fun b!195148 () Bool)

(declare-fun res!92177 () Bool)

(assert (=> b!195148 (=> (not res!92177) (not e!128348))))

(assert (=> b!195148 (= res!92177 (containsKey!249 lt!96954 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun b!195149 () Bool)

(assert (=> b!195149 (= e!128348 (contains!1365 lt!96954 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57311 res!92176) b!195148))

(assert (= (and b!195148 res!92177) b!195149))

(assert (=> d!57311 m!221245))

(declare-fun m!222699 () Bool)

(assert (=> d!57311 m!222699))

(declare-fun m!222701 () Bool)

(assert (=> d!57311 m!222701))

(declare-fun m!222703 () Bool)

(assert (=> b!195148 m!222703))

(declare-fun m!222705 () Bool)

(assert (=> b!195149 m!222705))

(assert (=> d!56755 d!57311))

(declare-fun b!195150 () Bool)

(declare-fun e!128350 () Bool)

(declare-fun lt!97382 () List!2408)

(assert (=> b!195150 (= e!128350 (contains!1365 lt!97382 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(declare-fun bm!19700 () Bool)

(declare-fun call!19705 () List!2408)

(declare-fun call!19703 () List!2408)

(assert (=> bm!19700 (= call!19705 call!19703)))

(declare-fun e!128349 () List!2408)

(declare-fun b!195151 () Bool)

(assert (=> b!195151 (= e!128349 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96920)) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun b!195152 () Bool)

(declare-fun e!128353 () List!2408)

(declare-fun call!19704 () List!2408)

(assert (=> b!195152 (= e!128353 call!19704)))

(declare-fun b!195153 () Bool)

(declare-fun res!92178 () Bool)

(assert (=> b!195153 (=> (not res!92178) (not e!128350))))

(assert (=> b!195153 (= res!92178 (containsKey!249 lt!97382 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19701 () Bool)

(assert (=> bm!19701 (= call!19704 call!19705)))

(declare-fun b!195154 () Bool)

(declare-fun c!35304 () Bool)

(assert (=> b!195154 (= c!35304 (and ((_ is Cons!2404) (toList!1226 lt!96920)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96920))) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(declare-fun e!128352 () List!2408)

(assert (=> b!195154 (= e!128352 e!128353)))

(declare-fun b!195155 () Bool)

(assert (=> b!195155 (= e!128352 call!19705)))

(declare-fun b!195156 () Bool)

(declare-fun e!128351 () List!2408)

(assert (=> b!195156 (= e!128351 e!128352)))

(declare-fun c!35302 () Bool)

(assert (=> b!195156 (= c!35302 (and ((_ is Cons!2404) (toList!1226 lt!96920)) (= (_1!1761 (h!3045 (toList!1226 lt!96920))) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(declare-fun b!195158 () Bool)

(assert (=> b!195158 (= e!128353 call!19704)))

(declare-fun c!35305 () Bool)

(declare-fun bm!19702 () Bool)

(assert (=> bm!19702 (= call!19703 ($colon$colon!102 e!128349 (ite c!35305 (h!3045 (toList!1226 lt!96920)) (tuple2!3501 (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35303 () Bool)

(assert (=> bm!19702 (= c!35303 c!35305)))

(declare-fun b!195159 () Bool)

(assert (=> b!195159 (= e!128351 call!19703)))

(declare-fun b!195157 () Bool)

(assert (=> b!195157 (= e!128349 (ite c!35302 (t!7326 (toList!1226 lt!96920)) (ite c!35304 (Cons!2404 (h!3045 (toList!1226 lt!96920)) (t!7326 (toList!1226 lt!96920))) Nil!2405)))))

(declare-fun d!57313 () Bool)

(assert (=> d!57313 e!128350))

(declare-fun res!92179 () Bool)

(assert (=> d!57313 (=> (not res!92179) (not e!128350))))

(assert (=> d!57313 (= res!92179 (isStrictlySorted!344 lt!97382))))

(assert (=> d!57313 (= lt!97382 e!128351)))

(assert (=> d!57313 (= c!35305 (and ((_ is Cons!2404) (toList!1226 lt!96920)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96920))) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))

(assert (=> d!57313 (isStrictlySorted!344 (toList!1226 lt!96920))))

(assert (=> d!57313 (= (insertStrictlySorted!136 (toList!1226 lt!96920) (_1!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) lt!97382)))

(assert (= (and d!57313 c!35305) b!195159))

(assert (= (and d!57313 (not c!35305)) b!195156))

(assert (= (and b!195156 c!35302) b!195155))

(assert (= (and b!195156 (not c!35302)) b!195154))

(assert (= (and b!195154 c!35304) b!195158))

(assert (= (and b!195154 (not c!35304)) b!195152))

(assert (= (or b!195158 b!195152) bm!19701))

(assert (= (or b!195155 bm!19701) bm!19700))

(assert (= (or b!195159 bm!19700) bm!19702))

(assert (= (and bm!19702 c!35303) b!195151))

(assert (= (and bm!19702 (not c!35303)) b!195157))

(assert (= (and d!57313 res!92179) b!195153))

(assert (= (and b!195153 res!92178) b!195150))

(declare-fun m!222707 () Bool)

(assert (=> b!195153 m!222707))

(declare-fun m!222709 () Bool)

(assert (=> b!195151 m!222709))

(declare-fun m!222711 () Bool)

(assert (=> bm!19702 m!222711))

(declare-fun m!222713 () Bool)

(assert (=> b!195150 m!222713))

(declare-fun m!222715 () Bool)

(assert (=> d!57313 m!222715))

(declare-fun m!222717 () Bool)

(assert (=> d!57313 m!222717))

(assert (=> d!56755 d!57313))

(declare-fun d!57315 () Bool)

(assert (=> d!57315 (contains!1363 (+!319 lt!97045 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248))) lt!97043)))

(declare-fun lt!97383 () Unit!5858)

(assert (=> d!57315 (= lt!97383 (choose!1075 lt!97045 lt!97030 (zeroValue!3800 thiss!1248) lt!97043))))

(assert (=> d!57315 (contains!1363 lt!97045 lt!97043)))

(assert (=> d!57315 (= (addStillContains!164 lt!97045 lt!97030 (zeroValue!3800 thiss!1248) lt!97043) lt!97383)))

(declare-fun bs!7803 () Bool)

(assert (= bs!7803 d!57315))

(assert (=> bs!7803 m!221475))

(assert (=> bs!7803 m!221475))

(assert (=> bs!7803 m!221483))

(declare-fun m!222719 () Bool)

(assert (=> bs!7803 m!222719))

(declare-fun m!222721 () Bool)

(assert (=> bs!7803 m!222721))

(assert (=> b!194447 d!57315))

(declare-fun d!57317 () Bool)

(assert (=> d!57317 (= (apply!188 (+!319 lt!97048 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248))) lt!97042) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!97048 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248)))) lt!97042)))))

(declare-fun bs!7804 () Bool)

(assert (= bs!7804 d!57317))

(declare-fun m!222723 () Bool)

(assert (=> bs!7804 m!222723))

(assert (=> bs!7804 m!222723))

(declare-fun m!222725 () Bool)

(assert (=> bs!7804 m!222725))

(assert (=> b!194447 d!57317))

(declare-fun d!57319 () Bool)

(assert (=> d!57319 (= (apply!188 (+!319 lt!97047 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248))) lt!97044) (apply!188 lt!97047 lt!97044))))

(declare-fun lt!97384 () Unit!5858)

(assert (=> d!57319 (= lt!97384 (choose!1074 lt!97047 lt!97038 (zeroValue!3800 thiss!1248) lt!97044))))

(declare-fun e!128354 () Bool)

(assert (=> d!57319 e!128354))

(declare-fun res!92180 () Bool)

(assert (=> d!57319 (=> (not res!92180) (not e!128354))))

(assert (=> d!57319 (= res!92180 (contains!1363 lt!97047 lt!97044))))

(assert (=> d!57319 (= (addApplyDifferent!164 lt!97047 lt!97038 (zeroValue!3800 thiss!1248) lt!97044) lt!97384)))

(declare-fun b!195160 () Bool)

(assert (=> b!195160 (= e!128354 (not (= lt!97044 lt!97038)))))

(assert (= (and d!57319 res!92180) b!195160))

(declare-fun m!222727 () Bool)

(assert (=> d!57319 m!222727))

(assert (=> d!57319 m!221489))

(assert (=> d!57319 m!221481))

(assert (=> d!57319 m!221489))

(assert (=> d!57319 m!221497))

(declare-fun m!222729 () Bool)

(assert (=> d!57319 m!222729))

(assert (=> b!194447 d!57319))

(declare-fun d!57321 () Bool)

(declare-fun e!128355 () Bool)

(assert (=> d!57321 e!128355))

(declare-fun res!92182 () Bool)

(assert (=> d!57321 (=> (not res!92182) (not e!128355))))

(declare-fun lt!97385 () ListLongMap!2421)

(assert (=> d!57321 (= res!92182 (contains!1363 lt!97385 (_1!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97387 () List!2408)

(assert (=> d!57321 (= lt!97385 (ListLongMap!2422 lt!97387))))

(declare-fun lt!97388 () Unit!5858)

(declare-fun lt!97386 () Unit!5858)

(assert (=> d!57321 (= lt!97388 lt!97386)))

(assert (=> d!57321 (= (getValueByKey!246 lt!97387 (_1!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57321 (= lt!97386 (lemmaContainsTupThenGetReturnValue!133 lt!97387 (_1!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57321 (= lt!97387 (insertStrictlySorted!136 (toList!1226 lt!97047) (_1!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57321 (= (+!319 lt!97047 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248))) lt!97385)))

(declare-fun b!195161 () Bool)

(declare-fun res!92181 () Bool)

(assert (=> b!195161 (=> (not res!92181) (not e!128355))))

(assert (=> b!195161 (= res!92181 (= (getValueByKey!246 (toList!1226 lt!97385) (_1!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!195162 () Bool)

(assert (=> b!195162 (= e!128355 (contains!1365 (toList!1226 lt!97385) (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57321 res!92182) b!195161))

(assert (= (and b!195161 res!92181) b!195162))

(declare-fun m!222731 () Bool)

(assert (=> d!57321 m!222731))

(declare-fun m!222733 () Bool)

(assert (=> d!57321 m!222733))

(declare-fun m!222735 () Bool)

(assert (=> d!57321 m!222735))

(declare-fun m!222737 () Bool)

(assert (=> d!57321 m!222737))

(declare-fun m!222739 () Bool)

(assert (=> b!195161 m!222739))

(declare-fun m!222741 () Bool)

(assert (=> b!195162 m!222741))

(assert (=> b!194447 d!57321))

(declare-fun d!57323 () Bool)

(declare-fun e!128357 () Bool)

(assert (=> d!57323 e!128357))

(declare-fun res!92183 () Bool)

(assert (=> d!57323 (=> res!92183 e!128357)))

(declare-fun lt!97390 () Bool)

(assert (=> d!57323 (= res!92183 (not lt!97390))))

(declare-fun lt!97392 () Bool)

(assert (=> d!57323 (= lt!97390 lt!97392)))

(declare-fun lt!97389 () Unit!5858)

(declare-fun e!128356 () Unit!5858)

(assert (=> d!57323 (= lt!97389 e!128356)))

(declare-fun c!35306 () Bool)

(assert (=> d!57323 (= c!35306 lt!97392)))

(assert (=> d!57323 (= lt!97392 (containsKey!249 (toList!1226 (+!319 lt!97045 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))) lt!97043))))

(assert (=> d!57323 (= (contains!1363 (+!319 lt!97045 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248))) lt!97043) lt!97390)))

(declare-fun b!195163 () Bool)

(declare-fun lt!97391 () Unit!5858)

(assert (=> b!195163 (= e!128356 lt!97391)))

(assert (=> b!195163 (= lt!97391 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 (+!319 lt!97045 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))) lt!97043))))

(assert (=> b!195163 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!97045 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))) lt!97043))))

(declare-fun b!195164 () Bool)

(declare-fun Unit!5901 () Unit!5858)

(assert (=> b!195164 (= e!128356 Unit!5901)))

(declare-fun b!195165 () Bool)

(assert (=> b!195165 (= e!128357 (isDefined!198 (getValueByKey!246 (toList!1226 (+!319 lt!97045 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))) lt!97043)))))

(assert (= (and d!57323 c!35306) b!195163))

(assert (= (and d!57323 (not c!35306)) b!195164))

(assert (= (and d!57323 (not res!92183)) b!195165))

(declare-fun m!222743 () Bool)

(assert (=> d!57323 m!222743))

(declare-fun m!222745 () Bool)

(assert (=> b!195163 m!222745))

(declare-fun m!222747 () Bool)

(assert (=> b!195163 m!222747))

(assert (=> b!195163 m!222747))

(declare-fun m!222749 () Bool)

(assert (=> b!195163 m!222749))

(assert (=> b!195165 m!222747))

(assert (=> b!195165 m!222747))

(assert (=> b!195165 m!222749))

(assert (=> b!194447 d!57323))

(declare-fun d!57325 () Bool)

(assert (=> d!57325 (= (apply!188 (+!319 lt!97048 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248))) lt!97042) (apply!188 lt!97048 lt!97042))))

(declare-fun lt!97393 () Unit!5858)

(assert (=> d!57325 (= lt!97393 (choose!1074 lt!97048 lt!97040 (minValue!3800 thiss!1248) lt!97042))))

(declare-fun e!128358 () Bool)

(assert (=> d!57325 e!128358))

(declare-fun res!92184 () Bool)

(assert (=> d!57325 (=> (not res!92184) (not e!128358))))

(assert (=> d!57325 (= res!92184 (contains!1363 lt!97048 lt!97042))))

(assert (=> d!57325 (= (addApplyDifferent!164 lt!97048 lt!97040 (minValue!3800 thiss!1248) lt!97042) lt!97393)))

(declare-fun b!195166 () Bool)

(assert (=> b!195166 (= e!128358 (not (= lt!97042 lt!97040)))))

(assert (= (and d!57325 res!92184) b!195166))

(declare-fun m!222751 () Bool)

(assert (=> d!57325 m!222751))

(assert (=> d!57325 m!221471))

(assert (=> d!57325 m!221491))

(assert (=> d!57325 m!221471))

(assert (=> d!57325 m!221473))

(declare-fun m!222753 () Bool)

(assert (=> d!57325 m!222753))

(assert (=> b!194447 d!57325))

(declare-fun d!57327 () Bool)

(declare-fun e!128359 () Bool)

(assert (=> d!57327 e!128359))

(declare-fun res!92186 () Bool)

(assert (=> d!57327 (=> (not res!92186) (not e!128359))))

(declare-fun lt!97394 () ListLongMap!2421)

(assert (=> d!57327 (= res!92186 (contains!1363 lt!97394 (_1!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97396 () List!2408)

(assert (=> d!57327 (= lt!97394 (ListLongMap!2422 lt!97396))))

(declare-fun lt!97397 () Unit!5858)

(declare-fun lt!97395 () Unit!5858)

(assert (=> d!57327 (= lt!97397 lt!97395)))

(assert (=> d!57327 (= (getValueByKey!246 lt!97396 (_1!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248)))))))

(assert (=> d!57327 (= lt!97395 (lemmaContainsTupThenGetReturnValue!133 lt!97396 (_1!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248)))))))

(assert (=> d!57327 (= lt!97396 (insertStrictlySorted!136 (toList!1226 lt!97048) (_1!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248)))))))

(assert (=> d!57327 (= (+!319 lt!97048 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248))) lt!97394)))

(declare-fun b!195167 () Bool)

(declare-fun res!92185 () Bool)

(assert (=> b!195167 (=> (not res!92185) (not e!128359))))

(assert (=> b!195167 (= res!92185 (= (getValueByKey!246 (toList!1226 lt!97394) (_1!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!97040 (minValue!3800 thiss!1248))))))))

(declare-fun b!195168 () Bool)

(assert (=> b!195168 (= e!128359 (contains!1365 (toList!1226 lt!97394) (tuple2!3501 lt!97040 (minValue!3800 thiss!1248))))))

(assert (= (and d!57327 res!92186) b!195167))

(assert (= (and b!195167 res!92185) b!195168))

(declare-fun m!222755 () Bool)

(assert (=> d!57327 m!222755))

(declare-fun m!222757 () Bool)

(assert (=> d!57327 m!222757))

(declare-fun m!222759 () Bool)

(assert (=> d!57327 m!222759))

(declare-fun m!222761 () Bool)

(assert (=> d!57327 m!222761))

(declare-fun m!222763 () Bool)

(assert (=> b!195167 m!222763))

(declare-fun m!222765 () Bool)

(assert (=> b!195168 m!222765))

(assert (=> b!194447 d!57327))

(declare-fun d!57329 () Bool)

(assert (=> d!57329 (= (apply!188 lt!97041 lt!97028) (get!2244 (getValueByKey!246 (toList!1226 lt!97041) lt!97028)))))

(declare-fun bs!7805 () Bool)

(assert (= bs!7805 d!57329))

(declare-fun m!222767 () Bool)

(assert (=> bs!7805 m!222767))

(assert (=> bs!7805 m!222767))

(declare-fun m!222769 () Bool)

(assert (=> bs!7805 m!222769))

(assert (=> b!194447 d!57329))

(assert (=> b!194447 d!57023))

(declare-fun d!57331 () Bool)

(assert (=> d!57331 (= (apply!188 (+!319 lt!97041 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248))) lt!97028) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!97041 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248)))) lt!97028)))))

(declare-fun bs!7806 () Bool)

(assert (= bs!7806 d!57331))

(declare-fun m!222771 () Bool)

(assert (=> bs!7806 m!222771))

(assert (=> bs!7806 m!222771))

(declare-fun m!222773 () Bool)

(assert (=> bs!7806 m!222773))

(assert (=> b!194447 d!57331))

(declare-fun d!57333 () Bool)

(declare-fun e!128360 () Bool)

(assert (=> d!57333 e!128360))

(declare-fun res!92188 () Bool)

(assert (=> d!57333 (=> (not res!92188) (not e!128360))))

(declare-fun lt!97398 () ListLongMap!2421)

(assert (=> d!57333 (= res!92188 (contains!1363 lt!97398 (_1!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97400 () List!2408)

(assert (=> d!57333 (= lt!97398 (ListLongMap!2422 lt!97400))))

(declare-fun lt!97401 () Unit!5858)

(declare-fun lt!97399 () Unit!5858)

(assert (=> d!57333 (= lt!97401 lt!97399)))

(assert (=> d!57333 (= (getValueByKey!246 lt!97400 (_1!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248)))))))

(assert (=> d!57333 (= lt!97399 (lemmaContainsTupThenGetReturnValue!133 lt!97400 (_1!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248)))))))

(assert (=> d!57333 (= lt!97400 (insertStrictlySorted!136 (toList!1226 lt!97041) (_1!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248)))))))

(assert (=> d!57333 (= (+!319 lt!97041 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248))) lt!97398)))

(declare-fun b!195169 () Bool)

(declare-fun res!92187 () Bool)

(assert (=> b!195169 (=> (not res!92187) (not e!128360))))

(assert (=> b!195169 (= res!92187 (= (getValueByKey!246 (toList!1226 lt!97398) (_1!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248))))))))

(declare-fun b!195170 () Bool)

(assert (=> b!195170 (= e!128360 (contains!1365 (toList!1226 lt!97398) (tuple2!3501 lt!97037 (minValue!3800 thiss!1248))))))

(assert (= (and d!57333 res!92188) b!195169))

(assert (= (and b!195169 res!92187) b!195170))

(declare-fun m!222775 () Bool)

(assert (=> d!57333 m!222775))

(declare-fun m!222777 () Bool)

(assert (=> d!57333 m!222777))

(declare-fun m!222779 () Bool)

(assert (=> d!57333 m!222779))

(declare-fun m!222781 () Bool)

(assert (=> d!57333 m!222781))

(declare-fun m!222783 () Bool)

(assert (=> b!195169 m!222783))

(declare-fun m!222785 () Bool)

(assert (=> b!195170 m!222785))

(assert (=> b!194447 d!57333))

(declare-fun d!57335 () Bool)

(assert (=> d!57335 (= (apply!188 lt!97047 lt!97044) (get!2244 (getValueByKey!246 (toList!1226 lt!97047) lt!97044)))))

(declare-fun bs!7807 () Bool)

(assert (= bs!7807 d!57335))

(declare-fun m!222787 () Bool)

(assert (=> bs!7807 m!222787))

(assert (=> bs!7807 m!222787))

(declare-fun m!222789 () Bool)

(assert (=> bs!7807 m!222789))

(assert (=> b!194447 d!57335))

(declare-fun d!57337 () Bool)

(assert (=> d!57337 (= (apply!188 (+!319 lt!97041 (tuple2!3501 lt!97037 (minValue!3800 thiss!1248))) lt!97028) (apply!188 lt!97041 lt!97028))))

(declare-fun lt!97402 () Unit!5858)

(assert (=> d!57337 (= lt!97402 (choose!1074 lt!97041 lt!97037 (minValue!3800 thiss!1248) lt!97028))))

(declare-fun e!128361 () Bool)

(assert (=> d!57337 e!128361))

(declare-fun res!92189 () Bool)

(assert (=> d!57337 (=> (not res!92189) (not e!128361))))

(assert (=> d!57337 (= res!92189 (contains!1363 lt!97041 lt!97028))))

(assert (=> d!57337 (= (addApplyDifferent!164 lt!97041 lt!97037 (minValue!3800 thiss!1248) lt!97028) lt!97402)))

(declare-fun b!195171 () Bool)

(assert (=> b!195171 (= e!128361 (not (= lt!97028 lt!97037)))))

(assert (= (and d!57337 res!92189) b!195171))

(declare-fun m!222791 () Bool)

(assert (=> d!57337 m!222791))

(assert (=> d!57337 m!221485))

(assert (=> d!57337 m!221495))

(assert (=> d!57337 m!221485))

(assert (=> d!57337 m!221487))

(declare-fun m!222793 () Bool)

(assert (=> d!57337 m!222793))

(assert (=> b!194447 d!57337))

(declare-fun d!57339 () Bool)

(assert (=> d!57339 (= (apply!188 lt!97048 lt!97042) (get!2244 (getValueByKey!246 (toList!1226 lt!97048) lt!97042)))))

(declare-fun bs!7808 () Bool)

(assert (= bs!7808 d!57339))

(declare-fun m!222795 () Bool)

(assert (=> bs!7808 m!222795))

(assert (=> bs!7808 m!222795))

(declare-fun m!222797 () Bool)

(assert (=> bs!7808 m!222797))

(assert (=> b!194447 d!57339))

(declare-fun d!57341 () Bool)

(assert (=> d!57341 (= (apply!188 (+!319 lt!97047 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248))) lt!97044) (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!97047 (tuple2!3501 lt!97038 (zeroValue!3800 thiss!1248)))) lt!97044)))))

(declare-fun bs!7809 () Bool)

(assert (= bs!7809 d!57341))

(declare-fun m!222799 () Bool)

(assert (=> bs!7809 m!222799))

(assert (=> bs!7809 m!222799))

(declare-fun m!222801 () Bool)

(assert (=> bs!7809 m!222801))

(assert (=> b!194447 d!57341))

(declare-fun d!57343 () Bool)

(declare-fun e!128362 () Bool)

(assert (=> d!57343 e!128362))

(declare-fun res!92191 () Bool)

(assert (=> d!57343 (=> (not res!92191) (not e!128362))))

(declare-fun lt!97403 () ListLongMap!2421)

(assert (=> d!57343 (= res!92191 (contains!1363 lt!97403 (_1!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97405 () List!2408)

(assert (=> d!57343 (= lt!97403 (ListLongMap!2422 lt!97405))))

(declare-fun lt!97406 () Unit!5858)

(declare-fun lt!97404 () Unit!5858)

(assert (=> d!57343 (= lt!97406 lt!97404)))

(assert (=> d!57343 (= (getValueByKey!246 lt!97405 (_1!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57343 (= lt!97404 (lemmaContainsTupThenGetReturnValue!133 lt!97405 (_1!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57343 (= lt!97405 (insertStrictlySorted!136 (toList!1226 lt!97045) (_1!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57343 (= (+!319 lt!97045 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248))) lt!97403)))

(declare-fun b!195172 () Bool)

(declare-fun res!92190 () Bool)

(assert (=> b!195172 (=> (not res!92190) (not e!128362))))

(assert (=> b!195172 (= res!92190 (= (getValueByKey!246 (toList!1226 lt!97403) (_1!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!195173 () Bool)

(assert (=> b!195173 (= e!128362 (contains!1365 (toList!1226 lt!97403) (tuple2!3501 lt!97030 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57343 res!92191) b!195172))

(assert (= (and b!195172 res!92190) b!195173))

(declare-fun m!222803 () Bool)

(assert (=> d!57343 m!222803))

(declare-fun m!222805 () Bool)

(assert (=> d!57343 m!222805))

(declare-fun m!222807 () Bool)

(assert (=> d!57343 m!222807))

(declare-fun m!222809 () Bool)

(assert (=> d!57343 m!222809))

(declare-fun m!222811 () Bool)

(assert (=> b!195172 m!222811))

(declare-fun m!222813 () Bool)

(assert (=> b!195173 m!222813))

(assert (=> b!194447 d!57343))

(declare-fun b!195175 () Bool)

(declare-fun e!128364 () Bool)

(declare-fun call!19706 () Bool)

(assert (=> b!195175 (= e!128364 call!19706)))

(declare-fun b!195176 () Bool)

(declare-fun e!128366 () Bool)

(assert (=> b!195176 (= e!128366 e!128364)))

(declare-fun c!35307 () Bool)

(assert (=> b!195176 (= c!35307 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195177 () Bool)

(assert (=> b!195177 (= e!128364 call!19706)))

(declare-fun bm!19703 () Bool)

(assert (=> bm!19703 (= call!19706 (arrayNoDuplicates!0 (_keys!5953 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!35307 (Cons!2406 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!35138 (Cons!2406 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) Nil!2407) Nil!2407)) (ite c!35138 (Cons!2406 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) Nil!2407) Nil!2407))))))

(declare-fun b!195178 () Bool)

(declare-fun e!128363 () Bool)

(assert (=> b!195178 (= e!128363 (contains!1366 (ite c!35138 (Cons!2406 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) Nil!2407) Nil!2407) (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!57345 () Bool)

(declare-fun res!92193 () Bool)

(declare-fun e!128365 () Bool)

(assert (=> d!57345 (=> res!92193 e!128365)))

(assert (=> d!57345 (= res!92193 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!57345 (= (arrayNoDuplicates!0 (_keys!5953 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35138 (Cons!2406 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000) Nil!2407) Nil!2407)) e!128365)))

(declare-fun b!195174 () Bool)

(assert (=> b!195174 (= e!128365 e!128366)))

(declare-fun res!92194 () Bool)

(assert (=> b!195174 (=> (not res!92194) (not e!128366))))

(assert (=> b!195174 (= res!92194 (not e!128363))))

(declare-fun res!92192 () Bool)

(assert (=> b!195174 (=> (not res!92192) (not e!128363))))

(assert (=> b!195174 (= res!92192 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!57345 (not res!92193)) b!195174))

(assert (= (and b!195174 res!92192) b!195178))

(assert (= (and b!195174 res!92194) b!195176))

(assert (= (and b!195176 c!35307) b!195175))

(assert (= (and b!195176 (not c!35307)) b!195177))

(assert (= (or b!195175 b!195177) bm!19703))

(assert (=> b!195176 m!221933))

(assert (=> b!195176 m!221933))

(assert (=> b!195176 m!221937))

(assert (=> bm!19703 m!221933))

(declare-fun m!222815 () Bool)

(assert (=> bm!19703 m!222815))

(assert (=> b!195178 m!221933))

(assert (=> b!195178 m!221933))

(declare-fun m!222817 () Bool)

(assert (=> b!195178 m!222817))

(assert (=> b!195174 m!221933))

(assert (=> b!195174 m!221933))

(assert (=> b!195174 m!221937))

(assert (=> bm!19666 d!57345))

(declare-fun b!195180 () Bool)

(declare-fun e!128367 () Option!252)

(declare-fun e!128368 () Option!252)

(assert (=> b!195180 (= e!128367 e!128368)))

(declare-fun c!35309 () Bool)

(assert (=> b!195180 (= c!35309 (and ((_ is Cons!2404) (toList!1226 lt!97080)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97080))) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!195182 () Bool)

(assert (=> b!195182 (= e!128368 None!250)))

(declare-fun c!35308 () Bool)

(declare-fun d!57347 () Bool)

(assert (=> d!57347 (= c!35308 (and ((_ is Cons!2404) (toList!1226 lt!97080)) (= (_1!1761 (h!3045 (toList!1226 lt!97080))) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57347 (= (getValueByKey!246 (toList!1226 lt!97080) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) e!128367)))

(declare-fun b!195181 () Bool)

(assert (=> b!195181 (= e!128368 (getValueByKey!246 (t!7326 (toList!1226 lt!97080)) (_1!1761 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195179 () Bool)

(assert (=> b!195179 (= e!128367 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97080)))))))

(assert (= (and d!57347 c!35308) b!195179))

(assert (= (and d!57347 (not c!35308)) b!195180))

(assert (= (and b!195180 c!35309) b!195181))

(assert (= (and b!195180 (not c!35309)) b!195182))

(declare-fun m!222819 () Bool)

(assert (=> b!195181 m!222819))

(assert (=> b!194540 d!57347))

(declare-fun d!57349 () Bool)

(declare-fun res!92195 () Bool)

(declare-fun e!128369 () Bool)

(assert (=> d!57349 (=> res!92195 e!128369)))

(assert (=> d!57349 (= res!92195 (and ((_ is Cons!2404) lt!96993) (= (_1!1761 (h!3045 lt!96993)) (_1!1761 lt!96690))))))

(assert (=> d!57349 (= (containsKey!249 lt!96993 (_1!1761 lt!96690)) e!128369)))

(declare-fun b!195183 () Bool)

(declare-fun e!128370 () Bool)

(assert (=> b!195183 (= e!128369 e!128370)))

(declare-fun res!92196 () Bool)

(assert (=> b!195183 (=> (not res!92196) (not e!128370))))

(assert (=> b!195183 (= res!92196 (and (or (not ((_ is Cons!2404) lt!96993)) (bvsle (_1!1761 (h!3045 lt!96993)) (_1!1761 lt!96690))) ((_ is Cons!2404) lt!96993) (bvslt (_1!1761 (h!3045 lt!96993)) (_1!1761 lt!96690))))))

(declare-fun b!195184 () Bool)

(assert (=> b!195184 (= e!128370 (containsKey!249 (t!7326 lt!96993) (_1!1761 lt!96690)))))

(assert (= (and d!57349 (not res!92195)) b!195183))

(assert (= (and b!195183 res!92196) b!195184))

(declare-fun m!222821 () Bool)

(assert (=> b!195184 m!222821))

(assert (=> b!194373 d!57349))

(assert (=> d!56851 d!56849))

(declare-fun d!57351 () Bool)

(assert (=> d!57351 (= (apply!188 (+!319 lt!96869 (tuple2!3501 lt!96865 (minValue!3800 thiss!1248))) lt!96856) (apply!188 lt!96869 lt!96856))))

(assert (=> d!57351 true))

(declare-fun _$34!1092 () Unit!5858)

(assert (=> d!57351 (= (choose!1074 lt!96869 lt!96865 (minValue!3800 thiss!1248) lt!96856) _$34!1092)))

(declare-fun bs!7810 () Bool)

(assert (= bs!7810 d!57351))

(assert (=> bs!7810 m!221081))

(assert (=> bs!7810 m!221081))

(assert (=> bs!7810 m!221083))

(assert (=> bs!7810 m!221091))

(assert (=> d!56851 d!57351))

(declare-fun d!57353 () Bool)

(declare-fun e!128372 () Bool)

(assert (=> d!57353 e!128372))

(declare-fun res!92197 () Bool)

(assert (=> d!57353 (=> res!92197 e!128372)))

(declare-fun lt!97408 () Bool)

(assert (=> d!57353 (= res!92197 (not lt!97408))))

(declare-fun lt!97410 () Bool)

(assert (=> d!57353 (= lt!97408 lt!97410)))

(declare-fun lt!97407 () Unit!5858)

(declare-fun e!128371 () Unit!5858)

(assert (=> d!57353 (= lt!97407 e!128371)))

(declare-fun c!35310 () Bool)

(assert (=> d!57353 (= c!35310 lt!97410)))

(assert (=> d!57353 (= lt!97410 (containsKey!249 (toList!1226 lt!96869) lt!96856))))

(assert (=> d!57353 (= (contains!1363 lt!96869 lt!96856) lt!97408)))

(declare-fun b!195185 () Bool)

(declare-fun lt!97409 () Unit!5858)

(assert (=> b!195185 (= e!128371 lt!97409)))

(assert (=> b!195185 (= lt!97409 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96869) lt!96856))))

(assert (=> b!195185 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96869) lt!96856))))

(declare-fun b!195186 () Bool)

(declare-fun Unit!5902 () Unit!5858)

(assert (=> b!195186 (= e!128371 Unit!5902)))

(declare-fun b!195187 () Bool)

(assert (=> b!195187 (= e!128372 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96869) lt!96856)))))

(assert (= (and d!57353 c!35310) b!195185))

(assert (= (and d!57353 (not c!35310)) b!195186))

(assert (= (and d!57353 (not res!92197)) b!195187))

(declare-fun m!222823 () Bool)

(assert (=> d!57353 m!222823))

(declare-fun m!222825 () Bool)

(assert (=> b!195185 m!222825))

(assert (=> b!195185 m!221633))

(assert (=> b!195185 m!221633))

(declare-fun m!222827 () Bool)

(assert (=> b!195185 m!222827))

(assert (=> b!195187 m!221633))

(assert (=> b!195187 m!221633))

(assert (=> b!195187 m!222827))

(assert (=> d!56851 d!57353))

(assert (=> d!56851 d!56877))

(assert (=> d!56851 d!56865))

(assert (=> d!56941 d!56939))

(declare-fun d!57355 () Bool)

(assert (=> d!57355 (= (getValueByKey!246 lt!96929 (_1!1761 lt!96690)) (Some!251 (_2!1761 lt!96690)))))

(assert (=> d!57355 true))

(declare-fun _$22!540 () Unit!5858)

(assert (=> d!57355 (= (choose!1076 lt!96929 (_1!1761 lt!96690) (_2!1761 lt!96690)) _$22!540)))

(declare-fun bs!7811 () Bool)

(assert (= bs!7811 d!57355))

(assert (=> bs!7811 m!221199))

(assert (=> d!56941 d!57355))

(declare-fun d!57357 () Bool)

(declare-fun res!92198 () Bool)

(declare-fun e!128373 () Bool)

(assert (=> d!57357 (=> res!92198 e!128373)))

(assert (=> d!57357 (= res!92198 (or ((_ is Nil!2405) lt!96929) ((_ is Nil!2405) (t!7326 lt!96929))))))

(assert (=> d!57357 (= (isStrictlySorted!344 lt!96929) e!128373)))

(declare-fun b!195188 () Bool)

(declare-fun e!128374 () Bool)

(assert (=> b!195188 (= e!128373 e!128374)))

(declare-fun res!92199 () Bool)

(assert (=> b!195188 (=> (not res!92199) (not e!128374))))

(assert (=> b!195188 (= res!92199 (bvslt (_1!1761 (h!3045 lt!96929)) (_1!1761 (h!3045 (t!7326 lt!96929)))))))

(declare-fun b!195189 () Bool)

(assert (=> b!195189 (= e!128374 (isStrictlySorted!344 (t!7326 lt!96929)))))

(assert (= (and d!57357 (not res!92198)) b!195188))

(assert (= (and b!195188 res!92199) b!195189))

(declare-fun m!222829 () Bool)

(assert (=> b!195189 m!222829))

(assert (=> d!56941 d!57357))

(declare-fun d!57359 () Bool)

(assert (=> d!57359 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4257 (getValueByKey!246 (toList!1226 lt!96908) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56901 d!57359))

(assert (=> d!56901 d!56987))

(declare-fun d!57361 () Bool)

(declare-fun e!128376 () Bool)

(assert (=> d!57361 e!128376))

(declare-fun res!92200 () Bool)

(assert (=> d!57361 (=> res!92200 e!128376)))

(declare-fun lt!97412 () Bool)

(assert (=> d!57361 (= res!92200 (not lt!97412))))

(declare-fun lt!97414 () Bool)

(assert (=> d!57361 (= lt!97412 lt!97414)))

(declare-fun lt!97411 () Unit!5858)

(declare-fun e!128375 () Unit!5858)

(assert (=> d!57361 (= lt!97411 e!128375)))

(declare-fun c!35311 () Bool)

(assert (=> d!57361 (= c!35311 lt!97414)))

(assert (=> d!57361 (= lt!97414 (containsKey!249 (toList!1226 lt!97131) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57361 (= (contains!1363 lt!97131 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97412)))

(declare-fun b!195190 () Bool)

(declare-fun lt!97413 () Unit!5858)

(assert (=> b!195190 (= e!128375 lt!97413)))

(assert (=> b!195190 (= lt!97413 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97131) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> b!195190 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97131) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195191 () Bool)

(declare-fun Unit!5903 () Unit!5858)

(assert (=> b!195191 (= e!128375 Unit!5903)))

(declare-fun b!195192 () Bool)

(assert (=> b!195192 (= e!128376 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97131) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (= (and d!57361 c!35311) b!195190))

(assert (= (and d!57361 (not c!35311)) b!195191))

(assert (= (and d!57361 (not res!92200)) b!195192))

(declare-fun m!222831 () Bool)

(assert (=> d!57361 m!222831))

(declare-fun m!222833 () Bool)

(assert (=> b!195190 m!222833))

(assert (=> b!195190 m!221753))

(assert (=> b!195190 m!221753))

(declare-fun m!222835 () Bool)

(assert (=> b!195190 m!222835))

(assert (=> b!195192 m!221753))

(assert (=> b!195192 m!221753))

(assert (=> b!195192 m!222835))

(assert (=> d!56909 d!57361))

(declare-fun b!195194 () Bool)

(declare-fun e!128377 () Option!252)

(declare-fun e!128378 () Option!252)

(assert (=> b!195194 (= e!128377 e!128378)))

(declare-fun c!35313 () Bool)

(assert (=> b!195194 (= c!35313 (and ((_ is Cons!2404) lt!97133) (not (= (_1!1761 (h!3045 lt!97133)) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun b!195196 () Bool)

(assert (=> b!195196 (= e!128378 None!250)))

(declare-fun c!35312 () Bool)

(declare-fun d!57363 () Bool)

(assert (=> d!57363 (= c!35312 (and ((_ is Cons!2404) lt!97133) (= (_1!1761 (h!3045 lt!97133)) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> d!57363 (= (getValueByKey!246 lt!97133 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) e!128377)))

(declare-fun b!195195 () Bool)

(assert (=> b!195195 (= e!128378 (getValueByKey!246 (t!7326 lt!97133) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195193 () Bool)

(assert (=> b!195193 (= e!128377 (Some!251 (_2!1761 (h!3045 lt!97133))))))

(assert (= (and d!57363 c!35312) b!195193))

(assert (= (and d!57363 (not c!35312)) b!195194))

(assert (= (and b!195194 c!35313) b!195195))

(assert (= (and b!195194 (not c!35313)) b!195196))

(declare-fun m!222837 () Bool)

(assert (=> b!195195 m!222837))

(assert (=> d!56909 d!57363))

(declare-fun d!57365 () Bool)

(assert (=> d!57365 (= (getValueByKey!246 lt!97133 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!251 (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!97415 () Unit!5858)

(assert (=> d!57365 (= lt!97415 (choose!1076 lt!97133 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128379 () Bool)

(assert (=> d!57365 e!128379))

(declare-fun res!92201 () Bool)

(assert (=> d!57365 (=> (not res!92201) (not e!128379))))

(assert (=> d!57365 (= res!92201 (isStrictlySorted!344 lt!97133))))

(assert (=> d!57365 (= (lemmaContainsTupThenGetReturnValue!133 lt!97133 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97415)))

(declare-fun b!195197 () Bool)

(declare-fun res!92202 () Bool)

(assert (=> b!195197 (=> (not res!92202) (not e!128379))))

(assert (=> b!195197 (= res!92202 (containsKey!249 lt!97133 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195198 () Bool)

(assert (=> b!195198 (= e!128379 (contains!1365 lt!97133 (tuple2!3501 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (= (and d!57365 res!92201) b!195197))

(assert (= (and b!195197 res!92202) b!195198))

(assert (=> d!57365 m!221747))

(declare-fun m!222839 () Bool)

(assert (=> d!57365 m!222839))

(declare-fun m!222841 () Bool)

(assert (=> d!57365 m!222841))

(declare-fun m!222843 () Bool)

(assert (=> b!195197 m!222843))

(declare-fun m!222845 () Bool)

(assert (=> b!195198 m!222845))

(assert (=> d!56909 d!57365))

(declare-fun b!195199 () Bool)

(declare-fun lt!97416 () List!2408)

(declare-fun e!128381 () Bool)

(assert (=> b!195199 (= e!128381 (contains!1365 lt!97416 (tuple2!3501 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun bm!19704 () Bool)

(declare-fun call!19709 () List!2408)

(declare-fun call!19707 () List!2408)

(assert (=> bm!19704 (= call!19709 call!19707)))

(declare-fun b!195200 () Bool)

(declare-fun e!128380 () List!2408)

(assert (=> b!195200 (= e!128380 (insertStrictlySorted!136 (t!7326 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)))) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195201 () Bool)

(declare-fun e!128384 () List!2408)

(declare-fun call!19708 () List!2408)

(assert (=> b!195201 (= e!128384 call!19708)))

(declare-fun b!195202 () Bool)

(declare-fun res!92203 () Bool)

(assert (=> b!195202 (=> (not res!92203) (not e!128381))))

(assert (=> b!195202 (= res!92203 (containsKey!249 lt!97416 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun bm!19705 () Bool)

(assert (=> bm!19705 (= call!19708 call!19709)))

(declare-fun c!35316 () Bool)

(declare-fun b!195203 () Bool)

(assert (=> b!195203 (= c!35316 (and ((_ is Cons!2404) (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)))) (bvsgt (_1!1761 (h!3045 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618))))) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun e!128383 () List!2408)

(assert (=> b!195203 (= e!128383 e!128384)))

(declare-fun b!195204 () Bool)

(assert (=> b!195204 (= e!128383 call!19709)))

(declare-fun b!195205 () Bool)

(declare-fun e!128382 () List!2408)

(assert (=> b!195205 (= e!128382 e!128383)))

(declare-fun c!35314 () Bool)

(assert (=> b!195205 (= c!35314 (and ((_ is Cons!2404) (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)))) (= (_1!1761 (h!3045 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618))))) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195207 () Bool)

(assert (=> b!195207 (= e!128384 call!19708)))

(declare-fun bm!19706 () Bool)

(declare-fun c!35317 () Bool)

(assert (=> bm!19706 (= call!19707 ($colon$colon!102 e!128380 (ite c!35317 (h!3045 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)))) (tuple2!3501 (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun c!35315 () Bool)

(assert (=> bm!19706 (= c!35315 c!35317)))

(declare-fun b!195208 () Bool)

(assert (=> b!195208 (= e!128382 call!19707)))

(declare-fun b!195206 () Bool)

(assert (=> b!195206 (= e!128380 (ite c!35314 (t!7326 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)))) (ite c!35316 (Cons!2404 (h!3045 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)))) (t!7326 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618))))) Nil!2405)))))

(declare-fun d!57367 () Bool)

(assert (=> d!57367 e!128381))

(declare-fun res!92204 () Bool)

(assert (=> d!57367 (=> (not res!92204) (not e!128381))))

(assert (=> d!57367 (= res!92204 (isStrictlySorted!344 lt!97416))))

(assert (=> d!57367 (= lt!97416 e!128382)))

(assert (=> d!57367 (= c!35317 (and ((_ is Cons!2404) (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618)))) (bvslt (_1!1761 (h!3045 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618))))) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> d!57367 (isStrictlySorted!344 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618))))))

(assert (=> d!57367 (= (insertStrictlySorted!136 (toList!1226 (ite c!35029 call!19617 (ite c!35028 call!19614 call!19618))) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97416)))

(assert (= (and d!57367 c!35317) b!195208))

(assert (= (and d!57367 (not c!35317)) b!195205))

(assert (= (and b!195205 c!35314) b!195204))

(assert (= (and b!195205 (not c!35314)) b!195203))

(assert (= (and b!195203 c!35316) b!195207))

(assert (= (and b!195203 (not c!35316)) b!195201))

(assert (= (or b!195207 b!195201) bm!19705))

(assert (= (or b!195204 bm!19705) bm!19704))

(assert (= (or b!195208 bm!19704) bm!19706))

(assert (= (and bm!19706 c!35315) b!195200))

(assert (= (and bm!19706 (not c!35315)) b!195206))

(assert (= (and d!57367 res!92204) b!195202))

(assert (= (and b!195202 res!92203) b!195199))

(declare-fun m!222847 () Bool)

(assert (=> b!195202 m!222847))

(declare-fun m!222849 () Bool)

(assert (=> b!195200 m!222849))

(declare-fun m!222851 () Bool)

(assert (=> bm!19706 m!222851))

(declare-fun m!222853 () Bool)

(assert (=> b!195199 m!222853))

(declare-fun m!222855 () Bool)

(assert (=> d!57367 m!222855))

(declare-fun m!222857 () Bool)

(assert (=> d!57367 m!222857))

(assert (=> d!56909 d!57367))

(declare-fun d!57369 () Bool)

(declare-fun res!92205 () Bool)

(declare-fun e!128385 () Bool)

(assert (=> d!57369 (=> res!92205 e!128385)))

(assert (=> d!57369 (= res!92205 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (= (_1!1761 (h!3045 (toList!1226 lt!96864))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!57369 (= (containsKey!249 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) e!128385)))

(declare-fun b!195209 () Bool)

(declare-fun e!128386 () Bool)

(assert (=> b!195209 (= e!128385 e!128386)))

(declare-fun res!92206 () Bool)

(assert (=> b!195209 (=> (not res!92206) (not e!128386))))

(assert (=> b!195209 (= res!92206 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96864))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96864))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2404) (toList!1226 lt!96864)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96864))) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!195210 () Bool)

(assert (=> b!195210 (= e!128386 (containsKey!249 (t!7326 (toList!1226 lt!96864)) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57369 (not res!92205)) b!195209))

(assert (= (and b!195209 res!92206) b!195210))

(assert (=> b!195210 m!221041))

(declare-fun m!222859 () Bool)

(assert (=> b!195210 m!222859))

(assert (=> d!56785 d!57369))

(declare-fun d!57371 () Bool)

(assert (=> d!57371 (= (apply!188 lt!97118 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000)) (get!2244 (getValueByKey!246 (toList!1226 lt!97118) (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000))))))

(declare-fun bs!7812 () Bool)

(assert (= bs!7812 d!57371))

(assert (=> bs!7812 m!221539))

(assert (=> bs!7812 m!222343))

(assert (=> bs!7812 m!222343))

(declare-fun m!222861 () Bool)

(assert (=> bs!7812 m!222861))

(assert (=> b!194587 d!57371))

(declare-fun d!57373 () Bool)

(declare-fun c!35318 () Bool)

(assert (=> d!57373 (= c!35318 ((_ is ValueCellFull!1901) (select (arr!3867 (_values!3942 lt!96692)) #b00000000000000000000000000000000)))))

(declare-fun e!128387 () V!5633)

(assert (=> d!57373 (= (get!2243 (select (arr!3867 (_values!3942 lt!96692)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 lt!96692) #b0000000000000000000000000000000000000000000000000000000000000000)) e!128387)))

(declare-fun b!195211 () Bool)

(assert (=> b!195211 (= e!128387 (get!2245 (select (arr!3867 (_values!3942 lt!96692)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 lt!96692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195212 () Bool)

(assert (=> b!195212 (= e!128387 (get!2246 (select (arr!3867 (_values!3942 lt!96692)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 lt!96692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57373 c!35318) b!195211))

(assert (= (and d!57373 (not c!35318)) b!195212))

(assert (=> b!195211 m!221699))

(assert (=> b!195211 m!221701))

(declare-fun m!222863 () Bool)

(assert (=> b!195211 m!222863))

(assert (=> b!195212 m!221699))

(assert (=> b!195212 m!221701))

(declare-fun m!222865 () Bool)

(assert (=> b!195212 m!222865))

(assert (=> b!194587 d!57373))

(declare-fun d!57375 () Bool)

(assert (=> d!57375 (= ($colon$colon!102 e!127864 (ite c!35075 (h!3045 (toList!1226 lt!96700)) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690)))) (Cons!2404 (ite c!35075 (h!3045 (toList!1226 lt!96700)) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))) e!127864))))

(assert (=> bm!19640 d!57375))

(assert (=> d!56775 d!56773))

(assert (=> d!56775 d!56777))

(declare-fun d!57377 () Bool)

(declare-fun e!128389 () Bool)

(assert (=> d!57377 e!128389))

(declare-fun res!92207 () Bool)

(assert (=> d!57377 (=> res!92207 e!128389)))

(declare-fun lt!97418 () Bool)

(assert (=> d!57377 (= res!92207 (not lt!97418))))

(declare-fun lt!97420 () Bool)

(assert (=> d!57377 (= lt!97418 lt!97420)))

(declare-fun lt!97417 () Unit!5858)

(declare-fun e!128388 () Unit!5858)

(assert (=> d!57377 (= lt!97417 e!128388)))

(declare-fun c!35319 () Bool)

(assert (=> d!57377 (= c!35319 lt!97420)))

(assert (=> d!57377 (= lt!97420 (containsKey!249 (toList!1226 lt!96913) lt!96900))))

(assert (=> d!57377 (= (contains!1363 lt!96913 lt!96900) lt!97418)))

(declare-fun b!195213 () Bool)

(declare-fun lt!97419 () Unit!5858)

(assert (=> b!195213 (= e!128388 lt!97419)))

(assert (=> b!195213 (= lt!97419 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96913) lt!96900))))

(assert (=> b!195213 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96913) lt!96900))))

(declare-fun b!195214 () Bool)

(declare-fun Unit!5904 () Unit!5858)

(assert (=> b!195214 (= e!128388 Unit!5904)))

(declare-fun b!195215 () Bool)

(assert (=> b!195215 (= e!128389 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96913) lt!96900)))))

(assert (= (and d!57377 c!35319) b!195213))

(assert (= (and d!57377 (not c!35319)) b!195214))

(assert (= (and d!57377 (not res!92207)) b!195215))

(declare-fun m!222867 () Bool)

(assert (=> d!57377 m!222867))

(declare-fun m!222869 () Bool)

(assert (=> b!195213 m!222869))

(assert (=> b!195213 m!221291))

(assert (=> b!195213 m!221291))

(declare-fun m!222871 () Bool)

(assert (=> b!195213 m!222871))

(assert (=> b!195215 m!221291))

(assert (=> b!195215 m!221291))

(assert (=> b!195215 m!222871))

(assert (=> d!56775 d!57377))

(declare-fun d!57379 () Bool)

(assert (=> d!57379 (= (apply!188 (+!319 lt!96913 (tuple2!3501 lt!96909 (minValue!3800 thiss!1248))) lt!96900) (apply!188 lt!96913 lt!96900))))

(assert (=> d!57379 true))

(declare-fun _$34!1093 () Unit!5858)

(assert (=> d!57379 (= (choose!1074 lt!96913 lt!96909 (minValue!3800 thiss!1248) lt!96900) _$34!1093)))

(declare-fun bs!7813 () Bool)

(assert (= bs!7813 d!57379))

(assert (=> bs!7813 m!221171))

(assert (=> bs!7813 m!221171))

(assert (=> bs!7813 m!221173))

(assert (=> bs!7813 m!221181))

(assert (=> d!56775 d!57379))

(assert (=> d!56775 d!56769))

(declare-fun d!57381 () Bool)

(assert (=> d!57381 (= (apply!188 lt!97036 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2244 (getValueByKey!246 (toList!1226 lt!97036) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7814 () Bool)

(assert (= bs!7814 d!57381))

(assert (=> bs!7814 m!221041))

(assert (=> bs!7814 m!222361))

(assert (=> bs!7814 m!222361))

(declare-fun m!222873 () Bool)

(assert (=> bs!7814 m!222873))

(assert (=> b!194440 d!57381))

(declare-fun c!35320 () Bool)

(declare-fun d!57383 () Bool)

(assert (=> d!57383 (= c!35320 ((_ is ValueCellFull!1901) (select (arr!3867 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!128390 () V!5633)

(assert (=> d!57383 (= (get!2243 (select (arr!3867 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!128390)))

(declare-fun b!195216 () Bool)

(assert (=> b!195216 (= e!128390 (get!2245 (select (arr!3867 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195217 () Bool)

(assert (=> b!195217 (= e!128390 (get!2246 (select (arr!3867 (array!8218 (store (arr!3867 (_values!3942 thiss!1248)) (index!4899 lt!96691) (ValueCellFull!1901 v!309)) (size!4191 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57383 c!35320) b!195216))

(assert (= (and d!57383 (not c!35320)) b!195217))

(assert (=> b!195216 m!221461))

(assert (=> b!195216 m!221057))

(declare-fun m!222875 () Bool)

(assert (=> b!195216 m!222875))

(assert (=> b!195217 m!221461))

(assert (=> b!195217 m!221057))

(declare-fun m!222877 () Bool)

(assert (=> b!195217 m!222877))

(assert (=> b!194440 d!57383))

(declare-fun b!195219 () Bool)

(declare-fun e!128391 () Option!252)

(declare-fun e!128392 () Option!252)

(assert (=> b!195219 (= e!128391 e!128392)))

(declare-fun c!35322 () Bool)

(assert (=> b!195219 (= c!35322 (and ((_ is Cons!2404) (t!7326 lt!96887)) (not (= (_1!1761 (h!3045 (t!7326 lt!96887))) (_1!1761 lt!96690)))))))

(declare-fun b!195221 () Bool)

(assert (=> b!195221 (= e!128392 None!250)))

(declare-fun d!57385 () Bool)

(declare-fun c!35321 () Bool)

(assert (=> d!57385 (= c!35321 (and ((_ is Cons!2404) (t!7326 lt!96887)) (= (_1!1761 (h!3045 (t!7326 lt!96887))) (_1!1761 lt!96690))))))

(assert (=> d!57385 (= (getValueByKey!246 (t!7326 lt!96887) (_1!1761 lt!96690)) e!128391)))

(declare-fun b!195220 () Bool)

(assert (=> b!195220 (= e!128392 (getValueByKey!246 (t!7326 (t!7326 lt!96887)) (_1!1761 lt!96690)))))

(declare-fun b!195218 () Bool)

(assert (=> b!195218 (= e!128391 (Some!251 (_2!1761 (h!3045 (t!7326 lt!96887)))))))

(assert (= (and d!57385 c!35321) b!195218))

(assert (= (and d!57385 (not c!35321)) b!195219))

(assert (= (and b!195219 c!35322) b!195220))

(assert (= (and b!195219 (not c!35322)) b!195221))

(declare-fun m!222879 () Bool)

(assert (=> b!195220 m!222879))

(assert (=> b!194342 d!57385))

(declare-fun d!57387 () Bool)

(assert (=> d!57387 (= (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))) (not ((_ is Some!251) (getValueByKey!246 (toList!1226 lt!96701) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))))

(assert (=> d!56897 d!57387))

(declare-fun d!57389 () Bool)

(declare-fun lt!97421 () Bool)

(assert (=> d!57389 (= lt!97421 (select (content!156 (toList!1226 lt!96956)) (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))

(declare-fun e!128394 () Bool)

(assert (=> d!57389 (= lt!97421 e!128394)))

(declare-fun res!92208 () Bool)

(assert (=> d!57389 (=> (not res!92208) (not e!128394))))

(assert (=> d!57389 (= res!92208 ((_ is Cons!2404) (toList!1226 lt!96956)))))

(assert (=> d!57389 (= (contains!1365 (toList!1226 lt!96956) (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) lt!97421)))

(declare-fun b!195222 () Bool)

(declare-fun e!128393 () Bool)

(assert (=> b!195222 (= e!128394 e!128393)))

(declare-fun res!92209 () Bool)

(assert (=> b!195222 (=> res!92209 e!128393)))

(assert (=> b!195222 (= res!92209 (= (h!3045 (toList!1226 lt!96956)) (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))

(declare-fun b!195223 () Bool)

(assert (=> b!195223 (= e!128393 (contains!1365 (t!7326 (toList!1226 lt!96956)) (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57389 res!92208) b!195222))

(assert (= (and b!195222 (not res!92209)) b!195223))

(declare-fun m!222881 () Bool)

(assert (=> d!57389 m!222881))

(declare-fun m!222883 () Bool)

(assert (=> d!57389 m!222883))

(declare-fun m!222885 () Bool)

(assert (=> b!195223 m!222885))

(assert (=> b!194299 d!57389))

(declare-fun d!57391 () Bool)

(declare-fun res!92210 () Bool)

(declare-fun e!128395 () Bool)

(assert (=> d!57391 (=> res!92210 e!128395)))

(assert (=> d!57391 (= res!92210 (and ((_ is Cons!2404) (toList!1226 lt!96864)) (= (_1!1761 (h!3045 (toList!1226 lt!96864))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57391 (= (containsKey!249 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000) e!128395)))

(declare-fun b!195224 () Bool)

(declare-fun e!128396 () Bool)

(assert (=> b!195224 (= e!128395 e!128396)))

(declare-fun res!92211 () Bool)

(assert (=> b!195224 (=> (not res!92211) (not e!128396))))

(assert (=> b!195224 (= res!92211 (and (or (not ((_ is Cons!2404) (toList!1226 lt!96864))) (bvsle (_1!1761 (h!3045 (toList!1226 lt!96864))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2404) (toList!1226 lt!96864)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96864))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195225 () Bool)

(assert (=> b!195225 (= e!128396 (containsKey!249 (t!7326 (toList!1226 lt!96864)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57391 (not res!92210)) b!195224))

(assert (= (and b!195224 res!92211) b!195225))

(declare-fun m!222887 () Bool)

(assert (=> b!195225 m!222887))

(assert (=> d!56915 d!57391))

(declare-fun d!57393 () Bool)

(assert (=> d!57393 (= (apply!188 (+!319 lt!96919 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) lt!96916) (apply!188 lt!96919 lt!96916))))

(assert (=> d!57393 true))

(declare-fun _$34!1094 () Unit!5858)

(assert (=> d!57393 (= (choose!1074 lt!96919 lt!96910 (zeroValue!3800 thiss!1248) lt!96916) _$34!1094)))

(declare-fun bs!7815 () Bool)

(assert (= bs!7815 d!57393))

(assert (=> bs!7815 m!221175))

(assert (=> bs!7815 m!221175))

(assert (=> bs!7815 m!221183))

(assert (=> bs!7815 m!221167))

(assert (=> d!56763 d!57393))

(assert (=> d!56763 d!56757))

(assert (=> d!56763 d!56781))

(declare-fun d!57395 () Bool)

(declare-fun e!128398 () Bool)

(assert (=> d!57395 e!128398))

(declare-fun res!92212 () Bool)

(assert (=> d!57395 (=> res!92212 e!128398)))

(declare-fun lt!97423 () Bool)

(assert (=> d!57395 (= res!92212 (not lt!97423))))

(declare-fun lt!97425 () Bool)

(assert (=> d!57395 (= lt!97423 lt!97425)))

(declare-fun lt!97422 () Unit!5858)

(declare-fun e!128397 () Unit!5858)

(assert (=> d!57395 (= lt!97422 e!128397)))

(declare-fun c!35323 () Bool)

(assert (=> d!57395 (= c!35323 lt!97425)))

(assert (=> d!57395 (= lt!97425 (containsKey!249 (toList!1226 lt!96919) lt!96916))))

(assert (=> d!57395 (= (contains!1363 lt!96919 lt!96916) lt!97423)))

(declare-fun b!195226 () Bool)

(declare-fun lt!97424 () Unit!5858)

(assert (=> b!195226 (= e!128397 lt!97424)))

(assert (=> b!195226 (= lt!97424 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96919) lt!96916))))

(assert (=> b!195226 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96919) lt!96916))))

(declare-fun b!195227 () Bool)

(declare-fun Unit!5905 () Unit!5858)

(assert (=> b!195227 (= e!128397 Unit!5905)))

(declare-fun b!195228 () Bool)

(assert (=> b!195228 (= e!128398 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96919) lt!96916)))))

(assert (= (and d!57395 c!35323) b!195226))

(assert (= (and d!57395 (not c!35323)) b!195227))

(assert (= (and d!57395 (not res!92212)) b!195228))

(declare-fun m!222889 () Bool)

(assert (=> d!57395 m!222889))

(declare-fun m!222891 () Bool)

(assert (=> b!195226 m!222891))

(assert (=> b!195226 m!221287))

(assert (=> b!195226 m!221287))

(declare-fun m!222893 () Bool)

(assert (=> b!195226 m!222893))

(assert (=> b!195228 m!221287))

(assert (=> b!195228 m!221287))

(assert (=> b!195228 m!222893))

(assert (=> d!56763 d!57395))

(assert (=> d!56763 d!56767))

(assert (=> bm!19631 d!57261))

(declare-fun d!57397 () Bool)

(assert (=> d!57397 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))) (v!4257 (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!56919 d!57397))

(assert (=> d!56919 d!57187))

(declare-fun d!57399 () Bool)

(declare-fun e!128400 () Bool)

(assert (=> d!57399 e!128400))

(declare-fun res!92213 () Bool)

(assert (=> d!57399 (=> res!92213 e!128400)))

(declare-fun lt!97427 () Bool)

(assert (=> d!57399 (= res!92213 (not lt!97427))))

(declare-fun lt!97429 () Bool)

(assert (=> d!57399 (= lt!97427 lt!97429)))

(declare-fun lt!97426 () Unit!5858)

(declare-fun e!128399 () Unit!5858)

(assert (=> d!57399 (= lt!97426 e!128399)))

(declare-fun c!35324 () Bool)

(assert (=> d!57399 (= c!35324 lt!97429)))

(assert (=> d!57399 (= lt!97429 (containsKey!249 (toList!1226 lt!96950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57399 (= (contains!1363 lt!96950 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97427)))

(declare-fun b!195229 () Bool)

(declare-fun lt!97428 () Unit!5858)

(assert (=> b!195229 (= e!128399 lt!97428)))

(assert (=> b!195229 (= lt!97428 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195229 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96950) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195230 () Bool)

(declare-fun Unit!5906 () Unit!5858)

(assert (=> b!195230 (= e!128399 Unit!5906)))

(declare-fun b!195231 () Bool)

(assert (=> b!195231 (= e!128400 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57399 c!35324) b!195229))

(assert (= (and d!57399 (not c!35324)) b!195230))

(assert (= (and d!57399 (not res!92213)) b!195231))

(declare-fun m!222895 () Bool)

(assert (=> d!57399 m!222895))

(declare-fun m!222897 () Bool)

(assert (=> b!195229 m!222897))

(declare-fun m!222899 () Bool)

(assert (=> b!195229 m!222899))

(assert (=> b!195229 m!222899))

(declare-fun m!222901 () Bool)

(assert (=> b!195229 m!222901))

(assert (=> b!195231 m!222899))

(assert (=> b!195231 m!222899))

(assert (=> b!195231 m!222901))

(assert (=> b!194285 d!57399))

(declare-fun lt!97430 () Bool)

(declare-fun d!57401 () Bool)

(assert (=> d!57401 (= lt!97430 (select (content!156 (toList!1226 lt!97131)) (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun e!128402 () Bool)

(assert (=> d!57401 (= lt!97430 e!128402)))

(declare-fun res!92214 () Bool)

(assert (=> d!57401 (=> (not res!92214) (not e!128402))))

(assert (=> d!57401 (= res!92214 ((_ is Cons!2404) (toList!1226 lt!97131)))))

(assert (=> d!57401 (= (contains!1365 (toList!1226 lt!97131) (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97430)))

(declare-fun b!195232 () Bool)

(declare-fun e!128401 () Bool)

(assert (=> b!195232 (= e!128402 e!128401)))

(declare-fun res!92215 () Bool)

(assert (=> b!195232 (=> res!92215 e!128401)))

(assert (=> b!195232 (= res!92215 (= (h!3045 (toList!1226 lt!97131)) (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195233 () Bool)

(assert (=> b!195233 (= e!128401 (contains!1365 (t!7326 (toList!1226 lt!97131)) (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!57401 res!92214) b!195232))

(assert (= (and b!195232 (not res!92215)) b!195233))

(declare-fun m!222903 () Bool)

(assert (=> d!57401 m!222903))

(declare-fun m!222905 () Bool)

(assert (=> d!57401 m!222905))

(declare-fun m!222907 () Bool)

(assert (=> b!195233 m!222907))

(assert (=> b!194612 d!57401))

(declare-fun b!195235 () Bool)

(declare-fun e!128403 () Option!252)

(declare-fun e!128404 () Option!252)

(assert (=> b!195235 (= e!128403 e!128404)))

(declare-fun c!35326 () Bool)

(assert (=> b!195235 (= c!35326 (and ((_ is Cons!2404) (toList!1226 lt!97019)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97019))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195237 () Bool)

(assert (=> b!195237 (= e!128404 None!250)))

(declare-fun d!57403 () Bool)

(declare-fun c!35325 () Bool)

(assert (=> d!57403 (= c!35325 (and ((_ is Cons!2404) (toList!1226 lt!97019)) (= (_1!1761 (h!3045 (toList!1226 lt!97019))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57403 (= (getValueByKey!246 (toList!1226 lt!97019) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) e!128403)))

(declare-fun b!195236 () Bool)

(assert (=> b!195236 (= e!128404 (getValueByKey!246 (t!7326 (toList!1226 lt!97019)) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195234 () Bool)

(assert (=> b!195234 (= e!128403 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97019)))))))

(assert (= (and d!57403 c!35325) b!195234))

(assert (= (and d!57403 (not c!35325)) b!195235))

(assert (= (and b!195235 c!35326) b!195236))

(assert (= (and b!195235 (not c!35326)) b!195237))

(declare-fun m!222909 () Bool)

(assert (=> b!195236 m!222909))

(assert (=> b!194434 d!57403))

(declare-fun d!57405 () Bool)

(assert (=> d!57405 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!97431 () Unit!5858)

(assert (=> d!57405 (= lt!97431 (choose!1077 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128405 () Bool)

(assert (=> d!57405 e!128405))

(declare-fun res!92216 () Bool)

(assert (=> d!57405 (=> (not res!92216) (not e!128405))))

(assert (=> d!57405 (= res!92216 (isStrictlySorted!344 (toList!1226 lt!96864)))))

(assert (=> d!57405 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) lt!97431)))

(declare-fun b!195238 () Bool)

(assert (=> b!195238 (= e!128405 (containsKey!249 (toList!1226 lt!96864) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57405 res!92216) b!195238))

(assert (=> d!57405 m!221041))

(assert (=> d!57405 m!221341))

(assert (=> d!57405 m!221341))

(assert (=> d!57405 m!221343))

(assert (=> d!57405 m!221041))

(declare-fun m!222911 () Bool)

(assert (=> d!57405 m!222911))

(assert (=> d!57405 m!221887))

(assert (=> b!195238 m!221041))

(assert (=> b!195238 m!221337))

(assert (=> b!194326 d!57405))

(assert (=> b!194326 d!57185))

(assert (=> b!194326 d!57187))

(declare-fun b!195240 () Bool)

(declare-fun e!128407 () Bool)

(declare-fun call!19710 () Bool)

(assert (=> b!195240 (= e!128407 call!19710)))

(declare-fun b!195241 () Bool)

(declare-fun e!128409 () Bool)

(assert (=> b!195241 (= e!128409 e!128407)))

(declare-fun c!35327 () Bool)

(assert (=> b!195241 (= c!35327 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195242 () Bool)

(assert (=> b!195242 (= e!128407 call!19710)))

(declare-fun bm!19707 () Bool)

(assert (=> bm!19707 (= call!19710 (arrayNoDuplicates!0 (_keys!5953 lt!96692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!35327 (Cons!2406 (select (arr!3866 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!35117 (Cons!2406 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) Nil!2407) Nil!2407)) (ite c!35117 (Cons!2406 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) Nil!2407) Nil!2407))))))

(declare-fun b!195243 () Bool)

(declare-fun e!128406 () Bool)

(assert (=> b!195243 (= e!128406 (contains!1366 (ite c!35117 (Cons!2406 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) Nil!2407) Nil!2407) (select (arr!3866 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!57407 () Bool)

(declare-fun res!92218 () Bool)

(declare-fun e!128408 () Bool)

(assert (=> d!57407 (=> res!92218 e!128408)))

(assert (=> d!57407 (= res!92218 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!57407 (= (arrayNoDuplicates!0 (_keys!5953 lt!96692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35117 (Cons!2406 (select (arr!3866 (_keys!5953 lt!96692)) #b00000000000000000000000000000000) Nil!2407) Nil!2407)) e!128408)))

(declare-fun b!195239 () Bool)

(assert (=> b!195239 (= e!128408 e!128409)))

(declare-fun res!92219 () Bool)

(assert (=> b!195239 (=> (not res!92219) (not e!128409))))

(assert (=> b!195239 (= res!92219 (not e!128406))))

(declare-fun res!92217 () Bool)

(assert (=> b!195239 (=> (not res!92217) (not e!128406))))

(assert (=> b!195239 (= res!92217 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!57407 (not res!92218)) b!195239))

(assert (= (and b!195239 res!92217) b!195243))

(assert (= (and b!195239 res!92219) b!195241))

(assert (= (and b!195241 c!35327) b!195240))

(assert (= (and b!195241 (not c!35327)) b!195242))

(assert (= (or b!195240 b!195242) bm!19707))

(assert (=> b!195241 m!222287))

(assert (=> b!195241 m!222287))

(assert (=> b!195241 m!222295))

(assert (=> bm!19707 m!222287))

(declare-fun m!222913 () Bool)

(assert (=> bm!19707 m!222913))

(assert (=> b!195243 m!222287))

(assert (=> b!195243 m!222287))

(declare-fun m!222915 () Bool)

(assert (=> b!195243 m!222915))

(assert (=> b!195239 m!222287))

(assert (=> b!195239 m!222287))

(assert (=> b!195239 m!222295))

(assert (=> bm!19655 d!57407))

(declare-fun bm!19708 () Bool)

(declare-fun call!19711 () Bool)

(assert (=> bm!19708 (= call!19711 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun d!57409 () Bool)

(declare-fun res!92221 () Bool)

(declare-fun e!128412 () Bool)

(assert (=> d!57409 (=> res!92221 e!128412)))

(assert (=> d!57409 (= res!92221 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!57409 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) e!128412)))

(declare-fun b!195244 () Bool)

(declare-fun e!128410 () Bool)

(assert (=> b!195244 (= e!128410 call!19711)))

(declare-fun b!195245 () Bool)

(declare-fun e!128411 () Bool)

(assert (=> b!195245 (= e!128411 e!128410)))

(declare-fun lt!97433 () (_ BitVec 64))

(assert (=> b!195245 (= lt!97433 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!97432 () Unit!5858)

(assert (=> b!195245 (= lt!97432 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5953 thiss!1248) lt!97433 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!195245 (arrayContainsKey!0 (_keys!5953 thiss!1248) lt!97433 #b00000000000000000000000000000000)))

(declare-fun lt!97434 () Unit!5858)

(assert (=> b!195245 (= lt!97434 lt!97432)))

(declare-fun res!92220 () Bool)

(assert (=> b!195245 (= res!92220 (= (seekEntryOrOpen!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) (Found!682 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195245 (=> (not res!92220) (not e!128410))))

(declare-fun b!195246 () Bool)

(assert (=> b!195246 (= e!128411 call!19711)))

(declare-fun b!195247 () Bool)

(assert (=> b!195247 (= e!128412 e!128411)))

(declare-fun c!35328 () Bool)

(assert (=> b!195247 (= c!35328 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!57409 (not res!92221)) b!195247))

(assert (= (and b!195247 c!35328) b!195245))

(assert (= (and b!195247 (not c!35328)) b!195246))

(assert (= (and b!195245 res!92220) b!195244))

(assert (= (or b!195244 b!195246) bm!19708))

(declare-fun m!222917 () Bool)

(assert (=> bm!19708 m!222917))

(assert (=> b!195245 m!221933))

(declare-fun m!222919 () Bool)

(assert (=> b!195245 m!222919))

(declare-fun m!222921 () Bool)

(assert (=> b!195245 m!222921))

(assert (=> b!195245 m!221933))

(declare-fun m!222923 () Bool)

(assert (=> b!195245 m!222923))

(assert (=> b!195247 m!221933))

(assert (=> b!195247 m!221933))

(assert (=> b!195247 m!221937))

(assert (=> bm!19644 d!57409))

(declare-fun d!57411 () Bool)

(assert (=> d!57411 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97435 () Unit!5858)

(assert (=> d!57411 (= lt!97435 (choose!1077 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128413 () Bool)

(assert (=> d!57411 e!128413))

(declare-fun res!92222 () Bool)

(assert (=> d!57411 (=> (not res!92222) (not e!128413))))

(assert (=> d!57411 (= res!92222 (isStrictlySorted!344 (toList!1226 lt!96864)))))

(assert (=> d!57411 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000) lt!97435)))

(declare-fun b!195248 () Bool)

(assert (=> b!195248 (= e!128413 (containsKey!249 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57411 res!92222) b!195248))

(assert (=> d!57411 m!221385))

(assert (=> d!57411 m!221385))

(assert (=> d!57411 m!221781))

(declare-fun m!222925 () Bool)

(assert (=> d!57411 m!222925))

(assert (=> d!57411 m!221887))

(assert (=> b!195248 m!221777))

(assert (=> b!194618 d!57411))

(assert (=> b!194618 d!57191))

(assert (=> b!194618 d!57193))

(declare-fun b!195249 () Bool)

(declare-fun e!128415 () Bool)

(declare-fun lt!97436 () List!2408)

(assert (=> b!195249 (= e!128415 (contains!1365 lt!97436 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun bm!19709 () Bool)

(declare-fun call!19714 () List!2408)

(declare-fun call!19712 () List!2408)

(assert (=> bm!19709 (= call!19714 call!19712)))

(declare-fun b!195250 () Bool)

(declare-fun e!128414 () List!2408)

(assert (=> b!195250 (= e!128414 (insertStrictlySorted!136 (t!7326 (t!7326 (toList!1226 (map!2018 thiss!1248)))) (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(declare-fun b!195251 () Bool)

(declare-fun e!128418 () List!2408)

(declare-fun call!19713 () List!2408)

(assert (=> b!195251 (= e!128418 call!19713)))

(declare-fun b!195252 () Bool)

(declare-fun res!92223 () Bool)

(assert (=> b!195252 (=> (not res!92223) (not e!128415))))

(assert (=> b!195252 (= res!92223 (containsKey!249 lt!97436 (_1!1761 lt!96690)))))

(declare-fun bm!19710 () Bool)

(assert (=> bm!19710 (= call!19713 call!19714)))

(declare-fun b!195253 () Bool)

(declare-fun c!35331 () Bool)

(assert (=> b!195253 (= c!35331 (and ((_ is Cons!2404) (t!7326 (toList!1226 (map!2018 thiss!1248)))) (bvsgt (_1!1761 (h!3045 (t!7326 (toList!1226 (map!2018 thiss!1248))))) (_1!1761 lt!96690))))))

(declare-fun e!128417 () List!2408)

(assert (=> b!195253 (= e!128417 e!128418)))

(declare-fun b!195254 () Bool)

(assert (=> b!195254 (= e!128417 call!19714)))

(declare-fun b!195255 () Bool)

(declare-fun e!128416 () List!2408)

(assert (=> b!195255 (= e!128416 e!128417)))

(declare-fun c!35329 () Bool)

(assert (=> b!195255 (= c!35329 (and ((_ is Cons!2404) (t!7326 (toList!1226 (map!2018 thiss!1248)))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 (map!2018 thiss!1248))))) (_1!1761 lt!96690))))))

(declare-fun b!195257 () Bool)

(assert (=> b!195257 (= e!128418 call!19713)))

(declare-fun c!35332 () Bool)

(declare-fun bm!19711 () Bool)

(assert (=> bm!19711 (= call!19712 ($colon$colon!102 e!128414 (ite c!35332 (h!3045 (t!7326 (toList!1226 (map!2018 thiss!1248)))) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690)))))))

(declare-fun c!35330 () Bool)

(assert (=> bm!19711 (= c!35330 c!35332)))

(declare-fun b!195258 () Bool)

(assert (=> b!195258 (= e!128416 call!19712)))

(declare-fun b!195256 () Bool)

(assert (=> b!195256 (= e!128414 (ite c!35329 (t!7326 (t!7326 (toList!1226 (map!2018 thiss!1248)))) (ite c!35331 (Cons!2404 (h!3045 (t!7326 (toList!1226 (map!2018 thiss!1248)))) (t!7326 (t!7326 (toList!1226 (map!2018 thiss!1248))))) Nil!2405)))))

(declare-fun d!57413 () Bool)

(assert (=> d!57413 e!128415))

(declare-fun res!92224 () Bool)

(assert (=> d!57413 (=> (not res!92224) (not e!128415))))

(assert (=> d!57413 (= res!92224 (isStrictlySorted!344 lt!97436))))

(assert (=> d!57413 (= lt!97436 e!128416)))

(assert (=> d!57413 (= c!35332 (and ((_ is Cons!2404) (t!7326 (toList!1226 (map!2018 thiss!1248)))) (bvslt (_1!1761 (h!3045 (t!7326 (toList!1226 (map!2018 thiss!1248))))) (_1!1761 lt!96690))))))

(assert (=> d!57413 (isStrictlySorted!344 (t!7326 (toList!1226 (map!2018 thiss!1248))))))

(assert (=> d!57413 (= (insertStrictlySorted!136 (t!7326 (toList!1226 (map!2018 thiss!1248))) (_1!1761 lt!96690) (_2!1761 lt!96690)) lt!97436)))

(assert (= (and d!57413 c!35332) b!195258))

(assert (= (and d!57413 (not c!35332)) b!195255))

(assert (= (and b!195255 c!35329) b!195254))

(assert (= (and b!195255 (not c!35329)) b!195253))

(assert (= (and b!195253 c!35331) b!195257))

(assert (= (and b!195253 (not c!35331)) b!195251))

(assert (= (or b!195257 b!195251) bm!19710))

(assert (= (or b!195254 bm!19710) bm!19709))

(assert (= (or b!195258 bm!19709) bm!19711))

(assert (= (and bm!19711 c!35330) b!195250))

(assert (= (and bm!19711 (not c!35330)) b!195256))

(assert (= (and d!57413 res!92224) b!195252))

(assert (= (and b!195252 res!92223) b!195249))

(declare-fun m!222927 () Bool)

(assert (=> b!195252 m!222927))

(declare-fun m!222929 () Bool)

(assert (=> b!195250 m!222929))

(declare-fun m!222931 () Bool)

(assert (=> bm!19711 m!222931))

(declare-fun m!222933 () Bool)

(assert (=> b!195249 m!222933))

(declare-fun m!222935 () Bool)

(assert (=> d!57413 m!222935))

(declare-fun m!222937 () Bool)

(assert (=> d!57413 m!222937))

(assert (=> b!194673 d!57413))

(declare-fun d!57415 () Bool)

(declare-fun e!128420 () Bool)

(assert (=> d!57415 e!128420))

(declare-fun res!92225 () Bool)

(assert (=> d!57415 (=> res!92225 e!128420)))

(declare-fun lt!97438 () Bool)

(assert (=> d!57415 (= res!92225 (not lt!97438))))

(declare-fun lt!97440 () Bool)

(assert (=> d!57415 (= lt!97438 lt!97440)))

(declare-fun lt!97437 () Unit!5858)

(declare-fun e!128419 () Unit!5858)

(assert (=> d!57415 (= lt!97437 e!128419)))

(declare-fun c!35333 () Bool)

(assert (=> d!57415 (= c!35333 lt!97440)))

(assert (=> d!57415 (= lt!97440 (containsKey!249 (toList!1226 lt!96950) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!57415 (= (contains!1363 lt!96950 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) lt!97438)))

(declare-fun b!195259 () Bool)

(declare-fun lt!97439 () Unit!5858)

(assert (=> b!195259 (= e!128419 lt!97439)))

(assert (=> b!195259 (= lt!97439 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96950) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!195259 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96950) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!195260 () Bool)

(declare-fun Unit!5907 () Unit!5858)

(assert (=> b!195260 (= e!128419 Unit!5907)))

(declare-fun b!195261 () Bool)

(assert (=> b!195261 (= e!128420 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96950) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!57415 c!35333) b!195259))

(assert (= (and d!57415 (not c!35333)) b!195260))

(assert (= (and d!57415 (not res!92225)) b!195261))

(assert (=> d!57415 m!221041))

(declare-fun m!222939 () Bool)

(assert (=> d!57415 m!222939))

(assert (=> b!195259 m!221041))

(declare-fun m!222941 () Bool)

(assert (=> b!195259 m!222941))

(assert (=> b!195259 m!221041))

(declare-fun m!222943 () Bool)

(assert (=> b!195259 m!222943))

(assert (=> b!195259 m!222943))

(declare-fun m!222945 () Bool)

(assert (=> b!195259 m!222945))

(assert (=> b!195261 m!221041))

(assert (=> b!195261 m!222943))

(assert (=> b!195261 m!222943))

(assert (=> b!195261 m!222945))

(assert (=> b!194293 d!57415))

(declare-fun d!57417 () Bool)

(assert (=> d!57417 (= (get!2246 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194646 d!57417))

(declare-fun d!57419 () Bool)

(declare-fun e!128422 () Bool)

(assert (=> d!57419 e!128422))

(declare-fun res!92226 () Bool)

(assert (=> d!57419 (=> res!92226 e!128422)))

(declare-fun lt!97442 () Bool)

(assert (=> d!57419 (= res!92226 (not lt!97442))))

(declare-fun lt!97444 () Bool)

(assert (=> d!57419 (= lt!97442 lt!97444)))

(declare-fun lt!97441 () Unit!5858)

(declare-fun e!128421 () Unit!5858)

(assert (=> d!57419 (= lt!97441 e!128421)))

(declare-fun c!35334 () Bool)

(assert (=> d!57419 (= c!35334 lt!97444)))

(assert (=> d!57419 (= lt!97444 (containsKey!249 (toList!1226 lt!96956) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57419 (= (contains!1363 lt!96956 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) lt!97442)))

(declare-fun b!195262 () Bool)

(declare-fun lt!97443 () Unit!5858)

(assert (=> b!195262 (= e!128421 lt!97443)))

(assert (=> b!195262 (= lt!97443 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96956) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(assert (=> b!195262 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96956) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195263 () Bool)

(declare-fun Unit!5908 () Unit!5858)

(assert (=> b!195263 (= e!128421 Unit!5908)))

(declare-fun b!195264 () Bool)

(assert (=> b!195264 (= e!128422 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96956) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57419 c!35334) b!195262))

(assert (= (and d!57419 (not c!35334)) b!195263))

(assert (= (and d!57419 (not res!92226)) b!195264))

(declare-fun m!222947 () Bool)

(assert (=> d!57419 m!222947))

(declare-fun m!222949 () Bool)

(assert (=> b!195262 m!222949))

(assert (=> b!195262 m!221263))

(assert (=> b!195262 m!221263))

(declare-fun m!222951 () Bool)

(assert (=> b!195262 m!222951))

(assert (=> b!195264 m!221263))

(assert (=> b!195264 m!221263))

(assert (=> b!195264 m!222951))

(assert (=> d!56757 d!57419))

(declare-fun b!195266 () Bool)

(declare-fun e!128423 () Option!252)

(declare-fun e!128424 () Option!252)

(assert (=> b!195266 (= e!128423 e!128424)))

(declare-fun c!35336 () Bool)

(assert (=> b!195266 (= c!35336 (and ((_ is Cons!2404) lt!96958) (not (= (_1!1761 (h!3045 lt!96958)) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!195268 () Bool)

(assert (=> b!195268 (= e!128424 None!250)))

(declare-fun c!35335 () Bool)

(declare-fun d!57421 () Bool)

(assert (=> d!57421 (= c!35335 (and ((_ is Cons!2404) lt!96958) (= (_1!1761 (h!3045 lt!96958)) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57421 (= (getValueByKey!246 lt!96958 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) e!128423)))

(declare-fun b!195267 () Bool)

(assert (=> b!195267 (= e!128424 (getValueByKey!246 (t!7326 lt!96958) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195265 () Bool)

(assert (=> b!195265 (= e!128423 (Some!251 (_2!1761 (h!3045 lt!96958))))))

(assert (= (and d!57421 c!35335) b!195265))

(assert (= (and d!57421 (not c!35335)) b!195266))

(assert (= (and b!195266 c!35336) b!195267))

(assert (= (and b!195266 (not c!35336)) b!195268))

(declare-fun m!222953 () Bool)

(assert (=> b!195267 m!222953))

(assert (=> d!56757 d!57421))

(declare-fun d!57423 () Bool)

(assert (=> d!57423 (= (getValueByKey!246 lt!96958 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97445 () Unit!5858)

(assert (=> d!57423 (= lt!97445 (choose!1076 lt!96958 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun e!128425 () Bool)

(assert (=> d!57423 e!128425))

(declare-fun res!92227 () Bool)

(assert (=> d!57423 (=> (not res!92227) (not e!128425))))

(assert (=> d!57423 (= res!92227 (isStrictlySorted!344 lt!96958))))

(assert (=> d!57423 (= (lemmaContainsTupThenGetReturnValue!133 lt!96958 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) lt!97445)))

(declare-fun b!195269 () Bool)

(declare-fun res!92228 () Bool)

(assert (=> b!195269 (=> (not res!92228) (not e!128425))))

(assert (=> b!195269 (= res!92228 (containsKey!249 lt!96958 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195270 () Bool)

(assert (=> b!195270 (= e!128425 (contains!1365 lt!96958 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57423 res!92227) b!195269))

(assert (= (and b!195269 res!92228) b!195270))

(assert (=> d!57423 m!221257))

(declare-fun m!222955 () Bool)

(assert (=> d!57423 m!222955))

(declare-fun m!222957 () Bool)

(assert (=> d!57423 m!222957))

(declare-fun m!222959 () Bool)

(assert (=> b!195269 m!222959))

(declare-fun m!222961 () Bool)

(assert (=> b!195270 m!222961))

(assert (=> d!56757 d!57423))

(declare-fun e!128427 () Bool)

(declare-fun lt!97446 () List!2408)

(declare-fun b!195271 () Bool)

(assert (=> b!195271 (= e!128427 (contains!1365 lt!97446 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(declare-fun bm!19712 () Bool)

(declare-fun call!19717 () List!2408)

(declare-fun call!19715 () List!2408)

(assert (=> bm!19712 (= call!19717 call!19715)))

(declare-fun b!195272 () Bool)

(declare-fun e!128426 () List!2408)

(assert (=> b!195272 (= e!128426 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96919)) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195273 () Bool)

(declare-fun e!128430 () List!2408)

(declare-fun call!19716 () List!2408)

(assert (=> b!195273 (= e!128430 call!19716)))

(declare-fun b!195274 () Bool)

(declare-fun res!92229 () Bool)

(assert (=> b!195274 (=> (not res!92229) (not e!128427))))

(assert (=> b!195274 (= res!92229 (containsKey!249 lt!97446 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun bm!19713 () Bool)

(assert (=> bm!19713 (= call!19716 call!19717)))

(declare-fun b!195275 () Bool)

(declare-fun c!35339 () Bool)

(assert (=> b!195275 (= c!35339 (and ((_ is Cons!2404) (toList!1226 lt!96919)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96919))) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128429 () List!2408)

(assert (=> b!195275 (= e!128429 e!128430)))

(declare-fun b!195276 () Bool)

(assert (=> b!195276 (= e!128429 call!19717)))

(declare-fun b!195277 () Bool)

(declare-fun e!128428 () List!2408)

(assert (=> b!195277 (= e!128428 e!128429)))

(declare-fun c!35337 () Bool)

(assert (=> b!195277 (= c!35337 (and ((_ is Cons!2404) (toList!1226 lt!96919)) (= (_1!1761 (h!3045 (toList!1226 lt!96919))) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!195279 () Bool)

(assert (=> b!195279 (= e!128430 call!19716)))

(declare-fun c!35340 () Bool)

(declare-fun bm!19714 () Bool)

(assert (=> bm!19714 (= call!19715 ($colon$colon!102 e!128426 (ite c!35340 (h!3045 (toList!1226 lt!96919)) (tuple2!3501 (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))))

(declare-fun c!35338 () Bool)

(assert (=> bm!19714 (= c!35338 c!35340)))

(declare-fun b!195280 () Bool)

(assert (=> b!195280 (= e!128428 call!19715)))

(declare-fun b!195278 () Bool)

(assert (=> b!195278 (= e!128426 (ite c!35337 (t!7326 (toList!1226 lt!96919)) (ite c!35339 (Cons!2404 (h!3045 (toList!1226 lt!96919)) (t!7326 (toList!1226 lt!96919))) Nil!2405)))))

(declare-fun d!57425 () Bool)

(assert (=> d!57425 e!128427))

(declare-fun res!92230 () Bool)

(assert (=> d!57425 (=> (not res!92230) (not e!128427))))

(assert (=> d!57425 (= res!92230 (isStrictlySorted!344 lt!97446))))

(assert (=> d!57425 (= lt!97446 e!128428)))

(assert (=> d!57425 (= c!35340 (and ((_ is Cons!2404) (toList!1226 lt!96919)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96919))) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57425 (isStrictlySorted!344 (toList!1226 lt!96919))))

(assert (=> d!57425 (= (insertStrictlySorted!136 (toList!1226 lt!96919) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) lt!97446)))

(assert (= (and d!57425 c!35340) b!195280))

(assert (= (and d!57425 (not c!35340)) b!195277))

(assert (= (and b!195277 c!35337) b!195276))

(assert (= (and b!195277 (not c!35337)) b!195275))

(assert (= (and b!195275 c!35339) b!195279))

(assert (= (and b!195275 (not c!35339)) b!195273))

(assert (= (or b!195279 b!195273) bm!19713))

(assert (= (or b!195276 bm!19713) bm!19712))

(assert (= (or b!195280 bm!19712) bm!19714))

(assert (= (and bm!19714 c!35338) b!195272))

(assert (= (and bm!19714 (not c!35338)) b!195278))

(assert (= (and d!57425 res!92230) b!195274))

(assert (= (and b!195274 res!92229) b!195271))

(declare-fun m!222963 () Bool)

(assert (=> b!195274 m!222963))

(declare-fun m!222965 () Bool)

(assert (=> b!195272 m!222965))

(declare-fun m!222967 () Bool)

(assert (=> bm!19714 m!222967))

(declare-fun m!222969 () Bool)

(assert (=> b!195271 m!222969))

(declare-fun m!222971 () Bool)

(assert (=> d!57425 m!222971))

(declare-fun m!222973 () Bool)

(assert (=> d!57425 m!222973))

(assert (=> d!56757 d!57425))

(declare-fun d!57427 () Bool)

(assert (=> d!57427 (= (isEmpty!494 (getValueByKey!246 (toList!1226 lt!96696) key!828)) (not ((_ is Some!251) (getValueByKey!246 (toList!1226 lt!96696) key!828))))))

(assert (=> d!56845 d!57427))

(declare-fun d!57429 () Bool)

(declare-fun res!92231 () Bool)

(declare-fun e!128431 () Bool)

(assert (=> d!57429 (=> res!92231 e!128431)))

(assert (=> d!57429 (= res!92231 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96700))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700)))) key!828)))))

(assert (=> d!57429 (= (containsKey!249 (t!7326 (toList!1226 lt!96700)) key!828) e!128431)))

(declare-fun b!195281 () Bool)

(declare-fun e!128432 () Bool)

(assert (=> b!195281 (= e!128431 e!128432)))

(declare-fun res!92232 () Bool)

(assert (=> b!195281 (=> (not res!92232) (not e!128432))))

(assert (=> b!195281 (= res!92232 (and (or (not ((_ is Cons!2404) (t!7326 (toList!1226 lt!96700)))) (bvsle (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700)))) key!828)) ((_ is Cons!2404) (t!7326 (toList!1226 lt!96700))) (bvslt (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700)))) key!828)))))

(declare-fun b!195282 () Bool)

(assert (=> b!195282 (= e!128432 (containsKey!249 (t!7326 (t!7326 (toList!1226 lt!96700))) key!828))))

(assert (= (and d!57429 (not res!92231)) b!195281))

(assert (= (and b!195281 res!92232) b!195282))

(declare-fun m!222975 () Bool)

(assert (=> b!195282 m!222975))

(assert (=> b!194565 d!57429))

(assert (=> b!194490 d!56965))

(declare-fun d!57431 () Bool)

(assert (=> d!57431 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4257 (getValueByKey!246 (toList!1226 lt!96864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56803 d!57431))

(assert (=> d!56803 d!57193))

(assert (=> b!194468 d!56961))

(assert (=> b!194468 d!56963))

(declare-fun d!57433 () Bool)

(declare-fun lt!97447 () Bool)

(assert (=> d!57433 (= lt!97447 (select (content!156 (toList!1226 lt!97084)) (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))

(declare-fun e!128434 () Bool)

(assert (=> d!57433 (= lt!97447 e!128434)))

(declare-fun res!92233 () Bool)

(assert (=> d!57433 (=> (not res!92233) (not e!128434))))

(assert (=> d!57433 (= res!92233 ((_ is Cons!2404) (toList!1226 lt!97084)))))

(assert (=> d!57433 (= (contains!1365 (toList!1226 lt!97084) (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) lt!97447)))

(declare-fun b!195283 () Bool)

(declare-fun e!128433 () Bool)

(assert (=> b!195283 (= e!128434 e!128433)))

(declare-fun res!92234 () Bool)

(assert (=> b!195283 (=> res!92234 e!128433)))

(assert (=> b!195283 (= res!92234 (= (h!3045 (toList!1226 lt!97084)) (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))

(declare-fun b!195284 () Bool)

(assert (=> b!195284 (= e!128433 (contains!1365 (t!7326 (toList!1226 lt!97084)) (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57433 res!92233) b!195283))

(assert (= (and b!195283 (not res!92234)) b!195284))

(declare-fun m!222977 () Bool)

(assert (=> d!57433 m!222977))

(declare-fun m!222979 () Bool)

(assert (=> d!57433 m!222979))

(declare-fun m!222981 () Bool)

(assert (=> b!195284 m!222981))

(assert (=> b!194543 d!57433))

(declare-fun d!57435 () Bool)

(assert (=> d!57435 (= (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) lt!96914)) (v!4257 (getValueByKey!246 (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) lt!96914)))))

(assert (=> d!56753 d!57435))

(declare-fun b!195286 () Bool)

(declare-fun e!128435 () Option!252)

(declare-fun e!128436 () Option!252)

(assert (=> b!195286 (= e!128435 e!128436)))

(declare-fun c!35342 () Bool)

(assert (=> b!195286 (= c!35342 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))) (not (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))) lt!96914))))))

(declare-fun b!195288 () Bool)

(assert (=> b!195288 (= e!128436 None!250)))

(declare-fun c!35341 () Bool)

(declare-fun d!57437 () Bool)

(assert (=> d!57437 (= c!35341 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))))) lt!96914)))))

(assert (=> d!57437 (= (getValueByKey!246 (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248)))) lt!96914) e!128435)))

(declare-fun b!195287 () Bool)

(assert (=> b!195287 (= e!128436 (getValueByKey!246 (t!7326 (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))) lt!96914))))

(declare-fun b!195285 () Bool)

(assert (=> b!195285 (= e!128435 (Some!251 (_2!1761 (h!3045 (toList!1226 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))))))))))

(assert (= (and d!57437 c!35341) b!195285))

(assert (= (and d!57437 (not c!35341)) b!195286))

(assert (= (and b!195286 c!35342) b!195287))

(assert (= (and b!195286 (not c!35342)) b!195288))

(declare-fun m!222983 () Bool)

(assert (=> b!195287 m!222983))

(assert (=> d!56753 d!57437))

(declare-fun d!57439 () Bool)

(declare-fun e!128438 () Bool)

(assert (=> d!57439 e!128438))

(declare-fun res!92235 () Bool)

(assert (=> d!57439 (=> res!92235 e!128438)))

(declare-fun lt!97449 () Bool)

(assert (=> d!57439 (= res!92235 (not lt!97449))))

(declare-fun lt!97451 () Bool)

(assert (=> d!57439 (= lt!97449 lt!97451)))

(declare-fun lt!97448 () Unit!5858)

(declare-fun e!128437 () Unit!5858)

(assert (=> d!57439 (= lt!97448 e!128437)))

(declare-fun c!35343 () Bool)

(assert (=> d!57439 (= c!35343 lt!97451)))

(assert (=> d!57439 (= lt!97451 (containsKey!249 (toList!1226 lt!97023) (_1!1761 (tuple2!3501 key!828 v!309))))))

(assert (=> d!57439 (= (contains!1363 lt!97023 (_1!1761 (tuple2!3501 key!828 v!309))) lt!97449)))

(declare-fun b!195289 () Bool)

(declare-fun lt!97450 () Unit!5858)

(assert (=> b!195289 (= e!128437 lt!97450)))

(assert (=> b!195289 (= lt!97450 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97023) (_1!1761 (tuple2!3501 key!828 v!309))))))

(assert (=> b!195289 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97023) (_1!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun b!195290 () Bool)

(declare-fun Unit!5909 () Unit!5858)

(assert (=> b!195290 (= e!128437 Unit!5909)))

(declare-fun b!195291 () Bool)

(assert (=> b!195291 (= e!128438 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97023) (_1!1761 (tuple2!3501 key!828 v!309)))))))

(assert (= (and d!57439 c!35343) b!195289))

(assert (= (and d!57439 (not c!35343)) b!195290))

(assert (= (and d!57439 (not res!92235)) b!195291))

(declare-fun m!222985 () Bool)

(assert (=> d!57439 m!222985))

(declare-fun m!222987 () Bool)

(assert (=> b!195289 m!222987))

(assert (=> b!195289 m!221445))

(assert (=> b!195289 m!221445))

(declare-fun m!222989 () Bool)

(assert (=> b!195289 m!222989))

(assert (=> b!195291 m!221445))

(assert (=> b!195291 m!221445))

(assert (=> b!195291 m!222989))

(assert (=> d!56813 d!57439))

(declare-fun b!195293 () Bool)

(declare-fun e!128439 () Option!252)

(declare-fun e!128440 () Option!252)

(assert (=> b!195293 (= e!128439 e!128440)))

(declare-fun c!35345 () Bool)

(assert (=> b!195293 (= c!35345 (and ((_ is Cons!2404) lt!97025) (not (= (_1!1761 (h!3045 lt!97025)) (_1!1761 (tuple2!3501 key!828 v!309))))))))

(declare-fun b!195295 () Bool)

(assert (=> b!195295 (= e!128440 None!250)))

(declare-fun d!57441 () Bool)

(declare-fun c!35344 () Bool)

(assert (=> d!57441 (= c!35344 (and ((_ is Cons!2404) lt!97025) (= (_1!1761 (h!3045 lt!97025)) (_1!1761 (tuple2!3501 key!828 v!309)))))))

(assert (=> d!57441 (= (getValueByKey!246 lt!97025 (_1!1761 (tuple2!3501 key!828 v!309))) e!128439)))

(declare-fun b!195294 () Bool)

(assert (=> b!195294 (= e!128440 (getValueByKey!246 (t!7326 lt!97025) (_1!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun b!195292 () Bool)

(assert (=> b!195292 (= e!128439 (Some!251 (_2!1761 (h!3045 lt!97025))))))

(assert (= (and d!57441 c!35344) b!195292))

(assert (= (and d!57441 (not c!35344)) b!195293))

(assert (= (and b!195293 c!35345) b!195294))

(assert (= (and b!195293 (not c!35345)) b!195295))

(declare-fun m!222991 () Bool)

(assert (=> b!195294 m!222991))

(assert (=> d!56813 d!57441))

(declare-fun d!57443 () Bool)

(assert (=> d!57443 (= (getValueByKey!246 lt!97025 (_1!1761 (tuple2!3501 key!828 v!309))) (Some!251 (_2!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun lt!97452 () Unit!5858)

(assert (=> d!57443 (= lt!97452 (choose!1076 lt!97025 (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun e!128441 () Bool)

(assert (=> d!57443 e!128441))

(declare-fun res!92236 () Bool)

(assert (=> d!57443 (=> (not res!92236) (not e!128441))))

(assert (=> d!57443 (= res!92236 (isStrictlySorted!344 lt!97025))))

(assert (=> d!57443 (= (lemmaContainsTupThenGetReturnValue!133 lt!97025 (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309))) lt!97452)))

(declare-fun b!195296 () Bool)

(declare-fun res!92237 () Bool)

(assert (=> b!195296 (=> (not res!92237) (not e!128441))))

(assert (=> b!195296 (= res!92237 (containsKey!249 lt!97025 (_1!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun b!195297 () Bool)

(assert (=> b!195297 (= e!128441 (contains!1365 lt!97025 (tuple2!3501 (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309)))))))

(assert (= (and d!57443 res!92236) b!195296))

(assert (= (and b!195296 res!92237) b!195297))

(assert (=> d!57443 m!221439))

(declare-fun m!222993 () Bool)

(assert (=> d!57443 m!222993))

(declare-fun m!222995 () Bool)

(assert (=> d!57443 m!222995))

(declare-fun m!222997 () Bool)

(assert (=> b!195296 m!222997))

(declare-fun m!222999 () Bool)

(assert (=> b!195297 m!222999))

(assert (=> d!56813 d!57443))

(declare-fun e!128443 () Bool)

(declare-fun b!195298 () Bool)

(declare-fun lt!97453 () List!2408)

(assert (=> b!195298 (= e!128443 (contains!1365 lt!97453 (tuple2!3501 (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309)))))))

(declare-fun bm!19715 () Bool)

(declare-fun call!19720 () List!2408)

(declare-fun call!19718 () List!2408)

(assert (=> bm!19715 (= call!19720 call!19718)))

(declare-fun b!195299 () Bool)

(declare-fun e!128442 () List!2408)

(assert (=> b!195299 (= e!128442 (insertStrictlySorted!136 (t!7326 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun b!195300 () Bool)

(declare-fun e!128446 () List!2408)

(declare-fun call!19719 () List!2408)

(assert (=> b!195300 (= e!128446 call!19719)))

(declare-fun b!195301 () Bool)

(declare-fun res!92238 () Bool)

(assert (=> b!195301 (=> (not res!92238) (not e!128443))))

(assert (=> b!195301 (= res!92238 (containsKey!249 lt!97453 (_1!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun bm!19716 () Bool)

(assert (=> bm!19716 (= call!19719 call!19720)))

(declare-fun c!35348 () Bool)

(declare-fun b!195302 () Bool)

(assert (=> b!195302 (= c!35348 (and ((_ is Cons!2404) (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (bvsgt (_1!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (_1!1761 (tuple2!3501 key!828 v!309)))))))

(declare-fun e!128445 () List!2408)

(assert (=> b!195302 (= e!128445 e!128446)))

(declare-fun b!195303 () Bool)

(assert (=> b!195303 (= e!128445 call!19720)))

(declare-fun b!195304 () Bool)

(declare-fun e!128444 () List!2408)

(assert (=> b!195304 (= e!128444 e!128445)))

(declare-fun c!35346 () Bool)

(assert (=> b!195304 (= c!35346 (and ((_ is Cons!2404) (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (= (_1!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (_1!1761 (tuple2!3501 key!828 v!309)))))))

(declare-fun b!195306 () Bool)

(assert (=> b!195306 (= e!128446 call!19719)))

(declare-fun bm!19717 () Bool)

(declare-fun c!35349 () Bool)

(assert (=> bm!19717 (= call!19718 ($colon$colon!102 e!128442 (ite c!35349 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (tuple2!3501 (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309))))))))

(declare-fun c!35347 () Bool)

(assert (=> bm!19717 (= c!35347 c!35349)))

(declare-fun b!195307 () Bool)

(assert (=> b!195307 (= e!128444 call!19718)))

(declare-fun b!195305 () Bool)

(assert (=> b!195305 (= e!128442 (ite c!35346 (t!7326 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (ite c!35348 (Cons!2404 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (t!7326 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) Nil!2405)))))

(declare-fun d!57445 () Bool)

(assert (=> d!57445 e!128443))

(declare-fun res!92239 () Bool)

(assert (=> d!57445 (=> (not res!92239) (not e!128443))))

(assert (=> d!57445 (= res!92239 (isStrictlySorted!344 lt!97453))))

(assert (=> d!57445 (= lt!97453 e!128444)))

(assert (=> d!57445 (= c!35349 (and ((_ is Cons!2404) (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (bvslt (_1!1761 (h!3045 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (_1!1761 (tuple2!3501 key!828 v!309)))))))

(assert (=> d!57445 (isStrictlySorted!344 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))))

(assert (=> d!57445 (= (insertStrictlySorted!136 (toList!1226 (getCurrentListMap!878 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (_1!1761 (tuple2!3501 key!828 v!309)) (_2!1761 (tuple2!3501 key!828 v!309))) lt!97453)))

(assert (= (and d!57445 c!35349) b!195307))

(assert (= (and d!57445 (not c!35349)) b!195304))

(assert (= (and b!195304 c!35346) b!195303))

(assert (= (and b!195304 (not c!35346)) b!195302))

(assert (= (and b!195302 c!35348) b!195306))

(assert (= (and b!195302 (not c!35348)) b!195300))

(assert (= (or b!195306 b!195300) bm!19716))

(assert (= (or b!195303 bm!19716) bm!19715))

(assert (= (or b!195307 bm!19715) bm!19717))

(assert (= (and bm!19717 c!35347) b!195299))

(assert (= (and bm!19717 (not c!35347)) b!195305))

(assert (= (and d!57445 res!92239) b!195301))

(assert (= (and b!195301 res!92238) b!195298))

(declare-fun m!223001 () Bool)

(assert (=> b!195301 m!223001))

(declare-fun m!223003 () Bool)

(assert (=> b!195299 m!223003))

(declare-fun m!223005 () Bool)

(assert (=> bm!19717 m!223005))

(declare-fun m!223007 () Bool)

(assert (=> b!195298 m!223007))

(declare-fun m!223009 () Bool)

(assert (=> d!57445 m!223009))

(declare-fun m!223011 () Bool)

(assert (=> d!57445 m!223011))

(assert (=> d!56813 d!57445))

(declare-fun b!195309 () Bool)

(declare-fun e!128447 () Option!252)

(declare-fun e!128448 () Option!252)

(assert (=> b!195309 (= e!128447 e!128448)))

(declare-fun c!35351 () Bool)

(assert (=> b!195309 (= c!35351 (and ((_ is Cons!2404) (toList!1226 lt!96956)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96956))) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!195311 () Bool)

(assert (=> b!195311 (= e!128448 None!250)))

(declare-fun d!57447 () Bool)

(declare-fun c!35350 () Bool)

(assert (=> d!57447 (= c!35350 (and ((_ is Cons!2404) (toList!1226 lt!96956)) (= (_1!1761 (h!3045 (toList!1226 lt!96956))) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57447 (= (getValueByKey!246 (toList!1226 lt!96956) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))) e!128447)))

(declare-fun b!195310 () Bool)

(assert (=> b!195310 (= e!128448 (getValueByKey!246 (t!7326 (toList!1226 lt!96956)) (_1!1761 (tuple2!3501 lt!96910 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195308 () Bool)

(assert (=> b!195308 (= e!128447 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96956)))))))

(assert (= (and d!57447 c!35350) b!195308))

(assert (= (and d!57447 (not c!35350)) b!195309))

(assert (= (and b!195309 c!35351) b!195310))

(assert (= (and b!195309 (not c!35351)) b!195311))

(declare-fun m!223013 () Bool)

(assert (=> b!195310 m!223013))

(assert (=> b!194298 d!57447))

(declare-fun d!57449 () Bool)

(assert (=> d!57449 (= (apply!188 lt!96950 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) (get!2244 (getValueByKey!246 (toList!1226 lt!96950) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7816 () Bool)

(assert (= bs!7816 d!57449))

(assert (=> bs!7816 m!221041))

(assert (=> bs!7816 m!222943))

(assert (=> bs!7816 m!222943))

(declare-fun m!223015 () Bool)

(assert (=> bs!7816 m!223015))

(assert (=> b!194284 d!57449))

(assert (=> b!194284 d!56827))

(declare-fun b!195313 () Bool)

(declare-fun e!128449 () Option!252)

(declare-fun e!128450 () Option!252)

(assert (=> b!195313 (= e!128449 e!128450)))

(declare-fun c!35353 () Bool)

(assert (=> b!195313 (= c!35353 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96885))) (not (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96885)))) (_1!1761 lt!96690)))))))

(declare-fun b!195315 () Bool)

(assert (=> b!195315 (= e!128450 None!250)))

(declare-fun d!57451 () Bool)

(declare-fun c!35352 () Bool)

(assert (=> d!57451 (= c!35352 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96885))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96885)))) (_1!1761 lt!96690))))))

(assert (=> d!57451 (= (getValueByKey!246 (t!7326 (toList!1226 lt!96885)) (_1!1761 lt!96690)) e!128449)))

(declare-fun b!195314 () Bool)

(assert (=> b!195314 (= e!128450 (getValueByKey!246 (t!7326 (t!7326 (toList!1226 lt!96885))) (_1!1761 lt!96690)))))

(declare-fun b!195312 () Bool)

(assert (=> b!195312 (= e!128449 (Some!251 (_2!1761 (h!3045 (t!7326 (toList!1226 lt!96885))))))))

(assert (= (and d!57451 c!35352) b!195312))

(assert (= (and d!57451 (not c!35352)) b!195313))

(assert (= (and b!195313 c!35353) b!195314))

(assert (= (and b!195313 (not c!35353)) b!195315))

(declare-fun m!223017 () Bool)

(assert (=> b!195314 m!223017))

(assert (=> b!194464 d!57451))

(declare-fun b!195317 () Bool)

(declare-fun e!128451 () Option!252)

(declare-fun e!128452 () Option!252)

(assert (=> b!195317 (= e!128451 e!128452)))

(declare-fun c!35355 () Bool)

(assert (=> b!195317 (= c!35355 (and ((_ is Cons!2404) (toList!1226 lt!97131)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97131))) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun b!195319 () Bool)

(assert (=> b!195319 (= e!128452 None!250)))

(declare-fun c!35354 () Bool)

(declare-fun d!57453 () Bool)

(assert (=> d!57453 (= c!35354 (and ((_ is Cons!2404) (toList!1226 lt!97131)) (= (_1!1761 (h!3045 (toList!1226 lt!97131))) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> d!57453 (= (getValueByKey!246 (toList!1226 lt!97131) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) e!128451)))

(declare-fun b!195318 () Bool)

(assert (=> b!195318 (= e!128452 (getValueByKey!246 (t!7326 (toList!1226 lt!97131)) (_1!1761 (ite (or c!35029 c!35028) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195316 () Bool)

(assert (=> b!195316 (= e!128451 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97131)))))))

(assert (= (and d!57453 c!35354) b!195316))

(assert (= (and d!57453 (not c!35354)) b!195317))

(assert (= (and b!195317 c!35355) b!195318))

(assert (= (and b!195317 (not c!35355)) b!195319))

(declare-fun m!223019 () Bool)

(assert (=> b!195318 m!223019))

(assert (=> b!194611 d!57453))

(declare-fun d!57455 () Bool)

(assert (=> d!57455 (= (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) lt!96872)) (v!4257 (getValueByKey!246 (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) lt!96872)))))

(assert (=> d!56855 d!57455))

(declare-fun b!195321 () Bool)

(declare-fun e!128453 () Option!252)

(declare-fun e!128454 () Option!252)

(assert (=> b!195321 (= e!128453 e!128454)))

(declare-fun c!35357 () Bool)

(assert (=> b!195321 (= c!35357 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))) (not (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))) lt!96872))))))

(declare-fun b!195323 () Bool)

(assert (=> b!195323 (= e!128454 None!250)))

(declare-fun c!35356 () Bool)

(declare-fun d!57457 () Bool)

(assert (=> d!57457 (= c!35356 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))))) lt!96872)))))

(assert (=> d!57457 (= (getValueByKey!246 (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248)))) lt!96872) e!128453)))

(declare-fun b!195322 () Bool)

(assert (=> b!195322 (= e!128454 (getValueByKey!246 (t!7326 (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))) lt!96872))))

(declare-fun b!195320 () Bool)

(assert (=> b!195320 (= e!128453 (Some!251 (_2!1761 (h!3045 (toList!1226 (+!319 lt!96875 (tuple2!3501 lt!96866 (zeroValue!3800 thiss!1248))))))))))

(assert (= (and d!57457 c!35356) b!195320))

(assert (= (and d!57457 (not c!35356)) b!195321))

(assert (= (and b!195321 c!35357) b!195322))

(assert (= (and b!195321 (not c!35357)) b!195323))

(declare-fun m!223021 () Bool)

(assert (=> b!195322 m!223021))

(assert (=> d!56855 d!57457))

(declare-fun d!57459 () Bool)

(declare-fun c!35358 () Bool)

(assert (=> d!57459 (= c!35358 ((_ is Nil!2405) (toList!1226 lt!96927)))))

(declare-fun e!128455 () (InoxSet tuple2!3500))

(assert (=> d!57459 (= (content!156 (toList!1226 lt!96927)) e!128455)))

(declare-fun b!195324 () Bool)

(assert (=> b!195324 (= e!128455 ((as const (Array tuple2!3500 Bool)) false))))

(declare-fun b!195325 () Bool)

(assert (=> b!195325 (= e!128455 ((_ map or) (store ((as const (Array tuple2!3500 Bool)) false) (h!3045 (toList!1226 lt!96927)) true) (content!156 (t!7326 (toList!1226 lt!96927)))))))

(assert (= (and d!57459 c!35358) b!195324))

(assert (= (and d!57459 (not c!35358)) b!195325))

(declare-fun m!223023 () Bool)

(assert (=> b!195325 m!223023))

(declare-fun m!223025 () Bool)

(assert (=> b!195325 m!223025))

(assert (=> d!56801 d!57459))

(assert (=> d!56783 d!56831))

(assert (=> b!194461 d!56985))

(assert (=> b!194461 d!56987))

(assert (=> b!194394 d!56993))

(declare-fun d!57461 () Bool)

(declare-fun lt!97454 () Bool)

(assert (=> d!57461 (= lt!97454 (select (content!156 (toList!1226 lt!97023)) (tuple2!3501 key!828 v!309)))))

(declare-fun e!128457 () Bool)

(assert (=> d!57461 (= lt!97454 e!128457)))

(declare-fun res!92240 () Bool)

(assert (=> d!57461 (=> (not res!92240) (not e!128457))))

(assert (=> d!57461 (= res!92240 ((_ is Cons!2404) (toList!1226 lt!97023)))))

(assert (=> d!57461 (= (contains!1365 (toList!1226 lt!97023) (tuple2!3501 key!828 v!309)) lt!97454)))

(declare-fun b!195326 () Bool)

(declare-fun e!128456 () Bool)

(assert (=> b!195326 (= e!128457 e!128456)))

(declare-fun res!92241 () Bool)

(assert (=> b!195326 (=> res!92241 e!128456)))

(assert (=> b!195326 (= res!92241 (= (h!3045 (toList!1226 lt!97023)) (tuple2!3501 key!828 v!309)))))

(declare-fun b!195327 () Bool)

(assert (=> b!195327 (= e!128456 (contains!1365 (t!7326 (toList!1226 lt!97023)) (tuple2!3501 key!828 v!309)))))

(assert (= (and d!57461 res!92240) b!195326))

(assert (= (and b!195326 (not res!92241)) b!195327))

(declare-fun m!223027 () Bool)

(assert (=> d!57461 m!223027))

(declare-fun m!223029 () Bool)

(assert (=> d!57461 m!223029))

(declare-fun m!223031 () Bool)

(assert (=> b!195327 m!223031))

(assert (=> b!194437 d!57461))

(assert (=> b!194292 d!56823))

(assert (=> b!194608 d!56823))

(declare-fun d!57463 () Bool)

(assert (=> d!57463 (= (get!2245 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!531 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4252 (select (arr!3867 (_values!3942 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194645 d!57463))

(declare-fun d!57465 () Bool)

(declare-fun lt!97455 () Bool)

(assert (=> d!57465 (= lt!97455 (select (content!156 (t!7326 (toList!1226 lt!96927))) lt!96690))))

(declare-fun e!128459 () Bool)

(assert (=> d!57465 (= lt!97455 e!128459)))

(declare-fun res!92242 () Bool)

(assert (=> d!57465 (=> (not res!92242) (not e!128459))))

(assert (=> d!57465 (= res!92242 ((_ is Cons!2404) (t!7326 (toList!1226 lt!96927))))))

(assert (=> d!57465 (= (contains!1365 (t!7326 (toList!1226 lt!96927)) lt!96690) lt!97455)))

(declare-fun b!195328 () Bool)

(declare-fun e!128458 () Bool)

(assert (=> b!195328 (= e!128459 e!128458)))

(declare-fun res!92243 () Bool)

(assert (=> b!195328 (=> res!92243 e!128458)))

(assert (=> b!195328 (= res!92243 (= (h!3045 (t!7326 (toList!1226 lt!96927))) lt!96690))))

(declare-fun b!195329 () Bool)

(assert (=> b!195329 (= e!128458 (contains!1365 (t!7326 (t!7326 (toList!1226 lt!96927))) lt!96690))))

(assert (= (and d!57465 res!92242) b!195328))

(assert (= (and b!195328 (not res!92243)) b!195329))

(assert (=> d!57465 m!223025))

(declare-fun m!223033 () Bool)

(assert (=> d!57465 m!223033))

(declare-fun m!223035 () Bool)

(assert (=> b!195329 m!223035))

(assert (=> b!194391 d!57465))

(declare-fun b!195330 () Bool)

(declare-fun e!128460 () SeekEntryResult!682)

(assert (=> b!195330 (= e!128460 Undefined!682)))

(declare-fun b!195331 () Bool)

(declare-fun e!128461 () SeekEntryResult!682)

(assert (=> b!195331 (= e!128461 (MissingVacant!682 (index!4900 lt!96805)))))

(declare-fun d!57467 () Bool)

(declare-fun lt!97456 () SeekEntryResult!682)

(assert (=> d!57467 (and (or ((_ is Undefined!682) lt!97456) (not ((_ is Found!682) lt!97456)) (and (bvsge (index!4899 lt!97456) #b00000000000000000000000000000000) (bvslt (index!4899 lt!97456) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!97456) ((_ is Found!682) lt!97456) (not ((_ is MissingVacant!682) lt!97456)) (not (= (index!4901 lt!97456) (index!4900 lt!96805))) (and (bvsge (index!4901 lt!97456) #b00000000000000000000000000000000) (bvslt (index!4901 lt!97456) (size!4190 (_keys!5953 thiss!1248))))) (or ((_ is Undefined!682) lt!97456) (ite ((_ is Found!682) lt!97456) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!97456)) key!828) (and ((_ is MissingVacant!682) lt!97456) (= (index!4901 lt!97456) (index!4900 lt!96805)) (= (select (arr!3866 (_keys!5953 thiss!1248)) (index!4901 lt!97456)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!57467 (= lt!97456 e!128460)))

(declare-fun c!35360 () Bool)

(assert (=> d!57467 (= c!35360 (bvsge (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!97457 () (_ BitVec 64))

(assert (=> d!57467 (= lt!97457 (select (arr!3866 (_keys!5953 thiss!1248)) (nextIndex!0 (index!4900 lt!96805) (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (mask!9222 thiss!1248))))))

(assert (=> d!57467 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!57467 (= (seekKeyOrZeroReturnVacant!0 (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (nextIndex!0 (index!4900 lt!96805) (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (mask!9222 thiss!1248)) (index!4900 lt!96805) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)) lt!97456)))

(declare-fun b!195332 () Bool)

(declare-fun c!35361 () Bool)

(assert (=> b!195332 (= c!35361 (= lt!97457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128462 () SeekEntryResult!682)

(assert (=> b!195332 (= e!128462 e!128461)))

(declare-fun b!195333 () Bool)

(assert (=> b!195333 (= e!128462 (Found!682 (nextIndex!0 (index!4900 lt!96805) (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (mask!9222 thiss!1248))))))

(declare-fun b!195334 () Bool)

(assert (=> b!195334 (= e!128460 e!128462)))

(declare-fun c!35359 () Bool)

(assert (=> b!195334 (= c!35359 (= lt!97457 key!828))))

(declare-fun b!195335 () Bool)

(assert (=> b!195335 (= e!128461 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (index!4900 lt!96805) (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (mask!9222 thiss!1248)) (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (mask!9222 thiss!1248)) (index!4900 lt!96805) key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(assert (= (and d!57467 c!35360) b!195330))

(assert (= (and d!57467 (not c!35360)) b!195334))

(assert (= (and b!195334 c!35359) b!195333))

(assert (= (and b!195334 (not c!35359)) b!195332))

(assert (= (and b!195332 c!35361) b!195331))

(assert (= (and b!195332 (not c!35361)) b!195335))

(declare-fun m!223037 () Bool)

(assert (=> d!57467 m!223037))

(declare-fun m!223039 () Bool)

(assert (=> d!57467 m!223039))

(assert (=> d!57467 m!221421))

(declare-fun m!223041 () Bool)

(assert (=> d!57467 m!223041))

(assert (=> d!57467 m!221011))

(assert (=> b!195335 m!221421))

(declare-fun m!223043 () Bool)

(assert (=> b!195335 m!223043))

(assert (=> b!195335 m!223043))

(declare-fun m!223045 () Bool)

(assert (=> b!195335 m!223045))

(assert (=> b!194433 d!57467))

(declare-fun d!57469 () Bool)

(declare-fun lt!97458 () (_ BitVec 32))

(assert (=> d!57469 (and (bvsge lt!97458 #b00000000000000000000000000000000) (bvslt lt!97458 (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001)))))

(assert (=> d!57469 (= lt!97458 (choose!52 (index!4900 lt!96805) (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (mask!9222 thiss!1248)))))

(assert (=> d!57469 (validMask!0 (mask!9222 thiss!1248))))

(assert (=> d!57469 (= (nextIndex!0 (index!4900 lt!96805) (bvadd (x!20678 lt!96805) #b00000000000000000000000000000001) (mask!9222 thiss!1248)) lt!97458)))

(declare-fun bs!7817 () Bool)

(assert (= bs!7817 d!57469))

(declare-fun m!223047 () Bool)

(assert (=> bs!7817 m!223047))

(assert (=> bs!7817 m!221011))

(assert (=> b!194433 d!57469))

(assert (=> d!56779 d!56755))

(declare-fun d!57471 () Bool)

(assert (=> d!57471 (= (apply!188 (+!319 lt!96920 (tuple2!3501 lt!96912 (minValue!3800 thiss!1248))) lt!96914) (apply!188 lt!96920 lt!96914))))

(assert (=> d!57471 true))

(declare-fun _$34!1095 () Unit!5858)

(assert (=> d!57471 (= (choose!1074 lt!96920 lt!96912 (minValue!3800 thiss!1248) lt!96914) _$34!1095)))

(declare-fun bs!7818 () Bool)

(assert (= bs!7818 d!57471))

(assert (=> bs!7818 m!221157))

(assert (=> bs!7818 m!221157))

(assert (=> bs!7818 m!221159))

(assert (=> bs!7818 m!221177))

(assert (=> d!56779 d!57471))

(assert (=> d!56779 d!56759))

(declare-fun d!57473 () Bool)

(declare-fun e!128464 () Bool)

(assert (=> d!57473 e!128464))

(declare-fun res!92244 () Bool)

(assert (=> d!57473 (=> res!92244 e!128464)))

(declare-fun lt!97460 () Bool)

(assert (=> d!57473 (= res!92244 (not lt!97460))))

(declare-fun lt!97462 () Bool)

(assert (=> d!57473 (= lt!97460 lt!97462)))

(declare-fun lt!97459 () Unit!5858)

(declare-fun e!128463 () Unit!5858)

(assert (=> d!57473 (= lt!97459 e!128463)))

(declare-fun c!35362 () Bool)

(assert (=> d!57473 (= c!35362 lt!97462)))

(assert (=> d!57473 (= lt!97462 (containsKey!249 (toList!1226 lt!96920) lt!96914))))

(assert (=> d!57473 (= (contains!1363 lt!96920 lt!96914) lt!97460)))

(declare-fun b!195336 () Bool)

(declare-fun lt!97461 () Unit!5858)

(assert (=> b!195336 (= e!128463 lt!97461)))

(assert (=> b!195336 (= lt!97461 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96920) lt!96914))))

(assert (=> b!195336 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96920) lt!96914))))

(declare-fun b!195337 () Bool)

(declare-fun Unit!5910 () Unit!5858)

(assert (=> b!195337 (= e!128463 Unit!5910)))

(declare-fun b!195338 () Bool)

(assert (=> b!195338 (= e!128464 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96920) lt!96914)))))

(assert (= (and d!57473 c!35362) b!195336))

(assert (= (and d!57473 (not c!35362)) b!195337))

(assert (= (and d!57473 (not res!92244)) b!195338))

(declare-fun m!223049 () Bool)

(assert (=> d!57473 m!223049))

(declare-fun m!223051 () Bool)

(assert (=> b!195336 m!223051))

(assert (=> b!195336 m!221267))

(assert (=> b!195336 m!221267))

(declare-fun m!223053 () Bool)

(assert (=> b!195336 m!223053))

(assert (=> b!195338 m!221267))

(assert (=> b!195338 m!221267))

(assert (=> b!195338 m!223053))

(assert (=> d!56779 d!57473))

(assert (=> d!56779 d!56753))

(assert (=> d!56945 d!56845))

(assert (=> d!56945 d!56847))

(declare-fun d!57475 () Bool)

(assert (=> d!57475 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96696) key!828))))

(assert (=> d!57475 true))

(declare-fun _$12!451 () Unit!5858)

(assert (=> d!57475 (= (choose!1077 (toList!1226 lt!96696) key!828) _$12!451)))

(declare-fun bs!7819 () Bool)

(assert (= bs!7819 d!57475))

(assert (=> bs!7819 m!221003))

(assert (=> bs!7819 m!221003))

(assert (=> bs!7819 m!221005))

(assert (=> d!56945 d!57475))

(declare-fun d!57477 () Bool)

(declare-fun res!92245 () Bool)

(declare-fun e!128465 () Bool)

(assert (=> d!57477 (=> res!92245 e!128465)))

(assert (=> d!57477 (= res!92245 (or ((_ is Nil!2405) (toList!1226 lt!96696)) ((_ is Nil!2405) (t!7326 (toList!1226 lt!96696)))))))

(assert (=> d!57477 (= (isStrictlySorted!344 (toList!1226 lt!96696)) e!128465)))

(declare-fun b!195339 () Bool)

(declare-fun e!128466 () Bool)

(assert (=> b!195339 (= e!128465 e!128466)))

(declare-fun res!92246 () Bool)

(assert (=> b!195339 (=> (not res!92246) (not e!128466))))

(assert (=> b!195339 (= res!92246 (bvslt (_1!1761 (h!3045 (toList!1226 lt!96696))) (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96696))))))))

(declare-fun b!195340 () Bool)

(assert (=> b!195340 (= e!128466 (isStrictlySorted!344 (t!7326 (toList!1226 lt!96696))))))

(assert (= (and d!57477 (not res!92245)) b!195339))

(assert (= (and b!195339 res!92246) b!195340))

(declare-fun m!223055 () Bool)

(assert (=> b!195340 m!223055))

(assert (=> d!56945 d!57477))

(declare-fun b!195341 () Bool)

(declare-fun e!128468 () Bool)

(declare-fun lt!97463 () List!2408)

(assert (=> b!195341 (= e!128468 (contains!1365 lt!97463 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun bm!19718 () Bool)

(declare-fun call!19723 () List!2408)

(declare-fun call!19721 () List!2408)

(assert (=> bm!19718 (= call!19723 call!19721)))

(declare-fun b!195342 () Bool)

(declare-fun e!128467 () List!2408)

(assert (=> b!195342 (= e!128467 (insertStrictlySorted!136 (t!7326 (t!7326 (toList!1226 lt!96700))) (_1!1761 lt!96690) (_2!1761 lt!96690)))))

(declare-fun b!195343 () Bool)

(declare-fun e!128471 () List!2408)

(declare-fun call!19722 () List!2408)

(assert (=> b!195343 (= e!128471 call!19722)))

(declare-fun b!195344 () Bool)

(declare-fun res!92247 () Bool)

(assert (=> b!195344 (=> (not res!92247) (not e!128468))))

(assert (=> b!195344 (= res!92247 (containsKey!249 lt!97463 (_1!1761 lt!96690)))))

(declare-fun bm!19719 () Bool)

(assert (=> bm!19719 (= call!19722 call!19723)))

(declare-fun b!195345 () Bool)

(declare-fun c!35365 () Bool)

(assert (=> b!195345 (= c!35365 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96700))) (bvsgt (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700)))) (_1!1761 lt!96690))))))

(declare-fun e!128470 () List!2408)

(assert (=> b!195345 (= e!128470 e!128471)))

(declare-fun b!195346 () Bool)

(assert (=> b!195346 (= e!128470 call!19723)))

(declare-fun b!195347 () Bool)

(declare-fun e!128469 () List!2408)

(assert (=> b!195347 (= e!128469 e!128470)))

(declare-fun c!35363 () Bool)

(assert (=> b!195347 (= c!35363 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96700))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700)))) (_1!1761 lt!96690))))))

(declare-fun b!195349 () Bool)

(assert (=> b!195349 (= e!128471 call!19722)))

(declare-fun c!35366 () Bool)

(declare-fun bm!19720 () Bool)

(assert (=> bm!19720 (= call!19721 ($colon$colon!102 e!128467 (ite c!35366 (h!3045 (t!7326 (toList!1226 lt!96700))) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690)))))))

(declare-fun c!35364 () Bool)

(assert (=> bm!19720 (= c!35364 c!35366)))

(declare-fun b!195350 () Bool)

(assert (=> b!195350 (= e!128469 call!19721)))

(declare-fun b!195348 () Bool)

(assert (=> b!195348 (= e!128467 (ite c!35363 (t!7326 (t!7326 (toList!1226 lt!96700))) (ite c!35365 (Cons!2404 (h!3045 (t!7326 (toList!1226 lt!96700))) (t!7326 (t!7326 (toList!1226 lt!96700)))) Nil!2405)))))

(declare-fun d!57479 () Bool)

(assert (=> d!57479 e!128468))

(declare-fun res!92248 () Bool)

(assert (=> d!57479 (=> (not res!92248) (not e!128468))))

(assert (=> d!57479 (= res!92248 (isStrictlySorted!344 lt!97463))))

(assert (=> d!57479 (= lt!97463 e!128469)))

(assert (=> d!57479 (= c!35366 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96700))) (bvslt (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96700)))) (_1!1761 lt!96690))))))

(assert (=> d!57479 (isStrictlySorted!344 (t!7326 (toList!1226 lt!96700)))))

(assert (=> d!57479 (= (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96700)) (_1!1761 lt!96690) (_2!1761 lt!96690)) lt!97463)))

(assert (= (and d!57479 c!35366) b!195350))

(assert (= (and d!57479 (not c!35366)) b!195347))

(assert (= (and b!195347 c!35363) b!195346))

(assert (= (and b!195347 (not c!35363)) b!195345))

(assert (= (and b!195345 c!35365) b!195349))

(assert (= (and b!195345 (not c!35365)) b!195343))

(assert (= (or b!195349 b!195343) bm!19719))

(assert (= (or b!195346 bm!19719) bm!19718))

(assert (= (or b!195350 bm!19718) bm!19720))

(assert (= (and bm!19720 c!35364) b!195342))

(assert (= (and bm!19720 (not c!35364)) b!195348))

(assert (= (and d!57479 res!92248) b!195344))

(assert (= (and b!195344 res!92247) b!195341))

(declare-fun m!223057 () Bool)

(assert (=> b!195344 m!223057))

(declare-fun m!223059 () Bool)

(assert (=> b!195342 m!223059))

(declare-fun m!223061 () Bool)

(assert (=> bm!19720 m!223061))

(declare-fun m!223063 () Bool)

(assert (=> b!195341 m!223063))

(declare-fun m!223065 () Bool)

(assert (=> d!57479 m!223065))

(assert (=> d!57479 m!222053))

(assert (=> b!194371 d!57479))

(declare-fun d!57481 () Bool)

(declare-fun res!92249 () Bool)

(declare-fun e!128472 () Bool)

(assert (=> d!57481 (=> res!92249 e!128472)))

(assert (=> d!57481 (= res!92249 (or ((_ is Nil!2405) lt!97166) ((_ is Nil!2405) (t!7326 lt!97166))))))

(assert (=> d!57481 (= (isStrictlySorted!344 lt!97166) e!128472)))

(declare-fun b!195351 () Bool)

(declare-fun e!128473 () Bool)

(assert (=> b!195351 (= e!128472 e!128473)))

(declare-fun res!92250 () Bool)

(assert (=> b!195351 (=> (not res!92250) (not e!128473))))

(assert (=> b!195351 (= res!92250 (bvslt (_1!1761 (h!3045 lt!97166)) (_1!1761 (h!3045 (t!7326 lt!97166)))))))

(declare-fun b!195352 () Bool)

(assert (=> b!195352 (= e!128473 (isStrictlySorted!344 (t!7326 lt!97166)))))

(assert (= (and d!57481 (not res!92249)) b!195351))

(assert (= (and b!195351 res!92250) b!195352))

(declare-fun m!223067 () Bool)

(assert (=> b!195352 m!223067))

(assert (=> d!56943 d!57481))

(declare-fun d!57483 () Bool)

(declare-fun res!92251 () Bool)

(declare-fun e!128474 () Bool)

(assert (=> d!57483 (=> res!92251 e!128474)))

(assert (=> d!57483 (= res!92251 (or ((_ is Nil!2405) (toList!1226 (map!2018 thiss!1248))) ((_ is Nil!2405) (t!7326 (toList!1226 (map!2018 thiss!1248))))))))

(assert (=> d!57483 (= (isStrictlySorted!344 (toList!1226 (map!2018 thiss!1248))) e!128474)))

(declare-fun b!195353 () Bool)

(declare-fun e!128475 () Bool)

(assert (=> b!195353 (= e!128474 e!128475)))

(declare-fun res!92252 () Bool)

(assert (=> b!195353 (=> (not res!92252) (not e!128475))))

(assert (=> b!195353 (= res!92252 (bvslt (_1!1761 (h!3045 (toList!1226 (map!2018 thiss!1248)))) (_1!1761 (h!3045 (t!7326 (toList!1226 (map!2018 thiss!1248)))))))))

(declare-fun b!195354 () Bool)

(assert (=> b!195354 (= e!128475 (isStrictlySorted!344 (t!7326 (toList!1226 (map!2018 thiss!1248)))))))

(assert (= (and d!57483 (not res!92251)) b!195353))

(assert (= (and b!195353 res!92252) b!195354))

(assert (=> b!195354 m!222937))

(assert (=> d!56943 d!57483))

(declare-fun d!57485 () Bool)

(assert (=> d!57485 (= (inRange!0 (ite c!35145 (index!4898 lt!97149) (index!4901 lt!97149)) (mask!9222 thiss!1248)) (and (bvsge (ite c!35145 (index!4898 lt!97149) (index!4901 lt!97149)) #b00000000000000000000000000000000) (bvslt (ite c!35145 (index!4898 lt!97149) (index!4901 lt!97149)) (bvadd (mask!9222 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19672 d!57485))

(declare-fun d!57487 () Bool)

(assert (=> d!57487 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!4257 (getValueByKey!246 (toList!1226 lt!96908) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56795 d!57487))

(assert (=> d!56795 d!57067))

(declare-fun d!57489 () Bool)

(assert (=> d!57489 (= (apply!188 lt!97118 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2244 (getValueByKey!246 (toList!1226 lt!97118) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7820 () Bool)

(assert (= bs!7820 d!57489))

(declare-fun m!223069 () Bool)

(assert (=> bs!7820 m!223069))

(assert (=> bs!7820 m!223069))

(declare-fun m!223071 () Bool)

(assert (=> bs!7820 m!223071))

(assert (=> b!194599 d!57489))

(declare-fun d!57491 () Bool)

(assert (=> d!57491 (= (apply!188 lt!97036 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2244 (getValueByKey!246 (toList!1226 lt!97036) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7821 () Bool)

(assert (= bs!7821 d!57491))

(declare-fun m!223073 () Bool)

(assert (=> bs!7821 m!223073))

(assert (=> bs!7821 m!223073))

(declare-fun m!223075 () Bool)

(assert (=> bs!7821 m!223075))

(assert (=> b!194452 d!57491))

(declare-fun d!57493 () Bool)

(declare-fun e!128477 () Bool)

(assert (=> d!57493 e!128477))

(declare-fun res!92253 () Bool)

(assert (=> d!57493 (=> res!92253 e!128477)))

(declare-fun lt!97465 () Bool)

(assert (=> d!57493 (= res!92253 (not lt!97465))))

(declare-fun lt!97467 () Bool)

(assert (=> d!57493 (= lt!97465 lt!97467)))

(declare-fun lt!97464 () Unit!5858)

(declare-fun e!128476 () Unit!5858)

(assert (=> d!57493 (= lt!97464 e!128476)))

(declare-fun c!35367 () Bool)

(assert (=> d!57493 (= c!35367 lt!97467)))

(assert (=> d!57493 (= lt!97467 (containsKey!249 (toList!1226 lt!97002) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!57493 (= (contains!1363 lt!97002 (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)) lt!97465)))

(declare-fun b!195355 () Bool)

(declare-fun lt!97466 () Unit!5858)

(assert (=> b!195355 (= e!128476 lt!97466)))

(assert (=> b!195355 (= lt!97466 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97002) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!195355 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97002) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!195356 () Bool)

(declare-fun Unit!5911 () Unit!5858)

(assert (=> b!195356 (= e!128476 Unit!5911)))

(declare-fun b!195357 () Bool)

(assert (=> b!195357 (= e!128477 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97002) (select (arr!3866 (_keys!5953 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!57493 c!35367) b!195355))

(assert (= (and d!57493 (not c!35367)) b!195356))

(assert (= (and d!57493 (not res!92253)) b!195357))

(assert (=> d!57493 m!221041))

(declare-fun m!223077 () Bool)

(assert (=> d!57493 m!223077))

(assert (=> b!195355 m!221041))

(declare-fun m!223079 () Bool)

(assert (=> b!195355 m!223079))

(assert (=> b!195355 m!221041))

(assert (=> b!195355 m!222107))

(assert (=> b!195355 m!222107))

(declare-fun m!223081 () Bool)

(assert (=> b!195355 m!223081))

(assert (=> b!195357 m!221041))

(assert (=> b!195357 m!222107))

(assert (=> b!195357 m!222107))

(assert (=> b!195357 m!223081))

(assert (=> b!194401 d!57493))

(assert (=> b!194651 d!56885))

(declare-fun d!57495 () Bool)

(declare-fun e!128479 () Bool)

(assert (=> d!57495 e!128479))

(declare-fun res!92254 () Bool)

(assert (=> d!57495 (=> res!92254 e!128479)))

(declare-fun lt!97469 () Bool)

(assert (=> d!57495 (= res!92254 (not lt!97469))))

(declare-fun lt!97471 () Bool)

(assert (=> d!57495 (= lt!97469 lt!97471)))

(declare-fun lt!97468 () Unit!5858)

(declare-fun e!128478 () Unit!5858)

(assert (=> d!57495 (= lt!97468 e!128478)))

(declare-fun c!35368 () Bool)

(assert (=> d!57495 (= c!35368 lt!97471)))

(assert (=> d!57495 (= lt!97471 (containsKey!249 (toList!1226 lt!97150) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57495 (= (contains!1363 lt!97150 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97469)))

(declare-fun b!195358 () Bool)

(declare-fun lt!97470 () Unit!5858)

(assert (=> b!195358 (= e!128478 lt!97470)))

(assert (=> b!195358 (= lt!97470 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97150) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> b!195358 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97150) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195359 () Bool)

(declare-fun Unit!5912 () Unit!5858)

(assert (=> b!195359 (= e!128478 Unit!5912)))

(declare-fun b!195360 () Bool)

(assert (=> b!195360 (= e!128479 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97150) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57495 c!35368) b!195358))

(assert (= (and d!57495 (not c!35368)) b!195359))

(assert (= (and d!57495 (not res!92254)) b!195360))

(declare-fun m!223083 () Bool)

(assert (=> d!57495 m!223083))

(declare-fun m!223085 () Bool)

(assert (=> b!195358 m!223085))

(assert (=> b!195358 m!221803))

(assert (=> b!195358 m!221803))

(declare-fun m!223087 () Bool)

(assert (=> b!195358 m!223087))

(assert (=> b!195360 m!221803))

(assert (=> b!195360 m!221803))

(assert (=> b!195360 m!223087))

(assert (=> d!56923 d!57495))

(declare-fun b!195362 () Bool)

(declare-fun e!128480 () Option!252)

(declare-fun e!128481 () Option!252)

(assert (=> b!195362 (= e!128480 e!128481)))

(declare-fun c!35370 () Bool)

(assert (=> b!195362 (= c!35370 (and ((_ is Cons!2404) lt!97152) (not (= (_1!1761 (h!3045 lt!97152)) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195364 () Bool)

(assert (=> b!195364 (= e!128481 None!250)))

(declare-fun d!57497 () Bool)

(declare-fun c!35369 () Bool)

(assert (=> d!57497 (= c!35369 (and ((_ is Cons!2404) lt!97152) (= (_1!1761 (h!3045 lt!97152)) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57497 (= (getValueByKey!246 lt!97152 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) e!128480)))

(declare-fun b!195363 () Bool)

(assert (=> b!195363 (= e!128481 (getValueByKey!246 (t!7326 lt!97152) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195361 () Bool)

(assert (=> b!195361 (= e!128480 (Some!251 (_2!1761 (h!3045 lt!97152))))))

(assert (= (and d!57497 c!35369) b!195361))

(assert (= (and d!57497 (not c!35369)) b!195362))

(assert (= (and b!195362 c!35370) b!195363))

(assert (= (and b!195362 (not c!35370)) b!195364))

(declare-fun m!223089 () Bool)

(assert (=> b!195363 m!223089))

(assert (=> d!56923 d!57497))

(declare-fun d!57499 () Bool)

(assert (=> d!57499 (= (getValueByKey!246 lt!97152 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97472 () Unit!5858)

(assert (=> d!57499 (= lt!97472 (choose!1076 lt!97152 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun e!128482 () Bool)

(assert (=> d!57499 e!128482))

(declare-fun res!92255 () Bool)

(assert (=> d!57499 (=> (not res!92255) (not e!128482))))

(assert (=> d!57499 (= res!92255 (isStrictlySorted!344 lt!97152))))

(assert (=> d!57499 (= (lemmaContainsTupThenGetReturnValue!133 lt!97152 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97472)))

(declare-fun b!195365 () Bool)

(declare-fun res!92256 () Bool)

(assert (=> b!195365 (=> (not res!92256) (not e!128482))))

(assert (=> b!195365 (= res!92256 (containsKey!249 lt!97152 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195366 () Bool)

(assert (=> b!195366 (= e!128482 (contains!1365 lt!97152 (tuple2!3501 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57499 res!92255) b!195365))

(assert (= (and b!195365 res!92256) b!195366))

(assert (=> d!57499 m!221797))

(declare-fun m!223091 () Bool)

(assert (=> d!57499 m!223091))

(declare-fun m!223093 () Bool)

(assert (=> d!57499 m!223093))

(declare-fun m!223095 () Bool)

(assert (=> b!195365 m!223095))

(declare-fun m!223097 () Bool)

(assert (=> b!195366 m!223097))

(assert (=> d!56923 d!57499))

(declare-fun b!195367 () Bool)

(declare-fun e!128484 () Bool)

(declare-fun lt!97473 () List!2408)

(assert (=> b!195367 (= e!128484 (contains!1365 lt!97473 (tuple2!3501 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun bm!19721 () Bool)

(declare-fun call!19726 () List!2408)

(declare-fun call!19724 () List!2408)

(assert (=> bm!19721 (= call!19726 call!19724)))

(declare-fun b!195368 () Bool)

(declare-fun e!128483 () List!2408)

(assert (=> b!195368 (= e!128483 (insertStrictlySorted!136 (t!7326 (toList!1226 call!19620)) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195369 () Bool)

(declare-fun e!128487 () List!2408)

(declare-fun call!19725 () List!2408)

(assert (=> b!195369 (= e!128487 call!19725)))

(declare-fun b!195370 () Bool)

(declare-fun res!92257 () Bool)

(assert (=> b!195370 (=> (not res!92257) (not e!128484))))

(assert (=> b!195370 (= res!92257 (containsKey!249 lt!97473 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19722 () Bool)

(assert (=> bm!19722 (= call!19725 call!19726)))

(declare-fun b!195371 () Bool)

(declare-fun c!35373 () Bool)

(assert (=> b!195371 (= c!35373 (and ((_ is Cons!2404) (toList!1226 call!19620)) (bvsgt (_1!1761 (h!3045 (toList!1226 call!19620))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128486 () List!2408)

(assert (=> b!195371 (= e!128486 e!128487)))

(declare-fun b!195372 () Bool)

(assert (=> b!195372 (= e!128486 call!19726)))

(declare-fun b!195373 () Bool)

(declare-fun e!128485 () List!2408)

(assert (=> b!195373 (= e!128485 e!128486)))

(declare-fun c!35371 () Bool)

(assert (=> b!195373 (= c!35371 (and ((_ is Cons!2404) (toList!1226 call!19620)) (= (_1!1761 (h!3045 (toList!1226 call!19620))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195375 () Bool)

(assert (=> b!195375 (= e!128487 call!19725)))

(declare-fun c!35374 () Bool)

(declare-fun bm!19723 () Bool)

(assert (=> bm!19723 (= call!19724 ($colon$colon!102 e!128483 (ite c!35374 (h!3045 (toList!1226 call!19620)) (tuple2!3501 (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35372 () Bool)

(assert (=> bm!19723 (= c!35372 c!35374)))

(declare-fun b!195376 () Bool)

(assert (=> b!195376 (= e!128485 call!19724)))

(declare-fun b!195374 () Bool)

(assert (=> b!195374 (= e!128483 (ite c!35371 (t!7326 (toList!1226 call!19620)) (ite c!35373 (Cons!2404 (h!3045 (toList!1226 call!19620)) (t!7326 (toList!1226 call!19620))) Nil!2405)))))

(declare-fun d!57501 () Bool)

(assert (=> d!57501 e!128484))

(declare-fun res!92258 () Bool)

(assert (=> d!57501 (=> (not res!92258) (not e!128484))))

(assert (=> d!57501 (= res!92258 (isStrictlySorted!344 lt!97473))))

(assert (=> d!57501 (= lt!97473 e!128485)))

(assert (=> d!57501 (= c!35374 (and ((_ is Cons!2404) (toList!1226 call!19620)) (bvslt (_1!1761 (h!3045 (toList!1226 call!19620))) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57501 (isStrictlySorted!344 (toList!1226 call!19620))))

(assert (=> d!57501 (= (insertStrictlySorted!136 (toList!1226 call!19620) (_1!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97473)))

(assert (= (and d!57501 c!35374) b!195376))

(assert (= (and d!57501 (not c!35374)) b!195373))

(assert (= (and b!195373 c!35371) b!195372))

(assert (= (and b!195373 (not c!35371)) b!195371))

(assert (= (and b!195371 c!35373) b!195375))

(assert (= (and b!195371 (not c!35373)) b!195369))

(assert (= (or b!195375 b!195369) bm!19722))

(assert (= (or b!195372 bm!19722) bm!19721))

(assert (= (or b!195376 bm!19721) bm!19723))

(assert (= (and bm!19723 c!35372) b!195368))

(assert (= (and bm!19723 (not c!35372)) b!195374))

(assert (= (and d!57501 res!92258) b!195370))

(assert (= (and b!195370 res!92257) b!195367))

(declare-fun m!223099 () Bool)

(assert (=> b!195370 m!223099))

(declare-fun m!223101 () Bool)

(assert (=> b!195368 m!223101))

(declare-fun m!223103 () Bool)

(assert (=> bm!19723 m!223103))

(declare-fun m!223105 () Bool)

(assert (=> b!195367 m!223105))

(declare-fun m!223107 () Bool)

(assert (=> d!57501 m!223107))

(declare-fun m!223109 () Bool)

(assert (=> d!57501 m!223109))

(assert (=> d!56923 d!57501))

(declare-fun d!57503 () Bool)

(declare-fun e!128489 () Bool)

(assert (=> d!57503 e!128489))

(declare-fun res!92259 () Bool)

(assert (=> d!57503 (=> res!92259 e!128489)))

(declare-fun lt!97475 () Bool)

(assert (=> d!57503 (= res!92259 (not lt!97475))))

(declare-fun lt!97477 () Bool)

(assert (=> d!57503 (= lt!97475 lt!97477)))

(declare-fun lt!97474 () Unit!5858)

(declare-fun e!128488 () Unit!5858)

(assert (=> d!57503 (= lt!97474 e!128488)))

(declare-fun c!35375 () Bool)

(assert (=> d!57503 (= c!35375 lt!97477)))

(assert (=> d!57503 (= lt!97477 (containsKey!249 (toList!1226 lt!97118) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57503 (= (contains!1363 lt!97118 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97475)))

(declare-fun b!195377 () Bool)

(declare-fun lt!97476 () Unit!5858)

(assert (=> b!195377 (= e!128488 lt!97476)))

(assert (=> b!195377 (= lt!97476 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97118) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195377 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97118) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195378 () Bool)

(declare-fun Unit!5913 () Unit!5858)

(assert (=> b!195378 (= e!128488 Unit!5913)))

(declare-fun b!195379 () Bool)

(assert (=> b!195379 (= e!128489 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97118) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57503 c!35375) b!195377))

(assert (= (and d!57503 (not c!35375)) b!195378))

(assert (= (and d!57503 (not res!92259)) b!195379))

(declare-fun m!223111 () Bool)

(assert (=> d!57503 m!223111))

(declare-fun m!223113 () Bool)

(assert (=> b!195377 m!223113))

(assert (=> b!195377 m!223069))

(assert (=> b!195377 m!223069))

(declare-fun m!223115 () Bool)

(assert (=> b!195377 m!223115))

(assert (=> b!195379 m!223069))

(assert (=> b!195379 m!223069))

(assert (=> b!195379 m!223115))

(assert (=> bm!19660 d!57503))

(declare-fun d!57505 () Bool)

(assert (=> d!57505 (= (get!2244 (getValueByKey!246 (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) lt!96870)) (v!4257 (getValueByKey!246 (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) lt!96870)))))

(assert (=> d!56869 d!57505))

(declare-fun b!195381 () Bool)

(declare-fun e!128490 () Option!252)

(declare-fun e!128491 () Option!252)

(assert (=> b!195381 (= e!128490 e!128491)))

(declare-fun c!35377 () Bool)

(assert (=> b!195381 (= c!35377 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))) (not (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))) lt!96870))))))

(declare-fun b!195383 () Bool)

(assert (=> b!195383 (= e!128491 None!250)))

(declare-fun c!35376 () Bool)

(declare-fun d!57507 () Bool)

(assert (=> d!57507 (= c!35376 (and ((_ is Cons!2404) (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))) (= (_1!1761 (h!3045 (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))))) lt!96870)))))

(assert (=> d!57507 (= (getValueByKey!246 (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248)))) lt!96870) e!128490)))

(declare-fun b!195382 () Bool)

(assert (=> b!195382 (= e!128491 (getValueByKey!246 (t!7326 (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))) lt!96870))))

(declare-fun b!195380 () Bool)

(assert (=> b!195380 (= e!128490 (Some!251 (_2!1761 (h!3045 (toList!1226 (+!319 lt!96876 (tuple2!3501 lt!96868 (minValue!3800 thiss!1248))))))))))

(assert (= (and d!57507 c!35376) b!195380))

(assert (= (and d!57507 (not c!35376)) b!195381))

(assert (= (and b!195381 c!35377) b!195382))

(assert (= (and b!195381 (not c!35377)) b!195383))

(declare-fun m!223117 () Bool)

(assert (=> b!195382 m!223117))

(assert (=> d!56869 d!57507))

(declare-fun d!57509 () Bool)

(assert (=> d!57509 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96919) lt!96916)) (v!4257 (getValueByKey!246 (toList!1226 lt!96919) lt!96916)))))

(assert (=> d!56767 d!57509))

(declare-fun b!195385 () Bool)

(declare-fun e!128492 () Option!252)

(declare-fun e!128493 () Option!252)

(assert (=> b!195385 (= e!128492 e!128493)))

(declare-fun c!35379 () Bool)

(assert (=> b!195385 (= c!35379 (and ((_ is Cons!2404) (toList!1226 lt!96919)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96919))) lt!96916))))))

(declare-fun b!195387 () Bool)

(assert (=> b!195387 (= e!128493 None!250)))

(declare-fun d!57511 () Bool)

(declare-fun c!35378 () Bool)

(assert (=> d!57511 (= c!35378 (and ((_ is Cons!2404) (toList!1226 lt!96919)) (= (_1!1761 (h!3045 (toList!1226 lt!96919))) lt!96916)))))

(assert (=> d!57511 (= (getValueByKey!246 (toList!1226 lt!96919) lt!96916) e!128492)))

(declare-fun b!195386 () Bool)

(assert (=> b!195386 (= e!128493 (getValueByKey!246 (t!7326 (toList!1226 lt!96919)) lt!96916))))

(declare-fun b!195384 () Bool)

(assert (=> b!195384 (= e!128492 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96919)))))))

(assert (= (and d!57511 c!35378) b!195384))

(assert (= (and d!57511 (not c!35378)) b!195385))

(assert (= (and b!195385 c!35379) b!195386))

(assert (= (and b!195385 (not c!35379)) b!195387))

(declare-fun m!223119 () Bool)

(assert (=> b!195386 m!223119))

(assert (=> d!56767 d!57511))

(declare-fun d!57513 () Bool)

(declare-fun lt!97478 () (_ BitVec 32))

(assert (=> d!57513 (and (bvsge lt!97478 #b00000000000000000000000000000000) (bvsle lt!97478 (bvsub (size!4190 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!128495 () (_ BitVec 32))

(assert (=> d!57513 (= lt!97478 e!128495)))

(declare-fun c!35381 () Bool)

(assert (=> d!57513 (= c!35381 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!57513 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!4190 (_keys!5953 thiss!1248)) (size!4190 (_keys!5953 thiss!1248))))))

(assert (=> d!57513 (= (arrayCountValidKeys!0 (_keys!5953 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))) lt!97478)))

(declare-fun b!195388 () Bool)

(declare-fun e!128494 () (_ BitVec 32))

(assert (=> b!195388 (= e!128495 e!128494)))

(declare-fun c!35380 () Bool)

(assert (=> b!195388 (= c!35380 (validKeyInArray!0 (select (arr!3866 (_keys!5953 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195389 () Bool)

(declare-fun call!19727 () (_ BitVec 32))

(assert (=> b!195389 (= e!128494 (bvadd #b00000000000000000000000000000001 call!19727))))

(declare-fun b!195390 () Bool)

(assert (=> b!195390 (= e!128495 #b00000000000000000000000000000000)))

(declare-fun b!195391 () Bool)

(assert (=> b!195391 (= e!128494 call!19727)))

(declare-fun bm!19724 () Bool)

(assert (=> bm!19724 (= call!19727 (arrayCountValidKeys!0 (_keys!5953 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4190 (_keys!5953 thiss!1248))))))

(assert (= (and d!57513 c!35381) b!195390))

(assert (= (and d!57513 (not c!35381)) b!195388))

(assert (= (and b!195388 c!35380) b!195389))

(assert (= (and b!195388 (not c!35380)) b!195391))

(assert (= (or b!195389 b!195391) bm!19724))

(assert (=> b!195388 m!221933))

(assert (=> b!195388 m!221933))

(assert (=> b!195388 m!221937))

(declare-fun m!223121 () Bool)

(assert (=> bm!19724 m!223121))

(assert (=> bm!19658 d!57513))

(declare-fun d!57515 () Bool)

(declare-fun e!128497 () Bool)

(assert (=> d!57515 e!128497))

(declare-fun res!92260 () Bool)

(assert (=> d!57515 (=> res!92260 e!128497)))

(declare-fun lt!97480 () Bool)

(assert (=> d!57515 (= res!92260 (not lt!97480))))

(declare-fun lt!97482 () Bool)

(assert (=> d!57515 (= lt!97480 lt!97482)))

(declare-fun lt!97479 () Unit!5858)

(declare-fun e!128496 () Unit!5858)

(assert (=> d!57515 (= lt!97479 e!128496)))

(declare-fun c!35382 () Bool)

(assert (=> d!57515 (= c!35382 lt!97482)))

(assert (=> d!57515 (= lt!97482 (containsKey!249 (toList!1226 lt!97135) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57515 (= (contains!1363 lt!97135 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97480)))

(declare-fun b!195392 () Bool)

(declare-fun lt!97481 () Unit!5858)

(assert (=> b!195392 (= e!128496 lt!97481)))

(assert (=> b!195392 (= lt!97481 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97135) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> b!195392 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97135) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195393 () Bool)

(declare-fun Unit!5914 () Unit!5858)

(assert (=> b!195393 (= e!128496 Unit!5914)))

(declare-fun b!195394 () Bool)

(assert (=> b!195394 (= e!128497 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97135) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (= (and d!57515 c!35382) b!195392))

(assert (= (and d!57515 (not c!35382)) b!195393))

(assert (= (and d!57515 (not res!92260)) b!195394))

(declare-fun m!223123 () Bool)

(assert (=> d!57515 m!223123))

(declare-fun m!223125 () Bool)

(assert (=> b!195392 m!223125))

(assert (=> b!195392 m!221765))

(assert (=> b!195392 m!221765))

(declare-fun m!223127 () Bool)

(assert (=> b!195392 m!223127))

(assert (=> b!195394 m!221765))

(assert (=> b!195394 m!221765))

(assert (=> b!195394 m!223127))

(assert (=> d!56911 d!57515))

(declare-fun b!195396 () Bool)

(declare-fun e!128498 () Option!252)

(declare-fun e!128499 () Option!252)

(assert (=> b!195396 (= e!128498 e!128499)))

(declare-fun c!35384 () Bool)

(assert (=> b!195396 (= c!35384 (and ((_ is Cons!2404) lt!97137) (not (= (_1!1761 (h!3045 lt!97137)) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun b!195398 () Bool)

(assert (=> b!195398 (= e!128499 None!250)))

(declare-fun d!57517 () Bool)

(declare-fun c!35383 () Bool)

(assert (=> d!57517 (= c!35383 (and ((_ is Cons!2404) lt!97137) (= (_1!1761 (h!3045 lt!97137)) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> d!57517 (= (getValueByKey!246 lt!97137 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) e!128498)))

(declare-fun b!195397 () Bool)

(assert (=> b!195397 (= e!128499 (getValueByKey!246 (t!7326 lt!97137) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195395 () Bool)

(assert (=> b!195395 (= e!128498 (Some!251 (_2!1761 (h!3045 lt!97137))))))

(assert (= (and d!57517 c!35383) b!195395))

(assert (= (and d!57517 (not c!35383)) b!195396))

(assert (= (and b!195396 c!35384) b!195397))

(assert (= (and b!195396 (not c!35384)) b!195398))

(declare-fun m!223129 () Bool)

(assert (=> b!195397 m!223129))

(assert (=> d!56911 d!57517))

(declare-fun d!57519 () Bool)

(assert (=> d!57519 (= (getValueByKey!246 lt!97137 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!251 (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!97483 () Unit!5858)

(assert (=> d!57519 (= lt!97483 (choose!1076 lt!97137 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128500 () Bool)

(assert (=> d!57519 e!128500))

(declare-fun res!92261 () Bool)

(assert (=> d!57519 (=> (not res!92261) (not e!128500))))

(assert (=> d!57519 (= res!92261 (isStrictlySorted!344 lt!97137))))

(assert (=> d!57519 (= (lemmaContainsTupThenGetReturnValue!133 lt!97137 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97483)))

(declare-fun b!195399 () Bool)

(declare-fun res!92262 () Bool)

(assert (=> b!195399 (=> (not res!92262) (not e!128500))))

(assert (=> b!195399 (= res!92262 (containsKey!249 lt!97137 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195400 () Bool)

(assert (=> b!195400 (= e!128500 (contains!1365 lt!97137 (tuple2!3501 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (= (and d!57519 res!92261) b!195399))

(assert (= (and b!195399 res!92262) b!195400))

(assert (=> d!57519 m!221759))

(declare-fun m!223131 () Bool)

(assert (=> d!57519 m!223131))

(declare-fun m!223133 () Bool)

(assert (=> d!57519 m!223133))

(declare-fun m!223135 () Bool)

(assert (=> b!195399 m!223135))

(declare-fun m!223137 () Bool)

(assert (=> b!195400 m!223137))

(assert (=> d!56911 d!57519))

(declare-fun lt!97484 () List!2408)

(declare-fun b!195401 () Bool)

(declare-fun e!128502 () Bool)

(assert (=> b!195401 (= e!128502 (contains!1365 lt!97484 (tuple2!3501 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun bm!19725 () Bool)

(declare-fun call!19730 () List!2408)

(declare-fun call!19728 () List!2408)

(assert (=> bm!19725 (= call!19730 call!19728)))

(declare-fun e!128501 () List!2408)

(declare-fun b!195402 () Bool)

(assert (=> b!195402 (= e!128501 (insertStrictlySorted!136 (t!7326 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)))) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195403 () Bool)

(declare-fun e!128505 () List!2408)

(declare-fun call!19729 () List!2408)

(assert (=> b!195403 (= e!128505 call!19729)))

(declare-fun b!195404 () Bool)

(declare-fun res!92263 () Bool)

(assert (=> b!195404 (=> (not res!92263) (not e!128502))))

(assert (=> b!195404 (= res!92263 (containsKey!249 lt!97484 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun bm!19726 () Bool)

(assert (=> bm!19726 (= call!19729 call!19730)))

(declare-fun b!195405 () Bool)

(declare-fun c!35387 () Bool)

(assert (=> b!195405 (= c!35387 (and ((_ is Cons!2404) (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)))) (bvsgt (_1!1761 (h!3045 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625))))) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun e!128504 () List!2408)

(assert (=> b!195405 (= e!128504 e!128505)))

(declare-fun b!195406 () Bool)

(assert (=> b!195406 (= e!128504 call!19730)))

(declare-fun b!195407 () Bool)

(declare-fun e!128503 () List!2408)

(assert (=> b!195407 (= e!128503 e!128504)))

(declare-fun c!35385 () Bool)

(assert (=> b!195407 (= c!35385 (and ((_ is Cons!2404) (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)))) (= (_1!1761 (h!3045 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625))))) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195409 () Bool)

(assert (=> b!195409 (= e!128505 call!19729)))

(declare-fun c!35388 () Bool)

(declare-fun bm!19727 () Bool)

(assert (=> bm!19727 (= call!19728 ($colon$colon!102 e!128501 (ite c!35388 (h!3045 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)))) (tuple2!3501 (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun c!35386 () Bool)

(assert (=> bm!19727 (= c!35386 c!35388)))

(declare-fun b!195410 () Bool)

(assert (=> b!195410 (= e!128503 call!19728)))

(declare-fun b!195408 () Bool)

(assert (=> b!195408 (= e!128501 (ite c!35385 (t!7326 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)))) (ite c!35387 (Cons!2404 (h!3045 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)))) (t!7326 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625))))) Nil!2405)))))

(declare-fun d!57521 () Bool)

(assert (=> d!57521 e!128502))

(declare-fun res!92264 () Bool)

(assert (=> d!57521 (=> (not res!92264) (not e!128502))))

(assert (=> d!57521 (= res!92264 (isStrictlySorted!344 lt!97484))))

(assert (=> d!57521 (= lt!97484 e!128503)))

(assert (=> d!57521 (= c!35388 (and ((_ is Cons!2404) (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625)))) (bvslt (_1!1761 (h!3045 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625))))) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> d!57521 (isStrictlySorted!344 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625))))))

(assert (=> d!57521 (= (insertStrictlySorted!136 (toList!1226 (ite c!35036 call!19624 (ite c!35035 call!19621 call!19625))) (_1!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1761 (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97484)))

(assert (= (and d!57521 c!35388) b!195410))

(assert (= (and d!57521 (not c!35388)) b!195407))

(assert (= (and b!195407 c!35385) b!195406))

(assert (= (and b!195407 (not c!35385)) b!195405))

(assert (= (and b!195405 c!35387) b!195409))

(assert (= (and b!195405 (not c!35387)) b!195403))

(assert (= (or b!195409 b!195403) bm!19726))

(assert (= (or b!195406 bm!19726) bm!19725))

(assert (= (or b!195410 bm!19725) bm!19727))

(assert (= (and bm!19727 c!35386) b!195402))

(assert (= (and bm!19727 (not c!35386)) b!195408))

(assert (= (and d!57521 res!92264) b!195404))

(assert (= (and b!195404 res!92263) b!195401))

(declare-fun m!223139 () Bool)

(assert (=> b!195404 m!223139))

(declare-fun m!223141 () Bool)

(assert (=> b!195402 m!223141))

(declare-fun m!223143 () Bool)

(assert (=> bm!19727 m!223143))

(declare-fun m!223145 () Bool)

(assert (=> b!195401 m!223145))

(declare-fun m!223147 () Bool)

(assert (=> d!57521 m!223147))

(declare-fun m!223149 () Bool)

(assert (=> d!57521 m!223149))

(assert (=> d!56911 d!57521))

(declare-fun b!195412 () Bool)

(declare-fun e!128506 () Option!252)

(declare-fun e!128507 () Option!252)

(assert (=> b!195412 (= e!128506 e!128507)))

(declare-fun c!35390 () Bool)

(assert (=> b!195412 (= c!35390 (and ((_ is Cons!2404) (toList!1226 lt!97084)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97084))) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!195414 () Bool)

(assert (=> b!195414 (= e!128507 None!250)))

(declare-fun d!57523 () Bool)

(declare-fun c!35389 () Bool)

(assert (=> d!57523 (= c!35389 (and ((_ is Cons!2404) (toList!1226 lt!97084)) (= (_1!1761 (h!3045 (toList!1226 lt!97084))) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57523 (= (getValueByKey!246 (toList!1226 lt!97084) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) e!128506)))

(declare-fun b!195413 () Bool)

(assert (=> b!195413 (= e!128507 (getValueByKey!246 (t!7326 (toList!1226 lt!97084)) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195411 () Bool)

(assert (=> b!195411 (= e!128506 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97084)))))))

(assert (= (and d!57523 c!35389) b!195411))

(assert (= (and d!57523 (not c!35389)) b!195412))

(assert (= (and b!195412 c!35390) b!195413))

(assert (= (and b!195412 (not c!35390)) b!195414))

(declare-fun m!223151 () Bool)

(assert (=> b!195413 m!223151))

(assert (=> b!194542 d!57523))

(declare-fun d!57525 () Bool)

(declare-fun e!128509 () Bool)

(assert (=> d!57525 e!128509))

(declare-fun res!92265 () Bool)

(assert (=> d!57525 (=> res!92265 e!128509)))

(declare-fun lt!97486 () Bool)

(assert (=> d!57525 (= res!92265 (not lt!97486))))

(declare-fun lt!97488 () Bool)

(assert (=> d!57525 (= lt!97486 lt!97488)))

(declare-fun lt!97485 () Unit!5858)

(declare-fun e!128508 () Unit!5858)

(assert (=> d!57525 (= lt!97485 e!128508)))

(declare-fun c!35391 () Bool)

(assert (=> d!57525 (= c!35391 lt!97488)))

(assert (=> d!57525 (= lt!97488 (containsKey!249 (toList!1226 lt!97036) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57525 (= (contains!1363 lt!97036 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97486)))

(declare-fun b!195415 () Bool)

(declare-fun lt!97487 () Unit!5858)

(assert (=> b!195415 (= e!128508 lt!97487)))

(assert (=> b!195415 (= lt!97487 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97036) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195415 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97036) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195416 () Bool)

(declare-fun Unit!5915 () Unit!5858)

(assert (=> b!195416 (= e!128508 Unit!5915)))

(declare-fun b!195417 () Bool)

(assert (=> b!195417 (= e!128509 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97036) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57525 c!35391) b!195415))

(assert (= (and d!57525 (not c!35391)) b!195416))

(assert (= (and d!57525 (not res!92265)) b!195417))

(declare-fun m!223153 () Bool)

(assert (=> d!57525 m!223153))

(declare-fun m!223155 () Bool)

(assert (=> b!195415 m!223155))

(assert (=> b!195415 m!223073))

(assert (=> b!195415 m!223073))

(declare-fun m!223157 () Bool)

(assert (=> b!195415 m!223157))

(assert (=> b!195417 m!223073))

(assert (=> b!195417 m!223073))

(assert (=> b!195417 m!223157))

(assert (=> bm!19646 d!57525))

(declare-fun d!57527 () Bool)

(assert (=> d!57527 (= (get!2244 (getValueByKey!246 (toList!1226 lt!96869) lt!96856)) (v!4257 (getValueByKey!246 (toList!1226 lt!96869) lt!96856)))))

(assert (=> d!56865 d!57527))

(declare-fun b!195419 () Bool)

(declare-fun e!128510 () Option!252)

(declare-fun e!128511 () Option!252)

(assert (=> b!195419 (= e!128510 e!128511)))

(declare-fun c!35393 () Bool)

(assert (=> b!195419 (= c!35393 (and ((_ is Cons!2404) (toList!1226 lt!96869)) (not (= (_1!1761 (h!3045 (toList!1226 lt!96869))) lt!96856))))))

(declare-fun b!195421 () Bool)

(assert (=> b!195421 (= e!128511 None!250)))

(declare-fun d!57529 () Bool)

(declare-fun c!35392 () Bool)

(assert (=> d!57529 (= c!35392 (and ((_ is Cons!2404) (toList!1226 lt!96869)) (= (_1!1761 (h!3045 (toList!1226 lt!96869))) lt!96856)))))

(assert (=> d!57529 (= (getValueByKey!246 (toList!1226 lt!96869) lt!96856) e!128510)))

(declare-fun b!195420 () Bool)

(assert (=> b!195420 (= e!128511 (getValueByKey!246 (t!7326 (toList!1226 lt!96869)) lt!96856))))

(declare-fun b!195418 () Bool)

(assert (=> b!195418 (= e!128510 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!96869)))))))

(assert (= (and d!57529 c!35392) b!195418))

(assert (= (and d!57529 (not c!35392)) b!195419))

(assert (= (and b!195419 c!35393) b!195420))

(assert (= (and b!195419 (not c!35393)) b!195421))

(declare-fun m!223159 () Bool)

(assert (=> b!195420 m!223159))

(assert (=> d!56865 d!57529))

(assert (=> d!56809 d!56831))

(declare-fun d!57531 () Bool)

(declare-fun lt!97489 () Bool)

(assert (=> d!57531 (= lt!97489 (select (content!156 lt!96929) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun e!128513 () Bool)

(assert (=> d!57531 (= lt!97489 e!128513)))

(declare-fun res!92266 () Bool)

(assert (=> d!57531 (=> (not res!92266) (not e!128513))))

(assert (=> d!57531 (= res!92266 ((_ is Cons!2404) lt!96929))))

(assert (=> d!57531 (= (contains!1365 lt!96929 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))) lt!97489)))

(declare-fun b!195422 () Bool)

(declare-fun e!128512 () Bool)

(assert (=> b!195422 (= e!128513 e!128512)))

(declare-fun res!92267 () Bool)

(assert (=> b!195422 (=> res!92267 e!128512)))

(assert (=> b!195422 (= res!92267 (= (h!3045 lt!96929) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun b!195423 () Bool)

(assert (=> b!195423 (= e!128512 (contains!1365 (t!7326 lt!96929) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(assert (= (and d!57531 res!92266) b!195422))

(assert (= (and b!195422 (not res!92267)) b!195423))

(declare-fun m!223161 () Bool)

(assert (=> d!57531 m!223161))

(declare-fun m!223163 () Bool)

(assert (=> d!57531 m!223163))

(declare-fun m!223165 () Bool)

(assert (=> b!195423 m!223165))

(assert (=> b!194671 d!57531))

(assert (=> d!56765 d!56761))

(assert (=> d!56765 d!56771))

(declare-fun d!57533 () Bool)

(assert (=> d!57533 (contains!1363 (+!319 lt!96917 (tuple2!3501 lt!96902 (zeroValue!3800 thiss!1248))) lt!96915)))

(assert (=> d!57533 true))

(declare-fun _$35!417 () Unit!5858)

(assert (=> d!57533 (= (choose!1075 lt!96917 lt!96902 (zeroValue!3800 thiss!1248) lt!96915) _$35!417)))

(declare-fun bs!7822 () Bool)

(assert (= bs!7822 d!57533))

(assert (=> bs!7822 m!221161))

(assert (=> bs!7822 m!221161))

(assert (=> bs!7822 m!221169))

(assert (=> d!56765 d!57533))

(declare-fun d!57535 () Bool)

(declare-fun e!128515 () Bool)

(assert (=> d!57535 e!128515))

(declare-fun res!92268 () Bool)

(assert (=> d!57535 (=> res!92268 e!128515)))

(declare-fun lt!97491 () Bool)

(assert (=> d!57535 (= res!92268 (not lt!97491))))

(declare-fun lt!97493 () Bool)

(assert (=> d!57535 (= lt!97491 lt!97493)))

(declare-fun lt!97490 () Unit!5858)

(declare-fun e!128514 () Unit!5858)

(assert (=> d!57535 (= lt!97490 e!128514)))

(declare-fun c!35394 () Bool)

(assert (=> d!57535 (= c!35394 lt!97493)))

(assert (=> d!57535 (= lt!97493 (containsKey!249 (toList!1226 lt!96917) lt!96915))))

(assert (=> d!57535 (= (contains!1363 lt!96917 lt!96915) lt!97491)))

(declare-fun b!195424 () Bool)

(declare-fun lt!97492 () Unit!5858)

(assert (=> b!195424 (= e!128514 lt!97492)))

(assert (=> b!195424 (= lt!97492 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!96917) lt!96915))))

(assert (=> b!195424 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96917) lt!96915))))

(declare-fun b!195425 () Bool)

(declare-fun Unit!5916 () Unit!5858)

(assert (=> b!195425 (= e!128514 Unit!5916)))

(declare-fun b!195426 () Bool)

(assert (=> b!195426 (= e!128515 (isDefined!198 (getValueByKey!246 (toList!1226 lt!96917) lt!96915)))))

(assert (= (and d!57535 c!35394) b!195424))

(assert (= (and d!57535 (not c!35394)) b!195425))

(assert (= (and d!57535 (not res!92268)) b!195426))

(declare-fun m!223167 () Bool)

(assert (=> d!57535 m!223167))

(declare-fun m!223169 () Bool)

(assert (=> b!195424 m!223169))

(declare-fun m!223171 () Bool)

(assert (=> b!195424 m!223171))

(assert (=> b!195424 m!223171))

(declare-fun m!223173 () Bool)

(assert (=> b!195424 m!223173))

(assert (=> b!195426 m!223171))

(assert (=> b!195426 m!223171))

(assert (=> b!195426 m!223173))

(assert (=> d!56765 d!57535))

(declare-fun d!57537 () Bool)

(declare-fun lt!97494 () (_ BitVec 32))

(assert (=> d!57537 (and (bvsge lt!97494 #b00000000000000000000000000000000) (bvsle lt!97494 (bvsub (size!4190 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!128517 () (_ BitVec 32))

(assert (=> d!57537 (= lt!97494 e!128517)))

(declare-fun c!35396 () Bool)

(assert (=> d!57537 (= c!35396 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!57537 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 lt!96692))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!4190 (_keys!5953 lt!96692)) (size!4190 (_keys!5953 lt!96692))))))

(assert (=> d!57537 (= (arrayCountValidKeys!0 (_keys!5953 lt!96692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4190 (_keys!5953 lt!96692))) lt!97494)))

(declare-fun b!195427 () Bool)

(declare-fun e!128516 () (_ BitVec 32))

(assert (=> b!195427 (= e!128517 e!128516)))

(declare-fun c!35395 () Bool)

(assert (=> b!195427 (= c!35395 (validKeyInArray!0 (select (arr!3866 (_keys!5953 lt!96692)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195428 () Bool)

(declare-fun call!19731 () (_ BitVec 32))

(assert (=> b!195428 (= e!128516 (bvadd #b00000000000000000000000000000001 call!19731))))

(declare-fun b!195429 () Bool)

(assert (=> b!195429 (= e!128517 #b00000000000000000000000000000000)))

(declare-fun b!195430 () Bool)

(assert (=> b!195430 (= e!128516 call!19731)))

(declare-fun bm!19728 () Bool)

(assert (=> bm!19728 (= call!19731 (arrayCountValidKeys!0 (_keys!5953 lt!96692) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4190 (_keys!5953 lt!96692))))))

(assert (= (and d!57537 c!35396) b!195429))

(assert (= (and d!57537 (not c!35396)) b!195427))

(assert (= (and b!195427 c!35395) b!195428))

(assert (= (and b!195427 (not c!35395)) b!195430))

(assert (= (or b!195428 b!195430) bm!19728))

(assert (=> b!195427 m!222287))

(assert (=> b!195427 m!222287))

(assert (=> b!195427 m!222295))

(declare-fun m!223175 () Bool)

(assert (=> bm!19728 m!223175))

(assert (=> bm!19673 d!57537))

(declare-fun d!57539 () Bool)

(declare-fun res!92269 () Bool)

(declare-fun e!128518 () Bool)

(assert (=> d!57539 (=> res!92269 e!128518)))

(assert (=> d!57539 (= res!92269 (and ((_ is Cons!2404) (t!7326 (toList!1226 lt!96701))) (= (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96701)))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(assert (=> d!57539 (= (containsKey!249 (t!7326 (toList!1226 lt!96701)) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))) e!128518)))

(declare-fun b!195431 () Bool)

(declare-fun e!128519 () Bool)

(assert (=> b!195431 (= e!128518 e!128519)))

(declare-fun res!92270 () Bool)

(assert (=> b!195431 (=> (not res!92270) (not e!128519))))

(assert (=> b!195431 (= res!92270 (and (or (not ((_ is Cons!2404) (t!7326 (toList!1226 lt!96701)))) (bvsle (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96701)))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))) ((_ is Cons!2404) (t!7326 (toList!1226 lt!96701))) (bvslt (_1!1761 (h!3045 (t!7326 (toList!1226 lt!96701)))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691)))))))

(declare-fun b!195432 () Bool)

(assert (=> b!195432 (= e!128519 (containsKey!249 (t!7326 (t!7326 (toList!1226 lt!96701))) (select (arr!3866 (_keys!5953 thiss!1248)) (index!4899 lt!96691))))))

(assert (= (and d!57539 (not res!92269)) b!195431))

(assert (= (and b!195431 res!92270) b!195432))

(assert (=> b!195432 m!220871))

(declare-fun m!223177 () Bool)

(assert (=> b!195432 m!223177))

(assert (=> b!194482 d!57539))

(declare-fun d!57541 () Bool)

(declare-fun lt!97495 () Bool)

(assert (=> d!57541 (= lt!97495 (select (content!156 (toList!1226 lt!97150)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun e!128521 () Bool)

(assert (=> d!57541 (= lt!97495 e!128521)))

(declare-fun res!92271 () Bool)

(assert (=> d!57541 (=> (not res!92271) (not e!128521))))

(assert (=> d!57541 (= res!92271 ((_ is Cons!2404) (toList!1226 lt!97150)))))

(assert (=> d!57541 (= (contains!1365 (toList!1226 lt!97150) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!97495)))

(declare-fun b!195433 () Bool)

(declare-fun e!128520 () Bool)

(assert (=> b!195433 (= e!128521 e!128520)))

(declare-fun res!92272 () Bool)

(assert (=> b!195433 (=> res!92272 e!128520)))

(assert (=> b!195433 (= res!92272 (= (h!3045 (toList!1226 lt!97150)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!195434 () Bool)

(assert (=> b!195434 (= e!128520 (contains!1365 (t!7326 (toList!1226 lt!97150)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!57541 res!92271) b!195433))

(assert (= (and b!195433 (not res!92272)) b!195434))

(declare-fun m!223179 () Bool)

(assert (=> d!57541 m!223179))

(declare-fun m!223181 () Bool)

(assert (=> d!57541 m!223181))

(declare-fun m!223183 () Bool)

(assert (=> b!195434 m!223183))

(assert (=> b!194648 d!57541))

(assert (=> b!194530 d!56965))

(declare-fun d!57543 () Bool)

(declare-fun lt!97496 () Bool)

(assert (=> d!57543 (= lt!97496 (select (content!156 lt!97166) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun e!128523 () Bool)

(assert (=> d!57543 (= lt!97496 e!128523)))

(declare-fun res!92273 () Bool)

(assert (=> d!57543 (=> (not res!92273) (not e!128523))))

(assert (=> d!57543 (= res!92273 ((_ is Cons!2404) lt!97166))))

(assert (=> d!57543 (= (contains!1365 lt!97166 (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))) lt!97496)))

(declare-fun b!195435 () Bool)

(declare-fun e!128522 () Bool)

(assert (=> b!195435 (= e!128523 e!128522)))

(declare-fun res!92274 () Bool)

(assert (=> b!195435 (=> res!92274 e!128522)))

(assert (=> b!195435 (= res!92274 (= (h!3045 lt!97166) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(declare-fun b!195436 () Bool)

(assert (=> b!195436 (= e!128522 (contains!1365 (t!7326 lt!97166) (tuple2!3501 (_1!1761 lt!96690) (_2!1761 lt!96690))))))

(assert (= (and d!57543 res!92273) b!195435))

(assert (= (and b!195435 (not res!92274)) b!195436))

(declare-fun m!223185 () Bool)

(assert (=> d!57543 m!223185))

(declare-fun m!223187 () Bool)

(assert (=> d!57543 m!223187))

(declare-fun m!223189 () Bool)

(assert (=> b!195436 m!223189))

(assert (=> b!194672 d!57543))

(declare-fun lt!97497 () Bool)

(declare-fun d!57545 () Bool)

(assert (=> d!57545 (= lt!97497 (select (content!156 (toList!1226 lt!97135)) (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun e!128525 () Bool)

(assert (=> d!57545 (= lt!97497 e!128525)))

(declare-fun res!92275 () Bool)

(assert (=> d!57545 (=> (not res!92275) (not e!128525))))

(assert (=> d!57545 (= res!92275 ((_ is Cons!2404) (toList!1226 lt!97135)))))

(assert (=> d!57545 (= (contains!1365 (toList!1226 lt!97135) (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97497)))

(declare-fun b!195437 () Bool)

(declare-fun e!128524 () Bool)

(assert (=> b!195437 (= e!128525 e!128524)))

(declare-fun res!92276 () Bool)

(assert (=> b!195437 (=> res!92276 e!128524)))

(assert (=> b!195437 (= res!92276 (= (h!3045 (toList!1226 lt!97135)) (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195438 () Bool)

(assert (=> b!195438 (= e!128524 (contains!1365 (t!7326 (toList!1226 lt!97135)) (ite (or c!35036 c!35035) (tuple2!3501 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3501 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!57545 res!92275) b!195437))

(assert (= (and b!195437 (not res!92276)) b!195438))

(declare-fun m!223191 () Bool)

(assert (=> d!57545 m!223191))

(declare-fun m!223193 () Bool)

(assert (=> d!57545 m!223193))

(declare-fun m!223195 () Bool)

(assert (=> b!195438 m!223195))

(assert (=> b!194614 d!57545))

(declare-fun b!195440 () Bool)

(declare-fun e!128526 () Option!252)

(declare-fun e!128527 () Option!252)

(assert (=> b!195440 (= e!128526 e!128527)))

(declare-fun c!35398 () Bool)

(assert (=> b!195440 (= c!35398 (and ((_ is Cons!2404) (toList!1226 lt!97023)) (not (= (_1!1761 (h!3045 (toList!1226 lt!97023))) (_1!1761 (tuple2!3501 key!828 v!309))))))))

(declare-fun b!195442 () Bool)

(assert (=> b!195442 (= e!128527 None!250)))

(declare-fun c!35397 () Bool)

(declare-fun d!57547 () Bool)

(assert (=> d!57547 (= c!35397 (and ((_ is Cons!2404) (toList!1226 lt!97023)) (= (_1!1761 (h!3045 (toList!1226 lt!97023))) (_1!1761 (tuple2!3501 key!828 v!309)))))))

(assert (=> d!57547 (= (getValueByKey!246 (toList!1226 lt!97023) (_1!1761 (tuple2!3501 key!828 v!309))) e!128526)))

(declare-fun b!195441 () Bool)

(assert (=> b!195441 (= e!128527 (getValueByKey!246 (t!7326 (toList!1226 lt!97023)) (_1!1761 (tuple2!3501 key!828 v!309))))))

(declare-fun b!195439 () Bool)

(assert (=> b!195439 (= e!128526 (Some!251 (_2!1761 (h!3045 (toList!1226 lt!97023)))))))

(assert (= (and d!57547 c!35397) b!195439))

(assert (= (and d!57547 (not c!35397)) b!195440))

(assert (= (and b!195440 c!35398) b!195441))

(assert (= (and b!195440 (not c!35398)) b!195442))

(declare-fun m!223197 () Bool)

(assert (=> b!195441 m!223197))

(assert (=> b!194436 d!57547))

(declare-fun d!57549 () Bool)

(declare-fun e!128529 () Bool)

(assert (=> d!57549 e!128529))

(declare-fun res!92277 () Bool)

(assert (=> d!57549 (=> res!92277 e!128529)))

(declare-fun lt!97499 () Bool)

(assert (=> d!57549 (= res!92277 (not lt!97499))))

(declare-fun lt!97501 () Bool)

(assert (=> d!57549 (= lt!97499 lt!97501)))

(declare-fun lt!97498 () Unit!5858)

(declare-fun e!128528 () Unit!5858)

(assert (=> d!57549 (= lt!97498 e!128528)))

(declare-fun c!35399 () Bool)

(assert (=> d!57549 (= c!35399 lt!97501)))

(assert (=> d!57549 (= lt!97501 (containsKey!249 (toList!1226 lt!97002) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57549 (= (contains!1363 lt!97002 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97499)))

(declare-fun b!195443 () Bool)

(declare-fun lt!97500 () Unit!5858)

(assert (=> b!195443 (= e!128528 lt!97500)))

(assert (=> b!195443 (= lt!97500 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97002) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195443 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97002) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195444 () Bool)

(declare-fun Unit!5917 () Unit!5858)

(assert (=> b!195444 (= e!128528 Unit!5917)))

(declare-fun b!195445 () Bool)

(assert (=> b!195445 (= e!128529 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97002) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57549 c!35399) b!195443))

(assert (= (and d!57549 (not c!35399)) b!195444))

(assert (= (and d!57549 (not res!92277)) b!195445))

(declare-fun m!223199 () Bool)

(assert (=> d!57549 m!223199))

(declare-fun m!223201 () Bool)

(assert (=> b!195443 m!223201))

(declare-fun m!223203 () Bool)

(assert (=> b!195443 m!223203))

(assert (=> b!195443 m!223203))

(declare-fun m!223205 () Bool)

(assert (=> b!195443 m!223205))

(assert (=> b!195445 m!223203))

(assert (=> b!195445 m!223203))

(assert (=> b!195445 m!223205))

(assert (=> b!194393 d!57549))

(assert (=> b!194331 d!57063))

(assert (=> b!194331 d!56819))

(declare-fun d!57551 () Bool)

(assert (=> d!57551 (= (isEmpty!493 lt!96950) (isEmpty!495 (toList!1226 lt!96950)))))

(declare-fun bs!7823 () Bool)

(assert (= bs!7823 d!57551))

(declare-fun m!223207 () Bool)

(assert (=> bs!7823 m!223207))

(assert (=> b!194291 d!57551))

(assert (=> b!194302 d!57089))

(assert (=> b!194302 d!57091))

(assert (=> b!194617 d!57081))

(assert (=> b!194617 d!57083))

(declare-fun d!57553 () Bool)

(declare-fun e!128531 () Bool)

(assert (=> d!57553 e!128531))

(declare-fun res!92278 () Bool)

(assert (=> d!57553 (=> res!92278 e!128531)))

(declare-fun lt!97503 () Bool)

(assert (=> d!57553 (= res!92278 (not lt!97503))))

(declare-fun lt!97505 () Bool)

(assert (=> d!57553 (= lt!97503 lt!97505)))

(declare-fun lt!97502 () Unit!5858)

(declare-fun e!128530 () Unit!5858)

(assert (=> d!57553 (= lt!97502 e!128530)))

(declare-fun c!35400 () Bool)

(assert (=> d!57553 (= c!35400 lt!97505)))

(assert (=> d!57553 (= lt!97505 (containsKey!249 (toList!1226 lt!97084) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57553 (= (contains!1363 lt!97084 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!97503)))

(declare-fun b!195446 () Bool)

(declare-fun lt!97504 () Unit!5858)

(assert (=> b!195446 (= e!128530 lt!97504)))

(assert (=> b!195446 (= lt!97504 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1226 lt!97084) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(assert (=> b!195446 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97084) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195447 () Bool)

(declare-fun Unit!5918 () Unit!5858)

(assert (=> b!195447 (= e!128530 Unit!5918)))

(declare-fun b!195448 () Bool)

(assert (=> b!195448 (= e!128531 (isDefined!198 (getValueByKey!246 (toList!1226 lt!97084) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57553 c!35400) b!195446))

(assert (= (and d!57553 (not c!35400)) b!195447))

(assert (= (and d!57553 (not res!92278)) b!195448))

(declare-fun m!223209 () Bool)

(assert (=> d!57553 m!223209))

(declare-fun m!223211 () Bool)

(assert (=> b!195446 m!223211))

(assert (=> b!195446 m!221605))

(assert (=> b!195446 m!221605))

(declare-fun m!223213 () Bool)

(assert (=> b!195446 m!223213))

(assert (=> b!195448 m!221605))

(assert (=> b!195448 m!221605))

(assert (=> b!195448 m!223213))

(assert (=> d!56857 d!57553))

(declare-fun b!195450 () Bool)

(declare-fun e!128532 () Option!252)

(declare-fun e!128533 () Option!252)

(assert (=> b!195450 (= e!128532 e!128533)))

(declare-fun c!35402 () Bool)

(assert (=> b!195450 (= c!35402 (and ((_ is Cons!2404) lt!97086) (not (= (_1!1761 (h!3045 lt!97086)) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!195452 () Bool)

(assert (=> b!195452 (= e!128533 None!250)))

(declare-fun d!57555 () Bool)

(declare-fun c!35401 () Bool)

(assert (=> d!57555 (= c!35401 (and ((_ is Cons!2404) lt!97086) (= (_1!1761 (h!3045 lt!97086)) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57555 (= (getValueByKey!246 lt!97086 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) e!128532)))

(declare-fun b!195451 () Bool)

(assert (=> b!195451 (= e!128533 (getValueByKey!246 (t!7326 lt!97086) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195449 () Bool)

(assert (=> b!195449 (= e!128532 (Some!251 (_2!1761 (h!3045 lt!97086))))))

(assert (= (and d!57555 c!35401) b!195449))

(assert (= (and d!57555 (not c!35401)) b!195450))

(assert (= (and b!195450 c!35402) b!195451))

(assert (= (and b!195450 (not c!35402)) b!195452))

(declare-fun m!223215 () Bool)

(assert (=> b!195451 m!223215))

(assert (=> d!56857 d!57555))

(declare-fun d!57557 () Bool)

(assert (=> d!57557 (= (getValueByKey!246 lt!97086 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) (Some!251 (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97506 () Unit!5858)

(assert (=> d!57557 (= lt!97506 (choose!1076 lt!97086 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun e!128534 () Bool)

(assert (=> d!57557 e!128534))

(declare-fun res!92279 () Bool)

(assert (=> d!57557 (=> (not res!92279) (not e!128534))))

(assert (=> d!57557 (= res!92279 (isStrictlySorted!344 lt!97086))))

(assert (=> d!57557 (= (lemmaContainsTupThenGetReturnValue!133 lt!97086 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!97506)))

(declare-fun b!195453 () Bool)

(declare-fun res!92280 () Bool)

(assert (=> b!195453 (=> (not res!92280) (not e!128534))))

(assert (=> b!195453 (= res!92280 (containsKey!249 lt!97086 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195454 () Bool)

(assert (=> b!195454 (= e!128534 (contains!1365 lt!97086 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57557 res!92279) b!195453))

(assert (= (and b!195453 res!92280) b!195454))

(assert (=> d!57557 m!221599))

(declare-fun m!223217 () Bool)

(assert (=> d!57557 m!223217))

(declare-fun m!223219 () Bool)

(assert (=> d!57557 m!223219))

(declare-fun m!223221 () Bool)

(assert (=> b!195453 m!223221))

(declare-fun m!223223 () Bool)

(assert (=> b!195454 m!223223))

(assert (=> d!56857 d!57557))

(declare-fun e!128536 () Bool)

(declare-fun lt!97507 () List!2408)

(declare-fun b!195455 () Bool)

(assert (=> b!195455 (= e!128536 (contains!1365 lt!97507 (tuple2!3501 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(declare-fun bm!19729 () Bool)

(declare-fun call!19734 () List!2408)

(declare-fun call!19732 () List!2408)

(assert (=> bm!19729 (= call!19734 call!19732)))

(declare-fun b!195456 () Bool)

(declare-fun e!128535 () List!2408)

(assert (=> b!195456 (= e!128535 (insertStrictlySorted!136 (t!7326 (toList!1226 lt!96873)) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!195457 () Bool)

(declare-fun e!128539 () List!2408)

(declare-fun call!19733 () List!2408)

(assert (=> b!195457 (= e!128539 call!19733)))

(declare-fun b!195458 () Bool)

(declare-fun res!92281 () Bool)

(assert (=> b!195458 (=> (not res!92281) (not e!128536))))

(assert (=> b!195458 (= res!92281 (containsKey!249 lt!97507 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))

(declare-fun bm!19730 () Bool)

(assert (=> bm!19730 (= call!19733 call!19734)))

(declare-fun b!195459 () Bool)

(declare-fun c!35405 () Bool)

(assert (=> b!195459 (= c!35405 (and ((_ is Cons!2404) (toList!1226 lt!96873)) (bvsgt (_1!1761 (h!3045 (toList!1226 lt!96873))) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128538 () List!2408)

(assert (=> b!195459 (= e!128538 e!128539)))

(declare-fun b!195460 () Bool)

(assert (=> b!195460 (= e!128538 call!19734)))

(declare-fun b!195461 () Bool)

(declare-fun e!128537 () List!2408)

(assert (=> b!195461 (= e!128537 e!128538)))

(declare-fun c!35403 () Bool)

(assert (=> b!195461 (= c!35403 (and ((_ is Cons!2404) (toList!1226 lt!96873)) (= (_1!1761 (h!3045 (toList!1226 lt!96873))) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!195463 () Bool)

(assert (=> b!195463 (= e!128539 call!19733)))

(declare-fun bm!19731 () Bool)

(declare-fun c!35406 () Bool)

(assert (=> bm!19731 (= call!19732 ($colon$colon!102 e!128535 (ite c!35406 (h!3045 (toList!1226 lt!96873)) (tuple2!3501 (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))))))))

(declare-fun c!35404 () Bool)

(assert (=> bm!19731 (= c!35404 c!35406)))

(declare-fun b!195464 () Bool)

(assert (=> b!195464 (= e!128537 call!19732)))

(declare-fun b!195462 () Bool)

(assert (=> b!195462 (= e!128535 (ite c!35403 (t!7326 (toList!1226 lt!96873)) (ite c!35405 (Cons!2404 (h!3045 (toList!1226 lt!96873)) (t!7326 (toList!1226 lt!96873))) Nil!2405)))))

(declare-fun d!57559 () Bool)

(assert (=> d!57559 e!128536))

(declare-fun res!92282 () Bool)

(assert (=> d!57559 (=> (not res!92282) (not e!128536))))

(assert (=> d!57559 (= res!92282 (isStrictlySorted!344 lt!97507))))

(assert (=> d!57559 (= lt!97507 e!128537)))

(assert (=> d!57559 (= c!35406 (and ((_ is Cons!2404) (toList!1226 lt!96873)) (bvslt (_1!1761 (h!3045 (toList!1226 lt!96873))) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57559 (isStrictlySorted!344 (toList!1226 lt!96873))))

(assert (=> d!57559 (= (insertStrictlySorted!136 (toList!1226 lt!96873) (_1!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248))) (_2!1761 (tuple2!3501 lt!96858 (zeroValue!3800 thiss!1248)))) lt!97507)))

(assert (= (and d!57559 c!35406) b!195464))

(assert (= (and d!57559 (not c!35406)) b!195461))

(assert (= (and b!195461 c!35403) b!195460))

(assert (= (and b!195461 (not c!35403)) b!195459))

(assert (= (and b!195459 c!35405) b!195463))

(assert (= (and b!195459 (not c!35405)) b!195457))

(assert (= (or b!195463 b!195457) bm!19730))

(assert (= (or b!195460 bm!19730) bm!19729))

(assert (= (or b!195464 bm!19729) bm!19731))

(assert (= (and bm!19731 c!35404) b!195456))

(assert (= (and bm!19731 (not c!35404)) b!195462))

(assert (= (and d!57559 res!92282) b!195458))

(assert (= (and b!195458 res!92281) b!195455))

(declare-fun m!223225 () Bool)

(assert (=> b!195458 m!223225))

(declare-fun m!223227 () Bool)

(assert (=> b!195456 m!223227))

(declare-fun m!223229 () Bool)

(assert (=> bm!19731 m!223229))

(declare-fun m!223231 () Bool)

(assert (=> b!195455 m!223231))

(declare-fun m!223233 () Bool)

(assert (=> d!57559 m!223233))

(declare-fun m!223235 () Bool)

(assert (=> d!57559 m!223235))

(assert (=> d!56857 d!57559))

(declare-fun mapNonEmpty!7777 () Bool)

(declare-fun mapRes!7777 () Bool)

(declare-fun tp!17038 () Bool)

(declare-fun e!128540 () Bool)

(assert (=> mapNonEmpty!7777 (= mapRes!7777 (and tp!17038 e!128540))))

(declare-fun mapKey!7777 () (_ BitVec 32))

(declare-fun mapValue!7777 () ValueCell!1901)

(declare-fun mapRest!7777 () (Array (_ BitVec 32) ValueCell!1901))

(assert (=> mapNonEmpty!7777 (= mapRest!7776 (store mapRest!7777 mapKey!7777 mapValue!7777))))

(declare-fun b!195466 () Bool)

(declare-fun e!128541 () Bool)

(assert (=> b!195466 (= e!128541 tp_is_empty!4489)))

(declare-fun condMapEmpty!7777 () Bool)

(declare-fun mapDefault!7777 () ValueCell!1901)

(assert (=> mapNonEmpty!7776 (= condMapEmpty!7777 (= mapRest!7776 ((as const (Array (_ BitVec 32) ValueCell!1901)) mapDefault!7777)))))

(assert (=> mapNonEmpty!7776 (= tp!17037 (and e!128541 mapRes!7777))))

(declare-fun b!195465 () Bool)

(assert (=> b!195465 (= e!128540 tp_is_empty!4489)))

(declare-fun mapIsEmpty!7777 () Bool)

(assert (=> mapIsEmpty!7777 mapRes!7777))

(assert (= (and mapNonEmpty!7776 condMapEmpty!7777) mapIsEmpty!7777))

(assert (= (and mapNonEmpty!7776 (not condMapEmpty!7777)) mapNonEmpty!7777))

(assert (= (and mapNonEmpty!7777 ((_ is ValueCellFull!1901) mapValue!7777)) b!195465))

(assert (= (and mapNonEmpty!7776 ((_ is ValueCellFull!1901) mapDefault!7777)) b!195466))

(declare-fun m!223237 () Bool)

(assert (=> mapNonEmpty!7777 m!223237))

(declare-fun b_lambda!7547 () Bool)

(assert (= b_lambda!7543 (or (and b!194001 b_free!4717) b_lambda!7547)))

(declare-fun b_lambda!7549 () Bool)

(assert (= b_lambda!7541 (or (and b!194001 b_free!4717) b_lambda!7549)))

(declare-fun b_lambda!7551 () Bool)

(assert (= b_lambda!7533 (or (and b!194001 b_free!4717) b_lambda!7551)))

(declare-fun b_lambda!7553 () Bool)

(assert (= b_lambda!7531 (or (and b!194001 b_free!4717) b_lambda!7553)))

(declare-fun b_lambda!7555 () Bool)

(assert (= b_lambda!7545 (or (and b!194001 b_free!4717) b_lambda!7555)))

(declare-fun b_lambda!7557 () Bool)

(assert (= b_lambda!7519 (or (and b!194001 b_free!4717 (= (defaultEntry!3959 thiss!1248) (defaultEntry!3959 lt!96692))) b_lambda!7557)))

(declare-fun b_lambda!7559 () Bool)

(assert (= b_lambda!7539 (or (and b!194001 b_free!4717) b_lambda!7559)))

(check-sat (not d!56979) (not b!195095) (not b!194744) (not b!195441) (not bm!19714) (not b!195173) (not b!195282) (not d!57287) (not b!194752) (not b!195231) (not d!57413) (not bm!19685) (not b!194717) (not b_lambda!7555) (not b!195249) (not b!195262) (not bm!19682) (not bm!19686) (not d!57367) (not b!195399) (not d!57275) (not d!57265) (not d!57283) (not b!195226) (not b!194883) (not b!194949) (not d!57017) (not b!194890) (not b!194973) (not b!195455) (not d!57137) (not d!57021) (not b!195096) (not b!195067) (not d!57381) (not b!195325) (not d!57289) (not b!195003) (not d!57323) (not d!57081) (not b!195239) (not d!57119) (not b!195060) (not b!195029) (not b!195031) (not b!195247) (not b!194776) (not b!195064) (not b!194947) (not b!194923) (not bm!19699) (not b!194798) (not b!194732) (not d!57273) (not b!195270) (not b!194932) (not d!57389) (not d!57475) (not d!57109) (not b!194772) (not d!57495) (not b!195130) (not d!57013) (not b!195105) (not b_lambda!7559) (not d!57295) (not b!194884) (not d!57099) (not d!57061) (not d!57167) (not d!57531) (not b!194815) (not d!57365) (not b!194984) (not d!57177) (not d!57087) (not b!195379) (not b!195434) (not b!194834) (not b!194808) (not b!194769) (not b!195451) (not b!195143) (not d!57393) (not b!195357) (not b!194894) (not d!57559) (not b_lambda!7507) (not b!194766) (not bm!19731) (not b!194902) (not b!195168) (not b!195448) (not d!57313) (not b!194796) (not b_lambda!7525) (not b!194964) (not b!194690) (not bm!19678) (not d!57209) (not b!195190) (not d!57133) (not b!195001) (not d!57301) (not b!195014) (not d!57257) (not b_lambda!7551) (not b!195436) (not d!57219) (not b!194686) (not b!194937) (not d!57249) (not d!57205) (not b!195284) (not d!57241) (not b!195195) (not b!194847) (not b!194934) (not bm!19727) (not b!195310) (not b!195138) (not d!57461) (not b!195392) (not d!57077) (not b!195068) (not b!195438) (not d!57419) (not b_lambda!7523) (not d!57003) (not d!57479) (not d!57181) (not b!194774) (not b!194821) (not b!194911) (not b!195013) (not b!195163) (not d!57135) (not b!194867) (not d!57473) (not b!194750) (not b!194892) (not b!194812) (not b!195108) (not d!57201) (not b!194806) (not d!57317) (not b!195397) (not d!57415) (not b!194895) (not b!195443) (not b_lambda!7529) (not b!195250) (not d!57079) (not d!57199) (not b!195213) (not b!195012) (not b!195065) b_and!11481 (not b!195081) (not b!194709) (not b!195212) (not b!195165) (not b!194823) (not b!195248) (not b!195445) (not d!56961) (not d!57059) (not b!195453) (not b_lambda!7505) (not d!57491) (not d!57339) (not d!57371) (not b!195098) (not d!57405) (not b!195189) (not b!195192) (not b!194757) (not d!57337) (not d!57333) (not b!194875) (not b!195225) (not bm!19723) (not b!194850) (not b_lambda!7527) (not d!57191) (not d!57143) (not b!195335) (not b!195062) (not d!57215) (not b!195170) (not b!195245) (not bm!19677) (not d!57277) (not b!195366) (not b!195274) (not d!57503) (not d!57489) (not b!195090) (not b!195051) (not b!195076) (not b!195377) (not b!194822) (not b!195070) (not b!195458) (not b!195298) (not b!195291) (not b!195217) (not d!57329) (not d!57015) (not b!195426) (not b!195365) (not b!195363) (not b!195318) (not d!56951) (not b!194734) (not b!194989) (not b!195423) (not b!195004) (not b!195025) (not b!194925) (not bm!19679) (not b!194936) (not b!194788) (not b!195006) (not b!194728) (not b!195116) (not b!195131) (not d!57471) (not b!195009) (not b!194775) (not d!57251) (not b!195215) (not b!195401) (not b!195301) (not d!57247) (not b!195261) (not b!195210) (not b!195132) (not d!57515) (not d!57467) (not b!195148) (not b!195078) (not b!195048) (not b!194909) (not b!194779) (not b!194930) (not b!195352) (not mapNonEmpty!7777) (not d!57379) (not d!57139) (not b!195229) (not b!194913) (not d!57303) (not b!195456) (not b!194863) (not d!57147) (not b!195341) (not b!195197) (not b!195299) (not b!195129) (not b!194735) (not b!194985) (not d!57395) (not d!56995) (not b!194787) (not d!57019) (not b!194975) (not b!195174) (not d!57521) (not b!195115) (not b!194968) (not b!195424) (not d!57307) (not b!194764) (not b!195354) (not bm!19708) (not d!57425) (not d!57291) (not bm!19702) (not b!195128) (not b!195185) (not d!57149) (not b!194785) (not b!195016) (not d!57115) (not b!195233) (not b!195327) (not b!195228) (not b!194961) (not b!195417) (not b!195415) (not b!195329) (not b!195202) (not b!194786) (not d!57227) (not d!57399) (not b!195092) (not d!57525) (not b!194695) (not b!195103) (not b!194810) (not b!195267) (not b!194953) (not d!57297) (not d!57285) (not b_lambda!7521) (not d!57449) (not d!57165) (not b!194742) (not d!57499) (not d!57331) (not d!57271) (not b!195287) (not b!195370) (not d!57085) (not d!57023) (not d!57445) (not bm!19711) (not b!194982) (not b!194912) (not b!195252) (not d!57261) (not b!195149) (not d!57253) (not b!195454) (not b_lambda!7549) (not d!57049) (not b!194754) (not d!57259) (not d!57233) (not b!195413) (not b!194820) (not d!57401) (not d!57211) (not b!195336) (not b!195071) (not b!195097) (not b!194852) (not b!195146) (not b!195344) (not b!195118) (not b!195211) (not b!194943) (not d!57319) (not b!194871) (not bm!19696) (not d!57069) (not b!195181) (not d!57465) (not b!194753) (not d!57005) (not bm!19692) (not b!194773) (not b!194804) (not d!57557) (not b!194958) (not b!195150) (not b!194860) (not b!195446) (not d!56985) (not b!194825) (not d!57089) (not b!195216) (not d!57207) (not b!195046) (not b!195271) (not b!194916) (not d!57533) (not d!57189) (not d!57033) (not d!57217) (not b!195236) (not b!194887) (not d!57279) (not b!194904) (not b!194818) (not b!195038) (not d!57321) (not b!194977) (not b!194767) (not b!195106) (not d!57493) (not d!57553) (not d!57361) (not b!195187) (not b_lambda!7557) (not d!57443) (not d!57335) (not d!57043) (not b!194844) (not b!195153) (not b!195083) (not b!195200) (not b!195044) (not b!194712) (not b!195080) (not b!194931) (not b!195400) (not d!57469) (not b!195367) (not d!57305) (not b!195355) (not b!195402) (not b!194715) (not d!57311) (not d!57535) (not b!195172) (not d!57185) (not b!195420) (not b!195032) (not b!195338) (not b!195432) (not b!194906) (not b!194838) (not b!195049) (not d!57145) (not b!194745) (not b!194720) (not d!57293) (not bm!19717) (not d!57097) (not d!57341) (not bm!19689) (not d!57267) (not b!194733) (not b!194842) (not b!194882) (not d!57093) (not b!195113) (not b!195386) (not b!194780) (not b!195264) (not b!195427) (not d!57519) (not d!57423) (not d!57541) (not b!195141) (not b!194914) (not b!194966) (not b!195272) (not b!195126) (not b!195011) (not d!57325) (not b!194864) (not b!194739) (not d!57343) (not b!195294) (not b!194940) (not bm!19707) (not d!57327) (not b!195039) (not b!194726) (not d!57195) (not d!57239) (not b!195322) (not bm!19728) (not b!194993) (not b!194955) (not b!195342) (not b!194731) (not b!195198) (not d!57545) (not b!194970) (not b!194781) (not b!194703) (not b!195241) (not b!195140) (not d!57105) (not b!195162) (not d!57063) (not d!57113) (not b!195184) (not b_next!4717) (not d!57129) (not b!194784) (not d!57439) (not d!57281) (not b!195269) (not b!194853) (not b!195340) (not b!194889) (not b!194928) (not b!195111) (not b!195404) (not b!195079) (not b!194963) (not bm!19703) (not b!195114) (not b!195161) (not d!56969) (not b!195238) (not d!56953) (not b!195388) (not b!194898) (not b!195073) (not b!195035) (not d!57377) (not d!57179) (not b!194724) (not bm!19695) (not d!57355) (not b!195099) (not b!195091) (not b!195176) (not d!57001) (not b!194857) (not d!57315) (not d!57433) (not d!57065) (not d!56983) (not b!194855) (not b!194706) (not d!57551) (not d!57543) (not d!57039) (not b_lambda!7535) (not b!195125) (not d!57299) (not b!194945) (not b_lambda!7553) (not d!57353) (not d!57501) (not b!195314) (not d!57045) (not d!56999) (not d!57351) (not b!195368) (not d!57549) (not b!194980) (not b!195289) (not b!194710) (not d!57411) (not b!195223) (not b!194700) (not b!194727) (not b!195037) (not d!57235) (not d!56947) (not d!56993) (not b!194951) (not b!195041) (not b!195358) (not d!56959) (not b!194813) (not b!195167) (not b!195296) (not b!195382) (not bm!19724) (not b!195220) (not b!195199) (not b!194761) (not b!194768) (not b!194697) (not bm!19720) (not b!195047) (not b!195259) (not b!195394) (not bm!19706) tp_is_empty!4489 (not b!194987) (not b_lambda!7547) (not b!195243) (not d!57121) (not b!195360) (not d!57075) (not b!195151) (not b_lambda!7537) (not b!195134) (not b!195297) (not b!195137) (not b!195178) (not b!195169))
(check-sat b_and!11481 (not b_next!4717))
