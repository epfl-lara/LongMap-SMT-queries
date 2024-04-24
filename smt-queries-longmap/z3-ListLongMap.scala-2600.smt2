; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39404 () Bool)

(assert start!39404)

(declare-fun b_free!9685 () Bool)

(declare-fun b_next!9685 () Bool)

(assert (=> start!39404 (= b_free!9685 (not b_next!9685))))

(declare-fun tp!34584 () Bool)

(declare-fun b_and!17259 () Bool)

(assert (=> start!39404 (= tp!34584 b_and!17259)))

(declare-fun b!419446 () Bool)

(declare-fun e!249967 () Bool)

(declare-fun e!249971 () Bool)

(assert (=> b!419446 (= e!249967 e!249971)))

(declare-fun res!244565 () Bool)

(assert (=> b!419446 (=> (not res!244565) (not e!249971))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419446 (= res!244565 (= from!863 i!563))))

(declare-datatypes ((V!15555 0))(
  ( (V!15556 (val!5463 Int)) )
))
(declare-fun minValue!515 () V!15555)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25530 0))(
  ( (array!25531 (arr!12214 (Array (_ BitVec 32) (_ BitVec 64))) (size!12566 (_ BitVec 32))) )
))
(declare-fun lt!192398 () array!25530)

(declare-fun zeroValue!515 () V!15555)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5075 0))(
  ( (ValueCellFull!5075 (v!7711 V!15555)) (EmptyCell!5075) )
))
(declare-datatypes ((array!25532 0))(
  ( (array!25533 (arr!12215 (Array (_ BitVec 32) ValueCell!5075)) (size!12567 (_ BitVec 32))) )
))
(declare-fun lt!192399 () array!25532)

(declare-datatypes ((tuple2!7028 0))(
  ( (tuple2!7029 (_1!3525 (_ BitVec 64)) (_2!3525 V!15555)) )
))
(declare-datatypes ((List!7039 0))(
  ( (Nil!7036) (Cons!7035 (h!7891 tuple2!7028) (t!12381 List!7039)) )
))
(declare-datatypes ((ListLongMap!5943 0))(
  ( (ListLongMap!5944 (toList!2987 List!7039)) )
))
(declare-fun lt!192403 () ListLongMap!5943)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1233 (array!25530 array!25532 (_ BitVec 32) (_ BitVec 32) V!15555 V!15555 (_ BitVec 32) Int) ListLongMap!5943)

(assert (=> b!419446 (= lt!192403 (getCurrentListMapNoExtraKeys!1233 lt!192398 lt!192399 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25532)

(declare-fun v!412 () V!15555)

(assert (=> b!419446 (= lt!192399 (array!25533 (store (arr!12215 _values!549) i!563 (ValueCellFull!5075 v!412)) (size!12567 _values!549)))))

(declare-fun lt!192400 () ListLongMap!5943)

(declare-fun _keys!709 () array!25530)

(assert (=> b!419446 (= lt!192400 (getCurrentListMapNoExtraKeys!1233 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419447 () Bool)

(declare-fun res!244572 () Bool)

(assert (=> b!419447 (=> (not res!244572) (not e!249967))))

(declare-datatypes ((List!7040 0))(
  ( (Nil!7037) (Cons!7036 (h!7892 (_ BitVec 64)) (t!12382 List!7040)) )
))
(declare-fun arrayNoDuplicates!0 (array!25530 (_ BitVec 32) List!7040) Bool)

(assert (=> b!419447 (= res!244572 (arrayNoDuplicates!0 lt!192398 #b00000000000000000000000000000000 Nil!7037))))

(declare-fun res!244575 () Bool)

(declare-fun e!249969 () Bool)

(assert (=> start!39404 (=> (not res!244575) (not e!249969))))

(assert (=> start!39404 (= res!244575 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12566 _keys!709))))))

(assert (=> start!39404 e!249969))

(declare-fun tp_is_empty!10837 () Bool)

(assert (=> start!39404 tp_is_empty!10837))

(assert (=> start!39404 tp!34584))

(assert (=> start!39404 true))

(declare-fun e!249966 () Bool)

(declare-fun array_inv!8978 (array!25532) Bool)

(assert (=> start!39404 (and (array_inv!8978 _values!549) e!249966)))

(declare-fun array_inv!8979 (array!25530) Bool)

(assert (=> start!39404 (array_inv!8979 _keys!709)))

(declare-fun b!419448 () Bool)

(declare-fun res!244573 () Bool)

(assert (=> b!419448 (=> (not res!244573) (not e!249969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419448 (= res!244573 (validMask!0 mask!1025))))

(declare-fun b!419449 () Bool)

(assert (=> b!419449 (= e!249969 e!249967)))

(declare-fun res!244576 () Bool)

(assert (=> b!419449 (=> (not res!244576) (not e!249967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25530 (_ BitVec 32)) Bool)

(assert (=> b!419449 (= res!244576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192398 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!419449 (= lt!192398 (array!25531 (store (arr!12214 _keys!709) i!563 k0!794) (size!12566 _keys!709)))))

(declare-fun mapIsEmpty!17877 () Bool)

(declare-fun mapRes!17877 () Bool)

(assert (=> mapIsEmpty!17877 mapRes!17877))

(declare-fun e!249965 () Bool)

(declare-fun call!29221 () ListLongMap!5943)

(declare-fun call!29220 () ListLongMap!5943)

(declare-fun b!419450 () Bool)

(declare-fun +!1251 (ListLongMap!5943 tuple2!7028) ListLongMap!5943)

(assert (=> b!419450 (= e!249965 (= call!29220 (+!1251 call!29221 (tuple2!7029 k0!794 v!412))))))

(declare-fun b!419451 () Bool)

(declare-fun res!244577 () Bool)

(assert (=> b!419451 (=> (not res!244577) (not e!249969))))

(declare-fun arrayContainsKey!0 (array!25530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419451 (= res!244577 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419452 () Bool)

(declare-fun res!244566 () Bool)

(assert (=> b!419452 (=> (not res!244566) (not e!249969))))

(assert (=> b!419452 (= res!244566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419453 () Bool)

(declare-fun e!249968 () Bool)

(assert (=> b!419453 (= e!249971 (not e!249968))))

(declare-fun res!244570 () Bool)

(assert (=> b!419453 (=> res!244570 e!249968)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419453 (= res!244570 (validKeyInArray!0 (select (arr!12214 _keys!709) from!863)))))

(assert (=> b!419453 e!249965))

(declare-fun c!55218 () Bool)

(assert (=> b!419453 (= c!55218 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12375 0))(
  ( (Unit!12376) )
))
(declare-fun lt!192402 () Unit!12375)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!443 (array!25530 array!25532 (_ BitVec 32) (_ BitVec 32) V!15555 V!15555 (_ BitVec 32) (_ BitVec 64) V!15555 (_ BitVec 32) Int) Unit!12375)

(assert (=> b!419453 (= lt!192402 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!443 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17877 () Bool)

(declare-fun tp!34583 () Bool)

(declare-fun e!249973 () Bool)

(assert (=> mapNonEmpty!17877 (= mapRes!17877 (and tp!34583 e!249973))))

(declare-fun mapRest!17877 () (Array (_ BitVec 32) ValueCell!5075))

(declare-fun mapValue!17877 () ValueCell!5075)

(declare-fun mapKey!17877 () (_ BitVec 32))

(assert (=> mapNonEmpty!17877 (= (arr!12215 _values!549) (store mapRest!17877 mapKey!17877 mapValue!17877))))

(declare-fun bm!29217 () Bool)

(assert (=> bm!29217 (= call!29220 (getCurrentListMapNoExtraKeys!1233 (ite c!55218 lt!192398 _keys!709) (ite c!55218 lt!192399 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29218 () Bool)

(assert (=> bm!29218 (= call!29221 (getCurrentListMapNoExtraKeys!1233 (ite c!55218 _keys!709 lt!192398) (ite c!55218 _values!549 lt!192399) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419454 () Bool)

(declare-fun res!244578 () Bool)

(assert (=> b!419454 (=> (not res!244578) (not e!249969))))

(assert (=> b!419454 (= res!244578 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7037))))

(declare-fun b!419455 () Bool)

(declare-fun res!244574 () Bool)

(assert (=> b!419455 (=> (not res!244574) (not e!249969))))

(assert (=> b!419455 (= res!244574 (or (= (select (arr!12214 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12214 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419456 () Bool)

(declare-fun res!244569 () Bool)

(assert (=> b!419456 (=> (not res!244569) (not e!249969))))

(assert (=> b!419456 (= res!244569 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12566 _keys!709))))))

(declare-fun b!419457 () Bool)

(assert (=> b!419457 (= e!249968 true)))

(declare-fun lt!192401 () V!15555)

(declare-fun lt!192405 () tuple2!7028)

(declare-fun lt!192397 () ListLongMap!5943)

(assert (=> b!419457 (= (+!1251 lt!192397 lt!192405) (+!1251 (+!1251 lt!192397 (tuple2!7029 k0!794 lt!192401)) lt!192405))))

(declare-fun lt!192395 () V!15555)

(assert (=> b!419457 (= lt!192405 (tuple2!7029 k0!794 lt!192395))))

(declare-fun lt!192404 () Unit!12375)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!41 (ListLongMap!5943 (_ BitVec 64) V!15555 V!15555) Unit!12375)

(assert (=> b!419457 (= lt!192404 (addSameAsAddTwiceSameKeyDiffValues!41 lt!192397 k0!794 lt!192401 lt!192395))))

(declare-fun lt!192396 () V!15555)

(declare-fun get!6057 (ValueCell!5075 V!15555) V!15555)

(assert (=> b!419457 (= lt!192401 (get!6057 (select (arr!12215 _values!549) from!863) lt!192396))))

(assert (=> b!419457 (= lt!192403 (+!1251 lt!192397 (tuple2!7029 (select (arr!12214 lt!192398) from!863) lt!192395)))))

(assert (=> b!419457 (= lt!192395 (get!6057 (select (store (arr!12215 _values!549) i!563 (ValueCellFull!5075 v!412)) from!863) lt!192396))))

(declare-fun dynLambda!708 (Int (_ BitVec 64)) V!15555)

(assert (=> b!419457 (= lt!192396 (dynLambda!708 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419457 (= lt!192397 (getCurrentListMapNoExtraKeys!1233 lt!192398 lt!192399 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419458 () Bool)

(assert (=> b!419458 (= e!249965 (= call!29221 call!29220))))

(declare-fun b!419459 () Bool)

(declare-fun res!244567 () Bool)

(assert (=> b!419459 (=> (not res!244567) (not e!249969))))

(assert (=> b!419459 (= res!244567 (validKeyInArray!0 k0!794))))

(declare-fun b!419460 () Bool)

(declare-fun e!249972 () Bool)

(assert (=> b!419460 (= e!249966 (and e!249972 mapRes!17877))))

(declare-fun condMapEmpty!17877 () Bool)

(declare-fun mapDefault!17877 () ValueCell!5075)

(assert (=> b!419460 (= condMapEmpty!17877 (= (arr!12215 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5075)) mapDefault!17877)))))

(declare-fun b!419461 () Bool)

(assert (=> b!419461 (= e!249972 tp_is_empty!10837)))

(declare-fun b!419462 () Bool)

(declare-fun res!244568 () Bool)

(assert (=> b!419462 (=> (not res!244568) (not e!249967))))

(assert (=> b!419462 (= res!244568 (bvsle from!863 i!563))))

(declare-fun b!419463 () Bool)

(declare-fun res!244571 () Bool)

(assert (=> b!419463 (=> (not res!244571) (not e!249969))))

(assert (=> b!419463 (= res!244571 (and (= (size!12567 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12566 _keys!709) (size!12567 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419464 () Bool)

(assert (=> b!419464 (= e!249973 tp_is_empty!10837)))

(assert (= (and start!39404 res!244575) b!419448))

(assert (= (and b!419448 res!244573) b!419463))

(assert (= (and b!419463 res!244571) b!419452))

(assert (= (and b!419452 res!244566) b!419454))

(assert (= (and b!419454 res!244578) b!419456))

(assert (= (and b!419456 res!244569) b!419459))

(assert (= (and b!419459 res!244567) b!419455))

(assert (= (and b!419455 res!244574) b!419451))

(assert (= (and b!419451 res!244577) b!419449))

(assert (= (and b!419449 res!244576) b!419447))

(assert (= (and b!419447 res!244572) b!419462))

(assert (= (and b!419462 res!244568) b!419446))

(assert (= (and b!419446 res!244565) b!419453))

(assert (= (and b!419453 c!55218) b!419450))

(assert (= (and b!419453 (not c!55218)) b!419458))

(assert (= (or b!419450 b!419458) bm!29217))

(assert (= (or b!419450 b!419458) bm!29218))

(assert (= (and b!419453 (not res!244570)) b!419457))

(assert (= (and b!419460 condMapEmpty!17877) mapIsEmpty!17877))

(assert (= (and b!419460 (not condMapEmpty!17877)) mapNonEmpty!17877))

(get-info :version)

(assert (= (and mapNonEmpty!17877 ((_ is ValueCellFull!5075) mapValue!17877)) b!419464))

(assert (= (and b!419460 ((_ is ValueCellFull!5075) mapDefault!17877)) b!419461))

(assert (= start!39404 b!419460))

(declare-fun b_lambda!9011 () Bool)

(assert (=> (not b_lambda!9011) (not b!419457)))

(declare-fun t!12380 () Bool)

(declare-fun tb!3299 () Bool)

(assert (=> (and start!39404 (= defaultEntry!557 defaultEntry!557) t!12380) tb!3299))

(declare-fun result!6133 () Bool)

(assert (=> tb!3299 (= result!6133 tp_is_empty!10837)))

(assert (=> b!419457 t!12380))

(declare-fun b_and!17261 () Bool)

(assert (= b_and!17259 (and (=> t!12380 result!6133) b_and!17261)))

(declare-fun m!409229 () Bool)

(assert (=> b!419452 m!409229))

(declare-fun m!409231 () Bool)

(assert (=> b!419453 m!409231))

(assert (=> b!419453 m!409231))

(declare-fun m!409233 () Bool)

(assert (=> b!419453 m!409233))

(declare-fun m!409235 () Bool)

(assert (=> b!419453 m!409235))

(declare-fun m!409237 () Bool)

(assert (=> b!419450 m!409237))

(declare-fun m!409239 () Bool)

(assert (=> b!419457 m!409239))

(declare-fun m!409241 () Bool)

(assert (=> b!419457 m!409241))

(declare-fun m!409243 () Bool)

(assert (=> b!419457 m!409243))

(declare-fun m!409245 () Bool)

(assert (=> b!419457 m!409245))

(declare-fun m!409247 () Bool)

(assert (=> b!419457 m!409247))

(declare-fun m!409249 () Bool)

(assert (=> b!419457 m!409249))

(declare-fun m!409251 () Bool)

(assert (=> b!419457 m!409251))

(assert (=> b!419457 m!409251))

(declare-fun m!409253 () Bool)

(assert (=> b!419457 m!409253))

(declare-fun m!409255 () Bool)

(assert (=> b!419457 m!409255))

(declare-fun m!409257 () Bool)

(assert (=> b!419457 m!409257))

(assert (=> b!419457 m!409249))

(declare-fun m!409259 () Bool)

(assert (=> b!419457 m!409259))

(declare-fun m!409261 () Bool)

(assert (=> b!419457 m!409261))

(declare-fun m!409263 () Bool)

(assert (=> b!419457 m!409263))

(assert (=> b!419457 m!409245))

(declare-fun m!409265 () Bool)

(assert (=> b!419454 m!409265))

(declare-fun m!409267 () Bool)

(assert (=> mapNonEmpty!17877 m!409267))

(declare-fun m!409269 () Bool)

(assert (=> bm!29218 m!409269))

(declare-fun m!409271 () Bool)

(assert (=> bm!29217 m!409271))

(declare-fun m!409273 () Bool)

(assert (=> b!419449 m!409273))

(declare-fun m!409275 () Bool)

(assert (=> b!419449 m!409275))

(declare-fun m!409277 () Bool)

(assert (=> b!419459 m!409277))

(declare-fun m!409279 () Bool)

(assert (=> b!419455 m!409279))

(declare-fun m!409281 () Bool)

(assert (=> b!419448 m!409281))

(declare-fun m!409283 () Bool)

(assert (=> b!419451 m!409283))

(declare-fun m!409285 () Bool)

(assert (=> start!39404 m!409285))

(declare-fun m!409287 () Bool)

(assert (=> start!39404 m!409287))

(declare-fun m!409289 () Bool)

(assert (=> b!419446 m!409289))

(assert (=> b!419446 m!409257))

(declare-fun m!409291 () Bool)

(assert (=> b!419446 m!409291))

(declare-fun m!409293 () Bool)

(assert (=> b!419447 m!409293))

(check-sat (not b!419454) (not mapNonEmpty!17877) (not b!419459) (not bm!29217) (not b!419450) (not b!419448) (not b_lambda!9011) (not b_next!9685) (not b!419453) (not b!419446) b_and!17261 tp_is_empty!10837 (not bm!29218) (not b!419457) (not b!419447) (not b!419452) (not b!419451) (not b!419449) (not start!39404))
(check-sat b_and!17261 (not b_next!9685))
