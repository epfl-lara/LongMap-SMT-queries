; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40410 () Bool)

(assert start!40410)

(declare-fun b!444565 () Bool)

(declare-fun res!263676 () Bool)

(declare-fun e!261423 () Bool)

(assert (=> b!444565 (=> (not res!263676) (not e!261423))))

(declare-datatypes ((array!27432 0))(
  ( (array!27433 (arr!13163 (Array (_ BitVec 32) (_ BitVec 64))) (size!13515 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27432)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16851 0))(
  ( (V!16852 (val!5949 Int)) )
))
(declare-datatypes ((ValueCell!5561 0))(
  ( (ValueCellFull!5561 (v!8201 V!16851)) (EmptyCell!5561) )
))
(declare-datatypes ((array!27434 0))(
  ( (array!27435 (arr!13164 (Array (_ BitVec 32) ValueCell!5561)) (size!13516 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27434)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444565 (= res!263676 (and (= (size!13516 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13515 _keys!709) (size!13516 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444566 () Bool)

(declare-fun res!263670 () Bool)

(assert (=> b!444566 (=> (not res!263670) (not e!261423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444566 (= res!263670 (validMask!0 mask!1025))))

(declare-fun b!444567 () Bool)

(declare-fun e!261425 () Bool)

(declare-fun tp_is_empty!11809 () Bool)

(assert (=> b!444567 (= e!261425 tp_is_empty!11809)))

(declare-fun b!444568 () Bool)

(declare-fun res!263673 () Bool)

(assert (=> b!444568 (=> (not res!263673) (not e!261423))))

(declare-datatypes ((List!7788 0))(
  ( (Nil!7785) (Cons!7784 (h!8640 (_ BitVec 64)) (t!13538 List!7788)) )
))
(declare-fun arrayNoDuplicates!0 (array!27432 (_ BitVec 32) List!7788) Bool)

(assert (=> b!444568 (= res!263673 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7785))))

(declare-fun mapNonEmpty!19341 () Bool)

(declare-fun mapRes!19341 () Bool)

(declare-fun tp!37323 () Bool)

(assert (=> mapNonEmpty!19341 (= mapRes!19341 (and tp!37323 e!261425))))

(declare-fun mapKey!19341 () (_ BitVec 32))

(declare-fun mapRest!19341 () (Array (_ BitVec 32) ValueCell!5561))

(declare-fun mapValue!19341 () ValueCell!5561)

(assert (=> mapNonEmpty!19341 (= (arr!13164 _values!549) (store mapRest!19341 mapKey!19341 mapValue!19341))))

(declare-fun b!444569 () Bool)

(declare-fun res!263669 () Bool)

(assert (=> b!444569 (=> (not res!263669) (not e!261423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27432 (_ BitVec 32)) Bool)

(assert (=> b!444569 (= res!263669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444570 () Bool)

(declare-fun e!261422 () Bool)

(assert (=> b!444570 (= e!261422 tp_is_empty!11809)))

(declare-fun b!444571 () Bool)

(declare-fun res!263675 () Bool)

(assert (=> b!444571 (=> (not res!263675) (not e!261423))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444571 (= res!263675 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444572 () Bool)

(declare-fun res!263671 () Bool)

(assert (=> b!444572 (=> (not res!263671) (not e!261423))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444572 (= res!263671 (or (= (select (arr!13163 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13163 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444573 () Bool)

(declare-fun e!261424 () Bool)

(assert (=> b!444573 (= e!261424 false)))

(declare-fun lt!203537 () Bool)

(declare-fun lt!203538 () array!27432)

(assert (=> b!444573 (= lt!203537 (arrayNoDuplicates!0 lt!203538 #b00000000000000000000000000000000 Nil!7785))))

(declare-fun mapIsEmpty!19341 () Bool)

(assert (=> mapIsEmpty!19341 mapRes!19341))

(declare-fun b!444574 () Bool)

(declare-fun res!263672 () Bool)

(assert (=> b!444574 (=> (not res!263672) (not e!261423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444574 (= res!263672 (validKeyInArray!0 k0!794))))

(declare-fun b!444575 () Bool)

(declare-fun res!263674 () Bool)

(assert (=> b!444575 (=> (not res!263674) (not e!261423))))

(assert (=> b!444575 (= res!263674 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13515 _keys!709))))))

(declare-fun b!444576 () Bool)

(assert (=> b!444576 (= e!261423 e!261424)))

(declare-fun res!263677 () Bool)

(assert (=> b!444576 (=> (not res!263677) (not e!261424))))

(assert (=> b!444576 (= res!263677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203538 mask!1025))))

(assert (=> b!444576 (= lt!203538 (array!27433 (store (arr!13163 _keys!709) i!563 k0!794) (size!13515 _keys!709)))))

(declare-fun res!263668 () Bool)

(assert (=> start!40410 (=> (not res!263668) (not e!261423))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40410 (= res!263668 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13515 _keys!709))))))

(assert (=> start!40410 e!261423))

(assert (=> start!40410 true))

(declare-fun e!261421 () Bool)

(declare-fun array_inv!9622 (array!27434) Bool)

(assert (=> start!40410 (and (array_inv!9622 _values!549) e!261421)))

(declare-fun array_inv!9623 (array!27432) Bool)

(assert (=> start!40410 (array_inv!9623 _keys!709)))

(declare-fun b!444577 () Bool)

(assert (=> b!444577 (= e!261421 (and e!261422 mapRes!19341))))

(declare-fun condMapEmpty!19341 () Bool)

(declare-fun mapDefault!19341 () ValueCell!5561)

(assert (=> b!444577 (= condMapEmpty!19341 (= (arr!13164 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5561)) mapDefault!19341)))))

(assert (= (and start!40410 res!263668) b!444566))

(assert (= (and b!444566 res!263670) b!444565))

(assert (= (and b!444565 res!263676) b!444569))

(assert (= (and b!444569 res!263669) b!444568))

(assert (= (and b!444568 res!263673) b!444575))

(assert (= (and b!444575 res!263674) b!444574))

(assert (= (and b!444574 res!263672) b!444572))

(assert (= (and b!444572 res!263671) b!444571))

(assert (= (and b!444571 res!263675) b!444576))

(assert (= (and b!444576 res!263677) b!444573))

(assert (= (and b!444577 condMapEmpty!19341) mapIsEmpty!19341))

(assert (= (and b!444577 (not condMapEmpty!19341)) mapNonEmpty!19341))

(get-info :version)

(assert (= (and mapNonEmpty!19341 ((_ is ValueCellFull!5561) mapValue!19341)) b!444567))

(assert (= (and b!444577 ((_ is ValueCellFull!5561) mapDefault!19341)) b!444570))

(assert (= start!40410 b!444577))

(declare-fun m!430647 () Bool)

(assert (=> b!444572 m!430647))

(declare-fun m!430649 () Bool)

(assert (=> b!444574 m!430649))

(declare-fun m!430651 () Bool)

(assert (=> b!444576 m!430651))

(declare-fun m!430653 () Bool)

(assert (=> b!444576 m!430653))

(declare-fun m!430655 () Bool)

(assert (=> b!444573 m!430655))

(declare-fun m!430657 () Bool)

(assert (=> b!444569 m!430657))

(declare-fun m!430659 () Bool)

(assert (=> b!444566 m!430659))

(declare-fun m!430661 () Bool)

(assert (=> b!444568 m!430661))

(declare-fun m!430663 () Bool)

(assert (=> mapNonEmpty!19341 m!430663))

(declare-fun m!430665 () Bool)

(assert (=> b!444571 m!430665))

(declare-fun m!430667 () Bool)

(assert (=> start!40410 m!430667))

(declare-fun m!430669 () Bool)

(assert (=> start!40410 m!430669))

(check-sat (not b!444576) (not b!444574) (not b!444566) (not mapNonEmpty!19341) (not start!40410) tp_is_empty!11809 (not b!444573) (not b!444569) (not b!444568) (not b!444571))
(check-sat)
