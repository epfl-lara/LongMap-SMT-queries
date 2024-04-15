; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34810 () Bool)

(assert start!34810)

(declare-fun b_free!7609 () Bool)

(declare-fun b_next!7609 () Bool)

(assert (=> start!34810 (= b_free!7609 (not b_next!7609))))

(declare-fun tp!26393 () Bool)

(declare-fun b_and!14805 () Bool)

(assert (=> start!34810 (= tp!26393 b_and!14805)))

(declare-fun b!348333 () Bool)

(declare-fun res!193008 () Bool)

(declare-fun e!213402 () Bool)

(assert (=> b!348333 (=> (not res!193008) (not e!213402))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11059 0))(
  ( (V!11060 (val!3825 Int)) )
))
(declare-datatypes ((ValueCell!3437 0))(
  ( (ValueCellFull!3437 (v!6002 V!11059)) (EmptyCell!3437) )
))
(declare-datatypes ((array!18691 0))(
  ( (array!18692 (arr!8855 (Array (_ BitVec 32) ValueCell!3437)) (size!9208 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18691)

(declare-datatypes ((array!18693 0))(
  ( (array!18694 (arr!8856 (Array (_ BitVec 32) (_ BitVec 64))) (size!9209 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18693)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348333 (= res!193008 (and (= (size!9208 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9209 _keys!1895) (size!9208 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348334 () Bool)

(declare-fun e!213398 () Bool)

(declare-fun tp_is_empty!7561 () Bool)

(assert (=> b!348334 (= e!213398 tp_is_empty!7561)))

(declare-fun b!348335 () Bool)

(declare-fun e!213397 () Bool)

(declare-fun mapRes!12801 () Bool)

(assert (=> b!348335 (= e!213397 (and e!213398 mapRes!12801))))

(declare-fun condMapEmpty!12801 () Bool)

(declare-fun mapDefault!12801 () ValueCell!3437)

(assert (=> b!348335 (= condMapEmpty!12801 (= (arr!8855 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3437)) mapDefault!12801)))))

(declare-fun b!348336 () Bool)

(declare-fun res!193014 () Bool)

(assert (=> b!348336 (=> (not res!193014) (not e!213402))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348336 (= res!193014 (validKeyInArray!0 k0!1348))))

(declare-fun b!348337 () Bool)

(declare-fun e!213400 () Bool)

(assert (=> b!348337 (= e!213400 false)))

(declare-fun lt!163673 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18693 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348337 (= lt!163673 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348338 () Bool)

(declare-fun res!193010 () Bool)

(assert (=> b!348338 (=> (not res!193010) (not e!213402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18693 (_ BitVec 32)) Bool)

(assert (=> b!348338 (= res!193010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12801 () Bool)

(declare-fun tp!26394 () Bool)

(declare-fun e!213399 () Bool)

(assert (=> mapNonEmpty!12801 (= mapRes!12801 (and tp!26394 e!213399))))

(declare-fun mapValue!12801 () ValueCell!3437)

(declare-fun mapRest!12801 () (Array (_ BitVec 32) ValueCell!3437))

(declare-fun mapKey!12801 () (_ BitVec 32))

(assert (=> mapNonEmpty!12801 (= (arr!8855 _values!1525) (store mapRest!12801 mapKey!12801 mapValue!12801))))

(declare-fun b!348339 () Bool)

(declare-fun res!193012 () Bool)

(assert (=> b!348339 (=> (not res!193012) (not e!213400))))

(declare-fun arrayContainsKey!0 (array!18693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348339 (= res!193012 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12801 () Bool)

(assert (=> mapIsEmpty!12801 mapRes!12801))

(declare-fun b!348340 () Bool)

(declare-fun res!193009 () Bool)

(assert (=> b!348340 (=> (not res!193009) (not e!213402))))

(declare-fun zeroValue!1467 () V!11059)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11059)

(declare-datatypes ((tuple2!5494 0))(
  ( (tuple2!5495 (_1!2758 (_ BitVec 64)) (_2!2758 V!11059)) )
))
(declare-datatypes ((List!5109 0))(
  ( (Nil!5106) (Cons!5105 (h!5961 tuple2!5494) (t!10230 List!5109)) )
))
(declare-datatypes ((ListLongMap!4397 0))(
  ( (ListLongMap!4398 (toList!2214 List!5109)) )
))
(declare-fun contains!2290 (ListLongMap!4397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1719 (array!18693 array!18691 (_ BitVec 32) (_ BitVec 32) V!11059 V!11059 (_ BitVec 32) Int) ListLongMap!4397)

(assert (=> b!348340 (= res!193009 (not (contains!2290 (getCurrentListMap!1719 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348341 () Bool)

(assert (=> b!348341 (= e!213399 tp_is_empty!7561)))

(declare-fun b!348342 () Bool)

(declare-fun res!193015 () Bool)

(assert (=> b!348342 (=> (not res!193015) (not e!213402))))

(declare-datatypes ((List!5110 0))(
  ( (Nil!5107) (Cons!5106 (h!5962 (_ BitVec 64)) (t!10231 List!5110)) )
))
(declare-fun arrayNoDuplicates!0 (array!18693 (_ BitVec 32) List!5110) Bool)

(assert (=> b!348342 (= res!193015 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5107))))

(declare-fun res!193011 () Bool)

(assert (=> start!34810 (=> (not res!193011) (not e!213402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34810 (= res!193011 (validMask!0 mask!2385))))

(assert (=> start!34810 e!213402))

(assert (=> start!34810 true))

(assert (=> start!34810 tp_is_empty!7561))

(assert (=> start!34810 tp!26393))

(declare-fun array_inv!6574 (array!18691) Bool)

(assert (=> start!34810 (and (array_inv!6574 _values!1525) e!213397)))

(declare-fun array_inv!6575 (array!18693) Bool)

(assert (=> start!34810 (array_inv!6575 _keys!1895)))

(declare-fun b!348343 () Bool)

(assert (=> b!348343 (= e!213402 e!213400)))

(declare-fun res!193013 () Bool)

(assert (=> b!348343 (=> (not res!193013) (not e!213400))))

(declare-datatypes ((SeekEntryResult!3413 0))(
  ( (MissingZero!3413 (index!15831 (_ BitVec 32))) (Found!3413 (index!15832 (_ BitVec 32))) (Intermediate!3413 (undefined!4225 Bool) (index!15833 (_ BitVec 32)) (x!34720 (_ BitVec 32))) (Undefined!3413) (MissingVacant!3413 (index!15834 (_ BitVec 32))) )
))
(declare-fun lt!163674 () SeekEntryResult!3413)

(get-info :version)

(assert (=> b!348343 (= res!193013 (and (not ((_ is Found!3413) lt!163674)) ((_ is MissingZero!3413) lt!163674)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18693 (_ BitVec 32)) SeekEntryResult!3413)

(assert (=> b!348343 (= lt!163674 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34810 res!193011) b!348333))

(assert (= (and b!348333 res!193008) b!348338))

(assert (= (and b!348338 res!193010) b!348342))

(assert (= (and b!348342 res!193015) b!348336))

(assert (= (and b!348336 res!193014) b!348340))

(assert (= (and b!348340 res!193009) b!348343))

(assert (= (and b!348343 res!193013) b!348339))

(assert (= (and b!348339 res!193012) b!348337))

(assert (= (and b!348335 condMapEmpty!12801) mapIsEmpty!12801))

(assert (= (and b!348335 (not condMapEmpty!12801)) mapNonEmpty!12801))

(assert (= (and mapNonEmpty!12801 ((_ is ValueCellFull!3437) mapValue!12801)) b!348341))

(assert (= (and b!348335 ((_ is ValueCellFull!3437) mapDefault!12801)) b!348334))

(assert (= start!34810 b!348335))

(declare-fun m!348603 () Bool)

(assert (=> b!348336 m!348603))

(declare-fun m!348605 () Bool)

(assert (=> b!348343 m!348605))

(declare-fun m!348607 () Bool)

(assert (=> b!348338 m!348607))

(declare-fun m!348609 () Bool)

(assert (=> b!348340 m!348609))

(assert (=> b!348340 m!348609))

(declare-fun m!348611 () Bool)

(assert (=> b!348340 m!348611))

(declare-fun m!348613 () Bool)

(assert (=> b!348339 m!348613))

(declare-fun m!348615 () Bool)

(assert (=> mapNonEmpty!12801 m!348615))

(declare-fun m!348617 () Bool)

(assert (=> b!348337 m!348617))

(declare-fun m!348619 () Bool)

(assert (=> start!34810 m!348619))

(declare-fun m!348621 () Bool)

(assert (=> start!34810 m!348621))

(declare-fun m!348623 () Bool)

(assert (=> start!34810 m!348623))

(declare-fun m!348625 () Bool)

(assert (=> b!348342 m!348625))

(check-sat (not b!348337) b_and!14805 (not b!348336) (not b!348339) tp_is_empty!7561 (not b!348340) (not mapNonEmpty!12801) (not start!34810) (not b!348338) (not b!348342) (not b_next!7609) (not b!348343))
(check-sat b_and!14805 (not b_next!7609))
