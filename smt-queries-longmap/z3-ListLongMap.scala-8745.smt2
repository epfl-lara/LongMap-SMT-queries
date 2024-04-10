; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106092 () Bool)

(assert start!106092)

(declare-fun b_free!27507 () Bool)

(declare-fun b_next!27507 () Bool)

(assert (=> start!106092 (= b_free!27507 (not b_next!27507))))

(declare-fun tp!96074 () Bool)

(declare-fun b_and!45491 () Bool)

(assert (=> start!106092 (= tp!96074 b_and!45491)))

(declare-fun b!1263300 () Bool)

(declare-fun e!719222 () Bool)

(declare-fun e!719221 () Bool)

(declare-fun mapRes!50437 () Bool)

(assert (=> b!1263300 (= e!719222 (and e!719221 mapRes!50437))))

(declare-fun condMapEmpty!50437 () Bool)

(declare-datatypes ((V!48577 0))(
  ( (V!48578 (val!16267 Int)) )
))
(declare-datatypes ((ValueCell!15441 0))(
  ( (ValueCellFull!15441 (v!18977 V!48577)) (EmptyCell!15441) )
))
(declare-datatypes ((array!82440 0))(
  ( (array!82441 (arr!39766 (Array (_ BitVec 32) ValueCell!15441)) (size!40302 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82440)

(declare-fun mapDefault!50437 () ValueCell!15441)

(assert (=> b!1263300 (= condMapEmpty!50437 (= (arr!39766 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15441)) mapDefault!50437)))))

(declare-fun b!1263301 () Bool)

(declare-fun e!719224 () Bool)

(declare-fun tp_is_empty!32409 () Bool)

(assert (=> b!1263301 (= e!719224 tp_is_empty!32409)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48577)

(declare-datatypes ((tuple2!21060 0))(
  ( (tuple2!21061 (_1!10541 (_ BitVec 64)) (_2!10541 V!48577)) )
))
(declare-datatypes ((List!28251 0))(
  ( (Nil!28248) (Cons!28247 (h!29456 tuple2!21060) (t!41764 List!28251)) )
))
(declare-datatypes ((ListLongMap!18933 0))(
  ( (ListLongMap!18934 (toList!9482 List!28251)) )
))
(declare-fun lt!572887 () ListLongMap!18933)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48577)

(declare-fun b!1263302 () Bool)

(declare-datatypes ((array!82442 0))(
  ( (array!82443 (arr!39767 (Array (_ BitVec 32) (_ BitVec 64))) (size!40303 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82442)

(declare-fun e!719220 () Bool)

(declare-fun getCurrentListMap!4649 (array!82442 array!82440 (_ BitVec 32) (_ BitVec 32) V!48577 V!48577 (_ BitVec 32) Int) ListLongMap!18933)

(assert (=> b!1263302 (= e!719220 (= lt!572887 (getCurrentListMap!4649 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(declare-fun lt!572888 () ListLongMap!18933)

(assert (=> b!1263302 (= lt!572887 lt!572888)))

(declare-fun -!2147 (ListLongMap!18933 (_ BitVec 64)) ListLongMap!18933)

(assert (=> b!1263302 (= lt!572887 (-!2147 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!42111 0))(
  ( (Unit!42112) )
))
(declare-fun lt!572890 () Unit!42111)

(declare-fun removeNotPresentStillSame!152 (ListLongMap!18933 (_ BitVec 64)) Unit!42111)

(assert (=> b!1263302 (= lt!572890 (removeNotPresentStillSame!152 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!841501 () Bool)

(declare-fun e!719223 () Bool)

(assert (=> start!106092 (=> (not res!841501) (not e!719223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106092 (= res!841501 (validMask!0 mask!1466))))

(assert (=> start!106092 e!719223))

(assert (=> start!106092 true))

(assert (=> start!106092 tp!96074))

(assert (=> start!106092 tp_is_empty!32409))

(declare-fun array_inv!30265 (array!82442) Bool)

(assert (=> start!106092 (array_inv!30265 _keys!1118)))

(declare-fun array_inv!30266 (array!82440) Bool)

(assert (=> start!106092 (and (array_inv!30266 _values!914) e!719222)))

(declare-fun b!1263303 () Bool)

(declare-fun e!719218 () Bool)

(assert (=> b!1263303 (= e!719223 (not e!719218))))

(declare-fun res!841498 () Bool)

(assert (=> b!1263303 (=> res!841498 e!719218)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263303 (= res!841498 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!572891 () ListLongMap!18933)

(declare-fun lt!572886 () ListLongMap!18933)

(assert (=> b!1263303 (= lt!572891 lt!572886)))

(declare-fun lt!572889 () Unit!42111)

(declare-fun minValueBefore!43 () V!48577)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1187 (array!82442 array!82440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48577 V!48577 V!48577 V!48577 (_ BitVec 32) Int) Unit!42111)

(assert (=> b!1263303 (= lt!572889 (lemmaNoChangeToArrayThenSameMapNoExtras!1187 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5845 (array!82442 array!82440 (_ BitVec 32) (_ BitVec 32) V!48577 V!48577 (_ BitVec 32) Int) ListLongMap!18933)

(assert (=> b!1263303 (= lt!572886 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263303 (= lt!572891 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50437 () Bool)

(assert (=> mapIsEmpty!50437 mapRes!50437))

(declare-fun mapNonEmpty!50437 () Bool)

(declare-fun tp!96073 () Bool)

(assert (=> mapNonEmpty!50437 (= mapRes!50437 (and tp!96073 e!719224))))

(declare-fun mapRest!50437 () (Array (_ BitVec 32) ValueCell!15441))

(declare-fun mapValue!50437 () ValueCell!15441)

(declare-fun mapKey!50437 () (_ BitVec 32))

(assert (=> mapNonEmpty!50437 (= (arr!39766 _values!914) (store mapRest!50437 mapKey!50437 mapValue!50437))))

(declare-fun b!1263304 () Bool)

(declare-fun res!841502 () Bool)

(assert (=> b!1263304 (=> (not res!841502) (not e!719223))))

(declare-datatypes ((List!28252 0))(
  ( (Nil!28249) (Cons!28248 (h!29457 (_ BitVec 64)) (t!41765 List!28252)) )
))
(declare-fun arrayNoDuplicates!0 (array!82442 (_ BitVec 32) List!28252) Bool)

(assert (=> b!1263304 (= res!841502 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28249))))

(declare-fun b!1263305 () Bool)

(declare-fun res!841497 () Bool)

(assert (=> b!1263305 (=> (not res!841497) (not e!719223))))

(assert (=> b!1263305 (= res!841497 (and (= (size!40302 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40303 _keys!1118) (size!40302 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263306 () Bool)

(assert (=> b!1263306 (= e!719218 e!719220)))

(declare-fun res!841500 () Bool)

(assert (=> b!1263306 (=> res!841500 e!719220)))

(declare-fun contains!7603 (ListLongMap!18933 (_ BitVec 64)) Bool)

(assert (=> b!1263306 (= res!841500 (contains!7603 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1263306 (= lt!572888 (getCurrentListMap!4649 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263307 () Bool)

(assert (=> b!1263307 (= e!719221 tp_is_empty!32409)))

(declare-fun b!1263308 () Bool)

(declare-fun res!841499 () Bool)

(assert (=> b!1263308 (=> (not res!841499) (not e!719223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82442 (_ BitVec 32)) Bool)

(assert (=> b!1263308 (= res!841499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!106092 res!841501) b!1263305))

(assert (= (and b!1263305 res!841497) b!1263308))

(assert (= (and b!1263308 res!841499) b!1263304))

(assert (= (and b!1263304 res!841502) b!1263303))

(assert (= (and b!1263303 (not res!841498)) b!1263306))

(assert (= (and b!1263306 (not res!841500)) b!1263302))

(assert (= (and b!1263300 condMapEmpty!50437) mapIsEmpty!50437))

(assert (= (and b!1263300 (not condMapEmpty!50437)) mapNonEmpty!50437))

(get-info :version)

(assert (= (and mapNonEmpty!50437 ((_ is ValueCellFull!15441) mapValue!50437)) b!1263301))

(assert (= (and b!1263300 ((_ is ValueCellFull!15441) mapDefault!50437)) b!1263307))

(assert (= start!106092 b!1263300))

(declare-fun m!1163785 () Bool)

(assert (=> b!1263302 m!1163785))

(declare-fun m!1163787 () Bool)

(assert (=> b!1263302 m!1163787))

(declare-fun m!1163789 () Bool)

(assert (=> b!1263302 m!1163789))

(declare-fun m!1163791 () Bool)

(assert (=> b!1263306 m!1163791))

(declare-fun m!1163793 () Bool)

(assert (=> b!1263306 m!1163793))

(declare-fun m!1163795 () Bool)

(assert (=> b!1263303 m!1163795))

(declare-fun m!1163797 () Bool)

(assert (=> b!1263303 m!1163797))

(declare-fun m!1163799 () Bool)

(assert (=> b!1263303 m!1163799))

(declare-fun m!1163801 () Bool)

(assert (=> b!1263304 m!1163801))

(declare-fun m!1163803 () Bool)

(assert (=> b!1263308 m!1163803))

(declare-fun m!1163805 () Bool)

(assert (=> start!106092 m!1163805))

(declare-fun m!1163807 () Bool)

(assert (=> start!106092 m!1163807))

(declare-fun m!1163809 () Bool)

(assert (=> start!106092 m!1163809))

(declare-fun m!1163811 () Bool)

(assert (=> mapNonEmpty!50437 m!1163811))

(check-sat tp_is_empty!32409 (not start!106092) (not b!1263302) (not mapNonEmpty!50437) (not b!1263303) (not b!1263306) (not b!1263304) (not b_next!27507) (not b!1263308) b_and!45491)
(check-sat b_and!45491 (not b_next!27507))
(get-model)

(declare-fun bm!62192 () Bool)

(declare-fun call!62199 () ListLongMap!18933)

(assert (=> bm!62192 (= call!62199 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263378 () Bool)

(declare-fun e!719276 () Unit!42111)

(declare-fun Unit!42115 () Unit!42111)

(assert (=> b!1263378 (= e!719276 Unit!42115)))

(declare-fun b!1263379 () Bool)

(declare-fun e!719284 () Bool)

(declare-fun e!719274 () Bool)

(assert (=> b!1263379 (= e!719284 e!719274)))

(declare-fun c!122962 () Bool)

(assert (=> b!1263379 (= c!122962 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263380 () Bool)

(declare-fun e!719278 () ListLongMap!18933)

(declare-fun call!62196 () ListLongMap!18933)

(assert (=> b!1263380 (= e!719278 call!62196)))

(declare-fun b!1263381 () Bool)

(declare-fun e!719275 () Bool)

(declare-fun lt!572965 () ListLongMap!18933)

(declare-fun apply!1001 (ListLongMap!18933 (_ BitVec 64)) V!48577)

(assert (=> b!1263381 (= e!719275 (= (apply!1001 lt!572965 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1263382 () Bool)

(declare-fun e!719281 () ListLongMap!18933)

(declare-fun e!719277 () ListLongMap!18933)

(assert (=> b!1263382 (= e!719281 e!719277)))

(declare-fun c!122960 () Bool)

(assert (=> b!1263382 (= c!122960 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!138613 () Bool)

(assert (=> d!138613 e!719284))

(declare-fun res!841546 () Bool)

(assert (=> d!138613 (=> (not res!841546) (not e!719284))))

(assert (=> d!138613 (= res!841546 (or (bvsge #b00000000000000000000000000000000 (size!40303 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))))

(declare-fun lt!572964 () ListLongMap!18933)

(assert (=> d!138613 (= lt!572965 lt!572964)))

(declare-fun lt!572967 () Unit!42111)

(assert (=> d!138613 (= lt!572967 e!719276)))

(declare-fun c!122959 () Bool)

(declare-fun e!719273 () Bool)

(assert (=> d!138613 (= c!122959 e!719273)))

(declare-fun res!841540 () Bool)

(assert (=> d!138613 (=> (not res!841540) (not e!719273))))

(assert (=> d!138613 (= res!841540 (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(assert (=> d!138613 (= lt!572964 e!719281)))

(declare-fun c!122961 () Bool)

(assert (=> d!138613 (= c!122961 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138613 (validMask!0 mask!1466)))

(assert (=> d!138613 (= (getCurrentListMap!4649 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572965)))

(declare-fun b!1263383 () Bool)

(declare-fun e!719279 () Bool)

(declare-fun e!719272 () Bool)

(assert (=> b!1263383 (= e!719279 e!719272)))

(declare-fun res!841547 () Bool)

(declare-fun call!62201 () Bool)

(assert (=> b!1263383 (= res!841547 call!62201)))

(assert (=> b!1263383 (=> (not res!841547) (not e!719272))))

(declare-fun bm!62193 () Bool)

(assert (=> bm!62193 (= call!62201 (contains!7603 lt!572965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62194 () Bool)

(declare-fun call!62198 () ListLongMap!18933)

(declare-fun call!62195 () ListLongMap!18933)

(assert (=> bm!62194 (= call!62198 call!62195)))

(declare-fun b!1263384 () Bool)

(declare-fun c!122964 () Bool)

(assert (=> b!1263384 (= c!122964 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263384 (= e!719277 e!719278)))

(declare-fun b!1263385 () Bool)

(assert (=> b!1263385 (= e!719277 call!62198)))

(declare-fun bm!62195 () Bool)

(declare-fun call!62200 () ListLongMap!18933)

(assert (=> bm!62195 (= call!62196 call!62200)))

(declare-fun b!1263386 () Bool)

(declare-fun call!62197 () Bool)

(assert (=> b!1263386 (= e!719274 (not call!62197))))

(declare-fun b!1263387 () Bool)

(declare-fun e!719280 () Bool)

(declare-fun get!20288 (ValueCell!15441 V!48577) V!48577)

(declare-fun dynLambda!3399 (Int (_ BitVec 64)) V!48577)

(assert (=> b!1263387 (= e!719280 (= (apply!1001 lt!572965 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)) (get!20288 (select (arr!39766 _values!914) #b00000000000000000000000000000000) (dynLambda!3399 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263387 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40302 _values!914)))))

(assert (=> b!1263387 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun b!1263388 () Bool)

(declare-fun lt!572958 () Unit!42111)

(assert (=> b!1263388 (= e!719276 lt!572958)))

(declare-fun lt!572956 () ListLongMap!18933)

(assert (=> b!1263388 (= lt!572956 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572963 () (_ BitVec 64))

(assert (=> b!1263388 (= lt!572963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572969 () (_ BitVec 64))

(assert (=> b!1263388 (= lt!572969 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572961 () Unit!42111)

(declare-fun addStillContains!1091 (ListLongMap!18933 (_ BitVec 64) V!48577 (_ BitVec 64)) Unit!42111)

(assert (=> b!1263388 (= lt!572961 (addStillContains!1091 lt!572956 lt!572963 zeroValue!871 lt!572969))))

(declare-fun +!4253 (ListLongMap!18933 tuple2!21060) ListLongMap!18933)

(assert (=> b!1263388 (contains!7603 (+!4253 lt!572956 (tuple2!21061 lt!572963 zeroValue!871)) lt!572969)))

(declare-fun lt!572966 () Unit!42111)

(assert (=> b!1263388 (= lt!572966 lt!572961)))

(declare-fun lt!572959 () ListLongMap!18933)

(assert (=> b!1263388 (= lt!572959 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572975 () (_ BitVec 64))

(assert (=> b!1263388 (= lt!572975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572971 () (_ BitVec 64))

(assert (=> b!1263388 (= lt!572971 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572974 () Unit!42111)

(declare-fun addApplyDifferent!545 (ListLongMap!18933 (_ BitVec 64) V!48577 (_ BitVec 64)) Unit!42111)

(assert (=> b!1263388 (= lt!572974 (addApplyDifferent!545 lt!572959 lt!572975 minValueAfter!43 lt!572971))))

(assert (=> b!1263388 (= (apply!1001 (+!4253 lt!572959 (tuple2!21061 lt!572975 minValueAfter!43)) lt!572971) (apply!1001 lt!572959 lt!572971))))

(declare-fun lt!572972 () Unit!42111)

(assert (=> b!1263388 (= lt!572972 lt!572974)))

(declare-fun lt!572954 () ListLongMap!18933)

(assert (=> b!1263388 (= lt!572954 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572960 () (_ BitVec 64))

(assert (=> b!1263388 (= lt!572960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572955 () (_ BitVec 64))

(assert (=> b!1263388 (= lt!572955 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572970 () Unit!42111)

(assert (=> b!1263388 (= lt!572970 (addApplyDifferent!545 lt!572954 lt!572960 zeroValue!871 lt!572955))))

(assert (=> b!1263388 (= (apply!1001 (+!4253 lt!572954 (tuple2!21061 lt!572960 zeroValue!871)) lt!572955) (apply!1001 lt!572954 lt!572955))))

(declare-fun lt!572957 () Unit!42111)

(assert (=> b!1263388 (= lt!572957 lt!572970)))

(declare-fun lt!572968 () ListLongMap!18933)

(assert (=> b!1263388 (= lt!572968 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572973 () (_ BitVec 64))

(assert (=> b!1263388 (= lt!572973 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572962 () (_ BitVec 64))

(assert (=> b!1263388 (= lt!572962 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263388 (= lt!572958 (addApplyDifferent!545 lt!572968 lt!572973 minValueAfter!43 lt!572962))))

(assert (=> b!1263388 (= (apply!1001 (+!4253 lt!572968 (tuple2!21061 lt!572973 minValueAfter!43)) lt!572962) (apply!1001 lt!572968 lt!572962))))

(declare-fun bm!62196 () Bool)

(assert (=> bm!62196 (= call!62200 call!62199)))

(declare-fun bm!62197 () Bool)

(assert (=> bm!62197 (= call!62197 (contains!7603 lt!572965 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263389 () Bool)

(assert (=> b!1263389 (= e!719274 e!719275)))

(declare-fun res!841543 () Bool)

(assert (=> b!1263389 (= res!841543 call!62197)))

(assert (=> b!1263389 (=> (not res!841543) (not e!719275))))

(declare-fun b!1263390 () Bool)

(assert (=> b!1263390 (= e!719278 call!62198)))

(declare-fun b!1263391 () Bool)

(assert (=> b!1263391 (= e!719272 (= (apply!1001 lt!572965 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263392 () Bool)

(declare-fun res!841541 () Bool)

(assert (=> b!1263392 (=> (not res!841541) (not e!719284))))

(assert (=> b!1263392 (= res!841541 e!719279)))

(declare-fun c!122963 () Bool)

(assert (=> b!1263392 (= c!122963 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263393 () Bool)

(declare-fun e!719282 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263393 (= e!719282 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263394 () Bool)

(assert (=> b!1263394 (= e!719281 (+!4253 call!62195 (tuple2!21061 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1263395 () Bool)

(declare-fun e!719283 () Bool)

(assert (=> b!1263395 (= e!719283 e!719280)))

(declare-fun res!841542 () Bool)

(assert (=> b!1263395 (=> (not res!841542) (not e!719280))))

(assert (=> b!1263395 (= res!841542 (contains!7603 lt!572965 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263395 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun bm!62198 () Bool)

(assert (=> bm!62198 (= call!62195 (+!4253 (ite c!122961 call!62199 (ite c!122960 call!62200 call!62196)) (ite (or c!122961 c!122960) (tuple2!21061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21061 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1263396 () Bool)

(declare-fun res!841545 () Bool)

(assert (=> b!1263396 (=> (not res!841545) (not e!719284))))

(assert (=> b!1263396 (= res!841545 e!719283)))

(declare-fun res!841539 () Bool)

(assert (=> b!1263396 (=> res!841539 e!719283)))

(assert (=> b!1263396 (= res!841539 (not e!719282))))

(declare-fun res!841544 () Bool)

(assert (=> b!1263396 (=> (not res!841544) (not e!719282))))

(assert (=> b!1263396 (= res!841544 (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun b!1263397 () Bool)

(assert (=> b!1263397 (= e!719279 (not call!62201))))

(declare-fun b!1263398 () Bool)

(assert (=> b!1263398 (= e!719273 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138613 c!122961) b!1263394))

(assert (= (and d!138613 (not c!122961)) b!1263382))

(assert (= (and b!1263382 c!122960) b!1263385))

(assert (= (and b!1263382 (not c!122960)) b!1263384))

(assert (= (and b!1263384 c!122964) b!1263390))

(assert (= (and b!1263384 (not c!122964)) b!1263380))

(assert (= (or b!1263390 b!1263380) bm!62195))

(assert (= (or b!1263385 bm!62195) bm!62196))

(assert (= (or b!1263385 b!1263390) bm!62194))

(assert (= (or b!1263394 bm!62196) bm!62192))

(assert (= (or b!1263394 bm!62194) bm!62198))

(assert (= (and d!138613 res!841540) b!1263398))

(assert (= (and d!138613 c!122959) b!1263388))

(assert (= (and d!138613 (not c!122959)) b!1263378))

(assert (= (and d!138613 res!841546) b!1263396))

(assert (= (and b!1263396 res!841544) b!1263393))

(assert (= (and b!1263396 (not res!841539)) b!1263395))

(assert (= (and b!1263395 res!841542) b!1263387))

(assert (= (and b!1263396 res!841545) b!1263392))

(assert (= (and b!1263392 c!122963) b!1263383))

(assert (= (and b!1263392 (not c!122963)) b!1263397))

(assert (= (and b!1263383 res!841547) b!1263391))

(assert (= (or b!1263383 b!1263397) bm!62193))

(assert (= (and b!1263392 res!841541) b!1263379))

(assert (= (and b!1263379 c!122962) b!1263389))

(assert (= (and b!1263379 (not c!122962)) b!1263386))

(assert (= (and b!1263389 res!841543) b!1263381))

(assert (= (or b!1263389 b!1263386) bm!62197))

(declare-fun b_lambda!22943 () Bool)

(assert (=> (not b_lambda!22943) (not b!1263387)))

(declare-fun t!41769 () Bool)

(declare-fun tb!11329 () Bool)

(assert (=> (and start!106092 (= defaultEntry!922 defaultEntry!922) t!41769) tb!11329))

(declare-fun result!23395 () Bool)

(assert (=> tb!11329 (= result!23395 tp_is_empty!32409)))

(assert (=> b!1263387 t!41769))

(declare-fun b_and!45495 () Bool)

(assert (= b_and!45491 (and (=> t!41769 result!23395) b_and!45495)))

(declare-fun m!1163841 () Bool)

(assert (=> bm!62198 m!1163841))

(declare-fun m!1163843 () Bool)

(assert (=> b!1263391 m!1163843))

(declare-fun m!1163845 () Bool)

(assert (=> bm!62193 m!1163845))

(declare-fun m!1163847 () Bool)

(assert (=> b!1263394 m!1163847))

(declare-fun m!1163849 () Bool)

(assert (=> bm!62197 m!1163849))

(declare-fun m!1163851 () Bool)

(assert (=> b!1263387 m!1163851))

(declare-fun m!1163853 () Bool)

(assert (=> b!1263387 m!1163853))

(declare-fun m!1163855 () Bool)

(assert (=> b!1263387 m!1163855))

(assert (=> b!1263387 m!1163855))

(declare-fun m!1163857 () Bool)

(assert (=> b!1263387 m!1163857))

(assert (=> b!1263387 m!1163853))

(assert (=> b!1263387 m!1163851))

(declare-fun m!1163859 () Bool)

(assert (=> b!1263387 m!1163859))

(assert (=> b!1263398 m!1163855))

(assert (=> b!1263398 m!1163855))

(declare-fun m!1163861 () Bool)

(assert (=> b!1263398 m!1163861))

(assert (=> bm!62192 m!1163797))

(declare-fun m!1163863 () Bool)

(assert (=> b!1263381 m!1163863))

(declare-fun m!1163865 () Bool)

(assert (=> b!1263388 m!1163865))

(declare-fun m!1163867 () Bool)

(assert (=> b!1263388 m!1163867))

(declare-fun m!1163869 () Bool)

(assert (=> b!1263388 m!1163869))

(declare-fun m!1163871 () Bool)

(assert (=> b!1263388 m!1163871))

(declare-fun m!1163873 () Bool)

(assert (=> b!1263388 m!1163873))

(declare-fun m!1163875 () Bool)

(assert (=> b!1263388 m!1163875))

(assert (=> b!1263388 m!1163871))

(assert (=> b!1263388 m!1163797))

(declare-fun m!1163877 () Bool)

(assert (=> b!1263388 m!1163877))

(declare-fun m!1163879 () Bool)

(assert (=> b!1263388 m!1163879))

(assert (=> b!1263388 m!1163877))

(declare-fun m!1163881 () Bool)

(assert (=> b!1263388 m!1163881))

(declare-fun m!1163883 () Bool)

(assert (=> b!1263388 m!1163883))

(declare-fun m!1163885 () Bool)

(assert (=> b!1263388 m!1163885))

(declare-fun m!1163887 () Bool)

(assert (=> b!1263388 m!1163887))

(assert (=> b!1263388 m!1163885))

(declare-fun m!1163889 () Bool)

(assert (=> b!1263388 m!1163889))

(assert (=> b!1263388 m!1163855))

(declare-fun m!1163891 () Bool)

(assert (=> b!1263388 m!1163891))

(assert (=> b!1263388 m!1163865))

(declare-fun m!1163893 () Bool)

(assert (=> b!1263388 m!1163893))

(assert (=> d!138613 m!1163805))

(assert (=> b!1263393 m!1163855))

(assert (=> b!1263393 m!1163855))

(assert (=> b!1263393 m!1163861))

(assert (=> b!1263395 m!1163855))

(assert (=> b!1263395 m!1163855))

(declare-fun m!1163895 () Bool)

(assert (=> b!1263395 m!1163895))

(assert (=> b!1263302 d!138613))

(declare-fun d!138615 () Bool)

(declare-fun lt!572978 () ListLongMap!18933)

(assert (=> d!138615 (not (contains!7603 lt!572978 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!145 (List!28251 (_ BitVec 64)) List!28251)

(assert (=> d!138615 (= lt!572978 (ListLongMap!18934 (removeStrictlySorted!145 (toList!9482 lt!572888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138615 (= (-!2147 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572978)))

(declare-fun bs!35744 () Bool)

(assert (= bs!35744 d!138615))

(declare-fun m!1163897 () Bool)

(assert (=> bs!35744 m!1163897))

(declare-fun m!1163899 () Bool)

(assert (=> bs!35744 m!1163899))

(assert (=> b!1263302 d!138615))

(declare-fun d!138617 () Bool)

(assert (=> d!138617 (= (-!2147 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572888)))

(declare-fun lt!572981 () Unit!42111)

(declare-fun choose!1875 (ListLongMap!18933 (_ BitVec 64)) Unit!42111)

(assert (=> d!138617 (= lt!572981 (choose!1875 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138617 (not (contains!7603 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138617 (= (removeNotPresentStillSame!152 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572981)))

(declare-fun bs!35745 () Bool)

(assert (= bs!35745 d!138617))

(assert (=> bs!35745 m!1163787))

(declare-fun m!1163901 () Bool)

(assert (=> bs!35745 m!1163901))

(assert (=> bs!35745 m!1163791))

(assert (=> b!1263302 d!138617))

(declare-fun d!138619 () Bool)

(declare-fun e!719289 () Bool)

(assert (=> d!138619 e!719289))

(declare-fun res!841550 () Bool)

(assert (=> d!138619 (=> res!841550 e!719289)))

(declare-fun lt!572992 () Bool)

(assert (=> d!138619 (= res!841550 (not lt!572992))))

(declare-fun lt!572991 () Bool)

(assert (=> d!138619 (= lt!572992 lt!572991)))

(declare-fun lt!572993 () Unit!42111)

(declare-fun e!719290 () Unit!42111)

(assert (=> d!138619 (= lt!572993 e!719290)))

(declare-fun c!122967 () Bool)

(assert (=> d!138619 (= c!122967 lt!572991)))

(declare-fun containsKey!626 (List!28251 (_ BitVec 64)) Bool)

(assert (=> d!138619 (= lt!572991 (containsKey!626 (toList!9482 lt!572888) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138619 (= (contains!7603 lt!572888 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572992)))

(declare-fun b!1263407 () Bool)

(declare-fun lt!572990 () Unit!42111)

(assert (=> b!1263407 (= e!719290 lt!572990)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!435 (List!28251 (_ BitVec 64)) Unit!42111)

(assert (=> b!1263407 (= lt!572990 (lemmaContainsKeyImpliesGetValueByKeyDefined!435 (toList!9482 lt!572888) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!717 0))(
  ( (Some!716 (v!18979 V!48577)) (None!715) )
))
(declare-fun isDefined!474 (Option!717) Bool)

(declare-fun getValueByKey!666 (List!28251 (_ BitVec 64)) Option!717)

(assert (=> b!1263407 (isDefined!474 (getValueByKey!666 (toList!9482 lt!572888) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263408 () Bool)

(declare-fun Unit!42116 () Unit!42111)

(assert (=> b!1263408 (= e!719290 Unit!42116)))

(declare-fun b!1263409 () Bool)

(assert (=> b!1263409 (= e!719289 (isDefined!474 (getValueByKey!666 (toList!9482 lt!572888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138619 c!122967) b!1263407))

(assert (= (and d!138619 (not c!122967)) b!1263408))

(assert (= (and d!138619 (not res!841550)) b!1263409))

(declare-fun m!1163903 () Bool)

(assert (=> d!138619 m!1163903))

(declare-fun m!1163905 () Bool)

(assert (=> b!1263407 m!1163905))

(declare-fun m!1163907 () Bool)

(assert (=> b!1263407 m!1163907))

(assert (=> b!1263407 m!1163907))

(declare-fun m!1163909 () Bool)

(assert (=> b!1263407 m!1163909))

(assert (=> b!1263409 m!1163907))

(assert (=> b!1263409 m!1163907))

(assert (=> b!1263409 m!1163909))

(assert (=> b!1263306 d!138619))

(declare-fun bm!62199 () Bool)

(declare-fun call!62206 () ListLongMap!18933)

(assert (=> bm!62199 (= call!62206 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263410 () Bool)

(declare-fun e!719295 () Unit!42111)

(declare-fun Unit!42117 () Unit!42111)

(assert (=> b!1263410 (= e!719295 Unit!42117)))

(declare-fun b!1263411 () Bool)

(declare-fun e!719303 () Bool)

(declare-fun e!719293 () Bool)

(assert (=> b!1263411 (= e!719303 e!719293)))

(declare-fun c!122971 () Bool)

(assert (=> b!1263411 (= c!122971 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263412 () Bool)

(declare-fun e!719297 () ListLongMap!18933)

(declare-fun call!62203 () ListLongMap!18933)

(assert (=> b!1263412 (= e!719297 call!62203)))

(declare-fun b!1263413 () Bool)

(declare-fun e!719294 () Bool)

(declare-fun lt!573005 () ListLongMap!18933)

(assert (=> b!1263413 (= e!719294 (= (apply!1001 lt!573005 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263414 () Bool)

(declare-fun e!719300 () ListLongMap!18933)

(declare-fun e!719296 () ListLongMap!18933)

(assert (=> b!1263414 (= e!719300 e!719296)))

(declare-fun c!122969 () Bool)

(assert (=> b!1263414 (= c!122969 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!138621 () Bool)

(assert (=> d!138621 e!719303))

(declare-fun res!841558 () Bool)

(assert (=> d!138621 (=> (not res!841558) (not e!719303))))

(assert (=> d!138621 (= res!841558 (or (bvsge #b00000000000000000000000000000000 (size!40303 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))))

(declare-fun lt!573004 () ListLongMap!18933)

(assert (=> d!138621 (= lt!573005 lt!573004)))

(declare-fun lt!573007 () Unit!42111)

(assert (=> d!138621 (= lt!573007 e!719295)))

(declare-fun c!122968 () Bool)

(declare-fun e!719292 () Bool)

(assert (=> d!138621 (= c!122968 e!719292)))

(declare-fun res!841552 () Bool)

(assert (=> d!138621 (=> (not res!841552) (not e!719292))))

(assert (=> d!138621 (= res!841552 (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(assert (=> d!138621 (= lt!573004 e!719300)))

(declare-fun c!122970 () Bool)

(assert (=> d!138621 (= c!122970 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138621 (validMask!0 mask!1466)))

(assert (=> d!138621 (= (getCurrentListMap!4649 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573005)))

(declare-fun b!1263415 () Bool)

(declare-fun e!719298 () Bool)

(declare-fun e!719291 () Bool)

(assert (=> b!1263415 (= e!719298 e!719291)))

(declare-fun res!841559 () Bool)

(declare-fun call!62208 () Bool)

(assert (=> b!1263415 (= res!841559 call!62208)))

(assert (=> b!1263415 (=> (not res!841559) (not e!719291))))

(declare-fun bm!62200 () Bool)

(assert (=> bm!62200 (= call!62208 (contains!7603 lt!573005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62201 () Bool)

(declare-fun call!62205 () ListLongMap!18933)

(declare-fun call!62202 () ListLongMap!18933)

(assert (=> bm!62201 (= call!62205 call!62202)))

(declare-fun b!1263416 () Bool)

(declare-fun c!122973 () Bool)

(assert (=> b!1263416 (= c!122973 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263416 (= e!719296 e!719297)))

(declare-fun b!1263417 () Bool)

(assert (=> b!1263417 (= e!719296 call!62205)))

(declare-fun bm!62202 () Bool)

(declare-fun call!62207 () ListLongMap!18933)

(assert (=> bm!62202 (= call!62203 call!62207)))

(declare-fun b!1263418 () Bool)

(declare-fun call!62204 () Bool)

(assert (=> b!1263418 (= e!719293 (not call!62204))))

(declare-fun e!719299 () Bool)

(declare-fun b!1263419 () Bool)

(assert (=> b!1263419 (= e!719299 (= (apply!1001 lt!573005 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)) (get!20288 (select (arr!39766 _values!914) #b00000000000000000000000000000000) (dynLambda!3399 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40302 _values!914)))))

(assert (=> b!1263419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun b!1263420 () Bool)

(declare-fun lt!572998 () Unit!42111)

(assert (=> b!1263420 (= e!719295 lt!572998)))

(declare-fun lt!572996 () ListLongMap!18933)

(assert (=> b!1263420 (= lt!572996 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573003 () (_ BitVec 64))

(assert (=> b!1263420 (= lt!573003 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573009 () (_ BitVec 64))

(assert (=> b!1263420 (= lt!573009 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573001 () Unit!42111)

(assert (=> b!1263420 (= lt!573001 (addStillContains!1091 lt!572996 lt!573003 zeroValue!871 lt!573009))))

(assert (=> b!1263420 (contains!7603 (+!4253 lt!572996 (tuple2!21061 lt!573003 zeroValue!871)) lt!573009)))

(declare-fun lt!573006 () Unit!42111)

(assert (=> b!1263420 (= lt!573006 lt!573001)))

(declare-fun lt!572999 () ListLongMap!18933)

(assert (=> b!1263420 (= lt!572999 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573015 () (_ BitVec 64))

(assert (=> b!1263420 (= lt!573015 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573011 () (_ BitVec 64))

(assert (=> b!1263420 (= lt!573011 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573014 () Unit!42111)

(assert (=> b!1263420 (= lt!573014 (addApplyDifferent!545 lt!572999 lt!573015 minValueBefore!43 lt!573011))))

(assert (=> b!1263420 (= (apply!1001 (+!4253 lt!572999 (tuple2!21061 lt!573015 minValueBefore!43)) lt!573011) (apply!1001 lt!572999 lt!573011))))

(declare-fun lt!573012 () Unit!42111)

(assert (=> b!1263420 (= lt!573012 lt!573014)))

(declare-fun lt!572994 () ListLongMap!18933)

(assert (=> b!1263420 (= lt!572994 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573000 () (_ BitVec 64))

(assert (=> b!1263420 (= lt!573000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572995 () (_ BitVec 64))

(assert (=> b!1263420 (= lt!572995 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573010 () Unit!42111)

(assert (=> b!1263420 (= lt!573010 (addApplyDifferent!545 lt!572994 lt!573000 zeroValue!871 lt!572995))))

(assert (=> b!1263420 (= (apply!1001 (+!4253 lt!572994 (tuple2!21061 lt!573000 zeroValue!871)) lt!572995) (apply!1001 lt!572994 lt!572995))))

(declare-fun lt!572997 () Unit!42111)

(assert (=> b!1263420 (= lt!572997 lt!573010)))

(declare-fun lt!573008 () ListLongMap!18933)

(assert (=> b!1263420 (= lt!573008 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573013 () (_ BitVec 64))

(assert (=> b!1263420 (= lt!573013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573002 () (_ BitVec 64))

(assert (=> b!1263420 (= lt!573002 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263420 (= lt!572998 (addApplyDifferent!545 lt!573008 lt!573013 minValueBefore!43 lt!573002))))

(assert (=> b!1263420 (= (apply!1001 (+!4253 lt!573008 (tuple2!21061 lt!573013 minValueBefore!43)) lt!573002) (apply!1001 lt!573008 lt!573002))))

(declare-fun bm!62203 () Bool)

(assert (=> bm!62203 (= call!62207 call!62206)))

(declare-fun bm!62204 () Bool)

(assert (=> bm!62204 (= call!62204 (contains!7603 lt!573005 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263421 () Bool)

(assert (=> b!1263421 (= e!719293 e!719294)))

(declare-fun res!841555 () Bool)

(assert (=> b!1263421 (= res!841555 call!62204)))

(assert (=> b!1263421 (=> (not res!841555) (not e!719294))))

(declare-fun b!1263422 () Bool)

(assert (=> b!1263422 (= e!719297 call!62205)))

(declare-fun b!1263423 () Bool)

(assert (=> b!1263423 (= e!719291 (= (apply!1001 lt!573005 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1263424 () Bool)

(declare-fun res!841553 () Bool)

(assert (=> b!1263424 (=> (not res!841553) (not e!719303))))

(assert (=> b!1263424 (= res!841553 e!719298)))

(declare-fun c!122972 () Bool)

(assert (=> b!1263424 (= c!122972 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1263425 () Bool)

(declare-fun e!719301 () Bool)

(assert (=> b!1263425 (= e!719301 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263426 () Bool)

(assert (=> b!1263426 (= e!719300 (+!4253 call!62202 (tuple2!21061 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263427 () Bool)

(declare-fun e!719302 () Bool)

(assert (=> b!1263427 (= e!719302 e!719299)))

(declare-fun res!841554 () Bool)

(assert (=> b!1263427 (=> (not res!841554) (not e!719299))))

(assert (=> b!1263427 (= res!841554 (contains!7603 lt!573005 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun bm!62205 () Bool)

(assert (=> bm!62205 (= call!62202 (+!4253 (ite c!122970 call!62206 (ite c!122969 call!62207 call!62203)) (ite (or c!122970 c!122969) (tuple2!21061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21061 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263428 () Bool)

(declare-fun res!841557 () Bool)

(assert (=> b!1263428 (=> (not res!841557) (not e!719303))))

(assert (=> b!1263428 (= res!841557 e!719302)))

(declare-fun res!841551 () Bool)

(assert (=> b!1263428 (=> res!841551 e!719302)))

(assert (=> b!1263428 (= res!841551 (not e!719301))))

(declare-fun res!841556 () Bool)

(assert (=> b!1263428 (=> (not res!841556) (not e!719301))))

(assert (=> b!1263428 (= res!841556 (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun b!1263429 () Bool)

(assert (=> b!1263429 (= e!719298 (not call!62208))))

(declare-fun b!1263430 () Bool)

(assert (=> b!1263430 (= e!719292 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138621 c!122970) b!1263426))

(assert (= (and d!138621 (not c!122970)) b!1263414))

(assert (= (and b!1263414 c!122969) b!1263417))

(assert (= (and b!1263414 (not c!122969)) b!1263416))

(assert (= (and b!1263416 c!122973) b!1263422))

(assert (= (and b!1263416 (not c!122973)) b!1263412))

(assert (= (or b!1263422 b!1263412) bm!62202))

(assert (= (or b!1263417 bm!62202) bm!62203))

(assert (= (or b!1263417 b!1263422) bm!62201))

(assert (= (or b!1263426 bm!62203) bm!62199))

(assert (= (or b!1263426 bm!62201) bm!62205))

(assert (= (and d!138621 res!841552) b!1263430))

(assert (= (and d!138621 c!122968) b!1263420))

(assert (= (and d!138621 (not c!122968)) b!1263410))

(assert (= (and d!138621 res!841558) b!1263428))

(assert (= (and b!1263428 res!841556) b!1263425))

(assert (= (and b!1263428 (not res!841551)) b!1263427))

(assert (= (and b!1263427 res!841554) b!1263419))

(assert (= (and b!1263428 res!841557) b!1263424))

(assert (= (and b!1263424 c!122972) b!1263415))

(assert (= (and b!1263424 (not c!122972)) b!1263429))

(assert (= (and b!1263415 res!841559) b!1263423))

(assert (= (or b!1263415 b!1263429) bm!62200))

(assert (= (and b!1263424 res!841553) b!1263411))

(assert (= (and b!1263411 c!122971) b!1263421))

(assert (= (and b!1263411 (not c!122971)) b!1263418))

(assert (= (and b!1263421 res!841555) b!1263413))

(assert (= (or b!1263421 b!1263418) bm!62204))

(declare-fun b_lambda!22945 () Bool)

(assert (=> (not b_lambda!22945) (not b!1263419)))

(assert (=> b!1263419 t!41769))

(declare-fun b_and!45497 () Bool)

(assert (= b_and!45495 (and (=> t!41769 result!23395) b_and!45497)))

(declare-fun m!1163911 () Bool)

(assert (=> bm!62205 m!1163911))

(declare-fun m!1163913 () Bool)

(assert (=> b!1263423 m!1163913))

(declare-fun m!1163915 () Bool)

(assert (=> bm!62200 m!1163915))

(declare-fun m!1163917 () Bool)

(assert (=> b!1263426 m!1163917))

(declare-fun m!1163919 () Bool)

(assert (=> bm!62204 m!1163919))

(assert (=> b!1263419 m!1163851))

(assert (=> b!1263419 m!1163853))

(assert (=> b!1263419 m!1163855))

(assert (=> b!1263419 m!1163855))

(declare-fun m!1163921 () Bool)

(assert (=> b!1263419 m!1163921))

(assert (=> b!1263419 m!1163853))

(assert (=> b!1263419 m!1163851))

(assert (=> b!1263419 m!1163859))

(assert (=> b!1263430 m!1163855))

(assert (=> b!1263430 m!1163855))

(assert (=> b!1263430 m!1163861))

(assert (=> bm!62199 m!1163799))

(declare-fun m!1163923 () Bool)

(assert (=> b!1263413 m!1163923))

(declare-fun m!1163925 () Bool)

(assert (=> b!1263420 m!1163925))

(declare-fun m!1163927 () Bool)

(assert (=> b!1263420 m!1163927))

(declare-fun m!1163929 () Bool)

(assert (=> b!1263420 m!1163929))

(declare-fun m!1163931 () Bool)

(assert (=> b!1263420 m!1163931))

(declare-fun m!1163933 () Bool)

(assert (=> b!1263420 m!1163933))

(declare-fun m!1163935 () Bool)

(assert (=> b!1263420 m!1163935))

(assert (=> b!1263420 m!1163931))

(assert (=> b!1263420 m!1163799))

(declare-fun m!1163937 () Bool)

(assert (=> b!1263420 m!1163937))

(declare-fun m!1163939 () Bool)

(assert (=> b!1263420 m!1163939))

(assert (=> b!1263420 m!1163937))

(declare-fun m!1163941 () Bool)

(assert (=> b!1263420 m!1163941))

(declare-fun m!1163943 () Bool)

(assert (=> b!1263420 m!1163943))

(declare-fun m!1163945 () Bool)

(assert (=> b!1263420 m!1163945))

(declare-fun m!1163947 () Bool)

(assert (=> b!1263420 m!1163947))

(assert (=> b!1263420 m!1163945))

(declare-fun m!1163949 () Bool)

(assert (=> b!1263420 m!1163949))

(assert (=> b!1263420 m!1163855))

(declare-fun m!1163951 () Bool)

(assert (=> b!1263420 m!1163951))

(assert (=> b!1263420 m!1163925))

(declare-fun m!1163953 () Bool)

(assert (=> b!1263420 m!1163953))

(assert (=> d!138621 m!1163805))

(assert (=> b!1263425 m!1163855))

(assert (=> b!1263425 m!1163855))

(assert (=> b!1263425 m!1163861))

(assert (=> b!1263427 m!1163855))

(assert (=> b!1263427 m!1163855))

(declare-fun m!1163955 () Bool)

(assert (=> b!1263427 m!1163955))

(assert (=> b!1263306 d!138621))

(declare-fun d!138623 () Bool)

(assert (=> d!138623 (= (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573018 () Unit!42111)

(declare-fun choose!1876 (array!82442 array!82440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48577 V!48577 V!48577 V!48577 (_ BitVec 32) Int) Unit!42111)

(assert (=> d!138623 (= lt!573018 (choose!1876 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138623 (validMask!0 mask!1466)))

(assert (=> d!138623 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1187 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573018)))

(declare-fun bs!35746 () Bool)

(assert (= bs!35746 d!138623))

(assert (=> bs!35746 m!1163799))

(assert (=> bs!35746 m!1163797))

(declare-fun m!1163957 () Bool)

(assert (=> bs!35746 m!1163957))

(assert (=> bs!35746 m!1163805))

(assert (=> b!1263303 d!138623))

(declare-fun b!1263455 () Bool)

(declare-fun e!719324 () ListLongMap!18933)

(declare-fun call!62211 () ListLongMap!18933)

(assert (=> b!1263455 (= e!719324 call!62211)))

(declare-fun d!138625 () Bool)

(declare-fun e!719321 () Bool)

(assert (=> d!138625 e!719321))

(declare-fun res!841570 () Bool)

(assert (=> d!138625 (=> (not res!841570) (not e!719321))))

(declare-fun lt!573033 () ListLongMap!18933)

(assert (=> d!138625 (= res!841570 (not (contains!7603 lt!573033 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719322 () ListLongMap!18933)

(assert (=> d!138625 (= lt!573033 e!719322)))

(declare-fun c!122982 () Bool)

(assert (=> d!138625 (= c!122982 (bvsge #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(assert (=> d!138625 (validMask!0 mask!1466)))

(assert (=> d!138625 (= (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573033)))

(declare-fun b!1263456 () Bool)

(declare-fun lt!573037 () Unit!42111)

(declare-fun lt!573039 () Unit!42111)

(assert (=> b!1263456 (= lt!573037 lt!573039)))

(declare-fun lt!573038 () V!48577)

(declare-fun lt!573034 () ListLongMap!18933)

(declare-fun lt!573035 () (_ BitVec 64))

(declare-fun lt!573036 () (_ BitVec 64))

(assert (=> b!1263456 (not (contains!7603 (+!4253 lt!573034 (tuple2!21061 lt!573035 lt!573038)) lt!573036))))

(declare-fun addStillNotContains!329 (ListLongMap!18933 (_ BitVec 64) V!48577 (_ BitVec 64)) Unit!42111)

(assert (=> b!1263456 (= lt!573039 (addStillNotContains!329 lt!573034 lt!573035 lt!573038 lt!573036))))

(assert (=> b!1263456 (= lt!573036 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263456 (= lt!573038 (get!20288 (select (arr!39766 _values!914) #b00000000000000000000000000000000) (dynLambda!3399 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263456 (= lt!573035 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263456 (= lt!573034 call!62211)))

(assert (=> b!1263456 (= e!719324 (+!4253 call!62211 (tuple2!21061 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000) (get!20288 (select (arr!39766 _values!914) #b00000000000000000000000000000000) (dynLambda!3399 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!719323 () Bool)

(declare-fun b!1263457 () Bool)

(assert (=> b!1263457 (= e!719323 (= lt!573033 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263458 () Bool)

(declare-fun e!719320 () Bool)

(assert (=> b!1263458 (= e!719320 e!719323)))

(declare-fun c!122984 () Bool)

(assert (=> b!1263458 (= c!122984 (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun b!1263459 () Bool)

(assert (=> b!1263459 (= e!719321 e!719320)))

(declare-fun c!122985 () Bool)

(declare-fun e!719319 () Bool)

(assert (=> b!1263459 (= c!122985 e!719319)))

(declare-fun res!841571 () Bool)

(assert (=> b!1263459 (=> (not res!841571) (not e!719319))))

(assert (=> b!1263459 (= res!841571 (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun b!1263460 () Bool)

(declare-fun isEmpty!1043 (ListLongMap!18933) Bool)

(assert (=> b!1263460 (= e!719323 (isEmpty!1043 lt!573033))))

(declare-fun b!1263461 () Bool)

(assert (=> b!1263461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(assert (=> b!1263461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40302 _values!914)))))

(declare-fun e!719318 () Bool)

(assert (=> b!1263461 (= e!719318 (= (apply!1001 lt!573033 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)) (get!20288 (select (arr!39766 _values!914) #b00000000000000000000000000000000) (dynLambda!3399 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263462 () Bool)

(assert (=> b!1263462 (= e!719322 e!719324)))

(declare-fun c!122983 () Bool)

(assert (=> b!1263462 (= c!122983 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263463 () Bool)

(declare-fun res!841569 () Bool)

(assert (=> b!1263463 (=> (not res!841569) (not e!719321))))

(assert (=> b!1263463 (= res!841569 (not (contains!7603 lt!573033 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263464 () Bool)

(assert (=> b!1263464 (= e!719320 e!719318)))

(assert (=> b!1263464 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun res!841568 () Bool)

(assert (=> b!1263464 (= res!841568 (contains!7603 lt!573033 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263464 (=> (not res!841568) (not e!719318))))

(declare-fun bm!62208 () Bool)

(assert (=> bm!62208 (= call!62211 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263465 () Bool)

(assert (=> b!1263465 (= e!719322 (ListLongMap!18934 Nil!28248))))

(declare-fun b!1263466 () Bool)

(assert (=> b!1263466 (= e!719319 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263466 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138625 c!122982) b!1263465))

(assert (= (and d!138625 (not c!122982)) b!1263462))

(assert (= (and b!1263462 c!122983) b!1263456))

(assert (= (and b!1263462 (not c!122983)) b!1263455))

(assert (= (or b!1263456 b!1263455) bm!62208))

(assert (= (and d!138625 res!841570) b!1263463))

(assert (= (and b!1263463 res!841569) b!1263459))

(assert (= (and b!1263459 res!841571) b!1263466))

(assert (= (and b!1263459 c!122985) b!1263464))

(assert (= (and b!1263459 (not c!122985)) b!1263458))

(assert (= (and b!1263464 res!841568) b!1263461))

(assert (= (and b!1263458 c!122984) b!1263457))

(assert (= (and b!1263458 (not c!122984)) b!1263460))

(declare-fun b_lambda!22947 () Bool)

(assert (=> (not b_lambda!22947) (not b!1263456)))

(assert (=> b!1263456 t!41769))

(declare-fun b_and!45499 () Bool)

(assert (= b_and!45497 (and (=> t!41769 result!23395) b_and!45499)))

(declare-fun b_lambda!22949 () Bool)

(assert (=> (not b_lambda!22949) (not b!1263461)))

(assert (=> b!1263461 t!41769))

(declare-fun b_and!45501 () Bool)

(assert (= b_and!45499 (and (=> t!41769 result!23395) b_and!45501)))

(declare-fun m!1163959 () Bool)

(assert (=> d!138625 m!1163959))

(assert (=> d!138625 m!1163805))

(assert (=> b!1263456 m!1163855))

(assert (=> b!1263456 m!1163853))

(declare-fun m!1163961 () Bool)

(assert (=> b!1263456 m!1163961))

(declare-fun m!1163963 () Bool)

(assert (=> b!1263456 m!1163963))

(assert (=> b!1263456 m!1163853))

(assert (=> b!1263456 m!1163851))

(assert (=> b!1263456 m!1163859))

(assert (=> b!1263456 m!1163963))

(declare-fun m!1163965 () Bool)

(assert (=> b!1263456 m!1163965))

(declare-fun m!1163967 () Bool)

(assert (=> b!1263456 m!1163967))

(assert (=> b!1263456 m!1163851))

(declare-fun m!1163969 () Bool)

(assert (=> b!1263463 m!1163969))

(declare-fun m!1163971 () Bool)

(assert (=> b!1263460 m!1163971))

(assert (=> b!1263464 m!1163855))

(assert (=> b!1263464 m!1163855))

(declare-fun m!1163973 () Bool)

(assert (=> b!1263464 m!1163973))

(assert (=> b!1263466 m!1163855))

(assert (=> b!1263466 m!1163855))

(assert (=> b!1263466 m!1163861))

(declare-fun m!1163975 () Bool)

(assert (=> b!1263457 m!1163975))

(assert (=> b!1263461 m!1163855))

(assert (=> b!1263461 m!1163853))

(assert (=> b!1263461 m!1163851))

(assert (=> b!1263461 m!1163853))

(assert (=> b!1263461 m!1163851))

(assert (=> b!1263461 m!1163859))

(assert (=> b!1263461 m!1163855))

(declare-fun m!1163977 () Bool)

(assert (=> b!1263461 m!1163977))

(assert (=> bm!62208 m!1163975))

(assert (=> b!1263462 m!1163855))

(assert (=> b!1263462 m!1163855))

(assert (=> b!1263462 m!1163861))

(assert (=> b!1263303 d!138625))

(declare-fun b!1263467 () Bool)

(declare-fun e!719331 () ListLongMap!18933)

(declare-fun call!62212 () ListLongMap!18933)

(assert (=> b!1263467 (= e!719331 call!62212)))

(declare-fun d!138627 () Bool)

(declare-fun e!719328 () Bool)

(assert (=> d!138627 e!719328))

(declare-fun res!841574 () Bool)

(assert (=> d!138627 (=> (not res!841574) (not e!719328))))

(declare-fun lt!573040 () ListLongMap!18933)

(assert (=> d!138627 (= res!841574 (not (contains!7603 lt!573040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719329 () ListLongMap!18933)

(assert (=> d!138627 (= lt!573040 e!719329)))

(declare-fun c!122986 () Bool)

(assert (=> d!138627 (= c!122986 (bvsge #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(assert (=> d!138627 (validMask!0 mask!1466)))

(assert (=> d!138627 (= (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573040)))

(declare-fun b!1263468 () Bool)

(declare-fun lt!573044 () Unit!42111)

(declare-fun lt!573046 () Unit!42111)

(assert (=> b!1263468 (= lt!573044 lt!573046)))

(declare-fun lt!573045 () V!48577)

(declare-fun lt!573041 () ListLongMap!18933)

(declare-fun lt!573042 () (_ BitVec 64))

(declare-fun lt!573043 () (_ BitVec 64))

(assert (=> b!1263468 (not (contains!7603 (+!4253 lt!573041 (tuple2!21061 lt!573042 lt!573045)) lt!573043))))

(assert (=> b!1263468 (= lt!573046 (addStillNotContains!329 lt!573041 lt!573042 lt!573045 lt!573043))))

(assert (=> b!1263468 (= lt!573043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1263468 (= lt!573045 (get!20288 (select (arr!39766 _values!914) #b00000000000000000000000000000000) (dynLambda!3399 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1263468 (= lt!573042 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263468 (= lt!573041 call!62212)))

(assert (=> b!1263468 (= e!719331 (+!4253 call!62212 (tuple2!21061 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000) (get!20288 (select (arr!39766 _values!914) #b00000000000000000000000000000000) (dynLambda!3399 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1263469 () Bool)

(declare-fun e!719330 () Bool)

(assert (=> b!1263469 (= e!719330 (= lt!573040 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1263470 () Bool)

(declare-fun e!719327 () Bool)

(assert (=> b!1263470 (= e!719327 e!719330)))

(declare-fun c!122988 () Bool)

(assert (=> b!1263470 (= c!122988 (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun b!1263471 () Bool)

(assert (=> b!1263471 (= e!719328 e!719327)))

(declare-fun c!122989 () Bool)

(declare-fun e!719326 () Bool)

(assert (=> b!1263471 (= c!122989 e!719326)))

(declare-fun res!841575 () Bool)

(assert (=> b!1263471 (=> (not res!841575) (not e!719326))))

(assert (=> b!1263471 (= res!841575 (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun b!1263472 () Bool)

(assert (=> b!1263472 (= e!719330 (isEmpty!1043 lt!573040))))

(declare-fun b!1263473 () Bool)

(assert (=> b!1263473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(assert (=> b!1263473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40302 _values!914)))))

(declare-fun e!719325 () Bool)

(assert (=> b!1263473 (= e!719325 (= (apply!1001 lt!573040 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)) (get!20288 (select (arr!39766 _values!914) #b00000000000000000000000000000000) (dynLambda!3399 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1263474 () Bool)

(assert (=> b!1263474 (= e!719329 e!719331)))

(declare-fun c!122987 () Bool)

(assert (=> b!1263474 (= c!122987 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263475 () Bool)

(declare-fun res!841573 () Bool)

(assert (=> b!1263475 (=> (not res!841573) (not e!719328))))

(assert (=> b!1263475 (= res!841573 (not (contains!7603 lt!573040 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263476 () Bool)

(assert (=> b!1263476 (= e!719327 e!719325)))

(assert (=> b!1263476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(declare-fun res!841572 () Bool)

(assert (=> b!1263476 (= res!841572 (contains!7603 lt!573040 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263476 (=> (not res!841572) (not e!719325))))

(declare-fun bm!62209 () Bool)

(assert (=> bm!62209 (= call!62212 (getCurrentListMapNoExtraKeys!5845 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1263477 () Bool)

(assert (=> b!1263477 (= e!719329 (ListLongMap!18934 Nil!28248))))

(declare-fun b!1263478 () Bool)

(assert (=> b!1263478 (= e!719326 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263478 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!138627 c!122986) b!1263477))

(assert (= (and d!138627 (not c!122986)) b!1263474))

(assert (= (and b!1263474 c!122987) b!1263468))

(assert (= (and b!1263474 (not c!122987)) b!1263467))

(assert (= (or b!1263468 b!1263467) bm!62209))

(assert (= (and d!138627 res!841574) b!1263475))

(assert (= (and b!1263475 res!841573) b!1263471))

(assert (= (and b!1263471 res!841575) b!1263478))

(assert (= (and b!1263471 c!122989) b!1263476))

(assert (= (and b!1263471 (not c!122989)) b!1263470))

(assert (= (and b!1263476 res!841572) b!1263473))

(assert (= (and b!1263470 c!122988) b!1263469))

(assert (= (and b!1263470 (not c!122988)) b!1263472))

(declare-fun b_lambda!22951 () Bool)

(assert (=> (not b_lambda!22951) (not b!1263468)))

(assert (=> b!1263468 t!41769))

(declare-fun b_and!45503 () Bool)

(assert (= b_and!45501 (and (=> t!41769 result!23395) b_and!45503)))

(declare-fun b_lambda!22953 () Bool)

(assert (=> (not b_lambda!22953) (not b!1263473)))

(assert (=> b!1263473 t!41769))

(declare-fun b_and!45505 () Bool)

(assert (= b_and!45503 (and (=> t!41769 result!23395) b_and!45505)))

(declare-fun m!1163979 () Bool)

(assert (=> d!138627 m!1163979))

(assert (=> d!138627 m!1163805))

(assert (=> b!1263468 m!1163855))

(assert (=> b!1263468 m!1163853))

(declare-fun m!1163981 () Bool)

(assert (=> b!1263468 m!1163981))

(declare-fun m!1163983 () Bool)

(assert (=> b!1263468 m!1163983))

(assert (=> b!1263468 m!1163853))

(assert (=> b!1263468 m!1163851))

(assert (=> b!1263468 m!1163859))

(assert (=> b!1263468 m!1163983))

(declare-fun m!1163985 () Bool)

(assert (=> b!1263468 m!1163985))

(declare-fun m!1163987 () Bool)

(assert (=> b!1263468 m!1163987))

(assert (=> b!1263468 m!1163851))

(declare-fun m!1163989 () Bool)

(assert (=> b!1263475 m!1163989))

(declare-fun m!1163991 () Bool)

(assert (=> b!1263472 m!1163991))

(assert (=> b!1263476 m!1163855))

(assert (=> b!1263476 m!1163855))

(declare-fun m!1163993 () Bool)

(assert (=> b!1263476 m!1163993))

(assert (=> b!1263478 m!1163855))

(assert (=> b!1263478 m!1163855))

(assert (=> b!1263478 m!1163861))

(declare-fun m!1163995 () Bool)

(assert (=> b!1263469 m!1163995))

(assert (=> b!1263473 m!1163855))

(assert (=> b!1263473 m!1163853))

(assert (=> b!1263473 m!1163851))

(assert (=> b!1263473 m!1163853))

(assert (=> b!1263473 m!1163851))

(assert (=> b!1263473 m!1163859))

(assert (=> b!1263473 m!1163855))

(declare-fun m!1163997 () Bool)

(assert (=> b!1263473 m!1163997))

(assert (=> bm!62209 m!1163995))

(assert (=> b!1263474 m!1163855))

(assert (=> b!1263474 m!1163855))

(assert (=> b!1263474 m!1163861))

(assert (=> b!1263303 d!138627))

(declare-fun b!1263487 () Bool)

(declare-fun e!719338 () Bool)

(declare-fun call!62215 () Bool)

(assert (=> b!1263487 (= e!719338 call!62215)))

(declare-fun d!138629 () Bool)

(declare-fun res!841581 () Bool)

(declare-fun e!719339 () Bool)

(assert (=> d!138629 (=> res!841581 e!719339)))

(assert (=> d!138629 (= res!841581 (bvsge #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(assert (=> d!138629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719339)))

(declare-fun b!1263488 () Bool)

(declare-fun e!719340 () Bool)

(assert (=> b!1263488 (= e!719340 e!719338)))

(declare-fun lt!573053 () (_ BitVec 64))

(assert (=> b!1263488 (= lt!573053 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573055 () Unit!42111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82442 (_ BitVec 64) (_ BitVec 32)) Unit!42111)

(assert (=> b!1263488 (= lt!573055 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573053 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263488 (arrayContainsKey!0 _keys!1118 lt!573053 #b00000000000000000000000000000000)))

(declare-fun lt!573054 () Unit!42111)

(assert (=> b!1263488 (= lt!573054 lt!573055)))

(declare-fun res!841580 () Bool)

(declare-datatypes ((SeekEntryResult!9979 0))(
  ( (MissingZero!9979 (index!42287 (_ BitVec 32))) (Found!9979 (index!42288 (_ BitVec 32))) (Intermediate!9979 (undefined!10791 Bool) (index!42289 (_ BitVec 32)) (x!111325 (_ BitVec 32))) (Undefined!9979) (MissingVacant!9979 (index!42290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82442 (_ BitVec 32)) SeekEntryResult!9979)

(assert (=> b!1263488 (= res!841580 (= (seekEntryOrOpen!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9979 #b00000000000000000000000000000000)))))

(assert (=> b!1263488 (=> (not res!841580) (not e!719338))))

(declare-fun b!1263489 () Bool)

(assert (=> b!1263489 (= e!719340 call!62215)))

(declare-fun b!1263490 () Bool)

(assert (=> b!1263490 (= e!719339 e!719340)))

(declare-fun c!122992 () Bool)

(assert (=> b!1263490 (= c!122992 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62212 () Bool)

(assert (=> bm!62212 (= call!62215 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138629 (not res!841581)) b!1263490))

(assert (= (and b!1263490 c!122992) b!1263488))

(assert (= (and b!1263490 (not c!122992)) b!1263489))

(assert (= (and b!1263488 res!841580) b!1263487))

(assert (= (or b!1263487 b!1263489) bm!62212))

(assert (=> b!1263488 m!1163855))

(declare-fun m!1163999 () Bool)

(assert (=> b!1263488 m!1163999))

(declare-fun m!1164001 () Bool)

(assert (=> b!1263488 m!1164001))

(assert (=> b!1263488 m!1163855))

(declare-fun m!1164003 () Bool)

(assert (=> b!1263488 m!1164003))

(assert (=> b!1263490 m!1163855))

(assert (=> b!1263490 m!1163855))

(assert (=> b!1263490 m!1163861))

(declare-fun m!1164005 () Bool)

(assert (=> bm!62212 m!1164005))

(assert (=> b!1263308 d!138629))

(declare-fun d!138631 () Bool)

(assert (=> d!138631 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106092 d!138631))

(declare-fun d!138633 () Bool)

(assert (=> d!138633 (= (array_inv!30265 _keys!1118) (bvsge (size!40303 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106092 d!138633))

(declare-fun d!138635 () Bool)

(assert (=> d!138635 (= (array_inv!30266 _values!914) (bvsge (size!40302 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106092 d!138635))

(declare-fun b!1263501 () Bool)

(declare-fun e!719349 () Bool)

(declare-fun call!62218 () Bool)

(assert (=> b!1263501 (= e!719349 call!62218)))

(declare-fun b!1263502 () Bool)

(declare-fun e!719351 () Bool)

(assert (=> b!1263502 (= e!719351 e!719349)))

(declare-fun c!122995 () Bool)

(assert (=> b!1263502 (= c!122995 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263503 () Bool)

(declare-fun e!719352 () Bool)

(declare-fun contains!7605 (List!28252 (_ BitVec 64)) Bool)

(assert (=> b!1263503 (= e!719352 (contains!7605 Nil!28249 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263504 () Bool)

(declare-fun e!719350 () Bool)

(assert (=> b!1263504 (= e!719350 e!719351)))

(declare-fun res!841589 () Bool)

(assert (=> b!1263504 (=> (not res!841589) (not e!719351))))

(assert (=> b!1263504 (= res!841589 (not e!719352))))

(declare-fun res!841590 () Bool)

(assert (=> b!1263504 (=> (not res!841590) (not e!719352))))

(assert (=> b!1263504 (= res!841590 (validKeyInArray!0 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263505 () Bool)

(assert (=> b!1263505 (= e!719349 call!62218)))

(declare-fun bm!62215 () Bool)

(assert (=> bm!62215 (= call!62218 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122995 (Cons!28248 (select (arr!39767 _keys!1118) #b00000000000000000000000000000000) Nil!28249) Nil!28249)))))

(declare-fun d!138637 () Bool)

(declare-fun res!841588 () Bool)

(assert (=> d!138637 (=> res!841588 e!719350)))

(assert (=> d!138637 (= res!841588 (bvsge #b00000000000000000000000000000000 (size!40303 _keys!1118)))))

(assert (=> d!138637 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28249) e!719350)))

(assert (= (and d!138637 (not res!841588)) b!1263504))

(assert (= (and b!1263504 res!841590) b!1263503))

(assert (= (and b!1263504 res!841589) b!1263502))

(assert (= (and b!1263502 c!122995) b!1263505))

(assert (= (and b!1263502 (not c!122995)) b!1263501))

(assert (= (or b!1263505 b!1263501) bm!62215))

(assert (=> b!1263502 m!1163855))

(assert (=> b!1263502 m!1163855))

(assert (=> b!1263502 m!1163861))

(assert (=> b!1263503 m!1163855))

(assert (=> b!1263503 m!1163855))

(declare-fun m!1164007 () Bool)

(assert (=> b!1263503 m!1164007))

(assert (=> b!1263504 m!1163855))

(assert (=> b!1263504 m!1163855))

(assert (=> b!1263504 m!1163861))

(assert (=> bm!62215 m!1163855))

(declare-fun m!1164009 () Bool)

(assert (=> bm!62215 m!1164009))

(assert (=> b!1263304 d!138637))

(declare-fun b!1263513 () Bool)

(declare-fun e!719357 () Bool)

(assert (=> b!1263513 (= e!719357 tp_is_empty!32409)))

(declare-fun mapNonEmpty!50443 () Bool)

(declare-fun mapRes!50443 () Bool)

(declare-fun tp!96083 () Bool)

(declare-fun e!719358 () Bool)

(assert (=> mapNonEmpty!50443 (= mapRes!50443 (and tp!96083 e!719358))))

(declare-fun mapValue!50443 () ValueCell!15441)

(declare-fun mapRest!50443 () (Array (_ BitVec 32) ValueCell!15441))

(declare-fun mapKey!50443 () (_ BitVec 32))

(assert (=> mapNonEmpty!50443 (= mapRest!50437 (store mapRest!50443 mapKey!50443 mapValue!50443))))

(declare-fun b!1263512 () Bool)

(assert (=> b!1263512 (= e!719358 tp_is_empty!32409)))

(declare-fun mapIsEmpty!50443 () Bool)

(assert (=> mapIsEmpty!50443 mapRes!50443))

(declare-fun condMapEmpty!50443 () Bool)

(declare-fun mapDefault!50443 () ValueCell!15441)

(assert (=> mapNonEmpty!50437 (= condMapEmpty!50443 (= mapRest!50437 ((as const (Array (_ BitVec 32) ValueCell!15441)) mapDefault!50443)))))

(assert (=> mapNonEmpty!50437 (= tp!96073 (and e!719357 mapRes!50443))))

(assert (= (and mapNonEmpty!50437 condMapEmpty!50443) mapIsEmpty!50443))

(assert (= (and mapNonEmpty!50437 (not condMapEmpty!50443)) mapNonEmpty!50443))

(assert (= (and mapNonEmpty!50443 ((_ is ValueCellFull!15441) mapValue!50443)) b!1263512))

(assert (= (and mapNonEmpty!50437 ((_ is ValueCellFull!15441) mapDefault!50443)) b!1263513))

(declare-fun m!1164011 () Bool)

(assert (=> mapNonEmpty!50443 m!1164011))

(declare-fun b_lambda!22955 () Bool)

(assert (= b_lambda!22945 (or (and start!106092 b_free!27507) b_lambda!22955)))

(declare-fun b_lambda!22957 () Bool)

(assert (= b_lambda!22949 (or (and start!106092 b_free!27507) b_lambda!22957)))

(declare-fun b_lambda!22959 () Bool)

(assert (= b_lambda!22951 (or (and start!106092 b_free!27507) b_lambda!22959)))

(declare-fun b_lambda!22961 () Bool)

(assert (= b_lambda!22953 (or (and start!106092 b_free!27507) b_lambda!22961)))

(declare-fun b_lambda!22963 () Bool)

(assert (= b_lambda!22943 (or (and start!106092 b_free!27507) b_lambda!22963)))

(declare-fun b_lambda!22965 () Bool)

(assert (= b_lambda!22947 (or (and start!106092 b_free!27507) b_lambda!22965)))

(check-sat (not b!1263503) (not b!1263391) (not b_lambda!22961) (not b!1263394) (not b!1263474) (not bm!62200) (not b!1263398) (not d!138625) (not bm!62197) (not b!1263413) (not b!1263409) (not b!1263387) (not bm!62205) (not b!1263395) (not bm!62212) (not d!138617) (not b!1263466) tp_is_empty!32409 (not bm!62208) (not bm!62204) (not b_lambda!22963) (not b!1263469) (not b!1263462) b_and!45505 (not b!1263420) (not b!1263381) (not b_lambda!22955) (not bm!62199) (not d!138627) (not b_lambda!22957) (not b!1263502) (not b!1263460) (not mapNonEmpty!50443) (not b!1263425) (not b!1263488) (not b!1263430) (not b!1263468) (not bm!62215) (not d!138623) (not d!138621) (not b!1263475) (not b_lambda!22959) (not b!1263476) (not b!1263490) (not b!1263463) (not b!1263473) (not b!1263457) (not b_lambda!22965) (not b!1263427) (not b!1263407) (not b!1263388) (not b_next!27507) (not d!138615) (not d!138619) (not b!1263504) (not b!1263472) (not bm!62209) (not bm!62198) (not b!1263464) (not b!1263423) (not b!1263456) (not b!1263461) (not b!1263419) (not b!1263478) (not d!138613) (not b!1263393) (not bm!62193) (not b!1263426) (not bm!62192))
(check-sat b_and!45505 (not b_next!27507))
