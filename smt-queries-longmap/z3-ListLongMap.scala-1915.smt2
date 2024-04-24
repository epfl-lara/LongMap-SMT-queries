; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34066 () Bool)

(assert start!34066)

(declare-fun b_free!7159 () Bool)

(declare-fun b_next!7159 () Bool)

(assert (=> start!34066 (= b_free!7159 (not b_next!7159))))

(declare-fun tp!25001 () Bool)

(declare-fun b_and!14367 () Bool)

(assert (=> start!34066 (= tp!25001 b_and!14367)))

(declare-fun b!339595 () Bool)

(declare-fun res!187607 () Bool)

(declare-fun e!208343 () Bool)

(assert (=> b!339595 (=> (not res!187607) (not e!208343))))

(declare-datatypes ((array!17804 0))(
  ( (array!17805 (arr!8425 (Array (_ BitVec 32) (_ BitVec 64))) (size!8777 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17804)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17804 (_ BitVec 32)) Bool)

(assert (=> b!339595 (= res!187607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339596 () Bool)

(declare-fun res!187605 () Bool)

(assert (=> b!339596 (=> (not res!187605) (not e!208343))))

(declare-datatypes ((List!4746 0))(
  ( (Nil!4743) (Cons!4742 (h!5598 (_ BitVec 64)) (t!9840 List!4746)) )
))
(declare-fun arrayNoDuplicates!0 (array!17804 (_ BitVec 32) List!4746) Bool)

(assert (=> b!339596 (= res!187605 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4743))))

(declare-fun mapNonEmpty!12084 () Bool)

(declare-fun mapRes!12084 () Bool)

(declare-fun tp!25002 () Bool)

(declare-fun e!208345 () Bool)

(assert (=> mapNonEmpty!12084 (= mapRes!12084 (and tp!25002 e!208345))))

(declare-datatypes ((V!10459 0))(
  ( (V!10460 (val!3600 Int)) )
))
(declare-datatypes ((ValueCell!3212 0))(
  ( (ValueCellFull!3212 (v!5770 V!10459)) (EmptyCell!3212) )
))
(declare-fun mapRest!12084 () (Array (_ BitVec 32) ValueCell!3212))

(declare-datatypes ((array!17806 0))(
  ( (array!17807 (arr!8426 (Array (_ BitVec 32) ValueCell!3212)) (size!8778 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17806)

(declare-fun mapValue!12084 () ValueCell!3212)

(declare-fun mapKey!12084 () (_ BitVec 32))

(assert (=> mapNonEmpty!12084 (= (arr!8426 _values!1525) (store mapRest!12084 mapKey!12084 mapValue!12084))))

(declare-fun b!339597 () Bool)

(declare-fun tp_is_empty!7111 () Bool)

(assert (=> b!339597 (= e!208345 tp_is_empty!7111)))

(declare-fun res!187606 () Bool)

(assert (=> start!34066 (=> (not res!187606) (not e!208343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34066 (= res!187606 (validMask!0 mask!2385))))

(assert (=> start!34066 e!208343))

(assert (=> start!34066 true))

(assert (=> start!34066 tp_is_empty!7111))

(assert (=> start!34066 tp!25001))

(declare-fun e!208344 () Bool)

(declare-fun array_inv!6246 (array!17806) Bool)

(assert (=> start!34066 (and (array_inv!6246 _values!1525) e!208344)))

(declare-fun array_inv!6247 (array!17804) Bool)

(assert (=> start!34066 (array_inv!6247 _keys!1895)))

(declare-fun b!339598 () Bool)

(assert (=> b!339598 (= e!208343 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3213 0))(
  ( (MissingZero!3213 (index!15031 (_ BitVec 32))) (Found!3213 (index!15032 (_ BitVec 32))) (Intermediate!3213 (undefined!4025 Bool) (index!15033 (_ BitVec 32)) (x!33782 (_ BitVec 32))) (Undefined!3213) (MissingVacant!3213 (index!15034 (_ BitVec 32))) )
))
(declare-fun lt!161275 () SeekEntryResult!3213)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17804 (_ BitVec 32)) SeekEntryResult!3213)

(assert (=> b!339598 (= lt!161275 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339599 () Bool)

(declare-fun res!187609 () Bool)

(assert (=> b!339599 (=> (not res!187609) (not e!208343))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339599 (= res!187609 (and (= (size!8778 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8777 _keys!1895) (size!8778 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12084 () Bool)

(assert (=> mapIsEmpty!12084 mapRes!12084))

(declare-fun b!339600 () Bool)

(declare-fun res!187608 () Bool)

(assert (=> b!339600 (=> (not res!187608) (not e!208343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339600 (= res!187608 (validKeyInArray!0 k0!1348))))

(declare-fun b!339601 () Bool)

(declare-fun e!208342 () Bool)

(assert (=> b!339601 (= e!208342 tp_is_empty!7111)))

(declare-fun b!339602 () Bool)

(declare-fun res!187610 () Bool)

(assert (=> b!339602 (=> (not res!187610) (not e!208343))))

(declare-fun zeroValue!1467 () V!10459)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10459)

(declare-datatypes ((tuple2!5138 0))(
  ( (tuple2!5139 (_1!2580 (_ BitVec 64)) (_2!2580 V!10459)) )
))
(declare-datatypes ((List!4747 0))(
  ( (Nil!4744) (Cons!4743 (h!5599 tuple2!5138) (t!9841 List!4747)) )
))
(declare-datatypes ((ListLongMap!4053 0))(
  ( (ListLongMap!4054 (toList!2042 List!4747)) )
))
(declare-fun contains!2112 (ListLongMap!4053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1571 (array!17804 array!17806 (_ BitVec 32) (_ BitVec 32) V!10459 V!10459 (_ BitVec 32) Int) ListLongMap!4053)

(assert (=> b!339602 (= res!187610 (not (contains!2112 (getCurrentListMap!1571 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339603 () Bool)

(assert (=> b!339603 (= e!208344 (and e!208342 mapRes!12084))))

(declare-fun condMapEmpty!12084 () Bool)

(declare-fun mapDefault!12084 () ValueCell!3212)

(assert (=> b!339603 (= condMapEmpty!12084 (= (arr!8426 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3212)) mapDefault!12084)))))

(assert (= (and start!34066 res!187606) b!339599))

(assert (= (and b!339599 res!187609) b!339595))

(assert (= (and b!339595 res!187607) b!339596))

(assert (= (and b!339596 res!187605) b!339600))

(assert (= (and b!339600 res!187608) b!339602))

(assert (= (and b!339602 res!187610) b!339598))

(assert (= (and b!339603 condMapEmpty!12084) mapIsEmpty!12084))

(assert (= (and b!339603 (not condMapEmpty!12084)) mapNonEmpty!12084))

(get-info :version)

(assert (= (and mapNonEmpty!12084 ((_ is ValueCellFull!3212) mapValue!12084)) b!339597))

(assert (= (and b!339603 ((_ is ValueCellFull!3212) mapDefault!12084)) b!339601))

(assert (= start!34066 b!339603))

(declare-fun m!342793 () Bool)

(assert (=> b!339596 m!342793))

(declare-fun m!342795 () Bool)

(assert (=> b!339600 m!342795))

(declare-fun m!342797 () Bool)

(assert (=> b!339602 m!342797))

(assert (=> b!339602 m!342797))

(declare-fun m!342799 () Bool)

(assert (=> b!339602 m!342799))

(declare-fun m!342801 () Bool)

(assert (=> b!339598 m!342801))

(declare-fun m!342803 () Bool)

(assert (=> mapNonEmpty!12084 m!342803))

(declare-fun m!342805 () Bool)

(assert (=> b!339595 m!342805))

(declare-fun m!342807 () Bool)

(assert (=> start!34066 m!342807))

(declare-fun m!342809 () Bool)

(assert (=> start!34066 m!342809))

(declare-fun m!342811 () Bool)

(assert (=> start!34066 m!342811))

(check-sat (not mapNonEmpty!12084) (not b_next!7159) (not start!34066) (not b!339598) b_and!14367 (not b!339596) (not b!339600) tp_is_empty!7111 (not b!339595) (not b!339602))
(check-sat b_and!14367 (not b_next!7159))
