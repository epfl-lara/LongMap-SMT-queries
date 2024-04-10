; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72558 () Bool)

(assert start!72558)

(declare-fun b_free!13743 () Bool)

(declare-fun b_next!13743 () Bool)

(assert (=> start!72558 (= b_free!13743 (not b_next!13743))))

(declare-fun tp!48328 () Bool)

(declare-fun b_and!22829 () Bool)

(assert (=> start!72558 (= tp!48328 b_and!22829)))

(declare-fun mapNonEmpty!25013 () Bool)

(declare-fun mapRes!25013 () Bool)

(declare-fun tp!48327 () Bool)

(declare-fun e!469799 () Bool)

(assert (=> mapNonEmpty!25013 (= mapRes!25013 (and tp!48327 e!469799))))

(declare-fun mapKey!25013 () (_ BitVec 32))

(declare-datatypes ((V!25859 0))(
  ( (V!25860 (val!7852 Int)) )
))
(declare-datatypes ((ValueCell!7365 0))(
  ( (ValueCellFull!7365 (v!10277 V!25859)) (EmptyCell!7365) )
))
(declare-fun mapValue!25013 () ValueCell!7365)

(declare-fun mapRest!25013 () (Array (_ BitVec 32) ValueCell!7365))

(declare-datatypes ((array!47492 0))(
  ( (array!47493 (arr!22777 (Array (_ BitVec 32) ValueCell!7365)) (size!23217 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47492)

(assert (=> mapNonEmpty!25013 (= (arr!22777 _values!688) (store mapRest!25013 mapKey!25013 mapValue!25013))))

(declare-fun b!842300 () Bool)

(declare-fun res!572506 () Bool)

(declare-fun e!469803 () Bool)

(assert (=> b!842300 (=> (not res!572506) (not e!469803))))

(declare-datatypes ((array!47494 0))(
  ( (array!47495 (arr!22778 (Array (_ BitVec 32) (_ BitVec 64))) (size!23218 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47494)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47494 (_ BitVec 32)) Bool)

(assert (=> b!842300 (= res!572506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842301 () Bool)

(assert (=> b!842301 (= e!469803 (not true))))

(declare-fun e!469802 () Bool)

(assert (=> b!842301 e!469802))

(declare-fun c!91474 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!842301 (= c!91474 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25859)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28931 0))(
  ( (Unit!28932) )
))
(declare-fun lt!380980 () Unit!28931)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!25859)

(declare-fun zeroValue!654 () V!25859)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!311 (array!47494 array!47492 (_ BitVec 32) (_ BitVec 32) V!25859 V!25859 (_ BitVec 32) (_ BitVec 64) V!25859 (_ BitVec 32) Int) Unit!28931)

(assert (=> b!842301 (= lt!380980 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!311 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842302 () Bool)

(declare-fun e!469800 () Bool)

(declare-fun tp_is_empty!15609 () Bool)

(assert (=> b!842302 (= e!469800 tp_is_empty!15609)))

(declare-fun res!572510 () Bool)

(assert (=> start!72558 (=> (not res!572510) (not e!469803))))

(assert (=> start!72558 (= res!572510 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23218 _keys!868))))))

(assert (=> start!72558 e!469803))

(assert (=> start!72558 tp_is_empty!15609))

(assert (=> start!72558 true))

(assert (=> start!72558 tp!48328))

(declare-fun array_inv!18124 (array!47494) Bool)

(assert (=> start!72558 (array_inv!18124 _keys!868)))

(declare-fun e!469801 () Bool)

(declare-fun array_inv!18125 (array!47492) Bool)

(assert (=> start!72558 (and (array_inv!18125 _values!688) e!469801)))

(declare-fun b!842303 () Bool)

(declare-fun res!572509 () Bool)

(assert (=> b!842303 (=> (not res!572509) (not e!469803))))

(assert (=> b!842303 (= res!572509 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23218 _keys!868))))))

(declare-fun b!842304 () Bool)

(assert (=> b!842304 (= e!469801 (and e!469800 mapRes!25013))))

(declare-fun condMapEmpty!25013 () Bool)

(declare-fun mapDefault!25013 () ValueCell!7365)

(assert (=> b!842304 (= condMapEmpty!25013 (= (arr!22777 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7365)) mapDefault!25013)))))

(declare-fun b!842305 () Bool)

(declare-fun res!572508 () Bool)

(assert (=> b!842305 (=> (not res!572508) (not e!469803))))

(assert (=> b!842305 (= res!572508 (and (= (size!23217 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23218 _keys!868) (size!23217 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!10430 0))(
  ( (tuple2!10431 (_1!5226 (_ BitVec 64)) (_2!5226 V!25859)) )
))
(declare-datatypes ((List!16206 0))(
  ( (Nil!16203) (Cons!16202 (h!17333 tuple2!10430) (t!22577 List!16206)) )
))
(declare-datatypes ((ListLongMap!9199 0))(
  ( (ListLongMap!9200 (toList!4615 List!16206)) )
))
(declare-fun call!37462 () ListLongMap!9199)

(declare-fun b!842306 () Bool)

(declare-fun call!37463 () ListLongMap!9199)

(declare-fun +!2075 (ListLongMap!9199 tuple2!10430) ListLongMap!9199)

(assert (=> b!842306 (= e!469802 (= call!37463 (+!2075 call!37462 (tuple2!10431 k0!854 v!557))))))

(declare-fun b!842307 () Bool)

(declare-fun res!572511 () Bool)

(assert (=> b!842307 (=> (not res!572511) (not e!469803))))

(declare-datatypes ((List!16207 0))(
  ( (Nil!16204) (Cons!16203 (h!17334 (_ BitVec 64)) (t!22578 List!16207)) )
))
(declare-fun arrayNoDuplicates!0 (array!47494 (_ BitVec 32) List!16207) Bool)

(assert (=> b!842307 (= res!572511 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16204))))

(declare-fun bm!37459 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2600 (array!47494 array!47492 (_ BitVec 32) (_ BitVec 32) V!25859 V!25859 (_ BitVec 32) Int) ListLongMap!9199)

(assert (=> bm!37459 (= call!37463 (getCurrentListMapNoExtraKeys!2600 _keys!868 (array!47493 (store (arr!22777 _values!688) i!612 (ValueCellFull!7365 v!557)) (size!23217 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842308 () Bool)

(declare-fun res!572507 () Bool)

(assert (=> b!842308 (=> (not res!572507) (not e!469803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842308 (= res!572507 (validMask!0 mask!1196))))

(declare-fun b!842309 () Bool)

(declare-fun res!572513 () Bool)

(assert (=> b!842309 (=> (not res!572513) (not e!469803))))

(assert (=> b!842309 (= res!572513 (and (= (select (arr!22778 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23218 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!25013 () Bool)

(assert (=> mapIsEmpty!25013 mapRes!25013))

(declare-fun b!842310 () Bool)

(assert (=> b!842310 (= e!469802 (= call!37463 call!37462))))

(declare-fun bm!37460 () Bool)

(assert (=> bm!37460 (= call!37462 (getCurrentListMapNoExtraKeys!2600 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842311 () Bool)

(declare-fun res!572512 () Bool)

(assert (=> b!842311 (=> (not res!572512) (not e!469803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842311 (= res!572512 (validKeyInArray!0 k0!854))))

(declare-fun b!842312 () Bool)

(assert (=> b!842312 (= e!469799 tp_is_empty!15609)))

(assert (= (and start!72558 res!572510) b!842308))

(assert (= (and b!842308 res!572507) b!842305))

(assert (= (and b!842305 res!572508) b!842300))

(assert (= (and b!842300 res!572506) b!842307))

(assert (= (and b!842307 res!572511) b!842303))

(assert (= (and b!842303 res!572509) b!842311))

(assert (= (and b!842311 res!572512) b!842309))

(assert (= (and b!842309 res!572513) b!842301))

(assert (= (and b!842301 c!91474) b!842306))

(assert (= (and b!842301 (not c!91474)) b!842310))

(assert (= (or b!842306 b!842310) bm!37459))

(assert (= (or b!842306 b!842310) bm!37460))

(assert (= (and b!842304 condMapEmpty!25013) mapIsEmpty!25013))

(assert (= (and b!842304 (not condMapEmpty!25013)) mapNonEmpty!25013))

(get-info :version)

(assert (= (and mapNonEmpty!25013 ((_ is ValueCellFull!7365) mapValue!25013)) b!842312))

(assert (= (and b!842304 ((_ is ValueCellFull!7365) mapDefault!25013)) b!842302))

(assert (= start!72558 b!842304))

(declare-fun m!785453 () Bool)

(assert (=> start!72558 m!785453))

(declare-fun m!785455 () Bool)

(assert (=> start!72558 m!785455))

(declare-fun m!785457 () Bool)

(assert (=> bm!37460 m!785457))

(declare-fun m!785459 () Bool)

(assert (=> b!842301 m!785459))

(declare-fun m!785461 () Bool)

(assert (=> b!842311 m!785461))

(declare-fun m!785463 () Bool)

(assert (=> bm!37459 m!785463))

(declare-fun m!785465 () Bool)

(assert (=> bm!37459 m!785465))

(declare-fun m!785467 () Bool)

(assert (=> b!842309 m!785467))

(declare-fun m!785469 () Bool)

(assert (=> b!842308 m!785469))

(declare-fun m!785471 () Bool)

(assert (=> b!842300 m!785471))

(declare-fun m!785473 () Bool)

(assert (=> b!842307 m!785473))

(declare-fun m!785475 () Bool)

(assert (=> b!842306 m!785475))

(declare-fun m!785477 () Bool)

(assert (=> mapNonEmpty!25013 m!785477))

(check-sat (not bm!37460) b_and!22829 (not b!842306) (not bm!37459) (not b!842308) (not b!842300) (not mapNonEmpty!25013) (not b!842311) (not start!72558) (not b!842301) (not b_next!13743) (not b!842307) tp_is_empty!15609)
(check-sat b_and!22829 (not b_next!13743))
