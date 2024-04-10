; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4276 () Bool)

(assert start!4276)

(declare-fun b_free!1141 () Bool)

(declare-fun b_next!1141 () Bool)

(assert (=> start!4276 (= b_free!1141 (not b_next!1141))))

(declare-fun tp!4849 () Bool)

(declare-fun b_and!1955 () Bool)

(assert (=> start!4276 (= tp!4849 b_and!1955)))

(declare-fun res!19882 () Bool)

(declare-fun e!20807 () Bool)

(assert (=> start!4276 (=> (not res!19882) (not e!20807))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4276 (= res!19882 (validMask!0 mask!2294))))

(assert (=> start!4276 e!20807))

(assert (=> start!4276 true))

(assert (=> start!4276 tp!4849))

(declare-datatypes ((V!1819 0))(
  ( (V!1820 (val!774 Int)) )
))
(declare-datatypes ((ValueCell!548 0))(
  ( (ValueCellFull!548 (v!1865 V!1819)) (EmptyCell!548) )
))
(declare-datatypes ((array!2203 0))(
  ( (array!2204 (arr!1053 (Array (_ BitVec 32) ValueCell!548)) (size!1154 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2203)

(declare-fun e!20806 () Bool)

(declare-fun array_inv!737 (array!2203) Bool)

(assert (=> start!4276 (and (array_inv!737 _values!1501) e!20806)))

(declare-datatypes ((array!2205 0))(
  ( (array!2206 (arr!1054 (Array (_ BitVec 32) (_ BitVec 64))) (size!1155 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2205)

(declare-fun array_inv!738 (array!2205) Bool)

(assert (=> start!4276 (array_inv!738 _keys!1833)))

(declare-fun tp_is_empty!1495 () Bool)

(assert (=> start!4276 tp_is_empty!1495))

(declare-fun b!32738 () Bool)

(declare-fun e!20805 () Bool)

(assert (=> b!32738 (= e!20807 e!20805)))

(declare-fun res!19886 () Bool)

(assert (=> b!32738 (=> (not res!19886) (not e!20805))))

(declare-datatypes ((tuple2!1258 0))(
  ( (tuple2!1259 (_1!640 (_ BitVec 64)) (_2!640 V!1819)) )
))
(declare-datatypes ((List!852 0))(
  ( (Nil!849) (Cons!848 (h!1415 tuple2!1258) (t!3549 List!852)) )
))
(declare-datatypes ((ListLongMap!835 0))(
  ( (ListLongMap!836 (toList!433 List!852)) )
))
(declare-fun lt!11875 () ListLongMap!835)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!375 (ListLongMap!835 (_ BitVec 64)) Bool)

(assert (=> b!32738 (= res!19886 (not (contains!375 lt!11875 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1819)

(declare-fun minValue!1443 () V!1819)

(declare-fun getCurrentListMap!261 (array!2205 array!2203 (_ BitVec 32) (_ BitVec 32) V!1819 V!1819 (_ BitVec 32) Int) ListLongMap!835)

(assert (=> b!32738 (= lt!11875 (getCurrentListMap!261 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1777 () Bool)

(declare-fun mapRes!1777 () Bool)

(declare-fun tp!4848 () Bool)

(declare-fun e!20802 () Bool)

(assert (=> mapNonEmpty!1777 (= mapRes!1777 (and tp!4848 e!20802))))

(declare-fun mapValue!1777 () ValueCell!548)

(declare-fun mapRest!1777 () (Array (_ BitVec 32) ValueCell!548))

(declare-fun mapKey!1777 () (_ BitVec 32))

(assert (=> mapNonEmpty!1777 (= (arr!1053 _values!1501) (store mapRest!1777 mapKey!1777 mapValue!1777))))

(declare-fun b!32739 () Bool)

(assert (=> b!32739 (= e!20805 (not (= (size!1155 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!11874 () (_ BitVec 32))

(assert (=> b!32739 (contains!375 lt!11875 (select (arr!1054 _keys!1833) lt!11874))))

(declare-datatypes ((Unit!713 0))(
  ( (Unit!714) )
))
(declare-fun lt!11876 () Unit!713)

(declare-fun lemmaValidKeyInArrayIsInListMap!46 (array!2205 array!2203 (_ BitVec 32) (_ BitVec 32) V!1819 V!1819 (_ BitVec 32) Int) Unit!713)

(assert (=> b!32739 (= lt!11876 (lemmaValidKeyInArrayIsInListMap!46 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11874 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2205 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32739 (= lt!11874 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32740 () Bool)

(declare-fun res!19884 () Bool)

(assert (=> b!32740 (=> (not res!19884) (not e!20805))))

(declare-fun arrayContainsKey!0 (array!2205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32740 (= res!19884 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32741 () Bool)

(declare-fun e!20803 () Bool)

(assert (=> b!32741 (= e!20806 (and e!20803 mapRes!1777))))

(declare-fun condMapEmpty!1777 () Bool)

(declare-fun mapDefault!1777 () ValueCell!548)

