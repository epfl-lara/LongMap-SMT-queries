; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78628 () Bool)

(assert start!78628)

(declare-fun b_free!16841 () Bool)

(declare-fun b_next!16841 () Bool)

(assert (=> start!78628 (= b_free!16841 (not b_next!16841))))

(declare-fun tp!58963 () Bool)

(declare-fun b_and!27463 () Bool)

(assert (=> start!78628 (= tp!58963 b_and!27463)))

(declare-fun mapNonEmpty!30780 () Bool)

(declare-fun mapRes!30780 () Bool)

(declare-fun tp!58964 () Bool)

(declare-fun e!514558 () Bool)

(assert (=> mapNonEmpty!30780 (= mapRes!30780 (and tp!58964 e!514558))))

(declare-datatypes ((V!30763 0))(
  ( (V!30764 (val!9725 Int)) )
))
(declare-datatypes ((ValueCell!9193 0))(
  ( (ValueCellFull!9193 (v!12243 V!30763)) (EmptyCell!9193) )
))
(declare-fun mapRest!30780 () (Array (_ BitVec 32) ValueCell!9193))

(declare-fun mapKey!30780 () (_ BitVec 32))

(declare-fun mapValue!30780 () ValueCell!9193)

(declare-datatypes ((array!54684 0))(
  ( (array!54685 (arr!26287 (Array (_ BitVec 32) ValueCell!9193)) (size!26746 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54684)

(assert (=> mapNonEmpty!30780 (= (arr!26287 _values!1231) (store mapRest!30780 mapKey!30780 mapValue!30780))))

(declare-fun b!916620 () Bool)

(declare-fun res!617938 () Bool)

(declare-fun e!514557 () Bool)

(assert (=> b!916620 (=> (not res!617938) (not e!514557))))

(declare-datatypes ((array!54686 0))(
  ( (array!54687 (arr!26288 (Array (_ BitVec 32) (_ BitVec 64))) (size!26747 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54686)

(declare-datatypes ((List!18430 0))(
  ( (Nil!18427) (Cons!18426 (h!19572 (_ BitVec 64)) (t!26043 List!18430)) )
))
(declare-fun arrayNoDuplicates!0 (array!54686 (_ BitVec 32) List!18430) Bool)

(assert (=> b!916620 (= res!617938 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18427))))

(declare-fun b!916621 () Bool)

(declare-fun e!514556 () Bool)

(assert (=> b!916621 (= e!514557 e!514556)))

(declare-fun res!617941 () Bool)

(assert (=> b!916621 (=> (not res!617941) (not e!514556))))

(declare-datatypes ((tuple2!12620 0))(
  ( (tuple2!12621 (_1!6321 (_ BitVec 64)) (_2!6321 V!30763)) )
))
(declare-datatypes ((List!18431 0))(
  ( (Nil!18428) (Cons!18427 (h!19573 tuple2!12620) (t!26044 List!18431)) )
))
(declare-datatypes ((ListLongMap!11317 0))(
  ( (ListLongMap!11318 (toList!5674 List!18431)) )
))
(declare-fun lt!411831 () ListLongMap!11317)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4727 (ListLongMap!11317 (_ BitVec 64)) Bool)

(assert (=> b!916621 (= res!617941 (contains!4727 lt!411831 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30763)

(declare-fun minValue!1173 () V!30763)

(declare-fun getCurrentListMap!2934 (array!54686 array!54684 (_ BitVec 32) (_ BitVec 32) V!30763 V!30763 (_ BitVec 32) Int) ListLongMap!11317)

(assert (=> b!916621 (= lt!411831 (getCurrentListMap!2934 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916622 () Bool)

(declare-fun e!514553 () Bool)

(declare-fun e!514554 () Bool)

(assert (=> b!916622 (= e!514553 (and e!514554 mapRes!30780))))

(declare-fun condMapEmpty!30780 () Bool)

(declare-fun mapDefault!30780 () ValueCell!9193)

