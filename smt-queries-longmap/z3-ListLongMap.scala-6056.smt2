; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78364 () Bool)

(assert start!78364)

(declare-fun b_free!16747 () Bool)

(declare-fun b_next!16747 () Bool)

(assert (=> start!78364 (= b_free!16747 (not b_next!16747))))

(declare-fun tp!58530 () Bool)

(declare-fun b_and!27335 () Bool)

(assert (=> start!78364 (= tp!58530 b_and!27335)))

(declare-fun b!914087 () Bool)

(declare-fun e!512769 () Bool)

(declare-fun e!512771 () Bool)

(declare-fun mapRes!30486 () Bool)

(assert (=> b!914087 (= e!512769 (and e!512771 mapRes!30486))))

(declare-fun condMapEmpty!30486 () Bool)

(declare-datatypes ((V!30519 0))(
  ( (V!30520 (val!9633 Int)) )
))
(declare-datatypes ((ValueCell!9101 0))(
  ( (ValueCellFull!9101 (v!12148 V!30519)) (EmptyCell!9101) )
))
(declare-datatypes ((array!54327 0))(
  ( (array!54328 (arr!26115 (Array (_ BitVec 32) ValueCell!9101)) (size!26576 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54327)

(declare-fun mapDefault!30486 () ValueCell!9101)

(assert (=> b!914087 (= condMapEmpty!30486 (= (arr!26115 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9101)) mapDefault!30486)))))

(declare-fun b!914088 () Bool)

(declare-fun e!512766 () Bool)

(declare-fun e!512770 () Bool)

(assert (=> b!914088 (= e!512766 e!512770)))

(declare-fun res!616520 () Bool)

(assert (=> b!914088 (=> res!616520 e!512770)))

(declare-datatypes ((tuple2!12604 0))(
  ( (tuple2!12605 (_1!6313 (_ BitVec 64)) (_2!6313 V!30519)) )
))
(declare-datatypes ((List!18382 0))(
  ( (Nil!18379) (Cons!18378 (h!19524 tuple2!12604) (t!25980 List!18382)) )
))
(declare-datatypes ((ListLongMap!11291 0))(
  ( (ListLongMap!11292 (toList!5661 List!18382)) )
))
(declare-fun lt!411213 () ListLongMap!11291)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4668 (ListLongMap!11291 (_ BitVec 64)) Bool)

(assert (=> b!914088 (= res!616520 (not (contains!4668 lt!411213 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30519)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30519)

(declare-datatypes ((array!54329 0))(
  ( (array!54330 (arr!26116 (Array (_ BitVec 32) (_ BitVec 64))) (size!26577 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54329)

(declare-fun getCurrentListMap!2862 (array!54329 array!54327 (_ BitVec 32) (_ BitVec 32) V!30519 V!30519 (_ BitVec 32) Int) ListLongMap!11291)

(assert (=> b!914088 (= lt!411213 (getCurrentListMap!2862 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!30486 () Bool)

(assert (=> mapIsEmpty!30486 mapRes!30486))

(declare-fun b!914089 () Bool)

(declare-fun e!512767 () Bool)

(declare-fun e!512768 () Bool)

(assert (=> b!914089 (= e!512767 e!512768)))

(declare-fun res!616516 () Bool)

(assert (=> b!914089 (=> (not res!616516) (not e!512768))))

(declare-fun lt!411212 () ListLongMap!11291)

(assert (=> b!914089 (= res!616516 (contains!4668 lt!411212 k0!1033))))

(assert (=> b!914089 (= lt!411212 (getCurrentListMap!2862 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914090 () Bool)

(declare-fun res!616513 () Bool)

(assert (=> b!914090 (=> res!616513 e!512770)))

(declare-fun lt!411210 () V!30519)

(declare-fun apply!525 (ListLongMap!11291 (_ BitVec 64)) V!30519)

(assert (=> b!914090 (= res!616513 (not (= (apply!525 lt!411213 k0!1033) lt!411210)))))

(declare-fun b!914091 () Bool)

(declare-fun res!616515 () Bool)

(assert (=> b!914091 (=> (not res!616515) (not e!512767))))

(assert (=> b!914091 (= res!616515 (and (= (size!26576 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26577 _keys!1386) (size!26576 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914092 () Bool)

(declare-fun res!616517 () Bool)

(assert (=> b!914092 (=> (not res!616517) (not e!512767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54329 (_ BitVec 32)) Bool)

(assert (=> b!914092 (= res!616517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914093 () Bool)

(declare-fun res!616514 () Bool)

(assert (=> b!914093 (=> (not res!616514) (not e!512767))))

(declare-datatypes ((List!18383 0))(
  ( (Nil!18380) (Cons!18379 (h!19525 (_ BitVec 64)) (t!25981 List!18383)) )
))
(declare-fun arrayNoDuplicates!0 (array!54329 (_ BitVec 32) List!18383) Bool)

(assert (=> b!914093 (= res!616514 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18380))))

(declare-fun b!914094 () Bool)

(declare-fun tp_is_empty!19165 () Bool)

(assert (=> b!914094 (= e!512771 tp_is_empty!19165)))

(declare-fun b!914095 () Bool)

(declare-fun e!512772 () Bool)

(assert (=> b!914095 (= e!512772 tp_is_empty!19165)))

(declare-fun res!616521 () Bool)

(assert (=> start!78364 (=> (not res!616521) (not e!512767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78364 (= res!616521 (validMask!0 mask!1756))))

(assert (=> start!78364 e!512767))

(declare-fun array_inv!20476 (array!54327) Bool)

(assert (=> start!78364 (and (array_inv!20476 _values!1152) e!512769)))

(assert (=> start!78364 tp!58530))

(assert (=> start!78364 true))

(assert (=> start!78364 tp_is_empty!19165))

(declare-fun array_inv!20477 (array!54329) Bool)

(assert (=> start!78364 (array_inv!20477 _keys!1386)))

(declare-fun b!914096 () Bool)

(declare-fun res!616518 () Bool)

(assert (=> b!914096 (=> (not res!616518) (not e!512768))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914096 (= res!616518 (inRange!0 i!717 mask!1756))))

(declare-fun b!914097 () Bool)

(assert (=> b!914097 (= e!512768 (not e!512766))))

(declare-fun res!616519 () Bool)

(assert (=> b!914097 (=> res!616519 e!512766)))

(assert (=> b!914097 (= res!616519 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26577 _keys!1386))))))

(declare-fun get!13714 (ValueCell!9101 V!30519) V!30519)

(declare-fun dynLambda!1390 (Int (_ BitVec 64)) V!30519)

(assert (=> b!914097 (= lt!411210 (get!13714 (select (arr!26115 _values!1152) i!717) (dynLambda!1390 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!54329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914097 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30870 0))(
  ( (Unit!30871) )
))
(declare-fun lt!411211 () Unit!30870)

(declare-fun lemmaKeyInListMapIsInArray!279 (array!54329 array!54327 (_ BitVec 32) (_ BitVec 32) V!30519 V!30519 (_ BitVec 64) Int) Unit!30870)

(assert (=> b!914097 (= lt!411211 (lemmaKeyInListMapIsInArray!279 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!914098 () Bool)

(declare-fun res!616512 () Bool)

(assert (=> b!914098 (=> (not res!616512) (not e!512768))))

(assert (=> b!914098 (= res!616512 (and (= (select (arr!26116 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914099 () Bool)

(assert (=> b!914099 (= e!512770 true)))

(assert (=> b!914099 (= (apply!525 lt!411212 k0!1033) lt!411210)))

(declare-fun lt!411214 () Unit!30870)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!70 (array!54329 array!54327 (_ BitVec 32) (_ BitVec 32) V!30519 V!30519 (_ BitVec 64) V!30519 (_ BitVec 32) Int) Unit!30870)

(assert (=> b!914099 (= lt!411214 (lemmaListMapApplyFromThenApplyFromZero!70 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!411210 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!30486 () Bool)

(declare-fun tp!58529 () Bool)

(assert (=> mapNonEmpty!30486 (= mapRes!30486 (and tp!58529 e!512772))))

(declare-fun mapKey!30486 () (_ BitVec 32))

(declare-fun mapValue!30486 () ValueCell!9101)

(declare-fun mapRest!30486 () (Array (_ BitVec 32) ValueCell!9101))

(assert (=> mapNonEmpty!30486 (= (arr!26115 _values!1152) (store mapRest!30486 mapKey!30486 mapValue!30486))))

(assert (= (and start!78364 res!616521) b!914091))

(assert (= (and b!914091 res!616515) b!914092))

(assert (= (and b!914092 res!616517) b!914093))

(assert (= (and b!914093 res!616514) b!914089))

(assert (= (and b!914089 res!616516) b!914096))

(assert (= (and b!914096 res!616518) b!914098))

(assert (= (and b!914098 res!616512) b!914097))

(assert (= (and b!914097 (not res!616519)) b!914088))

(assert (= (and b!914088 (not res!616520)) b!914090))

(assert (= (and b!914090 (not res!616513)) b!914099))

(assert (= (and b!914087 condMapEmpty!30486) mapIsEmpty!30486))

(assert (= (and b!914087 (not condMapEmpty!30486)) mapNonEmpty!30486))

(get-info :version)

(assert (= (and mapNonEmpty!30486 ((_ is ValueCellFull!9101) mapValue!30486)) b!914095))

(assert (= (and b!914087 ((_ is ValueCellFull!9101) mapDefault!30486)) b!914094))

(assert (= start!78364 b!914087))

(declare-fun b_lambda!13359 () Bool)

(assert (=> (not b_lambda!13359) (not b!914097)))

(declare-fun t!25979 () Bool)

(declare-fun tb!5449 () Bool)

(assert (=> (and start!78364 (= defaultEntry!1160 defaultEntry!1160) t!25979) tb!5449))

(declare-fun result!10717 () Bool)

(assert (=> tb!5449 (= result!10717 tp_is_empty!19165)))

(assert (=> b!914097 t!25979))

(declare-fun b_and!27337 () Bool)

(assert (= b_and!27335 (and (=> t!25979 result!10717) b_and!27337)))

(declare-fun m!848297 () Bool)

(assert (=> b!914099 m!848297))

(declare-fun m!848299 () Bool)

(assert (=> b!914099 m!848299))

(declare-fun m!848301 () Bool)

(assert (=> b!914090 m!848301))

(declare-fun m!848303 () Bool)

(assert (=> b!914089 m!848303))

(declare-fun m!848305 () Bool)

(assert (=> b!914089 m!848305))

(declare-fun m!848307 () Bool)

(assert (=> b!914096 m!848307))

(declare-fun m!848309 () Bool)

(assert (=> start!78364 m!848309))

(declare-fun m!848311 () Bool)

(assert (=> start!78364 m!848311))

(declare-fun m!848313 () Bool)

(assert (=> start!78364 m!848313))

(declare-fun m!848315 () Bool)

(assert (=> b!914097 m!848315))

(declare-fun m!848317 () Bool)

(assert (=> b!914097 m!848317))

(declare-fun m!848319 () Bool)

(assert (=> b!914097 m!848319))

(declare-fun m!848321 () Bool)

(assert (=> b!914097 m!848321))

(assert (=> b!914097 m!848315))

(assert (=> b!914097 m!848319))

(declare-fun m!848323 () Bool)

(assert (=> b!914097 m!848323))

(declare-fun m!848325 () Bool)

(assert (=> b!914093 m!848325))

(declare-fun m!848327 () Bool)

(assert (=> b!914098 m!848327))

(declare-fun m!848329 () Bool)

(assert (=> b!914088 m!848329))

(declare-fun m!848331 () Bool)

(assert (=> b!914088 m!848331))

(declare-fun m!848333 () Bool)

(assert (=> b!914092 m!848333))

(declare-fun m!848335 () Bool)

(assert (=> mapNonEmpty!30486 m!848335))

(check-sat tp_is_empty!19165 (not mapNonEmpty!30486) (not b!914097) (not start!78364) b_and!27337 (not b!914099) (not b!914089) (not b_next!16747) (not b!914093) (not b!914090) (not b!914088) (not b!914096) (not b_lambda!13359) (not b!914092))
(check-sat b_and!27337 (not b_next!16747))
