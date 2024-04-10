; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73064 () Bool)

(assert start!73064)

(declare-fun b_free!13979 () Bool)

(declare-fun b_next!13979 () Bool)

(assert (=> start!73064 (= b_free!13979 (not b_next!13979))))

(declare-fun tp!49441 () Bool)

(declare-fun b_and!23117 () Bool)

(assert (=> start!73064 (= tp!49441 b_and!23117)))

(declare-fun b!849661 () Bool)

(declare-fun res!577214 () Bool)

(declare-fun e!474012 () Bool)

(assert (=> b!849661 (=> (not res!577214) (not e!474012))))

(declare-datatypes ((array!48436 0))(
  ( (array!48437 (arr!23249 (Array (_ BitVec 32) (_ BitVec 64))) (size!23689 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48436)

(declare-datatypes ((List!16463 0))(
  ( (Nil!16460) (Cons!16459 (h!17590 (_ BitVec 64)) (t!22888 List!16463)) )
))
(declare-fun arrayNoDuplicates!0 (array!48436 (_ BitVec 32) List!16463) Bool)

(assert (=> b!849661 (= res!577214 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16460))))

(declare-fun b!849663 () Bool)

(declare-fun e!474009 () Bool)

(declare-fun e!474016 () Bool)

(declare-fun mapRes!25772 () Bool)

(assert (=> b!849663 (= e!474009 (and e!474016 mapRes!25772))))

(declare-fun condMapEmpty!25772 () Bool)

(declare-datatypes ((V!26533 0))(
  ( (V!26534 (val!8105 Int)) )
))
(declare-datatypes ((ValueCell!7618 0))(
  ( (ValueCellFull!7618 (v!10530 V!26533)) (EmptyCell!7618) )
))
(declare-datatypes ((array!48438 0))(
  ( (array!48439 (arr!23250 (Array (_ BitVec 32) ValueCell!7618)) (size!23690 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48438)

(declare-fun mapDefault!25772 () ValueCell!7618)

