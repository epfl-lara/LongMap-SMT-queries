; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39626 () Bool)

(assert start!39626)

(declare-fun b_free!9893 () Bool)

(declare-fun b_next!9893 () Bool)

(assert (=> start!39626 (= b_free!9893 (not b_next!9893))))

(declare-fun tp!35208 () Bool)

(declare-fun b_and!17549 () Bool)

(assert (=> start!39626 (= tp!35208 b_and!17549)))

(declare-fun b!424847 () Bool)

(declare-fun res!248604 () Bool)

(declare-fun e!252309 () Bool)

(assert (=> b!424847 (=> (not res!248604) (not e!252309))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424847 (= res!248604 (validMask!0 mask!1025))))

(declare-fun b!424848 () Bool)

(declare-fun res!248608 () Bool)

(declare-fun e!252305 () Bool)

(assert (=> b!424848 (=> (not res!248608) (not e!252305))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424848 (= res!248608 (bvsle from!863 i!563))))

(declare-fun b!424849 () Bool)

(declare-fun res!248615 () Bool)

(assert (=> b!424849 (=> (not res!248615) (not e!252309))))

(declare-datatypes ((array!25929 0))(
  ( (array!25930 (arr!12414 (Array (_ BitVec 32) (_ BitVec 64))) (size!12766 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25929)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15831 0))(
  ( (V!15832 (val!5567 Int)) )
))
(declare-datatypes ((ValueCell!5179 0))(
  ( (ValueCellFull!5179 (v!7814 V!15831)) (EmptyCell!5179) )
))
(declare-datatypes ((array!25931 0))(
  ( (array!25932 (arr!12415 (Array (_ BitVec 32) ValueCell!5179)) (size!12767 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25931)

(assert (=> b!424849 (= res!248615 (and (= (size!12767 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12766 _keys!709) (size!12767 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424850 () Bool)

(declare-fun res!248612 () Bool)

(assert (=> b!424850 (=> (not res!248612) (not e!252309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25929 (_ BitVec 32)) Bool)

(assert (=> b!424850 (= res!248612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424851 () Bool)

(declare-fun e!252308 () Bool)

(assert (=> b!424851 (= e!252305 e!252308)))

(declare-fun res!248614 () Bool)

(assert (=> b!424851 (=> (not res!248614) (not e!252308))))

(assert (=> b!424851 (= res!248614 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15831)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7310 0))(
  ( (tuple2!7311 (_1!3666 (_ BitVec 64)) (_2!3666 V!15831)) )
))
(declare-datatypes ((List!7321 0))(
  ( (Nil!7318) (Cons!7317 (h!8173 tuple2!7310) (t!12765 List!7321)) )
))
(declare-datatypes ((ListLongMap!6223 0))(
  ( (ListLongMap!6224 (toList!3127 List!7321)) )
))
(declare-fun lt!194465 () ListLongMap!6223)

(declare-fun lt!194467 () array!25931)

(declare-fun lt!194466 () array!25929)

(declare-fun zeroValue!515 () V!15831)

(declare-fun getCurrentListMapNoExtraKeys!1331 (array!25929 array!25931 (_ BitVec 32) (_ BitVec 32) V!15831 V!15831 (_ BitVec 32) Int) ListLongMap!6223)

(assert (=> b!424851 (= lt!194465 (getCurrentListMapNoExtraKeys!1331 lt!194466 lt!194467 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15831)

(assert (=> b!424851 (= lt!194467 (array!25932 (store (arr!12415 _values!549) i!563 (ValueCellFull!5179 v!412)) (size!12767 _values!549)))))

(declare-fun lt!194468 () ListLongMap!6223)

(assert (=> b!424851 (= lt!194468 (getCurrentListMapNoExtraKeys!1331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424852 () Bool)

(declare-fun res!248616 () Bool)

(assert (=> b!424852 (=> (not res!248616) (not e!252309))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424852 (= res!248616 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!18189 () Bool)

(declare-fun mapRes!18189 () Bool)

(declare-fun tp!35207 () Bool)

(declare-fun e!252304 () Bool)

(assert (=> mapNonEmpty!18189 (= mapRes!18189 (and tp!35207 e!252304))))

(declare-fun mapValue!18189 () ValueCell!5179)

(declare-fun mapKey!18189 () (_ BitVec 32))

(declare-fun mapRest!18189 () (Array (_ BitVec 32) ValueCell!5179))

(assert (=> mapNonEmpty!18189 (= (arr!12415 _values!549) (store mapRest!18189 mapKey!18189 mapValue!18189))))

(declare-fun b!424853 () Bool)

(assert (=> b!424853 (= e!252308 (not true))))

(declare-fun +!1286 (ListLongMap!6223 tuple2!7310) ListLongMap!6223)

(assert (=> b!424853 (= (getCurrentListMapNoExtraKeys!1331 lt!194466 lt!194467 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1286 (getCurrentListMapNoExtraKeys!1331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7311 k!794 v!412)))))

(declare-datatypes ((Unit!12474 0))(
  ( (Unit!12475) )
))
(declare-fun lt!194464 () Unit!12474)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!481 (array!25929 array!25931 (_ BitVec 32) (_ BitVec 32) V!15831 V!15831 (_ BitVec 32) (_ BitVec 64) V!15831 (_ BitVec 32) Int) Unit!12474)

(assert (=> b!424853 (= lt!194464 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!481 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!424854 () Bool)

(declare-fun e!252306 () Bool)

(declare-fun tp_is_empty!11045 () Bool)

(assert (=> b!424854 (= e!252306 tp_is_empty!11045)))

(declare-fun b!424855 () Bool)

(declare-fun e!252303 () Bool)

(assert (=> b!424855 (= e!252303 (and e!252306 mapRes!18189))))

(declare-fun condMapEmpty!18189 () Bool)

(declare-fun mapDefault!18189 () ValueCell!5179)

