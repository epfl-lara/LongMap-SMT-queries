; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77750 () Bool)

(assert start!77750)

(declare-fun b_free!16335 () Bool)

(declare-fun b_next!16335 () Bool)

(assert (=> start!77750 (= b_free!16335 (not b_next!16335))))

(declare-fun tp!57266 () Bool)

(declare-fun b_and!26823 () Bool)

(assert (=> start!77750 (= tp!57266 b_and!26823)))

(declare-fun res!612412 () Bool)

(declare-fun e!508519 () Bool)

(assert (=> start!77750 (=> (not res!612412) (not e!508519))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77750 (= res!612412 (validMask!0 mask!1756))))

(assert (=> start!77750 e!508519))

(declare-datatypes ((V!29969 0))(
  ( (V!29970 (val!9427 Int)) )
))
(declare-datatypes ((ValueCell!8895 0))(
  ( (ValueCellFull!8895 (v!11932 V!29969)) (EmptyCell!8895) )
))
(declare-datatypes ((array!53540 0))(
  ( (array!53541 (arr!25729 (Array (_ BitVec 32) ValueCell!8895)) (size!26188 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53540)

(declare-fun e!508517 () Bool)

(declare-fun array_inv!20148 (array!53540) Bool)

(assert (=> start!77750 (and (array_inv!20148 _values!1152) e!508517)))

(assert (=> start!77750 tp!57266))

(assert (=> start!77750 true))

(declare-fun tp_is_empty!18753 () Bool)

(assert (=> start!77750 tp_is_empty!18753))

(declare-datatypes ((array!53542 0))(
  ( (array!53543 (arr!25730 (Array (_ BitVec 32) (_ BitVec 64))) (size!26189 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53542)

(declare-fun array_inv!20149 (array!53542) Bool)

(assert (=> start!77750 (array_inv!20149 _keys!1386)))

(declare-fun b!907378 () Bool)

(declare-fun res!612410 () Bool)

(assert (=> b!907378 (=> (not res!612410) (not e!508519))))

(declare-datatypes ((List!18076 0))(
  ( (Nil!18073) (Cons!18072 (h!19218 (_ BitVec 64)) (t!25583 List!18076)) )
))
(declare-fun arrayNoDuplicates!0 (array!53542 (_ BitVec 32) List!18076) Bool)

(assert (=> b!907378 (= res!612410 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18073))))

(declare-fun b!907379 () Bool)

(declare-fun res!612411 () Bool)

(declare-fun e!508518 () Bool)

(assert (=> b!907379 (=> res!612411 e!508518)))

(declare-datatypes ((tuple2!12276 0))(
  ( (tuple2!12277 (_1!6149 (_ BitVec 64)) (_2!6149 V!29969)) )
))
(declare-datatypes ((List!18077 0))(
  ( (Nil!18074) (Cons!18073 (h!19219 tuple2!12276) (t!25584 List!18077)) )
))
(declare-datatypes ((ListLongMap!10973 0))(
  ( (ListLongMap!10974 (toList!5502 List!18077)) )
))
(declare-fun lt!409266 () ListLongMap!10973)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409265 () V!29969)

(declare-fun apply!486 (ListLongMap!10973 (_ BitVec 64)) V!29969)

(assert (=> b!907379 (= res!612411 (not (= (apply!486 lt!409266 k0!1033) lt!409265)))))

(declare-fun b!907380 () Bool)

(declare-fun e!508516 () Bool)

(assert (=> b!907380 (= e!508516 tp_is_empty!18753)))

(declare-fun b!907381 () Bool)

(assert (=> b!907381 (= e!508518 true)))

(declare-fun lt!409262 () ListLongMap!10973)

(assert (=> b!907381 (= (apply!486 lt!409262 k0!1033) lt!409265)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((Unit!30794 0))(
  ( (Unit!30795) )
))
(declare-fun lt!409263 () Unit!30794)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29969)

(declare-fun zeroValue!1094 () V!29969)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!39 (array!53542 array!53540 (_ BitVec 32) (_ BitVec 32) V!29969 V!29969 (_ BitVec 64) V!29969 (_ BitVec 32) Int) Unit!30794)

(assert (=> b!907381 (= lt!409263 (lemmaListMapApplyFromThenApplyFromZero!39 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409265 i!717 defaultEntry!1160))))

(declare-fun b!907382 () Bool)

(declare-fun e!508514 () Bool)

(assert (=> b!907382 (= e!508519 e!508514)))

(declare-fun res!612419 () Bool)

(assert (=> b!907382 (=> (not res!612419) (not e!508514))))

(declare-fun contains!4546 (ListLongMap!10973 (_ BitVec 64)) Bool)

(assert (=> b!907382 (= res!612419 (contains!4546 lt!409262 k0!1033))))

(declare-fun getCurrentListMap!2767 (array!53542 array!53540 (_ BitVec 32) (_ BitVec 32) V!29969 V!29969 (_ BitVec 32) Int) ListLongMap!10973)

(assert (=> b!907382 (= lt!409262 (getCurrentListMap!2767 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907383 () Bool)

(declare-fun e!508521 () Bool)

(assert (=> b!907383 (= e!508521 e!508518)))

(declare-fun res!612416 () Bool)

(assert (=> b!907383 (=> res!612416 e!508518)))

(assert (=> b!907383 (= res!612416 (not (contains!4546 lt!409266 k0!1033)))))

(assert (=> b!907383 (= lt!409266 (getCurrentListMap!2767 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907384 () Bool)

(declare-fun res!612417 () Bool)

(assert (=> b!907384 (=> (not res!612417) (not e!508519))))

(assert (=> b!907384 (= res!612417 (and (= (size!26188 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26189 _keys!1386) (size!26188 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907385 () Bool)

(declare-fun res!612414 () Bool)

(assert (=> b!907385 (=> (not res!612414) (not e!508514))))

(assert (=> b!907385 (= res!612414 (and (= (select (arr!25730 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907386 () Bool)

(declare-fun e!508515 () Bool)

(assert (=> b!907386 (= e!508515 tp_is_empty!18753)))

(declare-fun mapIsEmpty!29842 () Bool)

(declare-fun mapRes!29842 () Bool)

(assert (=> mapIsEmpty!29842 mapRes!29842))

(declare-fun b!907387 () Bool)

(assert (=> b!907387 (= e!508514 (not e!508521))))

(declare-fun res!612418 () Bool)

(assert (=> b!907387 (=> res!612418 e!508521)))

(assert (=> b!907387 (= res!612418 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26189 _keys!1386))))))

(declare-fun get!13535 (ValueCell!8895 V!29969) V!29969)

(declare-fun dynLambda!1363 (Int (_ BitVec 64)) V!29969)

(assert (=> b!907387 (= lt!409265 (get!13535 (select (arr!25729 _values!1152) i!717) (dynLambda!1363 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907387 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409264 () Unit!30794)

(declare-fun lemmaKeyInListMapIsInArray!235 (array!53542 array!53540 (_ BitVec 32) (_ BitVec 32) V!29969 V!29969 (_ BitVec 64) Int) Unit!30794)

(assert (=> b!907387 (= lt!409264 (lemmaKeyInListMapIsInArray!235 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907388 () Bool)

(declare-fun res!612413 () Bool)

(assert (=> b!907388 (=> (not res!612413) (not e!508519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53542 (_ BitVec 32)) Bool)

(assert (=> b!907388 (= res!612413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907389 () Bool)

(assert (=> b!907389 (= e!508517 (and e!508515 mapRes!29842))))

(declare-fun condMapEmpty!29842 () Bool)

(declare-fun mapDefault!29842 () ValueCell!8895)

(assert (=> b!907389 (= condMapEmpty!29842 (= (arr!25729 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8895)) mapDefault!29842)))))

(declare-fun b!907390 () Bool)

(declare-fun res!612415 () Bool)

(assert (=> b!907390 (=> (not res!612415) (not e!508514))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907390 (= res!612415 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29842 () Bool)

(declare-fun tp!57267 () Bool)

(assert (=> mapNonEmpty!29842 (= mapRes!29842 (and tp!57267 e!508516))))

(declare-fun mapKey!29842 () (_ BitVec 32))

(declare-fun mapRest!29842 () (Array (_ BitVec 32) ValueCell!8895))

(declare-fun mapValue!29842 () ValueCell!8895)

(assert (=> mapNonEmpty!29842 (= (arr!25729 _values!1152) (store mapRest!29842 mapKey!29842 mapValue!29842))))

(assert (= (and start!77750 res!612412) b!907384))

(assert (= (and b!907384 res!612417) b!907388))

(assert (= (and b!907388 res!612413) b!907378))

(assert (= (and b!907378 res!612410) b!907382))

(assert (= (and b!907382 res!612419) b!907390))

(assert (= (and b!907390 res!612415) b!907385))

(assert (= (and b!907385 res!612414) b!907387))

(assert (= (and b!907387 (not res!612418)) b!907383))

(assert (= (and b!907383 (not res!612416)) b!907379))

(assert (= (and b!907379 (not res!612411)) b!907381))

(assert (= (and b!907389 condMapEmpty!29842) mapIsEmpty!29842))

(assert (= (and b!907389 (not condMapEmpty!29842)) mapNonEmpty!29842))

(get-info :version)

(assert (= (and mapNonEmpty!29842 ((_ is ValueCellFull!8895) mapValue!29842)) b!907380))

(assert (= (and b!907389 ((_ is ValueCellFull!8895) mapDefault!29842)) b!907386))

(assert (= start!77750 b!907389))

(declare-fun b_lambda!13209 () Bool)

(assert (=> (not b_lambda!13209) (not b!907387)))

(declare-fun t!25582 () Bool)

(declare-fun tb!5357 () Bool)

(assert (=> (and start!77750 (= defaultEntry!1160 defaultEntry!1160) t!25582) tb!5357))

(declare-fun result!10509 () Bool)

(assert (=> tb!5357 (= result!10509 tp_is_empty!18753)))

(assert (=> b!907387 t!25582))

(declare-fun b_and!26825 () Bool)

(assert (= b_and!26823 (and (=> t!25582 result!10509) b_and!26825)))

(declare-fun m!842735 () Bool)

(assert (=> start!77750 m!842735))

(declare-fun m!842737 () Bool)

(assert (=> start!77750 m!842737))

(declare-fun m!842739 () Bool)

(assert (=> start!77750 m!842739))

(declare-fun m!842741 () Bool)

(assert (=> b!907378 m!842741))

(declare-fun m!842743 () Bool)

(assert (=> b!907385 m!842743))

(declare-fun m!842745 () Bool)

(assert (=> mapNonEmpty!29842 m!842745))

(declare-fun m!842747 () Bool)

(assert (=> b!907379 m!842747))

(declare-fun m!842749 () Bool)

(assert (=> b!907382 m!842749))

(declare-fun m!842751 () Bool)

(assert (=> b!907382 m!842751))

(declare-fun m!842753 () Bool)

(assert (=> b!907381 m!842753))

(declare-fun m!842755 () Bool)

(assert (=> b!907381 m!842755))

(declare-fun m!842757 () Bool)

(assert (=> b!907387 m!842757))

(declare-fun m!842759 () Bool)

(assert (=> b!907387 m!842759))

(declare-fun m!842761 () Bool)

(assert (=> b!907387 m!842761))

(declare-fun m!842763 () Bool)

(assert (=> b!907387 m!842763))

(assert (=> b!907387 m!842757))

(assert (=> b!907387 m!842761))

(declare-fun m!842765 () Bool)

(assert (=> b!907387 m!842765))

(declare-fun m!842767 () Bool)

(assert (=> b!907383 m!842767))

(declare-fun m!842769 () Bool)

(assert (=> b!907383 m!842769))

(declare-fun m!842771 () Bool)

(assert (=> b!907390 m!842771))

(declare-fun m!842773 () Bool)

(assert (=> b!907388 m!842773))

(check-sat (not b_lambda!13209) (not b!907378) (not b!907382) (not mapNonEmpty!29842) (not b!907388) tp_is_empty!18753 (not start!77750) (not b!907383) (not b!907381) b_and!26825 (not b!907387) (not b!907379) (not b!907390) (not b_next!16335))
(check-sat b_and!26825 (not b_next!16335))
