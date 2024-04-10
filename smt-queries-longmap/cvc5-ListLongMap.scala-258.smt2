; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4270 () Bool)

(assert start!4270)

(declare-fun b_free!1135 () Bool)

(declare-fun b_next!1135 () Bool)

(assert (=> start!4270 (= b_free!1135 (not b_next!1135))))

(declare-fun tp!4831 () Bool)

(declare-fun b_and!1949 () Bool)

(assert (=> start!4270 (= tp!4831 b_and!1949)))

(declare-fun mapNonEmpty!1768 () Bool)

(declare-fun mapRes!1768 () Bool)

(declare-fun tp!4830 () Bool)

(declare-fun e!20753 () Bool)

(assert (=> mapNonEmpty!1768 (= mapRes!1768 (and tp!4830 e!20753))))

(declare-datatypes ((V!1811 0))(
  ( (V!1812 (val!771 Int)) )
))
(declare-datatypes ((ValueCell!545 0))(
  ( (ValueCellFull!545 (v!1862 V!1811)) (EmptyCell!545) )
))
(declare-datatypes ((array!2191 0))(
  ( (array!2192 (arr!1047 (Array (_ BitVec 32) ValueCell!545)) (size!1148 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2191)

(declare-fun mapKey!1768 () (_ BitVec 32))

(declare-fun mapRest!1768 () (Array (_ BitVec 32) ValueCell!545))

(declare-fun mapValue!1768 () ValueCell!545)

(assert (=> mapNonEmpty!1768 (= (arr!1047 _values!1501) (store mapRest!1768 mapKey!1768 mapValue!1768))))

(declare-fun b!32648 () Bool)

(declare-fun e!20749 () Bool)

(assert (=> b!32648 (= e!20749 (not true))))

(declare-datatypes ((tuple2!1252 0))(
  ( (tuple2!1253 (_1!637 (_ BitVec 64)) (_2!637 V!1811)) )
))
(declare-datatypes ((List!846 0))(
  ( (Nil!843) (Cons!842 (h!1409 tuple2!1252) (t!3543 List!846)) )
))
(declare-datatypes ((ListLongMap!829 0))(
  ( (ListLongMap!830 (toList!430 List!846)) )
))
(declare-fun lt!11847 () ListLongMap!829)

(declare-datatypes ((array!2193 0))(
  ( (array!2194 (arr!1048 (Array (_ BitVec 32) (_ BitVec 64))) (size!1149 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2193)

(declare-fun lt!11848 () (_ BitVec 32))

(declare-fun contains!372 (ListLongMap!829 (_ BitVec 64)) Bool)

(assert (=> b!32648 (contains!372 lt!11847 (select (arr!1048 _keys!1833) lt!11848))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((Unit!707 0))(
  ( (Unit!708) )
))
(declare-fun lt!11849 () Unit!707)

(declare-fun zeroValue!1443 () V!1811)

(declare-fun minValue!1443 () V!1811)

(declare-fun lemmaValidKeyInArrayIsInListMap!43 (array!2193 array!2191 (_ BitVec 32) (_ BitVec 32) V!1811 V!1811 (_ BitVec 32) Int) Unit!707)

(assert (=> b!32648 (= lt!11849 (lemmaValidKeyInArrayIsInListMap!43 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11848 defaultEntry!1504))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2193 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32648 (= lt!11848 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32649 () Bool)

(declare-fun tp_is_empty!1489 () Bool)

(assert (=> b!32649 (= e!20753 tp_is_empty!1489)))

(declare-fun b!32650 () Bool)

(declare-fun res!19823 () Bool)

(declare-fun e!20748 () Bool)

(assert (=> b!32650 (=> (not res!19823) (not e!20748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2193 (_ BitVec 32)) Bool)

(assert (=> b!32650 (= res!19823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32651 () Bool)

(declare-fun res!19820 () Bool)

(assert (=> b!32651 (=> (not res!19820) (not e!20749))))

(declare-fun arrayContainsKey!0 (array!2193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32651 (= res!19820 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32652 () Bool)

(declare-fun res!19821 () Bool)

(assert (=> b!32652 (=> (not res!19821) (not e!20748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32652 (= res!19821 (validKeyInArray!0 k!1304))))

(declare-fun b!32653 () Bool)

(assert (=> b!32653 (= e!20748 e!20749)))

(declare-fun res!19822 () Bool)

(assert (=> b!32653 (=> (not res!19822) (not e!20749))))

(assert (=> b!32653 (= res!19822 (not (contains!372 lt!11847 k!1304)))))

(declare-fun getCurrentListMap!258 (array!2193 array!2191 (_ BitVec 32) (_ BitVec 32) V!1811 V!1811 (_ BitVec 32) Int) ListLongMap!829)

(assert (=> b!32653 (= lt!11847 (getCurrentListMap!258 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1768 () Bool)

(assert (=> mapIsEmpty!1768 mapRes!1768))

(declare-fun b!32654 () Bool)

(declare-fun res!19818 () Bool)

(assert (=> b!32654 (=> (not res!19818) (not e!20748))))

(declare-datatypes ((List!847 0))(
  ( (Nil!844) (Cons!843 (h!1410 (_ BitVec 64)) (t!3544 List!847)) )
))
(declare-fun arrayNoDuplicates!0 (array!2193 (_ BitVec 32) List!847) Bool)

(assert (=> b!32654 (= res!19818 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!844))))

(declare-fun b!32655 () Bool)

(declare-fun e!20750 () Bool)

(assert (=> b!32655 (= e!20750 tp_is_empty!1489)))

(declare-fun b!32656 () Bool)

(declare-fun e!20751 () Bool)

(assert (=> b!32656 (= e!20751 (and e!20750 mapRes!1768))))

(declare-fun condMapEmpty!1768 () Bool)

(declare-fun mapDefault!1768 () ValueCell!545)

