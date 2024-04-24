; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71436 () Bool)

(assert start!71436)

(declare-fun b_free!13417 () Bool)

(declare-fun b_next!13417 () Bool)

(assert (=> start!71436 (= b_free!13417 (not b_next!13417))))

(declare-fun tp!47013 () Bool)

(declare-fun b_and!22365 () Bool)

(assert (=> start!71436 (= tp!47013 b_and!22365)))

(declare-fun b!828721 () Bool)

(declare-fun e!461797 () Bool)

(declare-datatypes ((array!46427 0))(
  ( (array!46428 (arr!22253 (Array (_ BitVec 32) (_ BitVec 64))) (size!22673 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46427)

(assert (=> b!828721 (= e!461797 (bvsgt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(declare-datatypes ((V!25171 0))(
  ( (V!25172 (val!7611 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25171)

(declare-fun minValue!754 () V!25171)

(declare-datatypes ((ValueCell!7148 0))(
  ( (ValueCellFull!7148 (v!10046 V!25171)) (EmptyCell!7148) )
))
(declare-datatypes ((array!46429 0))(
  ( (array!46430 (arr!22254 (Array (_ BitVec 32) ValueCell!7148)) (size!22674 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46429)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10014 0))(
  ( (tuple2!10015 (_1!5018 (_ BitVec 64)) (_2!5018 V!25171)) )
))
(declare-datatypes ((List!15790 0))(
  ( (Nil!15787) (Cons!15786 (h!16921 tuple2!10014) (t!22131 List!15790)) )
))
(declare-datatypes ((ListLongMap!8839 0))(
  ( (ListLongMap!8840 (toList!4435 List!15790)) )
))
(declare-fun lt!375371 () ListLongMap!8839)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2512 (array!46427 array!46429 (_ BitVec 32) (_ BitVec 32) V!25171 V!25171 (_ BitVec 32) Int) ListLongMap!8839)

(assert (=> b!828721 (= lt!375371 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25171)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!375370 () ListLongMap!8839)

(assert (=> b!828721 (= lt!375370 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!564545 () Bool)

(assert (=> start!71436 (=> (not res!564545) (not e!461797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71436 (= res!564545 (validMask!0 mask!1312))))

(assert (=> start!71436 e!461797))

(declare-fun tp_is_empty!15127 () Bool)

(assert (=> start!71436 tp_is_empty!15127))

(declare-fun array_inv!17775 (array!46427) Bool)

(assert (=> start!71436 (array_inv!17775 _keys!976)))

(assert (=> start!71436 true))

(declare-fun e!461795 () Bool)

(declare-fun array_inv!17776 (array!46429) Bool)

(assert (=> start!71436 (and (array_inv!17776 _values!788) e!461795)))

(assert (=> start!71436 tp!47013))

(declare-fun mapIsEmpty!24319 () Bool)

(declare-fun mapRes!24319 () Bool)

(assert (=> mapIsEmpty!24319 mapRes!24319))

(declare-fun b!828722 () Bool)

(declare-fun e!461794 () Bool)

(assert (=> b!828722 (= e!461794 tp_is_empty!15127)))

(declare-fun b!828723 () Bool)

(assert (=> b!828723 (= e!461795 (and e!461794 mapRes!24319))))

(declare-fun condMapEmpty!24319 () Bool)

(declare-fun mapDefault!24319 () ValueCell!7148)

(assert (=> b!828723 (= condMapEmpty!24319 (= (arr!22254 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7148)) mapDefault!24319)))))

(declare-fun mapNonEmpty!24319 () Bool)

(declare-fun tp!47014 () Bool)

(declare-fun e!461793 () Bool)

(assert (=> mapNonEmpty!24319 (= mapRes!24319 (and tp!47014 e!461793))))

(declare-fun mapRest!24319 () (Array (_ BitVec 32) ValueCell!7148))

(declare-fun mapValue!24319 () ValueCell!7148)

(declare-fun mapKey!24319 () (_ BitVec 32))

(assert (=> mapNonEmpty!24319 (= (arr!22254 _values!788) (store mapRest!24319 mapKey!24319 mapValue!24319))))

(declare-fun b!828724 () Bool)

(assert (=> b!828724 (= e!461793 tp_is_empty!15127)))

(declare-fun b!828725 () Bool)

(declare-fun res!564546 () Bool)

(assert (=> b!828725 (=> (not res!564546) (not e!461797))))

(assert (=> b!828725 (= res!564546 (and (= (size!22674 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22673 _keys!976) (size!22674 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828726 () Bool)

(declare-fun res!564543 () Bool)

(assert (=> b!828726 (=> (not res!564543) (not e!461797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46427 (_ BitVec 32)) Bool)

(assert (=> b!828726 (= res!564543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828727 () Bool)

(declare-fun res!564544 () Bool)

(assert (=> b!828727 (=> (not res!564544) (not e!461797))))

(declare-datatypes ((List!15791 0))(
  ( (Nil!15788) (Cons!15787 (h!16922 (_ BitVec 64)) (t!22132 List!15791)) )
))
(declare-fun arrayNoDuplicates!0 (array!46427 (_ BitVec 32) List!15791) Bool)

(assert (=> b!828727 (= res!564544 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15788))))

(assert (= (and start!71436 res!564545) b!828725))

(assert (= (and b!828725 res!564546) b!828726))

(assert (= (and b!828726 res!564543) b!828727))

(assert (= (and b!828727 res!564544) b!828721))

(assert (= (and b!828723 condMapEmpty!24319) mapIsEmpty!24319))

(assert (= (and b!828723 (not condMapEmpty!24319)) mapNonEmpty!24319))

(get-info :version)

(assert (= (and mapNonEmpty!24319 ((_ is ValueCellFull!7148) mapValue!24319)) b!828724))

(assert (= (and b!828723 ((_ is ValueCellFull!7148) mapDefault!24319)) b!828722))

(assert (= start!71436 b!828723))

(declare-fun m!772097 () Bool)

(assert (=> b!828726 m!772097))

(declare-fun m!772099 () Bool)

(assert (=> mapNonEmpty!24319 m!772099))

(declare-fun m!772101 () Bool)

(assert (=> b!828721 m!772101))

(declare-fun m!772103 () Bool)

(assert (=> b!828721 m!772103))

(declare-fun m!772105 () Bool)

(assert (=> start!71436 m!772105))

(declare-fun m!772107 () Bool)

(assert (=> start!71436 m!772107))

(declare-fun m!772109 () Bool)

(assert (=> start!71436 m!772109))

(declare-fun m!772111 () Bool)

(assert (=> b!828727 m!772111))

(check-sat b_and!22365 (not mapNonEmpty!24319) (not b!828721) (not b!828726) (not start!71436) tp_is_empty!15127 (not b_next!13417) (not b!828727))
(check-sat b_and!22365 (not b_next!13417))
(get-model)

(declare-fun d!105449 () Bool)

(assert (=> d!105449 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71436 d!105449))

(declare-fun d!105451 () Bool)

(assert (=> d!105451 (= (array_inv!17775 _keys!976) (bvsge (size!22673 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71436 d!105451))

(declare-fun d!105453 () Bool)

(assert (=> d!105453 (= (array_inv!17776 _values!788) (bvsge (size!22674 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71436 d!105453))

(declare-fun b!828778 () Bool)

(declare-fun e!461836 () Bool)

(declare-fun call!35994 () Bool)

(assert (=> b!828778 (= e!461836 call!35994)))

(declare-fun b!828779 () Bool)

(declare-fun e!461835 () Bool)

(assert (=> b!828779 (= e!461835 e!461836)))

(declare-fun lt!375391 () (_ BitVec 64))

(assert (=> b!828779 (= lt!375391 (select (arr!22253 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28384 0))(
  ( (Unit!28385) )
))
(declare-fun lt!375390 () Unit!28384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46427 (_ BitVec 64) (_ BitVec 32)) Unit!28384)

(assert (=> b!828779 (= lt!375390 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375391 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!828779 (arrayContainsKey!0 _keys!976 lt!375391 #b00000000000000000000000000000000)))

(declare-fun lt!375392 () Unit!28384)

(assert (=> b!828779 (= lt!375392 lt!375390)))

(declare-fun res!564575 () Bool)

(declare-datatypes ((SeekEntryResult!8687 0))(
  ( (MissingZero!8687 (index!37119 (_ BitVec 32))) (Found!8687 (index!37120 (_ BitVec 32))) (Intermediate!8687 (undefined!9499 Bool) (index!37121 (_ BitVec 32)) (x!69874 (_ BitVec 32))) (Undefined!8687) (MissingVacant!8687 (index!37122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46427 (_ BitVec 32)) SeekEntryResult!8687)

(assert (=> b!828779 (= res!564575 (= (seekEntryOrOpen!0 (select (arr!22253 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8687 #b00000000000000000000000000000000)))))

(assert (=> b!828779 (=> (not res!564575) (not e!461836))))

(declare-fun d!105455 () Bool)

(declare-fun res!564576 () Bool)

(declare-fun e!461834 () Bool)

(assert (=> d!105455 (=> res!564576 e!461834)))

(assert (=> d!105455 (= res!564576 (bvsge #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(assert (=> d!105455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461834)))

(declare-fun bm!35991 () Bool)

(assert (=> bm!35991 (= call!35994 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!828780 () Bool)

(assert (=> b!828780 (= e!461834 e!461835)))

(declare-fun c!89802 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!828780 (= c!89802 (validKeyInArray!0 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828781 () Bool)

(assert (=> b!828781 (= e!461835 call!35994)))

(assert (= (and d!105455 (not res!564576)) b!828780))

(assert (= (and b!828780 c!89802) b!828779))

(assert (= (and b!828780 (not c!89802)) b!828781))

(assert (= (and b!828779 res!564575) b!828778))

(assert (= (or b!828778 b!828781) bm!35991))

(declare-fun m!772145 () Bool)

(assert (=> b!828779 m!772145))

(declare-fun m!772147 () Bool)

(assert (=> b!828779 m!772147))

(declare-fun m!772149 () Bool)

(assert (=> b!828779 m!772149))

(assert (=> b!828779 m!772145))

(declare-fun m!772151 () Bool)

(assert (=> b!828779 m!772151))

(declare-fun m!772153 () Bool)

(assert (=> bm!35991 m!772153))

(assert (=> b!828780 m!772145))

(assert (=> b!828780 m!772145))

(declare-fun m!772155 () Bool)

(assert (=> b!828780 m!772155))

(assert (=> b!828726 d!105455))

(declare-fun b!828806 () Bool)

(assert (=> b!828806 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(assert (=> b!828806 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22674 _values!788)))))

(declare-fun lt!375407 () ListLongMap!8839)

(declare-fun e!461854 () Bool)

(declare-fun apply!364 (ListLongMap!8839 (_ BitVec 64)) V!25171)

(declare-fun get!11786 (ValueCell!7148 V!25171) V!25171)

(declare-fun dynLambda!972 (Int (_ BitVec 64)) V!25171)

(assert (=> b!828806 (= e!461854 (= (apply!364 lt!375407 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)) (get!11786 (select (arr!22254 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!828808 () Bool)

(declare-fun e!461855 () Bool)

(declare-fun e!461851 () Bool)

(assert (=> b!828808 (= e!461855 e!461851)))

(declare-fun c!89812 () Bool)

(assert (=> b!828808 (= c!89812 (bvslt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(declare-fun b!828809 () Bool)

(declare-fun e!461852 () Bool)

(assert (=> b!828809 (= e!461852 e!461855)))

(declare-fun c!89811 () Bool)

(declare-fun e!461853 () Bool)

(assert (=> b!828809 (= c!89811 e!461853)))

(declare-fun res!564585 () Bool)

(assert (=> b!828809 (=> (not res!564585) (not e!461853))))

(assert (=> b!828809 (= res!564585 (bvslt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(declare-fun b!828810 () Bool)

(assert (=> b!828810 (= e!461855 e!461854)))

(assert (=> b!828810 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(declare-fun res!564587 () Bool)

(declare-fun contains!4163 (ListLongMap!8839 (_ BitVec 64)) Bool)

(assert (=> b!828810 (= res!564587 (contains!4163 lt!375407 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828810 (=> (not res!564587) (not e!461854))))

(declare-fun b!828811 () Bool)

(declare-fun res!564588 () Bool)

(assert (=> b!828811 (=> (not res!564588) (not e!461852))))

(assert (=> b!828811 (= res!564588 (not (contains!4163 lt!375407 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828812 () Bool)

(declare-fun e!461857 () ListLongMap!8839)

(declare-fun call!35997 () ListLongMap!8839)

(assert (=> b!828812 (= e!461857 call!35997)))

(declare-fun b!828813 () Bool)

(declare-fun e!461856 () ListLongMap!8839)

(assert (=> b!828813 (= e!461856 (ListLongMap!8840 Nil!15787))))

(declare-fun b!828814 () Bool)

(assert (=> b!828814 (= e!461853 (validKeyInArray!0 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828814 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828807 () Bool)

(declare-fun isEmpty!652 (ListLongMap!8839) Bool)

(assert (=> b!828807 (= e!461851 (isEmpty!652 lt!375407))))

(declare-fun d!105457 () Bool)

(assert (=> d!105457 e!461852))

(declare-fun res!564586 () Bool)

(assert (=> d!105457 (=> (not res!564586) (not e!461852))))

(assert (=> d!105457 (= res!564586 (not (contains!4163 lt!375407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105457 (= lt!375407 e!461856)))

(declare-fun c!89814 () Bool)

(assert (=> d!105457 (= c!89814 (bvsge #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(assert (=> d!105457 (validMask!0 mask!1312)))

(assert (=> d!105457 (= (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375407)))

(declare-fun b!828815 () Bool)

(assert (=> b!828815 (= e!461856 e!461857)))

(declare-fun c!89813 () Bool)

(assert (=> b!828815 (= c!89813 (validKeyInArray!0 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828816 () Bool)

(declare-fun lt!375409 () Unit!28384)

(declare-fun lt!375408 () Unit!28384)

(assert (=> b!828816 (= lt!375409 lt!375408)))

(declare-fun lt!375411 () V!25171)

(declare-fun lt!375410 () ListLongMap!8839)

(declare-fun lt!375412 () (_ BitVec 64))

(declare-fun lt!375413 () (_ BitVec 64))

(declare-fun +!1959 (ListLongMap!8839 tuple2!10014) ListLongMap!8839)

(assert (=> b!828816 (not (contains!4163 (+!1959 lt!375410 (tuple2!10015 lt!375412 lt!375411)) lt!375413))))

(declare-fun addStillNotContains!191 (ListLongMap!8839 (_ BitVec 64) V!25171 (_ BitVec 64)) Unit!28384)

(assert (=> b!828816 (= lt!375408 (addStillNotContains!191 lt!375410 lt!375412 lt!375411 lt!375413))))

(assert (=> b!828816 (= lt!375413 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828816 (= lt!375411 (get!11786 (select (arr!22254 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828816 (= lt!375412 (select (arr!22253 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828816 (= lt!375410 call!35997)))

(assert (=> b!828816 (= e!461857 (+!1959 call!35997 (tuple2!10015 (select (arr!22253 _keys!976) #b00000000000000000000000000000000) (get!11786 (select (arr!22254 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828817 () Bool)

(assert (=> b!828817 (= e!461851 (= lt!375407 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35994 () Bool)

(assert (=> bm!35994 (= call!35997 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105457 c!89814) b!828813))

(assert (= (and d!105457 (not c!89814)) b!828815))

(assert (= (and b!828815 c!89813) b!828816))

(assert (= (and b!828815 (not c!89813)) b!828812))

(assert (= (or b!828816 b!828812) bm!35994))

(assert (= (and d!105457 res!564586) b!828811))

(assert (= (and b!828811 res!564588) b!828809))

(assert (= (and b!828809 res!564585) b!828814))

(assert (= (and b!828809 c!89811) b!828810))

(assert (= (and b!828809 (not c!89811)) b!828808))

(assert (= (and b!828810 res!564587) b!828806))

(assert (= (and b!828808 c!89812) b!828817))

(assert (= (and b!828808 (not c!89812)) b!828807))

(declare-fun b_lambda!11177 () Bool)

(assert (=> (not b_lambda!11177) (not b!828806)))

(declare-fun t!22137 () Bool)

(declare-fun tb!4201 () Bool)

(assert (=> (and start!71436 (= defaultEntry!796 defaultEntry!796) t!22137) tb!4201))

(declare-fun result!7959 () Bool)

(assert (=> tb!4201 (= result!7959 tp_is_empty!15127)))

(assert (=> b!828806 t!22137))

(declare-fun b_and!22371 () Bool)

(assert (= b_and!22365 (and (=> t!22137 result!7959) b_and!22371)))

(declare-fun b_lambda!11179 () Bool)

(assert (=> (not b_lambda!11179) (not b!828816)))

(assert (=> b!828816 t!22137))

(declare-fun b_and!22373 () Bool)

(assert (= b_and!22371 (and (=> t!22137 result!7959) b_and!22373)))

(assert (=> b!828810 m!772145))

(assert (=> b!828810 m!772145))

(declare-fun m!772157 () Bool)

(assert (=> b!828810 m!772157))

(declare-fun m!772159 () Bool)

(assert (=> b!828817 m!772159))

(declare-fun m!772161 () Bool)

(assert (=> b!828807 m!772161))

(assert (=> b!828814 m!772145))

(assert (=> b!828814 m!772145))

(assert (=> b!828814 m!772155))

(declare-fun m!772163 () Bool)

(assert (=> d!105457 m!772163))

(assert (=> d!105457 m!772105))

(assert (=> b!828806 m!772145))

(assert (=> b!828806 m!772145))

(declare-fun m!772165 () Bool)

(assert (=> b!828806 m!772165))

(declare-fun m!772167 () Bool)

(assert (=> b!828806 m!772167))

(declare-fun m!772169 () Bool)

(assert (=> b!828806 m!772169))

(assert (=> b!828806 m!772169))

(assert (=> b!828806 m!772167))

(declare-fun m!772171 () Bool)

(assert (=> b!828806 m!772171))

(declare-fun m!772173 () Bool)

(assert (=> b!828811 m!772173))

(assert (=> b!828815 m!772145))

(assert (=> b!828815 m!772145))

(assert (=> b!828815 m!772155))

(assert (=> bm!35994 m!772159))

(declare-fun m!772175 () Bool)

(assert (=> b!828816 m!772175))

(declare-fun m!772177 () Bool)

(assert (=> b!828816 m!772177))

(assert (=> b!828816 m!772145))

(declare-fun m!772179 () Bool)

(assert (=> b!828816 m!772179))

(declare-fun m!772181 () Bool)

(assert (=> b!828816 m!772181))

(assert (=> b!828816 m!772167))

(assert (=> b!828816 m!772175))

(assert (=> b!828816 m!772169))

(assert (=> b!828816 m!772169))

(assert (=> b!828816 m!772167))

(assert (=> b!828816 m!772171))

(assert (=> b!828721 d!105457))

(declare-fun b!828820 () Bool)

(assert (=> b!828820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(assert (=> b!828820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22674 _values!788)))))

(declare-fun lt!375414 () ListLongMap!8839)

(declare-fun e!461861 () Bool)

(assert (=> b!828820 (= e!461861 (= (apply!364 lt!375414 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)) (get!11786 (select (arr!22254 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!828822 () Bool)

(declare-fun e!461862 () Bool)

(declare-fun e!461858 () Bool)

(assert (=> b!828822 (= e!461862 e!461858)))

(declare-fun c!89816 () Bool)

(assert (=> b!828822 (= c!89816 (bvslt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(declare-fun b!828823 () Bool)

(declare-fun e!461859 () Bool)

(assert (=> b!828823 (= e!461859 e!461862)))

(declare-fun c!89815 () Bool)

(declare-fun e!461860 () Bool)

(assert (=> b!828823 (= c!89815 e!461860)))

(declare-fun res!564589 () Bool)

(assert (=> b!828823 (=> (not res!564589) (not e!461860))))

(assert (=> b!828823 (= res!564589 (bvslt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(declare-fun b!828824 () Bool)

(assert (=> b!828824 (= e!461862 e!461861)))

(assert (=> b!828824 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(declare-fun res!564591 () Bool)

(assert (=> b!828824 (= res!564591 (contains!4163 lt!375414 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828824 (=> (not res!564591) (not e!461861))))

(declare-fun b!828825 () Bool)

(declare-fun res!564592 () Bool)

(assert (=> b!828825 (=> (not res!564592) (not e!461859))))

(assert (=> b!828825 (= res!564592 (not (contains!4163 lt!375414 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828826 () Bool)

(declare-fun e!461864 () ListLongMap!8839)

(declare-fun call!35998 () ListLongMap!8839)

(assert (=> b!828826 (= e!461864 call!35998)))

(declare-fun b!828827 () Bool)

(declare-fun e!461863 () ListLongMap!8839)

(assert (=> b!828827 (= e!461863 (ListLongMap!8840 Nil!15787))))

(declare-fun b!828828 () Bool)

(assert (=> b!828828 (= e!461860 (validKeyInArray!0 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828828 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828821 () Bool)

(assert (=> b!828821 (= e!461858 (isEmpty!652 lt!375414))))

(declare-fun d!105459 () Bool)

(assert (=> d!105459 e!461859))

(declare-fun res!564590 () Bool)

(assert (=> d!105459 (=> (not res!564590) (not e!461859))))

(assert (=> d!105459 (= res!564590 (not (contains!4163 lt!375414 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105459 (= lt!375414 e!461863)))

(declare-fun c!89818 () Bool)

(assert (=> d!105459 (= c!89818 (bvsge #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(assert (=> d!105459 (validMask!0 mask!1312)))

(assert (=> d!105459 (= (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375414)))

(declare-fun b!828829 () Bool)

(assert (=> b!828829 (= e!461863 e!461864)))

(declare-fun c!89817 () Bool)

(assert (=> b!828829 (= c!89817 (validKeyInArray!0 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828830 () Bool)

(declare-fun lt!375416 () Unit!28384)

(declare-fun lt!375415 () Unit!28384)

(assert (=> b!828830 (= lt!375416 lt!375415)))

(declare-fun lt!375420 () (_ BitVec 64))

(declare-fun lt!375417 () ListLongMap!8839)

(declare-fun lt!375419 () (_ BitVec 64))

(declare-fun lt!375418 () V!25171)

(assert (=> b!828830 (not (contains!4163 (+!1959 lt!375417 (tuple2!10015 lt!375419 lt!375418)) lt!375420))))

(assert (=> b!828830 (= lt!375415 (addStillNotContains!191 lt!375417 lt!375419 lt!375418 lt!375420))))

(assert (=> b!828830 (= lt!375420 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828830 (= lt!375418 (get!11786 (select (arr!22254 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828830 (= lt!375419 (select (arr!22253 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828830 (= lt!375417 call!35998)))

(assert (=> b!828830 (= e!461864 (+!1959 call!35998 (tuple2!10015 (select (arr!22253 _keys!976) #b00000000000000000000000000000000) (get!11786 (select (arr!22254 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828831 () Bool)

(assert (=> b!828831 (= e!461858 (= lt!375414 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35995 () Bool)

(assert (=> bm!35995 (= call!35998 (getCurrentListMapNoExtraKeys!2512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105459 c!89818) b!828827))

(assert (= (and d!105459 (not c!89818)) b!828829))

(assert (= (and b!828829 c!89817) b!828830))

(assert (= (and b!828829 (not c!89817)) b!828826))

(assert (= (or b!828830 b!828826) bm!35995))

(assert (= (and d!105459 res!564590) b!828825))

(assert (= (and b!828825 res!564592) b!828823))

(assert (= (and b!828823 res!564589) b!828828))

(assert (= (and b!828823 c!89815) b!828824))

(assert (= (and b!828823 (not c!89815)) b!828822))

(assert (= (and b!828824 res!564591) b!828820))

(assert (= (and b!828822 c!89816) b!828831))

(assert (= (and b!828822 (not c!89816)) b!828821))

(declare-fun b_lambda!11181 () Bool)

(assert (=> (not b_lambda!11181) (not b!828820)))

(assert (=> b!828820 t!22137))

(declare-fun b_and!22375 () Bool)

(assert (= b_and!22373 (and (=> t!22137 result!7959) b_and!22375)))

(declare-fun b_lambda!11183 () Bool)

(assert (=> (not b_lambda!11183) (not b!828830)))

(assert (=> b!828830 t!22137))

(declare-fun b_and!22377 () Bool)

(assert (= b_and!22375 (and (=> t!22137 result!7959) b_and!22377)))

(assert (=> b!828824 m!772145))

(assert (=> b!828824 m!772145))

(declare-fun m!772183 () Bool)

(assert (=> b!828824 m!772183))

(declare-fun m!772185 () Bool)

(assert (=> b!828831 m!772185))

(declare-fun m!772187 () Bool)

(assert (=> b!828821 m!772187))

(assert (=> b!828828 m!772145))

(assert (=> b!828828 m!772145))

(assert (=> b!828828 m!772155))

(declare-fun m!772189 () Bool)

(assert (=> d!105459 m!772189))

(assert (=> d!105459 m!772105))

(assert (=> b!828820 m!772145))

(assert (=> b!828820 m!772145))

(declare-fun m!772191 () Bool)

(assert (=> b!828820 m!772191))

(assert (=> b!828820 m!772167))

(assert (=> b!828820 m!772169))

(assert (=> b!828820 m!772169))

(assert (=> b!828820 m!772167))

(assert (=> b!828820 m!772171))

(declare-fun m!772193 () Bool)

(assert (=> b!828825 m!772193))

(assert (=> b!828829 m!772145))

(assert (=> b!828829 m!772145))

(assert (=> b!828829 m!772155))

(assert (=> bm!35995 m!772185))

(declare-fun m!772195 () Bool)

(assert (=> b!828830 m!772195))

(declare-fun m!772197 () Bool)

(assert (=> b!828830 m!772197))

(assert (=> b!828830 m!772145))

(declare-fun m!772199 () Bool)

(assert (=> b!828830 m!772199))

(declare-fun m!772201 () Bool)

(assert (=> b!828830 m!772201))

(assert (=> b!828830 m!772167))

(assert (=> b!828830 m!772195))

(assert (=> b!828830 m!772169))

(assert (=> b!828830 m!772169))

(assert (=> b!828830 m!772167))

(assert (=> b!828830 m!772171))

(assert (=> b!828721 d!105459))

(declare-fun bm!35998 () Bool)

(declare-fun call!36001 () Bool)

(declare-fun c!89821 () Bool)

(assert (=> bm!35998 (= call!36001 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89821 (Cons!15787 (select (arr!22253 _keys!976) #b00000000000000000000000000000000) Nil!15788) Nil!15788)))))

(declare-fun b!828842 () Bool)

(declare-fun e!461874 () Bool)

(assert (=> b!828842 (= e!461874 call!36001)))

(declare-fun b!828843 () Bool)

(assert (=> b!828843 (= e!461874 call!36001)))

(declare-fun b!828844 () Bool)

(declare-fun e!461873 () Bool)

(declare-fun contains!4164 (List!15791 (_ BitVec 64)) Bool)

(assert (=> b!828844 (= e!461873 (contains!4164 Nil!15788 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828845 () Bool)

(declare-fun e!461875 () Bool)

(assert (=> b!828845 (= e!461875 e!461874)))

(assert (=> b!828845 (= c!89821 (validKeyInArray!0 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828846 () Bool)

(declare-fun e!461876 () Bool)

(assert (=> b!828846 (= e!461876 e!461875)))

(declare-fun res!564601 () Bool)

(assert (=> b!828846 (=> (not res!564601) (not e!461875))))

(assert (=> b!828846 (= res!564601 (not e!461873))))

(declare-fun res!564599 () Bool)

(assert (=> b!828846 (=> (not res!564599) (not e!461873))))

(assert (=> b!828846 (= res!564599 (validKeyInArray!0 (select (arr!22253 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105461 () Bool)

(declare-fun res!564600 () Bool)

(assert (=> d!105461 (=> res!564600 e!461876)))

(assert (=> d!105461 (= res!564600 (bvsge #b00000000000000000000000000000000 (size!22673 _keys!976)))))

(assert (=> d!105461 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15788) e!461876)))

(assert (= (and d!105461 (not res!564600)) b!828846))

(assert (= (and b!828846 res!564599) b!828844))

(assert (= (and b!828846 res!564601) b!828845))

(assert (= (and b!828845 c!89821) b!828843))

(assert (= (and b!828845 (not c!89821)) b!828842))

(assert (= (or b!828843 b!828842) bm!35998))

(assert (=> bm!35998 m!772145))

(declare-fun m!772203 () Bool)

(assert (=> bm!35998 m!772203))

(assert (=> b!828844 m!772145))

(assert (=> b!828844 m!772145))

(declare-fun m!772205 () Bool)

(assert (=> b!828844 m!772205))

(assert (=> b!828845 m!772145))

(assert (=> b!828845 m!772145))

(assert (=> b!828845 m!772155))

(assert (=> b!828846 m!772145))

(assert (=> b!828846 m!772145))

(assert (=> b!828846 m!772155))

(assert (=> b!828727 d!105461))

(declare-fun mapIsEmpty!24328 () Bool)

(declare-fun mapRes!24328 () Bool)

(assert (=> mapIsEmpty!24328 mapRes!24328))

(declare-fun b!828854 () Bool)

(declare-fun e!461881 () Bool)

(assert (=> b!828854 (= e!461881 tp_is_empty!15127)))

(declare-fun b!828853 () Bool)

(declare-fun e!461882 () Bool)

(assert (=> b!828853 (= e!461882 tp_is_empty!15127)))

(declare-fun mapNonEmpty!24328 () Bool)

(declare-fun tp!47029 () Bool)

(assert (=> mapNonEmpty!24328 (= mapRes!24328 (and tp!47029 e!461882))))

(declare-fun mapValue!24328 () ValueCell!7148)

(declare-fun mapKey!24328 () (_ BitVec 32))

(declare-fun mapRest!24328 () (Array (_ BitVec 32) ValueCell!7148))

(assert (=> mapNonEmpty!24328 (= mapRest!24319 (store mapRest!24328 mapKey!24328 mapValue!24328))))

(declare-fun condMapEmpty!24328 () Bool)

(declare-fun mapDefault!24328 () ValueCell!7148)

(assert (=> mapNonEmpty!24319 (= condMapEmpty!24328 (= mapRest!24319 ((as const (Array (_ BitVec 32) ValueCell!7148)) mapDefault!24328)))))

(assert (=> mapNonEmpty!24319 (= tp!47014 (and e!461881 mapRes!24328))))

(assert (= (and mapNonEmpty!24319 condMapEmpty!24328) mapIsEmpty!24328))

(assert (= (and mapNonEmpty!24319 (not condMapEmpty!24328)) mapNonEmpty!24328))

(assert (= (and mapNonEmpty!24328 ((_ is ValueCellFull!7148) mapValue!24328)) b!828853))

(assert (= (and mapNonEmpty!24319 ((_ is ValueCellFull!7148) mapDefault!24328)) b!828854))

(declare-fun m!772207 () Bool)

(assert (=> mapNonEmpty!24328 m!772207))

(declare-fun b_lambda!11185 () Bool)

(assert (= b_lambda!11183 (or (and start!71436 b_free!13417) b_lambda!11185)))

(declare-fun b_lambda!11187 () Bool)

(assert (= b_lambda!11179 (or (and start!71436 b_free!13417) b_lambda!11187)))

(declare-fun b_lambda!11189 () Bool)

(assert (= b_lambda!11177 (or (and start!71436 b_free!13417) b_lambda!11189)))

(declare-fun b_lambda!11191 () Bool)

(assert (= b_lambda!11181 (or (and start!71436 b_free!13417) b_lambda!11191)))

(check-sat (not b!828814) (not b_lambda!11185) (not bm!35991) (not mapNonEmpty!24328) (not d!105457) (not b!828816) (not b!828831) (not b!828824) (not bm!35998) (not b!828825) (not b_next!13417) (not d!105459) (not b!828780) (not b!828820) (not b!828821) (not b!828830) (not b_lambda!11189) (not b!828845) (not b_lambda!11187) (not bm!35995) (not b!828829) (not b!828846) b_and!22377 (not b!828807) (not b_lambda!11191) (not b!828817) tp_is_empty!15127 (not b!828810) (not b!828844) (not b!828828) (not b!828815) (not b!828779) (not b!828806) (not bm!35994) (not b!828811))
(check-sat b_and!22377 (not b_next!13417))
