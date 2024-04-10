; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4026 () Bool)

(assert start!4026)

(declare-fun b_free!931 () Bool)

(declare-fun b_next!931 () Bool)

(assert (=> start!4026 (= b_free!931 (not b_next!931))))

(declare-fun tp!4213 () Bool)

(declare-fun b_and!1741 () Bool)

(assert (=> start!4026 (= tp!4213 b_and!1741)))

(declare-fun mapNonEmpty!1456 () Bool)

(declare-fun mapRes!1456 () Bool)

(declare-fun tp!4212 () Bool)

(declare-fun e!18977 () Bool)

(assert (=> mapNonEmpty!1456 (= mapRes!1456 (and tp!4212 e!18977))))

(declare-datatypes ((V!1539 0))(
  ( (V!1540 (val!669 Int)) )
))
(declare-datatypes ((ValueCell!443 0))(
  ( (ValueCellFull!443 (v!1758 V!1539)) (EmptyCell!443) )
))
(declare-datatypes ((array!1801 0))(
  ( (array!1802 (arr!854 (Array (_ BitVec 32) ValueCell!443)) (size!955 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1801)

(declare-fun mapRest!1456 () (Array (_ BitVec 32) ValueCell!443))

(declare-fun mapKey!1456 () (_ BitVec 32))

(declare-fun mapValue!1456 () ValueCell!443)

(assert (=> mapNonEmpty!1456 (= (arr!854 _values!1501) (store mapRest!1456 mapKey!1456 mapValue!1456))))

(declare-fun b!29391 () Bool)

(declare-fun e!18980 () Bool)

(assert (=> b!29391 (= e!18980 (not true))))

(declare-fun lt!11244 () (_ BitVec 32))

(declare-datatypes ((array!1803 0))(
  ( (array!1804 (arr!855 (Array (_ BitVec 32) (_ BitVec 64))) (size!956 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1803)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1803 (_ BitVec 32)) Bool)

(assert (=> b!29391 (arrayForallSeekEntryOrOpenFound!0 lt!11244 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!675 0))(
  ( (Unit!676) )
))
(declare-fun lt!11246 () Unit!675)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!675)

(assert (=> b!29391 (= lt!11246 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11244))))

(declare-datatypes ((SeekEntryResult!84 0))(
  ( (MissingZero!84 (index!2458 (_ BitVec 32))) (Found!84 (index!2459 (_ BitVec 32))) (Intermediate!84 (undefined!896 Bool) (index!2460 (_ BitVec 32)) (x!6418 (_ BitVec 32))) (Undefined!84) (MissingVacant!84 (index!2461 (_ BitVec 32))) )
))
(declare-fun lt!11245 () SeekEntryResult!84)

(assert (=> b!29391 (and (is-Found!84 lt!11245) (= (index!2459 lt!11245) lt!11244))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1803 (_ BitVec 32)) SeekEntryResult!84)

(assert (=> b!29391 (= lt!11245 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun lt!11241 () Unit!675)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1803 (_ BitVec 32)) Unit!675)

(assert (=> b!29391 (= lt!11241 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!11244 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1106 0))(
  ( (tuple2!1107 (_1!564 (_ BitVec 64)) (_2!564 V!1539)) )
))
(declare-datatypes ((List!707 0))(
  ( (Nil!704) (Cons!703 (h!1270 tuple2!1106) (t!3400 List!707)) )
))
(declare-datatypes ((ListLongMap!683 0))(
  ( (ListLongMap!684 (toList!357 List!707)) )
))
(declare-fun lt!11243 () ListLongMap!683)

(declare-fun contains!297 (ListLongMap!683 (_ BitVec 64)) Bool)

(assert (=> b!29391 (contains!297 lt!11243 (select (arr!855 _keys!1833) lt!11244))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11242 () Unit!675)

(declare-fun zeroValue!1443 () V!1539)

(declare-fun minValue!1443 () V!1539)

(declare-fun lemmaValidKeyInArrayIsInListMap!31 (array!1803 array!1801 (_ BitVec 32) (_ BitVec 32) V!1539 V!1539 (_ BitVec 32) Int) Unit!675)

(assert (=> b!29391 (= lt!11242 (lemmaValidKeyInArrayIsInListMap!31 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11244 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1803 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29391 (= lt!11244 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun res!17620 () Bool)

(declare-fun e!18975 () Bool)

(assert (=> start!4026 (=> (not res!17620) (not e!18975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4026 (= res!17620 (validMask!0 mask!2294))))

(assert (=> start!4026 e!18975))

(assert (=> start!4026 true))

(assert (=> start!4026 tp!4213))

(declare-fun e!18976 () Bool)

(declare-fun array_inv!589 (array!1801) Bool)

(assert (=> start!4026 (and (array_inv!589 _values!1501) e!18976)))

(declare-fun array_inv!590 (array!1803) Bool)

(assert (=> start!4026 (array_inv!590 _keys!1833)))

(declare-fun tp_is_empty!1285 () Bool)

(assert (=> start!4026 tp_is_empty!1285))

(declare-fun b!29392 () Bool)

(assert (=> b!29392 (= e!18975 e!18980)))

(declare-fun res!17624 () Bool)

(assert (=> b!29392 (=> (not res!17624) (not e!18980))))

(assert (=> b!29392 (= res!17624 (not (contains!297 lt!11243 k!1304)))))

(declare-fun getCurrentListMap!187 (array!1803 array!1801 (_ BitVec 32) (_ BitVec 32) V!1539 V!1539 (_ BitVec 32) Int) ListLongMap!683)

(assert (=> b!29392 (= lt!11243 (getCurrentListMap!187 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29393 () Bool)

(declare-fun res!17625 () Bool)

(assert (=> b!29393 (=> (not res!17625) (not e!18975))))

(declare-datatypes ((List!708 0))(
  ( (Nil!705) (Cons!704 (h!1271 (_ BitVec 64)) (t!3401 List!708)) )
))
(declare-fun arrayNoDuplicates!0 (array!1803 (_ BitVec 32) List!708) Bool)

(assert (=> b!29393 (= res!17625 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!705))))

(declare-fun b!29394 () Bool)

(declare-fun e!18978 () Bool)

(assert (=> b!29394 (= e!18978 tp_is_empty!1285)))

(declare-fun b!29395 () Bool)

(assert (=> b!29395 (= e!18976 (and e!18978 mapRes!1456))))

(declare-fun condMapEmpty!1456 () Bool)

(declare-fun mapDefault!1456 () ValueCell!443)

