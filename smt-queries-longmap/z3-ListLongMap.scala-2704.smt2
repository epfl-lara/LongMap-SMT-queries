; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40028 () Bool)

(assert start!40028)

(declare-fun b_free!10309 () Bool)

(declare-fun b_next!10309 () Bool)

(assert (=> start!40028 (= b_free!10309 (not b_next!10309))))

(declare-fun tp!36455 () Bool)

(declare-fun b_and!18291 () Bool)

(assert (=> start!40028 (= tp!36455 b_and!18291)))

(declare-fun b!436723 () Bool)

(declare-fun res!257522 () Bool)

(declare-fun e!257860 () Bool)

(assert (=> b!436723 (=> (not res!257522) (not e!257860))))

(declare-datatypes ((array!26748 0))(
  ( (array!26749 (arr!12823 (Array (_ BitVec 32) (_ BitVec 64))) (size!13175 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26748)

(declare-datatypes ((List!7545 0))(
  ( (Nil!7542) (Cons!7541 (h!8397 (_ BitVec 64)) (t!13293 List!7545)) )
))
(declare-fun arrayNoDuplicates!0 (array!26748 (_ BitVec 32) List!7545) Bool)

(assert (=> b!436723 (= res!257522 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7542))))

(declare-fun b!436724 () Bool)

(declare-fun res!257515 () Bool)

(assert (=> b!436724 (=> (not res!257515) (not e!257860))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436724 (= res!257515 (validKeyInArray!0 k0!794))))

(declare-fun b!436725 () Bool)

(declare-fun e!257857 () Bool)

(assert (=> b!436725 (= e!257857 (not true))))

(declare-datatypes ((V!16387 0))(
  ( (V!16388 (val!5775 Int)) )
))
(declare-fun minValue!515 () V!16387)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5387 0))(
  ( (ValueCellFull!5387 (v!8023 V!16387)) (EmptyCell!5387) )
))
(declare-datatypes ((array!26750 0))(
  ( (array!26751 (arr!12824 (Array (_ BitVec 32) ValueCell!5387)) (size!13176 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26750)

(declare-fun zeroValue!515 () V!16387)

(declare-fun lt!201456 () array!26748)

(declare-fun v!412 () V!16387)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!201458 () array!26750)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7556 0))(
  ( (tuple2!7557 (_1!3789 (_ BitVec 64)) (_2!3789 V!16387)) )
))
(declare-datatypes ((List!7546 0))(
  ( (Nil!7543) (Cons!7542 (h!8398 tuple2!7556) (t!13294 List!7546)) )
))
(declare-datatypes ((ListLongMap!6471 0))(
  ( (ListLongMap!6472 (toList!3251 List!7546)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1484 (array!26748 array!26750 (_ BitVec 32) (_ BitVec 32) V!16387 V!16387 (_ BitVec 32) Int) ListLongMap!6471)

(declare-fun +!1454 (ListLongMap!6471 tuple2!7556) ListLongMap!6471)

(assert (=> b!436725 (= (getCurrentListMapNoExtraKeys!1484 lt!201456 lt!201458 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1454 (getCurrentListMapNoExtraKeys!1484 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7557 k0!794 v!412)))))

(declare-datatypes ((Unit!12983 0))(
  ( (Unit!12984) )
))
(declare-fun lt!201457 () Unit!12983)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!614 (array!26748 array!26750 (_ BitVec 32) (_ BitVec 32) V!16387 V!16387 (_ BitVec 32) (_ BitVec 64) V!16387 (_ BitVec 32) Int) Unit!12983)

(assert (=> b!436725 (= lt!201457 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!614 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436726 () Bool)

(declare-fun res!257523 () Bool)

(assert (=> b!436726 (=> (not res!257523) (not e!257860))))

(declare-fun arrayContainsKey!0 (array!26748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436726 (= res!257523 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436727 () Bool)

(declare-fun res!257518 () Bool)

(declare-fun e!257856 () Bool)

(assert (=> b!436727 (=> (not res!257518) (not e!257856))))

(assert (=> b!436727 (= res!257518 (arrayNoDuplicates!0 lt!201456 #b00000000000000000000000000000000 Nil!7542))))

(declare-fun b!436728 () Bool)

(declare-fun res!257525 () Bool)

(assert (=> b!436728 (=> (not res!257525) (not e!257860))))

(assert (=> b!436728 (= res!257525 (and (= (size!13176 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13175 _keys!709) (size!13176 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436729 () Bool)

(assert (=> b!436729 (= e!257856 e!257857)))

(declare-fun res!257517 () Bool)

(assert (=> b!436729 (=> (not res!257517) (not e!257857))))

(assert (=> b!436729 (= res!257517 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201459 () ListLongMap!6471)

(assert (=> b!436729 (= lt!201459 (getCurrentListMapNoExtraKeys!1484 lt!201456 lt!201458 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436729 (= lt!201458 (array!26751 (store (arr!12824 _values!549) i!563 (ValueCellFull!5387 v!412)) (size!13176 _values!549)))))

(declare-fun lt!201455 () ListLongMap!6471)

(assert (=> b!436729 (= lt!201455 (getCurrentListMapNoExtraKeys!1484 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!257514 () Bool)

(assert (=> start!40028 (=> (not res!257514) (not e!257860))))

(assert (=> start!40028 (= res!257514 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13175 _keys!709))))))

(assert (=> start!40028 e!257860))

(declare-fun tp_is_empty!11461 () Bool)

(assert (=> start!40028 tp_is_empty!11461))

(assert (=> start!40028 tp!36455))

(assert (=> start!40028 true))

(declare-fun e!257858 () Bool)

(declare-fun array_inv!9380 (array!26750) Bool)

(assert (=> start!40028 (and (array_inv!9380 _values!549) e!257858)))

(declare-fun array_inv!9381 (array!26748) Bool)

(assert (=> start!40028 (array_inv!9381 _keys!709)))

(declare-fun b!436730 () Bool)

(assert (=> b!436730 (= e!257860 e!257856)))

(declare-fun res!257524 () Bool)

(assert (=> b!436730 (=> (not res!257524) (not e!257856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26748 (_ BitVec 32)) Bool)

(assert (=> b!436730 (= res!257524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201456 mask!1025))))

(assert (=> b!436730 (= lt!201456 (array!26749 (store (arr!12823 _keys!709) i!563 k0!794) (size!13175 _keys!709)))))

(declare-fun b!436731 () Bool)

(declare-fun res!257516 () Bool)

(assert (=> b!436731 (=> (not res!257516) (not e!257860))))

(assert (=> b!436731 (= res!257516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436732 () Bool)

(declare-fun e!257855 () Bool)

(assert (=> b!436732 (= e!257855 tp_is_empty!11461)))

(declare-fun b!436733 () Bool)

(declare-fun res!257520 () Bool)

(assert (=> b!436733 (=> (not res!257520) (not e!257856))))

(assert (=> b!436733 (= res!257520 (bvsle from!863 i!563))))

(declare-fun b!436734 () Bool)

(declare-fun res!257526 () Bool)

(assert (=> b!436734 (=> (not res!257526) (not e!257860))))

(assert (=> b!436734 (= res!257526 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13175 _keys!709))))))

(declare-fun b!436735 () Bool)

(declare-fun res!257521 () Bool)

(assert (=> b!436735 (=> (not res!257521) (not e!257860))))

(assert (=> b!436735 (= res!257521 (or (= (select (arr!12823 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12823 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436736 () Bool)

(declare-fun res!257519 () Bool)

(assert (=> b!436736 (=> (not res!257519) (not e!257860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436736 (= res!257519 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18813 () Bool)

(declare-fun mapRes!18813 () Bool)

(assert (=> mapIsEmpty!18813 mapRes!18813))

(declare-fun mapNonEmpty!18813 () Bool)

(declare-fun tp!36456 () Bool)

(declare-fun e!257859 () Bool)

(assert (=> mapNonEmpty!18813 (= mapRes!18813 (and tp!36456 e!257859))))

(declare-fun mapKey!18813 () (_ BitVec 32))

(declare-fun mapRest!18813 () (Array (_ BitVec 32) ValueCell!5387))

(declare-fun mapValue!18813 () ValueCell!5387)

(assert (=> mapNonEmpty!18813 (= (arr!12824 _values!549) (store mapRest!18813 mapKey!18813 mapValue!18813))))

(declare-fun b!436737 () Bool)

(assert (=> b!436737 (= e!257859 tp_is_empty!11461)))

(declare-fun b!436738 () Bool)

(assert (=> b!436738 (= e!257858 (and e!257855 mapRes!18813))))

(declare-fun condMapEmpty!18813 () Bool)

(declare-fun mapDefault!18813 () ValueCell!5387)

(assert (=> b!436738 (= condMapEmpty!18813 (= (arr!12824 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5387)) mapDefault!18813)))))

(assert (= (and start!40028 res!257514) b!436736))

(assert (= (and b!436736 res!257519) b!436728))

(assert (= (and b!436728 res!257525) b!436731))

(assert (= (and b!436731 res!257516) b!436723))

(assert (= (and b!436723 res!257522) b!436734))

(assert (= (and b!436734 res!257526) b!436724))

(assert (= (and b!436724 res!257515) b!436735))

(assert (= (and b!436735 res!257521) b!436726))

(assert (= (and b!436726 res!257523) b!436730))

(assert (= (and b!436730 res!257524) b!436727))

(assert (= (and b!436727 res!257518) b!436733))

(assert (= (and b!436733 res!257520) b!436729))

(assert (= (and b!436729 res!257517) b!436725))

(assert (= (and b!436738 condMapEmpty!18813) mapIsEmpty!18813))

(assert (= (and b!436738 (not condMapEmpty!18813)) mapNonEmpty!18813))

(get-info :version)

(assert (= (and mapNonEmpty!18813 ((_ is ValueCellFull!5387) mapValue!18813)) b!436737))

(assert (= (and b!436738 ((_ is ValueCellFull!5387) mapDefault!18813)) b!436732))

(assert (= start!40028 b!436738))

(declare-fun m!424799 () Bool)

(assert (=> b!436725 m!424799))

(declare-fun m!424801 () Bool)

(assert (=> b!436725 m!424801))

(assert (=> b!436725 m!424801))

(declare-fun m!424803 () Bool)

(assert (=> b!436725 m!424803))

(declare-fun m!424805 () Bool)

(assert (=> b!436725 m!424805))

(declare-fun m!424807 () Bool)

(assert (=> mapNonEmpty!18813 m!424807))

(declare-fun m!424809 () Bool)

(assert (=> start!40028 m!424809))

(declare-fun m!424811 () Bool)

(assert (=> start!40028 m!424811))

(declare-fun m!424813 () Bool)

(assert (=> b!436726 m!424813))

(declare-fun m!424815 () Bool)

(assert (=> b!436727 m!424815))

(declare-fun m!424817 () Bool)

(assert (=> b!436731 m!424817))

(declare-fun m!424819 () Bool)

(assert (=> b!436736 m!424819))

(declare-fun m!424821 () Bool)

(assert (=> b!436730 m!424821))

(declare-fun m!424823 () Bool)

(assert (=> b!436730 m!424823))

(declare-fun m!424825 () Bool)

(assert (=> b!436723 m!424825))

(declare-fun m!424827 () Bool)

(assert (=> b!436735 m!424827))

(declare-fun m!424829 () Bool)

(assert (=> b!436724 m!424829))

(declare-fun m!424831 () Bool)

(assert (=> b!436729 m!424831))

(declare-fun m!424833 () Bool)

(assert (=> b!436729 m!424833))

(declare-fun m!424835 () Bool)

(assert (=> b!436729 m!424835))

(check-sat (not b!436724) (not b!436723) (not mapNonEmpty!18813) (not start!40028) (not b!436731) (not b!436727) (not b_next!10309) tp_is_empty!11461 (not b!436725) (not b!436730) (not b!436729) (not b!436726) b_and!18291 (not b!436736))
(check-sat b_and!18291 (not b_next!10309))
