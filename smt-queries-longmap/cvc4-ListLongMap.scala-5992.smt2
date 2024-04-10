; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77808 () Bool)

(assert start!77808)

(declare-fun b_free!16367 () Bool)

(declare-fun b_next!16367 () Bool)

(assert (=> start!77808 (= b_free!16367 (not b_next!16367))))

(declare-fun tp!57365 () Bool)

(declare-fun b_and!26891 () Bool)

(assert (=> start!77808 (= tp!57365 b_and!26891)))

(declare-fun b!908186 () Bool)

(declare-fun res!612959 () Bool)

(declare-fun e!509000 () Bool)

(assert (=> b!908186 (=> (not res!612959) (not e!509000))))

(declare-datatypes ((array!53604 0))(
  ( (array!53605 (arr!25760 (Array (_ BitVec 32) (_ BitVec 64))) (size!26219 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53604)

(declare-datatypes ((List!18100 0))(
  ( (Nil!18097) (Cons!18096 (h!19242 (_ BitVec 64)) (t!25639 List!18100)) )
))
(declare-fun arrayNoDuplicates!0 (array!53604 (_ BitVec 32) List!18100) Bool)

(assert (=> b!908186 (= res!612959 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18097))))

(declare-fun res!612956 () Bool)

(assert (=> start!77808 (=> (not res!612956) (not e!509000))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77808 (= res!612956 (validMask!0 mask!1756))))

(assert (=> start!77808 e!509000))

(declare-datatypes ((V!30011 0))(
  ( (V!30012 (val!9443 Int)) )
))
(declare-datatypes ((ValueCell!8911 0))(
  ( (ValueCellFull!8911 (v!11950 V!30011)) (EmptyCell!8911) )
))
(declare-datatypes ((array!53606 0))(
  ( (array!53607 (arr!25761 (Array (_ BitVec 32) ValueCell!8911)) (size!26220 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53606)

(declare-fun e!509001 () Bool)

(declare-fun array_inv!20170 (array!53606) Bool)

(assert (=> start!77808 (and (array_inv!20170 _values!1152) e!509001)))

(assert (=> start!77808 tp!57365))

(assert (=> start!77808 true))

(declare-fun tp_is_empty!18785 () Bool)

(assert (=> start!77808 tp_is_empty!18785))

(declare-fun array_inv!20171 (array!53604) Bool)

(assert (=> start!77808 (array_inv!20171 _keys!1386)))

(declare-fun b!908187 () Bool)

(declare-fun res!612955 () Bool)

(declare-fun e!509002 () Bool)

(assert (=> b!908187 (=> (not res!612955) (not e!509002))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!908187 (= res!612955 (and (= (select (arr!25760 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908188 () Bool)

(declare-fun e!509005 () Bool)

(declare-fun mapRes!29893 () Bool)

(assert (=> b!908188 (= e!509001 (and e!509005 mapRes!29893))))

(declare-fun condMapEmpty!29893 () Bool)

(declare-fun mapDefault!29893 () ValueCell!8911)

