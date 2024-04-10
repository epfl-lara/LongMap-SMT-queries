; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41048 () Bool)

(assert start!41048)

(declare-fun b_free!10961 () Bool)

(declare-fun b_next!10961 () Bool)

(assert (=> start!41048 (= b_free!10961 (not b_next!10961))))

(declare-fun tp!38713 () Bool)

(declare-fun b_and!19129 () Bool)

(assert (=> start!41048 (= tp!38713 b_and!19129)))

(declare-fun res!273189 () Bool)

(declare-fun e!267205 () Bool)

(assert (=> start!41048 (=> (not res!273189) (not e!267205))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28399 0))(
  ( (array!28400 (arr!13642 (Array (_ BitVec 32) (_ BitVec 64))) (size!13994 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28399)

(assert (=> start!41048 (= res!273189 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13994 _keys!709))))))

(assert (=> start!41048 e!267205))

(declare-fun tp_is_empty!12299 () Bool)

(assert (=> start!41048 tp_is_empty!12299))

(assert (=> start!41048 tp!38713))

(assert (=> start!41048 true))

(declare-datatypes ((V!17503 0))(
  ( (V!17504 (val!6194 Int)) )
))
(declare-datatypes ((ValueCell!5806 0))(
  ( (ValueCellFull!5806 (v!8464 V!17503)) (EmptyCell!5806) )
))
(declare-datatypes ((array!28401 0))(
  ( (array!28402 (arr!13643 (Array (_ BitVec 32) ValueCell!5806)) (size!13995 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28401)

(declare-fun e!267208 () Bool)

(declare-fun array_inv!9878 (array!28401) Bool)

(assert (=> start!41048 (and (array_inv!9878 _values!549) e!267208)))

(declare-fun array_inv!9879 (array!28399) Bool)

(assert (=> start!41048 (array_inv!9879 _keys!709)))

(declare-fun b!457508 () Bool)

(declare-fun e!267203 () Bool)

(declare-fun e!267209 () Bool)

(assert (=> b!457508 (= e!267203 (not e!267209))))

(declare-fun res!273191 () Bool)

(assert (=> b!457508 (=> res!273191 e!267209)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457508 (= res!273191 (not (validKeyInArray!0 (select (arr!13642 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8158 0))(
  ( (tuple2!8159 (_1!4090 (_ BitVec 64)) (_2!4090 V!17503)) )
))
(declare-datatypes ((List!8232 0))(
  ( (Nil!8229) (Cons!8228 (h!9084 tuple2!8158) (t!14072 List!8232)) )
))
(declare-datatypes ((ListLongMap!7071 0))(
  ( (ListLongMap!7072 (toList!3551 List!8232)) )
))
(declare-fun lt!206949 () ListLongMap!7071)

(declare-fun lt!206952 () ListLongMap!7071)

(assert (=> b!457508 (= lt!206949 lt!206952)))

(declare-fun lt!206945 () ListLongMap!7071)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17503)

(declare-fun +!1587 (ListLongMap!7071 tuple2!8158) ListLongMap!7071)

(assert (=> b!457508 (= lt!206952 (+!1587 lt!206945 (tuple2!8159 k!794 v!412)))))

(declare-fun minValue!515 () V!17503)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17503)

(declare-fun lt!206946 () array!28401)

(declare-fun lt!206947 () array!28399)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1734 (array!28399 array!28401 (_ BitVec 32) (_ BitVec 32) V!17503 V!17503 (_ BitVec 32) Int) ListLongMap!7071)

(assert (=> b!457508 (= lt!206949 (getCurrentListMapNoExtraKeys!1734 lt!206947 lt!206946 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457508 (= lt!206945 (getCurrentListMapNoExtraKeys!1734 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13296 0))(
  ( (Unit!13297) )
))
(declare-fun lt!206948 () Unit!13296)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!747 (array!28399 array!28401 (_ BitVec 32) (_ BitVec 32) V!17503 V!17503 (_ BitVec 32) (_ BitVec 64) V!17503 (_ BitVec 32) Int) Unit!13296)

(assert (=> b!457508 (= lt!206948 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457509 () Bool)

(declare-fun e!267204 () Bool)

(declare-fun mapRes!20092 () Bool)

(assert (=> b!457509 (= e!267208 (and e!267204 mapRes!20092))))

(declare-fun condMapEmpty!20092 () Bool)

(declare-fun mapDefault!20092 () ValueCell!5806)

