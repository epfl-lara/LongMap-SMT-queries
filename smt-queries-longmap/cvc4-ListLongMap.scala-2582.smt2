; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39314 () Bool)

(assert start!39314)

(declare-fun b_free!9581 () Bool)

(declare-fun b_next!9581 () Bool)

(assert (=> start!39314 (= b_free!9581 (not b_next!9581))))

(declare-fun tp!34271 () Bool)

(declare-fun b_and!17037 () Bool)

(assert (=> start!39314 (= tp!34271 b_and!17037)))

(declare-datatypes ((V!15415 0))(
  ( (V!15416 (val!5411 Int)) )
))
(declare-fun minValue!515 () V!15415)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5023 0))(
  ( (ValueCellFull!5023 (v!7658 V!15415)) (EmptyCell!5023) )
))
(declare-datatypes ((array!25321 0))(
  ( (array!25322 (arr!12110 (Array (_ BitVec 32) ValueCell!5023)) (size!12462 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25321)

(declare-fun zeroValue!515 () V!15415)

(declare-fun lt!190667 () array!25321)

(declare-fun c!55085 () Bool)

(declare-datatypes ((tuple2!7056 0))(
  ( (tuple2!7057 (_1!3539 (_ BitVec 64)) (_2!3539 V!15415)) )
))
(declare-datatypes ((List!7075 0))(
  ( (Nil!7072) (Cons!7071 (h!7927 tuple2!7056) (t!12321 List!7075)) )
))
(declare-datatypes ((ListLongMap!5969 0))(
  ( (ListLongMap!5970 (toList!3000 List!7075)) )
))
(declare-fun call!28922 () ListLongMap!5969)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25323 0))(
  ( (array!25324 (arr!12111 (Array (_ BitVec 32) (_ BitVec 64))) (size!12463 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25323)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!190668 () array!25323)

(declare-fun bm!28918 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1205 (array!25323 array!25321 (_ BitVec 32) (_ BitVec 32) V!15415 V!15415 (_ BitVec 32) Int) ListLongMap!5969)

(assert (=> bm!28918 (= call!28922 (getCurrentListMapNoExtraKeys!1205 (ite c!55085 _keys!709 lt!190668) (ite c!55085 _values!549 lt!190667) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416427 () Bool)

(declare-fun res!242393 () Bool)

(declare-fun e!248595 () Bool)

(assert (=> b!416427 (=> (not res!242393) (not e!248595))))

(declare-datatypes ((List!7076 0))(
  ( (Nil!7073) (Cons!7072 (h!7928 (_ BitVec 64)) (t!12322 List!7076)) )
))
(declare-fun arrayNoDuplicates!0 (array!25323 (_ BitVec 32) List!7076) Bool)

(assert (=> b!416427 (= res!242393 (arrayNoDuplicates!0 lt!190668 #b00000000000000000000000000000000 Nil!7073))))

(declare-fun b!416428 () Bool)

(declare-fun res!242387 () Bool)

(assert (=> b!416428 (=> (not res!242387) (not e!248595))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416428 (= res!242387 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17721 () Bool)

(declare-fun mapRes!17721 () Bool)

(declare-fun tp!34272 () Bool)

(declare-fun e!248600 () Bool)

(assert (=> mapNonEmpty!17721 (= mapRes!17721 (and tp!34272 e!248600))))

(declare-fun mapKey!17721 () (_ BitVec 32))

(declare-fun mapValue!17721 () ValueCell!5023)

(declare-fun mapRest!17721 () (Array (_ BitVec 32) ValueCell!5023))

(assert (=> mapNonEmpty!17721 (= (arr!12110 _values!549) (store mapRest!17721 mapKey!17721 mapValue!17721))))

(declare-fun b!416429 () Bool)

(declare-fun e!248598 () Bool)

(assert (=> b!416429 (= e!248598 e!248595)))

(declare-fun res!242390 () Bool)

(assert (=> b!416429 (=> (not res!242390) (not e!248595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25323 (_ BitVec 32)) Bool)

(assert (=> b!416429 (= res!242390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190668 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!416429 (= lt!190668 (array!25324 (store (arr!12111 _keys!709) i!563 k!794) (size!12463 _keys!709)))))

(declare-fun b!416430 () Bool)

(declare-fun res!242386 () Bool)

(assert (=> b!416430 (=> (not res!242386) (not e!248598))))

(assert (=> b!416430 (= res!242386 (and (= (size!12462 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12463 _keys!709) (size!12462 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416431 () Bool)

(declare-fun res!242389 () Bool)

(assert (=> b!416431 (=> (not res!242389) (not e!248598))))

(assert (=> b!416431 (= res!242389 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12463 _keys!709))))))

(declare-fun b!416432 () Bool)

(declare-fun res!242396 () Bool)

(assert (=> b!416432 (=> (not res!242396) (not e!248598))))

(assert (=> b!416432 (= res!242396 (or (= (select (arr!12111 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12111 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17721 () Bool)

(assert (=> mapIsEmpty!17721 mapRes!17721))

(declare-fun b!416433 () Bool)

(declare-fun e!248599 () Bool)

(declare-fun e!248594 () Bool)

(assert (=> b!416433 (= e!248599 (not e!248594))))

(declare-fun res!242392 () Bool)

(assert (=> b!416433 (=> res!242392 e!248594)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416433 (= res!242392 (validKeyInArray!0 (select (arr!12111 _keys!709) from!863)))))

(declare-fun e!248596 () Bool)

(assert (=> b!416433 e!248596))

(assert (=> b!416433 (= c!55085 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12308 0))(
  ( (Unit!12309) )
))
(declare-fun lt!190660 () Unit!12308)

(declare-fun v!412 () V!15415)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!410 (array!25323 array!25321 (_ BitVec 32) (_ BitVec 32) V!15415 V!15415 (_ BitVec 32) (_ BitVec 64) V!15415 (_ BitVec 32) Int) Unit!12308)

(assert (=> b!416433 (= lt!190660 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!410 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416434 () Bool)

(declare-fun res!242397 () Bool)

(assert (=> b!416434 (=> (not res!242397) (not e!248598))))

(assert (=> b!416434 (= res!242397 (validKeyInArray!0 k!794))))

(declare-fun b!416435 () Bool)

(declare-fun res!242388 () Bool)

(assert (=> b!416435 (=> (not res!242388) (not e!248598))))

(assert (=> b!416435 (= res!242388 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7073))))

(declare-fun b!416436 () Bool)

(assert (=> b!416436 (= e!248594 true)))

(declare-fun lt!190663 () V!15415)

(declare-fun lt!190661 () ListLongMap!5969)

(declare-fun lt!190670 () tuple2!7056)

(declare-fun +!1202 (ListLongMap!5969 tuple2!7056) ListLongMap!5969)

(assert (=> b!416436 (= (+!1202 lt!190661 lt!190670) (+!1202 (+!1202 lt!190661 (tuple2!7057 k!794 lt!190663)) lt!190670))))

(declare-fun lt!190665 () V!15415)

(assert (=> b!416436 (= lt!190670 (tuple2!7057 k!794 lt!190665))))

(declare-fun lt!190669 () Unit!12308)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!6 (ListLongMap!5969 (_ BitVec 64) V!15415 V!15415) Unit!12308)

(assert (=> b!416436 (= lt!190669 (addSameAsAddTwiceSameKeyDiffValues!6 lt!190661 k!794 lt!190663 lt!190665))))

(declare-fun lt!190666 () V!15415)

(declare-fun get!5984 (ValueCell!5023 V!15415) V!15415)

(assert (=> b!416436 (= lt!190663 (get!5984 (select (arr!12110 _values!549) from!863) lt!190666))))

(declare-fun lt!190664 () ListLongMap!5969)

(assert (=> b!416436 (= lt!190664 (+!1202 lt!190661 (tuple2!7057 (select (arr!12111 lt!190668) from!863) lt!190665)))))

(assert (=> b!416436 (= lt!190665 (get!5984 (select (store (arr!12110 _values!549) i!563 (ValueCellFull!5023 v!412)) from!863) lt!190666))))

(declare-fun dynLambda!677 (Int (_ BitVec 64)) V!15415)

(assert (=> b!416436 (= lt!190666 (dynLambda!677 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416436 (= lt!190661 (getCurrentListMapNoExtraKeys!1205 lt!190668 lt!190667 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416437 () Bool)

(declare-fun res!242385 () Bool)

(assert (=> b!416437 (=> (not res!242385) (not e!248598))))

(assert (=> b!416437 (= res!242385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416438 () Bool)

(declare-fun call!28921 () ListLongMap!5969)

(assert (=> b!416438 (= e!248596 (= call!28921 (+!1202 call!28922 (tuple2!7057 k!794 v!412))))))

(declare-fun res!242391 () Bool)

(assert (=> start!39314 (=> (not res!242391) (not e!248598))))

(assert (=> start!39314 (= res!242391 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12463 _keys!709))))))

(assert (=> start!39314 e!248598))

(declare-fun tp_is_empty!10733 () Bool)

(assert (=> start!39314 tp_is_empty!10733))

(assert (=> start!39314 tp!34271))

(assert (=> start!39314 true))

(declare-fun e!248593 () Bool)

(declare-fun array_inv!8832 (array!25321) Bool)

(assert (=> start!39314 (and (array_inv!8832 _values!549) e!248593)))

(declare-fun array_inv!8833 (array!25323) Bool)

(assert (=> start!39314 (array_inv!8833 _keys!709)))

(declare-fun b!416439 () Bool)

(declare-fun res!242395 () Bool)

(assert (=> b!416439 (=> (not res!242395) (not e!248598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416439 (= res!242395 (validMask!0 mask!1025))))

(declare-fun b!416440 () Bool)

(declare-fun e!248601 () Bool)

(assert (=> b!416440 (= e!248593 (and e!248601 mapRes!17721))))

(declare-fun condMapEmpty!17721 () Bool)

(declare-fun mapDefault!17721 () ValueCell!5023)

