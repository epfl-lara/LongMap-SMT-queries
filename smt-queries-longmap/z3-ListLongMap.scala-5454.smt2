; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72676 () Bool)

(assert start!72676)

(declare-fun b_free!13693 () Bool)

(declare-fun b_next!13693 () Bool)

(assert (=> start!72676 (= b_free!13693 (not b_next!13693))))

(declare-fun tp!48179 () Bool)

(declare-fun b_and!22789 () Bool)

(assert (=> start!72676 (= tp!48179 b_and!22789)))

(declare-fun mapNonEmpty!24938 () Bool)

(declare-fun mapRes!24938 () Bool)

(declare-fun tp!48178 () Bool)

(declare-fun e!469931 () Bool)

(assert (=> mapNonEmpty!24938 (= mapRes!24938 (and tp!48178 e!469931))))

(declare-fun mapKey!24938 () (_ BitVec 32))

(declare-datatypes ((V!25793 0))(
  ( (V!25794 (val!7827 Int)) )
))
(declare-datatypes ((ValueCell!7340 0))(
  ( (ValueCellFull!7340 (v!10252 V!25793)) (EmptyCell!7340) )
))
(declare-fun mapValue!24938 () ValueCell!7340)

(declare-fun mapRest!24938 () (Array (_ BitVec 32) ValueCell!7340))

(declare-datatypes ((array!47411 0))(
  ( (array!47412 (arr!22732 (Array (_ BitVec 32) ValueCell!7340)) (size!23173 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47411)

(assert (=> mapNonEmpty!24938 (= (arr!22732 _values!688) (store mapRest!24938 mapKey!24938 mapValue!24938))))

(declare-datatypes ((tuple2!10314 0))(
  ( (tuple2!10315 (_1!5168 (_ BitVec 64)) (_2!5168 V!25793)) )
))
(declare-datatypes ((List!16085 0))(
  ( (Nil!16082) (Cons!16081 (h!17218 tuple2!10314) (t!22448 List!16085)) )
))
(declare-datatypes ((ListLongMap!9085 0))(
  ( (ListLongMap!9086 (toList!4558 List!16085)) )
))
(declare-fun call!37358 () ListLongMap!9085)

(declare-fun call!37357 () ListLongMap!9085)

(declare-fun b!842228 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!25793)

(declare-fun e!469936 () Bool)

(declare-fun +!2064 (ListLongMap!9085 tuple2!10314) ListLongMap!9085)

(assert (=> b!842228 (= e!469936 (= call!37358 (+!2064 call!37357 (tuple2!10315 k0!854 v!557))))))

(declare-fun b!842229 () Bool)

(declare-fun e!469932 () Bool)

(declare-fun e!469935 () Bool)

(assert (=> b!842229 (= e!469932 (and e!469935 mapRes!24938))))

(declare-fun condMapEmpty!24938 () Bool)

(declare-fun mapDefault!24938 () ValueCell!7340)

(assert (=> b!842229 (= condMapEmpty!24938 (= (arr!22732 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7340)) mapDefault!24938)))))

(declare-fun res!572256 () Bool)

(declare-fun e!469933 () Bool)

(assert (=> start!72676 (=> (not res!572256) (not e!469933))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47413 0))(
  ( (array!47414 (arr!22733 (Array (_ BitVec 32) (_ BitVec 64))) (size!23174 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47413)

(assert (=> start!72676 (= res!572256 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23174 _keys!868))))))

(assert (=> start!72676 e!469933))

(declare-fun tp_is_empty!15559 () Bool)

(assert (=> start!72676 tp_is_empty!15559))

(assert (=> start!72676 true))

(assert (=> start!72676 tp!48179))

(declare-fun array_inv!18136 (array!47413) Bool)

(assert (=> start!72676 (array_inv!18136 _keys!868)))

(declare-fun array_inv!18137 (array!47411) Bool)

(assert (=> start!72676 (and (array_inv!18137 _values!688) e!469932)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25793)

(declare-fun zeroValue!654 () V!25793)

(declare-fun bm!37354 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2618 (array!47413 array!47411 (_ BitVec 32) (_ BitVec 32) V!25793 V!25793 (_ BitVec 32) Int) ListLongMap!9085)

(assert (=> bm!37354 (= call!37358 (getCurrentListMapNoExtraKeys!2618 _keys!868 (array!47412 (store (arr!22732 _values!688) i!612 (ValueCellFull!7340 v!557)) (size!23173 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842230 () Bool)

(declare-fun res!572252 () Bool)

(assert (=> b!842230 (=> (not res!572252) (not e!469933))))

(assert (=> b!842230 (= res!572252 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23174 _keys!868))))))

(declare-fun b!842231 () Bool)

(declare-fun res!572254 () Bool)

(assert (=> b!842231 (=> (not res!572254) (not e!469933))))

(assert (=> b!842231 (= res!572254 (and (= (select (arr!22733 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23174 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842232 () Bool)

(assert (=> b!842232 (= e!469933 (not true))))

(assert (=> b!842232 e!469936))

(declare-fun c!91681 () Bool)

(assert (=> b!842232 (= c!91681 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28916 0))(
  ( (Unit!28917) )
))
(declare-fun lt!381266 () Unit!28916)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!294 (array!47413 array!47411 (_ BitVec 32) (_ BitVec 32) V!25793 V!25793 (_ BitVec 32) (_ BitVec 64) V!25793 (_ BitVec 32) Int) Unit!28916)

(assert (=> b!842232 (= lt!381266 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!294 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842233 () Bool)

(assert (=> b!842233 (= e!469935 tp_is_empty!15559)))

(declare-fun b!842234 () Bool)

(declare-fun res!572251 () Bool)

(assert (=> b!842234 (=> (not res!572251) (not e!469933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842234 (= res!572251 (validKeyInArray!0 k0!854))))

(declare-fun b!842235 () Bool)

(declare-fun res!572253 () Bool)

(assert (=> b!842235 (=> (not res!572253) (not e!469933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47413 (_ BitVec 32)) Bool)

(assert (=> b!842235 (= res!572253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842236 () Bool)

(assert (=> b!842236 (= e!469931 tp_is_empty!15559)))

(declare-fun bm!37355 () Bool)

(assert (=> bm!37355 (= call!37357 (getCurrentListMapNoExtraKeys!2618 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842237 () Bool)

(declare-fun res!572255 () Bool)

(assert (=> b!842237 (=> (not res!572255) (not e!469933))))

(declare-datatypes ((List!16086 0))(
  ( (Nil!16083) (Cons!16082 (h!17219 (_ BitVec 64)) (t!22449 List!16086)) )
))
(declare-fun arrayNoDuplicates!0 (array!47413 (_ BitVec 32) List!16086) Bool)

(assert (=> b!842237 (= res!572255 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16083))))

(declare-fun b!842238 () Bool)

(declare-fun res!572257 () Bool)

(assert (=> b!842238 (=> (not res!572257) (not e!469933))))

(assert (=> b!842238 (= res!572257 (and (= (size!23173 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23174 _keys!868) (size!23173 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24938 () Bool)

(assert (=> mapIsEmpty!24938 mapRes!24938))

(declare-fun b!842239 () Bool)

(assert (=> b!842239 (= e!469936 (= call!37358 call!37357))))

(declare-fun b!842240 () Bool)

(declare-fun res!572250 () Bool)

(assert (=> b!842240 (=> (not res!572250) (not e!469933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842240 (= res!572250 (validMask!0 mask!1196))))

(assert (= (and start!72676 res!572256) b!842240))

(assert (= (and b!842240 res!572250) b!842238))

(assert (= (and b!842238 res!572257) b!842235))

(assert (= (and b!842235 res!572253) b!842237))

(assert (= (and b!842237 res!572255) b!842230))

(assert (= (and b!842230 res!572252) b!842234))

(assert (= (and b!842234 res!572251) b!842231))

(assert (= (and b!842231 res!572254) b!842232))

(assert (= (and b!842232 c!91681) b!842228))

(assert (= (and b!842232 (not c!91681)) b!842239))

(assert (= (or b!842228 b!842239) bm!37354))

(assert (= (or b!842228 b!842239) bm!37355))

(assert (= (and b!842229 condMapEmpty!24938) mapIsEmpty!24938))

(assert (= (and b!842229 (not condMapEmpty!24938)) mapNonEmpty!24938))

(get-info :version)

(assert (= (and mapNonEmpty!24938 ((_ is ValueCellFull!7340) mapValue!24938)) b!842236))

(assert (= (and b!842229 ((_ is ValueCellFull!7340) mapDefault!24938)) b!842233))

(assert (= start!72676 b!842229))

(declare-fun m!786095 () Bool)

(assert (=> b!842234 m!786095))

(declare-fun m!786097 () Bool)

(assert (=> b!842231 m!786097))

(declare-fun m!786099 () Bool)

(assert (=> bm!37354 m!786099))

(declare-fun m!786101 () Bool)

(assert (=> bm!37354 m!786101))

(declare-fun m!786103 () Bool)

(assert (=> b!842237 m!786103))

(declare-fun m!786105 () Bool)

(assert (=> b!842240 m!786105))

(declare-fun m!786107 () Bool)

(assert (=> b!842228 m!786107))

(declare-fun m!786109 () Bool)

(assert (=> bm!37355 m!786109))

(declare-fun m!786111 () Bool)

(assert (=> b!842235 m!786111))

(declare-fun m!786113 () Bool)

(assert (=> mapNonEmpty!24938 m!786113))

(declare-fun m!786115 () Bool)

(assert (=> start!72676 m!786115))

(declare-fun m!786117 () Bool)

(assert (=> start!72676 m!786117))

(declare-fun m!786119 () Bool)

(assert (=> b!842232 m!786119))

(check-sat (not start!72676) (not bm!37355) (not b!842228) (not b!842237) (not b!842234) (not mapNonEmpty!24938) (not b!842232) b_and!22789 (not b!842235) (not b!842240) (not bm!37354) tp_is_empty!15559 (not b_next!13693))
(check-sat b_and!22789 (not b_next!13693))
