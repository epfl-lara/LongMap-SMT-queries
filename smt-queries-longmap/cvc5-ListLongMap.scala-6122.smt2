; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78840 () Bool)

(assert start!78840)

(declare-fun b_free!17053 () Bool)

(declare-fun b_next!17053 () Bool)

(assert (=> start!78840 (= b_free!17053 (not b_next!17053))))

(declare-fun tp!59599 () Bool)

(declare-fun b_and!27843 () Bool)

(assert (=> start!78840 (= tp!59599 b_and!27843)))

(declare-fun b!920811 () Bool)

(declare-fun e!516774 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!920811 (= e!516774 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920812 () Bool)

(declare-fun res!620955 () Bool)

(declare-fun e!516773 () Bool)

(assert (=> b!920812 (=> (not res!620955) (not e!516773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920812 (= res!620955 (validKeyInArray!0 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!920814 () Bool)

(declare-datatypes ((array!55102 0))(
  ( (array!55103 (arr!26496 (Array (_ BitVec 32) (_ BitVec 64))) (size!26955 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55102)

(declare-fun arrayContainsKey!0 (array!55102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920814 (= e!516774 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!920815 () Bool)

(declare-fun res!620949 () Bool)

(declare-fun e!516778 () Bool)

(assert (=> b!920815 (=> (not res!620949) (not e!516778))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31047 0))(
  ( (V!31048 (val!9831 Int)) )
))
(declare-datatypes ((ValueCell!9299 0))(
  ( (ValueCellFull!9299 (v!12349 V!31047)) (EmptyCell!9299) )
))
(declare-datatypes ((array!55104 0))(
  ( (array!55105 (arr!26497 (Array (_ BitVec 32) ValueCell!9299)) (size!26956 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55104)

(assert (=> b!920815 (= res!620949 (and (= (size!26956 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26955 _keys!1487) (size!26956 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31098 () Bool)

(declare-fun mapRes!31098 () Bool)

(assert (=> mapIsEmpty!31098 mapRes!31098))

(declare-fun b!920816 () Bool)

(declare-fun e!516775 () Bool)

(declare-fun tp_is_empty!19561 () Bool)

(assert (=> b!920816 (= e!516775 tp_is_empty!19561)))

(declare-fun b!920817 () Bool)

(declare-fun e!516781 () Bool)

(declare-fun e!516780 () Bool)

(assert (=> b!920817 (= e!516781 (and e!516780 mapRes!31098))))

(declare-fun condMapEmpty!31098 () Bool)

(declare-fun mapDefault!31098 () ValueCell!9299)

