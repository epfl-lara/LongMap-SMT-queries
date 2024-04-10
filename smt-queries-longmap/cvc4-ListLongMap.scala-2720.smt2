; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40142 () Bool)

(assert start!40142)

(declare-fun b_free!10409 () Bool)

(declare-fun b_next!10409 () Bool)

(assert (=> start!40142 (= b_free!10409 (not b_next!10409))))

(declare-fun tp!36756 () Bool)

(declare-fun b_and!18377 () Bool)

(assert (=> start!40142 (= tp!36756 b_and!18377)))

(declare-fun b!439172 () Bool)

(declare-fun e!258937 () Bool)

(declare-fun tp_is_empty!11561 () Bool)

(assert (=> b!439172 (= e!258937 tp_is_empty!11561)))

(declare-fun b!439173 () Bool)

(declare-fun e!258942 () Bool)

(assert (=> b!439173 (= e!258942 (not true))))

(declare-datatypes ((V!16519 0))(
  ( (V!16520 (val!5825 Int)) )
))
(declare-fun minValue!515 () V!16519)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!26939 0))(
  ( (array!26940 (arr!12919 (Array (_ BitVec 32) (_ BitVec 64))) (size!13271 (_ BitVec 32))) )
))
(declare-fun lt!202188 () array!26939)

(declare-datatypes ((ValueCell!5437 0))(
  ( (ValueCellFull!5437 (v!8072 V!16519)) (EmptyCell!5437) )
))
(declare-datatypes ((array!26941 0))(
  ( (array!26942 (arr!12920 (Array (_ BitVec 32) ValueCell!5437)) (size!13272 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26941)

(declare-fun zeroValue!515 () V!16519)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!202190 () array!26941)

(declare-fun v!412 () V!16519)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26939)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7734 0))(
  ( (tuple2!7735 (_1!3878 (_ BitVec 64)) (_2!3878 V!16519)) )
))
(declare-datatypes ((List!7731 0))(
  ( (Nil!7728) (Cons!7727 (h!8583 tuple2!7734) (t!13487 List!7731)) )
))
(declare-datatypes ((ListLongMap!6647 0))(
  ( (ListLongMap!6648 (toList!3339 List!7731)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1528 (array!26939 array!26941 (_ BitVec 32) (_ BitVec 32) V!16519 V!16519 (_ BitVec 32) Int) ListLongMap!6647)

(declare-fun +!1480 (ListLongMap!6647 tuple2!7734) ListLongMap!6647)

(assert (=> b!439173 (= (getCurrentListMapNoExtraKeys!1528 lt!202188 lt!202190 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1480 (getCurrentListMapNoExtraKeys!1528 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7735 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13064 0))(
  ( (Unit!13065) )
))
(declare-fun lt!202186 () Unit!13064)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!649 (array!26939 array!26941 (_ BitVec 32) (_ BitVec 32) V!16519 V!16519 (_ BitVec 32) (_ BitVec 64) V!16519 (_ BitVec 32) Int) Unit!13064)

(assert (=> b!439173 (= lt!202186 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!649 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439174 () Bool)

(declare-fun res!259471 () Bool)

(declare-fun e!258940 () Bool)

(assert (=> b!439174 (=> (not res!259471) (not e!258940))))

(assert (=> b!439174 (= res!259471 (bvsle from!863 i!563))))

(declare-fun b!439176 () Bool)

(declare-fun e!258936 () Bool)

(declare-fun e!258938 () Bool)

(declare-fun mapRes!18963 () Bool)

(assert (=> b!439176 (= e!258936 (and e!258938 mapRes!18963))))

(declare-fun condMapEmpty!18963 () Bool)

(declare-fun mapDefault!18963 () ValueCell!5437)

