; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79010 () Bool)

(assert start!79010)

(declare-fun b_free!17223 () Bool)

(declare-fun b_next!17223 () Bool)

(assert (=> start!79010 (= b_free!17223 (not b_next!17223))))

(declare-fun tp!60109 () Bool)

(declare-fun b_and!28183 () Bool)

(assert (=> start!79010 (= tp!60109 b_and!28183)))

(declare-fun b!925329 () Bool)

(declare-fun e!519334 () Bool)

(assert (=> b!925329 (= e!519334 (not true))))

(declare-fun e!519337 () Bool)

(assert (=> b!925329 e!519337))

(declare-fun res!623570 () Bool)

(assert (=> b!925329 (=> (not res!623570) (not e!519337))))

(declare-datatypes ((V!31273 0))(
  ( (V!31274 (val!9916 Int)) )
))
(declare-datatypes ((tuple2!12928 0))(
  ( (tuple2!12929 (_1!6475 (_ BitVec 64)) (_2!6475 V!31273)) )
))
(declare-datatypes ((List!18730 0))(
  ( (Nil!18727) (Cons!18726 (h!19872 tuple2!12928) (t!26683 List!18730)) )
))
(declare-datatypes ((ListLongMap!11625 0))(
  ( (ListLongMap!11626 (toList!5828 List!18730)) )
))
(declare-fun lt!416392 () ListLongMap!11625)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4888 (ListLongMap!11625 (_ BitVec 64)) Bool)

(assert (=> b!925329 (= res!623570 (contains!4888 lt!416392 k0!1099))))

(declare-datatypes ((array!55430 0))(
  ( (array!55431 (arr!26660 (Array (_ BitVec 32) (_ BitVec 64))) (size!27119 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55430)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9384 0))(
  ( (ValueCellFull!9384 (v!12434 V!31273)) (EmptyCell!9384) )
))
(declare-datatypes ((array!55432 0))(
  ( (array!55433 (arr!26661 (Array (_ BitVec 32) ValueCell!9384)) (size!27120 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55432)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31273)

(declare-fun minValue!1173 () V!31273)

(declare-fun getCurrentListMap!3079 (array!55430 array!55432 (_ BitVec 32) (_ BitVec 32) V!31273 V!31273 (_ BitVec 32) Int) ListLongMap!11625)

(assert (=> b!925329 (= lt!416392 (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31273)

(declare-datatypes ((Unit!31261 0))(
  ( (Unit!31262) )
))
(declare-fun lt!416380 () Unit!31261)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!69 (array!55430 array!55432 (_ BitVec 32) (_ BitVec 32) V!31273 V!31273 (_ BitVec 64) V!31273 (_ BitVec 32) Int) Unit!31261)

(assert (=> b!925329 (= lt!416380 (lemmaListMapApplyFromThenApplyFromZero!69 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925330 () Bool)

(declare-fun e!519335 () Unit!31261)

(declare-fun Unit!31263 () Unit!31261)

(assert (=> b!925330 (= e!519335 Unit!31263)))

(declare-fun b!925331 () Bool)

(declare-fun e!519343 () Bool)

(declare-fun e!519338 () Bool)

(assert (=> b!925331 (= e!519343 e!519338)))

(declare-fun res!623573 () Bool)

(assert (=> b!925331 (=> (not res!623573) (not e!519338))))

(declare-fun lt!416387 () ListLongMap!11625)

(assert (=> b!925331 (= res!623573 (contains!4888 lt!416387 k0!1099))))

(assert (=> b!925331 (= lt!416387 (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925332 () Bool)

(declare-fun e!519340 () Bool)

(declare-fun tp_is_empty!19731 () Bool)

(assert (=> b!925332 (= e!519340 tp_is_empty!19731)))

(declare-fun b!925333 () Bool)

(declare-fun e!519333 () Bool)

(declare-fun e!519332 () Bool)

(assert (=> b!925333 (= e!519333 e!519332)))

(declare-fun res!623569 () Bool)

(assert (=> b!925333 (=> (not res!623569) (not e!519332))))

(assert (=> b!925333 (= res!623569 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27119 _keys!1487)))))

(declare-fun lt!416386 () Unit!31261)

(declare-fun e!519331 () Unit!31261)

(assert (=> b!925333 (= lt!416386 e!519331)))

(declare-fun c!96564 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925333 (= c!96564 (validKeyInArray!0 k0!1099))))

(declare-fun b!925334 () Bool)

(declare-fun e!519336 () Bool)

(declare-fun e!519341 () Bool)

(declare-fun mapRes!31353 () Bool)

(assert (=> b!925334 (= e!519336 (and e!519341 mapRes!31353))))

(declare-fun condMapEmpty!31353 () Bool)

(declare-fun mapDefault!31353 () ValueCell!9384)

(assert (=> b!925334 (= condMapEmpty!31353 (= (arr!26661 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9384)) mapDefault!31353)))))

(declare-fun b!925335 () Bool)

(declare-fun apply!658 (ListLongMap!11625 (_ BitVec 64)) V!31273)

(assert (=> b!925335 (= e!519337 (= (apply!658 lt!416392 k0!1099) v!791))))

(declare-fun res!623568 () Bool)

(assert (=> start!79010 (=> (not res!623568) (not e!519343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79010 (= res!623568 (validMask!0 mask!1881))))

(assert (=> start!79010 e!519343))

(assert (=> start!79010 true))

(assert (=> start!79010 tp_is_empty!19731))

(declare-fun array_inv!20764 (array!55432) Bool)

(assert (=> start!79010 (and (array_inv!20764 _values!1231) e!519336)))

(assert (=> start!79010 tp!60109))

(declare-fun array_inv!20765 (array!55430) Bool)

(assert (=> start!79010 (array_inv!20765 _keys!1487)))

(declare-fun b!925336 () Bool)

(assert (=> b!925336 (= e!519331 e!519335)))

(declare-fun lt!416388 () (_ BitVec 64))

(assert (=> b!925336 (= lt!416388 (select (arr!26660 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96563 () Bool)

(assert (=> b!925336 (= c!96563 (validKeyInArray!0 lt!416388))))

(declare-fun b!925337 () Bool)

(assert (=> b!925337 (= e!519341 tp_is_empty!19731)))

(declare-fun b!925338 () Bool)

(declare-fun res!623574 () Bool)

(assert (=> b!925338 (=> (not res!623574) (not e!519343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55430 (_ BitVec 32)) Bool)

(assert (=> b!925338 (= res!623574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925339 () Bool)

(declare-fun res!623572 () Bool)

(assert (=> b!925339 (=> (not res!623572) (not e!519334))))

(declare-fun lt!416385 () ListLongMap!11625)

(assert (=> b!925339 (= res!623572 (= (apply!658 lt!416385 k0!1099) v!791))))

(declare-fun b!925340 () Bool)

(declare-fun res!623578 () Bool)

(assert (=> b!925340 (=> (not res!623578) (not e!519343))))

(declare-datatypes ((List!18731 0))(
  ( (Nil!18728) (Cons!18727 (h!19873 (_ BitVec 64)) (t!26684 List!18731)) )
))
(declare-fun arrayNoDuplicates!0 (array!55430 (_ BitVec 32) List!18731) Bool)

(assert (=> b!925340 (= res!623578 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18728))))

(declare-fun b!925341 () Bool)

(declare-fun e!519342 () Bool)

(assert (=> b!925341 (= e!519342 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925342 () Bool)

(declare-fun lt!416383 () ListLongMap!11625)

(declare-fun lt!416390 () V!31273)

(assert (=> b!925342 (= (apply!658 lt!416383 k0!1099) lt!416390)))

(declare-fun lt!416379 () V!31273)

(declare-fun lt!416389 () Unit!31261)

(declare-fun addApplyDifferent!379 (ListLongMap!11625 (_ BitVec 64) V!31273 (_ BitVec 64)) Unit!31261)

(assert (=> b!925342 (= lt!416389 (addApplyDifferent!379 lt!416387 lt!416388 lt!416379 k0!1099))))

(assert (=> b!925342 (not (= lt!416388 k0!1099))))

(declare-fun lt!416377 () Unit!31261)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55430 (_ BitVec 64) (_ BitVec 32) List!18731) Unit!31261)

(assert (=> b!925342 (= lt!416377 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18728))))

(assert (=> b!925342 e!519342))

(declare-fun c!96562 () Bool)

(assert (=> b!925342 (= c!96562 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416384 () Unit!31261)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!230 (array!55430 array!55432 (_ BitVec 32) (_ BitVec 32) V!31273 V!31273 (_ BitVec 64) (_ BitVec 32) Int) Unit!31261)

(assert (=> b!925342 (= lt!416384 (lemmaListMapContainsThenArrayContainsFrom!230 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925342 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18728)))

(declare-fun lt!416382 () Unit!31261)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55430 (_ BitVec 32) (_ BitVec 32)) Unit!31261)

(assert (=> b!925342 (= lt!416382 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925342 (contains!4888 lt!416383 k0!1099)))

(declare-fun lt!416378 () tuple2!12928)

(declare-fun +!2723 (ListLongMap!11625 tuple2!12928) ListLongMap!11625)

(assert (=> b!925342 (= lt!416383 (+!2723 lt!416387 lt!416378))))

(declare-fun lt!416391 () Unit!31261)

(declare-fun addStillContains!447 (ListLongMap!11625 (_ BitVec 64) V!31273 (_ BitVec 64)) Unit!31261)

(assert (=> b!925342 (= lt!416391 (addStillContains!447 lt!416387 lt!416388 lt!416379 k0!1099))))

(assert (=> b!925342 (= (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2723 (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416378))))

(assert (=> b!925342 (= lt!416378 (tuple2!12929 lt!416388 lt!416379))))

(declare-fun get!14020 (ValueCell!9384 V!31273) V!31273)

(declare-fun dynLambda!1512 (Int (_ BitVec 64)) V!31273)

(assert (=> b!925342 (= lt!416379 (get!14020 (select (arr!26661 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1512 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416381 () Unit!31261)

(declare-fun lemmaListMapRecursiveValidKeyArray!113 (array!55430 array!55432 (_ BitVec 32) (_ BitVec 32) V!31273 V!31273 (_ BitVec 32) Int) Unit!31261)

(assert (=> b!925342 (= lt!416381 (lemmaListMapRecursiveValidKeyArray!113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925342 (= e!519335 lt!416389)))

(declare-fun b!925343 () Bool)

(assert (=> b!925343 (= e!519338 e!519333)))

(declare-fun res!623571 () Bool)

(assert (=> b!925343 (=> (not res!623571) (not e!519333))))

(assert (=> b!925343 (= res!623571 (and (= lt!416390 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925343 (= lt!416390 (apply!658 lt!416387 k0!1099))))

(declare-fun mapNonEmpty!31353 () Bool)

(declare-fun tp!60110 () Bool)

(assert (=> mapNonEmpty!31353 (= mapRes!31353 (and tp!60110 e!519340))))

(declare-fun mapValue!31353 () ValueCell!9384)

(declare-fun mapKey!31353 () (_ BitVec 32))

(declare-fun mapRest!31353 () (Array (_ BitVec 32) ValueCell!9384))

(assert (=> mapNonEmpty!31353 (= (arr!26661 _values!1231) (store mapRest!31353 mapKey!31353 mapValue!31353))))

(declare-fun mapIsEmpty!31353 () Bool)

(assert (=> mapIsEmpty!31353 mapRes!31353))

(declare-fun b!925344 () Bool)

(assert (=> b!925344 (= e!519332 e!519334)))

(declare-fun res!623575 () Bool)

(assert (=> b!925344 (=> (not res!623575) (not e!519334))))

(assert (=> b!925344 (= res!623575 (contains!4888 lt!416385 k0!1099))))

(assert (=> b!925344 (= lt!416385 (getCurrentListMap!3079 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925345 () Bool)

(declare-fun Unit!31264 () Unit!31261)

(assert (=> b!925345 (= e!519331 Unit!31264)))

(declare-fun b!925346 () Bool)

(declare-fun arrayContainsKey!0 (array!55430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925346 (= e!519342 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925347 () Bool)

(declare-fun res!623577 () Bool)

(assert (=> b!925347 (=> (not res!623577) (not e!519343))))

(assert (=> b!925347 (= res!623577 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27119 _keys!1487))))))

(declare-fun b!925348 () Bool)

(declare-fun res!623576 () Bool)

(assert (=> b!925348 (=> (not res!623576) (not e!519343))))

(assert (=> b!925348 (= res!623576 (and (= (size!27120 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27119 _keys!1487) (size!27120 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79010 res!623568) b!925348))

(assert (= (and b!925348 res!623576) b!925338))

(assert (= (and b!925338 res!623574) b!925340))

(assert (= (and b!925340 res!623578) b!925347))

(assert (= (and b!925347 res!623577) b!925331))

(assert (= (and b!925331 res!623573) b!925343))

(assert (= (and b!925343 res!623571) b!925333))

(assert (= (and b!925333 c!96564) b!925336))

(assert (= (and b!925333 (not c!96564)) b!925345))

(assert (= (and b!925336 c!96563) b!925342))

(assert (= (and b!925336 (not c!96563)) b!925330))

(assert (= (and b!925342 c!96562) b!925346))

(assert (= (and b!925342 (not c!96562)) b!925341))

(assert (= (and b!925333 res!623569) b!925344))

(assert (= (and b!925344 res!623575) b!925339))

(assert (= (and b!925339 res!623572) b!925329))

(assert (= (and b!925329 res!623570) b!925335))

(assert (= (and b!925334 condMapEmpty!31353) mapIsEmpty!31353))

(assert (= (and b!925334 (not condMapEmpty!31353)) mapNonEmpty!31353))

(get-info :version)

(assert (= (and mapNonEmpty!31353 ((_ is ValueCellFull!9384) mapValue!31353)) b!925332))

(assert (= (and b!925334 ((_ is ValueCellFull!9384) mapDefault!31353)) b!925337))

(assert (= start!79010 b!925334))

(declare-fun b_lambda!13725 () Bool)

(assert (=> (not b_lambda!13725) (not b!925342)))

(declare-fun t!26682 () Bool)

(declare-fun tb!5803 () Bool)

(assert (=> (and start!79010 (= defaultEntry!1235 defaultEntry!1235) t!26682) tb!5803))

(declare-fun result!11429 () Bool)

(assert (=> tb!5803 (= result!11429 tp_is_empty!19731)))

(assert (=> b!925342 t!26682))

(declare-fun b_and!28185 () Bool)

(assert (= b_and!28183 (and (=> t!26682 result!11429) b_and!28185)))

(declare-fun m!859735 () Bool)

(assert (=> b!925340 m!859735))

(declare-fun m!859737 () Bool)

(assert (=> start!79010 m!859737))

(declare-fun m!859739 () Bool)

(assert (=> start!79010 m!859739))

(declare-fun m!859741 () Bool)

(assert (=> start!79010 m!859741))

(declare-fun m!859743 () Bool)

(assert (=> b!925331 m!859743))

(declare-fun m!859745 () Bool)

(assert (=> b!925331 m!859745))

(declare-fun m!859747 () Bool)

(assert (=> b!925342 m!859747))

(declare-fun m!859749 () Bool)

(assert (=> b!925342 m!859749))

(declare-fun m!859751 () Bool)

(assert (=> b!925342 m!859751))

(declare-fun m!859753 () Bool)

(assert (=> b!925342 m!859753))

(assert (=> b!925342 m!859749))

(assert (=> b!925342 m!859751))

(declare-fun m!859755 () Bool)

(assert (=> b!925342 m!859755))

(declare-fun m!859757 () Bool)

(assert (=> b!925342 m!859757))

(declare-fun m!859759 () Bool)

(assert (=> b!925342 m!859759))

(declare-fun m!859761 () Bool)

(assert (=> b!925342 m!859761))

(declare-fun m!859763 () Bool)

(assert (=> b!925342 m!859763))

(declare-fun m!859765 () Bool)

(assert (=> b!925342 m!859765))

(declare-fun m!859767 () Bool)

(assert (=> b!925342 m!859767))

(assert (=> b!925342 m!859759))

(declare-fun m!859769 () Bool)

(assert (=> b!925342 m!859769))

(declare-fun m!859771 () Bool)

(assert (=> b!925342 m!859771))

(declare-fun m!859773 () Bool)

(assert (=> b!925342 m!859773))

(declare-fun m!859775 () Bool)

(assert (=> b!925342 m!859775))

(declare-fun m!859777 () Bool)

(assert (=> b!925342 m!859777))

(declare-fun m!859779 () Bool)

(assert (=> b!925329 m!859779))

(declare-fun m!859781 () Bool)

(assert (=> b!925329 m!859781))

(declare-fun m!859783 () Bool)

(assert (=> b!925329 m!859783))

(declare-fun m!859785 () Bool)

(assert (=> b!925343 m!859785))

(declare-fun m!859787 () Bool)

(assert (=> b!925333 m!859787))

(declare-fun m!859789 () Bool)

(assert (=> b!925346 m!859789))

(declare-fun m!859791 () Bool)

(assert (=> b!925338 m!859791))

(declare-fun m!859793 () Bool)

(assert (=> b!925344 m!859793))

(assert (=> b!925344 m!859757))

(declare-fun m!859795 () Bool)

(assert (=> b!925339 m!859795))

(declare-fun m!859797 () Bool)

(assert (=> mapNonEmpty!31353 m!859797))

(declare-fun m!859799 () Bool)

(assert (=> b!925335 m!859799))

(declare-fun m!859801 () Bool)

(assert (=> b!925336 m!859801))

(declare-fun m!859803 () Bool)

(assert (=> b!925336 m!859803))

(check-sat (not b!925342) (not b!925340) (not b_lambda!13725) tp_is_empty!19731 (not start!79010) (not b!925329) (not b!925343) b_and!28185 (not b!925344) (not b!925339) (not b!925333) (not b!925338) (not mapNonEmpty!31353) (not b!925331) (not b!925336) (not b_next!17223) (not b!925335) (not b!925346))
(check-sat b_and!28185 (not b_next!17223))
