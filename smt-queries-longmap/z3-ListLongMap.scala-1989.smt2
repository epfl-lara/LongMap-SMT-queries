; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34804 () Bool)

(assert start!34804)

(declare-fun b_free!7603 () Bool)

(declare-fun b_next!7603 () Bool)

(assert (=> start!34804 (= b_free!7603 (not b_next!7603))))

(declare-fun tp!26376 () Bool)

(declare-fun b_and!14799 () Bool)

(assert (=> start!34804 (= tp!26376 b_and!14799)))

(declare-fun b!348234 () Bool)

(declare-fun e!213347 () Bool)

(declare-fun e!213345 () Bool)

(assert (=> b!348234 (= e!213347 e!213345)))

(declare-fun res!192936 () Bool)

(assert (=> b!348234 (=> (not res!192936) (not e!213345))))

(declare-datatypes ((SeekEntryResult!3411 0))(
  ( (MissingZero!3411 (index!15823 (_ BitVec 32))) (Found!3411 (index!15824 (_ BitVec 32))) (Intermediate!3411 (undefined!4223 Bool) (index!15825 (_ BitVec 32)) (x!34710 (_ BitVec 32))) (Undefined!3411) (MissingVacant!3411 (index!15826 (_ BitVec 32))) )
))
(declare-fun lt!163655 () SeekEntryResult!3411)

(get-info :version)

(assert (=> b!348234 (= res!192936 (and (not ((_ is Found!3411) lt!163655)) ((_ is MissingZero!3411) lt!163655)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18679 0))(
  ( (array!18680 (arr!8849 (Array (_ BitVec 32) (_ BitVec 64))) (size!9202 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18679)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18679 (_ BitVec 32)) SeekEntryResult!3411)

(assert (=> b!348234 (= lt!163655 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348235 () Bool)

(declare-fun res!192943 () Bool)

(assert (=> b!348235 (=> (not res!192943) (not e!213347))))

(declare-datatypes ((V!11051 0))(
  ( (V!11052 (val!3822 Int)) )
))
(declare-datatypes ((ValueCell!3434 0))(
  ( (ValueCellFull!3434 (v!5999 V!11051)) (EmptyCell!3434) )
))
(declare-datatypes ((array!18681 0))(
  ( (array!18682 (arr!8850 (Array (_ BitVec 32) ValueCell!3434)) (size!9203 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18681)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348235 (= res!192943 (and (= (size!9203 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9202 _keys!1895) (size!9203 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348236 () Bool)

(declare-fun res!192942 () Bool)

(assert (=> b!348236 (=> (not res!192942) (not e!213345))))

(declare-fun arrayContainsKey!0 (array!18679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348236 (= res!192942 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348237 () Bool)

(declare-fun e!213346 () Bool)

(declare-fun tp_is_empty!7555 () Bool)

(assert (=> b!348237 (= e!213346 tp_is_empty!7555)))

(declare-fun mapNonEmpty!12792 () Bool)

(declare-fun mapRes!12792 () Bool)

(declare-fun tp!26375 () Bool)

(declare-fun e!213344 () Bool)

(assert (=> mapNonEmpty!12792 (= mapRes!12792 (and tp!26375 e!213344))))

(declare-fun mapKey!12792 () (_ BitVec 32))

(declare-fun mapRest!12792 () (Array (_ BitVec 32) ValueCell!3434))

(declare-fun mapValue!12792 () ValueCell!3434)

(assert (=> mapNonEmpty!12792 (= (arr!8850 _values!1525) (store mapRest!12792 mapKey!12792 mapValue!12792))))

(declare-fun b!348238 () Bool)

(declare-fun res!192939 () Bool)

(assert (=> b!348238 (=> (not res!192939) (not e!213347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18679 (_ BitVec 32)) Bool)

(assert (=> b!348238 (= res!192939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348239 () Bool)

(declare-fun res!192941 () Bool)

(assert (=> b!348239 (=> (not res!192941) (not e!213347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348239 (= res!192941 (validKeyInArray!0 k0!1348))))

(declare-fun b!348240 () Bool)

(declare-fun res!192940 () Bool)

(assert (=> b!348240 (=> (not res!192940) (not e!213347))))

(declare-datatypes ((List!5105 0))(
  ( (Nil!5102) (Cons!5101 (h!5957 (_ BitVec 64)) (t!10226 List!5105)) )
))
(declare-fun arrayNoDuplicates!0 (array!18679 (_ BitVec 32) List!5105) Bool)

(assert (=> b!348240 (= res!192940 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5102))))

(declare-fun b!348241 () Bool)

(declare-fun res!192938 () Bool)

(assert (=> b!348241 (=> (not res!192938) (not e!213347))))

(declare-fun zeroValue!1467 () V!11051)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11051)

(declare-datatypes ((tuple2!5488 0))(
  ( (tuple2!5489 (_1!2755 (_ BitVec 64)) (_2!2755 V!11051)) )
))
(declare-datatypes ((List!5106 0))(
  ( (Nil!5103) (Cons!5102 (h!5958 tuple2!5488) (t!10227 List!5106)) )
))
(declare-datatypes ((ListLongMap!4391 0))(
  ( (ListLongMap!4392 (toList!2211 List!5106)) )
))
(declare-fun contains!2287 (ListLongMap!4391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1716 (array!18679 array!18681 (_ BitVec 32) (_ BitVec 32) V!11051 V!11051 (_ BitVec 32) Int) ListLongMap!4391)

(assert (=> b!348241 (= res!192938 (not (contains!2287 (getCurrentListMap!1716 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348242 () Bool)

(assert (=> b!348242 (= e!213345 false)))

(declare-fun lt!163656 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18679 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348242 (= lt!163656 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348243 () Bool)

(declare-fun e!213343 () Bool)

(assert (=> b!348243 (= e!213343 (and e!213346 mapRes!12792))))

(declare-fun condMapEmpty!12792 () Bool)

(declare-fun mapDefault!12792 () ValueCell!3434)

(assert (=> b!348243 (= condMapEmpty!12792 (= (arr!8850 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3434)) mapDefault!12792)))))

(declare-fun res!192937 () Bool)

(assert (=> start!34804 (=> (not res!192937) (not e!213347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34804 (= res!192937 (validMask!0 mask!2385))))

(assert (=> start!34804 e!213347))

(assert (=> start!34804 true))

(assert (=> start!34804 tp_is_empty!7555))

(assert (=> start!34804 tp!26376))

(declare-fun array_inv!6568 (array!18681) Bool)

(assert (=> start!34804 (and (array_inv!6568 _values!1525) e!213343)))

(declare-fun array_inv!6569 (array!18679) Bool)

(assert (=> start!34804 (array_inv!6569 _keys!1895)))

(declare-fun b!348244 () Bool)

(assert (=> b!348244 (= e!213344 tp_is_empty!7555)))

(declare-fun mapIsEmpty!12792 () Bool)

(assert (=> mapIsEmpty!12792 mapRes!12792))

(assert (= (and start!34804 res!192937) b!348235))

(assert (= (and b!348235 res!192943) b!348238))

(assert (= (and b!348238 res!192939) b!348240))

(assert (= (and b!348240 res!192940) b!348239))

(assert (= (and b!348239 res!192941) b!348241))

(assert (= (and b!348241 res!192938) b!348234))

(assert (= (and b!348234 res!192936) b!348236))

(assert (= (and b!348236 res!192942) b!348242))

(assert (= (and b!348243 condMapEmpty!12792) mapIsEmpty!12792))

(assert (= (and b!348243 (not condMapEmpty!12792)) mapNonEmpty!12792))

(assert (= (and mapNonEmpty!12792 ((_ is ValueCellFull!3434) mapValue!12792)) b!348244))

(assert (= (and b!348243 ((_ is ValueCellFull!3434) mapDefault!12792)) b!348237))

(assert (= start!34804 b!348243))

(declare-fun m!348531 () Bool)

(assert (=> b!348234 m!348531))

(declare-fun m!348533 () Bool)

(assert (=> mapNonEmpty!12792 m!348533))

(declare-fun m!348535 () Bool)

(assert (=> b!348238 m!348535))

(declare-fun m!348537 () Bool)

(assert (=> b!348236 m!348537))

(declare-fun m!348539 () Bool)

(assert (=> b!348239 m!348539))

(declare-fun m!348541 () Bool)

(assert (=> b!348240 m!348541))

(declare-fun m!348543 () Bool)

(assert (=> b!348241 m!348543))

(assert (=> b!348241 m!348543))

(declare-fun m!348545 () Bool)

(assert (=> b!348241 m!348545))

(declare-fun m!348547 () Bool)

(assert (=> b!348242 m!348547))

(declare-fun m!348549 () Bool)

(assert (=> start!34804 m!348549))

(declare-fun m!348551 () Bool)

(assert (=> start!34804 m!348551))

(declare-fun m!348553 () Bool)

(assert (=> start!34804 m!348553))

(check-sat (not b!348239) (not b!348234) (not b!348242) (not b!348238) (not b!348241) (not b!348236) (not b_next!7603) b_and!14799 (not b!348240) (not start!34804) (not mapNonEmpty!12792) tp_is_empty!7555)
(check-sat b_and!14799 (not b_next!7603))
