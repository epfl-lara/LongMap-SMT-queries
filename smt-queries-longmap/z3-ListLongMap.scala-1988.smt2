; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34814 () Bool)

(assert start!34814)

(declare-fun b_free!7599 () Bool)

(declare-fun b_next!7599 () Bool)

(assert (=> start!34814 (= b_free!7599 (not b_next!7599))))

(declare-fun tp!26364 () Bool)

(declare-fun b_and!14821 () Bool)

(assert (=> start!34814 (= tp!26364 b_and!14821)))

(declare-fun b!348443 () Bool)

(declare-fun e!213485 () Bool)

(declare-fun tp_is_empty!7551 () Bool)

(assert (=> b!348443 (= e!213485 tp_is_empty!7551)))

(declare-fun b!348444 () Bool)

(declare-fun res!193020 () Bool)

(declare-fun e!213483 () Bool)

(assert (=> b!348444 (=> (not res!193020) (not e!213483))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11045 0))(
  ( (V!11046 (val!3820 Int)) )
))
(declare-fun zeroValue!1467 () V!11045)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3432 0))(
  ( (ValueCellFull!3432 (v!6003 V!11045)) (EmptyCell!3432) )
))
(declare-datatypes ((array!18689 0))(
  ( (array!18690 (arr!8854 (Array (_ BitVec 32) ValueCell!3432)) (size!9206 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18689)

(declare-datatypes ((array!18691 0))(
  ( (array!18692 (arr!8855 (Array (_ BitVec 32) (_ BitVec 64))) (size!9207 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18691)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11045)

(declare-datatypes ((tuple2!5524 0))(
  ( (tuple2!5525 (_1!2773 (_ BitVec 64)) (_2!2773 V!11045)) )
))
(declare-datatypes ((List!5144 0))(
  ( (Nil!5141) (Cons!5140 (h!5996 tuple2!5524) (t!10274 List!5144)) )
))
(declare-datatypes ((ListLongMap!4437 0))(
  ( (ListLongMap!4438 (toList!2234 List!5144)) )
))
(declare-fun contains!2299 (ListLongMap!4437 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1755 (array!18691 array!18689 (_ BitVec 32) (_ BitVec 32) V!11045 V!11045 (_ BitVec 32) Int) ListLongMap!4437)

(assert (=> b!348444 (= res!193020 (not (contains!2299 (getCurrentListMap!1755 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12786 () Bool)

(declare-fun mapRes!12786 () Bool)

(declare-fun tp!26363 () Bool)

(assert (=> mapNonEmpty!12786 (= mapRes!12786 (and tp!26363 e!213485))))

(declare-fun mapRest!12786 () (Array (_ BitVec 32) ValueCell!3432))

(declare-fun mapValue!12786 () ValueCell!3432)

(declare-fun mapKey!12786 () (_ BitVec 32))

(assert (=> mapNonEmpty!12786 (= (arr!8854 _values!1525) (store mapRest!12786 mapKey!12786 mapValue!12786))))

(declare-fun mapIsEmpty!12786 () Bool)

(assert (=> mapIsEmpty!12786 mapRes!12786))

(declare-fun b!348445 () Bool)

(declare-fun res!193024 () Bool)

(assert (=> b!348445 (=> (not res!193024) (not e!213483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18691 (_ BitVec 32)) Bool)

(assert (=> b!348445 (= res!193024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348446 () Bool)

(declare-fun e!213487 () Bool)

(declare-fun e!213484 () Bool)

(assert (=> b!348446 (= e!213487 (and e!213484 mapRes!12786))))

(declare-fun condMapEmpty!12786 () Bool)

(declare-fun mapDefault!12786 () ValueCell!3432)

(assert (=> b!348446 (= condMapEmpty!12786 (= (arr!8854 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3432)) mapDefault!12786)))))

(declare-fun b!348447 () Bool)

(declare-fun res!193022 () Bool)

(assert (=> b!348447 (=> (not res!193022) (not e!213483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348447 (= res!193022 (validKeyInArray!0 k0!1348))))

(declare-fun b!348448 () Bool)

(declare-fun res!193017 () Bool)

(assert (=> b!348448 (=> (not res!193017) (not e!213483))))

(assert (=> b!348448 (= res!193017 (and (= (size!9206 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9207 _keys!1895) (size!9206 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!193021 () Bool)

(assert (=> start!34814 (=> (not res!193021) (not e!213483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34814 (= res!193021 (validMask!0 mask!2385))))

(assert (=> start!34814 e!213483))

(assert (=> start!34814 true))

(assert (=> start!34814 tp_is_empty!7551))

(assert (=> start!34814 tp!26364))

(declare-fun array_inv!6556 (array!18689) Bool)

(assert (=> start!34814 (and (array_inv!6556 _values!1525) e!213487)))

(declare-fun array_inv!6557 (array!18691) Bool)

(assert (=> start!34814 (array_inv!6557 _keys!1895)))

(declare-fun b!348449 () Bool)

(assert (=> b!348449 (= e!213484 tp_is_empty!7551)))

(declare-fun b!348450 () Bool)

(declare-fun e!213486 () Bool)

(assert (=> b!348450 (= e!213486 false)))

(declare-fun lt!163879 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18691 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348450 (= lt!163879 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348451 () Bool)

(assert (=> b!348451 (= e!213483 e!213486)))

(declare-fun res!193019 () Bool)

(assert (=> b!348451 (=> (not res!193019) (not e!213486))))

(declare-datatypes ((SeekEntryResult!3414 0))(
  ( (MissingZero!3414 (index!15835 (_ BitVec 32))) (Found!3414 (index!15836 (_ BitVec 32))) (Intermediate!3414 (undefined!4226 Bool) (index!15837 (_ BitVec 32)) (x!34710 (_ BitVec 32))) (Undefined!3414) (MissingVacant!3414 (index!15838 (_ BitVec 32))) )
))
(declare-fun lt!163878 () SeekEntryResult!3414)

(get-info :version)

(assert (=> b!348451 (= res!193019 (and (not ((_ is Found!3414) lt!163878)) ((_ is MissingZero!3414) lt!163878)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18691 (_ BitVec 32)) SeekEntryResult!3414)

(assert (=> b!348451 (= lt!163878 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348452 () Bool)

(declare-fun res!193018 () Bool)

(assert (=> b!348452 (=> (not res!193018) (not e!213483))))

(declare-datatypes ((List!5145 0))(
  ( (Nil!5142) (Cons!5141 (h!5997 (_ BitVec 64)) (t!10275 List!5145)) )
))
(declare-fun arrayNoDuplicates!0 (array!18691 (_ BitVec 32) List!5145) Bool)

(assert (=> b!348452 (= res!193018 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5142))))

(declare-fun b!348453 () Bool)

(declare-fun res!193023 () Bool)

(assert (=> b!348453 (=> (not res!193023) (not e!213486))))

(declare-fun arrayContainsKey!0 (array!18691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348453 (= res!193023 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34814 res!193021) b!348448))

(assert (= (and b!348448 res!193017) b!348445))

(assert (= (and b!348445 res!193024) b!348452))

(assert (= (and b!348452 res!193018) b!348447))

(assert (= (and b!348447 res!193022) b!348444))

(assert (= (and b!348444 res!193020) b!348451))

(assert (= (and b!348451 res!193019) b!348453))

(assert (= (and b!348453 res!193023) b!348450))

(assert (= (and b!348446 condMapEmpty!12786) mapIsEmpty!12786))

(assert (= (and b!348446 (not condMapEmpty!12786)) mapNonEmpty!12786))

(assert (= (and mapNonEmpty!12786 ((_ is ValueCellFull!3432) mapValue!12786)) b!348443))

(assert (= (and b!348446 ((_ is ValueCellFull!3432) mapDefault!12786)) b!348449))

(assert (= start!34814 b!348446))

(declare-fun m!349213 () Bool)

(assert (=> start!34814 m!349213))

(declare-fun m!349215 () Bool)

(assert (=> start!34814 m!349215))

(declare-fun m!349217 () Bool)

(assert (=> start!34814 m!349217))

(declare-fun m!349219 () Bool)

(assert (=> b!348447 m!349219))

(declare-fun m!349221 () Bool)

(assert (=> b!348452 m!349221))

(declare-fun m!349223 () Bool)

(assert (=> b!348445 m!349223))

(declare-fun m!349225 () Bool)

(assert (=> b!348450 m!349225))

(declare-fun m!349227 () Bool)

(assert (=> mapNonEmpty!12786 m!349227))

(declare-fun m!349229 () Bool)

(assert (=> b!348453 m!349229))

(declare-fun m!349231 () Bool)

(assert (=> b!348444 m!349231))

(assert (=> b!348444 m!349231))

(declare-fun m!349233 () Bool)

(assert (=> b!348444 m!349233))

(declare-fun m!349235 () Bool)

(assert (=> b!348451 m!349235))

(check-sat (not b!348451) (not b_next!7599) (not b!348453) (not b!348452) (not b!348450) b_and!14821 (not b!348447) (not mapNonEmpty!12786) tp_is_empty!7551 (not b!348444) (not b!348445) (not start!34814))
(check-sat b_and!14821 (not b_next!7599))
