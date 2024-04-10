; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78044 () Bool)

(assert start!78044)

(declare-fun b_free!16571 () Bool)

(declare-fun b_next!16571 () Bool)

(assert (=> start!78044 (= b_free!16571 (not b_next!16571))))

(declare-fun tp!57983 () Bool)

(declare-fun b_and!27143 () Bool)

(assert (=> start!78044 (= tp!57983 b_and!27143)))

(declare-fun b!911010 () Bool)

(declare-fun res!614688 () Bool)

(declare-fun e!510869 () Bool)

(assert (=> b!911010 (=> (not res!614688) (not e!510869))))

(declare-datatypes ((V!30283 0))(
  ( (V!30284 (val!9545 Int)) )
))
(declare-datatypes ((ValueCell!9013 0))(
  ( (ValueCellFull!9013 (v!12054 V!30283)) (EmptyCell!9013) )
))
(declare-datatypes ((array!53984 0))(
  ( (array!53985 (arr!25948 (Array (_ BitVec 32) ValueCell!9013)) (size!26407 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53984)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53986 0))(
  ( (array!53987 (arr!25949 (Array (_ BitVec 32) (_ BitVec 64))) (size!26408 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53986)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911010 (= res!614688 (and (= (size!26407 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26408 _keys!1386) (size!26407 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911011 () Bool)

(declare-fun e!510870 () Bool)

(declare-fun e!510867 () Bool)

(declare-fun mapRes!30205 () Bool)

(assert (=> b!911011 (= e!510870 (and e!510867 mapRes!30205))))

(declare-fun condMapEmpty!30205 () Bool)

(declare-fun mapDefault!30205 () ValueCell!9013)

