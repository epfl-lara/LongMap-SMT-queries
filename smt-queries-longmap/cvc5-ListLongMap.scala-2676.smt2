; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39874 () Bool)

(assert start!39874)

(declare-fun b_free!10141 () Bool)

(declare-fun b_next!10141 () Bool)

(assert (=> start!39874 (= b_free!10141 (not b_next!10141))))

(declare-fun tp!35951 () Bool)

(declare-fun b_and!17941 () Bool)

(assert (=> start!39874 (= tp!35951 b_and!17941)))

(declare-fun b!431572 () Bool)

(declare-datatypes ((Unit!12724 0))(
  ( (Unit!12725) )
))
(declare-fun e!255377 () Unit!12724)

(declare-fun Unit!12726 () Unit!12724)

(assert (=> b!431572 (= e!255377 Unit!12726)))

(declare-fun b!431573 () Bool)

(declare-fun res!253747 () Bool)

(declare-fun e!255379 () Bool)

(assert (=> b!431573 (=> (not res!253747) (not e!255379))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431573 (= res!253747 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!18561 () Bool)

(declare-fun mapRes!18561 () Bool)

(declare-fun tp!35952 () Bool)

(declare-fun e!255378 () Bool)

(assert (=> mapNonEmpty!18561 (= mapRes!18561 (and tp!35952 e!255378))))

(declare-fun mapKey!18561 () (_ BitVec 32))

(declare-datatypes ((V!16163 0))(
  ( (V!16164 (val!5691 Int)) )
))
(declare-datatypes ((ValueCell!5303 0))(
  ( (ValueCellFull!5303 (v!7938 V!16163)) (EmptyCell!5303) )
))
(declare-datatypes ((array!26421 0))(
  ( (array!26422 (arr!12660 (Array (_ BitVec 32) ValueCell!5303)) (size!13012 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26421)

(declare-fun mapValue!18561 () ValueCell!5303)

(declare-fun mapRest!18561 () (Array (_ BitVec 32) ValueCell!5303))

(assert (=> mapNonEmpty!18561 (= (arr!12660 _values!549) (store mapRest!18561 mapKey!18561 mapValue!18561))))

(declare-fun b!431574 () Bool)

(declare-fun tp_is_empty!11293 () Bool)

(assert (=> b!431574 (= e!255378 tp_is_empty!11293)))

(declare-fun b!431575 () Bool)

(declare-fun res!253745 () Bool)

(assert (=> b!431575 (=> (not res!253745) (not e!255379))))

(declare-datatypes ((array!26423 0))(
  ( (array!26424 (arr!12661 (Array (_ BitVec 32) (_ BitVec 64))) (size!13013 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26423)

(declare-datatypes ((List!7520 0))(
  ( (Nil!7517) (Cons!7516 (h!8372 (_ BitVec 64)) (t!13110 List!7520)) )
))
(declare-fun arrayNoDuplicates!0 (array!26423 (_ BitVec 32) List!7520) Bool)

(assert (=> b!431575 (= res!253745 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7517))))

(declare-fun b!431576 () Bool)

(declare-fun res!253751 () Bool)

(assert (=> b!431576 (=> (not res!253751) (not e!255379))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431576 (= res!253751 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13013 _keys!709))))))

(declare-fun b!431577 () Bool)

(declare-fun e!255373 () Bool)

(assert (=> b!431577 (= e!255373 true)))

(declare-datatypes ((tuple2!7506 0))(
  ( (tuple2!7507 (_1!3764 (_ BitVec 64)) (_2!3764 V!16163)) )
))
(declare-fun lt!197677 () tuple2!7506)

(declare-fun lt!197681 () tuple2!7506)

(declare-datatypes ((List!7521 0))(
  ( (Nil!7518) (Cons!7517 (h!8373 tuple2!7506) (t!13111 List!7521)) )
))
(declare-datatypes ((ListLongMap!6419 0))(
  ( (ListLongMap!6420 (toList!3225 List!7521)) )
))
(declare-fun lt!197685 () ListLongMap!6419)

(declare-fun lt!197680 () ListLongMap!6419)

(declare-fun +!1373 (ListLongMap!6419 tuple2!7506) ListLongMap!6419)

(assert (=> b!431577 (= lt!197685 (+!1373 (+!1373 lt!197680 lt!197681) lt!197677))))

(declare-fun lt!197686 () Unit!12724)

(declare-fun lt!197690 () V!16163)

(declare-fun v!412 () V!16163)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!365 (ListLongMap!6419 (_ BitVec 64) V!16163 (_ BitVec 64) V!16163) Unit!12724)

(assert (=> b!431577 (= lt!197686 (addCommutativeForDiffKeys!365 lt!197680 k!794 v!412 (select (arr!12661 _keys!709) from!863) lt!197690))))

(declare-fun b!431578 () Bool)

(declare-fun res!253744 () Bool)

(declare-fun e!255372 () Bool)

(assert (=> b!431578 (=> (not res!253744) (not e!255372))))

(assert (=> b!431578 (= res!253744 (bvsle from!863 i!563))))

(declare-fun b!431579 () Bool)

(declare-fun e!255374 () Bool)

(declare-fun e!255380 () Bool)

(assert (=> b!431579 (= e!255374 (not e!255380))))

(declare-fun res!253753 () Bool)

(assert (=> b!431579 (=> res!253753 e!255380)))

(assert (=> b!431579 (= res!253753 (not (validKeyInArray!0 (select (arr!12661 _keys!709) from!863))))))

(declare-fun lt!197676 () ListLongMap!6419)

(declare-fun lt!197684 () ListLongMap!6419)

(assert (=> b!431579 (= lt!197676 lt!197684)))

(assert (=> b!431579 (= lt!197684 (+!1373 lt!197680 lt!197677))))

(declare-fun minValue!515 () V!16163)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16163)

(declare-fun lt!197687 () array!26421)

(declare-fun lt!197679 () array!26423)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1423 (array!26423 array!26421 (_ BitVec 32) (_ BitVec 32) V!16163 V!16163 (_ BitVec 32) Int) ListLongMap!6419)

(assert (=> b!431579 (= lt!197676 (getCurrentListMapNoExtraKeys!1423 lt!197679 lt!197687 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431579 (= lt!197677 (tuple2!7507 k!794 v!412))))

(assert (=> b!431579 (= lt!197680 (getCurrentListMapNoExtraKeys!1423 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197678 () Unit!12724)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!558 (array!26423 array!26421 (_ BitVec 32) (_ BitVec 32) V!16163 V!16163 (_ BitVec 32) (_ BitVec 64) V!16163 (_ BitVec 32) Int) Unit!12724)

(assert (=> b!431579 (= lt!197678 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!558 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431580 () Bool)

(declare-fun res!253741 () Bool)

(assert (=> b!431580 (=> (not res!253741) (not e!255372))))

(assert (=> b!431580 (= res!253741 (arrayNoDuplicates!0 lt!197679 #b00000000000000000000000000000000 Nil!7517))))

(declare-fun b!431582 () Bool)

(assert (=> b!431582 (= e!255380 e!255373)))

(declare-fun res!253743 () Bool)

(assert (=> b!431582 (=> res!253743 e!255373)))

(assert (=> b!431582 (= res!253743 (= k!794 (select (arr!12661 _keys!709) from!863)))))

(assert (=> b!431582 (not (= (select (arr!12661 _keys!709) from!863) k!794))))

(declare-fun lt!197689 () Unit!12724)

(assert (=> b!431582 (= lt!197689 e!255377)))

(declare-fun c!55547 () Bool)

(assert (=> b!431582 (= c!55547 (= (select (arr!12661 _keys!709) from!863) k!794))))

(declare-fun lt!197688 () ListLongMap!6419)

(assert (=> b!431582 (= lt!197688 lt!197685)))

(assert (=> b!431582 (= lt!197685 (+!1373 lt!197684 lt!197681))))

(assert (=> b!431582 (= lt!197681 (tuple2!7507 (select (arr!12661 _keys!709) from!863) lt!197690))))

(declare-fun get!6289 (ValueCell!5303 V!16163) V!16163)

(declare-fun dynLambda!794 (Int (_ BitVec 64)) V!16163)

(assert (=> b!431582 (= lt!197690 (get!6289 (select (arr!12660 _values!549) from!863) (dynLambda!794 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431583 () Bool)

(assert (=> b!431583 (= e!255379 e!255372)))

(declare-fun res!253755 () Bool)

(assert (=> b!431583 (=> (not res!253755) (not e!255372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26423 (_ BitVec 32)) Bool)

(assert (=> b!431583 (= res!253755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197679 mask!1025))))

(assert (=> b!431583 (= lt!197679 (array!26424 (store (arr!12661 _keys!709) i!563 k!794) (size!13013 _keys!709)))))

(declare-fun b!431584 () Bool)

(declare-fun res!253742 () Bool)

(assert (=> b!431584 (=> (not res!253742) (not e!255379))))

(assert (=> b!431584 (= res!253742 (and (= (size!13012 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13013 _keys!709) (size!13012 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18561 () Bool)

(assert (=> mapIsEmpty!18561 mapRes!18561))

(declare-fun b!431585 () Bool)

(declare-fun e!255376 () Bool)

(assert (=> b!431585 (= e!255376 tp_is_empty!11293)))

(declare-fun b!431586 () Bool)

(declare-fun res!253750 () Bool)

(assert (=> b!431586 (=> (not res!253750) (not e!255379))))

(declare-fun arrayContainsKey!0 (array!26423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431586 (= res!253750 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!431587 () Bool)

(assert (=> b!431587 (= e!255372 e!255374)))

(declare-fun res!253748 () Bool)

(assert (=> b!431587 (=> (not res!253748) (not e!255374))))

(assert (=> b!431587 (= res!253748 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!431587 (= lt!197688 (getCurrentListMapNoExtraKeys!1423 lt!197679 lt!197687 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431587 (= lt!197687 (array!26422 (store (arr!12660 _values!549) i!563 (ValueCellFull!5303 v!412)) (size!13012 _values!549)))))

(declare-fun lt!197682 () ListLongMap!6419)

(assert (=> b!431587 (= lt!197682 (getCurrentListMapNoExtraKeys!1423 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431588 () Bool)

(declare-fun res!253749 () Bool)

(assert (=> b!431588 (=> (not res!253749) (not e!255379))))

(assert (=> b!431588 (= res!253749 (or (= (select (arr!12661 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12661 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431589 () Bool)

(declare-fun res!253746 () Bool)

(assert (=> b!431589 (=> (not res!253746) (not e!255379))))

(assert (=> b!431589 (= res!253746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431590 () Bool)

(declare-fun Unit!12727 () Unit!12724)

(assert (=> b!431590 (= e!255377 Unit!12727)))

(declare-fun lt!197683 () Unit!12724)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26423 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12724)

(assert (=> b!431590 (= lt!197683 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431590 false))

(declare-fun b!431591 () Bool)

(declare-fun res!253754 () Bool)

(assert (=> b!431591 (=> (not res!253754) (not e!255379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431591 (= res!253754 (validMask!0 mask!1025))))

(declare-fun b!431581 () Bool)

(declare-fun e!255381 () Bool)

(assert (=> b!431581 (= e!255381 (and e!255376 mapRes!18561))))

(declare-fun condMapEmpty!18561 () Bool)

(declare-fun mapDefault!18561 () ValueCell!5303)

