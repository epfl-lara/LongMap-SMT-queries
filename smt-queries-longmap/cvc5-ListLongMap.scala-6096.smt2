; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78684 () Bool)

(assert start!78684)

(declare-fun b_free!16897 () Bool)

(declare-fun b_next!16897 () Bool)

(assert (=> start!78684 (= b_free!16897 (not b_next!16897))))

(declare-fun tp!59132 () Bool)

(declare-fun b_and!27531 () Bool)

(assert (=> start!78684 (= tp!59132 b_and!27531)))

(declare-fun res!618524 () Bool)

(declare-fun e!515081 () Bool)

(assert (=> start!78684 (=> (not res!618524) (not e!515081))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78684 (= res!618524 (validMask!0 mask!1881))))

(assert (=> start!78684 e!515081))

(assert (=> start!78684 true))

(declare-fun tp_is_empty!19405 () Bool)

(assert (=> start!78684 tp_is_empty!19405))

(declare-datatypes ((V!30839 0))(
  ( (V!30840 (val!9753 Int)) )
))
(declare-datatypes ((ValueCell!9221 0))(
  ( (ValueCellFull!9221 (v!12271 V!30839)) (EmptyCell!9221) )
))
(declare-datatypes ((array!54796 0))(
  ( (array!54797 (arr!26343 (Array (_ BitVec 32) ValueCell!9221)) (size!26802 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54796)

(declare-fun e!515080 () Bool)

(declare-fun array_inv!20542 (array!54796) Bool)

(assert (=> start!78684 (and (array_inv!20542 _values!1231) e!515080)))

(assert (=> start!78684 tp!59132))

(declare-datatypes ((array!54798 0))(
  ( (array!54799 (arr!26344 (Array (_ BitVec 32) (_ BitVec 64))) (size!26803 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54798)

(declare-fun array_inv!20543 (array!54798) Bool)

(assert (=> start!78684 (array_inv!20543 _keys!1487)))

(declare-fun b!917468 () Bool)

(declare-fun res!618523 () Bool)

(declare-fun e!515079 () Bool)

(assert (=> b!917468 (=> (not res!618523) (not e!515079))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917468 (= res!618523 (validKeyInArray!0 k!1099))))

(declare-fun b!917469 () Bool)

(declare-fun res!618527 () Bool)

(assert (=> b!917469 (=> (not res!618527) (not e!515079))))

(declare-fun v!791 () V!30839)

(declare-datatypes ((tuple2!12668 0))(
  ( (tuple2!12669 (_1!6345 (_ BitVec 64)) (_2!6345 V!30839)) )
))
(declare-datatypes ((List!18478 0))(
  ( (Nil!18475) (Cons!18474 (h!19620 tuple2!12668) (t!26105 List!18478)) )
))
(declare-datatypes ((ListLongMap!11365 0))(
  ( (ListLongMap!11366 (toList!5698 List!18478)) )
))
(declare-fun lt!412021 () ListLongMap!11365)

(declare-fun apply!550 (ListLongMap!11365 (_ BitVec 64)) V!30839)

(assert (=> b!917469 (= res!618527 (= (apply!550 lt!412021 k!1099) v!791))))

(declare-fun b!917470 () Bool)

(declare-fun e!515077 () Bool)

(declare-fun mapRes!30864 () Bool)

(assert (=> b!917470 (= e!515080 (and e!515077 mapRes!30864))))

(declare-fun condMapEmpty!30864 () Bool)

(declare-fun mapDefault!30864 () ValueCell!9221)

