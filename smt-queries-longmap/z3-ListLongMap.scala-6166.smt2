; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79272 () Bool)

(assert start!79272)

(declare-fun b_free!17317 () Bool)

(declare-fun b_next!17317 () Bool)

(assert (=> start!79272 (= b_free!17317 (not b_next!17317))))

(declare-fun tp!60393 () Bool)

(declare-fun b_and!28381 () Bool)

(assert (=> start!79272 (= tp!60393 b_and!28381)))

(declare-fun b!929146 () Bool)

(declare-fun res!625467 () Bool)

(declare-fun e!521750 () Bool)

(assert (=> b!929146 (=> (not res!625467) (not e!521750))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55663 0))(
  ( (array!55664 (arr!26772 (Array (_ BitVec 32) (_ BitVec 64))) (size!27232 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55663)

(assert (=> b!929146 (= res!625467 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27232 _keys!1487))))))

(declare-fun b!929147 () Bool)

(declare-fun e!521749 () Bool)

(declare-fun e!521752 () Bool)

(assert (=> b!929147 (= e!521749 e!521752)))

(declare-fun res!625472 () Bool)

(assert (=> b!929147 (=> (not res!625472) (not e!521752))))

(assert (=> b!929147 (= res!625472 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27232 _keys!1487)))))

(declare-datatypes ((Unit!31403 0))(
  ( (Unit!31404) )
))
(declare-fun lt!418995 () Unit!31403)

(declare-fun e!521747 () Unit!31403)

(assert (=> b!929147 (= lt!418995 e!521747)))

(declare-fun c!97268 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!929147 (= c!97268 (validKeyInArray!0 k0!1099))))

(declare-fun b!929148 () Bool)

(declare-fun res!625465 () Bool)

(assert (=> b!929148 (=> (not res!625465) (not e!521750))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55663 (_ BitVec 32)) Bool)

(assert (=> b!929148 (= res!625465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun e!521758 () Bool)

(declare-fun b!929149 () Bool)

(declare-fun arrayContainsKey!0 (array!55663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!929149 (= e!521758 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!929150 () Bool)

(declare-fun e!521756 () Bool)

(assert (=> b!929150 (= e!521756 e!521749)))

(declare-fun res!625463 () Bool)

(assert (=> b!929150 (=> (not res!625463) (not e!521749))))

(declare-datatypes ((V!31399 0))(
  ( (V!31400 (val!9963 Int)) )
))
(declare-fun v!791 () V!31399)

(declare-fun lt!419001 () V!31399)

(assert (=> b!929150 (= res!625463 (and (= lt!419001 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13002 0))(
  ( (tuple2!13003 (_1!6512 (_ BitVec 64)) (_2!6512 V!31399)) )
))
(declare-datatypes ((List!18808 0))(
  ( (Nil!18805) (Cons!18804 (h!19956 tuple2!13002) (t!26847 List!18808)) )
))
(declare-datatypes ((ListLongMap!11701 0))(
  ( (ListLongMap!11702 (toList!5866 List!18808)) )
))
(declare-fun lt!419007 () ListLongMap!11701)

(declare-fun apply!716 (ListLongMap!11701 (_ BitVec 64)) V!31399)

(assert (=> b!929150 (= lt!419001 (apply!716 lt!419007 k0!1099))))

(declare-fun b!929151 () Bool)

(declare-fun res!625473 () Bool)

(assert (=> b!929151 (=> (not res!625473) (not e!521750))))

(declare-datatypes ((List!18809 0))(
  ( (Nil!18806) (Cons!18805 (h!19957 (_ BitVec 64)) (t!26848 List!18809)) )
))
(declare-fun arrayNoDuplicates!0 (array!55663 (_ BitVec 32) List!18809) Bool)

(assert (=> b!929151 (= res!625473 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18806))))

(declare-fun b!929152 () Bool)

(declare-fun e!521753 () Bool)

(assert (=> b!929152 (= e!521753 (not (bvsle #b00000000000000000000000000000000 (size!27232 _keys!1487))))))

(declare-fun e!521757 () Bool)

(assert (=> b!929152 e!521757))

(declare-fun res!625468 () Bool)

(assert (=> b!929152 (=> (not res!625468) (not e!521757))))

(declare-fun lt!419000 () ListLongMap!11701)

(declare-fun contains!4938 (ListLongMap!11701 (_ BitVec 64)) Bool)

(assert (=> b!929152 (= res!625468 (contains!4938 lt!419000 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9431 0))(
  ( (ValueCellFull!9431 (v!12478 V!31399)) (EmptyCell!9431) )
))
(declare-datatypes ((array!55665 0))(
  ( (array!55666 (arr!26773 (Array (_ BitVec 32) ValueCell!9431)) (size!27233 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55665)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31399)

(declare-fun minValue!1173 () V!31399)

(declare-fun getCurrentListMap!3116 (array!55663 array!55665 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 32) Int) ListLongMap!11701)

(assert (=> b!929152 (= lt!419000 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!419003 () Unit!31403)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!104 (array!55663 array!55665 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 64) V!31399 (_ BitVec 32) Int) Unit!31403)

(assert (=> b!929152 (= lt!419003 (lemmaListMapApplyFromThenApplyFromZero!104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!625464 () Bool)

(assert (=> start!79272 (=> (not res!625464) (not e!521750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79272 (= res!625464 (validMask!0 mask!1881))))

(assert (=> start!79272 e!521750))

(assert (=> start!79272 true))

(declare-fun tp_is_empty!19825 () Bool)

(assert (=> start!79272 tp_is_empty!19825))

(declare-fun e!521754 () Bool)

(declare-fun array_inv!20948 (array!55665) Bool)

(assert (=> start!79272 (and (array_inv!20948 _values!1231) e!521754)))

(assert (=> start!79272 tp!60393))

(declare-fun array_inv!20949 (array!55663) Bool)

(assert (=> start!79272 (array_inv!20949 _keys!1487)))

(declare-fun b!929153 () Bool)

(declare-fun res!625469 () Bool)

(assert (=> b!929153 (=> (not res!625469) (not e!521753))))

(declare-fun lt!419002 () ListLongMap!11701)

(assert (=> b!929153 (= res!625469 (= (apply!716 lt!419002 k0!1099) v!791))))

(declare-fun b!929154 () Bool)

(assert (=> b!929154 (= e!521758 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!929155 () Bool)

(declare-fun res!625471 () Bool)

(assert (=> b!929155 (=> (not res!625471) (not e!521750))))

(assert (=> b!929155 (= res!625471 (and (= (size!27233 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27232 _keys!1487) (size!27233 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929156 () Bool)

(assert (=> b!929156 (= e!521752 e!521753)))

(declare-fun res!625466 () Bool)

(assert (=> b!929156 (=> (not res!625466) (not e!521753))))

(assert (=> b!929156 (= res!625466 (contains!4938 lt!419002 k0!1099))))

(assert (=> b!929156 (= lt!419002 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31494 () Bool)

(declare-fun mapRes!31494 () Bool)

(assert (=> mapIsEmpty!31494 mapRes!31494))

(declare-fun b!929157 () Bool)

(assert (=> b!929157 (= e!521757 (= (apply!716 lt!419000 k0!1099) v!791))))

(declare-fun b!929158 () Bool)

(assert (=> b!929158 (= e!521750 e!521756)))

(declare-fun res!625470 () Bool)

(assert (=> b!929158 (=> (not res!625470) (not e!521756))))

(assert (=> b!929158 (= res!625470 (contains!4938 lt!419007 k0!1099))))

(assert (=> b!929158 (= lt!419007 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929159 () Bool)

(declare-fun e!521755 () Unit!31403)

(assert (=> b!929159 (= e!521747 e!521755)))

(declare-fun lt!418998 () (_ BitVec 64))

(assert (=> b!929159 (= lt!418998 (select (arr!26772 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97267 () Bool)

(assert (=> b!929159 (= c!97267 (validKeyInArray!0 lt!418998))))

(declare-fun b!929160 () Bool)

(declare-fun e!521746 () Bool)

(assert (=> b!929160 (= e!521746 tp_is_empty!19825)))

(declare-fun b!929161 () Bool)

(declare-fun lt!418997 () ListLongMap!11701)

(assert (=> b!929161 (= (apply!716 lt!418997 k0!1099) lt!419001)))

(declare-fun lt!419005 () Unit!31403)

(declare-fun lt!418996 () V!31399)

(declare-fun addApplyDifferent!410 (ListLongMap!11701 (_ BitVec 64) V!31399 (_ BitVec 64)) Unit!31403)

(assert (=> b!929161 (= lt!419005 (addApplyDifferent!410 lt!419007 lt!418998 lt!418996 k0!1099))))

(assert (=> b!929161 (not (= lt!418998 k0!1099))))

(declare-fun lt!419006 () Unit!31403)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55663 (_ BitVec 64) (_ BitVec 32) List!18809) Unit!31403)

(assert (=> b!929161 (= lt!419006 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18806))))

(assert (=> b!929161 e!521758))

(declare-fun c!97269 () Bool)

(assert (=> b!929161 (= c!97269 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!419008 () Unit!31403)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!265 (array!55663 array!55665 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 64) (_ BitVec 32) Int) Unit!31403)

(assert (=> b!929161 (= lt!419008 (lemmaListMapContainsThenArrayContainsFrom!265 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!929161 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18806)))

(declare-fun lt!418999 () Unit!31403)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55663 (_ BitVec 32) (_ BitVec 32)) Unit!31403)

(assert (=> b!929161 (= lt!418999 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!929161 (contains!4938 lt!418997 k0!1099)))

(declare-fun lt!419009 () tuple2!13002)

(declare-fun +!2774 (ListLongMap!11701 tuple2!13002) ListLongMap!11701)

(assert (=> b!929161 (= lt!418997 (+!2774 lt!419007 lt!419009))))

(declare-fun lt!419004 () Unit!31403)

(declare-fun addStillContains!483 (ListLongMap!11701 (_ BitVec 64) V!31399 (_ BitVec 64)) Unit!31403)

(assert (=> b!929161 (= lt!419004 (addStillContains!483 lt!419007 lt!418998 lt!418996 k0!1099))))

(assert (=> b!929161 (= (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2774 (getCurrentListMap!3116 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419009))))

(assert (=> b!929161 (= lt!419009 (tuple2!13003 lt!418998 lt!418996))))

(declare-fun get!14115 (ValueCell!9431 V!31399) V!31399)

(declare-fun dynLambda!1571 (Int (_ BitVec 64)) V!31399)

(assert (=> b!929161 (= lt!418996 (get!14115 (select (arr!26773 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1571 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418994 () Unit!31403)

(declare-fun lemmaListMapRecursiveValidKeyArray!154 (array!55663 array!55665 (_ BitVec 32) (_ BitVec 32) V!31399 V!31399 (_ BitVec 32) Int) Unit!31403)

(assert (=> b!929161 (= lt!418994 (lemmaListMapRecursiveValidKeyArray!154 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!929161 (= e!521755 lt!419005)))

(declare-fun mapNonEmpty!31494 () Bool)

(declare-fun tp!60392 () Bool)

(declare-fun e!521751 () Bool)

(assert (=> mapNonEmpty!31494 (= mapRes!31494 (and tp!60392 e!521751))))

(declare-fun mapRest!31494 () (Array (_ BitVec 32) ValueCell!9431))

(declare-fun mapKey!31494 () (_ BitVec 32))

(declare-fun mapValue!31494 () ValueCell!9431)

(assert (=> mapNonEmpty!31494 (= (arr!26773 _values!1231) (store mapRest!31494 mapKey!31494 mapValue!31494))))

(declare-fun b!929162 () Bool)

(assert (=> b!929162 (= e!521751 tp_is_empty!19825)))

(declare-fun b!929163 () Bool)

(assert (=> b!929163 (= e!521754 (and e!521746 mapRes!31494))))

(declare-fun condMapEmpty!31494 () Bool)

(declare-fun mapDefault!31494 () ValueCell!9431)

(assert (=> b!929163 (= condMapEmpty!31494 (= (arr!26773 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9431)) mapDefault!31494)))))

(declare-fun b!929164 () Bool)

(declare-fun Unit!31405 () Unit!31403)

(assert (=> b!929164 (= e!521747 Unit!31405)))

(declare-fun b!929165 () Bool)

(declare-fun Unit!31406 () Unit!31403)

(assert (=> b!929165 (= e!521755 Unit!31406)))

(assert (= (and start!79272 res!625464) b!929155))

(assert (= (and b!929155 res!625471) b!929148))

(assert (= (and b!929148 res!625465) b!929151))

(assert (= (and b!929151 res!625473) b!929146))

(assert (= (and b!929146 res!625467) b!929158))

(assert (= (and b!929158 res!625470) b!929150))

(assert (= (and b!929150 res!625463) b!929147))

(assert (= (and b!929147 c!97268) b!929159))

(assert (= (and b!929147 (not c!97268)) b!929164))

(assert (= (and b!929159 c!97267) b!929161))

(assert (= (and b!929159 (not c!97267)) b!929165))

(assert (= (and b!929161 c!97269) b!929149))

(assert (= (and b!929161 (not c!97269)) b!929154))

(assert (= (and b!929147 res!625472) b!929156))

(assert (= (and b!929156 res!625466) b!929153))

(assert (= (and b!929153 res!625469) b!929152))

(assert (= (and b!929152 res!625468) b!929157))

(assert (= (and b!929163 condMapEmpty!31494) mapIsEmpty!31494))

(assert (= (and b!929163 (not condMapEmpty!31494)) mapNonEmpty!31494))

(get-info :version)

(assert (= (and mapNonEmpty!31494 ((_ is ValueCellFull!9431) mapValue!31494)) b!929162))

(assert (= (and b!929163 ((_ is ValueCellFull!9431) mapDefault!31494)) b!929160))

(assert (= start!79272 b!929163))

(declare-fun b_lambda!13833 () Bool)

(assert (=> (not b_lambda!13833) (not b!929161)))

(declare-fun t!26846 () Bool)

(declare-fun tb!5889 () Bool)

(assert (=> (and start!79272 (= defaultEntry!1235 defaultEntry!1235) t!26846) tb!5889))

(declare-fun result!11609 () Bool)

(assert (=> tb!5889 (= result!11609 tp_is_empty!19825)))

(assert (=> b!929161 t!26846))

(declare-fun b_and!28383 () Bool)

(assert (= b_and!28381 (and (=> t!26846 result!11609) b_and!28383)))

(declare-fun m!864319 () Bool)

(assert (=> b!929152 m!864319))

(declare-fun m!864321 () Bool)

(assert (=> b!929152 m!864321))

(declare-fun m!864323 () Bool)

(assert (=> b!929152 m!864323))

(declare-fun m!864325 () Bool)

(assert (=> b!929149 m!864325))

(declare-fun m!864327 () Bool)

(assert (=> b!929153 m!864327))

(declare-fun m!864329 () Bool)

(assert (=> b!929157 m!864329))

(declare-fun m!864331 () Bool)

(assert (=> b!929158 m!864331))

(declare-fun m!864333 () Bool)

(assert (=> b!929158 m!864333))

(declare-fun m!864335 () Bool)

(assert (=> b!929151 m!864335))

(declare-fun m!864337 () Bool)

(assert (=> mapNonEmpty!31494 m!864337))

(declare-fun m!864339 () Bool)

(assert (=> b!929159 m!864339))

(declare-fun m!864341 () Bool)

(assert (=> b!929159 m!864341))

(declare-fun m!864343 () Bool)

(assert (=> start!79272 m!864343))

(declare-fun m!864345 () Bool)

(assert (=> start!79272 m!864345))

(declare-fun m!864347 () Bool)

(assert (=> start!79272 m!864347))

(declare-fun m!864349 () Bool)

(assert (=> b!929161 m!864349))

(declare-fun m!864351 () Bool)

(assert (=> b!929161 m!864351))

(declare-fun m!864353 () Bool)

(assert (=> b!929161 m!864353))

(declare-fun m!864355 () Bool)

(assert (=> b!929161 m!864355))

(declare-fun m!864357 () Bool)

(assert (=> b!929161 m!864357))

(declare-fun m!864359 () Bool)

(assert (=> b!929161 m!864359))

(declare-fun m!864361 () Bool)

(assert (=> b!929161 m!864361))

(declare-fun m!864363 () Bool)

(assert (=> b!929161 m!864363))

(declare-fun m!864365 () Bool)

(assert (=> b!929161 m!864365))

(declare-fun m!864367 () Bool)

(assert (=> b!929161 m!864367))

(declare-fun m!864369 () Bool)

(assert (=> b!929161 m!864369))

(declare-fun m!864371 () Bool)

(assert (=> b!929161 m!864371))

(assert (=> b!929161 m!864353))

(assert (=> b!929161 m!864355))

(declare-fun m!864373 () Bool)

(assert (=> b!929161 m!864373))

(declare-fun m!864375 () Bool)

(assert (=> b!929161 m!864375))

(declare-fun m!864377 () Bool)

(assert (=> b!929161 m!864377))

(assert (=> b!929161 m!864357))

(declare-fun m!864379 () Bool)

(assert (=> b!929161 m!864379))

(declare-fun m!864381 () Bool)

(assert (=> b!929148 m!864381))

(declare-fun m!864383 () Bool)

(assert (=> b!929150 m!864383))

(declare-fun m!864385 () Bool)

(assert (=> b!929147 m!864385))

(declare-fun m!864387 () Bool)

(assert (=> b!929156 m!864387))

(assert (=> b!929156 m!864375))

(check-sat (not b!929148) (not b!929161) (not mapNonEmpty!31494) (not b!929159) (not b!929152) (not b!929151) (not b!929157) (not b!929153) (not b!929149) (not b_lambda!13833) (not b!929156) (not b!929150) (not start!79272) (not b!929147) tp_is_empty!19825 b_and!28383 (not b!929158) (not b_next!17317))
(check-sat b_and!28383 (not b_next!17317))
