; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40196 () Bool)

(assert start!40196)

(declare-fun b_free!10463 () Bool)

(declare-fun b_next!10463 () Bool)

(assert (=> start!40196 (= b_free!10463 (not b_next!10463))))

(declare-fun tp!36917 () Bool)

(declare-fun b_and!18431 () Bool)

(assert (=> start!40196 (= tp!36917 b_and!18431)))

(declare-fun b!440468 () Bool)

(declare-fun e!259506 () Bool)

(declare-fun tp_is_empty!11615 () Bool)

(assert (=> b!440468 (= e!259506 tp_is_empty!11615)))

(declare-fun mapIsEmpty!19044 () Bool)

(declare-fun mapRes!19044 () Bool)

(assert (=> mapIsEmpty!19044 mapRes!19044))

(declare-fun b!440469 () Bool)

(declare-fun e!259508 () Bool)

(assert (=> b!440469 (= e!259508 (not true))))

(declare-datatypes ((V!16591 0))(
  ( (V!16592 (val!5852 Int)) )
))
(declare-fun minValue!515 () V!16591)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5464 0))(
  ( (ValueCellFull!5464 (v!8099 V!16591)) (EmptyCell!5464) )
))
(declare-datatypes ((array!27043 0))(
  ( (array!27044 (arr!12971 (Array (_ BitVec 32) ValueCell!5464)) (size!13323 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27043)

(declare-fun zeroValue!515 () V!16591)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!202595 () array!27043)

(declare-datatypes ((array!27045 0))(
  ( (array!27046 (arr!12972 (Array (_ BitVec 32) (_ BitVec 64))) (size!13324 (_ BitVec 32))) )
))
(declare-fun lt!202593 () array!27045)

(declare-fun v!412 () V!16591)

(declare-fun _keys!709 () array!27045)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7778 0))(
  ( (tuple2!7779 (_1!3900 (_ BitVec 64)) (_2!3900 V!16591)) )
))
(declare-datatypes ((List!7775 0))(
  ( (Nil!7772) (Cons!7771 (h!8627 tuple2!7778) (t!13531 List!7775)) )
))
(declare-datatypes ((ListLongMap!6691 0))(
  ( (ListLongMap!6692 (toList!3361 List!7775)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1550 (array!27045 array!27043 (_ BitVec 32) (_ BitVec 32) V!16591 V!16591 (_ BitVec 32) Int) ListLongMap!6691)

(declare-fun +!1499 (ListLongMap!6691 tuple2!7778) ListLongMap!6691)

(assert (=> b!440469 (= (getCurrentListMapNoExtraKeys!1550 lt!202593 lt!202595 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1499 (getCurrentListMapNoExtraKeys!1550 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7779 k!794 v!412)))))

(declare-datatypes ((Unit!13102 0))(
  ( (Unit!13103) )
))
(declare-fun lt!202594 () Unit!13102)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!668 (array!27045 array!27043 (_ BitVec 32) (_ BitVec 32) V!16591 V!16591 (_ BitVec 32) (_ BitVec 64) V!16591 (_ BitVec 32) Int) Unit!13102)

(assert (=> b!440469 (= lt!202594 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!668 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440470 () Bool)

(declare-fun e!259503 () Bool)

(declare-fun e!259507 () Bool)

(assert (=> b!440470 (= e!259503 e!259507)))

(declare-fun res!260532 () Bool)

(assert (=> b!440470 (=> (not res!260532) (not e!259507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27045 (_ BitVec 32)) Bool)

(assert (=> b!440470 (= res!260532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202593 mask!1025))))

(assert (=> b!440470 (= lt!202593 (array!27046 (store (arr!12972 _keys!709) i!563 k!794) (size!13324 _keys!709)))))

(declare-fun b!440471 () Bool)

(assert (=> b!440471 (= e!259507 e!259508)))

(declare-fun res!260520 () Bool)

(assert (=> b!440471 (=> (not res!260520) (not e!259508))))

(assert (=> b!440471 (= res!260520 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202592 () ListLongMap!6691)

(assert (=> b!440471 (= lt!202592 (getCurrentListMapNoExtraKeys!1550 lt!202593 lt!202595 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440471 (= lt!202595 (array!27044 (store (arr!12971 _values!549) i!563 (ValueCellFull!5464 v!412)) (size!13323 _values!549)))))

(declare-fun lt!202591 () ListLongMap!6691)

(assert (=> b!440471 (= lt!202591 (getCurrentListMapNoExtraKeys!1550 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440472 () Bool)

(declare-fun res!260521 () Bool)

(assert (=> b!440472 (=> (not res!260521) (not e!259503))))

(assert (=> b!440472 (= res!260521 (or (= (select (arr!12972 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12972 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440473 () Bool)

(declare-fun res!260528 () Bool)

(assert (=> b!440473 (=> (not res!260528) (not e!259503))))

(declare-fun arrayContainsKey!0 (array!27045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440473 (= res!260528 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!440474 () Bool)

(declare-fun e!259509 () Bool)

(assert (=> b!440474 (= e!259509 tp_is_empty!11615)))

(declare-fun mapNonEmpty!19044 () Bool)

(declare-fun tp!36918 () Bool)

(assert (=> mapNonEmpty!19044 (= mapRes!19044 (and tp!36918 e!259506))))

(declare-fun mapRest!19044 () (Array (_ BitVec 32) ValueCell!5464))

(declare-fun mapKey!19044 () (_ BitVec 32))

(declare-fun mapValue!19044 () ValueCell!5464)

(assert (=> mapNonEmpty!19044 (= (arr!12971 _values!549) (store mapRest!19044 mapKey!19044 mapValue!19044))))

(declare-fun b!440475 () Bool)

(declare-fun res!260530 () Bool)

(assert (=> b!440475 (=> (not res!260530) (not e!259503))))

(assert (=> b!440475 (= res!260530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440476 () Bool)

(declare-fun res!260526 () Bool)

(assert (=> b!440476 (=> (not res!260526) (not e!259503))))

(declare-datatypes ((List!7776 0))(
  ( (Nil!7773) (Cons!7772 (h!8628 (_ BitVec 64)) (t!13532 List!7776)) )
))
(declare-fun arrayNoDuplicates!0 (array!27045 (_ BitVec 32) List!7776) Bool)

(assert (=> b!440476 (= res!260526 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7773))))

(declare-fun b!440477 () Bool)

(declare-fun res!260524 () Bool)

(assert (=> b!440477 (=> (not res!260524) (not e!259503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440477 (= res!260524 (validMask!0 mask!1025))))

(declare-fun b!440478 () Bool)

(declare-fun res!260523 () Bool)

(assert (=> b!440478 (=> (not res!260523) (not e!259503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440478 (= res!260523 (validKeyInArray!0 k!794))))

(declare-fun b!440479 () Bool)

(declare-fun res!260527 () Bool)

(assert (=> b!440479 (=> (not res!260527) (not e!259507))))

(assert (=> b!440479 (= res!260527 (bvsle from!863 i!563))))

(declare-fun res!260522 () Bool)

(assert (=> start!40196 (=> (not res!260522) (not e!259503))))

(assert (=> start!40196 (= res!260522 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13324 _keys!709))))))

(assert (=> start!40196 e!259503))

(assert (=> start!40196 tp_is_empty!11615))

(assert (=> start!40196 tp!36917))

(assert (=> start!40196 true))

(declare-fun e!259504 () Bool)

(declare-fun array_inv!9416 (array!27043) Bool)

(assert (=> start!40196 (and (array_inv!9416 _values!549) e!259504)))

(declare-fun array_inv!9417 (array!27045) Bool)

(assert (=> start!40196 (array_inv!9417 _keys!709)))

(declare-fun b!440480 () Bool)

(declare-fun res!260531 () Bool)

(assert (=> b!440480 (=> (not res!260531) (not e!259503))))

(assert (=> b!440480 (= res!260531 (and (= (size!13323 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13324 _keys!709) (size!13323 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440481 () Bool)

(declare-fun res!260525 () Bool)

(assert (=> b!440481 (=> (not res!260525) (not e!259507))))

(assert (=> b!440481 (= res!260525 (arrayNoDuplicates!0 lt!202593 #b00000000000000000000000000000000 Nil!7773))))

(declare-fun b!440482 () Bool)

(declare-fun res!260529 () Bool)

(assert (=> b!440482 (=> (not res!260529) (not e!259503))))

(assert (=> b!440482 (= res!260529 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13324 _keys!709))))))

(declare-fun b!440483 () Bool)

(assert (=> b!440483 (= e!259504 (and e!259509 mapRes!19044))))

(declare-fun condMapEmpty!19044 () Bool)

(declare-fun mapDefault!19044 () ValueCell!5464)

