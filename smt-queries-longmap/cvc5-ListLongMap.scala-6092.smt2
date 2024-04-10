; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78660 () Bool)

(assert start!78660)

(declare-fun b_free!16873 () Bool)

(declare-fun b_next!16873 () Bool)

(assert (=> start!78660 (= b_free!16873 (not b_next!16873))))

(declare-fun tp!59059 () Bool)

(declare-fun b_and!27495 () Bool)

(assert (=> start!78660 (= tp!59059 b_and!27495)))

(declare-fun b!917052 () Bool)

(declare-fun e!514846 () Bool)

(declare-fun tp_is_empty!19381 () Bool)

(assert (=> b!917052 (= e!514846 tp_is_empty!19381)))

(declare-fun b!917053 () Bool)

(declare-fun res!618229 () Bool)

(declare-fun e!514842 () Bool)

(assert (=> b!917053 (=> (not res!618229) (not e!514842))))

(declare-datatypes ((array!54748 0))(
  ( (array!54749 (arr!26319 (Array (_ BitVec 32) (_ BitVec 64))) (size!26778 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54748)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54748 (_ BitVec 32)) Bool)

(assert (=> b!917053 (= res!618229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917054 () Bool)

(declare-fun res!618228 () Bool)

(assert (=> b!917054 (=> (not res!618228) (not e!514842))))

(declare-datatypes ((List!18455 0))(
  ( (Nil!18452) (Cons!18451 (h!19597 (_ BitVec 64)) (t!26068 List!18455)) )
))
(declare-fun arrayNoDuplicates!0 (array!54748 (_ BitVec 32) List!18455) Bool)

(assert (=> b!917054 (= res!618228 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18452))))

(declare-fun mapIsEmpty!30828 () Bool)

(declare-fun mapRes!30828 () Bool)

(assert (=> mapIsEmpty!30828 mapRes!30828))

(declare-fun b!917055 () Bool)

(declare-fun e!514844 () Bool)

(assert (=> b!917055 (= e!514844 tp_is_empty!19381)))

(declare-fun b!917056 () Bool)

(declare-fun e!514841 () Bool)

(assert (=> b!917056 (= e!514842 e!514841)))

(declare-fun res!618224 () Bool)

(assert (=> b!917056 (=> (not res!618224) (not e!514841))))

(declare-datatypes ((V!30807 0))(
  ( (V!30808 (val!9741 Int)) )
))
(declare-datatypes ((tuple2!12644 0))(
  ( (tuple2!12645 (_1!6333 (_ BitVec 64)) (_2!6333 V!30807)) )
))
(declare-datatypes ((List!18456 0))(
  ( (Nil!18453) (Cons!18452 (h!19598 tuple2!12644) (t!26069 List!18456)) )
))
(declare-datatypes ((ListLongMap!11341 0))(
  ( (ListLongMap!11342 (toList!5686 List!18456)) )
))
(declare-fun lt!411927 () ListLongMap!11341)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4738 (ListLongMap!11341 (_ BitVec 64)) Bool)

(assert (=> b!917056 (= res!618224 (contains!4738 lt!411927 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9209 0))(
  ( (ValueCellFull!9209 (v!12259 V!30807)) (EmptyCell!9209) )
))
(declare-datatypes ((array!54750 0))(
  ( (array!54751 (arr!26320 (Array (_ BitVec 32) ValueCell!9209)) (size!26779 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54750)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30807)

(declare-fun minValue!1173 () V!30807)

(declare-fun getCurrentListMap!2945 (array!54748 array!54750 (_ BitVec 32) (_ BitVec 32) V!30807 V!30807 (_ BitVec 32) Int) ListLongMap!11341)

(assert (=> b!917056 (= lt!411927 (getCurrentListMap!2945 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30828 () Bool)

(declare-fun tp!59060 () Bool)

(assert (=> mapNonEmpty!30828 (= mapRes!30828 (and tp!59060 e!514844))))

(declare-fun mapKey!30828 () (_ BitVec 32))

(declare-fun mapValue!30828 () ValueCell!9209)

(declare-fun mapRest!30828 () (Array (_ BitVec 32) ValueCell!9209))

(assert (=> mapNonEmpty!30828 (= (arr!26320 _values!1231) (store mapRest!30828 mapKey!30828 mapValue!30828))))

(declare-fun res!618226 () Bool)

(assert (=> start!78660 (=> (not res!618226) (not e!514842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78660 (= res!618226 (validMask!0 mask!1881))))

(assert (=> start!78660 e!514842))

(assert (=> start!78660 true))

(declare-fun e!514845 () Bool)

(declare-fun array_inv!20524 (array!54750) Bool)

(assert (=> start!78660 (and (array_inv!20524 _values!1231) e!514845)))

(assert (=> start!78660 tp!59059))

(declare-fun array_inv!20525 (array!54748) Bool)

(assert (=> start!78660 (array_inv!20525 _keys!1487)))

(assert (=> start!78660 tp_is_empty!19381))

(declare-fun b!917057 () Bool)

(declare-fun res!618227 () Bool)

(assert (=> b!917057 (=> (not res!618227) (not e!514842))))

(assert (=> b!917057 (= res!618227 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26778 _keys!1487))))))

(declare-fun b!917058 () Bool)

(assert (=> b!917058 (= e!514841 false)))

(declare-fun lt!411928 () V!30807)

(declare-fun apply!541 (ListLongMap!11341 (_ BitVec 64)) V!30807)

(assert (=> b!917058 (= lt!411928 (apply!541 lt!411927 k!1099))))

(declare-fun b!917059 () Bool)

(assert (=> b!917059 (= e!514845 (and e!514846 mapRes!30828))))

(declare-fun condMapEmpty!30828 () Bool)

(declare-fun mapDefault!30828 () ValueCell!9209)

