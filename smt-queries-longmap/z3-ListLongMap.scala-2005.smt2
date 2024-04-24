; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34996 () Bool)

(assert start!34996)

(declare-fun b_free!7699 () Bool)

(declare-fun b_next!7699 () Bool)

(assert (=> start!34996 (= b_free!7699 (not b_next!7699))))

(declare-fun tp!26676 () Bool)

(declare-fun b_and!14943 () Bool)

(assert (=> start!34996 (= tp!26676 b_and!14943)))

(declare-fun b!350724 () Bool)

(declare-fun e!214811 () Bool)

(assert (=> b!350724 (= e!214811 false)))

(declare-fun lt!164662 () (_ BitVec 32))

(declare-datatypes ((array!18878 0))(
  ( (array!18879 (arr!8944 (Array (_ BitVec 32) (_ BitVec 64))) (size!9296 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18878)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18878 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350724 (= lt!164662 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12948 () Bool)

(declare-fun mapRes!12948 () Bool)

(assert (=> mapIsEmpty!12948 mapRes!12948))

(declare-fun b!350725 () Bool)

(declare-fun e!214814 () Bool)

(declare-fun e!214810 () Bool)

(assert (=> b!350725 (= e!214814 (and e!214810 mapRes!12948))))

(declare-fun condMapEmpty!12948 () Bool)

(declare-datatypes ((V!11179 0))(
  ( (V!11180 (val!3870 Int)) )
))
(declare-datatypes ((ValueCell!3482 0))(
  ( (ValueCellFull!3482 (v!6058 V!11179)) (EmptyCell!3482) )
))
(declare-datatypes ((array!18880 0))(
  ( (array!18881 (arr!8945 (Array (_ BitVec 32) ValueCell!3482)) (size!9297 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18880)

(declare-fun mapDefault!12948 () ValueCell!3482)

(assert (=> b!350725 (= condMapEmpty!12948 (= (arr!8945 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3482)) mapDefault!12948)))))

(declare-fun b!350726 () Bool)

(declare-fun res!194438 () Bool)

(assert (=> b!350726 (=> (not res!194438) (not e!214811))))

(declare-fun arrayContainsKey!0 (array!18878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350726 (= res!194438 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350727 () Bool)

(declare-fun res!194443 () Bool)

(declare-fun e!214812 () Bool)

(assert (=> b!350727 (=> (not res!194443) (not e!214812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350727 (= res!194443 (validKeyInArray!0 k0!1348))))

(declare-fun b!350728 () Bool)

(assert (=> b!350728 (= e!214812 e!214811)))

(declare-fun res!194445 () Bool)

(assert (=> b!350728 (=> (not res!194445) (not e!214811))))

(declare-datatypes ((SeekEntryResult!3400 0))(
  ( (MissingZero!3400 (index!15779 (_ BitVec 32))) (Found!3400 (index!15780 (_ BitVec 32))) (Intermediate!3400 (undefined!4212 Bool) (index!15781 (_ BitVec 32)) (x!34869 (_ BitVec 32))) (Undefined!3400) (MissingVacant!3400 (index!15782 (_ BitVec 32))) )
))
(declare-fun lt!164661 () SeekEntryResult!3400)

(get-info :version)

(assert (=> b!350728 (= res!194445 (and (not ((_ is Found!3400) lt!164661)) (not ((_ is MissingZero!3400) lt!164661)) ((_ is MissingVacant!3400) lt!164661)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18878 (_ BitVec 32)) SeekEntryResult!3400)

(assert (=> b!350728 (= lt!164661 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!194441 () Bool)

(assert (=> start!34996 (=> (not res!194441) (not e!214812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34996 (= res!194441 (validMask!0 mask!2385))))

(assert (=> start!34996 e!214812))

(assert (=> start!34996 true))

(declare-fun tp_is_empty!7651 () Bool)

(assert (=> start!34996 tp_is_empty!7651))

(assert (=> start!34996 tp!26676))

(declare-fun array_inv!6606 (array!18880) Bool)

(assert (=> start!34996 (and (array_inv!6606 _values!1525) e!214814)))

(declare-fun array_inv!6607 (array!18878) Bool)

(assert (=> start!34996 (array_inv!6607 _keys!1895)))

(declare-fun b!350729 () Bool)

(declare-fun res!194440 () Bool)

(assert (=> b!350729 (=> (not res!194440) (not e!214812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18878 (_ BitVec 32)) Bool)

(assert (=> b!350729 (= res!194440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12948 () Bool)

(declare-fun tp!26675 () Bool)

(declare-fun e!214815 () Bool)

(assert (=> mapNonEmpty!12948 (= mapRes!12948 (and tp!26675 e!214815))))

(declare-fun mapValue!12948 () ValueCell!3482)

(declare-fun mapRest!12948 () (Array (_ BitVec 32) ValueCell!3482))

(declare-fun mapKey!12948 () (_ BitVec 32))

(assert (=> mapNonEmpty!12948 (= (arr!8945 _values!1525) (store mapRest!12948 mapKey!12948 mapValue!12948))))

(declare-fun b!350730 () Bool)

(assert (=> b!350730 (= e!214810 tp_is_empty!7651)))

(declare-fun b!350731 () Bool)

(declare-fun res!194444 () Bool)

(assert (=> b!350731 (=> (not res!194444) (not e!214812))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11179)

(declare-fun zeroValue!1467 () V!11179)

(declare-datatypes ((tuple2!5504 0))(
  ( (tuple2!5505 (_1!2763 (_ BitVec 64)) (_2!2763 V!11179)) )
))
(declare-datatypes ((List!5110 0))(
  ( (Nil!5107) (Cons!5106 (h!5962 tuple2!5504) (t!10240 List!5110)) )
))
(declare-datatypes ((ListLongMap!4419 0))(
  ( (ListLongMap!4420 (toList!2225 List!5110)) )
))
(declare-fun contains!2313 (ListLongMap!4419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1753 (array!18878 array!18880 (_ BitVec 32) (_ BitVec 32) V!11179 V!11179 (_ BitVec 32) Int) ListLongMap!4419)

(assert (=> b!350731 (= res!194444 (not (contains!2313 (getCurrentListMap!1753 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350732 () Bool)

(declare-fun res!194442 () Bool)

(assert (=> b!350732 (=> (not res!194442) (not e!214812))))

(assert (=> b!350732 (= res!194442 (and (= (size!9297 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9296 _keys!1895) (size!9297 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350733 () Bool)

(assert (=> b!350733 (= e!214815 tp_is_empty!7651)))

(declare-fun b!350734 () Bool)

(declare-fun res!194439 () Bool)

(assert (=> b!350734 (=> (not res!194439) (not e!214812))))

(declare-datatypes ((List!5111 0))(
  ( (Nil!5108) (Cons!5107 (h!5963 (_ BitVec 64)) (t!10241 List!5111)) )
))
(declare-fun arrayNoDuplicates!0 (array!18878 (_ BitVec 32) List!5111) Bool)

(assert (=> b!350734 (= res!194439 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5108))))

(assert (= (and start!34996 res!194441) b!350732))

(assert (= (and b!350732 res!194442) b!350729))

(assert (= (and b!350729 res!194440) b!350734))

(assert (= (and b!350734 res!194439) b!350727))

(assert (= (and b!350727 res!194443) b!350731))

(assert (= (and b!350731 res!194444) b!350728))

(assert (= (and b!350728 res!194445) b!350726))

(assert (= (and b!350726 res!194438) b!350724))

(assert (= (and b!350725 condMapEmpty!12948) mapIsEmpty!12948))

(assert (= (and b!350725 (not condMapEmpty!12948)) mapNonEmpty!12948))

(assert (= (and mapNonEmpty!12948 ((_ is ValueCellFull!3482) mapValue!12948)) b!350733))

(assert (= (and b!350725 ((_ is ValueCellFull!3482) mapDefault!12948)) b!350730))

(assert (= start!34996 b!350725))

(declare-fun m!351105 () Bool)

(assert (=> b!350728 m!351105))

(declare-fun m!351107 () Bool)

(assert (=> mapNonEmpty!12948 m!351107))

(declare-fun m!351109 () Bool)

(assert (=> b!350724 m!351109))

(declare-fun m!351111 () Bool)

(assert (=> b!350726 m!351111))

(declare-fun m!351113 () Bool)

(assert (=> b!350734 m!351113))

(declare-fun m!351115 () Bool)

(assert (=> start!34996 m!351115))

(declare-fun m!351117 () Bool)

(assert (=> start!34996 m!351117))

(declare-fun m!351119 () Bool)

(assert (=> start!34996 m!351119))

(declare-fun m!351121 () Bool)

(assert (=> b!350731 m!351121))

(assert (=> b!350731 m!351121))

(declare-fun m!351123 () Bool)

(assert (=> b!350731 m!351123))

(declare-fun m!351125 () Bool)

(assert (=> b!350727 m!351125))

(declare-fun m!351127 () Bool)

(assert (=> b!350729 m!351127))

(check-sat (not b!350734) (not b!350729) (not b!350724) (not start!34996) (not b!350728) (not mapNonEmpty!12948) (not b_next!7699) (not b!350731) b_and!14943 (not b!350727) tp_is_empty!7651 (not b!350726))
(check-sat b_and!14943 (not b_next!7699))
