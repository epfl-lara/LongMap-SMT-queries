; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78906 () Bool)

(assert start!78906)

(declare-fun b_free!17137 () Bool)

(declare-fun b_next!17137 () Bool)

(assert (=> start!78906 (= b_free!17137 (not b_next!17137))))

(declare-fun tp!59853 () Bool)

(declare-fun b_and!27985 () Bool)

(assert (=> start!78906 (= tp!59853 b_and!27985)))

(declare-fun b!922702 () Bool)

(declare-fun res!622254 () Bool)

(declare-fun e!517687 () Bool)

(assert (=> b!922702 (=> (not res!622254) (not e!517687))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922702 (= res!622254 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922703 () Bool)

(declare-fun e!517691 () Bool)

(declare-fun tp_is_empty!19645 () Bool)

(assert (=> b!922703 (= e!517691 tp_is_empty!19645)))

(declare-fun b!922704 () Bool)

(declare-fun res!622262 () Bool)

(declare-fun e!517689 () Bool)

(assert (=> b!922704 (=> (not res!622262) (not e!517689))))

(declare-datatypes ((array!55241 0))(
  ( (array!55242 (arr!26566 (Array (_ BitVec 32) (_ BitVec 64))) (size!27027 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55241)

(assert (=> b!922704 (= res!622262 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27027 _keys!1487))))))

(declare-fun b!922705 () Bool)

(declare-fun res!622255 () Bool)

(assert (=> b!922705 (=> (not res!622255) (not e!517689))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55241 (_ BitVec 32)) Bool)

(assert (=> b!922705 (= res!622255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922706 () Bool)

(declare-fun e!517685 () Bool)

(declare-fun e!517690 () Bool)

(declare-fun mapRes!31224 () Bool)

(assert (=> b!922706 (= e!517685 (and e!517690 mapRes!31224))))

(declare-fun condMapEmpty!31224 () Bool)

(declare-datatypes ((V!31159 0))(
  ( (V!31160 (val!9873 Int)) )
))
(declare-datatypes ((ValueCell!9341 0))(
  ( (ValueCellFull!9341 (v!12390 V!31159)) (EmptyCell!9341) )
))
(declare-datatypes ((array!55243 0))(
  ( (array!55244 (arr!26567 (Array (_ BitVec 32) ValueCell!9341)) (size!27028 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55243)

(declare-fun mapDefault!31224 () ValueCell!9341)

(assert (=> b!922706 (= condMapEmpty!31224 (= (arr!26567 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9341)) mapDefault!31224)))))

(declare-fun b!922707 () Bool)

(declare-fun e!517686 () Bool)

(assert (=> b!922707 (= e!517686 (not (bvsle from!1844 (size!27027 _keys!1487))))))

(declare-fun lt!414289 () (_ BitVec 64))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!922707 (not (= lt!414289 k0!1099))))

(declare-datatypes ((Unit!31052 0))(
  ( (Unit!31053) )
))
(declare-fun lt!414295 () Unit!31052)

(declare-datatypes ((List!18695 0))(
  ( (Nil!18692) (Cons!18691 (h!19837 (_ BitVec 64)) (t!26553 List!18695)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55241 (_ BitVec 64) (_ BitVec 32) List!18695) Unit!31052)

(assert (=> b!922707 (= lt!414295 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18692))))

(declare-fun e!517688 () Bool)

(assert (=> b!922707 e!517688))

(declare-fun c!96142 () Bool)

(assert (=> b!922707 (= c!96142 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414292 () Unit!31052)

(declare-fun zeroValue!1173 () V!31159)

(declare-fun minValue!1173 () V!31159)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!208 (array!55241 array!55243 (_ BitVec 32) (_ BitVec 32) V!31159 V!31159 (_ BitVec 64) (_ BitVec 32) Int) Unit!31052)

(assert (=> b!922707 (= lt!414292 (lemmaListMapContainsThenArrayContainsFrom!208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55241 (_ BitVec 32) List!18695) Bool)

(assert (=> b!922707 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18692)))

(declare-fun lt!414288 () Unit!31052)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55241 (_ BitVec 32) (_ BitVec 32)) Unit!31052)

(assert (=> b!922707 (= lt!414288 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12914 0))(
  ( (tuple2!12915 (_1!6468 (_ BitVec 64)) (_2!6468 V!31159)) )
))
(declare-datatypes ((List!18696 0))(
  ( (Nil!18693) (Cons!18692 (h!19838 tuple2!12914) (t!26554 List!18696)) )
))
(declare-datatypes ((ListLongMap!11601 0))(
  ( (ListLongMap!11602 (toList!5816 List!18696)) )
))
(declare-fun lt!414291 () ListLongMap!11601)

(declare-fun lt!414294 () tuple2!12914)

(declare-fun contains!4831 (ListLongMap!11601 (_ BitVec 64)) Bool)

(declare-fun +!2720 (ListLongMap!11601 tuple2!12914) ListLongMap!11601)

(assert (=> b!922707 (contains!4831 (+!2720 lt!414291 lt!414294) k0!1099)))

(declare-fun lt!414290 () V!31159)

(declare-fun lt!414296 () Unit!31052)

(declare-fun addStillContains!417 (ListLongMap!11601 (_ BitVec 64) V!31159 (_ BitVec 64)) Unit!31052)

(assert (=> b!922707 (= lt!414296 (addStillContains!417 lt!414291 lt!414289 lt!414290 k0!1099))))

(declare-fun getCurrentListMap!3005 (array!55241 array!55243 (_ BitVec 32) (_ BitVec 32) V!31159 V!31159 (_ BitVec 32) Int) ListLongMap!11601)

(assert (=> b!922707 (= (getCurrentListMap!3005 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2720 (getCurrentListMap!3005 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414294))))

(assert (=> b!922707 (= lt!414294 (tuple2!12915 lt!414289 lt!414290))))

(declare-fun get!13961 (ValueCell!9341 V!31159) V!31159)

(declare-fun dynLambda!1476 (Int (_ BitVec 64)) V!31159)

(assert (=> b!922707 (= lt!414290 (get!13961 (select (arr!26567 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1476 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414293 () Unit!31052)

(declare-fun lemmaListMapRecursiveValidKeyArray!84 (array!55241 array!55243 (_ BitVec 32) (_ BitVec 32) V!31159 V!31159 (_ BitVec 32) Int) Unit!31052)

(assert (=> b!922707 (= lt!414293 (lemmaListMapRecursiveValidKeyArray!84 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922708 () Bool)

(declare-fun res!622258 () Bool)

(assert (=> b!922708 (=> (not res!622258) (not e!517689))))

(assert (=> b!922708 (= res!622258 (and (= (size!27028 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27027 _keys!1487) (size!27028 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31224 () Bool)

(assert (=> mapIsEmpty!31224 mapRes!31224))

(declare-fun b!922710 () Bool)

(declare-fun res!622253 () Bool)

(assert (=> b!922710 (=> (not res!622253) (not e!517687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922710 (= res!622253 (validKeyInArray!0 k0!1099))))

(declare-fun b!922711 () Bool)

(declare-fun res!622259 () Bool)

(assert (=> b!922711 (=> (not res!622259) (not e!517689))))

(assert (=> b!922711 (= res!622259 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18692))))

(declare-fun mapNonEmpty!31224 () Bool)

(declare-fun tp!59852 () Bool)

(assert (=> mapNonEmpty!31224 (= mapRes!31224 (and tp!59852 e!517691))))

(declare-fun mapRest!31224 () (Array (_ BitVec 32) ValueCell!9341))

(declare-fun mapKey!31224 () (_ BitVec 32))

(declare-fun mapValue!31224 () ValueCell!9341)

(assert (=> mapNonEmpty!31224 (= (arr!26567 _values!1231) (store mapRest!31224 mapKey!31224 mapValue!31224))))

(declare-fun b!922712 () Bool)

(declare-fun res!622261 () Bool)

(assert (=> b!922712 (=> (not res!622261) (not e!517687))))

(declare-fun v!791 () V!31159)

(declare-fun apply!630 (ListLongMap!11601 (_ BitVec 64)) V!31159)

(assert (=> b!922712 (= res!622261 (= (apply!630 lt!414291 k0!1099) v!791))))

(declare-fun b!922713 () Bool)

(assert (=> b!922713 (= e!517687 e!517686)))

(declare-fun res!622257 () Bool)

(assert (=> b!922713 (=> (not res!622257) (not e!517686))))

(assert (=> b!922713 (= res!622257 (validKeyInArray!0 lt!414289))))

(assert (=> b!922713 (= lt!414289 (select (arr!26566 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922714 () Bool)

(declare-fun arrayContainsKey!0 (array!55241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922714 (= e!517688 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!622260 () Bool)

(assert (=> start!78906 (=> (not res!622260) (not e!517689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78906 (= res!622260 (validMask!0 mask!1881))))

(assert (=> start!78906 e!517689))

(assert (=> start!78906 true))

(assert (=> start!78906 tp_is_empty!19645))

(declare-fun array_inv!20780 (array!55243) Bool)

(assert (=> start!78906 (and (array_inv!20780 _values!1231) e!517685)))

(assert (=> start!78906 tp!59853))

(declare-fun array_inv!20781 (array!55241) Bool)

(assert (=> start!78906 (array_inv!20781 _keys!1487)))

(declare-fun b!922709 () Bool)

(assert (=> b!922709 (= e!517690 tp_is_empty!19645)))

(declare-fun b!922715 () Bool)

(assert (=> b!922715 (= e!517688 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922716 () Bool)

(assert (=> b!922716 (= e!517689 e!517687)))

(declare-fun res!622256 () Bool)

(assert (=> b!922716 (=> (not res!622256) (not e!517687))))

(assert (=> b!922716 (= res!622256 (contains!4831 lt!414291 k0!1099))))

(assert (=> b!922716 (= lt!414291 (getCurrentListMap!3005 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78906 res!622260) b!922708))

(assert (= (and b!922708 res!622258) b!922705))

(assert (= (and b!922705 res!622255) b!922711))

(assert (= (and b!922711 res!622259) b!922704))

(assert (= (and b!922704 res!622262) b!922716))

(assert (= (and b!922716 res!622256) b!922712))

(assert (= (and b!922712 res!622261) b!922702))

(assert (= (and b!922702 res!622254) b!922710))

(assert (= (and b!922710 res!622253) b!922713))

(assert (= (and b!922713 res!622257) b!922707))

(assert (= (and b!922707 c!96142) b!922714))

(assert (= (and b!922707 (not c!96142)) b!922715))

(assert (= (and b!922706 condMapEmpty!31224) mapIsEmpty!31224))

(assert (= (and b!922706 (not condMapEmpty!31224)) mapNonEmpty!31224))

(get-info :version)

(assert (= (and mapNonEmpty!31224 ((_ is ValueCellFull!9341) mapValue!31224)) b!922703))

(assert (= (and b!922706 ((_ is ValueCellFull!9341) mapDefault!31224)) b!922709))

(assert (= start!78906 b!922706))

(declare-fun b_lambda!13621 () Bool)

(assert (=> (not b_lambda!13621) (not b!922707)))

(declare-fun t!26552 () Bool)

(declare-fun tb!5709 () Bool)

(assert (=> (and start!78906 (= defaultEntry!1235 defaultEntry!1235) t!26552) tb!5709))

(declare-fun result!11249 () Bool)

(assert (=> tb!5709 (= result!11249 tp_is_empty!19645)))

(assert (=> b!922707 t!26552))

(declare-fun b_and!27987 () Bool)

(assert (= b_and!27985 (and (=> t!26552 result!11249) b_and!27987)))

(declare-fun m!856327 () Bool)

(assert (=> b!922714 m!856327))

(declare-fun m!856329 () Bool)

(assert (=> mapNonEmpty!31224 m!856329))

(declare-fun m!856331 () Bool)

(assert (=> start!78906 m!856331))

(declare-fun m!856333 () Bool)

(assert (=> start!78906 m!856333))

(declare-fun m!856335 () Bool)

(assert (=> start!78906 m!856335))

(declare-fun m!856337 () Bool)

(assert (=> b!922707 m!856337))

(declare-fun m!856339 () Bool)

(assert (=> b!922707 m!856339))

(declare-fun m!856341 () Bool)

(assert (=> b!922707 m!856341))

(declare-fun m!856343 () Bool)

(assert (=> b!922707 m!856343))

(declare-fun m!856345 () Bool)

(assert (=> b!922707 m!856345))

(declare-fun m!856347 () Bool)

(assert (=> b!922707 m!856347))

(declare-fun m!856349 () Bool)

(assert (=> b!922707 m!856349))

(assert (=> b!922707 m!856343))

(assert (=> b!922707 m!856345))

(declare-fun m!856351 () Bool)

(assert (=> b!922707 m!856351))

(declare-fun m!856353 () Bool)

(assert (=> b!922707 m!856353))

(declare-fun m!856355 () Bool)

(assert (=> b!922707 m!856355))

(assert (=> b!922707 m!856339))

(declare-fun m!856357 () Bool)

(assert (=> b!922707 m!856357))

(declare-fun m!856359 () Bool)

(assert (=> b!922707 m!856359))

(declare-fun m!856361 () Bool)

(assert (=> b!922707 m!856361))

(assert (=> b!922707 m!856347))

(declare-fun m!856363 () Bool)

(assert (=> b!922707 m!856363))

(declare-fun m!856365 () Bool)

(assert (=> b!922705 m!856365))

(declare-fun m!856367 () Bool)

(assert (=> b!922712 m!856367))

(declare-fun m!856369 () Bool)

(assert (=> b!922710 m!856369))

(declare-fun m!856371 () Bool)

(assert (=> b!922716 m!856371))

(declare-fun m!856373 () Bool)

(assert (=> b!922716 m!856373))

(declare-fun m!856375 () Bool)

(assert (=> b!922713 m!856375))

(declare-fun m!856377 () Bool)

(assert (=> b!922713 m!856377))

(declare-fun m!856379 () Bool)

(assert (=> b!922711 m!856379))

(check-sat (not b!922714) (not b!922705) (not start!78906) (not b!922713) (not b!922710) (not b!922707) (not b!922712) (not b_lambda!13621) (not b_next!17137) (not b!922711) (not mapNonEmpty!31224) tp_is_empty!19645 (not b!922716) b_and!27987)
(check-sat b_and!27987 (not b_next!17137))
