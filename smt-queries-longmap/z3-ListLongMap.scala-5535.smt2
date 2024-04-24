; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73162 () Bool)

(assert start!73162)

(declare-fun b_free!13909 () Bool)

(declare-fun b_next!13909 () Bool)

(assert (=> start!73162 (= b_free!13909 (not b_next!13909))))

(declare-fun tp!49231 () Bool)

(declare-fun b_and!23005 () Bool)

(assert (=> start!73162 (= tp!49231 b_and!23005)))

(declare-fun b!848953 () Bool)

(declare-fun e!473773 () Bool)

(declare-fun tp_is_empty!16045 () Bool)

(assert (=> b!848953 (= e!473773 tp_is_empty!16045)))

(declare-fun b!848954 () Bool)

(declare-fun e!473770 () Bool)

(assert (=> b!848954 (= e!473770 tp_is_empty!16045)))

(declare-fun bm!37624 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26441 0))(
  ( (V!26442 (val!8070 Int)) )
))
(declare-datatypes ((tuple2!10474 0))(
  ( (tuple2!10475 (_1!5248 (_ BitVec 64)) (_2!5248 V!26441)) )
))
(declare-datatypes ((List!16344 0))(
  ( (Nil!16341) (Cons!16340 (h!17477 tuple2!10474) (t!22707 List!16344)) )
))
(declare-datatypes ((ListLongMap!9245 0))(
  ( (ListLongMap!9246 (toList!4638 List!16344)) )
))
(declare-fun call!37628 () ListLongMap!9245)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48349 0))(
  ( (array!48350 (arr!23201 (Array (_ BitVec 32) (_ BitVec 64))) (size!23642 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48349)

(declare-datatypes ((ValueCell!7583 0))(
  ( (ValueCellFull!7583 (v!10495 V!26441)) (EmptyCell!7583) )
))
(declare-datatypes ((array!48351 0))(
  ( (array!48352 (arr!23202 (Array (_ BitVec 32) ValueCell!7583)) (size!23643 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48351)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26441)

(declare-fun zeroValue!654 () V!26441)

(declare-fun getCurrentListMapNoExtraKeys!2696 (array!48349 array!48351 (_ BitVec 32) (_ BitVec 32) V!26441 V!26441 (_ BitVec 32) Int) ListLongMap!9245)

(assert (=> bm!37624 (= call!37628 (getCurrentListMapNoExtraKeys!2696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25667 () Bool)

(declare-fun mapRes!25667 () Bool)

(assert (=> mapIsEmpty!25667 mapRes!25667))

(declare-fun res!576524 () Bool)

(declare-fun e!473769 () Bool)

(assert (=> start!73162 (=> (not res!576524) (not e!473769))))

(assert (=> start!73162 (= res!576524 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23642 _keys!868))))))

(assert (=> start!73162 e!473769))

(assert (=> start!73162 tp_is_empty!16045))

(assert (=> start!73162 true))

(assert (=> start!73162 tp!49231))

(declare-fun array_inv!18472 (array!48349) Bool)

(assert (=> start!73162 (array_inv!18472 _keys!868)))

(declare-fun e!473768 () Bool)

(declare-fun array_inv!18473 (array!48351) Bool)

(assert (=> start!73162 (and (array_inv!18473 _values!688) e!473768)))

(declare-fun b!848955 () Bool)

(declare-fun e!473771 () Bool)

(assert (=> b!848955 (= e!473769 e!473771)))

(declare-fun res!576518 () Bool)

(assert (=> b!848955 (=> (not res!576518) (not e!473771))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848955 (= res!576518 (= from!1053 i!612))))

(declare-fun lt!382272 () array!48351)

(declare-fun lt!382274 () ListLongMap!9245)

(assert (=> b!848955 (= lt!382274 (getCurrentListMapNoExtraKeys!2696 _keys!868 lt!382272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26441)

(assert (=> b!848955 (= lt!382272 (array!48352 (store (arr!23202 _values!688) i!612 (ValueCellFull!7583 v!557)) (size!23643 _values!688)))))

(declare-fun lt!382273 () ListLongMap!9245)

(assert (=> b!848955 (= lt!382273 (getCurrentListMapNoExtraKeys!2696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848956 () Bool)

(declare-fun res!576519 () Bool)

(assert (=> b!848956 (=> (not res!576519) (not e!473769))))

(declare-datatypes ((List!16345 0))(
  ( (Nil!16342) (Cons!16341 (h!17478 (_ BitVec 64)) (t!22708 List!16345)) )
))
(declare-fun arrayNoDuplicates!0 (array!48349 (_ BitVec 32) List!16345) Bool)

(assert (=> b!848956 (= res!576519 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16342))))

(declare-fun b!848957 () Bool)

(declare-fun res!576521 () Bool)

(assert (=> b!848957 (=> (not res!576521) (not e!473769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48349 (_ BitVec 32)) Bool)

(assert (=> b!848957 (= res!576521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848958 () Bool)

(declare-fun res!576523 () Bool)

(assert (=> b!848958 (=> (not res!576523) (not e!473769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848958 (= res!576523 (validMask!0 mask!1196))))

(declare-fun b!848959 () Bool)

(declare-fun res!576520 () Bool)

(assert (=> b!848959 (=> (not res!576520) (not e!473769))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848959 (= res!576520 (validKeyInArray!0 k0!854))))

(declare-fun b!848960 () Bool)

(declare-fun res!576522 () Bool)

(assert (=> b!848960 (=> (not res!576522) (not e!473769))))

(assert (=> b!848960 (= res!576522 (and (= (select (arr!23201 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848961 () Bool)

(declare-fun res!576526 () Bool)

(assert (=> b!848961 (=> (not res!576526) (not e!473769))))

(assert (=> b!848961 (= res!576526 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23642 _keys!868))))))

(declare-fun mapNonEmpty!25667 () Bool)

(declare-fun tp!49232 () Bool)

(assert (=> mapNonEmpty!25667 (= mapRes!25667 (and tp!49232 e!473770))))

(declare-fun mapKey!25667 () (_ BitVec 32))

(declare-fun mapValue!25667 () ValueCell!7583)

(declare-fun mapRest!25667 () (Array (_ BitVec 32) ValueCell!7583))

(assert (=> mapNonEmpty!25667 (= (arr!23202 _values!688) (store mapRest!25667 mapKey!25667 mapValue!25667))))

(declare-fun b!848962 () Bool)

(declare-fun call!37627 () ListLongMap!9245)

(declare-fun e!473767 () Bool)

(declare-fun +!2096 (ListLongMap!9245 tuple2!10474) ListLongMap!9245)

(assert (=> b!848962 (= e!473767 (= call!37627 (+!2096 call!37628 (tuple2!10475 k0!854 v!557))))))

(declare-fun b!848963 () Bool)

(declare-fun res!576525 () Bool)

(assert (=> b!848963 (=> (not res!576525) (not e!473769))))

(assert (=> b!848963 (= res!576525 (and (= (size!23643 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23642 _keys!868) (size!23643 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848964 () Bool)

(assert (=> b!848964 (= e!473767 (= call!37627 call!37628))))

(declare-fun b!848965 () Bool)

(assert (=> b!848965 (= e!473768 (and e!473773 mapRes!25667))))

(declare-fun condMapEmpty!25667 () Bool)

(declare-fun mapDefault!25667 () ValueCell!7583)

(assert (=> b!848965 (= condMapEmpty!25667 (= (arr!23202 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7583)) mapDefault!25667)))))

(declare-fun b!848966 () Bool)

(assert (=> b!848966 (= e!473771 (not true))))

(assert (=> b!848966 e!473767))

(declare-fun c!91816 () Bool)

(assert (=> b!848966 (= c!91816 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28970 0))(
  ( (Unit!28971) )
))
(declare-fun lt!382271 () Unit!28970)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!321 (array!48349 array!48351 (_ BitVec 32) (_ BitVec 32) V!26441 V!26441 (_ BitVec 32) (_ BitVec 64) V!26441 (_ BitVec 32) Int) Unit!28970)

(assert (=> b!848966 (= lt!382271 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!321 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37625 () Bool)

(assert (=> bm!37625 (= call!37627 (getCurrentListMapNoExtraKeys!2696 _keys!868 lt!382272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73162 res!576524) b!848958))

(assert (= (and b!848958 res!576523) b!848963))

(assert (= (and b!848963 res!576525) b!848957))

(assert (= (and b!848957 res!576521) b!848956))

(assert (= (and b!848956 res!576519) b!848961))

(assert (= (and b!848961 res!576526) b!848959))

(assert (= (and b!848959 res!576520) b!848960))

(assert (= (and b!848960 res!576522) b!848955))

(assert (= (and b!848955 res!576518) b!848966))

(assert (= (and b!848966 c!91816) b!848962))

(assert (= (and b!848966 (not c!91816)) b!848964))

(assert (= (or b!848962 b!848964) bm!37625))

(assert (= (or b!848962 b!848964) bm!37624))

(assert (= (and b!848965 condMapEmpty!25667) mapIsEmpty!25667))

(assert (= (and b!848965 (not condMapEmpty!25667)) mapNonEmpty!25667))

(get-info :version)

(assert (= (and mapNonEmpty!25667 ((_ is ValueCellFull!7583) mapValue!25667)) b!848954))

(assert (= (and b!848965 ((_ is ValueCellFull!7583) mapDefault!25667)) b!848953))

(assert (= start!73162 b!848965))

(declare-fun m!790235 () Bool)

(assert (=> b!848958 m!790235))

(declare-fun m!790237 () Bool)

(assert (=> mapNonEmpty!25667 m!790237))

(declare-fun m!790239 () Bool)

(assert (=> b!848957 m!790239))

(declare-fun m!790241 () Bool)

(assert (=> b!848956 m!790241))

(declare-fun m!790243 () Bool)

(assert (=> b!848962 m!790243))

(declare-fun m!790245 () Bool)

(assert (=> start!73162 m!790245))

(declare-fun m!790247 () Bool)

(assert (=> start!73162 m!790247))

(declare-fun m!790249 () Bool)

(assert (=> b!848966 m!790249))

(declare-fun m!790251 () Bool)

(assert (=> b!848960 m!790251))

(declare-fun m!790253 () Bool)

(assert (=> b!848955 m!790253))

(declare-fun m!790255 () Bool)

(assert (=> b!848955 m!790255))

(declare-fun m!790257 () Bool)

(assert (=> b!848955 m!790257))

(declare-fun m!790259 () Bool)

(assert (=> bm!37624 m!790259))

(declare-fun m!790261 () Bool)

(assert (=> b!848959 m!790261))

(declare-fun m!790263 () Bool)

(assert (=> bm!37625 m!790263))

(check-sat (not b!848962) (not bm!37624) (not b!848959) (not b_next!13909) (not b!848966) (not b!848958) (not b!848957) (not b!848956) (not bm!37625) (not start!73162) (not b!848955) tp_is_empty!16045 (not mapNonEmpty!25667) b_and!23005)
(check-sat b_and!23005 (not b_next!13909))
