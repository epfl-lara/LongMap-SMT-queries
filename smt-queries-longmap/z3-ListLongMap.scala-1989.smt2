; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34804 () Bool)

(assert start!34804)

(declare-fun b_free!7603 () Bool)

(declare-fun b_next!7603 () Bool)

(assert (=> start!34804 (= b_free!7603 (not b_next!7603))))

(declare-fun tp!26376 () Bool)

(declare-fun b_and!14839 () Bool)

(assert (=> start!34804 (= tp!26376 b_and!14839)))

(declare-fun res!193067 () Bool)

(declare-fun e!213490 () Bool)

(assert (=> start!34804 (=> (not res!193067) (not e!213490))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34804 (= res!193067 (validMask!0 mask!2385))))

(assert (=> start!34804 e!213490))

(assert (=> start!34804 true))

(declare-fun tp_is_empty!7555 () Bool)

(assert (=> start!34804 tp_is_empty!7555))

(assert (=> start!34804 tp!26376))

(declare-datatypes ((V!11051 0))(
  ( (V!11052 (val!3822 Int)) )
))
(declare-datatypes ((ValueCell!3434 0))(
  ( (ValueCellFull!3434 (v!6006 V!11051)) (EmptyCell!3434) )
))
(declare-datatypes ((array!18684 0))(
  ( (array!18685 (arr!8851 (Array (_ BitVec 32) ValueCell!3434)) (size!9203 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18684)

(declare-fun e!213488 () Bool)

(declare-fun array_inv!6536 (array!18684) Bool)

(assert (=> start!34804 (and (array_inv!6536 _values!1525) e!213488)))

(declare-datatypes ((array!18686 0))(
  ( (array!18687 (arr!8852 (Array (_ BitVec 32) (_ BitVec 64))) (size!9204 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18686)

(declare-fun array_inv!6537 (array!18686) Bool)

(assert (=> start!34804 (array_inv!6537 _keys!1895)))

(declare-fun b!348456 () Bool)

(declare-fun res!193063 () Bool)

(assert (=> b!348456 (=> (not res!193063) (not e!213490))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11051)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11051)

(declare-datatypes ((tuple2!5438 0))(
  ( (tuple2!5439 (_1!2730 (_ BitVec 64)) (_2!2730 V!11051)) )
))
(declare-datatypes ((List!5046 0))(
  ( (Nil!5043) (Cons!5042 (h!5898 tuple2!5438) (t!10168 List!5046)) )
))
(declare-datatypes ((ListLongMap!4353 0))(
  ( (ListLongMap!4354 (toList!2192 List!5046)) )
))
(declare-fun contains!2276 (ListLongMap!4353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1720 (array!18686 array!18684 (_ BitVec 32) (_ BitVec 32) V!11051 V!11051 (_ BitVec 32) Int) ListLongMap!4353)

(assert (=> b!348456 (= res!193063 (not (contains!2276 (getCurrentListMap!1720 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348457 () Bool)

(declare-fun e!213485 () Bool)

(assert (=> b!348457 (= e!213485 false)))

(declare-fun lt!163909 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18686 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348457 (= lt!163909 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348458 () Bool)

(declare-fun res!193066 () Bool)

(assert (=> b!348458 (=> (not res!193066) (not e!213490))))

(assert (=> b!348458 (= res!193066 (and (= (size!9203 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9204 _keys!1895) (size!9203 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348459 () Bool)

(declare-fun res!193069 () Bool)

(assert (=> b!348459 (=> (not res!193069) (not e!213490))))

(declare-datatypes ((List!5047 0))(
  ( (Nil!5044) (Cons!5043 (h!5899 (_ BitVec 64)) (t!10169 List!5047)) )
))
(declare-fun arrayNoDuplicates!0 (array!18686 (_ BitVec 32) List!5047) Bool)

(assert (=> b!348459 (= res!193069 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5044))))

(declare-fun b!348460 () Bool)

(declare-fun res!193068 () Bool)

(assert (=> b!348460 (=> (not res!193068) (not e!213485))))

(declare-fun arrayContainsKey!0 (array!18686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348460 (= res!193068 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348461 () Bool)

(assert (=> b!348461 (= e!213490 e!213485)))

(declare-fun res!193065 () Bool)

(assert (=> b!348461 (=> (not res!193065) (not e!213485))))

(declare-datatypes ((SeekEntryResult!3367 0))(
  ( (MissingZero!3367 (index!15647 (_ BitVec 32))) (Found!3367 (index!15648 (_ BitVec 32))) (Intermediate!3367 (undefined!4179 Bool) (index!15649 (_ BitVec 32)) (x!34668 (_ BitVec 32))) (Undefined!3367) (MissingVacant!3367 (index!15650 (_ BitVec 32))) )
))
(declare-fun lt!163908 () SeekEntryResult!3367)

(get-info :version)

(assert (=> b!348461 (= res!193065 (and (not ((_ is Found!3367) lt!163908)) ((_ is MissingZero!3367) lt!163908)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18686 (_ BitVec 32)) SeekEntryResult!3367)

(assert (=> b!348461 (= lt!163908 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12792 () Bool)

(declare-fun mapRes!12792 () Bool)

(declare-fun tp!26375 () Bool)

(declare-fun e!213486 () Bool)

(assert (=> mapNonEmpty!12792 (= mapRes!12792 (and tp!26375 e!213486))))

(declare-fun mapRest!12792 () (Array (_ BitVec 32) ValueCell!3434))

(declare-fun mapKey!12792 () (_ BitVec 32))

(declare-fun mapValue!12792 () ValueCell!3434)

(assert (=> mapNonEmpty!12792 (= (arr!8851 _values!1525) (store mapRest!12792 mapKey!12792 mapValue!12792))))

(declare-fun b!348462 () Bool)

(declare-fun e!213489 () Bool)

(assert (=> b!348462 (= e!213488 (and e!213489 mapRes!12792))))

(declare-fun condMapEmpty!12792 () Bool)

(declare-fun mapDefault!12792 () ValueCell!3434)

(assert (=> b!348462 (= condMapEmpty!12792 (= (arr!8851 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3434)) mapDefault!12792)))))

(declare-fun b!348463 () Bool)

(declare-fun res!193062 () Bool)

(assert (=> b!348463 (=> (not res!193062) (not e!213490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18686 (_ BitVec 32)) Bool)

(assert (=> b!348463 (= res!193062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348464 () Bool)

(declare-fun res!193064 () Bool)

(assert (=> b!348464 (=> (not res!193064) (not e!213490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348464 (= res!193064 (validKeyInArray!0 k0!1348))))

(declare-fun b!348465 () Bool)

(assert (=> b!348465 (= e!213489 tp_is_empty!7555)))

(declare-fun b!348466 () Bool)

(assert (=> b!348466 (= e!213486 tp_is_empty!7555)))

(declare-fun mapIsEmpty!12792 () Bool)

(assert (=> mapIsEmpty!12792 mapRes!12792))

(assert (= (and start!34804 res!193067) b!348458))

(assert (= (and b!348458 res!193066) b!348463))

(assert (= (and b!348463 res!193062) b!348459))

(assert (= (and b!348459 res!193069) b!348464))

(assert (= (and b!348464 res!193064) b!348456))

(assert (= (and b!348456 res!193063) b!348461))

(assert (= (and b!348461 res!193065) b!348460))

(assert (= (and b!348460 res!193068) b!348457))

(assert (= (and b!348462 condMapEmpty!12792) mapIsEmpty!12792))

(assert (= (and b!348462 (not condMapEmpty!12792)) mapNonEmpty!12792))

(assert (= (and mapNonEmpty!12792 ((_ is ValueCellFull!3434) mapValue!12792)) b!348466))

(assert (= (and b!348462 ((_ is ValueCellFull!3434) mapDefault!12792)) b!348465))

(assert (= start!34804 b!348462))

(declare-fun m!349485 () Bool)

(assert (=> b!348460 m!349485))

(declare-fun m!349487 () Bool)

(assert (=> b!348456 m!349487))

(assert (=> b!348456 m!349487))

(declare-fun m!349489 () Bool)

(assert (=> b!348456 m!349489))

(declare-fun m!349491 () Bool)

(assert (=> b!348463 m!349491))

(declare-fun m!349493 () Bool)

(assert (=> b!348459 m!349493))

(declare-fun m!349495 () Bool)

(assert (=> b!348464 m!349495))

(declare-fun m!349497 () Bool)

(assert (=> start!34804 m!349497))

(declare-fun m!349499 () Bool)

(assert (=> start!34804 m!349499))

(declare-fun m!349501 () Bool)

(assert (=> start!34804 m!349501))

(declare-fun m!349503 () Bool)

(assert (=> b!348461 m!349503))

(declare-fun m!349505 () Bool)

(assert (=> mapNonEmpty!12792 m!349505))

(declare-fun m!349507 () Bool)

(assert (=> b!348457 m!349507))

(check-sat (not b!348463) (not b_next!7603) (not b!348461) (not b!348460) tp_is_empty!7555 (not mapNonEmpty!12792) (not b!348457) (not b!348456) (not b!348459) b_and!14839 (not b!348464) (not start!34804))
(check-sat b_and!14839 (not b_next!7603))
