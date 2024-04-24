; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40016 () Bool)

(assert start!40016)

(declare-fun b_free!10297 () Bool)

(declare-fun b_next!10297 () Bool)

(assert (=> start!40016 (= b_free!10297 (not b_next!10297))))

(declare-fun tp!36419 () Bool)

(declare-fun b_and!18267 () Bool)

(assert (=> start!40016 (= tp!36419 b_and!18267)))

(declare-fun b!436359 () Bool)

(declare-fun e!257689 () Bool)

(declare-fun e!257680 () Bool)

(assert (=> b!436359 (= e!257689 e!257680)))

(declare-fun res!257250 () Bool)

(assert (=> b!436359 (=> (not res!257250) (not e!257680))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436359 (= res!257250 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16371 0))(
  ( (V!16372 (val!5769 Int)) )
))
(declare-fun minValue!515 () V!16371)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16371)

(declare-datatypes ((tuple2!7546 0))(
  ( (tuple2!7547 (_1!3784 (_ BitVec 64)) (_2!3784 V!16371)) )
))
(declare-datatypes ((List!7535 0))(
  ( (Nil!7532) (Cons!7531 (h!8387 tuple2!7546) (t!13273 List!7535)) )
))
(declare-datatypes ((ListLongMap!6461 0))(
  ( (ListLongMap!6462 (toList!3246 List!7535)) )
))
(declare-fun lt!201207 () ListLongMap!6461)

(declare-datatypes ((array!26724 0))(
  ( (array!26725 (arr!12811 (Array (_ BitVec 32) (_ BitVec 64))) (size!13163 (_ BitVec 32))) )
))
(declare-fun lt!201219 () array!26724)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5381 0))(
  ( (ValueCellFull!5381 (v!8017 V!16371)) (EmptyCell!5381) )
))
(declare-datatypes ((array!26726 0))(
  ( (array!26727 (arr!12812 (Array (_ BitVec 32) ValueCell!5381)) (size!13164 (_ BitVec 32))) )
))
(declare-fun lt!201217 () array!26726)

(declare-fun getCurrentListMapNoExtraKeys!1479 (array!26724 array!26726 (_ BitVec 32) (_ BitVec 32) V!16371 V!16371 (_ BitVec 32) Int) ListLongMap!6461)

(assert (=> b!436359 (= lt!201207 (getCurrentListMapNoExtraKeys!1479 lt!201219 lt!201217 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26726)

(declare-fun v!412 () V!16371)

(assert (=> b!436359 (= lt!201217 (array!26727 (store (arr!12812 _values!549) i!563 (ValueCellFull!5381 v!412)) (size!13164 _values!549)))))

(declare-fun lt!201205 () ListLongMap!6461)

(declare-fun _keys!709 () array!26724)

(assert (=> b!436359 (= lt!201205 (getCurrentListMapNoExtraKeys!1479 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436360 () Bool)

(declare-fun res!257262 () Bool)

(declare-fun e!257682 () Bool)

(assert (=> b!436360 (=> (not res!257262) (not e!257682))))

(declare-datatypes ((List!7536 0))(
  ( (Nil!7533) (Cons!7532 (h!8388 (_ BitVec 64)) (t!13274 List!7536)) )
))
(declare-fun arrayNoDuplicates!0 (array!26724 (_ BitVec 32) List!7536) Bool)

(assert (=> b!436360 (= res!257262 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7533))))

(declare-fun b!436361 () Bool)

(declare-fun e!257687 () Bool)

(declare-fun tp_is_empty!11449 () Bool)

(assert (=> b!436361 (= e!257687 tp_is_empty!11449)))

(declare-fun res!257252 () Bool)

(assert (=> start!40016 (=> (not res!257252) (not e!257682))))

(assert (=> start!40016 (= res!257252 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13163 _keys!709))))))

(assert (=> start!40016 e!257682))

(assert (=> start!40016 tp_is_empty!11449))

(assert (=> start!40016 tp!36419))

(assert (=> start!40016 true))

(declare-fun e!257688 () Bool)

(declare-fun array_inv!9370 (array!26726) Bool)

(assert (=> start!40016 (and (array_inv!9370 _values!549) e!257688)))

(declare-fun array_inv!9371 (array!26724) Bool)

(assert (=> start!40016 (array_inv!9371 _keys!709)))

(declare-fun mapIsEmpty!18795 () Bool)

(declare-fun mapRes!18795 () Bool)

(assert (=> mapIsEmpty!18795 mapRes!18795))

(declare-fun b!436362 () Bool)

(declare-fun res!257248 () Bool)

(assert (=> b!436362 (=> (not res!257248) (not e!257682))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436362 (= res!257248 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436363 () Bool)

(declare-fun res!257258 () Bool)

(assert (=> b!436363 (=> (not res!257258) (not e!257682))))

(assert (=> b!436363 (= res!257258 (and (= (size!13164 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13163 _keys!709) (size!13164 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436364 () Bool)

(assert (=> b!436364 (= e!257682 e!257689)))

(declare-fun res!257260 () Bool)

(assert (=> b!436364 (=> (not res!257260) (not e!257689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26724 (_ BitVec 32)) Bool)

(assert (=> b!436364 (= res!257260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201219 mask!1025))))

(assert (=> b!436364 (= lt!201219 (array!26725 (store (arr!12811 _keys!709) i!563 k0!794) (size!13163 _keys!709)))))

(declare-fun b!436365 () Bool)

(declare-fun res!257251 () Bool)

(assert (=> b!436365 (=> (not res!257251) (not e!257682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436365 (= res!257251 (validKeyInArray!0 k0!794))))

(declare-fun b!436366 () Bool)

(declare-fun e!257684 () Bool)

(assert (=> b!436366 (= e!257684 tp_is_empty!11449)))

(declare-fun b!436367 () Bool)

(declare-fun res!257254 () Bool)

(assert (=> b!436367 (=> (not res!257254) (not e!257682))))

(assert (=> b!436367 (= res!257254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436368 () Bool)

(declare-fun res!257256 () Bool)

(assert (=> b!436368 (=> (not res!257256) (not e!257682))))

(assert (=> b!436368 (= res!257256 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13163 _keys!709))))))

(declare-fun b!436369 () Bool)

(assert (=> b!436369 (= e!257688 (and e!257687 mapRes!18795))))

(declare-fun condMapEmpty!18795 () Bool)

(declare-fun mapDefault!18795 () ValueCell!5381)

(assert (=> b!436369 (= condMapEmpty!18795 (= (arr!12812 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5381)) mapDefault!18795)))))

(declare-fun b!436370 () Bool)

(declare-fun res!257255 () Bool)

(assert (=> b!436370 (=> (not res!257255) (not e!257689))))

(assert (=> b!436370 (= res!257255 (bvsle from!863 i!563))))

(declare-fun b!436371 () Bool)

(declare-fun e!257683 () Bool)

(declare-fun e!257685 () Bool)

(assert (=> b!436371 (= e!257683 e!257685)))

(declare-fun res!257257 () Bool)

(assert (=> b!436371 (=> res!257257 e!257685)))

(assert (=> b!436371 (= res!257257 (= k0!794 (select (arr!12811 _keys!709) from!863)))))

(assert (=> b!436371 (not (= (select (arr!12811 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12968 0))(
  ( (Unit!12969) )
))
(declare-fun lt!201214 () Unit!12968)

(declare-fun e!257686 () Unit!12968)

(assert (=> b!436371 (= lt!201214 e!257686)))

(declare-fun c!55758 () Bool)

(assert (=> b!436371 (= c!55758 (= (select (arr!12811 _keys!709) from!863) k0!794))))

(declare-fun lt!201213 () ListLongMap!6461)

(assert (=> b!436371 (= lt!201207 lt!201213)))

(declare-fun lt!201211 () ListLongMap!6461)

(declare-fun lt!201208 () tuple2!7546)

(declare-fun +!1450 (ListLongMap!6461 tuple2!7546) ListLongMap!6461)

(assert (=> b!436371 (= lt!201213 (+!1450 lt!201211 lt!201208))))

(declare-fun lt!201210 () V!16371)

(assert (=> b!436371 (= lt!201208 (tuple2!7547 (select (arr!12811 _keys!709) from!863) lt!201210))))

(declare-fun get!6401 (ValueCell!5381 V!16371) V!16371)

(declare-fun dynLambda!848 (Int (_ BitVec 64)) V!16371)

(assert (=> b!436371 (= lt!201210 (get!6401 (select (arr!12812 _values!549) from!863) (dynLambda!848 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436372 () Bool)

(declare-fun res!257249 () Bool)

(assert (=> b!436372 (=> (not res!257249) (not e!257689))))

(assert (=> b!436372 (= res!257249 (arrayNoDuplicates!0 lt!201219 #b00000000000000000000000000000000 Nil!7533))))

(declare-fun b!436373 () Bool)

(assert (=> b!436373 (= e!257680 (not e!257683))))

(declare-fun res!257259 () Bool)

(assert (=> b!436373 (=> res!257259 e!257683)))

(assert (=> b!436373 (= res!257259 (not (validKeyInArray!0 (select (arr!12811 _keys!709) from!863))))))

(declare-fun lt!201209 () ListLongMap!6461)

(assert (=> b!436373 (= lt!201209 lt!201211)))

(declare-fun lt!201212 () ListLongMap!6461)

(declare-fun lt!201218 () tuple2!7546)

(assert (=> b!436373 (= lt!201211 (+!1450 lt!201212 lt!201218))))

(assert (=> b!436373 (= lt!201209 (getCurrentListMapNoExtraKeys!1479 lt!201219 lt!201217 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436373 (= lt!201218 (tuple2!7547 k0!794 v!412))))

(assert (=> b!436373 (= lt!201212 (getCurrentListMapNoExtraKeys!1479 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!201215 () Unit!12968)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!610 (array!26724 array!26726 (_ BitVec 32) (_ BitVec 32) V!16371 V!16371 (_ BitVec 32) (_ BitVec 64) V!16371 (_ BitVec 32) Int) Unit!12968)

(assert (=> b!436373 (= lt!201215 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!610 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436374 () Bool)

(declare-fun res!257253 () Bool)

(assert (=> b!436374 (=> (not res!257253) (not e!257682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436374 (= res!257253 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18795 () Bool)

(declare-fun tp!36420 () Bool)

(assert (=> mapNonEmpty!18795 (= mapRes!18795 (and tp!36420 e!257684))))

(declare-fun mapKey!18795 () (_ BitVec 32))

(declare-fun mapRest!18795 () (Array (_ BitVec 32) ValueCell!5381))

(declare-fun mapValue!18795 () ValueCell!5381)

(assert (=> mapNonEmpty!18795 (= (arr!12812 _values!549) (store mapRest!18795 mapKey!18795 mapValue!18795))))

(declare-fun b!436375 () Bool)

(declare-fun Unit!12970 () Unit!12968)

(assert (=> b!436375 (= e!257686 Unit!12970)))

(declare-fun b!436376 () Bool)

(declare-fun res!257261 () Bool)

(assert (=> b!436376 (=> (not res!257261) (not e!257682))))

(assert (=> b!436376 (= res!257261 (or (= (select (arr!12811 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12811 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436377 () Bool)

(assert (=> b!436377 (= e!257685 true)))

(assert (=> b!436377 (= lt!201213 (+!1450 (+!1450 lt!201212 lt!201208) lt!201218))))

(declare-fun lt!201206 () Unit!12968)

(declare-fun addCommutativeForDiffKeys!414 (ListLongMap!6461 (_ BitVec 64) V!16371 (_ BitVec 64) V!16371) Unit!12968)

(assert (=> b!436377 (= lt!201206 (addCommutativeForDiffKeys!414 lt!201212 k0!794 v!412 (select (arr!12811 _keys!709) from!863) lt!201210))))

(declare-fun b!436378 () Bool)

(declare-fun Unit!12971 () Unit!12968)

(assert (=> b!436378 (= e!257686 Unit!12971)))

(declare-fun lt!201216 () Unit!12968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26724 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12968)

(assert (=> b!436378 (= lt!201216 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436378 false))

(assert (= (and start!40016 res!257252) b!436374))

(assert (= (and b!436374 res!257253) b!436363))

(assert (= (and b!436363 res!257258) b!436367))

(assert (= (and b!436367 res!257254) b!436360))

(assert (= (and b!436360 res!257262) b!436368))

(assert (= (and b!436368 res!257256) b!436365))

(assert (= (and b!436365 res!257251) b!436376))

(assert (= (and b!436376 res!257261) b!436362))

(assert (= (and b!436362 res!257248) b!436364))

(assert (= (and b!436364 res!257260) b!436372))

(assert (= (and b!436372 res!257249) b!436370))

(assert (= (and b!436370 res!257255) b!436359))

(assert (= (and b!436359 res!257250) b!436373))

(assert (= (and b!436373 (not res!257259)) b!436371))

(assert (= (and b!436371 c!55758) b!436378))

(assert (= (and b!436371 (not c!55758)) b!436375))

(assert (= (and b!436371 (not res!257257)) b!436377))

(assert (= (and b!436369 condMapEmpty!18795) mapIsEmpty!18795))

(assert (= (and b!436369 (not condMapEmpty!18795)) mapNonEmpty!18795))

(get-info :version)

(assert (= (and mapNonEmpty!18795 ((_ is ValueCellFull!5381) mapValue!18795)) b!436366))

(assert (= (and b!436369 ((_ is ValueCellFull!5381) mapDefault!18795)) b!436361))

(assert (= start!40016 b!436369))

(declare-fun b_lambda!9407 () Bool)

(assert (=> (not b_lambda!9407) (not b!436371)))

(declare-fun t!13272 () Bool)

(declare-fun tb!3695 () Bool)

(assert (=> (and start!40016 (= defaultEntry!557 defaultEntry!557) t!13272) tb!3695))

(declare-fun result!6925 () Bool)

(assert (=> tb!3695 (= result!6925 tp_is_empty!11449)))

(assert (=> b!436371 t!13272))

(declare-fun b_and!18269 () Bool)

(assert (= b_and!18267 (and (=> t!13272 result!6925) b_and!18269)))

(declare-fun m!424451 () Bool)

(assert (=> b!436371 m!424451))

(declare-fun m!424453 () Bool)

(assert (=> b!436371 m!424453))

(declare-fun m!424455 () Bool)

(assert (=> b!436371 m!424455))

(declare-fun m!424457 () Bool)

(assert (=> b!436371 m!424457))

(assert (=> b!436371 m!424457))

(assert (=> b!436371 m!424455))

(declare-fun m!424459 () Bool)

(assert (=> b!436371 m!424459))

(declare-fun m!424461 () Bool)

(assert (=> b!436362 m!424461))

(declare-fun m!424463 () Bool)

(assert (=> b!436372 m!424463))

(declare-fun m!424465 () Bool)

(assert (=> b!436367 m!424465))

(declare-fun m!424467 () Bool)

(assert (=> b!436376 m!424467))

(assert (=> b!436373 m!424451))

(declare-fun m!424469 () Bool)

(assert (=> b!436373 m!424469))

(declare-fun m!424471 () Bool)

(assert (=> b!436373 m!424471))

(declare-fun m!424473 () Bool)

(assert (=> b!436373 m!424473))

(assert (=> b!436373 m!424451))

(declare-fun m!424475 () Bool)

(assert (=> b!436373 m!424475))

(declare-fun m!424477 () Bool)

(assert (=> b!436373 m!424477))

(declare-fun m!424479 () Bool)

(assert (=> b!436364 m!424479))

(declare-fun m!424481 () Bool)

(assert (=> b!436364 m!424481))

(declare-fun m!424483 () Bool)

(assert (=> mapNonEmpty!18795 m!424483))

(declare-fun m!424485 () Bool)

(assert (=> b!436377 m!424485))

(assert (=> b!436377 m!424485))

(declare-fun m!424487 () Bool)

(assert (=> b!436377 m!424487))

(assert (=> b!436377 m!424451))

(assert (=> b!436377 m!424451))

(declare-fun m!424489 () Bool)

(assert (=> b!436377 m!424489))

(declare-fun m!424491 () Bool)

(assert (=> b!436359 m!424491))

(declare-fun m!424493 () Bool)

(assert (=> b!436359 m!424493))

(declare-fun m!424495 () Bool)

(assert (=> b!436359 m!424495))

(declare-fun m!424497 () Bool)

(assert (=> b!436374 m!424497))

(declare-fun m!424499 () Bool)

(assert (=> b!436360 m!424499))

(declare-fun m!424501 () Bool)

(assert (=> b!436365 m!424501))

(declare-fun m!424503 () Bool)

(assert (=> b!436378 m!424503))

(declare-fun m!424505 () Bool)

(assert (=> start!40016 m!424505))

(declare-fun m!424507 () Bool)

(assert (=> start!40016 m!424507))

(check-sat (not b!436364) (not b!436377) (not b!436365) (not b!436360) (not b_lambda!9407) (not mapNonEmpty!18795) (not b!436371) (not b!436367) (not b!436359) (not b!436372) tp_is_empty!11449 (not start!40016) (not b!436374) (not b!436362) (not b!436373) b_and!18269 (not b!436378) (not b_next!10297))
(check-sat b_and!18269 (not b_next!10297))
