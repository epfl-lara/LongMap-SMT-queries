; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4208 () Bool)

(assert start!4208)

(declare-fun b_free!1123 () Bool)

(declare-fun b_next!1123 () Bool)

(assert (=> start!4208 (= b_free!1123 (not b_next!1123))))

(declare-fun tp!4788 () Bool)

(declare-fun b_and!1927 () Bool)

(assert (=> start!4208 (= tp!4788 b_and!1927)))

(declare-fun mapNonEmpty!1744 () Bool)

(declare-fun mapRes!1744 () Bool)

(declare-fun tp!4789 () Bool)

(declare-fun e!20446 () Bool)

(assert (=> mapNonEmpty!1744 (= mapRes!1744 (and tp!4789 e!20446))))

(declare-datatypes ((V!1795 0))(
  ( (V!1796 (val!765 Int)) )
))
(declare-datatypes ((ValueCell!539 0))(
  ( (ValueCellFull!539 (v!1853 V!1795)) (EmptyCell!539) )
))
(declare-datatypes ((array!2137 0))(
  ( (array!2138 (arr!1022 (Array (_ BitVec 32) ValueCell!539)) (size!1123 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2137)

(declare-fun mapRest!1744 () (Array (_ BitVec 32) ValueCell!539))

(declare-fun mapValue!1744 () ValueCell!539)

(declare-fun mapKey!1744 () (_ BitVec 32))

(assert (=> mapNonEmpty!1744 (= (arr!1022 _values!1501) (store mapRest!1744 mapKey!1744 mapValue!1744))))

(declare-fun b!32163 () Bool)

(declare-fun e!20445 () Bool)

(declare-fun e!20443 () Bool)

(assert (=> b!32163 (= e!20445 (and e!20443 mapRes!1744))))

(declare-fun condMapEmpty!1744 () Bool)

(declare-fun mapDefault!1744 () ValueCell!539)

(assert (=> b!32163 (= condMapEmpty!1744 (= (arr!1022 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!539)) mapDefault!1744)))))

(declare-fun res!19553 () Bool)

(declare-fun e!20444 () Bool)

(assert (=> start!4208 (=> (not res!19553) (not e!20444))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4208 (= res!19553 (validMask!0 mask!2294))))

(assert (=> start!4208 e!20444))

(assert (=> start!4208 true))

(assert (=> start!4208 tp!4788))

(declare-fun array_inv!719 (array!2137) Bool)

(assert (=> start!4208 (and (array_inv!719 _values!1501) e!20445)))

(declare-datatypes ((array!2139 0))(
  ( (array!2140 (arr!1023 (Array (_ BitVec 32) (_ BitVec 64))) (size!1124 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2139)

(declare-fun array_inv!720 (array!2139) Bool)

(assert (=> start!4208 (array_inv!720 _keys!1833)))

(declare-fun tp_is_empty!1477 () Bool)

(assert (=> start!4208 tp_is_empty!1477))

(declare-fun b!32164 () Bool)

(assert (=> b!32164 (= e!20443 tp_is_empty!1477)))

(declare-fun b!32165 () Bool)

(declare-fun res!19554 () Bool)

(assert (=> b!32165 (=> (not res!19554) (not e!20444))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1795)

(declare-fun minValue!1443 () V!1795)

(declare-datatypes ((tuple2!1244 0))(
  ( (tuple2!1245 (_1!633 (_ BitVec 64)) (_2!633 V!1795)) )
))
(declare-datatypes ((List!826 0))(
  ( (Nil!823) (Cons!822 (h!1389 tuple2!1244) (t!3512 List!826)) )
))
(declare-datatypes ((ListLongMap!809 0))(
  ( (ListLongMap!810 (toList!420 List!826)) )
))
(declare-fun contains!361 (ListLongMap!809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!243 (array!2139 array!2137 (_ BitVec 32) (_ BitVec 32) V!1795 V!1795 (_ BitVec 32) Int) ListLongMap!809)

(assert (=> b!32165 (= res!19554 (not (contains!361 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!32166 () Bool)

(assert (=> b!32166 (= e!20446 tp_is_empty!1477)))

(declare-fun b!32167 () Bool)

(declare-fun res!19552 () Bool)

(assert (=> b!32167 (=> (not res!19552) (not e!20444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32167 (= res!19552 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1744 () Bool)

(assert (=> mapIsEmpty!1744 mapRes!1744))

(declare-fun b!32168 () Bool)

(declare-fun res!19551 () Bool)

(assert (=> b!32168 (=> (not res!19551) (not e!20444))))

(assert (=> b!32168 (= res!19551 (and (= (size!1123 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1124 _keys!1833) (size!1123 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32169 () Bool)

(declare-fun res!19555 () Bool)

(assert (=> b!32169 (=> (not res!19555) (not e!20444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2139 (_ BitVec 32)) Bool)

(assert (=> b!32169 (= res!19555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32170 () Bool)

(declare-fun lt!11641 () (_ BitVec 32))

(assert (=> b!32170 (= e!20444 (or (bvslt lt!11641 #b00000000000000000000000000000000) (bvsge lt!11641 (size!1124 _keys!1833))))))

(declare-fun arrayScanForKey!0 (array!2139 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32170 (= lt!11641 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32171 () Bool)

(declare-fun res!19549 () Bool)

(assert (=> b!32171 (=> (not res!19549) (not e!20444))))

(declare-datatypes ((List!827 0))(
  ( (Nil!824) (Cons!823 (h!1390 (_ BitVec 64)) (t!3513 List!827)) )
))
(declare-fun arrayNoDuplicates!0 (array!2139 (_ BitVec 32) List!827) Bool)

(assert (=> b!32171 (= res!19549 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!824))))

(declare-fun b!32172 () Bool)

(declare-fun res!19550 () Bool)

(assert (=> b!32172 (=> (not res!19550) (not e!20444))))

(declare-fun arrayContainsKey!0 (array!2139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32172 (= res!19550 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!4208 res!19553) b!32168))

(assert (= (and b!32168 res!19551) b!32169))

(assert (= (and b!32169 res!19555) b!32171))

(assert (= (and b!32171 res!19549) b!32167))

(assert (= (and b!32167 res!19552) b!32165))

(assert (= (and b!32165 res!19554) b!32172))

(assert (= (and b!32172 res!19550) b!32170))

(assert (= (and b!32163 condMapEmpty!1744) mapIsEmpty!1744))

(assert (= (and b!32163 (not condMapEmpty!1744)) mapNonEmpty!1744))

(get-info :version)

(assert (= (and mapNonEmpty!1744 ((_ is ValueCellFull!539) mapValue!1744)) b!32166))

(assert (= (and b!32163 ((_ is ValueCellFull!539) mapDefault!1744)) b!32164))

(assert (= start!4208 b!32163))

(declare-fun m!25719 () Bool)

(assert (=> b!32170 m!25719))

(declare-fun m!25721 () Bool)

(assert (=> b!32167 m!25721))

(declare-fun m!25723 () Bool)

(assert (=> b!32171 m!25723))

(declare-fun m!25725 () Bool)

(assert (=> b!32172 m!25725))

(declare-fun m!25727 () Bool)

(assert (=> b!32165 m!25727))

(assert (=> b!32165 m!25727))

(declare-fun m!25729 () Bool)

(assert (=> b!32165 m!25729))

(declare-fun m!25731 () Bool)

(assert (=> mapNonEmpty!1744 m!25731))

(declare-fun m!25733 () Bool)

(assert (=> b!32169 m!25733))

(declare-fun m!25735 () Bool)

(assert (=> start!4208 m!25735))

(declare-fun m!25737 () Bool)

(assert (=> start!4208 m!25737))

(declare-fun m!25739 () Bool)

(assert (=> start!4208 m!25739))

(check-sat tp_is_empty!1477 (not b!32169) (not b!32167) (not b!32171) b_and!1927 (not b!32170) (not b!32165) (not b_next!1123) (not b!32172) (not mapNonEmpty!1744) (not start!4208))
(check-sat b_and!1927 (not b_next!1123))
(get-model)

(declare-fun d!5037 () Bool)

(declare-fun lt!11650 () (_ BitVec 32))

(assert (=> d!5037 (and (or (bvslt lt!11650 #b00000000000000000000000000000000) (bvsge lt!11650 (size!1124 _keys!1833)) (and (bvsge lt!11650 #b00000000000000000000000000000000) (bvslt lt!11650 (size!1124 _keys!1833)))) (bvsge lt!11650 #b00000000000000000000000000000000) (bvslt lt!11650 (size!1124 _keys!1833)) (= (select (arr!1023 _keys!1833) lt!11650) k0!1304))))

(declare-fun e!20479 () (_ BitVec 32))

(assert (=> d!5037 (= lt!11650 e!20479)))

(declare-fun c!3729 () Bool)

(assert (=> d!5037 (= c!3729 (= (select (arr!1023 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5037 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1124 _keys!1833)) (bvslt (size!1124 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5037 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!11650)))

(declare-fun b!32237 () Bool)

(assert (=> b!32237 (= e!20479 #b00000000000000000000000000000000)))

(declare-fun b!32238 () Bool)

(assert (=> b!32238 (= e!20479 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5037 c!3729) b!32237))

(assert (= (and d!5037 (not c!3729)) b!32238))

(declare-fun m!25785 () Bool)

(assert (=> d!5037 m!25785))

(declare-fun m!25787 () Bool)

(assert (=> d!5037 m!25787))

(declare-fun m!25789 () Bool)

(assert (=> b!32238 m!25789))

(assert (=> b!32170 d!5037))

(declare-fun d!5039 () Bool)

(declare-fun e!20484 () Bool)

(assert (=> d!5039 e!20484))

(declare-fun res!19600 () Bool)

(assert (=> d!5039 (=> res!19600 e!20484)))

(declare-fun lt!11661 () Bool)

(assert (=> d!5039 (= res!19600 (not lt!11661))))

(declare-fun lt!11659 () Bool)

(assert (=> d!5039 (= lt!11661 lt!11659)))

(declare-datatypes ((Unit!706 0))(
  ( (Unit!707) )
))
(declare-fun lt!11662 () Unit!706)

(declare-fun e!20485 () Unit!706)

(assert (=> d!5039 (= lt!11662 e!20485)))

(declare-fun c!3732 () Bool)

(assert (=> d!5039 (= c!3732 lt!11659)))

(declare-fun containsKey!28 (List!826 (_ BitVec 64)) Bool)

(assert (=> d!5039 (= lt!11659 (containsKey!28 (toList!420 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5039 (= (contains!361 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!11661)))

(declare-fun b!32245 () Bool)

(declare-fun lt!11660 () Unit!706)

(assert (=> b!32245 (= e!20485 lt!11660)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!25 (List!826 (_ BitVec 64)) Unit!706)

(assert (=> b!32245 (= lt!11660 (lemmaContainsKeyImpliesGetValueByKeyDefined!25 (toList!420 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!70 0))(
  ( (Some!69 (v!1856 V!1795)) (None!68) )
))
(declare-fun isDefined!26 (Option!70) Bool)

(declare-fun getValueByKey!64 (List!826 (_ BitVec 64)) Option!70)

(assert (=> b!32245 (isDefined!26 (getValueByKey!64 (toList!420 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!32246 () Bool)

(declare-fun Unit!708 () Unit!706)

(assert (=> b!32246 (= e!20485 Unit!708)))

(declare-fun b!32247 () Bool)

(assert (=> b!32247 (= e!20484 (isDefined!26 (getValueByKey!64 (toList!420 (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5039 c!3732) b!32245))

(assert (= (and d!5039 (not c!3732)) b!32246))

(assert (= (and d!5039 (not res!19600)) b!32247))

(declare-fun m!25791 () Bool)

(assert (=> d!5039 m!25791))

(declare-fun m!25793 () Bool)

(assert (=> b!32245 m!25793))

(declare-fun m!25795 () Bool)

(assert (=> b!32245 m!25795))

(assert (=> b!32245 m!25795))

(declare-fun m!25797 () Bool)

(assert (=> b!32245 m!25797))

(assert (=> b!32247 m!25795))

(assert (=> b!32247 m!25795))

(assert (=> b!32247 m!25797))

(assert (=> b!32165 d!5039))

(declare-fun bm!2600 () Bool)

(declare-fun call!2607 () Bool)

(declare-fun lt!11726 () ListLongMap!809)

(assert (=> bm!2600 (= call!2607 (contains!361 lt!11726 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32290 () Bool)

(declare-fun res!19623 () Bool)

(declare-fun e!20517 () Bool)

(assert (=> b!32290 (=> (not res!19623) (not e!20517))))

(declare-fun e!20516 () Bool)

(assert (=> b!32290 (= res!19623 e!20516)))

(declare-fun res!19625 () Bool)

(assert (=> b!32290 (=> res!19625 e!20516)))

(declare-fun e!20514 () Bool)

(assert (=> b!32290 (= res!19625 (not e!20514))))

(declare-fun res!19621 () Bool)

(assert (=> b!32290 (=> (not res!19621) (not e!20514))))

(assert (=> b!32290 (= res!19621 (bvslt #b00000000000000000000000000000000 (size!1124 _keys!1833)))))

(declare-fun b!32291 () Bool)

(declare-fun e!20515 () Bool)

(declare-fun apply!33 (ListLongMap!809 (_ BitVec 64)) V!1795)

(assert (=> b!32291 (= e!20515 (= (apply!33 lt!11726 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun d!5041 () Bool)

(assert (=> d!5041 e!20517))

(declare-fun res!19619 () Bool)

(assert (=> d!5041 (=> (not res!19619) (not e!20517))))

(assert (=> d!5041 (= res!19619 (or (bvsge #b00000000000000000000000000000000 (size!1124 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1124 _keys!1833)))))))

(declare-fun lt!11710 () ListLongMap!809)

(assert (=> d!5041 (= lt!11726 lt!11710)))

(declare-fun lt!11722 () Unit!706)

(declare-fun e!20513 () Unit!706)

(assert (=> d!5041 (= lt!11722 e!20513)))

(declare-fun c!3750 () Bool)

(declare-fun e!20523 () Bool)

(assert (=> d!5041 (= c!3750 e!20523)))

(declare-fun res!19626 () Bool)

(assert (=> d!5041 (=> (not res!19626) (not e!20523))))

(assert (=> d!5041 (= res!19626 (bvslt #b00000000000000000000000000000000 (size!1124 _keys!1833)))))

(declare-fun e!20520 () ListLongMap!809)

(assert (=> d!5041 (= lt!11710 e!20520)))

(declare-fun c!3748 () Bool)

(assert (=> d!5041 (= c!3748 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5041 (validMask!0 mask!2294)))

(assert (=> d!5041 (= (getCurrentListMap!243 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!11726)))

(declare-fun b!32292 () Bool)

(declare-fun e!20521 () Bool)

(declare-fun get!550 (ValueCell!539 V!1795) V!1795)

(declare-fun dynLambda!149 (Int (_ BitVec 64)) V!1795)

(assert (=> b!32292 (= e!20521 (= (apply!33 lt!11726 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000)) (get!550 (select (arr!1022 _values!1501) #b00000000000000000000000000000000) (dynLambda!149 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1123 _values!1501)))))

(assert (=> b!32292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1124 _keys!1833)))))

(declare-fun b!32293 () Bool)

(assert (=> b!32293 (= e!20516 e!20521)))

(declare-fun res!19620 () Bool)

(assert (=> b!32293 (=> (not res!19620) (not e!20521))))

(assert (=> b!32293 (= res!19620 (contains!361 lt!11726 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!32293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1124 _keys!1833)))))

(declare-fun b!32294 () Bool)

(declare-fun lt!11718 () Unit!706)

(assert (=> b!32294 (= e!20513 lt!11718)))

(declare-fun lt!11725 () ListLongMap!809)

(declare-fun getCurrentListMapNoExtraKeys!20 (array!2139 array!2137 (_ BitVec 32) (_ BitVec 32) V!1795 V!1795 (_ BitVec 32) Int) ListLongMap!809)

(assert (=> b!32294 (= lt!11725 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11707 () (_ BitVec 64))

(assert (=> b!32294 (= lt!11707 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11717 () (_ BitVec 64))

(assert (=> b!32294 (= lt!11717 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11719 () Unit!706)

(declare-fun addStillContains!18 (ListLongMap!809 (_ BitVec 64) V!1795 (_ BitVec 64)) Unit!706)

(assert (=> b!32294 (= lt!11719 (addStillContains!18 lt!11725 lt!11707 zeroValue!1443 lt!11717))))

(declare-fun +!51 (ListLongMap!809 tuple2!1244) ListLongMap!809)

(assert (=> b!32294 (contains!361 (+!51 lt!11725 (tuple2!1245 lt!11707 zeroValue!1443)) lt!11717)))

(declare-fun lt!11714 () Unit!706)

(assert (=> b!32294 (= lt!11714 lt!11719)))

(declare-fun lt!11715 () ListLongMap!809)

(assert (=> b!32294 (= lt!11715 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11711 () (_ BitVec 64))

(assert (=> b!32294 (= lt!11711 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11724 () (_ BitVec 64))

(assert (=> b!32294 (= lt!11724 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11713 () Unit!706)

(declare-fun addApplyDifferent!18 (ListLongMap!809 (_ BitVec 64) V!1795 (_ BitVec 64)) Unit!706)

(assert (=> b!32294 (= lt!11713 (addApplyDifferent!18 lt!11715 lt!11711 minValue!1443 lt!11724))))

(assert (=> b!32294 (= (apply!33 (+!51 lt!11715 (tuple2!1245 lt!11711 minValue!1443)) lt!11724) (apply!33 lt!11715 lt!11724))))

(declare-fun lt!11709 () Unit!706)

(assert (=> b!32294 (= lt!11709 lt!11713)))

(declare-fun lt!11723 () ListLongMap!809)

(assert (=> b!32294 (= lt!11723 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11728 () (_ BitVec 64))

(assert (=> b!32294 (= lt!11728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11727 () (_ BitVec 64))

(assert (=> b!32294 (= lt!11727 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11721 () Unit!706)

(assert (=> b!32294 (= lt!11721 (addApplyDifferent!18 lt!11723 lt!11728 zeroValue!1443 lt!11727))))

(assert (=> b!32294 (= (apply!33 (+!51 lt!11723 (tuple2!1245 lt!11728 zeroValue!1443)) lt!11727) (apply!33 lt!11723 lt!11727))))

(declare-fun lt!11716 () Unit!706)

(assert (=> b!32294 (= lt!11716 lt!11721)))

(declare-fun lt!11712 () ListLongMap!809)

(assert (=> b!32294 (= lt!11712 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11708 () (_ BitVec 64))

(assert (=> b!32294 (= lt!11708 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11720 () (_ BitVec 64))

(assert (=> b!32294 (= lt!11720 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!32294 (= lt!11718 (addApplyDifferent!18 lt!11712 lt!11708 minValue!1443 lt!11720))))

(assert (=> b!32294 (= (apply!33 (+!51 lt!11712 (tuple2!1245 lt!11708 minValue!1443)) lt!11720) (apply!33 lt!11712 lt!11720))))

(declare-fun b!32295 () Bool)

(declare-fun e!20519 () Bool)

(declare-fun call!2603 () Bool)

(assert (=> b!32295 (= e!20519 (not call!2603))))

(declare-fun b!32296 () Bool)

(declare-fun e!20518 () Bool)

(assert (=> b!32296 (= e!20518 (= (apply!33 lt!11726 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!32297 () Bool)

(declare-fun e!20522 () Bool)

(assert (=> b!32297 (= e!20522 (not call!2607))))

(declare-fun bm!2601 () Bool)

(declare-fun call!2606 () ListLongMap!809)

(declare-fun call!2605 () ListLongMap!809)

(assert (=> bm!2601 (= call!2606 call!2605)))

(declare-fun b!32298 () Bool)

(declare-fun e!20512 () ListLongMap!809)

(declare-fun call!2604 () ListLongMap!809)

(assert (=> b!32298 (= e!20512 call!2604)))

(declare-fun bm!2602 () Bool)

(declare-fun call!2608 () ListLongMap!809)

(assert (=> bm!2602 (= call!2604 call!2608)))

(declare-fun b!32299 () Bool)

(assert (=> b!32299 (= e!20512 call!2606)))

(declare-fun b!32300 () Bool)

(declare-fun Unit!709 () Unit!706)

(assert (=> b!32300 (= e!20513 Unit!709)))

(declare-fun call!2609 () ListLongMap!809)

(declare-fun bm!2603 () Bool)

(assert (=> bm!2603 (= call!2609 (getCurrentListMapNoExtraKeys!20 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32301 () Bool)

(declare-fun c!3746 () Bool)

(assert (=> b!32301 (= c!3746 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!20524 () ListLongMap!809)

(assert (=> b!32301 (= e!20524 e!20512)))

(declare-fun bm!2604 () Bool)

(assert (=> bm!2604 (= call!2605 call!2609)))

(declare-fun b!32302 () Bool)

(declare-fun res!19627 () Bool)

(assert (=> b!32302 (=> (not res!19627) (not e!20517))))

(assert (=> b!32302 (= res!19627 e!20519)))

(declare-fun c!3749 () Bool)

(assert (=> b!32302 (= c!3749 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!32303 () Bool)

(assert (=> b!32303 (= e!20523 (validKeyInArray!0 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32304 () Bool)

(assert (=> b!32304 (= e!20517 e!20522)))

(declare-fun c!3745 () Bool)

(assert (=> b!32304 (= c!3745 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32305 () Bool)

(assert (=> b!32305 (= e!20522 e!20515)))

(declare-fun res!19622 () Bool)

(assert (=> b!32305 (= res!19622 call!2607)))

(assert (=> b!32305 (=> (not res!19622) (not e!20515))))

(declare-fun b!32306 () Bool)

(assert (=> b!32306 (= e!20519 e!20518)))

(declare-fun res!19624 () Bool)

(assert (=> b!32306 (= res!19624 call!2603)))

(assert (=> b!32306 (=> (not res!19624) (not e!20518))))

(declare-fun bm!2605 () Bool)

(assert (=> bm!2605 (= call!2603 (contains!361 lt!11726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32307 () Bool)

(assert (=> b!32307 (= e!20520 e!20524)))

(declare-fun c!3747 () Bool)

(assert (=> b!32307 (= c!3747 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2606 () Bool)

(assert (=> bm!2606 (= call!2608 (+!51 (ite c!3748 call!2609 (ite c!3747 call!2605 call!2606)) (ite (or c!3748 c!3747) (tuple2!1245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!32308 () Bool)

(assert (=> b!32308 (= e!20520 (+!51 call!2608 (tuple2!1245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!32309 () Bool)

(assert (=> b!32309 (= e!20524 call!2604)))

(declare-fun b!32310 () Bool)

(assert (=> b!32310 (= e!20514 (validKeyInArray!0 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5041 c!3748) b!32308))

(assert (= (and d!5041 (not c!3748)) b!32307))

(assert (= (and b!32307 c!3747) b!32309))

(assert (= (and b!32307 (not c!3747)) b!32301))

(assert (= (and b!32301 c!3746) b!32298))

(assert (= (and b!32301 (not c!3746)) b!32299))

(assert (= (or b!32298 b!32299) bm!2601))

(assert (= (or b!32309 bm!2601) bm!2604))

(assert (= (or b!32309 b!32298) bm!2602))

(assert (= (or b!32308 bm!2604) bm!2603))

(assert (= (or b!32308 bm!2602) bm!2606))

(assert (= (and d!5041 res!19626) b!32303))

(assert (= (and d!5041 c!3750) b!32294))

(assert (= (and d!5041 (not c!3750)) b!32300))

(assert (= (and d!5041 res!19619) b!32290))

(assert (= (and b!32290 res!19621) b!32310))

(assert (= (and b!32290 (not res!19625)) b!32293))

(assert (= (and b!32293 res!19620) b!32292))

(assert (= (and b!32290 res!19623) b!32302))

(assert (= (and b!32302 c!3749) b!32306))

(assert (= (and b!32302 (not c!3749)) b!32295))

(assert (= (and b!32306 res!19624) b!32296))

(assert (= (or b!32306 b!32295) bm!2605))

(assert (= (and b!32302 res!19627) b!32304))

(assert (= (and b!32304 c!3745) b!32305))

(assert (= (and b!32304 (not c!3745)) b!32297))

(assert (= (and b!32305 res!19622) b!32291))

(assert (= (or b!32305 b!32297) bm!2600))

(declare-fun b_lambda!1683 () Bool)

(assert (=> (not b_lambda!1683) (not b!32292)))

(declare-fun t!3519 () Bool)

(declare-fun tb!675 () Bool)

(assert (=> (and start!4208 (= defaultEntry!1504 defaultEntry!1504) t!3519) tb!675))

(declare-fun result!1147 () Bool)

(assert (=> tb!675 (= result!1147 tp_is_empty!1477)))

(assert (=> b!32292 t!3519))

(declare-fun b_and!1933 () Bool)

(assert (= b_and!1927 (and (=> t!3519 result!1147) b_and!1933)))

(declare-fun m!25799 () Bool)

(assert (=> bm!2603 m!25799))

(declare-fun m!25801 () Bool)

(assert (=> bm!2605 m!25801))

(declare-fun m!25803 () Bool)

(assert (=> b!32292 m!25803))

(assert (=> b!32292 m!25787))

(declare-fun m!25805 () Bool)

(assert (=> b!32292 m!25805))

(declare-fun m!25807 () Bool)

(assert (=> b!32292 m!25807))

(assert (=> b!32292 m!25803))

(declare-fun m!25809 () Bool)

(assert (=> b!32292 m!25809))

(assert (=> b!32292 m!25787))

(assert (=> b!32292 m!25807))

(declare-fun m!25811 () Bool)

(assert (=> b!32308 m!25811))

(declare-fun m!25813 () Bool)

(assert (=> b!32294 m!25813))

(declare-fun m!25815 () Bool)

(assert (=> b!32294 m!25815))

(declare-fun m!25817 () Bool)

(assert (=> b!32294 m!25817))

(declare-fun m!25819 () Bool)

(assert (=> b!32294 m!25819))

(declare-fun m!25821 () Bool)

(assert (=> b!32294 m!25821))

(declare-fun m!25823 () Bool)

(assert (=> b!32294 m!25823))

(assert (=> b!32294 m!25813))

(assert (=> b!32294 m!25787))

(declare-fun m!25825 () Bool)

(assert (=> b!32294 m!25825))

(declare-fun m!25827 () Bool)

(assert (=> b!32294 m!25827))

(declare-fun m!25829 () Bool)

(assert (=> b!32294 m!25829))

(declare-fun m!25831 () Bool)

(assert (=> b!32294 m!25831))

(declare-fun m!25833 () Bool)

(assert (=> b!32294 m!25833))

(assert (=> b!32294 m!25821))

(declare-fun m!25835 () Bool)

(assert (=> b!32294 m!25835))

(assert (=> b!32294 m!25833))

(declare-fun m!25837 () Bool)

(assert (=> b!32294 m!25837))

(assert (=> b!32294 m!25799))

(declare-fun m!25839 () Bool)

(assert (=> b!32294 m!25839))

(assert (=> b!32294 m!25827))

(declare-fun m!25841 () Bool)

(assert (=> b!32294 m!25841))

(assert (=> b!32303 m!25787))

(assert (=> b!32303 m!25787))

(declare-fun m!25843 () Bool)

(assert (=> b!32303 m!25843))

(declare-fun m!25845 () Bool)

(assert (=> b!32296 m!25845))

(assert (=> b!32293 m!25787))

(assert (=> b!32293 m!25787))

(declare-fun m!25847 () Bool)

(assert (=> b!32293 m!25847))

(assert (=> d!5041 m!25735))

(declare-fun m!25849 () Bool)

(assert (=> bm!2600 m!25849))

(assert (=> b!32310 m!25787))

(assert (=> b!32310 m!25787))

(assert (=> b!32310 m!25843))

(declare-fun m!25851 () Bool)

(assert (=> bm!2606 m!25851))

(declare-fun m!25853 () Bool)

(assert (=> b!32291 m!25853))

(assert (=> b!32165 d!5041))

(declare-fun d!5043 () Bool)

(declare-fun res!19633 () Bool)

(declare-fun e!20533 () Bool)

(assert (=> d!5043 (=> res!19633 e!20533)))

(assert (=> d!5043 (= res!19633 (bvsge #b00000000000000000000000000000000 (size!1124 _keys!1833)))))

(assert (=> d!5043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!20533)))

(declare-fun b!32321 () Bool)

(declare-fun e!20532 () Bool)

(assert (=> b!32321 (= e!20533 e!20532)))

(declare-fun c!3753 () Bool)

(assert (=> b!32321 (= c!3753 (validKeyInArray!0 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32322 () Bool)

(declare-fun e!20531 () Bool)

(declare-fun call!2612 () Bool)

(assert (=> b!32322 (= e!20531 call!2612)))

(declare-fun bm!2609 () Bool)

(assert (=> bm!2609 (= call!2612 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!32323 () Bool)

(assert (=> b!32323 (= e!20532 call!2612)))

(declare-fun b!32324 () Bool)

(assert (=> b!32324 (= e!20532 e!20531)))

(declare-fun lt!11735 () (_ BitVec 64))

(assert (=> b!32324 (= lt!11735 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11737 () Unit!706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2139 (_ BitVec 64) (_ BitVec 32)) Unit!706)

(assert (=> b!32324 (= lt!11737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!11735 #b00000000000000000000000000000000))))

(assert (=> b!32324 (arrayContainsKey!0 _keys!1833 lt!11735 #b00000000000000000000000000000000)))

(declare-fun lt!11736 () Unit!706)

(assert (=> b!32324 (= lt!11736 lt!11737)))

(declare-fun res!19632 () Bool)

(declare-datatypes ((SeekEntryResult!127 0))(
  ( (MissingZero!127 (index!2630 (_ BitVec 32))) (Found!127 (index!2631 (_ BitVec 32))) (Intermediate!127 (undefined!939 Bool) (index!2632 (_ BitVec 32)) (x!6727 (_ BitVec 32))) (Undefined!127) (MissingVacant!127 (index!2633 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2139 (_ BitVec 32)) SeekEntryResult!127)

(assert (=> b!32324 (= res!19632 (= (seekEntryOrOpen!0 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!127 #b00000000000000000000000000000000)))))

(assert (=> b!32324 (=> (not res!19632) (not e!20531))))

(assert (= (and d!5043 (not res!19633)) b!32321))

(assert (= (and b!32321 c!3753) b!32324))

(assert (= (and b!32321 (not c!3753)) b!32323))

(assert (= (and b!32324 res!19632) b!32322))

(assert (= (or b!32322 b!32323) bm!2609))

(assert (=> b!32321 m!25787))

(assert (=> b!32321 m!25787))

(assert (=> b!32321 m!25843))

(declare-fun m!25855 () Bool)

(assert (=> bm!2609 m!25855))

(assert (=> b!32324 m!25787))

(declare-fun m!25857 () Bool)

(assert (=> b!32324 m!25857))

(declare-fun m!25859 () Bool)

(assert (=> b!32324 m!25859))

(assert (=> b!32324 m!25787))

(declare-fun m!25861 () Bool)

(assert (=> b!32324 m!25861))

(assert (=> b!32169 d!5043))

(declare-fun d!5045 () Bool)

(assert (=> d!5045 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4208 d!5045))

(declare-fun d!5047 () Bool)

(assert (=> d!5047 (= (array_inv!719 _values!1501) (bvsge (size!1123 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4208 d!5047))

(declare-fun d!5049 () Bool)

(assert (=> d!5049 (= (array_inv!720 _keys!1833) (bvsge (size!1124 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4208 d!5049))

(declare-fun d!5051 () Bool)

(declare-fun res!19638 () Bool)

(declare-fun e!20538 () Bool)

(assert (=> d!5051 (=> res!19638 e!20538)))

(assert (=> d!5051 (= res!19638 (= (select (arr!1023 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5051 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!20538)))

(declare-fun b!32329 () Bool)

(declare-fun e!20539 () Bool)

(assert (=> b!32329 (= e!20538 e!20539)))

(declare-fun res!19639 () Bool)

(assert (=> b!32329 (=> (not res!19639) (not e!20539))))

(assert (=> b!32329 (= res!19639 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1124 _keys!1833)))))

(declare-fun b!32330 () Bool)

(assert (=> b!32330 (= e!20539 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5051 (not res!19638)) b!32329))

(assert (= (and b!32329 res!19639) b!32330))

(assert (=> d!5051 m!25787))

(declare-fun m!25863 () Bool)

(assert (=> b!32330 m!25863))

(assert (=> b!32172 d!5051))

(declare-fun d!5053 () Bool)

(assert (=> d!5053 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32167 d!5053))

(declare-fun b!32341 () Bool)

(declare-fun e!20548 () Bool)

(declare-fun call!2615 () Bool)

(assert (=> b!32341 (= e!20548 call!2615)))

(declare-fun bm!2612 () Bool)

(declare-fun c!3756 () Bool)

(assert (=> bm!2612 (= call!2615 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3756 (Cons!823 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000) Nil!824) Nil!824)))))

(declare-fun b!32343 () Bool)

(assert (=> b!32343 (= e!20548 call!2615)))

(declare-fun b!32344 () Bool)

(declare-fun e!20550 () Bool)

(declare-fun e!20549 () Bool)

(assert (=> b!32344 (= e!20550 e!20549)))

(declare-fun res!19647 () Bool)

(assert (=> b!32344 (=> (not res!19647) (not e!20549))))

(declare-fun e!20551 () Bool)

(assert (=> b!32344 (= res!19647 (not e!20551))))

(declare-fun res!19646 () Bool)

(assert (=> b!32344 (=> (not res!19646) (not e!20551))))

(assert (=> b!32344 (= res!19646 (validKeyInArray!0 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32345 () Bool)

(declare-fun contains!364 (List!827 (_ BitVec 64)) Bool)

(assert (=> b!32345 (= e!20551 (contains!364 Nil!824 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5055 () Bool)

(declare-fun res!19648 () Bool)

(assert (=> d!5055 (=> res!19648 e!20550)))

(assert (=> d!5055 (= res!19648 (bvsge #b00000000000000000000000000000000 (size!1124 _keys!1833)))))

(assert (=> d!5055 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!824) e!20550)))

(declare-fun b!32342 () Bool)

(assert (=> b!32342 (= e!20549 e!20548)))

(assert (=> b!32342 (= c!3756 (validKeyInArray!0 (select (arr!1023 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5055 (not res!19648)) b!32344))

(assert (= (and b!32344 res!19646) b!32345))

(assert (= (and b!32344 res!19647) b!32342))

(assert (= (and b!32342 c!3756) b!32341))

(assert (= (and b!32342 (not c!3756)) b!32343))

(assert (= (or b!32341 b!32343) bm!2612))

(assert (=> bm!2612 m!25787))

(declare-fun m!25865 () Bool)

(assert (=> bm!2612 m!25865))

(assert (=> b!32344 m!25787))

(assert (=> b!32344 m!25787))

(assert (=> b!32344 m!25843))

(assert (=> b!32345 m!25787))

(assert (=> b!32345 m!25787))

(declare-fun m!25867 () Bool)

(assert (=> b!32345 m!25867))

(assert (=> b!32342 m!25787))

(assert (=> b!32342 m!25787))

(assert (=> b!32342 m!25843))

(assert (=> b!32171 d!5055))

(declare-fun condMapEmpty!1753 () Bool)

(declare-fun mapDefault!1753 () ValueCell!539)

(assert (=> mapNonEmpty!1744 (= condMapEmpty!1753 (= mapRest!1744 ((as const (Array (_ BitVec 32) ValueCell!539)) mapDefault!1753)))))

(declare-fun e!20557 () Bool)

(declare-fun mapRes!1753 () Bool)

(assert (=> mapNonEmpty!1744 (= tp!4789 (and e!20557 mapRes!1753))))

(declare-fun b!32353 () Bool)

(assert (=> b!32353 (= e!20557 tp_is_empty!1477)))

(declare-fun mapNonEmpty!1753 () Bool)

(declare-fun tp!4804 () Bool)

(declare-fun e!20556 () Bool)

(assert (=> mapNonEmpty!1753 (= mapRes!1753 (and tp!4804 e!20556))))

(declare-fun mapRest!1753 () (Array (_ BitVec 32) ValueCell!539))

(declare-fun mapValue!1753 () ValueCell!539)

(declare-fun mapKey!1753 () (_ BitVec 32))

(assert (=> mapNonEmpty!1753 (= mapRest!1744 (store mapRest!1753 mapKey!1753 mapValue!1753))))

(declare-fun mapIsEmpty!1753 () Bool)

(assert (=> mapIsEmpty!1753 mapRes!1753))

(declare-fun b!32352 () Bool)

(assert (=> b!32352 (= e!20556 tp_is_empty!1477)))

(assert (= (and mapNonEmpty!1744 condMapEmpty!1753) mapIsEmpty!1753))

(assert (= (and mapNonEmpty!1744 (not condMapEmpty!1753)) mapNonEmpty!1753))

(assert (= (and mapNonEmpty!1753 ((_ is ValueCellFull!539) mapValue!1753)) b!32352))

(assert (= (and mapNonEmpty!1744 ((_ is ValueCellFull!539) mapDefault!1753)) b!32353))

(declare-fun m!25869 () Bool)

(assert (=> mapNonEmpty!1753 m!25869))

(declare-fun b_lambda!1685 () Bool)

(assert (= b_lambda!1683 (or (and start!4208 b_free!1123) b_lambda!1685)))

(check-sat (not b!32345) (not bm!2603) (not b!32303) (not b!32344) (not b!32292) (not b!32342) (not b_next!1123) (not b!32247) (not bm!2605) tp_is_empty!1477 (not d!5041) (not bm!2612) (not mapNonEmpty!1753) (not b!32330) (not b!32245) (not b!32293) (not b!32291) b_and!1933 (not b!32324) (not b!32310) (not b!32294) (not b!32238) (not bm!2609) (not d!5039) (not b!32321) (not bm!2600) (not bm!2606) (not b!32308) (not b_lambda!1685) (not b!32296))
(check-sat b_and!1933 (not b_next!1123))
