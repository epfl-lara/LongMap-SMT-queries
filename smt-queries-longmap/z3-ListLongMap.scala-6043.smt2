; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78160 () Bool)

(assert start!78160)

(declare-fun b_free!16671 () Bool)

(declare-fun b_next!16671 () Bool)

(assert (=> start!78160 (= b_free!16671 (not b_next!16671))))

(declare-fun tp!58286 () Bool)

(declare-fun b_and!27245 () Bool)

(assert (=> start!78160 (= tp!58286 b_and!27245)))

(declare-fun mapNonEmpty!30358 () Bool)

(declare-fun mapRes!30358 () Bool)

(declare-fun tp!58287 () Bool)

(declare-fun e!511690 () Bool)

(assert (=> mapNonEmpty!30358 (= mapRes!30358 (and tp!58287 e!511690))))

(declare-datatypes ((V!30417 0))(
  ( (V!30418 (val!9595 Int)) )
))
(declare-datatypes ((ValueCell!9063 0))(
  ( (ValueCellFull!9063 (v!12105 V!30417)) (EmptyCell!9063) )
))
(declare-datatypes ((array!54172 0))(
  ( (array!54173 (arr!26041 (Array (_ BitVec 32) ValueCell!9063)) (size!26500 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54172)

(declare-fun mapValue!30358 () ValueCell!9063)

(declare-fun mapRest!30358 () (Array (_ BitVec 32) ValueCell!9063))

(declare-fun mapKey!30358 () (_ BitVec 32))

(assert (=> mapNonEmpty!30358 (= (arr!26041 _values!1152) (store mapRest!30358 mapKey!30358 mapValue!30358))))

(declare-fun b!912202 () Bool)

(declare-fun res!615369 () Bool)

(declare-fun e!511692 () Bool)

(assert (=> b!912202 (=> (not res!615369) (not e!511692))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54174 0))(
  ( (array!54175 (arr!26042 (Array (_ BitVec 32) (_ BitVec 64))) (size!26501 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54174)

(assert (=> b!912202 (= res!615369 (and (= (size!26500 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26501 _keys!1386) (size!26500 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912203 () Bool)

(declare-fun e!511691 () Bool)

(declare-fun e!511689 () Bool)

(assert (=> b!912203 (= e!511691 (and e!511689 mapRes!30358))))

(declare-fun condMapEmpty!30358 () Bool)

(declare-fun mapDefault!30358 () ValueCell!9063)

(assert (=> b!912203 (= condMapEmpty!30358 (= (arr!26041 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9063)) mapDefault!30358)))))

(declare-fun res!615366 () Bool)

(assert (=> start!78160 (=> (not res!615366) (not e!511692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78160 (= res!615366 (validMask!0 mask!1756))))

(assert (=> start!78160 e!511692))

(declare-fun array_inv!20348 (array!54172) Bool)

(assert (=> start!78160 (and (array_inv!20348 _values!1152) e!511691)))

(assert (=> start!78160 tp!58286))

(assert (=> start!78160 true))

(declare-fun tp_is_empty!19089 () Bool)

(assert (=> start!78160 tp_is_empty!19089))

(declare-fun array_inv!20349 (array!54174) Bool)

(assert (=> start!78160 (array_inv!20349 _keys!1386)))

(declare-fun b!912204 () Bool)

(declare-fun res!615371 () Bool)

(assert (=> b!912204 (=> (not res!615371) (not e!511692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54174 (_ BitVec 32)) Bool)

(assert (=> b!912204 (= res!615371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30358 () Bool)

(assert (=> mapIsEmpty!30358 mapRes!30358))

(declare-fun b!912205 () Bool)

(declare-fun res!615372 () Bool)

(assert (=> b!912205 (=> (not res!615372) (not e!511692))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!912205 (= res!615372 (and (= (select (arr!26042 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912206 () Bool)

(declare-fun res!615370 () Bool)

(assert (=> b!912206 (=> (not res!615370) (not e!511692))))

(declare-datatypes ((List!18292 0))(
  ( (Nil!18289) (Cons!18288 (h!19434 (_ BitVec 64)) (t!25879 List!18292)) )
))
(declare-fun arrayNoDuplicates!0 (array!54174 (_ BitVec 32) List!18292) Bool)

(assert (=> b!912206 (= res!615370 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18289))))

(declare-fun b!912207 () Bool)

(assert (=> b!912207 (= e!511690 tp_is_empty!19089)))

(declare-fun b!912208 () Bool)

(declare-fun res!615367 () Bool)

(assert (=> b!912208 (=> (not res!615367) (not e!511692))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912208 (= res!615367 (inRange!0 i!717 mask!1756))))

(declare-fun b!912209 () Bool)

(declare-fun res!615368 () Bool)

(assert (=> b!912209 (=> (not res!615368) (not e!511692))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30417)

(declare-fun minValue!1094 () V!30417)

(declare-datatypes ((tuple2!12502 0))(
  ( (tuple2!12503 (_1!6262 (_ BitVec 64)) (_2!6262 V!30417)) )
))
(declare-datatypes ((List!18293 0))(
  ( (Nil!18290) (Cons!18289 (h!19435 tuple2!12502) (t!25880 List!18293)) )
))
(declare-datatypes ((ListLongMap!11199 0))(
  ( (ListLongMap!11200 (toList!5615 List!18293)) )
))
(declare-fun contains!4660 (ListLongMap!11199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2877 (array!54174 array!54172 (_ BitVec 32) (_ BitVec 32) V!30417 V!30417 (_ BitVec 32) Int) ListLongMap!11199)

(assert (=> b!912209 (= res!615368 (contains!4660 (getCurrentListMap!2877 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912210 () Bool)

(assert (=> b!912210 (= e!511689 tp_is_empty!19089)))

(declare-fun b!912211 () Bool)

(assert (=> b!912211 (= e!511692 (not (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (size!26500 _values!1152)))))))

(declare-fun arrayContainsKey!0 (array!54174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912211 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30868 0))(
  ( (Unit!30869) )
))
(declare-fun lt!410567 () Unit!30868)

(declare-fun lemmaKeyInListMapIsInArray!260 (array!54174 array!54172 (_ BitVec 32) (_ BitVec 32) V!30417 V!30417 (_ BitVec 64) Int) Unit!30868)

(assert (=> b!912211 (= lt!410567 (lemmaKeyInListMapIsInArray!260 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!78160 res!615366) b!912202))

(assert (= (and b!912202 res!615369) b!912204))

(assert (= (and b!912204 res!615371) b!912206))

(assert (= (and b!912206 res!615370) b!912209))

(assert (= (and b!912209 res!615368) b!912208))

(assert (= (and b!912208 res!615367) b!912205))

(assert (= (and b!912205 res!615372) b!912211))

(assert (= (and b!912203 condMapEmpty!30358) mapIsEmpty!30358))

(assert (= (and b!912203 (not condMapEmpty!30358)) mapNonEmpty!30358))

(get-info :version)

(assert (= (and mapNonEmpty!30358 ((_ is ValueCellFull!9063) mapValue!30358)) b!912207))

(assert (= (and b!912203 ((_ is ValueCellFull!9063) mapDefault!30358)) b!912210))

(assert (= start!78160 b!912203))

(declare-fun m!846767 () Bool)

(assert (=> mapNonEmpty!30358 m!846767))

(declare-fun m!846769 () Bool)

(assert (=> start!78160 m!846769))

(declare-fun m!846771 () Bool)

(assert (=> start!78160 m!846771))

(declare-fun m!846773 () Bool)

(assert (=> start!78160 m!846773))

(declare-fun m!846775 () Bool)

(assert (=> b!912209 m!846775))

(assert (=> b!912209 m!846775))

(declare-fun m!846777 () Bool)

(assert (=> b!912209 m!846777))

(declare-fun m!846779 () Bool)

(assert (=> b!912206 m!846779))

(declare-fun m!846781 () Bool)

(assert (=> b!912205 m!846781))

(declare-fun m!846783 () Bool)

(assert (=> b!912204 m!846783))

(declare-fun m!846785 () Bool)

(assert (=> b!912211 m!846785))

(declare-fun m!846787 () Bool)

(assert (=> b!912211 m!846787))

(declare-fun m!846789 () Bool)

(assert (=> b!912208 m!846789))

(check-sat (not b!912208) (not b!912211) (not mapNonEmpty!30358) (not start!78160) b_and!27245 (not b!912209) (not b!912206) tp_is_empty!19089 (not b_next!16671) (not b!912204))
(check-sat b_and!27245 (not b_next!16671))
(get-model)

(declare-fun d!112277 () Bool)

(declare-fun e!511713 () Bool)

(assert (=> d!112277 e!511713))

(declare-fun res!615396 () Bool)

(assert (=> d!112277 (=> res!615396 e!511713)))

(declare-fun lt!410579 () Bool)

(assert (=> d!112277 (= res!615396 (not lt!410579))))

(declare-fun lt!410582 () Bool)

(assert (=> d!112277 (= lt!410579 lt!410582)))

(declare-fun lt!410580 () Unit!30868)

(declare-fun e!511712 () Unit!30868)

(assert (=> d!112277 (= lt!410580 e!511712)))

(declare-fun c!95772 () Bool)

(assert (=> d!112277 (= c!95772 lt!410582)))

(declare-fun containsKey!440 (List!18293 (_ BitVec 64)) Bool)

(assert (=> d!112277 (= lt!410582 (containsKey!440 (toList!5615 (getCurrentListMap!2877 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112277 (= (contains!4660 (getCurrentListMap!2877 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410579)))

(declare-fun b!912248 () Bool)

(declare-fun lt!410581 () Unit!30868)

(assert (=> b!912248 (= e!511712 lt!410581)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!336 (List!18293 (_ BitVec 64)) Unit!30868)

(assert (=> b!912248 (= lt!410581 (lemmaContainsKeyImpliesGetValueByKeyDefined!336 (toList!5615 (getCurrentListMap!2877 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!479 0))(
  ( (Some!478 (v!12107 V!30417)) (None!477) )
))
(declare-fun isDefined!345 (Option!479) Bool)

(declare-fun getValueByKey!473 (List!18293 (_ BitVec 64)) Option!479)

(assert (=> b!912248 (isDefined!345 (getValueByKey!473 (toList!5615 (getCurrentListMap!2877 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!912249 () Bool)

(declare-fun Unit!30870 () Unit!30868)

(assert (=> b!912249 (= e!511712 Unit!30870)))

(declare-fun b!912250 () Bool)

(assert (=> b!912250 (= e!511713 (isDefined!345 (getValueByKey!473 (toList!5615 (getCurrentListMap!2877 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112277 c!95772) b!912248))

(assert (= (and d!112277 (not c!95772)) b!912249))

(assert (= (and d!112277 (not res!615396)) b!912250))

(declare-fun m!846815 () Bool)

(assert (=> d!112277 m!846815))

(declare-fun m!846817 () Bool)

(assert (=> b!912248 m!846817))

(declare-fun m!846819 () Bool)

(assert (=> b!912248 m!846819))

(assert (=> b!912248 m!846819))

(declare-fun m!846821 () Bool)

(assert (=> b!912248 m!846821))

(assert (=> b!912250 m!846819))

(assert (=> b!912250 m!846819))

(assert (=> b!912250 m!846821))

(assert (=> b!912209 d!112277))

(declare-fun bm!40379 () Bool)

(declare-fun call!40387 () ListLongMap!11199)

(declare-fun call!40388 () ListLongMap!11199)

(assert (=> bm!40379 (= call!40387 call!40388)))

(declare-fun b!912293 () Bool)

(declare-fun e!511747 () ListLongMap!11199)

(declare-fun call!40385 () ListLongMap!11199)

(assert (=> b!912293 (= e!511747 call!40385)))

(declare-fun b!912294 () Bool)

(declare-fun e!511751 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!912294 (= e!511751 (validKeyInArray!0 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40380 () Bool)

(assert (=> bm!40380 (= call!40385 call!40387)))

(declare-fun bm!40381 () Bool)

(declare-fun call!40383 () Bool)

(declare-fun lt!410639 () ListLongMap!11199)

(assert (=> bm!40381 (= call!40383 (contains!4660 lt!410639 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!112279 () Bool)

(declare-fun e!511740 () Bool)

(assert (=> d!112279 e!511740))

(declare-fun res!615420 () Bool)

(assert (=> d!112279 (=> (not res!615420) (not e!511740))))

(assert (=> d!112279 (= res!615420 (or (bvsge #b00000000000000000000000000000000 (size!26501 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26501 _keys!1386)))))))

(declare-fun lt!410647 () ListLongMap!11199)

(assert (=> d!112279 (= lt!410639 lt!410647)))

(declare-fun lt!410637 () Unit!30868)

(declare-fun e!511742 () Unit!30868)

(assert (=> d!112279 (= lt!410637 e!511742)))

(declare-fun c!95790 () Bool)

(assert (=> d!112279 (= c!95790 e!511751)))

(declare-fun res!615422 () Bool)

(assert (=> d!112279 (=> (not res!615422) (not e!511751))))

(assert (=> d!112279 (= res!615422 (bvslt #b00000000000000000000000000000000 (size!26501 _keys!1386)))))

(declare-fun e!511750 () ListLongMap!11199)

(assert (=> d!112279 (= lt!410647 e!511750)))

(declare-fun c!95787 () Bool)

(assert (=> d!112279 (= c!95787 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112279 (validMask!0 mask!1756)))

(assert (=> d!112279 (= (getCurrentListMap!2877 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410639)))

(declare-fun b!912295 () Bool)

(declare-fun e!511741 () Bool)

(declare-fun e!511746 () Bool)

(assert (=> b!912295 (= e!511741 e!511746)))

(declare-fun res!615415 () Bool)

(assert (=> b!912295 (= res!615415 call!40383)))

(assert (=> b!912295 (=> (not res!615415) (not e!511746))))

(declare-fun e!511748 () Bool)

(declare-fun b!912296 () Bool)

(declare-fun apply!514 (ListLongMap!11199 (_ BitVec 64)) V!30417)

(declare-fun get!13677 (ValueCell!9063 V!30417) V!30417)

(declare-fun dynLambda!1390 (Int (_ BitVec 64)) V!30417)

(assert (=> b!912296 (= e!511748 (= (apply!514 lt!410639 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000)) (get!13677 (select (arr!26041 _values!1152) #b00000000000000000000000000000000) (dynLambda!1390 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!912296 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26500 _values!1152)))))

(assert (=> b!912296 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26501 _keys!1386)))))

(declare-fun b!912297 () Bool)

(declare-fun res!615418 () Bool)

(assert (=> b!912297 (=> (not res!615418) (not e!511740))))

(declare-fun e!511752 () Bool)

(assert (=> b!912297 (= res!615418 e!511752)))

(declare-fun res!615416 () Bool)

(assert (=> b!912297 (=> res!615416 e!511752)))

(declare-fun e!511749 () Bool)

(assert (=> b!912297 (= res!615416 (not e!511749))))

(declare-fun res!615423 () Bool)

(assert (=> b!912297 (=> (not res!615423) (not e!511749))))

(assert (=> b!912297 (= res!615423 (bvslt #b00000000000000000000000000000000 (size!26501 _keys!1386)))))

(declare-fun b!912298 () Bool)

(assert (=> b!912298 (= e!511749 (validKeyInArray!0 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912299 () Bool)

(declare-fun lt!410642 () Unit!30868)

(assert (=> b!912299 (= e!511742 lt!410642)))

(declare-fun lt!410638 () ListLongMap!11199)

(declare-fun getCurrentListMapNoExtraKeys!3293 (array!54174 array!54172 (_ BitVec 32) (_ BitVec 32) V!30417 V!30417 (_ BitVec 32) Int) ListLongMap!11199)

(assert (=> b!912299 (= lt!410638 (getCurrentListMapNoExtraKeys!3293 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410629 () (_ BitVec 64))

(assert (=> b!912299 (= lt!410629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410633 () (_ BitVec 64))

(assert (=> b!912299 (= lt!410633 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410631 () Unit!30868)

(declare-fun addStillContains!347 (ListLongMap!11199 (_ BitVec 64) V!30417 (_ BitVec 64)) Unit!30868)

(assert (=> b!912299 (= lt!410631 (addStillContains!347 lt!410638 lt!410629 zeroValue!1094 lt!410633))))

(declare-fun +!2606 (ListLongMap!11199 tuple2!12502) ListLongMap!11199)

(assert (=> b!912299 (contains!4660 (+!2606 lt!410638 (tuple2!12503 lt!410629 zeroValue!1094)) lt!410633)))

(declare-fun lt!410636 () Unit!30868)

(assert (=> b!912299 (= lt!410636 lt!410631)))

(declare-fun lt!410643 () ListLongMap!11199)

(assert (=> b!912299 (= lt!410643 (getCurrentListMapNoExtraKeys!3293 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410628 () (_ BitVec 64))

(assert (=> b!912299 (= lt!410628 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410644 () (_ BitVec 64))

(assert (=> b!912299 (= lt!410644 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410627 () Unit!30868)

(declare-fun addApplyDifferent!347 (ListLongMap!11199 (_ BitVec 64) V!30417 (_ BitVec 64)) Unit!30868)

(assert (=> b!912299 (= lt!410627 (addApplyDifferent!347 lt!410643 lt!410628 minValue!1094 lt!410644))))

(assert (=> b!912299 (= (apply!514 (+!2606 lt!410643 (tuple2!12503 lt!410628 minValue!1094)) lt!410644) (apply!514 lt!410643 lt!410644))))

(declare-fun lt!410645 () Unit!30868)

(assert (=> b!912299 (= lt!410645 lt!410627)))

(declare-fun lt!410646 () ListLongMap!11199)

(assert (=> b!912299 (= lt!410646 (getCurrentListMapNoExtraKeys!3293 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410632 () (_ BitVec 64))

(assert (=> b!912299 (= lt!410632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410630 () (_ BitVec 64))

(assert (=> b!912299 (= lt!410630 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410635 () Unit!30868)

(assert (=> b!912299 (= lt!410635 (addApplyDifferent!347 lt!410646 lt!410632 zeroValue!1094 lt!410630))))

(assert (=> b!912299 (= (apply!514 (+!2606 lt!410646 (tuple2!12503 lt!410632 zeroValue!1094)) lt!410630) (apply!514 lt!410646 lt!410630))))

(declare-fun lt!410640 () Unit!30868)

(assert (=> b!912299 (= lt!410640 lt!410635)))

(declare-fun lt!410634 () ListLongMap!11199)

(assert (=> b!912299 (= lt!410634 (getCurrentListMapNoExtraKeys!3293 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410648 () (_ BitVec 64))

(assert (=> b!912299 (= lt!410648 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410641 () (_ BitVec 64))

(assert (=> b!912299 (= lt!410641 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!912299 (= lt!410642 (addApplyDifferent!347 lt!410634 lt!410648 minValue!1094 lt!410641))))

(assert (=> b!912299 (= (apply!514 (+!2606 lt!410634 (tuple2!12503 lt!410648 minValue!1094)) lt!410641) (apply!514 lt!410634 lt!410641))))

(declare-fun b!912300 () Bool)

(declare-fun e!511744 () Bool)

(assert (=> b!912300 (= e!511740 e!511744)))

(declare-fun c!95789 () Bool)

(assert (=> b!912300 (= c!95789 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!912301 () Bool)

(declare-fun c!95785 () Bool)

(assert (=> b!912301 (= c!95785 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!511745 () ListLongMap!11199)

(assert (=> b!912301 (= e!511745 e!511747)))

(declare-fun call!40382 () ListLongMap!11199)

(declare-fun c!95788 () Bool)

(declare-fun bm!40382 () Bool)

(assert (=> bm!40382 (= call!40382 (+!2606 (ite c!95787 call!40388 (ite c!95788 call!40387 call!40385)) (ite (or c!95787 c!95788) (tuple2!12503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!912302 () Bool)

(declare-fun call!40386 () ListLongMap!11199)

(assert (=> b!912302 (= e!511745 call!40386)))

(declare-fun bm!40383 () Bool)

(assert (=> bm!40383 (= call!40386 call!40382)))

(declare-fun b!912303 () Bool)

(assert (=> b!912303 (= e!511752 e!511748)))

(declare-fun res!615421 () Bool)

(assert (=> b!912303 (=> (not res!615421) (not e!511748))))

(assert (=> b!912303 (= res!615421 (contains!4660 lt!410639 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!912303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26501 _keys!1386)))))

(declare-fun b!912304 () Bool)

(assert (=> b!912304 (= e!511750 (+!2606 call!40382 (tuple2!12503 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!912305 () Bool)

(declare-fun e!511743 () Bool)

(assert (=> b!912305 (= e!511744 e!511743)))

(declare-fun res!615417 () Bool)

(declare-fun call!40384 () Bool)

(assert (=> b!912305 (= res!615417 call!40384)))

(assert (=> b!912305 (=> (not res!615417) (not e!511743))))

(declare-fun b!912306 () Bool)

(assert (=> b!912306 (= e!511743 (= (apply!514 lt!410639 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!912307 () Bool)

(assert (=> b!912307 (= e!511741 (not call!40383))))

(declare-fun bm!40384 () Bool)

(assert (=> bm!40384 (= call!40388 (getCurrentListMapNoExtraKeys!3293 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!912308 () Bool)

(declare-fun Unit!30871 () Unit!30868)

(assert (=> b!912308 (= e!511742 Unit!30871)))

(declare-fun bm!40385 () Bool)

(assert (=> bm!40385 (= call!40384 (contains!4660 lt!410639 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!912309 () Bool)

(assert (=> b!912309 (= e!511747 call!40386)))

(declare-fun b!912310 () Bool)

(assert (=> b!912310 (= e!511746 (= (apply!514 lt!410639 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!912311 () Bool)

(declare-fun res!615419 () Bool)

(assert (=> b!912311 (=> (not res!615419) (not e!511740))))

(assert (=> b!912311 (= res!615419 e!511741)))

(declare-fun c!95786 () Bool)

(assert (=> b!912311 (= c!95786 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!912312 () Bool)

(assert (=> b!912312 (= e!511750 e!511745)))

(assert (=> b!912312 (= c!95788 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!912313 () Bool)

(assert (=> b!912313 (= e!511744 (not call!40384))))

(assert (= (and d!112279 c!95787) b!912304))

(assert (= (and d!112279 (not c!95787)) b!912312))

(assert (= (and b!912312 c!95788) b!912302))

(assert (= (and b!912312 (not c!95788)) b!912301))

(assert (= (and b!912301 c!95785) b!912309))

(assert (= (and b!912301 (not c!95785)) b!912293))

(assert (= (or b!912309 b!912293) bm!40380))

(assert (= (or b!912302 bm!40380) bm!40379))

(assert (= (or b!912302 b!912309) bm!40383))

(assert (= (or b!912304 bm!40379) bm!40384))

(assert (= (or b!912304 bm!40383) bm!40382))

(assert (= (and d!112279 res!615422) b!912294))

(assert (= (and d!112279 c!95790) b!912299))

(assert (= (and d!112279 (not c!95790)) b!912308))

(assert (= (and d!112279 res!615420) b!912297))

(assert (= (and b!912297 res!615423) b!912298))

(assert (= (and b!912297 (not res!615416)) b!912303))

(assert (= (and b!912303 res!615421) b!912296))

(assert (= (and b!912297 res!615418) b!912311))

(assert (= (and b!912311 c!95786) b!912295))

(assert (= (and b!912311 (not c!95786)) b!912307))

(assert (= (and b!912295 res!615415) b!912310))

(assert (= (or b!912295 b!912307) bm!40381))

(assert (= (and b!912311 res!615419) b!912300))

(assert (= (and b!912300 c!95789) b!912305))

(assert (= (and b!912300 (not c!95789)) b!912313))

(assert (= (and b!912305 res!615417) b!912306))

(assert (= (or b!912305 b!912313) bm!40385))

(declare-fun b_lambda!13307 () Bool)

(assert (=> (not b_lambda!13307) (not b!912296)))

(declare-fun t!25882 () Bool)

(declare-fun tb!5439 () Bool)

(assert (=> (and start!78160 (= defaultEntry!1160 defaultEntry!1160) t!25882) tb!5439))

(declare-fun result!10681 () Bool)

(assert (=> tb!5439 (= result!10681 tp_is_empty!19089)))

(assert (=> b!912296 t!25882))

(declare-fun b_and!27249 () Bool)

(assert (= b_and!27245 (and (=> t!25882 result!10681) b_and!27249)))

(declare-fun m!846823 () Bool)

(assert (=> bm!40385 m!846823))

(declare-fun m!846825 () Bool)

(assert (=> bm!40384 m!846825))

(declare-fun m!846827 () Bool)

(assert (=> bm!40382 m!846827))

(declare-fun m!846829 () Bool)

(assert (=> b!912303 m!846829))

(assert (=> b!912303 m!846829))

(declare-fun m!846831 () Bool)

(assert (=> b!912303 m!846831))

(declare-fun m!846833 () Bool)

(assert (=> b!912304 m!846833))

(declare-fun m!846835 () Bool)

(assert (=> bm!40381 m!846835))

(declare-fun m!846837 () Bool)

(assert (=> b!912296 m!846837))

(assert (=> b!912296 m!846829))

(declare-fun m!846839 () Bool)

(assert (=> b!912296 m!846839))

(assert (=> b!912296 m!846829))

(declare-fun m!846841 () Bool)

(assert (=> b!912296 m!846841))

(assert (=> b!912296 m!846839))

(assert (=> b!912296 m!846837))

(declare-fun m!846843 () Bool)

(assert (=> b!912296 m!846843))

(declare-fun m!846845 () Bool)

(assert (=> b!912310 m!846845))

(declare-fun m!846847 () Bool)

(assert (=> b!912299 m!846847))

(declare-fun m!846849 () Bool)

(assert (=> b!912299 m!846849))

(declare-fun m!846851 () Bool)

(assert (=> b!912299 m!846851))

(declare-fun m!846853 () Bool)

(assert (=> b!912299 m!846853))

(declare-fun m!846855 () Bool)

(assert (=> b!912299 m!846855))

(declare-fun m!846857 () Bool)

(assert (=> b!912299 m!846857))

(declare-fun m!846859 () Bool)

(assert (=> b!912299 m!846859))

(declare-fun m!846861 () Bool)

(assert (=> b!912299 m!846861))

(assert (=> b!912299 m!846849))

(assert (=> b!912299 m!846829))

(assert (=> b!912299 m!846853))

(declare-fun m!846863 () Bool)

(assert (=> b!912299 m!846863))

(declare-fun m!846865 () Bool)

(assert (=> b!912299 m!846865))

(declare-fun m!846867 () Bool)

(assert (=> b!912299 m!846867))

(declare-fun m!846869 () Bool)

(assert (=> b!912299 m!846869))

(declare-fun m!846871 () Bool)

(assert (=> b!912299 m!846871))

(assert (=> b!912299 m!846825))

(declare-fun m!846873 () Bool)

(assert (=> b!912299 m!846873))

(assert (=> b!912299 m!846857))

(assert (=> b!912299 m!846865))

(declare-fun m!846875 () Bool)

(assert (=> b!912299 m!846875))

(assert (=> b!912298 m!846829))

(assert (=> b!912298 m!846829))

(declare-fun m!846877 () Bool)

(assert (=> b!912298 m!846877))

(declare-fun m!846879 () Bool)

(assert (=> b!912306 m!846879))

(assert (=> d!112279 m!846769))

(assert (=> b!912294 m!846829))

(assert (=> b!912294 m!846829))

(assert (=> b!912294 m!846877))

(assert (=> b!912209 d!112279))

(declare-fun d!112281 () Bool)

(assert (=> d!112281 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!912208 d!112281))

(declare-fun bm!40388 () Bool)

(declare-fun call!40391 () Bool)

(assert (=> bm!40388 (= call!40391 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!912324 () Bool)

(declare-fun e!511761 () Bool)

(declare-fun e!511760 () Bool)

(assert (=> b!912324 (= e!511761 e!511760)))

(declare-fun lt!410657 () (_ BitVec 64))

(assert (=> b!912324 (= lt!410657 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410656 () Unit!30868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54174 (_ BitVec 64) (_ BitVec 32)) Unit!30868)

(assert (=> b!912324 (= lt!410656 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410657 #b00000000000000000000000000000000))))

(assert (=> b!912324 (arrayContainsKey!0 _keys!1386 lt!410657 #b00000000000000000000000000000000)))

(declare-fun lt!410655 () Unit!30868)

(assert (=> b!912324 (= lt!410655 lt!410656)))

(declare-fun res!615429 () Bool)

(declare-datatypes ((SeekEntryResult!8967 0))(
  ( (MissingZero!8967 (index!38239 (_ BitVec 32))) (Found!8967 (index!38240 (_ BitVec 32))) (Intermediate!8967 (undefined!9779 Bool) (index!38241 (_ BitVec 32)) (x!78036 (_ BitVec 32))) (Undefined!8967) (MissingVacant!8967 (index!38242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54174 (_ BitVec 32)) SeekEntryResult!8967)

(assert (=> b!912324 (= res!615429 (= (seekEntryOrOpen!0 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8967 #b00000000000000000000000000000000)))))

(assert (=> b!912324 (=> (not res!615429) (not e!511760))))

(declare-fun b!912325 () Bool)

(assert (=> b!912325 (= e!511761 call!40391)))

(declare-fun d!112283 () Bool)

(declare-fun res!615428 () Bool)

(declare-fun e!511759 () Bool)

(assert (=> d!112283 (=> res!615428 e!511759)))

(assert (=> d!112283 (= res!615428 (bvsge #b00000000000000000000000000000000 (size!26501 _keys!1386)))))

(assert (=> d!112283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!511759)))

(declare-fun b!912326 () Bool)

(assert (=> b!912326 (= e!511759 e!511761)))

(declare-fun c!95793 () Bool)

(assert (=> b!912326 (= c!95793 (validKeyInArray!0 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!912327 () Bool)

(assert (=> b!912327 (= e!511760 call!40391)))

(assert (= (and d!112283 (not res!615428)) b!912326))

(assert (= (and b!912326 c!95793) b!912324))

(assert (= (and b!912326 (not c!95793)) b!912325))

(assert (= (and b!912324 res!615429) b!912327))

(assert (= (or b!912327 b!912325) bm!40388))

(declare-fun m!846881 () Bool)

(assert (=> bm!40388 m!846881))

(assert (=> b!912324 m!846829))

(declare-fun m!846883 () Bool)

(assert (=> b!912324 m!846883))

(declare-fun m!846885 () Bool)

(assert (=> b!912324 m!846885))

(assert (=> b!912324 m!846829))

(declare-fun m!846887 () Bool)

(assert (=> b!912324 m!846887))

(assert (=> b!912326 m!846829))

(assert (=> b!912326 m!846829))

(assert (=> b!912326 m!846877))

(assert (=> b!912204 d!112283))

(declare-fun b!912338 () Bool)

(declare-fun e!511772 () Bool)

(declare-fun call!40394 () Bool)

(assert (=> b!912338 (= e!511772 call!40394)))

(declare-fun b!912339 () Bool)

(declare-fun e!511773 () Bool)

(declare-fun contains!4661 (List!18292 (_ BitVec 64)) Bool)

(assert (=> b!912339 (= e!511773 (contains!4661 Nil!18289 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112285 () Bool)

(declare-fun res!615437 () Bool)

(declare-fun e!511770 () Bool)

(assert (=> d!112285 (=> res!615437 e!511770)))

(assert (=> d!112285 (= res!615437 (bvsge #b00000000000000000000000000000000 (size!26501 _keys!1386)))))

(assert (=> d!112285 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18289) e!511770)))

(declare-fun b!912340 () Bool)

(declare-fun e!511771 () Bool)

(assert (=> b!912340 (= e!511771 e!511772)))

(declare-fun c!95796 () Bool)

(assert (=> b!912340 (= c!95796 (validKeyInArray!0 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40391 () Bool)

(assert (=> bm!40391 (= call!40394 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95796 (Cons!18288 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000) Nil!18289) Nil!18289)))))

(declare-fun b!912341 () Bool)

(assert (=> b!912341 (= e!511772 call!40394)))

(declare-fun b!912342 () Bool)

(assert (=> b!912342 (= e!511770 e!511771)))

(declare-fun res!615436 () Bool)

(assert (=> b!912342 (=> (not res!615436) (not e!511771))))

(assert (=> b!912342 (= res!615436 (not e!511773))))

(declare-fun res!615438 () Bool)

(assert (=> b!912342 (=> (not res!615438) (not e!511773))))

(assert (=> b!912342 (= res!615438 (validKeyInArray!0 (select (arr!26042 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112285 (not res!615437)) b!912342))

(assert (= (and b!912342 res!615438) b!912339))

(assert (= (and b!912342 res!615436) b!912340))

(assert (= (and b!912340 c!95796) b!912338))

(assert (= (and b!912340 (not c!95796)) b!912341))

(assert (= (or b!912338 b!912341) bm!40391))

(assert (=> b!912339 m!846829))

(assert (=> b!912339 m!846829))

(declare-fun m!846889 () Bool)

(assert (=> b!912339 m!846889))

(assert (=> b!912340 m!846829))

(assert (=> b!912340 m!846829))

(assert (=> b!912340 m!846877))

(assert (=> bm!40391 m!846829))

(declare-fun m!846891 () Bool)

(assert (=> bm!40391 m!846891))

(assert (=> b!912342 m!846829))

(assert (=> b!912342 m!846829))

(assert (=> b!912342 m!846877))

(assert (=> b!912206 d!112285))

(declare-fun d!112287 () Bool)

(assert (=> d!112287 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78160 d!112287))

(declare-fun d!112289 () Bool)

(assert (=> d!112289 (= (array_inv!20348 _values!1152) (bvsge (size!26500 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78160 d!112289))

(declare-fun d!112291 () Bool)

(assert (=> d!112291 (= (array_inv!20349 _keys!1386) (bvsge (size!26501 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78160 d!112291))

(declare-fun d!112293 () Bool)

(declare-fun res!615443 () Bool)

(declare-fun e!511778 () Bool)

(assert (=> d!112293 (=> res!615443 e!511778)))

(assert (=> d!112293 (= res!615443 (= (select (arr!26042 _keys!1386) #b00000000000000000000000000000000) k0!1033))))

(assert (=> d!112293 (= (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000) e!511778)))

(declare-fun b!912347 () Bool)

(declare-fun e!511779 () Bool)

(assert (=> b!912347 (= e!511778 e!511779)))

(declare-fun res!615444 () Bool)

(assert (=> b!912347 (=> (not res!615444) (not e!511779))))

(assert (=> b!912347 (= res!615444 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!26501 _keys!1386)))))

(declare-fun b!912348 () Bool)

(assert (=> b!912348 (= e!511779 (arrayContainsKey!0 _keys!1386 k0!1033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112293 (not res!615443)) b!912347))

(assert (= (and b!912347 res!615444) b!912348))

(assert (=> d!112293 m!846829))

(declare-fun m!846893 () Bool)

(assert (=> b!912348 m!846893))

(assert (=> b!912211 d!112293))

(declare-fun d!112295 () Bool)

(declare-fun e!511782 () Bool)

(assert (=> d!112295 e!511782))

(declare-fun c!95799 () Bool)

(assert (=> d!112295 (= c!95799 (and (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!410660 () Unit!30868)

(declare-fun choose!1529 (array!54174 array!54172 (_ BitVec 32) (_ BitVec 32) V!30417 V!30417 (_ BitVec 64) Int) Unit!30868)

(assert (=> d!112295 (= lt!410660 (choose!1529 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (=> d!112295 (validMask!0 mask!1756)))

(assert (=> d!112295 (= (lemmaKeyInListMapIsInArray!260 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160) lt!410660)))

(declare-fun b!912353 () Bool)

(assert (=> b!912353 (= e!511782 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000))))

(declare-fun b!912354 () Bool)

(assert (=> b!912354 (= e!511782 (ite (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!112295 c!95799) b!912353))

(assert (= (and d!112295 (not c!95799)) b!912354))

(declare-fun m!846895 () Bool)

(assert (=> d!112295 m!846895))

(assert (=> d!112295 m!846769))

(assert (=> b!912353 m!846785))

(assert (=> b!912211 d!112295))

(declare-fun condMapEmpty!30364 () Bool)

(declare-fun mapDefault!30364 () ValueCell!9063)

(assert (=> mapNonEmpty!30358 (= condMapEmpty!30364 (= mapRest!30358 ((as const (Array (_ BitVec 32) ValueCell!9063)) mapDefault!30364)))))

(declare-fun e!511788 () Bool)

(declare-fun mapRes!30364 () Bool)

(assert (=> mapNonEmpty!30358 (= tp!58287 (and e!511788 mapRes!30364))))

(declare-fun b!912361 () Bool)

(declare-fun e!511787 () Bool)

(assert (=> b!912361 (= e!511787 tp_is_empty!19089)))

(declare-fun mapNonEmpty!30364 () Bool)

(declare-fun tp!58296 () Bool)

(assert (=> mapNonEmpty!30364 (= mapRes!30364 (and tp!58296 e!511787))))

(declare-fun mapValue!30364 () ValueCell!9063)

(declare-fun mapRest!30364 () (Array (_ BitVec 32) ValueCell!9063))

(declare-fun mapKey!30364 () (_ BitVec 32))

(assert (=> mapNonEmpty!30364 (= mapRest!30358 (store mapRest!30364 mapKey!30364 mapValue!30364))))

(declare-fun b!912362 () Bool)

(assert (=> b!912362 (= e!511788 tp_is_empty!19089)))

(declare-fun mapIsEmpty!30364 () Bool)

(assert (=> mapIsEmpty!30364 mapRes!30364))

(assert (= (and mapNonEmpty!30358 condMapEmpty!30364) mapIsEmpty!30364))

(assert (= (and mapNonEmpty!30358 (not condMapEmpty!30364)) mapNonEmpty!30364))

(assert (= (and mapNonEmpty!30364 ((_ is ValueCellFull!9063) mapValue!30364)) b!912361))

(assert (= (and mapNonEmpty!30358 ((_ is ValueCellFull!9063) mapDefault!30364)) b!912362))

(declare-fun m!846897 () Bool)

(assert (=> mapNonEmpty!30364 m!846897))

(declare-fun b_lambda!13309 () Bool)

(assert (= b_lambda!13307 (or (and start!78160 b_free!16671) b_lambda!13309)))

(check-sat (not d!112279) (not b!912339) (not b!912303) (not b!912326) (not b!912306) (not mapNonEmpty!30364) (not d!112277) (not b_lambda!13309) (not b!912250) (not bm!40384) tp_is_empty!19089 (not b!912348) (not bm!40388) (not b!912310) (not b!912304) (not b!912298) (not b!912248) (not b!912296) (not b!912340) b_and!27249 (not b!912342) (not b!912294) (not bm!40391) (not bm!40382) (not bm!40381) (not d!112295) (not b_next!16671) (not b!912324) (not b!912353) (not b!912299) (not bm!40385))
(check-sat b_and!27249 (not b_next!16671))
