; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34756 () Bool)

(assert start!34756)

(declare-fun b_free!7555 () Bool)

(declare-fun b_next!7555 () Bool)

(assert (=> start!34756 (= b_free!7555 (not b_next!7555))))

(declare-fun tp!26232 () Bool)

(declare-fun b_and!14751 () Bool)

(assert (=> start!34756 (= tp!26232 b_and!14751)))

(declare-fun b!347442 () Bool)

(declare-fun res!192362 () Bool)

(declare-fun e!212883 () Bool)

(assert (=> b!347442 (=> (not res!192362) (not e!212883))))

(declare-datatypes ((array!18591 0))(
  ( (array!18592 (arr!8805 (Array (_ BitVec 32) (_ BitVec 64))) (size!9158 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18591)

(declare-datatypes ((List!5070 0))(
  ( (Nil!5067) (Cons!5066 (h!5922 (_ BitVec 64)) (t!10191 List!5070)) )
))
(declare-fun arrayNoDuplicates!0 (array!18591 (_ BitVec 32) List!5070) Bool)

(assert (=> b!347442 (= res!192362 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5067))))

(declare-fun b!347443 () Bool)

(declare-fun res!192365 () Bool)

(assert (=> b!347443 (=> (not res!192365) (not e!212883))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18591 (_ BitVec 32)) Bool)

(assert (=> b!347443 (= res!192365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347444 () Bool)

(declare-fun e!212882 () Bool)

(declare-fun tp_is_empty!7507 () Bool)

(assert (=> b!347444 (= e!212882 tp_is_empty!7507)))

(declare-fun mapIsEmpty!12720 () Bool)

(declare-fun mapRes!12720 () Bool)

(assert (=> mapIsEmpty!12720 mapRes!12720))

(declare-fun mapNonEmpty!12720 () Bool)

(declare-fun tp!26231 () Bool)

(assert (=> mapNonEmpty!12720 (= mapRes!12720 (and tp!26231 e!212882))))

(declare-fun mapKey!12720 () (_ BitVec 32))

(declare-datatypes ((V!10987 0))(
  ( (V!10988 (val!3798 Int)) )
))
(declare-datatypes ((ValueCell!3410 0))(
  ( (ValueCellFull!3410 (v!5975 V!10987)) (EmptyCell!3410) )
))
(declare-fun mapRest!12720 () (Array (_ BitVec 32) ValueCell!3410))

(declare-datatypes ((array!18593 0))(
  ( (array!18594 (arr!8806 (Array (_ BitVec 32) ValueCell!3410)) (size!9159 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18593)

(declare-fun mapValue!12720 () ValueCell!3410)

(assert (=> mapNonEmpty!12720 (= (arr!8806 _values!1525) (store mapRest!12720 mapKey!12720 mapValue!12720))))

(declare-fun b!347446 () Bool)

(declare-fun e!212880 () Bool)

(assert (=> b!347446 (= e!212880 (not false))))

(declare-datatypes ((tuple2!5454 0))(
  ( (tuple2!5455 (_1!2738 (_ BitVec 64)) (_2!2738 V!10987)) )
))
(declare-datatypes ((List!5071 0))(
  ( (Nil!5068) (Cons!5067 (h!5923 tuple2!5454) (t!10192 List!5071)) )
))
(declare-datatypes ((ListLongMap!4357 0))(
  ( (ListLongMap!4358 (toList!2194 List!5071)) )
))
(declare-fun lt!163445 () ListLongMap!4357)

(declare-datatypes ((SeekEntryResult!3394 0))(
  ( (MissingZero!3394 (index!15755 (_ BitVec 32))) (Found!3394 (index!15756 (_ BitVec 32))) (Intermediate!3394 (undefined!4206 Bool) (index!15757 (_ BitVec 32)) (x!34629 (_ BitVec 32))) (Undefined!3394) (MissingVacant!3394 (index!15758 (_ BitVec 32))) )
))
(declare-fun lt!163446 () SeekEntryResult!3394)

(declare-fun contains!2270 (ListLongMap!4357 (_ BitVec 64)) Bool)

(assert (=> b!347446 (contains!2270 lt!163445 (select (arr!8805 _keys!1895) (index!15756 lt!163446)))))

(declare-fun zeroValue!1467 () V!10987)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((Unit!10778 0))(
  ( (Unit!10779) )
))
(declare-fun lt!163443 () Unit!10778)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10987)

(declare-fun lemmaValidKeyInArrayIsInListMap!174 (array!18591 array!18593 (_ BitVec 32) (_ BitVec 32) V!10987 V!10987 (_ BitVec 32) Int) Unit!10778)

(assert (=> b!347446 (= lt!163443 (lemmaValidKeyInArrayIsInListMap!174 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15756 lt!163446) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347446 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163444 () Unit!10778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18591 (_ BitVec 64) (_ BitVec 32)) Unit!10778)

(assert (=> b!347446 (= lt!163444 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15756 lt!163446)))))

(declare-fun b!347447 () Bool)

(declare-fun e!212877 () Bool)

(assert (=> b!347447 (= e!212883 e!212877)))

(declare-fun res!192366 () Bool)

(assert (=> b!347447 (=> (not res!192366) (not e!212877))))

(assert (=> b!347447 (= res!192366 (not (contains!2270 lt!163445 k0!1348)))))

(declare-fun getCurrentListMap!1700 (array!18591 array!18593 (_ BitVec 32) (_ BitVec 32) V!10987 V!10987 (_ BitVec 32) Int) ListLongMap!4357)

(assert (=> b!347447 (= lt!163445 (getCurrentListMap!1700 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347448 () Bool)

(declare-fun res!192364 () Bool)

(assert (=> b!347448 (=> (not res!192364) (not e!212880))))

(assert (=> b!347448 (= res!192364 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15756 lt!163446)))))

(declare-fun b!347449 () Bool)

(declare-fun e!212878 () Bool)

(declare-fun e!212879 () Bool)

(assert (=> b!347449 (= e!212878 (and e!212879 mapRes!12720))))

(declare-fun condMapEmpty!12720 () Bool)

(declare-fun mapDefault!12720 () ValueCell!3410)

(assert (=> b!347449 (= condMapEmpty!12720 (= (arr!8806 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3410)) mapDefault!12720)))))

(declare-fun b!347450 () Bool)

(assert (=> b!347450 (= e!212877 e!212880)))

(declare-fun res!192363 () Bool)

(assert (=> b!347450 (=> (not res!192363) (not e!212880))))

(get-info :version)

(assert (=> b!347450 (= res!192363 (and ((_ is Found!3394) lt!163446) (= (select (arr!8805 _keys!1895) (index!15756 lt!163446)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18591 (_ BitVec 32)) SeekEntryResult!3394)

(assert (=> b!347450 (= lt!163446 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347445 () Bool)

(declare-fun res!192361 () Bool)

(assert (=> b!347445 (=> (not res!192361) (not e!212883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347445 (= res!192361 (validKeyInArray!0 k0!1348))))

(declare-fun res!192367 () Bool)

(assert (=> start!34756 (=> (not res!192367) (not e!212883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34756 (= res!192367 (validMask!0 mask!2385))))

(assert (=> start!34756 e!212883))

(assert (=> start!34756 true))

(assert (=> start!34756 tp_is_empty!7507))

(assert (=> start!34756 tp!26232))

(declare-fun array_inv!6540 (array!18593) Bool)

(assert (=> start!34756 (and (array_inv!6540 _values!1525) e!212878)))

(declare-fun array_inv!6541 (array!18591) Bool)

(assert (=> start!34756 (array_inv!6541 _keys!1895)))

(declare-fun b!347451 () Bool)

(assert (=> b!347451 (= e!212879 tp_is_empty!7507)))

(declare-fun b!347452 () Bool)

(declare-fun res!192360 () Bool)

(assert (=> b!347452 (=> (not res!192360) (not e!212883))))

(assert (=> b!347452 (= res!192360 (and (= (size!9159 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9158 _keys!1895) (size!9159 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!34756 res!192367) b!347452))

(assert (= (and b!347452 res!192360) b!347443))

(assert (= (and b!347443 res!192365) b!347442))

(assert (= (and b!347442 res!192362) b!347445))

(assert (= (and b!347445 res!192361) b!347447))

(assert (= (and b!347447 res!192366) b!347450))

(assert (= (and b!347450 res!192363) b!347448))

(assert (= (and b!347448 res!192364) b!347446))

(assert (= (and b!347449 condMapEmpty!12720) mapIsEmpty!12720))

(assert (= (and b!347449 (not condMapEmpty!12720)) mapNonEmpty!12720))

(assert (= (and mapNonEmpty!12720 ((_ is ValueCellFull!3410) mapValue!12720)) b!347444))

(assert (= (and b!347449 ((_ is ValueCellFull!3410) mapDefault!12720)) b!347451))

(assert (= start!34756 b!347449))

(declare-fun m!347859 () Bool)

(assert (=> b!347445 m!347859))

(declare-fun m!347861 () Bool)

(assert (=> b!347443 m!347861))

(declare-fun m!347863 () Bool)

(assert (=> start!34756 m!347863))

(declare-fun m!347865 () Bool)

(assert (=> start!34756 m!347865))

(declare-fun m!347867 () Bool)

(assert (=> start!34756 m!347867))

(declare-fun m!347869 () Bool)

(assert (=> b!347446 m!347869))

(declare-fun m!347871 () Bool)

(assert (=> b!347446 m!347871))

(declare-fun m!347873 () Bool)

(assert (=> b!347446 m!347873))

(assert (=> b!347446 m!347869))

(declare-fun m!347875 () Bool)

(assert (=> b!347446 m!347875))

(declare-fun m!347877 () Bool)

(assert (=> b!347446 m!347877))

(declare-fun m!347879 () Bool)

(assert (=> b!347442 m!347879))

(assert (=> b!347450 m!347869))

(declare-fun m!347881 () Bool)

(assert (=> b!347450 m!347881))

(declare-fun m!347883 () Bool)

(assert (=> mapNonEmpty!12720 m!347883))

(declare-fun m!347885 () Bool)

(assert (=> b!347447 m!347885))

(declare-fun m!347887 () Bool)

(assert (=> b!347447 m!347887))

(declare-fun m!347889 () Bool)

(assert (=> b!347448 m!347889))

(check-sat (not b!347447) (not start!34756) (not b!347450) (not b_next!7555) (not mapNonEmpty!12720) b_and!14751 (not b!347442) (not b!347448) (not b!347446) (not b!347443) (not b!347445) tp_is_empty!7507)
(check-sat b_and!14751 (not b_next!7555))
