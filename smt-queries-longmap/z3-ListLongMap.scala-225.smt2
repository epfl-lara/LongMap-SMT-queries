; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4022 () Bool)

(assert start!4022)

(declare-fun b_free!937 () Bool)

(declare-fun b_next!937 () Bool)

(assert (=> start!4022 (= b_free!937 (not b_next!937))))

(declare-fun tp!4231 () Bool)

(declare-fun b_and!1741 () Bool)

(assert (=> start!4022 (= tp!4231 b_and!1741)))

(declare-fun b!29427 () Bool)

(declare-fun e!18986 () Bool)

(declare-fun e!18989 () Bool)

(declare-fun mapRes!1465 () Bool)

(assert (=> b!29427 (= e!18986 (and e!18989 mapRes!1465))))

(declare-fun condMapEmpty!1465 () Bool)

(declare-datatypes ((V!1547 0))(
  ( (V!1548 (val!672 Int)) )
))
(declare-datatypes ((ValueCell!446 0))(
  ( (ValueCellFull!446 (v!1760 V!1547)) (EmptyCell!446) )
))
(declare-datatypes ((array!1789 0))(
  ( (array!1790 (arr!848 (Array (_ BitVec 32) ValueCell!446)) (size!949 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1789)

(declare-fun mapDefault!1465 () ValueCell!446)

(assert (=> b!29427 (= condMapEmpty!1465 (= (arr!848 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!446)) mapDefault!1465)))))

(declare-fun mapNonEmpty!1465 () Bool)

(declare-fun tp!4230 () Bool)

(declare-fun e!18988 () Bool)

(assert (=> mapNonEmpty!1465 (= mapRes!1465 (and tp!4230 e!18988))))

(declare-fun mapKey!1465 () (_ BitVec 32))

(declare-fun mapValue!1465 () ValueCell!446)

(declare-fun mapRest!1465 () (Array (_ BitVec 32) ValueCell!446))

(assert (=> mapNonEmpty!1465 (= (arr!848 _values!1501) (store mapRest!1465 mapKey!1465 mapValue!1465))))

(declare-fun b!29428 () Bool)

(declare-fun res!17651 () Bool)

(declare-fun e!18987 () Bool)

(assert (=> b!29428 (=> (not res!17651) (not e!18987))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29428 (= res!17651 (validKeyInArray!0 k0!1304))))

(declare-fun res!17655 () Bool)

(assert (=> start!4022 (=> (not res!17655) (not e!18987))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4022 (= res!17655 (validMask!0 mask!2294))))

(assert (=> start!4022 e!18987))

(assert (=> start!4022 true))

(assert (=> start!4022 tp!4231))

(declare-fun array_inv!591 (array!1789) Bool)

(assert (=> start!4022 (and (array_inv!591 _values!1501) e!18986)))

(declare-datatypes ((array!1791 0))(
  ( (array!1792 (arr!849 (Array (_ BitVec 32) (_ BitVec 64))) (size!950 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1791)

(declare-fun array_inv!592 (array!1791) Bool)

(assert (=> start!4022 (array_inv!592 _keys!1833)))

(declare-fun tp_is_empty!1291 () Bool)

(assert (=> start!4022 tp_is_empty!1291))

(declare-fun b!29429 () Bool)

(assert (=> b!29429 (= e!18989 tp_is_empty!1291)))

(declare-fun b!29430 () Bool)

(declare-fun res!17653 () Bool)

(assert (=> b!29430 (=> (not res!17653) (not e!18987))))

(declare-datatypes ((List!705 0))(
  ( (Nil!702) (Cons!701 (h!1268 (_ BitVec 64)) (t!3391 List!705)) )
))
(declare-fun arrayNoDuplicates!0 (array!1791 (_ BitVec 32) List!705) Bool)

(assert (=> b!29430 (= res!17653 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!702))))

(declare-fun b!29431 () Bool)

(declare-fun e!18990 () Bool)

(assert (=> b!29431 (= e!18990 (not true))))

(declare-fun lt!11293 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1791 (_ BitVec 32)) Bool)

(assert (=> b!29431 (arrayForallSeekEntryOrOpenFound!0 lt!11293 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!692 0))(
  ( (Unit!693) )
))
(declare-fun lt!11295 () Unit!692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!692)

(assert (=> b!29431 (= lt!11295 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11293))))

(declare-datatypes ((SeekEntryResult!91 0))(
  ( (MissingZero!91 (index!2486 (_ BitVec 32))) (Found!91 (index!2487 (_ BitVec 32))) (Intermediate!91 (undefined!903 Bool) (index!2488 (_ BitVec 32)) (x!6433 (_ BitVec 32))) (Undefined!91) (MissingVacant!91 (index!2489 (_ BitVec 32))) )
))
(declare-fun lt!11292 () SeekEntryResult!91)

(get-info :version)

(assert (=> b!29431 (and ((_ is Found!91) lt!11292) (= (index!2487 lt!11292) lt!11293))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1791 (_ BitVec 32)) SeekEntryResult!91)

(assert (=> b!29431 (= lt!11292 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!11294 () Unit!692)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1791 (_ BitVec 32)) Unit!692)

(assert (=> b!29431 (= lt!11294 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11293 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1124 0))(
  ( (tuple2!1125 (_1!573 (_ BitVec 64)) (_2!573 V!1547)) )
))
(declare-datatypes ((List!706 0))(
  ( (Nil!703) (Cons!702 (h!1269 tuple2!1124) (t!3392 List!706)) )
))
(declare-datatypes ((ListLongMap!689 0))(
  ( (ListLongMap!690 (toList!360 List!706)) )
))
(declare-fun lt!11291 () ListLongMap!689)

(declare-fun contains!301 (ListLongMap!689 (_ BitVec 64)) Bool)

(assert (=> b!29431 (contains!301 lt!11291 (select (arr!849 _keys!1833) lt!11293))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1547)

(declare-fun minValue!1443 () V!1547)

(declare-fun lt!11296 () Unit!692)

(declare-fun lemmaValidKeyInArrayIsInListMap!36 (array!1791 array!1789 (_ BitVec 32) (_ BitVec 32) V!1547 V!1547 (_ BitVec 32) Int) Unit!692)

(assert (=> b!29431 (= lt!11296 (lemmaValidKeyInArrayIsInListMap!36 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11293 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1791 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29431 (= lt!11293 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29432 () Bool)

(declare-fun res!17656 () Bool)

(assert (=> b!29432 (=> (not res!17656) (not e!18987))))

(assert (=> b!29432 (= res!17656 (and (= (size!949 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!950 _keys!1833) (size!949 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1465 () Bool)

(assert (=> mapIsEmpty!1465 mapRes!1465))

(declare-fun b!29433 () Bool)

(declare-fun res!17652 () Bool)

(assert (=> b!29433 (=> (not res!17652) (not e!18987))))

(assert (=> b!29433 (= res!17652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29434 () Bool)

(declare-fun res!17654 () Bool)

(assert (=> b!29434 (=> (not res!17654) (not e!18990))))

(declare-fun arrayContainsKey!0 (array!1791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29434 (= res!17654 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29435 () Bool)

(assert (=> b!29435 (= e!18987 e!18990)))

(declare-fun res!17650 () Bool)

(assert (=> b!29435 (=> (not res!17650) (not e!18990))))

(assert (=> b!29435 (= res!17650 (not (contains!301 lt!11291 k0!1304)))))

(declare-fun getCurrentListMap!185 (array!1791 array!1789 (_ BitVec 32) (_ BitVec 32) V!1547 V!1547 (_ BitVec 32) Int) ListLongMap!689)

(assert (=> b!29435 (= lt!11291 (getCurrentListMap!185 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29436 () Bool)

(assert (=> b!29436 (= e!18988 tp_is_empty!1291)))

(assert (= (and start!4022 res!17655) b!29432))

(assert (= (and b!29432 res!17656) b!29433))

(assert (= (and b!29433 res!17652) b!29430))

(assert (= (and b!29430 res!17653) b!29428))

(assert (= (and b!29428 res!17651) b!29435))

(assert (= (and b!29435 res!17650) b!29434))

(assert (= (and b!29434 res!17654) b!29431))

(assert (= (and b!29427 condMapEmpty!1465) mapIsEmpty!1465))

(assert (= (and b!29427 (not condMapEmpty!1465)) mapNonEmpty!1465))

(assert (= (and mapNonEmpty!1465 ((_ is ValueCellFull!446) mapValue!1465)) b!29436))

(assert (= (and b!29427 ((_ is ValueCellFull!446) mapDefault!1465)) b!29429))

(assert (= start!4022 b!29427))

(declare-fun m!23643 () Bool)

(assert (=> b!29433 m!23643))

(declare-fun m!23645 () Bool)

(assert (=> b!29435 m!23645))

(declare-fun m!23647 () Bool)

(assert (=> b!29435 m!23647))

(declare-fun m!23649 () Bool)

(assert (=> start!4022 m!23649))

(declare-fun m!23651 () Bool)

(assert (=> start!4022 m!23651))

(declare-fun m!23653 () Bool)

(assert (=> start!4022 m!23653))

(declare-fun m!23655 () Bool)

(assert (=> b!29431 m!23655))

(declare-fun m!23657 () Bool)

(assert (=> b!29431 m!23657))

(declare-fun m!23659 () Bool)

(assert (=> b!29431 m!23659))

(declare-fun m!23661 () Bool)

(assert (=> b!29431 m!23661))

(declare-fun m!23663 () Bool)

(assert (=> b!29431 m!23663))

(declare-fun m!23665 () Bool)

(assert (=> b!29431 m!23665))

(declare-fun m!23667 () Bool)

(assert (=> b!29431 m!23667))

(assert (=> b!29431 m!23661))

(declare-fun m!23669 () Bool)

(assert (=> b!29431 m!23669))

(declare-fun m!23671 () Bool)

(assert (=> mapNonEmpty!1465 m!23671))

(declare-fun m!23673 () Bool)

(assert (=> b!29428 m!23673))

(declare-fun m!23675 () Bool)

(assert (=> b!29434 m!23675))

(declare-fun m!23677 () Bool)

(assert (=> b!29430 m!23677))

(check-sat tp_is_empty!1291 (not start!4022) (not b!29434) (not b!29428) (not b!29430) (not mapNonEmpty!1465) (not b_next!937) (not b!29435) b_and!1741 (not b!29431) (not b!29433))
(check-sat b_and!1741 (not b_next!937))
