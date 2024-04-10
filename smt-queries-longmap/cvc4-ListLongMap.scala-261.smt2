; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4292 () Bool)

(assert start!4292)

(declare-fun b_free!1157 () Bool)

(declare-fun b_next!1157 () Bool)

(assert (=> start!4292 (= b_free!1157 (not b_next!1157))))

(declare-fun tp!4897 () Bool)

(declare-fun b_and!1971 () Bool)

(assert (=> start!4292 (= tp!4897 b_and!1971)))

(declare-fun b!32978 () Bool)

(declare-fun e!20950 () Bool)

(declare-fun tp_is_empty!1511 () Bool)

(assert (=> b!32978 (= e!20950 tp_is_empty!1511)))

(declare-fun b!32979 () Bool)

(declare-fun e!20946 () Bool)

(assert (=> b!32979 (= e!20946 (not true))))

(declare-datatypes ((V!1839 0))(
  ( (V!1840 (val!782 Int)) )
))
(declare-datatypes ((tuple2!1274 0))(
  ( (tuple2!1275 (_1!648 (_ BitVec 64)) (_2!648 V!1839)) )
))
(declare-datatypes ((List!866 0))(
  ( (Nil!863) (Cons!862 (h!1429 tuple2!1274) (t!3563 List!866)) )
))
(declare-datatypes ((ListLongMap!851 0))(
  ( (ListLongMap!852 (toList!441 List!866)) )
))
(declare-fun lt!11947 () ListLongMap!851)

(declare-datatypes ((array!2235 0))(
  ( (array!2236 (arr!1069 (Array (_ BitVec 32) (_ BitVec 64))) (size!1170 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2235)

(declare-fun lt!11948 () (_ BitVec 32))

(declare-fun contains!383 (ListLongMap!851 (_ BitVec 64)) Bool)

(assert (=> b!32979 (contains!383 lt!11947 (select (arr!1069 _keys!1833) lt!11948))))

(declare-datatypes ((Unit!729 0))(
  ( (Unit!730) )
))
(declare-fun lt!11946 () Unit!729)

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((ValueCell!556 0))(
  ( (ValueCellFull!556 (v!1873 V!1839)) (EmptyCell!556) )
))
(declare-datatypes ((array!2237 0))(
  ( (array!2238 (arr!1070 (Array (_ BitVec 32) ValueCell!556)) (size!1171 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2237)

(declare-fun zeroValue!1443 () V!1839)

(declare-fun minValue!1443 () V!1839)

(declare-fun lemmaValidKeyInArrayIsInListMap!54 (array!2235 array!2237 (_ BitVec 32) (_ BitVec 32) V!1839 V!1839 (_ BitVec 32) Int) Unit!729)

(assert (=> b!32979 (= lt!11946 (lemmaValidKeyInArrayIsInListMap!54 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11948 defaultEntry!1504))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2235 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32979 (= lt!11948 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1801 () Bool)

(declare-fun mapRes!1801 () Bool)

(declare-fun tp!4896 () Bool)

(declare-fun e!20948 () Bool)

(assert (=> mapNonEmpty!1801 (= mapRes!1801 (and tp!4896 e!20948))))

(declare-fun mapRest!1801 () (Array (_ BitVec 32) ValueCell!556))

(declare-fun mapValue!1801 () ValueCell!556)

(declare-fun mapKey!1801 () (_ BitVec 32))

(assert (=> mapNonEmpty!1801 (= (arr!1070 _values!1501) (store mapRest!1801 mapKey!1801 mapValue!1801))))

(declare-fun b!32980 () Bool)

(declare-fun res!20054 () Bool)

(declare-fun e!20947 () Bool)

(assert (=> b!32980 (=> (not res!20054) (not e!20947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32980 (= res!20054 (validKeyInArray!0 k!1304))))

(declare-fun b!32981 () Bool)

(declare-fun res!20053 () Bool)

(assert (=> b!32981 (=> (not res!20053) (not e!20947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2235 (_ BitVec 32)) Bool)

(assert (=> b!32981 (= res!20053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32982 () Bool)

(assert (=> b!32982 (= e!20947 e!20946)))

(declare-fun res!20055 () Bool)

(assert (=> b!32982 (=> (not res!20055) (not e!20946))))

(assert (=> b!32982 (= res!20055 (not (contains!383 lt!11947 k!1304)))))

(declare-fun getCurrentListMap!269 (array!2235 array!2237 (_ BitVec 32) (_ BitVec 32) V!1839 V!1839 (_ BitVec 32) Int) ListLongMap!851)

(assert (=> b!32982 (= lt!11947 (getCurrentListMap!269 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!20050 () Bool)

(assert (=> start!4292 (=> (not res!20050) (not e!20947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4292 (= res!20050 (validMask!0 mask!2294))))

(assert (=> start!4292 e!20947))

(assert (=> start!4292 true))

(assert (=> start!4292 tp!4897))

(declare-fun e!20949 () Bool)

(declare-fun array_inv!751 (array!2237) Bool)

(assert (=> start!4292 (and (array_inv!751 _values!1501) e!20949)))

(declare-fun array_inv!752 (array!2235) Bool)

(assert (=> start!4292 (array_inv!752 _keys!1833)))

(assert (=> start!4292 tp_is_empty!1511))

(declare-fun b!32983 () Bool)

(assert (=> b!32983 (= e!20949 (and e!20950 mapRes!1801))))

(declare-fun condMapEmpty!1801 () Bool)

(declare-fun mapDefault!1801 () ValueCell!556)

