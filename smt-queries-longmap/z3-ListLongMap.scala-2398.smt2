; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37942 () Bool)

(assert start!37942)

(declare-fun b_free!8955 () Bool)

(declare-fun b_next!8955 () Bool)

(assert (=> start!37942 (= b_free!8955 (not b_next!8955))))

(declare-fun tp!31629 () Bool)

(declare-fun b_and!16245 () Bool)

(assert (=> start!37942 (= tp!31629 b_and!16245)))

(declare-fun b!390292 () Bool)

(declare-fun e!236418 () Bool)

(declare-fun e!236422 () Bool)

(assert (=> b!390292 (= e!236418 (not e!236422))))

(declare-fun res!223349 () Bool)

(assert (=> b!390292 (=> res!223349 e!236422)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390292 (= res!223349 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13941 0))(
  ( (V!13942 (val!4858 Int)) )
))
(declare-datatypes ((ValueCell!4470 0))(
  ( (ValueCellFull!4470 (v!7071 V!13941)) (EmptyCell!4470) )
))
(declare-datatypes ((array!23151 0))(
  ( (array!23152 (arr!11040 (Array (_ BitVec 32) ValueCell!4470)) (size!11392 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23151)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13941)

(declare-datatypes ((array!23153 0))(
  ( (array!23154 (arr!11041 (Array (_ BitVec 32) (_ BitVec 64))) (size!11393 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23153)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13941)

(declare-datatypes ((tuple2!6536 0))(
  ( (tuple2!6537 (_1!3279 (_ BitVec 64)) (_2!3279 V!13941)) )
))
(declare-datatypes ((List!6391 0))(
  ( (Nil!6388) (Cons!6387 (h!7243 tuple2!6536) (t!11549 List!6391)) )
))
(declare-datatypes ((ListLongMap!5449 0))(
  ( (ListLongMap!5450 (toList!2740 List!6391)) )
))
(declare-fun lt!183920 () ListLongMap!5449)

(declare-fun getCurrentListMap!2087 (array!23153 array!23151 (_ BitVec 32) (_ BitVec 32) V!13941 V!13941 (_ BitVec 32) Int) ListLongMap!5449)

(assert (=> b!390292 (= lt!183920 (getCurrentListMap!2087 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183919 () ListLongMap!5449)

(declare-fun lt!183917 () array!23153)

(declare-fun lt!183921 () array!23151)

(assert (=> b!390292 (= lt!183919 (getCurrentListMap!2087 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183915 () ListLongMap!5449)

(declare-fun lt!183918 () ListLongMap!5449)

(assert (=> b!390292 (and (= lt!183915 lt!183918) (= lt!183918 lt!183915))))

(declare-fun v!373 () V!13941)

(declare-fun lt!183914 () ListLongMap!5449)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!1035 (ListLongMap!5449 tuple2!6536) ListLongMap!5449)

(assert (=> b!390292 (= lt!183918 (+!1035 lt!183914 (tuple2!6537 k0!778 v!373)))))

(declare-datatypes ((Unit!11952 0))(
  ( (Unit!11953) )
))
(declare-fun lt!183916 () Unit!11952)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!251 (array!23153 array!23151 (_ BitVec 32) (_ BitVec 32) V!13941 V!13941 (_ BitVec 32) (_ BitVec 64) V!13941 (_ BitVec 32) Int) Unit!11952)

(assert (=> b!390292 (= lt!183916 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!251 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!967 (array!23153 array!23151 (_ BitVec 32) (_ BitVec 32) V!13941 V!13941 (_ BitVec 32) Int) ListLongMap!5449)

(assert (=> b!390292 (= lt!183915 (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390292 (= lt!183921 (array!23152 (store (arr!11040 _values!506) i!548 (ValueCellFull!4470 v!373)) (size!11392 _values!506)))))

(assert (=> b!390292 (= lt!183914 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390293 () Bool)

(declare-fun res!223351 () Bool)

(declare-fun e!236421 () Bool)

(assert (=> b!390293 (=> (not res!223351) (not e!236421))))

(assert (=> b!390293 (= res!223351 (and (= (size!11392 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11393 _keys!658) (size!11392 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390294 () Bool)

(declare-fun res!223348 () Bool)

(assert (=> b!390294 (=> (not res!223348) (not e!236421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390294 (= res!223348 (validKeyInArray!0 k0!778))))

(declare-fun b!390296 () Bool)

(declare-fun e!236419 () Bool)

(declare-fun tp_is_empty!9627 () Bool)

(assert (=> b!390296 (= e!236419 tp_is_empty!9627)))

(declare-fun b!390297 () Bool)

(declare-fun res!223350 () Bool)

(assert (=> b!390297 (=> (not res!223350) (not e!236421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23153 (_ BitVec 32)) Bool)

(assert (=> b!390297 (= res!223350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390298 () Bool)

(assert (=> b!390298 (= e!236421 e!236418)))

(declare-fun res!223353 () Bool)

(assert (=> b!390298 (=> (not res!223353) (not e!236418))))

(assert (=> b!390298 (= res!223353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183917 mask!970))))

(assert (=> b!390298 (= lt!183917 (array!23154 (store (arr!11041 _keys!658) i!548 k0!778) (size!11393 _keys!658)))))

(declare-fun b!390299 () Bool)

(assert (=> b!390299 (= e!236422 (= lt!183919 (+!1035 lt!183915 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun b!390300 () Bool)

(declare-fun res!223346 () Bool)

(assert (=> b!390300 (=> (not res!223346) (not e!236421))))

(declare-fun arrayContainsKey!0 (array!23153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390300 (= res!223346 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390301 () Bool)

(declare-fun res!223354 () Bool)

(assert (=> b!390301 (=> (not res!223354) (not e!236421))))

(assert (=> b!390301 (= res!223354 (or (= (select (arr!11041 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11041 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390302 () Bool)

(declare-fun res!223347 () Bool)

(assert (=> b!390302 (=> (not res!223347) (not e!236421))))

(assert (=> b!390302 (= res!223347 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11393 _keys!658))))))

(declare-fun b!390303 () Bool)

(declare-fun res!223344 () Bool)

(assert (=> b!390303 (=> (not res!223344) (not e!236421))))

(declare-datatypes ((List!6392 0))(
  ( (Nil!6389) (Cons!6388 (h!7244 (_ BitVec 64)) (t!11550 List!6392)) )
))
(declare-fun arrayNoDuplicates!0 (array!23153 (_ BitVec 32) List!6392) Bool)

(assert (=> b!390303 (= res!223344 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6389))))

(declare-fun mapIsEmpty!16017 () Bool)

(declare-fun mapRes!16017 () Bool)

(assert (=> mapIsEmpty!16017 mapRes!16017))

(declare-fun b!390304 () Bool)

(declare-fun res!223345 () Bool)

(assert (=> b!390304 (=> (not res!223345) (not e!236418))))

(assert (=> b!390304 (= res!223345 (arrayNoDuplicates!0 lt!183917 #b00000000000000000000000000000000 Nil!6389))))

(declare-fun b!390295 () Bool)

(declare-fun e!236420 () Bool)

(assert (=> b!390295 (= e!236420 tp_is_empty!9627)))

(declare-fun res!223352 () Bool)

(assert (=> start!37942 (=> (not res!223352) (not e!236421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37942 (= res!223352 (validMask!0 mask!970))))

(assert (=> start!37942 e!236421))

(declare-fun e!236423 () Bool)

(declare-fun array_inv!8110 (array!23151) Bool)

(assert (=> start!37942 (and (array_inv!8110 _values!506) e!236423)))

(assert (=> start!37942 tp!31629))

(assert (=> start!37942 true))

(assert (=> start!37942 tp_is_empty!9627))

(declare-fun array_inv!8111 (array!23153) Bool)

(assert (=> start!37942 (array_inv!8111 _keys!658)))

(declare-fun b!390305 () Bool)

(assert (=> b!390305 (= e!236423 (and e!236419 mapRes!16017))))

(declare-fun condMapEmpty!16017 () Bool)

(declare-fun mapDefault!16017 () ValueCell!4470)

(assert (=> b!390305 (= condMapEmpty!16017 (= (arr!11040 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4470)) mapDefault!16017)))))

(declare-fun mapNonEmpty!16017 () Bool)

(declare-fun tp!31628 () Bool)

(assert (=> mapNonEmpty!16017 (= mapRes!16017 (and tp!31628 e!236420))))

(declare-fun mapValue!16017 () ValueCell!4470)

(declare-fun mapRest!16017 () (Array (_ BitVec 32) ValueCell!4470))

(declare-fun mapKey!16017 () (_ BitVec 32))

(assert (=> mapNonEmpty!16017 (= (arr!11040 _values!506) (store mapRest!16017 mapKey!16017 mapValue!16017))))

(assert (= (and start!37942 res!223352) b!390293))

(assert (= (and b!390293 res!223351) b!390297))

(assert (= (and b!390297 res!223350) b!390303))

(assert (= (and b!390303 res!223344) b!390302))

(assert (= (and b!390302 res!223347) b!390294))

(assert (= (and b!390294 res!223348) b!390301))

(assert (= (and b!390301 res!223354) b!390300))

(assert (= (and b!390300 res!223346) b!390298))

(assert (= (and b!390298 res!223353) b!390304))

(assert (= (and b!390304 res!223345) b!390292))

(assert (= (and b!390292 (not res!223349)) b!390299))

(assert (= (and b!390305 condMapEmpty!16017) mapIsEmpty!16017))

(assert (= (and b!390305 (not condMapEmpty!16017)) mapNonEmpty!16017))

(get-info :version)

(assert (= (and mapNonEmpty!16017 ((_ is ValueCellFull!4470) mapValue!16017)) b!390295))

(assert (= (and b!390305 ((_ is ValueCellFull!4470) mapDefault!16017)) b!390296))

(assert (= start!37942 b!390305))

(declare-fun m!386625 () Bool)

(assert (=> b!390299 m!386625))

(declare-fun m!386627 () Bool)

(assert (=> b!390301 m!386627))

(declare-fun m!386629 () Bool)

(assert (=> b!390294 m!386629))

(declare-fun m!386631 () Bool)

(assert (=> b!390297 m!386631))

(declare-fun m!386633 () Bool)

(assert (=> b!390304 m!386633))

(declare-fun m!386635 () Bool)

(assert (=> b!390292 m!386635))

(declare-fun m!386637 () Bool)

(assert (=> b!390292 m!386637))

(declare-fun m!386639 () Bool)

(assert (=> b!390292 m!386639))

(declare-fun m!386641 () Bool)

(assert (=> b!390292 m!386641))

(declare-fun m!386643 () Bool)

(assert (=> b!390292 m!386643))

(declare-fun m!386645 () Bool)

(assert (=> b!390292 m!386645))

(declare-fun m!386647 () Bool)

(assert (=> b!390292 m!386647))

(declare-fun m!386649 () Bool)

(assert (=> b!390300 m!386649))

(declare-fun m!386651 () Bool)

(assert (=> b!390303 m!386651))

(declare-fun m!386653 () Bool)

(assert (=> mapNonEmpty!16017 m!386653))

(declare-fun m!386655 () Bool)

(assert (=> b!390298 m!386655))

(declare-fun m!386657 () Bool)

(assert (=> b!390298 m!386657))

(declare-fun m!386659 () Bool)

(assert (=> start!37942 m!386659))

(declare-fun m!386661 () Bool)

(assert (=> start!37942 m!386661))

(declare-fun m!386663 () Bool)

(assert (=> start!37942 m!386663))

(check-sat (not b!390300) (not start!37942) (not b!390303) b_and!16245 (not b!390304) (not b!390297) (not b_next!8955) (not mapNonEmpty!16017) tp_is_empty!9627 (not b!390299) (not b!390292) (not b!390298) (not b!390294))
(check-sat b_and!16245 (not b_next!8955))
(get-model)

(declare-fun b!390356 () Bool)

(declare-fun e!236453 () Bool)

(declare-fun call!27495 () Bool)

(assert (=> b!390356 (= e!236453 call!27495)))

(declare-fun bm!27492 () Bool)

(assert (=> bm!27492 (= call!27495 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!183917 mask!970))))

(declare-fun b!390357 () Bool)

(declare-fun e!236454 () Bool)

(declare-fun e!236452 () Bool)

(assert (=> b!390357 (= e!236454 e!236452)))

(declare-fun c!54131 () Bool)

(assert (=> b!390357 (= c!54131 (validKeyInArray!0 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(declare-fun b!390358 () Bool)

(assert (=> b!390358 (= e!236452 call!27495)))

(declare-fun d!72975 () Bool)

(declare-fun res!223393 () Bool)

(assert (=> d!72975 (=> res!223393 e!236454)))

(assert (=> d!72975 (= res!223393 (bvsge #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(assert (=> d!72975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183917 mask!970) e!236454)))

(declare-fun b!390359 () Bool)

(assert (=> b!390359 (= e!236452 e!236453)))

(declare-fun lt!183954 () (_ BitVec 64))

(assert (=> b!390359 (= lt!183954 (select (arr!11041 lt!183917) #b00000000000000000000000000000000))))

(declare-fun lt!183953 () Unit!11952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23153 (_ BitVec 64) (_ BitVec 32)) Unit!11952)

(assert (=> b!390359 (= lt!183953 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!183917 lt!183954 #b00000000000000000000000000000000))))

(assert (=> b!390359 (arrayContainsKey!0 lt!183917 lt!183954 #b00000000000000000000000000000000)))

(declare-fun lt!183952 () Unit!11952)

(assert (=> b!390359 (= lt!183952 lt!183953)))

(declare-fun res!223392 () Bool)

(declare-datatypes ((SeekEntryResult!3512 0))(
  ( (MissingZero!3512 (index!16227 (_ BitVec 32))) (Found!3512 (index!16228 (_ BitVec 32))) (Intermediate!3512 (undefined!4324 Bool) (index!16229 (_ BitVec 32)) (x!38293 (_ BitVec 32))) (Undefined!3512) (MissingVacant!3512 (index!16230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23153 (_ BitVec 32)) SeekEntryResult!3512)

(assert (=> b!390359 (= res!223392 (= (seekEntryOrOpen!0 (select (arr!11041 lt!183917) #b00000000000000000000000000000000) lt!183917 mask!970) (Found!3512 #b00000000000000000000000000000000)))))

(assert (=> b!390359 (=> (not res!223392) (not e!236453))))

(assert (= (and d!72975 (not res!223393)) b!390357))

(assert (= (and b!390357 c!54131) b!390359))

(assert (= (and b!390357 (not c!54131)) b!390358))

(assert (= (and b!390359 res!223392) b!390356))

(assert (= (or b!390356 b!390358) bm!27492))

(declare-fun m!386705 () Bool)

(assert (=> bm!27492 m!386705))

(declare-fun m!386707 () Bool)

(assert (=> b!390357 m!386707))

(assert (=> b!390357 m!386707))

(declare-fun m!386709 () Bool)

(assert (=> b!390357 m!386709))

(assert (=> b!390359 m!386707))

(declare-fun m!386711 () Bool)

(assert (=> b!390359 m!386711))

(declare-fun m!386713 () Bool)

(assert (=> b!390359 m!386713))

(assert (=> b!390359 m!386707))

(declare-fun m!386715 () Bool)

(assert (=> b!390359 m!386715))

(assert (=> b!390298 d!72975))

(declare-fun b!390370 () Bool)

(declare-fun e!236466 () Bool)

(declare-fun call!27498 () Bool)

(assert (=> b!390370 (= e!236466 call!27498)))

(declare-fun b!390371 () Bool)

(declare-fun e!236463 () Bool)

(declare-fun e!236465 () Bool)

(assert (=> b!390371 (= e!236463 e!236465)))

(declare-fun res!223402 () Bool)

(assert (=> b!390371 (=> (not res!223402) (not e!236465))))

(declare-fun e!236464 () Bool)

(assert (=> b!390371 (= res!223402 (not e!236464))))

(declare-fun res!223400 () Bool)

(assert (=> b!390371 (=> (not res!223400) (not e!236464))))

(assert (=> b!390371 (= res!223400 (validKeyInArray!0 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390372 () Bool)

(assert (=> b!390372 (= e!236466 call!27498)))

(declare-fun b!390373 () Bool)

(declare-fun contains!2452 (List!6392 (_ BitVec 64)) Bool)

(assert (=> b!390373 (= e!236464 (contains!2452 Nil!6389 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390374 () Bool)

(assert (=> b!390374 (= e!236465 e!236466)))

(declare-fun c!54134 () Bool)

(assert (=> b!390374 (= c!54134 (validKeyInArray!0 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27495 () Bool)

(assert (=> bm!27495 (= call!27498 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54134 (Cons!6388 (select (arr!11041 _keys!658) #b00000000000000000000000000000000) Nil!6389) Nil!6389)))))

(declare-fun d!72977 () Bool)

(declare-fun res!223401 () Bool)

(assert (=> d!72977 (=> res!223401 e!236463)))

(assert (=> d!72977 (= res!223401 (bvsge #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(assert (=> d!72977 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6389) e!236463)))

(assert (= (and d!72977 (not res!223401)) b!390371))

(assert (= (and b!390371 res!223400) b!390373))

(assert (= (and b!390371 res!223402) b!390374))

(assert (= (and b!390374 c!54134) b!390370))

(assert (= (and b!390374 (not c!54134)) b!390372))

(assert (= (or b!390370 b!390372) bm!27495))

(declare-fun m!386717 () Bool)

(assert (=> b!390371 m!386717))

(assert (=> b!390371 m!386717))

(declare-fun m!386719 () Bool)

(assert (=> b!390371 m!386719))

(assert (=> b!390373 m!386717))

(assert (=> b!390373 m!386717))

(declare-fun m!386721 () Bool)

(assert (=> b!390373 m!386721))

(assert (=> b!390374 m!386717))

(assert (=> b!390374 m!386717))

(assert (=> b!390374 m!386719))

(assert (=> bm!27495 m!386717))

(declare-fun m!386723 () Bool)

(assert (=> bm!27495 m!386723))

(assert (=> b!390303 d!72977))

(declare-fun call!27504 () ListLongMap!5449)

(declare-fun call!27503 () ListLongMap!5449)

(declare-fun b!390381 () Bool)

(declare-fun e!236471 () Bool)

(assert (=> b!390381 (= e!236471 (= call!27503 (+!1035 call!27504 (tuple2!6537 k0!778 v!373))))))

(declare-fun bm!27500 () Bool)

(assert (=> bm!27500 (= call!27503 (getCurrentListMapNoExtraKeys!967 (array!23154 (store (arr!11041 _keys!658) i!548 k0!778) (size!11393 _keys!658)) (array!23152 (store (arr!11040 _values!506) i!548 (ValueCellFull!4470 v!373)) (size!11392 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390382 () Bool)

(declare-fun e!236472 () Bool)

(assert (=> b!390382 (= e!236472 e!236471)))

(declare-fun c!54137 () Bool)

(assert (=> b!390382 (= c!54137 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun bm!27501 () Bool)

(assert (=> bm!27501 (= call!27504 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390383 () Bool)

(assert (=> b!390383 (= e!236471 (= call!27503 call!27504))))

(declare-fun d!72979 () Bool)

(assert (=> d!72979 e!236472))

(declare-fun res!223405 () Bool)

(assert (=> d!72979 (=> (not res!223405) (not e!236472))))

(assert (=> d!72979 (= res!223405 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11393 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11392 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11393 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11392 _values!506))))))))

(declare-fun lt!183957 () Unit!11952)

(declare-fun choose!1316 (array!23153 array!23151 (_ BitVec 32) (_ BitVec 32) V!13941 V!13941 (_ BitVec 32) (_ BitVec 64) V!13941 (_ BitVec 32) Int) Unit!11952)

(assert (=> d!72979 (= lt!183957 (choose!1316 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72979 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(assert (=> d!72979 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!251 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!183957)))

(assert (= (and d!72979 res!223405) b!390382))

(assert (= (and b!390382 c!54137) b!390381))

(assert (= (and b!390382 (not c!54137)) b!390383))

(assert (= (or b!390381 b!390383) bm!27501))

(assert (= (or b!390381 b!390383) bm!27500))

(declare-fun m!386725 () Bool)

(assert (=> b!390381 m!386725))

(assert (=> bm!27500 m!386657))

(assert (=> bm!27500 m!386647))

(declare-fun m!386727 () Bool)

(assert (=> bm!27500 m!386727))

(assert (=> bm!27501 m!386637))

(declare-fun m!386729 () Bool)

(assert (=> d!72979 m!386729))

(assert (=> b!390292 d!72979))

(declare-fun d!72981 () Bool)

(declare-fun e!236475 () Bool)

(assert (=> d!72981 e!236475))

(declare-fun res!223411 () Bool)

(assert (=> d!72981 (=> (not res!223411) (not e!236475))))

(declare-fun lt!183967 () ListLongMap!5449)

(declare-fun contains!2453 (ListLongMap!5449 (_ BitVec 64)) Bool)

(assert (=> d!72981 (= res!223411 (contains!2453 lt!183967 (_1!3279 (tuple2!6537 k0!778 v!373))))))

(declare-fun lt!183968 () List!6391)

(assert (=> d!72981 (= lt!183967 (ListLongMap!5450 lt!183968))))

(declare-fun lt!183966 () Unit!11952)

(declare-fun lt!183969 () Unit!11952)

(assert (=> d!72981 (= lt!183966 lt!183969)))

(declare-datatypes ((Option!365 0))(
  ( (Some!364 (v!7076 V!13941)) (None!363) )
))
(declare-fun getValueByKey!359 (List!6391 (_ BitVec 64)) Option!365)

(assert (=> d!72981 (= (getValueByKey!359 lt!183968 (_1!3279 (tuple2!6537 k0!778 v!373))) (Some!364 (_2!3279 (tuple2!6537 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!181 (List!6391 (_ BitVec 64) V!13941) Unit!11952)

(assert (=> d!72981 (= lt!183969 (lemmaContainsTupThenGetReturnValue!181 lt!183968 (_1!3279 (tuple2!6537 k0!778 v!373)) (_2!3279 (tuple2!6537 k0!778 v!373))))))

(declare-fun insertStrictlySorted!184 (List!6391 (_ BitVec 64) V!13941) List!6391)

(assert (=> d!72981 (= lt!183968 (insertStrictlySorted!184 (toList!2740 lt!183914) (_1!3279 (tuple2!6537 k0!778 v!373)) (_2!3279 (tuple2!6537 k0!778 v!373))))))

(assert (=> d!72981 (= (+!1035 lt!183914 (tuple2!6537 k0!778 v!373)) lt!183967)))

(declare-fun b!390388 () Bool)

(declare-fun res!223410 () Bool)

(assert (=> b!390388 (=> (not res!223410) (not e!236475))))

(assert (=> b!390388 (= res!223410 (= (getValueByKey!359 (toList!2740 lt!183967) (_1!3279 (tuple2!6537 k0!778 v!373))) (Some!364 (_2!3279 (tuple2!6537 k0!778 v!373)))))))

(declare-fun b!390389 () Bool)

(declare-fun contains!2454 (List!6391 tuple2!6536) Bool)

(assert (=> b!390389 (= e!236475 (contains!2454 (toList!2740 lt!183967) (tuple2!6537 k0!778 v!373)))))

(assert (= (and d!72981 res!223411) b!390388))

(assert (= (and b!390388 res!223410) b!390389))

(declare-fun m!386731 () Bool)

(assert (=> d!72981 m!386731))

(declare-fun m!386733 () Bool)

(assert (=> d!72981 m!386733))

(declare-fun m!386735 () Bool)

(assert (=> d!72981 m!386735))

(declare-fun m!386737 () Bool)

(assert (=> d!72981 m!386737))

(declare-fun m!386739 () Bool)

(assert (=> b!390388 m!386739))

(declare-fun m!386741 () Bool)

(assert (=> b!390389 m!386741))

(assert (=> b!390292 d!72981))

(declare-fun b!390414 () Bool)

(declare-fun lt!183990 () ListLongMap!5449)

(declare-fun e!236495 () Bool)

(assert (=> b!390414 (= e!236495 (= lt!183990 (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390415 () Bool)

(declare-fun lt!183985 () Unit!11952)

(declare-fun lt!183986 () Unit!11952)

(assert (=> b!390415 (= lt!183985 lt!183986)))

(declare-fun lt!183988 () (_ BitVec 64))

(declare-fun lt!183989 () V!13941)

(declare-fun lt!183987 () ListLongMap!5449)

(declare-fun lt!183984 () (_ BitVec 64))

(assert (=> b!390415 (not (contains!2453 (+!1035 lt!183987 (tuple2!6537 lt!183988 lt!183989)) lt!183984))))

(declare-fun addStillNotContains!134 (ListLongMap!5449 (_ BitVec 64) V!13941 (_ BitVec 64)) Unit!11952)

(assert (=> b!390415 (= lt!183986 (addStillNotContains!134 lt!183987 lt!183988 lt!183989 lt!183984))))

(assert (=> b!390415 (= lt!183984 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5583 (ValueCell!4470 V!13941) V!13941)

(declare-fun dynLambda!644 (Int (_ BitVec 64)) V!13941)

(assert (=> b!390415 (= lt!183989 (get!5583 (select (arr!11040 lt!183921) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390415 (= lt!183988 (select (arr!11041 lt!183917) #b00000000000000000000000000000000))))

(declare-fun call!27507 () ListLongMap!5449)

(assert (=> b!390415 (= lt!183987 call!27507)))

(declare-fun e!236490 () ListLongMap!5449)

(assert (=> b!390415 (= e!236490 (+!1035 call!27507 (tuple2!6537 (select (arr!11041 lt!183917) #b00000000000000000000000000000000) (get!5583 (select (arr!11040 lt!183921) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390416 () Bool)

(declare-fun e!236493 () ListLongMap!5449)

(assert (=> b!390416 (= e!236493 (ListLongMap!5450 Nil!6388))))

(declare-fun d!72983 () Bool)

(declare-fun e!236492 () Bool)

(assert (=> d!72983 e!236492))

(declare-fun res!223423 () Bool)

(assert (=> d!72983 (=> (not res!223423) (not e!236492))))

(assert (=> d!72983 (= res!223423 (not (contains!2453 lt!183990 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72983 (= lt!183990 e!236493)))

(declare-fun c!54148 () Bool)

(assert (=> d!72983 (= c!54148 (bvsge #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(assert (=> d!72983 (validMask!0 mask!970)))

(assert (=> d!72983 (= (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183990)))

(declare-fun b!390417 () Bool)

(assert (=> b!390417 (= e!236490 call!27507)))

(declare-fun b!390418 () Bool)

(assert (=> b!390418 (= e!236493 e!236490)))

(declare-fun c!54149 () Bool)

(assert (=> b!390418 (= c!54149 (validKeyInArray!0 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(declare-fun b!390419 () Bool)

(declare-fun e!236491 () Bool)

(assert (=> b!390419 (= e!236491 (validKeyInArray!0 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(assert (=> b!390419 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!390420 () Bool)

(declare-fun res!223421 () Bool)

(assert (=> b!390420 (=> (not res!223421) (not e!236492))))

(assert (=> b!390420 (= res!223421 (not (contains!2453 lt!183990 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390421 () Bool)

(declare-fun e!236496 () Bool)

(assert (=> b!390421 (= e!236492 e!236496)))

(declare-fun c!54147 () Bool)

(assert (=> b!390421 (= c!54147 e!236491)))

(declare-fun res!223420 () Bool)

(assert (=> b!390421 (=> (not res!223420) (not e!236491))))

(assert (=> b!390421 (= res!223420 (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(declare-fun b!390422 () Bool)

(declare-fun e!236494 () Bool)

(assert (=> b!390422 (= e!236496 e!236494)))

(assert (=> b!390422 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(declare-fun res!223422 () Bool)

(assert (=> b!390422 (= res!223422 (contains!2453 lt!183990 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(assert (=> b!390422 (=> (not res!223422) (not e!236494))))

(declare-fun b!390423 () Bool)

(assert (=> b!390423 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(assert (=> b!390423 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11392 lt!183921)))))

(declare-fun apply!301 (ListLongMap!5449 (_ BitVec 64)) V!13941)

(assert (=> b!390423 (= e!236494 (= (apply!301 lt!183990 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)) (get!5583 (select (arr!11040 lt!183921) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390424 () Bool)

(assert (=> b!390424 (= e!236496 e!236495)))

(declare-fun c!54146 () Bool)

(assert (=> b!390424 (= c!54146 (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(declare-fun bm!27504 () Bool)

(assert (=> bm!27504 (= call!27507 (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390425 () Bool)

(declare-fun isEmpty!547 (ListLongMap!5449) Bool)

(assert (=> b!390425 (= e!236495 (isEmpty!547 lt!183990))))

(assert (= (and d!72983 c!54148) b!390416))

(assert (= (and d!72983 (not c!54148)) b!390418))

(assert (= (and b!390418 c!54149) b!390415))

(assert (= (and b!390418 (not c!54149)) b!390417))

(assert (= (or b!390415 b!390417) bm!27504))

(assert (= (and d!72983 res!223423) b!390420))

(assert (= (and b!390420 res!223421) b!390421))

(assert (= (and b!390421 res!223420) b!390419))

(assert (= (and b!390421 c!54147) b!390422))

(assert (= (and b!390421 (not c!54147)) b!390424))

(assert (= (and b!390422 res!223422) b!390423))

(assert (= (and b!390424 c!54146) b!390414))

(assert (= (and b!390424 (not c!54146)) b!390425))

(declare-fun b_lambda!8623 () Bool)

(assert (=> (not b_lambda!8623) (not b!390415)))

(declare-fun t!11554 () Bool)

(declare-fun tb!3117 () Bool)

(assert (=> (and start!37942 (= defaultEntry!514 defaultEntry!514) t!11554) tb!3117))

(declare-fun result!5731 () Bool)

(assert (=> tb!3117 (= result!5731 tp_is_empty!9627)))

(assert (=> b!390415 t!11554))

(declare-fun b_and!16249 () Bool)

(assert (= b_and!16245 (and (=> t!11554 result!5731) b_and!16249)))

(declare-fun b_lambda!8625 () Bool)

(assert (=> (not b_lambda!8625) (not b!390423)))

(assert (=> b!390423 t!11554))

(declare-fun b_and!16251 () Bool)

(assert (= b_and!16249 (and (=> t!11554 result!5731) b_and!16251)))

(declare-fun m!386743 () Bool)

(assert (=> d!72983 m!386743))

(assert (=> d!72983 m!386659))

(declare-fun m!386745 () Bool)

(assert (=> b!390425 m!386745))

(declare-fun m!386747 () Bool)

(assert (=> b!390415 m!386747))

(declare-fun m!386749 () Bool)

(assert (=> b!390415 m!386749))

(declare-fun m!386751 () Bool)

(assert (=> b!390415 m!386751))

(declare-fun m!386753 () Bool)

(assert (=> b!390415 m!386753))

(assert (=> b!390415 m!386749))

(declare-fun m!386755 () Bool)

(assert (=> b!390415 m!386755))

(assert (=> b!390415 m!386707))

(declare-fun m!386757 () Bool)

(assert (=> b!390415 m!386757))

(assert (=> b!390415 m!386747))

(assert (=> b!390415 m!386753))

(declare-fun m!386759 () Bool)

(assert (=> b!390415 m!386759))

(assert (=> b!390423 m!386747))

(assert (=> b!390423 m!386749))

(assert (=> b!390423 m!386751))

(assert (=> b!390423 m!386707))

(assert (=> b!390423 m!386707))

(declare-fun m!386761 () Bool)

(assert (=> b!390423 m!386761))

(assert (=> b!390423 m!386747))

(assert (=> b!390423 m!386749))

(declare-fun m!386763 () Bool)

(assert (=> bm!27504 m!386763))

(assert (=> b!390414 m!386763))

(assert (=> b!390419 m!386707))

(assert (=> b!390419 m!386707))

(assert (=> b!390419 m!386709))

(declare-fun m!386765 () Bool)

(assert (=> b!390420 m!386765))

(assert (=> b!390418 m!386707))

(assert (=> b!390418 m!386707))

(assert (=> b!390418 m!386709))

(assert (=> b!390422 m!386707))

(assert (=> b!390422 m!386707))

(declare-fun m!386767 () Bool)

(assert (=> b!390422 m!386767))

(assert (=> b!390292 d!72983))

(declare-fun lt!183997 () ListLongMap!5449)

(declare-fun e!236502 () Bool)

(declare-fun b!390428 () Bool)

(assert (=> b!390428 (= e!236502 (= lt!183997 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390429 () Bool)

(declare-fun lt!183992 () Unit!11952)

(declare-fun lt!183993 () Unit!11952)

(assert (=> b!390429 (= lt!183992 lt!183993)))

(declare-fun lt!183996 () V!13941)

(declare-fun lt!183995 () (_ BitVec 64))

(declare-fun lt!183994 () ListLongMap!5449)

(declare-fun lt!183991 () (_ BitVec 64))

(assert (=> b!390429 (not (contains!2453 (+!1035 lt!183994 (tuple2!6537 lt!183995 lt!183996)) lt!183991))))

(assert (=> b!390429 (= lt!183993 (addStillNotContains!134 lt!183994 lt!183995 lt!183996 lt!183991))))

(assert (=> b!390429 (= lt!183991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!390429 (= lt!183996 (get!5583 (select (arr!11040 _values!506) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390429 (= lt!183995 (select (arr!11041 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27508 () ListLongMap!5449)

(assert (=> b!390429 (= lt!183994 call!27508)))

(declare-fun e!236497 () ListLongMap!5449)

(assert (=> b!390429 (= e!236497 (+!1035 call!27508 (tuple2!6537 (select (arr!11041 _keys!658) #b00000000000000000000000000000000) (get!5583 (select (arr!11040 _values!506) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390430 () Bool)

(declare-fun e!236500 () ListLongMap!5449)

(assert (=> b!390430 (= e!236500 (ListLongMap!5450 Nil!6388))))

(declare-fun d!72985 () Bool)

(declare-fun e!236499 () Bool)

(assert (=> d!72985 e!236499))

(declare-fun res!223427 () Bool)

(assert (=> d!72985 (=> (not res!223427) (not e!236499))))

(assert (=> d!72985 (= res!223427 (not (contains!2453 lt!183997 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72985 (= lt!183997 e!236500)))

(declare-fun c!54152 () Bool)

(assert (=> d!72985 (= c!54152 (bvsge #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(assert (=> d!72985 (validMask!0 mask!970)))

(assert (=> d!72985 (= (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183997)))

(declare-fun b!390431 () Bool)

(assert (=> b!390431 (= e!236497 call!27508)))

(declare-fun b!390432 () Bool)

(assert (=> b!390432 (= e!236500 e!236497)))

(declare-fun c!54153 () Bool)

(assert (=> b!390432 (= c!54153 (validKeyInArray!0 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390433 () Bool)

(declare-fun e!236498 () Bool)

(assert (=> b!390433 (= e!236498 (validKeyInArray!0 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390433 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!390434 () Bool)

(declare-fun res!223425 () Bool)

(assert (=> b!390434 (=> (not res!223425) (not e!236499))))

(assert (=> b!390434 (= res!223425 (not (contains!2453 lt!183997 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390435 () Bool)

(declare-fun e!236503 () Bool)

(assert (=> b!390435 (= e!236499 e!236503)))

(declare-fun c!54151 () Bool)

(assert (=> b!390435 (= c!54151 e!236498)))

(declare-fun res!223424 () Bool)

(assert (=> b!390435 (=> (not res!223424) (not e!236498))))

(assert (=> b!390435 (= res!223424 (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(declare-fun b!390436 () Bool)

(declare-fun e!236501 () Bool)

(assert (=> b!390436 (= e!236503 e!236501)))

(assert (=> b!390436 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(declare-fun res!223426 () Bool)

(assert (=> b!390436 (= res!223426 (contains!2453 lt!183997 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390436 (=> (not res!223426) (not e!236501))))

(declare-fun b!390437 () Bool)

(assert (=> b!390437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(assert (=> b!390437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11392 _values!506)))))

(assert (=> b!390437 (= e!236501 (= (apply!301 lt!183997 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)) (get!5583 (select (arr!11040 _values!506) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390438 () Bool)

(assert (=> b!390438 (= e!236503 e!236502)))

(declare-fun c!54150 () Bool)

(assert (=> b!390438 (= c!54150 (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(declare-fun bm!27505 () Bool)

(assert (=> bm!27505 (= call!27508 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390439 () Bool)

(assert (=> b!390439 (= e!236502 (isEmpty!547 lt!183997))))

(assert (= (and d!72985 c!54152) b!390430))

(assert (= (and d!72985 (not c!54152)) b!390432))

(assert (= (and b!390432 c!54153) b!390429))

(assert (= (and b!390432 (not c!54153)) b!390431))

(assert (= (or b!390429 b!390431) bm!27505))

(assert (= (and d!72985 res!223427) b!390434))

(assert (= (and b!390434 res!223425) b!390435))

(assert (= (and b!390435 res!223424) b!390433))

(assert (= (and b!390435 c!54151) b!390436))

(assert (= (and b!390435 (not c!54151)) b!390438))

(assert (= (and b!390436 res!223426) b!390437))

(assert (= (and b!390438 c!54150) b!390428))

(assert (= (and b!390438 (not c!54150)) b!390439))

(declare-fun b_lambda!8627 () Bool)

(assert (=> (not b_lambda!8627) (not b!390429)))

(assert (=> b!390429 t!11554))

(declare-fun b_and!16253 () Bool)

(assert (= b_and!16251 (and (=> t!11554 result!5731) b_and!16253)))

(declare-fun b_lambda!8629 () Bool)

(assert (=> (not b_lambda!8629) (not b!390437)))

(assert (=> b!390437 t!11554))

(declare-fun b_and!16255 () Bool)

(assert (= b_and!16253 (and (=> t!11554 result!5731) b_and!16255)))

(declare-fun m!386769 () Bool)

(assert (=> d!72985 m!386769))

(assert (=> d!72985 m!386659))

(declare-fun m!386771 () Bool)

(assert (=> b!390439 m!386771))

(declare-fun m!386773 () Bool)

(assert (=> b!390429 m!386773))

(assert (=> b!390429 m!386749))

(declare-fun m!386775 () Bool)

(assert (=> b!390429 m!386775))

(declare-fun m!386777 () Bool)

(assert (=> b!390429 m!386777))

(assert (=> b!390429 m!386749))

(declare-fun m!386779 () Bool)

(assert (=> b!390429 m!386779))

(assert (=> b!390429 m!386717))

(declare-fun m!386781 () Bool)

(assert (=> b!390429 m!386781))

(assert (=> b!390429 m!386773))

(assert (=> b!390429 m!386777))

(declare-fun m!386783 () Bool)

(assert (=> b!390429 m!386783))

(assert (=> b!390437 m!386773))

(assert (=> b!390437 m!386749))

(assert (=> b!390437 m!386775))

(assert (=> b!390437 m!386717))

(assert (=> b!390437 m!386717))

(declare-fun m!386785 () Bool)

(assert (=> b!390437 m!386785))

(assert (=> b!390437 m!386773))

(assert (=> b!390437 m!386749))

(declare-fun m!386787 () Bool)

(assert (=> bm!27505 m!386787))

(assert (=> b!390428 m!386787))

(assert (=> b!390433 m!386717))

(assert (=> b!390433 m!386717))

(assert (=> b!390433 m!386719))

(declare-fun m!386789 () Bool)

(assert (=> b!390434 m!386789))

(assert (=> b!390432 m!386717))

(assert (=> b!390432 m!386717))

(assert (=> b!390432 m!386719))

(assert (=> b!390436 m!386717))

(assert (=> b!390436 m!386717))

(declare-fun m!386791 () Bool)

(assert (=> b!390436 m!386791))

(assert (=> b!390292 d!72985))

(declare-fun b!390482 () Bool)

(declare-fun e!236532 () Unit!11952)

(declare-fun lt!184059 () Unit!11952)

(assert (=> b!390482 (= e!236532 lt!184059)))

(declare-fun lt!184044 () ListLongMap!5449)

(assert (=> b!390482 (= lt!184044 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184045 () (_ BitVec 64))

(assert (=> b!390482 (= lt!184045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184058 () (_ BitVec 64))

(assert (=> b!390482 (= lt!184058 (select (arr!11041 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184060 () Unit!11952)

(declare-fun addStillContains!277 (ListLongMap!5449 (_ BitVec 64) V!13941 (_ BitVec 64)) Unit!11952)

(assert (=> b!390482 (= lt!184060 (addStillContains!277 lt!184044 lt!184045 zeroValue!472 lt!184058))))

(assert (=> b!390482 (contains!2453 (+!1035 lt!184044 (tuple2!6537 lt!184045 zeroValue!472)) lt!184058)))

(declare-fun lt!184043 () Unit!11952)

(assert (=> b!390482 (= lt!184043 lt!184060)))

(declare-fun lt!184062 () ListLongMap!5449)

(assert (=> b!390482 (= lt!184062 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184052 () (_ BitVec 64))

(assert (=> b!390482 (= lt!184052 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184046 () (_ BitVec 64))

(assert (=> b!390482 (= lt!184046 (select (arr!11041 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184042 () Unit!11952)

(declare-fun addApplyDifferent!277 (ListLongMap!5449 (_ BitVec 64) V!13941 (_ BitVec 64)) Unit!11952)

(assert (=> b!390482 (= lt!184042 (addApplyDifferent!277 lt!184062 lt!184052 minValue!472 lt!184046))))

(assert (=> b!390482 (= (apply!301 (+!1035 lt!184062 (tuple2!6537 lt!184052 minValue!472)) lt!184046) (apply!301 lt!184062 lt!184046))))

(declare-fun lt!184050 () Unit!11952)

(assert (=> b!390482 (= lt!184050 lt!184042)))

(declare-fun lt!184048 () ListLongMap!5449)

(assert (=> b!390482 (= lt!184048 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184061 () (_ BitVec 64))

(assert (=> b!390482 (= lt!184061 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184063 () (_ BitVec 64))

(assert (=> b!390482 (= lt!184063 (select (arr!11041 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184055 () Unit!11952)

(assert (=> b!390482 (= lt!184055 (addApplyDifferent!277 lt!184048 lt!184061 zeroValue!472 lt!184063))))

(assert (=> b!390482 (= (apply!301 (+!1035 lt!184048 (tuple2!6537 lt!184061 zeroValue!472)) lt!184063) (apply!301 lt!184048 lt!184063))))

(declare-fun lt!184056 () Unit!11952)

(assert (=> b!390482 (= lt!184056 lt!184055)))

(declare-fun lt!184049 () ListLongMap!5449)

(assert (=> b!390482 (= lt!184049 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184057 () (_ BitVec 64))

(assert (=> b!390482 (= lt!184057 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184051 () (_ BitVec 64))

(assert (=> b!390482 (= lt!184051 (select (arr!11041 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390482 (= lt!184059 (addApplyDifferent!277 lt!184049 lt!184057 minValue!472 lt!184051))))

(assert (=> b!390482 (= (apply!301 (+!1035 lt!184049 (tuple2!6537 lt!184057 minValue!472)) lt!184051) (apply!301 lt!184049 lt!184051))))

(declare-fun bm!27520 () Bool)

(declare-fun call!27525 () ListLongMap!5449)

(declare-fun call!27523 () ListLongMap!5449)

(assert (=> bm!27520 (= call!27525 call!27523)))

(declare-fun bm!27521 () Bool)

(declare-fun call!27527 () ListLongMap!5449)

(declare-fun call!27526 () ListLongMap!5449)

(assert (=> bm!27521 (= call!27527 call!27526)))

(declare-fun b!390483 () Bool)

(declare-fun res!223451 () Bool)

(declare-fun e!236542 () Bool)

(assert (=> b!390483 (=> (not res!223451) (not e!236542))))

(declare-fun e!236538 () Bool)

(assert (=> b!390483 (= res!223451 e!236538)))

(declare-fun c!54167 () Bool)

(assert (=> b!390483 (= c!54167 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390484 () Bool)

(declare-fun res!223452 () Bool)

(assert (=> b!390484 (=> (not res!223452) (not e!236542))))

(declare-fun e!236531 () Bool)

(assert (=> b!390484 (= res!223452 e!236531)))

(declare-fun res!223447 () Bool)

(assert (=> b!390484 (=> res!223447 e!236531)))

(declare-fun e!236536 () Bool)

(assert (=> b!390484 (= res!223447 (not e!236536))))

(declare-fun res!223450 () Bool)

(assert (=> b!390484 (=> (not res!223450) (not e!236536))))

(assert (=> b!390484 (= res!223450 (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(declare-fun bm!27522 () Bool)

(declare-fun call!27529 () Bool)

(declare-fun lt!184053 () ListLongMap!5449)

(assert (=> bm!27522 (= call!27529 (contains!2453 lt!184053 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390485 () Bool)

(declare-fun e!236540 () Bool)

(assert (=> b!390485 (= e!236540 (validKeyInArray!0 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390486 () Bool)

(declare-fun e!236534 () Bool)

(assert (=> b!390486 (= e!236534 (not call!27529))))

(declare-fun b!390487 () Bool)

(declare-fun c!54170 () Bool)

(assert (=> b!390487 (= c!54170 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236537 () ListLongMap!5449)

(declare-fun e!236541 () ListLongMap!5449)

(assert (=> b!390487 (= e!236537 e!236541)))

(declare-fun b!390488 () Bool)

(declare-fun e!236535 () Bool)

(assert (=> b!390488 (= e!236531 e!236535)))

(declare-fun res!223454 () Bool)

(assert (=> b!390488 (=> (not res!223454) (not e!236535))))

(assert (=> b!390488 (= res!223454 (contains!2453 lt!184053 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390488 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(declare-fun b!390489 () Bool)

(assert (=> b!390489 (= e!236536 (validKeyInArray!0 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390490 () Bool)

(assert (=> b!390490 (= e!236537 call!27525)))

(declare-fun d!72987 () Bool)

(assert (=> d!72987 e!236542))

(declare-fun res!223453 () Bool)

(assert (=> d!72987 (=> (not res!223453) (not e!236542))))

(assert (=> d!72987 (= res!223453 (or (bvsge #b00000000000000000000000000000000 (size!11393 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))))

(declare-fun lt!184054 () ListLongMap!5449)

(assert (=> d!72987 (= lt!184053 lt!184054)))

(declare-fun lt!184047 () Unit!11952)

(assert (=> d!72987 (= lt!184047 e!236532)))

(declare-fun c!54171 () Bool)

(assert (=> d!72987 (= c!54171 e!236540)))

(declare-fun res!223446 () Bool)

(assert (=> d!72987 (=> (not res!223446) (not e!236540))))

(assert (=> d!72987 (= res!223446 (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(declare-fun e!236533 () ListLongMap!5449)

(assert (=> d!72987 (= lt!184054 e!236533)))

(declare-fun c!54168 () Bool)

(assert (=> d!72987 (= c!54168 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72987 (validMask!0 mask!970)))

(assert (=> d!72987 (= (getCurrentListMap!2087 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184053)))

(declare-fun b!390491 () Bool)

(assert (=> b!390491 (= e!236535 (= (apply!301 lt!184053 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)) (get!5583 (select (arr!11040 _values!506) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11392 _values!506)))))

(assert (=> b!390491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(declare-fun bm!27523 () Bool)

(declare-fun call!27524 () ListLongMap!5449)

(assert (=> bm!27523 (= call!27524 call!27527)))

(declare-fun bm!27524 () Bool)

(assert (=> bm!27524 (= call!27526 (getCurrentListMapNoExtraKeys!967 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390492 () Bool)

(declare-fun e!236539 () Bool)

(assert (=> b!390492 (= e!236534 e!236539)))

(declare-fun res!223448 () Bool)

(assert (=> b!390492 (= res!223448 call!27529)))

(assert (=> b!390492 (=> (not res!223448) (not e!236539))))

(declare-fun b!390493 () Bool)

(assert (=> b!390493 (= e!236542 e!236534)))

(declare-fun c!54166 () Bool)

(assert (=> b!390493 (= c!54166 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390494 () Bool)

(declare-fun call!27528 () Bool)

(assert (=> b!390494 (= e!236538 (not call!27528))))

(declare-fun c!54169 () Bool)

(declare-fun bm!27525 () Bool)

(assert (=> bm!27525 (= call!27523 (+!1035 (ite c!54168 call!27526 (ite c!54169 call!27527 call!27524)) (ite (or c!54168 c!54169) (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390495 () Bool)

(assert (=> b!390495 (= e!236539 (= (apply!301 lt!184053 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!390496 () Bool)

(declare-fun e!236530 () Bool)

(assert (=> b!390496 (= e!236530 (= (apply!301 lt!184053 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390497 () Bool)

(assert (=> b!390497 (= e!236541 call!27524)))

(declare-fun b!390498 () Bool)

(assert (=> b!390498 (= e!236533 e!236537)))

(assert (=> b!390498 (= c!54169 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390499 () Bool)

(declare-fun Unit!11954 () Unit!11952)

(assert (=> b!390499 (= e!236532 Unit!11954)))

(declare-fun b!390500 () Bool)

(assert (=> b!390500 (= e!236538 e!236530)))

(declare-fun res!223449 () Bool)

(assert (=> b!390500 (= res!223449 call!27528)))

(assert (=> b!390500 (=> (not res!223449) (not e!236530))))

(declare-fun b!390501 () Bool)

(assert (=> b!390501 (= e!236541 call!27525)))

(declare-fun bm!27526 () Bool)

(assert (=> bm!27526 (= call!27528 (contains!2453 lt!184053 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390502 () Bool)

(assert (=> b!390502 (= e!236533 (+!1035 call!27523 (tuple2!6537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72987 c!54168) b!390502))

(assert (= (and d!72987 (not c!54168)) b!390498))

(assert (= (and b!390498 c!54169) b!390490))

(assert (= (and b!390498 (not c!54169)) b!390487))

(assert (= (and b!390487 c!54170) b!390501))

(assert (= (and b!390487 (not c!54170)) b!390497))

(assert (= (or b!390501 b!390497) bm!27523))

(assert (= (or b!390490 bm!27523) bm!27521))

(assert (= (or b!390490 b!390501) bm!27520))

(assert (= (or b!390502 bm!27521) bm!27524))

(assert (= (or b!390502 bm!27520) bm!27525))

(assert (= (and d!72987 res!223446) b!390485))

(assert (= (and d!72987 c!54171) b!390482))

(assert (= (and d!72987 (not c!54171)) b!390499))

(assert (= (and d!72987 res!223453) b!390484))

(assert (= (and b!390484 res!223450) b!390489))

(assert (= (and b!390484 (not res!223447)) b!390488))

(assert (= (and b!390488 res!223454) b!390491))

(assert (= (and b!390484 res!223452) b!390483))

(assert (= (and b!390483 c!54167) b!390500))

(assert (= (and b!390483 (not c!54167)) b!390494))

(assert (= (and b!390500 res!223449) b!390496))

(assert (= (or b!390500 b!390494) bm!27526))

(assert (= (and b!390483 res!223451) b!390493))

(assert (= (and b!390493 c!54166) b!390492))

(assert (= (and b!390493 (not c!54166)) b!390486))

(assert (= (and b!390492 res!223448) b!390495))

(assert (= (or b!390492 b!390486) bm!27522))

(declare-fun b_lambda!8631 () Bool)

(assert (=> (not b_lambda!8631) (not b!390491)))

(assert (=> b!390491 t!11554))

(declare-fun b_and!16257 () Bool)

(assert (= b_and!16255 (and (=> t!11554 result!5731) b_and!16257)))

(assert (=> b!390489 m!386717))

(assert (=> b!390489 m!386717))

(assert (=> b!390489 m!386719))

(assert (=> b!390485 m!386717))

(assert (=> b!390485 m!386717))

(assert (=> b!390485 m!386719))

(declare-fun m!386793 () Bool)

(assert (=> bm!27522 m!386793))

(assert (=> b!390488 m!386717))

(assert (=> b!390488 m!386717))

(declare-fun m!386795 () Bool)

(assert (=> b!390488 m!386795))

(declare-fun m!386797 () Bool)

(assert (=> b!390495 m!386797))

(declare-fun m!386799 () Bool)

(assert (=> b!390496 m!386799))

(assert (=> b!390491 m!386773))

(assert (=> b!390491 m!386717))

(assert (=> b!390491 m!386773))

(assert (=> b!390491 m!386749))

(assert (=> b!390491 m!386775))

(assert (=> b!390491 m!386717))

(declare-fun m!386801 () Bool)

(assert (=> b!390491 m!386801))

(assert (=> b!390491 m!386749))

(declare-fun m!386803 () Bool)

(assert (=> bm!27525 m!386803))

(declare-fun m!386805 () Bool)

(assert (=> b!390502 m!386805))

(assert (=> d!72987 m!386659))

(assert (=> bm!27524 m!386637))

(declare-fun m!386807 () Bool)

(assert (=> bm!27526 m!386807))

(declare-fun m!386809 () Bool)

(assert (=> b!390482 m!386809))

(declare-fun m!386811 () Bool)

(assert (=> b!390482 m!386811))

(declare-fun m!386813 () Bool)

(assert (=> b!390482 m!386813))

(declare-fun m!386815 () Bool)

(assert (=> b!390482 m!386815))

(assert (=> b!390482 m!386637))

(declare-fun m!386817 () Bool)

(assert (=> b!390482 m!386817))

(declare-fun m!386819 () Bool)

(assert (=> b!390482 m!386819))

(assert (=> b!390482 m!386717))

(declare-fun m!386821 () Bool)

(assert (=> b!390482 m!386821))

(declare-fun m!386823 () Bool)

(assert (=> b!390482 m!386823))

(declare-fun m!386825 () Bool)

(assert (=> b!390482 m!386825))

(assert (=> b!390482 m!386809))

(declare-fun m!386827 () Bool)

(assert (=> b!390482 m!386827))

(assert (=> b!390482 m!386817))

(declare-fun m!386829 () Bool)

(assert (=> b!390482 m!386829))

(declare-fun m!386831 () Bool)

(assert (=> b!390482 m!386831))

(declare-fun m!386833 () Bool)

(assert (=> b!390482 m!386833))

(declare-fun m!386835 () Bool)

(assert (=> b!390482 m!386835))

(assert (=> b!390482 m!386829))

(assert (=> b!390482 m!386823))

(declare-fun m!386837 () Bool)

(assert (=> b!390482 m!386837))

(assert (=> b!390292 d!72987))

(declare-fun b!390503 () Bool)

(declare-fun e!236545 () Unit!11952)

(declare-fun lt!184081 () Unit!11952)

(assert (=> b!390503 (= e!236545 lt!184081)))

(declare-fun lt!184066 () ListLongMap!5449)

(assert (=> b!390503 (= lt!184066 (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184067 () (_ BitVec 64))

(assert (=> b!390503 (= lt!184067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184080 () (_ BitVec 64))

(assert (=> b!390503 (= lt!184080 (select (arr!11041 lt!183917) #b00000000000000000000000000000000))))

(declare-fun lt!184082 () Unit!11952)

(assert (=> b!390503 (= lt!184082 (addStillContains!277 lt!184066 lt!184067 zeroValue!472 lt!184080))))

(assert (=> b!390503 (contains!2453 (+!1035 lt!184066 (tuple2!6537 lt!184067 zeroValue!472)) lt!184080)))

(declare-fun lt!184065 () Unit!11952)

(assert (=> b!390503 (= lt!184065 lt!184082)))

(declare-fun lt!184084 () ListLongMap!5449)

(assert (=> b!390503 (= lt!184084 (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184074 () (_ BitVec 64))

(assert (=> b!390503 (= lt!184074 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184068 () (_ BitVec 64))

(assert (=> b!390503 (= lt!184068 (select (arr!11041 lt!183917) #b00000000000000000000000000000000))))

(declare-fun lt!184064 () Unit!11952)

(assert (=> b!390503 (= lt!184064 (addApplyDifferent!277 lt!184084 lt!184074 minValue!472 lt!184068))))

(assert (=> b!390503 (= (apply!301 (+!1035 lt!184084 (tuple2!6537 lt!184074 minValue!472)) lt!184068) (apply!301 lt!184084 lt!184068))))

(declare-fun lt!184072 () Unit!11952)

(assert (=> b!390503 (= lt!184072 lt!184064)))

(declare-fun lt!184070 () ListLongMap!5449)

(assert (=> b!390503 (= lt!184070 (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184083 () (_ BitVec 64))

(assert (=> b!390503 (= lt!184083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184085 () (_ BitVec 64))

(assert (=> b!390503 (= lt!184085 (select (arr!11041 lt!183917) #b00000000000000000000000000000000))))

(declare-fun lt!184077 () Unit!11952)

(assert (=> b!390503 (= lt!184077 (addApplyDifferent!277 lt!184070 lt!184083 zeroValue!472 lt!184085))))

(assert (=> b!390503 (= (apply!301 (+!1035 lt!184070 (tuple2!6537 lt!184083 zeroValue!472)) lt!184085) (apply!301 lt!184070 lt!184085))))

(declare-fun lt!184078 () Unit!11952)

(assert (=> b!390503 (= lt!184078 lt!184077)))

(declare-fun lt!184071 () ListLongMap!5449)

(assert (=> b!390503 (= lt!184071 (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184079 () (_ BitVec 64))

(assert (=> b!390503 (= lt!184079 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184073 () (_ BitVec 64))

(assert (=> b!390503 (= lt!184073 (select (arr!11041 lt!183917) #b00000000000000000000000000000000))))

(assert (=> b!390503 (= lt!184081 (addApplyDifferent!277 lt!184071 lt!184079 minValue!472 lt!184073))))

(assert (=> b!390503 (= (apply!301 (+!1035 lt!184071 (tuple2!6537 lt!184079 minValue!472)) lt!184073) (apply!301 lt!184071 lt!184073))))

(declare-fun bm!27527 () Bool)

(declare-fun call!27532 () ListLongMap!5449)

(declare-fun call!27530 () ListLongMap!5449)

(assert (=> bm!27527 (= call!27532 call!27530)))

(declare-fun bm!27528 () Bool)

(declare-fun call!27534 () ListLongMap!5449)

(declare-fun call!27533 () ListLongMap!5449)

(assert (=> bm!27528 (= call!27534 call!27533)))

(declare-fun b!390504 () Bool)

(declare-fun res!223460 () Bool)

(declare-fun e!236555 () Bool)

(assert (=> b!390504 (=> (not res!223460) (not e!236555))))

(declare-fun e!236551 () Bool)

(assert (=> b!390504 (= res!223460 e!236551)))

(declare-fun c!54173 () Bool)

(assert (=> b!390504 (= c!54173 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!390505 () Bool)

(declare-fun res!223461 () Bool)

(assert (=> b!390505 (=> (not res!223461) (not e!236555))))

(declare-fun e!236544 () Bool)

(assert (=> b!390505 (= res!223461 e!236544)))

(declare-fun res!223456 () Bool)

(assert (=> b!390505 (=> res!223456 e!236544)))

(declare-fun e!236549 () Bool)

(assert (=> b!390505 (= res!223456 (not e!236549))))

(declare-fun res!223459 () Bool)

(assert (=> b!390505 (=> (not res!223459) (not e!236549))))

(assert (=> b!390505 (= res!223459 (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(declare-fun bm!27529 () Bool)

(declare-fun call!27536 () Bool)

(declare-fun lt!184075 () ListLongMap!5449)

(assert (=> bm!27529 (= call!27536 (contains!2453 lt!184075 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390506 () Bool)

(declare-fun e!236553 () Bool)

(assert (=> b!390506 (= e!236553 (validKeyInArray!0 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(declare-fun b!390507 () Bool)

(declare-fun e!236547 () Bool)

(assert (=> b!390507 (= e!236547 (not call!27536))))

(declare-fun b!390508 () Bool)

(declare-fun c!54176 () Bool)

(assert (=> b!390508 (= c!54176 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236550 () ListLongMap!5449)

(declare-fun e!236554 () ListLongMap!5449)

(assert (=> b!390508 (= e!236550 e!236554)))

(declare-fun b!390509 () Bool)

(declare-fun e!236548 () Bool)

(assert (=> b!390509 (= e!236544 e!236548)))

(declare-fun res!223463 () Bool)

(assert (=> b!390509 (=> (not res!223463) (not e!236548))))

(assert (=> b!390509 (= res!223463 (contains!2453 lt!184075 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(assert (=> b!390509 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(declare-fun b!390510 () Bool)

(assert (=> b!390510 (= e!236549 (validKeyInArray!0 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(declare-fun b!390511 () Bool)

(assert (=> b!390511 (= e!236550 call!27532)))

(declare-fun d!72989 () Bool)

(assert (=> d!72989 e!236555))

(declare-fun res!223462 () Bool)

(assert (=> d!72989 (=> (not res!223462) (not e!236555))))

(assert (=> d!72989 (= res!223462 (or (bvsge #b00000000000000000000000000000000 (size!11393 lt!183917)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))))

(declare-fun lt!184076 () ListLongMap!5449)

(assert (=> d!72989 (= lt!184075 lt!184076)))

(declare-fun lt!184069 () Unit!11952)

(assert (=> d!72989 (= lt!184069 e!236545)))

(declare-fun c!54177 () Bool)

(assert (=> d!72989 (= c!54177 e!236553)))

(declare-fun res!223455 () Bool)

(assert (=> d!72989 (=> (not res!223455) (not e!236553))))

(assert (=> d!72989 (= res!223455 (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(declare-fun e!236546 () ListLongMap!5449)

(assert (=> d!72989 (= lt!184076 e!236546)))

(declare-fun c!54174 () Bool)

(assert (=> d!72989 (= c!54174 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72989 (validMask!0 mask!970)))

(assert (=> d!72989 (= (getCurrentListMap!2087 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184075)))

(declare-fun b!390512 () Bool)

(assert (=> b!390512 (= e!236548 (= (apply!301 lt!184075 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)) (get!5583 (select (arr!11040 lt!183921) #b00000000000000000000000000000000) (dynLambda!644 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11392 lt!183921)))))

(assert (=> b!390512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(declare-fun bm!27530 () Bool)

(declare-fun call!27531 () ListLongMap!5449)

(assert (=> bm!27530 (= call!27531 call!27534)))

(declare-fun bm!27531 () Bool)

(assert (=> bm!27531 (= call!27533 (getCurrentListMapNoExtraKeys!967 lt!183917 lt!183921 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390513 () Bool)

(declare-fun e!236552 () Bool)

(assert (=> b!390513 (= e!236547 e!236552)))

(declare-fun res!223457 () Bool)

(assert (=> b!390513 (= res!223457 call!27536)))

(assert (=> b!390513 (=> (not res!223457) (not e!236552))))

(declare-fun b!390514 () Bool)

(assert (=> b!390514 (= e!236555 e!236547)))

(declare-fun c!54172 () Bool)

(assert (=> b!390514 (= c!54172 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390515 () Bool)

(declare-fun call!27535 () Bool)

(assert (=> b!390515 (= e!236551 (not call!27535))))

(declare-fun c!54175 () Bool)

(declare-fun bm!27532 () Bool)

(assert (=> bm!27532 (= call!27530 (+!1035 (ite c!54174 call!27533 (ite c!54175 call!27534 call!27531)) (ite (or c!54174 c!54175) (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!390516 () Bool)

(assert (=> b!390516 (= e!236552 (= (apply!301 lt!184075 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!390517 () Bool)

(declare-fun e!236543 () Bool)

(assert (=> b!390517 (= e!236543 (= (apply!301 lt!184075 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!390518 () Bool)

(assert (=> b!390518 (= e!236554 call!27531)))

(declare-fun b!390519 () Bool)

(assert (=> b!390519 (= e!236546 e!236550)))

(assert (=> b!390519 (= c!54175 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!390520 () Bool)

(declare-fun Unit!11955 () Unit!11952)

(assert (=> b!390520 (= e!236545 Unit!11955)))

(declare-fun b!390521 () Bool)

(assert (=> b!390521 (= e!236551 e!236543)))

(declare-fun res!223458 () Bool)

(assert (=> b!390521 (= res!223458 call!27535)))

(assert (=> b!390521 (=> (not res!223458) (not e!236543))))

(declare-fun b!390522 () Bool)

(assert (=> b!390522 (= e!236554 call!27532)))

(declare-fun bm!27533 () Bool)

(assert (=> bm!27533 (= call!27535 (contains!2453 lt!184075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!390523 () Bool)

(assert (=> b!390523 (= e!236546 (+!1035 call!27530 (tuple2!6537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72989 c!54174) b!390523))

(assert (= (and d!72989 (not c!54174)) b!390519))

(assert (= (and b!390519 c!54175) b!390511))

(assert (= (and b!390519 (not c!54175)) b!390508))

(assert (= (and b!390508 c!54176) b!390522))

(assert (= (and b!390508 (not c!54176)) b!390518))

(assert (= (or b!390522 b!390518) bm!27530))

(assert (= (or b!390511 bm!27530) bm!27528))

(assert (= (or b!390511 b!390522) bm!27527))

(assert (= (or b!390523 bm!27528) bm!27531))

(assert (= (or b!390523 bm!27527) bm!27532))

(assert (= (and d!72989 res!223455) b!390506))

(assert (= (and d!72989 c!54177) b!390503))

(assert (= (and d!72989 (not c!54177)) b!390520))

(assert (= (and d!72989 res!223462) b!390505))

(assert (= (and b!390505 res!223459) b!390510))

(assert (= (and b!390505 (not res!223456)) b!390509))

(assert (= (and b!390509 res!223463) b!390512))

(assert (= (and b!390505 res!223461) b!390504))

(assert (= (and b!390504 c!54173) b!390521))

(assert (= (and b!390504 (not c!54173)) b!390515))

(assert (= (and b!390521 res!223458) b!390517))

(assert (= (or b!390521 b!390515) bm!27533))

(assert (= (and b!390504 res!223460) b!390514))

(assert (= (and b!390514 c!54172) b!390513))

(assert (= (and b!390514 (not c!54172)) b!390507))

(assert (= (and b!390513 res!223457) b!390516))

(assert (= (or b!390513 b!390507) bm!27529))

(declare-fun b_lambda!8633 () Bool)

(assert (=> (not b_lambda!8633) (not b!390512)))

(assert (=> b!390512 t!11554))

(declare-fun b_and!16259 () Bool)

(assert (= b_and!16257 (and (=> t!11554 result!5731) b_and!16259)))

(assert (=> b!390510 m!386707))

(assert (=> b!390510 m!386707))

(assert (=> b!390510 m!386709))

(assert (=> b!390506 m!386707))

(assert (=> b!390506 m!386707))

(assert (=> b!390506 m!386709))

(declare-fun m!386839 () Bool)

(assert (=> bm!27529 m!386839))

(assert (=> b!390509 m!386707))

(assert (=> b!390509 m!386707))

(declare-fun m!386841 () Bool)

(assert (=> b!390509 m!386841))

(declare-fun m!386843 () Bool)

(assert (=> b!390516 m!386843))

(declare-fun m!386845 () Bool)

(assert (=> b!390517 m!386845))

(assert (=> b!390512 m!386747))

(assert (=> b!390512 m!386707))

(assert (=> b!390512 m!386747))

(assert (=> b!390512 m!386749))

(assert (=> b!390512 m!386751))

(assert (=> b!390512 m!386707))

(declare-fun m!386847 () Bool)

(assert (=> b!390512 m!386847))

(assert (=> b!390512 m!386749))

(declare-fun m!386849 () Bool)

(assert (=> bm!27532 m!386849))

(declare-fun m!386851 () Bool)

(assert (=> b!390523 m!386851))

(assert (=> d!72989 m!386659))

(assert (=> bm!27531 m!386635))

(declare-fun m!386853 () Bool)

(assert (=> bm!27533 m!386853))

(declare-fun m!386855 () Bool)

(assert (=> b!390503 m!386855))

(declare-fun m!386857 () Bool)

(assert (=> b!390503 m!386857))

(declare-fun m!386859 () Bool)

(assert (=> b!390503 m!386859))

(declare-fun m!386861 () Bool)

(assert (=> b!390503 m!386861))

(assert (=> b!390503 m!386635))

(declare-fun m!386863 () Bool)

(assert (=> b!390503 m!386863))

(declare-fun m!386865 () Bool)

(assert (=> b!390503 m!386865))

(assert (=> b!390503 m!386707))

(declare-fun m!386867 () Bool)

(assert (=> b!390503 m!386867))

(declare-fun m!386869 () Bool)

(assert (=> b!390503 m!386869))

(declare-fun m!386871 () Bool)

(assert (=> b!390503 m!386871))

(assert (=> b!390503 m!386855))

(declare-fun m!386873 () Bool)

(assert (=> b!390503 m!386873))

(assert (=> b!390503 m!386863))

(declare-fun m!386875 () Bool)

(assert (=> b!390503 m!386875))

(declare-fun m!386877 () Bool)

(assert (=> b!390503 m!386877))

(declare-fun m!386879 () Bool)

(assert (=> b!390503 m!386879))

(declare-fun m!386881 () Bool)

(assert (=> b!390503 m!386881))

(assert (=> b!390503 m!386875))

(assert (=> b!390503 m!386869))

(declare-fun m!386883 () Bool)

(assert (=> b!390503 m!386883))

(assert (=> b!390292 d!72989))

(declare-fun b!390524 () Bool)

(declare-fun e!236557 () Bool)

(declare-fun call!27537 () Bool)

(assert (=> b!390524 (= e!236557 call!27537)))

(declare-fun bm!27534 () Bool)

(assert (=> bm!27534 (= call!27537 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!390525 () Bool)

(declare-fun e!236558 () Bool)

(declare-fun e!236556 () Bool)

(assert (=> b!390525 (= e!236558 e!236556)))

(declare-fun c!54178 () Bool)

(assert (=> b!390525 (= c!54178 (validKeyInArray!0 (select (arr!11041 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390526 () Bool)

(assert (=> b!390526 (= e!236556 call!27537)))

(declare-fun d!72991 () Bool)

(declare-fun res!223465 () Bool)

(assert (=> d!72991 (=> res!223465 e!236558)))

(assert (=> d!72991 (= res!223465 (bvsge #b00000000000000000000000000000000 (size!11393 _keys!658)))))

(assert (=> d!72991 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236558)))

(declare-fun b!390527 () Bool)

(assert (=> b!390527 (= e!236556 e!236557)))

(declare-fun lt!184088 () (_ BitVec 64))

(assert (=> b!390527 (= lt!184088 (select (arr!11041 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184087 () Unit!11952)

(assert (=> b!390527 (= lt!184087 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!184088 #b00000000000000000000000000000000))))

(assert (=> b!390527 (arrayContainsKey!0 _keys!658 lt!184088 #b00000000000000000000000000000000)))

(declare-fun lt!184086 () Unit!11952)

(assert (=> b!390527 (= lt!184086 lt!184087)))

(declare-fun res!223464 () Bool)

(assert (=> b!390527 (= res!223464 (= (seekEntryOrOpen!0 (select (arr!11041 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3512 #b00000000000000000000000000000000)))))

(assert (=> b!390527 (=> (not res!223464) (not e!236557))))

(assert (= (and d!72991 (not res!223465)) b!390525))

(assert (= (and b!390525 c!54178) b!390527))

(assert (= (and b!390525 (not c!54178)) b!390526))

(assert (= (and b!390527 res!223464) b!390524))

(assert (= (or b!390524 b!390526) bm!27534))

(declare-fun m!386885 () Bool)

(assert (=> bm!27534 m!386885))

(assert (=> b!390525 m!386717))

(assert (=> b!390525 m!386717))

(assert (=> b!390525 m!386719))

(assert (=> b!390527 m!386717))

(declare-fun m!386887 () Bool)

(assert (=> b!390527 m!386887))

(declare-fun m!386889 () Bool)

(assert (=> b!390527 m!386889))

(assert (=> b!390527 m!386717))

(declare-fun m!386891 () Bool)

(assert (=> b!390527 m!386891))

(assert (=> b!390297 d!72991))

(declare-fun d!72993 () Bool)

(assert (=> d!72993 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390294 d!72993))

(declare-fun d!72995 () Bool)

(declare-fun e!236559 () Bool)

(assert (=> d!72995 e!236559))

(declare-fun res!223467 () Bool)

(assert (=> d!72995 (=> (not res!223467) (not e!236559))))

(declare-fun lt!184090 () ListLongMap!5449)

(assert (=> d!72995 (= res!223467 (contains!2453 lt!184090 (_1!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun lt!184091 () List!6391)

(assert (=> d!72995 (= lt!184090 (ListLongMap!5450 lt!184091))))

(declare-fun lt!184089 () Unit!11952)

(declare-fun lt!184092 () Unit!11952)

(assert (=> d!72995 (= lt!184089 lt!184092)))

(assert (=> d!72995 (= (getValueByKey!359 lt!184091 (_1!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!364 (_2!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72995 (= lt!184092 (lemmaContainsTupThenGetReturnValue!181 lt!184091 (_1!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72995 (= lt!184091 (insertStrictlySorted!184 (toList!2740 lt!183915) (_1!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72995 (= (+!1035 lt!183915 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) lt!184090)))

(declare-fun b!390528 () Bool)

(declare-fun res!223466 () Bool)

(assert (=> b!390528 (=> (not res!223466) (not e!236559))))

(assert (=> b!390528 (= res!223466 (= (getValueByKey!359 (toList!2740 lt!184090) (_1!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!364 (_2!3279 (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))))

(declare-fun b!390529 () Bool)

(assert (=> b!390529 (= e!236559 (contains!2454 (toList!2740 lt!184090) (tuple2!6537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))

(assert (= (and d!72995 res!223467) b!390528))

(assert (= (and b!390528 res!223466) b!390529))

(declare-fun m!386893 () Bool)

(assert (=> d!72995 m!386893))

(declare-fun m!386895 () Bool)

(assert (=> d!72995 m!386895))

(declare-fun m!386897 () Bool)

(assert (=> d!72995 m!386897))

(declare-fun m!386899 () Bool)

(assert (=> d!72995 m!386899))

(declare-fun m!386901 () Bool)

(assert (=> b!390528 m!386901))

(declare-fun m!386903 () Bool)

(assert (=> b!390529 m!386903))

(assert (=> b!390299 d!72995))

(declare-fun d!72997 () Bool)

(assert (=> d!72997 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37942 d!72997))

(declare-fun d!72999 () Bool)

(assert (=> d!72999 (= (array_inv!8110 _values!506) (bvsge (size!11392 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37942 d!72999))

(declare-fun d!73001 () Bool)

(assert (=> d!73001 (= (array_inv!8111 _keys!658) (bvsge (size!11393 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37942 d!73001))

(declare-fun d!73003 () Bool)

(declare-fun res!223472 () Bool)

(declare-fun e!236564 () Bool)

(assert (=> d!73003 (=> res!223472 e!236564)))

(assert (=> d!73003 (= res!223472 (= (select (arr!11041 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73003 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236564)))

(declare-fun b!390534 () Bool)

(declare-fun e!236565 () Bool)

(assert (=> b!390534 (= e!236564 e!236565)))

(declare-fun res!223473 () Bool)

(assert (=> b!390534 (=> (not res!223473) (not e!236565))))

(assert (=> b!390534 (= res!223473 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11393 _keys!658)))))

(declare-fun b!390535 () Bool)

(assert (=> b!390535 (= e!236565 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73003 (not res!223472)) b!390534))

(assert (= (and b!390534 res!223473) b!390535))

(assert (=> d!73003 m!386717))

(declare-fun m!386905 () Bool)

(assert (=> b!390535 m!386905))

(assert (=> b!390300 d!73003))

(declare-fun b!390536 () Bool)

(declare-fun e!236569 () Bool)

(declare-fun call!27538 () Bool)

(assert (=> b!390536 (= e!236569 call!27538)))

(declare-fun b!390537 () Bool)

(declare-fun e!236566 () Bool)

(declare-fun e!236568 () Bool)

(assert (=> b!390537 (= e!236566 e!236568)))

(declare-fun res!223476 () Bool)

(assert (=> b!390537 (=> (not res!223476) (not e!236568))))

(declare-fun e!236567 () Bool)

(assert (=> b!390537 (= res!223476 (not e!236567))))

(declare-fun res!223474 () Bool)

(assert (=> b!390537 (=> (not res!223474) (not e!236567))))

(assert (=> b!390537 (= res!223474 (validKeyInArray!0 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(declare-fun b!390538 () Bool)

(assert (=> b!390538 (= e!236569 call!27538)))

(declare-fun b!390539 () Bool)

(assert (=> b!390539 (= e!236567 (contains!2452 Nil!6389 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(declare-fun b!390540 () Bool)

(assert (=> b!390540 (= e!236568 e!236569)))

(declare-fun c!54179 () Bool)

(assert (=> b!390540 (= c!54179 (validKeyInArray!0 (select (arr!11041 lt!183917) #b00000000000000000000000000000000)))))

(declare-fun bm!27535 () Bool)

(assert (=> bm!27535 (= call!27538 (arrayNoDuplicates!0 lt!183917 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54179 (Cons!6388 (select (arr!11041 lt!183917) #b00000000000000000000000000000000) Nil!6389) Nil!6389)))))

(declare-fun d!73005 () Bool)

(declare-fun res!223475 () Bool)

(assert (=> d!73005 (=> res!223475 e!236566)))

(assert (=> d!73005 (= res!223475 (bvsge #b00000000000000000000000000000000 (size!11393 lt!183917)))))

(assert (=> d!73005 (= (arrayNoDuplicates!0 lt!183917 #b00000000000000000000000000000000 Nil!6389) e!236566)))

(assert (= (and d!73005 (not res!223475)) b!390537))

(assert (= (and b!390537 res!223474) b!390539))

(assert (= (and b!390537 res!223476) b!390540))

(assert (= (and b!390540 c!54179) b!390536))

(assert (= (and b!390540 (not c!54179)) b!390538))

(assert (= (or b!390536 b!390538) bm!27535))

(assert (=> b!390537 m!386707))

(assert (=> b!390537 m!386707))

(assert (=> b!390537 m!386709))

(assert (=> b!390539 m!386707))

(assert (=> b!390539 m!386707))

(declare-fun m!386907 () Bool)

(assert (=> b!390539 m!386907))

(assert (=> b!390540 m!386707))

(assert (=> b!390540 m!386707))

(assert (=> b!390540 m!386709))

(assert (=> bm!27535 m!386707))

(declare-fun m!386909 () Bool)

(assert (=> bm!27535 m!386909))

(assert (=> b!390304 d!73005))

(declare-fun b!390547 () Bool)

(declare-fun e!236575 () Bool)

(assert (=> b!390547 (= e!236575 tp_is_empty!9627)))

(declare-fun b!390548 () Bool)

(declare-fun e!236574 () Bool)

(assert (=> b!390548 (= e!236574 tp_is_empty!9627)))

(declare-fun condMapEmpty!16023 () Bool)

(declare-fun mapDefault!16023 () ValueCell!4470)

(assert (=> mapNonEmpty!16017 (= condMapEmpty!16023 (= mapRest!16017 ((as const (Array (_ BitVec 32) ValueCell!4470)) mapDefault!16023)))))

(declare-fun mapRes!16023 () Bool)

(assert (=> mapNonEmpty!16017 (= tp!31628 (and e!236574 mapRes!16023))))

(declare-fun mapIsEmpty!16023 () Bool)

(assert (=> mapIsEmpty!16023 mapRes!16023))

(declare-fun mapNonEmpty!16023 () Bool)

(declare-fun tp!31638 () Bool)

(assert (=> mapNonEmpty!16023 (= mapRes!16023 (and tp!31638 e!236575))))

(declare-fun mapRest!16023 () (Array (_ BitVec 32) ValueCell!4470))

(declare-fun mapKey!16023 () (_ BitVec 32))

(declare-fun mapValue!16023 () ValueCell!4470)

(assert (=> mapNonEmpty!16023 (= mapRest!16017 (store mapRest!16023 mapKey!16023 mapValue!16023))))

(assert (= (and mapNonEmpty!16017 condMapEmpty!16023) mapIsEmpty!16023))

(assert (= (and mapNonEmpty!16017 (not condMapEmpty!16023)) mapNonEmpty!16023))

(assert (= (and mapNonEmpty!16023 ((_ is ValueCellFull!4470) mapValue!16023)) b!390547))

(assert (= (and mapNonEmpty!16017 ((_ is ValueCellFull!4470) mapDefault!16023)) b!390548))

(declare-fun m!386911 () Bool)

(assert (=> mapNonEmpty!16023 m!386911))

(declare-fun b_lambda!8635 () Bool)

(assert (= b_lambda!8629 (or (and start!37942 b_free!8955) b_lambda!8635)))

(declare-fun b_lambda!8637 () Bool)

(assert (= b_lambda!8631 (or (and start!37942 b_free!8955) b_lambda!8637)))

(declare-fun b_lambda!8639 () Bool)

(assert (= b_lambda!8627 (or (and start!37942 b_free!8955) b_lambda!8639)))

(declare-fun b_lambda!8641 () Bool)

(assert (= b_lambda!8633 (or (and start!37942 b_free!8955) b_lambda!8641)))

(declare-fun b_lambda!8643 () Bool)

(assert (= b_lambda!8625 (or (and start!37942 b_free!8955) b_lambda!8643)))

(declare-fun b_lambda!8645 () Bool)

(assert (= b_lambda!8623 (or (and start!37942 b_free!8955) b_lambda!8645)))

(check-sat (not b!390436) (not b!390359) (not b!390371) (not bm!27505) (not bm!27525) (not b_lambda!8635) (not b!390423) (not d!72987) (not b!390482) (not bm!27504) (not bm!27500) (not d!72989) (not bm!27534) (not bm!27524) (not b!390418) (not b!390537) (not b!390502) (not b!390488) (not b!390389) (not b!390434) (not bm!27492) (not b!390428) (not b!390415) (not d!72995) (not b!390357) (not b!390432) (not b!390489) (not b_lambda!8645) (not b_lambda!8641) (not b!390374) b_and!16259 (not b!390512) (not d!72979) (not b_lambda!8639) (not bm!27535) (not bm!27526) (not b!390388) (not bm!27529) (not bm!27501) (not b!390495) (not b!390539) (not b!390433) (not b!390516) (not b!390527) (not b!390381) (not b_lambda!8637) (not b!390422) (not b!390419) (not b!390509) (not bm!27495) (not b!390503) (not b!390510) (not bm!27533) (not b!390373) (not b!390496) (not b!390425) (not b_next!8955) (not b!390540) (not b!390414) (not b!390517) (not bm!27522) (not b!390420) (not bm!27532) (not b!390528) (not d!72983) (not d!72981) (not d!72985) (not b!390429) (not mapNonEmpty!16023) (not b_lambda!8643) (not b!390491) (not b!390506) (not b!390485) (not b!390535) (not b!390525) (not bm!27531) (not b!390437) (not b!390529) (not b!390439) (not b!390523) tp_is_empty!9627)
(check-sat b_and!16259 (not b_next!8955))
