; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78008 () Bool)

(assert start!78008)

(declare-fun b_free!16399 () Bool)

(declare-fun b_next!16399 () Bool)

(assert (=> start!78008 (= b_free!16399 (not b_next!16399))))

(declare-fun tp!57463 () Bool)

(declare-fun b_and!26965 () Bool)

(assert (=> start!78008 (= tp!57463 b_and!26965)))

(declare-fun b!909745 () Bool)

(declare-fun e!509966 () Bool)

(declare-fun e!509973 () Bool)

(declare-fun mapRes!29941 () Bool)

(assert (=> b!909745 (= e!509966 (and e!509973 mapRes!29941))))

(declare-fun condMapEmpty!29941 () Bool)

(declare-datatypes ((V!30055 0))(
  ( (V!30056 (val!9459 Int)) )
))
(declare-datatypes ((ValueCell!8927 0))(
  ( (ValueCellFull!8927 (v!11963 V!30055)) (EmptyCell!8927) )
))
(declare-datatypes ((array!53711 0))(
  ( (array!53712 (arr!25809 (Array (_ BitVec 32) ValueCell!8927)) (size!26269 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53711)

(declare-fun mapDefault!29941 () ValueCell!8927)

(assert (=> b!909745 (= condMapEmpty!29941 (= (arr!25809 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8927)) mapDefault!29941)))))

(declare-fun b!909746 () Bool)

(declare-fun e!509972 () Bool)

(declare-fun e!509968 () Bool)

(assert (=> b!909746 (= e!509972 e!509968)))

(declare-fun res!613786 () Bool)

(assert (=> b!909746 (=> res!613786 e!509968)))

(declare-datatypes ((tuple2!12274 0))(
  ( (tuple2!12275 (_1!6148 (_ BitVec 64)) (_2!6148 V!30055)) )
))
(declare-datatypes ((List!18096 0))(
  ( (Nil!18093) (Cons!18092 (h!19244 tuple2!12274) (t!25659 List!18096)) )
))
(declare-datatypes ((ListLongMap!10973 0))(
  ( (ListLongMap!10974 (toList!5502 List!18096)) )
))
(declare-fun lt!410225 () ListLongMap!10973)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4553 (ListLongMap!10973 (_ BitVec 64)) Bool)

(assert (=> b!909746 (= res!613786 (not (contains!4553 lt!410225 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30055)

(declare-datatypes ((array!53713 0))(
  ( (array!53714 (arr!25810 (Array (_ BitVec 32) (_ BitVec 64))) (size!26270 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53713)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30055)

(declare-fun getCurrentListMap!2763 (array!53713 array!53711 (_ BitVec 32) (_ BitVec 32) V!30055 V!30055 (_ BitVec 32) Int) ListLongMap!10973)

(assert (=> b!909746 (= lt!410225 (getCurrentListMap!2763 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29941 () Bool)

(assert (=> mapIsEmpty!29941 mapRes!29941))

(declare-fun b!909747 () Bool)

(declare-fun e!509969 () Bool)

(declare-fun tp_is_empty!18817 () Bool)

(assert (=> b!909747 (= e!509969 tp_is_empty!18817)))

(declare-fun b!909748 () Bool)

(declare-fun res!613785 () Bool)

(declare-fun e!509967 () Bool)

(assert (=> b!909748 (=> (not res!613785) (not e!509967))))

(declare-datatypes ((List!18097 0))(
  ( (Nil!18094) (Cons!18093 (h!19245 (_ BitVec 64)) (t!25660 List!18097)) )
))
(declare-fun arrayNoDuplicates!0 (array!53713 (_ BitVec 32) List!18097) Bool)

(assert (=> b!909748 (= res!613785 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18094))))

(declare-fun b!909749 () Bool)

(declare-fun e!509971 () Bool)

(assert (=> b!909749 (= e!509967 e!509971)))

(declare-fun res!613780 () Bool)

(assert (=> b!909749 (=> (not res!613780) (not e!509971))))

(declare-fun lt!410226 () ListLongMap!10973)

(assert (=> b!909749 (= res!613780 (contains!4553 lt!410226 k0!1033))))

(assert (=> b!909749 (= lt!410226 (getCurrentListMap!2763 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!909751 () Bool)

(declare-fun res!613783 () Bool)

(assert (=> b!909751 (=> (not res!613783) (not e!509967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53713 (_ BitVec 32)) Bool)

(assert (=> b!909751 (= res!613783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909752 () Bool)

(assert (=> b!909752 (= e!509968 (bvsle #b00000000000000000000000000000000 (size!26270 _keys!1386)))))

(declare-fun lt!410223 () V!30055)

(declare-fun apply!517 (ListLongMap!10973 (_ BitVec 64)) V!30055)

(assert (=> b!909752 (= (apply!517 lt!410226 k0!1033) lt!410223)))

(declare-datatypes ((Unit!30840 0))(
  ( (Unit!30841) )
))
(declare-fun lt!410222 () Unit!30840)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!60 (array!53713 array!53711 (_ BitVec 32) (_ BitVec 32) V!30055 V!30055 (_ BitVec 64) V!30055 (_ BitVec 32) Int) Unit!30840)

(assert (=> b!909752 (= lt!410222 (lemmaListMapApplyFromThenApplyFromZero!60 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!410223 i!717 defaultEntry!1160))))

(declare-fun b!909753 () Bool)

(declare-fun res!613787 () Bool)

(assert (=> b!909753 (=> (not res!613787) (not e!509971))))

(assert (=> b!909753 (= res!613787 (and (= (select (arr!25810 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29941 () Bool)

(declare-fun tp!57462 () Bool)

(assert (=> mapNonEmpty!29941 (= mapRes!29941 (and tp!57462 e!509969))))

(declare-fun mapValue!29941 () ValueCell!8927)

(declare-fun mapRest!29941 () (Array (_ BitVec 32) ValueCell!8927))

(declare-fun mapKey!29941 () (_ BitVec 32))

(assert (=> mapNonEmpty!29941 (= (arr!25809 _values!1152) (store mapRest!29941 mapKey!29941 mapValue!29941))))

(declare-fun b!909754 () Bool)

(assert (=> b!909754 (= e!509973 tp_is_empty!18817)))

(declare-fun b!909755 () Bool)

(assert (=> b!909755 (= e!509971 (not e!509972))))

(declare-fun res!613781 () Bool)

(assert (=> b!909755 (=> res!613781 e!509972)))

(assert (=> b!909755 (= res!613781 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26270 _keys!1386))))))

(declare-fun get!13600 (ValueCell!8927 V!30055) V!30055)

(declare-fun dynLambda!1399 (Int (_ BitVec 64)) V!30055)

(assert (=> b!909755 (= lt!410223 (get!13600 (select (arr!25809 _values!1152) i!717) (dynLambda!1399 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909755 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!410224 () Unit!30840)

(declare-fun lemmaKeyInListMapIsInArray!258 (array!53713 array!53711 (_ BitVec 32) (_ BitVec 32) V!30055 V!30055 (_ BitVec 64) Int) Unit!30840)

(assert (=> b!909755 (= lt!410224 (lemmaKeyInListMapIsInArray!258 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!613782 () Bool)

(assert (=> start!78008 (=> (not res!613782) (not e!509967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78008 (= res!613782 (validMask!0 mask!1756))))

(assert (=> start!78008 e!509967))

(declare-fun array_inv!20262 (array!53711) Bool)

(assert (=> start!78008 (and (array_inv!20262 _values!1152) e!509966)))

(assert (=> start!78008 tp!57463))

(assert (=> start!78008 true))

(assert (=> start!78008 tp_is_empty!18817))

(declare-fun array_inv!20263 (array!53713) Bool)

(assert (=> start!78008 (array_inv!20263 _keys!1386)))

(declare-fun b!909750 () Bool)

(declare-fun res!613784 () Bool)

(assert (=> b!909750 (=> (not res!613784) (not e!509971))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909750 (= res!613784 (inRange!0 i!717 mask!1756))))

(declare-fun b!909756 () Bool)

(declare-fun res!613779 () Bool)

(assert (=> b!909756 (=> res!613779 e!509968)))

(assert (=> b!909756 (= res!613779 (not (= (apply!517 lt!410225 k0!1033) lt!410223)))))

(declare-fun b!909757 () Bool)

(declare-fun res!613778 () Bool)

(assert (=> b!909757 (=> (not res!613778) (not e!509967))))

(assert (=> b!909757 (= res!613778 (and (= (size!26269 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26270 _keys!1386) (size!26269 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78008 res!613782) b!909757))

(assert (= (and b!909757 res!613778) b!909751))

(assert (= (and b!909751 res!613783) b!909748))

(assert (= (and b!909748 res!613785) b!909749))

(assert (= (and b!909749 res!613780) b!909750))

(assert (= (and b!909750 res!613784) b!909753))

(assert (= (and b!909753 res!613787) b!909755))

(assert (= (and b!909755 (not res!613781)) b!909746))

(assert (= (and b!909746 (not res!613786)) b!909756))

(assert (= (and b!909756 (not res!613779)) b!909752))

(assert (= (and b!909745 condMapEmpty!29941) mapIsEmpty!29941))

(assert (= (and b!909745 (not condMapEmpty!29941)) mapNonEmpty!29941))

(get-info :version)

(assert (= (and mapNonEmpty!29941 ((_ is ValueCellFull!8927) mapValue!29941)) b!909747))

(assert (= (and b!909745 ((_ is ValueCellFull!8927) mapDefault!29941)) b!909754))

(assert (= start!78008 b!909745))

(declare-fun b_lambda!13297 () Bool)

(assert (=> (not b_lambda!13297) (not b!909755)))

(declare-fun t!25658 () Bool)

(declare-fun tb!5413 () Bool)

(assert (=> (and start!78008 (= defaultEntry!1160 defaultEntry!1160) t!25658) tb!5413))

(declare-fun result!10631 () Bool)

(assert (=> tb!5413 (= result!10631 tp_is_empty!18817)))

(assert (=> b!909755 t!25658))

(declare-fun b_and!26967 () Bool)

(assert (= b_and!26965 (and (=> t!25658 result!10631) b_and!26967)))

(declare-fun m!845463 () Bool)

(assert (=> start!78008 m!845463))

(declare-fun m!845465 () Bool)

(assert (=> start!78008 m!845465))

(declare-fun m!845467 () Bool)

(assert (=> start!78008 m!845467))

(declare-fun m!845469 () Bool)

(assert (=> b!909756 m!845469))

(declare-fun m!845471 () Bool)

(assert (=> b!909749 m!845471))

(declare-fun m!845473 () Bool)

(assert (=> b!909749 m!845473))

(declare-fun m!845475 () Bool)

(assert (=> b!909750 m!845475))

(declare-fun m!845477 () Bool)

(assert (=> b!909748 m!845477))

(declare-fun m!845479 () Bool)

(assert (=> b!909752 m!845479))

(declare-fun m!845481 () Bool)

(assert (=> b!909752 m!845481))

(declare-fun m!845483 () Bool)

(assert (=> b!909746 m!845483))

(declare-fun m!845485 () Bool)

(assert (=> b!909746 m!845485))

(declare-fun m!845487 () Bool)

(assert (=> b!909753 m!845487))

(declare-fun m!845489 () Bool)

(assert (=> mapNonEmpty!29941 m!845489))

(declare-fun m!845491 () Bool)

(assert (=> b!909751 m!845491))

(declare-fun m!845493 () Bool)

(assert (=> b!909755 m!845493))

(declare-fun m!845495 () Bool)

(assert (=> b!909755 m!845495))

(declare-fun m!845497 () Bool)

(assert (=> b!909755 m!845497))

(declare-fun m!845499 () Bool)

(assert (=> b!909755 m!845499))

(assert (=> b!909755 m!845493))

(assert (=> b!909755 m!845497))

(declare-fun m!845501 () Bool)

(assert (=> b!909755 m!845501))

(check-sat (not start!78008) (not mapNonEmpty!29941) (not b!909756) (not b!909746) b_and!26967 (not b!909752) (not b!909750) (not b_lambda!13297) (not b_next!16399) tp_is_empty!18817 (not b!909748) (not b!909751) (not b!909749) (not b!909755))
(check-sat b_and!26967 (not b_next!16399))
