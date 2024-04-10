; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39374 () Bool)

(assert start!39374)

(declare-fun b_free!9641 () Bool)

(declare-fun b_next!9641 () Bool)

(assert (=> start!39374 (= b_free!9641 (not b_next!9641))))

(declare-fun tp!34451 () Bool)

(declare-fun b_and!17157 () Bool)

(assert (=> start!39374 (= tp!34451 b_and!17157)))

(declare-fun b!418197 () Bool)

(declare-fun e!249408 () Bool)

(declare-fun e!249406 () Bool)

(assert (=> b!418197 (= e!249408 e!249406)))

(declare-fun res!243653 () Bool)

(assert (=> b!418197 (=> (not res!243653) (not e!249406))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418197 (= res!243653 (= from!863 i!563))))

(declare-datatypes ((V!15495 0))(
  ( (V!15496 (val!5441 Int)) )
))
(declare-datatypes ((ValueCell!5053 0))(
  ( (ValueCellFull!5053 (v!7688 V!15495)) (EmptyCell!5053) )
))
(declare-datatypes ((array!25437 0))(
  ( (array!25438 (arr!12168 (Array (_ BitVec 32) ValueCell!5053)) (size!12520 (_ BitVec 32))) )
))
(declare-fun lt!191660 () array!25437)

(declare-fun minValue!515 () V!15495)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25439 0))(
  ( (array!25440 (arr!12169 (Array (_ BitVec 32) (_ BitVec 64))) (size!12521 (_ BitVec 32))) )
))
(declare-fun lt!191651 () array!25439)

(declare-fun zeroValue!515 () V!15495)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7112 0))(
  ( (tuple2!7113 (_1!3567 (_ BitVec 64)) (_2!3567 V!15495)) )
))
(declare-datatypes ((List!7126 0))(
  ( (Nil!7123) (Cons!7122 (h!7978 tuple2!7112) (t!12432 List!7126)) )
))
(declare-datatypes ((ListLongMap!6025 0))(
  ( (ListLongMap!6026 (toList!3028 List!7126)) )
))
(declare-fun lt!191659 () ListLongMap!6025)

(declare-fun getCurrentListMapNoExtraKeys!1233 (array!25439 array!25437 (_ BitVec 32) (_ BitVec 32) V!15495 V!15495 (_ BitVec 32) Int) ListLongMap!6025)

(assert (=> b!418197 (= lt!191659 (getCurrentListMapNoExtraKeys!1233 lt!191651 lt!191660 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25437)

(declare-fun v!412 () V!15495)

(assert (=> b!418197 (= lt!191660 (array!25438 (store (arr!12168 _values!549) i!563 (ValueCellFull!5053 v!412)) (size!12520 _values!549)))))

(declare-fun _keys!709 () array!25439)

(declare-fun lt!191652 () ListLongMap!6025)

(assert (=> b!418197 (= lt!191652 (getCurrentListMapNoExtraKeys!1233 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418198 () Bool)

(declare-fun res!243644 () Bool)

(declare-fun e!249407 () Bool)

(assert (=> b!418198 (=> (not res!243644) (not e!249407))))

(assert (=> b!418198 (= res!243644 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12521 _keys!709))))))

(declare-fun b!418199 () Bool)

(declare-fun res!243645 () Bool)

(assert (=> b!418199 (=> (not res!243645) (not e!249407))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418199 (= res!243645 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!243652 () Bool)

(assert (=> start!39374 (=> (not res!243652) (not e!249407))))

(assert (=> start!39374 (= res!243652 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12521 _keys!709))))))

(assert (=> start!39374 e!249407))

(declare-fun tp_is_empty!10793 () Bool)

(assert (=> start!39374 tp_is_empty!10793))

(assert (=> start!39374 tp!34451))

(assert (=> start!39374 true))

(declare-fun e!249410 () Bool)

(declare-fun array_inv!8868 (array!25437) Bool)

(assert (=> start!39374 (and (array_inv!8868 _values!549) e!249410)))

(declare-fun array_inv!8869 (array!25439) Bool)

(assert (=> start!39374 (array_inv!8869 _keys!709)))

(declare-fun b!418200 () Bool)

(declare-fun res!243656 () Bool)

(assert (=> b!418200 (=> (not res!243656) (not e!249407))))

(assert (=> b!418200 (= res!243656 (and (= (size!12520 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12521 _keys!709) (size!12520 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418201 () Bool)

(declare-fun res!243657 () Bool)

(assert (=> b!418201 (=> (not res!243657) (not e!249408))))

(assert (=> b!418201 (= res!243657 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17811 () Bool)

(declare-fun mapRes!17811 () Bool)

(declare-fun tp!34452 () Bool)

(declare-fun e!249405 () Bool)

(assert (=> mapNonEmpty!17811 (= mapRes!17811 (and tp!34452 e!249405))))

(declare-fun mapRest!17811 () (Array (_ BitVec 32) ValueCell!5053))

(declare-fun mapValue!17811 () ValueCell!5053)

(declare-fun mapKey!17811 () (_ BitVec 32))

(assert (=> mapNonEmpty!17811 (= (arr!12168 _values!549) (store mapRest!17811 mapKey!17811 mapValue!17811))))

(declare-fun b!418202 () Bool)

(declare-fun res!243654 () Bool)

(assert (=> b!418202 (=> (not res!243654) (not e!249407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418202 (= res!243654 (validKeyInArray!0 k!794))))

(declare-fun call!29102 () ListLongMap!6025)

(declare-fun b!418203 () Bool)

(declare-fun call!29101 () ListLongMap!6025)

(declare-fun e!249403 () Bool)

(declare-fun +!1228 (ListLongMap!6025 tuple2!7112) ListLongMap!6025)

(assert (=> b!418203 (= e!249403 (= call!29102 (+!1228 call!29101 (tuple2!7113 k!794 v!412))))))

(declare-fun b!418204 () Bool)

(declare-fun e!249411 () Bool)

(assert (=> b!418204 (= e!249411 true)))

(declare-fun lt!191655 () tuple2!7112)

(declare-fun lt!191658 () V!15495)

(declare-fun lt!191650 () ListLongMap!6025)

(assert (=> b!418204 (= (+!1228 lt!191650 lt!191655) (+!1228 (+!1228 lt!191650 (tuple2!7113 k!794 lt!191658)) lt!191655))))

(declare-fun lt!191654 () V!15495)

(assert (=> b!418204 (= lt!191655 (tuple2!7113 k!794 lt!191654))))

(declare-datatypes ((Unit!12360 0))(
  ( (Unit!12361) )
))
(declare-fun lt!191656 () Unit!12360)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!28 (ListLongMap!6025 (_ BitVec 64) V!15495 V!15495) Unit!12360)

(assert (=> b!418204 (= lt!191656 (addSameAsAddTwiceSameKeyDiffValues!28 lt!191650 k!794 lt!191658 lt!191654))))

(declare-fun lt!191653 () V!15495)

(declare-fun get!6026 (ValueCell!5053 V!15495) V!15495)

(assert (=> b!418204 (= lt!191658 (get!6026 (select (arr!12168 _values!549) from!863) lt!191653))))

(assert (=> b!418204 (= lt!191659 (+!1228 lt!191650 (tuple2!7113 (select (arr!12169 lt!191651) from!863) lt!191654)))))

(assert (=> b!418204 (= lt!191654 (get!6026 (select (store (arr!12168 _values!549) i!563 (ValueCellFull!5053 v!412)) from!863) lt!191653))))

(declare-fun dynLambda!699 (Int (_ BitVec 64)) V!15495)

(assert (=> b!418204 (= lt!191653 (dynLambda!699 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418204 (= lt!191650 (getCurrentListMapNoExtraKeys!1233 lt!191651 lt!191660 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17811 () Bool)

(assert (=> mapIsEmpty!17811 mapRes!17811))

(declare-fun b!418205 () Bool)

(declare-fun e!249404 () Bool)

(assert (=> b!418205 (= e!249404 tp_is_empty!10793)))

(declare-fun b!418206 () Bool)

(assert (=> b!418206 (= e!249407 e!249408)))

(declare-fun res!243647 () Bool)

(assert (=> b!418206 (=> (not res!243647) (not e!249408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25439 (_ BitVec 32)) Bool)

(assert (=> b!418206 (= res!243647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191651 mask!1025))))

(assert (=> b!418206 (= lt!191651 (array!25440 (store (arr!12169 _keys!709) i!563 k!794) (size!12521 _keys!709)))))

(declare-fun b!418207 () Bool)

(assert (=> b!418207 (= e!249403 (= call!29101 call!29102))))

(declare-fun bm!29098 () Bool)

(declare-fun c!55175 () Bool)

(assert (=> bm!29098 (= call!29101 (getCurrentListMapNoExtraKeys!1233 (ite c!55175 _keys!709 lt!191651) (ite c!55175 _values!549 lt!191660) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418208 () Bool)

(declare-fun res!243648 () Bool)

(assert (=> b!418208 (=> (not res!243648) (not e!249407))))

(assert (=> b!418208 (= res!243648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418209 () Bool)

(assert (=> b!418209 (= e!249410 (and e!249404 mapRes!17811))))

(declare-fun condMapEmpty!17811 () Bool)

(declare-fun mapDefault!17811 () ValueCell!5053)

