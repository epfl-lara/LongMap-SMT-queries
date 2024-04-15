; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77736 () Bool)

(assert start!77736)

(declare-fun b_free!16339 () Bool)

(declare-fun b_next!16339 () Bool)

(assert (=> start!77736 (= b_free!16339 (not b_next!16339))))

(declare-fun tp!57280 () Bool)

(declare-fun b_and!26805 () Bool)

(assert (=> start!77736 (= tp!57280 b_and!26805)))

(declare-fun b!907221 () Bool)

(declare-fun res!612362 () Bool)

(declare-fun e!508421 () Bool)

(assert (=> b!907221 (=> (not res!612362) (not e!508421))))

(declare-datatypes ((array!53527 0))(
  ( (array!53528 (arr!25723 (Array (_ BitVec 32) (_ BitVec 64))) (size!26184 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53527)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53527 (_ BitVec 32)) Bool)

(assert (=> b!907221 (= res!612362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29848 () Bool)

(declare-fun mapRes!29848 () Bool)

(assert (=> mapIsEmpty!29848 mapRes!29848))

(declare-fun b!907222 () Bool)

(declare-fun e!508415 () Bool)

(declare-fun e!508420 () Bool)

(assert (=> b!907222 (= e!508415 (not e!508420))))

(declare-fun res!612366 () Bool)

(assert (=> b!907222 (=> res!612366 e!508420)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!907222 (= res!612366 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26184 _keys!1386))))))

(declare-datatypes ((V!29975 0))(
  ( (V!29976 (val!9429 Int)) )
))
(declare-datatypes ((ValueCell!8897 0))(
  ( (ValueCellFull!8897 (v!11933 V!29975)) (EmptyCell!8897) )
))
(declare-datatypes ((array!53529 0))(
  ( (array!53530 (arr!25724 (Array (_ BitVec 32) ValueCell!8897)) (size!26185 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53529)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409058 () V!29975)

(declare-fun get!13535 (ValueCell!8897 V!29975) V!29975)

(declare-fun dynLambda!1356 (Int (_ BitVec 64)) V!29975)

(assert (=> b!907222 (= lt!409058 (get!13535 (select (arr!25724 _values!1152) i!717) (dynLambda!1356 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907222 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30722 0))(
  ( (Unit!30723) )
))
(declare-fun lt!409060 () Unit!30722)

(declare-fun zeroValue!1094 () V!29975)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29975)

(declare-fun lemmaKeyInListMapIsInArray!232 (array!53527 array!53529 (_ BitVec 32) (_ BitVec 32) V!29975 V!29975 (_ BitVec 64) Int) Unit!30722)

(assert (=> b!907222 (= lt!409060 (lemmaKeyInListMapIsInArray!232 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907223 () Bool)

(declare-fun e!508416 () Bool)

(assert (=> b!907223 (= e!508416 (bvslt #b00000000000000000000000000000000 (size!26184 _keys!1386)))))

(declare-datatypes ((tuple2!12304 0))(
  ( (tuple2!12305 (_1!6163 (_ BitVec 64)) (_2!6163 V!29975)) )
))
(declare-datatypes ((List!18090 0))(
  ( (Nil!18087) (Cons!18086 (h!19232 tuple2!12304) (t!25592 List!18090)) )
))
(declare-datatypes ((ListLongMap!10991 0))(
  ( (ListLongMap!10992 (toList!5511 List!18090)) )
))
(declare-fun lt!409057 () ListLongMap!10991)

(declare-fun apply!486 (ListLongMap!10991 (_ BitVec 64)) V!29975)

(assert (=> b!907223 (= (apply!486 lt!409057 k0!1033) lt!409058)))

(declare-fun lt!409059 () Unit!30722)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!46 (array!53527 array!53529 (_ BitVec 32) (_ BitVec 32) V!29975 V!29975 (_ BitVec 64) V!29975 (_ BitVec 32) Int) Unit!30722)

(assert (=> b!907223 (= lt!409059 (lemmaListMapApplyFromThenApplyFromZero!46 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409058 i!717 defaultEntry!1160))))

(declare-fun b!907224 () Bool)

(assert (=> b!907224 (= e!508421 e!508415)))

(declare-fun res!612368 () Bool)

(assert (=> b!907224 (=> (not res!612368) (not e!508415))))

(declare-fun contains!4514 (ListLongMap!10991 (_ BitVec 64)) Bool)

(assert (=> b!907224 (= res!612368 (contains!4514 lt!409057 k0!1033))))

(declare-fun getCurrentListMap!2718 (array!53527 array!53529 (_ BitVec 32) (_ BitVec 32) V!29975 V!29975 (_ BitVec 32) Int) ListLongMap!10991)

(assert (=> b!907224 (= lt!409057 (getCurrentListMap!2718 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907225 () Bool)

(declare-fun res!612367 () Bool)

(assert (=> b!907225 (=> (not res!612367) (not e!508415))))

(assert (=> b!907225 (= res!612367 (and (= (select (arr!25723 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907226 () Bool)

(declare-fun res!612363 () Bool)

(assert (=> b!907226 (=> (not res!612363) (not e!508421))))

(assert (=> b!907226 (= res!612363 (and (= (size!26185 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26184 _keys!1386) (size!26185 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!612361 () Bool)

(assert (=> start!77736 (=> (not res!612361) (not e!508421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77736 (= res!612361 (validMask!0 mask!1756))))

(assert (=> start!77736 e!508421))

(declare-fun e!508418 () Bool)

(declare-fun array_inv!20186 (array!53529) Bool)

(assert (=> start!77736 (and (array_inv!20186 _values!1152) e!508418)))

(assert (=> start!77736 tp!57280))

(assert (=> start!77736 true))

(declare-fun tp_is_empty!18757 () Bool)

(assert (=> start!77736 tp_is_empty!18757))

(declare-fun array_inv!20187 (array!53527) Bool)

(assert (=> start!77736 (array_inv!20187 _keys!1386)))

(declare-fun b!907227 () Bool)

(declare-fun e!508417 () Bool)

(assert (=> b!907227 (= e!508417 tp_is_empty!18757)))

(declare-fun b!907228 () Bool)

(assert (=> b!907228 (= e!508418 (and e!508417 mapRes!29848))))

(declare-fun condMapEmpty!29848 () Bool)

(declare-fun mapDefault!29848 () ValueCell!8897)

(assert (=> b!907228 (= condMapEmpty!29848 (= (arr!25724 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8897)) mapDefault!29848)))))

(declare-fun b!907229 () Bool)

(declare-fun res!612364 () Bool)

(assert (=> b!907229 (=> res!612364 e!508416)))

(declare-fun lt!409056 () ListLongMap!10991)

(assert (=> b!907229 (= res!612364 (not (= (apply!486 lt!409056 k0!1033) lt!409058)))))

(declare-fun b!907230 () Bool)

(declare-fun e!508419 () Bool)

(assert (=> b!907230 (= e!508419 tp_is_empty!18757)))

(declare-fun b!907231 () Bool)

(declare-fun res!612365 () Bool)

(assert (=> b!907231 (=> (not res!612365) (not e!508415))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907231 (= res!612365 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29848 () Bool)

(declare-fun tp!57279 () Bool)

(assert (=> mapNonEmpty!29848 (= mapRes!29848 (and tp!57279 e!508419))))

(declare-fun mapValue!29848 () ValueCell!8897)

(declare-fun mapKey!29848 () (_ BitVec 32))

(declare-fun mapRest!29848 () (Array (_ BitVec 32) ValueCell!8897))

(assert (=> mapNonEmpty!29848 (= (arr!25724 _values!1152) (store mapRest!29848 mapKey!29848 mapValue!29848))))

(declare-fun b!907232 () Bool)

(assert (=> b!907232 (= e!508420 e!508416)))

(declare-fun res!612369 () Bool)

(assert (=> b!907232 (=> res!612369 e!508416)))

(assert (=> b!907232 (= res!612369 (not (contains!4514 lt!409056 k0!1033)))))

(assert (=> b!907232 (= lt!409056 (getCurrentListMap!2718 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907233 () Bool)

(declare-fun res!612360 () Bool)

(assert (=> b!907233 (=> (not res!612360) (not e!508421))))

(declare-datatypes ((List!18091 0))(
  ( (Nil!18088) (Cons!18087 (h!19233 (_ BitVec 64)) (t!25593 List!18091)) )
))
(declare-fun arrayNoDuplicates!0 (array!53527 (_ BitVec 32) List!18091) Bool)

(assert (=> b!907233 (= res!612360 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18088))))

(assert (= (and start!77736 res!612361) b!907226))

(assert (= (and b!907226 res!612363) b!907221))

(assert (= (and b!907221 res!612362) b!907233))

(assert (= (and b!907233 res!612360) b!907224))

(assert (= (and b!907224 res!612368) b!907231))

(assert (= (and b!907231 res!612365) b!907225))

(assert (= (and b!907225 res!612367) b!907222))

(assert (= (and b!907222 (not res!612366)) b!907232))

(assert (= (and b!907232 (not res!612369)) b!907229))

(assert (= (and b!907229 (not res!612364)) b!907223))

(assert (= (and b!907228 condMapEmpty!29848) mapIsEmpty!29848))

(assert (= (and b!907228 (not condMapEmpty!29848)) mapNonEmpty!29848))

(get-info :version)

(assert (= (and mapNonEmpty!29848 ((_ is ValueCellFull!8897) mapValue!29848)) b!907230))

(assert (= (and b!907228 ((_ is ValueCellFull!8897) mapDefault!29848)) b!907227))

(assert (= start!77736 b!907228))

(declare-fun b_lambda!13195 () Bool)

(assert (=> (not b_lambda!13195) (not b!907222)))

(declare-fun t!25591 () Bool)

(declare-fun tb!5353 () Bool)

(assert (=> (and start!77736 (= defaultEntry!1160 defaultEntry!1160) t!25591) tb!5353))

(declare-fun result!10509 () Bool)

(assert (=> tb!5353 (= result!10509 tp_is_empty!18757)))

(assert (=> b!907222 t!25591))

(declare-fun b_and!26807 () Bool)

(assert (= b_and!26805 (and (=> t!25591 result!10509) b_and!26807)))

(declare-fun m!842057 () Bool)

(assert (=> b!907229 m!842057))

(declare-fun m!842059 () Bool)

(assert (=> b!907221 m!842059))

(declare-fun m!842061 () Bool)

(assert (=> start!77736 m!842061))

(declare-fun m!842063 () Bool)

(assert (=> start!77736 m!842063))

(declare-fun m!842065 () Bool)

(assert (=> start!77736 m!842065))

(declare-fun m!842067 () Bool)

(assert (=> b!907231 m!842067))

(declare-fun m!842069 () Bool)

(assert (=> b!907232 m!842069))

(declare-fun m!842071 () Bool)

(assert (=> b!907232 m!842071))

(declare-fun m!842073 () Bool)

(assert (=> mapNonEmpty!29848 m!842073))

(declare-fun m!842075 () Bool)

(assert (=> b!907233 m!842075))

(declare-fun m!842077 () Bool)

(assert (=> b!907225 m!842077))

(declare-fun m!842079 () Bool)

(assert (=> b!907224 m!842079))

(declare-fun m!842081 () Bool)

(assert (=> b!907224 m!842081))

(declare-fun m!842083 () Bool)

(assert (=> b!907222 m!842083))

(declare-fun m!842085 () Bool)

(assert (=> b!907222 m!842085))

(declare-fun m!842087 () Bool)

(assert (=> b!907222 m!842087))

(declare-fun m!842089 () Bool)

(assert (=> b!907222 m!842089))

(assert (=> b!907222 m!842083))

(assert (=> b!907222 m!842087))

(declare-fun m!842091 () Bool)

(assert (=> b!907222 m!842091))

(declare-fun m!842093 () Bool)

(assert (=> b!907223 m!842093))

(declare-fun m!842095 () Bool)

(assert (=> b!907223 m!842095))

(check-sat (not start!77736) (not b_lambda!13195) (not b!907232) (not b!907229) tp_is_empty!18757 (not b!907221) (not mapNonEmpty!29848) (not b!907231) b_and!26807 (not b!907233) (not b!907223) (not b!907222) (not b!907224) (not b_next!16339))
(check-sat b_and!26807 (not b_next!16339))
