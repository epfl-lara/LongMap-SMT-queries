; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74698 () Bool)

(assert start!74698)

(declare-fun b_free!15347 () Bool)

(declare-fun b_next!15347 () Bool)

(assert (=> start!74698 (= b_free!15347 (not b_next!15347))))

(declare-fun tp!53728 () Bool)

(declare-fun b_and!25313 () Bool)

(assert (=> start!74698 (= tp!53728 b_and!25313)))

(declare-fun b!880646 () Bool)

(declare-fun res!598333 () Bool)

(declare-fun e!490074 () Bool)

(assert (=> b!880646 (=> (not res!598333) (not e!490074))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51308 0))(
  ( (array!51309 (arr!24678 (Array (_ BitVec 32) (_ BitVec 64))) (size!25118 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51308)

(declare-datatypes ((V!28501 0))(
  ( (V!28502 (val!8843 Int)) )
))
(declare-datatypes ((ValueCell!8356 0))(
  ( (ValueCellFull!8356 (v!11291 V!28501)) (EmptyCell!8356) )
))
(declare-datatypes ((array!51310 0))(
  ( (array!51311 (arr!24679 (Array (_ BitVec 32) ValueCell!8356)) (size!25119 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51310)

(assert (=> b!880646 (= res!598333 (and (= (size!25119 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25118 _keys!868) (size!25119 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880647 () Bool)

(declare-fun e!490073 () Bool)

(declare-fun tp_is_empty!17591 () Bool)

(assert (=> b!880647 (= e!490073 tp_is_empty!17591)))

(declare-fun b!880648 () Bool)

(declare-fun res!598334 () Bool)

(assert (=> b!880648 (=> (not res!598334) (not e!490074))))

(declare-datatypes ((List!17519 0))(
  ( (Nil!17516) (Cons!17515 (h!18646 (_ BitVec 64)) (t!24668 List!17519)) )
))
(declare-fun arrayNoDuplicates!0 (array!51308 (_ BitVec 32) List!17519) Bool)

(assert (=> b!880648 (= res!598334 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17516))))

(declare-fun b!880649 () Bool)

(declare-fun e!490070 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880649 (= e!490070 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000))))

(assert (=> b!880649 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17516)))

(declare-datatypes ((Unit!30064 0))(
  ( (Unit!30065) )
))
(declare-fun lt!398236 () Unit!30064)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51308 (_ BitVec 32) (_ BitVec 32)) Unit!30064)

(assert (=> b!880649 (= lt!398236 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880650 () Bool)

(declare-fun e!490072 () Bool)

(declare-fun mapRes!28008 () Bool)

(assert (=> b!880650 (= e!490072 (and e!490073 mapRes!28008))))

(declare-fun condMapEmpty!28008 () Bool)

(declare-fun mapDefault!28008 () ValueCell!8356)

