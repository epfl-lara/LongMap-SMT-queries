; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39956 () Bool)

(assert start!39956)

(declare-fun b_free!10223 () Bool)

(declare-fun b_next!10223 () Bool)

(assert (=> start!39956 (= b_free!10223 (not b_next!10223))))

(declare-fun tp!36197 () Bool)

(declare-fun b_and!18105 () Bool)

(assert (=> start!39956 (= tp!36197 b_and!18105)))

(declare-fun b!434114 () Bool)

(declare-fun res!255591 () Bool)

(declare-fun e!256602 () Bool)

(assert (=> b!434114 (=> (not res!255591) (not e!256602))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434114 (= res!255591 (validMask!0 mask!1025))))

(declare-fun b!434115 () Bool)

(declare-fun res!255598 () Bool)

(assert (=> b!434115 (=> (not res!255598) (not e!256602))))

(declare-datatypes ((array!26583 0))(
  ( (array!26584 (arr!12741 (Array (_ BitVec 32) (_ BitVec 64))) (size!13093 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26583)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26583 (_ BitVec 32)) Bool)

(assert (=> b!434115 (= res!255598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434116 () Bool)

(declare-fun e!256611 () Bool)

(declare-fun tp_is_empty!11375 () Bool)

(assert (=> b!434116 (= e!256611 tp_is_empty!11375)))

(declare-fun res!255596 () Bool)

(assert (=> start!39956 (=> (not res!255596) (not e!256602))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39956 (= res!255596 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13093 _keys!709))))))

(assert (=> start!39956 e!256602))

(assert (=> start!39956 tp_is_empty!11375))

(assert (=> start!39956 tp!36197))

(assert (=> start!39956 true))

(declare-datatypes ((V!16271 0))(
  ( (V!16272 (val!5732 Int)) )
))
(declare-datatypes ((ValueCell!5344 0))(
  ( (ValueCellFull!5344 (v!7979 V!16271)) (EmptyCell!5344) )
))
(declare-datatypes ((array!26585 0))(
  ( (array!26586 (arr!12742 (Array (_ BitVec 32) ValueCell!5344)) (size!13094 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26585)

(declare-fun e!256606 () Bool)

(declare-fun array_inv!9270 (array!26585) Bool)

(assert (=> start!39956 (and (array_inv!9270 _values!549) e!256606)))

(declare-fun array_inv!9271 (array!26583) Bool)

(assert (=> start!39956 (array_inv!9271 _keys!709)))

(declare-fun b!434117 () Bool)

(declare-fun res!255592 () Bool)

(assert (=> b!434117 (=> (not res!255592) (not e!256602))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434117 (= res!255592 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13093 _keys!709))))))

(declare-fun b!434118 () Bool)

(declare-fun res!255599 () Bool)

(assert (=> b!434118 (=> (not res!255599) (not e!256602))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!434118 (= res!255599 (and (= (size!13094 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13093 _keys!709) (size!13094 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434119 () Bool)

(declare-fun e!256610 () Bool)

(assert (=> b!434119 (= e!256610 true)))

(declare-datatypes ((tuple2!7582 0))(
  ( (tuple2!7583 (_1!3802 (_ BitVec 64)) (_2!3802 V!16271)) )
))
(declare-datatypes ((List!7587 0))(
  ( (Nil!7584) (Cons!7583 (h!8439 tuple2!7582) (t!13259 List!7587)) )
))
(declare-datatypes ((ListLongMap!6495 0))(
  ( (ListLongMap!6496 (toList!3263 List!7587)) )
))
(declare-fun lt!199527 () ListLongMap!6495)

(declare-fun lt!199530 () tuple2!7582)

(declare-fun lt!199528 () ListLongMap!6495)

(declare-fun lt!199522 () tuple2!7582)

(declare-fun +!1411 (ListLongMap!6495 tuple2!7582) ListLongMap!6495)

(assert (=> b!434119 (= lt!199527 (+!1411 (+!1411 lt!199528 lt!199530) lt!199522))))

(declare-datatypes ((Unit!12866 0))(
  ( (Unit!12867) )
))
(declare-fun lt!199534 () Unit!12866)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16271)

(declare-fun lt!199532 () V!16271)

(declare-fun addCommutativeForDiffKeys!398 (ListLongMap!6495 (_ BitVec 64) V!16271 (_ BitVec 64) V!16271) Unit!12866)

(assert (=> b!434119 (= lt!199534 (addCommutativeForDiffKeys!398 lt!199528 k!794 v!412 (select (arr!12741 _keys!709) from!863) lt!199532))))

(declare-fun b!434120 () Bool)

(declare-fun e!256605 () Unit!12866)

(declare-fun Unit!12868 () Unit!12866)

(assert (=> b!434120 (= e!256605 Unit!12868)))

(declare-fun lt!199533 () Unit!12866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12866)

(assert (=> b!434120 (= lt!199533 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434120 false))

(declare-fun b!434121 () Bool)

(declare-fun res!255588 () Bool)

(declare-fun e!256609 () Bool)

(assert (=> b!434121 (=> (not res!255588) (not e!256609))))

(declare-fun lt!199531 () array!26583)

(declare-datatypes ((List!7588 0))(
  ( (Nil!7585) (Cons!7584 (h!8440 (_ BitVec 64)) (t!13260 List!7588)) )
))
(declare-fun arrayNoDuplicates!0 (array!26583 (_ BitVec 32) List!7588) Bool)

(assert (=> b!434121 (= res!255588 (arrayNoDuplicates!0 lt!199531 #b00000000000000000000000000000000 Nil!7585))))

(declare-fun b!434122 () Bool)

(declare-fun e!256608 () Bool)

(assert (=> b!434122 (= e!256609 e!256608)))

(declare-fun res!255589 () Bool)

(assert (=> b!434122 (=> (not res!255589) (not e!256608))))

(assert (=> b!434122 (= res!255589 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16271)

(declare-fun lt!199529 () ListLongMap!6495)

(declare-fun lt!199521 () array!26585)

(declare-fun minValue!515 () V!16271)

(declare-fun getCurrentListMapNoExtraKeys!1457 (array!26583 array!26585 (_ BitVec 32) (_ BitVec 32) V!16271 V!16271 (_ BitVec 32) Int) ListLongMap!6495)

(assert (=> b!434122 (= lt!199529 (getCurrentListMapNoExtraKeys!1457 lt!199531 lt!199521 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434122 (= lt!199521 (array!26586 (store (arr!12742 _values!549) i!563 (ValueCellFull!5344 v!412)) (size!13094 _values!549)))))

(declare-fun lt!199526 () ListLongMap!6495)

(assert (=> b!434122 (= lt!199526 (getCurrentListMapNoExtraKeys!1457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434123 () Bool)

(declare-fun e!256603 () Bool)

(assert (=> b!434123 (= e!256603 e!256610)))

(declare-fun res!255595 () Bool)

(assert (=> b!434123 (=> res!255595 e!256610)))

(assert (=> b!434123 (= res!255595 (= k!794 (select (arr!12741 _keys!709) from!863)))))

(assert (=> b!434123 (not (= (select (arr!12741 _keys!709) from!863) k!794))))

(declare-fun lt!199535 () Unit!12866)

(assert (=> b!434123 (= lt!199535 e!256605)))

(declare-fun c!55670 () Bool)

(assert (=> b!434123 (= c!55670 (= (select (arr!12741 _keys!709) from!863) k!794))))

(assert (=> b!434123 (= lt!199529 lt!199527)))

(declare-fun lt!199523 () ListLongMap!6495)

(assert (=> b!434123 (= lt!199527 (+!1411 lt!199523 lt!199530))))

(assert (=> b!434123 (= lt!199530 (tuple2!7583 (select (arr!12741 _keys!709) from!863) lt!199532))))

(declare-fun get!6343 (ValueCell!5344 V!16271) V!16271)

(declare-fun dynLambda!822 (Int (_ BitVec 64)) V!16271)

(assert (=> b!434123 (= lt!199532 (get!6343 (select (arr!12742 _values!549) from!863) (dynLambda!822 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18684 () Bool)

(declare-fun mapRes!18684 () Bool)

(declare-fun tp!36198 () Bool)

(declare-fun e!256604 () Bool)

(assert (=> mapNonEmpty!18684 (= mapRes!18684 (and tp!36198 e!256604))))

(declare-fun mapKey!18684 () (_ BitVec 32))

(declare-fun mapValue!18684 () ValueCell!5344)

(declare-fun mapRest!18684 () (Array (_ BitVec 32) ValueCell!5344))

(assert (=> mapNonEmpty!18684 (= (arr!12742 _values!549) (store mapRest!18684 mapKey!18684 mapValue!18684))))

(declare-fun b!434124 () Bool)

(assert (=> b!434124 (= e!256608 (not e!256603))))

(declare-fun res!255593 () Bool)

(assert (=> b!434124 (=> res!255593 e!256603)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434124 (= res!255593 (not (validKeyInArray!0 (select (arr!12741 _keys!709) from!863))))))

(declare-fun lt!199524 () ListLongMap!6495)

(assert (=> b!434124 (= lt!199524 lt!199523)))

(assert (=> b!434124 (= lt!199523 (+!1411 lt!199528 lt!199522))))

(assert (=> b!434124 (= lt!199524 (getCurrentListMapNoExtraKeys!1457 lt!199531 lt!199521 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434124 (= lt!199522 (tuple2!7583 k!794 v!412))))

(assert (=> b!434124 (= lt!199528 (getCurrentListMapNoExtraKeys!1457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199525 () Unit!12866)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!588 (array!26583 array!26585 (_ BitVec 32) (_ BitVec 32) V!16271 V!16271 (_ BitVec 32) (_ BitVec 64) V!16271 (_ BitVec 32) Int) Unit!12866)

(assert (=> b!434124 (= lt!199525 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!588 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434125 () Bool)

(declare-fun res!255590 () Bool)

(assert (=> b!434125 (=> (not res!255590) (not e!256602))))

(assert (=> b!434125 (= res!255590 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7585))))

(declare-fun mapIsEmpty!18684 () Bool)

(assert (=> mapIsEmpty!18684 mapRes!18684))

(declare-fun b!434126 () Bool)

(declare-fun res!255600 () Bool)

(assert (=> b!434126 (=> (not res!255600) (not e!256609))))

(assert (=> b!434126 (= res!255600 (bvsle from!863 i!563))))

(declare-fun b!434127 () Bool)

(assert (=> b!434127 (= e!256602 e!256609)))

(declare-fun res!255594 () Bool)

(assert (=> b!434127 (=> (not res!255594) (not e!256609))))

(assert (=> b!434127 (= res!255594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199531 mask!1025))))

(assert (=> b!434127 (= lt!199531 (array!26584 (store (arr!12741 _keys!709) i!563 k!794) (size!13093 _keys!709)))))

(declare-fun b!434128 () Bool)

(declare-fun Unit!12869 () Unit!12866)

(assert (=> b!434128 (= e!256605 Unit!12869)))

(declare-fun b!434129 () Bool)

(assert (=> b!434129 (= e!256604 tp_is_empty!11375)))

(declare-fun b!434130 () Bool)

(declare-fun res!255597 () Bool)

(assert (=> b!434130 (=> (not res!255597) (not e!256602))))

(assert (=> b!434130 (= res!255597 (validKeyInArray!0 k!794))))

(declare-fun b!434131 () Bool)

(assert (=> b!434131 (= e!256606 (and e!256611 mapRes!18684))))

(declare-fun condMapEmpty!18684 () Bool)

(declare-fun mapDefault!18684 () ValueCell!5344)

