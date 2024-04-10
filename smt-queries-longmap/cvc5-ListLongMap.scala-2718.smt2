; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40126 () Bool)

(assert start!40126)

(declare-fun b_free!10393 () Bool)

(declare-fun b_next!10393 () Bool)

(assert (=> start!40126 (= b_free!10393 (not b_next!10393))))

(declare-fun tp!36708 () Bool)

(declare-fun b_and!18361 () Bool)

(assert (=> start!40126 (= tp!36708 b_and!18361)))

(declare-fun b!438788 () Bool)

(declare-fun res!259160 () Bool)

(declare-fun e!258772 () Bool)

(assert (=> b!438788 (=> (not res!259160) (not e!258772))))

(declare-datatypes ((array!26907 0))(
  ( (array!26908 (arr!12903 (Array (_ BitVec 32) (_ BitVec 64))) (size!13255 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26907)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438788 (= res!259160 (or (= (select (arr!12903 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12903 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18939 () Bool)

(declare-fun mapRes!18939 () Bool)

(assert (=> mapIsEmpty!18939 mapRes!18939))

(declare-fun b!438789 () Bool)

(declare-fun res!259155 () Bool)

(assert (=> b!438789 (=> (not res!259155) (not e!258772))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16499 0))(
  ( (V!16500 (val!5817 Int)) )
))
(declare-datatypes ((ValueCell!5429 0))(
  ( (ValueCellFull!5429 (v!8064 V!16499)) (EmptyCell!5429) )
))
(declare-datatypes ((array!26909 0))(
  ( (array!26910 (arr!12904 (Array (_ BitVec 32) ValueCell!5429)) (size!13256 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26909)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!438789 (= res!259155 (and (= (size!13256 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13255 _keys!709) (size!13256 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438790 () Bool)

(declare-fun e!258773 () Bool)

(assert (=> b!438790 (= e!258772 e!258773)))

(declare-fun res!259157 () Bool)

(assert (=> b!438790 (=> (not res!259157) (not e!258773))))

(declare-fun lt!202070 () array!26907)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26907 (_ BitVec 32)) Bool)

(assert (=> b!438790 (= res!259157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202070 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!438790 (= lt!202070 (array!26908 (store (arr!12903 _keys!709) i!563 k!794) (size!13255 _keys!709)))))

(declare-fun b!438791 () Bool)

(declare-fun e!258770 () Bool)

(assert (=> b!438791 (= e!258770 (not true))))

(declare-fun minValue!515 () V!16499)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16499)

(declare-fun v!412 () V!16499)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!202066 () array!26909)

(declare-datatypes ((tuple2!7718 0))(
  ( (tuple2!7719 (_1!3870 (_ BitVec 64)) (_2!3870 V!16499)) )
))
(declare-datatypes ((List!7717 0))(
  ( (Nil!7714) (Cons!7713 (h!8569 tuple2!7718) (t!13473 List!7717)) )
))
(declare-datatypes ((ListLongMap!6631 0))(
  ( (ListLongMap!6632 (toList!3331 List!7717)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1520 (array!26907 array!26909 (_ BitVec 32) (_ BitVec 32) V!16499 V!16499 (_ BitVec 32) Int) ListLongMap!6631)

(declare-fun +!1474 (ListLongMap!6631 tuple2!7718) ListLongMap!6631)

(assert (=> b!438791 (= (getCurrentListMapNoExtraKeys!1520 lt!202070 lt!202066 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1474 (getCurrentListMapNoExtraKeys!1520 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7719 k!794 v!412)))))

(declare-datatypes ((Unit!13052 0))(
  ( (Unit!13053) )
))
(declare-fun lt!202067 () Unit!13052)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!643 (array!26907 array!26909 (_ BitVec 32) (_ BitVec 32) V!16499 V!16499 (_ BitVec 32) (_ BitVec 64) V!16499 (_ BitVec 32) Int) Unit!13052)

(assert (=> b!438791 (= lt!202067 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!643 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438792 () Bool)

(declare-fun res!259163 () Bool)

(assert (=> b!438792 (=> (not res!259163) (not e!258772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438792 (= res!259163 (validMask!0 mask!1025))))

(declare-fun b!438793 () Bool)

(declare-fun e!258774 () Bool)

(declare-fun tp_is_empty!11545 () Bool)

(assert (=> b!438793 (= e!258774 tp_is_empty!11545)))

(declare-fun b!438794 () Bool)

(declare-fun e!258771 () Bool)

(assert (=> b!438794 (= e!258771 (and e!258774 mapRes!18939))))

(declare-fun condMapEmpty!18939 () Bool)

(declare-fun mapDefault!18939 () ValueCell!5429)

