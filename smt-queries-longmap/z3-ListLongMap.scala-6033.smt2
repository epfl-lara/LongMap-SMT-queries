; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78084 () Bool)

(assert start!78084)

(declare-fun b_free!16611 () Bool)

(declare-fun b_next!16611 () Bool)

(assert (=> start!78084 (= b_free!16611 (not b_next!16611))))

(declare-fun tp!58103 () Bool)

(declare-fun b_and!27183 () Bool)

(assert (=> start!78084 (= tp!58103 b_and!27183)))

(declare-fun b!911440 () Bool)

(declare-fun res!614939 () Bool)

(declare-fun e!511168 () Bool)

(assert (=> b!911440 (=> (not res!614939) (not e!511168))))

(declare-datatypes ((array!54058 0))(
  ( (array!54059 (arr!25985 (Array (_ BitVec 32) (_ BitVec 64))) (size!26444 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54058)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54058 (_ BitVec 32)) Bool)

(assert (=> b!911440 (= res!614939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911441 () Bool)

(declare-fun e!511170 () Bool)

(declare-fun tp_is_empty!19029 () Bool)

(assert (=> b!911441 (= e!511170 tp_is_empty!19029)))

(declare-fun b!911442 () Bool)

(declare-fun res!614943 () Bool)

(assert (=> b!911442 (=> (not res!614943) (not e!511168))))

(declare-datatypes ((V!30337 0))(
  ( (V!30338 (val!9565 Int)) )
))
(declare-datatypes ((ValueCell!9033 0))(
  ( (ValueCellFull!9033 (v!12074 V!30337)) (EmptyCell!9033) )
))
(declare-datatypes ((array!54060 0))(
  ( (array!54061 (arr!25986 (Array (_ BitVec 32) ValueCell!9033)) (size!26445 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54060)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911442 (= res!614943 (and (= (size!26445 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26444 _keys!1386) (size!26445 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911443 () Bool)

(declare-fun res!614940 () Bool)

(assert (=> b!911443 (=> (not res!614940) (not e!511168))))

(declare-datatypes ((List!18252 0))(
  ( (Nil!18249) (Cons!18248 (h!19394 (_ BitVec 64)) (t!25837 List!18252)) )
))
(declare-fun arrayNoDuplicates!0 (array!54058 (_ BitVec 32) List!18252) Bool)

(assert (=> b!911443 (= res!614940 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18249))))

(declare-fun b!911444 () Bool)

(declare-fun e!511169 () Bool)

(assert (=> b!911444 (= e!511169 tp_is_empty!19029)))

(declare-fun b!911445 () Bool)

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!911445 (= e!511168 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26444 _keys!1386))))))

(declare-fun b!911446 () Bool)

(declare-fun e!511167 () Bool)

(declare-fun mapRes!30265 () Bool)

(assert (=> b!911446 (= e!511167 (and e!511169 mapRes!30265))))

(declare-fun condMapEmpty!30265 () Bool)

(declare-fun mapDefault!30265 () ValueCell!9033)

(assert (=> b!911446 (= condMapEmpty!30265 (= (arr!25986 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9033)) mapDefault!30265)))))

(declare-fun mapNonEmpty!30265 () Bool)

(declare-fun tp!58104 () Bool)

(assert (=> mapNonEmpty!30265 (= mapRes!30265 (and tp!58104 e!511170))))

(declare-fun mapValue!30265 () ValueCell!9033)

(declare-fun mapKey!30265 () (_ BitVec 32))

(declare-fun mapRest!30265 () (Array (_ BitVec 32) ValueCell!9033))

(assert (=> mapNonEmpty!30265 (= (arr!25986 _values!1152) (store mapRest!30265 mapKey!30265 mapValue!30265))))

(declare-fun b!911447 () Bool)

(declare-fun res!614942 () Bool)

(assert (=> b!911447 (=> (not res!614942) (not e!511168))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30337)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30337)

(declare-datatypes ((tuple2!12460 0))(
  ( (tuple2!12461 (_1!6241 (_ BitVec 64)) (_2!6241 V!30337)) )
))
(declare-datatypes ((List!18253 0))(
  ( (Nil!18250) (Cons!18249 (h!19395 tuple2!12460) (t!25838 List!18253)) )
))
(declare-datatypes ((ListLongMap!11157 0))(
  ( (ListLongMap!11158 (toList!5594 List!18253)) )
))
(declare-fun contains!4638 (ListLongMap!11157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2856 (array!54058 array!54060 (_ BitVec 32) (_ BitVec 32) V!30337 V!30337 (_ BitVec 32) Int) ListLongMap!11157)

(assert (=> b!911447 (= res!614942 (contains!4638 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911448 () Bool)

(declare-fun res!614941 () Bool)

(assert (=> b!911448 (=> (not res!614941) (not e!511168))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!911448 (= res!614941 (inRange!0 i!717 mask!1756))))

(declare-fun res!614938 () Bool)

(assert (=> start!78084 (=> (not res!614938) (not e!511168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78084 (= res!614938 (validMask!0 mask!1756))))

(assert (=> start!78084 e!511168))

(declare-fun array_inv!20310 (array!54060) Bool)

(assert (=> start!78084 (and (array_inv!20310 _values!1152) e!511167)))

(assert (=> start!78084 tp!58103))

(assert (=> start!78084 true))

(assert (=> start!78084 tp_is_empty!19029))

(declare-fun array_inv!20311 (array!54058) Bool)

(assert (=> start!78084 (array_inv!20311 _keys!1386)))

(declare-fun mapIsEmpty!30265 () Bool)

(assert (=> mapIsEmpty!30265 mapRes!30265))

(assert (= (and start!78084 res!614938) b!911442))

(assert (= (and b!911442 res!614943) b!911440))

(assert (= (and b!911440 res!614939) b!911443))

(assert (= (and b!911443 res!614940) b!911447))

(assert (= (and b!911447 res!614942) b!911448))

(assert (= (and b!911448 res!614941) b!911445))

(assert (= (and b!911446 condMapEmpty!30265) mapIsEmpty!30265))

(assert (= (and b!911446 (not condMapEmpty!30265)) mapNonEmpty!30265))

(get-info :version)

(assert (= (and mapNonEmpty!30265 ((_ is ValueCellFull!9033) mapValue!30265)) b!911441))

(assert (= (and b!911446 ((_ is ValueCellFull!9033) mapDefault!30265)) b!911444))

(assert (= start!78084 b!911446))

(declare-fun m!846195 () Bool)

(assert (=> b!911440 m!846195))

(declare-fun m!846197 () Bool)

(assert (=> b!911448 m!846197))

(declare-fun m!846199 () Bool)

(assert (=> b!911447 m!846199))

(assert (=> b!911447 m!846199))

(declare-fun m!846201 () Bool)

(assert (=> b!911447 m!846201))

(declare-fun m!846203 () Bool)

(assert (=> start!78084 m!846203))

(declare-fun m!846205 () Bool)

(assert (=> start!78084 m!846205))

(declare-fun m!846207 () Bool)

(assert (=> start!78084 m!846207))

(declare-fun m!846209 () Bool)

(assert (=> mapNonEmpty!30265 m!846209))

(declare-fun m!846211 () Bool)

(assert (=> b!911443 m!846211))

(check-sat (not mapNonEmpty!30265) (not b_next!16611) b_and!27183 (not b!911448) (not b!911447) tp_is_empty!19029 (not b!911443) (not start!78084) (not b!911440))
(check-sat b_and!27183 (not b_next!16611))
(get-model)

(declare-fun d!112241 () Bool)

(declare-fun e!511190 () Bool)

(assert (=> d!112241 e!511190))

(declare-fun res!614964 () Bool)

(assert (=> d!112241 (=> res!614964 e!511190)))

(declare-fun lt!410403 () Bool)

(assert (=> d!112241 (= res!614964 (not lt!410403))))

(declare-fun lt!410402 () Bool)

(assert (=> d!112241 (= lt!410403 lt!410402)))

(declare-datatypes ((Unit!30862 0))(
  ( (Unit!30863) )
))
(declare-fun lt!410405 () Unit!30862)

(declare-fun e!511191 () Unit!30862)

(assert (=> d!112241 (= lt!410405 e!511191)))

(declare-fun c!95745 () Bool)

(assert (=> d!112241 (= c!95745 lt!410402)))

(declare-fun containsKey!439 (List!18253 (_ BitVec 64)) Bool)

(assert (=> d!112241 (= lt!410402 (containsKey!439 (toList!5594 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112241 (= (contains!4638 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410403)))

(declare-fun b!911482 () Bool)

(declare-fun lt!410404 () Unit!30862)

(assert (=> b!911482 (= e!511191 lt!410404)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!335 (List!18253 (_ BitVec 64)) Unit!30862)

(assert (=> b!911482 (= lt!410404 (lemmaContainsKeyImpliesGetValueByKeyDefined!335 (toList!5594 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!478 0))(
  ( (Some!477 (v!12076 V!30337)) (None!476) )
))
(declare-fun isDefined!344 (Option!478) Bool)

(declare-fun getValueByKey!472 (List!18253 (_ BitVec 64)) Option!478)

(assert (=> b!911482 (isDefined!344 (getValueByKey!472 (toList!5594 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!911483 () Bool)

(declare-fun Unit!30864 () Unit!30862)

(assert (=> b!911483 (= e!511191 Unit!30864)))

(declare-fun b!911484 () Bool)

(assert (=> b!911484 (= e!511190 (isDefined!344 (getValueByKey!472 (toList!5594 (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112241 c!95745) b!911482))

(assert (= (and d!112241 (not c!95745)) b!911483))

(assert (= (and d!112241 (not res!614964)) b!911484))

(declare-fun m!846231 () Bool)

(assert (=> d!112241 m!846231))

(declare-fun m!846233 () Bool)

(assert (=> b!911482 m!846233))

(declare-fun m!846235 () Bool)

(assert (=> b!911482 m!846235))

(assert (=> b!911482 m!846235))

(declare-fun m!846237 () Bool)

(assert (=> b!911482 m!846237))

(assert (=> b!911484 m!846235))

(assert (=> b!911484 m!846235))

(assert (=> b!911484 m!846237))

(assert (=> b!911447 d!112241))

(declare-fun bm!40352 () Bool)

(declare-fun call!40358 () Bool)

(declare-fun lt!410450 () ListLongMap!11157)

(assert (=> bm!40352 (= call!40358 (contains!4638 lt!410450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!911527 () Bool)

(declare-fun e!511222 () Unit!30862)

(declare-fun Unit!30865 () Unit!30862)

(assert (=> b!911527 (= e!511222 Unit!30865)))

(declare-fun b!911528 () Bool)

(declare-fun e!511224 () Bool)

(declare-fun e!511221 () Bool)

(assert (=> b!911528 (= e!511224 e!511221)))

(declare-fun res!614988 () Bool)

(assert (=> b!911528 (=> (not res!614988) (not e!511221))))

(assert (=> b!911528 (= res!614988 (contains!4638 lt!410450 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!911528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26444 _keys!1386)))))

(declare-fun b!911529 () Bool)

(declare-fun e!511227 () ListLongMap!11157)

(declare-fun call!40361 () ListLongMap!11157)

(declare-fun +!2605 (ListLongMap!11157 tuple2!12460) ListLongMap!11157)

(assert (=> b!911529 (= e!511227 (+!2605 call!40361 (tuple2!12461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!911530 () Bool)

(declare-fun c!95758 () Bool)

(assert (=> b!911530 (= c!95758 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!511225 () ListLongMap!11157)

(declare-fun e!511229 () ListLongMap!11157)

(assert (=> b!911530 (= e!511225 e!511229)))

(declare-fun b!911531 () Bool)

(assert (=> b!911531 (= e!511227 e!511225)))

(declare-fun c!95763 () Bool)

(assert (=> b!911531 (= c!95763 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40353 () Bool)

(declare-fun call!40359 () Bool)

(assert (=> bm!40353 (= call!40359 (contains!4638 lt!410450 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!911532 () Bool)

(declare-fun res!614985 () Bool)

(declare-fun e!511230 () Bool)

(assert (=> b!911532 (=> (not res!614985) (not e!511230))))

(assert (=> b!911532 (= res!614985 e!511224)))

(declare-fun res!614983 () Bool)

(assert (=> b!911532 (=> res!614983 e!511224)))

(declare-fun e!511228 () Bool)

(assert (=> b!911532 (= res!614983 (not e!511228))))

(declare-fun res!614990 () Bool)

(assert (=> b!911532 (=> (not res!614990) (not e!511228))))

(assert (=> b!911532 (= res!614990 (bvslt #b00000000000000000000000000000000 (size!26444 _keys!1386)))))

(declare-fun b!911533 () Bool)

(declare-fun apply!513 (ListLongMap!11157 (_ BitVec 64)) V!30337)

(declare-fun get!13656 (ValueCell!9033 V!30337) V!30337)

(declare-fun dynLambda!1389 (Int (_ BitVec 64)) V!30337)

(assert (=> b!911533 (= e!511221 (= (apply!513 lt!410450 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)) (get!13656 (select (arr!25986 _values!1152) #b00000000000000000000000000000000) (dynLambda!1389 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!911533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26445 _values!1152)))))

(assert (=> b!911533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26444 _keys!1386)))))

(declare-fun b!911534 () Bool)

(declare-fun call!40360 () ListLongMap!11157)

(assert (=> b!911534 (= e!511225 call!40360)))

(declare-fun b!911535 () Bool)

(declare-fun e!511220 () Bool)

(declare-fun e!511223 () Bool)

(assert (=> b!911535 (= e!511220 e!511223)))

(declare-fun res!614986 () Bool)

(assert (=> b!911535 (= res!614986 call!40358)))

(assert (=> b!911535 (=> (not res!614986) (not e!511223))))

(declare-fun b!911536 () Bool)

(declare-fun lt!410451 () Unit!30862)

(assert (=> b!911536 (= e!511222 lt!410451)))

(declare-fun lt!410469 () ListLongMap!11157)

(declare-fun getCurrentListMapNoExtraKeys!3292 (array!54058 array!54060 (_ BitVec 32) (_ BitVec 32) V!30337 V!30337 (_ BitVec 32) Int) ListLongMap!11157)

(assert (=> b!911536 (= lt!410469 (getCurrentListMapNoExtraKeys!3292 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410466 () (_ BitVec 64))

(assert (=> b!911536 (= lt!410466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410465 () (_ BitVec 64))

(assert (=> b!911536 (= lt!410465 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410457 () Unit!30862)

(declare-fun addStillContains!346 (ListLongMap!11157 (_ BitVec 64) V!30337 (_ BitVec 64)) Unit!30862)

(assert (=> b!911536 (= lt!410457 (addStillContains!346 lt!410469 lt!410466 zeroValue!1094 lt!410465))))

(assert (=> b!911536 (contains!4638 (+!2605 lt!410469 (tuple2!12461 lt!410466 zeroValue!1094)) lt!410465)))

(declare-fun lt!410455 () Unit!30862)

(assert (=> b!911536 (= lt!410455 lt!410457)))

(declare-fun lt!410461 () ListLongMap!11157)

(assert (=> b!911536 (= lt!410461 (getCurrentListMapNoExtraKeys!3292 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410471 () (_ BitVec 64))

(assert (=> b!911536 (= lt!410471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410458 () (_ BitVec 64))

(assert (=> b!911536 (= lt!410458 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410470 () Unit!30862)

(declare-fun addApplyDifferent!346 (ListLongMap!11157 (_ BitVec 64) V!30337 (_ BitVec 64)) Unit!30862)

(assert (=> b!911536 (= lt!410470 (addApplyDifferent!346 lt!410461 lt!410471 minValue!1094 lt!410458))))

(assert (=> b!911536 (= (apply!513 (+!2605 lt!410461 (tuple2!12461 lt!410471 minValue!1094)) lt!410458) (apply!513 lt!410461 lt!410458))))

(declare-fun lt!410467 () Unit!30862)

(assert (=> b!911536 (= lt!410467 lt!410470)))

(declare-fun lt!410460 () ListLongMap!11157)

(assert (=> b!911536 (= lt!410460 (getCurrentListMapNoExtraKeys!3292 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410452 () (_ BitVec 64))

(assert (=> b!911536 (= lt!410452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410456 () (_ BitVec 64))

(assert (=> b!911536 (= lt!410456 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410453 () Unit!30862)

(assert (=> b!911536 (= lt!410453 (addApplyDifferent!346 lt!410460 lt!410452 zeroValue!1094 lt!410456))))

(assert (=> b!911536 (= (apply!513 (+!2605 lt!410460 (tuple2!12461 lt!410452 zeroValue!1094)) lt!410456) (apply!513 lt!410460 lt!410456))))

(declare-fun lt!410454 () Unit!30862)

(assert (=> b!911536 (= lt!410454 lt!410453)))

(declare-fun lt!410459 () ListLongMap!11157)

(assert (=> b!911536 (= lt!410459 (getCurrentListMapNoExtraKeys!3292 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410462 () (_ BitVec 64))

(assert (=> b!911536 (= lt!410462 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410468 () (_ BitVec 64))

(assert (=> b!911536 (= lt!410468 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!911536 (= lt!410451 (addApplyDifferent!346 lt!410459 lt!410462 minValue!1094 lt!410468))))

(assert (=> b!911536 (= (apply!513 (+!2605 lt!410459 (tuple2!12461 lt!410462 minValue!1094)) lt!410468) (apply!513 lt!410459 lt!410468))))

(declare-fun bm!40354 () Bool)

(declare-fun call!40356 () ListLongMap!11157)

(declare-fun call!40355 () ListLongMap!11157)

(assert (=> bm!40354 (= call!40356 call!40355)))

(declare-fun b!911537 () Bool)

(assert (=> b!911537 (= e!511229 call!40360)))

(declare-fun b!911538 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!911538 (= e!511228 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911539 () Bool)

(declare-fun e!511226 () Bool)

(assert (=> b!911539 (= e!511226 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun call!40357 () ListLongMap!11157)

(declare-fun bm!40355 () Bool)

(assert (=> bm!40355 (= call!40357 (getCurrentListMapNoExtraKeys!3292 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!911540 () Bool)

(assert (=> b!911540 (= e!511220 (not call!40358))))

(declare-fun b!911541 () Bool)

(declare-fun e!511218 () Bool)

(assert (=> b!911541 (= e!511230 e!511218)))

(declare-fun c!95762 () Bool)

(assert (=> b!911541 (= c!95762 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!911542 () Bool)

(assert (=> b!911542 (= e!511218 (not call!40359))))

(declare-fun bm!40356 () Bool)

(assert (=> bm!40356 (= call!40355 call!40357)))

(declare-fun bm!40357 () Bool)

(assert (=> bm!40357 (= call!40360 call!40361)))

(declare-fun b!911543 () Bool)

(assert (=> b!911543 (= e!511223 (= (apply!513 lt!410450 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun d!112243 () Bool)

(assert (=> d!112243 e!511230))

(declare-fun res!614987 () Bool)

(assert (=> d!112243 (=> (not res!614987) (not e!511230))))

(assert (=> d!112243 (= res!614987 (or (bvsge #b00000000000000000000000000000000 (size!26444 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26444 _keys!1386)))))))

(declare-fun lt!410463 () ListLongMap!11157)

(assert (=> d!112243 (= lt!410450 lt!410463)))

(declare-fun lt!410464 () Unit!30862)

(assert (=> d!112243 (= lt!410464 e!511222)))

(declare-fun c!95760 () Bool)

(assert (=> d!112243 (= c!95760 e!511226)))

(declare-fun res!614984 () Bool)

(assert (=> d!112243 (=> (not res!614984) (not e!511226))))

(assert (=> d!112243 (= res!614984 (bvslt #b00000000000000000000000000000000 (size!26444 _keys!1386)))))

(assert (=> d!112243 (= lt!410463 e!511227)))

(declare-fun c!95761 () Bool)

(assert (=> d!112243 (= c!95761 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112243 (validMask!0 mask!1756)))

(assert (=> d!112243 (= (getCurrentListMap!2856 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410450)))

(declare-fun b!911544 () Bool)

(declare-fun res!614989 () Bool)

(assert (=> b!911544 (=> (not res!614989) (not e!511230))))

(assert (=> b!911544 (= res!614989 e!511220)))

(declare-fun c!95759 () Bool)

(assert (=> b!911544 (= c!95759 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!911545 () Bool)

(assert (=> b!911545 (= e!511229 call!40356)))

(declare-fun bm!40358 () Bool)

(assert (=> bm!40358 (= call!40361 (+!2605 (ite c!95761 call!40357 (ite c!95763 call!40355 call!40356)) (ite (or c!95761 c!95763) (tuple2!12461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!911546 () Bool)

(declare-fun e!511219 () Bool)

(assert (=> b!911546 (= e!511219 (= (apply!513 lt!410450 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!911547 () Bool)

(assert (=> b!911547 (= e!511218 e!511219)))

(declare-fun res!614991 () Bool)

(assert (=> b!911547 (= res!614991 call!40359)))

(assert (=> b!911547 (=> (not res!614991) (not e!511219))))

(assert (= (and d!112243 c!95761) b!911529))

(assert (= (and d!112243 (not c!95761)) b!911531))

(assert (= (and b!911531 c!95763) b!911534))

(assert (= (and b!911531 (not c!95763)) b!911530))

(assert (= (and b!911530 c!95758) b!911537))

(assert (= (and b!911530 (not c!95758)) b!911545))

(assert (= (or b!911537 b!911545) bm!40354))

(assert (= (or b!911534 bm!40354) bm!40356))

(assert (= (or b!911534 b!911537) bm!40357))

(assert (= (or b!911529 bm!40356) bm!40355))

(assert (= (or b!911529 bm!40357) bm!40358))

(assert (= (and d!112243 res!614984) b!911539))

(assert (= (and d!112243 c!95760) b!911536))

(assert (= (and d!112243 (not c!95760)) b!911527))

(assert (= (and d!112243 res!614987) b!911532))

(assert (= (and b!911532 res!614990) b!911538))

(assert (= (and b!911532 (not res!614983)) b!911528))

(assert (= (and b!911528 res!614988) b!911533))

(assert (= (and b!911532 res!614985) b!911544))

(assert (= (and b!911544 c!95759) b!911535))

(assert (= (and b!911544 (not c!95759)) b!911540))

(assert (= (and b!911535 res!614986) b!911543))

(assert (= (or b!911535 b!911540) bm!40352))

(assert (= (and b!911544 res!614989) b!911541))

(assert (= (and b!911541 c!95762) b!911547))

(assert (= (and b!911541 (not c!95762)) b!911542))

(assert (= (and b!911547 res!614991) b!911546))

(assert (= (or b!911547 b!911542) bm!40353))

(declare-fun b_lambda!13303 () Bool)

(assert (=> (not b_lambda!13303) (not b!911533)))

(declare-fun t!25841 () Bool)

(declare-fun tb!5437 () Bool)

(assert (=> (and start!78084 (= defaultEntry!1160 defaultEntry!1160) t!25841) tb!5437))

(declare-fun result!10675 () Bool)

(assert (=> tb!5437 (= result!10675 tp_is_empty!19029)))

(assert (=> b!911533 t!25841))

(declare-fun b_and!27187 () Bool)

(assert (= b_and!27183 (and (=> t!25841 result!10675) b_and!27187)))

(assert (=> d!112243 m!846203))

(declare-fun m!846239 () Bool)

(assert (=> b!911528 m!846239))

(assert (=> b!911528 m!846239))

(declare-fun m!846241 () Bool)

(assert (=> b!911528 m!846241))

(assert (=> b!911539 m!846239))

(assert (=> b!911539 m!846239))

(declare-fun m!846243 () Bool)

(assert (=> b!911539 m!846243))

(declare-fun m!846245 () Bool)

(assert (=> b!911529 m!846245))

(assert (=> b!911538 m!846239))

(assert (=> b!911538 m!846239))

(assert (=> b!911538 m!846243))

(declare-fun m!846247 () Bool)

(assert (=> bm!40355 m!846247))

(declare-fun m!846249 () Bool)

(assert (=> bm!40353 m!846249))

(declare-fun m!846251 () Bool)

(assert (=> b!911533 m!846251))

(declare-fun m!846253 () Bool)

(assert (=> b!911533 m!846253))

(assert (=> b!911533 m!846239))

(assert (=> b!911533 m!846239))

(declare-fun m!846255 () Bool)

(assert (=> b!911533 m!846255))

(assert (=> b!911533 m!846251))

(assert (=> b!911533 m!846253))

(declare-fun m!846257 () Bool)

(assert (=> b!911533 m!846257))

(declare-fun m!846259 () Bool)

(assert (=> b!911546 m!846259))

(declare-fun m!846261 () Bool)

(assert (=> b!911543 m!846261))

(declare-fun m!846263 () Bool)

(assert (=> b!911536 m!846263))

(assert (=> b!911536 m!846247))

(declare-fun m!846265 () Bool)

(assert (=> b!911536 m!846265))

(declare-fun m!846267 () Bool)

(assert (=> b!911536 m!846267))

(declare-fun m!846269 () Bool)

(assert (=> b!911536 m!846269))

(assert (=> b!911536 m!846239))

(declare-fun m!846271 () Bool)

(assert (=> b!911536 m!846271))

(declare-fun m!846273 () Bool)

(assert (=> b!911536 m!846273))

(declare-fun m!846275 () Bool)

(assert (=> b!911536 m!846275))

(declare-fun m!846277 () Bool)

(assert (=> b!911536 m!846277))

(assert (=> b!911536 m!846265))

(assert (=> b!911536 m!846275))

(declare-fun m!846279 () Bool)

(assert (=> b!911536 m!846279))

(assert (=> b!911536 m!846277))

(declare-fun m!846281 () Bool)

(assert (=> b!911536 m!846281))

(declare-fun m!846283 () Bool)

(assert (=> b!911536 m!846283))

(declare-fun m!846285 () Bool)

(assert (=> b!911536 m!846285))

(declare-fun m!846287 () Bool)

(assert (=> b!911536 m!846287))

(declare-fun m!846289 () Bool)

(assert (=> b!911536 m!846289))

(assert (=> b!911536 m!846285))

(declare-fun m!846291 () Bool)

(assert (=> b!911536 m!846291))

(declare-fun m!846293 () Bool)

(assert (=> bm!40358 m!846293))

(declare-fun m!846295 () Bool)

(assert (=> bm!40352 m!846295))

(assert (=> b!911447 d!112243))

(declare-fun d!112245 () Bool)

(assert (=> d!112245 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78084 d!112245))

(declare-fun d!112247 () Bool)

(assert (=> d!112247 (= (array_inv!20310 _values!1152) (bvsge (size!26445 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78084 d!112247))

(declare-fun d!112249 () Bool)

(assert (=> d!112249 (= (array_inv!20311 _keys!1386) (bvsge (size!26444 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78084 d!112249))

(declare-fun b!911560 () Bool)

(declare-fun e!511241 () Bool)

(declare-fun call!40364 () Bool)

(assert (=> b!911560 (= e!511241 call!40364)))

(declare-fun b!911561 () Bool)

(declare-fun e!511242 () Bool)

(declare-fun e!511239 () Bool)

(assert (=> b!911561 (= e!511242 e!511239)))

(declare-fun res!615000 () Bool)

(assert (=> b!911561 (=> (not res!615000) (not e!511239))))

(declare-fun e!511240 () Bool)

(assert (=> b!911561 (= res!615000 (not e!511240))))

(declare-fun res!614998 () Bool)

(assert (=> b!911561 (=> (not res!614998) (not e!511240))))

(assert (=> b!911561 (= res!614998 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911562 () Bool)

(assert (=> b!911562 (= e!511239 e!511241)))

(declare-fun c!95766 () Bool)

(assert (=> b!911562 (= c!95766 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112251 () Bool)

(declare-fun res!614999 () Bool)

(assert (=> d!112251 (=> res!614999 e!511242)))

(assert (=> d!112251 (= res!614999 (bvsge #b00000000000000000000000000000000 (size!26444 _keys!1386)))))

(assert (=> d!112251 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18249) e!511242)))

(declare-fun b!911563 () Bool)

(declare-fun contains!4640 (List!18252 (_ BitVec 64)) Bool)

(assert (=> b!911563 (= e!511240 (contains!4640 Nil!18249 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911564 () Bool)

(assert (=> b!911564 (= e!511241 call!40364)))

(declare-fun bm!40361 () Bool)

(assert (=> bm!40361 (= call!40364 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95766 (Cons!18248 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000) Nil!18249) Nil!18249)))))

(assert (= (and d!112251 (not res!614999)) b!911561))

(assert (= (and b!911561 res!614998) b!911563))

(assert (= (and b!911561 res!615000) b!911562))

(assert (= (and b!911562 c!95766) b!911560))

(assert (= (and b!911562 (not c!95766)) b!911564))

(assert (= (or b!911560 b!911564) bm!40361))

(assert (=> b!911561 m!846239))

(assert (=> b!911561 m!846239))

(assert (=> b!911561 m!846243))

(assert (=> b!911562 m!846239))

(assert (=> b!911562 m!846239))

(assert (=> b!911562 m!846243))

(assert (=> b!911563 m!846239))

(assert (=> b!911563 m!846239))

(declare-fun m!846297 () Bool)

(assert (=> b!911563 m!846297))

(assert (=> bm!40361 m!846239))

(declare-fun m!846299 () Bool)

(assert (=> bm!40361 m!846299))

(assert (=> b!911443 d!112251))

(declare-fun b!911573 () Bool)

(declare-fun e!511250 () Bool)

(declare-fun call!40367 () Bool)

(assert (=> b!911573 (= e!511250 call!40367)))

(declare-fun d!112253 () Bool)

(declare-fun res!615006 () Bool)

(declare-fun e!511251 () Bool)

(assert (=> d!112253 (=> res!615006 e!511251)))

(assert (=> d!112253 (= res!615006 (bvsge #b00000000000000000000000000000000 (size!26444 _keys!1386)))))

(assert (=> d!112253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!511251)))

(declare-fun b!911574 () Bool)

(declare-fun e!511249 () Bool)

(assert (=> b!911574 (= e!511249 e!511250)))

(declare-fun lt!410479 () (_ BitVec 64))

(assert (=> b!911574 (= lt!410479 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410478 () Unit!30862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54058 (_ BitVec 64) (_ BitVec 32)) Unit!30862)

(assert (=> b!911574 (= lt!410478 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410479 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!911574 (arrayContainsKey!0 _keys!1386 lt!410479 #b00000000000000000000000000000000)))

(declare-fun lt!410480 () Unit!30862)

(assert (=> b!911574 (= lt!410480 lt!410478)))

(declare-fun res!615005 () Bool)

(declare-datatypes ((SeekEntryResult!8966 0))(
  ( (MissingZero!8966 (index!38235 (_ BitVec 32))) (Found!8966 (index!38236 (_ BitVec 32))) (Intermediate!8966 (undefined!9778 Bool) (index!38237 (_ BitVec 32)) (x!77945 (_ BitVec 32))) (Undefined!8966) (MissingVacant!8966 (index!38238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54058 (_ BitVec 32)) SeekEntryResult!8966)

(assert (=> b!911574 (= res!615005 (= (seekEntryOrOpen!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8966 #b00000000000000000000000000000000)))))

(assert (=> b!911574 (=> (not res!615005) (not e!511250))))

(declare-fun bm!40364 () Bool)

(assert (=> bm!40364 (= call!40367 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!911575 () Bool)

(assert (=> b!911575 (= e!511249 call!40367)))

(declare-fun b!911576 () Bool)

(assert (=> b!911576 (= e!511251 e!511249)))

(declare-fun c!95769 () Bool)

(assert (=> b!911576 (= c!95769 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112253 (not res!615006)) b!911576))

(assert (= (and b!911576 c!95769) b!911574))

(assert (= (and b!911576 (not c!95769)) b!911575))

(assert (= (and b!911574 res!615005) b!911573))

(assert (= (or b!911573 b!911575) bm!40364))

(assert (=> b!911574 m!846239))

(declare-fun m!846301 () Bool)

(assert (=> b!911574 m!846301))

(declare-fun m!846303 () Bool)

(assert (=> b!911574 m!846303))

(assert (=> b!911574 m!846239))

(declare-fun m!846305 () Bool)

(assert (=> b!911574 m!846305))

(declare-fun m!846307 () Bool)

(assert (=> bm!40364 m!846307))

(assert (=> b!911576 m!846239))

(assert (=> b!911576 m!846239))

(assert (=> b!911576 m!846243))

(assert (=> b!911440 d!112253))

(declare-fun d!112255 () Bool)

(assert (=> d!112255 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!911448 d!112255))

(declare-fun b!911583 () Bool)

(declare-fun e!511257 () Bool)

(assert (=> b!911583 (= e!511257 tp_is_empty!19029)))

(declare-fun b!911584 () Bool)

(declare-fun e!511256 () Bool)

(assert (=> b!911584 (= e!511256 tp_is_empty!19029)))

(declare-fun mapNonEmpty!30271 () Bool)

(declare-fun mapRes!30271 () Bool)

(declare-fun tp!58113 () Bool)

(assert (=> mapNonEmpty!30271 (= mapRes!30271 (and tp!58113 e!511257))))

(declare-fun mapRest!30271 () (Array (_ BitVec 32) ValueCell!9033))

(declare-fun mapKey!30271 () (_ BitVec 32))

(declare-fun mapValue!30271 () ValueCell!9033)

(assert (=> mapNonEmpty!30271 (= mapRest!30265 (store mapRest!30271 mapKey!30271 mapValue!30271))))

(declare-fun condMapEmpty!30271 () Bool)

(declare-fun mapDefault!30271 () ValueCell!9033)

(assert (=> mapNonEmpty!30265 (= condMapEmpty!30271 (= mapRest!30265 ((as const (Array (_ BitVec 32) ValueCell!9033)) mapDefault!30271)))))

(assert (=> mapNonEmpty!30265 (= tp!58104 (and e!511256 mapRes!30271))))

(declare-fun mapIsEmpty!30271 () Bool)

(assert (=> mapIsEmpty!30271 mapRes!30271))

(assert (= (and mapNonEmpty!30265 condMapEmpty!30271) mapIsEmpty!30271))

(assert (= (and mapNonEmpty!30265 (not condMapEmpty!30271)) mapNonEmpty!30271))

(assert (= (and mapNonEmpty!30271 ((_ is ValueCellFull!9033) mapValue!30271)) b!911583))

(assert (= (and mapNonEmpty!30265 ((_ is ValueCellFull!9033) mapDefault!30271)) b!911584))

(declare-fun m!846309 () Bool)

(assert (=> mapNonEmpty!30271 m!846309))

(declare-fun b_lambda!13305 () Bool)

(assert (= b_lambda!13303 (or (and start!78084 b_free!16611) b_lambda!13305)))

(check-sat (not b!911546) (not bm!40361) (not bm!40355) (not b!911528) (not bm!40358) (not d!112243) (not b!911576) (not b!911562) (not b!911482) (not b!911538) (not b!911543) (not b_next!16611) (not bm!40364) b_and!27187 (not b!911563) (not b!911561) (not b_lambda!13305) (not b!911539) (not d!112241) (not mapNonEmpty!30271) (not b!911484) (not b!911574) (not b!911529) (not bm!40352) (not b!911536) (not bm!40353) (not b!911533) tp_is_empty!19029)
(check-sat b_and!27187 (not b_next!16611))
