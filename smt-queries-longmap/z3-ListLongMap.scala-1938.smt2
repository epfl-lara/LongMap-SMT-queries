; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34308 () Bool)

(assert start!34308)

(declare-fun b_free!7297 () Bool)

(declare-fun b_next!7297 () Bool)

(assert (=> start!34308 (= b_free!7297 (not b_next!7297))))

(declare-fun tp!25430 () Bool)

(declare-fun b_and!14515 () Bool)

(assert (=> start!34308 (= tp!25430 b_and!14515)))

(declare-fun b!342534 () Bool)

(declare-fun e!210050 () Bool)

(declare-fun e!210047 () Bool)

(assert (=> b!342534 (= e!210050 e!210047)))

(declare-fun res!189373 () Bool)

(assert (=> b!342534 (=> (not res!189373) (not e!210047))))

(declare-datatypes ((SeekEntryResult!3256 0))(
  ( (MissingZero!3256 (index!15203 (_ BitVec 32))) (Found!3256 (index!15204 (_ BitVec 32))) (Intermediate!3256 (undefined!4068 Bool) (index!15205 (_ BitVec 32)) (x!34059 (_ BitVec 32))) (Undefined!3256) (MissingVacant!3256 (index!15206 (_ BitVec 32))) )
))
(declare-fun lt!162214 () SeekEntryResult!3256)

(get-info :version)

(assert (=> b!342534 (= res!189373 (and (not ((_ is Found!3256) lt!162214)) (not ((_ is MissingZero!3256) lt!162214)) ((_ is MissingVacant!3256) lt!162214)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18084 0))(
  ( (array!18085 (arr!8560 (Array (_ BitVec 32) (_ BitVec 64))) (size!8912 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18084)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18084 (_ BitVec 32)) SeekEntryResult!3256)

(assert (=> b!342534 (= lt!162214 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342535 () Bool)

(declare-datatypes ((Unit!10641 0))(
  ( (Unit!10642) )
))
(declare-fun e!210048 () Unit!10641)

(declare-fun Unit!10643 () Unit!10641)

(assert (=> b!342535 (= e!210048 Unit!10643)))

(declare-datatypes ((V!10643 0))(
  ( (V!10644 (val!3669 Int)) )
))
(declare-fun zeroValue!1467 () V!10643)

(declare-datatypes ((ValueCell!3281 0))(
  ( (ValueCellFull!3281 (v!5844 V!10643)) (EmptyCell!3281) )
))
(declare-datatypes ((array!18086 0))(
  ( (array!18087 (arr!8561 (Array (_ BitVec 32) ValueCell!3281)) (size!8913 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18086)

(declare-fun lt!162212 () Unit!10641)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10643)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lemmaArrayContainsKeyThenInListMap!312 (array!18084 array!18086 (_ BitVec 32) (_ BitVec 32) V!10643 V!10643 (_ BitVec 64) (_ BitVec 32) Int) Unit!10641)

(declare-fun arrayScanForKey!0 (array!18084 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342535 (= lt!162212 (lemmaArrayContainsKeyThenInListMap!312 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342535 false))

(declare-fun res!189374 () Bool)

(assert (=> start!34308 (=> (not res!189374) (not e!210050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34308 (= res!189374 (validMask!0 mask!2385))))

(assert (=> start!34308 e!210050))

(assert (=> start!34308 true))

(declare-fun tp_is_empty!7249 () Bool)

(assert (=> start!34308 tp_is_empty!7249))

(assert (=> start!34308 tp!25430))

(declare-fun e!210049 () Bool)

(declare-fun array_inv!6330 (array!18086) Bool)

(assert (=> start!34308 (and (array_inv!6330 _values!1525) e!210049)))

(declare-fun array_inv!6331 (array!18084) Bool)

(assert (=> start!34308 (array_inv!6331 _keys!1895)))

(declare-fun b!342536 () Bool)

(declare-fun res!189377 () Bool)

(assert (=> b!342536 (=> (not res!189377) (not e!210050))))

(assert (=> b!342536 (= res!189377 (and (= (size!8913 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8912 _keys!1895) (size!8913 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342537 () Bool)

(declare-fun res!189371 () Bool)

(assert (=> b!342537 (=> (not res!189371) (not e!210050))))

(declare-datatypes ((tuple2!5232 0))(
  ( (tuple2!5233 (_1!2627 (_ BitVec 64)) (_2!2627 V!10643)) )
))
(declare-datatypes ((List!4835 0))(
  ( (Nil!4832) (Cons!4831 (h!5687 tuple2!5232) (t!9939 List!4835)) )
))
(declare-datatypes ((ListLongMap!4147 0))(
  ( (ListLongMap!4148 (toList!2089 List!4835)) )
))
(declare-fun contains!2164 (ListLongMap!4147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1618 (array!18084 array!18086 (_ BitVec 32) (_ BitVec 32) V!10643 V!10643 (_ BitVec 32) Int) ListLongMap!4147)

(assert (=> b!342537 (= res!189371 (not (contains!2164 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342538 () Bool)

(declare-fun e!210046 () Bool)

(assert (=> b!342538 (= e!210046 tp_is_empty!7249)))

(declare-fun b!342539 () Bool)

(declare-fun e!210045 () Bool)

(assert (=> b!342539 (= e!210045 tp_is_empty!7249)))

(declare-fun b!342540 () Bool)

(declare-fun mapRes!12306 () Bool)

(assert (=> b!342540 (= e!210049 (and e!210045 mapRes!12306))))

(declare-fun condMapEmpty!12306 () Bool)

(declare-fun mapDefault!12306 () ValueCell!3281)

(assert (=> b!342540 (= condMapEmpty!12306 (= (arr!8561 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3281)) mapDefault!12306)))))

(declare-fun b!342541 () Bool)

(declare-fun Unit!10644 () Unit!10641)

(assert (=> b!342541 (= e!210048 Unit!10644)))

(declare-fun b!342542 () Bool)

(declare-fun res!189375 () Bool)

(assert (=> b!342542 (=> (not res!189375) (not e!210050))))

(declare-datatypes ((List!4836 0))(
  ( (Nil!4833) (Cons!4832 (h!5688 (_ BitVec 64)) (t!9940 List!4836)) )
))
(declare-fun arrayNoDuplicates!0 (array!18084 (_ BitVec 32) List!4836) Bool)

(assert (=> b!342542 (= res!189375 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4833))))

(declare-fun b!342543 () Bool)

(declare-fun res!189372 () Bool)

(assert (=> b!342543 (=> (not res!189372) (not e!210050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342543 (= res!189372 (validKeyInArray!0 k0!1348))))

(declare-fun b!342544 () Bool)

(declare-fun res!189376 () Bool)

(assert (=> b!342544 (=> (not res!189376) (not e!210050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18084 (_ BitVec 32)) Bool)

(assert (=> b!342544 (= res!189376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12306 () Bool)

(declare-fun tp!25431 () Bool)

(assert (=> mapNonEmpty!12306 (= mapRes!12306 (and tp!25431 e!210046))))

(declare-fun mapKey!12306 () (_ BitVec 32))

(declare-fun mapRest!12306 () (Array (_ BitVec 32) ValueCell!3281))

(declare-fun mapValue!12306 () ValueCell!3281)

(assert (=> mapNonEmpty!12306 (= (arr!8561 _values!1525) (store mapRest!12306 mapKey!12306 mapValue!12306))))

(declare-fun b!342545 () Bool)

(assert (=> b!342545 (= e!210047 false)))

(declare-fun lt!162213 () Unit!10641)

(assert (=> b!342545 (= lt!162213 e!210048)))

(declare-fun c!52802 () Bool)

(declare-fun arrayContainsKey!0 (array!18084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342545 (= c!52802 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12306 () Bool)

(assert (=> mapIsEmpty!12306 mapRes!12306))

(assert (= (and start!34308 res!189374) b!342536))

(assert (= (and b!342536 res!189377) b!342544))

(assert (= (and b!342544 res!189376) b!342542))

(assert (= (and b!342542 res!189375) b!342543))

(assert (= (and b!342543 res!189372) b!342537))

(assert (= (and b!342537 res!189371) b!342534))

(assert (= (and b!342534 res!189373) b!342545))

(assert (= (and b!342545 c!52802) b!342535))

(assert (= (and b!342545 (not c!52802)) b!342541))

(assert (= (and b!342540 condMapEmpty!12306) mapIsEmpty!12306))

(assert (= (and b!342540 (not condMapEmpty!12306)) mapNonEmpty!12306))

(assert (= (and mapNonEmpty!12306 ((_ is ValueCellFull!3281) mapValue!12306)) b!342538))

(assert (= (and b!342540 ((_ is ValueCellFull!3281) mapDefault!12306)) b!342539))

(assert (= start!34308 b!342540))

(declare-fun m!344925 () Bool)

(assert (=> b!342537 m!344925))

(assert (=> b!342537 m!344925))

(declare-fun m!344927 () Bool)

(assert (=> b!342537 m!344927))

(declare-fun m!344929 () Bool)

(assert (=> b!342543 m!344929))

(declare-fun m!344931 () Bool)

(assert (=> b!342545 m!344931))

(declare-fun m!344933 () Bool)

(assert (=> b!342544 m!344933))

(declare-fun m!344935 () Bool)

(assert (=> mapNonEmpty!12306 m!344935))

(declare-fun m!344937 () Bool)

(assert (=> b!342535 m!344937))

(assert (=> b!342535 m!344937))

(declare-fun m!344939 () Bool)

(assert (=> b!342535 m!344939))

(declare-fun m!344941 () Bool)

(assert (=> b!342542 m!344941))

(declare-fun m!344943 () Bool)

(assert (=> b!342534 m!344943))

(declare-fun m!344945 () Bool)

(assert (=> start!34308 m!344945))

(declare-fun m!344947 () Bool)

(assert (=> start!34308 m!344947))

(declare-fun m!344949 () Bool)

(assert (=> start!34308 m!344949))

(check-sat (not b!342545) tp_is_empty!7249 (not b!342537) (not start!34308) (not b!342542) (not b!342534) (not b!342543) (not b!342535) (not b_next!7297) b_and!14515 (not mapNonEmpty!12306) (not b!342544))
(check-sat b_and!14515 (not b_next!7297))
