; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104940 () Bool)

(assert start!104940)

(declare-fun b_free!26533 () Bool)

(declare-fun b_next!26533 () Bool)

(assert (=> start!104940 (= b_free!26533 (not b_next!26533))))

(declare-fun tp!93085 () Bool)

(declare-fun b_and!44299 () Bool)

(assert (=> start!104940 (= tp!93085 b_and!44299)))

(declare-fun mapNonEmpty!48910 () Bool)

(declare-fun mapRes!48910 () Bool)

(declare-fun tp!93086 () Bool)

(declare-fun e!709256 () Bool)

(assert (=> mapNonEmpty!48910 (= mapRes!48910 (and tp!93086 e!709256))))

(declare-datatypes ((V!47279 0))(
  ( (V!47280 (val!15780 Int)) )
))
(declare-datatypes ((ValueCell!14954 0))(
  ( (ValueCellFull!14954 (v!18472 V!47279)) (EmptyCell!14954) )
))
(declare-datatypes ((array!80595 0))(
  ( (array!80596 (arr!38861 (Array (_ BitVec 32) ValueCell!14954)) (size!39398 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80595)

(declare-fun mapRest!48910 () (Array (_ BitVec 32) ValueCell!14954))

(declare-fun mapValue!48910 () ValueCell!14954)

(declare-fun mapKey!48910 () (_ BitVec 32))

(assert (=> mapNonEmpty!48910 (= (arr!38861 _values!914) (store mapRest!48910 mapKey!48910 mapValue!48910))))

(declare-fun b!1249718 () Bool)

(declare-fun tp_is_empty!31435 () Bool)

(assert (=> b!1249718 (= e!709256 tp_is_empty!31435)))

(declare-fun b!1249719 () Bool)

(declare-fun e!709253 () Bool)

(declare-fun e!709255 () Bool)

(assert (=> b!1249719 (= e!709253 (and e!709255 mapRes!48910))))

(declare-fun condMapEmpty!48910 () Bool)

(declare-fun mapDefault!48910 () ValueCell!14954)

(assert (=> b!1249719 (= condMapEmpty!48910 (= (arr!38861 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14954)) mapDefault!48910)))))

(declare-fun b!1249720 () Bool)

(declare-fun e!709254 () Bool)

(declare-datatypes ((array!80597 0))(
  ( (array!80598 (arr!38862 (Array (_ BitVec 32) (_ BitVec 64))) (size!39399 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80597)

(assert (=> b!1249720 (= e!709254 (bvsgt #b00000000000000000000000000000000 (size!39399 _keys!1118)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((tuple2!20346 0))(
  ( (tuple2!20347 (_1!10184 (_ BitVec 64)) (_2!10184 V!47279)) )
))
(declare-datatypes ((List!27602 0))(
  ( (Nil!27599) (Cons!27598 (h!28816 tuple2!20346) (t!41063 List!27602)) )
))
(declare-datatypes ((ListLongMap!18227 0))(
  ( (ListLongMap!18228 (toList!9129 List!27602)) )
))
(declare-fun lt!563888 () ListLongMap!18227)

(declare-fun zeroValue!871 () V!47279)

(declare-fun minValueBefore!43 () V!47279)

(declare-fun getCurrentListMapNoExtraKeys!5564 (array!80597 array!80595 (_ BitVec 32) (_ BitVec 32) V!47279 V!47279 (_ BitVec 32) Int) ListLongMap!18227)

(assert (=> b!1249720 (= lt!563888 (getCurrentListMapNoExtraKeys!5564 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249721 () Bool)

(declare-fun res!833414 () Bool)

(assert (=> b!1249721 (=> (not res!833414) (not e!709254))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249721 (= res!833414 (and (= (size!39398 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39399 _keys!1118) (size!39398 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48910 () Bool)

(assert (=> mapIsEmpty!48910 mapRes!48910))

(declare-fun res!833415 () Bool)

(assert (=> start!104940 (=> (not res!833415) (not e!709254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104940 (= res!833415 (validMask!0 mask!1466))))

(assert (=> start!104940 e!709254))

(assert (=> start!104940 true))

(assert (=> start!104940 tp!93085))

(assert (=> start!104940 tp_is_empty!31435))

(declare-fun array_inv!29769 (array!80597) Bool)

(assert (=> start!104940 (array_inv!29769 _keys!1118)))

(declare-fun array_inv!29770 (array!80595) Bool)

(assert (=> start!104940 (and (array_inv!29770 _values!914) e!709253)))

(declare-fun b!1249722 () Bool)

(declare-fun res!833413 () Bool)

(assert (=> b!1249722 (=> (not res!833413) (not e!709254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80597 (_ BitVec 32)) Bool)

(assert (=> b!1249722 (= res!833413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249723 () Bool)

(assert (=> b!1249723 (= e!709255 tp_is_empty!31435)))

(declare-fun b!1249724 () Bool)

(declare-fun res!833416 () Bool)

(assert (=> b!1249724 (=> (not res!833416) (not e!709254))))

(declare-datatypes ((List!27603 0))(
  ( (Nil!27600) (Cons!27599 (h!28817 (_ BitVec 64)) (t!41064 List!27603)) )
))
(declare-fun arrayNoDuplicates!0 (array!80597 (_ BitVec 32) List!27603) Bool)

(assert (=> b!1249724 (= res!833416 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27600))))

(assert (= (and start!104940 res!833415) b!1249721))

(assert (= (and b!1249721 res!833414) b!1249722))

(assert (= (and b!1249722 res!833413) b!1249724))

(assert (= (and b!1249724 res!833416) b!1249720))

(assert (= (and b!1249719 condMapEmpty!48910) mapIsEmpty!48910))

(assert (= (and b!1249719 (not condMapEmpty!48910)) mapNonEmpty!48910))

(get-info :version)

(assert (= (and mapNonEmpty!48910 ((_ is ValueCellFull!14954) mapValue!48910)) b!1249718))

(assert (= (and b!1249719 ((_ is ValueCellFull!14954) mapDefault!48910)) b!1249723))

(assert (= start!104940 b!1249719))

(declare-fun m!1151197 () Bool)

(assert (=> start!104940 m!1151197))

(declare-fun m!1151199 () Bool)

(assert (=> start!104940 m!1151199))

(declare-fun m!1151201 () Bool)

(assert (=> start!104940 m!1151201))

(declare-fun m!1151203 () Bool)

(assert (=> b!1249722 m!1151203))

(declare-fun m!1151205 () Bool)

(assert (=> b!1249720 m!1151205))

(declare-fun m!1151207 () Bool)

(assert (=> mapNonEmpty!48910 m!1151207))

(declare-fun m!1151209 () Bool)

(assert (=> b!1249724 m!1151209))

(check-sat (not start!104940) b_and!44299 (not b!1249724) (not mapNonEmpty!48910) (not b!1249720) (not b_next!26533) (not b!1249722) tp_is_empty!31435)
(check-sat b_and!44299 (not b_next!26533))
(get-model)

(declare-fun d!138261 () Bool)

(declare-fun res!833447 () Bool)

(declare-fun e!709296 () Bool)

(assert (=> d!138261 (=> res!833447 e!709296)))

(assert (=> d!138261 (= res!833447 (bvsge #b00000000000000000000000000000000 (size!39399 _keys!1118)))))

(assert (=> d!138261 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27600) e!709296)))

(declare-fun bm!61634 () Bool)

(declare-fun call!61637 () Bool)

(declare-fun c!122509 () Bool)

(assert (=> bm!61634 (= call!61637 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122509 (Cons!27599 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000) Nil!27600) Nil!27600)))))

(declare-fun b!1249777 () Bool)

(declare-fun e!709297 () Bool)

(declare-fun e!709295 () Bool)

(assert (=> b!1249777 (= e!709297 e!709295)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1249777 (= c!122509 (validKeyInArray!0 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249778 () Bool)

(assert (=> b!1249778 (= e!709296 e!709297)))

(declare-fun res!833448 () Bool)

(assert (=> b!1249778 (=> (not res!833448) (not e!709297))))

(declare-fun e!709298 () Bool)

(assert (=> b!1249778 (= res!833448 (not e!709298))))

(declare-fun res!833449 () Bool)

(assert (=> b!1249778 (=> (not res!833449) (not e!709298))))

(assert (=> b!1249778 (= res!833449 (validKeyInArray!0 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249779 () Bool)

(assert (=> b!1249779 (= e!709295 call!61637)))

(declare-fun b!1249780 () Bool)

(assert (=> b!1249780 (= e!709295 call!61637)))

(declare-fun b!1249781 () Bool)

(declare-fun contains!7501 (List!27603 (_ BitVec 64)) Bool)

(assert (=> b!1249781 (= e!709298 (contains!7501 Nil!27600 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138261 (not res!833447)) b!1249778))

(assert (= (and b!1249778 res!833449) b!1249781))

(assert (= (and b!1249778 res!833448) b!1249777))

(assert (= (and b!1249777 c!122509) b!1249779))

(assert (= (and b!1249777 (not c!122509)) b!1249780))

(assert (= (or b!1249779 b!1249780) bm!61634))

(declare-fun m!1151239 () Bool)

(assert (=> bm!61634 m!1151239))

(declare-fun m!1151241 () Bool)

(assert (=> bm!61634 m!1151241))

(assert (=> b!1249777 m!1151239))

(assert (=> b!1249777 m!1151239))

(declare-fun m!1151243 () Bool)

(assert (=> b!1249777 m!1151243))

(assert (=> b!1249778 m!1151239))

(assert (=> b!1249778 m!1151239))

(assert (=> b!1249778 m!1151243))

(assert (=> b!1249781 m!1151239))

(assert (=> b!1249781 m!1151239))

(declare-fun m!1151245 () Bool)

(assert (=> b!1249781 m!1151245))

(assert (=> b!1249724 d!138261))

(declare-fun b!1249806 () Bool)

(declare-fun e!709319 () Bool)

(declare-fun e!709313 () Bool)

(assert (=> b!1249806 (= e!709319 e!709313)))

(assert (=> b!1249806 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39399 _keys!1118)))))

(declare-fun res!833459 () Bool)

(declare-fun lt!563914 () ListLongMap!18227)

(declare-fun contains!7502 (ListLongMap!18227 (_ BitVec 64)) Bool)

(assert (=> b!1249806 (= res!833459 (contains!7502 lt!563914 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249806 (=> (not res!833459) (not e!709313))))

(declare-fun b!1249807 () Bool)

(declare-fun e!709314 () Bool)

(assert (=> b!1249807 (= e!709319 e!709314)))

(declare-fun c!122519 () Bool)

(assert (=> b!1249807 (= c!122519 (bvslt #b00000000000000000000000000000000 (size!39399 _keys!1118)))))

(declare-fun b!1249808 () Bool)

(declare-datatypes ((Unit!41448 0))(
  ( (Unit!41449) )
))
(declare-fun lt!563912 () Unit!41448)

(declare-fun lt!563915 () Unit!41448)

(assert (=> b!1249808 (= lt!563912 lt!563915)))

(declare-fun lt!563911 () (_ BitVec 64))

(declare-fun lt!563910 () (_ BitVec 64))

(declare-fun lt!563909 () ListLongMap!18227)

(declare-fun lt!563913 () V!47279)

(declare-fun +!4192 (ListLongMap!18227 tuple2!20346) ListLongMap!18227)

(assert (=> b!1249808 (not (contains!7502 (+!4192 lt!563909 (tuple2!20347 lt!563910 lt!563913)) lt!563911))))

(declare-fun addStillNotContains!309 (ListLongMap!18227 (_ BitVec 64) V!47279 (_ BitVec 64)) Unit!41448)

(assert (=> b!1249808 (= lt!563915 (addStillNotContains!309 lt!563909 lt!563910 lt!563913 lt!563911))))

(assert (=> b!1249808 (= lt!563911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!19993 (ValueCell!14954 V!47279) V!47279)

(declare-fun dynLambda!3440 (Int (_ BitVec 64)) V!47279)

(assert (=> b!1249808 (= lt!563913 (get!19993 (select (arr!38861 _values!914) #b00000000000000000000000000000000) (dynLambda!3440 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1249808 (= lt!563910 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61640 () ListLongMap!18227)

(assert (=> b!1249808 (= lt!563909 call!61640)))

(declare-fun e!709317 () ListLongMap!18227)

(assert (=> b!1249808 (= e!709317 (+!4192 call!61640 (tuple2!20347 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000) (get!19993 (select (arr!38861 _values!914) #b00000000000000000000000000000000) (dynLambda!3440 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1249809 () Bool)

(declare-fun isEmpty!1025 (ListLongMap!18227) Bool)

(assert (=> b!1249809 (= e!709314 (isEmpty!1025 lt!563914))))

(declare-fun bm!61637 () Bool)

(assert (=> bm!61637 (= call!61640 (getCurrentListMapNoExtraKeys!5564 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1249810 () Bool)

(declare-fun e!709315 () Bool)

(assert (=> b!1249810 (= e!709315 (validKeyInArray!0 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1249810 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138263 () Bool)

(declare-fun e!709318 () Bool)

(assert (=> d!138263 e!709318))

(declare-fun res!833460 () Bool)

(assert (=> d!138263 (=> (not res!833460) (not e!709318))))

(assert (=> d!138263 (= res!833460 (not (contains!7502 lt!563914 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!709316 () ListLongMap!18227)

(assert (=> d!138263 (= lt!563914 e!709316)))

(declare-fun c!122520 () Bool)

(assert (=> d!138263 (= c!122520 (bvsge #b00000000000000000000000000000000 (size!39399 _keys!1118)))))

(assert (=> d!138263 (validMask!0 mask!1466)))

(assert (=> d!138263 (= (getCurrentListMapNoExtraKeys!5564 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!563914)))

(declare-fun b!1249811 () Bool)

(assert (=> b!1249811 (= e!709314 (= lt!563914 (getCurrentListMapNoExtraKeys!5564 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1249812 () Bool)

(assert (=> b!1249812 (= e!709318 e!709319)))

(declare-fun c!122518 () Bool)

(assert (=> b!1249812 (= c!122518 e!709315)))

(declare-fun res!833461 () Bool)

(assert (=> b!1249812 (=> (not res!833461) (not e!709315))))

(assert (=> b!1249812 (= res!833461 (bvslt #b00000000000000000000000000000000 (size!39399 _keys!1118)))))

(declare-fun b!1249813 () Bool)

(assert (=> b!1249813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39399 _keys!1118)))))

(assert (=> b!1249813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39398 _values!914)))))

(declare-fun apply!988 (ListLongMap!18227 (_ BitVec 64)) V!47279)

(assert (=> b!1249813 (= e!709313 (= (apply!988 lt!563914 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000)) (get!19993 (select (arr!38861 _values!914) #b00000000000000000000000000000000) (dynLambda!3440 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1249814 () Bool)

(assert (=> b!1249814 (= e!709316 (ListLongMap!18228 Nil!27599))))

(declare-fun b!1249815 () Bool)

(assert (=> b!1249815 (= e!709317 call!61640)))

(declare-fun b!1249816 () Bool)

(declare-fun res!833458 () Bool)

(assert (=> b!1249816 (=> (not res!833458) (not e!709318))))

(assert (=> b!1249816 (= res!833458 (not (contains!7502 lt!563914 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1249817 () Bool)

(assert (=> b!1249817 (= e!709316 e!709317)))

(declare-fun c!122521 () Bool)

(assert (=> b!1249817 (= c!122521 (validKeyInArray!0 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138263 c!122520) b!1249814))

(assert (= (and d!138263 (not c!122520)) b!1249817))

(assert (= (and b!1249817 c!122521) b!1249808))

(assert (= (and b!1249817 (not c!122521)) b!1249815))

(assert (= (or b!1249808 b!1249815) bm!61637))

(assert (= (and d!138263 res!833460) b!1249816))

(assert (= (and b!1249816 res!833458) b!1249812))

(assert (= (and b!1249812 res!833461) b!1249810))

(assert (= (and b!1249812 c!122518) b!1249806))

(assert (= (and b!1249812 (not c!122518)) b!1249807))

(assert (= (and b!1249806 res!833459) b!1249813))

(assert (= (and b!1249807 c!122519) b!1249811))

(assert (= (and b!1249807 (not c!122519)) b!1249809))

(declare-fun b_lambda!22497 () Bool)

(assert (=> (not b_lambda!22497) (not b!1249808)))

(declare-fun t!41067 () Bool)

(declare-fun tb!11277 () Bool)

(assert (=> (and start!104940 (= defaultEntry!922 defaultEntry!922) t!41067) tb!11277))

(declare-fun result!23255 () Bool)

(assert (=> tb!11277 (= result!23255 tp_is_empty!31435)))

(assert (=> b!1249808 t!41067))

(declare-fun b_and!44305 () Bool)

(assert (= b_and!44299 (and (=> t!41067 result!23255) b_and!44305)))

(declare-fun b_lambda!22499 () Bool)

(assert (=> (not b_lambda!22499) (not b!1249813)))

(assert (=> b!1249813 t!41067))

(declare-fun b_and!44307 () Bool)

(assert (= b_and!44305 (and (=> t!41067 result!23255) b_and!44307)))

(declare-fun m!1151247 () Bool)

(assert (=> bm!61637 m!1151247))

(assert (=> b!1249813 m!1151239))

(declare-fun m!1151249 () Bool)

(assert (=> b!1249813 m!1151249))

(declare-fun m!1151251 () Bool)

(assert (=> b!1249813 m!1151251))

(declare-fun m!1151253 () Bool)

(assert (=> b!1249813 m!1151253))

(assert (=> b!1249813 m!1151249))

(assert (=> b!1249813 m!1151239))

(declare-fun m!1151255 () Bool)

(assert (=> b!1249813 m!1151255))

(assert (=> b!1249813 m!1151251))

(assert (=> b!1249810 m!1151239))

(assert (=> b!1249810 m!1151239))

(assert (=> b!1249810 m!1151243))

(assert (=> b!1249811 m!1151247))

(assert (=> b!1249806 m!1151239))

(assert (=> b!1249806 m!1151239))

(declare-fun m!1151257 () Bool)

(assert (=> b!1249806 m!1151257))

(declare-fun m!1151259 () Bool)

(assert (=> b!1249816 m!1151259))

(declare-fun m!1151261 () Bool)

(assert (=> d!138263 m!1151261))

(assert (=> d!138263 m!1151197))

(declare-fun m!1151263 () Bool)

(assert (=> b!1249808 m!1151263))

(assert (=> b!1249808 m!1151239))

(declare-fun m!1151265 () Bool)

(assert (=> b!1249808 m!1151265))

(assert (=> b!1249808 m!1151249))

(assert (=> b!1249808 m!1151251))

(declare-fun m!1151267 () Bool)

(assert (=> b!1249808 m!1151267))

(assert (=> b!1249808 m!1151249))

(assert (=> b!1249808 m!1151251))

(assert (=> b!1249808 m!1151253))

(assert (=> b!1249808 m!1151265))

(declare-fun m!1151269 () Bool)

(assert (=> b!1249808 m!1151269))

(assert (=> b!1249817 m!1151239))

(assert (=> b!1249817 m!1151239))

(assert (=> b!1249817 m!1151243))

(declare-fun m!1151271 () Bool)

(assert (=> b!1249809 m!1151271))

(assert (=> b!1249720 d!138263))

(declare-fun b!1249828 () Bool)

(declare-fun e!709327 () Bool)

(declare-fun call!61643 () Bool)

(assert (=> b!1249828 (= e!709327 call!61643)))

(declare-fun b!1249829 () Bool)

(declare-fun e!709328 () Bool)

(declare-fun e!709326 () Bool)

(assert (=> b!1249829 (= e!709328 e!709326)))

(declare-fun c!122524 () Bool)

(assert (=> b!1249829 (= c!122524 (validKeyInArray!0 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138265 () Bool)

(declare-fun res!833466 () Bool)

(assert (=> d!138265 (=> res!833466 e!709328)))

(assert (=> d!138265 (= res!833466 (bvsge #b00000000000000000000000000000000 (size!39399 _keys!1118)))))

(assert (=> d!138265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!709328)))

(declare-fun b!1249830 () Bool)

(assert (=> b!1249830 (= e!709326 e!709327)))

(declare-fun lt!563923 () (_ BitVec 64))

(assert (=> b!1249830 (= lt!563923 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!563924 () Unit!41448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80597 (_ BitVec 64) (_ BitVec 32)) Unit!41448)

(assert (=> b!1249830 (= lt!563924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563923 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1249830 (arrayContainsKey!0 _keys!1118 lt!563923 #b00000000000000000000000000000000)))

(declare-fun lt!563922 () Unit!41448)

(assert (=> b!1249830 (= lt!563922 lt!563924)))

(declare-fun res!833467 () Bool)

(declare-datatypes ((SeekEntryResult!9913 0))(
  ( (MissingZero!9913 (index!42023 (_ BitVec 32))) (Found!9913 (index!42024 (_ BitVec 32))) (Intermediate!9913 (undefined!10725 Bool) (index!42025 (_ BitVec 32)) (x!109743 (_ BitVec 32))) (Undefined!9913) (MissingVacant!9913 (index!42026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80597 (_ BitVec 32)) SeekEntryResult!9913)

(assert (=> b!1249830 (= res!833467 (= (seekEntryOrOpen!0 (select (arr!38862 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9913 #b00000000000000000000000000000000)))))

(assert (=> b!1249830 (=> (not res!833467) (not e!709327))))

(declare-fun bm!61640 () Bool)

(assert (=> bm!61640 (= call!61643 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1249831 () Bool)

(assert (=> b!1249831 (= e!709326 call!61643)))

(assert (= (and d!138265 (not res!833466)) b!1249829))

(assert (= (and b!1249829 c!122524) b!1249830))

(assert (= (and b!1249829 (not c!122524)) b!1249831))

(assert (= (and b!1249830 res!833467) b!1249828))

(assert (= (or b!1249828 b!1249831) bm!61640))

(assert (=> b!1249829 m!1151239))

(assert (=> b!1249829 m!1151239))

(assert (=> b!1249829 m!1151243))

(assert (=> b!1249830 m!1151239))

(declare-fun m!1151273 () Bool)

(assert (=> b!1249830 m!1151273))

(declare-fun m!1151275 () Bool)

(assert (=> b!1249830 m!1151275))

(assert (=> b!1249830 m!1151239))

(declare-fun m!1151277 () Bool)

(assert (=> b!1249830 m!1151277))

(declare-fun m!1151279 () Bool)

(assert (=> bm!61640 m!1151279))

(assert (=> b!1249722 d!138265))

(declare-fun d!138267 () Bool)

(assert (=> d!138267 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104940 d!138267))

(declare-fun d!138269 () Bool)

(assert (=> d!138269 (= (array_inv!29769 _keys!1118) (bvsge (size!39399 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104940 d!138269))

(declare-fun d!138271 () Bool)

(assert (=> d!138271 (= (array_inv!29770 _values!914) (bvsge (size!39398 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104940 d!138271))

(declare-fun condMapEmpty!48919 () Bool)

(declare-fun mapDefault!48919 () ValueCell!14954)

(assert (=> mapNonEmpty!48910 (= condMapEmpty!48919 (= mapRest!48910 ((as const (Array (_ BitVec 32) ValueCell!14954)) mapDefault!48919)))))

(declare-fun e!709334 () Bool)

(declare-fun mapRes!48919 () Bool)

(assert (=> mapNonEmpty!48910 (= tp!93086 (and e!709334 mapRes!48919))))

(declare-fun b!1249839 () Bool)

(assert (=> b!1249839 (= e!709334 tp_is_empty!31435)))

(declare-fun b!1249838 () Bool)

(declare-fun e!709333 () Bool)

(assert (=> b!1249838 (= e!709333 tp_is_empty!31435)))

(declare-fun mapNonEmpty!48919 () Bool)

(declare-fun tp!93101 () Bool)

(assert (=> mapNonEmpty!48919 (= mapRes!48919 (and tp!93101 e!709333))))

(declare-fun mapValue!48919 () ValueCell!14954)

(declare-fun mapRest!48919 () (Array (_ BitVec 32) ValueCell!14954))

(declare-fun mapKey!48919 () (_ BitVec 32))

(assert (=> mapNonEmpty!48919 (= mapRest!48910 (store mapRest!48919 mapKey!48919 mapValue!48919))))

(declare-fun mapIsEmpty!48919 () Bool)

(assert (=> mapIsEmpty!48919 mapRes!48919))

(assert (= (and mapNonEmpty!48910 condMapEmpty!48919) mapIsEmpty!48919))

(assert (= (and mapNonEmpty!48910 (not condMapEmpty!48919)) mapNonEmpty!48919))

(assert (= (and mapNonEmpty!48919 ((_ is ValueCellFull!14954) mapValue!48919)) b!1249838))

(assert (= (and mapNonEmpty!48910 ((_ is ValueCellFull!14954) mapDefault!48919)) b!1249839))

(declare-fun m!1151281 () Bool)

(assert (=> mapNonEmpty!48919 m!1151281))

(declare-fun b_lambda!22501 () Bool)

(assert (= b_lambda!22497 (or (and start!104940 b_free!26533) b_lambda!22501)))

(declare-fun b_lambda!22503 () Bool)

(assert (= b_lambda!22499 (or (and start!104940 b_free!26533) b_lambda!22503)))

(check-sat (not b!1249813) (not b!1249829) (not b_lambda!22501) (not b!1249830) (not b!1249806) (not b!1249809) (not bm!61640) (not mapNonEmpty!48919) b_and!44307 tp_is_empty!31435 (not b!1249777) (not b!1249817) (not b!1249816) (not b!1249810) (not b!1249811) (not b!1249781) (not b!1249808) (not bm!61634) (not b!1249778) (not bm!61637) (not b_lambda!22503) (not d!138263) (not b_next!26533))
(check-sat b_and!44307 (not b_next!26533))
