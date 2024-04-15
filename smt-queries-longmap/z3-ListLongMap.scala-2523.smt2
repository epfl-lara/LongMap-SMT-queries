; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38942 () Bool)

(assert start!38942)

(declare-fun b!407563 () Bool)

(declare-fun res!235728 () Bool)

(declare-fun e!244707 () Bool)

(assert (=> b!407563 (=> (not res!235728) (not e!244707))))

(declare-datatypes ((array!24621 0))(
  ( (array!24622 (arr!11760 (Array (_ BitVec 32) (_ BitVec 64))) (size!12113 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24621)

(declare-datatypes ((List!6795 0))(
  ( (Nil!6792) (Cons!6791 (h!7647 (_ BitVec 64)) (t!11960 List!6795)) )
))
(declare-fun arrayNoDuplicates!0 (array!24621 (_ BitVec 32) List!6795) Bool)

(assert (=> b!407563 (= res!235728 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6792))))

(declare-fun b!407564 () Bool)

(declare-fun res!235725 () Bool)

(assert (=> b!407564 (=> (not res!235725) (not e!244707))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407564 (= res!235725 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12113 _keys!709))))))

(declare-fun b!407565 () Bool)

(declare-fun e!244705 () Bool)

(assert (=> b!407565 (= e!244705 false)))

(declare-fun lt!188471 () Bool)

(declare-fun lt!188470 () array!24621)

(assert (=> b!407565 (= lt!188471 (arrayNoDuplicates!0 lt!188470 #b00000000000000000000000000000000 Nil!6792))))

(declare-fun mapIsEmpty!17184 () Bool)

(declare-fun mapRes!17184 () Bool)

(assert (=> mapIsEmpty!17184 mapRes!17184))

(declare-fun b!407566 () Bool)

(declare-fun res!235727 () Bool)

(assert (=> b!407566 (=> (not res!235727) (not e!244707))))

(assert (=> b!407566 (= res!235727 (or (= (select (arr!11760 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11760 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407567 () Bool)

(declare-fun e!244709 () Bool)

(declare-fun tp_is_empty!10375 () Bool)

(assert (=> b!407567 (= e!244709 tp_is_empty!10375)))

(declare-fun res!235721 () Bool)

(assert (=> start!38942 (=> (not res!235721) (not e!244707))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38942 (= res!235721 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12113 _keys!709))))))

(assert (=> start!38942 e!244707))

(assert (=> start!38942 true))

(declare-datatypes ((V!14939 0))(
  ( (V!14940 (val!5232 Int)) )
))
(declare-datatypes ((ValueCell!4844 0))(
  ( (ValueCellFull!4844 (v!7473 V!14939)) (EmptyCell!4844) )
))
(declare-datatypes ((array!24623 0))(
  ( (array!24624 (arr!11761 (Array (_ BitVec 32) ValueCell!4844)) (size!12114 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24623)

(declare-fun e!244710 () Bool)

(declare-fun array_inv!8626 (array!24623) Bool)

(assert (=> start!38942 (and (array_inv!8626 _values!549) e!244710)))

(declare-fun array_inv!8627 (array!24621) Bool)

(assert (=> start!38942 (array_inv!8627 _keys!709)))

(declare-fun b!407568 () Bool)

(declare-fun res!235719 () Bool)

(assert (=> b!407568 (=> (not res!235719) (not e!244707))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24621 (_ BitVec 32)) Bool)

(assert (=> b!407568 (= res!235719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407569 () Bool)

(declare-fun res!235720 () Bool)

(assert (=> b!407569 (=> (not res!235720) (not e!244707))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407569 (= res!235720 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407570 () Bool)

(declare-fun e!244706 () Bool)

(assert (=> b!407570 (= e!244710 (and e!244706 mapRes!17184))))

(declare-fun condMapEmpty!17184 () Bool)

(declare-fun mapDefault!17184 () ValueCell!4844)

(assert (=> b!407570 (= condMapEmpty!17184 (= (arr!11761 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4844)) mapDefault!17184)))))

(declare-fun b!407571 () Bool)

(declare-fun res!235722 () Bool)

(assert (=> b!407571 (=> (not res!235722) (not e!244707))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407571 (= res!235722 (and (= (size!12114 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12113 _keys!709) (size!12114 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407572 () Bool)

(declare-fun res!235723 () Bool)

(assert (=> b!407572 (=> (not res!235723) (not e!244707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407572 (= res!235723 (validKeyInArray!0 k0!794))))

(declare-fun b!407573 () Bool)

(assert (=> b!407573 (= e!244706 tp_is_empty!10375)))

(declare-fun b!407574 () Bool)

(declare-fun res!235726 () Bool)

(assert (=> b!407574 (=> (not res!235726) (not e!244707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407574 (= res!235726 (validMask!0 mask!1025))))

(declare-fun b!407575 () Bool)

(assert (=> b!407575 (= e!244707 e!244705)))

(declare-fun res!235724 () Bool)

(assert (=> b!407575 (=> (not res!235724) (not e!244705))))

(assert (=> b!407575 (= res!235724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188470 mask!1025))))

(assert (=> b!407575 (= lt!188470 (array!24622 (store (arr!11760 _keys!709) i!563 k0!794) (size!12113 _keys!709)))))

(declare-fun mapNonEmpty!17184 () Bool)

(declare-fun tp!33303 () Bool)

(assert (=> mapNonEmpty!17184 (= mapRes!17184 (and tp!33303 e!244709))))

(declare-fun mapRest!17184 () (Array (_ BitVec 32) ValueCell!4844))

(declare-fun mapValue!17184 () ValueCell!4844)

(declare-fun mapKey!17184 () (_ BitVec 32))

(assert (=> mapNonEmpty!17184 (= (arr!11761 _values!549) (store mapRest!17184 mapKey!17184 mapValue!17184))))

(assert (= (and start!38942 res!235721) b!407574))

(assert (= (and b!407574 res!235726) b!407571))

(assert (= (and b!407571 res!235722) b!407568))

(assert (= (and b!407568 res!235719) b!407563))

(assert (= (and b!407563 res!235728) b!407564))

(assert (= (and b!407564 res!235725) b!407572))

(assert (= (and b!407572 res!235723) b!407566))

(assert (= (and b!407566 res!235727) b!407569))

(assert (= (and b!407569 res!235720) b!407575))

(assert (= (and b!407575 res!235724) b!407565))

(assert (= (and b!407570 condMapEmpty!17184) mapIsEmpty!17184))

(assert (= (and b!407570 (not condMapEmpty!17184)) mapNonEmpty!17184))

(get-info :version)

(assert (= (and mapNonEmpty!17184 ((_ is ValueCellFull!4844) mapValue!17184)) b!407567))

(assert (= (and b!407570 ((_ is ValueCellFull!4844) mapDefault!17184)) b!407573))

(assert (= start!38942 b!407570))

(declare-fun m!398643 () Bool)

(assert (=> b!407566 m!398643))

(declare-fun m!398645 () Bool)

(assert (=> b!407565 m!398645))

(declare-fun m!398647 () Bool)

(assert (=> b!407569 m!398647))

(declare-fun m!398649 () Bool)

(assert (=> b!407575 m!398649))

(declare-fun m!398651 () Bool)

(assert (=> b!407575 m!398651))

(declare-fun m!398653 () Bool)

(assert (=> b!407574 m!398653))

(declare-fun m!398655 () Bool)

(assert (=> b!407568 m!398655))

(declare-fun m!398657 () Bool)

(assert (=> mapNonEmpty!17184 m!398657))

(declare-fun m!398659 () Bool)

(assert (=> start!38942 m!398659))

(declare-fun m!398661 () Bool)

(assert (=> start!38942 m!398661))

(declare-fun m!398663 () Bool)

(assert (=> b!407572 m!398663))

(declare-fun m!398665 () Bool)

(assert (=> b!407563 m!398665))

(check-sat (not b!407569) (not b!407572) (not mapNonEmpty!17184) (not b!407575) (not b!407565) tp_is_empty!10375 (not b!407563) (not b!407568) (not b!407574) (not start!38942))
(check-sat)
