; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39996 () Bool)

(assert start!39996)

(declare-fun b_free!10263 () Bool)

(declare-fun b_next!10263 () Bool)

(assert (=> start!39996 (= b_free!10263 (not b_next!10263))))

(declare-fun tp!36318 () Bool)

(declare-fun b_and!18185 () Bool)

(assert (=> start!39996 (= tp!36318 b_and!18185)))

(declare-fun b!435354 () Bool)

(declare-fun e!257210 () Bool)

(declare-fun e!257209 () Bool)

(assert (=> b!435354 (= e!257210 e!257209)))

(declare-fun res!256499 () Bool)

(assert (=> b!435354 (=> (not res!256499) (not e!257209))))

(declare-datatypes ((array!26659 0))(
  ( (array!26660 (arr!12779 (Array (_ BitVec 32) (_ BitVec 64))) (size!13131 (_ BitVec 32))) )
))
(declare-fun lt!200424 () array!26659)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26659 (_ BitVec 32)) Bool)

(assert (=> b!435354 (= res!256499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200424 mask!1025))))

(declare-fun _keys!709 () array!26659)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435354 (= lt!200424 (array!26660 (store (arr!12779 _keys!709) i!563 k0!794) (size!13131 _keys!709)))))

(declare-fun b!435355 () Bool)

(declare-fun res!256500 () Bool)

(assert (=> b!435355 (=> (not res!256500) (not e!257210))))

(assert (=> b!435355 (= res!256500 (or (= (select (arr!12779 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12779 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435356 () Bool)

(declare-fun e!257202 () Bool)

(declare-fun e!257204 () Bool)

(assert (=> b!435356 (= e!257202 (not e!257204))))

(declare-fun res!256497 () Bool)

(assert (=> b!435356 (=> res!256497 e!257204)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435356 (= res!256497 (not (validKeyInArray!0 (select (arr!12779 _keys!709) from!863))))))

(declare-datatypes ((V!16325 0))(
  ( (V!16326 (val!5752 Int)) )
))
(declare-datatypes ((tuple2!7614 0))(
  ( (tuple2!7615 (_1!3818 (_ BitVec 64)) (_2!3818 V!16325)) )
))
(declare-datatypes ((List!7616 0))(
  ( (Nil!7613) (Cons!7612 (h!8468 tuple2!7614) (t!13328 List!7616)) )
))
(declare-datatypes ((ListLongMap!6527 0))(
  ( (ListLongMap!6528 (toList!3279 List!7616)) )
))
(declare-fun lt!200435 () ListLongMap!6527)

(declare-fun lt!200422 () ListLongMap!6527)

(assert (=> b!435356 (= lt!200435 lt!200422)))

(declare-fun lt!200430 () ListLongMap!6527)

(declare-fun lt!200421 () tuple2!7614)

(declare-fun +!1427 (ListLongMap!6527 tuple2!7614) ListLongMap!6527)

(assert (=> b!435356 (= lt!200422 (+!1427 lt!200430 lt!200421))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16325)

(declare-datatypes ((ValueCell!5364 0))(
  ( (ValueCellFull!5364 (v!7999 V!16325)) (EmptyCell!5364) )
))
(declare-datatypes ((array!26661 0))(
  ( (array!26662 (arr!12780 (Array (_ BitVec 32) ValueCell!5364)) (size!13132 (_ BitVec 32))) )
))
(declare-fun lt!200423 () array!26661)

(declare-fun minValue!515 () V!16325)

(declare-fun getCurrentListMapNoExtraKeys!1470 (array!26659 array!26661 (_ BitVec 32) (_ BitVec 32) V!16325 V!16325 (_ BitVec 32) Int) ListLongMap!6527)

(assert (=> b!435356 (= lt!200435 (getCurrentListMapNoExtraKeys!1470 lt!200424 lt!200423 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16325)

(assert (=> b!435356 (= lt!200421 (tuple2!7615 k0!794 v!412))))

(declare-fun _values!549 () array!26661)

(assert (=> b!435356 (= lt!200430 (getCurrentListMapNoExtraKeys!1470 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12924 0))(
  ( (Unit!12925) )
))
(declare-fun lt!200433 () Unit!12924)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!600 (array!26659 array!26661 (_ BitVec 32) (_ BitVec 32) V!16325 V!16325 (_ BitVec 32) (_ BitVec 64) V!16325 (_ BitVec 32) Int) Unit!12924)

(assert (=> b!435356 (= lt!200433 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!600 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435357 () Bool)

(assert (=> b!435357 (= e!257209 e!257202)))

(declare-fun res!256487 () Bool)

(assert (=> b!435357 (=> (not res!256487) (not e!257202))))

(assert (=> b!435357 (= res!256487 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200426 () ListLongMap!6527)

(assert (=> b!435357 (= lt!200426 (getCurrentListMapNoExtraKeys!1470 lt!200424 lt!200423 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435357 (= lt!200423 (array!26662 (store (arr!12780 _values!549) i!563 (ValueCellFull!5364 v!412)) (size!13132 _values!549)))))

(declare-fun lt!200429 () ListLongMap!6527)

(assert (=> b!435357 (= lt!200429 (getCurrentListMapNoExtraKeys!1470 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!256496 () Bool)

(assert (=> start!39996 (=> (not res!256496) (not e!257210))))

(assert (=> start!39996 (= res!256496 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13131 _keys!709))))))

(assert (=> start!39996 e!257210))

(declare-fun tp_is_empty!11415 () Bool)

(assert (=> start!39996 tp_is_empty!11415))

(assert (=> start!39996 tp!36318))

(assert (=> start!39996 true))

(declare-fun e!257203 () Bool)

(declare-fun array_inv!9290 (array!26661) Bool)

(assert (=> start!39996 (and (array_inv!9290 _values!549) e!257203)))

(declare-fun array_inv!9291 (array!26659) Bool)

(assert (=> start!39996 (array_inv!9291 _keys!709)))

(declare-fun b!435358 () Bool)

(declare-fun e!257208 () Bool)

(declare-fun mapRes!18744 () Bool)

(assert (=> b!435358 (= e!257203 (and e!257208 mapRes!18744))))

(declare-fun condMapEmpty!18744 () Bool)

(declare-fun mapDefault!18744 () ValueCell!5364)

(assert (=> b!435358 (= condMapEmpty!18744 (= (arr!12780 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5364)) mapDefault!18744)))))

(declare-fun mapNonEmpty!18744 () Bool)

(declare-fun tp!36317 () Bool)

(declare-fun e!257207 () Bool)

(assert (=> mapNonEmpty!18744 (= mapRes!18744 (and tp!36317 e!257207))))

(declare-fun mapValue!18744 () ValueCell!5364)

(declare-fun mapKey!18744 () (_ BitVec 32))

(declare-fun mapRest!18744 () (Array (_ BitVec 32) ValueCell!5364))

(assert (=> mapNonEmpty!18744 (= (arr!12780 _values!549) (store mapRest!18744 mapKey!18744 mapValue!18744))))

(declare-fun b!435359 () Bool)

(declare-fun e!257206 () Unit!12924)

(declare-fun Unit!12926 () Unit!12924)

(assert (=> b!435359 (= e!257206 Unit!12926)))

(declare-fun lt!200434 () Unit!12924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26659 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12924)

(assert (=> b!435359 (= lt!200434 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435359 false))

(declare-fun b!435360 () Bool)

(declare-fun res!256488 () Bool)

(assert (=> b!435360 (=> (not res!256488) (not e!257210))))

(assert (=> b!435360 (= res!256488 (validKeyInArray!0 k0!794))))

(declare-fun b!435361 () Bool)

(declare-fun res!256489 () Bool)

(assert (=> b!435361 (=> (not res!256489) (not e!257209))))

(assert (=> b!435361 (= res!256489 (bvsle from!863 i!563))))

(declare-fun b!435362 () Bool)

(declare-fun e!257205 () Bool)

(assert (=> b!435362 (= e!257204 e!257205)))

(declare-fun res!256490 () Bool)

(assert (=> b!435362 (=> res!256490 e!257205)))

(assert (=> b!435362 (= res!256490 (= k0!794 (select (arr!12779 _keys!709) from!863)))))

(assert (=> b!435362 (not (= (select (arr!12779 _keys!709) from!863) k0!794))))

(declare-fun lt!200432 () Unit!12924)

(assert (=> b!435362 (= lt!200432 e!257206)))

(declare-fun c!55730 () Bool)

(assert (=> b!435362 (= c!55730 (= (select (arr!12779 _keys!709) from!863) k0!794))))

(declare-fun lt!200431 () ListLongMap!6527)

(assert (=> b!435362 (= lt!200426 lt!200431)))

(declare-fun lt!200428 () tuple2!7614)

(assert (=> b!435362 (= lt!200431 (+!1427 lt!200422 lt!200428))))

(declare-fun lt!200425 () V!16325)

(assert (=> b!435362 (= lt!200428 (tuple2!7615 (select (arr!12779 _keys!709) from!863) lt!200425))))

(declare-fun get!6369 (ValueCell!5364 V!16325) V!16325)

(declare-fun dynLambda!834 (Int (_ BitVec 64)) V!16325)

(assert (=> b!435362 (= lt!200425 (get!6369 (select (arr!12780 _values!549) from!863) (dynLambda!834 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435363 () Bool)

(declare-fun Unit!12927 () Unit!12924)

(assert (=> b!435363 (= e!257206 Unit!12927)))

(declare-fun b!435364 () Bool)

(declare-fun res!256493 () Bool)

(assert (=> b!435364 (=> (not res!256493) (not e!257210))))

(assert (=> b!435364 (= res!256493 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13131 _keys!709))))))

(declare-fun b!435365 () Bool)

(declare-fun res!256492 () Bool)

(assert (=> b!435365 (=> (not res!256492) (not e!257210))))

(assert (=> b!435365 (= res!256492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18744 () Bool)

(assert (=> mapIsEmpty!18744 mapRes!18744))

(declare-fun b!435366 () Bool)

(assert (=> b!435366 (= e!257205 true)))

(assert (=> b!435366 (= lt!200431 (+!1427 (+!1427 lt!200430 lt!200428) lt!200421))))

(declare-fun lt!200427 () Unit!12924)

(declare-fun addCommutativeForDiffKeys!411 (ListLongMap!6527 (_ BitVec 64) V!16325 (_ BitVec 64) V!16325) Unit!12924)

(assert (=> b!435366 (= lt!200427 (addCommutativeForDiffKeys!411 lt!200430 k0!794 v!412 (select (arr!12779 _keys!709) from!863) lt!200425))))

(declare-fun b!435367 () Bool)

(declare-fun res!256498 () Bool)

(assert (=> b!435367 (=> (not res!256498) (not e!257210))))

(assert (=> b!435367 (= res!256498 (and (= (size!13132 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13131 _keys!709) (size!13132 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435368 () Bool)

(assert (=> b!435368 (= e!257207 tp_is_empty!11415)))

(declare-fun b!435369 () Bool)

(declare-fun res!256486 () Bool)

(assert (=> b!435369 (=> (not res!256486) (not e!257210))))

(declare-datatypes ((List!7617 0))(
  ( (Nil!7614) (Cons!7613 (h!8469 (_ BitVec 64)) (t!13329 List!7617)) )
))
(declare-fun arrayNoDuplicates!0 (array!26659 (_ BitVec 32) List!7617) Bool)

(assert (=> b!435369 (= res!256486 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7614))))

(declare-fun b!435370 () Bool)

(declare-fun res!256494 () Bool)

(assert (=> b!435370 (=> (not res!256494) (not e!257210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435370 (= res!256494 (validMask!0 mask!1025))))

(declare-fun b!435371 () Bool)

(declare-fun res!256495 () Bool)

(assert (=> b!435371 (=> (not res!256495) (not e!257210))))

(declare-fun arrayContainsKey!0 (array!26659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435371 (= res!256495 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435372 () Bool)

(assert (=> b!435372 (= e!257208 tp_is_empty!11415)))

(declare-fun b!435373 () Bool)

(declare-fun res!256491 () Bool)

(assert (=> b!435373 (=> (not res!256491) (not e!257209))))

(assert (=> b!435373 (= res!256491 (arrayNoDuplicates!0 lt!200424 #b00000000000000000000000000000000 Nil!7614))))

(assert (= (and start!39996 res!256496) b!435370))

(assert (= (and b!435370 res!256494) b!435367))

(assert (= (and b!435367 res!256498) b!435365))

(assert (= (and b!435365 res!256492) b!435369))

(assert (= (and b!435369 res!256486) b!435364))

(assert (= (and b!435364 res!256493) b!435360))

(assert (= (and b!435360 res!256488) b!435355))

(assert (= (and b!435355 res!256500) b!435371))

(assert (= (and b!435371 res!256495) b!435354))

(assert (= (and b!435354 res!256499) b!435373))

(assert (= (and b!435373 res!256491) b!435361))

(assert (= (and b!435361 res!256489) b!435357))

(assert (= (and b!435357 res!256487) b!435356))

(assert (= (and b!435356 (not res!256497)) b!435362))

(assert (= (and b!435362 c!55730) b!435359))

(assert (= (and b!435362 (not c!55730)) b!435363))

(assert (= (and b!435362 (not res!256490)) b!435366))

(assert (= (and b!435358 condMapEmpty!18744) mapIsEmpty!18744))

(assert (= (and b!435358 (not condMapEmpty!18744)) mapNonEmpty!18744))

(get-info :version)

(assert (= (and mapNonEmpty!18744 ((_ is ValueCellFull!5364) mapValue!18744)) b!435368))

(assert (= (and b!435358 ((_ is ValueCellFull!5364) mapDefault!18744)) b!435372))

(assert (= start!39996 b!435358))

(declare-fun b_lambda!9351 () Bool)

(assert (=> (not b_lambda!9351) (not b!435362)))

(declare-fun t!13327 () Bool)

(declare-fun tb!3669 () Bool)

(assert (=> (and start!39996 (= defaultEntry!557 defaultEntry!557) t!13327) tb!3669))

(declare-fun result!6865 () Bool)

(assert (=> tb!3669 (= result!6865 tp_is_empty!11415)))

(assert (=> b!435362 t!13327))

(declare-fun b_and!18187 () Bool)

(assert (= b_and!18185 (and (=> t!13327 result!6865) b_and!18187)))

(declare-fun m!423247 () Bool)

(assert (=> b!435359 m!423247))

(declare-fun m!423249 () Bool)

(assert (=> b!435355 m!423249))

(declare-fun m!423251 () Bool)

(assert (=> b!435360 m!423251))

(declare-fun m!423253 () Bool)

(assert (=> b!435373 m!423253))

(declare-fun m!423255 () Bool)

(assert (=> b!435356 m!423255))

(declare-fun m!423257 () Bool)

(assert (=> b!435356 m!423257))

(declare-fun m!423259 () Bool)

(assert (=> b!435356 m!423259))

(declare-fun m!423261 () Bool)

(assert (=> b!435356 m!423261))

(assert (=> b!435356 m!423255))

(declare-fun m!423263 () Bool)

(assert (=> b!435356 m!423263))

(declare-fun m!423265 () Bool)

(assert (=> b!435356 m!423265))

(assert (=> b!435362 m!423255))

(declare-fun m!423267 () Bool)

(assert (=> b!435362 m!423267))

(declare-fun m!423269 () Bool)

(assert (=> b!435362 m!423269))

(declare-fun m!423271 () Bool)

(assert (=> b!435362 m!423271))

(assert (=> b!435362 m!423271))

(assert (=> b!435362 m!423269))

(declare-fun m!423273 () Bool)

(assert (=> b!435362 m!423273))

(declare-fun m!423275 () Bool)

(assert (=> b!435354 m!423275))

(declare-fun m!423277 () Bool)

(assert (=> b!435354 m!423277))

(declare-fun m!423279 () Bool)

(assert (=> b!435370 m!423279))

(declare-fun m!423281 () Bool)

(assert (=> b!435369 m!423281))

(declare-fun m!423283 () Bool)

(assert (=> b!435365 m!423283))

(declare-fun m!423285 () Bool)

(assert (=> b!435366 m!423285))

(assert (=> b!435366 m!423285))

(declare-fun m!423287 () Bool)

(assert (=> b!435366 m!423287))

(assert (=> b!435366 m!423255))

(assert (=> b!435366 m!423255))

(declare-fun m!423289 () Bool)

(assert (=> b!435366 m!423289))

(declare-fun m!423291 () Bool)

(assert (=> b!435371 m!423291))

(declare-fun m!423293 () Bool)

(assert (=> b!435357 m!423293))

(declare-fun m!423295 () Bool)

(assert (=> b!435357 m!423295))

(declare-fun m!423297 () Bool)

(assert (=> b!435357 m!423297))

(declare-fun m!423299 () Bool)

(assert (=> start!39996 m!423299))

(declare-fun m!423301 () Bool)

(assert (=> start!39996 m!423301))

(declare-fun m!423303 () Bool)

(assert (=> mapNonEmpty!18744 m!423303))

(check-sat (not mapNonEmpty!18744) (not b!435373) (not b!435354) (not b_lambda!9351) (not b!435365) (not b!435356) (not b_next!10263) (not b!435366) (not b!435359) (not b!435371) b_and!18187 (not b!435357) tp_is_empty!11415 (not b!435362) (not b!435370) (not start!39996) (not b!435369) (not b!435360))
(check-sat b_and!18187 (not b_next!10263))
