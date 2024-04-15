; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77646 () Bool)

(assert start!77646)

(declare-fun b_free!16249 () Bool)

(declare-fun b_next!16249 () Bool)

(assert (=> start!77646 (= b_free!16249 (not b_next!16249))))

(declare-fun tp!57009 () Bool)

(declare-fun b_and!26625 () Bool)

(assert (=> start!77646 (= tp!57009 b_and!26625)))

(declare-fun b!905376 () Bool)

(declare-fun res!611011 () Bool)

(declare-fun e!507335 () Bool)

(assert (=> b!905376 (=> (not res!611011) (not e!507335))))

(declare-datatypes ((array!53355 0))(
  ( (array!53356 (arr!25637 (Array (_ BitVec 32) (_ BitVec 64))) (size!26098 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53355)

(declare-datatypes ((List!18021 0))(
  ( (Nil!18018) (Cons!18017 (h!19163 (_ BitVec 64)) (t!25433 List!18021)) )
))
(declare-fun arrayNoDuplicates!0 (array!53355 (_ BitVec 32) List!18021) Bool)

(assert (=> b!905376 (= res!611011 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18018))))

(declare-fun b!905377 () Bool)

(declare-fun e!507340 () Bool)

(declare-fun e!507334 () Bool)

(declare-fun mapRes!29713 () Bool)

(assert (=> b!905377 (= e!507340 (and e!507334 mapRes!29713))))

(declare-fun condMapEmpty!29713 () Bool)

(declare-datatypes ((V!29855 0))(
  ( (V!29856 (val!9384 Int)) )
))
(declare-datatypes ((ValueCell!8852 0))(
  ( (ValueCellFull!8852 (v!11888 V!29855)) (EmptyCell!8852) )
))
(declare-datatypes ((array!53357 0))(
  ( (array!53358 (arr!25638 (Array (_ BitVec 32) ValueCell!8852)) (size!26099 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53357)

(declare-fun mapDefault!29713 () ValueCell!8852)

(assert (=> b!905377 (= condMapEmpty!29713 (= (arr!25638 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8852)) mapDefault!29713)))))

(declare-fun b!905378 () Bool)

(declare-fun res!611015 () Bool)

(assert (=> b!905378 (=> (not res!611015) (not e!507335))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!905378 (= res!611015 (and (= (size!26099 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26098 _keys!1386) (size!26099 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29713 () Bool)

(assert (=> mapIsEmpty!29713 mapRes!29713))

(declare-fun b!905379 () Bool)

(declare-fun e!507337 () Bool)

(declare-fun e!507339 () Bool)

(assert (=> b!905379 (= e!507337 e!507339)))

(declare-fun res!611014 () Bool)

(assert (=> b!905379 (=> res!611014 e!507339)))

(declare-datatypes ((tuple2!12226 0))(
  ( (tuple2!12227 (_1!6124 (_ BitVec 64)) (_2!6124 V!29855)) )
))
(declare-datatypes ((List!18022 0))(
  ( (Nil!18019) (Cons!18018 (h!19164 tuple2!12226) (t!25434 List!18022)) )
))
(declare-datatypes ((ListLongMap!10913 0))(
  ( (ListLongMap!10914 (toList!5472 List!18022)) )
))
(declare-fun lt!408381 () ListLongMap!10913)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4480 (ListLongMap!10913 (_ BitVec 64)) Bool)

(assert (=> b!905379 (= res!611014 (not (contains!4480 lt!408381 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29855)

(declare-fun minValue!1094 () V!29855)

(declare-fun getCurrentListMap!2684 (array!53355 array!53357 (_ BitVec 32) (_ BitVec 32) V!29855 V!29855 (_ BitVec 32) Int) ListLongMap!10913)

(assert (=> b!905379 (= lt!408381 (getCurrentListMap!2684 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905380 () Bool)

(declare-fun res!611013 () Bool)

(assert (=> b!905380 (=> (not res!611013) (not e!507335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53355 (_ BitVec 32)) Bool)

(assert (=> b!905380 (= res!611013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905381 () Bool)

(declare-fun res!611016 () Bool)

(declare-fun e!507341 () Bool)

(assert (=> b!905381 (=> (not res!611016) (not e!507341))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905381 (= res!611016 (inRange!0 i!717 mask!1756))))

(declare-fun b!905382 () Bool)

(assert (=> b!905382 (= e!507335 e!507341)))

(declare-fun res!611017 () Bool)

(assert (=> b!905382 (=> (not res!611017) (not e!507341))))

(declare-fun lt!408383 () ListLongMap!10913)

(assert (=> b!905382 (= res!611017 (contains!4480 lt!408383 k0!1033))))

(assert (=> b!905382 (= lt!408383 (getCurrentListMap!2684 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun res!611012 () Bool)

(assert (=> start!77646 (=> (not res!611012) (not e!507335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77646 (= res!611012 (validMask!0 mask!1756))))

(assert (=> start!77646 e!507335))

(declare-fun array_inv!20134 (array!53357) Bool)

(assert (=> start!77646 (and (array_inv!20134 _values!1152) e!507340)))

(assert (=> start!77646 tp!57009))

(assert (=> start!77646 true))

(declare-fun tp_is_empty!18667 () Bool)

(assert (=> start!77646 tp_is_empty!18667))

(declare-fun array_inv!20135 (array!53355) Bool)

(assert (=> start!77646 (array_inv!20135 _keys!1386)))

(declare-fun b!905383 () Bool)

(declare-fun res!611010 () Bool)

(assert (=> b!905383 (=> (not res!611010) (not e!507341))))

(assert (=> b!905383 (= res!611010 (and (= (select (arr!25637 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905384 () Bool)

(declare-fun e!507336 () Bool)

(assert (=> b!905384 (= e!507336 tp_is_empty!18667)))

(declare-fun b!905385 () Bool)

(assert (=> b!905385 (= e!507334 tp_is_empty!18667)))

(declare-fun b!905386 () Bool)

(declare-fun res!611018 () Bool)

(assert (=> b!905386 (=> res!611018 e!507339)))

(declare-fun lt!408382 () V!29855)

(declare-fun apply!452 (ListLongMap!10913 (_ BitVec 64)) V!29855)

(assert (=> b!905386 (= res!611018 (not (= (apply!452 lt!408381 k0!1033) lt!408382)))))

(declare-fun mapNonEmpty!29713 () Bool)

(declare-fun tp!57010 () Bool)

(assert (=> mapNonEmpty!29713 (= mapRes!29713 (and tp!57010 e!507336))))

(declare-fun mapValue!29713 () ValueCell!8852)

(declare-fun mapKey!29713 () (_ BitVec 32))

(declare-fun mapRest!29713 () (Array (_ BitVec 32) ValueCell!8852))

(assert (=> mapNonEmpty!29713 (= (arr!25638 _values!1152) (store mapRest!29713 mapKey!29713 mapValue!29713))))

(declare-fun b!905387 () Bool)

(assert (=> b!905387 (= e!507339 true)))

(assert (=> b!905387 (= (apply!452 lt!408383 k0!1033) lt!408382)))

(declare-datatypes ((Unit!30652 0))(
  ( (Unit!30653) )
))
(declare-fun lt!408384 () Unit!30652)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!15 (array!53355 array!53357 (_ BitVec 32) (_ BitVec 32) V!29855 V!29855 (_ BitVec 64) V!29855 (_ BitVec 32) Int) Unit!30652)

(assert (=> b!905387 (= lt!408384 (lemmaListMapApplyFromThenApplyFromZero!15 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408382 i!717 defaultEntry!1160))))

(declare-fun b!905388 () Bool)

(assert (=> b!905388 (= e!507341 (not e!507337))))

(declare-fun res!611019 () Bool)

(assert (=> b!905388 (=> res!611019 e!507337)))

(assert (=> b!905388 (= res!611019 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26098 _keys!1386))))))

(declare-fun get!13478 (ValueCell!8852 V!29855) V!29855)

(declare-fun dynLambda!1329 (Int (_ BitVec 64)) V!29855)

(assert (=> b!905388 (= lt!408382 (get!13478 (select (arr!25638 _values!1152) i!717) (dynLambda!1329 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905388 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408385 () Unit!30652)

(declare-fun lemmaKeyInListMapIsInArray!205 (array!53355 array!53357 (_ BitVec 32) (_ BitVec 32) V!29855 V!29855 (_ BitVec 64) Int) Unit!30652)

(assert (=> b!905388 (= lt!408385 (lemmaKeyInListMapIsInArray!205 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!77646 res!611012) b!905378))

(assert (= (and b!905378 res!611015) b!905380))

(assert (= (and b!905380 res!611013) b!905376))

(assert (= (and b!905376 res!611011) b!905382))

(assert (= (and b!905382 res!611017) b!905381))

(assert (= (and b!905381 res!611016) b!905383))

(assert (= (and b!905383 res!611010) b!905388))

(assert (= (and b!905388 (not res!611019)) b!905379))

(assert (= (and b!905379 (not res!611014)) b!905386))

(assert (= (and b!905386 (not res!611018)) b!905387))

(assert (= (and b!905377 condMapEmpty!29713) mapIsEmpty!29713))

(assert (= (and b!905377 (not condMapEmpty!29713)) mapNonEmpty!29713))

(get-info :version)

(assert (= (and mapNonEmpty!29713 ((_ is ValueCellFull!8852) mapValue!29713)) b!905384))

(assert (= (and b!905377 ((_ is ValueCellFull!8852) mapDefault!29713)) b!905385))

(assert (= start!77646 b!905377))

(declare-fun b_lambda!13105 () Bool)

(assert (=> (not b_lambda!13105) (not b!905388)))

(declare-fun t!25432 () Bool)

(declare-fun tb!5263 () Bool)

(assert (=> (and start!77646 (= defaultEntry!1160 defaultEntry!1160) t!25432) tb!5263))

(declare-fun result!10329 () Bool)

(assert (=> tb!5263 (= result!10329 tp_is_empty!18667)))

(assert (=> b!905388 t!25432))

(declare-fun b_and!26627 () Bool)

(assert (= b_and!26625 (and (=> t!25432 result!10329) b_and!26627)))

(declare-fun m!840257 () Bool)

(assert (=> start!77646 m!840257))

(declare-fun m!840259 () Bool)

(assert (=> start!77646 m!840259))

(declare-fun m!840261 () Bool)

(assert (=> start!77646 m!840261))

(declare-fun m!840263 () Bool)

(assert (=> b!905381 m!840263))

(declare-fun m!840265 () Bool)

(assert (=> b!905388 m!840265))

(declare-fun m!840267 () Bool)

(assert (=> b!905388 m!840267))

(declare-fun m!840269 () Bool)

(assert (=> b!905388 m!840269))

(declare-fun m!840271 () Bool)

(assert (=> b!905388 m!840271))

(assert (=> b!905388 m!840265))

(assert (=> b!905388 m!840269))

(declare-fun m!840273 () Bool)

(assert (=> b!905388 m!840273))

(declare-fun m!840275 () Bool)

(assert (=> b!905383 m!840275))

(declare-fun m!840277 () Bool)

(assert (=> b!905376 m!840277))

(declare-fun m!840279 () Bool)

(assert (=> b!905379 m!840279))

(declare-fun m!840281 () Bool)

(assert (=> b!905379 m!840281))

(declare-fun m!840283 () Bool)

(assert (=> mapNonEmpty!29713 m!840283))

(declare-fun m!840285 () Bool)

(assert (=> b!905387 m!840285))

(declare-fun m!840287 () Bool)

(assert (=> b!905387 m!840287))

(declare-fun m!840289 () Bool)

(assert (=> b!905386 m!840289))

(declare-fun m!840291 () Bool)

(assert (=> b!905380 m!840291))

(declare-fun m!840293 () Bool)

(assert (=> b!905382 m!840293))

(declare-fun m!840295 () Bool)

(assert (=> b!905382 m!840295))

(check-sat (not b!905387) (not b!905381) (not b!905376) (not b!905379) (not b!905380) (not b_lambda!13105) (not mapNonEmpty!29713) (not b!905388) (not start!77646) (not b!905382) tp_is_empty!18667 (not b_next!16249) b_and!26627 (not b!905386))
(check-sat b_and!26627 (not b_next!16249))
