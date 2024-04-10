; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40118 () Bool)

(assert start!40118)

(declare-fun b_free!10385 () Bool)

(declare-fun b_next!10385 () Bool)

(assert (=> start!40118 (= b_free!10385 (not b_next!10385))))

(declare-fun tp!36684 () Bool)

(declare-fun b_and!18353 () Bool)

(assert (=> start!40118 (= tp!36684 b_and!18353)))

(declare-fun b!438596 () Bool)

(declare-fun res!259003 () Bool)

(declare-fun e!258684 () Bool)

(assert (=> b!438596 (=> (not res!259003) (not e!258684))))

(declare-datatypes ((array!26891 0))(
  ( (array!26892 (arr!12895 (Array (_ BitVec 32) (_ BitVec 64))) (size!13247 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26891)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26891 (_ BitVec 32)) Bool)

(assert (=> b!438596 (= res!259003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438597 () Bool)

(declare-fun e!258686 () Bool)

(assert (=> b!438597 (= e!258686 (not true))))

(declare-datatypes ((V!16487 0))(
  ( (V!16488 (val!5813 Int)) )
))
(declare-fun minValue!515 () V!16487)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16487)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5425 0))(
  ( (ValueCellFull!5425 (v!8060 V!16487)) (EmptyCell!5425) )
))
(declare-datatypes ((array!26893 0))(
  ( (array!26894 (arr!12896 (Array (_ BitVec 32) ValueCell!5425)) (size!13248 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26893)

(declare-fun lt!202008 () array!26893)

(declare-fun zeroValue!515 () V!16487)

(declare-fun lt!202007 () array!26891)

(declare-datatypes ((tuple2!7712 0))(
  ( (tuple2!7713 (_1!3867 (_ BitVec 64)) (_2!3867 V!16487)) )
))
(declare-datatypes ((List!7710 0))(
  ( (Nil!7707) (Cons!7706 (h!8562 tuple2!7712) (t!13466 List!7710)) )
))
(declare-datatypes ((ListLongMap!6625 0))(
  ( (ListLongMap!6626 (toList!3328 List!7710)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1517 (array!26891 array!26893 (_ BitVec 32) (_ BitVec 32) V!16487 V!16487 (_ BitVec 32) Int) ListLongMap!6625)

(declare-fun +!1471 (ListLongMap!6625 tuple2!7712) ListLongMap!6625)

(assert (=> b!438597 (= (getCurrentListMapNoExtraKeys!1517 lt!202007 lt!202008 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1471 (getCurrentListMapNoExtraKeys!1517 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7713 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13046 0))(
  ( (Unit!13047) )
))
(declare-fun lt!202006 () Unit!13046)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!640 (array!26891 array!26893 (_ BitVec 32) (_ BitVec 32) V!16487 V!16487 (_ BitVec 32) (_ BitVec 64) V!16487 (_ BitVec 32) Int) Unit!13046)

(assert (=> b!438597 (= lt!202006 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!640 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438598 () Bool)

(declare-fun res!259011 () Bool)

(assert (=> b!438598 (=> (not res!259011) (not e!258684))))

(assert (=> b!438598 (= res!259011 (or (= (select (arr!12895 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12895 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438599 () Bool)

(declare-fun res!259004 () Bool)

(declare-fun e!258689 () Bool)

(assert (=> b!438599 (=> (not res!259004) (not e!258689))))

(declare-datatypes ((List!7711 0))(
  ( (Nil!7708) (Cons!7707 (h!8563 (_ BitVec 64)) (t!13467 List!7711)) )
))
(declare-fun arrayNoDuplicates!0 (array!26891 (_ BitVec 32) List!7711) Bool)

(assert (=> b!438599 (= res!259004 (arrayNoDuplicates!0 lt!202007 #b00000000000000000000000000000000 Nil!7708))))

(declare-fun b!438600 () Bool)

(declare-fun res!259007 () Bool)

(assert (=> b!438600 (=> (not res!259007) (not e!258684))))

(assert (=> b!438600 (= res!259007 (and (= (size!13248 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13247 _keys!709) (size!13248 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438601 () Bool)

(declare-fun e!258690 () Bool)

(declare-fun e!258685 () Bool)

(declare-fun mapRes!18927 () Bool)

(assert (=> b!438601 (= e!258690 (and e!258685 mapRes!18927))))

(declare-fun condMapEmpty!18927 () Bool)

(declare-fun mapDefault!18927 () ValueCell!5425)

