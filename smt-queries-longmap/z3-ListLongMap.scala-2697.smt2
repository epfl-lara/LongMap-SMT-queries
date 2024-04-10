; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40002 () Bool)

(assert start!40002)

(declare-fun b_free!10269 () Bool)

(declare-fun b_next!10269 () Bool)

(assert (=> start!40002 (= b_free!10269 (not b_next!10269))))

(declare-fun tp!36335 () Bool)

(declare-fun b_and!18197 () Bool)

(assert (=> start!40002 (= tp!36335 b_and!18197)))

(declare-fun b!435540 () Bool)

(declare-fun e!257299 () Bool)

(declare-fun e!257295 () Bool)

(assert (=> b!435540 (= e!257299 (not e!257295))))

(declare-fun res!256621 () Bool)

(assert (=> b!435540 (=> res!256621 e!257295)))

(declare-datatypes ((array!26671 0))(
  ( (array!26672 (arr!12785 (Array (_ BitVec 32) (_ BitVec 64))) (size!13137 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26671)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435540 (= res!256621 (not (validKeyInArray!0 (select (arr!12785 _keys!709) from!863))))))

(declare-datatypes ((V!16333 0))(
  ( (V!16334 (val!5755 Int)) )
))
(declare-datatypes ((tuple2!7620 0))(
  ( (tuple2!7621 (_1!3821 (_ BitVec 64)) (_2!3821 V!16333)) )
))
(declare-datatypes ((List!7622 0))(
  ( (Nil!7619) (Cons!7618 (h!8474 tuple2!7620) (t!13340 List!7622)) )
))
(declare-datatypes ((ListLongMap!6533 0))(
  ( (ListLongMap!6534 (toList!3282 List!7622)) )
))
(declare-fun lt!200559 () ListLongMap!6533)

(declare-fun lt!200562 () ListLongMap!6533)

(assert (=> b!435540 (= lt!200559 lt!200562)))

(declare-fun lt!200566 () ListLongMap!6533)

(declare-fun lt!200570 () tuple2!7620)

(declare-fun +!1430 (ListLongMap!6533 tuple2!7620) ListLongMap!6533)

(assert (=> b!435540 (= lt!200562 (+!1430 lt!200566 lt!200570))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16333)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!200560 () array!26671)

(declare-datatypes ((ValueCell!5367 0))(
  ( (ValueCellFull!5367 (v!8002 V!16333)) (EmptyCell!5367) )
))
(declare-datatypes ((array!26673 0))(
  ( (array!26674 (arr!12786 (Array (_ BitVec 32) ValueCell!5367)) (size!13138 (_ BitVec 32))) )
))
(declare-fun lt!200564 () array!26673)

(declare-fun minValue!515 () V!16333)

(declare-fun getCurrentListMapNoExtraKeys!1473 (array!26671 array!26673 (_ BitVec 32) (_ BitVec 32) V!16333 V!16333 (_ BitVec 32) Int) ListLongMap!6533)

(assert (=> b!435540 (= lt!200559 (getCurrentListMapNoExtraKeys!1473 lt!200560 lt!200564 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16333)

(assert (=> b!435540 (= lt!200570 (tuple2!7621 k0!794 v!412))))

(declare-fun _values!549 () array!26673)

(assert (=> b!435540 (= lt!200566 (getCurrentListMapNoExtraKeys!1473 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12935 0))(
  ( (Unit!12936) )
))
(declare-fun lt!200565 () Unit!12935)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!602 (array!26671 array!26673 (_ BitVec 32) (_ BitVec 32) V!16333 V!16333 (_ BitVec 32) (_ BitVec 64) V!16333 (_ BitVec 32) Int) Unit!12935)

(assert (=> b!435540 (= lt!200565 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!602 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435541 () Bool)

(declare-fun e!257294 () Bool)

(assert (=> b!435541 (= e!257295 e!257294)))

(declare-fun res!256633 () Bool)

(assert (=> b!435541 (=> res!256633 e!257294)))

(assert (=> b!435541 (= res!256633 (= k0!794 (select (arr!12785 _keys!709) from!863)))))

(assert (=> b!435541 (not (= (select (arr!12785 _keys!709) from!863) k0!794))))

(declare-fun lt!200556 () Unit!12935)

(declare-fun e!257297 () Unit!12935)

(assert (=> b!435541 (= lt!200556 e!257297)))

(declare-fun c!55739 () Bool)

(assert (=> b!435541 (= c!55739 (= (select (arr!12785 _keys!709) from!863) k0!794))))

(declare-fun lt!200557 () ListLongMap!6533)

(declare-fun lt!200568 () ListLongMap!6533)

(assert (=> b!435541 (= lt!200557 lt!200568)))

(declare-fun lt!200569 () tuple2!7620)

(assert (=> b!435541 (= lt!200568 (+!1430 lt!200562 lt!200569))))

(declare-fun lt!200567 () V!16333)

(assert (=> b!435541 (= lt!200569 (tuple2!7621 (select (arr!12785 _keys!709) from!863) lt!200567))))

(declare-fun get!6374 (ValueCell!5367 V!16333) V!16333)

(declare-fun dynLambda!837 (Int (_ BitVec 64)) V!16333)

(assert (=> b!435541 (= lt!200567 (get!6374 (select (arr!12786 _values!549) from!863) (dynLambda!837 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435542 () Bool)

(declare-fun res!256631 () Bool)

(declare-fun e!257298 () Bool)

(assert (=> b!435542 (=> (not res!256631) (not e!257298))))

(assert (=> b!435542 (= res!256631 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13137 _keys!709))))))

(declare-fun res!256634 () Bool)

(assert (=> start!40002 (=> (not res!256634) (not e!257298))))

(assert (=> start!40002 (= res!256634 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13137 _keys!709))))))

(assert (=> start!40002 e!257298))

(declare-fun tp_is_empty!11421 () Bool)

(assert (=> start!40002 tp_is_empty!11421))

(assert (=> start!40002 tp!36335))

(assert (=> start!40002 true))

(declare-fun e!257293 () Bool)

(declare-fun array_inv!9294 (array!26673) Bool)

(assert (=> start!40002 (and (array_inv!9294 _values!549) e!257293)))

(declare-fun array_inv!9295 (array!26671) Bool)

(assert (=> start!40002 (array_inv!9295 _keys!709)))

(declare-fun b!435543 () Bool)

(declare-fun Unit!12937 () Unit!12935)

(assert (=> b!435543 (= e!257297 Unit!12937)))

(declare-fun lt!200563 () Unit!12935)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26671 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12935)

(assert (=> b!435543 (= lt!200563 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435543 false))

(declare-fun b!435544 () Bool)

(declare-fun res!256628 () Bool)

(assert (=> b!435544 (=> (not res!256628) (not e!257298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435544 (= res!256628 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18753 () Bool)

(declare-fun mapRes!18753 () Bool)

(assert (=> mapIsEmpty!18753 mapRes!18753))

(declare-fun b!435545 () Bool)

(declare-fun res!256635 () Bool)

(declare-fun e!257292 () Bool)

(assert (=> b!435545 (=> (not res!256635) (not e!257292))))

(declare-datatypes ((List!7623 0))(
  ( (Nil!7620) (Cons!7619 (h!8475 (_ BitVec 64)) (t!13341 List!7623)) )
))
(declare-fun arrayNoDuplicates!0 (array!26671 (_ BitVec 32) List!7623) Bool)

(assert (=> b!435545 (= res!256635 (arrayNoDuplicates!0 lt!200560 #b00000000000000000000000000000000 Nil!7620))))

(declare-fun b!435546 () Bool)

(assert (=> b!435546 (= e!257294 true)))

(assert (=> b!435546 (= lt!200568 (+!1430 (+!1430 lt!200566 lt!200569) lt!200570))))

(declare-fun lt!200561 () Unit!12935)

(declare-fun addCommutativeForDiffKeys!413 (ListLongMap!6533 (_ BitVec 64) V!16333 (_ BitVec 64) V!16333) Unit!12935)

(assert (=> b!435546 (= lt!200561 (addCommutativeForDiffKeys!413 lt!200566 k0!794 v!412 (select (arr!12785 _keys!709) from!863) lt!200567))))

(declare-fun b!435547 () Bool)

(declare-fun res!256624 () Bool)

(assert (=> b!435547 (=> (not res!256624) (not e!257298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26671 (_ BitVec 32)) Bool)

(assert (=> b!435547 (= res!256624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435548 () Bool)

(declare-fun res!256622 () Bool)

(assert (=> b!435548 (=> (not res!256622) (not e!257298))))

(assert (=> b!435548 (= res!256622 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7620))))

(declare-fun mapNonEmpty!18753 () Bool)

(declare-fun tp!36336 () Bool)

(declare-fun e!257301 () Bool)

(assert (=> mapNonEmpty!18753 (= mapRes!18753 (and tp!36336 e!257301))))

(declare-fun mapValue!18753 () ValueCell!5367)

(declare-fun mapRest!18753 () (Array (_ BitVec 32) ValueCell!5367))

(declare-fun mapKey!18753 () (_ BitVec 32))

(assert (=> mapNonEmpty!18753 (= (arr!12786 _values!549) (store mapRest!18753 mapKey!18753 mapValue!18753))))

(declare-fun b!435549 () Bool)

(declare-fun res!256626 () Bool)

(assert (=> b!435549 (=> (not res!256626) (not e!257298))))

(assert (=> b!435549 (= res!256626 (or (= (select (arr!12785 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12785 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435550 () Bool)

(declare-fun res!256625 () Bool)

(assert (=> b!435550 (=> (not res!256625) (not e!257298))))

(assert (=> b!435550 (= res!256625 (and (= (size!13138 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13137 _keys!709) (size!13138 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435551 () Bool)

(declare-fun Unit!12938 () Unit!12935)

(assert (=> b!435551 (= e!257297 Unit!12938)))

(declare-fun b!435552 () Bool)

(assert (=> b!435552 (= e!257301 tp_is_empty!11421)))

(declare-fun b!435553 () Bool)

(assert (=> b!435553 (= e!257298 e!257292)))

(declare-fun res!256627 () Bool)

(assert (=> b!435553 (=> (not res!256627) (not e!257292))))

(assert (=> b!435553 (= res!256627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200560 mask!1025))))

(assert (=> b!435553 (= lt!200560 (array!26672 (store (arr!12785 _keys!709) i!563 k0!794) (size!13137 _keys!709)))))

(declare-fun b!435554 () Bool)

(declare-fun e!257296 () Bool)

(assert (=> b!435554 (= e!257293 (and e!257296 mapRes!18753))))

(declare-fun condMapEmpty!18753 () Bool)

(declare-fun mapDefault!18753 () ValueCell!5367)

(assert (=> b!435554 (= condMapEmpty!18753 (= (arr!12786 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5367)) mapDefault!18753)))))

(declare-fun b!435555 () Bool)

(assert (=> b!435555 (= e!257292 e!257299)))

(declare-fun res!256623 () Bool)

(assert (=> b!435555 (=> (not res!256623) (not e!257299))))

(assert (=> b!435555 (= res!256623 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!435555 (= lt!200557 (getCurrentListMapNoExtraKeys!1473 lt!200560 lt!200564 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435555 (= lt!200564 (array!26674 (store (arr!12786 _values!549) i!563 (ValueCellFull!5367 v!412)) (size!13138 _values!549)))))

(declare-fun lt!200558 () ListLongMap!6533)

(assert (=> b!435555 (= lt!200558 (getCurrentListMapNoExtraKeys!1473 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435556 () Bool)

(assert (=> b!435556 (= e!257296 tp_is_empty!11421)))

(declare-fun b!435557 () Bool)

(declare-fun res!256629 () Bool)

(assert (=> b!435557 (=> (not res!256629) (not e!257298))))

(declare-fun arrayContainsKey!0 (array!26671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435557 (= res!256629 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435558 () Bool)

(declare-fun res!256630 () Bool)

(assert (=> b!435558 (=> (not res!256630) (not e!257298))))

(assert (=> b!435558 (= res!256630 (validKeyInArray!0 k0!794))))

(declare-fun b!435559 () Bool)

(declare-fun res!256632 () Bool)

(assert (=> b!435559 (=> (not res!256632) (not e!257292))))

(assert (=> b!435559 (= res!256632 (bvsle from!863 i!563))))

(assert (= (and start!40002 res!256634) b!435544))

(assert (= (and b!435544 res!256628) b!435550))

(assert (= (and b!435550 res!256625) b!435547))

(assert (= (and b!435547 res!256624) b!435548))

(assert (= (and b!435548 res!256622) b!435542))

(assert (= (and b!435542 res!256631) b!435558))

(assert (= (and b!435558 res!256630) b!435549))

(assert (= (and b!435549 res!256626) b!435557))

(assert (= (and b!435557 res!256629) b!435553))

(assert (= (and b!435553 res!256627) b!435545))

(assert (= (and b!435545 res!256635) b!435559))

(assert (= (and b!435559 res!256632) b!435555))

(assert (= (and b!435555 res!256623) b!435540))

(assert (= (and b!435540 (not res!256621)) b!435541))

(assert (= (and b!435541 c!55739) b!435543))

(assert (= (and b!435541 (not c!55739)) b!435551))

(assert (= (and b!435541 (not res!256633)) b!435546))

(assert (= (and b!435554 condMapEmpty!18753) mapIsEmpty!18753))

(assert (= (and b!435554 (not condMapEmpty!18753)) mapNonEmpty!18753))

(get-info :version)

(assert (= (and mapNonEmpty!18753 ((_ is ValueCellFull!5367) mapValue!18753)) b!435552))

(assert (= (and b!435554 ((_ is ValueCellFull!5367) mapDefault!18753)) b!435556))

(assert (= start!40002 b!435554))

(declare-fun b_lambda!9357 () Bool)

(assert (=> (not b_lambda!9357) (not b!435541)))

(declare-fun t!13339 () Bool)

(declare-fun tb!3675 () Bool)

(assert (=> (and start!40002 (= defaultEntry!557 defaultEntry!557) t!13339) tb!3675))

(declare-fun result!6877 () Bool)

(assert (=> tb!3675 (= result!6877 tp_is_empty!11421)))

(assert (=> b!435541 t!13339))

(declare-fun b_and!18199 () Bool)

(assert (= b_and!18197 (and (=> t!13339 result!6877) b_and!18199)))

(declare-fun m!423421 () Bool)

(assert (=> b!435553 m!423421))

(declare-fun m!423423 () Bool)

(assert (=> b!435553 m!423423))

(declare-fun m!423425 () Bool)

(assert (=> b!435555 m!423425))

(declare-fun m!423427 () Bool)

(assert (=> b!435555 m!423427))

(declare-fun m!423429 () Bool)

(assert (=> b!435555 m!423429))

(declare-fun m!423431 () Bool)

(assert (=> b!435547 m!423431))

(declare-fun m!423433 () Bool)

(assert (=> b!435541 m!423433))

(declare-fun m!423435 () Bool)

(assert (=> b!435541 m!423435))

(declare-fun m!423437 () Bool)

(assert (=> b!435541 m!423437))

(declare-fun m!423439 () Bool)

(assert (=> b!435541 m!423439))

(assert (=> b!435541 m!423437))

(assert (=> b!435541 m!423435))

(declare-fun m!423441 () Bool)

(assert (=> b!435541 m!423441))

(declare-fun m!423443 () Bool)

(assert (=> b!435543 m!423443))

(declare-fun m!423445 () Bool)

(assert (=> start!40002 m!423445))

(declare-fun m!423447 () Bool)

(assert (=> start!40002 m!423447))

(declare-fun m!423449 () Bool)

(assert (=> b!435545 m!423449))

(assert (=> b!435540 m!423433))

(declare-fun m!423451 () Bool)

(assert (=> b!435540 m!423451))

(assert (=> b!435540 m!423433))

(declare-fun m!423453 () Bool)

(assert (=> b!435540 m!423453))

(declare-fun m!423455 () Bool)

(assert (=> b!435540 m!423455))

(declare-fun m!423457 () Bool)

(assert (=> b!435540 m!423457))

(declare-fun m!423459 () Bool)

(assert (=> b!435540 m!423459))

(declare-fun m!423461 () Bool)

(assert (=> b!435546 m!423461))

(assert (=> b!435546 m!423461))

(declare-fun m!423463 () Bool)

(assert (=> b!435546 m!423463))

(assert (=> b!435546 m!423433))

(assert (=> b!435546 m!423433))

(declare-fun m!423465 () Bool)

(assert (=> b!435546 m!423465))

(declare-fun m!423467 () Bool)

(assert (=> b!435544 m!423467))

(declare-fun m!423469 () Bool)

(assert (=> mapNonEmpty!18753 m!423469))

(declare-fun m!423471 () Bool)

(assert (=> b!435558 m!423471))

(declare-fun m!423473 () Bool)

(assert (=> b!435549 m!423473))

(declare-fun m!423475 () Bool)

(assert (=> b!435548 m!423475))

(declare-fun m!423477 () Bool)

(assert (=> b!435557 m!423477))

(check-sat (not b!435555) tp_is_empty!11421 (not b!435546) (not b!435543) (not b!435540) (not b!435557) (not start!40002) (not b!435544) (not b!435558) (not b_lambda!9357) (not b!435548) (not mapNonEmpty!18753) (not b!435541) (not b_next!10269) (not b!435547) (not b!435553) b_and!18199 (not b!435545))
(check-sat b_and!18199 (not b_next!10269))
