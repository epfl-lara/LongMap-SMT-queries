; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3462 () Bool)

(assert start!3462)

(declare-fun b!22745 () Bool)

(declare-fun b_free!751 () Bool)

(declare-fun b_next!751 () Bool)

(assert (=> b!22745 (= b_free!751 (not b_next!751))))

(declare-fun tp!3496 () Bool)

(declare-fun b_and!1463 () Bool)

(assert (=> b!22745 (= tp!3496 b_and!1463)))

(declare-fun b!22736 () Bool)

(declare-fun c!2837 () Bool)

(declare-datatypes ((V!1179 0))(
  ( (V!1180 (val!534 Int)) )
))
(declare-datatypes ((ValueCell!308 0))(
  ( (ValueCellFull!308 (v!1593 V!1179)) (EmptyCell!308) )
))
(declare-datatypes ((array!1247 0))(
  ( (array!1248 (arr!590 (Array (_ BitVec 32) ValueCell!308)) (size!686 (_ BitVec 32))) )
))
(declare-datatypes ((array!1249 0))(
  ( (array!1250 (arr!591 (Array (_ BitVec 32) (_ BitVec 64))) (size!687 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!202 0))(
  ( (LongMapFixedSize!203 (defaultEntry!1738 Int) (mask!4722 (_ BitVec 32)) (extraKeys!1637 (_ BitVec 32)) (zeroValue!1662 V!1179) (minValue!1662 V!1179) (_size!145 (_ BitVec 32)) (_keys!3160 array!1249) (_values!1725 array!1247) (_vacant!145 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!202 0))(
  ( (Cell!203 (v!1594 LongMapFixedSize!202)) )
))
(declare-datatypes ((LongMap!202 0))(
  ( (LongMap!203 (underlying!112 Cell!202)) )
))
(declare-fun thiss!938 () LongMap!202)

(declare-fun lt!7899 () Bool)

(assert (=> b!22736 (= c!2837 (and (not (= (bvand (extraKeys!1637 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7899))))

(declare-datatypes ((tuple2!942 0))(
  ( (tuple2!943 (_1!479 Bool) (_2!479 Cell!202)) )
))
(declare-fun e!14771 () tuple2!942)

(declare-fun e!14768 () tuple2!942)

(assert (=> b!22736 (= e!14771 e!14768)))

(declare-fun res!14206 () Bool)

(declare-fun e!14766 () Bool)

(assert (=> start!3462 (=> (not res!14206) (not e!14766))))

(declare-fun valid!111 (LongMap!202) Bool)

(assert (=> start!3462 (= res!14206 (valid!111 thiss!938))))

(assert (=> start!3462 e!14766))

(declare-fun e!14765 () Bool)

(assert (=> start!3462 e!14765))

(declare-fun b!22737 () Bool)

(declare-fun e!14774 () Bool)

(declare-fun e!14767 () Bool)

(assert (=> b!22737 (= e!14774 e!14767)))

(declare-fun b!22738 () Bool)

(declare-fun e!14769 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!22738 (= e!14769 (not (validMask!0 (mask!4722 (v!1594 (underlying!112 thiss!938))))))))

(declare-fun b!22739 () Bool)

(assert (=> b!22739 (= e!14765 e!14774)))

(declare-fun bm!1732 () Bool)

(declare-datatypes ((tuple2!944 0))(
  ( (tuple2!945 (_1!480 Bool) (_2!480 LongMapFixedSize!202)) )
))
(declare-fun call!1735 () tuple2!944)

(declare-fun call!1736 () tuple2!944)

(assert (=> bm!1732 (= call!1735 call!1736)))

(declare-fun b!22740 () Bool)

(declare-fun lt!7902 () LongMapFixedSize!202)

(assert (=> b!22740 (= e!14768 (tuple2!943 true (Cell!203 lt!7902)))))

(declare-fun lt!7904 () tuple2!944)

(declare-fun bm!1733 () Bool)

(declare-fun c!2836 () Bool)

(declare-fun c!2838 () Bool)

(declare-fun update!35 (LongMapFixedSize!202 (_ BitVec 64) V!1179) tuple2!944)

(assert (=> bm!1733 (= call!1736 (update!35 (ite c!2838 (_2!480 lt!7904) lt!7902) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938)))))))))

(declare-fun mapNonEmpty!1010 () Bool)

(declare-fun mapRes!1010 () Bool)

(declare-fun tp!3497 () Bool)

(declare-fun e!14764 () Bool)

(assert (=> mapNonEmpty!1010 (= mapRes!1010 (and tp!3497 e!14764))))

(declare-fun mapKey!1010 () (_ BitVec 32))

(declare-fun mapRest!1010 () (Array (_ BitVec 32) ValueCell!308))

(declare-fun mapValue!1010 () ValueCell!308)

(assert (=> mapNonEmpty!1010 (= (arr!590 (_values!1725 (v!1594 (underlying!112 thiss!938)))) (store mapRest!1010 mapKey!1010 mapValue!1010))))

(declare-fun b!22741 () Bool)

(declare-fun lt!7901 () tuple2!944)

(assert (=> b!22741 (= lt!7901 call!1735)))

(assert (=> b!22741 (= e!14771 (tuple2!943 (_1!480 lt!7901) (Cell!203 (_2!480 lt!7901))))))

(declare-fun b!22742 () Bool)

(declare-fun tp_is_empty!1015 () Bool)

(assert (=> b!22742 (= e!14764 tp_is_empty!1015)))

(declare-fun b!22743 () Bool)

(declare-fun lt!7900 () tuple2!944)

(assert (=> b!22743 (= e!14768 (tuple2!943 (_1!480 lt!7900) (Cell!203 (_2!480 lt!7900))))))

(assert (=> b!22743 (= lt!7900 call!1735)))

(declare-fun b!22744 () Bool)

(assert (=> b!22744 (= e!14766 e!14769)))

(declare-fun res!14205 () Bool)

(assert (=> b!22744 (=> (not res!14205) (not e!14769))))

(declare-fun e!14775 () tuple2!942)

(assert (=> b!22744 (= res!14205 (_1!479 e!14775))))

(assert (=> b!22744 (= c!2838 (and (not lt!7899) (not (= (bvand (extraKeys!1637 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22744 (= lt!7899 (= (bvand (extraKeys!1637 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!31 ((_ BitVec 32) Int) LongMapFixedSize!202)

(declare-fun computeNewMask!28 (LongMap!202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22744 (= lt!7902 (getNewLongMapFixedSize!31 (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) (defaultEntry!1738 (v!1594 (underlying!112 thiss!938)))))))

(declare-fun mapIsEmpty!1010 () Bool)

(assert (=> mapIsEmpty!1010 mapRes!1010))

(declare-fun e!14772 () Bool)

(declare-fun array_inv!415 (array!1249) Bool)

(declare-fun array_inv!416 (array!1247) Bool)

(assert (=> b!22745 (= e!14767 (and tp!3496 tp_is_empty!1015 (array_inv!415 (_keys!3160 (v!1594 (underlying!112 thiss!938)))) (array_inv!416 (_values!1725 (v!1594 (underlying!112 thiss!938)))) e!14772))))

(declare-fun b!22746 () Bool)

(declare-fun lt!7903 () tuple2!944)

(assert (=> b!22746 (= e!14775 (tuple2!943 (and (_1!480 lt!7904) (_1!480 lt!7903)) (Cell!203 (_2!480 lt!7903))))))

(assert (=> b!22746 (= lt!7904 (update!35 lt!7902 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1594 (underlying!112 thiss!938)))))))

(assert (=> b!22746 (= lt!7903 call!1736)))

(declare-fun b!22747 () Bool)

(declare-fun e!14770 () Bool)

(assert (=> b!22747 (= e!14770 tp_is_empty!1015)))

(declare-fun b!22748 () Bool)

(assert (=> b!22748 (= e!14772 (and e!14770 mapRes!1010))))

(declare-fun condMapEmpty!1010 () Bool)

(declare-fun mapDefault!1010 () ValueCell!308)

(assert (=> b!22748 (= condMapEmpty!1010 (= (arr!590 (_values!1725 (v!1594 (underlying!112 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!308)) mapDefault!1010)))))

(declare-fun b!22749 () Bool)

(assert (=> b!22749 (= e!14775 e!14771)))

(assert (=> b!22749 (= c!2836 (and (not lt!7899) (= (bvand (extraKeys!1637 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!3462 res!14206) b!22744))

(assert (= (and b!22744 c!2838) b!22746))

(assert (= (and b!22744 (not c!2838)) b!22749))

(assert (= (and b!22749 c!2836) b!22741))

(assert (= (and b!22749 (not c!2836)) b!22736))

(assert (= (and b!22736 c!2837) b!22743))

(assert (= (and b!22736 (not c!2837)) b!22740))

(assert (= (or b!22741 b!22743) bm!1732))

(assert (= (or b!22746 bm!1732) bm!1733))

(assert (= (and b!22744 res!14205) b!22738))

(assert (= (and b!22748 condMapEmpty!1010) mapIsEmpty!1010))

(assert (= (and b!22748 (not condMapEmpty!1010)) mapNonEmpty!1010))

(get-info :version)

(assert (= (and mapNonEmpty!1010 ((_ is ValueCellFull!308) mapValue!1010)) b!22742))

(assert (= (and b!22748 ((_ is ValueCellFull!308) mapDefault!1010)) b!22747))

(assert (= b!22745 b!22748))

(assert (= b!22737 b!22745))

(assert (= b!22739 b!22737))

(assert (= start!3462 b!22739))

(declare-fun m!16450 () Bool)

(assert (=> b!22746 m!16450))

(declare-fun m!16452 () Bool)

(assert (=> mapNonEmpty!1010 m!16452))

(declare-fun m!16454 () Bool)

(assert (=> b!22738 m!16454))

(declare-fun m!16456 () Bool)

(assert (=> b!22744 m!16456))

(assert (=> b!22744 m!16456))

(declare-fun m!16458 () Bool)

(assert (=> b!22744 m!16458))

(declare-fun m!16460 () Bool)

(assert (=> start!3462 m!16460))

(declare-fun m!16462 () Bool)

(assert (=> bm!1733 m!16462))

(declare-fun m!16464 () Bool)

(assert (=> b!22745 m!16464))

(declare-fun m!16466 () Bool)

(assert (=> b!22745 m!16466))

(check-sat (not b!22745) (not bm!1733) (not start!3462) b_and!1463 tp_is_empty!1015 (not b_next!751) (not b!22746) (not b!22744) (not b!22738) (not mapNonEmpty!1010))
(check-sat b_and!1463 (not b_next!751))
(get-model)

(declare-fun bm!1794 () Bool)

(declare-datatypes ((SeekEntryResult!54 0))(
  ( (MissingZero!54 (index!2337 (_ BitVec 32))) (Found!54 (index!2338 (_ BitVec 32))) (Intermediate!54 (undefined!866 Bool) (index!2339 (_ BitVec 32)) (x!5504 (_ BitVec 32))) (Undefined!54) (MissingVacant!54 (index!2340 (_ BitVec 32))) )
))
(declare-fun call!1812 () SeekEntryResult!54)

(declare-fun call!1803 () SeekEntryResult!54)

(assert (=> bm!1794 (= call!1812 call!1803)))

(declare-fun call!1801 () tuple2!944)

(declare-fun lt!8008 () SeekEntryResult!54)

(declare-fun c!2884 () Bool)

(declare-fun bm!1795 () Bool)

(declare-fun updateHelperNewKey!9 (LongMapFixedSize!202 (_ BitVec 64) V!1179 (_ BitVec 32)) tuple2!944)

(assert (=> bm!1795 (= call!1801 (updateHelperNewKey!9 lt!7902 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2884 (index!2340 lt!8008) (index!2337 lt!8008))))))

(declare-fun b!22910 () Bool)

(declare-fun e!14896 () tuple2!944)

(declare-fun e!14894 () tuple2!944)

(assert (=> b!22910 (= e!14896 e!14894)))

(declare-fun c!2889 () Bool)

(assert (=> b!22910 (= c!2889 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1796 () Bool)

(declare-datatypes ((tuple2!954 0))(
  ( (tuple2!955 (_1!485 (_ BitVec 64)) (_2!485 V!1179)) )
))
(declare-datatypes ((List!563 0))(
  ( (Nil!560) (Cons!559 (h!1125 tuple2!954) (t!3225 List!563)) )
))
(declare-datatypes ((ListLongMap!563 0))(
  ( (ListLongMap!564 (toList!297 List!563)) )
))
(declare-fun call!1815 () ListLongMap!563)

(declare-fun map!405 (LongMapFixedSize!202) ListLongMap!563)

(assert (=> bm!1796 (= call!1815 (map!405 lt!7902))))

(declare-fun b!22911 () Bool)

(declare-fun e!14898 () Bool)

(declare-fun call!1816 () Bool)

(assert (=> b!22911 (= e!14898 (not call!1816))))

(declare-fun bm!1797 () Bool)

(declare-fun call!1810 () ListLongMap!563)

(declare-fun call!1804 () ListLongMap!563)

(assert (=> bm!1797 (= call!1810 call!1804)))

(declare-fun bm!1798 () Bool)

(declare-fun call!1799 () Bool)

(declare-fun call!1800 () Bool)

(assert (=> bm!1798 (= call!1799 call!1800)))

(declare-fun bm!1799 () Bool)

(declare-fun call!1807 () ListLongMap!563)

(declare-fun lt!7996 () (_ BitVec 32))

(declare-fun c!2888 () Bool)

(declare-fun lt!7999 () (_ BitVec 32))

(declare-fun getCurrentListMap!128 (array!1249 array!1247 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 32) Int) ListLongMap!563)

(assert (=> bm!1799 (= call!1807 (getCurrentListMap!128 (_keys!3160 lt!7902) (ite c!2888 (_values!1725 lt!7902) (array!1248 (store (arr!590 (_values!1725 lt!7902)) (index!2338 lt!8008) (ValueCellFull!308 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))))) (size!686 (_values!1725 lt!7902)))) (mask!4722 lt!7902) (ite c!2888 (ite c!2889 lt!7999 lt!7996) (extraKeys!1637 lt!7902)) (ite (and c!2888 c!2889) (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (zeroValue!1662 lt!7902)) (ite c!2888 (ite c!2889 (minValue!1662 lt!7902) (zeroValue!1662 (v!1594 (underlying!112 thiss!938)))) (minValue!1662 lt!7902)) #b00000000000000000000000000000000 (defaultEntry!1738 lt!7902)))))

(declare-fun b!22912 () Bool)

(declare-fun e!14899 () Bool)

(declare-fun e!14906 () Bool)

(assert (=> b!22912 (= e!14899 e!14906)))

(declare-fun c!2881 () Bool)

(declare-fun lt!8010 () tuple2!944)

(assert (=> b!22912 (= c!2881 (_1!480 lt!8010))))

(declare-fun b!22913 () Bool)

(declare-fun res!14251 () Bool)

(declare-fun e!14907 () Bool)

(assert (=> b!22913 (=> (not res!14251) (not e!14907))))

(declare-fun call!1813 () Bool)

(assert (=> b!22913 (= res!14251 call!1813)))

(declare-fun e!14905 () Bool)

(assert (=> b!22913 (= e!14905 e!14907)))

(declare-fun bm!1800 () Bool)

(assert (=> bm!1800 (= call!1816 call!1800)))

(declare-fun bm!1801 () Bool)

(declare-fun call!1808 () Bool)

(assert (=> bm!1801 (= call!1813 call!1808)))

(declare-fun b!22914 () Bool)

(declare-fun e!14903 () tuple2!944)

(declare-fun lt!7998 () tuple2!944)

(assert (=> b!22914 (= e!14903 (tuple2!945 (_1!480 lt!7998) (_2!480 lt!7998)))))

(assert (=> b!22914 (= lt!7998 call!1801)))

(declare-fun b!22915 () Bool)

(declare-fun e!14888 () Bool)

(assert (=> b!22915 (= e!14888 (not call!1816))))

(declare-fun bm!1802 () Bool)

(declare-fun call!1814 () Bool)

(declare-fun call!1797 () Bool)

(assert (=> bm!1802 (= call!1814 call!1797)))

(declare-fun b!22916 () Bool)

(declare-fun e!14890 () Bool)

(declare-fun lt!8019 () SeekEntryResult!54)

(assert (=> b!22916 (= e!14890 ((_ is Undefined!54) lt!8019))))

(declare-fun b!22917 () Bool)

(declare-fun res!14260 () Bool)

(assert (=> b!22917 (=> (not res!14260) (not e!14888))))

(assert (=> b!22917 (= res!14260 call!1814)))

(declare-fun e!14900 () Bool)

(assert (=> b!22917 (= e!14900 e!14888)))

(declare-fun b!22918 () Bool)

(declare-fun e!14893 () Bool)

(assert (=> b!22918 (= e!14893 e!14898)))

(declare-fun res!14258 () Bool)

(assert (=> b!22918 (= res!14258 call!1814)))

(assert (=> b!22918 (=> (not res!14258) (not e!14898))))

(declare-fun e!14895 () Bool)

(declare-fun b!22919 () Bool)

(declare-fun call!1798 () ListLongMap!563)

(declare-fun +!44 (ListLongMap!563 tuple2!954) ListLongMap!563)

(assert (=> b!22919 (= e!14895 (= call!1798 (+!44 call!1815 (tuple2!955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1594 (underlying!112 thiss!938)))))))))

(declare-fun bm!1803 () Bool)

(declare-fun call!1817 () Bool)

(assert (=> bm!1803 (= call!1797 call!1817)))

(declare-fun bm!1804 () Bool)

(declare-fun c!2882 () Bool)

(declare-fun call!1805 () ListLongMap!563)

(declare-fun call!1802 () Bool)

(declare-fun contains!229 (ListLongMap!563 (_ BitVec 64)) Bool)

(assert (=> bm!1804 (= call!1802 (contains!229 call!1805 (ite c!2882 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!591 (_keys!3160 lt!7902)) (index!2338 lt!8008)))))))

(declare-fun b!22920 () Bool)

(declare-fun c!2886 () Bool)

(assert (=> b!22920 (= c!2886 ((_ is MissingVacant!54) lt!8019))))

(assert (=> b!22920 (= e!14905 e!14890)))

(declare-fun b!22921 () Bool)

(declare-fun res!14254 () Bool)

(declare-fun lt!8020 () SeekEntryResult!54)

(assert (=> b!22921 (= res!14254 (= (select (arr!591 (_keys!3160 lt!7902)) (index!2340 lt!8020)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22921 (=> (not res!14254) (not e!14898))))

(declare-fun b!22922 () Bool)

(declare-fun res!14256 () Bool)

(assert (=> b!22922 (= res!14256 (= (select (arr!591 (_keys!3160 lt!7902)) (index!2340 lt!8019)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14902 () Bool)

(assert (=> b!22922 (=> (not res!14256) (not e!14902))))

(declare-fun b!22923 () Bool)

(declare-fun c!2890 () Bool)

(assert (=> b!22923 (= c!2890 ((_ is MissingVacant!54) lt!8020))))

(assert (=> b!22923 (= e!14900 e!14893)))

(declare-fun b!22924 () Bool)

(declare-fun e!14904 () tuple2!944)

(assert (=> b!22924 (= e!14903 e!14904)))

(declare-fun c!2887 () Bool)

(assert (=> b!22924 (= c!2887 ((_ is MissingZero!54) lt!8008))))

(declare-fun b!22925 () Bool)

(declare-fun e!14889 () tuple2!944)

(assert (=> b!22925 (= e!14896 e!14889)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1249 (_ BitVec 32)) SeekEntryResult!54)

(assert (=> b!22925 (= lt!8008 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3160 lt!7902) (mask!4722 lt!7902)))))

(assert (=> b!22925 (= c!2882 ((_ is Undefined!54) lt!8008))))

(declare-fun b!22926 () Bool)

(declare-datatypes ((Unit!508 0))(
  ( (Unit!509) )
))
(declare-fun e!14891 () Unit!508)

(declare-fun Unit!510 () Unit!508)

(assert (=> b!22926 (= e!14891 Unit!510)))

(declare-fun lt!8002 () Unit!508)

(declare-fun call!1820 () Unit!508)

(assert (=> b!22926 (= lt!8002 call!1820)))

(declare-fun lt!8004 () SeekEntryResult!54)

(declare-fun call!1806 () SeekEntryResult!54)

(assert (=> b!22926 (= lt!8004 call!1806)))

(declare-fun res!14253 () Bool)

(assert (=> b!22926 (= res!14253 ((_ is Found!54) lt!8004))))

(declare-fun e!14892 () Bool)

(assert (=> b!22926 (=> (not res!14253) (not e!14892))))

(assert (=> b!22926 e!14892))

(declare-fun lt!8011 () Unit!508)

(assert (=> b!22926 (= lt!8011 lt!8002)))

(assert (=> b!22926 false))

(declare-fun b!22927 () Bool)

(assert (=> b!22927 (= e!14906 e!14895)))

(declare-fun res!14249 () Bool)

(assert (=> b!22927 (= res!14249 (contains!229 call!1798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22927 (=> (not res!14249) (not e!14895))))

(declare-fun bm!1805 () Bool)

(assert (=> bm!1805 (= call!1808 call!1817)))

(declare-fun bm!1806 () Bool)

(declare-fun call!1809 () ListLongMap!563)

(assert (=> bm!1806 (= call!1809 call!1807)))

(declare-fun b!22928 () Bool)

(declare-fun lt!8016 () tuple2!944)

(assert (=> b!22928 (= lt!8016 call!1801)))

(assert (=> b!22928 (= e!14904 (tuple2!945 (_1!480 lt!8016) (_2!480 lt!8016)))))

(declare-fun bm!1807 () Bool)

(declare-fun call!1818 () ListLongMap!563)

(declare-fun call!1811 () ListLongMap!563)

(assert (=> bm!1807 (= call!1818 call!1811)))

(declare-fun lt!8006 () array!1247)

(declare-fun bm!1808 () Bool)

(assert (=> bm!1808 (= call!1805 (getCurrentListMap!128 (_keys!3160 lt!7902) (ite c!2882 (_values!1725 lt!7902) lt!8006) (mask!4722 lt!7902) (extraKeys!1637 lt!7902) (zeroValue!1662 lt!7902) (minValue!1662 lt!7902) #b00000000000000000000000000000000 (defaultEntry!1738 lt!7902)))))

(declare-fun c!2892 () Bool)

(declare-fun c!2885 () Bool)

(declare-fun lt!8018 () SeekEntryResult!54)

(declare-fun bm!1809 () Bool)

(declare-fun c!2883 () Bool)

(declare-fun c!2891 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1809 (= call!1817 (inRange!0 (ite c!2882 (ite c!2885 (index!2338 lt!8004) (ite c!2892 (index!2337 lt!8019) (index!2340 lt!8019))) (ite c!2883 (index!2338 lt!8018) (ite c!2891 (index!2337 lt!8020) (index!2340 lt!8020)))) (mask!4722 lt!7902)))))

(declare-fun bm!1810 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (array!1249 array!1247 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 64) Int) Unit!508)

(assert (=> bm!1810 (= call!1820 (lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (_keys!3160 lt!7902) (_values!1725 lt!7902) (mask!4722 lt!7902) (extraKeys!1637 lt!7902) (zeroValue!1662 lt!7902) (minValue!1662 lt!7902) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1738 lt!7902)))))

(declare-fun b!22929 () Bool)

(declare-fun lt!7997 () Unit!508)

(declare-fun lt!8000 () Unit!508)

(assert (=> b!22929 (= lt!7997 lt!8000)))

(assert (=> b!22929 (= call!1818 call!1809)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (array!1249 array!1247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 V!1179 Int) Unit!508)

(assert (=> b!22929 (= lt!8000 (lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (_keys!3160 lt!7902) (_values!1725 lt!7902) (mask!4722 lt!7902) (extraKeys!1637 lt!7902) lt!7996 (zeroValue!1662 lt!7902) (minValue!1662 lt!7902) (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (defaultEntry!1738 lt!7902)))))

(assert (=> b!22929 (= lt!7996 (bvor (extraKeys!1637 lt!7902) #b00000000000000000000000000000010))))

(assert (=> b!22929 (= e!14894 (tuple2!945 true (LongMapFixedSize!203 (defaultEntry!1738 lt!7902) (mask!4722 lt!7902) (bvor (extraKeys!1637 lt!7902) #b00000000000000000000000000000010) (zeroValue!1662 lt!7902) (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (_size!145 lt!7902) (_keys!3160 lt!7902) (_values!1725 lt!7902) (_vacant!145 lt!7902))))))

(declare-fun b!22930 () Bool)

(declare-fun lt!8021 () Unit!508)

(declare-fun lt!8007 () Unit!508)

(assert (=> b!22930 (= lt!8021 lt!8007)))

(assert (=> b!22930 (= call!1818 call!1809)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!9 (array!1249 array!1247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 V!1179 Int) Unit!508)

(assert (=> b!22930 (= lt!8007 (lemmaChangeZeroKeyThenAddPairToListMap!9 (_keys!3160 lt!7902) (_values!1725 lt!7902) (mask!4722 lt!7902) (extraKeys!1637 lt!7902) lt!7999 (zeroValue!1662 lt!7902) (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 lt!7902) (defaultEntry!1738 lt!7902)))))

(assert (=> b!22930 (= lt!7999 (bvor (extraKeys!1637 lt!7902) #b00000000000000000000000000000001))))

(assert (=> b!22930 (= e!14894 (tuple2!945 true (LongMapFixedSize!203 (defaultEntry!1738 lt!7902) (mask!4722 lt!7902) (bvor (extraKeys!1637 lt!7902) #b00000000000000000000000000000001) (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 lt!7902) (_size!145 lt!7902) (_keys!3160 lt!7902) (_values!1725 lt!7902) (_vacant!145 lt!7902))))))

(declare-fun bm!1811 () Bool)

(assert (=> bm!1811 (= call!1811 (+!44 (ite c!2888 call!1810 call!1804) (ite c!2888 (ite c!2889 (tuple2!955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1594 (underlying!112 thiss!938)))) (tuple2!955 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))))) (tuple2!955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1594 (underlying!112 thiss!938)))))))))

(declare-fun d!3929 () Bool)

(assert (=> d!3929 e!14899))

(declare-fun res!14255 () Bool)

(assert (=> d!3929 (=> (not res!14255) (not e!14899))))

(declare-fun valid!113 (LongMapFixedSize!202) Bool)

(assert (=> d!3929 (= res!14255 (valid!113 (_2!480 lt!8010)))))

(assert (=> d!3929 (= lt!8010 e!14896)))

(assert (=> d!3929 (= c!2888 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3929 (valid!113 lt!7902)))

(assert (=> d!3929 (= (update!35 lt!7902 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1594 (underlying!112 thiss!938)))) lt!8010)))

(declare-fun bm!1812 () Bool)

(assert (=> bm!1812 (= call!1804 (getCurrentListMap!128 (_keys!3160 lt!7902) (_values!1725 lt!7902) (mask!4722 lt!7902) (extraKeys!1637 lt!7902) (zeroValue!1662 lt!7902) (minValue!1662 lt!7902) #b00000000000000000000000000000000 (defaultEntry!1738 lt!7902)))))

(declare-fun b!22931 () Bool)

(assert (=> b!22931 (= e!14893 ((_ is Undefined!54) lt!8020))))

(declare-fun b!22932 () Bool)

(declare-fun res!14257 () Bool)

(assert (=> b!22932 (= res!14257 call!1797)))

(declare-fun e!14901 () Bool)

(assert (=> b!22932 (=> (not res!14257) (not e!14901))))

(declare-fun bm!1813 () Bool)

(assert (=> bm!1813 (= call!1806 call!1803)))

(declare-fun bm!1814 () Bool)

(assert (=> bm!1814 (= call!1798 (map!405 (_2!480 lt!8010)))))

(declare-fun b!22933 () Bool)

(declare-fun e!14897 () Unit!508)

(declare-fun lt!8014 () Unit!508)

(assert (=> b!22933 (= e!14897 lt!8014)))

(assert (=> b!22933 (= lt!8014 call!1820)))

(assert (=> b!22933 (= lt!8018 call!1812)))

(declare-fun res!14250 () Bool)

(assert (=> b!22933 (= res!14250 ((_ is Found!54) lt!8018))))

(assert (=> b!22933 (=> (not res!14250) (not e!14901))))

(assert (=> b!22933 e!14901))

(declare-fun b!22934 () Bool)

(assert (=> b!22934 (= e!14901 (= (select (arr!591 (_keys!3160 lt!7902)) (index!2338 lt!8018)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22935 () Bool)

(declare-fun res!14252 () Bool)

(assert (=> b!22935 (=> (not res!14252) (not e!14907))))

(assert (=> b!22935 (= res!14252 (= (select (arr!591 (_keys!3160 lt!7902)) (index!2337 lt!8019)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22936 () Bool)

(assert (=> b!22936 (= e!14902 (not call!1799))))

(declare-fun b!22937 () Bool)

(declare-fun Unit!511 () Unit!508)

(assert (=> b!22937 (= e!14897 Unit!511)))

(declare-fun lt!8009 () Unit!508)

(declare-fun call!1819 () Unit!508)

(assert (=> b!22937 (= lt!8009 call!1819)))

(assert (=> b!22937 (= lt!8020 call!1812)))

(assert (=> b!22937 (= c!2891 ((_ is MissingZero!54) lt!8020))))

(assert (=> b!22937 e!14900))

(declare-fun lt!8013 () Unit!508)

(assert (=> b!22937 (= lt!8013 lt!8009)))

(assert (=> b!22937 false))

(declare-fun b!22938 () Bool)

(assert (=> b!22938 (= e!14890 e!14902)))

(declare-fun res!14248 () Bool)

(assert (=> b!22938 (= res!14248 call!1813)))

(assert (=> b!22938 (=> (not res!14248) (not e!14902))))

(declare-fun bm!1815 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (array!1249 array!1247 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 64) Int) Unit!508)

(assert (=> bm!1815 (= call!1819 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (_keys!3160 lt!7902) (_values!1725 lt!7902) (mask!4722 lt!7902) (extraKeys!1637 lt!7902) (zeroValue!1662 lt!7902) (minValue!1662 lt!7902) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1738 lt!7902)))))

(declare-fun b!22939 () Bool)

(declare-fun lt!8003 () Unit!508)

(assert (=> b!22939 (= e!14891 lt!8003)))

(assert (=> b!22939 (= lt!8003 call!1819)))

(assert (=> b!22939 (= lt!8019 call!1806)))

(assert (=> b!22939 (= c!2892 ((_ is MissingZero!54) lt!8019))))

(assert (=> b!22939 e!14905))

(declare-fun b!22940 () Bool)

(declare-fun lt!8012 () Unit!508)

(declare-fun lt!8005 () Unit!508)

(assert (=> b!22940 (= lt!8012 lt!8005)))

(assert (=> b!22940 call!1802))

(declare-fun lemmaValidKeyInArrayIsInListMap!9 (array!1249 array!1247 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 32) Int) Unit!508)

(assert (=> b!22940 (= lt!8005 (lemmaValidKeyInArrayIsInListMap!9 (_keys!3160 lt!7902) lt!8006 (mask!4722 lt!7902) (extraKeys!1637 lt!7902) (zeroValue!1662 lt!7902) (minValue!1662 lt!7902) (index!2338 lt!8008) (defaultEntry!1738 lt!7902)))))

(assert (=> b!22940 (= lt!8006 (array!1248 (store (arr!590 (_values!1725 lt!7902)) (index!2338 lt!8008) (ValueCellFull!308 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))))) (size!686 (_values!1725 lt!7902))))))

(declare-fun lt!8017 () Unit!508)

(declare-fun lt!8001 () Unit!508)

(assert (=> b!22940 (= lt!8017 lt!8001)))

(assert (=> b!22940 (= call!1811 call!1807)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (array!1249 array!1247 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 32) (_ BitVec 64) V!1179 Int) Unit!508)

(assert (=> b!22940 (= lt!8001 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (_keys!3160 lt!7902) (_values!1725 lt!7902) (mask!4722 lt!7902) (extraKeys!1637 lt!7902) (zeroValue!1662 lt!7902) (minValue!1662 lt!7902) (index!2338 lt!8008) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (defaultEntry!1738 lt!7902)))))

(declare-fun lt!7995 () Unit!508)

(assert (=> b!22940 (= lt!7995 e!14897)))

(assert (=> b!22940 (= c!2883 (contains!229 call!1804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22940 (= e!14904 (tuple2!945 true (LongMapFixedSize!203 (defaultEntry!1738 lt!7902) (mask!4722 lt!7902) (extraKeys!1637 lt!7902) (zeroValue!1662 lt!7902) (minValue!1662 lt!7902) (_size!145 lt!7902) (_keys!3160 lt!7902) (array!1248 (store (arr!590 (_values!1725 lt!7902)) (index!2338 lt!8008) (ValueCellFull!308 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))))) (size!686 (_values!1725 lt!7902))) (_vacant!145 lt!7902))))))

(declare-fun b!22941 () Bool)

(assert (=> b!22941 (= e!14907 (not call!1799))))

(declare-fun bm!1816 () Bool)

(declare-fun arrayContainsKey!0 (array!1249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!1816 (= call!1800 (arrayContainsKey!0 (_keys!3160 lt!7902) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!22942 () Bool)

(assert (=> b!22942 (= e!14906 (= call!1798 call!1815))))

(declare-fun b!22943 () Bool)

(declare-fun res!14247 () Bool)

(assert (=> b!22943 (=> (not res!14247) (not e!14888))))

(assert (=> b!22943 (= res!14247 (= (select (arr!591 (_keys!3160 lt!7902)) (index!2337 lt!8020)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!22944 () Bool)

(assert (=> b!22944 (= e!14892 (= (select (arr!591 (_keys!3160 lt!7902)) (index!2338 lt!8004)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1817 () Bool)

(assert (=> bm!1817 (= call!1803 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3160 lt!7902) (mask!4722 lt!7902)))))

(declare-fun b!22945 () Bool)

(declare-fun res!14259 () Bool)

(assert (=> b!22945 (= res!14259 call!1808)))

(assert (=> b!22945 (=> (not res!14259) (not e!14892))))

(declare-fun b!22946 () Bool)

(declare-fun lt!8015 () Unit!508)

(assert (=> b!22946 (= lt!8015 e!14891)))

(assert (=> b!22946 (= c!2885 call!1802)))

(assert (=> b!22946 (= e!14889 (tuple2!945 false lt!7902))))

(declare-fun b!22947 () Bool)

(assert (=> b!22947 (= c!2884 ((_ is MissingVacant!54) lt!8008))))

(assert (=> b!22947 (= e!14889 e!14903)))

(assert (= (and d!3929 c!2888) b!22910))

(assert (= (and d!3929 (not c!2888)) b!22925))

(assert (= (and b!22910 c!2889) b!22930))

(assert (= (and b!22910 (not c!2889)) b!22929))

(assert (= (or b!22930 b!22929) bm!1806))

(assert (= (or b!22930 b!22929) bm!1797))

(assert (= (or b!22930 b!22929) bm!1807))

(assert (= (and b!22925 c!2882) b!22946))

(assert (= (and b!22925 (not c!2882)) b!22947))

(assert (= (and b!22946 c!2885) b!22926))

(assert (= (and b!22946 (not c!2885)) b!22939))

(assert (= (and b!22926 res!14253) b!22945))

(assert (= (and b!22945 res!14259) b!22944))

(assert (= (and b!22939 c!2892) b!22913))

(assert (= (and b!22939 (not c!2892)) b!22920))

(assert (= (and b!22913 res!14251) b!22935))

(assert (= (and b!22935 res!14252) b!22941))

(assert (= (and b!22920 c!2886) b!22938))

(assert (= (and b!22920 (not c!2886)) b!22916))

(assert (= (and b!22938 res!14248) b!22922))

(assert (= (and b!22922 res!14256) b!22936))

(assert (= (or b!22913 b!22938) bm!1801))

(assert (= (or b!22941 b!22936) bm!1798))

(assert (= (or b!22945 bm!1801) bm!1805))

(assert (= (or b!22926 b!22939) bm!1813))

(assert (= (and b!22947 c!2884) b!22914))

(assert (= (and b!22947 (not c!2884)) b!22924))

(assert (= (and b!22924 c!2887) b!22928))

(assert (= (and b!22924 (not c!2887)) b!22940))

(assert (= (and b!22940 c!2883) b!22933))

(assert (= (and b!22940 (not c!2883)) b!22937))

(assert (= (and b!22933 res!14250) b!22932))

(assert (= (and b!22932 res!14257) b!22934))

(assert (= (and b!22937 c!2891) b!22917))

(assert (= (and b!22937 (not c!2891)) b!22923))

(assert (= (and b!22917 res!14260) b!22943))

(assert (= (and b!22943 res!14247) b!22915))

(assert (= (and b!22923 c!2890) b!22918))

(assert (= (and b!22923 (not c!2890)) b!22931))

(assert (= (and b!22918 res!14258) b!22921))

(assert (= (and b!22921 res!14254) b!22911))

(assert (= (or b!22917 b!22918) bm!1802))

(assert (= (or b!22915 b!22911) bm!1800))

(assert (= (or b!22932 bm!1802) bm!1803))

(assert (= (or b!22933 b!22937) bm!1794))

(assert (= (or b!22914 b!22928) bm!1795))

(assert (= (or b!22939 b!22937) bm!1815))

(assert (= (or bm!1813 bm!1794) bm!1817))

(assert (= (or bm!1805 bm!1803) bm!1809))

(assert (= (or b!22926 b!22933) bm!1810))

(assert (= (or bm!1798 bm!1800) bm!1816))

(assert (= (or b!22946 b!22940) bm!1808))

(assert (= (or b!22946 b!22940) bm!1804))

(assert (= (or bm!1806 b!22940) bm!1799))

(assert (= (or bm!1797 b!22940) bm!1812))

(assert (= (or bm!1807 b!22940) bm!1811))

(assert (= (and d!3929 res!14255) b!22912))

(assert (= (and b!22912 c!2881) b!22927))

(assert (= (and b!22912 (not c!2881)) b!22942))

(assert (= (and b!22927 res!14249) b!22919))

(assert (= (or b!22927 b!22919 b!22942) bm!1814))

(assert (= (or b!22919 b!22942) bm!1796))

(declare-fun m!16504 () Bool)

(assert (=> bm!1808 m!16504))

(declare-fun m!16506 () Bool)

(assert (=> b!22927 m!16506))

(declare-fun m!16508 () Bool)

(assert (=> bm!1817 m!16508))

(declare-fun m!16510 () Bool)

(assert (=> b!22921 m!16510))

(declare-fun m!16512 () Bool)

(assert (=> b!22929 m!16512))

(declare-fun m!16514 () Bool)

(assert (=> bm!1816 m!16514))

(declare-fun m!16516 () Bool)

(assert (=> bm!1812 m!16516))

(declare-fun m!16518 () Bool)

(assert (=> bm!1810 m!16518))

(declare-fun m!16520 () Bool)

(assert (=> b!22944 m!16520))

(declare-fun m!16522 () Bool)

(assert (=> bm!1796 m!16522))

(declare-fun m!16524 () Bool)

(assert (=> b!22930 m!16524))

(declare-fun m!16526 () Bool)

(assert (=> bm!1804 m!16526))

(declare-fun m!16528 () Bool)

(assert (=> bm!1804 m!16528))

(declare-fun m!16530 () Bool)

(assert (=> b!22934 m!16530))

(declare-fun m!16532 () Bool)

(assert (=> bm!1814 m!16532))

(declare-fun m!16534 () Bool)

(assert (=> d!3929 m!16534))

(declare-fun m!16536 () Bool)

(assert (=> d!3929 m!16536))

(declare-fun m!16538 () Bool)

(assert (=> b!22935 m!16538))

(declare-fun m!16540 () Bool)

(assert (=> bm!1811 m!16540))

(declare-fun m!16542 () Bool)

(assert (=> b!22943 m!16542))

(declare-fun m!16544 () Bool)

(assert (=> bm!1815 m!16544))

(declare-fun m!16546 () Bool)

(assert (=> b!22919 m!16546))

(declare-fun m!16548 () Bool)

(assert (=> bm!1809 m!16548))

(declare-fun m!16550 () Bool)

(assert (=> b!22922 m!16550))

(assert (=> b!22925 m!16508))

(declare-fun m!16552 () Bool)

(assert (=> b!22940 m!16552))

(declare-fun m!16554 () Bool)

(assert (=> b!22940 m!16554))

(declare-fun m!16556 () Bool)

(assert (=> b!22940 m!16556))

(declare-fun m!16558 () Bool)

(assert (=> b!22940 m!16558))

(assert (=> bm!1799 m!16554))

(declare-fun m!16560 () Bool)

(assert (=> bm!1799 m!16560))

(declare-fun m!16562 () Bool)

(assert (=> bm!1795 m!16562))

(assert (=> b!22746 d!3929))

(declare-fun d!3931 () Bool)

(assert (=> d!3931 (= (array_inv!415 (_keys!3160 (v!1594 (underlying!112 thiss!938)))) (bvsge (size!687 (_keys!3160 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22745 d!3931))

(declare-fun d!3933 () Bool)

(assert (=> d!3933 (= (array_inv!416 (_values!1725 (v!1594 (underlying!112 thiss!938)))) (bvsge (size!686 (_values!1725 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!22745 d!3933))

(declare-fun d!3935 () Bool)

(assert (=> d!3935 (= (validMask!0 (mask!4722 (v!1594 (underlying!112 thiss!938)))) (and (or (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000000111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000001111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000011111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000001111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000011111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000001111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000011111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000001111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000011111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000001111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000011111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000001111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000011111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000001111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000011111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000111111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000001111111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000011111111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000111111111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00001111111111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00011111111111111111111111111111) (= (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!22738 d!3935))

(declare-fun b!22960 () Bool)

(declare-fun e!14915 () Bool)

(declare-fun lt!8086 () array!1249)

(declare-fun lt!8088 () tuple2!954)

(assert (=> b!22960 (= e!14915 (arrayContainsKey!0 lt!8086 (_1!485 lt!8088) #b00000000000000000000000000000000))))

(declare-fun b!22961 () Bool)

(declare-fun lt!8073 () (_ BitVec 32))

(assert (=> b!22961 (= e!14915 (ite (= (_1!485 lt!8088) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!8073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!8073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!22962 () Bool)

(declare-fun e!14914 () Bool)

(declare-fun lt!8083 () LongMapFixedSize!202)

(assert (=> b!22962 (= e!14914 (= (map!405 lt!8083) (ListLongMap!564 Nil!560)))))

(declare-fun b!22963 () Bool)

(declare-fun e!14916 () Unit!508)

(declare-fun Unit!512 () Unit!508)

(assert (=> b!22963 (= e!14916 Unit!512)))

(declare-fun lt!8090 () LongMapFixedSize!202)

(declare-fun head!829 (List!563) tuple2!954)

(assert (=> b!22963 (= lt!8088 (head!829 (toList!297 (map!405 lt!8090))))))

(assert (=> b!22963 (= lt!8086 (array!1250 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!22963 (= lt!8073 #b00000000000000000000000000000000)))

(declare-fun lt!8069 () Unit!508)

(declare-fun lemmaKeyInListMapIsInArray!96 (array!1249 array!1247 (_ BitVec 32) (_ BitVec 32) V!1179 V!1179 (_ BitVec 64) Int) Unit!508)

(declare-fun dynLambda!142 (Int (_ BitVec 64)) V!1179)

(assert (=> b!22963 (= lt!8069 (lemmaKeyInListMapIsInArray!96 lt!8086 (array!1248 ((as const (Array (_ BitVec 32) ValueCell!308)) EmptyCell!308) (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) lt!8073 (dynLambda!142 (defaultEntry!1738 (v!1594 (underlying!112 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!142 (defaultEntry!1738 (v!1594 (underlying!112 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!485 lt!8088) (defaultEntry!1738 (v!1594 (underlying!112 thiss!938)))))))

(declare-fun c!2898 () Bool)

(assert (=> b!22963 (= c!2898 (and (not (= (_1!485 lt!8088) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!485 lt!8088) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22963 e!14915))

(declare-fun lt!8084 () Unit!508)

(assert (=> b!22963 (= lt!8084 lt!8069)))

(declare-fun lt!8072 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1249 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22963 (= lt!8072 (arrayScanForKey!0 (array!1250 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)) (_1!485 lt!8088) #b00000000000000000000000000000000))))

(assert (=> b!22963 false))

(declare-fun b!22964 () Bool)

(declare-fun res!14265 () Bool)

(assert (=> b!22964 (=> (not res!14265) (not e!14914))))

(assert (=> b!22964 (= res!14265 (= (mask!4722 lt!8083) (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938))))))))

(declare-fun d!3937 () Bool)

(assert (=> d!3937 e!14914))

(declare-fun res!14266 () Bool)

(assert (=> d!3937 (=> (not res!14266) (not e!14914))))

(assert (=> d!3937 (= res!14266 (valid!113 lt!8083))))

(assert (=> d!3937 (= lt!8083 lt!8090)))

(declare-fun lt!8089 () Unit!508)

(assert (=> d!3937 (= lt!8089 e!14916)))

(declare-fun c!2897 () Bool)

(assert (=> d!3937 (= c!2897 (not (= (map!405 lt!8090) (ListLongMap!564 Nil!560))))))

(declare-fun lt!8085 () Unit!508)

(declare-fun lt!8080 () Unit!508)

(assert (=> d!3937 (= lt!8085 lt!8080)))

(declare-fun lt!8074 () array!1249)

(declare-fun lt!8075 () (_ BitVec 32))

(declare-datatypes ((List!564 0))(
  ( (Nil!561) (Cons!560 (h!1126 (_ BitVec 64)) (t!3226 List!564)) )
))
(declare-fun lt!8071 () List!564)

(declare-fun arrayNoDuplicates!0 (array!1249 (_ BitVec 32) List!564) Bool)

(assert (=> d!3937 (arrayNoDuplicates!0 lt!8074 lt!8075 lt!8071)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1249 (_ BitVec 32) (_ BitVec 32) List!564) Unit!508)

(assert (=> d!3937 (= lt!8080 (lemmaArrayNoDuplicatesInAll0Array!0 lt!8074 lt!8075 (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001) lt!8071))))

(assert (=> d!3937 (= lt!8071 Nil!561)))

(assert (=> d!3937 (= lt!8075 #b00000000000000000000000000000000)))

(assert (=> d!3937 (= lt!8074 (array!1250 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!8076 () Unit!508)

(declare-fun lt!8079 () Unit!508)

(assert (=> d!3937 (= lt!8076 lt!8079)))

(declare-fun lt!8077 () (_ BitVec 32))

(declare-fun lt!8070 () array!1249)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1249 (_ BitVec 32)) Bool)

(assert (=> d!3937 (arrayForallSeekEntryOrOpenFound!0 lt!8077 lt!8070 (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1249 (_ BitVec 32) (_ BitVec 32)) Unit!508)

(assert (=> d!3937 (= lt!8079 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!8070 (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) lt!8077))))

(assert (=> d!3937 (= lt!8077 #b00000000000000000000000000000000)))

(assert (=> d!3937 (= lt!8070 (array!1250 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!8082 () Unit!508)

(declare-fun lt!8068 () Unit!508)

(assert (=> d!3937 (= lt!8082 lt!8068)))

(declare-fun lt!8087 () array!1249)

(declare-fun lt!8078 () (_ BitVec 32))

(declare-fun lt!8081 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!1249 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3937 (= (arrayCountValidKeys!0 lt!8087 lt!8078 lt!8081) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1249 (_ BitVec 32) (_ BitVec 32)) Unit!508)

(assert (=> d!3937 (= lt!8068 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!8087 lt!8078 lt!8081))))

(assert (=> d!3937 (= lt!8081 (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3937 (= lt!8078 #b00000000000000000000000000000000)))

(assert (=> d!3937 (= lt!8087 (array!1250 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3937 (= lt!8090 (LongMapFixedSize!203 (defaultEntry!1738 (v!1594 (underlying!112 thiss!938))) (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!142 (defaultEntry!1738 (v!1594 (underlying!112 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!142 (defaultEntry!1738 (v!1594 (underlying!112 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1250 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)) (array!1248 ((as const (Array (_ BitVec 32) ValueCell!308)) EmptyCell!308) (bvadd (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(assert (=> d!3937 (validMask!0 (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))))))

(assert (=> d!3937 (= (getNewLongMapFixedSize!31 (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) (defaultEntry!1738 (v!1594 (underlying!112 thiss!938)))) lt!8083)))

(declare-fun b!22965 () Bool)

(declare-fun Unit!513 () Unit!508)

(assert (=> b!22965 (= e!14916 Unit!513)))

(assert (= (and d!3937 c!2897) b!22963))

(assert (= (and d!3937 (not c!2897)) b!22965))

(assert (= (and b!22963 c!2898) b!22960))

(assert (= (and b!22963 (not c!2898)) b!22961))

(assert (= (and d!3937 res!14266) b!22964))

(assert (= (and b!22964 res!14265) b!22962))

(declare-fun b_lambda!1555 () Bool)

(assert (=> (not b_lambda!1555) (not b!22963)))

(declare-fun t!3224 () Bool)

(declare-fun tb!649 () Bool)

(assert (=> (and b!22745 (= (defaultEntry!1738 (v!1594 (underlying!112 thiss!938))) (defaultEntry!1738 (v!1594 (underlying!112 thiss!938)))) t!3224) tb!649))

(declare-fun result!1081 () Bool)

(assert (=> tb!649 (= result!1081 tp_is_empty!1015)))

(assert (=> b!22963 t!3224))

(declare-fun b_and!1469 () Bool)

(assert (= b_and!1463 (and (=> t!3224 result!1081) b_and!1469)))

(declare-fun b_lambda!1557 () Bool)

(assert (=> (not b_lambda!1557) (not d!3937)))

(assert (=> d!3937 t!3224))

(declare-fun b_and!1471 () Bool)

(assert (= b_and!1469 (and (=> t!3224 result!1081) b_and!1471)))

(declare-fun m!16564 () Bool)

(assert (=> b!22960 m!16564))

(declare-fun m!16566 () Bool)

(assert (=> b!22962 m!16566))

(declare-fun m!16568 () Bool)

(assert (=> b!22963 m!16568))

(declare-fun m!16570 () Bool)

(assert (=> b!22963 m!16570))

(declare-fun m!16572 () Bool)

(assert (=> b!22963 m!16572))

(assert (=> b!22963 m!16456))

(assert (=> b!22963 m!16568))

(assert (=> b!22963 m!16568))

(declare-fun m!16574 () Bool)

(assert (=> b!22963 m!16574))

(declare-fun m!16576 () Bool)

(assert (=> b!22963 m!16576))

(assert (=> d!3937 m!16568))

(declare-fun m!16578 () Bool)

(assert (=> d!3937 m!16578))

(assert (=> d!3937 m!16570))

(declare-fun m!16580 () Bool)

(assert (=> d!3937 m!16580))

(declare-fun m!16582 () Bool)

(assert (=> d!3937 m!16582))

(assert (=> d!3937 m!16456))

(declare-fun m!16584 () Bool)

(assert (=> d!3937 m!16584))

(declare-fun m!16586 () Bool)

(assert (=> d!3937 m!16586))

(assert (=> d!3937 m!16456))

(declare-fun m!16588 () Bool)

(assert (=> d!3937 m!16588))

(declare-fun m!16590 () Bool)

(assert (=> d!3937 m!16590))

(assert (=> d!3937 m!16456))

(declare-fun m!16592 () Bool)

(assert (=> d!3937 m!16592))

(assert (=> b!22744 d!3937))

(declare-fun d!3939 () Bool)

(declare-fun e!14922 () Bool)

(assert (=> d!3939 e!14922))

(declare-fun res!14269 () Bool)

(assert (=> d!3939 (=> (not res!14269) (not e!14922))))

(declare-fun lt!8095 () (_ BitVec 32))

(assert (=> d!3939 (= res!14269 (validMask!0 lt!8095))))

(declare-datatypes ((tuple2!956 0))(
  ( (tuple2!957 (_1!486 Unit!508) (_2!486 (_ BitVec 32))) )
))
(declare-fun e!14921 () tuple2!956)

(assert (=> d!3939 (= lt!8095 (_2!486 e!14921))))

(declare-fun c!2901 () Bool)

(declare-fun lt!8096 () tuple2!956)

(assert (=> d!3939 (= c!2901 (and (bvsgt (_2!486 lt!8096) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!145 (v!1594 (underlying!112 thiss!938)))) (_2!486 lt!8096)) (bvsge (bvadd (bvand (bvashr (_2!486 lt!8096) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!145 (v!1594 (underlying!112 thiss!938))))))))

(declare-fun Unit!514 () Unit!508)

(declare-fun Unit!515 () Unit!508)

(assert (=> d!3939 (= lt!8096 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!145 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))))) (mask!4722 (v!1594 (underlying!112 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!145 (v!1594 (underlying!112 thiss!938)))) (mask!4722 (v!1594 (underlying!112 thiss!938))))) (tuple2!957 Unit!514 (bvand (bvadd (bvshl (mask!4722 (v!1594 (underlying!112 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!957 Unit!515 (mask!4722 (v!1594 (underlying!112 thiss!938))))))))

(assert (=> d!3939 (validMask!0 (mask!4722 (v!1594 (underlying!112 thiss!938))))))

(assert (=> d!3939 (= (computeNewMask!28 thiss!938 (mask!4722 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (_size!145 (v!1594 (underlying!112 thiss!938)))) lt!8095)))

(declare-fun b!22974 () Bool)

(declare-fun computeNewMaskWhile!13 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!956)

(assert (=> b!22974 (= e!14921 (computeNewMaskWhile!13 (_size!145 (v!1594 (underlying!112 thiss!938))) (_vacant!145 (v!1594 (underlying!112 thiss!938))) (mask!4722 (v!1594 (underlying!112 thiss!938))) (_2!486 lt!8096)))))

(declare-fun b!22975 () Bool)

(declare-fun Unit!516 () Unit!508)

(assert (=> b!22975 (= e!14921 (tuple2!957 Unit!516 (_2!486 lt!8096)))))

(declare-fun b!22976 () Bool)

(assert (=> b!22976 (= e!14922 (bvsle (_size!145 (v!1594 (underlying!112 thiss!938))) (bvadd lt!8095 #b00000000000000000000000000000001)))))

(assert (= (and d!3939 c!2901) b!22974))

(assert (= (and d!3939 (not c!2901)) b!22975))

(assert (= (and d!3939 res!14269) b!22976))

(declare-fun m!16594 () Bool)

(assert (=> d!3939 m!16594))

(assert (=> d!3939 m!16454))

(declare-fun m!16596 () Bool)

(assert (=> b!22974 m!16596))

(assert (=> b!22744 d!3939))

(declare-fun bm!1818 () Bool)

(declare-fun call!1836 () SeekEntryResult!54)

(declare-fun call!1827 () SeekEntryResult!54)

(assert (=> bm!1818 (= call!1836 call!1827)))

(declare-fun c!2905 () Bool)

(declare-fun bm!1819 () Bool)

(declare-fun call!1825 () tuple2!944)

(declare-fun lt!8110 () SeekEntryResult!54)

(assert (=> bm!1819 (= call!1825 (updateHelperNewKey!9 (ite c!2838 (_2!480 lt!7904) lt!7902) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))) (ite c!2905 (index!2340 lt!8110) (index!2337 lt!8110))))))

(declare-fun b!22977 () Bool)

(declare-fun e!14931 () tuple2!944)

(declare-fun e!14929 () tuple2!944)

(assert (=> b!22977 (= e!14931 e!14929)))

(declare-fun c!2910 () Bool)

(assert (=> b!22977 (= c!2910 (= (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!1820 () Bool)

(declare-fun call!1839 () ListLongMap!563)

(assert (=> bm!1820 (= call!1839 (map!405 (ite c!2838 (_2!480 lt!7904) lt!7902)))))

(declare-fun b!22978 () Bool)

(declare-fun e!14933 () Bool)

(declare-fun call!1840 () Bool)

(assert (=> b!22978 (= e!14933 (not call!1840))))

(declare-fun bm!1821 () Bool)

(declare-fun call!1834 () ListLongMap!563)

(declare-fun call!1828 () ListLongMap!563)

(assert (=> bm!1821 (= call!1834 call!1828)))

(declare-fun bm!1822 () Bool)

(declare-fun call!1823 () Bool)

(declare-fun call!1824 () Bool)

(assert (=> bm!1822 (= call!1823 call!1824)))

(declare-fun c!2909 () Bool)

(declare-fun call!1831 () ListLongMap!563)

(declare-fun lt!8098 () (_ BitVec 32))

(declare-fun bm!1823 () Bool)

(declare-fun lt!8101 () (_ BitVec 32))

(assert (=> bm!1823 (= call!1831 (getCurrentListMap!128 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2909 (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (array!1248 (store (arr!590 (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2338 lt!8110) (ValueCellFull!308 (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))))) (size!686 (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902))))) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2909 (ite c!2910 lt!8101 lt!8098) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902))) (ite (and c!2909 c!2910) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902))) (ite c!2909 (ite c!2910 (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938)))))) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902))) #b00000000000000000000000000000000 (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(declare-fun b!22979 () Bool)

(declare-fun e!14934 () Bool)

(declare-fun e!14941 () Bool)

(assert (=> b!22979 (= e!14934 e!14941)))

(declare-fun c!2902 () Bool)

(declare-fun lt!8112 () tuple2!944)

(assert (=> b!22979 (= c!2902 (_1!480 lt!8112))))

(declare-fun b!22980 () Bool)

(declare-fun res!14274 () Bool)

(declare-fun e!14942 () Bool)

(assert (=> b!22980 (=> (not res!14274) (not e!14942))))

(declare-fun call!1837 () Bool)

(assert (=> b!22980 (= res!14274 call!1837)))

(declare-fun e!14940 () Bool)

(assert (=> b!22980 (= e!14940 e!14942)))

(declare-fun bm!1824 () Bool)

(assert (=> bm!1824 (= call!1840 call!1824)))

(declare-fun bm!1825 () Bool)

(declare-fun call!1832 () Bool)

(assert (=> bm!1825 (= call!1837 call!1832)))

(declare-fun b!22981 () Bool)

(declare-fun e!14938 () tuple2!944)

(declare-fun lt!8100 () tuple2!944)

(assert (=> b!22981 (= e!14938 (tuple2!945 (_1!480 lt!8100) (_2!480 lt!8100)))))

(assert (=> b!22981 (= lt!8100 call!1825)))

(declare-fun b!22982 () Bool)

(declare-fun e!14923 () Bool)

(assert (=> b!22982 (= e!14923 (not call!1840))))

(declare-fun bm!1826 () Bool)

(declare-fun call!1838 () Bool)

(declare-fun call!1821 () Bool)

(assert (=> bm!1826 (= call!1838 call!1821)))

(declare-fun b!22983 () Bool)

(declare-fun e!14925 () Bool)

(declare-fun lt!8121 () SeekEntryResult!54)

(assert (=> b!22983 (= e!14925 ((_ is Undefined!54) lt!8121))))

(declare-fun b!22984 () Bool)

(declare-fun res!14283 () Bool)

(assert (=> b!22984 (=> (not res!14283) (not e!14923))))

(assert (=> b!22984 (= res!14283 call!1838)))

(declare-fun e!14935 () Bool)

(assert (=> b!22984 (= e!14935 e!14923)))

(declare-fun b!22985 () Bool)

(declare-fun e!14928 () Bool)

(assert (=> b!22985 (= e!14928 e!14933)))

(declare-fun res!14281 () Bool)

(assert (=> b!22985 (= res!14281 call!1838)))

(assert (=> b!22985 (=> (not res!14281) (not e!14933))))

(declare-fun b!22986 () Bool)

(declare-fun call!1822 () ListLongMap!563)

(declare-fun e!14930 () Bool)

(assert (=> b!22986 (= e!14930 (= call!1822 (+!44 call!1839 (tuple2!955 (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938)))))))))))

(declare-fun bm!1827 () Bool)

(declare-fun call!1841 () Bool)

(assert (=> bm!1827 (= call!1821 call!1841)))

(declare-fun c!2903 () Bool)

(declare-fun bm!1828 () Bool)

(declare-fun call!1829 () ListLongMap!563)

(declare-fun call!1826 () Bool)

(assert (=> bm!1828 (= call!1826 (contains!229 call!1829 (ite c!2903 (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (select (arr!591 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2338 lt!8110)))))))

(declare-fun b!22987 () Bool)

(declare-fun c!2907 () Bool)

(assert (=> b!22987 (= c!2907 ((_ is MissingVacant!54) lt!8121))))

(assert (=> b!22987 (= e!14940 e!14925)))

(declare-fun b!22988 () Bool)

(declare-fun res!14277 () Bool)

(declare-fun lt!8122 () SeekEntryResult!54)

(assert (=> b!22988 (= res!14277 (= (select (arr!591 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2340 lt!8122)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!22988 (=> (not res!14277) (not e!14933))))

(declare-fun b!22989 () Bool)

(declare-fun res!14279 () Bool)

(assert (=> b!22989 (= res!14279 (= (select (arr!591 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2340 lt!8121)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14937 () Bool)

(assert (=> b!22989 (=> (not res!14279) (not e!14937))))

(declare-fun b!22990 () Bool)

(declare-fun c!2911 () Bool)

(assert (=> b!22990 (= c!2911 ((_ is MissingVacant!54) lt!8122))))

(assert (=> b!22990 (= e!14935 e!14928)))

(declare-fun b!22991 () Bool)

(declare-fun e!14939 () tuple2!944)

(assert (=> b!22991 (= e!14938 e!14939)))

(declare-fun c!2908 () Bool)

(assert (=> b!22991 (= c!2908 ((_ is MissingZero!54) lt!8110))))

(declare-fun b!22992 () Bool)

(declare-fun e!14924 () tuple2!944)

(assert (=> b!22992 (= e!14931 e!14924)))

(assert (=> b!22992 (= lt!8110 (seekEntryOrOpen!0 (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(assert (=> b!22992 (= c!2903 ((_ is Undefined!54) lt!8110))))

(declare-fun b!22993 () Bool)

(declare-fun e!14926 () Unit!508)

(declare-fun Unit!517 () Unit!508)

(assert (=> b!22993 (= e!14926 Unit!517)))

(declare-fun lt!8104 () Unit!508)

(declare-fun call!1844 () Unit!508)

(assert (=> b!22993 (= lt!8104 call!1844)))

(declare-fun lt!8106 () SeekEntryResult!54)

(declare-fun call!1830 () SeekEntryResult!54)

(assert (=> b!22993 (= lt!8106 call!1830)))

(declare-fun res!14276 () Bool)

(assert (=> b!22993 (= res!14276 ((_ is Found!54) lt!8106))))

(declare-fun e!14927 () Bool)

(assert (=> b!22993 (=> (not res!14276) (not e!14927))))

(assert (=> b!22993 e!14927))

(declare-fun lt!8113 () Unit!508)

(assert (=> b!22993 (= lt!8113 lt!8104)))

(assert (=> b!22993 false))

(declare-fun b!22994 () Bool)

(assert (=> b!22994 (= e!14941 e!14930)))

(declare-fun res!14272 () Bool)

(assert (=> b!22994 (= res!14272 (contains!229 call!1822 (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!22994 (=> (not res!14272) (not e!14930))))

(declare-fun bm!1829 () Bool)

(assert (=> bm!1829 (= call!1832 call!1841)))

(declare-fun bm!1830 () Bool)

(declare-fun call!1833 () ListLongMap!563)

(assert (=> bm!1830 (= call!1833 call!1831)))

(declare-fun b!22995 () Bool)

(declare-fun lt!8118 () tuple2!944)

(assert (=> b!22995 (= lt!8118 call!1825)))

(assert (=> b!22995 (= e!14939 (tuple2!945 (_1!480 lt!8118) (_2!480 lt!8118)))))

(declare-fun bm!1831 () Bool)

(declare-fun call!1842 () ListLongMap!563)

(declare-fun call!1835 () ListLongMap!563)

(assert (=> bm!1831 (= call!1842 call!1835)))

(declare-fun bm!1832 () Bool)

(declare-fun lt!8108 () array!1247)

(assert (=> bm!1832 (= call!1829 (getCurrentListMap!128 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2903 (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) lt!8108) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) #b00000000000000000000000000000000 (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(declare-fun c!2912 () Bool)

(declare-fun lt!8120 () SeekEntryResult!54)

(declare-fun c!2904 () Bool)

(declare-fun bm!1833 () Bool)

(declare-fun c!2913 () Bool)

(declare-fun c!2906 () Bool)

(assert (=> bm!1833 (= call!1841 (inRange!0 (ite c!2903 (ite c!2906 (index!2338 lt!8106) (ite c!2913 (index!2337 lt!8121) (index!2340 lt!8121))) (ite c!2904 (index!2338 lt!8120) (ite c!2912 (index!2337 lt!8122) (index!2340 lt!8122)))) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(declare-fun bm!1834 () Bool)

(assert (=> bm!1834 (= call!1844 (lemmaInListMapThenSeekEntryOrOpenFindsIt!9 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(declare-fun b!22996 () Bool)

(declare-fun lt!8099 () Unit!508)

(declare-fun lt!8102 () Unit!508)

(assert (=> b!22996 (= lt!8099 lt!8102)))

(assert (=> b!22996 (= call!1842 call!1833)))

(assert (=> b!22996 (= lt!8102 (lemmaChangeLongMinValueKeyThenAddPairToListMap!9 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) lt!8098 (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))) (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(assert (=> b!22996 (= lt!8098 (bvor (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) #b00000000000000000000000000000010))))

(assert (=> b!22996 (= e!14929 (tuple2!945 true (LongMapFixedSize!203 (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (bvor (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) #b00000000000000000000000000000010) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))) (_size!145 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_vacant!145 (ite c!2838 (_2!480 lt!7904) lt!7902)))))))

(declare-fun b!22997 () Bool)

(declare-fun lt!8123 () Unit!508)

(declare-fun lt!8109 () Unit!508)

(assert (=> b!22997 (= lt!8123 lt!8109)))

(assert (=> b!22997 (= call!1842 call!1833)))

(assert (=> b!22997 (= lt!8109 (lemmaChangeZeroKeyThenAddPairToListMap!9 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) lt!8101 (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(assert (=> b!22997 (= lt!8101 (bvor (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) #b00000000000000000000000000000001))))

(assert (=> b!22997 (= e!14929 (tuple2!945 true (LongMapFixedSize!203 (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (bvor (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) #b00000000000000000000000000000001) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_size!145 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_vacant!145 (ite c!2838 (_2!480 lt!7904) lt!7902)))))))

(declare-fun bm!1835 () Bool)

(assert (=> bm!1835 (= call!1835 (+!44 (ite c!2909 call!1834 call!1828) (ite c!2909 (ite c!2910 (tuple2!955 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938)))))) (tuple2!955 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))))) (tuple2!955 (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938)))))))))))

(declare-fun d!3941 () Bool)

(assert (=> d!3941 e!14934))

(declare-fun res!14278 () Bool)

(assert (=> d!3941 (=> (not res!14278) (not e!14934))))

(assert (=> d!3941 (= res!14278 (valid!113 (_2!480 lt!8112)))))

(assert (=> d!3941 (= lt!8112 e!14931)))

(assert (=> d!3941 (= c!2909 (= (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3941 (valid!113 (ite c!2838 (_2!480 lt!7904) lt!7902))))

(assert (=> d!3941 (= (update!35 (ite c!2838 (_2!480 lt!7904) lt!7902) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938)))))) lt!8112)))

(declare-fun bm!1836 () Bool)

(assert (=> bm!1836 (= call!1828 (getCurrentListMap!128 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) #b00000000000000000000000000000000 (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(declare-fun b!22998 () Bool)

(assert (=> b!22998 (= e!14928 ((_ is Undefined!54) lt!8122))))

(declare-fun b!22999 () Bool)

(declare-fun res!14280 () Bool)

(assert (=> b!22999 (= res!14280 call!1821)))

(declare-fun e!14936 () Bool)

(assert (=> b!22999 (=> (not res!14280) (not e!14936))))

(declare-fun bm!1837 () Bool)

(assert (=> bm!1837 (= call!1830 call!1827)))

(declare-fun bm!1838 () Bool)

(assert (=> bm!1838 (= call!1822 (map!405 (_2!480 lt!8112)))))

(declare-fun b!23000 () Bool)

(declare-fun e!14932 () Unit!508)

(declare-fun lt!8116 () Unit!508)

(assert (=> b!23000 (= e!14932 lt!8116)))

(assert (=> b!23000 (= lt!8116 call!1844)))

(assert (=> b!23000 (= lt!8120 call!1836)))

(declare-fun res!14273 () Bool)

(assert (=> b!23000 (= res!14273 ((_ is Found!54) lt!8120))))

(assert (=> b!23000 (=> (not res!14273) (not e!14936))))

(assert (=> b!23000 e!14936))

(declare-fun b!23001 () Bool)

(assert (=> b!23001 (= e!14936 (= (select (arr!591 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2338 lt!8120)) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!23002 () Bool)

(declare-fun res!14275 () Bool)

(assert (=> b!23002 (=> (not res!14275) (not e!14942))))

(assert (=> b!23002 (= res!14275 (= (select (arr!591 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2337 lt!8121)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!23003 () Bool)

(assert (=> b!23003 (= e!14937 (not call!1823))))

(declare-fun b!23004 () Bool)

(declare-fun Unit!518 () Unit!508)

(assert (=> b!23004 (= e!14932 Unit!518)))

(declare-fun lt!8111 () Unit!508)

(declare-fun call!1843 () Unit!508)

(assert (=> b!23004 (= lt!8111 call!1843)))

(assert (=> b!23004 (= lt!8122 call!1836)))

(assert (=> b!23004 (= c!2912 ((_ is MissingZero!54) lt!8122))))

(assert (=> b!23004 e!14935))

(declare-fun lt!8115 () Unit!508)

(assert (=> b!23004 (= lt!8115 lt!8111)))

(assert (=> b!23004 false))

(declare-fun b!23005 () Bool)

(assert (=> b!23005 (= e!14925 e!14937)))

(declare-fun res!14271 () Bool)

(assert (=> b!23005 (= res!14271 call!1837)))

(assert (=> b!23005 (=> (not res!14271) (not e!14937))))

(declare-fun bm!1839 () Bool)

(assert (=> bm!1839 (= call!1843 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!9 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(declare-fun b!23006 () Bool)

(declare-fun lt!8105 () Unit!508)

(assert (=> b!23006 (= e!14926 lt!8105)))

(assert (=> b!23006 (= lt!8105 call!1843)))

(assert (=> b!23006 (= lt!8121 call!1830)))

(assert (=> b!23006 (= c!2913 ((_ is MissingZero!54) lt!8121))))

(assert (=> b!23006 e!14940))

(declare-fun b!23007 () Bool)

(declare-fun lt!8114 () Unit!508)

(declare-fun lt!8107 () Unit!508)

(assert (=> b!23007 (= lt!8114 lt!8107)))

(assert (=> b!23007 call!1826))

(assert (=> b!23007 (= lt!8107 (lemmaValidKeyInArrayIsInListMap!9 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) lt!8108 (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (index!2338 lt!8110) (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(assert (=> b!23007 (= lt!8108 (array!1248 (store (arr!590 (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2338 lt!8110) (ValueCellFull!308 (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))))) (size!686 (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)))))))

(declare-fun lt!8119 () Unit!508)

(declare-fun lt!8103 () Unit!508)

(assert (=> b!23007 (= lt!8119 lt!8103)))

(assert (=> b!23007 (= call!1835 call!1831)))

(assert (=> b!23007 (= lt!8103 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!9 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (index!2338 lt!8110) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))) (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(declare-fun lt!8097 () Unit!508)

(assert (=> b!23007 (= lt!8097 e!14932)))

(assert (=> b!23007 (= c!2904 (contains!229 call!1828 (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!23007 (= e!14939 (tuple2!945 true (LongMapFixedSize!203 (defaultEntry!1738 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902)) (extraKeys!1637 (ite c!2838 (_2!480 lt!7904) lt!7902)) (zeroValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (minValue!1662 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_size!145 (ite c!2838 (_2!480 lt!7904) lt!7902)) (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (array!1248 (store (arr!590 (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2338 lt!8110) (ValueCellFull!308 (ite c!2838 (minValue!1662 (v!1594 (underlying!112 thiss!938))) (ite c!2836 (zeroValue!1662 (v!1594 (underlying!112 thiss!938))) (minValue!1662 (v!1594 (underlying!112 thiss!938))))))) (size!686 (_values!1725 (ite c!2838 (_2!480 lt!7904) lt!7902)))) (_vacant!145 (ite c!2838 (_2!480 lt!7904) lt!7902)))))))

(declare-fun b!23008 () Bool)

(assert (=> b!23008 (= e!14942 (not call!1823))))

(declare-fun bm!1840 () Bool)

(assert (=> bm!1840 (= call!1824 (arrayContainsKey!0 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!23009 () Bool)

(assert (=> b!23009 (= e!14941 (= call!1822 call!1839))))

(declare-fun b!23010 () Bool)

(declare-fun res!14270 () Bool)

(assert (=> b!23010 (=> (not res!14270) (not e!14923))))

(assert (=> b!23010 (= res!14270 (= (select (arr!591 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2337 lt!8122)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!23011 () Bool)

(assert (=> b!23011 (= e!14927 (= (select (arr!591 (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902))) (index!2338 lt!8106)) (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!1841 () Bool)

(assert (=> bm!1841 (= call!1827 (seekEntryOrOpen!0 (ite c!2838 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2836 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3160 (ite c!2838 (_2!480 lt!7904) lt!7902)) (mask!4722 (ite c!2838 (_2!480 lt!7904) lt!7902))))))

(declare-fun b!23012 () Bool)

(declare-fun res!14282 () Bool)

(assert (=> b!23012 (= res!14282 call!1832)))

(assert (=> b!23012 (=> (not res!14282) (not e!14927))))

(declare-fun b!23013 () Bool)

(declare-fun lt!8117 () Unit!508)

(assert (=> b!23013 (= lt!8117 e!14926)))

(assert (=> b!23013 (= c!2906 call!1826)))

(assert (=> b!23013 (= e!14924 (tuple2!945 false (ite c!2838 (_2!480 lt!7904) lt!7902)))))

(declare-fun b!23014 () Bool)

(assert (=> b!23014 (= c!2905 ((_ is MissingVacant!54) lt!8110))))

(assert (=> b!23014 (= e!14924 e!14938)))

(assert (= (and d!3941 c!2909) b!22977))

(assert (= (and d!3941 (not c!2909)) b!22992))

(assert (= (and b!22977 c!2910) b!22997))

(assert (= (and b!22977 (not c!2910)) b!22996))

(assert (= (or b!22997 b!22996) bm!1830))

(assert (= (or b!22997 b!22996) bm!1821))

(assert (= (or b!22997 b!22996) bm!1831))

(assert (= (and b!22992 c!2903) b!23013))

(assert (= (and b!22992 (not c!2903)) b!23014))

(assert (= (and b!23013 c!2906) b!22993))

(assert (= (and b!23013 (not c!2906)) b!23006))

(assert (= (and b!22993 res!14276) b!23012))

(assert (= (and b!23012 res!14282) b!23011))

(assert (= (and b!23006 c!2913) b!22980))

(assert (= (and b!23006 (not c!2913)) b!22987))

(assert (= (and b!22980 res!14274) b!23002))

(assert (= (and b!23002 res!14275) b!23008))

(assert (= (and b!22987 c!2907) b!23005))

(assert (= (and b!22987 (not c!2907)) b!22983))

(assert (= (and b!23005 res!14271) b!22989))

(assert (= (and b!22989 res!14279) b!23003))

(assert (= (or b!22980 b!23005) bm!1825))

(assert (= (or b!23008 b!23003) bm!1822))

(assert (= (or b!23012 bm!1825) bm!1829))

(assert (= (or b!22993 b!23006) bm!1837))

(assert (= (and b!23014 c!2905) b!22981))

(assert (= (and b!23014 (not c!2905)) b!22991))

(assert (= (and b!22991 c!2908) b!22995))

(assert (= (and b!22991 (not c!2908)) b!23007))

(assert (= (and b!23007 c!2904) b!23000))

(assert (= (and b!23007 (not c!2904)) b!23004))

(assert (= (and b!23000 res!14273) b!22999))

(assert (= (and b!22999 res!14280) b!23001))

(assert (= (and b!23004 c!2912) b!22984))

(assert (= (and b!23004 (not c!2912)) b!22990))

(assert (= (and b!22984 res!14283) b!23010))

(assert (= (and b!23010 res!14270) b!22982))

(assert (= (and b!22990 c!2911) b!22985))

(assert (= (and b!22990 (not c!2911)) b!22998))

(assert (= (and b!22985 res!14281) b!22988))

(assert (= (and b!22988 res!14277) b!22978))

(assert (= (or b!22984 b!22985) bm!1826))

(assert (= (or b!22982 b!22978) bm!1824))

(assert (= (or b!22999 bm!1826) bm!1827))

(assert (= (or b!23000 b!23004) bm!1818))

(assert (= (or b!22981 b!22995) bm!1819))

(assert (= (or b!23006 b!23004) bm!1839))

(assert (= (or bm!1837 bm!1818) bm!1841))

(assert (= (or bm!1829 bm!1827) bm!1833))

(assert (= (or b!22993 b!23000) bm!1834))

(assert (= (or bm!1822 bm!1824) bm!1840))

(assert (= (or b!23013 b!23007) bm!1832))

(assert (= (or b!23013 b!23007) bm!1828))

(assert (= (or bm!1830 b!23007) bm!1823))

(assert (= (or bm!1821 b!23007) bm!1836))

(assert (= (or bm!1831 b!23007) bm!1835))

(assert (= (and d!3941 res!14278) b!22979))

(assert (= (and b!22979 c!2902) b!22994))

(assert (= (and b!22979 (not c!2902)) b!23009))

(assert (= (and b!22994 res!14272) b!22986))

(assert (= (or b!22994 b!22986 b!23009) bm!1838))

(assert (= (or b!22986 b!23009) bm!1820))

(declare-fun m!16598 () Bool)

(assert (=> bm!1832 m!16598))

(declare-fun m!16600 () Bool)

(assert (=> b!22994 m!16600))

(declare-fun m!16602 () Bool)

(assert (=> bm!1841 m!16602))

(declare-fun m!16604 () Bool)

(assert (=> b!22988 m!16604))

(declare-fun m!16606 () Bool)

(assert (=> b!22996 m!16606))

(declare-fun m!16608 () Bool)

(assert (=> bm!1840 m!16608))

(declare-fun m!16610 () Bool)

(assert (=> bm!1836 m!16610))

(declare-fun m!16612 () Bool)

(assert (=> bm!1834 m!16612))

(declare-fun m!16614 () Bool)

(assert (=> b!23011 m!16614))

(declare-fun m!16616 () Bool)

(assert (=> bm!1820 m!16616))

(declare-fun m!16618 () Bool)

(assert (=> b!22997 m!16618))

(declare-fun m!16620 () Bool)

(assert (=> bm!1828 m!16620))

(declare-fun m!16622 () Bool)

(assert (=> bm!1828 m!16622))

(declare-fun m!16624 () Bool)

(assert (=> b!23001 m!16624))

(declare-fun m!16626 () Bool)

(assert (=> bm!1838 m!16626))

(declare-fun m!16628 () Bool)

(assert (=> d!3941 m!16628))

(declare-fun m!16630 () Bool)

(assert (=> d!3941 m!16630))

(declare-fun m!16632 () Bool)

(assert (=> b!23002 m!16632))

(declare-fun m!16634 () Bool)

(assert (=> bm!1835 m!16634))

(declare-fun m!16636 () Bool)

(assert (=> b!23010 m!16636))

(declare-fun m!16638 () Bool)

(assert (=> bm!1839 m!16638))

(declare-fun m!16640 () Bool)

(assert (=> b!22986 m!16640))

(declare-fun m!16642 () Bool)

(assert (=> bm!1833 m!16642))

(declare-fun m!16644 () Bool)

(assert (=> b!22989 m!16644))

(assert (=> b!22992 m!16602))

(declare-fun m!16646 () Bool)

(assert (=> b!23007 m!16646))

(declare-fun m!16648 () Bool)

(assert (=> b!23007 m!16648))

(declare-fun m!16650 () Bool)

(assert (=> b!23007 m!16650))

(declare-fun m!16652 () Bool)

(assert (=> b!23007 m!16652))

(assert (=> bm!1823 m!16648))

(declare-fun m!16654 () Bool)

(assert (=> bm!1823 m!16654))

(declare-fun m!16656 () Bool)

(assert (=> bm!1819 m!16656))

(assert (=> bm!1733 d!3941))

(declare-fun d!3943 () Bool)

(assert (=> d!3943 (= (valid!111 thiss!938) (valid!113 (v!1594 (underlying!112 thiss!938))))))

(declare-fun bs!943 () Bool)

(assert (= bs!943 d!3943))

(declare-fun m!16658 () Bool)

(assert (=> bs!943 m!16658))

(assert (=> start!3462 d!3943))

(declare-fun b!23022 () Bool)

(declare-fun e!14948 () Bool)

(assert (=> b!23022 (= e!14948 tp_is_empty!1015)))

(declare-fun mapIsEmpty!1019 () Bool)

(declare-fun mapRes!1019 () Bool)

(assert (=> mapIsEmpty!1019 mapRes!1019))

(declare-fun condMapEmpty!1019 () Bool)

(declare-fun mapDefault!1019 () ValueCell!308)

(assert (=> mapNonEmpty!1010 (= condMapEmpty!1019 (= mapRest!1010 ((as const (Array (_ BitVec 32) ValueCell!308)) mapDefault!1019)))))

(assert (=> mapNonEmpty!1010 (= tp!3497 (and e!14948 mapRes!1019))))

(declare-fun b!23021 () Bool)

(declare-fun e!14947 () Bool)

(assert (=> b!23021 (= e!14947 tp_is_empty!1015)))

(declare-fun mapNonEmpty!1019 () Bool)

(declare-fun tp!3512 () Bool)

(assert (=> mapNonEmpty!1019 (= mapRes!1019 (and tp!3512 e!14947))))

(declare-fun mapKey!1019 () (_ BitVec 32))

(declare-fun mapValue!1019 () ValueCell!308)

(declare-fun mapRest!1019 () (Array (_ BitVec 32) ValueCell!308))

(assert (=> mapNonEmpty!1019 (= mapRest!1010 (store mapRest!1019 mapKey!1019 mapValue!1019))))

(assert (= (and mapNonEmpty!1010 condMapEmpty!1019) mapIsEmpty!1019))

(assert (= (and mapNonEmpty!1010 (not condMapEmpty!1019)) mapNonEmpty!1019))

(assert (= (and mapNonEmpty!1019 ((_ is ValueCellFull!308) mapValue!1019)) b!23021))

(assert (= (and mapNonEmpty!1010 ((_ is ValueCellFull!308) mapDefault!1019)) b!23022))

(declare-fun m!16660 () Bool)

(assert (=> mapNonEmpty!1019 m!16660))

(declare-fun b_lambda!1559 () Bool)

(assert (= b_lambda!1557 (or (and b!22745 b_free!751) b_lambda!1559)))

(declare-fun b_lambda!1561 () Bool)

(assert (= b_lambda!1555 (or (and b!22745 b_free!751) b_lambda!1561)))

(check-sat (not b!22929) (not b!22925) (not b!22927) (not bm!1819) (not b_next!751) (not b!22919) (not bm!1836) (not bm!1838) (not b!22997) (not bm!1816) (not bm!1832) (not bm!1839) (not bm!1808) (not bm!1815) (not b!22992) (not bm!1823) tp_is_empty!1015 (not b_lambda!1559) (not bm!1817) b_and!1471 (not d!3941) (not bm!1799) (not b!22996) (not d!3939) (not b!22940) (not b!22963) (not bm!1833) (not b!22994) (not bm!1809) (not bm!1828) (not bm!1810) (not bm!1795) (not mapNonEmpty!1019) (not bm!1835) (not bm!1820) (not bm!1812) (not bm!1834) (not b!22960) (not bm!1841) (not b!22930) (not b!22986) (not b!22974) (not d!3937) (not bm!1811) (not b_lambda!1561) (not bm!1804) (not b!23007) (not bm!1814) (not d!3929) (not bm!1840) (not b!22962) (not d!3943) (not bm!1796))
(check-sat b_and!1471 (not b_next!751))
