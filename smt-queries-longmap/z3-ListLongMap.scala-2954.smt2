; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41930 () Bool)

(assert start!41930)

(declare-fun b_free!11533 () Bool)

(declare-fun b_next!11533 () Bool)

(assert (=> start!41930 (= b_free!11533 (not b_next!11533))))

(declare-fun tp!40611 () Bool)

(declare-fun b_and!19931 () Bool)

(assert (=> start!41930 (= tp!40611 b_and!19931)))

(declare-fun b!468241 () Bool)

(declare-fun res!279879 () Bool)

(declare-fun e!274026 () Bool)

(assert (=> b!468241 (=> (not res!279879) (not e!274026))))

(declare-datatypes ((array!29686 0))(
  ( (array!29687 (arr!14269 (Array (_ BitVec 32) (_ BitVec 64))) (size!14621 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29686)

(declare-datatypes ((List!8577 0))(
  ( (Nil!8574) (Cons!8573 (h!9429 (_ BitVec 64)) (t!14525 List!8577)) )
))
(declare-fun arrayNoDuplicates!0 (array!29686 (_ BitVec 32) List!8577) Bool)

(assert (=> b!468241 (= res!279879 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8574))))

(declare-fun b!468242 () Bool)

(declare-fun e!274030 () Bool)

(declare-fun e!274028 () Bool)

(declare-fun mapRes!21133 () Bool)

(assert (=> b!468242 (= e!274030 (and e!274028 mapRes!21133))))

(declare-fun condMapEmpty!21133 () Bool)

(declare-datatypes ((V!18387 0))(
  ( (V!18388 (val!6525 Int)) )
))
(declare-datatypes ((ValueCell!6137 0))(
  ( (ValueCellFull!6137 (v!8815 V!18387)) (EmptyCell!6137) )
))
(declare-datatypes ((array!29688 0))(
  ( (array!29689 (arr!14270 (Array (_ BitVec 32) ValueCell!6137)) (size!14622 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29688)

(declare-fun mapDefault!21133 () ValueCell!6137)

(assert (=> b!468242 (= condMapEmpty!21133 (= (arr!14270 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6137)) mapDefault!21133)))))

(declare-fun mapNonEmpty!21133 () Bool)

(declare-fun tp!40612 () Bool)

(declare-fun e!274029 () Bool)

(assert (=> mapNonEmpty!21133 (= mapRes!21133 (and tp!40612 e!274029))))

(declare-fun mapRest!21133 () (Array (_ BitVec 32) ValueCell!6137))

(declare-fun mapKey!21133 () (_ BitVec 32))

(declare-fun mapValue!21133 () ValueCell!6137)

(assert (=> mapNonEmpty!21133 (= (arr!14270 _values!833) (store mapRest!21133 mapKey!21133 mapValue!21133))))

(declare-fun b!468243 () Bool)

(declare-fun e!274027 () Bool)

(assert (=> b!468243 (= e!274026 (not e!274027))))

(declare-fun res!279876 () Bool)

(assert (=> b!468243 (=> res!279876 e!274027)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468243 (= res!279876 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8498 0))(
  ( (tuple2!8499 (_1!4260 (_ BitVec 64)) (_2!4260 V!18387)) )
))
(declare-datatypes ((List!8578 0))(
  ( (Nil!8575) (Cons!8574 (h!9430 tuple2!8498) (t!14526 List!8578)) )
))
(declare-datatypes ((ListLongMap!7413 0))(
  ( (ListLongMap!7414 (toList!3722 List!8578)) )
))
(declare-fun lt!211779 () ListLongMap!7413)

(declare-fun lt!211776 () ListLongMap!7413)

(assert (=> b!468243 (= lt!211779 lt!211776)))

(declare-fun minValueBefore!38 () V!18387)

(declare-fun zeroValue!794 () V!18387)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13652 0))(
  ( (Unit!13653) )
))
(declare-fun lt!211777 () Unit!13652)

(declare-fun minValueAfter!38 () V!18387)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!102 (array!29686 array!29688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 V!18387 V!18387 (_ BitVec 32) Int) Unit!13652)

(assert (=> b!468243 (= lt!211777 (lemmaNoChangeToArrayThenSameMapNoExtras!102 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1942 (array!29686 array!29688 (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 (_ BitVec 32) Int) ListLongMap!7413)

(assert (=> b!468243 (= lt!211776 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468243 (= lt!211779 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279877 () Bool)

(assert (=> start!41930 (=> (not res!279877) (not e!274026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41930 (= res!279877 (validMask!0 mask!1365))))

(assert (=> start!41930 e!274026))

(declare-fun tp_is_empty!12961 () Bool)

(assert (=> start!41930 tp_is_empty!12961))

(assert (=> start!41930 tp!40611))

(assert (=> start!41930 true))

(declare-fun array_inv!10392 (array!29686) Bool)

(assert (=> start!41930 (array_inv!10392 _keys!1025)))

(declare-fun array_inv!10393 (array!29688) Bool)

(assert (=> start!41930 (and (array_inv!10393 _values!833) e!274030)))

(declare-fun b!468244 () Bool)

(assert (=> b!468244 (= e!274029 tp_is_empty!12961)))

(declare-fun mapIsEmpty!21133 () Bool)

(assert (=> mapIsEmpty!21133 mapRes!21133))

(declare-fun b!468245 () Bool)

(assert (=> b!468245 (= e!274028 tp_is_empty!12961)))

(declare-fun b!468246 () Bool)

(declare-fun res!279875 () Bool)

(assert (=> b!468246 (=> (not res!279875) (not e!274026))))

(assert (=> b!468246 (= res!279875 (and (= (size!14622 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14621 _keys!1025) (size!14622 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468247 () Bool)

(assert (=> b!468247 (= e!274027 (bvsle #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun lt!211778 () ListLongMap!7413)

(declare-fun getCurrentListMap!2151 (array!29686 array!29688 (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 (_ BitVec 32) Int) ListLongMap!7413)

(assert (=> b!468247 (= lt!211778 (getCurrentListMap!2151 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468248 () Bool)

(declare-fun res!279878 () Bool)

(assert (=> b!468248 (=> (not res!279878) (not e!274026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29686 (_ BitVec 32)) Bool)

(assert (=> b!468248 (= res!279878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41930 res!279877) b!468246))

(assert (= (and b!468246 res!279875) b!468248))

(assert (= (and b!468248 res!279878) b!468241))

(assert (= (and b!468241 res!279879) b!468243))

(assert (= (and b!468243 (not res!279876)) b!468247))

(assert (= (and b!468242 condMapEmpty!21133) mapIsEmpty!21133))

(assert (= (and b!468242 (not condMapEmpty!21133)) mapNonEmpty!21133))

(get-info :version)

(assert (= (and mapNonEmpty!21133 ((_ is ValueCellFull!6137) mapValue!21133)) b!468244))

(assert (= (and b!468242 ((_ is ValueCellFull!6137) mapDefault!21133)) b!468245))

(assert (= start!41930 b!468242))

(declare-fun m!450491 () Bool)

(assert (=> mapNonEmpty!21133 m!450491))

(declare-fun m!450493 () Bool)

(assert (=> start!41930 m!450493))

(declare-fun m!450495 () Bool)

(assert (=> start!41930 m!450495))

(declare-fun m!450497 () Bool)

(assert (=> start!41930 m!450497))

(declare-fun m!450499 () Bool)

(assert (=> b!468241 m!450499))

(declare-fun m!450501 () Bool)

(assert (=> b!468247 m!450501))

(declare-fun m!450503 () Bool)

(assert (=> b!468248 m!450503))

(declare-fun m!450505 () Bool)

(assert (=> b!468243 m!450505))

(declare-fun m!450507 () Bool)

(assert (=> b!468243 m!450507))

(declare-fun m!450509 () Bool)

(assert (=> b!468243 m!450509))

(check-sat (not b!468247) (not b_next!11533) b_and!19931 (not b!468241) tp_is_empty!12961 (not mapNonEmpty!21133) (not b!468243) (not b!468248) (not start!41930))
(check-sat b_and!19931 (not b_next!11533))
(get-model)

(declare-fun d!75265 () Bool)

(assert (=> d!75265 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41930 d!75265))

(declare-fun d!75267 () Bool)

(assert (=> d!75267 (= (array_inv!10392 _keys!1025) (bvsge (size!14621 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41930 d!75267))

(declare-fun d!75269 () Bool)

(assert (=> d!75269 (= (array_inv!10393 _values!833) (bvsge (size!14622 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41930 d!75269))

(declare-fun bm!30310 () Bool)

(declare-fun call!30313 () Bool)

(declare-fun c!56786 () Bool)

(assert (=> bm!30310 (= call!30313 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56786 (Cons!8573 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000) Nil!8574) Nil!8574)))))

(declare-fun b!468307 () Bool)

(declare-fun e!274076 () Bool)

(assert (=> b!468307 (= e!274076 call!30313)))

(declare-fun b!468308 () Bool)

(assert (=> b!468308 (= e!274076 call!30313)))

(declare-fun d!75271 () Bool)

(declare-fun res!279917 () Bool)

(declare-fun e!274078 () Bool)

(assert (=> d!75271 (=> res!279917 e!274078)))

(assert (=> d!75271 (= res!279917 (bvsge #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(assert (=> d!75271 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8574) e!274078)))

(declare-fun b!468309 () Bool)

(declare-fun e!274077 () Bool)

(declare-fun contains!2513 (List!8577 (_ BitVec 64)) Bool)

(assert (=> b!468309 (= e!274077 (contains!2513 Nil!8574 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468310 () Bool)

(declare-fun e!274075 () Bool)

(assert (=> b!468310 (= e!274078 e!274075)))

(declare-fun res!279916 () Bool)

(assert (=> b!468310 (=> (not res!279916) (not e!274075))))

(assert (=> b!468310 (= res!279916 (not e!274077))))

(declare-fun res!279918 () Bool)

(assert (=> b!468310 (=> (not res!279918) (not e!274077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!468310 (= res!279918 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468311 () Bool)

(assert (=> b!468311 (= e!274075 e!274076)))

(assert (=> b!468311 (= c!56786 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75271 (not res!279917)) b!468310))

(assert (= (and b!468310 res!279918) b!468309))

(assert (= (and b!468310 res!279916) b!468311))

(assert (= (and b!468311 c!56786) b!468308))

(assert (= (and b!468311 (not c!56786)) b!468307))

(assert (= (or b!468308 b!468307) bm!30310))

(declare-fun m!450551 () Bool)

(assert (=> bm!30310 m!450551))

(declare-fun m!450553 () Bool)

(assert (=> bm!30310 m!450553))

(assert (=> b!468309 m!450551))

(assert (=> b!468309 m!450551))

(declare-fun m!450555 () Bool)

(assert (=> b!468309 m!450555))

(assert (=> b!468310 m!450551))

(assert (=> b!468310 m!450551))

(declare-fun m!450557 () Bool)

(assert (=> b!468310 m!450557))

(assert (=> b!468311 m!450551))

(assert (=> b!468311 m!450551))

(assert (=> b!468311 m!450557))

(assert (=> b!468241 d!75271))

(declare-fun b!468354 () Bool)

(declare-fun e!274107 () Bool)

(assert (=> b!468354 (= e!274107 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468355 () Bool)

(declare-fun e!274105 () Bool)

(declare-fun e!274110 () Bool)

(assert (=> b!468355 (= e!274105 e!274110)))

(declare-fun res!279945 () Bool)

(declare-fun call!30329 () Bool)

(assert (=> b!468355 (= res!279945 call!30329)))

(assert (=> b!468355 (=> (not res!279945) (not e!274110))))

(declare-fun b!468356 () Bool)

(declare-fun e!274114 () Bool)

(assert (=> b!468356 (= e!274114 e!274105)))

(declare-fun c!56802 () Bool)

(assert (=> b!468356 (= c!56802 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!468357 () Bool)

(declare-fun res!279944 () Bool)

(assert (=> b!468357 (=> (not res!279944) (not e!274114))))

(declare-fun e!274111 () Bool)

(assert (=> b!468357 (= res!279944 e!274111)))

(declare-fun res!279939 () Bool)

(assert (=> b!468357 (=> res!279939 e!274111)))

(declare-fun e!274117 () Bool)

(assert (=> b!468357 (= res!279939 (not e!274117))))

(declare-fun res!279941 () Bool)

(assert (=> b!468357 (=> (not res!279941) (not e!274117))))

(assert (=> b!468357 (= res!279941 (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun b!468358 () Bool)

(declare-fun e!274115 () Unit!13652)

(declare-fun Unit!13654 () Unit!13652)

(assert (=> b!468358 (= e!274115 Unit!13654)))

(declare-fun b!468359 () Bool)

(declare-fun e!274116 () Bool)

(declare-fun lt!211849 () ListLongMap!7413)

(declare-fun apply!325 (ListLongMap!7413 (_ BitVec 64)) V!18387)

(assert (=> b!468359 (= e!274116 (= (apply!325 lt!211849 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!468360 () Bool)

(declare-fun res!279943 () Bool)

(assert (=> b!468360 (=> (not res!279943) (not e!274114))))

(declare-fun e!274109 () Bool)

(assert (=> b!468360 (= res!279943 e!274109)))

(declare-fun c!56804 () Bool)

(assert (=> b!468360 (= c!56804 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!468361 () Bool)

(declare-fun e!274106 () ListLongMap!7413)

(declare-fun call!30330 () ListLongMap!7413)

(assert (=> b!468361 (= e!274106 call!30330)))

(declare-fun b!468362 () Bool)

(declare-fun call!30332 () Bool)

(assert (=> b!468362 (= e!274109 (not call!30332))))

(declare-fun d!75273 () Bool)

(assert (=> d!75273 e!274114))

(declare-fun res!279938 () Bool)

(assert (=> d!75273 (=> (not res!279938) (not e!274114))))

(assert (=> d!75273 (= res!279938 (or (bvsge #b00000000000000000000000000000000 (size!14621 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))))

(declare-fun lt!211856 () ListLongMap!7413)

(assert (=> d!75273 (= lt!211849 lt!211856)))

(declare-fun lt!211848 () Unit!13652)

(assert (=> d!75273 (= lt!211848 e!274115)))

(declare-fun c!56800 () Bool)

(assert (=> d!75273 (= c!56800 e!274107)))

(declare-fun res!279942 () Bool)

(assert (=> d!75273 (=> (not res!279942) (not e!274107))))

(assert (=> d!75273 (= res!279942 (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun e!274112 () ListLongMap!7413)

(assert (=> d!75273 (= lt!211856 e!274112)))

(declare-fun c!56801 () Bool)

(assert (=> d!75273 (= c!56801 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75273 (validMask!0 mask!1365)))

(assert (=> d!75273 (= (getCurrentListMap!2151 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211849)))

(declare-fun call!30333 () ListLongMap!7413)

(declare-fun bm!30325 () Bool)

(assert (=> bm!30325 (= call!30333 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun bm!30326 () Bool)

(declare-fun call!30334 () ListLongMap!7413)

(assert (=> bm!30326 (= call!30334 call!30333)))

(declare-fun b!468363 () Bool)

(assert (=> b!468363 (= e!274110 (= (apply!325 lt!211849 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun bm!30327 () Bool)

(declare-fun call!30328 () ListLongMap!7413)

(assert (=> bm!30327 (= call!30330 call!30328)))

(declare-fun b!468364 () Bool)

(assert (=> b!468364 (= e!274109 e!274116)))

(declare-fun res!279940 () Bool)

(assert (=> b!468364 (= res!279940 call!30332)))

(assert (=> b!468364 (=> (not res!279940) (not e!274116))))

(declare-fun bm!30328 () Bool)

(declare-fun call!30331 () ListLongMap!7413)

(assert (=> bm!30328 (= call!30331 call!30334)))

(declare-fun bm!30329 () Bool)

(declare-fun contains!2514 (ListLongMap!7413 (_ BitVec 64)) Bool)

(assert (=> bm!30329 (= call!30329 (contains!2514 lt!211849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!468365 () Bool)

(declare-fun e!274113 () ListLongMap!7413)

(assert (=> b!468365 (= e!274113 call!30330)))

(declare-fun b!468366 () Bool)

(assert (=> b!468366 (= e!274117 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun e!274108 () Bool)

(declare-fun b!468367 () Bool)

(declare-fun get!6985 (ValueCell!6137 V!18387) V!18387)

(declare-fun dynLambda!915 (Int (_ BitVec 64)) V!18387)

(assert (=> b!468367 (= e!274108 (= (apply!325 lt!211849 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)) (get!6985 (select (arr!14270 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!468367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _values!833)))))

(assert (=> b!468367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun b!468368 () Bool)

(declare-fun +!1685 (ListLongMap!7413 tuple2!8498) ListLongMap!7413)

(assert (=> b!468368 (= e!274112 (+!1685 call!30328 (tuple2!8499 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun c!56803 () Bool)

(declare-fun bm!30330 () Bool)

(assert (=> bm!30330 (= call!30328 (+!1685 (ite c!56801 call!30333 (ite c!56803 call!30334 call!30331)) (ite (or c!56801 c!56803) (tuple2!8499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8499 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!468369 () Bool)

(assert (=> b!468369 (= e!274112 e!274113)))

(assert (=> b!468369 (= c!56803 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!468370 () Bool)

(assert (=> b!468370 (= e!274105 (not call!30329))))

(declare-fun b!468371 () Bool)

(assert (=> b!468371 (= e!274106 call!30331)))

(declare-fun bm!30331 () Bool)

(assert (=> bm!30331 (= call!30332 (contains!2514 lt!211849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!468372 () Bool)

(declare-fun c!56799 () Bool)

(assert (=> b!468372 (= c!56799 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!468372 (= e!274113 e!274106)))

(declare-fun b!468373 () Bool)

(assert (=> b!468373 (= e!274111 e!274108)))

(declare-fun res!279937 () Bool)

(assert (=> b!468373 (=> (not res!279937) (not e!274108))))

(assert (=> b!468373 (= res!279937 (contains!2514 lt!211849 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun b!468374 () Bool)

(declare-fun lt!211867 () Unit!13652)

(assert (=> b!468374 (= e!274115 lt!211867)))

(declare-fun lt!211864 () ListLongMap!7413)

(assert (=> b!468374 (= lt!211864 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211868 () (_ BitVec 64))

(assert (=> b!468374 (= lt!211868 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211850 () (_ BitVec 64))

(assert (=> b!468374 (= lt!211850 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211859 () Unit!13652)

(declare-fun addStillContains!287 (ListLongMap!7413 (_ BitVec 64) V!18387 (_ BitVec 64)) Unit!13652)

(assert (=> b!468374 (= lt!211859 (addStillContains!287 lt!211864 lt!211868 zeroValue!794 lt!211850))))

(assert (=> b!468374 (contains!2514 (+!1685 lt!211864 (tuple2!8499 lt!211868 zeroValue!794)) lt!211850)))

(declare-fun lt!211860 () Unit!13652)

(assert (=> b!468374 (= lt!211860 lt!211859)))

(declare-fun lt!211857 () ListLongMap!7413)

(assert (=> b!468374 (= lt!211857 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211853 () (_ BitVec 64))

(assert (=> b!468374 (= lt!211853 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211862 () (_ BitVec 64))

(assert (=> b!468374 (= lt!211862 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211855 () Unit!13652)

(declare-fun addApplyDifferent!287 (ListLongMap!7413 (_ BitVec 64) V!18387 (_ BitVec 64)) Unit!13652)

(assert (=> b!468374 (= lt!211855 (addApplyDifferent!287 lt!211857 lt!211853 minValueBefore!38 lt!211862))))

(assert (=> b!468374 (= (apply!325 (+!1685 lt!211857 (tuple2!8499 lt!211853 minValueBefore!38)) lt!211862) (apply!325 lt!211857 lt!211862))))

(declare-fun lt!211854 () Unit!13652)

(assert (=> b!468374 (= lt!211854 lt!211855)))

(declare-fun lt!211861 () ListLongMap!7413)

(assert (=> b!468374 (= lt!211861 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211851 () (_ BitVec 64))

(assert (=> b!468374 (= lt!211851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211869 () (_ BitVec 64))

(assert (=> b!468374 (= lt!211869 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211866 () Unit!13652)

(assert (=> b!468374 (= lt!211866 (addApplyDifferent!287 lt!211861 lt!211851 zeroValue!794 lt!211869))))

(assert (=> b!468374 (= (apply!325 (+!1685 lt!211861 (tuple2!8499 lt!211851 zeroValue!794)) lt!211869) (apply!325 lt!211861 lt!211869))))

(declare-fun lt!211863 () Unit!13652)

(assert (=> b!468374 (= lt!211863 lt!211866)))

(declare-fun lt!211865 () ListLongMap!7413)

(assert (=> b!468374 (= lt!211865 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211852 () (_ BitVec 64))

(assert (=> b!468374 (= lt!211852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!211858 () (_ BitVec 64))

(assert (=> b!468374 (= lt!211858 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468374 (= lt!211867 (addApplyDifferent!287 lt!211865 lt!211852 minValueBefore!38 lt!211858))))

(assert (=> b!468374 (= (apply!325 (+!1685 lt!211865 (tuple2!8499 lt!211852 minValueBefore!38)) lt!211858) (apply!325 lt!211865 lt!211858))))

(assert (= (and d!75273 c!56801) b!468368))

(assert (= (and d!75273 (not c!56801)) b!468369))

(assert (= (and b!468369 c!56803) b!468365))

(assert (= (and b!468369 (not c!56803)) b!468372))

(assert (= (and b!468372 c!56799) b!468361))

(assert (= (and b!468372 (not c!56799)) b!468371))

(assert (= (or b!468361 b!468371) bm!30328))

(assert (= (or b!468365 bm!30328) bm!30326))

(assert (= (or b!468365 b!468361) bm!30327))

(assert (= (or b!468368 bm!30326) bm!30325))

(assert (= (or b!468368 bm!30327) bm!30330))

(assert (= (and d!75273 res!279942) b!468354))

(assert (= (and d!75273 c!56800) b!468374))

(assert (= (and d!75273 (not c!56800)) b!468358))

(assert (= (and d!75273 res!279938) b!468357))

(assert (= (and b!468357 res!279941) b!468366))

(assert (= (and b!468357 (not res!279939)) b!468373))

(assert (= (and b!468373 res!279937) b!468367))

(assert (= (and b!468357 res!279944) b!468360))

(assert (= (and b!468360 c!56804) b!468364))

(assert (= (and b!468360 (not c!56804)) b!468362))

(assert (= (and b!468364 res!279940) b!468359))

(assert (= (or b!468364 b!468362) bm!30331))

(assert (= (and b!468360 res!279943) b!468356))

(assert (= (and b!468356 c!56802) b!468355))

(assert (= (and b!468356 (not c!56802)) b!468370))

(assert (= (and b!468355 res!279945) b!468363))

(assert (= (or b!468355 b!468370) bm!30329))

(declare-fun b_lambda!10083 () Bool)

(assert (=> (not b_lambda!10083) (not b!468367)))

(declare-fun t!14528 () Bool)

(declare-fun tb!3907 () Bool)

(assert (=> (and start!41930 (= defaultEntry!841 defaultEntry!841) t!14528) tb!3907))

(declare-fun result!7395 () Bool)

(assert (=> tb!3907 (= result!7395 tp_is_empty!12961)))

(assert (=> b!468367 t!14528))

(declare-fun b_and!19937 () Bool)

(assert (= b_and!19931 (and (=> t!14528 result!7395) b_and!19937)))

(declare-fun m!450559 () Bool)

(assert (=> b!468359 m!450559))

(declare-fun m!450561 () Bool)

(assert (=> b!468367 m!450561))

(assert (=> b!468367 m!450551))

(assert (=> b!468367 m!450551))

(declare-fun m!450563 () Bool)

(assert (=> b!468367 m!450563))

(declare-fun m!450565 () Bool)

(assert (=> b!468367 m!450565))

(assert (=> b!468367 m!450561))

(assert (=> b!468367 m!450565))

(declare-fun m!450567 () Bool)

(assert (=> b!468367 m!450567))

(declare-fun m!450569 () Bool)

(assert (=> b!468363 m!450569))

(declare-fun m!450571 () Bool)

(assert (=> bm!30330 m!450571))

(assert (=> bm!30325 m!450509))

(assert (=> b!468354 m!450551))

(assert (=> b!468354 m!450551))

(assert (=> b!468354 m!450557))

(assert (=> b!468366 m!450551))

(assert (=> b!468366 m!450551))

(assert (=> b!468366 m!450557))

(declare-fun m!450573 () Bool)

(assert (=> bm!30329 m!450573))

(assert (=> b!468373 m!450551))

(assert (=> b!468373 m!450551))

(declare-fun m!450575 () Bool)

(assert (=> b!468373 m!450575))

(declare-fun m!450577 () Bool)

(assert (=> b!468374 m!450577))

(declare-fun m!450579 () Bool)

(assert (=> b!468374 m!450579))

(assert (=> b!468374 m!450509))

(declare-fun m!450581 () Bool)

(assert (=> b!468374 m!450581))

(declare-fun m!450583 () Bool)

(assert (=> b!468374 m!450583))

(declare-fun m!450585 () Bool)

(assert (=> b!468374 m!450585))

(declare-fun m!450587 () Bool)

(assert (=> b!468374 m!450587))

(declare-fun m!450589 () Bool)

(assert (=> b!468374 m!450589))

(assert (=> b!468374 m!450587))

(assert (=> b!468374 m!450581))

(declare-fun m!450591 () Bool)

(assert (=> b!468374 m!450591))

(declare-fun m!450593 () Bool)

(assert (=> b!468374 m!450593))

(declare-fun m!450595 () Bool)

(assert (=> b!468374 m!450595))

(declare-fun m!450597 () Bool)

(assert (=> b!468374 m!450597))

(declare-fun m!450599 () Bool)

(assert (=> b!468374 m!450599))

(declare-fun m!450601 () Bool)

(assert (=> b!468374 m!450601))

(assert (=> b!468374 m!450551))

(declare-fun m!450603 () Bool)

(assert (=> b!468374 m!450603))

(declare-fun m!450605 () Bool)

(assert (=> b!468374 m!450605))

(assert (=> b!468374 m!450595))

(assert (=> b!468374 m!450583))

(declare-fun m!450607 () Bool)

(assert (=> b!468368 m!450607))

(assert (=> d!75273 m!450493))

(declare-fun m!450609 () Bool)

(assert (=> bm!30331 m!450609))

(assert (=> b!468247 d!75273))

(declare-fun d!75275 () Bool)

(assert (=> d!75275 (= (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211872 () Unit!13652)

(declare-fun choose!1349 (array!29686 array!29688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 V!18387 V!18387 (_ BitVec 32) Int) Unit!13652)

(assert (=> d!75275 (= lt!211872 (choose!1349 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75275 (validMask!0 mask!1365)))

(assert (=> d!75275 (= (lemmaNoChangeToArrayThenSameMapNoExtras!102 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211872)))

(declare-fun bs!14850 () Bool)

(assert (= bs!14850 d!75275))

(assert (=> bs!14850 m!450509))

(assert (=> bs!14850 m!450507))

(declare-fun m!450611 () Bool)

(assert (=> bs!14850 m!450611))

(assert (=> bs!14850 m!450493))

(assert (=> b!468243 d!75275))

(declare-fun b!468401 () Bool)

(declare-fun e!274138 () Bool)

(assert (=> b!468401 (= e!274138 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468401 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!468402 () Bool)

(assert (=> b!468402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(assert (=> b!468402 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _values!833)))))

(declare-fun e!274137 () Bool)

(declare-fun lt!211892 () ListLongMap!7413)

(assert (=> b!468402 (= e!274137 (= (apply!325 lt!211892 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)) (get!6985 (select (arr!14270 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!468403 () Bool)

(declare-fun e!274135 () Bool)

(declare-fun e!274132 () Bool)

(assert (=> b!468403 (= e!274135 e!274132)))

(declare-fun c!56815 () Bool)

(assert (=> b!468403 (= c!56815 (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun b!468404 () Bool)

(declare-fun e!274133 () ListLongMap!7413)

(declare-fun call!30337 () ListLongMap!7413)

(assert (=> b!468404 (= e!274133 call!30337)))

(declare-fun bm!30334 () Bool)

(assert (=> bm!30334 (= call!30337 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!468405 () Bool)

(assert (=> b!468405 (= e!274135 e!274137)))

(assert (=> b!468405 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun res!279955 () Bool)

(assert (=> b!468405 (= res!279955 (contains!2514 lt!211892 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468405 (=> (not res!279955) (not e!274137))))

(declare-fun b!468406 () Bool)

(declare-fun e!274136 () ListLongMap!7413)

(assert (=> b!468406 (= e!274136 (ListLongMap!7414 Nil!8575))))

(declare-fun d!75277 () Bool)

(declare-fun e!274134 () Bool)

(assert (=> d!75277 e!274134))

(declare-fun res!279954 () Bool)

(assert (=> d!75277 (=> (not res!279954) (not e!274134))))

(assert (=> d!75277 (= res!279954 (not (contains!2514 lt!211892 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75277 (= lt!211892 e!274136)))

(declare-fun c!56814 () Bool)

(assert (=> d!75277 (= c!56814 (bvsge #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(assert (=> d!75277 (validMask!0 mask!1365)))

(assert (=> d!75277 (= (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211892)))

(declare-fun b!468407 () Bool)

(declare-fun res!279956 () Bool)

(assert (=> b!468407 (=> (not res!279956) (not e!274134))))

(assert (=> b!468407 (= res!279956 (not (contains!2514 lt!211892 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!468408 () Bool)

(declare-fun lt!211888 () Unit!13652)

(declare-fun lt!211887 () Unit!13652)

(assert (=> b!468408 (= lt!211888 lt!211887)))

(declare-fun lt!211893 () V!18387)

(declare-fun lt!211889 () (_ BitVec 64))

(declare-fun lt!211891 () (_ BitVec 64))

(declare-fun lt!211890 () ListLongMap!7413)

(assert (=> b!468408 (not (contains!2514 (+!1685 lt!211890 (tuple2!8499 lt!211889 lt!211893)) lt!211891))))

(declare-fun addStillNotContains!160 (ListLongMap!7413 (_ BitVec 64) V!18387 (_ BitVec 64)) Unit!13652)

(assert (=> b!468408 (= lt!211887 (addStillNotContains!160 lt!211890 lt!211889 lt!211893 lt!211891))))

(assert (=> b!468408 (= lt!211891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!468408 (= lt!211893 (get!6985 (select (arr!14270 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!468408 (= lt!211889 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468408 (= lt!211890 call!30337)))

(assert (=> b!468408 (= e!274133 (+!1685 call!30337 (tuple2!8499 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000) (get!6985 (select (arr!14270 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!468409 () Bool)

(assert (=> b!468409 (= e!274132 (= lt!211892 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!468410 () Bool)

(assert (=> b!468410 (= e!274134 e!274135)))

(declare-fun c!56816 () Bool)

(assert (=> b!468410 (= c!56816 e!274138)))

(declare-fun res!279957 () Bool)

(assert (=> b!468410 (=> (not res!279957) (not e!274138))))

(assert (=> b!468410 (= res!279957 (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun b!468411 () Bool)

(declare-fun isEmpty!578 (ListLongMap!7413) Bool)

(assert (=> b!468411 (= e!274132 (isEmpty!578 lt!211892))))

(declare-fun b!468412 () Bool)

(assert (=> b!468412 (= e!274136 e!274133)))

(declare-fun c!56813 () Bool)

(assert (=> b!468412 (= c!56813 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75277 c!56814) b!468406))

(assert (= (and d!75277 (not c!56814)) b!468412))

(assert (= (and b!468412 c!56813) b!468408))

(assert (= (and b!468412 (not c!56813)) b!468404))

(assert (= (or b!468408 b!468404) bm!30334))

(assert (= (and d!75277 res!279954) b!468407))

(assert (= (and b!468407 res!279956) b!468410))

(assert (= (and b!468410 res!279957) b!468401))

(assert (= (and b!468410 c!56816) b!468405))

(assert (= (and b!468410 (not c!56816)) b!468403))

(assert (= (and b!468405 res!279955) b!468402))

(assert (= (and b!468403 c!56815) b!468409))

(assert (= (and b!468403 (not c!56815)) b!468411))

(declare-fun b_lambda!10085 () Bool)

(assert (=> (not b_lambda!10085) (not b!468402)))

(assert (=> b!468402 t!14528))

(declare-fun b_and!19939 () Bool)

(assert (= b_and!19937 (and (=> t!14528 result!7395) b_and!19939)))

(declare-fun b_lambda!10087 () Bool)

(assert (=> (not b_lambda!10087) (not b!468408)))

(assert (=> b!468408 t!14528))

(declare-fun b_and!19941 () Bool)

(assert (= b_and!19939 (and (=> t!14528 result!7395) b_and!19941)))

(declare-fun m!450613 () Bool)

(assert (=> b!468409 m!450613))

(assert (=> b!468412 m!450551))

(assert (=> b!468412 m!450551))

(assert (=> b!468412 m!450557))

(declare-fun m!450615 () Bool)

(assert (=> b!468407 m!450615))

(assert (=> bm!30334 m!450613))

(assert (=> b!468405 m!450551))

(assert (=> b!468405 m!450551))

(declare-fun m!450617 () Bool)

(assert (=> b!468405 m!450617))

(declare-fun m!450619 () Bool)

(assert (=> b!468411 m!450619))

(assert (=> b!468402 m!450565))

(assert (=> b!468402 m!450561))

(assert (=> b!468402 m!450551))

(declare-fun m!450621 () Bool)

(assert (=> b!468402 m!450621))

(assert (=> b!468402 m!450551))

(assert (=> b!468402 m!450561))

(assert (=> b!468402 m!450565))

(assert (=> b!468402 m!450567))

(declare-fun m!450623 () Bool)

(assert (=> d!75277 m!450623))

(assert (=> d!75277 m!450493))

(assert (=> b!468401 m!450551))

(assert (=> b!468401 m!450551))

(assert (=> b!468401 m!450557))

(assert (=> b!468408 m!450565))

(declare-fun m!450625 () Bool)

(assert (=> b!468408 m!450625))

(assert (=> b!468408 m!450561))

(declare-fun m!450627 () Bool)

(assert (=> b!468408 m!450627))

(declare-fun m!450629 () Bool)

(assert (=> b!468408 m!450629))

(assert (=> b!468408 m!450551))

(assert (=> b!468408 m!450561))

(assert (=> b!468408 m!450565))

(assert (=> b!468408 m!450567))

(assert (=> b!468408 m!450629))

(declare-fun m!450631 () Bool)

(assert (=> b!468408 m!450631))

(assert (=> b!468243 d!75277))

(declare-fun b!468413 () Bool)

(declare-fun e!274145 () Bool)

(assert (=> b!468413 (= e!274145 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468413 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!468414 () Bool)

(assert (=> b!468414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(assert (=> b!468414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14622 _values!833)))))

(declare-fun e!274144 () Bool)

(declare-fun lt!211899 () ListLongMap!7413)

(assert (=> b!468414 (= e!274144 (= (apply!325 lt!211899 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)) (get!6985 (select (arr!14270 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!468415 () Bool)

(declare-fun e!274142 () Bool)

(declare-fun e!274139 () Bool)

(assert (=> b!468415 (= e!274142 e!274139)))

(declare-fun c!56819 () Bool)

(assert (=> b!468415 (= c!56819 (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun b!468416 () Bool)

(declare-fun e!274140 () ListLongMap!7413)

(declare-fun call!30338 () ListLongMap!7413)

(assert (=> b!468416 (= e!274140 call!30338)))

(declare-fun bm!30335 () Bool)

(assert (=> bm!30335 (= call!30338 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!468417 () Bool)

(assert (=> b!468417 (= e!274142 e!274144)))

(assert (=> b!468417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun res!279959 () Bool)

(assert (=> b!468417 (= res!279959 (contains!2514 lt!211899 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!468417 (=> (not res!279959) (not e!274144))))

(declare-fun b!468418 () Bool)

(declare-fun e!274143 () ListLongMap!7413)

(assert (=> b!468418 (= e!274143 (ListLongMap!7414 Nil!8575))))

(declare-fun d!75279 () Bool)

(declare-fun e!274141 () Bool)

(assert (=> d!75279 e!274141))

(declare-fun res!279958 () Bool)

(assert (=> d!75279 (=> (not res!279958) (not e!274141))))

(assert (=> d!75279 (= res!279958 (not (contains!2514 lt!211899 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75279 (= lt!211899 e!274143)))

(declare-fun c!56818 () Bool)

(assert (=> d!75279 (= c!56818 (bvsge #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(assert (=> d!75279 (validMask!0 mask!1365)))

(assert (=> d!75279 (= (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!211899)))

(declare-fun b!468419 () Bool)

(declare-fun res!279960 () Bool)

(assert (=> b!468419 (=> (not res!279960) (not e!274141))))

(assert (=> b!468419 (= res!279960 (not (contains!2514 lt!211899 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!468420 () Bool)

(declare-fun lt!211895 () Unit!13652)

(declare-fun lt!211894 () Unit!13652)

(assert (=> b!468420 (= lt!211895 lt!211894)))

(declare-fun lt!211900 () V!18387)

(declare-fun lt!211897 () ListLongMap!7413)

(declare-fun lt!211898 () (_ BitVec 64))

(declare-fun lt!211896 () (_ BitVec 64))

(assert (=> b!468420 (not (contains!2514 (+!1685 lt!211897 (tuple2!8499 lt!211896 lt!211900)) lt!211898))))

(assert (=> b!468420 (= lt!211894 (addStillNotContains!160 lt!211897 lt!211896 lt!211900 lt!211898))))

(assert (=> b!468420 (= lt!211898 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!468420 (= lt!211900 (get!6985 (select (arr!14270 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!468420 (= lt!211896 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!468420 (= lt!211897 call!30338)))

(assert (=> b!468420 (= e!274140 (+!1685 call!30338 (tuple2!8499 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000) (get!6985 (select (arr!14270 _values!833) #b00000000000000000000000000000000) (dynLambda!915 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!468421 () Bool)

(assert (=> b!468421 (= e!274139 (= lt!211899 (getCurrentListMapNoExtraKeys!1942 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!468422 () Bool)

(assert (=> b!468422 (= e!274141 e!274142)))

(declare-fun c!56820 () Bool)

(assert (=> b!468422 (= c!56820 e!274145)))

(declare-fun res!279961 () Bool)

(assert (=> b!468422 (=> (not res!279961) (not e!274145))))

(assert (=> b!468422 (= res!279961 (bvslt #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(declare-fun b!468423 () Bool)

(assert (=> b!468423 (= e!274139 (isEmpty!578 lt!211899))))

(declare-fun b!468424 () Bool)

(assert (=> b!468424 (= e!274143 e!274140)))

(declare-fun c!56817 () Bool)

(assert (=> b!468424 (= c!56817 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75279 c!56818) b!468418))

(assert (= (and d!75279 (not c!56818)) b!468424))

(assert (= (and b!468424 c!56817) b!468420))

(assert (= (and b!468424 (not c!56817)) b!468416))

(assert (= (or b!468420 b!468416) bm!30335))

(assert (= (and d!75279 res!279958) b!468419))

(assert (= (and b!468419 res!279960) b!468422))

(assert (= (and b!468422 res!279961) b!468413))

(assert (= (and b!468422 c!56820) b!468417))

(assert (= (and b!468422 (not c!56820)) b!468415))

(assert (= (and b!468417 res!279959) b!468414))

(assert (= (and b!468415 c!56819) b!468421))

(assert (= (and b!468415 (not c!56819)) b!468423))

(declare-fun b_lambda!10089 () Bool)

(assert (=> (not b_lambda!10089) (not b!468414)))

(assert (=> b!468414 t!14528))

(declare-fun b_and!19943 () Bool)

(assert (= b_and!19941 (and (=> t!14528 result!7395) b_and!19943)))

(declare-fun b_lambda!10091 () Bool)

(assert (=> (not b_lambda!10091) (not b!468420)))

(assert (=> b!468420 t!14528))

(declare-fun b_and!19945 () Bool)

(assert (= b_and!19943 (and (=> t!14528 result!7395) b_and!19945)))

(declare-fun m!450633 () Bool)

(assert (=> b!468421 m!450633))

(assert (=> b!468424 m!450551))

(assert (=> b!468424 m!450551))

(assert (=> b!468424 m!450557))

(declare-fun m!450635 () Bool)

(assert (=> b!468419 m!450635))

(assert (=> bm!30335 m!450633))

(assert (=> b!468417 m!450551))

(assert (=> b!468417 m!450551))

(declare-fun m!450637 () Bool)

(assert (=> b!468417 m!450637))

(declare-fun m!450639 () Bool)

(assert (=> b!468423 m!450639))

(assert (=> b!468414 m!450565))

(assert (=> b!468414 m!450561))

(assert (=> b!468414 m!450551))

(declare-fun m!450641 () Bool)

(assert (=> b!468414 m!450641))

(assert (=> b!468414 m!450551))

(assert (=> b!468414 m!450561))

(assert (=> b!468414 m!450565))

(assert (=> b!468414 m!450567))

(declare-fun m!450643 () Bool)

(assert (=> d!75279 m!450643))

(assert (=> d!75279 m!450493))

(assert (=> b!468413 m!450551))

(assert (=> b!468413 m!450551))

(assert (=> b!468413 m!450557))

(assert (=> b!468420 m!450565))

(declare-fun m!450645 () Bool)

(assert (=> b!468420 m!450645))

(assert (=> b!468420 m!450561))

(declare-fun m!450647 () Bool)

(assert (=> b!468420 m!450647))

(declare-fun m!450649 () Bool)

(assert (=> b!468420 m!450649))

(assert (=> b!468420 m!450551))

(assert (=> b!468420 m!450561))

(assert (=> b!468420 m!450565))

(assert (=> b!468420 m!450567))

(assert (=> b!468420 m!450649))

(declare-fun m!450651 () Bool)

(assert (=> b!468420 m!450651))

(assert (=> b!468243 d!75279))

(declare-fun b!468433 () Bool)

(declare-fun e!274154 () Bool)

(declare-fun e!274152 () Bool)

(assert (=> b!468433 (= e!274154 e!274152)))

(declare-fun c!56823 () Bool)

(assert (=> b!468433 (= c!56823 (validKeyInArray!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!468434 () Bool)

(declare-fun call!30341 () Bool)

(assert (=> b!468434 (= e!274152 call!30341)))

(declare-fun b!468435 () Bool)

(declare-fun e!274153 () Bool)

(assert (=> b!468435 (= e!274152 e!274153)))

(declare-fun lt!211909 () (_ BitVec 64))

(assert (=> b!468435 (= lt!211909 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!211908 () Unit!13652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29686 (_ BitVec 64) (_ BitVec 32)) Unit!13652)

(assert (=> b!468435 (= lt!211908 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!211909 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!468435 (arrayContainsKey!0 _keys!1025 lt!211909 #b00000000000000000000000000000000)))

(declare-fun lt!211907 () Unit!13652)

(assert (=> b!468435 (= lt!211907 lt!211908)))

(declare-fun res!279966 () Bool)

(declare-datatypes ((SeekEntryResult!3498 0))(
  ( (MissingZero!3498 (index!16171 (_ BitVec 32))) (Found!3498 (index!16172 (_ BitVec 32))) (Intermediate!3498 (undefined!4310 Bool) (index!16173 (_ BitVec 32)) (x!43782 (_ BitVec 32))) (Undefined!3498) (MissingVacant!3498 (index!16174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29686 (_ BitVec 32)) SeekEntryResult!3498)

(assert (=> b!468435 (= res!279966 (= (seekEntryOrOpen!0 (select (arr!14269 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3498 #b00000000000000000000000000000000)))))

(assert (=> b!468435 (=> (not res!279966) (not e!274153))))

(declare-fun d!75281 () Bool)

(declare-fun res!279967 () Bool)

(assert (=> d!75281 (=> res!279967 e!274154)))

(assert (=> d!75281 (= res!279967 (bvsge #b00000000000000000000000000000000 (size!14621 _keys!1025)))))

(assert (=> d!75281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!274154)))

(declare-fun bm!30338 () Bool)

(assert (=> bm!30338 (= call!30341 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!468436 () Bool)

(assert (=> b!468436 (= e!274153 call!30341)))

(assert (= (and d!75281 (not res!279967)) b!468433))

(assert (= (and b!468433 c!56823) b!468435))

(assert (= (and b!468433 (not c!56823)) b!468434))

(assert (= (and b!468435 res!279966) b!468436))

(assert (= (or b!468436 b!468434) bm!30338))

(assert (=> b!468433 m!450551))

(assert (=> b!468433 m!450551))

(assert (=> b!468433 m!450557))

(assert (=> b!468435 m!450551))

(declare-fun m!450653 () Bool)

(assert (=> b!468435 m!450653))

(declare-fun m!450655 () Bool)

(assert (=> b!468435 m!450655))

(assert (=> b!468435 m!450551))

(declare-fun m!450657 () Bool)

(assert (=> b!468435 m!450657))

(declare-fun m!450659 () Bool)

(assert (=> bm!30338 m!450659))

(assert (=> b!468248 d!75281))

(declare-fun mapNonEmpty!21142 () Bool)

(declare-fun mapRes!21142 () Bool)

(declare-fun tp!40627 () Bool)

(declare-fun e!274159 () Bool)

(assert (=> mapNonEmpty!21142 (= mapRes!21142 (and tp!40627 e!274159))))

(declare-fun mapValue!21142 () ValueCell!6137)

(declare-fun mapRest!21142 () (Array (_ BitVec 32) ValueCell!6137))

(declare-fun mapKey!21142 () (_ BitVec 32))

(assert (=> mapNonEmpty!21142 (= mapRest!21133 (store mapRest!21142 mapKey!21142 mapValue!21142))))

(declare-fun mapIsEmpty!21142 () Bool)

(assert (=> mapIsEmpty!21142 mapRes!21142))

(declare-fun condMapEmpty!21142 () Bool)

(declare-fun mapDefault!21142 () ValueCell!6137)

(assert (=> mapNonEmpty!21133 (= condMapEmpty!21142 (= mapRest!21133 ((as const (Array (_ BitVec 32) ValueCell!6137)) mapDefault!21142)))))

(declare-fun e!274160 () Bool)

(assert (=> mapNonEmpty!21133 (= tp!40612 (and e!274160 mapRes!21142))))

(declare-fun b!468443 () Bool)

(assert (=> b!468443 (= e!274159 tp_is_empty!12961)))

(declare-fun b!468444 () Bool)

(assert (=> b!468444 (= e!274160 tp_is_empty!12961)))

(assert (= (and mapNonEmpty!21133 condMapEmpty!21142) mapIsEmpty!21142))

(assert (= (and mapNonEmpty!21133 (not condMapEmpty!21142)) mapNonEmpty!21142))

(assert (= (and mapNonEmpty!21142 ((_ is ValueCellFull!6137) mapValue!21142)) b!468443))

(assert (= (and mapNonEmpty!21133 ((_ is ValueCellFull!6137) mapDefault!21142)) b!468444))

(declare-fun m!450661 () Bool)

(assert (=> mapNonEmpty!21142 m!450661))

(declare-fun b_lambda!10093 () Bool)

(assert (= b_lambda!10085 (or (and start!41930 b_free!11533) b_lambda!10093)))

(declare-fun b_lambda!10095 () Bool)

(assert (= b_lambda!10091 (or (and start!41930 b_free!11533) b_lambda!10095)))

(declare-fun b_lambda!10097 () Bool)

(assert (= b_lambda!10089 (or (and start!41930 b_free!11533) b_lambda!10097)))

(declare-fun b_lambda!10099 () Bool)

(assert (= b_lambda!10083 (or (and start!41930 b_free!11533) b_lambda!10099)))

(declare-fun b_lambda!10101 () Bool)

(assert (= b_lambda!10087 (or (and start!41930 b_free!11533) b_lambda!10101)))

(check-sat (not b!468405) (not b!468309) (not b!468421) (not b!468354) (not bm!30310) (not b!468411) (not b_lambda!10095) (not b_lambda!10097) (not bm!30331) (not b!468408) (not d!75275) (not b!468363) (not b!468366) (not bm!30338) (not b_lambda!10093) (not b_lambda!10099) (not d!75273) (not b!468402) (not b!468412) (not bm!30329) (not b!468423) (not b!468368) (not bm!30334) (not bm!30335) (not b_next!11533) (not b!468435) (not b!468413) b_and!19945 (not d!75277) (not b!468359) (not bm!30325) (not b!468373) (not b!468401) (not bm!30330) (not b!468420) (not b!468311) (not b!468367) (not b!468310) (not b!468407) (not b!468419) (not b!468424) (not b!468409) (not b!468433) (not mapNonEmpty!21142) (not b_lambda!10101) tp_is_empty!12961 (not d!75279) (not b!468374) (not b!468414) (not b!468417))
(check-sat b_and!19945 (not b_next!11533))
