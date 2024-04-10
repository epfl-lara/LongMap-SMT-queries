; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34324 () Bool)

(assert start!34324)

(declare-fun b_free!7299 () Bool)

(declare-fun b_next!7299 () Bool)

(assert (=> start!34324 (= b_free!7299 (not b_next!7299))))

(declare-fun tp!25437 () Bool)

(declare-fun b_and!14503 () Bool)

(assert (=> start!34324 (= tp!25437 b_and!14503)))

(declare-fun b!342623 () Bool)

(declare-fun res!189401 () Bool)

(declare-fun e!210099 () Bool)

(assert (=> b!342623 (=> (not res!189401) (not e!210099))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!10645 0))(
  ( (V!10646 (val!3670 Int)) )
))
(declare-datatypes ((ValueCell!3282 0))(
  ( (ValueCellFull!3282 (v!5844 V!10645)) (EmptyCell!3282) )
))
(declare-datatypes ((array!18095 0))(
  ( (array!18096 (arr!8566 (Array (_ BitVec 32) ValueCell!3282)) (size!8918 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18095)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10645)

(declare-fun zeroValue!1467 () V!10645)

(declare-datatypes ((array!18097 0))(
  ( (array!18098 (arr!8567 (Array (_ BitVec 32) (_ BitVec 64))) (size!8919 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18097)

(declare-datatypes ((tuple2!5318 0))(
  ( (tuple2!5319 (_1!2670 (_ BitVec 64)) (_2!2670 V!10645)) )
))
(declare-datatypes ((List!4937 0))(
  ( (Nil!4934) (Cons!4933 (h!5789 tuple2!5318) (t!10049 List!4937)) )
))
(declare-datatypes ((ListLongMap!4231 0))(
  ( (ListLongMap!4232 (toList!2131 List!4937)) )
))
(declare-fun contains!2187 (ListLongMap!4231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1652 (array!18097 array!18095 (_ BitVec 32) (_ BitVec 32) V!10645 V!10645 (_ BitVec 32) Int) ListLongMap!4231)

(assert (=> b!342623 (= res!189401 (not (contains!2187 (getCurrentListMap!1652 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342624 () Bool)

(declare-fun e!210101 () Bool)

(declare-fun tp_is_empty!7251 () Bool)

(assert (=> b!342624 (= e!210101 tp_is_empty!7251)))

(declare-fun b!342625 () Bool)

(declare-fun res!189400 () Bool)

(assert (=> b!342625 (=> (not res!189400) (not e!210099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342625 (= res!189400 (validKeyInArray!0 k0!1348))))

(declare-fun b!342626 () Bool)

(declare-fun e!210104 () Bool)

(declare-fun e!210102 () Bool)

(declare-fun mapRes!12309 () Bool)

(assert (=> b!342626 (= e!210104 (and e!210102 mapRes!12309))))

(declare-fun condMapEmpty!12309 () Bool)

(declare-fun mapDefault!12309 () ValueCell!3282)

(assert (=> b!342626 (= condMapEmpty!12309 (= (arr!8566 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3282)) mapDefault!12309)))))

(declare-fun mapNonEmpty!12309 () Bool)

(declare-fun tp!25436 () Bool)

(assert (=> mapNonEmpty!12309 (= mapRes!12309 (and tp!25436 e!210101))))

(declare-fun mapRest!12309 () (Array (_ BitVec 32) ValueCell!3282))

(declare-fun mapValue!12309 () ValueCell!3282)

(declare-fun mapKey!12309 () (_ BitVec 32))

(assert (=> mapNonEmpty!12309 (= (arr!8566 _values!1525) (store mapRest!12309 mapKey!12309 mapValue!12309))))

(declare-fun mapIsEmpty!12309 () Bool)

(assert (=> mapIsEmpty!12309 mapRes!12309))

(declare-fun b!342627 () Bool)

(declare-fun e!210105 () Bool)

(assert (=> b!342627 (= e!210105 false)))

(declare-datatypes ((Unit!10677 0))(
  ( (Unit!10678) )
))
(declare-fun lt!162205 () Unit!10677)

(declare-fun e!210103 () Unit!10677)

(assert (=> b!342627 (= lt!162205 e!210103)))

(declare-fun c!52830 () Bool)

(declare-fun arrayContainsKey!0 (array!18097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342627 (= c!52830 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342628 () Bool)

(declare-fun res!189395 () Bool)

(assert (=> b!342628 (=> (not res!189395) (not e!210099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18097 (_ BitVec 32)) Bool)

(assert (=> b!342628 (= res!189395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342629 () Bool)

(declare-fun res!189397 () Bool)

(assert (=> b!342629 (=> (not res!189397) (not e!210099))))

(assert (=> b!342629 (= res!189397 (and (= (size!8918 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8919 _keys!1895) (size!8918 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342630 () Bool)

(assert (=> b!342630 (= e!210102 tp_is_empty!7251)))

(declare-fun b!342631 () Bool)

(declare-fun Unit!10679 () Unit!10677)

(assert (=> b!342631 (= e!210103 Unit!10679)))

(declare-fun lt!162203 () Unit!10677)

(declare-fun lemmaArrayContainsKeyThenInListMap!304 (array!18097 array!18095 (_ BitVec 32) (_ BitVec 32) V!10645 V!10645 (_ BitVec 64) (_ BitVec 32) Int) Unit!10677)

(declare-fun arrayScanForKey!0 (array!18097 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342631 (= lt!162203 (lemmaArrayContainsKeyThenInListMap!304 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342631 false))

(declare-fun b!342632 () Bool)

(assert (=> b!342632 (= e!210099 e!210105)))

(declare-fun res!189399 () Bool)

(assert (=> b!342632 (=> (not res!189399) (not e!210105))))

(declare-datatypes ((SeekEntryResult!3305 0))(
  ( (MissingZero!3305 (index!15399 (_ BitVec 32))) (Found!3305 (index!15400 (_ BitVec 32))) (Intermediate!3305 (undefined!4117 Bool) (index!15401 (_ BitVec 32)) (x!34111 (_ BitVec 32))) (Undefined!3305) (MissingVacant!3305 (index!15402 (_ BitVec 32))) )
))
(declare-fun lt!162204 () SeekEntryResult!3305)

(get-info :version)

(assert (=> b!342632 (= res!189399 (and (not ((_ is Found!3305) lt!162204)) (not ((_ is MissingZero!3305) lt!162204)) ((_ is MissingVacant!3305) lt!162204)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18097 (_ BitVec 32)) SeekEntryResult!3305)

(assert (=> b!342632 (= lt!162204 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!189396 () Bool)

(assert (=> start!34324 (=> (not res!189396) (not e!210099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34324 (= res!189396 (validMask!0 mask!2385))))

(assert (=> start!34324 e!210099))

(assert (=> start!34324 true))

(assert (=> start!34324 tp_is_empty!7251))

(assert (=> start!34324 tp!25437))

(declare-fun array_inv!6342 (array!18095) Bool)

(assert (=> start!34324 (and (array_inv!6342 _values!1525) e!210104)))

(declare-fun array_inv!6343 (array!18097) Bool)

(assert (=> start!34324 (array_inv!6343 _keys!1895)))

(declare-fun b!342633 () Bool)

(declare-fun Unit!10680 () Unit!10677)

(assert (=> b!342633 (= e!210103 Unit!10680)))

(declare-fun b!342634 () Bool)

(declare-fun res!189398 () Bool)

(assert (=> b!342634 (=> (not res!189398) (not e!210099))))

(declare-datatypes ((List!4938 0))(
  ( (Nil!4935) (Cons!4934 (h!5790 (_ BitVec 64)) (t!10050 List!4938)) )
))
(declare-fun arrayNoDuplicates!0 (array!18097 (_ BitVec 32) List!4938) Bool)

(assert (=> b!342634 (= res!189398 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4935))))

(assert (= (and start!34324 res!189396) b!342629))

(assert (= (and b!342629 res!189397) b!342628))

(assert (= (and b!342628 res!189395) b!342634))

(assert (= (and b!342634 res!189398) b!342625))

(assert (= (and b!342625 res!189400) b!342623))

(assert (= (and b!342623 res!189401) b!342632))

(assert (= (and b!342632 res!189399) b!342627))

(assert (= (and b!342627 c!52830) b!342631))

(assert (= (and b!342627 (not c!52830)) b!342633))

(assert (= (and b!342626 condMapEmpty!12309) mapIsEmpty!12309))

(assert (= (and b!342626 (not condMapEmpty!12309)) mapNonEmpty!12309))

(assert (= (and mapNonEmpty!12309 ((_ is ValueCellFull!3282) mapValue!12309)) b!342624))

(assert (= (and b!342626 ((_ is ValueCellFull!3282) mapDefault!12309)) b!342630))

(assert (= start!34324 b!342626))

(declare-fun m!344727 () Bool)

(assert (=> b!342634 m!344727))

(declare-fun m!344729 () Bool)

(assert (=> b!342625 m!344729))

(declare-fun m!344731 () Bool)

(assert (=> start!34324 m!344731))

(declare-fun m!344733 () Bool)

(assert (=> start!34324 m!344733))

(declare-fun m!344735 () Bool)

(assert (=> start!34324 m!344735))

(declare-fun m!344737 () Bool)

(assert (=> b!342632 m!344737))

(declare-fun m!344739 () Bool)

(assert (=> mapNonEmpty!12309 m!344739))

(declare-fun m!344741 () Bool)

(assert (=> b!342628 m!344741))

(declare-fun m!344743 () Bool)

(assert (=> b!342627 m!344743))

(declare-fun m!344745 () Bool)

(assert (=> b!342623 m!344745))

(assert (=> b!342623 m!344745))

(declare-fun m!344747 () Bool)

(assert (=> b!342623 m!344747))

(declare-fun m!344749 () Bool)

(assert (=> b!342631 m!344749))

(assert (=> b!342631 m!344749))

(declare-fun m!344751 () Bool)

(assert (=> b!342631 m!344751))

(check-sat (not mapNonEmpty!12309) (not b!342631) (not b!342623) (not start!34324) (not b!342628) (not b!342632) (not b_next!7299) b_and!14503 (not b!342627) (not b!342625) (not b!342634) tp_is_empty!7251)
(check-sat b_and!14503 (not b_next!7299))
