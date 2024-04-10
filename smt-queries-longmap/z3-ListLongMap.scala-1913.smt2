; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34070 () Bool)

(assert start!34070)

(declare-fun b_free!7149 () Bool)

(declare-fun b_next!7149 () Bool)

(assert (=> start!34070 (= b_free!7149 (not b_next!7149))))

(declare-fun tp!24972 () Bool)

(declare-fun b_and!14343 () Bool)

(assert (=> start!34070 (= tp!24972 b_and!14343)))

(declare-fun b!339474 () Bool)

(declare-fun e!208278 () Bool)

(declare-fun tp_is_empty!7101 () Bool)

(assert (=> b!339474 (= e!208278 tp_is_empty!7101)))

(declare-fun b!339475 () Bool)

(declare-fun e!208281 () Bool)

(assert (=> b!339475 (= e!208281 false)))

(declare-datatypes ((Unit!10576 0))(
  ( (Unit!10577) )
))
(declare-fun lt!161217 () Unit!10576)

(declare-fun e!208276 () Unit!10576)

(assert (=> b!339475 (= lt!161217 e!208276)))

(declare-fun c!52563 () Bool)

(declare-datatypes ((array!17801 0))(
  ( (array!17802 (arr!8424 (Array (_ BitVec 32) (_ BitVec 64))) (size!8776 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17801)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339475 (= c!52563 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339476 () Bool)

(declare-fun e!208280 () Bool)

(assert (=> b!339476 (= e!208280 tp_is_empty!7101)))

(declare-fun b!339477 () Bool)

(declare-fun res!187506 () Bool)

(declare-fun e!208279 () Bool)

(assert (=> b!339477 (=> (not res!187506) (not e!208279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339477 (= res!187506 (validKeyInArray!0 k0!1348))))

(declare-fun b!339478 () Bool)

(assert (=> b!339478 (= e!208279 e!208281)))

(declare-fun res!187509 () Bool)

(assert (=> b!339478 (=> (not res!187509) (not e!208281))))

(declare-datatypes ((SeekEntryResult!3254 0))(
  ( (MissingZero!3254 (index!15195 (_ BitVec 32))) (Found!3254 (index!15196 (_ BitVec 32))) (Intermediate!3254 (undefined!4066 Bool) (index!15197 (_ BitVec 32)) (x!33810 (_ BitVec 32))) (Undefined!3254) (MissingVacant!3254 (index!15198 (_ BitVec 32))) )
))
(declare-fun lt!161218 () SeekEntryResult!3254)

(get-info :version)

(assert (=> b!339478 (= res!187509 (and (not ((_ is Found!3254) lt!161218)) ((_ is MissingZero!3254) lt!161218)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17801 (_ BitVec 32)) SeekEntryResult!3254)

(assert (=> b!339478 (= lt!161218 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12069 () Bool)

(declare-fun mapRes!12069 () Bool)

(declare-fun tp!24971 () Bool)

(assert (=> mapNonEmpty!12069 (= mapRes!12069 (and tp!24971 e!208278))))

(declare-datatypes ((V!10445 0))(
  ( (V!10446 (val!3595 Int)) )
))
(declare-datatypes ((ValueCell!3207 0))(
  ( (ValueCellFull!3207 (v!5764 V!10445)) (EmptyCell!3207) )
))
(declare-fun mapRest!12069 () (Array (_ BitVec 32) ValueCell!3207))

(declare-datatypes ((array!17803 0))(
  ( (array!17804 (arr!8425 (Array (_ BitVec 32) ValueCell!3207)) (size!8777 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17803)

(declare-fun mapValue!12069 () ValueCell!3207)

(declare-fun mapKey!12069 () (_ BitVec 32))

(assert (=> mapNonEmpty!12069 (= (arr!8425 _values!1525) (store mapRest!12069 mapKey!12069 mapValue!12069))))

(declare-fun res!187511 () Bool)

(assert (=> start!34070 (=> (not res!187511) (not e!208279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34070 (= res!187511 (validMask!0 mask!2385))))

(assert (=> start!34070 e!208279))

(assert (=> start!34070 true))

(assert (=> start!34070 tp_is_empty!7101))

(assert (=> start!34070 tp!24972))

(declare-fun e!208275 () Bool)

(declare-fun array_inv!6246 (array!17803) Bool)

(assert (=> start!34070 (and (array_inv!6246 _values!1525) e!208275)))

(declare-fun array_inv!6247 (array!17801) Bool)

(assert (=> start!34070 (array_inv!6247 _keys!1895)))

(declare-fun b!339479 () Bool)

(declare-fun res!187510 () Bool)

(assert (=> b!339479 (=> (not res!187510) (not e!208279))))

(declare-fun zeroValue!1467 () V!10445)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10445)

(declare-datatypes ((tuple2!5220 0))(
  ( (tuple2!5221 (_1!2621 (_ BitVec 64)) (_2!2621 V!10445)) )
))
(declare-datatypes ((List!4838 0))(
  ( (Nil!4835) (Cons!4834 (h!5690 tuple2!5220) (t!9940 List!4838)) )
))
(declare-datatypes ((ListLongMap!4133 0))(
  ( (ListLongMap!4134 (toList!2082 List!4838)) )
))
(declare-fun contains!2133 (ListLongMap!4133 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1603 (array!17801 array!17803 (_ BitVec 32) (_ BitVec 32) V!10445 V!10445 (_ BitVec 32) Int) ListLongMap!4133)

(assert (=> b!339479 (= res!187510 (not (contains!2133 (getCurrentListMap!1603 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339480 () Bool)

(declare-fun res!187505 () Bool)

(assert (=> b!339480 (=> (not res!187505) (not e!208279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17801 (_ BitVec 32)) Bool)

(assert (=> b!339480 (= res!187505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12069 () Bool)

(assert (=> mapIsEmpty!12069 mapRes!12069))

(declare-fun b!339481 () Bool)

(assert (=> b!339481 (= e!208275 (and e!208280 mapRes!12069))))

(declare-fun condMapEmpty!12069 () Bool)

(declare-fun mapDefault!12069 () ValueCell!3207)

(assert (=> b!339481 (= condMapEmpty!12069 (= (arr!8425 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3207)) mapDefault!12069)))))

(declare-fun b!339482 () Bool)

(declare-fun Unit!10578 () Unit!10576)

(assert (=> b!339482 (= e!208276 Unit!10578)))

(declare-fun lt!161216 () Unit!10576)

(declare-fun lemmaArrayContainsKeyThenInListMap!286 (array!17801 array!17803 (_ BitVec 32) (_ BitVec 32) V!10445 V!10445 (_ BitVec 64) (_ BitVec 32) Int) Unit!10576)

(declare-fun arrayScanForKey!0 (array!17801 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339482 (= lt!161216 (lemmaArrayContainsKeyThenInListMap!286 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339482 false))

(declare-fun b!339483 () Bool)

(declare-fun res!187508 () Bool)

(assert (=> b!339483 (=> (not res!187508) (not e!208279))))

(assert (=> b!339483 (= res!187508 (and (= (size!8777 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8776 _keys!1895) (size!8777 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339484 () Bool)

(declare-fun Unit!10579 () Unit!10576)

(assert (=> b!339484 (= e!208276 Unit!10579)))

(declare-fun b!339485 () Bool)

(declare-fun res!187507 () Bool)

(assert (=> b!339485 (=> (not res!187507) (not e!208279))))

(declare-datatypes ((List!4839 0))(
  ( (Nil!4836) (Cons!4835 (h!5691 (_ BitVec 64)) (t!9941 List!4839)) )
))
(declare-fun arrayNoDuplicates!0 (array!17801 (_ BitVec 32) List!4839) Bool)

(assert (=> b!339485 (= res!187507 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4836))))

(assert (= (and start!34070 res!187511) b!339483))

(assert (= (and b!339483 res!187508) b!339480))

(assert (= (and b!339480 res!187505) b!339485))

(assert (= (and b!339485 res!187507) b!339477))

(assert (= (and b!339477 res!187506) b!339479))

(assert (= (and b!339479 res!187510) b!339478))

(assert (= (and b!339478 res!187509) b!339475))

(assert (= (and b!339475 c!52563) b!339482))

(assert (= (and b!339475 (not c!52563)) b!339484))

(assert (= (and b!339481 condMapEmpty!12069) mapIsEmpty!12069))

(assert (= (and b!339481 (not condMapEmpty!12069)) mapNonEmpty!12069))

(assert (= (and mapNonEmpty!12069 ((_ is ValueCellFull!3207) mapValue!12069)) b!339474))

(assert (= (and b!339481 ((_ is ValueCellFull!3207) mapDefault!12069)) b!339476))

(assert (= start!34070 b!339481))

(declare-fun m!342439 () Bool)

(assert (=> b!339479 m!342439))

(assert (=> b!339479 m!342439))

(declare-fun m!342441 () Bool)

(assert (=> b!339479 m!342441))

(declare-fun m!342443 () Bool)

(assert (=> mapNonEmpty!12069 m!342443))

(declare-fun m!342445 () Bool)

(assert (=> b!339477 m!342445))

(declare-fun m!342447 () Bool)

(assert (=> b!339480 m!342447))

(declare-fun m!342449 () Bool)

(assert (=> b!339478 m!342449))

(declare-fun m!342451 () Bool)

(assert (=> b!339475 m!342451))

(declare-fun m!342453 () Bool)

(assert (=> start!34070 m!342453))

(declare-fun m!342455 () Bool)

(assert (=> start!34070 m!342455))

(declare-fun m!342457 () Bool)

(assert (=> start!34070 m!342457))

(declare-fun m!342459 () Bool)

(assert (=> b!339482 m!342459))

(assert (=> b!339482 m!342459))

(declare-fun m!342461 () Bool)

(assert (=> b!339482 m!342461))

(declare-fun m!342463 () Bool)

(assert (=> b!339485 m!342463))

(check-sat (not b!339482) tp_is_empty!7101 (not start!34070) (not b!339478) (not mapNonEmpty!12069) b_and!14343 (not b!339485) (not b!339479) (not b!339477) (not b!339480) (not b!339475) (not b_next!7149))
(check-sat b_and!14343 (not b_next!7149))
