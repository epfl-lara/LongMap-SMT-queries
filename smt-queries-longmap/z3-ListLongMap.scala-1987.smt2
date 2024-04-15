; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34792 () Bool)

(assert start!34792)

(declare-fun b_free!7591 () Bool)

(declare-fun b_next!7591 () Bool)

(assert (=> start!34792 (= b_free!7591 (not b_next!7591))))

(declare-fun tp!26339 () Bool)

(declare-fun b_and!14787 () Bool)

(assert (=> start!34792 (= tp!26339 b_and!14787)))

(declare-fun b!348036 () Bool)

(declare-fun res!192796 () Bool)

(declare-fun e!213235 () Bool)

(assert (=> b!348036 (=> (not res!192796) (not e!213235))))

(declare-datatypes ((array!18655 0))(
  ( (array!18656 (arr!8837 (Array (_ BitVec 32) (_ BitVec 64))) (size!9190 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18655)

(declare-datatypes ((List!5094 0))(
  ( (Nil!5091) (Cons!5090 (h!5946 (_ BitVec 64)) (t!10215 List!5094)) )
))
(declare-fun arrayNoDuplicates!0 (array!18655 (_ BitVec 32) List!5094) Bool)

(assert (=> b!348036 (= res!192796 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5091))))

(declare-fun b!348037 () Bool)

(declare-fun e!213236 () Bool)

(declare-fun tp_is_empty!7543 () Bool)

(assert (=> b!348037 (= e!213236 tp_is_empty!7543)))

(declare-fun b!348038 () Bool)

(declare-fun res!192793 () Bool)

(assert (=> b!348038 (=> (not res!192793) (not e!213235))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18655 (_ BitVec 32)) Bool)

(assert (=> b!348038 (= res!192793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12774 () Bool)

(declare-fun mapRes!12774 () Bool)

(assert (=> mapIsEmpty!12774 mapRes!12774))

(declare-fun mapNonEmpty!12774 () Bool)

(declare-fun tp!26340 () Bool)

(declare-fun e!213240 () Bool)

(assert (=> mapNonEmpty!12774 (= mapRes!12774 (and tp!26340 e!213240))))

(declare-datatypes ((V!11035 0))(
  ( (V!11036 (val!3816 Int)) )
))
(declare-datatypes ((ValueCell!3428 0))(
  ( (ValueCellFull!3428 (v!5993 V!11035)) (EmptyCell!3428) )
))
(declare-datatypes ((array!18657 0))(
  ( (array!18658 (arr!8838 (Array (_ BitVec 32) ValueCell!3428)) (size!9191 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18657)

(declare-fun mapKey!12774 () (_ BitVec 32))

(declare-fun mapValue!12774 () ValueCell!3428)

(declare-fun mapRest!12774 () (Array (_ BitVec 32) ValueCell!3428))

(assert (=> mapNonEmpty!12774 (= (arr!8838 _values!1525) (store mapRest!12774 mapKey!12774 mapValue!12774))))

(declare-fun b!348040 () Bool)

(declare-fun res!192799 () Bool)

(declare-fun e!213237 () Bool)

(assert (=> b!348040 (=> (not res!192799) (not e!213237))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348040 (= res!192799 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348041 () Bool)

(assert (=> b!348041 (= e!213240 tp_is_empty!7543)))

(declare-fun b!348042 () Bool)

(declare-fun res!192792 () Bool)

(assert (=> b!348042 (=> (not res!192792) (not e!213235))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348042 (= res!192792 (and (= (size!9191 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9190 _keys!1895) (size!9191 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348039 () Bool)

(declare-fun e!213238 () Bool)

(assert (=> b!348039 (= e!213238 (and e!213236 mapRes!12774))))

(declare-fun condMapEmpty!12774 () Bool)

(declare-fun mapDefault!12774 () ValueCell!3428)

(assert (=> b!348039 (= condMapEmpty!12774 (= (arr!8838 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3428)) mapDefault!12774)))))

(declare-fun res!192798 () Bool)

(assert (=> start!34792 (=> (not res!192798) (not e!213235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34792 (= res!192798 (validMask!0 mask!2385))))

(assert (=> start!34792 e!213235))

(assert (=> start!34792 true))

(assert (=> start!34792 tp_is_empty!7543))

(assert (=> start!34792 tp!26339))

(declare-fun array_inv!6560 (array!18657) Bool)

(assert (=> start!34792 (and (array_inv!6560 _values!1525) e!213238)))

(declare-fun array_inv!6561 (array!18655) Bool)

(assert (=> start!34792 (array_inv!6561 _keys!1895)))

(declare-fun b!348043 () Bool)

(assert (=> b!348043 (= e!213237 false)))

(declare-fun lt!163619 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18655 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348043 (= lt!163619 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348044 () Bool)

(declare-fun res!192794 () Bool)

(assert (=> b!348044 (=> (not res!192794) (not e!213235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348044 (= res!192794 (validKeyInArray!0 k0!1348))))

(declare-fun b!348045 () Bool)

(declare-fun res!192795 () Bool)

(assert (=> b!348045 (=> (not res!192795) (not e!213235))))

(declare-fun zeroValue!1467 () V!11035)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11035)

(declare-datatypes ((tuple2!5476 0))(
  ( (tuple2!5477 (_1!2749 (_ BitVec 64)) (_2!2749 V!11035)) )
))
(declare-datatypes ((List!5095 0))(
  ( (Nil!5092) (Cons!5091 (h!5947 tuple2!5476) (t!10216 List!5095)) )
))
(declare-datatypes ((ListLongMap!4379 0))(
  ( (ListLongMap!4380 (toList!2205 List!5095)) )
))
(declare-fun contains!2281 (ListLongMap!4379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1710 (array!18655 array!18657 (_ BitVec 32) (_ BitVec 32) V!11035 V!11035 (_ BitVec 32) Int) ListLongMap!4379)

(assert (=> b!348045 (= res!192795 (not (contains!2281 (getCurrentListMap!1710 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348046 () Bool)

(assert (=> b!348046 (= e!213235 e!213237)))

(declare-fun res!192797 () Bool)

(assert (=> b!348046 (=> (not res!192797) (not e!213237))))

(declare-datatypes ((SeekEntryResult!3406 0))(
  ( (MissingZero!3406 (index!15803 (_ BitVec 32))) (Found!3406 (index!15804 (_ BitVec 32))) (Intermediate!3406 (undefined!4218 Bool) (index!15805 (_ BitVec 32)) (x!34689 (_ BitVec 32))) (Undefined!3406) (MissingVacant!3406 (index!15806 (_ BitVec 32))) )
))
(declare-fun lt!163620 () SeekEntryResult!3406)

(get-info :version)

(assert (=> b!348046 (= res!192797 (and (not ((_ is Found!3406) lt!163620)) ((_ is MissingZero!3406) lt!163620)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18655 (_ BitVec 32)) SeekEntryResult!3406)

(assert (=> b!348046 (= lt!163620 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34792 res!192798) b!348042))

(assert (= (and b!348042 res!192792) b!348038))

(assert (= (and b!348038 res!192793) b!348036))

(assert (= (and b!348036 res!192796) b!348044))

(assert (= (and b!348044 res!192794) b!348045))

(assert (= (and b!348045 res!192795) b!348046))

(assert (= (and b!348046 res!192797) b!348040))

(assert (= (and b!348040 res!192799) b!348043))

(assert (= (and b!348039 condMapEmpty!12774) mapIsEmpty!12774))

(assert (= (and b!348039 (not condMapEmpty!12774)) mapNonEmpty!12774))

(assert (= (and mapNonEmpty!12774 ((_ is ValueCellFull!3428) mapValue!12774)) b!348041))

(assert (= (and b!348039 ((_ is ValueCellFull!3428) mapDefault!12774)) b!348037))

(assert (= start!34792 b!348039))

(declare-fun m!348387 () Bool)

(assert (=> b!348043 m!348387))

(declare-fun m!348389 () Bool)

(assert (=> b!348040 m!348389))

(declare-fun m!348391 () Bool)

(assert (=> mapNonEmpty!12774 m!348391))

(declare-fun m!348393 () Bool)

(assert (=> start!34792 m!348393))

(declare-fun m!348395 () Bool)

(assert (=> start!34792 m!348395))

(declare-fun m!348397 () Bool)

(assert (=> start!34792 m!348397))

(declare-fun m!348399 () Bool)

(assert (=> b!348046 m!348399))

(declare-fun m!348401 () Bool)

(assert (=> b!348036 m!348401))

(declare-fun m!348403 () Bool)

(assert (=> b!348044 m!348403))

(declare-fun m!348405 () Bool)

(assert (=> b!348038 m!348405))

(declare-fun m!348407 () Bool)

(assert (=> b!348045 m!348407))

(assert (=> b!348045 m!348407))

(declare-fun m!348409 () Bool)

(assert (=> b!348045 m!348409))

(check-sat (not b!348036) (not b_next!7591) tp_is_empty!7543 (not b!348044) (not b!348040) (not b!348038) (not start!34792) (not b!348045) (not mapNonEmpty!12774) (not b!348046) (not b!348043) b_and!14787)
(check-sat b_and!14787 (not b_next!7591))
