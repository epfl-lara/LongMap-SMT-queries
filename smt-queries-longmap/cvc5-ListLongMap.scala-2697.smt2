; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40000 () Bool)

(assert start!40000)

(declare-fun b_free!10267 () Bool)

(declare-fun b_next!10267 () Bool)

(assert (=> start!40000 (= b_free!10267 (not b_next!10267))))

(declare-fun tp!36330 () Bool)

(declare-fun b_and!18193 () Bool)

(assert (=> start!40000 (= tp!36330 b_and!18193)))

(declare-fun b!435478 () Bool)

(declare-fun res!256582 () Bool)

(declare-fun e!257268 () Bool)

(assert (=> b!435478 (=> (not res!256582) (not e!257268))))

(declare-datatypes ((array!26667 0))(
  ( (array!26668 (arr!12783 (Array (_ BitVec 32) (_ BitVec 64))) (size!13135 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26667)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435478 (= res!256582 (or (= (select (arr!12783 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12783 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435479 () Bool)

(declare-fun res!256583 () Bool)

(assert (=> b!435479 (=> (not res!256583) (not e!257268))))

(assert (=> b!435479 (= res!256583 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13135 _keys!709))))))

(declare-fun b!435480 () Bool)

(declare-fun e!257270 () Bool)

(declare-fun tp_is_empty!11419 () Bool)

(assert (=> b!435480 (= e!257270 tp_is_empty!11419)))

(declare-fun b!435481 () Bool)

(declare-fun e!257267 () Bool)

(assert (=> b!435481 (= e!257267 true)))

(declare-datatypes ((V!16331 0))(
  ( (V!16332 (val!5754 Int)) )
))
(declare-datatypes ((tuple2!7618 0))(
  ( (tuple2!7619 (_1!3820 (_ BitVec 64)) (_2!3820 V!16331)) )
))
(declare-datatypes ((List!7620 0))(
  ( (Nil!7617) (Cons!7616 (h!8472 tuple2!7618) (t!13336 List!7620)) )
))
(declare-datatypes ((ListLongMap!6531 0))(
  ( (ListLongMap!6532 (toList!3281 List!7620)) )
))
(declare-fun lt!200515 () ListLongMap!6531)

(declare-fun lt!200522 () tuple2!7618)

(declare-fun lt!200523 () tuple2!7618)

(declare-fun lt!200521 () ListLongMap!6531)

(declare-fun +!1429 (ListLongMap!6531 tuple2!7618) ListLongMap!6531)

(assert (=> b!435481 (= lt!200515 (+!1429 (+!1429 lt!200521 lt!200523) lt!200522))))

(declare-fun lt!200517 () V!16331)

(declare-datatypes ((Unit!12931 0))(
  ( (Unit!12932) )
))
(declare-fun lt!200513 () Unit!12931)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16331)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!412 (ListLongMap!6531 (_ BitVec 64) V!16331 (_ BitVec 64) V!16331) Unit!12931)

(assert (=> b!435481 (= lt!200513 (addCommutativeForDiffKeys!412 lt!200521 k!794 v!412 (select (arr!12783 _keys!709) from!863) lt!200517))))

(declare-fun b!435482 () Bool)

(declare-fun res!256580 () Bool)

(assert (=> b!435482 (=> (not res!256580) (not e!257268))))

(declare-fun arrayContainsKey!0 (array!26667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435482 (= res!256580 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!435483 () Bool)

(declare-fun e!257262 () Bool)

(assert (=> b!435483 (= e!257262 e!257267)))

(declare-fun res!256586 () Bool)

(assert (=> b!435483 (=> res!256586 e!257267)))

(assert (=> b!435483 (= res!256586 (= k!794 (select (arr!12783 _keys!709) from!863)))))

(assert (=> b!435483 (not (= (select (arr!12783 _keys!709) from!863) k!794))))

(declare-fun lt!200520 () Unit!12931)

(declare-fun e!257271 () Unit!12931)

(assert (=> b!435483 (= lt!200520 e!257271)))

(declare-fun c!55736 () Bool)

(assert (=> b!435483 (= c!55736 (= (select (arr!12783 _keys!709) from!863) k!794))))

(declare-fun lt!200514 () ListLongMap!6531)

(assert (=> b!435483 (= lt!200514 lt!200515)))

(declare-fun lt!200525 () ListLongMap!6531)

(assert (=> b!435483 (= lt!200515 (+!1429 lt!200525 lt!200523))))

(assert (=> b!435483 (= lt!200523 (tuple2!7619 (select (arr!12783 _keys!709) from!863) lt!200517))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5366 0))(
  ( (ValueCellFull!5366 (v!8001 V!16331)) (EmptyCell!5366) )
))
(declare-datatypes ((array!26669 0))(
  ( (array!26670 (arr!12784 (Array (_ BitVec 32) ValueCell!5366)) (size!13136 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26669)

(declare-fun get!6373 (ValueCell!5366 V!16331) V!16331)

(declare-fun dynLambda!836 (Int (_ BitVec 64)) V!16331)

(assert (=> b!435483 (= lt!200517 (get!6373 (select (arr!12784 _values!549) from!863) (dynLambda!836 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435484 () Bool)

(declare-fun res!256581 () Bool)

(declare-fun e!257264 () Bool)

(assert (=> b!435484 (=> (not res!256581) (not e!257264))))

(assert (=> b!435484 (= res!256581 (bvsle from!863 i!563))))

(declare-fun b!435485 () Bool)

(declare-fun Unit!12933 () Unit!12931)

(assert (=> b!435485 (= e!257271 Unit!12933)))

(declare-fun lt!200516 () Unit!12931)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26667 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12931)

(assert (=> b!435485 (= lt!200516 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435485 false))

(declare-fun b!435486 () Bool)

(declare-fun e!257263 () Bool)

(assert (=> b!435486 (= e!257263 (not e!257262))))

(declare-fun res!256584 () Bool)

(assert (=> b!435486 (=> res!256584 e!257262)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435486 (= res!256584 (not (validKeyInArray!0 (select (arr!12783 _keys!709) from!863))))))

(declare-fun lt!200519 () ListLongMap!6531)

(assert (=> b!435486 (= lt!200519 lt!200525)))

(assert (=> b!435486 (= lt!200525 (+!1429 lt!200521 lt!200522))))

(declare-fun minValue!515 () V!16331)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200511 () array!26667)

(declare-fun zeroValue!515 () V!16331)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!200524 () array!26669)

(declare-fun getCurrentListMapNoExtraKeys!1472 (array!26667 array!26669 (_ BitVec 32) (_ BitVec 32) V!16331 V!16331 (_ BitVec 32) Int) ListLongMap!6531)

(assert (=> b!435486 (= lt!200519 (getCurrentListMapNoExtraKeys!1472 lt!200511 lt!200524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435486 (= lt!200522 (tuple2!7619 k!794 v!412))))

(assert (=> b!435486 (= lt!200521 (getCurrentListMapNoExtraKeys!1472 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200512 () Unit!12931)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!601 (array!26667 array!26669 (_ BitVec 32) (_ BitVec 32) V!16331 V!16331 (_ BitVec 32) (_ BitVec 64) V!16331 (_ BitVec 32) Int) Unit!12931)

(assert (=> b!435486 (= lt!200512 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!601 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435487 () Bool)

(declare-fun res!256587 () Bool)

(assert (=> b!435487 (=> (not res!256587) (not e!257268))))

(assert (=> b!435487 (= res!256587 (and (= (size!13136 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13135 _keys!709) (size!13136 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18750 () Bool)

(declare-fun mapRes!18750 () Bool)

(declare-fun tp!36329 () Bool)

(declare-fun e!257266 () Bool)

(assert (=> mapNonEmpty!18750 (= mapRes!18750 (and tp!36329 e!257266))))

(declare-fun mapRest!18750 () (Array (_ BitVec 32) ValueCell!5366))

(declare-fun mapValue!18750 () ValueCell!5366)

(declare-fun mapKey!18750 () (_ BitVec 32))

(assert (=> mapNonEmpty!18750 (= (arr!12784 _values!549) (store mapRest!18750 mapKey!18750 mapValue!18750))))

(declare-fun b!435488 () Bool)

(assert (=> b!435488 (= e!257264 e!257263)))

(declare-fun res!256577 () Bool)

(assert (=> b!435488 (=> (not res!256577) (not e!257263))))

(assert (=> b!435488 (= res!256577 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!435488 (= lt!200514 (getCurrentListMapNoExtraKeys!1472 lt!200511 lt!200524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435488 (= lt!200524 (array!26670 (store (arr!12784 _values!549) i!563 (ValueCellFull!5366 v!412)) (size!13136 _values!549)))))

(declare-fun lt!200518 () ListLongMap!6531)

(assert (=> b!435488 (= lt!200518 (getCurrentListMapNoExtraKeys!1472 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435489 () Bool)

(declare-fun res!256589 () Bool)

(assert (=> b!435489 (=> (not res!256589) (not e!257268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435489 (= res!256589 (validMask!0 mask!1025))))

(declare-fun b!435491 () Bool)

(declare-fun res!256590 () Bool)

(assert (=> b!435491 (=> (not res!256590) (not e!257268))))

(declare-datatypes ((List!7621 0))(
  ( (Nil!7618) (Cons!7617 (h!8473 (_ BitVec 64)) (t!13337 List!7621)) )
))
(declare-fun arrayNoDuplicates!0 (array!26667 (_ BitVec 32) List!7621) Bool)

(assert (=> b!435491 (= res!256590 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7618))))

(declare-fun b!435492 () Bool)

(assert (=> b!435492 (= e!257266 tp_is_empty!11419)))

(declare-fun b!435493 () Bool)

(declare-fun Unit!12934 () Unit!12931)

(assert (=> b!435493 (= e!257271 Unit!12934)))

(declare-fun b!435494 () Bool)

(declare-fun res!256579 () Bool)

(assert (=> b!435494 (=> (not res!256579) (not e!257264))))

(assert (=> b!435494 (= res!256579 (arrayNoDuplicates!0 lt!200511 #b00000000000000000000000000000000 Nil!7618))))

(declare-fun b!435495 () Bool)

(declare-fun res!256578 () Bool)

(assert (=> b!435495 (=> (not res!256578) (not e!257268))))

(assert (=> b!435495 (= res!256578 (validKeyInArray!0 k!794))))

(declare-fun b!435496 () Bool)

(assert (=> b!435496 (= e!257268 e!257264)))

(declare-fun res!256588 () Bool)

(assert (=> b!435496 (=> (not res!256588) (not e!257264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26667 (_ BitVec 32)) Bool)

(assert (=> b!435496 (= res!256588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200511 mask!1025))))

(assert (=> b!435496 (= lt!200511 (array!26668 (store (arr!12783 _keys!709) i!563 k!794) (size!13135 _keys!709)))))

(declare-fun mapIsEmpty!18750 () Bool)

(assert (=> mapIsEmpty!18750 mapRes!18750))

(declare-fun b!435497 () Bool)

(declare-fun e!257265 () Bool)

(assert (=> b!435497 (= e!257265 (and e!257270 mapRes!18750))))

(declare-fun condMapEmpty!18750 () Bool)

(declare-fun mapDefault!18750 () ValueCell!5366)

