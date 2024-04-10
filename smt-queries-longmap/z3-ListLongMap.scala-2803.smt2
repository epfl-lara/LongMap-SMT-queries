; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40708 () Bool)

(assert start!40708)

(declare-fun b_free!10719 () Bool)

(declare-fun b_next!10719 () Bool)

(assert (=> start!40708 (= b_free!10719 (not b_next!10719))))

(declare-fun tp!37976 () Bool)

(declare-fun b_and!18727 () Bool)

(assert (=> start!40708 (= tp!37976 b_and!18727)))

(declare-datatypes ((array!27921 0))(
  ( (array!27922 (arr!13406 (Array (_ BitVec 32) (_ BitVec 64))) (size!13758 (_ BitVec 32))) )
))
(declare-fun lt!204615 () array!27921)

(declare-datatypes ((V!17181 0))(
  ( (V!17182 (val!6073 Int)) )
))
(declare-datatypes ((tuple2!7976 0))(
  ( (tuple2!7977 (_1!3999 (_ BitVec 64)) (_2!3999 V!17181)) )
))
(declare-datatypes ((List!8043 0))(
  ( (Nil!8040) (Cons!8039 (h!8895 tuple2!7976) (t!13805 List!8043)) )
))
(declare-datatypes ((ListLongMap!6889 0))(
  ( (ListLongMap!6890 (toList!3460 List!8043)) )
))
(declare-fun call!29749 () ListLongMap!6889)

(declare-fun minValue!515 () V!17181)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5685 0))(
  ( (ValueCellFull!5685 (v!8328 V!17181)) (EmptyCell!5685) )
))
(declare-datatypes ((array!27923 0))(
  ( (array!27924 (arr!13407 (Array (_ BitVec 32) ValueCell!5685)) (size!13759 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27923)

(declare-fun zeroValue!515 () V!17181)

(declare-fun bm!29746 () Bool)

(declare-fun lt!204613 () array!27923)

(declare-fun c!55985 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27921)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1645 (array!27921 array!27923 (_ BitVec 32) (_ BitVec 32) V!17181 V!17181 (_ BitVec 32) Int) ListLongMap!6889)

(assert (=> bm!29746 (= call!29749 (getCurrentListMapNoExtraKeys!1645 (ite c!55985 lt!204615 _keys!709) (ite c!55985 lt!204613 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450452 () Bool)

(declare-fun e!263969 () Bool)

(declare-fun call!29750 () ListLongMap!6889)

(assert (=> b!450452 (= e!263969 (= call!29750 call!29749))))

(declare-fun b!450453 () Bool)

(declare-fun res!268113 () Bool)

(declare-fun e!263965 () Bool)

(assert (=> b!450453 (=> (not res!268113) (not e!263965))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450453 (= res!268113 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13758 _keys!709))))))

(declare-fun mapNonEmpty!19719 () Bool)

(declare-fun mapRes!19719 () Bool)

(declare-fun tp!37977 () Bool)

(declare-fun e!263967 () Bool)

(assert (=> mapNonEmpty!19719 (= mapRes!19719 (and tp!37977 e!263967))))

(declare-fun mapRest!19719 () (Array (_ BitVec 32) ValueCell!5685))

(declare-fun mapValue!19719 () ValueCell!5685)

(declare-fun mapKey!19719 () (_ BitVec 32))

(assert (=> mapNonEmpty!19719 (= (arr!13407 _values!549) (store mapRest!19719 mapKey!19719 mapValue!19719))))

(declare-fun b!450454 () Bool)

(declare-fun e!263963 () Bool)

(declare-fun e!263968 () Bool)

(assert (=> b!450454 (= e!263963 (and e!263968 mapRes!19719))))

(declare-fun condMapEmpty!19719 () Bool)

(declare-fun mapDefault!19719 () ValueCell!5685)

(assert (=> b!450454 (= condMapEmpty!19719 (= (arr!13407 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5685)) mapDefault!19719)))))

(declare-fun b!450455 () Bool)

(declare-fun res!268112 () Bool)

(assert (=> b!450455 (=> (not res!268112) (not e!263965))))

(assert (=> b!450455 (= res!268112 (and (= (size!13759 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13758 _keys!709) (size!13759 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450456 () Bool)

(declare-fun e!263964 () Bool)

(assert (=> b!450456 (= e!263965 e!263964)))

(declare-fun res!268103 () Bool)

(assert (=> b!450456 (=> (not res!268103) (not e!263964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27921 (_ BitVec 32)) Bool)

(assert (=> b!450456 (= res!268103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204615 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!450456 (= lt!204615 (array!27922 (store (arr!13406 _keys!709) i!563 k0!794) (size!13758 _keys!709)))))

(declare-fun b!450457 () Bool)

(declare-fun tp_is_empty!12057 () Bool)

(assert (=> b!450457 (= e!263968 tp_is_empty!12057)))

(declare-fun b!450458 () Bool)

(declare-fun res!268104 () Bool)

(assert (=> b!450458 (=> (not res!268104) (not e!263964))))

(assert (=> b!450458 (= res!268104 (bvsle from!863 i!563))))

(declare-fun b!450459 () Bool)

(declare-fun res!268106 () Bool)

(assert (=> b!450459 (=> (not res!268106) (not e!263965))))

(declare-datatypes ((List!8044 0))(
  ( (Nil!8041) (Cons!8040 (h!8896 (_ BitVec 64)) (t!13806 List!8044)) )
))
(declare-fun arrayNoDuplicates!0 (array!27921 (_ BitVec 32) List!8044) Bool)

(assert (=> b!450459 (= res!268106 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8041))))

(declare-fun b!450460 () Bool)

(declare-fun res!268111 () Bool)

(assert (=> b!450460 (=> (not res!268111) (not e!263965))))

(declare-fun arrayContainsKey!0 (array!27921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450460 (= res!268111 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450461 () Bool)

(assert (=> b!450461 (= e!263967 tp_is_empty!12057)))

(declare-fun mapIsEmpty!19719 () Bool)

(assert (=> mapIsEmpty!19719 mapRes!19719))

(declare-fun b!450462 () Bool)

(declare-fun res!268101 () Bool)

(assert (=> b!450462 (=> (not res!268101) (not e!263965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450462 (= res!268101 (validKeyInArray!0 k0!794))))

(declare-fun b!450463 () Bool)

(declare-fun e!263962 () Bool)

(assert (=> b!450463 (= e!263962 (not true))))

(assert (=> b!450463 e!263969))

(assert (=> b!450463 (= c!55985 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13192 0))(
  ( (Unit!13193) )
))
(declare-fun lt!204614 () Unit!13192)

(declare-fun v!412 () V!17181)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!711 (array!27921 array!27923 (_ BitVec 32) (_ BitVec 32) V!17181 V!17181 (_ BitVec 32) (_ BitVec 64) V!17181 (_ BitVec 32) Int) Unit!13192)

(assert (=> b!450463 (= lt!204614 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!711 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450464 () Bool)

(declare-fun +!1541 (ListLongMap!6889 tuple2!7976) ListLongMap!6889)

(assert (=> b!450464 (= e!263969 (= call!29749 (+!1541 call!29750 (tuple2!7977 k0!794 v!412))))))

(declare-fun res!268108 () Bool)

(assert (=> start!40708 (=> (not res!268108) (not e!263965))))

(assert (=> start!40708 (= res!268108 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13758 _keys!709))))))

(assert (=> start!40708 e!263965))

(assert (=> start!40708 tp_is_empty!12057))

(assert (=> start!40708 tp!37976))

(assert (=> start!40708 true))

(declare-fun array_inv!9706 (array!27923) Bool)

(assert (=> start!40708 (and (array_inv!9706 _values!549) e!263963)))

(declare-fun array_inv!9707 (array!27921) Bool)

(assert (=> start!40708 (array_inv!9707 _keys!709)))

(declare-fun b!450465 () Bool)

(assert (=> b!450465 (= e!263964 e!263962)))

(declare-fun res!268105 () Bool)

(assert (=> b!450465 (=> (not res!268105) (not e!263962))))

(assert (=> b!450465 (= res!268105 (= from!863 i!563))))

(declare-fun lt!204611 () ListLongMap!6889)

(assert (=> b!450465 (= lt!204611 (getCurrentListMapNoExtraKeys!1645 lt!204615 lt!204613 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450465 (= lt!204613 (array!27924 (store (arr!13407 _values!549) i!563 (ValueCellFull!5685 v!412)) (size!13759 _values!549)))))

(declare-fun lt!204612 () ListLongMap!6889)

(assert (=> b!450465 (= lt!204612 (getCurrentListMapNoExtraKeys!1645 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450466 () Bool)

(declare-fun res!268109 () Bool)

(assert (=> b!450466 (=> (not res!268109) (not e!263964))))

(assert (=> b!450466 (= res!268109 (arrayNoDuplicates!0 lt!204615 #b00000000000000000000000000000000 Nil!8041))))

(declare-fun b!450467 () Bool)

(declare-fun res!268107 () Bool)

(assert (=> b!450467 (=> (not res!268107) (not e!263965))))

(assert (=> b!450467 (= res!268107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450468 () Bool)

(declare-fun res!268110 () Bool)

(assert (=> b!450468 (=> (not res!268110) (not e!263965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450468 (= res!268110 (validMask!0 mask!1025))))

(declare-fun b!450469 () Bool)

(declare-fun res!268102 () Bool)

(assert (=> b!450469 (=> (not res!268102) (not e!263965))))

(assert (=> b!450469 (= res!268102 (or (= (select (arr!13406 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13406 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29747 () Bool)

(assert (=> bm!29747 (= call!29750 (getCurrentListMapNoExtraKeys!1645 (ite c!55985 _keys!709 lt!204615) (ite c!55985 _values!549 lt!204613) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40708 res!268108) b!450468))

(assert (= (and b!450468 res!268110) b!450455))

(assert (= (and b!450455 res!268112) b!450467))

(assert (= (and b!450467 res!268107) b!450459))

(assert (= (and b!450459 res!268106) b!450453))

(assert (= (and b!450453 res!268113) b!450462))

(assert (= (and b!450462 res!268101) b!450469))

(assert (= (and b!450469 res!268102) b!450460))

(assert (= (and b!450460 res!268111) b!450456))

(assert (= (and b!450456 res!268103) b!450466))

(assert (= (and b!450466 res!268109) b!450458))

(assert (= (and b!450458 res!268104) b!450465))

(assert (= (and b!450465 res!268105) b!450463))

(assert (= (and b!450463 c!55985) b!450464))

(assert (= (and b!450463 (not c!55985)) b!450452))

(assert (= (or b!450464 b!450452) bm!29746))

(assert (= (or b!450464 b!450452) bm!29747))

(assert (= (and b!450454 condMapEmpty!19719) mapIsEmpty!19719))

(assert (= (and b!450454 (not condMapEmpty!19719)) mapNonEmpty!19719))

(get-info :version)

(assert (= (and mapNonEmpty!19719 ((_ is ValueCellFull!5685) mapValue!19719)) b!450461))

(assert (= (and b!450454 ((_ is ValueCellFull!5685) mapDefault!19719)) b!450457))

(assert (= start!40708 b!450454))

(declare-fun m!434355 () Bool)

(assert (=> b!450464 m!434355))

(declare-fun m!434357 () Bool)

(assert (=> b!450456 m!434357))

(declare-fun m!434359 () Bool)

(assert (=> b!450456 m!434359))

(declare-fun m!434361 () Bool)

(assert (=> b!450465 m!434361))

(declare-fun m!434363 () Bool)

(assert (=> b!450465 m!434363))

(declare-fun m!434365 () Bool)

(assert (=> b!450465 m!434365))

(declare-fun m!434367 () Bool)

(assert (=> bm!29746 m!434367))

(declare-fun m!434369 () Bool)

(assert (=> b!450459 m!434369))

(declare-fun m!434371 () Bool)

(assert (=> b!450469 m!434371))

(declare-fun m!434373 () Bool)

(assert (=> b!450463 m!434373))

(declare-fun m!434375 () Bool)

(assert (=> start!40708 m!434375))

(declare-fun m!434377 () Bool)

(assert (=> start!40708 m!434377))

(declare-fun m!434379 () Bool)

(assert (=> b!450460 m!434379))

(declare-fun m!434381 () Bool)

(assert (=> bm!29747 m!434381))

(declare-fun m!434383 () Bool)

(assert (=> b!450466 m!434383))

(declare-fun m!434385 () Bool)

(assert (=> b!450462 m!434385))

(declare-fun m!434387 () Bool)

(assert (=> b!450468 m!434387))

(declare-fun m!434389 () Bool)

(assert (=> b!450467 m!434389))

(declare-fun m!434391 () Bool)

(assert (=> mapNonEmpty!19719 m!434391))

(check-sat (not mapNonEmpty!19719) (not b!450464) (not b!450466) (not b!450468) (not b!450463) (not b!450456) tp_is_empty!12057 (not b!450459) (not start!40708) b_and!18727 (not b!450462) (not b!450460) (not b_next!10719) (not bm!29746) (not b!450465) (not b!450467) (not bm!29747))
(check-sat b_and!18727 (not b_next!10719))
