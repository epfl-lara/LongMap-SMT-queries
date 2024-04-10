; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110130 () Bool)

(assert start!110130)

(declare-fun b_free!29277 () Bool)

(declare-fun b_next!29277 () Bool)

(assert (=> start!110130 (= b_free!29277 (not b_next!29277))))

(declare-fun tp!102986 () Bool)

(declare-fun b_and!47451 () Bool)

(assert (=> start!110130 (= tp!102986 b_and!47451)))

(declare-fun b!1304039 () Bool)

(declare-fun res!866077 () Bool)

(declare-fun e!743821 () Bool)

(assert (=> b!1304039 (=> (not res!866077) (not e!743821))))

(declare-datatypes ((array!86846 0))(
  ( (array!86847 (arr!41913 (Array (_ BitVec 32) (_ BitVec 64))) (size!42463 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86846)

(declare-datatypes ((List!29751 0))(
  ( (Nil!29748) (Cons!29747 (h!30956 (_ BitVec 64)) (t!43347 List!29751)) )
))
(declare-fun arrayNoDuplicates!0 (array!86846 (_ BitVec 32) List!29751) Bool)

(assert (=> b!1304039 (= res!866077 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29748))))

(declare-fun b!1304040 () Bool)

(declare-fun res!866082 () Bool)

(assert (=> b!1304040 (=> (not res!866082) (not e!743821))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51659 0))(
  ( (V!51660 (val!17533 Int)) )
))
(declare-datatypes ((ValueCell!16560 0))(
  ( (ValueCellFull!16560 (v!20151 V!51659)) (EmptyCell!16560) )
))
(declare-datatypes ((array!86848 0))(
  ( (array!86849 (arr!41914 (Array (_ BitVec 32) ValueCell!16560)) (size!42464 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86848)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304040 (= res!866082 (and (= (size!42464 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42463 _keys!1741) (size!42464 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304041 () Bool)

(declare-fun e!743822 () Bool)

(declare-fun e!743820 () Bool)

(declare-fun mapRes!53972 () Bool)

(assert (=> b!1304041 (= e!743822 (and e!743820 mapRes!53972))))

(declare-fun condMapEmpty!53972 () Bool)

(declare-fun mapDefault!53972 () ValueCell!16560)

(assert (=> b!1304041 (= condMapEmpty!53972 (= (arr!41914 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16560)) mapDefault!53972)))))

(declare-fun b!1304042 () Bool)

(declare-fun res!866076 () Bool)

(assert (=> b!1304042 (=> (not res!866076) (not e!743821))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1304042 (= res!866076 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42463 _keys!1741))))))

(declare-fun b!1304043 () Bool)

(declare-fun res!866081 () Bool)

(assert (=> b!1304043 (=> (not res!866081) (not e!743821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86846 (_ BitVec 32)) Bool)

(assert (=> b!1304043 (= res!866081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304044 () Bool)

(declare-fun res!866080 () Bool)

(assert (=> b!1304044 (=> (not res!866080) (not e!743821))))

(declare-fun minValue!1387 () V!51659)

(declare-fun zeroValue!1387 () V!51659)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22628 0))(
  ( (tuple2!22629 (_1!11325 (_ BitVec 64)) (_2!11325 V!51659)) )
))
(declare-datatypes ((List!29752 0))(
  ( (Nil!29749) (Cons!29748 (h!30957 tuple2!22628) (t!43348 List!29752)) )
))
(declare-datatypes ((ListLongMap!20285 0))(
  ( (ListLongMap!20286 (toList!10158 List!29752)) )
))
(declare-fun contains!8296 (ListLongMap!20285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5178 (array!86846 array!86848 (_ BitVec 32) (_ BitVec 32) V!51659 V!51659 (_ BitVec 32) Int) ListLongMap!20285)

(assert (=> b!1304044 (= res!866080 (contains!8296 (getCurrentListMap!5178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1304045 () Bool)

(declare-fun res!866079 () Bool)

(assert (=> b!1304045 (=> (not res!866079) (not e!743821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304045 (= res!866079 (not (validKeyInArray!0 (select (arr!41913 _keys!1741) from!2144))))))

(declare-fun b!1304046 () Bool)

(declare-fun tp_is_empty!34917 () Bool)

(assert (=> b!1304046 (= e!743820 tp_is_empty!34917)))

(declare-fun b!1304047 () Bool)

(declare-fun e!743824 () Bool)

(assert (=> b!1304047 (= e!743824 tp_is_empty!34917)))

(declare-fun b!1304048 () Bool)

(declare-fun res!866078 () Bool)

(assert (=> b!1304048 (=> (not res!866078) (not e!743821))))

(assert (=> b!1304048 (= res!866078 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42463 _keys!1741))))))

(declare-fun mapNonEmpty!53972 () Bool)

(declare-fun tp!102985 () Bool)

(assert (=> mapNonEmpty!53972 (= mapRes!53972 (and tp!102985 e!743824))))

(declare-fun mapRest!53972 () (Array (_ BitVec 32) ValueCell!16560))

(declare-fun mapKey!53972 () (_ BitVec 32))

(declare-fun mapValue!53972 () ValueCell!16560)

(assert (=> mapNonEmpty!53972 (= (arr!41914 _values!1445) (store mapRest!53972 mapKey!53972 mapValue!53972))))

(declare-fun b!1304049 () Bool)

(declare-fun e!743825 () Bool)

(assert (=> b!1304049 (= e!743821 (not e!743825))))

(declare-fun res!866084 () Bool)

(assert (=> b!1304049 (=> res!866084 e!743825)))

(assert (=> b!1304049 (= res!866084 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1304049 (not (contains!8296 (ListLongMap!20286 Nil!29749) k0!1205))))

(declare-datatypes ((Unit!43180 0))(
  ( (Unit!43181) )
))
(declare-fun lt!583605 () Unit!43180)

(declare-fun emptyContainsNothing!221 ((_ BitVec 64)) Unit!43180)

(assert (=> b!1304049 (= lt!583605 (emptyContainsNothing!221 k0!1205))))

(declare-fun b!1304050 () Bool)

(assert (=> b!1304050 (= e!743825 false)))

(declare-fun lt!583604 () ListLongMap!20285)

(declare-fun +!4481 (ListLongMap!20285 tuple2!22628) ListLongMap!20285)

(assert (=> b!1304050 (not (contains!8296 (+!4481 lt!583604 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!583606 () Unit!43180)

(declare-fun addStillNotContains!478 (ListLongMap!20285 (_ BitVec 64) V!51659 (_ BitVec 64)) Unit!43180)

(assert (=> b!1304050 (= lt!583606 (addStillNotContains!478 lt!583604 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6116 (array!86846 array!86848 (_ BitVec 32) (_ BitVec 32) V!51659 V!51659 (_ BitVec 32) Int) ListLongMap!20285)

(assert (=> b!1304050 (= lt!583604 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!866083 () Bool)

(assert (=> start!110130 (=> (not res!866083) (not e!743821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110130 (= res!866083 (validMask!0 mask!2175))))

(assert (=> start!110130 e!743821))

(assert (=> start!110130 tp_is_empty!34917))

(assert (=> start!110130 true))

(declare-fun array_inv!31697 (array!86848) Bool)

(assert (=> start!110130 (and (array_inv!31697 _values!1445) e!743822)))

(declare-fun array_inv!31698 (array!86846) Bool)

(assert (=> start!110130 (array_inv!31698 _keys!1741)))

(assert (=> start!110130 tp!102986))

(declare-fun mapIsEmpty!53972 () Bool)

(assert (=> mapIsEmpty!53972 mapRes!53972))

(assert (= (and start!110130 res!866083) b!1304040))

(assert (= (and b!1304040 res!866082) b!1304043))

(assert (= (and b!1304043 res!866081) b!1304039))

(assert (= (and b!1304039 res!866077) b!1304048))

(assert (= (and b!1304048 res!866078) b!1304044))

(assert (= (and b!1304044 res!866080) b!1304042))

(assert (= (and b!1304042 res!866076) b!1304045))

(assert (= (and b!1304045 res!866079) b!1304049))

(assert (= (and b!1304049 (not res!866084)) b!1304050))

(assert (= (and b!1304041 condMapEmpty!53972) mapIsEmpty!53972))

(assert (= (and b!1304041 (not condMapEmpty!53972)) mapNonEmpty!53972))

(get-info :version)

(assert (= (and mapNonEmpty!53972 ((_ is ValueCellFull!16560) mapValue!53972)) b!1304047))

(assert (= (and b!1304041 ((_ is ValueCellFull!16560) mapDefault!53972)) b!1304046))

(assert (= start!110130 b!1304041))

(declare-fun m!1195061 () Bool)

(assert (=> b!1304045 m!1195061))

(assert (=> b!1304045 m!1195061))

(declare-fun m!1195063 () Bool)

(assert (=> b!1304045 m!1195063))

(declare-fun m!1195065 () Bool)

(assert (=> b!1304044 m!1195065))

(assert (=> b!1304044 m!1195065))

(declare-fun m!1195067 () Bool)

(assert (=> b!1304044 m!1195067))

(declare-fun m!1195069 () Bool)

(assert (=> b!1304049 m!1195069))

(declare-fun m!1195071 () Bool)

(assert (=> b!1304049 m!1195071))

(declare-fun m!1195073 () Bool)

(assert (=> b!1304043 m!1195073))

(declare-fun m!1195075 () Bool)

(assert (=> b!1304039 m!1195075))

(declare-fun m!1195077 () Bool)

(assert (=> mapNonEmpty!53972 m!1195077))

(declare-fun m!1195079 () Bool)

(assert (=> b!1304050 m!1195079))

(assert (=> b!1304050 m!1195079))

(declare-fun m!1195081 () Bool)

(assert (=> b!1304050 m!1195081))

(declare-fun m!1195083 () Bool)

(assert (=> b!1304050 m!1195083))

(declare-fun m!1195085 () Bool)

(assert (=> b!1304050 m!1195085))

(declare-fun m!1195087 () Bool)

(assert (=> start!110130 m!1195087))

(declare-fun m!1195089 () Bool)

(assert (=> start!110130 m!1195089))

(declare-fun m!1195091 () Bool)

(assert (=> start!110130 m!1195091))

(check-sat (not start!110130) tp_is_empty!34917 (not b!1304043) (not mapNonEmpty!53972) (not b_next!29277) (not b!1304045) (not b!1304039) b_and!47451 (not b!1304050) (not b!1304049) (not b!1304044))
(check-sat b_and!47451 (not b_next!29277))
(get-model)

(declare-fun d!141783 () Bool)

(assert (=> d!141783 (= (validKeyInArray!0 (select (arr!41913 _keys!1741) from!2144)) (and (not (= (select (arr!41913 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41913 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304045 d!141783))

(declare-fun d!141785 () Bool)

(declare-fun e!743848 () Bool)

(assert (=> d!141785 e!743848))

(declare-fun res!866114 () Bool)

(assert (=> d!141785 (=> res!866114 e!743848)))

(declare-fun lt!583625 () Bool)

(assert (=> d!141785 (= res!866114 (not lt!583625))))

(declare-fun lt!583627 () Bool)

(assert (=> d!141785 (= lt!583625 lt!583627)))

(declare-fun lt!583624 () Unit!43180)

(declare-fun e!743849 () Unit!43180)

(assert (=> d!141785 (= lt!583624 e!743849)))

(declare-fun c!125184 () Bool)

(assert (=> d!141785 (= c!125184 lt!583627)))

(declare-fun containsKey!728 (List!29752 (_ BitVec 64)) Bool)

(assert (=> d!141785 (= lt!583627 (containsKey!728 (toList!10158 (ListLongMap!20286 Nil!29749)) k0!1205))))

(assert (=> d!141785 (= (contains!8296 (ListLongMap!20286 Nil!29749) k0!1205) lt!583625)))

(declare-fun b!1304093 () Bool)

(declare-fun lt!583626 () Unit!43180)

(assert (=> b!1304093 (= e!743849 lt!583626)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!474 (List!29752 (_ BitVec 64)) Unit!43180)

(assert (=> b!1304093 (= lt!583626 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10158 (ListLongMap!20286 Nil!29749)) k0!1205))))

(declare-datatypes ((Option!758 0))(
  ( (Some!757 (v!20153 V!51659)) (None!756) )
))
(declare-fun isDefined!513 (Option!758) Bool)

(declare-fun getValueByKey!706 (List!29752 (_ BitVec 64)) Option!758)

(assert (=> b!1304093 (isDefined!513 (getValueByKey!706 (toList!10158 (ListLongMap!20286 Nil!29749)) k0!1205))))

(declare-fun b!1304094 () Bool)

(declare-fun Unit!43184 () Unit!43180)

(assert (=> b!1304094 (= e!743849 Unit!43184)))

(declare-fun b!1304095 () Bool)

(assert (=> b!1304095 (= e!743848 (isDefined!513 (getValueByKey!706 (toList!10158 (ListLongMap!20286 Nil!29749)) k0!1205)))))

(assert (= (and d!141785 c!125184) b!1304093))

(assert (= (and d!141785 (not c!125184)) b!1304094))

(assert (= (and d!141785 (not res!866114)) b!1304095))

(declare-fun m!1195125 () Bool)

(assert (=> d!141785 m!1195125))

(declare-fun m!1195127 () Bool)

(assert (=> b!1304093 m!1195127))

(declare-fun m!1195129 () Bool)

(assert (=> b!1304093 m!1195129))

(assert (=> b!1304093 m!1195129))

(declare-fun m!1195131 () Bool)

(assert (=> b!1304093 m!1195131))

(assert (=> b!1304095 m!1195129))

(assert (=> b!1304095 m!1195129))

(assert (=> b!1304095 m!1195131))

(assert (=> b!1304049 d!141785))

(declare-fun d!141787 () Bool)

(assert (=> d!141787 (not (contains!8296 (ListLongMap!20286 Nil!29749) k0!1205))))

(declare-fun lt!583630 () Unit!43180)

(declare-fun choose!1926 ((_ BitVec 64)) Unit!43180)

(assert (=> d!141787 (= lt!583630 (choose!1926 k0!1205))))

(assert (=> d!141787 (= (emptyContainsNothing!221 k0!1205) lt!583630)))

(declare-fun bs!37145 () Bool)

(assert (= bs!37145 d!141787))

(assert (=> bs!37145 m!1195069))

(declare-fun m!1195133 () Bool)

(assert (=> bs!37145 m!1195133))

(assert (=> b!1304049 d!141787))

(declare-fun d!141789 () Bool)

(declare-fun e!743850 () Bool)

(assert (=> d!141789 e!743850))

(declare-fun res!866115 () Bool)

(assert (=> d!141789 (=> res!866115 e!743850)))

(declare-fun lt!583632 () Bool)

(assert (=> d!141789 (= res!866115 (not lt!583632))))

(declare-fun lt!583634 () Bool)

(assert (=> d!141789 (= lt!583632 lt!583634)))

(declare-fun lt!583631 () Unit!43180)

(declare-fun e!743851 () Unit!43180)

(assert (=> d!141789 (= lt!583631 e!743851)))

(declare-fun c!125185 () Bool)

(assert (=> d!141789 (= c!125185 lt!583634)))

(assert (=> d!141789 (= lt!583634 (containsKey!728 (toList!10158 (+!4481 lt!583604 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141789 (= (contains!8296 (+!4481 lt!583604 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!583632)))

(declare-fun b!1304096 () Bool)

(declare-fun lt!583633 () Unit!43180)

(assert (=> b!1304096 (= e!743851 lt!583633)))

(assert (=> b!1304096 (= lt!583633 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10158 (+!4481 lt!583604 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1304096 (isDefined!513 (getValueByKey!706 (toList!10158 (+!4481 lt!583604 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1304097 () Bool)

(declare-fun Unit!43185 () Unit!43180)

(assert (=> b!1304097 (= e!743851 Unit!43185)))

(declare-fun b!1304098 () Bool)

(assert (=> b!1304098 (= e!743850 (isDefined!513 (getValueByKey!706 (toList!10158 (+!4481 lt!583604 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141789 c!125185) b!1304096))

(assert (= (and d!141789 (not c!125185)) b!1304097))

(assert (= (and d!141789 (not res!866115)) b!1304098))

(declare-fun m!1195135 () Bool)

(assert (=> d!141789 m!1195135))

(declare-fun m!1195137 () Bool)

(assert (=> b!1304096 m!1195137))

(declare-fun m!1195139 () Bool)

(assert (=> b!1304096 m!1195139))

(assert (=> b!1304096 m!1195139))

(declare-fun m!1195141 () Bool)

(assert (=> b!1304096 m!1195141))

(assert (=> b!1304098 m!1195139))

(assert (=> b!1304098 m!1195139))

(assert (=> b!1304098 m!1195141))

(assert (=> b!1304050 d!141789))

(declare-fun d!141791 () Bool)

(declare-fun e!743854 () Bool)

(assert (=> d!141791 e!743854))

(declare-fun res!866121 () Bool)

(assert (=> d!141791 (=> (not res!866121) (not e!743854))))

(declare-fun lt!583644 () ListLongMap!20285)

(assert (=> d!141791 (= res!866121 (contains!8296 lt!583644 (_1!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!583645 () List!29752)

(assert (=> d!141791 (= lt!583644 (ListLongMap!20286 lt!583645))))

(declare-fun lt!583643 () Unit!43180)

(declare-fun lt!583646 () Unit!43180)

(assert (=> d!141791 (= lt!583643 lt!583646)))

(assert (=> d!141791 (= (getValueByKey!706 lt!583645 (_1!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!757 (_2!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!352 (List!29752 (_ BitVec 64) V!51659) Unit!43180)

(assert (=> d!141791 (= lt!583646 (lemmaContainsTupThenGetReturnValue!352 lt!583645 (_1!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!481 (List!29752 (_ BitVec 64) V!51659) List!29752)

(assert (=> d!141791 (= lt!583645 (insertStrictlySorted!481 (toList!10158 lt!583604) (_1!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141791 (= (+!4481 lt!583604 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!583644)))

(declare-fun b!1304103 () Bool)

(declare-fun res!866120 () Bool)

(assert (=> b!1304103 (=> (not res!866120) (not e!743854))))

(assert (=> b!1304103 (= res!866120 (= (getValueByKey!706 (toList!10158 lt!583644) (_1!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!757 (_2!11325 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1304104 () Bool)

(declare-fun contains!8298 (List!29752 tuple2!22628) Bool)

(assert (=> b!1304104 (= e!743854 (contains!8298 (toList!10158 lt!583644) (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141791 res!866121) b!1304103))

(assert (= (and b!1304103 res!866120) b!1304104))

(declare-fun m!1195143 () Bool)

(assert (=> d!141791 m!1195143))

(declare-fun m!1195145 () Bool)

(assert (=> d!141791 m!1195145))

(declare-fun m!1195147 () Bool)

(assert (=> d!141791 m!1195147))

(declare-fun m!1195149 () Bool)

(assert (=> d!141791 m!1195149))

(declare-fun m!1195151 () Bool)

(assert (=> b!1304103 m!1195151))

(declare-fun m!1195153 () Bool)

(assert (=> b!1304104 m!1195153))

(assert (=> b!1304050 d!141791))

(declare-fun d!141793 () Bool)

(assert (=> d!141793 (not (contains!8296 (+!4481 lt!583604 (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!583649 () Unit!43180)

(declare-fun choose!1927 (ListLongMap!20285 (_ BitVec 64) V!51659 (_ BitVec 64)) Unit!43180)

(assert (=> d!141793 (= lt!583649 (choose!1927 lt!583604 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!743857 () Bool)

(assert (=> d!141793 e!743857))

(declare-fun res!866124 () Bool)

(assert (=> d!141793 (=> (not res!866124) (not e!743857))))

(assert (=> d!141793 (= res!866124 (not (contains!8296 lt!583604 k0!1205)))))

(assert (=> d!141793 (= (addStillNotContains!478 lt!583604 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!583649)))

(declare-fun b!1304108 () Bool)

(assert (=> b!1304108 (= e!743857 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141793 res!866124) b!1304108))

(assert (=> d!141793 m!1195079))

(assert (=> d!141793 m!1195079))

(assert (=> d!141793 m!1195081))

(declare-fun m!1195155 () Bool)

(assert (=> d!141793 m!1195155))

(declare-fun m!1195157 () Bool)

(assert (=> d!141793 m!1195157))

(assert (=> b!1304050 d!141793))

(declare-fun b!1304133 () Bool)

(assert (=> b!1304133 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42463 _keys!1741)))))

(assert (=> b!1304133 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42464 _values!1445)))))

(declare-fun e!743872 () Bool)

(declare-fun lt!583664 () ListLongMap!20285)

(declare-fun apply!1023 (ListLongMap!20285 (_ BitVec 64)) V!51659)

(declare-fun get!21172 (ValueCell!16560 V!51659) V!51659)

(declare-fun dynLambda!3430 (Int (_ BitVec 64)) V!51659)

(assert (=> b!1304133 (= e!743872 (= (apply!1023 lt!583664 (select (arr!41913 _keys!1741) from!2144)) (get!21172 (select (arr!41914 _values!1445) from!2144) (dynLambda!3430 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!141795 () Bool)

(declare-fun e!743878 () Bool)

(assert (=> d!141795 e!743878))

(declare-fun res!866133 () Bool)

(assert (=> d!141795 (=> (not res!866133) (not e!743878))))

(assert (=> d!141795 (= res!866133 (not (contains!8296 lt!583664 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!743873 () ListLongMap!20285)

(assert (=> d!141795 (= lt!583664 e!743873)))

(declare-fun c!125197 () Bool)

(assert (=> d!141795 (= c!125197 (bvsge from!2144 (size!42463 _keys!1741)))))

(assert (=> d!141795 (validMask!0 mask!2175)))

(assert (=> d!141795 (= (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583664)))

(declare-fun bm!64239 () Bool)

(declare-fun call!64242 () ListLongMap!20285)

(assert (=> bm!64239 (= call!64242 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1304134 () Bool)

(declare-fun e!743877 () Bool)

(assert (=> b!1304134 (= e!743877 (validKeyInArray!0 (select (arr!41913 _keys!1741) from!2144)))))

(assert (=> b!1304134 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1304135 () Bool)

(declare-fun e!743876 () Bool)

(assert (=> b!1304135 (= e!743878 e!743876)))

(declare-fun c!125195 () Bool)

(assert (=> b!1304135 (= c!125195 e!743877)))

(declare-fun res!866135 () Bool)

(assert (=> b!1304135 (=> (not res!866135) (not e!743877))))

(assert (=> b!1304135 (= res!866135 (bvslt from!2144 (size!42463 _keys!1741)))))

(declare-fun e!743874 () Bool)

(declare-fun b!1304136 () Bool)

(assert (=> b!1304136 (= e!743874 (= lt!583664 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304137 () Bool)

(assert (=> b!1304137 (= e!743873 (ListLongMap!20286 Nil!29749))))

(declare-fun b!1304138 () Bool)

(declare-fun lt!583666 () Unit!43180)

(declare-fun lt!583670 () Unit!43180)

(assert (=> b!1304138 (= lt!583666 lt!583670)))

(declare-fun lt!583668 () (_ BitVec 64))

(declare-fun lt!583665 () ListLongMap!20285)

(declare-fun lt!583667 () V!51659)

(declare-fun lt!583669 () (_ BitVec 64))

(assert (=> b!1304138 (not (contains!8296 (+!4481 lt!583665 (tuple2!22629 lt!583669 lt!583667)) lt!583668))))

(assert (=> b!1304138 (= lt!583670 (addStillNotContains!478 lt!583665 lt!583669 lt!583667 lt!583668))))

(assert (=> b!1304138 (= lt!583668 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1304138 (= lt!583667 (get!21172 (select (arr!41914 _values!1445) from!2144) (dynLambda!3430 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304138 (= lt!583669 (select (arr!41913 _keys!1741) from!2144))))

(assert (=> b!1304138 (= lt!583665 call!64242)))

(declare-fun e!743875 () ListLongMap!20285)

(assert (=> b!1304138 (= e!743875 (+!4481 call!64242 (tuple2!22629 (select (arr!41913 _keys!1741) from!2144) (get!21172 (select (arr!41914 _values!1445) from!2144) (dynLambda!3430 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1304139 () Bool)

(assert (=> b!1304139 (= e!743875 call!64242)))

(declare-fun b!1304140 () Bool)

(declare-fun isEmpty!1065 (ListLongMap!20285) Bool)

(assert (=> b!1304140 (= e!743874 (isEmpty!1065 lt!583664))))

(declare-fun b!1304141 () Bool)

(declare-fun res!866136 () Bool)

(assert (=> b!1304141 (=> (not res!866136) (not e!743878))))

(assert (=> b!1304141 (= res!866136 (not (contains!8296 lt!583664 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304142 () Bool)

(assert (=> b!1304142 (= e!743876 e!743874)))

(declare-fun c!125196 () Bool)

(assert (=> b!1304142 (= c!125196 (bvslt from!2144 (size!42463 _keys!1741)))))

(declare-fun b!1304143 () Bool)

(assert (=> b!1304143 (= e!743873 e!743875)))

(declare-fun c!125194 () Bool)

(assert (=> b!1304143 (= c!125194 (validKeyInArray!0 (select (arr!41913 _keys!1741) from!2144)))))

(declare-fun b!1304144 () Bool)

(assert (=> b!1304144 (= e!743876 e!743872)))

(assert (=> b!1304144 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42463 _keys!1741)))))

(declare-fun res!866134 () Bool)

(assert (=> b!1304144 (= res!866134 (contains!8296 lt!583664 (select (arr!41913 _keys!1741) from!2144)))))

(assert (=> b!1304144 (=> (not res!866134) (not e!743872))))

(assert (= (and d!141795 c!125197) b!1304137))

(assert (= (and d!141795 (not c!125197)) b!1304143))

(assert (= (and b!1304143 c!125194) b!1304138))

(assert (= (and b!1304143 (not c!125194)) b!1304139))

(assert (= (or b!1304138 b!1304139) bm!64239))

(assert (= (and d!141795 res!866133) b!1304141))

(assert (= (and b!1304141 res!866136) b!1304135))

(assert (= (and b!1304135 res!866135) b!1304134))

(assert (= (and b!1304135 c!125195) b!1304144))

(assert (= (and b!1304135 (not c!125195)) b!1304142))

(assert (= (and b!1304144 res!866134) b!1304133))

(assert (= (and b!1304142 c!125196) b!1304136))

(assert (= (and b!1304142 (not c!125196)) b!1304140))

(declare-fun b_lambda!23295 () Bool)

(assert (=> (not b_lambda!23295) (not b!1304133)))

(declare-fun t!43351 () Bool)

(declare-fun tb!11401 () Bool)

(assert (=> (and start!110130 (= defaultEntry!1448 defaultEntry!1448) t!43351) tb!11401))

(declare-fun result!23825 () Bool)

(assert (=> tb!11401 (= result!23825 tp_is_empty!34917)))

(assert (=> b!1304133 t!43351))

(declare-fun b_and!47455 () Bool)

(assert (= b_and!47451 (and (=> t!43351 result!23825) b_and!47455)))

(declare-fun b_lambda!23297 () Bool)

(assert (=> (not b_lambda!23297) (not b!1304138)))

(assert (=> b!1304138 t!43351))

(declare-fun b_and!47457 () Bool)

(assert (= b_and!47455 (and (=> t!43351 result!23825) b_and!47457)))

(assert (=> b!1304133 m!1195061))

(declare-fun m!1195159 () Bool)

(assert (=> b!1304133 m!1195159))

(declare-fun m!1195161 () Bool)

(assert (=> b!1304133 m!1195161))

(declare-fun m!1195163 () Bool)

(assert (=> b!1304133 m!1195163))

(assert (=> b!1304133 m!1195159))

(assert (=> b!1304133 m!1195161))

(assert (=> b!1304133 m!1195061))

(declare-fun m!1195165 () Bool)

(assert (=> b!1304133 m!1195165))

(assert (=> b!1304134 m!1195061))

(assert (=> b!1304134 m!1195061))

(assert (=> b!1304134 m!1195063))

(declare-fun m!1195167 () Bool)

(assert (=> b!1304140 m!1195167))

(declare-fun m!1195169 () Bool)

(assert (=> b!1304141 m!1195169))

(declare-fun m!1195171 () Bool)

(assert (=> d!141795 m!1195171))

(assert (=> d!141795 m!1195087))

(declare-fun m!1195173 () Bool)

(assert (=> b!1304136 m!1195173))

(assert (=> b!1304144 m!1195061))

(assert (=> b!1304144 m!1195061))

(declare-fun m!1195175 () Bool)

(assert (=> b!1304144 m!1195175))

(assert (=> b!1304138 m!1195159))

(assert (=> b!1304138 m!1195161))

(assert (=> b!1304138 m!1195163))

(assert (=> b!1304138 m!1195159))

(declare-fun m!1195177 () Bool)

(assert (=> b!1304138 m!1195177))

(assert (=> b!1304138 m!1195161))

(declare-fun m!1195179 () Bool)

(assert (=> b!1304138 m!1195179))

(declare-fun m!1195181 () Bool)

(assert (=> b!1304138 m!1195181))

(assert (=> b!1304138 m!1195181))

(declare-fun m!1195183 () Bool)

(assert (=> b!1304138 m!1195183))

(assert (=> b!1304138 m!1195061))

(assert (=> b!1304143 m!1195061))

(assert (=> b!1304143 m!1195061))

(assert (=> b!1304143 m!1195063))

(assert (=> bm!64239 m!1195173))

(assert (=> b!1304050 d!141795))

(declare-fun d!141797 () Bool)

(assert (=> d!141797 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110130 d!141797))

(declare-fun d!141799 () Bool)

(assert (=> d!141799 (= (array_inv!31697 _values!1445) (bvsge (size!42464 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110130 d!141799))

(declare-fun d!141801 () Bool)

(assert (=> d!141801 (= (array_inv!31698 _keys!1741) (bvsge (size!42463 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110130 d!141801))

(declare-fun b!1304157 () Bool)

(declare-fun e!743889 () Bool)

(declare-fun e!743887 () Bool)

(assert (=> b!1304157 (= e!743889 e!743887)))

(declare-fun c!125200 () Bool)

(assert (=> b!1304157 (= c!125200 (validKeyInArray!0 (select (arr!41913 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304158 () Bool)

(declare-fun e!743888 () Bool)

(assert (=> b!1304158 (= e!743888 e!743889)))

(declare-fun res!866144 () Bool)

(assert (=> b!1304158 (=> (not res!866144) (not e!743889))))

(declare-fun e!743890 () Bool)

(assert (=> b!1304158 (= res!866144 (not e!743890))))

(declare-fun res!866143 () Bool)

(assert (=> b!1304158 (=> (not res!866143) (not e!743890))))

(assert (=> b!1304158 (= res!866143 (validKeyInArray!0 (select (arr!41913 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304159 () Bool)

(declare-fun contains!8299 (List!29751 (_ BitVec 64)) Bool)

(assert (=> b!1304159 (= e!743890 (contains!8299 Nil!29748 (select (arr!41913 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141803 () Bool)

(declare-fun res!866145 () Bool)

(assert (=> d!141803 (=> res!866145 e!743888)))

(assert (=> d!141803 (= res!866145 (bvsge #b00000000000000000000000000000000 (size!42463 _keys!1741)))))

(assert (=> d!141803 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29748) e!743888)))

(declare-fun b!1304160 () Bool)

(declare-fun call!64245 () Bool)

(assert (=> b!1304160 (= e!743887 call!64245)))

(declare-fun b!1304161 () Bool)

(assert (=> b!1304161 (= e!743887 call!64245)))

(declare-fun bm!64242 () Bool)

(assert (=> bm!64242 (= call!64245 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125200 (Cons!29747 (select (arr!41913 _keys!1741) #b00000000000000000000000000000000) Nil!29748) Nil!29748)))))

(assert (= (and d!141803 (not res!866145)) b!1304158))

(assert (= (and b!1304158 res!866143) b!1304159))

(assert (= (and b!1304158 res!866144) b!1304157))

(assert (= (and b!1304157 c!125200) b!1304161))

(assert (= (and b!1304157 (not c!125200)) b!1304160))

(assert (= (or b!1304161 b!1304160) bm!64242))

(declare-fun m!1195185 () Bool)

(assert (=> b!1304157 m!1195185))

(assert (=> b!1304157 m!1195185))

(declare-fun m!1195187 () Bool)

(assert (=> b!1304157 m!1195187))

(assert (=> b!1304158 m!1195185))

(assert (=> b!1304158 m!1195185))

(assert (=> b!1304158 m!1195187))

(assert (=> b!1304159 m!1195185))

(assert (=> b!1304159 m!1195185))

(declare-fun m!1195189 () Bool)

(assert (=> b!1304159 m!1195189))

(assert (=> bm!64242 m!1195185))

(declare-fun m!1195191 () Bool)

(assert (=> bm!64242 m!1195191))

(assert (=> b!1304039 d!141803))

(declare-fun d!141805 () Bool)

(declare-fun e!743891 () Bool)

(assert (=> d!141805 e!743891))

(declare-fun res!866146 () Bool)

(assert (=> d!141805 (=> res!866146 e!743891)))

(declare-fun lt!583672 () Bool)

(assert (=> d!141805 (= res!866146 (not lt!583672))))

(declare-fun lt!583674 () Bool)

(assert (=> d!141805 (= lt!583672 lt!583674)))

(declare-fun lt!583671 () Unit!43180)

(declare-fun e!743892 () Unit!43180)

(assert (=> d!141805 (= lt!583671 e!743892)))

(declare-fun c!125201 () Bool)

(assert (=> d!141805 (= c!125201 lt!583674)))

(assert (=> d!141805 (= lt!583674 (containsKey!728 (toList!10158 (getCurrentListMap!5178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141805 (= (contains!8296 (getCurrentListMap!5178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583672)))

(declare-fun b!1304162 () Bool)

(declare-fun lt!583673 () Unit!43180)

(assert (=> b!1304162 (= e!743892 lt!583673)))

(assert (=> b!1304162 (= lt!583673 (lemmaContainsKeyImpliesGetValueByKeyDefined!474 (toList!10158 (getCurrentListMap!5178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304162 (isDefined!513 (getValueByKey!706 (toList!10158 (getCurrentListMap!5178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304163 () Bool)

(declare-fun Unit!43186 () Unit!43180)

(assert (=> b!1304163 (= e!743892 Unit!43186)))

(declare-fun b!1304164 () Bool)

(assert (=> b!1304164 (= e!743891 (isDefined!513 (getValueByKey!706 (toList!10158 (getCurrentListMap!5178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141805 c!125201) b!1304162))

(assert (= (and d!141805 (not c!125201)) b!1304163))

(assert (= (and d!141805 (not res!866146)) b!1304164))

(declare-fun m!1195193 () Bool)

(assert (=> d!141805 m!1195193))

(declare-fun m!1195195 () Bool)

(assert (=> b!1304162 m!1195195))

(declare-fun m!1195197 () Bool)

(assert (=> b!1304162 m!1195197))

(assert (=> b!1304162 m!1195197))

(declare-fun m!1195199 () Bool)

(assert (=> b!1304162 m!1195199))

(assert (=> b!1304164 m!1195197))

(assert (=> b!1304164 m!1195197))

(assert (=> b!1304164 m!1195199))

(assert (=> b!1304044 d!141805))

(declare-fun b!1304207 () Bool)

(declare-fun c!125217 () Bool)

(assert (=> b!1304207 (= c!125217 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!743923 () ListLongMap!20285)

(declare-fun e!743919 () ListLongMap!20285)

(assert (=> b!1304207 (= e!743923 e!743919)))

(declare-fun b!1304208 () Bool)

(declare-fun call!64266 () ListLongMap!20285)

(assert (=> b!1304208 (= e!743923 call!64266)))

(declare-fun bm!64257 () Bool)

(declare-fun call!64264 () ListLongMap!20285)

(declare-fun call!64261 () ListLongMap!20285)

(assert (=> bm!64257 (= call!64264 call!64261)))

(declare-fun b!1304209 () Bool)

(assert (=> b!1304209 (= e!743919 call!64266)))

(declare-fun b!1304210 () Bool)

(declare-fun e!743930 () Bool)

(declare-fun e!743929 () Bool)

(assert (=> b!1304210 (= e!743930 e!743929)))

(declare-fun res!866168 () Bool)

(assert (=> b!1304210 (=> (not res!866168) (not e!743929))))

(declare-fun lt!583736 () ListLongMap!20285)

(assert (=> b!1304210 (= res!866168 (contains!8296 lt!583736 (select (arr!41913 _keys!1741) from!2144)))))

(assert (=> b!1304210 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42463 _keys!1741)))))

(declare-fun b!1304211 () Bool)

(declare-fun call!64263 () ListLongMap!20285)

(assert (=> b!1304211 (= e!743919 call!64263)))

(declare-fun bm!64259 () Bool)

(declare-fun call!64265 () ListLongMap!20285)

(assert (=> bm!64259 (= call!64266 call!64265)))

(declare-fun b!1304212 () Bool)

(declare-fun e!743927 () Bool)

(assert (=> b!1304212 (= e!743927 (validKeyInArray!0 (select (arr!41913 _keys!1741) from!2144)))))

(declare-fun b!1304213 () Bool)

(declare-fun e!743926 () Bool)

(declare-fun e!743928 () Bool)

(assert (=> b!1304213 (= e!743926 e!743928)))

(declare-fun res!866166 () Bool)

(declare-fun call!64262 () Bool)

(assert (=> b!1304213 (= res!866166 call!64262)))

(assert (=> b!1304213 (=> (not res!866166) (not e!743928))))

(declare-fun c!125215 () Bool)

(declare-fun c!125216 () Bool)

(declare-fun bm!64260 () Bool)

(assert (=> bm!64260 (= call!64265 (+!4481 (ite c!125215 call!64261 (ite c!125216 call!64264 call!64263)) (ite (or c!125215 c!125216) (tuple2!22629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1304214 () Bool)

(declare-fun e!743922 () Unit!43180)

(declare-fun Unit!43187 () Unit!43180)

(assert (=> b!1304214 (= e!743922 Unit!43187)))

(declare-fun b!1304215 () Bool)

(declare-fun e!743920 () Bool)

(declare-fun e!743925 () Bool)

(assert (=> b!1304215 (= e!743920 e!743925)))

(declare-fun c!125214 () Bool)

(assert (=> b!1304215 (= c!125214 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64261 () Bool)

(assert (=> bm!64261 (= call!64261 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304216 () Bool)

(declare-fun e!743921 () Bool)

(assert (=> b!1304216 (= e!743921 (= (apply!1023 lt!583736 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1304217 () Bool)

(declare-fun e!743924 () Bool)

(assert (=> b!1304217 (= e!743924 (validKeyInArray!0 (select (arr!41913 _keys!1741) from!2144)))))

(declare-fun b!1304218 () Bool)

(declare-fun call!64260 () Bool)

(assert (=> b!1304218 (= e!743925 (not call!64260))))

(declare-fun b!1304219 () Bool)

(assert (=> b!1304219 (= e!743928 (= (apply!1023 lt!583736 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64262 () Bool)

(assert (=> bm!64262 (= call!64260 (contains!8296 lt!583736 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304220 () Bool)

(assert (=> b!1304220 (= e!743925 e!743921)))

(declare-fun res!866172 () Bool)

(assert (=> b!1304220 (= res!866172 call!64260)))

(assert (=> b!1304220 (=> (not res!866172) (not e!743921))))

(declare-fun b!1304221 () Bool)

(declare-fun res!866165 () Bool)

(assert (=> b!1304221 (=> (not res!866165) (not e!743920))))

(assert (=> b!1304221 (= res!866165 e!743930)))

(declare-fun res!866170 () Bool)

(assert (=> b!1304221 (=> res!866170 e!743930)))

(assert (=> b!1304221 (= res!866170 (not e!743924))))

(declare-fun res!866169 () Bool)

(assert (=> b!1304221 (=> (not res!866169) (not e!743924))))

(assert (=> b!1304221 (= res!866169 (bvslt from!2144 (size!42463 _keys!1741)))))

(declare-fun bm!64258 () Bool)

(assert (=> bm!64258 (= call!64262 (contains!8296 lt!583736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!141807 () Bool)

(assert (=> d!141807 e!743920))

(declare-fun res!866173 () Bool)

(assert (=> d!141807 (=> (not res!866173) (not e!743920))))

(assert (=> d!141807 (= res!866173 (or (bvsge from!2144 (size!42463 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42463 _keys!1741)))))))

(declare-fun lt!583720 () ListLongMap!20285)

(assert (=> d!141807 (= lt!583736 lt!583720)))

(declare-fun lt!583727 () Unit!43180)

(assert (=> d!141807 (= lt!583727 e!743922)))

(declare-fun c!125218 () Bool)

(assert (=> d!141807 (= c!125218 e!743927)))

(declare-fun res!866167 () Bool)

(assert (=> d!141807 (=> (not res!866167) (not e!743927))))

(assert (=> d!141807 (= res!866167 (bvslt from!2144 (size!42463 _keys!1741)))))

(declare-fun e!743931 () ListLongMap!20285)

(assert (=> d!141807 (= lt!583720 e!743931)))

(assert (=> d!141807 (= c!125215 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141807 (validMask!0 mask!2175)))

(assert (=> d!141807 (= (getCurrentListMap!5178 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583736)))

(declare-fun bm!64263 () Bool)

(assert (=> bm!64263 (= call!64263 call!64264)))

(declare-fun b!1304222 () Bool)

(declare-fun lt!583739 () Unit!43180)

(assert (=> b!1304222 (= e!743922 lt!583739)))

(declare-fun lt!583738 () ListLongMap!20285)

(assert (=> b!1304222 (= lt!583738 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583726 () (_ BitVec 64))

(assert (=> b!1304222 (= lt!583726 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583722 () (_ BitVec 64))

(assert (=> b!1304222 (= lt!583722 (select (arr!41913 _keys!1741) from!2144))))

(declare-fun lt!583724 () Unit!43180)

(declare-fun addStillContains!1111 (ListLongMap!20285 (_ BitVec 64) V!51659 (_ BitVec 64)) Unit!43180)

(assert (=> b!1304222 (= lt!583724 (addStillContains!1111 lt!583738 lt!583726 zeroValue!1387 lt!583722))))

(assert (=> b!1304222 (contains!8296 (+!4481 lt!583738 (tuple2!22629 lt!583726 zeroValue!1387)) lt!583722)))

(declare-fun lt!583737 () Unit!43180)

(assert (=> b!1304222 (= lt!583737 lt!583724)))

(declare-fun lt!583740 () ListLongMap!20285)

(assert (=> b!1304222 (= lt!583740 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583719 () (_ BitVec 64))

(assert (=> b!1304222 (= lt!583719 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583730 () (_ BitVec 64))

(assert (=> b!1304222 (= lt!583730 (select (arr!41913 _keys!1741) from!2144))))

(declare-fun lt!583735 () Unit!43180)

(declare-fun addApplyDifferent!565 (ListLongMap!20285 (_ BitVec 64) V!51659 (_ BitVec 64)) Unit!43180)

(assert (=> b!1304222 (= lt!583735 (addApplyDifferent!565 lt!583740 lt!583719 minValue!1387 lt!583730))))

(assert (=> b!1304222 (= (apply!1023 (+!4481 lt!583740 (tuple2!22629 lt!583719 minValue!1387)) lt!583730) (apply!1023 lt!583740 lt!583730))))

(declare-fun lt!583725 () Unit!43180)

(assert (=> b!1304222 (= lt!583725 lt!583735)))

(declare-fun lt!583723 () ListLongMap!20285)

(assert (=> b!1304222 (= lt!583723 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583731 () (_ BitVec 64))

(assert (=> b!1304222 (= lt!583731 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583734 () (_ BitVec 64))

(assert (=> b!1304222 (= lt!583734 (select (arr!41913 _keys!1741) from!2144))))

(declare-fun lt!583721 () Unit!43180)

(assert (=> b!1304222 (= lt!583721 (addApplyDifferent!565 lt!583723 lt!583731 zeroValue!1387 lt!583734))))

(assert (=> b!1304222 (= (apply!1023 (+!4481 lt!583723 (tuple2!22629 lt!583731 zeroValue!1387)) lt!583734) (apply!1023 lt!583723 lt!583734))))

(declare-fun lt!583729 () Unit!43180)

(assert (=> b!1304222 (= lt!583729 lt!583721)))

(declare-fun lt!583733 () ListLongMap!20285)

(assert (=> b!1304222 (= lt!583733 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583728 () (_ BitVec 64))

(assert (=> b!1304222 (= lt!583728 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583732 () (_ BitVec 64))

(assert (=> b!1304222 (= lt!583732 (select (arr!41913 _keys!1741) from!2144))))

(assert (=> b!1304222 (= lt!583739 (addApplyDifferent!565 lt!583733 lt!583728 minValue!1387 lt!583732))))

(assert (=> b!1304222 (= (apply!1023 (+!4481 lt!583733 (tuple2!22629 lt!583728 minValue!1387)) lt!583732) (apply!1023 lt!583733 lt!583732))))

(declare-fun b!1304223 () Bool)

(assert (=> b!1304223 (= e!743926 (not call!64262))))

(declare-fun b!1304224 () Bool)

(declare-fun res!866171 () Bool)

(assert (=> b!1304224 (=> (not res!866171) (not e!743920))))

(assert (=> b!1304224 (= res!866171 e!743926)))

(declare-fun c!125219 () Bool)

(assert (=> b!1304224 (= c!125219 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1304225 () Bool)

(assert (=> b!1304225 (= e!743929 (= (apply!1023 lt!583736 (select (arr!41913 _keys!1741) from!2144)) (get!21172 (select (arr!41914 _values!1445) from!2144) (dynLambda!3430 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304225 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42464 _values!1445)))))

(assert (=> b!1304225 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42463 _keys!1741)))))

(declare-fun b!1304226 () Bool)

(assert (=> b!1304226 (= e!743931 e!743923)))

(assert (=> b!1304226 (= c!125216 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1304227 () Bool)

(assert (=> b!1304227 (= e!743931 (+!4481 call!64265 (tuple2!22629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141807 c!125215) b!1304227))

(assert (= (and d!141807 (not c!125215)) b!1304226))

(assert (= (and b!1304226 c!125216) b!1304208))

(assert (= (and b!1304226 (not c!125216)) b!1304207))

(assert (= (and b!1304207 c!125217) b!1304209))

(assert (= (and b!1304207 (not c!125217)) b!1304211))

(assert (= (or b!1304209 b!1304211) bm!64263))

(assert (= (or b!1304208 bm!64263) bm!64257))

(assert (= (or b!1304208 b!1304209) bm!64259))

(assert (= (or b!1304227 bm!64257) bm!64261))

(assert (= (or b!1304227 bm!64259) bm!64260))

(assert (= (and d!141807 res!866167) b!1304212))

(assert (= (and d!141807 c!125218) b!1304222))

(assert (= (and d!141807 (not c!125218)) b!1304214))

(assert (= (and d!141807 res!866173) b!1304221))

(assert (= (and b!1304221 res!866169) b!1304217))

(assert (= (and b!1304221 (not res!866170)) b!1304210))

(assert (= (and b!1304210 res!866168) b!1304225))

(assert (= (and b!1304221 res!866165) b!1304224))

(assert (= (and b!1304224 c!125219) b!1304213))

(assert (= (and b!1304224 (not c!125219)) b!1304223))

(assert (= (and b!1304213 res!866166) b!1304219))

(assert (= (or b!1304213 b!1304223) bm!64258))

(assert (= (and b!1304224 res!866171) b!1304215))

(assert (= (and b!1304215 c!125214) b!1304220))

(assert (= (and b!1304215 (not c!125214)) b!1304218))

(assert (= (and b!1304220 res!866172) b!1304216))

(assert (= (or b!1304220 b!1304218) bm!64262))

(declare-fun b_lambda!23299 () Bool)

(assert (=> (not b_lambda!23299) (not b!1304225)))

(assert (=> b!1304225 t!43351))

(declare-fun b_and!47459 () Bool)

(assert (= b_and!47457 (and (=> t!43351 result!23825) b_and!47459)))

(declare-fun m!1195201 () Bool)

(assert (=> b!1304216 m!1195201))

(assert (=> d!141807 m!1195087))

(declare-fun m!1195203 () Bool)

(assert (=> b!1304219 m!1195203))

(assert (=> b!1304210 m!1195061))

(assert (=> b!1304210 m!1195061))

(declare-fun m!1195205 () Bool)

(assert (=> b!1304210 m!1195205))

(assert (=> bm!64261 m!1195085))

(declare-fun m!1195207 () Bool)

(assert (=> bm!64258 m!1195207))

(declare-fun m!1195209 () Bool)

(assert (=> bm!64262 m!1195209))

(declare-fun m!1195211 () Bool)

(assert (=> b!1304227 m!1195211))

(assert (=> b!1304217 m!1195061))

(assert (=> b!1304217 m!1195061))

(assert (=> b!1304217 m!1195063))

(declare-fun m!1195213 () Bool)

(assert (=> bm!64260 m!1195213))

(declare-fun m!1195215 () Bool)

(assert (=> b!1304222 m!1195215))

(declare-fun m!1195217 () Bool)

(assert (=> b!1304222 m!1195217))

(declare-fun m!1195219 () Bool)

(assert (=> b!1304222 m!1195219))

(declare-fun m!1195221 () Bool)

(assert (=> b!1304222 m!1195221))

(declare-fun m!1195223 () Bool)

(assert (=> b!1304222 m!1195223))

(declare-fun m!1195225 () Bool)

(assert (=> b!1304222 m!1195225))

(declare-fun m!1195227 () Bool)

(assert (=> b!1304222 m!1195227))

(assert (=> b!1304222 m!1195085))

(declare-fun m!1195229 () Bool)

(assert (=> b!1304222 m!1195229))

(assert (=> b!1304222 m!1195215))

(assert (=> b!1304222 m!1195225))

(declare-fun m!1195231 () Bool)

(assert (=> b!1304222 m!1195231))

(declare-fun m!1195233 () Bool)

(assert (=> b!1304222 m!1195233))

(assert (=> b!1304222 m!1195219))

(declare-fun m!1195235 () Bool)

(assert (=> b!1304222 m!1195235))

(assert (=> b!1304222 m!1195061))

(declare-fun m!1195237 () Bool)

(assert (=> b!1304222 m!1195237))

(assert (=> b!1304222 m!1195221))

(declare-fun m!1195239 () Bool)

(assert (=> b!1304222 m!1195239))

(declare-fun m!1195241 () Bool)

(assert (=> b!1304222 m!1195241))

(declare-fun m!1195243 () Bool)

(assert (=> b!1304222 m!1195243))

(assert (=> b!1304225 m!1195161))

(assert (=> b!1304225 m!1195159))

(assert (=> b!1304225 m!1195161))

(assert (=> b!1304225 m!1195163))

(assert (=> b!1304225 m!1195061))

(assert (=> b!1304225 m!1195159))

(assert (=> b!1304225 m!1195061))

(declare-fun m!1195245 () Bool)

(assert (=> b!1304225 m!1195245))

(assert (=> b!1304212 m!1195061))

(assert (=> b!1304212 m!1195061))

(assert (=> b!1304212 m!1195063))

(assert (=> b!1304044 d!141807))

(declare-fun b!1304236 () Bool)

(declare-fun e!743939 () Bool)

(declare-fun e!743938 () Bool)

(assert (=> b!1304236 (= e!743939 e!743938)))

(declare-fun lt!583749 () (_ BitVec 64))

(assert (=> b!1304236 (= lt!583749 (select (arr!41913 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583747 () Unit!43180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86846 (_ BitVec 64) (_ BitVec 32)) Unit!43180)

(assert (=> b!1304236 (= lt!583747 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583749 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1304236 (arrayContainsKey!0 _keys!1741 lt!583749 #b00000000000000000000000000000000)))

(declare-fun lt!583748 () Unit!43180)

(assert (=> b!1304236 (= lt!583748 lt!583747)))

(declare-fun res!866178 () Bool)

(declare-datatypes ((SeekEntryResult!10026 0))(
  ( (MissingZero!10026 (index!42475 (_ BitVec 32))) (Found!10026 (index!42476 (_ BitVec 32))) (Intermediate!10026 (undefined!10838 Bool) (index!42477 (_ BitVec 32)) (x!115825 (_ BitVec 32))) (Undefined!10026) (MissingVacant!10026 (index!42478 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86846 (_ BitVec 32)) SeekEntryResult!10026)

(assert (=> b!1304236 (= res!866178 (= (seekEntryOrOpen!0 (select (arr!41913 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10026 #b00000000000000000000000000000000)))))

(assert (=> b!1304236 (=> (not res!866178) (not e!743938))))

(declare-fun b!1304237 () Bool)

(declare-fun call!64269 () Bool)

(assert (=> b!1304237 (= e!743939 call!64269)))

(declare-fun b!1304238 () Bool)

(declare-fun e!743940 () Bool)

(assert (=> b!1304238 (= e!743940 e!743939)))

(declare-fun c!125222 () Bool)

(assert (=> b!1304238 (= c!125222 (validKeyInArray!0 (select (arr!41913 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64266 () Bool)

(assert (=> bm!64266 (= call!64269 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1304239 () Bool)

(assert (=> b!1304239 (= e!743938 call!64269)))

(declare-fun d!141809 () Bool)

(declare-fun res!866179 () Bool)

(assert (=> d!141809 (=> res!866179 e!743940)))

(assert (=> d!141809 (= res!866179 (bvsge #b00000000000000000000000000000000 (size!42463 _keys!1741)))))

(assert (=> d!141809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743940)))

(assert (= (and d!141809 (not res!866179)) b!1304238))

(assert (= (and b!1304238 c!125222) b!1304236))

(assert (= (and b!1304238 (not c!125222)) b!1304237))

(assert (= (and b!1304236 res!866178) b!1304239))

(assert (= (or b!1304239 b!1304237) bm!64266))

(assert (=> b!1304236 m!1195185))

(declare-fun m!1195247 () Bool)

(assert (=> b!1304236 m!1195247))

(declare-fun m!1195249 () Bool)

(assert (=> b!1304236 m!1195249))

(assert (=> b!1304236 m!1195185))

(declare-fun m!1195251 () Bool)

(assert (=> b!1304236 m!1195251))

(assert (=> b!1304238 m!1195185))

(assert (=> b!1304238 m!1195185))

(assert (=> b!1304238 m!1195187))

(declare-fun m!1195253 () Bool)

(assert (=> bm!64266 m!1195253))

(assert (=> b!1304043 d!141809))

(declare-fun b!1304247 () Bool)

(declare-fun e!743946 () Bool)

(assert (=> b!1304247 (= e!743946 tp_is_empty!34917)))

(declare-fun mapIsEmpty!53978 () Bool)

(declare-fun mapRes!53978 () Bool)

(assert (=> mapIsEmpty!53978 mapRes!53978))

(declare-fun b!1304246 () Bool)

(declare-fun e!743945 () Bool)

(assert (=> b!1304246 (= e!743945 tp_is_empty!34917)))

(declare-fun condMapEmpty!53978 () Bool)

(declare-fun mapDefault!53978 () ValueCell!16560)

(assert (=> mapNonEmpty!53972 (= condMapEmpty!53978 (= mapRest!53972 ((as const (Array (_ BitVec 32) ValueCell!16560)) mapDefault!53978)))))

(assert (=> mapNonEmpty!53972 (= tp!102985 (and e!743946 mapRes!53978))))

(declare-fun mapNonEmpty!53978 () Bool)

(declare-fun tp!102995 () Bool)

(assert (=> mapNonEmpty!53978 (= mapRes!53978 (and tp!102995 e!743945))))

(declare-fun mapValue!53978 () ValueCell!16560)

(declare-fun mapRest!53978 () (Array (_ BitVec 32) ValueCell!16560))

(declare-fun mapKey!53978 () (_ BitVec 32))

(assert (=> mapNonEmpty!53978 (= mapRest!53972 (store mapRest!53978 mapKey!53978 mapValue!53978))))

(assert (= (and mapNonEmpty!53972 condMapEmpty!53978) mapIsEmpty!53978))

(assert (= (and mapNonEmpty!53972 (not condMapEmpty!53978)) mapNonEmpty!53978))

(assert (= (and mapNonEmpty!53978 ((_ is ValueCellFull!16560) mapValue!53978)) b!1304246))

(assert (= (and mapNonEmpty!53972 ((_ is ValueCellFull!16560) mapDefault!53978)) b!1304247))

(declare-fun m!1195255 () Bool)

(assert (=> mapNonEmpty!53978 m!1195255))

(declare-fun b_lambda!23301 () Bool)

(assert (= b_lambda!23299 (or (and start!110130 b_free!29277) b_lambda!23301)))

(declare-fun b_lambda!23303 () Bool)

(assert (= b_lambda!23297 (or (and start!110130 b_free!29277) b_lambda!23303)))

(declare-fun b_lambda!23305 () Bool)

(assert (= b_lambda!23295 (or (and start!110130 b_free!29277) b_lambda!23305)))

(check-sat (not b!1304225) (not b_lambda!23303) (not d!141807) (not bm!64266) (not b_lambda!23301) (not d!141793) (not bm!64261) (not bm!64258) (not b!1304133) (not b_lambda!23305) (not b!1304162) (not b!1304238) (not b!1304158) (not b!1304104) (not mapNonEmpty!53978) (not b!1304210) tp_is_empty!34917 (not b!1304143) (not b!1304134) (not b!1304216) (not b!1304095) (not d!141795) (not b_next!29277) b_and!47459 (not b!1304138) (not b!1304157) (not b!1304217) (not d!141791) (not b!1304136) (not b!1304212) (not b!1304098) (not b!1304096) (not b!1304140) (not b!1304227) (not b!1304159) (not bm!64242) (not b!1304222) (not b!1304141) (not bm!64239) (not d!141787) (not d!141805) (not d!141789) (not b!1304164) (not b!1304103) (not b!1304093) (not d!141785) (not bm!64260) (not b!1304236) (not bm!64262) (not b!1304219) (not b!1304144))
(check-sat b_and!47459 (not b_next!29277))
