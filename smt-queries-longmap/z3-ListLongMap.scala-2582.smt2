; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39312 () Bool)

(assert start!39312)

(declare-fun b_free!9579 () Bool)

(declare-fun b_next!9579 () Bool)

(assert (=> start!39312 (= b_free!9579 (not b_next!9579))))

(declare-fun tp!34265 () Bool)

(declare-fun b_and!17033 () Bool)

(assert (=> start!39312 (= tp!34265 b_and!17033)))

(declare-fun b!416368 () Bool)

(declare-fun e!248568 () Bool)

(assert (=> b!416368 (= e!248568 true)))

(declare-datatypes ((V!15413 0))(
  ( (V!15414 (val!5410 Int)) )
))
(declare-fun lt!190629 () V!15413)

(declare-datatypes ((tuple2!7054 0))(
  ( (tuple2!7055 (_1!3538 (_ BitVec 64)) (_2!3538 V!15413)) )
))
(declare-datatypes ((List!7073 0))(
  ( (Nil!7070) (Cons!7069 (h!7925 tuple2!7054) (t!12317 List!7073)) )
))
(declare-datatypes ((ListLongMap!5967 0))(
  ( (ListLongMap!5968 (toList!2999 List!7073)) )
))
(declare-fun lt!190635 () ListLongMap!5967)

(declare-fun lt!190630 () tuple2!7054)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1201 (ListLongMap!5967 tuple2!7054) ListLongMap!5967)

(assert (=> b!416368 (= (+!1201 lt!190635 lt!190630) (+!1201 (+!1201 lt!190635 (tuple2!7055 k0!794 lt!190629)) lt!190630))))

(declare-fun lt!190628 () V!15413)

(assert (=> b!416368 (= lt!190630 (tuple2!7055 k0!794 lt!190628))))

(declare-datatypes ((Unit!12306 0))(
  ( (Unit!12307) )
))
(declare-fun lt!190632 () Unit!12306)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!5 (ListLongMap!5967 (_ BitVec 64) V!15413 V!15413) Unit!12306)

(assert (=> b!416368 (= lt!190632 (addSameAsAddTwiceSameKeyDiffValues!5 lt!190635 k0!794 lt!190629 lt!190628))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5022 0))(
  ( (ValueCellFull!5022 (v!7657 V!15413)) (EmptyCell!5022) )
))
(declare-datatypes ((array!25317 0))(
  ( (array!25318 (arr!12108 (Array (_ BitVec 32) ValueCell!5022)) (size!12460 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25317)

(declare-fun lt!190634 () V!15413)

(declare-fun get!5983 (ValueCell!5022 V!15413) V!15413)

(assert (=> b!416368 (= lt!190629 (get!5983 (select (arr!12108 _values!549) from!863) lt!190634))))

(declare-datatypes ((array!25319 0))(
  ( (array!25320 (arr!12109 (Array (_ BitVec 32) (_ BitVec 64))) (size!12461 (_ BitVec 32))) )
))
(declare-fun lt!190627 () array!25319)

(declare-fun lt!190636 () ListLongMap!5967)

(assert (=> b!416368 (= lt!190636 (+!1201 lt!190635 (tuple2!7055 (select (arr!12109 lt!190627) from!863) lt!190628)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15413)

(assert (=> b!416368 (= lt!190628 (get!5983 (select (store (arr!12108 _values!549) i!563 (ValueCellFull!5022 v!412)) from!863) lt!190634))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!676 (Int (_ BitVec 64)) V!15413)

(assert (=> b!416368 (= lt!190634 (dynLambda!676 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15413)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15413)

(declare-fun lt!190637 () array!25317)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1204 (array!25319 array!25317 (_ BitVec 32) (_ BitVec 32) V!15413 V!15413 (_ BitVec 32) Int) ListLongMap!5967)

(assert (=> b!416368 (= lt!190635 (getCurrentListMapNoExtraKeys!1204 lt!190627 lt!190637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416369 () Bool)

(declare-fun res!242343 () Bool)

(declare-fun e!248567 () Bool)

(assert (=> b!416369 (=> (not res!242343) (not e!248567))))

(assert (=> b!416369 (= res!242343 (bvsle from!863 i!563))))

(declare-fun b!416370 () Bool)

(declare-fun res!242353 () Bool)

(assert (=> b!416370 (=> (not res!242353) (not e!248567))))

(declare-datatypes ((List!7074 0))(
  ( (Nil!7071) (Cons!7070 (h!7926 (_ BitVec 64)) (t!12318 List!7074)) )
))
(declare-fun arrayNoDuplicates!0 (array!25319 (_ BitVec 32) List!7074) Bool)

(assert (=> b!416370 (= res!242353 (arrayNoDuplicates!0 lt!190627 #b00000000000000000000000000000000 Nil!7071))))

(declare-fun b!416371 () Bool)

(declare-fun e!248571 () Bool)

(declare-fun tp_is_empty!10731 () Bool)

(assert (=> b!416371 (= e!248571 tp_is_empty!10731)))

(declare-fun b!416372 () Bool)

(declare-fun res!242350 () Bool)

(declare-fun e!248573 () Bool)

(assert (=> b!416372 (=> (not res!242350) (not e!248573))))

(declare-fun _keys!709 () array!25319)

(assert (=> b!416372 (= res!242350 (or (= (select (arr!12109 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12109 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28912 () Bool)

(declare-fun c!55082 () Bool)

(declare-fun call!28916 () ListLongMap!5967)

(assert (=> bm!28912 (= call!28916 (getCurrentListMapNoExtraKeys!1204 (ite c!55082 _keys!709 lt!190627) (ite c!55082 _values!549 lt!190637) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28913 () Bool)

(declare-fun call!28915 () ListLongMap!5967)

(assert (=> bm!28913 (= call!28915 (getCurrentListMapNoExtraKeys!1204 (ite c!55082 lt!190627 _keys!709) (ite c!55082 lt!190637 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416373 () Bool)

(declare-fun e!248570 () Bool)

(assert (=> b!416373 (= e!248570 (not e!248568))))

(declare-fun res!242354 () Bool)

(assert (=> b!416373 (=> res!242354 e!248568)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416373 (= res!242354 (validKeyInArray!0 (select (arr!12109 _keys!709) from!863)))))

(declare-fun e!248569 () Bool)

(assert (=> b!416373 e!248569))

(assert (=> b!416373 (= c!55082 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190633 () Unit!12306)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!409 (array!25319 array!25317 (_ BitVec 32) (_ BitVec 32) V!15413 V!15413 (_ BitVec 32) (_ BitVec 64) V!15413 (_ BitVec 32) Int) Unit!12306)

(assert (=> b!416373 (= lt!190633 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!409 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17718 () Bool)

(declare-fun mapRes!17718 () Bool)

(assert (=> mapIsEmpty!17718 mapRes!17718))

(declare-fun b!416374 () Bool)

(declare-fun res!242344 () Bool)

(assert (=> b!416374 (=> (not res!242344) (not e!248573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416374 (= res!242344 (validMask!0 mask!1025))))

(declare-fun b!416375 () Bool)

(declare-fun res!242346 () Bool)

(assert (=> b!416375 (=> (not res!242346) (not e!248573))))

(assert (=> b!416375 (= res!242346 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12461 _keys!709))))))

(declare-fun res!242355 () Bool)

(assert (=> start!39312 (=> (not res!242355) (not e!248573))))

(assert (=> start!39312 (= res!242355 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12461 _keys!709))))))

(assert (=> start!39312 e!248573))

(assert (=> start!39312 tp_is_empty!10731))

(assert (=> start!39312 tp!34265))

(assert (=> start!39312 true))

(declare-fun e!248566 () Bool)

(declare-fun array_inv!8830 (array!25317) Bool)

(assert (=> start!39312 (and (array_inv!8830 _values!549) e!248566)))

(declare-fun array_inv!8831 (array!25319) Bool)

(assert (=> start!39312 (array_inv!8831 _keys!709)))

(declare-fun b!416376 () Bool)

(declare-fun res!242345 () Bool)

(assert (=> b!416376 (=> (not res!242345) (not e!248573))))

(assert (=> b!416376 (= res!242345 (validKeyInArray!0 k0!794))))

(declare-fun b!416377 () Bool)

(declare-fun res!242349 () Bool)

(assert (=> b!416377 (=> (not res!242349) (not e!248573))))

(assert (=> b!416377 (= res!242349 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7071))))

(declare-fun b!416378 () Bool)

(assert (=> b!416378 (= e!248567 e!248570)))

(declare-fun res!242348 () Bool)

(assert (=> b!416378 (=> (not res!242348) (not e!248570))))

(assert (=> b!416378 (= res!242348 (= from!863 i!563))))

(assert (=> b!416378 (= lt!190636 (getCurrentListMapNoExtraKeys!1204 lt!190627 lt!190637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416378 (= lt!190637 (array!25318 (store (arr!12108 _values!549) i!563 (ValueCellFull!5022 v!412)) (size!12460 _values!549)))))

(declare-fun lt!190631 () ListLongMap!5967)

(assert (=> b!416378 (= lt!190631 (getCurrentListMapNoExtraKeys!1204 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416379 () Bool)

(assert (=> b!416379 (= e!248573 e!248567)))

(declare-fun res!242351 () Bool)

(assert (=> b!416379 (=> (not res!242351) (not e!248567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25319 (_ BitVec 32)) Bool)

(assert (=> b!416379 (= res!242351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190627 mask!1025))))

(assert (=> b!416379 (= lt!190627 (array!25320 (store (arr!12109 _keys!709) i!563 k0!794) (size!12461 _keys!709)))))

(declare-fun mapNonEmpty!17718 () Bool)

(declare-fun tp!34266 () Bool)

(assert (=> mapNonEmpty!17718 (= mapRes!17718 (and tp!34266 e!248571))))

(declare-fun mapValue!17718 () ValueCell!5022)

(declare-fun mapRest!17718 () (Array (_ BitVec 32) ValueCell!5022))

(declare-fun mapKey!17718 () (_ BitVec 32))

(assert (=> mapNonEmpty!17718 (= (arr!12108 _values!549) (store mapRest!17718 mapKey!17718 mapValue!17718))))

(declare-fun b!416380 () Bool)

(assert (=> b!416380 (= e!248569 (= call!28915 (+!1201 call!28916 (tuple2!7055 k0!794 v!412))))))

(declare-fun b!416381 () Bool)

(declare-fun e!248572 () Bool)

(assert (=> b!416381 (= e!248566 (and e!248572 mapRes!17718))))

(declare-fun condMapEmpty!17718 () Bool)

(declare-fun mapDefault!17718 () ValueCell!5022)

(assert (=> b!416381 (= condMapEmpty!17718 (= (arr!12108 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5022)) mapDefault!17718)))))

(declare-fun b!416382 () Bool)

(assert (=> b!416382 (= e!248569 (= call!28916 call!28915))))

(declare-fun b!416383 () Bool)

(assert (=> b!416383 (= e!248572 tp_is_empty!10731)))

(declare-fun b!416384 () Bool)

(declare-fun res!242347 () Bool)

(assert (=> b!416384 (=> (not res!242347) (not e!248573))))

(declare-fun arrayContainsKey!0 (array!25319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416384 (= res!242347 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416385 () Bool)

(declare-fun res!242352 () Bool)

(assert (=> b!416385 (=> (not res!242352) (not e!248573))))

(assert (=> b!416385 (= res!242352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416386 () Bool)

(declare-fun res!242342 () Bool)

(assert (=> b!416386 (=> (not res!242342) (not e!248573))))

(assert (=> b!416386 (= res!242342 (and (= (size!12460 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12461 _keys!709) (size!12460 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39312 res!242355) b!416374))

(assert (= (and b!416374 res!242344) b!416386))

(assert (= (and b!416386 res!242342) b!416385))

(assert (= (and b!416385 res!242352) b!416377))

(assert (= (and b!416377 res!242349) b!416375))

(assert (= (and b!416375 res!242346) b!416376))

(assert (= (and b!416376 res!242345) b!416372))

(assert (= (and b!416372 res!242350) b!416384))

(assert (= (and b!416384 res!242347) b!416379))

(assert (= (and b!416379 res!242351) b!416370))

(assert (= (and b!416370 res!242353) b!416369))

(assert (= (and b!416369 res!242343) b!416378))

(assert (= (and b!416378 res!242348) b!416373))

(assert (= (and b!416373 c!55082) b!416380))

(assert (= (and b!416373 (not c!55082)) b!416382))

(assert (= (or b!416380 b!416382) bm!28913))

(assert (= (or b!416380 b!416382) bm!28912))

(assert (= (and b!416373 (not res!242354)) b!416368))

(assert (= (and b!416381 condMapEmpty!17718) mapIsEmpty!17718))

(assert (= (and b!416381 (not condMapEmpty!17718)) mapNonEmpty!17718))

(get-info :version)

(assert (= (and mapNonEmpty!17718 ((_ is ValueCellFull!5022) mapValue!17718)) b!416371))

(assert (= (and b!416381 ((_ is ValueCellFull!5022) mapDefault!17718)) b!416383))

(assert (= start!39312 b!416381))

(declare-fun b_lambda!8883 () Bool)

(assert (=> (not b_lambda!8883) (not b!416368)))

(declare-fun t!12316 () Bool)

(declare-fun tb!3201 () Bool)

(assert (=> (and start!39312 (= defaultEntry!557 defaultEntry!557) t!12316) tb!3201))

(declare-fun result!5929 () Bool)

(assert (=> tb!3201 (= result!5929 tp_is_empty!10731)))

(assert (=> b!416368 t!12316))

(declare-fun b_and!17035 () Bool)

(assert (= b_and!17033 (and (=> t!12316 result!5929) b_and!17035)))

(declare-fun m!405509 () Bool)

(assert (=> b!416380 m!405509))

(declare-fun m!405511 () Bool)

(assert (=> b!416373 m!405511))

(assert (=> b!416373 m!405511))

(declare-fun m!405513 () Bool)

(assert (=> b!416373 m!405513))

(declare-fun m!405515 () Bool)

(assert (=> b!416373 m!405515))

(declare-fun m!405517 () Bool)

(assert (=> b!416376 m!405517))

(declare-fun m!405519 () Bool)

(assert (=> b!416378 m!405519))

(declare-fun m!405521 () Bool)

(assert (=> b!416378 m!405521))

(declare-fun m!405523 () Bool)

(assert (=> b!416378 m!405523))

(declare-fun m!405525 () Bool)

(assert (=> mapNonEmpty!17718 m!405525))

(declare-fun m!405527 () Bool)

(assert (=> start!39312 m!405527))

(declare-fun m!405529 () Bool)

(assert (=> start!39312 m!405529))

(declare-fun m!405531 () Bool)

(assert (=> b!416374 m!405531))

(declare-fun m!405533 () Bool)

(assert (=> b!416372 m!405533))

(declare-fun m!405535 () Bool)

(assert (=> b!416377 m!405535))

(declare-fun m!405537 () Bool)

(assert (=> b!416379 m!405537))

(declare-fun m!405539 () Bool)

(assert (=> b!416379 m!405539))

(declare-fun m!405541 () Bool)

(assert (=> b!416384 m!405541))

(declare-fun m!405543 () Bool)

(assert (=> b!416385 m!405543))

(declare-fun m!405545 () Bool)

(assert (=> b!416368 m!405545))

(declare-fun m!405547 () Bool)

(assert (=> b!416368 m!405547))

(declare-fun m!405549 () Bool)

(assert (=> b!416368 m!405549))

(declare-fun m!405551 () Bool)

(assert (=> b!416368 m!405551))

(declare-fun m!405553 () Bool)

(assert (=> b!416368 m!405553))

(declare-fun m!405555 () Bool)

(assert (=> b!416368 m!405555))

(declare-fun m!405557 () Bool)

(assert (=> b!416368 m!405557))

(assert (=> b!416368 m!405521))

(declare-fun m!405559 () Bool)

(assert (=> b!416368 m!405559))

(declare-fun m!405561 () Bool)

(assert (=> b!416368 m!405561))

(assert (=> b!416368 m!405549))

(assert (=> b!416368 m!405553))

(assert (=> b!416368 m!405545))

(declare-fun m!405563 () Bool)

(assert (=> b!416368 m!405563))

(declare-fun m!405565 () Bool)

(assert (=> b!416368 m!405565))

(declare-fun m!405567 () Bool)

(assert (=> b!416368 m!405567))

(declare-fun m!405569 () Bool)

(assert (=> b!416370 m!405569))

(declare-fun m!405571 () Bool)

(assert (=> bm!28912 m!405571))

(declare-fun m!405573 () Bool)

(assert (=> bm!28913 m!405573))

(check-sat (not b!416376) (not b!416380) (not b!416384) (not b_lambda!8883) (not b!416373) tp_is_empty!10731 (not mapNonEmpty!17718) (not bm!28912) (not b!416385) (not start!39312) b_and!17035 (not b!416378) (not bm!28913) (not b!416370) (not b_next!9579) (not b!416379) (not b!416368) (not b!416374) (not b!416377))
(check-sat b_and!17035 (not b_next!9579))
