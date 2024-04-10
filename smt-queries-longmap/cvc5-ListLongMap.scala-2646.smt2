; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39694 () Bool)

(assert start!39694)

(declare-fun b_free!9961 () Bool)

(declare-fun b_next!9961 () Bool)

(assert (=> start!39694 (= b_free!9961 (not b_next!9961))))

(declare-fun tp!35411 () Bool)

(declare-fun b_and!17617 () Bool)

(assert (=> start!39694 (= tp!35411 b_and!17617)))

(declare-fun res!249933 () Bool)

(declare-fun e!253020 () Bool)

(assert (=> start!39694 (=> (not res!249933) (not e!253020))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26065 0))(
  ( (array!26066 (arr!12482 (Array (_ BitVec 32) (_ BitVec 64))) (size!12834 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26065)

(assert (=> start!39694 (= res!249933 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12834 _keys!709))))))

(assert (=> start!39694 e!253020))

(declare-fun tp_is_empty!11113 () Bool)

(assert (=> start!39694 tp_is_empty!11113))

(assert (=> start!39694 tp!35411))

(assert (=> start!39694 true))

(declare-datatypes ((V!15923 0))(
  ( (V!15924 (val!5601 Int)) )
))
(declare-datatypes ((ValueCell!5213 0))(
  ( (ValueCellFull!5213 (v!7848 V!15923)) (EmptyCell!5213) )
))
(declare-datatypes ((array!26067 0))(
  ( (array!26068 (arr!12483 (Array (_ BitVec 32) ValueCell!5213)) (size!12835 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26067)

(declare-fun e!253023 () Bool)

(declare-fun array_inv!9100 (array!26067) Bool)

(assert (=> start!39694 (and (array_inv!9100 _values!549) e!253023)))

(declare-fun array_inv!9101 (array!26065) Bool)

(assert (=> start!39694 (array_inv!9101 _keys!709)))

(declare-fun b!426479 () Bool)

(declare-fun res!249940 () Bool)

(declare-fun e!253017 () Bool)

(assert (=> b!426479 (=> (not res!249940) (not e!253017))))

(declare-fun lt!194977 () array!26065)

(declare-datatypes ((List!7374 0))(
  ( (Nil!7371) (Cons!7370 (h!8226 (_ BitVec 64)) (t!12818 List!7374)) )
))
(declare-fun arrayNoDuplicates!0 (array!26065 (_ BitVec 32) List!7374) Bool)

(assert (=> b!426479 (= res!249940 (arrayNoDuplicates!0 lt!194977 #b00000000000000000000000000000000 Nil!7371))))

(declare-fun b!426480 () Bool)

(declare-fun res!249932 () Bool)

(assert (=> b!426480 (=> (not res!249932) (not e!253020))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!426480 (= res!249932 (and (= (size!12835 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12834 _keys!709) (size!12835 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426481 () Bool)

(declare-fun e!253019 () Bool)

(assert (=> b!426481 (= e!253017 e!253019)))

(declare-fun res!249935 () Bool)

(assert (=> b!426481 (=> (not res!249935) (not e!253019))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426481 (= res!249935 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15923)

(declare-fun zeroValue!515 () V!15923)

(declare-fun lt!194978 () array!26067)

(declare-datatypes ((tuple2!7360 0))(
  ( (tuple2!7361 (_1!3691 (_ BitVec 64)) (_2!3691 V!15923)) )
))
(declare-datatypes ((List!7375 0))(
  ( (Nil!7372) (Cons!7371 (h!8227 tuple2!7360) (t!12819 List!7375)) )
))
(declare-datatypes ((ListLongMap!6273 0))(
  ( (ListLongMap!6274 (toList!3152 List!7375)) )
))
(declare-fun lt!194974 () ListLongMap!6273)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1356 (array!26065 array!26067 (_ BitVec 32) (_ BitVec 32) V!15923 V!15923 (_ BitVec 32) Int) ListLongMap!6273)

(assert (=> b!426481 (= lt!194974 (getCurrentListMapNoExtraKeys!1356 lt!194977 lt!194978 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15923)

(assert (=> b!426481 (= lt!194978 (array!26068 (store (arr!12483 _values!549) i!563 (ValueCellFull!5213 v!412)) (size!12835 _values!549)))))

(declare-fun lt!194976 () ListLongMap!6273)

(assert (=> b!426481 (= lt!194976 (getCurrentListMapNoExtraKeys!1356 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426482 () Bool)

(assert (=> b!426482 (= e!253019 (not true))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1310 (ListLongMap!6273 tuple2!7360) ListLongMap!6273)

(assert (=> b!426482 (= (getCurrentListMapNoExtraKeys!1356 lt!194977 lt!194978 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1310 (getCurrentListMapNoExtraKeys!1356 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7361 k!794 v!412)))))

(declare-datatypes ((Unit!12522 0))(
  ( (Unit!12523) )
))
(declare-fun lt!194975 () Unit!12522)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!505 (array!26065 array!26067 (_ BitVec 32) (_ BitVec 32) V!15923 V!15923 (_ BitVec 32) (_ BitVec 64) V!15923 (_ BitVec 32) Int) Unit!12522)

(assert (=> b!426482 (= lt!194975 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!505 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18291 () Bool)

(declare-fun mapRes!18291 () Bool)

(assert (=> mapIsEmpty!18291 mapRes!18291))

(declare-fun b!426483 () Bool)

(declare-fun e!253022 () Bool)

(assert (=> b!426483 (= e!253023 (and e!253022 mapRes!18291))))

(declare-fun condMapEmpty!18291 () Bool)

(declare-fun mapDefault!18291 () ValueCell!5213)

