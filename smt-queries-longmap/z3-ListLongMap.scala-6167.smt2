; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79112 () Bool)

(assert start!79112)

(declare-fun b_free!17325 () Bool)

(declare-fun b_next!17325 () Bool)

(assert (=> start!79112 (= b_free!17325 (not b_next!17325))))

(declare-fun tp!60416 () Bool)

(declare-fun b_and!28387 () Bool)

(assert (=> start!79112 (= tp!60416 b_and!28387)))

(declare-fun b!928491 () Bool)

(declare-fun e!521327 () Bool)

(assert (=> b!928491 (= e!521327 (not true))))

(declare-fun e!521329 () Bool)

(assert (=> b!928491 e!521329))

(declare-fun res!625257 () Bool)

(assert (=> b!928491 (=> (not res!625257) (not e!521329))))

(declare-datatypes ((V!31409 0))(
  ( (V!31410 (val!9967 Int)) )
))
(declare-datatypes ((tuple2!13022 0))(
  ( (tuple2!13023 (_1!6522 (_ BitVec 64)) (_2!6522 V!31409)) )
))
(declare-datatypes ((List!18820 0))(
  ( (Nil!18817) (Cons!18816 (h!19962 tuple2!13022) (t!26875 List!18820)) )
))
(declare-datatypes ((ListLongMap!11719 0))(
  ( (ListLongMap!11720 (toList!5875 List!18820)) )
))
(declare-fun lt!418836 () ListLongMap!11719)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4932 (ListLongMap!11719 (_ BitVec 64)) Bool)

(assert (=> b!928491 (= res!625257 (contains!4932 lt!418836 k0!1099))))

(declare-datatypes ((array!55626 0))(
  ( (array!55627 (arr!26758 (Array (_ BitVec 32) (_ BitVec 64))) (size!27217 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55626)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9435 0))(
  ( (ValueCellFull!9435 (v!12485 V!31409)) (EmptyCell!9435) )
))
(declare-datatypes ((array!55628 0))(
  ( (array!55629 (arr!26759 (Array (_ BitVec 32) ValueCell!9435)) (size!27218 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55628)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31409)

(declare-fun minValue!1173 () V!31409)

(declare-fun getCurrentListMap!3123 (array!55626 array!55628 (_ BitVec 32) (_ BitVec 32) V!31409 V!31409 (_ BitVec 32) Int) ListLongMap!11719)

(assert (=> b!928491 (= lt!418836 (getCurrentListMap!3123 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31409)

(declare-datatypes ((Unit!31425 0))(
  ( (Unit!31426) )
))
(declare-fun lt!418839 () Unit!31425)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!102 (array!55626 array!55628 (_ BitVec 32) (_ BitVec 32) V!31409 V!31409 (_ BitVec 64) V!31409 (_ BitVec 32) Int) Unit!31425)

(assert (=> b!928491 (= lt!418839 (lemmaListMapApplyFromThenApplyFromZero!102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928492 () Bool)

(declare-fun e!521324 () Bool)

(assert (=> b!928492 (= e!521324 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928493 () Bool)

(declare-fun e!521332 () Bool)

(declare-fun tp_is_empty!19833 () Bool)

(assert (=> b!928493 (= e!521332 tp_is_empty!19833)))

(declare-fun b!928494 () Bool)

(declare-fun arrayContainsKey!0 (array!55626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928494 (= e!521324 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!625252 () Bool)

(declare-fun e!521326 () Bool)

(assert (=> start!79112 (=> (not res!625252) (not e!521326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79112 (= res!625252 (validMask!0 mask!1881))))

(assert (=> start!79112 e!521326))

(assert (=> start!79112 true))

(assert (=> start!79112 tp_is_empty!19833))

(declare-fun e!521322 () Bool)

(declare-fun array_inv!20832 (array!55628) Bool)

(assert (=> start!79112 (and (array_inv!20832 _values!1231) e!521322)))

(assert (=> start!79112 tp!60416))

(declare-fun array_inv!20833 (array!55626) Bool)

(assert (=> start!79112 (array_inv!20833 _keys!1487)))

(declare-fun b!928495 () Bool)

(declare-fun apply!705 (ListLongMap!11719 (_ BitVec 64)) V!31409)

(assert (=> b!928495 (= e!521329 (= (apply!705 lt!418836 k0!1099) v!791))))

(declare-fun b!928496 () Bool)

(declare-fun e!521325 () Unit!31425)

(declare-fun Unit!31427 () Unit!31425)

(assert (=> b!928496 (= e!521325 Unit!31427)))

(declare-fun mapIsEmpty!31506 () Bool)

(declare-fun mapRes!31506 () Bool)

(assert (=> mapIsEmpty!31506 mapRes!31506))

(declare-fun b!928497 () Bool)

(declare-fun res!625255 () Bool)

(assert (=> b!928497 (=> (not res!625255) (not e!521326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55626 (_ BitVec 32)) Bool)

(assert (=> b!928497 (= res!625255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928498 () Bool)

(declare-fun res!625254 () Bool)

(assert (=> b!928498 (=> (not res!625254) (not e!521327))))

(declare-fun lt!418828 () ListLongMap!11719)

(assert (=> b!928498 (= res!625254 (= (apply!705 lt!418828 k0!1099) v!791))))

(declare-fun b!928499 () Bool)

(declare-fun e!521320 () Bool)

(declare-fun e!521330 () Bool)

(assert (=> b!928499 (= e!521320 e!521330)))

(declare-fun res!625259 () Bool)

(assert (=> b!928499 (=> (not res!625259) (not e!521330))))

(assert (=> b!928499 (= res!625259 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27217 _keys!1487)))))

(declare-fun lt!418825 () Unit!31425)

(assert (=> b!928499 (= lt!418825 e!521325)))

(declare-fun c!97021 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928499 (= c!97021 (validKeyInArray!0 k0!1099))))

(declare-fun b!928500 () Bool)

(declare-fun e!521323 () Unit!31425)

(assert (=> b!928500 (= e!521325 e!521323)))

(declare-fun lt!418832 () (_ BitVec 64))

(assert (=> b!928500 (= lt!418832 (select (arr!26758 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97022 () Bool)

(assert (=> b!928500 (= c!97022 (validKeyInArray!0 lt!418832))))

(declare-fun b!928501 () Bool)

(assert (=> b!928501 (= e!521322 (and e!521332 mapRes!31506))))

(declare-fun condMapEmpty!31506 () Bool)

(declare-fun mapDefault!31506 () ValueCell!9435)

(assert (=> b!928501 (= condMapEmpty!31506 (= (arr!26759 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9435)) mapDefault!31506)))))

(declare-fun b!928502 () Bool)

(assert (=> b!928502 (= e!521330 e!521327)))

(declare-fun res!625253 () Bool)

(assert (=> b!928502 (=> (not res!625253) (not e!521327))))

(assert (=> b!928502 (= res!625253 (contains!4932 lt!418828 k0!1099))))

(assert (=> b!928502 (= lt!418828 (getCurrentListMap!3123 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928503 () Bool)

(declare-fun res!625261 () Bool)

(assert (=> b!928503 (=> (not res!625261) (not e!521326))))

(declare-datatypes ((List!18821 0))(
  ( (Nil!18818) (Cons!18817 (h!19963 (_ BitVec 64)) (t!26876 List!18821)) )
))
(declare-fun arrayNoDuplicates!0 (array!55626 (_ BitVec 32) List!18821) Bool)

(assert (=> b!928503 (= res!625261 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18818))))

(declare-fun b!928504 () Bool)

(declare-fun e!521328 () Bool)

(assert (=> b!928504 (= e!521328 e!521320)))

(declare-fun res!625251 () Bool)

(assert (=> b!928504 (=> (not res!625251) (not e!521320))))

(declare-fun lt!418834 () V!31409)

(assert (=> b!928504 (= res!625251 (and (= lt!418834 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!418837 () ListLongMap!11719)

(assert (=> b!928504 (= lt!418834 (apply!705 lt!418837 k0!1099))))

(declare-fun b!928505 () Bool)

(declare-fun lt!418840 () ListLongMap!11719)

(assert (=> b!928505 (= (apply!705 lt!418840 k0!1099) lt!418834)))

(declare-fun lt!418838 () Unit!31425)

(declare-fun lt!418833 () V!31409)

(declare-fun addApplyDifferent!416 (ListLongMap!11719 (_ BitVec 64) V!31409 (_ BitVec 64)) Unit!31425)

(assert (=> b!928505 (= lt!418838 (addApplyDifferent!416 lt!418837 lt!418832 lt!418833 k0!1099))))

(assert (=> b!928505 (not (= lt!418832 k0!1099))))

(declare-fun lt!418831 () Unit!31425)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55626 (_ BitVec 64) (_ BitVec 32) List!18821) Unit!31425)

(assert (=> b!928505 (= lt!418831 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18818))))

(assert (=> b!928505 e!521324))

(declare-fun c!97023 () Bool)

(assert (=> b!928505 (= c!97023 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418835 () Unit!31425)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!267 (array!55626 array!55628 (_ BitVec 32) (_ BitVec 32) V!31409 V!31409 (_ BitVec 64) (_ BitVec 32) Int) Unit!31425)

(assert (=> b!928505 (= lt!418835 (lemmaListMapContainsThenArrayContainsFrom!267 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!928505 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18818)))

(declare-fun lt!418829 () Unit!31425)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55626 (_ BitVec 32) (_ BitVec 32)) Unit!31425)

(assert (=> b!928505 (= lt!418829 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928505 (contains!4932 lt!418840 k0!1099)))

(declare-fun lt!418830 () tuple2!13022)

(declare-fun +!2760 (ListLongMap!11719 tuple2!13022) ListLongMap!11719)

(assert (=> b!928505 (= lt!418840 (+!2760 lt!418837 lt!418830))))

(declare-fun lt!418827 () Unit!31425)

(declare-fun addStillContains!484 (ListLongMap!11719 (_ BitVec 64) V!31409 (_ BitVec 64)) Unit!31425)

(assert (=> b!928505 (= lt!418827 (addStillContains!484 lt!418837 lt!418832 lt!418833 k0!1099))))

(assert (=> b!928505 (= (getCurrentListMap!3123 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2760 (getCurrentListMap!3123 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418830))))

(assert (=> b!928505 (= lt!418830 (tuple2!13023 lt!418832 lt!418833))))

(declare-fun get!14091 (ValueCell!9435 V!31409) V!31409)

(declare-fun dynLambda!1549 (Int (_ BitVec 64)) V!31409)

(assert (=> b!928505 (= lt!418833 (get!14091 (select (arr!26759 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1549 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418826 () Unit!31425)

(declare-fun lemmaListMapRecursiveValidKeyArray!150 (array!55626 array!55628 (_ BitVec 32) (_ BitVec 32) V!31409 V!31409 (_ BitVec 32) Int) Unit!31425)

(assert (=> b!928505 (= lt!418826 (lemmaListMapRecursiveValidKeyArray!150 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928505 (= e!521323 lt!418838)))

(declare-fun mapNonEmpty!31506 () Bool)

(declare-fun tp!60415 () Bool)

(declare-fun e!521321 () Bool)

(assert (=> mapNonEmpty!31506 (= mapRes!31506 (and tp!60415 e!521321))))

(declare-fun mapKey!31506 () (_ BitVec 32))

(declare-fun mapValue!31506 () ValueCell!9435)

(declare-fun mapRest!31506 () (Array (_ BitVec 32) ValueCell!9435))

(assert (=> mapNonEmpty!31506 (= (arr!26759 _values!1231) (store mapRest!31506 mapKey!31506 mapValue!31506))))

(declare-fun b!928506 () Bool)

(assert (=> b!928506 (= e!521321 tp_is_empty!19833)))

(declare-fun b!928507 () Bool)

(declare-fun Unit!31428 () Unit!31425)

(assert (=> b!928507 (= e!521323 Unit!31428)))

(declare-fun b!928508 () Bool)

(declare-fun res!625260 () Bool)

(assert (=> b!928508 (=> (not res!625260) (not e!521326))))

(assert (=> b!928508 (= res!625260 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27217 _keys!1487))))))

(declare-fun b!928509 () Bool)

(declare-fun res!625258 () Bool)

(assert (=> b!928509 (=> (not res!625258) (not e!521326))))

(assert (=> b!928509 (= res!625258 (and (= (size!27218 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27217 _keys!1487) (size!27218 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928510 () Bool)

(assert (=> b!928510 (= e!521326 e!521328)))

(declare-fun res!625256 () Bool)

(assert (=> b!928510 (=> (not res!625256) (not e!521328))))

(assert (=> b!928510 (= res!625256 (contains!4932 lt!418837 k0!1099))))

(assert (=> b!928510 (= lt!418837 (getCurrentListMap!3123 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79112 res!625252) b!928509))

(assert (= (and b!928509 res!625258) b!928497))

(assert (= (and b!928497 res!625255) b!928503))

(assert (= (and b!928503 res!625261) b!928508))

(assert (= (and b!928508 res!625260) b!928510))

(assert (= (and b!928510 res!625256) b!928504))

(assert (= (and b!928504 res!625251) b!928499))

(assert (= (and b!928499 c!97021) b!928500))

(assert (= (and b!928499 (not c!97021)) b!928496))

(assert (= (and b!928500 c!97022) b!928505))

(assert (= (and b!928500 (not c!97022)) b!928507))

(assert (= (and b!928505 c!97023) b!928494))

(assert (= (and b!928505 (not c!97023)) b!928492))

(assert (= (and b!928499 res!625259) b!928502))

(assert (= (and b!928502 res!625253) b!928498))

(assert (= (and b!928498 res!625254) b!928491))

(assert (= (and b!928491 res!625257) b!928495))

(assert (= (and b!928501 condMapEmpty!31506) mapIsEmpty!31506))

(assert (= (and b!928501 (not condMapEmpty!31506)) mapNonEmpty!31506))

(get-info :version)

(assert (= (and mapNonEmpty!31506 ((_ is ValueCellFull!9435) mapValue!31506)) b!928506))

(assert (= (and b!928501 ((_ is ValueCellFull!9435) mapDefault!31506)) b!928493))

(assert (= start!79112 b!928501))

(declare-fun b_lambda!13827 () Bool)

(assert (=> (not b_lambda!13827) (not b!928505)))

(declare-fun t!26874 () Bool)

(declare-fun tb!5905 () Bool)

(assert (=> (and start!79112 (= defaultEntry!1235 defaultEntry!1235) t!26874) tb!5905))

(declare-fun result!11633 () Bool)

(assert (=> tb!5905 (= result!11633 tp_is_empty!19833)))

(assert (=> b!928505 t!26874))

(declare-fun b_and!28389 () Bool)

(assert (= b_and!28387 (and (=> t!26874 result!11633) b_and!28389)))

(declare-fun m!863305 () Bool)

(assert (=> b!928495 m!863305))

(declare-fun m!863307 () Bool)

(assert (=> b!928494 m!863307))

(declare-fun m!863309 () Bool)

(assert (=> mapNonEmpty!31506 m!863309))

(declare-fun m!863311 () Bool)

(assert (=> b!928504 m!863311))

(declare-fun m!863313 () Bool)

(assert (=> b!928505 m!863313))

(declare-fun m!863315 () Bool)

(assert (=> b!928505 m!863315))

(declare-fun m!863317 () Bool)

(assert (=> b!928505 m!863317))

(declare-fun m!863319 () Bool)

(assert (=> b!928505 m!863319))

(declare-fun m!863321 () Bool)

(assert (=> b!928505 m!863321))

(declare-fun m!863323 () Bool)

(assert (=> b!928505 m!863323))

(assert (=> b!928505 m!863321))

(assert (=> b!928505 m!863323))

(declare-fun m!863325 () Bool)

(assert (=> b!928505 m!863325))

(declare-fun m!863327 () Bool)

(assert (=> b!928505 m!863327))

(declare-fun m!863329 () Bool)

(assert (=> b!928505 m!863329))

(declare-fun m!863331 () Bool)

(assert (=> b!928505 m!863331))

(declare-fun m!863333 () Bool)

(assert (=> b!928505 m!863333))

(declare-fun m!863335 () Bool)

(assert (=> b!928505 m!863335))

(declare-fun m!863337 () Bool)

(assert (=> b!928505 m!863337))

(declare-fun m!863339 () Bool)

(assert (=> b!928505 m!863339))

(declare-fun m!863341 () Bool)

(assert (=> b!928505 m!863341))

(assert (=> b!928505 m!863313))

(declare-fun m!863343 () Bool)

(assert (=> b!928505 m!863343))

(declare-fun m!863345 () Bool)

(assert (=> b!928491 m!863345))

(declare-fun m!863347 () Bool)

(assert (=> b!928491 m!863347))

(declare-fun m!863349 () Bool)

(assert (=> b!928491 m!863349))

(declare-fun m!863351 () Bool)

(assert (=> b!928499 m!863351))

(declare-fun m!863353 () Bool)

(assert (=> b!928502 m!863353))

(assert (=> b!928502 m!863327))

(declare-fun m!863355 () Bool)

(assert (=> b!928498 m!863355))

(declare-fun m!863357 () Bool)

(assert (=> b!928500 m!863357))

(declare-fun m!863359 () Bool)

(assert (=> b!928500 m!863359))

(declare-fun m!863361 () Bool)

(assert (=> start!79112 m!863361))

(declare-fun m!863363 () Bool)

(assert (=> start!79112 m!863363))

(declare-fun m!863365 () Bool)

(assert (=> start!79112 m!863365))

(declare-fun m!863367 () Bool)

(assert (=> b!928497 m!863367))

(declare-fun m!863369 () Bool)

(assert (=> b!928503 m!863369))

(declare-fun m!863371 () Bool)

(assert (=> b!928510 m!863371))

(declare-fun m!863373 () Bool)

(assert (=> b!928510 m!863373))

(check-sat (not b!928491) (not b!928495) (not b_lambda!13827) (not b!928502) (not b!928510) (not b_next!17325) (not b!928503) (not b!928497) (not mapNonEmpty!31506) tp_is_empty!19833 (not b!928500) (not b!928494) (not start!79112) (not b!928505) (not b!928499) b_and!28389 (not b!928498) (not b!928504))
(check-sat b_and!28389 (not b_next!17325))
