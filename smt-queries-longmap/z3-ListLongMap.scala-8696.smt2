; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105592 () Bool)

(assert start!105592)

(declare-fun b_free!27211 () Bool)

(declare-fun b_next!27211 () Bool)

(assert (=> start!105592 (= b_free!27211 (not b_next!27211))))

(declare-fun tp!95153 () Bool)

(declare-fun b_and!45059 () Bool)

(assert (=> start!105592 (= tp!95153 b_and!45059)))

(declare-fun mapIsEmpty!49960 () Bool)

(declare-fun mapRes!49960 () Bool)

(assert (=> mapIsEmpty!49960 mapRes!49960))

(declare-fun b!1257849 () Bool)

(declare-fun res!838434 () Bool)

(declare-fun e!715319 () Bool)

(assert (=> b!1257849 (=> (not res!838434) (not e!715319))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81779 0))(
  ( (array!81780 (arr!39447 (Array (_ BitVec 32) (_ BitVec 64))) (size!39985 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81779)

(declare-datatypes ((V!48183 0))(
  ( (V!48184 (val!16119 Int)) )
))
(declare-datatypes ((ValueCell!15293 0))(
  ( (ValueCellFull!15293 (v!18820 V!48183)) (EmptyCell!15293) )
))
(declare-datatypes ((array!81781 0))(
  ( (array!81782 (arr!39448 (Array (_ BitVec 32) ValueCell!15293)) (size!39986 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81781)

(assert (=> b!1257849 (= res!838434 (and (= (size!39986 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39985 _keys!1118) (size!39986 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257850 () Bool)

(declare-fun e!715318 () Bool)

(declare-fun tp_is_empty!32113 () Bool)

(assert (=> b!1257850 (= e!715318 tp_is_empty!32113)))

(declare-fun mapNonEmpty!49960 () Bool)

(declare-fun tp!95152 () Bool)

(assert (=> mapNonEmpty!49960 (= mapRes!49960 (and tp!95152 e!715318))))

(declare-fun mapKey!49960 () (_ BitVec 32))

(declare-fun mapValue!49960 () ValueCell!15293)

(declare-fun mapRest!49960 () (Array (_ BitVec 32) ValueCell!15293))

(assert (=> mapNonEmpty!49960 (= (arr!39448 _values!914) (store mapRest!49960 mapKey!49960 mapValue!49960))))

(declare-fun b!1257851 () Bool)

(declare-fun res!838435 () Bool)

(assert (=> b!1257851 (=> (not res!838435) (not e!715319))))

(declare-datatypes ((List!28115 0))(
  ( (Nil!28112) (Cons!28111 (h!29320 (_ BitVec 64)) (t!41597 List!28115)) )
))
(declare-fun arrayNoDuplicates!0 (array!81779 (_ BitVec 32) List!28115) Bool)

(assert (=> b!1257851 (= res!838435 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28112))))

(declare-fun b!1257852 () Bool)

(declare-fun res!838436 () Bool)

(assert (=> b!1257852 (=> (not res!838436) (not e!715319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81779 (_ BitVec 32)) Bool)

(assert (=> b!1257852 (= res!838436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257853 () Bool)

(declare-fun e!715317 () Bool)

(assert (=> b!1257853 (= e!715317 tp_is_empty!32113)))

(declare-fun b!1257854 () Bool)

(declare-fun e!715320 () Bool)

(assert (=> b!1257854 (= e!715320 (and e!715317 mapRes!49960))))

(declare-fun condMapEmpty!49960 () Bool)

(declare-fun mapDefault!49960 () ValueCell!15293)

(assert (=> b!1257854 (= condMapEmpty!49960 (= (arr!39448 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15293)) mapDefault!49960)))))

(declare-fun res!838437 () Bool)

(assert (=> start!105592 (=> (not res!838437) (not e!715319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105592 (= res!838437 (validMask!0 mask!1466))))

(assert (=> start!105592 e!715319))

(assert (=> start!105592 true))

(assert (=> start!105592 tp!95153))

(assert (=> start!105592 tp_is_empty!32113))

(declare-fun array_inv!30179 (array!81779) Bool)

(assert (=> start!105592 (array_inv!30179 _keys!1118)))

(declare-fun array_inv!30180 (array!81781) Bool)

(assert (=> start!105592 (and (array_inv!30180 _values!914) e!715320)))

(declare-fun b!1257855 () Bool)

(assert (=> b!1257855 (= e!715319 (not (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!39985 _keys!1118)))))))

(declare-datatypes ((tuple2!20908 0))(
  ( (tuple2!20909 (_1!10465 (_ BitVec 64)) (_2!10465 V!48183)) )
))
(declare-datatypes ((List!28116 0))(
  ( (Nil!28113) (Cons!28112 (h!29321 tuple2!20908) (t!41598 List!28116)) )
))
(declare-datatypes ((ListLongMap!18781 0))(
  ( (ListLongMap!18782 (toList!9406 List!28116)) )
))
(declare-fun lt!568775 () ListLongMap!18781)

(declare-fun lt!568776 () ListLongMap!18781)

(assert (=> b!1257855 (= lt!568775 lt!568776)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48183)

(declare-fun minValueBefore!43 () V!48183)

(declare-datatypes ((Unit!41771 0))(
  ( (Unit!41772) )
))
(declare-fun lt!568777 () Unit!41771)

(declare-fun zeroValue!871 () V!48183)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1110 (array!81779 array!81781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48183 V!48183 V!48183 V!48183 (_ BitVec 32) Int) Unit!41771)

(assert (=> b!1257855 (= lt!568777 (lemmaNoChangeToArrayThenSameMapNoExtras!1110 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5788 (array!81779 array!81781 (_ BitVec 32) (_ BitVec 32) V!48183 V!48183 (_ BitVec 32) Int) ListLongMap!18781)

(assert (=> b!1257855 (= lt!568776 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257855 (= lt!568775 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105592 res!838437) b!1257849))

(assert (= (and b!1257849 res!838434) b!1257852))

(assert (= (and b!1257852 res!838436) b!1257851))

(assert (= (and b!1257851 res!838435) b!1257855))

(assert (= (and b!1257854 condMapEmpty!49960) mapIsEmpty!49960))

(assert (= (and b!1257854 (not condMapEmpty!49960)) mapNonEmpty!49960))

(get-info :version)

(assert (= (and mapNonEmpty!49960 ((_ is ValueCellFull!15293) mapValue!49960)) b!1257850))

(assert (= (and b!1257854 ((_ is ValueCellFull!15293) mapDefault!49960)) b!1257853))

(assert (= start!105592 b!1257854))

(declare-fun m!1157929 () Bool)

(assert (=> b!1257851 m!1157929))

(declare-fun m!1157931 () Bool)

(assert (=> start!105592 m!1157931))

(declare-fun m!1157933 () Bool)

(assert (=> start!105592 m!1157933))

(declare-fun m!1157935 () Bool)

(assert (=> start!105592 m!1157935))

(declare-fun m!1157937 () Bool)

(assert (=> mapNonEmpty!49960 m!1157937))

(declare-fun m!1157939 () Bool)

(assert (=> b!1257855 m!1157939))

(declare-fun m!1157941 () Bool)

(assert (=> b!1257855 m!1157941))

(declare-fun m!1157943 () Bool)

(assert (=> b!1257855 m!1157943))

(declare-fun m!1157945 () Bool)

(assert (=> b!1257852 m!1157945))

(check-sat (not b!1257855) (not start!105592) (not b!1257852) (not b_next!27211) (not b!1257851) b_and!45059 tp_is_empty!32113 (not mapNonEmpty!49960))
(check-sat b_and!45059 (not b_next!27211))
(get-model)

(declare-fun d!138137 () Bool)

(assert (=> d!138137 (= (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568798 () Unit!41771)

(declare-fun choose!1871 (array!81779 array!81781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48183 V!48183 V!48183 V!48183 (_ BitVec 32) Int) Unit!41771)

(assert (=> d!138137 (= lt!568798 (choose!1871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138137 (validMask!0 mask!1466)))

(assert (=> d!138137 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1110 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568798)))

(declare-fun bs!35551 () Bool)

(assert (= bs!35551 d!138137))

(assert (=> bs!35551 m!1157943))

(assert (=> bs!35551 m!1157941))

(declare-fun m!1157983 () Bool)

(assert (=> bs!35551 m!1157983))

(assert (=> bs!35551 m!1157931))

(assert (=> b!1257855 d!138137))

(declare-fun b!1257922 () Bool)

(declare-fun e!715371 () Bool)

(declare-fun e!715366 () Bool)

(assert (=> b!1257922 (= e!715371 e!715366)))

(assert (=> b!1257922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(declare-fun res!838470 () Bool)

(declare-fun lt!568817 () ListLongMap!18781)

(declare-fun contains!7541 (ListLongMap!18781 (_ BitVec 64)) Bool)

(assert (=> b!1257922 (= res!838470 (contains!7541 lt!568817 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257922 (=> (not res!838470) (not e!715366))))

(declare-fun b!1257923 () Bool)

(declare-fun res!838473 () Bool)

(declare-fun e!715367 () Bool)

(assert (=> b!1257923 (=> (not res!838473) (not e!715367))))

(assert (=> b!1257923 (= res!838473 (not (contains!7541 lt!568817 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1257924 () Bool)

(declare-fun lt!568819 () Unit!41771)

(declare-fun lt!568818 () Unit!41771)

(assert (=> b!1257924 (= lt!568819 lt!568818)))

(declare-fun lt!568813 () V!48183)

(declare-fun lt!568816 () (_ BitVec 64))

(declare-fun lt!568815 () (_ BitVec 64))

(declare-fun lt!568814 () ListLongMap!18781)

(declare-fun +!4228 (ListLongMap!18781 tuple2!20908) ListLongMap!18781)

(assert (=> b!1257924 (not (contains!7541 (+!4228 lt!568814 (tuple2!20909 lt!568815 lt!568813)) lt!568816))))

(declare-fun addStillNotContains!319 (ListLongMap!18781 (_ BitVec 64) V!48183 (_ BitVec 64)) Unit!41771)

(assert (=> b!1257924 (= lt!568818 (addStillNotContains!319 lt!568814 lt!568815 lt!568813 lt!568816))))

(assert (=> b!1257924 (= lt!568816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20180 (ValueCell!15293 V!48183) V!48183)

(declare-fun dynLambda!3413 (Int (_ BitVec 64)) V!48183)

(assert (=> b!1257924 (= lt!568813 (get!20180 (select (arr!39448 _values!914) #b00000000000000000000000000000000) (dynLambda!3413 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1257924 (= lt!568815 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61823 () ListLongMap!18781)

(assert (=> b!1257924 (= lt!568814 call!61823)))

(declare-fun e!715368 () ListLongMap!18781)

(assert (=> b!1257924 (= e!715368 (+!4228 call!61823 (tuple2!20909 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000) (get!20180 (select (arr!39448 _values!914) #b00000000000000000000000000000000) (dynLambda!3413 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1257925 () Bool)

(assert (=> b!1257925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(assert (=> b!1257925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39986 _values!914)))))

(declare-fun apply!983 (ListLongMap!18781 (_ BitVec 64)) V!48183)

(assert (=> b!1257925 (= e!715366 (= (apply!983 lt!568817 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)) (get!20180 (select (arr!39448 _values!914) #b00000000000000000000000000000000) (dynLambda!3413 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1257926 () Bool)

(declare-fun e!715372 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1257926 (= e!715372 (validKeyInArray!0 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257926 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1257927 () Bool)

(declare-fun e!715369 () Bool)

(assert (=> b!1257927 (= e!715369 (= lt!568817 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!61820 () Bool)

(assert (=> bm!61820 (= call!61823 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1257928 () Bool)

(assert (=> b!1257928 (= e!715368 call!61823)))

(declare-fun d!138139 () Bool)

(assert (=> d!138139 e!715367))

(declare-fun res!838471 () Bool)

(assert (=> d!138139 (=> (not res!838471) (not e!715367))))

(assert (=> d!138139 (= res!838471 (not (contains!7541 lt!568817 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!715370 () ListLongMap!18781)

(assert (=> d!138139 (= lt!568817 e!715370)))

(declare-fun c!122486 () Bool)

(assert (=> d!138139 (= c!122486 (bvsge #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(assert (=> d!138139 (validMask!0 mask!1466)))

(assert (=> d!138139 (= (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568817)))

(declare-fun b!1257929 () Bool)

(assert (=> b!1257929 (= e!715370 (ListLongMap!18782 Nil!28113))))

(declare-fun b!1257930 () Bool)

(assert (=> b!1257930 (= e!715371 e!715369)))

(declare-fun c!122488 () Bool)

(assert (=> b!1257930 (= c!122488 (bvslt #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(declare-fun b!1257931 () Bool)

(assert (=> b!1257931 (= e!715367 e!715371)))

(declare-fun c!122487 () Bool)

(assert (=> b!1257931 (= c!122487 e!715372)))

(declare-fun res!838472 () Bool)

(assert (=> b!1257931 (=> (not res!838472) (not e!715372))))

(assert (=> b!1257931 (= res!838472 (bvslt #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(declare-fun b!1257932 () Bool)

(declare-fun isEmpty!1038 (ListLongMap!18781) Bool)

(assert (=> b!1257932 (= e!715369 (isEmpty!1038 lt!568817))))

(declare-fun b!1257933 () Bool)

(assert (=> b!1257933 (= e!715370 e!715368)))

(declare-fun c!122485 () Bool)

(assert (=> b!1257933 (= c!122485 (validKeyInArray!0 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138139 c!122486) b!1257929))

(assert (= (and d!138139 (not c!122486)) b!1257933))

(assert (= (and b!1257933 c!122485) b!1257924))

(assert (= (and b!1257933 (not c!122485)) b!1257928))

(assert (= (or b!1257924 b!1257928) bm!61820))

(assert (= (and d!138139 res!838471) b!1257923))

(assert (= (and b!1257923 res!838473) b!1257931))

(assert (= (and b!1257931 res!838472) b!1257926))

(assert (= (and b!1257931 c!122487) b!1257922))

(assert (= (and b!1257931 (not c!122487)) b!1257930))

(assert (= (and b!1257922 res!838470) b!1257925))

(assert (= (and b!1257930 c!122488) b!1257927))

(assert (= (and b!1257930 (not c!122488)) b!1257932))

(declare-fun b_lambda!22697 () Bool)

(assert (=> (not b_lambda!22697) (not b!1257924)))

(declare-fun t!41602 () Bool)

(declare-fun tb!11299 () Bool)

(assert (=> (and start!105592 (= defaultEntry!922 defaultEntry!922) t!41602) tb!11299))

(declare-fun result!23321 () Bool)

(assert (=> tb!11299 (= result!23321 tp_is_empty!32113)))

(assert (=> b!1257924 t!41602))

(declare-fun b_and!45065 () Bool)

(assert (= b_and!45059 (and (=> t!41602 result!23321) b_and!45065)))

(declare-fun b_lambda!22699 () Bool)

(assert (=> (not b_lambda!22699) (not b!1257925)))

(assert (=> b!1257925 t!41602))

(declare-fun b_and!45067 () Bool)

(assert (= b_and!45065 (and (=> t!41602 result!23321) b_and!45067)))

(declare-fun m!1157985 () Bool)

(assert (=> b!1257922 m!1157985))

(assert (=> b!1257922 m!1157985))

(declare-fun m!1157987 () Bool)

(assert (=> b!1257922 m!1157987))

(assert (=> b!1257925 m!1157985))

(declare-fun m!1157989 () Bool)

(assert (=> b!1257925 m!1157989))

(declare-fun m!1157991 () Bool)

(assert (=> b!1257925 m!1157991))

(declare-fun m!1157993 () Bool)

(assert (=> b!1257925 m!1157993))

(declare-fun m!1157995 () Bool)

(assert (=> b!1257925 m!1157995))

(assert (=> b!1257925 m!1157993))

(assert (=> b!1257925 m!1157991))

(assert (=> b!1257925 m!1157985))

(declare-fun m!1157997 () Bool)

(assert (=> d!138139 m!1157997))

(assert (=> d!138139 m!1157931))

(declare-fun m!1157999 () Bool)

(assert (=> b!1257923 m!1157999))

(assert (=> b!1257933 m!1157985))

(assert (=> b!1257933 m!1157985))

(declare-fun m!1158001 () Bool)

(assert (=> b!1257933 m!1158001))

(declare-fun m!1158003 () Bool)

(assert (=> b!1257932 m!1158003))

(declare-fun m!1158005 () Bool)

(assert (=> b!1257924 m!1158005))

(declare-fun m!1158007 () Bool)

(assert (=> b!1257924 m!1158007))

(declare-fun m!1158009 () Bool)

(assert (=> b!1257924 m!1158009))

(assert (=> b!1257924 m!1158009))

(declare-fun m!1158011 () Bool)

(assert (=> b!1257924 m!1158011))

(assert (=> b!1257924 m!1157991))

(assert (=> b!1257924 m!1157993))

(assert (=> b!1257924 m!1157995))

(assert (=> b!1257924 m!1157993))

(assert (=> b!1257924 m!1157991))

(assert (=> b!1257924 m!1157985))

(declare-fun m!1158013 () Bool)

(assert (=> b!1257927 m!1158013))

(assert (=> bm!61820 m!1158013))

(assert (=> b!1257926 m!1157985))

(assert (=> b!1257926 m!1157985))

(assert (=> b!1257926 m!1158001))

(assert (=> b!1257855 d!138139))

(declare-fun b!1257936 () Bool)

(declare-fun e!715378 () Bool)

(declare-fun e!715373 () Bool)

(assert (=> b!1257936 (= e!715378 e!715373)))

(assert (=> b!1257936 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(declare-fun res!838474 () Bool)

(declare-fun lt!568824 () ListLongMap!18781)

(assert (=> b!1257936 (= res!838474 (contains!7541 lt!568824 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257936 (=> (not res!838474) (not e!715373))))

(declare-fun b!1257937 () Bool)

(declare-fun res!838477 () Bool)

(declare-fun e!715374 () Bool)

(assert (=> b!1257937 (=> (not res!838477) (not e!715374))))

(assert (=> b!1257937 (= res!838477 (not (contains!7541 lt!568824 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1257938 () Bool)

(declare-fun lt!568826 () Unit!41771)

(declare-fun lt!568825 () Unit!41771)

(assert (=> b!1257938 (= lt!568826 lt!568825)))

(declare-fun lt!568821 () ListLongMap!18781)

(declare-fun lt!568822 () (_ BitVec 64))

(declare-fun lt!568820 () V!48183)

(declare-fun lt!568823 () (_ BitVec 64))

(assert (=> b!1257938 (not (contains!7541 (+!4228 lt!568821 (tuple2!20909 lt!568822 lt!568820)) lt!568823))))

(assert (=> b!1257938 (= lt!568825 (addStillNotContains!319 lt!568821 lt!568822 lt!568820 lt!568823))))

(assert (=> b!1257938 (= lt!568823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1257938 (= lt!568820 (get!20180 (select (arr!39448 _values!914) #b00000000000000000000000000000000) (dynLambda!3413 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1257938 (= lt!568822 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61824 () ListLongMap!18781)

(assert (=> b!1257938 (= lt!568821 call!61824)))

(declare-fun e!715375 () ListLongMap!18781)

(assert (=> b!1257938 (= e!715375 (+!4228 call!61824 (tuple2!20909 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000) (get!20180 (select (arr!39448 _values!914) #b00000000000000000000000000000000) (dynLambda!3413 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1257939 () Bool)

(assert (=> b!1257939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(assert (=> b!1257939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39986 _values!914)))))

(assert (=> b!1257939 (= e!715373 (= (apply!983 lt!568824 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)) (get!20180 (select (arr!39448 _values!914) #b00000000000000000000000000000000) (dynLambda!3413 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1257940 () Bool)

(declare-fun e!715379 () Bool)

(assert (=> b!1257940 (= e!715379 (validKeyInArray!0 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257940 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1257941 () Bool)

(declare-fun e!715376 () Bool)

(assert (=> b!1257941 (= e!715376 (= lt!568824 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!61821 () Bool)

(assert (=> bm!61821 (= call!61824 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1257942 () Bool)

(assert (=> b!1257942 (= e!715375 call!61824)))

(declare-fun d!138141 () Bool)

(assert (=> d!138141 e!715374))

(declare-fun res!838475 () Bool)

(assert (=> d!138141 (=> (not res!838475) (not e!715374))))

(assert (=> d!138141 (= res!838475 (not (contains!7541 lt!568824 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!715377 () ListLongMap!18781)

(assert (=> d!138141 (= lt!568824 e!715377)))

(declare-fun c!122490 () Bool)

(assert (=> d!138141 (= c!122490 (bvsge #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(assert (=> d!138141 (validMask!0 mask!1466)))

(assert (=> d!138141 (= (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568824)))

(declare-fun b!1257943 () Bool)

(assert (=> b!1257943 (= e!715377 (ListLongMap!18782 Nil!28113))))

(declare-fun b!1257944 () Bool)

(assert (=> b!1257944 (= e!715378 e!715376)))

(declare-fun c!122492 () Bool)

(assert (=> b!1257944 (= c!122492 (bvslt #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(declare-fun b!1257945 () Bool)

(assert (=> b!1257945 (= e!715374 e!715378)))

(declare-fun c!122491 () Bool)

(assert (=> b!1257945 (= c!122491 e!715379)))

(declare-fun res!838476 () Bool)

(assert (=> b!1257945 (=> (not res!838476) (not e!715379))))

(assert (=> b!1257945 (= res!838476 (bvslt #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(declare-fun b!1257946 () Bool)

(assert (=> b!1257946 (= e!715376 (isEmpty!1038 lt!568824))))

(declare-fun b!1257947 () Bool)

(assert (=> b!1257947 (= e!715377 e!715375)))

(declare-fun c!122489 () Bool)

(assert (=> b!1257947 (= c!122489 (validKeyInArray!0 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138141 c!122490) b!1257943))

(assert (= (and d!138141 (not c!122490)) b!1257947))

(assert (= (and b!1257947 c!122489) b!1257938))

(assert (= (and b!1257947 (not c!122489)) b!1257942))

(assert (= (or b!1257938 b!1257942) bm!61821))

(assert (= (and d!138141 res!838475) b!1257937))

(assert (= (and b!1257937 res!838477) b!1257945))

(assert (= (and b!1257945 res!838476) b!1257940))

(assert (= (and b!1257945 c!122491) b!1257936))

(assert (= (and b!1257945 (not c!122491)) b!1257944))

(assert (= (and b!1257936 res!838474) b!1257939))

(assert (= (and b!1257944 c!122492) b!1257941))

(assert (= (and b!1257944 (not c!122492)) b!1257946))

(declare-fun b_lambda!22701 () Bool)

(assert (=> (not b_lambda!22701) (not b!1257938)))

(assert (=> b!1257938 t!41602))

(declare-fun b_and!45069 () Bool)

(assert (= b_and!45067 (and (=> t!41602 result!23321) b_and!45069)))

(declare-fun b_lambda!22703 () Bool)

(assert (=> (not b_lambda!22703) (not b!1257939)))

(assert (=> b!1257939 t!41602))

(declare-fun b_and!45071 () Bool)

(assert (= b_and!45069 (and (=> t!41602 result!23321) b_and!45071)))

(assert (=> b!1257936 m!1157985))

(assert (=> b!1257936 m!1157985))

(declare-fun m!1158015 () Bool)

(assert (=> b!1257936 m!1158015))

(assert (=> b!1257939 m!1157985))

(declare-fun m!1158017 () Bool)

(assert (=> b!1257939 m!1158017))

(assert (=> b!1257939 m!1157991))

(assert (=> b!1257939 m!1157993))

(assert (=> b!1257939 m!1157995))

(assert (=> b!1257939 m!1157993))

(assert (=> b!1257939 m!1157991))

(assert (=> b!1257939 m!1157985))

(declare-fun m!1158019 () Bool)

(assert (=> d!138141 m!1158019))

(assert (=> d!138141 m!1157931))

(declare-fun m!1158021 () Bool)

(assert (=> b!1257937 m!1158021))

(assert (=> b!1257947 m!1157985))

(assert (=> b!1257947 m!1157985))

(assert (=> b!1257947 m!1158001))

(declare-fun m!1158023 () Bool)

(assert (=> b!1257946 m!1158023))

(declare-fun m!1158025 () Bool)

(assert (=> b!1257938 m!1158025))

(declare-fun m!1158027 () Bool)

(assert (=> b!1257938 m!1158027))

(declare-fun m!1158029 () Bool)

(assert (=> b!1257938 m!1158029))

(assert (=> b!1257938 m!1158029))

(declare-fun m!1158031 () Bool)

(assert (=> b!1257938 m!1158031))

(assert (=> b!1257938 m!1157991))

(assert (=> b!1257938 m!1157993))

(assert (=> b!1257938 m!1157995))

(assert (=> b!1257938 m!1157993))

(assert (=> b!1257938 m!1157991))

(assert (=> b!1257938 m!1157985))

(declare-fun m!1158033 () Bool)

(assert (=> b!1257941 m!1158033))

(assert (=> bm!61821 m!1158033))

(assert (=> b!1257940 m!1157985))

(assert (=> b!1257940 m!1157985))

(assert (=> b!1257940 m!1158001))

(assert (=> b!1257855 d!138141))

(declare-fun d!138143 () Bool)

(declare-fun res!838484 () Bool)

(declare-fun e!715391 () Bool)

(assert (=> d!138143 (=> res!838484 e!715391)))

(assert (=> d!138143 (= res!838484 (bvsge #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(assert (=> d!138143 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28112) e!715391)))

(declare-fun b!1257958 () Bool)

(declare-fun e!715390 () Bool)

(declare-fun call!61827 () Bool)

(assert (=> b!1257958 (= e!715390 call!61827)))

(declare-fun b!1257959 () Bool)

(assert (=> b!1257959 (= e!715390 call!61827)))

(declare-fun b!1257960 () Bool)

(declare-fun e!715389 () Bool)

(assert (=> b!1257960 (= e!715389 e!715390)))

(declare-fun c!122495 () Bool)

(assert (=> b!1257960 (= c!122495 (validKeyInArray!0 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257961 () Bool)

(assert (=> b!1257961 (= e!715391 e!715389)))

(declare-fun res!838486 () Bool)

(assert (=> b!1257961 (=> (not res!838486) (not e!715389))))

(declare-fun e!715388 () Bool)

(assert (=> b!1257961 (= res!838486 (not e!715388))))

(declare-fun res!838485 () Bool)

(assert (=> b!1257961 (=> (not res!838485) (not e!715388))))

(assert (=> b!1257961 (= res!838485 (validKeyInArray!0 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61824 () Bool)

(assert (=> bm!61824 (= call!61827 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122495 (Cons!28111 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000) Nil!28112) Nil!28112)))))

(declare-fun b!1257962 () Bool)

(declare-fun contains!7542 (List!28115 (_ BitVec 64)) Bool)

(assert (=> b!1257962 (= e!715388 (contains!7542 Nil!28112 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138143 (not res!838484)) b!1257961))

(assert (= (and b!1257961 res!838485) b!1257962))

(assert (= (and b!1257961 res!838486) b!1257960))

(assert (= (and b!1257960 c!122495) b!1257958))

(assert (= (and b!1257960 (not c!122495)) b!1257959))

(assert (= (or b!1257958 b!1257959) bm!61824))

(assert (=> b!1257960 m!1157985))

(assert (=> b!1257960 m!1157985))

(assert (=> b!1257960 m!1158001))

(assert (=> b!1257961 m!1157985))

(assert (=> b!1257961 m!1157985))

(assert (=> b!1257961 m!1158001))

(assert (=> bm!61824 m!1157985))

(declare-fun m!1158035 () Bool)

(assert (=> bm!61824 m!1158035))

(assert (=> b!1257962 m!1157985))

(assert (=> b!1257962 m!1157985))

(declare-fun m!1158037 () Bool)

(assert (=> b!1257962 m!1158037))

(assert (=> b!1257851 d!138143))

(declare-fun d!138145 () Bool)

(assert (=> d!138145 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105592 d!138145))

(declare-fun d!138147 () Bool)

(assert (=> d!138147 (= (array_inv!30179 _keys!1118) (bvsge (size!39985 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105592 d!138147))

(declare-fun d!138149 () Bool)

(assert (=> d!138149 (= (array_inv!30180 _values!914) (bvsge (size!39986 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105592 d!138149))

(declare-fun b!1257971 () Bool)

(declare-fun e!715400 () Bool)

(declare-fun call!61830 () Bool)

(assert (=> b!1257971 (= e!715400 call!61830)))

(declare-fun b!1257972 () Bool)

(declare-fun e!715399 () Bool)

(assert (=> b!1257972 (= e!715400 e!715399)))

(declare-fun lt!568835 () (_ BitVec 64))

(assert (=> b!1257972 (= lt!568835 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568834 () Unit!41771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81779 (_ BitVec 64) (_ BitVec 32)) Unit!41771)

(assert (=> b!1257972 (= lt!568834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!568835 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1257972 (arrayContainsKey!0 _keys!1118 lt!568835 #b00000000000000000000000000000000)))

(declare-fun lt!568833 () Unit!41771)

(assert (=> b!1257972 (= lt!568833 lt!568834)))

(declare-fun res!838492 () Bool)

(declare-datatypes ((SeekEntryResult!9967 0))(
  ( (MissingZero!9967 (index!42239 (_ BitVec 32))) (Found!9967 (index!42240 (_ BitVec 32))) (Intermediate!9967 (undefined!10779 Bool) (index!42241 (_ BitVec 32)) (x!110797 (_ BitVec 32))) (Undefined!9967) (MissingVacant!9967 (index!42242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81779 (_ BitVec 32)) SeekEntryResult!9967)

(assert (=> b!1257972 (= res!838492 (= (seekEntryOrOpen!0 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9967 #b00000000000000000000000000000000)))))

(assert (=> b!1257972 (=> (not res!838492) (not e!715399))))

(declare-fun bm!61827 () Bool)

(assert (=> bm!61827 (= call!61830 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!138151 () Bool)

(declare-fun res!838491 () Bool)

(declare-fun e!715398 () Bool)

(assert (=> d!138151 (=> res!838491 e!715398)))

(assert (=> d!138151 (= res!838491 (bvsge #b00000000000000000000000000000000 (size!39985 _keys!1118)))))

(assert (=> d!138151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!715398)))

(declare-fun b!1257973 () Bool)

(assert (=> b!1257973 (= e!715398 e!715400)))

(declare-fun c!122498 () Bool)

(assert (=> b!1257973 (= c!122498 (validKeyInArray!0 (select (arr!39447 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257974 () Bool)

(assert (=> b!1257974 (= e!715399 call!61830)))

(assert (= (and d!138151 (not res!838491)) b!1257973))

(assert (= (and b!1257973 c!122498) b!1257972))

(assert (= (and b!1257973 (not c!122498)) b!1257971))

(assert (= (and b!1257972 res!838492) b!1257974))

(assert (= (or b!1257974 b!1257971) bm!61827))

(assert (=> b!1257972 m!1157985))

(declare-fun m!1158039 () Bool)

(assert (=> b!1257972 m!1158039))

(declare-fun m!1158041 () Bool)

(assert (=> b!1257972 m!1158041))

(assert (=> b!1257972 m!1157985))

(declare-fun m!1158043 () Bool)

(assert (=> b!1257972 m!1158043))

(declare-fun m!1158045 () Bool)

(assert (=> bm!61827 m!1158045))

(assert (=> b!1257973 m!1157985))

(assert (=> b!1257973 m!1157985))

(assert (=> b!1257973 m!1158001))

(assert (=> b!1257852 d!138151))

(declare-fun mapIsEmpty!49969 () Bool)

(declare-fun mapRes!49969 () Bool)

(assert (=> mapIsEmpty!49969 mapRes!49969))

(declare-fun condMapEmpty!49969 () Bool)

(declare-fun mapDefault!49969 () ValueCell!15293)

(assert (=> mapNonEmpty!49960 (= condMapEmpty!49969 (= mapRest!49960 ((as const (Array (_ BitVec 32) ValueCell!15293)) mapDefault!49969)))))

(declare-fun e!715405 () Bool)

(assert (=> mapNonEmpty!49960 (= tp!95152 (and e!715405 mapRes!49969))))

(declare-fun b!1257981 () Bool)

(declare-fun e!715406 () Bool)

(assert (=> b!1257981 (= e!715406 tp_is_empty!32113)))

(declare-fun mapNonEmpty!49969 () Bool)

(declare-fun tp!95168 () Bool)

(assert (=> mapNonEmpty!49969 (= mapRes!49969 (and tp!95168 e!715406))))

(declare-fun mapKey!49969 () (_ BitVec 32))

(declare-fun mapRest!49969 () (Array (_ BitVec 32) ValueCell!15293))

(declare-fun mapValue!49969 () ValueCell!15293)

(assert (=> mapNonEmpty!49969 (= mapRest!49960 (store mapRest!49969 mapKey!49969 mapValue!49969))))

(declare-fun b!1257982 () Bool)

(assert (=> b!1257982 (= e!715405 tp_is_empty!32113)))

(assert (= (and mapNonEmpty!49960 condMapEmpty!49969) mapIsEmpty!49969))

(assert (= (and mapNonEmpty!49960 (not condMapEmpty!49969)) mapNonEmpty!49969))

(assert (= (and mapNonEmpty!49969 ((_ is ValueCellFull!15293) mapValue!49969)) b!1257981))

(assert (= (and mapNonEmpty!49960 ((_ is ValueCellFull!15293) mapDefault!49969)) b!1257982))

(declare-fun m!1158047 () Bool)

(assert (=> mapNonEmpty!49969 m!1158047))

(declare-fun b_lambda!22705 () Bool)

(assert (= b_lambda!22699 (or (and start!105592 b_free!27211) b_lambda!22705)))

(declare-fun b_lambda!22707 () Bool)

(assert (= b_lambda!22701 (or (and start!105592 b_free!27211) b_lambda!22707)))

(declare-fun b_lambda!22709 () Bool)

(assert (= b_lambda!22697 (or (and start!105592 b_free!27211) b_lambda!22709)))

(declare-fun b_lambda!22711 () Bool)

(assert (= b_lambda!22703 (or (and start!105592 b_free!27211) b_lambda!22711)))

(check-sat (not b_lambda!22709) (not d!138139) (not bm!61824) (not bm!61827) (not b!1257937) tp_is_empty!32113 (not b!1257960) (not b!1257926) (not b_lambda!22711) (not b_lambda!22707) (not b!1257938) (not b!1257936) (not bm!61820) (not b!1257961) (not b!1257933) (not b!1257962) (not b!1257927) b_and!45071 (not b!1257923) (not b_lambda!22705) (not b!1257946) (not d!138141) (not b!1257922) (not b!1257947) (not b_next!27211) (not b!1257940) (not mapNonEmpty!49969) (not bm!61821) (not b!1257925) (not b!1257939) (not b!1257972) (not b!1257932) (not d!138137) (not b!1257941) (not b!1257924) (not b!1257973))
(check-sat b_and!45071 (not b_next!27211))
