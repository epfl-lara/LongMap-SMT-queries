; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110388 () Bool)

(assert start!110388)

(declare-fun b_free!29287 () Bool)

(declare-fun b_next!29287 () Bool)

(assert (=> start!110388 (= b_free!29287 (not b_next!29287))))

(declare-fun tp!103019 () Bool)

(declare-fun b_and!47469 () Bool)

(assert (=> start!110388 (= tp!103019 b_and!47469)))

(declare-fun b!1305681 () Bool)

(declare-fun res!866802 () Bool)

(declare-fun e!744858 () Bool)

(assert (=> b!1305681 (=> (not res!866802) (not e!744858))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51673 0))(
  ( (V!51674 (val!17538 Int)) )
))
(declare-datatypes ((ValueCell!16565 0))(
  ( (ValueCellFull!16565 (v!20152 V!51673)) (EmptyCell!16565) )
))
(declare-datatypes ((array!86911 0))(
  ( (array!86912 (arr!41940 (Array (_ BitVec 32) ValueCell!16565)) (size!42491 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86911)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86913 0))(
  ( (array!86914 (arr!41941 (Array (_ BitVec 32) (_ BitVec 64))) (size!42492 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86913)

(assert (=> b!1305681 (= res!866802 (and (= (size!42491 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42492 _keys!1741) (size!42491 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1305682 () Bool)

(declare-fun res!866805 () Bool)

(assert (=> b!1305682 (=> (not res!866805) (not e!744858))))

(declare-datatypes ((List!29807 0))(
  ( (Nil!29804) (Cons!29803 (h!31021 (_ BitVec 64)) (t!43397 List!29807)) )
))
(declare-fun arrayNoDuplicates!0 (array!86913 (_ BitVec 32) List!29807) Bool)

(assert (=> b!1305682 (= res!866805 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29804))))

(declare-fun b!1305683 () Bool)

(declare-fun res!866800 () Bool)

(assert (=> b!1305683 (=> (not res!866800) (not e!744858))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1305683 (= res!866800 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741))))))

(declare-fun b!1305684 () Bool)

(declare-fun res!866807 () Bool)

(assert (=> b!1305684 (=> (not res!866807) (not e!744858))))

(declare-fun minValue!1387 () V!51673)

(declare-fun zeroValue!1387 () V!51673)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22662 0))(
  ( (tuple2!22663 (_1!11342 (_ BitVec 64)) (_2!11342 V!51673)) )
))
(declare-datatypes ((List!29808 0))(
  ( (Nil!29805) (Cons!29804 (h!31022 tuple2!22662) (t!43398 List!29808)) )
))
(declare-datatypes ((ListLongMap!20327 0))(
  ( (ListLongMap!20328 (toList!10179 List!29808)) )
))
(declare-fun contains!8331 (ListLongMap!20327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5188 (array!86913 array!86911 (_ BitVec 32) (_ BitVec 32) V!51673 V!51673 (_ BitVec 32) Int) ListLongMap!20327)

(assert (=> b!1305684 (= res!866807 (contains!8331 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1305685 () Bool)

(declare-fun e!744861 () Bool)

(declare-fun tp_is_empty!34927 () Bool)

(assert (=> b!1305685 (= e!744861 tp_is_empty!34927)))

(declare-fun b!1305686 () Bool)

(declare-fun res!866799 () Bool)

(assert (=> b!1305686 (=> (not res!866799) (not e!744858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305686 (= res!866799 (not (validKeyInArray!0 (select (arr!41941 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53990 () Bool)

(declare-fun mapRes!53990 () Bool)

(declare-fun tp!103018 () Bool)

(assert (=> mapNonEmpty!53990 (= mapRes!53990 (and tp!103018 e!744861))))

(declare-fun mapRest!53990 () (Array (_ BitVec 32) ValueCell!16565))

(declare-fun mapKey!53990 () (_ BitVec 32))

(declare-fun mapValue!53990 () ValueCell!16565)

(assert (=> mapNonEmpty!53990 (= (arr!41940 _values!1445) (store mapRest!53990 mapKey!53990 mapValue!53990))))

(declare-fun b!1305687 () Bool)

(declare-fun res!866804 () Bool)

(assert (=> b!1305687 (=> (not res!866804) (not e!744858))))

(assert (=> b!1305687 (= res!866804 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42492 _keys!1741))))))

(declare-fun b!1305688 () Bool)

(declare-fun e!744863 () Bool)

(assert (=> b!1305688 (= e!744863 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1305689 () Bool)

(declare-fun e!744862 () Bool)

(assert (=> b!1305689 (= e!744862 tp_is_empty!34927)))

(declare-fun b!1305690 () Bool)

(declare-fun e!744860 () Bool)

(assert (=> b!1305690 (= e!744860 e!744863)))

(declare-fun res!866808 () Bool)

(assert (=> b!1305690 (=> (not res!866808) (not e!744863))))

(declare-fun getCurrentListMapNoExtraKeys!6173 (array!86913 array!86911 (_ BitVec 32) (_ BitVec 32) V!51673 V!51673 (_ BitVec 32) Int) ListLongMap!20327)

(assert (=> b!1305690 (= res!866808 (not (contains!8331 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1305691 () Bool)

(declare-fun res!866801 () Bool)

(assert (=> b!1305691 (=> (not res!866801) (not e!744858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86913 (_ BitVec 32)) Bool)

(assert (=> b!1305691 (= res!866801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53990 () Bool)

(assert (=> mapIsEmpty!53990 mapRes!53990))

(declare-fun res!866803 () Bool)

(assert (=> start!110388 (=> (not res!866803) (not e!744858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110388 (= res!866803 (validMask!0 mask!2175))))

(assert (=> start!110388 e!744858))

(assert (=> start!110388 tp_is_empty!34927))

(assert (=> start!110388 true))

(declare-fun e!744859 () Bool)

(declare-fun array_inv!31967 (array!86911) Bool)

(assert (=> start!110388 (and (array_inv!31967 _values!1445) e!744859)))

(declare-fun array_inv!31968 (array!86913) Bool)

(assert (=> start!110388 (array_inv!31968 _keys!1741)))

(assert (=> start!110388 tp!103019))

(declare-fun b!1305692 () Bool)

(assert (=> b!1305692 (= e!744859 (and e!744862 mapRes!53990))))

(declare-fun condMapEmpty!53990 () Bool)

(declare-fun mapDefault!53990 () ValueCell!16565)

(assert (=> b!1305692 (= condMapEmpty!53990 (= (arr!41940 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16565)) mapDefault!53990)))))

(declare-fun b!1305693 () Bool)

(assert (=> b!1305693 (= e!744858 (not e!744860))))

(declare-fun res!866806 () Bool)

(assert (=> b!1305693 (=> res!866806 e!744860)))

(assert (=> b!1305693 (= res!866806 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1305693 (not (contains!8331 (ListLongMap!20328 Nil!29805) k0!1205))))

(declare-datatypes ((Unit!43164 0))(
  ( (Unit!43165) )
))
(declare-fun lt!584255 () Unit!43164)

(declare-fun emptyContainsNothing!228 ((_ BitVec 64)) Unit!43164)

(assert (=> b!1305693 (= lt!584255 (emptyContainsNothing!228 k0!1205))))

(assert (= (and start!110388 res!866803) b!1305681))

(assert (= (and b!1305681 res!866802) b!1305691))

(assert (= (and b!1305691 res!866801) b!1305682))

(assert (= (and b!1305682 res!866805) b!1305683))

(assert (= (and b!1305683 res!866800) b!1305684))

(assert (= (and b!1305684 res!866807) b!1305687))

(assert (= (and b!1305687 res!866804) b!1305686))

(assert (= (and b!1305686 res!866799) b!1305693))

(assert (= (and b!1305693 (not res!866806)) b!1305690))

(assert (= (and b!1305690 res!866808) b!1305688))

(assert (= (and b!1305692 condMapEmpty!53990) mapIsEmpty!53990))

(assert (= (and b!1305692 (not condMapEmpty!53990)) mapNonEmpty!53990))

(get-info :version)

(assert (= (and mapNonEmpty!53990 ((_ is ValueCellFull!16565) mapValue!53990)) b!1305685))

(assert (= (and b!1305692 ((_ is ValueCellFull!16565) mapDefault!53990)) b!1305689))

(assert (= start!110388 b!1305692))

(declare-fun m!1196951 () Bool)

(assert (=> b!1305682 m!1196951))

(declare-fun m!1196953 () Bool)

(assert (=> mapNonEmpty!53990 m!1196953))

(declare-fun m!1196955 () Bool)

(assert (=> b!1305686 m!1196955))

(assert (=> b!1305686 m!1196955))

(declare-fun m!1196957 () Bool)

(assert (=> b!1305686 m!1196957))

(declare-fun m!1196959 () Bool)

(assert (=> start!110388 m!1196959))

(declare-fun m!1196961 () Bool)

(assert (=> start!110388 m!1196961))

(declare-fun m!1196963 () Bool)

(assert (=> start!110388 m!1196963))

(declare-fun m!1196965 () Bool)

(assert (=> b!1305684 m!1196965))

(assert (=> b!1305684 m!1196965))

(declare-fun m!1196967 () Bool)

(assert (=> b!1305684 m!1196967))

(declare-fun m!1196969 () Bool)

(assert (=> b!1305690 m!1196969))

(assert (=> b!1305690 m!1196969))

(declare-fun m!1196971 () Bool)

(assert (=> b!1305690 m!1196971))

(declare-fun m!1196973 () Bool)

(assert (=> b!1305693 m!1196973))

(declare-fun m!1196975 () Bool)

(assert (=> b!1305693 m!1196975))

(declare-fun m!1196977 () Bool)

(assert (=> b!1305691 m!1196977))

(check-sat (not b!1305693) (not b!1305682) (not b!1305684) (not start!110388) (not b_next!29287) (not b!1305691) (not mapNonEmpty!53990) b_and!47469 (not b!1305686) (not b!1305690) tp_is_empty!34927)
(check-sat b_and!47469 (not b_next!29287))
(get-model)

(declare-fun b!1305780 () Bool)

(declare-fun e!744913 () Bool)

(declare-fun e!744915 () Bool)

(assert (=> b!1305780 (= e!744913 e!744915)))

(declare-fun c!125623 () Bool)

(assert (=> b!1305780 (= c!125623 (validKeyInArray!0 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64334 () Bool)

(declare-fun call!64337 () Bool)

(assert (=> bm!64334 (= call!64337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305782 () Bool)

(declare-fun e!744914 () Bool)

(assert (=> b!1305782 (= e!744914 call!64337)))

(declare-fun b!1305783 () Bool)

(assert (=> b!1305783 (= e!744915 call!64337)))

(declare-fun b!1305781 () Bool)

(assert (=> b!1305781 (= e!744915 e!744914)))

(declare-fun lt!584268 () (_ BitVec 64))

(assert (=> b!1305781 (= lt!584268 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584270 () Unit!43164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86913 (_ BitVec 64) (_ BitVec 32)) Unit!43164)

(assert (=> b!1305781 (= lt!584270 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584268 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1305781 (arrayContainsKey!0 _keys!1741 lt!584268 #b00000000000000000000000000000000)))

(declare-fun lt!584269 () Unit!43164)

(assert (=> b!1305781 (= lt!584269 lt!584270)))

(declare-fun res!866873 () Bool)

(declare-datatypes ((SeekEntryResult!9983 0))(
  ( (MissingZero!9983 (index!42303 (_ BitVec 32))) (Found!9983 (index!42304 (_ BitVec 32))) (Intermediate!9983 (undefined!10795 Bool) (index!42305 (_ BitVec 32)) (x!115839 (_ BitVec 32))) (Undefined!9983) (MissingVacant!9983 (index!42306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86913 (_ BitVec 32)) SeekEntryResult!9983)

(assert (=> b!1305781 (= res!866873 (= (seekEntryOrOpen!0 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9983 #b00000000000000000000000000000000)))))

(assert (=> b!1305781 (=> (not res!866873) (not e!744914))))

(declare-fun d!142259 () Bool)

(declare-fun res!866874 () Bool)

(assert (=> d!142259 (=> res!866874 e!744913)))

(assert (=> d!142259 (= res!866874 (bvsge #b00000000000000000000000000000000 (size!42492 _keys!1741)))))

(assert (=> d!142259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744913)))

(assert (= (and d!142259 (not res!866874)) b!1305780))

(assert (= (and b!1305780 c!125623) b!1305781))

(assert (= (and b!1305780 (not c!125623)) b!1305783))

(assert (= (and b!1305781 res!866873) b!1305782))

(assert (= (or b!1305782 b!1305783) bm!64334))

(declare-fun m!1197035 () Bool)

(assert (=> b!1305780 m!1197035))

(assert (=> b!1305780 m!1197035))

(declare-fun m!1197037 () Bool)

(assert (=> b!1305780 m!1197037))

(declare-fun m!1197039 () Bool)

(assert (=> bm!64334 m!1197039))

(assert (=> b!1305781 m!1197035))

(declare-fun m!1197041 () Bool)

(assert (=> b!1305781 m!1197041))

(declare-fun m!1197043 () Bool)

(assert (=> b!1305781 m!1197043))

(assert (=> b!1305781 m!1197035))

(declare-fun m!1197045 () Bool)

(assert (=> b!1305781 m!1197045))

(assert (=> b!1305691 d!142259))

(declare-fun b!1305794 () Bool)

(declare-fun e!744925 () Bool)

(declare-fun e!744926 () Bool)

(assert (=> b!1305794 (= e!744925 e!744926)))

(declare-fun c!125626 () Bool)

(assert (=> b!1305794 (= c!125626 (validKeyInArray!0 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305795 () Bool)

(declare-fun call!64340 () Bool)

(assert (=> b!1305795 (= e!744926 call!64340)))

(declare-fun b!1305796 () Bool)

(declare-fun e!744924 () Bool)

(declare-fun contains!8334 (List!29807 (_ BitVec 64)) Bool)

(assert (=> b!1305796 (= e!744924 (contains!8334 Nil!29804 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64337 () Bool)

(assert (=> bm!64337 (= call!64340 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125626 (Cons!29803 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) Nil!29804) Nil!29804)))))

(declare-fun d!142261 () Bool)

(declare-fun res!866881 () Bool)

(declare-fun e!744927 () Bool)

(assert (=> d!142261 (=> res!866881 e!744927)))

(assert (=> d!142261 (= res!866881 (bvsge #b00000000000000000000000000000000 (size!42492 _keys!1741)))))

(assert (=> d!142261 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29804) e!744927)))

(declare-fun b!1305797 () Bool)

(assert (=> b!1305797 (= e!744926 call!64340)))

(declare-fun b!1305798 () Bool)

(assert (=> b!1305798 (= e!744927 e!744925)))

(declare-fun res!866882 () Bool)

(assert (=> b!1305798 (=> (not res!866882) (not e!744925))))

(assert (=> b!1305798 (= res!866882 (not e!744924))))

(declare-fun res!866883 () Bool)

(assert (=> b!1305798 (=> (not res!866883) (not e!744924))))

(assert (=> b!1305798 (= res!866883 (validKeyInArray!0 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142261 (not res!866881)) b!1305798))

(assert (= (and b!1305798 res!866883) b!1305796))

(assert (= (and b!1305798 res!866882) b!1305794))

(assert (= (and b!1305794 c!125626) b!1305795))

(assert (= (and b!1305794 (not c!125626)) b!1305797))

(assert (= (or b!1305795 b!1305797) bm!64337))

(assert (=> b!1305794 m!1197035))

(assert (=> b!1305794 m!1197035))

(assert (=> b!1305794 m!1197037))

(assert (=> b!1305796 m!1197035))

(assert (=> b!1305796 m!1197035))

(declare-fun m!1197047 () Bool)

(assert (=> b!1305796 m!1197047))

(assert (=> bm!64337 m!1197035))

(declare-fun m!1197049 () Bool)

(assert (=> bm!64337 m!1197049))

(assert (=> b!1305798 m!1197035))

(assert (=> b!1305798 m!1197035))

(assert (=> b!1305798 m!1197037))

(assert (=> b!1305682 d!142261))

(declare-fun d!142263 () Bool)

(assert (=> d!142263 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110388 d!142263))

(declare-fun d!142265 () Bool)

(assert (=> d!142265 (= (array_inv!31967 _values!1445) (bvsge (size!42491 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110388 d!142265))

(declare-fun d!142267 () Bool)

(assert (=> d!142267 (= (array_inv!31968 _keys!1741) (bvsge (size!42492 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110388 d!142267))

(declare-fun d!142269 () Bool)

(assert (=> d!142269 (= (validKeyInArray!0 (select (arr!41941 _keys!1741) from!2144)) (and (not (= (select (arr!41941 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41941 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305686 d!142269))

(declare-fun d!142271 () Bool)

(declare-fun e!744933 () Bool)

(assert (=> d!142271 e!744933))

(declare-fun res!866886 () Bool)

(assert (=> d!142271 (=> res!866886 e!744933)))

(declare-fun lt!584280 () Bool)

(assert (=> d!142271 (= res!866886 (not lt!584280))))

(declare-fun lt!584282 () Bool)

(assert (=> d!142271 (= lt!584280 lt!584282)))

(declare-fun lt!584279 () Unit!43164)

(declare-fun e!744932 () Unit!43164)

(assert (=> d!142271 (= lt!584279 e!744932)))

(declare-fun c!125629 () Bool)

(assert (=> d!142271 (= c!125629 lt!584282)))

(declare-fun containsKey!729 (List!29808 (_ BitVec 64)) Bool)

(assert (=> d!142271 (= lt!584282 (containsKey!729 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142271 (= (contains!8331 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584280)))

(declare-fun b!1305805 () Bool)

(declare-fun lt!584281 () Unit!43164)

(assert (=> b!1305805 (= e!744932 lt!584281)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!475 (List!29808 (_ BitVec 64)) Unit!43164)

(assert (=> b!1305805 (= lt!584281 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!754 0))(
  ( (Some!753 (v!20155 V!51673)) (None!752) )
))
(declare-fun isDefined!512 (Option!754) Bool)

(declare-fun getValueByKey!703 (List!29808 (_ BitVec 64)) Option!754)

(assert (=> b!1305805 (isDefined!512 (getValueByKey!703 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305806 () Bool)

(declare-fun Unit!43168 () Unit!43164)

(assert (=> b!1305806 (= e!744932 Unit!43168)))

(declare-fun b!1305807 () Bool)

(assert (=> b!1305807 (= e!744933 (isDefined!512 (getValueByKey!703 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142271 c!125629) b!1305805))

(assert (= (and d!142271 (not c!125629)) b!1305806))

(assert (= (and d!142271 (not res!866886)) b!1305807))

(declare-fun m!1197051 () Bool)

(assert (=> d!142271 m!1197051))

(declare-fun m!1197053 () Bool)

(assert (=> b!1305805 m!1197053))

(declare-fun m!1197055 () Bool)

(assert (=> b!1305805 m!1197055))

(assert (=> b!1305805 m!1197055))

(declare-fun m!1197057 () Bool)

(assert (=> b!1305805 m!1197057))

(assert (=> b!1305807 m!1197055))

(assert (=> b!1305807 m!1197055))

(assert (=> b!1305807 m!1197057))

(assert (=> b!1305690 d!142271))

(declare-fun call!64343 () ListLongMap!20327)

(declare-fun bm!64340 () Bool)

(assert (=> bm!64340 (= call!64343 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305832 () Bool)

(assert (=> b!1305832 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))

(assert (=> b!1305832 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42491 _values!1445)))))

(declare-fun lt!584303 () ListLongMap!20327)

(declare-fun e!744951 () Bool)

(declare-fun apply!1033 (ListLongMap!20327 (_ BitVec 64)) V!51673)

(declare-fun get!21228 (ValueCell!16565 V!51673) V!51673)

(declare-fun dynLambda!3494 (Int (_ BitVec 64)) V!51673)

(assert (=> b!1305832 (= e!744951 (= (apply!1033 lt!584303 (select (arr!41941 _keys!1741) from!2144)) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1305833 () Bool)

(declare-fun e!744953 () Bool)

(declare-fun e!744950 () Bool)

(assert (=> b!1305833 (= e!744953 e!744950)))

(declare-fun c!125641 () Bool)

(assert (=> b!1305833 (= c!125641 (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305834 () Bool)

(declare-fun isEmpty!1070 (ListLongMap!20327) Bool)

(assert (=> b!1305834 (= e!744950 (isEmpty!1070 lt!584303))))

(declare-fun b!1305835 () Bool)

(assert (=> b!1305835 (= e!744950 (= lt!584303 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1305836 () Bool)

(assert (=> b!1305836 (= e!744953 e!744951)))

(assert (=> b!1305836 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun res!866898 () Bool)

(assert (=> b!1305836 (= res!866898 (contains!8331 lt!584303 (select (arr!41941 _keys!1741) from!2144)))))

(assert (=> b!1305836 (=> (not res!866898) (not e!744951))))

(declare-fun b!1305837 () Bool)

(declare-fun e!744952 () Bool)

(assert (=> b!1305837 (= e!744952 e!744953)))

(declare-fun c!125639 () Bool)

(declare-fun e!744954 () Bool)

(assert (=> b!1305837 (= c!125639 e!744954)))

(declare-fun res!866895 () Bool)

(assert (=> b!1305837 (=> (not res!866895) (not e!744954))))

(assert (=> b!1305837 (= res!866895 (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305838 () Bool)

(declare-fun e!744949 () ListLongMap!20327)

(declare-fun e!744948 () ListLongMap!20327)

(assert (=> b!1305838 (= e!744949 e!744948)))

(declare-fun c!125638 () Bool)

(assert (=> b!1305838 (= c!125638 (validKeyInArray!0 (select (arr!41941 _keys!1741) from!2144)))))

(declare-fun d!142273 () Bool)

(assert (=> d!142273 e!744952))

(declare-fun res!866896 () Bool)

(assert (=> d!142273 (=> (not res!866896) (not e!744952))))

(assert (=> d!142273 (= res!866896 (not (contains!8331 lt!584303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142273 (= lt!584303 e!744949)))

(declare-fun c!125640 () Bool)

(assert (=> d!142273 (= c!125640 (bvsge from!2144 (size!42492 _keys!1741)))))

(assert (=> d!142273 (validMask!0 mask!2175)))

(assert (=> d!142273 (= (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584303)))

(declare-fun b!1305839 () Bool)

(assert (=> b!1305839 (= e!744954 (validKeyInArray!0 (select (arr!41941 _keys!1741) from!2144)))))

(assert (=> b!1305839 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1305840 () Bool)

(assert (=> b!1305840 (= e!744948 call!64343)))

(declare-fun b!1305841 () Bool)

(assert (=> b!1305841 (= e!744949 (ListLongMap!20328 Nil!29805))))

(declare-fun b!1305842 () Bool)

(declare-fun res!866897 () Bool)

(assert (=> b!1305842 (=> (not res!866897) (not e!744952))))

(assert (=> b!1305842 (= res!866897 (not (contains!8331 lt!584303 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305843 () Bool)

(declare-fun lt!584301 () Unit!43164)

(declare-fun lt!584300 () Unit!43164)

(assert (=> b!1305843 (= lt!584301 lt!584300)))

(declare-fun lt!584302 () (_ BitVec 64))

(declare-fun lt!584299 () ListLongMap!20327)

(declare-fun lt!584298 () V!51673)

(declare-fun lt!584297 () (_ BitVec 64))

(declare-fun +!4534 (ListLongMap!20327 tuple2!22662) ListLongMap!20327)

(assert (=> b!1305843 (not (contains!8331 (+!4534 lt!584299 (tuple2!22663 lt!584297 lt!584298)) lt!584302))))

(declare-fun addStillNotContains!485 (ListLongMap!20327 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43164)

(assert (=> b!1305843 (= lt!584300 (addStillNotContains!485 lt!584299 lt!584297 lt!584298 lt!584302))))

(assert (=> b!1305843 (= lt!584302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1305843 (= lt!584298 (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305843 (= lt!584297 (select (arr!41941 _keys!1741) from!2144))))

(assert (=> b!1305843 (= lt!584299 call!64343)))

(assert (=> b!1305843 (= e!744948 (+!4534 call!64343 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142273 c!125640) b!1305841))

(assert (= (and d!142273 (not c!125640)) b!1305838))

(assert (= (and b!1305838 c!125638) b!1305843))

(assert (= (and b!1305838 (not c!125638)) b!1305840))

(assert (= (or b!1305843 b!1305840) bm!64340))

(assert (= (and d!142273 res!866896) b!1305842))

(assert (= (and b!1305842 res!866897) b!1305837))

(assert (= (and b!1305837 res!866895) b!1305839))

(assert (= (and b!1305837 c!125639) b!1305836))

(assert (= (and b!1305837 (not c!125639)) b!1305833))

(assert (= (and b!1305836 res!866898) b!1305832))

(assert (= (and b!1305833 c!125641) b!1305835))

(assert (= (and b!1305833 (not c!125641)) b!1305834))

(declare-fun b_lambda!23301 () Bool)

(assert (=> (not b_lambda!23301) (not b!1305832)))

(declare-fun t!43402 () Bool)

(declare-fun tb!11395 () Bool)

(assert (=> (and start!110388 (= defaultEntry!1448 defaultEntry!1448) t!43402) tb!11395))

(declare-fun result!23823 () Bool)

(assert (=> tb!11395 (= result!23823 tp_is_empty!34927)))

(assert (=> b!1305832 t!43402))

(declare-fun b_and!47475 () Bool)

(assert (= b_and!47469 (and (=> t!43402 result!23823) b_and!47475)))

(declare-fun b_lambda!23303 () Bool)

(assert (=> (not b_lambda!23303) (not b!1305843)))

(assert (=> b!1305843 t!43402))

(declare-fun b_and!47477 () Bool)

(assert (= b_and!47475 (and (=> t!43402 result!23823) b_and!47477)))

(declare-fun m!1197059 () Bool)

(assert (=> bm!64340 m!1197059))

(assert (=> b!1305836 m!1196955))

(assert (=> b!1305836 m!1196955))

(declare-fun m!1197061 () Bool)

(assert (=> b!1305836 m!1197061))

(declare-fun m!1197063 () Bool)

(assert (=> b!1305843 m!1197063))

(declare-fun m!1197065 () Bool)

(assert (=> b!1305843 m!1197065))

(declare-fun m!1197067 () Bool)

(assert (=> b!1305843 m!1197067))

(declare-fun m!1197069 () Bool)

(assert (=> b!1305843 m!1197069))

(declare-fun m!1197071 () Bool)

(assert (=> b!1305843 m!1197071))

(assert (=> b!1305843 m!1197067))

(assert (=> b!1305843 m!1197069))

(declare-fun m!1197073 () Bool)

(assert (=> b!1305843 m!1197073))

(assert (=> b!1305843 m!1196955))

(assert (=> b!1305843 m!1197063))

(declare-fun m!1197075 () Bool)

(assert (=> b!1305843 m!1197075))

(assert (=> b!1305838 m!1196955))

(assert (=> b!1305838 m!1196955))

(assert (=> b!1305838 m!1196957))

(declare-fun m!1197077 () Bool)

(assert (=> b!1305842 m!1197077))

(assert (=> b!1305832 m!1196955))

(declare-fun m!1197079 () Bool)

(assert (=> b!1305832 m!1197079))

(assert (=> b!1305832 m!1196955))

(assert (=> b!1305832 m!1197067))

(assert (=> b!1305832 m!1197069))

(assert (=> b!1305832 m!1197071))

(assert (=> b!1305832 m!1197067))

(assert (=> b!1305832 m!1197069))

(assert (=> b!1305835 m!1197059))

(declare-fun m!1197081 () Bool)

(assert (=> b!1305834 m!1197081))

(assert (=> b!1305839 m!1196955))

(assert (=> b!1305839 m!1196955))

(assert (=> b!1305839 m!1196957))

(declare-fun m!1197083 () Bool)

(assert (=> d!142273 m!1197083))

(assert (=> d!142273 m!1196959))

(assert (=> b!1305690 d!142273))

(declare-fun d!142275 () Bool)

(declare-fun e!744956 () Bool)

(assert (=> d!142275 e!744956))

(declare-fun res!866899 () Bool)

(assert (=> d!142275 (=> res!866899 e!744956)))

(declare-fun lt!584305 () Bool)

(assert (=> d!142275 (= res!866899 (not lt!584305))))

(declare-fun lt!584307 () Bool)

(assert (=> d!142275 (= lt!584305 lt!584307)))

(declare-fun lt!584304 () Unit!43164)

(declare-fun e!744955 () Unit!43164)

(assert (=> d!142275 (= lt!584304 e!744955)))

(declare-fun c!125642 () Bool)

(assert (=> d!142275 (= c!125642 lt!584307)))

(assert (=> d!142275 (= lt!584307 (containsKey!729 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142275 (= (contains!8331 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584305)))

(declare-fun b!1305846 () Bool)

(declare-fun lt!584306 () Unit!43164)

(assert (=> b!1305846 (= e!744955 lt!584306)))

(assert (=> b!1305846 (= lt!584306 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1305846 (isDefined!512 (getValueByKey!703 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305847 () Bool)

(declare-fun Unit!43169 () Unit!43164)

(assert (=> b!1305847 (= e!744955 Unit!43169)))

(declare-fun b!1305848 () Bool)

(assert (=> b!1305848 (= e!744956 (isDefined!512 (getValueByKey!703 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142275 c!125642) b!1305846))

(assert (= (and d!142275 (not c!125642)) b!1305847))

(assert (= (and d!142275 (not res!866899)) b!1305848))

(declare-fun m!1197085 () Bool)

(assert (=> d!142275 m!1197085))

(declare-fun m!1197087 () Bool)

(assert (=> b!1305846 m!1197087))

(declare-fun m!1197089 () Bool)

(assert (=> b!1305846 m!1197089))

(assert (=> b!1305846 m!1197089))

(declare-fun m!1197091 () Bool)

(assert (=> b!1305846 m!1197091))

(assert (=> b!1305848 m!1197089))

(assert (=> b!1305848 m!1197089))

(assert (=> b!1305848 m!1197091))

(assert (=> b!1305684 d!142275))

(declare-fun b!1305891 () Bool)

(declare-fun e!744983 () Bool)

(declare-fun lt!584362 () ListLongMap!20327)

(assert (=> b!1305891 (= e!744983 (= (apply!1033 lt!584362 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1305892 () Bool)

(declare-fun e!744991 () Bool)

(assert (=> b!1305892 (= e!744991 (validKeyInArray!0 (select (arr!41941 _keys!1741) from!2144)))))

(declare-fun b!1305893 () Bool)

(declare-fun e!744994 () Bool)

(assert (=> b!1305893 (= e!744994 e!744983)))

(declare-fun res!866919 () Bool)

(declare-fun call!64360 () Bool)

(assert (=> b!1305893 (= res!866919 call!64360)))

(assert (=> b!1305893 (=> (not res!866919) (not e!744983))))

(declare-fun b!1305894 () Bool)

(declare-fun e!744987 () ListLongMap!20327)

(declare-fun e!744992 () ListLongMap!20327)

(assert (=> b!1305894 (= e!744987 e!744992)))

(declare-fun c!125660 () Bool)

(assert (=> b!1305894 (= c!125660 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305895 () Bool)

(declare-fun e!744986 () Bool)

(declare-fun e!744990 () Bool)

(assert (=> b!1305895 (= e!744986 e!744990)))

(declare-fun c!125659 () Bool)

(assert (=> b!1305895 (= c!125659 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305896 () Bool)

(declare-fun call!64362 () Bool)

(assert (=> b!1305896 (= e!744990 (not call!64362))))

(declare-fun b!1305897 () Bool)

(declare-fun call!64363 () ListLongMap!20327)

(assert (=> b!1305897 (= e!744992 call!64363)))

(declare-fun bm!64356 () Bool)

(declare-fun call!64361 () ListLongMap!20327)

(declare-fun call!64364 () ListLongMap!20327)

(assert (=> bm!64356 (= call!64361 call!64364)))

(declare-fun b!1305898 () Bool)

(declare-fun e!744995 () ListLongMap!20327)

(assert (=> b!1305898 (= e!744995 call!64363)))

(declare-fun b!1305899 () Bool)

(declare-fun res!866922 () Bool)

(assert (=> b!1305899 (=> (not res!866922) (not e!744986))))

(assert (=> b!1305899 (= res!866922 e!744994)))

(declare-fun c!125656 () Bool)

(assert (=> b!1305899 (= c!125656 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64357 () Bool)

(declare-fun call!64358 () ListLongMap!20327)

(assert (=> bm!64357 (= call!64363 call!64358)))

(declare-fun b!1305900 () Bool)

(declare-fun e!744989 () Bool)

(assert (=> b!1305900 (= e!744989 (validKeyInArray!0 (select (arr!41941 _keys!1741) from!2144)))))

(declare-fun b!1305901 () Bool)

(declare-fun e!744988 () Bool)

(assert (=> b!1305901 (= e!744988 (= (apply!1033 lt!584362 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!64358 () Bool)

(declare-fun call!64359 () ListLongMap!20327)

(declare-fun c!125655 () Bool)

(assert (=> bm!64358 (= call!64358 (+!4534 (ite c!125655 call!64359 (ite c!125660 call!64364 call!64361)) (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305902 () Bool)

(declare-fun res!866920 () Bool)

(assert (=> b!1305902 (=> (not res!866920) (not e!744986))))

(declare-fun e!744984 () Bool)

(assert (=> b!1305902 (= res!866920 e!744984)))

(declare-fun res!866918 () Bool)

(assert (=> b!1305902 (=> res!866918 e!744984)))

(assert (=> b!1305902 (= res!866918 (not e!744991))))

(declare-fun res!866923 () Bool)

(assert (=> b!1305902 (=> (not res!866923) (not e!744991))))

(assert (=> b!1305902 (= res!866923 (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305903 () Bool)

(assert (=> b!1305903 (= e!744987 (+!4534 call!64358 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1305904 () Bool)

(assert (=> b!1305904 (= e!744994 (not call!64360))))

(declare-fun d!142277 () Bool)

(assert (=> d!142277 e!744986))

(declare-fun res!866924 () Bool)

(assert (=> d!142277 (=> (not res!866924) (not e!744986))))

(assert (=> d!142277 (= res!866924 (or (bvsge from!2144 (size!42492 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))))

(declare-fun lt!584352 () ListLongMap!20327)

(assert (=> d!142277 (= lt!584362 lt!584352)))

(declare-fun lt!584372 () Unit!43164)

(declare-fun e!744993 () Unit!43164)

(assert (=> d!142277 (= lt!584372 e!744993)))

(declare-fun c!125658 () Bool)

(assert (=> d!142277 (= c!125658 e!744989)))

(declare-fun res!866926 () Bool)

(assert (=> d!142277 (=> (not res!866926) (not e!744989))))

(assert (=> d!142277 (= res!866926 (bvslt from!2144 (size!42492 _keys!1741)))))

(assert (=> d!142277 (= lt!584352 e!744987)))

(assert (=> d!142277 (= c!125655 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142277 (validMask!0 mask!2175)))

(assert (=> d!142277 (= (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584362)))

(declare-fun bm!64355 () Bool)

(assert (=> bm!64355 (= call!64362 (contains!8331 lt!584362 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305905 () Bool)

(declare-fun lt!584368 () Unit!43164)

(assert (=> b!1305905 (= e!744993 lt!584368)))

(declare-fun lt!584364 () ListLongMap!20327)

(assert (=> b!1305905 (= lt!584364 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584360 () (_ BitVec 64))

(assert (=> b!1305905 (= lt!584360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584367 () (_ BitVec 64))

(assert (=> b!1305905 (= lt!584367 (select (arr!41941 _keys!1741) from!2144))))

(declare-fun lt!584361 () Unit!43164)

(declare-fun addStillContains!1120 (ListLongMap!20327 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43164)

(assert (=> b!1305905 (= lt!584361 (addStillContains!1120 lt!584364 lt!584360 zeroValue!1387 lt!584367))))

(assert (=> b!1305905 (contains!8331 (+!4534 lt!584364 (tuple2!22663 lt!584360 zeroValue!1387)) lt!584367)))

(declare-fun lt!584365 () Unit!43164)

(assert (=> b!1305905 (= lt!584365 lt!584361)))

(declare-fun lt!584369 () ListLongMap!20327)

(assert (=> b!1305905 (= lt!584369 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584366 () (_ BitVec 64))

(assert (=> b!1305905 (= lt!584366 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584359 () (_ BitVec 64))

(assert (=> b!1305905 (= lt!584359 (select (arr!41941 _keys!1741) from!2144))))

(declare-fun lt!584356 () Unit!43164)

(declare-fun addApplyDifferent!562 (ListLongMap!20327 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43164)

(assert (=> b!1305905 (= lt!584356 (addApplyDifferent!562 lt!584369 lt!584366 minValue!1387 lt!584359))))

(assert (=> b!1305905 (= (apply!1033 (+!4534 lt!584369 (tuple2!22663 lt!584366 minValue!1387)) lt!584359) (apply!1033 lt!584369 lt!584359))))

(declare-fun lt!584353 () Unit!43164)

(assert (=> b!1305905 (= lt!584353 lt!584356)))

(declare-fun lt!584355 () ListLongMap!20327)

(assert (=> b!1305905 (= lt!584355 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584357 () (_ BitVec 64))

(assert (=> b!1305905 (= lt!584357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584358 () (_ BitVec 64))

(assert (=> b!1305905 (= lt!584358 (select (arr!41941 _keys!1741) from!2144))))

(declare-fun lt!584370 () Unit!43164)

(assert (=> b!1305905 (= lt!584370 (addApplyDifferent!562 lt!584355 lt!584357 zeroValue!1387 lt!584358))))

(assert (=> b!1305905 (= (apply!1033 (+!4534 lt!584355 (tuple2!22663 lt!584357 zeroValue!1387)) lt!584358) (apply!1033 lt!584355 lt!584358))))

(declare-fun lt!584373 () Unit!43164)

(assert (=> b!1305905 (= lt!584373 lt!584370)))

(declare-fun lt!584371 () ListLongMap!20327)

(assert (=> b!1305905 (= lt!584371 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584363 () (_ BitVec 64))

(assert (=> b!1305905 (= lt!584363 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584354 () (_ BitVec 64))

(assert (=> b!1305905 (= lt!584354 (select (arr!41941 _keys!1741) from!2144))))

(assert (=> b!1305905 (= lt!584368 (addApplyDifferent!562 lt!584371 lt!584363 minValue!1387 lt!584354))))

(assert (=> b!1305905 (= (apply!1033 (+!4534 lt!584371 (tuple2!22663 lt!584363 minValue!1387)) lt!584354) (apply!1033 lt!584371 lt!584354))))

(declare-fun b!1305906 () Bool)

(declare-fun Unit!43170 () Unit!43164)

(assert (=> b!1305906 (= e!744993 Unit!43170)))

(declare-fun bm!64359 () Bool)

(assert (=> bm!64359 (= call!64360 (contains!8331 lt!584362 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64360 () Bool)

(assert (=> bm!64360 (= call!64359 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!64361 () Bool)

(assert (=> bm!64361 (= call!64364 call!64359)))

(declare-fun b!1305907 () Bool)

(declare-fun e!744985 () Bool)

(assert (=> b!1305907 (= e!744985 (= (apply!1033 lt!584362 (select (arr!41941 _keys!1741) from!2144)) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305907 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42491 _values!1445)))))

(assert (=> b!1305907 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305908 () Bool)

(assert (=> b!1305908 (= e!744990 e!744988)))

(declare-fun res!866925 () Bool)

(assert (=> b!1305908 (= res!866925 call!64362)))

(assert (=> b!1305908 (=> (not res!866925) (not e!744988))))

(declare-fun b!1305909 () Bool)

(assert (=> b!1305909 (= e!744995 call!64361)))

(declare-fun b!1305910 () Bool)

(assert (=> b!1305910 (= e!744984 e!744985)))

(declare-fun res!866921 () Bool)

(assert (=> b!1305910 (=> (not res!866921) (not e!744985))))

(assert (=> b!1305910 (= res!866921 (contains!8331 lt!584362 (select (arr!41941 _keys!1741) from!2144)))))

(assert (=> b!1305910 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42492 _keys!1741)))))

(declare-fun b!1305911 () Bool)

(declare-fun c!125657 () Bool)

(assert (=> b!1305911 (= c!125657 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1305911 (= e!744992 e!744995)))

(assert (= (and d!142277 c!125655) b!1305903))

(assert (= (and d!142277 (not c!125655)) b!1305894))

(assert (= (and b!1305894 c!125660) b!1305897))

(assert (= (and b!1305894 (not c!125660)) b!1305911))

(assert (= (and b!1305911 c!125657) b!1305898))

(assert (= (and b!1305911 (not c!125657)) b!1305909))

(assert (= (or b!1305898 b!1305909) bm!64356))

(assert (= (or b!1305897 bm!64356) bm!64361))

(assert (= (or b!1305897 b!1305898) bm!64357))

(assert (= (or b!1305903 bm!64361) bm!64360))

(assert (= (or b!1305903 bm!64357) bm!64358))

(assert (= (and d!142277 res!866926) b!1305900))

(assert (= (and d!142277 c!125658) b!1305905))

(assert (= (and d!142277 (not c!125658)) b!1305906))

(assert (= (and d!142277 res!866924) b!1305902))

(assert (= (and b!1305902 res!866923) b!1305892))

(assert (= (and b!1305902 (not res!866918)) b!1305910))

(assert (= (and b!1305910 res!866921) b!1305907))

(assert (= (and b!1305902 res!866920) b!1305899))

(assert (= (and b!1305899 c!125656) b!1305893))

(assert (= (and b!1305899 (not c!125656)) b!1305904))

(assert (= (and b!1305893 res!866919) b!1305891))

(assert (= (or b!1305893 b!1305904) bm!64359))

(assert (= (and b!1305899 res!866922) b!1305895))

(assert (= (and b!1305895 c!125659) b!1305908))

(assert (= (and b!1305895 (not c!125659)) b!1305896))

(assert (= (and b!1305908 res!866925) b!1305901))

(assert (= (or b!1305908 b!1305896) bm!64355))

(declare-fun b_lambda!23305 () Bool)

(assert (=> (not b_lambda!23305) (not b!1305907)))

(assert (=> b!1305907 t!43402))

(declare-fun b_and!47479 () Bool)

(assert (= b_and!47477 (and (=> t!43402 result!23823) b_and!47479)))

(declare-fun m!1197093 () Bool)

(assert (=> b!1305891 m!1197093))

(assert (=> b!1305910 m!1196955))

(assert (=> b!1305910 m!1196955))

(declare-fun m!1197095 () Bool)

(assert (=> b!1305910 m!1197095))

(declare-fun m!1197097 () Bool)

(assert (=> bm!64358 m!1197097))

(assert (=> d!142277 m!1196959))

(assert (=> bm!64360 m!1196969))

(assert (=> b!1305900 m!1196955))

(assert (=> b!1305900 m!1196955))

(assert (=> b!1305900 m!1196957))

(declare-fun m!1197099 () Bool)

(assert (=> b!1305901 m!1197099))

(declare-fun m!1197101 () Bool)

(assert (=> b!1305905 m!1197101))

(declare-fun m!1197103 () Bool)

(assert (=> b!1305905 m!1197103))

(declare-fun m!1197105 () Bool)

(assert (=> b!1305905 m!1197105))

(declare-fun m!1197107 () Bool)

(assert (=> b!1305905 m!1197107))

(declare-fun m!1197109 () Bool)

(assert (=> b!1305905 m!1197109))

(declare-fun m!1197111 () Bool)

(assert (=> b!1305905 m!1197111))

(declare-fun m!1197113 () Bool)

(assert (=> b!1305905 m!1197113))

(declare-fun m!1197115 () Bool)

(assert (=> b!1305905 m!1197115))

(assert (=> b!1305905 m!1196969))

(declare-fun m!1197117 () Bool)

(assert (=> b!1305905 m!1197117))

(declare-fun m!1197119 () Bool)

(assert (=> b!1305905 m!1197119))

(declare-fun m!1197121 () Bool)

(assert (=> b!1305905 m!1197121))

(assert (=> b!1305905 m!1197107))

(declare-fun m!1197123 () Bool)

(assert (=> b!1305905 m!1197123))

(declare-fun m!1197125 () Bool)

(assert (=> b!1305905 m!1197125))

(assert (=> b!1305905 m!1197101))

(assert (=> b!1305905 m!1197123))

(declare-fun m!1197127 () Bool)

(assert (=> b!1305905 m!1197127))

(assert (=> b!1305905 m!1196955))

(assert (=> b!1305905 m!1197127))

(declare-fun m!1197129 () Bool)

(assert (=> b!1305905 m!1197129))

(declare-fun m!1197131 () Bool)

(assert (=> b!1305903 m!1197131))

(assert (=> b!1305892 m!1196955))

(assert (=> b!1305892 m!1196955))

(assert (=> b!1305892 m!1196957))

(assert (=> b!1305907 m!1196955))

(assert (=> b!1305907 m!1197067))

(assert (=> b!1305907 m!1197067))

(assert (=> b!1305907 m!1197069))

(assert (=> b!1305907 m!1197071))

(assert (=> b!1305907 m!1197069))

(assert (=> b!1305907 m!1196955))

(declare-fun m!1197133 () Bool)

(assert (=> b!1305907 m!1197133))

(declare-fun m!1197135 () Bool)

(assert (=> bm!64359 m!1197135))

(declare-fun m!1197137 () Bool)

(assert (=> bm!64355 m!1197137))

(assert (=> b!1305684 d!142277))

(declare-fun d!142279 () Bool)

(declare-fun e!744997 () Bool)

(assert (=> d!142279 e!744997))

(declare-fun res!866927 () Bool)

(assert (=> d!142279 (=> res!866927 e!744997)))

(declare-fun lt!584375 () Bool)

(assert (=> d!142279 (= res!866927 (not lt!584375))))

(declare-fun lt!584377 () Bool)

(assert (=> d!142279 (= lt!584375 lt!584377)))

(declare-fun lt!584374 () Unit!43164)

(declare-fun e!744996 () Unit!43164)

(assert (=> d!142279 (= lt!584374 e!744996)))

(declare-fun c!125661 () Bool)

(assert (=> d!142279 (= c!125661 lt!584377)))

(assert (=> d!142279 (= lt!584377 (containsKey!729 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205))))

(assert (=> d!142279 (= (contains!8331 (ListLongMap!20328 Nil!29805) k0!1205) lt!584375)))

(declare-fun b!1305912 () Bool)

(declare-fun lt!584376 () Unit!43164)

(assert (=> b!1305912 (= e!744996 lt!584376)))

(assert (=> b!1305912 (= lt!584376 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205))))

(assert (=> b!1305912 (isDefined!512 (getValueByKey!703 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205))))

(declare-fun b!1305913 () Bool)

(declare-fun Unit!43171 () Unit!43164)

(assert (=> b!1305913 (= e!744996 Unit!43171)))

(declare-fun b!1305914 () Bool)

(assert (=> b!1305914 (= e!744997 (isDefined!512 (getValueByKey!703 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205)))))

(assert (= (and d!142279 c!125661) b!1305912))

(assert (= (and d!142279 (not c!125661)) b!1305913))

(assert (= (and d!142279 (not res!866927)) b!1305914))

(declare-fun m!1197139 () Bool)

(assert (=> d!142279 m!1197139))

(declare-fun m!1197141 () Bool)

(assert (=> b!1305912 m!1197141))

(declare-fun m!1197143 () Bool)

(assert (=> b!1305912 m!1197143))

(assert (=> b!1305912 m!1197143))

(declare-fun m!1197145 () Bool)

(assert (=> b!1305912 m!1197145))

(assert (=> b!1305914 m!1197143))

(assert (=> b!1305914 m!1197143))

(assert (=> b!1305914 m!1197145))

(assert (=> b!1305693 d!142279))

(declare-fun d!142281 () Bool)

(assert (=> d!142281 (not (contains!8331 (ListLongMap!20328 Nil!29805) k0!1205))))

(declare-fun lt!584380 () Unit!43164)

(declare-fun choose!1931 ((_ BitVec 64)) Unit!43164)

(assert (=> d!142281 (= lt!584380 (choose!1931 k0!1205))))

(assert (=> d!142281 (= (emptyContainsNothing!228 k0!1205) lt!584380)))

(declare-fun bs!37168 () Bool)

(assert (= bs!37168 d!142281))

(assert (=> bs!37168 m!1196973))

(declare-fun m!1197147 () Bool)

(assert (=> bs!37168 m!1197147))

(assert (=> b!1305693 d!142281))

(declare-fun mapNonEmpty!53999 () Bool)

(declare-fun mapRes!53999 () Bool)

(declare-fun tp!103034 () Bool)

(declare-fun e!745003 () Bool)

(assert (=> mapNonEmpty!53999 (= mapRes!53999 (and tp!103034 e!745003))))

(declare-fun mapValue!53999 () ValueCell!16565)

(declare-fun mapKey!53999 () (_ BitVec 32))

(declare-fun mapRest!53999 () (Array (_ BitVec 32) ValueCell!16565))

(assert (=> mapNonEmpty!53999 (= mapRest!53990 (store mapRest!53999 mapKey!53999 mapValue!53999))))

(declare-fun mapIsEmpty!53999 () Bool)

(assert (=> mapIsEmpty!53999 mapRes!53999))

(declare-fun condMapEmpty!53999 () Bool)

(declare-fun mapDefault!53999 () ValueCell!16565)

(assert (=> mapNonEmpty!53990 (= condMapEmpty!53999 (= mapRest!53990 ((as const (Array (_ BitVec 32) ValueCell!16565)) mapDefault!53999)))))

(declare-fun e!745002 () Bool)

(assert (=> mapNonEmpty!53990 (= tp!103018 (and e!745002 mapRes!53999))))

(declare-fun b!1305922 () Bool)

(assert (=> b!1305922 (= e!745002 tp_is_empty!34927)))

(declare-fun b!1305921 () Bool)

(assert (=> b!1305921 (= e!745003 tp_is_empty!34927)))

(assert (= (and mapNonEmpty!53990 condMapEmpty!53999) mapIsEmpty!53999))

(assert (= (and mapNonEmpty!53990 (not condMapEmpty!53999)) mapNonEmpty!53999))

(assert (= (and mapNonEmpty!53999 ((_ is ValueCellFull!16565) mapValue!53999)) b!1305921))

(assert (= (and mapNonEmpty!53990 ((_ is ValueCellFull!16565) mapDefault!53999)) b!1305922))

(declare-fun m!1197149 () Bool)

(assert (=> mapNonEmpty!53999 m!1197149))

(declare-fun b_lambda!23307 () Bool)

(assert (= b_lambda!23301 (or (and start!110388 b_free!29287) b_lambda!23307)))

(declare-fun b_lambda!23309 () Bool)

(assert (= b_lambda!23305 (or (and start!110388 b_free!29287) b_lambda!23309)))

(declare-fun b_lambda!23311 () Bool)

(assert (= b_lambda!23303 (or (and start!110388 b_free!29287) b_lambda!23311)))

(check-sat (not d!142275) (not b!1305846) (not bm!64358) (not bm!64337) (not b!1305839) (not b!1305807) (not b_lambda!23311) (not b!1305892) (not bm!64359) (not bm!64340) (not bm!64334) tp_is_empty!34927 (not b!1305838) (not b!1305907) (not d!142271) (not b!1305798) (not b!1305842) (not b!1305903) (not bm!64360) (not mapNonEmpty!53999) b_and!47479 (not d!142273) (not d!142279) (not b_next!29287) (not b!1305832) (not b!1305780) (not b!1305834) (not b!1305835) (not b!1305910) (not b!1305900) (not b!1305914) (not d!142281) (not b!1305794) (not b_lambda!23307) (not b!1305891) (not d!142277) (not b!1305805) (not b!1305912) (not b!1305843) (not b_lambda!23309) (not b!1305905) (not b!1305781) (not b!1305848) (not bm!64355) (not b!1305836) (not b!1305796) (not b!1305901))
(check-sat b_and!47479 (not b_next!29287))
(get-model)

(declare-fun d!142283 () Bool)

(declare-fun res!866932 () Bool)

(declare-fun e!745008 () Bool)

(assert (=> d!142283 (=> res!866932 e!745008)))

(assert (=> d!142283 (= res!866932 (and ((_ is Cons!29804) (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11342 (h!31022 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142283 (= (containsKey!729 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!745008)))

(declare-fun b!1305927 () Bool)

(declare-fun e!745009 () Bool)

(assert (=> b!1305927 (= e!745008 e!745009)))

(declare-fun res!866933 () Bool)

(assert (=> b!1305927 (=> (not res!866933) (not e!745009))))

(assert (=> b!1305927 (= res!866933 (and (or (not ((_ is Cons!29804) (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11342 (h!31022 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29804) (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11342 (h!31022 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1305928 () Bool)

(assert (=> b!1305928 (= e!745009 (containsKey!729 (t!43398 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!142283 (not res!866932)) b!1305927))

(assert (= (and b!1305927 res!866933) b!1305928))

(declare-fun m!1197151 () Bool)

(assert (=> b!1305928 m!1197151))

(assert (=> d!142275 d!142283))

(declare-fun d!142285 () Bool)

(declare-fun e!745011 () Bool)

(assert (=> d!142285 e!745011))

(declare-fun res!866934 () Bool)

(assert (=> d!142285 (=> res!866934 e!745011)))

(declare-fun lt!584382 () Bool)

(assert (=> d!142285 (= res!866934 (not lt!584382))))

(declare-fun lt!584384 () Bool)

(assert (=> d!142285 (= lt!584382 lt!584384)))

(declare-fun lt!584381 () Unit!43164)

(declare-fun e!745010 () Unit!43164)

(assert (=> d!142285 (= lt!584381 e!745010)))

(declare-fun c!125662 () Bool)

(assert (=> d!142285 (= c!125662 lt!584384)))

(assert (=> d!142285 (= lt!584384 (containsKey!729 (toList!10179 lt!584362) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142285 (= (contains!8331 lt!584362 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584382)))

(declare-fun b!1305929 () Bool)

(declare-fun lt!584383 () Unit!43164)

(assert (=> b!1305929 (= e!745010 lt!584383)))

(assert (=> b!1305929 (= lt!584383 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 lt!584362) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305929 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584362) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305930 () Bool)

(declare-fun Unit!43172 () Unit!43164)

(assert (=> b!1305930 (= e!745010 Unit!43172)))

(declare-fun b!1305931 () Bool)

(assert (=> b!1305931 (= e!745011 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584362) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142285 c!125662) b!1305929))

(assert (= (and d!142285 (not c!125662)) b!1305930))

(assert (= (and d!142285 (not res!866934)) b!1305931))

(declare-fun m!1197153 () Bool)

(assert (=> d!142285 m!1197153))

(declare-fun m!1197155 () Bool)

(assert (=> b!1305929 m!1197155))

(declare-fun m!1197157 () Bool)

(assert (=> b!1305929 m!1197157))

(assert (=> b!1305929 m!1197157))

(declare-fun m!1197159 () Bool)

(assert (=> b!1305929 m!1197159))

(assert (=> b!1305931 m!1197157))

(assert (=> b!1305931 m!1197157))

(assert (=> b!1305931 m!1197159))

(assert (=> bm!64359 d!142285))

(declare-fun call!64365 () ListLongMap!20327)

(declare-fun bm!64362 () Bool)

(assert (=> bm!64362 (= call!64365 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305932 () Bool)

(assert (=> b!1305932 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(assert (=> b!1305932 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42491 _values!1445)))))

(declare-fun e!745015 () Bool)

(declare-fun lt!584391 () ListLongMap!20327)

(assert (=> b!1305932 (= e!745015 (= (apply!1033 lt!584391 (select (arr!41941 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21228 (select (arr!41940 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1305933 () Bool)

(declare-fun e!745017 () Bool)

(declare-fun e!745014 () Bool)

(assert (=> b!1305933 (= e!745017 e!745014)))

(declare-fun c!125666 () Bool)

(assert (=> b!1305933 (= c!125666 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(declare-fun b!1305934 () Bool)

(assert (=> b!1305934 (= e!745014 (isEmpty!1070 lt!584391))))

(declare-fun b!1305935 () Bool)

(assert (=> b!1305935 (= e!745014 (= lt!584391 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1305936 () Bool)

(assert (=> b!1305936 (= e!745017 e!745015)))

(assert (=> b!1305936 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(declare-fun res!866938 () Bool)

(assert (=> b!1305936 (= res!866938 (contains!8331 lt!584391 (select (arr!41941 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1305936 (=> (not res!866938) (not e!745015))))

(declare-fun b!1305937 () Bool)

(declare-fun e!745016 () Bool)

(assert (=> b!1305937 (= e!745016 e!745017)))

(declare-fun c!125664 () Bool)

(declare-fun e!745018 () Bool)

(assert (=> b!1305937 (= c!125664 e!745018)))

(declare-fun res!866935 () Bool)

(assert (=> b!1305937 (=> (not res!866935) (not e!745018))))

(assert (=> b!1305937 (= res!866935 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(declare-fun b!1305938 () Bool)

(declare-fun e!745013 () ListLongMap!20327)

(declare-fun e!745012 () ListLongMap!20327)

(assert (=> b!1305938 (= e!745013 e!745012)))

(declare-fun c!125663 () Bool)

(assert (=> b!1305938 (= c!125663 (validKeyInArray!0 (select (arr!41941 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun d!142287 () Bool)

(assert (=> d!142287 e!745016))

(declare-fun res!866936 () Bool)

(assert (=> d!142287 (=> (not res!866936) (not e!745016))))

(assert (=> d!142287 (= res!866936 (not (contains!8331 lt!584391 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142287 (= lt!584391 e!745013)))

(declare-fun c!125665 () Bool)

(assert (=> d!142287 (= c!125665 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(assert (=> d!142287 (validMask!0 mask!2175)))

(assert (=> d!142287 (= (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!584391)))

(declare-fun b!1305939 () Bool)

(assert (=> b!1305939 (= e!745018 (validKeyInArray!0 (select (arr!41941 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1305939 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1305940 () Bool)

(assert (=> b!1305940 (= e!745012 call!64365)))

(declare-fun b!1305941 () Bool)

(assert (=> b!1305941 (= e!745013 (ListLongMap!20328 Nil!29805))))

(declare-fun b!1305942 () Bool)

(declare-fun res!866937 () Bool)

(assert (=> b!1305942 (=> (not res!866937) (not e!745016))))

(assert (=> b!1305942 (= res!866937 (not (contains!8331 lt!584391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305943 () Bool)

(declare-fun lt!584389 () Unit!43164)

(declare-fun lt!584388 () Unit!43164)

(assert (=> b!1305943 (= lt!584389 lt!584388)))

(declare-fun lt!584390 () (_ BitVec 64))

(declare-fun lt!584387 () ListLongMap!20327)

(declare-fun lt!584385 () (_ BitVec 64))

(declare-fun lt!584386 () V!51673)

(assert (=> b!1305943 (not (contains!8331 (+!4534 lt!584387 (tuple2!22663 lt!584385 lt!584386)) lt!584390))))

(assert (=> b!1305943 (= lt!584388 (addStillNotContains!485 lt!584387 lt!584385 lt!584386 lt!584390))))

(assert (=> b!1305943 (= lt!584390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1305943 (= lt!584386 (get!21228 (select (arr!41940 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305943 (= lt!584385 (select (arr!41941 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1305943 (= lt!584387 call!64365)))

(assert (=> b!1305943 (= e!745012 (+!4534 call!64365 (tuple2!22663 (select (arr!41941 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21228 (select (arr!41940 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142287 c!125665) b!1305941))

(assert (= (and d!142287 (not c!125665)) b!1305938))

(assert (= (and b!1305938 c!125663) b!1305943))

(assert (= (and b!1305938 (not c!125663)) b!1305940))

(assert (= (or b!1305943 b!1305940) bm!64362))

(assert (= (and d!142287 res!866936) b!1305942))

(assert (= (and b!1305942 res!866937) b!1305937))

(assert (= (and b!1305937 res!866935) b!1305939))

(assert (= (and b!1305937 c!125664) b!1305936))

(assert (= (and b!1305937 (not c!125664)) b!1305933))

(assert (= (and b!1305936 res!866938) b!1305932))

(assert (= (and b!1305933 c!125666) b!1305935))

(assert (= (and b!1305933 (not c!125666)) b!1305934))

(declare-fun b_lambda!23313 () Bool)

(assert (=> (not b_lambda!23313) (not b!1305932)))

(assert (=> b!1305932 t!43402))

(declare-fun b_and!47481 () Bool)

(assert (= b_and!47479 (and (=> t!43402 result!23823) b_and!47481)))

(declare-fun b_lambda!23315 () Bool)

(assert (=> (not b_lambda!23315) (not b!1305943)))

(assert (=> b!1305943 t!43402))

(declare-fun b_and!47483 () Bool)

(assert (= b_and!47481 (and (=> t!43402 result!23823) b_and!47483)))

(declare-fun m!1197161 () Bool)

(assert (=> bm!64362 m!1197161))

(declare-fun m!1197163 () Bool)

(assert (=> b!1305936 m!1197163))

(assert (=> b!1305936 m!1197163))

(declare-fun m!1197165 () Bool)

(assert (=> b!1305936 m!1197165))

(declare-fun m!1197167 () Bool)

(assert (=> b!1305943 m!1197167))

(declare-fun m!1197169 () Bool)

(assert (=> b!1305943 m!1197169))

(declare-fun m!1197171 () Bool)

(assert (=> b!1305943 m!1197171))

(assert (=> b!1305943 m!1197069))

(declare-fun m!1197173 () Bool)

(assert (=> b!1305943 m!1197173))

(assert (=> b!1305943 m!1197171))

(assert (=> b!1305943 m!1197069))

(declare-fun m!1197175 () Bool)

(assert (=> b!1305943 m!1197175))

(assert (=> b!1305943 m!1197163))

(assert (=> b!1305943 m!1197167))

(declare-fun m!1197177 () Bool)

(assert (=> b!1305943 m!1197177))

(assert (=> b!1305938 m!1197163))

(assert (=> b!1305938 m!1197163))

(declare-fun m!1197179 () Bool)

(assert (=> b!1305938 m!1197179))

(declare-fun m!1197181 () Bool)

(assert (=> b!1305942 m!1197181))

(assert (=> b!1305932 m!1197163))

(declare-fun m!1197183 () Bool)

(assert (=> b!1305932 m!1197183))

(assert (=> b!1305932 m!1197163))

(assert (=> b!1305932 m!1197171))

(assert (=> b!1305932 m!1197069))

(assert (=> b!1305932 m!1197173))

(assert (=> b!1305932 m!1197171))

(assert (=> b!1305932 m!1197069))

(assert (=> b!1305935 m!1197161))

(declare-fun m!1197185 () Bool)

(assert (=> b!1305934 m!1197185))

(assert (=> b!1305939 m!1197163))

(assert (=> b!1305939 m!1197163))

(assert (=> b!1305939 m!1197179))

(declare-fun m!1197187 () Bool)

(assert (=> d!142287 m!1197187))

(assert (=> d!142287 m!1196959))

(assert (=> bm!64340 d!142287))

(declare-fun d!142289 () Bool)

(declare-fun get!21229 (Option!754) V!51673)

(assert (=> d!142289 (= (apply!1033 lt!584362 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21229 (getValueByKey!703 (toList!10179 lt!584362) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37169 () Bool)

(assert (= bs!37169 d!142289))

(assert (=> bs!37169 m!1197157))

(assert (=> bs!37169 m!1197157))

(declare-fun m!1197189 () Bool)

(assert (=> bs!37169 m!1197189))

(assert (=> b!1305891 d!142289))

(declare-fun d!142291 () Bool)

(assert (=> d!142291 (= (apply!1033 lt!584303 (select (arr!41941 _keys!1741) from!2144)) (get!21229 (getValueByKey!703 (toList!10179 lt!584303) (select (arr!41941 _keys!1741) from!2144))))))

(declare-fun bs!37170 () Bool)

(assert (= bs!37170 d!142291))

(assert (=> bs!37170 m!1196955))

(declare-fun m!1197191 () Bool)

(assert (=> bs!37170 m!1197191))

(assert (=> bs!37170 m!1197191))

(declare-fun m!1197193 () Bool)

(assert (=> bs!37170 m!1197193))

(assert (=> b!1305832 d!142291))

(declare-fun d!142293 () Bool)

(declare-fun c!125669 () Bool)

(assert (=> d!142293 (= c!125669 ((_ is ValueCellFull!16565) (select (arr!41940 _values!1445) from!2144)))))

(declare-fun e!745021 () V!51673)

(assert (=> d!142293 (= (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!745021)))

(declare-fun b!1305948 () Bool)

(declare-fun get!21230 (ValueCell!16565 V!51673) V!51673)

(assert (=> b!1305948 (= e!745021 (get!21230 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305949 () Bool)

(declare-fun get!21231 (ValueCell!16565 V!51673) V!51673)

(assert (=> b!1305949 (= e!745021 (get!21231 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142293 c!125669) b!1305948))

(assert (= (and d!142293 (not c!125669)) b!1305949))

(assert (=> b!1305948 m!1197067))

(assert (=> b!1305948 m!1197069))

(declare-fun m!1197195 () Bool)

(assert (=> b!1305948 m!1197195))

(assert (=> b!1305949 m!1197067))

(assert (=> b!1305949 m!1197069))

(declare-fun m!1197197 () Bool)

(assert (=> b!1305949 m!1197197))

(assert (=> b!1305832 d!142293))

(assert (=> bm!64360 d!142273))

(declare-fun d!142295 () Bool)

(assert (=> d!142295 (= (apply!1033 lt!584362 (select (arr!41941 _keys!1741) from!2144)) (get!21229 (getValueByKey!703 (toList!10179 lt!584362) (select (arr!41941 _keys!1741) from!2144))))))

(declare-fun bs!37171 () Bool)

(assert (= bs!37171 d!142295))

(assert (=> bs!37171 m!1196955))

(declare-fun m!1197199 () Bool)

(assert (=> bs!37171 m!1197199))

(assert (=> bs!37171 m!1197199))

(declare-fun m!1197201 () Bool)

(assert (=> bs!37171 m!1197201))

(assert (=> b!1305907 d!142295))

(assert (=> b!1305907 d!142293))

(declare-fun d!142297 () Bool)

(declare-fun e!745023 () Bool)

(assert (=> d!142297 e!745023))

(declare-fun res!866939 () Bool)

(assert (=> d!142297 (=> res!866939 e!745023)))

(declare-fun lt!584393 () Bool)

(assert (=> d!142297 (= res!866939 (not lt!584393))))

(declare-fun lt!584395 () Bool)

(assert (=> d!142297 (= lt!584393 lt!584395)))

(declare-fun lt!584392 () Unit!43164)

(declare-fun e!745022 () Unit!43164)

(assert (=> d!142297 (= lt!584392 e!745022)))

(declare-fun c!125670 () Bool)

(assert (=> d!142297 (= c!125670 lt!584395)))

(assert (=> d!142297 (= lt!584395 (containsKey!729 (toList!10179 lt!584303) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142297 (= (contains!8331 lt!584303 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584393)))

(declare-fun b!1305950 () Bool)

(declare-fun lt!584394 () Unit!43164)

(assert (=> b!1305950 (= e!745022 lt!584394)))

(assert (=> b!1305950 (= lt!584394 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 lt!584303) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305950 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584303) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305951 () Bool)

(declare-fun Unit!43173 () Unit!43164)

(assert (=> b!1305951 (= e!745022 Unit!43173)))

(declare-fun b!1305952 () Bool)

(assert (=> b!1305952 (= e!745023 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584303) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142297 c!125670) b!1305950))

(assert (= (and d!142297 (not c!125670)) b!1305951))

(assert (= (and d!142297 (not res!866939)) b!1305952))

(declare-fun m!1197203 () Bool)

(assert (=> d!142297 m!1197203))

(declare-fun m!1197205 () Bool)

(assert (=> b!1305950 m!1197205))

(declare-fun m!1197207 () Bool)

(assert (=> b!1305950 m!1197207))

(assert (=> b!1305950 m!1197207))

(declare-fun m!1197209 () Bool)

(assert (=> b!1305950 m!1197209))

(assert (=> b!1305952 m!1197207))

(assert (=> b!1305952 m!1197207))

(assert (=> b!1305952 m!1197209))

(assert (=> d!142273 d!142297))

(assert (=> d!142273 d!142263))

(assert (=> b!1305892 d!142269))

(declare-fun d!142299 () Bool)

(declare-fun e!745026 () Bool)

(assert (=> d!142299 e!745026))

(declare-fun res!866945 () Bool)

(assert (=> d!142299 (=> (not res!866945) (not e!745026))))

(declare-fun lt!584406 () ListLongMap!20327)

(assert (=> d!142299 (= res!866945 (contains!8331 lt!584406 (_1!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584405 () List!29808)

(assert (=> d!142299 (= lt!584406 (ListLongMap!20328 lt!584405))))

(declare-fun lt!584407 () Unit!43164)

(declare-fun lt!584404 () Unit!43164)

(assert (=> d!142299 (= lt!584407 lt!584404)))

(assert (=> d!142299 (= (getValueByKey!703 lt!584405 (_1!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!753 (_2!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!354 (List!29808 (_ BitVec 64) V!51673) Unit!43164)

(assert (=> d!142299 (= lt!584404 (lemmaContainsTupThenGetReturnValue!354 lt!584405 (_1!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun insertStrictlySorted!483 (List!29808 (_ BitVec 64) V!51673) List!29808)

(assert (=> d!142299 (= lt!584405 (insertStrictlySorted!483 (toList!10179 (ite c!125655 call!64359 (ite c!125660 call!64364 call!64361))) (_1!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142299 (= (+!4534 (ite c!125655 call!64359 (ite c!125660 call!64364 call!64361)) (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584406)))

(declare-fun b!1305957 () Bool)

(declare-fun res!866944 () Bool)

(assert (=> b!1305957 (=> (not res!866944) (not e!745026))))

(assert (=> b!1305957 (= res!866944 (= (getValueByKey!703 (toList!10179 lt!584406) (_1!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!753 (_2!11342 (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305958 () Bool)

(declare-fun contains!8335 (List!29808 tuple2!22662) Bool)

(assert (=> b!1305958 (= e!745026 (contains!8335 (toList!10179 lt!584406) (ite (or c!125655 c!125660) (tuple2!22663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142299 res!866945) b!1305957))

(assert (= (and b!1305957 res!866944) b!1305958))

(declare-fun m!1197211 () Bool)

(assert (=> d!142299 m!1197211))

(declare-fun m!1197213 () Bool)

(assert (=> d!142299 m!1197213))

(declare-fun m!1197215 () Bool)

(assert (=> d!142299 m!1197215))

(declare-fun m!1197217 () Bool)

(assert (=> d!142299 m!1197217))

(declare-fun m!1197219 () Bool)

(assert (=> b!1305957 m!1197219))

(declare-fun m!1197221 () Bool)

(assert (=> b!1305958 m!1197221))

(assert (=> bm!64358 d!142299))

(declare-fun d!142301 () Bool)

(assert (=> d!142301 (= (apply!1033 lt!584362 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21229 (getValueByKey!703 (toList!10179 lt!584362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37172 () Bool)

(assert (= bs!37172 d!142301))

(declare-fun m!1197223 () Bool)

(assert (=> bs!37172 m!1197223))

(assert (=> bs!37172 m!1197223))

(declare-fun m!1197225 () Bool)

(assert (=> bs!37172 m!1197225))

(assert (=> b!1305901 d!142301))

(declare-fun d!142303 () Bool)

(assert (=> d!142303 (= (validKeyInArray!0 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305798 d!142303))

(declare-fun d!142305 () Bool)

(declare-fun e!745027 () Bool)

(assert (=> d!142305 e!745027))

(declare-fun res!866947 () Bool)

(assert (=> d!142305 (=> (not res!866947) (not e!745027))))

(declare-fun lt!584410 () ListLongMap!20327)

(assert (=> d!142305 (= res!866947 (contains!8331 lt!584410 (_1!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!584409 () List!29808)

(assert (=> d!142305 (= lt!584410 (ListLongMap!20328 lt!584409))))

(declare-fun lt!584411 () Unit!43164)

(declare-fun lt!584408 () Unit!43164)

(assert (=> d!142305 (= lt!584411 lt!584408)))

(assert (=> d!142305 (= (getValueByKey!703 lt!584409 (_1!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!753 (_2!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142305 (= lt!584408 (lemmaContainsTupThenGetReturnValue!354 lt!584409 (_1!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142305 (= lt!584409 (insertStrictlySorted!483 (toList!10179 call!64343) (_1!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142305 (= (+!4534 call!64343 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!584410)))

(declare-fun b!1305959 () Bool)

(declare-fun res!866946 () Bool)

(assert (=> b!1305959 (=> (not res!866946) (not e!745027))))

(assert (=> b!1305959 (= res!866946 (= (getValueByKey!703 (toList!10179 lt!584410) (_1!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!753 (_2!11342 (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1305960 () Bool)

(assert (=> b!1305960 (= e!745027 (contains!8335 (toList!10179 lt!584410) (tuple2!22663 (select (arr!41941 _keys!1741) from!2144) (get!21228 (select (arr!41940 _values!1445) from!2144) (dynLambda!3494 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142305 res!866947) b!1305959))

(assert (= (and b!1305959 res!866946) b!1305960))

(declare-fun m!1197227 () Bool)

(assert (=> d!142305 m!1197227))

(declare-fun m!1197229 () Bool)

(assert (=> d!142305 m!1197229))

(declare-fun m!1197231 () Bool)

(assert (=> d!142305 m!1197231))

(declare-fun m!1197233 () Bool)

(assert (=> d!142305 m!1197233))

(declare-fun m!1197235 () Bool)

(assert (=> b!1305959 m!1197235))

(declare-fun m!1197237 () Bool)

(assert (=> b!1305960 m!1197237))

(assert (=> b!1305843 d!142305))

(declare-fun d!142307 () Bool)

(assert (=> d!142307 (not (contains!8331 (+!4534 lt!584299 (tuple2!22663 lt!584297 lt!584298)) lt!584302))))

(declare-fun lt!584414 () Unit!43164)

(declare-fun choose!1932 (ListLongMap!20327 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43164)

(assert (=> d!142307 (= lt!584414 (choose!1932 lt!584299 lt!584297 lt!584298 lt!584302))))

(declare-fun e!745030 () Bool)

(assert (=> d!142307 e!745030))

(declare-fun res!866950 () Bool)

(assert (=> d!142307 (=> (not res!866950) (not e!745030))))

(assert (=> d!142307 (= res!866950 (not (contains!8331 lt!584299 lt!584302)))))

(assert (=> d!142307 (= (addStillNotContains!485 lt!584299 lt!584297 lt!584298 lt!584302) lt!584414)))

(declare-fun b!1305964 () Bool)

(assert (=> b!1305964 (= e!745030 (not (= lt!584297 lt!584302)))))

(assert (= (and d!142307 res!866950) b!1305964))

(assert (=> d!142307 m!1197063))

(assert (=> d!142307 m!1197063))

(assert (=> d!142307 m!1197065))

(declare-fun m!1197239 () Bool)

(assert (=> d!142307 m!1197239))

(declare-fun m!1197241 () Bool)

(assert (=> d!142307 m!1197241))

(assert (=> b!1305843 d!142307))

(declare-fun d!142309 () Bool)

(declare-fun e!745032 () Bool)

(assert (=> d!142309 e!745032))

(declare-fun res!866951 () Bool)

(assert (=> d!142309 (=> res!866951 e!745032)))

(declare-fun lt!584416 () Bool)

(assert (=> d!142309 (= res!866951 (not lt!584416))))

(declare-fun lt!584418 () Bool)

(assert (=> d!142309 (= lt!584416 lt!584418)))

(declare-fun lt!584415 () Unit!43164)

(declare-fun e!745031 () Unit!43164)

(assert (=> d!142309 (= lt!584415 e!745031)))

(declare-fun c!125671 () Bool)

(assert (=> d!142309 (= c!125671 lt!584418)))

(assert (=> d!142309 (= lt!584418 (containsKey!729 (toList!10179 (+!4534 lt!584299 (tuple2!22663 lt!584297 lt!584298))) lt!584302))))

(assert (=> d!142309 (= (contains!8331 (+!4534 lt!584299 (tuple2!22663 lt!584297 lt!584298)) lt!584302) lt!584416)))

(declare-fun b!1305965 () Bool)

(declare-fun lt!584417 () Unit!43164)

(assert (=> b!1305965 (= e!745031 lt!584417)))

(assert (=> b!1305965 (= lt!584417 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 (+!4534 lt!584299 (tuple2!22663 lt!584297 lt!584298))) lt!584302))))

(assert (=> b!1305965 (isDefined!512 (getValueByKey!703 (toList!10179 (+!4534 lt!584299 (tuple2!22663 lt!584297 lt!584298))) lt!584302))))

(declare-fun b!1305966 () Bool)

(declare-fun Unit!43174 () Unit!43164)

(assert (=> b!1305966 (= e!745031 Unit!43174)))

(declare-fun b!1305967 () Bool)

(assert (=> b!1305967 (= e!745032 (isDefined!512 (getValueByKey!703 (toList!10179 (+!4534 lt!584299 (tuple2!22663 lt!584297 lt!584298))) lt!584302)))))

(assert (= (and d!142309 c!125671) b!1305965))

(assert (= (and d!142309 (not c!125671)) b!1305966))

(assert (= (and d!142309 (not res!866951)) b!1305967))

(declare-fun m!1197243 () Bool)

(assert (=> d!142309 m!1197243))

(declare-fun m!1197245 () Bool)

(assert (=> b!1305965 m!1197245))

(declare-fun m!1197247 () Bool)

(assert (=> b!1305965 m!1197247))

(assert (=> b!1305965 m!1197247))

(declare-fun m!1197249 () Bool)

(assert (=> b!1305965 m!1197249))

(assert (=> b!1305967 m!1197247))

(assert (=> b!1305967 m!1197247))

(assert (=> b!1305967 m!1197249))

(assert (=> b!1305843 d!142309))

(declare-fun d!142311 () Bool)

(declare-fun e!745033 () Bool)

(assert (=> d!142311 e!745033))

(declare-fun res!866953 () Bool)

(assert (=> d!142311 (=> (not res!866953) (not e!745033))))

(declare-fun lt!584421 () ListLongMap!20327)

(assert (=> d!142311 (= res!866953 (contains!8331 lt!584421 (_1!11342 (tuple2!22663 lt!584297 lt!584298))))))

(declare-fun lt!584420 () List!29808)

(assert (=> d!142311 (= lt!584421 (ListLongMap!20328 lt!584420))))

(declare-fun lt!584422 () Unit!43164)

(declare-fun lt!584419 () Unit!43164)

(assert (=> d!142311 (= lt!584422 lt!584419)))

(assert (=> d!142311 (= (getValueByKey!703 lt!584420 (_1!11342 (tuple2!22663 lt!584297 lt!584298))) (Some!753 (_2!11342 (tuple2!22663 lt!584297 lt!584298))))))

(assert (=> d!142311 (= lt!584419 (lemmaContainsTupThenGetReturnValue!354 lt!584420 (_1!11342 (tuple2!22663 lt!584297 lt!584298)) (_2!11342 (tuple2!22663 lt!584297 lt!584298))))))

(assert (=> d!142311 (= lt!584420 (insertStrictlySorted!483 (toList!10179 lt!584299) (_1!11342 (tuple2!22663 lt!584297 lt!584298)) (_2!11342 (tuple2!22663 lt!584297 lt!584298))))))

(assert (=> d!142311 (= (+!4534 lt!584299 (tuple2!22663 lt!584297 lt!584298)) lt!584421)))

(declare-fun b!1305968 () Bool)

(declare-fun res!866952 () Bool)

(assert (=> b!1305968 (=> (not res!866952) (not e!745033))))

(assert (=> b!1305968 (= res!866952 (= (getValueByKey!703 (toList!10179 lt!584421) (_1!11342 (tuple2!22663 lt!584297 lt!584298))) (Some!753 (_2!11342 (tuple2!22663 lt!584297 lt!584298)))))))

(declare-fun b!1305969 () Bool)

(assert (=> b!1305969 (= e!745033 (contains!8335 (toList!10179 lt!584421) (tuple2!22663 lt!584297 lt!584298)))))

(assert (= (and d!142311 res!866953) b!1305968))

(assert (= (and b!1305968 res!866952) b!1305969))

(declare-fun m!1197251 () Bool)

(assert (=> d!142311 m!1197251))

(declare-fun m!1197253 () Bool)

(assert (=> d!142311 m!1197253))

(declare-fun m!1197255 () Bool)

(assert (=> d!142311 m!1197255))

(declare-fun m!1197257 () Bool)

(assert (=> d!142311 m!1197257))

(declare-fun m!1197259 () Bool)

(assert (=> b!1305968 m!1197259))

(declare-fun m!1197261 () Bool)

(assert (=> b!1305969 m!1197261))

(assert (=> b!1305843 d!142311))

(assert (=> b!1305843 d!142293))

(declare-fun d!142313 () Bool)

(declare-fun res!866954 () Bool)

(declare-fun e!745034 () Bool)

(assert (=> d!142313 (=> res!866954 e!745034)))

(assert (=> d!142313 (= res!866954 (and ((_ is Cons!29804) (toList!10179 (ListLongMap!20328 Nil!29805))) (= (_1!11342 (h!31022 (toList!10179 (ListLongMap!20328 Nil!29805)))) k0!1205)))))

(assert (=> d!142313 (= (containsKey!729 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205) e!745034)))

(declare-fun b!1305970 () Bool)

(declare-fun e!745035 () Bool)

(assert (=> b!1305970 (= e!745034 e!745035)))

(declare-fun res!866955 () Bool)

(assert (=> b!1305970 (=> (not res!866955) (not e!745035))))

(assert (=> b!1305970 (= res!866955 (and (or (not ((_ is Cons!29804) (toList!10179 (ListLongMap!20328 Nil!29805)))) (bvsle (_1!11342 (h!31022 (toList!10179 (ListLongMap!20328 Nil!29805)))) k0!1205)) ((_ is Cons!29804) (toList!10179 (ListLongMap!20328 Nil!29805))) (bvslt (_1!11342 (h!31022 (toList!10179 (ListLongMap!20328 Nil!29805)))) k0!1205)))))

(declare-fun b!1305971 () Bool)

(assert (=> b!1305971 (= e!745035 (containsKey!729 (t!43398 (toList!10179 (ListLongMap!20328 Nil!29805))) k0!1205))))

(assert (= (and d!142313 (not res!866954)) b!1305970))

(assert (= (and b!1305970 res!866955) b!1305971))

(declare-fun m!1197263 () Bool)

(assert (=> b!1305971 m!1197263))

(assert (=> d!142279 d!142313))

(declare-fun d!142315 () Bool)

(declare-fun res!866956 () Bool)

(declare-fun e!745036 () Bool)

(assert (=> d!142315 (=> res!866956 e!745036)))

(assert (=> d!142315 (= res!866956 (and ((_ is Cons!29804) (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11342 (h!31022 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142315 (= (containsKey!729 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!745036)))

(declare-fun b!1305972 () Bool)

(declare-fun e!745037 () Bool)

(assert (=> b!1305972 (= e!745036 e!745037)))

(declare-fun res!866957 () Bool)

(assert (=> b!1305972 (=> (not res!866957) (not e!745037))))

(assert (=> b!1305972 (= res!866957 (and (or (not ((_ is Cons!29804) (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11342 (h!31022 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29804) (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11342 (h!31022 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1305973 () Bool)

(assert (=> b!1305973 (= e!745037 (containsKey!729 (t!43398 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!142315 (not res!866956)) b!1305972))

(assert (= (and b!1305972 res!866957) b!1305973))

(declare-fun m!1197265 () Bool)

(assert (=> b!1305973 m!1197265))

(assert (=> d!142271 d!142315))

(declare-fun d!142317 () Bool)

(declare-fun e!745038 () Bool)

(assert (=> d!142317 e!745038))

(declare-fun res!866959 () Bool)

(assert (=> d!142317 (=> (not res!866959) (not e!745038))))

(declare-fun lt!584425 () ListLongMap!20327)

(assert (=> d!142317 (= res!866959 (contains!8331 lt!584425 (_1!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584424 () List!29808)

(assert (=> d!142317 (= lt!584425 (ListLongMap!20328 lt!584424))))

(declare-fun lt!584426 () Unit!43164)

(declare-fun lt!584423 () Unit!43164)

(assert (=> d!142317 (= lt!584426 lt!584423)))

(assert (=> d!142317 (= (getValueByKey!703 lt!584424 (_1!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!753 (_2!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142317 (= lt!584423 (lemmaContainsTupThenGetReturnValue!354 lt!584424 (_1!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142317 (= lt!584424 (insertStrictlySorted!483 (toList!10179 call!64358) (_1!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142317 (= (+!4534 call!64358 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584425)))

(declare-fun b!1305974 () Bool)

(declare-fun res!866958 () Bool)

(assert (=> b!1305974 (=> (not res!866958) (not e!745038))))

(assert (=> b!1305974 (= res!866958 (= (getValueByKey!703 (toList!10179 lt!584425) (_1!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!753 (_2!11342 (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305975 () Bool)

(assert (=> b!1305975 (= e!745038 (contains!8335 (toList!10179 lt!584425) (tuple2!22663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142317 res!866959) b!1305974))

(assert (= (and b!1305974 res!866958) b!1305975))

(declare-fun m!1197267 () Bool)

(assert (=> d!142317 m!1197267))

(declare-fun m!1197269 () Bool)

(assert (=> d!142317 m!1197269))

(declare-fun m!1197271 () Bool)

(assert (=> d!142317 m!1197271))

(declare-fun m!1197273 () Bool)

(assert (=> d!142317 m!1197273))

(declare-fun m!1197275 () Bool)

(assert (=> b!1305974 m!1197275))

(declare-fun m!1197277 () Bool)

(assert (=> b!1305975 m!1197277))

(assert (=> b!1305903 d!142317))

(assert (=> d!142277 d!142263))

(assert (=> d!142281 d!142279))

(declare-fun d!142319 () Bool)

(assert (=> d!142319 (not (contains!8331 (ListLongMap!20328 Nil!29805) k0!1205))))

(assert (=> d!142319 true))

(declare-fun _$29!201 () Unit!43164)

(assert (=> d!142319 (= (choose!1931 k0!1205) _$29!201)))

(declare-fun bs!37173 () Bool)

(assert (= bs!37173 d!142319))

(assert (=> bs!37173 m!1196973))

(assert (=> d!142281 d!142319))

(declare-fun d!142321 () Bool)

(declare-fun e!745040 () Bool)

(assert (=> d!142321 e!745040))

(declare-fun res!866960 () Bool)

(assert (=> d!142321 (=> res!866960 e!745040)))

(declare-fun lt!584428 () Bool)

(assert (=> d!142321 (= res!866960 (not lt!584428))))

(declare-fun lt!584430 () Bool)

(assert (=> d!142321 (= lt!584428 lt!584430)))

(declare-fun lt!584427 () Unit!43164)

(declare-fun e!745039 () Unit!43164)

(assert (=> d!142321 (= lt!584427 e!745039)))

(declare-fun c!125672 () Bool)

(assert (=> d!142321 (= c!125672 lt!584430)))

(assert (=> d!142321 (= lt!584430 (containsKey!729 (toList!10179 (+!4534 lt!584364 (tuple2!22663 lt!584360 zeroValue!1387))) lt!584367))))

(assert (=> d!142321 (= (contains!8331 (+!4534 lt!584364 (tuple2!22663 lt!584360 zeroValue!1387)) lt!584367) lt!584428)))

(declare-fun b!1305976 () Bool)

(declare-fun lt!584429 () Unit!43164)

(assert (=> b!1305976 (= e!745039 lt!584429)))

(assert (=> b!1305976 (= lt!584429 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 (+!4534 lt!584364 (tuple2!22663 lt!584360 zeroValue!1387))) lt!584367))))

(assert (=> b!1305976 (isDefined!512 (getValueByKey!703 (toList!10179 (+!4534 lt!584364 (tuple2!22663 lt!584360 zeroValue!1387))) lt!584367))))

(declare-fun b!1305977 () Bool)

(declare-fun Unit!43175 () Unit!43164)

(assert (=> b!1305977 (= e!745039 Unit!43175)))

(declare-fun b!1305978 () Bool)

(assert (=> b!1305978 (= e!745040 (isDefined!512 (getValueByKey!703 (toList!10179 (+!4534 lt!584364 (tuple2!22663 lt!584360 zeroValue!1387))) lt!584367)))))

(assert (= (and d!142321 c!125672) b!1305976))

(assert (= (and d!142321 (not c!125672)) b!1305977))

(assert (= (and d!142321 (not res!866960)) b!1305978))

(declare-fun m!1197279 () Bool)

(assert (=> d!142321 m!1197279))

(declare-fun m!1197281 () Bool)

(assert (=> b!1305976 m!1197281))

(declare-fun m!1197283 () Bool)

(assert (=> b!1305976 m!1197283))

(assert (=> b!1305976 m!1197283))

(declare-fun m!1197285 () Bool)

(assert (=> b!1305976 m!1197285))

(assert (=> b!1305978 m!1197283))

(assert (=> b!1305978 m!1197283))

(assert (=> b!1305978 m!1197285))

(assert (=> b!1305905 d!142321))

(declare-fun d!142323 () Bool)

(assert (=> d!142323 (contains!8331 (+!4534 lt!584364 (tuple2!22663 lt!584360 zeroValue!1387)) lt!584367)))

(declare-fun lt!584433 () Unit!43164)

(declare-fun choose!1933 (ListLongMap!20327 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43164)

(assert (=> d!142323 (= lt!584433 (choose!1933 lt!584364 lt!584360 zeroValue!1387 lt!584367))))

(assert (=> d!142323 (contains!8331 lt!584364 lt!584367)))

(assert (=> d!142323 (= (addStillContains!1120 lt!584364 lt!584360 zeroValue!1387 lt!584367) lt!584433)))

(declare-fun bs!37174 () Bool)

(assert (= bs!37174 d!142323))

(assert (=> bs!37174 m!1197123))

(assert (=> bs!37174 m!1197123))

(assert (=> bs!37174 m!1197125))

(declare-fun m!1197287 () Bool)

(assert (=> bs!37174 m!1197287))

(declare-fun m!1197289 () Bool)

(assert (=> bs!37174 m!1197289))

(assert (=> b!1305905 d!142323))

(declare-fun d!142325 () Bool)

(assert (=> d!142325 (= (apply!1033 (+!4534 lt!584371 (tuple2!22663 lt!584363 minValue!1387)) lt!584354) (apply!1033 lt!584371 lt!584354))))

(declare-fun lt!584436 () Unit!43164)

(declare-fun choose!1934 (ListLongMap!20327 (_ BitVec 64) V!51673 (_ BitVec 64)) Unit!43164)

(assert (=> d!142325 (= lt!584436 (choose!1934 lt!584371 lt!584363 minValue!1387 lt!584354))))

(declare-fun e!745043 () Bool)

(assert (=> d!142325 e!745043))

(declare-fun res!866963 () Bool)

(assert (=> d!142325 (=> (not res!866963) (not e!745043))))

(assert (=> d!142325 (= res!866963 (contains!8331 lt!584371 lt!584354))))

(assert (=> d!142325 (= (addApplyDifferent!562 lt!584371 lt!584363 minValue!1387 lt!584354) lt!584436)))

(declare-fun b!1305983 () Bool)

(assert (=> b!1305983 (= e!745043 (not (= lt!584354 lt!584363)))))

(assert (= (and d!142325 res!866963) b!1305983))

(declare-fun m!1197291 () Bool)

(assert (=> d!142325 m!1197291))

(assert (=> d!142325 m!1197101))

(assert (=> d!142325 m!1197103))

(assert (=> d!142325 m!1197121))

(declare-fun m!1197293 () Bool)

(assert (=> d!142325 m!1197293))

(assert (=> d!142325 m!1197101))

(assert (=> b!1305905 d!142325))

(declare-fun d!142327 () Bool)

(declare-fun e!745044 () Bool)

(assert (=> d!142327 e!745044))

(declare-fun res!866965 () Bool)

(assert (=> d!142327 (=> (not res!866965) (not e!745044))))

(declare-fun lt!584439 () ListLongMap!20327)

(assert (=> d!142327 (= res!866965 (contains!8331 lt!584439 (_1!11342 (tuple2!22663 lt!584360 zeroValue!1387))))))

(declare-fun lt!584438 () List!29808)

(assert (=> d!142327 (= lt!584439 (ListLongMap!20328 lt!584438))))

(declare-fun lt!584440 () Unit!43164)

(declare-fun lt!584437 () Unit!43164)

(assert (=> d!142327 (= lt!584440 lt!584437)))

(assert (=> d!142327 (= (getValueByKey!703 lt!584438 (_1!11342 (tuple2!22663 lt!584360 zeroValue!1387))) (Some!753 (_2!11342 (tuple2!22663 lt!584360 zeroValue!1387))))))

(assert (=> d!142327 (= lt!584437 (lemmaContainsTupThenGetReturnValue!354 lt!584438 (_1!11342 (tuple2!22663 lt!584360 zeroValue!1387)) (_2!11342 (tuple2!22663 lt!584360 zeroValue!1387))))))

(assert (=> d!142327 (= lt!584438 (insertStrictlySorted!483 (toList!10179 lt!584364) (_1!11342 (tuple2!22663 lt!584360 zeroValue!1387)) (_2!11342 (tuple2!22663 lt!584360 zeroValue!1387))))))

(assert (=> d!142327 (= (+!4534 lt!584364 (tuple2!22663 lt!584360 zeroValue!1387)) lt!584439)))

(declare-fun b!1305984 () Bool)

(declare-fun res!866964 () Bool)

(assert (=> b!1305984 (=> (not res!866964) (not e!745044))))

(assert (=> b!1305984 (= res!866964 (= (getValueByKey!703 (toList!10179 lt!584439) (_1!11342 (tuple2!22663 lt!584360 zeroValue!1387))) (Some!753 (_2!11342 (tuple2!22663 lt!584360 zeroValue!1387)))))))

(declare-fun b!1305985 () Bool)

(assert (=> b!1305985 (= e!745044 (contains!8335 (toList!10179 lt!584439) (tuple2!22663 lt!584360 zeroValue!1387)))))

(assert (= (and d!142327 res!866965) b!1305984))

(assert (= (and b!1305984 res!866964) b!1305985))

(declare-fun m!1197295 () Bool)

(assert (=> d!142327 m!1197295))

(declare-fun m!1197297 () Bool)

(assert (=> d!142327 m!1197297))

(declare-fun m!1197299 () Bool)

(assert (=> d!142327 m!1197299))

(declare-fun m!1197301 () Bool)

(assert (=> d!142327 m!1197301))

(declare-fun m!1197303 () Bool)

(assert (=> b!1305984 m!1197303))

(declare-fun m!1197305 () Bool)

(assert (=> b!1305985 m!1197305))

(assert (=> b!1305905 d!142327))

(assert (=> b!1305905 d!142273))

(declare-fun d!142329 () Bool)

(assert (=> d!142329 (= (apply!1033 (+!4534 lt!584355 (tuple2!22663 lt!584357 zeroValue!1387)) lt!584358) (get!21229 (getValueByKey!703 (toList!10179 (+!4534 lt!584355 (tuple2!22663 lt!584357 zeroValue!1387))) lt!584358)))))

(declare-fun bs!37175 () Bool)

(assert (= bs!37175 d!142329))

(declare-fun m!1197307 () Bool)

(assert (=> bs!37175 m!1197307))

(assert (=> bs!37175 m!1197307))

(declare-fun m!1197309 () Bool)

(assert (=> bs!37175 m!1197309))

(assert (=> b!1305905 d!142329))

(declare-fun d!142331 () Bool)

(declare-fun e!745045 () Bool)

(assert (=> d!142331 e!745045))

(declare-fun res!866967 () Bool)

(assert (=> d!142331 (=> (not res!866967) (not e!745045))))

(declare-fun lt!584443 () ListLongMap!20327)

(assert (=> d!142331 (= res!866967 (contains!8331 lt!584443 (_1!11342 (tuple2!22663 lt!584366 minValue!1387))))))

(declare-fun lt!584442 () List!29808)

(assert (=> d!142331 (= lt!584443 (ListLongMap!20328 lt!584442))))

(declare-fun lt!584444 () Unit!43164)

(declare-fun lt!584441 () Unit!43164)

(assert (=> d!142331 (= lt!584444 lt!584441)))

(assert (=> d!142331 (= (getValueByKey!703 lt!584442 (_1!11342 (tuple2!22663 lt!584366 minValue!1387))) (Some!753 (_2!11342 (tuple2!22663 lt!584366 minValue!1387))))))

(assert (=> d!142331 (= lt!584441 (lemmaContainsTupThenGetReturnValue!354 lt!584442 (_1!11342 (tuple2!22663 lt!584366 minValue!1387)) (_2!11342 (tuple2!22663 lt!584366 minValue!1387))))))

(assert (=> d!142331 (= lt!584442 (insertStrictlySorted!483 (toList!10179 lt!584369) (_1!11342 (tuple2!22663 lt!584366 minValue!1387)) (_2!11342 (tuple2!22663 lt!584366 minValue!1387))))))

(assert (=> d!142331 (= (+!4534 lt!584369 (tuple2!22663 lt!584366 minValue!1387)) lt!584443)))

(declare-fun b!1305986 () Bool)

(declare-fun res!866966 () Bool)

(assert (=> b!1305986 (=> (not res!866966) (not e!745045))))

(assert (=> b!1305986 (= res!866966 (= (getValueByKey!703 (toList!10179 lt!584443) (_1!11342 (tuple2!22663 lt!584366 minValue!1387))) (Some!753 (_2!11342 (tuple2!22663 lt!584366 minValue!1387)))))))

(declare-fun b!1305987 () Bool)

(assert (=> b!1305987 (= e!745045 (contains!8335 (toList!10179 lt!584443) (tuple2!22663 lt!584366 minValue!1387)))))

(assert (= (and d!142331 res!866967) b!1305986))

(assert (= (and b!1305986 res!866966) b!1305987))

(declare-fun m!1197311 () Bool)

(assert (=> d!142331 m!1197311))

(declare-fun m!1197313 () Bool)

(assert (=> d!142331 m!1197313))

(declare-fun m!1197315 () Bool)

(assert (=> d!142331 m!1197315))

(declare-fun m!1197317 () Bool)

(assert (=> d!142331 m!1197317))

(declare-fun m!1197319 () Bool)

(assert (=> b!1305986 m!1197319))

(declare-fun m!1197321 () Bool)

(assert (=> b!1305987 m!1197321))

(assert (=> b!1305905 d!142331))

(declare-fun d!142333 () Bool)

(assert (=> d!142333 (= (apply!1033 lt!584369 lt!584359) (get!21229 (getValueByKey!703 (toList!10179 lt!584369) lt!584359)))))

(declare-fun bs!37176 () Bool)

(assert (= bs!37176 d!142333))

(declare-fun m!1197323 () Bool)

(assert (=> bs!37176 m!1197323))

(assert (=> bs!37176 m!1197323))

(declare-fun m!1197325 () Bool)

(assert (=> bs!37176 m!1197325))

(assert (=> b!1305905 d!142333))

(declare-fun d!142335 () Bool)

(assert (=> d!142335 (= (apply!1033 lt!584371 lt!584354) (get!21229 (getValueByKey!703 (toList!10179 lt!584371) lt!584354)))))

(declare-fun bs!37177 () Bool)

(assert (= bs!37177 d!142335))

(declare-fun m!1197327 () Bool)

(assert (=> bs!37177 m!1197327))

(assert (=> bs!37177 m!1197327))

(declare-fun m!1197329 () Bool)

(assert (=> bs!37177 m!1197329))

(assert (=> b!1305905 d!142335))

(declare-fun d!142337 () Bool)

(assert (=> d!142337 (= (apply!1033 lt!584355 lt!584358) (get!21229 (getValueByKey!703 (toList!10179 lt!584355) lt!584358)))))

(declare-fun bs!37178 () Bool)

(assert (= bs!37178 d!142337))

(declare-fun m!1197331 () Bool)

(assert (=> bs!37178 m!1197331))

(assert (=> bs!37178 m!1197331))

(declare-fun m!1197333 () Bool)

(assert (=> bs!37178 m!1197333))

(assert (=> b!1305905 d!142337))

(declare-fun d!142339 () Bool)

(assert (=> d!142339 (= (apply!1033 (+!4534 lt!584355 (tuple2!22663 lt!584357 zeroValue!1387)) lt!584358) (apply!1033 lt!584355 lt!584358))))

(declare-fun lt!584445 () Unit!43164)

(assert (=> d!142339 (= lt!584445 (choose!1934 lt!584355 lt!584357 zeroValue!1387 lt!584358))))

(declare-fun e!745046 () Bool)

(assert (=> d!142339 e!745046))

(declare-fun res!866968 () Bool)

(assert (=> d!142339 (=> (not res!866968) (not e!745046))))

(assert (=> d!142339 (= res!866968 (contains!8331 lt!584355 lt!584358))))

(assert (=> d!142339 (= (addApplyDifferent!562 lt!584355 lt!584357 zeroValue!1387 lt!584358) lt!584445)))

(declare-fun b!1305988 () Bool)

(assert (=> b!1305988 (= e!745046 (not (= lt!584358 lt!584357)))))

(assert (= (and d!142339 res!866968) b!1305988))

(declare-fun m!1197335 () Bool)

(assert (=> d!142339 m!1197335))

(assert (=> d!142339 m!1197107))

(assert (=> d!142339 m!1197109))

(assert (=> d!142339 m!1197105))

(declare-fun m!1197337 () Bool)

(assert (=> d!142339 m!1197337))

(assert (=> d!142339 m!1197107))

(assert (=> b!1305905 d!142339))

(declare-fun d!142341 () Bool)

(assert (=> d!142341 (= (apply!1033 (+!4534 lt!584371 (tuple2!22663 lt!584363 minValue!1387)) lt!584354) (get!21229 (getValueByKey!703 (toList!10179 (+!4534 lt!584371 (tuple2!22663 lt!584363 minValue!1387))) lt!584354)))))

(declare-fun bs!37179 () Bool)

(assert (= bs!37179 d!142341))

(declare-fun m!1197339 () Bool)

(assert (=> bs!37179 m!1197339))

(assert (=> bs!37179 m!1197339))

(declare-fun m!1197341 () Bool)

(assert (=> bs!37179 m!1197341))

(assert (=> b!1305905 d!142341))

(declare-fun d!142343 () Bool)

(assert (=> d!142343 (= (apply!1033 (+!4534 lt!584369 (tuple2!22663 lt!584366 minValue!1387)) lt!584359) (apply!1033 lt!584369 lt!584359))))

(declare-fun lt!584446 () Unit!43164)

(assert (=> d!142343 (= lt!584446 (choose!1934 lt!584369 lt!584366 minValue!1387 lt!584359))))

(declare-fun e!745047 () Bool)

(assert (=> d!142343 e!745047))

(declare-fun res!866969 () Bool)

(assert (=> d!142343 (=> (not res!866969) (not e!745047))))

(assert (=> d!142343 (= res!866969 (contains!8331 lt!584369 lt!584359))))

(assert (=> d!142343 (= (addApplyDifferent!562 lt!584369 lt!584366 minValue!1387 lt!584359) lt!584446)))

(declare-fun b!1305989 () Bool)

(assert (=> b!1305989 (= e!745047 (not (= lt!584359 lt!584366)))))

(assert (= (and d!142343 res!866969) b!1305989))

(declare-fun m!1197343 () Bool)

(assert (=> d!142343 m!1197343))

(assert (=> d!142343 m!1197127))

(assert (=> d!142343 m!1197129))

(assert (=> d!142343 m!1197111))

(declare-fun m!1197345 () Bool)

(assert (=> d!142343 m!1197345))

(assert (=> d!142343 m!1197127))

(assert (=> b!1305905 d!142343))

(declare-fun d!142345 () Bool)

(declare-fun e!745048 () Bool)

(assert (=> d!142345 e!745048))

(declare-fun res!866971 () Bool)

(assert (=> d!142345 (=> (not res!866971) (not e!745048))))

(declare-fun lt!584449 () ListLongMap!20327)

(assert (=> d!142345 (= res!866971 (contains!8331 lt!584449 (_1!11342 (tuple2!22663 lt!584363 minValue!1387))))))

(declare-fun lt!584448 () List!29808)

(assert (=> d!142345 (= lt!584449 (ListLongMap!20328 lt!584448))))

(declare-fun lt!584450 () Unit!43164)

(declare-fun lt!584447 () Unit!43164)

(assert (=> d!142345 (= lt!584450 lt!584447)))

(assert (=> d!142345 (= (getValueByKey!703 lt!584448 (_1!11342 (tuple2!22663 lt!584363 minValue!1387))) (Some!753 (_2!11342 (tuple2!22663 lt!584363 minValue!1387))))))

(assert (=> d!142345 (= lt!584447 (lemmaContainsTupThenGetReturnValue!354 lt!584448 (_1!11342 (tuple2!22663 lt!584363 minValue!1387)) (_2!11342 (tuple2!22663 lt!584363 minValue!1387))))))

(assert (=> d!142345 (= lt!584448 (insertStrictlySorted!483 (toList!10179 lt!584371) (_1!11342 (tuple2!22663 lt!584363 minValue!1387)) (_2!11342 (tuple2!22663 lt!584363 minValue!1387))))))

(assert (=> d!142345 (= (+!4534 lt!584371 (tuple2!22663 lt!584363 minValue!1387)) lt!584449)))

(declare-fun b!1305990 () Bool)

(declare-fun res!866970 () Bool)

(assert (=> b!1305990 (=> (not res!866970) (not e!745048))))

(assert (=> b!1305990 (= res!866970 (= (getValueByKey!703 (toList!10179 lt!584449) (_1!11342 (tuple2!22663 lt!584363 minValue!1387))) (Some!753 (_2!11342 (tuple2!22663 lt!584363 minValue!1387)))))))

(declare-fun b!1305991 () Bool)

(assert (=> b!1305991 (= e!745048 (contains!8335 (toList!10179 lt!584449) (tuple2!22663 lt!584363 minValue!1387)))))

(assert (= (and d!142345 res!866971) b!1305990))

(assert (= (and b!1305990 res!866970) b!1305991))

(declare-fun m!1197347 () Bool)

(assert (=> d!142345 m!1197347))

(declare-fun m!1197349 () Bool)

(assert (=> d!142345 m!1197349))

(declare-fun m!1197351 () Bool)

(assert (=> d!142345 m!1197351))

(declare-fun m!1197353 () Bool)

(assert (=> d!142345 m!1197353))

(declare-fun m!1197355 () Bool)

(assert (=> b!1305990 m!1197355))

(declare-fun m!1197357 () Bool)

(assert (=> b!1305991 m!1197357))

(assert (=> b!1305905 d!142345))

(declare-fun d!142347 () Bool)

(assert (=> d!142347 (= (apply!1033 (+!4534 lt!584369 (tuple2!22663 lt!584366 minValue!1387)) lt!584359) (get!21229 (getValueByKey!703 (toList!10179 (+!4534 lt!584369 (tuple2!22663 lt!584366 minValue!1387))) lt!584359)))))

(declare-fun bs!37180 () Bool)

(assert (= bs!37180 d!142347))

(declare-fun m!1197359 () Bool)

(assert (=> bs!37180 m!1197359))

(assert (=> bs!37180 m!1197359))

(declare-fun m!1197361 () Bool)

(assert (=> bs!37180 m!1197361))

(assert (=> b!1305905 d!142347))

(declare-fun d!142349 () Bool)

(declare-fun e!745049 () Bool)

(assert (=> d!142349 e!745049))

(declare-fun res!866973 () Bool)

(assert (=> d!142349 (=> (not res!866973) (not e!745049))))

(declare-fun lt!584453 () ListLongMap!20327)

(assert (=> d!142349 (= res!866973 (contains!8331 lt!584453 (_1!11342 (tuple2!22663 lt!584357 zeroValue!1387))))))

(declare-fun lt!584452 () List!29808)

(assert (=> d!142349 (= lt!584453 (ListLongMap!20328 lt!584452))))

(declare-fun lt!584454 () Unit!43164)

(declare-fun lt!584451 () Unit!43164)

(assert (=> d!142349 (= lt!584454 lt!584451)))

(assert (=> d!142349 (= (getValueByKey!703 lt!584452 (_1!11342 (tuple2!22663 lt!584357 zeroValue!1387))) (Some!753 (_2!11342 (tuple2!22663 lt!584357 zeroValue!1387))))))

(assert (=> d!142349 (= lt!584451 (lemmaContainsTupThenGetReturnValue!354 lt!584452 (_1!11342 (tuple2!22663 lt!584357 zeroValue!1387)) (_2!11342 (tuple2!22663 lt!584357 zeroValue!1387))))))

(assert (=> d!142349 (= lt!584452 (insertStrictlySorted!483 (toList!10179 lt!584355) (_1!11342 (tuple2!22663 lt!584357 zeroValue!1387)) (_2!11342 (tuple2!22663 lt!584357 zeroValue!1387))))))

(assert (=> d!142349 (= (+!4534 lt!584355 (tuple2!22663 lt!584357 zeroValue!1387)) lt!584453)))

(declare-fun b!1305992 () Bool)

(declare-fun res!866972 () Bool)

(assert (=> b!1305992 (=> (not res!866972) (not e!745049))))

(assert (=> b!1305992 (= res!866972 (= (getValueByKey!703 (toList!10179 lt!584453) (_1!11342 (tuple2!22663 lt!584357 zeroValue!1387))) (Some!753 (_2!11342 (tuple2!22663 lt!584357 zeroValue!1387)))))))

(declare-fun b!1305993 () Bool)

(assert (=> b!1305993 (= e!745049 (contains!8335 (toList!10179 lt!584453) (tuple2!22663 lt!584357 zeroValue!1387)))))

(assert (= (and d!142349 res!866973) b!1305992))

(assert (= (and b!1305992 res!866972) b!1305993))

(declare-fun m!1197363 () Bool)

(assert (=> d!142349 m!1197363))

(declare-fun m!1197365 () Bool)

(assert (=> d!142349 m!1197365))

(declare-fun m!1197367 () Bool)

(assert (=> d!142349 m!1197367))

(declare-fun m!1197369 () Bool)

(assert (=> d!142349 m!1197369))

(declare-fun m!1197371 () Bool)

(assert (=> b!1305992 m!1197371))

(declare-fun m!1197373 () Bool)

(assert (=> b!1305993 m!1197373))

(assert (=> b!1305905 d!142349))

(assert (=> b!1305780 d!142303))

(assert (=> b!1305839 d!142269))

(declare-fun d!142351 () Bool)

(assert (=> d!142351 (arrayContainsKey!0 _keys!1741 lt!584268 #b00000000000000000000000000000000)))

(declare-fun lt!584457 () Unit!43164)

(declare-fun choose!13 (array!86913 (_ BitVec 64) (_ BitVec 32)) Unit!43164)

(assert (=> d!142351 (= lt!584457 (choose!13 _keys!1741 lt!584268 #b00000000000000000000000000000000))))

(assert (=> d!142351 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!142351 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584268 #b00000000000000000000000000000000) lt!584457)))

(declare-fun bs!37181 () Bool)

(assert (= bs!37181 d!142351))

(assert (=> bs!37181 m!1197043))

(declare-fun m!1197375 () Bool)

(assert (=> bs!37181 m!1197375))

(assert (=> b!1305781 d!142351))

(declare-fun d!142353 () Bool)

(declare-fun res!866978 () Bool)

(declare-fun e!745054 () Bool)

(assert (=> d!142353 (=> res!866978 e!745054)))

(assert (=> d!142353 (= res!866978 (= (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) lt!584268))))

(assert (=> d!142353 (= (arrayContainsKey!0 _keys!1741 lt!584268 #b00000000000000000000000000000000) e!745054)))

(declare-fun b!1305998 () Bool)

(declare-fun e!745055 () Bool)

(assert (=> b!1305998 (= e!745054 e!745055)))

(declare-fun res!866979 () Bool)

(assert (=> b!1305998 (=> (not res!866979) (not e!745055))))

(assert (=> b!1305998 (= res!866979 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(declare-fun b!1305999 () Bool)

(assert (=> b!1305999 (= e!745055 (arrayContainsKey!0 _keys!1741 lt!584268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!142353 (not res!866978)) b!1305998))

(assert (= (and b!1305998 res!866979) b!1305999))

(assert (=> d!142353 m!1197035))

(declare-fun m!1197377 () Bool)

(assert (=> b!1305999 m!1197377))

(assert (=> b!1305781 d!142353))

(declare-fun b!1306012 () Bool)

(declare-fun e!745062 () SeekEntryResult!9983)

(declare-fun e!745064 () SeekEntryResult!9983)

(assert (=> b!1306012 (= e!745062 e!745064)))

(declare-fun lt!584466 () (_ BitVec 64))

(declare-fun lt!584464 () SeekEntryResult!9983)

(assert (=> b!1306012 (= lt!584466 (select (arr!41941 _keys!1741) (index!42305 lt!584464)))))

(declare-fun c!125679 () Bool)

(assert (=> b!1306012 (= c!125679 (= lt!584466 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306013 () Bool)

(declare-fun e!745063 () SeekEntryResult!9983)

(assert (=> b!1306013 (= e!745063 (MissingZero!9983 (index!42305 lt!584464)))))

(declare-fun b!1306014 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86913 (_ BitVec 32)) SeekEntryResult!9983)

(assert (=> b!1306014 (= e!745063 (seekKeyOrZeroReturnVacant!0 (x!115839 lt!584464) (index!42305 lt!584464) (index!42305 lt!584464) (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun d!142355 () Bool)

(declare-fun lt!584465 () SeekEntryResult!9983)

(assert (=> d!142355 (and (or ((_ is Undefined!9983) lt!584465) (not ((_ is Found!9983) lt!584465)) (and (bvsge (index!42304 lt!584465) #b00000000000000000000000000000000) (bvslt (index!42304 lt!584465) (size!42492 _keys!1741)))) (or ((_ is Undefined!9983) lt!584465) ((_ is Found!9983) lt!584465) (not ((_ is MissingZero!9983) lt!584465)) (and (bvsge (index!42303 lt!584465) #b00000000000000000000000000000000) (bvslt (index!42303 lt!584465) (size!42492 _keys!1741)))) (or ((_ is Undefined!9983) lt!584465) ((_ is Found!9983) lt!584465) ((_ is MissingZero!9983) lt!584465) (not ((_ is MissingVacant!9983) lt!584465)) (and (bvsge (index!42306 lt!584465) #b00000000000000000000000000000000) (bvslt (index!42306 lt!584465) (size!42492 _keys!1741)))) (or ((_ is Undefined!9983) lt!584465) (ite ((_ is Found!9983) lt!584465) (= (select (arr!41941 _keys!1741) (index!42304 lt!584465)) (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9983) lt!584465) (= (select (arr!41941 _keys!1741) (index!42303 lt!584465)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9983) lt!584465) (= (select (arr!41941 _keys!1741) (index!42306 lt!584465)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142355 (= lt!584465 e!745062)))

(declare-fun c!125681 () Bool)

(assert (=> d!142355 (= c!125681 (and ((_ is Intermediate!9983) lt!584464) (undefined!10795 lt!584464)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86913 (_ BitVec 32)) SeekEntryResult!9983)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!142355 (= lt!584464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!142355 (validMask!0 mask!2175)))

(assert (=> d!142355 (= (seekEntryOrOpen!0 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!584465)))

(declare-fun b!1306015 () Bool)

(assert (=> b!1306015 (= e!745062 Undefined!9983)))

(declare-fun b!1306016 () Bool)

(assert (=> b!1306016 (= e!745064 (Found!9983 (index!42305 lt!584464)))))

(declare-fun b!1306017 () Bool)

(declare-fun c!125680 () Bool)

(assert (=> b!1306017 (= c!125680 (= lt!584466 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1306017 (= e!745064 e!745063)))

(assert (= (and d!142355 c!125681) b!1306015))

(assert (= (and d!142355 (not c!125681)) b!1306012))

(assert (= (and b!1306012 c!125679) b!1306016))

(assert (= (and b!1306012 (not c!125679)) b!1306017))

(assert (= (and b!1306017 c!125680) b!1306013))

(assert (= (and b!1306017 (not c!125680)) b!1306014))

(declare-fun m!1197379 () Bool)

(assert (=> b!1306012 m!1197379))

(assert (=> b!1306014 m!1197035))

(declare-fun m!1197381 () Bool)

(assert (=> b!1306014 m!1197381))

(declare-fun m!1197383 () Bool)

(assert (=> d!142355 m!1197383))

(assert (=> d!142355 m!1196959))

(declare-fun m!1197385 () Bool)

(assert (=> d!142355 m!1197385))

(declare-fun m!1197387 () Bool)

(assert (=> d!142355 m!1197387))

(assert (=> d!142355 m!1197035))

(declare-fun m!1197389 () Bool)

(assert (=> d!142355 m!1197389))

(assert (=> d!142355 m!1197035))

(assert (=> d!142355 m!1197387))

(declare-fun m!1197391 () Bool)

(assert (=> d!142355 m!1197391))

(assert (=> b!1305781 d!142355))

(declare-fun d!142357 () Bool)

(declare-fun lt!584469 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!646 (List!29807) (InoxSet (_ BitVec 64)))

(assert (=> d!142357 (= lt!584469 (select (content!646 Nil!29804) (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!745069 () Bool)

(assert (=> d!142357 (= lt!584469 e!745069)))

(declare-fun res!866984 () Bool)

(assert (=> d!142357 (=> (not res!866984) (not e!745069))))

(assert (=> d!142357 (= res!866984 ((_ is Cons!29803) Nil!29804))))

(assert (=> d!142357 (= (contains!8334 Nil!29804 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)) lt!584469)))

(declare-fun b!1306022 () Bool)

(declare-fun e!745070 () Bool)

(assert (=> b!1306022 (= e!745069 e!745070)))

(declare-fun res!866985 () Bool)

(assert (=> b!1306022 (=> res!866985 e!745070)))

(assert (=> b!1306022 (= res!866985 (= (h!31021 Nil!29804) (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1306023 () Bool)

(assert (=> b!1306023 (= e!745070 (contains!8334 (t!43397 Nil!29804) (select (arr!41941 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142357 res!866984) b!1306022))

(assert (= (and b!1306022 (not res!866985)) b!1306023))

(declare-fun m!1197393 () Bool)

(assert (=> d!142357 m!1197393))

(assert (=> d!142357 m!1197035))

(declare-fun m!1197395 () Bool)

(assert (=> d!142357 m!1197395))

(assert (=> b!1306023 m!1197035))

(declare-fun m!1197397 () Bool)

(assert (=> b!1306023 m!1197397))

(assert (=> b!1305796 d!142357))

(declare-fun d!142359 () Bool)

(assert (=> d!142359 (isDefined!512 (getValueByKey!703 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!584472 () Unit!43164)

(declare-fun choose!1935 (List!29808 (_ BitVec 64)) Unit!43164)

(assert (=> d!142359 (= lt!584472 (choose!1935 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!745073 () Bool)

(assert (=> d!142359 e!745073))

(declare-fun res!866988 () Bool)

(assert (=> d!142359 (=> (not res!866988) (not e!745073))))

(declare-fun isStrictlySorted!862 (List!29808) Bool)

(assert (=> d!142359 (= res!866988 (isStrictlySorted!862 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!142359 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!584472)))

(declare-fun b!1306026 () Bool)

(assert (=> b!1306026 (= e!745073 (containsKey!729 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!142359 res!866988) b!1306026))

(assert (=> d!142359 m!1197055))

(assert (=> d!142359 m!1197055))

(assert (=> d!142359 m!1197057))

(declare-fun m!1197399 () Bool)

(assert (=> d!142359 m!1197399))

(declare-fun m!1197401 () Bool)

(assert (=> d!142359 m!1197401))

(assert (=> b!1306026 m!1197051))

(assert (=> b!1305805 d!142359))

(declare-fun d!142361 () Bool)

(declare-fun isEmpty!1071 (Option!754) Bool)

(assert (=> d!142361 (= (isDefined!512 (getValueByKey!703 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1071 (getValueByKey!703 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37182 () Bool)

(assert (= bs!37182 d!142361))

(assert (=> bs!37182 m!1197055))

(declare-fun m!1197403 () Bool)

(assert (=> bs!37182 m!1197403))

(assert (=> b!1305805 d!142361))

(declare-fun c!125686 () Bool)

(declare-fun d!142363 () Bool)

(assert (=> d!142363 (= c!125686 (and ((_ is Cons!29804) (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11342 (h!31022 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun e!745078 () Option!754)

(assert (=> d!142363 (= (getValueByKey!703 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!745078)))

(declare-fun b!1306035 () Bool)

(assert (=> b!1306035 (= e!745078 (Some!753 (_2!11342 (h!31022 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1306038 () Bool)

(declare-fun e!745079 () Option!754)

(assert (=> b!1306038 (= e!745079 None!752)))

(declare-fun b!1306036 () Bool)

(assert (=> b!1306036 (= e!745078 e!745079)))

(declare-fun c!125687 () Bool)

(assert (=> b!1306036 (= c!125687 (and ((_ is Cons!29804) (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11342 (h!31022 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1306037 () Bool)

(assert (=> b!1306037 (= e!745079 (getValueByKey!703 (t!43398 (toList!10179 (getCurrentListMapNoExtraKeys!6173 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!142363 c!125686) b!1306035))

(assert (= (and d!142363 (not c!125686)) b!1306036))

(assert (= (and b!1306036 c!125687) b!1306037))

(assert (= (and b!1306036 (not c!125687)) b!1306038))

(declare-fun m!1197405 () Bool)

(assert (=> b!1306037 m!1197405))

(assert (=> b!1305805 d!142363))

(assert (=> b!1305794 d!142303))

(assert (=> b!1305838 d!142269))

(declare-fun d!142365 () Bool)

(assert (=> d!142365 (= (isDefined!512 (getValueByKey!703 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1071 (getValueByKey!703 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37183 () Bool)

(assert (= bs!37183 d!142365))

(assert (=> bs!37183 m!1197089))

(declare-fun m!1197407 () Bool)

(assert (=> bs!37183 m!1197407))

(assert (=> b!1305848 d!142365))

(declare-fun d!142367 () Bool)

(declare-fun c!125688 () Bool)

(assert (=> d!142367 (= c!125688 (and ((_ is Cons!29804) (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11342 (h!31022 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun e!745080 () Option!754)

(assert (=> d!142367 (= (getValueByKey!703 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!745080)))

(declare-fun b!1306039 () Bool)

(assert (=> b!1306039 (= e!745080 (Some!753 (_2!11342 (h!31022 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1306042 () Bool)

(declare-fun e!745081 () Option!754)

(assert (=> b!1306042 (= e!745081 None!752)))

(declare-fun b!1306040 () Bool)

(assert (=> b!1306040 (= e!745080 e!745081)))

(declare-fun c!125689 () Bool)

(assert (=> b!1306040 (= c!125689 (and ((_ is Cons!29804) (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11342 (h!31022 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1306041 () Bool)

(assert (=> b!1306041 (= e!745081 (getValueByKey!703 (t!43398 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!142367 c!125688) b!1306039))

(assert (= (and d!142367 (not c!125688)) b!1306040))

(assert (= (and b!1306040 c!125689) b!1306041))

(assert (= (and b!1306040 (not c!125689)) b!1306042))

(declare-fun m!1197409 () Bool)

(assert (=> b!1306041 m!1197409))

(assert (=> b!1305848 d!142367))

(assert (=> b!1305807 d!142361))

(assert (=> b!1305807 d!142363))

(declare-fun d!142369 () Bool)

(declare-fun e!745083 () Bool)

(assert (=> d!142369 e!745083))

(declare-fun res!866989 () Bool)

(assert (=> d!142369 (=> res!866989 e!745083)))

(declare-fun lt!584474 () Bool)

(assert (=> d!142369 (= res!866989 (not lt!584474))))

(declare-fun lt!584476 () Bool)

(assert (=> d!142369 (= lt!584474 lt!584476)))

(declare-fun lt!584473 () Unit!43164)

(declare-fun e!745082 () Unit!43164)

(assert (=> d!142369 (= lt!584473 e!745082)))

(declare-fun c!125690 () Bool)

(assert (=> d!142369 (= c!125690 lt!584476)))

(assert (=> d!142369 (= lt!584476 (containsKey!729 (toList!10179 lt!584303) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142369 (= (contains!8331 lt!584303 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584474)))

(declare-fun b!1306043 () Bool)

(declare-fun lt!584475 () Unit!43164)

(assert (=> b!1306043 (= e!745082 lt!584475)))

(assert (=> b!1306043 (= lt!584475 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 lt!584303) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1306043 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584303) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306044 () Bool)

(declare-fun Unit!43176 () Unit!43164)

(assert (=> b!1306044 (= e!745082 Unit!43176)))

(declare-fun b!1306045 () Bool)

(assert (=> b!1306045 (= e!745083 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142369 c!125690) b!1306043))

(assert (= (and d!142369 (not c!125690)) b!1306044))

(assert (= (and d!142369 (not res!866989)) b!1306045))

(declare-fun m!1197411 () Bool)

(assert (=> d!142369 m!1197411))

(declare-fun m!1197413 () Bool)

(assert (=> b!1306043 m!1197413))

(declare-fun m!1197415 () Bool)

(assert (=> b!1306043 m!1197415))

(assert (=> b!1306043 m!1197415))

(declare-fun m!1197417 () Bool)

(assert (=> b!1306043 m!1197417))

(assert (=> b!1306045 m!1197415))

(assert (=> b!1306045 m!1197415))

(assert (=> b!1306045 m!1197417))

(assert (=> b!1305842 d!142369))

(declare-fun b!1306046 () Bool)

(declare-fun e!745084 () Bool)

(declare-fun e!745086 () Bool)

(assert (=> b!1306046 (= e!745084 e!745086)))

(declare-fun c!125691 () Bool)

(assert (=> b!1306046 (= c!125691 (validKeyInArray!0 (select (arr!41941 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64363 () Bool)

(declare-fun call!64366 () Bool)

(assert (=> bm!64363 (= call!64366 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1306048 () Bool)

(declare-fun e!745085 () Bool)

(assert (=> b!1306048 (= e!745085 call!64366)))

(declare-fun b!1306049 () Bool)

(assert (=> b!1306049 (= e!745086 call!64366)))

(declare-fun b!1306047 () Bool)

(assert (=> b!1306047 (= e!745086 e!745085)))

(declare-fun lt!584477 () (_ BitVec 64))

(assert (=> b!1306047 (= lt!584477 (select (arr!41941 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!584479 () Unit!43164)

(assert (=> b!1306047 (= lt!584479 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584477 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1306047 (arrayContainsKey!0 _keys!1741 lt!584477 #b00000000000000000000000000000000)))

(declare-fun lt!584478 () Unit!43164)

(assert (=> b!1306047 (= lt!584478 lt!584479)))

(declare-fun res!866990 () Bool)

(assert (=> b!1306047 (= res!866990 (= (seekEntryOrOpen!0 (select (arr!41941 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!9983 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1306047 (=> (not res!866990) (not e!745085))))

(declare-fun d!142371 () Bool)

(declare-fun res!866991 () Bool)

(assert (=> d!142371 (=> res!866991 e!745084)))

(assert (=> d!142371 (= res!866991 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(assert (=> d!142371 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!745084)))

(assert (= (and d!142371 (not res!866991)) b!1306046))

(assert (= (and b!1306046 c!125691) b!1306047))

(assert (= (and b!1306046 (not c!125691)) b!1306049))

(assert (= (and b!1306047 res!866990) b!1306048))

(assert (= (or b!1306048 b!1306049) bm!64363))

(declare-fun m!1197419 () Bool)

(assert (=> b!1306046 m!1197419))

(assert (=> b!1306046 m!1197419))

(declare-fun m!1197421 () Bool)

(assert (=> b!1306046 m!1197421))

(declare-fun m!1197423 () Bool)

(assert (=> bm!64363 m!1197423))

(assert (=> b!1306047 m!1197419))

(declare-fun m!1197425 () Bool)

(assert (=> b!1306047 m!1197425))

(declare-fun m!1197427 () Bool)

(assert (=> b!1306047 m!1197427))

(assert (=> b!1306047 m!1197419))

(declare-fun m!1197429 () Bool)

(assert (=> b!1306047 m!1197429))

(assert (=> bm!64334 d!142371))

(declare-fun b!1306050 () Bool)

(declare-fun e!745088 () Bool)

(declare-fun e!745089 () Bool)

(assert (=> b!1306050 (= e!745088 e!745089)))

(declare-fun c!125692 () Bool)

(assert (=> b!1306050 (= c!125692 (validKeyInArray!0 (select (arr!41941 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1306051 () Bool)

(declare-fun call!64367 () Bool)

(assert (=> b!1306051 (= e!745089 call!64367)))

(declare-fun b!1306052 () Bool)

(declare-fun e!745087 () Bool)

(assert (=> b!1306052 (= e!745087 (contains!8334 (ite c!125626 (Cons!29803 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) Nil!29804) Nil!29804) (select (arr!41941 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64364 () Bool)

(assert (=> bm!64364 (= call!64367 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125692 (Cons!29803 (select (arr!41941 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125626 (Cons!29803 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) Nil!29804) Nil!29804)) (ite c!125626 (Cons!29803 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) Nil!29804) Nil!29804))))))

(declare-fun d!142373 () Bool)

(declare-fun res!866992 () Bool)

(declare-fun e!745090 () Bool)

(assert (=> d!142373 (=> res!866992 e!745090)))

(assert (=> d!142373 (= res!866992 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42492 _keys!1741)))))

(assert (=> d!142373 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125626 (Cons!29803 (select (arr!41941 _keys!1741) #b00000000000000000000000000000000) Nil!29804) Nil!29804)) e!745090)))

(declare-fun b!1306053 () Bool)

(assert (=> b!1306053 (= e!745089 call!64367)))

(declare-fun b!1306054 () Bool)

(assert (=> b!1306054 (= e!745090 e!745088)))

(declare-fun res!866993 () Bool)

(assert (=> b!1306054 (=> (not res!866993) (not e!745088))))

(assert (=> b!1306054 (= res!866993 (not e!745087))))

(declare-fun res!866994 () Bool)

(assert (=> b!1306054 (=> (not res!866994) (not e!745087))))

(assert (=> b!1306054 (= res!866994 (validKeyInArray!0 (select (arr!41941 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!142373 (not res!866992)) b!1306054))

(assert (= (and b!1306054 res!866994) b!1306052))

(assert (= (and b!1306054 res!866993) b!1306050))

(assert (= (and b!1306050 c!125692) b!1306051))

(assert (= (and b!1306050 (not c!125692)) b!1306053))

(assert (= (or b!1306051 b!1306053) bm!64364))

(assert (=> b!1306050 m!1197419))

(assert (=> b!1306050 m!1197419))

(assert (=> b!1306050 m!1197421))

(assert (=> b!1306052 m!1197419))

(assert (=> b!1306052 m!1197419))

(declare-fun m!1197431 () Bool)

(assert (=> b!1306052 m!1197431))

(assert (=> bm!64364 m!1197419))

(declare-fun m!1197433 () Bool)

(assert (=> bm!64364 m!1197433))

(assert (=> b!1306054 m!1197419))

(assert (=> b!1306054 m!1197419))

(assert (=> b!1306054 m!1197421))

(assert (=> bm!64337 d!142373))

(assert (=> b!1305900 d!142269))

(declare-fun d!142375 () Bool)

(declare-fun isEmpty!1072 (List!29808) Bool)

(assert (=> d!142375 (= (isEmpty!1070 lt!584303) (isEmpty!1072 (toList!10179 lt!584303)))))

(declare-fun bs!37184 () Bool)

(assert (= bs!37184 d!142375))

(declare-fun m!1197435 () Bool)

(assert (=> bs!37184 m!1197435))

(assert (=> b!1305834 d!142375))

(declare-fun d!142377 () Bool)

(declare-fun e!745092 () Bool)

(assert (=> d!142377 e!745092))

(declare-fun res!866995 () Bool)

(assert (=> d!142377 (=> res!866995 e!745092)))

(declare-fun lt!584481 () Bool)

(assert (=> d!142377 (= res!866995 (not lt!584481))))

(declare-fun lt!584483 () Bool)

(assert (=> d!142377 (= lt!584481 lt!584483)))

(declare-fun lt!584480 () Unit!43164)

(declare-fun e!745091 () Unit!43164)

(assert (=> d!142377 (= lt!584480 e!745091)))

(declare-fun c!125693 () Bool)

(assert (=> d!142377 (= c!125693 lt!584483)))

(assert (=> d!142377 (= lt!584483 (containsKey!729 (toList!10179 lt!584362) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142377 (= (contains!8331 lt!584362 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584481)))

(declare-fun b!1306055 () Bool)

(declare-fun lt!584482 () Unit!43164)

(assert (=> b!1306055 (= e!745091 lt!584482)))

(assert (=> b!1306055 (= lt!584482 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 lt!584362) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1306055 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584362) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306056 () Bool)

(declare-fun Unit!43177 () Unit!43164)

(assert (=> b!1306056 (= e!745091 Unit!43177)))

(declare-fun b!1306057 () Bool)

(assert (=> b!1306057 (= e!745092 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142377 c!125693) b!1306055))

(assert (= (and d!142377 (not c!125693)) b!1306056))

(assert (= (and d!142377 (not res!866995)) b!1306057))

(declare-fun m!1197437 () Bool)

(assert (=> d!142377 m!1197437))

(declare-fun m!1197439 () Bool)

(assert (=> b!1306055 m!1197439))

(assert (=> b!1306055 m!1197223))

(assert (=> b!1306055 m!1197223))

(declare-fun m!1197441 () Bool)

(assert (=> b!1306055 m!1197441))

(assert (=> b!1306057 m!1197223))

(assert (=> b!1306057 m!1197223))

(assert (=> b!1306057 m!1197441))

(assert (=> bm!64355 d!142377))

(declare-fun d!142379 () Bool)

(declare-fun e!745094 () Bool)

(assert (=> d!142379 e!745094))

(declare-fun res!866996 () Bool)

(assert (=> d!142379 (=> res!866996 e!745094)))

(declare-fun lt!584485 () Bool)

(assert (=> d!142379 (= res!866996 (not lt!584485))))

(declare-fun lt!584487 () Bool)

(assert (=> d!142379 (= lt!584485 lt!584487)))

(declare-fun lt!584484 () Unit!43164)

(declare-fun e!745093 () Unit!43164)

(assert (=> d!142379 (= lt!584484 e!745093)))

(declare-fun c!125694 () Bool)

(assert (=> d!142379 (= c!125694 lt!584487)))

(assert (=> d!142379 (= lt!584487 (containsKey!729 (toList!10179 lt!584362) (select (arr!41941 _keys!1741) from!2144)))))

(assert (=> d!142379 (= (contains!8331 lt!584362 (select (arr!41941 _keys!1741) from!2144)) lt!584485)))

(declare-fun b!1306058 () Bool)

(declare-fun lt!584486 () Unit!43164)

(assert (=> b!1306058 (= e!745093 lt!584486)))

(assert (=> b!1306058 (= lt!584486 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 lt!584362) (select (arr!41941 _keys!1741) from!2144)))))

(assert (=> b!1306058 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584362) (select (arr!41941 _keys!1741) from!2144)))))

(declare-fun b!1306059 () Bool)

(declare-fun Unit!43178 () Unit!43164)

(assert (=> b!1306059 (= e!745093 Unit!43178)))

(declare-fun b!1306060 () Bool)

(assert (=> b!1306060 (= e!745094 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584362) (select (arr!41941 _keys!1741) from!2144))))))

(assert (= (and d!142379 c!125694) b!1306058))

(assert (= (and d!142379 (not c!125694)) b!1306059))

(assert (= (and d!142379 (not res!866996)) b!1306060))

(assert (=> d!142379 m!1196955))

(declare-fun m!1197443 () Bool)

(assert (=> d!142379 m!1197443))

(assert (=> b!1306058 m!1196955))

(declare-fun m!1197445 () Bool)

(assert (=> b!1306058 m!1197445))

(assert (=> b!1306058 m!1196955))

(assert (=> b!1306058 m!1197199))

(assert (=> b!1306058 m!1197199))

(declare-fun m!1197447 () Bool)

(assert (=> b!1306058 m!1197447))

(assert (=> b!1306060 m!1196955))

(assert (=> b!1306060 m!1197199))

(assert (=> b!1306060 m!1197199))

(assert (=> b!1306060 m!1197447))

(assert (=> b!1305910 d!142379))

(declare-fun d!142381 () Bool)

(assert (=> d!142381 (isDefined!512 (getValueByKey!703 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205))))

(declare-fun lt!584488 () Unit!43164)

(assert (=> d!142381 (= lt!584488 (choose!1935 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205))))

(declare-fun e!745095 () Bool)

(assert (=> d!142381 e!745095))

(declare-fun res!866997 () Bool)

(assert (=> d!142381 (=> (not res!866997) (not e!745095))))

(assert (=> d!142381 (= res!866997 (isStrictlySorted!862 (toList!10179 (ListLongMap!20328 Nil!29805))))))

(assert (=> d!142381 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205) lt!584488)))

(declare-fun b!1306061 () Bool)

(assert (=> b!1306061 (= e!745095 (containsKey!729 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205))))

(assert (= (and d!142381 res!866997) b!1306061))

(assert (=> d!142381 m!1197143))

(assert (=> d!142381 m!1197143))

(assert (=> d!142381 m!1197145))

(declare-fun m!1197449 () Bool)

(assert (=> d!142381 m!1197449))

(declare-fun m!1197451 () Bool)

(assert (=> d!142381 m!1197451))

(assert (=> b!1306061 m!1197139))

(assert (=> b!1305912 d!142381))

(declare-fun d!142383 () Bool)

(assert (=> d!142383 (= (isDefined!512 (getValueByKey!703 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205)) (not (isEmpty!1071 (getValueByKey!703 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205))))))

(declare-fun bs!37185 () Bool)

(assert (= bs!37185 d!142383))

(assert (=> bs!37185 m!1197143))

(declare-fun m!1197453 () Bool)

(assert (=> bs!37185 m!1197453))

(assert (=> b!1305912 d!142383))

(declare-fun d!142385 () Bool)

(declare-fun c!125695 () Bool)

(assert (=> d!142385 (= c!125695 (and ((_ is Cons!29804) (toList!10179 (ListLongMap!20328 Nil!29805))) (= (_1!11342 (h!31022 (toList!10179 (ListLongMap!20328 Nil!29805)))) k0!1205)))))

(declare-fun e!745096 () Option!754)

(assert (=> d!142385 (= (getValueByKey!703 (toList!10179 (ListLongMap!20328 Nil!29805)) k0!1205) e!745096)))

(declare-fun b!1306062 () Bool)

(assert (=> b!1306062 (= e!745096 (Some!753 (_2!11342 (h!31022 (toList!10179 (ListLongMap!20328 Nil!29805))))))))

(declare-fun b!1306065 () Bool)

(declare-fun e!745097 () Option!754)

(assert (=> b!1306065 (= e!745097 None!752)))

(declare-fun b!1306063 () Bool)

(assert (=> b!1306063 (= e!745096 e!745097)))

(declare-fun c!125696 () Bool)

(assert (=> b!1306063 (= c!125696 (and ((_ is Cons!29804) (toList!10179 (ListLongMap!20328 Nil!29805))) (not (= (_1!11342 (h!31022 (toList!10179 (ListLongMap!20328 Nil!29805)))) k0!1205))))))

(declare-fun b!1306064 () Bool)

(assert (=> b!1306064 (= e!745097 (getValueByKey!703 (t!43398 (toList!10179 (ListLongMap!20328 Nil!29805))) k0!1205))))

(assert (= (and d!142385 c!125695) b!1306062))

(assert (= (and d!142385 (not c!125695)) b!1306063))

(assert (= (and b!1306063 c!125696) b!1306064))

(assert (= (and b!1306063 (not c!125696)) b!1306065))

(declare-fun m!1197455 () Bool)

(assert (=> b!1306064 m!1197455))

(assert (=> b!1305912 d!142385))

(assert (=> b!1305914 d!142383))

(assert (=> b!1305914 d!142385))

(assert (=> b!1305835 d!142287))

(declare-fun d!142387 () Bool)

(declare-fun e!745099 () Bool)

(assert (=> d!142387 e!745099))

(declare-fun res!866998 () Bool)

(assert (=> d!142387 (=> res!866998 e!745099)))

(declare-fun lt!584490 () Bool)

(assert (=> d!142387 (= res!866998 (not lt!584490))))

(declare-fun lt!584492 () Bool)

(assert (=> d!142387 (= lt!584490 lt!584492)))

(declare-fun lt!584489 () Unit!43164)

(declare-fun e!745098 () Unit!43164)

(assert (=> d!142387 (= lt!584489 e!745098)))

(declare-fun c!125697 () Bool)

(assert (=> d!142387 (= c!125697 lt!584492)))

(assert (=> d!142387 (= lt!584492 (containsKey!729 (toList!10179 lt!584303) (select (arr!41941 _keys!1741) from!2144)))))

(assert (=> d!142387 (= (contains!8331 lt!584303 (select (arr!41941 _keys!1741) from!2144)) lt!584490)))

(declare-fun b!1306066 () Bool)

(declare-fun lt!584491 () Unit!43164)

(assert (=> b!1306066 (= e!745098 lt!584491)))

(assert (=> b!1306066 (= lt!584491 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 lt!584303) (select (arr!41941 _keys!1741) from!2144)))))

(assert (=> b!1306066 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584303) (select (arr!41941 _keys!1741) from!2144)))))

(declare-fun b!1306067 () Bool)

(declare-fun Unit!43179 () Unit!43164)

(assert (=> b!1306067 (= e!745098 Unit!43179)))

(declare-fun b!1306068 () Bool)

(assert (=> b!1306068 (= e!745099 (isDefined!512 (getValueByKey!703 (toList!10179 lt!584303) (select (arr!41941 _keys!1741) from!2144))))))

(assert (= (and d!142387 c!125697) b!1306066))

(assert (= (and d!142387 (not c!125697)) b!1306067))

(assert (= (and d!142387 (not res!866998)) b!1306068))

(assert (=> d!142387 m!1196955))

(declare-fun m!1197457 () Bool)

(assert (=> d!142387 m!1197457))

(assert (=> b!1306066 m!1196955))

(declare-fun m!1197459 () Bool)

(assert (=> b!1306066 m!1197459))

(assert (=> b!1306066 m!1196955))

(assert (=> b!1306066 m!1197191))

(assert (=> b!1306066 m!1197191))

(declare-fun m!1197461 () Bool)

(assert (=> b!1306066 m!1197461))

(assert (=> b!1306068 m!1196955))

(assert (=> b!1306068 m!1197191))

(assert (=> b!1306068 m!1197191))

(assert (=> b!1306068 m!1197461))

(assert (=> b!1305836 d!142387))

(declare-fun d!142389 () Bool)

(assert (=> d!142389 (isDefined!512 (getValueByKey!703 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!584493 () Unit!43164)

(assert (=> d!142389 (= lt!584493 (choose!1935 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!745100 () Bool)

(assert (=> d!142389 e!745100))

(declare-fun res!866999 () Bool)

(assert (=> d!142389 (=> (not res!866999) (not e!745100))))

(assert (=> d!142389 (= res!866999 (isStrictlySorted!862 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!142389 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!584493)))

(declare-fun b!1306069 () Bool)

(assert (=> b!1306069 (= e!745100 (containsKey!729 (toList!10179 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!142389 res!866999) b!1306069))

(assert (=> d!142389 m!1197089))

(assert (=> d!142389 m!1197089))

(assert (=> d!142389 m!1197091))

(declare-fun m!1197463 () Bool)

(assert (=> d!142389 m!1197463))

(declare-fun m!1197465 () Bool)

(assert (=> d!142389 m!1197465))

(assert (=> b!1306069 m!1197085))

(assert (=> b!1305846 d!142389))

(assert (=> b!1305846 d!142365))

(assert (=> b!1305846 d!142367))

(declare-fun mapNonEmpty!54000 () Bool)

(declare-fun mapRes!54000 () Bool)

(declare-fun tp!103035 () Bool)

(declare-fun e!745102 () Bool)

(assert (=> mapNonEmpty!54000 (= mapRes!54000 (and tp!103035 e!745102))))

(declare-fun mapKey!54000 () (_ BitVec 32))

(declare-fun mapRest!54000 () (Array (_ BitVec 32) ValueCell!16565))

(declare-fun mapValue!54000 () ValueCell!16565)

(assert (=> mapNonEmpty!54000 (= mapRest!53999 (store mapRest!54000 mapKey!54000 mapValue!54000))))

(declare-fun mapIsEmpty!54000 () Bool)

(assert (=> mapIsEmpty!54000 mapRes!54000))

(declare-fun condMapEmpty!54000 () Bool)

(declare-fun mapDefault!54000 () ValueCell!16565)

(assert (=> mapNonEmpty!53999 (= condMapEmpty!54000 (= mapRest!53999 ((as const (Array (_ BitVec 32) ValueCell!16565)) mapDefault!54000)))))

(declare-fun e!745101 () Bool)

(assert (=> mapNonEmpty!53999 (= tp!103034 (and e!745101 mapRes!54000))))

(declare-fun b!1306071 () Bool)

(assert (=> b!1306071 (= e!745101 tp_is_empty!34927)))

(declare-fun b!1306070 () Bool)

(assert (=> b!1306070 (= e!745102 tp_is_empty!34927)))

(assert (= (and mapNonEmpty!53999 condMapEmpty!54000) mapIsEmpty!54000))

(assert (= (and mapNonEmpty!53999 (not condMapEmpty!54000)) mapNonEmpty!54000))

(assert (= (and mapNonEmpty!54000 ((_ is ValueCellFull!16565) mapValue!54000)) b!1306070))

(assert (= (and mapNonEmpty!53999 ((_ is ValueCellFull!16565) mapDefault!54000)) b!1306071))

(declare-fun m!1197467 () Bool)

(assert (=> mapNonEmpty!54000 m!1197467))

(declare-fun b_lambda!23317 () Bool)

(assert (= b_lambda!23315 (or (and start!110388 b_free!29287) b_lambda!23317)))

(declare-fun b_lambda!23319 () Bool)

(assert (= b_lambda!23313 (or (and start!110388 b_free!29287) b_lambda!23319)))

(check-sat (not d!142377) (not d!142387) (not d!142361) (not b!1305990) (not b_lambda!23309) (not b!1305942) (not b!1306064) (not b!1305965) (not b!1306057) (not b!1305999) tp_is_empty!34927 (not b!1305931) (not b!1305959) (not b_lambda!23319) (not d!142381) (not b!1305969) (not b!1305960) (not b!1305936) (not d!142305) (not b!1306061) (not b!1306026) (not b!1306046) (not b!1305974) (not d!142301) (not b!1306023) (not b!1306066) (not b!1305993) (not d!142327) (not d!142307) (not d!142331) (not b!1305939) (not d!142345) (not b!1306058) (not mapNonEmpty!54000) (not d!142369) (not d!142289) (not d!142309) (not b!1305985) (not d!142355) (not b!1305984) (not b!1305932) (not b!1306069) (not d!142375) (not b!1305987) (not d!142383) (not b!1306055) (not b!1306050) (not d!142325) (not bm!64363) (not b_lambda!23311) (not d!142323) (not d!142295) (not b!1305967) (not d!142329) (not d!142291) (not b!1306047) (not b!1306041) (not b!1305992) (not d!142333) (not b!1305986) (not bm!64362) (not b!1306060) (not b_lambda!23317) (not d!142319) (not b!1305928) (not b_next!29287) (not d!142343) (not b!1305991) (not b!1306068) (not b!1305935) (not d!142317) (not d!142297) (not d!142351) (not d!142335) (not d!142341) (not b!1306014) (not d!142285) (not b!1305975) (not b!1305934) (not b!1305978) (not b!1305958) (not bm!64364) (not d!142311) (not b_lambda!23307) (not d!142347) (not d!142365) (not d!142299) (not b!1306045) (not d!142337) (not b!1305929) (not b!1305971) (not b!1305973) (not b!1306052) (not d!142389) (not d!142349) (not d!142287) (not b!1305976) (not b!1306037) (not b!1305949) (not b!1306054) (not d!142339) (not b!1305957) (not d!142357) (not b!1305948) (not b!1305943) (not d!142359) (not b!1305938) (not b!1305968) (not b!1306043) b_and!47483 (not b!1305952) (not d!142379) (not b!1305950) (not d!142321))
(check-sat b_and!47483 (not b_next!29287))
