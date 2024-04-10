; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39900 () Bool)

(assert start!39900)

(declare-fun b_free!10167 () Bool)

(declare-fun b_next!10167 () Bool)

(assert (=> start!39900 (= b_free!10167 (not b_next!10167))))

(declare-fun tp!36029 () Bool)

(declare-fun b_and!17993 () Bool)

(assert (=> start!39900 (= tp!36029 b_and!17993)))

(declare-fun b!432378 () Bool)

(declare-fun e!255764 () Bool)

(declare-fun tp_is_empty!11319 () Bool)

(assert (=> b!432378 (= e!255764 tp_is_empty!11319)))

(declare-fun b!432379 () Bool)

(declare-fun res!254334 () Bool)

(declare-fun e!255768 () Bool)

(assert (=> b!432379 (=> (not res!254334) (not e!255768))))

(declare-datatypes ((array!26471 0))(
  ( (array!26472 (arr!12685 (Array (_ BitVec 32) (_ BitVec 64))) (size!13037 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26471)

(declare-datatypes ((List!7542 0))(
  ( (Nil!7539) (Cons!7538 (h!8394 (_ BitVec 64)) (t!13158 List!7542)) )
))
(declare-fun arrayNoDuplicates!0 (array!26471 (_ BitVec 32) List!7542) Bool)

(assert (=> b!432379 (= res!254334 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7539))))

(declare-fun b!432380 () Bool)

(declare-fun res!254337 () Bool)

(assert (=> b!432380 (=> (not res!254337) (not e!255768))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432380 (= res!254337 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13037 _keys!709))))))

(declare-fun b!432381 () Bool)

(declare-fun res!254327 () Bool)

(assert (=> b!432381 (=> (not res!254327) (not e!255768))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16197 0))(
  ( (V!16198 (val!5704 Int)) )
))
(declare-datatypes ((ValueCell!5316 0))(
  ( (ValueCellFull!5316 (v!7951 V!16197)) (EmptyCell!5316) )
))
(declare-datatypes ((array!26473 0))(
  ( (array!26474 (arr!12686 (Array (_ BitVec 32) ValueCell!5316)) (size!13038 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26473)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!432381 (= res!254327 (and (= (size!13038 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13037 _keys!709) (size!13038 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432382 () Bool)

(declare-fun res!254329 () Bool)

(assert (=> b!432382 (=> (not res!254329) (not e!255768))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432382 (= res!254329 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!254340 () Bool)

(assert (=> start!39900 (=> (not res!254340) (not e!255768))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39900 (= res!254340 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13037 _keys!709))))))

(assert (=> start!39900 e!255768))

(assert (=> start!39900 tp_is_empty!11319))

(assert (=> start!39900 tp!36029))

(assert (=> start!39900 true))

(declare-fun e!255769 () Bool)

(declare-fun array_inv!9228 (array!26473) Bool)

(assert (=> start!39900 (and (array_inv!9228 _values!549) e!255769)))

(declare-fun array_inv!9229 (array!26471) Bool)

(assert (=> start!39900 (array_inv!9229 _keys!709)))

(declare-fun b!432383 () Bool)

(declare-fun res!254335 () Bool)

(assert (=> b!432383 (=> (not res!254335) (not e!255768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432383 (= res!254335 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18600 () Bool)

(declare-fun mapRes!18600 () Bool)

(declare-fun tp!36030 () Bool)

(declare-fun e!255763 () Bool)

(assert (=> mapNonEmpty!18600 (= mapRes!18600 (and tp!36030 e!255763))))

(declare-fun mapKey!18600 () (_ BitVec 32))

(declare-fun mapRest!18600 () (Array (_ BitVec 32) ValueCell!5316))

(declare-fun mapValue!18600 () ValueCell!5316)

(assert (=> mapNonEmpty!18600 (= (arr!12686 _values!549) (store mapRest!18600 mapKey!18600 mapValue!18600))))

(declare-fun b!432384 () Bool)

(declare-fun res!254339 () Bool)

(assert (=> b!432384 (=> (not res!254339) (not e!255768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432384 (= res!254339 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18600 () Bool)

(assert (=> mapIsEmpty!18600 mapRes!18600))

(declare-fun b!432385 () Bool)

(declare-fun res!254332 () Bool)

(declare-fun e!255766 () Bool)

(assert (=> b!432385 (=> (not res!254332) (not e!255766))))

(assert (=> b!432385 (= res!254332 (bvsle from!863 i!563))))

(declare-fun b!432386 () Bool)

(declare-fun res!254328 () Bool)

(assert (=> b!432386 (=> (not res!254328) (not e!255768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26471 (_ BitVec 32)) Bool)

(assert (=> b!432386 (= res!254328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432387 () Bool)

(declare-datatypes ((Unit!12768 0))(
  ( (Unit!12769) )
))
(declare-fun e!255771 () Unit!12768)

(declare-fun Unit!12770 () Unit!12768)

(assert (=> b!432387 (= e!255771 Unit!12770)))

(declare-fun b!432388 () Bool)

(declare-fun Unit!12771 () Unit!12768)

(assert (=> b!432388 (= e!255771 Unit!12771)))

(declare-fun lt!198263 () Unit!12768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26471 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12768)

(assert (=> b!432388 (= lt!198263 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432388 false))

(declare-fun b!432389 () Bool)

(declare-fun e!255770 () Bool)

(assert (=> b!432389 (= e!255770 true)))

(declare-datatypes ((tuple2!7528 0))(
  ( (tuple2!7529 (_1!3775 (_ BitVec 64)) (_2!3775 V!16197)) )
))
(declare-fun lt!198269 () tuple2!7528)

(declare-fun lt!198268 () tuple2!7528)

(declare-datatypes ((List!7543 0))(
  ( (Nil!7540) (Cons!7539 (h!8395 tuple2!7528) (t!13159 List!7543)) )
))
(declare-datatypes ((ListLongMap!6441 0))(
  ( (ListLongMap!6442 (toList!3236 List!7543)) )
))
(declare-fun lt!198270 () ListLongMap!6441)

(declare-fun lt!198265 () ListLongMap!6441)

(declare-fun +!1384 (ListLongMap!6441 tuple2!7528) ListLongMap!6441)

(assert (=> b!432389 (= lt!198265 (+!1384 (+!1384 lt!198270 lt!198268) lt!198269))))

(declare-fun lt!198266 () V!16197)

(declare-fun v!412 () V!16197)

(declare-fun lt!198275 () Unit!12768)

(declare-fun addCommutativeForDiffKeys!374 (ListLongMap!6441 (_ BitVec 64) V!16197 (_ BitVec 64) V!16197) Unit!12768)

(assert (=> b!432389 (= lt!198275 (addCommutativeForDiffKeys!374 lt!198270 k0!794 v!412 (select (arr!12685 _keys!709) from!863) lt!198266))))

(declare-fun b!432390 () Bool)

(declare-fun res!254338 () Bool)

(assert (=> b!432390 (=> (not res!254338) (not e!255768))))

(assert (=> b!432390 (= res!254338 (or (= (select (arr!12685 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12685 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432391 () Bool)

(declare-fun e!255765 () Bool)

(declare-fun e!255762 () Bool)

(assert (=> b!432391 (= e!255765 (not e!255762))))

(declare-fun res!254331 () Bool)

(assert (=> b!432391 (=> res!254331 e!255762)))

(assert (=> b!432391 (= res!254331 (not (validKeyInArray!0 (select (arr!12685 _keys!709) from!863))))))

(declare-fun lt!198273 () ListLongMap!6441)

(declare-fun lt!198271 () ListLongMap!6441)

(assert (=> b!432391 (= lt!198273 lt!198271)))

(assert (=> b!432391 (= lt!198271 (+!1384 lt!198270 lt!198269))))

(declare-fun minValue!515 () V!16197)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!198264 () array!26473)

(declare-fun zeroValue!515 () V!16197)

(declare-fun lt!198261 () array!26471)

(declare-fun getCurrentListMapNoExtraKeys!1434 (array!26471 array!26473 (_ BitVec 32) (_ BitVec 32) V!16197 V!16197 (_ BitVec 32) Int) ListLongMap!6441)

(assert (=> b!432391 (= lt!198273 (getCurrentListMapNoExtraKeys!1434 lt!198261 lt!198264 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432391 (= lt!198269 (tuple2!7529 k0!794 v!412))))

(assert (=> b!432391 (= lt!198270 (getCurrentListMapNoExtraKeys!1434 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198274 () Unit!12768)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!568 (array!26471 array!26473 (_ BitVec 32) (_ BitVec 32) V!16197 V!16197 (_ BitVec 32) (_ BitVec 64) V!16197 (_ BitVec 32) Int) Unit!12768)

(assert (=> b!432391 (= lt!198274 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!568 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432392 () Bool)

(assert (=> b!432392 (= e!255768 e!255766)))

(declare-fun res!254330 () Bool)

(assert (=> b!432392 (=> (not res!254330) (not e!255766))))

(assert (=> b!432392 (= res!254330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198261 mask!1025))))

(assert (=> b!432392 (= lt!198261 (array!26472 (store (arr!12685 _keys!709) i!563 k0!794) (size!13037 _keys!709)))))

(declare-fun b!432393 () Bool)

(assert (=> b!432393 (= e!255769 (and e!255764 mapRes!18600))))

(declare-fun condMapEmpty!18600 () Bool)

(declare-fun mapDefault!18600 () ValueCell!5316)

(assert (=> b!432393 (= condMapEmpty!18600 (= (arr!12686 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5316)) mapDefault!18600)))))

(declare-fun b!432394 () Bool)

(declare-fun res!254336 () Bool)

(assert (=> b!432394 (=> (not res!254336) (not e!255766))))

(assert (=> b!432394 (= res!254336 (arrayNoDuplicates!0 lt!198261 #b00000000000000000000000000000000 Nil!7539))))

(declare-fun b!432395 () Bool)

(assert (=> b!432395 (= e!255763 tp_is_empty!11319)))

(declare-fun b!432396 () Bool)

(assert (=> b!432396 (= e!255766 e!255765)))

(declare-fun res!254333 () Bool)

(assert (=> b!432396 (=> (not res!254333) (not e!255765))))

(assert (=> b!432396 (= res!254333 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!198267 () ListLongMap!6441)

(assert (=> b!432396 (= lt!198267 (getCurrentListMapNoExtraKeys!1434 lt!198261 lt!198264 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432396 (= lt!198264 (array!26474 (store (arr!12686 _values!549) i!563 (ValueCellFull!5316 v!412)) (size!13038 _values!549)))))

(declare-fun lt!198262 () ListLongMap!6441)

(assert (=> b!432396 (= lt!198262 (getCurrentListMapNoExtraKeys!1434 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432397 () Bool)

(assert (=> b!432397 (= e!255762 e!255770)))

(declare-fun res!254326 () Bool)

(assert (=> b!432397 (=> res!254326 e!255770)))

(assert (=> b!432397 (= res!254326 (= k0!794 (select (arr!12685 _keys!709) from!863)))))

(assert (=> b!432397 (not (= (select (arr!12685 _keys!709) from!863) k0!794))))

(declare-fun lt!198272 () Unit!12768)

(assert (=> b!432397 (= lt!198272 e!255771)))

(declare-fun c!55586 () Bool)

(assert (=> b!432397 (= c!55586 (= (select (arr!12685 _keys!709) from!863) k0!794))))

(assert (=> b!432397 (= lt!198267 lt!198265)))

(assert (=> b!432397 (= lt!198265 (+!1384 lt!198271 lt!198268))))

(assert (=> b!432397 (= lt!198268 (tuple2!7529 (select (arr!12685 _keys!709) from!863) lt!198266))))

(declare-fun get!6306 (ValueCell!5316 V!16197) V!16197)

(declare-fun dynLambda!803 (Int (_ BitVec 64)) V!16197)

(assert (=> b!432397 (= lt!198266 (get!6306 (select (arr!12686 _values!549) from!863) (dynLambda!803 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39900 res!254340) b!432383))

(assert (= (and b!432383 res!254335) b!432381))

(assert (= (and b!432381 res!254327) b!432386))

(assert (= (and b!432386 res!254328) b!432379))

(assert (= (and b!432379 res!254334) b!432380))

(assert (= (and b!432380 res!254337) b!432384))

(assert (= (and b!432384 res!254339) b!432390))

(assert (= (and b!432390 res!254338) b!432382))

(assert (= (and b!432382 res!254329) b!432392))

(assert (= (and b!432392 res!254330) b!432394))

(assert (= (and b!432394 res!254336) b!432385))

(assert (= (and b!432385 res!254332) b!432396))

(assert (= (and b!432396 res!254333) b!432391))

(assert (= (and b!432391 (not res!254331)) b!432397))

(assert (= (and b!432397 c!55586) b!432388))

(assert (= (and b!432397 (not c!55586)) b!432387))

(assert (= (and b!432397 (not res!254326)) b!432389))

(assert (= (and b!432393 condMapEmpty!18600) mapIsEmpty!18600))

(assert (= (and b!432393 (not condMapEmpty!18600)) mapNonEmpty!18600))

(get-info :version)

(assert (= (and mapNonEmpty!18600 ((_ is ValueCellFull!5316) mapValue!18600)) b!432395))

(assert (= (and b!432393 ((_ is ValueCellFull!5316) mapDefault!18600)) b!432378))

(assert (= start!39900 b!432393))

(declare-fun b_lambda!9255 () Bool)

(assert (=> (not b_lambda!9255) (not b!432397)))

(declare-fun t!13157 () Bool)

(declare-fun tb!3573 () Bool)

(assert (=> (and start!39900 (= defaultEntry!557 defaultEntry!557) t!13157) tb!3573))

(declare-fun result!6673 () Bool)

(assert (=> tb!3573 (= result!6673 tp_is_empty!11319)))

(assert (=> b!432397 t!13157))

(declare-fun b_and!17995 () Bool)

(assert (= b_and!17993 (and (=> t!13157 result!6673) b_and!17995)))

(declare-fun m!420463 () Bool)

(assert (=> b!432379 m!420463))

(declare-fun m!420465 () Bool)

(assert (=> start!39900 m!420465))

(declare-fun m!420467 () Bool)

(assert (=> start!39900 m!420467))

(declare-fun m!420469 () Bool)

(assert (=> b!432394 m!420469))

(declare-fun m!420471 () Bool)

(assert (=> b!432386 m!420471))

(declare-fun m!420473 () Bool)

(assert (=> b!432397 m!420473))

(declare-fun m!420475 () Bool)

(assert (=> b!432397 m!420475))

(declare-fun m!420477 () Bool)

(assert (=> b!432397 m!420477))

(declare-fun m!420479 () Bool)

(assert (=> b!432397 m!420479))

(assert (=> b!432397 m!420479))

(assert (=> b!432397 m!420477))

(declare-fun m!420481 () Bool)

(assert (=> b!432397 m!420481))

(declare-fun m!420483 () Bool)

(assert (=> b!432390 m!420483))

(declare-fun m!420485 () Bool)

(assert (=> b!432384 m!420485))

(declare-fun m!420487 () Bool)

(assert (=> b!432388 m!420487))

(declare-fun m!420489 () Bool)

(assert (=> b!432382 m!420489))

(declare-fun m!420491 () Bool)

(assert (=> b!432396 m!420491))

(declare-fun m!420493 () Bool)

(assert (=> b!432396 m!420493))

(declare-fun m!420495 () Bool)

(assert (=> b!432396 m!420495))

(declare-fun m!420497 () Bool)

(assert (=> mapNonEmpty!18600 m!420497))

(declare-fun m!420499 () Bool)

(assert (=> b!432383 m!420499))

(declare-fun m!420501 () Bool)

(assert (=> b!432392 m!420501))

(declare-fun m!420503 () Bool)

(assert (=> b!432392 m!420503))

(assert (=> b!432391 m!420473))

(declare-fun m!420505 () Bool)

(assert (=> b!432391 m!420505))

(declare-fun m!420507 () Bool)

(assert (=> b!432391 m!420507))

(declare-fun m!420509 () Bool)

(assert (=> b!432391 m!420509))

(assert (=> b!432391 m!420473))

(declare-fun m!420511 () Bool)

(assert (=> b!432391 m!420511))

(declare-fun m!420513 () Bool)

(assert (=> b!432391 m!420513))

(declare-fun m!420515 () Bool)

(assert (=> b!432389 m!420515))

(assert (=> b!432389 m!420515))

(declare-fun m!420517 () Bool)

(assert (=> b!432389 m!420517))

(assert (=> b!432389 m!420473))

(assert (=> b!432389 m!420473))

(declare-fun m!420519 () Bool)

(assert (=> b!432389 m!420519))

(check-sat (not b!432386) (not b!432388) (not b!432392) (not start!39900) (not b!432389) (not b!432397) b_and!17995 (not b!432396) tp_is_empty!11319 (not b!432391) (not b!432379) (not b!432383) (not b_lambda!9255) (not b!432394) (not b_next!10167) (not b!432382) (not b!432384) (not mapNonEmpty!18600))
(check-sat b_and!17995 (not b_next!10167))
