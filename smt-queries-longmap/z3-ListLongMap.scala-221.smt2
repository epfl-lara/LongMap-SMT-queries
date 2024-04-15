; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3998 () Bool)

(assert start!3998)

(declare-fun b_free!913 () Bool)

(declare-fun b_next!913 () Bool)

(assert (=> start!3998 (= b_free!913 (not b_next!913))))

(declare-fun tp!4159 () Bool)

(declare-fun b_and!1717 () Bool)

(assert (=> start!3998 (= tp!4159 b_and!1717)))

(declare-fun b!29067 () Bool)

(declare-fun res!17403 () Bool)

(declare-fun e!18772 () Bool)

(assert (=> b!29067 (=> (not res!17403) (not e!18772))))

(declare-datatypes ((array!1741 0))(
  ( (array!1742 (arr!824 (Array (_ BitVec 32) (_ BitVec 64))) (size!925 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1741)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29067 (= res!17403 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29068 () Bool)

(declare-fun e!18775 () Bool)

(declare-fun tp_is_empty!1267 () Bool)

(assert (=> b!29068 (= e!18775 tp_is_empty!1267)))

(declare-fun b!29069 () Bool)

(declare-fun res!17400 () Bool)

(declare-fun e!18771 () Bool)

(assert (=> b!29069 (=> (not res!17400) (not e!18771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29069 (= res!17400 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1429 () Bool)

(declare-fun mapRes!1429 () Bool)

(assert (=> mapIsEmpty!1429 mapRes!1429))

(declare-fun b!29070 () Bool)

(assert (=> b!29070 (= e!18772 (not true))))

(declare-datatypes ((SeekEntryResult!81 0))(
  ( (MissingZero!81 (index!2446 (_ BitVec 32))) (Found!81 (index!2447 (_ BitVec 32))) (Intermediate!81 (undefined!893 Bool) (index!2448 (_ BitVec 32)) (x!6391 (_ BitVec 32))) (Undefined!81) (MissingVacant!81 (index!2449 (_ BitVec 32))) )
))
(declare-fun lt!11091 () SeekEntryResult!81)

(declare-fun lt!11095 () (_ BitVec 32))

(get-info :version)

(assert (=> b!29070 (and ((_ is Found!81) lt!11091) (= (index!2447 lt!11091) lt!11095))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1741 (_ BitVec 32)) SeekEntryResult!81)

(assert (=> b!29070 (= lt!11091 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!672 0))(
  ( (Unit!673) )
))
(declare-fun lt!11092 () Unit!672)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1741 (_ BitVec 32)) Unit!672)

(assert (=> b!29070 (= lt!11092 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11095 _keys!1833 mask!2294))))

(declare-datatypes ((V!1515 0))(
  ( (V!1516 (val!660 Int)) )
))
(declare-datatypes ((tuple2!1102 0))(
  ( (tuple2!1103 (_1!562 (_ BitVec 64)) (_2!562 V!1515)) )
))
(declare-datatypes ((List!686 0))(
  ( (Nil!683) (Cons!682 (h!1249 tuple2!1102) (t!3372 List!686)) )
))
(declare-datatypes ((ListLongMap!667 0))(
  ( (ListLongMap!668 (toList!349 List!686)) )
))
(declare-fun lt!11094 () ListLongMap!667)

(declare-fun contains!290 (ListLongMap!667 (_ BitVec 64)) Bool)

(assert (=> b!29070 (contains!290 lt!11094 (select (arr!824 _keys!1833) lt!11095))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!434 0))(
  ( (ValueCellFull!434 (v!1748 V!1515)) (EmptyCell!434) )
))
(declare-datatypes ((array!1743 0))(
  ( (array!1744 (arr!825 (Array (_ BitVec 32) ValueCell!434)) (size!926 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1743)

(declare-fun lt!11093 () Unit!672)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1515)

(declare-fun minValue!1443 () V!1515)

(declare-fun lemmaValidKeyInArrayIsInListMap!26 (array!1741 array!1743 (_ BitVec 32) (_ BitVec 32) V!1515 V!1515 (_ BitVec 32) Int) Unit!672)

(assert (=> b!29070 (= lt!11093 (lemmaValidKeyInArrayIsInListMap!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11095 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1741 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29070 (= lt!11095 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29071 () Bool)

(declare-fun res!17402 () Bool)

(assert (=> b!29071 (=> (not res!17402) (not e!18771))))

(declare-datatypes ((List!687 0))(
  ( (Nil!684) (Cons!683 (h!1250 (_ BitVec 64)) (t!3373 List!687)) )
))
(declare-fun arrayNoDuplicates!0 (array!1741 (_ BitVec 32) List!687) Bool)

(assert (=> b!29071 (= res!17402 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!684))))

(declare-fun b!29072 () Bool)

(declare-fun e!18773 () Bool)

(assert (=> b!29072 (= e!18773 (and e!18775 mapRes!1429))))

(declare-fun condMapEmpty!1429 () Bool)

(declare-fun mapDefault!1429 () ValueCell!434)

(assert (=> b!29072 (= condMapEmpty!1429 (= (arr!825 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!434)) mapDefault!1429)))))

(declare-fun mapNonEmpty!1429 () Bool)

(declare-fun tp!4158 () Bool)

(declare-fun e!18774 () Bool)

(assert (=> mapNonEmpty!1429 (= mapRes!1429 (and tp!4158 e!18774))))

(declare-fun mapValue!1429 () ValueCell!434)

(declare-fun mapKey!1429 () (_ BitVec 32))

(declare-fun mapRest!1429 () (Array (_ BitVec 32) ValueCell!434))

(assert (=> mapNonEmpty!1429 (= (arr!825 _values!1501) (store mapRest!1429 mapKey!1429 mapValue!1429))))

(declare-fun res!17399 () Bool)

(assert (=> start!3998 (=> (not res!17399) (not e!18771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3998 (= res!17399 (validMask!0 mask!2294))))

(assert (=> start!3998 e!18771))

(assert (=> start!3998 true))

(assert (=> start!3998 tp!4159))

(declare-fun array_inv!575 (array!1743) Bool)

(assert (=> start!3998 (and (array_inv!575 _values!1501) e!18773)))

(declare-fun array_inv!576 (array!1741) Bool)

(assert (=> start!3998 (array_inv!576 _keys!1833)))

(assert (=> start!3998 tp_is_empty!1267))

(declare-fun b!29073 () Bool)

(assert (=> b!29073 (= e!18774 tp_is_empty!1267)))

(declare-fun b!29074 () Bool)

(assert (=> b!29074 (= e!18771 e!18772)))

(declare-fun res!17404 () Bool)

(assert (=> b!29074 (=> (not res!17404) (not e!18772))))

(assert (=> b!29074 (= res!17404 (not (contains!290 lt!11094 k0!1304)))))

(declare-fun getCurrentListMap!177 (array!1741 array!1743 (_ BitVec 32) (_ BitVec 32) V!1515 V!1515 (_ BitVec 32) Int) ListLongMap!667)

(assert (=> b!29074 (= lt!11094 (getCurrentListMap!177 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29075 () Bool)

(declare-fun res!17398 () Bool)

(assert (=> b!29075 (=> (not res!17398) (not e!18771))))

(assert (=> b!29075 (= res!17398 (and (= (size!926 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!925 _keys!1833) (size!926 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29076 () Bool)

(declare-fun res!17401 () Bool)

(assert (=> b!29076 (=> (not res!17401) (not e!18771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1741 (_ BitVec 32)) Bool)

(assert (=> b!29076 (= res!17401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3998 res!17399) b!29075))

(assert (= (and b!29075 res!17398) b!29076))

(assert (= (and b!29076 res!17401) b!29071))

(assert (= (and b!29071 res!17402) b!29069))

(assert (= (and b!29069 res!17400) b!29074))

(assert (= (and b!29074 res!17404) b!29067))

(assert (= (and b!29067 res!17403) b!29070))

(assert (= (and b!29072 condMapEmpty!1429) mapIsEmpty!1429))

(assert (= (and b!29072 (not condMapEmpty!1429)) mapNonEmpty!1429))

(assert (= (and mapNonEmpty!1429 ((_ is ValueCellFull!434) mapValue!1429)) b!29073))

(assert (= (and b!29072 ((_ is ValueCellFull!434) mapDefault!1429)) b!29068))

(assert (= start!3998 b!29072))

(declare-fun m!23235 () Bool)

(assert (=> b!29071 m!23235))

(declare-fun m!23237 () Bool)

(assert (=> start!3998 m!23237))

(declare-fun m!23239 () Bool)

(assert (=> start!3998 m!23239))

(declare-fun m!23241 () Bool)

(assert (=> start!3998 m!23241))

(declare-fun m!23243 () Bool)

(assert (=> b!29076 m!23243))

(declare-fun m!23245 () Bool)

(assert (=> b!29074 m!23245))

(declare-fun m!23247 () Bool)

(assert (=> b!29074 m!23247))

(declare-fun m!23249 () Bool)

(assert (=> b!29070 m!23249))

(declare-fun m!23251 () Bool)

(assert (=> b!29070 m!23251))

(assert (=> b!29070 m!23249))

(declare-fun m!23253 () Bool)

(assert (=> b!29070 m!23253))

(declare-fun m!23255 () Bool)

(assert (=> b!29070 m!23255))

(declare-fun m!23257 () Bool)

(assert (=> b!29070 m!23257))

(declare-fun m!23259 () Bool)

(assert (=> b!29070 m!23259))

(declare-fun m!23261 () Bool)

(assert (=> mapNonEmpty!1429 m!23261))

(declare-fun m!23263 () Bool)

(assert (=> b!29069 m!23263))

(declare-fun m!23265 () Bool)

(assert (=> b!29067 m!23265))

(check-sat (not b!29069) (not b!29076) (not b_next!913) (not b!29074) b_and!1717 (not start!3998) tp_is_empty!1267 (not b!29070) (not mapNonEmpty!1429) (not b!29067) (not b!29071))
(check-sat b_and!1717 (not b_next!913))
