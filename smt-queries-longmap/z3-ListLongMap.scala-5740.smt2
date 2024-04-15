; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74250 () Bool)

(assert start!74250)

(declare-fun b_free!15031 () Bool)

(declare-fun b_next!15031 () Bool)

(assert (=> start!74250 (= b_free!15031 (not b_next!15031))))

(declare-fun tp!52769 () Bool)

(declare-fun b_and!24781 () Bool)

(assert (=> start!74250 (= tp!52769 b_and!24781)))

(declare-fun b!873447 () Bool)

(declare-fun e!486380 () Bool)

(declare-fun tp_is_empty!17275 () Bool)

(assert (=> b!873447 (= e!486380 tp_is_empty!17275)))

(declare-fun b!873448 () Bool)

(declare-fun e!486378 () Bool)

(assert (=> b!873448 (= e!486378 tp_is_empty!17275)))

(declare-fun b!873449 () Bool)

(declare-fun res!593593 () Bool)

(declare-fun e!486381 () Bool)

(assert (=> b!873449 (=> (not res!593593) (not e!486381))))

(declare-datatypes ((array!50663 0))(
  ( (array!50664 (arr!24360 (Array (_ BitVec 32) (_ BitVec 64))) (size!24802 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50663)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50663 (_ BitVec 32)) Bool)

(assert (=> b!873449 (= res!593593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27521 () Bool)

(declare-fun mapRes!27521 () Bool)

(declare-fun tp!52768 () Bool)

(assert (=> mapNonEmpty!27521 (= mapRes!27521 (and tp!52768 e!486378))))

(declare-datatypes ((V!28081 0))(
  ( (V!28082 (val!8685 Int)) )
))
(declare-datatypes ((ValueCell!8198 0))(
  ( (ValueCellFull!8198 (v!11108 V!28081)) (EmptyCell!8198) )
))
(declare-datatypes ((array!50665 0))(
  ( (array!50666 (arr!24361 (Array (_ BitVec 32) ValueCell!8198)) (size!24803 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50665)

(declare-fun mapKey!27521 () (_ BitVec 32))

(declare-fun mapRest!27521 () (Array (_ BitVec 32) ValueCell!8198))

(declare-fun mapValue!27521 () ValueCell!8198)

(assert (=> mapNonEmpty!27521 (= (arr!24361 _values!688) (store mapRest!27521 mapKey!27521 mapValue!27521))))

(declare-fun b!873450 () Bool)

(declare-fun e!486382 () Bool)

(assert (=> b!873450 (= e!486382 (and e!486380 mapRes!27521))))

(declare-fun condMapEmpty!27521 () Bool)

(declare-fun mapDefault!27521 () ValueCell!8198)

(assert (=> b!873450 (= condMapEmpty!27521 (= (arr!24361 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8198)) mapDefault!27521)))))

(declare-fun b!873451 () Bool)

(declare-fun res!593591 () Bool)

(assert (=> b!873451 (=> (not res!593591) (not e!486381))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873451 (= res!593591 (and (= (size!24803 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24802 _keys!868) (size!24803 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873452 () Bool)

(declare-fun res!593589 () Bool)

(assert (=> b!873452 (=> (not res!593589) (not e!486381))))

(declare-datatypes ((List!17303 0))(
  ( (Nil!17300) (Cons!17299 (h!18430 (_ BitVec 64)) (t!24335 List!17303)) )
))
(declare-fun arrayNoDuplicates!0 (array!50663 (_ BitVec 32) List!17303) Bool)

(assert (=> b!873452 (= res!593589 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17300))))

(declare-fun b!873453 () Bool)

(declare-fun res!593592 () Bool)

(assert (=> b!873453 (=> (not res!593592) (not e!486381))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873453 (= res!593592 (validKeyInArray!0 k0!854))))

(declare-fun b!873454 () Bool)

(declare-fun res!593594 () Bool)

(assert (=> b!873454 (=> (not res!593594) (not e!486381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873454 (= res!593594 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27521 () Bool)

(assert (=> mapIsEmpty!27521 mapRes!27521))

(declare-fun res!593590 () Bool)

(assert (=> start!74250 (=> (not res!593590) (not e!486381))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74250 (= res!593590 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24802 _keys!868))))))

(assert (=> start!74250 e!486381))

(assert (=> start!74250 tp_is_empty!17275))

(assert (=> start!74250 true))

(assert (=> start!74250 tp!52769))

(declare-fun array_inv!19276 (array!50663) Bool)

(assert (=> start!74250 (array_inv!19276 _keys!868)))

(declare-fun array_inv!19277 (array!50665) Bool)

(assert (=> start!74250 (and (array_inv!19277 _values!688) e!486382)))

(declare-fun b!873455 () Bool)

(declare-fun res!593596 () Bool)

(assert (=> b!873455 (=> (not res!593596) (not e!486381))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873455 (= res!593596 (and (= (select (arr!24360 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!873456 () Bool)

(assert (=> b!873456 (= e!486381 (and (= from!1053 i!612) (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24802 _keys!868)))))))

(declare-fun v!557 () V!28081)

(declare-fun minValue!654 () V!28081)

(declare-fun zeroValue!654 () V!28081)

(declare-datatypes ((tuple2!11492 0))(
  ( (tuple2!11493 (_1!5757 (_ BitVec 64)) (_2!5757 V!28081)) )
))
(declare-datatypes ((List!17304 0))(
  ( (Nil!17301) (Cons!17300 (h!18431 tuple2!11492) (t!24336 List!17304)) )
))
(declare-datatypes ((ListLongMap!10251 0))(
  ( (ListLongMap!10252 (toList!5141 List!17304)) )
))
(declare-fun lt!395570 () ListLongMap!10251)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3134 (array!50663 array!50665 (_ BitVec 32) (_ BitVec 32) V!28081 V!28081 (_ BitVec 32) Int) ListLongMap!10251)

(assert (=> b!873456 (= lt!395570 (getCurrentListMapNoExtraKeys!3134 _keys!868 (array!50666 (store (arr!24361 _values!688) i!612 (ValueCellFull!8198 v!557)) (size!24803 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395571 () ListLongMap!10251)

(assert (=> b!873456 (= lt!395571 (getCurrentListMapNoExtraKeys!3134 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873457 () Bool)

(declare-fun res!593595 () Bool)

(assert (=> b!873457 (=> (not res!593595) (not e!486381))))

(assert (=> b!873457 (= res!593595 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24802 _keys!868))))))

(assert (= (and start!74250 res!593590) b!873454))

(assert (= (and b!873454 res!593594) b!873451))

(assert (= (and b!873451 res!593591) b!873449))

(assert (= (and b!873449 res!593593) b!873452))

(assert (= (and b!873452 res!593589) b!873457))

(assert (= (and b!873457 res!593595) b!873453))

(assert (= (and b!873453 res!593592) b!873455))

(assert (= (and b!873455 res!593596) b!873456))

(assert (= (and b!873450 condMapEmpty!27521) mapIsEmpty!27521))

(assert (= (and b!873450 (not condMapEmpty!27521)) mapNonEmpty!27521))

(get-info :version)

(assert (= (and mapNonEmpty!27521 ((_ is ValueCellFull!8198) mapValue!27521)) b!873448))

(assert (= (and b!873450 ((_ is ValueCellFull!8198) mapDefault!27521)) b!873447))

(assert (= start!74250 b!873450))

(declare-fun m!813347 () Bool)

(assert (=> b!873453 m!813347))

(declare-fun m!813349 () Bool)

(assert (=> b!873452 m!813349))

(declare-fun m!813351 () Bool)

(assert (=> start!74250 m!813351))

(declare-fun m!813353 () Bool)

(assert (=> start!74250 m!813353))

(declare-fun m!813355 () Bool)

(assert (=> b!873456 m!813355))

(declare-fun m!813357 () Bool)

(assert (=> b!873456 m!813357))

(declare-fun m!813359 () Bool)

(assert (=> b!873456 m!813359))

(declare-fun m!813361 () Bool)

(assert (=> b!873449 m!813361))

(declare-fun m!813363 () Bool)

(assert (=> b!873454 m!813363))

(declare-fun m!813365 () Bool)

(assert (=> b!873455 m!813365))

(declare-fun m!813367 () Bool)

(assert (=> mapNonEmpty!27521 m!813367))

(check-sat (not mapNonEmpty!27521) (not b!873453) (not start!74250) b_and!24781 (not b!873454) (not b!873452) (not b!873456) (not b!873449) (not b_next!15031) tp_is_empty!17275)
(check-sat b_and!24781 (not b_next!15031))
