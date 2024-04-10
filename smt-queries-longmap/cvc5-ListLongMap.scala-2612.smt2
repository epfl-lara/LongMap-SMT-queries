; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39490 () Bool)

(assert start!39490)

(declare-fun b_free!9757 () Bool)

(declare-fun b_next!9757 () Bool)

(assert (=> start!39490 (= b_free!9757 (not b_next!9757))))

(declare-fun tp!34799 () Bool)

(declare-fun b_and!17389 () Bool)

(assert (=> start!39490 (= tp!34799 b_and!17389)))

(declare-fun b!421619 () Bool)

(declare-fun res!246085 () Bool)

(declare-fun e!250976 () Bool)

(assert (=> b!421619 (=> (not res!246085) (not e!250976))))

(declare-datatypes ((array!25665 0))(
  ( (array!25666 (arr!12282 (Array (_ BitVec 32) (_ BitVec 64))) (size!12634 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25665)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15651 0))(
  ( (V!15652 (val!5499 Int)) )
))
(declare-datatypes ((ValueCell!5111 0))(
  ( (ValueCellFull!5111 (v!7746 V!15651)) (EmptyCell!5111) )
))
(declare-datatypes ((array!25667 0))(
  ( (array!25668 (arr!12283 (Array (_ BitVec 32) ValueCell!5111)) (size!12635 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25667)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!421619 (= res!246085 (and (= (size!12635 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12634 _keys!709) (size!12635 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421620 () Bool)

(declare-fun e!250971 () Bool)

(assert (=> b!421620 (= e!250971 true)))

(declare-fun lt!193565 () V!15651)

(declare-datatypes ((tuple2!7212 0))(
  ( (tuple2!7213 (_1!3617 (_ BitVec 64)) (_2!3617 V!15651)) )
))
(declare-datatypes ((List!7218 0))(
  ( (Nil!7215) (Cons!7214 (h!8070 tuple2!7212) (t!12640 List!7218)) )
))
(declare-datatypes ((ListLongMap!6125 0))(
  ( (ListLongMap!6126 (toList!3078 List!7218)) )
))
(declare-fun lt!193564 () ListLongMap!6125)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!193573 () tuple2!7212)

(declare-fun +!1273 (ListLongMap!6125 tuple2!7212) ListLongMap!6125)

(assert (=> b!421620 (= (+!1273 lt!193564 lt!193573) (+!1273 (+!1273 lt!193564 (tuple2!7213 k!794 lt!193565)) lt!193573))))

(declare-fun lt!193567 () V!15651)

(assert (=> b!421620 (= lt!193573 (tuple2!7213 k!794 lt!193567))))

(declare-datatypes ((Unit!12448 0))(
  ( (Unit!12449) )
))
(declare-fun lt!193566 () Unit!12448)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!67 (ListLongMap!6125 (_ BitVec 64) V!15651 V!15651) Unit!12448)

(assert (=> b!421620 (= lt!193566 (addSameAsAddTwiceSameKeyDiffValues!67 lt!193564 k!794 lt!193565 lt!193567))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!193570 () V!15651)

(declare-fun get!6105 (ValueCell!5111 V!15651) V!15651)

(assert (=> b!421620 (= lt!193565 (get!6105 (select (arr!12283 _values!549) from!863) lt!193570))))

(declare-fun lt!193571 () array!25665)

(declare-fun lt!193569 () ListLongMap!6125)

(assert (=> b!421620 (= lt!193569 (+!1273 lt!193564 (tuple2!7213 (select (arr!12282 lt!193571) from!863) lt!193567)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15651)

(assert (=> b!421620 (= lt!193567 (get!6105 (select (store (arr!12283 _values!549) i!563 (ValueCellFull!5111 v!412)) from!863) lt!193570))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!738 (Int (_ BitVec 64)) V!15651)

(assert (=> b!421620 (= lt!193570 (dynLambda!738 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15651)

(declare-fun zeroValue!515 () V!15651)

(declare-fun lt!193568 () array!25667)

(declare-fun getCurrentListMapNoExtraKeys!1282 (array!25665 array!25667 (_ BitVec 32) (_ BitVec 32) V!15651 V!15651 (_ BitVec 32) Int) ListLongMap!6125)

(assert (=> b!421620 (= lt!193564 (getCurrentListMapNoExtraKeys!1282 lt!193571 lt!193568 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421621 () Bool)

(declare-fun res!246093 () Bool)

(assert (=> b!421621 (=> (not res!246093) (not e!250976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421621 (= res!246093 (validKeyInArray!0 k!794))))

(declare-fun b!421622 () Bool)

(declare-fun e!250975 () Bool)

(assert (=> b!421622 (= e!250976 e!250975)))

(declare-fun res!246084 () Bool)

(assert (=> b!421622 (=> (not res!246084) (not e!250975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25665 (_ BitVec 32)) Bool)

(assert (=> b!421622 (= res!246084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193571 mask!1025))))

(assert (=> b!421622 (= lt!193571 (array!25666 (store (arr!12282 _keys!709) i!563 k!794) (size!12634 _keys!709)))))

(declare-fun b!421623 () Bool)

(declare-fun e!250973 () Bool)

(assert (=> b!421623 (= e!250975 e!250973)))

(declare-fun res!246081 () Bool)

(assert (=> b!421623 (=> (not res!246081) (not e!250973))))

(assert (=> b!421623 (= res!246081 (= from!863 i!563))))

(assert (=> b!421623 (= lt!193569 (getCurrentListMapNoExtraKeys!1282 lt!193571 lt!193568 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421623 (= lt!193568 (array!25668 (store (arr!12283 _values!549) i!563 (ValueCellFull!5111 v!412)) (size!12635 _values!549)))))

(declare-fun lt!193572 () ListLongMap!6125)

(assert (=> b!421623 (= lt!193572 (getCurrentListMapNoExtraKeys!1282 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!246080 () Bool)

(assert (=> start!39490 (=> (not res!246080) (not e!250976))))

(assert (=> start!39490 (= res!246080 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12634 _keys!709))))))

(assert (=> start!39490 e!250976))

(declare-fun tp_is_empty!10909 () Bool)

(assert (=> start!39490 tp_is_empty!10909))

(assert (=> start!39490 tp!34799))

(assert (=> start!39490 true))

(declare-fun e!250974 () Bool)

(declare-fun array_inv!8948 (array!25667) Bool)

(assert (=> start!39490 (and (array_inv!8948 _values!549) e!250974)))

(declare-fun array_inv!8949 (array!25665) Bool)

(assert (=> start!39490 (array_inv!8949 _keys!709)))

(declare-fun mapNonEmpty!17985 () Bool)

(declare-fun mapRes!17985 () Bool)

(declare-fun tp!34800 () Bool)

(declare-fun e!250969 () Bool)

(assert (=> mapNonEmpty!17985 (= mapRes!17985 (and tp!34800 e!250969))))

(declare-fun mapRest!17985 () (Array (_ BitVec 32) ValueCell!5111))

(declare-fun mapKey!17985 () (_ BitVec 32))

(declare-fun mapValue!17985 () ValueCell!5111)

(assert (=> mapNonEmpty!17985 (= (arr!12283 _values!549) (store mapRest!17985 mapKey!17985 mapValue!17985))))

(declare-fun b!421624 () Bool)

(declare-fun res!246082 () Bool)

(assert (=> b!421624 (=> (not res!246082) (not e!250976))))

(declare-datatypes ((List!7219 0))(
  ( (Nil!7216) (Cons!7215 (h!8071 (_ BitVec 64)) (t!12641 List!7219)) )
))
(declare-fun arrayNoDuplicates!0 (array!25665 (_ BitVec 32) List!7219) Bool)

(assert (=> b!421624 (= res!246082 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7216))))

(declare-fun b!421625 () Bool)

(declare-fun res!246083 () Bool)

(assert (=> b!421625 (=> (not res!246083) (not e!250975))))

(assert (=> b!421625 (= res!246083 (bvsle from!863 i!563))))

(declare-fun b!421626 () Bool)

(declare-fun res!246089 () Bool)

(assert (=> b!421626 (=> (not res!246089) (not e!250976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421626 (= res!246089 (validMask!0 mask!1025))))

(declare-fun b!421627 () Bool)

(declare-fun e!250977 () Bool)

(assert (=> b!421627 (= e!250977 tp_is_empty!10909)))

(declare-fun b!421628 () Bool)

(declare-fun res!246090 () Bool)

(assert (=> b!421628 (=> (not res!246090) (not e!250976))))

(declare-fun arrayContainsKey!0 (array!25665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421628 (= res!246090 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!421629 () Bool)

(assert (=> b!421629 (= e!250973 (not e!250971))))

(declare-fun res!246086 () Bool)

(assert (=> b!421629 (=> res!246086 e!250971)))

(assert (=> b!421629 (= res!246086 (validKeyInArray!0 (select (arr!12282 _keys!709) from!863)))))

(declare-fun e!250972 () Bool)

(assert (=> b!421629 e!250972))

(declare-fun c!55349 () Bool)

(assert (=> b!421629 (= c!55349 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193574 () Unit!12448)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!470 (array!25665 array!25667 (_ BitVec 32) (_ BitVec 32) V!15651 V!15651 (_ BitVec 32) (_ BitVec 64) V!15651 (_ BitVec 32) Int) Unit!12448)

(assert (=> b!421629 (= lt!193574 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!470 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29446 () Bool)

(declare-fun call!29449 () ListLongMap!6125)

(assert (=> bm!29446 (= call!29449 (getCurrentListMapNoExtraKeys!1282 (ite c!55349 _keys!709 lt!193571) (ite c!55349 _values!549 lt!193568) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421630 () Bool)

(declare-fun res!246087 () Bool)

(assert (=> b!421630 (=> (not res!246087) (not e!250975))))

(assert (=> b!421630 (= res!246087 (arrayNoDuplicates!0 lt!193571 #b00000000000000000000000000000000 Nil!7216))))

(declare-fun bm!29447 () Bool)

(declare-fun call!29450 () ListLongMap!6125)

(assert (=> bm!29447 (= call!29450 (getCurrentListMapNoExtraKeys!1282 (ite c!55349 lt!193571 _keys!709) (ite c!55349 lt!193568 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421631 () Bool)

(assert (=> b!421631 (= e!250972 (= call!29449 call!29450))))

(declare-fun b!421632 () Bool)

(declare-fun res!246091 () Bool)

(assert (=> b!421632 (=> (not res!246091) (not e!250976))))

(assert (=> b!421632 (= res!246091 (or (= (select (arr!12282 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12282 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421633 () Bool)

(assert (=> b!421633 (= e!250969 tp_is_empty!10909)))

(declare-fun b!421634 () Bool)

(declare-fun res!246088 () Bool)

(assert (=> b!421634 (=> (not res!246088) (not e!250976))))

(assert (=> b!421634 (= res!246088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421635 () Bool)

(assert (=> b!421635 (= e!250974 (and e!250977 mapRes!17985))))

(declare-fun condMapEmpty!17985 () Bool)

(declare-fun mapDefault!17985 () ValueCell!5111)

