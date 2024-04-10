; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4326 () Bool)

(assert start!4326)

(declare-fun b_free!1167 () Bool)

(declare-fun b_next!1167 () Bool)

(assert (=> start!4326 (= b_free!1167 (not b_next!1167))))

(declare-fun tp!4930 () Bool)

(declare-fun b_and!1983 () Bool)

(assert (=> start!4326 (= tp!4930 b_and!1983)))

(declare-fun mapNonEmpty!1819 () Bool)

(declare-fun mapRes!1819 () Bool)

(declare-fun tp!4929 () Bool)

(declare-fun e!21141 () Bool)

(assert (=> mapNonEmpty!1819 (= mapRes!1819 (and tp!4929 e!21141))))

(declare-fun mapKey!1819 () (_ BitVec 32))

(declare-datatypes ((V!1853 0))(
  ( (V!1854 (val!787 Int)) )
))
(declare-datatypes ((ValueCell!561 0))(
  ( (ValueCellFull!561 (v!1879 V!1853)) (EmptyCell!561) )
))
(declare-fun mapValue!1819 () ValueCell!561)

(declare-datatypes ((array!2257 0))(
  ( (array!2258 (arr!1079 (Array (_ BitVec 32) ValueCell!561)) (size!1180 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2257)

(declare-fun mapRest!1819 () (Array (_ BitVec 32) ValueCell!561))

(assert (=> mapNonEmpty!1819 (= (arr!1079 _values!1501) (store mapRest!1819 mapKey!1819 mapValue!1819))))

(declare-fun b!33282 () Bool)

(declare-fun tp_is_empty!1521 () Bool)

(assert (=> b!33282 (= e!21141 tp_is_empty!1521)))

(declare-fun b!33283 () Bool)

(declare-fun e!21144 () Bool)

(assert (=> b!33283 (= e!21144 (not true))))

(declare-datatypes ((SeekEntryResult!126 0))(
  ( (MissingZero!126 (index!2626 (_ BitVec 32))) (Found!126 (index!2627 (_ BitVec 32))) (Intermediate!126 (undefined!938 Bool) (index!2628 (_ BitVec 32)) (x!6802 (_ BitVec 32))) (Undefined!126) (MissingVacant!126 (index!2629 (_ BitVec 32))) )
))
(declare-fun lt!12111 () SeekEntryResult!126)

(declare-fun lt!12110 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33283 (and ((_ is Found!126) lt!12111) (= (index!2627 lt!12111) lt!12110))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((array!2259 0))(
  ( (array!2260 (arr!1080 (Array (_ BitVec 32) (_ BitVec 64))) (size!1181 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2259)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2259 (_ BitVec 32)) SeekEntryResult!126)

(assert (=> b!33283 (= lt!12111 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!740 0))(
  ( (Unit!741) )
))
(declare-fun lt!12109 () Unit!740)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2259 (_ BitVec 32)) Unit!740)

(assert (=> b!33283 (= lt!12109 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12110 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1284 0))(
  ( (tuple2!1285 (_1!653 (_ BitVec 64)) (_2!653 V!1853)) )
))
(declare-datatypes ((List!874 0))(
  ( (Nil!871) (Cons!870 (h!1437 tuple2!1284) (t!3573 List!874)) )
))
(declare-datatypes ((ListLongMap!861 0))(
  ( (ListLongMap!862 (toList!446 List!874)) )
))
(declare-fun lt!12107 () ListLongMap!861)

(declare-fun contains!389 (ListLongMap!861 (_ BitVec 64)) Bool)

(assert (=> b!33283 (contains!389 lt!12107 (select (arr!1080 _keys!1833) lt!12110))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!12108 () Unit!740)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1853)

(declare-fun minValue!1443 () V!1853)

(declare-fun lemmaValidKeyInArrayIsInListMap!58 (array!2259 array!2257 (_ BitVec 32) (_ BitVec 32) V!1853 V!1853 (_ BitVec 32) Int) Unit!740)

(assert (=> b!33283 (= lt!12108 (lemmaValidKeyInArrayIsInListMap!58 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12110 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2259 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33283 (= lt!12110 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33284 () Bool)

(declare-fun res!20221 () Bool)

(declare-fun e!21143 () Bool)

(assert (=> b!33284 (=> (not res!20221) (not e!21143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33284 (= res!20221 (validKeyInArray!0 k0!1304))))

(declare-fun res!20220 () Bool)

(assert (=> start!4326 (=> (not res!20220) (not e!21143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4326 (= res!20220 (validMask!0 mask!2294))))

(assert (=> start!4326 e!21143))

(assert (=> start!4326 true))

(assert (=> start!4326 tp!4930))

(declare-fun e!21142 () Bool)

(declare-fun array_inv!759 (array!2257) Bool)

(assert (=> start!4326 (and (array_inv!759 _values!1501) e!21142)))

(declare-fun array_inv!760 (array!2259) Bool)

(assert (=> start!4326 (array_inv!760 _keys!1833)))

(assert (=> start!4326 tp_is_empty!1521))

(declare-fun b!33285 () Bool)

(declare-fun res!20218 () Bool)

(assert (=> b!33285 (=> (not res!20218) (not e!21143))))

(assert (=> b!33285 (= res!20218 (and (= (size!1180 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1181 _keys!1833) (size!1180 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33286 () Bool)

(declare-fun res!20222 () Bool)

(assert (=> b!33286 (=> (not res!20222) (not e!21143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2259 (_ BitVec 32)) Bool)

(assert (=> b!33286 (= res!20222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33287 () Bool)

(assert (=> b!33287 (= e!21143 e!21144)))

(declare-fun res!20219 () Bool)

(assert (=> b!33287 (=> (not res!20219) (not e!21144))))

(assert (=> b!33287 (= res!20219 (not (contains!389 lt!12107 k0!1304)))))

(declare-fun getCurrentListMap!273 (array!2259 array!2257 (_ BitVec 32) (_ BitVec 32) V!1853 V!1853 (_ BitVec 32) Int) ListLongMap!861)

(assert (=> b!33287 (= lt!12107 (getCurrentListMap!273 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33288 () Bool)

(declare-fun e!21140 () Bool)

(assert (=> b!33288 (= e!21142 (and e!21140 mapRes!1819))))

(declare-fun condMapEmpty!1819 () Bool)

(declare-fun mapDefault!1819 () ValueCell!561)

(assert (=> b!33288 (= condMapEmpty!1819 (= (arr!1079 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!561)) mapDefault!1819)))))

(declare-fun b!33289 () Bool)

(assert (=> b!33289 (= e!21140 tp_is_empty!1521)))

(declare-fun b!33290 () Bool)

(declare-fun res!20224 () Bool)

(assert (=> b!33290 (=> (not res!20224) (not e!21144))))

(declare-fun arrayContainsKey!0 (array!2259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33290 (= res!20224 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33291 () Bool)

(declare-fun res!20223 () Bool)

(assert (=> b!33291 (=> (not res!20223) (not e!21143))))

(declare-datatypes ((List!875 0))(
  ( (Nil!872) (Cons!871 (h!1438 (_ BitVec 64)) (t!3574 List!875)) )
))
(declare-fun arrayNoDuplicates!0 (array!2259 (_ BitVec 32) List!875) Bool)

(assert (=> b!33291 (= res!20223 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!872))))

(declare-fun mapIsEmpty!1819 () Bool)

(assert (=> mapIsEmpty!1819 mapRes!1819))

(assert (= (and start!4326 res!20220) b!33285))

(assert (= (and b!33285 res!20218) b!33286))

(assert (= (and b!33286 res!20222) b!33291))

(assert (= (and b!33291 res!20223) b!33284))

(assert (= (and b!33284 res!20221) b!33287))

(assert (= (and b!33287 res!20219) b!33290))

(assert (= (and b!33290 res!20224) b!33283))

(assert (= (and b!33288 condMapEmpty!1819) mapIsEmpty!1819))

(assert (= (and b!33288 (not condMapEmpty!1819)) mapNonEmpty!1819))

(assert (= (and mapNonEmpty!1819 ((_ is ValueCellFull!561) mapValue!1819)) b!33282))

(assert (= (and b!33288 ((_ is ValueCellFull!561) mapDefault!1819)) b!33289))

(assert (= start!4326 b!33288))

(declare-fun m!26675 () Bool)

(assert (=> b!33286 m!26675))

(declare-fun m!26677 () Bool)

(assert (=> b!33283 m!26677))

(declare-fun m!26679 () Bool)

(assert (=> b!33283 m!26679))

(declare-fun m!26681 () Bool)

(assert (=> b!33283 m!26681))

(assert (=> b!33283 m!26679))

(declare-fun m!26683 () Bool)

(assert (=> b!33283 m!26683))

(declare-fun m!26685 () Bool)

(assert (=> b!33283 m!26685))

(declare-fun m!26687 () Bool)

(assert (=> b!33283 m!26687))

(declare-fun m!26689 () Bool)

(assert (=> b!33284 m!26689))

(declare-fun m!26691 () Bool)

(assert (=> start!4326 m!26691))

(declare-fun m!26693 () Bool)

(assert (=> start!4326 m!26693))

(declare-fun m!26695 () Bool)

(assert (=> start!4326 m!26695))

(declare-fun m!26697 () Bool)

(assert (=> b!33291 m!26697))

(declare-fun m!26699 () Bool)

(assert (=> b!33287 m!26699))

(declare-fun m!26701 () Bool)

(assert (=> b!33287 m!26701))

(declare-fun m!26703 () Bool)

(assert (=> b!33290 m!26703))

(declare-fun m!26705 () Bool)

(assert (=> mapNonEmpty!1819 m!26705))

(check-sat (not start!4326) (not b!33287) (not b!33290) (not b_next!1167) (not b!33286) b_and!1983 (not b!33284) (not mapNonEmpty!1819) (not b!33291) tp_is_empty!1521 (not b!33283))
(check-sat b_and!1983 (not b_next!1167))
