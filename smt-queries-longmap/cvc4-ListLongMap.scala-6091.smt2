; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78658 () Bool)

(assert start!78658)

(declare-fun b_free!16871 () Bool)

(declare-fun b_next!16871 () Bool)

(assert (=> start!78658 (= b_free!16871 (not b_next!16871))))

(declare-fun tp!59054 () Bool)

(declare-fun b_and!27493 () Bool)

(assert (=> start!78658 (= tp!59054 b_and!27493)))

(declare-fun b!917025 () Bool)

(declare-fun res!618207 () Bool)

(declare-fun e!514823 () Bool)

(assert (=> b!917025 (=> (not res!618207) (not e!514823))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54744 0))(
  ( (array!54745 (arr!26317 (Array (_ BitVec 32) (_ BitVec 64))) (size!26776 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54744)

(assert (=> b!917025 (= res!618207 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26776 _keys!1487))))))

(declare-fun b!917026 () Bool)

(declare-fun e!514828 () Bool)

(declare-fun tp_is_empty!19379 () Bool)

(assert (=> b!917026 (= e!514828 tp_is_empty!19379)))

(declare-fun mapIsEmpty!30825 () Bool)

(declare-fun mapRes!30825 () Bool)

(assert (=> mapIsEmpty!30825 mapRes!30825))

(declare-fun b!917027 () Bool)

(declare-fun e!514824 () Bool)

(assert (=> b!917027 (= e!514824 tp_is_empty!19379)))

(declare-fun res!618206 () Bool)

(assert (=> start!78658 (=> (not res!618206) (not e!514823))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78658 (= res!618206 (validMask!0 mask!1881))))

(assert (=> start!78658 e!514823))

(assert (=> start!78658 true))

(declare-datatypes ((V!30803 0))(
  ( (V!30804 (val!9740 Int)) )
))
(declare-datatypes ((ValueCell!9208 0))(
  ( (ValueCellFull!9208 (v!12258 V!30803)) (EmptyCell!9208) )
))
(declare-datatypes ((array!54746 0))(
  ( (array!54747 (arr!26318 (Array (_ BitVec 32) ValueCell!9208)) (size!26777 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54746)

(declare-fun e!514826 () Bool)

(declare-fun array_inv!20522 (array!54746) Bool)

(assert (=> start!78658 (and (array_inv!20522 _values!1231) e!514826)))

(assert (=> start!78658 tp!59054))

(declare-fun array_inv!20523 (array!54744) Bool)

(assert (=> start!78658 (array_inv!20523 _keys!1487)))

(assert (=> start!78658 tp_is_empty!19379))

(declare-fun b!917028 () Bool)

(declare-fun res!618210 () Bool)

(assert (=> b!917028 (=> (not res!618210) (not e!514823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54744 (_ BitVec 32)) Bool)

(assert (=> b!917028 (= res!618210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917029 () Bool)

(assert (=> b!917029 (= e!514826 (and e!514828 mapRes!30825))))

(declare-fun condMapEmpty!30825 () Bool)

(declare-fun mapDefault!30825 () ValueCell!9208)

