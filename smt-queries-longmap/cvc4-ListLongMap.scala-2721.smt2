; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40148 () Bool)

(assert start!40148)

(declare-fun b_free!10415 () Bool)

(declare-fun b_next!10415 () Bool)

(assert (=> start!40148 (= b_free!10415 (not b_next!10415))))

(declare-fun tp!36773 () Bool)

(declare-fun b_and!18383 () Bool)

(assert (=> start!40148 (= tp!36773 b_and!18383)))

(declare-fun b!439316 () Bool)

(declare-fun res!259591 () Bool)

(declare-fun e!259000 () Bool)

(assert (=> b!439316 (=> (not res!259591) (not e!259000))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26951 0))(
  ( (array!26952 (arr!12925 (Array (_ BitVec 32) (_ BitVec 64))) (size!13277 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26951)

(assert (=> b!439316 (= res!259591 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13277 _keys!709))))))

(declare-fun b!439317 () Bool)

(declare-fun res!259586 () Bool)

(declare-fun e!259005 () Bool)

(assert (=> b!439317 (=> (not res!259586) (not e!259005))))

(declare-fun lt!202235 () array!26951)

(declare-datatypes ((List!7736 0))(
  ( (Nil!7733) (Cons!7732 (h!8588 (_ BitVec 64)) (t!13492 List!7736)) )
))
(declare-fun arrayNoDuplicates!0 (array!26951 (_ BitVec 32) List!7736) Bool)

(assert (=> b!439317 (= res!259586 (arrayNoDuplicates!0 lt!202235 #b00000000000000000000000000000000 Nil!7733))))

(declare-fun b!439318 () Bool)

(declare-fun e!258999 () Bool)

(declare-fun e!259004 () Bool)

(declare-fun mapRes!18972 () Bool)

(assert (=> b!439318 (= e!258999 (and e!259004 mapRes!18972))))

(declare-fun condMapEmpty!18972 () Bool)

(declare-datatypes ((V!16527 0))(
  ( (V!16528 (val!5828 Int)) )
))
(declare-datatypes ((ValueCell!5440 0))(
  ( (ValueCellFull!5440 (v!8075 V!16527)) (EmptyCell!5440) )
))
(declare-datatypes ((array!26953 0))(
  ( (array!26954 (arr!12926 (Array (_ BitVec 32) ValueCell!5440)) (size!13278 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26953)

(declare-fun mapDefault!18972 () ValueCell!5440)

