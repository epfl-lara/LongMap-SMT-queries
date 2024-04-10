; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78162 () Bool)

(assert start!78162)

(declare-fun b_free!16673 () Bool)

(declare-fun b_next!16673 () Bool)

(assert (=> start!78162 (= b_free!16673 (not b_next!16673))))

(declare-fun tp!58293 () Bool)

(declare-fun b_and!27247 () Bool)

(assert (=> start!78162 (= tp!58293 b_and!27247)))

(declare-fun b!912232 () Bool)

(declare-fun res!615387 () Bool)

(declare-fun e!511705 () Bool)

(assert (=> b!912232 (=> (not res!615387) (not e!511705))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54176 0))(
  ( (array!54177 (arr!26043 (Array (_ BitVec 32) (_ BitVec 64))) (size!26502 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54176)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!912232 (= res!615387 (and (= (select (arr!26043 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912233 () Bool)

(declare-fun res!615392 () Bool)

(assert (=> b!912233 (=> (not res!615392) (not e!511705))))

(declare-datatypes ((V!30419 0))(
  ( (V!30420 (val!9596 Int)) )
))
(declare-datatypes ((ValueCell!9064 0))(
  ( (ValueCellFull!9064 (v!12106 V!30419)) (EmptyCell!9064) )
))
(declare-datatypes ((array!54178 0))(
  ( (array!54179 (arr!26044 (Array (_ BitVec 32) ValueCell!9064)) (size!26503 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54178)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!912233 (= res!615392 (and (= (size!26503 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26502 _keys!1386) (size!26503 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912234 () Bool)

(declare-fun e!511706 () Bool)

(declare-fun tp_is_empty!19091 () Bool)

(assert (=> b!912234 (= e!511706 tp_is_empty!19091)))

(declare-fun b!912235 () Bool)

(declare-fun e!511707 () Bool)

(declare-fun mapRes!30361 () Bool)

(assert (=> b!912235 (= e!511707 (and e!511706 mapRes!30361))))

(declare-fun condMapEmpty!30361 () Bool)

(declare-fun mapDefault!30361 () ValueCell!9064)

