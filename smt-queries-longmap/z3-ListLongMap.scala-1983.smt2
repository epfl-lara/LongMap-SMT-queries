; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34784 () Bool)

(assert start!34784)

(declare-fun b_free!7569 () Bool)

(declare-fun b_next!7569 () Bool)

(assert (=> start!34784 (= b_free!7569 (not b_next!7569))))

(declare-fun tp!26274 () Bool)

(declare-fun b_and!14791 () Bool)

(assert (=> start!34784 (= tp!26274 b_and!14791)))

(declare-fun b!347949 () Bool)

(declare-fun e!213203 () Bool)

(assert (=> b!347949 (= e!213203 (not true))))

(declare-datatypes ((V!11005 0))(
  ( (V!11006 (val!3805 Int)) )
))
(declare-datatypes ((tuple2!5500 0))(
  ( (tuple2!5501 (_1!2761 (_ BitVec 64)) (_2!2761 V!11005)) )
))
(declare-datatypes ((List!5124 0))(
  ( (Nil!5121) (Cons!5120 (h!5976 tuple2!5500) (t!10254 List!5124)) )
))
(declare-datatypes ((ListLongMap!4413 0))(
  ( (ListLongMap!4414 (toList!2222 List!5124)) )
))
(declare-fun lt!163765 () ListLongMap!4413)

(declare-datatypes ((array!18629 0))(
  ( (array!18630 (arr!8824 (Array (_ BitVec 32) (_ BitVec 64))) (size!9176 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18629)

(declare-datatypes ((SeekEntryResult!3405 0))(
  ( (MissingZero!3405 (index!15799 (_ BitVec 32))) (Found!3405 (index!15800 (_ BitVec 32))) (Intermediate!3405 (undefined!4217 Bool) (index!15801 (_ BitVec 32)) (x!34661 (_ BitVec 32))) (Undefined!3405) (MissingVacant!3405 (index!15802 (_ BitVec 32))) )
))
(declare-fun lt!163763 () SeekEntryResult!3405)

(declare-fun contains!2287 (ListLongMap!4413 (_ BitVec 64)) Bool)

(assert (=> b!347949 (contains!2287 lt!163765 (select (arr!8824 _keys!1895) (index!15800 lt!163763)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((Unit!10799 0))(
  ( (Unit!10800) )
))
(declare-fun lt!163762 () Unit!10799)

(declare-fun zeroValue!1467 () V!11005)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11005)

(declare-datatypes ((ValueCell!3417 0))(
  ( (ValueCellFull!3417 (v!5988 V!11005)) (EmptyCell!3417) )
))
(declare-datatypes ((array!18631 0))(
  ( (array!18632 (arr!8825 (Array (_ BitVec 32) ValueCell!3417)) (size!9177 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18631)

(declare-fun lemmaValidKeyInArrayIsInListMap!177 (array!18629 array!18631 (_ BitVec 32) (_ BitVec 32) V!11005 V!11005 (_ BitVec 32) Int) Unit!10799)

(assert (=> b!347949 (= lt!163762 (lemmaValidKeyInArrayIsInListMap!177 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15800 lt!163763) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347949 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163764 () Unit!10799)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18629 (_ BitVec 64) (_ BitVec 32)) Unit!10799)

(assert (=> b!347949 (= lt!163764 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15800 lt!163763)))))

(declare-fun mapNonEmpty!12741 () Bool)

(declare-fun mapRes!12741 () Bool)

(declare-fun tp!26273 () Bool)

(declare-fun e!213205 () Bool)

(assert (=> mapNonEmpty!12741 (= mapRes!12741 (and tp!26273 e!213205))))

(declare-fun mapValue!12741 () ValueCell!3417)

(declare-fun mapRest!12741 () (Array (_ BitVec 32) ValueCell!3417))

(declare-fun mapKey!12741 () (_ BitVec 32))

(assert (=> mapNonEmpty!12741 (= (arr!8825 _values!1525) (store mapRest!12741 mapKey!12741 mapValue!12741))))

(declare-fun b!347950 () Bool)

(declare-fun e!213204 () Bool)

(declare-fun e!213200 () Bool)

(assert (=> b!347950 (= e!213204 (and e!213200 mapRes!12741))))

(declare-fun condMapEmpty!12741 () Bool)

(declare-fun mapDefault!12741 () ValueCell!3417)

(assert (=> b!347950 (= condMapEmpty!12741 (= (arr!8825 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3417)) mapDefault!12741)))))

(declare-fun b!347951 () Bool)

(declare-fun e!213202 () Bool)

(declare-fun e!213206 () Bool)

(assert (=> b!347951 (= e!213202 e!213206)))

(declare-fun res!192661 () Bool)

(assert (=> b!347951 (=> (not res!192661) (not e!213206))))

(assert (=> b!347951 (= res!192661 (not (contains!2287 lt!163765 k0!1348)))))

(declare-fun getCurrentListMap!1743 (array!18629 array!18631 (_ BitVec 32) (_ BitVec 32) V!11005 V!11005 (_ BitVec 32) Int) ListLongMap!4413)

(assert (=> b!347951 (= lt!163765 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347952 () Bool)

(declare-fun res!192659 () Bool)

(assert (=> b!347952 (=> (not res!192659) (not e!213203))))

(assert (=> b!347952 (= res!192659 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15800 lt!163763)))))

(declare-fun b!347953 () Bool)

(declare-fun res!192657 () Bool)

(assert (=> b!347953 (=> (not res!192657) (not e!213202))))

(declare-datatypes ((List!5125 0))(
  ( (Nil!5122) (Cons!5121 (h!5977 (_ BitVec 64)) (t!10255 List!5125)) )
))
(declare-fun arrayNoDuplicates!0 (array!18629 (_ BitVec 32) List!5125) Bool)

(assert (=> b!347953 (= res!192657 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5122))))

(declare-fun res!192664 () Bool)

(assert (=> start!34784 (=> (not res!192664) (not e!213202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34784 (= res!192664 (validMask!0 mask!2385))))

(assert (=> start!34784 e!213202))

(assert (=> start!34784 true))

(declare-fun tp_is_empty!7521 () Bool)

(assert (=> start!34784 tp_is_empty!7521))

(assert (=> start!34784 tp!26274))

(declare-fun array_inv!6534 (array!18631) Bool)

(assert (=> start!34784 (and (array_inv!6534 _values!1525) e!213204)))

(declare-fun array_inv!6535 (array!18629) Bool)

(assert (=> start!34784 (array_inv!6535 _keys!1895)))

(declare-fun b!347948 () Bool)

(assert (=> b!347948 (= e!213200 tp_is_empty!7521)))

(declare-fun b!347954 () Bool)

(assert (=> b!347954 (= e!213206 e!213203)))

(declare-fun res!192662 () Bool)

(assert (=> b!347954 (=> (not res!192662) (not e!213203))))

(get-info :version)

(assert (=> b!347954 (= res!192662 (and ((_ is Found!3405) lt!163763) (= (select (arr!8824 _keys!1895) (index!15800 lt!163763)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18629 (_ BitVec 32)) SeekEntryResult!3405)

(assert (=> b!347954 (= lt!163763 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347955 () Bool)

(assert (=> b!347955 (= e!213205 tp_is_empty!7521)))

(declare-fun mapIsEmpty!12741 () Bool)

(assert (=> mapIsEmpty!12741 mapRes!12741))

(declare-fun b!347956 () Bool)

(declare-fun res!192658 () Bool)

(assert (=> b!347956 (=> (not res!192658) (not e!213202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347956 (= res!192658 (validKeyInArray!0 k0!1348))))

(declare-fun b!347957 () Bool)

(declare-fun res!192663 () Bool)

(assert (=> b!347957 (=> (not res!192663) (not e!213202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18629 (_ BitVec 32)) Bool)

(assert (=> b!347957 (= res!192663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347958 () Bool)

(declare-fun res!192660 () Bool)

(assert (=> b!347958 (=> (not res!192660) (not e!213202))))

(assert (=> b!347958 (= res!192660 (and (= (size!9177 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9176 _keys!1895) (size!9177 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34784 res!192664) b!347958))

(assert (= (and b!347958 res!192660) b!347957))

(assert (= (and b!347957 res!192663) b!347953))

(assert (= (and b!347953 res!192657) b!347956))

(assert (= (and b!347956 res!192658) b!347951))

(assert (= (and b!347951 res!192661) b!347954))

(assert (= (and b!347954 res!192662) b!347952))

(assert (= (and b!347952 res!192659) b!347949))

(assert (= (and b!347950 condMapEmpty!12741) mapIsEmpty!12741))

(assert (= (and b!347950 (not condMapEmpty!12741)) mapNonEmpty!12741))

(assert (= (and mapNonEmpty!12741 ((_ is ValueCellFull!3417) mapValue!12741)) b!347955))

(assert (= (and b!347950 ((_ is ValueCellFull!3417) mapDefault!12741)) b!347948))

(assert (= start!34784 b!347950))

(declare-fun m!348813 () Bool)

(assert (=> mapNonEmpty!12741 m!348813))

(declare-fun m!348815 () Bool)

(assert (=> start!34784 m!348815))

(declare-fun m!348817 () Bool)

(assert (=> start!34784 m!348817))

(declare-fun m!348819 () Bool)

(assert (=> start!34784 m!348819))

(declare-fun m!348821 () Bool)

(assert (=> b!347956 m!348821))

(declare-fun m!348823 () Bool)

(assert (=> b!347949 m!348823))

(declare-fun m!348825 () Bool)

(assert (=> b!347949 m!348825))

(declare-fun m!348827 () Bool)

(assert (=> b!347949 m!348827))

(declare-fun m!348829 () Bool)

(assert (=> b!347949 m!348829))

(declare-fun m!348831 () Bool)

(assert (=> b!347949 m!348831))

(assert (=> b!347949 m!348827))

(declare-fun m!348833 () Bool)

(assert (=> b!347953 m!348833))

(declare-fun m!348835 () Bool)

(assert (=> b!347952 m!348835))

(assert (=> b!347954 m!348827))

(declare-fun m!348837 () Bool)

(assert (=> b!347954 m!348837))

(declare-fun m!348839 () Bool)

(assert (=> b!347951 m!348839))

(declare-fun m!348841 () Bool)

(assert (=> b!347951 m!348841))

(declare-fun m!348843 () Bool)

(assert (=> b!347957 m!348843))

(check-sat (not b!347957) (not start!34784) (not b!347951) b_and!14791 (not b!347953) (not b!347954) (not b!347952) (not b!347949) tp_is_empty!7521 (not mapNonEmpty!12741) (not b_next!7569) (not b!347956))
(check-sat b_and!14791 (not b_next!7569))
