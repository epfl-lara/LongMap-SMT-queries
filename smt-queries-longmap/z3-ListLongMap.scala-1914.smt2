; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34076 () Bool)

(assert start!34076)

(declare-fun b_free!7155 () Bool)

(declare-fun b_next!7155 () Bool)

(assert (=> start!34076 (= b_free!7155 (not b_next!7155))))

(declare-fun tp!24989 () Bool)

(declare-fun b_and!14349 () Bool)

(assert (=> start!34076 (= tp!24989 b_and!14349)))

(declare-fun mapNonEmpty!12078 () Bool)

(declare-fun mapRes!12078 () Bool)

(declare-fun tp!24990 () Bool)

(declare-fun e!208341 () Bool)

(assert (=> mapNonEmpty!12078 (= mapRes!12078 (and tp!24990 e!208341))))

(declare-datatypes ((V!10453 0))(
  ( (V!10454 (val!3598 Int)) )
))
(declare-datatypes ((ValueCell!3210 0))(
  ( (ValueCellFull!3210 (v!5767 V!10453)) (EmptyCell!3210) )
))
(declare-fun mapRest!12078 () (Array (_ BitVec 32) ValueCell!3210))

(declare-fun mapValue!12078 () ValueCell!3210)

(declare-fun mapKey!12078 () (_ BitVec 32))

(declare-datatypes ((array!17813 0))(
  ( (array!17814 (arr!8430 (Array (_ BitVec 32) ValueCell!3210)) (size!8782 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17813)

(assert (=> mapNonEmpty!12078 (= (arr!8430 _values!1525) (store mapRest!12078 mapKey!12078 mapValue!12078))))

(declare-fun b!339582 () Bool)

(declare-fun res!187574 () Bool)

(declare-fun e!208344 () Bool)

(assert (=> b!339582 (=> (not res!187574) (not e!208344))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339582 (= res!187574 (validKeyInArray!0 k0!1348))))

(declare-fun b!339583 () Bool)

(declare-fun e!208343 () Bool)

(declare-fun e!208340 () Bool)

(assert (=> b!339583 (= e!208343 (and e!208340 mapRes!12078))))

(declare-fun condMapEmpty!12078 () Bool)

(declare-fun mapDefault!12078 () ValueCell!3210)

(assert (=> b!339583 (= condMapEmpty!12078 (= (arr!8430 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3210)) mapDefault!12078)))))

(declare-fun b!339584 () Bool)

(declare-datatypes ((Unit!10586 0))(
  ( (Unit!10587) )
))
(declare-fun e!208342 () Unit!10586)

(declare-fun Unit!10588 () Unit!10586)

(assert (=> b!339584 (= e!208342 Unit!10588)))

(declare-fun res!187571 () Bool)

(assert (=> start!34076 (=> (not res!187571) (not e!208344))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34076 (= res!187571 (validMask!0 mask!2385))))

(assert (=> start!34076 e!208344))

(assert (=> start!34076 true))

(declare-fun tp_is_empty!7107 () Bool)

(assert (=> start!34076 tp_is_empty!7107))

(assert (=> start!34076 tp!24989))

(declare-fun array_inv!6250 (array!17813) Bool)

(assert (=> start!34076 (and (array_inv!6250 _values!1525) e!208343)))

(declare-datatypes ((array!17815 0))(
  ( (array!17816 (arr!8431 (Array (_ BitVec 32) (_ BitVec 64))) (size!8783 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17815)

(declare-fun array_inv!6251 (array!17815) Bool)

(assert (=> start!34076 (array_inv!6251 _keys!1895)))

(declare-fun b!339585 () Bool)

(declare-fun res!187572 () Bool)

(assert (=> b!339585 (=> (not res!187572) (not e!208344))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339585 (= res!187572 (and (= (size!8782 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8783 _keys!1895) (size!8782 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339586 () Bool)

(declare-fun res!187569 () Bool)

(assert (=> b!339586 (=> (not res!187569) (not e!208344))))

(declare-datatypes ((List!4844 0))(
  ( (Nil!4841) (Cons!4840 (h!5696 (_ BitVec 64)) (t!9946 List!4844)) )
))
(declare-fun arrayNoDuplicates!0 (array!17815 (_ BitVec 32) List!4844) Bool)

(assert (=> b!339586 (= res!187569 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4841))))

(declare-fun mapIsEmpty!12078 () Bool)

(assert (=> mapIsEmpty!12078 mapRes!12078))

(declare-fun b!339587 () Bool)

(declare-fun e!208339 () Bool)

(assert (=> b!339587 (= e!208339 false)))

(declare-fun lt!161245 () Unit!10586)

(assert (=> b!339587 (= lt!161245 e!208342)))

(declare-fun c!52572 () Bool)

(declare-fun arrayContainsKey!0 (array!17815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339587 (= c!52572 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339588 () Bool)

(declare-fun res!187573 () Bool)

(assert (=> b!339588 (=> (not res!187573) (not e!208344))))

(declare-fun zeroValue!1467 () V!10453)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10453)

(declare-datatypes ((tuple2!5226 0))(
  ( (tuple2!5227 (_1!2624 (_ BitVec 64)) (_2!2624 V!10453)) )
))
(declare-datatypes ((List!4845 0))(
  ( (Nil!4842) (Cons!4841 (h!5697 tuple2!5226) (t!9947 List!4845)) )
))
(declare-datatypes ((ListLongMap!4139 0))(
  ( (ListLongMap!4140 (toList!2085 List!4845)) )
))
(declare-fun contains!2136 (ListLongMap!4139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1606 (array!17815 array!17813 (_ BitVec 32) (_ BitVec 32) V!10453 V!10453 (_ BitVec 32) Int) ListLongMap!4139)

(assert (=> b!339588 (= res!187573 (not (contains!2136 (getCurrentListMap!1606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339589 () Bool)

(assert (=> b!339589 (= e!208340 tp_is_empty!7107)))

(declare-fun b!339590 () Bool)

(declare-fun Unit!10589 () Unit!10586)

(assert (=> b!339590 (= e!208342 Unit!10589)))

(declare-fun lt!161243 () Unit!10586)

(declare-fun lemmaArrayContainsKeyThenInListMap!288 (array!17815 array!17813 (_ BitVec 32) (_ BitVec 32) V!10453 V!10453 (_ BitVec 64) (_ BitVec 32) Int) Unit!10586)

(declare-fun arrayScanForKey!0 (array!17815 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339590 (= lt!161243 (lemmaArrayContainsKeyThenInListMap!288 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339590 false))

(declare-fun b!339591 () Bool)

(assert (=> b!339591 (= e!208344 e!208339)))

(declare-fun res!187570 () Bool)

(assert (=> b!339591 (=> (not res!187570) (not e!208339))))

(declare-datatypes ((SeekEntryResult!3257 0))(
  ( (MissingZero!3257 (index!15207 (_ BitVec 32))) (Found!3257 (index!15208 (_ BitVec 32))) (Intermediate!3257 (undefined!4069 Bool) (index!15209 (_ BitVec 32)) (x!33821 (_ BitVec 32))) (Undefined!3257) (MissingVacant!3257 (index!15210 (_ BitVec 32))) )
))
(declare-fun lt!161244 () SeekEntryResult!3257)

(get-info :version)

(assert (=> b!339591 (= res!187570 (and (not ((_ is Found!3257) lt!161244)) ((_ is MissingZero!3257) lt!161244)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17815 (_ BitVec 32)) SeekEntryResult!3257)

(assert (=> b!339591 (= lt!161244 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339592 () Bool)

(declare-fun res!187568 () Bool)

(assert (=> b!339592 (=> (not res!187568) (not e!208344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17815 (_ BitVec 32)) Bool)

(assert (=> b!339592 (= res!187568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339593 () Bool)

(assert (=> b!339593 (= e!208341 tp_is_empty!7107)))

(assert (= (and start!34076 res!187571) b!339585))

(assert (= (and b!339585 res!187572) b!339592))

(assert (= (and b!339592 res!187568) b!339586))

(assert (= (and b!339586 res!187569) b!339582))

(assert (= (and b!339582 res!187574) b!339588))

(assert (= (and b!339588 res!187573) b!339591))

(assert (= (and b!339591 res!187570) b!339587))

(assert (= (and b!339587 c!52572) b!339590))

(assert (= (and b!339587 (not c!52572)) b!339584))

(assert (= (and b!339583 condMapEmpty!12078) mapIsEmpty!12078))

(assert (= (and b!339583 (not condMapEmpty!12078)) mapNonEmpty!12078))

(assert (= (and mapNonEmpty!12078 ((_ is ValueCellFull!3210) mapValue!12078)) b!339593))

(assert (= (and b!339583 ((_ is ValueCellFull!3210) mapDefault!12078)) b!339589))

(assert (= start!34076 b!339583))

(declare-fun m!342517 () Bool)

(assert (=> b!339591 m!342517))

(declare-fun m!342519 () Bool)

(assert (=> b!339586 m!342519))

(declare-fun m!342521 () Bool)

(assert (=> b!339592 m!342521))

(declare-fun m!342523 () Bool)

(assert (=> start!34076 m!342523))

(declare-fun m!342525 () Bool)

(assert (=> start!34076 m!342525))

(declare-fun m!342527 () Bool)

(assert (=> start!34076 m!342527))

(declare-fun m!342529 () Bool)

(assert (=> b!339582 m!342529))

(declare-fun m!342531 () Bool)

(assert (=> b!339588 m!342531))

(assert (=> b!339588 m!342531))

(declare-fun m!342533 () Bool)

(assert (=> b!339588 m!342533))

(declare-fun m!342535 () Bool)

(assert (=> mapNonEmpty!12078 m!342535))

(declare-fun m!342537 () Bool)

(assert (=> b!339587 m!342537))

(declare-fun m!342539 () Bool)

(assert (=> b!339590 m!342539))

(assert (=> b!339590 m!342539))

(declare-fun m!342541 () Bool)

(assert (=> b!339590 m!342541))

(check-sat (not b!339592) (not b!339587) (not b_next!7155) tp_is_empty!7107 (not mapNonEmpty!12078) (not b!339590) (not b!339588) (not b!339582) (not b!339586) b_and!14349 (not start!34076) (not b!339591))
(check-sat b_and!14349 (not b_next!7155))
