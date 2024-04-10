; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33970 () Bool)

(assert start!33970)

(declare-fun b_free!7101 () Bool)

(declare-fun b_next!7101 () Bool)

(assert (=> start!33970 (= b_free!7101 (not b_next!7101))))

(declare-fun tp!24821 () Bool)

(declare-fun b_and!14291 () Bool)

(assert (=> start!33970 (= tp!24821 b_and!14291)))

(declare-fun mapNonEmpty!11991 () Bool)

(declare-fun mapRes!11991 () Bool)

(declare-fun tp!24822 () Bool)

(declare-fun e!207574 () Bool)

(assert (=> mapNonEmpty!11991 (= mapRes!11991 (and tp!24822 e!207574))))

(declare-datatypes ((V!10381 0))(
  ( (V!10382 (val!3571 Int)) )
))
(declare-datatypes ((ValueCell!3183 0))(
  ( (ValueCellFull!3183 (v!5738 V!10381)) (EmptyCell!3183) )
))
(declare-fun mapRest!11991 () (Array (_ BitVec 32) ValueCell!3183))

(declare-datatypes ((array!17701 0))(
  ( (array!17702 (arr!8376 (Array (_ BitVec 32) ValueCell!3183)) (size!8728 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17701)

(declare-fun mapValue!11991 () ValueCell!3183)

(declare-fun mapKey!11991 () (_ BitVec 32))

(assert (=> mapNonEmpty!11991 (= (arr!8376 _values!1525) (store mapRest!11991 mapKey!11991 mapValue!11991))))

(declare-fun b!338296 () Bool)

(declare-datatypes ((Unit!10501 0))(
  ( (Unit!10502) )
))
(declare-fun e!207573 () Unit!10501)

(declare-fun Unit!10503 () Unit!10501)

(assert (=> b!338296 (= e!207573 Unit!10503)))

(declare-fun b!338297 () Bool)

(declare-fun e!207576 () Bool)

(assert (=> b!338297 (= e!207576 false)))

(declare-fun lt!160770 () Unit!10501)

(assert (=> b!338297 (= lt!160770 e!207573)))

(declare-fun c!52413 () Bool)

(declare-datatypes ((array!17703 0))(
  ( (array!17704 (arr!8377 (Array (_ BitVec 32) (_ BitVec 64))) (size!8729 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17703)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338297 (= c!52413 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338298 () Bool)

(declare-fun Unit!10504 () Unit!10501)

(assert (=> b!338298 (= e!207573 Unit!10504)))

(declare-fun zeroValue!1467 () V!10381)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10381)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun lt!160769 () Unit!10501)

(declare-fun lemmaArrayContainsKeyThenInListMap!271 (array!17703 array!17701 (_ BitVec 32) (_ BitVec 32) V!10381 V!10381 (_ BitVec 64) (_ BitVec 32) Int) Unit!10501)

(declare-fun arrayScanForKey!0 (array!17703 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338298 (= lt!160769 (lemmaArrayContainsKeyThenInListMap!271 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338298 false))

(declare-fun b!338299 () Bool)

(declare-fun e!207578 () Bool)

(declare-fun e!207575 () Bool)

(assert (=> b!338299 (= e!207578 (and e!207575 mapRes!11991))))

(declare-fun condMapEmpty!11991 () Bool)

(declare-fun mapDefault!11991 () ValueCell!3183)

(assert (=> b!338299 (= condMapEmpty!11991 (= (arr!8376 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3183)) mapDefault!11991)))))

(declare-fun b!338300 () Bool)

(declare-fun e!207579 () Bool)

(assert (=> b!338300 (= e!207579 e!207576)))

(declare-fun res!186869 () Bool)

(assert (=> b!338300 (=> (not res!186869) (not e!207576))))

(declare-datatypes ((SeekEntryResult!3235 0))(
  ( (MissingZero!3235 (index!15119 (_ BitVec 32))) (Found!3235 (index!15120 (_ BitVec 32))) (Intermediate!3235 (undefined!4047 Bool) (index!15121 (_ BitVec 32)) (x!33707 (_ BitVec 32))) (Undefined!3235) (MissingVacant!3235 (index!15122 (_ BitVec 32))) )
))
(declare-fun lt!160771 () SeekEntryResult!3235)

(get-info :version)

(assert (=> b!338300 (= res!186869 (and (not ((_ is Found!3235) lt!160771)) ((_ is MissingZero!3235) lt!160771)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17703 (_ BitVec 32)) SeekEntryResult!3235)

(assert (=> b!338300 (= lt!160771 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338301 () Bool)

(declare-fun tp_is_empty!7053 () Bool)

(assert (=> b!338301 (= e!207575 tp_is_empty!7053)))

(declare-fun b!338302 () Bool)

(assert (=> b!338302 (= e!207574 tp_is_empty!7053)))

(declare-fun mapIsEmpty!11991 () Bool)

(assert (=> mapIsEmpty!11991 mapRes!11991))

(declare-fun b!338303 () Bool)

(declare-fun res!186864 () Bool)

(assert (=> b!338303 (=> (not res!186864) (not e!207579))))

(assert (=> b!338303 (= res!186864 (and (= (size!8728 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8729 _keys!1895) (size!8728 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338305 () Bool)

(declare-fun res!186868 () Bool)

(assert (=> b!338305 (=> (not res!186868) (not e!207579))))

(declare-datatypes ((tuple2!5186 0))(
  ( (tuple2!5187 (_1!2604 (_ BitVec 64)) (_2!2604 V!10381)) )
))
(declare-datatypes ((List!4802 0))(
  ( (Nil!4799) (Cons!4798 (h!5654 tuple2!5186) (t!9900 List!4802)) )
))
(declare-datatypes ((ListLongMap!4099 0))(
  ( (ListLongMap!4100 (toList!2065 List!4802)) )
))
(declare-fun contains!2114 (ListLongMap!4099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1586 (array!17703 array!17701 (_ BitVec 32) (_ BitVec 32) V!10381 V!10381 (_ BitVec 32) Int) ListLongMap!4099)

(assert (=> b!338305 (= res!186868 (not (contains!2114 (getCurrentListMap!1586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338306 () Bool)

(declare-fun res!186867 () Bool)

(assert (=> b!338306 (=> (not res!186867) (not e!207579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338306 (= res!186867 (validKeyInArray!0 k0!1348))))

(declare-fun b!338307 () Bool)

(declare-fun res!186863 () Bool)

(assert (=> b!338307 (=> (not res!186863) (not e!207579))))

(declare-datatypes ((List!4803 0))(
  ( (Nil!4800) (Cons!4799 (h!5655 (_ BitVec 64)) (t!9901 List!4803)) )
))
(declare-fun arrayNoDuplicates!0 (array!17703 (_ BitVec 32) List!4803) Bool)

(assert (=> b!338307 (= res!186863 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4800))))

(declare-fun res!186866 () Bool)

(assert (=> start!33970 (=> (not res!186866) (not e!207579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33970 (= res!186866 (validMask!0 mask!2385))))

(assert (=> start!33970 e!207579))

(assert (=> start!33970 true))

(assert (=> start!33970 tp_is_empty!7053))

(assert (=> start!33970 tp!24821))

(declare-fun array_inv!6216 (array!17701) Bool)

(assert (=> start!33970 (and (array_inv!6216 _values!1525) e!207578)))

(declare-fun array_inv!6217 (array!17703) Bool)

(assert (=> start!33970 (array_inv!6217 _keys!1895)))

(declare-fun b!338304 () Bool)

(declare-fun res!186865 () Bool)

(assert (=> b!338304 (=> (not res!186865) (not e!207579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17703 (_ BitVec 32)) Bool)

(assert (=> b!338304 (= res!186865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33970 res!186866) b!338303))

(assert (= (and b!338303 res!186864) b!338304))

(assert (= (and b!338304 res!186865) b!338307))

(assert (= (and b!338307 res!186863) b!338306))

(assert (= (and b!338306 res!186867) b!338305))

(assert (= (and b!338305 res!186868) b!338300))

(assert (= (and b!338300 res!186869) b!338297))

(assert (= (and b!338297 c!52413) b!338298))

(assert (= (and b!338297 (not c!52413)) b!338296))

(assert (= (and b!338299 condMapEmpty!11991) mapIsEmpty!11991))

(assert (= (and b!338299 (not condMapEmpty!11991)) mapNonEmpty!11991))

(assert (= (and mapNonEmpty!11991 ((_ is ValueCellFull!3183) mapValue!11991)) b!338302))

(assert (= (and b!338299 ((_ is ValueCellFull!3183) mapDefault!11991)) b!338301))

(assert (= start!33970 b!338299))

(declare-fun m!341587 () Bool)

(assert (=> b!338298 m!341587))

(assert (=> b!338298 m!341587))

(declare-fun m!341589 () Bool)

(assert (=> b!338298 m!341589))

(declare-fun m!341591 () Bool)

(assert (=> b!338297 m!341591))

(declare-fun m!341593 () Bool)

(assert (=> b!338307 m!341593))

(declare-fun m!341595 () Bool)

(assert (=> mapNonEmpty!11991 m!341595))

(declare-fun m!341597 () Bool)

(assert (=> b!338304 m!341597))

(declare-fun m!341599 () Bool)

(assert (=> b!338300 m!341599))

(declare-fun m!341601 () Bool)

(assert (=> start!33970 m!341601))

(declare-fun m!341603 () Bool)

(assert (=> start!33970 m!341603))

(declare-fun m!341605 () Bool)

(assert (=> start!33970 m!341605))

(declare-fun m!341607 () Bool)

(assert (=> b!338306 m!341607))

(declare-fun m!341609 () Bool)

(assert (=> b!338305 m!341609))

(assert (=> b!338305 m!341609))

(declare-fun m!341611 () Bool)

(assert (=> b!338305 m!341611))

(check-sat (not b!338297) tp_is_empty!7053 (not b!338305) (not start!33970) (not b!338300) (not b!338304) b_and!14291 (not b!338306) (not mapNonEmpty!11991) (not b!338307) (not b_next!7101) (not b!338298))
(check-sat b_and!14291 (not b_next!7101))
