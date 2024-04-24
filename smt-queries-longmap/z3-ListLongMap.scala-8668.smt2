; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105594 () Bool)

(assert start!105594)

(declare-fun b_free!27043 () Bool)

(declare-fun b_next!27043 () Bool)

(assert (=> start!105594 (= b_free!27043 (not b_next!27043))))

(declare-fun tp!94640 () Bool)

(declare-fun b_and!44883 () Bool)

(assert (=> start!105594 (= tp!94640 b_and!44883)))

(declare-fun b!1256740 () Bool)

(declare-fun e!714361 () Bool)

(declare-fun tp_is_empty!31945 () Bool)

(assert (=> b!1256740 (= e!714361 tp_is_empty!31945)))

(declare-fun b!1256741 () Bool)

(declare-fun res!837500 () Bool)

(declare-fun e!714362 () Bool)

(assert (=> b!1256741 (=> (not res!837500) (not e!714362))))

(declare-datatypes ((array!81581 0))(
  ( (array!81582 (arr!39346 (Array (_ BitVec 32) (_ BitVec 64))) (size!39883 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81581)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81581 (_ BitVec 32)) Bool)

(assert (=> b!1256741 (= res!837500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256742 () Bool)

(declare-fun res!837502 () Bool)

(assert (=> b!1256742 (=> (not res!837502) (not e!714362))))

(declare-datatypes ((List!27960 0))(
  ( (Nil!27957) (Cons!27956 (h!29174 (_ BitVec 64)) (t!41437 List!27960)) )
))
(declare-fun arrayNoDuplicates!0 (array!81581 (_ BitVec 32) List!27960) Bool)

(assert (=> b!1256742 (= res!837502 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27957))))

(declare-fun mapIsEmpty!49699 () Bool)

(declare-fun mapRes!49699 () Bool)

(assert (=> mapIsEmpty!49699 mapRes!49699))

(declare-fun b!1256743 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256743 (= e!714362 (not (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!39883 _keys!1118)))))))

(declare-datatypes ((V!47959 0))(
  ( (V!47960 (val!16035 Int)) )
))
(declare-datatypes ((tuple2!20726 0))(
  ( (tuple2!20727 (_1!10374 (_ BitVec 64)) (_2!10374 V!47959)) )
))
(declare-datatypes ((List!27961 0))(
  ( (Nil!27958) (Cons!27957 (h!29175 tuple2!20726) (t!41438 List!27961)) )
))
(declare-datatypes ((ListLongMap!18607 0))(
  ( (ListLongMap!18608 (toList!9319 List!27961)) )
))
(declare-fun lt!568063 () ListLongMap!18607)

(declare-fun lt!568062 () ListLongMap!18607)

(assert (=> b!1256743 (= lt!568063 lt!568062)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47959)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47959)

(declare-datatypes ((ValueCell!15209 0))(
  ( (ValueCellFull!15209 (v!18731 V!47959)) (EmptyCell!15209) )
))
(declare-datatypes ((array!81583 0))(
  ( (array!81584 (arr!39347 (Array (_ BitVec 32) ValueCell!15209)) (size!39884 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81583)

(declare-fun minValueBefore!43 () V!47959)

(declare-datatypes ((Unit!41779 0))(
  ( (Unit!41780) )
))
(declare-fun lt!568061 () Unit!41779)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1055 (array!81581 array!81583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47959 V!47959 V!47959 V!47959 (_ BitVec 32) Int) Unit!41779)

(assert (=> b!1256743 (= lt!568061 (lemmaNoChangeToArrayThenSameMapNoExtras!1055 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5741 (array!81581 array!81583 (_ BitVec 32) (_ BitVec 32) V!47959 V!47959 (_ BitVec 32) Int) ListLongMap!18607)

(assert (=> b!1256743 (= lt!568062 (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256743 (= lt!568063 (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256744 () Bool)

(declare-fun res!837501 () Bool)

(assert (=> b!1256744 (=> (not res!837501) (not e!714362))))

(assert (=> b!1256744 (= res!837501 (and (= (size!39884 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39883 _keys!1118) (size!39884 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256745 () Bool)

(declare-fun e!714364 () Bool)

(assert (=> b!1256745 (= e!714364 tp_is_empty!31945)))

(declare-fun b!1256746 () Bool)

(declare-fun e!714363 () Bool)

(assert (=> b!1256746 (= e!714363 (and e!714364 mapRes!49699))))

(declare-fun condMapEmpty!49699 () Bool)

(declare-fun mapDefault!49699 () ValueCell!15209)

(assert (=> b!1256746 (= condMapEmpty!49699 (= (arr!39347 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15209)) mapDefault!49699)))))

(declare-fun res!837503 () Bool)

(assert (=> start!105594 (=> (not res!837503) (not e!714362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105594 (= res!837503 (validMask!0 mask!1466))))

(assert (=> start!105594 e!714362))

(assert (=> start!105594 true))

(assert (=> start!105594 tp!94640))

(assert (=> start!105594 tp_is_empty!31945))

(declare-fun array_inv!30109 (array!81581) Bool)

(assert (=> start!105594 (array_inv!30109 _keys!1118)))

(declare-fun array_inv!30110 (array!81583) Bool)

(assert (=> start!105594 (and (array_inv!30110 _values!914) e!714363)))

(declare-fun mapNonEmpty!49699 () Bool)

(declare-fun tp!94639 () Bool)

(assert (=> mapNonEmpty!49699 (= mapRes!49699 (and tp!94639 e!714361))))

(declare-fun mapValue!49699 () ValueCell!15209)

(declare-fun mapKey!49699 () (_ BitVec 32))

(declare-fun mapRest!49699 () (Array (_ BitVec 32) ValueCell!15209))

(assert (=> mapNonEmpty!49699 (= (arr!39347 _values!914) (store mapRest!49699 mapKey!49699 mapValue!49699))))

(assert (= (and start!105594 res!837503) b!1256744))

(assert (= (and b!1256744 res!837501) b!1256741))

(assert (= (and b!1256741 res!837500) b!1256742))

(assert (= (and b!1256742 res!837502) b!1256743))

(assert (= (and b!1256746 condMapEmpty!49699) mapIsEmpty!49699))

(assert (= (and b!1256746 (not condMapEmpty!49699)) mapNonEmpty!49699))

(get-info :version)

(assert (= (and mapNonEmpty!49699 ((_ is ValueCellFull!15209) mapValue!49699)) b!1256740))

(assert (= (and b!1256746 ((_ is ValueCellFull!15209) mapDefault!49699)) b!1256745))

(assert (= start!105594 b!1256746))

(declare-fun m!1157787 () Bool)

(assert (=> b!1256741 m!1157787))

(declare-fun m!1157789 () Bool)

(assert (=> b!1256742 m!1157789))

(declare-fun m!1157791 () Bool)

(assert (=> start!105594 m!1157791))

(declare-fun m!1157793 () Bool)

(assert (=> start!105594 m!1157793))

(declare-fun m!1157795 () Bool)

(assert (=> start!105594 m!1157795))

(declare-fun m!1157797 () Bool)

(assert (=> mapNonEmpty!49699 m!1157797))

(declare-fun m!1157799 () Bool)

(assert (=> b!1256743 m!1157799))

(declare-fun m!1157801 () Bool)

(assert (=> b!1256743 m!1157801))

(declare-fun m!1157803 () Bool)

(assert (=> b!1256743 m!1157803))

(check-sat tp_is_empty!31945 (not start!105594) (not b!1256742) b_and!44883 (not b_next!27043) (not b!1256743) (not mapNonEmpty!49699) (not b!1256741))
(check-sat b_and!44883 (not b_next!27043))
(get-model)

(declare-fun d!138597 () Bool)

(assert (=> d!138597 (= (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568084 () Unit!41779)

(declare-fun choose!1861 (array!81581 array!81583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47959 V!47959 V!47959 V!47959 (_ BitVec 32) Int) Unit!41779)

(assert (=> d!138597 (= lt!568084 (choose!1861 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138597 (validMask!0 mask!1466)))

(assert (=> d!138597 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1055 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568084)))

(declare-fun bs!35504 () Bool)

(assert (= bs!35504 d!138597))

(assert (=> bs!35504 m!1157803))

(assert (=> bs!35504 m!1157801))

(declare-fun m!1157841 () Bool)

(assert (=> bs!35504 m!1157841))

(assert (=> bs!35504 m!1157791))

(assert (=> b!1256743 d!138597))

(declare-fun b!1256813 () Bool)

(declare-fun e!714415 () ListLongMap!18607)

(declare-fun e!714414 () ListLongMap!18607)

(assert (=> b!1256813 (= e!714415 e!714414)))

(declare-fun c!122797 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1256813 (= c!122797 (validKeyInArray!0 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61832 () Bool)

(declare-fun call!61835 () ListLongMap!18607)

(assert (=> bm!61832 (= call!61835 (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1256814 () Bool)

(declare-fun e!714412 () Bool)

(assert (=> b!1256814 (= e!714412 (validKeyInArray!0 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256814 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1256815 () Bool)

(declare-fun e!714413 () Bool)

(declare-fun lt!568101 () ListLongMap!18607)

(declare-fun isEmpty!1033 (ListLongMap!18607) Bool)

(assert (=> b!1256815 (= e!714413 (isEmpty!1033 lt!568101))))

(declare-fun b!1256816 () Bool)

(assert (=> b!1256816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(assert (=> b!1256816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39884 _values!914)))))

(declare-fun e!714411 () Bool)

(declare-fun apply!996 (ListLongMap!18607 (_ BitVec 64)) V!47959)

(declare-fun get!20171 (ValueCell!15209 V!47959) V!47959)

(declare-fun dynLambda!3448 (Int (_ BitVec 64)) V!47959)

(assert (=> b!1256816 (= e!714411 (= (apply!996 lt!568101 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)) (get!20171 (select (arr!39347 _values!914) #b00000000000000000000000000000000) (dynLambda!3448 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1256817 () Bool)

(declare-fun res!837539 () Bool)

(declare-fun e!714410 () Bool)

(assert (=> b!1256817 (=> (not res!837539) (not e!714410))))

(declare-fun contains!7554 (ListLongMap!18607 (_ BitVec 64)) Bool)

(assert (=> b!1256817 (= res!837539 (not (contains!7554 lt!568101 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138599 () Bool)

(assert (=> d!138599 e!714410))

(declare-fun res!837537 () Bool)

(assert (=> d!138599 (=> (not res!837537) (not e!714410))))

(assert (=> d!138599 (= res!837537 (not (contains!7554 lt!568101 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138599 (= lt!568101 e!714415)))

(declare-fun c!122796 () Bool)

(assert (=> d!138599 (= c!122796 (bvsge #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(assert (=> d!138599 (validMask!0 mask!1466)))

(assert (=> d!138599 (= (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568101)))

(declare-fun b!1256818 () Bool)

(assert (=> b!1256818 (= e!714415 (ListLongMap!18608 Nil!27958))))

(declare-fun b!1256819 () Bool)

(assert (=> b!1256819 (= e!714413 (= lt!568101 (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1256820 () Bool)

(declare-fun lt!568103 () Unit!41779)

(declare-fun lt!568104 () Unit!41779)

(assert (=> b!1256820 (= lt!568103 lt!568104)))

(declare-fun lt!568105 () (_ BitVec 64))

(declare-fun lt!568100 () V!47959)

(declare-fun lt!568102 () ListLongMap!18607)

(declare-fun lt!568099 () (_ BitVec 64))

(declare-fun +!4237 (ListLongMap!18607 tuple2!20726) ListLongMap!18607)

(assert (=> b!1256820 (not (contains!7554 (+!4237 lt!568102 (tuple2!20727 lt!568099 lt!568100)) lt!568105))))

(declare-fun addStillNotContains!317 (ListLongMap!18607 (_ BitVec 64) V!47959 (_ BitVec 64)) Unit!41779)

(assert (=> b!1256820 (= lt!568104 (addStillNotContains!317 lt!568102 lt!568099 lt!568100 lt!568105))))

(assert (=> b!1256820 (= lt!568105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1256820 (= lt!568100 (get!20171 (select (arr!39347 _values!914) #b00000000000000000000000000000000) (dynLambda!3448 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1256820 (= lt!568099 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256820 (= lt!568102 call!61835)))

(assert (=> b!1256820 (= e!714414 (+!4237 call!61835 (tuple2!20727 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000) (get!20171 (select (arr!39347 _values!914) #b00000000000000000000000000000000) (dynLambda!3448 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1256821 () Bool)

(assert (=> b!1256821 (= e!714414 call!61835)))

(declare-fun b!1256822 () Bool)

(declare-fun e!714416 () Bool)

(assert (=> b!1256822 (= e!714416 e!714411)))

(assert (=> b!1256822 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(declare-fun res!837536 () Bool)

(assert (=> b!1256822 (= res!837536 (contains!7554 lt!568101 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256822 (=> (not res!837536) (not e!714411))))

(declare-fun b!1256823 () Bool)

(assert (=> b!1256823 (= e!714410 e!714416)))

(declare-fun c!122795 () Bool)

(assert (=> b!1256823 (= c!122795 e!714412)))

(declare-fun res!837538 () Bool)

(assert (=> b!1256823 (=> (not res!837538) (not e!714412))))

(assert (=> b!1256823 (= res!837538 (bvslt #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(declare-fun b!1256824 () Bool)

(assert (=> b!1256824 (= e!714416 e!714413)))

(declare-fun c!122798 () Bool)

(assert (=> b!1256824 (= c!122798 (bvslt #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(assert (= (and d!138599 c!122796) b!1256818))

(assert (= (and d!138599 (not c!122796)) b!1256813))

(assert (= (and b!1256813 c!122797) b!1256820))

(assert (= (and b!1256813 (not c!122797)) b!1256821))

(assert (= (or b!1256820 b!1256821) bm!61832))

(assert (= (and d!138599 res!837537) b!1256817))

(assert (= (and b!1256817 res!837539) b!1256823))

(assert (= (and b!1256823 res!837538) b!1256814))

(assert (= (and b!1256823 c!122795) b!1256822))

(assert (= (and b!1256823 (not c!122795)) b!1256824))

(assert (= (and b!1256822 res!837536) b!1256816))

(assert (= (and b!1256824 c!122798) b!1256819))

(assert (= (and b!1256824 (not c!122798)) b!1256815))

(declare-fun b_lambda!22645 () Bool)

(assert (=> (not b_lambda!22645) (not b!1256816)))

(declare-fun t!41442 () Bool)

(declare-fun tb!11293 () Bool)

(assert (=> (and start!105594 (= defaultEntry!922 defaultEntry!922) t!41442) tb!11293))

(declare-fun result!23303 () Bool)

(assert (=> tb!11293 (= result!23303 tp_is_empty!31945)))

(assert (=> b!1256816 t!41442))

(declare-fun b_and!44889 () Bool)

(assert (= b_and!44883 (and (=> t!41442 result!23303) b_and!44889)))

(declare-fun b_lambda!22647 () Bool)

(assert (=> (not b_lambda!22647) (not b!1256820)))

(assert (=> b!1256820 t!41442))

(declare-fun b_and!44891 () Bool)

(assert (= b_and!44889 (and (=> t!41442 result!23303) b_and!44891)))

(declare-fun m!1157843 () Bool)

(assert (=> b!1256815 m!1157843))

(declare-fun m!1157845 () Bool)

(assert (=> b!1256819 m!1157845))

(declare-fun m!1157847 () Bool)

(assert (=> b!1256816 m!1157847))

(declare-fun m!1157849 () Bool)

(assert (=> b!1256816 m!1157849))

(declare-fun m!1157851 () Bool)

(assert (=> b!1256816 m!1157851))

(assert (=> b!1256816 m!1157849))

(assert (=> b!1256816 m!1157847))

(declare-fun m!1157853 () Bool)

(assert (=> b!1256816 m!1157853))

(declare-fun m!1157855 () Bool)

(assert (=> b!1256816 m!1157855))

(assert (=> b!1256816 m!1157853))

(assert (=> bm!61832 m!1157845))

(declare-fun m!1157857 () Bool)

(assert (=> b!1256817 m!1157857))

(declare-fun m!1157859 () Bool)

(assert (=> d!138599 m!1157859))

(assert (=> d!138599 m!1157791))

(assert (=> b!1256814 m!1157853))

(assert (=> b!1256814 m!1157853))

(declare-fun m!1157861 () Bool)

(assert (=> b!1256814 m!1157861))

(assert (=> b!1256822 m!1157853))

(assert (=> b!1256822 m!1157853))

(declare-fun m!1157863 () Bool)

(assert (=> b!1256822 m!1157863))

(assert (=> b!1256813 m!1157853))

(assert (=> b!1256813 m!1157853))

(assert (=> b!1256813 m!1157861))

(assert (=> b!1256820 m!1157847))

(assert (=> b!1256820 m!1157849))

(assert (=> b!1256820 m!1157851))

(declare-fun m!1157865 () Bool)

(assert (=> b!1256820 m!1157865))

(declare-fun m!1157867 () Bool)

(assert (=> b!1256820 m!1157867))

(assert (=> b!1256820 m!1157849))

(declare-fun m!1157869 () Bool)

(assert (=> b!1256820 m!1157869))

(assert (=> b!1256820 m!1157865))

(assert (=> b!1256820 m!1157847))

(assert (=> b!1256820 m!1157853))

(declare-fun m!1157871 () Bool)

(assert (=> b!1256820 m!1157871))

(assert (=> b!1256743 d!138599))

(declare-fun b!1256827 () Bool)

(declare-fun e!714422 () ListLongMap!18607)

(declare-fun e!714421 () ListLongMap!18607)

(assert (=> b!1256827 (= e!714422 e!714421)))

(declare-fun c!122801 () Bool)

(assert (=> b!1256827 (= c!122801 (validKeyInArray!0 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61833 () Bool)

(declare-fun call!61836 () ListLongMap!18607)

(assert (=> bm!61833 (= call!61836 (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1256828 () Bool)

(declare-fun e!714419 () Bool)

(assert (=> b!1256828 (= e!714419 (validKeyInArray!0 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256828 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1256829 () Bool)

(declare-fun e!714420 () Bool)

(declare-fun lt!568108 () ListLongMap!18607)

(assert (=> b!1256829 (= e!714420 (isEmpty!1033 lt!568108))))

(declare-fun b!1256830 () Bool)

(assert (=> b!1256830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(assert (=> b!1256830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39884 _values!914)))))

(declare-fun e!714418 () Bool)

(assert (=> b!1256830 (= e!714418 (= (apply!996 lt!568108 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)) (get!20171 (select (arr!39347 _values!914) #b00000000000000000000000000000000) (dynLambda!3448 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1256831 () Bool)

(declare-fun res!837543 () Bool)

(declare-fun e!714417 () Bool)

(assert (=> b!1256831 (=> (not res!837543) (not e!714417))))

(assert (=> b!1256831 (= res!837543 (not (contains!7554 lt!568108 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138601 () Bool)

(assert (=> d!138601 e!714417))

(declare-fun res!837541 () Bool)

(assert (=> d!138601 (=> (not res!837541) (not e!714417))))

(assert (=> d!138601 (= res!837541 (not (contains!7554 lt!568108 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138601 (= lt!568108 e!714422)))

(declare-fun c!122800 () Bool)

(assert (=> d!138601 (= c!122800 (bvsge #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(assert (=> d!138601 (validMask!0 mask!1466)))

(assert (=> d!138601 (= (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568108)))

(declare-fun b!1256832 () Bool)

(assert (=> b!1256832 (= e!714422 (ListLongMap!18608 Nil!27958))))

(declare-fun b!1256833 () Bool)

(assert (=> b!1256833 (= e!714420 (= lt!568108 (getCurrentListMapNoExtraKeys!5741 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1256834 () Bool)

(declare-fun lt!568110 () Unit!41779)

(declare-fun lt!568111 () Unit!41779)

(assert (=> b!1256834 (= lt!568110 lt!568111)))

(declare-fun lt!568106 () (_ BitVec 64))

(declare-fun lt!568112 () (_ BitVec 64))

(declare-fun lt!568109 () ListLongMap!18607)

(declare-fun lt!568107 () V!47959)

(assert (=> b!1256834 (not (contains!7554 (+!4237 lt!568109 (tuple2!20727 lt!568106 lt!568107)) lt!568112))))

(assert (=> b!1256834 (= lt!568111 (addStillNotContains!317 lt!568109 lt!568106 lt!568107 lt!568112))))

(assert (=> b!1256834 (= lt!568112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1256834 (= lt!568107 (get!20171 (select (arr!39347 _values!914) #b00000000000000000000000000000000) (dynLambda!3448 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1256834 (= lt!568106 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256834 (= lt!568109 call!61836)))

(assert (=> b!1256834 (= e!714421 (+!4237 call!61836 (tuple2!20727 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000) (get!20171 (select (arr!39347 _values!914) #b00000000000000000000000000000000) (dynLambda!3448 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1256835 () Bool)

(assert (=> b!1256835 (= e!714421 call!61836)))

(declare-fun b!1256836 () Bool)

(declare-fun e!714423 () Bool)

(assert (=> b!1256836 (= e!714423 e!714418)))

(assert (=> b!1256836 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(declare-fun res!837540 () Bool)

(assert (=> b!1256836 (= res!837540 (contains!7554 lt!568108 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256836 (=> (not res!837540) (not e!714418))))

(declare-fun b!1256837 () Bool)

(assert (=> b!1256837 (= e!714417 e!714423)))

(declare-fun c!122799 () Bool)

(assert (=> b!1256837 (= c!122799 e!714419)))

(declare-fun res!837542 () Bool)

(assert (=> b!1256837 (=> (not res!837542) (not e!714419))))

(assert (=> b!1256837 (= res!837542 (bvslt #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(declare-fun b!1256838 () Bool)

(assert (=> b!1256838 (= e!714423 e!714420)))

(declare-fun c!122802 () Bool)

(assert (=> b!1256838 (= c!122802 (bvslt #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(assert (= (and d!138601 c!122800) b!1256832))

(assert (= (and d!138601 (not c!122800)) b!1256827))

(assert (= (and b!1256827 c!122801) b!1256834))

(assert (= (and b!1256827 (not c!122801)) b!1256835))

(assert (= (or b!1256834 b!1256835) bm!61833))

(assert (= (and d!138601 res!837541) b!1256831))

(assert (= (and b!1256831 res!837543) b!1256837))

(assert (= (and b!1256837 res!837542) b!1256828))

(assert (= (and b!1256837 c!122799) b!1256836))

(assert (= (and b!1256837 (not c!122799)) b!1256838))

(assert (= (and b!1256836 res!837540) b!1256830))

(assert (= (and b!1256838 c!122802) b!1256833))

(assert (= (and b!1256838 (not c!122802)) b!1256829))

(declare-fun b_lambda!22649 () Bool)

(assert (=> (not b_lambda!22649) (not b!1256830)))

(assert (=> b!1256830 t!41442))

(declare-fun b_and!44893 () Bool)

(assert (= b_and!44891 (and (=> t!41442 result!23303) b_and!44893)))

(declare-fun b_lambda!22651 () Bool)

(assert (=> (not b_lambda!22651) (not b!1256834)))

(assert (=> b!1256834 t!41442))

(declare-fun b_and!44895 () Bool)

(assert (= b_and!44893 (and (=> t!41442 result!23303) b_and!44895)))

(declare-fun m!1157873 () Bool)

(assert (=> b!1256829 m!1157873))

(declare-fun m!1157875 () Bool)

(assert (=> b!1256833 m!1157875))

(assert (=> b!1256830 m!1157847))

(assert (=> b!1256830 m!1157849))

(assert (=> b!1256830 m!1157851))

(assert (=> b!1256830 m!1157849))

(assert (=> b!1256830 m!1157847))

(assert (=> b!1256830 m!1157853))

(declare-fun m!1157877 () Bool)

(assert (=> b!1256830 m!1157877))

(assert (=> b!1256830 m!1157853))

(assert (=> bm!61833 m!1157875))

(declare-fun m!1157879 () Bool)

(assert (=> b!1256831 m!1157879))

(declare-fun m!1157881 () Bool)

(assert (=> d!138601 m!1157881))

(assert (=> d!138601 m!1157791))

(assert (=> b!1256828 m!1157853))

(assert (=> b!1256828 m!1157853))

(assert (=> b!1256828 m!1157861))

(assert (=> b!1256836 m!1157853))

(assert (=> b!1256836 m!1157853))

(declare-fun m!1157883 () Bool)

(assert (=> b!1256836 m!1157883))

(assert (=> b!1256827 m!1157853))

(assert (=> b!1256827 m!1157853))

(assert (=> b!1256827 m!1157861))

(assert (=> b!1256834 m!1157847))

(assert (=> b!1256834 m!1157849))

(assert (=> b!1256834 m!1157851))

(declare-fun m!1157885 () Bool)

(assert (=> b!1256834 m!1157885))

(declare-fun m!1157887 () Bool)

(assert (=> b!1256834 m!1157887))

(assert (=> b!1256834 m!1157849))

(declare-fun m!1157889 () Bool)

(assert (=> b!1256834 m!1157889))

(assert (=> b!1256834 m!1157885))

(assert (=> b!1256834 m!1157847))

(assert (=> b!1256834 m!1157853))

(declare-fun m!1157891 () Bool)

(assert (=> b!1256834 m!1157891))

(assert (=> b!1256743 d!138601))

(declare-fun d!138603 () Bool)

(assert (=> d!138603 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105594 d!138603))

(declare-fun d!138605 () Bool)

(assert (=> d!138605 (= (array_inv!30109 _keys!1118) (bvsge (size!39883 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105594 d!138605))

(declare-fun d!138607 () Bool)

(assert (=> d!138607 (= (array_inv!30110 _values!914) (bvsge (size!39884 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105594 d!138607))

(declare-fun b!1256847 () Bool)

(declare-fun e!714431 () Bool)

(declare-fun e!714432 () Bool)

(assert (=> b!1256847 (= e!714431 e!714432)))

(declare-fun lt!568120 () (_ BitVec 64))

(assert (=> b!1256847 (= lt!568120 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568119 () Unit!41779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81581 (_ BitVec 64) (_ BitVec 32)) Unit!41779)

(assert (=> b!1256847 (= lt!568119 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!568120 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1256847 (arrayContainsKey!0 _keys!1118 lt!568120 #b00000000000000000000000000000000)))

(declare-fun lt!568121 () Unit!41779)

(assert (=> b!1256847 (= lt!568121 lt!568119)))

(declare-fun res!837548 () Bool)

(declare-datatypes ((SeekEntryResult!9921 0))(
  ( (MissingZero!9921 (index!42055 (_ BitVec 32))) (Found!9921 (index!42056 (_ BitVec 32))) (Intermediate!9921 (undefined!10733 Bool) (index!42057 (_ BitVec 32)) (x!110519 (_ BitVec 32))) (Undefined!9921) (MissingVacant!9921 (index!42058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81581 (_ BitVec 32)) SeekEntryResult!9921)

(assert (=> b!1256847 (= res!837548 (= (seekEntryOrOpen!0 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9921 #b00000000000000000000000000000000)))))

(assert (=> b!1256847 (=> (not res!837548) (not e!714432))))

(declare-fun b!1256848 () Bool)

(declare-fun call!61839 () Bool)

(assert (=> b!1256848 (= e!714432 call!61839)))

(declare-fun b!1256849 () Bool)

(assert (=> b!1256849 (= e!714431 call!61839)))

(declare-fun b!1256850 () Bool)

(declare-fun e!714430 () Bool)

(assert (=> b!1256850 (= e!714430 e!714431)))

(declare-fun c!122805 () Bool)

(assert (=> b!1256850 (= c!122805 (validKeyInArray!0 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138609 () Bool)

(declare-fun res!837549 () Bool)

(assert (=> d!138609 (=> res!837549 e!714430)))

(assert (=> d!138609 (= res!837549 (bvsge #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(assert (=> d!138609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!714430)))

(declare-fun bm!61836 () Bool)

(assert (=> bm!61836 (= call!61839 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138609 (not res!837549)) b!1256850))

(assert (= (and b!1256850 c!122805) b!1256847))

(assert (= (and b!1256850 (not c!122805)) b!1256849))

(assert (= (and b!1256847 res!837548) b!1256848))

(assert (= (or b!1256848 b!1256849) bm!61836))

(assert (=> b!1256847 m!1157853))

(declare-fun m!1157893 () Bool)

(assert (=> b!1256847 m!1157893))

(declare-fun m!1157895 () Bool)

(assert (=> b!1256847 m!1157895))

(assert (=> b!1256847 m!1157853))

(declare-fun m!1157897 () Bool)

(assert (=> b!1256847 m!1157897))

(assert (=> b!1256850 m!1157853))

(assert (=> b!1256850 m!1157853))

(assert (=> b!1256850 m!1157861))

(declare-fun m!1157899 () Bool)

(assert (=> bm!61836 m!1157899))

(assert (=> b!1256741 d!138609))

(declare-fun bm!61839 () Bool)

(declare-fun call!61842 () Bool)

(declare-fun c!122808 () Bool)

(assert (=> bm!61839 (= call!61842 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122808 (Cons!27956 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000) Nil!27957) Nil!27957)))))

(declare-fun d!138611 () Bool)

(declare-fun res!837557 () Bool)

(declare-fun e!714443 () Bool)

(assert (=> d!138611 (=> res!837557 e!714443)))

(assert (=> d!138611 (= res!837557 (bvsge #b00000000000000000000000000000000 (size!39883 _keys!1118)))))

(assert (=> d!138611 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27957) e!714443)))

(declare-fun b!1256861 () Bool)

(declare-fun e!714442 () Bool)

(assert (=> b!1256861 (= e!714443 e!714442)))

(declare-fun res!837558 () Bool)

(assert (=> b!1256861 (=> (not res!837558) (not e!714442))))

(declare-fun e!714444 () Bool)

(assert (=> b!1256861 (= res!837558 (not e!714444))))

(declare-fun res!837556 () Bool)

(assert (=> b!1256861 (=> (not res!837556) (not e!714444))))

(assert (=> b!1256861 (= res!837556 (validKeyInArray!0 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256862 () Bool)

(declare-fun e!714441 () Bool)

(assert (=> b!1256862 (= e!714441 call!61842)))

(declare-fun b!1256863 () Bool)

(declare-fun contains!7555 (List!27960 (_ BitVec 64)) Bool)

(assert (=> b!1256863 (= e!714444 (contains!7555 Nil!27957 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256864 () Bool)

(assert (=> b!1256864 (= e!714442 e!714441)))

(assert (=> b!1256864 (= c!122808 (validKeyInArray!0 (select (arr!39346 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256865 () Bool)

(assert (=> b!1256865 (= e!714441 call!61842)))

(assert (= (and d!138611 (not res!837557)) b!1256861))

(assert (= (and b!1256861 res!837556) b!1256863))

(assert (= (and b!1256861 res!837558) b!1256864))

(assert (= (and b!1256864 c!122808) b!1256862))

(assert (= (and b!1256864 (not c!122808)) b!1256865))

(assert (= (or b!1256862 b!1256865) bm!61839))

(assert (=> bm!61839 m!1157853))

(declare-fun m!1157901 () Bool)

(assert (=> bm!61839 m!1157901))

(assert (=> b!1256861 m!1157853))

(assert (=> b!1256861 m!1157853))

(assert (=> b!1256861 m!1157861))

(assert (=> b!1256863 m!1157853))

(assert (=> b!1256863 m!1157853))

(declare-fun m!1157903 () Bool)

(assert (=> b!1256863 m!1157903))

(assert (=> b!1256864 m!1157853))

(assert (=> b!1256864 m!1157853))

(assert (=> b!1256864 m!1157861))

(assert (=> b!1256742 d!138611))

(declare-fun b!1256873 () Bool)

(declare-fun e!714450 () Bool)

(assert (=> b!1256873 (= e!714450 tp_is_empty!31945)))

(declare-fun b!1256872 () Bool)

(declare-fun e!714449 () Bool)

(assert (=> b!1256872 (= e!714449 tp_is_empty!31945)))

(declare-fun mapIsEmpty!49708 () Bool)

(declare-fun mapRes!49708 () Bool)

(assert (=> mapIsEmpty!49708 mapRes!49708))

(declare-fun condMapEmpty!49708 () Bool)

(declare-fun mapDefault!49708 () ValueCell!15209)

(assert (=> mapNonEmpty!49699 (= condMapEmpty!49708 (= mapRest!49699 ((as const (Array (_ BitVec 32) ValueCell!15209)) mapDefault!49708)))))

(assert (=> mapNonEmpty!49699 (= tp!94639 (and e!714450 mapRes!49708))))

(declare-fun mapNonEmpty!49708 () Bool)

(declare-fun tp!94655 () Bool)

(assert (=> mapNonEmpty!49708 (= mapRes!49708 (and tp!94655 e!714449))))

(declare-fun mapRest!49708 () (Array (_ BitVec 32) ValueCell!15209))

(declare-fun mapValue!49708 () ValueCell!15209)

(declare-fun mapKey!49708 () (_ BitVec 32))

(assert (=> mapNonEmpty!49708 (= mapRest!49699 (store mapRest!49708 mapKey!49708 mapValue!49708))))

(assert (= (and mapNonEmpty!49699 condMapEmpty!49708) mapIsEmpty!49708))

(assert (= (and mapNonEmpty!49699 (not condMapEmpty!49708)) mapNonEmpty!49708))

(assert (= (and mapNonEmpty!49708 ((_ is ValueCellFull!15209) mapValue!49708)) b!1256872))

(assert (= (and mapNonEmpty!49699 ((_ is ValueCellFull!15209) mapDefault!49708)) b!1256873))

(declare-fun m!1157905 () Bool)

(assert (=> mapNonEmpty!49708 m!1157905))

(declare-fun b_lambda!22653 () Bool)

(assert (= b_lambda!22651 (or (and start!105594 b_free!27043) b_lambda!22653)))

(declare-fun b_lambda!22655 () Bool)

(assert (= b_lambda!22647 (or (and start!105594 b_free!27043) b_lambda!22655)))

(declare-fun b_lambda!22657 () Bool)

(assert (= b_lambda!22645 (or (and start!105594 b_free!27043) b_lambda!22657)))

(declare-fun b_lambda!22659 () Bool)

(assert (= b_lambda!22649 (or (and start!105594 b_free!27043) b_lambda!22659)))

(check-sat (not b!1256820) (not b!1256828) (not b_lambda!22655) (not bm!61833) (not b_lambda!22653) (not mapNonEmpty!49708) (not b!1256834) (not b_lambda!22659) (not b!1256819) (not b!1256850) (not bm!61832) (not b!1256836) (not b!1256827) (not b!1256831) (not b!1256830) (not b!1256861) tp_is_empty!31945 (not b!1256813) (not d!138601) (not d!138597) (not b!1256833) (not b!1256814) (not b!1256822) (not b_lambda!22657) (not b!1256817) (not b!1256863) (not b!1256864) (not d!138599) (not b!1256815) (not b!1256816) (not b!1256829) b_and!44895 (not bm!61836) (not b_next!27043) (not b!1256847) (not bm!61839))
(check-sat b_and!44895 (not b_next!27043))
