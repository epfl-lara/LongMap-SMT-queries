; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77874 () Bool)

(assert start!77874)

(declare-fun b_free!16291 () Bool)

(declare-fun b_next!16291 () Bool)

(assert (=> start!77874 (= b_free!16291 (not b_next!16291))))

(declare-fun tp!57136 () Bool)

(declare-fun b_and!26745 () Bool)

(assert (=> start!77874 (= tp!57136 b_and!26745)))

(declare-fun b!907380 () Bool)

(declare-fun res!612100 () Bool)

(declare-fun e!508571 () Bool)

(assert (=> b!907380 (=> (not res!612100) (not e!508571))))

(declare-datatypes ((array!53501 0))(
  ( (array!53502 (arr!25705 (Array (_ BitVec 32) (_ BitVec 64))) (size!26165 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53501)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53501 (_ BitVec 32)) Bool)

(assert (=> b!907380 (= res!612100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907381 () Bool)

(declare-fun res!612098 () Bool)

(declare-fun e!508572 () Bool)

(assert (=> b!907381 (=> (not res!612098) (not e!508572))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907381 (= res!612098 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29776 () Bool)

(declare-fun mapRes!29776 () Bool)

(assert (=> mapIsEmpty!29776 mapRes!29776))

(declare-fun b!907382 () Bool)

(declare-fun e!508573 () Bool)

(declare-fun e!508575 () Bool)

(assert (=> b!907382 (= e!508573 (and e!508575 mapRes!29776))))

(declare-fun condMapEmpty!29776 () Bool)

(declare-datatypes ((V!29911 0))(
  ( (V!29912 (val!9405 Int)) )
))
(declare-datatypes ((ValueCell!8873 0))(
  ( (ValueCellFull!8873 (v!11907 V!29911)) (EmptyCell!8873) )
))
(declare-datatypes ((array!53503 0))(
  ( (array!53504 (arr!25706 (Array (_ BitVec 32) ValueCell!8873)) (size!26166 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53503)

(declare-fun mapDefault!29776 () ValueCell!8873)

(assert (=> b!907382 (= condMapEmpty!29776 (= (arr!25706 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8873)) mapDefault!29776)))))

(declare-fun b!907383 () Bool)

(declare-fun res!612094 () Bool)

(assert (=> b!907383 (=> (not res!612094) (not e!508572))))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!907383 (= res!612094 (and (= (select (arr!25705 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907384 () Bool)

(declare-fun e!508574 () Bool)

(declare-fun e!508568 () Bool)

(assert (=> b!907384 (= e!508574 e!508568)))

(declare-fun res!612097 () Bool)

(assert (=> b!907384 (=> res!612097 e!508568)))

(declare-datatypes ((tuple2!12176 0))(
  ( (tuple2!12177 (_1!6099 (_ BitVec 64)) (_2!6099 V!29911)) )
))
(declare-datatypes ((List!18012 0))(
  ( (Nil!18009) (Cons!18008 (h!19160 tuple2!12176) (t!25467 List!18012)) )
))
(declare-datatypes ((ListLongMap!10875 0))(
  ( (ListLongMap!10876 (toList!5453 List!18012)) )
))
(declare-fun lt!409294 () ListLongMap!10875)

(declare-fun contains!4508 (ListLongMap!10875 (_ BitVec 64)) Bool)

(assert (=> b!907384 (= res!612097 (not (contains!4508 lt!409294 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29911)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29911)

(declare-fun getCurrentListMap!2719 (array!53501 array!53503 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 32) Int) ListLongMap!10875)

(assert (=> b!907384 (= lt!409294 (getCurrentListMap!2719 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907385 () Bool)

(assert (=> b!907385 (= e!508568 true)))

(declare-fun lt!409295 () ListLongMap!10875)

(declare-fun lt!409297 () V!29911)

(declare-fun apply!472 (ListLongMap!10875 (_ BitVec 64)) V!29911)

(assert (=> b!907385 (= (apply!472 lt!409295 k0!1033) lt!409297)))

(declare-datatypes ((Unit!30760 0))(
  ( (Unit!30761) )
))
(declare-fun lt!409296 () Unit!30760)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!26 (array!53501 array!53503 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 64) V!29911 (_ BitVec 32) Int) Unit!30760)

(assert (=> b!907385 (= lt!409296 (lemmaListMapApplyFromThenApplyFromZero!26 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409297 i!717 defaultEntry!1160))))

(declare-fun b!907386 () Bool)

(declare-fun e!508569 () Bool)

(declare-fun tp_is_empty!18709 () Bool)

(assert (=> b!907386 (= e!508569 tp_is_empty!18709)))

(declare-fun b!907387 () Bool)

(declare-fun res!612096 () Bool)

(assert (=> b!907387 (=> res!612096 e!508568)))

(assert (=> b!907387 (= res!612096 (not (= (apply!472 lt!409294 k0!1033) lt!409297)))))

(declare-fun b!907388 () Bool)

(declare-fun res!612103 () Bool)

(assert (=> b!907388 (=> (not res!612103) (not e!508571))))

(assert (=> b!907388 (= res!612103 (and (= (size!26166 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26165 _keys!1386) (size!26166 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907389 () Bool)

(declare-fun res!612102 () Bool)

(assert (=> b!907389 (=> (not res!612102) (not e!508571))))

(declare-datatypes ((List!18013 0))(
  ( (Nil!18010) (Cons!18009 (h!19161 (_ BitVec 64)) (t!25468 List!18013)) )
))
(declare-fun arrayNoDuplicates!0 (array!53501 (_ BitVec 32) List!18013) Bool)

(assert (=> b!907389 (= res!612102 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18010))))

(declare-fun b!907390 () Bool)

(assert (=> b!907390 (= e!508571 e!508572)))

(declare-fun res!612101 () Bool)

(assert (=> b!907390 (=> (not res!612101) (not e!508572))))

(assert (=> b!907390 (= res!612101 (contains!4508 lt!409295 k0!1033))))

(assert (=> b!907390 (= lt!409295 (getCurrentListMap!2719 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907379 () Bool)

(assert (=> b!907379 (= e!508575 tp_is_empty!18709)))

(declare-fun res!612099 () Bool)

(assert (=> start!77874 (=> (not res!612099) (not e!508571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77874 (= res!612099 (validMask!0 mask!1756))))

(assert (=> start!77874 e!508571))

(declare-fun array_inv!20186 (array!53503) Bool)

(assert (=> start!77874 (and (array_inv!20186 _values!1152) e!508573)))

(assert (=> start!77874 tp!57136))

(assert (=> start!77874 true))

(assert (=> start!77874 tp_is_empty!18709))

(declare-fun array_inv!20187 (array!53501) Bool)

(assert (=> start!77874 (array_inv!20187 _keys!1386)))

(declare-fun b!907391 () Bool)

(assert (=> b!907391 (= e!508572 (not e!508574))))

(declare-fun res!612095 () Bool)

(assert (=> b!907391 (=> res!612095 e!508574)))

(assert (=> b!907391 (= res!612095 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26165 _keys!1386))))))

(declare-fun get!13527 (ValueCell!8873 V!29911) V!29911)

(declare-fun dynLambda!1365 (Int (_ BitVec 64)) V!29911)

(assert (=> b!907391 (= lt!409297 (get!13527 (select (arr!25706 _values!1152) i!717) (dynLambda!1365 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907391 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409293 () Unit!30760)

(declare-fun lemmaKeyInListMapIsInArray!224 (array!53501 array!53503 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 64) Int) Unit!30760)

(assert (=> b!907391 (= lt!409293 (lemmaKeyInListMapIsInArray!224 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29776 () Bool)

(declare-fun tp!57135 () Bool)

(assert (=> mapNonEmpty!29776 (= mapRes!29776 (and tp!57135 e!508569))))

(declare-fun mapKey!29776 () (_ BitVec 32))

(declare-fun mapValue!29776 () ValueCell!8873)

(declare-fun mapRest!29776 () (Array (_ BitVec 32) ValueCell!8873))

(assert (=> mapNonEmpty!29776 (= (arr!25706 _values!1152) (store mapRest!29776 mapKey!29776 mapValue!29776))))

(assert (= (and start!77874 res!612099) b!907388))

(assert (= (and b!907388 res!612103) b!907380))

(assert (= (and b!907380 res!612100) b!907389))

(assert (= (and b!907389 res!612102) b!907390))

(assert (= (and b!907390 res!612101) b!907381))

(assert (= (and b!907381 res!612098) b!907383))

(assert (= (and b!907383 res!612094) b!907391))

(assert (= (and b!907391 (not res!612095)) b!907384))

(assert (= (and b!907384 (not res!612097)) b!907387))

(assert (= (and b!907387 (not res!612096)) b!907385))

(assert (= (and b!907382 condMapEmpty!29776) mapIsEmpty!29776))

(assert (= (and b!907382 (not condMapEmpty!29776)) mapNonEmpty!29776))

(get-info :version)

(assert (= (and mapNonEmpty!29776 ((_ is ValueCellFull!8873) mapValue!29776)) b!907386))

(assert (= (and b!907382 ((_ is ValueCellFull!8873) mapDefault!29776)) b!907379))

(assert (= start!77874 b!907382))

(declare-fun b_lambda!13179 () Bool)

(assert (=> (not b_lambda!13179) (not b!907391)))

(declare-fun t!25466 () Bool)

(declare-fun tb!5305 () Bool)

(assert (=> (and start!77874 (= defaultEntry!1160 defaultEntry!1160) t!25466) tb!5305))

(declare-fun result!10413 () Bool)

(assert (=> tb!5305 (= result!10413 tp_is_empty!18709)))

(assert (=> b!907391 t!25466))

(declare-fun b_and!26747 () Bool)

(assert (= b_and!26745 (and (=> t!25466 result!10413) b_and!26747)))

(declare-fun m!843149 () Bool)

(assert (=> b!907384 m!843149))

(declare-fun m!843151 () Bool)

(assert (=> b!907384 m!843151))

(declare-fun m!843153 () Bool)

(assert (=> b!907380 m!843153))

(declare-fun m!843155 () Bool)

(assert (=> b!907391 m!843155))

(declare-fun m!843157 () Bool)

(assert (=> b!907391 m!843157))

(declare-fun m!843159 () Bool)

(assert (=> b!907391 m!843159))

(declare-fun m!843161 () Bool)

(assert (=> b!907391 m!843161))

(assert (=> b!907391 m!843155))

(assert (=> b!907391 m!843159))

(declare-fun m!843163 () Bool)

(assert (=> b!907391 m!843163))

(declare-fun m!843165 () Bool)

(assert (=> b!907383 m!843165))

(declare-fun m!843167 () Bool)

(assert (=> b!907390 m!843167))

(declare-fun m!843169 () Bool)

(assert (=> b!907390 m!843169))

(declare-fun m!843171 () Bool)

(assert (=> mapNonEmpty!29776 m!843171))

(declare-fun m!843173 () Bool)

(assert (=> b!907385 m!843173))

(declare-fun m!843175 () Bool)

(assert (=> b!907385 m!843175))

(declare-fun m!843177 () Bool)

(assert (=> b!907387 m!843177))

(declare-fun m!843179 () Bool)

(assert (=> b!907381 m!843179))

(declare-fun m!843181 () Bool)

(assert (=> start!77874 m!843181))

(declare-fun m!843183 () Bool)

(assert (=> start!77874 m!843183))

(declare-fun m!843185 () Bool)

(assert (=> start!77874 m!843185))

(declare-fun m!843187 () Bool)

(assert (=> b!907389 m!843187))

(check-sat tp_is_empty!18709 (not b!907389) (not b_lambda!13179) (not b!907390) (not b!907391) (not start!77874) (not b!907380) (not b_next!16291) (not b!907387) b_and!26747 (not b!907381) (not b!907384) (not b!907385) (not mapNonEmpty!29776))
(check-sat b_and!26747 (not b_next!16291))
