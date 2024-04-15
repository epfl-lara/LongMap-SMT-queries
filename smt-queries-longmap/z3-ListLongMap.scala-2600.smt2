; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39404 () Bool)

(assert start!39404)

(declare-fun b_free!9685 () Bool)

(declare-fun b_next!9685 () Bool)

(assert (=> start!39404 (= b_free!9685 (not b_next!9685))))

(declare-fun tp!34583 () Bool)

(declare-fun b_and!17219 () Bool)

(assert (=> start!39404 (= tp!34583 b_and!17219)))

(declare-fun b!419224 () Bool)

(declare-fun e!249829 () Bool)

(declare-datatypes ((V!15555 0))(
  ( (V!15556 (val!5463 Int)) )
))
(declare-datatypes ((tuple2!7134 0))(
  ( (tuple2!7135 (_1!3578 (_ BitVec 64)) (_2!3578 V!15555)) )
))
(declare-datatypes ((List!7132 0))(
  ( (Nil!7129) (Cons!7128 (h!7984 tuple2!7134) (t!12473 List!7132)) )
))
(declare-datatypes ((ListLongMap!6037 0))(
  ( (ListLongMap!6038 (toList!3034 List!7132)) )
))
(declare-fun call!29209 () ListLongMap!6037)

(declare-fun call!29208 () ListLongMap!6037)

(assert (=> b!419224 (= e!249829 (= call!29209 call!29208))))

(declare-fun b!419225 () Bool)

(declare-fun res!244443 () Bool)

(declare-fun e!249824 () Bool)

(assert (=> b!419225 (=> (not res!244443) (not e!249824))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419225 (= res!244443 (bvsle from!863 i!563))))

(declare-fun b!419226 () Bool)

(declare-fun e!249823 () Bool)

(assert (=> b!419226 (= e!249823 true)))

(declare-fun lt!192152 () ListLongMap!6037)

(declare-fun lt!192143 () tuple2!7134)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!192149 () V!15555)

(declare-fun +!1260 (ListLongMap!6037 tuple2!7134) ListLongMap!6037)

(assert (=> b!419226 (= (+!1260 lt!192152 lt!192143) (+!1260 (+!1260 lt!192152 (tuple2!7135 k0!794 lt!192149)) lt!192143))))

(declare-fun lt!192151 () V!15555)

(assert (=> b!419226 (= lt!192143 (tuple2!7135 k0!794 lt!192151))))

(declare-datatypes ((Unit!12364 0))(
  ( (Unit!12365) )
))
(declare-fun lt!192144 () Unit!12364)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!45 (ListLongMap!6037 (_ BitVec 64) V!15555 V!15555) Unit!12364)

(assert (=> b!419226 (= lt!192144 (addSameAsAddTwiceSameKeyDiffValues!45 lt!192152 k0!794 lt!192149 lt!192151))))

(declare-fun lt!192145 () V!15555)

(declare-datatypes ((ValueCell!5075 0))(
  ( (ValueCellFull!5075 (v!7704 V!15555)) (EmptyCell!5075) )
))
(declare-datatypes ((array!25509 0))(
  ( (array!25510 (arr!12204 (Array (_ BitVec 32) ValueCell!5075)) (size!12557 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25509)

(declare-fun get!6048 (ValueCell!5075 V!15555) V!15555)

(assert (=> b!419226 (= lt!192149 (get!6048 (select (arr!12204 _values!549) from!863) lt!192145))))

(declare-fun lt!192147 () ListLongMap!6037)

(declare-datatypes ((array!25511 0))(
  ( (array!25512 (arr!12205 (Array (_ BitVec 32) (_ BitVec 64))) (size!12558 (_ BitVec 32))) )
))
(declare-fun lt!192150 () array!25511)

(assert (=> b!419226 (= lt!192147 (+!1260 lt!192152 (tuple2!7135 (select (arr!12205 lt!192150) from!863) lt!192151)))))

(declare-fun v!412 () V!15555)

(assert (=> b!419226 (= lt!192151 (get!6048 (select (store (arr!12204 _values!549) i!563 (ValueCellFull!5075 v!412)) from!863) lt!192145))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!702 (Int (_ BitVec 64)) V!15555)

(assert (=> b!419226 (= lt!192145 (dynLambda!702 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15555)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15555)

(declare-fun lt!192146 () array!25509)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1244 (array!25511 array!25509 (_ BitVec 32) (_ BitVec 32) V!15555 V!15555 (_ BitVec 32) Int) ListLongMap!6037)

(assert (=> b!419226 (= lt!192152 (getCurrentListMapNoExtraKeys!1244 lt!192150 lt!192146 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419227 () Bool)

(declare-fun e!249827 () Bool)

(declare-fun tp_is_empty!10837 () Bool)

(assert (=> b!419227 (= e!249827 tp_is_empty!10837)))

(declare-fun b!419228 () Bool)

(declare-fun e!249828 () Bool)

(declare-fun e!249830 () Bool)

(declare-fun mapRes!17877 () Bool)

(assert (=> b!419228 (= e!249828 (and e!249830 mapRes!17877))))

(declare-fun condMapEmpty!17877 () Bool)

(declare-fun mapDefault!17877 () ValueCell!5075)

(assert (=> b!419228 (= condMapEmpty!17877 (= (arr!12204 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5075)) mapDefault!17877)))))

(declare-fun b!419229 () Bool)

(declare-fun res!244445 () Bool)

(declare-fun e!249831 () Bool)

(assert (=> b!419229 (=> (not res!244445) (not e!249831))))

(declare-fun _keys!709 () array!25511)

(assert (=> b!419229 (= res!244445 (or (= (select (arr!12205 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12205 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419230 () Bool)

(declare-fun res!244451 () Bool)

(assert (=> b!419230 (=> (not res!244451) (not e!249831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419230 (= res!244451 (validMask!0 mask!1025))))

(declare-fun b!419231 () Bool)

(assert (=> b!419231 (= e!249829 (= call!29208 (+!1260 call!29209 (tuple2!7135 k0!794 v!412))))))

(declare-fun b!419232 () Bool)

(declare-fun res!244450 () Bool)

(assert (=> b!419232 (=> (not res!244450) (not e!249831))))

(declare-fun arrayContainsKey!0 (array!25511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419232 (= res!244450 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17877 () Bool)

(declare-fun tp!34584 () Bool)

(assert (=> mapNonEmpty!17877 (= mapRes!17877 (and tp!34584 e!249827))))

(declare-fun mapValue!17877 () ValueCell!5075)

(declare-fun mapRest!17877 () (Array (_ BitVec 32) ValueCell!5075))

(declare-fun mapKey!17877 () (_ BitVec 32))

(assert (=> mapNonEmpty!17877 (= (arr!12204 _values!549) (store mapRest!17877 mapKey!17877 mapValue!17877))))

(declare-fun c!55170 () Bool)

(declare-fun bm!29205 () Bool)

(assert (=> bm!29205 (= call!29209 (getCurrentListMapNoExtraKeys!1244 (ite c!55170 _keys!709 lt!192150) (ite c!55170 _values!549 lt!192146) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419233 () Bool)

(assert (=> b!419233 (= e!249830 tp_is_empty!10837)))

(declare-fun res!244446 () Bool)

(assert (=> start!39404 (=> (not res!244446) (not e!249831))))

(assert (=> start!39404 (= res!244446 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12558 _keys!709))))))

(assert (=> start!39404 e!249831))

(assert (=> start!39404 tp_is_empty!10837))

(assert (=> start!39404 tp!34583))

(assert (=> start!39404 true))

(declare-fun array_inv!8944 (array!25509) Bool)

(assert (=> start!39404 (and (array_inv!8944 _values!549) e!249828)))

(declare-fun array_inv!8945 (array!25511) Bool)

(assert (=> start!39404 (array_inv!8945 _keys!709)))

(declare-fun b!419234 () Bool)

(declare-fun res!244442 () Bool)

(assert (=> b!419234 (=> (not res!244442) (not e!249831))))

(assert (=> b!419234 (= res!244442 (and (= (size!12557 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12558 _keys!709) (size!12557 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419235 () Bool)

(declare-fun res!244444 () Bool)

(assert (=> b!419235 (=> (not res!244444) (not e!249831))))

(declare-datatypes ((List!7133 0))(
  ( (Nil!7130) (Cons!7129 (h!7985 (_ BitVec 64)) (t!12474 List!7133)) )
))
(declare-fun arrayNoDuplicates!0 (array!25511 (_ BitVec 32) List!7133) Bool)

(assert (=> b!419235 (= res!244444 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7130))))

(declare-fun b!419236 () Bool)

(declare-fun res!244439 () Bool)

(assert (=> b!419236 (=> (not res!244439) (not e!249831))))

(assert (=> b!419236 (= res!244439 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12558 _keys!709))))))

(declare-fun b!419237 () Bool)

(assert (=> b!419237 (= e!249831 e!249824)))

(declare-fun res!244448 () Bool)

(assert (=> b!419237 (=> (not res!244448) (not e!249824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25511 (_ BitVec 32)) Bool)

(assert (=> b!419237 (= res!244448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192150 mask!1025))))

(assert (=> b!419237 (= lt!192150 (array!25512 (store (arr!12205 _keys!709) i!563 k0!794) (size!12558 _keys!709)))))

(declare-fun mapIsEmpty!17877 () Bool)

(assert (=> mapIsEmpty!17877 mapRes!17877))

(declare-fun b!419238 () Bool)

(declare-fun res!244440 () Bool)

(assert (=> b!419238 (=> (not res!244440) (not e!249831))))

(assert (=> b!419238 (= res!244440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419239 () Bool)

(declare-fun e!249825 () Bool)

(assert (=> b!419239 (= e!249825 (not e!249823))))

(declare-fun res!244449 () Bool)

(assert (=> b!419239 (=> res!244449 e!249823)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419239 (= res!244449 (validKeyInArray!0 (select (arr!12205 _keys!709) from!863)))))

(assert (=> b!419239 e!249829))

(assert (=> b!419239 (= c!55170 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192142 () Unit!12364)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!437 (array!25511 array!25509 (_ BitVec 32) (_ BitVec 32) V!15555 V!15555 (_ BitVec 32) (_ BitVec 64) V!15555 (_ BitVec 32) Int) Unit!12364)

(assert (=> b!419239 (= lt!192142 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!437 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29206 () Bool)

(assert (=> bm!29206 (= call!29208 (getCurrentListMapNoExtraKeys!1244 (ite c!55170 lt!192150 _keys!709) (ite c!55170 lt!192146 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419240 () Bool)

(declare-fun res!244447 () Bool)

(assert (=> b!419240 (=> (not res!244447) (not e!249824))))

(assert (=> b!419240 (= res!244447 (arrayNoDuplicates!0 lt!192150 #b00000000000000000000000000000000 Nil!7130))))

(declare-fun b!419241 () Bool)

(declare-fun res!244452 () Bool)

(assert (=> b!419241 (=> (not res!244452) (not e!249831))))

(assert (=> b!419241 (= res!244452 (validKeyInArray!0 k0!794))))

(declare-fun b!419242 () Bool)

(assert (=> b!419242 (= e!249824 e!249825)))

(declare-fun res!244441 () Bool)

(assert (=> b!419242 (=> (not res!244441) (not e!249825))))

(assert (=> b!419242 (= res!244441 (= from!863 i!563))))

(assert (=> b!419242 (= lt!192147 (getCurrentListMapNoExtraKeys!1244 lt!192150 lt!192146 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419242 (= lt!192146 (array!25510 (store (arr!12204 _values!549) i!563 (ValueCellFull!5075 v!412)) (size!12557 _values!549)))))

(declare-fun lt!192148 () ListLongMap!6037)

(assert (=> b!419242 (= lt!192148 (getCurrentListMapNoExtraKeys!1244 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39404 res!244446) b!419230))

(assert (= (and b!419230 res!244451) b!419234))

(assert (= (and b!419234 res!244442) b!419238))

(assert (= (and b!419238 res!244440) b!419235))

(assert (= (and b!419235 res!244444) b!419236))

(assert (= (and b!419236 res!244439) b!419241))

(assert (= (and b!419241 res!244452) b!419229))

(assert (= (and b!419229 res!244445) b!419232))

(assert (= (and b!419232 res!244450) b!419237))

(assert (= (and b!419237 res!244448) b!419240))

(assert (= (and b!419240 res!244447) b!419225))

(assert (= (and b!419225 res!244443) b!419242))

(assert (= (and b!419242 res!244441) b!419239))

(assert (= (and b!419239 c!55170) b!419231))

(assert (= (and b!419239 (not c!55170)) b!419224))

(assert (= (or b!419231 b!419224) bm!29206))

(assert (= (or b!419231 b!419224) bm!29205))

(assert (= (and b!419239 (not res!244449)) b!419226))

(assert (= (and b!419228 condMapEmpty!17877) mapIsEmpty!17877))

(assert (= (and b!419228 (not condMapEmpty!17877)) mapNonEmpty!17877))

(get-info :version)

(assert (= (and mapNonEmpty!17877 ((_ is ValueCellFull!5075) mapValue!17877)) b!419227))

(assert (= (and b!419228 ((_ is ValueCellFull!5075) mapDefault!17877)) b!419233))

(assert (= start!39404 b!419228))

(declare-fun b_lambda!8971 () Bool)

(assert (=> (not b_lambda!8971) (not b!419226)))

(declare-fun t!12472 () Bool)

(declare-fun tb!3299 () Bool)

(assert (=> (and start!39404 (= defaultEntry!557 defaultEntry!557) t!12472) tb!3299))

(declare-fun result!6133 () Bool)

(assert (=> tb!3299 (= result!6133 tp_is_empty!10837)))

(assert (=> b!419226 t!12472))

(declare-fun b_and!17221 () Bool)

(assert (= b_and!17219 (and (=> t!12472 result!6133) b_and!17221)))

(declare-fun m!408277 () Bool)

(assert (=> b!419238 m!408277))

(declare-fun m!408279 () Bool)

(assert (=> b!419230 m!408279))

(declare-fun m!408281 () Bool)

(assert (=> b!419232 m!408281))

(declare-fun m!408283 () Bool)

(assert (=> start!39404 m!408283))

(declare-fun m!408285 () Bool)

(assert (=> start!39404 m!408285))

(declare-fun m!408287 () Bool)

(assert (=> b!419237 m!408287))

(declare-fun m!408289 () Bool)

(assert (=> b!419237 m!408289))

(declare-fun m!408291 () Bool)

(assert (=> b!419241 m!408291))

(declare-fun m!408293 () Bool)

(assert (=> mapNonEmpty!17877 m!408293))

(declare-fun m!408295 () Bool)

(assert (=> b!419229 m!408295))

(declare-fun m!408297 () Bool)

(assert (=> b!419242 m!408297))

(declare-fun m!408299 () Bool)

(assert (=> b!419242 m!408299))

(declare-fun m!408301 () Bool)

(assert (=> b!419242 m!408301))

(declare-fun m!408303 () Bool)

(assert (=> b!419240 m!408303))

(declare-fun m!408305 () Bool)

(assert (=> bm!29205 m!408305))

(declare-fun m!408307 () Bool)

(assert (=> b!419226 m!408307))

(declare-fun m!408309 () Bool)

(assert (=> b!419226 m!408309))

(declare-fun m!408311 () Bool)

(assert (=> b!419226 m!408311))

(assert (=> b!419226 m!408299))

(declare-fun m!408313 () Bool)

(assert (=> b!419226 m!408313))

(declare-fun m!408315 () Bool)

(assert (=> b!419226 m!408315))

(declare-fun m!408317 () Bool)

(assert (=> b!419226 m!408317))

(declare-fun m!408319 () Bool)

(assert (=> b!419226 m!408319))

(declare-fun m!408321 () Bool)

(assert (=> b!419226 m!408321))

(assert (=> b!419226 m!408315))

(declare-fun m!408323 () Bool)

(assert (=> b!419226 m!408323))

(declare-fun m!408325 () Bool)

(assert (=> b!419226 m!408325))

(declare-fun m!408327 () Bool)

(assert (=> b!419226 m!408327))

(assert (=> b!419226 m!408319))

(declare-fun m!408329 () Bool)

(assert (=> b!419226 m!408329))

(assert (=> b!419226 m!408323))

(declare-fun m!408331 () Bool)

(assert (=> b!419235 m!408331))

(declare-fun m!408333 () Bool)

(assert (=> bm!29206 m!408333))

(declare-fun m!408335 () Bool)

(assert (=> b!419231 m!408335))

(declare-fun m!408337 () Bool)

(assert (=> b!419239 m!408337))

(assert (=> b!419239 m!408337))

(declare-fun m!408339 () Bool)

(assert (=> b!419239 m!408339))

(declare-fun m!408341 () Bool)

(assert (=> b!419239 m!408341))

(check-sat (not b!419230) (not b!419238) (not b!419241) (not b!419242) (not start!39404) b_and!17221 (not b_next!9685) (not bm!29206) (not b_lambda!8971) (not b!419231) tp_is_empty!10837 (not b!419232) (not b!419235) (not b!419226) (not b!419240) (not mapNonEmpty!17877) (not b!419239) (not b!419237) (not bm!29205))
(check-sat b_and!17221 (not b_next!9685))
