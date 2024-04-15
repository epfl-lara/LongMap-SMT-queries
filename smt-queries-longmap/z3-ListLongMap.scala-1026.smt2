; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21842 () Bool)

(assert start!21842)

(declare-fun b!219736 () Bool)

(declare-fun b_free!5905 () Bool)

(declare-fun b_next!5905 () Bool)

(assert (=> b!219736 (= b_free!5905 (not b_next!5905))))

(declare-fun tp!20856 () Bool)

(declare-fun b_and!12777 () Bool)

(assert (=> b!219736 (= tp!20856 b_and!12777)))

(declare-fun b!219715 () Bool)

(declare-fun e!142893 () Bool)

(declare-fun call!20525 () Bool)

(assert (=> b!219715 (= e!142893 (not call!20525))))

(declare-fun b!219716 () Bool)

(declare-datatypes ((Unit!6507 0))(
  ( (Unit!6508) )
))
(declare-fun e!142890 () Unit!6507)

(declare-fun Unit!6509 () Unit!6507)

(assert (=> b!219716 (= e!142890 Unit!6509)))

(declare-fun lt!111868 () Unit!6507)

(declare-datatypes ((V!7337 0))(
  ( (V!7338 (val!2928 Int)) )
))
(declare-datatypes ((ValueCell!2540 0))(
  ( (ValueCellFull!2540 (v!4942 V!7337)) (EmptyCell!2540) )
))
(declare-datatypes ((array!10769 0))(
  ( (array!10770 (arr!5103 (Array (_ BitVec 32) ValueCell!2540)) (size!5437 (_ BitVec 32))) )
))
(declare-datatypes ((array!10771 0))(
  ( (array!10772 (arr!5104 (Array (_ BitVec 32) (_ BitVec 64))) (size!5438 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2980 0))(
  ( (LongMapFixedSize!2981 (defaultEntry!4149 Int) (mask!9944 (_ BitVec 32)) (extraKeys!3886 (_ BitVec 32)) (zeroValue!3990 V!7337) (minValue!3990 V!7337) (_size!1539 (_ BitVec 32)) (_keys!6202 array!10771) (_values!4132 array!10769) (_vacant!1539 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2980)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!195 (array!10771 array!10769 (_ BitVec 32) (_ BitVec 32) V!7337 V!7337 (_ BitVec 64) Int) Unit!6507)

(assert (=> b!219716 (= lt!111868 (lemmaInListMapThenSeekEntryOrOpenFindsIt!195 (_keys!6202 thiss!1504) (_values!4132 thiss!1504) (mask!9944 thiss!1504) (extraKeys!3886 thiss!1504) (zeroValue!3990 thiss!1504) (minValue!3990 thiss!1504) key!932 (defaultEntry!4149 thiss!1504)))))

(assert (=> b!219716 false))

(declare-fun b!219717 () Bool)

(declare-fun res!107688 () Bool)

(declare-fun e!142894 () Bool)

(assert (=> b!219717 (=> (not res!107688) (not e!142894))))

(declare-fun arrayContainsKey!0 (array!10771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!219717 (= res!107688 (arrayContainsKey!0 (_keys!6202 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219718 () Bool)

(declare-fun res!107679 () Bool)

(assert (=> b!219718 (=> (not res!107679) (not e!142894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219718 (= res!107679 (validMask!0 (mask!9944 thiss!1504)))))

(declare-fun b!219719 () Bool)

(declare-fun res!107680 () Bool)

(assert (=> b!219719 (=> (not res!107680) (not e!142894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10771 (_ BitVec 32)) Bool)

(assert (=> b!219719 (= res!107680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6202 thiss!1504) (mask!9944 thiss!1504)))))

(declare-fun call!20526 () Bool)

(declare-fun c!36579 () Bool)

(declare-datatypes ((SeekEntryResult!798 0))(
  ( (MissingZero!798 (index!5362 (_ BitVec 32))) (Found!798 (index!5363 (_ BitVec 32))) (Intermediate!798 (undefined!1610 Bool) (index!5364 (_ BitVec 32)) (x!22921 (_ BitVec 32))) (Undefined!798) (MissingVacant!798 (index!5365 (_ BitVec 32))) )
))
(declare-fun lt!111867 () SeekEntryResult!798)

(declare-fun bm!20522 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20522 (= call!20526 (inRange!0 (ite c!36579 (index!5362 lt!111867) (index!5365 lt!111867)) (mask!9944 thiss!1504)))))

(declare-fun b!219720 () Bool)

(declare-fun res!107684 () Bool)

(assert (=> b!219720 (=> (not res!107684) (not e!142894))))

(assert (=> b!219720 (= res!107684 (and (= (size!5437 (_values!4132 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9944 thiss!1504))) (= (size!5438 (_keys!6202 thiss!1504)) (size!5437 (_values!4132 thiss!1504))) (bvsge (mask!9944 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3886 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3886 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!219721 () Bool)

(assert (=> b!219721 (= e!142894 false)))

(declare-fun lt!111869 () Bool)

(declare-datatypes ((List!3228 0))(
  ( (Nil!3225) (Cons!3224 (h!3872 (_ BitVec 64)) (t!8178 List!3228)) )
))
(declare-fun arrayNoDuplicates!0 (array!10771 (_ BitVec 32) List!3228) Bool)

(assert (=> b!219721 (= lt!111869 (arrayNoDuplicates!0 (_keys!6202 thiss!1504) #b00000000000000000000000000000000 Nil!3225))))

(declare-fun b!219722 () Bool)

(declare-fun e!142886 () Bool)

(assert (=> b!219722 (= e!142886 e!142894)))

(declare-fun res!107683 () Bool)

(assert (=> b!219722 (=> (not res!107683) (not e!142894))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219722 (= res!107683 (inRange!0 index!297 (mask!9944 thiss!1504)))))

(declare-fun lt!111871 () Unit!6507)

(assert (=> b!219722 (= lt!111871 e!142890)))

(declare-fun c!36578 () Bool)

(declare-datatypes ((tuple2!4306 0))(
  ( (tuple2!4307 (_1!2164 (_ BitVec 64)) (_2!2164 V!7337)) )
))
(declare-datatypes ((List!3229 0))(
  ( (Nil!3226) (Cons!3225 (h!3873 tuple2!4306) (t!8179 List!3229)) )
))
(declare-datatypes ((ListLongMap!3209 0))(
  ( (ListLongMap!3210 (toList!1620 List!3229)) )
))
(declare-fun contains!1463 (ListLongMap!3209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1129 (array!10771 array!10769 (_ BitVec 32) (_ BitVec 32) V!7337 V!7337 (_ BitVec 32) Int) ListLongMap!3209)

(assert (=> b!219722 (= c!36578 (contains!1463 (getCurrentListMap!1129 (_keys!6202 thiss!1504) (_values!4132 thiss!1504) (mask!9944 thiss!1504) (extraKeys!3886 thiss!1504) (zeroValue!3990 thiss!1504) (minValue!3990 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4149 thiss!1504)) key!932))))

(declare-fun b!219723 () Bool)

(declare-fun e!142887 () Bool)

(get-info :version)

(assert (=> b!219723 (= e!142887 ((_ is Undefined!798) lt!111867))))

(declare-fun mapNonEmpty!9820 () Bool)

(declare-fun mapRes!9820 () Bool)

(declare-fun tp!20857 () Bool)

(declare-fun e!142891 () Bool)

(assert (=> mapNonEmpty!9820 (= mapRes!9820 (and tp!20857 e!142891))))

(declare-fun mapRest!9820 () (Array (_ BitVec 32) ValueCell!2540))

(declare-fun mapKey!9820 () (_ BitVec 32))

(declare-fun mapValue!9820 () ValueCell!2540)

(assert (=> mapNonEmpty!9820 (= (arr!5103 (_values!4132 thiss!1504)) (store mapRest!9820 mapKey!9820 mapValue!9820))))

(declare-fun b!219724 () Bool)

(declare-fun res!107689 () Bool)

(assert (=> b!219724 (= res!107689 (= (select (arr!5104 (_keys!6202 thiss!1504)) (index!5365 lt!111867)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142892 () Bool)

(assert (=> b!219724 (=> (not res!107689) (not e!142892))))

(declare-fun b!219725 () Bool)

(assert (=> b!219725 (= e!142892 (not call!20525))))

(declare-fun b!219726 () Bool)

(declare-fun res!107690 () Bool)

(assert (=> b!219726 (=> (not res!107690) (not e!142893))))

(assert (=> b!219726 (= res!107690 call!20526)))

(declare-fun e!142889 () Bool)

(assert (=> b!219726 (= e!142889 e!142893)))

(declare-fun b!219727 () Bool)

(declare-fun c!36580 () Bool)

(assert (=> b!219727 (= c!36580 ((_ is MissingVacant!798) lt!111867))))

(assert (=> b!219727 (= e!142889 e!142887)))

(declare-fun res!107686 () Bool)

(declare-fun e!142895 () Bool)

(assert (=> start!21842 (=> (not res!107686) (not e!142895))))

(declare-fun valid!1218 (LongMapFixedSize!2980) Bool)

(assert (=> start!21842 (= res!107686 (valid!1218 thiss!1504))))

(assert (=> start!21842 e!142895))

(declare-fun e!142884 () Bool)

(assert (=> start!21842 e!142884))

(assert (=> start!21842 true))

(declare-fun b!219728 () Bool)

(declare-fun e!142885 () Bool)

(declare-fun e!142896 () Bool)

(assert (=> b!219728 (= e!142885 (and e!142896 mapRes!9820))))

(declare-fun condMapEmpty!9820 () Bool)

(declare-fun mapDefault!9820 () ValueCell!2540)

(assert (=> b!219728 (= condMapEmpty!9820 (= (arr!5103 (_values!4132 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2540)) mapDefault!9820)))))

(declare-fun b!219729 () Bool)

(assert (=> b!219729 (= e!142887 e!142892)))

(declare-fun res!107687 () Bool)

(assert (=> b!219729 (= res!107687 call!20526)))

(assert (=> b!219729 (=> (not res!107687) (not e!142892))))

(declare-fun b!219730 () Bool)

(declare-fun res!107685 () Bool)

(assert (=> b!219730 (=> (not res!107685) (not e!142895))))

(assert (=> b!219730 (= res!107685 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219731 () Bool)

(declare-fun res!107682 () Bool)

(assert (=> b!219731 (=> (not res!107682) (not e!142893))))

(assert (=> b!219731 (= res!107682 (= (select (arr!5104 (_keys!6202 thiss!1504)) (index!5362 lt!111867)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219732 () Bool)

(assert (=> b!219732 (= e!142895 e!142886)))

(declare-fun res!107681 () Bool)

(assert (=> b!219732 (=> (not res!107681) (not e!142886))))

(assert (=> b!219732 (= res!107681 (or (= lt!111867 (MissingZero!798 index!297)) (= lt!111867 (MissingVacant!798 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10771 (_ BitVec 32)) SeekEntryResult!798)

(assert (=> b!219732 (= lt!111867 (seekEntryOrOpen!0 key!932 (_keys!6202 thiss!1504) (mask!9944 thiss!1504)))))

(declare-fun b!219733 () Bool)

(declare-fun lt!111870 () Unit!6507)

(assert (=> b!219733 (= e!142890 lt!111870)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!193 (array!10771 array!10769 (_ BitVec 32) (_ BitVec 32) V!7337 V!7337 (_ BitVec 64) Int) Unit!6507)

(assert (=> b!219733 (= lt!111870 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!193 (_keys!6202 thiss!1504) (_values!4132 thiss!1504) (mask!9944 thiss!1504) (extraKeys!3886 thiss!1504) (zeroValue!3990 thiss!1504) (minValue!3990 thiss!1504) key!932 (defaultEntry!4149 thiss!1504)))))

(assert (=> b!219733 (= c!36579 ((_ is MissingZero!798) lt!111867))))

(assert (=> b!219733 e!142889))

(declare-fun bm!20523 () Bool)

(assert (=> bm!20523 (= call!20525 (arrayContainsKey!0 (_keys!6202 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219734 () Bool)

(declare-fun tp_is_empty!5767 () Bool)

(assert (=> b!219734 (= e!142891 tp_is_empty!5767)))

(declare-fun b!219735 () Bool)

(assert (=> b!219735 (= e!142896 tp_is_empty!5767)))

(declare-fun array_inv!3359 (array!10771) Bool)

(declare-fun array_inv!3360 (array!10769) Bool)

(assert (=> b!219736 (= e!142884 (and tp!20856 tp_is_empty!5767 (array_inv!3359 (_keys!6202 thiss!1504)) (array_inv!3360 (_values!4132 thiss!1504)) e!142885))))

(declare-fun mapIsEmpty!9820 () Bool)

(assert (=> mapIsEmpty!9820 mapRes!9820))

(assert (= (and start!21842 res!107686) b!219730))

(assert (= (and b!219730 res!107685) b!219732))

(assert (= (and b!219732 res!107681) b!219722))

(assert (= (and b!219722 c!36578) b!219716))

(assert (= (and b!219722 (not c!36578)) b!219733))

(assert (= (and b!219733 c!36579) b!219726))

(assert (= (and b!219733 (not c!36579)) b!219727))

(assert (= (and b!219726 res!107690) b!219731))

(assert (= (and b!219731 res!107682) b!219715))

(assert (= (and b!219727 c!36580) b!219729))

(assert (= (and b!219727 (not c!36580)) b!219723))

(assert (= (and b!219729 res!107687) b!219724))

(assert (= (and b!219724 res!107689) b!219725))

(assert (= (or b!219726 b!219729) bm!20522))

(assert (= (or b!219715 b!219725) bm!20523))

(assert (= (and b!219722 res!107683) b!219717))

(assert (= (and b!219717 res!107688) b!219718))

(assert (= (and b!219718 res!107679) b!219720))

(assert (= (and b!219720 res!107684) b!219719))

(assert (= (and b!219719 res!107680) b!219721))

(assert (= (and b!219728 condMapEmpty!9820) mapIsEmpty!9820))

(assert (= (and b!219728 (not condMapEmpty!9820)) mapNonEmpty!9820))

(assert (= (and mapNonEmpty!9820 ((_ is ValueCellFull!2540) mapValue!9820)) b!219734))

(assert (= (and b!219728 ((_ is ValueCellFull!2540) mapDefault!9820)) b!219735))

(assert (= b!219736 b!219728))

(assert (= start!21842 b!219736))

(declare-fun m!244651 () Bool)

(assert (=> b!219722 m!244651))

(declare-fun m!244653 () Bool)

(assert (=> b!219722 m!244653))

(assert (=> b!219722 m!244653))

(declare-fun m!244655 () Bool)

(assert (=> b!219722 m!244655))

(declare-fun m!244657 () Bool)

(assert (=> bm!20523 m!244657))

(declare-fun m!244659 () Bool)

(assert (=> start!21842 m!244659))

(declare-fun m!244661 () Bool)

(assert (=> b!219721 m!244661))

(declare-fun m!244663 () Bool)

(assert (=> b!219732 m!244663))

(declare-fun m!244665 () Bool)

(assert (=> b!219718 m!244665))

(declare-fun m!244667 () Bool)

(assert (=> b!219733 m!244667))

(assert (=> b!219717 m!244657))

(declare-fun m!244669 () Bool)

(assert (=> b!219736 m!244669))

(declare-fun m!244671 () Bool)

(assert (=> b!219736 m!244671))

(declare-fun m!244673 () Bool)

(assert (=> b!219724 m!244673))

(declare-fun m!244675 () Bool)

(assert (=> b!219731 m!244675))

(declare-fun m!244677 () Bool)

(assert (=> mapNonEmpty!9820 m!244677))

(declare-fun m!244679 () Bool)

(assert (=> b!219719 m!244679))

(declare-fun m!244681 () Bool)

(assert (=> b!219716 m!244681))

(declare-fun m!244683 () Bool)

(assert (=> bm!20522 m!244683))

(check-sat (not bm!20523) (not b!219719) (not b_next!5905) b_and!12777 (not b!219716) (not b!219722) tp_is_empty!5767 (not b!219718) (not start!21842) (not b!219732) (not b!219736) (not b!219721) (not bm!20522) (not b!219733) (not mapNonEmpty!9820) (not b!219717))
(check-sat b_and!12777 (not b_next!5905))
