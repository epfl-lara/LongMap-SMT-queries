; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4314 () Bool)

(assert start!4314)

(declare-fun b_free!1165 () Bool)

(declare-fun b_next!1165 () Bool)

(assert (=> start!4314 (= b_free!1165 (not b_next!1165))))

(declare-fun tp!4924 () Bool)

(declare-fun b_and!1975 () Bool)

(assert (=> start!4314 (= tp!4924 b_and!1975)))

(declare-fun b!33198 () Bool)

(declare-fun res!20165 () Bool)

(declare-fun e!21084 () Bool)

(assert (=> b!33198 (=> (not res!20165) (not e!21084))))

(declare-datatypes ((array!2225 0))(
  ( (array!2226 (arr!1063 (Array (_ BitVec 32) (_ BitVec 64))) (size!1164 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2225)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33198 (= res!20165 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1816 () Bool)

(declare-fun mapRes!1816 () Bool)

(declare-fun tp!4923 () Bool)

(declare-fun e!21080 () Bool)

(assert (=> mapNonEmpty!1816 (= mapRes!1816 (and tp!4923 e!21080))))

(declare-fun mapKey!1816 () (_ BitVec 32))

(declare-datatypes ((V!1851 0))(
  ( (V!1852 (val!786 Int)) )
))
(declare-datatypes ((ValueCell!560 0))(
  ( (ValueCellFull!560 (v!1877 V!1851)) (EmptyCell!560) )
))
(declare-datatypes ((array!2227 0))(
  ( (array!2228 (arr!1064 (Array (_ BitVec 32) ValueCell!560)) (size!1165 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2227)

(declare-fun mapValue!1816 () ValueCell!560)

(declare-fun mapRest!1816 () (Array (_ BitVec 32) ValueCell!560))

(assert (=> mapNonEmpty!1816 (= (arr!1064 _values!1501) (store mapRest!1816 mapKey!1816 mapValue!1816))))

(declare-fun b!33199 () Bool)

(declare-fun res!20168 () Bool)

(declare-fun e!21083 () Bool)

(assert (=> b!33199 (=> (not res!20168) (not e!21083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33199 (= res!20168 (validKeyInArray!0 k0!1304))))

(declare-fun b!33200 () Bool)

(assert (=> b!33200 (= e!21083 e!21084)))

(declare-fun res!20171 () Bool)

(assert (=> b!33200 (=> (not res!20171) (not e!21084))))

(declare-datatypes ((tuple2!1278 0))(
  ( (tuple2!1279 (_1!650 (_ BitVec 64)) (_2!650 V!1851)) )
))
(declare-datatypes ((List!861 0))(
  ( (Nil!858) (Cons!857 (h!1424 tuple2!1278) (t!3553 List!861)) )
))
(declare-datatypes ((ListLongMap!843 0))(
  ( (ListLongMap!844 (toList!437 List!861)) )
))
(declare-fun lt!12091 () ListLongMap!843)

(declare-fun contains!381 (ListLongMap!843 (_ BitVec 64)) Bool)

(assert (=> b!33200 (= res!20171 (not (contains!381 lt!12091 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1851)

(declare-fun minValue!1443 () V!1851)

(declare-fun getCurrentListMap!258 (array!2225 array!2227 (_ BitVec 32) (_ BitVec 32) V!1851 V!1851 (_ BitVec 32) Int) ListLongMap!843)

(assert (=> b!33200 (= lt!12091 (getCurrentListMap!258 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33201 () Bool)

(declare-fun e!21081 () Bool)

(declare-fun e!21079 () Bool)

(assert (=> b!33201 (= e!21081 (and e!21079 mapRes!1816))))

(declare-fun condMapEmpty!1816 () Bool)

(declare-fun mapDefault!1816 () ValueCell!560)

(assert (=> b!33201 (= condMapEmpty!1816 (= (arr!1064 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!560)) mapDefault!1816)))))

(declare-fun b!33202 () Bool)

(declare-fun tp_is_empty!1519 () Bool)

(assert (=> b!33202 (= e!21079 tp_is_empty!1519)))

(declare-fun b!33203 () Bool)

(declare-fun res!20166 () Bool)

(assert (=> b!33203 (=> (not res!20166) (not e!21083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2225 (_ BitVec 32)) Bool)

(assert (=> b!33203 (= res!20166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!20170 () Bool)

(assert (=> start!4314 (=> (not res!20170) (not e!21083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4314 (= res!20170 (validMask!0 mask!2294))))

(assert (=> start!4314 e!21083))

(assert (=> start!4314 true))

(assert (=> start!4314 tp!4924))

(declare-fun array_inv!755 (array!2227) Bool)

(assert (=> start!4314 (and (array_inv!755 _values!1501) e!21081)))

(declare-fun array_inv!756 (array!2225) Bool)

(assert (=> start!4314 (array_inv!756 _keys!1833)))

(assert (=> start!4314 tp_is_empty!1519))

(declare-fun b!33204 () Bool)

(declare-fun res!20167 () Bool)

(assert (=> b!33204 (=> (not res!20167) (not e!21083))))

(assert (=> b!33204 (= res!20167 (and (= (size!1165 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1164 _keys!1833) (size!1165 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33205 () Bool)

(declare-fun res!20169 () Bool)

(assert (=> b!33205 (=> (not res!20169) (not e!21083))))

(declare-datatypes ((List!862 0))(
  ( (Nil!859) (Cons!858 (h!1425 (_ BitVec 64)) (t!3554 List!862)) )
))
(declare-fun arrayNoDuplicates!0 (array!2225 (_ BitVec 32) List!862) Bool)

(assert (=> b!33205 (= res!20169 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!859))))

(declare-fun b!33206 () Bool)

(assert (=> b!33206 (= e!21080 tp_is_empty!1519)))

(declare-fun b!33207 () Bool)

(assert (=> b!33207 (= e!21084 (not true))))

(declare-datatypes ((SeekEntryResult!132 0))(
  ( (MissingZero!132 (index!2650 (_ BitVec 32))) (Found!132 (index!2651 (_ BitVec 32))) (Intermediate!132 (undefined!944 Bool) (index!2652 (_ BitVec 32)) (x!6808 (_ BitVec 32))) (Undefined!132) (MissingVacant!132 (index!2653 (_ BitVec 32))) )
))
(declare-fun lt!12090 () SeekEntryResult!132)

(declare-fun lt!12088 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33207 (and ((_ is Found!132) lt!12090) (= (index!2651 lt!12090) lt!12088))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2225 (_ BitVec 32)) SeekEntryResult!132)

(assert (=> b!33207 (= lt!12090 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!737 0))(
  ( (Unit!738) )
))
(declare-fun lt!12092 () Unit!737)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2225 (_ BitVec 32)) Unit!737)

(assert (=> b!33207 (= lt!12092 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12088 _keys!1833 mask!2294))))

(assert (=> b!33207 (contains!381 lt!12091 (select (arr!1063 _keys!1833) lt!12088))))

(declare-fun lt!12089 () Unit!737)

(declare-fun lemmaValidKeyInArrayIsInListMap!53 (array!2225 array!2227 (_ BitVec 32) (_ BitVec 32) V!1851 V!1851 (_ BitVec 32) Int) Unit!737)

(assert (=> b!33207 (= lt!12089 (lemmaValidKeyInArrayIsInListMap!53 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12088 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2225 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33207 (= lt!12088 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1816 () Bool)

(assert (=> mapIsEmpty!1816 mapRes!1816))

(assert (= (and start!4314 res!20170) b!33204))

(assert (= (and b!33204 res!20167) b!33203))

(assert (= (and b!33203 res!20166) b!33205))

(assert (= (and b!33205 res!20169) b!33199))

(assert (= (and b!33199 res!20168) b!33200))

(assert (= (and b!33200 res!20171) b!33198))

(assert (= (and b!33198 res!20165) b!33207))

(assert (= (and b!33201 condMapEmpty!1816) mapIsEmpty!1816))

(assert (= (and b!33201 (not condMapEmpty!1816)) mapNonEmpty!1816))

(assert (= (and mapNonEmpty!1816 ((_ is ValueCellFull!560) mapValue!1816)) b!33206))

(assert (= (and b!33201 ((_ is ValueCellFull!560) mapDefault!1816)) b!33202))

(assert (= start!4314 b!33201))

(declare-fun m!26573 () Bool)

(assert (=> start!4314 m!26573))

(declare-fun m!26575 () Bool)

(assert (=> start!4314 m!26575))

(declare-fun m!26577 () Bool)

(assert (=> start!4314 m!26577))

(declare-fun m!26579 () Bool)

(assert (=> b!33199 m!26579))

(declare-fun m!26581 () Bool)

(assert (=> b!33203 m!26581))

(declare-fun m!26583 () Bool)

(assert (=> mapNonEmpty!1816 m!26583))

(declare-fun m!26585 () Bool)

(assert (=> b!33198 m!26585))

(declare-fun m!26587 () Bool)

(assert (=> b!33205 m!26587))

(declare-fun m!26589 () Bool)

(assert (=> b!33200 m!26589))

(declare-fun m!26591 () Bool)

(assert (=> b!33200 m!26591))

(declare-fun m!26593 () Bool)

(assert (=> b!33207 m!26593))

(declare-fun m!26595 () Bool)

(assert (=> b!33207 m!26595))

(declare-fun m!26597 () Bool)

(assert (=> b!33207 m!26597))

(declare-fun m!26599 () Bool)

(assert (=> b!33207 m!26599))

(declare-fun m!26601 () Bool)

(assert (=> b!33207 m!26601))

(declare-fun m!26603 () Bool)

(assert (=> b!33207 m!26603))

(assert (=> b!33207 m!26599))

(check-sat (not b!33203) (not b_next!1165) (not b!33198) (not b!33200) b_and!1975 (not start!4314) (not b!33207) (not b!33199) (not mapNonEmpty!1816) (not b!33205) tp_is_empty!1519)
(check-sat b_and!1975 (not b_next!1165))
