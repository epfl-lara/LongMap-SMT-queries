; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40022 () Bool)

(assert start!40022)

(declare-fun b_free!10303 () Bool)

(declare-fun b_next!10303 () Bool)

(assert (=> start!40022 (= b_free!10303 (not b_next!10303))))

(declare-fun tp!36438 () Bool)

(declare-fun b_and!18279 () Bool)

(assert (=> start!40022 (= tp!36438 b_and!18279)))

(declare-fun b!436545 () Bool)

(declare-fun res!257395 () Bool)

(declare-fun e!257770 () Bool)

(assert (=> b!436545 (=> (not res!257395) (not e!257770))))

(declare-datatypes ((array!26736 0))(
  ( (array!26737 (arr!12817 (Array (_ BitVec 32) (_ BitVec 64))) (size!13169 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26736)

(declare-datatypes ((List!7541 0))(
  ( (Nil!7538) (Cons!7537 (h!8393 (_ BitVec 64)) (t!13285 List!7541)) )
))
(declare-fun arrayNoDuplicates!0 (array!26736 (_ BitVec 32) List!7541) Bool)

(assert (=> b!436545 (= res!257395 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7538))))

(declare-fun b!436546 () Bool)

(declare-fun res!257387 () Bool)

(assert (=> b!436546 (=> (not res!257387) (not e!257770))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436546 (= res!257387 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436547 () Bool)

(declare-datatypes ((Unit!12979 0))(
  ( (Unit!12980) )
))
(declare-fun e!257773 () Unit!12979)

(declare-fun Unit!12981 () Unit!12979)

(assert (=> b!436547 (= e!257773 Unit!12981)))

(declare-fun b!436548 () Bool)

(declare-fun res!257388 () Bool)

(assert (=> b!436548 (=> (not res!257388) (not e!257770))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16379 0))(
  ( (V!16380 (val!5772 Int)) )
))
(declare-datatypes ((ValueCell!5384 0))(
  ( (ValueCellFull!5384 (v!8020 V!16379)) (EmptyCell!5384) )
))
(declare-datatypes ((array!26738 0))(
  ( (array!26739 (arr!12818 (Array (_ BitVec 32) ValueCell!5384)) (size!13170 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26738)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!436548 (= res!257388 (and (= (size!13170 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13169 _keys!709) (size!13170 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436549 () Bool)

(declare-fun e!257779 () Bool)

(declare-fun e!257778 () Bool)

(assert (=> b!436549 (= e!257779 (not e!257778))))

(declare-fun res!257385 () Bool)

(assert (=> b!436549 (=> res!257385 e!257778)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436549 (= res!257385 (not (validKeyInArray!0 (select (arr!12817 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7552 0))(
  ( (tuple2!7553 (_1!3787 (_ BitVec 64)) (_2!3787 V!16379)) )
))
(declare-datatypes ((List!7542 0))(
  ( (Nil!7539) (Cons!7538 (h!8394 tuple2!7552) (t!13286 List!7542)) )
))
(declare-datatypes ((ListLongMap!6467 0))(
  ( (ListLongMap!6468 (toList!3249 List!7542)) )
))
(declare-fun lt!201340 () ListLongMap!6467)

(declare-fun lt!201343 () ListLongMap!6467)

(assert (=> b!436549 (= lt!201340 lt!201343)))

(declare-fun lt!201344 () ListLongMap!6467)

(declare-fun lt!201352 () tuple2!7552)

(declare-fun +!1453 (ListLongMap!6467 tuple2!7552) ListLongMap!6467)

(assert (=> b!436549 (= lt!201343 (+!1453 lt!201344 lt!201352))))

(declare-fun minValue!515 () V!16379)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16379)

(declare-fun lt!201347 () array!26738)

(declare-fun lt!201341 () array!26736)

(declare-fun getCurrentListMapNoExtraKeys!1482 (array!26736 array!26738 (_ BitVec 32) (_ BitVec 32) V!16379 V!16379 (_ BitVec 32) Int) ListLongMap!6467)

(assert (=> b!436549 (= lt!201340 (getCurrentListMapNoExtraKeys!1482 lt!201341 lt!201347 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16379)

(assert (=> b!436549 (= lt!201352 (tuple2!7553 k0!794 v!412))))

(assert (=> b!436549 (= lt!201344 (getCurrentListMapNoExtraKeys!1482 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!201351 () Unit!12979)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!613 (array!26736 array!26738 (_ BitVec 32) (_ BitVec 32) V!16379 V!16379 (_ BitVec 32) (_ BitVec 64) V!16379 (_ BitVec 32) Int) Unit!12979)

(assert (=> b!436549 (= lt!201351 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!613 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436550 () Bool)

(declare-fun e!257772 () Bool)

(assert (=> b!436550 (= e!257770 e!257772)))

(declare-fun res!257393 () Bool)

(assert (=> b!436550 (=> (not res!257393) (not e!257772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26736 (_ BitVec 32)) Bool)

(assert (=> b!436550 (= res!257393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201341 mask!1025))))

(assert (=> b!436550 (= lt!201341 (array!26737 (store (arr!12817 _keys!709) i!563 k0!794) (size!13169 _keys!709)))))

(declare-fun b!436551 () Bool)

(declare-fun e!257776 () Bool)

(assert (=> b!436551 (= e!257776 true)))

(declare-fun lt!201346 () ListLongMap!6467)

(declare-fun lt!201350 () tuple2!7552)

(assert (=> b!436551 (= lt!201346 (+!1453 (+!1453 lt!201344 lt!201350) lt!201352))))

(declare-fun lt!201348 () V!16379)

(declare-fun lt!201353 () Unit!12979)

(declare-fun addCommutativeForDiffKeys!417 (ListLongMap!6467 (_ BitVec 64) V!16379 (_ BitVec 64) V!16379) Unit!12979)

(assert (=> b!436551 (= lt!201353 (addCommutativeForDiffKeys!417 lt!201344 k0!794 v!412 (select (arr!12817 _keys!709) from!863) lt!201348))))

(declare-fun b!436552 () Bool)

(assert (=> b!436552 (= e!257778 e!257776)))

(declare-fun res!257386 () Bool)

(assert (=> b!436552 (=> res!257386 e!257776)))

(assert (=> b!436552 (= res!257386 (= k0!794 (select (arr!12817 _keys!709) from!863)))))

(assert (=> b!436552 (not (= (select (arr!12817 _keys!709) from!863) k0!794))))

(declare-fun lt!201349 () Unit!12979)

(assert (=> b!436552 (= lt!201349 e!257773)))

(declare-fun c!55767 () Bool)

(assert (=> b!436552 (= c!55767 (= (select (arr!12817 _keys!709) from!863) k0!794))))

(declare-fun lt!201345 () ListLongMap!6467)

(assert (=> b!436552 (= lt!201345 lt!201346)))

(assert (=> b!436552 (= lt!201346 (+!1453 lt!201343 lt!201350))))

(assert (=> b!436552 (= lt!201350 (tuple2!7553 (select (arr!12817 _keys!709) from!863) lt!201348))))

(declare-fun get!6406 (ValueCell!5384 V!16379) V!16379)

(declare-fun dynLambda!851 (Int (_ BitVec 64)) V!16379)

(assert (=> b!436552 (= lt!201348 (get!6406 (select (arr!12818 _values!549) from!863) (dynLambda!851 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436553 () Bool)

(declare-fun res!257391 () Bool)

(assert (=> b!436553 (=> (not res!257391) (not e!257770))))

(assert (=> b!436553 (= res!257391 (or (= (select (arr!12817 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12817 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436554 () Bool)

(declare-fun res!257396 () Bool)

(assert (=> b!436554 (=> (not res!257396) (not e!257770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436554 (= res!257396 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18804 () Bool)

(declare-fun mapRes!18804 () Bool)

(assert (=> mapIsEmpty!18804 mapRes!18804))

(declare-fun res!257392 () Bool)

(assert (=> start!40022 (=> (not res!257392) (not e!257770))))

(assert (=> start!40022 (= res!257392 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13169 _keys!709))))))

(assert (=> start!40022 e!257770))

(declare-fun tp_is_empty!11455 () Bool)

(assert (=> start!40022 tp_is_empty!11455))

(assert (=> start!40022 tp!36438))

(assert (=> start!40022 true))

(declare-fun e!257777 () Bool)

(declare-fun array_inv!9376 (array!26738) Bool)

(assert (=> start!40022 (and (array_inv!9376 _values!549) e!257777)))

(declare-fun array_inv!9377 (array!26736) Bool)

(assert (=> start!40022 (array_inv!9377 _keys!709)))

(declare-fun b!436555 () Bool)

(assert (=> b!436555 (= e!257772 e!257779)))

(declare-fun res!257390 () Bool)

(assert (=> b!436555 (=> (not res!257390) (not e!257779))))

(assert (=> b!436555 (= res!257390 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!436555 (= lt!201345 (getCurrentListMapNoExtraKeys!1482 lt!201341 lt!201347 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436555 (= lt!201347 (array!26739 (store (arr!12818 _values!549) i!563 (ValueCellFull!5384 v!412)) (size!13170 _values!549)))))

(declare-fun lt!201342 () ListLongMap!6467)

(assert (=> b!436555 (= lt!201342 (getCurrentListMapNoExtraKeys!1482 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436556 () Bool)

(declare-fun e!257775 () Bool)

(assert (=> b!436556 (= e!257777 (and e!257775 mapRes!18804))))

(declare-fun condMapEmpty!18804 () Bool)

(declare-fun mapDefault!18804 () ValueCell!5384)

(assert (=> b!436556 (= condMapEmpty!18804 (= (arr!12818 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5384)) mapDefault!18804)))))

(declare-fun b!436557 () Bool)

(declare-fun res!257384 () Bool)

(assert (=> b!436557 (=> (not res!257384) (not e!257770))))

(assert (=> b!436557 (= res!257384 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13169 _keys!709))))))

(declare-fun mapNonEmpty!18804 () Bool)

(declare-fun tp!36437 () Bool)

(declare-fun e!257774 () Bool)

(assert (=> mapNonEmpty!18804 (= mapRes!18804 (and tp!36437 e!257774))))

(declare-fun mapValue!18804 () ValueCell!5384)

(declare-fun mapKey!18804 () (_ BitVec 32))

(declare-fun mapRest!18804 () (Array (_ BitVec 32) ValueCell!5384))

(assert (=> mapNonEmpty!18804 (= (arr!12818 _values!549) (store mapRest!18804 mapKey!18804 mapValue!18804))))

(declare-fun b!436558 () Bool)

(assert (=> b!436558 (= e!257775 tp_is_empty!11455)))

(declare-fun b!436559 () Bool)

(declare-fun res!257383 () Bool)

(assert (=> b!436559 (=> (not res!257383) (not e!257772))))

(assert (=> b!436559 (= res!257383 (arrayNoDuplicates!0 lt!201341 #b00000000000000000000000000000000 Nil!7538))))

(declare-fun b!436560 () Bool)

(assert (=> b!436560 (= e!257774 tp_is_empty!11455)))

(declare-fun b!436561 () Bool)

(declare-fun Unit!12982 () Unit!12979)

(assert (=> b!436561 (= e!257773 Unit!12982)))

(declare-fun lt!201354 () Unit!12979)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26736 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12979)

(assert (=> b!436561 (= lt!201354 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436561 false))

(declare-fun b!436562 () Bool)

(declare-fun res!257394 () Bool)

(assert (=> b!436562 (=> (not res!257394) (not e!257770))))

(assert (=> b!436562 (= res!257394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436563 () Bool)

(declare-fun res!257389 () Bool)

(assert (=> b!436563 (=> (not res!257389) (not e!257772))))

(assert (=> b!436563 (= res!257389 (bvsle from!863 i!563))))

(declare-fun b!436564 () Bool)

(declare-fun res!257397 () Bool)

(assert (=> b!436564 (=> (not res!257397) (not e!257770))))

(assert (=> b!436564 (= res!257397 (validKeyInArray!0 k0!794))))

(assert (= (and start!40022 res!257392) b!436554))

(assert (= (and b!436554 res!257396) b!436548))

(assert (= (and b!436548 res!257388) b!436562))

(assert (= (and b!436562 res!257394) b!436545))

(assert (= (and b!436545 res!257395) b!436557))

(assert (= (and b!436557 res!257384) b!436564))

(assert (= (and b!436564 res!257397) b!436553))

(assert (= (and b!436553 res!257391) b!436546))

(assert (= (and b!436546 res!257387) b!436550))

(assert (= (and b!436550 res!257393) b!436559))

(assert (= (and b!436559 res!257383) b!436563))

(assert (= (and b!436563 res!257389) b!436555))

(assert (= (and b!436555 res!257390) b!436549))

(assert (= (and b!436549 (not res!257385)) b!436552))

(assert (= (and b!436552 c!55767) b!436561))

(assert (= (and b!436552 (not c!55767)) b!436547))

(assert (= (and b!436552 (not res!257386)) b!436551))

(assert (= (and b!436556 condMapEmpty!18804) mapIsEmpty!18804))

(assert (= (and b!436556 (not condMapEmpty!18804)) mapNonEmpty!18804))

(get-info :version)

(assert (= (and mapNonEmpty!18804 ((_ is ValueCellFull!5384) mapValue!18804)) b!436560))

(assert (= (and b!436556 ((_ is ValueCellFull!5384) mapDefault!18804)) b!436558))

(assert (= start!40022 b!436556))

(declare-fun b_lambda!9413 () Bool)

(assert (=> (not b_lambda!9413) (not b!436552)))

(declare-fun t!13284 () Bool)

(declare-fun tb!3701 () Bool)

(assert (=> (and start!40022 (= defaultEntry!557 defaultEntry!557) t!13284) tb!3701))

(declare-fun result!6937 () Bool)

(assert (=> tb!3701 (= result!6937 tp_is_empty!11455)))

(assert (=> b!436552 t!13284))

(declare-fun b_and!18281 () Bool)

(assert (= b_and!18279 (and (=> t!13284 result!6937) b_and!18281)))

(declare-fun m!424625 () Bool)

(assert (=> b!436552 m!424625))

(declare-fun m!424627 () Bool)

(assert (=> b!436552 m!424627))

(declare-fun m!424629 () Bool)

(assert (=> b!436552 m!424629))

(declare-fun m!424631 () Bool)

(assert (=> b!436552 m!424631))

(assert (=> b!436552 m!424629))

(assert (=> b!436552 m!424627))

(declare-fun m!424633 () Bool)

(assert (=> b!436552 m!424633))

(declare-fun m!424635 () Bool)

(assert (=> b!436561 m!424635))

(declare-fun m!424637 () Bool)

(assert (=> b!436551 m!424637))

(assert (=> b!436551 m!424637))

(declare-fun m!424639 () Bool)

(assert (=> b!436551 m!424639))

(assert (=> b!436551 m!424625))

(assert (=> b!436551 m!424625))

(declare-fun m!424641 () Bool)

(assert (=> b!436551 m!424641))

(declare-fun m!424643 () Bool)

(assert (=> mapNonEmpty!18804 m!424643))

(declare-fun m!424645 () Bool)

(assert (=> b!436554 m!424645))

(assert (=> b!436549 m!424625))

(declare-fun m!424647 () Bool)

(assert (=> b!436549 m!424647))

(declare-fun m!424649 () Bool)

(assert (=> b!436549 m!424649))

(declare-fun m!424651 () Bool)

(assert (=> b!436549 m!424651))

(assert (=> b!436549 m!424625))

(declare-fun m!424653 () Bool)

(assert (=> b!436549 m!424653))

(declare-fun m!424655 () Bool)

(assert (=> b!436549 m!424655))

(declare-fun m!424657 () Bool)

(assert (=> start!40022 m!424657))

(declare-fun m!424659 () Bool)

(assert (=> start!40022 m!424659))

(declare-fun m!424661 () Bool)

(assert (=> b!436546 m!424661))

(declare-fun m!424663 () Bool)

(assert (=> b!436559 m!424663))

(declare-fun m!424665 () Bool)

(assert (=> b!436564 m!424665))

(declare-fun m!424667 () Bool)

(assert (=> b!436550 m!424667))

(declare-fun m!424669 () Bool)

(assert (=> b!436550 m!424669))

(declare-fun m!424671 () Bool)

(assert (=> b!436555 m!424671))

(declare-fun m!424673 () Bool)

(assert (=> b!436555 m!424673))

(declare-fun m!424675 () Bool)

(assert (=> b!436555 m!424675))

(declare-fun m!424677 () Bool)

(assert (=> b!436553 m!424677))

(declare-fun m!424679 () Bool)

(assert (=> b!436545 m!424679))

(declare-fun m!424681 () Bool)

(assert (=> b!436562 m!424681))

(check-sat (not b!436550) tp_is_empty!11455 (not b!436551) (not b!436561) (not b!436554) (not b!436559) (not b!436549) (not start!40022) b_and!18281 (not b!436546) (not b!436562) (not mapNonEmpty!18804) (not b_next!10303) (not b!436564) (not b!436545) (not b_lambda!9413) (not b!436552) (not b!436555))
(check-sat b_and!18281 (not b_next!10303))
