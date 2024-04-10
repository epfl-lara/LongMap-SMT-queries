; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4022 () Bool)

(assert start!4022)

(declare-fun b_free!927 () Bool)

(declare-fun b_next!927 () Bool)

(assert (=> start!4022 (= b_free!927 (not b_next!927))))

(declare-fun tp!4201 () Bool)

(declare-fun b_and!1737 () Bool)

(assert (=> start!4022 (= tp!4201 b_and!1737)))

(declare-fun b!29331 () Bool)

(declare-fun e!18943 () Bool)

(declare-fun e!18941 () Bool)

(assert (=> b!29331 (= e!18943 e!18941)))

(declare-fun res!17578 () Bool)

(assert (=> b!29331 (=> (not res!17578) (not e!18941))))

(declare-datatypes ((V!1533 0))(
  ( (V!1534 (val!667 Int)) )
))
(declare-datatypes ((tuple2!1104 0))(
  ( (tuple2!1105 (_1!563 (_ BitVec 64)) (_2!563 V!1533)) )
))
(declare-datatypes ((List!704 0))(
  ( (Nil!701) (Cons!700 (h!1267 tuple2!1104) (t!3397 List!704)) )
))
(declare-datatypes ((ListLongMap!681 0))(
  ( (ListLongMap!682 (toList!356 List!704)) )
))
(declare-fun lt!11205 () ListLongMap!681)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!296 (ListLongMap!681 (_ BitVec 64)) Bool)

(assert (=> b!29331 (= res!17578 (not (contains!296 lt!11205 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!441 0))(
  ( (ValueCellFull!441 (v!1756 V!1533)) (EmptyCell!441) )
))
(declare-datatypes ((array!1793 0))(
  ( (array!1794 (arr!850 (Array (_ BitVec 32) ValueCell!441)) (size!951 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1793)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1795 0))(
  ( (array!1796 (arr!851 (Array (_ BitVec 32) (_ BitVec 64))) (size!952 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1795)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1533)

(declare-fun minValue!1443 () V!1533)

(declare-fun getCurrentListMap!186 (array!1795 array!1793 (_ BitVec 32) (_ BitVec 32) V!1533 V!1533 (_ BitVec 32) Int) ListLongMap!681)

(assert (=> b!29331 (= lt!11205 (getCurrentListMap!186 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29332 () Bool)

(declare-fun res!17577 () Bool)

(assert (=> b!29332 (=> (not res!17577) (not e!18943))))

(assert (=> b!29332 (= res!17577 (and (= (size!951 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!952 _keys!1833) (size!951 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29333 () Bool)

(declare-fun e!18939 () Bool)

(declare-fun e!18944 () Bool)

(declare-fun mapRes!1450 () Bool)

(assert (=> b!29333 (= e!18939 (and e!18944 mapRes!1450))))

(declare-fun condMapEmpty!1450 () Bool)

(declare-fun mapDefault!1450 () ValueCell!441)

(assert (=> b!29333 (= condMapEmpty!1450 (= (arr!850 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!441)) mapDefault!1450)))))

(declare-fun b!29334 () Bool)

(declare-fun res!17581 () Bool)

(assert (=> b!29334 (=> (not res!17581) (not e!18943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1795 (_ BitVec 32)) Bool)

(assert (=> b!29334 (= res!17581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17580 () Bool)

(assert (=> start!4022 (=> (not res!17580) (not e!18943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4022 (= res!17580 (validMask!0 mask!2294))))

(assert (=> start!4022 e!18943))

(assert (=> start!4022 true))

(assert (=> start!4022 tp!4201))

(declare-fun array_inv!587 (array!1793) Bool)

(assert (=> start!4022 (and (array_inv!587 _values!1501) e!18939)))

(declare-fun array_inv!588 (array!1795) Bool)

(assert (=> start!4022 (array_inv!588 _keys!1833)))

(declare-fun tp_is_empty!1281 () Bool)

(assert (=> start!4022 tp_is_empty!1281))

(declare-fun b!29335 () Bool)

(assert (=> b!29335 (= e!18941 (not true))))

(declare-fun lt!11209 () (_ BitVec 32))

(assert (=> b!29335 (arrayForallSeekEntryOrOpenFound!0 lt!11209 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!673 0))(
  ( (Unit!674) )
))
(declare-fun lt!11207 () Unit!673)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!673)

(assert (=> b!29335 (= lt!11207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11209))))

(declare-datatypes ((SeekEntryResult!83 0))(
  ( (MissingZero!83 (index!2454 (_ BitVec 32))) (Found!83 (index!2455 (_ BitVec 32))) (Intermediate!83 (undefined!895 Bool) (index!2456 (_ BitVec 32)) (x!6409 (_ BitVec 32))) (Undefined!83) (MissingVacant!83 (index!2457 (_ BitVec 32))) )
))
(declare-fun lt!11206 () SeekEntryResult!83)

(get-info :version)

(assert (=> b!29335 (and ((_ is Found!83) lt!11206) (= (index!2455 lt!11206) lt!11209))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1795 (_ BitVec 32)) SeekEntryResult!83)

(assert (=> b!29335 (= lt!11206 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11208 () Unit!673)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1795 (_ BitVec 32)) Unit!673)

(assert (=> b!29335 (= lt!11208 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11209 _keys!1833 mask!2294))))

(assert (=> b!29335 (contains!296 lt!11205 (select (arr!851 _keys!1833) lt!11209))))

(declare-fun lt!11210 () Unit!673)

(declare-fun lemmaValidKeyInArrayIsInListMap!30 (array!1795 array!1793 (_ BitVec 32) (_ BitVec 32) V!1533 V!1533 (_ BitVec 32) Int) Unit!673)

(assert (=> b!29335 (= lt!11210 (lemmaValidKeyInArrayIsInListMap!30 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11209 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1795 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29335 (= lt!11209 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29336 () Bool)

(declare-fun res!17583 () Bool)

(assert (=> b!29336 (=> (not res!17583) (not e!18941))))

(declare-fun arrayContainsKey!0 (array!1795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29336 (= res!17583 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29337 () Bool)

(declare-fun res!17579 () Bool)

(assert (=> b!29337 (=> (not res!17579) (not e!18943))))

(declare-datatypes ((List!705 0))(
  ( (Nil!702) (Cons!701 (h!1268 (_ BitVec 64)) (t!3398 List!705)) )
))
(declare-fun arrayNoDuplicates!0 (array!1795 (_ BitVec 32) List!705) Bool)

(assert (=> b!29337 (= res!17579 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!702))))

(declare-fun b!29338 () Bool)

(declare-fun res!17582 () Bool)

(assert (=> b!29338 (=> (not res!17582) (not e!18943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29338 (= res!17582 (validKeyInArray!0 k0!1304))))

(declare-fun b!29339 () Bool)

(declare-fun e!18942 () Bool)

(assert (=> b!29339 (= e!18942 tp_is_empty!1281)))

(declare-fun mapNonEmpty!1450 () Bool)

(declare-fun tp!4200 () Bool)

(assert (=> mapNonEmpty!1450 (= mapRes!1450 (and tp!4200 e!18942))))

(declare-fun mapRest!1450 () (Array (_ BitVec 32) ValueCell!441))

(declare-fun mapKey!1450 () (_ BitVec 32))

(declare-fun mapValue!1450 () ValueCell!441)

(assert (=> mapNonEmpty!1450 (= (arr!850 _values!1501) (store mapRest!1450 mapKey!1450 mapValue!1450))))

(declare-fun b!29340 () Bool)

(assert (=> b!29340 (= e!18944 tp_is_empty!1281)))

(declare-fun mapIsEmpty!1450 () Bool)

(assert (=> mapIsEmpty!1450 mapRes!1450))

(assert (= (and start!4022 res!17580) b!29332))

(assert (= (and b!29332 res!17577) b!29334))

(assert (= (and b!29334 res!17581) b!29337))

(assert (= (and b!29337 res!17579) b!29338))

(assert (= (and b!29338 res!17582) b!29331))

(assert (= (and b!29331 res!17578) b!29336))

(assert (= (and b!29336 res!17583) b!29335))

(assert (= (and b!29333 condMapEmpty!1450) mapIsEmpty!1450))

(assert (= (and b!29333 (not condMapEmpty!1450)) mapNonEmpty!1450))

(assert (= (and mapNonEmpty!1450 ((_ is ValueCellFull!441) mapValue!1450)) b!29339))

(assert (= (and b!29333 ((_ is ValueCellFull!441) mapDefault!1450)) b!29340))

(assert (= start!4022 b!29333))

(declare-fun m!23533 () Bool)

(assert (=> b!29334 m!23533))

(declare-fun m!23535 () Bool)

(assert (=> b!29338 m!23535))

(declare-fun m!23537 () Bool)

(assert (=> start!4022 m!23537))

(declare-fun m!23539 () Bool)

(assert (=> start!4022 m!23539))

(declare-fun m!23541 () Bool)

(assert (=> start!4022 m!23541))

(declare-fun m!23543 () Bool)

(assert (=> b!29336 m!23543))

(declare-fun m!23545 () Bool)

(assert (=> b!29337 m!23545))

(declare-fun m!23547 () Bool)

(assert (=> mapNonEmpty!1450 m!23547))

(declare-fun m!23549 () Bool)

(assert (=> b!29331 m!23549))

(declare-fun m!23551 () Bool)

(assert (=> b!29331 m!23551))

(declare-fun m!23553 () Bool)

(assert (=> b!29335 m!23553))

(declare-fun m!23555 () Bool)

(assert (=> b!29335 m!23555))

(declare-fun m!23557 () Bool)

(assert (=> b!29335 m!23557))

(declare-fun m!23559 () Bool)

(assert (=> b!29335 m!23559))

(declare-fun m!23561 () Bool)

(assert (=> b!29335 m!23561))

(assert (=> b!29335 m!23555))

(declare-fun m!23563 () Bool)

(assert (=> b!29335 m!23563))

(declare-fun m!23565 () Bool)

(assert (=> b!29335 m!23565))

(declare-fun m!23567 () Bool)

(assert (=> b!29335 m!23567))

(check-sat (not start!4022) (not b!29338) (not b!29335) (not b!29336) (not mapNonEmpty!1450) (not b!29337) b_and!1737 (not b!29334) (not b_next!927) tp_is_empty!1281 (not b!29331))
(check-sat b_and!1737 (not b_next!927))
