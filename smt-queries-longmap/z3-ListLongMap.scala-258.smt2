; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4260 () Bool)

(assert start!4260)

(declare-fun b_free!1135 () Bool)

(declare-fun b_next!1135 () Bool)

(assert (=> start!4260 (= b_free!1135 (not b_next!1135))))

(declare-fun tp!4831 () Bool)

(declare-fun b_and!1943 () Bool)

(assert (=> start!4260 (= tp!4831 b_and!1943)))

(declare-fun b!32594 () Bool)

(declare-fun e!20705 () Bool)

(declare-fun e!20710 () Bool)

(declare-fun mapRes!1768 () Bool)

(assert (=> b!32594 (= e!20705 (and e!20710 mapRes!1768))))

(declare-fun condMapEmpty!1768 () Bool)

(declare-datatypes ((V!1811 0))(
  ( (V!1812 (val!771 Int)) )
))
(declare-datatypes ((ValueCell!545 0))(
  ( (ValueCellFull!545 (v!1861 V!1811)) (EmptyCell!545) )
))
(declare-datatypes ((array!2165 0))(
  ( (array!2166 (arr!1034 (Array (_ BitVec 32) ValueCell!545)) (size!1135 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2165)

(declare-fun mapDefault!1768 () ValueCell!545)

(assert (=> b!32594 (= condMapEmpty!1768 (= (arr!1034 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!545)) mapDefault!1768)))))

(declare-fun b!32595 () Bool)

(declare-fun res!19786 () Bool)

(declare-fun e!20706 () Bool)

(assert (=> b!32595 (=> (not res!19786) (not e!20706))))

(declare-datatypes ((array!2167 0))(
  ( (array!2168 (arr!1035 (Array (_ BitVec 32) (_ BitVec 64))) (size!1136 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2167)

(declare-datatypes ((List!837 0))(
  ( (Nil!834) (Cons!833 (h!1400 (_ BitVec 64)) (t!3527 List!837)) )
))
(declare-fun arrayNoDuplicates!0 (array!2167 (_ BitVec 32) List!837) Bool)

(assert (=> b!32595 (= res!19786 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!834))))

(declare-fun b!32596 () Bool)

(declare-fun tp_is_empty!1489 () Bool)

(assert (=> b!32596 (= e!20710 tp_is_empty!1489)))

(declare-fun mapIsEmpty!1768 () Bool)

(assert (=> mapIsEmpty!1768 mapRes!1768))

(declare-fun b!32597 () Bool)

(declare-fun e!20709 () Bool)

(assert (=> b!32597 (= e!20709 (not true))))

(declare-datatypes ((tuple2!1254 0))(
  ( (tuple2!1255 (_1!638 (_ BitVec 64)) (_2!638 V!1811)) )
))
(declare-datatypes ((List!838 0))(
  ( (Nil!835) (Cons!834 (h!1401 tuple2!1254) (t!3528 List!838)) )
))
(declare-datatypes ((ListLongMap!819 0))(
  ( (ListLongMap!820 (toList!425 List!838)) )
))
(declare-fun lt!11845 () ListLongMap!819)

(declare-fun lt!11843 () (_ BitVec 32))

(declare-fun contains!368 (ListLongMap!819 (_ BitVec 64)) Bool)

(assert (=> b!32597 (contains!368 lt!11845 (select (arr!1035 _keys!1833) lt!11843))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((Unit!714 0))(
  ( (Unit!715) )
))
(declare-fun lt!11844 () Unit!714)

(declare-fun zeroValue!1443 () V!1811)

(declare-fun minValue!1443 () V!1811)

(declare-fun lemmaValidKeyInArrayIsInListMap!43 (array!2167 array!2165 (_ BitVec 32) (_ BitVec 32) V!1811 V!1811 (_ BitVec 32) Int) Unit!714)

(assert (=> b!32597 (= lt!11844 (lemmaValidKeyInArrayIsInListMap!43 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11843 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2167 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32597 (= lt!11843 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32598 () Bool)

(assert (=> b!32598 (= e!20706 e!20709)))

(declare-fun res!19790 () Bool)

(assert (=> b!32598 (=> (not res!19790) (not e!20709))))

(assert (=> b!32598 (= res!19790 (not (contains!368 lt!11845 k0!1304)))))

(declare-fun getCurrentListMap!248 (array!2167 array!2165 (_ BitVec 32) (_ BitVec 32) V!1811 V!1811 (_ BitVec 32) Int) ListLongMap!819)

(assert (=> b!32598 (= lt!11845 (getCurrentListMap!248 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32599 () Bool)

(declare-fun e!20708 () Bool)

(assert (=> b!32599 (= e!20708 tp_is_empty!1489)))

(declare-fun res!19787 () Bool)

(assert (=> start!4260 (=> (not res!19787) (not e!20706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4260 (= res!19787 (validMask!0 mask!2294))))

(assert (=> start!4260 e!20706))

(assert (=> start!4260 true))

(assert (=> start!4260 tp!4831))

(declare-fun array_inv!729 (array!2165) Bool)

(assert (=> start!4260 (and (array_inv!729 _values!1501) e!20705)))

(declare-fun array_inv!730 (array!2167) Bool)

(assert (=> start!4260 (array_inv!730 _keys!1833)))

(assert (=> start!4260 tp_is_empty!1489))

(declare-fun b!32600 () Bool)

(declare-fun res!19789 () Bool)

(assert (=> b!32600 (=> (not res!19789) (not e!20706))))

(assert (=> b!32600 (= res!19789 (and (= (size!1135 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1136 _keys!1833) (size!1135 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32601 () Bool)

(declare-fun res!19792 () Bool)

(assert (=> b!32601 (=> (not res!19792) (not e!20706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32601 (= res!19792 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1768 () Bool)

(declare-fun tp!4830 () Bool)

(assert (=> mapNonEmpty!1768 (= mapRes!1768 (and tp!4830 e!20708))))

(declare-fun mapKey!1768 () (_ BitVec 32))

(declare-fun mapValue!1768 () ValueCell!545)

(declare-fun mapRest!1768 () (Array (_ BitVec 32) ValueCell!545))

(assert (=> mapNonEmpty!1768 (= (arr!1034 _values!1501) (store mapRest!1768 mapKey!1768 mapValue!1768))))

(declare-fun b!32602 () Bool)

(declare-fun res!19788 () Bool)

(assert (=> b!32602 (=> (not res!19788) (not e!20706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2167 (_ BitVec 32)) Bool)

(assert (=> b!32602 (= res!19788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32603 () Bool)

(declare-fun res!19791 () Bool)

(assert (=> b!32603 (=> (not res!19791) (not e!20709))))

(declare-fun arrayContainsKey!0 (array!2167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32603 (= res!19791 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!4260 res!19787) b!32600))

(assert (= (and b!32600 res!19789) b!32602))

(assert (= (and b!32602 res!19788) b!32595))

(assert (= (and b!32595 res!19786) b!32601))

(assert (= (and b!32601 res!19792) b!32598))

(assert (= (and b!32598 res!19790) b!32603))

(assert (= (and b!32603 res!19791) b!32597))

(assert (= (and b!32594 condMapEmpty!1768) mapIsEmpty!1768))

(assert (= (and b!32594 (not condMapEmpty!1768)) mapNonEmpty!1768))

(get-info :version)

(assert (= (and mapNonEmpty!1768 ((_ is ValueCellFull!545) mapValue!1768)) b!32599))

(assert (= (and b!32594 ((_ is ValueCellFull!545) mapDefault!1768)) b!32596))

(assert (= start!4260 b!32594))

(declare-fun m!26035 () Bool)

(assert (=> start!4260 m!26035))

(declare-fun m!26037 () Bool)

(assert (=> start!4260 m!26037))

(declare-fun m!26039 () Bool)

(assert (=> start!4260 m!26039))

(declare-fun m!26041 () Bool)

(assert (=> b!32597 m!26041))

(assert (=> b!32597 m!26041))

(declare-fun m!26043 () Bool)

(assert (=> b!32597 m!26043))

(declare-fun m!26045 () Bool)

(assert (=> b!32597 m!26045))

(declare-fun m!26047 () Bool)

(assert (=> b!32597 m!26047))

(declare-fun m!26049 () Bool)

(assert (=> b!32598 m!26049))

(declare-fun m!26051 () Bool)

(assert (=> b!32598 m!26051))

(declare-fun m!26053 () Bool)

(assert (=> mapNonEmpty!1768 m!26053))

(declare-fun m!26055 () Bool)

(assert (=> b!32602 m!26055))

(declare-fun m!26057 () Bool)

(assert (=> b!32601 m!26057))

(declare-fun m!26059 () Bool)

(assert (=> b!32595 m!26059))

(declare-fun m!26061 () Bool)

(assert (=> b!32603 m!26061))

(check-sat (not start!4260) (not b!32597) (not b!32603) (not b_next!1135) (not b!32601) (not b!32595) tp_is_empty!1489 (not b!32602) (not b!32598) (not mapNonEmpty!1768) b_and!1943)
(check-sat b_and!1943 (not b_next!1135))
