; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72988 () Bool)

(assert start!72988)

(declare-fun b_free!13921 () Bool)

(declare-fun b_next!13921 () Bool)

(assert (=> start!72988 (= b_free!13921 (not b_next!13921))))

(declare-fun tp!49268 () Bool)

(declare-fun b_and!22981 () Bool)

(assert (=> start!72988 (= tp!49268 b_and!22981)))

(declare-fun b!848065 () Bool)

(declare-fun res!576237 () Bool)

(declare-fun e!473166 () Bool)

(assert (=> b!848065 (=> (not res!576237) (not e!473166))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48321 0))(
  ( (array!48322 (arr!23192 (Array (_ BitVec 32) (_ BitVec 64))) (size!23634 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48321)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!848065 (= res!576237 (and (= (select (arr!23192 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848066 () Bool)

(declare-fun e!473169 () Bool)

(declare-fun e!473171 () Bool)

(assert (=> b!848066 (= e!473169 (not e!473171))))

(declare-fun res!576234 () Bool)

(assert (=> b!848066 (=> res!576234 e!473171)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848066 (= res!576234 (not (validKeyInArray!0 (select (arr!23192 _keys!868) from!1053))))))

(declare-fun e!473167 () Bool)

(assert (=> b!848066 e!473167))

(declare-fun c!91487 () Bool)

(assert (=> b!848066 (= c!91487 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26457 0))(
  ( (V!26458 (val!8076 Int)) )
))
(declare-fun v!557 () V!26457)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7589 0))(
  ( (ValueCellFull!7589 (v!10495 V!26457)) (EmptyCell!7589) )
))
(declare-datatypes ((array!48323 0))(
  ( (array!48324 (arr!23193 (Array (_ BitVec 32) ValueCell!7589)) (size!23635 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48323)

(declare-fun minValue!654 () V!26457)

(declare-fun zeroValue!654 () V!26457)

(declare-datatypes ((Unit!28913 0))(
  ( (Unit!28914) )
))
(declare-fun lt!381747 () Unit!28913)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!331 (array!48321 array!48323 (_ BitVec 32) (_ BitVec 32) V!26457 V!26457 (_ BitVec 32) (_ BitVec 64) V!26457 (_ BitVec 32) Int) Unit!28913)

(assert (=> b!848066 (= lt!381747 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!331 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848067 () Bool)

(assert (=> b!848067 (= e!473171 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23634 _keys!868))))))

(declare-fun b!848069 () Bool)

(declare-fun res!576235 () Bool)

(assert (=> b!848069 (=> (not res!576235) (not e!473166))))

(assert (=> b!848069 (= res!576235 (and (= (size!23635 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23634 _keys!868) (size!23635 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848070 () Bool)

(declare-fun res!576236 () Bool)

(assert (=> b!848070 (=> (not res!576236) (not e!473166))))

(declare-datatypes ((List!16439 0))(
  ( (Nil!16436) (Cons!16435 (h!17566 (_ BitVec 64)) (t!22801 List!16439)) )
))
(declare-fun arrayNoDuplicates!0 (array!48321 (_ BitVec 32) List!16439) Bool)

(assert (=> b!848070 (= res!576236 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16436))))

(declare-fun lt!381749 () array!48323)

(declare-fun bm!37589 () Bool)

(declare-datatypes ((tuple2!10588 0))(
  ( (tuple2!10589 (_1!5305 (_ BitVec 64)) (_2!5305 V!26457)) )
))
(declare-datatypes ((List!16440 0))(
  ( (Nil!16437) (Cons!16436 (h!17567 tuple2!10588) (t!22802 List!16440)) )
))
(declare-datatypes ((ListLongMap!9347 0))(
  ( (ListLongMap!9348 (toList!4689 List!16440)) )
))
(declare-fun call!37592 () ListLongMap!9347)

(declare-fun getCurrentListMapNoExtraKeys!2701 (array!48321 array!48323 (_ BitVec 32) (_ BitVec 32) V!26457 V!26457 (_ BitVec 32) Int) ListLongMap!9347)

(assert (=> bm!37589 (= call!37592 (getCurrentListMapNoExtraKeys!2701 _keys!868 lt!381749 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848071 () Bool)

(declare-fun e!473165 () Bool)

(declare-fun tp_is_empty!16057 () Bool)

(assert (=> b!848071 (= e!473165 tp_is_empty!16057)))

(declare-fun b!848072 () Bool)

(assert (=> b!848072 (= e!473166 e!473169)))

(declare-fun res!576228 () Bool)

(assert (=> b!848072 (=> (not res!576228) (not e!473169))))

(assert (=> b!848072 (= res!576228 (= from!1053 i!612))))

(declare-fun lt!381748 () ListLongMap!9347)

(assert (=> b!848072 (= lt!381748 (getCurrentListMapNoExtraKeys!2701 _keys!868 lt!381749 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848072 (= lt!381749 (array!48324 (store (arr!23193 _values!688) i!612 (ValueCellFull!7589 v!557)) (size!23635 _values!688)))))

(declare-fun lt!381746 () ListLongMap!9347)

(assert (=> b!848072 (= lt!381746 (getCurrentListMapNoExtraKeys!2701 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25685 () Bool)

(declare-fun mapRes!25685 () Bool)

(declare-fun tp!49267 () Bool)

(declare-fun e!473170 () Bool)

(assert (=> mapNonEmpty!25685 (= mapRes!25685 (and tp!49267 e!473170))))

(declare-fun mapRest!25685 () (Array (_ BitVec 32) ValueCell!7589))

(declare-fun mapKey!25685 () (_ BitVec 32))

(declare-fun mapValue!25685 () ValueCell!7589)

(assert (=> mapNonEmpty!25685 (= (arr!23193 _values!688) (store mapRest!25685 mapKey!25685 mapValue!25685))))

(declare-fun b!848068 () Bool)

(declare-fun call!37593 () ListLongMap!9347)

(declare-fun +!2118 (ListLongMap!9347 tuple2!10588) ListLongMap!9347)

(assert (=> b!848068 (= e!473167 (= call!37592 (+!2118 call!37593 (tuple2!10589 k0!854 v!557))))))

(declare-fun res!576231 () Bool)

(assert (=> start!72988 (=> (not res!576231) (not e!473166))))

(assert (=> start!72988 (= res!576231 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23634 _keys!868))))))

(assert (=> start!72988 e!473166))

(assert (=> start!72988 tp_is_empty!16057))

(assert (=> start!72988 true))

(assert (=> start!72988 tp!49268))

(declare-fun array_inv!18494 (array!48321) Bool)

(assert (=> start!72988 (array_inv!18494 _keys!868)))

(declare-fun e!473168 () Bool)

(declare-fun array_inv!18495 (array!48323) Bool)

(assert (=> start!72988 (and (array_inv!18495 _values!688) e!473168)))

(declare-fun b!848073 () Bool)

(assert (=> b!848073 (= e!473170 tp_is_empty!16057)))

(declare-fun b!848074 () Bool)

(declare-fun res!576230 () Bool)

(assert (=> b!848074 (=> (not res!576230) (not e!473166))))

(assert (=> b!848074 (= res!576230 (validKeyInArray!0 k0!854))))

(declare-fun b!848075 () Bool)

(assert (=> b!848075 (= e!473168 (and e!473165 mapRes!25685))))

(declare-fun condMapEmpty!25685 () Bool)

(declare-fun mapDefault!25685 () ValueCell!7589)

(assert (=> b!848075 (= condMapEmpty!25685 (= (arr!23193 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7589)) mapDefault!25685)))))

(declare-fun bm!37590 () Bool)

(assert (=> bm!37590 (= call!37593 (getCurrentListMapNoExtraKeys!2701 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848076 () Bool)

(declare-fun res!576229 () Bool)

(assert (=> b!848076 (=> (not res!576229) (not e!473166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48321 (_ BitVec 32)) Bool)

(assert (=> b!848076 (= res!576229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25685 () Bool)

(assert (=> mapIsEmpty!25685 mapRes!25685))

(declare-fun b!848077 () Bool)

(declare-fun res!576233 () Bool)

(assert (=> b!848077 (=> (not res!576233) (not e!473166))))

(assert (=> b!848077 (= res!576233 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23634 _keys!868))))))

(declare-fun b!848078 () Bool)

(declare-fun res!576232 () Bool)

(assert (=> b!848078 (=> (not res!576232) (not e!473166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848078 (= res!576232 (validMask!0 mask!1196))))

(declare-fun b!848079 () Bool)

(assert (=> b!848079 (= e!473167 (= call!37592 call!37593))))

(assert (= (and start!72988 res!576231) b!848078))

(assert (= (and b!848078 res!576232) b!848069))

(assert (= (and b!848069 res!576235) b!848076))

(assert (= (and b!848076 res!576229) b!848070))

(assert (= (and b!848070 res!576236) b!848077))

(assert (= (and b!848077 res!576233) b!848074))

(assert (= (and b!848074 res!576230) b!848065))

(assert (= (and b!848065 res!576237) b!848072))

(assert (= (and b!848072 res!576228) b!848066))

(assert (= (and b!848066 c!91487) b!848068))

(assert (= (and b!848066 (not c!91487)) b!848079))

(assert (= (or b!848068 b!848079) bm!37590))

(assert (= (or b!848068 b!848079) bm!37589))

(assert (= (and b!848066 (not res!576234)) b!848067))

(assert (= (and b!848075 condMapEmpty!25685) mapIsEmpty!25685))

(assert (= (and b!848075 (not condMapEmpty!25685)) mapNonEmpty!25685))

(get-info :version)

(assert (= (and mapNonEmpty!25685 ((_ is ValueCellFull!7589) mapValue!25685)) b!848073))

(assert (= (and b!848075 ((_ is ValueCellFull!7589) mapDefault!25685)) b!848071))

(assert (= start!72988 b!848075))

(declare-fun m!788369 () Bool)

(assert (=> mapNonEmpty!25685 m!788369))

(declare-fun m!788371 () Bool)

(assert (=> b!848070 m!788371))

(declare-fun m!788373 () Bool)

(assert (=> b!848065 m!788373))

(declare-fun m!788375 () Bool)

(assert (=> start!72988 m!788375))

(declare-fun m!788377 () Bool)

(assert (=> start!72988 m!788377))

(declare-fun m!788379 () Bool)

(assert (=> b!848078 m!788379))

(declare-fun m!788381 () Bool)

(assert (=> bm!37590 m!788381))

(declare-fun m!788383 () Bool)

(assert (=> b!848072 m!788383))

(declare-fun m!788385 () Bool)

(assert (=> b!848072 m!788385))

(declare-fun m!788387 () Bool)

(assert (=> b!848072 m!788387))

(declare-fun m!788389 () Bool)

(assert (=> bm!37589 m!788389))

(declare-fun m!788391 () Bool)

(assert (=> b!848066 m!788391))

(assert (=> b!848066 m!788391))

(declare-fun m!788393 () Bool)

(assert (=> b!848066 m!788393))

(declare-fun m!788395 () Bool)

(assert (=> b!848066 m!788395))

(declare-fun m!788397 () Bool)

(assert (=> b!848076 m!788397))

(declare-fun m!788399 () Bool)

(assert (=> b!848074 m!788399))

(declare-fun m!788401 () Bool)

(assert (=> b!848068 m!788401))

(check-sat (not b!848076) (not b!848068) (not b!848072) (not bm!37590) tp_is_empty!16057 (not b!848066) (not b!848078) b_and!22981 (not bm!37589) (not b_next!13921) (not mapNonEmpty!25685) (not b!848070) (not start!72988) (not b!848074))
(check-sat b_and!22981 (not b_next!13921))
