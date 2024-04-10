; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39494 () Bool)

(assert start!39494)

(declare-fun b_free!9761 () Bool)

(declare-fun b_next!9761 () Bool)

(assert (=> start!39494 (= b_free!9761 (not b_next!9761))))

(declare-fun tp!34811 () Bool)

(declare-fun b_and!17397 () Bool)

(assert (=> start!39494 (= tp!34811 b_and!17397)))

(declare-fun res!246173 () Bool)

(declare-fun e!251031 () Bool)

(assert (=> start!39494 (=> (not res!246173) (not e!251031))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25673 0))(
  ( (array!25674 (arr!12286 (Array (_ BitVec 32) (_ BitVec 64))) (size!12638 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25673)

(assert (=> start!39494 (= res!246173 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12638 _keys!709))))))

(assert (=> start!39494 e!251031))

(declare-fun tp_is_empty!10913 () Bool)

(assert (=> start!39494 tp_is_empty!10913))

(assert (=> start!39494 tp!34811))

(assert (=> start!39494 true))

(declare-datatypes ((V!15655 0))(
  ( (V!15656 (val!5501 Int)) )
))
(declare-datatypes ((ValueCell!5113 0))(
  ( (ValueCellFull!5113 (v!7748 V!15655)) (EmptyCell!5113) )
))
(declare-datatypes ((array!25675 0))(
  ( (array!25676 (arr!12287 (Array (_ BitVec 32) ValueCell!5113)) (size!12639 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25675)

(declare-fun e!251023 () Bool)

(declare-fun array_inv!8952 (array!25675) Bool)

(assert (=> start!39494 (and (array_inv!8952 _values!549) e!251023)))

(declare-fun array_inv!8953 (array!25673) Bool)

(assert (=> start!39494 (array_inv!8953 _keys!709)))

(declare-fun b!421737 () Bool)

(declare-fun e!251030 () Bool)

(assert (=> b!421737 (= e!251030 true)))

(declare-datatypes ((tuple2!7216 0))(
  ( (tuple2!7217 (_1!3619 (_ BitVec 64)) (_2!3619 V!15655)) )
))
(declare-fun lt!193637 () tuple2!7216)

(declare-datatypes ((List!7222 0))(
  ( (Nil!7219) (Cons!7218 (h!8074 tuple2!7216) (t!12648 List!7222)) )
))
(declare-datatypes ((ListLongMap!6129 0))(
  ( (ListLongMap!6130 (toList!3080 List!7222)) )
))
(declare-fun lt!193638 () ListLongMap!6129)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!193630 () V!15655)

(declare-fun +!1275 (ListLongMap!6129 tuple2!7216) ListLongMap!6129)

(assert (=> b!421737 (= (+!1275 lt!193638 lt!193637) (+!1275 (+!1275 lt!193638 (tuple2!7217 k!794 lt!193630)) lt!193637))))

(declare-fun lt!193633 () V!15655)

(assert (=> b!421737 (= lt!193637 (tuple2!7217 k!794 lt!193633))))

(declare-datatypes ((Unit!12452 0))(
  ( (Unit!12453) )
))
(declare-fun lt!193639 () Unit!12452)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!69 (ListLongMap!6129 (_ BitVec 64) V!15655 V!15655) Unit!12452)

(assert (=> b!421737 (= lt!193639 (addSameAsAddTwiceSameKeyDiffValues!69 lt!193638 k!794 lt!193630 lt!193633))))

(declare-fun lt!193631 () V!15655)

(declare-fun get!6107 (ValueCell!5113 V!15655) V!15655)

(assert (=> b!421737 (= lt!193630 (get!6107 (select (arr!12287 _values!549) from!863) lt!193631))))

(declare-fun lt!193634 () array!25673)

(declare-fun lt!193636 () ListLongMap!6129)

(assert (=> b!421737 (= lt!193636 (+!1275 lt!193638 (tuple2!7217 (select (arr!12286 lt!193634) from!863) lt!193633)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15655)

(assert (=> b!421737 (= lt!193633 (get!6107 (select (store (arr!12287 _values!549) i!563 (ValueCellFull!5113 v!412)) from!863) lt!193631))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!740 (Int (_ BitVec 64)) V!15655)

(assert (=> b!421737 (= lt!193631 (dynLambda!740 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15655)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15655)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!193632 () array!25675)

(declare-fun getCurrentListMapNoExtraKeys!1284 (array!25673 array!25675 (_ BitVec 32) (_ BitVec 32) V!15655 V!15655 (_ BitVec 32) Int) ListLongMap!6129)

(assert (=> b!421737 (= lt!193638 (getCurrentListMapNoExtraKeys!1284 lt!193634 lt!193632 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421738 () Bool)

(declare-fun res!246176 () Bool)

(assert (=> b!421738 (=> (not res!246176) (not e!251031))))

(declare-datatypes ((List!7223 0))(
  ( (Nil!7220) (Cons!7219 (h!8075 (_ BitVec 64)) (t!12649 List!7223)) )
))
(declare-fun arrayNoDuplicates!0 (array!25673 (_ BitVec 32) List!7223) Bool)

(assert (=> b!421738 (= res!246176 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7220))))

(declare-fun b!421739 () Bool)

(declare-fun e!251026 () Bool)

(declare-fun e!251024 () Bool)

(assert (=> b!421739 (= e!251026 e!251024)))

(declare-fun res!246166 () Bool)

(assert (=> b!421739 (=> (not res!246166) (not e!251024))))

(assert (=> b!421739 (= res!246166 (= from!863 i!563))))

(assert (=> b!421739 (= lt!193636 (getCurrentListMapNoExtraKeys!1284 lt!193634 lt!193632 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421739 (= lt!193632 (array!25676 (store (arr!12287 _values!549) i!563 (ValueCellFull!5113 v!412)) (size!12639 _values!549)))))

(declare-fun lt!193635 () ListLongMap!6129)

(assert (=> b!421739 (= lt!193635 (getCurrentListMapNoExtraKeys!1284 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421740 () Bool)

(declare-fun e!251028 () Bool)

(assert (=> b!421740 (= e!251028 tp_is_empty!10913)))

(declare-fun b!421741 () Bool)

(declare-fun res!246177 () Bool)

(assert (=> b!421741 (=> (not res!246177) (not e!251031))))

(assert (=> b!421741 (= res!246177 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12638 _keys!709))))))

(declare-fun e!251025 () Bool)

(declare-fun call!29461 () ListLongMap!6129)

(declare-fun b!421742 () Bool)

(declare-fun call!29462 () ListLongMap!6129)

(assert (=> b!421742 (= e!251025 (= call!29461 (+!1275 call!29462 (tuple2!7217 k!794 v!412))))))

(declare-fun b!421743 () Bool)

(assert (=> b!421743 (= e!251024 (not e!251030))))

(declare-fun res!246175 () Bool)

(assert (=> b!421743 (=> res!246175 e!251030)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421743 (= res!246175 (validKeyInArray!0 (select (arr!12286 _keys!709) from!863)))))

(assert (=> b!421743 e!251025))

(declare-fun c!55355 () Bool)

(assert (=> b!421743 (= c!55355 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193640 () Unit!12452)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!472 (array!25673 array!25675 (_ BitVec 32) (_ BitVec 32) V!15655 V!15655 (_ BitVec 32) (_ BitVec 64) V!15655 (_ BitVec 32) Int) Unit!12452)

(assert (=> b!421743 (= lt!193640 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!472 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421744 () Bool)

(declare-fun res!246171 () Bool)

(assert (=> b!421744 (=> (not res!246171) (not e!251031))))

(assert (=> b!421744 (= res!246171 (validKeyInArray!0 k!794))))

(declare-fun b!421745 () Bool)

(declare-fun res!246168 () Bool)

(assert (=> b!421745 (=> (not res!246168) (not e!251031))))

(declare-fun arrayContainsKey!0 (array!25673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421745 (= res!246168 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!421746 () Bool)

(declare-fun res!246172 () Bool)

(assert (=> b!421746 (=> (not res!246172) (not e!251026))))

(assert (=> b!421746 (= res!246172 (arrayNoDuplicates!0 lt!193634 #b00000000000000000000000000000000 Nil!7220))))

(declare-fun b!421747 () Bool)

(declare-fun res!246174 () Bool)

(assert (=> b!421747 (=> (not res!246174) (not e!251031))))

(assert (=> b!421747 (= res!246174 (and (= (size!12639 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12638 _keys!709) (size!12639 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29458 () Bool)

(assert (=> bm!29458 (= call!29462 (getCurrentListMapNoExtraKeys!1284 (ite c!55355 _keys!709 lt!193634) (ite c!55355 _values!549 lt!193632) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17991 () Bool)

(declare-fun mapRes!17991 () Bool)

(declare-fun tp!34812 () Bool)

(declare-fun e!251029 () Bool)

(assert (=> mapNonEmpty!17991 (= mapRes!17991 (and tp!34812 e!251029))))

(declare-fun mapValue!17991 () ValueCell!5113)

(declare-fun mapKey!17991 () (_ BitVec 32))

(declare-fun mapRest!17991 () (Array (_ BitVec 32) ValueCell!5113))

(assert (=> mapNonEmpty!17991 (= (arr!12287 _values!549) (store mapRest!17991 mapKey!17991 mapValue!17991))))

(declare-fun b!421748 () Bool)

(assert (=> b!421748 (= e!251025 (= call!29462 call!29461))))

(declare-fun b!421749 () Bool)

(assert (=> b!421749 (= e!251023 (and e!251028 mapRes!17991))))

(declare-fun condMapEmpty!17991 () Bool)

(declare-fun mapDefault!17991 () ValueCell!5113)

