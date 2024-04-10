; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39864 () Bool)

(assert start!39864)

(declare-fun b_free!10131 () Bool)

(declare-fun b_next!10131 () Bool)

(assert (=> start!39864 (= b_free!10131 (not b_next!10131))))

(declare-fun tp!35921 () Bool)

(declare-fun b_and!17921 () Bool)

(assert (=> start!39864 (= tp!35921 b_and!17921)))

(declare-fun b!431262 () Bool)

(declare-fun res!253529 () Bool)

(declare-fun e!255229 () Bool)

(assert (=> b!431262 (=> (not res!253529) (not e!255229))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26401 0))(
  ( (array!26402 (arr!12650 (Array (_ BitVec 32) (_ BitVec 64))) (size!13002 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26401)

(assert (=> b!431262 (= res!253529 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13002 _keys!709))))))

(declare-fun b!431263 () Bool)

(declare-fun res!253525 () Bool)

(declare-fun e!255227 () Bool)

(assert (=> b!431263 (=> (not res!253525) (not e!255227))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!431263 (= res!253525 (bvsle from!863 i!563))))

(declare-fun b!431264 () Bool)

(declare-fun e!255224 () Bool)

(declare-fun tp_is_empty!11283 () Bool)

(assert (=> b!431264 (= e!255224 tp_is_empty!11283)))

(declare-fun b!431265 () Bool)

(declare-fun res!253522 () Bool)

(assert (=> b!431265 (=> (not res!253522) (not e!255229))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26401 (_ BitVec 32)) Bool)

(assert (=> b!431265 (= res!253522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431266 () Bool)

(declare-fun res!253526 () Bool)

(assert (=> b!431266 (=> (not res!253526) (not e!255227))))

(declare-fun lt!197452 () array!26401)

(declare-datatypes ((List!7512 0))(
  ( (Nil!7509) (Cons!7508 (h!8364 (_ BitVec 64)) (t!13092 List!7512)) )
))
(declare-fun arrayNoDuplicates!0 (array!26401 (_ BitVec 32) List!7512) Bool)

(assert (=> b!431266 (= res!253526 (arrayNoDuplicates!0 lt!197452 #b00000000000000000000000000000000 Nil!7509))))

(declare-fun b!431267 () Bool)

(declare-fun res!253527 () Bool)

(assert (=> b!431267 (=> (not res!253527) (not e!255229))))

(assert (=> b!431267 (= res!253527 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7509))))

(declare-fun b!431268 () Bool)

(assert (=> b!431268 (= e!255229 e!255227)))

(declare-fun res!253523 () Bool)

(assert (=> b!431268 (=> (not res!253523) (not e!255227))))

(assert (=> b!431268 (= res!253523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197452 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!431268 (= lt!197452 (array!26402 (store (arr!12650 _keys!709) i!563 k0!794) (size!13002 _keys!709)))))

(declare-fun b!431269 () Bool)

(declare-fun e!255222 () Bool)

(assert (=> b!431269 (= e!255222 tp_is_empty!11283)))

(declare-fun b!431270 () Bool)

(declare-fun res!253517 () Bool)

(assert (=> b!431270 (=> (not res!253517) (not e!255229))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16149 0))(
  ( (V!16150 (val!5686 Int)) )
))
(declare-datatypes ((ValueCell!5298 0))(
  ( (ValueCellFull!5298 (v!7933 V!16149)) (EmptyCell!5298) )
))
(declare-datatypes ((array!26403 0))(
  ( (array!26404 (arr!12651 (Array (_ BitVec 32) ValueCell!5298)) (size!13003 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26403)

(assert (=> b!431270 (= res!253517 (and (= (size!13003 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13002 _keys!709) (size!13003 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431271 () Bool)

(declare-fun e!255230 () Bool)

(declare-fun mapRes!18546 () Bool)

(assert (=> b!431271 (= e!255230 (and e!255222 mapRes!18546))))

(declare-fun condMapEmpty!18546 () Bool)

(declare-fun mapDefault!18546 () ValueCell!5298)

(assert (=> b!431271 (= condMapEmpty!18546 (= (arr!12651 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5298)) mapDefault!18546)))))

(declare-fun b!431272 () Bool)

(declare-fun e!255228 () Bool)

(assert (=> b!431272 (= e!255227 e!255228)))

(declare-fun res!253518 () Bool)

(assert (=> b!431272 (=> (not res!253518) (not e!255228))))

(assert (=> b!431272 (= res!253518 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197453 () array!26403)

(declare-fun minValue!515 () V!16149)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16149)

(declare-datatypes ((tuple2!7496 0))(
  ( (tuple2!7497 (_1!3759 (_ BitVec 64)) (_2!3759 V!16149)) )
))
(declare-datatypes ((List!7513 0))(
  ( (Nil!7510) (Cons!7509 (h!8365 tuple2!7496) (t!13093 List!7513)) )
))
(declare-datatypes ((ListLongMap!6409 0))(
  ( (ListLongMap!6410 (toList!3220 List!7513)) )
))
(declare-fun lt!197464 () ListLongMap!6409)

(declare-fun getCurrentListMapNoExtraKeys!1420 (array!26401 array!26403 (_ BitVec 32) (_ BitVec 32) V!16149 V!16149 (_ BitVec 32) Int) ListLongMap!6409)

(assert (=> b!431272 (= lt!197464 (getCurrentListMapNoExtraKeys!1420 lt!197452 lt!197453 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16149)

(assert (=> b!431272 (= lt!197453 (array!26404 (store (arr!12651 _values!549) i!563 (ValueCellFull!5298 v!412)) (size!13003 _values!549)))))

(declare-fun lt!197463 () ListLongMap!6409)

(assert (=> b!431272 (= lt!197463 (getCurrentListMapNoExtraKeys!1420 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431273 () Bool)

(declare-fun res!253521 () Bool)

(assert (=> b!431273 (=> (not res!253521) (not e!255229))))

(assert (=> b!431273 (= res!253521 (or (= (select (arr!12650 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12650 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431274 () Bool)

(declare-fun res!253524 () Bool)

(assert (=> b!431274 (=> (not res!253524) (not e!255229))))

(declare-fun arrayContainsKey!0 (array!26401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431274 (= res!253524 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431275 () Bool)

(declare-datatypes ((Unit!12707 0))(
  ( (Unit!12708) )
))
(declare-fun e!255223 () Unit!12707)

(declare-fun Unit!12709 () Unit!12707)

(assert (=> b!431275 (= e!255223 Unit!12709)))

(declare-fun lt!197460 () Unit!12707)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26401 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12707)

(assert (=> b!431275 (= lt!197460 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431275 false))

(declare-fun b!431276 () Bool)

(declare-fun e!255225 () Bool)

(assert (=> b!431276 (= e!255228 (not e!255225))))

(declare-fun res!253520 () Bool)

(assert (=> b!431276 (=> res!253520 e!255225)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431276 (= res!253520 (not (validKeyInArray!0 (select (arr!12650 _keys!709) from!863))))))

(declare-fun lt!197462 () ListLongMap!6409)

(declare-fun lt!197454 () ListLongMap!6409)

(assert (=> b!431276 (= lt!197462 lt!197454)))

(declare-fun lt!197459 () ListLongMap!6409)

(declare-fun lt!197461 () tuple2!7496)

(declare-fun +!1368 (ListLongMap!6409 tuple2!7496) ListLongMap!6409)

(assert (=> b!431276 (= lt!197454 (+!1368 lt!197459 lt!197461))))

(assert (=> b!431276 (= lt!197462 (getCurrentListMapNoExtraKeys!1420 lt!197452 lt!197453 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431276 (= lt!197461 (tuple2!7497 k0!794 v!412))))

(assert (=> b!431276 (= lt!197459 (getCurrentListMapNoExtraKeys!1420 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197457 () Unit!12707)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!555 (array!26401 array!26403 (_ BitVec 32) (_ BitVec 32) V!16149 V!16149 (_ BitVec 32) (_ BitVec 64) V!16149 (_ BitVec 32) Int) Unit!12707)

(assert (=> b!431276 (= lt!197457 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!555 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431277 () Bool)

(declare-fun e!255226 () Bool)

(assert (=> b!431277 (= e!255226 true)))

(declare-fun lt!197456 () ListLongMap!6409)

(declare-fun lt!197455 () tuple2!7496)

(assert (=> b!431277 (= lt!197456 (+!1368 (+!1368 lt!197459 lt!197455) lt!197461))))

(declare-fun lt!197451 () V!16149)

(declare-fun lt!197458 () Unit!12707)

(declare-fun addCommutativeForDiffKeys!362 (ListLongMap!6409 (_ BitVec 64) V!16149 (_ BitVec 64) V!16149) Unit!12707)

(assert (=> b!431277 (= lt!197458 (addCommutativeForDiffKeys!362 lt!197459 k0!794 v!412 (select (arr!12650 _keys!709) from!863) lt!197451))))

(declare-fun mapIsEmpty!18546 () Bool)

(assert (=> mapIsEmpty!18546 mapRes!18546))

(declare-fun b!431278 () Bool)

(assert (=> b!431278 (= e!255225 e!255226)))

(declare-fun res!253519 () Bool)

(assert (=> b!431278 (=> res!253519 e!255226)))

(assert (=> b!431278 (= res!253519 (= k0!794 (select (arr!12650 _keys!709) from!863)))))

(assert (=> b!431278 (not (= (select (arr!12650 _keys!709) from!863) k0!794))))

(declare-fun lt!197465 () Unit!12707)

(assert (=> b!431278 (= lt!197465 e!255223)))

(declare-fun c!55532 () Bool)

(assert (=> b!431278 (= c!55532 (= (select (arr!12650 _keys!709) from!863) k0!794))))

(assert (=> b!431278 (= lt!197464 lt!197456)))

(assert (=> b!431278 (= lt!197456 (+!1368 lt!197454 lt!197455))))

(assert (=> b!431278 (= lt!197455 (tuple2!7497 (select (arr!12650 _keys!709) from!863) lt!197451))))

(declare-fun get!6281 (ValueCell!5298 V!16149) V!16149)

(declare-fun dynLambda!790 (Int (_ BitVec 64)) V!16149)

(assert (=> b!431278 (= lt!197451 (get!6281 (select (arr!12651 _values!549) from!863) (dynLambda!790 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!253516 () Bool)

(assert (=> start!39864 (=> (not res!253516) (not e!255229))))

(assert (=> start!39864 (= res!253516 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13002 _keys!709))))))

(assert (=> start!39864 e!255229))

(assert (=> start!39864 tp_is_empty!11283))

(assert (=> start!39864 tp!35921))

(assert (=> start!39864 true))

(declare-fun array_inv!9208 (array!26403) Bool)

(assert (=> start!39864 (and (array_inv!9208 _values!549) e!255230)))

(declare-fun array_inv!9209 (array!26401) Bool)

(assert (=> start!39864 (array_inv!9209 _keys!709)))

(declare-fun b!431279 () Bool)

(declare-fun res!253528 () Bool)

(assert (=> b!431279 (=> (not res!253528) (not e!255229))))

(assert (=> b!431279 (= res!253528 (validKeyInArray!0 k0!794))))

(declare-fun b!431280 () Bool)

(declare-fun Unit!12710 () Unit!12707)

(assert (=> b!431280 (= e!255223 Unit!12710)))

(declare-fun b!431281 () Bool)

(declare-fun res!253530 () Bool)

(assert (=> b!431281 (=> (not res!253530) (not e!255229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431281 (= res!253530 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18546 () Bool)

(declare-fun tp!35922 () Bool)

(assert (=> mapNonEmpty!18546 (= mapRes!18546 (and tp!35922 e!255224))))

(declare-fun mapValue!18546 () ValueCell!5298)

(declare-fun mapKey!18546 () (_ BitVec 32))

(declare-fun mapRest!18546 () (Array (_ BitVec 32) ValueCell!5298))

(assert (=> mapNonEmpty!18546 (= (arr!12651 _values!549) (store mapRest!18546 mapKey!18546 mapValue!18546))))

(assert (= (and start!39864 res!253516) b!431281))

(assert (= (and b!431281 res!253530) b!431270))

(assert (= (and b!431270 res!253517) b!431265))

(assert (= (and b!431265 res!253522) b!431267))

(assert (= (and b!431267 res!253527) b!431262))

(assert (= (and b!431262 res!253529) b!431279))

(assert (= (and b!431279 res!253528) b!431273))

(assert (= (and b!431273 res!253521) b!431274))

(assert (= (and b!431274 res!253524) b!431268))

(assert (= (and b!431268 res!253523) b!431266))

(assert (= (and b!431266 res!253526) b!431263))

(assert (= (and b!431263 res!253525) b!431272))

(assert (= (and b!431272 res!253518) b!431276))

(assert (= (and b!431276 (not res!253520)) b!431278))

(assert (= (and b!431278 c!55532) b!431275))

(assert (= (and b!431278 (not c!55532)) b!431280))

(assert (= (and b!431278 (not res!253519)) b!431277))

(assert (= (and b!431271 condMapEmpty!18546) mapIsEmpty!18546))

(assert (= (and b!431271 (not condMapEmpty!18546)) mapNonEmpty!18546))

(get-info :version)

(assert (= (and mapNonEmpty!18546 ((_ is ValueCellFull!5298) mapValue!18546)) b!431264))

(assert (= (and b!431271 ((_ is ValueCellFull!5298) mapDefault!18546)) b!431269))

(assert (= start!39864 b!431271))

(declare-fun b_lambda!9219 () Bool)

(assert (=> (not b_lambda!9219) (not b!431278)))

(declare-fun t!13091 () Bool)

(declare-fun tb!3537 () Bool)

(assert (=> (and start!39864 (= defaultEntry!557 defaultEntry!557) t!13091) tb!3537))

(declare-fun result!6601 () Bool)

(assert (=> tb!3537 (= result!6601 tp_is_empty!11283)))

(assert (=> b!431278 t!13091))

(declare-fun b_and!17923 () Bool)

(assert (= b_and!17921 (and (=> t!13091 result!6601) b_and!17923)))

(declare-fun m!419419 () Bool)

(assert (=> b!431279 m!419419))

(declare-fun m!419421 () Bool)

(assert (=> b!431277 m!419421))

(assert (=> b!431277 m!419421))

(declare-fun m!419423 () Bool)

(assert (=> b!431277 m!419423))

(declare-fun m!419425 () Bool)

(assert (=> b!431277 m!419425))

(assert (=> b!431277 m!419425))

(declare-fun m!419427 () Bool)

(assert (=> b!431277 m!419427))

(declare-fun m!419429 () Bool)

(assert (=> b!431273 m!419429))

(declare-fun m!419431 () Bool)

(assert (=> b!431275 m!419431))

(declare-fun m!419433 () Bool)

(assert (=> b!431265 m!419433))

(declare-fun m!419435 () Bool)

(assert (=> b!431267 m!419435))

(declare-fun m!419437 () Bool)

(assert (=> b!431266 m!419437))

(declare-fun m!419439 () Bool)

(assert (=> b!431281 m!419439))

(declare-fun m!419441 () Bool)

(assert (=> start!39864 m!419441))

(declare-fun m!419443 () Bool)

(assert (=> start!39864 m!419443))

(declare-fun m!419445 () Bool)

(assert (=> b!431274 m!419445))

(assert (=> b!431276 m!419425))

(declare-fun m!419447 () Bool)

(assert (=> b!431276 m!419447))

(declare-fun m!419449 () Bool)

(assert (=> b!431276 m!419449))

(assert (=> b!431276 m!419425))

(declare-fun m!419451 () Bool)

(assert (=> b!431276 m!419451))

(declare-fun m!419453 () Bool)

(assert (=> b!431276 m!419453))

(declare-fun m!419455 () Bool)

(assert (=> b!431276 m!419455))

(declare-fun m!419457 () Bool)

(assert (=> b!431268 m!419457))

(declare-fun m!419459 () Bool)

(assert (=> b!431268 m!419459))

(declare-fun m!419461 () Bool)

(assert (=> mapNonEmpty!18546 m!419461))

(declare-fun m!419463 () Bool)

(assert (=> b!431272 m!419463))

(declare-fun m!419465 () Bool)

(assert (=> b!431272 m!419465))

(declare-fun m!419467 () Bool)

(assert (=> b!431272 m!419467))

(assert (=> b!431278 m!419425))

(declare-fun m!419469 () Bool)

(assert (=> b!431278 m!419469))

(declare-fun m!419471 () Bool)

(assert (=> b!431278 m!419471))

(declare-fun m!419473 () Bool)

(assert (=> b!431278 m!419473))

(assert (=> b!431278 m!419473))

(assert (=> b!431278 m!419471))

(declare-fun m!419475 () Bool)

(assert (=> b!431278 m!419475))

(check-sat (not start!39864) (not b!431275) (not mapNonEmpty!18546) (not b!431266) (not b!431267) (not b!431278) tp_is_empty!11283 (not b_next!10131) (not b!431268) (not b!431281) (not b!431272) (not b!431265) (not b!431276) b_and!17923 (not b!431279) (not b!431277) (not b_lambda!9219) (not b!431274))
(check-sat b_and!17923 (not b_next!10131))
