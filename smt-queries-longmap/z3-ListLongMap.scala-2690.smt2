; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39944 () Bool)

(assert start!39944)

(declare-fun b_free!10225 () Bool)

(declare-fun b_next!10225 () Bool)

(assert (=> start!39944 (= b_free!10225 (not b_next!10225))))

(declare-fun tp!36204 () Bool)

(declare-fun b_and!18123 () Bool)

(assert (=> start!39944 (= tp!36204 b_and!18123)))

(declare-fun b!434127 () Bool)

(declare-datatypes ((Unit!12869 0))(
  ( (Unit!12870) )
))
(declare-fun e!256600 () Unit!12869)

(declare-fun Unit!12871 () Unit!12869)

(assert (=> b!434127 (= e!256600 Unit!12871)))

(declare-fun b!434128 () Bool)

(declare-fun res!255637 () Bool)

(declare-fun e!256602 () Bool)

(assert (=> b!434128 (=> (not res!255637) (not e!256602))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26590 0))(
  ( (array!26591 (arr!12744 (Array (_ BitVec 32) (_ BitVec 64))) (size!13096 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26590)

(assert (=> b!434128 (= res!255637 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13096 _keys!709))))))

(declare-fun b!434129 () Bool)

(declare-fun e!256609 () Bool)

(assert (=> b!434129 (= e!256602 e!256609)))

(declare-fun res!255638 () Bool)

(assert (=> b!434129 (=> (not res!255638) (not e!256609))))

(declare-fun lt!199585 () array!26590)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26590 (_ BitVec 32)) Bool)

(assert (=> b!434129 (= res!255638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199585 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!434129 (= lt!199585 (array!26591 (store (arr!12744 _keys!709) i!563 k0!794) (size!13096 _keys!709)))))

(declare-fun b!434130 () Bool)

(declare-fun res!255628 () Bool)

(assert (=> b!434130 (=> (not res!255628) (not e!256602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434130 (= res!255628 (validMask!0 mask!1025))))

(declare-fun res!255642 () Bool)

(assert (=> start!39944 (=> (not res!255642) (not e!256602))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39944 (= res!255642 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13096 _keys!709))))))

(assert (=> start!39944 e!256602))

(declare-fun tp_is_empty!11377 () Bool)

(assert (=> start!39944 tp_is_empty!11377))

(assert (=> start!39944 tp!36204))

(assert (=> start!39944 true))

(declare-datatypes ((V!16275 0))(
  ( (V!16276 (val!5733 Int)) )
))
(declare-datatypes ((ValueCell!5345 0))(
  ( (ValueCellFull!5345 (v!7981 V!16275)) (EmptyCell!5345) )
))
(declare-datatypes ((array!26592 0))(
  ( (array!26593 (arr!12745 (Array (_ BitVec 32) ValueCell!5345)) (size!13097 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26592)

(declare-fun e!256604 () Bool)

(declare-fun array_inv!9324 (array!26592) Bool)

(assert (=> start!39944 (and (array_inv!9324 _values!549) e!256604)))

(declare-fun array_inv!9325 (array!26590) Bool)

(assert (=> start!39944 (array_inv!9325 _keys!709)))

(declare-fun b!434131 () Bool)

(declare-fun e!256608 () Bool)

(declare-fun mapRes!18687 () Bool)

(assert (=> b!434131 (= e!256604 (and e!256608 mapRes!18687))))

(declare-fun condMapEmpty!18687 () Bool)

(declare-fun mapDefault!18687 () ValueCell!5345)

(assert (=> b!434131 (= condMapEmpty!18687 (= (arr!12745 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5345)) mapDefault!18687)))))

(declare-fun b!434132 () Bool)

(declare-fun Unit!12872 () Unit!12869)

(assert (=> b!434132 (= e!256600 Unit!12872)))

(declare-fun lt!199595 () Unit!12869)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26590 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12869)

(assert (=> b!434132 (= lt!199595 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434132 false))

(declare-fun b!434133 () Bool)

(declare-fun e!256601 () Bool)

(assert (=> b!434133 (= e!256601 true)))

(declare-datatypes ((tuple2!7488 0))(
  ( (tuple2!7489 (_1!3755 (_ BitVec 64)) (_2!3755 V!16275)) )
))
(declare-fun lt!199592 () tuple2!7488)

(declare-fun lt!199599 () tuple2!7488)

(declare-datatypes ((List!7478 0))(
  ( (Nil!7475) (Cons!7474 (h!8330 tuple2!7488) (t!13144 List!7478)) )
))
(declare-datatypes ((ListLongMap!6403 0))(
  ( (ListLongMap!6404 (toList!3217 List!7478)) )
))
(declare-fun lt!199587 () ListLongMap!6403)

(declare-fun lt!199588 () ListLongMap!6403)

(declare-fun +!1423 (ListLongMap!6403 tuple2!7488) ListLongMap!6403)

(assert (=> b!434133 (= lt!199588 (+!1423 (+!1423 lt!199587 lt!199592) lt!199599))))

(declare-fun lt!199597 () V!16275)

(declare-fun lt!199590 () Unit!12869)

(declare-fun v!412 () V!16275)

(declare-fun addCommutativeForDiffKeys!395 (ListLongMap!6403 (_ BitVec 64) V!16275 (_ BitVec 64) V!16275) Unit!12869)

(assert (=> b!434133 (= lt!199590 (addCommutativeForDiffKeys!395 lt!199587 k0!794 v!412 (select (arr!12744 _keys!709) from!863) lt!199597))))

(declare-fun b!434134 () Bool)

(declare-fun e!256605 () Bool)

(assert (=> b!434134 (= e!256605 tp_is_empty!11377)))

(declare-fun mapIsEmpty!18687 () Bool)

(assert (=> mapIsEmpty!18687 mapRes!18687))

(declare-fun b!434135 () Bool)

(declare-fun res!255636 () Bool)

(assert (=> b!434135 (=> (not res!255636) (not e!256602))))

(assert (=> b!434135 (= res!255636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434136 () Bool)

(assert (=> b!434136 (= e!256608 tp_is_empty!11377)))

(declare-fun b!434137 () Bool)

(declare-fun res!255631 () Bool)

(assert (=> b!434137 (=> (not res!255631) (not e!256602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434137 (= res!255631 (validKeyInArray!0 k0!794))))

(declare-fun b!434138 () Bool)

(declare-fun res!255635 () Bool)

(assert (=> b!434138 (=> (not res!255635) (not e!256602))))

(declare-datatypes ((List!7479 0))(
  ( (Nil!7476) (Cons!7475 (h!8331 (_ BitVec 64)) (t!13145 List!7479)) )
))
(declare-fun arrayNoDuplicates!0 (array!26590 (_ BitVec 32) List!7479) Bool)

(assert (=> b!434138 (= res!255635 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7476))))

(declare-fun b!434139 () Bool)

(declare-fun res!255634 () Bool)

(assert (=> b!434139 (=> (not res!255634) (not e!256609))))

(assert (=> b!434139 (= res!255634 (arrayNoDuplicates!0 lt!199585 #b00000000000000000000000000000000 Nil!7476))))

(declare-fun b!434140 () Bool)

(declare-fun res!255629 () Bool)

(assert (=> b!434140 (=> (not res!255629) (not e!256602))))

(assert (=> b!434140 (= res!255629 (or (= (select (arr!12744 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12744 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434141 () Bool)

(declare-fun e!256606 () Bool)

(declare-fun e!256607 () Bool)

(assert (=> b!434141 (= e!256606 (not e!256607))))

(declare-fun res!255632 () Bool)

(assert (=> b!434141 (=> res!255632 e!256607)))

(assert (=> b!434141 (= res!255632 (not (validKeyInArray!0 (select (arr!12744 _keys!709) from!863))))))

(declare-fun lt!199593 () ListLongMap!6403)

(declare-fun lt!199591 () ListLongMap!6403)

(assert (=> b!434141 (= lt!199593 lt!199591)))

(assert (=> b!434141 (= lt!199591 (+!1423 lt!199587 lt!199599))))

(declare-fun minValue!515 () V!16275)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!199589 () array!26592)

(declare-fun zeroValue!515 () V!16275)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1453 (array!26590 array!26592 (_ BitVec 32) (_ BitVec 32) V!16275 V!16275 (_ BitVec 32) Int) ListLongMap!6403)

(assert (=> b!434141 (= lt!199593 (getCurrentListMapNoExtraKeys!1453 lt!199585 lt!199589 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434141 (= lt!199599 (tuple2!7489 k0!794 v!412))))

(assert (=> b!434141 (= lt!199587 (getCurrentListMapNoExtraKeys!1453 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199596 () Unit!12869)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!589 (array!26590 array!26592 (_ BitVec 32) (_ BitVec 32) V!16275 V!16275 (_ BitVec 32) (_ BitVec 64) V!16275 (_ BitVec 32) Int) Unit!12869)

(assert (=> b!434141 (= lt!199596 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!589 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18687 () Bool)

(declare-fun tp!36203 () Bool)

(assert (=> mapNonEmpty!18687 (= mapRes!18687 (and tp!36203 e!256605))))

(declare-fun mapRest!18687 () (Array (_ BitVec 32) ValueCell!5345))

(declare-fun mapValue!18687 () ValueCell!5345)

(declare-fun mapKey!18687 () (_ BitVec 32))

(assert (=> mapNonEmpty!18687 (= (arr!12745 _values!549) (store mapRest!18687 mapKey!18687 mapValue!18687))))

(declare-fun b!434142 () Bool)

(assert (=> b!434142 (= e!256609 e!256606)))

(declare-fun res!255640 () Bool)

(assert (=> b!434142 (=> (not res!255640) (not e!256606))))

(assert (=> b!434142 (= res!255640 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!199586 () ListLongMap!6403)

(assert (=> b!434142 (= lt!199586 (getCurrentListMapNoExtraKeys!1453 lt!199585 lt!199589 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434142 (= lt!199589 (array!26593 (store (arr!12745 _values!549) i!563 (ValueCellFull!5345 v!412)) (size!13097 _values!549)))))

(declare-fun lt!199598 () ListLongMap!6403)

(assert (=> b!434142 (= lt!199598 (getCurrentListMapNoExtraKeys!1453 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434143 () Bool)

(declare-fun res!255641 () Bool)

(assert (=> b!434143 (=> (not res!255641) (not e!256602))))

(assert (=> b!434143 (= res!255641 (and (= (size!13097 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13096 _keys!709) (size!13097 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434144 () Bool)

(declare-fun res!255630 () Bool)

(assert (=> b!434144 (=> (not res!255630) (not e!256602))))

(declare-fun arrayContainsKey!0 (array!26590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434144 (= res!255630 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434145 () Bool)

(assert (=> b!434145 (= e!256607 e!256601)))

(declare-fun res!255633 () Bool)

(assert (=> b!434145 (=> res!255633 e!256601)))

(assert (=> b!434145 (= res!255633 (= k0!794 (select (arr!12744 _keys!709) from!863)))))

(assert (=> b!434145 (not (= (select (arr!12744 _keys!709) from!863) k0!794))))

(declare-fun lt!199594 () Unit!12869)

(assert (=> b!434145 (= lt!199594 e!256600)))

(declare-fun c!55650 () Bool)

(assert (=> b!434145 (= c!55650 (= (select (arr!12744 _keys!709) from!863) k0!794))))

(assert (=> b!434145 (= lt!199586 lt!199588)))

(assert (=> b!434145 (= lt!199588 (+!1423 lt!199591 lt!199592))))

(assert (=> b!434145 (= lt!199592 (tuple2!7489 (select (arr!12744 _keys!709) from!863) lt!199597))))

(declare-fun get!6356 (ValueCell!5345 V!16275) V!16275)

(declare-fun dynLambda!827 (Int (_ BitVec 64)) V!16275)

(assert (=> b!434145 (= lt!199597 (get!6356 (select (arr!12745 _values!549) from!863) (dynLambda!827 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434146 () Bool)

(declare-fun res!255639 () Bool)

(assert (=> b!434146 (=> (not res!255639) (not e!256609))))

(assert (=> b!434146 (= res!255639 (bvsle from!863 i!563))))

(assert (= (and start!39944 res!255642) b!434130))

(assert (= (and b!434130 res!255628) b!434143))

(assert (= (and b!434143 res!255641) b!434135))

(assert (= (and b!434135 res!255636) b!434138))

(assert (= (and b!434138 res!255635) b!434128))

(assert (= (and b!434128 res!255637) b!434137))

(assert (= (and b!434137 res!255631) b!434140))

(assert (= (and b!434140 res!255629) b!434144))

(assert (= (and b!434144 res!255630) b!434129))

(assert (= (and b!434129 res!255638) b!434139))

(assert (= (and b!434139 res!255634) b!434146))

(assert (= (and b!434146 res!255639) b!434142))

(assert (= (and b!434142 res!255640) b!434141))

(assert (= (and b!434141 (not res!255632)) b!434145))

(assert (= (and b!434145 c!55650) b!434132))

(assert (= (and b!434145 (not c!55650)) b!434127))

(assert (= (and b!434145 (not res!255633)) b!434133))

(assert (= (and b!434131 condMapEmpty!18687) mapIsEmpty!18687))

(assert (= (and b!434131 (not condMapEmpty!18687)) mapNonEmpty!18687))

(get-info :version)

(assert (= (and mapNonEmpty!18687 ((_ is ValueCellFull!5345) mapValue!18687)) b!434134))

(assert (= (and b!434131 ((_ is ValueCellFull!5345) mapDefault!18687)) b!434136))

(assert (= start!39944 b!434131))

(declare-fun b_lambda!9335 () Bool)

(assert (=> (not b_lambda!9335) (not b!434145)))

(declare-fun t!13143 () Bool)

(declare-fun tb!3623 () Bool)

(assert (=> (and start!39944 (= defaultEntry!557 defaultEntry!557) t!13143) tb!3623))

(declare-fun result!6781 () Bool)

(assert (=> tb!3623 (= result!6781 tp_is_empty!11377)))

(assert (=> b!434145 t!13143))

(declare-fun b_and!18125 () Bool)

(assert (= b_and!18123 (and (=> t!13143 result!6781) b_and!18125)))

(declare-fun m!422363 () Bool)

(assert (=> b!434145 m!422363))

(declare-fun m!422365 () Bool)

(assert (=> b!434145 m!422365))

(declare-fun m!422367 () Bool)

(assert (=> b!434145 m!422367))

(declare-fun m!422369 () Bool)

(assert (=> b!434145 m!422369))

(assert (=> b!434145 m!422367))

(assert (=> b!434145 m!422365))

(declare-fun m!422371 () Bool)

(assert (=> b!434145 m!422371))

(declare-fun m!422373 () Bool)

(assert (=> b!434140 m!422373))

(declare-fun m!422375 () Bool)

(assert (=> b!434132 m!422375))

(declare-fun m!422377 () Bool)

(assert (=> b!434138 m!422377))

(declare-fun m!422379 () Bool)

(assert (=> b!434137 m!422379))

(declare-fun m!422381 () Bool)

(assert (=> b!434142 m!422381))

(declare-fun m!422383 () Bool)

(assert (=> b!434142 m!422383))

(declare-fun m!422385 () Bool)

(assert (=> b!434142 m!422385))

(declare-fun m!422387 () Bool)

(assert (=> b!434129 m!422387))

(declare-fun m!422389 () Bool)

(assert (=> b!434129 m!422389))

(assert (=> b!434141 m!422363))

(declare-fun m!422391 () Bool)

(assert (=> b!434141 m!422391))

(declare-fun m!422393 () Bool)

(assert (=> b!434141 m!422393))

(declare-fun m!422395 () Bool)

(assert (=> b!434141 m!422395))

(declare-fun m!422397 () Bool)

(assert (=> b!434141 m!422397))

(assert (=> b!434141 m!422363))

(declare-fun m!422399 () Bool)

(assert (=> b!434141 m!422399))

(declare-fun m!422401 () Bool)

(assert (=> b!434135 m!422401))

(declare-fun m!422403 () Bool)

(assert (=> b!434139 m!422403))

(declare-fun m!422405 () Bool)

(assert (=> b!434130 m!422405))

(declare-fun m!422407 () Bool)

(assert (=> mapNonEmpty!18687 m!422407))

(declare-fun m!422409 () Bool)

(assert (=> start!39944 m!422409))

(declare-fun m!422411 () Bool)

(assert (=> start!39944 m!422411))

(declare-fun m!422413 () Bool)

(assert (=> b!434133 m!422413))

(assert (=> b!434133 m!422413))

(declare-fun m!422415 () Bool)

(assert (=> b!434133 m!422415))

(assert (=> b!434133 m!422363))

(assert (=> b!434133 m!422363))

(declare-fun m!422417 () Bool)

(assert (=> b!434133 m!422417))

(declare-fun m!422419 () Bool)

(assert (=> b!434144 m!422419))

(check-sat (not b!434137) (not b!434132) (not b_next!10225) (not b!434130) (not start!39944) (not b!434133) (not b!434139) (not b_lambda!9335) tp_is_empty!11377 (not b!434142) b_and!18125 (not b!434138) (not b!434135) (not b!434129) (not b!434144) (not b!434145) (not b!434141) (not mapNonEmpty!18687))
(check-sat b_and!18125 (not b_next!10225))
