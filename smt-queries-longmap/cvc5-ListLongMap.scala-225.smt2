; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4032 () Bool)

(assert start!4032)

(declare-fun b_free!937 () Bool)

(declare-fun b_next!937 () Bool)

(assert (=> start!4032 (= b_free!937 (not b_next!937))))

(declare-fun tp!4230 () Bool)

(declare-fun b_and!1747 () Bool)

(assert (=> start!4032 (= tp!4230 b_and!1747)))

(declare-fun b!29482 () Bool)

(declare-fun e!19034 () Bool)

(declare-fun e!19032 () Bool)

(assert (=> b!29482 (= e!19034 e!19032)))

(declare-fun res!17683 () Bool)

(assert (=> b!29482 (=> (not res!17683) (not e!19032))))

(declare-datatypes ((V!1547 0))(
  ( (V!1548 (val!672 Int)) )
))
(declare-datatypes ((tuple2!1112 0))(
  ( (tuple2!1113 (_1!567 (_ BitVec 64)) (_2!567 V!1547)) )
))
(declare-datatypes ((List!713 0))(
  ( (Nil!710) (Cons!709 (h!1276 tuple2!1112) (t!3406 List!713)) )
))
(declare-datatypes ((ListLongMap!689 0))(
  ( (ListLongMap!690 (toList!360 List!713)) )
))
(declare-fun lt!11300 () ListLongMap!689)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!300 (ListLongMap!689 (_ BitVec 64)) Bool)

(assert (=> b!29482 (= res!17683 (not (contains!300 lt!11300 k!1304)))))

(declare-datatypes ((ValueCell!446 0))(
  ( (ValueCellFull!446 (v!1761 V!1547)) (EmptyCell!446) )
))
(declare-datatypes ((array!1813 0))(
  ( (array!1814 (arr!860 (Array (_ BitVec 32) ValueCell!446)) (size!961 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1813)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1815 0))(
  ( (array!1816 (arr!861 (Array (_ BitVec 32) (_ BitVec 64))) (size!962 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1815)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1547)

(declare-fun minValue!1443 () V!1547)

(declare-fun getCurrentListMap!189 (array!1815 array!1813 (_ BitVec 32) (_ BitVec 32) V!1547 V!1547 (_ BitVec 32) Int) ListLongMap!689)

(assert (=> b!29482 (= lt!11300 (getCurrentListMap!189 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29483 () Bool)

(declare-fun e!19030 () Bool)

(declare-fun tp_is_empty!1291 () Bool)

(assert (=> b!29483 (= e!19030 tp_is_empty!1291)))

(declare-fun b!29484 () Bool)

(declare-fun res!17684 () Bool)

(assert (=> b!29484 (=> (not res!17684) (not e!19034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29484 (= res!17684 (validKeyInArray!0 k!1304))))

(declare-fun b!29485 () Bool)

(declare-fun res!17682 () Bool)

(assert (=> b!29485 (=> (not res!17682) (not e!19034))))

(declare-datatypes ((List!714 0))(
  ( (Nil!711) (Cons!710 (h!1277 (_ BitVec 64)) (t!3407 List!714)) )
))
(declare-fun arrayNoDuplicates!0 (array!1815 (_ BitVec 32) List!714) Bool)

(assert (=> b!29485 (= res!17682 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!711))))

(declare-fun b!29486 () Bool)

(declare-fun res!17687 () Bool)

(assert (=> b!29486 (=> (not res!17687) (not e!19034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1815 (_ BitVec 32)) Bool)

(assert (=> b!29486 (= res!17687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29481 () Bool)

(declare-fun res!17688 () Bool)

(assert (=> b!29481 (=> (not res!17688) (not e!19034))))

(assert (=> b!29481 (= res!17688 (and (= (size!961 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!962 _keys!1833) (size!961 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!17685 () Bool)

(assert (=> start!4032 (=> (not res!17685) (not e!19034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4032 (= res!17685 (validMask!0 mask!2294))))

(assert (=> start!4032 e!19034))

(assert (=> start!4032 true))

(assert (=> start!4032 tp!4230))

(declare-fun e!19029 () Bool)

(declare-fun array_inv!595 (array!1813) Bool)

(assert (=> start!4032 (and (array_inv!595 _values!1501) e!19029)))

(declare-fun array_inv!596 (array!1815) Bool)

(assert (=> start!4032 (array_inv!596 _keys!1833)))

(assert (=> start!4032 tp_is_empty!1291))

(declare-fun b!29487 () Bool)

(declare-fun e!19033 () Bool)

(assert (=> b!29487 (= e!19033 tp_is_empty!1291)))

(declare-fun b!29488 () Bool)

(declare-fun res!17686 () Bool)

(assert (=> b!29488 (=> (not res!17686) (not e!19032))))

(declare-fun arrayContainsKey!0 (array!1815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29488 (= res!17686 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1465 () Bool)

(declare-fun mapRes!1465 () Bool)

(assert (=> mapIsEmpty!1465 mapRes!1465))

(declare-fun mapNonEmpty!1465 () Bool)

(declare-fun tp!4231 () Bool)

(assert (=> mapNonEmpty!1465 (= mapRes!1465 (and tp!4231 e!19033))))

(declare-fun mapRest!1465 () (Array (_ BitVec 32) ValueCell!446))

(declare-fun mapKey!1465 () (_ BitVec 32))

(declare-fun mapValue!1465 () ValueCell!446)

(assert (=> mapNonEmpty!1465 (= (arr!860 _values!1501) (store mapRest!1465 mapKey!1465 mapValue!1465))))

(declare-fun b!29489 () Bool)

(assert (=> b!29489 (= e!19032 (not true))))

(declare-fun lt!11296 () (_ BitVec 32))

(assert (=> b!29489 (arrayForallSeekEntryOrOpenFound!0 lt!11296 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!681 0))(
  ( (Unit!682) )
))
(declare-fun lt!11297 () Unit!681)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!1815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!681)

(assert (=> b!29489 (= lt!11297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!11296))))

(declare-datatypes ((SeekEntryResult!87 0))(
  ( (MissingZero!87 (index!2470 (_ BitVec 32))) (Found!87 (index!2471 (_ BitVec 32))) (Intermediate!87 (undefined!899 Bool) (index!2472 (_ BitVec 32)) (x!6429 (_ BitVec 32))) (Undefined!87) (MissingVacant!87 (index!2473 (_ BitVec 32))) )
))
(declare-fun lt!11295 () SeekEntryResult!87)

(assert (=> b!29489 (and (is-Found!87 lt!11295) (= (index!2471 lt!11295) lt!11296))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1815 (_ BitVec 32)) SeekEntryResult!87)

(assert (=> b!29489 (= lt!11295 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun lt!11299 () Unit!681)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1815 (_ BitVec 32)) Unit!681)

(assert (=> b!29489 (= lt!11299 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!11296 _keys!1833 mask!2294))))

(assert (=> b!29489 (contains!300 lt!11300 (select (arr!861 _keys!1833) lt!11296))))

(declare-fun lt!11298 () Unit!681)

(declare-fun lemmaValidKeyInArrayIsInListMap!34 (array!1815 array!1813 (_ BitVec 32) (_ BitVec 32) V!1547 V!1547 (_ BitVec 32) Int) Unit!681)

(assert (=> b!29489 (= lt!11298 (lemmaValidKeyInArrayIsInListMap!34 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11296 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1815 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29489 (= lt!11296 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!29490 () Bool)

(assert (=> b!29490 (= e!19029 (and e!19030 mapRes!1465))))

(declare-fun condMapEmpty!1465 () Bool)

(declare-fun mapDefault!1465 () ValueCell!446)

