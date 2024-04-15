; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39374 () Bool)

(assert start!39374)

(declare-fun b_free!9655 () Bool)

(declare-fun b_next!9655 () Bool)

(assert (=> start!39374 (= b_free!9655 (not b_next!9655))))

(declare-fun tp!34493 () Bool)

(declare-fun b_and!17159 () Bool)

(assert (=> start!39374 (= tp!34493 b_and!17159)))

(declare-fun b!418339 () Bool)

(declare-fun e!249421 () Bool)

(declare-fun e!249419 () Bool)

(assert (=> b!418339 (= e!249421 (not e!249419))))

(declare-fun res!243813 () Bool)

(assert (=> b!418339 (=> res!243813 e!249419)))

(declare-datatypes ((array!25453 0))(
  ( (array!25454 (arr!12176 (Array (_ BitVec 32) (_ BitVec 64))) (size!12529 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25453)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418339 (= res!243813 (validKeyInArray!0 (select (arr!12176 _keys!709) from!863)))))

(declare-fun e!249420 () Bool)

(assert (=> b!418339 e!249420))

(declare-fun c!55125 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418339 (= c!55125 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15515 0))(
  ( (V!15516 (val!5448 Int)) )
))
(declare-fun minValue!515 () V!15515)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5060 0))(
  ( (ValueCellFull!5060 (v!7689 V!15515)) (EmptyCell!5060) )
))
(declare-datatypes ((array!25455 0))(
  ( (array!25456 (arr!12177 (Array (_ BitVec 32) ValueCell!5060)) (size!12530 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25455)

(declare-fun zeroValue!515 () V!15515)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12340 0))(
  ( (Unit!12341) )
))
(declare-fun lt!191653 () Unit!12340)

(declare-fun v!412 () V!15515)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!426 (array!25453 array!25455 (_ BitVec 32) (_ BitVec 32) V!15515 V!15515 (_ BitVec 32) (_ BitVec 64) V!15515 (_ BitVec 32) Int) Unit!12340)

(assert (=> b!418339 (= lt!191653 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!426 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418340 () Bool)

(declare-fun e!249426 () Bool)

(declare-fun tp_is_empty!10807 () Bool)

(assert (=> b!418340 (= e!249426 tp_is_empty!10807)))

(declare-fun b!418341 () Bool)

(declare-fun res!243809 () Bool)

(declare-fun e!249422 () Bool)

(assert (=> b!418341 (=> (not res!243809) (not e!249422))))

(declare-fun arrayContainsKey!0 (array!25453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418341 (= res!243809 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418342 () Bool)

(declare-fun res!243815 () Bool)

(assert (=> b!418342 (=> (not res!243815) (not e!249422))))

(declare-datatypes ((List!7106 0))(
  ( (Nil!7103) (Cons!7102 (h!7958 (_ BitVec 64)) (t!12417 List!7106)) )
))
(declare-fun arrayNoDuplicates!0 (array!25453 (_ BitVec 32) List!7106) Bool)

(assert (=> b!418342 (= res!243815 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7103))))

(declare-fun b!418343 () Bool)

(declare-fun e!249424 () Bool)

(declare-fun e!249418 () Bool)

(declare-fun mapRes!17832 () Bool)

(assert (=> b!418343 (= e!249424 (and e!249418 mapRes!17832))))

(declare-fun condMapEmpty!17832 () Bool)

(declare-fun mapDefault!17832 () ValueCell!5060)

(assert (=> b!418343 (= condMapEmpty!17832 (= (arr!12177 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5060)) mapDefault!17832)))))

(declare-fun b!418344 () Bool)

(declare-fun res!243814 () Bool)

(assert (=> b!418344 (=> (not res!243814) (not e!249422))))

(assert (=> b!418344 (= res!243814 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12529 _keys!709))))))

(declare-fun mapNonEmpty!17832 () Bool)

(declare-fun tp!34494 () Bool)

(assert (=> mapNonEmpty!17832 (= mapRes!17832 (and tp!34494 e!249426))))

(declare-fun mapKey!17832 () (_ BitVec 32))

(declare-fun mapValue!17832 () ValueCell!5060)

(declare-fun mapRest!17832 () (Array (_ BitVec 32) ValueCell!5060))

(assert (=> mapNonEmpty!17832 (= (arr!12177 _values!549) (store mapRest!17832 mapKey!17832 mapValue!17832))))

(declare-fun b!418345 () Bool)

(assert (=> b!418345 (= e!249419 true)))

(declare-fun lt!191655 () V!15515)

(declare-datatypes ((tuple2!7108 0))(
  ( (tuple2!7109 (_1!3565 (_ BitVec 64)) (_2!3565 V!15515)) )
))
(declare-datatypes ((List!7107 0))(
  ( (Nil!7104) (Cons!7103 (h!7959 tuple2!7108) (t!12418 List!7107)) )
))
(declare-datatypes ((ListLongMap!6011 0))(
  ( (ListLongMap!6012 (toList!3021 List!7107)) )
))
(declare-fun lt!191652 () ListLongMap!6011)

(declare-fun lt!191648 () tuple2!7108)

(declare-fun +!1249 (ListLongMap!6011 tuple2!7108) ListLongMap!6011)

(assert (=> b!418345 (= (+!1249 lt!191652 lt!191648) (+!1249 (+!1249 lt!191652 (tuple2!7109 k0!794 lt!191655)) lt!191648))))

(declare-fun lt!191654 () V!15515)

(assert (=> b!418345 (= lt!191648 (tuple2!7109 k0!794 lt!191654))))

(declare-fun lt!191647 () Unit!12340)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!35 (ListLongMap!6011 (_ BitVec 64) V!15515 V!15515) Unit!12340)

(assert (=> b!418345 (= lt!191647 (addSameAsAddTwiceSameKeyDiffValues!35 lt!191652 k0!794 lt!191655 lt!191654))))

(declare-fun lt!191650 () V!15515)

(declare-fun get!6028 (ValueCell!5060 V!15515) V!15515)

(assert (=> b!418345 (= lt!191655 (get!6028 (select (arr!12177 _values!549) from!863) lt!191650))))

(declare-fun lt!191657 () ListLongMap!6011)

(declare-fun lt!191649 () array!25453)

(assert (=> b!418345 (= lt!191657 (+!1249 lt!191652 (tuple2!7109 (select (arr!12176 lt!191649) from!863) lt!191654)))))

(assert (=> b!418345 (= lt!191654 (get!6028 (select (store (arr!12177 _values!549) i!563 (ValueCellFull!5060 v!412)) from!863) lt!191650))))

(declare-fun dynLambda!692 (Int (_ BitVec 64)) V!15515)

(assert (=> b!418345 (= lt!191650 (dynLambda!692 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!191656 () array!25455)

(declare-fun getCurrentListMapNoExtraKeys!1232 (array!25453 array!25455 (_ BitVec 32) (_ BitVec 32) V!15515 V!15515 (_ BitVec 32) Int) ListLongMap!6011)

(assert (=> b!418345 (= lt!191652 (getCurrentListMapNoExtraKeys!1232 lt!191649 lt!191656 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29115 () Bool)

(declare-fun call!29119 () ListLongMap!6011)

(assert (=> bm!29115 (= call!29119 (getCurrentListMapNoExtraKeys!1232 (ite c!55125 lt!191649 _keys!709) (ite c!55125 lt!191656 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418346 () Bool)

(declare-fun res!243818 () Bool)

(declare-fun e!249425 () Bool)

(assert (=> b!418346 (=> (not res!243818) (not e!249425))))

(assert (=> b!418346 (= res!243818 (arrayNoDuplicates!0 lt!191649 #b00000000000000000000000000000000 Nil!7103))))

(declare-fun b!418347 () Bool)

(assert (=> b!418347 (= e!249418 tp_is_empty!10807)))

(declare-fun b!418348 () Bool)

(declare-fun call!29118 () ListLongMap!6011)

(assert (=> b!418348 (= e!249420 (= call!29118 call!29119))))

(declare-fun b!418349 () Bool)

(assert (=> b!418349 (= e!249422 e!249425)))

(declare-fun res!243812 () Bool)

(assert (=> b!418349 (=> (not res!243812) (not e!249425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25453 (_ BitVec 32)) Bool)

(assert (=> b!418349 (= res!243812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191649 mask!1025))))

(assert (=> b!418349 (= lt!191649 (array!25454 (store (arr!12176 _keys!709) i!563 k0!794) (size!12529 _keys!709)))))

(declare-fun b!418350 () Bool)

(declare-fun res!243822 () Bool)

(assert (=> b!418350 (=> (not res!243822) (not e!249422))))

(assert (=> b!418350 (= res!243822 (or (= (select (arr!12176 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12176 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418351 () Bool)

(assert (=> b!418351 (= e!249425 e!249421)))

(declare-fun res!243819 () Bool)

(assert (=> b!418351 (=> (not res!243819) (not e!249421))))

(assert (=> b!418351 (= res!243819 (= from!863 i!563))))

(assert (=> b!418351 (= lt!191657 (getCurrentListMapNoExtraKeys!1232 lt!191649 lt!191656 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418351 (= lt!191656 (array!25456 (store (arr!12177 _values!549) i!563 (ValueCellFull!5060 v!412)) (size!12530 _values!549)))))

(declare-fun lt!191651 () ListLongMap!6011)

(assert (=> b!418351 (= lt!191651 (getCurrentListMapNoExtraKeys!1232 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418352 () Bool)

(declare-fun res!243810 () Bool)

(assert (=> b!418352 (=> (not res!243810) (not e!249422))))

(assert (=> b!418352 (= res!243810 (and (= (size!12530 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12529 _keys!709) (size!12530 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418353 () Bool)

(declare-fun res!243811 () Bool)

(assert (=> b!418353 (=> (not res!243811) (not e!249422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418353 (= res!243811 (validMask!0 mask!1025))))

(declare-fun b!418354 () Bool)

(declare-fun res!243816 () Bool)

(assert (=> b!418354 (=> (not res!243816) (not e!249422))))

(assert (=> b!418354 (= res!243816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418355 () Bool)

(declare-fun res!243817 () Bool)

(assert (=> b!418355 (=> (not res!243817) (not e!249422))))

(assert (=> b!418355 (= res!243817 (validKeyInArray!0 k0!794))))

(declare-fun res!243821 () Bool)

(assert (=> start!39374 (=> (not res!243821) (not e!249422))))

(assert (=> start!39374 (= res!243821 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12529 _keys!709))))))

(assert (=> start!39374 e!249422))

(assert (=> start!39374 tp_is_empty!10807))

(assert (=> start!39374 tp!34493))

(assert (=> start!39374 true))

(declare-fun array_inv!8926 (array!25455) Bool)

(assert (=> start!39374 (and (array_inv!8926 _values!549) e!249424)))

(declare-fun array_inv!8927 (array!25453) Bool)

(assert (=> start!39374 (array_inv!8927 _keys!709)))

(declare-fun b!418356 () Bool)

(assert (=> b!418356 (= e!249420 (= call!29119 (+!1249 call!29118 (tuple2!7109 k0!794 v!412))))))

(declare-fun b!418357 () Bool)

(declare-fun res!243820 () Bool)

(assert (=> b!418357 (=> (not res!243820) (not e!249425))))

(assert (=> b!418357 (= res!243820 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17832 () Bool)

(assert (=> mapIsEmpty!17832 mapRes!17832))

(declare-fun bm!29116 () Bool)

(assert (=> bm!29116 (= call!29118 (getCurrentListMapNoExtraKeys!1232 (ite c!55125 _keys!709 lt!191649) (ite c!55125 _values!549 lt!191656) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39374 res!243821) b!418353))

(assert (= (and b!418353 res!243811) b!418352))

(assert (= (and b!418352 res!243810) b!418354))

(assert (= (and b!418354 res!243816) b!418342))

(assert (= (and b!418342 res!243815) b!418344))

(assert (= (and b!418344 res!243814) b!418355))

(assert (= (and b!418355 res!243817) b!418350))

(assert (= (and b!418350 res!243822) b!418341))

(assert (= (and b!418341 res!243809) b!418349))

(assert (= (and b!418349 res!243812) b!418346))

(assert (= (and b!418346 res!243818) b!418357))

(assert (= (and b!418357 res!243820) b!418351))

(assert (= (and b!418351 res!243819) b!418339))

(assert (= (and b!418339 c!55125) b!418356))

(assert (= (and b!418339 (not c!55125)) b!418348))

(assert (= (or b!418356 b!418348) bm!29115))

(assert (= (or b!418356 b!418348) bm!29116))

(assert (= (and b!418339 (not res!243813)) b!418345))

(assert (= (and b!418343 condMapEmpty!17832) mapIsEmpty!17832))

(assert (= (and b!418343 (not condMapEmpty!17832)) mapNonEmpty!17832))

(get-info :version)

(assert (= (and mapNonEmpty!17832 ((_ is ValueCellFull!5060) mapValue!17832)) b!418340))

(assert (= (and b!418343 ((_ is ValueCellFull!5060) mapDefault!17832)) b!418347))

(assert (= start!39374 b!418343))

(declare-fun b_lambda!8941 () Bool)

(assert (=> (not b_lambda!8941) (not b!418345)))

(declare-fun t!12416 () Bool)

(declare-fun tb!3269 () Bool)

(assert (=> (and start!39374 (= defaultEntry!557 defaultEntry!557) t!12416) tb!3269))

(declare-fun result!6073 () Bool)

(assert (=> tb!3269 (= result!6073 tp_is_empty!10807)))

(assert (=> b!418345 t!12416))

(declare-fun b_and!17161 () Bool)

(assert (= b_and!17159 (and (=> t!12416 result!6073) b_and!17161)))

(declare-fun m!407289 () Bool)

(assert (=> b!418354 m!407289))

(declare-fun m!407291 () Bool)

(assert (=> b!418342 m!407291))

(declare-fun m!407293 () Bool)

(assert (=> b!418346 m!407293))

(declare-fun m!407295 () Bool)

(assert (=> mapNonEmpty!17832 m!407295))

(declare-fun m!407297 () Bool)

(assert (=> b!418356 m!407297))

(declare-fun m!407299 () Bool)

(assert (=> start!39374 m!407299))

(declare-fun m!407301 () Bool)

(assert (=> start!39374 m!407301))

(declare-fun m!407303 () Bool)

(assert (=> b!418339 m!407303))

(assert (=> b!418339 m!407303))

(declare-fun m!407305 () Bool)

(assert (=> b!418339 m!407305))

(declare-fun m!407307 () Bool)

(assert (=> b!418339 m!407307))

(declare-fun m!407309 () Bool)

(assert (=> b!418341 m!407309))

(declare-fun m!407311 () Bool)

(assert (=> b!418350 m!407311))

(declare-fun m!407313 () Bool)

(assert (=> b!418345 m!407313))

(declare-fun m!407315 () Bool)

(assert (=> b!418345 m!407315))

(declare-fun m!407317 () Bool)

(assert (=> b!418345 m!407317))

(declare-fun m!407319 () Bool)

(assert (=> b!418345 m!407319))

(declare-fun m!407321 () Bool)

(assert (=> b!418345 m!407321))

(declare-fun m!407323 () Bool)

(assert (=> b!418345 m!407323))

(declare-fun m!407325 () Bool)

(assert (=> b!418345 m!407325))

(assert (=> b!418345 m!407313))

(declare-fun m!407327 () Bool)

(assert (=> b!418345 m!407327))

(assert (=> b!418345 m!407315))

(declare-fun m!407329 () Bool)

(assert (=> b!418345 m!407329))

(declare-fun m!407331 () Bool)

(assert (=> b!418345 m!407331))

(declare-fun m!407333 () Bool)

(assert (=> b!418345 m!407333))

(declare-fun m!407335 () Bool)

(assert (=> b!418345 m!407335))

(assert (=> b!418345 m!407325))

(declare-fun m!407337 () Bool)

(assert (=> b!418345 m!407337))

(declare-fun m!407339 () Bool)

(assert (=> bm!29115 m!407339))

(declare-fun m!407341 () Bool)

(assert (=> bm!29116 m!407341))

(declare-fun m!407343 () Bool)

(assert (=> b!418353 m!407343))

(declare-fun m!407345 () Bool)

(assert (=> b!418355 m!407345))

(declare-fun m!407347 () Bool)

(assert (=> b!418349 m!407347))

(declare-fun m!407349 () Bool)

(assert (=> b!418349 m!407349))

(declare-fun m!407351 () Bool)

(assert (=> b!418351 m!407351))

(assert (=> b!418351 m!407323))

(declare-fun m!407353 () Bool)

(assert (=> b!418351 m!407353))

(check-sat (not b!418345) (not start!39374) (not bm!29116) (not b!418354) (not b!418349) (not b_next!9655) (not b!418353) (not b!418351) (not b_lambda!8941) (not b!418339) (not b!418355) (not mapNonEmpty!17832) (not b!418342) b_and!17161 (not b!418356) (not bm!29115) (not b!418341) tp_is_empty!10807 (not b!418346))
(check-sat b_and!17161 (not b_next!9655))
