; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39860 () Bool)

(assert start!39860)

(declare-fun b_free!10127 () Bool)

(declare-fun b_next!10127 () Bool)

(assert (=> start!39860 (= b_free!10127 (not b_next!10127))))

(declare-fun tp!35909 () Bool)

(declare-fun b_and!17913 () Bool)

(assert (=> start!39860 (= tp!35909 b_and!17913)))

(declare-fun b!431138 () Bool)

(declare-fun e!255170 () Bool)

(declare-fun e!255168 () Bool)

(assert (=> b!431138 (= e!255170 e!255168)))

(declare-fun res!253427 () Bool)

(assert (=> b!431138 (=> (not res!253427) (not e!255168))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431138 (= res!253427 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16143 0))(
  ( (V!16144 (val!5684 Int)) )
))
(declare-fun minValue!515 () V!16143)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16143)

(declare-datatypes ((array!26393 0))(
  ( (array!26394 (arr!12646 (Array (_ BitVec 32) (_ BitVec 64))) (size!12998 (_ BitVec 32))) )
))
(declare-fun lt!197366 () array!26393)

(declare-datatypes ((ValueCell!5296 0))(
  ( (ValueCellFull!5296 (v!7931 V!16143)) (EmptyCell!5296) )
))
(declare-datatypes ((array!26395 0))(
  ( (array!26396 (arr!12647 (Array (_ BitVec 32) ValueCell!5296)) (size!12999 (_ BitVec 32))) )
))
(declare-fun lt!197373 () array!26395)

(declare-datatypes ((tuple2!7492 0))(
  ( (tuple2!7493 (_1!3757 (_ BitVec 64)) (_2!3757 V!16143)) )
))
(declare-datatypes ((List!7508 0))(
  ( (Nil!7505) (Cons!7504 (h!8360 tuple2!7492) (t!13084 List!7508)) )
))
(declare-datatypes ((ListLongMap!6405 0))(
  ( (ListLongMap!6406 (toList!3218 List!7508)) )
))
(declare-fun lt!197361 () ListLongMap!6405)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1419 (array!26393 array!26395 (_ BitVec 32) (_ BitVec 32) V!16143 V!16143 (_ BitVec 32) Int) ListLongMap!6405)

(assert (=> b!431138 (= lt!197361 (getCurrentListMapNoExtraKeys!1419 lt!197366 lt!197373 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26395)

(declare-fun v!412 () V!16143)

(assert (=> b!431138 (= lt!197373 (array!26396 (store (arr!12647 _values!549) i!563 (ValueCellFull!5296 v!412)) (size!12999 _values!549)))))

(declare-fun _keys!709 () array!26393)

(declare-fun lt!197367 () ListLongMap!6405)

(assert (=> b!431138 (= lt!197367 (getCurrentListMapNoExtraKeys!1419 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431139 () Bool)

(declare-fun res!253434 () Bool)

(declare-fun e!255167 () Bool)

(assert (=> b!431139 (=> (not res!253434) (not e!255167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26393 (_ BitVec 32)) Bool)

(assert (=> b!431139 (= res!253434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431140 () Bool)

(declare-fun res!253435 () Bool)

(assert (=> b!431140 (=> (not res!253435) (not e!255167))))

(declare-datatypes ((List!7509 0))(
  ( (Nil!7506) (Cons!7505 (h!8361 (_ BitVec 64)) (t!13085 List!7509)) )
))
(declare-fun arrayNoDuplicates!0 (array!26393 (_ BitVec 32) List!7509) Bool)

(assert (=> b!431140 (= res!253435 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7506))))

(declare-fun b!431141 () Bool)

(declare-fun e!255166 () Bool)

(declare-fun e!255169 () Bool)

(declare-fun mapRes!18540 () Bool)

(assert (=> b!431141 (= e!255166 (and e!255169 mapRes!18540))))

(declare-fun condMapEmpty!18540 () Bool)

(declare-fun mapDefault!18540 () ValueCell!5296)

