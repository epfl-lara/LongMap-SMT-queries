; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78664 () Bool)

(assert start!78664)

(declare-fun b_free!16877 () Bool)

(declare-fun b_next!16877 () Bool)

(assert (=> start!78664 (= b_free!16877 (not b_next!16877))))

(declare-fun tp!59071 () Bool)

(declare-fun b_and!27499 () Bool)

(assert (=> start!78664 (= tp!59071 b_and!27499)))

(declare-fun b!917106 () Bool)

(declare-fun res!618262 () Bool)

(declare-fun e!514878 () Bool)

(assert (=> b!917106 (=> (not res!618262) (not e!514878))))

(declare-datatypes ((array!54756 0))(
  ( (array!54757 (arr!26323 (Array (_ BitVec 32) (_ BitVec 64))) (size!26782 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54756)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54756 (_ BitVec 32)) Bool)

(assert (=> b!917106 (= res!618262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917107 () Bool)

(declare-fun e!514881 () Bool)

(declare-fun tp_is_empty!19385 () Bool)

(assert (=> b!917107 (= e!514881 tp_is_empty!19385)))

(declare-fun res!618260 () Bool)

(assert (=> start!78664 (=> (not res!618260) (not e!514878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78664 (= res!618260 (validMask!0 mask!1881))))

(assert (=> start!78664 e!514878))

(assert (=> start!78664 true))

(declare-datatypes ((V!30811 0))(
  ( (V!30812 (val!9743 Int)) )
))
(declare-datatypes ((ValueCell!9211 0))(
  ( (ValueCellFull!9211 (v!12261 V!30811)) (EmptyCell!9211) )
))
(declare-datatypes ((array!54758 0))(
  ( (array!54759 (arr!26324 (Array (_ BitVec 32) ValueCell!9211)) (size!26783 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54758)

(declare-fun e!514879 () Bool)

(declare-fun array_inv!20528 (array!54758) Bool)

(assert (=> start!78664 (and (array_inv!20528 _values!1231) e!514879)))

(assert (=> start!78664 tp!59071))

(declare-fun array_inv!20529 (array!54756) Bool)

(assert (=> start!78664 (array_inv!20529 _keys!1487)))

(assert (=> start!78664 tp_is_empty!19385))

(declare-fun b!917108 () Bool)

(declare-fun res!618264 () Bool)

(assert (=> b!917108 (=> (not res!618264) (not e!514878))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917108 (= res!618264 (and (= (size!26783 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26782 _keys!1487) (size!26783 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917109 () Bool)

(declare-fun res!618265 () Bool)

(assert (=> b!917109 (=> (not res!618265) (not e!514878))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917109 (= res!618265 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26782 _keys!1487))))))

(declare-fun mapIsEmpty!30834 () Bool)

(declare-fun mapRes!30834 () Bool)

(assert (=> mapIsEmpty!30834 mapRes!30834))

(declare-fun b!917110 () Bool)

(declare-fun e!514882 () Bool)

(assert (=> b!917110 (= e!514878 e!514882)))

(declare-fun res!618261 () Bool)

(assert (=> b!917110 (=> (not res!618261) (not e!514882))))

(declare-datatypes ((tuple2!12648 0))(
  ( (tuple2!12649 (_1!6335 (_ BitVec 64)) (_2!6335 V!30811)) )
))
(declare-datatypes ((List!18459 0))(
  ( (Nil!18456) (Cons!18455 (h!19601 tuple2!12648) (t!26072 List!18459)) )
))
(declare-datatypes ((ListLongMap!11345 0))(
  ( (ListLongMap!11346 (toList!5688 List!18459)) )
))
(declare-fun lt!411939 () ListLongMap!11345)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4740 (ListLongMap!11345 (_ BitVec 64)) Bool)

(assert (=> b!917110 (= res!618261 (contains!4740 lt!411939 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30811)

(declare-fun minValue!1173 () V!30811)

(declare-fun getCurrentListMap!2947 (array!54756 array!54758 (_ BitVec 32) (_ BitVec 32) V!30811 V!30811 (_ BitVec 32) Int) ListLongMap!11345)

(assert (=> b!917110 (= lt!411939 (getCurrentListMap!2947 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917111 () Bool)

(assert (=> b!917111 (= e!514882 false)))

(declare-fun lt!411940 () V!30811)

(declare-fun apply!543 (ListLongMap!11345 (_ BitVec 64)) V!30811)

(assert (=> b!917111 (= lt!411940 (apply!543 lt!411939 k!1099))))

(declare-fun b!917112 () Bool)

(declare-fun res!618263 () Bool)

(assert (=> b!917112 (=> (not res!618263) (not e!514878))))

(declare-datatypes ((List!18460 0))(
  ( (Nil!18457) (Cons!18456 (h!19602 (_ BitVec 64)) (t!26073 List!18460)) )
))
(declare-fun arrayNoDuplicates!0 (array!54756 (_ BitVec 32) List!18460) Bool)

(assert (=> b!917112 (= res!618263 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18457))))

(declare-fun b!917113 () Bool)

(declare-fun e!514880 () Bool)

(assert (=> b!917113 (= e!514879 (and e!514880 mapRes!30834))))

(declare-fun condMapEmpty!30834 () Bool)

(declare-fun mapDefault!30834 () ValueCell!9211)

