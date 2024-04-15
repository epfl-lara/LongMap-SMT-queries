; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72982 () Bool)

(assert start!72982)

(declare-fun b_free!13915 () Bool)

(declare-fun b_next!13915 () Bool)

(assert (=> start!72982 (= b_free!13915 (not b_next!13915))))

(declare-fun tp!49250 () Bool)

(declare-fun b_and!22975 () Bool)

(assert (=> start!72982 (= tp!49250 b_and!22975)))

(declare-fun mapNonEmpty!25676 () Bool)

(declare-fun mapRes!25676 () Bool)

(declare-fun tp!49249 () Bool)

(declare-fun e!473102 () Bool)

(assert (=> mapNonEmpty!25676 (= mapRes!25676 (and tp!49249 e!473102))))

(declare-datatypes ((V!26449 0))(
  ( (V!26450 (val!8073 Int)) )
))
(declare-datatypes ((ValueCell!7586 0))(
  ( (ValueCellFull!7586 (v!10492 V!26449)) (EmptyCell!7586) )
))
(declare-fun mapValue!25676 () ValueCell!7586)

(declare-fun mapKey!25676 () (_ BitVec 32))

(declare-fun mapRest!25676 () (Array (_ BitVec 32) ValueCell!7586))

(declare-datatypes ((array!48309 0))(
  ( (array!48310 (arr!23186 (Array (_ BitVec 32) ValueCell!7586)) (size!23628 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48309)

(assert (=> mapNonEmpty!25676 (= (arr!23186 _values!688) (store mapRest!25676 mapKey!25676 mapValue!25676))))

(declare-fun b!847937 () Bool)

(declare-fun res!576151 () Bool)

(declare-fun e!473105 () Bool)

(assert (=> b!847937 (=> (not res!576151) (not e!473105))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48311 0))(
  ( (array!48312 (arr!23187 (Array (_ BitVec 32) (_ BitVec 64))) (size!23629 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48311)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847937 (= res!576151 (and (= (select (arr!23187 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!37571 () Bool)

(declare-fun lt!381711 () array!48309)

(declare-fun minValue!654 () V!26449)

(declare-fun zeroValue!654 () V!26449)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10582 0))(
  ( (tuple2!10583 (_1!5302 (_ BitVec 64)) (_2!5302 V!26449)) )
))
(declare-datatypes ((List!16435 0))(
  ( (Nil!16432) (Cons!16431 (h!17562 tuple2!10582) (t!22797 List!16435)) )
))
(declare-datatypes ((ListLongMap!9341 0))(
  ( (ListLongMap!9342 (toList!4686 List!16435)) )
))
(declare-fun call!37575 () ListLongMap!9341)

(declare-fun getCurrentListMapNoExtraKeys!2699 (array!48311 array!48309 (_ BitVec 32) (_ BitVec 32) V!26449 V!26449 (_ BitVec 32) Int) ListLongMap!9341)

(assert (=> bm!37571 (= call!37575 (getCurrentListMapNoExtraKeys!2699 _keys!868 lt!381711 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847938 () Bool)

(declare-fun res!576153 () Bool)

(assert (=> b!847938 (=> (not res!576153) (not e!473105))))

(assert (=> b!847938 (= res!576153 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23629 _keys!868))))))

(declare-fun b!847939 () Bool)

(declare-fun res!576149 () Bool)

(assert (=> b!847939 (=> (not res!576149) (not e!473105))))

(declare-datatypes ((List!16436 0))(
  ( (Nil!16433) (Cons!16432 (h!17563 (_ BitVec 64)) (t!22798 List!16436)) )
))
(declare-fun arrayNoDuplicates!0 (array!48311 (_ BitVec 32) List!16436) Bool)

(assert (=> b!847939 (= res!576149 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16433))))

(declare-fun b!847940 () Bool)

(declare-fun e!473103 () Bool)

(declare-fun call!37574 () ListLongMap!9341)

(assert (=> b!847940 (= e!473103 (= call!37575 call!37574))))

(declare-fun b!847941 () Bool)

(declare-fun e!473100 () Bool)

(declare-fun e!473101 () Bool)

(assert (=> b!847941 (= e!473100 (and e!473101 mapRes!25676))))

(declare-fun condMapEmpty!25676 () Bool)

(declare-fun mapDefault!25676 () ValueCell!7586)

(assert (=> b!847941 (= condMapEmpty!25676 (= (arr!23186 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7586)) mapDefault!25676)))))

(declare-fun bm!37572 () Bool)

(assert (=> bm!37572 (= call!37574 (getCurrentListMapNoExtraKeys!2699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847942 () Bool)

(declare-fun e!473106 () Bool)

(assert (=> b!847942 (= e!473105 e!473106)))

(declare-fun res!576146 () Bool)

(assert (=> b!847942 (=> (not res!576146) (not e!473106))))

(assert (=> b!847942 (= res!576146 (= from!1053 i!612))))

(declare-fun lt!381713 () ListLongMap!9341)

(assert (=> b!847942 (= lt!381713 (getCurrentListMapNoExtraKeys!2699 _keys!868 lt!381711 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26449)

(assert (=> b!847942 (= lt!381711 (array!48310 (store (arr!23186 _values!688) i!612 (ValueCellFull!7586 v!557)) (size!23628 _values!688)))))

(declare-fun lt!381710 () ListLongMap!9341)

(assert (=> b!847942 (= lt!381710 (getCurrentListMapNoExtraKeys!2699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847943 () Bool)

(declare-fun res!576150 () Bool)

(assert (=> b!847943 (=> (not res!576150) (not e!473105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847943 (= res!576150 (validMask!0 mask!1196))))

(declare-fun b!847944 () Bool)

(declare-fun res!576147 () Bool)

(assert (=> b!847944 (=> (not res!576147) (not e!473105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48311 (_ BitVec 32)) Bool)

(assert (=> b!847944 (= res!576147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847945 () Bool)

(declare-fun +!2116 (ListLongMap!9341 tuple2!10582) ListLongMap!9341)

(assert (=> b!847945 (= e!473103 (= call!37575 (+!2116 call!37574 (tuple2!10583 k0!854 v!557))))))

(declare-fun b!847946 () Bool)

(assert (=> b!847946 (= e!473106 (not true))))

(assert (=> b!847946 e!473103))

(declare-fun c!91478 () Bool)

(assert (=> b!847946 (= c!91478 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28911 0))(
  ( (Unit!28912) )
))
(declare-fun lt!381712 () Unit!28911)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!330 (array!48311 array!48309 (_ BitVec 32) (_ BitVec 32) V!26449 V!26449 (_ BitVec 32) (_ BitVec 64) V!26449 (_ BitVec 32) Int) Unit!28911)

(assert (=> b!847946 (= lt!381712 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!330 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847947 () Bool)

(declare-fun res!576148 () Bool)

(assert (=> b!847947 (=> (not res!576148) (not e!473105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847947 (= res!576148 (validKeyInArray!0 k0!854))))

(declare-fun b!847948 () Bool)

(declare-fun res!576145 () Bool)

(assert (=> b!847948 (=> (not res!576145) (not e!473105))))

(assert (=> b!847948 (= res!576145 (and (= (size!23628 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23629 _keys!868) (size!23628 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25676 () Bool)

(assert (=> mapIsEmpty!25676 mapRes!25676))

(declare-fun res!576152 () Bool)

(assert (=> start!72982 (=> (not res!576152) (not e!473105))))

(assert (=> start!72982 (= res!576152 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23629 _keys!868))))))

(assert (=> start!72982 e!473105))

(declare-fun tp_is_empty!16051 () Bool)

(assert (=> start!72982 tp_is_empty!16051))

(assert (=> start!72982 true))

(assert (=> start!72982 tp!49250))

(declare-fun array_inv!18490 (array!48311) Bool)

(assert (=> start!72982 (array_inv!18490 _keys!868)))

(declare-fun array_inv!18491 (array!48309) Bool)

(assert (=> start!72982 (and (array_inv!18491 _values!688) e!473100)))

(declare-fun b!847949 () Bool)

(assert (=> b!847949 (= e!473101 tp_is_empty!16051)))

(declare-fun b!847950 () Bool)

(assert (=> b!847950 (= e!473102 tp_is_empty!16051)))

(assert (= (and start!72982 res!576152) b!847943))

(assert (= (and b!847943 res!576150) b!847948))

(assert (= (and b!847948 res!576145) b!847944))

(assert (= (and b!847944 res!576147) b!847939))

(assert (= (and b!847939 res!576149) b!847938))

(assert (= (and b!847938 res!576153) b!847947))

(assert (= (and b!847947 res!576148) b!847937))

(assert (= (and b!847937 res!576151) b!847942))

(assert (= (and b!847942 res!576146) b!847946))

(assert (= (and b!847946 c!91478) b!847945))

(assert (= (and b!847946 (not c!91478)) b!847940))

(assert (= (or b!847945 b!847940) bm!37571))

(assert (= (or b!847945 b!847940) bm!37572))

(assert (= (and b!847941 condMapEmpty!25676) mapIsEmpty!25676))

(assert (= (and b!847941 (not condMapEmpty!25676)) mapNonEmpty!25676))

(get-info :version)

(assert (= (and mapNonEmpty!25676 ((_ is ValueCellFull!7586) mapValue!25676)) b!847950))

(assert (= (and b!847941 ((_ is ValueCellFull!7586) mapDefault!25676)) b!847949))

(assert (= start!72982 b!847941))

(declare-fun m!788279 () Bool)

(assert (=> mapNonEmpty!25676 m!788279))

(declare-fun m!788281 () Bool)

(assert (=> bm!37571 m!788281))

(declare-fun m!788283 () Bool)

(assert (=> b!847945 m!788283))

(declare-fun m!788285 () Bool)

(assert (=> bm!37572 m!788285))

(declare-fun m!788287 () Bool)

(assert (=> b!847939 m!788287))

(declare-fun m!788289 () Bool)

(assert (=> b!847947 m!788289))

(declare-fun m!788291 () Bool)

(assert (=> b!847944 m!788291))

(declare-fun m!788293 () Bool)

(assert (=> b!847937 m!788293))

(declare-fun m!788295 () Bool)

(assert (=> start!72982 m!788295))

(declare-fun m!788297 () Bool)

(assert (=> start!72982 m!788297))

(declare-fun m!788299 () Bool)

(assert (=> b!847942 m!788299))

(declare-fun m!788301 () Bool)

(assert (=> b!847942 m!788301))

(declare-fun m!788303 () Bool)

(assert (=> b!847942 m!788303))

(declare-fun m!788305 () Bool)

(assert (=> b!847946 m!788305))

(declare-fun m!788307 () Bool)

(assert (=> b!847943 m!788307))

(check-sat (not b!847943) (not bm!37571) (not b!847947) (not b!847944) b_and!22975 (not b!847942) (not bm!37572) (not b_next!13915) (not b!847939) (not mapNonEmpty!25676) (not b!847945) (not b!847946) (not start!72982) tp_is_empty!16051)
(check-sat b_and!22975 (not b_next!13915))
