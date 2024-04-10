; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40042 () Bool)

(assert start!40042)

(declare-fun b_free!10309 () Bool)

(declare-fun b_next!10309 () Bool)

(assert (=> start!40042 (= b_free!10309 (not b_next!10309))))

(declare-fun tp!36456 () Bool)

(declare-fun b_and!18277 () Bool)

(assert (=> start!40042 (= tp!36456 b_and!18277)))

(declare-fun b!436772 () Bool)

(declare-fun res!257526 () Bool)

(declare-fun e!257888 () Bool)

(assert (=> b!436772 (=> (not res!257526) (not e!257888))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436772 (= res!257526 (validMask!0 mask!1025))))

(declare-fun b!436773 () Bool)

(declare-fun res!257519 () Bool)

(assert (=> b!436773 (=> (not res!257519) (not e!257888))))

(declare-datatypes ((array!26745 0))(
  ( (array!26746 (arr!12822 (Array (_ BitVec 32) (_ BitVec 64))) (size!13174 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26745)

(declare-datatypes ((List!7652 0))(
  ( (Nil!7649) (Cons!7648 (h!8504 (_ BitVec 64)) (t!13408 List!7652)) )
))
(declare-fun arrayNoDuplicates!0 (array!26745 (_ BitVec 32) List!7652) Bool)

(assert (=> b!436773 (= res!257519 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7649))))

(declare-fun b!436774 () Bool)

(declare-fun e!257891 () Bool)

(declare-fun tp_is_empty!11461 () Bool)

(assert (=> b!436774 (= e!257891 tp_is_empty!11461)))

(declare-fun b!436775 () Bool)

(declare-fun res!257528 () Bool)

(assert (=> b!436775 (=> (not res!257528) (not e!257888))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436775 (= res!257528 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18813 () Bool)

(declare-fun mapRes!18813 () Bool)

(assert (=> mapIsEmpty!18813 mapRes!18813))

(declare-fun mapNonEmpty!18813 () Bool)

(declare-fun tp!36455 () Bool)

(assert (=> mapNonEmpty!18813 (= mapRes!18813 (and tp!36455 e!257891))))

(declare-fun mapKey!18813 () (_ BitVec 32))

(declare-datatypes ((V!16387 0))(
  ( (V!16388 (val!5775 Int)) )
))
(declare-datatypes ((ValueCell!5387 0))(
  ( (ValueCellFull!5387 (v!8022 V!16387)) (EmptyCell!5387) )
))
(declare-datatypes ((array!26747 0))(
  ( (array!26748 (arr!12823 (Array (_ BitVec 32) ValueCell!5387)) (size!13175 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26747)

(declare-fun mapValue!18813 () ValueCell!5387)

(declare-fun mapRest!18813 () (Array (_ BitVec 32) ValueCell!5387))

(assert (=> mapNonEmpty!18813 (= (arr!12823 _values!549) (store mapRest!18813 mapKey!18813 mapValue!18813))))

(declare-fun b!436776 () Bool)

(declare-fun e!257892 () Bool)

(declare-fun e!257887 () Bool)

(assert (=> b!436776 (= e!257892 e!257887)))

(declare-fun res!257520 () Bool)

(assert (=> b!436776 (=> (not res!257520) (not e!257887))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436776 (= res!257520 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16387)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16387)

(declare-fun lt!201439 () array!26745)

(declare-fun lt!201440 () array!26747)

(declare-datatypes ((tuple2!7654 0))(
  ( (tuple2!7655 (_1!3838 (_ BitVec 64)) (_2!3838 V!16387)) )
))
(declare-datatypes ((List!7653 0))(
  ( (Nil!7650) (Cons!7649 (h!8505 tuple2!7654) (t!13409 List!7653)) )
))
(declare-datatypes ((ListLongMap!6567 0))(
  ( (ListLongMap!6568 (toList!3299 List!7653)) )
))
(declare-fun lt!201436 () ListLongMap!6567)

(declare-fun getCurrentListMapNoExtraKeys!1488 (array!26745 array!26747 (_ BitVec 32) (_ BitVec 32) V!16387 V!16387 (_ BitVec 32) Int) ListLongMap!6567)

(assert (=> b!436776 (= lt!201436 (getCurrentListMapNoExtraKeys!1488 lt!201439 lt!201440 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16387)

(assert (=> b!436776 (= lt!201440 (array!26748 (store (arr!12823 _values!549) i!563 (ValueCellFull!5387 v!412)) (size!13175 _values!549)))))

(declare-fun lt!201438 () ListLongMap!6567)

(assert (=> b!436776 (= lt!201438 (getCurrentListMapNoExtraKeys!1488 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!257527 () Bool)

(assert (=> start!40042 (=> (not res!257527) (not e!257888))))

(assert (=> start!40042 (= res!257527 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13174 _keys!709))))))

(assert (=> start!40042 e!257888))

(assert (=> start!40042 tp_is_empty!11461))

(assert (=> start!40042 tp!36456))

(assert (=> start!40042 true))

(declare-fun e!257889 () Bool)

(declare-fun array_inv!9314 (array!26747) Bool)

(assert (=> start!40042 (and (array_inv!9314 _values!549) e!257889)))

(declare-fun array_inv!9315 (array!26745) Bool)

(assert (=> start!40042 (array_inv!9315 _keys!709)))

(declare-fun b!436777 () Bool)

(declare-fun res!257523 () Bool)

(assert (=> b!436777 (=> (not res!257523) (not e!257888))))

(assert (=> b!436777 (= res!257523 (or (= (select (arr!12822 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12822 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436778 () Bool)

(declare-fun res!257529 () Bool)

(assert (=> b!436778 (=> (not res!257529) (not e!257888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436778 (= res!257529 (validKeyInArray!0 k!794))))

(declare-fun b!436779 () Bool)

(declare-fun res!257518 () Bool)

(assert (=> b!436779 (=> (not res!257518) (not e!257888))))

(assert (=> b!436779 (= res!257518 (and (= (size!13175 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13174 _keys!709) (size!13175 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436780 () Bool)

(assert (=> b!436780 (= e!257888 e!257892)))

(declare-fun res!257517 () Bool)

(assert (=> b!436780 (=> (not res!257517) (not e!257892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26745 (_ BitVec 32)) Bool)

(assert (=> b!436780 (= res!257517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201439 mask!1025))))

(assert (=> b!436780 (= lt!201439 (array!26746 (store (arr!12822 _keys!709) i!563 k!794) (size!13174 _keys!709)))))

(declare-fun b!436781 () Bool)

(declare-fun res!257524 () Bool)

(assert (=> b!436781 (=> (not res!257524) (not e!257888))))

(assert (=> b!436781 (= res!257524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436782 () Bool)

(declare-fun res!257525 () Bool)

(assert (=> b!436782 (=> (not res!257525) (not e!257892))))

(assert (=> b!436782 (= res!257525 (bvsle from!863 i!563))))

(declare-fun b!436783 () Bool)

(assert (=> b!436783 (= e!257887 (not true))))

(declare-fun +!1446 (ListLongMap!6567 tuple2!7654) ListLongMap!6567)

(assert (=> b!436783 (= (getCurrentListMapNoExtraKeys!1488 lt!201439 lt!201440 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1446 (getCurrentListMapNoExtraKeys!1488 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7655 k!794 v!412)))))

(declare-datatypes ((Unit!12996 0))(
  ( (Unit!12997) )
))
(declare-fun lt!201437 () Unit!12996)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!615 (array!26745 array!26747 (_ BitVec 32) (_ BitVec 32) V!16387 V!16387 (_ BitVec 32) (_ BitVec 64) V!16387 (_ BitVec 32) Int) Unit!12996)

(assert (=> b!436783 (= lt!201437 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!615 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436784 () Bool)

(declare-fun e!257886 () Bool)

(assert (=> b!436784 (= e!257889 (and e!257886 mapRes!18813))))

(declare-fun condMapEmpty!18813 () Bool)

(declare-fun mapDefault!18813 () ValueCell!5387)

