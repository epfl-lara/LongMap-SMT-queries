; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34820 () Bool)

(assert start!34820)

(declare-fun b_free!7605 () Bool)

(declare-fun b_next!7605 () Bool)

(assert (=> start!34820 (= b_free!7605 (not b_next!7605))))

(declare-fun tp!26382 () Bool)

(declare-fun b_and!14827 () Bool)

(assert (=> start!34820 (= tp!26382 b_and!14827)))

(declare-fun b!348542 () Bool)

(declare-fun e!213540 () Bool)

(declare-fun tp_is_empty!7557 () Bool)

(assert (=> b!348542 (= e!213540 tp_is_empty!7557)))

(declare-fun b!348544 () Bool)

(declare-fun e!213542 () Bool)

(assert (=> b!348544 (= e!213542 tp_is_empty!7557)))

(declare-fun b!348545 () Bool)

(declare-fun res!193090 () Bool)

(declare-fun e!213541 () Bool)

(assert (=> b!348545 (=> (not res!193090) (not e!213541))))

(declare-datatypes ((array!18701 0))(
  ( (array!18702 (arr!8860 (Array (_ BitVec 32) (_ BitVec 64))) (size!9212 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18701)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348545 (= res!193090 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348546 () Bool)

(declare-fun res!193091 () Bool)

(declare-fun e!213538 () Bool)

(assert (=> b!348546 (=> (not res!193091) (not e!213538))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18701 (_ BitVec 32)) Bool)

(assert (=> b!348546 (= res!193091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12795 () Bool)

(declare-fun mapRes!12795 () Bool)

(assert (=> mapIsEmpty!12795 mapRes!12795))

(declare-fun b!348547 () Bool)

(declare-fun res!193095 () Bool)

(assert (=> b!348547 (=> (not res!193095) (not e!213538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348547 (= res!193095 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12795 () Bool)

(declare-fun tp!26381 () Bool)

(assert (=> mapNonEmpty!12795 (= mapRes!12795 (and tp!26381 e!213540))))

(declare-datatypes ((V!11053 0))(
  ( (V!11054 (val!3823 Int)) )
))
(declare-datatypes ((ValueCell!3435 0))(
  ( (ValueCellFull!3435 (v!6006 V!11053)) (EmptyCell!3435) )
))
(declare-fun mapValue!12795 () ValueCell!3435)

(declare-fun mapRest!12795 () (Array (_ BitVec 32) ValueCell!3435))

(declare-datatypes ((array!18703 0))(
  ( (array!18704 (arr!8861 (Array (_ BitVec 32) ValueCell!3435)) (size!9213 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18703)

(declare-fun mapKey!12795 () (_ BitVec 32))

(assert (=> mapNonEmpty!12795 (= (arr!8861 _values!1525) (store mapRest!12795 mapKey!12795 mapValue!12795))))

(declare-fun b!348548 () Bool)

(assert (=> b!348548 (= e!213541 false)))

(declare-fun lt!163897 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18701 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348548 (= lt!163897 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!193092 () Bool)

(assert (=> start!34820 (=> (not res!193092) (not e!213538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34820 (= res!193092 (validMask!0 mask!2385))))

(assert (=> start!34820 e!213538))

(assert (=> start!34820 true))

(assert (=> start!34820 tp_is_empty!7557))

(assert (=> start!34820 tp!26382))

(declare-fun e!213537 () Bool)

(declare-fun array_inv!6558 (array!18703) Bool)

(assert (=> start!34820 (and (array_inv!6558 _values!1525) e!213537)))

(declare-fun array_inv!6559 (array!18701) Bool)

(assert (=> start!34820 (array_inv!6559 _keys!1895)))

(declare-fun b!348543 () Bool)

(assert (=> b!348543 (= e!213537 (and e!213542 mapRes!12795))))

(declare-fun condMapEmpty!12795 () Bool)

(declare-fun mapDefault!12795 () ValueCell!3435)

(assert (=> b!348543 (= condMapEmpty!12795 (= (arr!8861 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3435)) mapDefault!12795)))))

(declare-fun b!348549 () Bool)

(assert (=> b!348549 (= e!213538 e!213541)))

(declare-fun res!193089 () Bool)

(assert (=> b!348549 (=> (not res!193089) (not e!213541))))

(declare-datatypes ((SeekEntryResult!3417 0))(
  ( (MissingZero!3417 (index!15847 (_ BitVec 32))) (Found!3417 (index!15848 (_ BitVec 32))) (Intermediate!3417 (undefined!4229 Bool) (index!15849 (_ BitVec 32)) (x!34721 (_ BitVec 32))) (Undefined!3417) (MissingVacant!3417 (index!15850 (_ BitVec 32))) )
))
(declare-fun lt!163896 () SeekEntryResult!3417)

(get-info :version)

(assert (=> b!348549 (= res!193089 (and (not ((_ is Found!3417) lt!163896)) ((_ is MissingZero!3417) lt!163896)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18701 (_ BitVec 32)) SeekEntryResult!3417)

(assert (=> b!348549 (= lt!163896 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348550 () Bool)

(declare-fun res!193094 () Bool)

(assert (=> b!348550 (=> (not res!193094) (not e!213538))))

(declare-datatypes ((List!5148 0))(
  ( (Nil!5145) (Cons!5144 (h!6000 (_ BitVec 64)) (t!10278 List!5148)) )
))
(declare-fun arrayNoDuplicates!0 (array!18701 (_ BitVec 32) List!5148) Bool)

(assert (=> b!348550 (= res!193094 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5145))))

(declare-fun b!348551 () Bool)

(declare-fun res!193093 () Bool)

(assert (=> b!348551 (=> (not res!193093) (not e!213538))))

(declare-fun zeroValue!1467 () V!11053)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11053)

(declare-datatypes ((tuple2!5528 0))(
  ( (tuple2!5529 (_1!2775 (_ BitVec 64)) (_2!2775 V!11053)) )
))
(declare-datatypes ((List!5149 0))(
  ( (Nil!5146) (Cons!5145 (h!6001 tuple2!5528) (t!10279 List!5149)) )
))
(declare-datatypes ((ListLongMap!4441 0))(
  ( (ListLongMap!4442 (toList!2236 List!5149)) )
))
(declare-fun contains!2301 (ListLongMap!4441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1757 (array!18701 array!18703 (_ BitVec 32) (_ BitVec 32) V!11053 V!11053 (_ BitVec 32) Int) ListLongMap!4441)

(assert (=> b!348551 (= res!193093 (not (contains!2301 (getCurrentListMap!1757 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348552 () Bool)

(declare-fun res!193096 () Bool)

(assert (=> b!348552 (=> (not res!193096) (not e!213538))))

(assert (=> b!348552 (= res!193096 (and (= (size!9213 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9212 _keys!1895) (size!9213 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34820 res!193092) b!348552))

(assert (= (and b!348552 res!193096) b!348546))

(assert (= (and b!348546 res!193091) b!348550))

(assert (= (and b!348550 res!193094) b!348547))

(assert (= (and b!348547 res!193095) b!348551))

(assert (= (and b!348551 res!193093) b!348549))

(assert (= (and b!348549 res!193089) b!348545))

(assert (= (and b!348545 res!193090) b!348548))

(assert (= (and b!348543 condMapEmpty!12795) mapIsEmpty!12795))

(assert (= (and b!348543 (not condMapEmpty!12795)) mapNonEmpty!12795))

(assert (= (and mapNonEmpty!12795 ((_ is ValueCellFull!3435) mapValue!12795)) b!348542))

(assert (= (and b!348543 ((_ is ValueCellFull!3435) mapDefault!12795)) b!348544))

(assert (= start!34820 b!348543))

(declare-fun m!349285 () Bool)

(assert (=> b!348545 m!349285))

(declare-fun m!349287 () Bool)

(assert (=> b!348546 m!349287))

(declare-fun m!349289 () Bool)

(assert (=> b!348551 m!349289))

(assert (=> b!348551 m!349289))

(declare-fun m!349291 () Bool)

(assert (=> b!348551 m!349291))

(declare-fun m!349293 () Bool)

(assert (=> b!348550 m!349293))

(declare-fun m!349295 () Bool)

(assert (=> b!348547 m!349295))

(declare-fun m!349297 () Bool)

(assert (=> mapNonEmpty!12795 m!349297))

(declare-fun m!349299 () Bool)

(assert (=> b!348549 m!349299))

(declare-fun m!349301 () Bool)

(assert (=> b!348548 m!349301))

(declare-fun m!349303 () Bool)

(assert (=> start!34820 m!349303))

(declare-fun m!349305 () Bool)

(assert (=> start!34820 m!349305))

(declare-fun m!349307 () Bool)

(assert (=> start!34820 m!349307))

(check-sat (not b!348548) (not start!34820) (not b!348549) (not b_next!7605) tp_is_empty!7557 (not b!348546) (not b!348547) (not b!348545) (not b!348550) (not mapNonEmpty!12795) b_and!14827 (not b!348551))
(check-sat b_and!14827 (not b_next!7605))
