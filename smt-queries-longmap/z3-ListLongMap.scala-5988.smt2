; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77756 () Bool)

(assert start!77756)

(declare-fun b_free!16341 () Bool)

(declare-fun b_next!16341 () Bool)

(assert (=> start!77756 (= b_free!16341 (not b_next!16341))))

(declare-fun tp!57284 () Bool)

(declare-fun b_and!26835 () Bool)

(assert (=> start!77756 (= tp!57284 b_and!26835)))

(declare-fun b!907501 () Bool)

(declare-fun e!508590 () Bool)

(declare-fun tp_is_empty!18759 () Bool)

(assert (=> b!907501 (= e!508590 tp_is_empty!18759)))

(declare-fun mapNonEmpty!29851 () Bool)

(declare-fun mapRes!29851 () Bool)

(declare-fun tp!57285 () Bool)

(declare-fun e!508586 () Bool)

(assert (=> mapNonEmpty!29851 (= mapRes!29851 (and tp!57285 e!508586))))

(declare-datatypes ((V!29977 0))(
  ( (V!29978 (val!9430 Int)) )
))
(declare-datatypes ((ValueCell!8898 0))(
  ( (ValueCellFull!8898 (v!11935 V!29977)) (EmptyCell!8898) )
))
(declare-datatypes ((array!53550 0))(
  ( (array!53551 (arr!25734 (Array (_ BitVec 32) ValueCell!8898)) (size!26193 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53550)

(declare-fun mapValue!29851 () ValueCell!8898)

(declare-fun mapKey!29851 () (_ BitVec 32))

(declare-fun mapRest!29851 () (Array (_ BitVec 32) ValueCell!8898))

(assert (=> mapNonEmpty!29851 (= (arr!25734 _values!1152) (store mapRest!29851 mapKey!29851 mapValue!29851))))

(declare-fun b!907502 () Bool)

(declare-fun e!508592 () Bool)

(declare-datatypes ((array!53552 0))(
  ( (array!53553 (arr!25735 (Array (_ BitVec 32) (_ BitVec 64))) (size!26194 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53552)

(assert (=> b!907502 (= e!508592 (bvslt #b00000000000000000000000000000000 (size!26194 _keys!1386)))))

(declare-datatypes ((tuple2!12280 0))(
  ( (tuple2!12281 (_1!6151 (_ BitVec 64)) (_2!6151 V!29977)) )
))
(declare-datatypes ((List!18080 0))(
  ( (Nil!18077) (Cons!18076 (h!19222 tuple2!12280) (t!25593 List!18080)) )
))
(declare-datatypes ((ListLongMap!10977 0))(
  ( (ListLongMap!10978 (toList!5504 List!18080)) )
))
(declare-fun lt!409308 () ListLongMap!10977)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409309 () V!29977)

(declare-fun apply!488 (ListLongMap!10977 (_ BitVec 64)) V!29977)

(assert (=> b!907502 (= (apply!488 lt!409308 k0!1033) lt!409309)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29977)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29977)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30798 0))(
  ( (Unit!30799) )
))
(declare-fun lt!409311 () Unit!30798)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!41 (array!53552 array!53550 (_ BitVec 32) (_ BitVec 32) V!29977 V!29977 (_ BitVec 64) V!29977 (_ BitVec 32) Int) Unit!30798)

(assert (=> b!907502 (= lt!409311 (lemmaListMapApplyFromThenApplyFromZero!41 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409309 i!717 defaultEntry!1160))))

(declare-fun b!907503 () Bool)

(declare-fun e!508587 () Bool)

(assert (=> b!907503 (= e!508587 (and e!508590 mapRes!29851))))

(declare-fun condMapEmpty!29851 () Bool)

(declare-fun mapDefault!29851 () ValueCell!8898)

(assert (=> b!907503 (= condMapEmpty!29851 (= (arr!25734 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8898)) mapDefault!29851)))))

(declare-fun res!612502 () Bool)

(declare-fun e!508589 () Bool)

(assert (=> start!77756 (=> (not res!612502) (not e!508589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77756 (= res!612502 (validMask!0 mask!1756))))

(assert (=> start!77756 e!508589))

(declare-fun array_inv!20152 (array!53550) Bool)

(assert (=> start!77756 (and (array_inv!20152 _values!1152) e!508587)))

(assert (=> start!77756 tp!57284))

(assert (=> start!77756 true))

(assert (=> start!77756 tp_is_empty!18759))

(declare-fun array_inv!20153 (array!53552) Bool)

(assert (=> start!77756 (array_inv!20153 _keys!1386)))

(declare-fun b!907504 () Bool)

(declare-fun res!612501 () Bool)

(assert (=> b!907504 (=> (not res!612501) (not e!508589))))

(assert (=> b!907504 (= res!612501 (and (= (size!26193 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26194 _keys!1386) (size!26193 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907505 () Bool)

(declare-fun res!612503 () Bool)

(assert (=> b!907505 (=> (not res!612503) (not e!508589))))

(declare-datatypes ((List!18081 0))(
  ( (Nil!18078) (Cons!18077 (h!19223 (_ BitVec 64)) (t!25594 List!18081)) )
))
(declare-fun arrayNoDuplicates!0 (array!53552 (_ BitVec 32) List!18081) Bool)

(assert (=> b!907505 (= res!612503 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18078))))

(declare-fun b!907506 () Bool)

(assert (=> b!907506 (= e!508586 tp_is_empty!18759)))

(declare-fun b!907507 () Bool)

(declare-fun e!508588 () Bool)

(assert (=> b!907507 (= e!508589 e!508588)))

(declare-fun res!612506 () Bool)

(assert (=> b!907507 (=> (not res!612506) (not e!508588))))

(declare-fun contains!4548 (ListLongMap!10977 (_ BitVec 64)) Bool)

(assert (=> b!907507 (= res!612506 (contains!4548 lt!409308 k0!1033))))

(declare-fun getCurrentListMap!2769 (array!53552 array!53550 (_ BitVec 32) (_ BitVec 32) V!29977 V!29977 (_ BitVec 32) Int) ListLongMap!10977)

(assert (=> b!907507 (= lt!409308 (getCurrentListMap!2769 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907508 () Bool)

(declare-fun res!612507 () Bool)

(assert (=> b!907508 (=> (not res!612507) (not e!508589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53552 (_ BitVec 32)) Bool)

(assert (=> b!907508 (= res!612507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29851 () Bool)

(assert (=> mapIsEmpty!29851 mapRes!29851))

(declare-fun b!907509 () Bool)

(declare-fun res!612504 () Bool)

(assert (=> b!907509 (=> (not res!612504) (not e!508588))))

(assert (=> b!907509 (= res!612504 (and (= (select (arr!25735 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907510 () Bool)

(declare-fun res!612505 () Bool)

(assert (=> b!907510 (=> res!612505 e!508592)))

(declare-fun lt!409307 () ListLongMap!10977)

(assert (=> b!907510 (= res!612505 (not (= (apply!488 lt!409307 k0!1033) lt!409309)))))

(declare-fun b!907511 () Bool)

(declare-fun e!508591 () Bool)

(assert (=> b!907511 (= e!508591 e!508592)))

(declare-fun res!612508 () Bool)

(assert (=> b!907511 (=> res!612508 e!508592)))

(assert (=> b!907511 (= res!612508 (not (contains!4548 lt!409307 k0!1033)))))

(assert (=> b!907511 (= lt!409307 (getCurrentListMap!2769 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907512 () Bool)

(declare-fun res!612500 () Bool)

(assert (=> b!907512 (=> (not res!612500) (not e!508588))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907512 (= res!612500 (inRange!0 i!717 mask!1756))))

(declare-fun b!907513 () Bool)

(assert (=> b!907513 (= e!508588 (not e!508591))))

(declare-fun res!612509 () Bool)

(assert (=> b!907513 (=> res!612509 e!508591)))

(assert (=> b!907513 (= res!612509 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26194 _keys!1386))))))

(declare-fun get!13538 (ValueCell!8898 V!29977) V!29977)

(declare-fun dynLambda!1364 (Int (_ BitVec 64)) V!29977)

(assert (=> b!907513 (= lt!409309 (get!13538 (select (arr!25734 _values!1152) i!717) (dynLambda!1364 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907513 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409310 () Unit!30798)

(declare-fun lemmaKeyInListMapIsInArray!236 (array!53552 array!53550 (_ BitVec 32) (_ BitVec 32) V!29977 V!29977 (_ BitVec 64) Int) Unit!30798)

(assert (=> b!907513 (= lt!409310 (lemmaKeyInListMapIsInArray!236 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!77756 res!612502) b!907504))

(assert (= (and b!907504 res!612501) b!907508))

(assert (= (and b!907508 res!612507) b!907505))

(assert (= (and b!907505 res!612503) b!907507))

(assert (= (and b!907507 res!612506) b!907512))

(assert (= (and b!907512 res!612500) b!907509))

(assert (= (and b!907509 res!612504) b!907513))

(assert (= (and b!907513 (not res!612509)) b!907511))

(assert (= (and b!907511 (not res!612508)) b!907510))

(assert (= (and b!907510 (not res!612505)) b!907502))

(assert (= (and b!907503 condMapEmpty!29851) mapIsEmpty!29851))

(assert (= (and b!907503 (not condMapEmpty!29851)) mapNonEmpty!29851))

(get-info :version)

(assert (= (and mapNonEmpty!29851 ((_ is ValueCellFull!8898) mapValue!29851)) b!907506))

(assert (= (and b!907503 ((_ is ValueCellFull!8898) mapDefault!29851)) b!907501))

(assert (= start!77756 b!907503))

(declare-fun b_lambda!13215 () Bool)

(assert (=> (not b_lambda!13215) (not b!907513)))

(declare-fun t!25592 () Bool)

(declare-fun tb!5363 () Bool)

(assert (=> (and start!77756 (= defaultEntry!1160 defaultEntry!1160) t!25592) tb!5363))

(declare-fun result!10521 () Bool)

(assert (=> tb!5363 (= result!10521 tp_is_empty!18759)))

(assert (=> b!907513 t!25592))

(declare-fun b_and!26837 () Bool)

(assert (= b_and!26835 (and (=> t!25592 result!10521) b_and!26837)))

(declare-fun m!842855 () Bool)

(assert (=> b!907502 m!842855))

(declare-fun m!842857 () Bool)

(assert (=> b!907502 m!842857))

(declare-fun m!842859 () Bool)

(assert (=> b!907507 m!842859))

(declare-fun m!842861 () Bool)

(assert (=> b!907507 m!842861))

(declare-fun m!842863 () Bool)

(assert (=> b!907510 m!842863))

(declare-fun m!842865 () Bool)

(assert (=> b!907508 m!842865))

(declare-fun m!842867 () Bool)

(assert (=> b!907509 m!842867))

(declare-fun m!842869 () Bool)

(assert (=> mapNonEmpty!29851 m!842869))

(declare-fun m!842871 () Bool)

(assert (=> b!907513 m!842871))

(declare-fun m!842873 () Bool)

(assert (=> b!907513 m!842873))

(declare-fun m!842875 () Bool)

(assert (=> b!907513 m!842875))

(declare-fun m!842877 () Bool)

(assert (=> b!907513 m!842877))

(assert (=> b!907513 m!842871))

(assert (=> b!907513 m!842875))

(declare-fun m!842879 () Bool)

(assert (=> b!907513 m!842879))

(declare-fun m!842881 () Bool)

(assert (=> start!77756 m!842881))

(declare-fun m!842883 () Bool)

(assert (=> start!77756 m!842883))

(declare-fun m!842885 () Bool)

(assert (=> start!77756 m!842885))

(declare-fun m!842887 () Bool)

(assert (=> b!907512 m!842887))

(declare-fun m!842889 () Bool)

(assert (=> b!907505 m!842889))

(declare-fun m!842891 () Bool)

(assert (=> b!907511 m!842891))

(declare-fun m!842893 () Bool)

(assert (=> b!907511 m!842893))

(check-sat (not b!907513) (not b!907507) (not b!907502) (not b_lambda!13215) (not b!907511) tp_is_empty!18759 b_and!26837 (not b!907510) (not b_next!16341) (not start!77756) (not b!907512) (not mapNonEmpty!29851) (not b!907505) (not b!907508))
(check-sat b_and!26837 (not b_next!16341))
