; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77836 () Bool)

(assert start!77836)

(declare-fun b_free!16395 () Bool)

(declare-fun b_next!16395 () Bool)

(assert (=> start!77836 (= b_free!16395 (not b_next!16395))))

(declare-fun tp!57449 () Bool)

(declare-fun b_and!26947 () Bool)

(assert (=> start!77836 (= tp!57449 b_and!26947)))

(declare-fun b!908760 () Bool)

(declare-fun e!509342 () Bool)

(declare-fun e!509339 () Bool)

(assert (=> b!908760 (= e!509342 e!509339)))

(declare-fun res!613381 () Bool)

(assert (=> b!908760 (=> res!613381 e!509339)))

(declare-datatypes ((V!30049 0))(
  ( (V!30050 (val!9457 Int)) )
))
(declare-datatypes ((tuple2!12322 0))(
  ( (tuple2!12323 (_1!6172 (_ BitVec 64)) (_2!6172 V!30049)) )
))
(declare-datatypes ((List!18116 0))(
  ( (Nil!18113) (Cons!18112 (h!19258 tuple2!12322) (t!25683 List!18116)) )
))
(declare-datatypes ((ListLongMap!11019 0))(
  ( (ListLongMap!11020 (toList!5525 List!18116)) )
))
(declare-fun lt!409835 () ListLongMap!11019)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4568 (ListLongMap!11019 (_ BitVec 64)) Bool)

(assert (=> b!908760 (= res!613381 (not (contains!4568 lt!409835 k0!1033)))))

(declare-datatypes ((ValueCell!8925 0))(
  ( (ValueCellFull!8925 (v!11964 V!30049)) (EmptyCell!8925) )
))
(declare-datatypes ((array!53654 0))(
  ( (array!53655 (arr!25785 (Array (_ BitVec 32) ValueCell!8925)) (size!26244 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53654)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30049)

(declare-datatypes ((array!53656 0))(
  ( (array!53657 (arr!25786 (Array (_ BitVec 32) (_ BitVec 64))) (size!26245 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53656)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30049)

(declare-fun getCurrentListMap!2788 (array!53656 array!53654 (_ BitVec 32) (_ BitVec 32) V!30049 V!30049 (_ BitVec 32) Int) ListLongMap!11019)

(assert (=> b!908760 (= lt!409835 (getCurrentListMap!2788 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908761 () Bool)

(declare-fun res!613380 () Bool)

(declare-fun e!509340 () Bool)

(assert (=> b!908761 (=> (not res!613380) (not e!509340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53656 (_ BitVec 32)) Bool)

(assert (=> b!908761 (= res!613380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29935 () Bool)

(declare-fun mapRes!29935 () Bool)

(assert (=> mapIsEmpty!29935 mapRes!29935))

(declare-fun res!613382 () Bool)

(assert (=> start!77836 (=> (not res!613382) (not e!509340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77836 (= res!613382 (validMask!0 mask!1756))))

(assert (=> start!77836 e!509340))

(declare-fun e!509337 () Bool)

(declare-fun array_inv!20184 (array!53654) Bool)

(assert (=> start!77836 (and (array_inv!20184 _values!1152) e!509337)))

(assert (=> start!77836 tp!57449))

(assert (=> start!77836 true))

(declare-fun tp_is_empty!18813 () Bool)

(assert (=> start!77836 tp_is_empty!18813))

(declare-fun array_inv!20185 (array!53656) Bool)

(assert (=> start!77836 (array_inv!20185 _keys!1386)))

(declare-fun b!908762 () Bool)

(assert (=> b!908762 (= e!509339 true)))

(declare-fun lt!409832 () ListLongMap!11019)

(declare-fun lt!409833 () V!30049)

(declare-fun apply!505 (ListLongMap!11019 (_ BitVec 64)) V!30049)

(assert (=> b!908762 (= (apply!505 lt!409832 k0!1033) lt!409833)))

(declare-datatypes ((Unit!30842 0))(
  ( (Unit!30843) )
))
(declare-fun lt!409831 () Unit!30842)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!57 (array!53656 array!53654 (_ BitVec 32) (_ BitVec 32) V!30049 V!30049 (_ BitVec 64) V!30049 (_ BitVec 32) Int) Unit!30842)

(assert (=> b!908762 (= lt!409831 (lemmaListMapApplyFromThenApplyFromZero!57 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409833 i!717 defaultEntry!1160))))

(declare-fun b!908763 () Bool)

(declare-fun e!509338 () Bool)

(assert (=> b!908763 (= e!509338 (not e!509342))))

(declare-fun res!613379 () Bool)

(assert (=> b!908763 (=> res!613379 e!509342)))

(assert (=> b!908763 (= res!613379 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26245 _keys!1386))))))

(declare-fun get!13576 (ValueCell!8925 V!30049) V!30049)

(declare-fun dynLambda!1381 (Int (_ BitVec 64)) V!30049)

(assert (=> b!908763 (= lt!409833 (get!13576 (select (arr!25785 _values!1152) i!717) (dynLambda!1381 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908763 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409834 () Unit!30842)

(declare-fun lemmaKeyInListMapIsInArray!253 (array!53656 array!53654 (_ BitVec 32) (_ BitVec 32) V!30049 V!30049 (_ BitVec 64) Int) Unit!30842)

(assert (=> b!908763 (= lt!409834 (lemmaKeyInListMapIsInArray!253 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908764 () Bool)

(assert (=> b!908764 (= e!509340 e!509338)))

(declare-fun res!613377 () Bool)

(assert (=> b!908764 (=> (not res!613377) (not e!509338))))

(assert (=> b!908764 (= res!613377 (contains!4568 lt!409832 k0!1033))))

(assert (=> b!908764 (= lt!409832 (getCurrentListMap!2788 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908765 () Bool)

(declare-fun res!613374 () Bool)

(assert (=> b!908765 (=> (not res!613374) (not e!509338))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908765 (= res!613374 (inRange!0 i!717 mask!1756))))

(declare-fun b!908766 () Bool)

(declare-fun e!509343 () Bool)

(assert (=> b!908766 (= e!509337 (and e!509343 mapRes!29935))))

(declare-fun condMapEmpty!29935 () Bool)

(declare-fun mapDefault!29935 () ValueCell!8925)

(assert (=> b!908766 (= condMapEmpty!29935 (= (arr!25785 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8925)) mapDefault!29935)))))

(declare-fun b!908767 () Bool)

(declare-fun res!613376 () Bool)

(assert (=> b!908767 (=> (not res!613376) (not e!509340))))

(declare-datatypes ((List!18117 0))(
  ( (Nil!18114) (Cons!18113 (h!19259 (_ BitVec 64)) (t!25684 List!18117)) )
))
(declare-fun arrayNoDuplicates!0 (array!53656 (_ BitVec 32) List!18117) Bool)

(assert (=> b!908767 (= res!613376 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18114))))

(declare-fun mapNonEmpty!29935 () Bool)

(declare-fun tp!57450 () Bool)

(declare-fun e!509336 () Bool)

(assert (=> mapNonEmpty!29935 (= mapRes!29935 (and tp!57450 e!509336))))

(declare-fun mapRest!29935 () (Array (_ BitVec 32) ValueCell!8925))

(declare-fun mapKey!29935 () (_ BitVec 32))

(declare-fun mapValue!29935 () ValueCell!8925)

(assert (=> mapNonEmpty!29935 (= (arr!25785 _values!1152) (store mapRest!29935 mapKey!29935 mapValue!29935))))

(declare-fun b!908768 () Bool)

(assert (=> b!908768 (= e!509343 tp_is_empty!18813)))

(declare-fun b!908769 () Bool)

(assert (=> b!908769 (= e!509336 tp_is_empty!18813)))

(declare-fun b!908770 () Bool)

(declare-fun res!613383 () Bool)

(assert (=> b!908770 (=> res!613383 e!509339)))

(assert (=> b!908770 (= res!613383 (not (= (apply!505 lt!409835 k0!1033) lt!409833)))))

(declare-fun b!908771 () Bool)

(declare-fun res!613375 () Bool)

(assert (=> b!908771 (=> (not res!613375) (not e!509340))))

(assert (=> b!908771 (= res!613375 (and (= (size!26244 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26245 _keys!1386) (size!26244 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908772 () Bool)

(declare-fun res!613378 () Bool)

(assert (=> b!908772 (=> (not res!613378) (not e!509338))))

(assert (=> b!908772 (= res!613378 (and (= (select (arr!25786 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77836 res!613382) b!908771))

(assert (= (and b!908771 res!613375) b!908761))

(assert (= (and b!908761 res!613380) b!908767))

(assert (= (and b!908767 res!613376) b!908764))

(assert (= (and b!908764 res!613377) b!908765))

(assert (= (and b!908765 res!613374) b!908772))

(assert (= (and b!908772 res!613378) b!908763))

(assert (= (and b!908763 (not res!613379)) b!908760))

(assert (= (and b!908760 (not res!613381)) b!908770))

(assert (= (and b!908770 (not res!613383)) b!908762))

(assert (= (and b!908766 condMapEmpty!29935) mapIsEmpty!29935))

(assert (= (and b!908766 (not condMapEmpty!29935)) mapNonEmpty!29935))

(get-info :version)

(assert (= (and mapNonEmpty!29935 ((_ is ValueCellFull!8925) mapValue!29935)) b!908769))

(assert (= (and b!908766 ((_ is ValueCellFull!8925) mapDefault!29935)) b!908768))

(assert (= start!77836 b!908766))

(declare-fun b_lambda!13279 () Bool)

(assert (=> (not b_lambda!13279) (not b!908763)))

(declare-fun t!25682 () Bool)

(declare-fun tb!5417 () Bool)

(assert (=> (and start!77836 (= defaultEntry!1160 defaultEntry!1160) t!25682) tb!5417))

(declare-fun result!10631 () Bool)

(assert (=> tb!5417 (= result!10631 tp_is_empty!18813)))

(assert (=> b!908763 t!25682))

(declare-fun b_and!26949 () Bool)

(assert (= b_and!26947 (and (=> t!25682 result!10631) b_and!26949)))

(declare-fun m!844089 () Bool)

(assert (=> b!908764 m!844089))

(declare-fun m!844091 () Bool)

(assert (=> b!908764 m!844091))

(declare-fun m!844093 () Bool)

(assert (=> b!908770 m!844093))

(declare-fun m!844095 () Bool)

(assert (=> start!77836 m!844095))

(declare-fun m!844097 () Bool)

(assert (=> start!77836 m!844097))

(declare-fun m!844099 () Bool)

(assert (=> start!77836 m!844099))

(declare-fun m!844101 () Bool)

(assert (=> b!908760 m!844101))

(declare-fun m!844103 () Bool)

(assert (=> b!908760 m!844103))

(declare-fun m!844105 () Bool)

(assert (=> b!908767 m!844105))

(declare-fun m!844107 () Bool)

(assert (=> b!908762 m!844107))

(declare-fun m!844109 () Bool)

(assert (=> b!908762 m!844109))

(declare-fun m!844111 () Bool)

(assert (=> b!908763 m!844111))

(declare-fun m!844113 () Bool)

(assert (=> b!908763 m!844113))

(declare-fun m!844115 () Bool)

(assert (=> b!908763 m!844115))

(declare-fun m!844117 () Bool)

(assert (=> b!908763 m!844117))

(assert (=> b!908763 m!844111))

(assert (=> b!908763 m!844115))

(declare-fun m!844119 () Bool)

(assert (=> b!908763 m!844119))

(declare-fun m!844121 () Bool)

(assert (=> b!908772 m!844121))

(declare-fun m!844123 () Bool)

(assert (=> b!908761 m!844123))

(declare-fun m!844125 () Bool)

(assert (=> b!908765 m!844125))

(declare-fun m!844127 () Bool)

(assert (=> mapNonEmpty!29935 m!844127))

(check-sat (not b!908767) (not b!908760) (not b!908770) b_and!26949 tp_is_empty!18813 (not b!908765) (not b!908762) (not b_next!16395) (not b!908761) (not mapNonEmpty!29935) (not b_lambda!13279) (not b!908763) (not start!77836) (not b!908764))
(check-sat b_and!26949 (not b_next!16395))
