; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21902 () Bool)

(assert start!21902)

(declare-fun b!221783 () Bool)

(declare-fun b_free!5965 () Bool)

(declare-fun b_next!5965 () Bool)

(assert (=> b!221783 (= b_free!5965 (not b_next!5965))))

(declare-fun tp!21037 () Bool)

(declare-fun b_and!12837 () Bool)

(assert (=> b!221783 (= tp!21037 b_and!12837)))

(declare-fun b!221762 () Bool)

(declare-fun e!144112 () Bool)

(declare-datatypes ((SeekEntryResult!826 0))(
  ( (MissingZero!826 (index!5474 (_ BitVec 32))) (Found!826 (index!5475 (_ BitVec 32))) (Intermediate!826 (undefined!1638 Bool) (index!5476 (_ BitVec 32)) (x!23029 (_ BitVec 32))) (Undefined!826) (MissingVacant!826 (index!5477 (_ BitVec 32))) )
))
(declare-fun lt!112341 () SeekEntryResult!826)

(get-info :version)

(assert (=> b!221762 (= e!144112 ((_ is Undefined!826) lt!112341))))

(declare-fun b!221763 () Bool)

(declare-datatypes ((Unit!6585 0))(
  ( (Unit!6586) )
))
(declare-fun e!144125 () Unit!6585)

(declare-fun Unit!6587 () Unit!6585)

(assert (=> b!221763 (= e!144125 Unit!6587)))

(declare-fun lt!112340 () Unit!6585)

(declare-datatypes ((V!7417 0))(
  ( (V!7418 (val!2958 Int)) )
))
(declare-datatypes ((ValueCell!2570 0))(
  ( (ValueCellFull!2570 (v!4972 V!7417)) (EmptyCell!2570) )
))
(declare-datatypes ((array!10889 0))(
  ( (array!10890 (arr!5163 (Array (_ BitVec 32) ValueCell!2570)) (size!5497 (_ BitVec 32))) )
))
(declare-datatypes ((array!10891 0))(
  ( (array!10892 (arr!5164 (Array (_ BitVec 32) (_ BitVec 64))) (size!5498 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3040 0))(
  ( (LongMapFixedSize!3041 (defaultEntry!4179 Int) (mask!9994 (_ BitVec 32)) (extraKeys!3916 (_ BitVec 32)) (zeroValue!4020 V!7417) (minValue!4020 V!7417) (_size!1569 (_ BitVec 32)) (_keys!6232 array!10891) (_values!4162 array!10889) (_vacant!1569 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3040)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!55 (array!10891 array!10889 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 64) (_ BitVec 32) Int) Unit!6585)

(assert (=> b!221763 (= lt!112340 (lemmaArrayContainsKeyThenInListMap!55 (_keys!6232 thiss!1504) (_values!4162 thiss!1504) (mask!9994 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4179 thiss!1504)))))

(assert (=> b!221763 false))

(declare-fun b!221764 () Bool)

(declare-fun e!144110 () Bool)

(declare-fun tp_is_empty!5827 () Bool)

(assert (=> b!221764 (= e!144110 tp_is_empty!5827)))

(declare-fun b!221765 () Bool)

(declare-fun res!108816 () Bool)

(assert (=> b!221765 (= res!108816 (= (select (arr!5164 (_keys!6232 thiss!1504)) (index!5477 lt!112341)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144117 () Bool)

(assert (=> b!221765 (=> (not res!108816) (not e!144117))))

(declare-fun b!221766 () Bool)

(declare-fun res!108813 () Bool)

(declare-fun e!144113 () Bool)

(assert (=> b!221766 (=> (not res!108813) (not e!144113))))

(declare-datatypes ((List!3274 0))(
  ( (Nil!3271) (Cons!3270 (h!3918 (_ BitVec 64)) (t!8224 List!3274)) )
))
(declare-fun contains!1490 (List!3274 (_ BitVec 64)) Bool)

(assert (=> b!221766 (= res!108813 (not (contains!1490 Nil!3271 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221767 () Bool)

(assert (=> b!221767 (= e!144113 false)))

(declare-fun lt!112339 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10891 (_ BitVec 32) List!3274) Bool)

(assert (=> b!221767 (= lt!112339 (arrayNoDuplicates!0 (_keys!6232 thiss!1504) #b00000000000000000000000000000000 Nil!3271))))

(declare-fun b!221768 () Bool)

(assert (=> b!221768 (= e!144112 e!144117)))

(declare-fun res!108805 () Bool)

(declare-fun call!20705 () Bool)

(assert (=> b!221768 (= res!108805 call!20705)))

(assert (=> b!221768 (=> (not res!108805) (not e!144117))))

(declare-fun b!221769 () Bool)

(declare-fun res!108808 () Bool)

(assert (=> b!221769 (=> (not res!108808) (not e!144113))))

(declare-fun noDuplicate!65 (List!3274) Bool)

(assert (=> b!221769 (= res!108808 (noDuplicate!65 Nil!3271))))

(declare-fun b!221770 () Bool)

(declare-fun c!36860 () Bool)

(assert (=> b!221770 (= c!36860 ((_ is MissingVacant!826) lt!112341))))

(declare-fun e!144126 () Bool)

(assert (=> b!221770 (= e!144126 e!144112)))

(declare-fun b!221771 () Bool)

(declare-fun e!144123 () Bool)

(declare-fun e!144120 () Bool)

(assert (=> b!221771 (= e!144123 e!144120)))

(declare-fun res!108814 () Bool)

(assert (=> b!221771 (=> (not res!108814) (not e!144120))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221771 (= res!108814 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!221772 () Bool)

(declare-fun e!144114 () Unit!6585)

(declare-fun Unit!6588 () Unit!6585)

(assert (=> b!221772 (= e!144114 Unit!6588)))

(declare-fun lt!112343 () Unit!6585)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!213 (array!10891 array!10889 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 64) Int) Unit!6585)

(assert (=> b!221772 (= lt!112343 (lemmaInListMapThenSeekEntryOrOpenFindsIt!213 (_keys!6232 thiss!1504) (_values!4162 thiss!1504) (mask!9994 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) key!932 (defaultEntry!4179 thiss!1504)))))

(assert (=> b!221772 false))

(declare-fun res!108804 () Bool)

(declare-fun e!144118 () Bool)

(assert (=> start!21902 (=> (not res!108804) (not e!144118))))

(declare-fun valid!1240 (LongMapFixedSize!3040) Bool)

(assert (=> start!21902 (= res!108804 (valid!1240 thiss!1504))))

(assert (=> start!21902 e!144118))

(declare-fun e!144111 () Bool)

(assert (=> start!21902 e!144111))

(assert (=> start!21902 true))

(declare-fun b!221761 () Bool)

(declare-fun lt!112345 () Unit!6585)

(assert (=> b!221761 (= e!144114 lt!112345)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!213 (array!10891 array!10889 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 64) Int) Unit!6585)

(assert (=> b!221761 (= lt!112345 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!213 (_keys!6232 thiss!1504) (_values!4162 thiss!1504) (mask!9994 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) key!932 (defaultEntry!4179 thiss!1504)))))

(declare-fun c!36859 () Bool)

(assert (=> b!221761 (= c!36859 ((_ is MissingZero!826) lt!112341))))

(assert (=> b!221761 e!144126))

(declare-fun mapIsEmpty!9910 () Bool)

(declare-fun mapRes!9910 () Bool)

(assert (=> mapIsEmpty!9910 mapRes!9910))

(declare-fun bm!20702 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20702 (= call!20705 (inRange!0 (ite c!36859 (index!5474 lt!112341) (index!5477 lt!112341)) (mask!9994 thiss!1504)))))

(declare-fun b!221773 () Bool)

(declare-fun call!20706 () Bool)

(assert (=> b!221773 (= e!144117 (not call!20706))))

(declare-fun mapNonEmpty!9910 () Bool)

(declare-fun tp!21036 () Bool)

(declare-fun e!144115 () Bool)

(assert (=> mapNonEmpty!9910 (= mapRes!9910 (and tp!21036 e!144115))))

(declare-fun mapKey!9910 () (_ BitVec 32))

(declare-fun mapValue!9910 () ValueCell!2570)

(declare-fun mapRest!9910 () (Array (_ BitVec 32) ValueCell!2570))

(assert (=> mapNonEmpty!9910 (= (arr!5163 (_values!4162 thiss!1504)) (store mapRest!9910 mapKey!9910 mapValue!9910))))

(declare-fun b!221774 () Bool)

(declare-fun e!144116 () Bool)

(assert (=> b!221774 (= e!144118 e!144116)))

(declare-fun res!108807 () Bool)

(assert (=> b!221774 (=> (not res!108807) (not e!144116))))

(assert (=> b!221774 (= res!108807 (or (= lt!112341 (MissingZero!826 index!297)) (= lt!112341 (MissingVacant!826 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10891 (_ BitVec 32)) SeekEntryResult!826)

(assert (=> b!221774 (= lt!112341 (seekEntryOrOpen!0 key!932 (_keys!6232 thiss!1504) (mask!9994 thiss!1504)))))

(declare-fun b!221775 () Bool)

(declare-fun Unit!6589 () Unit!6585)

(assert (=> b!221775 (= e!144125 Unit!6589)))

(declare-fun bm!20703 () Bool)

(declare-fun arrayContainsKey!0 (array!10891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20703 (= call!20706 (arrayContainsKey!0 (_keys!6232 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221776 () Bool)

(declare-fun res!108818 () Bool)

(assert (=> b!221776 (=> (not res!108818) (not e!144113))))

(assert (=> b!221776 (= res!108818 (not (contains!1490 Nil!3271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221777 () Bool)

(declare-fun res!108815 () Bool)

(declare-fun e!144109 () Bool)

(assert (=> b!221777 (=> (not res!108815) (not e!144109))))

(assert (=> b!221777 (= res!108815 call!20705)))

(assert (=> b!221777 (= e!144126 e!144109)))

(declare-fun b!221778 () Bool)

(assert (=> b!221778 (= e!144115 tp_is_empty!5827)))

(declare-fun b!221779 () Bool)

(declare-fun e!144124 () Bool)

(assert (=> b!221779 (= e!144124 e!144113)))

(declare-fun res!108811 () Bool)

(assert (=> b!221779 (=> (not res!108811) (not e!144113))))

(assert (=> b!221779 (= res!108811 (and (bvslt (size!5498 (_keys!6232 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5498 (_keys!6232 thiss!1504)))))))

(declare-fun lt!112342 () Unit!6585)

(assert (=> b!221779 (= lt!112342 e!144125)))

(declare-fun c!36862 () Bool)

(assert (=> b!221779 (= c!36862 (arrayContainsKey!0 (_keys!6232 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221780 () Bool)

(declare-fun res!108810 () Bool)

(assert (=> b!221780 (=> (not res!108810) (not e!144109))))

(assert (=> b!221780 (= res!108810 (= (select (arr!5164 (_keys!6232 thiss!1504)) (index!5474 lt!112341)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221781 () Bool)

(declare-fun res!108809 () Bool)

(assert (=> b!221781 (=> (not res!108809) (not e!144118))))

(assert (=> b!221781 (= res!108809 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221782 () Bool)

(declare-fun res!108817 () Bool)

(assert (=> b!221782 (=> (not res!108817) (not e!144113))))

(assert (=> b!221782 (= res!108817 e!144123)))

(declare-fun res!108806 () Bool)

(assert (=> b!221782 (=> res!108806 e!144123)))

(declare-fun e!144122 () Bool)

(assert (=> b!221782 (= res!108806 e!144122)))

(declare-fun res!108803 () Bool)

(assert (=> b!221782 (=> (not res!108803) (not e!144122))))

(assert (=> b!221782 (= res!108803 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun e!144119 () Bool)

(declare-fun array_inv!3405 (array!10891) Bool)

(declare-fun array_inv!3406 (array!10889) Bool)

(assert (=> b!221783 (= e!144111 (and tp!21037 tp_is_empty!5827 (array_inv!3405 (_keys!6232 thiss!1504)) (array_inv!3406 (_values!4162 thiss!1504)) e!144119))))

(declare-fun b!221784 () Bool)

(assert (=> b!221784 (= e!144122 (contains!1490 Nil!3271 key!932))))

(declare-fun b!221785 () Bool)

(assert (=> b!221785 (= e!144119 (and e!144110 mapRes!9910))))

(declare-fun condMapEmpty!9910 () Bool)

(declare-fun mapDefault!9910 () ValueCell!2570)

(assert (=> b!221785 (= condMapEmpty!9910 (= (arr!5163 (_values!4162 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2570)) mapDefault!9910)))))

(declare-fun b!221786 () Bool)

(assert (=> b!221786 (= e!144109 (not call!20706))))

(declare-fun b!221787 () Bool)

(assert (=> b!221787 (= e!144116 e!144124)))

(declare-fun res!108812 () Bool)

(assert (=> b!221787 (=> (not res!108812) (not e!144124))))

(assert (=> b!221787 (= res!108812 (inRange!0 index!297 (mask!9994 thiss!1504)))))

(declare-fun lt!112344 () Unit!6585)

(assert (=> b!221787 (= lt!112344 e!144114)))

(declare-fun c!36861 () Bool)

(declare-datatypes ((tuple2!4354 0))(
  ( (tuple2!4355 (_1!2188 (_ BitVec 64)) (_2!2188 V!7417)) )
))
(declare-datatypes ((List!3275 0))(
  ( (Nil!3272) (Cons!3271 (h!3919 tuple2!4354) (t!8225 List!3275)) )
))
(declare-datatypes ((ListLongMap!3257 0))(
  ( (ListLongMap!3258 (toList!1644 List!3275)) )
))
(declare-fun contains!1491 (ListLongMap!3257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1153 (array!10891 array!10889 (_ BitVec 32) (_ BitVec 32) V!7417 V!7417 (_ BitVec 32) Int) ListLongMap!3257)

(assert (=> b!221787 (= c!36861 (contains!1491 (getCurrentListMap!1153 (_keys!6232 thiss!1504) (_values!4162 thiss!1504) (mask!9994 thiss!1504) (extraKeys!3916 thiss!1504) (zeroValue!4020 thiss!1504) (minValue!4020 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4179 thiss!1504)) key!932))))

(declare-fun b!221788 () Bool)

(assert (=> b!221788 (= e!144120 (not (contains!1490 Nil!3271 key!932)))))

(assert (= (and start!21902 res!108804) b!221781))

(assert (= (and b!221781 res!108809) b!221774))

(assert (= (and b!221774 res!108807) b!221787))

(assert (= (and b!221787 c!36861) b!221772))

(assert (= (and b!221787 (not c!36861)) b!221761))

(assert (= (and b!221761 c!36859) b!221777))

(assert (= (and b!221761 (not c!36859)) b!221770))

(assert (= (and b!221777 res!108815) b!221780))

(assert (= (and b!221780 res!108810) b!221786))

(assert (= (and b!221770 c!36860) b!221768))

(assert (= (and b!221770 (not c!36860)) b!221762))

(assert (= (and b!221768 res!108805) b!221765))

(assert (= (and b!221765 res!108816) b!221773))

(assert (= (or b!221777 b!221768) bm!20702))

(assert (= (or b!221786 b!221773) bm!20703))

(assert (= (and b!221787 res!108812) b!221779))

(assert (= (and b!221779 c!36862) b!221763))

(assert (= (and b!221779 (not c!36862)) b!221775))

(assert (= (and b!221779 res!108811) b!221769))

(assert (= (and b!221769 res!108808) b!221776))

(assert (= (and b!221776 res!108818) b!221766))

(assert (= (and b!221766 res!108813) b!221782))

(assert (= (and b!221782 res!108803) b!221784))

(assert (= (and b!221782 (not res!108806)) b!221771))

(assert (= (and b!221771 res!108814) b!221788))

(assert (= (and b!221782 res!108817) b!221767))

(assert (= (and b!221785 condMapEmpty!9910) mapIsEmpty!9910))

(assert (= (and b!221785 (not condMapEmpty!9910)) mapNonEmpty!9910))

(assert (= (and mapNonEmpty!9910 ((_ is ValueCellFull!2570) mapValue!9910)) b!221778))

(assert (= (and b!221785 ((_ is ValueCellFull!2570) mapDefault!9910)) b!221764))

(assert (= b!221783 b!221785))

(assert (= start!21902 b!221783))

(declare-fun m!245689 () Bool)

(assert (=> mapNonEmpty!9910 m!245689))

(declare-fun m!245691 () Bool)

(assert (=> b!221784 m!245691))

(declare-fun m!245693 () Bool)

(assert (=> bm!20702 m!245693))

(declare-fun m!245695 () Bool)

(assert (=> bm!20703 m!245695))

(declare-fun m!245697 () Bool)

(assert (=> b!221780 m!245697))

(declare-fun m!245699 () Bool)

(assert (=> b!221776 m!245699))

(assert (=> b!221788 m!245691))

(declare-fun m!245701 () Bool)

(assert (=> b!221765 m!245701))

(declare-fun m!245703 () Bool)

(assert (=> b!221783 m!245703))

(declare-fun m!245705 () Bool)

(assert (=> b!221783 m!245705))

(declare-fun m!245707 () Bool)

(assert (=> b!221766 m!245707))

(declare-fun m!245709 () Bool)

(assert (=> start!21902 m!245709))

(declare-fun m!245711 () Bool)

(assert (=> b!221787 m!245711))

(declare-fun m!245713 () Bool)

(assert (=> b!221787 m!245713))

(assert (=> b!221787 m!245713))

(declare-fun m!245715 () Bool)

(assert (=> b!221787 m!245715))

(declare-fun m!245717 () Bool)

(assert (=> b!221761 m!245717))

(declare-fun m!245719 () Bool)

(assert (=> b!221763 m!245719))

(declare-fun m!245721 () Bool)

(assert (=> b!221772 m!245721))

(declare-fun m!245723 () Bool)

(assert (=> b!221767 m!245723))

(declare-fun m!245725 () Bool)

(assert (=> b!221769 m!245725))

(assert (=> b!221779 m!245695))

(declare-fun m!245727 () Bool)

(assert (=> b!221774 m!245727))

(check-sat (not bm!20702) (not b!221766) (not b!221788) (not b!221784) (not b!221763) (not start!21902) (not b!221774) (not b!221772) (not mapNonEmpty!9910) (not b!221787) (not b!221769) (not b!221761) b_and!12837 (not b!221776) (not bm!20703) (not b_next!5965) (not b!221767) (not b!221783) tp_is_empty!5827 (not b!221779))
(check-sat b_and!12837 (not b_next!5965))
