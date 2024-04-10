; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74504 () Bool)

(assert start!74504)

(declare-fun b_free!15193 () Bool)

(declare-fun b_next!15193 () Bool)

(assert (=> start!74504 (= b_free!15193 (not b_next!15193))))

(declare-fun tp!53260 () Bool)

(declare-fun b_and!25069 () Bool)

(assert (=> start!74504 (= tp!53260 b_and!25069)))

(declare-fun res!596116 () Bool)

(declare-fun e!488483 () Bool)

(assert (=> start!74504 (=> (not res!596116) (not e!488483))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51002 0))(
  ( (array!51003 (arr!24527 (Array (_ BitVec 32) (_ BitVec 64))) (size!24967 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51002)

(assert (=> start!74504 (= res!596116 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24967 _keys!868))))))

(assert (=> start!74504 e!488483))

(declare-fun tp_is_empty!17437 () Bool)

(assert (=> start!74504 tp_is_empty!17437))

(assert (=> start!74504 true))

(assert (=> start!74504 tp!53260))

(declare-fun array_inv!19334 (array!51002) Bool)

(assert (=> start!74504 (array_inv!19334 _keys!868)))

(declare-datatypes ((V!28297 0))(
  ( (V!28298 (val!8766 Int)) )
))
(declare-datatypes ((ValueCell!8279 0))(
  ( (ValueCellFull!8279 (v!11206 V!28297)) (EmptyCell!8279) )
))
(declare-datatypes ((array!51004 0))(
  ( (array!51005 (arr!24528 (Array (_ BitVec 32) ValueCell!8279)) (size!24968 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51004)

(declare-fun e!488481 () Bool)

(declare-fun array_inv!19335 (array!51004) Bool)

(assert (=> start!74504 (and (array_inv!19335 _values!688) e!488481)))

(declare-fun mapNonEmpty!27771 () Bool)

(declare-fun mapRes!27771 () Bool)

(declare-fun tp!53261 () Bool)

(declare-fun e!488484 () Bool)

(assert (=> mapNonEmpty!27771 (= mapRes!27771 (and tp!53261 e!488484))))

(declare-fun mapKey!27771 () (_ BitVec 32))

(declare-fun mapValue!27771 () ValueCell!8279)

(declare-fun mapRest!27771 () (Array (_ BitVec 32) ValueCell!8279))

(assert (=> mapNonEmpty!27771 (= (arr!24528 _values!688) (store mapRest!27771 mapKey!27771 mapValue!27771))))

(declare-fun b!877520 () Bool)

(declare-fun res!596114 () Bool)

(assert (=> b!877520 (=> (not res!596114) (not e!488483))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!877520 (= res!596114 (and (= (select (arr!24527 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!877521 () Bool)

(declare-fun res!596115 () Bool)

(assert (=> b!877521 (=> (not res!596115) (not e!488483))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!877521 (= res!596115 (and (= (size!24968 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24967 _keys!868) (size!24968 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877522 () Bool)

(declare-fun e!488485 () Bool)

(assert (=> b!877522 (= e!488481 (and e!488485 mapRes!27771))))

(declare-fun condMapEmpty!27771 () Bool)

(declare-fun mapDefault!27771 () ValueCell!8279)

