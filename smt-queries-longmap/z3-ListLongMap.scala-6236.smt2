; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79670 () Bool)

(assert start!79670)

(declare-fun b_free!17737 () Bool)

(declare-fun b_next!17737 () Bool)

(assert (=> start!79670 (= b_free!17737 (not b_next!17737))))

(declare-fun tp!61667 () Bool)

(declare-fun b_and!29039 () Bool)

(assert (=> start!79670 (= tp!61667 b_and!29039)))

(declare-fun b!937150 () Bool)

(declare-datatypes ((Unit!31548 0))(
  ( (Unit!31549) )
))
(declare-fun e!526230 () Unit!31548)

(declare-fun Unit!31550 () Unit!31548)

(assert (=> b!937150 (= e!526230 Unit!31550)))

(declare-fun mapIsEmpty!32139 () Bool)

(declare-fun mapRes!32139 () Bool)

(assert (=> mapIsEmpty!32139 mapRes!32139))

(declare-fun b!937151 () Bool)

(declare-fun e!526232 () Bool)

(declare-fun e!526237 () Bool)

(assert (=> b!937151 (= e!526232 e!526237)))

(declare-fun res!630827 () Bool)

(assert (=> b!937151 (=> (not res!630827) (not e!526237))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31959 0))(
  ( (V!31960 (val!10173 Int)) )
))
(declare-fun v!791 () V!31959)

(declare-fun lt!422729 () V!31959)

(assert (=> b!937151 (= res!630827 (and (= lt!422729 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13420 0))(
  ( (tuple2!13421 (_1!6721 (_ BitVec 64)) (_2!6721 V!31959)) )
))
(declare-datatypes ((List!19165 0))(
  ( (Nil!19162) (Cons!19161 (h!20307 tuple2!13420) (t!27437 List!19165)) )
))
(declare-datatypes ((ListLongMap!12107 0))(
  ( (ListLongMap!12108 (toList!6069 List!19165)) )
))
(declare-fun lt!422735 () ListLongMap!12107)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!844 (ListLongMap!12107 (_ BitVec 64)) V!31959)

(assert (=> b!937151 (= lt!422729 (apply!844 lt!422735 k0!1099))))

(declare-fun b!937152 () Bool)

(declare-fun lt!422733 () ListLongMap!12107)

(assert (=> b!937152 (= (apply!844 lt!422733 k0!1099) lt!422729)))

(declare-fun lt!422736 () (_ BitVec 64))

(declare-fun lt!422734 () V!31959)

(declare-fun lt!422728 () Unit!31548)

(declare-fun addApplyDifferent!429 (ListLongMap!12107 (_ BitVec 64) V!31959 (_ BitVec 64)) Unit!31548)

(assert (=> b!937152 (= lt!422728 (addApplyDifferent!429 lt!422735 lt!422736 lt!422734 k0!1099))))

(assert (=> b!937152 (not (= lt!422736 k0!1099))))

(declare-fun lt!422738 () Unit!31548)

(declare-datatypes ((array!56397 0))(
  ( (array!56398 (arr!27139 (Array (_ BitVec 32) (_ BitVec 64))) (size!27600 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56397)

(declare-datatypes ((List!19166 0))(
  ( (Nil!19163) (Cons!19162 (h!20308 (_ BitVec 64)) (t!27438 List!19166)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56397 (_ BitVec 64) (_ BitVec 32) List!19166) Unit!31548)

(assert (=> b!937152 (= lt!422738 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19163))))

(declare-fun e!526236 () Bool)

(assert (=> b!937152 e!526236))

(declare-fun c!97502 () Bool)

(assert (=> b!937152 (= c!97502 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422732 () Unit!31548)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9641 0))(
  ( (ValueCellFull!9641 (v!12697 V!31959)) (EmptyCell!9641) )
))
(declare-datatypes ((array!56399 0))(
  ( (array!56400 (arr!27140 (Array (_ BitVec 32) ValueCell!9641)) (size!27601 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56399)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31959)

(declare-fun minValue!1173 () V!31959)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!307 (array!56397 array!56399 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 64) (_ BitVec 32) Int) Unit!31548)

(assert (=> b!937152 (= lt!422732 (lemmaListMapContainsThenArrayContainsFrom!307 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56397 (_ BitVec 32) List!19166) Bool)

(assert (=> b!937152 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19163)))

(declare-fun lt!422727 () Unit!31548)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56397 (_ BitVec 32) (_ BitVec 32)) Unit!31548)

(assert (=> b!937152 (= lt!422727 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5071 (ListLongMap!12107 (_ BitVec 64)) Bool)

(assert (=> b!937152 (contains!5071 lt!422733 k0!1099)))

(declare-fun lt!422737 () tuple2!13420)

(declare-fun +!2860 (ListLongMap!12107 tuple2!13420) ListLongMap!12107)

(assert (=> b!937152 (= lt!422733 (+!2860 lt!422735 lt!422737))))

(declare-fun lt!422731 () Unit!31548)

(declare-fun addStillContains!549 (ListLongMap!12107 (_ BitVec 64) V!31959 (_ BitVec 64)) Unit!31548)

(assert (=> b!937152 (= lt!422731 (addStillContains!549 lt!422735 lt!422736 lt!422734 k0!1099))))

(declare-fun getCurrentListMap!3233 (array!56397 array!56399 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 32) Int) ListLongMap!12107)

(assert (=> b!937152 (= (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2860 (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422737))))

(assert (=> b!937152 (= lt!422737 (tuple2!13421 lt!422736 lt!422734))))

(declare-fun get!14316 (ValueCell!9641 V!31959) V!31959)

(declare-fun dynLambda!1616 (Int (_ BitVec 64)) V!31959)

(assert (=> b!937152 (= lt!422734 (get!14316 (select (arr!27140 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1616 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422739 () Unit!31548)

(declare-fun lemmaListMapRecursiveValidKeyArray!224 (array!56397 array!56399 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 32) Int) Unit!31548)

(assert (=> b!937152 (= lt!422739 (lemmaListMapRecursiveValidKeyArray!224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937152 (= e!526230 lt!422728)))

(declare-fun b!937153 () Bool)

(declare-fun res!630824 () Bool)

(declare-fun e!526231 () Bool)

(assert (=> b!937153 (=> (not res!630824) (not e!526231))))

(assert (=> b!937153 (= res!630824 (and (= (size!27601 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27600 _keys!1487) (size!27601 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937154 () Bool)

(assert (=> b!937154 (= e!526237 false)))

(declare-fun lt!422730 () Unit!31548)

(declare-fun e!526234 () Unit!31548)

(assert (=> b!937154 (= lt!422730 e!526234)))

(declare-fun c!97503 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937154 (= c!97503 (validKeyInArray!0 k0!1099))))

(declare-fun b!937149 () Bool)

(declare-fun res!630822 () Bool)

(assert (=> b!937149 (=> (not res!630822) (not e!526231))))

(assert (=> b!937149 (= res!630822 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27600 _keys!1487))))))

(declare-fun res!630826 () Bool)

(assert (=> start!79670 (=> (not res!630826) (not e!526231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79670 (= res!630826 (validMask!0 mask!1881))))

(assert (=> start!79670 e!526231))

(assert (=> start!79670 true))

(declare-fun tp_is_empty!20245 () Bool)

(assert (=> start!79670 tp_is_empty!20245))

(declare-fun e!526233 () Bool)

(declare-fun array_inv!21174 (array!56399) Bool)

(assert (=> start!79670 (and (array_inv!21174 _values!1231) e!526233)))

(assert (=> start!79670 tp!61667))

(declare-fun array_inv!21175 (array!56397) Bool)

(assert (=> start!79670 (array_inv!21175 _keys!1487)))

(declare-fun b!937155 () Bool)

(declare-fun e!526235 () Bool)

(assert (=> b!937155 (= e!526235 tp_is_empty!20245)))

(declare-fun b!937156 () Bool)

(declare-fun res!630823 () Bool)

(assert (=> b!937156 (=> (not res!630823) (not e!526231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56397 (_ BitVec 32)) Bool)

(assert (=> b!937156 (= res!630823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937157 () Bool)

(declare-fun e!526238 () Bool)

(assert (=> b!937157 (= e!526233 (and e!526238 mapRes!32139))))

(declare-fun condMapEmpty!32139 () Bool)

(declare-fun mapDefault!32139 () ValueCell!9641)

(assert (=> b!937157 (= condMapEmpty!32139 (= (arr!27140 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9641)) mapDefault!32139)))))

(declare-fun b!937158 () Bool)

(assert (=> b!937158 (= e!526236 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937159 () Bool)

(declare-fun Unit!31551 () Unit!31548)

(assert (=> b!937159 (= e!526234 Unit!31551)))

(declare-fun b!937160 () Bool)

(declare-fun arrayContainsKey!0 (array!56397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937160 (= e!526236 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!32139 () Bool)

(declare-fun tp!61668 () Bool)

(assert (=> mapNonEmpty!32139 (= mapRes!32139 (and tp!61668 e!526235))))

(declare-fun mapRest!32139 () (Array (_ BitVec 32) ValueCell!9641))

(declare-fun mapValue!32139 () ValueCell!9641)

(declare-fun mapKey!32139 () (_ BitVec 32))

(assert (=> mapNonEmpty!32139 (= (arr!27140 _values!1231) (store mapRest!32139 mapKey!32139 mapValue!32139))))

(declare-fun b!937161 () Bool)

(assert (=> b!937161 (= e!526238 tp_is_empty!20245)))

(declare-fun b!937162 () Bool)

(assert (=> b!937162 (= e!526231 e!526232)))

(declare-fun res!630821 () Bool)

(assert (=> b!937162 (=> (not res!630821) (not e!526232))))

(assert (=> b!937162 (= res!630821 (contains!5071 lt!422735 k0!1099))))

(assert (=> b!937162 (= lt!422735 (getCurrentListMap!3233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937163 () Bool)

(assert (=> b!937163 (= e!526234 e!526230)))

(assert (=> b!937163 (= lt!422736 (select (arr!27139 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97504 () Bool)

(assert (=> b!937163 (= c!97504 (validKeyInArray!0 lt!422736))))

(declare-fun b!937164 () Bool)

(declare-fun res!630825 () Bool)

(assert (=> b!937164 (=> (not res!630825) (not e!526231))))

(assert (=> b!937164 (= res!630825 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19163))))

(assert (= (and start!79670 res!630826) b!937153))

(assert (= (and b!937153 res!630824) b!937156))

(assert (= (and b!937156 res!630823) b!937164))

(assert (= (and b!937164 res!630825) b!937149))

(assert (= (and b!937149 res!630822) b!937162))

(assert (= (and b!937162 res!630821) b!937151))

(assert (= (and b!937151 res!630827) b!937154))

(assert (= (and b!937154 c!97503) b!937163))

(assert (= (and b!937154 (not c!97503)) b!937159))

(assert (= (and b!937163 c!97504) b!937152))

(assert (= (and b!937163 (not c!97504)) b!937150))

(assert (= (and b!937152 c!97502) b!937160))

(assert (= (and b!937152 (not c!97502)) b!937158))

(assert (= (and b!937157 condMapEmpty!32139) mapIsEmpty!32139))

(assert (= (and b!937157 (not condMapEmpty!32139)) mapNonEmpty!32139))

(get-info :version)

(assert (= (and mapNonEmpty!32139 ((_ is ValueCellFull!9641) mapValue!32139)) b!937155))

(assert (= (and b!937157 ((_ is ValueCellFull!9641) mapDefault!32139)) b!937161))

(assert (= start!79670 b!937157))

(declare-fun b_lambda!14125 () Bool)

(assert (=> (not b_lambda!14125) (not b!937152)))

(declare-fun t!27436 () Bool)

(declare-fun tb!6123 () Bool)

(assert (=> (and start!79670 (= defaultEntry!1235 defaultEntry!1235) t!27436) tb!6123))

(declare-fun result!12087 () Bool)

(assert (=> tb!6123 (= result!12087 tp_is_empty!20245)))

(assert (=> b!937152 t!27436))

(declare-fun b_and!29041 () Bool)

(assert (= b_and!29039 (and (=> t!27436 result!12087) b_and!29041)))

(declare-fun m!871385 () Bool)

(assert (=> b!937154 m!871385))

(declare-fun m!871387 () Bool)

(assert (=> b!937156 m!871387))

(declare-fun m!871389 () Bool)

(assert (=> b!937164 m!871389))

(declare-fun m!871391 () Bool)

(assert (=> b!937152 m!871391))

(declare-fun m!871393 () Bool)

(assert (=> b!937152 m!871393))

(declare-fun m!871395 () Bool)

(assert (=> b!937152 m!871395))

(declare-fun m!871397 () Bool)

(assert (=> b!937152 m!871397))

(declare-fun m!871399 () Bool)

(assert (=> b!937152 m!871399))

(assert (=> b!937152 m!871391))

(assert (=> b!937152 m!871397))

(declare-fun m!871401 () Bool)

(assert (=> b!937152 m!871401))

(declare-fun m!871403 () Bool)

(assert (=> b!937152 m!871403))

(declare-fun m!871405 () Bool)

(assert (=> b!937152 m!871405))

(declare-fun m!871407 () Bool)

(assert (=> b!937152 m!871407))

(declare-fun m!871409 () Bool)

(assert (=> b!937152 m!871409))

(declare-fun m!871411 () Bool)

(assert (=> b!937152 m!871411))

(declare-fun m!871413 () Bool)

(assert (=> b!937152 m!871413))

(declare-fun m!871415 () Bool)

(assert (=> b!937152 m!871415))

(assert (=> b!937152 m!871393))

(declare-fun m!871417 () Bool)

(assert (=> b!937152 m!871417))

(declare-fun m!871419 () Bool)

(assert (=> b!937152 m!871419))

(declare-fun m!871421 () Bool)

(assert (=> b!937152 m!871421))

(declare-fun m!871423 () Bool)

(assert (=> b!937160 m!871423))

(declare-fun m!871425 () Bool)

(assert (=> b!937163 m!871425))

(declare-fun m!871427 () Bool)

(assert (=> b!937163 m!871427))

(declare-fun m!871429 () Bool)

(assert (=> b!937162 m!871429))

(declare-fun m!871431 () Bool)

(assert (=> b!937162 m!871431))

(declare-fun m!871433 () Bool)

(assert (=> mapNonEmpty!32139 m!871433))

(declare-fun m!871435 () Bool)

(assert (=> start!79670 m!871435))

(declare-fun m!871437 () Bool)

(assert (=> start!79670 m!871437))

(declare-fun m!871439 () Bool)

(assert (=> start!79670 m!871439))

(declare-fun m!871441 () Bool)

(assert (=> b!937151 m!871441))

(check-sat (not b!937156) (not b_next!17737) (not b!937164) tp_is_empty!20245 (not b!937162) b_and!29041 (not b!937151) (not b!937152) (not b!937154) (not b_lambda!14125) (not start!79670) (not mapNonEmpty!32139) (not b!937163) (not b!937160))
(check-sat b_and!29041 (not b_next!17737))
