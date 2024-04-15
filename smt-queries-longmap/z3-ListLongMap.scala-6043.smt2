; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78140 () Bool)

(assert start!78140)

(declare-fun b_free!16669 () Bool)

(declare-fun b_next!16669 () Bool)

(assert (=> start!78140 (= b_free!16669 (not b_next!16669))))

(declare-fun tp!58281 () Bool)

(declare-fun b_and!27217 () Bool)

(assert (=> start!78140 (= tp!58281 b_and!27217)))

(declare-fun res!615238 () Bool)

(declare-fun e!511527 () Bool)

(assert (=> start!78140 (=> (not res!615238) (not e!511527))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78140 (= res!615238 (validMask!0 mask!1756))))

(assert (=> start!78140 e!511527))

(declare-datatypes ((V!30415 0))(
  ( (V!30416 (val!9594 Int)) )
))
(declare-datatypes ((ValueCell!9062 0))(
  ( (ValueCellFull!9062 (v!12103 V!30415)) (EmptyCell!9062) )
))
(declare-datatypes ((array!54169 0))(
  ( (array!54170 (arr!26040 (Array (_ BitVec 32) ValueCell!9062)) (size!26501 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54169)

(declare-fun e!511528 () Bool)

(declare-fun array_inv!20416 (array!54169) Bool)

(assert (=> start!78140 (and (array_inv!20416 _values!1152) e!511528)))

(assert (=> start!78140 tp!58281))

(assert (=> start!78140 true))

(declare-fun tp_is_empty!19087 () Bool)

(assert (=> start!78140 tp_is_empty!19087))

(declare-datatypes ((array!54171 0))(
  ( (array!54172 (arr!26041 (Array (_ BitVec 32) (_ BitVec 64))) (size!26502 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54171)

(declare-fun array_inv!20417 (array!54171) Bool)

(assert (=> start!78140 (array_inv!20417 _keys!1386)))

(declare-fun b!911933 () Bool)

(declare-fun res!615241 () Bool)

(assert (=> b!911933 (=> (not res!615241) (not e!511527))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!911933 (= res!615241 (inRange!0 i!717 mask!1756))))

(declare-fun b!911934 () Bool)

(declare-fun res!615236 () Bool)

(assert (=> b!911934 (=> (not res!615236) (not e!511527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54171 (_ BitVec 32)) Bool)

(assert (=> b!911934 (= res!615236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30355 () Bool)

(declare-fun mapRes!30355 () Bool)

(declare-fun tp!58282 () Bool)

(declare-fun e!511525 () Bool)

(assert (=> mapNonEmpty!30355 (= mapRes!30355 (and tp!58282 e!511525))))

(declare-fun mapKey!30355 () (_ BitVec 32))

(declare-fun mapRest!30355 () (Array (_ BitVec 32) ValueCell!9062))

(declare-fun mapValue!30355 () ValueCell!9062)

(assert (=> mapNonEmpty!30355 (= (arr!26040 _values!1152) (store mapRest!30355 mapKey!30355 mapValue!30355))))

(declare-fun b!911935 () Bool)

(assert (=> b!911935 (= e!511525 tp_is_empty!19087)))

(declare-fun b!911936 () Bool)

(assert (=> b!911936 (= e!511527 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26501 _values!1152)))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!911936 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30415)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30796 0))(
  ( (Unit!30797) )
))
(declare-fun lt!410328 () Unit!30796)

(declare-fun zeroValue!1094 () V!30415)

(declare-fun lemmaKeyInListMapIsInArray!256 (array!54171 array!54169 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 64) Int) Unit!30796)

(assert (=> b!911936 (= lt!410328 (lemmaKeyInListMapIsInArray!256 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!911937 () Bool)

(declare-fun e!511526 () Bool)

(assert (=> b!911937 (= e!511528 (and e!511526 mapRes!30355))))

(declare-fun condMapEmpty!30355 () Bool)

(declare-fun mapDefault!30355 () ValueCell!9062)

(assert (=> b!911937 (= condMapEmpty!30355 (= (arr!26040 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9062)) mapDefault!30355)))))

(declare-fun b!911938 () Bool)

(declare-fun res!615237 () Bool)

(assert (=> b!911938 (=> (not res!615237) (not e!511527))))

(assert (=> b!911938 (= res!615237 (and (= (select (arr!26041 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!911939 () Bool)

(assert (=> b!911939 (= e!511526 tp_is_empty!19087)))

(declare-fun b!911940 () Bool)

(declare-fun res!615239 () Bool)

(assert (=> b!911940 (=> (not res!615239) (not e!511527))))

(declare-datatypes ((tuple2!12546 0))(
  ( (tuple2!12547 (_1!6284 (_ BitVec 64)) (_2!6284 V!30415)) )
))
(declare-datatypes ((List!18326 0))(
  ( (Nil!18323) (Cons!18322 (h!19468 tuple2!12546) (t!25904 List!18326)) )
))
(declare-datatypes ((ListLongMap!11233 0))(
  ( (ListLongMap!11234 (toList!5632 List!18326)) )
))
(declare-fun contains!4634 (ListLongMap!11233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2834 (array!54171 array!54169 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 32) Int) ListLongMap!11233)

(assert (=> b!911940 (= res!615239 (contains!4634 (getCurrentListMap!2834 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911941 () Bool)

(declare-fun res!615235 () Bool)

(assert (=> b!911941 (=> (not res!615235) (not e!511527))))

(declare-datatypes ((List!18327 0))(
  ( (Nil!18324) (Cons!18323 (h!19469 (_ BitVec 64)) (t!25905 List!18327)) )
))
(declare-fun arrayNoDuplicates!0 (array!54171 (_ BitVec 32) List!18327) Bool)

(assert (=> b!911941 (= res!615235 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18324))))

(declare-fun b!911942 () Bool)

(declare-fun res!615240 () Bool)

(assert (=> b!911942 (=> (not res!615240) (not e!511527))))

(assert (=> b!911942 (= res!615240 (and (= (size!26501 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26502 _keys!1386) (size!26501 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30355 () Bool)

(assert (=> mapIsEmpty!30355 mapRes!30355))

(assert (= (and start!78140 res!615238) b!911942))

(assert (= (and b!911942 res!615240) b!911934))

(assert (= (and b!911934 res!615236) b!911941))

(assert (= (and b!911941 res!615235) b!911940))

(assert (= (and b!911940 res!615239) b!911933))

(assert (= (and b!911933 res!615241) b!911938))

(assert (= (and b!911938 res!615237) b!911936))

(assert (= (and b!911937 condMapEmpty!30355) mapIsEmpty!30355))

(assert (= (and b!911937 (not condMapEmpty!30355)) mapNonEmpty!30355))

(get-info :version)

(assert (= (and mapNonEmpty!30355 ((_ is ValueCellFull!9062) mapValue!30355)) b!911935))

(assert (= (and b!911937 ((_ is ValueCellFull!9062) mapDefault!30355)) b!911939))

(assert (= start!78140 b!911937))

(declare-fun m!845985 () Bool)

(assert (=> b!911941 m!845985))

(declare-fun m!845987 () Bool)

(assert (=> b!911934 m!845987))

(declare-fun m!845989 () Bool)

(assert (=> mapNonEmpty!30355 m!845989))

(declare-fun m!845991 () Bool)

(assert (=> b!911936 m!845991))

(declare-fun m!845993 () Bool)

(assert (=> b!911936 m!845993))

(declare-fun m!845995 () Bool)

(assert (=> b!911938 m!845995))

(declare-fun m!845997 () Bool)

(assert (=> b!911933 m!845997))

(declare-fun m!845999 () Bool)

(assert (=> start!78140 m!845999))

(declare-fun m!846001 () Bool)

(assert (=> start!78140 m!846001))

(declare-fun m!846003 () Bool)

(assert (=> start!78140 m!846003))

(declare-fun m!846005 () Bool)

(assert (=> b!911940 m!846005))

(assert (=> b!911940 m!846005))

(declare-fun m!846007 () Bool)

(assert (=> b!911940 m!846007))

(check-sat (not b!911940) (not b!911936) b_and!27217 tp_is_empty!19087 (not b!911933) (not mapNonEmpty!30355) (not start!78140) (not b_next!16669) (not b!911934) (not b!911941))
(check-sat b_and!27217 (not b_next!16669))
(get-model)

(declare-fun d!112079 () Bool)

(declare-fun e!511565 () Bool)

(assert (=> d!112079 e!511565))

(declare-fun res!615286 () Bool)

(assert (=> d!112079 (=> res!615286 e!511565)))

(declare-fun lt!410344 () Bool)

(assert (=> d!112079 (= res!615286 (not lt!410344))))

(declare-fun lt!410346 () Bool)

(assert (=> d!112079 (= lt!410344 lt!410346)))

(declare-fun lt!410345 () Unit!30796)

(declare-fun e!511564 () Unit!30796)

(assert (=> d!112079 (= lt!410345 e!511564)))

(declare-fun c!95707 () Bool)

(assert (=> d!112079 (= c!95707 lt!410346)))

(declare-fun containsKey!440 (List!18326 (_ BitVec 64)) Bool)

(assert (=> d!112079 (= lt!410346 (containsKey!440 (toList!5632 (getCurrentListMap!2834 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112079 (= (contains!4634 (getCurrentListMap!2834 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410344)))

(declare-fun b!912009 () Bool)

(declare-fun lt!410343 () Unit!30796)

(assert (=> b!912009 (= e!511564 lt!410343)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!335 (List!18326 (_ BitVec 64)) Unit!30796)

(assert (=> b!912009 (= lt!410343 (lemmaContainsKeyImpliesGetValueByKeyDefined!335 (toList!5632 (getCurrentListMap!2834 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!482 0))(
  ( (Some!481 (v!12106 V!30415)) (None!480) )
))
(declare-fun isDefined!348 (Option!482) Bool)

(declare-fun getValueByKey!476 (List!18326 (_ BitVec 64)) Option!482)

(assert (=> b!912009 (isDefined!348 (getValueByKey!476 (toList!5632 (getCurrentListMap!2834 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!912010 () Bool)

(declare-fun Unit!30798 () Unit!30796)

(assert (=> b!912010 (= e!511564 Unit!30798)))

(declare-fun b!912011 () Bool)

(assert (=> b!912011 (= e!511565 (isDefined!348 (getValueByKey!476 (toList!5632 (getCurrentListMap!2834 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112079 c!95707) b!912009))

(assert (= (and d!112079 (not c!95707)) b!912010))

(assert (= (and d!112079 (not res!615286)) b!912011))

(declare-fun m!846057 () Bool)

(assert (=> d!112079 m!846057))

(declare-fun m!846059 () Bool)

(assert (=> b!912009 m!846059))

(declare-fun m!846061 () Bool)

(assert (=> b!912009 m!846061))

(assert (=> b!912009 m!846061))

(declare-fun m!846063 () Bool)

(assert (=> b!912009 m!846063))

(assert (=> b!912011 m!846061))

(assert (=> b!912011 m!846061))

(assert (=> b!912011 m!846063))

(assert (=> b!911940 d!112079))

(declare-fun bm!40353 () Bool)

(declare-fun call!40357 () ListLongMap!11233)

(declare-fun call!40360 () ListLongMap!11233)

(assert (=> bm!40353 (= call!40357 call!40360)))

(declare-fun d!112081 () Bool)

(declare-fun e!511603 () Bool)

(assert (=> d!112081 e!511603))

(declare-fun res!615313 () Bool)

(assert (=> d!112081 (=> (not res!615313) (not e!511603))))

(assert (=> d!112081 (= res!615313 (or (bvsge #b00000000000000000000000000000000 (size!26502 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26502 _keys!1386)))))))

(declare-fun lt!410394 () ListLongMap!11233)

(declare-fun lt!410406 () ListLongMap!11233)

(assert (=> d!112081 (= lt!410394 lt!410406)))

(declare-fun lt!410392 () Unit!30796)

(declare-fun e!511597 () Unit!30796)

(assert (=> d!112081 (= lt!410392 e!511597)))

(declare-fun c!95722 () Bool)

(declare-fun e!511602 () Bool)

(assert (=> d!112081 (= c!95722 e!511602)))

(declare-fun res!615305 () Bool)

(assert (=> d!112081 (=> (not res!615305) (not e!511602))))

(assert (=> d!112081 (= res!615305 (bvslt #b00000000000000000000000000000000 (size!26502 _keys!1386)))))

(declare-fun e!511594 () ListLongMap!11233)

(assert (=> d!112081 (= lt!410406 e!511594)))

(declare-fun c!95721 () Bool)

(assert (=> d!112081 (= c!95721 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112081 (validMask!0 mask!1756)))

(assert (=> d!112081 (= (getCurrentListMap!2834 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410394)))

(declare-fun bm!40354 () Bool)

(declare-fun call!40358 () Bool)

(assert (=> bm!40354 (= call!40358 (contains!4634 lt!410394 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!912054 () Bool)

(declare-fun e!511595 () Bool)

(declare-fun call!40356 () Bool)

(assert (=> b!912054 (= e!511595 (not call!40356))))

(declare-fun b!912055 () Bool)

(declare-fun e!511601 () ListLongMap!11233)

(declare-fun call!40359 () ListLongMap!11233)

(assert (=> b!912055 (= e!511601 call!40359)))

(declare-fun b!912056 () Bool)

(declare-fun e!511599 () ListLongMap!11233)

(assert (=> b!912056 (= e!511599 call!40359)))

(declare-fun b!912057 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!912057 (= e!511602 (validKeyInArray!0 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40355 () Bool)

(declare-fun call!40362 () ListLongMap!11233)

(assert (=> bm!40355 (= call!40360 call!40362)))

(declare-fun b!912058 () Bool)

(declare-fun e!511593 () Bool)

(assert (=> b!912058 (= e!511595 e!511593)))

(declare-fun res!615307 () Bool)

(assert (=> b!912058 (= res!615307 call!40356)))

(assert (=> b!912058 (=> (not res!615307) (not e!511593))))

(declare-fun b!912059 () Bool)

(assert (=> b!912059 (= e!511594 e!511601)))

(declare-fun c!95725 () Bool)

(assert (=> b!912059 (= c!95725 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!912060 () Bool)

(declare-fun e!511598 () Bool)

(assert (=> b!912060 (= e!511603 e!511598)))

(declare-fun c!95723 () Bool)

(assert (=> b!912060 (= c!95723 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!912061 () Bool)

(declare-fun e!511592 () Bool)

(declare-fun apply!518 (ListLongMap!11233 (_ BitVec 64)) V!30415)

(assert (=> b!912061 (= e!511592 (= (apply!518 lt!410394 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun bm!40356 () Bool)

(declare-fun call!40361 () ListLongMap!11233)

(assert (=> bm!40356 (= call!40359 call!40361)))

(declare-fun b!912062 () Bool)

(declare-fun e!511596 () Bool)

(declare-fun e!511600 () Bool)

(assert (=> b!912062 (= e!511596 e!511600)))

(declare-fun res!615308 () Bool)

(assert (=> b!912062 (=> (not res!615308) (not e!511600))))

(assert (=> b!912062 (= res!615308 (contains!4634 lt!410394 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!912062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26502 _keys!1386)))))

(declare-fun b!912063 () Bool)

(declare-fun e!511604 () Bool)

(assert (=> b!912063 (= e!511604 (validKeyInArray!0 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912064 () Bool)

(declare-fun Unit!30799 () Unit!30796)

(assert (=> b!912064 (= e!511597 Unit!30799)))

(declare-fun b!912065 () Bool)

(declare-fun +!2632 (ListLongMap!11233 tuple2!12546) ListLongMap!11233)

(assert (=> b!912065 (= e!511594 (+!2632 call!40361 (tuple2!12547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun bm!40357 () Bool)

(assert (=> bm!40357 (= call!40356 (contains!4634 lt!410394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40358 () Bool)

(assert (=> bm!40358 (= call!40361 (+!2632 (ite c!95721 call!40362 (ite c!95725 call!40360 call!40357)) (ite (or c!95721 c!95725) (tuple2!12547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!912066 () Bool)

(assert (=> b!912066 (= e!511598 (not call!40358))))

(declare-fun b!912067 () Bool)

(declare-fun lt!410401 () Unit!30796)

(assert (=> b!912067 (= e!511597 lt!410401)))

(declare-fun lt!410399 () ListLongMap!11233)

(declare-fun getCurrentListMapNoExtraKeys!3329 (array!54171 array!54169 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 32) Int) ListLongMap!11233)

(assert (=> b!912067 (= lt!410399 (getCurrentListMapNoExtraKeys!3329 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410410 () (_ BitVec 64))

(assert (=> b!912067 (= lt!410410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410412 () (_ BitVec 64))

(assert (=> b!912067 (= lt!410412 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410391 () Unit!30796)

(declare-fun addStillContains!347 (ListLongMap!11233 (_ BitVec 64) V!30415 (_ BitVec 64)) Unit!30796)

(assert (=> b!912067 (= lt!410391 (addStillContains!347 lt!410399 lt!410410 zeroValue!1094 lt!410412))))

(assert (=> b!912067 (contains!4634 (+!2632 lt!410399 (tuple2!12547 lt!410410 zeroValue!1094)) lt!410412)))

(declare-fun lt!410396 () Unit!30796)

(assert (=> b!912067 (= lt!410396 lt!410391)))

(declare-fun lt!410404 () ListLongMap!11233)

(assert (=> b!912067 (= lt!410404 (getCurrentListMapNoExtraKeys!3329 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410405 () (_ BitVec 64))

(assert (=> b!912067 (= lt!410405 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410403 () (_ BitVec 64))

(assert (=> b!912067 (= lt!410403 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410409 () Unit!30796)

(declare-fun addApplyDifferent!347 (ListLongMap!11233 (_ BitVec 64) V!30415 (_ BitVec 64)) Unit!30796)

(assert (=> b!912067 (= lt!410409 (addApplyDifferent!347 lt!410404 lt!410405 minValue!1094 lt!410403))))

(assert (=> b!912067 (= (apply!518 (+!2632 lt!410404 (tuple2!12547 lt!410405 minValue!1094)) lt!410403) (apply!518 lt!410404 lt!410403))))

(declare-fun lt!410407 () Unit!30796)

(assert (=> b!912067 (= lt!410407 lt!410409)))

(declare-fun lt!410393 () ListLongMap!11233)

(assert (=> b!912067 (= lt!410393 (getCurrentListMapNoExtraKeys!3329 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410395 () (_ BitVec 64))

(assert (=> b!912067 (= lt!410395 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410397 () (_ BitVec 64))

(assert (=> b!912067 (= lt!410397 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410398 () Unit!30796)

(assert (=> b!912067 (= lt!410398 (addApplyDifferent!347 lt!410393 lt!410395 zeroValue!1094 lt!410397))))

(assert (=> b!912067 (= (apply!518 (+!2632 lt!410393 (tuple2!12547 lt!410395 zeroValue!1094)) lt!410397) (apply!518 lt!410393 lt!410397))))

(declare-fun lt!410408 () Unit!30796)

(assert (=> b!912067 (= lt!410408 lt!410398)))

(declare-fun lt!410402 () ListLongMap!11233)

(assert (=> b!912067 (= lt!410402 (getCurrentListMapNoExtraKeys!3329 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410400 () (_ BitVec 64))

(assert (=> b!912067 (= lt!410400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410411 () (_ BitVec 64))

(assert (=> b!912067 (= lt!410411 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!912067 (= lt!410401 (addApplyDifferent!347 lt!410402 lt!410400 minValue!1094 lt!410411))))

(assert (=> b!912067 (= (apply!518 (+!2632 lt!410402 (tuple2!12547 lt!410400 minValue!1094)) lt!410411) (apply!518 lt!410402 lt!410411))))

(declare-fun b!912068 () Bool)

(declare-fun get!13675 (ValueCell!9062 V!30415) V!30415)

(declare-fun dynLambda!1383 (Int (_ BitVec 64)) V!30415)

(assert (=> b!912068 (= e!511600 (= (apply!518 lt!410394 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000)) (get!13675 (select (arr!26040 _values!1152) #b00000000000000000000000000000000) (dynLambda!1383 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!912068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26501 _values!1152)))))

(assert (=> b!912068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26502 _keys!1386)))))

(declare-fun b!912069 () Bool)

(assert (=> b!912069 (= e!511599 call!40357)))

(declare-fun b!912070 () Bool)

(declare-fun res!615309 () Bool)

(assert (=> b!912070 (=> (not res!615309) (not e!511603))))

(assert (=> b!912070 (= res!615309 e!511596)))

(declare-fun res!615312 () Bool)

(assert (=> b!912070 (=> res!615312 e!511596)))

(assert (=> b!912070 (= res!615312 (not e!511604))))

(declare-fun res!615310 () Bool)

(assert (=> b!912070 (=> (not res!615310) (not e!511604))))

(assert (=> b!912070 (= res!615310 (bvslt #b00000000000000000000000000000000 (size!26502 _keys!1386)))))

(declare-fun b!912071 () Bool)

(declare-fun c!95720 () Bool)

(assert (=> b!912071 (= c!95720 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!912071 (= e!511601 e!511599)))

(declare-fun b!912072 () Bool)

(assert (=> b!912072 (= e!511593 (= (apply!518 lt!410394 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!912073 () Bool)

(assert (=> b!912073 (= e!511598 e!511592)))

(declare-fun res!615311 () Bool)

(assert (=> b!912073 (= res!615311 call!40358)))

(assert (=> b!912073 (=> (not res!615311) (not e!511592))))

(declare-fun b!912074 () Bool)

(declare-fun res!615306 () Bool)

(assert (=> b!912074 (=> (not res!615306) (not e!511603))))

(assert (=> b!912074 (= res!615306 e!511595)))

(declare-fun c!95724 () Bool)

(assert (=> b!912074 (= c!95724 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40359 () Bool)

(assert (=> bm!40359 (= call!40362 (getCurrentListMapNoExtraKeys!3329 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and d!112081 c!95721) b!912065))

(assert (= (and d!112081 (not c!95721)) b!912059))

(assert (= (and b!912059 c!95725) b!912055))

(assert (= (and b!912059 (not c!95725)) b!912071))

(assert (= (and b!912071 c!95720) b!912056))

(assert (= (and b!912071 (not c!95720)) b!912069))

(assert (= (or b!912056 b!912069) bm!40353))

(assert (= (or b!912055 bm!40353) bm!40355))

(assert (= (or b!912055 b!912056) bm!40356))

(assert (= (or b!912065 bm!40355) bm!40359))

(assert (= (or b!912065 bm!40356) bm!40358))

(assert (= (and d!112081 res!615305) b!912057))

(assert (= (and d!112081 c!95722) b!912067))

(assert (= (and d!112081 (not c!95722)) b!912064))

(assert (= (and d!112081 res!615313) b!912070))

(assert (= (and b!912070 res!615310) b!912063))

(assert (= (and b!912070 (not res!615312)) b!912062))

(assert (= (and b!912062 res!615308) b!912068))

(assert (= (and b!912070 res!615309) b!912074))

(assert (= (and b!912074 c!95724) b!912058))

(assert (= (and b!912074 (not c!95724)) b!912054))

(assert (= (and b!912058 res!615307) b!912072))

(assert (= (or b!912058 b!912054) bm!40357))

(assert (= (and b!912074 res!615306) b!912060))

(assert (= (and b!912060 c!95723) b!912073))

(assert (= (and b!912060 (not c!95723)) b!912066))

(assert (= (and b!912073 res!615311) b!912061))

(assert (= (or b!912073 b!912066) bm!40354))

(declare-fun b_lambda!13289 () Bool)

(assert (=> (not b_lambda!13289) (not b!912068)))

(declare-fun t!25908 () Bool)

(declare-fun tb!5431 () Bool)

(assert (=> (and start!78140 (= defaultEntry!1160 defaultEntry!1160) t!25908) tb!5431))

(declare-fun result!10673 () Bool)

(assert (=> tb!5431 (= result!10673 tp_is_empty!19087)))

(assert (=> b!912068 t!25908))

(declare-fun b_and!27223 () Bool)

(assert (= b_and!27217 (and (=> t!25908 result!10673) b_and!27223)))

(declare-fun m!846065 () Bool)

(assert (=> bm!40357 m!846065))

(declare-fun m!846067 () Bool)

(assert (=> b!912062 m!846067))

(assert (=> b!912062 m!846067))

(declare-fun m!846069 () Bool)

(assert (=> b!912062 m!846069))

(declare-fun m!846071 () Bool)

(assert (=> b!912065 m!846071))

(assert (=> d!112081 m!845999))

(assert (=> b!912063 m!846067))

(assert (=> b!912063 m!846067))

(declare-fun m!846073 () Bool)

(assert (=> b!912063 m!846073))

(declare-fun m!846075 () Bool)

(assert (=> b!912072 m!846075))

(declare-fun m!846077 () Bool)

(assert (=> bm!40354 m!846077))

(declare-fun m!846079 () Bool)

(assert (=> b!912061 m!846079))

(declare-fun m!846081 () Bool)

(assert (=> b!912068 m!846081))

(declare-fun m!846083 () Bool)

(assert (=> b!912068 m!846083))

(assert (=> b!912068 m!846081))

(declare-fun m!846085 () Bool)

(assert (=> b!912068 m!846085))

(assert (=> b!912068 m!846083))

(assert (=> b!912068 m!846067))

(assert (=> b!912068 m!846067))

(declare-fun m!846087 () Bool)

(assert (=> b!912068 m!846087))

(declare-fun m!846089 () Bool)

(assert (=> bm!40358 m!846089))

(assert (=> b!912057 m!846067))

(assert (=> b!912057 m!846067))

(assert (=> b!912057 m!846073))

(declare-fun m!846091 () Bool)

(assert (=> b!912067 m!846091))

(declare-fun m!846093 () Bool)

(assert (=> b!912067 m!846093))

(declare-fun m!846095 () Bool)

(assert (=> b!912067 m!846095))

(declare-fun m!846097 () Bool)

(assert (=> b!912067 m!846097))

(declare-fun m!846099 () Bool)

(assert (=> b!912067 m!846099))

(declare-fun m!846101 () Bool)

(assert (=> b!912067 m!846101))

(declare-fun m!846103 () Bool)

(assert (=> b!912067 m!846103))

(declare-fun m!846105 () Bool)

(assert (=> b!912067 m!846105))

(declare-fun m!846107 () Bool)

(assert (=> b!912067 m!846107))

(assert (=> b!912067 m!846101))

(assert (=> b!912067 m!846067))

(declare-fun m!846109 () Bool)

(assert (=> b!912067 m!846109))

(declare-fun m!846111 () Bool)

(assert (=> b!912067 m!846111))

(declare-fun m!846113 () Bool)

(assert (=> b!912067 m!846113))

(assert (=> b!912067 m!846113))

(declare-fun m!846115 () Bool)

(assert (=> b!912067 m!846115))

(declare-fun m!846117 () Bool)

(assert (=> b!912067 m!846117))

(assert (=> b!912067 m!846093))

(declare-fun m!846119 () Bool)

(assert (=> b!912067 m!846119))

(assert (=> b!912067 m!846117))

(declare-fun m!846121 () Bool)

(assert (=> b!912067 m!846121))

(assert (=> bm!40359 m!846097))

(assert (=> b!911940 d!112081))

(declare-fun b!912085 () Bool)

(declare-fun e!511613 () Bool)

(declare-fun e!511611 () Bool)

(assert (=> b!912085 (= e!511613 e!511611)))

(declare-fun c!95728 () Bool)

(assert (=> b!912085 (= c!95728 (validKeyInArray!0 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40362 () Bool)

(declare-fun call!40365 () Bool)

(assert (=> bm!40362 (= call!40365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!912086 () Bool)

(declare-fun e!511612 () Bool)

(assert (=> b!912086 (= e!511612 call!40365)))

(declare-fun b!912087 () Bool)

(assert (=> b!912087 (= e!511611 call!40365)))

(declare-fun d!112083 () Bool)

(declare-fun res!615318 () Bool)

(assert (=> d!112083 (=> res!615318 e!511613)))

(assert (=> d!112083 (= res!615318 (bvsge #b00000000000000000000000000000000 (size!26502 _keys!1386)))))

(assert (=> d!112083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!511613)))

(declare-fun b!912088 () Bool)

(assert (=> b!912088 (= e!511611 e!511612)))

(declare-fun lt!410419 () (_ BitVec 64))

(assert (=> b!912088 (= lt!410419 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410420 () Unit!30796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54171 (_ BitVec 64) (_ BitVec 32)) Unit!30796)

(assert (=> b!912088 (= lt!410420 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410419 #b00000000000000000000000000000000))))

(assert (=> b!912088 (arrayContainsKey!0 _keys!1386 lt!410419 #b00000000000000000000000000000000)))

(declare-fun lt!410421 () Unit!30796)

(assert (=> b!912088 (= lt!410421 lt!410420)))

(declare-fun res!615319 () Bool)

(declare-datatypes ((SeekEntryResult!8967 0))(
  ( (MissingZero!8967 (index!38239 (_ BitVec 32))) (Found!8967 (index!38240 (_ BitVec 32))) (Intermediate!8967 (undefined!9779 Bool) (index!38241 (_ BitVec 32)) (x!78031 (_ BitVec 32))) (Undefined!8967) (MissingVacant!8967 (index!38242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54171 (_ BitVec 32)) SeekEntryResult!8967)

(assert (=> b!912088 (= res!615319 (= (seekEntryOrOpen!0 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8967 #b00000000000000000000000000000000)))))

(assert (=> b!912088 (=> (not res!615319) (not e!511612))))

(assert (= (and d!112083 (not res!615318)) b!912085))

(assert (= (and b!912085 c!95728) b!912088))

(assert (= (and b!912085 (not c!95728)) b!912087))

(assert (= (and b!912088 res!615319) b!912086))

(assert (= (or b!912086 b!912087) bm!40362))

(assert (=> b!912085 m!846067))

(assert (=> b!912085 m!846067))

(assert (=> b!912085 m!846073))

(declare-fun m!846123 () Bool)

(assert (=> bm!40362 m!846123))

(assert (=> b!912088 m!846067))

(declare-fun m!846125 () Bool)

(assert (=> b!912088 m!846125))

(declare-fun m!846127 () Bool)

(assert (=> b!912088 m!846127))

(assert (=> b!912088 m!846067))

(declare-fun m!846129 () Bool)

(assert (=> b!912088 m!846129))

(assert (=> b!911934 d!112083))

(declare-fun d!112085 () Bool)

(assert (=> d!112085 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78140 d!112085))

(declare-fun d!112087 () Bool)

(assert (=> d!112087 (= (array_inv!20416 _values!1152) (bvsge (size!26501 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78140 d!112087))

(declare-fun d!112089 () Bool)

(assert (=> d!112089 (= (array_inv!20417 _keys!1386) (bvsge (size!26502 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78140 d!112089))

(declare-fun d!112091 () Bool)

(assert (=> d!112091 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!911933 d!112091))

(declare-fun d!112093 () Bool)

(declare-fun res!615324 () Bool)

(declare-fun e!511618 () Bool)

(assert (=> d!112093 (=> res!615324 e!511618)))

(assert (=> d!112093 (= res!615324 (= (select (arr!26041 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112093 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!511618)))

(declare-fun b!912093 () Bool)

(declare-fun e!511619 () Bool)

(assert (=> b!912093 (= e!511618 e!511619)))

(declare-fun res!615325 () Bool)

(assert (=> b!912093 (=> (not res!615325) (not e!511619))))

(assert (=> b!912093 (= res!615325 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26502 _keys!1386)))))

(declare-fun b!912094 () Bool)

(assert (=> b!912094 (= e!511619 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112093 (not res!615324)) b!912093))

(assert (= (and b!912093 res!615325) b!912094))

(assert (=> d!112093 m!846067))

(declare-fun m!846131 () Bool)

(assert (=> b!912094 m!846131))

(assert (=> b!911936 d!112093))

(declare-fun d!112095 () Bool)

(declare-fun e!511622 () Bool)

(assert (=> d!112095 e!511622))

(declare-fun c!95731 () Bool)

(assert (=> d!112095 (= c!95731 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!410424 () Unit!30796)

(declare-fun choose!1538 (array!54171 array!54169 (_ BitVec 32) (_ BitVec 32) V!30415 V!30415 (_ BitVec 64) Int) Unit!30796)

(assert (=> d!112095 (= lt!410424 (choose!1538 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112095 (validMask!0 mask!1756)))

(assert (=> d!112095 (= (lemmaKeyInListMapIsInArray!256 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!410424)))

(declare-fun b!912099 () Bool)

(assert (=> b!912099 (= e!511622 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!912100 () Bool)

(assert (=> b!912100 (= e!511622 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112095 c!95731) b!912099))

(assert (= (and d!112095 (not c!95731)) b!912100))

(declare-fun m!846133 () Bool)

(assert (=> d!112095 m!846133))

(assert (=> d!112095 m!845999))

(assert (=> b!912099 m!845991))

(assert (=> b!911936 d!112095))

(declare-fun b!912111 () Bool)

(declare-fun e!511631 () Bool)

(declare-fun e!511634 () Bool)

(assert (=> b!912111 (= e!511631 e!511634)))

(declare-fun res!615332 () Bool)

(assert (=> b!912111 (=> (not res!615332) (not e!511634))))

(declare-fun e!511633 () Bool)

(assert (=> b!912111 (= res!615332 (not e!511633))))

(declare-fun res!615333 () Bool)

(assert (=> b!912111 (=> (not res!615333) (not e!511633))))

(assert (=> b!912111 (= res!615333 (validKeyInArray!0 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112097 () Bool)

(declare-fun res!615334 () Bool)

(assert (=> d!112097 (=> res!615334 e!511631)))

(assert (=> d!112097 (= res!615334 (bvsge #b00000000000000000000000000000000 (size!26502 _keys!1386)))))

(assert (=> d!112097 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18324) e!511631)))

(declare-fun b!912112 () Bool)

(declare-fun e!511632 () Bool)

(declare-fun call!40368 () Bool)

(assert (=> b!912112 (= e!511632 call!40368)))

(declare-fun bm!40365 () Bool)

(declare-fun c!95734 () Bool)

(assert (=> bm!40365 (= call!40368 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95734 (Cons!18323 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000) Nil!18324) Nil!18324)))))

(declare-fun b!912113 () Bool)

(declare-fun contains!4636 (List!18327 (_ BitVec 64)) Bool)

(assert (=> b!912113 (= e!511633 (contains!4636 Nil!18324 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912114 () Bool)

(assert (=> b!912114 (= e!511634 e!511632)))

(assert (=> b!912114 (= c!95734 (validKeyInArray!0 (select (arr!26041 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912115 () Bool)

(assert (=> b!912115 (= e!511632 call!40368)))

(assert (= (and d!112097 (not res!615334)) b!912111))

(assert (= (and b!912111 res!615333) b!912113))

(assert (= (and b!912111 res!615332) b!912114))

(assert (= (and b!912114 c!95734) b!912115))

(assert (= (and b!912114 (not c!95734)) b!912112))

(assert (= (or b!912115 b!912112) bm!40365))

(assert (=> b!912111 m!846067))

(assert (=> b!912111 m!846067))

(assert (=> b!912111 m!846073))

(assert (=> bm!40365 m!846067))

(declare-fun m!846135 () Bool)

(assert (=> bm!40365 m!846135))

(assert (=> b!912113 m!846067))

(assert (=> b!912113 m!846067))

(declare-fun m!846137 () Bool)

(assert (=> b!912113 m!846137))

(assert (=> b!912114 m!846067))

(assert (=> b!912114 m!846067))

(assert (=> b!912114 m!846073))

(assert (=> b!911941 d!112097))

(declare-fun b!912123 () Bool)

(declare-fun e!511640 () Bool)

(assert (=> b!912123 (= e!511640 tp_is_empty!19087)))

(declare-fun mapIsEmpty!30364 () Bool)

(declare-fun mapRes!30364 () Bool)

(assert (=> mapIsEmpty!30364 mapRes!30364))

(declare-fun mapNonEmpty!30364 () Bool)

(declare-fun tp!58297 () Bool)

(declare-fun e!511639 () Bool)

(assert (=> mapNonEmpty!30364 (= mapRes!30364 (and tp!58297 e!511639))))

(declare-fun mapKey!30364 () (_ BitVec 32))

(declare-fun mapValue!30364 () ValueCell!9062)

(declare-fun mapRest!30364 () (Array (_ BitVec 32) ValueCell!9062))

(assert (=> mapNonEmpty!30364 (= mapRest!30355 (store mapRest!30364 mapKey!30364 mapValue!30364))))

(declare-fun b!912122 () Bool)

(assert (=> b!912122 (= e!511639 tp_is_empty!19087)))

(declare-fun condMapEmpty!30364 () Bool)

(declare-fun mapDefault!30364 () ValueCell!9062)

(assert (=> mapNonEmpty!30355 (= condMapEmpty!30364 (= mapRest!30355 ((as const (Array (_ BitVec 32) ValueCell!9062)) mapDefault!30364)))))

(assert (=> mapNonEmpty!30355 (= tp!58282 (and e!511640 mapRes!30364))))

(assert (= (and mapNonEmpty!30355 condMapEmpty!30364) mapIsEmpty!30364))

(assert (= (and mapNonEmpty!30355 (not condMapEmpty!30364)) mapNonEmpty!30364))

(assert (= (and mapNonEmpty!30364 ((_ is ValueCellFull!9062) mapValue!30364)) b!912122))

(assert (= (and mapNonEmpty!30355 ((_ is ValueCellFull!9062) mapDefault!30364)) b!912123))

(declare-fun m!846139 () Bool)

(assert (=> mapNonEmpty!30364 m!846139))

(declare-fun b_lambda!13291 () Bool)

(assert (= b_lambda!13289 (or (and start!78140 b_free!16669) b_lambda!13291)))

(check-sat (not bm!40359) (not b!912009) (not b!912094) (not b!912065) (not b!912063) (not b!912111) (not b!912068) (not b!912061) (not b_lambda!13291) b_and!27223 (not d!112081) (not b!912057) (not b_next!16669) (not b!912085) (not b!912099) (not b!912062) (not b!912114) (not b!912088) (not bm!40354) (not d!112079) (not d!112095) (not bm!40358) (not b!912067) (not bm!40357) (not b!912113) tp_is_empty!19087 (not mapNonEmpty!30364) (not b!912011) (not bm!40362) (not b!912072) (not bm!40365))
(check-sat b_and!27223 (not b_next!16669))
