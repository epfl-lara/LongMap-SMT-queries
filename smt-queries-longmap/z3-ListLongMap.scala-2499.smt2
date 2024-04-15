; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38798 () Bool)

(assert start!38798)

(declare-fun b!404755 () Bool)

(declare-fun res!233561 () Bool)

(declare-fun e!243412 () Bool)

(assert (=> b!404755 (=> (not res!233561) (not e!243412))))

(declare-datatypes ((array!24337 0))(
  ( (array!24338 (arr!11618 (Array (_ BitVec 32) (_ BitVec 64))) (size!11971 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24337)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404755 (= res!233561 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16968 () Bool)

(declare-fun mapRes!16968 () Bool)

(assert (=> mapIsEmpty!16968 mapRes!16968))

(declare-fun b!404756 () Bool)

(declare-fun res!233560 () Bool)

(assert (=> b!404756 (=> (not res!233560) (not e!243412))))

(declare-datatypes ((List!6736 0))(
  ( (Nil!6733) (Cons!6732 (h!7588 (_ BitVec 64)) (t!11901 List!6736)) )
))
(declare-fun arrayNoDuplicates!0 (array!24337 (_ BitVec 32) List!6736) Bool)

(assert (=> b!404756 (= res!233560 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6733))))

(declare-fun b!404757 () Bool)

(declare-fun res!233563 () Bool)

(assert (=> b!404757 (=> (not res!233563) (not e!243412))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14747 0))(
  ( (V!14748 (val!5160 Int)) )
))
(declare-datatypes ((ValueCell!4772 0))(
  ( (ValueCellFull!4772 (v!7401 V!14747)) (EmptyCell!4772) )
))
(declare-datatypes ((array!24339 0))(
  ( (array!24340 (arr!11619 (Array (_ BitVec 32) ValueCell!4772)) (size!11972 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24339)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404757 (= res!233563 (and (= (size!11972 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11971 _keys!709) (size!11972 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16968 () Bool)

(declare-fun tp!33087 () Bool)

(declare-fun e!243409 () Bool)

(assert (=> mapNonEmpty!16968 (= mapRes!16968 (and tp!33087 e!243409))))

(declare-fun mapValue!16968 () ValueCell!4772)

(declare-fun mapRest!16968 () (Array (_ BitVec 32) ValueCell!4772))

(declare-fun mapKey!16968 () (_ BitVec 32))

(assert (=> mapNonEmpty!16968 (= (arr!11619 _values!549) (store mapRest!16968 mapKey!16968 mapValue!16968))))

(declare-fun b!404758 () Bool)

(declare-fun e!243414 () Bool)

(assert (=> b!404758 (= e!243412 e!243414)))

(declare-fun res!233564 () Bool)

(assert (=> b!404758 (=> (not res!233564) (not e!243414))))

(declare-fun lt!188038 () array!24337)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24337 (_ BitVec 32)) Bool)

(assert (=> b!404758 (= res!233564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188038 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404758 (= lt!188038 (array!24338 (store (arr!11618 _keys!709) i!563 k0!794) (size!11971 _keys!709)))))

(declare-fun b!404759 () Bool)

(declare-fun res!233566 () Bool)

(assert (=> b!404759 (=> (not res!233566) (not e!243412))))

(assert (=> b!404759 (= res!233566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404760 () Bool)

(declare-fun res!233559 () Bool)

(assert (=> b!404760 (=> (not res!233559) (not e!243412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404760 (= res!233559 (validKeyInArray!0 k0!794))))

(declare-fun res!233567 () Bool)

(assert (=> start!38798 (=> (not res!233567) (not e!243412))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38798 (= res!233567 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11971 _keys!709))))))

(assert (=> start!38798 e!243412))

(assert (=> start!38798 true))

(declare-fun e!243413 () Bool)

(declare-fun array_inv!8526 (array!24339) Bool)

(assert (=> start!38798 (and (array_inv!8526 _values!549) e!243413)))

(declare-fun array_inv!8527 (array!24337) Bool)

(assert (=> start!38798 (array_inv!8527 _keys!709)))

(declare-fun b!404761 () Bool)

(declare-fun res!233568 () Bool)

(assert (=> b!404761 (=> (not res!233568) (not e!243412))))

(assert (=> b!404761 (= res!233568 (or (= (select (arr!11618 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11618 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404762 () Bool)

(declare-fun e!243410 () Bool)

(assert (=> b!404762 (= e!243413 (and e!243410 mapRes!16968))))

(declare-fun condMapEmpty!16968 () Bool)

(declare-fun mapDefault!16968 () ValueCell!4772)

(assert (=> b!404762 (= condMapEmpty!16968 (= (arr!11619 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4772)) mapDefault!16968)))))

(declare-fun b!404763 () Bool)

(declare-fun res!233565 () Bool)

(assert (=> b!404763 (=> (not res!233565) (not e!243412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404763 (= res!233565 (validMask!0 mask!1025))))

(declare-fun b!404764 () Bool)

(assert (=> b!404764 (= e!243414 false)))

(declare-fun lt!188039 () Bool)

(assert (=> b!404764 (= lt!188039 (arrayNoDuplicates!0 lt!188038 #b00000000000000000000000000000000 Nil!6733))))

(declare-fun b!404765 () Bool)

(declare-fun res!233562 () Bool)

(assert (=> b!404765 (=> (not res!233562) (not e!243412))))

(assert (=> b!404765 (= res!233562 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11971 _keys!709))))))

(declare-fun b!404766 () Bool)

(declare-fun tp_is_empty!10231 () Bool)

(assert (=> b!404766 (= e!243409 tp_is_empty!10231)))

(declare-fun b!404767 () Bool)

(assert (=> b!404767 (= e!243410 tp_is_empty!10231)))

(assert (= (and start!38798 res!233567) b!404763))

(assert (= (and b!404763 res!233565) b!404757))

(assert (= (and b!404757 res!233563) b!404759))

(assert (= (and b!404759 res!233566) b!404756))

(assert (= (and b!404756 res!233560) b!404765))

(assert (= (and b!404765 res!233562) b!404760))

(assert (= (and b!404760 res!233559) b!404761))

(assert (= (and b!404761 res!233568) b!404755))

(assert (= (and b!404755 res!233561) b!404758))

(assert (= (and b!404758 res!233564) b!404764))

(assert (= (and b!404762 condMapEmpty!16968) mapIsEmpty!16968))

(assert (= (and b!404762 (not condMapEmpty!16968)) mapNonEmpty!16968))

(get-info :version)

(assert (= (and mapNonEmpty!16968 ((_ is ValueCellFull!4772) mapValue!16968)) b!404766))

(assert (= (and b!404762 ((_ is ValueCellFull!4772) mapDefault!16968)) b!404767))

(assert (= start!38798 b!404762))

(declare-fun m!396915 () Bool)

(assert (=> b!404758 m!396915))

(declare-fun m!396917 () Bool)

(assert (=> b!404758 m!396917))

(declare-fun m!396919 () Bool)

(assert (=> b!404764 m!396919))

(declare-fun m!396921 () Bool)

(assert (=> b!404760 m!396921))

(declare-fun m!396923 () Bool)

(assert (=> b!404755 m!396923))

(declare-fun m!396925 () Bool)

(assert (=> b!404759 m!396925))

(declare-fun m!396927 () Bool)

(assert (=> b!404756 m!396927))

(declare-fun m!396929 () Bool)

(assert (=> b!404761 m!396929))

(declare-fun m!396931 () Bool)

(assert (=> mapNonEmpty!16968 m!396931))

(declare-fun m!396933 () Bool)

(assert (=> start!38798 m!396933))

(declare-fun m!396935 () Bool)

(assert (=> start!38798 m!396935))

(declare-fun m!396937 () Bool)

(assert (=> b!404763 m!396937))

(check-sat (not b!404764) (not b!404756) (not b!404758) (not b!404763) tp_is_empty!10231 (not mapNonEmpty!16968) (not b!404759) (not b!404755) (not b!404760) (not start!38798))
(check-sat)
