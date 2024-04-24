; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41790 () Bool)

(assert start!41790)

(declare-fun b_free!11425 () Bool)

(declare-fun b_next!11425 () Bool)

(assert (=> start!41790 (= b_free!11425 (not b_next!11425))))

(declare-fun tp!40282 () Bool)

(declare-fun b_and!19803 () Bool)

(assert (=> start!41790 (= tp!40282 b_and!19803)))

(declare-fun b!466759 () Bool)

(declare-fun res!279039 () Bool)

(declare-fun e!272971 () Bool)

(assert (=> b!466759 (=> (not res!279039) (not e!272971))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29476 0))(
  ( (array!29477 (arr!14166 (Array (_ BitVec 32) (_ BitVec 64))) (size!14518 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29476)

(declare-datatypes ((V!18243 0))(
  ( (V!18244 (val!6471 Int)) )
))
(declare-datatypes ((ValueCell!6083 0))(
  ( (ValueCellFull!6083 (v!8760 V!18243)) (EmptyCell!6083) )
))
(declare-datatypes ((array!29478 0))(
  ( (array!29479 (arr!14167 (Array (_ BitVec 32) ValueCell!6083)) (size!14519 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29478)

(assert (=> b!466759 (= res!279039 (and (= (size!14519 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14518 _keys!1025) (size!14519 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466760 () Bool)

(declare-fun res!279035 () Bool)

(declare-fun e!272974 () Bool)

(assert (=> b!466760 (=> res!279035 e!272974)))

(declare-fun minValueBefore!38 () V!18243)

(declare-fun zeroValue!794 () V!18243)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18243)

(declare-datatypes ((tuple2!8424 0))(
  ( (tuple2!8425 (_1!4223 (_ BitVec 64)) (_2!4223 V!18243)) )
))
(declare-datatypes ((List!8504 0))(
  ( (Nil!8501) (Cons!8500 (h!9356 tuple2!8424) (t!14448 List!8504)) )
))
(declare-datatypes ((ListLongMap!7339 0))(
  ( (ListLongMap!7340 (toList!3685 List!8504)) )
))
(declare-fun +!1682 (ListLongMap!7339 tuple2!8424) ListLongMap!7339)

(declare-fun getCurrentListMap!2133 (array!29476 array!29478 (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 (_ BitVec 32) Int) ListLongMap!7339)

(assert (=> b!466760 (= res!279035 (not (= (+!1682 (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))))

(declare-fun b!466761 () Bool)

(declare-fun e!272973 () Bool)

(declare-fun e!272972 () Bool)

(declare-fun mapRes!20965 () Bool)

(assert (=> b!466761 (= e!272973 (and e!272972 mapRes!20965))))

(declare-fun condMapEmpty!20965 () Bool)

(declare-fun mapDefault!20965 () ValueCell!6083)

(assert (=> b!466761 (= condMapEmpty!20965 (= (arr!14167 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6083)) mapDefault!20965)))))

(declare-fun b!466762 () Bool)

(declare-fun res!279036 () Bool)

(assert (=> b!466762 (=> (not res!279036) (not e!272971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29476 (_ BitVec 32)) Bool)

(assert (=> b!466762 (= res!279036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466763 () Bool)

(assert (=> b!466763 (= e!272974 (bvsle #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466764 () Bool)

(declare-fun e!272970 () Bool)

(declare-fun tp_is_empty!12853 () Bool)

(assert (=> b!466764 (= e!272970 tp_is_empty!12853)))

(declare-fun b!466765 () Bool)

(assert (=> b!466765 (= e!272971 (not e!272974))))

(declare-fun res!279038 () Bool)

(assert (=> b!466765 (=> res!279038 e!272974)))

(assert (=> b!466765 (= res!279038 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!211036 () ListLongMap!7339)

(declare-fun lt!211037 () ListLongMap!7339)

(assert (=> b!466765 (= lt!211036 lt!211037)))

(declare-datatypes ((Unit!13582 0))(
  ( (Unit!13583) )
))
(declare-fun lt!211038 () Unit!13582)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!68 (array!29476 array!29478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 V!18243 V!18243 (_ BitVec 32) Int) Unit!13582)

(assert (=> b!466765 (= lt!211038 (lemmaNoChangeToArrayThenSameMapNoExtras!68 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1908 (array!29476 array!29478 (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 (_ BitVec 32) Int) ListLongMap!7339)

(assert (=> b!466765 (= lt!211037 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466765 (= lt!211036 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466766 () Bool)

(declare-fun res!279037 () Bool)

(assert (=> b!466766 (=> (not res!279037) (not e!272971))))

(declare-datatypes ((List!8505 0))(
  ( (Nil!8502) (Cons!8501 (h!9357 (_ BitVec 64)) (t!14449 List!8505)) )
))
(declare-fun arrayNoDuplicates!0 (array!29476 (_ BitVec 32) List!8505) Bool)

(assert (=> b!466766 (= res!279037 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8502))))

(declare-fun b!466767 () Bool)

(assert (=> b!466767 (= e!272972 tp_is_empty!12853)))

(declare-fun mapIsEmpty!20965 () Bool)

(assert (=> mapIsEmpty!20965 mapRes!20965))

(declare-fun mapNonEmpty!20965 () Bool)

(declare-fun tp!40281 () Bool)

(assert (=> mapNonEmpty!20965 (= mapRes!20965 (and tp!40281 e!272970))))

(declare-fun mapKey!20965 () (_ BitVec 32))

(declare-fun mapValue!20965 () ValueCell!6083)

(declare-fun mapRest!20965 () (Array (_ BitVec 32) ValueCell!6083))

(assert (=> mapNonEmpty!20965 (= (arr!14167 _values!833) (store mapRest!20965 mapKey!20965 mapValue!20965))))

(declare-fun res!279040 () Bool)

(assert (=> start!41790 (=> (not res!279040) (not e!272971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41790 (= res!279040 (validMask!0 mask!1365))))

(assert (=> start!41790 e!272971))

(assert (=> start!41790 tp_is_empty!12853))

(assert (=> start!41790 tp!40282))

(assert (=> start!41790 true))

(declare-fun array_inv!10312 (array!29476) Bool)

(assert (=> start!41790 (array_inv!10312 _keys!1025)))

(declare-fun array_inv!10313 (array!29478) Bool)

(assert (=> start!41790 (and (array_inv!10313 _values!833) e!272973)))

(assert (= (and start!41790 res!279040) b!466759))

(assert (= (and b!466759 res!279039) b!466762))

(assert (= (and b!466762 res!279036) b!466766))

(assert (= (and b!466766 res!279037) b!466765))

(assert (= (and b!466765 (not res!279038)) b!466760))

(assert (= (and b!466760 (not res!279035)) b!466763))

(assert (= (and b!466761 condMapEmpty!20965) mapIsEmpty!20965))

(assert (= (and b!466761 (not condMapEmpty!20965)) mapNonEmpty!20965))

(get-info :version)

(assert (= (and mapNonEmpty!20965 ((_ is ValueCellFull!6083) mapValue!20965)) b!466764))

(assert (= (and b!466761 ((_ is ValueCellFull!6083) mapDefault!20965)) b!466767))

(assert (= start!41790 b!466761))

(declare-fun m!449217 () Bool)

(assert (=> start!41790 m!449217))

(declare-fun m!449219 () Bool)

(assert (=> start!41790 m!449219))

(declare-fun m!449221 () Bool)

(assert (=> start!41790 m!449221))

(declare-fun m!449223 () Bool)

(assert (=> b!466760 m!449223))

(assert (=> b!466760 m!449223))

(declare-fun m!449225 () Bool)

(assert (=> b!466760 m!449225))

(declare-fun m!449227 () Bool)

(assert (=> b!466760 m!449227))

(declare-fun m!449229 () Bool)

(assert (=> b!466762 m!449229))

(declare-fun m!449231 () Bool)

(assert (=> mapNonEmpty!20965 m!449231))

(declare-fun m!449233 () Bool)

(assert (=> b!466766 m!449233))

(declare-fun m!449235 () Bool)

(assert (=> b!466765 m!449235))

(declare-fun m!449237 () Bool)

(assert (=> b!466765 m!449237))

(declare-fun m!449239 () Bool)

(assert (=> b!466765 m!449239))

(check-sat (not b!466766) tp_is_empty!12853 (not b_next!11425) (not start!41790) (not b!466762) (not mapNonEmpty!20965) (not b!466765) (not b!466760) b_and!19803)
(check-sat b_and!19803 (not b_next!11425))
(get-model)

(declare-fun d!75191 () Bool)

(assert (=> d!75191 (= (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211059 () Unit!13582)

(declare-fun choose!1347 (array!29476 array!29478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18243 V!18243 V!18243 V!18243 (_ BitVec 32) Int) Unit!13582)

(assert (=> d!75191 (= lt!211059 (choose!1347 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75191 (validMask!0 mask!1365)))

(assert (=> d!75191 (= (lemmaNoChangeToArrayThenSameMapNoExtras!68 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211059)))

(declare-fun bs!14794 () Bool)

(assert (= bs!14794 d!75191))

(assert (=> bs!14794 m!449239))

(assert (=> bs!14794 m!449237))

(declare-fun m!449289 () Bool)

(assert (=> bs!14794 m!449289))

(assert (=> bs!14794 m!449217))

(assert (=> b!466765 d!75191))

(declare-fun b!466846 () Bool)

(declare-fun e!273028 () Bool)

(declare-fun lt!211074 () ListLongMap!7339)

(declare-fun isEmpty!576 (ListLongMap!7339) Bool)

(assert (=> b!466846 (= e!273028 (isEmpty!576 lt!211074))))

(declare-fun b!466847 () Bool)

(declare-fun lt!211075 () Unit!13582)

(declare-fun lt!211076 () Unit!13582)

(assert (=> b!466847 (= lt!211075 lt!211076)))

(declare-fun lt!211077 () ListLongMap!7339)

(declare-fun lt!211080 () (_ BitVec 64))

(declare-fun lt!211078 () V!18243)

(declare-fun lt!211079 () (_ BitVec 64))

(declare-fun contains!2508 (ListLongMap!7339 (_ BitVec 64)) Bool)

(assert (=> b!466847 (not (contains!2508 (+!1682 lt!211077 (tuple2!8425 lt!211080 lt!211078)) lt!211079))))

(declare-fun addStillNotContains!158 (ListLongMap!7339 (_ BitVec 64) V!18243 (_ BitVec 64)) Unit!13582)

(assert (=> b!466847 (= lt!211076 (addStillNotContains!158 lt!211077 lt!211080 lt!211078 lt!211079))))

(assert (=> b!466847 (= lt!211079 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6947 (ValueCell!6083 V!18243) V!18243)

(declare-fun dynLambda!913 (Int (_ BitVec 64)) V!18243)

(assert (=> b!466847 (= lt!211078 (get!6947 (select (arr!14167 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466847 (= lt!211080 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30265 () ListLongMap!7339)

(assert (=> b!466847 (= lt!211077 call!30265)))

(declare-fun e!273026 () ListLongMap!7339)

(assert (=> b!466847 (= e!273026 (+!1682 call!30265 (tuple2!8425 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000) (get!6947 (select (arr!14167 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!466848 () Bool)

(assert (=> b!466848 (= e!273028 (= lt!211074 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30262 () Bool)

(assert (=> bm!30262 (= call!30265 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466849 () Bool)

(declare-fun e!273031 () Bool)

(declare-fun e!273025 () Bool)

(assert (=> b!466849 (= e!273031 e!273025)))

(declare-fun c!56725 () Bool)

(declare-fun e!273030 () Bool)

(assert (=> b!466849 (= c!56725 e!273030)))

(declare-fun res!279088 () Bool)

(assert (=> b!466849 (=> (not res!279088) (not e!273030))))

(assert (=> b!466849 (= res!279088 (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466850 () Bool)

(declare-fun e!273029 () ListLongMap!7339)

(assert (=> b!466850 (= e!273029 e!273026)))

(declare-fun c!56727 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!466850 (= c!56727 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466851 () Bool)

(declare-fun res!279085 () Bool)

(assert (=> b!466851 (=> (not res!279085) (not e!273031))))

(assert (=> b!466851 (= res!279085 (not (contains!2508 lt!211074 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75193 () Bool)

(assert (=> d!75193 e!273031))

(declare-fun res!279087 () Bool)

(assert (=> d!75193 (=> (not res!279087) (not e!273031))))

(assert (=> d!75193 (= res!279087 (not (contains!2508 lt!211074 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75193 (= lt!211074 e!273029)))

(declare-fun c!56724 () Bool)

(assert (=> d!75193 (= c!56724 (bvsge #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(assert (=> d!75193 (validMask!0 mask!1365)))

(assert (=> d!75193 (= (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211074)))

(declare-fun b!466852 () Bool)

(assert (=> b!466852 (= e!273029 (ListLongMap!7340 Nil!8501))))

(declare-fun b!466853 () Bool)

(assert (=> b!466853 (= e!273025 e!273028)))

(declare-fun c!56726 () Bool)

(assert (=> b!466853 (= c!56726 (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466854 () Bool)

(assert (=> b!466854 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(assert (=> b!466854 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14519 _values!833)))))

(declare-fun e!273027 () Bool)

(declare-fun apply!323 (ListLongMap!7339 (_ BitVec 64)) V!18243)

(assert (=> b!466854 (= e!273027 (= (apply!323 lt!211074 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)) (get!6947 (select (arr!14167 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!466855 () Bool)

(assert (=> b!466855 (= e!273026 call!30265)))

(declare-fun b!466856 () Bool)

(assert (=> b!466856 (= e!273030 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466856 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!466857 () Bool)

(assert (=> b!466857 (= e!273025 e!273027)))

(assert (=> b!466857 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun res!279086 () Bool)

(assert (=> b!466857 (= res!279086 (contains!2508 lt!211074 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466857 (=> (not res!279086) (not e!273027))))

(assert (= (and d!75193 c!56724) b!466852))

(assert (= (and d!75193 (not c!56724)) b!466850))

(assert (= (and b!466850 c!56727) b!466847))

(assert (= (and b!466850 (not c!56727)) b!466855))

(assert (= (or b!466847 b!466855) bm!30262))

(assert (= (and d!75193 res!279087) b!466851))

(assert (= (and b!466851 res!279085) b!466849))

(assert (= (and b!466849 res!279088) b!466856))

(assert (= (and b!466849 c!56725) b!466857))

(assert (= (and b!466849 (not c!56725)) b!466853))

(assert (= (and b!466857 res!279086) b!466854))

(assert (= (and b!466853 c!56726) b!466848))

(assert (= (and b!466853 (not c!56726)) b!466846))

(declare-fun b_lambda!10043 () Bool)

(assert (=> (not b_lambda!10043) (not b!466847)))

(declare-fun t!14454 () Bool)

(declare-fun tb!3903 () Bool)

(assert (=> (and start!41790 (= defaultEntry!841 defaultEntry!841) t!14454) tb!3903))

(declare-fun result!7383 () Bool)

(assert (=> tb!3903 (= result!7383 tp_is_empty!12853)))

(assert (=> b!466847 t!14454))

(declare-fun b_and!19809 () Bool)

(assert (= b_and!19803 (and (=> t!14454 result!7383) b_and!19809)))

(declare-fun b_lambda!10045 () Bool)

(assert (=> (not b_lambda!10045) (not b!466854)))

(assert (=> b!466854 t!14454))

(declare-fun b_and!19811 () Bool)

(assert (= b_and!19809 (and (=> t!14454 result!7383) b_and!19811)))

(declare-fun m!449291 () Bool)

(assert (=> d!75193 m!449291))

(assert (=> d!75193 m!449217))

(declare-fun m!449293 () Bool)

(assert (=> b!466851 m!449293))

(declare-fun m!449295 () Bool)

(assert (=> b!466856 m!449295))

(assert (=> b!466856 m!449295))

(declare-fun m!449297 () Bool)

(assert (=> b!466856 m!449297))

(declare-fun m!449299 () Bool)

(assert (=> b!466846 m!449299))

(assert (=> b!466850 m!449295))

(assert (=> b!466850 m!449295))

(assert (=> b!466850 m!449297))

(assert (=> b!466857 m!449295))

(assert (=> b!466857 m!449295))

(declare-fun m!449301 () Bool)

(assert (=> b!466857 m!449301))

(declare-fun m!449303 () Bool)

(assert (=> b!466848 m!449303))

(assert (=> bm!30262 m!449303))

(assert (=> b!466854 m!449295))

(declare-fun m!449305 () Bool)

(assert (=> b!466854 m!449305))

(declare-fun m!449307 () Bool)

(assert (=> b!466854 m!449307))

(declare-fun m!449309 () Bool)

(assert (=> b!466854 m!449309))

(assert (=> b!466854 m!449295))

(assert (=> b!466854 m!449307))

(assert (=> b!466854 m!449309))

(declare-fun m!449311 () Bool)

(assert (=> b!466854 m!449311))

(assert (=> b!466847 m!449307))

(assert (=> b!466847 m!449309))

(declare-fun m!449313 () Bool)

(assert (=> b!466847 m!449313))

(declare-fun m!449315 () Bool)

(assert (=> b!466847 m!449315))

(declare-fun m!449317 () Bool)

(assert (=> b!466847 m!449317))

(assert (=> b!466847 m!449313))

(assert (=> b!466847 m!449295))

(assert (=> b!466847 m!449307))

(assert (=> b!466847 m!449309))

(assert (=> b!466847 m!449311))

(declare-fun m!449319 () Bool)

(assert (=> b!466847 m!449319))

(assert (=> b!466765 d!75193))

(declare-fun b!466860 () Bool)

(declare-fun e!273035 () Bool)

(declare-fun lt!211081 () ListLongMap!7339)

(assert (=> b!466860 (= e!273035 (isEmpty!576 lt!211081))))

(declare-fun b!466861 () Bool)

(declare-fun lt!211082 () Unit!13582)

(declare-fun lt!211083 () Unit!13582)

(assert (=> b!466861 (= lt!211082 lt!211083)))

(declare-fun lt!211085 () V!18243)

(declare-fun lt!211084 () ListLongMap!7339)

(declare-fun lt!211087 () (_ BitVec 64))

(declare-fun lt!211086 () (_ BitVec 64))

(assert (=> b!466861 (not (contains!2508 (+!1682 lt!211084 (tuple2!8425 lt!211087 lt!211085)) lt!211086))))

(assert (=> b!466861 (= lt!211083 (addStillNotContains!158 lt!211084 lt!211087 lt!211085 lt!211086))))

(assert (=> b!466861 (= lt!211086 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!466861 (= lt!211085 (get!6947 (select (arr!14167 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!466861 (= lt!211087 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30266 () ListLongMap!7339)

(assert (=> b!466861 (= lt!211084 call!30266)))

(declare-fun e!273033 () ListLongMap!7339)

(assert (=> b!466861 (= e!273033 (+!1682 call!30266 (tuple2!8425 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000) (get!6947 (select (arr!14167 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!466862 () Bool)

(assert (=> b!466862 (= e!273035 (= lt!211081 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30263 () Bool)

(assert (=> bm!30263 (= call!30266 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!466863 () Bool)

(declare-fun e!273038 () Bool)

(declare-fun e!273032 () Bool)

(assert (=> b!466863 (= e!273038 e!273032)))

(declare-fun c!56729 () Bool)

(declare-fun e!273037 () Bool)

(assert (=> b!466863 (= c!56729 e!273037)))

(declare-fun res!279092 () Bool)

(assert (=> b!466863 (=> (not res!279092) (not e!273037))))

(assert (=> b!466863 (= res!279092 (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466864 () Bool)

(declare-fun e!273036 () ListLongMap!7339)

(assert (=> b!466864 (= e!273036 e!273033)))

(declare-fun c!56731 () Bool)

(assert (=> b!466864 (= c!56731 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466865 () Bool)

(declare-fun res!279089 () Bool)

(assert (=> b!466865 (=> (not res!279089) (not e!273038))))

(assert (=> b!466865 (= res!279089 (not (contains!2508 lt!211081 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75195 () Bool)

(assert (=> d!75195 e!273038))

(declare-fun res!279091 () Bool)

(assert (=> d!75195 (=> (not res!279091) (not e!273038))))

(assert (=> d!75195 (= res!279091 (not (contains!2508 lt!211081 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75195 (= lt!211081 e!273036)))

(declare-fun c!56728 () Bool)

(assert (=> d!75195 (= c!56728 (bvsge #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(assert (=> d!75195 (validMask!0 mask!1365)))

(assert (=> d!75195 (= (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211081)))

(declare-fun b!466866 () Bool)

(assert (=> b!466866 (= e!273036 (ListLongMap!7340 Nil!8501))))

(declare-fun b!466867 () Bool)

(assert (=> b!466867 (= e!273032 e!273035)))

(declare-fun c!56730 () Bool)

(assert (=> b!466867 (= c!56730 (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466868 () Bool)

(assert (=> b!466868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(assert (=> b!466868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14519 _values!833)))))

(declare-fun e!273034 () Bool)

(assert (=> b!466868 (= e!273034 (= (apply!323 lt!211081 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)) (get!6947 (select (arr!14167 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!466869 () Bool)

(assert (=> b!466869 (= e!273033 call!30266)))

(declare-fun b!466870 () Bool)

(assert (=> b!466870 (= e!273037 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466870 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!466871 () Bool)

(assert (=> b!466871 (= e!273032 e!273034)))

(assert (=> b!466871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun res!279090 () Bool)

(assert (=> b!466871 (= res!279090 (contains!2508 lt!211081 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466871 (=> (not res!279090) (not e!273034))))

(assert (= (and d!75195 c!56728) b!466866))

(assert (= (and d!75195 (not c!56728)) b!466864))

(assert (= (and b!466864 c!56731) b!466861))

(assert (= (and b!466864 (not c!56731)) b!466869))

(assert (= (or b!466861 b!466869) bm!30263))

(assert (= (and d!75195 res!279091) b!466865))

(assert (= (and b!466865 res!279089) b!466863))

(assert (= (and b!466863 res!279092) b!466870))

(assert (= (and b!466863 c!56729) b!466871))

(assert (= (and b!466863 (not c!56729)) b!466867))

(assert (= (and b!466871 res!279090) b!466868))

(assert (= (and b!466867 c!56730) b!466862))

(assert (= (and b!466867 (not c!56730)) b!466860))

(declare-fun b_lambda!10047 () Bool)

(assert (=> (not b_lambda!10047) (not b!466861)))

(assert (=> b!466861 t!14454))

(declare-fun b_and!19813 () Bool)

(assert (= b_and!19811 (and (=> t!14454 result!7383) b_and!19813)))

(declare-fun b_lambda!10049 () Bool)

(assert (=> (not b_lambda!10049) (not b!466868)))

(assert (=> b!466868 t!14454))

(declare-fun b_and!19815 () Bool)

(assert (= b_and!19813 (and (=> t!14454 result!7383) b_and!19815)))

(declare-fun m!449321 () Bool)

(assert (=> d!75195 m!449321))

(assert (=> d!75195 m!449217))

(declare-fun m!449323 () Bool)

(assert (=> b!466865 m!449323))

(assert (=> b!466870 m!449295))

(assert (=> b!466870 m!449295))

(assert (=> b!466870 m!449297))

(declare-fun m!449325 () Bool)

(assert (=> b!466860 m!449325))

(assert (=> b!466864 m!449295))

(assert (=> b!466864 m!449295))

(assert (=> b!466864 m!449297))

(assert (=> b!466871 m!449295))

(assert (=> b!466871 m!449295))

(declare-fun m!449327 () Bool)

(assert (=> b!466871 m!449327))

(declare-fun m!449329 () Bool)

(assert (=> b!466862 m!449329))

(assert (=> bm!30263 m!449329))

(assert (=> b!466868 m!449295))

(declare-fun m!449331 () Bool)

(assert (=> b!466868 m!449331))

(assert (=> b!466868 m!449307))

(assert (=> b!466868 m!449309))

(assert (=> b!466868 m!449295))

(assert (=> b!466868 m!449307))

(assert (=> b!466868 m!449309))

(assert (=> b!466868 m!449311))

(assert (=> b!466861 m!449307))

(assert (=> b!466861 m!449309))

(declare-fun m!449333 () Bool)

(assert (=> b!466861 m!449333))

(declare-fun m!449335 () Bool)

(assert (=> b!466861 m!449335))

(declare-fun m!449337 () Bool)

(assert (=> b!466861 m!449337))

(assert (=> b!466861 m!449333))

(assert (=> b!466861 m!449295))

(assert (=> b!466861 m!449307))

(assert (=> b!466861 m!449309))

(assert (=> b!466861 m!449311))

(declare-fun m!449339 () Bool)

(assert (=> b!466861 m!449339))

(assert (=> b!466765 d!75195))

(declare-fun d!75197 () Bool)

(declare-fun e!273041 () Bool)

(assert (=> d!75197 e!273041))

(declare-fun res!279097 () Bool)

(assert (=> d!75197 (=> (not res!279097) (not e!273041))))

(declare-fun lt!211098 () ListLongMap!7339)

(assert (=> d!75197 (= res!279097 (contains!2508 lt!211098 (_1!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!211096 () List!8504)

(assert (=> d!75197 (= lt!211098 (ListLongMap!7340 lt!211096))))

(declare-fun lt!211097 () Unit!13582)

(declare-fun lt!211099 () Unit!13582)

(assert (=> d!75197 (= lt!211097 lt!211099)))

(declare-datatypes ((Option!384 0))(
  ( (Some!383 (v!8763 V!18243)) (None!382) )
))
(declare-fun getValueByKey!378 (List!8504 (_ BitVec 64)) Option!384)

(assert (=> d!75197 (= (getValueByKey!378 lt!211096 (_1!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!383 (_2!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!200 (List!8504 (_ BitVec 64) V!18243) Unit!13582)

(assert (=> d!75197 (= lt!211099 (lemmaContainsTupThenGetReturnValue!200 lt!211096 (_1!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!203 (List!8504 (_ BitVec 64) V!18243) List!8504)

(assert (=> d!75197 (= lt!211096 (insertStrictlySorted!203 (toList!3685 (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75197 (= (+!1682 (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!211098)))

(declare-fun b!466876 () Bool)

(declare-fun res!279098 () Bool)

(assert (=> b!466876 (=> (not res!279098) (not e!273041))))

(assert (=> b!466876 (= res!279098 (= (getValueByKey!378 (toList!3685 lt!211098) (_1!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!383 (_2!4223 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!466877 () Bool)

(declare-fun contains!2509 (List!8504 tuple2!8424) Bool)

(assert (=> b!466877 (= e!273041 (contains!2509 (toList!3685 lt!211098) (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75197 res!279097) b!466876))

(assert (= (and b!466876 res!279098) b!466877))

(declare-fun m!449341 () Bool)

(assert (=> d!75197 m!449341))

(declare-fun m!449343 () Bool)

(assert (=> d!75197 m!449343))

(declare-fun m!449345 () Bool)

(assert (=> d!75197 m!449345))

(declare-fun m!449347 () Bool)

(assert (=> d!75197 m!449347))

(declare-fun m!449349 () Bool)

(assert (=> b!466876 m!449349))

(declare-fun m!449351 () Bool)

(assert (=> b!466877 m!449351))

(assert (=> b!466760 d!75197))

(declare-fun bm!30278 () Bool)

(declare-fun call!30287 () ListLongMap!7339)

(declare-fun call!30284 () ListLongMap!7339)

(assert (=> bm!30278 (= call!30287 call!30284)))

(declare-fun call!30286 () ListLongMap!7339)

(declare-fun bm!30279 () Bool)

(assert (=> bm!30279 (= call!30286 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30280 () Bool)

(declare-fun call!30283 () ListLongMap!7339)

(assert (=> bm!30280 (= call!30283 call!30286)))

(declare-fun bm!30281 () Bool)

(declare-fun call!30285 () Bool)

(declare-fun lt!211149 () ListLongMap!7339)

(assert (=> bm!30281 (= call!30285 (contains!2508 lt!211149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!75199 () Bool)

(declare-fun e!273077 () Bool)

(assert (=> d!75199 e!273077))

(declare-fun res!279122 () Bool)

(assert (=> d!75199 (=> (not res!279122) (not e!273077))))

(assert (=> d!75199 (= res!279122 (or (bvsge #b00000000000000000000000000000000 (size!14518 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))))

(declare-fun lt!211156 () ListLongMap!7339)

(assert (=> d!75199 (= lt!211149 lt!211156)))

(declare-fun lt!211160 () Unit!13582)

(declare-fun e!273069 () Unit!13582)

(assert (=> d!75199 (= lt!211160 e!273069)))

(declare-fun c!56747 () Bool)

(declare-fun e!273074 () Bool)

(assert (=> d!75199 (= c!56747 e!273074)))

(declare-fun res!279120 () Bool)

(assert (=> d!75199 (=> (not res!279120) (not e!273074))))

(assert (=> d!75199 (= res!279120 (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun e!273071 () ListLongMap!7339)

(assert (=> d!75199 (= lt!211156 e!273071)))

(declare-fun c!56745 () Bool)

(assert (=> d!75199 (= c!56745 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75199 (validMask!0 mask!1365)))

(assert (=> d!75199 (= (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211149)))

(declare-fun bm!30282 () Bool)

(declare-fun call!30281 () ListLongMap!7339)

(declare-fun c!56749 () Bool)

(assert (=> bm!30282 (= call!30284 (+!1682 (ite c!56745 call!30286 (ite c!56749 call!30283 call!30281)) (ite (or c!56745 c!56749) (tuple2!8425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!466920 () Bool)

(declare-fun e!273079 () ListLongMap!7339)

(assert (=> b!466920 (= e!273079 call!30281)))

(declare-fun b!466921 () Bool)

(assert (=> b!466921 (= e!273074 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466922 () Bool)

(declare-fun lt!211163 () Unit!13582)

(assert (=> b!466922 (= e!273069 lt!211163)))

(declare-fun lt!211147 () ListLongMap!7339)

(assert (=> b!466922 (= lt!211147 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211151 () (_ BitVec 64))

(assert (=> b!466922 (= lt!211151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211146 () (_ BitVec 64))

(assert (=> b!466922 (= lt!211146 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211161 () Unit!13582)

(declare-fun addStillContains!286 (ListLongMap!7339 (_ BitVec 64) V!18243 (_ BitVec 64)) Unit!13582)

(assert (=> b!466922 (= lt!211161 (addStillContains!286 lt!211147 lt!211151 zeroValue!794 lt!211146))))

(assert (=> b!466922 (contains!2508 (+!1682 lt!211147 (tuple2!8425 lt!211151 zeroValue!794)) lt!211146)))

(declare-fun lt!211158 () Unit!13582)

(assert (=> b!466922 (= lt!211158 lt!211161)))

(declare-fun lt!211152 () ListLongMap!7339)

(assert (=> b!466922 (= lt!211152 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211164 () (_ BitVec 64))

(assert (=> b!466922 (= lt!211164 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211165 () (_ BitVec 64))

(assert (=> b!466922 (= lt!211165 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211154 () Unit!13582)

(declare-fun addApplyDifferent!286 (ListLongMap!7339 (_ BitVec 64) V!18243 (_ BitVec 64)) Unit!13582)

(assert (=> b!466922 (= lt!211154 (addApplyDifferent!286 lt!211152 lt!211164 minValueBefore!38 lt!211165))))

(assert (=> b!466922 (= (apply!323 (+!1682 lt!211152 (tuple2!8425 lt!211164 minValueBefore!38)) lt!211165) (apply!323 lt!211152 lt!211165))))

(declare-fun lt!211148 () Unit!13582)

(assert (=> b!466922 (= lt!211148 lt!211154)))

(declare-fun lt!211145 () ListLongMap!7339)

(assert (=> b!466922 (= lt!211145 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211153 () (_ BitVec 64))

(assert (=> b!466922 (= lt!211153 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211150 () (_ BitVec 64))

(assert (=> b!466922 (= lt!211150 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211157 () Unit!13582)

(assert (=> b!466922 (= lt!211157 (addApplyDifferent!286 lt!211145 lt!211153 zeroValue!794 lt!211150))))

(assert (=> b!466922 (= (apply!323 (+!1682 lt!211145 (tuple2!8425 lt!211153 zeroValue!794)) lt!211150) (apply!323 lt!211145 lt!211150))))

(declare-fun lt!211162 () Unit!13582)

(assert (=> b!466922 (= lt!211162 lt!211157)))

(declare-fun lt!211159 () ListLongMap!7339)

(assert (=> b!466922 (= lt!211159 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211155 () (_ BitVec 64))

(assert (=> b!466922 (= lt!211155 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211144 () (_ BitVec 64))

(assert (=> b!466922 (= lt!211144 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466922 (= lt!211163 (addApplyDifferent!286 lt!211159 lt!211155 minValueBefore!38 lt!211144))))

(assert (=> b!466922 (= (apply!323 (+!1682 lt!211159 (tuple2!8425 lt!211155 minValueBefore!38)) lt!211144) (apply!323 lt!211159 lt!211144))))

(declare-fun bm!30283 () Bool)

(declare-fun call!30282 () Bool)

(assert (=> bm!30283 (= call!30282 (contains!2508 lt!211149 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466923 () Bool)

(declare-fun e!273072 () ListLongMap!7339)

(assert (=> b!466923 (= e!273072 call!30287)))

(declare-fun b!466924 () Bool)

(declare-fun c!56746 () Bool)

(assert (=> b!466924 (= c!56746 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!466924 (= e!273072 e!273079)))

(declare-fun b!466925 () Bool)

(declare-fun res!279125 () Bool)

(assert (=> b!466925 (=> (not res!279125) (not e!273077))))

(declare-fun e!273076 () Bool)

(assert (=> b!466925 (= res!279125 e!273076)))

(declare-fun res!279119 () Bool)

(assert (=> b!466925 (=> res!279119 e!273076)))

(declare-fun e!273075 () Bool)

(assert (=> b!466925 (= res!279119 (not e!273075))))

(declare-fun res!279123 () Bool)

(assert (=> b!466925 (=> (not res!279123) (not e!273075))))

(assert (=> b!466925 (= res!279123 (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466926 () Bool)

(declare-fun e!273070 () Bool)

(declare-fun e!273068 () Bool)

(assert (=> b!466926 (= e!273070 e!273068)))

(declare-fun res!279118 () Bool)

(assert (=> b!466926 (= res!279118 call!30285)))

(assert (=> b!466926 (=> (not res!279118) (not e!273068))))

(declare-fun b!466927 () Bool)

(assert (=> b!466927 (= e!273068 (= (apply!323 lt!211149 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!466928 () Bool)

(declare-fun e!273078 () Bool)

(assert (=> b!466928 (= e!273078 (= (apply!323 lt!211149 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)) (get!6947 (select (arr!14167 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!466928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14519 _values!833)))))

(assert (=> b!466928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466929 () Bool)

(assert (=> b!466929 (= e!273075 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466930 () Bool)

(declare-fun res!279117 () Bool)

(assert (=> b!466930 (=> (not res!279117) (not e!273077))))

(assert (=> b!466930 (= res!279117 e!273070)))

(declare-fun c!56748 () Bool)

(assert (=> b!466930 (= c!56748 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!466931 () Bool)

(declare-fun e!273080 () Bool)

(declare-fun e!273073 () Bool)

(assert (=> b!466931 (= e!273080 e!273073)))

(declare-fun res!279121 () Bool)

(assert (=> b!466931 (= res!279121 call!30282)))

(assert (=> b!466931 (=> (not res!279121) (not e!273073))))

(declare-fun b!466932 () Bool)

(assert (=> b!466932 (= e!273079 call!30287)))

(declare-fun bm!30284 () Bool)

(assert (=> bm!30284 (= call!30281 call!30283)))

(declare-fun b!466933 () Bool)

(assert (=> b!466933 (= e!273073 (= (apply!323 lt!211149 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!466934 () Bool)

(assert (=> b!466934 (= e!273077 e!273080)))

(declare-fun c!56744 () Bool)

(assert (=> b!466934 (= c!56744 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466935 () Bool)

(assert (=> b!466935 (= e!273071 e!273072)))

(assert (=> b!466935 (= c!56749 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466936 () Bool)

(declare-fun Unit!13586 () Unit!13582)

(assert (=> b!466936 (= e!273069 Unit!13586)))

(declare-fun b!466937 () Bool)

(assert (=> b!466937 (= e!273080 (not call!30282))))

(declare-fun b!466938 () Bool)

(assert (=> b!466938 (= e!273070 (not call!30285))))

(declare-fun b!466939 () Bool)

(assert (=> b!466939 (= e!273076 e!273078)))

(declare-fun res!279124 () Bool)

(assert (=> b!466939 (=> (not res!279124) (not e!273078))))

(assert (=> b!466939 (= res!279124 (contains!2508 lt!211149 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466939 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466940 () Bool)

(assert (=> b!466940 (= e!273071 (+!1682 call!30284 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75199 c!56745) b!466940))

(assert (= (and d!75199 (not c!56745)) b!466935))

(assert (= (and b!466935 c!56749) b!466923))

(assert (= (and b!466935 (not c!56749)) b!466924))

(assert (= (and b!466924 c!56746) b!466932))

(assert (= (and b!466924 (not c!56746)) b!466920))

(assert (= (or b!466932 b!466920) bm!30284))

(assert (= (or b!466923 bm!30284) bm!30280))

(assert (= (or b!466923 b!466932) bm!30278))

(assert (= (or b!466940 bm!30280) bm!30279))

(assert (= (or b!466940 bm!30278) bm!30282))

(assert (= (and d!75199 res!279120) b!466921))

(assert (= (and d!75199 c!56747) b!466922))

(assert (= (and d!75199 (not c!56747)) b!466936))

(assert (= (and d!75199 res!279122) b!466925))

(assert (= (and b!466925 res!279123) b!466929))

(assert (= (and b!466925 (not res!279119)) b!466939))

(assert (= (and b!466939 res!279124) b!466928))

(assert (= (and b!466925 res!279125) b!466930))

(assert (= (and b!466930 c!56748) b!466926))

(assert (= (and b!466930 (not c!56748)) b!466938))

(assert (= (and b!466926 res!279118) b!466927))

(assert (= (or b!466926 b!466938) bm!30281))

(assert (= (and b!466930 res!279117) b!466934))

(assert (= (and b!466934 c!56744) b!466931))

(assert (= (and b!466934 (not c!56744)) b!466937))

(assert (= (and b!466931 res!279121) b!466933))

(assert (= (or b!466931 b!466937) bm!30283))

(declare-fun b_lambda!10051 () Bool)

(assert (=> (not b_lambda!10051) (not b!466928)))

(assert (=> b!466928 t!14454))

(declare-fun b_and!19817 () Bool)

(assert (= b_and!19815 (and (=> t!14454 result!7383) b_and!19817)))

(declare-fun m!449353 () Bool)

(assert (=> b!466922 m!449353))

(declare-fun m!449355 () Bool)

(assert (=> b!466922 m!449355))

(declare-fun m!449357 () Bool)

(assert (=> b!466922 m!449357))

(declare-fun m!449359 () Bool)

(assert (=> b!466922 m!449359))

(assert (=> b!466922 m!449295))

(declare-fun m!449361 () Bool)

(assert (=> b!466922 m!449361))

(declare-fun m!449363 () Bool)

(assert (=> b!466922 m!449363))

(assert (=> b!466922 m!449357))

(declare-fun m!449365 () Bool)

(assert (=> b!466922 m!449365))

(assert (=> b!466922 m!449361))

(declare-fun m!449367 () Bool)

(assert (=> b!466922 m!449367))

(declare-fun m!449369 () Bool)

(assert (=> b!466922 m!449369))

(declare-fun m!449371 () Bool)

(assert (=> b!466922 m!449371))

(declare-fun m!449373 () Bool)

(assert (=> b!466922 m!449373))

(assert (=> b!466922 m!449239))

(declare-fun m!449375 () Bool)

(assert (=> b!466922 m!449375))

(declare-fun m!449377 () Bool)

(assert (=> b!466922 m!449377))

(declare-fun m!449379 () Bool)

(assert (=> b!466922 m!449379))

(assert (=> b!466922 m!449369))

(declare-fun m!449381 () Bool)

(assert (=> b!466922 m!449381))

(assert (=> b!466922 m!449353))

(assert (=> d!75199 m!449217))

(assert (=> b!466929 m!449295))

(assert (=> b!466929 m!449295))

(assert (=> b!466929 m!449297))

(declare-fun m!449383 () Bool)

(assert (=> bm!30282 m!449383))

(declare-fun m!449385 () Bool)

(assert (=> b!466927 m!449385))

(declare-fun m!449387 () Bool)

(assert (=> bm!30283 m!449387))

(assert (=> b!466928 m!449295))

(declare-fun m!449389 () Bool)

(assert (=> b!466928 m!449389))

(assert (=> b!466928 m!449307))

(assert (=> b!466928 m!449309))

(assert (=> b!466928 m!449311))

(assert (=> b!466928 m!449295))

(assert (=> b!466928 m!449307))

(assert (=> b!466928 m!449309))

(assert (=> b!466921 m!449295))

(assert (=> b!466921 m!449295))

(assert (=> b!466921 m!449297))

(declare-fun m!449391 () Bool)

(assert (=> b!466940 m!449391))

(declare-fun m!449393 () Bool)

(assert (=> bm!30281 m!449393))

(declare-fun m!449395 () Bool)

(assert (=> b!466933 m!449395))

(assert (=> b!466939 m!449295))

(assert (=> b!466939 m!449295))

(declare-fun m!449397 () Bool)

(assert (=> b!466939 m!449397))

(assert (=> bm!30279 m!449239))

(assert (=> b!466760 d!75199))

(declare-fun bm!30285 () Bool)

(declare-fun call!30294 () ListLongMap!7339)

(declare-fun call!30291 () ListLongMap!7339)

(assert (=> bm!30285 (= call!30294 call!30291)))

(declare-fun bm!30286 () Bool)

(declare-fun call!30293 () ListLongMap!7339)

(assert (=> bm!30286 (= call!30293 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30287 () Bool)

(declare-fun call!30290 () ListLongMap!7339)

(assert (=> bm!30287 (= call!30290 call!30293)))

(declare-fun bm!30288 () Bool)

(declare-fun call!30292 () Bool)

(declare-fun lt!211171 () ListLongMap!7339)

(assert (=> bm!30288 (= call!30292 (contains!2508 lt!211171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!75201 () Bool)

(declare-fun e!273090 () Bool)

(assert (=> d!75201 e!273090))

(declare-fun res!279131 () Bool)

(assert (=> d!75201 (=> (not res!279131) (not e!273090))))

(assert (=> d!75201 (= res!279131 (or (bvsge #b00000000000000000000000000000000 (size!14518 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))))

(declare-fun lt!211178 () ListLongMap!7339)

(assert (=> d!75201 (= lt!211171 lt!211178)))

(declare-fun lt!211182 () Unit!13582)

(declare-fun e!273082 () Unit!13582)

(assert (=> d!75201 (= lt!211182 e!273082)))

(declare-fun c!56753 () Bool)

(declare-fun e!273087 () Bool)

(assert (=> d!75201 (= c!56753 e!273087)))

(declare-fun res!279129 () Bool)

(assert (=> d!75201 (=> (not res!279129) (not e!273087))))

(assert (=> d!75201 (= res!279129 (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun e!273084 () ListLongMap!7339)

(assert (=> d!75201 (= lt!211178 e!273084)))

(declare-fun c!56751 () Bool)

(assert (=> d!75201 (= c!56751 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75201 (validMask!0 mask!1365)))

(assert (=> d!75201 (= (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211171)))

(declare-fun call!30288 () ListLongMap!7339)

(declare-fun bm!30289 () Bool)

(declare-fun c!56755 () Bool)

(assert (=> bm!30289 (= call!30291 (+!1682 (ite c!56751 call!30293 (ite c!56755 call!30290 call!30288)) (ite (or c!56751 c!56755) (tuple2!8425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!466941 () Bool)

(declare-fun e!273092 () ListLongMap!7339)

(assert (=> b!466941 (= e!273092 call!30288)))

(declare-fun b!466942 () Bool)

(assert (=> b!466942 (= e!273087 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466943 () Bool)

(declare-fun lt!211185 () Unit!13582)

(assert (=> b!466943 (= e!273082 lt!211185)))

(declare-fun lt!211169 () ListLongMap!7339)

(assert (=> b!466943 (= lt!211169 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211173 () (_ BitVec 64))

(assert (=> b!466943 (= lt!211173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211168 () (_ BitVec 64))

(assert (=> b!466943 (= lt!211168 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211183 () Unit!13582)

(assert (=> b!466943 (= lt!211183 (addStillContains!286 lt!211169 lt!211173 zeroValue!794 lt!211168))))

(assert (=> b!466943 (contains!2508 (+!1682 lt!211169 (tuple2!8425 lt!211173 zeroValue!794)) lt!211168)))

(declare-fun lt!211180 () Unit!13582)

(assert (=> b!466943 (= lt!211180 lt!211183)))

(declare-fun lt!211174 () ListLongMap!7339)

(assert (=> b!466943 (= lt!211174 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211186 () (_ BitVec 64))

(assert (=> b!466943 (= lt!211186 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211187 () (_ BitVec 64))

(assert (=> b!466943 (= lt!211187 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211176 () Unit!13582)

(assert (=> b!466943 (= lt!211176 (addApplyDifferent!286 lt!211174 lt!211186 minValueAfter!38 lt!211187))))

(assert (=> b!466943 (= (apply!323 (+!1682 lt!211174 (tuple2!8425 lt!211186 minValueAfter!38)) lt!211187) (apply!323 lt!211174 lt!211187))))

(declare-fun lt!211170 () Unit!13582)

(assert (=> b!466943 (= lt!211170 lt!211176)))

(declare-fun lt!211167 () ListLongMap!7339)

(assert (=> b!466943 (= lt!211167 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211175 () (_ BitVec 64))

(assert (=> b!466943 (= lt!211175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211172 () (_ BitVec 64))

(assert (=> b!466943 (= lt!211172 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211179 () Unit!13582)

(assert (=> b!466943 (= lt!211179 (addApplyDifferent!286 lt!211167 lt!211175 zeroValue!794 lt!211172))))

(assert (=> b!466943 (= (apply!323 (+!1682 lt!211167 (tuple2!8425 lt!211175 zeroValue!794)) lt!211172) (apply!323 lt!211167 lt!211172))))

(declare-fun lt!211184 () Unit!13582)

(assert (=> b!466943 (= lt!211184 lt!211179)))

(declare-fun lt!211181 () ListLongMap!7339)

(assert (=> b!466943 (= lt!211181 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211177 () (_ BitVec 64))

(assert (=> b!466943 (= lt!211177 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211166 () (_ BitVec 64))

(assert (=> b!466943 (= lt!211166 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!466943 (= lt!211185 (addApplyDifferent!286 lt!211181 lt!211177 minValueAfter!38 lt!211166))))

(assert (=> b!466943 (= (apply!323 (+!1682 lt!211181 (tuple2!8425 lt!211177 minValueAfter!38)) lt!211166) (apply!323 lt!211181 lt!211166))))

(declare-fun bm!30290 () Bool)

(declare-fun call!30289 () Bool)

(assert (=> bm!30290 (= call!30289 (contains!2508 lt!211171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!466944 () Bool)

(declare-fun e!273085 () ListLongMap!7339)

(assert (=> b!466944 (= e!273085 call!30294)))

(declare-fun b!466945 () Bool)

(declare-fun c!56752 () Bool)

(assert (=> b!466945 (= c!56752 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!466945 (= e!273085 e!273092)))

(declare-fun b!466946 () Bool)

(declare-fun res!279134 () Bool)

(assert (=> b!466946 (=> (not res!279134) (not e!273090))))

(declare-fun e!273089 () Bool)

(assert (=> b!466946 (= res!279134 e!273089)))

(declare-fun res!279128 () Bool)

(assert (=> b!466946 (=> res!279128 e!273089)))

(declare-fun e!273088 () Bool)

(assert (=> b!466946 (= res!279128 (not e!273088))))

(declare-fun res!279132 () Bool)

(assert (=> b!466946 (=> (not res!279132) (not e!273088))))

(assert (=> b!466946 (= res!279132 (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466947 () Bool)

(declare-fun e!273083 () Bool)

(declare-fun e!273081 () Bool)

(assert (=> b!466947 (= e!273083 e!273081)))

(declare-fun res!279127 () Bool)

(assert (=> b!466947 (= res!279127 call!30292)))

(assert (=> b!466947 (=> (not res!279127) (not e!273081))))

(declare-fun b!466948 () Bool)

(assert (=> b!466948 (= e!273081 (= (apply!323 lt!211171 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!466949 () Bool)

(declare-fun e!273091 () Bool)

(assert (=> b!466949 (= e!273091 (= (apply!323 lt!211171 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)) (get!6947 (select (arr!14167 _values!833) #b00000000000000000000000000000000) (dynLambda!913 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!466949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14519 _values!833)))))

(assert (=> b!466949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466950 () Bool)

(assert (=> b!466950 (= e!273088 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466951 () Bool)

(declare-fun res!279126 () Bool)

(assert (=> b!466951 (=> (not res!279126) (not e!273090))))

(assert (=> b!466951 (= res!279126 e!273083)))

(declare-fun c!56754 () Bool)

(assert (=> b!466951 (= c!56754 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!466952 () Bool)

(declare-fun e!273093 () Bool)

(declare-fun e!273086 () Bool)

(assert (=> b!466952 (= e!273093 e!273086)))

(declare-fun res!279130 () Bool)

(assert (=> b!466952 (= res!279130 call!30289)))

(assert (=> b!466952 (=> (not res!279130) (not e!273086))))

(declare-fun b!466953 () Bool)

(assert (=> b!466953 (= e!273092 call!30294)))

(declare-fun bm!30291 () Bool)

(assert (=> bm!30291 (= call!30288 call!30290)))

(declare-fun b!466954 () Bool)

(assert (=> b!466954 (= e!273086 (= (apply!323 lt!211171 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!466955 () Bool)

(assert (=> b!466955 (= e!273090 e!273093)))

(declare-fun c!56750 () Bool)

(assert (=> b!466955 (= c!56750 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466956 () Bool)

(assert (=> b!466956 (= e!273084 e!273085)))

(assert (=> b!466956 (= c!56755 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!466957 () Bool)

(declare-fun Unit!13587 () Unit!13582)

(assert (=> b!466957 (= e!273082 Unit!13587)))

(declare-fun b!466958 () Bool)

(assert (=> b!466958 (= e!273093 (not call!30289))))

(declare-fun b!466959 () Bool)

(assert (=> b!466959 (= e!273083 (not call!30292))))

(declare-fun b!466960 () Bool)

(assert (=> b!466960 (= e!273089 e!273091)))

(declare-fun res!279133 () Bool)

(assert (=> b!466960 (=> (not res!279133) (not e!273091))))

(assert (=> b!466960 (= res!279133 (contains!2508 lt!211171 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!466960 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(declare-fun b!466961 () Bool)

(assert (=> b!466961 (= e!273084 (+!1682 call!30291 (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75201 c!56751) b!466961))

(assert (= (and d!75201 (not c!56751)) b!466956))

(assert (= (and b!466956 c!56755) b!466944))

(assert (= (and b!466956 (not c!56755)) b!466945))

(assert (= (and b!466945 c!56752) b!466953))

(assert (= (and b!466945 (not c!56752)) b!466941))

(assert (= (or b!466953 b!466941) bm!30291))

(assert (= (or b!466944 bm!30291) bm!30287))

(assert (= (or b!466944 b!466953) bm!30285))

(assert (= (or b!466961 bm!30287) bm!30286))

(assert (= (or b!466961 bm!30285) bm!30289))

(assert (= (and d!75201 res!279129) b!466942))

(assert (= (and d!75201 c!56753) b!466943))

(assert (= (and d!75201 (not c!56753)) b!466957))

(assert (= (and d!75201 res!279131) b!466946))

(assert (= (and b!466946 res!279132) b!466950))

(assert (= (and b!466946 (not res!279128)) b!466960))

(assert (= (and b!466960 res!279133) b!466949))

(assert (= (and b!466946 res!279134) b!466951))

(assert (= (and b!466951 c!56754) b!466947))

(assert (= (and b!466951 (not c!56754)) b!466959))

(assert (= (and b!466947 res!279127) b!466948))

(assert (= (or b!466947 b!466959) bm!30288))

(assert (= (and b!466951 res!279126) b!466955))

(assert (= (and b!466955 c!56750) b!466952))

(assert (= (and b!466955 (not c!56750)) b!466958))

(assert (= (and b!466952 res!279130) b!466954))

(assert (= (or b!466952 b!466958) bm!30290))

(declare-fun b_lambda!10053 () Bool)

(assert (=> (not b_lambda!10053) (not b!466949)))

(assert (=> b!466949 t!14454))

(declare-fun b_and!19819 () Bool)

(assert (= b_and!19817 (and (=> t!14454 result!7383) b_and!19819)))

(declare-fun m!449399 () Bool)

(assert (=> b!466943 m!449399))

(declare-fun m!449401 () Bool)

(assert (=> b!466943 m!449401))

(declare-fun m!449403 () Bool)

(assert (=> b!466943 m!449403))

(declare-fun m!449405 () Bool)

(assert (=> b!466943 m!449405))

(assert (=> b!466943 m!449295))

(declare-fun m!449407 () Bool)

(assert (=> b!466943 m!449407))

(declare-fun m!449409 () Bool)

(assert (=> b!466943 m!449409))

(assert (=> b!466943 m!449403))

(declare-fun m!449411 () Bool)

(assert (=> b!466943 m!449411))

(assert (=> b!466943 m!449407))

(declare-fun m!449413 () Bool)

(assert (=> b!466943 m!449413))

(declare-fun m!449415 () Bool)

(assert (=> b!466943 m!449415))

(declare-fun m!449417 () Bool)

(assert (=> b!466943 m!449417))

(declare-fun m!449419 () Bool)

(assert (=> b!466943 m!449419))

(assert (=> b!466943 m!449237))

(declare-fun m!449421 () Bool)

(assert (=> b!466943 m!449421))

(declare-fun m!449423 () Bool)

(assert (=> b!466943 m!449423))

(declare-fun m!449425 () Bool)

(assert (=> b!466943 m!449425))

(assert (=> b!466943 m!449415))

(declare-fun m!449427 () Bool)

(assert (=> b!466943 m!449427))

(assert (=> b!466943 m!449399))

(assert (=> d!75201 m!449217))

(assert (=> b!466950 m!449295))

(assert (=> b!466950 m!449295))

(assert (=> b!466950 m!449297))

(declare-fun m!449429 () Bool)

(assert (=> bm!30289 m!449429))

(declare-fun m!449431 () Bool)

(assert (=> b!466948 m!449431))

(declare-fun m!449433 () Bool)

(assert (=> bm!30290 m!449433))

(assert (=> b!466949 m!449295))

(declare-fun m!449435 () Bool)

(assert (=> b!466949 m!449435))

(assert (=> b!466949 m!449307))

(assert (=> b!466949 m!449309))

(assert (=> b!466949 m!449311))

(assert (=> b!466949 m!449295))

(assert (=> b!466949 m!449307))

(assert (=> b!466949 m!449309))

(assert (=> b!466942 m!449295))

(assert (=> b!466942 m!449295))

(assert (=> b!466942 m!449297))

(declare-fun m!449437 () Bool)

(assert (=> b!466961 m!449437))

(declare-fun m!449439 () Bool)

(assert (=> bm!30288 m!449439))

(declare-fun m!449441 () Bool)

(assert (=> b!466954 m!449441))

(assert (=> b!466960 m!449295))

(assert (=> b!466960 m!449295))

(declare-fun m!449443 () Bool)

(assert (=> b!466960 m!449443))

(assert (=> bm!30286 m!449237))

(assert (=> b!466760 d!75201))

(declare-fun b!466970 () Bool)

(declare-fun e!273102 () Bool)

(declare-fun call!30297 () Bool)

(assert (=> b!466970 (= e!273102 call!30297)))

(declare-fun b!466971 () Bool)

(declare-fun e!273100 () Bool)

(assert (=> b!466971 (= e!273102 e!273100)))

(declare-fun lt!211195 () (_ BitVec 64))

(assert (=> b!466971 (= lt!211195 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211194 () Unit!13582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29476 (_ BitVec 64) (_ BitVec 32)) Unit!13582)

(assert (=> b!466971 (= lt!211194 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!211195 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!466971 (arrayContainsKey!0 _keys!1025 lt!211195 #b00000000000000000000000000000000)))

(declare-fun lt!211196 () Unit!13582)

(assert (=> b!466971 (= lt!211196 lt!211194)))

(declare-fun res!279139 () Bool)

(declare-datatypes ((SeekEntryResult!3496 0))(
  ( (MissingZero!3496 (index!16163 (_ BitVec 32))) (Found!3496 (index!16164 (_ BitVec 32))) (Intermediate!3496 (undefined!4308 Bool) (index!16165 (_ BitVec 32)) (x!43614 (_ BitVec 32))) (Undefined!3496) (MissingVacant!3496 (index!16166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29476 (_ BitVec 32)) SeekEntryResult!3496)

(assert (=> b!466971 (= res!279139 (= (seekEntryOrOpen!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3496 #b00000000000000000000000000000000)))))

(assert (=> b!466971 (=> (not res!279139) (not e!273100))))

(declare-fun bm!30294 () Bool)

(assert (=> bm!30294 (= call!30297 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75203 () Bool)

(declare-fun res!279140 () Bool)

(declare-fun e!273101 () Bool)

(assert (=> d!75203 (=> res!279140 e!273101)))

(assert (=> d!75203 (= res!279140 (bvsge #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(assert (=> d!75203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!273101)))

(declare-fun b!466972 () Bool)

(assert (=> b!466972 (= e!273100 call!30297)))

(declare-fun b!466973 () Bool)

(assert (=> b!466973 (= e!273101 e!273102)))

(declare-fun c!56758 () Bool)

(assert (=> b!466973 (= c!56758 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75203 (not res!279140)) b!466973))

(assert (= (and b!466973 c!56758) b!466971))

(assert (= (and b!466973 (not c!56758)) b!466970))

(assert (= (and b!466971 res!279139) b!466972))

(assert (= (or b!466972 b!466970) bm!30294))

(assert (=> b!466971 m!449295))

(declare-fun m!449445 () Bool)

(assert (=> b!466971 m!449445))

(declare-fun m!449447 () Bool)

(assert (=> b!466971 m!449447))

(assert (=> b!466971 m!449295))

(declare-fun m!449449 () Bool)

(assert (=> b!466971 m!449449))

(declare-fun m!449451 () Bool)

(assert (=> bm!30294 m!449451))

(assert (=> b!466973 m!449295))

(assert (=> b!466973 m!449295))

(assert (=> b!466973 m!449297))

(assert (=> b!466762 d!75203))

(declare-fun b!466984 () Bool)

(declare-fun e!273114 () Bool)

(declare-fun call!30300 () Bool)

(assert (=> b!466984 (= e!273114 call!30300)))

(declare-fun b!466985 () Bool)

(declare-fun e!273113 () Bool)

(declare-fun contains!2510 (List!8505 (_ BitVec 64)) Bool)

(assert (=> b!466985 (= e!273113 (contains!2510 Nil!8502 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30297 () Bool)

(declare-fun c!56761 () Bool)

(assert (=> bm!30297 (= call!30300 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56761 (Cons!8501 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000) Nil!8502) Nil!8502)))))

(declare-fun b!466987 () Bool)

(declare-fun e!273111 () Bool)

(declare-fun e!273112 () Bool)

(assert (=> b!466987 (= e!273111 e!273112)))

(declare-fun res!279148 () Bool)

(assert (=> b!466987 (=> (not res!279148) (not e!273112))))

(assert (=> b!466987 (= res!279148 (not e!273113))))

(declare-fun res!279149 () Bool)

(assert (=> b!466987 (=> (not res!279149) (not e!273113))))

(assert (=> b!466987 (= res!279149 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!466988 () Bool)

(assert (=> b!466988 (= e!273114 call!30300)))

(declare-fun d!75205 () Bool)

(declare-fun res!279147 () Bool)

(assert (=> d!75205 (=> res!279147 e!273111)))

(assert (=> d!75205 (= res!279147 (bvsge #b00000000000000000000000000000000 (size!14518 _keys!1025)))))

(assert (=> d!75205 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8502) e!273111)))

(declare-fun b!466986 () Bool)

(assert (=> b!466986 (= e!273112 e!273114)))

(assert (=> b!466986 (= c!56761 (validKeyInArray!0 (select (arr!14166 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75205 (not res!279147)) b!466987))

(assert (= (and b!466987 res!279149) b!466985))

(assert (= (and b!466987 res!279148) b!466986))

(assert (= (and b!466986 c!56761) b!466988))

(assert (= (and b!466986 (not c!56761)) b!466984))

(assert (= (or b!466988 b!466984) bm!30297))

(assert (=> b!466985 m!449295))

(assert (=> b!466985 m!449295))

(declare-fun m!449453 () Bool)

(assert (=> b!466985 m!449453))

(assert (=> bm!30297 m!449295))

(declare-fun m!449455 () Bool)

(assert (=> bm!30297 m!449455))

(assert (=> b!466987 m!449295))

(assert (=> b!466987 m!449295))

(assert (=> b!466987 m!449297))

(assert (=> b!466986 m!449295))

(assert (=> b!466986 m!449295))

(assert (=> b!466986 m!449297))

(assert (=> b!466766 d!75205))

(declare-fun d!75207 () Bool)

(assert (=> d!75207 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41790 d!75207))

(declare-fun d!75209 () Bool)

(assert (=> d!75209 (= (array_inv!10312 _keys!1025) (bvsge (size!14518 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41790 d!75209))

(declare-fun d!75211 () Bool)

(assert (=> d!75211 (= (array_inv!10313 _values!833) (bvsge (size!14519 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41790 d!75211))

(declare-fun b!466996 () Bool)

(declare-fun e!273119 () Bool)

(assert (=> b!466996 (= e!273119 tp_is_empty!12853)))

(declare-fun mapIsEmpty!20974 () Bool)

(declare-fun mapRes!20974 () Bool)

(assert (=> mapIsEmpty!20974 mapRes!20974))

(declare-fun b!466995 () Bool)

(declare-fun e!273120 () Bool)

(assert (=> b!466995 (= e!273120 tp_is_empty!12853)))

(declare-fun condMapEmpty!20974 () Bool)

(declare-fun mapDefault!20974 () ValueCell!6083)

(assert (=> mapNonEmpty!20965 (= condMapEmpty!20974 (= mapRest!20965 ((as const (Array (_ BitVec 32) ValueCell!6083)) mapDefault!20974)))))

(assert (=> mapNonEmpty!20965 (= tp!40281 (and e!273119 mapRes!20974))))

(declare-fun mapNonEmpty!20974 () Bool)

(declare-fun tp!40297 () Bool)

(assert (=> mapNonEmpty!20974 (= mapRes!20974 (and tp!40297 e!273120))))

(declare-fun mapValue!20974 () ValueCell!6083)

(declare-fun mapRest!20974 () (Array (_ BitVec 32) ValueCell!6083))

(declare-fun mapKey!20974 () (_ BitVec 32))

(assert (=> mapNonEmpty!20974 (= mapRest!20965 (store mapRest!20974 mapKey!20974 mapValue!20974))))

(assert (= (and mapNonEmpty!20965 condMapEmpty!20974) mapIsEmpty!20974))

(assert (= (and mapNonEmpty!20965 (not condMapEmpty!20974)) mapNonEmpty!20974))

(assert (= (and mapNonEmpty!20974 ((_ is ValueCellFull!6083) mapValue!20974)) b!466995))

(assert (= (and mapNonEmpty!20965 ((_ is ValueCellFull!6083) mapDefault!20974)) b!466996))

(declare-fun m!449457 () Bool)

(assert (=> mapNonEmpty!20974 m!449457))

(declare-fun b_lambda!10055 () Bool)

(assert (= b_lambda!10051 (or (and start!41790 b_free!11425) b_lambda!10055)))

(declare-fun b_lambda!10057 () Bool)

(assert (= b_lambda!10053 (or (and start!41790 b_free!11425) b_lambda!10057)))

(declare-fun b_lambda!10059 () Bool)

(assert (= b_lambda!10045 (or (and start!41790 b_free!11425) b_lambda!10059)))

(declare-fun b_lambda!10061 () Bool)

(assert (= b_lambda!10043 (or (and start!41790 b_free!11425) b_lambda!10061)))

(declare-fun b_lambda!10063 () Bool)

(assert (= b_lambda!10049 (or (and start!41790 b_free!11425) b_lambda!10063)))

(declare-fun b_lambda!10065 () Bool)

(assert (= b_lambda!10047 (or (and start!41790 b_free!11425) b_lambda!10065)))

(check-sat (not b!466948) (not b!466927) (not d!75191) (not b!466950) (not bm!30290) (not b!466868) (not bm!30297) (not b_lambda!10061) (not b!466929) (not b!466848) (not b_lambda!10055) (not b!466986) (not b!466877) (not b!466943) (not bm!30281) (not bm!30294) (not b!466850) (not b!466870) (not b!466921) (not b!466942) tp_is_empty!12853 (not d!75199) (not d!75193) (not b!466861) (not b_lambda!10059) (not bm!30286) (not b!466857) (not b_next!11425) (not bm!30289) (not bm!30283) (not d!75201) (not b!466871) (not b!466854) (not d!75197) (not b!466961) (not b!466954) (not b!466864) (not b!466847) (not b_lambda!10065) (not b!466949) (not b!466939) (not bm!30288) (not bm!30279) (not bm!30282) (not b!466856) (not b!466973) (not b_lambda!10063) b_and!19819 (not bm!30262) (not d!75195) (not b_lambda!10057) (not b!466876) (not b!466851) (not b!466865) (not bm!30263) (not b!466922) (not b!466960) (not b!466928) (not b!466933) (not b!466985) (not b!466971) (not b!466860) (not b!466862) (not mapNonEmpty!20974) (not b!466987) (not b!466940) (not b!466846))
(check-sat b_and!19819 (not b_next!11425))
