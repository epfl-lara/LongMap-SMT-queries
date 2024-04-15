; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72496 () Bool)

(assert start!72496)

(declare-fun b_free!13699 () Bool)

(declare-fun b_next!13699 () Bool)

(assert (=> start!72496 (= b_free!13699 (not b_next!13699))))

(declare-fun tp!48196 () Bool)

(declare-fun b_and!22759 () Bool)

(assert (=> start!72496 (= tp!48196 b_and!22759)))

(declare-fun res!571869 () Bool)

(declare-fun e!469260 () Bool)

(assert (=> start!72496 (=> (not res!571869) (not e!469260))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47383 0))(
  ( (array!47384 (arr!22723 (Array (_ BitVec 32) (_ BitVec 64))) (size!23165 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47383)

(assert (=> start!72496 (= res!571869 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23165 _keys!868))))))

(assert (=> start!72496 e!469260))

(declare-fun tp_is_empty!15565 () Bool)

(assert (=> start!72496 tp_is_empty!15565))

(assert (=> start!72496 true))

(assert (=> start!72496 tp!48196))

(declare-fun array_inv!18158 (array!47383) Bool)

(assert (=> start!72496 (array_inv!18158 _keys!868)))

(declare-datatypes ((V!25801 0))(
  ( (V!25802 (val!7830 Int)) )
))
(declare-datatypes ((ValueCell!7343 0))(
  ( (ValueCellFull!7343 (v!10249 V!25801)) (EmptyCell!7343) )
))
(declare-datatypes ((array!47385 0))(
  ( (array!47386 (arr!22724 (Array (_ BitVec 32) ValueCell!7343)) (size!23166 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47385)

(declare-fun e!469256 () Bool)

(declare-fun array_inv!18159 (array!47385) Bool)

(assert (=> start!72496 (and (array_inv!18159 _values!688) e!469256)))

(declare-fun b!841203 () Bool)

(declare-fun res!571874 () Bool)

(assert (=> b!841203 (=> (not res!571874) (not e!469260))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841203 (= res!571874 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23165 _keys!868))))))

(declare-fun b!841204 () Bool)

(assert (=> b!841204 (= e!469260 (not true))))

(declare-fun e!469255 () Bool)

(assert (=> b!841204 e!469255))

(declare-fun c!91343 () Bool)

(assert (=> b!841204 (= c!91343 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!25801)

(declare-fun zeroValue!654 () V!25801)

(declare-fun v!557 () V!25801)

(declare-datatypes ((Unit!28845 0))(
  ( (Unit!28846) )
))
(declare-fun lt!380678 () Unit!28845)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!297 (array!47383 array!47385 (_ BitVec 32) (_ BitVec 32) V!25801 V!25801 (_ BitVec 32) (_ BitVec 64) V!25801 (_ BitVec 32) Int) Unit!28845)

(assert (=> b!841204 (= lt!380678 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24947 () Bool)

(declare-fun mapRes!24947 () Bool)

(declare-fun tp!48197 () Bool)

(declare-fun e!469259 () Bool)

(assert (=> mapNonEmpty!24947 (= mapRes!24947 (and tp!48197 e!469259))))

(declare-fun mapValue!24947 () ValueCell!7343)

(declare-fun mapRest!24947 () (Array (_ BitVec 32) ValueCell!7343))

(declare-fun mapKey!24947 () (_ BitVec 32))

(assert (=> mapNonEmpty!24947 (= (arr!22724 _values!688) (store mapRest!24947 mapKey!24947 mapValue!24947))))

(declare-fun b!841205 () Bool)

(declare-datatypes ((tuple2!10408 0))(
  ( (tuple2!10409 (_1!5215 (_ BitVec 64)) (_2!5215 V!25801)) )
))
(declare-datatypes ((List!16179 0))(
  ( (Nil!16176) (Cons!16175 (h!17306 tuple2!10408) (t!22541 List!16179)) )
))
(declare-datatypes ((ListLongMap!9167 0))(
  ( (ListLongMap!9168 (toList!4599 List!16179)) )
))
(declare-fun call!37304 () ListLongMap!9167)

(declare-fun call!37305 () ListLongMap!9167)

(declare-fun +!2082 (ListLongMap!9167 tuple2!10408) ListLongMap!9167)

(assert (=> b!841205 (= e!469255 (= call!37304 (+!2082 call!37305 (tuple2!10409 k0!854 v!557))))))

(declare-fun b!841206 () Bool)

(declare-fun res!571868 () Bool)

(assert (=> b!841206 (=> (not res!571868) (not e!469260))))

(assert (=> b!841206 (= res!571868 (and (= (size!23166 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23165 _keys!868) (size!23166 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24947 () Bool)

(assert (=> mapIsEmpty!24947 mapRes!24947))

(declare-fun b!841207 () Bool)

(declare-fun e!469258 () Bool)

(assert (=> b!841207 (= e!469258 tp_is_empty!15565)))

(declare-fun b!841208 () Bool)

(declare-fun res!571873 () Bool)

(assert (=> b!841208 (=> (not res!571873) (not e!469260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841208 (= res!571873 (validMask!0 mask!1196))))

(declare-fun b!841209 () Bool)

(assert (=> b!841209 (= e!469256 (and e!469258 mapRes!24947))))

(declare-fun condMapEmpty!24947 () Bool)

(declare-fun mapDefault!24947 () ValueCell!7343)

(assert (=> b!841209 (= condMapEmpty!24947 (= (arr!22724 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7343)) mapDefault!24947)))))

(declare-fun b!841210 () Bool)

(declare-fun res!571872 () Bool)

(assert (=> b!841210 (=> (not res!571872) (not e!469260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47383 (_ BitVec 32)) Bool)

(assert (=> b!841210 (= res!571872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37301 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2615 (array!47383 array!47385 (_ BitVec 32) (_ BitVec 32) V!25801 V!25801 (_ BitVec 32) Int) ListLongMap!9167)

(assert (=> bm!37301 (= call!37304 (getCurrentListMapNoExtraKeys!2615 _keys!868 (array!47386 (store (arr!22724 _values!688) i!612 (ValueCellFull!7343 v!557)) (size!23166 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841211 () Bool)

(assert (=> b!841211 (= e!469259 tp_is_empty!15565)))

(declare-fun b!841212 () Bool)

(declare-fun res!571870 () Bool)

(assert (=> b!841212 (=> (not res!571870) (not e!469260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841212 (= res!571870 (validKeyInArray!0 k0!854))))

(declare-fun b!841213 () Bool)

(declare-fun res!571871 () Bool)

(assert (=> b!841213 (=> (not res!571871) (not e!469260))))

(assert (=> b!841213 (= res!571871 (and (= (select (arr!22723 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23165 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841214 () Bool)

(assert (=> b!841214 (= e!469255 (= call!37304 call!37305))))

(declare-fun bm!37302 () Bool)

(assert (=> bm!37302 (= call!37305 (getCurrentListMapNoExtraKeys!2615 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841215 () Bool)

(declare-fun res!571875 () Bool)

(assert (=> b!841215 (=> (not res!571875) (not e!469260))))

(declare-datatypes ((List!16180 0))(
  ( (Nil!16177) (Cons!16176 (h!17307 (_ BitVec 64)) (t!22542 List!16180)) )
))
(declare-fun arrayNoDuplicates!0 (array!47383 (_ BitVec 32) List!16180) Bool)

(assert (=> b!841215 (= res!571875 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16177))))

(assert (= (and start!72496 res!571869) b!841208))

(assert (= (and b!841208 res!571873) b!841206))

(assert (= (and b!841206 res!571868) b!841210))

(assert (= (and b!841210 res!571872) b!841215))

(assert (= (and b!841215 res!571875) b!841203))

(assert (= (and b!841203 res!571874) b!841212))

(assert (= (and b!841212 res!571870) b!841213))

(assert (= (and b!841213 res!571871) b!841204))

(assert (= (and b!841204 c!91343) b!841205))

(assert (= (and b!841204 (not c!91343)) b!841214))

(assert (= (or b!841205 b!841214) bm!37301))

(assert (= (or b!841205 b!841214) bm!37302))

(assert (= (and b!841209 condMapEmpty!24947) mapIsEmpty!24947))

(assert (= (and b!841209 (not condMapEmpty!24947)) mapNonEmpty!24947))

(get-info :version)

(assert (= (and mapNonEmpty!24947 ((_ is ValueCellFull!7343) mapValue!24947)) b!841211))

(assert (= (and b!841209 ((_ is ValueCellFull!7343) mapDefault!24947)) b!841207))

(assert (= start!72496 b!841209))

(declare-fun m!784127 () Bool)

(assert (=> start!72496 m!784127))

(declare-fun m!784129 () Bool)

(assert (=> start!72496 m!784129))

(declare-fun m!784131 () Bool)

(assert (=> b!841205 m!784131))

(declare-fun m!784133 () Bool)

(assert (=> b!841212 m!784133))

(declare-fun m!784135 () Bool)

(assert (=> b!841215 m!784135))

(declare-fun m!784137 () Bool)

(assert (=> mapNonEmpty!24947 m!784137))

(declare-fun m!784139 () Bool)

(assert (=> b!841213 m!784139))

(declare-fun m!784141 () Bool)

(assert (=> bm!37302 m!784141))

(declare-fun m!784143 () Bool)

(assert (=> b!841208 m!784143))

(declare-fun m!784145 () Bool)

(assert (=> bm!37301 m!784145))

(declare-fun m!784147 () Bool)

(assert (=> bm!37301 m!784147))

(declare-fun m!784149 () Bool)

(assert (=> b!841210 m!784149))

(declare-fun m!784151 () Bool)

(assert (=> b!841204 m!784151))

(check-sat (not b!841205) (not b!841212) (not b!841215) (not b_next!13699) (not start!72496) (not b!841210) (not mapNonEmpty!24947) (not b!841208) b_and!22759 (not b!841204) tp_is_empty!15565 (not bm!37301) (not bm!37302))
(check-sat b_and!22759 (not b_next!13699))
