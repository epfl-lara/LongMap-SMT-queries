; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4028 () Bool)

(assert start!4028)

(declare-fun b_free!937 () Bool)

(declare-fun b_next!937 () Bool)

(assert (=> start!4028 (= b_free!937 (not b_next!937))))

(declare-fun tp!4231 () Bool)

(declare-fun b_and!1737 () Bool)

(assert (=> start!4028 (= tp!4231 b_and!1737)))

(declare-fun mapIsEmpty!1465 () Bool)

(declare-fun mapRes!1465 () Bool)

(assert (=> mapIsEmpty!1465 mapRes!1465))

(declare-fun b!29409 () Bool)

(declare-fun res!17646 () Bool)

(declare-fun e!18979 () Bool)

(assert (=> b!29409 (=> (not res!17646) (not e!18979))))

(declare-datatypes ((array!1795 0))(
  ( (array!1796 (arr!851 (Array (_ BitVec 32) (_ BitVec 64))) (size!952 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1795)

(declare-datatypes ((List!702 0))(
  ( (Nil!699) (Cons!698 (h!1265 (_ BitVec 64)) (t!3389 List!702)) )
))
(declare-fun arrayNoDuplicates!0 (array!1795 (_ BitVec 32) List!702) Bool)

(assert (=> b!29409 (= res!17646 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!699))))

(declare-fun b!29410 () Bool)

(declare-fun e!18977 () Bool)

(assert (=> b!29410 (= e!18979 e!18977)))

(declare-fun res!17647 () Bool)

(assert (=> b!29410 (=> (not res!17647) (not e!18977))))

(declare-datatypes ((V!1547 0))(
  ( (V!1548 (val!672 Int)) )
))
(declare-datatypes ((tuple2!1112 0))(
  ( (tuple2!1113 (_1!567 (_ BitVec 64)) (_2!567 V!1547)) )
))
(declare-datatypes ((List!703 0))(
  ( (Nil!700) (Cons!699 (h!1266 tuple2!1112) (t!3390 List!703)) )
))
(declare-datatypes ((ListLongMap!683 0))(
  ( (ListLongMap!684 (toList!357 List!703)) )
))
(declare-fun lt!11256 () ListLongMap!683)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!299 (ListLongMap!683 (_ BitVec 64)) Bool)

(assert (=> b!29410 (= res!17647 (not (contains!299 lt!11256 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!446 0))(
  ( (ValueCellFull!446 (v!1761 V!1547)) (EmptyCell!446) )
))
(declare-datatypes ((array!1797 0))(
  ( (array!1798 (arr!852 (Array (_ BitVec 32) ValueCell!446)) (size!953 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1797)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1547)

(declare-fun minValue!1443 () V!1547)

(declare-fun getCurrentListMap!182 (array!1795 array!1797 (_ BitVec 32) (_ BitVec 32) V!1547 V!1547 (_ BitVec 32) Int) ListLongMap!683)

(assert (=> b!29410 (= lt!11256 (getCurrentListMap!182 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29411 () Bool)

(declare-fun res!17648 () Bool)

(assert (=> b!29411 (=> (not res!17648) (not e!18979))))

(assert (=> b!29411 (= res!17648 (and (= (size!953 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!952 _keys!1833) (size!953 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29413 () Bool)

(declare-fun res!17642 () Bool)

(assert (=> b!29413 (=> (not res!17642) (not e!18977))))

(declare-fun arrayContainsKey!0 (array!1795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29413 (= res!17642 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29414 () Bool)

(declare-fun e!18980 () Bool)

(declare-fun tp_is_empty!1291 () Bool)

(assert (=> b!29414 (= e!18980 tp_is_empty!1291)))

(declare-fun b!29415 () Bool)

(declare-fun res!17645 () Bool)

(assert (=> b!29415 (=> (not res!17645) (not e!18979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29415 (= res!17645 (validKeyInArray!0 k0!1304))))

(declare-fun b!29416 () Bool)

(assert (=> b!29416 (= e!18977 (not true))))

(declare-fun lt!11253 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1795 (_ BitVec 32)) Bool)

(assert (=> b!29416 (arrayForallSeekEntryOrOpenFound!0 lt!11253 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!701 0))(
  ( (Unit!702) )
))
(declare-fun lt!11254 () Unit!701)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!701)

(assert (=> b!29416 (= lt!11254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11253))))

(declare-datatypes ((SeekEntryResult!89 0))(
  ( (MissingZero!89 (index!2478 (_ BitVec 32))) (Found!89 (index!2479 (_ BitVec 32))) (Intermediate!89 (undefined!901 Bool) (index!2480 (_ BitVec 32)) (x!6431 (_ BitVec 32))) (Undefined!89) (MissingVacant!89 (index!2481 (_ BitVec 32))) )
))
(declare-fun lt!11252 () SeekEntryResult!89)

(get-info :version)

(assert (=> b!29416 (and ((_ is Found!89) lt!11252) (= (index!2479 lt!11252) lt!11253))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1795 (_ BitVec 32)) SeekEntryResult!89)

(assert (=> b!29416 (= lt!11252 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11251 () Unit!701)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1795 (_ BitVec 32)) Unit!701)

(assert (=> b!29416 (= lt!11251 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11253 _keys!1833 mask!2294))))

(assert (=> b!29416 (contains!299 lt!11256 (select (arr!851 _keys!1833) lt!11253))))

(declare-fun lt!11255 () Unit!701)

(declare-fun lemmaValidKeyInArrayIsInListMap!40 (array!1795 array!1797 (_ BitVec 32) (_ BitVec 32) V!1547 V!1547 (_ BitVec 32) Int) Unit!701)

(assert (=> b!29416 (= lt!11255 (lemmaValidKeyInArrayIsInListMap!40 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11253 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1795 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29416 (= lt!11253 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1465 () Bool)

(declare-fun tp!4230 () Bool)

(declare-fun e!18978 () Bool)

(assert (=> mapNonEmpty!1465 (= mapRes!1465 (and tp!4230 e!18978))))

(declare-fun mapKey!1465 () (_ BitVec 32))

(declare-fun mapValue!1465 () ValueCell!446)

(declare-fun mapRest!1465 () (Array (_ BitVec 32) ValueCell!446))

(assert (=> mapNonEmpty!1465 (= (arr!852 _values!1501) (store mapRest!1465 mapKey!1465 mapValue!1465))))

(declare-fun b!29417 () Bool)

(declare-fun res!17644 () Bool)

(assert (=> b!29417 (=> (not res!17644) (not e!18979))))

(assert (=> b!29417 (= res!17644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29418 () Bool)

(declare-fun e!18982 () Bool)

(assert (=> b!29418 (= e!18982 (and e!18980 mapRes!1465))))

(declare-fun condMapEmpty!1465 () Bool)

(declare-fun mapDefault!1465 () ValueCell!446)

(assert (=> b!29418 (= condMapEmpty!1465 (= (arr!852 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!446)) mapDefault!1465)))))

(declare-fun res!17643 () Bool)

(assert (=> start!4028 (=> (not res!17643) (not e!18979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4028 (= res!17643 (validMask!0 mask!2294))))

(assert (=> start!4028 e!18979))

(assert (=> start!4028 true))

(assert (=> start!4028 tp!4231))

(declare-fun array_inv!589 (array!1797) Bool)

(assert (=> start!4028 (and (array_inv!589 _values!1501) e!18982)))

(declare-fun array_inv!590 (array!1795) Bool)

(assert (=> start!4028 (array_inv!590 _keys!1833)))

(assert (=> start!4028 tp_is_empty!1291))

(declare-fun b!29412 () Bool)

(assert (=> b!29412 (= e!18978 tp_is_empty!1291)))

(assert (= (and start!4028 res!17643) b!29411))

(assert (= (and b!29411 res!17648) b!29417))

(assert (= (and b!29417 res!17644) b!29409))

(assert (= (and b!29409 res!17646) b!29415))

(assert (= (and b!29415 res!17645) b!29410))

(assert (= (and b!29410 res!17647) b!29413))

(assert (= (and b!29413 res!17642) b!29416))

(assert (= (and b!29418 condMapEmpty!1465) mapIsEmpty!1465))

(assert (= (and b!29418 (not condMapEmpty!1465)) mapNonEmpty!1465))

(assert (= (and mapNonEmpty!1465 ((_ is ValueCellFull!446) mapValue!1465)) b!29412))

(assert (= (and b!29418 ((_ is ValueCellFull!446) mapDefault!1465)) b!29414))

(assert (= start!4028 b!29418))

(declare-fun m!23561 () Bool)

(assert (=> b!29413 m!23561))

(declare-fun m!23563 () Bool)

(assert (=> b!29417 m!23563))

(declare-fun m!23565 () Bool)

(assert (=> start!4028 m!23565))

(declare-fun m!23567 () Bool)

(assert (=> start!4028 m!23567))

(declare-fun m!23569 () Bool)

(assert (=> start!4028 m!23569))

(declare-fun m!23571 () Bool)

(assert (=> b!29416 m!23571))

(declare-fun m!23573 () Bool)

(assert (=> b!29416 m!23573))

(declare-fun m!23575 () Bool)

(assert (=> b!29416 m!23575))

(declare-fun m!23577 () Bool)

(assert (=> b!29416 m!23577))

(declare-fun m!23579 () Bool)

(assert (=> b!29416 m!23579))

(declare-fun m!23581 () Bool)

(assert (=> b!29416 m!23581))

(declare-fun m!23583 () Bool)

(assert (=> b!29416 m!23583))

(assert (=> b!29416 m!23571))

(declare-fun m!23585 () Bool)

(assert (=> b!29416 m!23585))

(declare-fun m!23587 () Bool)

(assert (=> b!29410 m!23587))

(declare-fun m!23589 () Bool)

(assert (=> b!29410 m!23589))

(declare-fun m!23591 () Bool)

(assert (=> b!29409 m!23591))

(declare-fun m!23593 () Bool)

(assert (=> b!29415 m!23593))

(declare-fun m!23595 () Bool)

(assert (=> mapNonEmpty!1465 m!23595))

(check-sat tp_is_empty!1291 b_and!1737 (not b!29416) (not b!29410) (not b!29417) (not b_next!937) (not b!29409) (not b!29415) (not b!29413) (not mapNonEmpty!1465) (not start!4028))
(check-sat b_and!1737 (not b_next!937))
