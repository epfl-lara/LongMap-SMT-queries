; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74242 () Bool)

(assert start!74242)

(declare-fun b_free!15019 () Bool)

(declare-fun b_next!15019 () Bool)

(assert (=> start!74242 (= b_free!15019 (not b_next!15019))))

(declare-fun tp!52728 () Bool)

(declare-fun b_and!24787 () Bool)

(assert (=> start!74242 (= tp!52728 b_and!24787)))

(declare-fun b!873403 () Bool)

(declare-fun res!593528 () Bool)

(declare-fun e!486383 () Bool)

(assert (=> b!873403 (=> (not res!593528) (not e!486383))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873403 (= res!593528 (validKeyInArray!0 k!854))))

(declare-fun b!873404 () Bool)

(declare-fun res!593526 () Bool)

(assert (=> b!873404 (=> (not res!593526) (not e!486383))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873404 (= res!593526 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27500 () Bool)

(declare-fun mapRes!27500 () Bool)

(declare-fun tp!52729 () Bool)

(declare-fun e!486381 () Bool)

(assert (=> mapNonEmpty!27500 (= mapRes!27500 (and tp!52729 e!486381))))

(declare-datatypes ((V!28065 0))(
  ( (V!28066 (val!8679 Int)) )
))
(declare-datatypes ((ValueCell!8192 0))(
  ( (ValueCellFull!8192 (v!11108 V!28065)) (EmptyCell!8192) )
))
(declare-fun mapValue!27500 () ValueCell!8192)

(declare-fun mapKey!27500 () (_ BitVec 32))

(declare-fun mapRest!27500 () (Array (_ BitVec 32) ValueCell!8192))

(declare-datatypes ((array!50652 0))(
  ( (array!50653 (arr!24355 (Array (_ BitVec 32) ValueCell!8192)) (size!24795 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50652)

(assert (=> mapNonEmpty!27500 (= (arr!24355 _values!688) (store mapRest!27500 mapKey!27500 mapValue!27500))))

(declare-fun v!557 () V!28065)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun b!873405 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50654 0))(
  ( (array!50655 (arr!24356 (Array (_ BitVec 32) (_ BitVec 64))) (size!24796 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50654)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28065)

(declare-fun zeroValue!654 () V!28065)

(declare-datatypes ((tuple2!11472 0))(
  ( (tuple2!11473 (_1!5747 (_ BitVec 64)) (_2!5747 V!28065)) )
))
(declare-datatypes ((List!17289 0))(
  ( (Nil!17286) (Cons!17285 (h!18416 tuple2!11472) (t!24328 List!17289)) )
))
(declare-datatypes ((ListLongMap!10241 0))(
  ( (ListLongMap!10242 (toList!5136 List!17289)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3103 (array!50654 array!50652 (_ BitVec 32) (_ BitVec 32) V!28065 V!28065 (_ BitVec 32) Int) ListLongMap!10241)

(assert (=> b!873405 (= e!486383 (not (= (getCurrentListMapNoExtraKeys!3103 _keys!868 (array!50653 (store (arr!24355 _values!688) i!612 (ValueCellFull!8192 v!557)) (size!24795 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3103 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(declare-fun b!873406 () Bool)

(declare-fun res!593530 () Bool)

(assert (=> b!873406 (=> (not res!593530) (not e!486383))))

(assert (=> b!873406 (= res!593530 (and (= (size!24795 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24796 _keys!868) (size!24795 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873407 () Bool)

(declare-fun res!593531 () Bool)

(assert (=> b!873407 (=> (not res!593531) (not e!486383))))

(assert (=> b!873407 (= res!593531 (and (= (select (arr!24356 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24796 _keys!868))))))

(declare-fun res!593525 () Bool)

(assert (=> start!74242 (=> (not res!593525) (not e!486383))))

(assert (=> start!74242 (= res!593525 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24796 _keys!868))))))

(assert (=> start!74242 e!486383))

(declare-fun tp_is_empty!17263 () Bool)

(assert (=> start!74242 tp_is_empty!17263))

(assert (=> start!74242 true))

(assert (=> start!74242 tp!52728))

(declare-fun array_inv!19214 (array!50654) Bool)

(assert (=> start!74242 (array_inv!19214 _keys!868)))

(declare-fun e!486384 () Bool)

(declare-fun array_inv!19215 (array!50652) Bool)

(assert (=> start!74242 (and (array_inv!19215 _values!688) e!486384)))

(declare-fun b!873408 () Bool)

(declare-fun res!593527 () Bool)

(assert (=> b!873408 (=> (not res!593527) (not e!486383))))

(assert (=> b!873408 (= res!593527 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24796 _keys!868))))))

(declare-fun b!873409 () Bool)

(assert (=> b!873409 (= e!486381 tp_is_empty!17263)))

(declare-fun mapIsEmpty!27500 () Bool)

(assert (=> mapIsEmpty!27500 mapRes!27500))

(declare-fun b!873410 () Bool)

(declare-fun res!593529 () Bool)

(assert (=> b!873410 (=> (not res!593529) (not e!486383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50654 (_ BitVec 32)) Bool)

(assert (=> b!873410 (= res!593529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873411 () Bool)

(declare-fun res!593524 () Bool)

(assert (=> b!873411 (=> (not res!593524) (not e!486383))))

(declare-datatypes ((List!17290 0))(
  ( (Nil!17287) (Cons!17286 (h!18417 (_ BitVec 64)) (t!24329 List!17290)) )
))
(declare-fun arrayNoDuplicates!0 (array!50654 (_ BitVec 32) List!17290) Bool)

(assert (=> b!873411 (= res!593524 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17287))))

(declare-fun b!873412 () Bool)

(declare-fun e!486382 () Bool)

(assert (=> b!873412 (= e!486382 tp_is_empty!17263)))

(declare-fun b!873413 () Bool)

(assert (=> b!873413 (= e!486384 (and e!486382 mapRes!27500))))

(declare-fun condMapEmpty!27500 () Bool)

(declare-fun mapDefault!27500 () ValueCell!8192)

