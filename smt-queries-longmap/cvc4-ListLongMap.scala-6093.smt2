; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78670 () Bool)

(assert start!78670)

(declare-fun b_free!16883 () Bool)

(declare-fun b_next!16883 () Bool)

(assert (=> start!78670 (= b_free!16883 (not b_next!16883))))

(declare-fun tp!59090 () Bool)

(declare-fun b_and!27505 () Bool)

(assert (=> start!78670 (= tp!59090 b_and!27505)))

(declare-fun b!917187 () Bool)

(declare-fun e!514936 () Bool)

(assert (=> b!917187 (= e!514936 false)))

(declare-datatypes ((V!30819 0))(
  ( (V!30820 (val!9746 Int)) )
))
(declare-fun lt!411957 () V!30819)

(declare-datatypes ((tuple2!12654 0))(
  ( (tuple2!12655 (_1!6338 (_ BitVec 64)) (_2!6338 V!30819)) )
))
(declare-datatypes ((List!18465 0))(
  ( (Nil!18462) (Cons!18461 (h!19607 tuple2!12654) (t!26078 List!18465)) )
))
(declare-datatypes ((ListLongMap!11351 0))(
  ( (ListLongMap!11352 (toList!5691 List!18465)) )
))
(declare-fun lt!411958 () ListLongMap!11351)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!546 (ListLongMap!11351 (_ BitVec 64)) V!30819)

(assert (=> b!917187 (= lt!411957 (apply!546 lt!411958 k!1099))))

(declare-fun b!917188 () Bool)

(declare-fun e!514934 () Bool)

(assert (=> b!917188 (= e!514934 e!514936)))

(declare-fun res!618319 () Bool)

(assert (=> b!917188 (=> (not res!618319) (not e!514936))))

(declare-fun contains!4743 (ListLongMap!11351 (_ BitVec 64)) Bool)

(assert (=> b!917188 (= res!618319 (contains!4743 lt!411958 k!1099))))

(declare-datatypes ((array!54768 0))(
  ( (array!54769 (arr!26329 (Array (_ BitVec 32) (_ BitVec 64))) (size!26788 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54768)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9214 0))(
  ( (ValueCellFull!9214 (v!12264 V!30819)) (EmptyCell!9214) )
))
(declare-datatypes ((array!54770 0))(
  ( (array!54771 (arr!26330 (Array (_ BitVec 32) ValueCell!9214)) (size!26789 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54770)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30819)

(declare-fun minValue!1173 () V!30819)

(declare-fun getCurrentListMap!2950 (array!54768 array!54770 (_ BitVec 32) (_ BitVec 32) V!30819 V!30819 (_ BitVec 32) Int) ListLongMap!11351)

(assert (=> b!917188 (= lt!411958 (getCurrentListMap!2950 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917189 () Bool)

(declare-fun e!514931 () Bool)

(declare-fun tp_is_empty!19391 () Bool)

(assert (=> b!917189 (= e!514931 tp_is_empty!19391)))

(declare-fun b!917190 () Bool)

(declare-fun e!514933 () Bool)

(declare-fun mapRes!30843 () Bool)

(assert (=> b!917190 (= e!514933 (and e!514931 mapRes!30843))))

(declare-fun condMapEmpty!30843 () Bool)

(declare-fun mapDefault!30843 () ValueCell!9214)

