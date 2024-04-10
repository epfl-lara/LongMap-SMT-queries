; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7420 () Bool)

(assert start!7420)

(declare-fun b!47686 () Bool)

(declare-fun e!30564 () Bool)

(declare-fun tp_is_empty!2057 () Bool)

(assert (=> b!47686 (= e!30564 tp_is_empty!2057)))

(declare-fun res!27735 () Bool)

(declare-fun e!30565 () Bool)

(assert (=> start!7420 (=> (not res!27735) (not e!30565))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7420 (= res!27735 (validMask!0 mask!2458))))

(assert (=> start!7420 e!30565))

(assert (=> start!7420 true))

(declare-datatypes ((V!2475 0))(
  ( (V!2476 (val!1067 Int)) )
))
(declare-datatypes ((ValueCell!739 0))(
  ( (ValueCellFull!739 (v!2128 V!2475)) (EmptyCell!739) )
))
(declare-datatypes ((array!3177 0))(
  ( (array!3178 (arr!1523 (Array (_ BitVec 32) ValueCell!739)) (size!1745 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3177)

(declare-fun e!30567 () Bool)

(declare-fun array_inv!920 (array!3177) Bool)

(assert (=> start!7420 (and (array_inv!920 _values!1550) e!30567)))

(declare-datatypes ((array!3179 0))(
  ( (array!3180 (arr!1524 (Array (_ BitVec 32) (_ BitVec 64))) (size!1746 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3179)

(declare-fun array_inv!921 (array!3179) Bool)

(assert (=> start!7420 (array_inv!921 _keys!1940)))

(declare-fun b!47687 () Bool)

(declare-fun e!30566 () Bool)

(declare-fun mapRes!2129 () Bool)

(assert (=> b!47687 (= e!30567 (and e!30566 mapRes!2129))))

(declare-fun condMapEmpty!2129 () Bool)

(declare-fun mapDefault!2129 () ValueCell!739)

