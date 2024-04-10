; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77874 () Bool)

(assert start!77874)

(declare-fun b_free!16433 () Bool)

(declare-fun b_next!16433 () Bool)

(assert (=> start!77874 (= b_free!16433 (not b_next!16433))))

(declare-fun tp!57563 () Bool)

(declare-fun b_and!27001 () Bool)

(assert (=> start!77874 (= tp!57563 b_and!27001)))

(declare-fun b!909307 () Bool)

(declare-fun e!509691 () Bool)

(declare-fun e!509688 () Bool)

(declare-fun mapRes!29992 () Bool)

(assert (=> b!909307 (= e!509691 (and e!509688 mapRes!29992))))

(declare-fun condMapEmpty!29992 () Bool)

(declare-datatypes ((V!30099 0))(
  ( (V!30100 (val!9476 Int)) )
))
(declare-datatypes ((ValueCell!8944 0))(
  ( (ValueCellFull!8944 (v!11983 V!30099)) (EmptyCell!8944) )
))
(declare-datatypes ((array!53730 0))(
  ( (array!53731 (arr!25823 (Array (_ BitVec 32) ValueCell!8944)) (size!26282 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53730)

(declare-fun mapDefault!29992 () ValueCell!8944)

