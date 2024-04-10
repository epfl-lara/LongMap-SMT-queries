; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4004 () Bool)

(assert start!4004)

(declare-fun b_free!909 () Bool)

(declare-fun b_next!909 () Bool)

(assert (=> start!4004 (= b_free!909 (not b_next!909))))

(declare-fun tp!4147 () Bool)

(declare-fun b_and!1719 () Bool)

(assert (=> start!4004 (= tp!4147 b_and!1719)))

(declare-fun b!29061 () Bool)

(declare-fun e!18777 () Bool)

(declare-fun tp_is_empty!1263 () Bool)

(assert (=> b!29061 (= e!18777 tp_is_empty!1263)))

(declare-fun b!29062 () Bool)

(declare-fun res!17389 () Bool)

(declare-fun e!18782 () Bool)

(assert (=> b!29062 (=> (not res!17389) (not e!18782))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29062 (= res!17389 (validKeyInArray!0 k0!1304))))

(declare-fun b!29063 () Bool)

(declare-fun res!17388 () Bool)

(assert (=> b!29063 (=> (not res!17388) (not e!18782))))

(declare-datatypes ((array!1759 0))(
  ( (array!1760 (arr!833 (Array (_ BitVec 32) (_ BitVec 64))) (size!934 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1759)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1759 (_ BitVec 32)) Bool)

(assert (=> b!29063 (= res!17388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29064 () Bool)

(declare-fun e!18780 () Bool)

(assert (=> b!29064 (= e!18782 e!18780)))

(declare-fun res!17391 () Bool)

(assert (=> b!29064 (=> (not res!17391) (not e!18780))))

(declare-datatypes ((V!1509 0))(
  ( (V!1510 (val!658 Int)) )
))
(declare-datatypes ((tuple2!1090 0))(
  ( (tuple2!1091 (_1!556 (_ BitVec 64)) (_2!556 V!1509)) )
))
(declare-datatypes ((List!690 0))(
  ( (Nil!687) (Cons!686 (h!1253 tuple2!1090) (t!3383 List!690)) )
))
(declare-datatypes ((ListLongMap!667 0))(
  ( (ListLongMap!668 (toList!349 List!690)) )
))
(declare-fun lt!11067 () ListLongMap!667)

(declare-fun contains!289 (ListLongMap!667 (_ BitVec 64)) Bool)

(assert (=> b!29064 (= res!17391 (not (contains!289 lt!11067 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!432 0))(
  ( (ValueCellFull!432 (v!1747 V!1509)) (EmptyCell!432) )
))
(declare-datatypes ((array!1761 0))(
  ( (array!1762 (arr!834 (Array (_ BitVec 32) ValueCell!432)) (size!935 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1761)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1509)

(declare-fun minValue!1443 () V!1509)

(declare-fun getCurrentListMap!179 (array!1759 array!1761 (_ BitVec 32) (_ BitVec 32) V!1509 V!1509 (_ BitVec 32) Int) ListLongMap!667)

(assert (=> b!29064 (= lt!11067 (getCurrentListMap!179 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29065 () Bool)

(assert (=> b!29065 (= e!18780 (not true))))

(declare-datatypes ((SeekEntryResult!78 0))(
  ( (MissingZero!78 (index!2434 (_ BitVec 32))) (Found!78 (index!2435 (_ BitVec 32))) (Intermediate!78 (undefined!890 Bool) (index!2436 (_ BitVec 32)) (x!6380 (_ BitVec 32))) (Undefined!78) (MissingVacant!78 (index!2437 (_ BitVec 32))) )
))
(declare-fun lt!11068 () SeekEntryResult!78)

(declare-fun lt!11066 () (_ BitVec 32))

(get-info :version)

(assert (=> b!29065 (and ((_ is Found!78) lt!11068) (= (index!2435 lt!11068) lt!11066))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1759 (_ BitVec 32)) SeekEntryResult!78)

(assert (=> b!29065 (= lt!11068 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!663 0))(
  ( (Unit!664) )
))
(declare-fun lt!11065 () Unit!663)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1759 (_ BitVec 32)) Unit!663)

(assert (=> b!29065 (= lt!11065 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11066 _keys!1833 mask!2294))))

(assert (=> b!29065 (contains!289 lt!11067 (select (arr!833 _keys!1833) lt!11066))))

(declare-fun lt!11069 () Unit!663)

(declare-fun lemmaValidKeyInArrayIsInListMap!25 (array!1759 array!1761 (_ BitVec 32) (_ BitVec 32) V!1509 V!1509 (_ BitVec 32) Int) Unit!663)

(assert (=> b!29065 (= lt!11069 (lemmaValidKeyInArrayIsInListMap!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11066 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1759 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29065 (= lt!11066 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29066 () Bool)

(declare-fun res!17394 () Bool)

(assert (=> b!29066 (=> (not res!17394) (not e!18782))))

(declare-datatypes ((List!691 0))(
  ( (Nil!688) (Cons!687 (h!1254 (_ BitVec 64)) (t!3384 List!691)) )
))
(declare-fun arrayNoDuplicates!0 (array!1759 (_ BitVec 32) List!691) Bool)

(assert (=> b!29066 (= res!17394 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!688))))

(declare-fun b!29067 () Bool)

(declare-fun e!18781 () Bool)

(assert (=> b!29067 (= e!18781 tp_is_empty!1263)))

(declare-fun b!29068 () Bool)

(declare-fun res!17393 () Bool)

(assert (=> b!29068 (=> (not res!17393) (not e!18782))))

(assert (=> b!29068 (= res!17393 (and (= (size!935 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!934 _keys!1833) (size!935 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1423 () Bool)

(declare-fun mapRes!1423 () Bool)

(declare-fun tp!4146 () Bool)

(assert (=> mapNonEmpty!1423 (= mapRes!1423 (and tp!4146 e!18781))))

(declare-fun mapKey!1423 () (_ BitVec 32))

(declare-fun mapValue!1423 () ValueCell!432)

(declare-fun mapRest!1423 () (Array (_ BitVec 32) ValueCell!432))

(assert (=> mapNonEmpty!1423 (= (arr!834 _values!1501) (store mapRest!1423 mapKey!1423 mapValue!1423))))

(declare-fun res!17392 () Bool)

(assert (=> start!4004 (=> (not res!17392) (not e!18782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4004 (= res!17392 (validMask!0 mask!2294))))

(assert (=> start!4004 e!18782))

(assert (=> start!4004 true))

(assert (=> start!4004 tp!4147))

(declare-fun e!18779 () Bool)

(declare-fun array_inv!575 (array!1761) Bool)

(assert (=> start!4004 (and (array_inv!575 _values!1501) e!18779)))

(declare-fun array_inv!576 (array!1759) Bool)

(assert (=> start!4004 (array_inv!576 _keys!1833)))

(assert (=> start!4004 tp_is_empty!1263))

(declare-fun b!29069 () Bool)

(declare-fun res!17390 () Bool)

(assert (=> b!29069 (=> (not res!17390) (not e!18780))))

(declare-fun arrayContainsKey!0 (array!1759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29069 (= res!17390 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29070 () Bool)

(assert (=> b!29070 (= e!18779 (and e!18777 mapRes!1423))))

(declare-fun condMapEmpty!1423 () Bool)

(declare-fun mapDefault!1423 () ValueCell!432)

(assert (=> b!29070 (= condMapEmpty!1423 (= (arr!834 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!432)) mapDefault!1423)))))

(declare-fun mapIsEmpty!1423 () Bool)

(assert (=> mapIsEmpty!1423 mapRes!1423))

(assert (= (and start!4004 res!17392) b!29068))

(assert (= (and b!29068 res!17393) b!29063))

(assert (= (and b!29063 res!17388) b!29066))

(assert (= (and b!29066 res!17394) b!29062))

(assert (= (and b!29062 res!17389) b!29064))

(assert (= (and b!29064 res!17391) b!29069))

(assert (= (and b!29069 res!17390) b!29065))

(assert (= (and b!29070 condMapEmpty!1423) mapIsEmpty!1423))

(assert (= (and b!29070 (not condMapEmpty!1423)) mapNonEmpty!1423))

(assert (= (and mapNonEmpty!1423 ((_ is ValueCellFull!432) mapValue!1423)) b!29067))

(assert (= (and b!29070 ((_ is ValueCellFull!432) mapDefault!1423)) b!29061))

(assert (= start!4004 b!29070))

(declare-fun m!23241 () Bool)

(assert (=> b!29064 m!23241))

(declare-fun m!23243 () Bool)

(assert (=> b!29064 m!23243))

(declare-fun m!23245 () Bool)

(assert (=> b!29069 m!23245))

(declare-fun m!23247 () Bool)

(assert (=> start!4004 m!23247))

(declare-fun m!23249 () Bool)

(assert (=> start!4004 m!23249))

(declare-fun m!23251 () Bool)

(assert (=> start!4004 m!23251))

(declare-fun m!23253 () Bool)

(assert (=> b!29062 m!23253))

(declare-fun m!23255 () Bool)

(assert (=> mapNonEmpty!1423 m!23255))

(declare-fun m!23257 () Bool)

(assert (=> b!29066 m!23257))

(declare-fun m!23259 () Bool)

(assert (=> b!29063 m!23259))

(declare-fun m!23261 () Bool)

(assert (=> b!29065 m!23261))

(declare-fun m!23263 () Bool)

(assert (=> b!29065 m!23263))

(assert (=> b!29065 m!23261))

(declare-fun m!23265 () Bool)

(assert (=> b!29065 m!23265))

(declare-fun m!23267 () Bool)

(assert (=> b!29065 m!23267))

(declare-fun m!23269 () Bool)

(assert (=> b!29065 m!23269))

(declare-fun m!23271 () Bool)

(assert (=> b!29065 m!23271))

(check-sat (not start!4004) (not b!29065) (not b!29066) (not mapNonEmpty!1423) tp_is_empty!1263 (not b!29064) b_and!1719 (not b!29062) (not b!29069) (not b!29063) (not b_next!909))
(check-sat b_and!1719 (not b_next!909))
