; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74528 () Bool)

(assert start!74528)

(declare-fun b_free!15235 () Bool)

(declare-fun b_next!15235 () Bool)

(assert (=> start!74528 (= b_free!15235 (not b_next!15235))))

(declare-fun tp!53388 () Bool)

(declare-fun b_and!25085 () Bool)

(assert (=> start!74528 (= tp!53388 b_and!25085)))

(declare-fun b!877974 () Bool)

(declare-fun e!488651 () Bool)

(declare-fun tp_is_empty!17479 () Bool)

(assert (=> b!877974 (= e!488651 tp_is_empty!17479)))

(declare-fun b!877975 () Bool)

(declare-fun e!488652 () Bool)

(declare-fun mapRes!27834 () Bool)

(assert (=> b!877975 (= e!488652 (and e!488651 mapRes!27834))))

(declare-fun condMapEmpty!27834 () Bool)

(declare-datatypes ((V!28353 0))(
  ( (V!28354 (val!8787 Int)) )
))
(declare-datatypes ((ValueCell!8300 0))(
  ( (ValueCellFull!8300 (v!11221 V!28353)) (EmptyCell!8300) )
))
(declare-datatypes ((array!51065 0))(
  ( (array!51066 (arr!24559 (Array (_ BitVec 32) ValueCell!8300)) (size!25001 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51065)

(declare-fun mapDefault!27834 () ValueCell!8300)

(assert (=> b!877975 (= condMapEmpty!27834 (= (arr!24559 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8300)) mapDefault!27834)))))

(declare-fun b!877976 () Bool)

(declare-fun res!596508 () Bool)

(declare-fun e!488648 () Bool)

(assert (=> b!877976 (=> (not res!596508) (not e!488648))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877976 (= res!596508 (validKeyInArray!0 k0!854))))

(declare-fun b!877977 () Bool)

(declare-fun res!596507 () Bool)

(assert (=> b!877977 (=> (not res!596507) (not e!488648))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51067 0))(
  ( (array!51068 (arr!24560 (Array (_ BitVec 32) (_ BitVec 64))) (size!25002 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51067)

(assert (=> b!877977 (= res!596507 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25002 _keys!868))))))

(declare-fun res!596512 () Bool)

(assert (=> start!74528 (=> (not res!596512) (not e!488648))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74528 (= res!596512 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25002 _keys!868))))))

(assert (=> start!74528 e!488648))

(assert (=> start!74528 tp_is_empty!17479))

(assert (=> start!74528 true))

(assert (=> start!74528 tp!53388))

(declare-fun array_inv!19398 (array!51067) Bool)

(assert (=> start!74528 (array_inv!19398 _keys!868)))

(declare-fun array_inv!19399 (array!51065) Bool)

(assert (=> start!74528 (and (array_inv!19399 _values!688) e!488652)))

(declare-fun b!877978 () Bool)

(declare-fun res!596509 () Bool)

(assert (=> b!877978 (=> (not res!596509) (not e!488648))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51067 (_ BitVec 32)) Bool)

(assert (=> b!877978 (= res!596509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877979 () Bool)

(declare-fun res!596510 () Bool)

(assert (=> b!877979 (=> (not res!596510) (not e!488648))))

(assert (=> b!877979 (= res!596510 (and (= (select (arr!24560 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877980 () Bool)

(declare-fun e!488650 () Bool)

(assert (=> b!877980 (= e!488650 tp_is_empty!17479)))

(declare-fun b!877981 () Bool)

(assert (=> b!877981 (= e!488648 false)))

(declare-fun v!557 () V!28353)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11636 0))(
  ( (tuple2!11637 (_1!5829 (_ BitVec 64)) (_2!5829 V!28353)) )
))
(declare-datatypes ((List!17437 0))(
  ( (Nil!17434) (Cons!17433 (h!18564 tuple2!11636) (t!24517 List!17437)) )
))
(declare-datatypes ((ListLongMap!10395 0))(
  ( (ListLongMap!10396 (toList!5213 List!17437)) )
))
(declare-fun lt!396978 () ListLongMap!10395)

(declare-fun minValue!654 () V!28353)

(declare-fun zeroValue!654 () V!28353)

(declare-fun getCurrentListMapNoExtraKeys!3206 (array!51067 array!51065 (_ BitVec 32) (_ BitVec 32) V!28353 V!28353 (_ BitVec 32) Int) ListLongMap!10395)

(assert (=> b!877981 (= lt!396978 (getCurrentListMapNoExtraKeys!3206 _keys!868 (array!51066 (store (arr!24559 _values!688) i!612 (ValueCellFull!8300 v!557)) (size!25001 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396979 () ListLongMap!10395)

(assert (=> b!877981 (= lt!396979 (getCurrentListMapNoExtraKeys!3206 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27834 () Bool)

(declare-fun tp!53387 () Bool)

(assert (=> mapNonEmpty!27834 (= mapRes!27834 (and tp!53387 e!488650))))

(declare-fun mapKey!27834 () (_ BitVec 32))

(declare-fun mapValue!27834 () ValueCell!8300)

(declare-fun mapRest!27834 () (Array (_ BitVec 32) ValueCell!8300))

(assert (=> mapNonEmpty!27834 (= (arr!24559 _values!688) (store mapRest!27834 mapKey!27834 mapValue!27834))))

(declare-fun b!877982 () Bool)

(declare-fun res!596514 () Bool)

(assert (=> b!877982 (=> (not res!596514) (not e!488648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877982 (= res!596514 (validMask!0 mask!1196))))

(declare-fun b!877983 () Bool)

(declare-fun res!596511 () Bool)

(assert (=> b!877983 (=> (not res!596511) (not e!488648))))

(assert (=> b!877983 (= res!596511 (and (= (size!25001 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25002 _keys!868) (size!25001 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27834 () Bool)

(assert (=> mapIsEmpty!27834 mapRes!27834))

(declare-fun b!877984 () Bool)

(declare-fun res!596513 () Bool)

(assert (=> b!877984 (=> (not res!596513) (not e!488648))))

(declare-datatypes ((List!17438 0))(
  ( (Nil!17435) (Cons!17434 (h!18565 (_ BitVec 64)) (t!24518 List!17438)) )
))
(declare-fun arrayNoDuplicates!0 (array!51067 (_ BitVec 32) List!17438) Bool)

(assert (=> b!877984 (= res!596513 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17435))))

(assert (= (and start!74528 res!596512) b!877982))

(assert (= (and b!877982 res!596514) b!877983))

(assert (= (and b!877983 res!596511) b!877978))

(assert (= (and b!877978 res!596509) b!877984))

(assert (= (and b!877984 res!596513) b!877977))

(assert (= (and b!877977 res!596507) b!877976))

(assert (= (and b!877976 res!596508) b!877979))

(assert (= (and b!877979 res!596510) b!877981))

(assert (= (and b!877975 condMapEmpty!27834) mapIsEmpty!27834))

(assert (= (and b!877975 (not condMapEmpty!27834)) mapNonEmpty!27834))

(get-info :version)

(assert (= (and mapNonEmpty!27834 ((_ is ValueCellFull!8300) mapValue!27834)) b!877980))

(assert (= (and b!877975 ((_ is ValueCellFull!8300) mapDefault!27834)) b!877974))

(assert (= start!74528 b!877975))

(declare-fun m!817401 () Bool)

(assert (=> b!877982 m!817401))

(declare-fun m!817403 () Bool)

(assert (=> b!877978 m!817403))

(declare-fun m!817405 () Bool)

(assert (=> b!877984 m!817405))

(declare-fun m!817407 () Bool)

(assert (=> b!877976 m!817407))

(declare-fun m!817409 () Bool)

(assert (=> start!74528 m!817409))

(declare-fun m!817411 () Bool)

(assert (=> start!74528 m!817411))

(declare-fun m!817413 () Bool)

(assert (=> b!877979 m!817413))

(declare-fun m!817415 () Bool)

(assert (=> mapNonEmpty!27834 m!817415))

(declare-fun m!817417 () Bool)

(assert (=> b!877981 m!817417))

(declare-fun m!817419 () Bool)

(assert (=> b!877981 m!817419))

(declare-fun m!817421 () Bool)

(assert (=> b!877981 m!817421))

(check-sat (not b!877978) tp_is_empty!17479 (not mapNonEmpty!27834) (not b_next!15235) (not b!877982) (not b!877981) b_and!25085 (not b!877984) (not b!877976) (not start!74528))
(check-sat b_and!25085 (not b_next!15235))
