; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33834 () Bool)

(assert start!33834)

(declare-fun b_free!7027 () Bool)

(declare-fun b_next!7027 () Bool)

(assert (=> start!33834 (= b_free!7027 (not b_next!7027))))

(declare-fun tp!24594 () Bool)

(declare-fun b_and!14187 () Bool)

(assert (=> start!33834 (= tp!24594 b_and!14187)))

(declare-fun b!336490 () Bool)

(declare-fun e!206521 () Bool)

(declare-fun tp_is_empty!6979 () Bool)

(assert (=> b!336490 (= e!206521 tp_is_empty!6979)))

(declare-fun b!336491 () Bool)

(declare-fun res!185780 () Bool)

(declare-fun e!206519 () Bool)

(assert (=> b!336491 (=> (not res!185780) (not e!206519))))

(declare-datatypes ((array!17535 0))(
  ( (array!17536 (arr!8295 (Array (_ BitVec 32) (_ BitVec 64))) (size!8648 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17535)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336491 (= res!185780 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336492 () Bool)

(assert (=> b!336492 (= e!206519 false)))

(declare-fun lt!160076 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17535 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336492 (= lt!160076 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336493 () Bool)

(declare-fun res!185777 () Bool)

(declare-fun e!206523 () Bool)

(assert (=> b!336493 (=> (not res!185777) (not e!206523))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10283 0))(
  ( (V!10284 (val!3534 Int)) )
))
(declare-datatypes ((ValueCell!3146 0))(
  ( (ValueCellFull!3146 (v!5693 V!10283)) (EmptyCell!3146) )
))
(declare-datatypes ((array!17537 0))(
  ( (array!17538 (arr!8296 (Array (_ BitVec 32) ValueCell!3146)) (size!8649 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17537)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336493 (= res!185777 (and (= (size!8649 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8648 _keys!1895) (size!8649 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11874 () Bool)

(declare-fun mapRes!11874 () Bool)

(declare-fun tp!24593 () Bool)

(declare-fun e!206520 () Bool)

(assert (=> mapNonEmpty!11874 (= mapRes!11874 (and tp!24593 e!206520))))

(declare-fun mapValue!11874 () ValueCell!3146)

(declare-fun mapRest!11874 () (Array (_ BitVec 32) ValueCell!3146))

(declare-fun mapKey!11874 () (_ BitVec 32))

(assert (=> mapNonEmpty!11874 (= (arr!8296 _values!1525) (store mapRest!11874 mapKey!11874 mapValue!11874))))

(declare-fun b!336494 () Bool)

(declare-fun res!185778 () Bool)

(assert (=> b!336494 (=> (not res!185778) (not e!206523))))

(declare-datatypes ((List!4714 0))(
  ( (Nil!4711) (Cons!4710 (h!5566 (_ BitVec 64)) (t!9799 List!4714)) )
))
(declare-fun arrayNoDuplicates!0 (array!17535 (_ BitVec 32) List!4714) Bool)

(assert (=> b!336494 (= res!185778 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4711))))

(declare-fun b!336495 () Bool)

(declare-fun e!206522 () Bool)

(assert (=> b!336495 (= e!206522 (and e!206521 mapRes!11874))))

(declare-fun condMapEmpty!11874 () Bool)

(declare-fun mapDefault!11874 () ValueCell!3146)

(assert (=> b!336495 (= condMapEmpty!11874 (= (arr!8296 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3146)) mapDefault!11874)))))

(declare-fun mapIsEmpty!11874 () Bool)

(assert (=> mapIsEmpty!11874 mapRes!11874))

(declare-fun b!336496 () Bool)

(assert (=> b!336496 (= e!206523 e!206519)))

(declare-fun res!185779 () Bool)

(assert (=> b!336496 (=> (not res!185779) (not e!206519))))

(declare-datatypes ((SeekEntryResult!3208 0))(
  ( (MissingZero!3208 (index!15011 (_ BitVec 32))) (Found!3208 (index!15012 (_ BitVec 32))) (Intermediate!3208 (undefined!4020 Bool) (index!15013 (_ BitVec 32)) (x!33559 (_ BitVec 32))) (Undefined!3208) (MissingVacant!3208 (index!15014 (_ BitVec 32))) )
))
(declare-fun lt!160077 () SeekEntryResult!3208)

(get-info :version)

(assert (=> b!336496 (= res!185779 (and (not ((_ is Found!3208) lt!160077)) ((_ is MissingZero!3208) lt!160077)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17535 (_ BitVec 32)) SeekEntryResult!3208)

(assert (=> b!336496 (= lt!160077 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336497 () Bool)

(declare-fun res!185782 () Bool)

(assert (=> b!336497 (=> (not res!185782) (not e!206523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336497 (= res!185782 (validKeyInArray!0 k0!1348))))

(declare-fun b!336498 () Bool)

(declare-fun res!185783 () Bool)

(assert (=> b!336498 (=> (not res!185783) (not e!206523))))

(declare-fun zeroValue!1467 () V!10283)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10283)

(declare-datatypes ((tuple2!5080 0))(
  ( (tuple2!5081 (_1!2551 (_ BitVec 64)) (_2!2551 V!10283)) )
))
(declare-datatypes ((List!4715 0))(
  ( (Nil!4712) (Cons!4711 (h!5567 tuple2!5080) (t!9800 List!4715)) )
))
(declare-datatypes ((ListLongMap!3983 0))(
  ( (ListLongMap!3984 (toList!2007 List!4715)) )
))
(declare-fun contains!2065 (ListLongMap!3983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1513 (array!17535 array!17537 (_ BitVec 32) (_ BitVec 32) V!10283 V!10283 (_ BitVec 32) Int) ListLongMap!3983)

(assert (=> b!336498 (= res!185783 (not (contains!2065 (getCurrentListMap!1513 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!185776 () Bool)

(assert (=> start!33834 (=> (not res!185776) (not e!206523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33834 (= res!185776 (validMask!0 mask!2385))))

(assert (=> start!33834 e!206523))

(assert (=> start!33834 true))

(assert (=> start!33834 tp_is_empty!6979))

(assert (=> start!33834 tp!24594))

(declare-fun array_inv!6192 (array!17537) Bool)

(assert (=> start!33834 (and (array_inv!6192 _values!1525) e!206522)))

(declare-fun array_inv!6193 (array!17535) Bool)

(assert (=> start!33834 (array_inv!6193 _keys!1895)))

(declare-fun b!336499 () Bool)

(assert (=> b!336499 (= e!206520 tp_is_empty!6979)))

(declare-fun b!336500 () Bool)

(declare-fun res!185781 () Bool)

(assert (=> b!336500 (=> (not res!185781) (not e!206523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17535 (_ BitVec 32)) Bool)

(assert (=> b!336500 (= res!185781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33834 res!185776) b!336493))

(assert (= (and b!336493 res!185777) b!336500))

(assert (= (and b!336500 res!185781) b!336494))

(assert (= (and b!336494 res!185778) b!336497))

(assert (= (and b!336497 res!185782) b!336498))

(assert (= (and b!336498 res!185783) b!336496))

(assert (= (and b!336496 res!185779) b!336491))

(assert (= (and b!336491 res!185780) b!336492))

(assert (= (and b!336495 condMapEmpty!11874) mapIsEmpty!11874))

(assert (= (and b!336495 (not condMapEmpty!11874)) mapNonEmpty!11874))

(assert (= (and mapNonEmpty!11874 ((_ is ValueCellFull!3146) mapValue!11874)) b!336499))

(assert (= (and b!336495 ((_ is ValueCellFull!3146) mapDefault!11874)) b!336490))

(assert (= start!33834 b!336495))

(declare-fun m!339745 () Bool)

(assert (=> b!336500 m!339745))

(declare-fun m!339747 () Bool)

(assert (=> b!336497 m!339747))

(declare-fun m!339749 () Bool)

(assert (=> b!336496 m!339749))

(declare-fun m!339751 () Bool)

(assert (=> b!336492 m!339751))

(declare-fun m!339753 () Bool)

(assert (=> start!33834 m!339753))

(declare-fun m!339755 () Bool)

(assert (=> start!33834 m!339755))

(declare-fun m!339757 () Bool)

(assert (=> start!33834 m!339757))

(declare-fun m!339759 () Bool)

(assert (=> b!336491 m!339759))

(declare-fun m!339761 () Bool)

(assert (=> b!336494 m!339761))

(declare-fun m!339763 () Bool)

(assert (=> mapNonEmpty!11874 m!339763))

(declare-fun m!339765 () Bool)

(assert (=> b!336498 m!339765))

(assert (=> b!336498 m!339765))

(declare-fun m!339767 () Bool)

(assert (=> b!336498 m!339767))

(check-sat (not b!336496) b_and!14187 (not b!336500) (not start!33834) (not b!336492) (not b!336497) (not mapNonEmpty!11874) tp_is_empty!6979 (not b!336491) (not b!336494) (not b!336498) (not b_next!7027))
(check-sat b_and!14187 (not b_next!7027))
