; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4570 () Bool)

(assert start!4570)

(declare-fun b_free!1279 () Bool)

(declare-fun b_next!1279 () Bool)

(assert (=> start!4570 (= b_free!1279 (not b_next!1279))))

(declare-fun tp!5284 () Bool)

(declare-fun b_and!2101 () Bool)

(assert (=> start!4570 (= tp!5284 b_and!2101)))

(declare-fun b!35779 () Bool)

(declare-fun res!21713 () Bool)

(declare-fun e!22594 () Bool)

(assert (=> b!35779 (=> (not res!21713) (not e!22594))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!2003 0))(
  ( (V!2004 (val!843 Int)) )
))
(declare-datatypes ((ValueCell!617 0))(
  ( (ValueCellFull!617 (v!1940 V!2003)) (EmptyCell!617) )
))
(declare-datatypes ((array!2455 0))(
  ( (array!2456 (arr!1172 (Array (_ BitVec 32) ValueCell!617)) (size!1273 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2455)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2457 0))(
  ( (array!2458 (arr!1173 (Array (_ BitVec 32) (_ BitVec 64))) (size!1274 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2457)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!2003)

(declare-fun minValue!1443 () V!2003)

(declare-datatypes ((tuple2!1354 0))(
  ( (tuple2!1355 (_1!688 (_ BitVec 64)) (_2!688 V!2003)) )
))
(declare-datatypes ((List!938 0))(
  ( (Nil!935) (Cons!934 (h!1501 tuple2!1354) (t!3642 List!938)) )
))
(declare-datatypes ((ListLongMap!919 0))(
  ( (ListLongMap!920 (toList!475 List!938)) )
))
(declare-fun contains!425 (ListLongMap!919 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!293 (array!2457 array!2455 (_ BitVec 32) (_ BitVec 32) V!2003 V!2003 (_ BitVec 32) Int) ListLongMap!919)

(assert (=> b!35779 (= res!21713 (not (contains!425 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!35780 () Bool)

(declare-fun res!21719 () Bool)

(assert (=> b!35780 (=> (not res!21719) (not e!22594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35780 (= res!21719 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!2005 () Bool)

(declare-fun mapRes!2005 () Bool)

(assert (=> mapIsEmpty!2005 mapRes!2005))

(declare-fun b!35781 () Bool)

(declare-fun res!21714 () Bool)

(assert (=> b!35781 (=> (not res!21714) (not e!22594))))

(assert (=> b!35781 (= res!21714 (and (= (size!1273 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1274 _keys!1833) (size!1273 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35782 () Bool)

(declare-fun e!22597 () Bool)

(declare-fun tp_is_empty!1633 () Bool)

(assert (=> b!35782 (= e!22597 tp_is_empty!1633)))

(declare-fun res!21715 () Bool)

(assert (=> start!4570 (=> (not res!21715) (not e!22594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4570 (= res!21715 (validMask!0 mask!2294))))

(assert (=> start!4570 e!22594))

(assert (=> start!4570 true))

(assert (=> start!4570 tp!5284))

(declare-fun e!22595 () Bool)

(declare-fun array_inv!827 (array!2455) Bool)

(assert (=> start!4570 (and (array_inv!827 _values!1501) e!22595)))

(declare-fun array_inv!828 (array!2457) Bool)

(assert (=> start!4570 (array_inv!828 _keys!1833)))

(assert (=> start!4570 tp_is_empty!1633))

(declare-fun b!35783 () Bool)

(declare-fun res!21718 () Bool)

(assert (=> b!35783 (=> (not res!21718) (not e!22594))))

(declare-datatypes ((List!939 0))(
  ( (Nil!936) (Cons!935 (h!1502 (_ BitVec 64)) (t!3643 List!939)) )
))
(declare-fun arrayNoDuplicates!0 (array!2457 (_ BitVec 32) List!939) Bool)

(assert (=> b!35783 (= res!21718 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!936))))

(declare-fun b!35784 () Bool)

(declare-fun res!21717 () Bool)

(assert (=> b!35784 (=> (not res!21717) (not e!22594))))

(declare-fun arrayContainsKey!0 (array!2457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35784 (= res!21717 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!2005 () Bool)

(declare-fun tp!5283 () Bool)

(declare-fun e!22598 () Bool)

(assert (=> mapNonEmpty!2005 (= mapRes!2005 (and tp!5283 e!22598))))

(declare-fun mapRest!2005 () (Array (_ BitVec 32) ValueCell!617))

(declare-fun mapValue!2005 () ValueCell!617)

(declare-fun mapKey!2005 () (_ BitVec 32))

(assert (=> mapNonEmpty!2005 (= (arr!1172 _values!1501) (store mapRest!2005 mapKey!2005 mapValue!2005))))

(declare-fun b!35785 () Bool)

(declare-fun res!21716 () Bool)

(assert (=> b!35785 (=> (not res!21716) (not e!22594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2457 (_ BitVec 32)) Bool)

(assert (=> b!35785 (= res!21716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35786 () Bool)

(assert (=> b!35786 (= e!22598 tp_is_empty!1633)))

(declare-fun b!35787 () Bool)

(assert (=> b!35787 (= e!22595 (and e!22597 mapRes!2005))))

(declare-fun condMapEmpty!2005 () Bool)

(declare-fun mapDefault!2005 () ValueCell!617)

(assert (=> b!35787 (= condMapEmpty!2005 (= (arr!1172 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!617)) mapDefault!2005)))))

(declare-fun b!35788 () Bool)

(declare-datatypes ((SeekEntryResult!170 0))(
  ( (MissingZero!170 (index!2802 (_ BitVec 32))) (Found!170 (index!2803 (_ BitVec 32))) (Intermediate!170 (undefined!982 Bool) (index!2804 (_ BitVec 32)) (x!7058 (_ BitVec 32))) (Undefined!170) (MissingVacant!170 (index!2805 (_ BitVec 32))) )
))
(declare-fun lt!13212 () SeekEntryResult!170)

(get-info :version)

(assert (=> b!35788 (= e!22594 (and (not ((_ is Found!170) lt!13212)) (not ((_ is MissingZero!170) lt!13212)) (not ((_ is Undefined!170) lt!13212))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2457 (_ BitVec 32)) SeekEntryResult!170)

(assert (=> b!35788 (= lt!13212 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(assert (= (and start!4570 res!21715) b!35781))

(assert (= (and b!35781 res!21714) b!35785))

(assert (= (and b!35785 res!21716) b!35783))

(assert (= (and b!35783 res!21718) b!35780))

(assert (= (and b!35780 res!21719) b!35779))

(assert (= (and b!35779 res!21713) b!35784))

(assert (= (and b!35784 res!21717) b!35788))

(assert (= (and b!35787 condMapEmpty!2005) mapIsEmpty!2005))

(assert (= (and b!35787 (not condMapEmpty!2005)) mapNonEmpty!2005))

(assert (= (and mapNonEmpty!2005 ((_ is ValueCellFull!617) mapValue!2005)) b!35786))

(assert (= (and b!35787 ((_ is ValueCellFull!617) mapDefault!2005)) b!35782))

(assert (= start!4570 b!35787))

(declare-fun m!28739 () Bool)

(assert (=> b!35785 m!28739))

(declare-fun m!28741 () Bool)

(assert (=> b!35783 m!28741))

(declare-fun m!28743 () Bool)

(assert (=> b!35780 m!28743))

(declare-fun m!28745 () Bool)

(assert (=> b!35788 m!28745))

(declare-fun m!28747 () Bool)

(assert (=> b!35779 m!28747))

(assert (=> b!35779 m!28747))

(declare-fun m!28749 () Bool)

(assert (=> b!35779 m!28749))

(declare-fun m!28751 () Bool)

(assert (=> b!35784 m!28751))

(declare-fun m!28753 () Bool)

(assert (=> mapNonEmpty!2005 m!28753))

(declare-fun m!28755 () Bool)

(assert (=> start!4570 m!28755))

(declare-fun m!28757 () Bool)

(assert (=> start!4570 m!28757))

(declare-fun m!28759 () Bool)

(assert (=> start!4570 m!28759))

(check-sat (not b!35784) (not b!35779) tp_is_empty!1633 (not start!4570) (not b!35785) (not b!35783) (not mapNonEmpty!2005) b_and!2101 (not b!35788) (not b_next!1279) (not b!35780))
(check-sat b_and!2101 (not b_next!1279))
(get-model)

(declare-fun b!35859 () Bool)

(declare-fun e!22637 () Bool)

(declare-fun call!2835 () Bool)

(assert (=> b!35859 (= e!22637 call!2835)))

(declare-fun b!35860 () Bool)

(assert (=> b!35860 (= e!22637 call!2835)))

(declare-fun b!35861 () Bool)

(declare-fun e!22638 () Bool)

(assert (=> b!35861 (= e!22638 e!22637)))

(declare-fun c!4059 () Bool)

(assert (=> b!35861 (= c!4059 (validKeyInArray!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2832 () Bool)

(assert (=> bm!2832 (= call!2835 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4059 (Cons!935 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) Nil!936) Nil!936)))))

(declare-fun b!35862 () Bool)

(declare-fun e!22639 () Bool)

(declare-fun contains!426 (List!939 (_ BitVec 64)) Bool)

(assert (=> b!35862 (= e!22639 (contains!426 Nil!936 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35863 () Bool)

(declare-fun e!22640 () Bool)

(assert (=> b!35863 (= e!22640 e!22638)))

(declare-fun res!21769 () Bool)

(assert (=> b!35863 (=> (not res!21769) (not e!22638))))

(assert (=> b!35863 (= res!21769 (not e!22639))))

(declare-fun res!21768 () Bool)

(assert (=> b!35863 (=> (not res!21768) (not e!22639))))

(assert (=> b!35863 (= res!21768 (validKeyInArray!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5311 () Bool)

(declare-fun res!21770 () Bool)

(assert (=> d!5311 (=> res!21770 e!22640)))

(assert (=> d!5311 (= res!21770 (bvsge #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(assert (=> d!5311 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!936) e!22640)))

(assert (= (and d!5311 (not res!21770)) b!35863))

(assert (= (and b!35863 res!21768) b!35862))

(assert (= (and b!35863 res!21769) b!35861))

(assert (= (and b!35861 c!4059) b!35860))

(assert (= (and b!35861 (not c!4059)) b!35859))

(assert (= (or b!35860 b!35859) bm!2832))

(declare-fun m!28805 () Bool)

(assert (=> b!35861 m!28805))

(assert (=> b!35861 m!28805))

(declare-fun m!28807 () Bool)

(assert (=> b!35861 m!28807))

(assert (=> bm!2832 m!28805))

(declare-fun m!28809 () Bool)

(assert (=> bm!2832 m!28809))

(assert (=> b!35862 m!28805))

(assert (=> b!35862 m!28805))

(declare-fun m!28811 () Bool)

(assert (=> b!35862 m!28811))

(assert (=> b!35863 m!28805))

(assert (=> b!35863 m!28805))

(assert (=> b!35863 m!28807))

(assert (=> b!35783 d!5311))

(declare-fun d!5313 () Bool)

(declare-fun e!22646 () Bool)

(assert (=> d!5313 e!22646))

(declare-fun res!21773 () Bool)

(assert (=> d!5313 (=> res!21773 e!22646)))

(declare-fun lt!13230 () Bool)

(assert (=> d!5313 (= res!21773 (not lt!13230))))

(declare-fun lt!13227 () Bool)

(assert (=> d!5313 (= lt!13230 lt!13227)))

(declare-datatypes ((Unit!795 0))(
  ( (Unit!796) )
))
(declare-fun lt!13228 () Unit!795)

(declare-fun e!22645 () Unit!795)

(assert (=> d!5313 (= lt!13228 e!22645)))

(declare-fun c!4062 () Bool)

(assert (=> d!5313 (= c!4062 lt!13227)))

(declare-fun containsKey!37 (List!938 (_ BitVec 64)) Bool)

(assert (=> d!5313 (= lt!13227 (containsKey!37 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5313 (= (contains!425 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!13230)))

(declare-fun b!35870 () Bool)

(declare-fun lt!13229 () Unit!795)

(assert (=> b!35870 (= e!22645 lt!13229)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!34 (List!938 (_ BitVec 64)) Unit!795)

(assert (=> b!35870 (= lt!13229 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!79 0))(
  ( (Some!78 (v!1943 V!2003)) (None!77) )
))
(declare-fun isDefined!35 (Option!79) Bool)

(declare-fun getValueByKey!73 (List!938 (_ BitVec 64)) Option!79)

(assert (=> b!35870 (isDefined!35 (getValueByKey!73 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35871 () Bool)

(declare-fun Unit!797 () Unit!795)

(assert (=> b!35871 (= e!22645 Unit!797)))

(declare-fun b!35872 () Bool)

(assert (=> b!35872 (= e!22646 (isDefined!35 (getValueByKey!73 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5313 c!4062) b!35870))

(assert (= (and d!5313 (not c!4062)) b!35871))

(assert (= (and d!5313 (not res!21773)) b!35872))

(declare-fun m!28813 () Bool)

(assert (=> d!5313 m!28813))

(declare-fun m!28815 () Bool)

(assert (=> b!35870 m!28815))

(declare-fun m!28817 () Bool)

(assert (=> b!35870 m!28817))

(assert (=> b!35870 m!28817))

(declare-fun m!28819 () Bool)

(assert (=> b!35870 m!28819))

(assert (=> b!35872 m!28817))

(assert (=> b!35872 m!28817))

(assert (=> b!35872 m!28819))

(assert (=> b!35779 d!5313))

(declare-fun bm!2847 () Bool)

(declare-fun call!2855 () ListLongMap!919)

(declare-fun call!2850 () ListLongMap!919)

(assert (=> bm!2847 (= call!2855 call!2850)))

(declare-fun b!35915 () Bool)

(declare-fun res!21798 () Bool)

(declare-fun e!22678 () Bool)

(assert (=> b!35915 (=> (not res!21798) (not e!22678))))

(declare-fun e!22681 () Bool)

(assert (=> b!35915 (= res!21798 e!22681)))

(declare-fun c!4079 () Bool)

(assert (=> b!35915 (= c!4079 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!35916 () Bool)

(declare-fun e!22673 () Bool)

(assert (=> b!35916 (= e!22673 (validKeyInArray!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2848 () Bool)

(declare-fun call!2856 () Bool)

(declare-fun lt!13288 () ListLongMap!919)

(assert (=> bm!2848 (= call!2856 (contains!425 lt!13288 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35917 () Bool)

(declare-fun e!22683 () Bool)

(declare-fun e!22677 () Bool)

(assert (=> b!35917 (= e!22683 e!22677)))

(declare-fun res!21800 () Bool)

(assert (=> b!35917 (=> (not res!21800) (not e!22677))))

(assert (=> b!35917 (= res!21800 (contains!425 lt!13288 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35917 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(declare-fun b!35918 () Bool)

(declare-fun e!22685 () ListLongMap!919)

(declare-fun call!2854 () ListLongMap!919)

(assert (=> b!35918 (= e!22685 call!2854)))

(declare-fun bm!2849 () Bool)

(declare-fun call!2853 () ListLongMap!919)

(assert (=> bm!2849 (= call!2854 call!2853)))

(declare-fun b!35919 () Bool)

(declare-fun e!22682 () Bool)

(assert (=> b!35919 (= e!22678 e!22682)))

(declare-fun c!4077 () Bool)

(assert (=> b!35919 (= c!4077 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35920 () Bool)

(declare-fun e!22675 () Bool)

(assert (=> b!35920 (= e!22675 (validKeyInArray!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35921 () Bool)

(declare-fun e!22674 () Unit!795)

(declare-fun lt!13295 () Unit!795)

(assert (=> b!35921 (= e!22674 lt!13295)))

(declare-fun lt!13289 () ListLongMap!919)

(declare-fun getCurrentListMapNoExtraKeys!29 (array!2457 array!2455 (_ BitVec 32) (_ BitVec 32) V!2003 V!2003 (_ BitVec 32) Int) ListLongMap!919)

(assert (=> b!35921 (= lt!13289 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13282 () (_ BitVec 64))

(assert (=> b!35921 (= lt!13282 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13293 () (_ BitVec 64))

(assert (=> b!35921 (= lt!13293 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13281 () Unit!795)

(declare-fun addStillContains!27 (ListLongMap!919 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!795)

(assert (=> b!35921 (= lt!13281 (addStillContains!27 lt!13289 lt!13282 zeroValue!1443 lt!13293))))

(declare-fun +!60 (ListLongMap!919 tuple2!1354) ListLongMap!919)

(assert (=> b!35921 (contains!425 (+!60 lt!13289 (tuple2!1355 lt!13282 zeroValue!1443)) lt!13293)))

(declare-fun lt!13276 () Unit!795)

(assert (=> b!35921 (= lt!13276 lt!13281)))

(declare-fun lt!13292 () ListLongMap!919)

(assert (=> b!35921 (= lt!13292 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13275 () (_ BitVec 64))

(assert (=> b!35921 (= lt!13275 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13290 () (_ BitVec 64))

(assert (=> b!35921 (= lt!13290 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13284 () Unit!795)

(declare-fun addApplyDifferent!27 (ListLongMap!919 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!795)

(assert (=> b!35921 (= lt!13284 (addApplyDifferent!27 lt!13292 lt!13275 minValue!1443 lt!13290))))

(declare-fun apply!42 (ListLongMap!919 (_ BitVec 64)) V!2003)

(assert (=> b!35921 (= (apply!42 (+!60 lt!13292 (tuple2!1355 lt!13275 minValue!1443)) lt!13290) (apply!42 lt!13292 lt!13290))))

(declare-fun lt!13287 () Unit!795)

(assert (=> b!35921 (= lt!13287 lt!13284)))

(declare-fun lt!13291 () ListLongMap!919)

(assert (=> b!35921 (= lt!13291 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13285 () (_ BitVec 64))

(assert (=> b!35921 (= lt!13285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13286 () (_ BitVec 64))

(assert (=> b!35921 (= lt!13286 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13283 () Unit!795)

(assert (=> b!35921 (= lt!13283 (addApplyDifferent!27 lt!13291 lt!13285 zeroValue!1443 lt!13286))))

(assert (=> b!35921 (= (apply!42 (+!60 lt!13291 (tuple2!1355 lt!13285 zeroValue!1443)) lt!13286) (apply!42 lt!13291 lt!13286))))

(declare-fun lt!13294 () Unit!795)

(assert (=> b!35921 (= lt!13294 lt!13283)))

(declare-fun lt!13280 () ListLongMap!919)

(assert (=> b!35921 (= lt!13280 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13277 () (_ BitVec 64))

(assert (=> b!35921 (= lt!13277 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13296 () (_ BitVec 64))

(assert (=> b!35921 (= lt!13296 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35921 (= lt!13295 (addApplyDifferent!27 lt!13280 lt!13277 minValue!1443 lt!13296))))

(assert (=> b!35921 (= (apply!42 (+!60 lt!13280 (tuple2!1355 lt!13277 minValue!1443)) lt!13296) (apply!42 lt!13280 lt!13296))))

(declare-fun bm!2850 () Bool)

(declare-fun call!2852 () ListLongMap!919)

(assert (=> bm!2850 (= call!2852 call!2855)))

(declare-fun b!35922 () Bool)

(declare-fun e!22684 () ListLongMap!919)

(assert (=> b!35922 (= e!22684 e!22685)))

(declare-fun c!4076 () Bool)

(assert (=> b!35922 (= c!4076 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2851 () Bool)

(declare-fun call!2851 () Bool)

(assert (=> bm!2851 (= call!2851 (contains!425 lt!13288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35924 () Bool)

(declare-fun e!22680 () ListLongMap!919)

(assert (=> b!35924 (= e!22680 call!2852)))

(declare-fun b!35925 () Bool)

(declare-fun Unit!798 () Unit!795)

(assert (=> b!35925 (= e!22674 Unit!798)))

(declare-fun b!35926 () Bool)

(assert (=> b!35926 (= e!22681 (not call!2851))))

(declare-fun b!35927 () Bool)

(declare-fun e!22679 () Bool)

(assert (=> b!35927 (= e!22679 (= (apply!42 lt!13288 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun bm!2852 () Bool)

(declare-fun c!4075 () Bool)

(assert (=> bm!2852 (= call!2853 (+!60 (ite c!4075 call!2850 (ite c!4076 call!2855 call!2852)) (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun bm!2853 () Bool)

(assert (=> bm!2853 (= call!2850 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35928 () Bool)

(declare-fun e!22676 () Bool)

(assert (=> b!35928 (= e!22676 (= (apply!42 lt!13288 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35929 () Bool)

(declare-fun res!21797 () Bool)

(assert (=> b!35929 (=> (not res!21797) (not e!22678))))

(assert (=> b!35929 (= res!21797 e!22683)))

(declare-fun res!21794 () Bool)

(assert (=> b!35929 (=> res!21794 e!22683)))

(assert (=> b!35929 (= res!21794 (not e!22673))))

(declare-fun res!21799 () Bool)

(assert (=> b!35929 (=> (not res!21799) (not e!22673))))

(assert (=> b!35929 (= res!21799 (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(declare-fun b!35930 () Bool)

(assert (=> b!35930 (= e!22680 call!2854)))

(declare-fun b!35931 () Bool)

(declare-fun get!611 (ValueCell!617 V!2003) V!2003)

(declare-fun dynLambda!158 (Int (_ BitVec 64)) V!2003)

(assert (=> b!35931 (= e!22677 (= (apply!42 lt!13288 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)) (get!611 (select (arr!1172 _values!1501) #b00000000000000000000000000000000) (dynLambda!158 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1273 _values!1501)))))

(assert (=> b!35931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(declare-fun b!35932 () Bool)

(assert (=> b!35932 (= e!22684 (+!60 call!2853 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35933 () Bool)

(assert (=> b!35933 (= e!22682 (not call!2856))))

(declare-fun b!35934 () Bool)

(assert (=> b!35934 (= e!22682 e!22676)))

(declare-fun res!21795 () Bool)

(assert (=> b!35934 (= res!21795 call!2856)))

(assert (=> b!35934 (=> (not res!21795) (not e!22676))))

(declare-fun b!35935 () Bool)

(assert (=> b!35935 (= e!22681 e!22679)))

(declare-fun res!21792 () Bool)

(assert (=> b!35935 (= res!21792 call!2851)))

(assert (=> b!35935 (=> (not res!21792) (not e!22679))))

(declare-fun b!35923 () Bool)

(declare-fun c!4078 () Bool)

(assert (=> b!35923 (= c!4078 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!35923 (= e!22685 e!22680)))

(declare-fun d!5315 () Bool)

(assert (=> d!5315 e!22678))

(declare-fun res!21796 () Bool)

(assert (=> d!5315 (=> (not res!21796) (not e!22678))))

(assert (=> d!5315 (= res!21796 (or (bvsge #b00000000000000000000000000000000 (size!1274 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))))

(declare-fun lt!13279 () ListLongMap!919)

(assert (=> d!5315 (= lt!13288 lt!13279)))

(declare-fun lt!13278 () Unit!795)

(assert (=> d!5315 (= lt!13278 e!22674)))

(declare-fun c!4080 () Bool)

(assert (=> d!5315 (= c!4080 e!22675)))

(declare-fun res!21793 () Bool)

(assert (=> d!5315 (=> (not res!21793) (not e!22675))))

(assert (=> d!5315 (= res!21793 (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(assert (=> d!5315 (= lt!13279 e!22684)))

(assert (=> d!5315 (= c!4075 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5315 (validMask!0 mask!2294)))

(assert (=> d!5315 (= (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13288)))

(assert (= (and d!5315 c!4075) b!35932))

(assert (= (and d!5315 (not c!4075)) b!35922))

(assert (= (and b!35922 c!4076) b!35918))

(assert (= (and b!35922 (not c!4076)) b!35923))

(assert (= (and b!35923 c!4078) b!35930))

(assert (= (and b!35923 (not c!4078)) b!35924))

(assert (= (or b!35930 b!35924) bm!2850))

(assert (= (or b!35918 bm!2850) bm!2847))

(assert (= (or b!35918 b!35930) bm!2849))

(assert (= (or b!35932 bm!2847) bm!2853))

(assert (= (or b!35932 bm!2849) bm!2852))

(assert (= (and d!5315 res!21793) b!35920))

(assert (= (and d!5315 c!4080) b!35921))

(assert (= (and d!5315 (not c!4080)) b!35925))

(assert (= (and d!5315 res!21796) b!35929))

(assert (= (and b!35929 res!21799) b!35916))

(assert (= (and b!35929 (not res!21794)) b!35917))

(assert (= (and b!35917 res!21800) b!35931))

(assert (= (and b!35929 res!21797) b!35915))

(assert (= (and b!35915 c!4079) b!35935))

(assert (= (and b!35915 (not c!4079)) b!35926))

(assert (= (and b!35935 res!21792) b!35927))

(assert (= (or b!35935 b!35926) bm!2851))

(assert (= (and b!35915 res!21798) b!35919))

(assert (= (and b!35919 c!4077) b!35934))

(assert (= (and b!35919 (not c!4077)) b!35933))

(assert (= (and b!35934 res!21795) b!35928))

(assert (= (or b!35934 b!35933) bm!2848))

(declare-fun b_lambda!1719 () Bool)

(assert (=> (not b_lambda!1719) (not b!35931)))

(declare-fun t!3646 () Bool)

(declare-fun tb!693 () Bool)

(assert (=> (and start!4570 (= defaultEntry!1504 defaultEntry!1504) t!3646) tb!693))

(declare-fun result!1201 () Bool)

(assert (=> tb!693 (= result!1201 tp_is_empty!1633)))

(assert (=> b!35931 t!3646))

(declare-fun b_and!2107 () Bool)

(assert (= b_and!2101 (and (=> t!3646 result!1201) b_and!2107)))

(assert (=> b!35916 m!28805))

(assert (=> b!35916 m!28805))

(assert (=> b!35916 m!28807))

(declare-fun m!28821 () Bool)

(assert (=> b!35927 m!28821))

(declare-fun m!28823 () Bool)

(assert (=> bm!2852 m!28823))

(declare-fun m!28825 () Bool)

(assert (=> bm!2853 m!28825))

(declare-fun m!28827 () Bool)

(assert (=> bm!2848 m!28827))

(declare-fun m!28829 () Bool)

(assert (=> b!35921 m!28829))

(declare-fun m!28831 () Bool)

(assert (=> b!35921 m!28831))

(declare-fun m!28833 () Bool)

(assert (=> b!35921 m!28833))

(declare-fun m!28835 () Bool)

(assert (=> b!35921 m!28835))

(declare-fun m!28837 () Bool)

(assert (=> b!35921 m!28837))

(declare-fun m!28839 () Bool)

(assert (=> b!35921 m!28839))

(declare-fun m!28841 () Bool)

(assert (=> b!35921 m!28841))

(assert (=> b!35921 m!28805))

(assert (=> b!35921 m!28839))

(assert (=> b!35921 m!28825))

(declare-fun m!28843 () Bool)

(assert (=> b!35921 m!28843))

(declare-fun m!28845 () Bool)

(assert (=> b!35921 m!28845))

(declare-fun m!28847 () Bool)

(assert (=> b!35921 m!28847))

(declare-fun m!28849 () Bool)

(assert (=> b!35921 m!28849))

(declare-fun m!28851 () Bool)

(assert (=> b!35921 m!28851))

(declare-fun m!28853 () Bool)

(assert (=> b!35921 m!28853))

(assert (=> b!35921 m!28831))

(declare-fun m!28855 () Bool)

(assert (=> b!35921 m!28855))

(assert (=> b!35921 m!28833))

(declare-fun m!28857 () Bool)

(assert (=> b!35921 m!28857))

(assert (=> b!35921 m!28843))

(assert (=> b!35917 m!28805))

(assert (=> b!35917 m!28805))

(declare-fun m!28859 () Bool)

(assert (=> b!35917 m!28859))

(assert (=> b!35931 m!28805))

(declare-fun m!28861 () Bool)

(assert (=> b!35931 m!28861))

(declare-fun m!28863 () Bool)

(assert (=> b!35931 m!28863))

(declare-fun m!28865 () Bool)

(assert (=> b!35931 m!28865))

(declare-fun m!28867 () Bool)

(assert (=> b!35931 m!28867))

(assert (=> b!35931 m!28865))

(assert (=> b!35931 m!28863))

(assert (=> b!35931 m!28805))

(declare-fun m!28869 () Bool)

(assert (=> b!35932 m!28869))

(assert (=> d!5315 m!28755))

(declare-fun m!28871 () Bool)

(assert (=> b!35928 m!28871))

(declare-fun m!28873 () Bool)

(assert (=> bm!2851 m!28873))

(assert (=> b!35920 m!28805))

(assert (=> b!35920 m!28805))

(assert (=> b!35920 m!28807))

(assert (=> b!35779 d!5315))

(declare-fun b!35950 () Bool)

(declare-fun e!22694 () SeekEntryResult!170)

(declare-fun lt!13305 () SeekEntryResult!170)

(assert (=> b!35950 (= e!22694 (Found!170 (index!2804 lt!13305)))))

(declare-fun b!35951 () Bool)

(declare-fun c!4089 () Bool)

(declare-fun lt!13306 () (_ BitVec 64))

(assert (=> b!35951 (= c!4089 (= lt!13306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22692 () SeekEntryResult!170)

(assert (=> b!35951 (= e!22694 e!22692)))

(declare-fun d!5317 () Bool)

(declare-fun lt!13308 () SeekEntryResult!170)

(assert (=> d!5317 (and (or ((_ is MissingVacant!170) lt!13308) (not ((_ is Found!170) lt!13308)) (and (bvsge (index!2803 lt!13308) #b00000000000000000000000000000000) (bvslt (index!2803 lt!13308) (size!1274 _keys!1833)))) (not ((_ is MissingVacant!170) lt!13308)) (or (not ((_ is Found!170) lt!13308)) (= (select (arr!1173 _keys!1833) (index!2803 lt!13308)) k0!1304)))))

(declare-fun e!22693 () SeekEntryResult!170)

(assert (=> d!5317 (= lt!13308 e!22693)))

(declare-fun c!4088 () Bool)

(assert (=> d!5317 (= c!4088 (and ((_ is Intermediate!170) lt!13305) (undefined!982 lt!13305)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2457 (_ BitVec 32)) SeekEntryResult!170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5317 (= lt!13305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5317 (validMask!0 mask!2294)))

(assert (=> d!5317 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!13308)))

(declare-fun b!35952 () Bool)

(assert (=> b!35952 (= e!22693 Undefined!170)))

(declare-fun b!35953 () Bool)

(declare-fun lt!13307 () SeekEntryResult!170)

(assert (=> b!35953 (= e!22692 (ite ((_ is MissingVacant!170) lt!13307) (MissingZero!170 (index!2805 lt!13307)) lt!13307))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2457 (_ BitVec 32)) SeekEntryResult!170)

(assert (=> b!35953 (= lt!13307 (seekKeyOrZeroReturnVacant!0 (x!7058 lt!13305) (index!2804 lt!13305) (index!2804 lt!13305) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35954 () Bool)

(assert (=> b!35954 (= e!22693 e!22694)))

(assert (=> b!35954 (= lt!13306 (select (arr!1173 _keys!1833) (index!2804 lt!13305)))))

(declare-fun c!4087 () Bool)

(assert (=> b!35954 (= c!4087 (= lt!13306 k0!1304))))

(declare-fun b!35955 () Bool)

(assert (=> b!35955 (= e!22692 (MissingZero!170 (index!2804 lt!13305)))))

(assert (= (and d!5317 c!4088) b!35952))

(assert (= (and d!5317 (not c!4088)) b!35954))

(assert (= (and b!35954 c!4087) b!35950))

(assert (= (and b!35954 (not c!4087)) b!35951))

(assert (= (and b!35951 c!4089) b!35955))

(assert (= (and b!35951 (not c!4089)) b!35953))

(declare-fun m!28875 () Bool)

(assert (=> d!5317 m!28875))

(declare-fun m!28877 () Bool)

(assert (=> d!5317 m!28877))

(assert (=> d!5317 m!28877))

(declare-fun m!28879 () Bool)

(assert (=> d!5317 m!28879))

(assert (=> d!5317 m!28755))

(declare-fun m!28881 () Bool)

(assert (=> b!35953 m!28881))

(declare-fun m!28883 () Bool)

(assert (=> b!35954 m!28883))

(assert (=> b!35788 d!5317))

(declare-fun d!5319 () Bool)

(declare-fun res!21805 () Bool)

(declare-fun e!22699 () Bool)

(assert (=> d!5319 (=> res!21805 e!22699)))

(assert (=> d!5319 (= res!21805 (= (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5319 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22699)))

(declare-fun b!35960 () Bool)

(declare-fun e!22700 () Bool)

(assert (=> b!35960 (= e!22699 e!22700)))

(declare-fun res!21806 () Bool)

(assert (=> b!35960 (=> (not res!21806) (not e!22700))))

(assert (=> b!35960 (= res!21806 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1274 _keys!1833)))))

(declare-fun b!35961 () Bool)

(assert (=> b!35961 (= e!22700 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5319 (not res!21805)) b!35960))

(assert (= (and b!35960 res!21806) b!35961))

(assert (=> d!5319 m!28805))

(declare-fun m!28885 () Bool)

(assert (=> b!35961 m!28885))

(assert (=> b!35784 d!5319))

(declare-fun d!5321 () Bool)

(assert (=> d!5321 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4570 d!5321))

(declare-fun d!5323 () Bool)

(assert (=> d!5323 (= (array_inv!827 _values!1501) (bvsge (size!1273 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4570 d!5323))

(declare-fun d!5325 () Bool)

(assert (=> d!5325 (= (array_inv!828 _keys!1833) (bvsge (size!1274 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4570 d!5325))

(declare-fun d!5327 () Bool)

(assert (=> d!5327 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35780 d!5327))

(declare-fun b!35970 () Bool)

(declare-fun e!22708 () Bool)

(declare-fun e!22707 () Bool)

(assert (=> b!35970 (= e!22708 e!22707)))

(declare-fun lt!13317 () (_ BitVec 64))

(assert (=> b!35970 (= lt!13317 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13315 () Unit!795)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2457 (_ BitVec 64) (_ BitVec 32)) Unit!795)

(assert (=> b!35970 (= lt!13315 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13317 #b00000000000000000000000000000000))))

(assert (=> b!35970 (arrayContainsKey!0 _keys!1833 lt!13317 #b00000000000000000000000000000000)))

(declare-fun lt!13316 () Unit!795)

(assert (=> b!35970 (= lt!13316 lt!13315)))

(declare-fun res!21812 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2457 (_ BitVec 32)) SeekEntryResult!170)

(assert (=> b!35970 (= res!21812 (= (seekEntryOrOpen!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!170 #b00000000000000000000000000000000)))))

(assert (=> b!35970 (=> (not res!21812) (not e!22707))))

(declare-fun b!35971 () Bool)

(declare-fun e!22709 () Bool)

(assert (=> b!35971 (= e!22709 e!22708)))

(declare-fun c!4092 () Bool)

(assert (=> b!35971 (= c!4092 (validKeyInArray!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2856 () Bool)

(declare-fun call!2859 () Bool)

(assert (=> bm!2856 (= call!2859 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!35972 () Bool)

(assert (=> b!35972 (= e!22708 call!2859)))

(declare-fun b!35973 () Bool)

(assert (=> b!35973 (= e!22707 call!2859)))

(declare-fun d!5329 () Bool)

(declare-fun res!21811 () Bool)

(assert (=> d!5329 (=> res!21811 e!22709)))

(assert (=> d!5329 (= res!21811 (bvsge #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(assert (=> d!5329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22709)))

(assert (= (and d!5329 (not res!21811)) b!35971))

(assert (= (and b!35971 c!4092) b!35970))

(assert (= (and b!35971 (not c!4092)) b!35972))

(assert (= (and b!35970 res!21812) b!35973))

(assert (= (or b!35973 b!35972) bm!2856))

(assert (=> b!35970 m!28805))

(declare-fun m!28887 () Bool)

(assert (=> b!35970 m!28887))

(declare-fun m!28889 () Bool)

(assert (=> b!35970 m!28889))

(assert (=> b!35970 m!28805))

(declare-fun m!28891 () Bool)

(assert (=> b!35970 m!28891))

(assert (=> b!35971 m!28805))

(assert (=> b!35971 m!28805))

(assert (=> b!35971 m!28807))

(declare-fun m!28893 () Bool)

(assert (=> bm!2856 m!28893))

(assert (=> b!35785 d!5329))

(declare-fun mapIsEmpty!2014 () Bool)

(declare-fun mapRes!2014 () Bool)

(assert (=> mapIsEmpty!2014 mapRes!2014))

(declare-fun mapNonEmpty!2014 () Bool)

(declare-fun tp!5299 () Bool)

(declare-fun e!22714 () Bool)

(assert (=> mapNonEmpty!2014 (= mapRes!2014 (and tp!5299 e!22714))))

(declare-fun mapValue!2014 () ValueCell!617)

(declare-fun mapKey!2014 () (_ BitVec 32))

(declare-fun mapRest!2014 () (Array (_ BitVec 32) ValueCell!617))

(assert (=> mapNonEmpty!2014 (= mapRest!2005 (store mapRest!2014 mapKey!2014 mapValue!2014))))

(declare-fun b!35980 () Bool)

(assert (=> b!35980 (= e!22714 tp_is_empty!1633)))

(declare-fun condMapEmpty!2014 () Bool)

(declare-fun mapDefault!2014 () ValueCell!617)

(assert (=> mapNonEmpty!2005 (= condMapEmpty!2014 (= mapRest!2005 ((as const (Array (_ BitVec 32) ValueCell!617)) mapDefault!2014)))))

(declare-fun e!22715 () Bool)

(assert (=> mapNonEmpty!2005 (= tp!5283 (and e!22715 mapRes!2014))))

(declare-fun b!35981 () Bool)

(assert (=> b!35981 (= e!22715 tp_is_empty!1633)))

(assert (= (and mapNonEmpty!2005 condMapEmpty!2014) mapIsEmpty!2014))

(assert (= (and mapNonEmpty!2005 (not condMapEmpty!2014)) mapNonEmpty!2014))

(assert (= (and mapNonEmpty!2014 ((_ is ValueCellFull!617) mapValue!2014)) b!35980))

(assert (= (and mapNonEmpty!2005 ((_ is ValueCellFull!617) mapDefault!2014)) b!35981))

(declare-fun m!28895 () Bool)

(assert (=> mapNonEmpty!2014 m!28895))

(declare-fun b_lambda!1721 () Bool)

(assert (= b_lambda!1719 (or (and start!4570 b_free!1279) b_lambda!1721)))

(check-sat (not d!5315) (not d!5317) (not b!35970) (not b!35861) (not b!35917) b_and!2107 (not bm!2832) (not b!35932) (not b!35921) (not b!35872) (not b!35920) (not b!35931) (not b!35927) (not b_next!1279) (not b!35862) (not b!35870) (not bm!2851) (not bm!2852) tp_is_empty!1633 (not b!35953) (not bm!2848) (not b!35961) (not mapNonEmpty!2014) (not b_lambda!1721) (not d!5313) (not b!35863) (not bm!2853) (not b!35916) (not b!35928) (not b!35971) (not bm!2856))
(check-sat b_and!2107 (not b_next!1279))
(get-model)

(assert (=> d!5315 d!5321))

(declare-fun b!36006 () Bool)

(assert (=> b!36006 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(assert (=> b!36006 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1273 _values!1501)))))

(declare-fun lt!13332 () ListLongMap!919)

(declare-fun e!22733 () Bool)

(assert (=> b!36006 (= e!22733 (= (apply!42 lt!13332 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)) (get!611 (select (arr!1172 _values!1501) #b00000000000000000000000000000000) (dynLambda!158 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!36007 () Bool)

(declare-fun e!22732 () Bool)

(assert (=> b!36007 (= e!22732 (= lt!13332 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1504)))))

(declare-fun bm!2859 () Bool)

(declare-fun call!2862 () ListLongMap!919)

(assert (=> bm!2859 (= call!2862 (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1504))))

(declare-fun d!5331 () Bool)

(declare-fun e!22736 () Bool)

(assert (=> d!5331 e!22736))

(declare-fun res!21823 () Bool)

(assert (=> d!5331 (=> (not res!21823) (not e!22736))))

(assert (=> d!5331 (= res!21823 (not (contains!425 lt!13332 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!22734 () ListLongMap!919)

(assert (=> d!5331 (= lt!13332 e!22734)))

(declare-fun c!4102 () Bool)

(assert (=> d!5331 (= c!4102 (bvsge #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(assert (=> d!5331 (validMask!0 mask!2294)))

(assert (=> d!5331 (= (getCurrentListMapNoExtraKeys!29 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!13332)))

(declare-fun b!36008 () Bool)

(declare-fun e!22735 () ListLongMap!919)

(assert (=> b!36008 (= e!22735 call!2862)))

(declare-fun b!36009 () Bool)

(declare-fun e!22730 () Bool)

(assert (=> b!36009 (= e!22730 e!22733)))

(assert (=> b!36009 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(declare-fun res!21822 () Bool)

(assert (=> b!36009 (= res!21822 (contains!425 lt!13332 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!36009 (=> (not res!21822) (not e!22733))))

(declare-fun b!36010 () Bool)

(declare-fun res!21821 () Bool)

(assert (=> b!36010 (=> (not res!21821) (not e!22736))))

(assert (=> b!36010 (= res!21821 (not (contains!425 lt!13332 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36011 () Bool)

(assert (=> b!36011 (= e!22734 e!22735)))

(declare-fun c!4101 () Bool)

(assert (=> b!36011 (= c!4101 (validKeyInArray!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36012 () Bool)

(declare-fun isEmpty!174 (ListLongMap!919) Bool)

(assert (=> b!36012 (= e!22732 (isEmpty!174 lt!13332))))

(declare-fun b!36013 () Bool)

(assert (=> b!36013 (= e!22734 (ListLongMap!920 Nil!935))))

(declare-fun b!36014 () Bool)

(declare-fun lt!13337 () Unit!795)

(declare-fun lt!13338 () Unit!795)

(assert (=> b!36014 (= lt!13337 lt!13338)))

(declare-fun lt!13334 () ListLongMap!919)

(declare-fun lt!13333 () (_ BitVec 64))

(declare-fun lt!13335 () V!2003)

(declare-fun lt!13336 () (_ BitVec 64))

(assert (=> b!36014 (not (contains!425 (+!60 lt!13334 (tuple2!1355 lt!13333 lt!13335)) lt!13336))))

(declare-fun addStillNotContains!3 (ListLongMap!919 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!795)

(assert (=> b!36014 (= lt!13338 (addStillNotContains!3 lt!13334 lt!13333 lt!13335 lt!13336))))

(assert (=> b!36014 (= lt!13336 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!36014 (= lt!13335 (get!611 (select (arr!1172 _values!1501) #b00000000000000000000000000000000) (dynLambda!158 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36014 (= lt!13333 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!36014 (= lt!13334 call!2862)))

(assert (=> b!36014 (= e!22735 (+!60 call!2862 (tuple2!1355 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) (get!611 (select (arr!1172 _values!1501) #b00000000000000000000000000000000) (dynLambda!158 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!36015 () Bool)

(assert (=> b!36015 (= e!22736 e!22730)))

(declare-fun c!4104 () Bool)

(declare-fun e!22731 () Bool)

(assert (=> b!36015 (= c!4104 e!22731)))

(declare-fun res!21824 () Bool)

(assert (=> b!36015 (=> (not res!21824) (not e!22731))))

(assert (=> b!36015 (= res!21824 (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(declare-fun b!36016 () Bool)

(assert (=> b!36016 (= e!22730 e!22732)))

(declare-fun c!4103 () Bool)

(assert (=> b!36016 (= c!4103 (bvslt #b00000000000000000000000000000000 (size!1274 _keys!1833)))))

(declare-fun b!36017 () Bool)

(assert (=> b!36017 (= e!22731 (validKeyInArray!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!36017 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!5331 c!4102) b!36013))

(assert (= (and d!5331 (not c!4102)) b!36011))

(assert (= (and b!36011 c!4101) b!36014))

(assert (= (and b!36011 (not c!4101)) b!36008))

(assert (= (or b!36014 b!36008) bm!2859))

(assert (= (and d!5331 res!21823) b!36010))

(assert (= (and b!36010 res!21821) b!36015))

(assert (= (and b!36015 res!21824) b!36017))

(assert (= (and b!36015 c!4104) b!36009))

(assert (= (and b!36015 (not c!4104)) b!36016))

(assert (= (and b!36009 res!21822) b!36006))

(assert (= (and b!36016 c!4103) b!36007))

(assert (= (and b!36016 (not c!4103)) b!36012))

(declare-fun b_lambda!1723 () Bool)

(assert (=> (not b_lambda!1723) (not b!36006)))

(assert (=> b!36006 t!3646))

(declare-fun b_and!2109 () Bool)

(assert (= b_and!2107 (and (=> t!3646 result!1201) b_and!2109)))

(declare-fun b_lambda!1725 () Bool)

(assert (=> (not b_lambda!1725) (not b!36014)))

(assert (=> b!36014 t!3646))

(declare-fun b_and!2111 () Bool)

(assert (= b_and!2109 (and (=> t!3646 result!1201) b_and!2111)))

(assert (=> b!36011 m!28805))

(assert (=> b!36011 m!28805))

(assert (=> b!36011 m!28807))

(assert (=> b!36009 m!28805))

(assert (=> b!36009 m!28805))

(declare-fun m!28897 () Bool)

(assert (=> b!36009 m!28897))

(declare-fun m!28899 () Bool)

(assert (=> b!36007 m!28899))

(declare-fun m!28901 () Bool)

(assert (=> b!36010 m!28901))

(assert (=> b!36006 m!28865))

(assert (=> b!36006 m!28863))

(assert (=> b!36006 m!28865))

(assert (=> b!36006 m!28867))

(assert (=> b!36006 m!28805))

(assert (=> b!36006 m!28863))

(assert (=> b!36006 m!28805))

(declare-fun m!28903 () Bool)

(assert (=> b!36006 m!28903))

(assert (=> bm!2859 m!28899))

(assert (=> b!36017 m!28805))

(assert (=> b!36017 m!28805))

(assert (=> b!36017 m!28807))

(declare-fun m!28905 () Bool)

(assert (=> d!5331 m!28905))

(assert (=> d!5331 m!28755))

(assert (=> b!36014 m!28865))

(assert (=> b!36014 m!28863))

(assert (=> b!36014 m!28865))

(assert (=> b!36014 m!28867))

(assert (=> b!36014 m!28805))

(declare-fun m!28907 () Bool)

(assert (=> b!36014 m!28907))

(assert (=> b!36014 m!28863))

(declare-fun m!28909 () Bool)

(assert (=> b!36014 m!28909))

(declare-fun m!28911 () Bool)

(assert (=> b!36014 m!28911))

(declare-fun m!28913 () Bool)

(assert (=> b!36014 m!28913))

(assert (=> b!36014 m!28911))

(declare-fun m!28915 () Bool)

(assert (=> b!36012 m!28915))

(assert (=> bm!2853 d!5331))

(declare-fun d!5333 () Bool)

(declare-fun e!22739 () Bool)

(assert (=> d!5333 e!22739))

(declare-fun res!21830 () Bool)

(assert (=> d!5333 (=> (not res!21830) (not e!22739))))

(declare-fun lt!13348 () ListLongMap!919)

(assert (=> d!5333 (= res!21830 (contains!425 lt!13348 (_1!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun lt!13350 () List!938)

(assert (=> d!5333 (= lt!13348 (ListLongMap!920 lt!13350))))

(declare-fun lt!13349 () Unit!795)

(declare-fun lt!13347 () Unit!795)

(assert (=> d!5333 (= lt!13349 lt!13347)))

(assert (=> d!5333 (= (getValueByKey!73 lt!13350 (_1!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))) (Some!78 (_2!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!19 (List!938 (_ BitVec 64) V!2003) Unit!795)

(assert (=> d!5333 (= lt!13347 (lemmaContainsTupThenGetReturnValue!19 lt!13350 (_1!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (_2!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun insertStrictlySorted!19 (List!938 (_ BitVec 64) V!2003) List!938)

(assert (=> d!5333 (= lt!13350 (insertStrictlySorted!19 (toList!475 (ite c!4075 call!2850 (ite c!4076 call!2855 call!2852))) (_1!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (_2!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(assert (=> d!5333 (= (+!60 (ite c!4075 call!2850 (ite c!4076 call!2855 call!2852)) (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) lt!13348)))

(declare-fun b!36022 () Bool)

(declare-fun res!21829 () Bool)

(assert (=> b!36022 (=> (not res!21829) (not e!22739))))

(assert (=> b!36022 (= res!21829 (= (getValueByKey!73 (toList!475 lt!13348) (_1!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))) (Some!78 (_2!688 (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))))

(declare-fun b!36023 () Bool)

(declare-fun contains!427 (List!938 tuple2!1354) Bool)

(assert (=> b!36023 (= e!22739 (contains!427 (toList!475 lt!13348) (ite (or c!4075 c!4076) (tuple2!1355 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (= (and d!5333 res!21830) b!36022))

(assert (= (and b!36022 res!21829) b!36023))

(declare-fun m!28917 () Bool)

(assert (=> d!5333 m!28917))

(declare-fun m!28919 () Bool)

(assert (=> d!5333 m!28919))

(declare-fun m!28921 () Bool)

(assert (=> d!5333 m!28921))

(declare-fun m!28923 () Bool)

(assert (=> d!5333 m!28923))

(declare-fun m!28925 () Bool)

(assert (=> b!36022 m!28925))

(declare-fun m!28927 () Bool)

(assert (=> b!36023 m!28927))

(assert (=> bm!2852 d!5333))

(declare-fun d!5335 () Bool)

(declare-fun res!21831 () Bool)

(declare-fun e!22740 () Bool)

(assert (=> d!5335 (=> res!21831 e!22740)))

(assert (=> d!5335 (= res!21831 (= (select (arr!1173 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1304))))

(assert (=> d!5335 (= (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!22740)))

(declare-fun b!36024 () Bool)

(declare-fun e!22741 () Bool)

(assert (=> b!36024 (= e!22740 e!22741)))

(declare-fun res!21832 () Bool)

(assert (=> b!36024 (=> (not res!21832) (not e!22741))))

(assert (=> b!36024 (= res!21832 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1274 _keys!1833)))))

(declare-fun b!36025 () Bool)

(assert (=> b!36025 (= e!22741 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!5335 (not res!21831)) b!36024))

(assert (= (and b!36024 res!21832) b!36025))

(declare-fun m!28929 () Bool)

(assert (=> d!5335 m!28929))

(declare-fun m!28931 () Bool)

(assert (=> b!36025 m!28931))

(assert (=> b!35961 d!5335))

(declare-fun d!5337 () Bool)

(declare-fun get!612 (Option!79) V!2003)

(assert (=> d!5337 (= (apply!42 lt!13288 #b0000000000000000000000000000000000000000000000000000000000000000) (get!612 (getValueByKey!73 (toList!475 lt!13288) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1359 () Bool)

(assert (= bs!1359 d!5337))

(declare-fun m!28933 () Bool)

(assert (=> bs!1359 m!28933))

(assert (=> bs!1359 m!28933))

(declare-fun m!28935 () Bool)

(assert (=> bs!1359 m!28935))

(assert (=> b!35927 d!5337))

(declare-fun d!5339 () Bool)

(declare-fun res!21837 () Bool)

(declare-fun e!22746 () Bool)

(assert (=> d!5339 (=> res!21837 e!22746)))

(assert (=> d!5339 (= res!21837 (and ((_ is Cons!934) (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (= (_1!688 (h!1501 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(assert (=> d!5339 (= (containsKey!37 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) e!22746)))

(declare-fun b!36030 () Bool)

(declare-fun e!22747 () Bool)

(assert (=> b!36030 (= e!22746 e!22747)))

(declare-fun res!21838 () Bool)

(assert (=> b!36030 (=> (not res!21838) (not e!22747))))

(assert (=> b!36030 (= res!21838 (and (or (not ((_ is Cons!934) (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) (bvsle (_1!688 (h!1501 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)) ((_ is Cons!934) (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (bvslt (_1!688 (h!1501 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(declare-fun b!36031 () Bool)

(assert (=> b!36031 (= e!22747 (containsKey!37 (t!3642 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) k0!1304))))

(assert (= (and d!5339 (not res!21837)) b!36030))

(assert (= (and b!36030 res!21838) b!36031))

(declare-fun m!28937 () Bool)

(assert (=> b!36031 m!28937))

(assert (=> d!5313 d!5339))

(declare-fun d!5341 () Bool)

(assert (=> d!5341 (= (apply!42 (+!60 lt!13280 (tuple2!1355 lt!13277 minValue!1443)) lt!13296) (apply!42 lt!13280 lt!13296))))

(declare-fun lt!13353 () Unit!795)

(declare-fun choose!221 (ListLongMap!919 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!795)

(assert (=> d!5341 (= lt!13353 (choose!221 lt!13280 lt!13277 minValue!1443 lt!13296))))

(declare-fun e!22750 () Bool)

(assert (=> d!5341 e!22750))

(declare-fun res!21841 () Bool)

(assert (=> d!5341 (=> (not res!21841) (not e!22750))))

(assert (=> d!5341 (= res!21841 (contains!425 lt!13280 lt!13296))))

(assert (=> d!5341 (= (addApplyDifferent!27 lt!13280 lt!13277 minValue!1443 lt!13296) lt!13353)))

(declare-fun b!36035 () Bool)

(assert (=> b!36035 (= e!22750 (not (= lt!13296 lt!13277)))))

(assert (= (and d!5341 res!21841) b!36035))

(declare-fun m!28939 () Bool)

(assert (=> d!5341 m!28939))

(declare-fun m!28941 () Bool)

(assert (=> d!5341 m!28941))

(assert (=> d!5341 m!28853))

(assert (=> d!5341 m!28839))

(assert (=> d!5341 m!28839))

(assert (=> d!5341 m!28841))

(assert (=> b!35921 d!5341))

(declare-fun d!5343 () Bool)

(assert (=> d!5343 (= (apply!42 lt!13291 lt!13286) (get!612 (getValueByKey!73 (toList!475 lt!13291) lt!13286)))))

(declare-fun bs!1360 () Bool)

(assert (= bs!1360 d!5343))

(declare-fun m!28943 () Bool)

(assert (=> bs!1360 m!28943))

(assert (=> bs!1360 m!28943))

(declare-fun m!28945 () Bool)

(assert (=> bs!1360 m!28945))

(assert (=> b!35921 d!5343))

(declare-fun d!5345 () Bool)

(assert (=> d!5345 (= (apply!42 (+!60 lt!13292 (tuple2!1355 lt!13275 minValue!1443)) lt!13290) (get!612 (getValueByKey!73 (toList!475 (+!60 lt!13292 (tuple2!1355 lt!13275 minValue!1443))) lt!13290)))))

(declare-fun bs!1361 () Bool)

(assert (= bs!1361 d!5345))

(declare-fun m!28947 () Bool)

(assert (=> bs!1361 m!28947))

(assert (=> bs!1361 m!28947))

(declare-fun m!28949 () Bool)

(assert (=> bs!1361 m!28949))

(assert (=> b!35921 d!5345))

(declare-fun d!5347 () Bool)

(declare-fun e!22752 () Bool)

(assert (=> d!5347 e!22752))

(declare-fun res!21842 () Bool)

(assert (=> d!5347 (=> res!21842 e!22752)))

(declare-fun lt!13357 () Bool)

(assert (=> d!5347 (= res!21842 (not lt!13357))))

(declare-fun lt!13354 () Bool)

(assert (=> d!5347 (= lt!13357 lt!13354)))

(declare-fun lt!13355 () Unit!795)

(declare-fun e!22751 () Unit!795)

(assert (=> d!5347 (= lt!13355 e!22751)))

(declare-fun c!4105 () Bool)

(assert (=> d!5347 (= c!4105 lt!13354)))

(assert (=> d!5347 (= lt!13354 (containsKey!37 (toList!475 (+!60 lt!13289 (tuple2!1355 lt!13282 zeroValue!1443))) lt!13293))))

(assert (=> d!5347 (= (contains!425 (+!60 lt!13289 (tuple2!1355 lt!13282 zeroValue!1443)) lt!13293) lt!13357)))

(declare-fun b!36036 () Bool)

(declare-fun lt!13356 () Unit!795)

(assert (=> b!36036 (= e!22751 lt!13356)))

(assert (=> b!36036 (= lt!13356 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!475 (+!60 lt!13289 (tuple2!1355 lt!13282 zeroValue!1443))) lt!13293))))

(assert (=> b!36036 (isDefined!35 (getValueByKey!73 (toList!475 (+!60 lt!13289 (tuple2!1355 lt!13282 zeroValue!1443))) lt!13293))))

(declare-fun b!36037 () Bool)

(declare-fun Unit!799 () Unit!795)

(assert (=> b!36037 (= e!22751 Unit!799)))

(declare-fun b!36038 () Bool)

(assert (=> b!36038 (= e!22752 (isDefined!35 (getValueByKey!73 (toList!475 (+!60 lt!13289 (tuple2!1355 lt!13282 zeroValue!1443))) lt!13293)))))

(assert (= (and d!5347 c!4105) b!36036))

(assert (= (and d!5347 (not c!4105)) b!36037))

(assert (= (and d!5347 (not res!21842)) b!36038))

(declare-fun m!28951 () Bool)

(assert (=> d!5347 m!28951))

(declare-fun m!28953 () Bool)

(assert (=> b!36036 m!28953))

(declare-fun m!28955 () Bool)

(assert (=> b!36036 m!28955))

(assert (=> b!36036 m!28955))

(declare-fun m!28957 () Bool)

(assert (=> b!36036 m!28957))

(assert (=> b!36038 m!28955))

(assert (=> b!36038 m!28955))

(assert (=> b!36038 m!28957))

(assert (=> b!35921 d!5347))

(assert (=> b!35921 d!5331))

(declare-fun d!5349 () Bool)

(assert (=> d!5349 (= (apply!42 lt!13292 lt!13290) (get!612 (getValueByKey!73 (toList!475 lt!13292) lt!13290)))))

(declare-fun bs!1362 () Bool)

(assert (= bs!1362 d!5349))

(declare-fun m!28959 () Bool)

(assert (=> bs!1362 m!28959))

(assert (=> bs!1362 m!28959))

(declare-fun m!28961 () Bool)

(assert (=> bs!1362 m!28961))

(assert (=> b!35921 d!5349))

(declare-fun d!5351 () Bool)

(assert (=> d!5351 (= (apply!42 (+!60 lt!13292 (tuple2!1355 lt!13275 minValue!1443)) lt!13290) (apply!42 lt!13292 lt!13290))))

(declare-fun lt!13358 () Unit!795)

(assert (=> d!5351 (= lt!13358 (choose!221 lt!13292 lt!13275 minValue!1443 lt!13290))))

(declare-fun e!22753 () Bool)

(assert (=> d!5351 e!22753))

(declare-fun res!21843 () Bool)

(assert (=> d!5351 (=> (not res!21843) (not e!22753))))

(assert (=> d!5351 (= res!21843 (contains!425 lt!13292 lt!13290))))

(assert (=> d!5351 (= (addApplyDifferent!27 lt!13292 lt!13275 minValue!1443 lt!13290) lt!13358)))

(declare-fun b!36039 () Bool)

(assert (=> b!36039 (= e!22753 (not (= lt!13290 lt!13275)))))

(assert (= (and d!5351 res!21843) b!36039))

(declare-fun m!28963 () Bool)

(assert (=> d!5351 m!28963))

(declare-fun m!28965 () Bool)

(assert (=> d!5351 m!28965))

(assert (=> d!5351 m!28837))

(assert (=> d!5351 m!28843))

(assert (=> d!5351 m!28843))

(assert (=> d!5351 m!28845))

(assert (=> b!35921 d!5351))

(declare-fun d!5353 () Bool)

(assert (=> d!5353 (contains!425 (+!60 lt!13289 (tuple2!1355 lt!13282 zeroValue!1443)) lt!13293)))

(declare-fun lt!13361 () Unit!795)

(declare-fun choose!222 (ListLongMap!919 (_ BitVec 64) V!2003 (_ BitVec 64)) Unit!795)

(assert (=> d!5353 (= lt!13361 (choose!222 lt!13289 lt!13282 zeroValue!1443 lt!13293))))

(assert (=> d!5353 (contains!425 lt!13289 lt!13293)))

(assert (=> d!5353 (= (addStillContains!27 lt!13289 lt!13282 zeroValue!1443 lt!13293) lt!13361)))

(declare-fun bs!1363 () Bool)

(assert (= bs!1363 d!5353))

(assert (=> bs!1363 m!28833))

(assert (=> bs!1363 m!28833))

(assert (=> bs!1363 m!28857))

(declare-fun m!28967 () Bool)

(assert (=> bs!1363 m!28967))

(declare-fun m!28969 () Bool)

(assert (=> bs!1363 m!28969))

(assert (=> b!35921 d!5353))

(declare-fun d!5355 () Bool)

(declare-fun e!22754 () Bool)

(assert (=> d!5355 e!22754))

(declare-fun res!21845 () Bool)

(assert (=> d!5355 (=> (not res!21845) (not e!22754))))

(declare-fun lt!13363 () ListLongMap!919)

(assert (=> d!5355 (= res!21845 (contains!425 lt!13363 (_1!688 (tuple2!1355 lt!13285 zeroValue!1443))))))

(declare-fun lt!13365 () List!938)

(assert (=> d!5355 (= lt!13363 (ListLongMap!920 lt!13365))))

(declare-fun lt!13364 () Unit!795)

(declare-fun lt!13362 () Unit!795)

(assert (=> d!5355 (= lt!13364 lt!13362)))

(assert (=> d!5355 (= (getValueByKey!73 lt!13365 (_1!688 (tuple2!1355 lt!13285 zeroValue!1443))) (Some!78 (_2!688 (tuple2!1355 lt!13285 zeroValue!1443))))))

(assert (=> d!5355 (= lt!13362 (lemmaContainsTupThenGetReturnValue!19 lt!13365 (_1!688 (tuple2!1355 lt!13285 zeroValue!1443)) (_2!688 (tuple2!1355 lt!13285 zeroValue!1443))))))

(assert (=> d!5355 (= lt!13365 (insertStrictlySorted!19 (toList!475 lt!13291) (_1!688 (tuple2!1355 lt!13285 zeroValue!1443)) (_2!688 (tuple2!1355 lt!13285 zeroValue!1443))))))

(assert (=> d!5355 (= (+!60 lt!13291 (tuple2!1355 lt!13285 zeroValue!1443)) lt!13363)))

(declare-fun b!36041 () Bool)

(declare-fun res!21844 () Bool)

(assert (=> b!36041 (=> (not res!21844) (not e!22754))))

(assert (=> b!36041 (= res!21844 (= (getValueByKey!73 (toList!475 lt!13363) (_1!688 (tuple2!1355 lt!13285 zeroValue!1443))) (Some!78 (_2!688 (tuple2!1355 lt!13285 zeroValue!1443)))))))

(declare-fun b!36042 () Bool)

(assert (=> b!36042 (= e!22754 (contains!427 (toList!475 lt!13363) (tuple2!1355 lt!13285 zeroValue!1443)))))

(assert (= (and d!5355 res!21845) b!36041))

(assert (= (and b!36041 res!21844) b!36042))

(declare-fun m!28971 () Bool)

(assert (=> d!5355 m!28971))

(declare-fun m!28973 () Bool)

(assert (=> d!5355 m!28973))

(declare-fun m!28975 () Bool)

(assert (=> d!5355 m!28975))

(declare-fun m!28977 () Bool)

(assert (=> d!5355 m!28977))

(declare-fun m!28979 () Bool)

(assert (=> b!36041 m!28979))

(declare-fun m!28981 () Bool)

(assert (=> b!36042 m!28981))

(assert (=> b!35921 d!5355))

(declare-fun d!5357 () Bool)

(assert (=> d!5357 (= (apply!42 (+!60 lt!13291 (tuple2!1355 lt!13285 zeroValue!1443)) lt!13286) (apply!42 lt!13291 lt!13286))))

(declare-fun lt!13366 () Unit!795)

(assert (=> d!5357 (= lt!13366 (choose!221 lt!13291 lt!13285 zeroValue!1443 lt!13286))))

(declare-fun e!22755 () Bool)

(assert (=> d!5357 e!22755))

(declare-fun res!21846 () Bool)

(assert (=> d!5357 (=> (not res!21846) (not e!22755))))

(assert (=> d!5357 (= res!21846 (contains!425 lt!13291 lt!13286))))

(assert (=> d!5357 (= (addApplyDifferent!27 lt!13291 lt!13285 zeroValue!1443 lt!13286) lt!13366)))

(declare-fun b!36043 () Bool)

(assert (=> b!36043 (= e!22755 (not (= lt!13286 lt!13285)))))

(assert (= (and d!5357 res!21846) b!36043))

(declare-fun m!28983 () Bool)

(assert (=> d!5357 m!28983))

(declare-fun m!28985 () Bool)

(assert (=> d!5357 m!28985))

(assert (=> d!5357 m!28847))

(assert (=> d!5357 m!28831))

(assert (=> d!5357 m!28831))

(assert (=> d!5357 m!28855))

(assert (=> b!35921 d!5357))

(declare-fun d!5359 () Bool)

(declare-fun e!22756 () Bool)

(assert (=> d!5359 e!22756))

(declare-fun res!21848 () Bool)

(assert (=> d!5359 (=> (not res!21848) (not e!22756))))

(declare-fun lt!13368 () ListLongMap!919)

(assert (=> d!5359 (= res!21848 (contains!425 lt!13368 (_1!688 (tuple2!1355 lt!13277 minValue!1443))))))

(declare-fun lt!13370 () List!938)

(assert (=> d!5359 (= lt!13368 (ListLongMap!920 lt!13370))))

(declare-fun lt!13369 () Unit!795)

(declare-fun lt!13367 () Unit!795)

(assert (=> d!5359 (= lt!13369 lt!13367)))

(assert (=> d!5359 (= (getValueByKey!73 lt!13370 (_1!688 (tuple2!1355 lt!13277 minValue!1443))) (Some!78 (_2!688 (tuple2!1355 lt!13277 minValue!1443))))))

(assert (=> d!5359 (= lt!13367 (lemmaContainsTupThenGetReturnValue!19 lt!13370 (_1!688 (tuple2!1355 lt!13277 minValue!1443)) (_2!688 (tuple2!1355 lt!13277 minValue!1443))))))

(assert (=> d!5359 (= lt!13370 (insertStrictlySorted!19 (toList!475 lt!13280) (_1!688 (tuple2!1355 lt!13277 minValue!1443)) (_2!688 (tuple2!1355 lt!13277 minValue!1443))))))

(assert (=> d!5359 (= (+!60 lt!13280 (tuple2!1355 lt!13277 minValue!1443)) lt!13368)))

(declare-fun b!36044 () Bool)

(declare-fun res!21847 () Bool)

(assert (=> b!36044 (=> (not res!21847) (not e!22756))))

(assert (=> b!36044 (= res!21847 (= (getValueByKey!73 (toList!475 lt!13368) (_1!688 (tuple2!1355 lt!13277 minValue!1443))) (Some!78 (_2!688 (tuple2!1355 lt!13277 minValue!1443)))))))

(declare-fun b!36045 () Bool)

(assert (=> b!36045 (= e!22756 (contains!427 (toList!475 lt!13368) (tuple2!1355 lt!13277 minValue!1443)))))

(assert (= (and d!5359 res!21848) b!36044))

(assert (= (and b!36044 res!21847) b!36045))

(declare-fun m!28987 () Bool)

(assert (=> d!5359 m!28987))

(declare-fun m!28989 () Bool)

(assert (=> d!5359 m!28989))

(declare-fun m!28991 () Bool)

(assert (=> d!5359 m!28991))

(declare-fun m!28993 () Bool)

(assert (=> d!5359 m!28993))

(declare-fun m!28995 () Bool)

(assert (=> b!36044 m!28995))

(declare-fun m!28997 () Bool)

(assert (=> b!36045 m!28997))

(assert (=> b!35921 d!5359))

(declare-fun d!5361 () Bool)

(declare-fun e!22757 () Bool)

(assert (=> d!5361 e!22757))

(declare-fun res!21850 () Bool)

(assert (=> d!5361 (=> (not res!21850) (not e!22757))))

(declare-fun lt!13372 () ListLongMap!919)

(assert (=> d!5361 (= res!21850 (contains!425 lt!13372 (_1!688 (tuple2!1355 lt!13275 minValue!1443))))))

(declare-fun lt!13374 () List!938)

(assert (=> d!5361 (= lt!13372 (ListLongMap!920 lt!13374))))

(declare-fun lt!13373 () Unit!795)

(declare-fun lt!13371 () Unit!795)

(assert (=> d!5361 (= lt!13373 lt!13371)))

(assert (=> d!5361 (= (getValueByKey!73 lt!13374 (_1!688 (tuple2!1355 lt!13275 minValue!1443))) (Some!78 (_2!688 (tuple2!1355 lt!13275 minValue!1443))))))

(assert (=> d!5361 (= lt!13371 (lemmaContainsTupThenGetReturnValue!19 lt!13374 (_1!688 (tuple2!1355 lt!13275 minValue!1443)) (_2!688 (tuple2!1355 lt!13275 minValue!1443))))))

(assert (=> d!5361 (= lt!13374 (insertStrictlySorted!19 (toList!475 lt!13292) (_1!688 (tuple2!1355 lt!13275 minValue!1443)) (_2!688 (tuple2!1355 lt!13275 minValue!1443))))))

(assert (=> d!5361 (= (+!60 lt!13292 (tuple2!1355 lt!13275 minValue!1443)) lt!13372)))

(declare-fun b!36046 () Bool)

(declare-fun res!21849 () Bool)

(assert (=> b!36046 (=> (not res!21849) (not e!22757))))

(assert (=> b!36046 (= res!21849 (= (getValueByKey!73 (toList!475 lt!13372) (_1!688 (tuple2!1355 lt!13275 minValue!1443))) (Some!78 (_2!688 (tuple2!1355 lt!13275 minValue!1443)))))))

(declare-fun b!36047 () Bool)

(assert (=> b!36047 (= e!22757 (contains!427 (toList!475 lt!13372) (tuple2!1355 lt!13275 minValue!1443)))))

(assert (= (and d!5361 res!21850) b!36046))

(assert (= (and b!36046 res!21849) b!36047))

(declare-fun m!28999 () Bool)

(assert (=> d!5361 m!28999))

(declare-fun m!29001 () Bool)

(assert (=> d!5361 m!29001))

(declare-fun m!29003 () Bool)

(assert (=> d!5361 m!29003))

(declare-fun m!29005 () Bool)

(assert (=> d!5361 m!29005))

(declare-fun m!29007 () Bool)

(assert (=> b!36046 m!29007))

(declare-fun m!29009 () Bool)

(assert (=> b!36047 m!29009))

(assert (=> b!35921 d!5361))

(declare-fun d!5363 () Bool)

(assert (=> d!5363 (= (apply!42 lt!13280 lt!13296) (get!612 (getValueByKey!73 (toList!475 lt!13280) lt!13296)))))

(declare-fun bs!1364 () Bool)

(assert (= bs!1364 d!5363))

(declare-fun m!29011 () Bool)

(assert (=> bs!1364 m!29011))

(assert (=> bs!1364 m!29011))

(declare-fun m!29013 () Bool)

(assert (=> bs!1364 m!29013))

(assert (=> b!35921 d!5363))

(declare-fun d!5365 () Bool)

(assert (=> d!5365 (= (apply!42 (+!60 lt!13291 (tuple2!1355 lt!13285 zeroValue!1443)) lt!13286) (get!612 (getValueByKey!73 (toList!475 (+!60 lt!13291 (tuple2!1355 lt!13285 zeroValue!1443))) lt!13286)))))

(declare-fun bs!1365 () Bool)

(assert (= bs!1365 d!5365))

(declare-fun m!29015 () Bool)

(assert (=> bs!1365 m!29015))

(assert (=> bs!1365 m!29015))

(declare-fun m!29017 () Bool)

(assert (=> bs!1365 m!29017))

(assert (=> b!35921 d!5365))

(declare-fun d!5367 () Bool)

(assert (=> d!5367 (= (apply!42 (+!60 lt!13280 (tuple2!1355 lt!13277 minValue!1443)) lt!13296) (get!612 (getValueByKey!73 (toList!475 (+!60 lt!13280 (tuple2!1355 lt!13277 minValue!1443))) lt!13296)))))

(declare-fun bs!1366 () Bool)

(assert (= bs!1366 d!5367))

(declare-fun m!29019 () Bool)

(assert (=> bs!1366 m!29019))

(assert (=> bs!1366 m!29019))

(declare-fun m!29021 () Bool)

(assert (=> bs!1366 m!29021))

(assert (=> b!35921 d!5367))

(declare-fun d!5369 () Bool)

(declare-fun e!22758 () Bool)

(assert (=> d!5369 e!22758))

(declare-fun res!21852 () Bool)

(assert (=> d!5369 (=> (not res!21852) (not e!22758))))

(declare-fun lt!13376 () ListLongMap!919)

(assert (=> d!5369 (= res!21852 (contains!425 lt!13376 (_1!688 (tuple2!1355 lt!13282 zeroValue!1443))))))

(declare-fun lt!13378 () List!938)

(assert (=> d!5369 (= lt!13376 (ListLongMap!920 lt!13378))))

(declare-fun lt!13377 () Unit!795)

(declare-fun lt!13375 () Unit!795)

(assert (=> d!5369 (= lt!13377 lt!13375)))

(assert (=> d!5369 (= (getValueByKey!73 lt!13378 (_1!688 (tuple2!1355 lt!13282 zeroValue!1443))) (Some!78 (_2!688 (tuple2!1355 lt!13282 zeroValue!1443))))))

(assert (=> d!5369 (= lt!13375 (lemmaContainsTupThenGetReturnValue!19 lt!13378 (_1!688 (tuple2!1355 lt!13282 zeroValue!1443)) (_2!688 (tuple2!1355 lt!13282 zeroValue!1443))))))

(assert (=> d!5369 (= lt!13378 (insertStrictlySorted!19 (toList!475 lt!13289) (_1!688 (tuple2!1355 lt!13282 zeroValue!1443)) (_2!688 (tuple2!1355 lt!13282 zeroValue!1443))))))

(assert (=> d!5369 (= (+!60 lt!13289 (tuple2!1355 lt!13282 zeroValue!1443)) lt!13376)))

(declare-fun b!36048 () Bool)

(declare-fun res!21851 () Bool)

(assert (=> b!36048 (=> (not res!21851) (not e!22758))))

(assert (=> b!36048 (= res!21851 (= (getValueByKey!73 (toList!475 lt!13376) (_1!688 (tuple2!1355 lt!13282 zeroValue!1443))) (Some!78 (_2!688 (tuple2!1355 lt!13282 zeroValue!1443)))))))

(declare-fun b!36049 () Bool)

(assert (=> b!36049 (= e!22758 (contains!427 (toList!475 lt!13376) (tuple2!1355 lt!13282 zeroValue!1443)))))

(assert (= (and d!5369 res!21852) b!36048))

(assert (= (and b!36048 res!21851) b!36049))

(declare-fun m!29023 () Bool)

(assert (=> d!5369 m!29023))

(declare-fun m!29025 () Bool)

(assert (=> d!5369 m!29025))

(declare-fun m!29027 () Bool)

(assert (=> d!5369 m!29027))

(declare-fun m!29029 () Bool)

(assert (=> d!5369 m!29029))

(declare-fun m!29031 () Bool)

(assert (=> b!36048 m!29031))

(declare-fun m!29033 () Bool)

(assert (=> b!36049 m!29033))

(assert (=> b!35921 d!5369))

(declare-fun b!36068 () Bool)

(declare-fun e!22769 () Bool)

(declare-fun e!22771 () Bool)

(assert (=> b!36068 (= e!22769 e!22771)))

(declare-fun res!21860 () Bool)

(declare-fun lt!13384 () SeekEntryResult!170)

(assert (=> b!36068 (= res!21860 (and ((_ is Intermediate!170) lt!13384) (not (undefined!982 lt!13384)) (bvslt (x!7058 lt!13384) #b01111111111111111111111111111110) (bvsge (x!7058 lt!13384) #b00000000000000000000000000000000) (bvsge (x!7058 lt!13384) #b00000000000000000000000000000000)))))

(assert (=> b!36068 (=> (not res!21860) (not e!22771))))

(declare-fun e!22772 () SeekEntryResult!170)

(declare-fun b!36069 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!36069 (= e!22772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!1304 mask!2294) #b00000000000000000000000000000000 mask!2294) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!36070 () Bool)

(assert (=> b!36070 (= e!22772 (Intermediate!170 false (toIndex!0 k0!1304 mask!2294) #b00000000000000000000000000000000))))

(declare-fun b!36071 () Bool)

(assert (=> b!36071 (and (bvsge (index!2804 lt!13384) #b00000000000000000000000000000000) (bvslt (index!2804 lt!13384) (size!1274 _keys!1833)))))

(declare-fun res!21861 () Bool)

(assert (=> b!36071 (= res!21861 (= (select (arr!1173 _keys!1833) (index!2804 lt!13384)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22770 () Bool)

(assert (=> b!36071 (=> res!21861 e!22770)))

(declare-fun d!5371 () Bool)

(assert (=> d!5371 e!22769))

(declare-fun c!4114 () Bool)

(assert (=> d!5371 (= c!4114 (and ((_ is Intermediate!170) lt!13384) (undefined!982 lt!13384)))))

(declare-fun e!22773 () SeekEntryResult!170)

(assert (=> d!5371 (= lt!13384 e!22773)))

(declare-fun c!4113 () Bool)

(assert (=> d!5371 (= c!4113 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!13383 () (_ BitVec 64))

(assert (=> d!5371 (= lt!13383 (select (arr!1173 _keys!1833) (toIndex!0 k0!1304 mask!2294)))))

(assert (=> d!5371 (validMask!0 mask!2294)))

(assert (=> d!5371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294) lt!13384)))

(declare-fun b!36072 () Bool)

(assert (=> b!36072 (= e!22773 e!22772)))

(declare-fun c!4112 () Bool)

(assert (=> b!36072 (= c!4112 (or (= lt!13383 k0!1304) (= (bvadd lt!13383 lt!13383) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36073 () Bool)

(assert (=> b!36073 (and (bvsge (index!2804 lt!13384) #b00000000000000000000000000000000) (bvslt (index!2804 lt!13384) (size!1274 _keys!1833)))))

(assert (=> b!36073 (= e!22770 (= (select (arr!1173 _keys!1833) (index!2804 lt!13384)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!36074 () Bool)

(assert (=> b!36074 (= e!22773 (Intermediate!170 true (toIndex!0 k0!1304 mask!2294) #b00000000000000000000000000000000))))

(declare-fun b!36075 () Bool)

(assert (=> b!36075 (and (bvsge (index!2804 lt!13384) #b00000000000000000000000000000000) (bvslt (index!2804 lt!13384) (size!1274 _keys!1833)))))

(declare-fun res!21859 () Bool)

(assert (=> b!36075 (= res!21859 (= (select (arr!1173 _keys!1833) (index!2804 lt!13384)) k0!1304))))

(assert (=> b!36075 (=> res!21859 e!22770)))

(assert (=> b!36075 (= e!22771 e!22770)))

(declare-fun b!36076 () Bool)

(assert (=> b!36076 (= e!22769 (bvsge (x!7058 lt!13384) #b01111111111111111111111111111110))))

(assert (= (and d!5371 c!4113) b!36074))

(assert (= (and d!5371 (not c!4113)) b!36072))

(assert (= (and b!36072 c!4112) b!36070))

(assert (= (and b!36072 (not c!4112)) b!36069))

(assert (= (and d!5371 c!4114) b!36076))

(assert (= (and d!5371 (not c!4114)) b!36068))

(assert (= (and b!36068 res!21860) b!36075))

(assert (= (and b!36075 (not res!21859)) b!36071))

(assert (= (and b!36071 (not res!21861)) b!36073))

(declare-fun m!29035 () Bool)

(assert (=> b!36071 m!29035))

(assert (=> b!36069 m!28877))

(declare-fun m!29037 () Bool)

(assert (=> b!36069 m!29037))

(assert (=> b!36069 m!29037))

(declare-fun m!29039 () Bool)

(assert (=> b!36069 m!29039))

(assert (=> b!36073 m!29035))

(assert (=> b!36075 m!29035))

(assert (=> d!5371 m!28877))

(declare-fun m!29041 () Bool)

(assert (=> d!5371 m!29041))

(assert (=> d!5371 m!28755))

(assert (=> d!5317 d!5371))

(declare-fun d!5373 () Bool)

(declare-fun lt!13390 () (_ BitVec 32))

(declare-fun lt!13389 () (_ BitVec 32))

(assert (=> d!5373 (= lt!13390 (bvmul (bvxor lt!13389 (bvlshr lt!13389 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!5373 (= lt!13389 ((_ extract 31 0) (bvand (bvxor k0!1304 (bvlshr k0!1304 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!5373 (and (bvsge mask!2294 #b00000000000000000000000000000000) (let ((res!21862 (let ((h!1504 ((_ extract 31 0) (bvand (bvxor k0!1304 (bvlshr k0!1304 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7076 (bvmul (bvxor h!1504 (bvlshr h!1504 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7076 (bvlshr x!7076 #b00000000000000000000000000001101)) mask!2294))))) (and (bvslt res!21862 (bvadd mask!2294 #b00000000000000000000000000000001)) (bvsge res!21862 #b00000000000000000000000000000000))))))

(assert (=> d!5373 (= (toIndex!0 k0!1304 mask!2294) (bvand (bvxor lt!13390 (bvlshr lt!13390 #b00000000000000000000000000001101)) mask!2294))))

(assert (=> d!5317 d!5373))

(assert (=> d!5317 d!5321))

(declare-fun d!5375 () Bool)

(declare-fun e!22775 () Bool)

(assert (=> d!5375 e!22775))

(declare-fun res!21863 () Bool)

(assert (=> d!5375 (=> res!21863 e!22775)))

(declare-fun lt!13394 () Bool)

(assert (=> d!5375 (= res!21863 (not lt!13394))))

(declare-fun lt!13391 () Bool)

(assert (=> d!5375 (= lt!13394 lt!13391)))

(declare-fun lt!13392 () Unit!795)

(declare-fun e!22774 () Unit!795)

(assert (=> d!5375 (= lt!13392 e!22774)))

(declare-fun c!4115 () Bool)

(assert (=> d!5375 (= c!4115 lt!13391)))

(assert (=> d!5375 (= lt!13391 (containsKey!37 (toList!475 lt!13288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5375 (= (contains!425 lt!13288 #b0000000000000000000000000000000000000000000000000000000000000000) lt!13394)))

(declare-fun b!36077 () Bool)

(declare-fun lt!13393 () Unit!795)

(assert (=> b!36077 (= e!22774 lt!13393)))

(assert (=> b!36077 (= lt!13393 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!475 lt!13288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!36077 (isDefined!35 (getValueByKey!73 (toList!475 lt!13288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!36078 () Bool)

(declare-fun Unit!800 () Unit!795)

(assert (=> b!36078 (= e!22774 Unit!800)))

(declare-fun b!36079 () Bool)

(assert (=> b!36079 (= e!22775 (isDefined!35 (getValueByKey!73 (toList!475 lt!13288) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5375 c!4115) b!36077))

(assert (= (and d!5375 (not c!4115)) b!36078))

(assert (= (and d!5375 (not res!21863)) b!36079))

(declare-fun m!29043 () Bool)

(assert (=> d!5375 m!29043))

(declare-fun m!29045 () Bool)

(assert (=> b!36077 m!29045))

(assert (=> b!36077 m!28933))

(assert (=> b!36077 m!28933))

(declare-fun m!29047 () Bool)

(assert (=> b!36077 m!29047))

(assert (=> b!36079 m!28933))

(assert (=> b!36079 m!28933))

(assert (=> b!36079 m!29047))

(assert (=> bm!2851 d!5375))

(declare-fun d!5377 () Bool)

(declare-fun isEmpty!175 (Option!79) Bool)

(assert (=> d!5377 (= (isDefined!35 (getValueByKey!73 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)) (not (isEmpty!175 (getValueByKey!73 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))))

(declare-fun bs!1367 () Bool)

(assert (= bs!1367 d!5377))

(assert (=> bs!1367 m!28817))

(declare-fun m!29049 () Bool)

(assert (=> bs!1367 m!29049))

(assert (=> b!35872 d!5377))

(declare-fun b!36091 () Bool)

(declare-fun e!22781 () Option!79)

(assert (=> b!36091 (= e!22781 None!77)))

(declare-fun b!36088 () Bool)

(declare-fun e!22780 () Option!79)

(assert (=> b!36088 (= e!22780 (Some!78 (_2!688 (h!1501 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))))))

(declare-fun b!36090 () Bool)

(assert (=> b!36090 (= e!22781 (getValueByKey!73 (t!3642 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) k0!1304))))

(declare-fun c!4120 () Bool)

(declare-fun d!5379 () Bool)

(assert (=> d!5379 (= c!4120 (and ((_ is Cons!934) (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (= (_1!688 (h!1501 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304)))))

(assert (=> d!5379 (= (getValueByKey!73 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) e!22780)))

(declare-fun b!36089 () Bool)

(assert (=> b!36089 (= e!22780 e!22781)))

(declare-fun c!4121 () Bool)

(assert (=> b!36089 (= c!4121 (and ((_ is Cons!934) (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))) (not (= (_1!688 (h!1501 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)))) k0!1304))))))

(assert (= (and d!5379 c!4120) b!36088))

(assert (= (and d!5379 (not c!4120)) b!36089))

(assert (= (and b!36089 c!4121) b!36090))

(assert (= (and b!36089 (not c!4121)) b!36091))

(declare-fun m!29051 () Bool)

(assert (=> b!36090 m!29051))

(assert (=> b!35872 d!5379))

(declare-fun b!36092 () Bool)

(declare-fun e!22783 () Bool)

(declare-fun e!22782 () Bool)

(assert (=> b!36092 (= e!22783 e!22782)))

(declare-fun lt!13397 () (_ BitVec 64))

(assert (=> b!36092 (= lt!13397 (select (arr!1173 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!13395 () Unit!795)

(assert (=> b!36092 (= lt!13395 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!36092 (arrayContainsKey!0 _keys!1833 lt!13397 #b00000000000000000000000000000000)))

(declare-fun lt!13396 () Unit!795)

(assert (=> b!36092 (= lt!13396 lt!13395)))

(declare-fun res!21865 () Bool)

(assert (=> b!36092 (= res!21865 (= (seekEntryOrOpen!0 (select (arr!1173 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1833 mask!2294) (Found!170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!36092 (=> (not res!21865) (not e!22782))))

(declare-fun b!36093 () Bool)

(declare-fun e!22784 () Bool)

(assert (=> b!36093 (= e!22784 e!22783)))

(declare-fun c!4122 () Bool)

(assert (=> b!36093 (= c!4122 (validKeyInArray!0 (select (arr!1173 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2860 () Bool)

(declare-fun call!2863 () Bool)

(assert (=> bm!2860 (= call!2863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!36094 () Bool)

(assert (=> b!36094 (= e!22783 call!2863)))

(declare-fun b!36095 () Bool)

(assert (=> b!36095 (= e!22782 call!2863)))

(declare-fun d!5381 () Bool)

(declare-fun res!21864 () Bool)

(assert (=> d!5381 (=> res!21864 e!22784)))

(assert (=> d!5381 (= res!21864 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1274 _keys!1833)))))

(assert (=> d!5381 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294) e!22784)))

(assert (= (and d!5381 (not res!21864)) b!36093))

(assert (= (and b!36093 c!4122) b!36092))

(assert (= (and b!36093 (not c!4122)) b!36094))

(assert (= (and b!36092 res!21865) b!36095))

(assert (= (or b!36095 b!36094) bm!2860))

(assert (=> b!36092 m!28929))

(declare-fun m!29053 () Bool)

(assert (=> b!36092 m!29053))

(declare-fun m!29055 () Bool)

(assert (=> b!36092 m!29055))

(assert (=> b!36092 m!28929))

(declare-fun m!29057 () Bool)

(assert (=> b!36092 m!29057))

(assert (=> b!36093 m!28929))

(assert (=> b!36093 m!28929))

(declare-fun m!29059 () Bool)

(assert (=> b!36093 m!29059))

(declare-fun m!29061 () Bool)

(assert (=> bm!2860 m!29061))

(assert (=> bm!2856 d!5381))

(declare-fun d!5383 () Bool)

(declare-fun e!22786 () Bool)

(assert (=> d!5383 e!22786))

(declare-fun res!21866 () Bool)

(assert (=> d!5383 (=> res!21866 e!22786)))

(declare-fun lt!13401 () Bool)

(assert (=> d!5383 (= res!21866 (not lt!13401))))

(declare-fun lt!13398 () Bool)

(assert (=> d!5383 (= lt!13401 lt!13398)))

(declare-fun lt!13399 () Unit!795)

(declare-fun e!22785 () Unit!795)

(assert (=> d!5383 (= lt!13399 e!22785)))

(declare-fun c!4123 () Bool)

(assert (=> d!5383 (= c!4123 lt!13398)))

(assert (=> d!5383 (= lt!13398 (containsKey!37 (toList!475 lt!13288) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> d!5383 (= (contains!425 lt!13288 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)) lt!13401)))

(declare-fun b!36096 () Bool)

(declare-fun lt!13400 () Unit!795)

(assert (=> b!36096 (= e!22785 lt!13400)))

(assert (=> b!36096 (= lt!13400 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!475 lt!13288) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!36096 (isDefined!35 (getValueByKey!73 (toList!475 lt!13288) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36097 () Bool)

(declare-fun Unit!801 () Unit!795)

(assert (=> b!36097 (= e!22785 Unit!801)))

(declare-fun b!36098 () Bool)

(assert (=> b!36098 (= e!22786 (isDefined!35 (getValueByKey!73 (toList!475 lt!13288) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000))))))

(assert (= (and d!5383 c!4123) b!36096))

(assert (= (and d!5383 (not c!4123)) b!36097))

(assert (= (and d!5383 (not res!21866)) b!36098))

(assert (=> d!5383 m!28805))

(declare-fun m!29063 () Bool)

(assert (=> d!5383 m!29063))

(assert (=> b!36096 m!28805))

(declare-fun m!29065 () Bool)

(assert (=> b!36096 m!29065))

(assert (=> b!36096 m!28805))

(declare-fun m!29067 () Bool)

(assert (=> b!36096 m!29067))

(assert (=> b!36096 m!29067))

(declare-fun m!29069 () Bool)

(assert (=> b!36096 m!29069))

(assert (=> b!36098 m!28805))

(assert (=> b!36098 m!29067))

(assert (=> b!36098 m!29067))

(assert (=> b!36098 m!29069))

(assert (=> b!35917 d!5383))

(declare-fun d!5385 () Bool)

(assert (=> d!5385 (= (validKeyInArray!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)) (and (not (= (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35863 d!5385))

(assert (=> b!35920 d!5385))

(declare-fun d!5387 () Bool)

(assert (=> d!5387 (isDefined!35 (getValueByKey!73 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun lt!13404 () Unit!795)

(declare-fun choose!223 (List!938 (_ BitVec 64)) Unit!795)

(assert (=> d!5387 (= lt!13404 (choose!223 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun e!22789 () Bool)

(assert (=> d!5387 e!22789))

(declare-fun res!21869 () Bool)

(assert (=> d!5387 (=> (not res!21869) (not e!22789))))

(declare-fun isStrictlySorted!166 (List!938) Bool)

(assert (=> d!5387 (= res!21869 (isStrictlySorted!166 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))))

(assert (=> d!5387 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304) lt!13404)))

(declare-fun b!36101 () Bool)

(assert (=> b!36101 (= e!22789 (containsKey!37 (toList!475 (getCurrentListMap!293 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (= (and d!5387 res!21869) b!36101))

(assert (=> d!5387 m!28817))

(assert (=> d!5387 m!28817))

(assert (=> d!5387 m!28819))

(declare-fun m!29071 () Bool)

(assert (=> d!5387 m!29071))

(declare-fun m!29073 () Bool)

(assert (=> d!5387 m!29073))

(assert (=> b!36101 m!28813))

(assert (=> b!35870 d!5387))

(assert (=> b!35870 d!5377))

(assert (=> b!35870 d!5379))

(declare-fun b!36102 () Bool)

(declare-fun e!22790 () Bool)

(declare-fun call!2864 () Bool)

(assert (=> b!36102 (= e!22790 call!2864)))

(declare-fun b!36103 () Bool)

(assert (=> b!36103 (= e!22790 call!2864)))

(declare-fun b!36104 () Bool)

(declare-fun e!22791 () Bool)

(assert (=> b!36104 (= e!22791 e!22790)))

(declare-fun c!4124 () Bool)

(assert (=> b!36104 (= c!4124 (validKeyInArray!0 (select (arr!1173 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2861 () Bool)

(assert (=> bm!2861 (= call!2864 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4124 (Cons!935 (select (arr!1173 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4059 (Cons!935 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) Nil!936) Nil!936)) (ite c!4059 (Cons!935 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) Nil!936) Nil!936))))))

(declare-fun b!36105 () Bool)

(declare-fun e!22792 () Bool)

(assert (=> b!36105 (= e!22792 (contains!426 (ite c!4059 (Cons!935 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) Nil!936) Nil!936) (select (arr!1173 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!36106 () Bool)

(declare-fun e!22793 () Bool)

(assert (=> b!36106 (= e!22793 e!22791)))

(declare-fun res!21871 () Bool)

(assert (=> b!36106 (=> (not res!21871) (not e!22791))))

(assert (=> b!36106 (= res!21871 (not e!22792))))

(declare-fun res!21870 () Bool)

(assert (=> b!36106 (=> (not res!21870) (not e!22792))))

(assert (=> b!36106 (= res!21870 (validKeyInArray!0 (select (arr!1173 _keys!1833) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!5389 () Bool)

(declare-fun res!21872 () Bool)

(assert (=> d!5389 (=> res!21872 e!22793)))

(assert (=> d!5389 (= res!21872 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1274 _keys!1833)))))

(assert (=> d!5389 (= (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4059 (Cons!935 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) Nil!936) Nil!936)) e!22793)))

(assert (= (and d!5389 (not res!21872)) b!36106))

(assert (= (and b!36106 res!21870) b!36105))

(assert (= (and b!36106 res!21871) b!36104))

(assert (= (and b!36104 c!4124) b!36103))

(assert (= (and b!36104 (not c!4124)) b!36102))

(assert (= (or b!36103 b!36102) bm!2861))

(assert (=> b!36104 m!28929))

(assert (=> b!36104 m!28929))

(assert (=> b!36104 m!29059))

(assert (=> bm!2861 m!28929))

(declare-fun m!29075 () Bool)

(assert (=> bm!2861 m!29075))

(assert (=> b!36105 m!28929))

(assert (=> b!36105 m!28929))

(declare-fun m!29077 () Bool)

(assert (=> b!36105 m!29077))

(assert (=> b!36106 m!28929))

(assert (=> b!36106 m!28929))

(assert (=> b!36106 m!29059))

(assert (=> bm!2832 d!5389))

(declare-fun d!5391 () Bool)

(declare-fun lt!13407 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!18 (List!939) (InoxSet (_ BitVec 64)))

(assert (=> d!5391 (= lt!13407 (select (content!18 Nil!936) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun e!22798 () Bool)

(assert (=> d!5391 (= lt!13407 e!22798)))

(declare-fun res!21877 () Bool)

(assert (=> d!5391 (=> (not res!21877) (not e!22798))))

(assert (=> d!5391 (= res!21877 ((_ is Cons!935) Nil!936))))

(assert (=> d!5391 (= (contains!426 Nil!936 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)) lt!13407)))

(declare-fun b!36111 () Bool)

(declare-fun e!22799 () Bool)

(assert (=> b!36111 (= e!22798 e!22799)))

(declare-fun res!21878 () Bool)

(assert (=> b!36111 (=> res!21878 e!22799)))

(assert (=> b!36111 (= res!21878 (= (h!1502 Nil!936) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!36112 () Bool)

(assert (=> b!36112 (= e!22799 (contains!426 (t!3643 Nil!936) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5391 res!21877) b!36111))

(assert (= (and b!36111 (not res!21878)) b!36112))

(declare-fun m!29079 () Bool)

(assert (=> d!5391 m!29079))

(assert (=> d!5391 m!28805))

(declare-fun m!29081 () Bool)

(assert (=> d!5391 m!29081))

(assert (=> b!36112 m!28805))

(declare-fun m!29083 () Bool)

(assert (=> b!36112 m!29083))

(assert (=> b!35862 d!5391))

(declare-fun d!5393 () Bool)

(assert (=> d!5393 (= (apply!42 lt!13288 #b1000000000000000000000000000000000000000000000000000000000000000) (get!612 (getValueByKey!73 (toList!475 lt!13288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1368 () Bool)

(assert (= bs!1368 d!5393))

(declare-fun m!29085 () Bool)

(assert (=> bs!1368 m!29085))

(assert (=> bs!1368 m!29085))

(declare-fun m!29087 () Bool)

(assert (=> bs!1368 m!29087))

(assert (=> b!35928 d!5393))

(assert (=> b!35971 d!5385))

(declare-fun d!5395 () Bool)

(declare-fun e!22801 () Bool)

(assert (=> d!5395 e!22801))

(declare-fun res!21879 () Bool)

(assert (=> d!5395 (=> res!21879 e!22801)))

(declare-fun lt!13411 () Bool)

(assert (=> d!5395 (= res!21879 (not lt!13411))))

(declare-fun lt!13408 () Bool)

(assert (=> d!5395 (= lt!13411 lt!13408)))

(declare-fun lt!13409 () Unit!795)

(declare-fun e!22800 () Unit!795)

(assert (=> d!5395 (= lt!13409 e!22800)))

(declare-fun c!4125 () Bool)

(assert (=> d!5395 (= c!4125 lt!13408)))

(assert (=> d!5395 (= lt!13408 (containsKey!37 (toList!475 lt!13288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5395 (= (contains!425 lt!13288 #b1000000000000000000000000000000000000000000000000000000000000000) lt!13411)))

(declare-fun b!36113 () Bool)

(declare-fun lt!13410 () Unit!795)

(assert (=> b!36113 (= e!22800 lt!13410)))

(assert (=> b!36113 (= lt!13410 (lemmaContainsKeyImpliesGetValueByKeyDefined!34 (toList!475 lt!13288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!36113 (isDefined!35 (getValueByKey!73 (toList!475 lt!13288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!36114 () Bool)

(declare-fun Unit!802 () Unit!795)

(assert (=> b!36114 (= e!22800 Unit!802)))

(declare-fun b!36115 () Bool)

(assert (=> b!36115 (= e!22801 (isDefined!35 (getValueByKey!73 (toList!475 lt!13288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5395 c!4125) b!36113))

(assert (= (and d!5395 (not c!4125)) b!36114))

(assert (= (and d!5395 (not res!21879)) b!36115))

(declare-fun m!29089 () Bool)

(assert (=> d!5395 m!29089))

(declare-fun m!29091 () Bool)

(assert (=> b!36113 m!29091))

(assert (=> b!36113 m!29085))

(assert (=> b!36113 m!29085))

(declare-fun m!29093 () Bool)

(assert (=> b!36113 m!29093))

(assert (=> b!36115 m!29085))

(assert (=> b!36115 m!29085))

(assert (=> b!36115 m!29093))

(assert (=> bm!2848 d!5395))

(declare-fun d!5397 () Bool)

(declare-fun e!22802 () Bool)

(assert (=> d!5397 e!22802))

(declare-fun res!21881 () Bool)

(assert (=> d!5397 (=> (not res!21881) (not e!22802))))

(declare-fun lt!13413 () ListLongMap!919)

(assert (=> d!5397 (= res!21881 (contains!425 lt!13413 (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun lt!13415 () List!938)

(assert (=> d!5397 (= lt!13413 (ListLongMap!920 lt!13415))))

(declare-fun lt!13414 () Unit!795)

(declare-fun lt!13412 () Unit!795)

(assert (=> d!5397 (= lt!13414 lt!13412)))

(assert (=> d!5397 (= (getValueByKey!73 lt!13415 (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (Some!78 (_2!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5397 (= lt!13412 (lemmaContainsTupThenGetReturnValue!19 lt!13415 (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) (_2!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5397 (= lt!13415 (insertStrictlySorted!19 (toList!475 call!2853) (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) (_2!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(assert (=> d!5397 (= (+!60 call!2853 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)) lt!13413)))

(declare-fun b!36116 () Bool)

(declare-fun res!21880 () Bool)

(assert (=> b!36116 (=> (not res!21880) (not e!22802))))

(assert (=> b!36116 (= res!21880 (= (getValueByKey!73 (toList!475 lt!13413) (_1!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))) (Some!78 (_2!688 (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))))

(declare-fun b!36117 () Bool)

(assert (=> b!36117 (= e!22802 (contains!427 (toList!475 lt!13413) (tuple2!1355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(assert (= (and d!5397 res!21881) b!36116))

(assert (= (and b!36116 res!21880) b!36117))

(declare-fun m!29095 () Bool)

(assert (=> d!5397 m!29095))

(declare-fun m!29097 () Bool)

(assert (=> d!5397 m!29097))

(declare-fun m!29099 () Bool)

(assert (=> d!5397 m!29099))

(declare-fun m!29101 () Bool)

(assert (=> d!5397 m!29101))

(declare-fun m!29103 () Bool)

(assert (=> b!36116 m!29103))

(declare-fun m!29105 () Bool)

(assert (=> b!36117 m!29105))

(assert (=> b!35932 d!5397))

(declare-fun d!5399 () Bool)

(assert (=> d!5399 (arrayContainsKey!0 _keys!1833 lt!13317 #b00000000000000000000000000000000)))

(declare-fun lt!13418 () Unit!795)

(declare-fun choose!13 (array!2457 (_ BitVec 64) (_ BitVec 32)) Unit!795)

(assert (=> d!5399 (= lt!13418 (choose!13 _keys!1833 lt!13317 #b00000000000000000000000000000000))))

(assert (=> d!5399 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!5399 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!13317 #b00000000000000000000000000000000) lt!13418)))

(declare-fun bs!1369 () Bool)

(assert (= bs!1369 d!5399))

(assert (=> bs!1369 m!28889))

(declare-fun m!29107 () Bool)

(assert (=> bs!1369 m!29107))

(assert (=> b!35970 d!5399))

(declare-fun d!5401 () Bool)

(declare-fun res!21882 () Bool)

(declare-fun e!22803 () Bool)

(assert (=> d!5401 (=> res!21882 e!22803)))

(assert (=> d!5401 (= res!21882 (= (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) lt!13317))))

(assert (=> d!5401 (= (arrayContainsKey!0 _keys!1833 lt!13317 #b00000000000000000000000000000000) e!22803)))

(declare-fun b!36118 () Bool)

(declare-fun e!22804 () Bool)

(assert (=> b!36118 (= e!22803 e!22804)))

(declare-fun res!21883 () Bool)

(assert (=> b!36118 (=> (not res!21883) (not e!22804))))

(assert (=> b!36118 (= res!21883 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1274 _keys!1833)))))

(declare-fun b!36119 () Bool)

(assert (=> b!36119 (= e!22804 (arrayContainsKey!0 _keys!1833 lt!13317 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5401 (not res!21882)) b!36118))

(assert (= (and b!36118 res!21883) b!36119))

(assert (=> d!5401 m!28805))

(declare-fun m!29109 () Bool)

(assert (=> b!36119 m!29109))

(assert (=> b!35970 d!5401))

(declare-fun b!36132 () Bool)

(declare-fun e!22813 () SeekEntryResult!170)

(assert (=> b!36132 (= e!22813 Undefined!170)))

(declare-fun b!36133 () Bool)

(declare-fun c!4132 () Bool)

(declare-fun lt!13426 () (_ BitVec 64))

(assert (=> b!36133 (= c!4132 (= lt!13426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22812 () SeekEntryResult!170)

(declare-fun e!22811 () SeekEntryResult!170)

(assert (=> b!36133 (= e!22812 e!22811)))

(declare-fun b!36134 () Bool)

(declare-fun lt!13427 () SeekEntryResult!170)

(assert (=> b!36134 (= e!22812 (Found!170 (index!2804 lt!13427)))))

(declare-fun b!36135 () Bool)

(assert (=> b!36135 (= e!22813 e!22812)))

(assert (=> b!36135 (= lt!13426 (select (arr!1173 _keys!1833) (index!2804 lt!13427)))))

(declare-fun c!4133 () Bool)

(assert (=> b!36135 (= c!4133 (= lt!13426 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5403 () Bool)

(declare-fun lt!13425 () SeekEntryResult!170)

(assert (=> d!5403 (and (or ((_ is Undefined!170) lt!13425) (not ((_ is Found!170) lt!13425)) (and (bvsge (index!2803 lt!13425) #b00000000000000000000000000000000) (bvslt (index!2803 lt!13425) (size!1274 _keys!1833)))) (or ((_ is Undefined!170) lt!13425) ((_ is Found!170) lt!13425) (not ((_ is MissingZero!170) lt!13425)) (and (bvsge (index!2802 lt!13425) #b00000000000000000000000000000000) (bvslt (index!2802 lt!13425) (size!1274 _keys!1833)))) (or ((_ is Undefined!170) lt!13425) ((_ is Found!170) lt!13425) ((_ is MissingZero!170) lt!13425) (not ((_ is MissingVacant!170) lt!13425)) (and (bvsge (index!2805 lt!13425) #b00000000000000000000000000000000) (bvslt (index!2805 lt!13425) (size!1274 _keys!1833)))) (or ((_ is Undefined!170) lt!13425) (ite ((_ is Found!170) lt!13425) (= (select (arr!1173 _keys!1833) (index!2803 lt!13425)) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!170) lt!13425) (= (select (arr!1173 _keys!1833) (index!2802 lt!13425)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!170) lt!13425) (= (select (arr!1173 _keys!1833) (index!2805 lt!13425)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!5403 (= lt!13425 e!22813)))

(declare-fun c!4134 () Bool)

(assert (=> d!5403 (= c!4134 (and ((_ is Intermediate!170) lt!13427) (undefined!982 lt!13427)))))

(assert (=> d!5403 (= lt!13427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) mask!2294) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294))))

(assert (=> d!5403 (validMask!0 mask!2294)))

(assert (=> d!5403 (= (seekEntryOrOpen!0 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) lt!13425)))

(declare-fun b!36136 () Bool)

(assert (=> b!36136 (= e!22811 (MissingZero!170 (index!2804 lt!13427)))))

(declare-fun b!36137 () Bool)

(assert (=> b!36137 (= e!22811 (seekKeyOrZeroReturnVacant!0 (x!7058 lt!13427) (index!2804 lt!13427) (index!2804 lt!13427) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294))))

(assert (= (and d!5403 c!4134) b!36132))

(assert (= (and d!5403 (not c!4134)) b!36135))

(assert (= (and b!36135 c!4133) b!36134))

(assert (= (and b!36135 (not c!4133)) b!36133))

(assert (= (and b!36133 c!4132) b!36136))

(assert (= (and b!36133 (not c!4132)) b!36137))

(declare-fun m!29111 () Bool)

(assert (=> b!36135 m!29111))

(declare-fun m!29113 () Bool)

(assert (=> d!5403 m!29113))

(assert (=> d!5403 m!28755))

(assert (=> d!5403 m!28805))

(declare-fun m!29115 () Bool)

(assert (=> d!5403 m!29115))

(declare-fun m!29117 () Bool)

(assert (=> d!5403 m!29117))

(assert (=> d!5403 m!29115))

(assert (=> d!5403 m!28805))

(declare-fun m!29119 () Bool)

(assert (=> d!5403 m!29119))

(declare-fun m!29121 () Bool)

(assert (=> d!5403 m!29121))

(assert (=> b!36137 m!28805))

(declare-fun m!29123 () Bool)

(assert (=> b!36137 m!29123))

(assert (=> b!35970 d!5403))

(assert (=> b!35916 d!5385))

(declare-fun b!36150 () Bool)

(declare-fun e!22820 () SeekEntryResult!170)

(assert (=> b!36150 (= e!22820 (MissingVacant!170 (index!2804 lt!13305)))))

(declare-fun b!36151 () Bool)

(declare-fun e!22822 () SeekEntryResult!170)

(assert (=> b!36151 (= e!22822 Undefined!170)))

(declare-fun b!36152 () Bool)

(declare-fun e!22821 () SeekEntryResult!170)

(assert (=> b!36152 (= e!22821 (Found!170 (index!2804 lt!13305)))))

(declare-fun lt!13432 () SeekEntryResult!170)

(declare-fun d!5405 () Bool)

(assert (=> d!5405 (and (or ((_ is Undefined!170) lt!13432) (not ((_ is Found!170) lt!13432)) (and (bvsge (index!2803 lt!13432) #b00000000000000000000000000000000) (bvslt (index!2803 lt!13432) (size!1274 _keys!1833)))) (or ((_ is Undefined!170) lt!13432) ((_ is Found!170) lt!13432) (not ((_ is MissingVacant!170) lt!13432)) (not (= (index!2805 lt!13432) (index!2804 lt!13305))) (and (bvsge (index!2805 lt!13432) #b00000000000000000000000000000000) (bvslt (index!2805 lt!13432) (size!1274 _keys!1833)))) (or ((_ is Undefined!170) lt!13432) (ite ((_ is Found!170) lt!13432) (= (select (arr!1173 _keys!1833) (index!2803 lt!13432)) k0!1304) (and ((_ is MissingVacant!170) lt!13432) (= (index!2805 lt!13432) (index!2804 lt!13305)) (= (select (arr!1173 _keys!1833) (index!2805 lt!13432)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!5405 (= lt!13432 e!22822)))

(declare-fun c!4141 () Bool)

(assert (=> d!5405 (= c!4141 (bvsge (x!7058 lt!13305) #b01111111111111111111111111111110))))

(declare-fun lt!13433 () (_ BitVec 64))

(assert (=> d!5405 (= lt!13433 (select (arr!1173 _keys!1833) (index!2804 lt!13305)))))

(assert (=> d!5405 (validMask!0 mask!2294)))

(assert (=> d!5405 (= (seekKeyOrZeroReturnVacant!0 (x!7058 lt!13305) (index!2804 lt!13305) (index!2804 lt!13305) k0!1304 _keys!1833 mask!2294) lt!13432)))

(declare-fun b!36153 () Bool)

(assert (=> b!36153 (= e!22822 e!22821)))

(declare-fun c!4142 () Bool)

(assert (=> b!36153 (= c!4142 (= lt!13433 k0!1304))))

(declare-fun b!36154 () Bool)

(declare-fun c!4143 () Bool)

(assert (=> b!36154 (= c!4143 (= lt!13433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!36154 (= e!22821 e!22820)))

(declare-fun b!36155 () Bool)

(assert (=> b!36155 (= e!22820 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7058 lt!13305) #b00000000000000000000000000000001) (nextIndex!0 (index!2804 lt!13305) (x!7058 lt!13305) mask!2294) (index!2804 lt!13305) k0!1304 _keys!1833 mask!2294))))

(assert (= (and d!5405 c!4141) b!36151))

(assert (= (and d!5405 (not c!4141)) b!36153))

(assert (= (and b!36153 c!4142) b!36152))

(assert (= (and b!36153 (not c!4142)) b!36154))

(assert (= (and b!36154 c!4143) b!36150))

(assert (= (and b!36154 (not c!4143)) b!36155))

(declare-fun m!29125 () Bool)

(assert (=> d!5405 m!29125))

(declare-fun m!29127 () Bool)

(assert (=> d!5405 m!29127))

(assert (=> d!5405 m!28883))

(assert (=> d!5405 m!28755))

(declare-fun m!29129 () Bool)

(assert (=> b!36155 m!29129))

(assert (=> b!36155 m!29129))

(declare-fun m!29131 () Bool)

(assert (=> b!36155 m!29131))

(assert (=> b!35953 d!5405))

(declare-fun d!5407 () Bool)

(assert (=> d!5407 (= (apply!42 lt!13288 (select (arr!1173 _keys!1833) #b00000000000000000000000000000000)) (get!612 (getValueByKey!73 (toList!475 lt!13288) (select (arr!1173 _keys!1833) #b00000000000000000000000000000000))))))

(declare-fun bs!1370 () Bool)

(assert (= bs!1370 d!5407))

(assert (=> bs!1370 m!28805))

(assert (=> bs!1370 m!29067))

(assert (=> bs!1370 m!29067))

(declare-fun m!29133 () Bool)

(assert (=> bs!1370 m!29133))

(assert (=> b!35931 d!5407))

(declare-fun d!5409 () Bool)

(declare-fun c!4146 () Bool)

(assert (=> d!5409 (= c!4146 ((_ is ValueCellFull!617) (select (arr!1172 _values!1501) #b00000000000000000000000000000000)))))

(declare-fun e!22825 () V!2003)

(assert (=> d!5409 (= (get!611 (select (arr!1172 _values!1501) #b00000000000000000000000000000000) (dynLambda!158 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)) e!22825)))

(declare-fun b!36160 () Bool)

(declare-fun get!613 (ValueCell!617 V!2003) V!2003)

(assert (=> b!36160 (= e!22825 (get!613 (select (arr!1172 _values!1501) #b00000000000000000000000000000000) (dynLambda!158 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!36161 () Bool)

(declare-fun get!614 (ValueCell!617 V!2003) V!2003)

(assert (=> b!36161 (= e!22825 (get!614 (select (arr!1172 _values!1501) #b00000000000000000000000000000000) (dynLambda!158 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!5409 c!4146) b!36160))

(assert (= (and d!5409 (not c!4146)) b!36161))

(assert (=> b!36160 m!28863))

(assert (=> b!36160 m!28865))

(declare-fun m!29135 () Bool)

(assert (=> b!36160 m!29135))

(assert (=> b!36161 m!28863))

(assert (=> b!36161 m!28865))

(declare-fun m!29137 () Bool)

(assert (=> b!36161 m!29137))

(assert (=> b!35931 d!5409))

(assert (=> b!35861 d!5385))

(declare-fun mapIsEmpty!2015 () Bool)

(declare-fun mapRes!2015 () Bool)

(assert (=> mapIsEmpty!2015 mapRes!2015))

(declare-fun mapNonEmpty!2015 () Bool)

(declare-fun tp!5300 () Bool)

(declare-fun e!22826 () Bool)

(assert (=> mapNonEmpty!2015 (= mapRes!2015 (and tp!5300 e!22826))))

(declare-fun mapRest!2015 () (Array (_ BitVec 32) ValueCell!617))

(declare-fun mapKey!2015 () (_ BitVec 32))

(declare-fun mapValue!2015 () ValueCell!617)

(assert (=> mapNonEmpty!2015 (= mapRest!2014 (store mapRest!2015 mapKey!2015 mapValue!2015))))

(declare-fun b!36162 () Bool)

(assert (=> b!36162 (= e!22826 tp_is_empty!1633)))

(declare-fun condMapEmpty!2015 () Bool)

(declare-fun mapDefault!2015 () ValueCell!617)

(assert (=> mapNonEmpty!2014 (= condMapEmpty!2015 (= mapRest!2014 ((as const (Array (_ BitVec 32) ValueCell!617)) mapDefault!2015)))))

(declare-fun e!22827 () Bool)

(assert (=> mapNonEmpty!2014 (= tp!5299 (and e!22827 mapRes!2015))))

(declare-fun b!36163 () Bool)

(assert (=> b!36163 (= e!22827 tp_is_empty!1633)))

(assert (= (and mapNonEmpty!2014 condMapEmpty!2015) mapIsEmpty!2015))

(assert (= (and mapNonEmpty!2014 (not condMapEmpty!2015)) mapNonEmpty!2015))

(assert (= (and mapNonEmpty!2015 ((_ is ValueCellFull!617) mapValue!2015)) b!36162))

(assert (= (and mapNonEmpty!2014 ((_ is ValueCellFull!617) mapDefault!2015)) b!36163))

(declare-fun m!29139 () Bool)

(assert (=> mapNonEmpty!2015 m!29139))

(declare-fun b_lambda!1727 () Bool)

(assert (= b_lambda!1723 (or (and start!4570 b_free!1279) b_lambda!1727)))

(declare-fun b_lambda!1729 () Bool)

(assert (= b_lambda!1725 (or (and start!4570 b_free!1279) b_lambda!1729)))

(check-sat (not d!5405) (not d!5365) (not b!36047) (not b_lambda!1727) (not b!36155) (not b!36077) (not b!36031) (not b!36010) (not d!5355) (not b!36161) (not b!36092) (not b!36044) (not d!5397) (not b!36090) (not b!36007) (not b!36049) (not b!36046) (not d!5345) (not d!5351) (not bm!2861) (not b!36098) (not b!36116) (not b!36119) (not d!5369) (not b!36023) (not b!36012) (not d!5357) tp_is_empty!1633 (not b!36036) (not b!36113) (not mapNonEmpty!2015) (not d!5361) (not b!36022) (not b!36042) (not d!5387) b_and!2111 (not b!36104) (not b!36101) (not d!5367) (not b!36048) (not b!36137) (not d!5371) (not d!5393) (not b!36105) (not d!5391) (not d!5407) (not b!36093) (not d!5395) (not d!5343) (not b!36069) (not bm!2859) (not d!5363) (not b!36041) (not b!36006) (not b!36017) (not b_lambda!1729) (not b_lambda!1721) (not d!5383) (not b!36106) (not b!36079) (not b!36038) (not d!5333) (not b!36045) (not d!5399) (not b!36160) (not b!36115) (not b!36025) (not b!36011) (not d!5347) (not b!36014) (not d!5331) (not d!5353) (not d!5377) (not d!5403) (not d!5375) (not d!5337) (not d!5349) (not b_next!1279) (not d!5359) (not bm!2860) (not b!36009) (not b!36112) (not b!36096) (not d!5341) (not b!36117))
(check-sat b_and!2111 (not b_next!1279))
