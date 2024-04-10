; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4336 () Bool)

(assert start!4336)

(declare-fun b_free!1177 () Bool)

(declare-fun b_next!1177 () Bool)

(assert (=> start!4336 (= b_free!1177 (not b_next!1177))))

(declare-fun tp!4959 () Bool)

(declare-fun b_and!1993 () Bool)

(assert (=> start!4336 (= tp!4959 b_and!1993)))

(declare-fun b!33432 () Bool)

(declare-fun e!21232 () Bool)

(declare-fun e!21235 () Bool)

(assert (=> b!33432 (= e!21232 e!21235)))

(declare-fun res!20328 () Bool)

(assert (=> b!33432 (=> (not res!20328) (not e!21235))))

(declare-datatypes ((V!1867 0))(
  ( (V!1868 (val!792 Int)) )
))
(declare-datatypes ((tuple2!1290 0))(
  ( (tuple2!1291 (_1!656 (_ BitVec 64)) (_2!656 V!1867)) )
))
(declare-datatypes ((List!880 0))(
  ( (Nil!877) (Cons!876 (h!1443 tuple2!1290) (t!3579 List!880)) )
))
(declare-datatypes ((ListLongMap!867 0))(
  ( (ListLongMap!868 (toList!449 List!880)) )
))
(declare-fun lt!12185 () ListLongMap!867)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!392 (ListLongMap!867 (_ BitVec 64)) Bool)

(assert (=> b!33432 (= res!20328 (not (contains!392 lt!12185 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!566 0))(
  ( (ValueCellFull!566 (v!1884 V!1867)) (EmptyCell!566) )
))
(declare-datatypes ((array!2275 0))(
  ( (array!2276 (arr!1088 (Array (_ BitVec 32) ValueCell!566)) (size!1189 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2275)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2277 0))(
  ( (array!2278 (arr!1089 (Array (_ BitVec 32) (_ BitVec 64))) (size!1190 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2277)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1867)

(declare-fun minValue!1443 () V!1867)

(declare-fun getCurrentListMap!275 (array!2277 array!2275 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) ListLongMap!867)

(assert (=> b!33432 (= lt!12185 (getCurrentListMap!275 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33433 () Bool)

(assert (=> b!33433 (= e!21235 (not (or (not (= (size!1190 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))) (bvsle #b00000000000000000000000000000000 (size!1190 _keys!1833)))))))

(declare-datatypes ((SeekEntryResult!129 0))(
  ( (MissingZero!129 (index!2638 (_ BitVec 32))) (Found!129 (index!2639 (_ BitVec 32))) (Intermediate!129 (undefined!941 Bool) (index!2640 (_ BitVec 32)) (x!6821 (_ BitVec 32))) (Undefined!129) (MissingVacant!129 (index!2641 (_ BitVec 32))) )
))
(declare-fun lt!12183 () SeekEntryResult!129)

(declare-fun lt!12184 () (_ BitVec 32))

(assert (=> b!33433 (and (is-Found!129 lt!12183) (= (index!2639 lt!12183) lt!12184))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2277 (_ BitVec 32)) SeekEntryResult!129)

(assert (=> b!33433 (= lt!12183 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!746 0))(
  ( (Unit!747) )
))
(declare-fun lt!12182 () Unit!746)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2277 (_ BitVec 32)) Unit!746)

(assert (=> b!33433 (= lt!12182 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!12184 _keys!1833 mask!2294))))

(assert (=> b!33433 (contains!392 lt!12185 (select (arr!1089 _keys!1833) lt!12184))))

(declare-fun lt!12186 () Unit!746)

(declare-fun lemmaValidKeyInArrayIsInListMap!61 (array!2277 array!2275 (_ BitVec 32) (_ BitVec 32) V!1867 V!1867 (_ BitVec 32) Int) Unit!746)

(assert (=> b!33433 (= lt!12186 (lemmaValidKeyInArrayIsInListMap!61 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12184 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2277 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33433 (= lt!12184 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33434 () Bool)

(declare-fun res!20329 () Bool)

(assert (=> b!33434 (=> (not res!20329) (not e!21232))))

(declare-datatypes ((List!881 0))(
  ( (Nil!878) (Cons!877 (h!1444 (_ BitVec 64)) (t!3580 List!881)) )
))
(declare-fun arrayNoDuplicates!0 (array!2277 (_ BitVec 32) List!881) Bool)

(assert (=> b!33434 (= res!20329 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!878))))

(declare-fun res!20326 () Bool)

(assert (=> start!4336 (=> (not res!20326) (not e!21232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4336 (= res!20326 (validMask!0 mask!2294))))

(assert (=> start!4336 e!21232))

(assert (=> start!4336 true))

(assert (=> start!4336 tp!4959))

(declare-fun e!21231 () Bool)

(declare-fun array_inv!767 (array!2275) Bool)

(assert (=> start!4336 (and (array_inv!767 _values!1501) e!21231)))

(declare-fun array_inv!768 (array!2277) Bool)

(assert (=> start!4336 (array_inv!768 _keys!1833)))

(declare-fun tp_is_empty!1531 () Bool)

(assert (=> start!4336 tp_is_empty!1531))

(declare-fun b!33435 () Bool)

(declare-fun res!20323 () Bool)

(assert (=> b!33435 (=> (not res!20323) (not e!21232))))

(assert (=> b!33435 (= res!20323 (and (= (size!1189 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1190 _keys!1833) (size!1189 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1834 () Bool)

(declare-fun mapRes!1834 () Bool)

(declare-fun tp!4960 () Bool)

(declare-fun e!21233 () Bool)

(assert (=> mapNonEmpty!1834 (= mapRes!1834 (and tp!4960 e!21233))))

(declare-fun mapKey!1834 () (_ BitVec 32))

(declare-fun mapValue!1834 () ValueCell!566)

(declare-fun mapRest!1834 () (Array (_ BitVec 32) ValueCell!566))

(assert (=> mapNonEmpty!1834 (= (arr!1088 _values!1501) (store mapRest!1834 mapKey!1834 mapValue!1834))))

(declare-fun b!33436 () Bool)

(declare-fun res!20327 () Bool)

(assert (=> b!33436 (=> (not res!20327) (not e!21235))))

(declare-fun arrayContainsKey!0 (array!2277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33436 (= res!20327 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33437 () Bool)

(declare-fun e!21230 () Bool)

(assert (=> b!33437 (= e!21231 (and e!21230 mapRes!1834))))

(declare-fun condMapEmpty!1834 () Bool)

(declare-fun mapDefault!1834 () ValueCell!566)

