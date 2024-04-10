; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79216 () Bool)

(assert start!79216)

(declare-fun b_free!17429 () Bool)

(declare-fun b_next!17429 () Bool)

(assert (=> start!79216 (= b_free!17429 (not b_next!17429))))

(declare-fun tp!60728 () Bool)

(declare-fun b_and!28495 () Bool)

(assert (=> start!79216 (= tp!60728 b_and!28495)))

(declare-fun b!930094 () Bool)

(declare-fun res!626362 () Bool)

(declare-fun e!522289 () Bool)

(assert (=> b!930094 (=> (not res!626362) (not e!522289))))

(declare-datatypes ((array!55822 0))(
  ( (array!55823 (arr!26856 (Array (_ BitVec 32) (_ BitVec 64))) (size!27315 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55822)

(declare-datatypes ((List!18898 0))(
  ( (Nil!18895) (Cons!18894 (h!20040 (_ BitVec 64)) (t!26955 List!18898)) )
))
(declare-fun arrayNoDuplicates!0 (array!55822 (_ BitVec 32) List!18898) Bool)

(assert (=> b!930094 (= res!626362 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18895))))

(declare-fun res!626365 () Bool)

(assert (=> start!79216 (=> (not res!626365) (not e!522289))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79216 (= res!626365 (validMask!0 mask!1881))))

(assert (=> start!79216 e!522289))

(assert (=> start!79216 true))

(declare-fun tp_is_empty!19937 () Bool)

(assert (=> start!79216 tp_is_empty!19937))

(declare-datatypes ((V!31547 0))(
  ( (V!31548 (val!10019 Int)) )
))
(declare-datatypes ((ValueCell!9487 0))(
  ( (ValueCellFull!9487 (v!12537 V!31547)) (EmptyCell!9487) )
))
(declare-datatypes ((array!55824 0))(
  ( (array!55825 (arr!26857 (Array (_ BitVec 32) ValueCell!9487)) (size!27316 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55824)

(declare-fun e!522288 () Bool)

(declare-fun array_inv!20898 (array!55824) Bool)

(assert (=> start!79216 (and (array_inv!20898 _values!1231) e!522288)))

(assert (=> start!79216 tp!60728))

(declare-fun array_inv!20899 (array!55822) Bool)

(assert (=> start!79216 (array_inv!20899 _keys!1487)))

(declare-fun b!930095 () Bool)

(declare-fun res!626358 () Bool)

(declare-fun e!522286 () Bool)

(assert (=> b!930095 (=> (not res!626358) (not e!522286))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31547)

(declare-datatypes ((tuple2!13106 0))(
  ( (tuple2!13107 (_1!6564 (_ BitVec 64)) (_2!6564 V!31547)) )
))
(declare-datatypes ((List!18899 0))(
  ( (Nil!18896) (Cons!18895 (h!20041 tuple2!13106) (t!26956 List!18899)) )
))
(declare-datatypes ((ListLongMap!11803 0))(
  ( (ListLongMap!11804 (toList!5917 List!18899)) )
))
(declare-fun lt!419184 () ListLongMap!11803)

(declare-fun apply!739 (ListLongMap!11803 (_ BitVec 64)) V!31547)

(assert (=> b!930095 (= res!626358 (= (apply!739 lt!419184 k!1099) v!791))))

(declare-fun b!930096 () Bool)

(declare-fun res!626359 () Bool)

(assert (=> b!930096 (=> (not res!626359) (not e!522289))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930096 (= res!626359 (and (= (size!27316 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27315 _keys!1487) (size!27316 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930097 () Bool)

(declare-fun e!522285 () Bool)

(declare-fun mapRes!31662 () Bool)

(assert (=> b!930097 (= e!522288 (and e!522285 mapRes!31662))))

(declare-fun condMapEmpty!31662 () Bool)

(declare-fun mapDefault!31662 () ValueCell!9487)

