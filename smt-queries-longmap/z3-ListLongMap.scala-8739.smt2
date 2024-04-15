; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105976 () Bool)

(assert start!105976)

(declare-fun b_free!27469 () Bool)

(declare-fun b_next!27469 () Bool)

(assert (=> start!105976 (= b_free!27469 (not b_next!27469))))

(declare-fun tp!95948 () Bool)

(declare-fun b_and!45389 () Bool)

(assert (=> start!105976 (= tp!95948 b_and!45389)))

(declare-fun b!1262039 () Bool)

(declare-fun e!718368 () Bool)

(declare-fun e!718365 () Bool)

(declare-fun mapRes!50368 () Bool)

(assert (=> b!1262039 (= e!718368 (and e!718365 mapRes!50368))))

(declare-fun condMapEmpty!50368 () Bool)

(declare-datatypes ((V!48527 0))(
  ( (V!48528 (val!16248 Int)) )
))
(declare-datatypes ((ValueCell!15422 0))(
  ( (ValueCellFull!15422 (v!18953 V!48527)) (EmptyCell!15422) )
))
(declare-datatypes ((array!82283 0))(
  ( (array!82284 (arr!39692 (Array (_ BitVec 32) ValueCell!15422)) (size!40230 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82283)

(declare-fun mapDefault!50368 () ValueCell!15422)

(assert (=> b!1262039 (= condMapEmpty!50368 (= (arr!39692 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15422)) mapDefault!50368)))))

(declare-fun b!1262040 () Bool)

(declare-fun res!840857 () Bool)

(declare-fun e!718363 () Bool)

(assert (=> b!1262040 (=> (not res!840857) (not e!718363))))

(declare-datatypes ((array!82285 0))(
  ( (array!82286 (arr!39693 (Array (_ BitVec 32) (_ BitVec 64))) (size!40231 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82285)

(declare-datatypes ((List!28308 0))(
  ( (Nil!28305) (Cons!28304 (h!29513 (_ BitVec 64)) (t!41804 List!28308)) )
))
(declare-fun arrayNoDuplicates!0 (array!82285 (_ BitVec 32) List!28308) Bool)

(assert (=> b!1262040 (= res!840857 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28305))))

(declare-fun b!1262041 () Bool)

(declare-fun res!840861 () Bool)

(assert (=> b!1262041 (=> (not res!840861) (not e!718363))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82285 (_ BitVec 32)) Bool)

(assert (=> b!1262041 (= res!840861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50368 () Bool)

(declare-fun tp!95947 () Bool)

(declare-fun e!718364 () Bool)

(assert (=> mapNonEmpty!50368 (= mapRes!50368 (and tp!95947 e!718364))))

(declare-fun mapKey!50368 () (_ BitVec 32))

(declare-fun mapValue!50368 () ValueCell!15422)

(declare-fun mapRest!50368 () (Array (_ BitVec 32) ValueCell!15422))

(assert (=> mapNonEmpty!50368 (= (arr!39692 _values!914) (store mapRest!50368 mapKey!50368 mapValue!50368))))

(declare-fun b!1262042 () Bool)

(declare-fun tp_is_empty!32371 () Bool)

(assert (=> b!1262042 (= e!718364 tp_is_empty!32371)))

(declare-fun b!1262043 () Bool)

(declare-fun res!840860 () Bool)

(assert (=> b!1262043 (=> (not res!840860) (not e!718363))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1262043 (= res!840860 (and (= (size!40230 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40231 _keys!1118) (size!40230 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262044 () Bool)

(declare-fun e!718366 () Bool)

(assert (=> b!1262044 (= e!718363 (not e!718366))))

(declare-fun res!840858 () Bool)

(assert (=> b!1262044 (=> res!840858 e!718366)))

(assert (=> b!1262044 (= res!840858 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21106 0))(
  ( (tuple2!21107 (_1!10564 (_ BitVec 64)) (_2!10564 V!48527)) )
))
(declare-datatypes ((List!28309 0))(
  ( (Nil!28306) (Cons!28305 (h!29514 tuple2!21106) (t!41805 List!28309)) )
))
(declare-datatypes ((ListLongMap!18979 0))(
  ( (ListLongMap!18980 (toList!9505 List!28309)) )
))
(declare-fun lt!571868 () ListLongMap!18979)

(declare-fun lt!571866 () ListLongMap!18979)

(assert (=> b!1262044 (= lt!571868 lt!571866)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48527)

(declare-fun zeroValue!871 () V!48527)

(declare-datatypes ((Unit!41919 0))(
  ( (Unit!41920) )
))
(declare-fun lt!571867 () Unit!41919)

(declare-fun minValueBefore!43 () V!48527)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1173 (array!82285 array!82283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48527 V!48527 V!48527 V!48527 (_ BitVec 32) Int) Unit!41919)

(assert (=> b!1262044 (= lt!571867 (lemmaNoChangeToArrayThenSameMapNoExtras!1173 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5873 (array!82285 array!82283 (_ BitVec 32) (_ BitVec 32) V!48527 V!48527 (_ BitVec 32) Int) ListLongMap!18979)

(assert (=> b!1262044 (= lt!571866 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262044 (= lt!571868 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262045 () Bool)

(assert (=> b!1262045 (= e!718365 tp_is_empty!32371)))

(declare-fun b!1262046 () Bool)

(declare-fun getCurrentListMap!4561 (array!82285 array!82283 (_ BitVec 32) (_ BitVec 32) V!48527 V!48527 (_ BitVec 32) Int) ListLongMap!18979)

(declare-fun +!4279 (ListLongMap!18979 tuple2!21106) ListLongMap!18979)

(assert (=> b!1262046 (= e!718366 (= (getCurrentListMap!4561 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4279 lt!571868 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!571865 () ListLongMap!18979)

(assert (=> b!1262046 (= lt!571865 (getCurrentListMap!4561 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50368 () Bool)

(assert (=> mapIsEmpty!50368 mapRes!50368))

(declare-fun res!840859 () Bool)

(assert (=> start!105976 (=> (not res!840859) (not e!718363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105976 (= res!840859 (validMask!0 mask!1466))))

(assert (=> start!105976 e!718363))

(assert (=> start!105976 true))

(assert (=> start!105976 tp!95948))

(assert (=> start!105976 tp_is_empty!32371))

(declare-fun array_inv!30365 (array!82285) Bool)

(assert (=> start!105976 (array_inv!30365 _keys!1118)))

(declare-fun array_inv!30366 (array!82283) Bool)

(assert (=> start!105976 (and (array_inv!30366 _values!914) e!718368)))

(assert (= (and start!105976 res!840859) b!1262043))

(assert (= (and b!1262043 res!840860) b!1262041))

(assert (= (and b!1262041 res!840861) b!1262040))

(assert (= (and b!1262040 res!840857) b!1262044))

(assert (= (and b!1262044 (not res!840858)) b!1262046))

(assert (= (and b!1262039 condMapEmpty!50368) mapIsEmpty!50368))

(assert (= (and b!1262039 (not condMapEmpty!50368)) mapNonEmpty!50368))

(get-info :version)

(assert (= (and mapNonEmpty!50368 ((_ is ValueCellFull!15422) mapValue!50368)) b!1262042))

(assert (= (and b!1262039 ((_ is ValueCellFull!15422) mapDefault!50368)) b!1262045))

(assert (= start!105976 b!1262039))

(declare-fun m!1162131 () Bool)

(assert (=> start!105976 m!1162131))

(declare-fun m!1162133 () Bool)

(assert (=> start!105976 m!1162133))

(declare-fun m!1162135 () Bool)

(assert (=> start!105976 m!1162135))

(declare-fun m!1162137 () Bool)

(assert (=> b!1262041 m!1162137))

(declare-fun m!1162139 () Bool)

(assert (=> b!1262040 m!1162139))

(declare-fun m!1162141 () Bool)

(assert (=> b!1262046 m!1162141))

(declare-fun m!1162143 () Bool)

(assert (=> b!1262046 m!1162143))

(declare-fun m!1162145 () Bool)

(assert (=> b!1262046 m!1162145))

(declare-fun m!1162147 () Bool)

(assert (=> b!1262044 m!1162147))

(declare-fun m!1162149 () Bool)

(assert (=> b!1262044 m!1162149))

(declare-fun m!1162151 () Bool)

(assert (=> b!1262044 m!1162151))

(declare-fun m!1162153 () Bool)

(assert (=> mapNonEmpty!50368 m!1162153))

(check-sat b_and!45389 (not start!105976) (not mapNonEmpty!50368) (not b!1262044) (not b_next!27469) (not b!1262040) tp_is_empty!32371 (not b!1262046) (not b!1262041))
(check-sat b_and!45389 (not b_next!27469))
(get-model)

(declare-fun d!138381 () Bool)

(assert (=> d!138381 (= (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571895 () Unit!41919)

(declare-fun choose!1880 (array!82285 array!82283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48527 V!48527 V!48527 V!48527 (_ BitVec 32) Int) Unit!41919)

(assert (=> d!138381 (= lt!571895 (choose!1880 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138381 (validMask!0 mask!1466)))

(assert (=> d!138381 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1173 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571895)))

(declare-fun bs!35694 () Bool)

(assert (= bs!35694 d!138381))

(assert (=> bs!35694 m!1162151))

(assert (=> bs!35694 m!1162149))

(declare-fun m!1162203 () Bool)

(assert (=> bs!35694 m!1162203))

(assert (=> bs!35694 m!1162131))

(assert (=> b!1262044 d!138381))

(declare-fun b!1262119 () Bool)

(declare-fun e!718421 () Bool)

(declare-fun e!718424 () Bool)

(assert (=> b!1262119 (= e!718421 e!718424)))

(declare-fun c!122755 () Bool)

(declare-fun e!718422 () Bool)

(assert (=> b!1262119 (= c!122755 e!718422)))

(declare-fun res!840900 () Bool)

(assert (=> b!1262119 (=> (not res!840900) (not e!718422))))

(assert (=> b!1262119 (= res!840900 (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun b!1262120 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1262120 (= e!718422 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262120 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262121 () Bool)

(declare-fun e!718419 () Bool)

(assert (=> b!1262121 (= e!718424 e!718419)))

(declare-fun c!122754 () Bool)

(assert (=> b!1262121 (= c!122754 (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun b!1262122 () Bool)

(declare-fun res!840902 () Bool)

(assert (=> b!1262122 (=> (not res!840902) (not e!718421))))

(declare-fun lt!571910 () ListLongMap!18979)

(declare-fun contains!7559 (ListLongMap!18979 (_ BitVec 64)) Bool)

(assert (=> b!1262122 (= res!840902 (not (contains!7559 lt!571910 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138383 () Bool)

(assert (=> d!138383 e!718421))

(declare-fun res!840901 () Bool)

(assert (=> d!138383 (=> (not res!840901) (not e!718421))))

(assert (=> d!138383 (= res!840901 (not (contains!7559 lt!571910 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718423 () ListLongMap!18979)

(assert (=> d!138383 (= lt!571910 e!718423)))

(declare-fun c!122753 () Bool)

(assert (=> d!138383 (= c!122753 (bvsge #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(assert (=> d!138383 (validMask!0 mask!1466)))

(assert (=> d!138383 (= (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571910)))

(declare-fun b!1262123 () Bool)

(declare-fun e!718425 () ListLongMap!18979)

(assert (=> b!1262123 (= e!718423 e!718425)))

(declare-fun c!122756 () Bool)

(assert (=> b!1262123 (= c!122756 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262124 () Bool)

(assert (=> b!1262124 (= e!718419 (= lt!571910 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62016 () Bool)

(declare-fun call!62019 () ListLongMap!18979)

(assert (=> bm!62016 (= call!62019 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262125 () Bool)

(assert (=> b!1262125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(assert (=> b!1262125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40230 _values!914)))))

(declare-fun e!718420 () Bool)

(declare-fun apply!990 (ListLongMap!18979 (_ BitVec 64)) V!48527)

(declare-fun get!20273 (ValueCell!15422 V!48527) V!48527)

(declare-fun dynLambda!3420 (Int (_ BitVec 64)) V!48527)

(assert (=> b!1262125 (= e!718420 (= (apply!990 lt!571910 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)) (get!20273 (select (arr!39692 _values!914) #b00000000000000000000000000000000) (dynLambda!3420 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262126 () Bool)

(assert (=> b!1262126 (= e!718423 (ListLongMap!18980 Nil!28306))))

(declare-fun b!1262127 () Bool)

(declare-fun lt!571912 () Unit!41919)

(declare-fun lt!571913 () Unit!41919)

(assert (=> b!1262127 (= lt!571912 lt!571913)))

(declare-fun lt!571916 () V!48527)

(declare-fun lt!571914 () (_ BitVec 64))

(declare-fun lt!571911 () (_ BitVec 64))

(declare-fun lt!571915 () ListLongMap!18979)

(assert (=> b!1262127 (not (contains!7559 (+!4279 lt!571915 (tuple2!21107 lt!571911 lt!571916)) lt!571914))))

(declare-fun addStillNotContains!326 (ListLongMap!18979 (_ BitVec 64) V!48527 (_ BitVec 64)) Unit!41919)

(assert (=> b!1262127 (= lt!571913 (addStillNotContains!326 lt!571915 lt!571911 lt!571916 lt!571914))))

(assert (=> b!1262127 (= lt!571914 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262127 (= lt!571916 (get!20273 (select (arr!39692 _values!914) #b00000000000000000000000000000000) (dynLambda!3420 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262127 (= lt!571911 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262127 (= lt!571915 call!62019)))

(assert (=> b!1262127 (= e!718425 (+!4279 call!62019 (tuple2!21107 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000) (get!20273 (select (arr!39692 _values!914) #b00000000000000000000000000000000) (dynLambda!3420 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262128 () Bool)

(assert (=> b!1262128 (= e!718425 call!62019)))

(declare-fun b!1262129 () Bool)

(assert (=> b!1262129 (= e!718424 e!718420)))

(assert (=> b!1262129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun res!840903 () Bool)

(assert (=> b!1262129 (= res!840903 (contains!7559 lt!571910 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262129 (=> (not res!840903) (not e!718420))))

(declare-fun b!1262130 () Bool)

(declare-fun isEmpty!1045 (ListLongMap!18979) Bool)

(assert (=> b!1262130 (= e!718419 (isEmpty!1045 lt!571910))))

(assert (= (and d!138383 c!122753) b!1262126))

(assert (= (and d!138383 (not c!122753)) b!1262123))

(assert (= (and b!1262123 c!122756) b!1262127))

(assert (= (and b!1262123 (not c!122756)) b!1262128))

(assert (= (or b!1262127 b!1262128) bm!62016))

(assert (= (and d!138383 res!840901) b!1262122))

(assert (= (and b!1262122 res!840902) b!1262119))

(assert (= (and b!1262119 res!840900) b!1262120))

(assert (= (and b!1262119 c!122755) b!1262129))

(assert (= (and b!1262119 (not c!122755)) b!1262121))

(assert (= (and b!1262129 res!840903) b!1262125))

(assert (= (and b!1262121 c!122754) b!1262124))

(assert (= (and b!1262121 (not c!122754)) b!1262130))

(declare-fun b_lambda!22841 () Bool)

(assert (=> (not b_lambda!22841) (not b!1262125)))

(declare-fun t!41809 () Bool)

(declare-fun tb!11313 () Bool)

(assert (=> (and start!105976 (= defaultEntry!922 defaultEntry!922) t!41809) tb!11313))

(declare-fun result!23363 () Bool)

(assert (=> tb!11313 (= result!23363 tp_is_empty!32371)))

(assert (=> b!1262125 t!41809))

(declare-fun b_and!45395 () Bool)

(assert (= b_and!45389 (and (=> t!41809 result!23363) b_and!45395)))

(declare-fun b_lambda!22843 () Bool)

(assert (=> (not b_lambda!22843) (not b!1262127)))

(assert (=> b!1262127 t!41809))

(declare-fun b_and!45397 () Bool)

(assert (= b_and!45395 (and (=> t!41809 result!23363) b_and!45397)))

(declare-fun m!1162205 () Bool)

(assert (=> b!1262125 m!1162205))

(declare-fun m!1162207 () Bool)

(assert (=> b!1262125 m!1162207))

(assert (=> b!1262125 m!1162205))

(declare-fun m!1162209 () Bool)

(assert (=> b!1262125 m!1162209))

(declare-fun m!1162211 () Bool)

(assert (=> b!1262125 m!1162211))

(assert (=> b!1262125 m!1162209))

(assert (=> b!1262125 m!1162207))

(declare-fun m!1162213 () Bool)

(assert (=> b!1262125 m!1162213))

(assert (=> b!1262129 m!1162207))

(assert (=> b!1262129 m!1162207))

(declare-fun m!1162215 () Bool)

(assert (=> b!1262129 m!1162215))

(assert (=> b!1262127 m!1162205))

(assert (=> b!1262127 m!1162207))

(assert (=> b!1262127 m!1162205))

(assert (=> b!1262127 m!1162209))

(assert (=> b!1262127 m!1162211))

(declare-fun m!1162217 () Bool)

(assert (=> b!1262127 m!1162217))

(declare-fun m!1162219 () Bool)

(assert (=> b!1262127 m!1162219))

(declare-fun m!1162221 () Bool)

(assert (=> b!1262127 m!1162221))

(assert (=> b!1262127 m!1162219))

(assert (=> b!1262127 m!1162209))

(declare-fun m!1162223 () Bool)

(assert (=> b!1262127 m!1162223))

(assert (=> b!1262123 m!1162207))

(assert (=> b!1262123 m!1162207))

(declare-fun m!1162225 () Bool)

(assert (=> b!1262123 m!1162225))

(declare-fun m!1162227 () Bool)

(assert (=> bm!62016 m!1162227))

(assert (=> b!1262120 m!1162207))

(assert (=> b!1262120 m!1162207))

(assert (=> b!1262120 m!1162225))

(declare-fun m!1162229 () Bool)

(assert (=> b!1262130 m!1162229))

(declare-fun m!1162231 () Bool)

(assert (=> d!138383 m!1162231))

(assert (=> d!138383 m!1162131))

(assert (=> b!1262124 m!1162227))

(declare-fun m!1162233 () Bool)

(assert (=> b!1262122 m!1162233))

(assert (=> b!1262044 d!138383))

(declare-fun b!1262133 () Bool)

(declare-fun e!718428 () Bool)

(declare-fun e!718431 () Bool)

(assert (=> b!1262133 (= e!718428 e!718431)))

(declare-fun c!122759 () Bool)

(declare-fun e!718429 () Bool)

(assert (=> b!1262133 (= c!122759 e!718429)))

(declare-fun res!840904 () Bool)

(assert (=> b!1262133 (=> (not res!840904) (not e!718429))))

(assert (=> b!1262133 (= res!840904 (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun b!1262134 () Bool)

(assert (=> b!1262134 (= e!718429 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262134 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262135 () Bool)

(declare-fun e!718426 () Bool)

(assert (=> b!1262135 (= e!718431 e!718426)))

(declare-fun c!122758 () Bool)

(assert (=> b!1262135 (= c!122758 (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun b!1262136 () Bool)

(declare-fun res!840906 () Bool)

(assert (=> b!1262136 (=> (not res!840906) (not e!718428))))

(declare-fun lt!571917 () ListLongMap!18979)

(assert (=> b!1262136 (= res!840906 (not (contains!7559 lt!571917 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138385 () Bool)

(assert (=> d!138385 e!718428))

(declare-fun res!840905 () Bool)

(assert (=> d!138385 (=> (not res!840905) (not e!718428))))

(assert (=> d!138385 (= res!840905 (not (contains!7559 lt!571917 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718430 () ListLongMap!18979)

(assert (=> d!138385 (= lt!571917 e!718430)))

(declare-fun c!122757 () Bool)

(assert (=> d!138385 (= c!122757 (bvsge #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(assert (=> d!138385 (validMask!0 mask!1466)))

(assert (=> d!138385 (= (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571917)))

(declare-fun b!1262137 () Bool)

(declare-fun e!718432 () ListLongMap!18979)

(assert (=> b!1262137 (= e!718430 e!718432)))

(declare-fun c!122760 () Bool)

(assert (=> b!1262137 (= c!122760 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262138 () Bool)

(assert (=> b!1262138 (= e!718426 (= lt!571917 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62017 () Bool)

(declare-fun call!62020 () ListLongMap!18979)

(assert (=> bm!62017 (= call!62020 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262139 () Bool)

(assert (=> b!1262139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(assert (=> b!1262139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40230 _values!914)))))

(declare-fun e!718427 () Bool)

(assert (=> b!1262139 (= e!718427 (= (apply!990 lt!571917 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)) (get!20273 (select (arr!39692 _values!914) #b00000000000000000000000000000000) (dynLambda!3420 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262140 () Bool)

(assert (=> b!1262140 (= e!718430 (ListLongMap!18980 Nil!28306))))

(declare-fun b!1262141 () Bool)

(declare-fun lt!571919 () Unit!41919)

(declare-fun lt!571920 () Unit!41919)

(assert (=> b!1262141 (= lt!571919 lt!571920)))

(declare-fun lt!571921 () (_ BitVec 64))

(declare-fun lt!571918 () (_ BitVec 64))

(declare-fun lt!571923 () V!48527)

(declare-fun lt!571922 () ListLongMap!18979)

(assert (=> b!1262141 (not (contains!7559 (+!4279 lt!571922 (tuple2!21107 lt!571918 lt!571923)) lt!571921))))

(assert (=> b!1262141 (= lt!571920 (addStillNotContains!326 lt!571922 lt!571918 lt!571923 lt!571921))))

(assert (=> b!1262141 (= lt!571921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262141 (= lt!571923 (get!20273 (select (arr!39692 _values!914) #b00000000000000000000000000000000) (dynLambda!3420 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262141 (= lt!571918 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262141 (= lt!571922 call!62020)))

(assert (=> b!1262141 (= e!718432 (+!4279 call!62020 (tuple2!21107 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000) (get!20273 (select (arr!39692 _values!914) #b00000000000000000000000000000000) (dynLambda!3420 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262142 () Bool)

(assert (=> b!1262142 (= e!718432 call!62020)))

(declare-fun b!1262143 () Bool)

(assert (=> b!1262143 (= e!718431 e!718427)))

(assert (=> b!1262143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun res!840907 () Bool)

(assert (=> b!1262143 (= res!840907 (contains!7559 lt!571917 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262143 (=> (not res!840907) (not e!718427))))

(declare-fun b!1262144 () Bool)

(assert (=> b!1262144 (= e!718426 (isEmpty!1045 lt!571917))))

(assert (= (and d!138385 c!122757) b!1262140))

(assert (= (and d!138385 (not c!122757)) b!1262137))

(assert (= (and b!1262137 c!122760) b!1262141))

(assert (= (and b!1262137 (not c!122760)) b!1262142))

(assert (= (or b!1262141 b!1262142) bm!62017))

(assert (= (and d!138385 res!840905) b!1262136))

(assert (= (and b!1262136 res!840906) b!1262133))

(assert (= (and b!1262133 res!840904) b!1262134))

(assert (= (and b!1262133 c!122759) b!1262143))

(assert (= (and b!1262133 (not c!122759)) b!1262135))

(assert (= (and b!1262143 res!840907) b!1262139))

(assert (= (and b!1262135 c!122758) b!1262138))

(assert (= (and b!1262135 (not c!122758)) b!1262144))

(declare-fun b_lambda!22845 () Bool)

(assert (=> (not b_lambda!22845) (not b!1262139)))

(assert (=> b!1262139 t!41809))

(declare-fun b_and!45399 () Bool)

(assert (= b_and!45397 (and (=> t!41809 result!23363) b_and!45399)))

(declare-fun b_lambda!22847 () Bool)

(assert (=> (not b_lambda!22847) (not b!1262141)))

(assert (=> b!1262141 t!41809))

(declare-fun b_and!45401 () Bool)

(assert (= b_and!45399 (and (=> t!41809 result!23363) b_and!45401)))

(assert (=> b!1262139 m!1162205))

(assert (=> b!1262139 m!1162207))

(assert (=> b!1262139 m!1162205))

(assert (=> b!1262139 m!1162209))

(assert (=> b!1262139 m!1162211))

(assert (=> b!1262139 m!1162209))

(assert (=> b!1262139 m!1162207))

(declare-fun m!1162235 () Bool)

(assert (=> b!1262139 m!1162235))

(assert (=> b!1262143 m!1162207))

(assert (=> b!1262143 m!1162207))

(declare-fun m!1162237 () Bool)

(assert (=> b!1262143 m!1162237))

(assert (=> b!1262141 m!1162205))

(assert (=> b!1262141 m!1162207))

(assert (=> b!1262141 m!1162205))

(assert (=> b!1262141 m!1162209))

(assert (=> b!1262141 m!1162211))

(declare-fun m!1162239 () Bool)

(assert (=> b!1262141 m!1162239))

(declare-fun m!1162241 () Bool)

(assert (=> b!1262141 m!1162241))

(declare-fun m!1162243 () Bool)

(assert (=> b!1262141 m!1162243))

(assert (=> b!1262141 m!1162241))

(assert (=> b!1262141 m!1162209))

(declare-fun m!1162245 () Bool)

(assert (=> b!1262141 m!1162245))

(assert (=> b!1262137 m!1162207))

(assert (=> b!1262137 m!1162207))

(assert (=> b!1262137 m!1162225))

(declare-fun m!1162247 () Bool)

(assert (=> bm!62017 m!1162247))

(assert (=> b!1262134 m!1162207))

(assert (=> b!1262134 m!1162207))

(assert (=> b!1262134 m!1162225))

(declare-fun m!1162249 () Bool)

(assert (=> b!1262144 m!1162249))

(declare-fun m!1162251 () Bool)

(assert (=> d!138385 m!1162251))

(assert (=> d!138385 m!1162131))

(assert (=> b!1262138 m!1162247))

(declare-fun m!1162253 () Bool)

(assert (=> b!1262136 m!1162253))

(assert (=> b!1262044 d!138385))

(declare-fun b!1262153 () Bool)

(declare-fun e!718439 () Bool)

(declare-fun call!62023 () Bool)

(assert (=> b!1262153 (= e!718439 call!62023)))

(declare-fun b!1262154 () Bool)

(declare-fun e!718440 () Bool)

(assert (=> b!1262154 (= e!718439 e!718440)))

(declare-fun lt!571931 () (_ BitVec 64))

(assert (=> b!1262154 (= lt!571931 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571932 () Unit!41919)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82285 (_ BitVec 64) (_ BitVec 32)) Unit!41919)

(assert (=> b!1262154 (= lt!571932 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571931 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1262154 (arrayContainsKey!0 _keys!1118 lt!571931 #b00000000000000000000000000000000)))

(declare-fun lt!571930 () Unit!41919)

(assert (=> b!1262154 (= lt!571930 lt!571932)))

(declare-fun res!840912 () Bool)

(declare-datatypes ((SeekEntryResult!9974 0))(
  ( (MissingZero!9974 (index!42267 (_ BitVec 32))) (Found!9974 (index!42268 (_ BitVec 32))) (Intermediate!9974 (undefined!10786 Bool) (index!42269 (_ BitVec 32)) (x!111225 (_ BitVec 32))) (Undefined!9974) (MissingVacant!9974 (index!42270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82285 (_ BitVec 32)) SeekEntryResult!9974)

(assert (=> b!1262154 (= res!840912 (= (seekEntryOrOpen!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9974 #b00000000000000000000000000000000)))))

(assert (=> b!1262154 (=> (not res!840912) (not e!718440))))

(declare-fun b!1262155 () Bool)

(declare-fun e!718441 () Bool)

(assert (=> b!1262155 (= e!718441 e!718439)))

(declare-fun c!122763 () Bool)

(assert (=> b!1262155 (= c!122763 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62020 () Bool)

(assert (=> bm!62020 (= call!62023 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1262156 () Bool)

(assert (=> b!1262156 (= e!718440 call!62023)))

(declare-fun d!138387 () Bool)

(declare-fun res!840913 () Bool)

(assert (=> d!138387 (=> res!840913 e!718441)))

(assert (=> d!138387 (= res!840913 (bvsge #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(assert (=> d!138387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718441)))

(assert (= (and d!138387 (not res!840913)) b!1262155))

(assert (= (and b!1262155 c!122763) b!1262154))

(assert (= (and b!1262155 (not c!122763)) b!1262153))

(assert (= (and b!1262154 res!840912) b!1262156))

(assert (= (or b!1262156 b!1262153) bm!62020))

(assert (=> b!1262154 m!1162207))

(declare-fun m!1162255 () Bool)

(assert (=> b!1262154 m!1162255))

(declare-fun m!1162257 () Bool)

(assert (=> b!1262154 m!1162257))

(assert (=> b!1262154 m!1162207))

(declare-fun m!1162259 () Bool)

(assert (=> b!1262154 m!1162259))

(assert (=> b!1262155 m!1162207))

(assert (=> b!1262155 m!1162207))

(assert (=> b!1262155 m!1162225))

(declare-fun m!1162261 () Bool)

(assert (=> bm!62020 m!1162261))

(assert (=> b!1262041 d!138387))

(declare-fun b!1262199 () Bool)

(declare-fun e!718472 () Unit!41919)

(declare-fun Unit!41923 () Unit!41919)

(assert (=> b!1262199 (= e!718472 Unit!41923)))

(declare-fun bm!62035 () Bool)

(declare-fun call!62040 () Bool)

(declare-fun lt!571995 () ListLongMap!18979)

(assert (=> bm!62035 (= call!62040 (contains!7559 lt!571995 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!62041 () ListLongMap!18979)

(declare-fun bm!62036 () Bool)

(assert (=> bm!62036 (= call!62041 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262200 () Bool)

(declare-fun e!718468 () ListLongMap!18979)

(declare-fun call!62042 () ListLongMap!18979)

(assert (=> b!1262200 (= e!718468 call!62042)))

(declare-fun b!1262201 () Bool)

(declare-fun e!718478 () Bool)

(declare-fun e!718469 () Bool)

(assert (=> b!1262201 (= e!718478 e!718469)))

(declare-fun c!122781 () Bool)

(assert (=> b!1262201 (= c!122781 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262202 () Bool)

(declare-fun c!122777 () Bool)

(assert (=> b!1262202 (= c!122777 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!718480 () ListLongMap!18979)

(assert (=> b!1262202 (= e!718468 e!718480)))

(declare-fun b!1262203 () Bool)

(declare-fun lt!571979 () Unit!41919)

(assert (=> b!1262203 (= e!718472 lt!571979)))

(declare-fun lt!571983 () ListLongMap!18979)

(assert (=> b!1262203 (= lt!571983 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571986 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!571986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571992 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!571992 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571987 () Unit!41919)

(declare-fun addStillContains!1087 (ListLongMap!18979 (_ BitVec 64) V!48527 (_ BitVec 64)) Unit!41919)

(assert (=> b!1262203 (= lt!571987 (addStillContains!1087 lt!571983 lt!571986 zeroValue!871 lt!571992))))

(assert (=> b!1262203 (contains!7559 (+!4279 lt!571983 (tuple2!21107 lt!571986 zeroValue!871)) lt!571992)))

(declare-fun lt!571985 () Unit!41919)

(assert (=> b!1262203 (= lt!571985 lt!571987)))

(declare-fun lt!571996 () ListLongMap!18979)

(assert (=> b!1262203 (= lt!571996 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571989 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!571989 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571993 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!571993 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571990 () Unit!41919)

(declare-fun addApplyDifferent!530 (ListLongMap!18979 (_ BitVec 64) V!48527 (_ BitVec 64)) Unit!41919)

(assert (=> b!1262203 (= lt!571990 (addApplyDifferent!530 lt!571996 lt!571989 minValueBefore!43 lt!571993))))

(assert (=> b!1262203 (= (apply!990 (+!4279 lt!571996 (tuple2!21107 lt!571989 minValueBefore!43)) lt!571993) (apply!990 lt!571996 lt!571993))))

(declare-fun lt!571997 () Unit!41919)

(assert (=> b!1262203 (= lt!571997 lt!571990)))

(declare-fun lt!571978 () ListLongMap!18979)

(assert (=> b!1262203 (= lt!571978 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571977 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!571977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571980 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!571980 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571981 () Unit!41919)

(assert (=> b!1262203 (= lt!571981 (addApplyDifferent!530 lt!571978 lt!571977 zeroValue!871 lt!571980))))

(assert (=> b!1262203 (= (apply!990 (+!4279 lt!571978 (tuple2!21107 lt!571977 zeroValue!871)) lt!571980) (apply!990 lt!571978 lt!571980))))

(declare-fun lt!571982 () Unit!41919)

(assert (=> b!1262203 (= lt!571982 lt!571981)))

(declare-fun lt!571994 () ListLongMap!18979)

(assert (=> b!1262203 (= lt!571994 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571991 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!571991 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571998 () (_ BitVec 64))

(assert (=> b!1262203 (= lt!571998 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262203 (= lt!571979 (addApplyDifferent!530 lt!571994 lt!571991 minValueBefore!43 lt!571998))))

(assert (=> b!1262203 (= (apply!990 (+!4279 lt!571994 (tuple2!21107 lt!571991 minValueBefore!43)) lt!571998) (apply!990 lt!571994 lt!571998))))

(declare-fun bm!62037 () Bool)

(declare-fun call!62038 () Bool)

(assert (=> bm!62037 (= call!62038 (contains!7559 lt!571995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!62039 () ListLongMap!18979)

(declare-fun bm!62038 () Bool)

(declare-fun c!122778 () Bool)

(declare-fun call!62044 () ListLongMap!18979)

(declare-fun c!122779 () Bool)

(declare-fun call!62043 () ListLongMap!18979)

(assert (=> bm!62038 (= call!62044 (+!4279 (ite c!122779 call!62041 (ite c!122778 call!62043 call!62039)) (ite (or c!122779 c!122778) (tuple2!21107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262204 () Bool)

(declare-fun e!718474 () ListLongMap!18979)

(assert (=> b!1262204 (= e!718474 e!718468)))

(assert (=> b!1262204 (= c!122778 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262205 () Bool)

(declare-fun e!718470 () Bool)

(declare-fun e!718475 () Bool)

(assert (=> b!1262205 (= e!718470 e!718475)))

(declare-fun res!840932 () Bool)

(assert (=> b!1262205 (= res!840932 call!62038)))

(assert (=> b!1262205 (=> (not res!840932) (not e!718475))))

(declare-fun b!1262206 () Bool)

(declare-fun e!718476 () Bool)

(declare-fun e!718473 () Bool)

(assert (=> b!1262206 (= e!718476 e!718473)))

(declare-fun res!840936 () Bool)

(assert (=> b!1262206 (=> (not res!840936) (not e!718473))))

(assert (=> b!1262206 (= res!840936 (contains!7559 lt!571995 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun b!1262207 () Bool)

(declare-fun e!718471 () Bool)

(assert (=> b!1262207 (= e!718471 (= (apply!990 lt!571995 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1262208 () Bool)

(declare-fun res!840937 () Bool)

(assert (=> b!1262208 (=> (not res!840937) (not e!718478))))

(assert (=> b!1262208 (= res!840937 e!718470)))

(declare-fun c!122780 () Bool)

(assert (=> b!1262208 (= c!122780 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262209 () Bool)

(assert (=> b!1262209 (= e!718473 (= (apply!990 lt!571995 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)) (get!20273 (select (arr!39692 _values!914) #b00000000000000000000000000000000) (dynLambda!3420 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40230 _values!914)))))

(assert (=> b!1262209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun b!1262210 () Bool)

(assert (=> b!1262210 (= e!718480 call!62039)))

(declare-fun bm!62039 () Bool)

(assert (=> bm!62039 (= call!62043 call!62041)))

(declare-fun b!1262211 () Bool)

(assert (=> b!1262211 (= e!718480 call!62042)))

(declare-fun b!1262212 () Bool)

(assert (=> b!1262212 (= e!718469 (not call!62040))))

(declare-fun b!1262213 () Bool)

(assert (=> b!1262213 (= e!718469 e!718471)))

(declare-fun res!840938 () Bool)

(assert (=> b!1262213 (= res!840938 call!62040)))

(assert (=> b!1262213 (=> (not res!840938) (not e!718471))))

(declare-fun b!1262214 () Bool)

(declare-fun e!718479 () Bool)

(assert (=> b!1262214 (= e!718479 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262215 () Bool)

(assert (=> b!1262215 (= e!718475 (= (apply!990 lt!571995 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262216 () Bool)

(declare-fun e!718477 () Bool)

(assert (=> b!1262216 (= e!718477 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62040 () Bool)

(assert (=> bm!62040 (= call!62042 call!62044)))

(declare-fun b!1262217 () Bool)

(declare-fun res!840940 () Bool)

(assert (=> b!1262217 (=> (not res!840940) (not e!718478))))

(assert (=> b!1262217 (= res!840940 e!718476)))

(declare-fun res!840935 () Bool)

(assert (=> b!1262217 (=> res!840935 e!718476)))

(assert (=> b!1262217 (= res!840935 (not e!718479))))

(declare-fun res!840939 () Bool)

(assert (=> b!1262217 (=> (not res!840939) (not e!718479))))

(assert (=> b!1262217 (= res!840939 (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun d!138389 () Bool)

(assert (=> d!138389 e!718478))

(declare-fun res!840933 () Bool)

(assert (=> d!138389 (=> (not res!840933) (not e!718478))))

(assert (=> d!138389 (= res!840933 (or (bvsge #b00000000000000000000000000000000 (size!40231 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))))

(declare-fun lt!571988 () ListLongMap!18979)

(assert (=> d!138389 (= lt!571995 lt!571988)))

(declare-fun lt!571984 () Unit!41919)

(assert (=> d!138389 (= lt!571984 e!718472)))

(declare-fun c!122776 () Bool)

(assert (=> d!138389 (= c!122776 e!718477)))

(declare-fun res!840934 () Bool)

(assert (=> d!138389 (=> (not res!840934) (not e!718477))))

(assert (=> d!138389 (= res!840934 (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(assert (=> d!138389 (= lt!571988 e!718474)))

(assert (=> d!138389 (= c!122779 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138389 (validMask!0 mask!1466)))

(assert (=> d!138389 (= (getCurrentListMap!4561 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571995)))

(declare-fun b!1262218 () Bool)

(assert (=> b!1262218 (= e!718474 (+!4279 call!62044 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1262219 () Bool)

(assert (=> b!1262219 (= e!718470 (not call!62038))))

(declare-fun bm!62041 () Bool)

(assert (=> bm!62041 (= call!62039 call!62043)))

(assert (= (and d!138389 c!122779) b!1262218))

(assert (= (and d!138389 (not c!122779)) b!1262204))

(assert (= (and b!1262204 c!122778) b!1262200))

(assert (= (and b!1262204 (not c!122778)) b!1262202))

(assert (= (and b!1262202 c!122777) b!1262211))

(assert (= (and b!1262202 (not c!122777)) b!1262210))

(assert (= (or b!1262211 b!1262210) bm!62041))

(assert (= (or b!1262200 bm!62041) bm!62039))

(assert (= (or b!1262200 b!1262211) bm!62040))

(assert (= (or b!1262218 bm!62039) bm!62036))

(assert (= (or b!1262218 bm!62040) bm!62038))

(assert (= (and d!138389 res!840934) b!1262216))

(assert (= (and d!138389 c!122776) b!1262203))

(assert (= (and d!138389 (not c!122776)) b!1262199))

(assert (= (and d!138389 res!840933) b!1262217))

(assert (= (and b!1262217 res!840939) b!1262214))

(assert (= (and b!1262217 (not res!840935)) b!1262206))

(assert (= (and b!1262206 res!840936) b!1262209))

(assert (= (and b!1262217 res!840940) b!1262208))

(assert (= (and b!1262208 c!122780) b!1262205))

(assert (= (and b!1262208 (not c!122780)) b!1262219))

(assert (= (and b!1262205 res!840932) b!1262215))

(assert (= (or b!1262205 b!1262219) bm!62037))

(assert (= (and b!1262208 res!840937) b!1262201))

(assert (= (and b!1262201 c!122781) b!1262213))

(assert (= (and b!1262201 (not c!122781)) b!1262212))

(assert (= (and b!1262213 res!840938) b!1262207))

(assert (= (or b!1262213 b!1262212) bm!62035))

(declare-fun b_lambda!22849 () Bool)

(assert (=> (not b_lambda!22849) (not b!1262209)))

(assert (=> b!1262209 t!41809))

(declare-fun b_and!45403 () Bool)

(assert (= b_and!45401 (and (=> t!41809 result!23363) b_and!45403)))

(assert (=> b!1262214 m!1162207))

(assert (=> b!1262214 m!1162207))

(assert (=> b!1262214 m!1162225))

(assert (=> d!138389 m!1162131))

(assert (=> b!1262206 m!1162207))

(assert (=> b!1262206 m!1162207))

(declare-fun m!1162263 () Bool)

(assert (=> b!1262206 m!1162263))

(declare-fun m!1162265 () Bool)

(assert (=> bm!62037 m!1162265))

(declare-fun m!1162267 () Bool)

(assert (=> b!1262218 m!1162267))

(declare-fun m!1162269 () Bool)

(assert (=> b!1262207 m!1162269))

(declare-fun m!1162271 () Bool)

(assert (=> bm!62035 m!1162271))

(assert (=> b!1262216 m!1162207))

(assert (=> b!1262216 m!1162207))

(assert (=> b!1262216 m!1162225))

(declare-fun m!1162273 () Bool)

(assert (=> b!1262203 m!1162273))

(declare-fun m!1162275 () Bool)

(assert (=> b!1262203 m!1162275))

(declare-fun m!1162277 () Bool)

(assert (=> b!1262203 m!1162277))

(declare-fun m!1162279 () Bool)

(assert (=> b!1262203 m!1162279))

(declare-fun m!1162281 () Bool)

(assert (=> b!1262203 m!1162281))

(declare-fun m!1162283 () Bool)

(assert (=> b!1262203 m!1162283))

(assert (=> b!1262203 m!1162275))

(declare-fun m!1162285 () Bool)

(assert (=> b!1262203 m!1162285))

(declare-fun m!1162287 () Bool)

(assert (=> b!1262203 m!1162287))

(declare-fun m!1162289 () Bool)

(assert (=> b!1262203 m!1162289))

(declare-fun m!1162291 () Bool)

(assert (=> b!1262203 m!1162291))

(declare-fun m!1162293 () Bool)

(assert (=> b!1262203 m!1162293))

(assert (=> b!1262203 m!1162281))

(declare-fun m!1162295 () Bool)

(assert (=> b!1262203 m!1162295))

(declare-fun m!1162297 () Bool)

(assert (=> b!1262203 m!1162297))

(assert (=> b!1262203 m!1162295))

(assert (=> b!1262203 m!1162151))

(declare-fun m!1162299 () Bool)

(assert (=> b!1262203 m!1162299))

(assert (=> b!1262203 m!1162287))

(declare-fun m!1162301 () Bool)

(assert (=> b!1262203 m!1162301))

(assert (=> b!1262203 m!1162207))

(declare-fun m!1162303 () Bool)

(assert (=> bm!62038 m!1162303))

(assert (=> b!1262209 m!1162207))

(declare-fun m!1162305 () Bool)

(assert (=> b!1262209 m!1162305))

(assert (=> b!1262209 m!1162205))

(assert (=> b!1262209 m!1162205))

(assert (=> b!1262209 m!1162209))

(assert (=> b!1262209 m!1162211))

(assert (=> b!1262209 m!1162209))

(assert (=> b!1262209 m!1162207))

(assert (=> bm!62036 m!1162151))

(declare-fun m!1162307 () Bool)

(assert (=> b!1262215 m!1162307))

(assert (=> b!1262046 d!138389))

(declare-fun d!138391 () Bool)

(declare-fun e!718483 () Bool)

(assert (=> d!138391 e!718483))

(declare-fun res!840946 () Bool)

(assert (=> d!138391 (=> (not res!840946) (not e!718483))))

(declare-fun lt!572010 () ListLongMap!18979)

(assert (=> d!138391 (= res!840946 (contains!7559 lt!572010 (_1!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572007 () List!28309)

(assert (=> d!138391 (= lt!572010 (ListLongMap!18980 lt!572007))))

(declare-fun lt!572008 () Unit!41919)

(declare-fun lt!572009 () Unit!41919)

(assert (=> d!138391 (= lt!572008 lt!572009)))

(declare-datatypes ((Option!715 0))(
  ( (Some!714 (v!18956 V!48527)) (None!713) )
))
(declare-fun getValueByKey!664 (List!28309 (_ BitVec 64)) Option!715)

(assert (=> d!138391 (= (getValueByKey!664 lt!572007 (_1!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!714 (_2!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!334 (List!28309 (_ BitVec 64) V!48527) Unit!41919)

(assert (=> d!138391 (= lt!572009 (lemmaContainsTupThenGetReturnValue!334 lt!572007 (_1!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!448 (List!28309 (_ BitVec 64) V!48527) List!28309)

(assert (=> d!138391 (= lt!572007 (insertStrictlySorted!448 (toList!9505 lt!571868) (_1!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138391 (= (+!4279 lt!571868 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572010)))

(declare-fun b!1262224 () Bool)

(declare-fun res!840945 () Bool)

(assert (=> b!1262224 (=> (not res!840945) (not e!718483))))

(assert (=> b!1262224 (= res!840945 (= (getValueByKey!664 (toList!9505 lt!572010) (_1!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!714 (_2!10564 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1262225 () Bool)

(declare-fun contains!7560 (List!28309 tuple2!21106) Bool)

(assert (=> b!1262225 (= e!718483 (contains!7560 (toList!9505 lt!572010) (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138391 res!840946) b!1262224))

(assert (= (and b!1262224 res!840945) b!1262225))

(declare-fun m!1162309 () Bool)

(assert (=> d!138391 m!1162309))

(declare-fun m!1162311 () Bool)

(assert (=> d!138391 m!1162311))

(declare-fun m!1162313 () Bool)

(assert (=> d!138391 m!1162313))

(declare-fun m!1162315 () Bool)

(assert (=> d!138391 m!1162315))

(declare-fun m!1162317 () Bool)

(assert (=> b!1262224 m!1162317))

(declare-fun m!1162319 () Bool)

(assert (=> b!1262225 m!1162319))

(assert (=> b!1262046 d!138391))

(declare-fun b!1262226 () Bool)

(declare-fun e!718488 () Unit!41919)

(declare-fun Unit!41924 () Unit!41919)

(assert (=> b!1262226 (= e!718488 Unit!41924)))

(declare-fun bm!62042 () Bool)

(declare-fun call!62047 () Bool)

(declare-fun lt!572029 () ListLongMap!18979)

(assert (=> bm!62042 (= call!62047 (contains!7559 lt!572029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62043 () Bool)

(declare-fun call!62048 () ListLongMap!18979)

(assert (=> bm!62043 (= call!62048 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262227 () Bool)

(declare-fun e!718484 () ListLongMap!18979)

(declare-fun call!62049 () ListLongMap!18979)

(assert (=> b!1262227 (= e!718484 call!62049)))

(declare-fun b!1262228 () Bool)

(declare-fun e!718494 () Bool)

(declare-fun e!718485 () Bool)

(assert (=> b!1262228 (= e!718494 e!718485)))

(declare-fun c!122787 () Bool)

(assert (=> b!1262228 (= c!122787 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262229 () Bool)

(declare-fun c!122783 () Bool)

(assert (=> b!1262229 (= c!122783 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!718496 () ListLongMap!18979)

(assert (=> b!1262229 (= e!718484 e!718496)))

(declare-fun b!1262230 () Bool)

(declare-fun lt!572013 () Unit!41919)

(assert (=> b!1262230 (= e!718488 lt!572013)))

(declare-fun lt!572017 () ListLongMap!18979)

(assert (=> b!1262230 (= lt!572017 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572020 () (_ BitVec 64))

(assert (=> b!1262230 (= lt!572020 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572026 () (_ BitVec 64))

(assert (=> b!1262230 (= lt!572026 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572021 () Unit!41919)

(assert (=> b!1262230 (= lt!572021 (addStillContains!1087 lt!572017 lt!572020 zeroValue!871 lt!572026))))

(assert (=> b!1262230 (contains!7559 (+!4279 lt!572017 (tuple2!21107 lt!572020 zeroValue!871)) lt!572026)))

(declare-fun lt!572019 () Unit!41919)

(assert (=> b!1262230 (= lt!572019 lt!572021)))

(declare-fun lt!572030 () ListLongMap!18979)

(assert (=> b!1262230 (= lt!572030 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572023 () (_ BitVec 64))

(assert (=> b!1262230 (= lt!572023 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572027 () (_ BitVec 64))

(assert (=> b!1262230 (= lt!572027 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572024 () Unit!41919)

(assert (=> b!1262230 (= lt!572024 (addApplyDifferent!530 lt!572030 lt!572023 minValueAfter!43 lt!572027))))

(assert (=> b!1262230 (= (apply!990 (+!4279 lt!572030 (tuple2!21107 lt!572023 minValueAfter!43)) lt!572027) (apply!990 lt!572030 lt!572027))))

(declare-fun lt!572031 () Unit!41919)

(assert (=> b!1262230 (= lt!572031 lt!572024)))

(declare-fun lt!572012 () ListLongMap!18979)

(assert (=> b!1262230 (= lt!572012 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572011 () (_ BitVec 64))

(assert (=> b!1262230 (= lt!572011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572014 () (_ BitVec 64))

(assert (=> b!1262230 (= lt!572014 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572015 () Unit!41919)

(assert (=> b!1262230 (= lt!572015 (addApplyDifferent!530 lt!572012 lt!572011 zeroValue!871 lt!572014))))

(assert (=> b!1262230 (= (apply!990 (+!4279 lt!572012 (tuple2!21107 lt!572011 zeroValue!871)) lt!572014) (apply!990 lt!572012 lt!572014))))

(declare-fun lt!572016 () Unit!41919)

(assert (=> b!1262230 (= lt!572016 lt!572015)))

(declare-fun lt!572028 () ListLongMap!18979)

(assert (=> b!1262230 (= lt!572028 (getCurrentListMapNoExtraKeys!5873 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572025 () (_ BitVec 64))

(assert (=> b!1262230 (= lt!572025 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572032 () (_ BitVec 64))

(assert (=> b!1262230 (= lt!572032 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262230 (= lt!572013 (addApplyDifferent!530 lt!572028 lt!572025 minValueAfter!43 lt!572032))))

(assert (=> b!1262230 (= (apply!990 (+!4279 lt!572028 (tuple2!21107 lt!572025 minValueAfter!43)) lt!572032) (apply!990 lt!572028 lt!572032))))

(declare-fun bm!62044 () Bool)

(declare-fun call!62045 () Bool)

(assert (=> bm!62044 (= call!62045 (contains!7559 lt!572029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62045 () Bool)

(declare-fun c!122784 () Bool)

(declare-fun c!122785 () Bool)

(declare-fun call!62046 () ListLongMap!18979)

(declare-fun call!62050 () ListLongMap!18979)

(declare-fun call!62051 () ListLongMap!18979)

(assert (=> bm!62045 (= call!62051 (+!4279 (ite c!122785 call!62048 (ite c!122784 call!62050 call!62046)) (ite (or c!122785 c!122784) (tuple2!21107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1262231 () Bool)

(declare-fun e!718490 () ListLongMap!18979)

(assert (=> b!1262231 (= e!718490 e!718484)))

(assert (=> b!1262231 (= c!122784 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262232 () Bool)

(declare-fun e!718486 () Bool)

(declare-fun e!718491 () Bool)

(assert (=> b!1262232 (= e!718486 e!718491)))

(declare-fun res!840947 () Bool)

(assert (=> b!1262232 (= res!840947 call!62045)))

(assert (=> b!1262232 (=> (not res!840947) (not e!718491))))

(declare-fun b!1262233 () Bool)

(declare-fun e!718492 () Bool)

(declare-fun e!718489 () Bool)

(assert (=> b!1262233 (= e!718492 e!718489)))

(declare-fun res!840951 () Bool)

(assert (=> b!1262233 (=> (not res!840951) (not e!718489))))

(assert (=> b!1262233 (= res!840951 (contains!7559 lt!572029 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun b!1262234 () Bool)

(declare-fun e!718487 () Bool)

(assert (=> b!1262234 (= e!718487 (= (apply!990 lt!572029 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1262235 () Bool)

(declare-fun res!840952 () Bool)

(assert (=> b!1262235 (=> (not res!840952) (not e!718494))))

(assert (=> b!1262235 (= res!840952 e!718486)))

(declare-fun c!122786 () Bool)

(assert (=> b!1262235 (= c!122786 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262236 () Bool)

(assert (=> b!1262236 (= e!718489 (= (apply!990 lt!572029 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)) (get!20273 (select (arr!39692 _values!914) #b00000000000000000000000000000000) (dynLambda!3420 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262236 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40230 _values!914)))))

(assert (=> b!1262236 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun b!1262237 () Bool)

(assert (=> b!1262237 (= e!718496 call!62046)))

(declare-fun bm!62046 () Bool)

(assert (=> bm!62046 (= call!62050 call!62048)))

(declare-fun b!1262238 () Bool)

(assert (=> b!1262238 (= e!718496 call!62049)))

(declare-fun b!1262239 () Bool)

(assert (=> b!1262239 (= e!718485 (not call!62047))))

(declare-fun b!1262240 () Bool)

(assert (=> b!1262240 (= e!718485 e!718487)))

(declare-fun res!840953 () Bool)

(assert (=> b!1262240 (= res!840953 call!62047)))

(assert (=> b!1262240 (=> (not res!840953) (not e!718487))))

(declare-fun b!1262241 () Bool)

(declare-fun e!718495 () Bool)

(assert (=> b!1262241 (= e!718495 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262242 () Bool)

(assert (=> b!1262242 (= e!718491 (= (apply!990 lt!572029 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262243 () Bool)

(declare-fun e!718493 () Bool)

(assert (=> b!1262243 (= e!718493 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62047 () Bool)

(assert (=> bm!62047 (= call!62049 call!62051)))

(declare-fun b!1262244 () Bool)

(declare-fun res!840955 () Bool)

(assert (=> b!1262244 (=> (not res!840955) (not e!718494))))

(assert (=> b!1262244 (= res!840955 e!718492)))

(declare-fun res!840950 () Bool)

(assert (=> b!1262244 (=> res!840950 e!718492)))

(assert (=> b!1262244 (= res!840950 (not e!718495))))

(declare-fun res!840954 () Bool)

(assert (=> b!1262244 (=> (not res!840954) (not e!718495))))

(assert (=> b!1262244 (= res!840954 (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(declare-fun d!138393 () Bool)

(assert (=> d!138393 e!718494))

(declare-fun res!840948 () Bool)

(assert (=> d!138393 (=> (not res!840948) (not e!718494))))

(assert (=> d!138393 (= res!840948 (or (bvsge #b00000000000000000000000000000000 (size!40231 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))))

(declare-fun lt!572022 () ListLongMap!18979)

(assert (=> d!138393 (= lt!572029 lt!572022)))

(declare-fun lt!572018 () Unit!41919)

(assert (=> d!138393 (= lt!572018 e!718488)))

(declare-fun c!122782 () Bool)

(assert (=> d!138393 (= c!122782 e!718493)))

(declare-fun res!840949 () Bool)

(assert (=> d!138393 (=> (not res!840949) (not e!718493))))

(assert (=> d!138393 (= res!840949 (bvslt #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(assert (=> d!138393 (= lt!572022 e!718490)))

(assert (=> d!138393 (= c!122785 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138393 (validMask!0 mask!1466)))

(assert (=> d!138393 (= (getCurrentListMap!4561 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572029)))

(declare-fun b!1262245 () Bool)

(assert (=> b!1262245 (= e!718490 (+!4279 call!62051 (tuple2!21107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1262246 () Bool)

(assert (=> b!1262246 (= e!718486 (not call!62045))))

(declare-fun bm!62048 () Bool)

(assert (=> bm!62048 (= call!62046 call!62050)))

(assert (= (and d!138393 c!122785) b!1262245))

(assert (= (and d!138393 (not c!122785)) b!1262231))

(assert (= (and b!1262231 c!122784) b!1262227))

(assert (= (and b!1262231 (not c!122784)) b!1262229))

(assert (= (and b!1262229 c!122783) b!1262238))

(assert (= (and b!1262229 (not c!122783)) b!1262237))

(assert (= (or b!1262238 b!1262237) bm!62048))

(assert (= (or b!1262227 bm!62048) bm!62046))

(assert (= (or b!1262227 b!1262238) bm!62047))

(assert (= (or b!1262245 bm!62046) bm!62043))

(assert (= (or b!1262245 bm!62047) bm!62045))

(assert (= (and d!138393 res!840949) b!1262243))

(assert (= (and d!138393 c!122782) b!1262230))

(assert (= (and d!138393 (not c!122782)) b!1262226))

(assert (= (and d!138393 res!840948) b!1262244))

(assert (= (and b!1262244 res!840954) b!1262241))

(assert (= (and b!1262244 (not res!840950)) b!1262233))

(assert (= (and b!1262233 res!840951) b!1262236))

(assert (= (and b!1262244 res!840955) b!1262235))

(assert (= (and b!1262235 c!122786) b!1262232))

(assert (= (and b!1262235 (not c!122786)) b!1262246))

(assert (= (and b!1262232 res!840947) b!1262242))

(assert (= (or b!1262232 b!1262246) bm!62044))

(assert (= (and b!1262235 res!840952) b!1262228))

(assert (= (and b!1262228 c!122787) b!1262240))

(assert (= (and b!1262228 (not c!122787)) b!1262239))

(assert (= (and b!1262240 res!840953) b!1262234))

(assert (= (or b!1262240 b!1262239) bm!62042))

(declare-fun b_lambda!22851 () Bool)

(assert (=> (not b_lambda!22851) (not b!1262236)))

(assert (=> b!1262236 t!41809))

(declare-fun b_and!45405 () Bool)

(assert (= b_and!45403 (and (=> t!41809 result!23363) b_and!45405)))

(assert (=> b!1262241 m!1162207))

(assert (=> b!1262241 m!1162207))

(assert (=> b!1262241 m!1162225))

(assert (=> d!138393 m!1162131))

(assert (=> b!1262233 m!1162207))

(assert (=> b!1262233 m!1162207))

(declare-fun m!1162321 () Bool)

(assert (=> b!1262233 m!1162321))

(declare-fun m!1162323 () Bool)

(assert (=> bm!62044 m!1162323))

(declare-fun m!1162325 () Bool)

(assert (=> b!1262245 m!1162325))

(declare-fun m!1162327 () Bool)

(assert (=> b!1262234 m!1162327))

(declare-fun m!1162329 () Bool)

(assert (=> bm!62042 m!1162329))

(assert (=> b!1262243 m!1162207))

(assert (=> b!1262243 m!1162207))

(assert (=> b!1262243 m!1162225))

(declare-fun m!1162331 () Bool)

(assert (=> b!1262230 m!1162331))

(declare-fun m!1162333 () Bool)

(assert (=> b!1262230 m!1162333))

(declare-fun m!1162335 () Bool)

(assert (=> b!1262230 m!1162335))

(declare-fun m!1162337 () Bool)

(assert (=> b!1262230 m!1162337))

(declare-fun m!1162339 () Bool)

(assert (=> b!1262230 m!1162339))

(declare-fun m!1162341 () Bool)

(assert (=> b!1262230 m!1162341))

(assert (=> b!1262230 m!1162333))

(declare-fun m!1162343 () Bool)

(assert (=> b!1262230 m!1162343))

(declare-fun m!1162345 () Bool)

(assert (=> b!1262230 m!1162345))

(declare-fun m!1162347 () Bool)

(assert (=> b!1262230 m!1162347))

(declare-fun m!1162349 () Bool)

(assert (=> b!1262230 m!1162349))

(declare-fun m!1162351 () Bool)

(assert (=> b!1262230 m!1162351))

(assert (=> b!1262230 m!1162339))

(declare-fun m!1162353 () Bool)

(assert (=> b!1262230 m!1162353))

(declare-fun m!1162355 () Bool)

(assert (=> b!1262230 m!1162355))

(assert (=> b!1262230 m!1162353))

(assert (=> b!1262230 m!1162149))

(declare-fun m!1162357 () Bool)

(assert (=> b!1262230 m!1162357))

(assert (=> b!1262230 m!1162345))

(declare-fun m!1162359 () Bool)

(assert (=> b!1262230 m!1162359))

(assert (=> b!1262230 m!1162207))

(declare-fun m!1162361 () Bool)

(assert (=> bm!62045 m!1162361))

(assert (=> b!1262236 m!1162207))

(declare-fun m!1162363 () Bool)

(assert (=> b!1262236 m!1162363))

(assert (=> b!1262236 m!1162205))

(assert (=> b!1262236 m!1162205))

(assert (=> b!1262236 m!1162209))

(assert (=> b!1262236 m!1162211))

(assert (=> b!1262236 m!1162209))

(assert (=> b!1262236 m!1162207))

(assert (=> bm!62043 m!1162149))

(declare-fun m!1162365 () Bool)

(assert (=> b!1262242 m!1162365))

(assert (=> b!1262046 d!138393))

(declare-fun d!138395 () Bool)

(assert (=> d!138395 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105976 d!138395))

(declare-fun d!138397 () Bool)

(assert (=> d!138397 (= (array_inv!30365 _keys!1118) (bvsge (size!40231 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105976 d!138397))

(declare-fun d!138399 () Bool)

(assert (=> d!138399 (= (array_inv!30366 _values!914) (bvsge (size!40230 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105976 d!138399))

(declare-fun b!1262257 () Bool)

(declare-fun e!718506 () Bool)

(declare-fun call!62054 () Bool)

(assert (=> b!1262257 (= e!718506 call!62054)))

(declare-fun b!1262258 () Bool)

(declare-fun e!718505 () Bool)

(assert (=> b!1262258 (= e!718505 e!718506)))

(declare-fun c!122790 () Bool)

(assert (=> b!1262258 (= c!122790 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138401 () Bool)

(declare-fun res!840963 () Bool)

(declare-fun e!718507 () Bool)

(assert (=> d!138401 (=> res!840963 e!718507)))

(assert (=> d!138401 (= res!840963 (bvsge #b00000000000000000000000000000000 (size!40231 _keys!1118)))))

(assert (=> d!138401 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28305) e!718507)))

(declare-fun b!1262259 () Bool)

(assert (=> b!1262259 (= e!718506 call!62054)))

(declare-fun b!1262260 () Bool)

(assert (=> b!1262260 (= e!718507 e!718505)))

(declare-fun res!840962 () Bool)

(assert (=> b!1262260 (=> (not res!840962) (not e!718505))))

(declare-fun e!718508 () Bool)

(assert (=> b!1262260 (= res!840962 (not e!718508))))

(declare-fun res!840964 () Bool)

(assert (=> b!1262260 (=> (not res!840964) (not e!718508))))

(assert (=> b!1262260 (= res!840964 (validKeyInArray!0 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262261 () Bool)

(declare-fun contains!7561 (List!28308 (_ BitVec 64)) Bool)

(assert (=> b!1262261 (= e!718508 (contains!7561 Nil!28305 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62051 () Bool)

(assert (=> bm!62051 (= call!62054 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122790 (Cons!28304 (select (arr!39693 _keys!1118) #b00000000000000000000000000000000) Nil!28305) Nil!28305)))))

(assert (= (and d!138401 (not res!840963)) b!1262260))

(assert (= (and b!1262260 res!840964) b!1262261))

(assert (= (and b!1262260 res!840962) b!1262258))

(assert (= (and b!1262258 c!122790) b!1262257))

(assert (= (and b!1262258 (not c!122790)) b!1262259))

(assert (= (or b!1262257 b!1262259) bm!62051))

(assert (=> b!1262258 m!1162207))

(assert (=> b!1262258 m!1162207))

(assert (=> b!1262258 m!1162225))

(assert (=> b!1262260 m!1162207))

(assert (=> b!1262260 m!1162207))

(assert (=> b!1262260 m!1162225))

(assert (=> b!1262261 m!1162207))

(assert (=> b!1262261 m!1162207))

(declare-fun m!1162367 () Bool)

(assert (=> b!1262261 m!1162367))

(assert (=> bm!62051 m!1162207))

(declare-fun m!1162369 () Bool)

(assert (=> bm!62051 m!1162369))

(assert (=> b!1262040 d!138401))

(declare-fun b!1262268 () Bool)

(declare-fun e!718514 () Bool)

(assert (=> b!1262268 (= e!718514 tp_is_empty!32371)))

(declare-fun mapIsEmpty!50377 () Bool)

(declare-fun mapRes!50377 () Bool)

(assert (=> mapIsEmpty!50377 mapRes!50377))

(declare-fun mapNonEmpty!50377 () Bool)

(declare-fun tp!95963 () Bool)

(assert (=> mapNonEmpty!50377 (= mapRes!50377 (and tp!95963 e!718514))))

(declare-fun mapValue!50377 () ValueCell!15422)

(declare-fun mapRest!50377 () (Array (_ BitVec 32) ValueCell!15422))

(declare-fun mapKey!50377 () (_ BitVec 32))

(assert (=> mapNonEmpty!50377 (= mapRest!50368 (store mapRest!50377 mapKey!50377 mapValue!50377))))

(declare-fun b!1262269 () Bool)

(declare-fun e!718513 () Bool)

(assert (=> b!1262269 (= e!718513 tp_is_empty!32371)))

(declare-fun condMapEmpty!50377 () Bool)

(declare-fun mapDefault!50377 () ValueCell!15422)

(assert (=> mapNonEmpty!50368 (= condMapEmpty!50377 (= mapRest!50368 ((as const (Array (_ BitVec 32) ValueCell!15422)) mapDefault!50377)))))

(assert (=> mapNonEmpty!50368 (= tp!95947 (and e!718513 mapRes!50377))))

(assert (= (and mapNonEmpty!50368 condMapEmpty!50377) mapIsEmpty!50377))

(assert (= (and mapNonEmpty!50368 (not condMapEmpty!50377)) mapNonEmpty!50377))

(assert (= (and mapNonEmpty!50377 ((_ is ValueCellFull!15422) mapValue!50377)) b!1262268))

(assert (= (and mapNonEmpty!50368 ((_ is ValueCellFull!15422) mapDefault!50377)) b!1262269))

(declare-fun m!1162371 () Bool)

(assert (=> mapNonEmpty!50377 m!1162371))

(declare-fun b_lambda!22853 () Bool)

(assert (= b_lambda!22851 (or (and start!105976 b_free!27469) b_lambda!22853)))

(declare-fun b_lambda!22855 () Bool)

(assert (= b_lambda!22841 (or (and start!105976 b_free!27469) b_lambda!22855)))

(declare-fun b_lambda!22857 () Bool)

(assert (= b_lambda!22843 (or (and start!105976 b_free!27469) b_lambda!22857)))

(declare-fun b_lambda!22859 () Bool)

(assert (= b_lambda!22849 (or (and start!105976 b_free!27469) b_lambda!22859)))

(declare-fun b_lambda!22861 () Bool)

(assert (= b_lambda!22845 (or (and start!105976 b_free!27469) b_lambda!22861)))

(declare-fun b_lambda!22863 () Bool)

(assert (= b_lambda!22847 (or (and start!105976 b_free!27469) b_lambda!22863)))

(check-sat (not b!1262144) (not b!1262233) (not b!1262214) (not b!1262203) (not bm!62043) (not b_lambda!22861) (not d!138381) (not d!138385) (not b!1262139) (not b!1262155) (not bm!62042) (not b_lambda!22863) (not b!1262120) (not d!138391) (not bm!62038) (not b!1262137) (not b!1262224) (not bm!62017) (not b!1262136) (not b_lambda!22855) (not bm!62036) (not b_lambda!22857) (not b!1262216) (not b!1262138) (not b!1262245) (not b!1262123) (not bm!62016) (not b_lambda!22859) (not b!1262141) (not d!138383) (not b_next!27469) (not b!1262218) (not b!1262154) (not b!1262209) (not b!1262129) (not b!1262127) (not b!1262234) (not b!1262134) (not b!1262225) (not b!1262243) (not bm!62035) (not b!1262236) (not b!1262258) (not b!1262124) (not d!138389) (not b!1262122) (not b!1262125) (not b!1262206) (not b!1262261) (not b!1262130) (not b_lambda!22853) (not bm!62037) (not bm!62020) (not b!1262241) (not b!1262143) (not b!1262260) (not bm!62045) (not bm!62044) (not bm!62051) (not b!1262242) (not b!1262230) tp_is_empty!32371 (not mapNonEmpty!50377) b_and!45405 (not d!138393) (not b!1262207) (not b!1262215))
(check-sat b_and!45405 (not b_next!27469))
