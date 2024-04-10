; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78838 () Bool)

(assert start!78838)

(declare-fun b_free!17051 () Bool)

(declare-fun b_next!17051 () Bool)

(assert (=> start!78838 (= b_free!17051 (not b_next!17051))))

(declare-fun tp!59594 () Bool)

(declare-fun b_and!27839 () Bool)

(assert (=> start!78838 (= tp!59594 b_and!27839)))

(declare-fun res!620911 () Bool)

(declare-fun e!516751 () Bool)

(assert (=> start!78838 (=> (not res!620911) (not e!516751))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78838 (= res!620911 (validMask!0 mask!1881))))

(assert (=> start!78838 e!516751))

(assert (=> start!78838 true))

(declare-fun tp_is_empty!19559 () Bool)

(assert (=> start!78838 tp_is_empty!19559))

(declare-datatypes ((V!31043 0))(
  ( (V!31044 (val!9830 Int)) )
))
(declare-datatypes ((ValueCell!9298 0))(
  ( (ValueCellFull!9298 (v!12348 V!31043)) (EmptyCell!9298) )
))
(declare-datatypes ((array!55098 0))(
  ( (array!55099 (arr!26494 (Array (_ BitVec 32) ValueCell!9298)) (size!26953 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55098)

(declare-fun e!516748 () Bool)

(declare-fun array_inv!20648 (array!55098) Bool)

(assert (=> start!78838 (and (array_inv!20648 _values!1231) e!516748)))

(assert (=> start!78838 tp!59594))

(declare-datatypes ((array!55100 0))(
  ( (array!55101 (arr!26495 (Array (_ BitVec 32) (_ BitVec 64))) (size!26954 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55100)

(declare-fun array_inv!20649 (array!55100) Bool)

(assert (=> start!78838 (array_inv!20649 _keys!1487)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!516752 () Bool)

(declare-fun b!920755 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!55100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920755 (= e!516752 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!920756 () Bool)

(declare-fun e!516753 () Bool)

(declare-fun mapRes!31095 () Bool)

(assert (=> b!920756 (= e!516748 (and e!516753 mapRes!31095))))

(declare-fun condMapEmpty!31095 () Bool)

(declare-fun mapDefault!31095 () ValueCell!9298)

