; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34206 () Bool)

(assert start!34206)

(declare-fun b_free!7243 () Bool)

(declare-fun b_next!7243 () Bool)

(assert (=> start!34206 (= b_free!7243 (not b_next!7243))))

(declare-fun tp!25263 () Bool)

(declare-fun b_and!14457 () Bool)

(assert (=> start!34206 (= tp!25263 b_and!14457)))

(declare-fun b!341300 () Bool)

(declare-fun e!209318 () Bool)

(declare-fun e!209313 () Bool)

(assert (=> b!341300 (= e!209318 e!209313)))

(declare-fun res!188693 () Bool)

(assert (=> b!341300 (=> (not res!188693) (not e!209313))))

(declare-datatypes ((SeekEntryResult!3239 0))(
  ( (MissingZero!3239 (index!15135 (_ BitVec 32))) (Found!3239 (index!15136 (_ BitVec 32))) (Intermediate!3239 (undefined!4051 Bool) (index!15137 (_ BitVec 32)) (x!33950 (_ BitVec 32))) (Undefined!3239) (MissingVacant!3239 (index!15138 (_ BitVec 32))) )
))
(declare-fun lt!161773 () SeekEntryResult!3239)

(get-info :version)

(assert (=> b!341300 (= res!188693 (and (not ((_ is Found!3239) lt!161773)) (not ((_ is MissingZero!3239) lt!161773)) ((_ is MissingVacant!3239) lt!161773)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17976 0))(
  ( (array!17977 (arr!8508 (Array (_ BitVec 32) (_ BitVec 64))) (size!8860 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17976)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17976 (_ BitVec 32)) SeekEntryResult!3239)

(assert (=> b!341300 (= lt!161773 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341301 () Bool)

(declare-fun res!188690 () Bool)

(assert (=> b!341301 (=> (not res!188690) (not e!209318))))

(declare-datatypes ((V!10571 0))(
  ( (V!10572 (val!3642 Int)) )
))
(declare-datatypes ((ValueCell!3254 0))(
  ( (ValueCellFull!3254 (v!5815 V!10571)) (EmptyCell!3254) )
))
(declare-datatypes ((array!17978 0))(
  ( (array!17979 (arr!8509 (Array (_ BitVec 32) ValueCell!3254)) (size!8861 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17978)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341301 (= res!188690 (and (= (size!8861 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8860 _keys!1895) (size!8861 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341302 () Bool)

(declare-fun e!209316 () Bool)

(declare-fun tp_is_empty!7195 () Bool)

(assert (=> b!341302 (= e!209316 tp_is_empty!7195)))

(declare-fun mapNonEmpty!12219 () Bool)

(declare-fun mapRes!12219 () Bool)

(declare-fun tp!25262 () Bool)

(assert (=> mapNonEmpty!12219 (= mapRes!12219 (and tp!25262 e!209316))))

(declare-fun mapValue!12219 () ValueCell!3254)

(declare-fun mapRest!12219 () (Array (_ BitVec 32) ValueCell!3254))

(declare-fun mapKey!12219 () (_ BitVec 32))

(assert (=> mapNonEmpty!12219 (= (arr!8509 _values!1525) (store mapRest!12219 mapKey!12219 mapValue!12219))))

(declare-fun res!188688 () Bool)

(assert (=> start!34206 (=> (not res!188688) (not e!209318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34206 (= res!188688 (validMask!0 mask!2385))))

(assert (=> start!34206 e!209318))

(assert (=> start!34206 true))

(assert (=> start!34206 tp_is_empty!7195))

(assert (=> start!34206 tp!25263))

(declare-fun e!209317 () Bool)

(declare-fun array_inv!6298 (array!17978) Bool)

(assert (=> start!34206 (and (array_inv!6298 _values!1525) e!209317)))

(declare-fun array_inv!6299 (array!17976) Bool)

(assert (=> start!34206 (array_inv!6299 _keys!1895)))

(declare-fun b!341303 () Bool)

(declare-fun res!188691 () Bool)

(assert (=> b!341303 (=> (not res!188691) (not e!209318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17976 (_ BitVec 32)) Bool)

(assert (=> b!341303 (= res!188691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341304 () Bool)

(assert (=> b!341304 (= e!209313 false)))

(declare-fun lt!161772 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17976 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341304 (= lt!161772 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341305 () Bool)

(declare-fun e!209315 () Bool)

(assert (=> b!341305 (= e!209317 (and e!209315 mapRes!12219))))

(declare-fun condMapEmpty!12219 () Bool)

(declare-fun mapDefault!12219 () ValueCell!3254)

(assert (=> b!341305 (= condMapEmpty!12219 (= (arr!8509 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3254)) mapDefault!12219)))))

(declare-fun b!341306 () Bool)

(assert (=> b!341306 (= e!209315 tp_is_empty!7195)))

(declare-fun b!341307 () Bool)

(declare-fun res!188686 () Bool)

(assert (=> b!341307 (=> (not res!188686) (not e!209318))))

(declare-fun zeroValue!1467 () V!10571)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10571)

(declare-datatypes ((tuple2!5192 0))(
  ( (tuple2!5193 (_1!2607 (_ BitVec 64)) (_2!2607 V!10571)) )
))
(declare-datatypes ((List!4796 0))(
  ( (Nil!4793) (Cons!4792 (h!5648 tuple2!5192) (t!9896 List!4796)) )
))
(declare-datatypes ((ListLongMap!4107 0))(
  ( (ListLongMap!4108 (toList!2069 List!4796)) )
))
(declare-fun contains!2142 (ListLongMap!4107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1598 (array!17976 array!17978 (_ BitVec 32) (_ BitVec 32) V!10571 V!10571 (_ BitVec 32) Int) ListLongMap!4107)

(assert (=> b!341307 (= res!188686 (not (contains!2142 (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341308 () Bool)

(declare-fun res!188689 () Bool)

(assert (=> b!341308 (=> (not res!188689) (not e!209318))))

(declare-datatypes ((List!4797 0))(
  ( (Nil!4794) (Cons!4793 (h!5649 (_ BitVec 64)) (t!9897 List!4797)) )
))
(declare-fun arrayNoDuplicates!0 (array!17976 (_ BitVec 32) List!4797) Bool)

(assert (=> b!341308 (= res!188689 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4794))))

(declare-fun b!341309 () Bool)

(declare-fun res!188692 () Bool)

(assert (=> b!341309 (=> (not res!188692) (not e!209318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341309 (= res!188692 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12219 () Bool)

(assert (=> mapIsEmpty!12219 mapRes!12219))

(declare-fun b!341310 () Bool)

(declare-fun res!188687 () Bool)

(assert (=> b!341310 (=> (not res!188687) (not e!209313))))

(declare-fun arrayContainsKey!0 (array!17976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341310 (= res!188687 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34206 res!188688) b!341301))

(assert (= (and b!341301 res!188690) b!341303))

(assert (= (and b!341303 res!188691) b!341308))

(assert (= (and b!341308 res!188689) b!341309))

(assert (= (and b!341309 res!188692) b!341307))

(assert (= (and b!341307 res!188686) b!341300))

(assert (= (and b!341300 res!188693) b!341310))

(assert (= (and b!341310 res!188687) b!341304))

(assert (= (and b!341305 condMapEmpty!12219) mapIsEmpty!12219))

(assert (= (and b!341305 (not condMapEmpty!12219)) mapNonEmpty!12219))

(assert (= (and mapNonEmpty!12219 ((_ is ValueCellFull!3254) mapValue!12219)) b!341302))

(assert (= (and b!341305 ((_ is ValueCellFull!3254) mapDefault!12219)) b!341306))

(assert (= start!34206 b!341305))

(declare-fun m!344031 () Bool)

(assert (=> b!341300 m!344031))

(declare-fun m!344033 () Bool)

(assert (=> start!34206 m!344033))

(declare-fun m!344035 () Bool)

(assert (=> start!34206 m!344035))

(declare-fun m!344037 () Bool)

(assert (=> start!34206 m!344037))

(declare-fun m!344039 () Bool)

(assert (=> mapNonEmpty!12219 m!344039))

(declare-fun m!344041 () Bool)

(assert (=> b!341303 m!344041))

(declare-fun m!344043 () Bool)

(assert (=> b!341308 m!344043))

(declare-fun m!344045 () Bool)

(assert (=> b!341310 m!344045))

(declare-fun m!344047 () Bool)

(assert (=> b!341309 m!344047))

(declare-fun m!344049 () Bool)

(assert (=> b!341304 m!344049))

(declare-fun m!344051 () Bool)

(assert (=> b!341307 m!344051))

(assert (=> b!341307 m!344051))

(declare-fun m!344053 () Bool)

(assert (=> b!341307 m!344053))

(check-sat (not start!34206) (not b!341310) (not mapNonEmpty!12219) (not b!341300) (not b!341309) tp_is_empty!7195 (not b!341308) (not b!341304) b_and!14457 (not b!341307) (not b_next!7243) (not b!341303))
(check-sat b_and!14457 (not b_next!7243))
