; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74128 () Bool)

(assert start!74128)

(declare-fun b!872047 () Bool)

(declare-fun res!592733 () Bool)

(declare-fun e!485559 () Bool)

(assert (=> b!872047 (=> (not res!592733) (not e!485559))))

(declare-datatypes ((array!50468 0))(
  ( (array!50469 (arr!24264 (Array (_ BitVec 32) (_ BitVec 64))) (size!24704 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50468)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50468 (_ BitVec 32)) Bool)

(assert (=> b!872047 (= res!592733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27353 () Bool)

(declare-fun mapRes!27353 () Bool)

(assert (=> mapIsEmpty!27353 mapRes!27353))

(declare-fun mapNonEmpty!27353 () Bool)

(declare-fun tp!52552 () Bool)

(declare-fun e!485556 () Bool)

(assert (=> mapNonEmpty!27353 (= mapRes!27353 (and tp!52552 e!485556))))

(declare-datatypes ((V!27937 0))(
  ( (V!27938 (val!8631 Int)) )
))
(declare-datatypes ((ValueCell!8144 0))(
  ( (ValueCellFull!8144 (v!11056 V!27937)) (EmptyCell!8144) )
))
(declare-fun mapRest!27353 () (Array (_ BitVec 32) ValueCell!8144))

(declare-fun mapKey!27353 () (_ BitVec 32))

(declare-fun mapValue!27353 () ValueCell!8144)

(declare-datatypes ((array!50470 0))(
  ( (array!50471 (arr!24265 (Array (_ BitVec 32) ValueCell!8144)) (size!24705 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50470)

(assert (=> mapNonEmpty!27353 (= (arr!24265 _values!688) (store mapRest!27353 mapKey!27353 mapValue!27353))))

(declare-fun res!592730 () Bool)

(assert (=> start!74128 (=> (not res!592730) (not e!485559))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74128 (= res!592730 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24704 _keys!868))))))

(assert (=> start!74128 e!485559))

(assert (=> start!74128 true))

(declare-fun array_inv!19156 (array!50468) Bool)

(assert (=> start!74128 (array_inv!19156 _keys!868)))

(declare-fun e!485557 () Bool)

(declare-fun array_inv!19157 (array!50470) Bool)

(assert (=> start!74128 (and (array_inv!19157 _values!688) e!485557)))

(declare-fun b!872048 () Bool)

(declare-fun e!485558 () Bool)

(assert (=> b!872048 (= e!485557 (and e!485558 mapRes!27353))))

(declare-fun condMapEmpty!27353 () Bool)

(declare-fun mapDefault!27353 () ValueCell!8144)

