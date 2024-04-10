; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39370 () Bool)

(assert start!39370)

(declare-fun b_free!9637 () Bool)

(declare-fun b_next!9637 () Bool)

(assert (=> start!39370 (= b_free!9637 (not b_next!9637))))

(declare-fun tp!34439 () Bool)

(declare-fun b_and!17149 () Bool)

(assert (=> start!39370 (= tp!34439 b_and!17149)))

(declare-fun b!418079 () Bool)

(declare-fun e!249355 () Bool)

(declare-fun tp_is_empty!10789 () Bool)

(assert (=> b!418079 (= e!249355 tp_is_empty!10789)))

(declare-fun mapNonEmpty!17805 () Bool)

(declare-fun mapRes!17805 () Bool)

(declare-fun tp!34440 () Bool)

(declare-fun e!249353 () Bool)

(assert (=> mapNonEmpty!17805 (= mapRes!17805 (and tp!34440 e!249353))))

(declare-datatypes ((V!15491 0))(
  ( (V!15492 (val!5439 Int)) )
))
(declare-datatypes ((ValueCell!5051 0))(
  ( (ValueCellFull!5051 (v!7686 V!15491)) (EmptyCell!5051) )
))
(declare-fun mapRest!17805 () (Array (_ BitVec 32) ValueCell!5051))

(declare-fun mapKey!17805 () (_ BitVec 32))

(declare-datatypes ((array!25429 0))(
  ( (array!25430 (arr!12164 (Array (_ BitVec 32) ValueCell!5051)) (size!12516 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25429)

(declare-fun mapValue!17805 () ValueCell!5051)

(assert (=> mapNonEmpty!17805 (= (arr!12164 _values!549) (store mapRest!17805 mapKey!17805 mapValue!17805))))

(declare-fun b!418080 () Bool)

(assert (=> b!418080 (= e!249353 tp_is_empty!10789)))

(declare-fun lt!191591 () array!25429)

(declare-datatypes ((array!25431 0))(
  ( (array!25432 (arr!12165 (Array (_ BitVec 32) (_ BitVec 64))) (size!12517 (_ BitVec 32))) )
))
(declare-fun lt!191585 () array!25431)

(declare-fun minValue!515 () V!15491)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15491)

(declare-datatypes ((tuple2!7108 0))(
  ( (tuple2!7109 (_1!3565 (_ BitVec 64)) (_2!3565 V!15491)) )
))
(declare-datatypes ((List!7123 0))(
  ( (Nil!7120) (Cons!7119 (h!7975 tuple2!7108) (t!12425 List!7123)) )
))
(declare-datatypes ((ListLongMap!6021 0))(
  ( (ListLongMap!6022 (toList!3026 List!7123)) )
))
(declare-fun call!29089 () ListLongMap!6021)

(declare-fun c!55169 () Bool)

(declare-fun bm!29086 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25431)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1231 (array!25431 array!25429 (_ BitVec 32) (_ BitVec 32) V!15491 V!15491 (_ BitVec 32) Int) ListLongMap!6021)

(assert (=> bm!29086 (= call!29089 (getCurrentListMapNoExtraKeys!1231 (ite c!55169 lt!191585 _keys!709) (ite c!55169 lt!191591 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418081 () Bool)

(declare-fun e!249351 () Bool)

(assert (=> b!418081 (= e!249351 true)))

(declare-fun lt!191584 () V!15491)

(declare-fun lt!191592 () ListLongMap!6021)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!191587 () tuple2!7108)

(declare-fun +!1226 (ListLongMap!6021 tuple2!7108) ListLongMap!6021)

(assert (=> b!418081 (= (+!1226 lt!191592 lt!191587) (+!1226 (+!1226 lt!191592 (tuple2!7109 k!794 lt!191584)) lt!191587))))

(declare-fun lt!191589 () V!15491)

(assert (=> b!418081 (= lt!191587 (tuple2!7109 k!794 lt!191589))))

(declare-datatypes ((Unit!12356 0))(
  ( (Unit!12357) )
))
(declare-fun lt!191586 () Unit!12356)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!26 (ListLongMap!6021 (_ BitVec 64) V!15491 V!15491) Unit!12356)

(assert (=> b!418081 (= lt!191586 (addSameAsAddTwiceSameKeyDiffValues!26 lt!191592 k!794 lt!191584 lt!191589))))

(declare-fun lt!191588 () V!15491)

(declare-fun get!6024 (ValueCell!5051 V!15491) V!15491)

(assert (=> b!418081 (= lt!191584 (get!6024 (select (arr!12164 _values!549) from!863) lt!191588))))

(declare-fun lt!191594 () ListLongMap!6021)

(assert (=> b!418081 (= lt!191594 (+!1226 lt!191592 (tuple2!7109 (select (arr!12165 lt!191585) from!863) lt!191589)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15491)

(assert (=> b!418081 (= lt!191589 (get!6024 (select (store (arr!12164 _values!549) i!563 (ValueCellFull!5051 v!412)) from!863) lt!191588))))

(declare-fun dynLambda!697 (Int (_ BitVec 64)) V!15491)

(assert (=> b!418081 (= lt!191588 (dynLambda!697 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418081 (= lt!191592 (getCurrentListMapNoExtraKeys!1231 lt!191585 lt!191591 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418082 () Bool)

(declare-fun e!249352 () Bool)

(declare-fun e!249354 () Bool)

(assert (=> b!418082 (= e!249352 e!249354)))

(declare-fun res!243560 () Bool)

(assert (=> b!418082 (=> (not res!243560) (not e!249354))))

(assert (=> b!418082 (= res!243560 (= from!863 i!563))))

(assert (=> b!418082 (= lt!191594 (getCurrentListMapNoExtraKeys!1231 lt!191585 lt!191591 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418082 (= lt!191591 (array!25430 (store (arr!12164 _values!549) i!563 (ValueCellFull!5051 v!412)) (size!12516 _values!549)))))

(declare-fun lt!191593 () ListLongMap!6021)

(assert (=> b!418082 (= lt!191593 (getCurrentListMapNoExtraKeys!1231 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418083 () Bool)

(declare-fun res!243571 () Bool)

(declare-fun e!249356 () Bool)

(assert (=> b!418083 (=> (not res!243571) (not e!249356))))

(assert (=> b!418083 (= res!243571 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12517 _keys!709))))))

(declare-fun b!418084 () Bool)

(assert (=> b!418084 (= e!249354 (not e!249351))))

(declare-fun res!243570 () Bool)

(assert (=> b!418084 (=> res!243570 e!249351)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418084 (= res!243570 (validKeyInArray!0 (select (arr!12165 _keys!709) from!863)))))

(declare-fun e!249357 () Bool)

(assert (=> b!418084 e!249357))

(assert (=> b!418084 (= c!55169 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191590 () Unit!12356)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!431 (array!25431 array!25429 (_ BitVec 32) (_ BitVec 32) V!15491 V!15491 (_ BitVec 32) (_ BitVec 64) V!15491 (_ BitVec 32) Int) Unit!12356)

(assert (=> b!418084 (= lt!191590 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!431 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418085 () Bool)

(declare-fun call!29090 () ListLongMap!6021)

(assert (=> b!418085 (= e!249357 (= call!29089 (+!1226 call!29090 (tuple2!7109 k!794 v!412))))))

(declare-fun b!418086 () Bool)

(declare-fun e!249349 () Bool)

(assert (=> b!418086 (= e!249349 (and e!249355 mapRes!17805))))

(declare-fun condMapEmpty!17805 () Bool)

(declare-fun mapDefault!17805 () ValueCell!5051)

