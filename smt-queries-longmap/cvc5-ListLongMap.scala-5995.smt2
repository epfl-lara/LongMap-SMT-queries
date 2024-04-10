; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77822 () Bool)

(assert start!77822)

(declare-fun b_free!16381 () Bool)

(declare-fun b_next!16381 () Bool)

(assert (=> start!77822 (= b_free!16381 (not b_next!16381))))

(declare-fun tp!57407 () Bool)

(declare-fun b_and!26919 () Bool)

(assert (=> start!77822 (= tp!57407 b_and!26919)))

(declare-fun b!908473 () Bool)

(declare-fun res!613173 () Bool)

(declare-fun e!509172 () Bool)

(assert (=> b!908473 (=> (not res!613173) (not e!509172))))

(declare-datatypes ((array!53632 0))(
  ( (array!53633 (arr!25774 (Array (_ BitVec 32) (_ BitVec 64))) (size!26233 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53632)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53632 (_ BitVec 32)) Bool)

(assert (=> b!908473 (= res!613173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908474 () Bool)

(declare-fun e!509173 () Bool)

(declare-fun tp_is_empty!18799 () Bool)

(assert (=> b!908474 (= e!509173 tp_is_empty!18799)))

(declare-fun b!908475 () Bool)

(declare-fun e!509171 () Bool)

(assert (=> b!908475 (= e!509171 tp_is_empty!18799)))

(declare-fun b!908476 () Bool)

(declare-fun res!613171 () Bool)

(declare-fun e!509170 () Bool)

(assert (=> b!908476 (=> (not res!613171) (not e!509170))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!908476 (= res!613171 (and (= (select (arr!25774 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29914 () Bool)

(declare-fun mapRes!29914 () Bool)

(declare-fun tp!57408 () Bool)

(assert (=> mapNonEmpty!29914 (= mapRes!29914 (and tp!57408 e!509173))))

(declare-datatypes ((V!30031 0))(
  ( (V!30032 (val!9450 Int)) )
))
(declare-datatypes ((ValueCell!8918 0))(
  ( (ValueCellFull!8918 (v!11957 V!30031)) (EmptyCell!8918) )
))
(declare-datatypes ((array!53634 0))(
  ( (array!53635 (arr!25775 (Array (_ BitVec 32) ValueCell!8918)) (size!26234 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53634)

(declare-fun mapValue!29914 () ValueCell!8918)

(declare-fun mapKey!29914 () (_ BitVec 32))

(declare-fun mapRest!29914 () (Array (_ BitVec 32) ValueCell!8918))

(assert (=> mapNonEmpty!29914 (= (arr!25775 _values!1152) (store mapRest!29914 mapKey!29914 mapValue!29914))))

(declare-fun b!908477 () Bool)

(declare-fun res!613167 () Bool)

(assert (=> b!908477 (=> (not res!613167) (not e!509170))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908477 (= res!613167 (inRange!0 i!717 mask!1756))))

(declare-fun b!908478 () Bool)

(declare-fun e!509175 () Bool)

(assert (=> b!908478 (= e!509175 true)))

(declare-datatypes ((tuple2!12314 0))(
  ( (tuple2!12315 (_1!6168 (_ BitVec 64)) (_2!6168 V!30031)) )
))
(declare-datatypes ((List!18110 0))(
  ( (Nil!18107) (Cons!18106 (h!19252 tuple2!12314) (t!25663 List!18110)) )
))
(declare-datatypes ((ListLongMap!11011 0))(
  ( (ListLongMap!11012 (toList!5521 List!18110)) )
))
(declare-fun lt!409728 () ListLongMap!11011)

(declare-fun lt!409727 () V!30031)

(declare-fun apply!502 (ListLongMap!11011 (_ BitVec 64)) V!30031)

(assert (=> b!908478 (= (apply!502 lt!409728 k!1033) lt!409727)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30834 0))(
  ( (Unit!30835) )
))
(declare-fun lt!409730 () Unit!30834)

(declare-fun zeroValue!1094 () V!30031)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30031)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!54 (array!53632 array!53634 (_ BitVec 32) (_ BitVec 32) V!30031 V!30031 (_ BitVec 64) V!30031 (_ BitVec 32) Int) Unit!30834)

(assert (=> b!908478 (= lt!409730 (lemmaListMapApplyFromThenApplyFromZero!54 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409727 i!717 defaultEntry!1160))))

(declare-fun b!908479 () Bool)

(assert (=> b!908479 (= e!509172 e!509170)))

(declare-fun res!613164 () Bool)

(assert (=> b!908479 (=> (not res!613164) (not e!509170))))

(declare-fun contains!4564 (ListLongMap!11011 (_ BitVec 64)) Bool)

(assert (=> b!908479 (= res!613164 (contains!4564 lt!409728 k!1033))))

(declare-fun getCurrentListMap!2784 (array!53632 array!53634 (_ BitVec 32) (_ BitVec 32) V!30031 V!30031 (_ BitVec 32) Int) ListLongMap!11011)

(assert (=> b!908479 (= lt!409728 (getCurrentListMap!2784 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908480 () Bool)

(declare-fun e!509174 () Bool)

(assert (=> b!908480 (= e!509174 e!509175)))

(declare-fun res!613170 () Bool)

(assert (=> b!908480 (=> res!613170 e!509175)))

(declare-fun lt!409726 () ListLongMap!11011)

(assert (=> b!908480 (= res!613170 (not (contains!4564 lt!409726 k!1033)))))

(assert (=> b!908480 (= lt!409726 (getCurrentListMap!2784 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908481 () Bool)

(declare-fun e!509168 () Bool)

(assert (=> b!908481 (= e!509168 (and e!509171 mapRes!29914))))

(declare-fun condMapEmpty!29914 () Bool)

(declare-fun mapDefault!29914 () ValueCell!8918)

