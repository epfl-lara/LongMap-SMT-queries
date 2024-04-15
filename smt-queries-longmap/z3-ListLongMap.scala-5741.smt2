; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74256 () Bool)

(assert start!74256)

(declare-fun b_free!15037 () Bool)

(declare-fun b_next!15037 () Bool)

(assert (=> start!74256 (= b_free!15037 (not b_next!15037))))

(declare-fun tp!52787 () Bool)

(declare-fun b_and!24787 () Bool)

(assert (=> start!74256 (= tp!52787 b_and!24787)))

(declare-fun b!873546 () Bool)

(declare-fun res!593661 () Bool)

(declare-fun e!486425 () Bool)

(assert (=> b!873546 (=> (not res!593661) (not e!486425))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873546 (= res!593661 (validMask!0 mask!1196))))

(declare-fun res!593666 () Bool)

(assert (=> start!74256 (=> (not res!593666) (not e!486425))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50675 0))(
  ( (array!50676 (arr!24366 (Array (_ BitVec 32) (_ BitVec 64))) (size!24808 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50675)

(assert (=> start!74256 (= res!593666 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24808 _keys!868))))))

(assert (=> start!74256 e!486425))

(declare-fun tp_is_empty!17281 () Bool)

(assert (=> start!74256 tp_is_empty!17281))

(assert (=> start!74256 true))

(assert (=> start!74256 tp!52787))

(declare-fun array_inv!19278 (array!50675) Bool)

(assert (=> start!74256 (array_inv!19278 _keys!868)))

(declare-datatypes ((V!28089 0))(
  ( (V!28090 (val!8688 Int)) )
))
(declare-datatypes ((ValueCell!8201 0))(
  ( (ValueCellFull!8201 (v!11111 V!28089)) (EmptyCell!8201) )
))
(declare-datatypes ((array!50677 0))(
  ( (array!50678 (arr!24367 (Array (_ BitVec 32) ValueCell!8201)) (size!24809 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50677)

(declare-fun e!486426 () Bool)

(declare-fun array_inv!19279 (array!50677) Bool)

(assert (=> start!74256 (and (array_inv!19279 _values!688) e!486426)))

(declare-fun b!873547 () Bool)

(declare-fun res!593667 () Bool)

(assert (=> b!873547 (=> (not res!593667) (not e!486425))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873547 (= res!593667 (and (= (size!24809 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24808 _keys!868) (size!24809 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27530 () Bool)

(declare-fun mapRes!27530 () Bool)

(declare-fun tp!52786 () Bool)

(declare-fun e!486424 () Bool)

(assert (=> mapNonEmpty!27530 (= mapRes!27530 (and tp!52786 e!486424))))

(declare-fun mapValue!27530 () ValueCell!8201)

(declare-fun mapKey!27530 () (_ BitVec 32))

(declare-fun mapRest!27530 () (Array (_ BitVec 32) ValueCell!8201))

(assert (=> mapNonEmpty!27530 (= (arr!24367 _values!688) (store mapRest!27530 mapKey!27530 mapValue!27530))))

(declare-fun b!873548 () Bool)

(assert (=> b!873548 (= e!486425 false)))

(declare-fun v!557 () V!28089)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11494 0))(
  ( (tuple2!11495 (_1!5758 (_ BitVec 64)) (_2!5758 V!28089)) )
))
(declare-datatypes ((List!17305 0))(
  ( (Nil!17302) (Cons!17301 (h!18432 tuple2!11494) (t!24337 List!17305)) )
))
(declare-datatypes ((ListLongMap!10253 0))(
  ( (ListLongMap!10254 (toList!5142 List!17305)) )
))
(declare-fun lt!395588 () ListLongMap!10253)

(declare-fun minValue!654 () V!28089)

(declare-fun zeroValue!654 () V!28089)

(declare-fun getCurrentListMapNoExtraKeys!3135 (array!50675 array!50677 (_ BitVec 32) (_ BitVec 32) V!28089 V!28089 (_ BitVec 32) Int) ListLongMap!10253)

(assert (=> b!873548 (= lt!395588 (getCurrentListMapNoExtraKeys!3135 _keys!868 (array!50678 (store (arr!24367 _values!688) i!612 (ValueCellFull!8201 v!557)) (size!24809 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395589 () ListLongMap!10253)

(assert (=> b!873548 (= lt!395589 (getCurrentListMapNoExtraKeys!3135 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873549 () Bool)

(declare-fun e!486423 () Bool)

(assert (=> b!873549 (= e!486426 (and e!486423 mapRes!27530))))

(declare-fun condMapEmpty!27530 () Bool)

(declare-fun mapDefault!27530 () ValueCell!8201)

(assert (=> b!873549 (= condMapEmpty!27530 (= (arr!24367 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8201)) mapDefault!27530)))))

(declare-fun b!873550 () Bool)

(assert (=> b!873550 (= e!486424 tp_is_empty!17281)))

(declare-fun mapIsEmpty!27530 () Bool)

(assert (=> mapIsEmpty!27530 mapRes!27530))

(declare-fun b!873551 () Bool)

(declare-fun res!593663 () Bool)

(assert (=> b!873551 (=> (not res!593663) (not e!486425))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873551 (= res!593663 (validKeyInArray!0 k0!854))))

(declare-fun b!873552 () Bool)

(declare-fun res!593668 () Bool)

(assert (=> b!873552 (=> (not res!593668) (not e!486425))))

(declare-datatypes ((List!17306 0))(
  ( (Nil!17303) (Cons!17302 (h!18433 (_ BitVec 64)) (t!24338 List!17306)) )
))
(declare-fun arrayNoDuplicates!0 (array!50675 (_ BitVec 32) List!17306) Bool)

(assert (=> b!873552 (= res!593668 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17303))))

(declare-fun b!873553 () Bool)

(declare-fun res!593665 () Bool)

(assert (=> b!873553 (=> (not res!593665) (not e!486425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50675 (_ BitVec 32)) Bool)

(assert (=> b!873553 (= res!593665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873554 () Bool)

(assert (=> b!873554 (= e!486423 tp_is_empty!17281)))

(declare-fun b!873555 () Bool)

(declare-fun res!593664 () Bool)

(assert (=> b!873555 (=> (not res!593664) (not e!486425))))

(assert (=> b!873555 (= res!593664 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24808 _keys!868))))))

(declare-fun b!873556 () Bool)

(declare-fun res!593662 () Bool)

(assert (=> b!873556 (=> (not res!593662) (not e!486425))))

(assert (=> b!873556 (= res!593662 (and (= (select (arr!24366 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74256 res!593666) b!873546))

(assert (= (and b!873546 res!593661) b!873547))

(assert (= (and b!873547 res!593667) b!873553))

(assert (= (and b!873553 res!593665) b!873552))

(assert (= (and b!873552 res!593668) b!873555))

(assert (= (and b!873555 res!593664) b!873551))

(assert (= (and b!873551 res!593663) b!873556))

(assert (= (and b!873556 res!593662) b!873548))

(assert (= (and b!873549 condMapEmpty!27530) mapIsEmpty!27530))

(assert (= (and b!873549 (not condMapEmpty!27530)) mapNonEmpty!27530))

(get-info :version)

(assert (= (and mapNonEmpty!27530 ((_ is ValueCellFull!8201) mapValue!27530)) b!873550))

(assert (= (and b!873549 ((_ is ValueCellFull!8201) mapDefault!27530)) b!873554))

(assert (= start!74256 b!873549))

(declare-fun m!813413 () Bool)

(assert (=> b!873548 m!813413))

(declare-fun m!813415 () Bool)

(assert (=> b!873548 m!813415))

(declare-fun m!813417 () Bool)

(assert (=> b!873548 m!813417))

(declare-fun m!813419 () Bool)

(assert (=> start!74256 m!813419))

(declare-fun m!813421 () Bool)

(assert (=> start!74256 m!813421))

(declare-fun m!813423 () Bool)

(assert (=> b!873551 m!813423))

(declare-fun m!813425 () Bool)

(assert (=> b!873546 m!813425))

(declare-fun m!813427 () Bool)

(assert (=> b!873553 m!813427))

(declare-fun m!813429 () Bool)

(assert (=> mapNonEmpty!27530 m!813429))

(declare-fun m!813431 () Bool)

(assert (=> b!873552 m!813431))

(declare-fun m!813433 () Bool)

(assert (=> b!873556 m!813433))

(check-sat (not start!74256) (not b!873553) (not b!873551) (not b!873552) (not b!873546) (not b!873548) b_and!24787 tp_is_empty!17281 (not b_next!15037) (not mapNonEmpty!27530))
(check-sat b_and!24787 (not b_next!15037))
