; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72966 () Bool)

(assert start!72966)

(declare-fun b_free!13881 () Bool)

(declare-fun b_next!13881 () Bool)

(assert (=> start!72966 (= b_free!13881 (not b_next!13881))))

(declare-fun tp!49146 () Bool)

(declare-fun b_and!22967 () Bool)

(assert (=> start!72966 (= tp!49146 b_and!22967)))

(declare-fun mapNonEmpty!25625 () Bool)

(declare-fun mapRes!25625 () Bool)

(declare-fun tp!49147 () Bool)

(declare-fun e!472894 () Bool)

(assert (=> mapNonEmpty!25625 (= mapRes!25625 (and tp!49147 e!472894))))

(declare-fun mapKey!25625 () (_ BitVec 32))

(declare-datatypes ((V!26403 0))(
  ( (V!26404 (val!8056 Int)) )
))
(declare-datatypes ((ValueCell!7569 0))(
  ( (ValueCellFull!7569 (v!10481 V!26403)) (EmptyCell!7569) )
))
(declare-fun mapValue!25625 () ValueCell!7569)

(declare-fun mapRest!25625 () (Array (_ BitVec 32) ValueCell!7569))

(declare-datatypes ((array!48244 0))(
  ( (array!48245 (arr!23153 (Array (_ BitVec 32) ValueCell!7569)) (size!23593 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48244)

(assert (=> mapNonEmpty!25625 (= (arr!23153 _values!688) (store mapRest!25625 mapKey!25625 mapValue!25625))))

(declare-fun b!847462 () Bool)

(declare-fun res!575801 () Bool)

(declare-fun e!472897 () Bool)

(assert (=> b!847462 (=> (not res!575801) (not e!472897))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847462 (= res!575801 (validMask!0 mask!1196))))

(declare-fun b!847463 () Bool)

(declare-fun e!472892 () Bool)

(assert (=> b!847463 (= e!472897 e!472892)))

(declare-fun res!575796 () Bool)

(assert (=> b!847463 (=> (not res!575796) (not e!472892))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847463 (= res!575796 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48246 0))(
  ( (array!48247 (arr!23154 (Array (_ BitVec 32) (_ BitVec 64))) (size!23594 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48246)

(declare-fun minValue!654 () V!26403)

(declare-fun zeroValue!654 () V!26403)

(declare-datatypes ((tuple2!10522 0))(
  ( (tuple2!10523 (_1!5272 (_ BitVec 64)) (_2!5272 V!26403)) )
))
(declare-datatypes ((List!16381 0))(
  ( (Nil!16378) (Cons!16377 (h!17508 tuple2!10522) (t!22752 List!16381)) )
))
(declare-datatypes ((ListLongMap!9291 0))(
  ( (ListLongMap!9292 (toList!4661 List!16381)) )
))
(declare-fun lt!381742 () ListLongMap!9291)

(declare-fun lt!381743 () array!48244)

(declare-fun getCurrentListMapNoExtraKeys!2645 (array!48246 array!48244 (_ BitVec 32) (_ BitVec 32) V!26403 V!26403 (_ BitVec 32) Int) ListLongMap!9291)

(assert (=> b!847463 (= lt!381742 (getCurrentListMapNoExtraKeys!2645 _keys!868 lt!381743 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26403)

(assert (=> b!847463 (= lt!381743 (array!48245 (store (arr!23153 _values!688) i!612 (ValueCellFull!7569 v!557)) (size!23593 _values!688)))))

(declare-fun lt!381745 () ListLongMap!9291)

(assert (=> b!847463 (= lt!381745 (getCurrentListMapNoExtraKeys!2645 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847464 () Bool)

(declare-fun res!575802 () Bool)

(assert (=> b!847464 (=> (not res!575802) (not e!472897))))

(assert (=> b!847464 (= res!575802 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23594 _keys!868))))))

(declare-fun b!847465 () Bool)

(declare-fun res!575804 () Bool)

(assert (=> b!847465 (=> (not res!575804) (not e!472897))))

(declare-datatypes ((List!16382 0))(
  ( (Nil!16379) (Cons!16378 (h!17509 (_ BitVec 64)) (t!22753 List!16382)) )
))
(declare-fun arrayNoDuplicates!0 (array!48246 (_ BitVec 32) List!16382) Bool)

(assert (=> b!847465 (= res!575804 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16379))))

(declare-fun b!847466 () Bool)

(declare-fun e!472891 () Bool)

(declare-fun call!37499 () ListLongMap!9291)

(declare-fun call!37498 () ListLongMap!9291)

(assert (=> b!847466 (= e!472891 (= call!37499 call!37498))))

(declare-fun b!847467 () Bool)

(declare-fun e!472893 () Bool)

(declare-fun tp_is_empty!16017 () Bool)

(assert (=> b!847467 (= e!472893 tp_is_empty!16017)))

(declare-fun b!847468 () Bool)

(declare-fun res!575800 () Bool)

(assert (=> b!847468 (=> (not res!575800) (not e!472897))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847468 (= res!575800 (validKeyInArray!0 k0!854))))

(declare-fun b!847469 () Bool)

(declare-fun res!575799 () Bool)

(assert (=> b!847469 (=> (not res!575799) (not e!472897))))

(assert (=> b!847469 (= res!575799 (and (= (size!23593 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23594 _keys!868) (size!23593 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847470 () Bool)

(declare-fun res!575798 () Bool)

(assert (=> b!847470 (=> (not res!575798) (not e!472897))))

(assert (=> b!847470 (= res!575798 (and (= (select (arr!23154 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37495 () Bool)

(assert (=> bm!37495 (= call!37498 (getCurrentListMapNoExtraKeys!2645 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847471 () Bool)

(declare-fun +!2079 (ListLongMap!9291 tuple2!10522) ListLongMap!9291)

(assert (=> b!847471 (= e!472891 (= call!37499 (+!2079 call!37498 (tuple2!10523 k0!854 v!557))))))

(declare-fun b!847472 () Bool)

(declare-fun e!472895 () Bool)

(assert (=> b!847472 (= e!472895 (and e!472893 mapRes!25625))))

(declare-fun condMapEmpty!25625 () Bool)

(declare-fun mapDefault!25625 () ValueCell!7569)

(assert (=> b!847472 (= condMapEmpty!25625 (= (arr!23153 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7569)) mapDefault!25625)))))

(declare-fun b!847473 () Bool)

(declare-fun res!575797 () Bool)

(assert (=> b!847473 (=> (not res!575797) (not e!472897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48246 (_ BitVec 32)) Bool)

(assert (=> b!847473 (= res!575797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847474 () Bool)

(assert (=> b!847474 (= e!472894 tp_is_empty!16017)))

(declare-fun b!847475 () Bool)

(assert (=> b!847475 (= e!472892 (not true))))

(assert (=> b!847475 e!472891))

(declare-fun c!91492 () Bool)

(assert (=> b!847475 (= c!91492 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28939 0))(
  ( (Unit!28940) )
))
(declare-fun lt!381744 () Unit!28939)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!315 (array!48246 array!48244 (_ BitVec 32) (_ BitVec 32) V!26403 V!26403 (_ BitVec 32) (_ BitVec 64) V!26403 (_ BitVec 32) Int) Unit!28939)

(assert (=> b!847475 (= lt!381744 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!315 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25625 () Bool)

(assert (=> mapIsEmpty!25625 mapRes!25625))

(declare-fun res!575803 () Bool)

(assert (=> start!72966 (=> (not res!575803) (not e!472897))))

(assert (=> start!72966 (= res!575803 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23594 _keys!868))))))

(assert (=> start!72966 e!472897))

(assert (=> start!72966 tp_is_empty!16017))

(assert (=> start!72966 true))

(assert (=> start!72966 tp!49146))

(declare-fun array_inv!18388 (array!48246) Bool)

(assert (=> start!72966 (array_inv!18388 _keys!868)))

(declare-fun array_inv!18389 (array!48244) Bool)

(assert (=> start!72966 (and (array_inv!18389 _values!688) e!472895)))

(declare-fun bm!37496 () Bool)

(assert (=> bm!37496 (= call!37499 (getCurrentListMapNoExtraKeys!2645 _keys!868 lt!381743 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72966 res!575803) b!847462))

(assert (= (and b!847462 res!575801) b!847469))

(assert (= (and b!847469 res!575799) b!847473))

(assert (= (and b!847473 res!575797) b!847465))

(assert (= (and b!847465 res!575804) b!847464))

(assert (= (and b!847464 res!575802) b!847468))

(assert (= (and b!847468 res!575800) b!847470))

(assert (= (and b!847470 res!575798) b!847463))

(assert (= (and b!847463 res!575796) b!847475))

(assert (= (and b!847475 c!91492) b!847471))

(assert (= (and b!847475 (not c!91492)) b!847466))

(assert (= (or b!847471 b!847466) bm!37496))

(assert (= (or b!847471 b!847466) bm!37495))

(assert (= (and b!847472 condMapEmpty!25625) mapIsEmpty!25625))

(assert (= (and b!847472 (not condMapEmpty!25625)) mapNonEmpty!25625))

(get-info :version)

(assert (= (and mapNonEmpty!25625 ((_ is ValueCellFull!7569) mapValue!25625)) b!847474))

(assert (= (and b!847472 ((_ is ValueCellFull!7569) mapDefault!25625)) b!847467))

(assert (= start!72966 b!847472))

(declare-fun m!788523 () Bool)

(assert (=> bm!37495 m!788523))

(declare-fun m!788525 () Bool)

(assert (=> mapNonEmpty!25625 m!788525))

(declare-fun m!788527 () Bool)

(assert (=> b!847473 m!788527))

(declare-fun m!788529 () Bool)

(assert (=> b!847471 m!788529))

(declare-fun m!788531 () Bool)

(assert (=> b!847470 m!788531))

(declare-fun m!788533 () Bool)

(assert (=> b!847465 m!788533))

(declare-fun m!788535 () Bool)

(assert (=> b!847468 m!788535))

(declare-fun m!788537 () Bool)

(assert (=> bm!37496 m!788537))

(declare-fun m!788539 () Bool)

(assert (=> b!847475 m!788539))

(declare-fun m!788541 () Bool)

(assert (=> b!847463 m!788541))

(declare-fun m!788543 () Bool)

(assert (=> b!847463 m!788543))

(declare-fun m!788545 () Bool)

(assert (=> b!847463 m!788545))

(declare-fun m!788547 () Bool)

(assert (=> b!847462 m!788547))

(declare-fun m!788549 () Bool)

(assert (=> start!72966 m!788549))

(declare-fun m!788551 () Bool)

(assert (=> start!72966 m!788551))

(check-sat (not b!847475) (not b!847462) (not bm!37496) b_and!22967 (not b!847465) (not b!847463) (not b!847468) (not start!72966) (not b!847473) (not b!847471) (not mapNonEmpty!25625) tp_is_empty!16017 (not b_next!13881) (not bm!37495))
(check-sat b_and!22967 (not b_next!13881))
