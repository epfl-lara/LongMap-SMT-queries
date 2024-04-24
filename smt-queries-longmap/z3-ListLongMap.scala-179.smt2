; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3468 () Bool)

(assert start!3468)

(declare-fun b!22769 () Bool)

(declare-fun b_free!751 () Bool)

(declare-fun b_next!751 () Bool)

(assert (=> b!22769 (= b_free!751 (not b_next!751))))

(declare-fun tp!3497 () Bool)

(declare-fun b_and!1463 () Bool)

(assert (=> b!22769 (= tp!3497 b_and!1463)))

(declare-fun b!22760 () Bool)

(declare-datatypes ((V!1179 0))(
  ( (V!1180 (val!534 Int)) )
))
(declare-datatypes ((array!1247 0))(
  ( (array!1248 (arr!590 (Array (_ BitVec 32) (_ BitVec 64))) (size!686 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!308 0))(
  ( (ValueCellFull!308 (v!1594 V!1179)) (EmptyCell!308) )
))
(declare-datatypes ((array!1249 0))(
  ( (array!1250 (arr!591 (Array (_ BitVec 32) ValueCell!308)) (size!687 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!202 0))(
  ( (LongMapFixedSize!203 (defaultEntry!1738 Int) (mask!4722 (_ BitVec 32)) (extraKeys!1637 (_ BitVec 32)) (zeroValue!1662 V!1179) (minValue!1662 V!1179) (_size!145 (_ BitVec 32)) (_keys!3160 array!1247) (_values!1725 array!1249) (_vacant!145 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!202 0))(
  ( (Cell!203 (v!1595 LongMapFixedSize!202)) )
))
(declare-datatypes ((tuple2!944 0))(
  ( (tuple2!945 (_1!481 Bool) (_2!481 Cell!202)) )
))
(declare-fun e!14785 () tuple2!944)

(declare-datatypes ((tuple2!946 0))(
  ( (tuple2!947 (_1!482 Bool) (_2!482 LongMapFixedSize!202)) )
))
(declare-fun lt!7908 () tuple2!946)

(declare-fun lt!7905 () tuple2!946)

(assert (=> b!22760 (= e!14785 (tuple2!945 (and (_1!482 lt!7908) (_1!482 lt!7905)) (Cell!203 (_2!482 lt!7905))))))

(declare-fun lt!7904 () LongMapFixedSize!202)

(declare-datatypes ((LongMap!202 0))(
  ( (LongMap!203 (underlying!112 Cell!202)) )
))
(declare-fun thiss!938 () LongMap!202)

(declare-fun update!38 (LongMapFixedSize!202 (_ BitVec 64) V!1179) tuple2!946)

(assert (=> b!22760 (= lt!7908 (update!38 lt!7904 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1595 (underlying!112 thiss!938)))))))

(declare-fun call!1735 () tuple2!946)

(assert (=> b!22760 (= lt!7905 call!1735)))

(declare-fun b!22761 () Bool)

(declare-fun lt!7903 () tuple2!946)

(declare-fun call!1736 () tuple2!946)

(assert (=> b!22761 (= lt!7903 call!1736)))

(declare-fun e!14784 () tuple2!944)

(assert (=> b!22761 (= e!14784 (tuple2!945 (_1!482 lt!7903) (Cell!203 (_2!482 lt!7903))))))

(declare-fun b!22762 () Bool)

(declare-fun e!14783 () Bool)

(declare-fun e!14791 () Bool)

(declare-fun mapRes!1010 () Bool)

(assert (=> b!22762 (= e!14783 (and e!14791 mapRes!1010))))

(declare-fun condMapEmpty!1010 () Bool)

(declare-fun mapDefault!1010 () ValueCell!308)

(assert (=> b!22762 (= condMapEmpty!1010 (= (arr!591 (_values!1725 (v!1595 (underlying!112 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!308)) mapDefault!1010)))))

(declare-fun b!22763 () Bool)

(declare-fun c!2843 () Bool)

(declare-fun lt!7907 () Bool)

(assert (=> b!22763 (= c!2843 (and (not (= (bvand (extraKeys!1637 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7907))))

(declare-fun e!14790 () tuple2!944)

(assert (=> b!22763 (= e!14784 e!14790)))

(declare-fun b!22764 () Bool)

(declare-fun e!14792 () Bool)

(declare-fun e!14789 () Bool)

(assert (=> b!22764 (= e!14792 e!14789)))

(declare-fun res!14215 () Bool)

(assert (=> b!22764 (=> (not res!14215) (not e!14789))))

(assert (=> b!22764 (= res!14215 (_1!481 e!14785))))

(declare-fun c!2844 () Bool)

(assert (=> b!22764 (= c!2844 (and (not lt!7907) (not (= (bvand (extraKeys!1637 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22764 (= lt!7907 (= (bvand (extraKeys!1637 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!34 ((_ BitVec 32) Int) LongMapFixedSize!202)

(declare-fun computeNewMask!29 (LongMap!202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22764 (= lt!7904 (getNewLongMapFixedSize!34 (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) (defaultEntry!1738 (v!1595 (underlying!112 thiss!938)))))))

(declare-fun b!22765 () Bool)

(declare-fun tp_is_empty!1015 () Bool)

(assert (=> b!22765 (= e!14791 tp_is_empty!1015)))

(declare-fun res!14216 () Bool)

(assert (=> start!3468 (=> (not res!14216) (not e!14792))))

(declare-fun valid!117 (LongMap!202) Bool)

(assert (=> start!3468 (= res!14216 (valid!117 thiss!938))))

(assert (=> start!3468 e!14792))

(declare-fun e!14788 () Bool)

(assert (=> start!3468 e!14788))

(declare-fun b!22766 () Bool)

(assert (=> b!22766 (= e!14785 e!14784)))

(declare-fun c!2845 () Bool)

(assert (=> b!22766 (= c!2845 (and (not lt!7907) (= (bvand (extraKeys!1637 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1010 () Bool)

(declare-fun tp!3496 () Bool)

(declare-fun e!14781 () Bool)

(assert (=> mapNonEmpty!1010 (= mapRes!1010 (and tp!3496 e!14781))))

(declare-fun mapValue!1010 () ValueCell!308)

(declare-fun mapKey!1010 () (_ BitVec 32))

(declare-fun mapRest!1010 () (Array (_ BitVec 32) ValueCell!308))

(assert (=> mapNonEmpty!1010 (= (arr!591 (_values!1725 (v!1595 (underlying!112 thiss!938)))) (store mapRest!1010 mapKey!1010 mapValue!1010))))

(declare-fun mapIsEmpty!1010 () Bool)

(assert (=> mapIsEmpty!1010 mapRes!1010))

(declare-fun b!22767 () Bool)

(declare-fun lt!7906 () tuple2!946)

(assert (=> b!22767 (= e!14790 (tuple2!945 (_1!482 lt!7906) (Cell!203 (_2!482 lt!7906))))))

(assert (=> b!22767 (= lt!7906 call!1736)))

(declare-fun b!22768 () Bool)

(assert (=> b!22768 (= e!14781 tp_is_empty!1015)))

(declare-fun e!14782 () Bool)

(declare-fun array_inv!419 (array!1247) Bool)

(declare-fun array_inv!420 (array!1249) Bool)

(assert (=> b!22769 (= e!14782 (and tp!3497 tp_is_empty!1015 (array_inv!419 (_keys!3160 (v!1595 (underlying!112 thiss!938)))) (array_inv!420 (_values!1725 (v!1595 (underlying!112 thiss!938)))) e!14783))))

(declare-fun bm!1732 () Bool)

(assert (=> bm!1732 (= call!1735 (update!38 (ite c!2844 (_2!482 lt!7908) lt!7904) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938)))))))))

(declare-fun b!22770 () Bool)

(declare-fun e!14787 () Bool)

(assert (=> b!22770 (= e!14788 e!14787)))

(declare-fun b!22771 () Bool)

(assert (=> b!22771 (= e!14787 e!14782)))

(declare-fun bm!1733 () Bool)

(assert (=> bm!1733 (= call!1736 call!1735)))

(declare-fun b!22772 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!22772 (= e!14789 (not (validMask!0 (mask!4722 (v!1595 (underlying!112 thiss!938))))))))

(declare-fun b!22773 () Bool)

(assert (=> b!22773 (= e!14790 (tuple2!945 true (Cell!203 lt!7904)))))

(assert (= (and start!3468 res!14216) b!22764))

(assert (= (and b!22764 c!2844) b!22760))

(assert (= (and b!22764 (not c!2844)) b!22766))

(assert (= (and b!22766 c!2845) b!22761))

(assert (= (and b!22766 (not c!2845)) b!22763))

(assert (= (and b!22763 c!2843) b!22767))

(assert (= (and b!22763 (not c!2843)) b!22773))

(assert (= (or b!22761 b!22767) bm!1733))

(assert (= (or b!22760 bm!1733) bm!1732))

(assert (= (and b!22764 res!14215) b!22772))

(assert (= (and b!22762 condMapEmpty!1010) mapIsEmpty!1010))

(assert (= (and b!22762 (not condMapEmpty!1010)) mapNonEmpty!1010))

(get-info :version)

(assert (= (and mapNonEmpty!1010 ((_ is ValueCellFull!308) mapValue!1010)) b!22768))

(assert (= (and b!22762 ((_ is ValueCellFull!308) mapDefault!1010)) b!22765))

(assert (= b!22769 b!22762))

(assert (= b!22771 b!22769))

(assert (= b!22770 b!22771))

(assert (= start!3468 b!22770))

(declare-fun m!16468 () Bool)

(assert (=> b!22764 m!16468))

(assert (=> b!22764 m!16468))

(declare-fun m!16470 () Bool)

(assert (=> b!22764 m!16470))

(declare-fun m!16472 () Bool)

(assert (=> bm!1732 m!16472))

(declare-fun m!16474 () Bool)

(assert (=> mapNonEmpty!1010 m!16474))

(declare-fun m!16476 () Bool)

(assert (=> b!22772 m!16476))

(declare-fun m!16478 () Bool)

(assert (=> start!3468 m!16478))

(declare-fun m!16480 () Bool)

(assert (=> b!22760 m!16480))

(declare-fun m!16482 () Bool)

(assert (=> b!22769 m!16482))

(declare-fun m!16484 () Bool)

(assert (=> b!22769 m!16484))

(check-sat (not b!22764) (not b!22772) (not b!22769) tp_is_empty!1015 (not b_next!751) (not bm!1732) (not mapNonEmpty!1010) (not b!22760) (not start!3468) b_and!1463)
(check-sat b_and!1463 (not b_next!751))
(get-model)

(declare-fun d!3935 () Bool)

(declare-fun valid!118 (LongMapFixedSize!202) Bool)

(assert (=> d!3935 (= (valid!117 thiss!938) (valid!118 (v!1595 (underlying!112 thiss!938))))))

(declare-fun bs!943 () Bool)

(assert (= bs!943 d!3935))

(declare-fun m!16522 () Bool)

(assert (=> bs!943 m!16522))

(assert (=> start!3468 d!3935))

(declare-fun bm!1794 () Bool)

(declare-datatypes ((tuple2!956 0))(
  ( (tuple2!957 (_1!487 (_ BitVec 64)) (_2!487 V!1179)) )
))
(declare-datatypes ((List!562 0))(
  ( (Nil!559) (Cons!558 (h!1124 tuple2!956) (t!3225 List!562)) )
))
(declare-datatypes ((ListLongMap!561 0))(
  ( (ListLongMap!562 (toList!296 List!562)) )
))
(declare-fun call!1810 () ListLongMap!561)

(declare-fun lt!8007 () tuple2!946)

(declare-fun map!405 (LongMapFixedSize!202) ListLongMap!561)

(assert (=> bm!1794 (= call!1810 (map!405 (_2!482 lt!8007)))))

(declare-fun b!22938 () Bool)

(declare-fun e!14913 () Bool)

(declare-fun call!1812 () Bool)

(assert (=> b!22938 (= e!14913 (not call!1812))))

(declare-datatypes ((Unit!511 0))(
  ( (Unit!512) )
))
(declare-fun call!1802 () Unit!511)

(declare-fun bm!1795 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (array!1247 array!1249 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 64) Int) Unit!511)

(assert (=> bm!1795 (= call!1802 (lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(declare-fun b!22939 () Bool)

(declare-fun e!14916 () Unit!511)

(declare-fun lt!8001 () Unit!511)

(assert (=> b!22939 (= e!14916 lt!8001)))

(assert (=> b!22939 (= lt!8001 call!1802)))

(declare-datatypes ((SeekEntryResult!53 0))(
  ( (MissingZero!53 (index!2333 (_ BitVec 32))) (Found!53 (index!2334 (_ BitVec 32))) (Intermediate!53 (undefined!865 Bool) (index!2335 (_ BitVec 32)) (x!5503 (_ BitVec 32))) (Undefined!53) (MissingVacant!53 (index!2336 (_ BitVec 32))) )
))
(declare-fun lt!8014 () SeekEntryResult!53)

(declare-fun call!1806 () SeekEntryResult!53)

(assert (=> b!22939 (= lt!8014 call!1806)))

(declare-fun res!14263 () Bool)

(assert (=> b!22939 (= res!14263 ((_ is Found!53) lt!8014))))

(declare-fun e!14926 () Bool)

(assert (=> b!22939 (=> (not res!14263) (not e!14926))))

(assert (=> b!22939 e!14926))

(declare-fun b!22940 () Bool)

(declare-fun res!14258 () Bool)

(declare-fun call!1818 () Bool)

(assert (=> b!22940 (= res!14258 call!1818)))

(declare-fun e!14912 () Bool)

(assert (=> b!22940 (=> (not res!14258) (not e!14912))))

(declare-fun bm!1796 () Bool)

(declare-fun call!1807 () Bool)

(assert (=> bm!1796 (= call!1807 call!1818)))

(declare-fun bm!1797 () Bool)

(declare-fun call!1799 () Bool)

(assert (=> bm!1797 (= call!1818 call!1799)))

(declare-fun b!22941 () Bool)

(declare-fun e!14915 () Bool)

(declare-fun lt!8025 () SeekEntryResult!53)

(assert (=> b!22941 (= e!14915 ((_ is Undefined!53) lt!8025))))

(declare-fun b!22942 () Bool)

(declare-fun e!14909 () Unit!511)

(declare-fun lt!8012 () Unit!511)

(assert (=> b!22942 (= e!14909 lt!8012)))

(declare-fun call!1815 () Unit!511)

(assert (=> b!22942 (= lt!8012 call!1815)))

(declare-fun call!1811 () SeekEntryResult!53)

(assert (=> b!22942 (= lt!8025 call!1811)))

(declare-fun c!2902 () Bool)

(assert (=> b!22942 (= c!2902 ((_ is MissingZero!53) lt!8025))))

(declare-fun e!14908 () Bool)

(assert (=> b!22942 e!14908))

(declare-fun b!22943 () Bool)

(assert (=> b!22943 (= e!14926 (= (select (arr!590 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2334 lt!8014)) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!8010 () SeekEntryResult!53)

(declare-fun c!2892 () Bool)

(declare-fun call!1804 () ListLongMap!561)

(declare-fun c!2896 () Bool)

(declare-fun bm!1798 () Bool)

(declare-fun lt!8022 () (_ BitVec 32))

(declare-fun lt!8005 () (_ BitVec 32))

(declare-fun c!2890 () Bool)

(declare-fun getCurrentListMap!126 (array!1247 array!1249 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 32) Int) ListLongMap!561)

(assert (=> bm!1798 (= call!1804 (getCurrentListMap!126 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite (or c!2892 c!2896) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (array!1250 (store (arr!591 (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2334 lt!8010) (ValueCellFull!308 (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))))) (size!687 (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904))))) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite c!2892 (ite c!2890 lt!8022 lt!8005) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904))) (ite (and c!2892 c!2890) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904))) (ite c!2892 (ite c!2890 (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938)))))) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904))) #b00000000000000000000000000000000 (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(declare-fun bm!1799 () Bool)

(declare-fun call!1803 () Bool)

(declare-fun call!1805 () Bool)

(assert (=> bm!1799 (= call!1803 call!1805)))

(declare-fun bm!1800 () Bool)

(declare-fun call!1808 () ListLongMap!561)

(declare-fun call!1820 () ListLongMap!561)

(declare-fun call!1801 () ListLongMap!561)

(declare-fun +!43 (ListLongMap!561 tuple2!956) ListLongMap!561)

(assert (=> bm!1800 (= call!1820 (+!43 (ite c!2892 call!1801 call!1808) (ite c!2892 (ite c!2890 (tuple2!957 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938)))))) (tuple2!957 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))))) (tuple2!957 (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938)))))))))))

(declare-fun b!22944 () Bool)

(declare-fun c!2895 () Bool)

(declare-fun lt!8023 () SeekEntryResult!53)

(assert (=> b!22944 (= c!2895 ((_ is MissingVacant!53) lt!8023))))

(declare-fun e!14907 () Bool)

(declare-fun e!14918 () Bool)

(assert (=> b!22944 (= e!14907 e!14918)))

(declare-fun c!2894 () Bool)

(declare-fun call!1819 () tuple2!946)

(declare-fun bm!1801 () Bool)

(declare-fun updateHelperNewKey!9 (LongMapFixedSize!202 (_ BitVec 64) V!1179 (_ BitVec 32)) tuple2!946)

(assert (=> bm!1801 (= call!1819 (updateHelperNewKey!9 (ite c!2844 (_2!482 lt!7908) lt!7904) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))) (ite c!2894 (index!2336 lt!8010) (index!2333 lt!8010))))))

(declare-fun b!22945 () Bool)

(assert (=> b!22945 (= c!2894 ((_ is MissingVacant!53) lt!8010))))

(declare-fun e!14914 () tuple2!946)

(declare-fun e!14923 () tuple2!946)

(assert (=> b!22945 (= e!14914 e!14923)))

(declare-fun b!22946 () Bool)

(declare-fun Unit!513 () Unit!511)

(assert (=> b!22946 (= e!14916 Unit!513)))

(declare-fun lt!8006 () Unit!511)

(assert (=> b!22946 (= lt!8006 call!1815)))

(assert (=> b!22946 (= lt!8023 call!1806)))

(declare-fun c!2891 () Bool)

(assert (=> b!22946 (= c!2891 ((_ is MissingZero!53) lt!8023))))

(assert (=> b!22946 e!14907))

(declare-fun lt!8019 () Unit!511)

(assert (=> b!22946 (= lt!8019 lt!8006)))

(assert (=> b!22946 false))

(declare-fun b!22947 () Bool)

(declare-fun res!14270 () Bool)

(assert (=> b!22947 (=> (not res!14270) (not e!14913))))

(assert (=> b!22947 (= res!14270 call!1803)))

(assert (=> b!22947 (= e!14907 e!14913)))

(declare-fun bm!1802 () Bool)

(declare-fun call!1814 () SeekEntryResult!53)

(assert (=> bm!1802 (= call!1811 call!1814)))

(declare-fun b!22948 () Bool)

(declare-fun lt!8004 () Unit!511)

(declare-fun lt!8018 () Unit!511)

(assert (=> b!22948 (= lt!8004 lt!8018)))

(declare-fun call!1813 () ListLongMap!561)

(declare-fun call!1809 () ListLongMap!561)

(assert (=> b!22948 (= call!1813 call!1809)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (array!1247 array!1249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 V!1179 Int) Unit!511)

(assert (=> b!22948 (= lt!8018 (lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) lt!8005 (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))) (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(assert (=> b!22948 (= lt!8005 (bvor (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) #b00000000000000000000000000000010))))

(declare-fun e!14925 () tuple2!946)

(assert (=> b!22948 (= e!14925 (tuple2!947 true (LongMapFixedSize!203 (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (bvor (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) #b00000000000000000000000000000010) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))) (_size!145 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_vacant!145 (ite c!2844 (_2!482 lt!7908) lt!7904)))))))

(declare-fun b!22949 () Bool)

(declare-fun e!14920 () Bool)

(assert (=> b!22949 (= e!14915 e!14920)))

(declare-fun res!14260 () Bool)

(assert (=> b!22949 (= res!14260 call!1807)))

(assert (=> b!22949 (=> (not res!14260) (not e!14920))))

(declare-fun d!3937 () Bool)

(declare-fun e!14910 () Bool)

(assert (=> d!3937 e!14910))

(declare-fun res!14261 () Bool)

(assert (=> d!3937 (=> (not res!14261) (not e!14910))))

(assert (=> d!3937 (= res!14261 (valid!118 (_2!482 lt!8007)))))

(declare-fun e!14919 () tuple2!946)

(assert (=> d!3937 (= lt!8007 e!14919)))

(assert (=> d!3937 (= c!2892 (= (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3937 (valid!118 (ite c!2844 (_2!482 lt!7908) lt!7904))))

(assert (=> d!3937 (= (update!38 (ite c!2844 (_2!482 lt!7908) lt!7904) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938)))))) lt!8007)))

(declare-fun b!22950 () Bool)

(declare-fun lt!8008 () tuple2!946)

(assert (=> b!22950 (= lt!8008 call!1819)))

(declare-fun e!14911 () tuple2!946)

(assert (=> b!22950 (= e!14911 (tuple2!947 (_1!482 lt!8008) (_2!482 lt!8008)))))

(declare-fun b!22951 () Bool)

(declare-fun e!14921 () Bool)

(assert (=> b!22951 (= e!14910 e!14921)))

(declare-fun c!2900 () Bool)

(assert (=> b!22951 (= c!2900 (_1!482 lt!8007))))

(declare-fun bm!1803 () Bool)

(assert (=> bm!1803 (= call!1813 call!1820)))

(declare-fun b!22952 () Bool)

(declare-fun e!14917 () Bool)

(declare-fun call!1800 () Bool)

(assert (=> b!22952 (= e!14917 (not call!1800))))

(declare-fun b!22953 () Bool)

(declare-fun lt!8017 () Unit!511)

(assert (=> b!22953 (= lt!8017 e!14909)))

(declare-fun c!2893 () Bool)

(declare-fun call!1817 () Bool)

(assert (=> b!22953 (= c!2893 call!1817)))

(assert (=> b!22953 (= e!14914 (tuple2!947 false (ite c!2844 (_2!482 lt!7908) lt!7904)))))

(declare-fun b!22954 () Bool)

(assert (=> b!22954 (= e!14919 e!14914)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1247 (_ BitVec 32)) SeekEntryResult!53)

(assert (=> b!22954 (= lt!8010 (seekEntryOrOpen!0 (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(assert (=> b!22954 (= c!2896 ((_ is Undefined!53) lt!8010))))

(declare-fun lt!8015 () SeekEntryResult!53)

(declare-fun b!22955 () Bool)

(assert (=> b!22955 (= e!14912 (= (select (arr!590 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2334 lt!8015)) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!22956 () Bool)

(declare-fun Unit!514 () Unit!511)

(assert (=> b!22956 (= e!14909 Unit!514)))

(declare-fun lt!8011 () Unit!511)

(assert (=> b!22956 (= lt!8011 call!1802)))

(assert (=> b!22956 (= lt!8015 call!1811)))

(declare-fun res!14267 () Bool)

(assert (=> b!22956 (= res!14267 ((_ is Found!53) lt!8015))))

(assert (=> b!22956 (=> (not res!14267) (not e!14912))))

(assert (=> b!22956 e!14912))

(declare-fun lt!8009 () Unit!511)

(assert (=> b!22956 (= lt!8009 lt!8011)))

(assert (=> b!22956 false))

(declare-fun bm!1804 () Bool)

(declare-fun c!2898 () Bool)

(assert (=> bm!1804 (= c!2898 c!2896)))

(declare-fun e!14927 () ListLongMap!561)

(declare-fun contains!228 (ListLongMap!561 (_ BitVec 64)) Bool)

(assert (=> bm!1804 (= call!1817 (contains!228 e!14927 (ite c!2896 (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!590 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2334 lt!8010)))))))

(declare-fun bm!1805 () Bool)

(assert (=> bm!1805 (= call!1814 (seekEntryOrOpen!0 (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(declare-fun b!22957 () Bool)

(assert (=> b!22957 (= e!14919 e!14925)))

(assert (=> b!22957 (= c!2890 (= (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1806 () Bool)

(assert (=> bm!1806 (= call!1806 call!1814)))

(declare-fun b!22958 () Bool)

(assert (=> b!22958 (= e!14923 e!14911)))

(declare-fun c!2901 () Bool)

(assert (=> b!22958 (= c!2901 ((_ is MissingZero!53) lt!8010))))

(declare-fun b!22959 () Bool)

(declare-fun res!14268 () Bool)

(assert (=> b!22959 (= res!14268 call!1805)))

(assert (=> b!22959 (=> (not res!14268) (not e!14926))))

(declare-fun b!22960 () Bool)

(declare-fun e!14922 () Bool)

(assert (=> b!22960 (= e!14918 e!14922)))

(declare-fun res!14262 () Bool)

(assert (=> b!22960 (= res!14262 call!1803)))

(assert (=> b!22960 (=> (not res!14262) (not e!14922))))

(declare-fun b!22961 () Bool)

(declare-fun call!1798 () ListLongMap!561)

(assert (=> b!22961 (= e!14921 (= call!1810 call!1798))))

(declare-fun b!22962 () Bool)

(declare-fun lt!8020 () tuple2!946)

(assert (=> b!22962 (= e!14923 (tuple2!947 (_1!482 lt!8020) (_2!482 lt!8020)))))

(assert (=> b!22962 (= lt!8020 call!1819)))

(declare-fun call!1816 () Bool)

(declare-fun bm!1807 () Bool)

(declare-fun arrayContainsKey!0 (array!1247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1807 (= call!1816 (arrayContainsKey!0 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!22963 () Bool)

(declare-fun e!14924 () Bool)

(assert (=> b!22963 (= e!14921 e!14924)))

(declare-fun res!14259 () Bool)

(assert (=> b!22963 (= res!14259 (contains!228 call!1810 (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22963 (=> (not res!14259) (not e!14924))))

(declare-fun b!22964 () Bool)

(assert (=> b!22964 (= e!14920 (not call!1800))))

(declare-fun b!22965 () Bool)

(declare-fun res!14265 () Bool)

(assert (=> b!22965 (=> (not res!14265) (not e!14913))))

(assert (=> b!22965 (= res!14265 (= (select (arr!590 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2333 lt!8023)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1808 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (array!1247 array!1249 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 64) Int) Unit!511)

(assert (=> bm!1808 (= call!1815 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(declare-fun bm!1809 () Bool)

(assert (=> bm!1809 (= call!1809 call!1804)))

(declare-fun b!22966 () Bool)

(declare-fun res!14269 () Bool)

(assert (=> b!22966 (=> (not res!14269) (not e!14917))))

(assert (=> b!22966 (= res!14269 (= (select (arr!590 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2333 lt!8025)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1810 () Bool)

(assert (=> bm!1810 (= call!1798 (map!405 (ite c!2844 (_2!482 lt!7908) lt!7904)))))

(declare-fun b!22967 () Bool)

(declare-fun lt!8016 () array!1249)

(assert (=> b!22967 (= e!14927 (getCurrentListMap!126 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) lt!8016 (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) #b00000000000000000000000000000000 (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(declare-fun b!22968 () Bool)

(assert (=> b!22968 (= e!14922 (not call!1812))))

(declare-fun b!22969 () Bool)

(assert (=> b!22969 (= e!14918 ((_ is Undefined!53) lt!8023))))

(declare-fun b!22970 () Bool)

(declare-fun res!14266 () Bool)

(assert (=> b!22970 (=> (not res!14266) (not e!14917))))

(assert (=> b!22970 (= res!14266 call!1807)))

(assert (=> b!22970 (= e!14908 e!14917)))

(declare-fun b!22971 () Bool)

(declare-fun lt!7999 () Unit!511)

(declare-fun lt!8021 () Unit!511)

(assert (=> b!22971 (= lt!7999 lt!8021)))

(assert (=> b!22971 (= call!1813 call!1809)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!9 (array!1247 array!1249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 V!1179 Int) Unit!511)

(assert (=> b!22971 (= lt!8021 (lemmaChangeZeroKeyThenAddPairToListMap!9 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) lt!8022 (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(assert (=> b!22971 (= lt!8022 (bvor (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) #b00000000000000000000000000000001))))

(assert (=> b!22971 (= e!14925 (tuple2!947 true (LongMapFixedSize!203 (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (bvor (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) #b00000000000000000000000000000001) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_size!145 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_vacant!145 (ite c!2844 (_2!482 lt!7908) lt!7904)))))))

(declare-fun bm!1811 () Bool)

(assert (=> bm!1811 (= call!1805 call!1799)))

(declare-fun bm!1812 () Bool)

(assert (=> bm!1812 (= call!1808 (getCurrentListMap!126 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) #b00000000000000000000000000000000 (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(declare-fun bm!1813 () Bool)

(assert (=> bm!1813 (= call!1801 call!1808)))

(declare-fun b!22972 () Bool)

(declare-fun call!1797 () ListLongMap!561)

(assert (=> b!22972 (= e!14927 call!1797)))

(declare-fun res!14264 () Bool)

(declare-fun b!22973 () Bool)

(assert (=> b!22973 (= res!14264 (= (select (arr!590 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2336 lt!8023)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22973 (=> (not res!14264) (not e!14922))))

(declare-fun bm!1814 () Bool)

(assert (=> bm!1814 (= call!1797 call!1804)))

(declare-fun b!22974 () Bool)

(declare-fun c!2897 () Bool)

(assert (=> b!22974 (= c!2897 ((_ is MissingVacant!53) lt!8025))))

(assert (=> b!22974 (= e!14908 e!14915)))

(declare-fun bm!1815 () Bool)

(assert (=> bm!1815 (= call!1800 call!1816)))

(declare-fun c!2899 () Bool)

(declare-fun bm!1816 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1816 (= call!1799 (inRange!0 (ite c!2896 (ite c!2893 (index!2334 lt!8015) (ite c!2902 (index!2333 lt!8025) (index!2336 lt!8025))) (ite c!2899 (index!2334 lt!8014) (ite c!2891 (index!2333 lt!8023) (index!2336 lt!8023)))) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(declare-fun b!22975 () Bool)

(declare-fun lt!8024 () Unit!511)

(declare-fun lt!8002 () Unit!511)

(assert (=> b!22975 (= lt!8024 lt!8002)))

(assert (=> b!22975 call!1817))

(declare-fun lemmaValidKeyInArrayIsInListMap!9 (array!1247 array!1249 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 32) Int) Unit!511)

(assert (=> b!22975 (= lt!8002 (lemmaValidKeyInArrayIsInListMap!9 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) lt!8016 (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (index!2334 lt!8010) (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(assert (=> b!22975 (= lt!8016 (array!1250 (store (arr!591 (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2334 lt!8010) (ValueCellFull!308 (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))))) (size!687 (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)))))))

(declare-fun lt!8000 () Unit!511)

(declare-fun lt!8003 () Unit!511)

(assert (=> b!22975 (= lt!8000 lt!8003)))

(assert (=> b!22975 (= call!1820 call!1797)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (array!1247 array!1249 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 32) (_ BitVec 64) V!1179 Int) Unit!511)

(assert (=> b!22975 (= lt!8003 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (index!2334 lt!8010) (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))) (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904))))))

(declare-fun lt!8013 () Unit!511)

(assert (=> b!22975 (= lt!8013 e!14916)))

(assert (=> b!22975 (= c!2899 (contains!228 call!1808 (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22975 (= e!14911 (tuple2!947 true (LongMapFixedSize!203 (defaultEntry!1738 (ite c!2844 (_2!482 lt!7908) lt!7904)) (mask!4722 (ite c!2844 (_2!482 lt!7908) lt!7904)) (extraKeys!1637 (ite c!2844 (_2!482 lt!7908) lt!7904)) (zeroValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (minValue!1662 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_size!145 (ite c!2844 (_2!482 lt!7908) lt!7904)) (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904)) (array!1250 (store (arr!591 (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2334 lt!8010) (ValueCellFull!308 (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938))))))) (size!687 (_values!1725 (ite c!2844 (_2!482 lt!7908) lt!7904)))) (_vacant!145 (ite c!2844 (_2!482 lt!7908) lt!7904)))))))

(declare-fun res!14257 () Bool)

(declare-fun b!22976 () Bool)

(assert (=> b!22976 (= res!14257 (= (select (arr!590 (_keys!3160 (ite c!2844 (_2!482 lt!7908) lt!7904))) (index!2336 lt!8025)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22976 (=> (not res!14257) (not e!14920))))

(declare-fun bm!1817 () Bool)

(assert (=> bm!1817 (= call!1812 call!1816)))

(declare-fun b!22977 () Bool)

(assert (=> b!22977 (= e!14924 (= call!1810 (+!43 call!1798 (tuple2!957 (ite c!2844 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2845 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2844 (minValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2845 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 (v!1595 (underlying!112 thiss!938)))))))))))

(assert (= (and d!3937 c!2892) b!22957))

(assert (= (and d!3937 (not c!2892)) b!22954))

(assert (= (and b!22957 c!2890) b!22971))

(assert (= (and b!22957 (not c!2890)) b!22948))

(assert (= (or b!22971 b!22948) bm!1809))

(assert (= (or b!22971 b!22948) bm!1813))

(assert (= (or b!22971 b!22948) bm!1803))

(assert (= (and b!22954 c!2896) b!22953))

(assert (= (and b!22954 (not c!2896)) b!22945))

(assert (= (and b!22953 c!2893) b!22956))

(assert (= (and b!22953 (not c!2893)) b!22942))

(assert (= (and b!22956 res!14267) b!22940))

(assert (= (and b!22940 res!14258) b!22955))

(assert (= (and b!22942 c!2902) b!22970))

(assert (= (and b!22942 (not c!2902)) b!22974))

(assert (= (and b!22970 res!14266) b!22966))

(assert (= (and b!22966 res!14269) b!22952))

(assert (= (and b!22974 c!2897) b!22949))

(assert (= (and b!22974 (not c!2897)) b!22941))

(assert (= (and b!22949 res!14260) b!22976))

(assert (= (and b!22976 res!14257) b!22964))

(assert (= (or b!22970 b!22949) bm!1796))

(assert (= (or b!22952 b!22964) bm!1815))

(assert (= (or b!22940 bm!1796) bm!1797))

(assert (= (or b!22956 b!22942) bm!1802))

(assert (= (and b!22945 c!2894) b!22962))

(assert (= (and b!22945 (not c!2894)) b!22958))

(assert (= (and b!22958 c!2901) b!22950))

(assert (= (and b!22958 (not c!2901)) b!22975))

(assert (= (and b!22975 c!2899) b!22939))

(assert (= (and b!22975 (not c!2899)) b!22946))

(assert (= (and b!22939 res!14263) b!22959))

(assert (= (and b!22959 res!14268) b!22943))

(assert (= (and b!22946 c!2891) b!22947))

(assert (= (and b!22946 (not c!2891)) b!22944))

(assert (= (and b!22947 res!14270) b!22965))

(assert (= (and b!22965 res!14265) b!22938))

(assert (= (and b!22944 c!2895) b!22960))

(assert (= (and b!22944 (not c!2895)) b!22969))

(assert (= (and b!22960 res!14262) b!22973))

(assert (= (and b!22973 res!14264) b!22968))

(assert (= (or b!22947 b!22960) bm!1799))

(assert (= (or b!22938 b!22968) bm!1817))

(assert (= (or b!22959 bm!1799) bm!1811))

(assert (= (or b!22939 b!22946) bm!1806))

(assert (= (or b!22962 b!22950) bm!1801))

(assert (= (or b!22956 b!22939) bm!1795))

(assert (= (or b!22942 b!22946) bm!1808))

(assert (= (or bm!1797 bm!1811) bm!1816))

(assert (= (or bm!1802 bm!1806) bm!1805))

(assert (= (or b!22953 b!22975) bm!1814))

(assert (= (or bm!1815 bm!1817) bm!1807))

(assert (= (or b!22953 b!22975) bm!1804))

(assert (= (and bm!1804 c!2898) b!22972))

(assert (= (and bm!1804 (not c!2898)) b!22967))

(assert (= (or bm!1809 bm!1814) bm!1798))

(assert (= (or bm!1813 b!22975) bm!1812))

(assert (= (or bm!1803 b!22975) bm!1800))

(assert (= (and d!3937 res!14261) b!22951))

(assert (= (and b!22951 c!2900) b!22963))

(assert (= (and b!22951 (not c!2900)) b!22961))

(assert (= (and b!22963 res!14259) b!22977))

(assert (= (or b!22963 b!22977 b!22961) bm!1794))

(assert (= (or b!22977 b!22961) bm!1810))

(declare-fun m!16524 () Bool)

(assert (=> bm!1801 m!16524))

(declare-fun m!16526 () Bool)

(assert (=> bm!1816 m!16526))

(declare-fun m!16528 () Bool)

(assert (=> b!22977 m!16528))

(declare-fun m!16530 () Bool)

(assert (=> bm!1798 m!16530))

(declare-fun m!16532 () Bool)

(assert (=> bm!1798 m!16532))

(declare-fun m!16534 () Bool)

(assert (=> b!22976 m!16534))

(declare-fun m!16536 () Bool)

(assert (=> b!22943 m!16536))

(declare-fun m!16538 () Bool)

(assert (=> bm!1795 m!16538))

(declare-fun m!16540 () Bool)

(assert (=> b!22975 m!16540))

(assert (=> b!22975 m!16530))

(declare-fun m!16542 () Bool)

(assert (=> b!22975 m!16542))

(declare-fun m!16544 () Bool)

(assert (=> b!22975 m!16544))

(declare-fun m!16546 () Bool)

(assert (=> bm!1804 m!16546))

(declare-fun m!16548 () Bool)

(assert (=> bm!1804 m!16548))

(declare-fun m!16550 () Bool)

(assert (=> bm!1800 m!16550))

(declare-fun m!16552 () Bool)

(assert (=> bm!1810 m!16552))

(declare-fun m!16554 () Bool)

(assert (=> bm!1805 m!16554))

(declare-fun m!16556 () Bool)

(assert (=> b!22948 m!16556))

(declare-fun m!16558 () Bool)

(assert (=> b!22965 m!16558))

(declare-fun m!16560 () Bool)

(assert (=> bm!1807 m!16560))

(declare-fun m!16562 () Bool)

(assert (=> bm!1808 m!16562))

(declare-fun m!16564 () Bool)

(assert (=> b!22966 m!16564))

(assert (=> b!22954 m!16554))

(declare-fun m!16566 () Bool)

(assert (=> d!3937 m!16566))

(declare-fun m!16568 () Bool)

(assert (=> d!3937 m!16568))

(declare-fun m!16570 () Bool)

(assert (=> b!22955 m!16570))

(declare-fun m!16572 () Bool)

(assert (=> b!22967 m!16572))

(declare-fun m!16574 () Bool)

(assert (=> bm!1812 m!16574))

(declare-fun m!16576 () Bool)

(assert (=> b!22963 m!16576))

(declare-fun m!16578 () Bool)

(assert (=> b!22971 m!16578))

(declare-fun m!16580 () Bool)

(assert (=> bm!1794 m!16580))

(declare-fun m!16582 () Bool)

(assert (=> b!22973 m!16582))

(assert (=> bm!1732 d!3937))

(declare-fun d!3939 () Bool)

(assert (=> d!3939 (= (array_inv!419 (_keys!3160 (v!1595 (underlying!112 thiss!938)))) (bvsge (size!686 (_keys!3160 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22769 d!3939))

(declare-fun d!3941 () Bool)

(assert (=> d!3941 (= (array_inv!420 (_values!1725 (v!1595 (underlying!112 thiss!938)))) (bvsge (size!687 (_values!1725 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22769 d!3941))

(declare-fun d!3943 () Bool)

(assert (=> d!3943 (= (validMask!0 (mask!4722 (v!1595 (underlying!112 thiss!938)))) (and (or (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000000111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000001111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000011111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000001111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000011111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000001111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000011111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000001111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000011111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000001111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000011111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000001111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000011111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000001111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000011111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000111111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000001111111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000011111111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000111111111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00001111111111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00011111111111111111111111111111) (= (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!22772 d!3943))

(declare-fun bm!1818 () Bool)

(declare-fun call!1834 () ListLongMap!561)

(declare-fun lt!8034 () tuple2!946)

(assert (=> bm!1818 (= call!1834 (map!405 (_2!482 lt!8034)))))

(declare-fun b!22978 () Bool)

(declare-fun e!14934 () Bool)

(declare-fun call!1836 () Bool)

(assert (=> b!22978 (= e!14934 (not call!1836))))

(declare-fun bm!1819 () Bool)

(declare-fun call!1826 () Unit!511)

(assert (=> bm!1819 (= call!1826 (lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (_keys!3160 lt!7904) (_values!1725 lt!7904) (mask!4722 lt!7904) (extraKeys!1637 lt!7904) (zeroValue!1662 lt!7904) (minValue!1662 lt!7904) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1738 lt!7904)))))

(declare-fun b!22979 () Bool)

(declare-fun e!14937 () Unit!511)

(declare-fun lt!8028 () Unit!511)

(assert (=> b!22979 (= e!14937 lt!8028)))

(assert (=> b!22979 (= lt!8028 call!1826)))

(declare-fun lt!8041 () SeekEntryResult!53)

(declare-fun call!1830 () SeekEntryResult!53)

(assert (=> b!22979 (= lt!8041 call!1830)))

(declare-fun res!14277 () Bool)

(assert (=> b!22979 (= res!14277 ((_ is Found!53) lt!8041))))

(declare-fun e!14947 () Bool)

(assert (=> b!22979 (=> (not res!14277) (not e!14947))))

(assert (=> b!22979 e!14947))

(declare-fun b!22980 () Bool)

(declare-fun res!14272 () Bool)

(declare-fun call!1842 () Bool)

(assert (=> b!22980 (= res!14272 call!1842)))

(declare-fun e!14933 () Bool)

(assert (=> b!22980 (=> (not res!14272) (not e!14933))))

(declare-fun bm!1820 () Bool)

(declare-fun call!1831 () Bool)

(assert (=> bm!1820 (= call!1831 call!1842)))

(declare-fun bm!1821 () Bool)

(declare-fun call!1823 () Bool)

(assert (=> bm!1821 (= call!1842 call!1823)))

(declare-fun b!22981 () Bool)

(declare-fun e!14936 () Bool)

(declare-fun lt!8052 () SeekEntryResult!53)

(assert (=> b!22981 (= e!14936 ((_ is Undefined!53) lt!8052))))

(declare-fun b!22982 () Bool)

(declare-fun e!14930 () Unit!511)

(declare-fun lt!8039 () Unit!511)

(assert (=> b!22982 (= e!14930 lt!8039)))

(declare-fun call!1839 () Unit!511)

(assert (=> b!22982 (= lt!8039 call!1839)))

(declare-fun call!1835 () SeekEntryResult!53)

(assert (=> b!22982 (= lt!8052 call!1835)))

(declare-fun c!2915 () Bool)

(assert (=> b!22982 (= c!2915 ((_ is MissingZero!53) lt!8052))))

(declare-fun e!14929 () Bool)

(assert (=> b!22982 e!14929))

(declare-fun b!22983 () Bool)

(assert (=> b!22983 (= e!14947 (= (select (arr!590 (_keys!3160 lt!7904)) (index!2334 lt!8041)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!2905 () Bool)

(declare-fun c!2909 () Bool)

(declare-fun bm!1822 () Bool)

(declare-fun lt!8049 () (_ BitVec 32))

(declare-fun lt!8037 () SeekEntryResult!53)

(declare-fun c!2903 () Bool)

(declare-fun call!1828 () ListLongMap!561)

(declare-fun lt!8032 () (_ BitVec 32))

(assert (=> bm!1822 (= call!1828 (getCurrentListMap!126 (_keys!3160 lt!7904) (ite (or c!2905 c!2909) (_values!1725 lt!7904) (array!1250 (store (arr!591 (_values!1725 lt!7904)) (index!2334 lt!8037) (ValueCellFull!308 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))))) (size!687 (_values!1725 lt!7904)))) (mask!4722 lt!7904) (ite c!2905 (ite c!2903 lt!8049 lt!8032) (extraKeys!1637 lt!7904)) (ite (and c!2905 c!2903) (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (zeroValue!1662 lt!7904)) (ite c!2905 (ite c!2903 (minValue!1662 lt!7904) (zeroValue!1662 (v!1595 (underlying!112 thiss!938)))) (minValue!1662 lt!7904)) #b00000000000000000000000000000000 (defaultEntry!1738 lt!7904)))))

(declare-fun bm!1823 () Bool)

(declare-fun call!1827 () Bool)

(declare-fun call!1829 () Bool)

(assert (=> bm!1823 (= call!1827 call!1829)))

(declare-fun call!1832 () ListLongMap!561)

(declare-fun bm!1824 () Bool)

(declare-fun call!1825 () ListLongMap!561)

(declare-fun call!1844 () ListLongMap!561)

(assert (=> bm!1824 (= call!1844 (+!43 (ite c!2905 call!1825 call!1832) (ite c!2905 (ite c!2903 (tuple2!957 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1595 (underlying!112 thiss!938)))) (tuple2!957 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))))) (tuple2!957 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1595 (underlying!112 thiss!938)))))))))

(declare-fun b!22984 () Bool)

(declare-fun c!2908 () Bool)

(declare-fun lt!8050 () SeekEntryResult!53)

(assert (=> b!22984 (= c!2908 ((_ is MissingVacant!53) lt!8050))))

(declare-fun e!14928 () Bool)

(declare-fun e!14939 () Bool)

(assert (=> b!22984 (= e!14928 e!14939)))

(declare-fun call!1843 () tuple2!946)

(declare-fun c!2907 () Bool)

(declare-fun bm!1825 () Bool)

(assert (=> bm!1825 (= call!1843 (updateHelperNewKey!9 lt!7904 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (ite c!2907 (index!2336 lt!8037) (index!2333 lt!8037))))))

(declare-fun b!22985 () Bool)

(assert (=> b!22985 (= c!2907 ((_ is MissingVacant!53) lt!8037))))

(declare-fun e!14935 () tuple2!946)

(declare-fun e!14944 () tuple2!946)

(assert (=> b!22985 (= e!14935 e!14944)))

(declare-fun b!22986 () Bool)

(declare-fun Unit!515 () Unit!511)

(assert (=> b!22986 (= e!14937 Unit!515)))

(declare-fun lt!8033 () Unit!511)

(assert (=> b!22986 (= lt!8033 call!1839)))

(assert (=> b!22986 (= lt!8050 call!1830)))

(declare-fun c!2904 () Bool)

(assert (=> b!22986 (= c!2904 ((_ is MissingZero!53) lt!8050))))

(assert (=> b!22986 e!14928))

(declare-fun lt!8046 () Unit!511)

(assert (=> b!22986 (= lt!8046 lt!8033)))

(assert (=> b!22986 false))

(declare-fun b!22987 () Bool)

(declare-fun res!14284 () Bool)

(assert (=> b!22987 (=> (not res!14284) (not e!14934))))

(assert (=> b!22987 (= res!14284 call!1827)))

(assert (=> b!22987 (= e!14928 e!14934)))

(declare-fun bm!1826 () Bool)

(declare-fun call!1838 () SeekEntryResult!53)

(assert (=> bm!1826 (= call!1835 call!1838)))

(declare-fun b!22988 () Bool)

(declare-fun lt!8031 () Unit!511)

(declare-fun lt!8045 () Unit!511)

(assert (=> b!22988 (= lt!8031 lt!8045)))

(declare-fun call!1837 () ListLongMap!561)

(declare-fun call!1833 () ListLongMap!561)

(assert (=> b!22988 (= call!1837 call!1833)))

(assert (=> b!22988 (= lt!8045 (lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (_keys!3160 lt!7904) (_values!1725 lt!7904) (mask!4722 lt!7904) (extraKeys!1637 lt!7904) lt!8032 (zeroValue!1662 lt!7904) (minValue!1662 lt!7904) (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (defaultEntry!1738 lt!7904)))))

(assert (=> b!22988 (= lt!8032 (bvor (extraKeys!1637 lt!7904) #b00000000000000000000000000000010))))

(declare-fun e!14946 () tuple2!946)

(assert (=> b!22988 (= e!14946 (tuple2!947 true (LongMapFixedSize!203 (defaultEntry!1738 lt!7904) (mask!4722 lt!7904) (bvor (extraKeys!1637 lt!7904) #b00000000000000000000000000000010) (zeroValue!1662 lt!7904) (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (_size!145 lt!7904) (_keys!3160 lt!7904) (_values!1725 lt!7904) (_vacant!145 lt!7904))))))

(declare-fun b!22989 () Bool)

(declare-fun e!14941 () Bool)

(assert (=> b!22989 (= e!14936 e!14941)))

(declare-fun res!14274 () Bool)

(assert (=> b!22989 (= res!14274 call!1831)))

(assert (=> b!22989 (=> (not res!14274) (not e!14941))))

(declare-fun d!3945 () Bool)

(declare-fun e!14931 () Bool)

(assert (=> d!3945 e!14931))

(declare-fun res!14275 () Bool)

(assert (=> d!3945 (=> (not res!14275) (not e!14931))))

(assert (=> d!3945 (= res!14275 (valid!118 (_2!482 lt!8034)))))

(declare-fun e!14940 () tuple2!946)

(assert (=> d!3945 (= lt!8034 e!14940)))

(assert (=> d!3945 (= c!2905 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3945 (valid!118 lt!7904)))

(assert (=> d!3945 (= (update!38 lt!7904 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1595 (underlying!112 thiss!938)))) lt!8034)))

(declare-fun b!22990 () Bool)

(declare-fun lt!8035 () tuple2!946)

(assert (=> b!22990 (= lt!8035 call!1843)))

(declare-fun e!14932 () tuple2!946)

(assert (=> b!22990 (= e!14932 (tuple2!947 (_1!482 lt!8035) (_2!482 lt!8035)))))

(declare-fun b!22991 () Bool)

(declare-fun e!14942 () Bool)

(assert (=> b!22991 (= e!14931 e!14942)))

(declare-fun c!2913 () Bool)

(assert (=> b!22991 (= c!2913 (_1!482 lt!8034))))

(declare-fun bm!1827 () Bool)

(assert (=> bm!1827 (= call!1837 call!1844)))

(declare-fun b!22992 () Bool)

(declare-fun e!14938 () Bool)

(declare-fun call!1824 () Bool)

(assert (=> b!22992 (= e!14938 (not call!1824))))

(declare-fun b!22993 () Bool)

(declare-fun lt!8044 () Unit!511)

(assert (=> b!22993 (= lt!8044 e!14930)))

(declare-fun c!2906 () Bool)

(declare-fun call!1841 () Bool)

(assert (=> b!22993 (= c!2906 call!1841)))

(assert (=> b!22993 (= e!14935 (tuple2!947 false lt!7904))))

(declare-fun b!22994 () Bool)

(assert (=> b!22994 (= e!14940 e!14935)))

(assert (=> b!22994 (= lt!8037 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3160 lt!7904) (mask!4722 lt!7904)))))

(assert (=> b!22994 (= c!2909 ((_ is Undefined!53) lt!8037))))

(declare-fun b!22995 () Bool)

(declare-fun lt!8042 () SeekEntryResult!53)

(assert (=> b!22995 (= e!14933 (= (select (arr!590 (_keys!3160 lt!7904)) (index!2334 lt!8042)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22996 () Bool)

(declare-fun Unit!516 () Unit!511)

(assert (=> b!22996 (= e!14930 Unit!516)))

(declare-fun lt!8038 () Unit!511)

(assert (=> b!22996 (= lt!8038 call!1826)))

(assert (=> b!22996 (= lt!8042 call!1835)))

(declare-fun res!14281 () Bool)

(assert (=> b!22996 (= res!14281 ((_ is Found!53) lt!8042))))

(assert (=> b!22996 (=> (not res!14281) (not e!14933))))

(assert (=> b!22996 e!14933))

(declare-fun lt!8036 () Unit!511)

(assert (=> b!22996 (= lt!8036 lt!8038)))

(assert (=> b!22996 false))

(declare-fun bm!1828 () Bool)

(declare-fun c!2911 () Bool)

(assert (=> bm!1828 (= c!2911 c!2909)))

(declare-fun e!14948 () ListLongMap!561)

(assert (=> bm!1828 (= call!1841 (contains!228 e!14948 (ite c!2909 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!590 (_keys!3160 lt!7904)) (index!2334 lt!8037)))))))

(declare-fun bm!1829 () Bool)

(assert (=> bm!1829 (= call!1838 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3160 lt!7904) (mask!4722 lt!7904)))))

(declare-fun b!22997 () Bool)

(assert (=> b!22997 (= e!14940 e!14946)))

(assert (=> b!22997 (= c!2903 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1830 () Bool)

(assert (=> bm!1830 (= call!1830 call!1838)))

(declare-fun b!22998 () Bool)

(assert (=> b!22998 (= e!14944 e!14932)))

(declare-fun c!2914 () Bool)

(assert (=> b!22998 (= c!2914 ((_ is MissingZero!53) lt!8037))))

(declare-fun b!22999 () Bool)

(declare-fun res!14282 () Bool)

(assert (=> b!22999 (= res!14282 call!1829)))

(assert (=> b!22999 (=> (not res!14282) (not e!14947))))

(declare-fun b!23000 () Bool)

(declare-fun e!14943 () Bool)

(assert (=> b!23000 (= e!14939 e!14943)))

(declare-fun res!14276 () Bool)

(assert (=> b!23000 (= res!14276 call!1827)))

(assert (=> b!23000 (=> (not res!14276) (not e!14943))))

(declare-fun b!23001 () Bool)

(declare-fun call!1822 () ListLongMap!561)

(assert (=> b!23001 (= e!14942 (= call!1834 call!1822))))

(declare-fun b!23002 () Bool)

(declare-fun lt!8047 () tuple2!946)

(assert (=> b!23002 (= e!14944 (tuple2!947 (_1!482 lt!8047) (_2!482 lt!8047)))))

(assert (=> b!23002 (= lt!8047 call!1843)))

(declare-fun bm!1831 () Bool)

(declare-fun call!1840 () Bool)

(assert (=> bm!1831 (= call!1840 (arrayContainsKey!0 (_keys!3160 lt!7904) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!23003 () Bool)

(declare-fun e!14945 () Bool)

(assert (=> b!23003 (= e!14942 e!14945)))

(declare-fun res!14273 () Bool)

(assert (=> b!23003 (= res!14273 (contains!228 call!1834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!23003 (=> (not res!14273) (not e!14945))))

(declare-fun b!23004 () Bool)

(assert (=> b!23004 (= e!14941 (not call!1824))))

(declare-fun b!23005 () Bool)

(declare-fun res!14279 () Bool)

(assert (=> b!23005 (=> (not res!14279) (not e!14934))))

(assert (=> b!23005 (= res!14279 (= (select (arr!590 (_keys!3160 lt!7904)) (index!2333 lt!8050)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1832 () Bool)

(assert (=> bm!1832 (= call!1839 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (_keys!3160 lt!7904) (_values!1725 lt!7904) (mask!4722 lt!7904) (extraKeys!1637 lt!7904) (zeroValue!1662 lt!7904) (minValue!1662 lt!7904) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1738 lt!7904)))))

(declare-fun bm!1833 () Bool)

(assert (=> bm!1833 (= call!1833 call!1828)))

(declare-fun b!23006 () Bool)

(declare-fun res!14283 () Bool)

(assert (=> b!23006 (=> (not res!14283) (not e!14938))))

(assert (=> b!23006 (= res!14283 (= (select (arr!590 (_keys!3160 lt!7904)) (index!2333 lt!8052)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1834 () Bool)

(assert (=> bm!1834 (= call!1822 (map!405 lt!7904))))

(declare-fun b!23007 () Bool)

(declare-fun lt!8043 () array!1249)

(assert (=> b!23007 (= e!14948 (getCurrentListMap!126 (_keys!3160 lt!7904) lt!8043 (mask!4722 lt!7904) (extraKeys!1637 lt!7904) (zeroValue!1662 lt!7904) (minValue!1662 lt!7904) #b00000000000000000000000000000000 (defaultEntry!1738 lt!7904)))))

(declare-fun b!23008 () Bool)

(assert (=> b!23008 (= e!14943 (not call!1836))))

(declare-fun b!23009 () Bool)

(assert (=> b!23009 (= e!14939 ((_ is Undefined!53) lt!8050))))

(declare-fun b!23010 () Bool)

(declare-fun res!14280 () Bool)

(assert (=> b!23010 (=> (not res!14280) (not e!14938))))

(assert (=> b!23010 (= res!14280 call!1831)))

(assert (=> b!23010 (= e!14929 e!14938)))

(declare-fun b!23011 () Bool)

(declare-fun lt!8026 () Unit!511)

(declare-fun lt!8048 () Unit!511)

(assert (=> b!23011 (= lt!8026 lt!8048)))

(assert (=> b!23011 (= call!1837 call!1833)))

(assert (=> b!23011 (= lt!8048 (lemmaChangeZeroKeyThenAddPairToListMap!9 (_keys!3160 lt!7904) (_values!1725 lt!7904) (mask!4722 lt!7904) (extraKeys!1637 lt!7904) lt!8049 (zeroValue!1662 lt!7904) (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 lt!7904) (defaultEntry!1738 lt!7904)))))

(assert (=> b!23011 (= lt!8049 (bvor (extraKeys!1637 lt!7904) #b00000000000000000000000000000001))))

(assert (=> b!23011 (= e!14946 (tuple2!947 true (LongMapFixedSize!203 (defaultEntry!1738 lt!7904) (mask!4722 lt!7904) (bvor (extraKeys!1637 lt!7904) #b00000000000000000000000000000001) (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (minValue!1662 lt!7904) (_size!145 lt!7904) (_keys!3160 lt!7904) (_values!1725 lt!7904) (_vacant!145 lt!7904))))))

(declare-fun bm!1835 () Bool)

(assert (=> bm!1835 (= call!1829 call!1823)))

(declare-fun bm!1836 () Bool)

(assert (=> bm!1836 (= call!1832 (getCurrentListMap!126 (_keys!3160 lt!7904) (_values!1725 lt!7904) (mask!4722 lt!7904) (extraKeys!1637 lt!7904) (zeroValue!1662 lt!7904) (minValue!1662 lt!7904) #b00000000000000000000000000000000 (defaultEntry!1738 lt!7904)))))

(declare-fun bm!1837 () Bool)

(assert (=> bm!1837 (= call!1825 call!1832)))

(declare-fun b!23012 () Bool)

(declare-fun call!1821 () ListLongMap!561)

(assert (=> b!23012 (= e!14948 call!1821)))

(declare-fun b!23013 () Bool)

(declare-fun res!14278 () Bool)

(assert (=> b!23013 (= res!14278 (= (select (arr!590 (_keys!3160 lt!7904)) (index!2336 lt!8050)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!23013 (=> (not res!14278) (not e!14943))))

(declare-fun bm!1838 () Bool)

(assert (=> bm!1838 (= call!1821 call!1828)))

(declare-fun b!23014 () Bool)

(declare-fun c!2910 () Bool)

(assert (=> b!23014 (= c!2910 ((_ is MissingVacant!53) lt!8052))))

(assert (=> b!23014 (= e!14929 e!14936)))

(declare-fun bm!1839 () Bool)

(assert (=> bm!1839 (= call!1824 call!1840)))

(declare-fun c!2912 () Bool)

(declare-fun bm!1840 () Bool)

(assert (=> bm!1840 (= call!1823 (inRange!0 (ite c!2909 (ite c!2906 (index!2334 lt!8042) (ite c!2915 (index!2333 lt!8052) (index!2336 lt!8052))) (ite c!2912 (index!2334 lt!8041) (ite c!2904 (index!2333 lt!8050) (index!2336 lt!8050)))) (mask!4722 lt!7904)))))

(declare-fun b!23015 () Bool)

(declare-fun lt!8051 () Unit!511)

(declare-fun lt!8029 () Unit!511)

(assert (=> b!23015 (= lt!8051 lt!8029)))

(assert (=> b!23015 call!1841))

(assert (=> b!23015 (= lt!8029 (lemmaValidKeyInArrayIsInListMap!9 (_keys!3160 lt!7904) lt!8043 (mask!4722 lt!7904) (extraKeys!1637 lt!7904) (zeroValue!1662 lt!7904) (minValue!1662 lt!7904) (index!2334 lt!8037) (defaultEntry!1738 lt!7904)))))

(assert (=> b!23015 (= lt!8043 (array!1250 (store (arr!591 (_values!1725 lt!7904)) (index!2334 lt!8037) (ValueCellFull!308 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))))) (size!687 (_values!1725 lt!7904))))))

(declare-fun lt!8027 () Unit!511)

(declare-fun lt!8030 () Unit!511)

(assert (=> b!23015 (= lt!8027 lt!8030)))

(assert (=> b!23015 (= call!1844 call!1821)))

(assert (=> b!23015 (= lt!8030 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (_keys!3160 lt!7904) (_values!1725 lt!7904) (mask!4722 lt!7904) (extraKeys!1637 lt!7904) (zeroValue!1662 lt!7904) (minValue!1662 lt!7904) (index!2334 lt!8037) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))) (defaultEntry!1738 lt!7904)))))

(declare-fun lt!8040 () Unit!511)

(assert (=> b!23015 (= lt!8040 e!14937)))

(assert (=> b!23015 (= c!2912 (contains!228 call!1832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!23015 (= e!14932 (tuple2!947 true (LongMapFixedSize!203 (defaultEntry!1738 lt!7904) (mask!4722 lt!7904) (extraKeys!1637 lt!7904) (zeroValue!1662 lt!7904) (minValue!1662 lt!7904) (_size!145 lt!7904) (_keys!3160 lt!7904) (array!1250 (store (arr!591 (_values!1725 lt!7904)) (index!2334 lt!8037) (ValueCellFull!308 (zeroValue!1662 (v!1595 (underlying!112 thiss!938))))) (size!687 (_values!1725 lt!7904))) (_vacant!145 lt!7904))))))

(declare-fun b!23016 () Bool)

(declare-fun res!14271 () Bool)

(assert (=> b!23016 (= res!14271 (= (select (arr!590 (_keys!3160 lt!7904)) (index!2336 lt!8052)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!23016 (=> (not res!14271) (not e!14941))))

(declare-fun bm!1841 () Bool)

(assert (=> bm!1841 (= call!1836 call!1840)))

(declare-fun b!23017 () Bool)

(assert (=> b!23017 (= e!14945 (= call!1834 (+!43 call!1822 (tuple2!957 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1595 (underlying!112 thiss!938)))))))))

(assert (= (and d!3945 c!2905) b!22997))

(assert (= (and d!3945 (not c!2905)) b!22994))

(assert (= (and b!22997 c!2903) b!23011))

(assert (= (and b!22997 (not c!2903)) b!22988))

(assert (= (or b!23011 b!22988) bm!1833))

(assert (= (or b!23011 b!22988) bm!1837))

(assert (= (or b!23011 b!22988) bm!1827))

(assert (= (and b!22994 c!2909) b!22993))

(assert (= (and b!22994 (not c!2909)) b!22985))

(assert (= (and b!22993 c!2906) b!22996))

(assert (= (and b!22993 (not c!2906)) b!22982))

(assert (= (and b!22996 res!14281) b!22980))

(assert (= (and b!22980 res!14272) b!22995))

(assert (= (and b!22982 c!2915) b!23010))

(assert (= (and b!22982 (not c!2915)) b!23014))

(assert (= (and b!23010 res!14280) b!23006))

(assert (= (and b!23006 res!14283) b!22992))

(assert (= (and b!23014 c!2910) b!22989))

(assert (= (and b!23014 (not c!2910)) b!22981))

(assert (= (and b!22989 res!14274) b!23016))

(assert (= (and b!23016 res!14271) b!23004))

(assert (= (or b!23010 b!22989) bm!1820))

(assert (= (or b!22992 b!23004) bm!1839))

(assert (= (or b!22980 bm!1820) bm!1821))

(assert (= (or b!22996 b!22982) bm!1826))

(assert (= (and b!22985 c!2907) b!23002))

(assert (= (and b!22985 (not c!2907)) b!22998))

(assert (= (and b!22998 c!2914) b!22990))

(assert (= (and b!22998 (not c!2914)) b!23015))

(assert (= (and b!23015 c!2912) b!22979))

(assert (= (and b!23015 (not c!2912)) b!22986))

(assert (= (and b!22979 res!14277) b!22999))

(assert (= (and b!22999 res!14282) b!22983))

(assert (= (and b!22986 c!2904) b!22987))

(assert (= (and b!22986 (not c!2904)) b!22984))

(assert (= (and b!22987 res!14284) b!23005))

(assert (= (and b!23005 res!14279) b!22978))

(assert (= (and b!22984 c!2908) b!23000))

(assert (= (and b!22984 (not c!2908)) b!23009))

(assert (= (and b!23000 res!14276) b!23013))

(assert (= (and b!23013 res!14278) b!23008))

(assert (= (or b!22987 b!23000) bm!1823))

(assert (= (or b!22978 b!23008) bm!1841))

(assert (= (or b!22999 bm!1823) bm!1835))

(assert (= (or b!22979 b!22986) bm!1830))

(assert (= (or b!23002 b!22990) bm!1825))

(assert (= (or b!22996 b!22979) bm!1819))

(assert (= (or b!22982 b!22986) bm!1832))

(assert (= (or bm!1821 bm!1835) bm!1840))

(assert (= (or bm!1826 bm!1830) bm!1829))

(assert (= (or b!22993 b!23015) bm!1838))

(assert (= (or bm!1839 bm!1841) bm!1831))

(assert (= (or b!22993 b!23015) bm!1828))

(assert (= (and bm!1828 c!2911) b!23012))

(assert (= (and bm!1828 (not c!2911)) b!23007))

(assert (= (or bm!1833 bm!1838) bm!1822))

(assert (= (or bm!1837 b!23015) bm!1836))

(assert (= (or bm!1827 b!23015) bm!1824))

(assert (= (and d!3945 res!14275) b!22991))

(assert (= (and b!22991 c!2913) b!23003))

(assert (= (and b!22991 (not c!2913)) b!23001))

(assert (= (and b!23003 res!14273) b!23017))

(assert (= (or b!23003 b!23017 b!23001) bm!1818))

(assert (= (or b!23017 b!23001) bm!1834))

(declare-fun m!16584 () Bool)

(assert (=> bm!1825 m!16584))

(declare-fun m!16586 () Bool)

(assert (=> bm!1840 m!16586))

(declare-fun m!16588 () Bool)

(assert (=> b!23017 m!16588))

(declare-fun m!16590 () Bool)

(assert (=> bm!1822 m!16590))

(declare-fun m!16592 () Bool)

(assert (=> bm!1822 m!16592))

(declare-fun m!16594 () Bool)

(assert (=> b!23016 m!16594))

(declare-fun m!16596 () Bool)

(assert (=> b!22983 m!16596))

(declare-fun m!16598 () Bool)

(assert (=> bm!1819 m!16598))

(declare-fun m!16600 () Bool)

(assert (=> b!23015 m!16600))

(assert (=> b!23015 m!16590))

(declare-fun m!16602 () Bool)

(assert (=> b!23015 m!16602))

(declare-fun m!16604 () Bool)

(assert (=> b!23015 m!16604))

(declare-fun m!16606 () Bool)

(assert (=> bm!1828 m!16606))

(declare-fun m!16608 () Bool)

(assert (=> bm!1828 m!16608))

(declare-fun m!16610 () Bool)

(assert (=> bm!1824 m!16610))

(declare-fun m!16612 () Bool)

(assert (=> bm!1834 m!16612))

(declare-fun m!16614 () Bool)

(assert (=> bm!1829 m!16614))

(declare-fun m!16616 () Bool)

(assert (=> b!22988 m!16616))

(declare-fun m!16618 () Bool)

(assert (=> b!23005 m!16618))

(declare-fun m!16620 () Bool)

(assert (=> bm!1831 m!16620))

(declare-fun m!16622 () Bool)

(assert (=> bm!1832 m!16622))

(declare-fun m!16624 () Bool)

(assert (=> b!23006 m!16624))

(assert (=> b!22994 m!16614))

(declare-fun m!16626 () Bool)

(assert (=> d!3945 m!16626))

(declare-fun m!16628 () Bool)

(assert (=> d!3945 m!16628))

(declare-fun m!16630 () Bool)

(assert (=> b!22995 m!16630))

(declare-fun m!16632 () Bool)

(assert (=> b!23007 m!16632))

(declare-fun m!16634 () Bool)

(assert (=> bm!1836 m!16634))

(declare-fun m!16636 () Bool)

(assert (=> b!23003 m!16636))

(declare-fun m!16638 () Bool)

(assert (=> b!23011 m!16638))

(declare-fun m!16640 () Bool)

(assert (=> bm!1818 m!16640))

(declare-fun m!16642 () Bool)

(assert (=> b!23013 m!16642))

(assert (=> b!22760 d!3945))

(declare-fun b!23030 () Bool)

(declare-fun e!14955 () Unit!511)

(declare-fun Unit!517 () Unit!511)

(assert (=> b!23030 (= e!14955 Unit!517)))

(declare-fun lt!8099 () tuple2!956)

(declare-fun lt!8121 () LongMapFixedSize!202)

(declare-fun head!827 (List!562) tuple2!956)

(assert (=> b!23030 (= lt!8099 (head!827 (toList!296 (map!405 lt!8121))))))

(declare-fun lt!8104 () array!1247)

(assert (=> b!23030 (= lt!8104 (array!1248 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!8108 () (_ BitVec 32))

(assert (=> b!23030 (= lt!8108 #b00000000000000000000000000000000)))

(declare-fun lt!8100 () Unit!511)

(declare-fun lemmaKeyInListMapIsInArray!96 (array!1247 array!1249 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 64) Int) Unit!511)

(declare-fun dynLambda!139 (Int (_ BitVec 64)) V!1179)

(assert (=> b!23030 (= lt!8100 (lemmaKeyInListMapIsInArray!96 lt!8104 (array!1250 ((as const (Array (_ BitVec 32) ValueCell!308)) EmptyCell!308) (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) lt!8108 (dynLambda!139 (defaultEntry!1738 (v!1595 (underlying!112 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!139 (defaultEntry!1738 (v!1595 (underlying!112 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!487 lt!8099) (defaultEntry!1738 (v!1595 (underlying!112 thiss!938)))))))

(declare-fun c!2921 () Bool)

(assert (=> b!23030 (= c!2921 (and (not (= (_1!487 lt!8099) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!487 lt!8099) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!14957 () Bool)

(assert (=> b!23030 e!14957))

(declare-fun lt!8120 () Unit!511)

(assert (=> b!23030 (= lt!8120 lt!8100)))

(declare-fun lt!8115 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1247 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!23030 (= lt!8115 (arrayScanForKey!0 (array!1248 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)) (_1!487 lt!8099) #b00000000000000000000000000000000))))

(assert (=> b!23030 false))

(declare-fun b!23032 () Bool)

(declare-fun res!14290 () Bool)

(declare-fun e!14956 () Bool)

(assert (=> b!23032 (=> (not res!14290) (not e!14956))))

(declare-fun lt!8107 () LongMapFixedSize!202)

(assert (=> b!23032 (= res!14290 (= (mask!4722 lt!8107) (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938))))))))

(declare-fun b!23033 () Bool)

(assert (=> b!23033 (= e!14957 (arrayContainsKey!0 lt!8104 (_1!487 lt!8099) #b00000000000000000000000000000000))))

(declare-fun b!23031 () Bool)

(assert (=> b!23031 (= e!14956 (= (map!405 lt!8107) (ListLongMap!562 Nil!559)))))

(declare-fun d!3947 () Bool)

(assert (=> d!3947 e!14956))

(declare-fun res!14289 () Bool)

(assert (=> d!3947 (=> (not res!14289) (not e!14956))))

(assert (=> d!3947 (= res!14289 (valid!118 lt!8107))))

(assert (=> d!3947 (= lt!8107 lt!8121)))

(declare-fun lt!8116 () Unit!511)

(assert (=> d!3947 (= lt!8116 e!14955)))

(declare-fun c!2920 () Bool)

(assert (=> d!3947 (= c!2920 (not (= (map!405 lt!8121) (ListLongMap!562 Nil!559))))))

(declare-fun lt!8109 () Unit!511)

(declare-fun lt!8101 () Unit!511)

(assert (=> d!3947 (= lt!8109 lt!8101)))

(declare-fun lt!8106 () array!1247)

(declare-fun lt!8103 () (_ BitVec 32))

(declare-datatypes ((List!563 0))(
  ( (Nil!560) (Cons!559 (h!1125 (_ BitVec 64)) (t!3226 List!563)) )
))
(declare-fun lt!8111 () List!563)

(declare-fun arrayNoDuplicates!0 (array!1247 (_ BitVec 32) List!563) Bool)

(assert (=> d!3947 (arrayNoDuplicates!0 lt!8106 lt!8103 lt!8111)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1247 (_ BitVec 32) (_ BitVec 32) List!563) Unit!511)

(assert (=> d!3947 (= lt!8101 (lemmaArrayNoDuplicatesInAll0Array!0 lt!8106 lt!8103 (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001) lt!8111))))

(assert (=> d!3947 (= lt!8111 Nil!560)))

(assert (=> d!3947 (= lt!8103 #b00000000000000000000000000000000)))

(assert (=> d!3947 (= lt!8106 (array!1248 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!8105 () Unit!511)

(declare-fun lt!8110 () Unit!511)

(assert (=> d!3947 (= lt!8105 lt!8110)))

(declare-fun lt!8102 () (_ BitVec 32))

(declare-fun lt!8117 () array!1247)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1247 (_ BitVec 32)) Bool)

(assert (=> d!3947 (arrayForallSeekEntryOrOpenFound!0 lt!8102 lt!8117 (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1247 (_ BitVec 32) (_ BitVec 32)) Unit!511)

(assert (=> d!3947 (= lt!8110 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!8117 (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) lt!8102))))

(assert (=> d!3947 (= lt!8102 #b00000000000000000000000000000000)))

(assert (=> d!3947 (= lt!8117 (array!1248 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!8118 () Unit!511)

(declare-fun lt!8112 () Unit!511)

(assert (=> d!3947 (= lt!8118 lt!8112)))

(declare-fun lt!8113 () array!1247)

(declare-fun lt!8114 () (_ BitVec 32))

(declare-fun lt!8119 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1247 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3947 (= (arrayCountValidKeys!0 lt!8113 lt!8114 lt!8119) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1247 (_ BitVec 32) (_ BitVec 32)) Unit!511)

(assert (=> d!3947 (= lt!8112 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!8113 lt!8114 lt!8119))))

(assert (=> d!3947 (= lt!8119 (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3947 (= lt!8114 #b00000000000000000000000000000000)))

(assert (=> d!3947 (= lt!8113 (array!1248 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3947 (= lt!8121 (LongMapFixedSize!203 (defaultEntry!1738 (v!1595 (underlying!112 thiss!938))) (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!139 (defaultEntry!1738 (v!1595 (underlying!112 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!139 (defaultEntry!1738 (v!1595 (underlying!112 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1248 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)) (array!1250 ((as const (Array (_ BitVec 32) ValueCell!308)) EmptyCell!308) (bvadd (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3947 (validMask!0 (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))))))

(assert (=> d!3947 (= (getNewLongMapFixedSize!34 (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) (defaultEntry!1738 (v!1595 (underlying!112 thiss!938)))) lt!8107)))

(declare-fun b!23034 () Bool)

(assert (=> b!23034 (= e!14957 (ite (= (_1!487 lt!8099) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!8108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!8108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!23035 () Bool)

(declare-fun Unit!518 () Unit!511)

(assert (=> b!23035 (= e!14955 Unit!518)))

(assert (= (and d!3947 c!2920) b!23030))

(assert (= (and d!3947 (not c!2920)) b!23035))

(assert (= (and b!23030 c!2921) b!23033))

(assert (= (and b!23030 (not c!2921)) b!23034))

(assert (= (and d!3947 res!14289) b!23032))

(assert (= (and b!23032 res!14290) b!23031))

(declare-fun b_lambda!1555 () Bool)

(assert (=> (not b_lambda!1555) (not b!23030)))

(declare-fun t!3224 () Bool)

(declare-fun tb!649 () Bool)

(assert (=> (and b!22769 (= (defaultEntry!1738 (v!1595 (underlying!112 thiss!938))) (defaultEntry!1738 (v!1595 (underlying!112 thiss!938)))) t!3224) tb!649))

(declare-fun result!1081 () Bool)

(assert (=> tb!649 (= result!1081 tp_is_empty!1015)))

(assert (=> b!23030 t!3224))

(declare-fun b_and!1469 () Bool)

(assert (= b_and!1463 (and (=> t!3224 result!1081) b_and!1469)))

(declare-fun b_lambda!1557 () Bool)

(assert (=> (not b_lambda!1557) (not d!3947)))

(assert (=> d!3947 t!3224))

(declare-fun b_and!1471 () Bool)

(assert (= b_and!1469 (and (=> t!3224 result!1081) b_and!1471)))

(declare-fun m!16644 () Bool)

(assert (=> b!23030 m!16644))

(declare-fun m!16646 () Bool)

(assert (=> b!23030 m!16646))

(declare-fun m!16648 () Bool)

(assert (=> b!23030 m!16648))

(assert (=> b!23030 m!16468))

(declare-fun m!16650 () Bool)

(assert (=> b!23030 m!16650))

(assert (=> b!23030 m!16650))

(declare-fun m!16652 () Bool)

(assert (=> b!23030 m!16652))

(assert (=> b!23030 m!16650))

(declare-fun m!16654 () Bool)

(assert (=> b!23033 m!16654))

(declare-fun m!16656 () Bool)

(assert (=> b!23031 m!16656))

(declare-fun m!16658 () Bool)

(assert (=> d!3947 m!16658))

(assert (=> d!3947 m!16468))

(declare-fun m!16660 () Bool)

(assert (=> d!3947 m!16660))

(declare-fun m!16662 () Bool)

(assert (=> d!3947 m!16662))

(assert (=> d!3947 m!16648))

(declare-fun m!16664 () Bool)

(assert (=> d!3947 m!16664))

(declare-fun m!16666 () Bool)

(assert (=> d!3947 m!16666))

(assert (=> d!3947 m!16468))

(declare-fun m!16668 () Bool)

(assert (=> d!3947 m!16668))

(assert (=> d!3947 m!16468))

(declare-fun m!16670 () Bool)

(assert (=> d!3947 m!16670))

(declare-fun m!16672 () Bool)

(assert (=> d!3947 m!16672))

(assert (=> d!3947 m!16650))

(assert (=> b!22764 d!3947))

(declare-fun d!3949 () Bool)

(declare-fun e!14963 () Bool)

(assert (=> d!3949 e!14963))

(declare-fun res!14293 () Bool)

(assert (=> d!3949 (=> (not res!14293) (not e!14963))))

(declare-fun lt!8126 () (_ BitVec 32))

(assert (=> d!3949 (= res!14293 (validMask!0 lt!8126))))

(declare-datatypes ((tuple2!958 0))(
  ( (tuple2!959 (_1!488 Unit!511) (_2!488 (_ BitVec 32))) )
))
(declare-fun e!14962 () tuple2!958)

(assert (=> d!3949 (= lt!8126 (_2!488 e!14962))))

(declare-fun c!2924 () Bool)

(declare-fun lt!8127 () tuple2!958)

(assert (=> d!3949 (= c!2924 (and (bvsgt (_2!488 lt!8127) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!145 (v!1595 (underlying!112 thiss!938)))) (_2!488 lt!8127)) (bvsge (bvadd (bvand (bvashr (_2!488 lt!8127) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!145 (v!1595 (underlying!112 thiss!938))))))))

(declare-fun Unit!519 () Unit!511)

(declare-fun Unit!520 () Unit!511)

(assert (=> d!3949 (= lt!8127 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!145 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))))) (mask!4722 (v!1595 (underlying!112 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!145 (v!1595 (underlying!112 thiss!938)))) (mask!4722 (v!1595 (underlying!112 thiss!938))))) (tuple2!959 Unit!519 (bvand (bvadd (bvshl (mask!4722 (v!1595 (underlying!112 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!959 Unit!520 (mask!4722 (v!1595 (underlying!112 thiss!938))))))))

(assert (=> d!3949 (validMask!0 (mask!4722 (v!1595 (underlying!112 thiss!938))))))

(assert (=> d!3949 (= (computeNewMask!29 thiss!938 (mask!4722 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (_size!145 (v!1595 (underlying!112 thiss!938)))) lt!8126)))

(declare-fun b!23044 () Bool)

(declare-fun computeNewMaskWhile!13 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!958)

(assert (=> b!23044 (= e!14962 (computeNewMaskWhile!13 (_size!145 (v!1595 (underlying!112 thiss!938))) (_vacant!145 (v!1595 (underlying!112 thiss!938))) (mask!4722 (v!1595 (underlying!112 thiss!938))) (_2!488 lt!8127)))))

(declare-fun b!23045 () Bool)

(declare-fun Unit!521 () Unit!511)

(assert (=> b!23045 (= e!14962 (tuple2!959 Unit!521 (_2!488 lt!8127)))))

(declare-fun b!23046 () Bool)

(assert (=> b!23046 (= e!14963 (bvsle (_size!145 (v!1595 (underlying!112 thiss!938))) (bvadd lt!8126 #b00000000000000000000000000000001)))))

(assert (= (and d!3949 c!2924) b!23044))

(assert (= (and d!3949 (not c!2924)) b!23045))

(assert (= (and d!3949 res!14293) b!23046))

(declare-fun m!16674 () Bool)

(assert (=> d!3949 m!16674))

(assert (=> d!3949 m!16476))

(declare-fun m!16676 () Bool)

(assert (=> b!23044 m!16676))

(assert (=> b!22764 d!3949))

(declare-fun b!23054 () Bool)

(declare-fun e!14968 () Bool)

(assert (=> b!23054 (= e!14968 tp_is_empty!1015)))

(declare-fun condMapEmpty!1019 () Bool)

(declare-fun mapDefault!1019 () ValueCell!308)

(assert (=> mapNonEmpty!1010 (= condMapEmpty!1019 (= mapRest!1010 ((as const (Array (_ BitVec 32) ValueCell!308)) mapDefault!1019)))))

(declare-fun mapRes!1019 () Bool)

(assert (=> mapNonEmpty!1010 (= tp!3496 (and e!14968 mapRes!1019))))

(declare-fun mapIsEmpty!1019 () Bool)

(assert (=> mapIsEmpty!1019 mapRes!1019))

(declare-fun b!23053 () Bool)

(declare-fun e!14969 () Bool)

(assert (=> b!23053 (= e!14969 tp_is_empty!1015)))

(declare-fun mapNonEmpty!1019 () Bool)

(declare-fun tp!3512 () Bool)

(assert (=> mapNonEmpty!1019 (= mapRes!1019 (and tp!3512 e!14969))))

(declare-fun mapRest!1019 () (Array (_ BitVec 32) ValueCell!308))

(declare-fun mapKey!1019 () (_ BitVec 32))

(declare-fun mapValue!1019 () ValueCell!308)

(assert (=> mapNonEmpty!1019 (= mapRest!1010 (store mapRest!1019 mapKey!1019 mapValue!1019))))

(assert (= (and mapNonEmpty!1010 condMapEmpty!1019) mapIsEmpty!1019))

(assert (= (and mapNonEmpty!1010 (not condMapEmpty!1019)) mapNonEmpty!1019))

(assert (= (and mapNonEmpty!1019 ((_ is ValueCellFull!308) mapValue!1019)) b!23053))

(assert (= (and mapNonEmpty!1010 ((_ is ValueCellFull!308) mapDefault!1019)) b!23054))

(declare-fun m!16678 () Bool)

(assert (=> mapNonEmpty!1019 m!16678))

(declare-fun b_lambda!1559 () Bool)

(assert (= b_lambda!1555 (or (and b!22769 b_free!751) b_lambda!1559)))

(declare-fun b_lambda!1561 () Bool)

(assert (= b_lambda!1557 (or (and b!22769 b_free!751) b_lambda!1561)))

(check-sat (not bm!1832) (not b!22967) b_and!1471 (not b!22994) (not bm!1795) (not mapNonEmpty!1019) (not b!22971) (not b_next!751) (not d!3947) (not b!22975) (not b!22977) (not b_lambda!1561) (not b!23044) (not b!23033) (not bm!1825) (not bm!1816) (not bm!1798) (not b!23007) (not d!3949) (not b_lambda!1559) (not b!22988) (not bm!1818) (not b!23015) (not b!23011) (not bm!1808) (not bm!1824) (not bm!1812) (not bm!1800) (not bm!1822) (not bm!1805) (not b!23017) (not b!22963) (not d!3935) (not bm!1828) (not bm!1836) (not bm!1819) tp_is_empty!1015 (not d!3937) (not bm!1801) (not bm!1807) (not bm!1810) (not b!23003) (not b!22948) (not bm!1794) (not d!3945) (not bm!1834) (not bm!1831) (not b!23031) (not bm!1840) (not b!23030) (not bm!1829) (not bm!1804) (not b!22954))
(check-sat b_and!1471 (not b_next!751))
