; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15464 () Bool)

(assert start!15464)

(declare-fun b!153755 () Bool)

(declare-fun b_free!3205 () Bool)

(declare-fun b_next!3205 () Bool)

(assert (=> b!153755 (= b_free!3205 (not b_next!3205))))

(declare-fun tp!12131 () Bool)

(declare-fun b_and!9581 () Bool)

(assert (=> b!153755 (= tp!12131 b_and!9581)))

(declare-fun b!153767 () Bool)

(declare-fun b_free!3207 () Bool)

(declare-fun b_next!3207 () Bool)

(assert (=> b!153767 (= b_free!3207 (not b_next!3207))))

(declare-fun tp!12132 () Bool)

(declare-fun b_and!9583 () Bool)

(assert (=> b!153767 (= tp!12132 b_and!9583)))

(declare-fun b!153751 () Bool)

(declare-fun e!100429 () Bool)

(declare-fun tp_is_empty!3019 () Bool)

(assert (=> b!153751 (= e!100429 tp_is_empty!3019)))

(declare-fun res!72651 () Bool)

(declare-fun e!100426 () Bool)

(assert (=> start!15464 (=> (not res!72651) (not e!100426))))

(declare-datatypes ((V!3673 0))(
  ( (V!3674 (val!1554 Int)) )
))
(declare-datatypes ((array!5073 0))(
  ( (array!5074 (arr!2396 (Array (_ BitVec 32) (_ BitVec 64))) (size!2673 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1166 0))(
  ( (ValueCellFull!1166 (v!3411 V!3673)) (EmptyCell!1166) )
))
(declare-datatypes ((array!5075 0))(
  ( (array!5076 (arr!2397 (Array (_ BitVec 32) ValueCell!1166)) (size!2674 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1240 0))(
  ( (LongMapFixedSize!1241 (defaultEntry!3059 Int) (mask!7461 (_ BitVec 32)) (extraKeys!2800 (_ BitVec 32)) (zeroValue!2902 V!3673) (minValue!2902 V!3673) (_size!669 (_ BitVec 32)) (_keys!4832 array!5073) (_values!3042 array!5075) (_vacant!669 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1022 0))(
  ( (Cell!1023 (v!3412 LongMapFixedSize!1240)) )
))
(declare-datatypes ((LongMap!1022 0))(
  ( (LongMap!1023 (underlying!522 Cell!1022)) )
))
(declare-fun thiss!992 () LongMap!1022)

(declare-fun valid!629 (LongMap!1022) Bool)

(assert (=> start!15464 (= res!72651 (valid!629 thiss!992))))

(assert (=> start!15464 e!100426))

(declare-fun e!100417 () Bool)

(assert (=> start!15464 e!100417))

(assert (=> start!15464 true))

(declare-fun e!100418 () Bool)

(assert (=> start!15464 e!100418))

(declare-fun b!153752 () Bool)

(declare-fun e!100419 () Bool)

(assert (=> b!153752 (= e!100426 e!100419)))

(declare-fun res!72646 () Bool)

(assert (=> b!153752 (=> (not res!72646) (not e!100419))))

(declare-datatypes ((tuple2!2750 0))(
  ( (tuple2!2751 (_1!1386 Bool) (_2!1386 LongMapFixedSize!1240)) )
))
(declare-fun lt!80729 () tuple2!2750)

(assert (=> b!153752 (= res!72646 (_1!1386 lt!80729))))

(declare-fun newMap!16 () LongMapFixedSize!1240)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun repackFrom!17 (LongMap!1022 LongMapFixedSize!1240 (_ BitVec 32)) tuple2!2750)

(assert (=> b!153752 (= lt!80729 (repackFrom!17 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!153753 () Bool)

(declare-fun e!100428 () Bool)

(declare-fun e!100425 () Bool)

(assert (=> b!153753 (= e!100428 e!100425)))

(declare-fun b!153754 () Bool)

(declare-fun e!100427 () Bool)

(declare-datatypes ((tuple2!2752 0))(
  ( (tuple2!2753 (_1!1387 (_ BitVec 64)) (_2!1387 V!3673)) )
))
(declare-datatypes ((List!1785 0))(
  ( (Nil!1782) (Cons!1781 (h!2390 tuple2!2752) (t!6567 List!1785)) )
))
(declare-datatypes ((ListLongMap!1755 0))(
  ( (ListLongMap!1756 (toList!893 List!1785)) )
))
(declare-fun map!1491 (LongMapFixedSize!1240) ListLongMap!1755)

(assert (=> b!153754 (= e!100427 (not (= (map!1491 (_2!1386 lt!80729)) (map!1491 (v!3412 (underlying!522 thiss!992))))))))

(declare-fun e!100430 () Bool)

(declare-fun array_inv!1509 (array!5073) Bool)

(declare-fun array_inv!1510 (array!5075) Bool)

(assert (=> b!153755 (= e!100425 (and tp!12131 tp_is_empty!3019 (array_inv!1509 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (array_inv!1510 (_values!3042 (v!3412 (underlying!522 thiss!992)))) e!100430))))

(declare-fun mapNonEmpty!5143 () Bool)

(declare-fun mapRes!5144 () Bool)

(declare-fun tp!12133 () Bool)

(declare-fun e!100421 () Bool)

(assert (=> mapNonEmpty!5143 (= mapRes!5144 (and tp!12133 e!100421))))

(declare-fun mapRest!5144 () (Array (_ BitVec 32) ValueCell!1166))

(declare-fun mapKey!5143 () (_ BitVec 32))

(declare-fun mapValue!5144 () ValueCell!1166)

(assert (=> mapNonEmpty!5143 (= (arr!2397 (_values!3042 (v!3412 (underlying!522 thiss!992)))) (store mapRest!5144 mapKey!5143 mapValue!5144))))

(declare-fun b!153756 () Bool)

(declare-fun res!72648 () Bool)

(assert (=> b!153756 (=> (not res!72648) (not e!100426))))

(declare-fun getCurrentListMap!562 (array!5073 array!5075 (_ BitVec 32) (_ BitVec 32) V!3673 V!3673 (_ BitVec 32) Int) ListLongMap!1755)

(assert (=> b!153756 (= res!72648 (= (getCurrentListMap!562 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))) (map!1491 newMap!16)))))

(declare-fun b!153757 () Bool)

(assert (=> b!153757 (= e!100419 e!100427)))

(declare-fun res!72645 () Bool)

(assert (=> b!153757 (=> res!72645 e!100427)))

(declare-fun valid!630 (LongMapFixedSize!1240) Bool)

(assert (=> b!153757 (= res!72645 (not (valid!630 (_2!1386 lt!80729))))))

(declare-fun b!153758 () Bool)

(declare-fun e!100422 () Bool)

(assert (=> b!153758 (= e!100430 (and e!100422 mapRes!5144))))

(declare-fun condMapEmpty!5144 () Bool)

(declare-fun mapDefault!5144 () ValueCell!1166)

(assert (=> b!153758 (= condMapEmpty!5144 (= (arr!2397 (_values!3042 (v!3412 (underlying!522 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1166)) mapDefault!5144)))))

(declare-fun b!153759 () Bool)

(declare-fun res!72649 () Bool)

(assert (=> b!153759 (=> (not res!72649) (not e!100426))))

(assert (=> b!153759 (= res!72649 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2673 (_keys!4832 (v!3412 (underlying!522 thiss!992)))))))))

(declare-fun b!153760 () Bool)

(declare-fun e!100424 () Bool)

(declare-fun e!100420 () Bool)

(declare-fun mapRes!5143 () Bool)

(assert (=> b!153760 (= e!100424 (and e!100420 mapRes!5143))))

(declare-fun condMapEmpty!5143 () Bool)

(declare-fun mapDefault!5143 () ValueCell!1166)

(assert (=> b!153760 (= condMapEmpty!5143 (= (arr!2397 (_values!3042 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1166)) mapDefault!5143)))))

(declare-fun b!153761 () Bool)

(declare-fun res!72650 () Bool)

(assert (=> b!153761 (=> (not res!72650) (not e!100426))))

(assert (=> b!153761 (= res!72650 (and (or (= (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5144 () Bool)

(declare-fun tp!12134 () Bool)

(assert (=> mapNonEmpty!5144 (= mapRes!5143 (and tp!12134 e!100429))))

(declare-fun mapValue!5143 () ValueCell!1166)

(declare-fun mapRest!5143 () (Array (_ BitVec 32) ValueCell!1166))

(declare-fun mapKey!5144 () (_ BitVec 32))

(assert (=> mapNonEmpty!5144 (= (arr!2397 (_values!3042 newMap!16)) (store mapRest!5143 mapKey!5144 mapValue!5143))))

(declare-fun mapIsEmpty!5143 () Bool)

(assert (=> mapIsEmpty!5143 mapRes!5144))

(declare-fun b!153762 () Bool)

(declare-fun res!72647 () Bool)

(assert (=> b!153762 (=> (not res!72647) (not e!100426))))

(assert (=> b!153762 (= res!72647 (valid!630 newMap!16))))

(declare-fun b!153763 () Bool)

(assert (=> b!153763 (= e!100420 tp_is_empty!3019)))

(declare-fun mapIsEmpty!5144 () Bool)

(assert (=> mapIsEmpty!5144 mapRes!5143))

(declare-fun b!153764 () Bool)

(assert (=> b!153764 (= e!100421 tp_is_empty!3019)))

(declare-fun b!153765 () Bool)

(assert (=> b!153765 (= e!100422 tp_is_empty!3019)))

(declare-fun b!153766 () Bool)

(assert (=> b!153766 (= e!100417 e!100428)))

(assert (=> b!153767 (= e!100418 (and tp!12132 tp_is_empty!3019 (array_inv!1509 (_keys!4832 newMap!16)) (array_inv!1510 (_values!3042 newMap!16)) e!100424))))

(declare-fun b!153768 () Bool)

(declare-fun res!72644 () Bool)

(assert (=> b!153768 (=> (not res!72644) (not e!100426))))

(assert (=> b!153768 (= res!72644 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7461 newMap!16)) (_size!669 (v!3412 (underlying!522 thiss!992)))))))

(assert (= (and start!15464 res!72651) b!153759))

(assert (= (and b!153759 res!72649) b!153762))

(assert (= (and b!153762 res!72647) b!153768))

(assert (= (and b!153768 res!72644) b!153756))

(assert (= (and b!153756 res!72648) b!153761))

(assert (= (and b!153761 res!72650) b!153752))

(assert (= (and b!153752 res!72646) b!153757))

(assert (= (and b!153757 (not res!72645)) b!153754))

(assert (= (and b!153758 condMapEmpty!5144) mapIsEmpty!5143))

(assert (= (and b!153758 (not condMapEmpty!5144)) mapNonEmpty!5143))

(get-info :version)

(assert (= (and mapNonEmpty!5143 ((_ is ValueCellFull!1166) mapValue!5144)) b!153764))

(assert (= (and b!153758 ((_ is ValueCellFull!1166) mapDefault!5144)) b!153765))

(assert (= b!153755 b!153758))

(assert (= b!153753 b!153755))

(assert (= b!153766 b!153753))

(assert (= start!15464 b!153766))

(assert (= (and b!153760 condMapEmpty!5143) mapIsEmpty!5144))

(assert (= (and b!153760 (not condMapEmpty!5143)) mapNonEmpty!5144))

(assert (= (and mapNonEmpty!5144 ((_ is ValueCellFull!1166) mapValue!5143)) b!153751))

(assert (= (and b!153760 ((_ is ValueCellFull!1166) mapDefault!5143)) b!153763))

(assert (= b!153767 b!153760))

(assert (= start!15464 b!153767))

(declare-fun m!187707 () Bool)

(assert (=> b!153756 m!187707))

(declare-fun m!187709 () Bool)

(assert (=> b!153756 m!187709))

(declare-fun m!187711 () Bool)

(assert (=> b!153754 m!187711))

(declare-fun m!187713 () Bool)

(assert (=> b!153754 m!187713))

(declare-fun m!187715 () Bool)

(assert (=> mapNonEmpty!5143 m!187715))

(declare-fun m!187717 () Bool)

(assert (=> b!153761 m!187717))

(declare-fun m!187719 () Bool)

(assert (=> b!153752 m!187719))

(declare-fun m!187721 () Bool)

(assert (=> mapNonEmpty!5144 m!187721))

(declare-fun m!187723 () Bool)

(assert (=> b!153757 m!187723))

(declare-fun m!187725 () Bool)

(assert (=> b!153755 m!187725))

(declare-fun m!187727 () Bool)

(assert (=> b!153755 m!187727))

(declare-fun m!187729 () Bool)

(assert (=> b!153767 m!187729))

(declare-fun m!187731 () Bool)

(assert (=> b!153767 m!187731))

(declare-fun m!187733 () Bool)

(assert (=> b!153762 m!187733))

(declare-fun m!187735 () Bool)

(assert (=> start!15464 m!187735))

(check-sat (not b!153755) b_and!9581 (not b!153757) (not start!15464) (not mapNonEmpty!5144) (not b_next!3207) (not b!153754) b_and!9583 (not b!153756) (not b!153752) (not b!153767) tp_is_empty!3019 (not mapNonEmpty!5143) (not b!153762) (not b_next!3205))
(check-sat b_and!9581 b_and!9583 (not b_next!3205) (not b_next!3207))
(get-model)

(declare-fun d!50627 () Bool)

(assert (=> d!50627 (= (array_inv!1509 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvsge (size!2673 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!153755 d!50627))

(declare-fun d!50629 () Bool)

(assert (=> d!50629 (= (array_inv!1510 (_values!3042 (v!3412 (underlying!522 thiss!992)))) (bvsge (size!2674 (_values!3042 (v!3412 (underlying!522 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!153755 d!50629))

(declare-fun d!50631 () Bool)

(assert (=> d!50631 (= (array_inv!1509 (_keys!4832 newMap!16)) (bvsge (size!2673 (_keys!4832 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!153767 d!50631))

(declare-fun d!50633 () Bool)

(assert (=> d!50633 (= (array_inv!1510 (_values!3042 newMap!16)) (bvsge (size!2674 (_values!3042 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!153767 d!50633))

(declare-fun d!50635 () Bool)

(assert (=> d!50635 (= (valid!629 thiss!992) (valid!630 (v!3412 (underlying!522 thiss!992))))))

(declare-fun bs!6526 () Bool)

(assert (= bs!6526 d!50635))

(declare-fun m!187797 () Bool)

(assert (=> bs!6526 m!187797))

(assert (=> start!15464 d!50635))

(declare-fun d!50637 () Bool)

(declare-fun res!72706 () Bool)

(declare-fun e!100523 () Bool)

(assert (=> d!50637 (=> (not res!72706) (not e!100523))))

(declare-fun simpleValid!103 (LongMapFixedSize!1240) Bool)

(assert (=> d!50637 (= res!72706 (simpleValid!103 newMap!16))))

(assert (=> d!50637 (= (valid!630 newMap!16) e!100523)))

(declare-fun b!153883 () Bool)

(declare-fun res!72707 () Bool)

(assert (=> b!153883 (=> (not res!72707) (not e!100523))))

(declare-fun arrayCountValidKeys!0 (array!5073 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!153883 (= res!72707 (= (arrayCountValidKeys!0 (_keys!4832 newMap!16) #b00000000000000000000000000000000 (size!2673 (_keys!4832 newMap!16))) (_size!669 newMap!16)))))

(declare-fun b!153884 () Bool)

(declare-fun res!72708 () Bool)

(assert (=> b!153884 (=> (not res!72708) (not e!100523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5073 (_ BitVec 32)) Bool)

(assert (=> b!153884 (= res!72708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4832 newMap!16) (mask!7461 newMap!16)))))

(declare-fun b!153885 () Bool)

(declare-datatypes ((List!1788 0))(
  ( (Nil!1785) (Cons!1784 (h!2393 (_ BitVec 64)) (t!6574 List!1788)) )
))
(declare-fun arrayNoDuplicates!0 (array!5073 (_ BitVec 32) List!1788) Bool)

(assert (=> b!153885 (= e!100523 (arrayNoDuplicates!0 (_keys!4832 newMap!16) #b00000000000000000000000000000000 Nil!1785))))

(assert (= (and d!50637 res!72706) b!153883))

(assert (= (and b!153883 res!72707) b!153884))

(assert (= (and b!153884 res!72708) b!153885))

(declare-fun m!187799 () Bool)

(assert (=> d!50637 m!187799))

(declare-fun m!187801 () Bool)

(assert (=> b!153883 m!187801))

(declare-fun m!187803 () Bool)

(assert (=> b!153884 m!187803))

(declare-fun m!187805 () Bool)

(assert (=> b!153885 m!187805))

(assert (=> b!153762 d!50637))

(declare-fun d!50639 () Bool)

(declare-fun res!72709 () Bool)

(declare-fun e!100524 () Bool)

(assert (=> d!50639 (=> (not res!72709) (not e!100524))))

(assert (=> d!50639 (= res!72709 (simpleValid!103 (_2!1386 lt!80729)))))

(assert (=> d!50639 (= (valid!630 (_2!1386 lt!80729)) e!100524)))

(declare-fun b!153886 () Bool)

(declare-fun res!72710 () Bool)

(assert (=> b!153886 (=> (not res!72710) (not e!100524))))

(assert (=> b!153886 (= res!72710 (= (arrayCountValidKeys!0 (_keys!4832 (_2!1386 lt!80729)) #b00000000000000000000000000000000 (size!2673 (_keys!4832 (_2!1386 lt!80729)))) (_size!669 (_2!1386 lt!80729))))))

(declare-fun b!153887 () Bool)

(declare-fun res!72711 () Bool)

(assert (=> b!153887 (=> (not res!72711) (not e!100524))))

(assert (=> b!153887 (= res!72711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4832 (_2!1386 lt!80729)) (mask!7461 (_2!1386 lt!80729))))))

(declare-fun b!153888 () Bool)

(assert (=> b!153888 (= e!100524 (arrayNoDuplicates!0 (_keys!4832 (_2!1386 lt!80729)) #b00000000000000000000000000000000 Nil!1785))))

(assert (= (and d!50639 res!72709) b!153886))

(assert (= (and b!153886 res!72710) b!153887))

(assert (= (and b!153887 res!72711) b!153888))

(declare-fun m!187807 () Bool)

(assert (=> d!50639 m!187807))

(declare-fun m!187809 () Bool)

(assert (=> b!153886 m!187809))

(declare-fun m!187811 () Bool)

(assert (=> b!153887 m!187811))

(declare-fun m!187813 () Bool)

(assert (=> b!153888 m!187813))

(assert (=> b!153757 d!50639))

(declare-fun lt!80827 () (_ BitVec 64))

(declare-fun lt!80815 () V!3673)

(declare-fun lt!80803 () ListLongMap!1755)

(declare-fun bm!17087 () Bool)

(declare-fun call!17093 () ListLongMap!1755)

(declare-fun c!29490 () Bool)

(declare-fun lt!80809 () ListLongMap!1755)

(declare-fun +!188 (ListLongMap!1755 tuple2!2752) ListLongMap!1755)

(assert (=> bm!17087 (= call!17093 (+!188 (ite c!29490 lt!80803 lt!80809) (tuple2!2753 lt!80827 lt!80815)))))

(declare-fun b!153917 () Bool)

(assert (=> b!153917 false))

(declare-datatypes ((Unit!4899 0))(
  ( (Unit!4900) )
))
(declare-fun lt!80822 () Unit!4899)

(declare-fun lt!80830 () Unit!4899)

(assert (=> b!153917 (= lt!80822 lt!80830)))

(declare-fun lt!80811 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!5073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!153917 (not (arrayContainsKey!0 (_keys!4832 (v!3412 (underlying!522 thiss!992))) lt!80827 lt!80811))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5073 (_ BitVec 32) (_ BitVec 64) List!1788) Unit!4899)

(assert (=> b!153917 (= lt!80830 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4832 (v!3412 (underlying!522 thiss!992))) lt!80811 lt!80827 (Cons!1784 lt!80827 Nil!1785)))))

(assert (=> b!153917 (= lt!80811 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!80801 () Unit!4899)

(declare-fun lt!80821 () Unit!4899)

(assert (=> b!153917 (= lt!80801 lt!80821)))

(assert (=> b!153917 (arrayNoDuplicates!0 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1785)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5073 (_ BitVec 32) (_ BitVec 32)) Unit!4899)

(assert (=> b!153917 (= lt!80821 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4832 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!80829 () Unit!4899)

(declare-fun lt!80825 () Unit!4899)

(assert (=> b!153917 (= lt!80829 lt!80825)))

(declare-fun e!100546 () Bool)

(assert (=> b!153917 e!100546))

(declare-fun c!29489 () Bool)

(assert (=> b!153917 (= c!29489 (and (not (= lt!80827 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!80827 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!80831 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!164 (array!5073 array!5075 (_ BitVec 32) (_ BitVec 32) V!3673 V!3673 (_ BitVec 64) (_ BitVec 32) Int) Unit!4899)

(assert (=> b!153917 (= lt!80825 (lemmaListMapContainsThenArrayContainsFrom!164 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) lt!80827 lt!80831 (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))))))

(assert (=> b!153917 (= lt!80831 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!100545 () Unit!4899)

(declare-fun Unit!4901 () Unit!4899)

(assert (=> b!153917 (= e!100545 Unit!4901)))

(declare-fun b!153918 () Bool)

(declare-fun e!100547 () tuple2!2750)

(declare-fun lt!80819 () tuple2!2750)

(assert (=> b!153918 (= e!100547 (tuple2!2751 false (_2!1386 lt!80819)))))

(declare-fun b!153919 () Bool)

(declare-fun e!100543 () tuple2!2750)

(declare-fun lt!80823 () tuple2!2750)

(assert (=> b!153919 (= e!100543 (tuple2!2751 (_1!1386 lt!80823) (_2!1386 lt!80823)))))

(declare-fun lt!80812 () ListLongMap!1755)

(declare-fun call!17094 () ListLongMap!1755)

(assert (=> b!153919 (= lt!80812 call!17094)))

(declare-fun lt!80810 () (_ BitVec 64))

(assert (=> b!153919 (= lt!80810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80804 () Unit!4899)

(declare-fun call!17097 () Unit!4899)

(assert (=> b!153919 (= lt!80804 call!17097)))

(declare-fun call!17099 () ListLongMap!1755)

(declare-fun call!17098 () ListLongMap!1755)

(assert (=> b!153919 (= call!17099 call!17098)))

(declare-fun lt!80818 () Unit!4899)

(assert (=> b!153919 (= lt!80818 lt!80804)))

(declare-fun call!17091 () ListLongMap!1755)

(assert (=> b!153919 (= lt!80803 call!17091)))

(declare-fun lt!80808 () (_ BitVec 64))

(assert (=> b!153919 (= lt!80808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80807 () Unit!4899)

(declare-fun call!17095 () Unit!4899)

(assert (=> b!153919 (= lt!80807 call!17095)))

(declare-fun call!17090 () ListLongMap!1755)

(declare-fun call!17101 () ListLongMap!1755)

(assert (=> b!153919 (= call!17090 call!17101)))

(declare-fun lt!80813 () Unit!4899)

(assert (=> b!153919 (= lt!80813 lt!80807)))

(declare-fun call!17102 () tuple2!2750)

(assert (=> b!153919 (= lt!80823 call!17102)))

(declare-fun lt!80802 () ListLongMap!1755)

(declare-fun lt!80814 () (_ BitVec 64))

(declare-fun call!17096 () ListLongMap!1755)

(declare-fun bm!17088 () Bool)

(assert (=> bm!17088 (= call!17096 (+!188 (ite c!29490 lt!80803 lt!80802) (ite c!29490 (tuple2!2753 lt!80808 (minValue!2902 (v!3412 (underlying!522 thiss!992)))) (tuple2!2753 lt!80814 (minValue!2902 (v!3412 (underlying!522 thiss!992)))))))))

(declare-fun b!153920 () Bool)

(declare-fun e!100544 () tuple2!2750)

(declare-fun e!100548 () tuple2!2750)

(assert (=> b!153920 (= e!100544 e!100548)))

(declare-fun c!29486 () Bool)

(assert (=> b!153920 (= c!29486 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!17089 () Bool)

(declare-fun call!17092 () ListLongMap!1755)

(assert (=> bm!17089 (= call!17090 (+!188 (ite c!29490 call!17093 call!17092) (ite c!29490 (tuple2!2753 lt!80808 (minValue!2902 (v!3412 (underlying!522 thiss!992)))) (tuple2!2753 lt!80814 (minValue!2902 (v!3412 (underlying!522 thiss!992)))))))))

(declare-fun b!153921 () Bool)

(assert (=> b!153921 (= e!100546 (ite (= lt!80827 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!17090 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!158 (array!5073 array!5075 (_ BitVec 32) (_ BitVec 32) V!3673 V!3673 (_ BitVec 32) Int) ListLongMap!1755)

(assert (=> bm!17090 (= call!17094 (getCurrentListMapNoExtraKeys!158 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun bm!17091 () Bool)

(assert (=> bm!17091 (= call!17101 (+!188 call!17096 (tuple2!2753 lt!80827 lt!80815)))))

(declare-fun bm!17092 () Bool)

(declare-fun lt!80816 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!82 (ListLongMap!1755 (_ BitVec 64) V!3673 (_ BitVec 64) V!3673) Unit!4899)

(assert (=> bm!17092 (= call!17095 (addCommutativeForDiffKeys!82 (ite c!29490 lt!80803 lt!80809) lt!80827 lt!80815 (ite c!29490 lt!80808 lt!80816) (ite c!29490 (minValue!2902 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))))))))

(declare-fun bm!17093 () Bool)

(assert (=> bm!17093 (= call!17092 (+!188 (ite c!29490 lt!80812 lt!80802) (tuple2!2753 lt!80827 lt!80815)))))

(declare-fun bm!17094 () Bool)

(declare-fun call!17100 () ListLongMap!1755)

(assert (=> bm!17094 (= call!17098 (+!188 call!17100 (tuple2!2753 lt!80827 lt!80815)))))

(declare-fun b!153922 () Bool)

(assert (=> b!153922 (= c!29490 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!153922 (= e!100547 e!100543)))

(declare-fun c!29491 () Bool)

(declare-fun bm!17095 () Bool)

(assert (=> bm!17095 (= call!17102 (repackFrom!17 thiss!992 (ite c!29491 (_2!1386 lt!80819) newMap!16) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun b!153923 () Bool)

(assert (=> b!153923 (= e!100543 (tuple2!2751 true (_2!1386 lt!80819)))))

(assert (=> b!153923 (= lt!80809 call!17094)))

(assert (=> b!153923 (= lt!80816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80824 () Unit!4899)

(assert (=> b!153923 (= lt!80824 call!17095)))

(assert (=> b!153923 (= call!17091 call!17098)))

(declare-fun lt!80800 () Unit!4899)

(assert (=> b!153923 (= lt!80800 lt!80824)))

(assert (=> b!153923 (= lt!80802 call!17099)))

(assert (=> b!153923 (= lt!80814 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80828 () Unit!4899)

(assert (=> b!153923 (= lt!80828 call!17097)))

(assert (=> b!153923 (= call!17090 call!17101)))

(declare-fun lt!80820 () Unit!4899)

(assert (=> b!153923 (= lt!80820 lt!80828)))

(declare-fun bm!17096 () Bool)

(assert (=> bm!17096 (= call!17099 (+!188 (ite c!29490 call!17092 call!17094) (ite c!29490 (tuple2!2753 lt!80810 (zeroValue!2902 (v!3412 (underlying!522 thiss!992)))) (tuple2!2753 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2902 (v!3412 (underlying!522 thiss!992)))))))))

(declare-fun b!153925 () Bool)

(declare-fun e!100542 () Bool)

(declare-fun lt!80826 () tuple2!2750)

(assert (=> b!153925 (= e!100542 (= (map!1491 (_2!1386 lt!80826)) (map!1491 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun bm!17097 () Bool)

(assert (=> bm!17097 (= call!17091 (+!188 (ite c!29490 call!17094 call!17093) (ite c!29490 (tuple2!2753 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2902 (v!3412 (underlying!522 thiss!992)))) (tuple2!2753 lt!80816 (zeroValue!2902 (v!3412 (underlying!522 thiss!992)))))))))

(declare-fun b!153926 () Bool)

(declare-fun Unit!4902 () Unit!4899)

(assert (=> b!153926 (= e!100545 Unit!4902)))

(declare-fun b!153927 () Bool)

(assert (=> b!153927 (= e!100548 (tuple2!2751 true newMap!16))))

(declare-fun b!153928 () Bool)

(assert (=> b!153928 (= e!100546 (arrayContainsKey!0 (_keys!4832 (v!3412 (underlying!522 thiss!992))) lt!80827 lt!80831))))

(declare-fun bm!17098 () Bool)

(assert (=> bm!17098 (= call!17097 (addCommutativeForDiffKeys!82 (ite c!29490 lt!80812 lt!80802) lt!80827 lt!80815 (ite c!29490 lt!80810 lt!80814) (ite c!29490 (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))))))))

(declare-fun bm!17099 () Bool)

(assert (=> bm!17099 (= call!17100 (+!188 (ite c!29490 lt!80812 lt!80809) (ite c!29490 (tuple2!2753 lt!80810 (zeroValue!2902 (v!3412 (underlying!522 thiss!992)))) (tuple2!2753 lt!80816 (zeroValue!2902 (v!3412 (underlying!522 thiss!992)))))))))

(declare-fun b!153929 () Bool)

(declare-fun e!100541 () Bool)

(assert (=> b!153929 (= e!100541 e!100542)))

(declare-fun res!72717 () Bool)

(assert (=> b!153929 (=> (not res!72717) (not e!100542))))

(assert (=> b!153929 (= res!72717 (valid!630 (_2!1386 lt!80826)))))

(declare-fun b!153930 () Bool)

(declare-fun lt!80806 () tuple2!2750)

(assert (=> b!153930 (= lt!80806 call!17102)))

(assert (=> b!153930 (= e!100548 (tuple2!2751 (_1!1386 lt!80806) (_2!1386 lt!80806)))))

(declare-fun b!153924 () Bool)

(assert (=> b!153924 (= e!100544 e!100547)))

(declare-fun update!235 (LongMapFixedSize!1240 (_ BitVec 64) V!3673) tuple2!2750)

(assert (=> b!153924 (= lt!80819 (update!235 newMap!16 lt!80827 lt!80815))))

(declare-fun c!29488 () Bool)

(declare-fun lt!80805 () ListLongMap!1755)

(declare-fun contains!946 (ListLongMap!1755 (_ BitVec 64)) Bool)

(assert (=> b!153924 (= c!29488 (contains!946 lt!80805 lt!80827))))

(declare-fun lt!80817 () Unit!4899)

(assert (=> b!153924 (= lt!80817 e!100545)))

(declare-fun c!29487 () Bool)

(assert (=> b!153924 (= c!29487 (_1!1386 lt!80819))))

(declare-fun d!50641 () Bool)

(assert (=> d!50641 e!100541))

(declare-fun res!72716 () Bool)

(assert (=> d!50641 (=> res!72716 e!100541)))

(assert (=> d!50641 (= res!72716 (not (_1!1386 lt!80826)))))

(assert (=> d!50641 (= lt!80826 e!100544)))

(assert (=> d!50641 (= c!29491 (and (not (= lt!80827 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!80827 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!50641 (= lt!80805 (map!1491 newMap!16))))

(declare-fun get!1611 (ValueCell!1166 V!3673) V!3673)

(declare-fun dynLambda!470 (Int (_ BitVec 64)) V!3673)

(assert (=> d!50641 (= lt!80815 (get!1611 (select (arr!2397 (_values!3042 (v!3412 (underlying!522 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!470 (defaultEntry!3059 (v!3412 (underlying!522 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50641 (= lt!80827 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!50641 (valid!629 thiss!992)))

(assert (=> d!50641 (= (repackFrom!17 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)) lt!80826)))

(assert (= (and d!50641 c!29491) b!153924))

(assert (= (and d!50641 (not c!29491)) b!153920))

(assert (= (and b!153924 c!29488) b!153917))

(assert (= (and b!153924 (not c!29488)) b!153926))

(assert (= (and b!153917 c!29489) b!153928))

(assert (= (and b!153917 (not c!29489)) b!153921))

(assert (= (and b!153924 c!29487) b!153922))

(assert (= (and b!153924 (not c!29487)) b!153918))

(assert (= (and b!153922 c!29490) b!153919))

(assert (= (and b!153922 (not c!29490)) b!153923))

(assert (= (or b!153919 b!153923) bm!17090))

(assert (= (or b!153919 b!153923) bm!17087))

(assert (= (or b!153919 b!153923) bm!17098))

(assert (= (or b!153919 b!153923) bm!17093))

(assert (= (or b!153919 b!153923) bm!17088))

(assert (= (or b!153919 b!153923) bm!17099))

(assert (= (or b!153919 b!153923) bm!17092))

(assert (= (or b!153919 b!153923) bm!17091))

(assert (= (or b!153919 b!153923) bm!17096))

(assert (= (or b!153919 b!153923) bm!17089))

(assert (= (or b!153919 b!153923) bm!17094))

(assert (= (or b!153919 b!153923) bm!17097))

(assert (= (and b!153920 c!29486) b!153930))

(assert (= (and b!153920 (not c!29486)) b!153927))

(assert (= (or b!153919 b!153930) bm!17095))

(assert (= (and d!50641 (not res!72716)) b!153929))

(assert (= (and b!153929 res!72717) b!153925))

(declare-fun b_lambda!6857 () Bool)

(assert (=> (not b_lambda!6857) (not d!50641)))

(declare-fun t!6571 () Bool)

(declare-fun tb!2745 () Bool)

(assert (=> (and b!153755 (= (defaultEntry!3059 (v!3412 (underlying!522 thiss!992))) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))) t!6571) tb!2745))

(declare-fun result!4473 () Bool)

(assert (=> tb!2745 (= result!4473 tp_is_empty!3019)))

(assert (=> d!50641 t!6571))

(declare-fun b_and!9593 () Bool)

(assert (= b_and!9581 (and (=> t!6571 result!4473) b_and!9593)))

(declare-fun tb!2747 () Bool)

(declare-fun t!6573 () Bool)

(assert (=> (and b!153767 (= (defaultEntry!3059 newMap!16) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))) t!6573) tb!2747))

(declare-fun result!4477 () Bool)

(assert (= result!4477 result!4473))

(assert (=> d!50641 t!6573))

(declare-fun b_and!9595 () Bool)

(assert (= b_and!9583 (and (=> t!6573 result!4477) b_and!9595)))

(declare-fun m!187815 () Bool)

(assert (=> bm!17095 m!187815))

(declare-fun m!187817 () Bool)

(assert (=> bm!17092 m!187817))

(declare-fun m!187819 () Bool)

(assert (=> b!153928 m!187819))

(declare-fun m!187821 () Bool)

(assert (=> bm!17087 m!187821))

(declare-fun m!187823 () Bool)

(assert (=> bm!17088 m!187823))

(declare-fun m!187825 () Bool)

(assert (=> b!153924 m!187825))

(declare-fun m!187827 () Bool)

(assert (=> b!153924 m!187827))

(declare-fun m!187829 () Bool)

(assert (=> b!153917 m!187829))

(declare-fun m!187831 () Bool)

(assert (=> b!153917 m!187831))

(declare-fun m!187833 () Bool)

(assert (=> b!153917 m!187833))

(declare-fun m!187835 () Bool)

(assert (=> b!153917 m!187835))

(declare-fun m!187837 () Bool)

(assert (=> b!153917 m!187837))

(declare-fun m!187839 () Bool)

(assert (=> bm!17096 m!187839))

(declare-fun m!187841 () Bool)

(assert (=> bm!17089 m!187841))

(declare-fun m!187843 () Bool)

(assert (=> bm!17094 m!187843))

(declare-fun m!187845 () Bool)

(assert (=> bm!17098 m!187845))

(declare-fun m!187847 () Bool)

(assert (=> d!50641 m!187847))

(declare-fun m!187849 () Bool)

(assert (=> d!50641 m!187849))

(declare-fun m!187851 () Bool)

(assert (=> d!50641 m!187851))

(assert (=> d!50641 m!187735))

(assert (=> d!50641 m!187849))

(assert (=> d!50641 m!187709))

(assert (=> d!50641 m!187847))

(declare-fun m!187853 () Bool)

(assert (=> d!50641 m!187853))

(declare-fun m!187855 () Bool)

(assert (=> b!153925 m!187855))

(assert (=> b!153925 m!187713))

(declare-fun m!187857 () Bool)

(assert (=> bm!17099 m!187857))

(declare-fun m!187859 () Bool)

(assert (=> b!153929 m!187859))

(declare-fun m!187861 () Bool)

(assert (=> bm!17097 m!187861))

(declare-fun m!187863 () Bool)

(assert (=> bm!17090 m!187863))

(declare-fun m!187865 () Bool)

(assert (=> bm!17093 m!187865))

(declare-fun m!187867 () Bool)

(assert (=> bm!17091 m!187867))

(assert (=> b!153752 d!50641))

(declare-fun b!153975 () Bool)

(declare-fun e!100586 () Bool)

(declare-fun lt!80880 () ListLongMap!1755)

(declare-fun apply!127 (ListLongMap!1755 (_ BitVec 64)) V!3673)

(assert (=> b!153975 (= e!100586 (= (apply!127 lt!80880 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2902 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun b!153976 () Bool)

(declare-fun e!100582 () ListLongMap!1755)

(declare-fun call!17119 () ListLongMap!1755)

(assert (=> b!153976 (= e!100582 call!17119)))

(declare-fun b!153977 () Bool)

(declare-fun e!100584 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!153977 (= e!100584 (validKeyInArray!0 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!153978 () Bool)

(declare-fun e!100579 () Unit!4899)

(declare-fun lt!80884 () Unit!4899)

(assert (=> b!153978 (= e!100579 lt!80884)))

(declare-fun lt!80882 () ListLongMap!1755)

(assert (=> b!153978 (= lt!80882 (getCurrentListMapNoExtraKeys!158 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun lt!80892 () (_ BitVec 64))

(assert (=> b!153978 (= lt!80892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80877 () (_ BitVec 64))

(assert (=> b!153978 (= lt!80877 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80893 () Unit!4899)

(declare-fun addStillContains!103 (ListLongMap!1755 (_ BitVec 64) V!3673 (_ BitVec 64)) Unit!4899)

(assert (=> b!153978 (= lt!80893 (addStillContains!103 lt!80882 lt!80892 (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) lt!80877))))

(assert (=> b!153978 (contains!946 (+!188 lt!80882 (tuple2!2753 lt!80892 (zeroValue!2902 (v!3412 (underlying!522 thiss!992))))) lt!80877)))

(declare-fun lt!80879 () Unit!4899)

(assert (=> b!153978 (= lt!80879 lt!80893)))

(declare-fun lt!80881 () ListLongMap!1755)

(assert (=> b!153978 (= lt!80881 (getCurrentListMapNoExtraKeys!158 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun lt!80896 () (_ BitVec 64))

(assert (=> b!153978 (= lt!80896 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80876 () (_ BitVec 64))

(assert (=> b!153978 (= lt!80876 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80890 () Unit!4899)

(declare-fun addApplyDifferent!103 (ListLongMap!1755 (_ BitVec 64) V!3673 (_ BitVec 64)) Unit!4899)

(assert (=> b!153978 (= lt!80890 (addApplyDifferent!103 lt!80881 lt!80896 (minValue!2902 (v!3412 (underlying!522 thiss!992))) lt!80876))))

(assert (=> b!153978 (= (apply!127 (+!188 lt!80881 (tuple2!2753 lt!80896 (minValue!2902 (v!3412 (underlying!522 thiss!992))))) lt!80876) (apply!127 lt!80881 lt!80876))))

(declare-fun lt!80883 () Unit!4899)

(assert (=> b!153978 (= lt!80883 lt!80890)))

(declare-fun lt!80889 () ListLongMap!1755)

(assert (=> b!153978 (= lt!80889 (getCurrentListMapNoExtraKeys!158 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun lt!80885 () (_ BitVec 64))

(assert (=> b!153978 (= lt!80885 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80891 () (_ BitVec 64))

(assert (=> b!153978 (= lt!80891 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80878 () Unit!4899)

(assert (=> b!153978 (= lt!80878 (addApplyDifferent!103 lt!80889 lt!80885 (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) lt!80891))))

(assert (=> b!153978 (= (apply!127 (+!188 lt!80889 (tuple2!2753 lt!80885 (zeroValue!2902 (v!3412 (underlying!522 thiss!992))))) lt!80891) (apply!127 lt!80889 lt!80891))))

(declare-fun lt!80897 () Unit!4899)

(assert (=> b!153978 (= lt!80897 lt!80878)))

(declare-fun lt!80888 () ListLongMap!1755)

(assert (=> b!153978 (= lt!80888 (getCurrentListMapNoExtraKeys!158 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun lt!80895 () (_ BitVec 64))

(assert (=> b!153978 (= lt!80895 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80886 () (_ BitVec 64))

(assert (=> b!153978 (= lt!80886 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!153978 (= lt!80884 (addApplyDifferent!103 lt!80888 lt!80895 (minValue!2902 (v!3412 (underlying!522 thiss!992))) lt!80886))))

(assert (=> b!153978 (= (apply!127 (+!188 lt!80888 (tuple2!2753 lt!80895 (minValue!2902 (v!3412 (underlying!522 thiss!992))))) lt!80886) (apply!127 lt!80888 lt!80886))))

(declare-fun b!153979 () Bool)

(declare-fun e!100585 () ListLongMap!1755)

(assert (=> b!153979 (= e!100585 e!100582)))

(declare-fun c!29506 () Bool)

(assert (=> b!153979 (= c!29506 (and (not (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17114 () Bool)

(declare-fun call!17117 () Bool)

(assert (=> bm!17114 (= call!17117 (contains!946 lt!80880 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!153981 () Bool)

(declare-fun e!100576 () Bool)

(declare-fun e!100587 () Bool)

(assert (=> b!153981 (= e!100576 e!100587)))

(declare-fun c!29505 () Bool)

(assert (=> b!153981 (= c!29505 (not (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!153982 () Bool)

(declare-fun e!100577 () Bool)

(assert (=> b!153982 (= e!100577 (= (apply!127 lt!80880 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2902 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun bm!17115 () Bool)

(declare-fun call!17120 () Bool)

(assert (=> bm!17115 (= call!17120 (contains!946 lt!80880 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!153983 () Bool)

(declare-fun Unit!4903 () Unit!4899)

(assert (=> b!153983 (= e!100579 Unit!4903)))

(declare-fun e!100578 () Bool)

(declare-fun b!153984 () Bool)

(assert (=> b!153984 (= e!100578 (= (apply!127 lt!80880 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1611 (select (arr!2397 (_values!3042 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!470 (defaultEntry!3059 (v!3412 (underlying!522 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!153984 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2674 (_values!3042 (v!3412 (underlying!522 thiss!992))))))))

(assert (=> b!153984 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2673 (_keys!4832 (v!3412 (underlying!522 thiss!992))))))))

(declare-fun bm!17116 () Bool)

(declare-fun call!17122 () ListLongMap!1755)

(assert (=> bm!17116 (= call!17119 call!17122)))

(declare-fun bm!17117 () Bool)

(declare-fun call!17121 () ListLongMap!1755)

(assert (=> bm!17117 (= call!17121 (getCurrentListMapNoExtraKeys!158 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun b!153985 () Bool)

(declare-fun e!100583 () ListLongMap!1755)

(declare-fun call!17123 () ListLongMap!1755)

(assert (=> b!153985 (= e!100583 call!17123)))

(declare-fun b!153986 () Bool)

(declare-fun res!72743 () Bool)

(assert (=> b!153986 (=> (not res!72743) (not e!100576))))

(declare-fun e!100580 () Bool)

(assert (=> b!153986 (= res!72743 e!100580)))

(declare-fun c!29504 () Bool)

(assert (=> b!153986 (= c!29504 (not (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!153987 () Bool)

(declare-fun c!29509 () Bool)

(assert (=> b!153987 (= c!29509 (and (not (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!153987 (= e!100582 e!100583)))

(declare-fun bm!17118 () Bool)

(declare-fun c!29508 () Bool)

(declare-fun call!17118 () ListLongMap!1755)

(assert (=> bm!17118 (= call!17122 (+!188 (ite c!29508 call!17121 (ite c!29506 call!17118 call!17123)) (ite (or c!29508 c!29506) (tuple2!2753 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2902 (v!3412 (underlying!522 thiss!992)))) (tuple2!2753 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2902 (v!3412 (underlying!522 thiss!992)))))))))

(declare-fun b!153988 () Bool)

(assert (=> b!153988 (= e!100585 (+!188 call!17122 (tuple2!2753 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2902 (v!3412 (underlying!522 thiss!992))))))))

(declare-fun b!153989 () Bool)

(assert (=> b!153989 (= e!100583 call!17119)))

(declare-fun b!153990 () Bool)

(declare-fun res!72744 () Bool)

(assert (=> b!153990 (=> (not res!72744) (not e!100576))))

(declare-fun e!100581 () Bool)

(assert (=> b!153990 (= res!72744 e!100581)))

(declare-fun res!72742 () Bool)

(assert (=> b!153990 (=> res!72742 e!100581)))

(assert (=> b!153990 (= res!72742 (not e!100584))))

(declare-fun res!72736 () Bool)

(assert (=> b!153990 (=> (not res!72736) (not e!100584))))

(assert (=> b!153990 (= res!72736 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2673 (_keys!4832 (v!3412 (underlying!522 thiss!992))))))))

(declare-fun bm!17119 () Bool)

(assert (=> bm!17119 (= call!17123 call!17118)))

(declare-fun b!153991 () Bool)

(assert (=> b!153991 (= e!100587 e!100577)))

(declare-fun res!72738 () Bool)

(assert (=> b!153991 (= res!72738 call!17120)))

(assert (=> b!153991 (=> (not res!72738) (not e!100577))))

(declare-fun b!153992 () Bool)

(assert (=> b!153992 (= e!100581 e!100578)))

(declare-fun res!72739 () Bool)

(assert (=> b!153992 (=> (not res!72739) (not e!100578))))

(assert (=> b!153992 (= res!72739 (contains!946 lt!80880 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!153992 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2673 (_keys!4832 (v!3412 (underlying!522 thiss!992))))))))

(declare-fun d!50643 () Bool)

(assert (=> d!50643 e!100576))

(declare-fun res!72741 () Bool)

(assert (=> d!50643 (=> (not res!72741) (not e!100576))))

(assert (=> d!50643 (= res!72741 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2673 (_keys!4832 (v!3412 (underlying!522 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2673 (_keys!4832 (v!3412 (underlying!522 thiss!992))))))))))

(declare-fun lt!80894 () ListLongMap!1755)

(assert (=> d!50643 (= lt!80880 lt!80894)))

(declare-fun lt!80887 () Unit!4899)

(assert (=> d!50643 (= lt!80887 e!100579)))

(declare-fun c!29507 () Bool)

(declare-fun e!100575 () Bool)

(assert (=> d!50643 (= c!29507 e!100575)))

(declare-fun res!72737 () Bool)

(assert (=> d!50643 (=> (not res!72737) (not e!100575))))

(assert (=> d!50643 (= res!72737 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2673 (_keys!4832 (v!3412 (underlying!522 thiss!992))))))))

(assert (=> d!50643 (= lt!80894 e!100585)))

(assert (=> d!50643 (= c!29508 (and (not (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!50643 (validMask!0 (mask!7461 (v!3412 (underlying!522 thiss!992))))))

(assert (=> d!50643 (= (getCurrentListMap!562 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))) lt!80880)))

(declare-fun b!153980 () Bool)

(assert (=> b!153980 (= e!100580 (not call!17117))))

(declare-fun b!153993 () Bool)

(assert (=> b!153993 (= e!100580 e!100586)))

(declare-fun res!72740 () Bool)

(assert (=> b!153993 (= res!72740 call!17117)))

(assert (=> b!153993 (=> (not res!72740) (not e!100586))))

(declare-fun bm!17120 () Bool)

(assert (=> bm!17120 (= call!17118 call!17121)))

(declare-fun b!153994 () Bool)

(assert (=> b!153994 (= e!100587 (not call!17120))))

(declare-fun b!153995 () Bool)

(assert (=> b!153995 (= e!100575 (validKeyInArray!0 (select (arr!2396 (_keys!4832 (v!3412 (underlying!522 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!50643 c!29508) b!153988))

(assert (= (and d!50643 (not c!29508)) b!153979))

(assert (= (and b!153979 c!29506) b!153976))

(assert (= (and b!153979 (not c!29506)) b!153987))

(assert (= (and b!153987 c!29509) b!153989))

(assert (= (and b!153987 (not c!29509)) b!153985))

(assert (= (or b!153989 b!153985) bm!17119))

(assert (= (or b!153976 bm!17119) bm!17120))

(assert (= (or b!153976 b!153989) bm!17116))

(assert (= (or b!153988 bm!17120) bm!17117))

(assert (= (or b!153988 bm!17116) bm!17118))

(assert (= (and d!50643 res!72737) b!153995))

(assert (= (and d!50643 c!29507) b!153978))

(assert (= (and d!50643 (not c!29507)) b!153983))

(assert (= (and d!50643 res!72741) b!153990))

(assert (= (and b!153990 res!72736) b!153977))

(assert (= (and b!153990 (not res!72742)) b!153992))

(assert (= (and b!153992 res!72739) b!153984))

(assert (= (and b!153990 res!72744) b!153986))

(assert (= (and b!153986 c!29504) b!153993))

(assert (= (and b!153986 (not c!29504)) b!153980))

(assert (= (and b!153993 res!72740) b!153975))

(assert (= (or b!153993 b!153980) bm!17114))

(assert (= (and b!153986 res!72743) b!153981))

(assert (= (and b!153981 c!29505) b!153991))

(assert (= (and b!153981 (not c!29505)) b!153994))

(assert (= (and b!153991 res!72738) b!153982))

(assert (= (or b!153991 b!153994) bm!17115))

(declare-fun b_lambda!6859 () Bool)

(assert (=> (not b_lambda!6859) (not b!153984)))

(assert (=> b!153984 t!6571))

(declare-fun b_and!9597 () Bool)

(assert (= b_and!9593 (and (=> t!6571 result!4473) b_and!9597)))

(assert (=> b!153984 t!6573))

(declare-fun b_and!9599 () Bool)

(assert (= b_and!9595 (and (=> t!6573 result!4477) b_and!9599)))

(declare-fun m!187869 () Bool)

(assert (=> b!153988 m!187869))

(declare-fun m!187871 () Bool)

(assert (=> b!153984 m!187871))

(assert (=> b!153984 m!187849))

(declare-fun m!187873 () Bool)

(assert (=> b!153984 m!187873))

(declare-fun m!187875 () Bool)

(assert (=> b!153984 m!187875))

(declare-fun m!187877 () Bool)

(assert (=> b!153984 m!187877))

(assert (=> b!153984 m!187871))

(assert (=> b!153984 m!187875))

(assert (=> b!153984 m!187849))

(declare-fun m!187879 () Bool)

(assert (=> b!153978 m!187879))

(declare-fun m!187881 () Bool)

(assert (=> b!153978 m!187881))

(declare-fun m!187883 () Bool)

(assert (=> b!153978 m!187883))

(declare-fun m!187885 () Bool)

(assert (=> b!153978 m!187885))

(declare-fun m!187887 () Bool)

(assert (=> b!153978 m!187887))

(declare-fun m!187889 () Bool)

(assert (=> b!153978 m!187889))

(assert (=> b!153978 m!187883))

(declare-fun m!187891 () Bool)

(assert (=> b!153978 m!187891))

(declare-fun m!187893 () Bool)

(assert (=> b!153978 m!187893))

(declare-fun m!187895 () Bool)

(assert (=> b!153978 m!187895))

(declare-fun m!187897 () Bool)

(assert (=> b!153978 m!187897))

(assert (=> b!153978 m!187893))

(declare-fun m!187899 () Bool)

(assert (=> b!153978 m!187899))

(declare-fun m!187901 () Bool)

(assert (=> b!153978 m!187901))

(assert (=> b!153978 m!187875))

(declare-fun m!187903 () Bool)

(assert (=> b!153978 m!187903))

(declare-fun m!187905 () Bool)

(assert (=> b!153978 m!187905))

(assert (=> b!153978 m!187903))

(declare-fun m!187907 () Bool)

(assert (=> b!153978 m!187907))

(assert (=> b!153978 m!187895))

(declare-fun m!187909 () Bool)

(assert (=> b!153978 m!187909))

(assert (=> b!153992 m!187875))

(assert (=> b!153992 m!187875))

(declare-fun m!187911 () Bool)

(assert (=> b!153992 m!187911))

(assert (=> bm!17117 m!187879))

(declare-fun m!187913 () Bool)

(assert (=> d!50643 m!187913))

(assert (=> b!153995 m!187875))

(assert (=> b!153995 m!187875))

(declare-fun m!187915 () Bool)

(assert (=> b!153995 m!187915))

(declare-fun m!187917 () Bool)

(assert (=> bm!17114 m!187917))

(declare-fun m!187919 () Bool)

(assert (=> bm!17115 m!187919))

(assert (=> b!153977 m!187875))

(assert (=> b!153977 m!187875))

(assert (=> b!153977 m!187915))

(declare-fun m!187921 () Bool)

(assert (=> b!153982 m!187921))

(declare-fun m!187923 () Bool)

(assert (=> b!153975 m!187923))

(declare-fun m!187925 () Bool)

(assert (=> bm!17118 m!187925))

(assert (=> b!153756 d!50643))

(declare-fun d!50645 () Bool)

(assert (=> d!50645 (= (map!1491 newMap!16) (getCurrentListMap!562 (_keys!4832 newMap!16) (_values!3042 newMap!16) (mask!7461 newMap!16) (extraKeys!2800 newMap!16) (zeroValue!2902 newMap!16) (minValue!2902 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3059 newMap!16)))))

(declare-fun bs!6527 () Bool)

(assert (= bs!6527 d!50645))

(declare-fun m!187927 () Bool)

(assert (=> bs!6527 m!187927))

(assert (=> b!153756 d!50645))

(declare-fun d!50647 () Bool)

(assert (=> d!50647 (= (map!1491 (_2!1386 lt!80729)) (getCurrentListMap!562 (_keys!4832 (_2!1386 lt!80729)) (_values!3042 (_2!1386 lt!80729)) (mask!7461 (_2!1386 lt!80729)) (extraKeys!2800 (_2!1386 lt!80729)) (zeroValue!2902 (_2!1386 lt!80729)) (minValue!2902 (_2!1386 lt!80729)) #b00000000000000000000000000000000 (defaultEntry!3059 (_2!1386 lt!80729))))))

(declare-fun bs!6528 () Bool)

(assert (= bs!6528 d!50647))

(declare-fun m!187929 () Bool)

(assert (=> bs!6528 m!187929))

(assert (=> b!153754 d!50647))

(declare-fun d!50649 () Bool)

(assert (=> d!50649 (= (map!1491 (v!3412 (underlying!522 thiss!992))) (getCurrentListMap!562 (_keys!4832 (v!3412 (underlying!522 thiss!992))) (_values!3042 (v!3412 (underlying!522 thiss!992))) (mask!7461 (v!3412 (underlying!522 thiss!992))) (extraKeys!2800 (v!3412 (underlying!522 thiss!992))) (zeroValue!2902 (v!3412 (underlying!522 thiss!992))) (minValue!2902 (v!3412 (underlying!522 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3059 (v!3412 (underlying!522 thiss!992)))))))

(declare-fun bs!6529 () Bool)

(assert (= bs!6529 d!50649))

(declare-fun m!187931 () Bool)

(assert (=> bs!6529 m!187931))

(assert (=> b!153754 d!50649))

(declare-fun mapNonEmpty!5159 () Bool)

(declare-fun mapRes!5159 () Bool)

(declare-fun tp!12161 () Bool)

(declare-fun e!100592 () Bool)

(assert (=> mapNonEmpty!5159 (= mapRes!5159 (and tp!12161 e!100592))))

(declare-fun mapValue!5159 () ValueCell!1166)

(declare-fun mapKey!5159 () (_ BitVec 32))

(declare-fun mapRest!5159 () (Array (_ BitVec 32) ValueCell!1166))

(assert (=> mapNonEmpty!5159 (= mapRest!5144 (store mapRest!5159 mapKey!5159 mapValue!5159))))

(declare-fun mapIsEmpty!5159 () Bool)

(assert (=> mapIsEmpty!5159 mapRes!5159))

(declare-fun condMapEmpty!5159 () Bool)

(declare-fun mapDefault!5159 () ValueCell!1166)

(assert (=> mapNonEmpty!5143 (= condMapEmpty!5159 (= mapRest!5144 ((as const (Array (_ BitVec 32) ValueCell!1166)) mapDefault!5159)))))

(declare-fun e!100593 () Bool)

(assert (=> mapNonEmpty!5143 (= tp!12133 (and e!100593 mapRes!5159))))

(declare-fun b!154002 () Bool)

(assert (=> b!154002 (= e!100592 tp_is_empty!3019)))

(declare-fun b!154003 () Bool)

(assert (=> b!154003 (= e!100593 tp_is_empty!3019)))

(assert (= (and mapNonEmpty!5143 condMapEmpty!5159) mapIsEmpty!5159))

(assert (= (and mapNonEmpty!5143 (not condMapEmpty!5159)) mapNonEmpty!5159))

(assert (= (and mapNonEmpty!5159 ((_ is ValueCellFull!1166) mapValue!5159)) b!154002))

(assert (= (and mapNonEmpty!5143 ((_ is ValueCellFull!1166) mapDefault!5159)) b!154003))

(declare-fun m!187933 () Bool)

(assert (=> mapNonEmpty!5159 m!187933))

(declare-fun mapNonEmpty!5160 () Bool)

(declare-fun mapRes!5160 () Bool)

(declare-fun tp!12162 () Bool)

(declare-fun e!100594 () Bool)

(assert (=> mapNonEmpty!5160 (= mapRes!5160 (and tp!12162 e!100594))))

(declare-fun mapRest!5160 () (Array (_ BitVec 32) ValueCell!1166))

(declare-fun mapKey!5160 () (_ BitVec 32))

(declare-fun mapValue!5160 () ValueCell!1166)

(assert (=> mapNonEmpty!5160 (= mapRest!5143 (store mapRest!5160 mapKey!5160 mapValue!5160))))

(declare-fun mapIsEmpty!5160 () Bool)

(assert (=> mapIsEmpty!5160 mapRes!5160))

(declare-fun condMapEmpty!5160 () Bool)

(declare-fun mapDefault!5160 () ValueCell!1166)

(assert (=> mapNonEmpty!5144 (= condMapEmpty!5160 (= mapRest!5143 ((as const (Array (_ BitVec 32) ValueCell!1166)) mapDefault!5160)))))

(declare-fun e!100595 () Bool)

(assert (=> mapNonEmpty!5144 (= tp!12134 (and e!100595 mapRes!5160))))

(declare-fun b!154004 () Bool)

(assert (=> b!154004 (= e!100594 tp_is_empty!3019)))

(declare-fun b!154005 () Bool)

(assert (=> b!154005 (= e!100595 tp_is_empty!3019)))

(assert (= (and mapNonEmpty!5144 condMapEmpty!5160) mapIsEmpty!5160))

(assert (= (and mapNonEmpty!5144 (not condMapEmpty!5160)) mapNonEmpty!5160))

(assert (= (and mapNonEmpty!5160 ((_ is ValueCellFull!1166) mapValue!5160)) b!154004))

(assert (= (and mapNonEmpty!5144 ((_ is ValueCellFull!1166) mapDefault!5160)) b!154005))

(declare-fun m!187935 () Bool)

(assert (=> mapNonEmpty!5160 m!187935))

(declare-fun b_lambda!6861 () Bool)

(assert (= b_lambda!6859 (or (and b!153755 b_free!3205) (and b!153767 b_free!3207 (= (defaultEntry!3059 newMap!16) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992))))) b_lambda!6861)))

(declare-fun b_lambda!6863 () Bool)

(assert (= b_lambda!6857 (or (and b!153755 b_free!3205) (and b!153767 b_free!3207 (= (defaultEntry!3059 newMap!16) (defaultEntry!3059 (v!3412 (underlying!522 thiss!992))))) b_lambda!6863)))

(check-sat (not bm!17095) (not bm!17090) b_and!9597 (not b_next!3207) tp_is_empty!3019 (not d!50639) (not b_next!3205) (not d!50635) (not b!153975) (not mapNonEmpty!5159) (not b!153884) (not b!153995) (not b!153887) (not bm!17099) (not b!153978) (not b!153886) (not bm!17093) (not bm!17097) (not b_lambda!6863) (not bm!17115) (not b!153924) (not b!153988) (not b!153982) (not bm!17089) (not d!50637) (not b!153925) (not bm!17092) (not b!153929) (not bm!17114) (not bm!17098) (not d!50647) (not b!153883) (not b_lambda!6861) (not d!50649) (not b!153928) (not b!153992) (not mapNonEmpty!5160) (not bm!17091) (not bm!17117) (not d!50643) (not d!50645) (not b!153888) (not bm!17118) (not bm!17088) (not b!153917) b_and!9599 (not b!153885) (not bm!17087) (not b!153977) (not bm!17094) (not d!50641) (not bm!17096) (not b!153984))
(check-sat b_and!9597 b_and!9599 (not b_next!3205) (not b_next!3207))
