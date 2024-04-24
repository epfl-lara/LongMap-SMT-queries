; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77892 () Bool)

(assert start!77892)

(declare-fun b_free!16309 () Bool)

(declare-fun b_next!16309 () Bool)

(assert (=> start!77892 (= b_free!16309 (not b_next!16309))))

(declare-fun tp!57190 () Bool)

(declare-fun b_and!26781 () Bool)

(assert (=> start!77892 (= tp!57190 b_and!26781)))

(declare-fun b!907748 () Bool)

(declare-fun e!508790 () Bool)

(assert (=> b!907748 (= e!508790 true)))

(declare-datatypes ((V!29935 0))(
  ( (V!29936 (val!9414 Int)) )
))
(declare-datatypes ((tuple2!12192 0))(
  ( (tuple2!12193 (_1!6107 (_ BitVec 64)) (_2!6107 V!29935)) )
))
(declare-datatypes ((List!18026 0))(
  ( (Nil!18023) (Cons!18022 (h!19174 tuple2!12192) (t!25499 List!18026)) )
))
(declare-datatypes ((ListLongMap!10891 0))(
  ( (ListLongMap!10892 (toList!5461 List!18026)) )
))
(declare-fun lt!409432 () ListLongMap!10891)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409429 () V!29935)

(declare-fun apply!480 (ListLongMap!10891 (_ BitVec 64)) V!29935)

(assert (=> b!907748 (= (apply!480 lt!409432 k0!1033) lt!409429)))

(declare-datatypes ((ValueCell!8882 0))(
  ( (ValueCellFull!8882 (v!11916 V!29935)) (EmptyCell!8882) )
))
(declare-datatypes ((array!53535 0))(
  ( (array!53536 (arr!25722 (Array (_ BitVec 32) ValueCell!8882)) (size!26182 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53535)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29935)

(declare-datatypes ((array!53537 0))(
  ( (array!53538 (arr!25723 (Array (_ BitVec 32) (_ BitVec 64))) (size!26183 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53537)

(declare-datatypes ((Unit!30772 0))(
  ( (Unit!30773) )
))
(declare-fun lt!409430 () Unit!30772)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29935)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!32 (array!53537 array!53535 (_ BitVec 32) (_ BitVec 32) V!29935 V!29935 (_ BitVec 64) V!29935 (_ BitVec 32) Int) Unit!30772)

(assert (=> b!907748 (= lt!409430 (lemmaListMapApplyFromThenApplyFromZero!32 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409429 i!717 defaultEntry!1160))))

(declare-fun b!907750 () Bool)

(declare-fun res!612371 () Bool)

(declare-fun e!508786 () Bool)

(assert (=> b!907750 (=> (not res!612371) (not e!508786))))

(assert (=> b!907750 (= res!612371 (and (= (select (arr!25723 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907751 () Bool)

(declare-fun res!612372 () Bool)

(declare-fun e!508788 () Bool)

(assert (=> b!907751 (=> (not res!612372) (not e!508788))))

(assert (=> b!907751 (= res!612372 (and (= (size!26182 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26183 _keys!1386) (size!26182 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907752 () Bool)

(declare-fun e!508787 () Bool)

(declare-fun tp_is_empty!18727 () Bool)

(assert (=> b!907752 (= e!508787 tp_is_empty!18727)))

(declare-fun b!907753 () Bool)

(declare-fun e!508785 () Bool)

(assert (=> b!907753 (= e!508785 e!508790)))

(declare-fun res!612364 () Bool)

(assert (=> b!907753 (=> res!612364 e!508790)))

(declare-fun lt!409428 () ListLongMap!10891)

(declare-fun contains!4515 (ListLongMap!10891 (_ BitVec 64)) Bool)

(assert (=> b!907753 (= res!612364 (not (contains!4515 lt!409428 k0!1033)))))

(declare-fun getCurrentListMap!2726 (array!53537 array!53535 (_ BitVec 32) (_ BitVec 32) V!29935 V!29935 (_ BitVec 32) Int) ListLongMap!10891)

(assert (=> b!907753 (= lt!409428 (getCurrentListMap!2726 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907754 () Bool)

(assert (=> b!907754 (= e!508788 e!508786)))

(declare-fun res!612367 () Bool)

(assert (=> b!907754 (=> (not res!612367) (not e!508786))))

(assert (=> b!907754 (= res!612367 (contains!4515 lt!409432 k0!1033))))

(assert (=> b!907754 (= lt!409432 (getCurrentListMap!2726 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907755 () Bool)

(assert (=> b!907755 (= e!508786 (not e!508785))))

(declare-fun res!612365 () Bool)

(assert (=> b!907755 (=> res!612365 e!508785)))

(assert (=> b!907755 (= res!612365 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26183 _keys!1386))))))

(declare-fun get!13539 (ValueCell!8882 V!29935) V!29935)

(declare-fun dynLambda!1371 (Int (_ BitVec 64)) V!29935)

(assert (=> b!907755 (= lt!409429 (get!13539 (select (arr!25722 _values!1152) i!717) (dynLambda!1371 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907755 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409431 () Unit!30772)

(declare-fun lemmaKeyInListMapIsInArray!230 (array!53537 array!53535 (_ BitVec 32) (_ BitVec 32) V!29935 V!29935 (_ BitVec 64) Int) Unit!30772)

(assert (=> b!907755 (= lt!409431 (lemmaKeyInListMapIsInArray!230 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907756 () Bool)

(declare-fun res!612369 () Bool)

(assert (=> b!907756 (=> (not res!612369) (not e!508786))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907756 (= res!612369 (inRange!0 i!717 mask!1756))))

(declare-fun b!907757 () Bool)

(declare-fun e!508791 () Bool)

(assert (=> b!907757 (= e!508791 tp_is_empty!18727)))

(declare-fun b!907758 () Bool)

(declare-fun res!612370 () Bool)

(assert (=> b!907758 (=> res!612370 e!508790)))

(assert (=> b!907758 (= res!612370 (not (= (apply!480 lt!409428 k0!1033) lt!409429)))))

(declare-fun mapIsEmpty!29803 () Bool)

(declare-fun mapRes!29803 () Bool)

(assert (=> mapIsEmpty!29803 mapRes!29803))

(declare-fun b!907759 () Bool)

(declare-fun res!612368 () Bool)

(assert (=> b!907759 (=> (not res!612368) (not e!508788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53537 (_ BitVec 32)) Bool)

(assert (=> b!907759 (= res!612368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907749 () Bool)

(declare-fun e!508789 () Bool)

(assert (=> b!907749 (= e!508789 (and e!508791 mapRes!29803))))

(declare-fun condMapEmpty!29803 () Bool)

(declare-fun mapDefault!29803 () ValueCell!8882)

(assert (=> b!907749 (= condMapEmpty!29803 (= (arr!25722 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8882)) mapDefault!29803)))))

(declare-fun res!612373 () Bool)

(assert (=> start!77892 (=> (not res!612373) (not e!508788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77892 (= res!612373 (validMask!0 mask!1756))))

(assert (=> start!77892 e!508788))

(declare-fun array_inv!20200 (array!53535) Bool)

(assert (=> start!77892 (and (array_inv!20200 _values!1152) e!508789)))

(assert (=> start!77892 tp!57190))

(assert (=> start!77892 true))

(assert (=> start!77892 tp_is_empty!18727))

(declare-fun array_inv!20201 (array!53537) Bool)

(assert (=> start!77892 (array_inv!20201 _keys!1386)))

(declare-fun b!907760 () Bool)

(declare-fun res!612366 () Bool)

(assert (=> b!907760 (=> (not res!612366) (not e!508788))))

(declare-datatypes ((List!18027 0))(
  ( (Nil!18024) (Cons!18023 (h!19175 (_ BitVec 64)) (t!25500 List!18027)) )
))
(declare-fun arrayNoDuplicates!0 (array!53537 (_ BitVec 32) List!18027) Bool)

(assert (=> b!907760 (= res!612366 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18024))))

(declare-fun mapNonEmpty!29803 () Bool)

(declare-fun tp!57189 () Bool)

(assert (=> mapNonEmpty!29803 (= mapRes!29803 (and tp!57189 e!508787))))

(declare-fun mapRest!29803 () (Array (_ BitVec 32) ValueCell!8882))

(declare-fun mapValue!29803 () ValueCell!8882)

(declare-fun mapKey!29803 () (_ BitVec 32))

(assert (=> mapNonEmpty!29803 (= (arr!25722 _values!1152) (store mapRest!29803 mapKey!29803 mapValue!29803))))

(assert (= (and start!77892 res!612373) b!907751))

(assert (= (and b!907751 res!612372) b!907759))

(assert (= (and b!907759 res!612368) b!907760))

(assert (= (and b!907760 res!612366) b!907754))

(assert (= (and b!907754 res!612367) b!907756))

(assert (= (and b!907756 res!612369) b!907750))

(assert (= (and b!907750 res!612371) b!907755))

(assert (= (and b!907755 (not res!612365)) b!907753))

(assert (= (and b!907753 (not res!612364)) b!907758))

(assert (= (and b!907758 (not res!612370)) b!907748))

(assert (= (and b!907749 condMapEmpty!29803) mapIsEmpty!29803))

(assert (= (and b!907749 (not condMapEmpty!29803)) mapNonEmpty!29803))

(get-info :version)

(assert (= (and mapNonEmpty!29803 ((_ is ValueCellFull!8882) mapValue!29803)) b!907752))

(assert (= (and b!907749 ((_ is ValueCellFull!8882) mapDefault!29803)) b!907757))

(assert (= start!77892 b!907749))

(declare-fun b_lambda!13197 () Bool)

(assert (=> (not b_lambda!13197) (not b!907755)))

(declare-fun t!25498 () Bool)

(declare-fun tb!5323 () Bool)

(assert (=> (and start!77892 (= defaultEntry!1160 defaultEntry!1160) t!25498) tb!5323))

(declare-fun result!10449 () Bool)

(assert (=> tb!5323 (= result!10449 tp_is_empty!18727)))

(assert (=> b!907755 t!25498))

(declare-fun b_and!26783 () Bool)

(assert (= b_and!26781 (and (=> t!25498 result!10449) b_and!26783)))

(declare-fun m!843509 () Bool)

(assert (=> b!907750 m!843509))

(declare-fun m!843511 () Bool)

(assert (=> b!907753 m!843511))

(declare-fun m!843513 () Bool)

(assert (=> b!907753 m!843513))

(declare-fun m!843515 () Bool)

(assert (=> b!907756 m!843515))

(declare-fun m!843517 () Bool)

(assert (=> b!907759 m!843517))

(declare-fun m!843519 () Bool)

(assert (=> b!907748 m!843519))

(declare-fun m!843521 () Bool)

(assert (=> b!907748 m!843521))

(declare-fun m!843523 () Bool)

(assert (=> start!77892 m!843523))

(declare-fun m!843525 () Bool)

(assert (=> start!77892 m!843525))

(declare-fun m!843527 () Bool)

(assert (=> start!77892 m!843527))

(declare-fun m!843529 () Bool)

(assert (=> b!907755 m!843529))

(declare-fun m!843531 () Bool)

(assert (=> b!907755 m!843531))

(declare-fun m!843533 () Bool)

(assert (=> b!907755 m!843533))

(declare-fun m!843535 () Bool)

(assert (=> b!907755 m!843535))

(assert (=> b!907755 m!843529))

(assert (=> b!907755 m!843533))

(declare-fun m!843537 () Bool)

(assert (=> b!907755 m!843537))

(declare-fun m!843539 () Bool)

(assert (=> b!907758 m!843539))

(declare-fun m!843541 () Bool)

(assert (=> b!907754 m!843541))

(declare-fun m!843543 () Bool)

(assert (=> b!907754 m!843543))

(declare-fun m!843545 () Bool)

(assert (=> mapNonEmpty!29803 m!843545))

(declare-fun m!843547 () Bool)

(assert (=> b!907760 m!843547))

(check-sat (not mapNonEmpty!29803) (not start!77892) (not b!907754) (not b_next!16309) (not b!907759) (not b!907748) (not b!907755) (not b!907760) tp_is_empty!18727 (not b!907753) (not b_lambda!13197) (not b!907758) (not b!907756) b_and!26783)
(check-sat b_and!26783 (not b_next!16309))
