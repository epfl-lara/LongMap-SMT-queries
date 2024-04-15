; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73420 () Bool)

(assert start!73420)

(declare-fun b_free!14353 () Bool)

(declare-fun b_next!14353 () Bool)

(assert (=> start!73420 (= b_free!14353 (not b_next!14353))))

(declare-fun tp!50564 () Bool)

(declare-fun b_and!23683 () Bool)

(assert (=> start!73420 (= tp!50564 b_and!23683)))

(declare-fun b!857239 () Bool)

(declare-fun res!582368 () Bool)

(declare-fun e!477772 () Bool)

(assert (=> b!857239 (=> (not res!582368) (not e!477772))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857239 (= res!582368 (validKeyInArray!0 k0!854))))

(declare-fun b!857240 () Bool)

(declare-fun res!582367 () Bool)

(assert (=> b!857240 (=> (not res!582367) (not e!477772))))

(declare-datatypes ((array!49147 0))(
  ( (array!49148 (arr!23605 (Array (_ BitVec 32) (_ BitVec 64))) (size!24047 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49147)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857240 (= res!582367 (and (= (select (arr!23605 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857241 () Bool)

(declare-fun res!582369 () Bool)

(assert (=> b!857241 (=> (not res!582369) (not e!477772))))

(assert (=> b!857241 (= res!582369 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24047 _keys!868))))))

(declare-fun b!857242 () Bool)

(declare-fun e!477771 () Bool)

(assert (=> b!857242 (= e!477772 e!477771)))

(declare-fun res!582371 () Bool)

(assert (=> b!857242 (=> (not res!582371) (not e!477771))))

(assert (=> b!857242 (= res!582371 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27033 0))(
  ( (V!27034 (val!8292 Int)) )
))
(declare-datatypes ((tuple2!10942 0))(
  ( (tuple2!10943 (_1!5482 (_ BitVec 64)) (_2!5482 V!27033)) )
))
(declare-datatypes ((List!16749 0))(
  ( (Nil!16746) (Cons!16745 (h!17876 tuple2!10942) (t!23381 List!16749)) )
))
(declare-datatypes ((ListLongMap!9701 0))(
  ( (ListLongMap!9702 (toList!4866 List!16749)) )
))
(declare-fun lt!386067 () ListLongMap!9701)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7805 0))(
  ( (ValueCellFull!7805 (v!10711 V!27033)) (EmptyCell!7805) )
))
(declare-datatypes ((array!49149 0))(
  ( (array!49150 (arr!23606 (Array (_ BitVec 32) ValueCell!7805)) (size!24048 (_ BitVec 32))) )
))
(declare-fun lt!386066 () array!49149)

(declare-fun minValue!654 () V!27033)

(declare-fun zeroValue!654 () V!27033)

(declare-fun getCurrentListMapNoExtraKeys!2873 (array!49147 array!49149 (_ BitVec 32) (_ BitVec 32) V!27033 V!27033 (_ BitVec 32) Int) ListLongMap!9701)

(assert (=> b!857242 (= lt!386067 (getCurrentListMapNoExtraKeys!2873 _keys!868 lt!386066 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27033)

(declare-fun _values!688 () array!49149)

(assert (=> b!857242 (= lt!386066 (array!49150 (store (arr!23606 _values!688) i!612 (ValueCellFull!7805 v!557)) (size!24048 _values!688)))))

(declare-fun lt!386068 () ListLongMap!9701)

(assert (=> b!857242 (= lt!386068 (getCurrentListMapNoExtraKeys!2873 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857243 () Bool)

(declare-fun res!582370 () Bool)

(assert (=> b!857243 (=> (not res!582370) (not e!477772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857243 (= res!582370 (validMask!0 mask!1196))))

(declare-fun b!857245 () Bool)

(declare-fun res!582366 () Bool)

(assert (=> b!857245 (=> (not res!582366) (not e!477772))))

(declare-datatypes ((List!16750 0))(
  ( (Nil!16747) (Cons!16746 (h!17877 (_ BitVec 64)) (t!23382 List!16750)) )
))
(declare-fun arrayNoDuplicates!0 (array!49147 (_ BitVec 32) List!16750) Bool)

(assert (=> b!857245 (= res!582366 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16747))))

(declare-fun mapIsEmpty!26333 () Bool)

(declare-fun mapRes!26333 () Bool)

(assert (=> mapIsEmpty!26333 mapRes!26333))

(declare-fun b!857246 () Bool)

(declare-fun e!477774 () Bool)

(declare-fun tp_is_empty!16489 () Bool)

(assert (=> b!857246 (= e!477774 tp_is_empty!16489)))

(declare-fun b!857247 () Bool)

(declare-fun res!582372 () Bool)

(assert (=> b!857247 (=> (not res!582372) (not e!477772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49147 (_ BitVec 32)) Bool)

(assert (=> b!857247 (= res!582372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857248 () Bool)

(declare-fun e!477770 () Bool)

(assert (=> b!857248 (= e!477770 (and e!477774 mapRes!26333))))

(declare-fun condMapEmpty!26333 () Bool)

(declare-fun mapDefault!26333 () ValueCell!7805)

(assert (=> b!857248 (= condMapEmpty!26333 (= (arr!23606 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7805)) mapDefault!26333)))))

(declare-fun b!857249 () Bool)

(declare-fun e!477773 () Bool)

(assert (=> b!857249 (= e!477773 tp_is_empty!16489)))

(declare-fun res!582365 () Bool)

(assert (=> start!73420 (=> (not res!582365) (not e!477772))))

(assert (=> start!73420 (= res!582365 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24047 _keys!868))))))

(assert (=> start!73420 e!477772))

(assert (=> start!73420 tp_is_empty!16489))

(assert (=> start!73420 true))

(assert (=> start!73420 tp!50564))

(declare-fun array_inv!18758 (array!49147) Bool)

(assert (=> start!73420 (array_inv!18758 _keys!868)))

(declare-fun array_inv!18759 (array!49149) Bool)

(assert (=> start!73420 (and (array_inv!18759 _values!688) e!477770)))

(declare-fun b!857244 () Bool)

(declare-fun res!582364 () Bool)

(assert (=> b!857244 (=> (not res!582364) (not e!477772))))

(assert (=> b!857244 (= res!582364 (and (= (size!24048 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24047 _keys!868) (size!24048 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26333 () Bool)

(declare-fun tp!50563 () Bool)

(assert (=> mapNonEmpty!26333 (= mapRes!26333 (and tp!50563 e!477773))))

(declare-fun mapRest!26333 () (Array (_ BitVec 32) ValueCell!7805))

(declare-fun mapValue!26333 () ValueCell!7805)

(declare-fun mapKey!26333 () (_ BitVec 32))

(assert (=> mapNonEmpty!26333 (= (arr!23606 _values!688) (store mapRest!26333 mapKey!26333 mapValue!26333))))

(declare-fun b!857250 () Bool)

(assert (=> b!857250 (= e!477771 (not true))))

(declare-fun +!2242 (ListLongMap!9701 tuple2!10942) ListLongMap!9701)

(assert (=> b!857250 (= (getCurrentListMapNoExtraKeys!2873 _keys!868 lt!386066 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2242 (getCurrentListMapNoExtraKeys!2873 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10943 k0!854 v!557)))))

(declare-datatypes ((Unit!29153 0))(
  ( (Unit!29154) )
))
(declare-fun lt!386069 () Unit!29153)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!439 (array!49147 array!49149 (_ BitVec 32) (_ BitVec 32) V!27033 V!27033 (_ BitVec 32) (_ BitVec 64) V!27033 (_ BitVec 32) Int) Unit!29153)

(assert (=> b!857250 (= lt!386069 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!439 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73420 res!582365) b!857243))

(assert (= (and b!857243 res!582370) b!857244))

(assert (= (and b!857244 res!582364) b!857247))

(assert (= (and b!857247 res!582372) b!857245))

(assert (= (and b!857245 res!582366) b!857241))

(assert (= (and b!857241 res!582369) b!857239))

(assert (= (and b!857239 res!582368) b!857240))

(assert (= (and b!857240 res!582367) b!857242))

(assert (= (and b!857242 res!582371) b!857250))

(assert (= (and b!857248 condMapEmpty!26333) mapIsEmpty!26333))

(assert (= (and b!857248 (not condMapEmpty!26333)) mapNonEmpty!26333))

(get-info :version)

(assert (= (and mapNonEmpty!26333 ((_ is ValueCellFull!7805) mapValue!26333)) b!857249))

(assert (= (and b!857248 ((_ is ValueCellFull!7805) mapDefault!26333)) b!857246))

(assert (= start!73420 b!857248))

(declare-fun m!797493 () Bool)

(assert (=> b!857240 m!797493))

(declare-fun m!797495 () Bool)

(assert (=> b!857245 m!797495))

(declare-fun m!797497 () Bool)

(assert (=> mapNonEmpty!26333 m!797497))

(declare-fun m!797499 () Bool)

(assert (=> b!857239 m!797499))

(declare-fun m!797501 () Bool)

(assert (=> b!857247 m!797501))

(declare-fun m!797503 () Bool)

(assert (=> start!73420 m!797503))

(declare-fun m!797505 () Bool)

(assert (=> start!73420 m!797505))

(declare-fun m!797507 () Bool)

(assert (=> b!857250 m!797507))

(declare-fun m!797509 () Bool)

(assert (=> b!857250 m!797509))

(assert (=> b!857250 m!797509))

(declare-fun m!797511 () Bool)

(assert (=> b!857250 m!797511))

(declare-fun m!797513 () Bool)

(assert (=> b!857250 m!797513))

(declare-fun m!797515 () Bool)

(assert (=> b!857242 m!797515))

(declare-fun m!797517 () Bool)

(assert (=> b!857242 m!797517))

(declare-fun m!797519 () Bool)

(assert (=> b!857242 m!797519))

(declare-fun m!797521 () Bool)

(assert (=> b!857243 m!797521))

(check-sat (not b_next!14353) (not start!73420) (not b!857243) (not b!857245) tp_is_empty!16489 (not mapNonEmpty!26333) b_and!23683 (not b!857242) (not b!857239) (not b!857247) (not b!857250))
(check-sat b_and!23683 (not b_next!14353))
