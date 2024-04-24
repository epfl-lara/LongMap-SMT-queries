; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23292 () Bool)

(assert start!23292)

(declare-fun b!244715 () Bool)

(declare-fun b_free!6541 () Bool)

(declare-fun b_next!6541 () Bool)

(assert (=> b!244715 (= b_free!6541 (not b_next!6541))))

(declare-fun tp!22851 () Bool)

(declare-fun b_and!13541 () Bool)

(assert (=> b!244715 (= tp!22851 b_and!13541)))

(declare-fun b!244699 () Bool)

(declare-fun res!120036 () Bool)

(declare-fun e!158775 () Bool)

(assert (=> b!244699 (=> (not res!120036) (not e!158775))))

(declare-datatypes ((List!3585 0))(
  ( (Nil!3582) (Cons!3581 (h!4238 (_ BitVec 64)) (t!8588 List!3585)) )
))
(declare-fun noDuplicate!105 (List!3585) Bool)

(assert (=> b!244699 (= res!120036 (noDuplicate!105 Nil!3582))))

(declare-fun b!244701 () Bool)

(declare-fun e!158776 () Bool)

(declare-fun e!158764 () Bool)

(assert (=> b!244701 (= e!158776 e!158764)))

(declare-fun res!120031 () Bool)

(declare-fun call!22814 () Bool)

(assert (=> b!244701 (= res!120031 call!22814)))

(assert (=> b!244701 (=> (not res!120031) (not e!158764))))

(declare-fun b!244702 () Bool)

(declare-fun res!120018 () Bool)

(assert (=> b!244702 (=> (not res!120018) (not e!158775))))

(declare-fun contains!1749 (List!3585 (_ BitVec 64)) Bool)

(assert (=> b!244702 (= res!120018 (not (contains!1749 Nil!3582 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244703 () Bool)

(declare-fun e!158766 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!244703 (= e!158766 (contains!1749 Nil!3582 key!932))))

(declare-fun b!244704 () Bool)

(declare-fun e!158762 () Bool)

(declare-fun e!158765 () Bool)

(assert (=> b!244704 (= e!158762 e!158765)))

(declare-fun res!120027 () Bool)

(assert (=> b!244704 (=> (not res!120027) (not e!158765))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8185 0))(
  ( (V!8186 (val!3246 Int)) )
))
(declare-datatypes ((ValueCell!2858 0))(
  ( (ValueCellFull!2858 (v!5298 V!8185)) (EmptyCell!2858) )
))
(declare-datatypes ((array!12099 0))(
  ( (array!12100 (arr!5743 (Array (_ BitVec 32) ValueCell!2858)) (size!6085 (_ BitVec 32))) )
))
(declare-datatypes ((array!12101 0))(
  ( (array!12102 (arr!5744 (Array (_ BitVec 32) (_ BitVec 64))) (size!6086 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3616 0))(
  ( (LongMapFixedSize!3617 (defaultEntry!4529 Int) (mask!10632 (_ BitVec 32)) (extraKeys!4266 (_ BitVec 32)) (zeroValue!4370 V!8185) (minValue!4370 V!8185) (_size!1857 (_ BitVec 32)) (_keys!6642 array!12101) (_values!4512 array!12099) (_vacant!1857 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3616)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244704 (= res!120027 (inRange!0 index!297 (mask!10632 thiss!1504)))))

(declare-datatypes ((Unit!7532 0))(
  ( (Unit!7533) )
))
(declare-fun lt!122659 () Unit!7532)

(declare-fun e!158774 () Unit!7532)

(assert (=> b!244704 (= lt!122659 e!158774)))

(declare-fun c!40852 () Bool)

(declare-datatypes ((tuple2!4712 0))(
  ( (tuple2!4713 (_1!2367 (_ BitVec 64)) (_2!2367 V!8185)) )
))
(declare-datatypes ((List!3586 0))(
  ( (Nil!3583) (Cons!3582 (h!4239 tuple2!4712) (t!8589 List!3586)) )
))
(declare-datatypes ((ListLongMap!3627 0))(
  ( (ListLongMap!3628 (toList!1829 List!3586)) )
))
(declare-fun contains!1750 (ListLongMap!3627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1361 (array!12101 array!12099 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 32) Int) ListLongMap!3627)

(assert (=> b!244704 (= c!40852 (contains!1750 (getCurrentListMap!1361 (_keys!6642 thiss!1504) (_values!4512 thiss!1504) (mask!10632 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4529 thiss!1504)) key!932))))

(declare-fun b!244705 () Bool)

(declare-fun res!120022 () Bool)

(assert (=> b!244705 (=> (not res!120022) (not e!158775))))

(declare-fun arrayNoDuplicates!0 (array!12101 (_ BitVec 32) List!3585) Bool)

(assert (=> b!244705 (= res!120022 (arrayNoDuplicates!0 (_keys!6642 thiss!1504) #b00000000000000000000000000000000 Nil!3582))))

(declare-fun mapIsEmpty!10861 () Bool)

(declare-fun mapRes!10861 () Bool)

(assert (=> mapIsEmpty!10861 mapRes!10861))

(declare-fun b!244706 () Bool)

(declare-fun res!120023 () Bool)

(assert (=> b!244706 (=> (not res!120023) (not e!158775))))

(assert (=> b!244706 (= res!120023 (not (contains!1749 Nil!3582 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!10861 () Bool)

(declare-fun tp!22852 () Bool)

(declare-fun e!158770 () Bool)

(assert (=> mapNonEmpty!10861 (= mapRes!10861 (and tp!22852 e!158770))))

(declare-fun mapValue!10861 () ValueCell!2858)

(declare-fun mapKey!10861 () (_ BitVec 32))

(declare-fun mapRest!10861 () (Array (_ BitVec 32) ValueCell!2858))

(assert (=> mapNonEmpty!10861 (= (arr!5743 (_values!4512 thiss!1504)) (store mapRest!10861 mapKey!10861 mapValue!10861))))

(declare-fun b!244707 () Bool)

(declare-fun c!40850 () Bool)

(declare-datatypes ((SeekEntryResult!1049 0))(
  ( (MissingZero!1049 (index!6366 (_ BitVec 32))) (Found!1049 (index!6367 (_ BitVec 32))) (Intermediate!1049 (undefined!1861 Bool) (index!6368 (_ BitVec 32)) (x!24353 (_ BitVec 32))) (Undefined!1049) (MissingVacant!1049 (index!6369 (_ BitVec 32))) )
))
(declare-fun lt!122660 () SeekEntryResult!1049)

(get-info :version)

(assert (=> b!244707 (= c!40850 ((_ is MissingVacant!1049) lt!122660))))

(declare-fun e!158773 () Bool)

(assert (=> b!244707 (= e!158773 e!158776)))

(declare-fun b!244708 () Bool)

(declare-fun lt!122664 () Bool)

(assert (=> b!244708 (= e!158775 lt!122664)))

(declare-fun res!120028 () Bool)

(declare-fun e!158763 () Bool)

(assert (=> start!23292 (=> (not res!120028) (not e!158763))))

(declare-fun valid!1429 (LongMapFixedSize!3616) Bool)

(assert (=> start!23292 (= res!120028 (valid!1429 thiss!1504))))

(assert (=> start!23292 e!158763))

(declare-fun e!158777 () Bool)

(assert (=> start!23292 e!158777))

(assert (=> start!23292 true))

(declare-fun b!244700 () Bool)

(declare-fun res!120019 () Bool)

(assert (=> b!244700 (=> (not res!120019) (not e!158763))))

(assert (=> b!244700 (= res!120019 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244709 () Bool)

(declare-fun tp_is_empty!6403 () Bool)

(assert (=> b!244709 (= e!158770 tp_is_empty!6403)))

(declare-fun b!244710 () Bool)

(declare-fun call!22815 () Bool)

(assert (=> b!244710 (= e!158764 (not call!22815))))

(declare-fun b!244711 () Bool)

(declare-fun res!120035 () Bool)

(assert (=> b!244711 (=> (not res!120035) (not e!158775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244711 (= res!120035 (validKeyInArray!0 key!932))))

(declare-fun b!244712 () Bool)

(declare-fun e!158771 () Unit!7532)

(declare-fun Unit!7534 () Unit!7532)

(assert (=> b!244712 (= e!158771 Unit!7534)))

(declare-fun lt!122663 () Unit!7532)

(declare-fun lemmaArrayContainsKeyThenInListMap!184 (array!12101 array!12099 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 64) (_ BitVec 32) Int) Unit!7532)

(assert (=> b!244712 (= lt!122663 (lemmaArrayContainsKeyThenInListMap!184 (_keys!6642 thiss!1504) (_values!4512 thiss!1504) (mask!10632 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4529 thiss!1504)))))

(assert (=> b!244712 false))

(declare-fun b!244713 () Bool)

(assert (=> b!244713 (= e!158765 e!158775)))

(declare-fun res!120024 () Bool)

(assert (=> b!244713 (=> (not res!120024) (not e!158775))))

(assert (=> b!244713 (= res!120024 (and (bvslt (size!6086 (_keys!6642 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6086 (_keys!6642 thiss!1504)))))))

(declare-fun lt!122665 () Unit!7532)

(assert (=> b!244713 (= lt!122665 e!158771)))

(declare-fun c!40851 () Bool)

(assert (=> b!244713 (= c!40851 lt!122664)))

(declare-fun arrayContainsKey!0 (array!12101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!244713 (= lt!122664 (arrayContainsKey!0 (_keys!6642 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244714 () Bool)

(assert (=> b!244714 (= e!158763 e!158762)))

(declare-fun res!120032 () Bool)

(assert (=> b!244714 (=> (not res!120032) (not e!158762))))

(assert (=> b!244714 (= res!120032 (or (= lt!122660 (MissingZero!1049 index!297)) (= lt!122660 (MissingVacant!1049 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12101 (_ BitVec 32)) SeekEntryResult!1049)

(assert (=> b!244714 (= lt!122660 (seekEntryOrOpen!0 key!932 (_keys!6642 thiss!1504) (mask!10632 thiss!1504)))))

(declare-fun e!158769 () Bool)

(declare-fun array_inv!3779 (array!12101) Bool)

(declare-fun array_inv!3780 (array!12099) Bool)

(assert (=> b!244715 (= e!158777 (and tp!22851 tp_is_empty!6403 (array_inv!3779 (_keys!6642 thiss!1504)) (array_inv!3780 (_values!4512 thiss!1504)) e!158769))))

(declare-fun b!244716 () Bool)

(declare-fun res!120033 () Bool)

(declare-fun e!158768 () Bool)

(assert (=> b!244716 (=> (not res!120033) (not e!158768))))

(assert (=> b!244716 (= res!120033 call!22814)))

(assert (=> b!244716 (= e!158773 e!158768)))

(declare-fun b!244717 () Bool)

(declare-fun res!120034 () Bool)

(assert (=> b!244717 (=> (not res!120034) (not e!158768))))

(assert (=> b!244717 (= res!120034 (= (select (arr!5744 (_keys!6642 thiss!1504)) (index!6366 lt!122660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244718 () Bool)

(declare-fun Unit!7535 () Unit!7532)

(assert (=> b!244718 (= e!158771 Unit!7535)))

(declare-fun b!244719 () Bool)

(declare-fun res!120029 () Bool)

(assert (=> b!244719 (= res!120029 (= (select (arr!5744 (_keys!6642 thiss!1504)) (index!6369 lt!122660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244719 (=> (not res!120029) (not e!158764))))

(declare-fun b!244720 () Bool)

(declare-fun e!158778 () Bool)

(declare-fun e!158779 () Bool)

(assert (=> b!244720 (= e!158778 e!158779)))

(declare-fun res!120030 () Bool)

(assert (=> b!244720 (=> (not res!120030) (not e!158779))))

(assert (=> b!244720 (= res!120030 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!244721 () Bool)

(declare-fun e!158772 () Bool)

(assert (=> b!244721 (= e!158772 tp_is_empty!6403)))

(declare-fun c!40849 () Bool)

(declare-fun bm!22811 () Bool)

(assert (=> bm!22811 (= call!22814 (inRange!0 (ite c!40849 (index!6366 lt!122660) (index!6369 lt!122660)) (mask!10632 thiss!1504)))))

(declare-fun b!244722 () Bool)

(declare-fun Unit!7536 () Unit!7532)

(assert (=> b!244722 (= e!158774 Unit!7536)))

(declare-fun lt!122662 () Unit!7532)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!366 (array!12101 array!12099 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 64) Int) Unit!7532)

(assert (=> b!244722 (= lt!122662 (lemmaInListMapThenSeekEntryOrOpenFindsIt!366 (_keys!6642 thiss!1504) (_values!4512 thiss!1504) (mask!10632 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) key!932 (defaultEntry!4529 thiss!1504)))))

(assert (=> b!244722 false))

(declare-fun b!244723 () Bool)

(assert (=> b!244723 (= e!158769 (and e!158772 mapRes!10861))))

(declare-fun condMapEmpty!10861 () Bool)

(declare-fun mapDefault!10861 () ValueCell!2858)

(assert (=> b!244723 (= condMapEmpty!10861 (= (arr!5743 (_values!4512 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2858)) mapDefault!10861)))))

(declare-fun b!244724 () Bool)

(assert (=> b!244724 (= e!158768 (not call!22815))))

(declare-fun b!244725 () Bool)

(assert (=> b!244725 (= e!158776 ((_ is Undefined!1049) lt!122660))))

(declare-fun b!244726 () Bool)

(declare-fun lt!122661 () Unit!7532)

(assert (=> b!244726 (= e!158774 lt!122661)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!359 (array!12101 array!12099 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 64) Int) Unit!7532)

(assert (=> b!244726 (= lt!122661 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!359 (_keys!6642 thiss!1504) (_values!4512 thiss!1504) (mask!10632 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) key!932 (defaultEntry!4529 thiss!1504)))))

(assert (=> b!244726 (= c!40849 ((_ is MissingZero!1049) lt!122660))))

(assert (=> b!244726 e!158773))

(declare-fun bm!22812 () Bool)

(assert (=> bm!22812 (= call!22815 (arrayContainsKey!0 (_keys!6642 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244727 () Bool)

(declare-fun res!120025 () Bool)

(assert (=> b!244727 (=> (not res!120025) (not e!158775))))

(assert (=> b!244727 (= res!120025 e!158778)))

(declare-fun res!120021 () Bool)

(assert (=> b!244727 (=> res!120021 e!158778)))

(assert (=> b!244727 (= res!120021 e!158766)))

(declare-fun res!120020 () Bool)

(assert (=> b!244727 (=> (not res!120020) (not e!158766))))

(assert (=> b!244727 (= res!120020 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!244728 () Bool)

(assert (=> b!244728 (= e!158779 (not (contains!1749 Nil!3582 key!932)))))

(declare-fun b!244729 () Bool)

(declare-fun res!120026 () Bool)

(assert (=> b!244729 (=> (not res!120026) (not e!158775))))

(assert (=> b!244729 (= res!120026 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6086 (_keys!6642 thiss!1504)))))))

(assert (= (and start!23292 res!120028) b!244700))

(assert (= (and b!244700 res!120019) b!244714))

(assert (= (and b!244714 res!120032) b!244704))

(assert (= (and b!244704 c!40852) b!244722))

(assert (= (and b!244704 (not c!40852)) b!244726))

(assert (= (and b!244726 c!40849) b!244716))

(assert (= (and b!244726 (not c!40849)) b!244707))

(assert (= (and b!244716 res!120033) b!244717))

(assert (= (and b!244717 res!120034) b!244724))

(assert (= (and b!244707 c!40850) b!244701))

(assert (= (and b!244707 (not c!40850)) b!244725))

(assert (= (and b!244701 res!120031) b!244719))

(assert (= (and b!244719 res!120029) b!244710))

(assert (= (or b!244716 b!244701) bm!22811))

(assert (= (or b!244724 b!244710) bm!22812))

(assert (= (and b!244704 res!120027) b!244713))

(assert (= (and b!244713 c!40851) b!244712))

(assert (= (and b!244713 (not c!40851)) b!244718))

(assert (= (and b!244713 res!120024) b!244699))

(assert (= (and b!244699 res!120036) b!244702))

(assert (= (and b!244702 res!120018) b!244706))

(assert (= (and b!244706 res!120023) b!244727))

(assert (= (and b!244727 res!120020) b!244703))

(assert (= (and b!244727 (not res!120021)) b!244720))

(assert (= (and b!244720 res!120030) b!244728))

(assert (= (and b!244727 res!120025) b!244705))

(assert (= (and b!244705 res!120022) b!244729))

(assert (= (and b!244729 res!120026) b!244711))

(assert (= (and b!244711 res!120035) b!244708))

(assert (= (and b!244723 condMapEmpty!10861) mapIsEmpty!10861))

(assert (= (and b!244723 (not condMapEmpty!10861)) mapNonEmpty!10861))

(assert (= (and mapNonEmpty!10861 ((_ is ValueCellFull!2858) mapValue!10861)) b!244709))

(assert (= (and b!244723 ((_ is ValueCellFull!2858) mapDefault!10861)) b!244721))

(assert (= b!244715 b!244723))

(assert (= start!23292 b!244715))

(declare-fun m!262719 () Bool)

(assert (=> b!244703 m!262719))

(declare-fun m!262721 () Bool)

(assert (=> bm!22811 m!262721))

(declare-fun m!262723 () Bool)

(assert (=> b!244702 m!262723))

(assert (=> b!244728 m!262719))

(declare-fun m!262725 () Bool)

(assert (=> b!244714 m!262725))

(declare-fun m!262727 () Bool)

(assert (=> b!244715 m!262727))

(declare-fun m!262729 () Bool)

(assert (=> b!244715 m!262729))

(declare-fun m!262731 () Bool)

(assert (=> b!244713 m!262731))

(declare-fun m!262733 () Bool)

(assert (=> start!23292 m!262733))

(declare-fun m!262735 () Bool)

(assert (=> b!244706 m!262735))

(declare-fun m!262737 () Bool)

(assert (=> b!244704 m!262737))

(declare-fun m!262739 () Bool)

(assert (=> b!244704 m!262739))

(assert (=> b!244704 m!262739))

(declare-fun m!262741 () Bool)

(assert (=> b!244704 m!262741))

(declare-fun m!262743 () Bool)

(assert (=> b!244726 m!262743))

(declare-fun m!262745 () Bool)

(assert (=> mapNonEmpty!10861 m!262745))

(assert (=> bm!22812 m!262731))

(declare-fun m!262747 () Bool)

(assert (=> b!244712 m!262747))

(declare-fun m!262749 () Bool)

(assert (=> b!244722 m!262749))

(declare-fun m!262751 () Bool)

(assert (=> b!244699 m!262751))

(declare-fun m!262753 () Bool)

(assert (=> b!244705 m!262753))

(declare-fun m!262755 () Bool)

(assert (=> b!244719 m!262755))

(declare-fun m!262757 () Bool)

(assert (=> b!244711 m!262757))

(declare-fun m!262759 () Bool)

(assert (=> b!244717 m!262759))

(check-sat (not b!244706) (not b!244713) (not b!244711) (not b!244726) (not mapNonEmpty!10861) (not b_next!6541) (not b!244715) (not bm!22812) (not b!244712) (not b!244703) b_and!13541 (not b!244702) (not start!23292) tp_is_empty!6403 (not b!244714) (not b!244728) (not b!244699) (not b!244722) (not b!244704) (not b!244705) (not bm!22811))
(check-sat b_and!13541 (not b_next!6541))
