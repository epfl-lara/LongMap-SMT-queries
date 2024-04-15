; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41450 () Bool)

(assert start!41450)

(declare-fun b_free!11143 () Bool)

(declare-fun b_next!11143 () Bool)

(assert (=> start!41450 (= b_free!11143 (not b_next!11143))))

(declare-fun tp!39423 () Bool)

(declare-fun b_and!19453 () Bool)

(assert (=> start!41450 (= tp!39423 b_and!19453)))

(declare-fun b!463004 () Bool)

(declare-fun res!276896 () Bool)

(declare-fun e!270297 () Bool)

(assert (=> b!463004 (=> (not res!276896) (not e!270297))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28935 0))(
  ( (array!28936 (arr!13900 (Array (_ BitVec 32) (_ BitVec 64))) (size!14253 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28935)

(declare-datatypes ((V!17867 0))(
  ( (V!17868 (val!6330 Int)) )
))
(declare-datatypes ((ValueCell!5942 0))(
  ( (ValueCellFull!5942 (v!8611 V!17867)) (EmptyCell!5942) )
))
(declare-datatypes ((array!28937 0))(
  ( (array!28938 (arr!13901 (Array (_ BitVec 32) ValueCell!5942)) (size!14254 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28937)

(assert (=> b!463004 (= res!276896 (and (= (size!14254 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14253 _keys!1025) (size!14254 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463005 () Bool)

(declare-fun res!276894 () Bool)

(assert (=> b!463005 (=> (not res!276894) (not e!270297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28935 (_ BitVec 32)) Bool)

(assert (=> b!463005 (= res!276894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276893 () Bool)

(assert (=> start!41450 (=> (not res!276893) (not e!270297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41450 (= res!276893 (validMask!0 mask!1365))))

(assert (=> start!41450 e!270297))

(declare-fun tp_is_empty!12571 () Bool)

(assert (=> start!41450 tp_is_empty!12571))

(assert (=> start!41450 tp!39423))

(assert (=> start!41450 true))

(declare-fun array_inv!10114 (array!28935) Bool)

(assert (=> start!41450 (array_inv!10114 _keys!1025)))

(declare-fun e!270299 () Bool)

(declare-fun array_inv!10115 (array!28937) Bool)

(assert (=> start!41450 (and (array_inv!10115 _values!833) e!270299)))

(declare-fun b!463006 () Bool)

(declare-fun e!270298 () Bool)

(assert (=> b!463006 (= e!270298 tp_is_empty!12571)))

(declare-fun mapIsEmpty!20530 () Bool)

(declare-fun mapRes!20530 () Bool)

(assert (=> mapIsEmpty!20530 mapRes!20530))

(declare-fun b!463007 () Bool)

(declare-fun res!276895 () Bool)

(assert (=> b!463007 (=> (not res!276895) (not e!270297))))

(declare-datatypes ((List!8412 0))(
  ( (Nil!8409) (Cons!8408 (h!9264 (_ BitVec 64)) (t!14347 List!8412)) )
))
(declare-fun arrayNoDuplicates!0 (array!28935 (_ BitVec 32) List!8412) Bool)

(assert (=> b!463007 (= res!276895 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8409))))

(declare-fun b!463008 () Bool)

(assert (=> b!463008 (= e!270297 (bvsgt #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(declare-datatypes ((tuple2!8326 0))(
  ( (tuple2!8327 (_1!4174 (_ BitVec 64)) (_2!4174 V!17867)) )
))
(declare-datatypes ((List!8413 0))(
  ( (Nil!8410) (Cons!8409 (h!9265 tuple2!8326) (t!14348 List!8413)) )
))
(declare-datatypes ((ListLongMap!7229 0))(
  ( (ListLongMap!7230 (toList!3630 List!8413)) )
))
(declare-fun lt!209096 () ListLongMap!7229)

(declare-fun minValueBefore!38 () V!17867)

(declare-fun zeroValue!794 () V!17867)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1822 (array!28935 array!28937 (_ BitVec 32) (_ BitVec 32) V!17867 V!17867 (_ BitVec 32) Int) ListLongMap!7229)

(assert (=> b!463008 (= lt!209096 (getCurrentListMapNoExtraKeys!1822 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20530 () Bool)

(declare-fun tp!39424 () Bool)

(assert (=> mapNonEmpty!20530 (= mapRes!20530 (and tp!39424 e!270298))))

(declare-fun mapRest!20530 () (Array (_ BitVec 32) ValueCell!5942))

(declare-fun mapKey!20530 () (_ BitVec 32))

(declare-fun mapValue!20530 () ValueCell!5942)

(assert (=> mapNonEmpty!20530 (= (arr!13901 _values!833) (store mapRest!20530 mapKey!20530 mapValue!20530))))

(declare-fun b!463009 () Bool)

(declare-fun e!270300 () Bool)

(assert (=> b!463009 (= e!270300 tp_is_empty!12571)))

(declare-fun b!463010 () Bool)

(assert (=> b!463010 (= e!270299 (and e!270300 mapRes!20530))))

(declare-fun condMapEmpty!20530 () Bool)

(declare-fun mapDefault!20530 () ValueCell!5942)

(assert (=> b!463010 (= condMapEmpty!20530 (= (arr!13901 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5942)) mapDefault!20530)))))

(assert (= (and start!41450 res!276893) b!463004))

(assert (= (and b!463004 res!276896) b!463005))

(assert (= (and b!463005 res!276894) b!463007))

(assert (= (and b!463007 res!276895) b!463008))

(assert (= (and b!463010 condMapEmpty!20530) mapIsEmpty!20530))

(assert (= (and b!463010 (not condMapEmpty!20530)) mapNonEmpty!20530))

(get-info :version)

(assert (= (and mapNonEmpty!20530 ((_ is ValueCellFull!5942) mapValue!20530)) b!463006))

(assert (= (and b!463010 ((_ is ValueCellFull!5942) mapDefault!20530)) b!463009))

(assert (= start!41450 b!463010))

(declare-fun m!445189 () Bool)

(assert (=> mapNonEmpty!20530 m!445189))

(declare-fun m!445191 () Bool)

(assert (=> b!463008 m!445191))

(declare-fun m!445193 () Bool)

(assert (=> start!41450 m!445193))

(declare-fun m!445195 () Bool)

(assert (=> start!41450 m!445195))

(declare-fun m!445197 () Bool)

(assert (=> start!41450 m!445197))

(declare-fun m!445199 () Bool)

(assert (=> b!463007 m!445199))

(declare-fun m!445201 () Bool)

(assert (=> b!463005 m!445201))

(check-sat (not b!463005) b_and!19453 (not b!463008) tp_is_empty!12571 (not mapNonEmpty!20530) (not b_next!11143) (not start!41450) (not b!463007))
(check-sat b_and!19453 (not b_next!11143))
(get-model)

(declare-fun b!463063 () Bool)

(declare-fun e!270342 () Bool)

(declare-fun call!30187 () Bool)

(assert (=> b!463063 (= e!270342 call!30187)))

(declare-fun b!463064 () Bool)

(assert (=> b!463064 (= e!270342 call!30187)))

(declare-fun b!463065 () Bool)

(declare-fun e!270340 () Bool)

(assert (=> b!463065 (= e!270340 e!270342)))

(declare-fun c!56566 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!463065 (= c!56566 (validKeyInArray!0 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30184 () Bool)

(assert (=> bm!30184 (= call!30187 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56566 (Cons!8408 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000) Nil!8409) Nil!8409)))))

(declare-fun d!74799 () Bool)

(declare-fun res!276927 () Bool)

(declare-fun e!270339 () Bool)

(assert (=> d!74799 (=> res!276927 e!270339)))

(assert (=> d!74799 (= res!276927 (bvsge #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(assert (=> d!74799 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8409) e!270339)))

(declare-fun b!463066 () Bool)

(declare-fun e!270341 () Bool)

(declare-fun contains!2509 (List!8412 (_ BitVec 64)) Bool)

(assert (=> b!463066 (= e!270341 (contains!2509 Nil!8409 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!463067 () Bool)

(assert (=> b!463067 (= e!270339 e!270340)))

(declare-fun res!276928 () Bool)

(assert (=> b!463067 (=> (not res!276928) (not e!270340))))

(assert (=> b!463067 (= res!276928 (not e!270341))))

(declare-fun res!276929 () Bool)

(assert (=> b!463067 (=> (not res!276929) (not e!270341))))

(assert (=> b!463067 (= res!276929 (validKeyInArray!0 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!74799 (not res!276927)) b!463067))

(assert (= (and b!463067 res!276929) b!463066))

(assert (= (and b!463067 res!276928) b!463065))

(assert (= (and b!463065 c!56566) b!463064))

(assert (= (and b!463065 (not c!56566)) b!463063))

(assert (= (or b!463064 b!463063) bm!30184))

(declare-fun m!445231 () Bool)

(assert (=> b!463065 m!445231))

(assert (=> b!463065 m!445231))

(declare-fun m!445233 () Bool)

(assert (=> b!463065 m!445233))

(assert (=> bm!30184 m!445231))

(declare-fun m!445235 () Bool)

(assert (=> bm!30184 m!445235))

(assert (=> b!463066 m!445231))

(assert (=> b!463066 m!445231))

(declare-fun m!445237 () Bool)

(assert (=> b!463066 m!445237))

(assert (=> b!463067 m!445231))

(assert (=> b!463067 m!445231))

(assert (=> b!463067 m!445233))

(assert (=> b!463007 d!74799))

(declare-fun b!463092 () Bool)

(declare-fun e!270359 () Bool)

(declare-fun e!270358 () Bool)

(assert (=> b!463092 (= e!270359 e!270358)))

(declare-fun c!56578 () Bool)

(assert (=> b!463092 (= c!56578 (bvslt #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(declare-fun b!463093 () Bool)

(declare-fun e!270357 () ListLongMap!7229)

(assert (=> b!463093 (= e!270357 (ListLongMap!7230 Nil!8410))))

(declare-fun lt!209122 () ListLongMap!7229)

(declare-fun b!463094 () Bool)

(assert (=> b!463094 (= e!270358 (= lt!209122 (getCurrentListMapNoExtraKeys!1822 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!463095 () Bool)

(declare-fun e!270360 () Bool)

(assert (=> b!463095 (= e!270360 e!270359)))

(declare-fun c!56575 () Bool)

(declare-fun e!270361 () Bool)

(assert (=> b!463095 (= c!56575 e!270361)))

(declare-fun res!276938 () Bool)

(assert (=> b!463095 (=> (not res!276938) (not e!270361))))

(assert (=> b!463095 (= res!276938 (bvslt #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(declare-fun d!74801 () Bool)

(assert (=> d!74801 e!270360))

(declare-fun res!276941 () Bool)

(assert (=> d!74801 (=> (not res!276941) (not e!270360))))

(declare-fun contains!2510 (ListLongMap!7229 (_ BitVec 64)) Bool)

(assert (=> d!74801 (= res!276941 (not (contains!2510 lt!209122 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74801 (= lt!209122 e!270357)))

(declare-fun c!56576 () Bool)

(assert (=> d!74801 (= c!56576 (bvsge #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(assert (=> d!74801 (validMask!0 mask!1365)))

(assert (=> d!74801 (= (getCurrentListMapNoExtraKeys!1822 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209122)))

(declare-fun b!463096 () Bool)

(assert (=> b!463096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(assert (=> b!463096 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14254 _values!833)))))

(declare-fun e!270363 () Bool)

(declare-fun apply!319 (ListLongMap!7229 (_ BitVec 64)) V!17867)

(declare-fun get!6852 (ValueCell!5942 V!17867) V!17867)

(declare-fun dynLambda!915 (Int (_ BitVec 64)) V!17867)

(assert (=> b!463096 (= e!270363 (= (apply!319 lt!209122 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000)) (get!6852 (select (arr!13901 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!463097 () Bool)

(declare-datatypes ((Unit!13418 0))(
  ( (Unit!13419) )
))
(declare-fun lt!209118 () Unit!13418)

(declare-fun lt!209121 () Unit!13418)

(assert (=> b!463097 (= lt!209118 lt!209121)))

(declare-fun lt!209117 () (_ BitVec 64))

(declare-fun lt!209123 () V!17867)

(declare-fun lt!209120 () ListLongMap!7229)

(declare-fun lt!209119 () (_ BitVec 64))

(declare-fun +!1664 (ListLongMap!7229 tuple2!8326) ListLongMap!7229)

(assert (=> b!463097 (not (contains!2510 (+!1664 lt!209120 (tuple2!8327 lt!209119 lt!209123)) lt!209117))))

(declare-fun addStillNotContains!153 (ListLongMap!7229 (_ BitVec 64) V!17867 (_ BitVec 64)) Unit!13418)

(assert (=> b!463097 (= lt!209121 (addStillNotContains!153 lt!209120 lt!209119 lt!209123 lt!209117))))

(assert (=> b!463097 (= lt!209117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!463097 (= lt!209123 (get!6852 (select (arr!13901 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!463097 (= lt!209119 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30190 () ListLongMap!7229)

(assert (=> b!463097 (= lt!209120 call!30190)))

(declare-fun e!270362 () ListLongMap!7229)

(assert (=> b!463097 (= e!270362 (+!1664 call!30190 (tuple2!8327 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000) (get!6852 (select (arr!13901 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!463098 () Bool)

(assert (=> b!463098 (= e!270362 call!30190)))

(declare-fun b!463099 () Bool)

(declare-fun isEmpty!570 (ListLongMap!7229) Bool)

(assert (=> b!463099 (= e!270358 (isEmpty!570 lt!209122))))

(declare-fun b!463100 () Bool)

(assert (=> b!463100 (= e!270359 e!270363)))

(assert (=> b!463100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(declare-fun res!276939 () Bool)

(assert (=> b!463100 (= res!276939 (contains!2510 lt!209122 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!463100 (=> (not res!276939) (not e!270363))))

(declare-fun b!463101 () Bool)

(assert (=> b!463101 (= e!270361 (validKeyInArray!0 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!463101 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!463102 () Bool)

(declare-fun res!276940 () Bool)

(assert (=> b!463102 (=> (not res!276940) (not e!270360))))

(assert (=> b!463102 (= res!276940 (not (contains!2510 lt!209122 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!463103 () Bool)

(assert (=> b!463103 (= e!270357 e!270362)))

(declare-fun c!56577 () Bool)

(assert (=> b!463103 (= c!56577 (validKeyInArray!0 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30187 () Bool)

(assert (=> bm!30187 (= call!30190 (getCurrentListMapNoExtraKeys!1822 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!74801 c!56576) b!463093))

(assert (= (and d!74801 (not c!56576)) b!463103))

(assert (= (and b!463103 c!56577) b!463097))

(assert (= (and b!463103 (not c!56577)) b!463098))

(assert (= (or b!463097 b!463098) bm!30187))

(assert (= (and d!74801 res!276941) b!463102))

(assert (= (and b!463102 res!276940) b!463095))

(assert (= (and b!463095 res!276938) b!463101))

(assert (= (and b!463095 c!56575) b!463100))

(assert (= (and b!463095 (not c!56575)) b!463092))

(assert (= (and b!463100 res!276939) b!463096))

(assert (= (and b!463092 c!56578) b!463094))

(assert (= (and b!463092 (not c!56578)) b!463099))

(declare-fun b_lambda!9947 () Bool)

(assert (=> (not b_lambda!9947) (not b!463096)))

(declare-fun t!14351 () Bool)

(declare-fun tb!3895 () Bool)

(assert (=> (and start!41450 (= defaultEntry!841 defaultEntry!841) t!14351) tb!3895))

(declare-fun result!7359 () Bool)

(assert (=> tb!3895 (= result!7359 tp_is_empty!12571)))

(assert (=> b!463096 t!14351))

(declare-fun b_and!19459 () Bool)

(assert (= b_and!19453 (and (=> t!14351 result!7359) b_and!19459)))

(declare-fun b_lambda!9949 () Bool)

(assert (=> (not b_lambda!9949) (not b!463097)))

(assert (=> b!463097 t!14351))

(declare-fun b_and!19461 () Bool)

(assert (= b_and!19459 (and (=> t!14351 result!7359) b_and!19461)))

(declare-fun m!445239 () Bool)

(assert (=> b!463099 m!445239))

(assert (=> b!463100 m!445231))

(assert (=> b!463100 m!445231))

(declare-fun m!445241 () Bool)

(assert (=> b!463100 m!445241))

(assert (=> b!463096 m!445231))

(declare-fun m!445243 () Bool)

(assert (=> b!463096 m!445243))

(assert (=> b!463096 m!445231))

(declare-fun m!445245 () Bool)

(assert (=> b!463096 m!445245))

(assert (=> b!463096 m!445245))

(declare-fun m!445247 () Bool)

(assert (=> b!463096 m!445247))

(declare-fun m!445249 () Bool)

(assert (=> b!463096 m!445249))

(assert (=> b!463096 m!445247))

(declare-fun m!445251 () Bool)

(assert (=> bm!30187 m!445251))

(declare-fun m!445253 () Bool)

(assert (=> d!74801 m!445253))

(assert (=> d!74801 m!445193))

(assert (=> b!463103 m!445231))

(assert (=> b!463103 m!445231))

(assert (=> b!463103 m!445233))

(assert (=> b!463101 m!445231))

(assert (=> b!463101 m!445231))

(assert (=> b!463101 m!445233))

(declare-fun m!445255 () Bool)

(assert (=> b!463097 m!445255))

(declare-fun m!445257 () Bool)

(assert (=> b!463097 m!445257))

(assert (=> b!463097 m!445255))

(declare-fun m!445259 () Bool)

(assert (=> b!463097 m!445259))

(assert (=> b!463097 m!445231))

(assert (=> b!463097 m!445245))

(assert (=> b!463097 m!445247))

(assert (=> b!463097 m!445249))

(assert (=> b!463097 m!445247))

(declare-fun m!445261 () Bool)

(assert (=> b!463097 m!445261))

(assert (=> b!463097 m!445245))

(declare-fun m!445263 () Bool)

(assert (=> b!463102 m!445263))

(assert (=> b!463094 m!445251))

(assert (=> b!463008 d!74801))

(declare-fun d!74803 () Bool)

(assert (=> d!74803 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41450 d!74803))

(declare-fun d!74805 () Bool)

(assert (=> d!74805 (= (array_inv!10114 _keys!1025) (bvsge (size!14253 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41450 d!74805))

(declare-fun d!74807 () Bool)

(assert (=> d!74807 (= (array_inv!10115 _values!833) (bvsge (size!14254 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41450 d!74807))

(declare-fun b!463114 () Bool)

(declare-fun e!270370 () Bool)

(declare-fun call!30193 () Bool)

(assert (=> b!463114 (= e!270370 call!30193)))

(declare-fun b!463115 () Bool)

(declare-fun e!270371 () Bool)

(assert (=> b!463115 (= e!270370 e!270371)))

(declare-fun lt!209131 () (_ BitVec 64))

(assert (=> b!463115 (= lt!209131 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!209132 () Unit!13418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28935 (_ BitVec 64) (_ BitVec 32)) Unit!13418)

(assert (=> b!463115 (= lt!209132 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209131 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!463115 (arrayContainsKey!0 _keys!1025 lt!209131 #b00000000000000000000000000000000)))

(declare-fun lt!209130 () Unit!13418)

(assert (=> b!463115 (= lt!209130 lt!209132)))

(declare-fun res!276946 () Bool)

(declare-datatypes ((SeekEntryResult!3538 0))(
  ( (MissingZero!3538 (index!16331 (_ BitVec 32))) (Found!3538 (index!16332 (_ BitVec 32))) (Intermediate!3538 (undefined!4350 Bool) (index!16333 (_ BitVec 32)) (x!43234 (_ BitVec 32))) (Undefined!3538) (MissingVacant!3538 (index!16334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28935 (_ BitVec 32)) SeekEntryResult!3538)

(assert (=> b!463115 (= res!276946 (= (seekEntryOrOpen!0 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3538 #b00000000000000000000000000000000)))))

(assert (=> b!463115 (=> (not res!276946) (not e!270371))))

(declare-fun b!463116 () Bool)

(assert (=> b!463116 (= e!270371 call!30193)))

(declare-fun bm!30190 () Bool)

(assert (=> bm!30190 (= call!30193 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!74809 () Bool)

(declare-fun res!276947 () Bool)

(declare-fun e!270372 () Bool)

(assert (=> d!74809 (=> res!276947 e!270372)))

(assert (=> d!74809 (= res!276947 (bvsge #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(assert (=> d!74809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!270372)))

(declare-fun b!463117 () Bool)

(assert (=> b!463117 (= e!270372 e!270370)))

(declare-fun c!56581 () Bool)

(assert (=> b!463117 (= c!56581 (validKeyInArray!0 (select (arr!13900 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!74809 (not res!276947)) b!463117))

(assert (= (and b!463117 c!56581) b!463115))

(assert (= (and b!463117 (not c!56581)) b!463114))

(assert (= (and b!463115 res!276946) b!463116))

(assert (= (or b!463116 b!463114) bm!30190))

(assert (=> b!463115 m!445231))

(declare-fun m!445265 () Bool)

(assert (=> b!463115 m!445265))

(declare-fun m!445267 () Bool)

(assert (=> b!463115 m!445267))

(assert (=> b!463115 m!445231))

(declare-fun m!445269 () Bool)

(assert (=> b!463115 m!445269))

(declare-fun m!445271 () Bool)

(assert (=> bm!30190 m!445271))

(assert (=> b!463117 m!445231))

(assert (=> b!463117 m!445231))

(assert (=> b!463117 m!445233))

(assert (=> b!463005 d!74809))

(declare-fun condMapEmpty!20539 () Bool)

(declare-fun mapDefault!20539 () ValueCell!5942)

(assert (=> mapNonEmpty!20530 (= condMapEmpty!20539 (= mapRest!20530 ((as const (Array (_ BitVec 32) ValueCell!5942)) mapDefault!20539)))))

(declare-fun e!270377 () Bool)

(declare-fun mapRes!20539 () Bool)

(assert (=> mapNonEmpty!20530 (= tp!39424 (and e!270377 mapRes!20539))))

(declare-fun b!463125 () Bool)

(assert (=> b!463125 (= e!270377 tp_is_empty!12571)))

(declare-fun b!463124 () Bool)

(declare-fun e!270378 () Bool)

(assert (=> b!463124 (= e!270378 tp_is_empty!12571)))

(declare-fun mapIsEmpty!20539 () Bool)

(assert (=> mapIsEmpty!20539 mapRes!20539))

(declare-fun mapNonEmpty!20539 () Bool)

(declare-fun tp!39439 () Bool)

(assert (=> mapNonEmpty!20539 (= mapRes!20539 (and tp!39439 e!270378))))

(declare-fun mapValue!20539 () ValueCell!5942)

(declare-fun mapKey!20539 () (_ BitVec 32))

(declare-fun mapRest!20539 () (Array (_ BitVec 32) ValueCell!5942))

(assert (=> mapNonEmpty!20539 (= mapRest!20530 (store mapRest!20539 mapKey!20539 mapValue!20539))))

(assert (= (and mapNonEmpty!20530 condMapEmpty!20539) mapIsEmpty!20539))

(assert (= (and mapNonEmpty!20530 (not condMapEmpty!20539)) mapNonEmpty!20539))

(assert (= (and mapNonEmpty!20539 ((_ is ValueCellFull!5942) mapValue!20539)) b!463124))

(assert (= (and mapNonEmpty!20530 ((_ is ValueCellFull!5942) mapDefault!20539)) b!463125))

(declare-fun m!445273 () Bool)

(assert (=> mapNonEmpty!20539 m!445273))

(declare-fun b_lambda!9951 () Bool)

(assert (= b_lambda!9947 (or (and start!41450 b_free!11143) b_lambda!9951)))

(declare-fun b_lambda!9953 () Bool)

(assert (= b_lambda!9949 (or (and start!41450 b_free!11143) b_lambda!9953)))

(check-sat (not bm!30187) (not b!463103) (not b!463096) (not b!463066) (not b_lambda!9951) (not b_next!11143) (not b!463101) (not b!463099) (not b!463067) (not d!74801) (not b!463065) (not bm!30184) (not b_lambda!9953) (not b!463100) tp_is_empty!12571 b_and!19461 (not mapNonEmpty!20539) (not bm!30190) (not b!463115) (not b!463117) (not b!463102) (not b!463097) (not b!463094))
(check-sat b_and!19461 (not b_next!11143))
