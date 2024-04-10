; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40152 () Bool)

(assert start!40152)

(declare-fun b_free!10419 () Bool)

(declare-fun b_next!10419 () Bool)

(assert (=> start!40152 (= b_free!10419 (not b_next!10419))))

(declare-fun tp!36786 () Bool)

(declare-fun b_and!18387 () Bool)

(assert (=> start!40152 (= tp!36786 b_and!18387)))

(declare-fun b!439412 () Bool)

(declare-fun res!259673 () Bool)

(declare-fun e!259046 () Bool)

(assert (=> b!439412 (=> (not res!259673) (not e!259046))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439412 (= res!259673 (bvsle from!863 i!563))))

(declare-fun b!439413 () Bool)

(declare-fun res!259662 () Bool)

(declare-fun e!259047 () Bool)

(assert (=> b!439413 (=> (not res!259662) (not e!259047))))

(declare-datatypes ((array!26959 0))(
  ( (array!26960 (arr!12929 (Array (_ BitVec 32) (_ BitVec 64))) (size!13281 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26959)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26959 (_ BitVec 32)) Bool)

(assert (=> b!439413 (= res!259662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439414 () Bool)

(declare-fun res!259674 () Bool)

(assert (=> b!439414 (=> (not res!259674) (not e!259047))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439414 (= res!259674 (validKeyInArray!0 k0!794))))

(declare-fun b!439415 () Bool)

(declare-fun res!259666 () Bool)

(assert (=> b!439415 (=> (not res!259666) (not e!259047))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16533 0))(
  ( (V!16534 (val!5830 Int)) )
))
(declare-datatypes ((ValueCell!5442 0))(
  ( (ValueCellFull!5442 (v!8077 V!16533)) (EmptyCell!5442) )
))
(declare-datatypes ((array!26961 0))(
  ( (array!26962 (arr!12930 (Array (_ BitVec 32) ValueCell!5442)) (size!13282 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26961)

(assert (=> b!439415 (= res!259666 (and (= (size!13282 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13281 _keys!709) (size!13282 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!259671 () Bool)

(assert (=> start!40152 (=> (not res!259671) (not e!259047))))

(assert (=> start!40152 (= res!259671 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13281 _keys!709))))))

(assert (=> start!40152 e!259047))

(declare-fun tp_is_empty!11571 () Bool)

(assert (=> start!40152 tp_is_empty!11571))

(assert (=> start!40152 tp!36786))

(assert (=> start!40152 true))

(declare-fun e!259044 () Bool)

(declare-fun array_inv!9388 (array!26961) Bool)

(assert (=> start!40152 (and (array_inv!9388 _values!549) e!259044)))

(declare-fun array_inv!9389 (array!26959) Bool)

(assert (=> start!40152 (array_inv!9389 _keys!709)))

(declare-fun b!439416 () Bool)

(declare-fun e!259043 () Bool)

(assert (=> b!439416 (= e!259043 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!16533)

(declare-fun minValue!515 () V!16533)

(declare-fun lt!202265 () array!26959)

(declare-fun lt!202261 () array!26961)

(declare-fun zeroValue!515 () V!16533)

(declare-datatypes ((tuple2!7740 0))(
  ( (tuple2!7741 (_1!3881 (_ BitVec 64)) (_2!3881 V!16533)) )
))
(declare-datatypes ((List!7737 0))(
  ( (Nil!7734) (Cons!7733 (h!8589 tuple2!7740) (t!13493 List!7737)) )
))
(declare-datatypes ((ListLongMap!6653 0))(
  ( (ListLongMap!6654 (toList!3342 List!7737)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1531 (array!26959 array!26961 (_ BitVec 32) (_ BitVec 32) V!16533 V!16533 (_ BitVec 32) Int) ListLongMap!6653)

(declare-fun +!1483 (ListLongMap!6653 tuple2!7740) ListLongMap!6653)

(assert (=> b!439416 (= (getCurrentListMapNoExtraKeys!1531 lt!202265 lt!202261 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1483 (getCurrentListMapNoExtraKeys!1531 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7741 k0!794 v!412)))))

(declare-datatypes ((Unit!13070 0))(
  ( (Unit!13071) )
))
(declare-fun lt!202262 () Unit!13070)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!652 (array!26959 array!26961 (_ BitVec 32) (_ BitVec 32) V!16533 V!16533 (_ BitVec 32) (_ BitVec 64) V!16533 (_ BitVec 32) Int) Unit!13070)

(assert (=> b!439416 (= lt!202262 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!652 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439417 () Bool)

(declare-fun e!259041 () Bool)

(assert (=> b!439417 (= e!259041 tp_is_empty!11571)))

(declare-fun b!439418 () Bool)

(assert (=> b!439418 (= e!259046 e!259043)))

(declare-fun res!259665 () Bool)

(assert (=> b!439418 (=> (not res!259665) (not e!259043))))

(assert (=> b!439418 (= res!259665 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202263 () ListLongMap!6653)

(assert (=> b!439418 (= lt!202263 (getCurrentListMapNoExtraKeys!1531 lt!202265 lt!202261 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439418 (= lt!202261 (array!26962 (store (arr!12930 _values!549) i!563 (ValueCellFull!5442 v!412)) (size!13282 _values!549)))))

(declare-fun lt!202264 () ListLongMap!6653)

(assert (=> b!439418 (= lt!202264 (getCurrentListMapNoExtraKeys!1531 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439419 () Bool)

(declare-fun res!259663 () Bool)

(assert (=> b!439419 (=> (not res!259663) (not e!259047))))

(declare-datatypes ((List!7738 0))(
  ( (Nil!7735) (Cons!7734 (h!8590 (_ BitVec 64)) (t!13494 List!7738)) )
))
(declare-fun arrayNoDuplicates!0 (array!26959 (_ BitVec 32) List!7738) Bool)

(assert (=> b!439419 (= res!259663 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7735))))

(declare-fun mapNonEmpty!18978 () Bool)

(declare-fun mapRes!18978 () Bool)

(declare-fun tp!36785 () Bool)

(declare-fun e!259042 () Bool)

(assert (=> mapNonEmpty!18978 (= mapRes!18978 (and tp!36785 e!259042))))

(declare-fun mapValue!18978 () ValueCell!5442)

(declare-fun mapRest!18978 () (Array (_ BitVec 32) ValueCell!5442))

(declare-fun mapKey!18978 () (_ BitVec 32))

(assert (=> mapNonEmpty!18978 (= (arr!12930 _values!549) (store mapRest!18978 mapKey!18978 mapValue!18978))))

(declare-fun b!439420 () Bool)

(declare-fun res!259672 () Bool)

(assert (=> b!439420 (=> (not res!259672) (not e!259047))))

(assert (=> b!439420 (= res!259672 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13281 _keys!709))))))

(declare-fun mapIsEmpty!18978 () Bool)

(assert (=> mapIsEmpty!18978 mapRes!18978))

(declare-fun b!439421 () Bool)

(assert (=> b!439421 (= e!259047 e!259046)))

(declare-fun res!259664 () Bool)

(assert (=> b!439421 (=> (not res!259664) (not e!259046))))

(assert (=> b!439421 (= res!259664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202265 mask!1025))))

(assert (=> b!439421 (= lt!202265 (array!26960 (store (arr!12929 _keys!709) i!563 k0!794) (size!13281 _keys!709)))))

(declare-fun b!439422 () Bool)

(assert (=> b!439422 (= e!259042 tp_is_empty!11571)))

(declare-fun b!439423 () Bool)

(declare-fun res!259669 () Bool)

(assert (=> b!439423 (=> (not res!259669) (not e!259047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439423 (= res!259669 (validMask!0 mask!1025))))

(declare-fun b!439424 () Bool)

(declare-fun res!259670 () Bool)

(assert (=> b!439424 (=> (not res!259670) (not e!259047))))

(assert (=> b!439424 (= res!259670 (or (= (select (arr!12929 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12929 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439425 () Bool)

(assert (=> b!439425 (= e!259044 (and e!259041 mapRes!18978))))

(declare-fun condMapEmpty!18978 () Bool)

(declare-fun mapDefault!18978 () ValueCell!5442)

(assert (=> b!439425 (= condMapEmpty!18978 (= (arr!12930 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5442)) mapDefault!18978)))))

(declare-fun b!439426 () Bool)

(declare-fun res!259668 () Bool)

(assert (=> b!439426 (=> (not res!259668) (not e!259046))))

(assert (=> b!439426 (= res!259668 (arrayNoDuplicates!0 lt!202265 #b00000000000000000000000000000000 Nil!7735))))

(declare-fun b!439427 () Bool)

(declare-fun res!259667 () Bool)

(assert (=> b!439427 (=> (not res!259667) (not e!259047))))

(declare-fun arrayContainsKey!0 (array!26959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439427 (= res!259667 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40152 res!259671) b!439423))

(assert (= (and b!439423 res!259669) b!439415))

(assert (= (and b!439415 res!259666) b!439413))

(assert (= (and b!439413 res!259662) b!439419))

(assert (= (and b!439419 res!259663) b!439420))

(assert (= (and b!439420 res!259672) b!439414))

(assert (= (and b!439414 res!259674) b!439424))

(assert (= (and b!439424 res!259670) b!439427))

(assert (= (and b!439427 res!259667) b!439421))

(assert (= (and b!439421 res!259664) b!439426))

(assert (= (and b!439426 res!259668) b!439412))

(assert (= (and b!439412 res!259673) b!439418))

(assert (= (and b!439418 res!259665) b!439416))

(assert (= (and b!439425 condMapEmpty!18978) mapIsEmpty!18978))

(assert (= (and b!439425 (not condMapEmpty!18978)) mapNonEmpty!18978))

(get-info :version)

(assert (= (and mapNonEmpty!18978 ((_ is ValueCellFull!5442) mapValue!18978)) b!439422))

(assert (= (and b!439425 ((_ is ValueCellFull!5442) mapDefault!18978)) b!439417))

(assert (= start!40152 b!439425))

(declare-fun m!426671 () Bool)

(assert (=> b!439416 m!426671))

(declare-fun m!426673 () Bool)

(assert (=> b!439416 m!426673))

(assert (=> b!439416 m!426673))

(declare-fun m!426675 () Bool)

(assert (=> b!439416 m!426675))

(declare-fun m!426677 () Bool)

(assert (=> b!439416 m!426677))

(declare-fun m!426679 () Bool)

(assert (=> b!439418 m!426679))

(declare-fun m!426681 () Bool)

(assert (=> b!439418 m!426681))

(declare-fun m!426683 () Bool)

(assert (=> b!439418 m!426683))

(declare-fun m!426685 () Bool)

(assert (=> b!439426 m!426685))

(declare-fun m!426687 () Bool)

(assert (=> b!439414 m!426687))

(declare-fun m!426689 () Bool)

(assert (=> b!439423 m!426689))

(declare-fun m!426691 () Bool)

(assert (=> start!40152 m!426691))

(declare-fun m!426693 () Bool)

(assert (=> start!40152 m!426693))

(declare-fun m!426695 () Bool)

(assert (=> b!439421 m!426695))

(declare-fun m!426697 () Bool)

(assert (=> b!439421 m!426697))

(declare-fun m!426699 () Bool)

(assert (=> b!439424 m!426699))

(declare-fun m!426701 () Bool)

(assert (=> b!439427 m!426701))

(declare-fun m!426703 () Bool)

(assert (=> mapNonEmpty!18978 m!426703))

(declare-fun m!426705 () Bool)

(assert (=> b!439413 m!426705))

(declare-fun m!426707 () Bool)

(assert (=> b!439419 m!426707))

(check-sat b_and!18387 (not b!439416) (not b!439423) (not b!439414) (not b!439418) (not b!439426) (not mapNonEmpty!18978) tp_is_empty!11571 (not b!439419) (not b!439413) (not start!40152) (not b!439427) (not b!439421) (not b_next!10419))
(check-sat b_and!18387 (not b_next!10419))
