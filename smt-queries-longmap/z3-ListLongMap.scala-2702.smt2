; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40032 () Bool)

(assert start!40032)

(declare-fun b_free!10299 () Bool)

(declare-fun b_next!10299 () Bool)

(assert (=> start!40032 (= b_free!10299 (not b_next!10299))))

(declare-fun tp!36425 () Bool)

(declare-fun b_and!18257 () Bool)

(assert (=> start!40032 (= tp!36425 b_and!18257)))

(declare-fun b!436470 () Bool)

(declare-fun e!257744 () Bool)

(declare-fun e!257745 () Bool)

(assert (=> b!436470 (= e!257744 e!257745)))

(declare-fun res!257298 () Bool)

(assert (=> b!436470 (=> (not res!257298) (not e!257745))))

(declare-datatypes ((array!26727 0))(
  ( (array!26728 (arr!12813 (Array (_ BitVec 32) (_ BitVec 64))) (size!13165 (_ BitVec 32))) )
))
(declare-fun lt!201239 () array!26727)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26727 (_ BitVec 32)) Bool)

(assert (=> b!436470 (= res!257298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201239 mask!1025))))

(declare-fun _keys!709 () array!26727)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436470 (= lt!201239 (array!26728 (store (arr!12813 _keys!709) i!563 k0!794) (size!13165 _keys!709)))))

(declare-fun b!436471 () Bool)

(declare-fun res!257306 () Bool)

(assert (=> b!436471 (=> (not res!257306) (not e!257744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436471 (= res!257306 (validKeyInArray!0 k0!794))))

(declare-fun b!436472 () Bool)

(declare-datatypes ((Unit!12982 0))(
  ( (Unit!12983) )
))
(declare-fun e!257747 () Unit!12982)

(declare-fun Unit!12984 () Unit!12982)

(assert (=> b!436472 (= e!257747 Unit!12984)))

(declare-fun lt!201234 () Unit!12982)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26727 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12982)

(assert (=> b!436472 (= lt!201234 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436472 false))

(declare-fun b!436474 () Bool)

(declare-fun res!257303 () Bool)

(assert (=> b!436474 (=> (not res!257303) (not e!257744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436474 (= res!257303 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18798 () Bool)

(declare-fun mapRes!18798 () Bool)

(declare-fun tp!36426 () Bool)

(declare-fun e!257749 () Bool)

(assert (=> mapNonEmpty!18798 (= mapRes!18798 (and tp!36426 e!257749))))

(declare-datatypes ((V!16373 0))(
  ( (V!16374 (val!5770 Int)) )
))
(declare-datatypes ((ValueCell!5382 0))(
  ( (ValueCellFull!5382 (v!8017 V!16373)) (EmptyCell!5382) )
))
(declare-fun mapRest!18798 () (Array (_ BitVec 32) ValueCell!5382))

(declare-datatypes ((array!26729 0))(
  ( (array!26730 (arr!12814 (Array (_ BitVec 32) ValueCell!5382)) (size!13166 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26729)

(declare-fun mapValue!18798 () ValueCell!5382)

(declare-fun mapKey!18798 () (_ BitVec 32))

(assert (=> mapNonEmpty!18798 (= (arr!12814 _values!549) (store mapRest!18798 mapKey!18798 mapValue!18798))))

(declare-fun b!436475 () Bool)

(declare-fun e!257746 () Bool)

(declare-fun e!257748 () Bool)

(assert (=> b!436475 (= e!257746 (and e!257748 mapRes!18798))))

(declare-fun condMapEmpty!18798 () Bool)

(declare-fun mapDefault!18798 () ValueCell!5382)

(assert (=> b!436475 (= condMapEmpty!18798 (= (arr!12814 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5382)) mapDefault!18798)))))

(declare-fun b!436476 () Bool)

(declare-fun Unit!12985 () Unit!12982)

(assert (=> b!436476 (= e!257747 Unit!12985)))

(declare-fun b!436477 () Bool)

(declare-fun res!257299 () Bool)

(assert (=> b!436477 (=> (not res!257299) (not e!257745))))

(declare-datatypes ((List!7645 0))(
  ( (Nil!7642) (Cons!7641 (h!8497 (_ BitVec 64)) (t!13393 List!7645)) )
))
(declare-fun arrayNoDuplicates!0 (array!26727 (_ BitVec 32) List!7645) Bool)

(assert (=> b!436477 (= res!257299 (arrayNoDuplicates!0 lt!201239 #b00000000000000000000000000000000 Nil!7642))))

(declare-fun b!436478 () Bool)

(declare-fun res!257301 () Bool)

(assert (=> b!436478 (=> (not res!257301) (not e!257744))))

(assert (=> b!436478 (= res!257301 (or (= (select (arr!12813 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12813 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436479 () Bool)

(declare-fun e!257743 () Bool)

(assert (=> b!436479 (= e!257743 true)))

(declare-datatypes ((tuple2!7646 0))(
  ( (tuple2!7647 (_1!3834 (_ BitVec 64)) (_2!3834 V!16373)) )
))
(declare-datatypes ((List!7646 0))(
  ( (Nil!7643) (Cons!7642 (h!8498 tuple2!7646) (t!13394 List!7646)) )
))
(declare-datatypes ((ListLongMap!6559 0))(
  ( (ListLongMap!6560 (toList!3295 List!7646)) )
))
(declare-fun lt!201244 () ListLongMap!6559)

(declare-fun lt!201237 () ListLongMap!6559)

(declare-fun lt!201236 () tuple2!7646)

(declare-fun lt!201232 () tuple2!7646)

(declare-fun +!1442 (ListLongMap!6559 tuple2!7646) ListLongMap!6559)

(assert (=> b!436479 (= lt!201237 (+!1442 (+!1442 lt!201244 lt!201236) lt!201232))))

(declare-fun lt!201240 () V!16373)

(declare-fun v!412 () V!16373)

(declare-fun lt!201235 () Unit!12982)

(declare-fun addCommutativeForDiffKeys!423 (ListLongMap!6559 (_ BitVec 64) V!16373 (_ BitVec 64) V!16373) Unit!12982)

(assert (=> b!436479 (= lt!201235 (addCommutativeForDiffKeys!423 lt!201244 k0!794 v!412 (select (arr!12813 _keys!709) from!863) lt!201240))))

(declare-fun b!436480 () Bool)

(declare-fun res!257309 () Bool)

(assert (=> b!436480 (=> (not res!257309) (not e!257744))))

(assert (=> b!436480 (= res!257309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18798 () Bool)

(assert (=> mapIsEmpty!18798 mapRes!18798))

(declare-fun b!436481 () Bool)

(declare-fun tp_is_empty!11451 () Bool)

(assert (=> b!436481 (= e!257749 tp_is_empty!11451)))

(declare-fun res!257308 () Bool)

(assert (=> start!40032 (=> (not res!257308) (not e!257744))))

(assert (=> start!40032 (= res!257308 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13165 _keys!709))))))

(assert (=> start!40032 e!257744))

(assert (=> start!40032 tp_is_empty!11451))

(assert (=> start!40032 tp!36425))

(assert (=> start!40032 true))

(declare-fun array_inv!9310 (array!26729) Bool)

(assert (=> start!40032 (and (array_inv!9310 _values!549) e!257746)))

(declare-fun array_inv!9311 (array!26727) Bool)

(assert (=> start!40032 (array_inv!9311 _keys!709)))

(declare-fun b!436473 () Bool)

(declare-fun res!257305 () Bool)

(assert (=> b!436473 (=> (not res!257305) (not e!257745))))

(assert (=> b!436473 (= res!257305 (bvsle from!863 i!563))))

(declare-fun b!436482 () Bool)

(declare-fun res!257304 () Bool)

(assert (=> b!436482 (=> (not res!257304) (not e!257744))))

(assert (=> b!436482 (= res!257304 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13165 _keys!709))))))

(declare-fun b!436483 () Bool)

(declare-fun e!257742 () Bool)

(assert (=> b!436483 (= e!257745 e!257742)))

(declare-fun res!257302 () Bool)

(assert (=> b!436483 (=> (not res!257302) (not e!257742))))

(assert (=> b!436483 (= res!257302 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16373)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16373)

(declare-fun lt!201233 () ListLongMap!6559)

(declare-fun lt!201238 () array!26729)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1485 (array!26727 array!26729 (_ BitVec 32) (_ BitVec 32) V!16373 V!16373 (_ BitVec 32) Int) ListLongMap!6559)

(assert (=> b!436483 (= lt!201233 (getCurrentListMapNoExtraKeys!1485 lt!201239 lt!201238 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436483 (= lt!201238 (array!26730 (store (arr!12814 _values!549) i!563 (ValueCellFull!5382 v!412)) (size!13166 _values!549)))))

(declare-fun lt!201245 () ListLongMap!6559)

(assert (=> b!436483 (= lt!201245 (getCurrentListMapNoExtraKeys!1485 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436484 () Bool)

(declare-fun res!257297 () Bool)

(assert (=> b!436484 (=> (not res!257297) (not e!257744))))

(assert (=> b!436484 (= res!257297 (and (= (size!13166 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13165 _keys!709) (size!13166 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436485 () Bool)

(declare-fun res!257296 () Bool)

(assert (=> b!436485 (=> (not res!257296) (not e!257744))))

(declare-fun arrayContainsKey!0 (array!26727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436485 (= res!257296 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436486 () Bool)

(declare-fun res!257307 () Bool)

(assert (=> b!436486 (=> (not res!257307) (not e!257744))))

(assert (=> b!436486 (= res!257307 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7642))))

(declare-fun b!436487 () Bool)

(assert (=> b!436487 (= e!257748 tp_is_empty!11451)))

(declare-fun b!436488 () Bool)

(declare-fun e!257751 () Bool)

(assert (=> b!436488 (= e!257751 e!257743)))

(declare-fun res!257300 () Bool)

(assert (=> b!436488 (=> res!257300 e!257743)))

(assert (=> b!436488 (= res!257300 (= k0!794 (select (arr!12813 _keys!709) from!863)))))

(assert (=> b!436488 (not (= (select (arr!12813 _keys!709) from!863) k0!794))))

(declare-fun lt!201241 () Unit!12982)

(assert (=> b!436488 (= lt!201241 e!257747)))

(declare-fun c!55784 () Bool)

(assert (=> b!436488 (= c!55784 (= (select (arr!12813 _keys!709) from!863) k0!794))))

(assert (=> b!436488 (= lt!201233 lt!201237)))

(declare-fun lt!201242 () ListLongMap!6559)

(assert (=> b!436488 (= lt!201237 (+!1442 lt!201242 lt!201236))))

(assert (=> b!436488 (= lt!201236 (tuple2!7647 (select (arr!12813 _keys!709) from!863) lt!201240))))

(declare-fun get!6393 (ValueCell!5382 V!16373) V!16373)

(declare-fun dynLambda!846 (Int (_ BitVec 64)) V!16373)

(assert (=> b!436488 (= lt!201240 (get!6393 (select (arr!12814 _values!549) from!863) (dynLambda!846 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436489 () Bool)

(assert (=> b!436489 (= e!257742 (not e!257751))))

(declare-fun res!257310 () Bool)

(assert (=> b!436489 (=> res!257310 e!257751)))

(assert (=> b!436489 (= res!257310 (not (validKeyInArray!0 (select (arr!12813 _keys!709) from!863))))))

(declare-fun lt!201231 () ListLongMap!6559)

(assert (=> b!436489 (= lt!201231 lt!201242)))

(assert (=> b!436489 (= lt!201242 (+!1442 lt!201244 lt!201232))))

(assert (=> b!436489 (= lt!201231 (getCurrentListMapNoExtraKeys!1485 lt!201239 lt!201238 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436489 (= lt!201232 (tuple2!7647 k0!794 v!412))))

(assert (=> b!436489 (= lt!201244 (getCurrentListMapNoExtraKeys!1485 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!201243 () Unit!12982)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!613 (array!26727 array!26729 (_ BitVec 32) (_ BitVec 32) V!16373 V!16373 (_ BitVec 32) (_ BitVec 64) V!16373 (_ BitVec 32) Int) Unit!12982)

(assert (=> b!436489 (= lt!201243 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!613 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40032 res!257308) b!436474))

(assert (= (and b!436474 res!257303) b!436484))

(assert (= (and b!436484 res!257297) b!436480))

(assert (= (and b!436480 res!257309) b!436486))

(assert (= (and b!436486 res!257307) b!436482))

(assert (= (and b!436482 res!257304) b!436471))

(assert (= (and b!436471 res!257306) b!436478))

(assert (= (and b!436478 res!257301) b!436485))

(assert (= (and b!436485 res!257296) b!436470))

(assert (= (and b!436470 res!257298) b!436477))

(assert (= (and b!436477 res!257299) b!436473))

(assert (= (and b!436473 res!257305) b!436483))

(assert (= (and b!436483 res!257302) b!436489))

(assert (= (and b!436489 (not res!257310)) b!436488))

(assert (= (and b!436488 c!55784) b!436472))

(assert (= (and b!436488 (not c!55784)) b!436476))

(assert (= (and b!436488 (not res!257300)) b!436479))

(assert (= (and b!436475 condMapEmpty!18798) mapIsEmpty!18798))

(assert (= (and b!436475 (not condMapEmpty!18798)) mapNonEmpty!18798))

(get-info :version)

(assert (= (and mapNonEmpty!18798 ((_ is ValueCellFull!5382) mapValue!18798)) b!436481))

(assert (= (and b!436475 ((_ is ValueCellFull!5382) mapDefault!18798)) b!436487))

(assert (= start!40032 b!436475))

(declare-fun b_lambda!9387 () Bool)

(assert (=> (not b_lambda!9387) (not b!436488)))

(declare-fun t!13392 () Bool)

(declare-fun tb!3705 () Bool)

(assert (=> (and start!40032 (= defaultEntry!557 defaultEntry!557) t!13392) tb!3705))

(declare-fun result!6937 () Bool)

(assert (=> tb!3705 (= result!6937 tp_is_empty!11451)))

(assert (=> b!436488 t!13392))

(declare-fun b_and!18259 () Bool)

(assert (= b_and!18257 (and (=> t!13392 result!6937) b_and!18259)))

(declare-fun m!424291 () Bool)

(assert (=> b!436483 m!424291))

(declare-fun m!424293 () Bool)

(assert (=> b!436483 m!424293))

(declare-fun m!424295 () Bool)

(assert (=> b!436483 m!424295))

(declare-fun m!424297 () Bool)

(assert (=> b!436478 m!424297))

(declare-fun m!424299 () Bool)

(assert (=> b!436474 m!424299))

(declare-fun m!424301 () Bool)

(assert (=> b!436486 m!424301))

(declare-fun m!424303 () Bool)

(assert (=> b!436470 m!424303))

(declare-fun m!424305 () Bool)

(assert (=> b!436470 m!424305))

(declare-fun m!424307 () Bool)

(assert (=> b!436471 m!424307))

(declare-fun m!424309 () Bool)

(assert (=> b!436489 m!424309))

(declare-fun m!424311 () Bool)

(assert (=> b!436489 m!424311))

(declare-fun m!424313 () Bool)

(assert (=> b!436489 m!424313))

(declare-fun m!424315 () Bool)

(assert (=> b!436489 m!424315))

(declare-fun m!424317 () Bool)

(assert (=> b!436489 m!424317))

(declare-fun m!424319 () Bool)

(assert (=> b!436489 m!424319))

(assert (=> b!436489 m!424313))

(declare-fun m!424321 () Bool)

(assert (=> mapNonEmpty!18798 m!424321))

(declare-fun m!424323 () Bool)

(assert (=> b!436480 m!424323))

(declare-fun m!424325 () Bool)

(assert (=> b!436472 m!424325))

(declare-fun m!424327 () Bool)

(assert (=> b!436477 m!424327))

(assert (=> b!436488 m!424313))

(declare-fun m!424329 () Bool)

(assert (=> b!436488 m!424329))

(declare-fun m!424331 () Bool)

(assert (=> b!436488 m!424331))

(declare-fun m!424333 () Bool)

(assert (=> b!436488 m!424333))

(assert (=> b!436488 m!424331))

(assert (=> b!436488 m!424329))

(declare-fun m!424335 () Bool)

(assert (=> b!436488 m!424335))

(declare-fun m!424337 () Bool)

(assert (=> b!436485 m!424337))

(declare-fun m!424339 () Bool)

(assert (=> b!436479 m!424339))

(assert (=> b!436479 m!424339))

(declare-fun m!424341 () Bool)

(assert (=> b!436479 m!424341))

(assert (=> b!436479 m!424313))

(assert (=> b!436479 m!424313))

(declare-fun m!424343 () Bool)

(assert (=> b!436479 m!424343))

(declare-fun m!424345 () Bool)

(assert (=> start!40032 m!424345))

(declare-fun m!424347 () Bool)

(assert (=> start!40032 m!424347))

(check-sat (not b!436486) (not b!436477) (not b!436470) (not b!436479) tp_is_empty!11451 (not b!436488) (not b_lambda!9387) (not b!436489) (not mapNonEmpty!18798) b_and!18259 (not b!436483) (not b!436472) (not b!436471) (not start!40032) (not b!436480) (not b_next!10299) (not b!436474) (not b!436485))
(check-sat b_and!18259 (not b_next!10299))
