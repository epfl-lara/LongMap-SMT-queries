; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104850 () Bool)

(assert start!104850)

(declare-fun b_free!26655 () Bool)

(declare-fun b_next!26655 () Bool)

(assert (=> start!104850 (= b_free!26655 (not b_next!26655))))

(declare-fun tp!93454 () Bool)

(declare-fun b_and!44423 () Bool)

(assert (=> start!104850 (= tp!93454 b_and!44423)))

(declare-fun b!1249767 () Bool)

(declare-fun e!709369 () Bool)

(declare-fun tp_is_empty!31557 () Bool)

(assert (=> b!1249767 (= e!709369 tp_is_empty!31557)))

(declare-fun b!1249768 () Bool)

(declare-fun e!709372 () Bool)

(assert (=> b!1249768 (= e!709372 tp_is_empty!31557)))

(declare-fun b!1249769 () Bool)

(declare-fun e!709371 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!80786 0))(
  ( (array!80787 (arr!38960 (Array (_ BitVec 32) (_ BitVec 64))) (size!39496 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80786)

(assert (=> b!1249769 (= e!709371 (not (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!39496 _keys!1118)))))))

(declare-datatypes ((V!47441 0))(
  ( (V!47442 (val!15841 Int)) )
))
(declare-datatypes ((tuple2!20402 0))(
  ( (tuple2!20403 (_1!10212 (_ BitVec 64)) (_2!10212 V!47441)) )
))
(declare-datatypes ((List!27646 0))(
  ( (Nil!27643) (Cons!27642 (h!28851 tuple2!20402) (t!41117 List!27646)) )
))
(declare-datatypes ((ListLongMap!18275 0))(
  ( (ListLongMap!18276 (toList!9153 List!27646)) )
))
(declare-fun lt!563871 () ListLongMap!18275)

(declare-fun lt!563870 () ListLongMap!18275)

(assert (=> b!1249769 (= lt!563871 lt!563870)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47441)

(declare-datatypes ((Unit!41503 0))(
  ( (Unit!41504) )
))
(declare-fun lt!563872 () Unit!41503)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47441)

(declare-datatypes ((ValueCell!15015 0))(
  ( (ValueCellFull!15015 (v!18537 V!47441)) (EmptyCell!15015) )
))
(declare-datatypes ((array!80788 0))(
  ( (array!80789 (arr!38961 (Array (_ BitVec 32) ValueCell!15015)) (size!39497 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80788)

(declare-fun minValueBefore!43 () V!47441)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!924 (array!80786 array!80788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47441 V!47441 V!47441 V!47441 (_ BitVec 32) Int) Unit!41503)

(assert (=> b!1249769 (= lt!563872 (lemmaNoChangeToArrayThenSameMapNoExtras!924 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5560 (array!80786 array!80788 (_ BitVec 32) (_ BitVec 32) V!47441 V!47441 (_ BitVec 32) Int) ListLongMap!18275)

(assert (=> b!1249769 (= lt!563870 (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249769 (= lt!563871 (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249770 () Bool)

(declare-fun res!833653 () Bool)

(assert (=> b!1249770 (=> (not res!833653) (not e!709371))))

(declare-datatypes ((List!27647 0))(
  ( (Nil!27644) (Cons!27643 (h!28852 (_ BitVec 64)) (t!41118 List!27647)) )
))
(declare-fun arrayNoDuplicates!0 (array!80786 (_ BitVec 32) List!27647) Bool)

(assert (=> b!1249770 (= res!833653 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27644))))

(declare-fun mapIsEmpty!49096 () Bool)

(declare-fun mapRes!49096 () Bool)

(assert (=> mapIsEmpty!49096 mapRes!49096))

(declare-fun mapNonEmpty!49096 () Bool)

(declare-fun tp!93455 () Bool)

(assert (=> mapNonEmpty!49096 (= mapRes!49096 (and tp!93455 e!709369))))

(declare-fun mapValue!49096 () ValueCell!15015)

(declare-fun mapKey!49096 () (_ BitVec 32))

(declare-fun mapRest!49096 () (Array (_ BitVec 32) ValueCell!15015))

(assert (=> mapNonEmpty!49096 (= (arr!38961 _values!914) (store mapRest!49096 mapKey!49096 mapValue!49096))))

(declare-fun b!1249771 () Bool)

(declare-fun res!833654 () Bool)

(assert (=> b!1249771 (=> (not res!833654) (not e!709371))))

(assert (=> b!1249771 (= res!833654 (and (= (size!39497 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39496 _keys!1118) (size!39497 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249772 () Bool)

(declare-fun e!709368 () Bool)

(assert (=> b!1249772 (= e!709368 (and e!709372 mapRes!49096))))

(declare-fun condMapEmpty!49096 () Bool)

(declare-fun mapDefault!49096 () ValueCell!15015)

(assert (=> b!1249772 (= condMapEmpty!49096 (= (arr!38961 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15015)) mapDefault!49096)))))

(declare-fun b!1249773 () Bool)

(declare-fun res!833652 () Bool)

(assert (=> b!1249773 (=> (not res!833652) (not e!709371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80786 (_ BitVec 32)) Bool)

(assert (=> b!1249773 (= res!833652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833655 () Bool)

(assert (=> start!104850 (=> (not res!833655) (not e!709371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104850 (= res!833655 (validMask!0 mask!1466))))

(assert (=> start!104850 e!709371))

(assert (=> start!104850 true))

(assert (=> start!104850 tp!93454))

(assert (=> start!104850 tp_is_empty!31557))

(declare-fun array_inv!29727 (array!80786) Bool)

(assert (=> start!104850 (array_inv!29727 _keys!1118)))

(declare-fun array_inv!29728 (array!80788) Bool)

(assert (=> start!104850 (and (array_inv!29728 _values!914) e!709368)))

(assert (= (and start!104850 res!833655) b!1249771))

(assert (= (and b!1249771 res!833654) b!1249773))

(assert (= (and b!1249773 res!833652) b!1249770))

(assert (= (and b!1249770 res!833653) b!1249769))

(assert (= (and b!1249772 condMapEmpty!49096) mapIsEmpty!49096))

(assert (= (and b!1249772 (not condMapEmpty!49096)) mapNonEmpty!49096))

(get-info :version)

(assert (= (and mapNonEmpty!49096 ((_ is ValueCellFull!15015) mapValue!49096)) b!1249767))

(assert (= (and b!1249772 ((_ is ValueCellFull!15015) mapDefault!49096)) b!1249768))

(assert (= start!104850 b!1249772))

(declare-fun m!1150649 () Bool)

(assert (=> mapNonEmpty!49096 m!1150649))

(declare-fun m!1150651 () Bool)

(assert (=> b!1249769 m!1150651))

(declare-fun m!1150653 () Bool)

(assert (=> b!1249769 m!1150653))

(declare-fun m!1150655 () Bool)

(assert (=> b!1249769 m!1150655))

(declare-fun m!1150657 () Bool)

(assert (=> b!1249773 m!1150657))

(declare-fun m!1150659 () Bool)

(assert (=> b!1249770 m!1150659))

(declare-fun m!1150661 () Bool)

(assert (=> start!104850 m!1150661))

(declare-fun m!1150663 () Bool)

(assert (=> start!104850 m!1150663))

(declare-fun m!1150665 () Bool)

(assert (=> start!104850 m!1150665))

(check-sat (not b!1249769) (not b_next!26655) tp_is_empty!31557 (not b!1249773) b_and!44423 (not start!104850) (not mapNonEmpty!49096) (not b!1249770))
(check-sat b_and!44423 (not b_next!26655))
(get-model)

(declare-fun d!137865 () Bool)

(assert (=> d!137865 (= (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563884 () Unit!41503)

(declare-fun choose!1846 (array!80786 array!80788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47441 V!47441 V!47441 V!47441 (_ BitVec 32) Int) Unit!41503)

(assert (=> d!137865 (= lt!563884 (choose!1846 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137865 (validMask!0 mask!1466)))

(assert (=> d!137865 (= (lemmaNoChangeToArrayThenSameMapNoExtras!924 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563884)))

(declare-fun bs!35276 () Bool)

(assert (= bs!35276 d!137865))

(assert (=> bs!35276 m!1150655))

(assert (=> bs!35276 m!1150653))

(declare-fun m!1150685 () Bool)

(assert (=> bs!35276 m!1150685))

(assert (=> bs!35276 m!1150661))

(assert (=> b!1249769 d!137865))

(declare-fun d!137867 () Bool)

(declare-fun e!709406 () Bool)

(assert (=> d!137867 e!709406))

(declare-fun res!833679 () Bool)

(assert (=> d!137867 (=> (not res!833679) (not e!709406))))

(declare-fun lt!563901 () ListLongMap!18275)

(declare-fun contains!7471 (ListLongMap!18275 (_ BitVec 64)) Bool)

(assert (=> d!137867 (= res!833679 (not (contains!7471 lt!563901 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!709403 () ListLongMap!18275)

(assert (=> d!137867 (= lt!563901 e!709403)))

(declare-fun c!122133 () Bool)

(assert (=> d!137867 (= c!122133 (bvsge #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(assert (=> d!137867 (validMask!0 mask!1466)))

(assert (=> d!137867 (= (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563901)))

(declare-fun b!1249819 () Bool)

(declare-fun e!709404 () ListLongMap!18275)

(assert (=> b!1249819 (= e!709403 e!709404)))

(declare-fun c!122136 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1249819 (= c!122136 (validKeyInArray!0 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249820 () Bool)

(declare-fun res!833676 () Bool)

(assert (=> b!1249820 (=> (not res!833676) (not e!709406))))

(assert (=> b!1249820 (= res!833676 (not (contains!7471 lt!563901 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!61581 () ListLongMap!18275)

(declare-fun bm!61578 () Bool)

(assert (=> bm!61578 (= call!61581 (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1249821 () Bool)

(assert (=> b!1249821 (= e!709403 (ListLongMap!18276 Nil!27643))))

(declare-fun b!1249822 () Bool)

(declare-fun e!709407 () Bool)

(assert (=> b!1249822 (= e!709406 e!709407)))

(declare-fun c!122134 () Bool)

(declare-fun e!709402 () Bool)

(assert (=> b!1249822 (= c!122134 e!709402)))

(declare-fun res!833677 () Bool)

(assert (=> b!1249822 (=> (not res!833677) (not e!709402))))

(assert (=> b!1249822 (= res!833677 (bvslt #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(declare-fun e!709405 () Bool)

(declare-fun b!1249823 () Bool)

(assert (=> b!1249823 (= e!709405 (= lt!563901 (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1249824 () Bool)

(declare-fun isEmpty!1022 (ListLongMap!18275) Bool)

(assert (=> b!1249824 (= e!709405 (isEmpty!1022 lt!563901))))

(declare-fun b!1249825 () Bool)

(assert (=> b!1249825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(assert (=> b!1249825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39497 _values!914)))))

(declare-fun e!709408 () Bool)

(declare-fun apply!980 (ListLongMap!18275 (_ BitVec 64)) V!47441)

(declare-fun get!19983 (ValueCell!15015 V!47441) V!47441)

(declare-fun dynLambda!3378 (Int (_ BitVec 64)) V!47441)

(assert (=> b!1249825 (= e!709408 (= (apply!980 lt!563901 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)) (get!19983 (select (arr!38961 _values!914) #b00000000000000000000000000000000) (dynLambda!3378 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1249826 () Bool)

(assert (=> b!1249826 (= e!709404 call!61581)))

(declare-fun b!1249827 () Bool)

(assert (=> b!1249827 (= e!709407 e!709405)))

(declare-fun c!122135 () Bool)

(assert (=> b!1249827 (= c!122135 (bvslt #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(declare-fun b!1249828 () Bool)

(assert (=> b!1249828 (= e!709407 e!709408)))

(assert (=> b!1249828 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(declare-fun res!833678 () Bool)

(assert (=> b!1249828 (= res!833678 (contains!7471 lt!563901 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249828 (=> (not res!833678) (not e!709408))))

(declare-fun b!1249829 () Bool)

(declare-fun lt!563902 () Unit!41503)

(declare-fun lt!563904 () Unit!41503)

(assert (=> b!1249829 (= lt!563902 lt!563904)))

(declare-fun lt!563900 () (_ BitVec 64))

(declare-fun lt!563899 () V!47441)

(declare-fun lt!563905 () (_ BitVec 64))

(declare-fun lt!563903 () ListLongMap!18275)

(declare-fun +!4136 (ListLongMap!18275 tuple2!20402) ListLongMap!18275)

(assert (=> b!1249829 (not (contains!7471 (+!4136 lt!563903 (tuple2!20403 lt!563900 lt!563899)) lt!563905))))

(declare-fun addStillNotContains!308 (ListLongMap!18275 (_ BitVec 64) V!47441 (_ BitVec 64)) Unit!41503)

(assert (=> b!1249829 (= lt!563904 (addStillNotContains!308 lt!563903 lt!563900 lt!563899 lt!563905))))

(assert (=> b!1249829 (= lt!563905 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1249829 (= lt!563899 (get!19983 (select (arr!38961 _values!914) #b00000000000000000000000000000000) (dynLambda!3378 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1249829 (= lt!563900 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1249829 (= lt!563903 call!61581)))

(assert (=> b!1249829 (= e!709404 (+!4136 call!61581 (tuple2!20403 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000) (get!19983 (select (arr!38961 _values!914) #b00000000000000000000000000000000) (dynLambda!3378 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1249830 () Bool)

(assert (=> b!1249830 (= e!709402 (validKeyInArray!0 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249830 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!137867 c!122133) b!1249821))

(assert (= (and d!137867 (not c!122133)) b!1249819))

(assert (= (and b!1249819 c!122136) b!1249829))

(assert (= (and b!1249819 (not c!122136)) b!1249826))

(assert (= (or b!1249829 b!1249826) bm!61578))

(assert (= (and d!137867 res!833679) b!1249820))

(assert (= (and b!1249820 res!833676) b!1249822))

(assert (= (and b!1249822 res!833677) b!1249830))

(assert (= (and b!1249822 c!122134) b!1249828))

(assert (= (and b!1249822 (not c!122134)) b!1249827))

(assert (= (and b!1249828 res!833678) b!1249825))

(assert (= (and b!1249827 c!122135) b!1249823))

(assert (= (and b!1249827 (not c!122135)) b!1249824))

(declare-fun b_lambda!22511 () Bool)

(assert (=> (not b_lambda!22511) (not b!1249825)))

(declare-fun t!41122 () Bool)

(declare-fun tb!11287 () Bool)

(assert (=> (and start!104850 (= defaultEntry!922 defaultEntry!922) t!41122) tb!11287))

(declare-fun result!23269 () Bool)

(assert (=> tb!11287 (= result!23269 tp_is_empty!31557)))

(assert (=> b!1249825 t!41122))

(declare-fun b_and!44427 () Bool)

(assert (= b_and!44423 (and (=> t!41122 result!23269) b_and!44427)))

(declare-fun b_lambda!22513 () Bool)

(assert (=> (not b_lambda!22513) (not b!1249829)))

(assert (=> b!1249829 t!41122))

(declare-fun b_and!44429 () Bool)

(assert (= b_and!44427 (and (=> t!41122 result!23269) b_and!44429)))

(declare-fun m!1150687 () Bool)

(assert (=> b!1249828 m!1150687))

(assert (=> b!1249828 m!1150687))

(declare-fun m!1150689 () Bool)

(assert (=> b!1249828 m!1150689))

(declare-fun m!1150691 () Bool)

(assert (=> b!1249820 m!1150691))

(assert (=> b!1249830 m!1150687))

(assert (=> b!1249830 m!1150687))

(declare-fun m!1150693 () Bool)

(assert (=> b!1249830 m!1150693))

(declare-fun m!1150695 () Bool)

(assert (=> b!1249823 m!1150695))

(declare-fun m!1150697 () Bool)

(assert (=> d!137867 m!1150697))

(assert (=> d!137867 m!1150661))

(declare-fun m!1150699 () Bool)

(assert (=> b!1249824 m!1150699))

(assert (=> b!1249825 m!1150687))

(assert (=> b!1249825 m!1150687))

(declare-fun m!1150701 () Bool)

(assert (=> b!1249825 m!1150701))

(declare-fun m!1150703 () Bool)

(assert (=> b!1249825 m!1150703))

(declare-fun m!1150705 () Bool)

(assert (=> b!1249825 m!1150705))

(assert (=> b!1249825 m!1150703))

(assert (=> b!1249825 m!1150705))

(declare-fun m!1150707 () Bool)

(assert (=> b!1249825 m!1150707))

(assert (=> b!1249819 m!1150687))

(assert (=> b!1249819 m!1150687))

(assert (=> b!1249819 m!1150693))

(declare-fun m!1150709 () Bool)

(assert (=> b!1249829 m!1150709))

(assert (=> b!1249829 m!1150703))

(assert (=> b!1249829 m!1150705))

(assert (=> b!1249829 m!1150703))

(assert (=> b!1249829 m!1150705))

(assert (=> b!1249829 m!1150707))

(declare-fun m!1150711 () Bool)

(assert (=> b!1249829 m!1150711))

(assert (=> b!1249829 m!1150709))

(declare-fun m!1150713 () Bool)

(assert (=> b!1249829 m!1150713))

(declare-fun m!1150715 () Bool)

(assert (=> b!1249829 m!1150715))

(assert (=> b!1249829 m!1150687))

(assert (=> bm!61578 m!1150695))

(assert (=> b!1249769 d!137867))

(declare-fun d!137869 () Bool)

(declare-fun e!709413 () Bool)

(assert (=> d!137869 e!709413))

(declare-fun res!833683 () Bool)

(assert (=> d!137869 (=> (not res!833683) (not e!709413))))

(declare-fun lt!563908 () ListLongMap!18275)

(assert (=> d!137869 (= res!833683 (not (contains!7471 lt!563908 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!709410 () ListLongMap!18275)

(assert (=> d!137869 (= lt!563908 e!709410)))

(declare-fun c!122137 () Bool)

(assert (=> d!137869 (= c!122137 (bvsge #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(assert (=> d!137869 (validMask!0 mask!1466)))

(assert (=> d!137869 (= (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563908)))

(declare-fun b!1249833 () Bool)

(declare-fun e!709411 () ListLongMap!18275)

(assert (=> b!1249833 (= e!709410 e!709411)))

(declare-fun c!122140 () Bool)

(assert (=> b!1249833 (= c!122140 (validKeyInArray!0 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249834 () Bool)

(declare-fun res!833680 () Bool)

(assert (=> b!1249834 (=> (not res!833680) (not e!709413))))

(assert (=> b!1249834 (= res!833680 (not (contains!7471 lt!563908 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!61579 () Bool)

(declare-fun call!61582 () ListLongMap!18275)

(assert (=> bm!61579 (= call!61582 (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1249835 () Bool)

(assert (=> b!1249835 (= e!709410 (ListLongMap!18276 Nil!27643))))

(declare-fun b!1249836 () Bool)

(declare-fun e!709414 () Bool)

(assert (=> b!1249836 (= e!709413 e!709414)))

(declare-fun c!122138 () Bool)

(declare-fun e!709409 () Bool)

(assert (=> b!1249836 (= c!122138 e!709409)))

(declare-fun res!833681 () Bool)

(assert (=> b!1249836 (=> (not res!833681) (not e!709409))))

(assert (=> b!1249836 (= res!833681 (bvslt #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(declare-fun e!709412 () Bool)

(declare-fun b!1249837 () Bool)

(assert (=> b!1249837 (= e!709412 (= lt!563908 (getCurrentListMapNoExtraKeys!5560 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1249838 () Bool)

(assert (=> b!1249838 (= e!709412 (isEmpty!1022 lt!563908))))

(declare-fun b!1249839 () Bool)

(assert (=> b!1249839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(assert (=> b!1249839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39497 _values!914)))))

(declare-fun e!709415 () Bool)

(assert (=> b!1249839 (= e!709415 (= (apply!980 lt!563908 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)) (get!19983 (select (arr!38961 _values!914) #b00000000000000000000000000000000) (dynLambda!3378 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1249840 () Bool)

(assert (=> b!1249840 (= e!709411 call!61582)))

(declare-fun b!1249841 () Bool)

(assert (=> b!1249841 (= e!709414 e!709412)))

(declare-fun c!122139 () Bool)

(assert (=> b!1249841 (= c!122139 (bvslt #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(declare-fun b!1249842 () Bool)

(assert (=> b!1249842 (= e!709414 e!709415)))

(assert (=> b!1249842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(declare-fun res!833682 () Bool)

(assert (=> b!1249842 (= res!833682 (contains!7471 lt!563908 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249842 (=> (not res!833682) (not e!709415))))

(declare-fun b!1249843 () Bool)

(declare-fun lt!563909 () Unit!41503)

(declare-fun lt!563911 () Unit!41503)

(assert (=> b!1249843 (= lt!563909 lt!563911)))

(declare-fun lt!563910 () ListLongMap!18275)

(declare-fun lt!563907 () (_ BitVec 64))

(declare-fun lt!563912 () (_ BitVec 64))

(declare-fun lt!563906 () V!47441)

(assert (=> b!1249843 (not (contains!7471 (+!4136 lt!563910 (tuple2!20403 lt!563907 lt!563906)) lt!563912))))

(assert (=> b!1249843 (= lt!563911 (addStillNotContains!308 lt!563910 lt!563907 lt!563906 lt!563912))))

(assert (=> b!1249843 (= lt!563912 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1249843 (= lt!563906 (get!19983 (select (arr!38961 _values!914) #b00000000000000000000000000000000) (dynLambda!3378 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1249843 (= lt!563907 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1249843 (= lt!563910 call!61582)))

(assert (=> b!1249843 (= e!709411 (+!4136 call!61582 (tuple2!20403 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000) (get!19983 (select (arr!38961 _values!914) #b00000000000000000000000000000000) (dynLambda!3378 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1249844 () Bool)

(assert (=> b!1249844 (= e!709409 (validKeyInArray!0 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249844 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!137869 c!122137) b!1249835))

(assert (= (and d!137869 (not c!122137)) b!1249833))

(assert (= (and b!1249833 c!122140) b!1249843))

(assert (= (and b!1249833 (not c!122140)) b!1249840))

(assert (= (or b!1249843 b!1249840) bm!61579))

(assert (= (and d!137869 res!833683) b!1249834))

(assert (= (and b!1249834 res!833680) b!1249836))

(assert (= (and b!1249836 res!833681) b!1249844))

(assert (= (and b!1249836 c!122138) b!1249842))

(assert (= (and b!1249836 (not c!122138)) b!1249841))

(assert (= (and b!1249842 res!833682) b!1249839))

(assert (= (and b!1249841 c!122139) b!1249837))

(assert (= (and b!1249841 (not c!122139)) b!1249838))

(declare-fun b_lambda!22515 () Bool)

(assert (=> (not b_lambda!22515) (not b!1249839)))

(assert (=> b!1249839 t!41122))

(declare-fun b_and!44431 () Bool)

(assert (= b_and!44429 (and (=> t!41122 result!23269) b_and!44431)))

(declare-fun b_lambda!22517 () Bool)

(assert (=> (not b_lambda!22517) (not b!1249843)))

(assert (=> b!1249843 t!41122))

(declare-fun b_and!44433 () Bool)

(assert (= b_and!44431 (and (=> t!41122 result!23269) b_and!44433)))

(assert (=> b!1249842 m!1150687))

(assert (=> b!1249842 m!1150687))

(declare-fun m!1150717 () Bool)

(assert (=> b!1249842 m!1150717))

(declare-fun m!1150719 () Bool)

(assert (=> b!1249834 m!1150719))

(assert (=> b!1249844 m!1150687))

(assert (=> b!1249844 m!1150687))

(assert (=> b!1249844 m!1150693))

(declare-fun m!1150721 () Bool)

(assert (=> b!1249837 m!1150721))

(declare-fun m!1150723 () Bool)

(assert (=> d!137869 m!1150723))

(assert (=> d!137869 m!1150661))

(declare-fun m!1150725 () Bool)

(assert (=> b!1249838 m!1150725))

(assert (=> b!1249839 m!1150687))

(assert (=> b!1249839 m!1150687))

(declare-fun m!1150727 () Bool)

(assert (=> b!1249839 m!1150727))

(assert (=> b!1249839 m!1150703))

(assert (=> b!1249839 m!1150705))

(assert (=> b!1249839 m!1150703))

(assert (=> b!1249839 m!1150705))

(assert (=> b!1249839 m!1150707))

(assert (=> b!1249833 m!1150687))

(assert (=> b!1249833 m!1150687))

(assert (=> b!1249833 m!1150693))

(declare-fun m!1150729 () Bool)

(assert (=> b!1249843 m!1150729))

(assert (=> b!1249843 m!1150703))

(assert (=> b!1249843 m!1150705))

(assert (=> b!1249843 m!1150703))

(assert (=> b!1249843 m!1150705))

(assert (=> b!1249843 m!1150707))

(declare-fun m!1150731 () Bool)

(assert (=> b!1249843 m!1150731))

(assert (=> b!1249843 m!1150729))

(declare-fun m!1150733 () Bool)

(assert (=> b!1249843 m!1150733))

(declare-fun m!1150735 () Bool)

(assert (=> b!1249843 m!1150735))

(assert (=> b!1249843 m!1150687))

(assert (=> bm!61579 m!1150721))

(assert (=> b!1249769 d!137869))

(declare-fun d!137871 () Bool)

(assert (=> d!137871 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104850 d!137871))

(declare-fun d!137873 () Bool)

(assert (=> d!137873 (= (array_inv!29727 _keys!1118) (bvsge (size!39496 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104850 d!137873))

(declare-fun d!137875 () Bool)

(assert (=> d!137875 (= (array_inv!29728 _values!914) (bvsge (size!39497 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104850 d!137875))

(declare-fun d!137877 () Bool)

(declare-fun res!833691 () Bool)

(declare-fun e!709424 () Bool)

(assert (=> d!137877 (=> res!833691 e!709424)))

(assert (=> d!137877 (= res!833691 (bvsge #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(assert (=> d!137877 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27644) e!709424)))

(declare-fun b!1249855 () Bool)

(declare-fun e!709425 () Bool)

(assert (=> b!1249855 (= e!709424 e!709425)))

(declare-fun res!833692 () Bool)

(assert (=> b!1249855 (=> (not res!833692) (not e!709425))))

(declare-fun e!709426 () Bool)

(assert (=> b!1249855 (= res!833692 (not e!709426))))

(declare-fun res!833690 () Bool)

(assert (=> b!1249855 (=> (not res!833690) (not e!709426))))

(assert (=> b!1249855 (= res!833690 (validKeyInArray!0 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249856 () Bool)

(declare-fun contains!7472 (List!27647 (_ BitVec 64)) Bool)

(assert (=> b!1249856 (= e!709426 (contains!7472 Nil!27644 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249857 () Bool)

(declare-fun e!709427 () Bool)

(declare-fun call!61585 () Bool)

(assert (=> b!1249857 (= e!709427 call!61585)))

(declare-fun b!1249858 () Bool)

(assert (=> b!1249858 (= e!709425 e!709427)))

(declare-fun c!122143 () Bool)

(assert (=> b!1249858 (= c!122143 (validKeyInArray!0 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249859 () Bool)

(assert (=> b!1249859 (= e!709427 call!61585)))

(declare-fun bm!61582 () Bool)

(assert (=> bm!61582 (= call!61585 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122143 (Cons!27643 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000) Nil!27644) Nil!27644)))))

(assert (= (and d!137877 (not res!833691)) b!1249855))

(assert (= (and b!1249855 res!833690) b!1249856))

(assert (= (and b!1249855 res!833692) b!1249858))

(assert (= (and b!1249858 c!122143) b!1249857))

(assert (= (and b!1249858 (not c!122143)) b!1249859))

(assert (= (or b!1249857 b!1249859) bm!61582))

(assert (=> b!1249855 m!1150687))

(assert (=> b!1249855 m!1150687))

(assert (=> b!1249855 m!1150693))

(assert (=> b!1249856 m!1150687))

(assert (=> b!1249856 m!1150687))

(declare-fun m!1150737 () Bool)

(assert (=> b!1249856 m!1150737))

(assert (=> b!1249858 m!1150687))

(assert (=> b!1249858 m!1150687))

(assert (=> b!1249858 m!1150693))

(assert (=> bm!61582 m!1150687))

(declare-fun m!1150739 () Bool)

(assert (=> bm!61582 m!1150739))

(assert (=> b!1249770 d!137877))

(declare-fun b!1249868 () Bool)

(declare-fun e!709435 () Bool)

(declare-fun e!709434 () Bool)

(assert (=> b!1249868 (= e!709435 e!709434)))

(declare-fun c!122146 () Bool)

(assert (=> b!1249868 (= c!122146 (validKeyInArray!0 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249869 () Bool)

(declare-fun call!61588 () Bool)

(assert (=> b!1249869 (= e!709434 call!61588)))

(declare-fun bm!61585 () Bool)

(assert (=> bm!61585 (= call!61588 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1249870 () Bool)

(declare-fun e!709436 () Bool)

(assert (=> b!1249870 (= e!709436 call!61588)))

(declare-fun b!1249871 () Bool)

(assert (=> b!1249871 (= e!709434 e!709436)))

(declare-fun lt!563919 () (_ BitVec 64))

(assert (=> b!1249871 (= lt!563919 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!563920 () Unit!41503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80786 (_ BitVec 64) (_ BitVec 32)) Unit!41503)

(assert (=> b!1249871 (= lt!563920 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563919 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1249871 (arrayContainsKey!0 _keys!1118 lt!563919 #b00000000000000000000000000000000)))

(declare-fun lt!563921 () Unit!41503)

(assert (=> b!1249871 (= lt!563921 lt!563920)))

(declare-fun res!833698 () Bool)

(declare-datatypes ((SeekEntryResult!9958 0))(
  ( (MissingZero!9958 (index!42203 (_ BitVec 32))) (Found!9958 (index!42204 (_ BitVec 32))) (Intermediate!9958 (undefined!10770 Bool) (index!42205 (_ BitVec 32)) (x!109937 (_ BitVec 32))) (Undefined!9958) (MissingVacant!9958 (index!42206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80786 (_ BitVec 32)) SeekEntryResult!9958)

(assert (=> b!1249871 (= res!833698 (= (seekEntryOrOpen!0 (select (arr!38960 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9958 #b00000000000000000000000000000000)))))

(assert (=> b!1249871 (=> (not res!833698) (not e!709436))))

(declare-fun d!137879 () Bool)

(declare-fun res!833697 () Bool)

(assert (=> d!137879 (=> res!833697 e!709435)))

(assert (=> d!137879 (= res!833697 (bvsge #b00000000000000000000000000000000 (size!39496 _keys!1118)))))

(assert (=> d!137879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!709435)))

(assert (= (and d!137879 (not res!833697)) b!1249868))

(assert (= (and b!1249868 c!122146) b!1249871))

(assert (= (and b!1249868 (not c!122146)) b!1249869))

(assert (= (and b!1249871 res!833698) b!1249870))

(assert (= (or b!1249870 b!1249869) bm!61585))

(assert (=> b!1249868 m!1150687))

(assert (=> b!1249868 m!1150687))

(assert (=> b!1249868 m!1150693))

(declare-fun m!1150741 () Bool)

(assert (=> bm!61585 m!1150741))

(assert (=> b!1249871 m!1150687))

(declare-fun m!1150743 () Bool)

(assert (=> b!1249871 m!1150743))

(declare-fun m!1150745 () Bool)

(assert (=> b!1249871 m!1150745))

(assert (=> b!1249871 m!1150687))

(declare-fun m!1150747 () Bool)

(assert (=> b!1249871 m!1150747))

(assert (=> b!1249773 d!137879))

(declare-fun condMapEmpty!49102 () Bool)

(declare-fun mapDefault!49102 () ValueCell!15015)

(assert (=> mapNonEmpty!49096 (= condMapEmpty!49102 (= mapRest!49096 ((as const (Array (_ BitVec 32) ValueCell!15015)) mapDefault!49102)))))

(declare-fun e!709442 () Bool)

(declare-fun mapRes!49102 () Bool)

(assert (=> mapNonEmpty!49096 (= tp!93455 (and e!709442 mapRes!49102))))

(declare-fun mapNonEmpty!49102 () Bool)

(declare-fun tp!93464 () Bool)

(declare-fun e!709441 () Bool)

(assert (=> mapNonEmpty!49102 (= mapRes!49102 (and tp!93464 e!709441))))

(declare-fun mapRest!49102 () (Array (_ BitVec 32) ValueCell!15015))

(declare-fun mapKey!49102 () (_ BitVec 32))

(declare-fun mapValue!49102 () ValueCell!15015)

(assert (=> mapNonEmpty!49102 (= mapRest!49096 (store mapRest!49102 mapKey!49102 mapValue!49102))))

(declare-fun mapIsEmpty!49102 () Bool)

(assert (=> mapIsEmpty!49102 mapRes!49102))

(declare-fun b!1249879 () Bool)

(assert (=> b!1249879 (= e!709442 tp_is_empty!31557)))

(declare-fun b!1249878 () Bool)

(assert (=> b!1249878 (= e!709441 tp_is_empty!31557)))

(assert (= (and mapNonEmpty!49096 condMapEmpty!49102) mapIsEmpty!49102))

(assert (= (and mapNonEmpty!49096 (not condMapEmpty!49102)) mapNonEmpty!49102))

(assert (= (and mapNonEmpty!49102 ((_ is ValueCellFull!15015) mapValue!49102)) b!1249878))

(assert (= (and mapNonEmpty!49096 ((_ is ValueCellFull!15015) mapDefault!49102)) b!1249879))

(declare-fun m!1150749 () Bool)

(assert (=> mapNonEmpty!49102 m!1150749))

(declare-fun b_lambda!22519 () Bool)

(assert (= b_lambda!22515 (or (and start!104850 b_free!26655) b_lambda!22519)))

(declare-fun b_lambda!22521 () Bool)

(assert (= b_lambda!22513 (or (and start!104850 b_free!26655) b_lambda!22521)))

(declare-fun b_lambda!22523 () Bool)

(assert (= b_lambda!22517 (or (and start!104850 b_free!26655) b_lambda!22523)))

(declare-fun b_lambda!22525 () Bool)

(assert (= b_lambda!22511 (or (and start!104850 b_free!26655) b_lambda!22525)))

(check-sat (not b!1249823) (not mapNonEmpty!49102) (not b_lambda!22523) (not b!1249828) (not b!1249868) (not d!137867) tp_is_empty!31557 (not b!1249858) (not b!1249837) (not b!1249842) (not b!1249855) (not b!1249833) (not b_lambda!22525) (not bm!61579) (not b!1249843) (not b!1249839) (not b_next!26655) (not bm!61582) b_and!44433 (not b!1249824) (not b!1249844) (not b!1249871) (not bm!61578) (not d!137869) (not bm!61585) (not b!1249819) (not b_lambda!22521) (not b_lambda!22519) (not b!1249829) (not d!137865) (not b!1249838) (not b!1249856) (not b!1249830) (not b!1249825) (not b!1249834) (not b!1249820))
(check-sat b_and!44433 (not b_next!26655))
