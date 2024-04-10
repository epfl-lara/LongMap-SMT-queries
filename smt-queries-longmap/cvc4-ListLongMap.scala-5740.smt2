; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74272 () Bool)

(assert start!74272)

(declare-fun b_free!15035 () Bool)

(declare-fun b_next!15035 () Bool)

(assert (=> start!74272 (= b_free!15035 (not b_next!15035))))

(declare-fun tp!52780 () Bool)

(declare-fun b_and!24811 () Bool)

(assert (=> start!74272 (= tp!52780 b_and!24811)))

(declare-fun res!593750 () Bool)

(declare-fun e!486556 () Bool)

(assert (=> start!74272 (=> (not res!593750) (not e!486556))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50686 0))(
  ( (array!50687 (arr!24371 (Array (_ BitVec 32) (_ BitVec 64))) (size!24811 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50686)

(assert (=> start!74272 (= res!593750 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24811 _keys!868))))))

(assert (=> start!74272 e!486556))

(declare-fun tp_is_empty!17279 () Bool)

(assert (=> start!74272 tp_is_empty!17279))

(assert (=> start!74272 true))

(assert (=> start!74272 tp!52780))

(declare-fun array_inv!19226 (array!50686) Bool)

(assert (=> start!74272 (array_inv!19226 _keys!868)))

(declare-datatypes ((V!28085 0))(
  ( (V!28086 (val!8687 Int)) )
))
(declare-datatypes ((ValueCell!8200 0))(
  ( (ValueCellFull!8200 (v!11116 V!28085)) (EmptyCell!8200) )
))
(declare-datatypes ((array!50688 0))(
  ( (array!50689 (arr!24372 (Array (_ BitVec 32) ValueCell!8200)) (size!24812 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50688)

(declare-fun e!486558 () Bool)

(declare-fun array_inv!19227 (array!50688) Bool)

(assert (=> start!74272 (and (array_inv!19227 _values!688) e!486558)))

(declare-fun b!873752 () Bool)

(declare-fun res!593754 () Bool)

(assert (=> b!873752 (=> (not res!593754) (not e!486556))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!873752 (= res!593754 (and (= (size!24812 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24811 _keys!868) (size!24812 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873753 () Bool)

(declare-fun res!593751 () Bool)

(assert (=> b!873753 (=> (not res!593751) (not e!486556))))

(declare-datatypes ((List!17299 0))(
  ( (Nil!17296) (Cons!17295 (h!18426 (_ BitVec 64)) (t!24340 List!17299)) )
))
(declare-fun arrayNoDuplicates!0 (array!50686 (_ BitVec 32) List!17299) Bool)

(assert (=> b!873753 (= res!593751 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17296))))

(declare-fun mapIsEmpty!27527 () Bool)

(declare-fun mapRes!27527 () Bool)

(assert (=> mapIsEmpty!27527 mapRes!27527))

(declare-fun mapNonEmpty!27527 () Bool)

(declare-fun tp!52779 () Bool)

(declare-fun e!486557 () Bool)

(assert (=> mapNonEmpty!27527 (= mapRes!27527 (and tp!52779 e!486557))))

(declare-fun mapRest!27527 () (Array (_ BitVec 32) ValueCell!8200))

(declare-fun mapValue!27527 () ValueCell!8200)

(declare-fun mapKey!27527 () (_ BitVec 32))

(assert (=> mapNonEmpty!27527 (= (arr!24372 _values!688) (store mapRest!27527 mapKey!27527 mapValue!27527))))

(declare-fun b!873754 () Bool)

(declare-fun res!593749 () Bool)

(assert (=> b!873754 (=> (not res!593749) (not e!486556))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873754 (= res!593749 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24811 _keys!868))))))

(declare-fun b!873755 () Bool)

(declare-fun e!486560 () Bool)

(assert (=> b!873755 (= e!486558 (and e!486560 mapRes!27527))))

(declare-fun condMapEmpty!27527 () Bool)

(declare-fun mapDefault!27527 () ValueCell!8200)

