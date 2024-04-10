; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39366 () Bool)

(assert start!39366)

(declare-fun b_free!9633 () Bool)

(declare-fun b_next!9633 () Bool)

(assert (=> start!39366 (= b_free!9633 (not b_next!9633))))

(declare-fun tp!34428 () Bool)

(declare-fun b_and!17141 () Bool)

(assert (=> start!39366 (= tp!34428 b_and!17141)))

(declare-fun b!417961 () Bool)

(declare-fun res!243482 () Bool)

(declare-fun e!249296 () Bool)

(assert (=> b!417961 (=> (not res!243482) (not e!249296))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25421 0))(
  ( (array!25422 (arr!12160 (Array (_ BitVec 32) (_ BitVec 64))) (size!12512 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25421)

(assert (=> b!417961 (= res!243482 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12512 _keys!709))))))

(declare-fun b!417962 () Bool)

(declare-fun e!249300 () Bool)

(declare-fun e!249299 () Bool)

(assert (=> b!417962 (= e!249300 (not e!249299))))

(declare-fun res!243489 () Bool)

(assert (=> b!417962 (=> res!243489 e!249299)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417962 (= res!243489 (validKeyInArray!0 (select (arr!12160 _keys!709) from!863)))))

(declare-fun e!249302 () Bool)

(assert (=> b!417962 e!249302))

(declare-fun c!55163 () Bool)

(assert (=> b!417962 (= c!55163 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15485 0))(
  ( (V!15486 (val!5437 Int)) )
))
(declare-fun minValue!515 () V!15485)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5049 0))(
  ( (ValueCellFull!5049 (v!7684 V!15485)) (EmptyCell!5049) )
))
(declare-datatypes ((array!25423 0))(
  ( (array!25424 (arr!12161 (Array (_ BitVec 32) ValueCell!5049)) (size!12513 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25423)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12352 0))(
  ( (Unit!12353) )
))
(declare-fun lt!191518 () Unit!12352)

(declare-fun v!412 () V!15485)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15485)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!429 (array!25421 array!25423 (_ BitVec 32) (_ BitVec 32) V!15485 V!15485 (_ BitVec 32) (_ BitVec 64) V!15485 (_ BitVec 32) Int) Unit!12352)

(assert (=> b!417962 (= lt!191518 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!429 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417963 () Bool)

(declare-fun res!243481 () Bool)

(assert (=> b!417963 (=> (not res!243481) (not e!249296))))

(declare-fun arrayContainsKey!0 (array!25421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417963 (= res!243481 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417964 () Bool)

(assert (=> b!417964 (= e!249299 true)))

(declare-fun lt!191522 () V!15485)

(declare-datatypes ((tuple2!7104 0))(
  ( (tuple2!7105 (_1!3563 (_ BitVec 64)) (_2!3563 V!15485)) )
))
(declare-datatypes ((List!7119 0))(
  ( (Nil!7116) (Cons!7115 (h!7971 tuple2!7104) (t!12417 List!7119)) )
))
(declare-datatypes ((ListLongMap!6017 0))(
  ( (ListLongMap!6018 (toList!3024 List!7119)) )
))
(declare-fun lt!191523 () ListLongMap!6017)

(declare-fun lt!191528 () tuple2!7104)

(declare-fun +!1224 (ListLongMap!6017 tuple2!7104) ListLongMap!6017)

(assert (=> b!417964 (= (+!1224 lt!191523 lt!191528) (+!1224 (+!1224 lt!191523 (tuple2!7105 k0!794 lt!191522)) lt!191528))))

(declare-fun lt!191521 () V!15485)

(assert (=> b!417964 (= lt!191528 (tuple2!7105 k0!794 lt!191521))))

(declare-fun lt!191526 () Unit!12352)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!24 (ListLongMap!6017 (_ BitVec 64) V!15485 V!15485) Unit!12352)

(assert (=> b!417964 (= lt!191526 (addSameAsAddTwiceSameKeyDiffValues!24 lt!191523 k0!794 lt!191522 lt!191521))))

(declare-fun lt!191525 () V!15485)

(declare-fun get!6020 (ValueCell!5049 V!15485) V!15485)

(assert (=> b!417964 (= lt!191522 (get!6020 (select (arr!12161 _values!549) from!863) lt!191525))))

(declare-fun lt!191524 () ListLongMap!6017)

(declare-fun lt!191519 () array!25421)

(assert (=> b!417964 (= lt!191524 (+!1224 lt!191523 (tuple2!7105 (select (arr!12160 lt!191519) from!863) lt!191521)))))

(assert (=> b!417964 (= lt!191521 (get!6020 (select (store (arr!12161 _values!549) i!563 (ValueCellFull!5049 v!412)) from!863) lt!191525))))

(declare-fun dynLambda!695 (Int (_ BitVec 64)) V!15485)

(assert (=> b!417964 (= lt!191525 (dynLambda!695 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!191520 () array!25423)

(declare-fun getCurrentListMapNoExtraKeys!1229 (array!25421 array!25423 (_ BitVec 32) (_ BitVec 32) V!15485 V!15485 (_ BitVec 32) Int) ListLongMap!6017)

(assert (=> b!417964 (= lt!191523 (getCurrentListMapNoExtraKeys!1229 lt!191519 lt!191520 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417965 () Bool)

(declare-fun e!249298 () Bool)

(declare-fun tp_is_empty!10785 () Bool)

(assert (=> b!417965 (= e!249298 tp_is_empty!10785)))

(declare-fun mapNonEmpty!17799 () Bool)

(declare-fun mapRes!17799 () Bool)

(declare-fun tp!34427 () Bool)

(assert (=> mapNonEmpty!17799 (= mapRes!17799 (and tp!34427 e!249298))))

(declare-fun mapValue!17799 () ValueCell!5049)

(declare-fun mapKey!17799 () (_ BitVec 32))

(declare-fun mapRest!17799 () (Array (_ BitVec 32) ValueCell!5049))

(assert (=> mapNonEmpty!17799 (= (arr!12161 _values!549) (store mapRest!17799 mapKey!17799 mapValue!17799))))

(declare-fun b!417966 () Bool)

(declare-fun e!249297 () Bool)

(assert (=> b!417966 (= e!249297 tp_is_empty!10785)))

(declare-fun b!417967 () Bool)

(declare-fun e!249295 () Bool)

(assert (=> b!417967 (= e!249295 e!249300)))

(declare-fun res!243487 () Bool)

(assert (=> b!417967 (=> (not res!243487) (not e!249300))))

(assert (=> b!417967 (= res!243487 (= from!863 i!563))))

(assert (=> b!417967 (= lt!191524 (getCurrentListMapNoExtraKeys!1229 lt!191519 lt!191520 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417967 (= lt!191520 (array!25424 (store (arr!12161 _values!549) i!563 (ValueCellFull!5049 v!412)) (size!12513 _values!549)))))

(declare-fun lt!191527 () ListLongMap!6017)

(assert (=> b!417967 (= lt!191527 (getCurrentListMapNoExtraKeys!1229 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417968 () Bool)

(assert (=> b!417968 (= e!249296 e!249295)))

(declare-fun res!243486 () Bool)

(assert (=> b!417968 (=> (not res!243486) (not e!249295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25421 (_ BitVec 32)) Bool)

(assert (=> b!417968 (= res!243486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191519 mask!1025))))

(assert (=> b!417968 (= lt!191519 (array!25422 (store (arr!12160 _keys!709) i!563 k0!794) (size!12512 _keys!709)))))

(declare-fun b!417969 () Bool)

(declare-fun res!243483 () Bool)

(assert (=> b!417969 (=> (not res!243483) (not e!249296))))

(assert (=> b!417969 (= res!243483 (validKeyInArray!0 k0!794))))

(declare-fun b!417970 () Bool)

(declare-fun e!249303 () Bool)

(assert (=> b!417970 (= e!249303 (and e!249297 mapRes!17799))))

(declare-fun condMapEmpty!17799 () Bool)

(declare-fun mapDefault!17799 () ValueCell!5049)

(assert (=> b!417970 (= condMapEmpty!17799 (= (arr!12161 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5049)) mapDefault!17799)))))

(declare-fun b!417971 () Bool)

(declare-fun res!243476 () Bool)

(assert (=> b!417971 (=> (not res!243476) (not e!249296))))

(assert (=> b!417971 (= res!243476 (or (= (select (arr!12160 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12160 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417972 () Bool)

(declare-fun res!243478 () Bool)

(assert (=> b!417972 (=> (not res!243478) (not e!249296))))

(assert (=> b!417972 (= res!243478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun call!29077 () ListLongMap!6017)

(declare-fun bm!29074 () Bool)

(assert (=> bm!29074 (= call!29077 (getCurrentListMapNoExtraKeys!1229 (ite c!55163 lt!191519 _keys!709) (ite c!55163 lt!191520 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417973 () Bool)

(declare-fun res!243488 () Bool)

(assert (=> b!417973 (=> (not res!243488) (not e!249295))))

(declare-datatypes ((List!7120 0))(
  ( (Nil!7117) (Cons!7116 (h!7972 (_ BitVec 64)) (t!12418 List!7120)) )
))
(declare-fun arrayNoDuplicates!0 (array!25421 (_ BitVec 32) List!7120) Bool)

(assert (=> b!417973 (= res!243488 (arrayNoDuplicates!0 lt!191519 #b00000000000000000000000000000000 Nil!7117))))

(declare-fun b!417974 () Bool)

(declare-fun call!29078 () ListLongMap!6017)

(assert (=> b!417974 (= e!249302 (= call!29078 call!29077))))

(declare-fun res!243477 () Bool)

(assert (=> start!39366 (=> (not res!243477) (not e!249296))))

(assert (=> start!39366 (= res!243477 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12512 _keys!709))))))

(assert (=> start!39366 e!249296))

(assert (=> start!39366 tp_is_empty!10785))

(assert (=> start!39366 tp!34428))

(assert (=> start!39366 true))

(declare-fun array_inv!8864 (array!25423) Bool)

(assert (=> start!39366 (and (array_inv!8864 _values!549) e!249303)))

(declare-fun array_inv!8865 (array!25421) Bool)

(assert (=> start!39366 (array_inv!8865 _keys!709)))

(declare-fun b!417975 () Bool)

(declare-fun res!243484 () Bool)

(assert (=> b!417975 (=> (not res!243484) (not e!249296))))

(assert (=> b!417975 (= res!243484 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7117))))

(declare-fun mapIsEmpty!17799 () Bool)

(assert (=> mapIsEmpty!17799 mapRes!17799))

(declare-fun b!417976 () Bool)

(declare-fun res!243480 () Bool)

(assert (=> b!417976 (=> (not res!243480) (not e!249295))))

(assert (=> b!417976 (= res!243480 (bvsle from!863 i!563))))

(declare-fun b!417977 () Bool)

(declare-fun res!243485 () Bool)

(assert (=> b!417977 (=> (not res!243485) (not e!249296))))

(assert (=> b!417977 (= res!243485 (and (= (size!12513 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12512 _keys!709) (size!12513 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29075 () Bool)

(assert (=> bm!29075 (= call!29078 (getCurrentListMapNoExtraKeys!1229 (ite c!55163 _keys!709 lt!191519) (ite c!55163 _values!549 lt!191520) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417978 () Bool)

(declare-fun res!243479 () Bool)

(assert (=> b!417978 (=> (not res!243479) (not e!249296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417978 (= res!243479 (validMask!0 mask!1025))))

(declare-fun b!417979 () Bool)

(assert (=> b!417979 (= e!249302 (= call!29077 (+!1224 call!29078 (tuple2!7105 k0!794 v!412))))))

(assert (= (and start!39366 res!243477) b!417978))

(assert (= (and b!417978 res!243479) b!417977))

(assert (= (and b!417977 res!243485) b!417972))

(assert (= (and b!417972 res!243478) b!417975))

(assert (= (and b!417975 res!243484) b!417961))

(assert (= (and b!417961 res!243482) b!417969))

(assert (= (and b!417969 res!243483) b!417971))

(assert (= (and b!417971 res!243476) b!417963))

(assert (= (and b!417963 res!243481) b!417968))

(assert (= (and b!417968 res!243486) b!417973))

(assert (= (and b!417973 res!243488) b!417976))

(assert (= (and b!417976 res!243480) b!417967))

(assert (= (and b!417967 res!243487) b!417962))

(assert (= (and b!417962 c!55163) b!417979))

(assert (= (and b!417962 (not c!55163)) b!417974))

(assert (= (or b!417979 b!417974) bm!29074))

(assert (= (or b!417979 b!417974) bm!29075))

(assert (= (and b!417962 (not res!243489)) b!417964))

(assert (= (and b!417970 condMapEmpty!17799) mapIsEmpty!17799))

(assert (= (and b!417970 (not condMapEmpty!17799)) mapNonEmpty!17799))

(get-info :version)

(assert (= (and mapNonEmpty!17799 ((_ is ValueCellFull!5049) mapValue!17799)) b!417965))

(assert (= (and b!417970 ((_ is ValueCellFull!5049) mapDefault!17799)) b!417966))

(assert (= start!39366 b!417970))

(declare-fun b_lambda!8937 () Bool)

(assert (=> (not b_lambda!8937) (not b!417964)))

(declare-fun t!12416 () Bool)

(declare-fun tb!3255 () Bool)

(assert (=> (and start!39366 (= defaultEntry!557 defaultEntry!557) t!12416) tb!3255))

(declare-fun result!6037 () Bool)

(assert (=> tb!3255 (= result!6037 tp_is_empty!10785)))

(assert (=> b!417964 t!12416))

(declare-fun b_and!17143 () Bool)

(assert (= b_and!17141 (and (=> t!12416 result!6037) b_and!17143)))

(declare-fun m!407291 () Bool)

(assert (=> b!417968 m!407291))

(declare-fun m!407293 () Bool)

(assert (=> b!417968 m!407293))

(declare-fun m!407295 () Bool)

(assert (=> b!417971 m!407295))

(declare-fun m!407297 () Bool)

(assert (=> bm!29074 m!407297))

(declare-fun m!407299 () Bool)

(assert (=> b!417979 m!407299))

(declare-fun m!407301 () Bool)

(assert (=> b!417969 m!407301))

(declare-fun m!407303 () Bool)

(assert (=> start!39366 m!407303))

(declare-fun m!407305 () Bool)

(assert (=> start!39366 m!407305))

(declare-fun m!407307 () Bool)

(assert (=> b!417978 m!407307))

(declare-fun m!407309 () Bool)

(assert (=> b!417973 m!407309))

(declare-fun m!407311 () Bool)

(assert (=> b!417972 m!407311))

(declare-fun m!407313 () Bool)

(assert (=> b!417975 m!407313))

(declare-fun m!407315 () Bool)

(assert (=> b!417963 m!407315))

(declare-fun m!407317 () Bool)

(assert (=> b!417967 m!407317))

(declare-fun m!407319 () Bool)

(assert (=> b!417967 m!407319))

(declare-fun m!407321 () Bool)

(assert (=> b!417967 m!407321))

(declare-fun m!407323 () Bool)

(assert (=> bm!29075 m!407323))

(declare-fun m!407325 () Bool)

(assert (=> mapNonEmpty!17799 m!407325))

(declare-fun m!407327 () Bool)

(assert (=> b!417964 m!407327))

(declare-fun m!407329 () Bool)

(assert (=> b!417964 m!407329))

(assert (=> b!417964 m!407319))

(declare-fun m!407331 () Bool)

(assert (=> b!417964 m!407331))

(declare-fun m!407333 () Bool)

(assert (=> b!417964 m!407333))

(assert (=> b!417964 m!407327))

(declare-fun m!407335 () Bool)

(assert (=> b!417964 m!407335))

(declare-fun m!407337 () Bool)

(assert (=> b!417964 m!407337))

(declare-fun m!407339 () Bool)

(assert (=> b!417964 m!407339))

(assert (=> b!417964 m!407331))

(declare-fun m!407341 () Bool)

(assert (=> b!417964 m!407341))

(declare-fun m!407343 () Bool)

(assert (=> b!417964 m!407343))

(assert (=> b!417964 m!407339))

(declare-fun m!407345 () Bool)

(assert (=> b!417964 m!407345))

(declare-fun m!407347 () Bool)

(assert (=> b!417964 m!407347))

(declare-fun m!407349 () Bool)

(assert (=> b!417964 m!407349))

(declare-fun m!407351 () Bool)

(assert (=> b!417962 m!407351))

(assert (=> b!417962 m!407351))

(declare-fun m!407353 () Bool)

(assert (=> b!417962 m!407353))

(declare-fun m!407355 () Bool)

(assert (=> b!417962 m!407355))

(check-sat (not mapNonEmpty!17799) (not b!417979) (not b!417978) (not b!417964) (not start!39366) (not bm!29074) (not b!417975) (not b!417962) tp_is_empty!10785 (not b!417967) (not b!417968) (not b!417973) (not b!417969) (not b!417963) (not bm!29075) (not b_next!9633) (not b!417972) (not b_lambda!8937) b_and!17143)
(check-sat b_and!17143 (not b_next!9633))
