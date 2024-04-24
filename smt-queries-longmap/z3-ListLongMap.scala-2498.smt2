; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38792 () Bool)

(assert start!38792)

(declare-fun b!404860 () Bool)

(declare-fun res!233603 () Bool)

(declare-fun e!243502 () Bool)

(assert (=> b!404860 (=> (not res!233603) (not e!243502))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24330 0))(
  ( (array!24331 (arr!11614 (Array (_ BitVec 32) (_ BitVec 64))) (size!11966 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24330)

(assert (=> b!404860 (= res!233603 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11966 _keys!709))))))

(declare-fun res!233599 () Bool)

(assert (=> start!38792 (=> (not res!233599) (not e!243502))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38792 (= res!233599 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11966 _keys!709))))))

(assert (=> start!38792 e!243502))

(assert (=> start!38792 true))

(declare-datatypes ((V!14739 0))(
  ( (V!14740 (val!5157 Int)) )
))
(declare-datatypes ((ValueCell!4769 0))(
  ( (ValueCellFull!4769 (v!7405 V!14739)) (EmptyCell!4769) )
))
(declare-datatypes ((array!24332 0))(
  ( (array!24333 (arr!11615 (Array (_ BitVec 32) ValueCell!4769)) (size!11967 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24332)

(declare-fun e!243500 () Bool)

(declare-fun array_inv!8576 (array!24332) Bool)

(assert (=> start!38792 (and (array_inv!8576 _values!549) e!243500)))

(declare-fun array_inv!8577 (array!24330) Bool)

(assert (=> start!38792 (array_inv!8577 _keys!709)))

(declare-fun b!404861 () Bool)

(declare-fun res!233602 () Bool)

(assert (=> b!404861 (=> (not res!233602) (not e!243502))))

(declare-datatypes ((List!6636 0))(
  ( (Nil!6633) (Cons!6632 (h!7488 (_ BitVec 64)) (t!11802 List!6636)) )
))
(declare-fun arrayNoDuplicates!0 (array!24330 (_ BitVec 32) List!6636) Bool)

(assert (=> b!404861 (= res!233602 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6633))))

(declare-fun b!404862 () Bool)

(declare-fun e!243498 () Bool)

(declare-fun mapRes!16959 () Bool)

(assert (=> b!404862 (= e!243500 (and e!243498 mapRes!16959))))

(declare-fun condMapEmpty!16959 () Bool)

(declare-fun mapDefault!16959 () ValueCell!4769)

(assert (=> b!404862 (= condMapEmpty!16959 (= (arr!11615 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4769)) mapDefault!16959)))))

(declare-fun b!404863 () Bool)

(declare-fun res!233601 () Bool)

(assert (=> b!404863 (=> (not res!233601) (not e!243502))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404863 (= res!233601 (validMask!0 mask!1025))))

(declare-fun b!404864 () Bool)

(declare-fun e!243499 () Bool)

(assert (=> b!404864 (= e!243499 false)))

(declare-fun lt!188274 () Bool)

(declare-fun lt!188273 () array!24330)

(assert (=> b!404864 (= lt!188274 (arrayNoDuplicates!0 lt!188273 #b00000000000000000000000000000000 Nil!6633))))

(declare-fun mapNonEmpty!16959 () Bool)

(declare-fun tp!33078 () Bool)

(declare-fun e!243497 () Bool)

(assert (=> mapNonEmpty!16959 (= mapRes!16959 (and tp!33078 e!243497))))

(declare-fun mapKey!16959 () (_ BitVec 32))

(declare-fun mapValue!16959 () ValueCell!4769)

(declare-fun mapRest!16959 () (Array (_ BitVec 32) ValueCell!4769))

(assert (=> mapNonEmpty!16959 (= (arr!11615 _values!549) (store mapRest!16959 mapKey!16959 mapValue!16959))))

(declare-fun b!404865 () Bool)

(declare-fun res!233598 () Bool)

(assert (=> b!404865 (=> (not res!233598) (not e!243502))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404865 (= res!233598 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404866 () Bool)

(declare-fun res!233597 () Bool)

(assert (=> b!404866 (=> (not res!233597) (not e!243502))))

(assert (=> b!404866 (= res!233597 (or (= (select (arr!11614 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11614 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404867 () Bool)

(declare-fun res!233604 () Bool)

(assert (=> b!404867 (=> (not res!233604) (not e!243502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404867 (= res!233604 (validKeyInArray!0 k0!794))))

(declare-fun b!404868 () Bool)

(declare-fun res!233600 () Bool)

(assert (=> b!404868 (=> (not res!233600) (not e!243502))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404868 (= res!233600 (and (= (size!11967 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11966 _keys!709) (size!11967 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404869 () Bool)

(assert (=> b!404869 (= e!243502 e!243499)))

(declare-fun res!233596 () Bool)

(assert (=> b!404869 (=> (not res!233596) (not e!243499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24330 (_ BitVec 32)) Bool)

(assert (=> b!404869 (= res!233596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188273 mask!1025))))

(assert (=> b!404869 (= lt!188273 (array!24331 (store (arr!11614 _keys!709) i!563 k0!794) (size!11966 _keys!709)))))

(declare-fun b!404870 () Bool)

(declare-fun tp_is_empty!10225 () Bool)

(assert (=> b!404870 (= e!243498 tp_is_empty!10225)))

(declare-fun mapIsEmpty!16959 () Bool)

(assert (=> mapIsEmpty!16959 mapRes!16959))

(declare-fun b!404871 () Bool)

(assert (=> b!404871 (= e!243497 tp_is_empty!10225)))

(declare-fun b!404872 () Bool)

(declare-fun res!233595 () Bool)

(assert (=> b!404872 (=> (not res!233595) (not e!243502))))

(assert (=> b!404872 (= res!233595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38792 res!233599) b!404863))

(assert (= (and b!404863 res!233601) b!404868))

(assert (= (and b!404868 res!233600) b!404872))

(assert (= (and b!404872 res!233595) b!404861))

(assert (= (and b!404861 res!233602) b!404860))

(assert (= (and b!404860 res!233603) b!404867))

(assert (= (and b!404867 res!233604) b!404866))

(assert (= (and b!404866 res!233597) b!404865))

(assert (= (and b!404865 res!233598) b!404869))

(assert (= (and b!404869 res!233596) b!404864))

(assert (= (and b!404862 condMapEmpty!16959) mapIsEmpty!16959))

(assert (= (and b!404862 (not condMapEmpty!16959)) mapNonEmpty!16959))

(get-info :version)

(assert (= (and mapNonEmpty!16959 ((_ is ValueCellFull!4769) mapValue!16959)) b!404871))

(assert (= (and b!404862 ((_ is ValueCellFull!4769) mapDefault!16959)) b!404870))

(assert (= start!38792 b!404862))

(declare-fun m!397797 () Bool)

(assert (=> mapNonEmpty!16959 m!397797))

(declare-fun m!397799 () Bool)

(assert (=> start!38792 m!397799))

(declare-fun m!397801 () Bool)

(assert (=> start!38792 m!397801))

(declare-fun m!397803 () Bool)

(assert (=> b!404863 m!397803))

(declare-fun m!397805 () Bool)

(assert (=> b!404865 m!397805))

(declare-fun m!397807 () Bool)

(assert (=> b!404872 m!397807))

(declare-fun m!397809 () Bool)

(assert (=> b!404869 m!397809))

(declare-fun m!397811 () Bool)

(assert (=> b!404869 m!397811))

(declare-fun m!397813 () Bool)

(assert (=> b!404866 m!397813))

(declare-fun m!397815 () Bool)

(assert (=> b!404867 m!397815))

(declare-fun m!397817 () Bool)

(assert (=> b!404861 m!397817))

(declare-fun m!397819 () Bool)

(assert (=> b!404864 m!397819))

(check-sat (not mapNonEmpty!16959) (not start!38792) (not b!404872) (not b!404863) (not b!404861) (not b!404867) (not b!404864) (not b!404865) (not b!404869) tp_is_empty!10225)
(check-sat)
