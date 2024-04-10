; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78834 () Bool)

(assert start!78834)

(declare-fun b_free!17047 () Bool)

(declare-fun b_next!17047 () Bool)

(assert (=> start!78834 (= b_free!17047 (not b_next!17047))))

(declare-fun tp!59581 () Bool)

(declare-fun b_and!27831 () Bool)

(assert (=> start!78834 (= tp!59581 b_and!27831)))

(declare-fun b!920643 () Bool)

(declare-fun res!620830 () Bool)

(declare-fun e!516695 () Bool)

(assert (=> b!920643 (=> (not res!620830) (not e!516695))))

(declare-datatypes ((array!55090 0))(
  ( (array!55091 (arr!26490 (Array (_ BitVec 32) (_ BitVec 64))) (size!26949 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55090)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31039 0))(
  ( (V!31040 (val!9828 Int)) )
))
(declare-datatypes ((ValueCell!9296 0))(
  ( (ValueCellFull!9296 (v!12346 V!31039)) (EmptyCell!9296) )
))
(declare-datatypes ((array!55092 0))(
  ( (array!55093 (arr!26491 (Array (_ BitVec 32) ValueCell!9296)) (size!26950 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55092)

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!920643 (= res!620830 (and (= (size!26950 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26949 _keys!1487) (size!26950 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!620839 () Bool)

(assert (=> start!78834 (=> (not res!620839) (not e!516695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78834 (= res!620839 (validMask!0 mask!1881))))

(assert (=> start!78834 e!516695))

(assert (=> start!78834 true))

(declare-fun tp_is_empty!19555 () Bool)

(assert (=> start!78834 tp_is_empty!19555))

(declare-fun e!516697 () Bool)

(declare-fun array_inv!20644 (array!55092) Bool)

(assert (=> start!78834 (and (array_inv!20644 _values!1231) e!516697)))

(assert (=> start!78834 tp!59581))

(declare-fun array_inv!20645 (array!55090) Bool)

(assert (=> start!78834 (array_inv!20645 _keys!1487)))

(declare-fun b!920644 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!516699 () Bool)

(declare-fun arrayContainsKey!0 (array!55090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920644 (= e!516699 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!920645 () Bool)

(declare-fun e!516694 () Bool)

(declare-fun mapRes!31089 () Bool)

(assert (=> b!920645 (= e!516697 (and e!516694 mapRes!31089))))

(declare-fun condMapEmpty!31089 () Bool)

(declare-fun mapDefault!31089 () ValueCell!9296)

