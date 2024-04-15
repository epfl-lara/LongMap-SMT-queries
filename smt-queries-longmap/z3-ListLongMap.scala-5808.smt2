; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74902 () Bool)

(assert start!74902)

(declare-fun b_free!15439 () Bool)

(declare-fun b_next!15439 () Bool)

(assert (=> start!74902 (= b_free!15439 (not b_next!15439))))

(declare-fun tp!54021 () Bool)

(declare-fun b_and!25551 () Bool)

(assert (=> start!74902 (= tp!54021 b_and!25551)))

(declare-fun b!883269 () Bool)

(declare-datatypes ((Unit!30084 0))(
  ( (Unit!30085) )
))
(declare-fun e!491554 () Unit!30084)

(declare-fun Unit!30086 () Unit!30084)

(assert (=> b!883269 (= e!491554 Unit!30086)))

(declare-fun b!883270 () Bool)

(declare-fun res!600132 () Bool)

(declare-fun e!491553 () Bool)

(assert (=> b!883270 (=> (not res!600132) (not e!491553))))

(declare-datatypes ((array!51473 0))(
  ( (array!51474 (arr!24756 (Array (_ BitVec 32) (_ BitVec 64))) (size!25198 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51473)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51473 (_ BitVec 32)) Bool)

(assert (=> b!883270 (= res!600132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!28161 () Bool)

(declare-fun mapRes!28161 () Bool)

(assert (=> mapIsEmpty!28161 mapRes!28161))

(declare-fun b!883271 () Bool)

(declare-fun e!491555 () Bool)

(declare-fun e!491558 () Bool)

(assert (=> b!883271 (= e!491555 (not e!491558))))

(declare-fun res!600126 () Bool)

(assert (=> b!883271 (=> res!600126 e!491558)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883271 (= res!600126 (not (validKeyInArray!0 (select (arr!24756 _keys!868) from!1053))))))

(declare-datatypes ((V!28625 0))(
  ( (V!28626 (val!8889 Int)) )
))
(declare-datatypes ((tuple2!11792 0))(
  ( (tuple2!11793 (_1!5907 (_ BitVec 64)) (_2!5907 V!28625)) )
))
(declare-datatypes ((List!17589 0))(
  ( (Nil!17586) (Cons!17585 (h!18716 tuple2!11792) (t!24821 List!17589)) )
))
(declare-datatypes ((ListLongMap!10551 0))(
  ( (ListLongMap!10552 (toList!5291 List!17589)) )
))
(declare-fun lt!399656 () ListLongMap!10551)

(declare-fun lt!399657 () ListLongMap!10551)

(assert (=> b!883271 (= lt!399656 lt!399657)))

(declare-fun lt!399661 () ListLongMap!10551)

(declare-fun v!557 () V!28625)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2583 (ListLongMap!10551 tuple2!11792) ListLongMap!10551)

(assert (=> b!883271 (= lt!399657 (+!2583 lt!399661 (tuple2!11793 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8402 0))(
  ( (ValueCellFull!8402 (v!11352 V!28625)) (EmptyCell!8402) )
))
(declare-datatypes ((array!51475 0))(
  ( (array!51476 (arr!24757 (Array (_ BitVec 32) ValueCell!8402)) (size!25199 (_ BitVec 32))) )
))
(declare-fun lt!399660 () array!51475)

(declare-fun minValue!654 () V!28625)

(declare-fun zeroValue!654 () V!28625)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3282 (array!51473 array!51475 (_ BitVec 32) (_ BitVec 32) V!28625 V!28625 (_ BitVec 32) Int) ListLongMap!10551)

(assert (=> b!883271 (= lt!399656 (getCurrentListMapNoExtraKeys!3282 _keys!868 lt!399660 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51475)

(assert (=> b!883271 (= lt!399661 (getCurrentListMapNoExtraKeys!3282 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399663 () Unit!30084)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!747 (array!51473 array!51475 (_ BitVec 32) (_ BitVec 32) V!28625 V!28625 (_ BitVec 32) (_ BitVec 64) V!28625 (_ BitVec 32) Int) Unit!30084)

(assert (=> b!883271 (= lt!399663 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!747 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883272 () Bool)

(assert (=> b!883272 (= e!491558 (bvslt from!1053 (size!25198 _keys!868)))))

(assert (=> b!883272 (not (= (select (arr!24756 _keys!868) from!1053) k0!854))))

(declare-fun lt!399665 () Unit!30084)

(assert (=> b!883272 (= lt!399665 e!491554)))

(declare-fun c!92999 () Bool)

(assert (=> b!883272 (= c!92999 (= (select (arr!24756 _keys!868) from!1053) k0!854))))

(declare-fun lt!399658 () ListLongMap!10551)

(declare-fun get!13051 (ValueCell!8402 V!28625) V!28625)

(declare-fun dynLambda!1269 (Int (_ BitVec 64)) V!28625)

(assert (=> b!883272 (= lt!399658 (+!2583 lt!399657 (tuple2!11793 (select (arr!24756 _keys!868) from!1053) (get!13051 (select (arr!24757 _values!688) from!1053) (dynLambda!1269 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883273 () Bool)

(assert (=> b!883273 (= e!491553 e!491555)))

(declare-fun res!600131 () Bool)

(assert (=> b!883273 (=> (not res!600131) (not e!491555))))

(assert (=> b!883273 (= res!600131 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!883273 (= lt!399658 (getCurrentListMapNoExtraKeys!3282 _keys!868 lt!399660 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883273 (= lt!399660 (array!51476 (store (arr!24757 _values!688) i!612 (ValueCellFull!8402 v!557)) (size!25199 _values!688)))))

(declare-fun lt!399666 () ListLongMap!10551)

(assert (=> b!883273 (= lt!399666 (getCurrentListMapNoExtraKeys!3282 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883274 () Bool)

(declare-fun Unit!30087 () Unit!30084)

(assert (=> b!883274 (= e!491554 Unit!30087)))

(declare-fun lt!399664 () Unit!30084)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51473 (_ BitVec 32) (_ BitVec 32)) Unit!30084)

(assert (=> b!883274 (= lt!399664 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17590 0))(
  ( (Nil!17587) (Cons!17586 (h!18717 (_ BitVec 64)) (t!24822 List!17590)) )
))
(declare-fun arrayNoDuplicates!0 (array!51473 (_ BitVec 32) List!17590) Bool)

(assert (=> b!883274 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17587)))

(declare-fun lt!399659 () Unit!30084)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30084)

(assert (=> b!883274 (= lt!399659 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883274 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399662 () Unit!30084)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51473 (_ BitVec 64) (_ BitVec 32) List!17590) Unit!30084)

(assert (=> b!883274 (= lt!399662 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17587))))

(assert (=> b!883274 false))

(declare-fun b!883275 () Bool)

(declare-fun res!600128 () Bool)

(assert (=> b!883275 (=> (not res!600128) (not e!491553))))

(assert (=> b!883275 (= res!600128 (and (= (select (arr!24756 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883276 () Bool)

(declare-fun res!600133 () Bool)

(assert (=> b!883276 (=> (not res!600133) (not e!491553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883276 (= res!600133 (validMask!0 mask!1196))))

(declare-fun b!883277 () Bool)

(declare-fun res!600124 () Bool)

(assert (=> b!883277 (=> (not res!600124) (not e!491553))))

(assert (=> b!883277 (= res!600124 (and (= (size!25199 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25198 _keys!868) (size!25199 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883278 () Bool)

(declare-fun res!600130 () Bool)

(assert (=> b!883278 (=> (not res!600130) (not e!491553))))

(assert (=> b!883278 (= res!600130 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17587))))

(declare-fun b!883279 () Bool)

(declare-fun e!491556 () Bool)

(declare-fun tp_is_empty!17683 () Bool)

(assert (=> b!883279 (= e!491556 tp_is_empty!17683)))

(declare-fun b!883280 () Bool)

(declare-fun res!600127 () Bool)

(assert (=> b!883280 (=> (not res!600127) (not e!491553))))

(assert (=> b!883280 (= res!600127 (validKeyInArray!0 k0!854))))

(declare-fun b!883281 () Bool)

(declare-fun e!491552 () Bool)

(assert (=> b!883281 (= e!491552 (and e!491556 mapRes!28161))))

(declare-fun condMapEmpty!28161 () Bool)

(declare-fun mapDefault!28161 () ValueCell!8402)

(assert (=> b!883281 (= condMapEmpty!28161 (= (arr!24757 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8402)) mapDefault!28161)))))

(declare-fun mapNonEmpty!28161 () Bool)

(declare-fun tp!54020 () Bool)

(declare-fun e!491551 () Bool)

(assert (=> mapNonEmpty!28161 (= mapRes!28161 (and tp!54020 e!491551))))

(declare-fun mapRest!28161 () (Array (_ BitVec 32) ValueCell!8402))

(declare-fun mapValue!28161 () ValueCell!8402)

(declare-fun mapKey!28161 () (_ BitVec 32))

(assert (=> mapNonEmpty!28161 (= (arr!24757 _values!688) (store mapRest!28161 mapKey!28161 mapValue!28161))))

(declare-fun res!600125 () Bool)

(assert (=> start!74902 (=> (not res!600125) (not e!491553))))

(assert (=> start!74902 (= res!600125 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25198 _keys!868))))))

(assert (=> start!74902 e!491553))

(assert (=> start!74902 tp_is_empty!17683))

(assert (=> start!74902 true))

(assert (=> start!74902 tp!54021))

(declare-fun array_inv!19542 (array!51473) Bool)

(assert (=> start!74902 (array_inv!19542 _keys!868)))

(declare-fun array_inv!19543 (array!51475) Bool)

(assert (=> start!74902 (and (array_inv!19543 _values!688) e!491552)))

(declare-fun b!883282 () Bool)

(declare-fun res!600129 () Bool)

(assert (=> b!883282 (=> (not res!600129) (not e!491553))))

(assert (=> b!883282 (= res!600129 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25198 _keys!868))))))

(declare-fun b!883283 () Bool)

(assert (=> b!883283 (= e!491551 tp_is_empty!17683)))

(assert (= (and start!74902 res!600125) b!883276))

(assert (= (and b!883276 res!600133) b!883277))

(assert (= (and b!883277 res!600124) b!883270))

(assert (= (and b!883270 res!600132) b!883278))

(assert (= (and b!883278 res!600130) b!883282))

(assert (= (and b!883282 res!600129) b!883280))

(assert (= (and b!883280 res!600127) b!883275))

(assert (= (and b!883275 res!600128) b!883273))

(assert (= (and b!883273 res!600131) b!883271))

(assert (= (and b!883271 (not res!600126)) b!883272))

(assert (= (and b!883272 c!92999) b!883274))

(assert (= (and b!883272 (not c!92999)) b!883269))

(assert (= (and b!883281 condMapEmpty!28161) mapIsEmpty!28161))

(assert (= (and b!883281 (not condMapEmpty!28161)) mapNonEmpty!28161))

(get-info :version)

(assert (= (and mapNonEmpty!28161 ((_ is ValueCellFull!8402) mapValue!28161)) b!883283))

(assert (= (and b!883281 ((_ is ValueCellFull!8402) mapDefault!28161)) b!883279))

(assert (= start!74902 b!883281))

(declare-fun b_lambda!12699 () Bool)

(assert (=> (not b_lambda!12699) (not b!883272)))

(declare-fun t!24820 () Bool)

(declare-fun tb!5089 () Bool)

(assert (=> (and start!74902 (= defaultEntry!696 defaultEntry!696) t!24820) tb!5089))

(declare-fun result!9821 () Bool)

(assert (=> tb!5089 (= result!9821 tp_is_empty!17683)))

(assert (=> b!883272 t!24820))

(declare-fun b_and!25553 () Bool)

(assert (= b_and!25551 (and (=> t!24820 result!9821) b_and!25553)))

(declare-fun m!822819 () Bool)

(assert (=> b!883275 m!822819))

(declare-fun m!822821 () Bool)

(assert (=> b!883273 m!822821))

(declare-fun m!822823 () Bool)

(assert (=> b!883273 m!822823))

(declare-fun m!822825 () Bool)

(assert (=> b!883273 m!822825))

(declare-fun m!822827 () Bool)

(assert (=> b!883271 m!822827))

(declare-fun m!822829 () Bool)

(assert (=> b!883271 m!822829))

(declare-fun m!822831 () Bool)

(assert (=> b!883271 m!822831))

(declare-fun m!822833 () Bool)

(assert (=> b!883271 m!822833))

(assert (=> b!883271 m!822831))

(declare-fun m!822835 () Bool)

(assert (=> b!883271 m!822835))

(declare-fun m!822837 () Bool)

(assert (=> b!883271 m!822837))

(declare-fun m!822839 () Bool)

(assert (=> b!883280 m!822839))

(declare-fun m!822841 () Bool)

(assert (=> start!74902 m!822841))

(declare-fun m!822843 () Bool)

(assert (=> start!74902 m!822843))

(declare-fun m!822845 () Bool)

(assert (=> b!883272 m!822845))

(declare-fun m!822847 () Bool)

(assert (=> b!883272 m!822847))

(declare-fun m!822849 () Bool)

(assert (=> b!883272 m!822849))

(declare-fun m!822851 () Bool)

(assert (=> b!883272 m!822851))

(assert (=> b!883272 m!822847))

(assert (=> b!883272 m!822831))

(assert (=> b!883272 m!822849))

(declare-fun m!822853 () Bool)

(assert (=> b!883278 m!822853))

(declare-fun m!822855 () Bool)

(assert (=> mapNonEmpty!28161 m!822855))

(declare-fun m!822857 () Bool)

(assert (=> b!883274 m!822857))

(declare-fun m!822859 () Bool)

(assert (=> b!883274 m!822859))

(declare-fun m!822861 () Bool)

(assert (=> b!883274 m!822861))

(declare-fun m!822863 () Bool)

(assert (=> b!883274 m!822863))

(declare-fun m!822865 () Bool)

(assert (=> b!883274 m!822865))

(declare-fun m!822867 () Bool)

(assert (=> b!883270 m!822867))

(declare-fun m!822869 () Bool)

(assert (=> b!883276 m!822869))

(check-sat (not b!883273) (not b_lambda!12699) (not b!883280) (not b!883276) (not b!883272) (not b!883271) (not b!883270) (not mapNonEmpty!28161) (not start!74902) (not b_next!15439) (not b!883274) b_and!25553 tp_is_empty!17683 (not b!883278))
(check-sat b_and!25553 (not b_next!15439))
