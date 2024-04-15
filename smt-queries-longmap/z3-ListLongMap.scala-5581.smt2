; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73252 () Bool)

(assert start!73252)

(declare-fun b_free!14185 () Bool)

(declare-fun b_next!14185 () Bool)

(assert (=> start!73252 (= b_free!14185 (not b_next!14185))))

(declare-fun tp!50059 () Bool)

(declare-fun b_and!23503 () Bool)

(assert (=> start!73252 (= tp!50059 b_and!23503)))

(declare-datatypes ((V!26809 0))(
  ( (V!26810 (val!8208 Int)) )
))
(declare-datatypes ((ValueCell!7721 0))(
  ( (ValueCellFull!7721 (v!10627 V!26809)) (EmptyCell!7721) )
))
(declare-datatypes ((array!48825 0))(
  ( (array!48826 (arr!23444 (Array (_ BitVec 32) ValueCell!7721)) (size!23886 (_ BitVec 32))) )
))
(declare-fun lt!385178 () array!48825)

(declare-datatypes ((tuple2!10820 0))(
  ( (tuple2!10821 (_1!5421 (_ BitVec 64)) (_2!5421 V!26809)) )
))
(declare-datatypes ((List!16634 0))(
  ( (Nil!16631) (Cons!16630 (h!17761 tuple2!10820) (t!23256 List!16634)) )
))
(declare-datatypes ((ListLongMap!9579 0))(
  ( (ListLongMap!9580 (toList!4805 List!16634)) )
))
(declare-fun call!38385 () ListLongMap!9579)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48827 0))(
  ( (array!48828 (arr!23445 (Array (_ BitVec 32) (_ BitVec 64))) (size!23887 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48827)

(declare-fun bm!38381 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26809)

(declare-fun zeroValue!654 () V!26809)

(declare-fun getCurrentListMapNoExtraKeys!2812 (array!48827 array!48825 (_ BitVec 32) (_ BitVec 32) V!26809 V!26809 (_ BitVec 32) Int) ListLongMap!9579)

(assert (=> bm!38381 (= call!38385 (getCurrentListMapNoExtraKeys!2812 _keys!868 lt!385178 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854263 () Bool)

(declare-fun e!476335 () Bool)

(declare-fun tp_is_empty!16321 () Bool)

(assert (=> b!854263 (= e!476335 tp_is_empty!16321)))

(declare-fun b!854264 () Bool)

(declare-fun e!476334 () Bool)

(assert (=> b!854264 (= e!476334 tp_is_empty!16321)))

(declare-fun mapIsEmpty!26081 () Bool)

(declare-fun mapRes!26081 () Bool)

(assert (=> mapIsEmpty!26081 mapRes!26081))

(declare-fun b!854265 () Bool)

(declare-fun res!580194 () Bool)

(declare-fun e!476338 () Bool)

(assert (=> b!854265 (=> (not res!580194) (not e!476338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854265 (= res!580194 (validMask!0 mask!1196))))

(declare-fun b!854266 () Bool)

(declare-fun e!476339 () Bool)

(declare-fun e!476333 () Bool)

(assert (=> b!854266 (= e!476339 (not e!476333))))

(declare-fun res!580197 () Bool)

(assert (=> b!854266 (=> res!580197 e!476333)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854266 (= res!580197 (not (validKeyInArray!0 (select (arr!23445 _keys!868) from!1053))))))

(declare-fun e!476337 () Bool)

(assert (=> b!854266 e!476337))

(declare-fun c!91883 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854266 (= c!91883 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26809)

(declare-datatypes ((Unit!29101 0))(
  ( (Unit!29102) )
))
(declare-fun lt!385187 () Unit!29101)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun _values!688 () array!48825)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!413 (array!48827 array!48825 (_ BitVec 32) (_ BitVec 32) V!26809 V!26809 (_ BitVec 32) (_ BitVec 64) V!26809 (_ BitVec 32) Int) Unit!29101)

(assert (=> b!854266 (= lt!385187 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!413 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854267 () Bool)

(assert (=> b!854267 (= e!476333 true)))

(declare-fun lt!385185 () V!26809)

(declare-fun lt!385180 () tuple2!10820)

(declare-fun lt!385181 () ListLongMap!9579)

(declare-fun +!2213 (ListLongMap!9579 tuple2!10820) ListLongMap!9579)

(assert (=> b!854267 (= (+!2213 lt!385181 lt!385180) (+!2213 (+!2213 lt!385181 (tuple2!10821 k0!854 lt!385185)) lt!385180))))

(declare-fun lt!385186 () V!26809)

(assert (=> b!854267 (= lt!385180 (tuple2!10821 k0!854 lt!385186))))

(declare-fun lt!385179 () Unit!29101)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!321 (ListLongMap!9579 (_ BitVec 64) V!26809 V!26809) Unit!29101)

(assert (=> b!854267 (= lt!385179 (addSameAsAddTwiceSameKeyDiffValues!321 lt!385181 k0!854 lt!385185 lt!385186))))

(declare-fun lt!385183 () V!26809)

(declare-fun get!12380 (ValueCell!7721 V!26809) V!26809)

(assert (=> b!854267 (= lt!385185 (get!12380 (select (arr!23444 _values!688) from!1053) lt!385183))))

(declare-fun lt!385182 () ListLongMap!9579)

(assert (=> b!854267 (= lt!385182 (+!2213 lt!385181 (tuple2!10821 (select (arr!23445 _keys!868) from!1053) lt!385186)))))

(assert (=> b!854267 (= lt!385186 (get!12380 (select (store (arr!23444 _values!688) i!612 (ValueCellFull!7721 v!557)) from!1053) lt!385183))))

(declare-fun dynLambda!1071 (Int (_ BitVec 64)) V!26809)

(assert (=> b!854267 (= lt!385183 (dynLambda!1071 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854267 (= lt!385181 (getCurrentListMapNoExtraKeys!2812 _keys!868 lt!385178 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854268 () Bool)

(assert (=> b!854268 (= e!476338 e!476339)))

(declare-fun res!580188 () Bool)

(assert (=> b!854268 (=> (not res!580188) (not e!476339))))

(assert (=> b!854268 (= res!580188 (= from!1053 i!612))))

(assert (=> b!854268 (= lt!385182 (getCurrentListMapNoExtraKeys!2812 _keys!868 lt!385178 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854268 (= lt!385178 (array!48826 (store (arr!23444 _values!688) i!612 (ValueCellFull!7721 v!557)) (size!23886 _values!688)))))

(declare-fun lt!385184 () ListLongMap!9579)

(assert (=> b!854268 (= lt!385184 (getCurrentListMapNoExtraKeys!2812 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854269 () Bool)

(declare-fun res!580189 () Bool)

(assert (=> b!854269 (=> (not res!580189) (not e!476338))))

(assert (=> b!854269 (= res!580189 (and (= (size!23886 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23887 _keys!868) (size!23886 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!580196 () Bool)

(assert (=> start!73252 (=> (not res!580196) (not e!476338))))

(assert (=> start!73252 (= res!580196 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23887 _keys!868))))))

(assert (=> start!73252 e!476338))

(assert (=> start!73252 tp_is_empty!16321))

(assert (=> start!73252 true))

(assert (=> start!73252 tp!50059))

(declare-fun array_inv!18658 (array!48827) Bool)

(assert (=> start!73252 (array_inv!18658 _keys!868)))

(declare-fun e!476336 () Bool)

(declare-fun array_inv!18659 (array!48825) Bool)

(assert (=> start!73252 (and (array_inv!18659 _values!688) e!476336)))

(declare-fun b!854270 () Bool)

(declare-fun res!580195 () Bool)

(assert (=> b!854270 (=> (not res!580195) (not e!476338))))

(declare-datatypes ((List!16635 0))(
  ( (Nil!16632) (Cons!16631 (h!17762 (_ BitVec 64)) (t!23257 List!16635)) )
))
(declare-fun arrayNoDuplicates!0 (array!48827 (_ BitVec 32) List!16635) Bool)

(assert (=> b!854270 (= res!580195 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16632))))

(declare-fun b!854271 () Bool)

(declare-fun res!580191 () Bool)

(assert (=> b!854271 (=> (not res!580191) (not e!476338))))

(assert (=> b!854271 (= res!580191 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23887 _keys!868))))))

(declare-fun bm!38382 () Bool)

(declare-fun call!38384 () ListLongMap!9579)

(assert (=> bm!38382 (= call!38384 (getCurrentListMapNoExtraKeys!2812 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26081 () Bool)

(declare-fun tp!50060 () Bool)

(assert (=> mapNonEmpty!26081 (= mapRes!26081 (and tp!50060 e!476334))))

(declare-fun mapKey!26081 () (_ BitVec 32))

(declare-fun mapValue!26081 () ValueCell!7721)

(declare-fun mapRest!26081 () (Array (_ BitVec 32) ValueCell!7721))

(assert (=> mapNonEmpty!26081 (= (arr!23444 _values!688) (store mapRest!26081 mapKey!26081 mapValue!26081))))

(declare-fun b!854272 () Bool)

(declare-fun res!580193 () Bool)

(assert (=> b!854272 (=> (not res!580193) (not e!476338))))

(assert (=> b!854272 (= res!580193 (and (= (select (arr!23445 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854273 () Bool)

(assert (=> b!854273 (= e!476336 (and e!476335 mapRes!26081))))

(declare-fun condMapEmpty!26081 () Bool)

(declare-fun mapDefault!26081 () ValueCell!7721)

(assert (=> b!854273 (= condMapEmpty!26081 (= (arr!23444 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7721)) mapDefault!26081)))))

(declare-fun b!854274 () Bool)

(assert (=> b!854274 (= e!476337 (= call!38385 (+!2213 call!38384 (tuple2!10821 k0!854 v!557))))))

(declare-fun b!854275 () Bool)

(declare-fun res!580192 () Bool)

(assert (=> b!854275 (=> (not res!580192) (not e!476338))))

(assert (=> b!854275 (= res!580192 (validKeyInArray!0 k0!854))))

(declare-fun b!854276 () Bool)

(assert (=> b!854276 (= e!476337 (= call!38385 call!38384))))

(declare-fun b!854277 () Bool)

(declare-fun res!580190 () Bool)

(assert (=> b!854277 (=> (not res!580190) (not e!476338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48827 (_ BitVec 32)) Bool)

(assert (=> b!854277 (= res!580190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73252 res!580196) b!854265))

(assert (= (and b!854265 res!580194) b!854269))

(assert (= (and b!854269 res!580189) b!854277))

(assert (= (and b!854277 res!580190) b!854270))

(assert (= (and b!854270 res!580195) b!854271))

(assert (= (and b!854271 res!580191) b!854275))

(assert (= (and b!854275 res!580192) b!854272))

(assert (= (and b!854272 res!580193) b!854268))

(assert (= (and b!854268 res!580188) b!854266))

(assert (= (and b!854266 c!91883) b!854274))

(assert (= (and b!854266 (not c!91883)) b!854276))

(assert (= (or b!854274 b!854276) bm!38381))

(assert (= (or b!854274 b!854276) bm!38382))

(assert (= (and b!854266 (not res!580197)) b!854267))

(assert (= (and b!854273 condMapEmpty!26081) mapIsEmpty!26081))

(assert (= (and b!854273 (not condMapEmpty!26081)) mapNonEmpty!26081))

(get-info :version)

(assert (= (and mapNonEmpty!26081 ((_ is ValueCellFull!7721) mapValue!26081)) b!854264))

(assert (= (and b!854273 ((_ is ValueCellFull!7721) mapDefault!26081)) b!854263))

(assert (= start!73252 b!854273))

(declare-fun b_lambda!11699 () Bool)

(assert (=> (not b_lambda!11699) (not b!854267)))

(declare-fun t!23255 () Bool)

(declare-fun tb!4479 () Bool)

(assert (=> (and start!73252 (= defaultEntry!696 defaultEntry!696) t!23255) tb!4479))

(declare-fun result!8577 () Bool)

(assert (=> tb!4479 (= result!8577 tp_is_empty!16321)))

(assert (=> b!854267 t!23255))

(declare-fun b_and!23505 () Bool)

(assert (= b_and!23503 (and (=> t!23255 result!8577) b_and!23505)))

(declare-fun m!795117 () Bool)

(assert (=> b!854272 m!795117))

(declare-fun m!795119 () Bool)

(assert (=> mapNonEmpty!26081 m!795119))

(declare-fun m!795121 () Bool)

(assert (=> b!854265 m!795121))

(declare-fun m!795123 () Bool)

(assert (=> b!854270 m!795123))

(declare-fun m!795125 () Bool)

(assert (=> b!854268 m!795125))

(declare-fun m!795127 () Bool)

(assert (=> b!854268 m!795127))

(declare-fun m!795129 () Bool)

(assert (=> b!854268 m!795129))

(declare-fun m!795131 () Bool)

(assert (=> b!854274 m!795131))

(declare-fun m!795133 () Bool)

(assert (=> b!854275 m!795133))

(declare-fun m!795135 () Bool)

(assert (=> b!854266 m!795135))

(assert (=> b!854266 m!795135))

(declare-fun m!795137 () Bool)

(assert (=> b!854266 m!795137))

(declare-fun m!795139 () Bool)

(assert (=> b!854266 m!795139))

(declare-fun m!795141 () Bool)

(assert (=> bm!38381 m!795141))

(declare-fun m!795143 () Bool)

(assert (=> b!854267 m!795143))

(declare-fun m!795145 () Bool)

(assert (=> b!854267 m!795145))

(declare-fun m!795147 () Bool)

(assert (=> b!854267 m!795147))

(declare-fun m!795149 () Bool)

(assert (=> b!854267 m!795149))

(declare-fun m!795151 () Bool)

(assert (=> b!854267 m!795151))

(assert (=> b!854267 m!795141))

(assert (=> b!854267 m!795145))

(declare-fun m!795153 () Bool)

(assert (=> b!854267 m!795153))

(declare-fun m!795155 () Bool)

(assert (=> b!854267 m!795155))

(assert (=> b!854267 m!795147))

(assert (=> b!854267 m!795135))

(assert (=> b!854267 m!795151))

(declare-fun m!795157 () Bool)

(assert (=> b!854267 m!795157))

(declare-fun m!795159 () Bool)

(assert (=> b!854267 m!795159))

(declare-fun m!795161 () Bool)

(assert (=> b!854267 m!795161))

(assert (=> b!854267 m!795127))

(declare-fun m!795163 () Bool)

(assert (=> start!73252 m!795163))

(declare-fun m!795165 () Bool)

(assert (=> start!73252 m!795165))

(declare-fun m!795167 () Bool)

(assert (=> b!854277 m!795167))

(declare-fun m!795169 () Bool)

(assert (=> bm!38382 m!795169))

(check-sat (not b!854270) (not b!854274) (not b!854277) b_and!23505 (not b_lambda!11699) (not b!854275) (not b_next!14185) (not b!854268) tp_is_empty!16321 (not b!854265) (not mapNonEmpty!26081) (not bm!38382) (not bm!38381) (not start!73252) (not b!854267) (not b!854266))
(check-sat b_and!23505 (not b_next!14185))
