; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34756 () Bool)

(assert start!34756)

(declare-fun b_free!7555 () Bool)

(declare-fun b_next!7555 () Bool)

(assert (=> start!34756 (= b_free!7555 (not b_next!7555))))

(declare-fun tp!26232 () Bool)

(declare-fun b_and!14791 () Bool)

(assert (=> start!34756 (= tp!26232 b_and!14791)))

(declare-fun b!347664 () Bool)

(declare-fun e!213020 () Bool)

(declare-fun tp_is_empty!7507 () Bool)

(assert (=> b!347664 (= e!213020 tp_is_empty!7507)))

(declare-fun b!347665 () Bool)

(declare-fun res!192493 () Bool)

(declare-fun e!213024 () Bool)

(assert (=> b!347665 (=> (not res!192493) (not e!213024))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347665 (= res!192493 (validKeyInArray!0 k0!1348))))

(declare-fun b!347666 () Bool)

(declare-fun res!192489 () Bool)

(assert (=> b!347666 (=> (not res!192489) (not e!213024))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10987 0))(
  ( (V!10988 (val!3798 Int)) )
))
(declare-datatypes ((ValueCell!3410 0))(
  ( (ValueCellFull!3410 (v!5982 V!10987)) (EmptyCell!3410) )
))
(declare-datatypes ((array!18596 0))(
  ( (array!18597 (arr!8807 (Array (_ BitVec 32) ValueCell!3410)) (size!9159 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18596)

(declare-datatypes ((array!18598 0))(
  ( (array!18599 (arr!8808 (Array (_ BitVec 32) (_ BitVec 64))) (size!9160 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18598)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347666 (= res!192489 (and (= (size!9159 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9160 _keys!1895) (size!9159 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347667 () Bool)

(declare-fun e!213021 () Bool)

(declare-fun e!213022 () Bool)

(assert (=> b!347667 (= e!213021 e!213022)))

(declare-fun res!192486 () Bool)

(assert (=> b!347667 (=> (not res!192486) (not e!213022))))

(declare-datatypes ((SeekEntryResult!3352 0))(
  ( (MissingZero!3352 (index!15587 (_ BitVec 32))) (Found!3352 (index!15588 (_ BitVec 32))) (Intermediate!3352 (undefined!4164 Bool) (index!15589 (_ BitVec 32)) (x!34589 (_ BitVec 32))) (Undefined!3352) (MissingVacant!3352 (index!15590 (_ BitVec 32))) )
))
(declare-fun lt!163696 () SeekEntryResult!3352)

(get-info :version)

(assert (=> b!347667 (= res!192486 (and ((_ is Found!3352) lt!163696) (= (select (arr!8808 _keys!1895) (index!15588 lt!163696)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18598 (_ BitVec 32)) SeekEntryResult!3352)

(assert (=> b!347667 (= lt!163696 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347668 () Bool)

(declare-fun res!192491 () Bool)

(assert (=> b!347668 (=> (not res!192491) (not e!213024))))

(declare-datatypes ((List!5014 0))(
  ( (Nil!5011) (Cons!5010 (h!5866 (_ BitVec 64)) (t!10136 List!5014)) )
))
(declare-fun arrayNoDuplicates!0 (array!18598 (_ BitVec 32) List!5014) Bool)

(assert (=> b!347668 (= res!192491 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5011))))

(declare-fun res!192488 () Bool)

(assert (=> start!34756 (=> (not res!192488) (not e!213024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34756 (= res!192488 (validMask!0 mask!2385))))

(assert (=> start!34756 e!213024))

(assert (=> start!34756 true))

(assert (=> start!34756 tp_is_empty!7507))

(assert (=> start!34756 tp!26232))

(declare-fun e!213025 () Bool)

(declare-fun array_inv!6506 (array!18596) Bool)

(assert (=> start!34756 (and (array_inv!6506 _values!1525) e!213025)))

(declare-fun array_inv!6507 (array!18598) Bool)

(assert (=> start!34756 (array_inv!6507 _keys!1895)))

(declare-fun mapIsEmpty!12720 () Bool)

(declare-fun mapRes!12720 () Bool)

(assert (=> mapIsEmpty!12720 mapRes!12720))

(declare-fun b!347669 () Bool)

(declare-fun res!192487 () Bool)

(assert (=> b!347669 (=> (not res!192487) (not e!213022))))

(declare-fun arrayContainsKey!0 (array!18598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347669 (= res!192487 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15588 lt!163696)))))

(declare-fun b!347670 () Bool)

(declare-fun res!192492 () Bool)

(assert (=> b!347670 (=> (not res!192492) (not e!213024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18598 (_ BitVec 32)) Bool)

(assert (=> b!347670 (= res!192492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12720 () Bool)

(declare-fun tp!26231 () Bool)

(declare-fun e!213019 () Bool)

(assert (=> mapNonEmpty!12720 (= mapRes!12720 (and tp!26231 e!213019))))

(declare-fun mapRest!12720 () (Array (_ BitVec 32) ValueCell!3410))

(declare-fun mapValue!12720 () ValueCell!3410)

(declare-fun mapKey!12720 () (_ BitVec 32))

(assert (=> mapNonEmpty!12720 (= (arr!8807 _values!1525) (store mapRest!12720 mapKey!12720 mapValue!12720))))

(declare-fun b!347671 () Bool)

(assert (=> b!347671 (= e!213022 (not false))))

(declare-datatypes ((tuple2!5408 0))(
  ( (tuple2!5409 (_1!2715 (_ BitVec 64)) (_2!2715 V!10987)) )
))
(declare-datatypes ((List!5015 0))(
  ( (Nil!5012) (Cons!5011 (h!5867 tuple2!5408) (t!10137 List!5015)) )
))
(declare-datatypes ((ListLongMap!4323 0))(
  ( (ListLongMap!4324 (toList!2177 List!5015)) )
))
(declare-fun lt!163698 () ListLongMap!4323)

(declare-fun contains!2261 (ListLongMap!4323 (_ BitVec 64)) Bool)

(assert (=> b!347671 (contains!2261 lt!163698 (select (arr!8808 _keys!1895) (index!15588 lt!163696)))))

(declare-datatypes ((Unit!10761 0))(
  ( (Unit!10762) )
))
(declare-fun lt!163697 () Unit!10761)

(declare-fun zeroValue!1467 () V!10987)

(declare-fun minValue!1467 () V!10987)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lemmaValidKeyInArrayIsInListMap!170 (array!18598 array!18596 (_ BitVec 32) (_ BitVec 32) V!10987 V!10987 (_ BitVec 32) Int) Unit!10761)

(assert (=> b!347671 (= lt!163697 (lemmaValidKeyInArrayIsInListMap!170 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15588 lt!163696) defaultEntry!1528))))

(assert (=> b!347671 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163699 () Unit!10761)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18598 (_ BitVec 64) (_ BitVec 32)) Unit!10761)

(assert (=> b!347671 (= lt!163699 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15588 lt!163696)))))

(declare-fun b!347672 () Bool)

(assert (=> b!347672 (= e!213019 tp_is_empty!7507)))

(declare-fun b!347673 () Bool)

(assert (=> b!347673 (= e!213024 e!213021)))

(declare-fun res!192490 () Bool)

(assert (=> b!347673 (=> (not res!192490) (not e!213021))))

(assert (=> b!347673 (= res!192490 (not (contains!2261 lt!163698 k0!1348)))))

(declare-fun getCurrentListMap!1706 (array!18598 array!18596 (_ BitVec 32) (_ BitVec 32) V!10987 V!10987 (_ BitVec 32) Int) ListLongMap!4323)

(assert (=> b!347673 (= lt!163698 (getCurrentListMap!1706 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347674 () Bool)

(assert (=> b!347674 (= e!213025 (and e!213020 mapRes!12720))))

(declare-fun condMapEmpty!12720 () Bool)

(declare-fun mapDefault!12720 () ValueCell!3410)

(assert (=> b!347674 (= condMapEmpty!12720 (= (arr!8807 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3410)) mapDefault!12720)))))

(assert (= (and start!34756 res!192488) b!347666))

(assert (= (and b!347666 res!192489) b!347670))

(assert (= (and b!347670 res!192492) b!347668))

(assert (= (and b!347668 res!192491) b!347665))

(assert (= (and b!347665 res!192493) b!347673))

(assert (= (and b!347673 res!192490) b!347667))

(assert (= (and b!347667 res!192486) b!347669))

(assert (= (and b!347669 res!192487) b!347671))

(assert (= (and b!347674 condMapEmpty!12720) mapIsEmpty!12720))

(assert (= (and b!347674 (not condMapEmpty!12720)) mapNonEmpty!12720))

(assert (= (and mapNonEmpty!12720 ((_ is ValueCellFull!3410) mapValue!12720)) b!347672))

(assert (= (and b!347674 ((_ is ValueCellFull!3410) mapDefault!12720)) b!347664))

(assert (= start!34756 b!347674))

(declare-fun m!348813 () Bool)

(assert (=> start!34756 m!348813))

(declare-fun m!348815 () Bool)

(assert (=> start!34756 m!348815))

(declare-fun m!348817 () Bool)

(assert (=> start!34756 m!348817))

(declare-fun m!348819 () Bool)

(assert (=> b!347670 m!348819))

(declare-fun m!348821 () Bool)

(assert (=> b!347671 m!348821))

(declare-fun m!348823 () Bool)

(assert (=> b!347671 m!348823))

(declare-fun m!348825 () Bool)

(assert (=> b!347671 m!348825))

(declare-fun m!348827 () Bool)

(assert (=> b!347671 m!348827))

(assert (=> b!347671 m!348823))

(declare-fun m!348829 () Bool)

(assert (=> b!347671 m!348829))

(declare-fun m!348831 () Bool)

(assert (=> mapNonEmpty!12720 m!348831))

(declare-fun m!348833 () Bool)

(assert (=> b!347665 m!348833))

(declare-fun m!348835 () Bool)

(assert (=> b!347668 m!348835))

(declare-fun m!348837 () Bool)

(assert (=> b!347673 m!348837))

(declare-fun m!348839 () Bool)

(assert (=> b!347673 m!348839))

(declare-fun m!348841 () Bool)

(assert (=> b!347669 m!348841))

(assert (=> b!347667 m!348823))

(declare-fun m!348843 () Bool)

(assert (=> b!347667 m!348843))

(check-sat (not b!347668) (not b!347669) b_and!14791 (not b_next!7555) (not mapNonEmpty!12720) (not b!347671) (not b!347665) (not start!34756) (not b!347667) (not b!347670) tp_is_empty!7507 (not b!347673))
(check-sat b_and!14791 (not b_next!7555))
