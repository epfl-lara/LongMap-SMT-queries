; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78846 () Bool)

(assert start!78846)

(declare-fun b_free!17077 () Bool)

(declare-fun b_next!17077 () Bool)

(assert (=> start!78846 (= b_free!17077 (not b_next!17077))))

(declare-fun tp!59672 () Bool)

(declare-fun b_and!27865 () Bool)

(assert (=> start!78846 (= tp!59672 b_and!27865)))

(declare-fun mapNonEmpty!31134 () Bool)

(declare-fun mapRes!31134 () Bool)

(declare-fun tp!59673 () Bool)

(declare-fun e!516949 () Bool)

(assert (=> mapNonEmpty!31134 (= mapRes!31134 (and tp!59673 e!516949))))

(declare-datatypes ((V!31079 0))(
  ( (V!31080 (val!9843 Int)) )
))
(declare-datatypes ((ValueCell!9311 0))(
  ( (ValueCellFull!9311 (v!12360 V!31079)) (EmptyCell!9311) )
))
(declare-fun mapValue!31134 () ValueCell!9311)

(declare-datatypes ((array!55121 0))(
  ( (array!55122 (arr!26506 (Array (_ BitVec 32) ValueCell!9311)) (size!26967 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55121)

(declare-fun mapRest!31134 () (Array (_ BitVec 32) ValueCell!9311))

(declare-fun mapKey!31134 () (_ BitVec 32))

(assert (=> mapNonEmpty!31134 (= (arr!26506 _values!1231) (store mapRest!31134 mapKey!31134 mapValue!31134))))

(declare-fun b!921244 () Bool)

(declare-fun e!516957 () Bool)

(declare-fun e!516950 () Bool)

(assert (=> b!921244 (= e!516957 (not e!516950))))

(declare-fun res!621310 () Bool)

(assert (=> b!921244 (=> res!621310 e!516950)))

(declare-datatypes ((array!55123 0))(
  ( (array!55124 (arr!26507 (Array (_ BitVec 32) (_ BitVec 64))) (size!26968 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55123)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921244 (= res!621310 (or (bvsge (size!26968 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26968 _keys!1487))))))

(declare-fun e!516954 () Bool)

(assert (=> b!921244 e!516954))

(declare-fun c!96052 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!921244 (= c!96052 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((Unit!31010 0))(
  ( (Unit!31011) )
))
(declare-fun lt!413480 () Unit!31010)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31079)

(declare-fun minValue!1173 () V!31079)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!187 (array!55123 array!55121 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 64) (_ BitVec 32) Int) Unit!31010)

(assert (=> b!921244 (= lt!413480 (lemmaListMapContainsThenArrayContainsFrom!187 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!18643 0))(
  ( (Nil!18640) (Cons!18639 (h!19785 (_ BitVec 64)) (t!26441 List!18643)) )
))
(declare-fun arrayNoDuplicates!0 (array!55123 (_ BitVec 32) List!18643) Bool)

(assert (=> b!921244 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18640)))

(declare-fun lt!413484 () Unit!31010)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55123 (_ BitVec 32) (_ BitVec 32)) Unit!31010)

(assert (=> b!921244 (= lt!413484 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12858 0))(
  ( (tuple2!12859 (_1!6440 (_ BitVec 64)) (_2!6440 V!31079)) )
))
(declare-datatypes ((List!18644 0))(
  ( (Nil!18641) (Cons!18640 (h!19786 tuple2!12858) (t!26442 List!18644)) )
))
(declare-datatypes ((ListLongMap!11545 0))(
  ( (ListLongMap!11546 (toList!5788 List!18644)) )
))
(declare-fun lt!413482 () ListLongMap!11545)

(declare-fun lt!413481 () tuple2!12858)

(declare-fun contains!4801 (ListLongMap!11545 (_ BitVec 64)) Bool)

(declare-fun +!2699 (ListLongMap!11545 tuple2!12858) ListLongMap!11545)

(assert (=> b!921244 (contains!4801 (+!2699 lt!413482 lt!413481) k0!1099)))

(declare-fun lt!413479 () (_ BitVec 64))

(declare-fun lt!413478 () Unit!31010)

(declare-fun lt!413483 () V!31079)

(declare-fun addStillContains!396 (ListLongMap!11545 (_ BitVec 64) V!31079 (_ BitVec 64)) Unit!31010)

(assert (=> b!921244 (= lt!413478 (addStillContains!396 lt!413482 lt!413479 lt!413483 k0!1099))))

(declare-fun getCurrentListMap!2979 (array!55123 array!55121 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 32) Int) ListLongMap!11545)

(assert (=> b!921244 (= (getCurrentListMap!2979 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2699 (getCurrentListMap!2979 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413481))))

(assert (=> b!921244 (= lt!413481 (tuple2!12859 lt!413479 lt!413483))))

(declare-fun get!13920 (ValueCell!9311 V!31079) V!31079)

(declare-fun dynLambda!1455 (Int (_ BitVec 64)) V!31079)

(assert (=> b!921244 (= lt!413483 (get!13920 (select (arr!26506 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1455 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413485 () Unit!31010)

(declare-fun lemmaListMapRecursiveValidKeyArray!63 (array!55123 array!55121 (_ BitVec 32) (_ BitVec 32) V!31079 V!31079 (_ BitVec 32) Int) Unit!31010)

(assert (=> b!921244 (= lt!413485 (lemmaListMapRecursiveValidKeyArray!63 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921245 () Bool)

(declare-fun e!516956 () Bool)

(declare-fun tp_is_empty!19585 () Bool)

(assert (=> b!921245 (= e!516956 tp_is_empty!19585)))

(declare-fun b!921246 () Bool)

(declare-fun res!621306 () Bool)

(declare-fun e!516951 () Bool)

(assert (=> b!921246 (=> (not res!621306) (not e!516951))))

(assert (=> b!921246 (= res!621306 (and (= (size!26967 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26968 _keys!1487) (size!26967 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921247 () Bool)

(assert (=> b!921247 (= e!516954 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921248 () Bool)

(declare-fun res!621314 () Bool)

(assert (=> b!921248 (=> res!621314 e!516950)))

(declare-fun noDuplicate!1353 (List!18643) Bool)

(assert (=> b!921248 (= res!621314 (not (noDuplicate!1353 Nil!18640)))))

(declare-fun b!921249 () Bool)

(declare-fun res!621315 () Bool)

(declare-fun e!516953 () Bool)

(assert (=> b!921249 (=> (not res!621315) (not e!516953))))

(declare-fun v!791 () V!31079)

(declare-fun apply!608 (ListLongMap!11545 (_ BitVec 64)) V!31079)

(assert (=> b!921249 (= res!621315 (= (apply!608 lt!413482 k0!1099) v!791))))

(declare-fun res!621311 () Bool)

(assert (=> start!78846 (=> (not res!621311) (not e!516951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78846 (= res!621311 (validMask!0 mask!1881))))

(assert (=> start!78846 e!516951))

(assert (=> start!78846 true))

(assert (=> start!78846 tp_is_empty!19585))

(declare-fun e!516952 () Bool)

(declare-fun array_inv!20736 (array!55121) Bool)

(assert (=> start!78846 (and (array_inv!20736 _values!1231) e!516952)))

(assert (=> start!78846 tp!59672))

(declare-fun array_inv!20737 (array!55123) Bool)

(assert (=> start!78846 (array_inv!20737 _keys!1487)))

(declare-fun b!921250 () Bool)

(assert (=> b!921250 (= e!516953 e!516957)))

(declare-fun res!621316 () Bool)

(assert (=> b!921250 (=> (not res!621316) (not e!516957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921250 (= res!621316 (validKeyInArray!0 lt!413479))))

(assert (=> b!921250 (= lt!413479 (select (arr!26507 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921251 () Bool)

(assert (=> b!921251 (= e!516952 (and e!516956 mapRes!31134))))

(declare-fun condMapEmpty!31134 () Bool)

(declare-fun mapDefault!31134 () ValueCell!9311)

(assert (=> b!921251 (= condMapEmpty!31134 (= (arr!26506 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9311)) mapDefault!31134)))))

(declare-fun b!921252 () Bool)

(declare-fun res!621313 () Bool)

(assert (=> b!921252 (=> (not res!621313) (not e!516951))))

(assert (=> b!921252 (= res!621313 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26968 _keys!1487))))))

(declare-fun b!921253 () Bool)

(declare-fun res!621309 () Bool)

(assert (=> b!921253 (=> res!621309 e!516950)))

(declare-fun contains!4802 (List!18643 (_ BitVec 64)) Bool)

(assert (=> b!921253 (= res!621309 (contains!4802 Nil!18640 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921254 () Bool)

(assert (=> b!921254 (= e!516949 tp_is_empty!19585)))

(declare-fun b!921255 () Bool)

(assert (=> b!921255 (= e!516951 e!516953)))

(declare-fun res!621307 () Bool)

(assert (=> b!921255 (=> (not res!621307) (not e!516953))))

(assert (=> b!921255 (= res!621307 (contains!4801 lt!413482 k0!1099))))

(assert (=> b!921255 (= lt!413482 (getCurrentListMap!2979 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921256 () Bool)

(declare-fun res!621305 () Bool)

(assert (=> b!921256 (=> (not res!621305) (not e!516953))))

(assert (=> b!921256 (= res!621305 (validKeyInArray!0 k0!1099))))

(declare-fun b!921257 () Bool)

(declare-fun res!621312 () Bool)

(assert (=> b!921257 (=> (not res!621312) (not e!516953))))

(assert (=> b!921257 (= res!621312 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921258 () Bool)

(declare-fun res!621308 () Bool)

(assert (=> b!921258 (=> (not res!621308) (not e!516951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55123 (_ BitVec 32)) Bool)

(assert (=> b!921258 (= res!621308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921259 () Bool)

(assert (=> b!921259 (= e!516950 true)))

(declare-fun lt!413486 () Bool)

(assert (=> b!921259 (= lt!413486 (contains!4802 Nil!18640 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!31134 () Bool)

(assert (=> mapIsEmpty!31134 mapRes!31134))

(declare-fun b!921260 () Bool)

(declare-fun res!621317 () Bool)

(assert (=> b!921260 (=> (not res!621317) (not e!516951))))

(assert (=> b!921260 (= res!621317 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18640))))

(declare-fun b!921261 () Bool)

(declare-fun arrayContainsKey!0 (array!55123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921261 (= e!516954 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!78846 res!621311) b!921246))

(assert (= (and b!921246 res!621306) b!921258))

(assert (= (and b!921258 res!621308) b!921260))

(assert (= (and b!921260 res!621317) b!921252))

(assert (= (and b!921252 res!621313) b!921255))

(assert (= (and b!921255 res!621307) b!921249))

(assert (= (and b!921249 res!621315) b!921257))

(assert (= (and b!921257 res!621312) b!921256))

(assert (= (and b!921256 res!621305) b!921250))

(assert (= (and b!921250 res!621316) b!921244))

(assert (= (and b!921244 c!96052) b!921261))

(assert (= (and b!921244 (not c!96052)) b!921247))

(assert (= (and b!921244 (not res!621310)) b!921248))

(assert (= (and b!921248 (not res!621314)) b!921253))

(assert (= (and b!921253 (not res!621309)) b!921259))

(assert (= (and b!921251 condMapEmpty!31134) mapIsEmpty!31134))

(assert (= (and b!921251 (not condMapEmpty!31134)) mapNonEmpty!31134))

(get-info :version)

(assert (= (and mapNonEmpty!31134 ((_ is ValueCellFull!9311) mapValue!31134)) b!921254))

(assert (= (and b!921251 ((_ is ValueCellFull!9311) mapDefault!31134)) b!921245))

(assert (= start!78846 b!921251))

(declare-fun b_lambda!13561 () Bool)

(assert (=> (not b_lambda!13561) (not b!921244)))

(declare-fun t!26440 () Bool)

(declare-fun tb!5649 () Bool)

(assert (=> (and start!78846 (= defaultEntry!1235 defaultEntry!1235) t!26440) tb!5649))

(declare-fun result!11129 () Bool)

(assert (=> tb!5649 (= result!11129 tp_is_empty!19585)))

(assert (=> b!921244 t!26440))

(declare-fun b_and!27867 () Bool)

(assert (= b_and!27865 (and (=> t!26440 result!11129) b_and!27867)))

(declare-fun m!854683 () Bool)

(assert (=> b!921248 m!854683))

(declare-fun m!854685 () Bool)

(assert (=> mapNonEmpty!31134 m!854685))

(declare-fun m!854687 () Bool)

(assert (=> b!921255 m!854687))

(declare-fun m!854689 () Bool)

(assert (=> b!921255 m!854689))

(declare-fun m!854691 () Bool)

(assert (=> b!921253 m!854691))

(declare-fun m!854693 () Bool)

(assert (=> b!921244 m!854693))

(declare-fun m!854695 () Bool)

(assert (=> b!921244 m!854695))

(declare-fun m!854697 () Bool)

(assert (=> b!921244 m!854697))

(declare-fun m!854699 () Bool)

(assert (=> b!921244 m!854699))

(declare-fun m!854701 () Bool)

(assert (=> b!921244 m!854701))

(assert (=> b!921244 m!854699))

(assert (=> b!921244 m!854701))

(declare-fun m!854703 () Bool)

(assert (=> b!921244 m!854703))

(declare-fun m!854705 () Bool)

(assert (=> b!921244 m!854705))

(declare-fun m!854707 () Bool)

(assert (=> b!921244 m!854707))

(declare-fun m!854709 () Bool)

(assert (=> b!921244 m!854709))

(declare-fun m!854711 () Bool)

(assert (=> b!921244 m!854711))

(declare-fun m!854713 () Bool)

(assert (=> b!921244 m!854713))

(declare-fun m!854715 () Bool)

(assert (=> b!921244 m!854715))

(assert (=> b!921244 m!854693))

(assert (=> b!921244 m!854713))

(declare-fun m!854717 () Bool)

(assert (=> b!921244 m!854717))

(declare-fun m!854719 () Bool)

(assert (=> b!921250 m!854719))

(declare-fun m!854721 () Bool)

(assert (=> b!921250 m!854721))

(declare-fun m!854723 () Bool)

(assert (=> b!921259 m!854723))

(declare-fun m!854725 () Bool)

(assert (=> start!78846 m!854725))

(declare-fun m!854727 () Bool)

(assert (=> start!78846 m!854727))

(declare-fun m!854729 () Bool)

(assert (=> start!78846 m!854729))

(declare-fun m!854731 () Bool)

(assert (=> b!921249 m!854731))

(declare-fun m!854733 () Bool)

(assert (=> b!921261 m!854733))

(declare-fun m!854735 () Bool)

(assert (=> b!921256 m!854735))

(declare-fun m!854737 () Bool)

(assert (=> b!921258 m!854737))

(declare-fun m!854739 () Bool)

(assert (=> b!921260 m!854739))

(check-sat b_and!27867 (not b!921260) (not b!921258) (not b_next!17077) (not b!921256) (not b!921259) (not mapNonEmpty!31134) (not b!921250) (not b!921249) (not start!78846) (not b_lambda!13561) (not b!921248) tp_is_empty!19585 (not b!921244) (not b!921261) (not b!921253) (not b!921255))
(check-sat b_and!27867 (not b_next!17077))
