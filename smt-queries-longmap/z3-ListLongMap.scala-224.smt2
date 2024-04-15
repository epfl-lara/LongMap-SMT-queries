; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4016 () Bool)

(assert start!4016)

(declare-fun b_free!931 () Bool)

(declare-fun b_next!931 () Bool)

(assert (=> start!4016 (= b_free!931 (not b_next!931))))

(declare-fun tp!4213 () Bool)

(declare-fun b_and!1735 () Bool)

(assert (=> start!4016 (= tp!4213 b_and!1735)))

(declare-fun b!29337 () Bool)

(declare-fun res!17589 () Bool)

(declare-fun e!18932 () Bool)

(assert (=> b!29337 (=> (not res!17589) (not e!18932))))

(declare-datatypes ((array!1777 0))(
  ( (array!1778 (arr!842 (Array (_ BitVec 32) (_ BitVec 64))) (size!943 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1777)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29337 (= res!17589 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29338 () Bool)

(declare-fun e!18937 () Bool)

(declare-fun tp_is_empty!1285 () Bool)

(assert (=> b!29338 (= e!18937 tp_is_empty!1285)))

(declare-fun b!29339 () Bool)

(assert (=> b!29339 (= e!18932 (not true))))

(declare-fun lt!11239 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1777 (_ BitVec 32)) Bool)

(assert (=> b!29339 (arrayForallSeekEntryOrOpenFound!0 lt!11239 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!686 0))(
  ( (Unit!687) )
))
(declare-fun lt!11241 () Unit!686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!686)

(assert (=> b!29339 (= lt!11241 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11239))))

(declare-datatypes ((SeekEntryResult!88 0))(
  ( (MissingZero!88 (index!2474 (_ BitVec 32))) (Found!88 (index!2475 (_ BitVec 32))) (Intermediate!88 (undefined!900 Bool) (index!2476 (_ BitVec 32)) (x!6422 (_ BitVec 32))) (Undefined!88) (MissingVacant!88 (index!2477 (_ BitVec 32))) )
))
(declare-fun lt!11240 () SeekEntryResult!88)

(get-info :version)

(assert (=> b!29339 (and ((_ is Found!88) lt!11240) (= (index!2475 lt!11240) lt!11239))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1777 (_ BitVec 32)) SeekEntryResult!88)

(assert (=> b!29339 (= lt!11240 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11238 () Unit!686)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1777 (_ BitVec 32)) Unit!686)

(assert (=> b!29339 (= lt!11238 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11239 _keys!1833 mask!2294))))

(declare-datatypes ((V!1539 0))(
  ( (V!1540 (val!669 Int)) )
))
(declare-datatypes ((tuple2!1118 0))(
  ( (tuple2!1119 (_1!570 (_ BitVec 64)) (_2!570 V!1539)) )
))
(declare-datatypes ((List!701 0))(
  ( (Nil!698) (Cons!697 (h!1264 tuple2!1118) (t!3387 List!701)) )
))
(declare-datatypes ((ListLongMap!683 0))(
  ( (ListLongMap!684 (toList!357 List!701)) )
))
(declare-fun lt!11242 () ListLongMap!683)

(declare-fun contains!298 (ListLongMap!683 (_ BitVec 64)) Bool)

(assert (=> b!29339 (contains!298 lt!11242 (select (arr!842 _keys!1833) lt!11239))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!443 0))(
  ( (ValueCellFull!443 (v!1757 V!1539)) (EmptyCell!443) )
))
(declare-datatypes ((array!1779 0))(
  ( (array!1780 (arr!843 (Array (_ BitVec 32) ValueCell!443)) (size!944 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1779)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11237 () Unit!686)

(declare-fun zeroValue!1443 () V!1539)

(declare-fun minValue!1443 () V!1539)

(declare-fun lemmaValidKeyInArrayIsInListMap!33 (array!1777 array!1779 (_ BitVec 32) (_ BitVec 32) V!1539 V!1539 (_ BitVec 32) Int) Unit!686)

(assert (=> b!29339 (= lt!11237 (lemmaValidKeyInArrayIsInListMap!33 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11239 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1777 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29339 (= lt!11239 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29340 () Bool)

(declare-fun res!17591 () Bool)

(declare-fun e!18933 () Bool)

(assert (=> b!29340 (=> (not res!17591) (not e!18933))))

(declare-datatypes ((List!702 0))(
  ( (Nil!699) (Cons!698 (h!1265 (_ BitVec 64)) (t!3388 List!702)) )
))
(declare-fun arrayNoDuplicates!0 (array!1777 (_ BitVec 32) List!702) Bool)

(assert (=> b!29340 (= res!17591 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!699))))

(declare-fun b!29341 () Bool)

(declare-fun e!18936 () Bool)

(declare-fun mapRes!1456 () Bool)

(assert (=> b!29341 (= e!18936 (and e!18937 mapRes!1456))))

(declare-fun condMapEmpty!1456 () Bool)

(declare-fun mapDefault!1456 () ValueCell!443)

(assert (=> b!29341 (= condMapEmpty!1456 (= (arr!843 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!443)) mapDefault!1456)))))

(declare-fun b!29342 () Bool)

(declare-fun res!17593 () Bool)

(assert (=> b!29342 (=> (not res!17593) (not e!18933))))

(assert (=> b!29342 (= res!17593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1456 () Bool)

(assert (=> mapIsEmpty!1456 mapRes!1456))

(declare-fun b!29343 () Bool)

(declare-fun res!17590 () Bool)

(assert (=> b!29343 (=> (not res!17590) (not e!18933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29343 (= res!17590 (validKeyInArray!0 k0!1304))))

(declare-fun b!29344 () Bool)

(declare-fun res!17587 () Bool)

(assert (=> b!29344 (=> (not res!17587) (not e!18933))))

(assert (=> b!29344 (= res!17587 (and (= (size!944 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!943 _keys!1833) (size!944 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29345 () Bool)

(declare-fun e!18934 () Bool)

(assert (=> b!29345 (= e!18934 tp_is_empty!1285)))

(declare-fun b!29346 () Bool)

(assert (=> b!29346 (= e!18933 e!18932)))

(declare-fun res!17588 () Bool)

(assert (=> b!29346 (=> (not res!17588) (not e!18932))))

(assert (=> b!29346 (= res!17588 (not (contains!298 lt!11242 k0!1304)))))

(declare-fun getCurrentListMap!184 (array!1777 array!1779 (_ BitVec 32) (_ BitVec 32) V!1539 V!1539 (_ BitVec 32) Int) ListLongMap!683)

(assert (=> b!29346 (= lt!11242 (getCurrentListMap!184 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!17592 () Bool)

(assert (=> start!4016 (=> (not res!17592) (not e!18933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4016 (= res!17592 (validMask!0 mask!2294))))

(assert (=> start!4016 e!18933))

(assert (=> start!4016 true))

(assert (=> start!4016 tp!4213))

(declare-fun array_inv!587 (array!1779) Bool)

(assert (=> start!4016 (and (array_inv!587 _values!1501) e!18936)))

(declare-fun array_inv!588 (array!1777) Bool)

(assert (=> start!4016 (array_inv!588 _keys!1833)))

(assert (=> start!4016 tp_is_empty!1285))

(declare-fun mapNonEmpty!1456 () Bool)

(declare-fun tp!4212 () Bool)

(assert (=> mapNonEmpty!1456 (= mapRes!1456 (and tp!4212 e!18934))))

(declare-fun mapRest!1456 () (Array (_ BitVec 32) ValueCell!443))

(declare-fun mapKey!1456 () (_ BitVec 32))

(declare-fun mapValue!1456 () ValueCell!443)

(assert (=> mapNonEmpty!1456 (= (arr!843 _values!1501) (store mapRest!1456 mapKey!1456 mapValue!1456))))

(assert (= (and start!4016 res!17592) b!29344))

(assert (= (and b!29344 res!17587) b!29342))

(assert (= (and b!29342 res!17593) b!29340))

(assert (= (and b!29340 res!17591) b!29343))

(assert (= (and b!29343 res!17590) b!29346))

(assert (= (and b!29346 res!17588) b!29337))

(assert (= (and b!29337 res!17589) b!29339))

(assert (= (and b!29341 condMapEmpty!1456) mapIsEmpty!1456))

(assert (= (and b!29341 (not condMapEmpty!1456)) mapNonEmpty!1456))

(assert (= (and mapNonEmpty!1456 ((_ is ValueCellFull!443) mapValue!1456)) b!29345))

(assert (= (and b!29341 ((_ is ValueCellFull!443) mapDefault!1456)) b!29338))

(assert (= start!4016 b!29341))

(declare-fun m!23535 () Bool)

(assert (=> b!29339 m!23535))

(declare-fun m!23537 () Bool)

(assert (=> b!29339 m!23537))

(declare-fun m!23539 () Bool)

(assert (=> b!29339 m!23539))

(declare-fun m!23541 () Bool)

(assert (=> b!29339 m!23541))

(declare-fun m!23543 () Bool)

(assert (=> b!29339 m!23543))

(declare-fun m!23545 () Bool)

(assert (=> b!29339 m!23545))

(declare-fun m!23547 () Bool)

(assert (=> b!29339 m!23547))

(declare-fun m!23549 () Bool)

(assert (=> b!29339 m!23549))

(assert (=> b!29339 m!23535))

(declare-fun m!23551 () Bool)

(assert (=> b!29343 m!23551))

(declare-fun m!23553 () Bool)

(assert (=> b!29340 m!23553))

(declare-fun m!23555 () Bool)

(assert (=> mapNonEmpty!1456 m!23555))

(declare-fun m!23557 () Bool)

(assert (=> start!4016 m!23557))

(declare-fun m!23559 () Bool)

(assert (=> start!4016 m!23559))

(declare-fun m!23561 () Bool)

(assert (=> start!4016 m!23561))

(declare-fun m!23563 () Bool)

(assert (=> b!29342 m!23563))

(declare-fun m!23565 () Bool)

(assert (=> b!29346 m!23565))

(declare-fun m!23567 () Bool)

(assert (=> b!29346 m!23567))

(declare-fun m!23569 () Bool)

(assert (=> b!29337 m!23569))

(check-sat (not b!29337) (not start!4016) b_and!1735 (not b!29346) tp_is_empty!1285 (not b_next!931) (not b!29340) (not b!29339) (not b!29342) (not mapNonEmpty!1456) (not b!29343))
(check-sat b_and!1735 (not b_next!931))
