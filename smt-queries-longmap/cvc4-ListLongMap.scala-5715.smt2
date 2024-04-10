; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74078 () Bool)

(assert start!74078)

(declare-fun mapNonEmpty!27293 () Bool)

(declare-fun mapRes!27293 () Bool)

(declare-fun tp!52474 () Bool)

(declare-fun e!485229 () Bool)

(assert (=> mapNonEmpty!27293 (= mapRes!27293 (and tp!52474 e!485229))))

(declare-datatypes ((V!27885 0))(
  ( (V!27886 (val!8612 Int)) )
))
(declare-datatypes ((ValueCell!8125 0))(
  ( (ValueCellFull!8125 (v!11037 V!27885)) (EmptyCell!8125) )
))
(declare-fun mapRest!27293 () (Array (_ BitVec 32) ValueCell!8125))

(declare-fun mapKey!27293 () (_ BitVec 32))

(declare-fun mapValue!27293 () ValueCell!8125)

(declare-datatypes ((array!50396 0))(
  ( (array!50397 (arr!24229 (Array (_ BitVec 32) ValueCell!8125)) (size!24669 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50396)

(assert (=> mapNonEmpty!27293 (= (arr!24229 _values!688) (store mapRest!27293 mapKey!27293 mapValue!27293))))

(declare-fun b!871487 () Bool)

(declare-fun res!592381 () Bool)

(declare-fun e!485230 () Bool)

(assert (=> b!871487 (=> (not res!592381) (not e!485230))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50398 0))(
  ( (array!50399 (arr!24230 (Array (_ BitVec 32) (_ BitVec 64))) (size!24670 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50398)

(assert (=> b!871487 (= res!592381 (and (= (size!24669 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24670 _keys!868) (size!24669 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27293 () Bool)

(assert (=> mapIsEmpty!27293 mapRes!27293))

(declare-fun b!871488 () Bool)

(declare-fun tp_is_empty!17129 () Bool)

(assert (=> b!871488 (= e!485229 tp_is_empty!17129)))

(declare-fun res!592379 () Bool)

(assert (=> start!74078 (=> (not res!592379) (not e!485230))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74078 (= res!592379 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24670 _keys!868))))))

(assert (=> start!74078 e!485230))

(assert (=> start!74078 true))

(declare-fun array_inv!19132 (array!50398) Bool)

(assert (=> start!74078 (array_inv!19132 _keys!868)))

(declare-fun e!485228 () Bool)

(declare-fun array_inv!19133 (array!50396) Bool)

(assert (=> start!74078 (and (array_inv!19133 _values!688) e!485228)))

(declare-fun b!871489 () Bool)

(declare-fun res!592382 () Bool)

(assert (=> b!871489 (=> (not res!592382) (not e!485230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871489 (= res!592382 (validMask!0 mask!1196))))

(declare-fun b!871490 () Bool)

(declare-fun e!485227 () Bool)

(assert (=> b!871490 (= e!485228 (and e!485227 mapRes!27293))))

(declare-fun condMapEmpty!27293 () Bool)

(declare-fun mapDefault!27293 () ValueCell!8125)

