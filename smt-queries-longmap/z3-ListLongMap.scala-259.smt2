; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4266 () Bool)

(assert start!4266)

(declare-fun b_free!1141 () Bool)

(declare-fun b_next!1141 () Bool)

(assert (=> start!4266 (= b_free!1141 (not b_next!1141))))

(declare-fun tp!4848 () Bool)

(declare-fun b_and!1949 () Bool)

(assert (=> start!4266 (= tp!4848 b_and!1949)))

(declare-fun b!32684 () Bool)

(declare-fun res!19849 () Bool)

(declare-fun e!20764 () Bool)

(assert (=> b!32684 (=> (not res!19849) (not e!20764))))

(declare-datatypes ((array!2177 0))(
  ( (array!2178 (arr!1040 (Array (_ BitVec 32) (_ BitVec 64))) (size!1141 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2177)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2177 (_ BitVec 32)) Bool)

(assert (=> b!32684 (= res!19849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32685 () Bool)

(declare-fun e!20762 () Bool)

(declare-fun tp_is_empty!1495 () Bool)

(assert (=> b!32685 (= e!20762 tp_is_empty!1495)))

(declare-fun b!32686 () Bool)

(declare-fun e!20761 () Bool)

(assert (=> b!32686 (= e!20761 (not (= (size!1141 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((V!1819 0))(
  ( (V!1820 (val!774 Int)) )
))
(declare-datatypes ((tuple2!1260 0))(
  ( (tuple2!1261 (_1!641 (_ BitVec 64)) (_2!641 V!1819)) )
))
(declare-datatypes ((List!843 0))(
  ( (Nil!840) (Cons!839 (h!1406 tuple2!1260) (t!3533 List!843)) )
))
(declare-datatypes ((ListLongMap!825 0))(
  ( (ListLongMap!826 (toList!428 List!843)) )
))
(declare-fun lt!11871 () ListLongMap!825)

(declare-fun lt!11872 () (_ BitVec 32))

(declare-fun contains!371 (ListLongMap!825 (_ BitVec 64)) Bool)

(assert (=> b!32686 (contains!371 lt!11871 (select (arr!1040 _keys!1833) lt!11872))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((Unit!720 0))(
  ( (Unit!721) )
))
(declare-fun lt!11870 () Unit!720)

(declare-datatypes ((ValueCell!548 0))(
  ( (ValueCellFull!548 (v!1864 V!1819)) (EmptyCell!548) )
))
(declare-datatypes ((array!2179 0))(
  ( (array!2180 (arr!1041 (Array (_ BitVec 32) ValueCell!548)) (size!1142 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2179)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1819)

(declare-fun minValue!1443 () V!1819)

(declare-fun lemmaValidKeyInArrayIsInListMap!46 (array!2177 array!2179 (_ BitVec 32) (_ BitVec 32) V!1819 V!1819 (_ BitVec 32) Int) Unit!720)

(assert (=> b!32686 (= lt!11870 (lemmaValidKeyInArrayIsInListMap!46 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11872 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2177 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32686 (= lt!11872 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1777 () Bool)

(declare-fun mapRes!1777 () Bool)

(declare-fun tp!4849 () Bool)

(assert (=> mapNonEmpty!1777 (= mapRes!1777 (and tp!4849 e!20762))))

(declare-fun mapRest!1777 () (Array (_ BitVec 32) ValueCell!548))

(declare-fun mapKey!1777 () (_ BitVec 32))

(declare-fun mapValue!1777 () ValueCell!548)

(assert (=> mapNonEmpty!1777 (= (arr!1041 _values!1501) (store mapRest!1777 mapKey!1777 mapValue!1777))))

(declare-fun b!32687 () Bool)

(assert (=> b!32687 (= e!20764 e!20761)))

(declare-fun res!19852 () Bool)

(assert (=> b!32687 (=> (not res!19852) (not e!20761))))

(assert (=> b!32687 (= res!19852 (not (contains!371 lt!11871 k0!1304)))))

(declare-fun getCurrentListMap!251 (array!2177 array!2179 (_ BitVec 32) (_ BitVec 32) V!1819 V!1819 (_ BitVec 32) Int) ListLongMap!825)

(assert (=> b!32687 (= lt!11871 (getCurrentListMap!251 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1777 () Bool)

(assert (=> mapIsEmpty!1777 mapRes!1777))

(declare-fun b!32689 () Bool)

(declare-fun e!20760 () Bool)

(declare-fun e!20763 () Bool)

(assert (=> b!32689 (= e!20760 (and e!20763 mapRes!1777))))

(declare-fun condMapEmpty!1777 () Bool)

(declare-fun mapDefault!1777 () ValueCell!548)

(assert (=> b!32689 (= condMapEmpty!1777 (= (arr!1041 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!548)) mapDefault!1777)))))

(declare-fun b!32690 () Bool)

(declare-fun res!19853 () Bool)

(assert (=> b!32690 (=> (not res!19853) (not e!20764))))

(declare-datatypes ((List!844 0))(
  ( (Nil!841) (Cons!840 (h!1407 (_ BitVec 64)) (t!3534 List!844)) )
))
(declare-fun arrayNoDuplicates!0 (array!2177 (_ BitVec 32) List!844) Bool)

(assert (=> b!32690 (= res!19853 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!841))))

(declare-fun b!32691 () Bool)

(declare-fun res!19850 () Bool)

(assert (=> b!32691 (=> (not res!19850) (not e!20764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32691 (= res!19850 (validKeyInArray!0 k0!1304))))

(declare-fun b!32692 () Bool)

(declare-fun res!19855 () Bool)

(assert (=> b!32692 (=> (not res!19855) (not e!20761))))

(declare-fun arrayContainsKey!0 (array!2177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32692 (= res!19855 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32693 () Bool)

(assert (=> b!32693 (= e!20763 tp_is_empty!1495)))

(declare-fun b!32688 () Bool)

(declare-fun res!19854 () Bool)

(assert (=> b!32688 (=> (not res!19854) (not e!20764))))

(assert (=> b!32688 (= res!19854 (and (= (size!1142 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1141 _keys!1833) (size!1142 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!19851 () Bool)

(assert (=> start!4266 (=> (not res!19851) (not e!20764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4266 (= res!19851 (validMask!0 mask!2294))))

(assert (=> start!4266 e!20764))

(assert (=> start!4266 true))

(assert (=> start!4266 tp!4848))

(declare-fun array_inv!735 (array!2179) Bool)

(assert (=> start!4266 (and (array_inv!735 _values!1501) e!20760)))

(declare-fun array_inv!736 (array!2177) Bool)

(assert (=> start!4266 (array_inv!736 _keys!1833)))

(assert (=> start!4266 tp_is_empty!1495))

(assert (= (and start!4266 res!19851) b!32688))

(assert (= (and b!32688 res!19854) b!32684))

(assert (= (and b!32684 res!19849) b!32690))

(assert (= (and b!32690 res!19853) b!32691))

(assert (= (and b!32691 res!19850) b!32687))

(assert (= (and b!32687 res!19852) b!32692))

(assert (= (and b!32692 res!19855) b!32686))

(assert (= (and b!32689 condMapEmpty!1777) mapIsEmpty!1777))

(assert (= (and b!32689 (not condMapEmpty!1777)) mapNonEmpty!1777))

(get-info :version)

(assert (= (and mapNonEmpty!1777 ((_ is ValueCellFull!548) mapValue!1777)) b!32685))

(assert (= (and b!32689 ((_ is ValueCellFull!548) mapDefault!1777)) b!32693))

(assert (= start!4266 b!32689))

(declare-fun m!26119 () Bool)

(assert (=> b!32690 m!26119))

(declare-fun m!26121 () Bool)

(assert (=> b!32691 m!26121))

(declare-fun m!26123 () Bool)

(assert (=> b!32684 m!26123))

(declare-fun m!26125 () Bool)

(assert (=> b!32686 m!26125))

(assert (=> b!32686 m!26125))

(declare-fun m!26127 () Bool)

(assert (=> b!32686 m!26127))

(declare-fun m!26129 () Bool)

(assert (=> b!32686 m!26129))

(declare-fun m!26131 () Bool)

(assert (=> b!32686 m!26131))

(declare-fun m!26133 () Bool)

(assert (=> mapNonEmpty!1777 m!26133))

(declare-fun m!26135 () Bool)

(assert (=> start!4266 m!26135))

(declare-fun m!26137 () Bool)

(assert (=> start!4266 m!26137))

(declare-fun m!26139 () Bool)

(assert (=> start!4266 m!26139))

(declare-fun m!26141 () Bool)

(assert (=> b!32692 m!26141))

(declare-fun m!26143 () Bool)

(assert (=> b!32687 m!26143))

(declare-fun m!26145 () Bool)

(assert (=> b!32687 m!26145))

(check-sat (not b!32687) (not start!4266) b_and!1949 (not mapNonEmpty!1777) (not b_next!1141) (not b!32686) tp_is_empty!1495 (not b!32690) (not b!32692) (not b!32684) (not b!32691))
(check-sat b_and!1949 (not b_next!1141))
