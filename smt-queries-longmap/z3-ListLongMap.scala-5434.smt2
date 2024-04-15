; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72370 () Bool)

(assert start!72370)

(declare-fun b_free!13573 () Bool)

(declare-fun b_next!13573 () Bool)

(assert (=> start!72370 (= b_free!13573 (not b_next!13573))))

(declare-fun tp!47819 () Bool)

(declare-fun b_and!22633 () Bool)

(assert (=> start!72370 (= tp!47819 b_and!22633)))

(declare-fun b!838746 () Bool)

(declare-fun res!570362 () Bool)

(declare-fun e!468123 () Bool)

(assert (=> b!838746 (=> (not res!570362) (not e!468123))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838746 (= res!570362 (validKeyInArray!0 k0!854))))

(declare-fun b!838748 () Bool)

(declare-fun res!570356 () Bool)

(assert (=> b!838748 (=> (not res!570356) (not e!468123))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47139 0))(
  ( (array!47140 (arr!22601 (Array (_ BitVec 32) (_ BitVec 64))) (size!23043 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47139)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!838748 (= res!570356 (and (= (select (arr!22601 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23043 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838749 () Bool)

(assert (=> b!838749 (= e!468123 (not true))))

(declare-fun e!468121 () Bool)

(assert (=> b!838749 e!468121))

(declare-fun c!91154 () Bool)

(assert (=> b!838749 (= c!91154 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25633 0))(
  ( (V!25634 (val!7767 Int)) )
))
(declare-fun v!557 () V!25633)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28759 0))(
  ( (Unit!28760) )
))
(declare-fun lt!380489 () Unit!28759)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7280 0))(
  ( (ValueCellFull!7280 (v!10186 V!25633)) (EmptyCell!7280) )
))
(declare-datatypes ((array!47141 0))(
  ( (array!47142 (arr!22602 (Array (_ BitVec 32) ValueCell!7280)) (size!23044 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47141)

(declare-fun minValue!654 () V!25633)

(declare-fun zeroValue!654 () V!25633)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!254 (array!47139 array!47141 (_ BitVec 32) (_ BitVec 32) V!25633 V!25633 (_ BitVec 32) (_ BitVec 64) V!25633 (_ BitVec 32) Int) Unit!28759)

(assert (=> b!838749 (= lt!380489 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((tuple2!10292 0))(
  ( (tuple2!10293 (_1!5157 (_ BitVec 64)) (_2!5157 V!25633)) )
))
(declare-datatypes ((List!16083 0))(
  ( (Nil!16080) (Cons!16079 (h!17210 tuple2!10292) (t!22445 List!16083)) )
))
(declare-datatypes ((ListLongMap!9051 0))(
  ( (ListLongMap!9052 (toList!4541 List!16083)) )
))
(declare-fun call!36927 () ListLongMap!9051)

(declare-fun call!36926 () ListLongMap!9051)

(declare-fun b!838750 () Bool)

(declare-fun +!2038 (ListLongMap!9051 tuple2!10292) ListLongMap!9051)

(assert (=> b!838750 (= e!468121 (= call!36927 (+!2038 call!36926 (tuple2!10293 k0!854 v!557))))))

(declare-fun b!838751 () Bool)

(assert (=> b!838751 (= e!468121 (= call!36927 call!36926))))

(declare-fun b!838752 () Bool)

(declare-fun res!570360 () Bool)

(assert (=> b!838752 (=> (not res!570360) (not e!468123))))

(assert (=> b!838752 (= res!570360 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23043 _keys!868))))))

(declare-fun b!838753 () Bool)

(declare-fun res!570363 () Bool)

(assert (=> b!838753 (=> (not res!570363) (not e!468123))))

(assert (=> b!838753 (= res!570363 (and (= (size!23044 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23043 _keys!868) (size!23044 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838754 () Bool)

(declare-fun res!570359 () Bool)

(assert (=> b!838754 (=> (not res!570359) (not e!468123))))

(declare-datatypes ((List!16084 0))(
  ( (Nil!16081) (Cons!16080 (h!17211 (_ BitVec 64)) (t!22446 List!16084)) )
))
(declare-fun arrayNoDuplicates!0 (array!47139 (_ BitVec 32) List!16084) Bool)

(assert (=> b!838754 (= res!570359 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16081))))

(declare-fun b!838755 () Bool)

(declare-fun res!570358 () Bool)

(assert (=> b!838755 (=> (not res!570358) (not e!468123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47139 (_ BitVec 32)) Bool)

(assert (=> b!838755 (= res!570358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838756 () Bool)

(declare-fun res!570357 () Bool)

(assert (=> b!838756 (=> (not res!570357) (not e!468123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838756 (= res!570357 (validMask!0 mask!1196))))

(declare-fun b!838757 () Bool)

(declare-fun e!468126 () Bool)

(declare-fun e!468125 () Bool)

(declare-fun mapRes!24758 () Bool)

(assert (=> b!838757 (= e!468126 (and e!468125 mapRes!24758))))

(declare-fun condMapEmpty!24758 () Bool)

(declare-fun mapDefault!24758 () ValueCell!7280)

(assert (=> b!838757 (= condMapEmpty!24758 (= (arr!22602 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7280)) mapDefault!24758)))))

(declare-fun mapIsEmpty!24758 () Bool)

(assert (=> mapIsEmpty!24758 mapRes!24758))

(declare-fun bm!36923 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2561 (array!47139 array!47141 (_ BitVec 32) (_ BitVec 32) V!25633 V!25633 (_ BitVec 32) Int) ListLongMap!9051)

(assert (=> bm!36923 (= call!36926 (getCurrentListMapNoExtraKeys!2561 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!36924 () Bool)

(assert (=> bm!36924 (= call!36927 (getCurrentListMapNoExtraKeys!2561 _keys!868 (array!47142 (store (arr!22602 _values!688) i!612 (ValueCellFull!7280 v!557)) (size!23044 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838747 () Bool)

(declare-fun e!468122 () Bool)

(declare-fun tp_is_empty!15439 () Bool)

(assert (=> b!838747 (= e!468122 tp_is_empty!15439)))

(declare-fun res!570361 () Bool)

(assert (=> start!72370 (=> (not res!570361) (not e!468123))))

(assert (=> start!72370 (= res!570361 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23043 _keys!868))))))

(assert (=> start!72370 e!468123))

(assert (=> start!72370 tp_is_empty!15439))

(assert (=> start!72370 true))

(assert (=> start!72370 tp!47819))

(declare-fun array_inv!18074 (array!47139) Bool)

(assert (=> start!72370 (array_inv!18074 _keys!868)))

(declare-fun array_inv!18075 (array!47141) Bool)

(assert (=> start!72370 (and (array_inv!18075 _values!688) e!468126)))

(declare-fun b!838758 () Bool)

(assert (=> b!838758 (= e!468125 tp_is_empty!15439)))

(declare-fun mapNonEmpty!24758 () Bool)

(declare-fun tp!47818 () Bool)

(assert (=> mapNonEmpty!24758 (= mapRes!24758 (and tp!47818 e!468122))))

(declare-fun mapValue!24758 () ValueCell!7280)

(declare-fun mapRest!24758 () (Array (_ BitVec 32) ValueCell!7280))

(declare-fun mapKey!24758 () (_ BitVec 32))

(assert (=> mapNonEmpty!24758 (= (arr!22602 _values!688) (store mapRest!24758 mapKey!24758 mapValue!24758))))

(assert (= (and start!72370 res!570361) b!838756))

(assert (= (and b!838756 res!570357) b!838753))

(assert (= (and b!838753 res!570363) b!838755))

(assert (= (and b!838755 res!570358) b!838754))

(assert (= (and b!838754 res!570359) b!838752))

(assert (= (and b!838752 res!570360) b!838746))

(assert (= (and b!838746 res!570362) b!838748))

(assert (= (and b!838748 res!570356) b!838749))

(assert (= (and b!838749 c!91154) b!838750))

(assert (= (and b!838749 (not c!91154)) b!838751))

(assert (= (or b!838750 b!838751) bm!36924))

(assert (= (or b!838750 b!838751) bm!36923))

(assert (= (and b!838757 condMapEmpty!24758) mapIsEmpty!24758))

(assert (= (and b!838757 (not condMapEmpty!24758)) mapNonEmpty!24758))

(get-info :version)

(assert (= (and mapNonEmpty!24758 ((_ is ValueCellFull!7280) mapValue!24758)) b!838747))

(assert (= (and b!838757 ((_ is ValueCellFull!7280) mapDefault!24758)) b!838758))

(assert (= start!72370 b!838757))

(declare-fun m!782489 () Bool)

(assert (=> b!838746 m!782489))

(declare-fun m!782491 () Bool)

(assert (=> start!72370 m!782491))

(declare-fun m!782493 () Bool)

(assert (=> start!72370 m!782493))

(declare-fun m!782495 () Bool)

(assert (=> bm!36924 m!782495))

(declare-fun m!782497 () Bool)

(assert (=> bm!36924 m!782497))

(declare-fun m!782499 () Bool)

(assert (=> b!838748 m!782499))

(declare-fun m!782501 () Bool)

(assert (=> b!838755 m!782501))

(declare-fun m!782503 () Bool)

(assert (=> b!838749 m!782503))

(declare-fun m!782505 () Bool)

(assert (=> b!838756 m!782505))

(declare-fun m!782507 () Bool)

(assert (=> b!838754 m!782507))

(declare-fun m!782509 () Bool)

(assert (=> mapNonEmpty!24758 m!782509))

(declare-fun m!782511 () Bool)

(assert (=> bm!36923 m!782511))

(declare-fun m!782513 () Bool)

(assert (=> b!838750 m!782513))

(check-sat (not mapNonEmpty!24758) (not b!838746) (not bm!36924) b_and!22633 (not b!838756) (not bm!36923) (not b!838755) (not b_next!13573) (not b!838754) tp_is_empty!15439 (not b!838750) (not start!72370) (not b!838749))
(check-sat b_and!22633 (not b_next!13573))
