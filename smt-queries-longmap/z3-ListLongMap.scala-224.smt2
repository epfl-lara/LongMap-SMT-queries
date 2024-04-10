; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4028 () Bool)

(assert start!4028)

(declare-fun b_free!933 () Bool)

(declare-fun b_next!933 () Bool)

(assert (=> start!4028 (= b_free!933 (not b_next!933))))

(declare-fun tp!4218 () Bool)

(declare-fun b_and!1743 () Bool)

(assert (=> start!4028 (= tp!4218 b_and!1743)))

(declare-fun b!29421 () Bool)

(declare-fun e!18994 () Bool)

(declare-fun e!18995 () Bool)

(declare-fun mapRes!1459 () Bool)

(assert (=> b!29421 (= e!18994 (and e!18995 mapRes!1459))))

(declare-fun condMapEmpty!1459 () Bool)

(declare-datatypes ((V!1541 0))(
  ( (V!1542 (val!670 Int)) )
))
(declare-datatypes ((ValueCell!444 0))(
  ( (ValueCellFull!444 (v!1759 V!1541)) (EmptyCell!444) )
))
(declare-datatypes ((array!1805 0))(
  ( (array!1806 (arr!856 (Array (_ BitVec 32) ValueCell!444)) (size!957 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1805)

(declare-fun mapDefault!1459 () ValueCell!444)

(assert (=> b!29421 (= condMapEmpty!1459 (= (arr!856 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!444)) mapDefault!1459)))))

(declare-fun b!29422 () Bool)

(declare-fun res!17643 () Bool)

(declare-fun e!18997 () Bool)

(assert (=> b!29422 (=> (not res!17643) (not e!18997))))

(declare-datatypes ((array!1807 0))(
  ( (array!1808 (arr!857 (Array (_ BitVec 32) (_ BitVec 64))) (size!958 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1807)

(declare-datatypes ((List!709 0))(
  ( (Nil!706) (Cons!705 (h!1272 (_ BitVec 64)) (t!3402 List!709)) )
))
(declare-fun arrayNoDuplicates!0 (array!1807 (_ BitVec 32) List!709) Bool)

(assert (=> b!29422 (= res!17643 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!706))))

(declare-fun b!29423 () Bool)

(declare-fun res!17641 () Bool)

(declare-fun e!18996 () Bool)

(assert (=> b!29423 (=> (not res!17641) (not e!18996))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29423 (= res!17641 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29424 () Bool)

(declare-fun res!17645 () Bool)

(assert (=> b!29424 (=> (not res!17645) (not e!18997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29424 (= res!17645 (validKeyInArray!0 k0!1304))))

(declare-fun b!29425 () Bool)

(declare-fun res!17642 () Bool)

(assert (=> b!29425 (=> (not res!17642) (not e!18997))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29425 (= res!17642 (and (= (size!957 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!958 _keys!1833) (size!957 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29426 () Bool)

(declare-fun tp_is_empty!1287 () Bool)

(assert (=> b!29426 (= e!18995 tp_is_empty!1287)))

(declare-fun res!17644 () Bool)

(assert (=> start!4028 (=> (not res!17644) (not e!18997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4028 (= res!17644 (validMask!0 mask!2294))))

(assert (=> start!4028 e!18997))

(assert (=> start!4028 true))

(assert (=> start!4028 tp!4218))

(declare-fun array_inv!591 (array!1805) Bool)

(assert (=> start!4028 (and (array_inv!591 _values!1501) e!18994)))

(declare-fun array_inv!592 (array!1807) Bool)

(assert (=> start!4028 (array_inv!592 _keys!1833)))

(assert (=> start!4028 tp_is_empty!1287))

(declare-fun b!29427 () Bool)

(assert (=> b!29427 (= e!18996 (not true))))

(declare-fun lt!11262 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1807 (_ BitVec 32)) Bool)

(assert (=> b!29427 (arrayForallSeekEntryOrOpenFound!0 lt!11262 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!677 0))(
  ( (Unit!678) )
))
(declare-fun lt!11264 () Unit!677)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!677)

(assert (=> b!29427 (= lt!11264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11262))))

(declare-datatypes ((SeekEntryResult!85 0))(
  ( (MissingZero!85 (index!2462 (_ BitVec 32))) (Found!85 (index!2463 (_ BitVec 32))) (Intermediate!85 (undefined!897 Bool) (index!2464 (_ BitVec 32)) (x!6419 (_ BitVec 32))) (Undefined!85) (MissingVacant!85 (index!2465 (_ BitVec 32))) )
))
(declare-fun lt!11263 () SeekEntryResult!85)

(get-info :version)

(assert (=> b!29427 (and ((_ is Found!85) lt!11263) (= (index!2463 lt!11263) lt!11262))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1807 (_ BitVec 32)) SeekEntryResult!85)

(assert (=> b!29427 (= lt!11263 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11260 () Unit!677)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1807 (_ BitVec 32)) Unit!677)

(assert (=> b!29427 (= lt!11260 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11262 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1108 0))(
  ( (tuple2!1109 (_1!565 (_ BitVec 64)) (_2!565 V!1541)) )
))
(declare-datatypes ((List!710 0))(
  ( (Nil!707) (Cons!706 (h!1273 tuple2!1108) (t!3403 List!710)) )
))
(declare-datatypes ((ListLongMap!685 0))(
  ( (ListLongMap!686 (toList!358 List!710)) )
))
(declare-fun lt!11261 () ListLongMap!685)

(declare-fun contains!298 (ListLongMap!685 (_ BitVec 64)) Bool)

(assert (=> b!29427 (contains!298 lt!11261 (select (arr!857 _keys!1833) lt!11262))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11259 () Unit!677)

(declare-fun zeroValue!1443 () V!1541)

(declare-fun minValue!1443 () V!1541)

(declare-fun lemmaValidKeyInArrayIsInListMap!32 (array!1807 array!1805 (_ BitVec 32) (_ BitVec 32) V!1541 V!1541 (_ BitVec 32) Int) Unit!677)

(assert (=> b!29427 (= lt!11259 (lemmaValidKeyInArrayIsInListMap!32 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11262 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1807 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29427 (= lt!11262 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29428 () Bool)

(declare-fun res!17646 () Bool)

(assert (=> b!29428 (=> (not res!17646) (not e!18997))))

(assert (=> b!29428 (= res!17646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29429 () Bool)

(assert (=> b!29429 (= e!18997 e!18996)))

(declare-fun res!17640 () Bool)

(assert (=> b!29429 (=> (not res!17640) (not e!18996))))

(assert (=> b!29429 (= res!17640 (not (contains!298 lt!11261 k0!1304)))))

(declare-fun getCurrentListMap!188 (array!1807 array!1805 (_ BitVec 32) (_ BitVec 32) V!1541 V!1541 (_ BitVec 32) Int) ListLongMap!685)

(assert (=> b!29429 (= lt!11261 (getCurrentListMap!188 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1459 () Bool)

(declare-fun tp!4219 () Bool)

(declare-fun e!18998 () Bool)

(assert (=> mapNonEmpty!1459 (= mapRes!1459 (and tp!4219 e!18998))))

(declare-fun mapRest!1459 () (Array (_ BitVec 32) ValueCell!444))

(declare-fun mapKey!1459 () (_ BitVec 32))

(declare-fun mapValue!1459 () ValueCell!444)

(assert (=> mapNonEmpty!1459 (= (arr!856 _values!1501) (store mapRest!1459 mapKey!1459 mapValue!1459))))

(declare-fun mapIsEmpty!1459 () Bool)

(assert (=> mapIsEmpty!1459 mapRes!1459))

(declare-fun b!29430 () Bool)

(assert (=> b!29430 (= e!18998 tp_is_empty!1287)))

(assert (= (and start!4028 res!17644) b!29425))

(assert (= (and b!29425 res!17642) b!29428))

(assert (= (and b!29428 res!17646) b!29422))

(assert (= (and b!29422 res!17643) b!29424))

(assert (= (and b!29424 res!17645) b!29429))

(assert (= (and b!29429 res!17640) b!29423))

(assert (= (and b!29423 res!17641) b!29427))

(assert (= (and b!29421 condMapEmpty!1459) mapIsEmpty!1459))

(assert (= (and b!29421 (not condMapEmpty!1459)) mapNonEmpty!1459))

(assert (= (and mapNonEmpty!1459 ((_ is ValueCellFull!444) mapValue!1459)) b!29430))

(assert (= (and b!29421 ((_ is ValueCellFull!444) mapDefault!1459)) b!29426))

(assert (= start!4028 b!29421))

(declare-fun m!23641 () Bool)

(assert (=> b!29428 m!23641))

(declare-fun m!23643 () Bool)

(assert (=> b!29424 m!23643))

(declare-fun m!23645 () Bool)

(assert (=> b!29427 m!23645))

(declare-fun m!23647 () Bool)

(assert (=> b!29427 m!23647))

(declare-fun m!23649 () Bool)

(assert (=> b!29427 m!23649))

(declare-fun m!23651 () Bool)

(assert (=> b!29427 m!23651))

(declare-fun m!23653 () Bool)

(assert (=> b!29427 m!23653))

(declare-fun m!23655 () Bool)

(assert (=> b!29427 m!23655))

(declare-fun m!23657 () Bool)

(assert (=> b!29427 m!23657))

(assert (=> b!29427 m!23653))

(declare-fun m!23659 () Bool)

(assert (=> b!29427 m!23659))

(declare-fun m!23661 () Bool)

(assert (=> b!29422 m!23661))

(declare-fun m!23663 () Bool)

(assert (=> start!4028 m!23663))

(declare-fun m!23665 () Bool)

(assert (=> start!4028 m!23665))

(declare-fun m!23667 () Bool)

(assert (=> start!4028 m!23667))

(declare-fun m!23669 () Bool)

(assert (=> b!29429 m!23669))

(declare-fun m!23671 () Bool)

(assert (=> b!29429 m!23671))

(declare-fun m!23673 () Bool)

(assert (=> mapNonEmpty!1459 m!23673))

(declare-fun m!23675 () Bool)

(assert (=> b!29423 m!23675))

(check-sat b_and!1743 (not b!29422) (not mapNonEmpty!1459) (not b!29423) (not start!4028) (not b!29424) (not b_next!933) (not b!29429) (not b!29428) tp_is_empty!1287 (not b!29427))
(check-sat b_and!1743 (not b_next!933))
