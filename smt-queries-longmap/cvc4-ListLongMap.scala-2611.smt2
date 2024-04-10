; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39488 () Bool)

(assert start!39488)

(declare-fun b_free!9755 () Bool)

(declare-fun b_next!9755 () Bool)

(assert (=> start!39488 (= b_free!9755 (not b_next!9755))))

(declare-fun tp!34794 () Bool)

(declare-fun b_and!17385 () Bool)

(assert (=> start!39488 (= tp!34794 b_and!17385)))

(declare-fun c!55346 () Bool)

(declare-datatypes ((V!15647 0))(
  ( (V!15648 (val!5498 Int)) )
))
(declare-fun minValue!515 () V!15647)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25661 0))(
  ( (array!25662 (arr!12280 (Array (_ BitVec 32) (_ BitVec 64))) (size!12632 (_ BitVec 32))) )
))
(declare-fun lt!193536 () array!25661)

(declare-datatypes ((ValueCell!5110 0))(
  ( (ValueCellFull!5110 (v!7745 V!15647)) (EmptyCell!5110) )
))
(declare-datatypes ((array!25663 0))(
  ( (array!25664 (arr!12281 (Array (_ BitVec 32) ValueCell!5110)) (size!12633 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25663)

(declare-datatypes ((tuple2!7210 0))(
  ( (tuple2!7211 (_1!3616 (_ BitVec 64)) (_2!3616 V!15647)) )
))
(declare-datatypes ((List!7216 0))(
  ( (Nil!7213) (Cons!7212 (h!8068 tuple2!7210) (t!12636 List!7216)) )
))
(declare-datatypes ((ListLongMap!6123 0))(
  ( (ListLongMap!6124 (toList!3077 List!7216)) )
))
(declare-fun call!29444 () ListLongMap!6123)

(declare-fun zeroValue!515 () V!15647)

(declare-fun bm!29440 () Bool)

(declare-fun lt!193540 () array!25663)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25661)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1281 (array!25661 array!25663 (_ BitVec 32) (_ BitVec 32) V!15647 V!15647 (_ BitVec 32) Int) ListLongMap!6123)

(assert (=> bm!29440 (= call!29444 (getCurrentListMapNoExtraKeys!1281 (ite c!55346 _keys!709 lt!193536) (ite c!55346 _values!549 lt!193540) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421560 () Bool)

(declare-fun e!250946 () Bool)

(declare-fun e!250947 () Bool)

(assert (=> b!421560 (= e!250946 e!250947)))

(declare-fun res!246042 () Bool)

(assert (=> b!421560 (=> (not res!246042) (not e!250947))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421560 (= res!246042 (= from!863 i!563))))

(declare-fun lt!193538 () ListLongMap!6123)

(assert (=> b!421560 (= lt!193538 (getCurrentListMapNoExtraKeys!1281 lt!193536 lt!193540 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15647)

(assert (=> b!421560 (= lt!193540 (array!25664 (store (arr!12281 _values!549) i!563 (ValueCellFull!5110 v!412)) (size!12633 _values!549)))))

(declare-fun lt!193541 () ListLongMap!6123)

(assert (=> b!421560 (= lt!193541 (getCurrentListMapNoExtraKeys!1281 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421561 () Bool)

(declare-fun e!250943 () Bool)

(assert (=> b!421561 (= e!250947 (not e!250943))))

(declare-fun res!246050 () Bool)

(assert (=> b!421561 (=> res!246050 e!250943)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421561 (= res!246050 (validKeyInArray!0 (select (arr!12280 _keys!709) from!863)))))

(declare-fun e!250944 () Bool)

(assert (=> b!421561 e!250944))

(assert (=> b!421561 (= c!55346 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12446 0))(
  ( (Unit!12447) )
))
(declare-fun lt!193532 () Unit!12446)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!469 (array!25661 array!25663 (_ BitVec 32) (_ BitVec 32) V!15647 V!15647 (_ BitVec 32) (_ BitVec 64) V!15647 (_ BitVec 32) Int) Unit!12446)

(assert (=> b!421561 (= lt!193532 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!469 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29443 () ListLongMap!6123)

(declare-fun b!421562 () Bool)

(declare-fun +!1272 (ListLongMap!6123 tuple2!7210) ListLongMap!6123)

(assert (=> b!421562 (= e!250944 (= call!29443 (+!1272 call!29444 (tuple2!7211 k!794 v!412))))))

(declare-fun b!421563 () Bool)

(declare-fun res!246049 () Bool)

(declare-fun e!250945 () Bool)

(assert (=> b!421563 (=> (not res!246049) (not e!250945))))

(declare-datatypes ((List!7217 0))(
  ( (Nil!7214) (Cons!7213 (h!8069 (_ BitVec 64)) (t!12637 List!7217)) )
))
(declare-fun arrayNoDuplicates!0 (array!25661 (_ BitVec 32) List!7217) Bool)

(assert (=> b!421563 (= res!246049 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7214))))

(declare-fun b!421564 () Bool)

(assert (=> b!421564 (= e!250943 true)))

(declare-fun lt!193531 () tuple2!7210)

(declare-fun lt!193535 () V!15647)

(declare-fun lt!193534 () ListLongMap!6123)

(assert (=> b!421564 (= (+!1272 lt!193534 lt!193531) (+!1272 (+!1272 lt!193534 (tuple2!7211 k!794 lt!193535)) lt!193531))))

(declare-fun lt!193533 () V!15647)

(assert (=> b!421564 (= lt!193531 (tuple2!7211 k!794 lt!193533))))

(declare-fun lt!193537 () Unit!12446)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!66 (ListLongMap!6123 (_ BitVec 64) V!15647 V!15647) Unit!12446)

(assert (=> b!421564 (= lt!193537 (addSameAsAddTwiceSameKeyDiffValues!66 lt!193534 k!794 lt!193535 lt!193533))))

(declare-fun lt!193539 () V!15647)

(declare-fun get!6102 (ValueCell!5110 V!15647) V!15647)

(assert (=> b!421564 (= lt!193535 (get!6102 (select (arr!12281 _values!549) from!863) lt!193539))))

(assert (=> b!421564 (= lt!193538 (+!1272 lt!193534 (tuple2!7211 (select (arr!12280 lt!193536) from!863) lt!193533)))))

(assert (=> b!421564 (= lt!193533 (get!6102 (select (store (arr!12281 _values!549) i!563 (ValueCellFull!5110 v!412)) from!863) lt!193539))))

(declare-fun dynLambda!737 (Int (_ BitVec 64)) V!15647)

(assert (=> b!421564 (= lt!193539 (dynLambda!737 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421564 (= lt!193534 (getCurrentListMapNoExtraKeys!1281 lt!193536 lt!193540 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17982 () Bool)

(declare-fun mapRes!17982 () Bool)

(declare-fun tp!34793 () Bool)

(declare-fun e!250950 () Bool)

(assert (=> mapNonEmpty!17982 (= mapRes!17982 (and tp!34793 e!250950))))

(declare-fun mapKey!17982 () (_ BitVec 32))

(declare-fun mapValue!17982 () ValueCell!5110)

(declare-fun mapRest!17982 () (Array (_ BitVec 32) ValueCell!5110))

(assert (=> mapNonEmpty!17982 (= (arr!12281 _values!549) (store mapRest!17982 mapKey!17982 mapValue!17982))))

(declare-fun res!246051 () Bool)

(assert (=> start!39488 (=> (not res!246051) (not e!250945))))

(assert (=> start!39488 (= res!246051 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12632 _keys!709))))))

(assert (=> start!39488 e!250945))

(declare-fun tp_is_empty!10907 () Bool)

(assert (=> start!39488 tp_is_empty!10907))

(assert (=> start!39488 tp!34794))

(assert (=> start!39488 true))

(declare-fun e!250949 () Bool)

(declare-fun array_inv!8946 (array!25663) Bool)

(assert (=> start!39488 (and (array_inv!8946 _values!549) e!250949)))

(declare-fun array_inv!8947 (array!25661) Bool)

(assert (=> start!39488 (array_inv!8947 _keys!709)))

(declare-fun b!421565 () Bool)

(declare-fun e!250948 () Bool)

(assert (=> b!421565 (= e!250948 tp_is_empty!10907)))

(declare-fun b!421566 () Bool)

(declare-fun res!246048 () Bool)

(assert (=> b!421566 (=> (not res!246048) (not e!250945))))

(assert (=> b!421566 (= res!246048 (and (= (size!12633 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12632 _keys!709) (size!12633 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421567 () Bool)

(declare-fun res!246041 () Bool)

(assert (=> b!421567 (=> (not res!246041) (not e!250946))))

(assert (=> b!421567 (= res!246041 (arrayNoDuplicates!0 lt!193536 #b00000000000000000000000000000000 Nil!7214))))

(declare-fun b!421568 () Bool)

(assert (=> b!421568 (= e!250944 (= call!29444 call!29443))))

(declare-fun b!421569 () Bool)

(assert (=> b!421569 (= e!250950 tp_is_empty!10907)))

(declare-fun b!421570 () Bool)

(declare-fun res!246047 () Bool)

(assert (=> b!421570 (=> (not res!246047) (not e!250945))))

(assert (=> b!421570 (= res!246047 (or (= (select (arr!12280 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12280 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421571 () Bool)

(declare-fun res!246044 () Bool)

(assert (=> b!421571 (=> (not res!246044) (not e!250945))))

(assert (=> b!421571 (= res!246044 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12632 _keys!709))))))

(declare-fun b!421572 () Bool)

(assert (=> b!421572 (= e!250945 e!250946)))

(declare-fun res!246045 () Bool)

(assert (=> b!421572 (=> (not res!246045) (not e!250946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25661 (_ BitVec 32)) Bool)

(assert (=> b!421572 (= res!246045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193536 mask!1025))))

(assert (=> b!421572 (= lt!193536 (array!25662 (store (arr!12280 _keys!709) i!563 k!794) (size!12632 _keys!709)))))

(declare-fun b!421573 () Bool)

(declare-fun res!246046 () Bool)

(assert (=> b!421573 (=> (not res!246046) (not e!250946))))

(assert (=> b!421573 (= res!246046 (bvsle from!863 i!563))))

(declare-fun bm!29441 () Bool)

(assert (=> bm!29441 (= call!29443 (getCurrentListMapNoExtraKeys!1281 (ite c!55346 lt!193536 _keys!709) (ite c!55346 lt!193540 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421574 () Bool)

(declare-fun res!246040 () Bool)

(assert (=> b!421574 (=> (not res!246040) (not e!250945))))

(assert (=> b!421574 (= res!246040 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!17982 () Bool)

(assert (=> mapIsEmpty!17982 mapRes!17982))

(declare-fun b!421575 () Bool)

(assert (=> b!421575 (= e!250949 (and e!250948 mapRes!17982))))

(declare-fun condMapEmpty!17982 () Bool)

(declare-fun mapDefault!17982 () ValueCell!5110)

