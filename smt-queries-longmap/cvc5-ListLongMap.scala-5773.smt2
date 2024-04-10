; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74540 () Bool)

(assert start!74540)

(declare-fun b_free!15229 () Bool)

(declare-fun b_next!15229 () Bool)

(assert (=> start!74540 (= b_free!15229 (not b_next!15229))))

(declare-fun tp!53369 () Bool)

(declare-fun b_and!25105 () Bool)

(assert (=> start!74540 (= tp!53369 b_and!25105)))

(declare-fun b!878114 () Bool)

(declare-fun e!488752 () Bool)

(declare-fun tp_is_empty!17473 () Bool)

(assert (=> b!878114 (= e!488752 tp_is_empty!17473)))

(declare-fun res!596547 () Bool)

(declare-fun e!488753 () Bool)

(assert (=> start!74540 (=> (not res!596547) (not e!488753))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51072 0))(
  ( (array!51073 (arr!24562 (Array (_ BitVec 32) (_ BitVec 64))) (size!25002 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51072)

(assert (=> start!74540 (= res!596547 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25002 _keys!868))))))

(assert (=> start!74540 e!488753))

(assert (=> start!74540 tp_is_empty!17473))

(assert (=> start!74540 true))

(assert (=> start!74540 tp!53369))

(declare-fun array_inv!19358 (array!51072) Bool)

(assert (=> start!74540 (array_inv!19358 _keys!868)))

(declare-datatypes ((V!28345 0))(
  ( (V!28346 (val!8784 Int)) )
))
(declare-datatypes ((ValueCell!8297 0))(
  ( (ValueCellFull!8297 (v!11224 V!28345)) (EmptyCell!8297) )
))
(declare-datatypes ((array!51074 0))(
  ( (array!51075 (arr!24563 (Array (_ BitVec 32) ValueCell!8297)) (size!25003 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51074)

(declare-fun e!488755 () Bool)

(declare-fun array_inv!19359 (array!51074) Bool)

(assert (=> start!74540 (and (array_inv!19359 _values!688) e!488755)))

(declare-fun b!878115 () Bool)

(declare-fun res!596548 () Bool)

(assert (=> b!878115 (=> (not res!596548) (not e!488753))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878115 (= res!596548 (validKeyInArray!0 k!854))))

(declare-fun b!878116 () Bool)

(declare-fun res!596551 () Bool)

(assert (=> b!878116 (=> (not res!596551) (not e!488753))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878116 (= res!596551 (and (= (select (arr!24562 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878117 () Bool)

(declare-fun e!488751 () Bool)

(assert (=> b!878117 (= e!488751 tp_is_empty!17473)))

(declare-fun b!878118 () Bool)

(declare-fun res!596549 () Bool)

(assert (=> b!878118 (=> (not res!596549) (not e!488753))))

(declare-datatypes ((List!17429 0))(
  ( (Nil!17426) (Cons!17425 (h!18556 (_ BitVec 64)) (t!24518 List!17429)) )
))
(declare-fun arrayNoDuplicates!0 (array!51072 (_ BitVec 32) List!17429) Bool)

(assert (=> b!878118 (= res!596549 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17426))))

(declare-fun b!878119 () Bool)

(declare-fun res!596552 () Bool)

(assert (=> b!878119 (=> (not res!596552) (not e!488753))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51072 (_ BitVec 32)) Bool)

(assert (=> b!878119 (= res!596552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878120 () Bool)

(declare-fun res!596545 () Bool)

(assert (=> b!878120 (=> (not res!596545) (not e!488753))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878120 (= res!596545 (and (= (size!25003 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25002 _keys!868) (size!25003 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878121 () Bool)

(declare-fun mapRes!27825 () Bool)

(assert (=> b!878121 (= e!488755 (and e!488751 mapRes!27825))))

(declare-fun condMapEmpty!27825 () Bool)

(declare-fun mapDefault!27825 () ValueCell!8297)

