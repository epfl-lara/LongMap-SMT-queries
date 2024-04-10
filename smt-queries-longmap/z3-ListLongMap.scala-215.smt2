; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3974 () Bool)

(assert start!3974)

(declare-fun b_free!879 () Bool)

(declare-fun b_next!879 () Bool)

(assert (=> start!3974 (= b_free!879 (not b_next!879))))

(declare-fun tp!4057 () Bool)

(declare-fun b_and!1689 () Bool)

(assert (=> start!3974 (= tp!4057 b_and!1689)))

(declare-fun b!28589 () Bool)

(declare-fun e!18487 () Bool)

(declare-fun tp_is_empty!1233 () Bool)

(assert (=> b!28589 (= e!18487 tp_is_empty!1233)))

(declare-fun b!28590 () Bool)

(declare-fun res!17056 () Bool)

(declare-fun e!18486 () Bool)

(assert (=> b!28590 (=> (not res!17056) (not e!18486))))

(declare-datatypes ((array!1701 0))(
  ( (array!1702 (arr!804 (Array (_ BitVec 32) (_ BitVec 64))) (size!905 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1701)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28590 (= res!17056 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28591 () Bool)

(declare-fun res!17057 () Bool)

(declare-fun e!18491 () Bool)

(assert (=> b!28591 (=> (not res!17057) (not e!18491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28591 (= res!17057 (validKeyInArray!0 k0!1304))))

(declare-fun b!28592 () Bool)

(declare-fun e!18488 () Bool)

(assert (=> b!28592 (= e!18486 (not e!18488))))

(declare-fun res!17055 () Bool)

(assert (=> b!28592 (=> res!17055 e!18488)))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!28592 (= res!17055 (not (= (size!905 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((V!1469 0))(
  ( (V!1470 (val!643 Int)) )
))
(declare-datatypes ((tuple2!1068 0))(
  ( (tuple2!1069 (_1!545 (_ BitVec 64)) (_2!545 V!1469)) )
))
(declare-datatypes ((List!668 0))(
  ( (Nil!665) (Cons!664 (h!1231 tuple2!1068) (t!3361 List!668)) )
))
(declare-datatypes ((ListLongMap!645 0))(
  ( (ListLongMap!646 (toList!338 List!668)) )
))
(declare-fun lt!10865 () ListLongMap!645)

(declare-fun lt!10864 () (_ BitVec 32))

(declare-fun contains!278 (ListLongMap!645 (_ BitVec 64)) Bool)

(assert (=> b!28592 (contains!278 lt!10865 (select (arr!804 _keys!1833) lt!10864))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!417 0))(
  ( (ValueCellFull!417 (v!1732 V!1469)) (EmptyCell!417) )
))
(declare-datatypes ((array!1703 0))(
  ( (array!1704 (arr!805 (Array (_ BitVec 32) ValueCell!417)) (size!906 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1703)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!645 0))(
  ( (Unit!646) )
))
(declare-fun lt!10862 () Unit!645)

(declare-fun zeroValue!1443 () V!1469)

(declare-fun minValue!1443 () V!1469)

(declare-fun lemmaValidKeyInArrayIsInListMap!16 (array!1701 array!1703 (_ BitVec 32) (_ BitVec 32) V!1469 V!1469 (_ BitVec 32) Int) Unit!645)

(assert (=> b!28592 (= lt!10862 (lemmaValidKeyInArrayIsInListMap!16 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10864 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1701 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28592 (= lt!10864 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28593 () Bool)

(assert (=> b!28593 (= e!18491 e!18486)))

(declare-fun res!17052 () Bool)

(assert (=> b!28593 (=> (not res!17052) (not e!18486))))

(assert (=> b!28593 (= res!17052 (not (contains!278 lt!10865 k0!1304)))))

(declare-fun getCurrentListMap!168 (array!1701 array!1703 (_ BitVec 32) (_ BitVec 32) V!1469 V!1469 (_ BitVec 32) Int) ListLongMap!645)

(assert (=> b!28593 (= lt!10865 (getCurrentListMap!168 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28594 () Bool)

(declare-fun e!18490 () Bool)

(assert (=> b!28594 (= e!18490 tp_is_empty!1233)))

(declare-fun mapIsEmpty!1378 () Bool)

(declare-fun mapRes!1378 () Bool)

(assert (=> mapIsEmpty!1378 mapRes!1378))

(declare-fun b!28595 () Bool)

(declare-fun res!17051 () Bool)

(assert (=> b!28595 (=> (not res!17051) (not e!18491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1701 (_ BitVec 32)) Bool)

(assert (=> b!28595 (= res!17051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28596 () Bool)

(declare-fun res!17053 () Bool)

(assert (=> b!28596 (=> (not res!17053) (not e!18491))))

(declare-datatypes ((List!669 0))(
  ( (Nil!666) (Cons!665 (h!1232 (_ BitVec 64)) (t!3362 List!669)) )
))
(declare-fun arrayNoDuplicates!0 (array!1701 (_ BitVec 32) List!669) Bool)

(assert (=> b!28596 (= res!17053 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!666))))

(declare-fun b!28597 () Bool)

(declare-fun e!18485 () Bool)

(assert (=> b!28597 (= e!18485 (and e!18490 mapRes!1378))))

(declare-fun condMapEmpty!1378 () Bool)

(declare-fun mapDefault!1378 () ValueCell!417)

(assert (=> b!28597 (= condMapEmpty!1378 (= (arr!805 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!417)) mapDefault!1378)))))

(declare-fun b!28598 () Bool)

(assert (=> b!28598 (= e!18488 true)))

(declare-datatypes ((SeekEntryResult!68 0))(
  ( (MissingZero!68 (index!2394 (_ BitVec 32))) (Found!68 (index!2395 (_ BitVec 32))) (Intermediate!68 (undefined!880 Bool) (index!2396 (_ BitVec 32)) (x!6330 (_ BitVec 32))) (Undefined!68) (MissingVacant!68 (index!2397 (_ BitVec 32))) )
))
(declare-fun lt!10863 () SeekEntryResult!68)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1701 (_ BitVec 32)) SeekEntryResult!68)

(assert (=> b!28598 (= lt!10863 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!17054 () Bool)

(assert (=> start!3974 (=> (not res!17054) (not e!18491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3974 (= res!17054 (validMask!0 mask!2294))))

(assert (=> start!3974 e!18491))

(assert (=> start!3974 true))

(assert (=> start!3974 tp!4057))

(declare-fun array_inv!551 (array!1703) Bool)

(assert (=> start!3974 (and (array_inv!551 _values!1501) e!18485)))

(declare-fun array_inv!552 (array!1701) Bool)

(assert (=> start!3974 (array_inv!552 _keys!1833)))

(assert (=> start!3974 tp_is_empty!1233))

(declare-fun b!28599 () Bool)

(declare-fun res!17058 () Bool)

(assert (=> b!28599 (=> (not res!17058) (not e!18491))))

(assert (=> b!28599 (= res!17058 (and (= (size!906 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!905 _keys!1833) (size!906 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1378 () Bool)

(declare-fun tp!4056 () Bool)

(assert (=> mapNonEmpty!1378 (= mapRes!1378 (and tp!4056 e!18487))))

(declare-fun mapValue!1378 () ValueCell!417)

(declare-fun mapKey!1378 () (_ BitVec 32))

(declare-fun mapRest!1378 () (Array (_ BitVec 32) ValueCell!417))

(assert (=> mapNonEmpty!1378 (= (arr!805 _values!1501) (store mapRest!1378 mapKey!1378 mapValue!1378))))

(assert (= (and start!3974 res!17054) b!28599))

(assert (= (and b!28599 res!17058) b!28595))

(assert (= (and b!28595 res!17051) b!28596))

(assert (= (and b!28596 res!17053) b!28591))

(assert (= (and b!28591 res!17057) b!28593))

(assert (= (and b!28593 res!17052) b!28590))

(assert (= (and b!28590 res!17056) b!28592))

(assert (= (and b!28592 (not res!17055)) b!28598))

(assert (= (and b!28597 condMapEmpty!1378) mapIsEmpty!1378))

(assert (= (and b!28597 (not condMapEmpty!1378)) mapNonEmpty!1378))

(get-info :version)

(assert (= (and mapNonEmpty!1378 ((_ is ValueCellFull!417) mapValue!1378)) b!28589))

(assert (= (and b!28597 ((_ is ValueCellFull!417) mapDefault!1378)) b!28594))

(assert (= start!3974 b!28597))

(declare-fun m!22777 () Bool)

(assert (=> b!28596 m!22777))

(declare-fun m!22779 () Bool)

(assert (=> b!28595 m!22779))

(declare-fun m!22781 () Bool)

(assert (=> b!28593 m!22781))

(declare-fun m!22783 () Bool)

(assert (=> b!28593 m!22783))

(declare-fun m!22785 () Bool)

(assert (=> start!3974 m!22785))

(declare-fun m!22787 () Bool)

(assert (=> start!3974 m!22787))

(declare-fun m!22789 () Bool)

(assert (=> start!3974 m!22789))

(declare-fun m!22791 () Bool)

(assert (=> mapNonEmpty!1378 m!22791))

(declare-fun m!22793 () Bool)

(assert (=> b!28590 m!22793))

(declare-fun m!22795 () Bool)

(assert (=> b!28598 m!22795))

(declare-fun m!22797 () Bool)

(assert (=> b!28592 m!22797))

(assert (=> b!28592 m!22797))

(declare-fun m!22799 () Bool)

(assert (=> b!28592 m!22799))

(declare-fun m!22801 () Bool)

(assert (=> b!28592 m!22801))

(declare-fun m!22803 () Bool)

(assert (=> b!28592 m!22803))

(declare-fun m!22805 () Bool)

(assert (=> b!28591 m!22805))

(check-sat b_and!1689 (not b!28591) (not mapNonEmpty!1378) tp_is_empty!1233 (not b_next!879) (not b!28592) (not b!28595) (not b!28590) (not b!28598) (not b!28593) (not b!28596) (not start!3974))
(check-sat b_and!1689 (not b_next!879))
