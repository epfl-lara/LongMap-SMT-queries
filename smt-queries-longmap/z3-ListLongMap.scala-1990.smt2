; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34810 () Bool)

(assert start!34810)

(declare-fun b_free!7609 () Bool)

(declare-fun b_next!7609 () Bool)

(assert (=> start!34810 (= b_free!7609 (not b_next!7609))))

(declare-fun tp!26394 () Bool)

(declare-fun b_and!14845 () Bool)

(assert (=> start!34810 (= tp!26394 b_and!14845)))

(declare-fun b!348555 () Bool)

(declare-fun e!213540 () Bool)

(assert (=> b!348555 (= e!213540 false)))

(declare-fun lt!163927 () (_ BitVec 32))

(declare-datatypes ((array!18696 0))(
  ( (array!18697 (arr!8857 (Array (_ BitVec 32) (_ BitVec 64))) (size!9209 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18696)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18696 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348555 (= lt!163927 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348556 () Bool)

(declare-fun res!193135 () Bool)

(declare-fun e!213539 () Bool)

(assert (=> b!348556 (=> (not res!193135) (not e!213539))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18696 (_ BitVec 32)) Bool)

(assert (=> b!348556 (= res!193135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12801 () Bool)

(declare-fun mapRes!12801 () Bool)

(declare-fun tp!26393 () Bool)

(declare-fun e!213544 () Bool)

(assert (=> mapNonEmpty!12801 (= mapRes!12801 (and tp!26393 e!213544))))

(declare-fun mapKey!12801 () (_ BitVec 32))

(declare-datatypes ((V!11059 0))(
  ( (V!11060 (val!3825 Int)) )
))
(declare-datatypes ((ValueCell!3437 0))(
  ( (ValueCellFull!3437 (v!6009 V!11059)) (EmptyCell!3437) )
))
(declare-fun mapRest!12801 () (Array (_ BitVec 32) ValueCell!3437))

(declare-datatypes ((array!18698 0))(
  ( (array!18699 (arr!8858 (Array (_ BitVec 32) ValueCell!3437)) (size!9210 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18698)

(declare-fun mapValue!12801 () ValueCell!3437)

(assert (=> mapNonEmpty!12801 (= (arr!8858 _values!1525) (store mapRest!12801 mapKey!12801 mapValue!12801))))

(declare-fun res!193134 () Bool)

(assert (=> start!34810 (=> (not res!193134) (not e!213539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34810 (= res!193134 (validMask!0 mask!2385))))

(assert (=> start!34810 e!213539))

(assert (=> start!34810 true))

(declare-fun tp_is_empty!7561 () Bool)

(assert (=> start!34810 tp_is_empty!7561))

(assert (=> start!34810 tp!26394))

(declare-fun e!213543 () Bool)

(declare-fun array_inv!6542 (array!18698) Bool)

(assert (=> start!34810 (and (array_inv!6542 _values!1525) e!213543)))

(declare-fun array_inv!6543 (array!18696) Bool)

(assert (=> start!34810 (array_inv!6543 _keys!1895)))

(declare-fun b!348557 () Bool)

(declare-fun res!193138 () Bool)

(assert (=> b!348557 (=> (not res!193138) (not e!213539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348557 (= res!193138 (validKeyInArray!0 k0!1348))))

(declare-fun b!348558 () Bool)

(declare-fun e!213542 () Bool)

(assert (=> b!348558 (= e!213543 (and e!213542 mapRes!12801))))

(declare-fun condMapEmpty!12801 () Bool)

(declare-fun mapDefault!12801 () ValueCell!3437)

(assert (=> b!348558 (= condMapEmpty!12801 (= (arr!8858 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3437)) mapDefault!12801)))))

(declare-fun b!348559 () Bool)

(assert (=> b!348559 (= e!213542 tp_is_empty!7561)))

(declare-fun b!348560 () Bool)

(declare-fun res!193141 () Bool)

(assert (=> b!348560 (=> (not res!193141) (not e!213539))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348560 (= res!193141 (and (= (size!9210 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9209 _keys!1895) (size!9210 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348561 () Bool)

(declare-fun res!193137 () Bool)

(assert (=> b!348561 (=> (not res!193137) (not e!213540))))

(declare-fun arrayContainsKey!0 (array!18696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348561 (= res!193137 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348562 () Bool)

(declare-fun res!193140 () Bool)

(assert (=> b!348562 (=> (not res!193140) (not e!213539))))

(declare-datatypes ((List!5049 0))(
  ( (Nil!5046) (Cons!5045 (h!5901 (_ BitVec 64)) (t!10171 List!5049)) )
))
(declare-fun arrayNoDuplicates!0 (array!18696 (_ BitVec 32) List!5049) Bool)

(assert (=> b!348562 (= res!193140 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5046))))

(declare-fun b!348563 () Bool)

(assert (=> b!348563 (= e!213539 e!213540)))

(declare-fun res!193136 () Bool)

(assert (=> b!348563 (=> (not res!193136) (not e!213540))))

(declare-datatypes ((SeekEntryResult!3369 0))(
  ( (MissingZero!3369 (index!15655 (_ BitVec 32))) (Found!3369 (index!15656 (_ BitVec 32))) (Intermediate!3369 (undefined!4181 Bool) (index!15657 (_ BitVec 32)) (x!34678 (_ BitVec 32))) (Undefined!3369) (MissingVacant!3369 (index!15658 (_ BitVec 32))) )
))
(declare-fun lt!163926 () SeekEntryResult!3369)

(get-info :version)

(assert (=> b!348563 (= res!193136 (and (not ((_ is Found!3369) lt!163926)) ((_ is MissingZero!3369) lt!163926)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18696 (_ BitVec 32)) SeekEntryResult!3369)

(assert (=> b!348563 (= lt!163926 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12801 () Bool)

(assert (=> mapIsEmpty!12801 mapRes!12801))

(declare-fun b!348564 () Bool)

(assert (=> b!348564 (= e!213544 tp_is_empty!7561)))

(declare-fun b!348565 () Bool)

(declare-fun res!193139 () Bool)

(assert (=> b!348565 (=> (not res!193139) (not e!213539))))

(declare-fun zeroValue!1467 () V!11059)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11059)

(declare-datatypes ((tuple2!5442 0))(
  ( (tuple2!5443 (_1!2732 (_ BitVec 64)) (_2!2732 V!11059)) )
))
(declare-datatypes ((List!5050 0))(
  ( (Nil!5047) (Cons!5046 (h!5902 tuple2!5442) (t!10172 List!5050)) )
))
(declare-datatypes ((ListLongMap!4357 0))(
  ( (ListLongMap!4358 (toList!2194 List!5050)) )
))
(declare-fun contains!2278 (ListLongMap!4357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1722 (array!18696 array!18698 (_ BitVec 32) (_ BitVec 32) V!11059 V!11059 (_ BitVec 32) Int) ListLongMap!4357)

(assert (=> b!348565 (= res!193139 (not (contains!2278 (getCurrentListMap!1722 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34810 res!193134) b!348560))

(assert (= (and b!348560 res!193141) b!348556))

(assert (= (and b!348556 res!193135) b!348562))

(assert (= (and b!348562 res!193140) b!348557))

(assert (= (and b!348557 res!193138) b!348565))

(assert (= (and b!348565 res!193139) b!348563))

(assert (= (and b!348563 res!193136) b!348561))

(assert (= (and b!348561 res!193137) b!348555))

(assert (= (and b!348558 condMapEmpty!12801) mapIsEmpty!12801))

(assert (= (and b!348558 (not condMapEmpty!12801)) mapNonEmpty!12801))

(assert (= (and mapNonEmpty!12801 ((_ is ValueCellFull!3437) mapValue!12801)) b!348564))

(assert (= (and b!348558 ((_ is ValueCellFull!3437) mapDefault!12801)) b!348559))

(assert (= start!34810 b!348558))

(declare-fun m!349557 () Bool)

(assert (=> b!348563 m!349557))

(declare-fun m!349559 () Bool)

(assert (=> mapNonEmpty!12801 m!349559))

(declare-fun m!349561 () Bool)

(assert (=> start!34810 m!349561))

(declare-fun m!349563 () Bool)

(assert (=> start!34810 m!349563))

(declare-fun m!349565 () Bool)

(assert (=> start!34810 m!349565))

(declare-fun m!349567 () Bool)

(assert (=> b!348555 m!349567))

(declare-fun m!349569 () Bool)

(assert (=> b!348557 m!349569))

(declare-fun m!349571 () Bool)

(assert (=> b!348562 m!349571))

(declare-fun m!349573 () Bool)

(assert (=> b!348561 m!349573))

(declare-fun m!349575 () Bool)

(assert (=> b!348565 m!349575))

(assert (=> b!348565 m!349575))

(declare-fun m!349577 () Bool)

(assert (=> b!348565 m!349577))

(declare-fun m!349579 () Bool)

(assert (=> b!348556 m!349579))

(check-sat (not b!348565) (not b!348562) tp_is_empty!7561 (not start!34810) (not b!348561) (not b!348557) (not mapNonEmpty!12801) (not b!348563) (not b_next!7609) b_and!14845 (not b!348556) (not b!348555))
(check-sat b_and!14845 (not b_next!7609))
