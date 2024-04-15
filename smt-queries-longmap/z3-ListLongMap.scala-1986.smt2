; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34786 () Bool)

(assert start!34786)

(declare-fun b_free!7585 () Bool)

(declare-fun b_next!7585 () Bool)

(assert (=> start!34786 (= b_free!7585 (not b_next!7585))))

(declare-fun tp!26322 () Bool)

(declare-fun b_and!14781 () Bool)

(assert (=> start!34786 (= tp!26322 b_and!14781)))

(declare-fun b!347937 () Bool)

(declare-fun res!192726 () Bool)

(declare-fun e!213184 () Bool)

(assert (=> b!347937 (=> (not res!192726) (not e!213184))))

(declare-datatypes ((array!18645 0))(
  ( (array!18646 (arr!8832 (Array (_ BitVec 32) (_ BitVec 64))) (size!9185 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18645)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18645 (_ BitVec 32)) Bool)

(assert (=> b!347937 (= res!192726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12765 () Bool)

(declare-fun mapRes!12765 () Bool)

(assert (=> mapIsEmpty!12765 mapRes!12765))

(declare-fun b!347938 () Bool)

(declare-fun e!213181 () Bool)

(declare-fun e!213182 () Bool)

(assert (=> b!347938 (= e!213181 (and e!213182 mapRes!12765))))

(declare-fun condMapEmpty!12765 () Bool)

(declare-datatypes ((V!11027 0))(
  ( (V!11028 (val!3813 Int)) )
))
(declare-datatypes ((ValueCell!3425 0))(
  ( (ValueCellFull!3425 (v!5990 V!11027)) (EmptyCell!3425) )
))
(declare-datatypes ((array!18647 0))(
  ( (array!18648 (arr!8833 (Array (_ BitVec 32) ValueCell!3425)) (size!9186 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18647)

(declare-fun mapDefault!12765 () ValueCell!3425)

(assert (=> b!347938 (= condMapEmpty!12765 (= (arr!8833 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3425)) mapDefault!12765)))))

(declare-fun b!347939 () Bool)

(declare-fun tp_is_empty!7537 () Bool)

(assert (=> b!347939 (= e!213182 tp_is_empty!7537)))

(declare-fun b!347940 () Bool)

(declare-fun res!192727 () Bool)

(assert (=> b!347940 (=> (not res!192727) (not e!213184))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347940 (= res!192727 (validKeyInArray!0 k0!1348))))

(declare-fun b!347941 () Bool)

(declare-fun e!213186 () Bool)

(assert (=> b!347941 (= e!213186 false)))

(declare-fun lt!163601 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18645 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!347941 (= lt!163601 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!347942 () Bool)

(declare-fun res!192724 () Bool)

(assert (=> b!347942 (=> (not res!192724) (not e!213184))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347942 (= res!192724 (and (= (size!9186 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9185 _keys!1895) (size!9186 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347943 () Bool)

(declare-fun res!192722 () Bool)

(assert (=> b!347943 (=> (not res!192722) (not e!213184))))

(declare-datatypes ((List!5091 0))(
  ( (Nil!5088) (Cons!5087 (h!5943 (_ BitVec 64)) (t!10212 List!5091)) )
))
(declare-fun arrayNoDuplicates!0 (array!18645 (_ BitVec 32) List!5091) Bool)

(assert (=> b!347943 (= res!192722 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5088))))

(declare-fun b!347944 () Bool)

(declare-fun e!213185 () Bool)

(assert (=> b!347944 (= e!213185 tp_is_empty!7537)))

(declare-fun b!347945 () Bool)

(declare-fun res!192721 () Bool)

(assert (=> b!347945 (=> (not res!192721) (not e!213184))))

(declare-fun zeroValue!1467 () V!11027)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11027)

(declare-datatypes ((tuple2!5474 0))(
  ( (tuple2!5475 (_1!2748 (_ BitVec 64)) (_2!2748 V!11027)) )
))
(declare-datatypes ((List!5092 0))(
  ( (Nil!5089) (Cons!5088 (h!5944 tuple2!5474) (t!10213 List!5092)) )
))
(declare-datatypes ((ListLongMap!4377 0))(
  ( (ListLongMap!4378 (toList!2204 List!5092)) )
))
(declare-fun contains!2280 (ListLongMap!4377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1709 (array!18645 array!18647 (_ BitVec 32) (_ BitVec 32) V!11027 V!11027 (_ BitVec 32) Int) ListLongMap!4377)

(assert (=> b!347945 (= res!192721 (not (contains!2280 (getCurrentListMap!1709 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347946 () Bool)

(declare-fun res!192725 () Bool)

(assert (=> b!347946 (=> (not res!192725) (not e!213186))))

(declare-fun arrayContainsKey!0 (array!18645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347946 (= res!192725 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!347947 () Bool)

(assert (=> b!347947 (= e!213184 e!213186)))

(declare-fun res!192723 () Bool)

(assert (=> b!347947 (=> (not res!192723) (not e!213186))))

(declare-datatypes ((SeekEntryResult!3404 0))(
  ( (MissingZero!3404 (index!15795 (_ BitVec 32))) (Found!3404 (index!15796 (_ BitVec 32))) (Intermediate!3404 (undefined!4216 Bool) (index!15797 (_ BitVec 32)) (x!34679 (_ BitVec 32))) (Undefined!3404) (MissingVacant!3404 (index!15798 (_ BitVec 32))) )
))
(declare-fun lt!163602 () SeekEntryResult!3404)

(get-info :version)

(assert (=> b!347947 (= res!192723 (and (not ((_ is Found!3404) lt!163602)) ((_ is MissingZero!3404) lt!163602)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18645 (_ BitVec 32)) SeekEntryResult!3404)

(assert (=> b!347947 (= lt!163602 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!192720 () Bool)

(assert (=> start!34786 (=> (not res!192720) (not e!213184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34786 (= res!192720 (validMask!0 mask!2385))))

(assert (=> start!34786 e!213184))

(assert (=> start!34786 true))

(assert (=> start!34786 tp_is_empty!7537))

(assert (=> start!34786 tp!26322))

(declare-fun array_inv!6556 (array!18647) Bool)

(assert (=> start!34786 (and (array_inv!6556 _values!1525) e!213181)))

(declare-fun array_inv!6557 (array!18645) Bool)

(assert (=> start!34786 (array_inv!6557 _keys!1895)))

(declare-fun mapNonEmpty!12765 () Bool)

(declare-fun tp!26321 () Bool)

(assert (=> mapNonEmpty!12765 (= mapRes!12765 (and tp!26321 e!213185))))

(declare-fun mapKey!12765 () (_ BitVec 32))

(declare-fun mapValue!12765 () ValueCell!3425)

(declare-fun mapRest!12765 () (Array (_ BitVec 32) ValueCell!3425))

(assert (=> mapNonEmpty!12765 (= (arr!8833 _values!1525) (store mapRest!12765 mapKey!12765 mapValue!12765))))

(assert (= (and start!34786 res!192720) b!347942))

(assert (= (and b!347942 res!192724) b!347937))

(assert (= (and b!347937 res!192726) b!347943))

(assert (= (and b!347943 res!192722) b!347940))

(assert (= (and b!347940 res!192727) b!347945))

(assert (= (and b!347945 res!192721) b!347947))

(assert (= (and b!347947 res!192723) b!347946))

(assert (= (and b!347946 res!192725) b!347941))

(assert (= (and b!347938 condMapEmpty!12765) mapIsEmpty!12765))

(assert (= (and b!347938 (not condMapEmpty!12765)) mapNonEmpty!12765))

(assert (= (and mapNonEmpty!12765 ((_ is ValueCellFull!3425) mapValue!12765)) b!347944))

(assert (= (and b!347938 ((_ is ValueCellFull!3425) mapDefault!12765)) b!347939))

(assert (= start!34786 b!347938))

(declare-fun m!348315 () Bool)

(assert (=> b!347940 m!348315))

(declare-fun m!348317 () Bool)

(assert (=> start!34786 m!348317))

(declare-fun m!348319 () Bool)

(assert (=> start!34786 m!348319))

(declare-fun m!348321 () Bool)

(assert (=> start!34786 m!348321))

(declare-fun m!348323 () Bool)

(assert (=> b!347941 m!348323))

(declare-fun m!348325 () Bool)

(assert (=> b!347945 m!348325))

(assert (=> b!347945 m!348325))

(declare-fun m!348327 () Bool)

(assert (=> b!347945 m!348327))

(declare-fun m!348329 () Bool)

(assert (=> b!347937 m!348329))

(declare-fun m!348331 () Bool)

(assert (=> b!347947 m!348331))

(declare-fun m!348333 () Bool)

(assert (=> mapNonEmpty!12765 m!348333))

(declare-fun m!348335 () Bool)

(assert (=> b!347943 m!348335))

(declare-fun m!348337 () Bool)

(assert (=> b!347946 m!348337))

(check-sat (not b!347945) (not start!34786) tp_is_empty!7537 (not b!347937) (not b_next!7585) (not b!347941) b_and!14781 (not b!347947) (not mapNonEmpty!12765) (not b!347940) (not b!347946) (not b!347943))
(check-sat b_and!14781 (not b_next!7585))
