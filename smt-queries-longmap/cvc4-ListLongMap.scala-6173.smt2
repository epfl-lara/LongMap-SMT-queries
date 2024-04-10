; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79150 () Bool)

(assert start!79150)

(declare-fun b_free!17363 () Bool)

(declare-fun b_next!17363 () Bool)

(assert (=> start!79150 (= b_free!17363 (not b_next!17363))))

(declare-fun tp!60529 () Bool)

(declare-fun b_and!28429 () Bool)

(assert (=> start!79150 (= tp!60529 b_and!28429)))

(declare-fun b!929052 () Bool)

(declare-fun e!521691 () Bool)

(declare-fun e!521694 () Bool)

(assert (=> b!929052 (= e!521691 e!521694)))

(declare-fun res!625616 () Bool)

(assert (=> b!929052 (=> (not res!625616) (not e!521694))))

(declare-datatypes ((V!31459 0))(
  ( (V!31460 (val!9986 Int)) )
))
(declare-datatypes ((tuple2!13052 0))(
  ( (tuple2!13053 (_1!6537 (_ BitVec 64)) (_2!6537 V!31459)) )
))
(declare-datatypes ((List!18849 0))(
  ( (Nil!18846) (Cons!18845 (h!19991 tuple2!13052) (t!26906 List!18849)) )
))
(declare-datatypes ((ListLongMap!11749 0))(
  ( (ListLongMap!11750 (toList!5890 List!18849)) )
))
(declare-fun lt!418996 () ListLongMap!11749)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4945 (ListLongMap!11749 (_ BitVec 64)) Bool)

(assert (=> b!929052 (= res!625616 (contains!4945 lt!418996 k!1099))))

(declare-datatypes ((array!55696 0))(
  ( (array!55697 (arr!26793 (Array (_ BitVec 32) (_ BitVec 64))) (size!27252 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55696)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9454 0))(
  ( (ValueCellFull!9454 (v!12504 V!31459)) (EmptyCell!9454) )
))
(declare-datatypes ((array!55698 0))(
  ( (array!55699 (arr!26794 (Array (_ BitVec 32) ValueCell!9454)) (size!27253 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55698)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31459)

(declare-fun minValue!1173 () V!31459)

(declare-fun getCurrentListMap!3136 (array!55696 array!55698 (_ BitVec 32) (_ BitVec 32) V!31459 V!31459 (_ BitVec 32) Int) ListLongMap!11749)

(assert (=> b!929052 (= lt!418996 (getCurrentListMap!3136 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31563 () Bool)

(declare-fun mapRes!31563 () Bool)

(assert (=> mapIsEmpty!31563 mapRes!31563))

(declare-fun b!929053 () Bool)

(declare-fun e!521690 () Bool)

(declare-fun tp_is_empty!19871 () Bool)

(assert (=> b!929053 (= e!521690 tp_is_empty!19871)))

(declare-fun b!929054 () Bool)

(declare-fun e!521692 () Bool)

(declare-fun e!521695 () Bool)

(assert (=> b!929054 (= e!521692 (and e!521695 mapRes!31563))))

(declare-fun condMapEmpty!31563 () Bool)

(declare-fun mapDefault!31563 () ValueCell!9454)

