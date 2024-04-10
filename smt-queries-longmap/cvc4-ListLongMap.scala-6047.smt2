; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78206 () Bool)

(assert start!78206)

(declare-fun b_free!16697 () Bool)

(declare-fun b_next!16697 () Bool)

(assert (=> start!78206 (= b_free!16697 (not b_next!16697))))

(declare-fun tp!58368 () Bool)

(declare-fun b_and!27273 () Bool)

(assert (=> start!78206 (= tp!58368 b_and!27273)))

(declare-fun b!912713 () Bool)

(declare-fun e!511964 () Bool)

(assert (=> b!912713 (= e!511964 (not true))))

(declare-datatypes ((array!54224 0))(
  ( (array!54225 (arr!26066 (Array (_ BitVec 32) (_ BitVec 64))) (size!26525 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54224)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912713 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30451 0))(
  ( (V!30452 (val!9608 Int)) )
))
(declare-datatypes ((ValueCell!9076 0))(
  ( (ValueCellFull!9076 (v!12119 V!30451)) (EmptyCell!9076) )
))
(declare-datatypes ((array!54226 0))(
  ( (array!54227 (arr!26067 (Array (_ BitVec 32) ValueCell!9076)) (size!26526 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54226)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30451)

(declare-datatypes ((Unit!30888 0))(
  ( (Unit!30889) )
))
(declare-fun lt!410696 () Unit!30888)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30451)

(declare-fun lemmaKeyInListMapIsInArray!269 (array!54224 array!54226 (_ BitVec 32) (_ BitVec 32) V!30451 V!30451 (_ BitVec 64) Int) Unit!30888)

(assert (=> b!912713 (= lt!410696 (lemmaKeyInListMapIsInArray!269 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912714 () Bool)

(declare-fun res!615695 () Bool)

(assert (=> b!912714 (=> (not res!615695) (not e!511964))))

(assert (=> b!912714 (= res!615695 (and (= (size!26526 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26525 _keys!1386) (size!26526 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912715 () Bool)

(declare-fun res!615696 () Bool)

(assert (=> b!912715 (=> (not res!615696) (not e!511964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54224 (_ BitVec 32)) Bool)

(assert (=> b!912715 (= res!615696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912716 () Bool)

(declare-fun e!511965 () Bool)

(declare-fun e!511967 () Bool)

(declare-fun mapRes!30400 () Bool)

(assert (=> b!912716 (= e!511965 (and e!511967 mapRes!30400))))

(declare-fun condMapEmpty!30400 () Bool)

(declare-fun mapDefault!30400 () ValueCell!9076)

