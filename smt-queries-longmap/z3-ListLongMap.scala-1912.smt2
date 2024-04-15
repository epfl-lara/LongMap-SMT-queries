; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34048 () Bool)

(assert start!34048)

(declare-fun b_free!7141 () Bool)

(declare-fun b_next!7141 () Bool)

(assert (=> start!34048 (= b_free!7141 (not b_next!7141))))

(declare-fun tp!24947 () Bool)

(declare-fun b_and!14309 () Bool)

(assert (=> start!34048 (= tp!24947 b_and!14309)))

(declare-fun b!339055 () Bool)

(declare-fun e!208015 () Bool)

(declare-fun tp_is_empty!7093 () Bool)

(assert (=> b!339055 (= e!208015 tp_is_empty!7093)))

(declare-fun b!339056 () Bool)

(declare-fun e!208017 () Bool)

(declare-fun e!208018 () Bool)

(assert (=> b!339056 (= e!208017 e!208018)))

(declare-fun res!187297 () Bool)

(assert (=> b!339056 (=> (not res!187297) (not e!208018))))

(declare-datatypes ((SeekEntryResult!3245 0))(
  ( (MissingZero!3245 (index!15159 (_ BitVec 32))) (Found!3245 (index!15160 (_ BitVec 32))) (Intermediate!3245 (undefined!4057 Bool) (index!15161 (_ BitVec 32)) (x!33788 (_ BitVec 32))) (Undefined!3245) (MissingVacant!3245 (index!15162 (_ BitVec 32))) )
))
(declare-fun lt!160947 () SeekEntryResult!3245)

(get-info :version)

(assert (=> b!339056 (= res!187297 (and (not ((_ is Found!3245) lt!160947)) ((_ is MissingZero!3245) lt!160947)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17765 0))(
  ( (array!17766 (arr!8406 (Array (_ BitVec 32) (_ BitVec 64))) (size!8759 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17765)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17765 (_ BitVec 32)) SeekEntryResult!3245)

(assert (=> b!339056 (= lt!160947 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339057 () Bool)

(assert (=> b!339057 (= e!208018 false)))

(declare-datatypes ((Unit!10539 0))(
  ( (Unit!10540) )
))
(declare-fun lt!160945 () Unit!10539)

(declare-fun e!208021 () Unit!10539)

(assert (=> b!339057 (= lt!160945 e!208021)))

(declare-fun c!52478 () Bool)

(declare-fun arrayContainsKey!0 (array!17765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339057 (= c!52478 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12057 () Bool)

(declare-fun mapRes!12057 () Bool)

(declare-fun tp!24948 () Bool)

(assert (=> mapNonEmpty!12057 (= mapRes!12057 (and tp!24948 e!208015))))

(declare-datatypes ((V!10435 0))(
  ( (V!10436 (val!3591 Int)) )
))
(declare-datatypes ((ValueCell!3203 0))(
  ( (ValueCellFull!3203 (v!5754 V!10435)) (EmptyCell!3203) )
))
(declare-fun mapRest!12057 () (Array (_ BitVec 32) ValueCell!3203))

(declare-fun mapKey!12057 () (_ BitVec 32))

(declare-datatypes ((array!17767 0))(
  ( (array!17768 (arr!8407 (Array (_ BitVec 32) ValueCell!3203)) (size!8760 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17767)

(declare-fun mapValue!12057 () ValueCell!3203)

(assert (=> mapNonEmpty!12057 (= (arr!8407 _values!1525) (store mapRest!12057 mapKey!12057 mapValue!12057))))

(declare-fun mapIsEmpty!12057 () Bool)

(assert (=> mapIsEmpty!12057 mapRes!12057))

(declare-fun b!339058 () Bool)

(declare-fun res!187298 () Bool)

(assert (=> b!339058 (=> (not res!187298) (not e!208017))))

(declare-fun zeroValue!1467 () V!10435)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10435)

(declare-datatypes ((tuple2!5156 0))(
  ( (tuple2!5157 (_1!2589 (_ BitVec 64)) (_2!2589 V!10435)) )
))
(declare-datatypes ((List!4782 0))(
  ( (Nil!4779) (Cons!4778 (h!5634 tuple2!5156) (t!9875 List!4782)) )
))
(declare-datatypes ((ListLongMap!4059 0))(
  ( (ListLongMap!4060 (toList!2045 List!4782)) )
))
(declare-fun contains!2107 (ListLongMap!4059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1551 (array!17765 array!17767 (_ BitVec 32) (_ BitVec 32) V!10435 V!10435 (_ BitVec 32) Int) ListLongMap!4059)

(assert (=> b!339058 (= res!187298 (not (contains!2107 (getCurrentListMap!1551 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!187295 () Bool)

(assert (=> start!34048 (=> (not res!187295) (not e!208017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34048 (= res!187295 (validMask!0 mask!2385))))

(assert (=> start!34048 e!208017))

(assert (=> start!34048 true))

(assert (=> start!34048 tp_is_empty!7093))

(assert (=> start!34048 tp!24947))

(declare-fun e!208020 () Bool)

(declare-fun array_inv!6262 (array!17767) Bool)

(assert (=> start!34048 (and (array_inv!6262 _values!1525) e!208020)))

(declare-fun array_inv!6263 (array!17765) Bool)

(assert (=> start!34048 (array_inv!6263 _keys!1895)))

(declare-fun b!339059 () Bool)

(declare-fun res!187293 () Bool)

(assert (=> b!339059 (=> (not res!187293) (not e!208017))))

(assert (=> b!339059 (= res!187293 (and (= (size!8760 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8759 _keys!1895) (size!8760 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339060 () Bool)

(declare-fun res!187296 () Bool)

(assert (=> b!339060 (=> (not res!187296) (not e!208017))))

(declare-datatypes ((List!4783 0))(
  ( (Nil!4780) (Cons!4779 (h!5635 (_ BitVec 64)) (t!9876 List!4783)) )
))
(declare-fun arrayNoDuplicates!0 (array!17765 (_ BitVec 32) List!4783) Bool)

(assert (=> b!339060 (= res!187296 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4780))))

(declare-fun b!339061 () Bool)

(declare-fun Unit!10541 () Unit!10539)

(assert (=> b!339061 (= e!208021 Unit!10541)))

(declare-fun b!339062 () Bool)

(declare-fun e!208016 () Bool)

(assert (=> b!339062 (= e!208020 (and e!208016 mapRes!12057))))

(declare-fun condMapEmpty!12057 () Bool)

(declare-fun mapDefault!12057 () ValueCell!3203)

(assert (=> b!339062 (= condMapEmpty!12057 (= (arr!8407 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3203)) mapDefault!12057)))))

(declare-fun b!339063 () Bool)

(declare-fun res!187292 () Bool)

(assert (=> b!339063 (=> (not res!187292) (not e!208017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339063 (= res!187292 (validKeyInArray!0 k0!1348))))

(declare-fun b!339064 () Bool)

(declare-fun res!187294 () Bool)

(assert (=> b!339064 (=> (not res!187294) (not e!208017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17765 (_ BitVec 32)) Bool)

(assert (=> b!339064 (= res!187294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339065 () Bool)

(assert (=> b!339065 (= e!208016 tp_is_empty!7093)))

(declare-fun b!339066 () Bool)

(declare-fun Unit!10542 () Unit!10539)

(assert (=> b!339066 (= e!208021 Unit!10542)))

(declare-fun lt!160946 () Unit!10539)

(declare-fun lemmaArrayContainsKeyThenInListMap!284 (array!17765 array!17767 (_ BitVec 32) (_ BitVec 32) V!10435 V!10435 (_ BitVec 64) (_ BitVec 32) Int) Unit!10539)

(declare-fun arrayScanForKey!0 (array!17765 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339066 (= lt!160946 (lemmaArrayContainsKeyThenInListMap!284 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339066 false))

(assert (= (and start!34048 res!187295) b!339059))

(assert (= (and b!339059 res!187293) b!339064))

(assert (= (and b!339064 res!187294) b!339060))

(assert (= (and b!339060 res!187296) b!339063))

(assert (= (and b!339063 res!187292) b!339058))

(assert (= (and b!339058 res!187298) b!339056))

(assert (= (and b!339056 res!187297) b!339057))

(assert (= (and b!339057 c!52478) b!339066))

(assert (= (and b!339057 (not c!52478)) b!339061))

(assert (= (and b!339062 condMapEmpty!12057) mapIsEmpty!12057))

(assert (= (and b!339062 (not condMapEmpty!12057)) mapNonEmpty!12057))

(assert (= (and mapNonEmpty!12057 ((_ is ValueCellFull!3203) mapValue!12057)) b!339055))

(assert (= (and b!339062 ((_ is ValueCellFull!3203) mapDefault!12057)) b!339065))

(assert (= start!34048 b!339062))

(declare-fun m!341605 () Bool)

(assert (=> b!339063 m!341605))

(declare-fun m!341607 () Bool)

(assert (=> b!339057 m!341607))

(declare-fun m!341609 () Bool)

(assert (=> b!339060 m!341609))

(declare-fun m!341611 () Bool)

(assert (=> b!339058 m!341611))

(assert (=> b!339058 m!341611))

(declare-fun m!341613 () Bool)

(assert (=> b!339058 m!341613))

(declare-fun m!341615 () Bool)

(assert (=> mapNonEmpty!12057 m!341615))

(declare-fun m!341617 () Bool)

(assert (=> b!339056 m!341617))

(declare-fun m!341619 () Bool)

(assert (=> b!339066 m!341619))

(assert (=> b!339066 m!341619))

(declare-fun m!341621 () Bool)

(assert (=> b!339066 m!341621))

(declare-fun m!341623 () Bool)

(assert (=> start!34048 m!341623))

(declare-fun m!341625 () Bool)

(assert (=> start!34048 m!341625))

(declare-fun m!341627 () Bool)

(assert (=> start!34048 m!341627))

(declare-fun m!341629 () Bool)

(assert (=> b!339064 m!341629))

(check-sat tp_is_empty!7093 (not b!339060) (not b!339057) (not b!339056) (not b!339058) b_and!14309 (not mapNonEmpty!12057) (not start!34048) (not b!339064) (not b_next!7141) (not b!339063) (not b!339066))
(check-sat b_and!14309 (not b_next!7141))
