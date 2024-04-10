; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21894 () Bool)

(assert start!21894)

(declare-fun b!221746 () Bool)

(declare-fun b_free!5961 () Bool)

(declare-fun b_next!5961 () Bool)

(assert (=> b!221746 (= b_free!5961 (not b_next!5961))))

(declare-fun tp!21025 () Bool)

(declare-fun b_and!12859 () Bool)

(assert (=> b!221746 (= tp!21025 b_and!12859)))

(declare-fun b!221740 () Bool)

(declare-fun res!108815 () Bool)

(declare-fun e!144112 () Bool)

(assert (=> b!221740 (=> (not res!108815) (not e!144112))))

(declare-datatypes ((List!3290 0))(
  ( (Nil!3287) (Cons!3286 (h!3934 (_ BitVec 64)) (t!8249 List!3290)) )
))
(declare-fun contains!1510 (List!3290 (_ BitVec 64)) Bool)

(assert (=> b!221740 (= res!108815 (not (contains!1510 Nil!3287 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221741 () Bool)

(declare-fun e!144115 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!221741 (= e!144115 (contains!1510 Nil!3287 key!932))))

(declare-fun b!221742 () Bool)

(declare-fun e!144105 () Bool)

(assert (=> b!221742 (= e!144105 e!144112)))

(declare-fun res!108804 () Bool)

(assert (=> b!221742 (=> (not res!108804) (not e!144112))))

(declare-datatypes ((V!7411 0))(
  ( (V!7412 (val!2956 Int)) )
))
(declare-datatypes ((ValueCell!2568 0))(
  ( (ValueCellFull!2568 (v!4976 V!7411)) (EmptyCell!2568) )
))
(declare-datatypes ((array!10889 0))(
  ( (array!10890 (arr!5164 (Array (_ BitVec 32) ValueCell!2568)) (size!5497 (_ BitVec 32))) )
))
(declare-datatypes ((array!10891 0))(
  ( (array!10892 (arr!5165 (Array (_ BitVec 32) (_ BitVec 64))) (size!5498 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3036 0))(
  ( (LongMapFixedSize!3037 (defaultEntry!4177 Int) (mask!9991 (_ BitVec 32)) (extraKeys!3914 (_ BitVec 32)) (zeroValue!4018 V!7411) (minValue!4018 V!7411) (_size!1567 (_ BitVec 32)) (_keys!6231 array!10891) (_values!4160 array!10889) (_vacant!1567 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3036)

(assert (=> b!221742 (= res!108804 (and (bvslt (size!5498 (_keys!6231 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5498 (_keys!6231 thiss!1504)))))))

(declare-datatypes ((Unit!6628 0))(
  ( (Unit!6629) )
))
(declare-fun lt!112484 () Unit!6628)

(declare-fun e!144110 () Unit!6628)

(assert (=> b!221742 (= lt!112484 e!144110)))

(declare-fun c!36862 () Bool)

(declare-fun arrayContainsKey!0 (array!10891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221742 (= c!36862 (arrayContainsKey!0 (_keys!6231 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221743 () Bool)

(declare-fun res!108817 () Bool)

(assert (=> b!221743 (=> (not res!108817) (not e!144112))))

(declare-fun noDuplicate!64 (List!3290) Bool)

(assert (=> b!221743 (= res!108817 (noDuplicate!64 Nil!3287))))

(declare-fun b!221744 () Bool)

(declare-fun e!144114 () Unit!6628)

(declare-fun Unit!6630 () Unit!6628)

(assert (=> b!221744 (= e!144114 Unit!6630)))

(declare-fun lt!112481 () Unit!6628)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!218 (array!10891 array!10889 (_ BitVec 32) (_ BitVec 32) V!7411 V!7411 (_ BitVec 64) Int) Unit!6628)

(assert (=> b!221744 (= lt!112481 (lemmaInListMapThenSeekEntryOrOpenFindsIt!218 (_keys!6231 thiss!1504) (_values!4160 thiss!1504) (mask!9991 thiss!1504) (extraKeys!3914 thiss!1504) (zeroValue!4018 thiss!1504) (minValue!4018 thiss!1504) key!932 (defaultEntry!4177 thiss!1504)))))

(assert (=> b!221744 false))

(declare-fun mapIsEmpty!9904 () Bool)

(declare-fun mapRes!9904 () Bool)

(assert (=> mapIsEmpty!9904 mapRes!9904))

(declare-fun b!221745 () Bool)

(declare-fun e!144108 () Bool)

(declare-fun e!144106 () Bool)

(assert (=> b!221745 (= e!144108 (and e!144106 mapRes!9904))))

(declare-fun condMapEmpty!9904 () Bool)

(declare-fun mapDefault!9904 () ValueCell!2568)

(assert (=> b!221745 (= condMapEmpty!9904 (= (arr!5164 (_values!4160 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2568)) mapDefault!9904)))))

(declare-fun e!144102 () Bool)

(declare-fun tp_is_empty!5823 () Bool)

(declare-fun array_inv!3419 (array!10891) Bool)

(declare-fun array_inv!3420 (array!10889) Bool)

(assert (=> b!221746 (= e!144102 (and tp!21025 tp_is_empty!5823 (array_inv!3419 (_keys!6231 thiss!1504)) (array_inv!3420 (_values!4160 thiss!1504)) e!144108))))

(declare-fun b!221747 () Bool)

(declare-fun e!144113 () Bool)

(declare-fun call!20718 () Bool)

(assert (=> b!221747 (= e!144113 (not call!20718))))

(declare-fun b!221748 () Bool)

(declare-fun res!108803 () Bool)

(declare-datatypes ((SeekEntryResult!829 0))(
  ( (MissingZero!829 (index!5486 (_ BitVec 32))) (Found!829 (index!5487 (_ BitVec 32))) (Intermediate!829 (undefined!1641 Bool) (index!5488 (_ BitVec 32)) (x!23025 (_ BitVec 32))) (Undefined!829) (MissingVacant!829 (index!5489 (_ BitVec 32))) )
))
(declare-fun lt!112480 () SeekEntryResult!829)

(assert (=> b!221748 (= res!108803 (= (select (arr!5165 (_keys!6231 thiss!1504)) (index!5489 lt!112480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221748 (=> (not res!108803) (not e!144113))))

(declare-fun b!221749 () Bool)

(declare-fun e!144111 () Bool)

(declare-fun e!144104 () Bool)

(assert (=> b!221749 (= e!144111 e!144104)))

(declare-fun res!108814 () Bool)

(assert (=> b!221749 (=> (not res!108814) (not e!144104))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221749 (= res!108814 (or (= lt!112480 (MissingZero!829 index!297)) (= lt!112480 (MissingVacant!829 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10891 (_ BitVec 32)) SeekEntryResult!829)

(assert (=> b!221749 (= lt!112480 (seekEntryOrOpen!0 key!932 (_keys!6231 thiss!1504) (mask!9991 thiss!1504)))))

(declare-fun b!221750 () Bool)

(declare-fun lt!112483 () Unit!6628)

(assert (=> b!221750 (= e!144114 lt!112483)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!231 (array!10891 array!10889 (_ BitVec 32) (_ BitVec 32) V!7411 V!7411 (_ BitVec 64) Int) Unit!6628)

(assert (=> b!221750 (= lt!112483 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!231 (_keys!6231 thiss!1504) (_values!4160 thiss!1504) (mask!9991 thiss!1504) (extraKeys!3914 thiss!1504) (zeroValue!4018 thiss!1504) (minValue!4018 thiss!1504) key!932 (defaultEntry!4177 thiss!1504)))))

(declare-fun c!36861 () Bool)

(get-info :version)

(assert (=> b!221750 (= c!36861 ((_ is MissingZero!829) lt!112480))))

(declare-fun e!144107 () Bool)

(assert (=> b!221750 e!144107))

(declare-fun b!221751 () Bool)

(declare-fun e!144118 () Bool)

(declare-fun e!144117 () Bool)

(assert (=> b!221751 (= e!144118 e!144117)))

(declare-fun res!108808 () Bool)

(assert (=> b!221751 (=> (not res!108808) (not e!144117))))

(assert (=> b!221751 (= res!108808 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!221752 () Bool)

(declare-fun e!144103 () Bool)

(assert (=> b!221752 (= e!144103 (not call!20718))))

(declare-fun bm!20714 () Bool)

(declare-fun call!20717 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20714 (= call!20717 (inRange!0 (ite c!36861 (index!5486 lt!112480) (index!5489 lt!112480)) (mask!9991 thiss!1504)))))

(declare-fun b!221753 () Bool)

(declare-fun res!108813 () Bool)

(assert (=> b!221753 (=> (not res!108813) (not e!144112))))

(assert (=> b!221753 (= res!108813 e!144118)))

(declare-fun res!108806 () Bool)

(assert (=> b!221753 (=> res!108806 e!144118)))

(assert (=> b!221753 (= res!108806 e!144115)))

(declare-fun res!108810 () Bool)

(assert (=> b!221753 (=> (not res!108810) (not e!144115))))

(assert (=> b!221753 (= res!108810 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!221754 () Bool)

(declare-fun e!144119 () Bool)

(assert (=> b!221754 (= e!144119 ((_ is Undefined!829) lt!112480))))

(declare-fun b!221755 () Bool)

(declare-fun Unit!6631 () Unit!6628)

(assert (=> b!221755 (= e!144110 Unit!6631)))

(declare-fun lt!112482 () Unit!6628)

(declare-fun lemmaArrayContainsKeyThenInListMap!53 (array!10891 array!10889 (_ BitVec 32) (_ BitVec 32) V!7411 V!7411 (_ BitVec 64) (_ BitVec 32) Int) Unit!6628)

(assert (=> b!221755 (= lt!112482 (lemmaArrayContainsKeyThenInListMap!53 (_keys!6231 thiss!1504) (_values!4160 thiss!1504) (mask!9991 thiss!1504) (extraKeys!3914 thiss!1504) (zeroValue!4018 thiss!1504) (minValue!4018 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4177 thiss!1504)))))

(assert (=> b!221755 false))

(declare-fun b!221756 () Bool)

(declare-fun e!144109 () Bool)

(assert (=> b!221756 (= e!144109 tp_is_empty!5823)))

(declare-fun b!221757 () Bool)

(assert (=> b!221757 (= e!144119 e!144113)))

(declare-fun res!108811 () Bool)

(assert (=> b!221757 (= res!108811 call!20717)))

(assert (=> b!221757 (=> (not res!108811) (not e!144113))))

(declare-fun mapNonEmpty!9904 () Bool)

(declare-fun tp!21024 () Bool)

(assert (=> mapNonEmpty!9904 (= mapRes!9904 (and tp!21024 e!144109))))

(declare-fun mapValue!9904 () ValueCell!2568)

(declare-fun mapKey!9904 () (_ BitVec 32))

(declare-fun mapRest!9904 () (Array (_ BitVec 32) ValueCell!2568))

(assert (=> mapNonEmpty!9904 (= (arr!5164 (_values!4160 thiss!1504)) (store mapRest!9904 mapKey!9904 mapValue!9904))))

(declare-fun b!221758 () Bool)

(assert (=> b!221758 (= e!144104 e!144105)))

(declare-fun res!108807 () Bool)

(assert (=> b!221758 (=> (not res!108807) (not e!144105))))

(assert (=> b!221758 (= res!108807 (inRange!0 index!297 (mask!9991 thiss!1504)))))

(declare-fun lt!112479 () Unit!6628)

(assert (=> b!221758 (= lt!112479 e!144114)))

(declare-fun c!36863 () Bool)

(declare-datatypes ((tuple2!4388 0))(
  ( (tuple2!4389 (_1!2205 (_ BitVec 64)) (_2!2205 V!7411)) )
))
(declare-datatypes ((List!3291 0))(
  ( (Nil!3288) (Cons!3287 (h!3935 tuple2!4388) (t!8250 List!3291)) )
))
(declare-datatypes ((ListLongMap!3301 0))(
  ( (ListLongMap!3302 (toList!1666 List!3291)) )
))
(declare-fun contains!1511 (ListLongMap!3301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1194 (array!10891 array!10889 (_ BitVec 32) (_ BitVec 32) V!7411 V!7411 (_ BitVec 32) Int) ListLongMap!3301)

(assert (=> b!221758 (= c!36863 (contains!1511 (getCurrentListMap!1194 (_keys!6231 thiss!1504) (_values!4160 thiss!1504) (mask!9991 thiss!1504) (extraKeys!3914 thiss!1504) (zeroValue!4018 thiss!1504) (minValue!4018 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4177 thiss!1504)) key!932))))

(declare-fun b!221759 () Bool)

(declare-fun res!108805 () Bool)

(assert (=> b!221759 (=> (not res!108805) (not e!144112))))

(assert (=> b!221759 (= res!108805 (not (contains!1510 Nil!3287 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221760 () Bool)

(declare-fun res!108816 () Bool)

(assert (=> b!221760 (=> (not res!108816) (not e!144103))))

(assert (=> b!221760 (= res!108816 call!20717)))

(assert (=> b!221760 (= e!144107 e!144103)))

(declare-fun b!221761 () Bool)

(assert (=> b!221761 (= e!144117 (not (contains!1510 Nil!3287 key!932)))))

(declare-fun b!221762 () Bool)

(assert (=> b!221762 (= e!144106 tp_is_empty!5823)))

(declare-fun res!108802 () Bool)

(assert (=> start!21894 (=> (not res!108802) (not e!144111))))

(declare-fun valid!1226 (LongMapFixedSize!3036) Bool)

(assert (=> start!21894 (= res!108802 (valid!1226 thiss!1504))))

(assert (=> start!21894 e!144111))

(assert (=> start!21894 e!144102))

(assert (=> start!21894 true))

(declare-fun b!221763 () Bool)

(declare-fun Unit!6632 () Unit!6628)

(assert (=> b!221763 (= e!144110 Unit!6632)))

(declare-fun b!221764 () Bool)

(declare-fun c!36864 () Bool)

(assert (=> b!221764 (= c!36864 ((_ is MissingVacant!829) lt!112480))))

(assert (=> b!221764 (= e!144107 e!144119)))

(declare-fun b!221765 () Bool)

(declare-fun res!108809 () Bool)

(assert (=> b!221765 (=> (not res!108809) (not e!144111))))

(assert (=> b!221765 (= res!108809 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221766 () Bool)

(assert (=> b!221766 (= e!144112 false)))

(declare-fun lt!112478 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10891 (_ BitVec 32) List!3290) Bool)

(assert (=> b!221766 (= lt!112478 (arrayNoDuplicates!0 (_keys!6231 thiss!1504) #b00000000000000000000000000000000 Nil!3287))))

(declare-fun b!221767 () Bool)

(declare-fun res!108812 () Bool)

(assert (=> b!221767 (=> (not res!108812) (not e!144103))))

(assert (=> b!221767 (= res!108812 (= (select (arr!5165 (_keys!6231 thiss!1504)) (index!5486 lt!112480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20715 () Bool)

(assert (=> bm!20715 (= call!20718 (arrayContainsKey!0 (_keys!6231 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!21894 res!108802) b!221765))

(assert (= (and b!221765 res!108809) b!221749))

(assert (= (and b!221749 res!108814) b!221758))

(assert (= (and b!221758 c!36863) b!221744))

(assert (= (and b!221758 (not c!36863)) b!221750))

(assert (= (and b!221750 c!36861) b!221760))

(assert (= (and b!221750 (not c!36861)) b!221764))

(assert (= (and b!221760 res!108816) b!221767))

(assert (= (and b!221767 res!108812) b!221752))

(assert (= (and b!221764 c!36864) b!221757))

(assert (= (and b!221764 (not c!36864)) b!221754))

(assert (= (and b!221757 res!108811) b!221748))

(assert (= (and b!221748 res!108803) b!221747))

(assert (= (or b!221760 b!221757) bm!20714))

(assert (= (or b!221752 b!221747) bm!20715))

(assert (= (and b!221758 res!108807) b!221742))

(assert (= (and b!221742 c!36862) b!221755))

(assert (= (and b!221742 (not c!36862)) b!221763))

(assert (= (and b!221742 res!108804) b!221743))

(assert (= (and b!221743 res!108817) b!221740))

(assert (= (and b!221740 res!108815) b!221759))

(assert (= (and b!221759 res!108805) b!221753))

(assert (= (and b!221753 res!108810) b!221741))

(assert (= (and b!221753 (not res!108806)) b!221751))

(assert (= (and b!221751 res!108808) b!221761))

(assert (= (and b!221753 res!108813) b!221766))

(assert (= (and b!221745 condMapEmpty!9904) mapIsEmpty!9904))

(assert (= (and b!221745 (not condMapEmpty!9904)) mapNonEmpty!9904))

(assert (= (and mapNonEmpty!9904 ((_ is ValueCellFull!2568) mapValue!9904)) b!221756))

(assert (= (and b!221745 ((_ is ValueCellFull!2568) mapDefault!9904)) b!221762))

(assert (= b!221746 b!221745))

(assert (= start!21894 b!221746))

(declare-fun m!246225 () Bool)

(assert (=> b!221761 m!246225))

(declare-fun m!246227 () Bool)

(assert (=> b!221748 m!246227))

(declare-fun m!246229 () Bool)

(assert (=> b!221758 m!246229))

(declare-fun m!246231 () Bool)

(assert (=> b!221758 m!246231))

(assert (=> b!221758 m!246231))

(declare-fun m!246233 () Bool)

(assert (=> b!221758 m!246233))

(declare-fun m!246235 () Bool)

(assert (=> b!221750 m!246235))

(declare-fun m!246237 () Bool)

(assert (=> start!21894 m!246237))

(declare-fun m!246239 () Bool)

(assert (=> bm!20715 m!246239))

(declare-fun m!246241 () Bool)

(assert (=> b!221746 m!246241))

(declare-fun m!246243 () Bool)

(assert (=> b!221746 m!246243))

(declare-fun m!246245 () Bool)

(assert (=> b!221740 m!246245))

(declare-fun m!246247 () Bool)

(assert (=> b!221767 m!246247))

(declare-fun m!246249 () Bool)

(assert (=> b!221743 m!246249))

(declare-fun m!246251 () Bool)

(assert (=> mapNonEmpty!9904 m!246251))

(assert (=> b!221742 m!246239))

(declare-fun m!246253 () Bool)

(assert (=> b!221766 m!246253))

(declare-fun m!246255 () Bool)

(assert (=> bm!20714 m!246255))

(assert (=> b!221741 m!246225))

(declare-fun m!246257 () Bool)

(assert (=> b!221749 m!246257))

(declare-fun m!246259 () Bool)

(assert (=> b!221755 m!246259))

(declare-fun m!246261 () Bool)

(assert (=> b!221744 m!246261))

(declare-fun m!246263 () Bool)

(assert (=> b!221759 m!246263))

(check-sat (not start!21894) (not b!221750) (not b!221743) tp_is_empty!5823 (not b!221742) b_and!12859 (not b!221744) (not bm!20715) (not b!221749) (not mapNonEmpty!9904) (not b!221759) (not b_next!5961) (not b!221758) (not b!221746) (not b!221755) (not b!221761) (not bm!20714) (not b!221740) (not b!221741) (not b!221766))
(check-sat b_and!12859 (not b_next!5961))
