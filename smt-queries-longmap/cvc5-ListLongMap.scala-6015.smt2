; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77958 () Bool)

(assert start!77958)

(declare-fun b_free!16501 () Bool)

(declare-fun b_next!16501 () Bool)

(assert (=> start!77958 (= b_free!16501 (not b_next!16501))))

(declare-fun tp!57771 () Bool)

(declare-fun b_and!27071 () Bool)

(assert (=> start!77958 (= tp!57771 b_and!27071)))

(declare-fun res!614208 () Bool)

(declare-fun e!510272 () Bool)

(assert (=> start!77958 (=> (not res!614208) (not e!510272))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77958 (= res!614208 (validMask!0 mask!1756))))

(assert (=> start!77958 e!510272))

(declare-datatypes ((V!30191 0))(
  ( (V!30192 (val!9510 Int)) )
))
(declare-datatypes ((ValueCell!8978 0))(
  ( (ValueCellFull!8978 (v!12018 V!30191)) (EmptyCell!8978) )
))
(declare-datatypes ((array!53858 0))(
  ( (array!53859 (arr!25886 (Array (_ BitVec 32) ValueCell!8978)) (size!26345 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53858)

(declare-fun e!510273 () Bool)

(declare-fun array_inv!20248 (array!53858) Bool)

(assert (=> start!77958 (and (array_inv!20248 _values!1152) e!510273)))

(assert (=> start!77958 tp!57771))

(assert (=> start!77958 true))

(declare-fun tp_is_empty!18919 () Bool)

(assert (=> start!77958 tp_is_empty!18919))

(declare-datatypes ((array!53860 0))(
  ( (array!53861 (arr!25887 (Array (_ BitVec 32) (_ BitVec 64))) (size!26346 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53860)

(declare-fun array_inv!20249 (array!53860) Bool)

(assert (=> start!77958 (array_inv!20249 _keys!1386)))

(declare-fun b!910148 () Bool)

(declare-fun res!614207 () Bool)

(assert (=> b!910148 (=> (not res!614207) (not e!510272))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910148 (= res!614207 (and (= (size!26345 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26346 _keys!1386) (size!26345 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910149 () Bool)

(declare-fun e!510269 () Bool)

(declare-fun mapRes!30097 () Bool)

(assert (=> b!910149 (= e!510273 (and e!510269 mapRes!30097))))

(declare-fun condMapEmpty!30097 () Bool)

(declare-fun mapDefault!30097 () ValueCell!8978)

