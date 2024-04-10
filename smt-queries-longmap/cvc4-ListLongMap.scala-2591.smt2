; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39368 () Bool)

(assert start!39368)

(declare-fun b_free!9635 () Bool)

(declare-fun b_next!9635 () Bool)

(assert (=> start!39368 (= b_free!9635 (not b_next!9635))))

(declare-fun tp!34433 () Bool)

(declare-fun b_and!17145 () Bool)

(assert (=> start!39368 (= tp!34433 b_and!17145)))

(declare-fun b!418020 () Bool)

(declare-datatypes ((V!15487 0))(
  ( (V!15488 (val!5438 Int)) )
))
(declare-datatypes ((tuple2!7106 0))(
  ( (tuple2!7107 (_1!3564 (_ BitVec 64)) (_2!3564 V!15487)) )
))
(declare-datatypes ((List!7121 0))(
  ( (Nil!7118) (Cons!7117 (h!7973 tuple2!7106) (t!12421 List!7121)) )
))
(declare-datatypes ((ListLongMap!6019 0))(
  ( (ListLongMap!6020 (toList!3025 List!7121)) )
))
(declare-fun call!29083 () ListLongMap!6019)

(declare-fun e!249322 () Bool)

(declare-fun v!412 () V!15487)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun call!29084 () ListLongMap!6019)

(declare-fun +!1225 (ListLongMap!6019 tuple2!7106) ListLongMap!6019)

(assert (=> b!418020 (= e!249322 (= call!29083 (+!1225 call!29084 (tuple2!7107 k!794 v!412))))))

(declare-fun b!418021 () Bool)

(declare-fun res!243519 () Bool)

(declare-fun e!249329 () Bool)

(assert (=> b!418021 (=> (not res!243519) (not e!249329))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25425 0))(
  ( (array!25426 (arr!12162 (Array (_ BitVec 32) (_ BitVec 64))) (size!12514 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25425)

(assert (=> b!418021 (= res!243519 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12514 _keys!709))))))

(declare-fun b!418022 () Bool)

(declare-fun res!243523 () Bool)

(declare-fun e!249325 () Bool)

(assert (=> b!418022 (=> (not res!243523) (not e!249325))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!418022 (= res!243523 (bvsle from!863 i!563))))

(declare-fun b!418023 () Bool)

(declare-fun e!249327 () Bool)

(assert (=> b!418023 (= e!249325 e!249327)))

(declare-fun res!243526 () Bool)

(assert (=> b!418023 (=> (not res!243526) (not e!249327))))

(assert (=> b!418023 (= res!243526 (= from!863 i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!191559 () array!25425)

(declare-fun zeroValue!515 () V!15487)

(declare-fun lt!191557 () ListLongMap!6019)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5050 0))(
  ( (ValueCellFull!5050 (v!7685 V!15487)) (EmptyCell!5050) )
))
(declare-datatypes ((array!25427 0))(
  ( (array!25428 (arr!12163 (Array (_ BitVec 32) ValueCell!5050)) (size!12515 (_ BitVec 32))) )
))
(declare-fun lt!191552 () array!25427)

(declare-fun minValue!515 () V!15487)

(declare-fun getCurrentListMapNoExtraKeys!1230 (array!25425 array!25427 (_ BitVec 32) (_ BitVec 32) V!15487 V!15487 (_ BitVec 32) Int) ListLongMap!6019)

(assert (=> b!418023 (= lt!191557 (getCurrentListMapNoExtraKeys!1230 lt!191559 lt!191552 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25427)

(assert (=> b!418023 (= lt!191552 (array!25428 (store (arr!12163 _values!549) i!563 (ValueCellFull!5050 v!412)) (size!12515 _values!549)))))

(declare-fun lt!191554 () ListLongMap!6019)

(assert (=> b!418023 (= lt!191554 (getCurrentListMapNoExtraKeys!1230 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418024 () Bool)

(declare-fun res!243531 () Bool)

(assert (=> b!418024 (=> (not res!243531) (not e!249329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418024 (= res!243531 (validKeyInArray!0 k!794))))

(declare-fun bm!29080 () Bool)

(declare-fun c!55166 () Bool)

(assert (=> bm!29080 (= call!29084 (getCurrentListMapNoExtraKeys!1230 (ite c!55166 _keys!709 lt!191559) (ite c!55166 _values!549 lt!191552) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17802 () Bool)

(declare-fun mapRes!17802 () Bool)

(assert (=> mapIsEmpty!17802 mapRes!17802))

(declare-fun b!418025 () Bool)

(declare-fun res!243525 () Bool)

(assert (=> b!418025 (=> (not res!243525) (not e!249329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25425 (_ BitVec 32)) Bool)

(assert (=> b!418025 (= res!243525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418026 () Bool)

(declare-fun e!249324 () Bool)

(declare-fun tp_is_empty!10787 () Bool)

(assert (=> b!418026 (= e!249324 tp_is_empty!10787)))

(declare-fun b!418027 () Bool)

(declare-fun e!249323 () Bool)

(assert (=> b!418027 (= e!249323 tp_is_empty!10787)))

(declare-fun b!418028 () Bool)

(declare-fun res!243521 () Bool)

(assert (=> b!418028 (=> (not res!243521) (not e!249329))))

(assert (=> b!418028 (= res!243521 (or (= (select (arr!12162 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12162 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17802 () Bool)

(declare-fun tp!34434 () Bool)

(assert (=> mapNonEmpty!17802 (= mapRes!17802 (and tp!34434 e!249323))))

(declare-fun mapRest!17802 () (Array (_ BitVec 32) ValueCell!5050))

(declare-fun mapKey!17802 () (_ BitVec 32))

(declare-fun mapValue!17802 () ValueCell!5050)

(assert (=> mapNonEmpty!17802 (= (arr!12163 _values!549) (store mapRest!17802 mapKey!17802 mapValue!17802))))

(declare-fun b!418029 () Bool)

(declare-fun res!243522 () Bool)

(assert (=> b!418029 (=> (not res!243522) (not e!249329))))

(declare-fun arrayContainsKey!0 (array!25425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418029 (= res!243522 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!418030 () Bool)

(declare-fun res!243520 () Bool)

(assert (=> b!418030 (=> (not res!243520) (not e!249329))))

(assert (=> b!418030 (= res!243520 (and (= (size!12515 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12514 _keys!709) (size!12515 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418031 () Bool)

(declare-fun res!243527 () Bool)

(assert (=> b!418031 (=> (not res!243527) (not e!249329))))

(declare-datatypes ((List!7122 0))(
  ( (Nil!7119) (Cons!7118 (h!7974 (_ BitVec 64)) (t!12422 List!7122)) )
))
(declare-fun arrayNoDuplicates!0 (array!25425 (_ BitVec 32) List!7122) Bool)

(assert (=> b!418031 (= res!243527 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7119))))

(declare-fun b!418032 () Bool)

(assert (=> b!418032 (= e!249329 e!249325)))

(declare-fun res!243529 () Bool)

(assert (=> b!418032 (=> (not res!243529) (not e!249325))))

(assert (=> b!418032 (= res!243529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191559 mask!1025))))

(assert (=> b!418032 (= lt!191559 (array!25426 (store (arr!12162 _keys!709) i!563 k!794) (size!12514 _keys!709)))))

(declare-fun b!418033 () Bool)

(declare-fun res!243524 () Bool)

(assert (=> b!418033 (=> (not res!243524) (not e!249329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418033 (= res!243524 (validMask!0 mask!1025))))

(declare-fun b!418034 () Bool)

(assert (=> b!418034 (= e!249322 (= call!29084 call!29083))))

(declare-fun b!418035 () Bool)

(declare-fun e!249328 () Bool)

(assert (=> b!418035 (= e!249328 true)))

(declare-fun lt!191560 () V!15487)

(declare-fun lt!191556 () tuple2!7106)

(declare-fun lt!191558 () ListLongMap!6019)

(assert (=> b!418035 (= (+!1225 lt!191558 lt!191556) (+!1225 (+!1225 lt!191558 (tuple2!7107 k!794 lt!191560)) lt!191556))))

(declare-fun lt!191553 () V!15487)

(assert (=> b!418035 (= lt!191556 (tuple2!7107 k!794 lt!191553))))

(declare-datatypes ((Unit!12354 0))(
  ( (Unit!12355) )
))
(declare-fun lt!191551 () Unit!12354)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!25 (ListLongMap!6019 (_ BitVec 64) V!15487 V!15487) Unit!12354)

(assert (=> b!418035 (= lt!191551 (addSameAsAddTwiceSameKeyDiffValues!25 lt!191558 k!794 lt!191560 lt!191553))))

(declare-fun lt!191561 () V!15487)

(declare-fun get!6021 (ValueCell!5050 V!15487) V!15487)

(assert (=> b!418035 (= lt!191560 (get!6021 (select (arr!12163 _values!549) from!863) lt!191561))))

(assert (=> b!418035 (= lt!191557 (+!1225 lt!191558 (tuple2!7107 (select (arr!12162 lt!191559) from!863) lt!191553)))))

(assert (=> b!418035 (= lt!191553 (get!6021 (select (store (arr!12163 _values!549) i!563 (ValueCellFull!5050 v!412)) from!863) lt!191561))))

(declare-fun dynLambda!696 (Int (_ BitVec 64)) V!15487)

(assert (=> b!418035 (= lt!191561 (dynLambda!696 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418035 (= lt!191558 (getCurrentListMapNoExtraKeys!1230 lt!191559 lt!191552 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418036 () Bool)

(declare-fun res!243528 () Bool)

(assert (=> b!418036 (=> (not res!243528) (not e!249325))))

(assert (=> b!418036 (= res!243528 (arrayNoDuplicates!0 lt!191559 #b00000000000000000000000000000000 Nil!7119))))

(declare-fun b!418037 () Bool)

(assert (=> b!418037 (= e!249327 (not e!249328))))

(declare-fun res!243518 () Bool)

(assert (=> b!418037 (=> res!243518 e!249328)))

(assert (=> b!418037 (= res!243518 (validKeyInArray!0 (select (arr!12162 _keys!709) from!863)))))

(assert (=> b!418037 e!249322))

(assert (=> b!418037 (= c!55166 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191555 () Unit!12354)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!430 (array!25425 array!25427 (_ BitVec 32) (_ BitVec 32) V!15487 V!15487 (_ BitVec 32) (_ BitVec 64) V!15487 (_ BitVec 32) Int) Unit!12354)

(assert (=> b!418037 (= lt!191555 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!430 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418038 () Bool)

(declare-fun e!249326 () Bool)

(assert (=> b!418038 (= e!249326 (and e!249324 mapRes!17802))))

(declare-fun condMapEmpty!17802 () Bool)

(declare-fun mapDefault!17802 () ValueCell!5050)

