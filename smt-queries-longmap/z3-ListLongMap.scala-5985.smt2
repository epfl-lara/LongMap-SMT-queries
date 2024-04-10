; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77738 () Bool)

(assert start!77738)

(declare-fun b_free!16323 () Bool)

(declare-fun b_next!16323 () Bool)

(assert (=> start!77738 (= b_free!16323 (not b_next!16323))))

(declare-fun tp!57230 () Bool)

(declare-fun b_and!26799 () Bool)

(assert (=> start!77738 (= tp!57230 b_and!26799)))

(declare-fun b!907132 () Bool)

(declare-fun e!508372 () Bool)

(declare-fun tp_is_empty!18741 () Bool)

(assert (=> b!907132 (= e!508372 tp_is_empty!18741)))

(declare-fun b!907133 () Bool)

(declare-fun res!612233 () Bool)

(declare-fun e!508370 () Bool)

(assert (=> b!907133 (=> (not res!612233) (not e!508370))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907133 (= res!612233 (inRange!0 i!717 mask!1756))))

(declare-fun b!907134 () Bool)

(declare-fun e!508374 () Bool)

(assert (=> b!907134 (= e!508370 (not e!508374))))

(declare-fun res!612239 () Bool)

(assert (=> b!907134 (=> res!612239 e!508374)))

(declare-datatypes ((array!53518 0))(
  ( (array!53519 (arr!25718 (Array (_ BitVec 32) (_ BitVec 64))) (size!26177 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53518)

(assert (=> b!907134 (= res!612239 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26177 _keys!1386))))))

(declare-datatypes ((V!29953 0))(
  ( (V!29954 (val!9421 Int)) )
))
(declare-datatypes ((ValueCell!8889 0))(
  ( (ValueCellFull!8889 (v!11926 V!29953)) (EmptyCell!8889) )
))
(declare-datatypes ((array!53520 0))(
  ( (array!53521 (arr!25719 (Array (_ BitVec 32) ValueCell!8889)) (size!26178 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53520)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409173 () V!29953)

(declare-fun get!13527 (ValueCell!8889 V!29953) V!29953)

(declare-fun dynLambda!1359 (Int (_ BitVec 64)) V!29953)

(assert (=> b!907134 (= lt!409173 (get!13527 (select (arr!25719 _values!1152) i!717) (dynLambda!1359 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907134 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29953)

(declare-datatypes ((Unit!30786 0))(
  ( (Unit!30787) )
))
(declare-fun lt!409175 () Unit!30786)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29953)

(declare-fun lemmaKeyInListMapIsInArray!231 (array!53518 array!53520 (_ BitVec 32) (_ BitVec 32) V!29953 V!29953 (_ BitVec 64) Int) Unit!30786)

(assert (=> b!907134 (= lt!409175 (lemmaKeyInListMapIsInArray!231 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907135 () Bool)

(declare-fun res!612232 () Bool)

(declare-fun e!508373 () Bool)

(assert (=> b!907135 (=> (not res!612232) (not e!508373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53518 (_ BitVec 32)) Bool)

(assert (=> b!907135 (= res!612232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907136 () Bool)

(declare-fun res!612238 () Bool)

(assert (=> b!907136 (=> (not res!612238) (not e!508373))))

(assert (=> b!907136 (= res!612238 (and (= (size!26178 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26177 _keys!1386) (size!26178 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907137 () Bool)

(assert (=> b!907137 (= e!508373 e!508370)))

(declare-fun res!612230 () Bool)

(assert (=> b!907137 (=> (not res!612230) (not e!508370))))

(declare-datatypes ((tuple2!12268 0))(
  ( (tuple2!12269 (_1!6145 (_ BitVec 64)) (_2!6145 V!29953)) )
))
(declare-datatypes ((List!18069 0))(
  ( (Nil!18066) (Cons!18065 (h!19211 tuple2!12268) (t!25564 List!18069)) )
))
(declare-datatypes ((ListLongMap!10965 0))(
  ( (ListLongMap!10966 (toList!5498 List!18069)) )
))
(declare-fun lt!409172 () ListLongMap!10965)

(declare-fun contains!4543 (ListLongMap!10965 (_ BitVec 64)) Bool)

(assert (=> b!907137 (= res!612230 (contains!4543 lt!409172 k0!1033))))

(declare-fun getCurrentListMap!2764 (array!53518 array!53520 (_ BitVec 32) (_ BitVec 32) V!29953 V!29953 (_ BitVec 32) Int) ListLongMap!10965)

(assert (=> b!907137 (= lt!409172 (getCurrentListMap!2764 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29824 () Bool)

(declare-fun mapRes!29824 () Bool)

(assert (=> mapIsEmpty!29824 mapRes!29824))

(declare-fun b!907138 () Bool)

(declare-fun res!612237 () Bool)

(assert (=> b!907138 (=> (not res!612237) (not e!508373))))

(declare-datatypes ((List!18070 0))(
  ( (Nil!18067) (Cons!18066 (h!19212 (_ BitVec 64)) (t!25565 List!18070)) )
))
(declare-fun arrayNoDuplicates!0 (array!53518 (_ BitVec 32) List!18070) Bool)

(assert (=> b!907138 (= res!612237 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18067))))

(declare-fun res!612235 () Bool)

(assert (=> start!77738 (=> (not res!612235) (not e!508373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77738 (= res!612235 (validMask!0 mask!1756))))

(assert (=> start!77738 e!508373))

(declare-fun e!508376 () Bool)

(declare-fun array_inv!20144 (array!53520) Bool)

(assert (=> start!77738 (and (array_inv!20144 _values!1152) e!508376)))

(assert (=> start!77738 tp!57230))

(assert (=> start!77738 true))

(assert (=> start!77738 tp_is_empty!18741))

(declare-fun array_inv!20145 (array!53518) Bool)

(assert (=> start!77738 (array_inv!20145 _keys!1386)))

(declare-fun b!907139 () Bool)

(declare-fun res!612236 () Bool)

(assert (=> b!907139 (=> (not res!612236) (not e!508370))))

(assert (=> b!907139 (= res!612236 (and (= (select (arr!25718 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907140 () Bool)

(declare-fun e!508371 () Bool)

(assert (=> b!907140 (= e!508371 true)))

(declare-fun apply!482 (ListLongMap!10965 (_ BitVec 64)) V!29953)

(assert (=> b!907140 (= (apply!482 lt!409172 k0!1033) lt!409173)))

(declare-fun lt!409174 () Unit!30786)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!36 (array!53518 array!53520 (_ BitVec 32) (_ BitVec 32) V!29953 V!29953 (_ BitVec 64) V!29953 (_ BitVec 32) Int) Unit!30786)

(assert (=> b!907140 (= lt!409174 (lemmaListMapApplyFromThenApplyFromZero!36 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409173 i!717 defaultEntry!1160))))

(declare-fun b!907141 () Bool)

(declare-fun e!508375 () Bool)

(assert (=> b!907141 (= e!508375 tp_is_empty!18741)))

(declare-fun b!907142 () Bool)

(declare-fun res!612234 () Bool)

(assert (=> b!907142 (=> res!612234 e!508371)))

(declare-fun lt!409176 () ListLongMap!10965)

(assert (=> b!907142 (= res!612234 (not (= (apply!482 lt!409176 k0!1033) lt!409173)))))

(declare-fun mapNonEmpty!29824 () Bool)

(declare-fun tp!57231 () Bool)

(assert (=> mapNonEmpty!29824 (= mapRes!29824 (and tp!57231 e!508375))))

(declare-fun mapValue!29824 () ValueCell!8889)

(declare-fun mapKey!29824 () (_ BitVec 32))

(declare-fun mapRest!29824 () (Array (_ BitVec 32) ValueCell!8889))

(assert (=> mapNonEmpty!29824 (= (arr!25719 _values!1152) (store mapRest!29824 mapKey!29824 mapValue!29824))))

(declare-fun b!907143 () Bool)

(assert (=> b!907143 (= e!508376 (and e!508372 mapRes!29824))))

(declare-fun condMapEmpty!29824 () Bool)

(declare-fun mapDefault!29824 () ValueCell!8889)

(assert (=> b!907143 (= condMapEmpty!29824 (= (arr!25719 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8889)) mapDefault!29824)))))

(declare-fun b!907144 () Bool)

(assert (=> b!907144 (= e!508374 e!508371)))

(declare-fun res!612231 () Bool)

(assert (=> b!907144 (=> res!612231 e!508371)))

(assert (=> b!907144 (= res!612231 (not (contains!4543 lt!409176 k0!1033)))))

(assert (=> b!907144 (= lt!409176 (getCurrentListMap!2764 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77738 res!612235) b!907136))

(assert (= (and b!907136 res!612238) b!907135))

(assert (= (and b!907135 res!612232) b!907138))

(assert (= (and b!907138 res!612237) b!907137))

(assert (= (and b!907137 res!612230) b!907133))

(assert (= (and b!907133 res!612233) b!907139))

(assert (= (and b!907139 res!612236) b!907134))

(assert (= (and b!907134 (not res!612239)) b!907144))

(assert (= (and b!907144 (not res!612231)) b!907142))

(assert (= (and b!907142 (not res!612234)) b!907140))

(assert (= (and b!907143 condMapEmpty!29824) mapIsEmpty!29824))

(assert (= (and b!907143 (not condMapEmpty!29824)) mapNonEmpty!29824))

(get-info :version)

(assert (= (and mapNonEmpty!29824 ((_ is ValueCellFull!8889) mapValue!29824)) b!907141))

(assert (= (and b!907143 ((_ is ValueCellFull!8889) mapDefault!29824)) b!907132))

(assert (= start!77738 b!907143))

(declare-fun b_lambda!13197 () Bool)

(assert (=> (not b_lambda!13197) (not b!907134)))

(declare-fun t!25563 () Bool)

(declare-fun tb!5345 () Bool)

(assert (=> (and start!77738 (= defaultEntry!1160 defaultEntry!1160) t!25563) tb!5345))

(declare-fun result!10485 () Bool)

(assert (=> tb!5345 (= result!10485 tp_is_empty!18741)))

(assert (=> b!907134 t!25563))

(declare-fun b_and!26801 () Bool)

(assert (= b_and!26799 (and (=> t!25563 result!10485) b_and!26801)))

(declare-fun m!842495 () Bool)

(assert (=> b!907137 m!842495))

(declare-fun m!842497 () Bool)

(assert (=> b!907137 m!842497))

(declare-fun m!842499 () Bool)

(assert (=> b!907138 m!842499))

(declare-fun m!842501 () Bool)

(assert (=> start!77738 m!842501))

(declare-fun m!842503 () Bool)

(assert (=> start!77738 m!842503))

(declare-fun m!842505 () Bool)

(assert (=> start!77738 m!842505))

(declare-fun m!842507 () Bool)

(assert (=> b!907140 m!842507))

(declare-fun m!842509 () Bool)

(assert (=> b!907140 m!842509))

(declare-fun m!842511 () Bool)

(assert (=> b!907134 m!842511))

(declare-fun m!842513 () Bool)

(assert (=> b!907134 m!842513))

(declare-fun m!842515 () Bool)

(assert (=> b!907134 m!842515))

(declare-fun m!842517 () Bool)

(assert (=> b!907134 m!842517))

(assert (=> b!907134 m!842511))

(assert (=> b!907134 m!842515))

(declare-fun m!842519 () Bool)

(assert (=> b!907134 m!842519))

(declare-fun m!842521 () Bool)

(assert (=> b!907144 m!842521))

(declare-fun m!842523 () Bool)

(assert (=> b!907144 m!842523))

(declare-fun m!842525 () Bool)

(assert (=> mapNonEmpty!29824 m!842525))

(declare-fun m!842527 () Bool)

(assert (=> b!907135 m!842527))

(declare-fun m!842529 () Bool)

(assert (=> b!907139 m!842529))

(declare-fun m!842531 () Bool)

(assert (=> b!907133 m!842531))

(declare-fun m!842533 () Bool)

(assert (=> b!907142 m!842533))

(check-sat (not b!907140) (not start!77738) (not b!907138) (not b!907134) (not b!907133) (not b!907135) (not b!907142) (not b!907144) (not b_lambda!13197) b_and!26801 (not b!907137) (not b_next!16323) tp_is_empty!18741 (not mapNonEmpty!29824))
(check-sat b_and!26801 (not b_next!16323))
