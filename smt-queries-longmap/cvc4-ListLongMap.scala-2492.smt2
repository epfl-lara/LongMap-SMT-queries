; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38774 () Bool)

(assert start!38774)

(declare-fun b!404285 () Bool)

(declare-fun res!233121 () Bool)

(declare-fun e!243241 () Bool)

(assert (=> b!404285 (=> (not res!233121) (not e!243241))))

(declare-datatypes ((array!24281 0))(
  ( (array!24282 (arr!11590 (Array (_ BitVec 32) (_ BitVec 64))) (size!11942 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24281)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14695 0))(
  ( (V!14696 (val!5141 Int)) )
))
(declare-datatypes ((ValueCell!4753 0))(
  ( (ValueCellFull!4753 (v!7388 V!14695)) (EmptyCell!4753) )
))
(declare-datatypes ((array!24283 0))(
  ( (array!24284 (arr!11591 (Array (_ BitVec 32) ValueCell!4753)) (size!11943 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24283)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404285 (= res!233121 (and (= (size!11943 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11942 _keys!709) (size!11943 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404286 () Bool)

(declare-fun e!243242 () Bool)

(declare-fun e!243244 () Bool)

(declare-fun mapRes!16911 () Bool)

(assert (=> b!404286 (= e!243242 (and e!243244 mapRes!16911))))

(declare-fun condMapEmpty!16911 () Bool)

(declare-fun mapDefault!16911 () ValueCell!4753)

