; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77742 () Bool)

(assert start!77742)

(declare-fun b_free!16345 () Bool)

(declare-fun b_next!16345 () Bool)

(assert (=> start!77742 (= b_free!16345 (not b_next!16345))))

(declare-fun tp!57298 () Bool)

(declare-fun b_and!26817 () Bool)

(assert (=> start!77742 (= tp!57298 b_and!26817)))

(declare-fun mapNonEmpty!29857 () Bool)

(declare-fun mapRes!29857 () Bool)

(declare-fun tp!57297 () Bool)

(declare-fun e!508487 () Bool)

(assert (=> mapNonEmpty!29857 (= mapRes!29857 (and tp!57297 e!508487))))

(declare-datatypes ((V!29983 0))(
  ( (V!29984 (val!9432 Int)) )
))
(declare-datatypes ((ValueCell!8900 0))(
  ( (ValueCellFull!8900 (v!11936 V!29983)) (EmptyCell!8900) )
))
(declare-datatypes ((array!53539 0))(
  ( (array!53540 (arr!25729 (Array (_ BitVec 32) ValueCell!8900)) (size!26190 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53539)

(declare-fun mapValue!29857 () ValueCell!8900)

(declare-fun mapRest!29857 () (Array (_ BitVec 32) ValueCell!8900))

(declare-fun mapKey!29857 () (_ BitVec 32))

(assert (=> mapNonEmpty!29857 (= (arr!25729 _values!1152) (store mapRest!29857 mapKey!29857 mapValue!29857))))

(declare-fun b!907344 () Bool)

(declare-fun res!612453 () Bool)

(declare-fun e!508489 () Bool)

(assert (=> b!907344 (=> (not res!612453) (not e!508489))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907344 (= res!612453 (inRange!0 i!717 mask!1756))))

(declare-fun b!907345 () Bool)

(declare-fun e!508493 () Bool)

(assert (=> b!907345 (= e!508493 e!508489)))

(declare-fun res!612456 () Bool)

(assert (=> b!907345 (=> (not res!612456) (not e!508489))))

(declare-datatypes ((tuple2!12310 0))(
  ( (tuple2!12311 (_1!6166 (_ BitVec 64)) (_2!6166 V!29983)) )
))
(declare-datatypes ((List!18096 0))(
  ( (Nil!18093) (Cons!18092 (h!19238 tuple2!12310) (t!25604 List!18096)) )
))
(declare-datatypes ((ListLongMap!10997 0))(
  ( (ListLongMap!10998 (toList!5514 List!18096)) )
))
(declare-fun lt!409104 () ListLongMap!10997)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4516 (ListLongMap!10997 (_ BitVec 64)) Bool)

(assert (=> b!907345 (= res!612456 (contains!4516 lt!409104 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29983)

(declare-datatypes ((array!53541 0))(
  ( (array!53542 (arr!25730 (Array (_ BitVec 32) (_ BitVec 64))) (size!26191 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53541)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29983)

(declare-fun getCurrentListMap!2720 (array!53541 array!53539 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 32) Int) ListLongMap!10997)

(assert (=> b!907345 (= lt!409104 (getCurrentListMap!2720 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907346 () Bool)

(declare-fun e!508492 () Bool)

(assert (=> b!907346 (= e!508489 (not e!508492))))

(declare-fun res!612451 () Bool)

(assert (=> b!907346 (=> res!612451 e!508492)))

(assert (=> b!907346 (= res!612451 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26191 _keys!1386))))))

(declare-fun lt!409103 () V!29983)

(declare-fun get!13539 (ValueCell!8900 V!29983) V!29983)

(declare-fun dynLambda!1358 (Int (_ BitVec 64)) V!29983)

(assert (=> b!907346 (= lt!409103 (get!13539 (select (arr!25729 _values!1152) i!717) (dynLambda!1358 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907346 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30728 0))(
  ( (Unit!30729) )
))
(declare-fun lt!409105 () Unit!30728)

(declare-fun lemmaKeyInListMapIsInArray!234 (array!53541 array!53539 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) Int) Unit!30728)

(assert (=> b!907346 (= lt!409105 (lemmaKeyInListMapIsInArray!234 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907347 () Bool)

(declare-fun tp_is_empty!18763 () Bool)

(assert (=> b!907347 (= e!508487 tp_is_empty!18763)))

(declare-fun b!907348 () Bool)

(declare-fun e!508491 () Bool)

(assert (=> b!907348 (= e!508491 tp_is_empty!18763)))

(declare-fun b!907349 () Bool)

(declare-fun res!612455 () Bool)

(declare-fun e!508486 () Bool)

(assert (=> b!907349 (=> res!612455 e!508486)))

(declare-fun lt!409101 () ListLongMap!10997)

(declare-fun apply!489 (ListLongMap!10997 (_ BitVec 64)) V!29983)

(assert (=> b!907349 (= res!612455 (not (= (apply!489 lt!409101 k0!1033) lt!409103)))))

(declare-fun b!907350 () Bool)

(assert (=> b!907350 (= e!508492 e!508486)))

(declare-fun res!612452 () Bool)

(assert (=> b!907350 (=> res!612452 e!508486)))

(assert (=> b!907350 (= res!612452 (not (contains!4516 lt!409101 k0!1033)))))

(assert (=> b!907350 (= lt!409101 (getCurrentListMap!2720 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907351 () Bool)

(declare-fun res!612458 () Bool)

(assert (=> b!907351 (=> (not res!612458) (not e!508493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53541 (_ BitVec 32)) Bool)

(assert (=> b!907351 (= res!612458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907352 () Bool)

(declare-fun res!612450 () Bool)

(assert (=> b!907352 (=> (not res!612450) (not e!508493))))

(assert (=> b!907352 (= res!612450 (and (= (size!26190 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26191 _keys!1386) (size!26190 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907353 () Bool)

(declare-fun res!612457 () Bool)

(assert (=> b!907353 (=> (not res!612457) (not e!508489))))

(assert (=> b!907353 (= res!612457 (and (= (select (arr!25730 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!612454 () Bool)

(assert (=> start!77742 (=> (not res!612454) (not e!508493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77742 (= res!612454 (validMask!0 mask!1756))))

(assert (=> start!77742 e!508493))

(declare-fun e!508488 () Bool)

(declare-fun array_inv!20190 (array!53539) Bool)

(assert (=> start!77742 (and (array_inv!20190 _values!1152) e!508488)))

(assert (=> start!77742 tp!57298))

(assert (=> start!77742 true))

(assert (=> start!77742 tp_is_empty!18763))

(declare-fun array_inv!20191 (array!53541) Bool)

(assert (=> start!77742 (array_inv!20191 _keys!1386)))

(declare-fun mapIsEmpty!29857 () Bool)

(assert (=> mapIsEmpty!29857 mapRes!29857))

(declare-fun b!907354 () Bool)

(assert (=> b!907354 (= e!508488 (and e!508491 mapRes!29857))))

(declare-fun condMapEmpty!29857 () Bool)

(declare-fun mapDefault!29857 () ValueCell!8900)

(assert (=> b!907354 (= condMapEmpty!29857 (= (arr!25729 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8900)) mapDefault!29857)))))

(declare-fun b!907355 () Bool)

(assert (=> b!907355 (= e!508486 (or (bvsge #b00000000000000000000000000000000 (size!26191 _keys!1386)) (bvslt (size!26191 _keys!1386) #b01111111111111111111111111111111)))))

(assert (=> b!907355 (= (apply!489 lt!409104 k0!1033) lt!409103)))

(declare-fun lt!409102 () Unit!30728)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!49 (array!53541 array!53539 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) V!29983 (_ BitVec 32) Int) Unit!30728)

(assert (=> b!907355 (= lt!409102 (lemmaListMapApplyFromThenApplyFromZero!49 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409103 i!717 defaultEntry!1160))))

(declare-fun b!907356 () Bool)

(declare-fun res!612459 () Bool)

(assert (=> b!907356 (=> (not res!612459) (not e!508493))))

(declare-datatypes ((List!18097 0))(
  ( (Nil!18094) (Cons!18093 (h!19239 (_ BitVec 64)) (t!25605 List!18097)) )
))
(declare-fun arrayNoDuplicates!0 (array!53541 (_ BitVec 32) List!18097) Bool)

(assert (=> b!907356 (= res!612459 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18094))))

(assert (= (and start!77742 res!612454) b!907352))

(assert (= (and b!907352 res!612450) b!907351))

(assert (= (and b!907351 res!612458) b!907356))

(assert (= (and b!907356 res!612459) b!907345))

(assert (= (and b!907345 res!612456) b!907344))

(assert (= (and b!907344 res!612453) b!907353))

(assert (= (and b!907353 res!612457) b!907346))

(assert (= (and b!907346 (not res!612451)) b!907350))

(assert (= (and b!907350 (not res!612452)) b!907349))

(assert (= (and b!907349 (not res!612455)) b!907355))

(assert (= (and b!907354 condMapEmpty!29857) mapIsEmpty!29857))

(assert (= (and b!907354 (not condMapEmpty!29857)) mapNonEmpty!29857))

(get-info :version)

(assert (= (and mapNonEmpty!29857 ((_ is ValueCellFull!8900) mapValue!29857)) b!907347))

(assert (= (and b!907354 ((_ is ValueCellFull!8900) mapDefault!29857)) b!907348))

(assert (= start!77742 b!907354))

(declare-fun b_lambda!13201 () Bool)

(assert (=> (not b_lambda!13201) (not b!907346)))

(declare-fun t!25603 () Bool)

(declare-fun tb!5359 () Bool)

(assert (=> (and start!77742 (= defaultEntry!1160 defaultEntry!1160) t!25603) tb!5359))

(declare-fun result!10521 () Bool)

(assert (=> tb!5359 (= result!10521 tp_is_empty!18763)))

(assert (=> b!907346 t!25603))

(declare-fun b_and!26819 () Bool)

(assert (= b_and!26817 (and (=> t!25603 result!10521) b_and!26819)))

(declare-fun m!842177 () Bool)

(assert (=> b!907346 m!842177))

(declare-fun m!842179 () Bool)

(assert (=> b!907346 m!842179))

(declare-fun m!842181 () Bool)

(assert (=> b!907346 m!842181))

(declare-fun m!842183 () Bool)

(assert (=> b!907346 m!842183))

(assert (=> b!907346 m!842177))

(assert (=> b!907346 m!842181))

(declare-fun m!842185 () Bool)

(assert (=> b!907346 m!842185))

(declare-fun m!842187 () Bool)

(assert (=> start!77742 m!842187))

(declare-fun m!842189 () Bool)

(assert (=> start!77742 m!842189))

(declare-fun m!842191 () Bool)

(assert (=> start!77742 m!842191))

(declare-fun m!842193 () Bool)

(assert (=> b!907344 m!842193))

(declare-fun m!842195 () Bool)

(assert (=> b!907353 m!842195))

(declare-fun m!842197 () Bool)

(assert (=> mapNonEmpty!29857 m!842197))

(declare-fun m!842199 () Bool)

(assert (=> b!907351 m!842199))

(declare-fun m!842201 () Bool)

(assert (=> b!907350 m!842201))

(declare-fun m!842203 () Bool)

(assert (=> b!907350 m!842203))

(declare-fun m!842205 () Bool)

(assert (=> b!907349 m!842205))

(declare-fun m!842207 () Bool)

(assert (=> b!907356 m!842207))

(declare-fun m!842209 () Bool)

(assert (=> b!907345 m!842209))

(declare-fun m!842211 () Bool)

(assert (=> b!907345 m!842211))

(declare-fun m!842213 () Bool)

(assert (=> b!907355 m!842213))

(declare-fun m!842215 () Bool)

(assert (=> b!907355 m!842215))

(check-sat (not b!907349) (not mapNonEmpty!29857) (not b_next!16345) (not b_lambda!13201) (not b!907345) (not b!907351) (not b!907344) (not b!907350) (not b!907355) (not start!77742) (not b!907356) b_and!26819 (not b!907346) tp_is_empty!18763)
(check-sat b_and!26819 (not b_next!16345))
(get-model)

(declare-fun b_lambda!13207 () Bool)

(assert (= b_lambda!13201 (or (and start!77742 b_free!16345) b_lambda!13207)))

(check-sat (not b!907349) (not b_next!16345) (not b!907345) (not b!907351) (not b!907344) (not b!907350) (not b!907355) (not start!77742) (not b!907356) (not mapNonEmpty!29857) (not b_lambda!13207) b_and!26819 (not b!907346) tp_is_empty!18763)
(check-sat b_and!26819 (not b_next!16345))
(get-model)

(declare-fun d!111891 () Bool)

(declare-datatypes ((Option!478 0))(
  ( (Some!477 (v!11940 V!29983)) (None!476) )
))
(declare-fun get!13541 (Option!478) V!29983)

(declare-fun getValueByKey!472 (List!18096 (_ BitVec 64)) Option!478)

(assert (=> d!111891 (= (apply!489 lt!409101 k0!1033) (get!13541 (getValueByKey!472 (toList!5514 lt!409101) k0!1033)))))

(declare-fun bs!25458 () Bool)

(assert (= bs!25458 d!111891))

(declare-fun m!842297 () Bool)

(assert (=> bs!25458 m!842297))

(assert (=> bs!25458 m!842297))

(declare-fun m!842299 () Bool)

(assert (=> bs!25458 m!842299))

(assert (=> b!907349 d!111891))

(declare-fun d!111893 () Bool)

(assert (=> d!111893 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!907344 d!111893))

(declare-fun d!111895 () Bool)

(declare-fun e!508547 () Bool)

(assert (=> d!111895 e!508547))

(declare-fun res!612522 () Bool)

(assert (=> d!111895 (=> res!612522 e!508547)))

(declare-fun lt!409144 () Bool)

(assert (=> d!111895 (= res!612522 (not lt!409144))))

(declare-fun lt!409147 () Bool)

(assert (=> d!111895 (= lt!409144 lt!409147)))

(declare-fun lt!409145 () Unit!30728)

(declare-fun e!508546 () Unit!30728)

(assert (=> d!111895 (= lt!409145 e!508546)))

(declare-fun c!95586 () Bool)

(assert (=> d!111895 (= c!95586 lt!409147)))

(declare-fun containsKey!436 (List!18096 (_ BitVec 64)) Bool)

(assert (=> d!111895 (= lt!409147 (containsKey!436 (toList!5514 lt!409101) k0!1033))))

(assert (=> d!111895 (= (contains!4516 lt!409101 k0!1033) lt!409144)))

(declare-fun b!907447 () Bool)

(declare-fun lt!409146 () Unit!30728)

(assert (=> b!907447 (= e!508546 lt!409146)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!331 (List!18096 (_ BitVec 64)) Unit!30728)

(assert (=> b!907447 (= lt!409146 (lemmaContainsKeyImpliesGetValueByKeyDefined!331 (toList!5514 lt!409101) k0!1033))))

(declare-fun isDefined!344 (Option!478) Bool)

(assert (=> b!907447 (isDefined!344 (getValueByKey!472 (toList!5514 lt!409101) k0!1033))))

(declare-fun b!907448 () Bool)

(declare-fun Unit!30732 () Unit!30728)

(assert (=> b!907448 (= e!508546 Unit!30732)))

(declare-fun b!907449 () Bool)

(assert (=> b!907449 (= e!508547 (isDefined!344 (getValueByKey!472 (toList!5514 lt!409101) k0!1033)))))

(assert (= (and d!111895 c!95586) b!907447))

(assert (= (and d!111895 (not c!95586)) b!907448))

(assert (= (and d!111895 (not res!612522)) b!907449))

(declare-fun m!842301 () Bool)

(assert (=> d!111895 m!842301))

(declare-fun m!842303 () Bool)

(assert (=> b!907447 m!842303))

(assert (=> b!907447 m!842297))

(assert (=> b!907447 m!842297))

(declare-fun m!842305 () Bool)

(assert (=> b!907447 m!842305))

(assert (=> b!907449 m!842297))

(assert (=> b!907449 m!842297))

(assert (=> b!907449 m!842305))

(assert (=> b!907350 d!111895))

(declare-fun bm!40238 () Bool)

(declare-fun call!40246 () ListLongMap!10997)

(declare-fun call!40245 () ListLongMap!10997)

(assert (=> bm!40238 (= call!40246 call!40245)))

(declare-fun bm!40239 () Bool)

(declare-fun call!40241 () ListLongMap!10997)

(declare-fun getCurrentListMapNoExtraKeys!3325 (array!53541 array!53539 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 32) Int) ListLongMap!10997)

(assert (=> bm!40239 (= call!40241 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907492 () Bool)

(declare-fun e!508575 () Bool)

(declare-fun call!40244 () Bool)

(assert (=> b!907492 (= e!508575 (not call!40244))))

(declare-fun bm!40240 () Bool)

(declare-fun call!40243 () ListLongMap!10997)

(declare-fun call!40242 () ListLongMap!10997)

(assert (=> bm!40240 (= call!40243 call!40242)))

(declare-fun b!907493 () Bool)

(declare-fun e!508577 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!907493 (= e!508577 (validKeyInArray!0 (select (arr!25730 _keys!1386) i!717)))))

(declare-fun b!907494 () Bool)

(declare-fun e!508578 () Bool)

(declare-fun lt!409206 () ListLongMap!10997)

(assert (=> b!907494 (= e!508578 (= (apply!489 lt!409206 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!907495 () Bool)

(declare-fun e!508582 () ListLongMap!10997)

(declare-fun e!508579 () ListLongMap!10997)

(assert (=> b!907495 (= e!508582 e!508579)))

(declare-fun c!95600 () Bool)

(assert (=> b!907495 (= c!95600 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!907496 () Bool)

(declare-fun e!508580 () Bool)

(declare-fun e!508585 () Bool)

(assert (=> b!907496 (= e!508580 e!508585)))

(declare-fun res!612548 () Bool)

(declare-fun call!40247 () Bool)

(assert (=> b!907496 (= res!612548 call!40247)))

(assert (=> b!907496 (=> (not res!612548) (not e!508585))))

(declare-fun bm!40241 () Bool)

(declare-fun c!95604 () Bool)

(declare-fun +!2628 (ListLongMap!10997 tuple2!12310) ListLongMap!10997)

(assert (=> bm!40241 (= call!40242 (+!2628 (ite c!95604 call!40241 (ite c!95600 call!40245 call!40246)) (ite (or c!95604 c!95600) (tuple2!12311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun bm!40242 () Bool)

(assert (=> bm!40242 (= call!40245 call!40241)))

(declare-fun bm!40243 () Bool)

(assert (=> bm!40243 (= call!40244 (contains!4516 lt!409206 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!907497 () Bool)

(declare-fun e!508583 () Bool)

(assert (=> b!907497 (= e!508583 (validKeyInArray!0 (select (arr!25730 _keys!1386) i!717)))))

(declare-fun b!907498 () Bool)

(assert (=> b!907498 (= e!508585 (= (apply!489 lt!409206 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!907499 () Bool)

(declare-fun e!508586 () Unit!30728)

(declare-fun Unit!30733 () Unit!30728)

(assert (=> b!907499 (= e!508586 Unit!30733)))

(declare-fun b!907501 () Bool)

(assert (=> b!907501 (= e!508579 call!40243)))

(declare-fun b!907502 () Bool)

(assert (=> b!907502 (= e!508580 (not call!40247))))

(declare-fun b!907503 () Bool)

(declare-fun e!508576 () ListLongMap!10997)

(assert (=> b!907503 (= e!508576 call!40243)))

(declare-fun b!907504 () Bool)

(declare-fun e!508584 () Bool)

(assert (=> b!907504 (= e!508584 (= (apply!489 lt!409206 (select (arr!25730 _keys!1386) i!717)) (get!13539 (select (arr!25729 _values!1152) i!717) (dynLambda!1358 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!907504 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26190 _values!1152)))))

(assert (=> b!907504 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26191 _keys!1386)))))

(declare-fun b!907505 () Bool)

(declare-fun res!612541 () Bool)

(declare-fun e!508581 () Bool)

(assert (=> b!907505 (=> (not res!612541) (not e!508581))))

(assert (=> b!907505 (= res!612541 e!508580)))

(declare-fun c!95603 () Bool)

(assert (=> b!907505 (= c!95603 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!907506 () Bool)

(declare-fun e!508574 () Bool)

(assert (=> b!907506 (= e!508574 e!508584)))

(declare-fun res!612547 () Bool)

(assert (=> b!907506 (=> (not res!612547) (not e!508584))))

(assert (=> b!907506 (= res!612547 (contains!4516 lt!409206 (select (arr!25730 _keys!1386) i!717)))))

(assert (=> b!907506 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26191 _keys!1386)))))

(declare-fun b!907507 () Bool)

(declare-fun res!612546 () Bool)

(assert (=> b!907507 (=> (not res!612546) (not e!508581))))

(assert (=> b!907507 (= res!612546 e!508574)))

(declare-fun res!612549 () Bool)

(assert (=> b!907507 (=> res!612549 e!508574)))

(assert (=> b!907507 (= res!612549 (not e!508583))))

(declare-fun res!612543 () Bool)

(assert (=> b!907507 (=> (not res!612543) (not e!508583))))

(assert (=> b!907507 (= res!612543 (bvslt i!717 (size!26191 _keys!1386)))))

(declare-fun bm!40244 () Bool)

(assert (=> bm!40244 (= call!40247 (contains!4516 lt!409206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!907508 () Bool)

(assert (=> b!907508 (= e!508582 (+!2628 call!40242 (tuple2!12311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!907509 () Bool)

(declare-fun c!95599 () Bool)

(assert (=> b!907509 (= c!95599 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!907509 (= e!508579 e!508576)))

(declare-fun b!907510 () Bool)

(assert (=> b!907510 (= e!508581 e!508575)))

(declare-fun c!95602 () Bool)

(assert (=> b!907510 (= c!95602 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!907511 () Bool)

(assert (=> b!907511 (= e!508576 call!40246)))

(declare-fun b!907512 () Bool)

(declare-fun lt!409204 () Unit!30728)

(assert (=> b!907512 (= e!508586 lt!409204)))

(declare-fun lt!409197 () ListLongMap!10997)

(assert (=> b!907512 (= lt!409197 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409192 () (_ BitVec 64))

(assert (=> b!907512 (= lt!409192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409210 () (_ BitVec 64))

(assert (=> b!907512 (= lt!409210 (select (arr!25730 _keys!1386) i!717))))

(declare-fun lt!409201 () Unit!30728)

(declare-fun addStillContains!343 (ListLongMap!10997 (_ BitVec 64) V!29983 (_ BitVec 64)) Unit!30728)

(assert (=> b!907512 (= lt!409201 (addStillContains!343 lt!409197 lt!409192 zeroValue!1094 lt!409210))))

(assert (=> b!907512 (contains!4516 (+!2628 lt!409197 (tuple2!12311 lt!409192 zeroValue!1094)) lt!409210)))

(declare-fun lt!409208 () Unit!30728)

(assert (=> b!907512 (= lt!409208 lt!409201)))

(declare-fun lt!409199 () ListLongMap!10997)

(assert (=> b!907512 (= lt!409199 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409195 () (_ BitVec 64))

(assert (=> b!907512 (= lt!409195 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409207 () (_ BitVec 64))

(assert (=> b!907512 (= lt!409207 (select (arr!25730 _keys!1386) i!717))))

(declare-fun lt!409213 () Unit!30728)

(declare-fun addApplyDifferent!343 (ListLongMap!10997 (_ BitVec 64) V!29983 (_ BitVec 64)) Unit!30728)

(assert (=> b!907512 (= lt!409213 (addApplyDifferent!343 lt!409199 lt!409195 minValue!1094 lt!409207))))

(assert (=> b!907512 (= (apply!489 (+!2628 lt!409199 (tuple2!12311 lt!409195 minValue!1094)) lt!409207) (apply!489 lt!409199 lt!409207))))

(declare-fun lt!409202 () Unit!30728)

(assert (=> b!907512 (= lt!409202 lt!409213)))

(declare-fun lt!409196 () ListLongMap!10997)

(assert (=> b!907512 (= lt!409196 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409200 () (_ BitVec 64))

(assert (=> b!907512 (= lt!409200 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409203 () (_ BitVec 64))

(assert (=> b!907512 (= lt!409203 (select (arr!25730 _keys!1386) i!717))))

(declare-fun lt!409193 () Unit!30728)

(assert (=> b!907512 (= lt!409193 (addApplyDifferent!343 lt!409196 lt!409200 zeroValue!1094 lt!409203))))

(assert (=> b!907512 (= (apply!489 (+!2628 lt!409196 (tuple2!12311 lt!409200 zeroValue!1094)) lt!409203) (apply!489 lt!409196 lt!409203))))

(declare-fun lt!409212 () Unit!30728)

(assert (=> b!907512 (= lt!409212 lt!409193)))

(declare-fun lt!409209 () ListLongMap!10997)

(assert (=> b!907512 (= lt!409209 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!409211 () (_ BitVec 64))

(assert (=> b!907512 (= lt!409211 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409205 () (_ BitVec 64))

(assert (=> b!907512 (= lt!409205 (select (arr!25730 _keys!1386) i!717))))

(assert (=> b!907512 (= lt!409204 (addApplyDifferent!343 lt!409209 lt!409211 minValue!1094 lt!409205))))

(assert (=> b!907512 (= (apply!489 (+!2628 lt!409209 (tuple2!12311 lt!409211 minValue!1094)) lt!409205) (apply!489 lt!409209 lt!409205))))

(declare-fun b!907500 () Bool)

(assert (=> b!907500 (= e!508575 e!508578)))

(declare-fun res!612542 () Bool)

(assert (=> b!907500 (= res!612542 call!40244)))

(assert (=> b!907500 (=> (not res!612542) (not e!508578))))

(declare-fun d!111897 () Bool)

(assert (=> d!111897 e!508581))

(declare-fun res!612544 () Bool)

(assert (=> d!111897 (=> (not res!612544) (not e!508581))))

(assert (=> d!111897 (= res!612544 (or (bvsge i!717 (size!26191 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26191 _keys!1386)))))))

(declare-fun lt!409198 () ListLongMap!10997)

(assert (=> d!111897 (= lt!409206 lt!409198)))

(declare-fun lt!409194 () Unit!30728)

(assert (=> d!111897 (= lt!409194 e!508586)))

(declare-fun c!95601 () Bool)

(assert (=> d!111897 (= c!95601 e!508577)))

(declare-fun res!612545 () Bool)

(assert (=> d!111897 (=> (not res!612545) (not e!508577))))

(assert (=> d!111897 (= res!612545 (bvslt i!717 (size!26191 _keys!1386)))))

(assert (=> d!111897 (= lt!409198 e!508582)))

(assert (=> d!111897 (= c!95604 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111897 (validMask!0 mask!1756)))

(assert (=> d!111897 (= (getCurrentListMap!2720 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!409206)))

(assert (= (and d!111897 c!95604) b!907508))

(assert (= (and d!111897 (not c!95604)) b!907495))

(assert (= (and b!907495 c!95600) b!907501))

(assert (= (and b!907495 (not c!95600)) b!907509))

(assert (= (and b!907509 c!95599) b!907503))

(assert (= (and b!907509 (not c!95599)) b!907511))

(assert (= (or b!907503 b!907511) bm!40238))

(assert (= (or b!907501 bm!40238) bm!40242))

(assert (= (or b!907501 b!907503) bm!40240))

(assert (= (or b!907508 bm!40242) bm!40239))

(assert (= (or b!907508 bm!40240) bm!40241))

(assert (= (and d!111897 res!612545) b!907493))

(assert (= (and d!111897 c!95601) b!907512))

(assert (= (and d!111897 (not c!95601)) b!907499))

(assert (= (and d!111897 res!612544) b!907507))

(assert (= (and b!907507 res!612543) b!907497))

(assert (= (and b!907507 (not res!612549)) b!907506))

(assert (= (and b!907506 res!612547) b!907504))

(assert (= (and b!907507 res!612546) b!907505))

(assert (= (and b!907505 c!95603) b!907496))

(assert (= (and b!907505 (not c!95603)) b!907502))

(assert (= (and b!907496 res!612548) b!907498))

(assert (= (or b!907496 b!907502) bm!40244))

(assert (= (and b!907505 res!612541) b!907510))

(assert (= (and b!907510 c!95602) b!907500))

(assert (= (and b!907510 (not c!95602)) b!907492))

(assert (= (and b!907500 res!612542) b!907494))

(assert (= (or b!907500 b!907492) bm!40243))

(declare-fun b_lambda!13209 () Bool)

(assert (=> (not b_lambda!13209) (not b!907504)))

(assert (=> b!907504 t!25603))

(declare-fun b_and!26829 () Bool)

(assert (= b_and!26819 (and (=> t!25603 result!10521) b_and!26829)))

(declare-fun m!842307 () Bool)

(assert (=> bm!40244 m!842307))

(declare-fun m!842309 () Bool)

(assert (=> b!907494 m!842309))

(declare-fun m!842311 () Bool)

(assert (=> bm!40239 m!842311))

(declare-fun m!842313 () Bool)

(assert (=> bm!40243 m!842313))

(declare-fun m!842315 () Bool)

(assert (=> b!907508 m!842315))

(declare-fun m!842317 () Bool)

(assert (=> bm!40241 m!842317))

(declare-fun m!842319 () Bool)

(assert (=> b!907512 m!842319))

(declare-fun m!842321 () Bool)

(assert (=> b!907512 m!842321))

(declare-fun m!842323 () Bool)

(assert (=> b!907512 m!842323))

(assert (=> b!907512 m!842195))

(declare-fun m!842325 () Bool)

(assert (=> b!907512 m!842325))

(declare-fun m!842327 () Bool)

(assert (=> b!907512 m!842327))

(declare-fun m!842329 () Bool)

(assert (=> b!907512 m!842329))

(declare-fun m!842331 () Bool)

(assert (=> b!907512 m!842331))

(declare-fun m!842333 () Bool)

(assert (=> b!907512 m!842333))

(declare-fun m!842335 () Bool)

(assert (=> b!907512 m!842335))

(assert (=> b!907512 m!842311))

(declare-fun m!842337 () Bool)

(assert (=> b!907512 m!842337))

(declare-fun m!842339 () Bool)

(assert (=> b!907512 m!842339))

(assert (=> b!907512 m!842331))

(declare-fun m!842341 () Bool)

(assert (=> b!907512 m!842341))

(assert (=> b!907512 m!842321))

(assert (=> b!907512 m!842319))

(declare-fun m!842343 () Bool)

(assert (=> b!907512 m!842343))

(declare-fun m!842345 () Bool)

(assert (=> b!907512 m!842345))

(assert (=> b!907512 m!842333))

(declare-fun m!842347 () Bool)

(assert (=> b!907512 m!842347))

(assert (=> b!907504 m!842195))

(assert (=> b!907504 m!842195))

(declare-fun m!842349 () Bool)

(assert (=> b!907504 m!842349))

(assert (=> b!907504 m!842181))

(assert (=> b!907504 m!842177))

(assert (=> b!907504 m!842181))

(assert (=> b!907504 m!842185))

(assert (=> b!907504 m!842177))

(assert (=> d!111897 m!842187))

(assert (=> b!907497 m!842195))

(assert (=> b!907497 m!842195))

(declare-fun m!842351 () Bool)

(assert (=> b!907497 m!842351))

(assert (=> b!907506 m!842195))

(assert (=> b!907506 m!842195))

(declare-fun m!842353 () Bool)

(assert (=> b!907506 m!842353))

(declare-fun m!842355 () Bool)

(assert (=> b!907498 m!842355))

(assert (=> b!907493 m!842195))

(assert (=> b!907493 m!842195))

(assert (=> b!907493 m!842351))

(assert (=> b!907350 d!111897))

(declare-fun d!111899 () Bool)

(declare-fun e!508588 () Bool)

(assert (=> d!111899 e!508588))

(declare-fun res!612550 () Bool)

(assert (=> d!111899 (=> res!612550 e!508588)))

(declare-fun lt!409214 () Bool)

(assert (=> d!111899 (= res!612550 (not lt!409214))))

(declare-fun lt!409217 () Bool)

(assert (=> d!111899 (= lt!409214 lt!409217)))

(declare-fun lt!409215 () Unit!30728)

(declare-fun e!508587 () Unit!30728)

(assert (=> d!111899 (= lt!409215 e!508587)))

(declare-fun c!95605 () Bool)

(assert (=> d!111899 (= c!95605 lt!409217)))

(assert (=> d!111899 (= lt!409217 (containsKey!436 (toList!5514 lt!409104) k0!1033))))

(assert (=> d!111899 (= (contains!4516 lt!409104 k0!1033) lt!409214)))

(declare-fun b!907513 () Bool)

(declare-fun lt!409216 () Unit!30728)

(assert (=> b!907513 (= e!508587 lt!409216)))

(assert (=> b!907513 (= lt!409216 (lemmaContainsKeyImpliesGetValueByKeyDefined!331 (toList!5514 lt!409104) k0!1033))))

(assert (=> b!907513 (isDefined!344 (getValueByKey!472 (toList!5514 lt!409104) k0!1033))))

(declare-fun b!907514 () Bool)

(declare-fun Unit!30734 () Unit!30728)

(assert (=> b!907514 (= e!508587 Unit!30734)))

(declare-fun b!907515 () Bool)

(assert (=> b!907515 (= e!508588 (isDefined!344 (getValueByKey!472 (toList!5514 lt!409104) k0!1033)))))

(assert (= (and d!111899 c!95605) b!907513))

(assert (= (and d!111899 (not c!95605)) b!907514))

(assert (= (and d!111899 (not res!612550)) b!907515))

(declare-fun m!842357 () Bool)

(assert (=> d!111899 m!842357))

(declare-fun m!842359 () Bool)

(assert (=> b!907513 m!842359))

(declare-fun m!842361 () Bool)

(assert (=> b!907513 m!842361))

(assert (=> b!907513 m!842361))

(declare-fun m!842363 () Bool)

(assert (=> b!907513 m!842363))

(assert (=> b!907515 m!842361))

(assert (=> b!907515 m!842361))

(assert (=> b!907515 m!842363))

(assert (=> b!907345 d!111899))

(declare-fun bm!40245 () Bool)

(declare-fun call!40253 () ListLongMap!10997)

(declare-fun call!40252 () ListLongMap!10997)

(assert (=> bm!40245 (= call!40253 call!40252)))

(declare-fun call!40248 () ListLongMap!10997)

(declare-fun bm!40246 () Bool)

(assert (=> bm!40246 (= call!40248 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907516 () Bool)

(declare-fun e!508590 () Bool)

(declare-fun call!40251 () Bool)

(assert (=> b!907516 (= e!508590 (not call!40251))))

(declare-fun bm!40247 () Bool)

(declare-fun call!40250 () ListLongMap!10997)

(declare-fun call!40249 () ListLongMap!10997)

(assert (=> bm!40247 (= call!40250 call!40249)))

(declare-fun b!907517 () Bool)

(declare-fun e!508592 () Bool)

(assert (=> b!907517 (= e!508592 (validKeyInArray!0 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!907518 () Bool)

(declare-fun e!508593 () Bool)

(declare-fun lt!409232 () ListLongMap!10997)

(assert (=> b!907518 (= e!508593 (= (apply!489 lt!409232 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!907519 () Bool)

(declare-fun e!508597 () ListLongMap!10997)

(declare-fun e!508594 () ListLongMap!10997)

(assert (=> b!907519 (= e!508597 e!508594)))

(declare-fun c!95607 () Bool)

(assert (=> b!907519 (= c!95607 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!907520 () Bool)

(declare-fun e!508595 () Bool)

(declare-fun e!508600 () Bool)

(assert (=> b!907520 (= e!508595 e!508600)))

(declare-fun res!612558 () Bool)

(declare-fun call!40254 () Bool)

(assert (=> b!907520 (= res!612558 call!40254)))

(assert (=> b!907520 (=> (not res!612558) (not e!508600))))

(declare-fun c!95611 () Bool)

(declare-fun bm!40248 () Bool)

(assert (=> bm!40248 (= call!40249 (+!2628 (ite c!95611 call!40248 (ite c!95607 call!40252 call!40253)) (ite (or c!95611 c!95607) (tuple2!12311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun bm!40249 () Bool)

(assert (=> bm!40249 (= call!40252 call!40248)))

(declare-fun bm!40250 () Bool)

(assert (=> bm!40250 (= call!40251 (contains!4516 lt!409232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!907521 () Bool)

(declare-fun e!508598 () Bool)

(assert (=> b!907521 (= e!508598 (validKeyInArray!0 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!907522 () Bool)

(assert (=> b!907522 (= e!508600 (= (apply!489 lt!409232 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!907523 () Bool)

(declare-fun e!508601 () Unit!30728)

(declare-fun Unit!30735 () Unit!30728)

(assert (=> b!907523 (= e!508601 Unit!30735)))

(declare-fun b!907525 () Bool)

(assert (=> b!907525 (= e!508594 call!40250)))

(declare-fun b!907526 () Bool)

(assert (=> b!907526 (= e!508595 (not call!40254))))

(declare-fun b!907527 () Bool)

(declare-fun e!508591 () ListLongMap!10997)

(assert (=> b!907527 (= e!508591 call!40250)))

(declare-fun e!508599 () Bool)

(declare-fun b!907528 () Bool)

(assert (=> b!907528 (= e!508599 (= (apply!489 lt!409232 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000)) (get!13539 (select (arr!25729 _values!1152) #b00000000000000000000000000000000) (dynLambda!1358 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!907528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26190 _values!1152)))))

(assert (=> b!907528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26191 _keys!1386)))))

(declare-fun b!907529 () Bool)

(declare-fun res!612551 () Bool)

(declare-fun e!508596 () Bool)

(assert (=> b!907529 (=> (not res!612551) (not e!508596))))

(assert (=> b!907529 (= res!612551 e!508595)))

(declare-fun c!95610 () Bool)

(assert (=> b!907529 (= c!95610 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!907530 () Bool)

(declare-fun e!508589 () Bool)

(assert (=> b!907530 (= e!508589 e!508599)))

(declare-fun res!612557 () Bool)

(assert (=> b!907530 (=> (not res!612557) (not e!508599))))

(assert (=> b!907530 (= res!612557 (contains!4516 lt!409232 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!907530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26191 _keys!1386)))))

(declare-fun b!907531 () Bool)

(declare-fun res!612556 () Bool)

(assert (=> b!907531 (=> (not res!612556) (not e!508596))))

(assert (=> b!907531 (= res!612556 e!508589)))

(declare-fun res!612559 () Bool)

(assert (=> b!907531 (=> res!612559 e!508589)))

(assert (=> b!907531 (= res!612559 (not e!508598))))

(declare-fun res!612553 () Bool)

(assert (=> b!907531 (=> (not res!612553) (not e!508598))))

(assert (=> b!907531 (= res!612553 (bvslt #b00000000000000000000000000000000 (size!26191 _keys!1386)))))

(declare-fun bm!40251 () Bool)

(assert (=> bm!40251 (= call!40254 (contains!4516 lt!409232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!907532 () Bool)

(assert (=> b!907532 (= e!508597 (+!2628 call!40249 (tuple2!12311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!907533 () Bool)

(declare-fun c!95606 () Bool)

(assert (=> b!907533 (= c!95606 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!907533 (= e!508594 e!508591)))

(declare-fun b!907534 () Bool)

(assert (=> b!907534 (= e!508596 e!508590)))

(declare-fun c!95609 () Bool)

(assert (=> b!907534 (= c!95609 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!907535 () Bool)

(assert (=> b!907535 (= e!508591 call!40253)))

(declare-fun b!907536 () Bool)

(declare-fun lt!409230 () Unit!30728)

(assert (=> b!907536 (= e!508601 lt!409230)))

(declare-fun lt!409223 () ListLongMap!10997)

(assert (=> b!907536 (= lt!409223 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409218 () (_ BitVec 64))

(assert (=> b!907536 (= lt!409218 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409236 () (_ BitVec 64))

(assert (=> b!907536 (= lt!409236 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409227 () Unit!30728)

(assert (=> b!907536 (= lt!409227 (addStillContains!343 lt!409223 lt!409218 zeroValue!1094 lt!409236))))

(assert (=> b!907536 (contains!4516 (+!2628 lt!409223 (tuple2!12311 lt!409218 zeroValue!1094)) lt!409236)))

(declare-fun lt!409234 () Unit!30728)

(assert (=> b!907536 (= lt!409234 lt!409227)))

(declare-fun lt!409225 () ListLongMap!10997)

(assert (=> b!907536 (= lt!409225 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409221 () (_ BitVec 64))

(assert (=> b!907536 (= lt!409221 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409233 () (_ BitVec 64))

(assert (=> b!907536 (= lt!409233 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409239 () Unit!30728)

(assert (=> b!907536 (= lt!409239 (addApplyDifferent!343 lt!409225 lt!409221 minValue!1094 lt!409233))))

(assert (=> b!907536 (= (apply!489 (+!2628 lt!409225 (tuple2!12311 lt!409221 minValue!1094)) lt!409233) (apply!489 lt!409225 lt!409233))))

(declare-fun lt!409228 () Unit!30728)

(assert (=> b!907536 (= lt!409228 lt!409239)))

(declare-fun lt!409222 () ListLongMap!10997)

(assert (=> b!907536 (= lt!409222 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409226 () (_ BitVec 64))

(assert (=> b!907536 (= lt!409226 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409229 () (_ BitVec 64))

(assert (=> b!907536 (= lt!409229 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409219 () Unit!30728)

(assert (=> b!907536 (= lt!409219 (addApplyDifferent!343 lt!409222 lt!409226 zeroValue!1094 lt!409229))))

(assert (=> b!907536 (= (apply!489 (+!2628 lt!409222 (tuple2!12311 lt!409226 zeroValue!1094)) lt!409229) (apply!489 lt!409222 lt!409229))))

(declare-fun lt!409238 () Unit!30728)

(assert (=> b!907536 (= lt!409238 lt!409219)))

(declare-fun lt!409235 () ListLongMap!10997)

(assert (=> b!907536 (= lt!409235 (getCurrentListMapNoExtraKeys!3325 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!409237 () (_ BitVec 64))

(assert (=> b!907536 (= lt!409237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!409231 () (_ BitVec 64))

(assert (=> b!907536 (= lt!409231 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!907536 (= lt!409230 (addApplyDifferent!343 lt!409235 lt!409237 minValue!1094 lt!409231))))

(assert (=> b!907536 (= (apply!489 (+!2628 lt!409235 (tuple2!12311 lt!409237 minValue!1094)) lt!409231) (apply!489 lt!409235 lt!409231))))

(declare-fun b!907524 () Bool)

(assert (=> b!907524 (= e!508590 e!508593)))

(declare-fun res!612552 () Bool)

(assert (=> b!907524 (= res!612552 call!40251)))

(assert (=> b!907524 (=> (not res!612552) (not e!508593))))

(declare-fun d!111901 () Bool)

(assert (=> d!111901 e!508596))

(declare-fun res!612554 () Bool)

(assert (=> d!111901 (=> (not res!612554) (not e!508596))))

(assert (=> d!111901 (= res!612554 (or (bvsge #b00000000000000000000000000000000 (size!26191 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26191 _keys!1386)))))))

(declare-fun lt!409224 () ListLongMap!10997)

(assert (=> d!111901 (= lt!409232 lt!409224)))

(declare-fun lt!409220 () Unit!30728)

(assert (=> d!111901 (= lt!409220 e!508601)))

(declare-fun c!95608 () Bool)

(assert (=> d!111901 (= c!95608 e!508592)))

(declare-fun res!612555 () Bool)

(assert (=> d!111901 (=> (not res!612555) (not e!508592))))

(assert (=> d!111901 (= res!612555 (bvslt #b00000000000000000000000000000000 (size!26191 _keys!1386)))))

(assert (=> d!111901 (= lt!409224 e!508597)))

(assert (=> d!111901 (= c!95611 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111901 (validMask!0 mask!1756)))

(assert (=> d!111901 (= (getCurrentListMap!2720 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!409232)))

(assert (= (and d!111901 c!95611) b!907532))

(assert (= (and d!111901 (not c!95611)) b!907519))

(assert (= (and b!907519 c!95607) b!907525))

(assert (= (and b!907519 (not c!95607)) b!907533))

(assert (= (and b!907533 c!95606) b!907527))

(assert (= (and b!907533 (not c!95606)) b!907535))

(assert (= (or b!907527 b!907535) bm!40245))

(assert (= (or b!907525 bm!40245) bm!40249))

(assert (= (or b!907525 b!907527) bm!40247))

(assert (= (or b!907532 bm!40249) bm!40246))

(assert (= (or b!907532 bm!40247) bm!40248))

(assert (= (and d!111901 res!612555) b!907517))

(assert (= (and d!111901 c!95608) b!907536))

(assert (= (and d!111901 (not c!95608)) b!907523))

(assert (= (and d!111901 res!612554) b!907531))

(assert (= (and b!907531 res!612553) b!907521))

(assert (= (and b!907531 (not res!612559)) b!907530))

(assert (= (and b!907530 res!612557) b!907528))

(assert (= (and b!907531 res!612556) b!907529))

(assert (= (and b!907529 c!95610) b!907520))

(assert (= (and b!907529 (not c!95610)) b!907526))

(assert (= (and b!907520 res!612558) b!907522))

(assert (= (or b!907520 b!907526) bm!40251))

(assert (= (and b!907529 res!612551) b!907534))

(assert (= (and b!907534 c!95609) b!907524))

(assert (= (and b!907534 (not c!95609)) b!907516))

(assert (= (and b!907524 res!612552) b!907518))

(assert (= (or b!907524 b!907516) bm!40250))

(declare-fun b_lambda!13211 () Bool)

(assert (=> (not b_lambda!13211) (not b!907528)))

(assert (=> b!907528 t!25603))

(declare-fun b_and!26831 () Bool)

(assert (= b_and!26829 (and (=> t!25603 result!10521) b_and!26831)))

(declare-fun m!842365 () Bool)

(assert (=> bm!40251 m!842365))

(declare-fun m!842367 () Bool)

(assert (=> b!907518 m!842367))

(declare-fun m!842369 () Bool)

(assert (=> bm!40246 m!842369))

(declare-fun m!842371 () Bool)

(assert (=> bm!40250 m!842371))

(declare-fun m!842373 () Bool)

(assert (=> b!907532 m!842373))

(declare-fun m!842375 () Bool)

(assert (=> bm!40248 m!842375))

(declare-fun m!842377 () Bool)

(assert (=> b!907536 m!842377))

(declare-fun m!842379 () Bool)

(assert (=> b!907536 m!842379))

(declare-fun m!842381 () Bool)

(assert (=> b!907536 m!842381))

(declare-fun m!842383 () Bool)

(assert (=> b!907536 m!842383))

(declare-fun m!842385 () Bool)

(assert (=> b!907536 m!842385))

(declare-fun m!842387 () Bool)

(assert (=> b!907536 m!842387))

(declare-fun m!842389 () Bool)

(assert (=> b!907536 m!842389))

(declare-fun m!842391 () Bool)

(assert (=> b!907536 m!842391))

(declare-fun m!842393 () Bool)

(assert (=> b!907536 m!842393))

(declare-fun m!842395 () Bool)

(assert (=> b!907536 m!842395))

(assert (=> b!907536 m!842369))

(declare-fun m!842397 () Bool)

(assert (=> b!907536 m!842397))

(declare-fun m!842399 () Bool)

(assert (=> b!907536 m!842399))

(assert (=> b!907536 m!842391))

(declare-fun m!842401 () Bool)

(assert (=> b!907536 m!842401))

(assert (=> b!907536 m!842379))

(assert (=> b!907536 m!842377))

(declare-fun m!842403 () Bool)

(assert (=> b!907536 m!842403))

(declare-fun m!842405 () Bool)

(assert (=> b!907536 m!842405))

(assert (=> b!907536 m!842393))

(declare-fun m!842407 () Bool)

(assert (=> b!907536 m!842407))

(assert (=> b!907528 m!842383))

(assert (=> b!907528 m!842383))

(declare-fun m!842409 () Bool)

(assert (=> b!907528 m!842409))

(assert (=> b!907528 m!842181))

(declare-fun m!842411 () Bool)

(assert (=> b!907528 m!842411))

(assert (=> b!907528 m!842181))

(declare-fun m!842413 () Bool)

(assert (=> b!907528 m!842413))

(assert (=> b!907528 m!842411))

(assert (=> d!111901 m!842187))

(assert (=> b!907521 m!842383))

(assert (=> b!907521 m!842383))

(declare-fun m!842415 () Bool)

(assert (=> b!907521 m!842415))

(assert (=> b!907530 m!842383))

(assert (=> b!907530 m!842383))

(declare-fun m!842417 () Bool)

(assert (=> b!907530 m!842417))

(declare-fun m!842419 () Bool)

(assert (=> b!907522 m!842419))

(assert (=> b!907517 m!842383))

(assert (=> b!907517 m!842383))

(assert (=> b!907517 m!842415))

(assert (=> b!907345 d!111901))

(declare-fun d!111903 () Bool)

(assert (=> d!111903 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77742 d!111903))

(declare-fun d!111905 () Bool)

(assert (=> d!111905 (= (array_inv!20190 _values!1152) (bvsge (size!26190 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77742 d!111905))

(declare-fun d!111907 () Bool)

(assert (=> d!111907 (= (array_inv!20191 _keys!1386) (bvsge (size!26191 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77742 d!111907))

(declare-fun d!111909 () Bool)

(assert (=> d!111909 (= (apply!489 lt!409104 k0!1033) (get!13541 (getValueByKey!472 (toList!5514 lt!409104) k0!1033)))))

(declare-fun bs!25459 () Bool)

(assert (= bs!25459 d!111909))

(assert (=> bs!25459 m!842361))

(assert (=> bs!25459 m!842361))

(declare-fun m!842421 () Bool)

(assert (=> bs!25459 m!842421))

(assert (=> b!907355 d!111909))

(declare-fun d!111911 () Bool)

(declare-fun e!508604 () Bool)

(assert (=> d!111911 e!508604))

(declare-fun res!612562 () Bool)

(assert (=> d!111911 (=> (not res!612562) (not e!508604))))

(assert (=> d!111911 (= res!612562 (contains!4516 (getCurrentListMap!2720 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun lt!409242 () Unit!30728)

(declare-fun choose!1536 (array!53541 array!53539 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) V!29983 (_ BitVec 32) Int) Unit!30728)

(assert (=> d!111911 (= lt!409242 (choose!1536 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409103 i!717 defaultEntry!1160))))

(assert (=> d!111911 (validMask!0 mask!1756)))

(assert (=> d!111911 (= (lemmaListMapApplyFromThenApplyFromZero!49 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409103 i!717 defaultEntry!1160) lt!409242)))

(declare-fun b!907539 () Bool)

(assert (=> b!907539 (= e!508604 (= (apply!489 (getCurrentListMap!2720 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!409103))))

(assert (= (and d!111911 res!612562) b!907539))

(assert (=> d!111911 m!842211))

(assert (=> d!111911 m!842211))

(declare-fun m!842423 () Bool)

(assert (=> d!111911 m!842423))

(declare-fun m!842425 () Bool)

(assert (=> d!111911 m!842425))

(assert (=> d!111911 m!842187))

(assert (=> b!907539 m!842211))

(assert (=> b!907539 m!842211))

(declare-fun m!842427 () Bool)

(assert (=> b!907539 m!842427))

(assert (=> b!907355 d!111911))

(declare-fun b!907548 () Bool)

(declare-fun e!508613 () Bool)

(declare-fun e!508612 () Bool)

(assert (=> b!907548 (= e!508613 e!508612)))

(declare-fun lt!409249 () (_ BitVec 64))

(assert (=> b!907548 (= lt!409249 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!409251 () Unit!30728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53541 (_ BitVec 64) (_ BitVec 32)) Unit!30728)

(assert (=> b!907548 (= lt!409251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!409249 #b00000000000000000000000000000000))))

(assert (=> b!907548 (arrayContainsKey!0 _keys!1386 lt!409249 #b00000000000000000000000000000000)))

(declare-fun lt!409250 () Unit!30728)

(assert (=> b!907548 (= lt!409250 lt!409251)))

(declare-fun res!612568 () Bool)

(declare-datatypes ((SeekEntryResult!8963 0))(
  ( (MissingZero!8963 (index!38223 (_ BitVec 32))) (Found!8963 (index!38224 (_ BitVec 32))) (Intermediate!8963 (undefined!9775 Bool) (index!38225 (_ BitVec 32)) (x!77495 (_ BitVec 32))) (Undefined!8963) (MissingVacant!8963 (index!38226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53541 (_ BitVec 32)) SeekEntryResult!8963)

(assert (=> b!907548 (= res!612568 (= (seekEntryOrOpen!0 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8963 #b00000000000000000000000000000000)))))

(assert (=> b!907548 (=> (not res!612568) (not e!508612))))

(declare-fun d!111913 () Bool)

(declare-fun res!612567 () Bool)

(declare-fun e!508611 () Bool)

(assert (=> d!111913 (=> res!612567 e!508611)))

(assert (=> d!111913 (= res!612567 (bvsge #b00000000000000000000000000000000 (size!26191 _keys!1386)))))

(assert (=> d!111913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!508611)))

(declare-fun b!907549 () Bool)

(declare-fun call!40257 () Bool)

(assert (=> b!907549 (= e!508612 call!40257)))

(declare-fun bm!40254 () Bool)

(assert (=> bm!40254 (= call!40257 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!907550 () Bool)

(assert (=> b!907550 (= e!508611 e!508613)))

(declare-fun c!95614 () Bool)

(assert (=> b!907550 (= c!95614 (validKeyInArray!0 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!907551 () Bool)

(assert (=> b!907551 (= e!508613 call!40257)))

(assert (= (and d!111913 (not res!612567)) b!907550))

(assert (= (and b!907550 c!95614) b!907548))

(assert (= (and b!907550 (not c!95614)) b!907551))

(assert (= (and b!907548 res!612568) b!907549))

(assert (= (or b!907549 b!907551) bm!40254))

(assert (=> b!907548 m!842383))

(declare-fun m!842429 () Bool)

(assert (=> b!907548 m!842429))

(declare-fun m!842431 () Bool)

(assert (=> b!907548 m!842431))

(assert (=> b!907548 m!842383))

(declare-fun m!842433 () Bool)

(assert (=> b!907548 m!842433))

(declare-fun m!842435 () Bool)

(assert (=> bm!40254 m!842435))

(assert (=> b!907550 m!842383))

(assert (=> b!907550 m!842383))

(assert (=> b!907550 m!842415))

(assert (=> b!907351 d!111913))

(declare-fun d!111915 () Bool)

(declare-fun c!95617 () Bool)

(assert (=> d!111915 (= c!95617 ((_ is ValueCellFull!8900) (select (arr!25729 _values!1152) i!717)))))

(declare-fun e!508616 () V!29983)

(assert (=> d!111915 (= (get!13539 (select (arr!25729 _values!1152) i!717) (dynLambda!1358 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!508616)))

(declare-fun b!907556 () Bool)

(declare-fun get!13542 (ValueCell!8900 V!29983) V!29983)

(assert (=> b!907556 (= e!508616 (get!13542 (select (arr!25729 _values!1152) i!717) (dynLambda!1358 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!907557 () Bool)

(declare-fun get!13543 (ValueCell!8900 V!29983) V!29983)

(assert (=> b!907557 (= e!508616 (get!13543 (select (arr!25729 _values!1152) i!717) (dynLambda!1358 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111915 c!95617) b!907556))

(assert (= (and d!111915 (not c!95617)) b!907557))

(assert (=> b!907556 m!842177))

(assert (=> b!907556 m!842181))

(declare-fun m!842437 () Bool)

(assert (=> b!907556 m!842437))

(assert (=> b!907557 m!842177))

(assert (=> b!907557 m!842181))

(declare-fun m!842439 () Bool)

(assert (=> b!907557 m!842439))

(assert (=> b!907346 d!111915))

(declare-fun d!111917 () Bool)

(declare-fun res!612573 () Bool)

(declare-fun e!508621 () Bool)

(assert (=> d!111917 (=> res!612573 e!508621)))

(assert (=> d!111917 (= res!612573 (= (select (arr!25730 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!111917 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!508621)))

(declare-fun b!907562 () Bool)

(declare-fun e!508622 () Bool)

(assert (=> b!907562 (= e!508621 e!508622)))

(declare-fun res!612574 () Bool)

(assert (=> b!907562 (=> (not res!612574) (not e!508622))))

(assert (=> b!907562 (= res!612574 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26191 _keys!1386)))))

(declare-fun b!907563 () Bool)

(assert (=> b!907563 (= e!508622 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111917 (not res!612573)) b!907562))

(assert (= (and b!907562 res!612574) b!907563))

(assert (=> d!111917 m!842383))

(declare-fun m!842441 () Bool)

(assert (=> b!907563 m!842441))

(assert (=> b!907346 d!111917))

(declare-fun d!111919 () Bool)

(declare-fun e!508625 () Bool)

(assert (=> d!111919 e!508625))

(declare-fun c!95620 () Bool)

(assert (=> d!111919 (= c!95620 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!409254 () Unit!30728)

(declare-fun choose!1537 (array!53541 array!53539 (_ BitVec 32) (_ BitVec 32) V!29983 V!29983 (_ BitVec 64) Int) Unit!30728)

(assert (=> d!111919 (= lt!409254 (choose!1537 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!111919 (validMask!0 mask!1756)))

(assert (=> d!111919 (= (lemmaKeyInListMapIsInArray!234 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!409254)))

(declare-fun b!907568 () Bool)

(assert (=> b!907568 (= e!508625 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!907569 () Bool)

(assert (=> b!907569 (= e!508625 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!111919 c!95620) b!907568))

(assert (= (and d!111919 (not c!95620)) b!907569))

(declare-fun m!842443 () Bool)

(assert (=> d!111919 m!842443))

(assert (=> d!111919 m!842187))

(assert (=> b!907568 m!842183))

(assert (=> b!907346 d!111919))

(declare-fun bm!40257 () Bool)

(declare-fun call!40260 () Bool)

(declare-fun c!95623 () Bool)

(assert (=> bm!40257 (= call!40260 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95623 (Cons!18093 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000) Nil!18094) Nil!18094)))))

(declare-fun b!907580 () Bool)

(declare-fun e!508635 () Bool)

(declare-fun e!508636 () Bool)

(assert (=> b!907580 (= e!508635 e!508636)))

(declare-fun res!612581 () Bool)

(assert (=> b!907580 (=> (not res!612581) (not e!508636))))

(declare-fun e!508637 () Bool)

(assert (=> b!907580 (= res!612581 (not e!508637))))

(declare-fun res!612583 () Bool)

(assert (=> b!907580 (=> (not res!612583) (not e!508637))))

(assert (=> b!907580 (= res!612583 (validKeyInArray!0 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!111921 () Bool)

(declare-fun res!612582 () Bool)

(assert (=> d!111921 (=> res!612582 e!508635)))

(assert (=> d!111921 (= res!612582 (bvsge #b00000000000000000000000000000000 (size!26191 _keys!1386)))))

(assert (=> d!111921 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18094) e!508635)))

(declare-fun b!907581 () Bool)

(declare-fun e!508634 () Bool)

(assert (=> b!907581 (= e!508634 call!40260)))

(declare-fun b!907582 () Bool)

(assert (=> b!907582 (= e!508636 e!508634)))

(assert (=> b!907582 (= c!95623 (validKeyInArray!0 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!907583 () Bool)

(assert (=> b!907583 (= e!508634 call!40260)))

(declare-fun b!907584 () Bool)

(declare-fun contains!4518 (List!18097 (_ BitVec 64)) Bool)

(assert (=> b!907584 (= e!508637 (contains!4518 Nil!18094 (select (arr!25730 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!111921 (not res!612582)) b!907580))

(assert (= (and b!907580 res!612583) b!907584))

(assert (= (and b!907580 res!612581) b!907582))

(assert (= (and b!907582 c!95623) b!907583))

(assert (= (and b!907582 (not c!95623)) b!907581))

(assert (= (or b!907583 b!907581) bm!40257))

(assert (=> bm!40257 m!842383))

(declare-fun m!842445 () Bool)

(assert (=> bm!40257 m!842445))

(assert (=> b!907580 m!842383))

(assert (=> b!907580 m!842383))

(assert (=> b!907580 m!842415))

(assert (=> b!907582 m!842383))

(assert (=> b!907582 m!842383))

(assert (=> b!907582 m!842415))

(assert (=> b!907584 m!842383))

(assert (=> b!907584 m!842383))

(declare-fun m!842447 () Bool)

(assert (=> b!907584 m!842447))

(assert (=> b!907356 d!111921))

(declare-fun mapIsEmpty!29866 () Bool)

(declare-fun mapRes!29866 () Bool)

(assert (=> mapIsEmpty!29866 mapRes!29866))

(declare-fun mapNonEmpty!29866 () Bool)

(declare-fun tp!57313 () Bool)

(declare-fun e!508643 () Bool)

(assert (=> mapNonEmpty!29866 (= mapRes!29866 (and tp!57313 e!508643))))

(declare-fun mapRest!29866 () (Array (_ BitVec 32) ValueCell!8900))

(declare-fun mapValue!29866 () ValueCell!8900)

(declare-fun mapKey!29866 () (_ BitVec 32))

(assert (=> mapNonEmpty!29866 (= mapRest!29857 (store mapRest!29866 mapKey!29866 mapValue!29866))))

(declare-fun b!907592 () Bool)

(declare-fun e!508642 () Bool)

(assert (=> b!907592 (= e!508642 tp_is_empty!18763)))

(declare-fun condMapEmpty!29866 () Bool)

(declare-fun mapDefault!29866 () ValueCell!8900)

(assert (=> mapNonEmpty!29857 (= condMapEmpty!29866 (= mapRest!29857 ((as const (Array (_ BitVec 32) ValueCell!8900)) mapDefault!29866)))))

(assert (=> mapNonEmpty!29857 (= tp!57297 (and e!508642 mapRes!29866))))

(declare-fun b!907591 () Bool)

(assert (=> b!907591 (= e!508643 tp_is_empty!18763)))

(assert (= (and mapNonEmpty!29857 condMapEmpty!29866) mapIsEmpty!29866))

(assert (= (and mapNonEmpty!29857 (not condMapEmpty!29866)) mapNonEmpty!29866))

(assert (= (and mapNonEmpty!29866 ((_ is ValueCellFull!8900) mapValue!29866)) b!907591))

(assert (= (and mapNonEmpty!29857 ((_ is ValueCellFull!8900) mapDefault!29866)) b!907592))

(declare-fun m!842449 () Bool)

(assert (=> mapNonEmpty!29866 m!842449))

(declare-fun b_lambda!13213 () Bool)

(assert (= b_lambda!13211 (or (and start!77742 b_free!16345) b_lambda!13213)))

(declare-fun b_lambda!13215 () Bool)

(assert (= b_lambda!13209 (or (and start!77742 b_free!16345) b_lambda!13215)))

(check-sat (not b_lambda!13207) (not b_lambda!13213) (not bm!40244) (not b!907506) b_and!26831 (not bm!40250) (not b!907493) (not d!111897) (not d!111911) (not b!907521) (not b!907497) (not b!907447) (not d!111901) tp_is_empty!18763 (not b_next!16345) (not b!907518) (not bm!40246) (not b!907548) (not bm!40239) (not b!907515) (not b!907584) (not b!907517) (not bm!40257) (not d!111891) (not bm!40243) (not b!907530) (not bm!40254) (not mapNonEmpty!29866) (not d!111895) (not b!907532) (not b!907498) (not b!907528) (not b!907494) (not bm!40248) (not b_lambda!13215) (not d!111899) (not b!907563) (not b!907568) (not bm!40251) (not b!907557) (not b!907536) (not b!907539) (not d!111919) (not b!907582) (not bm!40241) (not b!907512) (not b!907522) (not b!907449) (not b!907580) (not b!907504) (not b!907513) (not d!111909) (not b!907550) (not b!907556) (not b!907508))
(check-sat b_and!26831 (not b_next!16345))
