; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34060 () Bool)

(assert start!34060)

(declare-fun b_free!7153 () Bool)

(declare-fun b_next!7153 () Bool)

(assert (=> start!34060 (= b_free!7153 (not b_next!7153))))

(declare-fun tp!24983 () Bool)

(declare-fun b_and!14361 () Bool)

(assert (=> start!34060 (= tp!24983 b_and!14361)))

(declare-fun b!339493 () Bool)

(declare-fun e!208286 () Bool)

(declare-fun tp_is_empty!7105 () Bool)

(assert (=> b!339493 (= e!208286 tp_is_empty!7105)))

(declare-fun b!339494 () Bool)

(declare-fun res!187544 () Bool)

(declare-fun e!208288 () Bool)

(assert (=> b!339494 (=> (not res!187544) (not e!208288))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10451 0))(
  ( (V!10452 (val!3597 Int)) )
))
(declare-datatypes ((ValueCell!3209 0))(
  ( (ValueCellFull!3209 (v!5767 V!10451)) (EmptyCell!3209) )
))
(declare-datatypes ((array!17792 0))(
  ( (array!17793 (arr!8419 (Array (_ BitVec 32) ValueCell!3209)) (size!8771 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17792)

(declare-datatypes ((array!17794 0))(
  ( (array!17795 (arr!8420 (Array (_ BitVec 32) (_ BitVec 64))) (size!8772 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17794)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339494 (= res!187544 (and (= (size!8771 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8772 _keys!1895) (size!8771 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339495 () Bool)

(declare-datatypes ((Unit!10550 0))(
  ( (Unit!10551) )
))
(declare-fun e!208285 () Unit!10550)

(declare-fun Unit!10552 () Unit!10550)

(assert (=> b!339495 (= e!208285 Unit!10552)))

(declare-fun mapIsEmpty!12075 () Bool)

(declare-fun mapRes!12075 () Bool)

(assert (=> mapIsEmpty!12075 mapRes!12075))

(declare-fun mapNonEmpty!12075 () Bool)

(declare-fun tp!24984 () Bool)

(declare-fun e!208284 () Bool)

(assert (=> mapNonEmpty!12075 (= mapRes!12075 (and tp!24984 e!208284))))

(declare-fun mapKey!12075 () (_ BitVec 32))

(declare-fun mapValue!12075 () ValueCell!3209)

(declare-fun mapRest!12075 () (Array (_ BitVec 32) ValueCell!3209))

(assert (=> mapNonEmpty!12075 (= (arr!8419 _values!1525) (store mapRest!12075 mapKey!12075 mapValue!12075))))

(declare-fun b!339496 () Bool)

(declare-fun e!208289 () Bool)

(assert (=> b!339496 (= e!208288 e!208289)))

(declare-fun res!187548 () Bool)

(assert (=> b!339496 (=> (not res!187548) (not e!208289))))

(declare-datatypes ((SeekEntryResult!3211 0))(
  ( (MissingZero!3211 (index!15023 (_ BitVec 32))) (Found!3211 (index!15024 (_ BitVec 32))) (Intermediate!3211 (undefined!4023 Bool) (index!15025 (_ BitVec 32)) (x!33772 (_ BitVec 32))) (Undefined!3211) (MissingVacant!3211 (index!15026 (_ BitVec 32))) )
))
(declare-fun lt!161252 () SeekEntryResult!3211)

(get-info :version)

(assert (=> b!339496 (= res!187548 (and (not ((_ is Found!3211) lt!161252)) ((_ is MissingZero!3211) lt!161252)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17794 (_ BitVec 32)) SeekEntryResult!3211)

(assert (=> b!339496 (= lt!161252 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339497 () Bool)

(declare-fun res!187547 () Bool)

(assert (=> b!339497 (=> (not res!187547) (not e!208288))))

(declare-datatypes ((List!4741 0))(
  ( (Nil!4738) (Cons!4737 (h!5593 (_ BitVec 64)) (t!9835 List!4741)) )
))
(declare-fun arrayNoDuplicates!0 (array!17794 (_ BitVec 32) List!4741) Bool)

(assert (=> b!339497 (= res!187547 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4738))))

(declare-fun b!339498 () Bool)

(declare-fun e!208283 () Bool)

(assert (=> b!339498 (= e!208283 (and e!208286 mapRes!12075))))

(declare-fun condMapEmpty!12075 () Bool)

(declare-fun mapDefault!12075 () ValueCell!3209)

(assert (=> b!339498 (= condMapEmpty!12075 (= (arr!8419 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3209)) mapDefault!12075)))))

(declare-fun b!339499 () Bool)

(assert (=> b!339499 (= e!208289 false)))

(declare-fun lt!161253 () Unit!10550)

(assert (=> b!339499 (= lt!161253 e!208285)))

(declare-fun c!52544 () Bool)

(declare-fun arrayContainsKey!0 (array!17794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339499 (= c!52544 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339501 () Bool)

(assert (=> b!339501 (= e!208284 tp_is_empty!7105)))

(declare-fun b!339502 () Bool)

(declare-fun Unit!10553 () Unit!10550)

(assert (=> b!339502 (= e!208285 Unit!10553)))

(declare-fun zeroValue!1467 () V!10451)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!161254 () Unit!10550)

(declare-fun minValue!1467 () V!10451)

(declare-fun lemmaArrayContainsKeyThenInListMap!294 (array!17794 array!17792 (_ BitVec 32) (_ BitVec 32) V!10451 V!10451 (_ BitVec 64) (_ BitVec 32) Int) Unit!10550)

(declare-fun arrayScanForKey!0 (array!17794 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339502 (= lt!161254 (lemmaArrayContainsKeyThenInListMap!294 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339502 false))

(declare-fun b!339503 () Bool)

(declare-fun res!187545 () Bool)

(assert (=> b!339503 (=> (not res!187545) (not e!208288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339503 (= res!187545 (validKeyInArray!0 k0!1348))))

(declare-fun b!339504 () Bool)

(declare-fun res!187549 () Bool)

(assert (=> b!339504 (=> (not res!187549) (not e!208288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17794 (_ BitVec 32)) Bool)

(assert (=> b!339504 (= res!187549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339500 () Bool)

(declare-fun res!187550 () Bool)

(assert (=> b!339500 (=> (not res!187550) (not e!208288))))

(declare-datatypes ((tuple2!5134 0))(
  ( (tuple2!5135 (_1!2578 (_ BitVec 64)) (_2!2578 V!10451)) )
))
(declare-datatypes ((List!4742 0))(
  ( (Nil!4739) (Cons!4738 (h!5594 tuple2!5134) (t!9836 List!4742)) )
))
(declare-datatypes ((ListLongMap!4049 0))(
  ( (ListLongMap!4050 (toList!2040 List!4742)) )
))
(declare-fun contains!2110 (ListLongMap!4049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1569 (array!17794 array!17792 (_ BitVec 32) (_ BitVec 32) V!10451 V!10451 (_ BitVec 32) Int) ListLongMap!4049)

(assert (=> b!339500 (= res!187550 (not (contains!2110 (getCurrentListMap!1569 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!187546 () Bool)

(assert (=> start!34060 (=> (not res!187546) (not e!208288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34060 (= res!187546 (validMask!0 mask!2385))))

(assert (=> start!34060 e!208288))

(assert (=> start!34060 true))

(assert (=> start!34060 tp_is_empty!7105))

(assert (=> start!34060 tp!24983))

(declare-fun array_inv!6242 (array!17792) Bool)

(assert (=> start!34060 (and (array_inv!6242 _values!1525) e!208283)))

(declare-fun array_inv!6243 (array!17794) Bool)

(assert (=> start!34060 (array_inv!6243 _keys!1895)))

(assert (= (and start!34060 res!187546) b!339494))

(assert (= (and b!339494 res!187544) b!339504))

(assert (= (and b!339504 res!187549) b!339497))

(assert (= (and b!339497 res!187547) b!339503))

(assert (= (and b!339503 res!187545) b!339500))

(assert (= (and b!339500 res!187550) b!339496))

(assert (= (and b!339496 res!187548) b!339499))

(assert (= (and b!339499 c!52544) b!339502))

(assert (= (and b!339499 (not c!52544)) b!339495))

(assert (= (and b!339498 condMapEmpty!12075) mapIsEmpty!12075))

(assert (= (and b!339498 (not condMapEmpty!12075)) mapNonEmpty!12075))

(assert (= (and mapNonEmpty!12075 ((_ is ValueCellFull!3209) mapValue!12075)) b!339501))

(assert (= (and b!339498 ((_ is ValueCellFull!3209) mapDefault!12075)) b!339493))

(assert (= start!34060 b!339498))

(declare-fun m!342715 () Bool)

(assert (=> b!339504 m!342715))

(declare-fun m!342717 () Bool)

(assert (=> b!339496 m!342717))

(declare-fun m!342719 () Bool)

(assert (=> start!34060 m!342719))

(declare-fun m!342721 () Bool)

(assert (=> start!34060 m!342721))

(declare-fun m!342723 () Bool)

(assert (=> start!34060 m!342723))

(declare-fun m!342725 () Bool)

(assert (=> mapNonEmpty!12075 m!342725))

(declare-fun m!342727 () Bool)

(assert (=> b!339502 m!342727))

(assert (=> b!339502 m!342727))

(declare-fun m!342729 () Bool)

(assert (=> b!339502 m!342729))

(declare-fun m!342731 () Bool)

(assert (=> b!339500 m!342731))

(assert (=> b!339500 m!342731))

(declare-fun m!342733 () Bool)

(assert (=> b!339500 m!342733))

(declare-fun m!342735 () Bool)

(assert (=> b!339503 m!342735))

(declare-fun m!342737 () Bool)

(assert (=> b!339499 m!342737))

(declare-fun m!342739 () Bool)

(assert (=> b!339497 m!342739))

(check-sat (not start!34060) (not b!339503) (not b!339499) (not b!339496) (not b!339500) (not b_next!7153) tp_is_empty!7105 (not mapNonEmpty!12075) b_and!14361 (not b!339504) (not b!339497) (not b!339502))
(check-sat b_and!14361 (not b_next!7153))
