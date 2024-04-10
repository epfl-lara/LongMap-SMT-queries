; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78110 () Bool)

(assert start!78110)

(declare-fun b_free!16621 () Bool)

(declare-fun b_next!16621 () Bool)

(assert (=> start!78110 (= b_free!16621 (not b_next!16621))))

(declare-fun tp!58137 () Bool)

(declare-fun b_and!27195 () Bool)

(assert (=> start!78110 (= tp!58137 b_and!27195)))

(declare-fun mapIsEmpty!30283 () Bool)

(declare-fun mapRes!30283 () Bool)

(assert (=> mapIsEmpty!30283 mapRes!30283))

(declare-fun b!911662 () Bool)

(declare-fun res!615052 () Bool)

(declare-fun e!511316 () Bool)

(assert (=> b!911662 (=> (not res!615052) (not e!511316))))

(declare-datatypes ((V!30351 0))(
  ( (V!30352 (val!9570 Int)) )
))
(declare-datatypes ((ValueCell!9038 0))(
  ( (ValueCellFull!9038 (v!12080 V!30351)) (EmptyCell!9038) )
))
(declare-datatypes ((array!54078 0))(
  ( (array!54079 (arr!25994 (Array (_ BitVec 32) ValueCell!9038)) (size!26453 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54078)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54080 0))(
  ( (array!54081 (arr!25995 (Array (_ BitVec 32) (_ BitVec 64))) (size!26454 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54080)

(assert (=> b!911662 (= res!615052 (and (= (size!26453 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26454 _keys!1386) (size!26453 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615054 () Bool)

(assert (=> start!78110 (=> (not res!615054) (not e!511316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78110 (= res!615054 (validMask!0 mask!1756))))

(assert (=> start!78110 e!511316))

(declare-fun e!511313 () Bool)

(declare-fun array_inv!20318 (array!54078) Bool)

(assert (=> start!78110 (and (array_inv!20318 _values!1152) e!511313)))

(assert (=> start!78110 tp!58137))

(assert (=> start!78110 true))

(declare-fun tp_is_empty!19039 () Bool)

(assert (=> start!78110 tp_is_empty!19039))

(declare-fun array_inv!20319 (array!54080) Bool)

(assert (=> start!78110 (array_inv!20319 _keys!1386)))

(declare-fun b!911663 () Bool)

(declare-fun e!511314 () Bool)

(assert (=> b!911663 (= e!511313 (and e!511314 mapRes!30283))))

(declare-fun condMapEmpty!30283 () Bool)

(declare-fun mapDefault!30283 () ValueCell!9038)

