; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34486 () Bool)

(assert start!34486)

(declare-fun b_free!7423 () Bool)

(declare-fun b_next!7423 () Bool)

(assert (=> start!34486 (= b_free!7423 (not b_next!7423))))

(declare-fun tp!25815 () Bool)

(declare-fun b_and!14645 () Bool)

(assert (=> start!34486 (= tp!25815 b_and!14645)))

(declare-fun b!344705 () Bool)

(declare-fun e!211292 () Bool)

(assert (=> b!344705 (= e!211292 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3299 0))(
  ( (MissingZero!3299 (index!15375 (_ BitVec 32))) (Found!3299 (index!15376 (_ BitVec 32))) (Intermediate!3299 (undefined!4111 Bool) (index!15377 (_ BitVec 32)) (x!34290 (_ BitVec 32))) (Undefined!3299) (MissingVacant!3299 (index!15378 (_ BitVec 32))) )
))
(declare-fun lt!162727 () SeekEntryResult!3299)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18332 0))(
  ( (array!18333 (arr!8682 (Array (_ BitVec 32) (_ BitVec 64))) (size!9034 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18332)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18332 (_ BitVec 32)) SeekEntryResult!3299)

(assert (=> b!344705 (= lt!162727 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!190695 () Bool)

(assert (=> start!34486 (=> (not res!190695) (not e!211292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34486 (= res!190695 (validMask!0 mask!2385))))

(assert (=> start!34486 e!211292))

(assert (=> start!34486 true))

(declare-fun tp_is_empty!7375 () Bool)

(assert (=> start!34486 tp_is_empty!7375))

(assert (=> start!34486 tp!25815))

(declare-datatypes ((V!10811 0))(
  ( (V!10812 (val!3732 Int)) )
))
(declare-datatypes ((ValueCell!3344 0))(
  ( (ValueCellFull!3344 (v!5909 V!10811)) (EmptyCell!3344) )
))
(declare-datatypes ((array!18334 0))(
  ( (array!18335 (arr!8683 (Array (_ BitVec 32) ValueCell!3344)) (size!9035 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18334)

(declare-fun e!211295 () Bool)

(declare-fun array_inv!6410 (array!18334) Bool)

(assert (=> start!34486 (and (array_inv!6410 _values!1525) e!211295)))

(declare-fun array_inv!6411 (array!18332) Bool)

(assert (=> start!34486 (array_inv!6411 _keys!1895)))

(declare-fun b!344706 () Bool)

(declare-fun res!190696 () Bool)

(assert (=> b!344706 (=> (not res!190696) (not e!211292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18332 (_ BitVec 32)) Bool)

(assert (=> b!344706 (= res!190696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12501 () Bool)

(declare-fun mapRes!12501 () Bool)

(declare-fun tp!25814 () Bool)

(declare-fun e!211291 () Bool)

(assert (=> mapNonEmpty!12501 (= mapRes!12501 (and tp!25814 e!211291))))

(declare-fun mapValue!12501 () ValueCell!3344)

(declare-fun mapRest!12501 () (Array (_ BitVec 32) ValueCell!3344))

(declare-fun mapKey!12501 () (_ BitVec 32))

(assert (=> mapNonEmpty!12501 (= (arr!8683 _values!1525) (store mapRest!12501 mapKey!12501 mapValue!12501))))

(declare-fun mapIsEmpty!12501 () Bool)

(assert (=> mapIsEmpty!12501 mapRes!12501))

(declare-fun b!344707 () Bool)

(assert (=> b!344707 (= e!211291 tp_is_empty!7375)))

(declare-fun b!344708 () Bool)

(declare-fun e!211294 () Bool)

(assert (=> b!344708 (= e!211294 tp_is_empty!7375)))

(declare-fun b!344709 () Bool)

(declare-fun res!190699 () Bool)

(assert (=> b!344709 (=> (not res!190699) (not e!211292))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344709 (= res!190699 (and (= (size!9035 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9034 _keys!1895) (size!9035 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344710 () Bool)

(declare-fun res!190697 () Bool)

(assert (=> b!344710 (=> (not res!190697) (not e!211292))))

(declare-fun zeroValue!1467 () V!10811)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10811)

(declare-datatypes ((tuple2!5316 0))(
  ( (tuple2!5317 (_1!2669 (_ BitVec 64)) (_2!2669 V!10811)) )
))
(declare-datatypes ((List!4921 0))(
  ( (Nil!4918) (Cons!4917 (h!5773 tuple2!5316) (t!10029 List!4921)) )
))
(declare-datatypes ((ListLongMap!4231 0))(
  ( (ListLongMap!4232 (toList!2131 List!4921)) )
))
(declare-fun contains!2208 (ListLongMap!4231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1660 (array!18332 array!18334 (_ BitVec 32) (_ BitVec 32) V!10811 V!10811 (_ BitVec 32) Int) ListLongMap!4231)

(assert (=> b!344710 (= res!190697 (not (contains!2208 (getCurrentListMap!1660 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344711 () Bool)

(declare-fun res!190698 () Bool)

(assert (=> b!344711 (=> (not res!190698) (not e!211292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344711 (= res!190698 (validKeyInArray!0 k0!1348))))

(declare-fun b!344712 () Bool)

(declare-fun res!190700 () Bool)

(assert (=> b!344712 (=> (not res!190700) (not e!211292))))

(declare-datatypes ((List!4922 0))(
  ( (Nil!4919) (Cons!4918 (h!5774 (_ BitVec 64)) (t!10030 List!4922)) )
))
(declare-fun arrayNoDuplicates!0 (array!18332 (_ BitVec 32) List!4922) Bool)

(assert (=> b!344712 (= res!190700 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4919))))

(declare-fun b!344713 () Bool)

(assert (=> b!344713 (= e!211295 (and e!211294 mapRes!12501))))

(declare-fun condMapEmpty!12501 () Bool)

(declare-fun mapDefault!12501 () ValueCell!3344)

(assert (=> b!344713 (= condMapEmpty!12501 (= (arr!8683 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3344)) mapDefault!12501)))))

(assert (= (and start!34486 res!190695) b!344709))

(assert (= (and b!344709 res!190699) b!344706))

(assert (= (and b!344706 res!190696) b!344712))

(assert (= (and b!344712 res!190700) b!344711))

(assert (= (and b!344711 res!190698) b!344710))

(assert (= (and b!344710 res!190697) b!344705))

(assert (= (and b!344713 condMapEmpty!12501) mapIsEmpty!12501))

(assert (= (and b!344713 (not condMapEmpty!12501)) mapNonEmpty!12501))

(get-info :version)

(assert (= (and mapNonEmpty!12501 ((_ is ValueCellFull!3344) mapValue!12501)) b!344707))

(assert (= (and b!344713 ((_ is ValueCellFull!3344) mapDefault!12501)) b!344708))

(assert (= start!34486 b!344713))

(declare-fun m!346521 () Bool)

(assert (=> b!344705 m!346521))

(declare-fun m!346523 () Bool)

(assert (=> b!344710 m!346523))

(assert (=> b!344710 m!346523))

(declare-fun m!346525 () Bool)

(assert (=> b!344710 m!346525))

(declare-fun m!346527 () Bool)

(assert (=> mapNonEmpty!12501 m!346527))

(declare-fun m!346529 () Bool)

(assert (=> b!344711 m!346529))

(declare-fun m!346531 () Bool)

(assert (=> b!344712 m!346531))

(declare-fun m!346533 () Bool)

(assert (=> b!344706 m!346533))

(declare-fun m!346535 () Bool)

(assert (=> start!34486 m!346535))

(declare-fun m!346537 () Bool)

(assert (=> start!34486 m!346537))

(declare-fun m!346539 () Bool)

(assert (=> start!34486 m!346539))

(check-sat (not start!34486) (not b_next!7423) b_and!14645 (not b!344710) tp_is_empty!7375 (not mapNonEmpty!12501) (not b!344706) (not b!344711) (not b!344705) (not b!344712))
(check-sat b_and!14645 (not b_next!7423))
