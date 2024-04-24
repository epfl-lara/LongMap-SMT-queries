; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39398 () Bool)

(assert start!39398)

(declare-fun b_free!9679 () Bool)

(declare-fun b_next!9679 () Bool)

(assert (=> start!39398 (= b_free!9679 (not b_next!9679))))

(declare-fun tp!34566 () Bool)

(declare-fun b_and!17247 () Bool)

(assert (=> start!39398 (= tp!34566 b_and!17247)))

(declare-fun b!419269 () Bool)

(declare-fun e!249884 () Bool)

(declare-fun tp_is_empty!10831 () Bool)

(assert (=> b!419269 (= e!249884 tp_is_empty!10831)))

(declare-fun b!419270 () Bool)

(declare-fun res!244441 () Bool)

(declare-fun e!249889 () Bool)

(assert (=> b!419270 (=> (not res!244441) (not e!249889))))

(declare-datatypes ((array!25520 0))(
  ( (array!25521 (arr!12209 (Array (_ BitVec 32) (_ BitVec 64))) (size!12561 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25520)

(declare-datatypes ((List!7035 0))(
  ( (Nil!7032) (Cons!7031 (h!7887 (_ BitVec 64)) (t!12371 List!7035)) )
))
(declare-fun arrayNoDuplicates!0 (array!25520 (_ BitVec 32) List!7035) Bool)

(assert (=> b!419270 (= res!244441 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7032))))

(declare-fun mapIsEmpty!17868 () Bool)

(declare-fun mapRes!17868 () Bool)

(assert (=> mapIsEmpty!17868 mapRes!17868))

(declare-datatypes ((V!15547 0))(
  ( (V!15548 (val!5460 Int)) )
))
(declare-fun minValue!515 () V!15547)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5072 0))(
  ( (ValueCellFull!5072 (v!7708 V!15547)) (EmptyCell!5072) )
))
(declare-datatypes ((array!25522 0))(
  ( (array!25523 (arr!12210 (Array (_ BitVec 32) ValueCell!5072)) (size!12562 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25522)

(declare-fun c!55209 () Bool)

(declare-fun zeroValue!515 () V!15547)

(declare-datatypes ((tuple2!7024 0))(
  ( (tuple2!7025 (_1!3523 (_ BitVec 64)) (_2!3523 V!15547)) )
))
(declare-datatypes ((List!7036 0))(
  ( (Nil!7033) (Cons!7032 (h!7888 tuple2!7024) (t!12372 List!7036)) )
))
(declare-datatypes ((ListLongMap!5939 0))(
  ( (ListLongMap!5940 (toList!2985 List!7036)) )
))
(declare-fun call!29203 () ListLongMap!5939)

(declare-fun bm!29199 () Bool)

(declare-fun lt!192305 () array!25522)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!192298 () array!25520)

(declare-fun getCurrentListMapNoExtraKeys!1231 (array!25520 array!25522 (_ BitVec 32) (_ BitVec 32) V!15547 V!15547 (_ BitVec 32) Int) ListLongMap!5939)

(assert (=> bm!29199 (= call!29203 (getCurrentListMapNoExtraKeys!1231 (ite c!55209 _keys!709 lt!192298) (ite c!55209 _values!549 lt!192305) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29200 () Bool)

(declare-fun call!29202 () ListLongMap!5939)

(assert (=> bm!29200 (= call!29202 (getCurrentListMapNoExtraKeys!1231 (ite c!55209 lt!192298 _keys!709) (ite c!55209 lt!192305 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419272 () Bool)

(declare-fun e!249892 () Bool)

(assert (=> b!419272 (= e!249892 (= call!29203 call!29202))))

(declare-fun b!419273 () Bool)

(declare-fun res!244445 () Bool)

(assert (=> b!419273 (=> (not res!244445) (not e!249889))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419273 (= res!244445 (validKeyInArray!0 k0!794))))

(declare-fun b!419274 () Bool)

(declare-fun res!244449 () Bool)

(assert (=> b!419274 (=> (not res!244449) (not e!249889))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419274 (= res!244449 (or (= (select (arr!12209 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12209 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419275 () Bool)

(declare-fun res!244450 () Bool)

(assert (=> b!419275 (=> (not res!244450) (not e!249889))))

(declare-fun arrayContainsKey!0 (array!25520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419275 (= res!244450 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17868 () Bool)

(declare-fun tp!34565 () Bool)

(declare-fun e!249890 () Bool)

(assert (=> mapNonEmpty!17868 (= mapRes!17868 (and tp!34565 e!249890))))

(declare-fun mapKey!17868 () (_ BitVec 32))

(declare-fun mapRest!17868 () (Array (_ BitVec 32) ValueCell!5072))

(declare-fun mapValue!17868 () ValueCell!5072)

(assert (=> mapNonEmpty!17868 (= (arr!12210 _values!549) (store mapRest!17868 mapKey!17868 mapValue!17868))))

(declare-fun b!419276 () Bool)

(assert (=> b!419276 (= e!249890 tp_is_empty!10831)))

(declare-fun b!419277 () Bool)

(declare-fun res!244451 () Bool)

(assert (=> b!419277 (=> (not res!244451) (not e!249889))))

(assert (=> b!419277 (= res!244451 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12561 _keys!709))))))

(declare-fun b!419278 () Bool)

(declare-fun res!244446 () Bool)

(declare-fun e!249891 () Bool)

(assert (=> b!419278 (=> (not res!244446) (not e!249891))))

(assert (=> b!419278 (= res!244446 (bvsle from!863 i!563))))

(declare-fun b!419279 () Bool)

(declare-fun res!244444 () Bool)

(assert (=> b!419279 (=> (not res!244444) (not e!249891))))

(assert (=> b!419279 (= res!244444 (arrayNoDuplicates!0 lt!192298 #b00000000000000000000000000000000 Nil!7032))))

(declare-fun b!419280 () Bool)

(declare-fun e!249885 () Bool)

(assert (=> b!419280 (= e!249885 true)))

(declare-fun lt!192296 () ListLongMap!5939)

(declare-fun lt!192303 () V!15547)

(declare-fun lt!192301 () tuple2!7024)

(declare-fun +!1249 (ListLongMap!5939 tuple2!7024) ListLongMap!5939)

(assert (=> b!419280 (= (+!1249 lt!192296 lt!192301) (+!1249 (+!1249 lt!192296 (tuple2!7025 k0!794 lt!192303)) lt!192301))))

(declare-fun lt!192302 () V!15547)

(assert (=> b!419280 (= lt!192301 (tuple2!7025 k0!794 lt!192302))))

(declare-datatypes ((Unit!12371 0))(
  ( (Unit!12372) )
))
(declare-fun lt!192304 () Unit!12371)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!39 (ListLongMap!5939 (_ BitVec 64) V!15547 V!15547) Unit!12371)

(assert (=> b!419280 (= lt!192304 (addSameAsAddTwiceSameKeyDiffValues!39 lt!192296 k0!794 lt!192303 lt!192302))))

(declare-fun lt!192297 () V!15547)

(declare-fun get!6053 (ValueCell!5072 V!15547) V!15547)

(assert (=> b!419280 (= lt!192303 (get!6053 (select (arr!12210 _values!549) from!863) lt!192297))))

(declare-fun lt!192300 () ListLongMap!5939)

(assert (=> b!419280 (= lt!192300 (+!1249 lt!192296 (tuple2!7025 (select (arr!12209 lt!192298) from!863) lt!192302)))))

(declare-fun v!412 () V!15547)

(assert (=> b!419280 (= lt!192302 (get!6053 (select (store (arr!12210 _values!549) i!563 (ValueCellFull!5072 v!412)) from!863) lt!192297))))

(declare-fun dynLambda!706 (Int (_ BitVec 64)) V!15547)

(assert (=> b!419280 (= lt!192297 (dynLambda!706 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419280 (= lt!192296 (getCurrentListMapNoExtraKeys!1231 lt!192298 lt!192305 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419281 () Bool)

(declare-fun e!249886 () Bool)

(assert (=> b!419281 (= e!249891 e!249886)))

(declare-fun res!244440 () Bool)

(assert (=> b!419281 (=> (not res!244440) (not e!249886))))

(assert (=> b!419281 (= res!244440 (= from!863 i!563))))

(assert (=> b!419281 (= lt!192300 (getCurrentListMapNoExtraKeys!1231 lt!192298 lt!192305 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419281 (= lt!192305 (array!25523 (store (arr!12210 _values!549) i!563 (ValueCellFull!5072 v!412)) (size!12562 _values!549)))))

(declare-fun lt!192306 () ListLongMap!5939)

(assert (=> b!419281 (= lt!192306 (getCurrentListMapNoExtraKeys!1231 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419282 () Bool)

(declare-fun e!249888 () Bool)

(assert (=> b!419282 (= e!249888 (and e!249884 mapRes!17868))))

(declare-fun condMapEmpty!17868 () Bool)

(declare-fun mapDefault!17868 () ValueCell!5072)

(assert (=> b!419282 (= condMapEmpty!17868 (= (arr!12210 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5072)) mapDefault!17868)))))

(declare-fun b!419283 () Bool)

(assert (=> b!419283 (= e!249886 (not e!249885))))

(declare-fun res!244452 () Bool)

(assert (=> b!419283 (=> res!244452 e!249885)))

(assert (=> b!419283 (= res!244452 (validKeyInArray!0 (select (arr!12209 _keys!709) from!863)))))

(assert (=> b!419283 e!249892))

(assert (=> b!419283 (= c!55209 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192299 () Unit!12371)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!441 (array!25520 array!25522 (_ BitVec 32) (_ BitVec 32) V!15547 V!15547 (_ BitVec 32) (_ BitVec 64) V!15547 (_ BitVec 32) Int) Unit!12371)

(assert (=> b!419283 (= lt!192299 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!441 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419271 () Bool)

(declare-fun res!244447 () Bool)

(assert (=> b!419271 (=> (not res!244447) (not e!249889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419271 (= res!244447 (validMask!0 mask!1025))))

(declare-fun res!244448 () Bool)

(assert (=> start!39398 (=> (not res!244448) (not e!249889))))

(assert (=> start!39398 (= res!244448 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12561 _keys!709))))))

(assert (=> start!39398 e!249889))

(assert (=> start!39398 tp_is_empty!10831))

(assert (=> start!39398 tp!34566))

(assert (=> start!39398 true))

(declare-fun array_inv!8974 (array!25522) Bool)

(assert (=> start!39398 (and (array_inv!8974 _values!549) e!249888)))

(declare-fun array_inv!8975 (array!25520) Bool)

(assert (=> start!39398 (array_inv!8975 _keys!709)))

(declare-fun b!419284 () Bool)

(assert (=> b!419284 (= e!249889 e!249891)))

(declare-fun res!244442 () Bool)

(assert (=> b!419284 (=> (not res!244442) (not e!249891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25520 (_ BitVec 32)) Bool)

(assert (=> b!419284 (= res!244442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192298 mask!1025))))

(assert (=> b!419284 (= lt!192298 (array!25521 (store (arr!12209 _keys!709) i!563 k0!794) (size!12561 _keys!709)))))

(declare-fun b!419285 () Bool)

(assert (=> b!419285 (= e!249892 (= call!29202 (+!1249 call!29203 (tuple2!7025 k0!794 v!412))))))

(declare-fun b!419286 () Bool)

(declare-fun res!244439 () Bool)

(assert (=> b!419286 (=> (not res!244439) (not e!249889))))

(assert (=> b!419286 (= res!244439 (and (= (size!12562 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12561 _keys!709) (size!12562 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419287 () Bool)

(declare-fun res!244443 () Bool)

(assert (=> b!419287 (=> (not res!244443) (not e!249889))))

(assert (=> b!419287 (= res!244443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39398 res!244448) b!419271))

(assert (= (and b!419271 res!244447) b!419286))

(assert (= (and b!419286 res!244439) b!419287))

(assert (= (and b!419287 res!244443) b!419270))

(assert (= (and b!419270 res!244441) b!419277))

(assert (= (and b!419277 res!244451) b!419273))

(assert (= (and b!419273 res!244445) b!419274))

(assert (= (and b!419274 res!244449) b!419275))

(assert (= (and b!419275 res!244450) b!419284))

(assert (= (and b!419284 res!244442) b!419279))

(assert (= (and b!419279 res!244444) b!419278))

(assert (= (and b!419278 res!244446) b!419281))

(assert (= (and b!419281 res!244440) b!419283))

(assert (= (and b!419283 c!55209) b!419285))

(assert (= (and b!419283 (not c!55209)) b!419272))

(assert (= (or b!419285 b!419272) bm!29200))

(assert (= (or b!419285 b!419272) bm!29199))

(assert (= (and b!419283 (not res!244452)) b!419280))

(assert (= (and b!419282 condMapEmpty!17868) mapIsEmpty!17868))

(assert (= (and b!419282 (not condMapEmpty!17868)) mapNonEmpty!17868))

(get-info :version)

(assert (= (and mapNonEmpty!17868 ((_ is ValueCellFull!5072) mapValue!17868)) b!419276))

(assert (= (and b!419282 ((_ is ValueCellFull!5072) mapDefault!17868)) b!419269))

(assert (= start!39398 b!419282))

(declare-fun b_lambda!9005 () Bool)

(assert (=> (not b_lambda!9005) (not b!419280)))

(declare-fun t!12370 () Bool)

(declare-fun tb!3293 () Bool)

(assert (=> (and start!39398 (= defaultEntry!557 defaultEntry!557) t!12370) tb!3293))

(declare-fun result!6121 () Bool)

(assert (=> tb!3293 (= result!6121 tp_is_empty!10831)))

(assert (=> b!419280 t!12370))

(declare-fun b_and!17249 () Bool)

(assert (= b_and!17247 (and (=> t!12370 result!6121) b_and!17249)))

(declare-fun m!409031 () Bool)

(assert (=> b!419285 m!409031))

(declare-fun m!409033 () Bool)

(assert (=> b!419283 m!409033))

(assert (=> b!419283 m!409033))

(declare-fun m!409035 () Bool)

(assert (=> b!419283 m!409035))

(declare-fun m!409037 () Bool)

(assert (=> b!419283 m!409037))

(declare-fun m!409039 () Bool)

(assert (=> b!419287 m!409039))

(declare-fun m!409041 () Bool)

(assert (=> b!419281 m!409041))

(declare-fun m!409043 () Bool)

(assert (=> b!419281 m!409043))

(declare-fun m!409045 () Bool)

(assert (=> b!419281 m!409045))

(declare-fun m!409047 () Bool)

(assert (=> b!419279 m!409047))

(declare-fun m!409049 () Bool)

(assert (=> b!419271 m!409049))

(declare-fun m!409051 () Bool)

(assert (=> b!419275 m!409051))

(declare-fun m!409053 () Bool)

(assert (=> b!419284 m!409053))

(declare-fun m!409055 () Bool)

(assert (=> b!419284 m!409055))

(declare-fun m!409057 () Bool)

(assert (=> b!419280 m!409057))

(declare-fun m!409059 () Bool)

(assert (=> b!419280 m!409059))

(declare-fun m!409061 () Bool)

(assert (=> b!419280 m!409061))

(declare-fun m!409063 () Bool)

(assert (=> b!419280 m!409063))

(declare-fun m!409065 () Bool)

(assert (=> b!419280 m!409065))

(assert (=> b!419280 m!409059))

(declare-fun m!409067 () Bool)

(assert (=> b!419280 m!409067))

(assert (=> b!419280 m!409067))

(declare-fun m!409069 () Bool)

(assert (=> b!419280 m!409069))

(declare-fun m!409071 () Bool)

(assert (=> b!419280 m!409071))

(declare-fun m!409073 () Bool)

(assert (=> b!419280 m!409073))

(declare-fun m!409075 () Bool)

(assert (=> b!419280 m!409075))

(declare-fun m!409077 () Bool)

(assert (=> b!419280 m!409077))

(assert (=> b!419280 m!409043))

(assert (=> b!419280 m!409075))

(declare-fun m!409079 () Bool)

(assert (=> b!419280 m!409079))

(declare-fun m!409081 () Bool)

(assert (=> b!419270 m!409081))

(declare-fun m!409083 () Bool)

(assert (=> bm!29200 m!409083))

(declare-fun m!409085 () Bool)

(assert (=> mapNonEmpty!17868 m!409085))

(declare-fun m!409087 () Bool)

(assert (=> b!419273 m!409087))

(declare-fun m!409089 () Bool)

(assert (=> start!39398 m!409089))

(declare-fun m!409091 () Bool)

(assert (=> start!39398 m!409091))

(declare-fun m!409093 () Bool)

(assert (=> b!419274 m!409093))

(declare-fun m!409095 () Bool)

(assert (=> bm!29199 m!409095))

(check-sat tp_is_empty!10831 (not b!419283) (not b!419271) (not b!419281) (not b_next!9679) (not b!419279) (not b!419287) (not mapNonEmpty!17868) (not bm!29200) (not b!419275) (not b!419280) (not bm!29199) (not b!419285) (not b_lambda!9005) b_and!17249 (not b!419284) (not b!419273) (not b!419270) (not start!39398))
(check-sat b_and!17249 (not b_next!9679))
