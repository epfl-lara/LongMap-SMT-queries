; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78860 () Bool)

(assert start!78860)

(declare-fun b_free!17073 () Bool)

(declare-fun b_next!17073 () Bool)

(assert (=> start!78860 (= b_free!17073 (not b_next!17073))))

(declare-fun tp!59660 () Bool)

(declare-fun b_and!27883 () Bool)

(assert (=> start!78860 (= tp!59660 b_and!27883)))

(declare-fun b!921371 () Bool)

(declare-fun res!621340 () Bool)

(declare-fun e!517051 () Bool)

(assert (=> b!921371 (=> (not res!621340) (not e!517051))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31073 0))(
  ( (V!31074 (val!9841 Int)) )
))
(declare-fun v!791 () V!31073)

(declare-datatypes ((tuple2!12798 0))(
  ( (tuple2!12799 (_1!6410 (_ BitVec 64)) (_2!6410 V!31073)) )
))
(declare-datatypes ((List!18602 0))(
  ( (Nil!18599) (Cons!18598 (h!19744 tuple2!12798) (t!26405 List!18602)) )
))
(declare-datatypes ((ListLongMap!11495 0))(
  ( (ListLongMap!11496 (toList!5763 List!18602)) )
))
(declare-fun lt!413664 () ListLongMap!11495)

(declare-fun apply!602 (ListLongMap!11495 (_ BitVec 64)) V!31073)

(assert (=> b!921371 (= res!621340 (= (apply!602 lt!413664 k0!1099) v!791))))

(declare-fun b!921372 () Bool)

(declare-fun e!517045 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!921372 (= e!517045 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921373 () Bool)

(declare-fun res!621347 () Bool)

(declare-fun e!517049 () Bool)

(assert (=> b!921373 (=> (not res!621347) (not e!517049))))

(declare-datatypes ((array!55140 0))(
  ( (array!55141 (arr!26515 (Array (_ BitVec 32) (_ BitVec 64))) (size!26974 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55140)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9309 0))(
  ( (ValueCellFull!9309 (v!12359 V!31073)) (EmptyCell!9309) )
))
(declare-datatypes ((array!55142 0))(
  ( (array!55143 (arr!26516 (Array (_ BitVec 32) ValueCell!9309)) (size!26975 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55142)

(assert (=> b!921373 (= res!621347 (and (= (size!26975 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26974 _keys!1487) (size!26975 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!621349 () Bool)

(assert (=> start!78860 (=> (not res!621349) (not e!517049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78860 (= res!621349 (validMask!0 mask!1881))))

(assert (=> start!78860 e!517049))

(assert (=> start!78860 true))

(declare-fun tp_is_empty!19581 () Bool)

(assert (=> start!78860 tp_is_empty!19581))

(declare-fun e!517044 () Bool)

(declare-fun array_inv!20660 (array!55142) Bool)

(assert (=> start!78860 (and (array_inv!20660 _values!1231) e!517044)))

(assert (=> start!78860 tp!59660))

(declare-fun array_inv!20661 (array!55140) Bool)

(assert (=> start!78860 (array_inv!20661 _keys!1487)))

(declare-fun b!921374 () Bool)

(declare-fun e!517050 () Bool)

(assert (=> b!921374 (= e!517050 tp_is_empty!19581)))

(declare-fun b!921375 () Bool)

(declare-fun res!621337 () Bool)

(declare-fun e!517048 () Bool)

(assert (=> b!921375 (=> res!621337 e!517048)))

(declare-datatypes ((List!18603 0))(
  ( (Nil!18600) (Cons!18599 (h!19745 (_ BitVec 64)) (t!26406 List!18603)) )
))
(declare-fun contains!4821 (List!18603 (_ BitVec 64)) Bool)

(assert (=> b!921375 (= res!621337 (contains!4821 Nil!18600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921376 () Bool)

(assert (=> b!921376 (= e!517049 e!517051)))

(declare-fun res!621344 () Bool)

(assert (=> b!921376 (=> (not res!621344) (not e!517051))))

(declare-fun contains!4822 (ListLongMap!11495 (_ BitVec 64)) Bool)

(assert (=> b!921376 (= res!621344 (contains!4822 lt!413664 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31073)

(declare-fun minValue!1173 () V!31073)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3017 (array!55140 array!55142 (_ BitVec 32) (_ BitVec 32) V!31073 V!31073 (_ BitVec 32) Int) ListLongMap!11495)

(assert (=> b!921376 (= lt!413664 (getCurrentListMap!3017 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921377 () Bool)

(declare-fun e!517043 () Bool)

(assert (=> b!921377 (= e!517051 e!517043)))

(declare-fun res!621338 () Bool)

(assert (=> b!921377 (=> (not res!621338) (not e!517043))))

(declare-fun lt!413663 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921377 (= res!621338 (validKeyInArray!0 lt!413663))))

(assert (=> b!921377 (= lt!413663 (select (arr!26515 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921378 () Bool)

(declare-fun res!621348 () Bool)

(assert (=> b!921378 (=> res!621348 e!517048)))

(declare-fun noDuplicate!1344 (List!18603) Bool)

(assert (=> b!921378 (= res!621348 (not (noDuplicate!1344 Nil!18600)))))

(declare-fun b!921379 () Bool)

(declare-fun arrayContainsKey!0 (array!55140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921379 (= e!517045 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921380 () Bool)

(declare-fun res!621346 () Bool)

(assert (=> b!921380 (=> (not res!621346) (not e!517051))))

(assert (=> b!921380 (= res!621346 (validKeyInArray!0 k0!1099))))

(declare-fun b!921381 () Bool)

(declare-fun res!621339 () Bool)

(assert (=> b!921381 (=> (not res!621339) (not e!517051))))

(assert (=> b!921381 (= res!621339 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921382 () Bool)

(declare-fun res!621342 () Bool)

(assert (=> b!921382 (=> (not res!621342) (not e!517049))))

(assert (=> b!921382 (= res!621342 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26974 _keys!1487))))))

(declare-fun mapIsEmpty!31128 () Bool)

(declare-fun mapRes!31128 () Bool)

(assert (=> mapIsEmpty!31128 mapRes!31128))

(declare-fun mapNonEmpty!31128 () Bool)

(declare-fun tp!59659 () Bool)

(declare-fun e!517047 () Bool)

(assert (=> mapNonEmpty!31128 (= mapRes!31128 (and tp!59659 e!517047))))

(declare-fun mapValue!31128 () ValueCell!9309)

(declare-fun mapRest!31128 () (Array (_ BitVec 32) ValueCell!9309))

(declare-fun mapKey!31128 () (_ BitVec 32))

(assert (=> mapNonEmpty!31128 (= (arr!26516 _values!1231) (store mapRest!31128 mapKey!31128 mapValue!31128))))

(declare-fun b!921383 () Bool)

(declare-fun res!621341 () Bool)

(assert (=> b!921383 (=> (not res!621341) (not e!517049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55140 (_ BitVec 32)) Bool)

(assert (=> b!921383 (= res!621341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921384 () Bool)

(assert (=> b!921384 (= e!517043 (not e!517048))))

(declare-fun res!621343 () Bool)

(assert (=> b!921384 (=> res!621343 e!517048)))

(assert (=> b!921384 (= res!621343 (or (bvsge (size!26974 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26974 _keys!1487))))))

(assert (=> b!921384 e!517045))

(declare-fun c!96111 () Bool)

(assert (=> b!921384 (= c!96111 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31088 0))(
  ( (Unit!31089) )
))
(declare-fun lt!413660 () Unit!31088)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!177 (array!55140 array!55142 (_ BitVec 32) (_ BitVec 32) V!31073 V!31073 (_ BitVec 64) (_ BitVec 32) Int) Unit!31088)

(assert (=> b!921384 (= lt!413660 (lemmaListMapContainsThenArrayContainsFrom!177 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55140 (_ BitVec 32) List!18603) Bool)

(assert (=> b!921384 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18600)))

(declare-fun lt!413665 () Unit!31088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55140 (_ BitVec 32) (_ BitVec 32)) Unit!31088)

(assert (=> b!921384 (= lt!413665 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413666 () tuple2!12798)

(declare-fun +!2670 (ListLongMap!11495 tuple2!12798) ListLongMap!11495)

(assert (=> b!921384 (contains!4822 (+!2670 lt!413664 lt!413666) k0!1099)))

(declare-fun lt!413667 () Unit!31088)

(declare-fun lt!413662 () V!31073)

(declare-fun addStillContains!394 (ListLongMap!11495 (_ BitVec 64) V!31073 (_ BitVec 64)) Unit!31088)

(assert (=> b!921384 (= lt!413667 (addStillContains!394 lt!413664 lt!413663 lt!413662 k0!1099))))

(assert (=> b!921384 (= (getCurrentListMap!3017 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2670 (getCurrentListMap!3017 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413666))))

(assert (=> b!921384 (= lt!413666 (tuple2!12799 lt!413663 lt!413662))))

(declare-fun get!13917 (ValueCell!9309 V!31073) V!31073)

(declare-fun dynLambda!1459 (Int (_ BitVec 64)) V!31073)

(assert (=> b!921384 (= lt!413662 (get!13917 (select (arr!26516 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1459 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413668 () Unit!31088)

(declare-fun lemmaListMapRecursiveValidKeyArray!60 (array!55140 array!55142 (_ BitVec 32) (_ BitVec 32) V!31073 V!31073 (_ BitVec 32) Int) Unit!31088)

(assert (=> b!921384 (= lt!413668 (lemmaListMapRecursiveValidKeyArray!60 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921385 () Bool)

(assert (=> b!921385 (= e!517044 (and e!517050 mapRes!31128))))

(declare-fun condMapEmpty!31128 () Bool)

(declare-fun mapDefault!31128 () ValueCell!9309)

(assert (=> b!921385 (= condMapEmpty!31128 (= (arr!26516 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9309)) mapDefault!31128)))))

(declare-fun b!921386 () Bool)

(declare-fun res!621345 () Bool)

(assert (=> b!921386 (=> (not res!621345) (not e!517049))))

(assert (=> b!921386 (= res!621345 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18600))))

(declare-fun b!921387 () Bool)

(assert (=> b!921387 (= e!517047 tp_is_empty!19581)))

(declare-fun b!921388 () Bool)

(assert (=> b!921388 (= e!517048 true)))

(declare-fun lt!413661 () Bool)

(assert (=> b!921388 (= lt!413661 (contains!4821 Nil!18600 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!78860 res!621349) b!921373))

(assert (= (and b!921373 res!621347) b!921383))

(assert (= (and b!921383 res!621341) b!921386))

(assert (= (and b!921386 res!621345) b!921382))

(assert (= (and b!921382 res!621342) b!921376))

(assert (= (and b!921376 res!621344) b!921371))

(assert (= (and b!921371 res!621340) b!921381))

(assert (= (and b!921381 res!621339) b!921380))

(assert (= (and b!921380 res!621346) b!921377))

(assert (= (and b!921377 res!621338) b!921384))

(assert (= (and b!921384 c!96111) b!921379))

(assert (= (and b!921384 (not c!96111)) b!921372))

(assert (= (and b!921384 (not res!621343)) b!921378))

(assert (= (and b!921378 (not res!621348)) b!921375))

(assert (= (and b!921375 (not res!621337)) b!921388))

(assert (= (and b!921385 condMapEmpty!31128) mapIsEmpty!31128))

(assert (= (and b!921385 (not condMapEmpty!31128)) mapNonEmpty!31128))

(get-info :version)

(assert (= (and mapNonEmpty!31128 ((_ is ValueCellFull!9309) mapValue!31128)) b!921387))

(assert (= (and b!921385 ((_ is ValueCellFull!9309) mapDefault!31128)) b!921374))

(assert (= start!78860 b!921385))

(declare-fun b_lambda!13575 () Bool)

(assert (=> (not b_lambda!13575) (not b!921384)))

(declare-fun t!26404 () Bool)

(declare-fun tb!5653 () Bool)

(assert (=> (and start!78860 (= defaultEntry!1235 defaultEntry!1235) t!26404) tb!5653))

(declare-fun result!11129 () Bool)

(assert (=> tb!5653 (= result!11129 tp_is_empty!19581)))

(assert (=> b!921384 t!26404))

(declare-fun b_and!27885 () Bool)

(assert (= b_and!27883 (and (=> t!26404 result!11129) b_and!27885)))

(declare-fun m!855325 () Bool)

(assert (=> b!921384 m!855325))

(declare-fun m!855327 () Bool)

(assert (=> b!921384 m!855327))

(declare-fun m!855329 () Bool)

(assert (=> b!921384 m!855329))

(assert (=> b!921384 m!855327))

(declare-fun m!855331 () Bool)

(assert (=> b!921384 m!855331))

(declare-fun m!855333 () Bool)

(assert (=> b!921384 m!855333))

(declare-fun m!855335 () Bool)

(assert (=> b!921384 m!855335))

(declare-fun m!855337 () Bool)

(assert (=> b!921384 m!855337))

(declare-fun m!855339 () Bool)

(assert (=> b!921384 m!855339))

(declare-fun m!855341 () Bool)

(assert (=> b!921384 m!855341))

(declare-fun m!855343 () Bool)

(assert (=> b!921384 m!855343))

(declare-fun m!855345 () Bool)

(assert (=> b!921384 m!855345))

(assert (=> b!921384 m!855329))

(assert (=> b!921384 m!855337))

(declare-fun m!855347 () Bool)

(assert (=> b!921384 m!855347))

(declare-fun m!855349 () Bool)

(assert (=> b!921384 m!855349))

(assert (=> b!921384 m!855343))

(declare-fun m!855351 () Bool)

(assert (=> b!921386 m!855351))

(declare-fun m!855353 () Bool)

(assert (=> start!78860 m!855353))

(declare-fun m!855355 () Bool)

(assert (=> start!78860 m!855355))

(declare-fun m!855357 () Bool)

(assert (=> start!78860 m!855357))

(declare-fun m!855359 () Bool)

(assert (=> b!921388 m!855359))

(declare-fun m!855361 () Bool)

(assert (=> b!921379 m!855361))

(declare-fun m!855363 () Bool)

(assert (=> mapNonEmpty!31128 m!855363))

(declare-fun m!855365 () Bool)

(assert (=> b!921378 m!855365))

(declare-fun m!855367 () Bool)

(assert (=> b!921376 m!855367))

(declare-fun m!855369 () Bool)

(assert (=> b!921376 m!855369))

(declare-fun m!855371 () Bool)

(assert (=> b!921377 m!855371))

(declare-fun m!855373 () Bool)

(assert (=> b!921377 m!855373))

(declare-fun m!855375 () Bool)

(assert (=> b!921375 m!855375))

(declare-fun m!855377 () Bool)

(assert (=> b!921371 m!855377))

(declare-fun m!855379 () Bool)

(assert (=> b!921383 m!855379))

(declare-fun m!855381 () Bool)

(assert (=> b!921380 m!855381))

(check-sat (not b!921379) (not b!921383) (not b!921377) (not mapNonEmpty!31128) (not b!921378) (not start!78860) (not b!921375) (not b_next!17073) (not b!921371) (not b!921380) (not b!921388) tp_is_empty!19581 (not b_lambda!13575) (not b!921386) (not b!921384) b_and!27885 (not b!921376))
(check-sat b_and!27885 (not b_next!17073))
