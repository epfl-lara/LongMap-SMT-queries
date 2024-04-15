; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40076 () Bool)

(assert start!40076)

(declare-fun b_free!10357 () Bool)

(declare-fun b_next!10357 () Bool)

(assert (=> start!40076 (= b_free!10357 (not b_next!10357))))

(declare-fun tp!36599 () Bool)

(declare-fun b_and!18299 () Bool)

(assert (=> start!40076 (= tp!36599 b_and!18299)))

(declare-fun mapIsEmpty!18885 () Bool)

(declare-fun mapRes!18885 () Bool)

(assert (=> mapIsEmpty!18885 mapRes!18885))

(declare-fun b!437653 () Bool)

(declare-fun res!258335 () Bool)

(declare-fun e!258217 () Bool)

(assert (=> b!437653 (=> (not res!258335) (not e!258217))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26837 0))(
  ( (array!26838 (arr!12868 (Array (_ BitVec 32) (_ BitVec 64))) (size!13221 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26837)

(assert (=> b!437653 (= res!258335 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13221 _keys!709))))))

(declare-fun b!437654 () Bool)

(declare-fun e!258218 () Bool)

(assert (=> b!437654 (= e!258217 e!258218)))

(declare-fun res!258331 () Bool)

(assert (=> b!437654 (=> (not res!258331) (not e!258218))))

(declare-fun lt!201565 () array!26837)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26837 (_ BitVec 32)) Bool)

(assert (=> b!437654 (= res!258331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201565 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!437654 (= lt!201565 (array!26838 (store (arr!12868 _keys!709) i!563 k0!794) (size!13221 _keys!709)))))

(declare-fun b!437655 () Bool)

(declare-fun res!258334 () Bool)

(assert (=> b!437655 (=> (not res!258334) (not e!258217))))

(declare-datatypes ((List!7691 0))(
  ( (Nil!7688) (Cons!7687 (h!8543 (_ BitVec 64)) (t!13438 List!7691)) )
))
(declare-fun arrayNoDuplicates!0 (array!26837 (_ BitVec 32) List!7691) Bool)

(assert (=> b!437655 (= res!258334 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7688))))

(declare-fun b!437656 () Bool)

(declare-fun e!258216 () Bool)

(declare-fun e!258220 () Bool)

(assert (=> b!437656 (= e!258216 (and e!258220 mapRes!18885))))

(declare-fun condMapEmpty!18885 () Bool)

(declare-datatypes ((V!16451 0))(
  ( (V!16452 (val!5799 Int)) )
))
(declare-datatypes ((ValueCell!5411 0))(
  ( (ValueCellFull!5411 (v!8040 V!16451)) (EmptyCell!5411) )
))
(declare-datatypes ((array!26839 0))(
  ( (array!26840 (arr!12869 (Array (_ BitVec 32) ValueCell!5411)) (size!13222 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26839)

(declare-fun mapDefault!18885 () ValueCell!5411)

(assert (=> b!437656 (= condMapEmpty!18885 (= (arr!12869 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5411)) mapDefault!18885)))))

(declare-fun res!258332 () Bool)

(assert (=> start!40076 (=> (not res!258332) (not e!258217))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40076 (= res!258332 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13221 _keys!709))))))

(assert (=> start!40076 e!258217))

(declare-fun tp_is_empty!11509 () Bool)

(assert (=> start!40076 tp_is_empty!11509))

(assert (=> start!40076 tp!36599))

(assert (=> start!40076 true))

(declare-fun array_inv!9394 (array!26839) Bool)

(assert (=> start!40076 (and (array_inv!9394 _values!549) e!258216)))

(declare-fun array_inv!9395 (array!26837) Bool)

(assert (=> start!40076 (array_inv!9395 _keys!709)))

(declare-fun b!437657 () Bool)

(declare-fun res!258325 () Bool)

(assert (=> b!437657 (=> (not res!258325) (not e!258217))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!437657 (= res!258325 (and (= (size!13222 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13221 _keys!709) (size!13222 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437658 () Bool)

(declare-fun e!258219 () Bool)

(assert (=> b!437658 (= e!258218 e!258219)))

(declare-fun res!258326 () Bool)

(assert (=> b!437658 (=> (not res!258326) (not e!258219))))

(assert (=> b!437658 (= res!258326 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16451)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!201566 () array!26839)

(declare-fun zeroValue!515 () V!16451)

(declare-datatypes ((tuple2!7704 0))(
  ( (tuple2!7705 (_1!3863 (_ BitVec 64)) (_2!3863 V!16451)) )
))
(declare-datatypes ((List!7692 0))(
  ( (Nil!7689) (Cons!7688 (h!8544 tuple2!7704) (t!13439 List!7692)) )
))
(declare-datatypes ((ListLongMap!6607 0))(
  ( (ListLongMap!6608 (toList!3319 List!7692)) )
))
(declare-fun lt!201564 () ListLongMap!6607)

(declare-fun getCurrentListMapNoExtraKeys!1518 (array!26837 array!26839 (_ BitVec 32) (_ BitVec 32) V!16451 V!16451 (_ BitVec 32) Int) ListLongMap!6607)

(assert (=> b!437658 (= lt!201564 (getCurrentListMapNoExtraKeys!1518 lt!201565 lt!201566 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16451)

(assert (=> b!437658 (= lt!201566 (array!26840 (store (arr!12869 _values!549) i!563 (ValueCellFull!5411 v!412)) (size!13222 _values!549)))))

(declare-fun lt!201562 () ListLongMap!6607)

(assert (=> b!437658 (= lt!201562 (getCurrentListMapNoExtraKeys!1518 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437659 () Bool)

(declare-fun res!258324 () Bool)

(assert (=> b!437659 (=> (not res!258324) (not e!258217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437659 (= res!258324 (validMask!0 mask!1025))))

(declare-fun b!437660 () Bool)

(declare-fun res!258336 () Bool)

(assert (=> b!437660 (=> (not res!258336) (not e!258218))))

(assert (=> b!437660 (= res!258336 (arrayNoDuplicates!0 lt!201565 #b00000000000000000000000000000000 Nil!7688))))

(declare-fun mapNonEmpty!18885 () Bool)

(declare-fun tp!36600 () Bool)

(declare-fun e!258222 () Bool)

(assert (=> mapNonEmpty!18885 (= mapRes!18885 (and tp!36600 e!258222))))

(declare-fun mapRest!18885 () (Array (_ BitVec 32) ValueCell!5411))

(declare-fun mapKey!18885 () (_ BitVec 32))

(declare-fun mapValue!18885 () ValueCell!5411)

(assert (=> mapNonEmpty!18885 (= (arr!12869 _values!549) (store mapRest!18885 mapKey!18885 mapValue!18885))))

(declare-fun b!437661 () Bool)

(assert (=> b!437661 (= e!258222 tp_is_empty!11509)))

(declare-fun b!437662 () Bool)

(assert (=> b!437662 (= e!258219 (not true))))

(declare-fun +!1492 (ListLongMap!6607 tuple2!7704) ListLongMap!6607)

(assert (=> b!437662 (= (getCurrentListMapNoExtraKeys!1518 lt!201565 lt!201566 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1492 (getCurrentListMapNoExtraKeys!1518 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7705 k0!794 v!412)))))

(declare-datatypes ((Unit!13001 0))(
  ( (Unit!13002) )
))
(declare-fun lt!201563 () Unit!13001)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!630 (array!26837 array!26839 (_ BitVec 32) (_ BitVec 32) V!16451 V!16451 (_ BitVec 32) (_ BitVec 64) V!16451 (_ BitVec 32) Int) Unit!13001)

(assert (=> b!437662 (= lt!201563 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!630 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437663 () Bool)

(assert (=> b!437663 (= e!258220 tp_is_empty!11509)))

(declare-fun b!437664 () Bool)

(declare-fun res!258329 () Bool)

(assert (=> b!437664 (=> (not res!258329) (not e!258218))))

(assert (=> b!437664 (= res!258329 (bvsle from!863 i!563))))

(declare-fun b!437665 () Bool)

(declare-fun res!258333 () Bool)

(assert (=> b!437665 (=> (not res!258333) (not e!258217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437665 (= res!258333 (validKeyInArray!0 k0!794))))

(declare-fun b!437666 () Bool)

(declare-fun res!258327 () Bool)

(assert (=> b!437666 (=> (not res!258327) (not e!258217))))

(declare-fun arrayContainsKey!0 (array!26837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437666 (= res!258327 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437667 () Bool)

(declare-fun res!258330 () Bool)

(assert (=> b!437667 (=> (not res!258330) (not e!258217))))

(assert (=> b!437667 (= res!258330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437668 () Bool)

(declare-fun res!258328 () Bool)

(assert (=> b!437668 (=> (not res!258328) (not e!258217))))

(assert (=> b!437668 (= res!258328 (or (= (select (arr!12868 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12868 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40076 res!258332) b!437659))

(assert (= (and b!437659 res!258324) b!437657))

(assert (= (and b!437657 res!258325) b!437667))

(assert (= (and b!437667 res!258330) b!437655))

(assert (= (and b!437655 res!258334) b!437653))

(assert (= (and b!437653 res!258335) b!437665))

(assert (= (and b!437665 res!258333) b!437668))

(assert (= (and b!437668 res!258328) b!437666))

(assert (= (and b!437666 res!258327) b!437654))

(assert (= (and b!437654 res!258331) b!437660))

(assert (= (and b!437660 res!258336) b!437664))

(assert (= (and b!437664 res!258329) b!437658))

(assert (= (and b!437658 res!258326) b!437662))

(assert (= (and b!437656 condMapEmpty!18885) mapIsEmpty!18885))

(assert (= (and b!437656 (not condMapEmpty!18885)) mapNonEmpty!18885))

(get-info :version)

(assert (= (and mapNonEmpty!18885 ((_ is ValueCellFull!5411) mapValue!18885)) b!437661))

(assert (= (and b!437656 ((_ is ValueCellFull!5411) mapDefault!18885)) b!437663))

(assert (= start!40076 b!437656))

(declare-fun m!424761 () Bool)

(assert (=> start!40076 m!424761))

(declare-fun m!424763 () Bool)

(assert (=> start!40076 m!424763))

(declare-fun m!424765 () Bool)

(assert (=> b!437655 m!424765))

(declare-fun m!424767 () Bool)

(assert (=> b!437659 m!424767))

(declare-fun m!424769 () Bool)

(assert (=> b!437668 m!424769))

(declare-fun m!424771 () Bool)

(assert (=> b!437666 m!424771))

(declare-fun m!424773 () Bool)

(assert (=> b!437658 m!424773))

(declare-fun m!424775 () Bool)

(assert (=> b!437658 m!424775))

(declare-fun m!424777 () Bool)

(assert (=> b!437658 m!424777))

(declare-fun m!424779 () Bool)

(assert (=> b!437660 m!424779))

(declare-fun m!424781 () Bool)

(assert (=> b!437665 m!424781))

(declare-fun m!424783 () Bool)

(assert (=> b!437654 m!424783))

(declare-fun m!424785 () Bool)

(assert (=> b!437654 m!424785))

(declare-fun m!424787 () Bool)

(assert (=> b!437667 m!424787))

(declare-fun m!424789 () Bool)

(assert (=> mapNonEmpty!18885 m!424789))

(declare-fun m!424791 () Bool)

(assert (=> b!437662 m!424791))

(declare-fun m!424793 () Bool)

(assert (=> b!437662 m!424793))

(assert (=> b!437662 m!424793))

(declare-fun m!424795 () Bool)

(assert (=> b!437662 m!424795))

(declare-fun m!424797 () Bool)

(assert (=> b!437662 m!424797))

(check-sat (not b!437658) tp_is_empty!11509 (not b!437659) b_and!18299 (not b_next!10357) (not b!437662) (not mapNonEmpty!18885) (not b!437654) (not b!437665) (not b!437666) (not b!437655) (not start!40076) (not b!437667) (not b!437660))
(check-sat b_and!18299 (not b_next!10357))
