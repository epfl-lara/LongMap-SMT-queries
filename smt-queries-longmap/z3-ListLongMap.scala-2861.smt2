; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41208 () Bool)

(assert start!41208)

(declare-fun b_free!11065 () Bool)

(declare-fun b_next!11065 () Bool)

(assert (=> start!41208 (= b_free!11065 (not b_next!11065))))

(declare-fun tp!39033 () Bool)

(declare-fun b_and!19359 () Bool)

(assert (=> start!41208 (= tp!39033 b_and!19359)))

(declare-fun b!460678 () Bool)

(declare-fun res!275498 () Bool)

(declare-fun e!268719 () Bool)

(assert (=> b!460678 (=> (not res!275498) (not e!268719))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28603 0))(
  ( (array!28604 (arr!13741 (Array (_ BitVec 32) (_ BitVec 64))) (size!14094 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28603)

(assert (=> b!460678 (= res!275498 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14094 _keys!709))))))

(declare-fun b!460679 () Bool)

(declare-fun e!268724 () Bool)

(declare-fun tp_is_empty!12403 () Bool)

(assert (=> b!460679 (= e!268724 tp_is_empty!12403)))

(declare-fun mapIsEmpty!20257 () Bool)

(declare-fun mapRes!20257 () Bool)

(assert (=> mapIsEmpty!20257 mapRes!20257))

(declare-fun b!460680 () Bool)

(declare-fun res!275491 () Bool)

(assert (=> b!460680 (=> (not res!275491) (not e!268719))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460680 (= res!275491 (validMask!0 mask!1025))))

(declare-fun b!460681 () Bool)

(declare-fun res!275488 () Bool)

(assert (=> b!460681 (=> (not res!275488) (not e!268719))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17643 0))(
  ( (V!17644 (val!6246 Int)) )
))
(declare-datatypes ((ValueCell!5858 0))(
  ( (ValueCellFull!5858 (v!8522 V!17643)) (EmptyCell!5858) )
))
(declare-datatypes ((array!28605 0))(
  ( (array!28606 (arr!13742 (Array (_ BitVec 32) ValueCell!5858)) (size!14095 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28605)

(assert (=> b!460681 (= res!275488 (and (= (size!14095 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14094 _keys!709) (size!14095 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460682 () Bool)

(declare-fun e!268718 () Bool)

(declare-fun e!268720 () Bool)

(assert (=> b!460682 (= e!268718 e!268720)))

(declare-fun res!275496 () Bool)

(assert (=> b!460682 (=> (not res!275496) (not e!268720))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!460682 (= res!275496 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17643)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!208605 () array!28603)

(declare-fun lt!208606 () array!28605)

(declare-datatypes ((tuple2!8272 0))(
  ( (tuple2!8273 (_1!4147 (_ BitVec 64)) (_2!4147 V!17643)) )
))
(declare-datatypes ((List!8333 0))(
  ( (Nil!8330) (Cons!8329 (h!9185 tuple2!8272) (t!14266 List!8333)) )
))
(declare-datatypes ((ListLongMap!7175 0))(
  ( (ListLongMap!7176 (toList!3603 List!8333)) )
))
(declare-fun lt!208608 () ListLongMap!7175)

(declare-fun zeroValue!515 () V!17643)

(declare-fun getCurrentListMapNoExtraKeys!1795 (array!28603 array!28605 (_ BitVec 32) (_ BitVec 32) V!17643 V!17643 (_ BitVec 32) Int) ListLongMap!7175)

(assert (=> b!460682 (= lt!208608 (getCurrentListMapNoExtraKeys!1795 lt!208605 lt!208606 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17643)

(assert (=> b!460682 (= lt!208606 (array!28606 (store (arr!13742 _values!549) i!563 (ValueCellFull!5858 v!412)) (size!14095 _values!549)))))

(declare-fun lt!208604 () ListLongMap!7175)

(assert (=> b!460682 (= lt!208604 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!20257 () Bool)

(declare-fun tp!39034 () Bool)

(assert (=> mapNonEmpty!20257 (= mapRes!20257 (and tp!39034 e!268724))))

(declare-fun mapRest!20257 () (Array (_ BitVec 32) ValueCell!5858))

(declare-fun mapValue!20257 () ValueCell!5858)

(declare-fun mapKey!20257 () (_ BitVec 32))

(assert (=> mapNonEmpty!20257 (= (arr!13742 _values!549) (store mapRest!20257 mapKey!20257 mapValue!20257))))

(declare-fun b!460683 () Bool)

(declare-fun res!275497 () Bool)

(assert (=> b!460683 (=> (not res!275497) (not e!268719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28603 (_ BitVec 32)) Bool)

(assert (=> b!460683 (= res!275497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460684 () Bool)

(declare-fun e!268721 () Bool)

(declare-fun e!268723 () Bool)

(assert (=> b!460684 (= e!268721 (and e!268723 mapRes!20257))))

(declare-fun condMapEmpty!20257 () Bool)

(declare-fun mapDefault!20257 () ValueCell!5858)

(assert (=> b!460684 (= condMapEmpty!20257 (= (arr!13742 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5858)) mapDefault!20257)))))

(declare-fun b!460685 () Bool)

(declare-fun res!275489 () Bool)

(assert (=> b!460685 (=> (not res!275489) (not e!268718))))

(assert (=> b!460685 (= res!275489 (bvsle from!863 i!563))))

(declare-fun b!460686 () Bool)

(declare-fun res!275494 () Bool)

(assert (=> b!460686 (=> (not res!275494) (not e!268719))))

(declare-datatypes ((List!8334 0))(
  ( (Nil!8331) (Cons!8330 (h!9186 (_ BitVec 64)) (t!14267 List!8334)) )
))
(declare-fun arrayNoDuplicates!0 (array!28603 (_ BitVec 32) List!8334) Bool)

(assert (=> b!460686 (= res!275494 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8331))))

(declare-fun b!460677 () Bool)

(assert (=> b!460677 (= e!268720 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1655 (ListLongMap!7175 tuple2!8272) ListLongMap!7175)

(assert (=> b!460677 (= (getCurrentListMapNoExtraKeys!1795 lt!208605 lt!208606 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1655 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8273 k0!794 v!412)))))

(declare-datatypes ((Unit!13390 0))(
  ( (Unit!13391) )
))
(declare-fun lt!208607 () Unit!13390)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!785 (array!28603 array!28605 (_ BitVec 32) (_ BitVec 32) V!17643 V!17643 (_ BitVec 32) (_ BitVec 64) V!17643 (_ BitVec 32) Int) Unit!13390)

(assert (=> b!460677 (= lt!208607 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!785 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!275490 () Bool)

(assert (=> start!41208 (=> (not res!275490) (not e!268719))))

(assert (=> start!41208 (= res!275490 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14094 _keys!709))))))

(assert (=> start!41208 e!268719))

(assert (=> start!41208 tp_is_empty!12403))

(assert (=> start!41208 tp!39033))

(assert (=> start!41208 true))

(declare-fun array_inv!10002 (array!28605) Bool)

(assert (=> start!41208 (and (array_inv!10002 _values!549) e!268721)))

(declare-fun array_inv!10003 (array!28603) Bool)

(assert (=> start!41208 (array_inv!10003 _keys!709)))

(declare-fun b!460687 () Bool)

(assert (=> b!460687 (= e!268723 tp_is_empty!12403)))

(declare-fun b!460688 () Bool)

(assert (=> b!460688 (= e!268719 e!268718)))

(declare-fun res!275493 () Bool)

(assert (=> b!460688 (=> (not res!275493) (not e!268718))))

(assert (=> b!460688 (= res!275493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208605 mask!1025))))

(assert (=> b!460688 (= lt!208605 (array!28604 (store (arr!13741 _keys!709) i!563 k0!794) (size!14094 _keys!709)))))

(declare-fun b!460689 () Bool)

(declare-fun res!275486 () Bool)

(assert (=> b!460689 (=> (not res!275486) (not e!268719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460689 (= res!275486 (validKeyInArray!0 k0!794))))

(declare-fun b!460690 () Bool)

(declare-fun res!275495 () Bool)

(assert (=> b!460690 (=> (not res!275495) (not e!268719))))

(assert (=> b!460690 (= res!275495 (or (= (select (arr!13741 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13741 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460691 () Bool)

(declare-fun res!275487 () Bool)

(assert (=> b!460691 (=> (not res!275487) (not e!268718))))

(assert (=> b!460691 (= res!275487 (arrayNoDuplicates!0 lt!208605 #b00000000000000000000000000000000 Nil!8331))))

(declare-fun b!460692 () Bool)

(declare-fun res!275492 () Bool)

(assert (=> b!460692 (=> (not res!275492) (not e!268719))))

(declare-fun arrayContainsKey!0 (array!28603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460692 (= res!275492 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!41208 res!275490) b!460680))

(assert (= (and b!460680 res!275491) b!460681))

(assert (= (and b!460681 res!275488) b!460683))

(assert (= (and b!460683 res!275497) b!460686))

(assert (= (and b!460686 res!275494) b!460678))

(assert (= (and b!460678 res!275498) b!460689))

(assert (= (and b!460689 res!275486) b!460690))

(assert (= (and b!460690 res!275495) b!460692))

(assert (= (and b!460692 res!275492) b!460688))

(assert (= (and b!460688 res!275493) b!460691))

(assert (= (and b!460691 res!275487) b!460685))

(assert (= (and b!460685 res!275489) b!460682))

(assert (= (and b!460682 res!275496) b!460677))

(assert (= (and b!460684 condMapEmpty!20257) mapIsEmpty!20257))

(assert (= (and b!460684 (not condMapEmpty!20257)) mapNonEmpty!20257))

(get-info :version)

(assert (= (and mapNonEmpty!20257 ((_ is ValueCellFull!5858) mapValue!20257)) b!460679))

(assert (= (and b!460684 ((_ is ValueCellFull!5858) mapDefault!20257)) b!460687))

(assert (= start!41208 b!460684))

(declare-fun m!443467 () Bool)

(assert (=> b!460682 m!443467))

(declare-fun m!443469 () Bool)

(assert (=> b!460682 m!443469))

(declare-fun m!443471 () Bool)

(assert (=> b!460682 m!443471))

(declare-fun m!443473 () Bool)

(assert (=> b!460686 m!443473))

(declare-fun m!443475 () Bool)

(assert (=> b!460677 m!443475))

(declare-fun m!443477 () Bool)

(assert (=> b!460677 m!443477))

(assert (=> b!460677 m!443477))

(declare-fun m!443479 () Bool)

(assert (=> b!460677 m!443479))

(declare-fun m!443481 () Bool)

(assert (=> b!460677 m!443481))

(declare-fun m!443483 () Bool)

(assert (=> b!460689 m!443483))

(declare-fun m!443485 () Bool)

(assert (=> b!460683 m!443485))

(declare-fun m!443487 () Bool)

(assert (=> b!460680 m!443487))

(declare-fun m!443489 () Bool)

(assert (=> mapNonEmpty!20257 m!443489))

(declare-fun m!443491 () Bool)

(assert (=> b!460690 m!443491))

(declare-fun m!443493 () Bool)

(assert (=> b!460692 m!443493))

(declare-fun m!443495 () Bool)

(assert (=> start!41208 m!443495))

(declare-fun m!443497 () Bool)

(assert (=> start!41208 m!443497))

(declare-fun m!443499 () Bool)

(assert (=> b!460691 m!443499))

(declare-fun m!443501 () Bool)

(assert (=> b!460688 m!443501))

(declare-fun m!443503 () Bool)

(assert (=> b!460688 m!443503))

(check-sat b_and!19359 tp_is_empty!12403 (not b!460683) (not b!460692) (not b!460686) (not b_next!11065) (not b!460677) (not start!41208) (not b!460688) (not b!460680) (not b!460682) (not b!460691) (not mapNonEmpty!20257) (not b!460689))
(check-sat b_and!19359 (not b_next!11065))
