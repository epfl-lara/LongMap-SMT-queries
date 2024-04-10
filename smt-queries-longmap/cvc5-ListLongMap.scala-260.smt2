; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4282 () Bool)

(assert start!4282)

(declare-fun b_free!1147 () Bool)

(declare-fun b_next!1147 () Bool)

(assert (=> start!4282 (= b_free!1147 (not b_next!1147))))

(declare-fun tp!4867 () Bool)

(declare-fun b_and!1961 () Bool)

(assert (=> start!4282 (= tp!4867 b_and!1961)))

(declare-fun b!32828 () Bool)

(declare-fun res!19950 () Bool)

(declare-fun e!20859 () Bool)

(assert (=> b!32828 (=> (not res!19950) (not e!20859))))

(declare-datatypes ((array!2215 0))(
  ( (array!2216 (arr!1059 (Array (_ BitVec 32) (_ BitVec 64))) (size!1160 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2215)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32828 (= res!19950 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32830 () Bool)

(declare-fun res!19946 () Bool)

(declare-fun e!20860 () Bool)

(assert (=> b!32830 (=> (not res!19946) (not e!20860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32830 (= res!19946 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1786 () Bool)

(declare-fun mapRes!1786 () Bool)

(declare-fun tp!4866 () Bool)

(declare-fun e!20861 () Bool)

(assert (=> mapNonEmpty!1786 (= mapRes!1786 (and tp!4866 e!20861))))

(declare-datatypes ((V!1827 0))(
  ( (V!1828 (val!777 Int)) )
))
(declare-datatypes ((ValueCell!551 0))(
  ( (ValueCellFull!551 (v!1868 V!1827)) (EmptyCell!551) )
))
(declare-datatypes ((array!2217 0))(
  ( (array!2218 (arr!1060 (Array (_ BitVec 32) ValueCell!551)) (size!1161 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2217)

(declare-fun mapKey!1786 () (_ BitVec 32))

(declare-fun mapRest!1786 () (Array (_ BitVec 32) ValueCell!551))

(declare-fun mapValue!1786 () ValueCell!551)

(assert (=> mapNonEmpty!1786 (= (arr!1060 _values!1501) (store mapRest!1786 mapKey!1786 mapValue!1786))))

(declare-fun b!32831 () Bool)

(declare-fun e!20856 () Bool)

(declare-fun tp_is_empty!1501 () Bool)

(assert (=> b!32831 (= e!20856 tp_is_empty!1501)))

(declare-fun b!32832 () Bool)

(declare-fun res!19945 () Bool)

(assert (=> b!32832 (=> (not res!19945) (not e!20860))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!32832 (= res!19945 (and (= (size!1161 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1160 _keys!1833) (size!1161 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32833 () Bool)

(declare-fun res!19949 () Bool)

(assert (=> b!32833 (=> (not res!19949) (not e!20860))))

(declare-datatypes ((List!857 0))(
  ( (Nil!854) (Cons!853 (h!1420 (_ BitVec 64)) (t!3554 List!857)) )
))
(declare-fun arrayNoDuplicates!0 (array!2215 (_ BitVec 32) List!857) Bool)

(assert (=> b!32833 (= res!19949 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!854))))

(declare-fun res!19947 () Bool)

(assert (=> start!4282 (=> (not res!19947) (not e!20860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4282 (= res!19947 (validMask!0 mask!2294))))

(assert (=> start!4282 e!20860))

(assert (=> start!4282 true))

(assert (=> start!4282 tp!4867))

(declare-fun e!20857 () Bool)

(declare-fun array_inv!741 (array!2217) Bool)

(assert (=> start!4282 (and (array_inv!741 _values!1501) e!20857)))

(declare-fun array_inv!742 (array!2215) Bool)

(assert (=> start!4282 (array_inv!742 _keys!1833)))

(assert (=> start!4282 tp_is_empty!1501))

(declare-fun b!32829 () Bool)

(assert (=> b!32829 (= e!20861 tp_is_empty!1501)))

(declare-fun b!32834 () Bool)

(assert (=> b!32834 (= e!20859 (not true))))

(declare-datatypes ((tuple2!1264 0))(
  ( (tuple2!1265 (_1!643 (_ BitVec 64)) (_2!643 V!1827)) )
))
(declare-datatypes ((List!858 0))(
  ( (Nil!855) (Cons!854 (h!1421 tuple2!1264) (t!3555 List!858)) )
))
(declare-datatypes ((ListLongMap!841 0))(
  ( (ListLongMap!842 (toList!436 List!858)) )
))
(declare-fun lt!11903 () ListLongMap!841)

(declare-fun lt!11902 () (_ BitVec 32))

(declare-fun contains!378 (ListLongMap!841 (_ BitVec 64)) Bool)

(assert (=> b!32834 (contains!378 lt!11903 (select (arr!1059 _keys!1833) lt!11902))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1827)

(declare-fun minValue!1443 () V!1827)

(declare-datatypes ((Unit!719 0))(
  ( (Unit!720) )
))
(declare-fun lt!11901 () Unit!719)

(declare-fun lemmaValidKeyInArrayIsInListMap!49 (array!2215 array!2217 (_ BitVec 32) (_ BitVec 32) V!1827 V!1827 (_ BitVec 32) Int) Unit!719)

(assert (=> b!32834 (= lt!11901 (lemmaValidKeyInArrayIsInListMap!49 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11902 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2215 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32834 (= lt!11902 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32835 () Bool)

(assert (=> b!32835 (= e!20860 e!20859)))

(declare-fun res!19944 () Bool)

(assert (=> b!32835 (=> (not res!19944) (not e!20859))))

(assert (=> b!32835 (= res!19944 (not (contains!378 lt!11903 k!1304)))))

(declare-fun getCurrentListMap!264 (array!2215 array!2217 (_ BitVec 32) (_ BitVec 32) V!1827 V!1827 (_ BitVec 32) Int) ListLongMap!841)

(assert (=> b!32835 (= lt!11903 (getCurrentListMap!264 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1786 () Bool)

(assert (=> mapIsEmpty!1786 mapRes!1786))

(declare-fun b!32836 () Bool)

(assert (=> b!32836 (= e!20857 (and e!20856 mapRes!1786))))

(declare-fun condMapEmpty!1786 () Bool)

(declare-fun mapDefault!1786 () ValueCell!551)

