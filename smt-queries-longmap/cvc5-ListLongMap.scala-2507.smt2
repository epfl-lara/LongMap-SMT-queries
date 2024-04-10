; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38860 () Bool)

(assert start!38860)

(declare-fun b!405962 () Bool)

(declare-fun res!234412 () Bool)

(declare-fun e!244017 () Bool)

(assert (=> b!405962 (=> (not res!234412) (not e!244017))))

(declare-datatypes ((array!24449 0))(
  ( (array!24450 (arr!11674 (Array (_ BitVec 32) (_ BitVec 64))) (size!12026 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24449)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405962 (= res!234412 (or (= (select (arr!11674 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11674 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405963 () Bool)

(declare-fun res!234417 () Bool)

(assert (=> b!405963 (=> (not res!234417) (not e!244017))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14811 0))(
  ( (V!14812 (val!5184 Int)) )
))
(declare-datatypes ((ValueCell!4796 0))(
  ( (ValueCellFull!4796 (v!7431 V!14811)) (EmptyCell!4796) )
))
(declare-datatypes ((array!24451 0))(
  ( (array!24452 (arr!11675 (Array (_ BitVec 32) ValueCell!4796)) (size!12027 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24451)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!405963 (= res!234417 (and (= (size!12027 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12026 _keys!709) (size!12027 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405964 () Bool)

(declare-fun e!244020 () Bool)

(declare-fun e!244018 () Bool)

(declare-fun mapRes!17040 () Bool)

(assert (=> b!405964 (= e!244020 (and e!244018 mapRes!17040))))

(declare-fun condMapEmpty!17040 () Bool)

(declare-fun mapDefault!17040 () ValueCell!4796)

