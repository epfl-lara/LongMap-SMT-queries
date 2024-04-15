; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40458 () Bool)

(assert start!40458)

(declare-fun b_free!10543 () Bool)

(declare-fun b_next!10543 () Bool)

(assert (=> start!40458 (= b_free!10543 (not b_next!10543))))

(declare-fun tp!37406 () Bool)

(declare-fun b_and!18501 () Bool)

(assert (=> start!40458 (= tp!37406 b_and!18501)))

(declare-fun b!445333 () Bool)

(declare-fun res!264294 () Bool)

(declare-fun e!261726 () Bool)

(assert (=> b!445333 (=> (not res!264294) (not e!261726))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445333 (= res!264294 (validMask!0 mask!1025))))

(declare-fun b!445334 () Bool)

(declare-fun res!264296 () Bool)

(assert (=> b!445334 (=> (not res!264296) (not e!261726))))

(declare-datatypes ((array!27525 0))(
  ( (array!27526 (arr!13210 (Array (_ BitVec 32) (_ BitVec 64))) (size!13563 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27525)

(declare-datatypes ((List!7902 0))(
  ( (Nil!7899) (Cons!7898 (h!8754 (_ BitVec 64)) (t!13651 List!7902)) )
))
(declare-fun arrayNoDuplicates!0 (array!27525 (_ BitVec 32) List!7902) Bool)

(assert (=> b!445334 (= res!264296 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7899))))

(declare-fun b!445335 () Bool)

(declare-fun e!261723 () Bool)

(declare-fun tp_is_empty!11857 () Bool)

(assert (=> b!445335 (= e!261723 tp_is_empty!11857)))

(declare-datatypes ((V!16915 0))(
  ( (V!16916 (val!5973 Int)) )
))
(declare-fun minValue!515 () V!16915)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55789 () Bool)

(declare-fun lt!203420 () array!27525)

(declare-datatypes ((tuple2!7854 0))(
  ( (tuple2!7855 (_1!3938 (_ BitVec 64)) (_2!3938 V!16915)) )
))
(declare-datatypes ((List!7903 0))(
  ( (Nil!7900) (Cons!7899 (h!8755 tuple2!7854) (t!13652 List!7903)) )
))
(declare-datatypes ((ListLongMap!6757 0))(
  ( (ListLongMap!6758 (toList!3394 List!7903)) )
))
(declare-fun call!29560 () ListLongMap!6757)

(declare-datatypes ((ValueCell!5585 0))(
  ( (ValueCellFull!5585 (v!8218 V!16915)) (EmptyCell!5585) )
))
(declare-datatypes ((array!27527 0))(
  ( (array!27528 (arr!13211 (Array (_ BitVec 32) ValueCell!5585)) (size!13564 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27527)

(declare-fun zeroValue!515 () V!16915)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!16915)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!29557 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1593 (array!27525 array!27527 (_ BitVec 32) (_ BitVec 32) V!16915 V!16915 (_ BitVec 32) Int) ListLongMap!6757)

(assert (=> bm!29557 (= call!29560 (getCurrentListMapNoExtraKeys!1593 (ite c!55789 lt!203420 _keys!709) (ite c!55789 (array!27528 (store (arr!13211 _values!549) i!563 (ValueCellFull!5585 v!412)) (size!13564 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445336 () Bool)

(declare-fun res!264302 () Bool)

(assert (=> b!445336 (=> (not res!264302) (not e!261726))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445336 (= res!264302 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445337 () Bool)

(declare-fun res!264304 () Bool)

(assert (=> b!445337 (=> (not res!264304) (not e!261726))))

(assert (=> b!445337 (= res!264304 (and (= (size!13564 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13563 _keys!709) (size!13564 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445338 () Bool)

(declare-fun res!264303 () Bool)

(assert (=> b!445338 (=> (not res!264303) (not e!261726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445338 (= res!264303 (validKeyInArray!0 k0!794))))

(declare-fun call!29561 () ListLongMap!6757)

(declare-fun e!261722 () Bool)

(declare-fun b!445339 () Bool)

(declare-fun +!1551 (ListLongMap!6757 tuple2!7854) ListLongMap!6757)

(assert (=> b!445339 (= e!261722 (= call!29560 (+!1551 call!29561 (tuple2!7855 k0!794 v!412))))))

(declare-fun res!264299 () Bool)

(assert (=> start!40458 (=> (not res!264299) (not e!261726))))

(assert (=> start!40458 (= res!264299 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13563 _keys!709))))))

(assert (=> start!40458 e!261726))

(assert (=> start!40458 tp_is_empty!11857))

(assert (=> start!40458 tp!37406))

(assert (=> start!40458 true))

(declare-fun e!261724 () Bool)

(declare-fun array_inv!9626 (array!27527) Bool)

(assert (=> start!40458 (and (array_inv!9626 _values!549) e!261724)))

(declare-fun array_inv!9627 (array!27525) Bool)

(assert (=> start!40458 (array_inv!9627 _keys!709)))

(declare-fun b!445332 () Bool)

(declare-fun e!261728 () Bool)

(declare-fun mapRes!19413 () Bool)

(assert (=> b!445332 (= e!261724 (and e!261728 mapRes!19413))))

(declare-fun condMapEmpty!19413 () Bool)

(declare-fun mapDefault!19413 () ValueCell!5585)

(assert (=> b!445332 (= condMapEmpty!19413 (= (arr!13211 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5585)) mapDefault!19413)))))

(declare-fun b!445340 () Bool)

(assert (=> b!445340 (= e!261728 tp_is_empty!11857)))

(declare-fun mapIsEmpty!19413 () Bool)

(assert (=> mapIsEmpty!19413 mapRes!19413))

(declare-fun b!445341 () Bool)

(declare-fun res!264298 () Bool)

(declare-fun e!261727 () Bool)

(assert (=> b!445341 (=> (not res!264298) (not e!261727))))

(assert (=> b!445341 (= res!264298 (arrayNoDuplicates!0 lt!203420 #b00000000000000000000000000000000 Nil!7899))))

(declare-fun bm!29558 () Bool)

(assert (=> bm!29558 (= call!29561 (getCurrentListMapNoExtraKeys!1593 (ite c!55789 _keys!709 lt!203420) (ite c!55789 _values!549 (array!27528 (store (arr!13211 _values!549) i!563 (ValueCellFull!5585 v!412)) (size!13564 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445342 () Bool)

(declare-fun res!264301 () Bool)

(assert (=> b!445342 (=> (not res!264301) (not e!261726))))

(assert (=> b!445342 (= res!264301 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13563 _keys!709))))))

(declare-fun b!445343 () Bool)

(assert (=> b!445343 (= e!261726 e!261727)))

(declare-fun res!264297 () Bool)

(assert (=> b!445343 (=> (not res!264297) (not e!261727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27525 (_ BitVec 32)) Bool)

(assert (=> b!445343 (= res!264297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203420 mask!1025))))

(assert (=> b!445343 (= lt!203420 (array!27526 (store (arr!13210 _keys!709) i!563 k0!794) (size!13563 _keys!709)))))

(declare-fun mapNonEmpty!19413 () Bool)

(declare-fun tp!37407 () Bool)

(assert (=> mapNonEmpty!19413 (= mapRes!19413 (and tp!37407 e!261723))))

(declare-fun mapValue!19413 () ValueCell!5585)

(declare-fun mapRest!19413 () (Array (_ BitVec 32) ValueCell!5585))

(declare-fun mapKey!19413 () (_ BitVec 32))

(assert (=> mapNonEmpty!19413 (= (arr!13211 _values!549) (store mapRest!19413 mapKey!19413 mapValue!19413))))

(declare-fun b!445344 () Bool)

(declare-fun res!264295 () Bool)

(assert (=> b!445344 (=> (not res!264295) (not e!261727))))

(assert (=> b!445344 (= res!264295 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13563 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445345 () Bool)

(declare-fun res!264300 () Bool)

(assert (=> b!445345 (=> (not res!264300) (not e!261726))))

(assert (=> b!445345 (= res!264300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445346 () Bool)

(declare-fun res!264293 () Bool)

(assert (=> b!445346 (=> (not res!264293) (not e!261726))))

(assert (=> b!445346 (= res!264293 (or (= (select (arr!13210 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13210 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445347 () Bool)

(assert (=> b!445347 (= e!261722 (= call!29561 call!29560))))

(declare-fun b!445348 () Bool)

(assert (=> b!445348 (= e!261727 (not true))))

(assert (=> b!445348 e!261722))

(assert (=> b!445348 (= c!55789 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13119 0))(
  ( (Unit!13120) )
))
(declare-fun lt!203419 () Unit!13119)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!688 (array!27525 array!27527 (_ BitVec 32) (_ BitVec 32) V!16915 V!16915 (_ BitVec 32) (_ BitVec 64) V!16915 (_ BitVec 32) Int) Unit!13119)

(assert (=> b!445348 (= lt!203419 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!688 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40458 res!264299) b!445333))

(assert (= (and b!445333 res!264294) b!445337))

(assert (= (and b!445337 res!264304) b!445345))

(assert (= (and b!445345 res!264300) b!445334))

(assert (= (and b!445334 res!264296) b!445342))

(assert (= (and b!445342 res!264301) b!445338))

(assert (= (and b!445338 res!264303) b!445346))

(assert (= (and b!445346 res!264293) b!445336))

(assert (= (and b!445336 res!264302) b!445343))

(assert (= (and b!445343 res!264297) b!445341))

(assert (= (and b!445341 res!264298) b!445344))

(assert (= (and b!445344 res!264295) b!445348))

(assert (= (and b!445348 c!55789) b!445339))

(assert (= (and b!445348 (not c!55789)) b!445347))

(assert (= (or b!445339 b!445347) bm!29557))

(assert (= (or b!445339 b!445347) bm!29558))

(assert (= (and b!445332 condMapEmpty!19413) mapIsEmpty!19413))

(assert (= (and b!445332 (not condMapEmpty!19413)) mapNonEmpty!19413))

(get-info :version)

(assert (= (and mapNonEmpty!19413 ((_ is ValueCellFull!5585) mapValue!19413)) b!445335))

(assert (= (and b!445332 ((_ is ValueCellFull!5585) mapDefault!19413)) b!445340))

(assert (= start!40458 b!445332))

(declare-fun m!430303 () Bool)

(assert (=> b!445341 m!430303))

(declare-fun m!430305 () Bool)

(assert (=> b!445334 m!430305))

(declare-fun m!430307 () Bool)

(assert (=> start!40458 m!430307))

(declare-fun m!430309 () Bool)

(assert (=> start!40458 m!430309))

(declare-fun m!430311 () Bool)

(assert (=> bm!29558 m!430311))

(declare-fun m!430313 () Bool)

(assert (=> bm!29558 m!430313))

(declare-fun m!430315 () Bool)

(assert (=> mapNonEmpty!19413 m!430315))

(declare-fun m!430317 () Bool)

(assert (=> b!445346 m!430317))

(declare-fun m!430319 () Bool)

(assert (=> b!445333 m!430319))

(declare-fun m!430321 () Bool)

(assert (=> b!445338 m!430321))

(declare-fun m!430323 () Bool)

(assert (=> b!445343 m!430323))

(declare-fun m!430325 () Bool)

(assert (=> b!445343 m!430325))

(declare-fun m!430327 () Bool)

(assert (=> b!445345 m!430327))

(assert (=> bm!29557 m!430311))

(declare-fun m!430329 () Bool)

(assert (=> bm!29557 m!430329))

(declare-fun m!430331 () Bool)

(assert (=> b!445336 m!430331))

(declare-fun m!430333 () Bool)

(assert (=> b!445348 m!430333))

(declare-fun m!430335 () Bool)

(assert (=> b!445339 m!430335))

(check-sat (not b!445348) (not mapNonEmpty!19413) (not b!445338) (not bm!29558) (not b!445341) (not b_next!10543) tp_is_empty!11857 (not b!445336) (not start!40458) (not b!445339) (not b!445334) b_and!18501 (not b!445345) (not b!445333) (not b!445343) (not bm!29557))
(check-sat b_and!18501 (not b_next!10543))
