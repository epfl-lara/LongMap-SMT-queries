; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4064 () Bool)

(assert start!4064)

(declare-fun b_free!973 () Bool)

(declare-fun b_next!973 () Bool)

(assert (=> start!4064 (= b_free!973 (not b_next!973))))

(declare-fun tp!4338 () Bool)

(declare-fun b_and!1773 () Bool)

(assert (=> start!4064 (= tp!4338 b_and!1773)))

(declare-fun res!17987 () Bool)

(declare-fun e!19254 () Bool)

(assert (=> start!4064 (=> (not res!17987) (not e!19254))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4064 (= res!17987 (validMask!0 mask!2294))))

(assert (=> start!4064 e!19254))

(assert (=> start!4064 true))

(assert (=> start!4064 tp!4338))

(declare-datatypes ((V!1595 0))(
  ( (V!1596 (val!690 Int)) )
))
(declare-datatypes ((ValueCell!464 0))(
  ( (ValueCellFull!464 (v!1779 V!1595)) (EmptyCell!464) )
))
(declare-datatypes ((array!1865 0))(
  ( (array!1866 (arr!886 (Array (_ BitVec 32) ValueCell!464)) (size!987 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1865)

(declare-fun e!19256 () Bool)

(declare-fun array_inv!613 (array!1865) Bool)

(assert (=> start!4064 (and (array_inv!613 _values!1501) e!19256)))

(declare-datatypes ((array!1867 0))(
  ( (array!1868 (arr!887 (Array (_ BitVec 32) (_ BitVec 64))) (size!988 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1867)

(declare-fun array_inv!614 (array!1867) Bool)

(assert (=> start!4064 (array_inv!614 _keys!1833)))

(declare-fun tp_is_empty!1327 () Bool)

(assert (=> start!4064 tp_is_empty!1327))

(declare-fun b!29913 () Bool)

(declare-fun res!17986 () Bool)

(assert (=> b!29913 (=> (not res!17986) (not e!19254))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29913 (= res!17986 (validKeyInArray!0 k0!1304))))

(declare-fun b!29914 () Bool)

(declare-fun res!17984 () Bool)

(assert (=> b!29914 (=> (not res!17984) (not e!19254))))

(declare-datatypes ((List!729 0))(
  ( (Nil!726) (Cons!725 (h!1292 (_ BitVec 64)) (t!3416 List!729)) )
))
(declare-fun arrayNoDuplicates!0 (array!1867 (_ BitVec 32) List!729) Bool)

(assert (=> b!29914 (= res!17984 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!726))))

(declare-fun b!29915 () Bool)

(declare-fun res!17985 () Bool)

(assert (=> b!29915 (=> (not res!17985) (not e!19254))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1595)

(declare-fun minValue!1443 () V!1595)

(declare-datatypes ((tuple2!1136 0))(
  ( (tuple2!1137 (_1!579 (_ BitVec 64)) (_2!579 V!1595)) )
))
(declare-datatypes ((List!730 0))(
  ( (Nil!727) (Cons!726 (h!1293 tuple2!1136) (t!3417 List!730)) )
))
(declare-datatypes ((ListLongMap!707 0))(
  ( (ListLongMap!708 (toList!369 List!730)) )
))
(declare-fun contains!311 (ListLongMap!707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!194 (array!1867 array!1865 (_ BitVec 32) (_ BitVec 32) V!1595 V!1595 (_ BitVec 32) Int) ListLongMap!707)

(assert (=> b!29915 (= res!17985 (not (contains!311 (getCurrentListMap!194 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!29916 () Bool)

(declare-fun res!17990 () Bool)

(assert (=> b!29916 (=> (not res!17990) (not e!19254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1867 (_ BitVec 32)) Bool)

(assert (=> b!29916 (= res!17990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29917 () Bool)

(declare-fun e!19258 () Bool)

(assert (=> b!29917 (= e!19258 tp_is_empty!1327)))

(declare-fun b!29918 () Bool)

(declare-fun res!17988 () Bool)

(assert (=> b!29918 (=> (not res!17988) (not e!19254))))

(declare-fun arrayContainsKey!0 (array!1867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29918 (= res!17988 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!1519 () Bool)

(declare-fun mapRes!1519 () Bool)

(assert (=> mapIsEmpty!1519 mapRes!1519))

(declare-fun b!29919 () Bool)

(assert (=> b!29919 (= e!19256 (and e!19258 mapRes!1519))))

(declare-fun condMapEmpty!1519 () Bool)

(declare-fun mapDefault!1519 () ValueCell!464)

(assert (=> b!29919 (= condMapEmpty!1519 (= (arr!886 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!464)) mapDefault!1519)))))

(declare-fun b!29920 () Bool)

(declare-fun res!17989 () Bool)

(assert (=> b!29920 (=> (not res!17989) (not e!19254))))

(assert (=> b!29920 (= res!17989 (and (= (size!987 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!988 _keys!1833) (size!987 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29921 () Bool)

(assert (=> b!29921 (= e!19254 false)))

(declare-datatypes ((SeekEntryResult!95 0))(
  ( (MissingZero!95 (index!2502 (_ BitVec 32))) (Found!95 (index!2503 (_ BitVec 32))) (Intermediate!95 (undefined!907 Bool) (index!2504 (_ BitVec 32)) (x!6485 (_ BitVec 32))) (Undefined!95) (MissingVacant!95 (index!2505 (_ BitVec 32))) )
))
(declare-fun lt!11331 () SeekEntryResult!95)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1867 (_ BitVec 32)) SeekEntryResult!95)

(assert (=> b!29921 (= lt!11331 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!29922 () Bool)

(declare-fun e!19255 () Bool)

(assert (=> b!29922 (= e!19255 tp_is_empty!1327)))

(declare-fun mapNonEmpty!1519 () Bool)

(declare-fun tp!4339 () Bool)

(assert (=> mapNonEmpty!1519 (= mapRes!1519 (and tp!4339 e!19255))))

(declare-fun mapRest!1519 () (Array (_ BitVec 32) ValueCell!464))

(declare-fun mapValue!1519 () ValueCell!464)

(declare-fun mapKey!1519 () (_ BitVec 32))

(assert (=> mapNonEmpty!1519 (= (arr!886 _values!1501) (store mapRest!1519 mapKey!1519 mapValue!1519))))

(assert (= (and start!4064 res!17987) b!29920))

(assert (= (and b!29920 res!17989) b!29916))

(assert (= (and b!29916 res!17990) b!29914))

(assert (= (and b!29914 res!17984) b!29913))

(assert (= (and b!29913 res!17986) b!29915))

(assert (= (and b!29915 res!17985) b!29918))

(assert (= (and b!29918 res!17988) b!29921))

(assert (= (and b!29919 condMapEmpty!1519) mapIsEmpty!1519))

(assert (= (and b!29919 (not condMapEmpty!1519)) mapNonEmpty!1519))

(get-info :version)

(assert (= (and mapNonEmpty!1519 ((_ is ValueCellFull!464) mapValue!1519)) b!29922))

(assert (= (and b!29919 ((_ is ValueCellFull!464) mapDefault!1519)) b!29917))

(assert (= start!4064 b!29919))

(declare-fun m!23969 () Bool)

(assert (=> mapNonEmpty!1519 m!23969))

(declare-fun m!23971 () Bool)

(assert (=> b!29921 m!23971))

(declare-fun m!23973 () Bool)

(assert (=> b!29915 m!23973))

(assert (=> b!29915 m!23973))

(declare-fun m!23975 () Bool)

(assert (=> b!29915 m!23975))

(declare-fun m!23977 () Bool)

(assert (=> b!29916 m!23977))

(declare-fun m!23979 () Bool)

(assert (=> b!29914 m!23979))

(declare-fun m!23981 () Bool)

(assert (=> start!4064 m!23981))

(declare-fun m!23983 () Bool)

(assert (=> start!4064 m!23983))

(declare-fun m!23985 () Bool)

(assert (=> start!4064 m!23985))

(declare-fun m!23987 () Bool)

(assert (=> b!29913 m!23987))

(declare-fun m!23989 () Bool)

(assert (=> b!29918 m!23989))

(check-sat b_and!1773 tp_is_empty!1327 (not b!29921) (not start!4064) (not mapNonEmpty!1519) (not b!29916) (not b_next!973) (not b!29915) (not b!29913) (not b!29914) (not b!29918))
(check-sat b_and!1773 (not b_next!973))
