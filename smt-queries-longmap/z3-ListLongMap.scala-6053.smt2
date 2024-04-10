; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78260 () Bool)

(assert start!78260)

(declare-fun b_free!16731 () Bool)

(declare-fun b_next!16731 () Bool)

(assert (=> start!78260 (= b_free!16731 (not b_next!16731))))

(declare-fun tp!58473 () Bool)

(declare-fun b_and!27309 () Bool)

(assert (=> start!78260 (= tp!58473 b_and!27309)))

(declare-datatypes ((V!30497 0))(
  ( (V!30498 (val!9625 Int)) )
))
(declare-datatypes ((ValueCell!9093 0))(
  ( (ValueCellFull!9093 (v!12137 V!30497)) (EmptyCell!9093) )
))
(declare-datatypes ((array!54290 0))(
  ( (array!54291 (arr!26098 (Array (_ BitVec 32) ValueCell!9093)) (size!26557 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54290)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30497)

(declare-datatypes ((array!54292 0))(
  ( (array!54293 (arr!26099 (Array (_ BitVec 32) (_ BitVec 64))) (size!26558 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54292)

(declare-fun e!512310 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30497)

(declare-fun b!913349 () Bool)

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((tuple2!12544 0))(
  ( (tuple2!12545 (_1!6283 (_ BitVec 64)) (_2!6283 V!30497)) )
))
(declare-datatypes ((List!18332 0))(
  ( (Nil!18329) (Cons!18328 (h!19474 tuple2!12544) (t!25923 List!18332)) )
))
(declare-datatypes ((ListLongMap!11241 0))(
  ( (ListLongMap!11242 (toList!5636 List!18332)) )
))
(declare-fun contains!4683 (ListLongMap!11241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2898 (array!54292 array!54290 (_ BitVec 32) (_ BitVec 32) V!30497 V!30497 (_ BitVec 32) Int) ListLongMap!11241)

(assert (=> b!913349 (= e!512310 (contains!4683 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) k0!1033))))

(declare-fun b!913350 () Bool)

(declare-fun res!616109 () Bool)

(declare-fun e!512309 () Bool)

(assert (=> b!913350 (=> (not res!616109) (not e!512309))))

(assert (=> b!913350 (= res!616109 (and (= (size!26557 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26558 _keys!1386) (size!26557 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913351 () Bool)

(declare-fun res!616103 () Bool)

(assert (=> b!913351 (=> (not res!616103) (not e!512309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54292 (_ BitVec 32)) Bool)

(assert (=> b!913351 (= res!616103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913352 () Bool)

(declare-fun res!616108 () Bool)

(assert (=> b!913352 (=> (not res!616108) (not e!512309))))

(declare-datatypes ((List!18333 0))(
  ( (Nil!18330) (Cons!18329 (h!19475 (_ BitVec 64)) (t!25924 List!18333)) )
))
(declare-fun arrayNoDuplicates!0 (array!54292 (_ BitVec 32) List!18333) Bool)

(assert (=> b!913352 (= res!616108 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18330))))

(declare-fun b!913353 () Bool)

(declare-fun e!512306 () Bool)

(declare-fun tp_is_empty!19149 () Bool)

(assert (=> b!913353 (= e!512306 tp_is_empty!19149)))

(declare-fun b!913354 () Bool)

(declare-fun res!616104 () Bool)

(assert (=> b!913354 (=> (not res!616104) (not e!512309))))

(assert (=> b!913354 (= res!616104 (contains!4683 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913355 () Bool)

(declare-fun res!616110 () Bool)

(assert (=> b!913355 (=> (not res!616110) (not e!512309))))

(assert (=> b!913355 (= res!616110 (and (= (select (arr!26099 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913356 () Bool)

(declare-fun e!512305 () Bool)

(assert (=> b!913356 (= e!512305 tp_is_empty!19149)))

(declare-fun res!616107 () Bool)

(assert (=> start!78260 (=> (not res!616107) (not e!512309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78260 (= res!616107 (validMask!0 mask!1756))))

(assert (=> start!78260 e!512309))

(declare-fun e!512307 () Bool)

(declare-fun array_inv!20384 (array!54290) Bool)

(assert (=> start!78260 (and (array_inv!20384 _values!1152) e!512307)))

(assert (=> start!78260 tp!58473))

(assert (=> start!78260 true))

(assert (=> start!78260 tp_is_empty!19149))

(declare-fun array_inv!20385 (array!54292) Bool)

(assert (=> start!78260 (array_inv!20385 _keys!1386)))

(declare-fun mapIsEmpty!30454 () Bool)

(declare-fun mapRes!30454 () Bool)

(assert (=> mapIsEmpty!30454 mapRes!30454))

(declare-fun b!913357 () Bool)

(declare-fun res!616105 () Bool)

(assert (=> b!913357 (=> (not res!616105) (not e!512309))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913357 (= res!616105 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!30454 () Bool)

(declare-fun tp!58472 () Bool)

(assert (=> mapNonEmpty!30454 (= mapRes!30454 (and tp!58472 e!512305))))

(declare-fun mapRest!30454 () (Array (_ BitVec 32) ValueCell!9093))

(declare-fun mapKey!30454 () (_ BitVec 32))

(declare-fun mapValue!30454 () ValueCell!9093)

(assert (=> mapNonEmpty!30454 (= (arr!26098 _values!1152) (store mapRest!30454 mapKey!30454 mapValue!30454))))

(declare-fun b!913358 () Bool)

(assert (=> b!913358 (= e!512307 (and e!512306 mapRes!30454))))

(declare-fun condMapEmpty!30454 () Bool)

(declare-fun mapDefault!30454 () ValueCell!9093)

(assert (=> b!913358 (= condMapEmpty!30454 (= (arr!26098 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9093)) mapDefault!30454)))))

(declare-fun b!913359 () Bool)

(assert (=> b!913359 (= e!512309 (not e!512310))))

(declare-fun res!616106 () Bool)

(assert (=> b!913359 (=> res!616106 e!512310)))

(assert (=> b!913359 (= res!616106 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26558 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!54292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913359 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30918 0))(
  ( (Unit!30919) )
))
(declare-fun lt!410837 () Unit!30918)

(declare-fun lemmaKeyInListMapIsInArray!283 (array!54292 array!54290 (_ BitVec 32) (_ BitVec 32) V!30497 V!30497 (_ BitVec 64) Int) Unit!30918)

(assert (=> b!913359 (= lt!410837 (lemmaKeyInListMapIsInArray!283 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!78260 res!616107) b!913350))

(assert (= (and b!913350 res!616109) b!913351))

(assert (= (and b!913351 res!616103) b!913352))

(assert (= (and b!913352 res!616108) b!913354))

(assert (= (and b!913354 res!616104) b!913357))

(assert (= (and b!913357 res!616105) b!913355))

(assert (= (and b!913355 res!616110) b!913359))

(assert (= (and b!913359 (not res!616106)) b!913349))

(assert (= (and b!913358 condMapEmpty!30454) mapIsEmpty!30454))

(assert (= (and b!913358 (not condMapEmpty!30454)) mapNonEmpty!30454))

(get-info :version)

(assert (= (and mapNonEmpty!30454 ((_ is ValueCellFull!9093) mapValue!30454)) b!913356))

(assert (= (and b!913358 ((_ is ValueCellFull!9093) mapDefault!30454)) b!913353))

(assert (= start!78260 b!913358))

(declare-fun m!847659 () Bool)

(assert (=> b!913351 m!847659))

(declare-fun m!847661 () Bool)

(assert (=> b!913349 m!847661))

(assert (=> b!913349 m!847661))

(declare-fun m!847663 () Bool)

(assert (=> b!913349 m!847663))

(declare-fun m!847665 () Bool)

(assert (=> mapNonEmpty!30454 m!847665))

(declare-fun m!847667 () Bool)

(assert (=> b!913352 m!847667))

(declare-fun m!847669 () Bool)

(assert (=> start!78260 m!847669))

(declare-fun m!847671 () Bool)

(assert (=> start!78260 m!847671))

(declare-fun m!847673 () Bool)

(assert (=> start!78260 m!847673))

(declare-fun m!847675 () Bool)

(assert (=> b!913359 m!847675))

(declare-fun m!847677 () Bool)

(assert (=> b!913359 m!847677))

(declare-fun m!847679 () Bool)

(assert (=> b!913355 m!847679))

(declare-fun m!847681 () Bool)

(assert (=> b!913354 m!847681))

(assert (=> b!913354 m!847681))

(declare-fun m!847683 () Bool)

(assert (=> b!913354 m!847683))

(declare-fun m!847685 () Bool)

(assert (=> b!913357 m!847685))

(check-sat (not b_next!16731) (not b!913352) (not b!913351) (not mapNonEmpty!30454) (not start!78260) (not b!913357) b_and!27309 tp_is_empty!19149 (not b!913349) (not b!913359) (not b!913354))
(check-sat b_and!27309 (not b_next!16731))
(get-model)

(declare-fun d!112337 () Bool)

(declare-fun e!512333 () Bool)

(assert (=> d!112337 e!512333))

(declare-fun res!616137 () Bool)

(assert (=> d!112337 (=> res!616137 e!512333)))

(declare-fun lt!410851 () Bool)

(assert (=> d!112337 (= res!616137 (not lt!410851))))

(declare-fun lt!410852 () Bool)

(assert (=> d!112337 (= lt!410851 lt!410852)))

(declare-fun lt!410850 () Unit!30918)

(declare-fun e!512334 () Unit!30918)

(assert (=> d!112337 (= lt!410850 e!512334)))

(declare-fun c!95832 () Bool)

(assert (=> d!112337 (= c!95832 lt!410852)))

(declare-fun containsKey!442 (List!18332 (_ BitVec 64)) Bool)

(assert (=> d!112337 (= lt!410852 (containsKey!442 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(assert (=> d!112337 (= (contains!4683 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) k0!1033) lt!410851)))

(declare-fun b!913399 () Bool)

(declare-fun lt!410849 () Unit!30918)

(assert (=> b!913399 (= e!512334 lt!410849)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!338 (List!18332 (_ BitVec 64)) Unit!30918)

(assert (=> b!913399 (= lt!410849 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!481 0))(
  ( (Some!480 (v!12139 V!30497)) (None!479) )
))
(declare-fun isDefined!347 (Option!481) Bool)

(declare-fun getValueByKey!475 (List!18332 (_ BitVec 64)) Option!481)

(assert (=> b!913399 (isDefined!347 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun b!913400 () Bool)

(declare-fun Unit!30922 () Unit!30918)

(assert (=> b!913400 (= e!512334 Unit!30922)))

(declare-fun b!913401 () Bool)

(assert (=> b!913401 (= e!512333 (isDefined!347 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112337 c!95832) b!913399))

(assert (= (and d!112337 (not c!95832)) b!913400))

(assert (= (and d!112337 (not res!616137)) b!913401))

(declare-fun m!847715 () Bool)

(assert (=> d!112337 m!847715))

(declare-fun m!847717 () Bool)

(assert (=> b!913399 m!847717))

(declare-fun m!847719 () Bool)

(assert (=> b!913399 m!847719))

(assert (=> b!913399 m!847719))

(declare-fun m!847721 () Bool)

(assert (=> b!913399 m!847721))

(assert (=> b!913401 m!847719))

(assert (=> b!913401 m!847719))

(assert (=> b!913401 m!847721))

(assert (=> b!913349 d!112337))

(declare-fun b!913444 () Bool)

(declare-fun e!512362 () ListLongMap!11241)

(declare-fun call!40440 () ListLongMap!11241)

(assert (=> b!913444 (= e!512362 call!40440)))

(declare-fun bm!40434 () Bool)

(declare-fun call!40441 () ListLongMap!11241)

(declare-fun call!40436 () ListLongMap!11241)

(assert (=> bm!40434 (= call!40441 call!40436)))

(declare-fun b!913445 () Bool)

(declare-fun e!512361 () Bool)

(declare-fun call!40442 () Bool)

(assert (=> b!913445 (= e!512361 (not call!40442))))

(declare-fun b!913446 () Bool)

(declare-fun e!512373 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!913446 (= e!512373 (validKeyInArray!0 (select (arr!26099 _keys!1386) i!717)))))

(declare-fun b!913447 () Bool)

(declare-fun e!512363 () Bool)

(declare-fun e!512366 () Bool)

(assert (=> b!913447 (= e!512363 e!512366)))

(declare-fun res!616159 () Bool)

(declare-fun call!40438 () Bool)

(assert (=> b!913447 (= res!616159 call!40438)))

(assert (=> b!913447 (=> (not res!616159) (not e!512366))))

(declare-fun b!913448 () Bool)

(declare-fun c!95849 () Bool)

(assert (=> b!913448 (= c!95849 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!512369 () ListLongMap!11241)

(assert (=> b!913448 (= e!512362 e!512369)))

(declare-fun b!913449 () Bool)

(assert (=> b!913449 (= e!512369 call!40441)))

(declare-fun b!913450 () Bool)

(declare-fun e!512371 () ListLongMap!11241)

(declare-fun call!40437 () ListLongMap!11241)

(declare-fun +!2608 (ListLongMap!11241 tuple2!12544) ListLongMap!11241)

(assert (=> b!913450 (= e!512371 (+!2608 call!40437 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun bm!40435 () Bool)

(declare-fun lt!410899 () ListLongMap!11241)

(assert (=> bm!40435 (= call!40442 (contains!4683 lt!410899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913451 () Bool)

(declare-fun e!512370 () Bool)

(assert (=> b!913451 (= e!512370 e!512363)))

(declare-fun c!95850 () Bool)

(assert (=> b!913451 (= c!95850 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913452 () Bool)

(assert (=> b!913452 (= e!512369 call!40440)))

(declare-fun b!913453 () Bool)

(declare-fun e!512365 () Bool)

(assert (=> b!913453 (= e!512361 e!512365)))

(declare-fun res!616157 () Bool)

(assert (=> b!913453 (= res!616157 call!40442)))

(assert (=> b!913453 (=> (not res!616157) (not e!512365))))

(declare-fun b!913454 () Bool)

(declare-fun apply!516 (ListLongMap!11241 (_ BitVec 64)) V!30497)

(assert (=> b!913454 (= e!512365 (= (apply!516 lt!410899 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun bm!40433 () Bool)

(declare-fun call!40439 () ListLongMap!11241)

(assert (=> bm!40433 (= call!40436 call!40439)))

(declare-fun d!112339 () Bool)

(assert (=> d!112339 e!512370))

(declare-fun res!616156 () Bool)

(assert (=> d!112339 (=> (not res!616156) (not e!512370))))

(assert (=> d!112339 (= res!616156 (or (bvsge i!717 (size!26558 _keys!1386)) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26558 _keys!1386)))))))

(declare-fun lt!410909 () ListLongMap!11241)

(assert (=> d!112339 (= lt!410899 lt!410909)))

(declare-fun lt!410913 () Unit!30918)

(declare-fun e!512372 () Unit!30918)

(assert (=> d!112339 (= lt!410913 e!512372)))

(declare-fun c!95845 () Bool)

(assert (=> d!112339 (= c!95845 e!512373)))

(declare-fun res!616163 () Bool)

(assert (=> d!112339 (=> (not res!616163) (not e!512373))))

(assert (=> d!112339 (= res!616163 (bvslt i!717 (size!26558 _keys!1386)))))

(assert (=> d!112339 (= lt!410909 e!512371)))

(declare-fun c!95846 () Bool)

(assert (=> d!112339 (= c!95846 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112339 (validMask!0 mask!1756)))

(assert (=> d!112339 (= (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!410899)))

(declare-fun bm!40436 () Bool)

(assert (=> bm!40436 (= call!40438 (contains!4683 lt!410899 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913455 () Bool)

(declare-fun res!616164 () Bool)

(assert (=> b!913455 (=> (not res!616164) (not e!512370))))

(assert (=> b!913455 (= res!616164 e!512361)))

(declare-fun c!95847 () Bool)

(assert (=> b!913455 (= c!95847 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!512364 () Bool)

(declare-fun b!913456 () Bool)

(declare-fun get!13699 (ValueCell!9093 V!30497) V!30497)

(declare-fun dynLambda!1392 (Int (_ BitVec 64)) V!30497)

(assert (=> b!913456 (= e!512364 (= (apply!516 lt!410899 (select (arr!26099 _keys!1386) i!717)) (get!13699 (select (arr!26098 _values!1152) i!717) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913456 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26557 _values!1152)))))

(assert (=> b!913456 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26558 _keys!1386)))))

(declare-fun b!913457 () Bool)

(declare-fun e!512367 () Bool)

(assert (=> b!913457 (= e!512367 e!512364)))

(declare-fun res!616158 () Bool)

(assert (=> b!913457 (=> (not res!616158) (not e!512364))))

(assert (=> b!913457 (= res!616158 (contains!4683 lt!410899 (select (arr!26099 _keys!1386) i!717)))))

(assert (=> b!913457 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26558 _keys!1386)))))

(declare-fun b!913458 () Bool)

(assert (=> b!913458 (= e!512371 e!512362)))

(declare-fun c!95848 () Bool)

(assert (=> b!913458 (= c!95848 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40437 () Bool)

(assert (=> bm!40437 (= call!40440 call!40437)))

(declare-fun b!913459 () Bool)

(declare-fun lt!410912 () Unit!30918)

(assert (=> b!913459 (= e!512372 lt!410912)))

(declare-fun lt!410908 () ListLongMap!11241)

(declare-fun getCurrentListMapNoExtraKeys!3295 (array!54292 array!54290 (_ BitVec 32) (_ BitVec 32) V!30497 V!30497 (_ BitVec 32) Int) ListLongMap!11241)

(assert (=> b!913459 (= lt!410908 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410905 () (_ BitVec 64))

(assert (=> b!913459 (= lt!410905 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410898 () (_ BitVec 64))

(assert (=> b!913459 (= lt!410898 (select (arr!26099 _keys!1386) i!717))))

(declare-fun lt!410910 () Unit!30918)

(declare-fun addStillContains!349 (ListLongMap!11241 (_ BitVec 64) V!30497 (_ BitVec 64)) Unit!30918)

(assert (=> b!913459 (= lt!410910 (addStillContains!349 lt!410908 lt!410905 zeroValue!1094 lt!410898))))

(assert (=> b!913459 (contains!4683 (+!2608 lt!410908 (tuple2!12545 lt!410905 zeroValue!1094)) lt!410898)))

(declare-fun lt!410900 () Unit!30918)

(assert (=> b!913459 (= lt!410900 lt!410910)))

(declare-fun lt!410904 () ListLongMap!11241)

(assert (=> b!913459 (= lt!410904 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410918 () (_ BitVec 64))

(assert (=> b!913459 (= lt!410918 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410906 () (_ BitVec 64))

(assert (=> b!913459 (= lt!410906 (select (arr!26099 _keys!1386) i!717))))

(declare-fun lt!410903 () Unit!30918)

(declare-fun addApplyDifferent!349 (ListLongMap!11241 (_ BitVec 64) V!30497 (_ BitVec 64)) Unit!30918)

(assert (=> b!913459 (= lt!410903 (addApplyDifferent!349 lt!410904 lt!410918 minValue!1094 lt!410906))))

(assert (=> b!913459 (= (apply!516 (+!2608 lt!410904 (tuple2!12545 lt!410918 minValue!1094)) lt!410906) (apply!516 lt!410904 lt!410906))))

(declare-fun lt!410907 () Unit!30918)

(assert (=> b!913459 (= lt!410907 lt!410903)))

(declare-fun lt!410914 () ListLongMap!11241)

(assert (=> b!913459 (= lt!410914 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410916 () (_ BitVec 64))

(assert (=> b!913459 (= lt!410916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410901 () (_ BitVec 64))

(assert (=> b!913459 (= lt!410901 (select (arr!26099 _keys!1386) i!717))))

(declare-fun lt!410917 () Unit!30918)

(assert (=> b!913459 (= lt!410917 (addApplyDifferent!349 lt!410914 lt!410916 zeroValue!1094 lt!410901))))

(assert (=> b!913459 (= (apply!516 (+!2608 lt!410914 (tuple2!12545 lt!410916 zeroValue!1094)) lt!410901) (apply!516 lt!410914 lt!410901))))

(declare-fun lt!410911 () Unit!30918)

(assert (=> b!913459 (= lt!410911 lt!410917)))

(declare-fun lt!410902 () ListLongMap!11241)

(assert (=> b!913459 (= lt!410902 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun lt!410915 () (_ BitVec 64))

(assert (=> b!913459 (= lt!410915 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410897 () (_ BitVec 64))

(assert (=> b!913459 (= lt!410897 (select (arr!26099 _keys!1386) i!717))))

(assert (=> b!913459 (= lt!410912 (addApplyDifferent!349 lt!410902 lt!410915 minValue!1094 lt!410897))))

(assert (=> b!913459 (= (apply!516 (+!2608 lt!410902 (tuple2!12545 lt!410915 minValue!1094)) lt!410897) (apply!516 lt!410902 lt!410897))))

(declare-fun b!913460 () Bool)

(declare-fun Unit!30923 () Unit!30918)

(assert (=> b!913460 (= e!512372 Unit!30923)))

(declare-fun bm!40438 () Bool)

(assert (=> bm!40438 (= call!40437 (+!2608 (ite c!95846 call!40439 (ite c!95848 call!40436 call!40441)) (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913461 () Bool)

(declare-fun res!616160 () Bool)

(assert (=> b!913461 (=> (not res!616160) (not e!512370))))

(assert (=> b!913461 (= res!616160 e!512367)))

(declare-fun res!616162 () Bool)

(assert (=> b!913461 (=> res!616162 e!512367)))

(declare-fun e!512368 () Bool)

(assert (=> b!913461 (= res!616162 (not e!512368))))

(declare-fun res!616161 () Bool)

(assert (=> b!913461 (=> (not res!616161) (not e!512368))))

(assert (=> b!913461 (= res!616161 (bvslt i!717 (size!26558 _keys!1386)))))

(declare-fun b!913462 () Bool)

(assert (=> b!913462 (= e!512368 (validKeyInArray!0 (select (arr!26099 _keys!1386) i!717)))))

(declare-fun bm!40439 () Bool)

(assert (=> bm!40439 (= call!40439 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!913463 () Bool)

(assert (=> b!913463 (= e!512363 (not call!40438))))

(declare-fun b!913464 () Bool)

(assert (=> b!913464 (= e!512366 (= (apply!516 lt!410899 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(assert (= (and d!112339 c!95846) b!913450))

(assert (= (and d!112339 (not c!95846)) b!913458))

(assert (= (and b!913458 c!95848) b!913444))

(assert (= (and b!913458 (not c!95848)) b!913448))

(assert (= (and b!913448 c!95849) b!913452))

(assert (= (and b!913448 (not c!95849)) b!913449))

(assert (= (or b!913452 b!913449) bm!40434))

(assert (= (or b!913444 bm!40434) bm!40433))

(assert (= (or b!913444 b!913452) bm!40437))

(assert (= (or b!913450 bm!40433) bm!40439))

(assert (= (or b!913450 bm!40437) bm!40438))

(assert (= (and d!112339 res!616163) b!913446))

(assert (= (and d!112339 c!95845) b!913459))

(assert (= (and d!112339 (not c!95845)) b!913460))

(assert (= (and d!112339 res!616156) b!913461))

(assert (= (and b!913461 res!616161) b!913462))

(assert (= (and b!913461 (not res!616162)) b!913457))

(assert (= (and b!913457 res!616158) b!913456))

(assert (= (and b!913461 res!616160) b!913455))

(assert (= (and b!913455 c!95847) b!913453))

(assert (= (and b!913455 (not c!95847)) b!913445))

(assert (= (and b!913453 res!616157) b!913454))

(assert (= (or b!913453 b!913445) bm!40435))

(assert (= (and b!913455 res!616164) b!913451))

(assert (= (and b!913451 c!95850) b!913447))

(assert (= (and b!913451 (not c!95850)) b!913463))

(assert (= (and b!913447 res!616159) b!913464))

(assert (= (or b!913447 b!913463) bm!40436))

(declare-fun b_lambda!13315 () Bool)

(assert (=> (not b_lambda!13315) (not b!913456)))

(declare-fun t!25928 () Bool)

(declare-fun tb!5443 () Bool)

(assert (=> (and start!78260 (= defaultEntry!1160 defaultEntry!1160) t!25928) tb!5443))

(declare-fun result!10693 () Bool)

(assert (=> tb!5443 (= result!10693 tp_is_empty!19149)))

(assert (=> b!913456 t!25928))

(declare-fun b_and!27313 () Bool)

(assert (= b_and!27309 (and (=> t!25928 result!10693) b_and!27313)))

(declare-fun m!847723 () Bool)

(assert (=> b!913464 m!847723))

(declare-fun m!847725 () Bool)

(assert (=> bm!40435 m!847725))

(declare-fun m!847727 () Bool)

(assert (=> b!913450 m!847727))

(assert (=> d!112339 m!847669))

(declare-fun m!847729 () Bool)

(assert (=> bm!40436 m!847729))

(assert (=> b!913457 m!847679))

(assert (=> b!913457 m!847679))

(declare-fun m!847731 () Bool)

(assert (=> b!913457 m!847731))

(declare-fun m!847733 () Bool)

(assert (=> b!913459 m!847733))

(assert (=> b!913459 m!847679))

(declare-fun m!847735 () Bool)

(assert (=> b!913459 m!847735))

(declare-fun m!847737 () Bool)

(assert (=> b!913459 m!847737))

(declare-fun m!847739 () Bool)

(assert (=> b!913459 m!847739))

(declare-fun m!847741 () Bool)

(assert (=> b!913459 m!847741))

(declare-fun m!847743 () Bool)

(assert (=> b!913459 m!847743))

(declare-fun m!847745 () Bool)

(assert (=> b!913459 m!847745))

(declare-fun m!847747 () Bool)

(assert (=> b!913459 m!847747))

(declare-fun m!847749 () Bool)

(assert (=> b!913459 m!847749))

(assert (=> b!913459 m!847745))

(declare-fun m!847751 () Bool)

(assert (=> b!913459 m!847751))

(declare-fun m!847753 () Bool)

(assert (=> b!913459 m!847753))

(declare-fun m!847755 () Bool)

(assert (=> b!913459 m!847755))

(declare-fun m!847757 () Bool)

(assert (=> b!913459 m!847757))

(assert (=> b!913459 m!847739))

(assert (=> b!913459 m!847735))

(assert (=> b!913459 m!847753))

(declare-fun m!847759 () Bool)

(assert (=> b!913459 m!847759))

(declare-fun m!847761 () Bool)

(assert (=> b!913459 m!847761))

(declare-fun m!847763 () Bool)

(assert (=> b!913459 m!847763))

(declare-fun m!847765 () Bool)

(assert (=> b!913454 m!847765))

(declare-fun m!847767 () Bool)

(assert (=> bm!40438 m!847767))

(assert (=> bm!40439 m!847761))

(assert (=> b!913456 m!847679))

(declare-fun m!847769 () Bool)

(assert (=> b!913456 m!847769))

(assert (=> b!913456 m!847769))

(declare-fun m!847771 () Bool)

(assert (=> b!913456 m!847771))

(declare-fun m!847773 () Bool)

(assert (=> b!913456 m!847773))

(assert (=> b!913456 m!847679))

(declare-fun m!847775 () Bool)

(assert (=> b!913456 m!847775))

(assert (=> b!913456 m!847771))

(assert (=> b!913462 m!847679))

(assert (=> b!913462 m!847679))

(declare-fun m!847777 () Bool)

(assert (=> b!913462 m!847777))

(assert (=> b!913446 m!847679))

(assert (=> b!913446 m!847679))

(assert (=> b!913446 m!847777))

(assert (=> b!913349 d!112339))

(declare-fun d!112341 () Bool)

(declare-fun e!512374 () Bool)

(assert (=> d!112341 e!512374))

(declare-fun res!616165 () Bool)

(assert (=> d!112341 (=> res!616165 e!512374)))

(declare-fun lt!410921 () Bool)

(assert (=> d!112341 (= res!616165 (not lt!410921))))

(declare-fun lt!410922 () Bool)

(assert (=> d!112341 (= lt!410921 lt!410922)))

(declare-fun lt!410920 () Unit!30918)

(declare-fun e!512375 () Unit!30918)

(assert (=> d!112341 (= lt!410920 e!512375)))

(declare-fun c!95851 () Bool)

(assert (=> d!112341 (= c!95851 lt!410922)))

(assert (=> d!112341 (= lt!410922 (containsKey!442 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112341 (= (contains!4683 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410921)))

(declare-fun b!913467 () Bool)

(declare-fun lt!410919 () Unit!30918)

(assert (=> b!913467 (= e!512375 lt!410919)))

(assert (=> b!913467 (= lt!410919 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> b!913467 (isDefined!347 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!913468 () Bool)

(declare-fun Unit!30924 () Unit!30918)

(assert (=> b!913468 (= e!512375 Unit!30924)))

(declare-fun b!913469 () Bool)

(assert (=> b!913469 (= e!512374 (isDefined!347 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112341 c!95851) b!913467))

(assert (= (and d!112341 (not c!95851)) b!913468))

(assert (= (and d!112341 (not res!616165)) b!913469))

(declare-fun m!847779 () Bool)

(assert (=> d!112341 m!847779))

(declare-fun m!847781 () Bool)

(assert (=> b!913467 m!847781))

(declare-fun m!847783 () Bool)

(assert (=> b!913467 m!847783))

(assert (=> b!913467 m!847783))

(declare-fun m!847785 () Bool)

(assert (=> b!913467 m!847785))

(assert (=> b!913469 m!847783))

(assert (=> b!913469 m!847783))

(assert (=> b!913469 m!847785))

(assert (=> b!913354 d!112341))

(declare-fun b!913470 () Bool)

(declare-fun e!512377 () ListLongMap!11241)

(declare-fun call!40447 () ListLongMap!11241)

(assert (=> b!913470 (= e!512377 call!40447)))

(declare-fun bm!40441 () Bool)

(declare-fun call!40448 () ListLongMap!11241)

(declare-fun call!40443 () ListLongMap!11241)

(assert (=> bm!40441 (= call!40448 call!40443)))

(declare-fun b!913471 () Bool)

(declare-fun e!512376 () Bool)

(declare-fun call!40449 () Bool)

(assert (=> b!913471 (= e!512376 (not call!40449))))

(declare-fun b!913472 () Bool)

(declare-fun e!512388 () Bool)

(assert (=> b!913472 (= e!512388 (validKeyInArray!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913473 () Bool)

(declare-fun e!512378 () Bool)

(declare-fun e!512381 () Bool)

(assert (=> b!913473 (= e!512378 e!512381)))

(declare-fun res!616169 () Bool)

(declare-fun call!40445 () Bool)

(assert (=> b!913473 (= res!616169 call!40445)))

(assert (=> b!913473 (=> (not res!616169) (not e!512381))))

(declare-fun b!913474 () Bool)

(declare-fun c!95856 () Bool)

(assert (=> b!913474 (= c!95856 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!512384 () ListLongMap!11241)

(assert (=> b!913474 (= e!512377 e!512384)))

(declare-fun b!913475 () Bool)

(assert (=> b!913475 (= e!512384 call!40448)))

(declare-fun b!913476 () Bool)

(declare-fun e!512386 () ListLongMap!11241)

(declare-fun call!40444 () ListLongMap!11241)

(assert (=> b!913476 (= e!512386 (+!2608 call!40444 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun bm!40442 () Bool)

(declare-fun lt!410925 () ListLongMap!11241)

(assert (=> bm!40442 (= call!40449 (contains!4683 lt!410925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913477 () Bool)

(declare-fun e!512385 () Bool)

(assert (=> b!913477 (= e!512385 e!512378)))

(declare-fun c!95857 () Bool)

(assert (=> b!913477 (= c!95857 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!913478 () Bool)

(assert (=> b!913478 (= e!512384 call!40447)))

(declare-fun b!913479 () Bool)

(declare-fun e!512380 () Bool)

(assert (=> b!913479 (= e!512376 e!512380)))

(declare-fun res!616167 () Bool)

(assert (=> b!913479 (= res!616167 call!40449)))

(assert (=> b!913479 (=> (not res!616167) (not e!512380))))

(declare-fun b!913480 () Bool)

(assert (=> b!913480 (= e!512380 (= (apply!516 lt!410925 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun bm!40440 () Bool)

(declare-fun call!40446 () ListLongMap!11241)

(assert (=> bm!40440 (= call!40443 call!40446)))

(declare-fun d!112343 () Bool)

(assert (=> d!112343 e!512385))

(declare-fun res!616166 () Bool)

(assert (=> d!112343 (=> (not res!616166) (not e!512385))))

(assert (=> d!112343 (= res!616166 (or (bvsge #b00000000000000000000000000000000 (size!26558 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))))

(declare-fun lt!410935 () ListLongMap!11241)

(assert (=> d!112343 (= lt!410925 lt!410935)))

(declare-fun lt!410939 () Unit!30918)

(declare-fun e!512387 () Unit!30918)

(assert (=> d!112343 (= lt!410939 e!512387)))

(declare-fun c!95852 () Bool)

(assert (=> d!112343 (= c!95852 e!512388)))

(declare-fun res!616173 () Bool)

(assert (=> d!112343 (=> (not res!616173) (not e!512388))))

(assert (=> d!112343 (= res!616173 (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(assert (=> d!112343 (= lt!410935 e!512386)))

(declare-fun c!95853 () Bool)

(assert (=> d!112343 (= c!95853 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112343 (validMask!0 mask!1756)))

(assert (=> d!112343 (= (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410925)))

(declare-fun bm!40443 () Bool)

(assert (=> bm!40443 (= call!40445 (contains!4683 lt!410925 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913481 () Bool)

(declare-fun res!616174 () Bool)

(assert (=> b!913481 (=> (not res!616174) (not e!512385))))

(assert (=> b!913481 (= res!616174 e!512376)))

(declare-fun c!95854 () Bool)

(assert (=> b!913481 (= c!95854 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!512379 () Bool)

(declare-fun b!913482 () Bool)

(assert (=> b!913482 (= e!512379 (= (apply!516 lt!410925 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)) (get!13699 (select (arr!26098 _values!1152) #b00000000000000000000000000000000) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26557 _values!1152)))))

(assert (=> b!913482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(declare-fun b!913483 () Bool)

(declare-fun e!512382 () Bool)

(assert (=> b!913483 (= e!512382 e!512379)))

(declare-fun res!616168 () Bool)

(assert (=> b!913483 (=> (not res!616168) (not e!512379))))

(assert (=> b!913483 (= res!616168 (contains!4683 lt!410925 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913483 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(declare-fun b!913484 () Bool)

(assert (=> b!913484 (= e!512386 e!512377)))

(declare-fun c!95855 () Bool)

(assert (=> b!913484 (= c!95855 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40444 () Bool)

(assert (=> bm!40444 (= call!40447 call!40444)))

(declare-fun b!913485 () Bool)

(declare-fun lt!410938 () Unit!30918)

(assert (=> b!913485 (= e!512387 lt!410938)))

(declare-fun lt!410934 () ListLongMap!11241)

(assert (=> b!913485 (= lt!410934 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410931 () (_ BitVec 64))

(assert (=> b!913485 (= lt!410931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410924 () (_ BitVec 64))

(assert (=> b!913485 (= lt!410924 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410936 () Unit!30918)

(assert (=> b!913485 (= lt!410936 (addStillContains!349 lt!410934 lt!410931 zeroValue!1094 lt!410924))))

(assert (=> b!913485 (contains!4683 (+!2608 lt!410934 (tuple2!12545 lt!410931 zeroValue!1094)) lt!410924)))

(declare-fun lt!410926 () Unit!30918)

(assert (=> b!913485 (= lt!410926 lt!410936)))

(declare-fun lt!410930 () ListLongMap!11241)

(assert (=> b!913485 (= lt!410930 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410944 () (_ BitVec 64))

(assert (=> b!913485 (= lt!410944 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410932 () (_ BitVec 64))

(assert (=> b!913485 (= lt!410932 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410929 () Unit!30918)

(assert (=> b!913485 (= lt!410929 (addApplyDifferent!349 lt!410930 lt!410944 minValue!1094 lt!410932))))

(assert (=> b!913485 (= (apply!516 (+!2608 lt!410930 (tuple2!12545 lt!410944 minValue!1094)) lt!410932) (apply!516 lt!410930 lt!410932))))

(declare-fun lt!410933 () Unit!30918)

(assert (=> b!913485 (= lt!410933 lt!410929)))

(declare-fun lt!410940 () ListLongMap!11241)

(assert (=> b!913485 (= lt!410940 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410942 () (_ BitVec 64))

(assert (=> b!913485 (= lt!410942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410927 () (_ BitVec 64))

(assert (=> b!913485 (= lt!410927 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410943 () Unit!30918)

(assert (=> b!913485 (= lt!410943 (addApplyDifferent!349 lt!410940 lt!410942 zeroValue!1094 lt!410927))))

(assert (=> b!913485 (= (apply!516 (+!2608 lt!410940 (tuple2!12545 lt!410942 zeroValue!1094)) lt!410927) (apply!516 lt!410940 lt!410927))))

(declare-fun lt!410937 () Unit!30918)

(assert (=> b!913485 (= lt!410937 lt!410943)))

(declare-fun lt!410928 () ListLongMap!11241)

(assert (=> b!913485 (= lt!410928 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410941 () (_ BitVec 64))

(assert (=> b!913485 (= lt!410941 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410923 () (_ BitVec 64))

(assert (=> b!913485 (= lt!410923 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913485 (= lt!410938 (addApplyDifferent!349 lt!410928 lt!410941 minValue!1094 lt!410923))))

(assert (=> b!913485 (= (apply!516 (+!2608 lt!410928 (tuple2!12545 lt!410941 minValue!1094)) lt!410923) (apply!516 lt!410928 lt!410923))))

(declare-fun b!913486 () Bool)

(declare-fun Unit!30925 () Unit!30918)

(assert (=> b!913486 (= e!512387 Unit!30925)))

(declare-fun bm!40445 () Bool)

(assert (=> bm!40445 (= call!40444 (+!2608 (ite c!95853 call!40446 (ite c!95855 call!40443 call!40448)) (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!913487 () Bool)

(declare-fun res!616170 () Bool)

(assert (=> b!913487 (=> (not res!616170) (not e!512385))))

(assert (=> b!913487 (= res!616170 e!512382)))

(declare-fun res!616172 () Bool)

(assert (=> b!913487 (=> res!616172 e!512382)))

(declare-fun e!512383 () Bool)

(assert (=> b!913487 (= res!616172 (not e!512383))))

(declare-fun res!616171 () Bool)

(assert (=> b!913487 (=> (not res!616171) (not e!512383))))

(assert (=> b!913487 (= res!616171 (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(declare-fun b!913488 () Bool)

(assert (=> b!913488 (= e!512383 (validKeyInArray!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40446 () Bool)

(assert (=> bm!40446 (= call!40446 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!913489 () Bool)

(assert (=> b!913489 (= e!512378 (not call!40445))))

(declare-fun b!913490 () Bool)

(assert (=> b!913490 (= e!512381 (= (apply!516 lt!410925 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(assert (= (and d!112343 c!95853) b!913476))

(assert (= (and d!112343 (not c!95853)) b!913484))

(assert (= (and b!913484 c!95855) b!913470))

(assert (= (and b!913484 (not c!95855)) b!913474))

(assert (= (and b!913474 c!95856) b!913478))

(assert (= (and b!913474 (not c!95856)) b!913475))

(assert (= (or b!913478 b!913475) bm!40441))

(assert (= (or b!913470 bm!40441) bm!40440))

(assert (= (or b!913470 b!913478) bm!40444))

(assert (= (or b!913476 bm!40440) bm!40446))

(assert (= (or b!913476 bm!40444) bm!40445))

(assert (= (and d!112343 res!616173) b!913472))

(assert (= (and d!112343 c!95852) b!913485))

(assert (= (and d!112343 (not c!95852)) b!913486))

(assert (= (and d!112343 res!616166) b!913487))

(assert (= (and b!913487 res!616171) b!913488))

(assert (= (and b!913487 (not res!616172)) b!913483))

(assert (= (and b!913483 res!616168) b!913482))

(assert (= (and b!913487 res!616170) b!913481))

(assert (= (and b!913481 c!95854) b!913479))

(assert (= (and b!913481 (not c!95854)) b!913471))

(assert (= (and b!913479 res!616167) b!913480))

(assert (= (or b!913479 b!913471) bm!40442))

(assert (= (and b!913481 res!616174) b!913477))

(assert (= (and b!913477 c!95857) b!913473))

(assert (= (and b!913477 (not c!95857)) b!913489))

(assert (= (and b!913473 res!616169) b!913490))

(assert (= (or b!913473 b!913489) bm!40443))

(declare-fun b_lambda!13317 () Bool)

(assert (=> (not b_lambda!13317) (not b!913482)))

(assert (=> b!913482 t!25928))

(declare-fun b_and!27315 () Bool)

(assert (= b_and!27313 (and (=> t!25928 result!10693) b_and!27315)))

(declare-fun m!847787 () Bool)

(assert (=> b!913490 m!847787))

(declare-fun m!847789 () Bool)

(assert (=> bm!40442 m!847789))

(declare-fun m!847791 () Bool)

(assert (=> b!913476 m!847791))

(assert (=> d!112343 m!847669))

(declare-fun m!847793 () Bool)

(assert (=> bm!40443 m!847793))

(declare-fun m!847795 () Bool)

(assert (=> b!913483 m!847795))

(assert (=> b!913483 m!847795))

(declare-fun m!847797 () Bool)

(assert (=> b!913483 m!847797))

(declare-fun m!847799 () Bool)

(assert (=> b!913485 m!847799))

(assert (=> b!913485 m!847795))

(declare-fun m!847801 () Bool)

(assert (=> b!913485 m!847801))

(declare-fun m!847803 () Bool)

(assert (=> b!913485 m!847803))

(declare-fun m!847805 () Bool)

(assert (=> b!913485 m!847805))

(declare-fun m!847807 () Bool)

(assert (=> b!913485 m!847807))

(declare-fun m!847809 () Bool)

(assert (=> b!913485 m!847809))

(declare-fun m!847811 () Bool)

(assert (=> b!913485 m!847811))

(declare-fun m!847813 () Bool)

(assert (=> b!913485 m!847813))

(declare-fun m!847815 () Bool)

(assert (=> b!913485 m!847815))

(assert (=> b!913485 m!847811))

(declare-fun m!847817 () Bool)

(assert (=> b!913485 m!847817))

(declare-fun m!847819 () Bool)

(assert (=> b!913485 m!847819))

(declare-fun m!847821 () Bool)

(assert (=> b!913485 m!847821))

(declare-fun m!847823 () Bool)

(assert (=> b!913485 m!847823))

(assert (=> b!913485 m!847805))

(assert (=> b!913485 m!847801))

(assert (=> b!913485 m!847819))

(declare-fun m!847825 () Bool)

(assert (=> b!913485 m!847825))

(declare-fun m!847827 () Bool)

(assert (=> b!913485 m!847827))

(declare-fun m!847829 () Bool)

(assert (=> b!913485 m!847829))

(declare-fun m!847831 () Bool)

(assert (=> b!913480 m!847831))

(declare-fun m!847833 () Bool)

(assert (=> bm!40445 m!847833))

(assert (=> bm!40446 m!847827))

(assert (=> b!913482 m!847795))

(declare-fun m!847835 () Bool)

(assert (=> b!913482 m!847835))

(assert (=> b!913482 m!847835))

(assert (=> b!913482 m!847771))

(declare-fun m!847837 () Bool)

(assert (=> b!913482 m!847837))

(assert (=> b!913482 m!847795))

(declare-fun m!847839 () Bool)

(assert (=> b!913482 m!847839))

(assert (=> b!913482 m!847771))

(assert (=> b!913488 m!847795))

(assert (=> b!913488 m!847795))

(declare-fun m!847841 () Bool)

(assert (=> b!913488 m!847841))

(assert (=> b!913472 m!847795))

(assert (=> b!913472 m!847795))

(assert (=> b!913472 m!847841))

(assert (=> b!913354 d!112343))

(declare-fun d!112345 () Bool)

(assert (=> d!112345 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78260 d!112345))

(declare-fun d!112347 () Bool)

(assert (=> d!112347 (= (array_inv!20384 _values!1152) (bvsge (size!26557 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78260 d!112347))

(declare-fun d!112349 () Bool)

(assert (=> d!112349 (= (array_inv!20385 _keys!1386) (bvsge (size!26558 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78260 d!112349))

(declare-fun d!112351 () Bool)

(assert (=> d!112351 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!913357 d!112351))

(declare-fun d!112353 () Bool)

(declare-fun res!616181 () Bool)

(declare-fun e!512399 () Bool)

(assert (=> d!112353 (=> res!616181 e!512399)))

(assert (=> d!112353 (= res!616181 (bvsge #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(assert (=> d!112353 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18330) e!512399)))

(declare-fun b!913501 () Bool)

(declare-fun e!512398 () Bool)

(assert (=> b!913501 (= e!512399 e!512398)))

(declare-fun res!616182 () Bool)

(assert (=> b!913501 (=> (not res!616182) (not e!512398))))

(declare-fun e!512397 () Bool)

(assert (=> b!913501 (= res!616182 (not e!512397))))

(declare-fun res!616183 () Bool)

(assert (=> b!913501 (=> (not res!616183) (not e!512397))))

(assert (=> b!913501 (= res!616183 (validKeyInArray!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913502 () Bool)

(declare-fun e!512400 () Bool)

(assert (=> b!913502 (= e!512398 e!512400)))

(declare-fun c!95860 () Bool)

(assert (=> b!913502 (= c!95860 (validKeyInArray!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913503 () Bool)

(declare-fun call!40452 () Bool)

(assert (=> b!913503 (= e!512400 call!40452)))

(declare-fun b!913504 () Bool)

(declare-fun contains!4685 (List!18333 (_ BitVec 64)) Bool)

(assert (=> b!913504 (= e!512397 (contains!4685 Nil!18330 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913505 () Bool)

(assert (=> b!913505 (= e!512400 call!40452)))

(declare-fun bm!40449 () Bool)

(assert (=> bm!40449 (= call!40452 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95860 (Cons!18329 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) Nil!18330) Nil!18330)))))

(assert (= (and d!112353 (not res!616181)) b!913501))

(assert (= (and b!913501 res!616183) b!913504))

(assert (= (and b!913501 res!616182) b!913502))

(assert (= (and b!913502 c!95860) b!913503))

(assert (= (and b!913502 (not c!95860)) b!913505))

(assert (= (or b!913503 b!913505) bm!40449))

(assert (=> b!913501 m!847795))

(assert (=> b!913501 m!847795))

(assert (=> b!913501 m!847841))

(assert (=> b!913502 m!847795))

(assert (=> b!913502 m!847795))

(assert (=> b!913502 m!847841))

(assert (=> b!913504 m!847795))

(assert (=> b!913504 m!847795))

(declare-fun m!847843 () Bool)

(assert (=> b!913504 m!847843))

(assert (=> bm!40449 m!847795))

(declare-fun m!847845 () Bool)

(assert (=> bm!40449 m!847845))

(assert (=> b!913352 d!112353))

(declare-fun b!913514 () Bool)

(declare-fun e!512408 () Bool)

(declare-fun call!40455 () Bool)

(assert (=> b!913514 (= e!512408 call!40455)))

(declare-fun d!112355 () Bool)

(declare-fun res!616188 () Bool)

(declare-fun e!512409 () Bool)

(assert (=> d!112355 (=> res!616188 e!512409)))

(assert (=> d!112355 (= res!616188 (bvsge #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(assert (=> d!112355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!512409)))

(declare-fun b!913515 () Bool)

(declare-fun e!512407 () Bool)

(assert (=> b!913515 (= e!512407 call!40455)))

(declare-fun b!913516 () Bool)

(assert (=> b!913516 (= e!512407 e!512408)))

(declare-fun lt!410952 () (_ BitVec 64))

(assert (=> b!913516 (= lt!410952 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410953 () Unit!30918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54292 (_ BitVec 64) (_ BitVec 32)) Unit!30918)

(assert (=> b!913516 (= lt!410953 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410952 #b00000000000000000000000000000000))))

(assert (=> b!913516 (arrayContainsKey!0 _keys!1386 lt!410952 #b00000000000000000000000000000000)))

(declare-fun lt!410951 () Unit!30918)

(assert (=> b!913516 (= lt!410951 lt!410953)))

(declare-fun res!616189 () Bool)

(declare-datatypes ((SeekEntryResult!8969 0))(
  ( (MissingZero!8969 (index!38247 (_ BitVec 32))) (Found!8969 (index!38248 (_ BitVec 32))) (Intermediate!8969 (undefined!9781 Bool) (index!38249 (_ BitVec 32)) (x!78138 (_ BitVec 32))) (Undefined!8969) (MissingVacant!8969 (index!38250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54292 (_ BitVec 32)) SeekEntryResult!8969)

(assert (=> b!913516 (= res!616189 (= (seekEntryOrOpen!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8969 #b00000000000000000000000000000000)))))

(assert (=> b!913516 (=> (not res!616189) (not e!512408))))

(declare-fun bm!40452 () Bool)

(assert (=> bm!40452 (= call!40455 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!913517 () Bool)

(assert (=> b!913517 (= e!512409 e!512407)))

(declare-fun c!95863 () Bool)

(assert (=> b!913517 (= c!95863 (validKeyInArray!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112355 (not res!616188)) b!913517))

(assert (= (and b!913517 c!95863) b!913516))

(assert (= (and b!913517 (not c!95863)) b!913515))

(assert (= (and b!913516 res!616189) b!913514))

(assert (= (or b!913514 b!913515) bm!40452))

(assert (=> b!913516 m!847795))

(declare-fun m!847847 () Bool)

(assert (=> b!913516 m!847847))

(declare-fun m!847849 () Bool)

(assert (=> b!913516 m!847849))

(assert (=> b!913516 m!847795))

(declare-fun m!847851 () Bool)

(assert (=> b!913516 m!847851))

(declare-fun m!847853 () Bool)

(assert (=> bm!40452 m!847853))

(assert (=> b!913517 m!847795))

(assert (=> b!913517 m!847795))

(assert (=> b!913517 m!847841))

(assert (=> b!913351 d!112355))

(declare-fun d!112357 () Bool)

(declare-fun res!616194 () Bool)

(declare-fun e!512414 () Bool)

(assert (=> d!112357 (=> res!616194 e!512414)))

(assert (=> d!112357 (= res!616194 (= (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112357 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!512414)))

(declare-fun b!913522 () Bool)

(declare-fun e!512415 () Bool)

(assert (=> b!913522 (= e!512414 e!512415)))

(declare-fun res!616195 () Bool)

(assert (=> b!913522 (=> (not res!616195) (not e!512415))))

(assert (=> b!913522 (= res!616195 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26558 _keys!1386)))))

(declare-fun b!913523 () Bool)

(assert (=> b!913523 (= e!512415 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112357 (not res!616194)) b!913522))

(assert (= (and b!913522 res!616195) b!913523))

(assert (=> d!112357 m!847795))

(declare-fun m!847855 () Bool)

(assert (=> b!913523 m!847855))

(assert (=> b!913359 d!112357))

(declare-fun d!112359 () Bool)

(declare-fun e!512418 () Bool)

(assert (=> d!112359 e!512418))

(declare-fun c!95866 () Bool)

(assert (=> d!112359 (= c!95866 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!410956 () Unit!30918)

(declare-fun choose!1531 (array!54292 array!54290 (_ BitVec 32) (_ BitVec 32) V!30497 V!30497 (_ BitVec 64) Int) Unit!30918)

(assert (=> d!112359 (= lt!410956 (choose!1531 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112359 (validMask!0 mask!1756)))

(assert (=> d!112359 (= (lemmaKeyInListMapIsInArray!283 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!410956)))

(declare-fun b!913528 () Bool)

(assert (=> b!913528 (= e!512418 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913529 () Bool)

(assert (=> b!913529 (= e!512418 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112359 c!95866) b!913528))

(assert (= (and d!112359 (not c!95866)) b!913529))

(declare-fun m!847857 () Bool)

(assert (=> d!112359 m!847857))

(assert (=> d!112359 m!847669))

(assert (=> b!913528 m!847675))

(assert (=> b!913359 d!112359))

(declare-fun b!913537 () Bool)

(declare-fun e!512424 () Bool)

(assert (=> b!913537 (= e!512424 tp_is_empty!19149)))

(declare-fun condMapEmpty!30460 () Bool)

(declare-fun mapDefault!30460 () ValueCell!9093)

(assert (=> mapNonEmpty!30454 (= condMapEmpty!30460 (= mapRest!30454 ((as const (Array (_ BitVec 32) ValueCell!9093)) mapDefault!30460)))))

(declare-fun mapRes!30460 () Bool)

(assert (=> mapNonEmpty!30454 (= tp!58472 (and e!512424 mapRes!30460))))

(declare-fun b!913536 () Bool)

(declare-fun e!512423 () Bool)

(assert (=> b!913536 (= e!512423 tp_is_empty!19149)))

(declare-fun mapNonEmpty!30460 () Bool)

(declare-fun tp!58482 () Bool)

(assert (=> mapNonEmpty!30460 (= mapRes!30460 (and tp!58482 e!512423))))

(declare-fun mapRest!30460 () (Array (_ BitVec 32) ValueCell!9093))

(declare-fun mapKey!30460 () (_ BitVec 32))

(declare-fun mapValue!30460 () ValueCell!9093)

(assert (=> mapNonEmpty!30460 (= mapRest!30454 (store mapRest!30460 mapKey!30460 mapValue!30460))))

(declare-fun mapIsEmpty!30460 () Bool)

(assert (=> mapIsEmpty!30460 mapRes!30460))

(assert (= (and mapNonEmpty!30454 condMapEmpty!30460) mapIsEmpty!30460))

(assert (= (and mapNonEmpty!30454 (not condMapEmpty!30460)) mapNonEmpty!30460))

(assert (= (and mapNonEmpty!30460 ((_ is ValueCellFull!9093) mapValue!30460)) b!913536))

(assert (= (and mapNonEmpty!30454 ((_ is ValueCellFull!9093) mapDefault!30460)) b!913537))

(declare-fun m!847859 () Bool)

(assert (=> mapNonEmpty!30460 m!847859))

(declare-fun b_lambda!13319 () Bool)

(assert (= b_lambda!13315 (or (and start!78260 b_free!16731) b_lambda!13319)))

(declare-fun b_lambda!13321 () Bool)

(assert (= b_lambda!13317 (or (and start!78260 b_free!16731) b_lambda!13321)))

(check-sat (not b!913459) (not b!913523) (not bm!40442) (not d!112341) (not bm!40439) (not b!913472) (not b!913485) (not b!913454) (not bm!40446) (not b!913501) (not b!913504) (not b!913490) (not b!913399) (not b!913528) (not d!112343) (not b!913516) (not b_next!16731) (not bm!40443) (not bm!40452) (not b!913480) (not b_lambda!13319) (not b!913483) (not bm!40436) (not b!913456) (not b!913446) (not b!913476) (not b!913401) (not b!913482) (not mapNonEmpty!30460) (not d!112337) (not bm!40438) (not b!913464) (not d!112339) (not bm!40449) (not b!913517) (not bm!40435) (not d!112359) tp_is_empty!19149 (not b!913450) (not b!913462) (not b!913467) (not b!913502) (not bm!40445) (not b!913488) (not b!913469) b_and!27315 (not b_lambda!13321) (not b!913457))
(check-sat b_and!27315 (not b_next!16731))
(get-model)

(declare-fun d!112361 () Bool)

(assert (=> d!112361 (= (validKeyInArray!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)) (and (not (= (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913502 d!112361))

(declare-fun d!112363 () Bool)

(declare-fun get!13700 (Option!481) V!30497)

(assert (=> d!112363 (= (apply!516 lt!410899 (select (arr!26099 _keys!1386) i!717)) (get!13700 (getValueByKey!475 (toList!5636 lt!410899) (select (arr!26099 _keys!1386) i!717))))))

(declare-fun bs!25685 () Bool)

(assert (= bs!25685 d!112363))

(assert (=> bs!25685 m!847679))

(declare-fun m!847861 () Bool)

(assert (=> bs!25685 m!847861))

(assert (=> bs!25685 m!847861))

(declare-fun m!847863 () Bool)

(assert (=> bs!25685 m!847863))

(assert (=> b!913456 d!112363))

(declare-fun d!112365 () Bool)

(declare-fun c!95869 () Bool)

(assert (=> d!112365 (= c!95869 ((_ is ValueCellFull!9093) (select (arr!26098 _values!1152) i!717)))))

(declare-fun e!512427 () V!30497)

(assert (=> d!112365 (= (get!13699 (select (arr!26098 _values!1152) i!717) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!512427)))

(declare-fun b!913542 () Bool)

(declare-fun get!13701 (ValueCell!9093 V!30497) V!30497)

(assert (=> b!913542 (= e!512427 (get!13701 (select (arr!26098 _values!1152) i!717) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913543 () Bool)

(declare-fun get!13702 (ValueCell!9093 V!30497) V!30497)

(assert (=> b!913543 (= e!512427 (get!13702 (select (arr!26098 _values!1152) i!717) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112365 c!95869) b!913542))

(assert (= (and d!112365 (not c!95869)) b!913543))

(assert (=> b!913542 m!847769))

(assert (=> b!913542 m!847771))

(declare-fun m!847865 () Bool)

(assert (=> b!913542 m!847865))

(assert (=> b!913543 m!847769))

(assert (=> b!913543 m!847771))

(declare-fun m!847867 () Bool)

(assert (=> b!913543 m!847867))

(assert (=> b!913456 d!112365))

(declare-fun d!112367 () Bool)

(declare-fun res!616200 () Bool)

(declare-fun e!512432 () Bool)

(assert (=> d!112367 (=> res!616200 e!512432)))

(assert (=> d!112367 (= res!616200 (and ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112367 (= (containsKey!442 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!512432)))

(declare-fun b!913548 () Bool)

(declare-fun e!512433 () Bool)

(assert (=> b!913548 (= e!512432 e!512433)))

(declare-fun res!616201 () Bool)

(assert (=> b!913548 (=> (not res!616201) (not e!512433))))

(assert (=> b!913548 (= res!616201 (and (or (not ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) (bvsle (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (bvslt (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!913549 () Bool)

(assert (=> b!913549 (= e!512433 (containsKey!442 (t!25923 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112367 (not res!616200)) b!913548))

(assert (= (and b!913548 res!616201) b!913549))

(declare-fun m!847869 () Bool)

(assert (=> b!913549 m!847869))

(assert (=> d!112341 d!112367))

(assert (=> d!112343 d!112345))

(assert (=> b!913501 d!112361))

(declare-fun d!112369 () Bool)

(assert (=> d!112369 (= (apply!516 lt!410925 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13700 (getValueByKey!475 (toList!5636 lt!410925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25686 () Bool)

(assert (= bs!25686 d!112369))

(declare-fun m!847871 () Bool)

(assert (=> bs!25686 m!847871))

(assert (=> bs!25686 m!847871))

(declare-fun m!847873 () Bool)

(assert (=> bs!25686 m!847873))

(assert (=> b!913490 d!112369))

(declare-fun d!112371 () Bool)

(declare-fun res!616202 () Bool)

(declare-fun e!512434 () Bool)

(assert (=> d!112371 (=> res!616202 e!512434)))

(assert (=> d!112371 (= res!616202 (and ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (= (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112371 (= (containsKey!442 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) e!512434)))

(declare-fun b!913550 () Bool)

(declare-fun e!512435 () Bool)

(assert (=> b!913550 (= e!512434 e!512435)))

(declare-fun res!616203 () Bool)

(assert (=> b!913550 (=> (not res!616203) (not e!512435))))

(assert (=> b!913550 (= res!616203 (and (or (not ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) (bvsle (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)) ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (bvslt (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(declare-fun b!913551 () Bool)

(assert (=> b!913551 (= e!512435 (containsKey!442 (t!25923 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112371 (not res!616202)) b!913550))

(assert (= (and b!913550 res!616203) b!913551))

(declare-fun m!847875 () Bool)

(assert (=> b!913551 m!847875))

(assert (=> d!112337 d!112371))

(assert (=> b!913472 d!112361))

(declare-fun bm!40455 () Bool)

(declare-fun call!40458 () ListLongMap!11241)

(assert (=> bm!40455 (= call!40458 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!913576 () Bool)

(declare-fun e!512454 () ListLongMap!11241)

(assert (=> b!913576 (= e!512454 (ListLongMap!11242 Nil!18329))))

(declare-fun b!913577 () Bool)

(declare-fun e!512451 () Bool)

(declare-fun e!512455 () Bool)

(assert (=> b!913577 (= e!512451 e!512455)))

(declare-fun c!95881 () Bool)

(assert (=> b!913577 (= c!95881 (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(declare-fun b!913578 () Bool)

(declare-fun e!512450 () Bool)

(assert (=> b!913578 (= e!512451 e!512450)))

(assert (=> b!913578 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(declare-fun res!616214 () Bool)

(declare-fun lt!410975 () ListLongMap!11241)

(assert (=> b!913578 (= res!616214 (contains!4683 lt!410975 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913578 (=> (not res!616214) (not e!512450))))

(declare-fun b!913579 () Bool)

(declare-fun isEmpty!692 (ListLongMap!11241) Bool)

(assert (=> b!913579 (= e!512455 (isEmpty!692 lt!410975))))

(declare-fun b!913580 () Bool)

(declare-fun res!616215 () Bool)

(declare-fun e!512456 () Bool)

(assert (=> b!913580 (=> (not res!616215) (not e!512456))))

(assert (=> b!913580 (= res!616215 (not (contains!4683 lt!410975 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913581 () Bool)

(declare-fun e!512452 () ListLongMap!11241)

(assert (=> b!913581 (= e!512454 e!512452)))

(declare-fun c!95878 () Bool)

(assert (=> b!913581 (= c!95878 (validKeyInArray!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913582 () Bool)

(assert (=> b!913582 (= e!512452 call!40458)))

(declare-fun d!112373 () Bool)

(assert (=> d!112373 e!512456))

(declare-fun res!616212 () Bool)

(assert (=> d!112373 (=> (not res!616212) (not e!512456))))

(assert (=> d!112373 (= res!616212 (not (contains!4683 lt!410975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!112373 (= lt!410975 e!512454)))

(declare-fun c!95879 () Bool)

(assert (=> d!112373 (= c!95879 (bvsge #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(assert (=> d!112373 (validMask!0 mask!1756)))

(assert (=> d!112373 (= (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410975)))

(declare-fun b!913583 () Bool)

(assert (=> b!913583 (= e!512455 (= lt!410975 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!913584 () Bool)

(declare-fun e!512453 () Bool)

(assert (=> b!913584 (= e!512453 (validKeyInArray!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913584 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!913585 () Bool)

(assert (=> b!913585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(assert (=> b!913585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26557 _values!1152)))))

(assert (=> b!913585 (= e!512450 (= (apply!516 lt!410975 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)) (get!13699 (select (arr!26098 _values!1152) #b00000000000000000000000000000000) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913586 () Bool)

(assert (=> b!913586 (= e!512456 e!512451)))

(declare-fun c!95880 () Bool)

(assert (=> b!913586 (= c!95880 e!512453)))

(declare-fun res!616213 () Bool)

(assert (=> b!913586 (=> (not res!616213) (not e!512453))))

(assert (=> b!913586 (= res!616213 (bvslt #b00000000000000000000000000000000 (size!26558 _keys!1386)))))

(declare-fun b!913587 () Bool)

(declare-fun lt!410972 () Unit!30918)

(declare-fun lt!410974 () Unit!30918)

(assert (=> b!913587 (= lt!410972 lt!410974)))

(declare-fun lt!410977 () (_ BitVec 64))

(declare-fun lt!410971 () (_ BitVec 64))

(declare-fun lt!410973 () V!30497)

(declare-fun lt!410976 () ListLongMap!11241)

(assert (=> b!913587 (not (contains!4683 (+!2608 lt!410976 (tuple2!12545 lt!410977 lt!410973)) lt!410971))))

(declare-fun addStillNotContains!218 (ListLongMap!11241 (_ BitVec 64) V!30497 (_ BitVec 64)) Unit!30918)

(assert (=> b!913587 (= lt!410974 (addStillNotContains!218 lt!410976 lt!410977 lt!410973 lt!410971))))

(assert (=> b!913587 (= lt!410971 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!913587 (= lt!410973 (get!13699 (select (arr!26098 _values!1152) #b00000000000000000000000000000000) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!913587 (= lt!410977 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!913587 (= lt!410976 call!40458)))

(assert (=> b!913587 (= e!512452 (+!2608 call!40458 (tuple2!12545 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) (get!13699 (select (arr!26098 _values!1152) #b00000000000000000000000000000000) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!112373 c!95879) b!913576))

(assert (= (and d!112373 (not c!95879)) b!913581))

(assert (= (and b!913581 c!95878) b!913587))

(assert (= (and b!913581 (not c!95878)) b!913582))

(assert (= (or b!913587 b!913582) bm!40455))

(assert (= (and d!112373 res!616212) b!913580))

(assert (= (and b!913580 res!616215) b!913586))

(assert (= (and b!913586 res!616213) b!913584))

(assert (= (and b!913586 c!95880) b!913578))

(assert (= (and b!913586 (not c!95880)) b!913577))

(assert (= (and b!913578 res!616214) b!913585))

(assert (= (and b!913577 c!95881) b!913583))

(assert (= (and b!913577 (not c!95881)) b!913579))

(declare-fun b_lambda!13323 () Bool)

(assert (=> (not b_lambda!13323) (not b!913585)))

(assert (=> b!913585 t!25928))

(declare-fun b_and!27317 () Bool)

(assert (= b_and!27315 (and (=> t!25928 result!10693) b_and!27317)))

(declare-fun b_lambda!13325 () Bool)

(assert (=> (not b_lambda!13325) (not b!913587)))

(assert (=> b!913587 t!25928))

(declare-fun b_and!27319 () Bool)

(assert (= b_and!27317 (and (=> t!25928 result!10693) b_and!27319)))

(assert (=> b!913587 m!847771))

(assert (=> b!913587 m!847795))

(declare-fun m!847877 () Bool)

(assert (=> b!913587 m!847877))

(declare-fun m!847879 () Bool)

(assert (=> b!913587 m!847879))

(assert (=> b!913587 m!847835))

(assert (=> b!913587 m!847771))

(assert (=> b!913587 m!847837))

(declare-fun m!847881 () Bool)

(assert (=> b!913587 m!847881))

(declare-fun m!847883 () Bool)

(assert (=> b!913587 m!847883))

(assert (=> b!913587 m!847881))

(assert (=> b!913587 m!847835))

(declare-fun m!847885 () Bool)

(assert (=> d!112373 m!847885))

(assert (=> d!112373 m!847669))

(declare-fun m!847887 () Bool)

(assert (=> bm!40455 m!847887))

(declare-fun m!847889 () Bool)

(assert (=> b!913580 m!847889))

(assert (=> b!913581 m!847795))

(assert (=> b!913581 m!847795))

(assert (=> b!913581 m!847841))

(declare-fun m!847891 () Bool)

(assert (=> b!913579 m!847891))

(assert (=> b!913583 m!847887))

(assert (=> b!913578 m!847795))

(assert (=> b!913578 m!847795))

(declare-fun m!847893 () Bool)

(assert (=> b!913578 m!847893))

(assert (=> b!913584 m!847795))

(assert (=> b!913584 m!847795))

(assert (=> b!913584 m!847841))

(assert (=> b!913585 m!847771))

(assert (=> b!913585 m!847795))

(assert (=> b!913585 m!847835))

(assert (=> b!913585 m!847771))

(assert (=> b!913585 m!847837))

(assert (=> b!913585 m!847795))

(declare-fun m!847895 () Bool)

(assert (=> b!913585 m!847895))

(assert (=> b!913585 m!847835))

(assert (=> bm!40446 d!112373))

(declare-fun d!112375 () Bool)

(assert (=> d!112375 (= (apply!516 lt!410899 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13700 (getValueByKey!475 (toList!5636 lt!410899) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25687 () Bool)

(assert (= bs!25687 d!112375))

(declare-fun m!847897 () Bool)

(assert (=> bs!25687 m!847897))

(assert (=> bs!25687 m!847897))

(declare-fun m!847899 () Bool)

(assert (=> bs!25687 m!847899))

(assert (=> b!913454 d!112375))

(declare-fun d!112377 () Bool)

(declare-fun e!512457 () Bool)

(assert (=> d!112377 e!512457))

(declare-fun res!616216 () Bool)

(assert (=> d!112377 (=> res!616216 e!512457)))

(declare-fun lt!410980 () Bool)

(assert (=> d!112377 (= res!616216 (not lt!410980))))

(declare-fun lt!410981 () Bool)

(assert (=> d!112377 (= lt!410980 lt!410981)))

(declare-fun lt!410979 () Unit!30918)

(declare-fun e!512458 () Unit!30918)

(assert (=> d!112377 (= lt!410979 e!512458)))

(declare-fun c!95882 () Bool)

(assert (=> d!112377 (= c!95882 lt!410981)))

(assert (=> d!112377 (= lt!410981 (containsKey!442 (toList!5636 lt!410899) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112377 (= (contains!4683 lt!410899 #b1000000000000000000000000000000000000000000000000000000000000000) lt!410980)))

(declare-fun b!913588 () Bool)

(declare-fun lt!410978 () Unit!30918)

(assert (=> b!913588 (= e!512458 lt!410978)))

(assert (=> b!913588 (= lt!410978 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 lt!410899) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913588 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410899) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913589 () Bool)

(declare-fun Unit!30926 () Unit!30918)

(assert (=> b!913589 (= e!512458 Unit!30926)))

(declare-fun b!913590 () Bool)

(assert (=> b!913590 (= e!512457 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410899) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112377 c!95882) b!913588))

(assert (= (and d!112377 (not c!95882)) b!913589))

(assert (= (and d!112377 (not res!616216)) b!913590))

(declare-fun m!847901 () Bool)

(assert (=> d!112377 m!847901))

(declare-fun m!847903 () Bool)

(assert (=> b!913588 m!847903))

(declare-fun m!847905 () Bool)

(assert (=> b!913588 m!847905))

(assert (=> b!913588 m!847905))

(declare-fun m!847907 () Bool)

(assert (=> b!913588 m!847907))

(assert (=> b!913590 m!847905))

(assert (=> b!913590 m!847905))

(assert (=> b!913590 m!847907))

(assert (=> bm!40436 d!112377))

(assert (=> b!913517 d!112361))

(assert (=> b!913488 d!112361))

(declare-fun b!913591 () Bool)

(declare-fun e!512460 () Bool)

(declare-fun call!40459 () Bool)

(assert (=> b!913591 (= e!512460 call!40459)))

(declare-fun d!112379 () Bool)

(declare-fun res!616217 () Bool)

(declare-fun e!512461 () Bool)

(assert (=> d!112379 (=> res!616217 e!512461)))

(assert (=> d!112379 (= res!616217 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26558 _keys!1386)))))

(assert (=> d!112379 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756) e!512461)))

(declare-fun b!913592 () Bool)

(declare-fun e!512459 () Bool)

(assert (=> b!913592 (= e!512459 call!40459)))

(declare-fun b!913593 () Bool)

(assert (=> b!913593 (= e!512459 e!512460)))

(declare-fun lt!410983 () (_ BitVec 64))

(assert (=> b!913593 (= lt!410983 (select (arr!26099 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!410984 () Unit!30918)

(assert (=> b!913593 (= lt!410984 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410983 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!913593 (arrayContainsKey!0 _keys!1386 lt!410983 #b00000000000000000000000000000000)))

(declare-fun lt!410982 () Unit!30918)

(assert (=> b!913593 (= lt!410982 lt!410984)))

(declare-fun res!616218 () Bool)

(assert (=> b!913593 (= res!616218 (= (seekEntryOrOpen!0 (select (arr!26099 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1386 mask!1756) (Found!8969 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!913593 (=> (not res!616218) (not e!512460))))

(declare-fun bm!40456 () Bool)

(assert (=> bm!40456 (= call!40459 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!913594 () Bool)

(assert (=> b!913594 (= e!512461 e!512459)))

(declare-fun c!95883 () Bool)

(assert (=> b!913594 (= c!95883 (validKeyInArray!0 (select (arr!26099 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!112379 (not res!616217)) b!913594))

(assert (= (and b!913594 c!95883) b!913593))

(assert (= (and b!913594 (not c!95883)) b!913592))

(assert (= (and b!913593 res!616218) b!913591))

(assert (= (or b!913591 b!913592) bm!40456))

(declare-fun m!847909 () Bool)

(assert (=> b!913593 m!847909))

(declare-fun m!847911 () Bool)

(assert (=> b!913593 m!847911))

(declare-fun m!847913 () Bool)

(assert (=> b!913593 m!847913))

(assert (=> b!913593 m!847909))

(declare-fun m!847915 () Bool)

(assert (=> b!913593 m!847915))

(declare-fun m!847917 () Bool)

(assert (=> bm!40456 m!847917))

(assert (=> b!913594 m!847909))

(assert (=> b!913594 m!847909))

(declare-fun m!847919 () Bool)

(assert (=> b!913594 m!847919))

(assert (=> bm!40452 d!112379))

(assert (=> b!913528 d!112357))

(declare-fun d!112381 () Bool)

(declare-fun e!512462 () Bool)

(assert (=> d!112381 e!512462))

(declare-fun res!616219 () Bool)

(assert (=> d!112381 (=> res!616219 e!512462)))

(declare-fun lt!410987 () Bool)

(assert (=> d!112381 (= res!616219 (not lt!410987))))

(declare-fun lt!410988 () Bool)

(assert (=> d!112381 (= lt!410987 lt!410988)))

(declare-fun lt!410986 () Unit!30918)

(declare-fun e!512463 () Unit!30918)

(assert (=> d!112381 (= lt!410986 e!512463)))

(declare-fun c!95884 () Bool)

(assert (=> d!112381 (= c!95884 lt!410988)))

(assert (=> d!112381 (= lt!410988 (containsKey!442 (toList!5636 lt!410899) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112381 (= (contains!4683 lt!410899 #b0000000000000000000000000000000000000000000000000000000000000000) lt!410987)))

(declare-fun b!913595 () Bool)

(declare-fun lt!410985 () Unit!30918)

(assert (=> b!913595 (= e!512463 lt!410985)))

(assert (=> b!913595 (= lt!410985 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 lt!410899) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913595 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410899) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913596 () Bool)

(declare-fun Unit!30927 () Unit!30918)

(assert (=> b!913596 (= e!512463 Unit!30927)))

(declare-fun b!913597 () Bool)

(assert (=> b!913597 (= e!512462 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410899) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112381 c!95884) b!913595))

(assert (= (and d!112381 (not c!95884)) b!913596))

(assert (= (and d!112381 (not res!616219)) b!913597))

(declare-fun m!847921 () Bool)

(assert (=> d!112381 m!847921))

(declare-fun m!847923 () Bool)

(assert (=> b!913595 m!847923))

(assert (=> b!913595 m!847897))

(assert (=> b!913595 m!847897))

(declare-fun m!847925 () Bool)

(assert (=> b!913595 m!847925))

(assert (=> b!913597 m!847897))

(assert (=> b!913597 m!847897))

(assert (=> b!913597 m!847925))

(assert (=> bm!40435 d!112381))

(declare-fun d!112383 () Bool)

(assert (=> d!112383 (arrayContainsKey!0 _keys!1386 lt!410952 #b00000000000000000000000000000000)))

(declare-fun lt!410991 () Unit!30918)

(declare-fun choose!13 (array!54292 (_ BitVec 64) (_ BitVec 32)) Unit!30918)

(assert (=> d!112383 (= lt!410991 (choose!13 _keys!1386 lt!410952 #b00000000000000000000000000000000))))

(assert (=> d!112383 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!112383 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410952 #b00000000000000000000000000000000) lt!410991)))

(declare-fun bs!25688 () Bool)

(assert (= bs!25688 d!112383))

(assert (=> bs!25688 m!847849))

(declare-fun m!847927 () Bool)

(assert (=> bs!25688 m!847927))

(assert (=> b!913516 d!112383))

(declare-fun d!112385 () Bool)

(declare-fun res!616220 () Bool)

(declare-fun e!512464 () Bool)

(assert (=> d!112385 (=> res!616220 e!512464)))

(assert (=> d!112385 (= res!616220 (= (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) lt!410952))))

(assert (=> d!112385 (= (arrayContainsKey!0 _keys!1386 lt!410952 #b00000000000000000000000000000000) e!512464)))

(declare-fun b!913598 () Bool)

(declare-fun e!512465 () Bool)

(assert (=> b!913598 (= e!512464 e!512465)))

(declare-fun res!616221 () Bool)

(assert (=> b!913598 (=> (not res!616221) (not e!512465))))

(assert (=> b!913598 (= res!616221 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26558 _keys!1386)))))

(declare-fun b!913599 () Bool)

(assert (=> b!913599 (= e!512465 (arrayContainsKey!0 _keys!1386 lt!410952 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112385 (not res!616220)) b!913598))

(assert (= (and b!913598 res!616221) b!913599))

(assert (=> d!112385 m!847795))

(declare-fun m!847929 () Bool)

(assert (=> b!913599 m!847929))

(assert (=> b!913516 d!112385))

(declare-fun b!913612 () Bool)

(declare-fun e!512474 () SeekEntryResult!8969)

(declare-fun lt!410998 () SeekEntryResult!8969)

(assert (=> b!913612 (= e!512474 (Found!8969 (index!38249 lt!410998)))))

(declare-fun e!512473 () SeekEntryResult!8969)

(declare-fun b!913613 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54292 (_ BitVec 32)) SeekEntryResult!8969)

(assert (=> b!913613 (= e!512473 (seekKeyOrZeroReturnVacant!0 (x!78138 lt!410998) (index!38249 lt!410998) (index!38249 lt!410998) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(declare-fun b!913614 () Bool)

(declare-fun e!512472 () SeekEntryResult!8969)

(assert (=> b!913614 (= e!512472 e!512474)))

(declare-fun lt!411000 () (_ BitVec 64))

(assert (=> b!913614 (= lt!411000 (select (arr!26099 _keys!1386) (index!38249 lt!410998)))))

(declare-fun c!95893 () Bool)

(assert (=> b!913614 (= c!95893 (= lt!411000 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913615 () Bool)

(declare-fun c!95892 () Bool)

(assert (=> b!913615 (= c!95892 (= lt!411000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913615 (= e!512474 e!512473)))

(declare-fun d!112387 () Bool)

(declare-fun lt!410999 () SeekEntryResult!8969)

(assert (=> d!112387 (and (or ((_ is Undefined!8969) lt!410999) (not ((_ is Found!8969) lt!410999)) (and (bvsge (index!38248 lt!410999) #b00000000000000000000000000000000) (bvslt (index!38248 lt!410999) (size!26558 _keys!1386)))) (or ((_ is Undefined!8969) lt!410999) ((_ is Found!8969) lt!410999) (not ((_ is MissingZero!8969) lt!410999)) (and (bvsge (index!38247 lt!410999) #b00000000000000000000000000000000) (bvslt (index!38247 lt!410999) (size!26558 _keys!1386)))) (or ((_ is Undefined!8969) lt!410999) ((_ is Found!8969) lt!410999) ((_ is MissingZero!8969) lt!410999) (not ((_ is MissingVacant!8969) lt!410999)) (and (bvsge (index!38250 lt!410999) #b00000000000000000000000000000000) (bvslt (index!38250 lt!410999) (size!26558 _keys!1386)))) (or ((_ is Undefined!8969) lt!410999) (ite ((_ is Found!8969) lt!410999) (= (select (arr!26099 _keys!1386) (index!38248 lt!410999)) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8969) lt!410999) (= (select (arr!26099 _keys!1386) (index!38247 lt!410999)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8969) lt!410999) (= (select (arr!26099 _keys!1386) (index!38250 lt!410999)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!112387 (= lt!410999 e!512472)))

(declare-fun c!95891 () Bool)

(assert (=> d!112387 (= c!95891 (and ((_ is Intermediate!8969) lt!410998) (undefined!9781 lt!410998)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!54292 (_ BitVec 32)) SeekEntryResult!8969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112387 (= lt!410998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) mask!1756) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756))))

(assert (=> d!112387 (validMask!0 mask!1756)))

(assert (=> d!112387 (= (seekEntryOrOpen!0 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) lt!410999)))

(declare-fun b!913616 () Bool)

(assert (=> b!913616 (= e!512472 Undefined!8969)))

(declare-fun b!913617 () Bool)

(assert (=> b!913617 (= e!512473 (MissingZero!8969 (index!38249 lt!410998)))))

(assert (= (and d!112387 c!95891) b!913616))

(assert (= (and d!112387 (not c!95891)) b!913614))

(assert (= (and b!913614 c!95893) b!913612))

(assert (= (and b!913614 (not c!95893)) b!913615))

(assert (= (and b!913615 c!95892) b!913617))

(assert (= (and b!913615 (not c!95892)) b!913613))

(assert (=> b!913613 m!847795))

(declare-fun m!847931 () Bool)

(assert (=> b!913613 m!847931))

(declare-fun m!847933 () Bool)

(assert (=> b!913614 m!847933))

(declare-fun m!847935 () Bool)

(assert (=> d!112387 m!847935))

(declare-fun m!847937 () Bool)

(assert (=> d!112387 m!847937))

(assert (=> d!112387 m!847795))

(declare-fun m!847939 () Bool)

(assert (=> d!112387 m!847939))

(assert (=> d!112387 m!847795))

(assert (=> d!112387 m!847937))

(assert (=> d!112387 m!847669))

(declare-fun m!847941 () Bool)

(assert (=> d!112387 m!847941))

(declare-fun m!847943 () Bool)

(assert (=> d!112387 m!847943))

(assert (=> b!913516 d!112387))

(declare-fun d!112389 () Bool)

(declare-fun e!512477 () Bool)

(assert (=> d!112389 e!512477))

(declare-fun res!616226 () Bool)

(assert (=> d!112389 (=> (not res!616226) (not e!512477))))

(declare-fun lt!411010 () ListLongMap!11241)

(assert (=> d!112389 (= res!616226 (contains!4683 lt!411010 (_1!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411009 () List!18332)

(assert (=> d!112389 (= lt!411010 (ListLongMap!11242 lt!411009))))

(declare-fun lt!411011 () Unit!30918)

(declare-fun lt!411012 () Unit!30918)

(assert (=> d!112389 (= lt!411011 lt!411012)))

(assert (=> d!112389 (= (getValueByKey!475 lt!411009 (_1!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!480 (_2!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!252 (List!18332 (_ BitVec 64) V!30497) Unit!30918)

(assert (=> d!112389 (= lt!411012 (lemmaContainsTupThenGetReturnValue!252 lt!411009 (_1!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun insertStrictlySorted!309 (List!18332 (_ BitVec 64) V!30497) List!18332)

(assert (=> d!112389 (= lt!411009 (insertStrictlySorted!309 (toList!5636 (ite c!95853 call!40446 (ite c!95855 call!40443 call!40448))) (_1!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112389 (= (+!2608 (ite c!95853 call!40446 (ite c!95855 call!40443 call!40448)) (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411010)))

(declare-fun b!913622 () Bool)

(declare-fun res!616227 () Bool)

(assert (=> b!913622 (=> (not res!616227) (not e!512477))))

(assert (=> b!913622 (= res!616227 (= (getValueByKey!475 (toList!5636 lt!411010) (_1!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!480 (_2!6283 (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!913623 () Bool)

(declare-fun contains!4686 (List!18332 tuple2!12544) Bool)

(assert (=> b!913623 (= e!512477 (contains!4686 (toList!5636 lt!411010) (ite (or c!95853 c!95855) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112389 res!616226) b!913622))

(assert (= (and b!913622 res!616227) b!913623))

(declare-fun m!847945 () Bool)

(assert (=> d!112389 m!847945))

(declare-fun m!847947 () Bool)

(assert (=> d!112389 m!847947))

(declare-fun m!847949 () Bool)

(assert (=> d!112389 m!847949))

(declare-fun m!847951 () Bool)

(assert (=> d!112389 m!847951))

(declare-fun m!847953 () Bool)

(assert (=> b!913622 m!847953))

(declare-fun m!847955 () Bool)

(assert (=> b!913623 m!847955))

(assert (=> bm!40445 d!112389))

(declare-fun d!112391 () Bool)

(assert (=> d!112391 (= (apply!516 (+!2608 lt!410928 (tuple2!12545 lt!410941 minValue!1094)) lt!410923) (get!13700 (getValueByKey!475 (toList!5636 (+!2608 lt!410928 (tuple2!12545 lt!410941 minValue!1094))) lt!410923)))))

(declare-fun bs!25689 () Bool)

(assert (= bs!25689 d!112391))

(declare-fun m!847957 () Bool)

(assert (=> bs!25689 m!847957))

(assert (=> bs!25689 m!847957))

(declare-fun m!847959 () Bool)

(assert (=> bs!25689 m!847959))

(assert (=> b!913485 d!112391))

(declare-fun d!112393 () Bool)

(assert (=> d!112393 (= (apply!516 lt!410940 lt!410927) (get!13700 (getValueByKey!475 (toList!5636 lt!410940) lt!410927)))))

(declare-fun bs!25690 () Bool)

(assert (= bs!25690 d!112393))

(declare-fun m!847961 () Bool)

(assert (=> bs!25690 m!847961))

(assert (=> bs!25690 m!847961))

(declare-fun m!847963 () Bool)

(assert (=> bs!25690 m!847963))

(assert (=> b!913485 d!112393))

(declare-fun d!112395 () Bool)

(assert (=> d!112395 (= (apply!516 (+!2608 lt!410930 (tuple2!12545 lt!410944 minValue!1094)) lt!410932) (get!13700 (getValueByKey!475 (toList!5636 (+!2608 lt!410930 (tuple2!12545 lt!410944 minValue!1094))) lt!410932)))))

(declare-fun bs!25691 () Bool)

(assert (= bs!25691 d!112395))

(declare-fun m!847965 () Bool)

(assert (=> bs!25691 m!847965))

(assert (=> bs!25691 m!847965))

(declare-fun m!847967 () Bool)

(assert (=> bs!25691 m!847967))

(assert (=> b!913485 d!112395))

(declare-fun d!112397 () Bool)

(assert (=> d!112397 (= (apply!516 (+!2608 lt!410940 (tuple2!12545 lt!410942 zeroValue!1094)) lt!410927) (apply!516 lt!410940 lt!410927))))

(declare-fun lt!411015 () Unit!30918)

(declare-fun choose!1532 (ListLongMap!11241 (_ BitVec 64) V!30497 (_ BitVec 64)) Unit!30918)

(assert (=> d!112397 (= lt!411015 (choose!1532 lt!410940 lt!410942 zeroValue!1094 lt!410927))))

(declare-fun e!512480 () Bool)

(assert (=> d!112397 e!512480))

(declare-fun res!616230 () Bool)

(assert (=> d!112397 (=> (not res!616230) (not e!512480))))

(assert (=> d!112397 (= res!616230 (contains!4683 lt!410940 lt!410927))))

(assert (=> d!112397 (= (addApplyDifferent!349 lt!410940 lt!410942 zeroValue!1094 lt!410927) lt!411015)))

(declare-fun b!913627 () Bool)

(assert (=> b!913627 (= e!512480 (not (= lt!410927 lt!410942)))))

(assert (= (and d!112397 res!616230) b!913627))

(assert (=> d!112397 m!847811))

(assert (=> d!112397 m!847811))

(assert (=> d!112397 m!847817))

(declare-fun m!847969 () Bool)

(assert (=> d!112397 m!847969))

(assert (=> d!112397 m!847823))

(declare-fun m!847971 () Bool)

(assert (=> d!112397 m!847971))

(assert (=> b!913485 d!112397))

(assert (=> b!913485 d!112373))

(declare-fun d!112399 () Bool)

(assert (=> d!112399 (= (apply!516 (+!2608 lt!410940 (tuple2!12545 lt!410942 zeroValue!1094)) lt!410927) (get!13700 (getValueByKey!475 (toList!5636 (+!2608 lt!410940 (tuple2!12545 lt!410942 zeroValue!1094))) lt!410927)))))

(declare-fun bs!25692 () Bool)

(assert (= bs!25692 d!112399))

(declare-fun m!847973 () Bool)

(assert (=> bs!25692 m!847973))

(assert (=> bs!25692 m!847973))

(declare-fun m!847975 () Bool)

(assert (=> bs!25692 m!847975))

(assert (=> b!913485 d!112399))

(declare-fun d!112401 () Bool)

(declare-fun e!512481 () Bool)

(assert (=> d!112401 e!512481))

(declare-fun res!616231 () Bool)

(assert (=> d!112401 (=> res!616231 e!512481)))

(declare-fun lt!411018 () Bool)

(assert (=> d!112401 (= res!616231 (not lt!411018))))

(declare-fun lt!411019 () Bool)

(assert (=> d!112401 (= lt!411018 lt!411019)))

(declare-fun lt!411017 () Unit!30918)

(declare-fun e!512482 () Unit!30918)

(assert (=> d!112401 (= lt!411017 e!512482)))

(declare-fun c!95894 () Bool)

(assert (=> d!112401 (= c!95894 lt!411019)))

(assert (=> d!112401 (= lt!411019 (containsKey!442 (toList!5636 (+!2608 lt!410934 (tuple2!12545 lt!410931 zeroValue!1094))) lt!410924))))

(assert (=> d!112401 (= (contains!4683 (+!2608 lt!410934 (tuple2!12545 lt!410931 zeroValue!1094)) lt!410924) lt!411018)))

(declare-fun b!913628 () Bool)

(declare-fun lt!411016 () Unit!30918)

(assert (=> b!913628 (= e!512482 lt!411016)))

(assert (=> b!913628 (= lt!411016 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 (+!2608 lt!410934 (tuple2!12545 lt!410931 zeroValue!1094))) lt!410924))))

(assert (=> b!913628 (isDefined!347 (getValueByKey!475 (toList!5636 (+!2608 lt!410934 (tuple2!12545 lt!410931 zeroValue!1094))) lt!410924))))

(declare-fun b!913629 () Bool)

(declare-fun Unit!30928 () Unit!30918)

(assert (=> b!913629 (= e!512482 Unit!30928)))

(declare-fun b!913630 () Bool)

(assert (=> b!913630 (= e!512481 (isDefined!347 (getValueByKey!475 (toList!5636 (+!2608 lt!410934 (tuple2!12545 lt!410931 zeroValue!1094))) lt!410924)))))

(assert (= (and d!112401 c!95894) b!913628))

(assert (= (and d!112401 (not c!95894)) b!913629))

(assert (= (and d!112401 (not res!616231)) b!913630))

(declare-fun m!847977 () Bool)

(assert (=> d!112401 m!847977))

(declare-fun m!847979 () Bool)

(assert (=> b!913628 m!847979))

(declare-fun m!847981 () Bool)

(assert (=> b!913628 m!847981))

(assert (=> b!913628 m!847981))

(declare-fun m!847983 () Bool)

(assert (=> b!913628 m!847983))

(assert (=> b!913630 m!847981))

(assert (=> b!913630 m!847981))

(assert (=> b!913630 m!847983))

(assert (=> b!913485 d!112401))

(declare-fun d!112403 () Bool)

(assert (=> d!112403 (contains!4683 (+!2608 lt!410934 (tuple2!12545 lt!410931 zeroValue!1094)) lt!410924)))

(declare-fun lt!411022 () Unit!30918)

(declare-fun choose!1533 (ListLongMap!11241 (_ BitVec 64) V!30497 (_ BitVec 64)) Unit!30918)

(assert (=> d!112403 (= lt!411022 (choose!1533 lt!410934 lt!410931 zeroValue!1094 lt!410924))))

(assert (=> d!112403 (contains!4683 lt!410934 lt!410924)))

(assert (=> d!112403 (= (addStillContains!349 lt!410934 lt!410931 zeroValue!1094 lt!410924) lt!411022)))

(declare-fun bs!25693 () Bool)

(assert (= bs!25693 d!112403))

(assert (=> bs!25693 m!847805))

(assert (=> bs!25693 m!847805))

(assert (=> bs!25693 m!847807))

(declare-fun m!847985 () Bool)

(assert (=> bs!25693 m!847985))

(declare-fun m!847987 () Bool)

(assert (=> bs!25693 m!847987))

(assert (=> b!913485 d!112403))

(declare-fun d!112405 () Bool)

(declare-fun e!512483 () Bool)

(assert (=> d!112405 e!512483))

(declare-fun res!616232 () Bool)

(assert (=> d!112405 (=> (not res!616232) (not e!512483))))

(declare-fun lt!411024 () ListLongMap!11241)

(assert (=> d!112405 (= res!616232 (contains!4683 lt!411024 (_1!6283 (tuple2!12545 lt!410931 zeroValue!1094))))))

(declare-fun lt!411023 () List!18332)

(assert (=> d!112405 (= lt!411024 (ListLongMap!11242 lt!411023))))

(declare-fun lt!411025 () Unit!30918)

(declare-fun lt!411026 () Unit!30918)

(assert (=> d!112405 (= lt!411025 lt!411026)))

(assert (=> d!112405 (= (getValueByKey!475 lt!411023 (_1!6283 (tuple2!12545 lt!410931 zeroValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410931 zeroValue!1094))))))

(assert (=> d!112405 (= lt!411026 (lemmaContainsTupThenGetReturnValue!252 lt!411023 (_1!6283 (tuple2!12545 lt!410931 zeroValue!1094)) (_2!6283 (tuple2!12545 lt!410931 zeroValue!1094))))))

(assert (=> d!112405 (= lt!411023 (insertStrictlySorted!309 (toList!5636 lt!410934) (_1!6283 (tuple2!12545 lt!410931 zeroValue!1094)) (_2!6283 (tuple2!12545 lt!410931 zeroValue!1094))))))

(assert (=> d!112405 (= (+!2608 lt!410934 (tuple2!12545 lt!410931 zeroValue!1094)) lt!411024)))

(declare-fun b!913632 () Bool)

(declare-fun res!616233 () Bool)

(assert (=> b!913632 (=> (not res!616233) (not e!512483))))

(assert (=> b!913632 (= res!616233 (= (getValueByKey!475 (toList!5636 lt!411024) (_1!6283 (tuple2!12545 lt!410931 zeroValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410931 zeroValue!1094)))))))

(declare-fun b!913633 () Bool)

(assert (=> b!913633 (= e!512483 (contains!4686 (toList!5636 lt!411024) (tuple2!12545 lt!410931 zeroValue!1094)))))

(assert (= (and d!112405 res!616232) b!913632))

(assert (= (and b!913632 res!616233) b!913633))

(declare-fun m!847989 () Bool)

(assert (=> d!112405 m!847989))

(declare-fun m!847991 () Bool)

(assert (=> d!112405 m!847991))

(declare-fun m!847993 () Bool)

(assert (=> d!112405 m!847993))

(declare-fun m!847995 () Bool)

(assert (=> d!112405 m!847995))

(declare-fun m!847997 () Bool)

(assert (=> b!913632 m!847997))

(declare-fun m!847999 () Bool)

(assert (=> b!913633 m!847999))

(assert (=> b!913485 d!112405))

(declare-fun d!112407 () Bool)

(declare-fun e!512484 () Bool)

(assert (=> d!112407 e!512484))

(declare-fun res!616234 () Bool)

(assert (=> d!112407 (=> (not res!616234) (not e!512484))))

(declare-fun lt!411028 () ListLongMap!11241)

(assert (=> d!112407 (= res!616234 (contains!4683 lt!411028 (_1!6283 (tuple2!12545 lt!410942 zeroValue!1094))))))

(declare-fun lt!411027 () List!18332)

(assert (=> d!112407 (= lt!411028 (ListLongMap!11242 lt!411027))))

(declare-fun lt!411029 () Unit!30918)

(declare-fun lt!411030 () Unit!30918)

(assert (=> d!112407 (= lt!411029 lt!411030)))

(assert (=> d!112407 (= (getValueByKey!475 lt!411027 (_1!6283 (tuple2!12545 lt!410942 zeroValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410942 zeroValue!1094))))))

(assert (=> d!112407 (= lt!411030 (lemmaContainsTupThenGetReturnValue!252 lt!411027 (_1!6283 (tuple2!12545 lt!410942 zeroValue!1094)) (_2!6283 (tuple2!12545 lt!410942 zeroValue!1094))))))

(assert (=> d!112407 (= lt!411027 (insertStrictlySorted!309 (toList!5636 lt!410940) (_1!6283 (tuple2!12545 lt!410942 zeroValue!1094)) (_2!6283 (tuple2!12545 lt!410942 zeroValue!1094))))))

(assert (=> d!112407 (= (+!2608 lt!410940 (tuple2!12545 lt!410942 zeroValue!1094)) lt!411028)))

(declare-fun b!913634 () Bool)

(declare-fun res!616235 () Bool)

(assert (=> b!913634 (=> (not res!616235) (not e!512484))))

(assert (=> b!913634 (= res!616235 (= (getValueByKey!475 (toList!5636 lt!411028) (_1!6283 (tuple2!12545 lt!410942 zeroValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410942 zeroValue!1094)))))))

(declare-fun b!913635 () Bool)

(assert (=> b!913635 (= e!512484 (contains!4686 (toList!5636 lt!411028) (tuple2!12545 lt!410942 zeroValue!1094)))))

(assert (= (and d!112407 res!616234) b!913634))

(assert (= (and b!913634 res!616235) b!913635))

(declare-fun m!848001 () Bool)

(assert (=> d!112407 m!848001))

(declare-fun m!848003 () Bool)

(assert (=> d!112407 m!848003))

(declare-fun m!848005 () Bool)

(assert (=> d!112407 m!848005))

(declare-fun m!848007 () Bool)

(assert (=> d!112407 m!848007))

(declare-fun m!848009 () Bool)

(assert (=> b!913634 m!848009))

(declare-fun m!848011 () Bool)

(assert (=> b!913635 m!848011))

(assert (=> b!913485 d!112407))

(declare-fun d!112409 () Bool)

(assert (=> d!112409 (= (apply!516 (+!2608 lt!410928 (tuple2!12545 lt!410941 minValue!1094)) lt!410923) (apply!516 lt!410928 lt!410923))))

(declare-fun lt!411031 () Unit!30918)

(assert (=> d!112409 (= lt!411031 (choose!1532 lt!410928 lt!410941 minValue!1094 lt!410923))))

(declare-fun e!512485 () Bool)

(assert (=> d!112409 e!512485))

(declare-fun res!616236 () Bool)

(assert (=> d!112409 (=> (not res!616236) (not e!512485))))

(assert (=> d!112409 (= res!616236 (contains!4683 lt!410928 lt!410923))))

(assert (=> d!112409 (= (addApplyDifferent!349 lt!410928 lt!410941 minValue!1094 lt!410923) lt!411031)))

(declare-fun b!913636 () Bool)

(assert (=> b!913636 (= e!512485 (not (= lt!410923 lt!410941)))))

(assert (= (and d!112409 res!616236) b!913636))

(assert (=> d!112409 m!847819))

(assert (=> d!112409 m!847819))

(assert (=> d!112409 m!847825))

(declare-fun m!848013 () Bool)

(assert (=> d!112409 m!848013))

(assert (=> d!112409 m!847815))

(declare-fun m!848015 () Bool)

(assert (=> d!112409 m!848015))

(assert (=> b!913485 d!112409))

(declare-fun d!112411 () Bool)

(declare-fun e!512486 () Bool)

(assert (=> d!112411 e!512486))

(declare-fun res!616237 () Bool)

(assert (=> d!112411 (=> (not res!616237) (not e!512486))))

(declare-fun lt!411033 () ListLongMap!11241)

(assert (=> d!112411 (= res!616237 (contains!4683 lt!411033 (_1!6283 (tuple2!12545 lt!410944 minValue!1094))))))

(declare-fun lt!411032 () List!18332)

(assert (=> d!112411 (= lt!411033 (ListLongMap!11242 lt!411032))))

(declare-fun lt!411034 () Unit!30918)

(declare-fun lt!411035 () Unit!30918)

(assert (=> d!112411 (= lt!411034 lt!411035)))

(assert (=> d!112411 (= (getValueByKey!475 lt!411032 (_1!6283 (tuple2!12545 lt!410944 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410944 minValue!1094))))))

(assert (=> d!112411 (= lt!411035 (lemmaContainsTupThenGetReturnValue!252 lt!411032 (_1!6283 (tuple2!12545 lt!410944 minValue!1094)) (_2!6283 (tuple2!12545 lt!410944 minValue!1094))))))

(assert (=> d!112411 (= lt!411032 (insertStrictlySorted!309 (toList!5636 lt!410930) (_1!6283 (tuple2!12545 lt!410944 minValue!1094)) (_2!6283 (tuple2!12545 lt!410944 minValue!1094))))))

(assert (=> d!112411 (= (+!2608 lt!410930 (tuple2!12545 lt!410944 minValue!1094)) lt!411033)))

(declare-fun b!913637 () Bool)

(declare-fun res!616238 () Bool)

(assert (=> b!913637 (=> (not res!616238) (not e!512486))))

(assert (=> b!913637 (= res!616238 (= (getValueByKey!475 (toList!5636 lt!411033) (_1!6283 (tuple2!12545 lt!410944 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410944 minValue!1094)))))))

(declare-fun b!913638 () Bool)

(assert (=> b!913638 (= e!512486 (contains!4686 (toList!5636 lt!411033) (tuple2!12545 lt!410944 minValue!1094)))))

(assert (= (and d!112411 res!616237) b!913637))

(assert (= (and b!913637 res!616238) b!913638))

(declare-fun m!848017 () Bool)

(assert (=> d!112411 m!848017))

(declare-fun m!848019 () Bool)

(assert (=> d!112411 m!848019))

(declare-fun m!848021 () Bool)

(assert (=> d!112411 m!848021))

(declare-fun m!848023 () Bool)

(assert (=> d!112411 m!848023))

(declare-fun m!848025 () Bool)

(assert (=> b!913637 m!848025))

(declare-fun m!848027 () Bool)

(assert (=> b!913638 m!848027))

(assert (=> b!913485 d!112411))

(declare-fun d!112413 () Bool)

(assert (=> d!112413 (= (apply!516 lt!410930 lt!410932) (get!13700 (getValueByKey!475 (toList!5636 lt!410930) lt!410932)))))

(declare-fun bs!25694 () Bool)

(assert (= bs!25694 d!112413))

(declare-fun m!848029 () Bool)

(assert (=> bs!25694 m!848029))

(assert (=> bs!25694 m!848029))

(declare-fun m!848031 () Bool)

(assert (=> bs!25694 m!848031))

(assert (=> b!913485 d!112413))

(declare-fun d!112415 () Bool)

(assert (=> d!112415 (= (apply!516 (+!2608 lt!410930 (tuple2!12545 lt!410944 minValue!1094)) lt!410932) (apply!516 lt!410930 lt!410932))))

(declare-fun lt!411036 () Unit!30918)

(assert (=> d!112415 (= lt!411036 (choose!1532 lt!410930 lt!410944 minValue!1094 lt!410932))))

(declare-fun e!512487 () Bool)

(assert (=> d!112415 e!512487))

(declare-fun res!616239 () Bool)

(assert (=> d!112415 (=> (not res!616239) (not e!512487))))

(assert (=> d!112415 (= res!616239 (contains!4683 lt!410930 lt!410932))))

(assert (=> d!112415 (= (addApplyDifferent!349 lt!410930 lt!410944 minValue!1094 lt!410932) lt!411036)))

(declare-fun b!913639 () Bool)

(assert (=> b!913639 (= e!512487 (not (= lt!410932 lt!410944)))))

(assert (= (and d!112415 res!616239) b!913639))

(assert (=> d!112415 m!847801))

(assert (=> d!112415 m!847801))

(assert (=> d!112415 m!847803))

(declare-fun m!848033 () Bool)

(assert (=> d!112415 m!848033))

(assert (=> d!112415 m!847813))

(declare-fun m!848035 () Bool)

(assert (=> d!112415 m!848035))

(assert (=> b!913485 d!112415))

(declare-fun d!112417 () Bool)

(assert (=> d!112417 (= (apply!516 lt!410928 lt!410923) (get!13700 (getValueByKey!475 (toList!5636 lt!410928) lt!410923)))))

(declare-fun bs!25695 () Bool)

(assert (= bs!25695 d!112417))

(declare-fun m!848037 () Bool)

(assert (=> bs!25695 m!848037))

(assert (=> bs!25695 m!848037))

(declare-fun m!848039 () Bool)

(assert (=> bs!25695 m!848039))

(assert (=> b!913485 d!112417))

(declare-fun d!112419 () Bool)

(declare-fun e!512488 () Bool)

(assert (=> d!112419 e!512488))

(declare-fun res!616240 () Bool)

(assert (=> d!112419 (=> (not res!616240) (not e!512488))))

(declare-fun lt!411038 () ListLongMap!11241)

(assert (=> d!112419 (= res!616240 (contains!4683 lt!411038 (_1!6283 (tuple2!12545 lt!410941 minValue!1094))))))

(declare-fun lt!411037 () List!18332)

(assert (=> d!112419 (= lt!411038 (ListLongMap!11242 lt!411037))))

(declare-fun lt!411039 () Unit!30918)

(declare-fun lt!411040 () Unit!30918)

(assert (=> d!112419 (= lt!411039 lt!411040)))

(assert (=> d!112419 (= (getValueByKey!475 lt!411037 (_1!6283 (tuple2!12545 lt!410941 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410941 minValue!1094))))))

(assert (=> d!112419 (= lt!411040 (lemmaContainsTupThenGetReturnValue!252 lt!411037 (_1!6283 (tuple2!12545 lt!410941 minValue!1094)) (_2!6283 (tuple2!12545 lt!410941 minValue!1094))))))

(assert (=> d!112419 (= lt!411037 (insertStrictlySorted!309 (toList!5636 lt!410928) (_1!6283 (tuple2!12545 lt!410941 minValue!1094)) (_2!6283 (tuple2!12545 lt!410941 minValue!1094))))))

(assert (=> d!112419 (= (+!2608 lt!410928 (tuple2!12545 lt!410941 minValue!1094)) lt!411038)))

(declare-fun b!913640 () Bool)

(declare-fun res!616241 () Bool)

(assert (=> b!913640 (=> (not res!616241) (not e!512488))))

(assert (=> b!913640 (= res!616241 (= (getValueByKey!475 (toList!5636 lt!411038) (_1!6283 (tuple2!12545 lt!410941 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410941 minValue!1094)))))))

(declare-fun b!913641 () Bool)

(assert (=> b!913641 (= e!512488 (contains!4686 (toList!5636 lt!411038) (tuple2!12545 lt!410941 minValue!1094)))))

(assert (= (and d!112419 res!616240) b!913640))

(assert (= (and b!913640 res!616241) b!913641))

(declare-fun m!848041 () Bool)

(assert (=> d!112419 m!848041))

(declare-fun m!848043 () Bool)

(assert (=> d!112419 m!848043))

(declare-fun m!848045 () Bool)

(assert (=> d!112419 m!848045))

(declare-fun m!848047 () Bool)

(assert (=> d!112419 m!848047))

(declare-fun m!848049 () Bool)

(assert (=> b!913640 m!848049))

(declare-fun m!848051 () Bool)

(assert (=> b!913641 m!848051))

(assert (=> b!913485 d!112419))

(declare-fun d!112421 () Bool)

(declare-fun e!512489 () Bool)

(assert (=> d!112421 e!512489))

(declare-fun res!616242 () Bool)

(assert (=> d!112421 (=> (not res!616242) (not e!512489))))

(declare-fun lt!411042 () ListLongMap!11241)

(assert (=> d!112421 (= res!616242 (contains!4683 lt!411042 (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411041 () List!18332)

(assert (=> d!112421 (= lt!411042 (ListLongMap!11242 lt!411041))))

(declare-fun lt!411043 () Unit!30918)

(declare-fun lt!411044 () Unit!30918)

(assert (=> d!112421 (= lt!411043 lt!411044)))

(assert (=> d!112421 (= (getValueByKey!475 lt!411041 (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112421 (= lt!411044 (lemmaContainsTupThenGetReturnValue!252 lt!411041 (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112421 (= lt!411041 (insertStrictlySorted!309 (toList!5636 call!40437) (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112421 (= (+!2608 call!40437 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411042)))

(declare-fun b!913642 () Bool)

(declare-fun res!616243 () Bool)

(assert (=> b!913642 (=> (not res!616243) (not e!512489))))

(assert (=> b!913642 (= res!616243 (= (getValueByKey!475 (toList!5636 lt!411042) (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!913643 () Bool)

(assert (=> b!913643 (= e!512489 (contains!4686 (toList!5636 lt!411042) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112421 res!616242) b!913642))

(assert (= (and b!913642 res!616243) b!913643))

(declare-fun m!848053 () Bool)

(assert (=> d!112421 m!848053))

(declare-fun m!848055 () Bool)

(assert (=> d!112421 m!848055))

(declare-fun m!848057 () Bool)

(assert (=> d!112421 m!848057))

(declare-fun m!848059 () Bool)

(assert (=> d!112421 m!848059))

(declare-fun m!848061 () Bool)

(assert (=> b!913642 m!848061))

(declare-fun m!848063 () Bool)

(assert (=> b!913643 m!848063))

(assert (=> b!913450 d!112421))

(declare-fun d!112423 () Bool)

(declare-fun isEmpty!693 (Option!481) Bool)

(assert (=> d!112423 (= (isDefined!347 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033)) (not (isEmpty!693 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25696 () Bool)

(assert (= bs!25696 d!112423))

(assert (=> bs!25696 m!847719))

(declare-fun m!848065 () Bool)

(assert (=> bs!25696 m!848065))

(assert (=> b!913401 d!112423))

(declare-fun b!913655 () Bool)

(declare-fun e!512495 () Option!481)

(assert (=> b!913655 (= e!512495 None!479)))

(declare-fun b!913652 () Bool)

(declare-fun e!512494 () Option!481)

(assert (=> b!913652 (= e!512494 (Some!480 (_2!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))))))

(declare-fun b!913653 () Bool)

(assert (=> b!913653 (= e!512494 e!512495)))

(declare-fun c!95900 () Bool)

(assert (=> b!913653 (= c!95900 (and ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (not (= (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033))))))

(declare-fun d!112425 () Bool)

(declare-fun c!95899 () Bool)

(assert (=> d!112425 (= c!95899 (and ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) (= (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112425 (= (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) e!512494)))

(declare-fun b!913654 () Bool)

(assert (=> b!913654 (= e!512495 (getValueByKey!475 (t!25923 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112425 c!95899) b!913652))

(assert (= (and d!112425 (not c!95899)) b!913653))

(assert (= (and b!913653 c!95900) b!913654))

(assert (= (and b!913653 (not c!95900)) b!913655))

(declare-fun m!848067 () Bool)

(assert (=> b!913654 m!848067))

(assert (=> b!913401 d!112425))

(declare-fun d!112427 () Bool)

(declare-fun e!512498 () Bool)

(assert (=> d!112427 e!512498))

(declare-fun c!95903 () Bool)

(assert (=> d!112427 (= c!95903 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!112427 true))

(declare-fun _$15!95 () Unit!30918)

(assert (=> d!112427 (= (choose!1531 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) _$15!95)))

(declare-fun b!913660 () Bool)

(assert (=> b!913660 (= e!512498 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!913661 () Bool)

(assert (=> b!913661 (= e!512498 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112427 c!95903) b!913660))

(assert (= (and d!112427 (not c!95903)) b!913661))

(assert (=> b!913660 m!847675))

(assert (=> d!112359 d!112427))

(assert (=> d!112359 d!112345))

(declare-fun d!112429 () Bool)

(assert (=> d!112429 (= (isDefined!347 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)) (not (isEmpty!693 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))))

(declare-fun bs!25697 () Bool)

(assert (= bs!25697 d!112429))

(assert (=> bs!25697 m!847783))

(declare-fun m!848069 () Bool)

(assert (=> bs!25697 m!848069))

(assert (=> b!913469 d!112429))

(declare-fun b!913665 () Bool)

(declare-fun e!512500 () Option!481)

(assert (=> b!913665 (= e!512500 None!479)))

(declare-fun e!512499 () Option!481)

(declare-fun b!913662 () Bool)

(assert (=> b!913662 (= e!512499 (Some!480 (_2!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))))

(declare-fun b!913663 () Bool)

(assert (=> b!913663 (= e!512499 e!512500)))

(declare-fun c!95905 () Bool)

(assert (=> b!913663 (= c!95905 (and ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (not (= (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033))))))

(declare-fun d!112431 () Bool)

(declare-fun c!95904 () Bool)

(assert (=> d!112431 (= c!95904 (and ((_ is Cons!18328) (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) (= (_1!6283 (h!19474 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)))) k0!1033)))))

(assert (=> d!112431 (= (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) e!512499)))

(declare-fun b!913664 () Bool)

(assert (=> b!913664 (= e!512500 (getValueByKey!475 (t!25923 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))) k0!1033))))

(assert (= (and d!112431 c!95904) b!913662))

(assert (= (and d!112431 (not c!95904)) b!913663))

(assert (= (and b!913663 c!95905) b!913664))

(assert (= (and b!913663 (not c!95905)) b!913665))

(declare-fun m!848071 () Bool)

(assert (=> b!913664 m!848071))

(assert (=> b!913469 d!112431))

(declare-fun d!112433 () Bool)

(assert (=> d!112433 (isDefined!347 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun lt!411047 () Unit!30918)

(declare-fun choose!1534 (List!18332 (_ BitVec 64)) Unit!30918)

(assert (=> d!112433 (= lt!411047 (choose!1534 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(declare-fun e!512503 () Bool)

(assert (=> d!112433 e!512503))

(declare-fun res!616246 () Bool)

(assert (=> d!112433 (=> (not res!616246) (not e!512503))))

(declare-fun isStrictlySorted!501 (List!18332) Bool)

(assert (=> d!112433 (= res!616246 (isStrictlySorted!501 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))))

(assert (=> d!112433 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033) lt!411047)))

(declare-fun b!913668 () Bool)

(assert (=> b!913668 (= e!512503 (containsKey!442 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112433 res!616246) b!913668))

(assert (=> d!112433 m!847719))

(assert (=> d!112433 m!847719))

(assert (=> d!112433 m!847721))

(declare-fun m!848073 () Bool)

(assert (=> d!112433 m!848073))

(declare-fun m!848075 () Bool)

(assert (=> d!112433 m!848075))

(assert (=> b!913668 m!847715))

(assert (=> b!913399 d!112433))

(assert (=> b!913399 d!112423))

(assert (=> b!913399 d!112425))

(declare-fun d!112435 () Bool)

(declare-fun e!512504 () Bool)

(assert (=> d!112435 e!512504))

(declare-fun res!616247 () Bool)

(assert (=> d!112435 (=> res!616247 e!512504)))

(declare-fun lt!411050 () Bool)

(assert (=> d!112435 (= res!616247 (not lt!411050))))

(declare-fun lt!411051 () Bool)

(assert (=> d!112435 (= lt!411050 lt!411051)))

(declare-fun lt!411049 () Unit!30918)

(declare-fun e!512505 () Unit!30918)

(assert (=> d!112435 (= lt!411049 e!512505)))

(declare-fun c!95906 () Bool)

(assert (=> d!112435 (= c!95906 lt!411051)))

(assert (=> d!112435 (= lt!411051 (containsKey!442 (toList!5636 lt!410925) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> d!112435 (= (contains!4683 lt!410925 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)) lt!411050)))

(declare-fun b!913669 () Bool)

(declare-fun lt!411048 () Unit!30918)

(assert (=> b!913669 (= e!512505 lt!411048)))

(assert (=> b!913669 (= lt!411048 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 lt!410925) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!913669 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410925) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913670 () Bool)

(declare-fun Unit!30929 () Unit!30918)

(assert (=> b!913670 (= e!512505 Unit!30929)))

(declare-fun b!913671 () Bool)

(assert (=> b!913671 (= e!512504 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410925) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000))))))

(assert (= (and d!112435 c!95906) b!913669))

(assert (= (and d!112435 (not c!95906)) b!913670))

(assert (= (and d!112435 (not res!616247)) b!913671))

(assert (=> d!112435 m!847795))

(declare-fun m!848077 () Bool)

(assert (=> d!112435 m!848077))

(assert (=> b!913669 m!847795))

(declare-fun m!848079 () Bool)

(assert (=> b!913669 m!848079))

(assert (=> b!913669 m!847795))

(declare-fun m!848081 () Bool)

(assert (=> b!913669 m!848081))

(assert (=> b!913669 m!848081))

(declare-fun m!848083 () Bool)

(assert (=> b!913669 m!848083))

(assert (=> b!913671 m!847795))

(assert (=> b!913671 m!848081))

(assert (=> b!913671 m!848081))

(assert (=> b!913671 m!848083))

(assert (=> b!913483 d!112435))

(declare-fun d!112437 () Bool)

(assert (=> d!112437 (= (apply!516 lt!410899 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13700 (getValueByKey!475 (toList!5636 lt!410899) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25698 () Bool)

(assert (= bs!25698 d!112437))

(assert (=> bs!25698 m!847905))

(assert (=> bs!25698 m!847905))

(declare-fun m!848085 () Bool)

(assert (=> bs!25698 m!848085))

(assert (=> b!913464 d!112437))

(declare-fun d!112439 () Bool)

(assert (=> d!112439 (= (apply!516 lt!410925 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)) (get!13700 (getValueByKey!475 (toList!5636 lt!410925) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000))))))

(declare-fun bs!25699 () Bool)

(assert (= bs!25699 d!112439))

(assert (=> bs!25699 m!847795))

(assert (=> bs!25699 m!848081))

(assert (=> bs!25699 m!848081))

(declare-fun m!848087 () Bool)

(assert (=> bs!25699 m!848087))

(assert (=> b!913482 d!112439))

(declare-fun d!112441 () Bool)

(declare-fun c!95907 () Bool)

(assert (=> d!112441 (= c!95907 ((_ is ValueCellFull!9093) (select (arr!26098 _values!1152) #b00000000000000000000000000000000)))))

(declare-fun e!512506 () V!30497)

(assert (=> d!112441 (= (get!13699 (select (arr!26098 _values!1152) #b00000000000000000000000000000000) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)) e!512506)))

(declare-fun b!913672 () Bool)

(assert (=> b!913672 (= e!512506 (get!13701 (select (arr!26098 _values!1152) #b00000000000000000000000000000000) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913673 () Bool)

(assert (=> b!913673 (= e!512506 (get!13702 (select (arr!26098 _values!1152) #b00000000000000000000000000000000) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112441 c!95907) b!913672))

(assert (= (and d!112441 (not c!95907)) b!913673))

(assert (=> b!913672 m!847835))

(assert (=> b!913672 m!847771))

(declare-fun m!848089 () Bool)

(assert (=> b!913672 m!848089))

(assert (=> b!913673 m!847835))

(assert (=> b!913673 m!847771))

(declare-fun m!848091 () Bool)

(assert (=> b!913673 m!848091))

(assert (=> b!913482 d!112441))

(declare-fun d!112443 () Bool)

(assert (=> d!112443 (= (validKeyInArray!0 (select (arr!26099 _keys!1386) i!717)) (and (not (= (select (arr!26099 _keys!1386) i!717) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!26099 _keys!1386) i!717) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!913446 d!112443))

(declare-fun bm!40457 () Bool)

(declare-fun call!40460 () ListLongMap!11241)

(assert (=> bm!40457 (= call!40460 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160))))

(declare-fun b!913674 () Bool)

(declare-fun e!512511 () ListLongMap!11241)

(assert (=> b!913674 (= e!512511 (ListLongMap!11242 Nil!18329))))

(declare-fun b!913675 () Bool)

(declare-fun e!512508 () Bool)

(declare-fun e!512512 () Bool)

(assert (=> b!913675 (= e!512508 e!512512)))

(declare-fun c!95911 () Bool)

(assert (=> b!913675 (= c!95911 (bvslt i!717 (size!26558 _keys!1386)))))

(declare-fun b!913676 () Bool)

(declare-fun e!512507 () Bool)

(assert (=> b!913676 (= e!512508 e!512507)))

(assert (=> b!913676 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26558 _keys!1386)))))

(declare-fun lt!411056 () ListLongMap!11241)

(declare-fun res!616250 () Bool)

(assert (=> b!913676 (= res!616250 (contains!4683 lt!411056 (select (arr!26099 _keys!1386) i!717)))))

(assert (=> b!913676 (=> (not res!616250) (not e!512507))))

(declare-fun b!913677 () Bool)

(assert (=> b!913677 (= e!512512 (isEmpty!692 lt!411056))))

(declare-fun b!913678 () Bool)

(declare-fun res!616251 () Bool)

(declare-fun e!512513 () Bool)

(assert (=> b!913678 (=> (not res!616251) (not e!512513))))

(assert (=> b!913678 (= res!616251 (not (contains!4683 lt!411056 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!913679 () Bool)

(declare-fun e!512509 () ListLongMap!11241)

(assert (=> b!913679 (= e!512511 e!512509)))

(declare-fun c!95908 () Bool)

(assert (=> b!913679 (= c!95908 (validKeyInArray!0 (select (arr!26099 _keys!1386) i!717)))))

(declare-fun b!913680 () Bool)

(assert (=> b!913680 (= e!512509 call!40460)))

(declare-fun d!112445 () Bool)

(assert (=> d!112445 e!512513))

(declare-fun res!616248 () Bool)

(assert (=> d!112445 (=> (not res!616248) (not e!512513))))

(assert (=> d!112445 (= res!616248 (not (contains!4683 lt!411056 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!112445 (= lt!411056 e!512511)))

(declare-fun c!95909 () Bool)

(assert (=> d!112445 (= c!95909 (bvsge i!717 (size!26558 _keys!1386)))))

(assert (=> d!112445 (validMask!0 mask!1756)))

(assert (=> d!112445 (= (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160) lt!411056)))

(declare-fun b!913681 () Bool)

(assert (=> b!913681 (= e!512512 (= lt!411056 (getCurrentListMapNoExtraKeys!3295 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 (bvadd i!717 #b00000000000000000000000000000001) defaultEntry!1160)))))

(declare-fun b!913682 () Bool)

(declare-fun e!512510 () Bool)

(assert (=> b!913682 (= e!512510 (validKeyInArray!0 (select (arr!26099 _keys!1386) i!717)))))

(assert (=> b!913682 (bvsge i!717 #b00000000000000000000000000000000)))

(declare-fun b!913683 () Bool)

(assert (=> b!913683 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26558 _keys!1386)))))

(assert (=> b!913683 (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26557 _values!1152)))))

(assert (=> b!913683 (= e!512507 (= (apply!516 lt!411056 (select (arr!26099 _keys!1386) i!717)) (get!13699 (select (arr!26098 _values!1152) i!717) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913684 () Bool)

(assert (=> b!913684 (= e!512513 e!512508)))

(declare-fun c!95910 () Bool)

(assert (=> b!913684 (= c!95910 e!512510)))

(declare-fun res!616249 () Bool)

(assert (=> b!913684 (=> (not res!616249) (not e!512510))))

(assert (=> b!913684 (= res!616249 (bvslt i!717 (size!26558 _keys!1386)))))

(declare-fun b!913685 () Bool)

(declare-fun lt!411053 () Unit!30918)

(declare-fun lt!411055 () Unit!30918)

(assert (=> b!913685 (= lt!411053 lt!411055)))

(declare-fun lt!411052 () (_ BitVec 64))

(declare-fun lt!411057 () ListLongMap!11241)

(declare-fun lt!411054 () V!30497)

(declare-fun lt!411058 () (_ BitVec 64))

(assert (=> b!913685 (not (contains!4683 (+!2608 lt!411057 (tuple2!12545 lt!411058 lt!411054)) lt!411052))))

(assert (=> b!913685 (= lt!411055 (addStillNotContains!218 lt!411057 lt!411058 lt!411054 lt!411052))))

(assert (=> b!913685 (= lt!411052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!913685 (= lt!411054 (get!13699 (select (arr!26098 _values!1152) i!717) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!913685 (= lt!411058 (select (arr!26099 _keys!1386) i!717))))

(assert (=> b!913685 (= lt!411057 call!40460)))

(assert (=> b!913685 (= e!512509 (+!2608 call!40460 (tuple2!12545 (select (arr!26099 _keys!1386) i!717) (get!13699 (select (arr!26098 _values!1152) i!717) (dynLambda!1392 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!112445 c!95909) b!913674))

(assert (= (and d!112445 (not c!95909)) b!913679))

(assert (= (and b!913679 c!95908) b!913685))

(assert (= (and b!913679 (not c!95908)) b!913680))

(assert (= (or b!913685 b!913680) bm!40457))

(assert (= (and d!112445 res!616248) b!913678))

(assert (= (and b!913678 res!616251) b!913684))

(assert (= (and b!913684 res!616249) b!913682))

(assert (= (and b!913684 c!95910) b!913676))

(assert (= (and b!913684 (not c!95910)) b!913675))

(assert (= (and b!913676 res!616250) b!913683))

(assert (= (and b!913675 c!95911) b!913681))

(assert (= (and b!913675 (not c!95911)) b!913677))

(declare-fun b_lambda!13327 () Bool)

(assert (=> (not b_lambda!13327) (not b!913683)))

(assert (=> b!913683 t!25928))

(declare-fun b_and!27321 () Bool)

(assert (= b_and!27319 (and (=> t!25928 result!10693) b_and!27321)))

(declare-fun b_lambda!13329 () Bool)

(assert (=> (not b_lambda!13329) (not b!913685)))

(assert (=> b!913685 t!25928))

(declare-fun b_and!27323 () Bool)

(assert (= b_and!27321 (and (=> t!25928 result!10693) b_and!27323)))

(assert (=> b!913685 m!847771))

(assert (=> b!913685 m!847679))

(declare-fun m!848093 () Bool)

(assert (=> b!913685 m!848093))

(declare-fun m!848095 () Bool)

(assert (=> b!913685 m!848095))

(assert (=> b!913685 m!847769))

(assert (=> b!913685 m!847771))

(assert (=> b!913685 m!847773))

(declare-fun m!848097 () Bool)

(assert (=> b!913685 m!848097))

(declare-fun m!848099 () Bool)

(assert (=> b!913685 m!848099))

(assert (=> b!913685 m!848097))

(assert (=> b!913685 m!847769))

(declare-fun m!848101 () Bool)

(assert (=> d!112445 m!848101))

(assert (=> d!112445 m!847669))

(declare-fun m!848103 () Bool)

(assert (=> bm!40457 m!848103))

(declare-fun m!848105 () Bool)

(assert (=> b!913678 m!848105))

(assert (=> b!913679 m!847679))

(assert (=> b!913679 m!847679))

(assert (=> b!913679 m!847777))

(declare-fun m!848107 () Bool)

(assert (=> b!913677 m!848107))

(assert (=> b!913681 m!848103))

(assert (=> b!913676 m!847679))

(assert (=> b!913676 m!847679))

(declare-fun m!848109 () Bool)

(assert (=> b!913676 m!848109))

(assert (=> b!913682 m!847679))

(assert (=> b!913682 m!847679))

(assert (=> b!913682 m!847777))

(assert (=> b!913683 m!847771))

(assert (=> b!913683 m!847679))

(assert (=> b!913683 m!847769))

(assert (=> b!913683 m!847771))

(assert (=> b!913683 m!847773))

(assert (=> b!913683 m!847679))

(declare-fun m!848111 () Bool)

(assert (=> b!913683 m!848111))

(assert (=> b!913683 m!847769))

(assert (=> bm!40439 d!112445))

(assert (=> b!913462 d!112443))

(declare-fun d!112447 () Bool)

(declare-fun res!616252 () Bool)

(declare-fun e!512514 () Bool)

(assert (=> d!112447 (=> res!616252 e!512514)))

(assert (=> d!112447 (= res!616252 (= (select (arr!26099 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1033))))

(assert (=> d!112447 (= (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!512514)))

(declare-fun b!913686 () Bool)

(declare-fun e!512515 () Bool)

(assert (=> b!913686 (= e!512514 e!512515)))

(declare-fun res!616253 () Bool)

(assert (=> b!913686 (=> (not res!616253) (not e!512515))))

(assert (=> b!913686 (= res!616253 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!26558 _keys!1386)))))

(declare-fun b!913687 () Bool)

(assert (=> b!913687 (= e!512515 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!112447 (not res!616252)) b!913686))

(assert (= (and b!913686 res!616253) b!913687))

(assert (=> d!112447 m!847909))

(declare-fun m!848113 () Bool)

(assert (=> b!913687 m!848113))

(assert (=> b!913523 d!112447))

(declare-fun d!112449 () Bool)

(assert (=> d!112449 (isDefined!347 (getValueByKey!475 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun lt!411059 () Unit!30918)

(assert (=> d!112449 (= lt!411059 (choose!1534 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun e!512516 () Bool)

(assert (=> d!112449 e!512516))

(declare-fun res!616254 () Bool)

(assert (=> d!112449 (=> (not res!616254) (not e!512516))))

(assert (=> d!112449 (= res!616254 (isStrictlySorted!501 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))))

(assert (=> d!112449 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033) lt!411059)))

(declare-fun b!913688 () Bool)

(assert (=> b!913688 (= e!512516 (containsKey!442 (toList!5636 (getCurrentListMap!2898 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (= (and d!112449 res!616254) b!913688))

(assert (=> d!112449 m!847783))

(assert (=> d!112449 m!847783))

(assert (=> d!112449 m!847785))

(declare-fun m!848115 () Bool)

(assert (=> d!112449 m!848115))

(declare-fun m!848117 () Bool)

(assert (=> d!112449 m!848117))

(assert (=> b!913688 m!847779))

(assert (=> b!913467 d!112449))

(assert (=> b!913467 d!112429))

(assert (=> b!913467 d!112431))

(declare-fun d!112451 () Bool)

(assert (=> d!112451 (= (apply!516 lt!410925 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13700 (getValueByKey!475 (toList!5636 lt!410925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25700 () Bool)

(assert (= bs!25700 d!112451))

(declare-fun m!848119 () Bool)

(assert (=> bs!25700 m!848119))

(assert (=> bs!25700 m!848119))

(declare-fun m!848121 () Bool)

(assert (=> bs!25700 m!848121))

(assert (=> b!913480 d!112451))

(declare-fun d!112453 () Bool)

(declare-fun e!512517 () Bool)

(assert (=> d!112453 e!512517))

(declare-fun res!616255 () Bool)

(assert (=> d!112453 (=> res!616255 e!512517)))

(declare-fun lt!411062 () Bool)

(assert (=> d!112453 (= res!616255 (not lt!411062))))

(declare-fun lt!411063 () Bool)

(assert (=> d!112453 (= lt!411062 lt!411063)))

(declare-fun lt!411061 () Unit!30918)

(declare-fun e!512518 () Unit!30918)

(assert (=> d!112453 (= lt!411061 e!512518)))

(declare-fun c!95912 () Bool)

(assert (=> d!112453 (= c!95912 lt!411063)))

(assert (=> d!112453 (= lt!411063 (containsKey!442 (toList!5636 lt!410925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112453 (= (contains!4683 lt!410925 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411062)))

(declare-fun b!913689 () Bool)

(declare-fun lt!411060 () Unit!30918)

(assert (=> b!913689 (= e!512518 lt!411060)))

(assert (=> b!913689 (= lt!411060 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 lt!410925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913689 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410925) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913690 () Bool)

(declare-fun Unit!30930 () Unit!30918)

(assert (=> b!913690 (= e!512518 Unit!30930)))

(declare-fun b!913691 () Bool)

(assert (=> b!913691 (= e!512517 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112453 c!95912) b!913689))

(assert (= (and d!112453 (not c!95912)) b!913690))

(assert (= (and d!112453 (not res!616255)) b!913691))

(declare-fun m!848123 () Bool)

(assert (=> d!112453 m!848123))

(declare-fun m!848125 () Bool)

(assert (=> b!913689 m!848125))

(assert (=> b!913689 m!847871))

(assert (=> b!913689 m!847871))

(declare-fun m!848127 () Bool)

(assert (=> b!913689 m!848127))

(assert (=> b!913691 m!847871))

(assert (=> b!913691 m!847871))

(assert (=> b!913691 m!848127))

(assert (=> bm!40443 d!112453))

(declare-fun d!112455 () Bool)

(declare-fun e!512519 () Bool)

(assert (=> d!112455 e!512519))

(declare-fun res!616256 () Bool)

(assert (=> d!112455 (=> (not res!616256) (not e!512519))))

(declare-fun lt!411065 () ListLongMap!11241)

(assert (=> d!112455 (= res!616256 (contains!4683 lt!411065 (_1!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun lt!411064 () List!18332)

(assert (=> d!112455 (= lt!411065 (ListLongMap!11242 lt!411064))))

(declare-fun lt!411066 () Unit!30918)

(declare-fun lt!411067 () Unit!30918)

(assert (=> d!112455 (= lt!411066 lt!411067)))

(assert (=> d!112455 (= (getValueByKey!475 lt!411064 (_1!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!480 (_2!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112455 (= lt!411067 (lemmaContainsTupThenGetReturnValue!252 lt!411064 (_1!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112455 (= lt!411064 (insertStrictlySorted!309 (toList!5636 (ite c!95846 call!40439 (ite c!95848 call!40436 call!40441))) (_1!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (_2!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(assert (=> d!112455 (= (+!2608 (ite c!95846 call!40439 (ite c!95848 call!40436 call!40441)) (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) lt!411065)))

(declare-fun b!913692 () Bool)

(declare-fun res!616257 () Bool)

(assert (=> b!913692 (=> (not res!616257) (not e!512519))))

(assert (=> b!913692 (= res!616257 (= (getValueByKey!475 (toList!5636 lt!411065) (_1!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))) (Some!480 (_2!6283 (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))))

(declare-fun b!913693 () Bool)

(assert (=> b!913693 (= e!512519 (contains!4686 (toList!5636 lt!411065) (ite (or c!95846 c!95848) (tuple2!12545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112455 res!616256) b!913692))

(assert (= (and b!913692 res!616257) b!913693))

(declare-fun m!848129 () Bool)

(assert (=> d!112455 m!848129))

(declare-fun m!848131 () Bool)

(assert (=> d!112455 m!848131))

(declare-fun m!848133 () Bool)

(assert (=> d!112455 m!848133))

(declare-fun m!848135 () Bool)

(assert (=> d!112455 m!848135))

(declare-fun m!848137 () Bool)

(assert (=> b!913692 m!848137))

(declare-fun m!848139 () Bool)

(assert (=> b!913693 m!848139))

(assert (=> bm!40438 d!112455))

(declare-fun d!112457 () Bool)

(declare-fun res!616258 () Bool)

(declare-fun e!512522 () Bool)

(assert (=> d!112457 (=> res!616258 e!512522)))

(assert (=> d!112457 (= res!616258 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26558 _keys!1386)))))

(assert (=> d!112457 (= (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95860 (Cons!18329 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) Nil!18330) Nil!18330)) e!512522)))

(declare-fun b!913694 () Bool)

(declare-fun e!512521 () Bool)

(assert (=> b!913694 (= e!512522 e!512521)))

(declare-fun res!616259 () Bool)

(assert (=> b!913694 (=> (not res!616259) (not e!512521))))

(declare-fun e!512520 () Bool)

(assert (=> b!913694 (= res!616259 (not e!512520))))

(declare-fun res!616260 () Bool)

(assert (=> b!913694 (=> (not res!616260) (not e!512520))))

(assert (=> b!913694 (= res!616260 (validKeyInArray!0 (select (arr!26099 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!913695 () Bool)

(declare-fun e!512523 () Bool)

(assert (=> b!913695 (= e!512521 e!512523)))

(declare-fun c!95913 () Bool)

(assert (=> b!913695 (= c!95913 (validKeyInArray!0 (select (arr!26099 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!913696 () Bool)

(declare-fun call!40461 () Bool)

(assert (=> b!913696 (= e!512523 call!40461)))

(declare-fun b!913697 () Bool)

(assert (=> b!913697 (= e!512520 (contains!4685 (ite c!95860 (Cons!18329 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) Nil!18330) Nil!18330) (select (arr!26099 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!913698 () Bool)

(assert (=> b!913698 (= e!512523 call!40461)))

(declare-fun bm!40458 () Bool)

(assert (=> bm!40458 (= call!40461 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!95913 (Cons!18329 (select (arr!26099 _keys!1386) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!95860 (Cons!18329 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) Nil!18330) Nil!18330)) (ite c!95860 (Cons!18329 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000) Nil!18330) Nil!18330))))))

(assert (= (and d!112457 (not res!616258)) b!913694))

(assert (= (and b!913694 res!616260) b!913697))

(assert (= (and b!913694 res!616259) b!913695))

(assert (= (and b!913695 c!95913) b!913696))

(assert (= (and b!913695 (not c!95913)) b!913698))

(assert (= (or b!913696 b!913698) bm!40458))

(assert (=> b!913694 m!847909))

(assert (=> b!913694 m!847909))

(assert (=> b!913694 m!847919))

(assert (=> b!913695 m!847909))

(assert (=> b!913695 m!847909))

(assert (=> b!913695 m!847919))

(assert (=> b!913697 m!847909))

(assert (=> b!913697 m!847909))

(declare-fun m!848141 () Bool)

(assert (=> b!913697 m!848141))

(assert (=> bm!40458 m!847909))

(declare-fun m!848143 () Bool)

(assert (=> bm!40458 m!848143))

(assert (=> bm!40449 d!112457))

(declare-fun d!112459 () Bool)

(declare-fun e!512524 () Bool)

(assert (=> d!112459 e!512524))

(declare-fun res!616261 () Bool)

(assert (=> d!112459 (=> (not res!616261) (not e!512524))))

(declare-fun lt!411069 () ListLongMap!11241)

(assert (=> d!112459 (= res!616261 (contains!4683 lt!411069 (_1!6283 (tuple2!12545 lt!410915 minValue!1094))))))

(declare-fun lt!411068 () List!18332)

(assert (=> d!112459 (= lt!411069 (ListLongMap!11242 lt!411068))))

(declare-fun lt!411070 () Unit!30918)

(declare-fun lt!411071 () Unit!30918)

(assert (=> d!112459 (= lt!411070 lt!411071)))

(assert (=> d!112459 (= (getValueByKey!475 lt!411068 (_1!6283 (tuple2!12545 lt!410915 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410915 minValue!1094))))))

(assert (=> d!112459 (= lt!411071 (lemmaContainsTupThenGetReturnValue!252 lt!411068 (_1!6283 (tuple2!12545 lt!410915 minValue!1094)) (_2!6283 (tuple2!12545 lt!410915 minValue!1094))))))

(assert (=> d!112459 (= lt!411068 (insertStrictlySorted!309 (toList!5636 lt!410902) (_1!6283 (tuple2!12545 lt!410915 minValue!1094)) (_2!6283 (tuple2!12545 lt!410915 minValue!1094))))))

(assert (=> d!112459 (= (+!2608 lt!410902 (tuple2!12545 lt!410915 minValue!1094)) lt!411069)))

(declare-fun b!913699 () Bool)

(declare-fun res!616262 () Bool)

(assert (=> b!913699 (=> (not res!616262) (not e!512524))))

(assert (=> b!913699 (= res!616262 (= (getValueByKey!475 (toList!5636 lt!411069) (_1!6283 (tuple2!12545 lt!410915 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410915 minValue!1094)))))))

(declare-fun b!913700 () Bool)

(assert (=> b!913700 (= e!512524 (contains!4686 (toList!5636 lt!411069) (tuple2!12545 lt!410915 minValue!1094)))))

(assert (= (and d!112459 res!616261) b!913699))

(assert (= (and b!913699 res!616262) b!913700))

(declare-fun m!848145 () Bool)

(assert (=> d!112459 m!848145))

(declare-fun m!848147 () Bool)

(assert (=> d!112459 m!848147))

(declare-fun m!848149 () Bool)

(assert (=> d!112459 m!848149))

(declare-fun m!848151 () Bool)

(assert (=> d!112459 m!848151))

(declare-fun m!848153 () Bool)

(assert (=> b!913699 m!848153))

(declare-fun m!848155 () Bool)

(assert (=> b!913700 m!848155))

(assert (=> b!913459 d!112459))

(declare-fun d!112461 () Bool)

(assert (=> d!112461 (= (apply!516 (+!2608 lt!410902 (tuple2!12545 lt!410915 minValue!1094)) lt!410897) (get!13700 (getValueByKey!475 (toList!5636 (+!2608 lt!410902 (tuple2!12545 lt!410915 minValue!1094))) lt!410897)))))

(declare-fun bs!25701 () Bool)

(assert (= bs!25701 d!112461))

(declare-fun m!848157 () Bool)

(assert (=> bs!25701 m!848157))

(assert (=> bs!25701 m!848157))

(declare-fun m!848159 () Bool)

(assert (=> bs!25701 m!848159))

(assert (=> b!913459 d!112461))

(declare-fun d!112463 () Bool)

(declare-fun e!512525 () Bool)

(assert (=> d!112463 e!512525))

(declare-fun res!616263 () Bool)

(assert (=> d!112463 (=> (not res!616263) (not e!512525))))

(declare-fun lt!411073 () ListLongMap!11241)

(assert (=> d!112463 (= res!616263 (contains!4683 lt!411073 (_1!6283 (tuple2!12545 lt!410905 zeroValue!1094))))))

(declare-fun lt!411072 () List!18332)

(assert (=> d!112463 (= lt!411073 (ListLongMap!11242 lt!411072))))

(declare-fun lt!411074 () Unit!30918)

(declare-fun lt!411075 () Unit!30918)

(assert (=> d!112463 (= lt!411074 lt!411075)))

(assert (=> d!112463 (= (getValueByKey!475 lt!411072 (_1!6283 (tuple2!12545 lt!410905 zeroValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410905 zeroValue!1094))))))

(assert (=> d!112463 (= lt!411075 (lemmaContainsTupThenGetReturnValue!252 lt!411072 (_1!6283 (tuple2!12545 lt!410905 zeroValue!1094)) (_2!6283 (tuple2!12545 lt!410905 zeroValue!1094))))))

(assert (=> d!112463 (= lt!411072 (insertStrictlySorted!309 (toList!5636 lt!410908) (_1!6283 (tuple2!12545 lt!410905 zeroValue!1094)) (_2!6283 (tuple2!12545 lt!410905 zeroValue!1094))))))

(assert (=> d!112463 (= (+!2608 lt!410908 (tuple2!12545 lt!410905 zeroValue!1094)) lt!411073)))

(declare-fun b!913701 () Bool)

(declare-fun res!616264 () Bool)

(assert (=> b!913701 (=> (not res!616264) (not e!512525))))

(assert (=> b!913701 (= res!616264 (= (getValueByKey!475 (toList!5636 lt!411073) (_1!6283 (tuple2!12545 lt!410905 zeroValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410905 zeroValue!1094)))))))

(declare-fun b!913702 () Bool)

(assert (=> b!913702 (= e!512525 (contains!4686 (toList!5636 lt!411073) (tuple2!12545 lt!410905 zeroValue!1094)))))

(assert (= (and d!112463 res!616263) b!913701))

(assert (= (and b!913701 res!616264) b!913702))

(declare-fun m!848161 () Bool)

(assert (=> d!112463 m!848161))

(declare-fun m!848163 () Bool)

(assert (=> d!112463 m!848163))

(declare-fun m!848165 () Bool)

(assert (=> d!112463 m!848165))

(declare-fun m!848167 () Bool)

(assert (=> d!112463 m!848167))

(declare-fun m!848169 () Bool)

(assert (=> b!913701 m!848169))

(declare-fun m!848171 () Bool)

(assert (=> b!913702 m!848171))

(assert (=> b!913459 d!112463))

(declare-fun d!112465 () Bool)

(assert (=> d!112465 (= (apply!516 lt!410902 lt!410897) (get!13700 (getValueByKey!475 (toList!5636 lt!410902) lt!410897)))))

(declare-fun bs!25702 () Bool)

(assert (= bs!25702 d!112465))

(declare-fun m!848173 () Bool)

(assert (=> bs!25702 m!848173))

(assert (=> bs!25702 m!848173))

(declare-fun m!848175 () Bool)

(assert (=> bs!25702 m!848175))

(assert (=> b!913459 d!112465))

(declare-fun d!112467 () Bool)

(assert (=> d!112467 (= (apply!516 (+!2608 lt!410904 (tuple2!12545 lt!410918 minValue!1094)) lt!410906) (apply!516 lt!410904 lt!410906))))

(declare-fun lt!411076 () Unit!30918)

(assert (=> d!112467 (= lt!411076 (choose!1532 lt!410904 lt!410918 minValue!1094 lt!410906))))

(declare-fun e!512526 () Bool)

(assert (=> d!112467 e!512526))

(declare-fun res!616265 () Bool)

(assert (=> d!112467 (=> (not res!616265) (not e!512526))))

(assert (=> d!112467 (= res!616265 (contains!4683 lt!410904 lt!410906))))

(assert (=> d!112467 (= (addApplyDifferent!349 lt!410904 lt!410918 minValue!1094 lt!410906) lt!411076)))

(declare-fun b!913703 () Bool)

(assert (=> b!913703 (= e!512526 (not (= lt!410906 lt!410918)))))

(assert (= (and d!112467 res!616265) b!913703))

(assert (=> d!112467 m!847735))

(assert (=> d!112467 m!847735))

(assert (=> d!112467 m!847737))

(declare-fun m!848177 () Bool)

(assert (=> d!112467 m!848177))

(assert (=> d!112467 m!847747))

(declare-fun m!848179 () Bool)

(assert (=> d!112467 m!848179))

(assert (=> b!913459 d!112467))

(declare-fun d!112469 () Bool)

(declare-fun e!512527 () Bool)

(assert (=> d!112469 e!512527))

(declare-fun res!616266 () Bool)

(assert (=> d!112469 (=> (not res!616266) (not e!512527))))

(declare-fun lt!411078 () ListLongMap!11241)

(assert (=> d!112469 (= res!616266 (contains!4683 lt!411078 (_1!6283 (tuple2!12545 lt!410918 minValue!1094))))))

(declare-fun lt!411077 () List!18332)

(assert (=> d!112469 (= lt!411078 (ListLongMap!11242 lt!411077))))

(declare-fun lt!411079 () Unit!30918)

(declare-fun lt!411080 () Unit!30918)

(assert (=> d!112469 (= lt!411079 lt!411080)))

(assert (=> d!112469 (= (getValueByKey!475 lt!411077 (_1!6283 (tuple2!12545 lt!410918 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410918 minValue!1094))))))

(assert (=> d!112469 (= lt!411080 (lemmaContainsTupThenGetReturnValue!252 lt!411077 (_1!6283 (tuple2!12545 lt!410918 minValue!1094)) (_2!6283 (tuple2!12545 lt!410918 minValue!1094))))))

(assert (=> d!112469 (= lt!411077 (insertStrictlySorted!309 (toList!5636 lt!410904) (_1!6283 (tuple2!12545 lt!410918 minValue!1094)) (_2!6283 (tuple2!12545 lt!410918 minValue!1094))))))

(assert (=> d!112469 (= (+!2608 lt!410904 (tuple2!12545 lt!410918 minValue!1094)) lt!411078)))

(declare-fun b!913704 () Bool)

(declare-fun res!616267 () Bool)

(assert (=> b!913704 (=> (not res!616267) (not e!512527))))

(assert (=> b!913704 (= res!616267 (= (getValueByKey!475 (toList!5636 lt!411078) (_1!6283 (tuple2!12545 lt!410918 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410918 minValue!1094)))))))

(declare-fun b!913705 () Bool)

(assert (=> b!913705 (= e!512527 (contains!4686 (toList!5636 lt!411078) (tuple2!12545 lt!410918 minValue!1094)))))

(assert (= (and d!112469 res!616266) b!913704))

(assert (= (and b!913704 res!616267) b!913705))

(declare-fun m!848181 () Bool)

(assert (=> d!112469 m!848181))

(declare-fun m!848183 () Bool)

(assert (=> d!112469 m!848183))

(declare-fun m!848185 () Bool)

(assert (=> d!112469 m!848185))

(declare-fun m!848187 () Bool)

(assert (=> d!112469 m!848187))

(declare-fun m!848189 () Bool)

(assert (=> b!913704 m!848189))

(declare-fun m!848191 () Bool)

(assert (=> b!913705 m!848191))

(assert (=> b!913459 d!112469))

(declare-fun d!112471 () Bool)

(assert (=> d!112471 (= (apply!516 lt!410904 lt!410906) (get!13700 (getValueByKey!475 (toList!5636 lt!410904) lt!410906)))))

(declare-fun bs!25703 () Bool)

(assert (= bs!25703 d!112471))

(declare-fun m!848193 () Bool)

(assert (=> bs!25703 m!848193))

(assert (=> bs!25703 m!848193))

(declare-fun m!848195 () Bool)

(assert (=> bs!25703 m!848195))

(assert (=> b!913459 d!112471))

(declare-fun d!112473 () Bool)

(assert (=> d!112473 (= (apply!516 (+!2608 lt!410904 (tuple2!12545 lt!410918 minValue!1094)) lt!410906) (get!13700 (getValueByKey!475 (toList!5636 (+!2608 lt!410904 (tuple2!12545 lt!410918 minValue!1094))) lt!410906)))))

(declare-fun bs!25704 () Bool)

(assert (= bs!25704 d!112473))

(declare-fun m!848197 () Bool)

(assert (=> bs!25704 m!848197))

(assert (=> bs!25704 m!848197))

(declare-fun m!848199 () Bool)

(assert (=> bs!25704 m!848199))

(assert (=> b!913459 d!112473))

(declare-fun d!112475 () Bool)

(declare-fun e!512528 () Bool)

(assert (=> d!112475 e!512528))

(declare-fun res!616268 () Bool)

(assert (=> d!112475 (=> (not res!616268) (not e!512528))))

(declare-fun lt!411082 () ListLongMap!11241)

(assert (=> d!112475 (= res!616268 (contains!4683 lt!411082 (_1!6283 (tuple2!12545 lt!410916 zeroValue!1094))))))

(declare-fun lt!411081 () List!18332)

(assert (=> d!112475 (= lt!411082 (ListLongMap!11242 lt!411081))))

(declare-fun lt!411083 () Unit!30918)

(declare-fun lt!411084 () Unit!30918)

(assert (=> d!112475 (= lt!411083 lt!411084)))

(assert (=> d!112475 (= (getValueByKey!475 lt!411081 (_1!6283 (tuple2!12545 lt!410916 zeroValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410916 zeroValue!1094))))))

(assert (=> d!112475 (= lt!411084 (lemmaContainsTupThenGetReturnValue!252 lt!411081 (_1!6283 (tuple2!12545 lt!410916 zeroValue!1094)) (_2!6283 (tuple2!12545 lt!410916 zeroValue!1094))))))

(assert (=> d!112475 (= lt!411081 (insertStrictlySorted!309 (toList!5636 lt!410914) (_1!6283 (tuple2!12545 lt!410916 zeroValue!1094)) (_2!6283 (tuple2!12545 lt!410916 zeroValue!1094))))))

(assert (=> d!112475 (= (+!2608 lt!410914 (tuple2!12545 lt!410916 zeroValue!1094)) lt!411082)))

(declare-fun b!913706 () Bool)

(declare-fun res!616269 () Bool)

(assert (=> b!913706 (=> (not res!616269) (not e!512528))))

(assert (=> b!913706 (= res!616269 (= (getValueByKey!475 (toList!5636 lt!411082) (_1!6283 (tuple2!12545 lt!410916 zeroValue!1094))) (Some!480 (_2!6283 (tuple2!12545 lt!410916 zeroValue!1094)))))))

(declare-fun b!913707 () Bool)

(assert (=> b!913707 (= e!512528 (contains!4686 (toList!5636 lt!411082) (tuple2!12545 lt!410916 zeroValue!1094)))))

(assert (= (and d!112475 res!616268) b!913706))

(assert (= (and b!913706 res!616269) b!913707))

(declare-fun m!848201 () Bool)

(assert (=> d!112475 m!848201))

(declare-fun m!848203 () Bool)

(assert (=> d!112475 m!848203))

(declare-fun m!848205 () Bool)

(assert (=> d!112475 m!848205))

(declare-fun m!848207 () Bool)

(assert (=> d!112475 m!848207))

(declare-fun m!848209 () Bool)

(assert (=> b!913706 m!848209))

(declare-fun m!848211 () Bool)

(assert (=> b!913707 m!848211))

(assert (=> b!913459 d!112475))

(declare-fun d!112477 () Bool)

(declare-fun e!512529 () Bool)

(assert (=> d!112477 e!512529))

(declare-fun res!616270 () Bool)

(assert (=> d!112477 (=> res!616270 e!512529)))

(declare-fun lt!411087 () Bool)

(assert (=> d!112477 (= res!616270 (not lt!411087))))

(declare-fun lt!411088 () Bool)

(assert (=> d!112477 (= lt!411087 lt!411088)))

(declare-fun lt!411086 () Unit!30918)

(declare-fun e!512530 () Unit!30918)

(assert (=> d!112477 (= lt!411086 e!512530)))

(declare-fun c!95914 () Bool)

(assert (=> d!112477 (= c!95914 lt!411088)))

(assert (=> d!112477 (= lt!411088 (containsKey!442 (toList!5636 (+!2608 lt!410908 (tuple2!12545 lt!410905 zeroValue!1094))) lt!410898))))

(assert (=> d!112477 (= (contains!4683 (+!2608 lt!410908 (tuple2!12545 lt!410905 zeroValue!1094)) lt!410898) lt!411087)))

(declare-fun b!913708 () Bool)

(declare-fun lt!411085 () Unit!30918)

(assert (=> b!913708 (= e!512530 lt!411085)))

(assert (=> b!913708 (= lt!411085 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 (+!2608 lt!410908 (tuple2!12545 lt!410905 zeroValue!1094))) lt!410898))))

(assert (=> b!913708 (isDefined!347 (getValueByKey!475 (toList!5636 (+!2608 lt!410908 (tuple2!12545 lt!410905 zeroValue!1094))) lt!410898))))

(declare-fun b!913709 () Bool)

(declare-fun Unit!30931 () Unit!30918)

(assert (=> b!913709 (= e!512530 Unit!30931)))

(declare-fun b!913710 () Bool)

(assert (=> b!913710 (= e!512529 (isDefined!347 (getValueByKey!475 (toList!5636 (+!2608 lt!410908 (tuple2!12545 lt!410905 zeroValue!1094))) lt!410898)))))

(assert (= (and d!112477 c!95914) b!913708))

(assert (= (and d!112477 (not c!95914)) b!913709))

(assert (= (and d!112477 (not res!616270)) b!913710))

(declare-fun m!848213 () Bool)

(assert (=> d!112477 m!848213))

(declare-fun m!848215 () Bool)

(assert (=> b!913708 m!848215))

(declare-fun m!848217 () Bool)

(assert (=> b!913708 m!848217))

(assert (=> b!913708 m!848217))

(declare-fun m!848219 () Bool)

(assert (=> b!913708 m!848219))

(assert (=> b!913710 m!848217))

(assert (=> b!913710 m!848217))

(assert (=> b!913710 m!848219))

(assert (=> b!913459 d!112477))

(assert (=> b!913459 d!112445))

(declare-fun d!112479 () Bool)

(assert (=> d!112479 (= (apply!516 (+!2608 lt!410914 (tuple2!12545 lt!410916 zeroValue!1094)) lt!410901) (apply!516 lt!410914 lt!410901))))

(declare-fun lt!411089 () Unit!30918)

(assert (=> d!112479 (= lt!411089 (choose!1532 lt!410914 lt!410916 zeroValue!1094 lt!410901))))

(declare-fun e!512531 () Bool)

(assert (=> d!112479 e!512531))

(declare-fun res!616271 () Bool)

(assert (=> d!112479 (=> (not res!616271) (not e!512531))))

(assert (=> d!112479 (= res!616271 (contains!4683 lt!410914 lt!410901))))

(assert (=> d!112479 (= (addApplyDifferent!349 lt!410914 lt!410916 zeroValue!1094 lt!410901) lt!411089)))

(declare-fun b!913711 () Bool)

(assert (=> b!913711 (= e!512531 (not (= lt!410901 lt!410916)))))

(assert (= (and d!112479 res!616271) b!913711))

(assert (=> d!112479 m!847745))

(assert (=> d!112479 m!847745))

(assert (=> d!112479 m!847751))

(declare-fun m!848221 () Bool)

(assert (=> d!112479 m!848221))

(assert (=> d!112479 m!847757))

(declare-fun m!848223 () Bool)

(assert (=> d!112479 m!848223))

(assert (=> b!913459 d!112479))

(declare-fun d!112481 () Bool)

(assert (=> d!112481 (= (apply!516 (+!2608 lt!410914 (tuple2!12545 lt!410916 zeroValue!1094)) lt!410901) (get!13700 (getValueByKey!475 (toList!5636 (+!2608 lt!410914 (tuple2!12545 lt!410916 zeroValue!1094))) lt!410901)))))

(declare-fun bs!25705 () Bool)

(assert (= bs!25705 d!112481))

(declare-fun m!848225 () Bool)

(assert (=> bs!25705 m!848225))

(assert (=> bs!25705 m!848225))

(declare-fun m!848227 () Bool)

(assert (=> bs!25705 m!848227))

(assert (=> b!913459 d!112481))

(declare-fun d!112483 () Bool)

(assert (=> d!112483 (contains!4683 (+!2608 lt!410908 (tuple2!12545 lt!410905 zeroValue!1094)) lt!410898)))

(declare-fun lt!411090 () Unit!30918)

(assert (=> d!112483 (= lt!411090 (choose!1533 lt!410908 lt!410905 zeroValue!1094 lt!410898))))

(assert (=> d!112483 (contains!4683 lt!410908 lt!410898)))

(assert (=> d!112483 (= (addStillContains!349 lt!410908 lt!410905 zeroValue!1094 lt!410898) lt!411090)))

(declare-fun bs!25706 () Bool)

(assert (= bs!25706 d!112483))

(assert (=> bs!25706 m!847739))

(assert (=> bs!25706 m!847739))

(assert (=> bs!25706 m!847741))

(declare-fun m!848229 () Bool)

(assert (=> bs!25706 m!848229))

(declare-fun m!848231 () Bool)

(assert (=> bs!25706 m!848231))

(assert (=> b!913459 d!112483))

(declare-fun d!112485 () Bool)

(assert (=> d!112485 (= (apply!516 (+!2608 lt!410902 (tuple2!12545 lt!410915 minValue!1094)) lt!410897) (apply!516 lt!410902 lt!410897))))

(declare-fun lt!411091 () Unit!30918)

(assert (=> d!112485 (= lt!411091 (choose!1532 lt!410902 lt!410915 minValue!1094 lt!410897))))

(declare-fun e!512532 () Bool)

(assert (=> d!112485 e!512532))

(declare-fun res!616272 () Bool)

(assert (=> d!112485 (=> (not res!616272) (not e!512532))))

(assert (=> d!112485 (= res!616272 (contains!4683 lt!410902 lt!410897))))

(assert (=> d!112485 (= (addApplyDifferent!349 lt!410902 lt!410915 minValue!1094 lt!410897) lt!411091)))

(declare-fun b!913712 () Bool)

(assert (=> b!913712 (= e!512532 (not (= lt!410897 lt!410915)))))

(assert (= (and d!112485 res!616272) b!913712))

(assert (=> d!112485 m!847753))

(assert (=> d!112485 m!847753))

(assert (=> d!112485 m!847759))

(declare-fun m!848233 () Bool)

(assert (=> d!112485 m!848233))

(assert (=> d!112485 m!847749))

(declare-fun m!848235 () Bool)

(assert (=> d!112485 m!848235))

(assert (=> b!913459 d!112485))

(declare-fun d!112487 () Bool)

(assert (=> d!112487 (= (apply!516 lt!410914 lt!410901) (get!13700 (getValueByKey!475 (toList!5636 lt!410914) lt!410901)))))

(declare-fun bs!25707 () Bool)

(assert (= bs!25707 d!112487))

(declare-fun m!848237 () Bool)

(assert (=> bs!25707 m!848237))

(assert (=> bs!25707 m!848237))

(declare-fun m!848239 () Bool)

(assert (=> bs!25707 m!848239))

(assert (=> b!913459 d!112487))

(declare-fun d!112489 () Bool)

(declare-fun e!512533 () Bool)

(assert (=> d!112489 e!512533))

(declare-fun res!616273 () Bool)

(assert (=> d!112489 (=> res!616273 e!512533)))

(declare-fun lt!411094 () Bool)

(assert (=> d!112489 (= res!616273 (not lt!411094))))

(declare-fun lt!411095 () Bool)

(assert (=> d!112489 (= lt!411094 lt!411095)))

(declare-fun lt!411093 () Unit!30918)

(declare-fun e!512534 () Unit!30918)

(assert (=> d!112489 (= lt!411093 e!512534)))

(declare-fun c!95915 () Bool)

(assert (=> d!112489 (= c!95915 lt!411095)))

(assert (=> d!112489 (= lt!411095 (containsKey!442 (toList!5636 lt!410925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112489 (= (contains!4683 lt!410925 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411094)))

(declare-fun b!913713 () Bool)

(declare-fun lt!411092 () Unit!30918)

(assert (=> b!913713 (= e!512534 lt!411092)))

(assert (=> b!913713 (= lt!411092 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 lt!410925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!913713 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410925) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!913714 () Bool)

(declare-fun Unit!30932 () Unit!30918)

(assert (=> b!913714 (= e!512534 Unit!30932)))

(declare-fun b!913715 () Bool)

(assert (=> b!913715 (= e!512533 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112489 c!95915) b!913713))

(assert (= (and d!112489 (not c!95915)) b!913714))

(assert (= (and d!112489 (not res!616273)) b!913715))

(declare-fun m!848241 () Bool)

(assert (=> d!112489 m!848241))

(declare-fun m!848243 () Bool)

(assert (=> b!913713 m!848243))

(assert (=> b!913713 m!848119))

(assert (=> b!913713 m!848119))

(declare-fun m!848245 () Bool)

(assert (=> b!913713 m!848245))

(assert (=> b!913715 m!848119))

(assert (=> b!913715 m!848119))

(assert (=> b!913715 m!848245))

(assert (=> bm!40442 d!112489))

(declare-fun d!112491 () Bool)

(declare-fun e!512535 () Bool)

(assert (=> d!112491 e!512535))

(declare-fun res!616274 () Bool)

(assert (=> d!112491 (=> (not res!616274) (not e!512535))))

(declare-fun lt!411097 () ListLongMap!11241)

(assert (=> d!112491 (= res!616274 (contains!4683 lt!411097 (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun lt!411096 () List!18332)

(assert (=> d!112491 (= lt!411097 (ListLongMap!11242 lt!411096))))

(declare-fun lt!411098 () Unit!30918)

(declare-fun lt!411099 () Unit!30918)

(assert (=> d!112491 (= lt!411098 lt!411099)))

(assert (=> d!112491 (= (getValueByKey!475 lt!411096 (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112491 (= lt!411099 (lemmaContainsTupThenGetReturnValue!252 lt!411096 (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112491 (= lt!411096 (insertStrictlySorted!309 (toList!5636 call!40444) (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) (_2!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (=> d!112491 (= (+!2608 call!40444 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)) lt!411097)))

(declare-fun b!913716 () Bool)

(declare-fun res!616275 () Bool)

(assert (=> b!913716 (=> (not res!616275) (not e!512535))))

(assert (=> b!913716 (= res!616275 (= (getValueByKey!475 (toList!5636 lt!411097) (_1!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))) (Some!480 (_2!6283 (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))))

(declare-fun b!913717 () Bool)

(assert (=> b!913717 (= e!512535 (contains!4686 (toList!5636 lt!411097) (tuple2!12545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(assert (= (and d!112491 res!616274) b!913716))

(assert (= (and b!913716 res!616275) b!913717))

(declare-fun m!848247 () Bool)

(assert (=> d!112491 m!848247))

(declare-fun m!848249 () Bool)

(assert (=> d!112491 m!848249))

(declare-fun m!848251 () Bool)

(assert (=> d!112491 m!848251))

(declare-fun m!848253 () Bool)

(assert (=> d!112491 m!848253))

(declare-fun m!848255 () Bool)

(assert (=> b!913716 m!848255))

(declare-fun m!848257 () Bool)

(assert (=> b!913717 m!848257))

(assert (=> b!913476 d!112491))

(assert (=> d!112339 d!112345))

(declare-fun d!112493 () Bool)

(declare-fun e!512536 () Bool)

(assert (=> d!112493 e!512536))

(declare-fun res!616276 () Bool)

(assert (=> d!112493 (=> res!616276 e!512536)))

(declare-fun lt!411102 () Bool)

(assert (=> d!112493 (= res!616276 (not lt!411102))))

(declare-fun lt!411103 () Bool)

(assert (=> d!112493 (= lt!411102 lt!411103)))

(declare-fun lt!411101 () Unit!30918)

(declare-fun e!512537 () Unit!30918)

(assert (=> d!112493 (= lt!411101 e!512537)))

(declare-fun c!95916 () Bool)

(assert (=> d!112493 (= c!95916 lt!411103)))

(assert (=> d!112493 (= lt!411103 (containsKey!442 (toList!5636 lt!410899) (select (arr!26099 _keys!1386) i!717)))))

(assert (=> d!112493 (= (contains!4683 lt!410899 (select (arr!26099 _keys!1386) i!717)) lt!411102)))

(declare-fun b!913718 () Bool)

(declare-fun lt!411100 () Unit!30918)

(assert (=> b!913718 (= e!512537 lt!411100)))

(assert (=> b!913718 (= lt!411100 (lemmaContainsKeyImpliesGetValueByKeyDefined!338 (toList!5636 lt!410899) (select (arr!26099 _keys!1386) i!717)))))

(assert (=> b!913718 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410899) (select (arr!26099 _keys!1386) i!717)))))

(declare-fun b!913719 () Bool)

(declare-fun Unit!30933 () Unit!30918)

(assert (=> b!913719 (= e!512537 Unit!30933)))

(declare-fun b!913720 () Bool)

(assert (=> b!913720 (= e!512536 (isDefined!347 (getValueByKey!475 (toList!5636 lt!410899) (select (arr!26099 _keys!1386) i!717))))))

(assert (= (and d!112493 c!95916) b!913718))

(assert (= (and d!112493 (not c!95916)) b!913719))

(assert (= (and d!112493 (not res!616276)) b!913720))

(assert (=> d!112493 m!847679))

(declare-fun m!848259 () Bool)

(assert (=> d!112493 m!848259))

(assert (=> b!913718 m!847679))

(declare-fun m!848261 () Bool)

(assert (=> b!913718 m!848261))

(assert (=> b!913718 m!847679))

(assert (=> b!913718 m!847861))

(assert (=> b!913718 m!847861))

(declare-fun m!848263 () Bool)

(assert (=> b!913718 m!848263))

(assert (=> b!913720 m!847679))

(assert (=> b!913720 m!847861))

(assert (=> b!913720 m!847861))

(assert (=> b!913720 m!848263))

(assert (=> b!913457 d!112493))

(declare-fun d!112495 () Bool)

(declare-fun lt!411106 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!403 (List!18333) (InoxSet (_ BitVec 64)))

(assert (=> d!112495 (= lt!411106 (select (content!403 Nil!18330) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun e!512543 () Bool)

(assert (=> d!112495 (= lt!411106 e!512543)))

(declare-fun res!616281 () Bool)

(assert (=> d!112495 (=> (not res!616281) (not e!512543))))

(assert (=> d!112495 (= res!616281 ((_ is Cons!18329) Nil!18330))))

(assert (=> d!112495 (= (contains!4685 Nil!18330 (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)) lt!411106)))

(declare-fun b!913725 () Bool)

(declare-fun e!512542 () Bool)

(assert (=> b!913725 (= e!512543 e!512542)))

(declare-fun res!616282 () Bool)

(assert (=> b!913725 (=> res!616282 e!512542)))

(assert (=> b!913725 (= res!616282 (= (h!19475 Nil!18330) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!913726 () Bool)

(assert (=> b!913726 (= e!512542 (contains!4685 (t!25924 Nil!18330) (select (arr!26099 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112495 res!616281) b!913725))

(assert (= (and b!913725 (not res!616282)) b!913726))

(declare-fun m!848265 () Bool)

(assert (=> d!112495 m!848265))

(assert (=> d!112495 m!847795))

(declare-fun m!848267 () Bool)

(assert (=> d!112495 m!848267))

(assert (=> b!913726 m!847795))

(declare-fun m!848269 () Bool)

(assert (=> b!913726 m!848269))

(assert (=> b!913504 d!112495))

(declare-fun b!913728 () Bool)

(declare-fun e!512545 () Bool)

(assert (=> b!913728 (= e!512545 tp_is_empty!19149)))

(declare-fun condMapEmpty!30461 () Bool)

(declare-fun mapDefault!30461 () ValueCell!9093)

(assert (=> mapNonEmpty!30460 (= condMapEmpty!30461 (= mapRest!30460 ((as const (Array (_ BitVec 32) ValueCell!9093)) mapDefault!30461)))))

(declare-fun mapRes!30461 () Bool)

(assert (=> mapNonEmpty!30460 (= tp!58482 (and e!512545 mapRes!30461))))

(declare-fun b!913727 () Bool)

(declare-fun e!512544 () Bool)

(assert (=> b!913727 (= e!512544 tp_is_empty!19149)))

(declare-fun mapNonEmpty!30461 () Bool)

(declare-fun tp!58483 () Bool)

(assert (=> mapNonEmpty!30461 (= mapRes!30461 (and tp!58483 e!512544))))

(declare-fun mapValue!30461 () ValueCell!9093)

(declare-fun mapRest!30461 () (Array (_ BitVec 32) ValueCell!9093))

(declare-fun mapKey!30461 () (_ BitVec 32))

(assert (=> mapNonEmpty!30461 (= mapRest!30460 (store mapRest!30461 mapKey!30461 mapValue!30461))))

(declare-fun mapIsEmpty!30461 () Bool)

(assert (=> mapIsEmpty!30461 mapRes!30461))

(assert (= (and mapNonEmpty!30460 condMapEmpty!30461) mapIsEmpty!30461))

(assert (= (and mapNonEmpty!30460 (not condMapEmpty!30461)) mapNonEmpty!30461))

(assert (= (and mapNonEmpty!30461 ((_ is ValueCellFull!9093) mapValue!30461)) b!913727))

(assert (= (and mapNonEmpty!30460 ((_ is ValueCellFull!9093) mapDefault!30461)) b!913728))

(declare-fun m!848271 () Bool)

(assert (=> mapNonEmpty!30461 m!848271))

(declare-fun b_lambda!13331 () Bool)

(assert (= b_lambda!13325 (or (and start!78260 b_free!16731) b_lambda!13331)))

(declare-fun b_lambda!13333 () Bool)

(assert (= b_lambda!13323 (or (and start!78260 b_free!16731) b_lambda!13333)))

(declare-fun b_lambda!13335 () Bool)

(assert (= b_lambda!13329 (or (and start!78260 b_free!16731) b_lambda!13335)))

(declare-fun b_lambda!13337 () Bool)

(assert (= b_lambda!13327 (or (and start!78260 b_free!16731) b_lambda!13337)))

(check-sat (not b!913689) (not b_lambda!13335) (not b!913688) (not b!913716) (not b!913599) (not b!913622) (not b!913691) (not d!112363) (not d!112459) (not d!112479) (not d!112421) (not d!112373) (not b!913664) (not b!913671) (not d!112389) (not d!112405) (not b!913640) (not d!112401) (not d!112381) (not b!913713) (not b!913581) (not d!112403) (not bm!40458) (not d!112413) (not d!112411) (not b_next!16731) (not b!913597) (not b_lambda!13337) (not d!112369) (not d!112429) (not d!112439) (not d!112435) (not d!112423) (not b!913637) (not b!913702) (not d!112419) (not d!112455) (not d!112473) (not d!112461) (not b!913633) (not d!112417) (not d!112495) (not d!112391) (not b!913654) (not b_lambda!13319) (not d!112491) (not d!112465) (not d!112489) (not b!913587) (not b!913692) (not b!913687) (not b!913685) (not b!913668) (not b!913549) (not d!112475) (not bm!40456) (not d!112387) (not d!112467) (not b!913543) (not d!112409) (not b!913643) (not b!913677) (not b!913720) (not b!913579) (not b!913623) (not b!913704) (not b!913708) (not d!112469) (not d!112445) (not d!112471) (not b!913682) (not b!913705) (not d!112433) (not b!913638) (not b!913678) (not b!913584) (not b!913634) (not b!913717) (not b!913710) (not d!112463) (not d!112483) (not b!913628) (not b_lambda!13333) (not b!913673) (not d!112383) (not b!913590) (not b!913693) (not b!913588) (not b!913551) (not b_lambda!13331) (not d!112393) (not bm!40455) (not b!913695) (not b!913726) (not b!913669) (not d!112477) (not b!913660) (not d!112453) (not b!913583) (not b!913593) (not b!913632) (not b!913701) (not b!913718) (not b!913681) (not b!913707) (not b!913700) (not b!913699) (not b!913641) (not b!913578) (not b!913595) (not bm!40457) (not b!913676) (not d!112485) (not b!913672) (not d!112493) (not d!112407) (not b!913542) (not d!112415) tp_is_empty!19149 (not d!112397) (not b!913580) (not b!913715) (not b!913706) (not b!913635) (not d!112451) (not b!913585) (not d!112481) (not b!913630) (not b!913697) (not d!112437) (not d!112375) (not b!913642) (not b!913613) (not b!913679) (not mapNonEmpty!30461) (not b!913694) (not d!112487) (not b!913594) (not d!112377) (not b_lambda!13321) (not b!913683) b_and!27323 (not d!112395) (not d!112399) (not d!112449))
(check-sat b_and!27323 (not b_next!16731))
