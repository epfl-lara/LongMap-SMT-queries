; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4146 () Bool)

(assert start!4146)

(declare-fun b_free!1051 () Bool)

(declare-fun b_next!1051 () Bool)

(assert (=> start!4146 (= b_free!1051 (not b_next!1051))))

(declare-fun tp!4572 () Bool)

(declare-fun b_and!1861 () Bool)

(assert (=> start!4146 (= tp!4572 b_and!1861)))

(declare-fun b!31191 () Bool)

(declare-fun res!18883 () Bool)

(declare-fun e!19945 () Bool)

(assert (=> b!31191 (=> (not res!18883) (not e!19945))))

(declare-datatypes ((array!2033 0))(
  ( (array!2034 (arr!970 (Array (_ BitVec 32) (_ BitVec 64))) (size!1071 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2033)

(declare-datatypes ((List!787 0))(
  ( (Nil!784) (Cons!783 (h!1350 (_ BitVec 64)) (t!3480 List!787)) )
))
(declare-fun arrayNoDuplicates!0 (array!2033 (_ BitVec 32) List!787) Bool)

(assert (=> b!31191 (= res!18883 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!784))))

(declare-fun b!31192 () Bool)

(declare-fun res!18884 () Bool)

(assert (=> b!31192 (=> (not res!18884) (not e!19945))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1699 0))(
  ( (V!1700 (val!729 Int)) )
))
(declare-datatypes ((ValueCell!503 0))(
  ( (ValueCellFull!503 (v!1818 V!1699)) (EmptyCell!503) )
))
(declare-datatypes ((array!2035 0))(
  ( (array!2036 (arr!971 (Array (_ BitVec 32) ValueCell!503)) (size!1072 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2035)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1699)

(declare-fun minValue!1443 () V!1699)

(declare-datatypes ((tuple2!1194 0))(
  ( (tuple2!1195 (_1!608 (_ BitVec 64)) (_2!608 V!1699)) )
))
(declare-datatypes ((List!788 0))(
  ( (Nil!785) (Cons!784 (h!1351 tuple2!1194) (t!3481 List!788)) )
))
(declare-datatypes ((ListLongMap!771 0))(
  ( (ListLongMap!772 (toList!401 List!788)) )
))
(declare-fun contains!341 (ListLongMap!771 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!229 (array!2033 array!2035 (_ BitVec 32) (_ BitVec 32) V!1699 V!1699 (_ BitVec 32) Int) ListLongMap!771)

(assert (=> b!31192 (= res!18884 (not (contains!341 (getCurrentListMap!229 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31193 () Bool)

(declare-fun res!18885 () Bool)

(assert (=> b!31193 (=> (not res!18885) (not e!19945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2033 (_ BitVec 32)) Bool)

(assert (=> b!31193 (= res!18885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31194 () Bool)

(declare-fun res!18880 () Bool)

(assert (=> b!31194 (=> (not res!18880) (not e!19945))))

(assert (=> b!31194 (= res!18880 (and (= (size!1072 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1071 _keys!1833) (size!1072 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31195 () Bool)

(declare-fun res!18882 () Bool)

(assert (=> b!31195 (=> (not res!18882) (not e!19945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31195 (= res!18882 (validKeyInArray!0 k!1304))))

(declare-fun b!31196 () Bool)

(declare-fun e!19947 () Bool)

(declare-fun tp_is_empty!1405 () Bool)

(assert (=> b!31196 (= e!19947 tp_is_empty!1405)))

(declare-fun mapNonEmpty!1636 () Bool)

(declare-fun mapRes!1636 () Bool)

(declare-fun tp!4573 () Bool)

(declare-fun e!19946 () Bool)

(assert (=> mapNonEmpty!1636 (= mapRes!1636 (and tp!4573 e!19946))))

(declare-fun mapValue!1636 () ValueCell!503)

(declare-fun mapKey!1636 () (_ BitVec 32))

(declare-fun mapRest!1636 () (Array (_ BitVec 32) ValueCell!503))

(assert (=> mapNonEmpty!1636 (= (arr!971 _values!1501) (store mapRest!1636 mapKey!1636 mapValue!1636))))

(declare-fun mapIsEmpty!1636 () Bool)

(assert (=> mapIsEmpty!1636 mapRes!1636))

(declare-fun b!31197 () Bool)

(assert (=> b!31197 (= e!19945 false)))

(declare-datatypes ((SeekEntryResult!119 0))(
  ( (MissingZero!119 (index!2598 (_ BitVec 32))) (Found!119 (index!2599 (_ BitVec 32))) (Intermediate!119 (undefined!931 Bool) (index!2600 (_ BitVec 32)) (x!6613 (_ BitVec 32))) (Undefined!119) (MissingVacant!119 (index!2601 (_ BitVec 32))) )
))
(declare-fun lt!11537 () SeekEntryResult!119)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2033 (_ BitVec 32)) SeekEntryResult!119)

(assert (=> b!31197 (= lt!11537 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!31198 () Bool)

(declare-fun res!18881 () Bool)

(assert (=> b!31198 (=> (not res!18881) (not e!19945))))

(declare-fun arrayContainsKey!0 (array!2033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31198 (= res!18881 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!31200 () Bool)

(assert (=> b!31200 (= e!19946 tp_is_empty!1405)))

(declare-fun b!31199 () Bool)

(declare-fun e!19949 () Bool)

(assert (=> b!31199 (= e!19949 (and e!19947 mapRes!1636))))

(declare-fun condMapEmpty!1636 () Bool)

(declare-fun mapDefault!1636 () ValueCell!503)

