; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74862 () Bool)

(assert start!74862)

(declare-fun b_free!15343 () Bool)

(declare-fun b_next!15343 () Bool)

(assert (=> start!74862 (= b_free!15343 (not b_next!15343))))

(declare-fun tp!53717 () Bool)

(declare-fun b_and!25315 () Bool)

(assert (=> start!74862 (= tp!53717 b_and!25315)))

(declare-fun b!881461 () Bool)

(declare-fun res!598607 () Bool)

(declare-fun e!490603 () Bool)

(assert (=> b!881461 (=> (not res!598607) (not e!490603))))

(declare-datatypes ((array!51335 0))(
  ( (array!51336 (arr!24687 (Array (_ BitVec 32) (_ BitVec 64))) (size!25128 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51335)

(declare-datatypes ((List!17468 0))(
  ( (Nil!17465) (Cons!17464 (h!18601 (_ BitVec 64)) (t!24605 List!17468)) )
))
(declare-fun arrayNoDuplicates!0 (array!51335 (_ BitVec 32) List!17468) Bool)

(assert (=> b!881461 (= res!598607 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17465))))

(declare-fun b!881462 () Bool)

(declare-fun res!598611 () Bool)

(assert (=> b!881462 (=> (not res!598611) (not e!490603))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!881462 (= res!598611 (and (= (select (arr!24687 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!28002 () Bool)

(declare-fun mapRes!28002 () Bool)

(declare-fun tp!53718 () Bool)

(declare-fun e!490607 () Bool)

(assert (=> mapNonEmpty!28002 (= mapRes!28002 (and tp!53718 e!490607))))

(declare-datatypes ((V!28497 0))(
  ( (V!28498 (val!8841 Int)) )
))
(declare-datatypes ((ValueCell!8354 0))(
  ( (ValueCellFull!8354 (v!11289 V!28497)) (EmptyCell!8354) )
))
(declare-fun mapValue!28002 () ValueCell!8354)

(declare-fun mapKey!28002 () (_ BitVec 32))

(declare-fun mapRest!28002 () (Array (_ BitVec 32) ValueCell!8354))

(declare-datatypes ((array!51337 0))(
  ( (array!51338 (arr!24688 (Array (_ BitVec 32) ValueCell!8354)) (size!25129 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51337)

(assert (=> mapNonEmpty!28002 (= (arr!24688 _values!688) (store mapRest!28002 mapKey!28002 mapValue!28002))))

(declare-fun b!881463 () Bool)

(declare-fun res!598613 () Bool)

(assert (=> b!881463 (=> (not res!598613) (not e!490603))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881463 (= res!598613 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28002 () Bool)

(assert (=> mapIsEmpty!28002 mapRes!28002))

(declare-fun b!881464 () Bool)

(declare-fun e!490606 () Bool)

(declare-fun tp_is_empty!17587 () Bool)

(assert (=> b!881464 (= e!490606 tp_is_empty!17587)))

(declare-fun b!881465 () Bool)

(assert (=> b!881465 (= e!490607 tp_is_empty!17587)))

(declare-fun b!881466 () Bool)

(declare-fun e!490602 () Bool)

(assert (=> b!881466 (= e!490602 (and e!490606 mapRes!28002))))

(declare-fun condMapEmpty!28002 () Bool)

(declare-fun mapDefault!28002 () ValueCell!8354)

(assert (=> b!881466 (= condMapEmpty!28002 (= (arr!24688 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8354)) mapDefault!28002)))))

(declare-fun b!881467 () Bool)

(declare-fun e!490605 () Bool)

(declare-fun e!490601 () Bool)

(assert (=> b!881467 (= e!490605 (not e!490601))))

(declare-fun res!598615 () Bool)

(assert (=> b!881467 (=> res!598615 e!490601)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881467 (= res!598615 (not (validKeyInArray!0 (select (arr!24687 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11638 0))(
  ( (tuple2!11639 (_1!5830 (_ BitVec 64)) (_2!5830 V!28497)) )
))
(declare-datatypes ((List!17469 0))(
  ( (Nil!17466) (Cons!17465 (h!18602 tuple2!11638) (t!24606 List!17469)) )
))
(declare-datatypes ((ListLongMap!10409 0))(
  ( (ListLongMap!10410 (toList!5220 List!17469)) )
))
(declare-fun lt!398550 () ListLongMap!10409)

(declare-fun lt!398549 () ListLongMap!10409)

(assert (=> b!881467 (= lt!398550 lt!398549)))

(declare-fun v!557 () V!28497)

(declare-fun lt!398551 () ListLongMap!10409)

(declare-fun +!2535 (ListLongMap!10409 tuple2!11638) ListLongMap!10409)

(assert (=> b!881467 (= lt!398549 (+!2535 lt!398551 (tuple2!11639 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!398552 () array!51337)

(declare-fun minValue!654 () V!28497)

(declare-fun zeroValue!654 () V!28497)

(declare-fun getCurrentListMapNoExtraKeys!3261 (array!51335 array!51337 (_ BitVec 32) (_ BitVec 32) V!28497 V!28497 (_ BitVec 32) Int) ListLongMap!10409)

(assert (=> b!881467 (= lt!398550 (getCurrentListMapNoExtraKeys!3261 _keys!868 lt!398552 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881467 (= lt!398551 (getCurrentListMapNoExtraKeys!3261 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30038 0))(
  ( (Unit!30039) )
))
(declare-fun lt!398548 () Unit!30038)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!701 (array!51335 array!51337 (_ BitVec 32) (_ BitVec 32) V!28497 V!28497 (_ BitVec 32) (_ BitVec 64) V!28497 (_ BitVec 32) Int) Unit!30038)

(assert (=> b!881467 (= lt!398548 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!701 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881468 () Bool)

(declare-fun res!598616 () Bool)

(assert (=> b!881468 (=> (not res!598616) (not e!490603))))

(assert (=> b!881468 (= res!598616 (validKeyInArray!0 k0!854))))

(declare-fun b!881469 () Bool)

(declare-fun res!598610 () Bool)

(assert (=> b!881469 (=> (not res!598610) (not e!490603))))

(assert (=> b!881469 (= res!598610 (and (= (size!25129 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25128 _keys!868) (size!25129 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881471 () Bool)

(declare-fun res!598606 () Bool)

(assert (=> b!881471 (=> (not res!598606) (not e!490603))))

(assert (=> b!881471 (= res!598606 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25128 _keys!868))))))

(declare-fun b!881470 () Bool)

(declare-fun e!490608 () Bool)

(assert (=> b!881470 (= e!490608 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000))))

(assert (=> b!881470 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17465)))

(declare-fun lt!398553 () Unit!30038)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51335 (_ BitVec 32) (_ BitVec 32)) Unit!30038)

(assert (=> b!881470 (= lt!398553 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun res!598612 () Bool)

(assert (=> start!74862 (=> (not res!598612) (not e!490603))))

(assert (=> start!74862 (= res!598612 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25128 _keys!868))))))

(assert (=> start!74862 e!490603))

(assert (=> start!74862 tp_is_empty!17587))

(assert (=> start!74862 true))

(assert (=> start!74862 tp!53717))

(declare-fun array_inv!19486 (array!51335) Bool)

(assert (=> start!74862 (array_inv!19486 _keys!868)))

(declare-fun array_inv!19487 (array!51337) Bool)

(assert (=> start!74862 (and (array_inv!19487 _values!688) e!490602)))

(declare-fun b!881472 () Bool)

(assert (=> b!881472 (= e!490601 e!490608)))

(declare-fun res!598609 () Bool)

(assert (=> b!881472 (=> res!598609 e!490608)))

(assert (=> b!881472 (= res!598609 (not (= (select (arr!24687 _keys!868) from!1053) k0!854)))))

(declare-fun lt!398547 () ListLongMap!10409)

(declare-fun get!13003 (ValueCell!8354 V!28497) V!28497)

(declare-fun dynLambda!1260 (Int (_ BitVec 64)) V!28497)

(assert (=> b!881472 (= lt!398547 (+!2535 lt!398549 (tuple2!11639 (select (arr!24687 _keys!868) from!1053) (get!13003 (select (arr!24688 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881473 () Bool)

(declare-fun res!598608 () Bool)

(assert (=> b!881473 (=> (not res!598608) (not e!490603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51335 (_ BitVec 32)) Bool)

(assert (=> b!881473 (= res!598608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881474 () Bool)

(assert (=> b!881474 (= e!490603 e!490605)))

(declare-fun res!598614 () Bool)

(assert (=> b!881474 (=> (not res!598614) (not e!490605))))

(assert (=> b!881474 (= res!598614 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!881474 (= lt!398547 (getCurrentListMapNoExtraKeys!3261 _keys!868 lt!398552 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!881474 (= lt!398552 (array!51338 (store (arr!24688 _values!688) i!612 (ValueCellFull!8354 v!557)) (size!25129 _values!688)))))

(declare-fun lt!398546 () ListLongMap!10409)

(assert (=> b!881474 (= lt!398546 (getCurrentListMapNoExtraKeys!3261 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74862 res!598612) b!881463))

(assert (= (and b!881463 res!598613) b!881469))

(assert (= (and b!881469 res!598610) b!881473))

(assert (= (and b!881473 res!598608) b!881461))

(assert (= (and b!881461 res!598607) b!881471))

(assert (= (and b!881471 res!598606) b!881468))

(assert (= (and b!881468 res!598616) b!881462))

(assert (= (and b!881462 res!598611) b!881474))

(assert (= (and b!881474 res!598614) b!881467))

(assert (= (and b!881467 (not res!598615)) b!881472))

(assert (= (and b!881472 (not res!598609)) b!881470))

(assert (= (and b!881466 condMapEmpty!28002) mapIsEmpty!28002))

(assert (= (and b!881466 (not condMapEmpty!28002)) mapNonEmpty!28002))

(get-info :version)

(assert (= (and mapNonEmpty!28002 ((_ is ValueCellFull!8354) mapValue!28002)) b!881465))

(assert (= (and b!881466 ((_ is ValueCellFull!8354) mapDefault!28002)) b!881464))

(assert (= start!74862 b!881466))

(declare-fun b_lambda!12465 () Bool)

(assert (=> (not b_lambda!12465) (not b!881472)))

(declare-fun t!24604 () Bool)

(declare-fun tb!4993 () Bool)

(assert (=> (and start!74862 (= defaultEntry!696 defaultEntry!696) t!24604) tb!4993))

(declare-fun result!9619 () Bool)

(assert (=> tb!4993 (= result!9619 tp_is_empty!17587)))

(assert (=> b!881472 t!24604))

(declare-fun b_and!25317 () Bool)

(assert (= b_and!25315 (and (=> t!24604 result!9619) b_and!25317)))

(declare-fun m!821633 () Bool)

(assert (=> start!74862 m!821633))

(declare-fun m!821635 () Bool)

(assert (=> start!74862 m!821635))

(declare-fun m!821637 () Bool)

(assert (=> b!881463 m!821637))

(declare-fun m!821639 () Bool)

(assert (=> b!881474 m!821639))

(declare-fun m!821641 () Bool)

(assert (=> b!881474 m!821641))

(declare-fun m!821643 () Bool)

(assert (=> b!881474 m!821643))

(declare-fun m!821645 () Bool)

(assert (=> b!881467 m!821645))

(declare-fun m!821647 () Bool)

(assert (=> b!881467 m!821647))

(declare-fun m!821649 () Bool)

(assert (=> b!881467 m!821649))

(declare-fun m!821651 () Bool)

(assert (=> b!881467 m!821651))

(declare-fun m!821653 () Bool)

(assert (=> b!881467 m!821653))

(assert (=> b!881467 m!821651))

(declare-fun m!821655 () Bool)

(assert (=> b!881467 m!821655))

(declare-fun m!821657 () Bool)

(assert (=> mapNonEmpty!28002 m!821657))

(declare-fun m!821659 () Bool)

(assert (=> b!881468 m!821659))

(declare-fun m!821661 () Bool)

(assert (=> b!881473 m!821661))

(declare-fun m!821663 () Bool)

(assert (=> b!881461 m!821663))

(declare-fun m!821665 () Bool)

(assert (=> b!881462 m!821665))

(declare-fun m!821667 () Bool)

(assert (=> b!881472 m!821667))

(declare-fun m!821669 () Bool)

(assert (=> b!881472 m!821669))

(declare-fun m!821671 () Bool)

(assert (=> b!881472 m!821671))

(assert (=> b!881472 m!821667))

(declare-fun m!821673 () Bool)

(assert (=> b!881472 m!821673))

(assert (=> b!881472 m!821651))

(assert (=> b!881472 m!821669))

(declare-fun m!821675 () Bool)

(assert (=> b!881470 m!821675))

(declare-fun m!821677 () Bool)

(assert (=> b!881470 m!821677))

(check-sat (not b_next!15343) (not b_lambda!12465) (not b!881467) (not b!881473) tp_is_empty!17587 (not b!881468) (not b!881470) (not b!881461) b_and!25317 (not start!74862) (not b!881474) (not b!881463) (not b!881472) (not mapNonEmpty!28002))
(check-sat b_and!25317 (not b_next!15343))
