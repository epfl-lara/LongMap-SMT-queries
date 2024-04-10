; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40006 () Bool)

(assert start!40006)

(declare-fun b_free!10273 () Bool)

(declare-fun b_next!10273 () Bool)

(assert (=> start!40006 (= b_free!10273 (not b_next!10273))))

(declare-fun tp!36348 () Bool)

(declare-fun b_and!18205 () Bool)

(assert (=> start!40006 (= tp!36348 b_and!18205)))

(declare-fun b!435664 () Bool)

(declare-fun e!257360 () Bool)

(declare-fun e!257356 () Bool)

(assert (=> b!435664 (= e!257360 (not e!257356))))

(declare-fun res!256720 () Bool)

(assert (=> b!435664 (=> res!256720 e!257356)))

(declare-datatypes ((array!26677 0))(
  ( (array!26678 (arr!12788 (Array (_ BitVec 32) (_ BitVec 64))) (size!13140 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26677)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435664 (= res!256720 (not (validKeyInArray!0 (select (arr!12788 _keys!709) from!863))))))

(declare-datatypes ((V!16339 0))(
  ( (V!16340 (val!5757 Int)) )
))
(declare-datatypes ((tuple2!7622 0))(
  ( (tuple2!7623 (_1!3822 (_ BitVec 64)) (_2!3822 V!16339)) )
))
(declare-datatypes ((List!7624 0))(
  ( (Nil!7621) (Cons!7620 (h!8476 tuple2!7622) (t!13346 List!7624)) )
))
(declare-datatypes ((ListLongMap!6535 0))(
  ( (ListLongMap!6536 (toList!3283 List!7624)) )
))
(declare-fun lt!200657 () ListLongMap!6535)

(declare-fun lt!200660 () ListLongMap!6535)

(assert (=> b!435664 (= lt!200657 lt!200660)))

(declare-fun lt!200650 () ListLongMap!6535)

(declare-fun lt!200653 () tuple2!7622)

(declare-fun +!1431 (ListLongMap!6535 tuple2!7622) ListLongMap!6535)

(assert (=> b!435664 (= lt!200660 (+!1431 lt!200650 lt!200653))))

(declare-fun minValue!515 () V!16339)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200647 () array!26677)

(declare-datatypes ((ValueCell!5369 0))(
  ( (ValueCellFull!5369 (v!8004 V!16339)) (EmptyCell!5369) )
))
(declare-datatypes ((array!26679 0))(
  ( (array!26680 (arr!12789 (Array (_ BitVec 32) ValueCell!5369)) (size!13141 (_ BitVec 32))) )
))
(declare-fun lt!200652 () array!26679)

(declare-fun zeroValue!515 () V!16339)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1474 (array!26677 array!26679 (_ BitVec 32) (_ BitVec 32) V!16339 V!16339 (_ BitVec 32) Int) ListLongMap!6535)

(assert (=> b!435664 (= lt!200657 (getCurrentListMapNoExtraKeys!1474 lt!200647 lt!200652 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16339)

(assert (=> b!435664 (= lt!200653 (tuple2!7623 k!794 v!412))))

(declare-fun _values!549 () array!26679)

(assert (=> b!435664 (= lt!200650 (getCurrentListMapNoExtraKeys!1474 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12939 0))(
  ( (Unit!12940) )
))
(declare-fun lt!200649 () Unit!12939)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!603 (array!26677 array!26679 (_ BitVec 32) (_ BitVec 32) V!16339 V!16339 (_ BitVec 32) (_ BitVec 64) V!16339 (_ BitVec 32) Int) Unit!12939)

(assert (=> b!435664 (= lt!200649 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!603 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435665 () Bool)

(declare-fun res!256713 () Bool)

(declare-fun e!257359 () Bool)

(assert (=> b!435665 (=> (not res!256713) (not e!257359))))

(assert (=> b!435665 (= res!256713 (bvsle from!863 i!563))))

(declare-fun b!435666 () Bool)

(declare-fun e!257358 () Unit!12939)

(declare-fun Unit!12941 () Unit!12939)

(assert (=> b!435666 (= e!257358 Unit!12941)))

(declare-fun lt!200655 () Unit!12939)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12939)

(assert (=> b!435666 (= lt!200655 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435666 false))

(declare-fun b!435667 () Bool)

(assert (=> b!435667 (= e!257359 e!257360)))

(declare-fun res!256715 () Bool)

(assert (=> b!435667 (=> (not res!256715) (not e!257360))))

(assert (=> b!435667 (= res!256715 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200659 () ListLongMap!6535)

(assert (=> b!435667 (= lt!200659 (getCurrentListMapNoExtraKeys!1474 lt!200647 lt!200652 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435667 (= lt!200652 (array!26680 (store (arr!12789 _values!549) i!563 (ValueCellFull!5369 v!412)) (size!13141 _values!549)))))

(declare-fun lt!200646 () ListLongMap!6535)

(assert (=> b!435667 (= lt!200646 (getCurrentListMapNoExtraKeys!1474 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435668 () Bool)

(declare-fun res!256725 () Bool)

(declare-fun e!257353 () Bool)

(assert (=> b!435668 (=> (not res!256725) (not e!257353))))

(assert (=> b!435668 (= res!256725 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13140 _keys!709))))))

(declare-fun b!435669 () Bool)

(declare-fun Unit!12942 () Unit!12939)

(assert (=> b!435669 (= e!257358 Unit!12942)))

(declare-fun b!435670 () Bool)

(declare-fun res!256717 () Bool)

(assert (=> b!435670 (=> (not res!256717) (not e!257353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26677 (_ BitVec 32)) Bool)

(assert (=> b!435670 (= res!256717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435672 () Bool)

(declare-fun res!256721 () Bool)

(assert (=> b!435672 (=> (not res!256721) (not e!257359))))

(declare-datatypes ((List!7625 0))(
  ( (Nil!7622) (Cons!7621 (h!8477 (_ BitVec 64)) (t!13347 List!7625)) )
))
(declare-fun arrayNoDuplicates!0 (array!26677 (_ BitVec 32) List!7625) Bool)

(assert (=> b!435672 (= res!256721 (arrayNoDuplicates!0 lt!200647 #b00000000000000000000000000000000 Nil!7622))))

(declare-fun b!435673 () Bool)

(declare-fun res!256723 () Bool)

(assert (=> b!435673 (=> (not res!256723) (not e!257353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435673 (= res!256723 (validMask!0 mask!1025))))

(declare-fun b!435674 () Bool)

(declare-fun res!256712 () Bool)

(assert (=> b!435674 (=> (not res!256712) (not e!257353))))

(assert (=> b!435674 (= res!256712 (and (= (size!13141 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13140 _keys!709) (size!13141 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435675 () Bool)

(declare-fun res!256718 () Bool)

(assert (=> b!435675 (=> (not res!256718) (not e!257353))))

(assert (=> b!435675 (= res!256718 (or (= (select (arr!12788 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12788 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18759 () Bool)

(declare-fun mapRes!18759 () Bool)

(assert (=> mapIsEmpty!18759 mapRes!18759))

(declare-fun b!435676 () Bool)

(declare-fun e!257352 () Bool)

(declare-fun e!257354 () Bool)

(assert (=> b!435676 (= e!257352 (and e!257354 mapRes!18759))))

(declare-fun condMapEmpty!18759 () Bool)

(declare-fun mapDefault!18759 () ValueCell!5369)

