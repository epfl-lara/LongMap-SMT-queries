; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72616 () Bool)

(assert start!72616)

(declare-fun b_free!13633 () Bool)

(declare-fun b_next!13633 () Bool)

(assert (=> start!72616 (= b_free!13633 (not b_next!13633))))

(declare-fun tp!47998 () Bool)

(declare-fun b_and!22729 () Bool)

(assert (=> start!72616 (= tp!47998 b_and!22729)))

(declare-datatypes ((V!25713 0))(
  ( (V!25714 (val!7797 Int)) )
))
(declare-datatypes ((tuple2!10262 0))(
  ( (tuple2!10263 (_1!5142 (_ BitVec 64)) (_2!5142 V!25713)) )
))
(declare-datatypes ((List!16038 0))(
  ( (Nil!16035) (Cons!16034 (h!17171 tuple2!10262) (t!22401 List!16038)) )
))
(declare-datatypes ((ListLongMap!9033 0))(
  ( (ListLongMap!9034 (toList!4532 List!16038)) )
))
(declare-fun call!37177 () ListLongMap!9033)

(declare-fun v!557 () V!25713)

(declare-fun b!841058 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun e!469392 () Bool)

(declare-fun call!37178 () ListLongMap!9033)

(declare-fun +!2042 (ListLongMap!9033 tuple2!10262) ListLongMap!9033)

(assert (=> b!841058 (= e!469392 (= call!37177 (+!2042 call!37178 (tuple2!10263 k0!854 v!557))))))

(declare-fun bm!37174 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47293 0))(
  ( (array!47294 (arr!22673 (Array (_ BitVec 32) (_ BitVec 64))) (size!23114 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47293)

(declare-datatypes ((ValueCell!7310 0))(
  ( (ValueCellFull!7310 (v!10222 V!25713)) (EmptyCell!7310) )
))
(declare-datatypes ((array!47295 0))(
  ( (array!47296 (arr!22674 (Array (_ BitVec 32) ValueCell!7310)) (size!23115 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47295)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25713)

(declare-fun zeroValue!654 () V!25713)

(declare-fun getCurrentListMapNoExtraKeys!2594 (array!47293 array!47295 (_ BitVec 32) (_ BitVec 32) V!25713 V!25713 (_ BitVec 32) Int) ListLongMap!9033)

(assert (=> bm!37174 (= call!37178 (getCurrentListMapNoExtraKeys!2594 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841059 () Bool)

(declare-fun e!469391 () Bool)

(assert (=> b!841059 (= e!469391 (not true))))

(assert (=> b!841059 e!469392))

(declare-fun c!91591 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841059 (= c!91591 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28870 0))(
  ( (Unit!28871) )
))
(declare-fun lt!381176 () Unit!28870)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!271 (array!47293 array!47295 (_ BitVec 32) (_ BitVec 32) V!25713 V!25713 (_ BitVec 32) (_ BitVec 64) V!25713 (_ BitVec 32) Int) Unit!28870)

(assert (=> b!841059 (= lt!381176 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841060 () Bool)

(declare-fun res!571534 () Bool)

(assert (=> b!841060 (=> (not res!571534) (not e!469391))))

(assert (=> b!841060 (= res!571534 (and (= (size!23115 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23114 _keys!868) (size!23115 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841061 () Bool)

(assert (=> b!841061 (= e!469392 (= call!37177 call!37178))))

(declare-fun b!841062 () Bool)

(declare-fun res!571537 () Bool)

(assert (=> b!841062 (=> (not res!571537) (not e!469391))))

(assert (=> b!841062 (= res!571537 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23114 _keys!868))))))

(declare-fun bm!37175 () Bool)

(assert (=> bm!37175 (= call!37177 (getCurrentListMapNoExtraKeys!2594 _keys!868 (array!47296 (store (arr!22674 _values!688) i!612 (ValueCellFull!7310 v!557)) (size!23115 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841063 () Bool)

(declare-fun e!469395 () Bool)

(declare-fun tp_is_empty!15499 () Bool)

(assert (=> b!841063 (= e!469395 tp_is_empty!15499)))

(declare-fun res!571533 () Bool)

(assert (=> start!72616 (=> (not res!571533) (not e!469391))))

(assert (=> start!72616 (= res!571533 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23114 _keys!868))))))

(assert (=> start!72616 e!469391))

(assert (=> start!72616 tp_is_empty!15499))

(assert (=> start!72616 true))

(assert (=> start!72616 tp!47998))

(declare-fun array_inv!18094 (array!47293) Bool)

(assert (=> start!72616 (array_inv!18094 _keys!868)))

(declare-fun e!469396 () Bool)

(declare-fun array_inv!18095 (array!47295) Bool)

(assert (=> start!72616 (and (array_inv!18095 _values!688) e!469396)))

(declare-fun b!841064 () Bool)

(declare-fun res!571532 () Bool)

(assert (=> b!841064 (=> (not res!571532) (not e!469391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47293 (_ BitVec 32)) Bool)

(assert (=> b!841064 (= res!571532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841065 () Bool)

(declare-fun res!571536 () Bool)

(assert (=> b!841065 (=> (not res!571536) (not e!469391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841065 (= res!571536 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!24848 () Bool)

(declare-fun mapRes!24848 () Bool)

(assert (=> mapIsEmpty!24848 mapRes!24848))

(declare-fun mapNonEmpty!24848 () Bool)

(declare-fun tp!47999 () Bool)

(assert (=> mapNonEmpty!24848 (= mapRes!24848 (and tp!47999 e!469395))))

(declare-fun mapValue!24848 () ValueCell!7310)

(declare-fun mapKey!24848 () (_ BitVec 32))

(declare-fun mapRest!24848 () (Array (_ BitVec 32) ValueCell!7310))

(assert (=> mapNonEmpty!24848 (= (arr!22674 _values!688) (store mapRest!24848 mapKey!24848 mapValue!24848))))

(declare-fun b!841066 () Bool)

(declare-fun res!571530 () Bool)

(assert (=> b!841066 (=> (not res!571530) (not e!469391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841066 (= res!571530 (validMask!0 mask!1196))))

(declare-fun b!841067 () Bool)

(declare-fun e!469393 () Bool)

(assert (=> b!841067 (= e!469396 (and e!469393 mapRes!24848))))

(declare-fun condMapEmpty!24848 () Bool)

(declare-fun mapDefault!24848 () ValueCell!7310)

(assert (=> b!841067 (= condMapEmpty!24848 (= (arr!22674 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7310)) mapDefault!24848)))))

(declare-fun b!841068 () Bool)

(assert (=> b!841068 (= e!469393 tp_is_empty!15499)))

(declare-fun b!841069 () Bool)

(declare-fun res!571531 () Bool)

(assert (=> b!841069 (=> (not res!571531) (not e!469391))))

(declare-datatypes ((List!16039 0))(
  ( (Nil!16036) (Cons!16035 (h!17172 (_ BitVec 64)) (t!22402 List!16039)) )
))
(declare-fun arrayNoDuplicates!0 (array!47293 (_ BitVec 32) List!16039) Bool)

(assert (=> b!841069 (= res!571531 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16036))))

(declare-fun b!841070 () Bool)

(declare-fun res!571535 () Bool)

(assert (=> b!841070 (=> (not res!571535) (not e!469391))))

(assert (=> b!841070 (= res!571535 (and (= (select (arr!22673 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23114 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72616 res!571533) b!841066))

(assert (= (and b!841066 res!571530) b!841060))

(assert (= (and b!841060 res!571534) b!841064))

(assert (= (and b!841064 res!571532) b!841069))

(assert (= (and b!841069 res!571531) b!841062))

(assert (= (and b!841062 res!571537) b!841065))

(assert (= (and b!841065 res!571536) b!841070))

(assert (= (and b!841070 res!571535) b!841059))

(assert (= (and b!841059 c!91591) b!841058))

(assert (= (and b!841059 (not c!91591)) b!841061))

(assert (= (or b!841058 b!841061) bm!37175))

(assert (= (or b!841058 b!841061) bm!37174))

(assert (= (and b!841067 condMapEmpty!24848) mapIsEmpty!24848))

(assert (= (and b!841067 (not condMapEmpty!24848)) mapNonEmpty!24848))

(get-info :version)

(assert (= (and mapNonEmpty!24848 ((_ is ValueCellFull!7310) mapValue!24848)) b!841063))

(assert (= (and b!841067 ((_ is ValueCellFull!7310) mapDefault!24848)) b!841068))

(assert (= start!72616 b!841067))

(declare-fun m!785315 () Bool)

(assert (=> start!72616 m!785315))

(declare-fun m!785317 () Bool)

(assert (=> start!72616 m!785317))

(declare-fun m!785319 () Bool)

(assert (=> b!841070 m!785319))

(declare-fun m!785321 () Bool)

(assert (=> bm!37175 m!785321))

(declare-fun m!785323 () Bool)

(assert (=> bm!37175 m!785323))

(declare-fun m!785325 () Bool)

(assert (=> mapNonEmpty!24848 m!785325))

(declare-fun m!785327 () Bool)

(assert (=> b!841069 m!785327))

(declare-fun m!785329 () Bool)

(assert (=> b!841064 m!785329))

(declare-fun m!785331 () Bool)

(assert (=> b!841059 m!785331))

(declare-fun m!785333 () Bool)

(assert (=> b!841066 m!785333))

(declare-fun m!785335 () Bool)

(assert (=> b!841065 m!785335))

(declare-fun m!785337 () Bool)

(assert (=> b!841058 m!785337))

(declare-fun m!785339 () Bool)

(assert (=> bm!37174 m!785339))

(check-sat tp_is_empty!15499 (not start!72616) (not b!841059) (not b!841065) (not b!841066) b_and!22729 (not b_next!13633) (not bm!37174) (not b!841064) (not b!841058) (not b!841069) (not mapNonEmpty!24848) (not bm!37175))
(check-sat b_and!22729 (not b_next!13633))
