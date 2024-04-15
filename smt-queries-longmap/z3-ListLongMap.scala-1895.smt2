; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33846 () Bool)

(assert start!33846)

(declare-fun b_free!7039 () Bool)

(declare-fun b_next!7039 () Bool)

(assert (=> start!33846 (= b_free!7039 (not b_next!7039))))

(declare-fun tp!24629 () Bool)

(declare-fun b_and!14199 () Bool)

(assert (=> start!33846 (= tp!24629 b_and!14199)))

(declare-fun mapIsEmpty!11892 () Bool)

(declare-fun mapRes!11892 () Bool)

(assert (=> mapIsEmpty!11892 mapRes!11892))

(declare-fun b!336688 () Bool)

(declare-fun res!185926 () Bool)

(declare-fun e!206632 () Bool)

(assert (=> b!336688 (=> (not res!185926) (not e!206632))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336688 (= res!185926 (validKeyInArray!0 k0!1348))))

(declare-fun b!336689 () Bool)

(declare-fun e!206629 () Bool)

(declare-fun tp_is_empty!6991 () Bool)

(assert (=> b!336689 (= e!206629 tp_is_empty!6991)))

(declare-fun res!185922 () Bool)

(assert (=> start!33846 (=> (not res!185922) (not e!206632))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33846 (= res!185922 (validMask!0 mask!2385))))

(assert (=> start!33846 e!206632))

(assert (=> start!33846 true))

(assert (=> start!33846 tp_is_empty!6991))

(assert (=> start!33846 tp!24629))

(declare-datatypes ((V!10299 0))(
  ( (V!10300 (val!3540 Int)) )
))
(declare-datatypes ((ValueCell!3152 0))(
  ( (ValueCellFull!3152 (v!5699 V!10299)) (EmptyCell!3152) )
))
(declare-datatypes ((array!17557 0))(
  ( (array!17558 (arr!8306 (Array (_ BitVec 32) ValueCell!3152)) (size!8659 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17557)

(declare-fun e!206630 () Bool)

(declare-fun array_inv!6198 (array!17557) Bool)

(assert (=> start!33846 (and (array_inv!6198 _values!1525) e!206630)))

(declare-datatypes ((array!17559 0))(
  ( (array!17560 (arr!8307 (Array (_ BitVec 32) (_ BitVec 64))) (size!8660 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17559)

(declare-fun array_inv!6199 (array!17559) Bool)

(assert (=> start!33846 (array_inv!6199 _keys!1895)))

(declare-fun b!336690 () Bool)

(declare-fun e!206628 () Bool)

(assert (=> b!336690 (= e!206630 (and e!206628 mapRes!11892))))

(declare-fun condMapEmpty!11892 () Bool)

(declare-fun mapDefault!11892 () ValueCell!3152)

(assert (=> b!336690 (= condMapEmpty!11892 (= (arr!8306 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3152)) mapDefault!11892)))))

(declare-fun b!336691 () Bool)

(declare-fun res!185927 () Bool)

(assert (=> b!336691 (=> (not res!185927) (not e!206632))))

(declare-fun zeroValue!1467 () V!10299)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10299)

(declare-datatypes ((tuple2!5088 0))(
  ( (tuple2!5089 (_1!2555 (_ BitVec 64)) (_2!2555 V!10299)) )
))
(declare-datatypes ((List!4723 0))(
  ( (Nil!4720) (Cons!4719 (h!5575 tuple2!5088) (t!9808 List!4723)) )
))
(declare-datatypes ((ListLongMap!3991 0))(
  ( (ListLongMap!3992 (toList!2011 List!4723)) )
))
(declare-fun contains!2069 (ListLongMap!3991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1517 (array!17559 array!17557 (_ BitVec 32) (_ BitVec 32) V!10299 V!10299 (_ BitVec 32) Int) ListLongMap!3991)

(assert (=> b!336691 (= res!185927 (not (contains!2069 (getCurrentListMap!1517 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336692 () Bool)

(declare-fun e!206631 () Bool)

(assert (=> b!336692 (= e!206631 false)))

(declare-fun lt!160113 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17559 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336692 (= lt!160113 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336693 () Bool)

(declare-fun res!185920 () Bool)

(assert (=> b!336693 (=> (not res!185920) (not e!206631))))

(declare-fun arrayContainsKey!0 (array!17559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336693 (= res!185920 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336694 () Bool)

(declare-fun res!185921 () Bool)

(assert (=> b!336694 (=> (not res!185921) (not e!206632))))

(assert (=> b!336694 (= res!185921 (and (= (size!8659 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8660 _keys!1895) (size!8659 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336695 () Bool)

(declare-fun res!185923 () Bool)

(assert (=> b!336695 (=> (not res!185923) (not e!206632))))

(declare-datatypes ((List!4724 0))(
  ( (Nil!4721) (Cons!4720 (h!5576 (_ BitVec 64)) (t!9809 List!4724)) )
))
(declare-fun arrayNoDuplicates!0 (array!17559 (_ BitVec 32) List!4724) Bool)

(assert (=> b!336695 (= res!185923 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4721))))

(declare-fun mapNonEmpty!11892 () Bool)

(declare-fun tp!24630 () Bool)

(assert (=> mapNonEmpty!11892 (= mapRes!11892 (and tp!24630 e!206629))))

(declare-fun mapValue!11892 () ValueCell!3152)

(declare-fun mapKey!11892 () (_ BitVec 32))

(declare-fun mapRest!11892 () (Array (_ BitVec 32) ValueCell!3152))

(assert (=> mapNonEmpty!11892 (= (arr!8306 _values!1525) (store mapRest!11892 mapKey!11892 mapValue!11892))))

(declare-fun b!336696 () Bool)

(assert (=> b!336696 (= e!206628 tp_is_empty!6991)))

(declare-fun b!336697 () Bool)

(declare-fun res!185925 () Bool)

(assert (=> b!336697 (=> (not res!185925) (not e!206632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17559 (_ BitVec 32)) Bool)

(assert (=> b!336697 (= res!185925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336698 () Bool)

(assert (=> b!336698 (= e!206632 e!206631)))

(declare-fun res!185924 () Bool)

(assert (=> b!336698 (=> (not res!185924) (not e!206631))))

(declare-datatypes ((SeekEntryResult!3212 0))(
  ( (MissingZero!3212 (index!15027 (_ BitVec 32))) (Found!3212 (index!15028 (_ BitVec 32))) (Intermediate!3212 (undefined!4024 Bool) (index!15029 (_ BitVec 32)) (x!33579 (_ BitVec 32))) (Undefined!3212) (MissingVacant!3212 (index!15030 (_ BitVec 32))) )
))
(declare-fun lt!160112 () SeekEntryResult!3212)

(get-info :version)

(assert (=> b!336698 (= res!185924 (and (not ((_ is Found!3212) lt!160112)) ((_ is MissingZero!3212) lt!160112)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17559 (_ BitVec 32)) SeekEntryResult!3212)

(assert (=> b!336698 (= lt!160112 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33846 res!185922) b!336694))

(assert (= (and b!336694 res!185921) b!336697))

(assert (= (and b!336697 res!185925) b!336695))

(assert (= (and b!336695 res!185923) b!336688))

(assert (= (and b!336688 res!185926) b!336691))

(assert (= (and b!336691 res!185927) b!336698))

(assert (= (and b!336698 res!185924) b!336693))

(assert (= (and b!336693 res!185920) b!336692))

(assert (= (and b!336690 condMapEmpty!11892) mapIsEmpty!11892))

(assert (= (and b!336690 (not condMapEmpty!11892)) mapNonEmpty!11892))

(assert (= (and mapNonEmpty!11892 ((_ is ValueCellFull!3152) mapValue!11892)) b!336689))

(assert (= (and b!336690 ((_ is ValueCellFull!3152) mapDefault!11892)) b!336696))

(assert (= start!33846 b!336690))

(declare-fun m!339889 () Bool)

(assert (=> start!33846 m!339889))

(declare-fun m!339891 () Bool)

(assert (=> start!33846 m!339891))

(declare-fun m!339893 () Bool)

(assert (=> start!33846 m!339893))

(declare-fun m!339895 () Bool)

(assert (=> b!336693 m!339895))

(declare-fun m!339897 () Bool)

(assert (=> b!336698 m!339897))

(declare-fun m!339899 () Bool)

(assert (=> b!336688 m!339899))

(declare-fun m!339901 () Bool)

(assert (=> b!336691 m!339901))

(assert (=> b!336691 m!339901))

(declare-fun m!339903 () Bool)

(assert (=> b!336691 m!339903))

(declare-fun m!339905 () Bool)

(assert (=> mapNonEmpty!11892 m!339905))

(declare-fun m!339907 () Bool)

(assert (=> b!336692 m!339907))

(declare-fun m!339909 () Bool)

(assert (=> b!336695 m!339909))

(declare-fun m!339911 () Bool)

(assert (=> b!336697 m!339911))

(check-sat (not b!336692) b_and!14199 (not b!336695) (not start!33846) (not b!336697) (not b!336693) (not b!336691) (not b_next!7039) (not mapNonEmpty!11892) tp_is_empty!6991 (not b!336688) (not b!336698))
(check-sat b_and!14199 (not b_next!7039))
