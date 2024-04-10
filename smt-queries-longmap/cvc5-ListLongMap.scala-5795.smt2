; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74734 () Bool)

(assert start!74734)

(declare-fun b_free!15361 () Bool)

(declare-fun b_next!15361 () Bool)

(assert (=> start!74734 (= b_free!15361 (not b_next!15361))))

(declare-fun tp!53774 () Bool)

(declare-fun b_and!25357 () Bool)

(assert (=> start!74734 (= tp!53774 b_and!25357)))

(declare-fun res!598622 () Bool)

(declare-fun e!490326 () Bool)

(assert (=> start!74734 (=> (not res!598622) (not e!490326))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51336 0))(
  ( (array!51337 (arr!24691 (Array (_ BitVec 32) (_ BitVec 64))) (size!25131 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51336)

(assert (=> start!74734 (= res!598622 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25131 _keys!868))))))

(assert (=> start!74734 e!490326))

(declare-fun tp_is_empty!17605 () Bool)

(assert (=> start!74734 tp_is_empty!17605))

(assert (=> start!74734 true))

(assert (=> start!74734 tp!53774))

(declare-fun array_inv!19446 (array!51336) Bool)

(assert (=> start!74734 (array_inv!19446 _keys!868)))

(declare-datatypes ((V!28521 0))(
  ( (V!28522 (val!8850 Int)) )
))
(declare-datatypes ((ValueCell!8363 0))(
  ( (ValueCellFull!8363 (v!11302 V!28521)) (EmptyCell!8363) )
))
(declare-datatypes ((array!51338 0))(
  ( (array!51339 (arr!24692 (Array (_ BitVec 32) ValueCell!8363)) (size!25132 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51338)

(declare-fun e!490330 () Bool)

(declare-fun array_inv!19447 (array!51338) Bool)

(assert (=> start!74734 (and (array_inv!19447 _values!688) e!490330)))

(declare-fun b!881091 () Bool)

(declare-fun e!490328 () Bool)

(assert (=> b!881091 (= e!490328 tp_is_empty!17605)))

(declare-fun b!881092 () Bool)

(declare-fun res!598620 () Bool)

(assert (=> b!881092 (=> (not res!598620) (not e!490326))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!881092 (= res!598620 (and (= (select (arr!24691 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!28032 () Bool)

(declare-fun mapRes!28032 () Bool)

(assert (=> mapIsEmpty!28032 mapRes!28032))

(declare-fun b!881093 () Bool)

(declare-fun e!490331 () Bool)

(assert (=> b!881093 (= e!490331 tp_is_empty!17605)))

(declare-fun e!490329 () Bool)

(declare-fun b!881094 () Bool)

(declare-fun arrayContainsKey!0 (array!51336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881094 (= e!490329 (arrayContainsKey!0 _keys!868 k!854 i!612))))

(declare-fun b!881095 () Bool)

(declare-fun res!598617 () Bool)

(assert (=> b!881095 (=> (not res!598617) (not e!490326))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!881095 (= res!598617 (and (= (size!25132 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25131 _keys!868) (size!25132 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881096 () Bool)

(declare-fun res!598614 () Bool)

(assert (=> b!881096 (=> (not res!598614) (not e!490326))))

(assert (=> b!881096 (= res!598614 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25131 _keys!868))))))

(declare-fun b!881097 () Bool)

(assert (=> b!881097 (= e!490330 (and e!490331 mapRes!28032))))

(declare-fun condMapEmpty!28032 () Bool)

(declare-fun mapDefault!28032 () ValueCell!8363)

