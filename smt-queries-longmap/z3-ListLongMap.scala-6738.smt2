; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84398 () Bool)

(assert start!84398)

(declare-fun b_free!19987 () Bool)

(declare-fun b_next!19987 () Bool)

(assert (=> start!84398 (= b_free!19987 (not b_next!19987))))

(declare-fun tp!69739 () Bool)

(declare-fun b_and!32011 () Bool)

(assert (=> start!84398 (= tp!69739 b_and!32011)))

(declare-fun mapNonEmpty!36836 () Bool)

(declare-fun mapRes!36836 () Bool)

(declare-fun tp!69740 () Bool)

(declare-fun e!556640 () Bool)

(assert (=> mapNonEmpty!36836 (= mapRes!36836 (and tp!69740 e!556640))))

(declare-datatypes ((V!35921 0))(
  ( (V!35922 (val!11652 Int)) )
))
(declare-datatypes ((ValueCell!11120 0))(
  ( (ValueCellFull!11120 (v!14214 V!35921)) (EmptyCell!11120) )
))
(declare-datatypes ((array!62296 0))(
  ( (array!62297 (arr!30005 (Array (_ BitVec 32) ValueCell!11120)) (size!30486 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62296)

(declare-fun mapKey!36836 () (_ BitVec 32))

(declare-fun mapRest!36836 () (Array (_ BitVec 32) ValueCell!11120))

(declare-fun mapValue!36836 () ValueCell!11120)

(assert (=> mapNonEmpty!36836 (= (arr!30005 _values!1278) (store mapRest!36836 mapKey!36836 mapValue!36836))))

(declare-fun b!987167 () Bool)

(declare-fun e!556638 () Bool)

(declare-fun tp_is_empty!23203 () Bool)

(assert (=> b!987167 (= e!556638 tp_is_empty!23203)))

(declare-fun b!987168 () Bool)

(declare-fun res!660461 () Bool)

(declare-fun e!556639 () Bool)

(assert (=> b!987168 (=> (not res!660461) (not e!556639))))

(declare-datatypes ((array!62298 0))(
  ( (array!62299 (arr!30006 (Array (_ BitVec 32) (_ BitVec 64))) (size!30487 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62298)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62298 (_ BitVec 32)) Bool)

(assert (=> b!987168 (= res!660461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660465 () Bool)

(assert (=> start!84398 (=> (not res!660465) (not e!556639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84398 (= res!660465 (validMask!0 mask!1948))))

(assert (=> start!84398 e!556639))

(assert (=> start!84398 true))

(assert (=> start!84398 tp_is_empty!23203))

(declare-fun e!556636 () Bool)

(declare-fun array_inv!23191 (array!62296) Bool)

(assert (=> start!84398 (and (array_inv!23191 _values!1278) e!556636)))

(assert (=> start!84398 tp!69739))

(declare-fun array_inv!23192 (array!62298) Bool)

(assert (=> start!84398 (array_inv!23192 _keys!1544)))

(declare-fun b!987169 () Bool)

(declare-fun res!660459 () Bool)

(assert (=> b!987169 (=> (not res!660459) (not e!556639))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987169 (= res!660459 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987170 () Bool)

(assert (=> b!987170 (= e!556636 (and e!556638 mapRes!36836))))

(declare-fun condMapEmpty!36836 () Bool)

(declare-fun mapDefault!36836 () ValueCell!11120)

(assert (=> b!987170 (= condMapEmpty!36836 (= (arr!30005 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11120)) mapDefault!36836)))))

(declare-fun b!987171 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987171 (= e!556639 (not (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30006 _keys!1544) from!1932)))))))

(declare-datatypes ((tuple2!14922 0))(
  ( (tuple2!14923 (_1!7472 (_ BitVec 64)) (_2!7472 V!35921)) )
))
(declare-datatypes ((List!20810 0))(
  ( (Nil!20807) (Cons!20806 (h!21968 tuple2!14922) (t!29716 List!20810)) )
))
(declare-datatypes ((ListLongMap!13609 0))(
  ( (ListLongMap!13610 (toList!6820 List!20810)) )
))
(declare-fun lt!437490 () ListLongMap!13609)

(declare-fun lt!437489 () tuple2!14922)

(declare-fun lt!437487 () tuple2!14922)

(declare-fun +!3096 (ListLongMap!13609 tuple2!14922) ListLongMap!13609)

(assert (=> b!987171 (= (+!3096 (+!3096 lt!437490 lt!437489) lt!437487) (+!3096 (+!3096 lt!437490 lt!437487) lt!437489))))

(declare-fun lt!437488 () V!35921)

(assert (=> b!987171 (= lt!437487 (tuple2!14923 (select (arr!30006 _keys!1544) from!1932) lt!437488))))

(declare-fun minValue!1220 () V!35921)

(assert (=> b!987171 (= lt!437489 (tuple2!14923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32644 0))(
  ( (Unit!32645) )
))
(declare-fun lt!437486 () Unit!32644)

(declare-fun addCommutativeForDiffKeys!692 (ListLongMap!13609 (_ BitVec 64) V!35921 (_ BitVec 64) V!35921) Unit!32644)

(assert (=> b!987171 (= lt!437486 (addCommutativeForDiffKeys!692 lt!437490 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30006 _keys!1544) from!1932) lt!437488))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15579 (ValueCell!11120 V!35921) V!35921)

(declare-fun dynLambda!1845 (Int (_ BitVec 64)) V!35921)

(assert (=> b!987171 (= lt!437488 (get!15579 (select (arr!30005 _values!1278) from!1932) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35921)

(declare-fun getCurrentListMapNoExtraKeys!3524 (array!62298 array!62296 (_ BitVec 32) (_ BitVec 32) V!35921 V!35921 (_ BitVec 32) Int) ListLongMap!13609)

(assert (=> b!987171 (= lt!437490 (+!3096 (getCurrentListMapNoExtraKeys!3524 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987172 () Bool)

(declare-fun res!660464 () Bool)

(assert (=> b!987172 (=> (not res!660464) (not e!556639))))

(assert (=> b!987172 (= res!660464 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30487 _keys!1544))))))

(declare-fun mapIsEmpty!36836 () Bool)

(assert (=> mapIsEmpty!36836 mapRes!36836))

(declare-fun b!987173 () Bool)

(declare-fun res!660460 () Bool)

(assert (=> b!987173 (=> (not res!660460) (not e!556639))))

(assert (=> b!987173 (= res!660460 (and (= (size!30486 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30487 _keys!1544) (size!30486 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987174 () Bool)

(assert (=> b!987174 (= e!556640 tp_is_empty!23203)))

(declare-fun b!987175 () Bool)

(declare-fun res!660462 () Bool)

(assert (=> b!987175 (=> (not res!660462) (not e!556639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987175 (= res!660462 (validKeyInArray!0 (select (arr!30006 _keys!1544) from!1932)))))

(declare-fun b!987176 () Bool)

(declare-fun res!660463 () Bool)

(assert (=> b!987176 (=> (not res!660463) (not e!556639))))

(declare-datatypes ((List!20811 0))(
  ( (Nil!20808) (Cons!20807 (h!21969 (_ BitVec 64)) (t!29717 List!20811)) )
))
(declare-fun arrayNoDuplicates!0 (array!62298 (_ BitVec 32) List!20811) Bool)

(assert (=> b!987176 (= res!660463 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20808))))

(assert (= (and start!84398 res!660465) b!987173))

(assert (= (and b!987173 res!660460) b!987168))

(assert (= (and b!987168 res!660461) b!987176))

(assert (= (and b!987176 res!660463) b!987172))

(assert (= (and b!987172 res!660464) b!987175))

(assert (= (and b!987175 res!660462) b!987169))

(assert (= (and b!987169 res!660459) b!987171))

(assert (= (and b!987170 condMapEmpty!36836) mapIsEmpty!36836))

(assert (= (and b!987170 (not condMapEmpty!36836)) mapNonEmpty!36836))

(get-info :version)

(assert (= (and mapNonEmpty!36836 ((_ is ValueCellFull!11120) mapValue!36836)) b!987174))

(assert (= (and b!987170 ((_ is ValueCellFull!11120) mapDefault!36836)) b!987167))

(assert (= start!84398 b!987170))

(declare-fun b_lambda!14991 () Bool)

(assert (=> (not b_lambda!14991) (not b!987171)))

(declare-fun t!29715 () Bool)

(declare-fun tb!6757 () Bool)

(assert (=> (and start!84398 (= defaultEntry!1281 defaultEntry!1281) t!29715) tb!6757))

(declare-fun result!13513 () Bool)

(assert (=> tb!6757 (= result!13513 tp_is_empty!23203)))

(assert (=> b!987171 t!29715))

(declare-fun b_and!32013 () Bool)

(assert (= b_and!32011 (and (=> t!29715 result!13513) b_and!32013)))

(declare-fun m!913241 () Bool)

(assert (=> mapNonEmpty!36836 m!913241))

(declare-fun m!913243 () Bool)

(assert (=> b!987168 m!913243))

(declare-fun m!913245 () Bool)

(assert (=> b!987175 m!913245))

(assert (=> b!987175 m!913245))

(declare-fun m!913247 () Bool)

(assert (=> b!987175 m!913247))

(declare-fun m!913249 () Bool)

(assert (=> start!84398 m!913249))

(declare-fun m!913251 () Bool)

(assert (=> start!84398 m!913251))

(declare-fun m!913253 () Bool)

(assert (=> start!84398 m!913253))

(declare-fun m!913255 () Bool)

(assert (=> b!987176 m!913255))

(declare-fun m!913257 () Bool)

(assert (=> b!987171 m!913257))

(declare-fun m!913259 () Bool)

(assert (=> b!987171 m!913259))

(assert (=> b!987171 m!913245))

(declare-fun m!913261 () Bool)

(assert (=> b!987171 m!913261))

(declare-fun m!913263 () Bool)

(assert (=> b!987171 m!913263))

(assert (=> b!987171 m!913257))

(declare-fun m!913265 () Bool)

(assert (=> b!987171 m!913265))

(assert (=> b!987171 m!913245))

(declare-fun m!913267 () Bool)

(assert (=> b!987171 m!913267))

(assert (=> b!987171 m!913263))

(declare-fun m!913269 () Bool)

(assert (=> b!987171 m!913269))

(assert (=> b!987171 m!913265))

(declare-fun m!913271 () Bool)

(assert (=> b!987171 m!913271))

(declare-fun m!913273 () Bool)

(assert (=> b!987171 m!913273))

(assert (=> b!987171 m!913261))

(assert (=> b!987171 m!913273))

(declare-fun m!913275 () Bool)

(assert (=> b!987171 m!913275))

(check-sat (not b!987171) (not b_lambda!14991) (not start!84398) (not b!987176) tp_is_empty!23203 (not b!987168) (not b_next!19987) (not b!987175) b_and!32013 (not mapNonEmpty!36836))
(check-sat b_and!32013 (not b_next!19987))
(get-model)

(declare-fun b_lambda!14997 () Bool)

(assert (= b_lambda!14991 (or (and start!84398 b_free!19987) b_lambda!14997)))

(check-sat (not b_lambda!14997) (not b!987171) (not start!84398) (not b!987176) tp_is_empty!23203 (not b!987168) (not b_next!19987) (not b!987175) b_and!32013 (not mapNonEmpty!36836))
(check-sat b_and!32013 (not b_next!19987))
(get-model)

(declare-fun d!116727 () Bool)

(declare-fun e!556673 () Bool)

(assert (=> d!116727 e!556673))

(declare-fun res!660513 () Bool)

(assert (=> d!116727 (=> (not res!660513) (not e!556673))))

(declare-fun lt!437532 () ListLongMap!13609)

(declare-fun contains!5682 (ListLongMap!13609 (_ BitVec 64)) Bool)

(assert (=> d!116727 (= res!660513 (contains!5682 lt!437532 (_1!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!437530 () List!20810)

(assert (=> d!116727 (= lt!437532 (ListLongMap!13610 lt!437530))))

(declare-fun lt!437531 () Unit!32644)

(declare-fun lt!437529 () Unit!32644)

(assert (=> d!116727 (= lt!437531 lt!437529)))

(declare-datatypes ((Option!520 0))(
  ( (Some!519 (v!14217 V!35921)) (None!518) )
))
(declare-fun getValueByKey!514 (List!20810 (_ BitVec 64)) Option!520)

(assert (=> d!116727 (= (getValueByKey!514 lt!437530 (_1!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!519 (_2!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lemmaContainsTupThenGetReturnValue!271 (List!20810 (_ BitVec 64) V!35921) Unit!32644)

(assert (=> d!116727 (= lt!437529 (lemmaContainsTupThenGetReturnValue!271 lt!437530 (_1!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun insertStrictlySorted!328 (List!20810 (_ BitVec 64) V!35921) List!20810)

(assert (=> d!116727 (= lt!437530 (insertStrictlySorted!328 (toList!6820 (getCurrentListMapNoExtraKeys!3524 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116727 (= (+!3096 (getCurrentListMapNoExtraKeys!3524 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!437532)))

(declare-fun b!987247 () Bool)

(declare-fun res!660512 () Bool)

(assert (=> b!987247 (=> (not res!660512) (not e!556673))))

(assert (=> b!987247 (= res!660512 (= (getValueByKey!514 (toList!6820 lt!437532) (_1!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!519 (_2!7472 (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!987248 () Bool)

(declare-fun contains!5683 (List!20810 tuple2!14922) Bool)

(assert (=> b!987248 (= e!556673 (contains!5683 (toList!6820 lt!437532) (tuple2!14923 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!116727 res!660513) b!987247))

(assert (= (and b!987247 res!660512) b!987248))

(declare-fun m!913349 () Bool)

(assert (=> d!116727 m!913349))

(declare-fun m!913351 () Bool)

(assert (=> d!116727 m!913351))

(declare-fun m!913353 () Bool)

(assert (=> d!116727 m!913353))

(declare-fun m!913355 () Bool)

(assert (=> d!116727 m!913355))

(declare-fun m!913357 () Bool)

(assert (=> b!987247 m!913357))

(declare-fun m!913359 () Bool)

(assert (=> b!987248 m!913359))

(assert (=> b!987171 d!116727))

(declare-fun d!116729 () Bool)

(declare-fun c!99978 () Bool)

(assert (=> d!116729 (= c!99978 ((_ is ValueCellFull!11120) (select (arr!30005 _values!1278) from!1932)))))

(declare-fun e!556676 () V!35921)

(assert (=> d!116729 (= (get!15579 (select (arr!30005 _values!1278) from!1932) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!556676)))

(declare-fun b!987253 () Bool)

(declare-fun get!15580 (ValueCell!11120 V!35921) V!35921)

(assert (=> b!987253 (= e!556676 (get!15580 (select (arr!30005 _values!1278) from!1932) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!987254 () Bool)

(declare-fun get!15581 (ValueCell!11120 V!35921) V!35921)

(assert (=> b!987254 (= e!556676 (get!15581 (select (arr!30005 _values!1278) from!1932) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116729 c!99978) b!987253))

(assert (= (and d!116729 (not c!99978)) b!987254))

(assert (=> b!987253 m!913261))

(assert (=> b!987253 m!913273))

(declare-fun m!913361 () Bool)

(assert (=> b!987253 m!913361))

(assert (=> b!987254 m!913261))

(assert (=> b!987254 m!913273))

(declare-fun m!913363 () Bool)

(assert (=> b!987254 m!913363))

(assert (=> b!987171 d!116729))

(declare-fun d!116731 () Bool)

(assert (=> d!116731 (= (+!3096 (+!3096 lt!437490 (tuple2!14923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14923 (select (arr!30006 _keys!1544) from!1932) lt!437488)) (+!3096 (+!3096 lt!437490 (tuple2!14923 (select (arr!30006 _keys!1544) from!1932) lt!437488)) (tuple2!14923 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!437535 () Unit!32644)

(declare-fun choose!1613 (ListLongMap!13609 (_ BitVec 64) V!35921 (_ BitVec 64) V!35921) Unit!32644)

(assert (=> d!116731 (= lt!437535 (choose!1613 lt!437490 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30006 _keys!1544) from!1932) lt!437488))))

(assert (=> d!116731 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30006 _keys!1544) from!1932)))))

(assert (=> d!116731 (= (addCommutativeForDiffKeys!692 lt!437490 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30006 _keys!1544) from!1932) lt!437488) lt!437535)))

(declare-fun bs!27988 () Bool)

(assert (= bs!27988 d!116731))

(assert (=> bs!27988 m!913245))

(declare-fun m!913365 () Bool)

(assert (=> bs!27988 m!913365))

(declare-fun m!913367 () Bool)

(assert (=> bs!27988 m!913367))

(declare-fun m!913369 () Bool)

(assert (=> bs!27988 m!913369))

(declare-fun m!913371 () Bool)

(assert (=> bs!27988 m!913371))

(assert (=> bs!27988 m!913369))

(assert (=> bs!27988 m!913367))

(declare-fun m!913373 () Bool)

(assert (=> bs!27988 m!913373))

(assert (=> b!987171 d!116731))

(declare-fun b!987279 () Bool)

(declare-fun res!660524 () Bool)

(declare-fun e!556691 () Bool)

(assert (=> b!987279 (=> (not res!660524) (not e!556691))))

(declare-fun lt!437551 () ListLongMap!13609)

(assert (=> b!987279 (= res!660524 (not (contains!5682 lt!437551 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!987280 () Bool)

(declare-fun lt!437553 () Unit!32644)

(declare-fun lt!437556 () Unit!32644)

(assert (=> b!987280 (= lt!437553 lt!437556)))

(declare-fun lt!437555 () V!35921)

(declare-fun lt!437550 () (_ BitVec 64))

(declare-fun lt!437554 () ListLongMap!13609)

(declare-fun lt!437552 () (_ BitVec 64))

(assert (=> b!987280 (not (contains!5682 (+!3096 lt!437554 (tuple2!14923 lt!437550 lt!437555)) lt!437552))))

(declare-fun addStillNotContains!232 (ListLongMap!13609 (_ BitVec 64) V!35921 (_ BitVec 64)) Unit!32644)

(assert (=> b!987280 (= lt!437556 (addStillNotContains!232 lt!437554 lt!437550 lt!437555 lt!437552))))

(assert (=> b!987280 (= lt!437552 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!987280 (= lt!437555 (get!15579 (select (arr!30005 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987280 (= lt!437550 (select (arr!30006 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun call!41779 () ListLongMap!13609)

(assert (=> b!987280 (= lt!437554 call!41779)))

(declare-fun e!556697 () ListLongMap!13609)

(assert (=> b!987280 (= e!556697 (+!3096 call!41779 (tuple2!14923 (select (arr!30006 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15579 (select (arr!30005 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!987281 () Bool)

(declare-fun e!556695 () Bool)

(assert (=> b!987281 (= e!556691 e!556695)))

(declare-fun c!99987 () Bool)

(declare-fun e!556693 () Bool)

(assert (=> b!987281 (= c!99987 e!556693)))

(declare-fun res!660525 () Bool)

(assert (=> b!987281 (=> (not res!660525) (not e!556693))))

(assert (=> b!987281 (= res!660525 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30487 _keys!1544)))))

(declare-fun e!556694 () Bool)

(declare-fun b!987282 () Bool)

(assert (=> b!987282 (= e!556694 (= lt!437551 (getCurrentListMapNoExtraKeys!3524 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!41776 () Bool)

(assert (=> bm!41776 (= call!41779 (getCurrentListMapNoExtraKeys!3524 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!987283 () Bool)

(assert (=> b!987283 (= e!556695 e!556694)))

(declare-fun c!99989 () Bool)

(assert (=> b!987283 (= c!99989 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30487 _keys!1544)))))

(declare-fun b!987284 () Bool)

(declare-fun isEmpty!724 (ListLongMap!13609) Bool)

(assert (=> b!987284 (= e!556694 (isEmpty!724 lt!437551))))

(declare-fun b!987286 () Bool)

(declare-fun e!556692 () Bool)

(assert (=> b!987286 (= e!556695 e!556692)))

(assert (=> b!987286 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30487 _keys!1544)))))

(declare-fun res!660523 () Bool)

(assert (=> b!987286 (= res!660523 (contains!5682 lt!437551 (select (arr!30006 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987286 (=> (not res!660523) (not e!556692))))

(declare-fun b!987287 () Bool)

(declare-fun e!556696 () ListLongMap!13609)

(assert (=> b!987287 (= e!556696 e!556697)))

(declare-fun c!99990 () Bool)

(assert (=> b!987287 (= c!99990 (validKeyInArray!0 (select (arr!30006 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987288 () Bool)

(assert (=> b!987288 (= e!556696 (ListLongMap!13610 Nil!20807))))

(declare-fun b!987289 () Bool)

(assert (=> b!987289 (= e!556693 (validKeyInArray!0 (select (arr!30006 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987289 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!987290 () Bool)

(assert (=> b!987290 (= e!556697 call!41779)))

(declare-fun b!987285 () Bool)

(assert (=> b!987285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30487 _keys!1544)))))

(assert (=> b!987285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30486 _values!1278)))))

(declare-fun apply!885 (ListLongMap!13609 (_ BitVec 64)) V!35921)

(assert (=> b!987285 (= e!556692 (= (apply!885 lt!437551 (select (arr!30006 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15579 (select (arr!30005 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!116733 () Bool)

(assert (=> d!116733 e!556691))

(declare-fun res!660522 () Bool)

(assert (=> d!116733 (=> (not res!660522) (not e!556691))))

(assert (=> d!116733 (= res!660522 (not (contains!5682 lt!437551 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!116733 (= lt!437551 e!556696)))

(declare-fun c!99988 () Bool)

(assert (=> d!116733 (= c!99988 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30487 _keys!1544)))))

(assert (=> d!116733 (validMask!0 mask!1948)))

(assert (=> d!116733 (= (getCurrentListMapNoExtraKeys!3524 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!437551)))

(assert (= (and d!116733 c!99988) b!987288))

(assert (= (and d!116733 (not c!99988)) b!987287))

(assert (= (and b!987287 c!99990) b!987280))

(assert (= (and b!987287 (not c!99990)) b!987290))

(assert (= (or b!987280 b!987290) bm!41776))

(assert (= (and d!116733 res!660522) b!987279))

(assert (= (and b!987279 res!660524) b!987281))

(assert (= (and b!987281 res!660525) b!987289))

(assert (= (and b!987281 c!99987) b!987286))

(assert (= (and b!987281 (not c!99987)) b!987283))

(assert (= (and b!987286 res!660523) b!987285))

(assert (= (and b!987283 c!99989) b!987282))

(assert (= (and b!987283 (not c!99989)) b!987284))

(declare-fun b_lambda!14999 () Bool)

(assert (=> (not b_lambda!14999) (not b!987280)))

(assert (=> b!987280 t!29715))

(declare-fun b_and!32023 () Bool)

(assert (= b_and!32013 (and (=> t!29715 result!13513) b_and!32023)))

(declare-fun b_lambda!15001 () Bool)

(assert (=> (not b_lambda!15001) (not b!987285)))

(assert (=> b!987285 t!29715))

(declare-fun b_and!32025 () Bool)

(assert (= b_and!32023 (and (=> t!29715 result!13513) b_and!32025)))

(declare-fun m!913375 () Bool)

(assert (=> d!116733 m!913375))

(assert (=> d!116733 m!913249))

(declare-fun m!913377 () Bool)

(assert (=> b!987282 m!913377))

(declare-fun m!913379 () Bool)

(assert (=> b!987289 m!913379))

(assert (=> b!987289 m!913379))

(declare-fun m!913381 () Bool)

(assert (=> b!987289 m!913381))

(declare-fun m!913383 () Bool)

(assert (=> b!987284 m!913383))

(assert (=> b!987285 m!913273))

(declare-fun m!913385 () Bool)

(assert (=> b!987285 m!913385))

(assert (=> b!987285 m!913273))

(declare-fun m!913387 () Bool)

(assert (=> b!987285 m!913387))

(assert (=> b!987285 m!913379))

(declare-fun m!913389 () Bool)

(assert (=> b!987285 m!913389))

(assert (=> b!987285 m!913385))

(assert (=> b!987285 m!913379))

(assert (=> b!987286 m!913379))

(assert (=> b!987286 m!913379))

(declare-fun m!913391 () Bool)

(assert (=> b!987286 m!913391))

(declare-fun m!913393 () Bool)

(assert (=> b!987279 m!913393))

(assert (=> bm!41776 m!913377))

(assert (=> b!987280 m!913273))

(declare-fun m!913395 () Bool)

(assert (=> b!987280 m!913395))

(declare-fun m!913397 () Bool)

(assert (=> b!987280 m!913397))

(declare-fun m!913399 () Bool)

(assert (=> b!987280 m!913399))

(assert (=> b!987280 m!913385))

(assert (=> b!987280 m!913273))

(assert (=> b!987280 m!913387))

(assert (=> b!987280 m!913395))

(declare-fun m!913401 () Bool)

(assert (=> b!987280 m!913401))

(assert (=> b!987280 m!913385))

(assert (=> b!987280 m!913379))

(assert (=> b!987287 m!913379))

(assert (=> b!987287 m!913379))

(assert (=> b!987287 m!913381))

(assert (=> b!987171 d!116733))

(declare-fun d!116735 () Bool)

(declare-fun e!556698 () Bool)

(assert (=> d!116735 e!556698))

(declare-fun res!660527 () Bool)

(assert (=> d!116735 (=> (not res!660527) (not e!556698))))

(declare-fun lt!437560 () ListLongMap!13609)

(assert (=> d!116735 (= res!660527 (contains!5682 lt!437560 (_1!7472 lt!437487)))))

(declare-fun lt!437558 () List!20810)

(assert (=> d!116735 (= lt!437560 (ListLongMap!13610 lt!437558))))

(declare-fun lt!437559 () Unit!32644)

(declare-fun lt!437557 () Unit!32644)

(assert (=> d!116735 (= lt!437559 lt!437557)))

(assert (=> d!116735 (= (getValueByKey!514 lt!437558 (_1!7472 lt!437487)) (Some!519 (_2!7472 lt!437487)))))

(assert (=> d!116735 (= lt!437557 (lemmaContainsTupThenGetReturnValue!271 lt!437558 (_1!7472 lt!437487) (_2!7472 lt!437487)))))

(assert (=> d!116735 (= lt!437558 (insertStrictlySorted!328 (toList!6820 lt!437490) (_1!7472 lt!437487) (_2!7472 lt!437487)))))

(assert (=> d!116735 (= (+!3096 lt!437490 lt!437487) lt!437560)))

(declare-fun b!987291 () Bool)

(declare-fun res!660526 () Bool)

(assert (=> b!987291 (=> (not res!660526) (not e!556698))))

(assert (=> b!987291 (= res!660526 (= (getValueByKey!514 (toList!6820 lt!437560) (_1!7472 lt!437487)) (Some!519 (_2!7472 lt!437487))))))

(declare-fun b!987292 () Bool)

(assert (=> b!987292 (= e!556698 (contains!5683 (toList!6820 lt!437560) lt!437487))))

(assert (= (and d!116735 res!660527) b!987291))

(assert (= (and b!987291 res!660526) b!987292))

(declare-fun m!913403 () Bool)

(assert (=> d!116735 m!913403))

(declare-fun m!913405 () Bool)

(assert (=> d!116735 m!913405))

(declare-fun m!913407 () Bool)

(assert (=> d!116735 m!913407))

(declare-fun m!913409 () Bool)

(assert (=> d!116735 m!913409))

(declare-fun m!913411 () Bool)

(assert (=> b!987291 m!913411))

(declare-fun m!913413 () Bool)

(assert (=> b!987292 m!913413))

(assert (=> b!987171 d!116735))

(declare-fun d!116737 () Bool)

(declare-fun e!556699 () Bool)

(assert (=> d!116737 e!556699))

(declare-fun res!660529 () Bool)

(assert (=> d!116737 (=> (not res!660529) (not e!556699))))

(declare-fun lt!437564 () ListLongMap!13609)

(assert (=> d!116737 (= res!660529 (contains!5682 lt!437564 (_1!7472 lt!437487)))))

(declare-fun lt!437562 () List!20810)

(assert (=> d!116737 (= lt!437564 (ListLongMap!13610 lt!437562))))

(declare-fun lt!437563 () Unit!32644)

(declare-fun lt!437561 () Unit!32644)

(assert (=> d!116737 (= lt!437563 lt!437561)))

(assert (=> d!116737 (= (getValueByKey!514 lt!437562 (_1!7472 lt!437487)) (Some!519 (_2!7472 lt!437487)))))

(assert (=> d!116737 (= lt!437561 (lemmaContainsTupThenGetReturnValue!271 lt!437562 (_1!7472 lt!437487) (_2!7472 lt!437487)))))

(assert (=> d!116737 (= lt!437562 (insertStrictlySorted!328 (toList!6820 (+!3096 lt!437490 lt!437489)) (_1!7472 lt!437487) (_2!7472 lt!437487)))))

(assert (=> d!116737 (= (+!3096 (+!3096 lt!437490 lt!437489) lt!437487) lt!437564)))

(declare-fun b!987293 () Bool)

(declare-fun res!660528 () Bool)

(assert (=> b!987293 (=> (not res!660528) (not e!556699))))

(assert (=> b!987293 (= res!660528 (= (getValueByKey!514 (toList!6820 lt!437564) (_1!7472 lt!437487)) (Some!519 (_2!7472 lt!437487))))))

(declare-fun b!987294 () Bool)

(assert (=> b!987294 (= e!556699 (contains!5683 (toList!6820 lt!437564) lt!437487))))

(assert (= (and d!116737 res!660529) b!987293))

(assert (= (and b!987293 res!660528) b!987294))

(declare-fun m!913415 () Bool)

(assert (=> d!116737 m!913415))

(declare-fun m!913417 () Bool)

(assert (=> d!116737 m!913417))

(declare-fun m!913419 () Bool)

(assert (=> d!116737 m!913419))

(declare-fun m!913421 () Bool)

(assert (=> d!116737 m!913421))

(declare-fun m!913423 () Bool)

(assert (=> b!987293 m!913423))

(declare-fun m!913425 () Bool)

(assert (=> b!987294 m!913425))

(assert (=> b!987171 d!116737))

(declare-fun d!116739 () Bool)

(declare-fun e!556700 () Bool)

(assert (=> d!116739 e!556700))

(declare-fun res!660531 () Bool)

(assert (=> d!116739 (=> (not res!660531) (not e!556700))))

(declare-fun lt!437568 () ListLongMap!13609)

(assert (=> d!116739 (= res!660531 (contains!5682 lt!437568 (_1!7472 lt!437489)))))

(declare-fun lt!437566 () List!20810)

(assert (=> d!116739 (= lt!437568 (ListLongMap!13610 lt!437566))))

(declare-fun lt!437567 () Unit!32644)

(declare-fun lt!437565 () Unit!32644)

(assert (=> d!116739 (= lt!437567 lt!437565)))

(assert (=> d!116739 (= (getValueByKey!514 lt!437566 (_1!7472 lt!437489)) (Some!519 (_2!7472 lt!437489)))))

(assert (=> d!116739 (= lt!437565 (lemmaContainsTupThenGetReturnValue!271 lt!437566 (_1!7472 lt!437489) (_2!7472 lt!437489)))))

(assert (=> d!116739 (= lt!437566 (insertStrictlySorted!328 (toList!6820 (+!3096 lt!437490 lt!437487)) (_1!7472 lt!437489) (_2!7472 lt!437489)))))

(assert (=> d!116739 (= (+!3096 (+!3096 lt!437490 lt!437487) lt!437489) lt!437568)))

(declare-fun b!987295 () Bool)

(declare-fun res!660530 () Bool)

(assert (=> b!987295 (=> (not res!660530) (not e!556700))))

(assert (=> b!987295 (= res!660530 (= (getValueByKey!514 (toList!6820 lt!437568) (_1!7472 lt!437489)) (Some!519 (_2!7472 lt!437489))))))

(declare-fun b!987296 () Bool)

(assert (=> b!987296 (= e!556700 (contains!5683 (toList!6820 lt!437568) lt!437489))))

(assert (= (and d!116739 res!660531) b!987295))

(assert (= (and b!987295 res!660530) b!987296))

(declare-fun m!913427 () Bool)

(assert (=> d!116739 m!913427))

(declare-fun m!913429 () Bool)

(assert (=> d!116739 m!913429))

(declare-fun m!913431 () Bool)

(assert (=> d!116739 m!913431))

(declare-fun m!913433 () Bool)

(assert (=> d!116739 m!913433))

(declare-fun m!913435 () Bool)

(assert (=> b!987295 m!913435))

(declare-fun m!913437 () Bool)

(assert (=> b!987296 m!913437))

(assert (=> b!987171 d!116739))

(declare-fun d!116741 () Bool)

(declare-fun e!556701 () Bool)

(assert (=> d!116741 e!556701))

(declare-fun res!660533 () Bool)

(assert (=> d!116741 (=> (not res!660533) (not e!556701))))

(declare-fun lt!437572 () ListLongMap!13609)

(assert (=> d!116741 (= res!660533 (contains!5682 lt!437572 (_1!7472 lt!437489)))))

(declare-fun lt!437570 () List!20810)

(assert (=> d!116741 (= lt!437572 (ListLongMap!13610 lt!437570))))

(declare-fun lt!437571 () Unit!32644)

(declare-fun lt!437569 () Unit!32644)

(assert (=> d!116741 (= lt!437571 lt!437569)))

(assert (=> d!116741 (= (getValueByKey!514 lt!437570 (_1!7472 lt!437489)) (Some!519 (_2!7472 lt!437489)))))

(assert (=> d!116741 (= lt!437569 (lemmaContainsTupThenGetReturnValue!271 lt!437570 (_1!7472 lt!437489) (_2!7472 lt!437489)))))

(assert (=> d!116741 (= lt!437570 (insertStrictlySorted!328 (toList!6820 lt!437490) (_1!7472 lt!437489) (_2!7472 lt!437489)))))

(assert (=> d!116741 (= (+!3096 lt!437490 lt!437489) lt!437572)))

(declare-fun b!987297 () Bool)

(declare-fun res!660532 () Bool)

(assert (=> b!987297 (=> (not res!660532) (not e!556701))))

(assert (=> b!987297 (= res!660532 (= (getValueByKey!514 (toList!6820 lt!437572) (_1!7472 lt!437489)) (Some!519 (_2!7472 lt!437489))))))

(declare-fun b!987298 () Bool)

(assert (=> b!987298 (= e!556701 (contains!5683 (toList!6820 lt!437572) lt!437489))))

(assert (= (and d!116741 res!660533) b!987297))

(assert (= (and b!987297 res!660532) b!987298))

(declare-fun m!913439 () Bool)

(assert (=> d!116741 m!913439))

(declare-fun m!913441 () Bool)

(assert (=> d!116741 m!913441))

(declare-fun m!913443 () Bool)

(assert (=> d!116741 m!913443))

(declare-fun m!913445 () Bool)

(assert (=> d!116741 m!913445))

(declare-fun m!913447 () Bool)

(assert (=> b!987297 m!913447))

(declare-fun m!913449 () Bool)

(assert (=> b!987298 m!913449))

(assert (=> b!987171 d!116741))

(declare-fun d!116743 () Bool)

(assert (=> d!116743 (= (validKeyInArray!0 (select (arr!30006 _keys!1544) from!1932)) (and (not (= (select (arr!30006 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30006 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987175 d!116743))

(declare-fun d!116745 () Bool)

(assert (=> d!116745 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84398 d!116745))

(declare-fun d!116747 () Bool)

(assert (=> d!116747 (= (array_inv!23191 _values!1278) (bvsge (size!30486 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84398 d!116747))

(declare-fun d!116749 () Bool)

(assert (=> d!116749 (= (array_inv!23192 _keys!1544) (bvsge (size!30487 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84398 d!116749))

(declare-fun b!987307 () Bool)

(declare-fun e!556709 () Bool)

(declare-fun call!41782 () Bool)

(assert (=> b!987307 (= e!556709 call!41782)))

(declare-fun b!987308 () Bool)

(declare-fun e!556710 () Bool)

(assert (=> b!987308 (= e!556710 e!556709)))

(declare-fun c!99993 () Bool)

(assert (=> b!987308 (= c!99993 (validKeyInArray!0 (select (arr!30006 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!116751 () Bool)

(declare-fun res!660538 () Bool)

(assert (=> d!116751 (=> res!660538 e!556710)))

(assert (=> d!116751 (= res!660538 (bvsge #b00000000000000000000000000000000 (size!30487 _keys!1544)))))

(assert (=> d!116751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!556710)))

(declare-fun b!987309 () Bool)

(declare-fun e!556708 () Bool)

(assert (=> b!987309 (= e!556709 e!556708)))

(declare-fun lt!437580 () (_ BitVec 64))

(assert (=> b!987309 (= lt!437580 (select (arr!30006 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!437581 () Unit!32644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62298 (_ BitVec 64) (_ BitVec 32)) Unit!32644)

(assert (=> b!987309 (= lt!437581 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!437580 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!987309 (arrayContainsKey!0 _keys!1544 lt!437580 #b00000000000000000000000000000000)))

(declare-fun lt!437579 () Unit!32644)

(assert (=> b!987309 (= lt!437579 lt!437581)))

(declare-fun res!660539 () Bool)

(declare-datatypes ((SeekEntryResult!9202 0))(
  ( (MissingZero!9202 (index!39179 (_ BitVec 32))) (Found!9202 (index!39180 (_ BitVec 32))) (Intermediate!9202 (undefined!10014 Bool) (index!39181 (_ BitVec 32)) (x!85934 (_ BitVec 32))) (Undefined!9202) (MissingVacant!9202 (index!39182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62298 (_ BitVec 32)) SeekEntryResult!9202)

(assert (=> b!987309 (= res!660539 (= (seekEntryOrOpen!0 (select (arr!30006 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9202 #b00000000000000000000000000000000)))))

(assert (=> b!987309 (=> (not res!660539) (not e!556708))))

(declare-fun b!987310 () Bool)

(assert (=> b!987310 (= e!556708 call!41782)))

(declare-fun bm!41779 () Bool)

(assert (=> bm!41779 (= call!41782 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!116751 (not res!660538)) b!987308))

(assert (= (and b!987308 c!99993) b!987309))

(assert (= (and b!987308 (not c!99993)) b!987307))

(assert (= (and b!987309 res!660539) b!987310))

(assert (= (or b!987310 b!987307) bm!41779))

(declare-fun m!913451 () Bool)

(assert (=> b!987308 m!913451))

(assert (=> b!987308 m!913451))

(declare-fun m!913453 () Bool)

(assert (=> b!987308 m!913453))

(assert (=> b!987309 m!913451))

(declare-fun m!913455 () Bool)

(assert (=> b!987309 m!913455))

(declare-fun m!913457 () Bool)

(assert (=> b!987309 m!913457))

(assert (=> b!987309 m!913451))

(declare-fun m!913459 () Bool)

(assert (=> b!987309 m!913459))

(declare-fun m!913461 () Bool)

(assert (=> bm!41779 m!913461))

(assert (=> b!987168 d!116751))

(declare-fun b!987321 () Bool)

(declare-fun e!556722 () Bool)

(declare-fun e!556721 () Bool)

(assert (=> b!987321 (= e!556722 e!556721)))

(declare-fun c!99996 () Bool)

(assert (=> b!987321 (= c!99996 (validKeyInArray!0 (select (arr!30006 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!116753 () Bool)

(declare-fun res!660548 () Bool)

(declare-fun e!556720 () Bool)

(assert (=> d!116753 (=> res!660548 e!556720)))

(assert (=> d!116753 (= res!660548 (bvsge #b00000000000000000000000000000000 (size!30487 _keys!1544)))))

(assert (=> d!116753 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20808) e!556720)))

(declare-fun b!987322 () Bool)

(declare-fun e!556719 () Bool)

(declare-fun contains!5684 (List!20811 (_ BitVec 64)) Bool)

(assert (=> b!987322 (= e!556719 (contains!5684 Nil!20808 (select (arr!30006 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41782 () Bool)

(declare-fun call!41785 () Bool)

(assert (=> bm!41782 (= call!41785 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99996 (Cons!20807 (select (arr!30006 _keys!1544) #b00000000000000000000000000000000) Nil!20808) Nil!20808)))))

(declare-fun b!987323 () Bool)

(assert (=> b!987323 (= e!556721 call!41785)))

(declare-fun b!987324 () Bool)

(assert (=> b!987324 (= e!556721 call!41785)))

(declare-fun b!987325 () Bool)

(assert (=> b!987325 (= e!556720 e!556722)))

(declare-fun res!660547 () Bool)

(assert (=> b!987325 (=> (not res!660547) (not e!556722))))

(assert (=> b!987325 (= res!660547 (not e!556719))))

(declare-fun res!660546 () Bool)

(assert (=> b!987325 (=> (not res!660546) (not e!556719))))

(assert (=> b!987325 (= res!660546 (validKeyInArray!0 (select (arr!30006 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!116753 (not res!660548)) b!987325))

(assert (= (and b!987325 res!660546) b!987322))

(assert (= (and b!987325 res!660547) b!987321))

(assert (= (and b!987321 c!99996) b!987324))

(assert (= (and b!987321 (not c!99996)) b!987323))

(assert (= (or b!987324 b!987323) bm!41782))

(assert (=> b!987321 m!913451))

(assert (=> b!987321 m!913451))

(assert (=> b!987321 m!913453))

(assert (=> b!987322 m!913451))

(assert (=> b!987322 m!913451))

(declare-fun m!913463 () Bool)

(assert (=> b!987322 m!913463))

(assert (=> bm!41782 m!913451))

(declare-fun m!913465 () Bool)

(assert (=> bm!41782 m!913465))

(assert (=> b!987325 m!913451))

(assert (=> b!987325 m!913451))

(assert (=> b!987325 m!913453))

(assert (=> b!987176 d!116753))

(declare-fun b!987332 () Bool)

(declare-fun e!556727 () Bool)

(assert (=> b!987332 (= e!556727 tp_is_empty!23203)))

(declare-fun mapNonEmpty!36845 () Bool)

(declare-fun mapRes!36845 () Bool)

(declare-fun tp!69755 () Bool)

(assert (=> mapNonEmpty!36845 (= mapRes!36845 (and tp!69755 e!556727))))

(declare-fun mapValue!36845 () ValueCell!11120)

(declare-fun mapRest!36845 () (Array (_ BitVec 32) ValueCell!11120))

(declare-fun mapKey!36845 () (_ BitVec 32))

(assert (=> mapNonEmpty!36845 (= mapRest!36836 (store mapRest!36845 mapKey!36845 mapValue!36845))))

(declare-fun condMapEmpty!36845 () Bool)

(declare-fun mapDefault!36845 () ValueCell!11120)

(assert (=> mapNonEmpty!36836 (= condMapEmpty!36845 (= mapRest!36836 ((as const (Array (_ BitVec 32) ValueCell!11120)) mapDefault!36845)))))

(declare-fun e!556728 () Bool)

(assert (=> mapNonEmpty!36836 (= tp!69740 (and e!556728 mapRes!36845))))

(declare-fun mapIsEmpty!36845 () Bool)

(assert (=> mapIsEmpty!36845 mapRes!36845))

(declare-fun b!987333 () Bool)

(assert (=> b!987333 (= e!556728 tp_is_empty!23203)))

(assert (= (and mapNonEmpty!36836 condMapEmpty!36845) mapIsEmpty!36845))

(assert (= (and mapNonEmpty!36836 (not condMapEmpty!36845)) mapNonEmpty!36845))

(assert (= (and mapNonEmpty!36845 ((_ is ValueCellFull!11120) mapValue!36845)) b!987332))

(assert (= (and mapNonEmpty!36836 ((_ is ValueCellFull!11120) mapDefault!36845)) b!987333))

(declare-fun m!913467 () Bool)

(assert (=> mapNonEmpty!36845 m!913467))

(declare-fun b_lambda!15003 () Bool)

(assert (= b_lambda!15001 (or (and start!84398 b_free!19987) b_lambda!15003)))

(declare-fun b_lambda!15005 () Bool)

(assert (= b_lambda!14999 (or (and start!84398 b_free!19987) b_lambda!15005)))

(check-sat (not b!987285) (not d!116735) (not b_lambda!14997) (not d!116739) (not b!987284) (not d!116727) (not b_next!19987) (not b!987294) (not b!987280) (not b_lambda!15003) (not b!987297) (not d!116731) (not b!987298) (not b!987296) (not b!987254) (not b!987287) (not bm!41782) (not b!987309) (not b!987282) (not b!987308) (not b!987279) (not b!987253) (not b!987291) (not b!987322) (not b!987292) (not d!116733) (not bm!41776) (not d!116741) (not bm!41779) (not b!987295) b_and!32025 (not b!987325) (not d!116737) (not b!987321) tp_is_empty!23203 (not b!987289) (not b!987286) (not b!987248) (not b!987247) (not mapNonEmpty!36845) (not b_lambda!15005) (not b!987293))
(check-sat b_and!32025 (not b_next!19987))
