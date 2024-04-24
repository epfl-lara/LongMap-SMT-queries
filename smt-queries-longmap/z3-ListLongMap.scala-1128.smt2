; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23182 () Bool)

(assert start!23182)

(declare-fun b!243156 () Bool)

(declare-fun b_free!6517 () Bool)

(declare-fun b_next!6517 () Bool)

(assert (=> b!243156 (= b_free!6517 (not b_next!6517))))

(declare-fun tp!22771 () Bool)

(declare-fun b_and!13511 () Bool)

(assert (=> b!243156 (= tp!22771 b_and!13511)))

(declare-fun b!243130 () Bool)

(declare-fun res!119150 () Bool)

(declare-datatypes ((V!8153 0))(
  ( (V!8154 (val!3234 Int)) )
))
(declare-datatypes ((ValueCell!2846 0))(
  ( (ValueCellFull!2846 (v!5280 V!8153)) (EmptyCell!2846) )
))
(declare-datatypes ((array!12045 0))(
  ( (array!12046 (arr!5719 (Array (_ BitVec 32) ValueCell!2846)) (size!6061 (_ BitVec 32))) )
))
(declare-datatypes ((array!12047 0))(
  ( (array!12048 (arr!5720 (Array (_ BitVec 32) (_ BitVec 64))) (size!6062 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3592 0))(
  ( (LongMapFixedSize!3593 (defaultEntry!4505 Int) (mask!10594 (_ BitVec 32)) (extraKeys!4242 (_ BitVec 32)) (zeroValue!4346 V!8153) (minValue!4346 V!8153) (_size!1845 (_ BitVec 32)) (_keys!6615 array!12047) (_values!4488 array!12045) (_vacant!1845 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3592)

(declare-datatypes ((SeekEntryResult!1037 0))(
  ( (MissingZero!1037 (index!6318 (_ BitVec 32))) (Found!1037 (index!6319 (_ BitVec 32))) (Intermediate!1037 (undefined!1849 Bool) (index!6320 (_ BitVec 32)) (x!24279 (_ BitVec 32))) (Undefined!1037) (MissingVacant!1037 (index!6321 (_ BitVec 32))) )
))
(declare-fun lt!122113 () SeekEntryResult!1037)

(assert (=> b!243130 (= res!119150 (= (select (arr!5720 (_keys!6615 thiss!1504)) (index!6321 lt!122113)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157788 () Bool)

(assert (=> b!243130 (=> (not res!119150) (not e!157788))))

(declare-fun b!243131 () Bool)

(declare-datatypes ((Unit!7477 0))(
  ( (Unit!7478) )
))
(declare-fun e!157787 () Unit!7477)

(declare-fun Unit!7479 () Unit!7477)

(assert (=> b!243131 (= e!157787 Unit!7479)))

(declare-fun lt!122114 () Unit!7477)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!175 (array!12047 array!12045 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) (_ BitVec 32) Int) Unit!7477)

(assert (=> b!243131 (= lt!122114 (lemmaArrayContainsKeyThenInListMap!175 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(assert (=> b!243131 false))

(declare-fun b!243132 () Bool)

(declare-fun res!119159 () Bool)

(declare-fun e!157784 () Bool)

(assert (=> b!243132 (=> (not res!119159) (not e!157784))))

(declare-fun e!157794 () Bool)

(assert (=> b!243132 (= res!119159 e!157794)))

(declare-fun res!119145 () Bool)

(assert (=> b!243132 (=> res!119145 e!157794)))

(declare-fun e!157792 () Bool)

(assert (=> b!243132 (= res!119145 e!157792)))

(declare-fun res!119146 () Bool)

(assert (=> b!243132 (=> (not res!119146) (not e!157792))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243132 (= res!119146 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!243133 () Bool)

(declare-fun Unit!7480 () Unit!7477)

(assert (=> b!243133 (= e!157787 Unit!7480)))

(declare-fun mapNonEmpty!10816 () Bool)

(declare-fun mapRes!10816 () Bool)

(declare-fun tp!22770 () Bool)

(declare-fun e!157782 () Bool)

(assert (=> mapNonEmpty!10816 (= mapRes!10816 (and tp!22770 e!157782))))

(declare-fun mapRest!10816 () (Array (_ BitVec 32) ValueCell!2846))

(declare-fun mapValue!10816 () ValueCell!2846)

(declare-fun mapKey!10816 () (_ BitVec 32))

(assert (=> mapNonEmpty!10816 (= (arr!5719 (_values!4488 thiss!1504)) (store mapRest!10816 mapKey!10816 mapValue!10816))))

(declare-fun b!243134 () Bool)

(declare-fun call!22652 () Bool)

(assert (=> b!243134 (= e!157788 (not call!22652))))

(declare-fun b!243135 () Bool)

(declare-fun c!40588 () Bool)

(get-info :version)

(assert (=> b!243135 (= c!40588 ((_ is MissingVacant!1037) lt!122113))))

(declare-fun e!157786 () Bool)

(declare-fun e!157793 () Bool)

(assert (=> b!243135 (= e!157786 e!157793)))

(declare-fun b!243136 () Bool)

(assert (=> b!243136 (= e!157793 ((_ is Undefined!1037) lt!122113))))

(declare-fun b!243137 () Bool)

(declare-fun res!119157 () Bool)

(declare-fun e!157781 () Bool)

(assert (=> b!243137 (=> (not res!119157) (not e!157781))))

(assert (=> b!243137 (= res!119157 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!243138 () Bool)

(declare-fun e!157783 () Bool)

(assert (=> b!243138 (= e!157783 (not call!22652))))

(declare-fun b!243139 () Bool)

(declare-fun e!157790 () Bool)

(declare-fun e!157780 () Bool)

(assert (=> b!243139 (= e!157790 e!157780)))

(declare-fun res!119158 () Bool)

(assert (=> b!243139 (=> (not res!119158) (not e!157780))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243139 (= res!119158 (inRange!0 index!297 (mask!10594 thiss!1504)))))

(declare-fun lt!122116 () Unit!7477)

(declare-fun e!157779 () Unit!7477)

(assert (=> b!243139 (= lt!122116 e!157779)))

(declare-fun c!40591 () Bool)

(declare-datatypes ((tuple2!4694 0))(
  ( (tuple2!4695 (_1!2358 (_ BitVec 64)) (_2!2358 V!8153)) )
))
(declare-datatypes ((List!3564 0))(
  ( (Nil!3561) (Cons!3560 (h!4217 tuple2!4694) (t!8561 List!3564)) )
))
(declare-datatypes ((ListLongMap!3609 0))(
  ( (ListLongMap!3610 (toList!1820 List!3564)) )
))
(declare-fun contains!1730 (ListLongMap!3609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1352 (array!12047 array!12045 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 32) Int) ListLongMap!3609)

(assert (=> b!243139 (= c!40591 (contains!1730 (getCurrentListMap!1352 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) key!932))))

(declare-fun b!243140 () Bool)

(declare-fun lt!122111 () Unit!7477)

(assert (=> b!243140 (= e!157779 lt!122111)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!350 (array!12047 array!12045 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7477)

(assert (=> b!243140 (= lt!122111 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!350 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(declare-fun c!40589 () Bool)

(assert (=> b!243140 (= c!40589 ((_ is MissingZero!1037) lt!122113))))

(assert (=> b!243140 e!157786))

(declare-fun b!243141 () Bool)

(declare-fun e!157785 () Bool)

(assert (=> b!243141 (= e!157794 e!157785)))

(declare-fun res!119152 () Bool)

(assert (=> b!243141 (=> (not res!119152) (not e!157785))))

(assert (=> b!243141 (= res!119152 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!243142 () Bool)

(declare-fun tp_is_empty!6379 () Bool)

(assert (=> b!243142 (= e!157782 tp_is_empty!6379)))

(declare-fun b!243143 () Bool)

(declare-datatypes ((List!3565 0))(
  ( (Nil!3562) (Cons!3561 (h!4218 (_ BitVec 64)) (t!8562 List!3565)) )
))
(declare-fun arrayNoDuplicates!0 (array!12047 (_ BitVec 32) List!3565) Bool)

(assert (=> b!243143 (= e!157784 (not (arrayNoDuplicates!0 (_keys!6615 thiss!1504) #b00000000000000000000000000000000 Nil!3562)))))

(declare-fun b!243144 () Bool)

(declare-fun res!119148 () Bool)

(assert (=> b!243144 (=> (not res!119148) (not e!157784))))

(declare-fun noDuplicate!93 (List!3565) Bool)

(assert (=> b!243144 (= res!119148 (noDuplicate!93 Nil!3562))))

(declare-fun bm!22649 () Bool)

(declare-fun arrayContainsKey!0 (array!12047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22649 (= call!22652 (arrayContainsKey!0 (_keys!6615 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!119160 () Bool)

(assert (=> start!23182 (=> (not res!119160) (not e!157781))))

(declare-fun valid!1421 (LongMapFixedSize!3592) Bool)

(assert (=> start!23182 (= res!119160 (valid!1421 thiss!1504))))

(assert (=> start!23182 e!157781))

(declare-fun e!157789 () Bool)

(assert (=> start!23182 e!157789))

(assert (=> start!23182 true))

(declare-fun b!243145 () Bool)

(declare-fun res!119155 () Bool)

(assert (=> b!243145 (=> (not res!119155) (not e!157783))))

(declare-fun call!22653 () Bool)

(assert (=> b!243145 (= res!119155 call!22653)))

(assert (=> b!243145 (= e!157786 e!157783)))

(declare-fun bm!22650 () Bool)

(assert (=> bm!22650 (= call!22653 (inRange!0 (ite c!40589 (index!6318 lt!122113) (index!6321 lt!122113)) (mask!10594 thiss!1504)))))

(declare-fun b!243146 () Bool)

(declare-fun res!119154 () Bool)

(assert (=> b!243146 (=> (not res!119154) (not e!157784))))

(declare-fun contains!1731 (List!3565 (_ BitVec 64)) Bool)

(assert (=> b!243146 (= res!119154 (not (contains!1731 Nil!3562 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243147 () Bool)

(assert (=> b!243147 (= e!157785 (not (contains!1731 Nil!3562 key!932)))))

(declare-fun mapIsEmpty!10816 () Bool)

(assert (=> mapIsEmpty!10816 mapRes!10816))

(declare-fun b!243148 () Bool)

(assert (=> b!243148 (= e!157781 e!157790)))

(declare-fun res!119147 () Bool)

(assert (=> b!243148 (=> (not res!119147) (not e!157790))))

(assert (=> b!243148 (= res!119147 (or (= lt!122113 (MissingZero!1037 index!297)) (= lt!122113 (MissingVacant!1037 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12047 (_ BitVec 32)) SeekEntryResult!1037)

(assert (=> b!243148 (= lt!122113 (seekEntryOrOpen!0 key!932 (_keys!6615 thiss!1504) (mask!10594 thiss!1504)))))

(declare-fun b!243149 () Bool)

(declare-fun e!157791 () Bool)

(declare-fun e!157795 () Bool)

(assert (=> b!243149 (= e!157791 (and e!157795 mapRes!10816))))

(declare-fun condMapEmpty!10816 () Bool)

(declare-fun mapDefault!10816 () ValueCell!2846)

(assert (=> b!243149 (= condMapEmpty!10816 (= (arr!5719 (_values!4488 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2846)) mapDefault!10816)))))

(declare-fun b!243150 () Bool)

(assert (=> b!243150 (= e!157792 (contains!1731 Nil!3562 key!932))))

(declare-fun b!243151 () Bool)

(assert (=> b!243151 (= e!157793 e!157788)))

(declare-fun res!119156 () Bool)

(assert (=> b!243151 (= res!119156 call!22653)))

(assert (=> b!243151 (=> (not res!119156) (not e!157788))))

(declare-fun b!243152 () Bool)

(declare-fun res!119153 () Bool)

(assert (=> b!243152 (=> (not res!119153) (not e!157784))))

(assert (=> b!243152 (= res!119153 (not (contains!1731 Nil!3562 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243153 () Bool)

(declare-fun Unit!7481 () Unit!7477)

(assert (=> b!243153 (= e!157779 Unit!7481)))

(declare-fun lt!122115 () Unit!7477)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!358 (array!12047 array!12045 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7477)

(assert (=> b!243153 (= lt!122115 (lemmaInListMapThenSeekEntryOrOpenFindsIt!358 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(assert (=> b!243153 false))

(declare-fun b!243154 () Bool)

(assert (=> b!243154 (= e!157795 tp_is_empty!6379)))

(declare-fun b!243155 () Bool)

(assert (=> b!243155 (= e!157780 e!157784)))

(declare-fun res!119149 () Bool)

(assert (=> b!243155 (=> (not res!119149) (not e!157784))))

(assert (=> b!243155 (= res!119149 (and (bvslt (size!6062 (_keys!6615 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504)))))))

(declare-fun lt!122112 () Unit!7477)

(assert (=> b!243155 (= lt!122112 e!157787)))

(declare-fun c!40590 () Bool)

(assert (=> b!243155 (= c!40590 (arrayContainsKey!0 (_keys!6615 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3759 (array!12047) Bool)

(declare-fun array_inv!3760 (array!12045) Bool)

(assert (=> b!243156 (= e!157789 (and tp!22771 tp_is_empty!6379 (array_inv!3759 (_keys!6615 thiss!1504)) (array_inv!3760 (_values!4488 thiss!1504)) e!157791))))

(declare-fun b!243157 () Bool)

(declare-fun res!119151 () Bool)

(assert (=> b!243157 (=> (not res!119151) (not e!157783))))

(assert (=> b!243157 (= res!119151 (= (select (arr!5720 (_keys!6615 thiss!1504)) (index!6318 lt!122113)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!23182 res!119160) b!243137))

(assert (= (and b!243137 res!119157) b!243148))

(assert (= (and b!243148 res!119147) b!243139))

(assert (= (and b!243139 c!40591) b!243153))

(assert (= (and b!243139 (not c!40591)) b!243140))

(assert (= (and b!243140 c!40589) b!243145))

(assert (= (and b!243140 (not c!40589)) b!243135))

(assert (= (and b!243145 res!119155) b!243157))

(assert (= (and b!243157 res!119151) b!243138))

(assert (= (and b!243135 c!40588) b!243151))

(assert (= (and b!243135 (not c!40588)) b!243136))

(assert (= (and b!243151 res!119156) b!243130))

(assert (= (and b!243130 res!119150) b!243134))

(assert (= (or b!243145 b!243151) bm!22650))

(assert (= (or b!243138 b!243134) bm!22649))

(assert (= (and b!243139 res!119158) b!243155))

(assert (= (and b!243155 c!40590) b!243131))

(assert (= (and b!243155 (not c!40590)) b!243133))

(assert (= (and b!243155 res!119149) b!243144))

(assert (= (and b!243144 res!119148) b!243146))

(assert (= (and b!243146 res!119154) b!243152))

(assert (= (and b!243152 res!119153) b!243132))

(assert (= (and b!243132 res!119146) b!243150))

(assert (= (and b!243132 (not res!119145)) b!243141))

(assert (= (and b!243141 res!119152) b!243147))

(assert (= (and b!243132 res!119159) b!243143))

(assert (= (and b!243149 condMapEmpty!10816) mapIsEmpty!10816))

(assert (= (and b!243149 (not condMapEmpty!10816)) mapNonEmpty!10816))

(assert (= (and mapNonEmpty!10816 ((_ is ValueCellFull!2846) mapValue!10816)) b!243142))

(assert (= (and b!243149 ((_ is ValueCellFull!2846) mapDefault!10816)) b!243154))

(assert (= b!243156 b!243149))

(assert (= start!23182 b!243156))

(declare-fun m!261843 () Bool)

(assert (=> b!243148 m!261843))

(declare-fun m!261845 () Bool)

(assert (=> b!243150 m!261845))

(declare-fun m!261847 () Bool)

(assert (=> b!243140 m!261847))

(declare-fun m!261849 () Bool)

(assert (=> b!243131 m!261849))

(declare-fun m!261851 () Bool)

(assert (=> bm!22650 m!261851))

(declare-fun m!261853 () Bool)

(assert (=> start!23182 m!261853))

(declare-fun m!261855 () Bool)

(assert (=> mapNonEmpty!10816 m!261855))

(declare-fun m!261857 () Bool)

(assert (=> b!243153 m!261857))

(declare-fun m!261859 () Bool)

(assert (=> b!243144 m!261859))

(declare-fun m!261861 () Bool)

(assert (=> b!243152 m!261861))

(declare-fun m!261863 () Bool)

(assert (=> b!243155 m!261863))

(declare-fun m!261865 () Bool)

(assert (=> b!243157 m!261865))

(declare-fun m!261867 () Bool)

(assert (=> b!243130 m!261867))

(declare-fun m!261869 () Bool)

(assert (=> b!243143 m!261869))

(assert (=> bm!22649 m!261863))

(declare-fun m!261871 () Bool)

(assert (=> b!243146 m!261871))

(declare-fun m!261873 () Bool)

(assert (=> b!243139 m!261873))

(declare-fun m!261875 () Bool)

(assert (=> b!243139 m!261875))

(assert (=> b!243139 m!261875))

(declare-fun m!261877 () Bool)

(assert (=> b!243139 m!261877))

(declare-fun m!261879 () Bool)

(assert (=> b!243156 m!261879))

(declare-fun m!261881 () Bool)

(assert (=> b!243156 m!261881))

(assert (=> b!243147 m!261845))

(check-sat (not b!243150) (not bm!22650) tp_is_empty!6379 (not b!243146) (not b!243152) (not b!243131) (not bm!22649) (not b!243156) (not b!243148) (not b!243143) (not b_next!6517) (not b!243144) (not start!23182) (not b!243155) b_and!13511 (not b!243153) (not b!243139) (not mapNonEmpty!10816) (not b!243140) (not b!243147))
(check-sat b_and!13511 (not b_next!6517))
(get-model)

(declare-fun d!60107 () Bool)

(declare-fun e!157906 () Bool)

(assert (=> d!60107 e!157906))

(declare-fun res!119262 () Bool)

(assert (=> d!60107 (=> (not res!119262) (not e!157906))))

(declare-fun lt!122158 () SeekEntryResult!1037)

(assert (=> d!60107 (= res!119262 ((_ is Found!1037) lt!122158))))

(assert (=> d!60107 (= lt!122158 (seekEntryOrOpen!0 key!932 (_keys!6615 thiss!1504) (mask!10594 thiss!1504)))))

(declare-fun lt!122157 () Unit!7477)

(declare-fun choose!1141 (array!12047 array!12045 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7477)

(assert (=> d!60107 (= lt!122157 (choose!1141 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60107 (validMask!0 (mask!10594 thiss!1504))))

(assert (=> d!60107 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!358 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)) lt!122157)))

(declare-fun b!243330 () Bool)

(declare-fun res!119261 () Bool)

(assert (=> b!243330 (=> (not res!119261) (not e!157906))))

(assert (=> b!243330 (= res!119261 (inRange!0 (index!6319 lt!122158) (mask!10594 thiss!1504)))))

(declare-fun b!243331 () Bool)

(assert (=> b!243331 (= e!157906 (= (select (arr!5720 (_keys!6615 thiss!1504)) (index!6319 lt!122158)) key!932))))

(assert (=> b!243331 (and (bvsge (index!6319 lt!122158) #b00000000000000000000000000000000) (bvslt (index!6319 lt!122158) (size!6062 (_keys!6615 thiss!1504))))))

(assert (= (and d!60107 res!119262) b!243330))

(assert (= (and b!243330 res!119261) b!243331))

(assert (=> d!60107 m!261843))

(declare-fun m!261963 () Bool)

(assert (=> d!60107 m!261963))

(declare-fun m!261965 () Bool)

(assert (=> d!60107 m!261965))

(declare-fun m!261967 () Bool)

(assert (=> b!243330 m!261967))

(declare-fun m!261969 () Bool)

(assert (=> b!243331 m!261969))

(assert (=> b!243153 d!60107))

(declare-fun d!60109 () Bool)

(declare-fun res!119269 () Bool)

(declare-fun e!157909 () Bool)

(assert (=> d!60109 (=> (not res!119269) (not e!157909))))

(declare-fun simpleValid!249 (LongMapFixedSize!3592) Bool)

(assert (=> d!60109 (= res!119269 (simpleValid!249 thiss!1504))))

(assert (=> d!60109 (= (valid!1421 thiss!1504) e!157909)))

(declare-fun b!243338 () Bool)

(declare-fun res!119270 () Bool)

(assert (=> b!243338 (=> (not res!119270) (not e!157909))))

(declare-fun arrayCountValidKeys!0 (array!12047 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!243338 (= res!119270 (= (arrayCountValidKeys!0 (_keys!6615 thiss!1504) #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504))) (_size!1845 thiss!1504)))))

(declare-fun b!243339 () Bool)

(declare-fun res!119271 () Bool)

(assert (=> b!243339 (=> (not res!119271) (not e!157909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12047 (_ BitVec 32)) Bool)

(assert (=> b!243339 (= res!119271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6615 thiss!1504) (mask!10594 thiss!1504)))))

(declare-fun b!243340 () Bool)

(assert (=> b!243340 (= e!157909 (arrayNoDuplicates!0 (_keys!6615 thiss!1504) #b00000000000000000000000000000000 Nil!3562))))

(assert (= (and d!60109 res!119269) b!243338))

(assert (= (and b!243338 res!119270) b!243339))

(assert (= (and b!243339 res!119271) b!243340))

(declare-fun m!261971 () Bool)

(assert (=> d!60109 m!261971))

(declare-fun m!261973 () Bool)

(assert (=> b!243338 m!261973))

(declare-fun m!261975 () Bool)

(assert (=> b!243339 m!261975))

(assert (=> b!243340 m!261869))

(assert (=> start!23182 d!60109))

(declare-fun d!60111 () Bool)

(declare-fun res!119276 () Bool)

(declare-fun e!157914 () Bool)

(assert (=> d!60111 (=> res!119276 e!157914)))

(assert (=> d!60111 (= res!119276 ((_ is Nil!3562) Nil!3562))))

(assert (=> d!60111 (= (noDuplicate!93 Nil!3562) e!157914)))

(declare-fun b!243345 () Bool)

(declare-fun e!157915 () Bool)

(assert (=> b!243345 (= e!157914 e!157915)))

(declare-fun res!119277 () Bool)

(assert (=> b!243345 (=> (not res!119277) (not e!157915))))

(assert (=> b!243345 (= res!119277 (not (contains!1731 (t!8562 Nil!3562) (h!4218 Nil!3562))))))

(declare-fun b!243346 () Bool)

(assert (=> b!243346 (= e!157915 (noDuplicate!93 (t!8562 Nil!3562)))))

(assert (= (and d!60111 (not res!119276)) b!243345))

(assert (= (and b!243345 res!119277) b!243346))

(declare-fun m!261977 () Bool)

(assert (=> b!243345 m!261977))

(declare-fun m!261979 () Bool)

(assert (=> b!243346 m!261979))

(assert (=> b!243144 d!60111))

(declare-fun d!60113 () Bool)

(declare-fun lt!122161 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!161 (List!3565) (InoxSet (_ BitVec 64)))

(assert (=> d!60113 (= lt!122161 (select (content!161 Nil!3562) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157920 () Bool)

(assert (=> d!60113 (= lt!122161 e!157920)))

(declare-fun res!119283 () Bool)

(assert (=> d!60113 (=> (not res!119283) (not e!157920))))

(assert (=> d!60113 (= res!119283 ((_ is Cons!3561) Nil!3562))))

(assert (=> d!60113 (= (contains!1731 Nil!3562 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122161)))

(declare-fun b!243351 () Bool)

(declare-fun e!157921 () Bool)

(assert (=> b!243351 (= e!157920 e!157921)))

(declare-fun res!119282 () Bool)

(assert (=> b!243351 (=> res!119282 e!157921)))

(assert (=> b!243351 (= res!119282 (= (h!4218 Nil!3562) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243352 () Bool)

(assert (=> b!243352 (= e!157921 (contains!1731 (t!8562 Nil!3562) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60113 res!119283) b!243351))

(assert (= (and b!243351 (not res!119282)) b!243352))

(declare-fun m!261981 () Bool)

(assert (=> d!60113 m!261981))

(declare-fun m!261983 () Bool)

(assert (=> d!60113 m!261983))

(declare-fun m!261985 () Bool)

(assert (=> b!243352 m!261985))

(assert (=> b!243152 d!60113))

(declare-fun d!60115 () Bool)

(declare-fun res!119288 () Bool)

(declare-fun e!157926 () Bool)

(assert (=> d!60115 (=> res!119288 e!157926)))

(assert (=> d!60115 (= res!119288 (= (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60115 (= (arrayContainsKey!0 (_keys!6615 thiss!1504) key!932 #b00000000000000000000000000000000) e!157926)))

(declare-fun b!243357 () Bool)

(declare-fun e!157927 () Bool)

(assert (=> b!243357 (= e!157926 e!157927)))

(declare-fun res!119289 () Bool)

(assert (=> b!243357 (=> (not res!119289) (not e!157927))))

(assert (=> b!243357 (= res!119289 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6062 (_keys!6615 thiss!1504))))))

(declare-fun b!243358 () Bool)

(assert (=> b!243358 (= e!157927 (arrayContainsKey!0 (_keys!6615 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60115 (not res!119288)) b!243357))

(assert (= (and b!243357 res!119289) b!243358))

(declare-fun m!261987 () Bool)

(assert (=> d!60115 m!261987))

(declare-fun m!261989 () Bool)

(assert (=> b!243358 m!261989))

(assert (=> bm!22649 d!60115))

(declare-fun d!60117 () Bool)

(declare-fun lt!122162 () Bool)

(assert (=> d!60117 (= lt!122162 (select (content!161 Nil!3562) key!932))))

(declare-fun e!157928 () Bool)

(assert (=> d!60117 (= lt!122162 e!157928)))

(declare-fun res!119291 () Bool)

(assert (=> d!60117 (=> (not res!119291) (not e!157928))))

(assert (=> d!60117 (= res!119291 ((_ is Cons!3561) Nil!3562))))

(assert (=> d!60117 (= (contains!1731 Nil!3562 key!932) lt!122162)))

(declare-fun b!243359 () Bool)

(declare-fun e!157929 () Bool)

(assert (=> b!243359 (= e!157928 e!157929)))

(declare-fun res!119290 () Bool)

(assert (=> b!243359 (=> res!119290 e!157929)))

(assert (=> b!243359 (= res!119290 (= (h!4218 Nil!3562) key!932))))

(declare-fun b!243360 () Bool)

(assert (=> b!243360 (= e!157929 (contains!1731 (t!8562 Nil!3562) key!932))))

(assert (= (and d!60117 res!119291) b!243359))

(assert (= (and b!243359 (not res!119290)) b!243360))

(assert (=> d!60117 m!261981))

(declare-fun m!261991 () Bool)

(assert (=> d!60117 m!261991))

(declare-fun m!261993 () Bool)

(assert (=> b!243360 m!261993))

(assert (=> b!243150 d!60117))

(declare-fun bm!22665 () Bool)

(declare-fun call!22668 () Bool)

(declare-fun c!40618 () Bool)

(assert (=> bm!22665 (= call!22668 (arrayNoDuplicates!0 (_keys!6615 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40618 (Cons!3561 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000) Nil!3562) Nil!3562)))))

(declare-fun d!60119 () Bool)

(declare-fun res!119299 () Bool)

(declare-fun e!157941 () Bool)

(assert (=> d!60119 (=> res!119299 e!157941)))

(assert (=> d!60119 (= res!119299 (bvsge #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504))))))

(assert (=> d!60119 (= (arrayNoDuplicates!0 (_keys!6615 thiss!1504) #b00000000000000000000000000000000 Nil!3562) e!157941)))

(declare-fun b!243371 () Bool)

(declare-fun e!157939 () Bool)

(assert (=> b!243371 (= e!157941 e!157939)))

(declare-fun res!119300 () Bool)

(assert (=> b!243371 (=> (not res!119300) (not e!157939))))

(declare-fun e!157940 () Bool)

(assert (=> b!243371 (= res!119300 (not e!157940))))

(declare-fun res!119298 () Bool)

(assert (=> b!243371 (=> (not res!119298) (not e!157940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!243371 (= res!119298 (validKeyInArray!0 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243372 () Bool)

(declare-fun e!157938 () Bool)

(assert (=> b!243372 (= e!157939 e!157938)))

(assert (=> b!243372 (= c!40618 (validKeyInArray!0 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243373 () Bool)

(assert (=> b!243373 (= e!157938 call!22668)))

(declare-fun b!243374 () Bool)

(assert (=> b!243374 (= e!157940 (contains!1731 Nil!3562 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243375 () Bool)

(assert (=> b!243375 (= e!157938 call!22668)))

(assert (= (and d!60119 (not res!119299)) b!243371))

(assert (= (and b!243371 res!119298) b!243374))

(assert (= (and b!243371 res!119300) b!243372))

(assert (= (and b!243372 c!40618) b!243373))

(assert (= (and b!243372 (not c!40618)) b!243375))

(assert (= (or b!243373 b!243375) bm!22665))

(assert (=> bm!22665 m!261987))

(declare-fun m!261995 () Bool)

(assert (=> bm!22665 m!261995))

(assert (=> b!243371 m!261987))

(assert (=> b!243371 m!261987))

(declare-fun m!261997 () Bool)

(assert (=> b!243371 m!261997))

(assert (=> b!243372 m!261987))

(assert (=> b!243372 m!261987))

(assert (=> b!243372 m!261997))

(assert (=> b!243374 m!261987))

(assert (=> b!243374 m!261987))

(declare-fun m!261999 () Bool)

(assert (=> b!243374 m!261999))

(assert (=> b!243143 d!60119))

(declare-fun d!60121 () Bool)

(assert (=> d!60121 (= (inRange!0 index!297 (mask!10594 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10594 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!243139 d!60121))

(declare-fun d!60123 () Bool)

(declare-fun e!157947 () Bool)

(assert (=> d!60123 e!157947))

(declare-fun res!119303 () Bool)

(assert (=> d!60123 (=> res!119303 e!157947)))

(declare-fun lt!122171 () Bool)

(assert (=> d!60123 (= res!119303 (not lt!122171))))

(declare-fun lt!122173 () Bool)

(assert (=> d!60123 (= lt!122171 lt!122173)))

(declare-fun lt!122174 () Unit!7477)

(declare-fun e!157946 () Unit!7477)

(assert (=> d!60123 (= lt!122174 e!157946)))

(declare-fun c!40621 () Bool)

(assert (=> d!60123 (= c!40621 lt!122173)))

(declare-fun containsKey!276 (List!3564 (_ BitVec 64)) Bool)

(assert (=> d!60123 (= lt!122173 (containsKey!276 (toList!1820 (getCurrentListMap!1352 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504))) key!932))))

(assert (=> d!60123 (= (contains!1730 (getCurrentListMap!1352 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) key!932) lt!122171)))

(declare-fun b!243382 () Bool)

(declare-fun lt!122172 () Unit!7477)

(assert (=> b!243382 (= e!157946 lt!122172)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!224 (List!3564 (_ BitVec 64)) Unit!7477)

(assert (=> b!243382 (= lt!122172 (lemmaContainsKeyImpliesGetValueByKeyDefined!224 (toList!1820 (getCurrentListMap!1352 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504))) key!932))))

(declare-datatypes ((Option!291 0))(
  ( (Some!290 (v!5284 V!8153)) (None!289) )
))
(declare-fun isDefined!225 (Option!291) Bool)

(declare-fun getValueByKey!285 (List!3564 (_ BitVec 64)) Option!291)

(assert (=> b!243382 (isDefined!225 (getValueByKey!285 (toList!1820 (getCurrentListMap!1352 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504))) key!932))))

(declare-fun b!243383 () Bool)

(declare-fun Unit!7491 () Unit!7477)

(assert (=> b!243383 (= e!157946 Unit!7491)))

(declare-fun b!243384 () Bool)

(assert (=> b!243384 (= e!157947 (isDefined!225 (getValueByKey!285 (toList!1820 (getCurrentListMap!1352 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504))) key!932)))))

(assert (= (and d!60123 c!40621) b!243382))

(assert (= (and d!60123 (not c!40621)) b!243383))

(assert (= (and d!60123 (not res!119303)) b!243384))

(declare-fun m!262001 () Bool)

(assert (=> d!60123 m!262001))

(declare-fun m!262003 () Bool)

(assert (=> b!243382 m!262003))

(declare-fun m!262005 () Bool)

(assert (=> b!243382 m!262005))

(assert (=> b!243382 m!262005))

(declare-fun m!262007 () Bool)

(assert (=> b!243382 m!262007))

(assert (=> b!243384 m!262005))

(assert (=> b!243384 m!262005))

(assert (=> b!243384 m!262007))

(assert (=> b!243139 d!60123))

(declare-fun b!243427 () Bool)

(declare-fun e!157985 () Unit!7477)

(declare-fun lt!122240 () Unit!7477)

(assert (=> b!243427 (= e!157985 lt!122240)))

(declare-fun lt!122231 () ListLongMap!3609)

(declare-fun getCurrentListMapNoExtraKeys!542 (array!12047 array!12045 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 32) Int) ListLongMap!3609)

(assert (=> b!243427 (= lt!122231 (getCurrentListMapNoExtraKeys!542 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun lt!122220 () (_ BitVec 64))

(assert (=> b!243427 (= lt!122220 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122235 () (_ BitVec 64))

(assert (=> b!243427 (= lt!122235 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122230 () Unit!7477)

(declare-fun addStillContains!202 (ListLongMap!3609 (_ BitVec 64) V!8153 (_ BitVec 64)) Unit!7477)

(assert (=> b!243427 (= lt!122230 (addStillContains!202 lt!122231 lt!122220 (zeroValue!4346 thiss!1504) lt!122235))))

(declare-fun +!653 (ListLongMap!3609 tuple2!4694) ListLongMap!3609)

(assert (=> b!243427 (contains!1730 (+!653 lt!122231 (tuple2!4695 lt!122220 (zeroValue!4346 thiss!1504))) lt!122235)))

(declare-fun lt!122237 () Unit!7477)

(assert (=> b!243427 (= lt!122237 lt!122230)))

(declare-fun lt!122226 () ListLongMap!3609)

(assert (=> b!243427 (= lt!122226 (getCurrentListMapNoExtraKeys!542 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun lt!122222 () (_ BitVec 64))

(assert (=> b!243427 (= lt!122222 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122234 () (_ BitVec 64))

(assert (=> b!243427 (= lt!122234 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122227 () Unit!7477)

(declare-fun addApplyDifferent!202 (ListLongMap!3609 (_ BitVec 64) V!8153 (_ BitVec 64)) Unit!7477)

(assert (=> b!243427 (= lt!122227 (addApplyDifferent!202 lt!122226 lt!122222 (minValue!4346 thiss!1504) lt!122234))))

(declare-fun apply!226 (ListLongMap!3609 (_ BitVec 64)) V!8153)

(assert (=> b!243427 (= (apply!226 (+!653 lt!122226 (tuple2!4695 lt!122222 (minValue!4346 thiss!1504))) lt!122234) (apply!226 lt!122226 lt!122234))))

(declare-fun lt!122233 () Unit!7477)

(assert (=> b!243427 (= lt!122233 lt!122227)))

(declare-fun lt!122239 () ListLongMap!3609)

(assert (=> b!243427 (= lt!122239 (getCurrentListMapNoExtraKeys!542 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun lt!122219 () (_ BitVec 64))

(assert (=> b!243427 (= lt!122219 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122224 () (_ BitVec 64))

(assert (=> b!243427 (= lt!122224 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122223 () Unit!7477)

(assert (=> b!243427 (= lt!122223 (addApplyDifferent!202 lt!122239 lt!122219 (zeroValue!4346 thiss!1504) lt!122224))))

(assert (=> b!243427 (= (apply!226 (+!653 lt!122239 (tuple2!4695 lt!122219 (zeroValue!4346 thiss!1504))) lt!122224) (apply!226 lt!122239 lt!122224))))

(declare-fun lt!122225 () Unit!7477)

(assert (=> b!243427 (= lt!122225 lt!122223)))

(declare-fun lt!122221 () ListLongMap!3609)

(assert (=> b!243427 (= lt!122221 (getCurrentListMapNoExtraKeys!542 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun lt!122232 () (_ BitVec 64))

(assert (=> b!243427 (= lt!122232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122236 () (_ BitVec 64))

(assert (=> b!243427 (= lt!122236 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243427 (= lt!122240 (addApplyDifferent!202 lt!122221 lt!122232 (minValue!4346 thiss!1504) lt!122236))))

(assert (=> b!243427 (= (apply!226 (+!653 lt!122221 (tuple2!4695 lt!122232 (minValue!4346 thiss!1504))) lt!122236) (apply!226 lt!122221 lt!122236))))

(declare-fun bm!22680 () Bool)

(declare-fun call!22684 () ListLongMap!3609)

(declare-fun call!22687 () ListLongMap!3609)

(assert (=> bm!22680 (= call!22684 call!22687)))

(declare-fun b!243428 () Bool)

(declare-fun e!157980 () ListLongMap!3609)

(assert (=> b!243428 (= e!157980 call!22684)))

(declare-fun b!243429 () Bool)

(declare-fun e!157975 () Bool)

(assert (=> b!243429 (= e!157975 (validKeyInArray!0 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60125 () Bool)

(declare-fun e!157982 () Bool)

(assert (=> d!60125 e!157982))

(declare-fun res!119326 () Bool)

(assert (=> d!60125 (=> (not res!119326) (not e!157982))))

(assert (=> d!60125 (= res!119326 (or (bvsge #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504))))))))

(declare-fun lt!122229 () ListLongMap!3609)

(declare-fun lt!122228 () ListLongMap!3609)

(assert (=> d!60125 (= lt!122229 lt!122228)))

(declare-fun lt!122238 () Unit!7477)

(assert (=> d!60125 (= lt!122238 e!157985)))

(declare-fun c!40638 () Bool)

(assert (=> d!60125 (= c!40638 e!157975)))

(declare-fun res!119324 () Bool)

(assert (=> d!60125 (=> (not res!119324) (not e!157975))))

(assert (=> d!60125 (= res!119324 (bvslt #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504))))))

(declare-fun e!157979 () ListLongMap!3609)

(assert (=> d!60125 (= lt!122228 e!157979)))

(declare-fun c!40636 () Bool)

(assert (=> d!60125 (= c!40636 (and (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60125 (validMask!0 (mask!10594 thiss!1504))))

(assert (=> d!60125 (= (getCurrentListMap!1352 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) lt!122229)))

(declare-fun bm!22681 () Bool)

(declare-fun call!22689 () Bool)

(assert (=> bm!22681 (= call!22689 (contains!1730 lt!122229 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22682 () Bool)

(declare-fun call!22686 () ListLongMap!3609)

(assert (=> bm!22682 (= call!22687 call!22686)))

(declare-fun b!243430 () Bool)

(declare-fun e!157977 () Bool)

(declare-fun e!157981 () Bool)

(assert (=> b!243430 (= e!157977 e!157981)))

(declare-fun res!119322 () Bool)

(assert (=> b!243430 (=> (not res!119322) (not e!157981))))

(assert (=> b!243430 (= res!119322 (contains!1730 lt!122229 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!243430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504))))))

(declare-fun b!243431 () Bool)

(declare-fun e!157978 () Bool)

(assert (=> b!243431 (= e!157978 (not call!22689))))

(declare-fun b!243432 () Bool)

(declare-fun res!119330 () Bool)

(assert (=> b!243432 (=> (not res!119330) (not e!157982))))

(declare-fun e!157986 () Bool)

(assert (=> b!243432 (= res!119330 e!157986)))

(declare-fun c!40637 () Bool)

(assert (=> b!243432 (= c!40637 (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!243433 () Bool)

(declare-fun e!157984 () Bool)

(assert (=> b!243433 (= e!157984 (validKeyInArray!0 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22683 () Bool)

(assert (=> bm!22683 (= call!22686 (getCurrentListMapNoExtraKeys!542 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun b!243434 () Bool)

(declare-fun e!157976 () ListLongMap!3609)

(declare-fun call!22683 () ListLongMap!3609)

(assert (=> b!243434 (= e!157976 call!22683)))

(declare-fun b!243435 () Bool)

(assert (=> b!243435 (= e!157980 call!22683)))

(declare-fun b!243436 () Bool)

(declare-fun e!157983 () Bool)

(assert (=> b!243436 (= e!157978 e!157983)))

(declare-fun res!119328 () Bool)

(assert (=> b!243436 (= res!119328 call!22689)))

(assert (=> b!243436 (=> (not res!119328) (not e!157983))))

(declare-fun b!243437 () Bool)

(declare-fun c!40634 () Bool)

(assert (=> b!243437 (= c!40634 (and (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!243437 (= e!157976 e!157980)))

(declare-fun b!243438 () Bool)

(declare-fun e!157974 () Bool)

(assert (=> b!243438 (= e!157986 e!157974)))

(declare-fun res!119325 () Bool)

(declare-fun call!22685 () Bool)

(assert (=> b!243438 (= res!119325 call!22685)))

(assert (=> b!243438 (=> (not res!119325) (not e!157974))))

(declare-fun b!243439 () Bool)

(assert (=> b!243439 (= e!157974 (= (apply!226 lt!122229 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4346 thiss!1504)))))

(declare-fun b!243440 () Bool)

(assert (=> b!243440 (= e!157982 e!157978)))

(declare-fun c!40635 () Bool)

(assert (=> b!243440 (= c!40635 (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!243441 () Bool)

(assert (=> b!243441 (= e!157983 (= (apply!226 lt!122229 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4346 thiss!1504)))))

(declare-fun bm!22684 () Bool)

(assert (=> bm!22684 (= call!22685 (contains!1730 lt!122229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243442 () Bool)

(declare-fun get!2944 (ValueCell!2846 V!8153) V!8153)

(declare-fun dynLambda!569 (Int (_ BitVec 64)) V!8153)

(assert (=> b!243442 (= e!157981 (= (apply!226 lt!122229 (select (arr!5720 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000)) (get!2944 (select (arr!5719 (_values!4488 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!569 (defaultEntry!4505 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!243442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6061 (_values!4488 thiss!1504))))))

(assert (=> b!243442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504))))))

(declare-fun bm!22685 () Bool)

(declare-fun call!22688 () ListLongMap!3609)

(assert (=> bm!22685 (= call!22683 call!22688)))

(declare-fun b!243443 () Bool)

(assert (=> b!243443 (= e!157979 (+!653 call!22688 (tuple2!4695 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4346 thiss!1504))))))

(declare-fun b!243444 () Bool)

(assert (=> b!243444 (= e!157986 (not call!22685))))

(declare-fun b!243445 () Bool)

(declare-fun res!119323 () Bool)

(assert (=> b!243445 (=> (not res!119323) (not e!157982))))

(assert (=> b!243445 (= res!119323 e!157977)))

(declare-fun res!119327 () Bool)

(assert (=> b!243445 (=> res!119327 e!157977)))

(assert (=> b!243445 (= res!119327 (not e!157984))))

(declare-fun res!119329 () Bool)

(assert (=> b!243445 (=> (not res!119329) (not e!157984))))

(assert (=> b!243445 (= res!119329 (bvslt #b00000000000000000000000000000000 (size!6062 (_keys!6615 thiss!1504))))))

(declare-fun bm!22686 () Bool)

(declare-fun c!40639 () Bool)

(assert (=> bm!22686 (= call!22688 (+!653 (ite c!40636 call!22686 (ite c!40639 call!22687 call!22684)) (ite (or c!40636 c!40639) (tuple2!4695 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4346 thiss!1504)) (tuple2!4695 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4346 thiss!1504)))))))

(declare-fun b!243446 () Bool)

(assert (=> b!243446 (= e!157979 e!157976)))

(assert (=> b!243446 (= c!40639 (and (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!243447 () Bool)

(declare-fun Unit!7492 () Unit!7477)

(assert (=> b!243447 (= e!157985 Unit!7492)))

(assert (= (and d!60125 c!40636) b!243443))

(assert (= (and d!60125 (not c!40636)) b!243446))

(assert (= (and b!243446 c!40639) b!243434))

(assert (= (and b!243446 (not c!40639)) b!243437))

(assert (= (and b!243437 c!40634) b!243435))

(assert (= (and b!243437 (not c!40634)) b!243428))

(assert (= (or b!243435 b!243428) bm!22680))

(assert (= (or b!243434 bm!22680) bm!22682))

(assert (= (or b!243434 b!243435) bm!22685))

(assert (= (or b!243443 bm!22682) bm!22683))

(assert (= (or b!243443 bm!22685) bm!22686))

(assert (= (and d!60125 res!119324) b!243429))

(assert (= (and d!60125 c!40638) b!243427))

(assert (= (and d!60125 (not c!40638)) b!243447))

(assert (= (and d!60125 res!119326) b!243445))

(assert (= (and b!243445 res!119329) b!243433))

(assert (= (and b!243445 (not res!119327)) b!243430))

(assert (= (and b!243430 res!119322) b!243442))

(assert (= (and b!243445 res!119323) b!243432))

(assert (= (and b!243432 c!40637) b!243438))

(assert (= (and b!243432 (not c!40637)) b!243444))

(assert (= (and b!243438 res!119325) b!243439))

(assert (= (or b!243438 b!243444) bm!22684))

(assert (= (and b!243432 res!119330) b!243440))

(assert (= (and b!243440 c!40635) b!243436))

(assert (= (and b!243440 (not c!40635)) b!243431))

(assert (= (and b!243436 res!119328) b!243441))

(assert (= (or b!243436 b!243431) bm!22681))

(declare-fun b_lambda!8029 () Bool)

(assert (=> (not b_lambda!8029) (not b!243442)))

(declare-fun t!8568 () Bool)

(declare-fun tb!2957 () Bool)

(assert (=> (and b!243156 (= (defaultEntry!4505 thiss!1504) (defaultEntry!4505 thiss!1504)) t!8568) tb!2957))

(declare-fun result!5209 () Bool)

(assert (=> tb!2957 (= result!5209 tp_is_empty!6379)))

(assert (=> b!243442 t!8568))

(declare-fun b_and!13517 () Bool)

(assert (= b_and!13511 (and (=> t!8568 result!5209) b_and!13517)))

(declare-fun m!262009 () Bool)

(assert (=> b!243439 m!262009))

(declare-fun m!262011 () Bool)

(assert (=> b!243442 m!262011))

(assert (=> b!243442 m!261987))

(declare-fun m!262013 () Bool)

(assert (=> b!243442 m!262013))

(declare-fun m!262015 () Bool)

(assert (=> b!243442 m!262015))

(assert (=> b!243442 m!262011))

(assert (=> b!243442 m!262015))

(declare-fun m!262017 () Bool)

(assert (=> b!243442 m!262017))

(assert (=> b!243442 m!261987))

(declare-fun m!262019 () Bool)

(assert (=> b!243443 m!262019))

(declare-fun m!262021 () Bool)

(assert (=> bm!22681 m!262021))

(declare-fun m!262023 () Bool)

(assert (=> bm!22683 m!262023))

(assert (=> b!243433 m!261987))

(assert (=> b!243433 m!261987))

(assert (=> b!243433 m!261997))

(assert (=> b!243429 m!261987))

(assert (=> b!243429 m!261987))

(assert (=> b!243429 m!261997))

(declare-fun m!262025 () Bool)

(assert (=> b!243441 m!262025))

(assert (=> d!60125 m!261965))

(declare-fun m!262027 () Bool)

(assert (=> bm!22686 m!262027))

(declare-fun m!262029 () Bool)

(assert (=> b!243427 m!262029))

(declare-fun m!262031 () Bool)

(assert (=> b!243427 m!262031))

(assert (=> b!243427 m!262023))

(declare-fun m!262033 () Bool)

(assert (=> b!243427 m!262033))

(declare-fun m!262035 () Bool)

(assert (=> b!243427 m!262035))

(assert (=> b!243427 m!262033))

(declare-fun m!262037 () Bool)

(assert (=> b!243427 m!262037))

(declare-fun m!262039 () Bool)

(assert (=> b!243427 m!262039))

(assert (=> b!243427 m!261987))

(assert (=> b!243427 m!262029))

(declare-fun m!262041 () Bool)

(assert (=> b!243427 m!262041))

(declare-fun m!262043 () Bool)

(assert (=> b!243427 m!262043))

(assert (=> b!243427 m!262041))

(declare-fun m!262045 () Bool)

(assert (=> b!243427 m!262045))

(declare-fun m!262047 () Bool)

(assert (=> b!243427 m!262047))

(declare-fun m!262049 () Bool)

(assert (=> b!243427 m!262049))

(declare-fun m!262051 () Bool)

(assert (=> b!243427 m!262051))

(declare-fun m!262053 () Bool)

(assert (=> b!243427 m!262053))

(declare-fun m!262055 () Bool)

(assert (=> b!243427 m!262055))

(assert (=> b!243427 m!262037))

(declare-fun m!262057 () Bool)

(assert (=> b!243427 m!262057))

(declare-fun m!262059 () Bool)

(assert (=> bm!22684 m!262059))

(assert (=> b!243430 m!261987))

(assert (=> b!243430 m!261987))

(declare-fun m!262061 () Bool)

(assert (=> b!243430 m!262061))

(assert (=> b!243139 d!60125))

(declare-fun b!243466 () Bool)

(declare-fun e!157995 () Bool)

(declare-fun e!157996 () Bool)

(assert (=> b!243466 (= e!157995 e!157996)))

(declare-fun res!119340 () Bool)

(declare-fun call!22695 () Bool)

(assert (=> b!243466 (= res!119340 call!22695)))

(assert (=> b!243466 (=> (not res!119340) (not e!157996))))

(declare-fun b!243467 () Bool)

(declare-fun e!157998 () Bool)

(declare-fun lt!122245 () SeekEntryResult!1037)

(assert (=> b!243467 (= e!157998 ((_ is Undefined!1037) lt!122245))))

(declare-fun b!243468 () Bool)

(assert (=> b!243468 (= e!157995 e!157998)))

(declare-fun c!40645 () Bool)

(assert (=> b!243468 (= c!40645 ((_ is MissingVacant!1037) lt!122245))))

(declare-fun b!243469 () Bool)

(assert (=> b!243469 (and (bvsge (index!6318 lt!122245) #b00000000000000000000000000000000) (bvslt (index!6318 lt!122245) (size!6062 (_keys!6615 thiss!1504))))))

(declare-fun res!119339 () Bool)

(assert (=> b!243469 (= res!119339 (= (select (arr!5720 (_keys!6615 thiss!1504)) (index!6318 lt!122245)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243469 (=> (not res!119339) (not e!157996))))

(declare-fun d!60127 () Bool)

(assert (=> d!60127 e!157995))

(declare-fun c!40644 () Bool)

(assert (=> d!60127 (= c!40644 ((_ is MissingZero!1037) lt!122245))))

(assert (=> d!60127 (= lt!122245 (seekEntryOrOpen!0 key!932 (_keys!6615 thiss!1504) (mask!10594 thiss!1504)))))

(declare-fun lt!122246 () Unit!7477)

(declare-fun choose!1142 (array!12047 array!12045 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7477)

(assert (=> d!60127 (= lt!122246 (choose!1142 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(assert (=> d!60127 (validMask!0 (mask!10594 thiss!1504))))

(assert (=> d!60127 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!350 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)) lt!122246)))

(declare-fun b!243470 () Bool)

(declare-fun call!22694 () Bool)

(assert (=> b!243470 (= e!157996 (not call!22694))))

(declare-fun b!243471 () Bool)

(declare-fun res!119342 () Bool)

(declare-fun e!157997 () Bool)

(assert (=> b!243471 (=> (not res!119342) (not e!157997))))

(assert (=> b!243471 (= res!119342 (= (select (arr!5720 (_keys!6615 thiss!1504)) (index!6321 lt!122245)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243471 (and (bvsge (index!6321 lt!122245) #b00000000000000000000000000000000) (bvslt (index!6321 lt!122245) (size!6062 (_keys!6615 thiss!1504))))))

(declare-fun bm!22691 () Bool)

(assert (=> bm!22691 (= call!22695 (inRange!0 (ite c!40644 (index!6318 lt!122245) (index!6321 lt!122245)) (mask!10594 thiss!1504)))))

(declare-fun b!243472 () Bool)

(assert (=> b!243472 (= e!157997 (not call!22694))))

(declare-fun bm!22692 () Bool)

(assert (=> bm!22692 (= call!22694 (arrayContainsKey!0 (_keys!6615 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243473 () Bool)

(declare-fun res!119341 () Bool)

(assert (=> b!243473 (=> (not res!119341) (not e!157997))))

(assert (=> b!243473 (= res!119341 call!22695)))

(assert (=> b!243473 (= e!157998 e!157997)))

(assert (= (and d!60127 c!40644) b!243466))

(assert (= (and d!60127 (not c!40644)) b!243468))

(assert (= (and b!243466 res!119340) b!243469))

(assert (= (and b!243469 res!119339) b!243470))

(assert (= (and b!243468 c!40645) b!243473))

(assert (= (and b!243468 (not c!40645)) b!243467))

(assert (= (and b!243473 res!119341) b!243471))

(assert (= (and b!243471 res!119342) b!243472))

(assert (= (or b!243466 b!243473) bm!22691))

(assert (= (or b!243470 b!243472) bm!22692))

(declare-fun m!262063 () Bool)

(assert (=> b!243471 m!262063))

(assert (=> bm!22692 m!261863))

(declare-fun m!262065 () Bool)

(assert (=> bm!22691 m!262065))

(declare-fun m!262067 () Bool)

(assert (=> b!243469 m!262067))

(assert (=> d!60127 m!261843))

(declare-fun m!262069 () Bool)

(assert (=> d!60127 m!262069))

(assert (=> d!60127 m!261965))

(assert (=> b!243140 d!60127))

(declare-fun d!60129 () Bool)

(assert (=> d!60129 (contains!1730 (getCurrentListMap!1352 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) key!932)))

(declare-fun lt!122249 () Unit!7477)

(declare-fun choose!1143 (array!12047 array!12045 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) (_ BitVec 32) Int) Unit!7477)

(assert (=> d!60129 (= lt!122249 (choose!1143 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(assert (=> d!60129 (validMask!0 (mask!10594 thiss!1504))))

(assert (=> d!60129 (= (lemmaArrayContainsKeyThenInListMap!175 (_keys!6615 thiss!1504) (_values!4488 thiss!1504) (mask!10594 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) lt!122249)))

(declare-fun bs!8888 () Bool)

(assert (= bs!8888 d!60129))

(assert (=> bs!8888 m!261875))

(assert (=> bs!8888 m!261875))

(assert (=> bs!8888 m!261877))

(declare-fun m!262071 () Bool)

(assert (=> bs!8888 m!262071))

(assert (=> bs!8888 m!261965))

(assert (=> b!243131 d!60129))

(declare-fun b!243486 () Bool)

(declare-fun c!40654 () Bool)

(declare-fun lt!122258 () (_ BitVec 64))

(assert (=> b!243486 (= c!40654 (= lt!122258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158006 () SeekEntryResult!1037)

(declare-fun e!158005 () SeekEntryResult!1037)

(assert (=> b!243486 (= e!158006 e!158005)))

(declare-fun b!243487 () Bool)

(declare-fun lt!122256 () SeekEntryResult!1037)

(assert (=> b!243487 (= e!158006 (Found!1037 (index!6320 lt!122256)))))

(declare-fun b!243488 () Bool)

(declare-fun e!158007 () SeekEntryResult!1037)

(assert (=> b!243488 (= e!158007 e!158006)))

(assert (=> b!243488 (= lt!122258 (select (arr!5720 (_keys!6615 thiss!1504)) (index!6320 lt!122256)))))

(declare-fun c!40652 () Bool)

(assert (=> b!243488 (= c!40652 (= lt!122258 key!932))))

(declare-fun b!243489 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12047 (_ BitVec 32)) SeekEntryResult!1037)

(assert (=> b!243489 (= e!158005 (seekKeyOrZeroReturnVacant!0 (x!24279 lt!122256) (index!6320 lt!122256) (index!6320 lt!122256) key!932 (_keys!6615 thiss!1504) (mask!10594 thiss!1504)))))

(declare-fun b!243490 () Bool)

(assert (=> b!243490 (= e!158005 (MissingZero!1037 (index!6320 lt!122256)))))

(declare-fun d!60131 () Bool)

(declare-fun lt!122257 () SeekEntryResult!1037)

(assert (=> d!60131 (and (or ((_ is Undefined!1037) lt!122257) (not ((_ is Found!1037) lt!122257)) (and (bvsge (index!6319 lt!122257) #b00000000000000000000000000000000) (bvslt (index!6319 lt!122257) (size!6062 (_keys!6615 thiss!1504))))) (or ((_ is Undefined!1037) lt!122257) ((_ is Found!1037) lt!122257) (not ((_ is MissingZero!1037) lt!122257)) (and (bvsge (index!6318 lt!122257) #b00000000000000000000000000000000) (bvslt (index!6318 lt!122257) (size!6062 (_keys!6615 thiss!1504))))) (or ((_ is Undefined!1037) lt!122257) ((_ is Found!1037) lt!122257) ((_ is MissingZero!1037) lt!122257) (not ((_ is MissingVacant!1037) lt!122257)) (and (bvsge (index!6321 lt!122257) #b00000000000000000000000000000000) (bvslt (index!6321 lt!122257) (size!6062 (_keys!6615 thiss!1504))))) (or ((_ is Undefined!1037) lt!122257) (ite ((_ is Found!1037) lt!122257) (= (select (arr!5720 (_keys!6615 thiss!1504)) (index!6319 lt!122257)) key!932) (ite ((_ is MissingZero!1037) lt!122257) (= (select (arr!5720 (_keys!6615 thiss!1504)) (index!6318 lt!122257)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1037) lt!122257) (= (select (arr!5720 (_keys!6615 thiss!1504)) (index!6321 lt!122257)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60131 (= lt!122257 e!158007)))

(declare-fun c!40653 () Bool)

(assert (=> d!60131 (= c!40653 (and ((_ is Intermediate!1037) lt!122256) (undefined!1849 lt!122256)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12047 (_ BitVec 32)) SeekEntryResult!1037)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60131 (= lt!122256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10594 thiss!1504)) key!932 (_keys!6615 thiss!1504) (mask!10594 thiss!1504)))))

(assert (=> d!60131 (validMask!0 (mask!10594 thiss!1504))))

(assert (=> d!60131 (= (seekEntryOrOpen!0 key!932 (_keys!6615 thiss!1504) (mask!10594 thiss!1504)) lt!122257)))

(declare-fun b!243491 () Bool)

(assert (=> b!243491 (= e!158007 Undefined!1037)))

(assert (= (and d!60131 c!40653) b!243491))

(assert (= (and d!60131 (not c!40653)) b!243488))

(assert (= (and b!243488 c!40652) b!243487))

(assert (= (and b!243488 (not c!40652)) b!243486))

(assert (= (and b!243486 c!40654) b!243490))

(assert (= (and b!243486 (not c!40654)) b!243489))

(declare-fun m!262073 () Bool)

(assert (=> b!243488 m!262073))

(declare-fun m!262075 () Bool)

(assert (=> b!243489 m!262075))

(assert (=> d!60131 m!261965))

(declare-fun m!262077 () Bool)

(assert (=> d!60131 m!262077))

(declare-fun m!262079 () Bool)

(assert (=> d!60131 m!262079))

(assert (=> d!60131 m!262077))

(declare-fun m!262081 () Bool)

(assert (=> d!60131 m!262081))

(declare-fun m!262083 () Bool)

(assert (=> d!60131 m!262083))

(declare-fun m!262085 () Bool)

(assert (=> d!60131 m!262085))

(assert (=> b!243148 d!60131))

(declare-fun d!60133 () Bool)

(declare-fun lt!122259 () Bool)

(assert (=> d!60133 (= lt!122259 (select (content!161 Nil!3562) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158008 () Bool)

(assert (=> d!60133 (= lt!122259 e!158008)))

(declare-fun res!119344 () Bool)

(assert (=> d!60133 (=> (not res!119344) (not e!158008))))

(assert (=> d!60133 (= res!119344 ((_ is Cons!3561) Nil!3562))))

(assert (=> d!60133 (= (contains!1731 Nil!3562 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122259)))

(declare-fun b!243492 () Bool)

(declare-fun e!158009 () Bool)

(assert (=> b!243492 (= e!158008 e!158009)))

(declare-fun res!119343 () Bool)

(assert (=> b!243492 (=> res!119343 e!158009)))

(assert (=> b!243492 (= res!119343 (= (h!4218 Nil!3562) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243493 () Bool)

(assert (=> b!243493 (= e!158009 (contains!1731 (t!8562 Nil!3562) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60133 res!119344) b!243492))

(assert (= (and b!243492 (not res!119343)) b!243493))

(assert (=> d!60133 m!261981))

(declare-fun m!262087 () Bool)

(assert (=> d!60133 m!262087))

(declare-fun m!262089 () Bool)

(assert (=> b!243493 m!262089))

(assert (=> b!243146 d!60133))

(assert (=> b!243155 d!60115))

(declare-fun d!60135 () Bool)

(assert (=> d!60135 (= (inRange!0 (ite c!40589 (index!6318 lt!122113) (index!6321 lt!122113)) (mask!10594 thiss!1504)) (and (bvsge (ite c!40589 (index!6318 lt!122113) (index!6321 lt!122113)) #b00000000000000000000000000000000) (bvslt (ite c!40589 (index!6318 lt!122113) (index!6321 lt!122113)) (bvadd (mask!10594 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22650 d!60135))

(assert (=> b!243147 d!60117))

(declare-fun d!60137 () Bool)

(assert (=> d!60137 (= (array_inv!3759 (_keys!6615 thiss!1504)) (bvsge (size!6062 (_keys!6615 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243156 d!60137))

(declare-fun d!60139 () Bool)

(assert (=> d!60139 (= (array_inv!3760 (_values!4488 thiss!1504)) (bvsge (size!6061 (_values!4488 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243156 d!60139))

(declare-fun mapIsEmpty!10825 () Bool)

(declare-fun mapRes!10825 () Bool)

(assert (=> mapIsEmpty!10825 mapRes!10825))

(declare-fun b!243500 () Bool)

(declare-fun e!158015 () Bool)

(assert (=> b!243500 (= e!158015 tp_is_empty!6379)))

(declare-fun b!243501 () Bool)

(declare-fun e!158014 () Bool)

(assert (=> b!243501 (= e!158014 tp_is_empty!6379)))

(declare-fun mapNonEmpty!10825 () Bool)

(declare-fun tp!22786 () Bool)

(assert (=> mapNonEmpty!10825 (= mapRes!10825 (and tp!22786 e!158015))))

(declare-fun mapRest!10825 () (Array (_ BitVec 32) ValueCell!2846))

(declare-fun mapKey!10825 () (_ BitVec 32))

(declare-fun mapValue!10825 () ValueCell!2846)

(assert (=> mapNonEmpty!10825 (= mapRest!10816 (store mapRest!10825 mapKey!10825 mapValue!10825))))

(declare-fun condMapEmpty!10825 () Bool)

(declare-fun mapDefault!10825 () ValueCell!2846)

(assert (=> mapNonEmpty!10816 (= condMapEmpty!10825 (= mapRest!10816 ((as const (Array (_ BitVec 32) ValueCell!2846)) mapDefault!10825)))))

(assert (=> mapNonEmpty!10816 (= tp!22770 (and e!158014 mapRes!10825))))

(assert (= (and mapNonEmpty!10816 condMapEmpty!10825) mapIsEmpty!10825))

(assert (= (and mapNonEmpty!10816 (not condMapEmpty!10825)) mapNonEmpty!10825))

(assert (= (and mapNonEmpty!10825 ((_ is ValueCellFull!2846) mapValue!10825)) b!243500))

(assert (= (and mapNonEmpty!10816 ((_ is ValueCellFull!2846) mapDefault!10825)) b!243501))

(declare-fun m!262091 () Bool)

(assert (=> mapNonEmpty!10825 m!262091))

(declare-fun b_lambda!8031 () Bool)

(assert (= b_lambda!8029 (or (and b!243156 b_free!6517) b_lambda!8031)))

(check-sat (not d!60125) tp_is_empty!6379 (not b!243429) (not bm!22681) (not b!243382) (not d!60127) (not bm!22665) (not b!243441) (not b_next!6517) (not b!243427) (not d!60131) (not d!60113) (not mapNonEmpty!10825) (not b!243352) (not d!60109) (not b!243338) (not b!243360) (not b_lambda!8031) (not bm!22691) (not b!243340) (not b!243339) (not b!243330) (not bm!22683) (not b!243384) (not d!60123) (not b!243442) (not d!60133) (not b!243433) (not d!60117) (not d!60129) (not b!243371) (not b!243439) (not b!243430) (not b!243345) (not b!243358) (not bm!22684) (not b!243493) (not b!243346) (not d!60107) (not b!243489) (not b!243443) (not b!243372) (not bm!22686) b_and!13517 (not b!243374) (not bm!22692))
(check-sat b_and!13517 (not b_next!6517))
