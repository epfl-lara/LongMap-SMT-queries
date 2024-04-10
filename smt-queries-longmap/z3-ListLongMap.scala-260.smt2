; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4284 () Bool)

(assert start!4284)

(declare-fun b_free!1149 () Bool)

(declare-fun b_next!1149 () Bool)

(assert (=> start!4284 (= b_free!1149 (not b_next!1149))))

(declare-fun tp!4873 () Bool)

(declare-fun b_and!1963 () Bool)

(assert (=> start!4284 (= tp!4873 b_and!1963)))

(declare-fun b!32858 () Bool)

(declare-fun res!19967 () Bool)

(declare-fun e!20876 () Bool)

(assert (=> b!32858 (=> (not res!19967) (not e!20876))))

(declare-datatypes ((array!2219 0))(
  ( (array!2220 (arr!1061 (Array (_ BitVec 32) (_ BitVec 64))) (size!1162 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2219)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2219 (_ BitVec 32)) Bool)

(assert (=> b!32858 (= res!19967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32859 () Bool)

(declare-fun res!19971 () Bool)

(declare-fun e!20875 () Bool)

(assert (=> b!32859 (=> (not res!19971) (not e!20875))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32859 (= res!19971 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32860 () Bool)

(declare-fun res!19969 () Bool)

(assert (=> b!32860 (=> (not res!19969) (not e!20876))))

(declare-datatypes ((V!1829 0))(
  ( (V!1830 (val!778 Int)) )
))
(declare-datatypes ((ValueCell!552 0))(
  ( (ValueCellFull!552 (v!1869 V!1829)) (EmptyCell!552) )
))
(declare-datatypes ((array!2221 0))(
  ( (array!2222 (arr!1062 (Array (_ BitVec 32) ValueCell!552)) (size!1163 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2221)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!32860 (= res!19969 (and (= (size!1163 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1162 _keys!1833) (size!1163 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1789 () Bool)

(declare-fun mapRes!1789 () Bool)

(assert (=> mapIsEmpty!1789 mapRes!1789))

(declare-fun b!32861 () Bool)

(assert (=> b!32861 (= e!20876 e!20875)))

(declare-fun res!19968 () Bool)

(assert (=> b!32861 (=> (not res!19968) (not e!20875))))

(declare-datatypes ((tuple2!1266 0))(
  ( (tuple2!1267 (_1!644 (_ BitVec 64)) (_2!644 V!1829)) )
))
(declare-datatypes ((List!859 0))(
  ( (Nil!856) (Cons!855 (h!1422 tuple2!1266) (t!3556 List!859)) )
))
(declare-datatypes ((ListLongMap!843 0))(
  ( (ListLongMap!844 (toList!437 List!859)) )
))
(declare-fun lt!11911 () ListLongMap!843)

(declare-fun contains!379 (ListLongMap!843 (_ BitVec 64)) Bool)

(assert (=> b!32861 (= res!19968 (not (contains!379 lt!11911 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1829)

(declare-fun minValue!1443 () V!1829)

(declare-fun getCurrentListMap!265 (array!2219 array!2221 (_ BitVec 32) (_ BitVec 32) V!1829 V!1829 (_ BitVec 32) Int) ListLongMap!843)

(assert (=> b!32861 (= lt!11911 (getCurrentListMap!265 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32862 () Bool)

(assert (=> b!32862 (= e!20875 (not true))))

(declare-fun lt!11910 () (_ BitVec 32))

(assert (=> b!32862 (contains!379 lt!11911 (select (arr!1061 _keys!1833) lt!11910))))

(declare-datatypes ((Unit!721 0))(
  ( (Unit!722) )
))
(declare-fun lt!11912 () Unit!721)

(declare-fun lemmaValidKeyInArrayIsInListMap!50 (array!2219 array!2221 (_ BitVec 32) (_ BitVec 32) V!1829 V!1829 (_ BitVec 32) Int) Unit!721)

(assert (=> b!32862 (= lt!11912 (lemmaValidKeyInArrayIsInListMap!50 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11910 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2219 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32862 (= lt!11910 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1789 () Bool)

(declare-fun tp!4872 () Bool)

(declare-fun e!20878 () Bool)

(assert (=> mapNonEmpty!1789 (= mapRes!1789 (and tp!4872 e!20878))))

(declare-fun mapKey!1789 () (_ BitVec 32))

(declare-fun mapValue!1789 () ValueCell!552)

(declare-fun mapRest!1789 () (Array (_ BitVec 32) ValueCell!552))

(assert (=> mapNonEmpty!1789 (= (arr!1062 _values!1501) (store mapRest!1789 mapKey!1789 mapValue!1789))))

(declare-fun b!32863 () Bool)

(declare-fun res!19970 () Bool)

(assert (=> b!32863 (=> (not res!19970) (not e!20876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32863 (= res!19970 (validKeyInArray!0 k0!1304))))

(declare-fun b!32864 () Bool)

(declare-fun res!19966 () Bool)

(assert (=> b!32864 (=> (not res!19966) (not e!20876))))

(declare-datatypes ((List!860 0))(
  ( (Nil!857) (Cons!856 (h!1423 (_ BitVec 64)) (t!3557 List!860)) )
))
(declare-fun arrayNoDuplicates!0 (array!2219 (_ BitVec 32) List!860) Bool)

(assert (=> b!32864 (= res!19966 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!857))))

(declare-fun b!32865 () Bool)

(declare-fun e!20877 () Bool)

(declare-fun e!20879 () Bool)

(assert (=> b!32865 (= e!20877 (and e!20879 mapRes!1789))))

(declare-fun condMapEmpty!1789 () Bool)

(declare-fun mapDefault!1789 () ValueCell!552)

(assert (=> b!32865 (= condMapEmpty!1789 (= (arr!1062 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!552)) mapDefault!1789)))))

(declare-fun res!19965 () Bool)

(assert (=> start!4284 (=> (not res!19965) (not e!20876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4284 (= res!19965 (validMask!0 mask!2294))))

(assert (=> start!4284 e!20876))

(assert (=> start!4284 true))

(assert (=> start!4284 tp!4873))

(declare-fun array_inv!743 (array!2221) Bool)

(assert (=> start!4284 (and (array_inv!743 _values!1501) e!20877)))

(declare-fun array_inv!744 (array!2219) Bool)

(assert (=> start!4284 (array_inv!744 _keys!1833)))

(declare-fun tp_is_empty!1503 () Bool)

(assert (=> start!4284 tp_is_empty!1503))

(declare-fun b!32866 () Bool)

(assert (=> b!32866 (= e!20878 tp_is_empty!1503)))

(declare-fun b!32867 () Bool)

(assert (=> b!32867 (= e!20879 tp_is_empty!1503)))

(assert (= (and start!4284 res!19965) b!32860))

(assert (= (and b!32860 res!19969) b!32858))

(assert (= (and b!32858 res!19967) b!32864))

(assert (= (and b!32864 res!19966) b!32863))

(assert (= (and b!32863 res!19970) b!32861))

(assert (= (and b!32861 res!19968) b!32859))

(assert (= (and b!32859 res!19971) b!32862))

(assert (= (and b!32865 condMapEmpty!1789) mapIsEmpty!1789))

(assert (= (and b!32865 (not condMapEmpty!1789)) mapNonEmpty!1789))

(get-info :version)

(assert (= (and mapNonEmpty!1789 ((_ is ValueCellFull!552) mapValue!1789)) b!32866))

(assert (= (and b!32865 ((_ is ValueCellFull!552) mapDefault!1789)) b!32867))

(assert (= start!4284 b!32865))

(declare-fun m!26301 () Bool)

(assert (=> b!32861 m!26301))

(declare-fun m!26303 () Bool)

(assert (=> b!32861 m!26303))

(declare-fun m!26305 () Bool)

(assert (=> mapNonEmpty!1789 m!26305))

(declare-fun m!26307 () Bool)

(assert (=> b!32864 m!26307))

(declare-fun m!26309 () Bool)

(assert (=> start!4284 m!26309))

(declare-fun m!26311 () Bool)

(assert (=> start!4284 m!26311))

(declare-fun m!26313 () Bool)

(assert (=> start!4284 m!26313))

(declare-fun m!26315 () Bool)

(assert (=> b!32863 m!26315))

(declare-fun m!26317 () Bool)

(assert (=> b!32859 m!26317))

(declare-fun m!26319 () Bool)

(assert (=> b!32862 m!26319))

(assert (=> b!32862 m!26319))

(declare-fun m!26321 () Bool)

(assert (=> b!32862 m!26321))

(declare-fun m!26323 () Bool)

(assert (=> b!32862 m!26323))

(declare-fun m!26325 () Bool)

(assert (=> b!32862 m!26325))

(declare-fun m!26327 () Bool)

(assert (=> b!32858 m!26327))

(check-sat (not b!32863) (not b!32859) (not mapNonEmpty!1789) (not b!32858) (not b!32864) (not start!4284) (not b!32861) (not b_next!1149) b_and!1963 (not b!32862) tp_is_empty!1503)
(check-sat b_and!1963 (not b_next!1149))
