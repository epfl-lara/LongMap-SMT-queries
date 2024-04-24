; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4004 () Bool)

(assert start!4004)

(declare-fun b_free!913 () Bool)

(declare-fun b_next!913 () Bool)

(assert (=> start!4004 (= b_free!913 (not b_next!913))))

(declare-fun tp!4159 () Bool)

(declare-fun b_and!1713 () Bool)

(assert (=> start!4004 (= tp!4159 b_and!1713)))

(declare-fun res!17393 () Bool)

(declare-fun e!18764 () Bool)

(assert (=> start!4004 (=> (not res!17393) (not e!18764))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4004 (= res!17393 (validMask!0 mask!2294))))

(assert (=> start!4004 e!18764))

(assert (=> start!4004 true))

(assert (=> start!4004 tp!4159))

(declare-datatypes ((V!1515 0))(
  ( (V!1516 (val!660 Int)) )
))
(declare-datatypes ((ValueCell!434 0))(
  ( (ValueCellFull!434 (v!1749 V!1515)) (EmptyCell!434) )
))
(declare-datatypes ((array!1747 0))(
  ( (array!1748 (arr!827 (Array (_ BitVec 32) ValueCell!434)) (size!928 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1747)

(declare-fun e!18765 () Bool)

(declare-fun array_inv!573 (array!1747) Bool)

(assert (=> start!4004 (and (array_inv!573 _values!1501) e!18765)))

(declare-datatypes ((array!1749 0))(
  ( (array!1750 (arr!828 (Array (_ BitVec 32) (_ BitVec 64))) (size!929 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1749)

(declare-fun array_inv!574 (array!1749) Bool)

(assert (=> start!4004 (array_inv!574 _keys!1833)))

(declare-fun tp_is_empty!1267 () Bool)

(assert (=> start!4004 tp_is_empty!1267))

(declare-fun b!29049 () Bool)

(declare-fun e!18762 () Bool)

(assert (=> b!29049 (= e!18762 (not true))))

(declare-datatypes ((SeekEntryResult!80 0))(
  ( (MissingZero!80 (index!2442 (_ BitVec 32))) (Found!80 (index!2443 (_ BitVec 32))) (Intermediate!80 (undefined!892 Bool) (index!2444 (_ BitVec 32)) (x!6390 (_ BitVec 32))) (Undefined!80) (MissingVacant!80 (index!2445 (_ BitVec 32))) )
))
(declare-fun lt!11053 () SeekEntryResult!80)

(declare-fun lt!11054 () (_ BitVec 32))

(get-info :version)

(assert (=> b!29049 (and ((_ is Found!80) lt!11053) (= (index!2443 lt!11053) lt!11054))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1749 (_ BitVec 32)) SeekEntryResult!80)

(assert (=> b!29049 (= lt!11053 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!683 0))(
  ( (Unit!684) )
))
(declare-fun lt!11051 () Unit!683)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1749 (_ BitVec 32)) Unit!683)

(assert (=> b!29049 (= lt!11051 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11054 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1092 0))(
  ( (tuple2!1093 (_1!557 (_ BitVec 64)) (_2!557 V!1515)) )
))
(declare-datatypes ((List!681 0))(
  ( (Nil!678) (Cons!677 (h!1244 tuple2!1092) (t!3368 List!681)) )
))
(declare-datatypes ((ListLongMap!663 0))(
  ( (ListLongMap!664 (toList!347 List!681)) )
))
(declare-fun lt!11052 () ListLongMap!663)

(declare-fun contains!289 (ListLongMap!663 (_ BitVec 64)) Bool)

(assert (=> b!29049 (contains!289 lt!11052 (select (arr!828 _keys!1833) lt!11054))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11055 () Unit!683)

(declare-fun zeroValue!1443 () V!1515)

(declare-fun minValue!1443 () V!1515)

(declare-fun lemmaValidKeyInArrayIsInListMap!31 (array!1749 array!1747 (_ BitVec 32) (_ BitVec 32) V!1515 V!1515 (_ BitVec 32) Int) Unit!683)

(assert (=> b!29049 (= lt!11055 (lemmaValidKeyInArrayIsInListMap!31 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11054 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1749 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29049 (= lt!11054 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1429 () Bool)

(declare-fun mapRes!1429 () Bool)

(declare-fun tp!4158 () Bool)

(declare-fun e!18761 () Bool)

(assert (=> mapNonEmpty!1429 (= mapRes!1429 (and tp!4158 e!18761))))

(declare-fun mapKey!1429 () (_ BitVec 32))

(declare-fun mapRest!1429 () (Array (_ BitVec 32) ValueCell!434))

(declare-fun mapValue!1429 () ValueCell!434)

(assert (=> mapNonEmpty!1429 (= (arr!827 _values!1501) (store mapRest!1429 mapKey!1429 mapValue!1429))))

(declare-fun b!29050 () Bool)

(assert (=> b!29050 (= e!18764 e!18762)))

(declare-fun res!17391 () Bool)

(assert (=> b!29050 (=> (not res!17391) (not e!18762))))

(assert (=> b!29050 (= res!17391 (not (contains!289 lt!11052 k0!1304)))))

(declare-fun getCurrentListMap!173 (array!1749 array!1747 (_ BitVec 32) (_ BitVec 32) V!1515 V!1515 (_ BitVec 32) Int) ListLongMap!663)

(assert (=> b!29050 (= lt!11052 (getCurrentListMap!173 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29051 () Bool)

(declare-fun res!17394 () Bool)

(assert (=> b!29051 (=> (not res!17394) (not e!18764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29051 (= res!17394 (validKeyInArray!0 k0!1304))))

(declare-fun b!29052 () Bool)

(declare-fun e!18766 () Bool)

(assert (=> b!29052 (= e!18766 tp_is_empty!1267)))

(declare-fun b!29053 () Bool)

(declare-fun res!17390 () Bool)

(assert (=> b!29053 (=> (not res!17390) (not e!18764))))

(assert (=> b!29053 (= res!17390 (and (= (size!928 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!929 _keys!1833) (size!928 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29054 () Bool)

(assert (=> b!29054 (= e!18765 (and e!18766 mapRes!1429))))

(declare-fun condMapEmpty!1429 () Bool)

(declare-fun mapDefault!1429 () ValueCell!434)

(assert (=> b!29054 (= condMapEmpty!1429 (= (arr!827 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!434)) mapDefault!1429)))))

(declare-fun b!29055 () Bool)

(declare-fun res!17395 () Bool)

(assert (=> b!29055 (=> (not res!17395) (not e!18762))))

(declare-fun arrayContainsKey!0 (array!1749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29055 (= res!17395 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29056 () Bool)

(declare-fun res!17396 () Bool)

(assert (=> b!29056 (=> (not res!17396) (not e!18764))))

(declare-datatypes ((List!682 0))(
  ( (Nil!679) (Cons!678 (h!1245 (_ BitVec 64)) (t!3369 List!682)) )
))
(declare-fun arrayNoDuplicates!0 (array!1749 (_ BitVec 32) List!682) Bool)

(assert (=> b!29056 (= res!17396 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!679))))

(declare-fun b!29057 () Bool)

(assert (=> b!29057 (= e!18761 tp_is_empty!1267)))

(declare-fun b!29058 () Bool)

(declare-fun res!17392 () Bool)

(assert (=> b!29058 (=> (not res!17392) (not e!18764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1749 (_ BitVec 32)) Bool)

(assert (=> b!29058 (= res!17392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1429 () Bool)

(assert (=> mapIsEmpty!1429 mapRes!1429))

(assert (= (and start!4004 res!17393) b!29053))

(assert (= (and b!29053 res!17390) b!29058))

(assert (= (and b!29058 res!17392) b!29056))

(assert (= (and b!29056 res!17396) b!29051))

(assert (= (and b!29051 res!17394) b!29050))

(assert (= (and b!29050 res!17391) b!29055))

(assert (= (and b!29055 res!17395) b!29049))

(assert (= (and b!29054 condMapEmpty!1429) mapIsEmpty!1429))

(assert (= (and b!29054 (not condMapEmpty!1429)) mapNonEmpty!1429))

(assert (= (and mapNonEmpty!1429 ((_ is ValueCellFull!434) mapValue!1429)) b!29057))

(assert (= (and b!29054 ((_ is ValueCellFull!434) mapDefault!1429)) b!29052))

(assert (= start!4004 b!29054))

(declare-fun m!23153 () Bool)

(assert (=> b!29051 m!23153))

(declare-fun m!23155 () Bool)

(assert (=> mapNonEmpty!1429 m!23155))

(declare-fun m!23157 () Bool)

(assert (=> b!29055 m!23157))

(declare-fun m!23159 () Bool)

(assert (=> b!29050 m!23159))

(declare-fun m!23161 () Bool)

(assert (=> b!29050 m!23161))

(declare-fun m!23163 () Bool)

(assert (=> start!4004 m!23163))

(declare-fun m!23165 () Bool)

(assert (=> start!4004 m!23165))

(declare-fun m!23167 () Bool)

(assert (=> start!4004 m!23167))

(declare-fun m!23169 () Bool)

(assert (=> b!29049 m!23169))

(assert (=> b!29049 m!23169))

(declare-fun m!23171 () Bool)

(assert (=> b!29049 m!23171))

(declare-fun m!23173 () Bool)

(assert (=> b!29049 m!23173))

(declare-fun m!23175 () Bool)

(assert (=> b!29049 m!23175))

(declare-fun m!23177 () Bool)

(assert (=> b!29049 m!23177))

(declare-fun m!23179 () Bool)

(assert (=> b!29049 m!23179))

(declare-fun m!23181 () Bool)

(assert (=> b!29058 m!23181))

(declare-fun m!23183 () Bool)

(assert (=> b!29056 m!23183))

(check-sat (not b!29056) tp_is_empty!1267 (not start!4004) (not b!29049) (not b!29055) b_and!1713 (not b!29051) (not mapNonEmpty!1429) (not b!29050) (not b_next!913) (not b!29058))
(check-sat b_and!1713 (not b_next!913))
