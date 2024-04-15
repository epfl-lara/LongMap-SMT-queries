; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74926 () Bool)

(assert start!74926)

(declare-fun b_free!15463 () Bool)

(declare-fun b_next!15463 () Bool)

(assert (=> start!74926 (= b_free!15463 (not b_next!15463))))

(declare-fun tp!54093 () Bool)

(declare-fun b_and!25599 () Bool)

(assert (=> start!74926 (= tp!54093 b_and!25599)))

(declare-fun b!883844 () Bool)

(declare-fun res!600499 () Bool)

(declare-fun e!491856 () Bool)

(assert (=> b!883844 (=> (not res!600499) (not e!491856))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51521 0))(
  ( (array!51522 (arr!24780 (Array (_ BitVec 32) (_ BitVec 64))) (size!25222 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51521)

(declare-datatypes ((V!28657 0))(
  ( (V!28658 (val!8901 Int)) )
))
(declare-datatypes ((ValueCell!8414 0))(
  ( (ValueCellFull!8414 (v!11364 V!28657)) (EmptyCell!8414) )
))
(declare-datatypes ((array!51523 0))(
  ( (array!51524 (arr!24781 (Array (_ BitVec 32) ValueCell!8414)) (size!25223 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51523)

(assert (=> b!883844 (= res!600499 (and (= (size!25223 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25222 _keys!868) (size!25223 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883845 () Bool)

(declare-fun e!491858 () Bool)

(declare-fun e!491850 () Bool)

(declare-fun mapRes!28197 () Bool)

(assert (=> b!883845 (= e!491858 (and e!491850 mapRes!28197))))

(declare-fun condMapEmpty!28197 () Bool)

(declare-fun mapDefault!28197 () ValueCell!8414)

(assert (=> b!883845 (= condMapEmpty!28197 (= (arr!24781 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8414)) mapDefault!28197)))))

(declare-fun b!883846 () Bool)

(declare-fun res!600504 () Bool)

(assert (=> b!883846 (=> (not res!600504) (not e!491856))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883846 (= res!600504 (validKeyInArray!0 k0!854))))

(declare-fun b!883847 () Bool)

(declare-fun e!491854 () Bool)

(declare-fun tp_is_empty!17707 () Bool)

(assert (=> b!883847 (= e!491854 tp_is_empty!17707)))

(declare-fun b!883848 () Bool)

(declare-fun res!600496 () Bool)

(assert (=> b!883848 (=> (not res!600496) (not e!491856))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883848 (= res!600496 (and (= (select (arr!24780 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883849 () Bool)

(declare-fun e!491855 () Bool)

(assert (=> b!883849 (= e!491855 true)))

(declare-datatypes ((tuple2!11816 0))(
  ( (tuple2!11817 (_1!5919 (_ BitVec 64)) (_2!5919 V!28657)) )
))
(declare-datatypes ((List!17612 0))(
  ( (Nil!17609) (Cons!17608 (h!18739 tuple2!11816) (t!24868 List!17612)) )
))
(declare-datatypes ((ListLongMap!10575 0))(
  ( (ListLongMap!10576 (toList!5303 List!17612)) )
))
(declare-fun lt!400107 () ListLongMap!10575)

(declare-fun lt!400120 () ListLongMap!10575)

(declare-fun lt!400115 () tuple2!11816)

(declare-fun lt!400121 () tuple2!11816)

(declare-fun +!2594 (ListLongMap!10575 tuple2!11816) ListLongMap!10575)

(assert (=> b!883849 (= lt!400107 (+!2594 (+!2594 lt!400120 lt!400121) lt!400115))))

(declare-datatypes ((Unit!30126 0))(
  ( (Unit!30127) )
))
(declare-fun lt!400116 () Unit!30126)

(declare-fun v!557 () V!28657)

(declare-fun lt!400122 () V!28657)

(declare-fun addCommutativeForDiffKeys!549 (ListLongMap!10575 (_ BitVec 64) V!28657 (_ BitVec 64) V!28657) Unit!30126)

(assert (=> b!883849 (= lt!400116 (addCommutativeForDiffKeys!549 lt!400120 k0!854 v!557 (select (arr!24780 _keys!868) from!1053) lt!400122))))

(declare-fun b!883850 () Bool)

(assert (=> b!883850 (= e!491850 tp_is_empty!17707)))

(declare-fun b!883851 () Bool)

(declare-fun e!491857 () Bool)

(assert (=> b!883851 (= e!491857 e!491855)))

(declare-fun res!600498 () Bool)

(assert (=> b!883851 (=> res!600498 e!491855)))

(assert (=> b!883851 (= res!600498 (= k0!854 (select (arr!24780 _keys!868) from!1053)))))

(assert (=> b!883851 (not (= (select (arr!24780 _keys!868) from!1053) k0!854))))

(declare-fun lt!400117 () Unit!30126)

(declare-fun e!491851 () Unit!30126)

(assert (=> b!883851 (= lt!400117 e!491851)))

(declare-fun c!93035 () Bool)

(assert (=> b!883851 (= c!93035 (= (select (arr!24780 _keys!868) from!1053) k0!854))))

(declare-fun lt!400119 () ListLongMap!10575)

(assert (=> b!883851 (= lt!400119 lt!400107)))

(declare-fun lt!400112 () ListLongMap!10575)

(assert (=> b!883851 (= lt!400107 (+!2594 lt!400112 lt!400121))))

(assert (=> b!883851 (= lt!400121 (tuple2!11817 (select (arr!24780 _keys!868) from!1053) lt!400122))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!13069 (ValueCell!8414 V!28657) V!28657)

(declare-fun dynLambda!1279 (Int (_ BitVec 64)) V!28657)

(assert (=> b!883851 (= lt!400122 (get!13069 (select (arr!24781 _values!688) from!1053) (dynLambda!1279 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!883852 () Bool)

(declare-fun res!600505 () Bool)

(assert (=> b!883852 (=> (not res!600505) (not e!491856))))

(assert (=> b!883852 (= res!600505 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25222 _keys!868))))))

(declare-fun b!883853 () Bool)

(declare-fun res!600501 () Bool)

(assert (=> b!883853 (=> (not res!600501) (not e!491856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51521 (_ BitVec 32)) Bool)

(assert (=> b!883853 (= res!600501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!600497 () Bool)

(assert (=> start!74926 (=> (not res!600497) (not e!491856))))

(assert (=> start!74926 (= res!600497 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25222 _keys!868))))))

(assert (=> start!74926 e!491856))

(assert (=> start!74926 tp_is_empty!17707))

(assert (=> start!74926 true))

(assert (=> start!74926 tp!54093))

(declare-fun array_inv!19558 (array!51521) Bool)

(assert (=> start!74926 (array_inv!19558 _keys!868)))

(declare-fun array_inv!19559 (array!51523) Bool)

(assert (=> start!74926 (and (array_inv!19559 _values!688) e!491858)))

(declare-fun b!883854 () Bool)

(declare-fun e!491853 () Bool)

(assert (=> b!883854 (= e!491856 e!491853)))

(declare-fun res!600500 () Bool)

(assert (=> b!883854 (=> (not res!600500) (not e!491853))))

(assert (=> b!883854 (= res!600500 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400111 () array!51523)

(declare-fun minValue!654 () V!28657)

(declare-fun zeroValue!654 () V!28657)

(declare-fun getCurrentListMapNoExtraKeys!3294 (array!51521 array!51523 (_ BitVec 32) (_ BitVec 32) V!28657 V!28657 (_ BitVec 32) Int) ListLongMap!10575)

(assert (=> b!883854 (= lt!400119 (getCurrentListMapNoExtraKeys!3294 _keys!868 lt!400111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883854 (= lt!400111 (array!51524 (store (arr!24781 _values!688) i!612 (ValueCellFull!8414 v!557)) (size!25223 _values!688)))))

(declare-fun lt!400110 () ListLongMap!10575)

(assert (=> b!883854 (= lt!400110 (getCurrentListMapNoExtraKeys!3294 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883855 () Bool)

(assert (=> b!883855 (= e!491853 (not e!491857))))

(declare-fun res!600502 () Bool)

(assert (=> b!883855 (=> res!600502 e!491857)))

(assert (=> b!883855 (= res!600502 (not (validKeyInArray!0 (select (arr!24780 _keys!868) from!1053))))))

(declare-fun lt!400114 () ListLongMap!10575)

(assert (=> b!883855 (= lt!400114 lt!400112)))

(assert (=> b!883855 (= lt!400112 (+!2594 lt!400120 lt!400115))))

(assert (=> b!883855 (= lt!400114 (getCurrentListMapNoExtraKeys!3294 _keys!868 lt!400111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883855 (= lt!400115 (tuple2!11817 k0!854 v!557))))

(assert (=> b!883855 (= lt!400120 (getCurrentListMapNoExtraKeys!3294 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400109 () Unit!30126)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!757 (array!51521 array!51523 (_ BitVec 32) (_ BitVec 32) V!28657 V!28657 (_ BitVec 32) (_ BitVec 64) V!28657 (_ BitVec 32) Int) Unit!30126)

(assert (=> b!883855 (= lt!400109 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!757 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883856 () Bool)

(declare-fun res!600495 () Bool)

(assert (=> b!883856 (=> (not res!600495) (not e!491856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883856 (= res!600495 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28197 () Bool)

(assert (=> mapIsEmpty!28197 mapRes!28197))

(declare-fun b!883857 () Bool)

(declare-fun res!600503 () Bool)

(assert (=> b!883857 (=> (not res!600503) (not e!491856))))

(declare-datatypes ((List!17613 0))(
  ( (Nil!17610) (Cons!17609 (h!18740 (_ BitVec 64)) (t!24869 List!17613)) )
))
(declare-fun arrayNoDuplicates!0 (array!51521 (_ BitVec 32) List!17613) Bool)

(assert (=> b!883857 (= res!600503 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17610))))

(declare-fun b!883858 () Bool)

(declare-fun Unit!30128 () Unit!30126)

(assert (=> b!883858 (= e!491851 Unit!30128)))

(declare-fun lt!400108 () Unit!30126)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51521 (_ BitVec 32) (_ BitVec 32)) Unit!30126)

(assert (=> b!883858 (= lt!400108 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!883858 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17610)))

(declare-fun lt!400113 () Unit!30126)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30126)

(assert (=> b!883858 (= lt!400113 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883858 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400118 () Unit!30126)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51521 (_ BitVec 64) (_ BitVec 32) List!17613) Unit!30126)

(assert (=> b!883858 (= lt!400118 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17610))))

(assert (=> b!883858 false))

(declare-fun b!883859 () Bool)

(declare-fun Unit!30129 () Unit!30126)

(assert (=> b!883859 (= e!491851 Unit!30129)))

(declare-fun mapNonEmpty!28197 () Bool)

(declare-fun tp!54092 () Bool)

(assert (=> mapNonEmpty!28197 (= mapRes!28197 (and tp!54092 e!491854))))

(declare-fun mapRest!28197 () (Array (_ BitVec 32) ValueCell!8414))

(declare-fun mapValue!28197 () ValueCell!8414)

(declare-fun mapKey!28197 () (_ BitVec 32))

(assert (=> mapNonEmpty!28197 (= (arr!24781 _values!688) (store mapRest!28197 mapKey!28197 mapValue!28197))))

(assert (= (and start!74926 res!600497) b!883856))

(assert (= (and b!883856 res!600495) b!883844))

(assert (= (and b!883844 res!600499) b!883853))

(assert (= (and b!883853 res!600501) b!883857))

(assert (= (and b!883857 res!600503) b!883852))

(assert (= (and b!883852 res!600505) b!883846))

(assert (= (and b!883846 res!600504) b!883848))

(assert (= (and b!883848 res!600496) b!883854))

(assert (= (and b!883854 res!600500) b!883855))

(assert (= (and b!883855 (not res!600502)) b!883851))

(assert (= (and b!883851 c!93035) b!883858))

(assert (= (and b!883851 (not c!93035)) b!883859))

(assert (= (and b!883851 (not res!600498)) b!883849))

(assert (= (and b!883845 condMapEmpty!28197) mapIsEmpty!28197))

(assert (= (and b!883845 (not condMapEmpty!28197)) mapNonEmpty!28197))

(get-info :version)

(assert (= (and mapNonEmpty!28197 ((_ is ValueCellFull!8414) mapValue!28197)) b!883847))

(assert (= (and b!883845 ((_ is ValueCellFull!8414) mapDefault!28197)) b!883850))

(assert (= start!74926 b!883845))

(declare-fun b_lambda!12723 () Bool)

(assert (=> (not b_lambda!12723) (not b!883851)))

(declare-fun t!24867 () Bool)

(declare-fun tb!5113 () Bool)

(assert (=> (and start!74926 (= defaultEntry!696 defaultEntry!696) t!24867) tb!5113))

(declare-fun result!9869 () Bool)

(assert (=> tb!5113 (= result!9869 tp_is_empty!17707)))

(assert (=> b!883851 t!24867))

(declare-fun b_and!25601 () Bool)

(assert (= b_and!25599 (and (=> t!24867 result!9869) b_and!25601)))

(declare-fun m!823461 () Bool)

(assert (=> mapNonEmpty!28197 m!823461))

(declare-fun m!823463 () Bool)

(assert (=> b!883858 m!823463))

(declare-fun m!823465 () Bool)

(assert (=> b!883858 m!823465))

(declare-fun m!823467 () Bool)

(assert (=> b!883858 m!823467))

(declare-fun m!823469 () Bool)

(assert (=> b!883858 m!823469))

(declare-fun m!823471 () Bool)

(assert (=> b!883858 m!823471))

(declare-fun m!823473 () Bool)

(assert (=> b!883854 m!823473))

(declare-fun m!823475 () Bool)

(assert (=> b!883854 m!823475))

(declare-fun m!823477 () Bool)

(assert (=> b!883854 m!823477))

(declare-fun m!823479 () Bool)

(assert (=> b!883857 m!823479))

(declare-fun m!823481 () Bool)

(assert (=> b!883848 m!823481))

(declare-fun m!823483 () Bool)

(assert (=> b!883853 m!823483))

(declare-fun m!823485 () Bool)

(assert (=> b!883851 m!823485))

(declare-fun m!823487 () Bool)

(assert (=> b!883851 m!823487))

(declare-fun m!823489 () Bool)

(assert (=> b!883851 m!823489))

(declare-fun m!823491 () Bool)

(assert (=> b!883851 m!823491))

(assert (=> b!883851 m!823487))

(declare-fun m!823493 () Bool)

(assert (=> b!883851 m!823493))

(assert (=> b!883851 m!823489))

(declare-fun m!823495 () Bool)

(assert (=> b!883846 m!823495))

(declare-fun m!823497 () Bool)

(assert (=> b!883849 m!823497))

(assert (=> b!883849 m!823497))

(declare-fun m!823499 () Bool)

(assert (=> b!883849 m!823499))

(assert (=> b!883849 m!823493))

(assert (=> b!883849 m!823493))

(declare-fun m!823501 () Bool)

(assert (=> b!883849 m!823501))

(declare-fun m!823503 () Bool)

(assert (=> b!883855 m!823503))

(assert (=> b!883855 m!823493))

(declare-fun m!823505 () Bool)

(assert (=> b!883855 m!823505))

(declare-fun m!823507 () Bool)

(assert (=> b!883855 m!823507))

(declare-fun m!823509 () Bool)

(assert (=> b!883855 m!823509))

(assert (=> b!883855 m!823493))

(declare-fun m!823511 () Bool)

(assert (=> b!883855 m!823511))

(declare-fun m!823513 () Bool)

(assert (=> b!883856 m!823513))

(declare-fun m!823515 () Bool)

(assert (=> start!74926 m!823515))

(declare-fun m!823517 () Bool)

(assert (=> start!74926 m!823517))

(check-sat b_and!25601 (not b!883858) (not b!883857) (not b!883854) (not b!883851) (not b!883856) (not b!883853) tp_is_empty!17707 (not b_lambda!12723) (not start!74926) (not b!883855) (not mapNonEmpty!28197) (not b_next!15463) (not b!883849) (not b!883846))
(check-sat b_and!25601 (not b_next!15463))
