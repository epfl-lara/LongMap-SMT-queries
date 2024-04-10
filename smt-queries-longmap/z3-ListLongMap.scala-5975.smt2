; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77678 () Bool)

(assert start!77678)

(declare-fun b_free!16263 () Bool)

(declare-fun b_next!16263 () Bool)

(assert (=> start!77678 (= b_free!16263 (not b_next!16263))))

(declare-fun tp!57051 () Bool)

(declare-fun b_and!26679 () Bool)

(assert (=> start!77678 (= tp!57051 b_and!26679)))

(declare-fun mapNonEmpty!29734 () Bool)

(declare-fun mapRes!29734 () Bool)

(declare-fun tp!57050 () Bool)

(declare-fun e!507654 () Bool)

(assert (=> mapNonEmpty!29734 (= mapRes!29734 (and tp!57050 e!507654))))

(declare-datatypes ((V!29873 0))(
  ( (V!29874 (val!9391 Int)) )
))
(declare-datatypes ((ValueCell!8859 0))(
  ( (ValueCellFull!8859 (v!11896 V!29873)) (EmptyCell!8859) )
))
(declare-datatypes ((array!53404 0))(
  ( (array!53405 (arr!25661 (Array (_ BitVec 32) ValueCell!8859)) (size!26120 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53404)

(declare-fun mapValue!29734 () ValueCell!8859)

(declare-fun mapRest!29734 () (Array (_ BitVec 32) ValueCell!8859))

(declare-fun mapKey!29734 () (_ BitVec 32))

(assert (=> mapNonEmpty!29734 (= (arr!25661 _values!1152) (store mapRest!29734 mapKey!29734 mapValue!29734))))

(declare-fun b!905902 () Bool)

(declare-fun res!611330 () Bool)

(declare-fun e!507651 () Bool)

(assert (=> b!905902 (=> (not res!611330) (not e!507651))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905902 (= res!611330 (inRange!0 i!717 mask!1756))))

(declare-fun b!905903 () Bool)

(declare-fun e!507650 () Bool)

(assert (=> b!905903 (= e!507650 true)))

(declare-datatypes ((tuple2!12220 0))(
  ( (tuple2!12221 (_1!6121 (_ BitVec 64)) (_2!6121 V!29873)) )
))
(declare-datatypes ((List!18029 0))(
  ( (Nil!18026) (Cons!18025 (h!19171 tuple2!12220) (t!25464 List!18029)) )
))
(declare-datatypes ((ListLongMap!10917 0))(
  ( (ListLongMap!10918 (toList!5474 List!18029)) )
))
(declare-fun lt!408724 () ListLongMap!10917)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408725 () V!29873)

(declare-fun apply!462 (ListLongMap!10917 (_ BitVec 64)) V!29873)

(assert (=> b!905903 (= (apply!462 lt!408724 k0!1033) lt!408725)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30740 0))(
  ( (Unit!30741) )
))
(declare-fun lt!408723 () Unit!30740)

(declare-fun zeroValue!1094 () V!29873)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29873)

(declare-datatypes ((array!53406 0))(
  ( (array!53407 (arr!25662 (Array (_ BitVec 32) (_ BitVec 64))) (size!26121 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53406)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!17 (array!53406 array!53404 (_ BitVec 32) (_ BitVec 32) V!29873 V!29873 (_ BitVec 64) V!29873 (_ BitVec 32) Int) Unit!30740)

(assert (=> b!905903 (= lt!408723 (lemmaListMapApplyFromThenApplyFromZero!17 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408725 i!717 defaultEntry!1160))))

(declare-fun b!905904 () Bool)

(declare-fun tp_is_empty!18681 () Bool)

(assert (=> b!905904 (= e!507654 tp_is_empty!18681)))

(declare-fun b!905905 () Bool)

(declare-fun e!507657 () Bool)

(assert (=> b!905905 (= e!507657 tp_is_empty!18681)))

(declare-fun b!905906 () Bool)

(declare-fun res!611339 () Bool)

(declare-fun e!507652 () Bool)

(assert (=> b!905906 (=> (not res!611339) (not e!507652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53406 (_ BitVec 32)) Bool)

(assert (=> b!905906 (= res!611339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905907 () Bool)

(declare-fun res!611337 () Bool)

(assert (=> b!905907 (=> (not res!611337) (not e!507652))))

(assert (=> b!905907 (= res!611337 (and (= (size!26120 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26121 _keys!1386) (size!26120 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!611334 () Bool)

(assert (=> start!77678 (=> (not res!611334) (not e!507652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77678 (= res!611334 (validMask!0 mask!1756))))

(assert (=> start!77678 e!507652))

(declare-fun e!507656 () Bool)

(declare-fun array_inv!20102 (array!53404) Bool)

(assert (=> start!77678 (and (array_inv!20102 _values!1152) e!507656)))

(assert (=> start!77678 tp!57051))

(assert (=> start!77678 true))

(assert (=> start!77678 tp_is_empty!18681))

(declare-fun array_inv!20103 (array!53406) Bool)

(assert (=> start!77678 (array_inv!20103 _keys!1386)))

(declare-fun b!905908 () Bool)

(assert (=> b!905908 (= e!507656 (and e!507657 mapRes!29734))))

(declare-fun condMapEmpty!29734 () Bool)

(declare-fun mapDefault!29734 () ValueCell!8859)

(assert (=> b!905908 (= condMapEmpty!29734 (= (arr!25661 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8859)) mapDefault!29734)))))

(declare-fun b!905909 () Bool)

(declare-fun res!611332 () Bool)

(assert (=> b!905909 (=> (not res!611332) (not e!507651))))

(assert (=> b!905909 (= res!611332 (and (= (select (arr!25662 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905910 () Bool)

(declare-fun res!611333 () Bool)

(assert (=> b!905910 (=> res!611333 e!507650)))

(declare-fun lt!408726 () ListLongMap!10917)

(assert (=> b!905910 (= res!611333 (not (= (apply!462 lt!408726 k0!1033) lt!408725)))))

(declare-fun b!905911 () Bool)

(declare-fun e!507655 () Bool)

(assert (=> b!905911 (= e!507651 (not e!507655))))

(declare-fun res!611335 () Bool)

(assert (=> b!905911 (=> res!611335 e!507655)))

(assert (=> b!905911 (= res!611335 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26121 _keys!1386))))))

(declare-fun get!13485 (ValueCell!8859 V!29873) V!29873)

(declare-fun dynLambda!1337 (Int (_ BitVec 64)) V!29873)

(assert (=> b!905911 (= lt!408725 (get!13485 (select (arr!25661 _values!1152) i!717) (dynLambda!1337 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905911 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408722 () Unit!30740)

(declare-fun lemmaKeyInListMapIsInArray!209 (array!53406 array!53404 (_ BitVec 32) (_ BitVec 32) V!29873 V!29873 (_ BitVec 64) Int) Unit!30740)

(assert (=> b!905911 (= lt!408722 (lemmaKeyInListMapIsInArray!209 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905912 () Bool)

(declare-fun res!611336 () Bool)

(assert (=> b!905912 (=> (not res!611336) (not e!507652))))

(declare-datatypes ((List!18030 0))(
  ( (Nil!18027) (Cons!18026 (h!19172 (_ BitVec 64)) (t!25465 List!18030)) )
))
(declare-fun arrayNoDuplicates!0 (array!53406 (_ BitVec 32) List!18030) Bool)

(assert (=> b!905912 (= res!611336 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18027))))

(declare-fun mapIsEmpty!29734 () Bool)

(assert (=> mapIsEmpty!29734 mapRes!29734))

(declare-fun b!905913 () Bool)

(assert (=> b!905913 (= e!507655 e!507650)))

(declare-fun res!611338 () Bool)

(assert (=> b!905913 (=> res!611338 e!507650)))

(declare-fun contains!4519 (ListLongMap!10917 (_ BitVec 64)) Bool)

(assert (=> b!905913 (= res!611338 (not (contains!4519 lt!408726 k0!1033)))))

(declare-fun getCurrentListMap!2740 (array!53406 array!53404 (_ BitVec 32) (_ BitVec 32) V!29873 V!29873 (_ BitVec 32) Int) ListLongMap!10917)

(assert (=> b!905913 (= lt!408726 (getCurrentListMap!2740 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905914 () Bool)

(assert (=> b!905914 (= e!507652 e!507651)))

(declare-fun res!611331 () Bool)

(assert (=> b!905914 (=> (not res!611331) (not e!507651))))

(assert (=> b!905914 (= res!611331 (contains!4519 lt!408724 k0!1033))))

(assert (=> b!905914 (= lt!408724 (getCurrentListMap!2740 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and start!77678 res!611334) b!905907))

(assert (= (and b!905907 res!611337) b!905906))

(assert (= (and b!905906 res!611339) b!905912))

(assert (= (and b!905912 res!611336) b!905914))

(assert (= (and b!905914 res!611331) b!905902))

(assert (= (and b!905902 res!611330) b!905909))

(assert (= (and b!905909 res!611332) b!905911))

(assert (= (and b!905911 (not res!611335)) b!905913))

(assert (= (and b!905913 (not res!611338)) b!905910))

(assert (= (and b!905910 (not res!611333)) b!905903))

(assert (= (and b!905908 condMapEmpty!29734) mapIsEmpty!29734))

(assert (= (and b!905908 (not condMapEmpty!29734)) mapNonEmpty!29734))

(get-info :version)

(assert (= (and mapNonEmpty!29734 ((_ is ValueCellFull!8859) mapValue!29734)) b!905904))

(assert (= (and b!905908 ((_ is ValueCellFull!8859) mapDefault!29734)) b!905905))

(assert (= start!77678 b!905908))

(declare-fun b_lambda!13137 () Bool)

(assert (=> (not b_lambda!13137) (not b!905911)))

(declare-fun t!25463 () Bool)

(declare-fun tb!5285 () Bool)

(assert (=> (and start!77678 (= defaultEntry!1160 defaultEntry!1160) t!25463) tb!5285))

(declare-fun result!10365 () Bool)

(assert (=> tb!5285 (= result!10365 tp_is_empty!18681)))

(assert (=> b!905911 t!25463))

(declare-fun b_and!26681 () Bool)

(assert (= b_and!26679 (and (=> t!25463 result!10365) b_and!26681)))

(declare-fun m!841295 () Bool)

(assert (=> b!905912 m!841295))

(declare-fun m!841297 () Bool)

(assert (=> b!905914 m!841297))

(declare-fun m!841299 () Bool)

(assert (=> b!905914 m!841299))

(declare-fun m!841301 () Bool)

(assert (=> b!905909 m!841301))

(declare-fun m!841303 () Bool)

(assert (=> b!905911 m!841303))

(declare-fun m!841305 () Bool)

(assert (=> b!905911 m!841305))

(declare-fun m!841307 () Bool)

(assert (=> b!905911 m!841307))

(declare-fun m!841309 () Bool)

(assert (=> b!905911 m!841309))

(assert (=> b!905911 m!841303))

(assert (=> b!905911 m!841307))

(declare-fun m!841311 () Bool)

(assert (=> b!905911 m!841311))

(declare-fun m!841313 () Bool)

(assert (=> b!905903 m!841313))

(declare-fun m!841315 () Bool)

(assert (=> b!905903 m!841315))

(declare-fun m!841317 () Bool)

(assert (=> b!905902 m!841317))

(declare-fun m!841319 () Bool)

(assert (=> b!905910 m!841319))

(declare-fun m!841321 () Bool)

(assert (=> b!905913 m!841321))

(declare-fun m!841323 () Bool)

(assert (=> b!905913 m!841323))

(declare-fun m!841325 () Bool)

(assert (=> mapNonEmpty!29734 m!841325))

(declare-fun m!841327 () Bool)

(assert (=> b!905906 m!841327))

(declare-fun m!841329 () Bool)

(assert (=> start!77678 m!841329))

(declare-fun m!841331 () Bool)

(assert (=> start!77678 m!841331))

(declare-fun m!841333 () Bool)

(assert (=> start!77678 m!841333))

(check-sat (not b_next!16263) (not b!905914) (not b!905906) (not b!905902) b_and!26681 tp_is_empty!18681 (not mapNonEmpty!29734) (not b_lambda!13137) (not b!905911) (not start!77678) (not b!905910) (not b!905912) (not b!905913) (not b!905903))
(check-sat b_and!26681 (not b_next!16263))
