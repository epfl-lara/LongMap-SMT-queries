; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106152 () Bool)

(assert start!106152)

(declare-fun b_free!27457 () Bool)

(declare-fun b_next!27457 () Bool)

(assert (=> start!106152 (= b_free!27457 (not b_next!27457))))

(declare-fun tp!95905 () Bool)

(declare-fun b_and!45375 () Bool)

(assert (=> start!106152 (= tp!95905 b_and!45375)))

(declare-fun b!1262938 () Bool)

(declare-fun e!718925 () Bool)

(declare-fun tp_is_empty!32359 () Bool)

(assert (=> b!1262938 (= e!718925 tp_is_empty!32359)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!48511 0))(
  ( (V!48512 (val!16242 Int)) )
))
(declare-fun zeroValue!871 () V!48511)

(declare-datatypes ((array!82379 0))(
  ( (array!82380 (arr!39737 (Array (_ BitVec 32) (_ BitVec 64))) (size!40274 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82379)

(declare-datatypes ((ValueCell!15416 0))(
  ( (ValueCellFull!15416 (v!18942 V!48511)) (EmptyCell!15416) )
))
(declare-datatypes ((array!82381 0))(
  ( (array!82382 (arr!39738 (Array (_ BitVec 32) ValueCell!15416)) (size!40275 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82381)

(declare-fun minValueBefore!43 () V!48511)

(declare-fun e!718930 () Bool)

(declare-fun b!1262939 () Bool)

(declare-datatypes ((tuple2!21034 0))(
  ( (tuple2!21035 (_1!10528 (_ BitVec 64)) (_2!10528 V!48511)) )
))
(declare-datatypes ((List!28257 0))(
  ( (Nil!28254) (Cons!28253 (h!29471 tuple2!21034) (t!41750 List!28257)) )
))
(declare-datatypes ((ListLongMap!18915 0))(
  ( (ListLongMap!18916 (toList!9473 List!28257)) )
))
(declare-fun contains!7609 (ListLongMap!18915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4626 (array!82379 array!82381 (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 (_ BitVec 32) Int) ListLongMap!18915)

(assert (=> b!1262939 (= e!718930 (not (contains!7609 (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262940 () Bool)

(declare-fun res!841190 () Bool)

(declare-fun e!718929 () Bool)

(assert (=> b!1262940 (=> (not res!841190) (not e!718929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82379 (_ BitVec 32)) Bool)

(assert (=> b!1262940 (= res!841190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262941 () Bool)

(declare-fun res!841188 () Bool)

(assert (=> b!1262941 (=> (not res!841188) (not e!718929))))

(declare-datatypes ((List!28258 0))(
  ( (Nil!28255) (Cons!28254 (h!29472 (_ BitVec 64)) (t!41751 List!28258)) )
))
(declare-fun arrayNoDuplicates!0 (array!82379 (_ BitVec 32) List!28258) Bool)

(assert (=> b!1262941 (= res!841188 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28255))))

(declare-fun res!841189 () Bool)

(assert (=> start!106152 (=> (not res!841189) (not e!718929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106152 (= res!841189 (validMask!0 mask!1466))))

(assert (=> start!106152 e!718929))

(assert (=> start!106152 true))

(assert (=> start!106152 tp!95905))

(assert (=> start!106152 tp_is_empty!32359))

(declare-fun array_inv!30403 (array!82379) Bool)

(assert (=> start!106152 (array_inv!30403 _keys!1118)))

(declare-fun e!718926 () Bool)

(declare-fun array_inv!30404 (array!82381) Bool)

(assert (=> start!106152 (and (array_inv!30404 _values!914) e!718926)))

(declare-fun b!1262942 () Bool)

(assert (=> b!1262942 (= e!718929 (not e!718930))))

(declare-fun res!841191 () Bool)

(assert (=> b!1262942 (=> res!841191 e!718930)))

(assert (=> b!1262942 (= res!841191 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!572183 () ListLongMap!18915)

(declare-fun lt!572182 () ListLongMap!18915)

(assert (=> b!1262942 (= lt!572183 lt!572182)))

(declare-fun minValueAfter!43 () V!48511)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!42038 0))(
  ( (Unit!42039) )
))
(declare-fun lt!572181 () Unit!42038)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1169 (array!82379 array!82381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 V!48511 V!48511 (_ BitVec 32) Int) Unit!42038)

(assert (=> b!1262942 (= lt!572181 (lemmaNoChangeToArrayThenSameMapNoExtras!1169 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5879 (array!82379 array!82381 (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 (_ BitVec 32) Int) ListLongMap!18915)

(assert (=> b!1262942 (= lt!572182 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262942 (= lt!572183 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262943 () Bool)

(declare-fun res!841187 () Bool)

(assert (=> b!1262943 (=> (not res!841187) (not e!718929))))

(assert (=> b!1262943 (= res!841187 (and (= (size!40275 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40274 _keys!1118) (size!40275 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50344 () Bool)

(declare-fun mapRes!50344 () Bool)

(assert (=> mapIsEmpty!50344 mapRes!50344))

(declare-fun b!1262944 () Bool)

(declare-fun e!718927 () Bool)

(assert (=> b!1262944 (= e!718926 (and e!718927 mapRes!50344))))

(declare-fun condMapEmpty!50344 () Bool)

(declare-fun mapDefault!50344 () ValueCell!15416)

(assert (=> b!1262944 (= condMapEmpty!50344 (= (arr!39738 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15416)) mapDefault!50344)))))

(declare-fun mapNonEmpty!50344 () Bool)

(declare-fun tp!95906 () Bool)

(assert (=> mapNonEmpty!50344 (= mapRes!50344 (and tp!95906 e!718925))))

(declare-fun mapKey!50344 () (_ BitVec 32))

(declare-fun mapValue!50344 () ValueCell!15416)

(declare-fun mapRest!50344 () (Array (_ BitVec 32) ValueCell!15416))

(assert (=> mapNonEmpty!50344 (= (arr!39738 _values!914) (store mapRest!50344 mapKey!50344 mapValue!50344))))

(declare-fun b!1262945 () Bool)

(assert (=> b!1262945 (= e!718927 tp_is_empty!32359)))

(assert (= (and start!106152 res!841189) b!1262943))

(assert (= (and b!1262943 res!841187) b!1262940))

(assert (= (and b!1262940 res!841190) b!1262941))

(assert (= (and b!1262941 res!841188) b!1262942))

(assert (= (and b!1262942 (not res!841191)) b!1262939))

(assert (= (and b!1262944 condMapEmpty!50344) mapIsEmpty!50344))

(assert (= (and b!1262944 (not condMapEmpty!50344)) mapNonEmpty!50344))

(get-info :version)

(assert (= (and mapNonEmpty!50344 ((_ is ValueCellFull!15416) mapValue!50344)) b!1262938))

(assert (= (and b!1262944 ((_ is ValueCellFull!15416) mapDefault!50344)) b!1262945))

(assert (= start!106152 b!1262944))

(declare-fun m!1163821 () Bool)

(assert (=> b!1262941 m!1163821))

(declare-fun m!1163823 () Bool)

(assert (=> b!1262939 m!1163823))

(assert (=> b!1262939 m!1163823))

(declare-fun m!1163825 () Bool)

(assert (=> b!1262939 m!1163825))

(declare-fun m!1163827 () Bool)

(assert (=> mapNonEmpty!50344 m!1163827))

(declare-fun m!1163829 () Bool)

(assert (=> start!106152 m!1163829))

(declare-fun m!1163831 () Bool)

(assert (=> start!106152 m!1163831))

(declare-fun m!1163833 () Bool)

(assert (=> start!106152 m!1163833))

(declare-fun m!1163835 () Bool)

(assert (=> b!1262940 m!1163835))

(declare-fun m!1163837 () Bool)

(assert (=> b!1262942 m!1163837))

(declare-fun m!1163839 () Bool)

(assert (=> b!1262942 m!1163839))

(declare-fun m!1163841 () Bool)

(assert (=> b!1262942 m!1163841))

(check-sat (not b!1262942) tp_is_empty!32359 (not start!106152) (not b!1262939) (not mapNonEmpty!50344) (not b_next!27457) b_and!45375 (not b!1262940) (not b!1262941))
(check-sat b_and!45375 (not b_next!27457))
(get-model)

(declare-fun d!138911 () Bool)

(declare-fun e!718972 () Bool)

(assert (=> d!138911 e!718972))

(declare-fun res!841224 () Bool)

(assert (=> d!138911 (=> res!841224 e!718972)))

(declare-fun lt!572213 () Bool)

(assert (=> d!138911 (= res!841224 (not lt!572213))))

(declare-fun lt!572210 () Bool)

(assert (=> d!138911 (= lt!572213 lt!572210)))

(declare-fun lt!572211 () Unit!42038)

(declare-fun e!718971 () Unit!42038)

(assert (=> d!138911 (= lt!572211 e!718971)))

(declare-fun c!123073 () Bool)

(assert (=> d!138911 (= c!123073 lt!572210)))

(declare-fun containsKey!622 (List!28257 (_ BitVec 64)) Bool)

(assert (=> d!138911 (= lt!572210 (containsKey!622 (toList!9473 (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138911 (= (contains!7609 (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000) lt!572213)))

(declare-fun b!1263000 () Bool)

(declare-fun lt!572212 () Unit!42038)

(assert (=> b!1263000 (= e!718971 lt!572212)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!431 (List!28257 (_ BitVec 64)) Unit!42038)

(assert (=> b!1263000 (= lt!572212 (lemmaContainsKeyImpliesGetValueByKeyDefined!431 (toList!9473 (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!707 0))(
  ( (Some!706 (v!18945 V!48511)) (None!705) )
))
(declare-fun isDefined!469 (Option!707) Bool)

(declare-fun getValueByKey!656 (List!28257 (_ BitVec 64)) Option!707)

(assert (=> b!1263000 (isDefined!469 (getValueByKey!656 (toList!9473 (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263001 () Bool)

(declare-fun Unit!42040 () Unit!42038)

(assert (=> b!1263001 (= e!718971 Unit!42040)))

(declare-fun b!1263002 () Bool)

(assert (=> b!1263002 (= e!718972 (isDefined!469 (getValueByKey!656 (toList!9473 (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138911 c!123073) b!1263000))

(assert (= (and d!138911 (not c!123073)) b!1263001))

(assert (= (and d!138911 (not res!841224)) b!1263002))

(declare-fun m!1163887 () Bool)

(assert (=> d!138911 m!1163887))

(declare-fun m!1163889 () Bool)

(assert (=> b!1263000 m!1163889))

(declare-fun m!1163891 () Bool)

(assert (=> b!1263000 m!1163891))

(assert (=> b!1263000 m!1163891))

(declare-fun m!1163893 () Bool)

(assert (=> b!1263000 m!1163893))

(assert (=> b!1263002 m!1163891))

(assert (=> b!1263002 m!1163891))

(assert (=> b!1263002 m!1163893))

(assert (=> b!1262939 d!138911))

(declare-fun d!138913 () Bool)

(declare-fun e!719001 () Bool)

(assert (=> d!138913 e!719001))

(declare-fun res!841244 () Bool)

(assert (=> d!138913 (=> (not res!841244) (not e!719001))))

(assert (=> d!138913 (= res!841244 (or (bvsge #b00000000000000000000000000000000 (size!40274 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))))

(declare-fun lt!572264 () ListLongMap!18915)

(declare-fun lt!572261 () ListLongMap!18915)

(assert (=> d!138913 (= lt!572264 lt!572261)))

(declare-fun lt!572263 () Unit!42038)

(declare-fun e!719008 () Unit!42038)

(assert (=> d!138913 (= lt!572263 e!719008)))

(declare-fun c!123091 () Bool)

(declare-fun e!719003 () Bool)

(assert (=> d!138913 (= c!123091 e!719003)))

(declare-fun res!841243 () Bool)

(assert (=> d!138913 (=> (not res!841243) (not e!719003))))

(assert (=> d!138913 (= res!841243 (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun e!719002 () ListLongMap!18915)

(assert (=> d!138913 (= lt!572261 e!719002)))

(declare-fun c!123090 () Bool)

(assert (=> d!138913 (= c!123090 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138913 (validMask!0 mask!1466)))

(assert (=> d!138913 (= (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572264)))

(declare-fun b!1263045 () Bool)

(declare-fun e!719009 () Bool)

(declare-fun call!62046 () Bool)

(assert (=> b!1263045 (= e!719009 (not call!62046))))

(declare-fun b!1263046 () Bool)

(declare-fun e!719005 () Bool)

(declare-fun apply!1004 (ListLongMap!18915 (_ BitVec 64)) V!48511)

(assert (=> b!1263046 (= e!719005 (= (apply!1004 lt!572264 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263047 () Bool)

(declare-fun call!62050 () ListLongMap!18915)

(declare-fun +!4287 (ListLongMap!18915 tuple2!21034) ListLongMap!18915)

(assert (=> b!1263047 (= e!719002 (+!4287 call!62050 (tuple2!21035 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263048 () Bool)

(declare-fun res!841247 () Bool)

(assert (=> b!1263048 (=> (not res!841247) (not e!719001))))

(declare-fun e!719010 () Bool)

(assert (=> b!1263048 (= res!841247 e!719010)))

(declare-fun res!841248 () Bool)

(assert (=> b!1263048 (=> res!841248 e!719010)))

(declare-fun e!719004 () Bool)

(assert (=> b!1263048 (= res!841248 (not e!719004))))

(declare-fun res!841249 () Bool)

(assert (=> b!1263048 (=> (not res!841249) (not e!719004))))

(assert (=> b!1263048 (= res!841249 (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun b!1263049 () Bool)

(declare-fun e!718999 () Bool)

(assert (=> b!1263049 (= e!719009 e!718999)))

(declare-fun res!841246 () Bool)

(assert (=> b!1263049 (= res!841246 call!62046)))

(assert (=> b!1263049 (=> (not res!841246) (not e!718999))))

(declare-fun e!719011 () Bool)

(declare-fun b!1263050 () Bool)

(declare-fun get!20317 (ValueCell!15416 V!48511) V!48511)

(declare-fun dynLambda!3456 (Int (_ BitVec 64)) V!48511)

(assert (=> b!1263050 (= e!719011 (= (apply!1004 lt!572264 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)) (get!20317 (select (arr!39738 _values!914) #b00000000000000000000000000000000) (dynLambda!3456 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40275 _values!914)))))

(assert (=> b!1263050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun b!1263051 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263051 (= e!719003 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62043 () Bool)

(declare-fun call!62047 () ListLongMap!18915)

(declare-fun call!62048 () ListLongMap!18915)

(assert (=> bm!62043 (= call!62047 call!62048)))

(declare-fun bm!62044 () Bool)

(declare-fun call!62051 () ListLongMap!18915)

(assert (=> bm!62044 (= call!62048 call!62051)))

(declare-fun b!1263052 () Bool)

(declare-fun e!719006 () ListLongMap!18915)

(assert (=> b!1263052 (= e!719006 call!62047)))

(declare-fun b!1263053 () Bool)

(declare-fun e!719007 () Bool)

(declare-fun call!62049 () Bool)

(assert (=> b!1263053 (= e!719007 (not call!62049))))

(declare-fun b!1263054 () Bool)

(assert (=> b!1263054 (= e!718999 (= (apply!1004 lt!572264 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263055 () Bool)

(declare-fun lt!572277 () Unit!42038)

(assert (=> b!1263055 (= e!719008 lt!572277)))

(declare-fun lt!572270 () ListLongMap!18915)

(assert (=> b!1263055 (= lt!572270 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572272 () (_ BitVec 64))

(assert (=> b!1263055 (= lt!572272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572258 () (_ BitVec 64))

(assert (=> b!1263055 (= lt!572258 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572278 () Unit!42038)

(declare-fun addStillContains!1093 (ListLongMap!18915 (_ BitVec 64) V!48511 (_ BitVec 64)) Unit!42038)

(assert (=> b!1263055 (= lt!572278 (addStillContains!1093 lt!572270 lt!572272 zeroValue!871 lt!572258))))

(assert (=> b!1263055 (contains!7609 (+!4287 lt!572270 (tuple2!21035 lt!572272 zeroValue!871)) lt!572258)))

(declare-fun lt!572276 () Unit!42038)

(assert (=> b!1263055 (= lt!572276 lt!572278)))

(declare-fun lt!572262 () ListLongMap!18915)

(assert (=> b!1263055 (= lt!572262 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572269 () (_ BitVec 64))

(assert (=> b!1263055 (= lt!572269 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572265 () (_ BitVec 64))

(assert (=> b!1263055 (= lt!572265 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572259 () Unit!42038)

(declare-fun addApplyDifferent!535 (ListLongMap!18915 (_ BitVec 64) V!48511 (_ BitVec 64)) Unit!42038)

(assert (=> b!1263055 (= lt!572259 (addApplyDifferent!535 lt!572262 lt!572269 minValueBefore!43 lt!572265))))

(assert (=> b!1263055 (= (apply!1004 (+!4287 lt!572262 (tuple2!21035 lt!572269 minValueBefore!43)) lt!572265) (apply!1004 lt!572262 lt!572265))))

(declare-fun lt!572279 () Unit!42038)

(assert (=> b!1263055 (= lt!572279 lt!572259)))

(declare-fun lt!572271 () ListLongMap!18915)

(assert (=> b!1263055 (= lt!572271 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572273 () (_ BitVec 64))

(assert (=> b!1263055 (= lt!572273 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572275 () (_ BitVec 64))

(assert (=> b!1263055 (= lt!572275 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572274 () Unit!42038)

(assert (=> b!1263055 (= lt!572274 (addApplyDifferent!535 lt!572271 lt!572273 zeroValue!871 lt!572275))))

(assert (=> b!1263055 (= (apply!1004 (+!4287 lt!572271 (tuple2!21035 lt!572273 zeroValue!871)) lt!572275) (apply!1004 lt!572271 lt!572275))))

(declare-fun lt!572260 () Unit!42038)

(assert (=> b!1263055 (= lt!572260 lt!572274)))

(declare-fun lt!572267 () ListLongMap!18915)

(assert (=> b!1263055 (= lt!572267 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572268 () (_ BitVec 64))

(assert (=> b!1263055 (= lt!572268 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572266 () (_ BitVec 64))

(assert (=> b!1263055 (= lt!572266 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263055 (= lt!572277 (addApplyDifferent!535 lt!572267 lt!572268 minValueBefore!43 lt!572266))))

(assert (=> b!1263055 (= (apply!1004 (+!4287 lt!572267 (tuple2!21035 lt!572268 minValueBefore!43)) lt!572266) (apply!1004 lt!572267 lt!572266))))

(declare-fun bm!62045 () Bool)

(assert (=> bm!62045 (= call!62049 (contains!7609 lt!572264 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263056 () Bool)

(declare-fun e!719000 () ListLongMap!18915)

(declare-fun call!62052 () ListLongMap!18915)

(assert (=> b!1263056 (= e!719000 call!62052)))

(declare-fun b!1263057 () Bool)

(assert (=> b!1263057 (= e!719001 e!719007)))

(declare-fun c!123086 () Bool)

(assert (=> b!1263057 (= c!123086 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263058 () Bool)

(declare-fun c!123088 () Bool)

(assert (=> b!1263058 (= c!123088 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263058 (= e!719000 e!719006)))

(declare-fun b!1263059 () Bool)

(assert (=> b!1263059 (= e!719007 e!719005)))

(declare-fun res!841250 () Bool)

(assert (=> b!1263059 (= res!841250 call!62049)))

(assert (=> b!1263059 (=> (not res!841250) (not e!719005))))

(declare-fun b!1263060 () Bool)

(assert (=> b!1263060 (= e!719002 e!719000)))

(declare-fun c!123087 () Bool)

(assert (=> b!1263060 (= c!123087 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263061 () Bool)

(declare-fun Unit!42041 () Unit!42038)

(assert (=> b!1263061 (= e!719008 Unit!42041)))

(declare-fun b!1263062 () Bool)

(declare-fun res!841251 () Bool)

(assert (=> b!1263062 (=> (not res!841251) (not e!719001))))

(assert (=> b!1263062 (= res!841251 e!719009)))

(declare-fun c!123089 () Bool)

(assert (=> b!1263062 (= c!123089 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62046 () Bool)

(assert (=> bm!62046 (= call!62046 (contains!7609 lt!572264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62047 () Bool)

(assert (=> bm!62047 (= call!62052 call!62050)))

(declare-fun b!1263063 () Bool)

(assert (=> b!1263063 (= e!719010 e!719011)))

(declare-fun res!841245 () Bool)

(assert (=> b!1263063 (=> (not res!841245) (not e!719011))))

(assert (=> b!1263063 (= res!841245 (contains!7609 lt!572264 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun b!1263064 () Bool)

(assert (=> b!1263064 (= e!719004 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62048 () Bool)

(assert (=> bm!62048 (= call!62050 (+!4287 (ite c!123090 call!62051 (ite c!123087 call!62048 call!62047)) (ite (or c!123090 c!123087) (tuple2!21035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21035 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!62049 () Bool)

(assert (=> bm!62049 (= call!62051 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263065 () Bool)

(assert (=> b!1263065 (= e!719006 call!62052)))

(assert (= (and d!138913 c!123090) b!1263047))

(assert (= (and d!138913 (not c!123090)) b!1263060))

(assert (= (and b!1263060 c!123087) b!1263056))

(assert (= (and b!1263060 (not c!123087)) b!1263058))

(assert (= (and b!1263058 c!123088) b!1263065))

(assert (= (and b!1263058 (not c!123088)) b!1263052))

(assert (= (or b!1263065 b!1263052) bm!62043))

(assert (= (or b!1263056 bm!62043) bm!62044))

(assert (= (or b!1263056 b!1263065) bm!62047))

(assert (= (or b!1263047 bm!62044) bm!62049))

(assert (= (or b!1263047 bm!62047) bm!62048))

(assert (= (and d!138913 res!841243) b!1263051))

(assert (= (and d!138913 c!123091) b!1263055))

(assert (= (and d!138913 (not c!123091)) b!1263061))

(assert (= (and d!138913 res!841244) b!1263048))

(assert (= (and b!1263048 res!841249) b!1263064))

(assert (= (and b!1263048 (not res!841248)) b!1263063))

(assert (= (and b!1263063 res!841245) b!1263050))

(assert (= (and b!1263048 res!841247) b!1263062))

(assert (= (and b!1263062 c!123089) b!1263049))

(assert (= (and b!1263062 (not c!123089)) b!1263045))

(assert (= (and b!1263049 res!841246) b!1263054))

(assert (= (or b!1263049 b!1263045) bm!62046))

(assert (= (and b!1263062 res!841251) b!1263057))

(assert (= (and b!1263057 c!123086) b!1263059))

(assert (= (and b!1263057 (not c!123086)) b!1263053))

(assert (= (and b!1263059 res!841250) b!1263046))

(assert (= (or b!1263059 b!1263053) bm!62045))

(declare-fun b_lambda!22801 () Bool)

(assert (=> (not b_lambda!22801) (not b!1263050)))

(declare-fun t!41753 () Bool)

(declare-fun tb!11309 () Bool)

(assert (=> (and start!106152 (= defaultEntry!922 defaultEntry!922) t!41753) tb!11309))

(declare-fun result!23351 () Bool)

(assert (=> tb!11309 (= result!23351 tp_is_empty!32359)))

(assert (=> b!1263050 t!41753))

(declare-fun b_and!45381 () Bool)

(assert (= b_and!45375 (and (=> t!41753 result!23351) b_and!45381)))

(declare-fun m!1163895 () Bool)

(assert (=> b!1263051 m!1163895))

(assert (=> b!1263051 m!1163895))

(declare-fun m!1163897 () Bool)

(assert (=> b!1263051 m!1163897))

(assert (=> b!1263063 m!1163895))

(assert (=> b!1263063 m!1163895))

(declare-fun m!1163899 () Bool)

(assert (=> b!1263063 m!1163899))

(declare-fun m!1163901 () Bool)

(assert (=> bm!62048 m!1163901))

(declare-fun m!1163903 () Bool)

(assert (=> b!1263046 m!1163903))

(declare-fun m!1163905 () Bool)

(assert (=> b!1263050 m!1163905))

(declare-fun m!1163907 () Bool)

(assert (=> b!1263050 m!1163907))

(declare-fun m!1163909 () Bool)

(assert (=> b!1263050 m!1163909))

(assert (=> b!1263050 m!1163907))

(assert (=> b!1263050 m!1163905))

(assert (=> b!1263050 m!1163895))

(assert (=> b!1263050 m!1163895))

(declare-fun m!1163911 () Bool)

(assert (=> b!1263050 m!1163911))

(assert (=> bm!62049 m!1163841))

(declare-fun m!1163913 () Bool)

(assert (=> bm!62045 m!1163913))

(declare-fun m!1163915 () Bool)

(assert (=> b!1263047 m!1163915))

(declare-fun m!1163917 () Bool)

(assert (=> b!1263054 m!1163917))

(assert (=> b!1263064 m!1163895))

(assert (=> b!1263064 m!1163895))

(assert (=> b!1263064 m!1163897))

(declare-fun m!1163919 () Bool)

(assert (=> b!1263055 m!1163919))

(declare-fun m!1163921 () Bool)

(assert (=> b!1263055 m!1163921))

(declare-fun m!1163923 () Bool)

(assert (=> b!1263055 m!1163923))

(declare-fun m!1163925 () Bool)

(assert (=> b!1263055 m!1163925))

(declare-fun m!1163927 () Bool)

(assert (=> b!1263055 m!1163927))

(assert (=> b!1263055 m!1163841))

(assert (=> b!1263055 m!1163925))

(declare-fun m!1163929 () Bool)

(assert (=> b!1263055 m!1163929))

(declare-fun m!1163931 () Bool)

(assert (=> b!1263055 m!1163931))

(declare-fun m!1163933 () Bool)

(assert (=> b!1263055 m!1163933))

(assert (=> b!1263055 m!1163921))

(declare-fun m!1163935 () Bool)

(assert (=> b!1263055 m!1163935))

(declare-fun m!1163937 () Bool)

(assert (=> b!1263055 m!1163937))

(declare-fun m!1163939 () Bool)

(assert (=> b!1263055 m!1163939))

(assert (=> b!1263055 m!1163895))

(declare-fun m!1163941 () Bool)

(assert (=> b!1263055 m!1163941))

(assert (=> b!1263055 m!1163941))

(declare-fun m!1163943 () Bool)

(assert (=> b!1263055 m!1163943))

(assert (=> b!1263055 m!1163923))

(declare-fun m!1163945 () Bool)

(assert (=> b!1263055 m!1163945))

(declare-fun m!1163947 () Bool)

(assert (=> b!1263055 m!1163947))

(assert (=> d!138913 m!1163829))

(declare-fun m!1163949 () Bool)

(assert (=> bm!62046 m!1163949))

(assert (=> b!1262939 d!138913))

(declare-fun d!138915 () Bool)

(assert (=> d!138915 (= (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572282 () Unit!42038)

(declare-fun choose!1872 (array!82379 array!82381 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48511 V!48511 V!48511 V!48511 (_ BitVec 32) Int) Unit!42038)

(assert (=> d!138915 (= lt!572282 (choose!1872 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138915 (validMask!0 mask!1466)))

(assert (=> d!138915 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1169 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572282)))

(declare-fun bs!35728 () Bool)

(assert (= bs!35728 d!138915))

(assert (=> bs!35728 m!1163841))

(assert (=> bs!35728 m!1163839))

(declare-fun m!1163951 () Bool)

(assert (=> bs!35728 m!1163951))

(assert (=> bs!35728 m!1163829))

(assert (=> b!1262942 d!138915))

(declare-fun b!1263092 () Bool)

(declare-fun e!719032 () Bool)

(assert (=> b!1263092 (= e!719032 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263092 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263094 () Bool)

(declare-fun e!719028 () Bool)

(declare-fun e!719030 () Bool)

(assert (=> b!1263094 (= e!719028 e!719030)))

(assert (=> b!1263094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun res!841263 () Bool)

(declare-fun lt!572300 () ListLongMap!18915)

(assert (=> b!1263094 (= res!841263 (contains!7609 lt!572300 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263094 (=> (not res!841263) (not e!719030))))

(declare-fun b!1263095 () Bool)

(declare-fun e!719026 () Bool)

(declare-fun isEmpty!1041 (ListLongMap!18915) Bool)

(assert (=> b!1263095 (= e!719026 (isEmpty!1041 lt!572300))))

(declare-fun b!1263096 () Bool)

(declare-fun e!719029 () ListLongMap!18915)

(declare-fun call!62055 () ListLongMap!18915)

(assert (=> b!1263096 (= e!719029 call!62055)))

(declare-fun b!1263097 () Bool)

(declare-fun e!719031 () ListLongMap!18915)

(assert (=> b!1263097 (= e!719031 (ListLongMap!18916 Nil!28254))))

(declare-fun b!1263098 () Bool)

(declare-fun res!841262 () Bool)

(declare-fun e!719027 () Bool)

(assert (=> b!1263098 (=> (not res!841262) (not e!719027))))

(assert (=> b!1263098 (= res!841262 (not (contains!7609 lt!572300 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!62052 () Bool)

(assert (=> bm!62052 (= call!62055 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263099 () Bool)

(assert (=> b!1263099 (= e!719026 (= lt!572300 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263100 () Bool)

(declare-fun lt!572299 () Unit!42038)

(declare-fun lt!572301 () Unit!42038)

(assert (=> b!1263100 (= lt!572299 lt!572301)))

(declare-fun lt!572298 () ListLongMap!18915)

(declare-fun lt!572303 () (_ BitVec 64))

(declare-fun lt!572302 () (_ BitVec 64))

(declare-fun lt!572297 () V!48511)

(assert (=> b!1263100 (not (contains!7609 (+!4287 lt!572298 (tuple2!21035 lt!572303 lt!572297)) lt!572302))))

(declare-fun addStillNotContains!325 (ListLongMap!18915 (_ BitVec 64) V!48511 (_ BitVec 64)) Unit!42038)

(assert (=> b!1263100 (= lt!572301 (addStillNotContains!325 lt!572298 lt!572303 lt!572297 lt!572302))))

(assert (=> b!1263100 (= lt!572302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263100 (= lt!572297 (get!20317 (select (arr!39738 _values!914) #b00000000000000000000000000000000) (dynLambda!3456 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263100 (= lt!572303 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263100 (= lt!572298 call!62055)))

(assert (=> b!1263100 (= e!719029 (+!4287 call!62055 (tuple2!21035 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000) (get!20317 (select (arr!39738 _values!914) #b00000000000000000000000000000000) (dynLambda!3456 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263101 () Bool)

(assert (=> b!1263101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(assert (=> b!1263101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40275 _values!914)))))

(assert (=> b!1263101 (= e!719030 (= (apply!1004 lt!572300 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)) (get!20317 (select (arr!39738 _values!914) #b00000000000000000000000000000000) (dynLambda!3456 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!138917 () Bool)

(assert (=> d!138917 e!719027))

(declare-fun res!841260 () Bool)

(assert (=> d!138917 (=> (not res!841260) (not e!719027))))

(assert (=> d!138917 (= res!841260 (not (contains!7609 lt!572300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138917 (= lt!572300 e!719031)))

(declare-fun c!123100 () Bool)

(assert (=> d!138917 (= c!123100 (bvsge #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(assert (=> d!138917 (validMask!0 mask!1466)))

(assert (=> d!138917 (= (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572300)))

(declare-fun b!1263093 () Bool)

(assert (=> b!1263093 (= e!719028 e!719026)))

(declare-fun c!123103 () Bool)

(assert (=> b!1263093 (= c!123103 (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun b!1263102 () Bool)

(assert (=> b!1263102 (= e!719027 e!719028)))

(declare-fun c!123102 () Bool)

(assert (=> b!1263102 (= c!123102 e!719032)))

(declare-fun res!841261 () Bool)

(assert (=> b!1263102 (=> (not res!841261) (not e!719032))))

(assert (=> b!1263102 (= res!841261 (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun b!1263103 () Bool)

(assert (=> b!1263103 (= e!719031 e!719029)))

(declare-fun c!123101 () Bool)

(assert (=> b!1263103 (= c!123101 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138917 c!123100) b!1263097))

(assert (= (and d!138917 (not c!123100)) b!1263103))

(assert (= (and b!1263103 c!123101) b!1263100))

(assert (= (and b!1263103 (not c!123101)) b!1263096))

(assert (= (or b!1263100 b!1263096) bm!62052))

(assert (= (and d!138917 res!841260) b!1263098))

(assert (= (and b!1263098 res!841262) b!1263102))

(assert (= (and b!1263102 res!841261) b!1263092))

(assert (= (and b!1263102 c!123102) b!1263094))

(assert (= (and b!1263102 (not c!123102)) b!1263093))

(assert (= (and b!1263094 res!841263) b!1263101))

(assert (= (and b!1263093 c!123103) b!1263099))

(assert (= (and b!1263093 (not c!123103)) b!1263095))

(declare-fun b_lambda!22803 () Bool)

(assert (=> (not b_lambda!22803) (not b!1263100)))

(assert (=> b!1263100 t!41753))

(declare-fun b_and!45383 () Bool)

(assert (= b_and!45381 (and (=> t!41753 result!23351) b_and!45383)))

(declare-fun b_lambda!22805 () Bool)

(assert (=> (not b_lambda!22805) (not b!1263101)))

(assert (=> b!1263101 t!41753))

(declare-fun b_and!45385 () Bool)

(assert (= b_and!45383 (and (=> t!41753 result!23351) b_and!45385)))

(assert (=> b!1263094 m!1163895))

(assert (=> b!1263094 m!1163895))

(declare-fun m!1163953 () Bool)

(assert (=> b!1263094 m!1163953))

(declare-fun m!1163955 () Bool)

(assert (=> d!138917 m!1163955))

(assert (=> d!138917 m!1163829))

(assert (=> b!1263100 m!1163895))

(declare-fun m!1163957 () Bool)

(assert (=> b!1263100 m!1163957))

(assert (=> b!1263100 m!1163907))

(declare-fun m!1163959 () Bool)

(assert (=> b!1263100 m!1163959))

(assert (=> b!1263100 m!1163905))

(declare-fun m!1163961 () Bool)

(assert (=> b!1263100 m!1163961))

(assert (=> b!1263100 m!1163961))

(declare-fun m!1163963 () Bool)

(assert (=> b!1263100 m!1163963))

(assert (=> b!1263100 m!1163905))

(assert (=> b!1263100 m!1163907))

(assert (=> b!1263100 m!1163909))

(declare-fun m!1163965 () Bool)

(assert (=> bm!62052 m!1163965))

(assert (=> b!1263092 m!1163895))

(assert (=> b!1263092 m!1163895))

(assert (=> b!1263092 m!1163897))

(assert (=> b!1263103 m!1163895))

(assert (=> b!1263103 m!1163895))

(assert (=> b!1263103 m!1163897))

(declare-fun m!1163967 () Bool)

(assert (=> b!1263095 m!1163967))

(assert (=> b!1263101 m!1163895))

(assert (=> b!1263101 m!1163895))

(declare-fun m!1163969 () Bool)

(assert (=> b!1263101 m!1163969))

(assert (=> b!1263101 m!1163907))

(assert (=> b!1263101 m!1163905))

(assert (=> b!1263101 m!1163905))

(assert (=> b!1263101 m!1163907))

(assert (=> b!1263101 m!1163909))

(declare-fun m!1163971 () Bool)

(assert (=> b!1263098 m!1163971))

(assert (=> b!1263099 m!1163965))

(assert (=> b!1262942 d!138917))

(declare-fun b!1263104 () Bool)

(declare-fun e!719039 () Bool)

(assert (=> b!1263104 (= e!719039 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263104 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1263106 () Bool)

(declare-fun e!719035 () Bool)

(declare-fun e!719037 () Bool)

(assert (=> b!1263106 (= e!719035 e!719037)))

(assert (=> b!1263106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun res!841267 () Bool)

(declare-fun lt!572307 () ListLongMap!18915)

(assert (=> b!1263106 (= res!841267 (contains!7609 lt!572307 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263106 (=> (not res!841267) (not e!719037))))

(declare-fun b!1263107 () Bool)

(declare-fun e!719033 () Bool)

(assert (=> b!1263107 (= e!719033 (isEmpty!1041 lt!572307))))

(declare-fun b!1263108 () Bool)

(declare-fun e!719036 () ListLongMap!18915)

(declare-fun call!62056 () ListLongMap!18915)

(assert (=> b!1263108 (= e!719036 call!62056)))

(declare-fun b!1263109 () Bool)

(declare-fun e!719038 () ListLongMap!18915)

(assert (=> b!1263109 (= e!719038 (ListLongMap!18916 Nil!28254))))

(declare-fun b!1263110 () Bool)

(declare-fun res!841266 () Bool)

(declare-fun e!719034 () Bool)

(assert (=> b!1263110 (=> (not res!841266) (not e!719034))))

(assert (=> b!1263110 (= res!841266 (not (contains!7609 lt!572307 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!62053 () Bool)

(assert (=> bm!62053 (= call!62056 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263111 () Bool)

(assert (=> b!1263111 (= e!719033 (= lt!572307 (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263112 () Bool)

(declare-fun lt!572306 () Unit!42038)

(declare-fun lt!572308 () Unit!42038)

(assert (=> b!1263112 (= lt!572306 lt!572308)))

(declare-fun lt!572305 () ListLongMap!18915)

(declare-fun lt!572304 () V!48511)

(declare-fun lt!572310 () (_ BitVec 64))

(declare-fun lt!572309 () (_ BitVec 64))

(assert (=> b!1263112 (not (contains!7609 (+!4287 lt!572305 (tuple2!21035 lt!572310 lt!572304)) lt!572309))))

(assert (=> b!1263112 (= lt!572308 (addStillNotContains!325 lt!572305 lt!572310 lt!572304 lt!572309))))

(assert (=> b!1263112 (= lt!572309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263112 (= lt!572304 (get!20317 (select (arr!39738 _values!914) #b00000000000000000000000000000000) (dynLambda!3456 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263112 (= lt!572310 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263112 (= lt!572305 call!62056)))

(assert (=> b!1263112 (= e!719036 (+!4287 call!62056 (tuple2!21035 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000) (get!20317 (select (arr!39738 _values!914) #b00000000000000000000000000000000) (dynLambda!3456 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263113 () Bool)

(assert (=> b!1263113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(assert (=> b!1263113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40275 _values!914)))))

(assert (=> b!1263113 (= e!719037 (= (apply!1004 lt!572307 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)) (get!20317 (select (arr!39738 _values!914) #b00000000000000000000000000000000) (dynLambda!3456 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!138919 () Bool)

(assert (=> d!138919 e!719034))

(declare-fun res!841264 () Bool)

(assert (=> d!138919 (=> (not res!841264) (not e!719034))))

(assert (=> d!138919 (= res!841264 (not (contains!7609 lt!572307 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138919 (= lt!572307 e!719038)))

(declare-fun c!123104 () Bool)

(assert (=> d!138919 (= c!123104 (bvsge #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(assert (=> d!138919 (validMask!0 mask!1466)))

(assert (=> d!138919 (= (getCurrentListMapNoExtraKeys!5879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572307)))

(declare-fun b!1263105 () Bool)

(assert (=> b!1263105 (= e!719035 e!719033)))

(declare-fun c!123107 () Bool)

(assert (=> b!1263105 (= c!123107 (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun b!1263114 () Bool)

(assert (=> b!1263114 (= e!719034 e!719035)))

(declare-fun c!123106 () Bool)

(assert (=> b!1263114 (= c!123106 e!719039)))

(declare-fun res!841265 () Bool)

(assert (=> b!1263114 (=> (not res!841265) (not e!719039))))

(assert (=> b!1263114 (= res!841265 (bvslt #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(declare-fun b!1263115 () Bool)

(assert (=> b!1263115 (= e!719038 e!719036)))

(declare-fun c!123105 () Bool)

(assert (=> b!1263115 (= c!123105 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138919 c!123104) b!1263109))

(assert (= (and d!138919 (not c!123104)) b!1263115))

(assert (= (and b!1263115 c!123105) b!1263112))

(assert (= (and b!1263115 (not c!123105)) b!1263108))

(assert (= (or b!1263112 b!1263108) bm!62053))

(assert (= (and d!138919 res!841264) b!1263110))

(assert (= (and b!1263110 res!841266) b!1263114))

(assert (= (and b!1263114 res!841265) b!1263104))

(assert (= (and b!1263114 c!123106) b!1263106))

(assert (= (and b!1263114 (not c!123106)) b!1263105))

(assert (= (and b!1263106 res!841267) b!1263113))

(assert (= (and b!1263105 c!123107) b!1263111))

(assert (= (and b!1263105 (not c!123107)) b!1263107))

(declare-fun b_lambda!22807 () Bool)

(assert (=> (not b_lambda!22807) (not b!1263112)))

(assert (=> b!1263112 t!41753))

(declare-fun b_and!45387 () Bool)

(assert (= b_and!45385 (and (=> t!41753 result!23351) b_and!45387)))

(declare-fun b_lambda!22809 () Bool)

(assert (=> (not b_lambda!22809) (not b!1263113)))

(assert (=> b!1263113 t!41753))

(declare-fun b_and!45389 () Bool)

(assert (= b_and!45387 (and (=> t!41753 result!23351) b_and!45389)))

(assert (=> b!1263106 m!1163895))

(assert (=> b!1263106 m!1163895))

(declare-fun m!1163973 () Bool)

(assert (=> b!1263106 m!1163973))

(declare-fun m!1163975 () Bool)

(assert (=> d!138919 m!1163975))

(assert (=> d!138919 m!1163829))

(assert (=> b!1263112 m!1163895))

(declare-fun m!1163977 () Bool)

(assert (=> b!1263112 m!1163977))

(assert (=> b!1263112 m!1163907))

(declare-fun m!1163979 () Bool)

(assert (=> b!1263112 m!1163979))

(assert (=> b!1263112 m!1163905))

(declare-fun m!1163981 () Bool)

(assert (=> b!1263112 m!1163981))

(assert (=> b!1263112 m!1163981))

(declare-fun m!1163983 () Bool)

(assert (=> b!1263112 m!1163983))

(assert (=> b!1263112 m!1163905))

(assert (=> b!1263112 m!1163907))

(assert (=> b!1263112 m!1163909))

(declare-fun m!1163985 () Bool)

(assert (=> bm!62053 m!1163985))

(assert (=> b!1263104 m!1163895))

(assert (=> b!1263104 m!1163895))

(assert (=> b!1263104 m!1163897))

(assert (=> b!1263115 m!1163895))

(assert (=> b!1263115 m!1163895))

(assert (=> b!1263115 m!1163897))

(declare-fun m!1163987 () Bool)

(assert (=> b!1263107 m!1163987))

(assert (=> b!1263113 m!1163895))

(assert (=> b!1263113 m!1163895))

(declare-fun m!1163989 () Bool)

(assert (=> b!1263113 m!1163989))

(assert (=> b!1263113 m!1163907))

(assert (=> b!1263113 m!1163905))

(assert (=> b!1263113 m!1163905))

(assert (=> b!1263113 m!1163907))

(assert (=> b!1263113 m!1163909))

(declare-fun m!1163991 () Bool)

(assert (=> b!1263110 m!1163991))

(assert (=> b!1263111 m!1163985))

(assert (=> b!1262942 d!138919))

(declare-fun b!1263126 () Bool)

(declare-fun e!719050 () Bool)

(declare-fun e!719049 () Bool)

(assert (=> b!1263126 (= e!719050 e!719049)))

(declare-fun c!123110 () Bool)

(assert (=> b!1263126 (= c!123110 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263127 () Bool)

(declare-fun e!719051 () Bool)

(declare-fun contains!7610 (List!28258 (_ BitVec 64)) Bool)

(assert (=> b!1263127 (= e!719051 (contains!7610 Nil!28255 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263128 () Bool)

(declare-fun call!62059 () Bool)

(assert (=> b!1263128 (= e!719049 call!62059)))

(declare-fun b!1263129 () Bool)

(assert (=> b!1263129 (= e!719049 call!62059)))

(declare-fun b!1263130 () Bool)

(declare-fun e!719048 () Bool)

(assert (=> b!1263130 (= e!719048 e!719050)))

(declare-fun res!841274 () Bool)

(assert (=> b!1263130 (=> (not res!841274) (not e!719050))))

(assert (=> b!1263130 (= res!841274 (not e!719051))))

(declare-fun res!841276 () Bool)

(assert (=> b!1263130 (=> (not res!841276) (not e!719051))))

(assert (=> b!1263130 (= res!841276 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62056 () Bool)

(assert (=> bm!62056 (= call!62059 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123110 (Cons!28254 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000) Nil!28255) Nil!28255)))))

(declare-fun d!138921 () Bool)

(declare-fun res!841275 () Bool)

(assert (=> d!138921 (=> res!841275 e!719048)))

(assert (=> d!138921 (= res!841275 (bvsge #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(assert (=> d!138921 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28255) e!719048)))

(assert (= (and d!138921 (not res!841275)) b!1263130))

(assert (= (and b!1263130 res!841276) b!1263127))

(assert (= (and b!1263130 res!841274) b!1263126))

(assert (= (and b!1263126 c!123110) b!1263128))

(assert (= (and b!1263126 (not c!123110)) b!1263129))

(assert (= (or b!1263128 b!1263129) bm!62056))

(assert (=> b!1263126 m!1163895))

(assert (=> b!1263126 m!1163895))

(assert (=> b!1263126 m!1163897))

(assert (=> b!1263127 m!1163895))

(assert (=> b!1263127 m!1163895))

(declare-fun m!1163993 () Bool)

(assert (=> b!1263127 m!1163993))

(assert (=> b!1263130 m!1163895))

(assert (=> b!1263130 m!1163895))

(assert (=> b!1263130 m!1163897))

(assert (=> bm!62056 m!1163895))

(declare-fun m!1163995 () Bool)

(assert (=> bm!62056 m!1163995))

(assert (=> b!1262941 d!138921))

(declare-fun d!138923 () Bool)

(assert (=> d!138923 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106152 d!138923))

(declare-fun d!138925 () Bool)

(assert (=> d!138925 (= (array_inv!30403 _keys!1118) (bvsge (size!40274 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106152 d!138925))

(declare-fun d!138927 () Bool)

(assert (=> d!138927 (= (array_inv!30404 _values!914) (bvsge (size!40275 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106152 d!138927))

(declare-fun bm!62059 () Bool)

(declare-fun call!62062 () Bool)

(assert (=> bm!62059 (= call!62062 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1263139 () Bool)

(declare-fun e!719059 () Bool)

(declare-fun e!719058 () Bool)

(assert (=> b!1263139 (= e!719059 e!719058)))

(declare-fun lt!572317 () (_ BitVec 64))

(assert (=> b!1263139 (= lt!572317 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572319 () Unit!42038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82379 (_ BitVec 64) (_ BitVec 32)) Unit!42038)

(assert (=> b!1263139 (= lt!572319 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572317 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263139 (arrayContainsKey!0 _keys!1118 lt!572317 #b00000000000000000000000000000000)))

(declare-fun lt!572318 () Unit!42038)

(assert (=> b!1263139 (= lt!572318 lt!572319)))

(declare-fun res!841281 () Bool)

(declare-datatypes ((SeekEntryResult!9929 0))(
  ( (MissingZero!9929 (index!42087 (_ BitVec 32))) (Found!9929 (index!42088 (_ BitVec 32))) (Intermediate!9929 (undefined!10741 Bool) (index!42089 (_ BitVec 32)) (x!111167 (_ BitVec 32))) (Undefined!9929) (MissingVacant!9929 (index!42090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82379 (_ BitVec 32)) SeekEntryResult!9929)

(assert (=> b!1263139 (= res!841281 (= (seekEntryOrOpen!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9929 #b00000000000000000000000000000000)))))

(assert (=> b!1263139 (=> (not res!841281) (not e!719058))))

(declare-fun b!1263140 () Bool)

(assert (=> b!1263140 (= e!719059 call!62062)))

(declare-fun b!1263141 () Bool)

(declare-fun e!719060 () Bool)

(assert (=> b!1263141 (= e!719060 e!719059)))

(declare-fun c!123113 () Bool)

(assert (=> b!1263141 (= c!123113 (validKeyInArray!0 (select (arr!39737 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263142 () Bool)

(assert (=> b!1263142 (= e!719058 call!62062)))

(declare-fun d!138929 () Bool)

(declare-fun res!841282 () Bool)

(assert (=> d!138929 (=> res!841282 e!719060)))

(assert (=> d!138929 (= res!841282 (bvsge #b00000000000000000000000000000000 (size!40274 _keys!1118)))))

(assert (=> d!138929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719060)))

(assert (= (and d!138929 (not res!841282)) b!1263141))

(assert (= (and b!1263141 c!123113) b!1263139))

(assert (= (and b!1263141 (not c!123113)) b!1263140))

(assert (= (and b!1263139 res!841281) b!1263142))

(assert (= (or b!1263142 b!1263140) bm!62059))

(declare-fun m!1163997 () Bool)

(assert (=> bm!62059 m!1163997))

(assert (=> b!1263139 m!1163895))

(declare-fun m!1163999 () Bool)

(assert (=> b!1263139 m!1163999))

(declare-fun m!1164001 () Bool)

(assert (=> b!1263139 m!1164001))

(assert (=> b!1263139 m!1163895))

(declare-fun m!1164003 () Bool)

(assert (=> b!1263139 m!1164003))

(assert (=> b!1263141 m!1163895))

(assert (=> b!1263141 m!1163895))

(assert (=> b!1263141 m!1163897))

(assert (=> b!1262940 d!138929))

(declare-fun condMapEmpty!50353 () Bool)

(declare-fun mapDefault!50353 () ValueCell!15416)

(assert (=> mapNonEmpty!50344 (= condMapEmpty!50353 (= mapRest!50344 ((as const (Array (_ BitVec 32) ValueCell!15416)) mapDefault!50353)))))

(declare-fun e!719066 () Bool)

(declare-fun mapRes!50353 () Bool)

(assert (=> mapNonEmpty!50344 (= tp!95906 (and e!719066 mapRes!50353))))

(declare-fun b!1263149 () Bool)

(declare-fun e!719065 () Bool)

(assert (=> b!1263149 (= e!719065 tp_is_empty!32359)))

(declare-fun b!1263150 () Bool)

(assert (=> b!1263150 (= e!719066 tp_is_empty!32359)))

(declare-fun mapNonEmpty!50353 () Bool)

(declare-fun tp!95921 () Bool)

(assert (=> mapNonEmpty!50353 (= mapRes!50353 (and tp!95921 e!719065))))

(declare-fun mapKey!50353 () (_ BitVec 32))

(declare-fun mapRest!50353 () (Array (_ BitVec 32) ValueCell!15416))

(declare-fun mapValue!50353 () ValueCell!15416)

(assert (=> mapNonEmpty!50353 (= mapRest!50344 (store mapRest!50353 mapKey!50353 mapValue!50353))))

(declare-fun mapIsEmpty!50353 () Bool)

(assert (=> mapIsEmpty!50353 mapRes!50353))

(assert (= (and mapNonEmpty!50344 condMapEmpty!50353) mapIsEmpty!50353))

(assert (= (and mapNonEmpty!50344 (not condMapEmpty!50353)) mapNonEmpty!50353))

(assert (= (and mapNonEmpty!50353 ((_ is ValueCellFull!15416) mapValue!50353)) b!1263149))

(assert (= (and mapNonEmpty!50344 ((_ is ValueCellFull!15416) mapDefault!50353)) b!1263150))

(declare-fun m!1164005 () Bool)

(assert (=> mapNonEmpty!50353 m!1164005))

(declare-fun b_lambda!22811 () Bool)

(assert (= b_lambda!22805 (or (and start!106152 b_free!27457) b_lambda!22811)))

(declare-fun b_lambda!22813 () Bool)

(assert (= b_lambda!22809 (or (and start!106152 b_free!27457) b_lambda!22813)))

(declare-fun b_lambda!22815 () Bool)

(assert (= b_lambda!22807 (or (and start!106152 b_free!27457) b_lambda!22815)))

(declare-fun b_lambda!22817 () Bool)

(assert (= b_lambda!22801 (or (and start!106152 b_free!27457) b_lambda!22817)))

(declare-fun b_lambda!22819 () Bool)

(assert (= b_lambda!22803 (or (and start!106152 b_free!27457) b_lambda!22819)))

(check-sat (not b!1263113) (not b_lambda!22817) (not d!138915) (not b!1263046) (not bm!62056) (not b!1263064) (not mapNonEmpty!50353) (not b!1263050) tp_is_empty!32359 (not b!1263103) (not b!1263104) (not bm!62052) (not d!138913) (not b!1263099) (not b!1263063) (not b!1263000) (not d!138911) (not b!1263141) (not b!1263139) (not d!138917) (not b!1263047) (not b_lambda!22811) (not b!1263111) (not b!1263002) (not bm!62048) (not b!1263092) b_and!45389 (not b!1263127) (not b!1263130) (not b!1263054) (not b!1263112) (not bm!62053) (not b!1263115) (not b!1263110) (not b_lambda!22819) (not bm!62046) (not bm!62049) (not b!1263055) (not b!1263101) (not bm!62059) (not d!138919) (not b!1263098) (not b!1263107) (not b!1263100) (not b!1263095) (not b_next!27457) (not bm!62045) (not b_lambda!22815) (not b!1263126) (not b!1263106) (not b_lambda!22813) (not b!1263051) (not b!1263094))
(check-sat b_and!45389 (not b_next!27457))
