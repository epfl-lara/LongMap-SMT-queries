; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40196 () Bool)

(assert start!40196)

(declare-fun b_free!10477 () Bool)

(declare-fun b_next!10477 () Bool)

(assert (=> start!40196 (= b_free!10477 (not b_next!10477))))

(declare-fun tp!36959 () Bool)

(declare-fun b_and!18419 () Bool)

(assert (=> start!40196 (= tp!36959 b_and!18419)))

(declare-fun b!440533 () Bool)

(declare-fun e!259482 () Bool)

(declare-fun e!259477 () Bool)

(declare-fun mapRes!19065 () Bool)

(assert (=> b!440533 (= e!259482 (and e!259477 mapRes!19065))))

(declare-fun condMapEmpty!19065 () Bool)

(declare-datatypes ((V!16611 0))(
  ( (V!16612 (val!5859 Int)) )
))
(declare-datatypes ((ValueCell!5471 0))(
  ( (ValueCellFull!5471 (v!8100 V!16611)) (EmptyCell!5471) )
))
(declare-datatypes ((array!27075 0))(
  ( (array!27076 (arr!12987 (Array (_ BitVec 32) ValueCell!5471)) (size!13340 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27075)

(declare-fun mapDefault!19065 () ValueCell!5471)

(assert (=> b!440533 (= condMapEmpty!19065 (= (arr!12987 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5471)) mapDefault!19065)))))

(declare-fun b!440534 () Bool)

(declare-fun e!259478 () Bool)

(assert (=> b!440534 (= e!259478 (not true))))

(declare-datatypes ((array!27077 0))(
  ( (array!27078 (arr!12988 (Array (_ BitVec 32) (_ BitVec 64))) (size!13341 (_ BitVec 32))) )
))
(declare-fun lt!202463 () array!27077)

(declare-fun minValue!515 () V!16611)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202466 () array!27075)

(declare-fun zeroValue!515 () V!16611)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16611)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27077)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7808 0))(
  ( (tuple2!7809 (_1!3915 (_ BitVec 64)) (_2!3915 V!16611)) )
))
(declare-datatypes ((List!7793 0))(
  ( (Nil!7790) (Cons!7789 (h!8645 tuple2!7808) (t!13540 List!7793)) )
))
(declare-datatypes ((ListLongMap!6711 0))(
  ( (ListLongMap!6712 (toList!3371 List!7793)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1570 (array!27077 array!27075 (_ BitVec 32) (_ BitVec 32) V!16611 V!16611 (_ BitVec 32) Int) ListLongMap!6711)

(declare-fun +!1531 (ListLongMap!6711 tuple2!7808) ListLongMap!6711)

(assert (=> b!440534 (= (getCurrentListMapNoExtraKeys!1570 lt!202463 lt!202466 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1531 (getCurrentListMapNoExtraKeys!1570 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7809 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13079 0))(
  ( (Unit!13080) )
))
(declare-fun lt!202464 () Unit!13079)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!669 (array!27077 array!27075 (_ BitVec 32) (_ BitVec 32) V!16611 V!16611 (_ BitVec 32) (_ BitVec 64) V!16611 (_ BitVec 32) Int) Unit!13079)

(assert (=> b!440534 (= lt!202464 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!669 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!260669 () Bool)

(declare-fun e!259476 () Bool)

(assert (=> start!40196 (=> (not res!260669) (not e!259476))))

(assert (=> start!40196 (= res!260669 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13341 _keys!709))))))

(assert (=> start!40196 e!259476))

(declare-fun tp_is_empty!11629 () Bool)

(assert (=> start!40196 tp_is_empty!11629))

(assert (=> start!40196 tp!36959))

(assert (=> start!40196 true))

(declare-fun array_inv!9470 (array!27075) Bool)

(assert (=> start!40196 (and (array_inv!9470 _values!549) e!259482)))

(declare-fun array_inv!9471 (array!27077) Bool)

(assert (=> start!40196 (array_inv!9471 _keys!709)))

(declare-fun b!440535 () Bool)

(declare-fun res!260672 () Bool)

(assert (=> b!440535 (=> (not res!260672) (not e!259476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440535 (= res!260672 (validMask!0 mask!1025))))

(declare-fun b!440536 () Bool)

(declare-fun res!260664 () Bool)

(assert (=> b!440536 (=> (not res!260664) (not e!259476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440536 (= res!260664 (validKeyInArray!0 k0!794))))

(declare-fun b!440537 () Bool)

(declare-fun res!260676 () Bool)

(assert (=> b!440537 (=> (not res!260676) (not e!259476))))

(assert (=> b!440537 (= res!260676 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13341 _keys!709))))))

(declare-fun b!440538 () Bool)

(declare-fun res!260665 () Bool)

(declare-fun e!259481 () Bool)

(assert (=> b!440538 (=> (not res!260665) (not e!259481))))

(declare-datatypes ((List!7794 0))(
  ( (Nil!7791) (Cons!7790 (h!8646 (_ BitVec 64)) (t!13541 List!7794)) )
))
(declare-fun arrayNoDuplicates!0 (array!27077 (_ BitVec 32) List!7794) Bool)

(assert (=> b!440538 (= res!260665 (arrayNoDuplicates!0 lt!202463 #b00000000000000000000000000000000 Nil!7791))))

(declare-fun b!440539 () Bool)

(declare-fun res!260667 () Bool)

(assert (=> b!440539 (=> (not res!260667) (not e!259476))))

(assert (=> b!440539 (= res!260667 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7791))))

(declare-fun b!440540 () Bool)

(declare-fun res!260666 () Bool)

(assert (=> b!440540 (=> (not res!260666) (not e!259481))))

(assert (=> b!440540 (= res!260666 (bvsle from!863 i!563))))

(declare-fun b!440541 () Bool)

(declare-fun res!260673 () Bool)

(assert (=> b!440541 (=> (not res!260673) (not e!259476))))

(assert (=> b!440541 (= res!260673 (and (= (size!13340 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13341 _keys!709) (size!13340 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440542 () Bool)

(declare-fun res!260668 () Bool)

(assert (=> b!440542 (=> (not res!260668) (not e!259476))))

(declare-fun arrayContainsKey!0 (array!27077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440542 (= res!260668 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440543 () Bool)

(assert (=> b!440543 (= e!259477 tp_is_empty!11629)))

(declare-fun b!440544 () Bool)

(assert (=> b!440544 (= e!259476 e!259481)))

(declare-fun res!260670 () Bool)

(assert (=> b!440544 (=> (not res!260670) (not e!259481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27077 (_ BitVec 32)) Bool)

(assert (=> b!440544 (= res!260670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202463 mask!1025))))

(assert (=> b!440544 (= lt!202463 (array!27078 (store (arr!12988 _keys!709) i!563 k0!794) (size!13341 _keys!709)))))

(declare-fun b!440545 () Bool)

(declare-fun e!259479 () Bool)

(assert (=> b!440545 (= e!259479 tp_is_empty!11629)))

(declare-fun mapIsEmpty!19065 () Bool)

(assert (=> mapIsEmpty!19065 mapRes!19065))

(declare-fun b!440546 () Bool)

(declare-fun res!260674 () Bool)

(assert (=> b!440546 (=> (not res!260674) (not e!259476))))

(assert (=> b!440546 (= res!260674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440547 () Bool)

(assert (=> b!440547 (= e!259481 e!259478)))

(declare-fun res!260675 () Bool)

(assert (=> b!440547 (=> (not res!260675) (not e!259478))))

(assert (=> b!440547 (= res!260675 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202465 () ListLongMap!6711)

(assert (=> b!440547 (= lt!202465 (getCurrentListMapNoExtraKeys!1570 lt!202463 lt!202466 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440547 (= lt!202466 (array!27076 (store (arr!12987 _values!549) i!563 (ValueCellFull!5471 v!412)) (size!13340 _values!549)))))

(declare-fun lt!202462 () ListLongMap!6711)

(assert (=> b!440547 (= lt!202462 (getCurrentListMapNoExtraKeys!1570 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19065 () Bool)

(declare-fun tp!36960 () Bool)

(assert (=> mapNonEmpty!19065 (= mapRes!19065 (and tp!36960 e!259479))))

(declare-fun mapValue!19065 () ValueCell!5471)

(declare-fun mapKey!19065 () (_ BitVec 32))

(declare-fun mapRest!19065 () (Array (_ BitVec 32) ValueCell!5471))

(assert (=> mapNonEmpty!19065 (= (arr!12987 _values!549) (store mapRest!19065 mapKey!19065 mapValue!19065))))

(declare-fun b!440548 () Bool)

(declare-fun res!260671 () Bool)

(assert (=> b!440548 (=> (not res!260671) (not e!259476))))

(assert (=> b!440548 (= res!260671 (or (= (select (arr!12988 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12988 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40196 res!260669) b!440535))

(assert (= (and b!440535 res!260672) b!440541))

(assert (= (and b!440541 res!260673) b!440546))

(assert (= (and b!440546 res!260674) b!440539))

(assert (= (and b!440539 res!260667) b!440537))

(assert (= (and b!440537 res!260676) b!440536))

(assert (= (and b!440536 res!260664) b!440548))

(assert (= (and b!440548 res!260671) b!440542))

(assert (= (and b!440542 res!260668) b!440544))

(assert (= (and b!440544 res!260670) b!440538))

(assert (= (and b!440538 res!260665) b!440540))

(assert (= (and b!440540 res!260666) b!440547))

(assert (= (and b!440547 res!260675) b!440534))

(assert (= (and b!440533 condMapEmpty!19065) mapIsEmpty!19065))

(assert (= (and b!440533 (not condMapEmpty!19065)) mapNonEmpty!19065))

(get-info :version)

(assert (= (and mapNonEmpty!19065 ((_ is ValueCellFull!5471) mapValue!19065)) b!440545))

(assert (= (and b!440533 ((_ is ValueCellFull!5471) mapDefault!19065)) b!440543))

(assert (= start!40196 b!440533))

(declare-fun m!427041 () Bool)

(assert (=> b!440534 m!427041))

(declare-fun m!427043 () Bool)

(assert (=> b!440534 m!427043))

(assert (=> b!440534 m!427043))

(declare-fun m!427045 () Bool)

(assert (=> b!440534 m!427045))

(declare-fun m!427047 () Bool)

(assert (=> b!440534 m!427047))

(declare-fun m!427049 () Bool)

(assert (=> b!440536 m!427049))

(declare-fun m!427051 () Bool)

(assert (=> start!40196 m!427051))

(declare-fun m!427053 () Bool)

(assert (=> start!40196 m!427053))

(declare-fun m!427055 () Bool)

(assert (=> b!440535 m!427055))

(declare-fun m!427057 () Bool)

(assert (=> b!440548 m!427057))

(declare-fun m!427059 () Bool)

(assert (=> b!440542 m!427059))

(declare-fun m!427061 () Bool)

(assert (=> b!440539 m!427061))

(declare-fun m!427063 () Bool)

(assert (=> b!440546 m!427063))

(declare-fun m!427065 () Bool)

(assert (=> b!440547 m!427065))

(declare-fun m!427067 () Bool)

(assert (=> b!440547 m!427067))

(declare-fun m!427069 () Bool)

(assert (=> b!440547 m!427069))

(declare-fun m!427071 () Bool)

(assert (=> mapNonEmpty!19065 m!427071))

(declare-fun m!427073 () Bool)

(assert (=> b!440544 m!427073))

(declare-fun m!427075 () Bool)

(assert (=> b!440544 m!427075))

(declare-fun m!427077 () Bool)

(assert (=> b!440538 m!427077))

(check-sat (not b!440546) (not b_next!10477) (not b!440547) (not b!440544) (not start!40196) tp_is_empty!11629 b_and!18419 (not b!440534) (not mapNonEmpty!19065) (not b!440539) (not b!440542) (not b!440538) (not b!440536) (not b!440535))
(check-sat b_and!18419 (not b_next!10477))
