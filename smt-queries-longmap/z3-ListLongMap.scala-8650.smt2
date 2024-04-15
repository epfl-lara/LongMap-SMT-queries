; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105214 () Bool)

(assert start!105214)

(declare-fun b_free!26935 () Bool)

(declare-fun b_next!26935 () Bool)

(assert (=> start!105214 (= b_free!26935 (not b_next!26935))))

(declare-fun tp!94310 () Bool)

(declare-fun b_and!44731 () Bool)

(assert (=> start!105214 (= tp!94310 b_and!44731)))

(declare-fun b!1253765 () Bool)

(declare-fun e!712337 () Bool)

(declare-fun e!712335 () Bool)

(assert (=> b!1253765 (= e!712337 (not e!712335))))

(declare-fun res!836047 () Bool)

(assert (=> b!1253765 (=> res!836047 e!712335)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253765 (= res!836047 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47815 0))(
  ( (V!47816 (val!15981 Int)) )
))
(declare-datatypes ((tuple2!20716 0))(
  ( (tuple2!20717 (_1!10369 (_ BitVec 64)) (_2!10369 V!47815)) )
))
(declare-datatypes ((List!27926 0))(
  ( (Nil!27923) (Cons!27922 (h!29131 tuple2!20716) (t!41398 List!27926)) )
))
(declare-datatypes ((ListLongMap!18589 0))(
  ( (ListLongMap!18590 (toList!9310 List!27926)) )
))
(declare-fun lt!566197 () ListLongMap!18589)

(declare-fun lt!566196 () ListLongMap!18589)

(assert (=> b!1253765 (= lt!566197 lt!566196)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47815)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47815)

(declare-datatypes ((array!81255 0))(
  ( (array!81256 (arr!39190 (Array (_ BitVec 32) (_ BitVec 64))) (size!39728 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81255)

(declare-datatypes ((ValueCell!15155 0))(
  ( (ValueCellFull!15155 (v!18678 V!47815)) (EmptyCell!15155) )
))
(declare-datatypes ((array!81257 0))(
  ( (array!81258 (arr!39191 (Array (_ BitVec 32) ValueCell!15155)) (size!39729 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81257)

(declare-datatypes ((Unit!41583 0))(
  ( (Unit!41584) )
))
(declare-fun lt!566198 () Unit!41583)

(declare-fun minValueBefore!43 () V!47815)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1032 (array!81255 array!81257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 V!47815 V!47815 (_ BitVec 32) Int) Unit!41583)

(assert (=> b!1253765 (= lt!566198 (lemmaNoChangeToArrayThenSameMapNoExtras!1032 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5710 (array!81255 array!81257 (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 (_ BitVec 32) Int) ListLongMap!18589)

(assert (=> b!1253765 (= lt!566196 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253765 (= lt!566197 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253766 () Bool)

(declare-fun res!836046 () Bool)

(assert (=> b!1253766 (=> (not res!836046) (not e!712337))))

(declare-datatypes ((List!27927 0))(
  ( (Nil!27924) (Cons!27923 (h!29132 (_ BitVec 64)) (t!41399 List!27927)) )
))
(declare-fun arrayNoDuplicates!0 (array!81255 (_ BitVec 32) List!27927) Bool)

(assert (=> b!1253766 (= res!836046 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27924))))

(declare-fun b!1253767 () Bool)

(declare-fun e!712338 () Bool)

(declare-fun tp_is_empty!31837 () Bool)

(assert (=> b!1253767 (= e!712338 tp_is_empty!31837)))

(declare-fun b!1253768 () Bool)

(declare-fun res!836042 () Bool)

(assert (=> b!1253768 (=> (not res!836042) (not e!712337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81255 (_ BitVec 32)) Bool)

(assert (=> b!1253768 (= res!836042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253769 () Bool)

(declare-fun e!712336 () Bool)

(assert (=> b!1253769 (= e!712335 e!712336)))

(declare-fun res!836045 () Bool)

(assert (=> b!1253769 (=> res!836045 e!712336)))

(declare-fun lt!566200 () ListLongMap!18589)

(declare-fun lt!566194 () ListLongMap!18589)

(declare-fun -!2004 (ListLongMap!18589 (_ BitVec 64)) ListLongMap!18589)

(assert (=> b!1253769 (= res!836045 (not (= (-!2004 lt!566200 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566194)))))

(declare-fun lt!566199 () ListLongMap!18589)

(assert (=> b!1253769 (= (-!2004 lt!566199 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566197)))

(declare-fun lt!566195 () Unit!41583)

(declare-fun addThenRemoveForNewKeyIsSame!293 (ListLongMap!18589 (_ BitVec 64) V!47815) Unit!41583)

(assert (=> b!1253769 (= lt!566195 (addThenRemoveForNewKeyIsSame!293 lt!566197 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1253769 (and (= lt!566200 lt!566199) (= lt!566194 lt!566196))))

(declare-fun +!4207 (ListLongMap!18589 tuple2!20716) ListLongMap!18589)

(assert (=> b!1253769 (= lt!566199 (+!4207 lt!566197 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4443 (array!81255 array!81257 (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 (_ BitVec 32) Int) ListLongMap!18589)

(assert (=> b!1253769 (= lt!566194 (getCurrentListMap!4443 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253769 (= lt!566200 (getCurrentListMap!4443 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253770 () Bool)

(declare-fun e!712340 () Bool)

(declare-fun mapRes!49531 () Bool)

(assert (=> b!1253770 (= e!712340 (and e!712338 mapRes!49531))))

(declare-fun condMapEmpty!49531 () Bool)

(declare-fun mapDefault!49531 () ValueCell!15155)

(assert (=> b!1253770 (= condMapEmpty!49531 (= (arr!39191 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15155)) mapDefault!49531)))))

(declare-fun mapIsEmpty!49531 () Bool)

(assert (=> mapIsEmpty!49531 mapRes!49531))

(declare-fun b!1253771 () Bool)

(declare-fun res!836043 () Bool)

(assert (=> b!1253771 (=> (not res!836043) (not e!712337))))

(assert (=> b!1253771 (= res!836043 (and (= (size!39729 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39728 _keys!1118) (size!39729 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253772 () Bool)

(declare-fun e!712339 () Bool)

(assert (=> b!1253772 (= e!712339 tp_is_empty!31837)))

(declare-fun mapNonEmpty!49531 () Bool)

(declare-fun tp!94309 () Bool)

(assert (=> mapNonEmpty!49531 (= mapRes!49531 (and tp!94309 e!712339))))

(declare-fun mapValue!49531 () ValueCell!15155)

(declare-fun mapKey!49531 () (_ BitVec 32))

(declare-fun mapRest!49531 () (Array (_ BitVec 32) ValueCell!15155))

(assert (=> mapNonEmpty!49531 (= (arr!39191 _values!914) (store mapRest!49531 mapKey!49531 mapValue!49531))))

(declare-fun res!836044 () Bool)

(assert (=> start!105214 (=> (not res!836044) (not e!712337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105214 (= res!836044 (validMask!0 mask!1466))))

(assert (=> start!105214 e!712337))

(assert (=> start!105214 true))

(assert (=> start!105214 tp!94310))

(assert (=> start!105214 tp_is_empty!31837))

(declare-fun array_inv!30007 (array!81255) Bool)

(assert (=> start!105214 (array_inv!30007 _keys!1118)))

(declare-fun array_inv!30008 (array!81257) Bool)

(assert (=> start!105214 (and (array_inv!30008 _values!914) e!712340)))

(declare-fun b!1253773 () Bool)

(assert (=> b!1253773 (= e!712336 (bvsle #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (= (and start!105214 res!836044) b!1253771))

(assert (= (and b!1253771 res!836043) b!1253768))

(assert (= (and b!1253768 res!836042) b!1253766))

(assert (= (and b!1253766 res!836046) b!1253765))

(assert (= (and b!1253765 (not res!836047)) b!1253769))

(assert (= (and b!1253769 (not res!836045)) b!1253773))

(assert (= (and b!1253770 condMapEmpty!49531) mapIsEmpty!49531))

(assert (= (and b!1253770 (not condMapEmpty!49531)) mapNonEmpty!49531))

(get-info :version)

(assert (= (and mapNonEmpty!49531 ((_ is ValueCellFull!15155) mapValue!49531)) b!1253772))

(assert (= (and b!1253770 ((_ is ValueCellFull!15155) mapDefault!49531)) b!1253767))

(assert (= start!105214 b!1253770))

(declare-fun m!1153955 () Bool)

(assert (=> b!1253766 m!1153955))

(declare-fun m!1153957 () Bool)

(assert (=> mapNonEmpty!49531 m!1153957))

(declare-fun m!1153959 () Bool)

(assert (=> start!105214 m!1153959))

(declare-fun m!1153961 () Bool)

(assert (=> start!105214 m!1153961))

(declare-fun m!1153963 () Bool)

(assert (=> start!105214 m!1153963))

(declare-fun m!1153965 () Bool)

(assert (=> b!1253769 m!1153965))

(declare-fun m!1153967 () Bool)

(assert (=> b!1253769 m!1153967))

(declare-fun m!1153969 () Bool)

(assert (=> b!1253769 m!1153969))

(declare-fun m!1153971 () Bool)

(assert (=> b!1253769 m!1153971))

(declare-fun m!1153973 () Bool)

(assert (=> b!1253769 m!1153973))

(declare-fun m!1153975 () Bool)

(assert (=> b!1253769 m!1153975))

(declare-fun m!1153977 () Bool)

(assert (=> b!1253765 m!1153977))

(declare-fun m!1153979 () Bool)

(assert (=> b!1253765 m!1153979))

(declare-fun m!1153981 () Bool)

(assert (=> b!1253765 m!1153981))

(declare-fun m!1153983 () Bool)

(assert (=> b!1253768 m!1153983))

(check-sat (not b!1253768) (not b!1253769) (not b!1253766) (not start!105214) (not b_next!26935) (not mapNonEmpty!49531) tp_is_empty!31837 b_and!44731 (not b!1253765))
(check-sat b_and!44731 (not b_next!26935))
(get-model)

(declare-fun d!137925 () Bool)

(assert (=> d!137925 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105214 d!137925))

(declare-fun d!137927 () Bool)

(assert (=> d!137927 (= (array_inv!30007 _keys!1118) (bvsge (size!39728 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105214 d!137927))

(declare-fun d!137929 () Bool)

(assert (=> d!137929 (= (array_inv!30008 _values!914) (bvsge (size!39729 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105214 d!137929))

(declare-fun b!1253836 () Bool)

(declare-fun e!712390 () Bool)

(declare-fun e!712391 () Bool)

(assert (=> b!1253836 (= e!712390 e!712391)))

(declare-fun lt!566249 () (_ BitVec 64))

(assert (=> b!1253836 (= lt!566249 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566250 () Unit!41583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81255 (_ BitVec 64) (_ BitVec 32)) Unit!41583)

(assert (=> b!1253836 (= lt!566250 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!566249 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1253836 (arrayContainsKey!0 _keys!1118 lt!566249 #b00000000000000000000000000000000)))

(declare-fun lt!566251 () Unit!41583)

(assert (=> b!1253836 (= lt!566251 lt!566250)))

(declare-fun res!836089 () Bool)

(declare-datatypes ((SeekEntryResult!9962 0))(
  ( (MissingZero!9962 (index!42219 (_ BitVec 32))) (Found!9962 (index!42220 (_ BitVec 32))) (Intermediate!9962 (undefined!10774 Bool) (index!42221 (_ BitVec 32)) (x!110369 (_ BitVec 32))) (Undefined!9962) (MissingVacant!9962 (index!42222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81255 (_ BitVec 32)) SeekEntryResult!9962)

(assert (=> b!1253836 (= res!836089 (= (seekEntryOrOpen!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9962 #b00000000000000000000000000000000)))))

(assert (=> b!1253836 (=> (not res!836089) (not e!712391))))

(declare-fun bm!61672 () Bool)

(declare-fun call!61675 () Bool)

(assert (=> bm!61672 (= call!61675 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1253837 () Bool)

(assert (=> b!1253837 (= e!712391 call!61675)))

(declare-fun b!1253838 () Bool)

(assert (=> b!1253838 (= e!712390 call!61675)))

(declare-fun d!137931 () Bool)

(declare-fun res!836088 () Bool)

(declare-fun e!712392 () Bool)

(assert (=> d!137931 (=> res!836088 e!712392)))

(assert (=> d!137931 (= res!836088 (bvsge #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (=> d!137931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!712392)))

(declare-fun b!1253839 () Bool)

(assert (=> b!1253839 (= e!712392 e!712390)))

(declare-fun c!122279 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1253839 (= c!122279 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137931 (not res!836088)) b!1253839))

(assert (= (and b!1253839 c!122279) b!1253836))

(assert (= (and b!1253839 (not c!122279)) b!1253838))

(assert (= (and b!1253836 res!836089) b!1253837))

(assert (= (or b!1253837 b!1253838) bm!61672))

(declare-fun m!1154045 () Bool)

(assert (=> b!1253836 m!1154045))

(declare-fun m!1154047 () Bool)

(assert (=> b!1253836 m!1154047))

(declare-fun m!1154049 () Bool)

(assert (=> b!1253836 m!1154049))

(assert (=> b!1253836 m!1154045))

(declare-fun m!1154051 () Bool)

(assert (=> b!1253836 m!1154051))

(declare-fun m!1154053 () Bool)

(assert (=> bm!61672 m!1154053))

(assert (=> b!1253839 m!1154045))

(assert (=> b!1253839 m!1154045))

(declare-fun m!1154055 () Bool)

(assert (=> b!1253839 m!1154055))

(assert (=> b!1253768 d!137931))

(declare-fun d!137933 () Bool)

(declare-fun lt!566254 () ListLongMap!18589)

(declare-fun contains!7493 (ListLongMap!18589 (_ BitVec 64)) Bool)

(assert (=> d!137933 (not (contains!7493 lt!566254 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!138 (List!27926 (_ BitVec 64)) List!27926)

(assert (=> d!137933 (= lt!566254 (ListLongMap!18590 (removeStrictlySorted!138 (toList!9310 lt!566200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137933 (= (-!2004 lt!566200 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566254)))

(declare-fun bs!35398 () Bool)

(assert (= bs!35398 d!137933))

(declare-fun m!1154057 () Bool)

(assert (=> bs!35398 m!1154057))

(declare-fun m!1154059 () Bool)

(assert (=> bs!35398 m!1154059))

(assert (=> b!1253769 d!137933))

(declare-fun d!137935 () Bool)

(assert (=> d!137935 (= (-!2004 (+!4207 lt!566197 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!566197)))

(declare-fun lt!566257 () Unit!41583)

(declare-fun choose!1862 (ListLongMap!18589 (_ BitVec 64) V!47815) Unit!41583)

(assert (=> d!137935 (= lt!566257 (choose!1862 lt!566197 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!137935 (not (contains!7493 lt!566197 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137935 (= (addThenRemoveForNewKeyIsSame!293 lt!566197 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!566257)))

(declare-fun bs!35399 () Bool)

(assert (= bs!35399 d!137935))

(assert (=> bs!35399 m!1153967))

(assert (=> bs!35399 m!1153967))

(declare-fun m!1154061 () Bool)

(assert (=> bs!35399 m!1154061))

(declare-fun m!1154063 () Bool)

(assert (=> bs!35399 m!1154063))

(declare-fun m!1154065 () Bool)

(assert (=> bs!35399 m!1154065))

(assert (=> b!1253769 d!137935))

(declare-fun d!137937 () Bool)

(declare-fun e!712395 () Bool)

(assert (=> d!137937 e!712395))

(declare-fun res!836094 () Bool)

(assert (=> d!137937 (=> (not res!836094) (not e!712395))))

(declare-fun lt!566269 () ListLongMap!18589)

(assert (=> d!137937 (= res!836094 (contains!7493 lt!566269 (_1!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!566266 () List!27926)

(assert (=> d!137937 (= lt!566269 (ListLongMap!18590 lt!566266))))

(declare-fun lt!566267 () Unit!41583)

(declare-fun lt!566268 () Unit!41583)

(assert (=> d!137937 (= lt!566267 lt!566268)))

(declare-datatypes ((Option!707 0))(
  ( (Some!706 (v!18681 V!47815)) (None!705) )
))
(declare-fun getValueByKey!656 (List!27926 (_ BitVec 64)) Option!707)

(assert (=> d!137937 (= (getValueByKey!656 lt!566266 (_1!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!706 (_2!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!330 (List!27926 (_ BitVec 64) V!47815) Unit!41583)

(assert (=> d!137937 (= lt!566268 (lemmaContainsTupThenGetReturnValue!330 lt!566266 (_1!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!444 (List!27926 (_ BitVec 64) V!47815) List!27926)

(assert (=> d!137937 (= lt!566266 (insertStrictlySorted!444 (toList!9310 lt!566197) (_1!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!137937 (= (+!4207 lt!566197 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!566269)))

(declare-fun b!1253844 () Bool)

(declare-fun res!836095 () Bool)

(assert (=> b!1253844 (=> (not res!836095) (not e!712395))))

(assert (=> b!1253844 (= res!836095 (= (getValueByKey!656 (toList!9310 lt!566269) (_1!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!706 (_2!10369 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1253845 () Bool)

(declare-fun contains!7494 (List!27926 tuple2!20716) Bool)

(assert (=> b!1253845 (= e!712395 (contains!7494 (toList!9310 lt!566269) (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!137937 res!836094) b!1253844))

(assert (= (and b!1253844 res!836095) b!1253845))

(declare-fun m!1154067 () Bool)

(assert (=> d!137937 m!1154067))

(declare-fun m!1154069 () Bool)

(assert (=> d!137937 m!1154069))

(declare-fun m!1154071 () Bool)

(assert (=> d!137937 m!1154071))

(declare-fun m!1154073 () Bool)

(assert (=> d!137937 m!1154073))

(declare-fun m!1154075 () Bool)

(assert (=> b!1253844 m!1154075))

(declare-fun m!1154077 () Bool)

(assert (=> b!1253845 m!1154077))

(assert (=> b!1253769 d!137937))

(declare-fun b!1253889 () Bool)

(declare-fun e!712427 () Bool)

(declare-fun e!712426 () Bool)

(assert (=> b!1253889 (= e!712427 e!712426)))

(declare-fun res!836121 () Bool)

(declare-fun call!61692 () Bool)

(assert (=> b!1253889 (= res!836121 call!61692)))

(assert (=> b!1253889 (=> (not res!836121) (not e!712426))))

(declare-fun b!1253890 () Bool)

(declare-fun res!836119 () Bool)

(declare-fun e!712434 () Bool)

(assert (=> b!1253890 (=> (not res!836119) (not e!712434))))

(declare-fun e!712431 () Bool)

(assert (=> b!1253890 (= res!836119 e!712431)))

(declare-fun res!836116 () Bool)

(assert (=> b!1253890 (=> res!836116 e!712431)))

(declare-fun e!712430 () Bool)

(assert (=> b!1253890 (= res!836116 (not e!712430))))

(declare-fun res!836118 () Bool)

(assert (=> b!1253890 (=> (not res!836118) (not e!712430))))

(assert (=> b!1253890 (= res!836118 (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun b!1253891 () Bool)

(declare-fun e!712433 () Bool)

(assert (=> b!1253891 (= e!712433 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61687 () Bool)

(declare-fun call!61690 () ListLongMap!18589)

(declare-fun call!61696 () ListLongMap!18589)

(assert (=> bm!61687 (= call!61690 call!61696)))

(declare-fun b!1253892 () Bool)

(declare-fun e!712423 () Bool)

(declare-fun e!712424 () Bool)

(assert (=> b!1253892 (= e!712423 e!712424)))

(declare-fun res!836117 () Bool)

(declare-fun call!61691 () Bool)

(assert (=> b!1253892 (= res!836117 call!61691)))

(assert (=> b!1253892 (=> (not res!836117) (not e!712424))))

(declare-fun b!1253893 () Bool)

(declare-fun e!712428 () Unit!41583)

(declare-fun lt!566321 () Unit!41583)

(assert (=> b!1253893 (= e!712428 lt!566321)))

(declare-fun lt!566314 () ListLongMap!18589)

(assert (=> b!1253893 (= lt!566314 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566333 () (_ BitVec 64))

(assert (=> b!1253893 (= lt!566333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566316 () (_ BitVec 64))

(assert (=> b!1253893 (= lt!566316 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566320 () Unit!41583)

(declare-fun addStillContains!1078 (ListLongMap!18589 (_ BitVec 64) V!47815 (_ BitVec 64)) Unit!41583)

(assert (=> b!1253893 (= lt!566320 (addStillContains!1078 lt!566314 lt!566333 zeroValue!871 lt!566316))))

(assert (=> b!1253893 (contains!7493 (+!4207 lt!566314 (tuple2!20717 lt!566333 zeroValue!871)) lt!566316)))

(declare-fun lt!566334 () Unit!41583)

(assert (=> b!1253893 (= lt!566334 lt!566320)))

(declare-fun lt!566319 () ListLongMap!18589)

(assert (=> b!1253893 (= lt!566319 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566323 () (_ BitVec 64))

(assert (=> b!1253893 (= lt!566323 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566325 () (_ BitVec 64))

(assert (=> b!1253893 (= lt!566325 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566317 () Unit!41583)

(declare-fun addApplyDifferent!521 (ListLongMap!18589 (_ BitVec 64) V!47815 (_ BitVec 64)) Unit!41583)

(assert (=> b!1253893 (= lt!566317 (addApplyDifferent!521 lt!566319 lt!566323 minValueAfter!43 lt!566325))))

(declare-fun apply!978 (ListLongMap!18589 (_ BitVec 64)) V!47815)

(assert (=> b!1253893 (= (apply!978 (+!4207 lt!566319 (tuple2!20717 lt!566323 minValueAfter!43)) lt!566325) (apply!978 lt!566319 lt!566325))))

(declare-fun lt!566322 () Unit!41583)

(assert (=> b!1253893 (= lt!566322 lt!566317)))

(declare-fun lt!566332 () ListLongMap!18589)

(assert (=> b!1253893 (= lt!566332 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566331 () (_ BitVec 64))

(assert (=> b!1253893 (= lt!566331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566328 () (_ BitVec 64))

(assert (=> b!1253893 (= lt!566328 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566329 () Unit!41583)

(assert (=> b!1253893 (= lt!566329 (addApplyDifferent!521 lt!566332 lt!566331 zeroValue!871 lt!566328))))

(assert (=> b!1253893 (= (apply!978 (+!4207 lt!566332 (tuple2!20717 lt!566331 zeroValue!871)) lt!566328) (apply!978 lt!566332 lt!566328))))

(declare-fun lt!566318 () Unit!41583)

(assert (=> b!1253893 (= lt!566318 lt!566329)))

(declare-fun lt!566330 () ListLongMap!18589)

(assert (=> b!1253893 (= lt!566330 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566326 () (_ BitVec 64))

(assert (=> b!1253893 (= lt!566326 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566324 () (_ BitVec 64))

(assert (=> b!1253893 (= lt!566324 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253893 (= lt!566321 (addApplyDifferent!521 lt!566330 lt!566326 minValueAfter!43 lt!566324))))

(assert (=> b!1253893 (= (apply!978 (+!4207 lt!566330 (tuple2!20717 lt!566326 minValueAfter!43)) lt!566324) (apply!978 lt!566330 lt!566324))))

(declare-fun b!1253894 () Bool)

(declare-fun res!836120 () Bool)

(assert (=> b!1253894 (=> (not res!836120) (not e!712434))))

(assert (=> b!1253894 (= res!836120 e!712423)))

(declare-fun c!122292 () Bool)

(assert (=> b!1253894 (= c!122292 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1253895 () Bool)

(assert (=> b!1253895 (= e!712427 (not call!61692))))

(declare-fun b!1253896 () Bool)

(declare-fun e!712432 () ListLongMap!18589)

(assert (=> b!1253896 (= e!712432 call!61690)))

(declare-fun bm!61688 () Bool)

(declare-fun lt!566315 () ListLongMap!18589)

(assert (=> bm!61688 (= call!61692 (contains!7493 lt!566315 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253897 () Bool)

(assert (=> b!1253897 (= e!712430 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253898 () Bool)

(assert (=> b!1253898 (= e!712434 e!712427)))

(declare-fun c!122297 () Bool)

(assert (=> b!1253898 (= c!122297 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253899 () Bool)

(declare-fun c!122295 () Bool)

(assert (=> b!1253899 (= c!122295 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!712425 () ListLongMap!18589)

(assert (=> b!1253899 (= e!712425 e!712432)))

(declare-fun b!1253888 () Bool)

(declare-fun e!712429 () ListLongMap!18589)

(assert (=> b!1253888 (= e!712429 (+!4207 call!61696 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun d!137939 () Bool)

(assert (=> d!137939 e!712434))

(declare-fun res!836115 () Bool)

(assert (=> d!137939 (=> (not res!836115) (not e!712434))))

(assert (=> d!137939 (= res!836115 (or (bvsge #b00000000000000000000000000000000 (size!39728 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))))

(declare-fun lt!566335 () ListLongMap!18589)

(assert (=> d!137939 (= lt!566315 lt!566335)))

(declare-fun lt!566327 () Unit!41583)

(assert (=> d!137939 (= lt!566327 e!712428)))

(declare-fun c!122296 () Bool)

(assert (=> d!137939 (= c!122296 e!712433)))

(declare-fun res!836114 () Bool)

(assert (=> d!137939 (=> (not res!836114) (not e!712433))))

(assert (=> d!137939 (= res!836114 (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (=> d!137939 (= lt!566335 e!712429)))

(declare-fun c!122294 () Bool)

(assert (=> d!137939 (= c!122294 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137939 (validMask!0 mask!1466)))

(assert (=> d!137939 (= (getCurrentListMap!4443 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566315)))

(declare-fun bm!61689 () Bool)

(declare-fun call!61694 () ListLongMap!18589)

(declare-fun call!61695 () ListLongMap!18589)

(assert (=> bm!61689 (= call!61694 call!61695)))

(declare-fun b!1253900 () Bool)

(declare-fun e!712422 () Bool)

(declare-fun get!20083 (ValueCell!15155 V!47815) V!47815)

(declare-fun dynLambda!3408 (Int (_ BitVec 64)) V!47815)

(assert (=> b!1253900 (= e!712422 (= (apply!978 lt!566315 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)) (get!20083 (select (arr!39191 _values!914) #b00000000000000000000000000000000) (dynLambda!3408 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1253900 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39729 _values!914)))))

(assert (=> b!1253900 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun b!1253901 () Bool)

(assert (=> b!1253901 (= e!712426 (= (apply!978 lt!566315 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun c!122293 () Bool)

(declare-fun bm!61690 () Bool)

(declare-fun call!61693 () ListLongMap!18589)

(assert (=> bm!61690 (= call!61696 (+!4207 (ite c!122294 call!61693 (ite c!122293 call!61695 call!61694)) (ite (or c!122294 c!122293) (tuple2!20717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1253902 () Bool)

(assert (=> b!1253902 (= e!712429 e!712425)))

(assert (=> b!1253902 (= c!122293 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253903 () Bool)

(assert (=> b!1253903 (= e!712423 (not call!61691))))

(declare-fun b!1253904 () Bool)

(assert (=> b!1253904 (= e!712432 call!61694)))

(declare-fun bm!61691 () Bool)

(assert (=> bm!61691 (= call!61693 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253905 () Bool)

(assert (=> b!1253905 (= e!712424 (= (apply!978 lt!566315 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1253906 () Bool)

(assert (=> b!1253906 (= e!712431 e!712422)))

(declare-fun res!836122 () Bool)

(assert (=> b!1253906 (=> (not res!836122) (not e!712422))))

(assert (=> b!1253906 (= res!836122 (contains!7493 lt!566315 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253906 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun b!1253907 () Bool)

(declare-fun Unit!41589 () Unit!41583)

(assert (=> b!1253907 (= e!712428 Unit!41589)))

(declare-fun bm!61692 () Bool)

(assert (=> bm!61692 (= call!61695 call!61693)))

(declare-fun bm!61693 () Bool)

(assert (=> bm!61693 (= call!61691 (contains!7493 lt!566315 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253908 () Bool)

(assert (=> b!1253908 (= e!712425 call!61690)))

(assert (= (and d!137939 c!122294) b!1253888))

(assert (= (and d!137939 (not c!122294)) b!1253902))

(assert (= (and b!1253902 c!122293) b!1253908))

(assert (= (and b!1253902 (not c!122293)) b!1253899))

(assert (= (and b!1253899 c!122295) b!1253896))

(assert (= (and b!1253899 (not c!122295)) b!1253904))

(assert (= (or b!1253896 b!1253904) bm!61689))

(assert (= (or b!1253908 bm!61689) bm!61692))

(assert (= (or b!1253908 b!1253896) bm!61687))

(assert (= (or b!1253888 bm!61692) bm!61691))

(assert (= (or b!1253888 bm!61687) bm!61690))

(assert (= (and d!137939 res!836114) b!1253891))

(assert (= (and d!137939 c!122296) b!1253893))

(assert (= (and d!137939 (not c!122296)) b!1253907))

(assert (= (and d!137939 res!836115) b!1253890))

(assert (= (and b!1253890 res!836118) b!1253897))

(assert (= (and b!1253890 (not res!836116)) b!1253906))

(assert (= (and b!1253906 res!836122) b!1253900))

(assert (= (and b!1253890 res!836119) b!1253894))

(assert (= (and b!1253894 c!122292) b!1253892))

(assert (= (and b!1253894 (not c!122292)) b!1253903))

(assert (= (and b!1253892 res!836117) b!1253905))

(assert (= (or b!1253892 b!1253903) bm!61693))

(assert (= (and b!1253894 res!836120) b!1253898))

(assert (= (and b!1253898 c!122297) b!1253889))

(assert (= (and b!1253898 (not c!122297)) b!1253895))

(assert (= (and b!1253889 res!836121) b!1253901))

(assert (= (or b!1253889 b!1253895) bm!61688))

(declare-fun b_lambda!22593 () Bool)

(assert (=> (not b_lambda!22593) (not b!1253900)))

(declare-fun t!41405 () Bool)

(declare-fun tb!11289 () Bool)

(assert (=> (and start!105214 (= defaultEntry!922 defaultEntry!922) t!41405) tb!11289))

(declare-fun result!23291 () Bool)

(assert (=> tb!11289 (= result!23291 tp_is_empty!31837)))

(assert (=> b!1253900 t!41405))

(declare-fun b_and!44737 () Bool)

(assert (= b_and!44731 (and (=> t!41405 result!23291) b_and!44737)))

(assert (=> d!137939 m!1153959))

(declare-fun m!1154079 () Bool)

(assert (=> bm!61690 m!1154079))

(assert (=> b!1253891 m!1154045))

(assert (=> b!1253891 m!1154045))

(assert (=> b!1253891 m!1154055))

(declare-fun m!1154081 () Bool)

(assert (=> b!1253905 m!1154081))

(assert (=> bm!61691 m!1153979))

(assert (=> b!1253906 m!1154045))

(assert (=> b!1253906 m!1154045))

(declare-fun m!1154083 () Bool)

(assert (=> b!1253906 m!1154083))

(assert (=> b!1253897 m!1154045))

(assert (=> b!1253897 m!1154045))

(assert (=> b!1253897 m!1154055))

(assert (=> b!1253900 m!1154045))

(declare-fun m!1154085 () Bool)

(assert (=> b!1253900 m!1154085))

(declare-fun m!1154087 () Bool)

(assert (=> b!1253900 m!1154087))

(assert (=> b!1253900 m!1154045))

(assert (=> b!1253900 m!1154087))

(declare-fun m!1154089 () Bool)

(assert (=> b!1253900 m!1154089))

(declare-fun m!1154091 () Bool)

(assert (=> b!1253900 m!1154091))

(assert (=> b!1253900 m!1154089))

(declare-fun m!1154093 () Bool)

(assert (=> bm!61688 m!1154093))

(declare-fun m!1154095 () Bool)

(assert (=> b!1253901 m!1154095))

(declare-fun m!1154097 () Bool)

(assert (=> b!1253888 m!1154097))

(declare-fun m!1154099 () Bool)

(assert (=> bm!61693 m!1154099))

(declare-fun m!1154101 () Bool)

(assert (=> b!1253893 m!1154101))

(assert (=> b!1253893 m!1154101))

(declare-fun m!1154103 () Bool)

(assert (=> b!1253893 m!1154103))

(assert (=> b!1253893 m!1153979))

(declare-fun m!1154105 () Bool)

(assert (=> b!1253893 m!1154105))

(declare-fun m!1154107 () Bool)

(assert (=> b!1253893 m!1154107))

(assert (=> b!1253893 m!1154045))

(declare-fun m!1154109 () Bool)

(assert (=> b!1253893 m!1154109))

(declare-fun m!1154111 () Bool)

(assert (=> b!1253893 m!1154111))

(assert (=> b!1253893 m!1154105))

(declare-fun m!1154113 () Bool)

(assert (=> b!1253893 m!1154113))

(declare-fun m!1154115 () Bool)

(assert (=> b!1253893 m!1154115))

(declare-fun m!1154117 () Bool)

(assert (=> b!1253893 m!1154117))

(declare-fun m!1154119 () Bool)

(assert (=> b!1253893 m!1154119))

(declare-fun m!1154121 () Bool)

(assert (=> b!1253893 m!1154121))

(declare-fun m!1154123 () Bool)

(assert (=> b!1253893 m!1154123))

(assert (=> b!1253893 m!1154117))

(declare-fun m!1154125 () Bool)

(assert (=> b!1253893 m!1154125))

(declare-fun m!1154127 () Bool)

(assert (=> b!1253893 m!1154127))

(assert (=> b!1253893 m!1154109))

(declare-fun m!1154129 () Bool)

(assert (=> b!1253893 m!1154129))

(assert (=> b!1253769 d!137939))

(declare-fun d!137941 () Bool)

(declare-fun lt!566336 () ListLongMap!18589)

(assert (=> d!137941 (not (contains!7493 lt!566336 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!137941 (= lt!566336 (ListLongMap!18590 (removeStrictlySorted!138 (toList!9310 lt!566199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137941 (= (-!2004 lt!566199 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566336)))

(declare-fun bs!35400 () Bool)

(assert (= bs!35400 d!137941))

(declare-fun m!1154131 () Bool)

(assert (=> bs!35400 m!1154131))

(declare-fun m!1154133 () Bool)

(assert (=> bs!35400 m!1154133))

(assert (=> b!1253769 d!137941))

(declare-fun b!1253912 () Bool)

(declare-fun e!712440 () Bool)

(declare-fun e!712439 () Bool)

(assert (=> b!1253912 (= e!712440 e!712439)))

(declare-fun res!836130 () Bool)

(declare-fun call!61699 () Bool)

(assert (=> b!1253912 (= res!836130 call!61699)))

(assert (=> b!1253912 (=> (not res!836130) (not e!712439))))

(declare-fun b!1253913 () Bool)

(declare-fun res!836128 () Bool)

(declare-fun e!712447 () Bool)

(assert (=> b!1253913 (=> (not res!836128) (not e!712447))))

(declare-fun e!712444 () Bool)

(assert (=> b!1253913 (= res!836128 e!712444)))

(declare-fun res!836125 () Bool)

(assert (=> b!1253913 (=> res!836125 e!712444)))

(declare-fun e!712443 () Bool)

(assert (=> b!1253913 (= res!836125 (not e!712443))))

(declare-fun res!836127 () Bool)

(assert (=> b!1253913 (=> (not res!836127) (not e!712443))))

(assert (=> b!1253913 (= res!836127 (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun b!1253914 () Bool)

(declare-fun e!712446 () Bool)

(assert (=> b!1253914 (= e!712446 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61694 () Bool)

(declare-fun call!61697 () ListLongMap!18589)

(declare-fun call!61703 () ListLongMap!18589)

(assert (=> bm!61694 (= call!61697 call!61703)))

(declare-fun b!1253915 () Bool)

(declare-fun e!712436 () Bool)

(declare-fun e!712437 () Bool)

(assert (=> b!1253915 (= e!712436 e!712437)))

(declare-fun res!836126 () Bool)

(declare-fun call!61698 () Bool)

(assert (=> b!1253915 (= res!836126 call!61698)))

(assert (=> b!1253915 (=> (not res!836126) (not e!712437))))

(declare-fun b!1253916 () Bool)

(declare-fun e!712441 () Unit!41583)

(declare-fun lt!566344 () Unit!41583)

(assert (=> b!1253916 (= e!712441 lt!566344)))

(declare-fun lt!566337 () ListLongMap!18589)

(assert (=> b!1253916 (= lt!566337 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566356 () (_ BitVec 64))

(assert (=> b!1253916 (= lt!566356 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566339 () (_ BitVec 64))

(assert (=> b!1253916 (= lt!566339 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566343 () Unit!41583)

(assert (=> b!1253916 (= lt!566343 (addStillContains!1078 lt!566337 lt!566356 zeroValue!871 lt!566339))))

(assert (=> b!1253916 (contains!7493 (+!4207 lt!566337 (tuple2!20717 lt!566356 zeroValue!871)) lt!566339)))

(declare-fun lt!566357 () Unit!41583)

(assert (=> b!1253916 (= lt!566357 lt!566343)))

(declare-fun lt!566342 () ListLongMap!18589)

(assert (=> b!1253916 (= lt!566342 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566346 () (_ BitVec 64))

(assert (=> b!1253916 (= lt!566346 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566348 () (_ BitVec 64))

(assert (=> b!1253916 (= lt!566348 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566340 () Unit!41583)

(assert (=> b!1253916 (= lt!566340 (addApplyDifferent!521 lt!566342 lt!566346 minValueBefore!43 lt!566348))))

(assert (=> b!1253916 (= (apply!978 (+!4207 lt!566342 (tuple2!20717 lt!566346 minValueBefore!43)) lt!566348) (apply!978 lt!566342 lt!566348))))

(declare-fun lt!566345 () Unit!41583)

(assert (=> b!1253916 (= lt!566345 lt!566340)))

(declare-fun lt!566355 () ListLongMap!18589)

(assert (=> b!1253916 (= lt!566355 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566354 () (_ BitVec 64))

(assert (=> b!1253916 (= lt!566354 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566351 () (_ BitVec 64))

(assert (=> b!1253916 (= lt!566351 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!566352 () Unit!41583)

(assert (=> b!1253916 (= lt!566352 (addApplyDifferent!521 lt!566355 lt!566354 zeroValue!871 lt!566351))))

(assert (=> b!1253916 (= (apply!978 (+!4207 lt!566355 (tuple2!20717 lt!566354 zeroValue!871)) lt!566351) (apply!978 lt!566355 lt!566351))))

(declare-fun lt!566341 () Unit!41583)

(assert (=> b!1253916 (= lt!566341 lt!566352)))

(declare-fun lt!566353 () ListLongMap!18589)

(assert (=> b!1253916 (= lt!566353 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566349 () (_ BitVec 64))

(assert (=> b!1253916 (= lt!566349 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!566347 () (_ BitVec 64))

(assert (=> b!1253916 (= lt!566347 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253916 (= lt!566344 (addApplyDifferent!521 lt!566353 lt!566349 minValueBefore!43 lt!566347))))

(assert (=> b!1253916 (= (apply!978 (+!4207 lt!566353 (tuple2!20717 lt!566349 minValueBefore!43)) lt!566347) (apply!978 lt!566353 lt!566347))))

(declare-fun b!1253917 () Bool)

(declare-fun res!836129 () Bool)

(assert (=> b!1253917 (=> (not res!836129) (not e!712447))))

(assert (=> b!1253917 (= res!836129 e!712436)))

(declare-fun c!122298 () Bool)

(assert (=> b!1253917 (= c!122298 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1253918 () Bool)

(assert (=> b!1253918 (= e!712440 (not call!61699))))

(declare-fun b!1253919 () Bool)

(declare-fun e!712445 () ListLongMap!18589)

(assert (=> b!1253919 (= e!712445 call!61697)))

(declare-fun bm!61695 () Bool)

(declare-fun lt!566338 () ListLongMap!18589)

(assert (=> bm!61695 (= call!61699 (contains!7493 lt!566338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253920 () Bool)

(assert (=> b!1253920 (= e!712443 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253921 () Bool)

(assert (=> b!1253921 (= e!712447 e!712440)))

(declare-fun c!122303 () Bool)

(assert (=> b!1253921 (= c!122303 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253922 () Bool)

(declare-fun c!122301 () Bool)

(assert (=> b!1253922 (= c!122301 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!712438 () ListLongMap!18589)

(assert (=> b!1253922 (= e!712438 e!712445)))

(declare-fun b!1253911 () Bool)

(declare-fun e!712442 () ListLongMap!18589)

(assert (=> b!1253911 (= e!712442 (+!4207 call!61703 (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun d!137943 () Bool)

(assert (=> d!137943 e!712447))

(declare-fun res!836124 () Bool)

(assert (=> d!137943 (=> (not res!836124) (not e!712447))))

(assert (=> d!137943 (= res!836124 (or (bvsge #b00000000000000000000000000000000 (size!39728 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))))

(declare-fun lt!566358 () ListLongMap!18589)

(assert (=> d!137943 (= lt!566338 lt!566358)))

(declare-fun lt!566350 () Unit!41583)

(assert (=> d!137943 (= lt!566350 e!712441)))

(declare-fun c!122302 () Bool)

(assert (=> d!137943 (= c!122302 e!712446)))

(declare-fun res!836123 () Bool)

(assert (=> d!137943 (=> (not res!836123) (not e!712446))))

(assert (=> d!137943 (= res!836123 (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (=> d!137943 (= lt!566358 e!712442)))

(declare-fun c!122300 () Bool)

(assert (=> d!137943 (= c!122300 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!137943 (validMask!0 mask!1466)))

(assert (=> d!137943 (= (getCurrentListMap!4443 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566338)))

(declare-fun bm!61696 () Bool)

(declare-fun call!61701 () ListLongMap!18589)

(declare-fun call!61702 () ListLongMap!18589)

(assert (=> bm!61696 (= call!61701 call!61702)))

(declare-fun e!712435 () Bool)

(declare-fun b!1253923 () Bool)

(assert (=> b!1253923 (= e!712435 (= (apply!978 lt!566338 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)) (get!20083 (select (arr!39191 _values!914) #b00000000000000000000000000000000) (dynLambda!3408 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1253923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39729 _values!914)))))

(assert (=> b!1253923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun b!1253924 () Bool)

(assert (=> b!1253924 (= e!712439 (= (apply!978 lt!566338 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!61697 () Bool)

(declare-fun call!61700 () ListLongMap!18589)

(declare-fun c!122299 () Bool)

(assert (=> bm!61697 (= call!61703 (+!4207 (ite c!122300 call!61700 (ite c!122299 call!61702 call!61701)) (ite (or c!122300 c!122299) (tuple2!20717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20717 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1253925 () Bool)

(assert (=> b!1253925 (= e!712442 e!712438)))

(assert (=> b!1253925 (= c!122299 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253926 () Bool)

(assert (=> b!1253926 (= e!712436 (not call!61698))))

(declare-fun b!1253927 () Bool)

(assert (=> b!1253927 (= e!712445 call!61701)))

(declare-fun bm!61698 () Bool)

(assert (=> bm!61698 (= call!61700 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253928 () Bool)

(assert (=> b!1253928 (= e!712437 (= (apply!978 lt!566338 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1253929 () Bool)

(assert (=> b!1253929 (= e!712444 e!712435)))

(declare-fun res!836131 () Bool)

(assert (=> b!1253929 (=> (not res!836131) (not e!712435))))

(assert (=> b!1253929 (= res!836131 (contains!7493 lt!566338 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun b!1253930 () Bool)

(declare-fun Unit!41590 () Unit!41583)

(assert (=> b!1253930 (= e!712441 Unit!41590)))

(declare-fun bm!61699 () Bool)

(assert (=> bm!61699 (= call!61702 call!61700)))

(declare-fun bm!61700 () Bool)

(assert (=> bm!61700 (= call!61698 (contains!7493 lt!566338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1253931 () Bool)

(assert (=> b!1253931 (= e!712438 call!61697)))

(assert (= (and d!137943 c!122300) b!1253911))

(assert (= (and d!137943 (not c!122300)) b!1253925))

(assert (= (and b!1253925 c!122299) b!1253931))

(assert (= (and b!1253925 (not c!122299)) b!1253922))

(assert (= (and b!1253922 c!122301) b!1253919))

(assert (= (and b!1253922 (not c!122301)) b!1253927))

(assert (= (or b!1253919 b!1253927) bm!61696))

(assert (= (or b!1253931 bm!61696) bm!61699))

(assert (= (or b!1253931 b!1253919) bm!61694))

(assert (= (or b!1253911 bm!61699) bm!61698))

(assert (= (or b!1253911 bm!61694) bm!61697))

(assert (= (and d!137943 res!836123) b!1253914))

(assert (= (and d!137943 c!122302) b!1253916))

(assert (= (and d!137943 (not c!122302)) b!1253930))

(assert (= (and d!137943 res!836124) b!1253913))

(assert (= (and b!1253913 res!836127) b!1253920))

(assert (= (and b!1253913 (not res!836125)) b!1253929))

(assert (= (and b!1253929 res!836131) b!1253923))

(assert (= (and b!1253913 res!836128) b!1253917))

(assert (= (and b!1253917 c!122298) b!1253915))

(assert (= (and b!1253917 (not c!122298)) b!1253926))

(assert (= (and b!1253915 res!836126) b!1253928))

(assert (= (or b!1253915 b!1253926) bm!61700))

(assert (= (and b!1253917 res!836129) b!1253921))

(assert (= (and b!1253921 c!122303) b!1253912))

(assert (= (and b!1253921 (not c!122303)) b!1253918))

(assert (= (and b!1253912 res!836130) b!1253924))

(assert (= (or b!1253912 b!1253918) bm!61695))

(declare-fun b_lambda!22595 () Bool)

(assert (=> (not b_lambda!22595) (not b!1253923)))

(assert (=> b!1253923 t!41405))

(declare-fun b_and!44739 () Bool)

(assert (= b_and!44737 (and (=> t!41405 result!23291) b_and!44739)))

(assert (=> d!137943 m!1153959))

(declare-fun m!1154135 () Bool)

(assert (=> bm!61697 m!1154135))

(assert (=> b!1253914 m!1154045))

(assert (=> b!1253914 m!1154045))

(assert (=> b!1253914 m!1154055))

(declare-fun m!1154137 () Bool)

(assert (=> b!1253928 m!1154137))

(assert (=> bm!61698 m!1153981))

(assert (=> b!1253929 m!1154045))

(assert (=> b!1253929 m!1154045))

(declare-fun m!1154139 () Bool)

(assert (=> b!1253929 m!1154139))

(assert (=> b!1253920 m!1154045))

(assert (=> b!1253920 m!1154045))

(assert (=> b!1253920 m!1154055))

(assert (=> b!1253923 m!1154045))

(declare-fun m!1154141 () Bool)

(assert (=> b!1253923 m!1154141))

(assert (=> b!1253923 m!1154087))

(assert (=> b!1253923 m!1154045))

(assert (=> b!1253923 m!1154087))

(assert (=> b!1253923 m!1154089))

(assert (=> b!1253923 m!1154091))

(assert (=> b!1253923 m!1154089))

(declare-fun m!1154143 () Bool)

(assert (=> bm!61695 m!1154143))

(declare-fun m!1154145 () Bool)

(assert (=> b!1253924 m!1154145))

(declare-fun m!1154147 () Bool)

(assert (=> b!1253911 m!1154147))

(declare-fun m!1154149 () Bool)

(assert (=> bm!61700 m!1154149))

(declare-fun m!1154151 () Bool)

(assert (=> b!1253916 m!1154151))

(assert (=> b!1253916 m!1154151))

(declare-fun m!1154153 () Bool)

(assert (=> b!1253916 m!1154153))

(assert (=> b!1253916 m!1153981))

(declare-fun m!1154155 () Bool)

(assert (=> b!1253916 m!1154155))

(declare-fun m!1154157 () Bool)

(assert (=> b!1253916 m!1154157))

(assert (=> b!1253916 m!1154045))

(declare-fun m!1154159 () Bool)

(assert (=> b!1253916 m!1154159))

(declare-fun m!1154161 () Bool)

(assert (=> b!1253916 m!1154161))

(assert (=> b!1253916 m!1154155))

(declare-fun m!1154163 () Bool)

(assert (=> b!1253916 m!1154163))

(declare-fun m!1154165 () Bool)

(assert (=> b!1253916 m!1154165))

(declare-fun m!1154167 () Bool)

(assert (=> b!1253916 m!1154167))

(declare-fun m!1154169 () Bool)

(assert (=> b!1253916 m!1154169))

(declare-fun m!1154171 () Bool)

(assert (=> b!1253916 m!1154171))

(declare-fun m!1154173 () Bool)

(assert (=> b!1253916 m!1154173))

(assert (=> b!1253916 m!1154167))

(declare-fun m!1154175 () Bool)

(assert (=> b!1253916 m!1154175))

(declare-fun m!1154177 () Bool)

(assert (=> b!1253916 m!1154177))

(assert (=> b!1253916 m!1154159))

(declare-fun m!1154179 () Bool)

(assert (=> b!1253916 m!1154179))

(assert (=> b!1253769 d!137943))

(declare-fun d!137945 () Bool)

(assert (=> d!137945 (= (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!566361 () Unit!41583)

(declare-fun choose!1863 (array!81255 array!81257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47815 V!47815 V!47815 V!47815 (_ BitVec 32) Int) Unit!41583)

(assert (=> d!137945 (= lt!566361 (choose!1863 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!137945 (validMask!0 mask!1466)))

(assert (=> d!137945 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1032 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566361)))

(declare-fun bs!35401 () Bool)

(assert (= bs!35401 d!137945))

(assert (=> bs!35401 m!1153981))

(assert (=> bs!35401 m!1153979))

(declare-fun m!1154181 () Bool)

(assert (=> bs!35401 m!1154181))

(assert (=> bs!35401 m!1153959))

(assert (=> b!1253765 d!137945))

(declare-fun call!61706 () ListLongMap!18589)

(declare-fun bm!61703 () Bool)

(assert (=> bm!61703 (= call!61706 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1253956 () Bool)

(declare-fun e!712462 () Bool)

(declare-fun e!712465 () Bool)

(assert (=> b!1253956 (= e!712462 e!712465)))

(declare-fun c!122314 () Bool)

(assert (=> b!1253956 (= c!122314 (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun b!1253957 () Bool)

(declare-fun e!712464 () ListLongMap!18589)

(declare-fun e!712467 () ListLongMap!18589)

(assert (=> b!1253957 (= e!712464 e!712467)))

(declare-fun c!122312 () Bool)

(assert (=> b!1253957 (= c!122312 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253958 () Bool)

(declare-fun lt!566382 () Unit!41583)

(declare-fun lt!566376 () Unit!41583)

(assert (=> b!1253958 (= lt!566382 lt!566376)))

(declare-fun lt!566377 () ListLongMap!18589)

(declare-fun lt!566381 () (_ BitVec 64))

(declare-fun lt!566378 () V!47815)

(declare-fun lt!566379 () (_ BitVec 64))

(assert (=> b!1253958 (not (contains!7493 (+!4207 lt!566377 (tuple2!20717 lt!566379 lt!566378)) lt!566381))))

(declare-fun addStillNotContains!314 (ListLongMap!18589 (_ BitVec 64) V!47815 (_ BitVec 64)) Unit!41583)

(assert (=> b!1253958 (= lt!566376 (addStillNotContains!314 lt!566377 lt!566379 lt!566378 lt!566381))))

(assert (=> b!1253958 (= lt!566381 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1253958 (= lt!566378 (get!20083 (select (arr!39191 _values!914) #b00000000000000000000000000000000) (dynLambda!3408 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1253958 (= lt!566379 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253958 (= lt!566377 call!61706)))

(assert (=> b!1253958 (= e!712467 (+!4207 call!61706 (tuple2!20717 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000) (get!20083 (select (arr!39191 _values!914) #b00000000000000000000000000000000) (dynLambda!3408 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1253959 () Bool)

(assert (=> b!1253959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (=> b!1253959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39729 _values!914)))))

(declare-fun lt!566380 () ListLongMap!18589)

(declare-fun e!712468 () Bool)

(assert (=> b!1253959 (= e!712468 (= (apply!978 lt!566380 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)) (get!20083 (select (arr!39191 _values!914) #b00000000000000000000000000000000) (dynLambda!3408 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1253960 () Bool)

(declare-fun res!836143 () Bool)

(declare-fun e!712463 () Bool)

(assert (=> b!1253960 (=> (not res!836143) (not e!712463))))

(assert (=> b!1253960 (= res!836143 (not (contains!7493 lt!566380 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1253961 () Bool)

(assert (=> b!1253961 (= e!712463 e!712462)))

(declare-fun c!122315 () Bool)

(declare-fun e!712466 () Bool)

(assert (=> b!1253961 (= c!122315 e!712466)))

(declare-fun res!836140 () Bool)

(assert (=> b!1253961 (=> (not res!836140) (not e!712466))))

(assert (=> b!1253961 (= res!836140 (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun d!137947 () Bool)

(assert (=> d!137947 e!712463))

(declare-fun res!836141 () Bool)

(assert (=> d!137947 (=> (not res!836141) (not e!712463))))

(assert (=> d!137947 (= res!836141 (not (contains!7493 lt!566380 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137947 (= lt!566380 e!712464)))

(declare-fun c!122313 () Bool)

(assert (=> d!137947 (= c!122313 (bvsge #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (=> d!137947 (validMask!0 mask!1466)))

(assert (=> d!137947 (= (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566380)))

(declare-fun b!1253962 () Bool)

(assert (=> b!1253962 (= e!712467 call!61706)))

(declare-fun b!1253963 () Bool)

(assert (=> b!1253963 (= e!712466 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253963 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1253964 () Bool)

(declare-fun isEmpty!1033 (ListLongMap!18589) Bool)

(assert (=> b!1253964 (= e!712465 (isEmpty!1033 lt!566380))))

(declare-fun b!1253965 () Bool)

(assert (=> b!1253965 (= e!712462 e!712468)))

(assert (=> b!1253965 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun res!836142 () Bool)

(assert (=> b!1253965 (= res!836142 (contains!7493 lt!566380 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253965 (=> (not res!836142) (not e!712468))))

(declare-fun b!1253966 () Bool)

(assert (=> b!1253966 (= e!712465 (= lt!566380 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1253967 () Bool)

(assert (=> b!1253967 (= e!712464 (ListLongMap!18590 Nil!27923))))

(assert (= (and d!137947 c!122313) b!1253967))

(assert (= (and d!137947 (not c!122313)) b!1253957))

(assert (= (and b!1253957 c!122312) b!1253958))

(assert (= (and b!1253957 (not c!122312)) b!1253962))

(assert (= (or b!1253958 b!1253962) bm!61703))

(assert (= (and d!137947 res!836141) b!1253960))

(assert (= (and b!1253960 res!836143) b!1253961))

(assert (= (and b!1253961 res!836140) b!1253963))

(assert (= (and b!1253961 c!122315) b!1253965))

(assert (= (and b!1253961 (not c!122315)) b!1253956))

(assert (= (and b!1253965 res!836142) b!1253959))

(assert (= (and b!1253956 c!122314) b!1253966))

(assert (= (and b!1253956 (not c!122314)) b!1253964))

(declare-fun b_lambda!22597 () Bool)

(assert (=> (not b_lambda!22597) (not b!1253958)))

(assert (=> b!1253958 t!41405))

(declare-fun b_and!44741 () Bool)

(assert (= b_and!44739 (and (=> t!41405 result!23291) b_and!44741)))

(declare-fun b_lambda!22599 () Bool)

(assert (=> (not b_lambda!22599) (not b!1253959)))

(assert (=> b!1253959 t!41405))

(declare-fun b_and!44743 () Bool)

(assert (= b_and!44741 (and (=> t!41405 result!23291) b_and!44743)))

(assert (=> b!1253959 m!1154087))

(assert (=> b!1253959 m!1154089))

(assert (=> b!1253959 m!1154045))

(declare-fun m!1154183 () Bool)

(assert (=> b!1253959 m!1154183))

(assert (=> b!1253959 m!1154087))

(assert (=> b!1253959 m!1154089))

(assert (=> b!1253959 m!1154091))

(assert (=> b!1253959 m!1154045))

(declare-fun m!1154185 () Bool)

(assert (=> d!137947 m!1154185))

(assert (=> d!137947 m!1153959))

(declare-fun m!1154187 () Bool)

(assert (=> bm!61703 m!1154187))

(assert (=> b!1253963 m!1154045))

(assert (=> b!1253963 m!1154045))

(assert (=> b!1253963 m!1154055))

(assert (=> b!1253966 m!1154187))

(assert (=> b!1253957 m!1154045))

(assert (=> b!1253957 m!1154045))

(assert (=> b!1253957 m!1154055))

(declare-fun m!1154189 () Bool)

(assert (=> b!1253960 m!1154189))

(assert (=> b!1253958 m!1154087))

(declare-fun m!1154191 () Bool)

(assert (=> b!1253958 m!1154191))

(declare-fun m!1154193 () Bool)

(assert (=> b!1253958 m!1154193))

(assert (=> b!1253958 m!1154191))

(declare-fun m!1154195 () Bool)

(assert (=> b!1253958 m!1154195))

(assert (=> b!1253958 m!1154087))

(assert (=> b!1253958 m!1154089))

(assert (=> b!1253958 m!1154091))

(assert (=> b!1253958 m!1154045))

(assert (=> b!1253958 m!1154089))

(declare-fun m!1154197 () Bool)

(assert (=> b!1253958 m!1154197))

(assert (=> b!1253965 m!1154045))

(assert (=> b!1253965 m!1154045))

(declare-fun m!1154199 () Bool)

(assert (=> b!1253965 m!1154199))

(declare-fun m!1154201 () Bool)

(assert (=> b!1253964 m!1154201))

(assert (=> b!1253765 d!137947))

(declare-fun call!61707 () ListLongMap!18589)

(declare-fun bm!61704 () Bool)

(assert (=> bm!61704 (= call!61707 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1253968 () Bool)

(declare-fun e!712469 () Bool)

(declare-fun e!712472 () Bool)

(assert (=> b!1253968 (= e!712469 e!712472)))

(declare-fun c!122318 () Bool)

(assert (=> b!1253968 (= c!122318 (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun b!1253969 () Bool)

(declare-fun e!712471 () ListLongMap!18589)

(declare-fun e!712474 () ListLongMap!18589)

(assert (=> b!1253969 (= e!712471 e!712474)))

(declare-fun c!122316 () Bool)

(assert (=> b!1253969 (= c!122316 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253970 () Bool)

(declare-fun lt!566389 () Unit!41583)

(declare-fun lt!566383 () Unit!41583)

(assert (=> b!1253970 (= lt!566389 lt!566383)))

(declare-fun lt!566388 () (_ BitVec 64))

(declare-fun lt!566384 () ListLongMap!18589)

(declare-fun lt!566385 () V!47815)

(declare-fun lt!566386 () (_ BitVec 64))

(assert (=> b!1253970 (not (contains!7493 (+!4207 lt!566384 (tuple2!20717 lt!566386 lt!566385)) lt!566388))))

(assert (=> b!1253970 (= lt!566383 (addStillNotContains!314 lt!566384 lt!566386 lt!566385 lt!566388))))

(assert (=> b!1253970 (= lt!566388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1253970 (= lt!566385 (get!20083 (select (arr!39191 _values!914) #b00000000000000000000000000000000) (dynLambda!3408 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1253970 (= lt!566386 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1253970 (= lt!566384 call!61707)))

(assert (=> b!1253970 (= e!712474 (+!4207 call!61707 (tuple2!20717 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000) (get!20083 (select (arr!39191 _values!914) #b00000000000000000000000000000000) (dynLambda!3408 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1253971 () Bool)

(assert (=> b!1253971 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (=> b!1253971 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39729 _values!914)))))

(declare-fun e!712475 () Bool)

(declare-fun lt!566387 () ListLongMap!18589)

(assert (=> b!1253971 (= e!712475 (= (apply!978 lt!566387 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)) (get!20083 (select (arr!39191 _values!914) #b00000000000000000000000000000000) (dynLambda!3408 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1253972 () Bool)

(declare-fun res!836147 () Bool)

(declare-fun e!712470 () Bool)

(assert (=> b!1253972 (=> (not res!836147) (not e!712470))))

(assert (=> b!1253972 (= res!836147 (not (contains!7493 lt!566387 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1253973 () Bool)

(assert (=> b!1253973 (= e!712470 e!712469)))

(declare-fun c!122319 () Bool)

(declare-fun e!712473 () Bool)

(assert (=> b!1253973 (= c!122319 e!712473)))

(declare-fun res!836144 () Bool)

(assert (=> b!1253973 (=> (not res!836144) (not e!712473))))

(assert (=> b!1253973 (= res!836144 (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun d!137949 () Bool)

(assert (=> d!137949 e!712470))

(declare-fun res!836145 () Bool)

(assert (=> d!137949 (=> (not res!836145) (not e!712470))))

(assert (=> d!137949 (= res!836145 (not (contains!7493 lt!566387 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!137949 (= lt!566387 e!712471)))

(declare-fun c!122317 () Bool)

(assert (=> d!137949 (= c!122317 (bvsge #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (=> d!137949 (validMask!0 mask!1466)))

(assert (=> d!137949 (= (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!566387)))

(declare-fun b!1253974 () Bool)

(assert (=> b!1253974 (= e!712474 call!61707)))

(declare-fun b!1253975 () Bool)

(assert (=> b!1253975 (= e!712473 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253975 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1253976 () Bool)

(assert (=> b!1253976 (= e!712472 (isEmpty!1033 lt!566387))))

(declare-fun b!1253977 () Bool)

(assert (=> b!1253977 (= e!712469 e!712475)))

(assert (=> b!1253977 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(declare-fun res!836146 () Bool)

(assert (=> b!1253977 (= res!836146 (contains!7493 lt!566387 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1253977 (=> (not res!836146) (not e!712475))))

(declare-fun b!1253978 () Bool)

(assert (=> b!1253978 (= e!712472 (= lt!566387 (getCurrentListMapNoExtraKeys!5710 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1253979 () Bool)

(assert (=> b!1253979 (= e!712471 (ListLongMap!18590 Nil!27923))))

(assert (= (and d!137949 c!122317) b!1253979))

(assert (= (and d!137949 (not c!122317)) b!1253969))

(assert (= (and b!1253969 c!122316) b!1253970))

(assert (= (and b!1253969 (not c!122316)) b!1253974))

(assert (= (or b!1253970 b!1253974) bm!61704))

(assert (= (and d!137949 res!836145) b!1253972))

(assert (= (and b!1253972 res!836147) b!1253973))

(assert (= (and b!1253973 res!836144) b!1253975))

(assert (= (and b!1253973 c!122319) b!1253977))

(assert (= (and b!1253973 (not c!122319)) b!1253968))

(assert (= (and b!1253977 res!836146) b!1253971))

(assert (= (and b!1253968 c!122318) b!1253978))

(assert (= (and b!1253968 (not c!122318)) b!1253976))

(declare-fun b_lambda!22601 () Bool)

(assert (=> (not b_lambda!22601) (not b!1253970)))

(assert (=> b!1253970 t!41405))

(declare-fun b_and!44745 () Bool)

(assert (= b_and!44743 (and (=> t!41405 result!23291) b_and!44745)))

(declare-fun b_lambda!22603 () Bool)

(assert (=> (not b_lambda!22603) (not b!1253971)))

(assert (=> b!1253971 t!41405))

(declare-fun b_and!44747 () Bool)

(assert (= b_and!44745 (and (=> t!41405 result!23291) b_and!44747)))

(assert (=> b!1253971 m!1154087))

(assert (=> b!1253971 m!1154089))

(assert (=> b!1253971 m!1154045))

(declare-fun m!1154203 () Bool)

(assert (=> b!1253971 m!1154203))

(assert (=> b!1253971 m!1154087))

(assert (=> b!1253971 m!1154089))

(assert (=> b!1253971 m!1154091))

(assert (=> b!1253971 m!1154045))

(declare-fun m!1154205 () Bool)

(assert (=> d!137949 m!1154205))

(assert (=> d!137949 m!1153959))

(declare-fun m!1154207 () Bool)

(assert (=> bm!61704 m!1154207))

(assert (=> b!1253975 m!1154045))

(assert (=> b!1253975 m!1154045))

(assert (=> b!1253975 m!1154055))

(assert (=> b!1253978 m!1154207))

(assert (=> b!1253969 m!1154045))

(assert (=> b!1253969 m!1154045))

(assert (=> b!1253969 m!1154055))

(declare-fun m!1154209 () Bool)

(assert (=> b!1253972 m!1154209))

(assert (=> b!1253970 m!1154087))

(declare-fun m!1154211 () Bool)

(assert (=> b!1253970 m!1154211))

(declare-fun m!1154213 () Bool)

(assert (=> b!1253970 m!1154213))

(assert (=> b!1253970 m!1154211))

(declare-fun m!1154215 () Bool)

(assert (=> b!1253970 m!1154215))

(assert (=> b!1253970 m!1154087))

(assert (=> b!1253970 m!1154089))

(assert (=> b!1253970 m!1154091))

(assert (=> b!1253970 m!1154045))

(assert (=> b!1253970 m!1154089))

(declare-fun m!1154217 () Bool)

(assert (=> b!1253970 m!1154217))

(assert (=> b!1253977 m!1154045))

(assert (=> b!1253977 m!1154045))

(declare-fun m!1154219 () Bool)

(assert (=> b!1253977 m!1154219))

(declare-fun m!1154221 () Bool)

(assert (=> b!1253976 m!1154221))

(assert (=> b!1253765 d!137949))

(declare-fun b!1253990 () Bool)

(declare-fun e!712485 () Bool)

(declare-fun call!61710 () Bool)

(assert (=> b!1253990 (= e!712485 call!61710)))

(declare-fun d!137951 () Bool)

(declare-fun res!836156 () Bool)

(declare-fun e!712487 () Bool)

(assert (=> d!137951 (=> res!836156 e!712487)))

(assert (=> d!137951 (= res!836156 (bvsge #b00000000000000000000000000000000 (size!39728 _keys!1118)))))

(assert (=> d!137951 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27924) e!712487)))

(declare-fun bm!61707 () Bool)

(declare-fun c!122322 () Bool)

(assert (=> bm!61707 (= call!61710 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122322 (Cons!27923 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000) Nil!27924) Nil!27924)))))

(declare-fun b!1253991 () Bool)

(assert (=> b!1253991 (= e!712485 call!61710)))

(declare-fun b!1253992 () Bool)

(declare-fun e!712486 () Bool)

(assert (=> b!1253992 (= e!712486 e!712485)))

(assert (=> b!1253992 (= c!122322 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253993 () Bool)

(assert (=> b!1253993 (= e!712487 e!712486)))

(declare-fun res!836154 () Bool)

(assert (=> b!1253993 (=> (not res!836154) (not e!712486))))

(declare-fun e!712484 () Bool)

(assert (=> b!1253993 (= res!836154 (not e!712484))))

(declare-fun res!836155 () Bool)

(assert (=> b!1253993 (=> (not res!836155) (not e!712484))))

(assert (=> b!1253993 (= res!836155 (validKeyInArray!0 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1253994 () Bool)

(declare-fun contains!7495 (List!27927 (_ BitVec 64)) Bool)

(assert (=> b!1253994 (= e!712484 (contains!7495 Nil!27924 (select (arr!39190 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137951 (not res!836156)) b!1253993))

(assert (= (and b!1253993 res!836155) b!1253994))

(assert (= (and b!1253993 res!836154) b!1253992))

(assert (= (and b!1253992 c!122322) b!1253991))

(assert (= (and b!1253992 (not c!122322)) b!1253990))

(assert (= (or b!1253991 b!1253990) bm!61707))

(assert (=> bm!61707 m!1154045))

(declare-fun m!1154223 () Bool)

(assert (=> bm!61707 m!1154223))

(assert (=> b!1253992 m!1154045))

(assert (=> b!1253992 m!1154045))

(assert (=> b!1253992 m!1154055))

(assert (=> b!1253993 m!1154045))

(assert (=> b!1253993 m!1154045))

(assert (=> b!1253993 m!1154055))

(assert (=> b!1253994 m!1154045))

(assert (=> b!1253994 m!1154045))

(declare-fun m!1154225 () Bool)

(assert (=> b!1253994 m!1154225))

(assert (=> b!1253766 d!137951))

(declare-fun b!1254001 () Bool)

(declare-fun e!712492 () Bool)

(assert (=> b!1254001 (= e!712492 tp_is_empty!31837)))

(declare-fun condMapEmpty!49540 () Bool)

(declare-fun mapDefault!49540 () ValueCell!15155)

(assert (=> mapNonEmpty!49531 (= condMapEmpty!49540 (= mapRest!49531 ((as const (Array (_ BitVec 32) ValueCell!15155)) mapDefault!49540)))))

(declare-fun e!712493 () Bool)

(declare-fun mapRes!49540 () Bool)

(assert (=> mapNonEmpty!49531 (= tp!94309 (and e!712493 mapRes!49540))))

(declare-fun b!1254002 () Bool)

(assert (=> b!1254002 (= e!712493 tp_is_empty!31837)))

(declare-fun mapNonEmpty!49540 () Bool)

(declare-fun tp!94325 () Bool)

(assert (=> mapNonEmpty!49540 (= mapRes!49540 (and tp!94325 e!712492))))

(declare-fun mapValue!49540 () ValueCell!15155)

(declare-fun mapKey!49540 () (_ BitVec 32))

(declare-fun mapRest!49540 () (Array (_ BitVec 32) ValueCell!15155))

(assert (=> mapNonEmpty!49540 (= mapRest!49531 (store mapRest!49540 mapKey!49540 mapValue!49540))))

(declare-fun mapIsEmpty!49540 () Bool)

(assert (=> mapIsEmpty!49540 mapRes!49540))

(assert (= (and mapNonEmpty!49531 condMapEmpty!49540) mapIsEmpty!49540))

(assert (= (and mapNonEmpty!49531 (not condMapEmpty!49540)) mapNonEmpty!49540))

(assert (= (and mapNonEmpty!49540 ((_ is ValueCellFull!15155) mapValue!49540)) b!1254001))

(assert (= (and mapNonEmpty!49531 ((_ is ValueCellFull!15155) mapDefault!49540)) b!1254002))

(declare-fun m!1154227 () Bool)

(assert (=> mapNonEmpty!49540 m!1154227))

(declare-fun b_lambda!22605 () Bool)

(assert (= b_lambda!22597 (or (and start!105214 b_free!26935) b_lambda!22605)))

(declare-fun b_lambda!22607 () Bool)

(assert (= b_lambda!22595 (or (and start!105214 b_free!26935) b_lambda!22607)))

(declare-fun b_lambda!22609 () Bool)

(assert (= b_lambda!22601 (or (and start!105214 b_free!26935) b_lambda!22609)))

(declare-fun b_lambda!22611 () Bool)

(assert (= b_lambda!22603 (or (and start!105214 b_free!26935) b_lambda!22611)))

(declare-fun b_lambda!22613 () Bool)

(assert (= b_lambda!22593 (or (and start!105214 b_free!26935) b_lambda!22613)))

(declare-fun b_lambda!22615 () Bool)

(assert (= b_lambda!22599 (or (and start!105214 b_free!26935) b_lambda!22615)))

(check-sat (not b!1253844) (not b!1253970) (not b!1253924) (not b!1253978) (not bm!61703) (not b_lambda!22613) (not b_next!26935) (not b!1253972) (not d!137937) (not bm!61698) (not b!1253993) (not b!1253900) (not b!1253916) (not b!1253994) (not b!1253971) (not b!1253888) (not b!1253965) (not b!1253906) (not bm!61688) (not b!1253976) (not b!1253836) (not bm!61700) (not bm!61690) (not mapNonEmpty!49540) (not bm!61693) (not bm!61704) (not b!1253963) (not d!137933) (not b_lambda!22607) (not b!1253901) (not b!1253975) (not d!137935) b_and!44747 (not d!137945) (not b!1253958) (not b_lambda!22611) (not b!1253966) (not d!137941) (not b!1253964) (not b!1253960) (not b!1253905) (not b!1253928) (not b!1253969) (not d!137949) (not b!1253920) tp_is_empty!31837 (not d!137943) (not b_lambda!22609) (not b!1253959) (not b!1253845) (not bm!61695) (not b!1253891) (not b!1253914) (not b!1253893) (not b!1253977) (not b_lambda!22605) (not bm!61697) (not b_lambda!22615) (not b!1253923) (not b!1253992) (not b!1253957) (not bm!61691) (not b!1253897) (not b!1253839) (not bm!61707) (not b!1253911) (not d!137947) (not d!137939) (not b!1253929) (not bm!61672))
(check-sat b_and!44747 (not b_next!26935))
