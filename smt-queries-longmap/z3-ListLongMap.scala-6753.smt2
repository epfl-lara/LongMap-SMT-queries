; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84668 () Bool)

(assert start!84668)

(declare-fun b_free!20079 () Bool)

(declare-fun b_next!20079 () Bool)

(assert (=> start!84668 (= b_free!20079 (not b_next!20079))))

(declare-fun tp!70031 () Bool)

(declare-fun b_and!32229 () Bool)

(assert (=> start!84668 (= tp!70031 b_and!32229)))

(declare-fun b!990235 () Bool)

(declare-fun res!662164 () Bool)

(declare-fun e!558358 () Bool)

(assert (=> b!990235 (=> (not res!662164) (not e!558358))))

(declare-datatypes ((array!62551 0))(
  ( (array!62552 (arr!30127 (Array (_ BitVec 32) (_ BitVec 64))) (size!30606 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62551)

(declare-datatypes ((List!20845 0))(
  ( (Nil!20842) (Cons!20841 (h!22003 (_ BitVec 64)) (t!29820 List!20845)) )
))
(declare-fun arrayNoDuplicates!0 (array!62551 (_ BitVec 32) List!20845) Bool)

(assert (=> b!990235 (= res!662164 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20842))))

(declare-fun b!990236 () Bool)

(declare-fun res!662165 () Bool)

(assert (=> b!990236 (=> (not res!662165) (not e!558358))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!990236 (= res!662165 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30606 _keys!1544))))))

(declare-fun b!990237 () Bool)

(declare-fun res!662166 () Bool)

(assert (=> b!990237 (=> (not res!662166) (not e!558358))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990237 (= res!662166 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!990238 () Bool)

(declare-fun e!558360 () Bool)

(declare-fun tp_is_empty!23295 () Bool)

(assert (=> b!990238 (= e!558360 tp_is_empty!23295)))

(declare-fun mapNonEmpty!36991 () Bool)

(declare-fun mapRes!36991 () Bool)

(declare-fun tp!70032 () Bool)

(declare-fun e!558359 () Bool)

(assert (=> mapNonEmpty!36991 (= mapRes!36991 (and tp!70032 e!558359))))

(declare-datatypes ((V!36043 0))(
  ( (V!36044 (val!11698 Int)) )
))
(declare-datatypes ((ValueCell!11166 0))(
  ( (ValueCellFull!11166 (v!14268 V!36043)) (EmptyCell!11166) )
))
(declare-fun mapValue!36991 () ValueCell!11166)

(declare-datatypes ((array!62553 0))(
  ( (array!62554 (arr!30128 (Array (_ BitVec 32) ValueCell!11166)) (size!30607 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62553)

(declare-fun mapRest!36991 () (Array (_ BitVec 32) ValueCell!11166))

(declare-fun mapKey!36991 () (_ BitVec 32))

(assert (=> mapNonEmpty!36991 (= (arr!30128 _values!1278) (store mapRest!36991 mapKey!36991 mapValue!36991))))

(declare-fun b!990240 () Bool)

(declare-fun res!662169 () Bool)

(assert (=> b!990240 (=> (not res!662169) (not e!558358))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62551 (_ BitVec 32)) Bool)

(assert (=> b!990240 (= res!662169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-datatypes ((tuple2!14916 0))(
  ( (tuple2!14917 (_1!7469 (_ BitVec 64)) (_2!7469 V!36043)) )
))
(declare-fun lt!439289 () tuple2!14916)

(declare-fun minValue!1220 () V!36043)

(declare-fun zeroValue!1220 () V!36043)

(declare-fun b!990241 () Bool)

(declare-fun defaultEntry!1281 () Int)

(declare-fun e!558363 () Bool)

(declare-datatypes ((List!20846 0))(
  ( (Nil!20843) (Cons!20842 (h!22004 tuple2!14916) (t!29821 List!20846)) )
))
(declare-datatypes ((ListLongMap!13613 0))(
  ( (ListLongMap!13614 (toList!6822 List!20846)) )
))
(declare-fun getCurrentListMap!3872 (array!62551 array!62553 (_ BitVec 32) (_ BitVec 32) V!36043 V!36043 (_ BitVec 32) Int) ListLongMap!13613)

(declare-fun +!3092 (ListLongMap!13613 tuple2!14916) ListLongMap!13613)

(assert (=> b!990241 (= e!558363 (not (= (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3092 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439289))))))

(declare-fun lt!439287 () ListLongMap!13613)

(declare-fun lt!439290 () tuple2!14916)

(assert (=> b!990241 (= (+!3092 (+!3092 lt!439287 lt!439290) lt!439289) (+!3092 (+!3092 lt!439287 lt!439289) lt!439290))))

(declare-fun lt!439286 () V!36043)

(assert (=> b!990241 (= lt!439289 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))

(assert (=> b!990241 (= lt!439290 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32858 0))(
  ( (Unit!32859) )
))
(declare-fun lt!439288 () Unit!32858)

(declare-fun addCommutativeForDiffKeys!714 (ListLongMap!13613 (_ BitVec 64) V!36043 (_ BitVec 64) V!36043) Unit!32858)

(assert (=> b!990241 (= lt!439288 (addCommutativeForDiffKeys!714 lt!439287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30127 _keys!1544) from!1932) lt!439286))))

(declare-fun b!990242 () Bool)

(declare-fun res!662163 () Bool)

(assert (=> b!990242 (=> (not res!662163) (not e!558358))))

(assert (=> b!990242 (= res!662163 (and (= (size!30607 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30606 _keys!1544) (size!30607 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990243 () Bool)

(assert (=> b!990243 (= e!558359 tp_is_empty!23295)))

(declare-fun b!990244 () Bool)

(assert (=> b!990244 (= e!558358 e!558363)))

(declare-fun res!662167 () Bool)

(assert (=> b!990244 (=> (not res!662167) (not e!558363))))

(assert (=> b!990244 (= res!662167 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30127 _keys!1544) from!1932))))))

(declare-fun get!15640 (ValueCell!11166 V!36043) V!36043)

(declare-fun dynLambda!1873 (Int (_ BitVec 64)) V!36043)

(assert (=> b!990244 (= lt!439286 (get!15640 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3510 (array!62551 array!62553 (_ BitVec 32) (_ BitVec 32) V!36043 V!36043 (_ BitVec 32) Int) ListLongMap!13613)

(assert (=> b!990244 (= lt!439287 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36991 () Bool)

(assert (=> mapIsEmpty!36991 mapRes!36991))

(declare-fun b!990245 () Bool)

(declare-fun res!662162 () Bool)

(assert (=> b!990245 (=> (not res!662162) (not e!558358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990245 (= res!662162 (validKeyInArray!0 (select (arr!30127 _keys!1544) from!1932)))))

(declare-fun b!990239 () Bool)

(declare-fun e!558361 () Bool)

(assert (=> b!990239 (= e!558361 (and e!558360 mapRes!36991))))

(declare-fun condMapEmpty!36991 () Bool)

(declare-fun mapDefault!36991 () ValueCell!11166)

(assert (=> b!990239 (= condMapEmpty!36991 (= (arr!30128 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11166)) mapDefault!36991)))))

(declare-fun res!662168 () Bool)

(assert (=> start!84668 (=> (not res!662168) (not e!558358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84668 (= res!662168 (validMask!0 mask!1948))))

(assert (=> start!84668 e!558358))

(assert (=> start!84668 true))

(assert (=> start!84668 tp_is_empty!23295))

(declare-fun array_inv!23267 (array!62553) Bool)

(assert (=> start!84668 (and (array_inv!23267 _values!1278) e!558361)))

(assert (=> start!84668 tp!70031))

(declare-fun array_inv!23268 (array!62551) Bool)

(assert (=> start!84668 (array_inv!23268 _keys!1544)))

(assert (= (and start!84668 res!662168) b!990242))

(assert (= (and b!990242 res!662163) b!990240))

(assert (= (and b!990240 res!662169) b!990235))

(assert (= (and b!990235 res!662164) b!990236))

(assert (= (and b!990236 res!662165) b!990245))

(assert (= (and b!990245 res!662162) b!990237))

(assert (= (and b!990237 res!662166) b!990244))

(assert (= (and b!990244 res!662167) b!990241))

(assert (= (and b!990239 condMapEmpty!36991) mapIsEmpty!36991))

(assert (= (and b!990239 (not condMapEmpty!36991)) mapNonEmpty!36991))

(get-info :version)

(assert (= (and mapNonEmpty!36991 ((_ is ValueCellFull!11166) mapValue!36991)) b!990243))

(assert (= (and b!990239 ((_ is ValueCellFull!11166) mapDefault!36991)) b!990238))

(assert (= start!84668 b!990239))

(declare-fun b_lambda!15159 () Bool)

(assert (=> (not b_lambda!15159) (not b!990244)))

(declare-fun t!29819 () Bool)

(declare-fun tb!6825 () Bool)

(assert (=> (and start!84668 (= defaultEntry!1281 defaultEntry!1281) t!29819) tb!6825))

(declare-fun result!13651 () Bool)

(assert (=> tb!6825 (= result!13651 tp_is_empty!23295)))

(assert (=> b!990244 t!29819))

(declare-fun b_and!32231 () Bool)

(assert (= b_and!32229 (and (=> t!29819 result!13651) b_and!32231)))

(declare-fun m!917643 () Bool)

(assert (=> b!990241 m!917643))

(assert (=> b!990241 m!917643))

(declare-fun m!917645 () Bool)

(assert (=> b!990241 m!917645))

(declare-fun m!917647 () Bool)

(assert (=> b!990241 m!917647))

(declare-fun m!917649 () Bool)

(assert (=> b!990241 m!917649))

(assert (=> b!990241 m!917647))

(declare-fun m!917651 () Bool)

(assert (=> b!990241 m!917651))

(declare-fun m!917653 () Bool)

(assert (=> b!990241 m!917653))

(declare-fun m!917655 () Bool)

(assert (=> b!990241 m!917655))

(assert (=> b!990241 m!917651))

(declare-fun m!917657 () Bool)

(assert (=> b!990241 m!917657))

(declare-fun m!917659 () Bool)

(assert (=> b!990241 m!917659))

(assert (=> b!990241 m!917657))

(declare-fun m!917661 () Bool)

(assert (=> mapNonEmpty!36991 m!917661))

(assert (=> b!990245 m!917643))

(assert (=> b!990245 m!917643))

(declare-fun m!917663 () Bool)

(assert (=> b!990245 m!917663))

(declare-fun m!917665 () Bool)

(assert (=> start!84668 m!917665))

(declare-fun m!917667 () Bool)

(assert (=> start!84668 m!917667))

(declare-fun m!917669 () Bool)

(assert (=> start!84668 m!917669))

(declare-fun m!917671 () Bool)

(assert (=> b!990240 m!917671))

(declare-fun m!917673 () Bool)

(assert (=> b!990235 m!917673))

(assert (=> b!990244 m!917643))

(declare-fun m!917675 () Bool)

(assert (=> b!990244 m!917675))

(declare-fun m!917677 () Bool)

(assert (=> b!990244 m!917677))

(declare-fun m!917679 () Bool)

(assert (=> b!990244 m!917679))

(assert (=> b!990244 m!917675))

(assert (=> b!990244 m!917679))

(declare-fun m!917681 () Bool)

(assert (=> b!990244 m!917681))

(check-sat b_and!32231 (not b!990235) (not mapNonEmpty!36991) (not b!990244) (not b!990241) (not b!990245) tp_is_empty!23295 (not b!990240) (not b_next!20079) (not b_lambda!15159) (not start!84668))
(check-sat b_and!32231 (not b_next!20079))
(get-model)

(declare-fun b_lambda!15163 () Bool)

(assert (= b_lambda!15159 (or (and start!84668 b_free!20079) b_lambda!15163)))

(check-sat b_and!32231 (not b!990235) (not mapNonEmpty!36991) (not b!990244) (not b!990241) (not start!84668) tp_is_empty!23295 (not b!990240) (not b_next!20079) (not b_lambda!15163) (not b!990245))
(check-sat b_and!32231 (not b_next!20079))
(get-model)

(declare-fun d!117541 () Bool)

(declare-fun c!100399 () Bool)

(assert (=> d!117541 (= c!100399 ((_ is ValueCellFull!11166) (select (arr!30128 _values!1278) from!1932)))))

(declare-fun e!558384 () V!36043)

(assert (=> d!117541 (= (get!15640 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558384)))

(declare-fun b!990287 () Bool)

(declare-fun get!15642 (ValueCell!11166 V!36043) V!36043)

(assert (=> b!990287 (= e!558384 (get!15642 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990288 () Bool)

(declare-fun get!15643 (ValueCell!11166 V!36043) V!36043)

(assert (=> b!990288 (= e!558384 (get!15643 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117541 c!100399) b!990287))

(assert (= (and d!117541 (not c!100399)) b!990288))

(assert (=> b!990287 m!917675))

(assert (=> b!990287 m!917679))

(declare-fun m!917723 () Bool)

(assert (=> b!990287 m!917723))

(assert (=> b!990288 m!917675))

(assert (=> b!990288 m!917679))

(declare-fun m!917725 () Bool)

(assert (=> b!990288 m!917725))

(assert (=> b!990244 d!117541))

(declare-fun b!990313 () Bool)

(declare-fun e!558405 () Bool)

(assert (=> b!990313 (= e!558405 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990313 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!990314 () Bool)

(declare-fun e!558402 () ListLongMap!13613)

(assert (=> b!990314 (= e!558402 (ListLongMap!13614 Nil!20843))))

(declare-fun b!990315 () Bool)

(declare-fun e!558403 () ListLongMap!13613)

(declare-fun call!41965 () ListLongMap!13613)

(assert (=> b!990315 (= e!558403 call!41965)))

(declare-fun b!990316 () Bool)

(declare-fun res!662205 () Bool)

(declare-fun e!558400 () Bool)

(assert (=> b!990316 (=> (not res!662205) (not e!558400))))

(declare-fun lt!439321 () ListLongMap!13613)

(declare-fun contains!5723 (ListLongMap!13613 (_ BitVec 64)) Bool)

(assert (=> b!990316 (= res!662205 (not (contains!5723 lt!439321 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990317 () Bool)

(declare-fun e!558399 () Bool)

(declare-fun e!558401 () Bool)

(assert (=> b!990317 (= e!558399 e!558401)))

(assert (=> b!990317 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun res!662203 () Bool)

(assert (=> b!990317 (= res!662203 (contains!5723 lt!439321 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990317 (=> (not res!662203) (not e!558401))))

(declare-fun d!117543 () Bool)

(assert (=> d!117543 e!558400))

(declare-fun res!662204 () Bool)

(assert (=> d!117543 (=> (not res!662204) (not e!558400))))

(assert (=> d!117543 (= res!662204 (not (contains!5723 lt!439321 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117543 (= lt!439321 e!558402)))

(declare-fun c!100411 () Bool)

(assert (=> d!117543 (= c!100411 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(assert (=> d!117543 (validMask!0 mask!1948)))

(assert (=> d!117543 (= (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439321)))

(declare-fun b!990318 () Bool)

(assert (=> b!990318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(assert (=> b!990318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30607 _values!1278)))))

(declare-fun apply!897 (ListLongMap!13613 (_ BitVec 64)) V!36043)

(assert (=> b!990318 (= e!558401 (= (apply!897 lt!439321 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990319 () Bool)

(declare-fun e!558404 () Bool)

(assert (=> b!990319 (= e!558399 e!558404)))

(declare-fun c!100410 () Bool)

(assert (=> b!990319 (= c!100410 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun b!990320 () Bool)

(declare-fun isEmpty!726 (ListLongMap!13613) Bool)

(assert (=> b!990320 (= e!558404 (isEmpty!726 lt!439321))))

(declare-fun b!990321 () Bool)

(assert (=> b!990321 (= e!558400 e!558399)))

(declare-fun c!100408 () Bool)

(assert (=> b!990321 (= c!100408 e!558405)))

(declare-fun res!662202 () Bool)

(assert (=> b!990321 (=> (not res!662202) (not e!558405))))

(assert (=> b!990321 (= res!662202 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun b!990322 () Bool)

(assert (=> b!990322 (= e!558402 e!558403)))

(declare-fun c!100409 () Bool)

(assert (=> b!990322 (= c!100409 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990323 () Bool)

(declare-fun lt!439323 () Unit!32858)

(declare-fun lt!439322 () Unit!32858)

(assert (=> b!990323 (= lt!439323 lt!439322)))

(declare-fun lt!439326 () (_ BitVec 64))

(declare-fun lt!439324 () ListLongMap!13613)

(declare-fun lt!439320 () V!36043)

(declare-fun lt!439325 () (_ BitVec 64))

(assert (=> b!990323 (not (contains!5723 (+!3092 lt!439324 (tuple2!14917 lt!439325 lt!439320)) lt!439326))))

(declare-fun addStillNotContains!236 (ListLongMap!13613 (_ BitVec 64) V!36043 (_ BitVec 64)) Unit!32858)

(assert (=> b!990323 (= lt!439322 (addStillNotContains!236 lt!439324 lt!439325 lt!439320 lt!439326))))

(assert (=> b!990323 (= lt!439326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990323 (= lt!439320 (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990323 (= lt!439325 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!990323 (= lt!439324 call!41965)))

(assert (=> b!990323 (= e!558403 (+!3092 call!41965 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990324 () Bool)

(assert (=> b!990324 (= e!558404 (= lt!439321 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!41962 () Bool)

(assert (=> bm!41962 (= call!41965 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(assert (= (and d!117543 c!100411) b!990314))

(assert (= (and d!117543 (not c!100411)) b!990322))

(assert (= (and b!990322 c!100409) b!990323))

(assert (= (and b!990322 (not c!100409)) b!990315))

(assert (= (or b!990323 b!990315) bm!41962))

(assert (= (and d!117543 res!662204) b!990316))

(assert (= (and b!990316 res!662205) b!990321))

(assert (= (and b!990321 res!662202) b!990313))

(assert (= (and b!990321 c!100408) b!990317))

(assert (= (and b!990321 (not c!100408)) b!990319))

(assert (= (and b!990317 res!662203) b!990318))

(assert (= (and b!990319 c!100410) b!990324))

(assert (= (and b!990319 (not c!100410)) b!990320))

(declare-fun b_lambda!15165 () Bool)

(assert (=> (not b_lambda!15165) (not b!990318)))

(assert (=> b!990318 t!29819))

(declare-fun b_and!32237 () Bool)

(assert (= b_and!32231 (and (=> t!29819 result!13651) b_and!32237)))

(declare-fun b_lambda!15167 () Bool)

(assert (=> (not b_lambda!15167) (not b!990323)))

(assert (=> b!990323 t!29819))

(declare-fun b_and!32239 () Bool)

(assert (= b_and!32237 (and (=> t!29819 result!13651) b_and!32239)))

(declare-fun m!917727 () Bool)

(assert (=> b!990318 m!917727))

(assert (=> b!990318 m!917679))

(declare-fun m!917729 () Bool)

(assert (=> b!990318 m!917729))

(declare-fun m!917731 () Bool)

(assert (=> b!990318 m!917731))

(assert (=> b!990318 m!917679))

(assert (=> b!990318 m!917727))

(assert (=> b!990318 m!917731))

(declare-fun m!917733 () Bool)

(assert (=> b!990318 m!917733))

(assert (=> b!990317 m!917731))

(assert (=> b!990317 m!917731))

(declare-fun m!917735 () Bool)

(assert (=> b!990317 m!917735))

(assert (=> b!990323 m!917727))

(assert (=> b!990323 m!917679))

(assert (=> b!990323 m!917729))

(declare-fun m!917737 () Bool)

(assert (=> b!990323 m!917737))

(assert (=> b!990323 m!917731))

(declare-fun m!917739 () Bool)

(assert (=> b!990323 m!917739))

(declare-fun m!917741 () Bool)

(assert (=> b!990323 m!917741))

(assert (=> b!990323 m!917679))

(assert (=> b!990323 m!917737))

(declare-fun m!917743 () Bool)

(assert (=> b!990323 m!917743))

(assert (=> b!990323 m!917727))

(declare-fun m!917745 () Bool)

(assert (=> b!990320 m!917745))

(declare-fun m!917747 () Bool)

(assert (=> b!990324 m!917747))

(assert (=> bm!41962 m!917747))

(declare-fun m!917749 () Bool)

(assert (=> b!990316 m!917749))

(declare-fun m!917751 () Bool)

(assert (=> d!117543 m!917751))

(assert (=> d!117543 m!917665))

(assert (=> b!990313 m!917731))

(assert (=> b!990313 m!917731))

(declare-fun m!917753 () Bool)

(assert (=> b!990313 m!917753))

(assert (=> b!990322 m!917731))

(assert (=> b!990322 m!917731))

(assert (=> b!990322 m!917753))

(assert (=> b!990244 d!117543))

(declare-fun b!990333 () Bool)

(declare-fun e!558414 () Bool)

(declare-fun e!558413 () Bool)

(assert (=> b!990333 (= e!558414 e!558413)))

(declare-fun c!100414 () Bool)

(assert (=> b!990333 (= c!100414 (validKeyInArray!0 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41965 () Bool)

(declare-fun call!41968 () Bool)

(assert (=> bm!41965 (= call!41968 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!990334 () Bool)

(declare-fun e!558412 () Bool)

(assert (=> b!990334 (= e!558412 call!41968)))

(declare-fun b!990335 () Bool)

(assert (=> b!990335 (= e!558413 call!41968)))

(declare-fun b!990336 () Bool)

(assert (=> b!990336 (= e!558413 e!558412)))

(declare-fun lt!439335 () (_ BitVec 64))

(assert (=> b!990336 (= lt!439335 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!439333 () Unit!32858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62551 (_ BitVec 64) (_ BitVec 32)) Unit!32858)

(assert (=> b!990336 (= lt!439333 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439335 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!990336 (arrayContainsKey!0 _keys!1544 lt!439335 #b00000000000000000000000000000000)))

(declare-fun lt!439334 () Unit!32858)

(assert (=> b!990336 (= lt!439334 lt!439333)))

(declare-fun res!662210 () Bool)

(declare-datatypes ((SeekEntryResult!9212 0))(
  ( (MissingZero!9212 (index!39219 (_ BitVec 32))) (Found!9212 (index!39220 (_ BitVec 32))) (Intermediate!9212 (undefined!10024 Bool) (index!39221 (_ BitVec 32)) (x!86186 (_ BitVec 32))) (Undefined!9212) (MissingVacant!9212 (index!39222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62551 (_ BitVec 32)) SeekEntryResult!9212)

(assert (=> b!990336 (= res!662210 (= (seekEntryOrOpen!0 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9212 #b00000000000000000000000000000000)))))

(assert (=> b!990336 (=> (not res!662210) (not e!558412))))

(declare-fun d!117545 () Bool)

(declare-fun res!662211 () Bool)

(assert (=> d!117545 (=> res!662211 e!558414)))

(assert (=> d!117545 (= res!662211 (bvsge #b00000000000000000000000000000000 (size!30606 _keys!1544)))))

(assert (=> d!117545 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558414)))

(assert (= (and d!117545 (not res!662211)) b!990333))

(assert (= (and b!990333 c!100414) b!990336))

(assert (= (and b!990333 (not c!100414)) b!990335))

(assert (= (and b!990336 res!662210) b!990334))

(assert (= (or b!990334 b!990335) bm!41965))

(declare-fun m!917755 () Bool)

(assert (=> b!990333 m!917755))

(assert (=> b!990333 m!917755))

(declare-fun m!917757 () Bool)

(assert (=> b!990333 m!917757))

(declare-fun m!917759 () Bool)

(assert (=> bm!41965 m!917759))

(assert (=> b!990336 m!917755))

(declare-fun m!917761 () Bool)

(assert (=> b!990336 m!917761))

(declare-fun m!917763 () Bool)

(assert (=> b!990336 m!917763))

(assert (=> b!990336 m!917755))

(declare-fun m!917765 () Bool)

(assert (=> b!990336 m!917765))

(assert (=> b!990240 d!117545))

(declare-fun d!117547 () Bool)

(declare-fun res!662218 () Bool)

(declare-fun e!558425 () Bool)

(assert (=> d!117547 (=> res!662218 e!558425)))

(assert (=> d!117547 (= res!662218 (bvsge #b00000000000000000000000000000000 (size!30606 _keys!1544)))))

(assert (=> d!117547 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20842) e!558425)))

(declare-fun b!990347 () Bool)

(declare-fun e!558423 () Bool)

(assert (=> b!990347 (= e!558425 e!558423)))

(declare-fun res!662219 () Bool)

(assert (=> b!990347 (=> (not res!662219) (not e!558423))))

(declare-fun e!558426 () Bool)

(assert (=> b!990347 (= res!662219 (not e!558426))))

(declare-fun res!662220 () Bool)

(assert (=> b!990347 (=> (not res!662220) (not e!558426))))

(assert (=> b!990347 (= res!662220 (validKeyInArray!0 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990348 () Bool)

(declare-fun contains!5724 (List!20845 (_ BitVec 64)) Bool)

(assert (=> b!990348 (= e!558426 (contains!5724 Nil!20842 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41968 () Bool)

(declare-fun call!41971 () Bool)

(declare-fun c!100417 () Bool)

(assert (=> bm!41968 (= call!41971 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100417 (Cons!20841 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842)))))

(declare-fun b!990349 () Bool)

(declare-fun e!558424 () Bool)

(assert (=> b!990349 (= e!558424 call!41971)))

(declare-fun b!990350 () Bool)

(assert (=> b!990350 (= e!558424 call!41971)))

(declare-fun b!990351 () Bool)

(assert (=> b!990351 (= e!558423 e!558424)))

(assert (=> b!990351 (= c!100417 (validKeyInArray!0 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117547 (not res!662218)) b!990347))

(assert (= (and b!990347 res!662220) b!990348))

(assert (= (and b!990347 res!662219) b!990351))

(assert (= (and b!990351 c!100417) b!990350))

(assert (= (and b!990351 (not c!100417)) b!990349))

(assert (= (or b!990350 b!990349) bm!41968))

(assert (=> b!990347 m!917755))

(assert (=> b!990347 m!917755))

(assert (=> b!990347 m!917757))

(assert (=> b!990348 m!917755))

(assert (=> b!990348 m!917755))

(declare-fun m!917767 () Bool)

(assert (=> b!990348 m!917767))

(assert (=> bm!41968 m!917755))

(declare-fun m!917769 () Bool)

(assert (=> bm!41968 m!917769))

(assert (=> b!990351 m!917755))

(assert (=> b!990351 m!917755))

(assert (=> b!990351 m!917757))

(assert (=> b!990235 d!117547))

(declare-fun d!117549 () Bool)

(assert (=> d!117549 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84668 d!117549))

(declare-fun d!117551 () Bool)

(assert (=> d!117551 (= (array_inv!23267 _values!1278) (bvsge (size!30607 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84668 d!117551))

(declare-fun d!117553 () Bool)

(assert (=> d!117553 (= (array_inv!23268 _keys!1544) (bvsge (size!30606 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84668 d!117553))

(declare-fun d!117555 () Bool)

(assert (=> d!117555 (= (validKeyInArray!0 (select (arr!30127 _keys!1544) from!1932)) (and (not (= (select (arr!30127 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30127 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990245 d!117555))

(declare-fun d!117557 () Bool)

(declare-fun e!558429 () Bool)

(assert (=> d!117557 e!558429))

(declare-fun res!662226 () Bool)

(assert (=> d!117557 (=> (not res!662226) (not e!558429))))

(declare-fun lt!439347 () ListLongMap!13613)

(assert (=> d!117557 (= res!662226 (contains!5723 lt!439347 (_1!7469 lt!439289)))))

(declare-fun lt!439345 () List!20846)

(assert (=> d!117557 (= lt!439347 (ListLongMap!13614 lt!439345))))

(declare-fun lt!439346 () Unit!32858)

(declare-fun lt!439344 () Unit!32858)

(assert (=> d!117557 (= lt!439346 lt!439344)))

(declare-datatypes ((Option!520 0))(
  ( (Some!519 (v!14270 V!36043)) (None!518) )
))
(declare-fun getValueByKey!514 (List!20846 (_ BitVec 64)) Option!520)

(assert (=> d!117557 (= (getValueByKey!514 lt!439345 (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289)))))

(declare-fun lemmaContainsTupThenGetReturnValue!273 (List!20846 (_ BitVec 64) V!36043) Unit!32858)

(assert (=> d!117557 (= lt!439344 (lemmaContainsTupThenGetReturnValue!273 lt!439345 (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(declare-fun insertStrictlySorted!330 (List!20846 (_ BitVec 64) V!36043) List!20846)

(assert (=> d!117557 (= lt!439345 (insertStrictlySorted!330 (toList!6822 lt!439287) (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(assert (=> d!117557 (= (+!3092 lt!439287 lt!439289) lt!439347)))

(declare-fun b!990356 () Bool)

(declare-fun res!662225 () Bool)

(assert (=> b!990356 (=> (not res!662225) (not e!558429))))

(assert (=> b!990356 (= res!662225 (= (getValueByKey!514 (toList!6822 lt!439347) (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289))))))

(declare-fun b!990357 () Bool)

(declare-fun contains!5725 (List!20846 tuple2!14916) Bool)

(assert (=> b!990357 (= e!558429 (contains!5725 (toList!6822 lt!439347) lt!439289))))

(assert (= (and d!117557 res!662226) b!990356))

(assert (= (and b!990356 res!662225) b!990357))

(declare-fun m!917771 () Bool)

(assert (=> d!117557 m!917771))

(declare-fun m!917773 () Bool)

(assert (=> d!117557 m!917773))

(declare-fun m!917775 () Bool)

(assert (=> d!117557 m!917775))

(declare-fun m!917777 () Bool)

(assert (=> d!117557 m!917777))

(declare-fun m!917779 () Bool)

(assert (=> b!990356 m!917779))

(declare-fun m!917781 () Bool)

(assert (=> b!990357 m!917781))

(assert (=> b!990241 d!117557))

(declare-fun d!117559 () Bool)

(declare-fun e!558430 () Bool)

(assert (=> d!117559 e!558430))

(declare-fun res!662228 () Bool)

(assert (=> d!117559 (=> (not res!662228) (not e!558430))))

(declare-fun lt!439351 () ListLongMap!13613)

(assert (=> d!117559 (= res!662228 (contains!5723 lt!439351 (_1!7469 lt!439289)))))

(declare-fun lt!439349 () List!20846)

(assert (=> d!117559 (= lt!439351 (ListLongMap!13614 lt!439349))))

(declare-fun lt!439350 () Unit!32858)

(declare-fun lt!439348 () Unit!32858)

(assert (=> d!117559 (= lt!439350 lt!439348)))

(assert (=> d!117559 (= (getValueByKey!514 lt!439349 (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289)))))

(assert (=> d!117559 (= lt!439348 (lemmaContainsTupThenGetReturnValue!273 lt!439349 (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(assert (=> d!117559 (= lt!439349 (insertStrictlySorted!330 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(assert (=> d!117559 (= (+!3092 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439289) lt!439351)))

(declare-fun b!990358 () Bool)

(declare-fun res!662227 () Bool)

(assert (=> b!990358 (=> (not res!662227) (not e!558430))))

(assert (=> b!990358 (= res!662227 (= (getValueByKey!514 (toList!6822 lt!439351) (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289))))))

(declare-fun b!990359 () Bool)

(assert (=> b!990359 (= e!558430 (contains!5725 (toList!6822 lt!439351) lt!439289))))

(assert (= (and d!117559 res!662228) b!990358))

(assert (= (and b!990358 res!662227) b!990359))

(declare-fun m!917783 () Bool)

(assert (=> d!117559 m!917783))

(declare-fun m!917785 () Bool)

(assert (=> d!117559 m!917785))

(declare-fun m!917787 () Bool)

(assert (=> d!117559 m!917787))

(declare-fun m!917789 () Bool)

(assert (=> d!117559 m!917789))

(declare-fun m!917791 () Bool)

(assert (=> b!990358 m!917791))

(declare-fun m!917793 () Bool)

(assert (=> b!990359 m!917793))

(assert (=> b!990241 d!117559))

(declare-fun d!117561 () Bool)

(declare-fun e!558431 () Bool)

(assert (=> d!117561 e!558431))

(declare-fun res!662230 () Bool)

(assert (=> d!117561 (=> (not res!662230) (not e!558431))))

(declare-fun lt!439355 () ListLongMap!13613)

(assert (=> d!117561 (= res!662230 (contains!5723 lt!439355 (_1!7469 lt!439289)))))

(declare-fun lt!439353 () List!20846)

(assert (=> d!117561 (= lt!439355 (ListLongMap!13614 lt!439353))))

(declare-fun lt!439354 () Unit!32858)

(declare-fun lt!439352 () Unit!32858)

(assert (=> d!117561 (= lt!439354 lt!439352)))

(assert (=> d!117561 (= (getValueByKey!514 lt!439353 (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289)))))

(assert (=> d!117561 (= lt!439352 (lemmaContainsTupThenGetReturnValue!273 lt!439353 (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(assert (=> d!117561 (= lt!439353 (insertStrictlySorted!330 (toList!6822 (+!3092 lt!439287 lt!439290)) (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(assert (=> d!117561 (= (+!3092 (+!3092 lt!439287 lt!439290) lt!439289) lt!439355)))

(declare-fun b!990360 () Bool)

(declare-fun res!662229 () Bool)

(assert (=> b!990360 (=> (not res!662229) (not e!558431))))

(assert (=> b!990360 (= res!662229 (= (getValueByKey!514 (toList!6822 lt!439355) (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289))))))

(declare-fun b!990361 () Bool)

(assert (=> b!990361 (= e!558431 (contains!5725 (toList!6822 lt!439355) lt!439289))))

(assert (= (and d!117561 res!662230) b!990360))

(assert (= (and b!990360 res!662229) b!990361))

(declare-fun m!917795 () Bool)

(assert (=> d!117561 m!917795))

(declare-fun m!917797 () Bool)

(assert (=> d!117561 m!917797))

(declare-fun m!917799 () Bool)

(assert (=> d!117561 m!917799))

(declare-fun m!917801 () Bool)

(assert (=> d!117561 m!917801))

(declare-fun m!917803 () Bool)

(assert (=> b!990360 m!917803))

(declare-fun m!917805 () Bool)

(assert (=> b!990361 m!917805))

(assert (=> b!990241 d!117561))

(declare-fun d!117563 () Bool)

(assert (=> d!117563 (= (+!3092 (+!3092 lt!439287 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (+!3092 (+!3092 lt!439287 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!439358 () Unit!32858)

(declare-fun choose!1615 (ListLongMap!13613 (_ BitVec 64) V!36043 (_ BitVec 64) V!36043) Unit!32858)

(assert (=> d!117563 (= lt!439358 (choose!1615 lt!439287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30127 _keys!1544) from!1932) lt!439286))))

(assert (=> d!117563 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30127 _keys!1544) from!1932)))))

(assert (=> d!117563 (= (addCommutativeForDiffKeys!714 lt!439287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30127 _keys!1544) from!1932) lt!439286) lt!439358)))

(declare-fun bs!28119 () Bool)

(assert (= bs!28119 d!117563))

(assert (=> bs!28119 m!917643))

(declare-fun m!917807 () Bool)

(assert (=> bs!28119 m!917807))

(declare-fun m!917809 () Bool)

(assert (=> bs!28119 m!917809))

(assert (=> bs!28119 m!917809))

(declare-fun m!917811 () Bool)

(assert (=> bs!28119 m!917811))

(declare-fun m!917813 () Bool)

(assert (=> bs!28119 m!917813))

(declare-fun m!917815 () Bool)

(assert (=> bs!28119 m!917815))

(assert (=> bs!28119 m!917813))

(assert (=> b!990241 d!117563))

(declare-fun b!990404 () Bool)

(declare-fun res!662257 () Bool)

(declare-fun e!558465 () Bool)

(assert (=> b!990404 (=> (not res!662257) (not e!558465))))

(declare-fun e!558464 () Bool)

(assert (=> b!990404 (= res!662257 e!558464)))

(declare-fun c!100430 () Bool)

(assert (=> b!990404 (= c!100430 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41983 () Bool)

(declare-fun call!41989 () ListLongMap!13613)

(declare-fun call!41991 () ListLongMap!13613)

(assert (=> bm!41983 (= call!41989 call!41991)))

(declare-fun b!990405 () Bool)

(declare-fun c!100431 () Bool)

(assert (=> b!990405 (= c!100431 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!558460 () ListLongMap!13613)

(declare-fun e!558467 () ListLongMap!13613)

(assert (=> b!990405 (= e!558460 e!558467)))

(declare-fun b!990406 () Bool)

(declare-fun res!662251 () Bool)

(assert (=> b!990406 (=> (not res!662251) (not e!558465))))

(declare-fun e!558459 () Bool)

(assert (=> b!990406 (= res!662251 e!558459)))

(declare-fun res!662254 () Bool)

(assert (=> b!990406 (=> res!662254 e!558459)))

(declare-fun e!558468 () Bool)

(assert (=> b!990406 (= res!662254 (not e!558468))))

(declare-fun res!662255 () Bool)

(assert (=> b!990406 (=> (not res!662255) (not e!558468))))

(assert (=> b!990406 (= res!662255 (bvslt from!1932 (size!30606 _keys!1544)))))

(declare-fun b!990407 () Bool)

(assert (=> b!990407 (= e!558467 call!41989)))

(declare-fun bm!41984 () Bool)

(declare-fun call!41988 () ListLongMap!13613)

(declare-fun call!41987 () ListLongMap!13613)

(assert (=> bm!41984 (= call!41988 call!41987)))

(declare-fun b!990408 () Bool)

(declare-fun call!41992 () ListLongMap!13613)

(assert (=> b!990408 (= e!558467 call!41992)))

(declare-fun bm!41985 () Bool)

(declare-fun call!41990 () Bool)

(declare-fun lt!439414 () ListLongMap!13613)

(assert (=> bm!41985 (= call!41990 (contains!5723 lt!439414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!100432 () Bool)

(declare-fun c!100433 () Bool)

(declare-fun bm!41986 () Bool)

(assert (=> bm!41986 (= call!41991 (+!3092 (ite c!100433 call!41987 (ite c!100432 call!41988 call!41992)) (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun b!990409 () Bool)

(declare-fun e!558461 () Bool)

(assert (=> b!990409 (= e!558461 (= (apply!897 lt!439414 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun d!117565 () Bool)

(assert (=> d!117565 e!558465))

(declare-fun res!662250 () Bool)

(assert (=> d!117565 (=> (not res!662250) (not e!558465))))

(assert (=> d!117565 (= res!662250 (or (bvsge from!1932 (size!30606 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30606 _keys!1544)))))))

(declare-fun lt!439410 () ListLongMap!13613)

(assert (=> d!117565 (= lt!439414 lt!439410)))

(declare-fun lt!439420 () Unit!32858)

(declare-fun e!558462 () Unit!32858)

(assert (=> d!117565 (= lt!439420 e!558462)))

(declare-fun c!100434 () Bool)

(declare-fun e!558466 () Bool)

(assert (=> d!117565 (= c!100434 e!558466)))

(declare-fun res!662252 () Bool)

(assert (=> d!117565 (=> (not res!662252) (not e!558466))))

(assert (=> d!117565 (= res!662252 (bvslt from!1932 (size!30606 _keys!1544)))))

(declare-fun e!558463 () ListLongMap!13613)

(assert (=> d!117565 (= lt!439410 e!558463)))

(assert (=> d!117565 (= c!100433 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117565 (validMask!0 mask!1948)))

(assert (=> d!117565 (= (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439414)))

(declare-fun b!990410 () Bool)

(declare-fun e!558470 () Bool)

(declare-fun call!41986 () Bool)

(assert (=> b!990410 (= e!558470 (not call!41986))))

(declare-fun b!990411 () Bool)

(assert (=> b!990411 (= e!558470 e!558461)))

(declare-fun res!662253 () Bool)

(assert (=> b!990411 (= res!662253 call!41986)))

(assert (=> b!990411 (=> (not res!662253) (not e!558461))))

(declare-fun b!990412 () Bool)

(assert (=> b!990412 (= e!558463 (+!3092 call!41991 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41987 () Bool)

(assert (=> bm!41987 (= call!41987 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun bm!41988 () Bool)

(assert (=> bm!41988 (= call!41986 (contains!5723 lt!439414 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990413 () Bool)

(assert (=> b!990413 (= e!558465 e!558470)))

(declare-fun c!100435 () Bool)

(assert (=> b!990413 (= c!100435 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!558469 () Bool)

(declare-fun b!990414 () Bool)

(assert (=> b!990414 (= e!558469 (= (apply!897 lt!439414 (select (arr!30127 _keys!1544) from!1932)) (get!15640 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990414 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30607 _values!1278)))))

(assert (=> b!990414 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30606 _keys!1544)))))

(declare-fun b!990415 () Bool)

(declare-fun e!558458 () Bool)

(assert (=> b!990415 (= e!558458 (= (apply!897 lt!439414 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!990416 () Bool)

(assert (=> b!990416 (= e!558464 e!558458)))

(declare-fun res!662249 () Bool)

(assert (=> b!990416 (= res!662249 call!41990)))

(assert (=> b!990416 (=> (not res!662249) (not e!558458))))

(declare-fun b!990417 () Bool)

(assert (=> b!990417 (= e!558463 e!558460)))

(assert (=> b!990417 (= c!100432 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990418 () Bool)

(declare-fun Unit!32862 () Unit!32858)

(assert (=> b!990418 (= e!558462 Unit!32862)))

(declare-fun bm!41989 () Bool)

(assert (=> bm!41989 (= call!41992 call!41988)))

(declare-fun b!990419 () Bool)

(assert (=> b!990419 (= e!558466 (validKeyInArray!0 (select (arr!30127 _keys!1544) from!1932)))))

(declare-fun b!990420 () Bool)

(assert (=> b!990420 (= e!558459 e!558469)))

(declare-fun res!662256 () Bool)

(assert (=> b!990420 (=> (not res!662256) (not e!558469))))

(assert (=> b!990420 (= res!662256 (contains!5723 lt!439414 (select (arr!30127 _keys!1544) from!1932)))))

(assert (=> b!990420 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30606 _keys!1544)))))

(declare-fun b!990421 () Bool)

(assert (=> b!990421 (= e!558468 (validKeyInArray!0 (select (arr!30127 _keys!1544) from!1932)))))

(declare-fun b!990422 () Bool)

(assert (=> b!990422 (= e!558460 call!41989)))

(declare-fun b!990423 () Bool)

(assert (=> b!990423 (= e!558464 (not call!41990))))

(declare-fun b!990424 () Bool)

(declare-fun lt!439408 () Unit!32858)

(assert (=> b!990424 (= e!558462 lt!439408)))

(declare-fun lt!439406 () ListLongMap!13613)

(assert (=> b!990424 (= lt!439406 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439405 () (_ BitVec 64))

(assert (=> b!990424 (= lt!439405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439424 () (_ BitVec 64))

(assert (=> b!990424 (= lt!439424 (select (arr!30127 _keys!1544) from!1932))))

(declare-fun lt!439416 () Unit!32858)

(declare-fun addStillContains!616 (ListLongMap!13613 (_ BitVec 64) V!36043 (_ BitVec 64)) Unit!32858)

(assert (=> b!990424 (= lt!439416 (addStillContains!616 lt!439406 lt!439405 zeroValue!1220 lt!439424))))

(assert (=> b!990424 (contains!5723 (+!3092 lt!439406 (tuple2!14917 lt!439405 zeroValue!1220)) lt!439424)))

(declare-fun lt!439407 () Unit!32858)

(assert (=> b!990424 (= lt!439407 lt!439416)))

(declare-fun lt!439412 () ListLongMap!13613)

(assert (=> b!990424 (= lt!439412 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439419 () (_ BitVec 64))

(assert (=> b!990424 (= lt!439419 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439411 () (_ BitVec 64))

(assert (=> b!990424 (= lt!439411 (select (arr!30127 _keys!1544) from!1932))))

(declare-fun lt!439421 () Unit!32858)

(declare-fun addApplyDifferent!476 (ListLongMap!13613 (_ BitVec 64) V!36043 (_ BitVec 64)) Unit!32858)

(assert (=> b!990424 (= lt!439421 (addApplyDifferent!476 lt!439412 lt!439419 minValue!1220 lt!439411))))

(assert (=> b!990424 (= (apply!897 (+!3092 lt!439412 (tuple2!14917 lt!439419 minValue!1220)) lt!439411) (apply!897 lt!439412 lt!439411))))

(declare-fun lt!439403 () Unit!32858)

(assert (=> b!990424 (= lt!439403 lt!439421)))

(declare-fun lt!439413 () ListLongMap!13613)

(assert (=> b!990424 (= lt!439413 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439418 () (_ BitVec 64))

(assert (=> b!990424 (= lt!439418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439409 () (_ BitVec 64))

(assert (=> b!990424 (= lt!439409 (select (arr!30127 _keys!1544) from!1932))))

(declare-fun lt!439404 () Unit!32858)

(assert (=> b!990424 (= lt!439404 (addApplyDifferent!476 lt!439413 lt!439418 zeroValue!1220 lt!439409))))

(assert (=> b!990424 (= (apply!897 (+!3092 lt!439413 (tuple2!14917 lt!439418 zeroValue!1220)) lt!439409) (apply!897 lt!439413 lt!439409))))

(declare-fun lt!439417 () Unit!32858)

(assert (=> b!990424 (= lt!439417 lt!439404)))

(declare-fun lt!439422 () ListLongMap!13613)

(assert (=> b!990424 (= lt!439422 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439423 () (_ BitVec 64))

(assert (=> b!990424 (= lt!439423 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439415 () (_ BitVec 64))

(assert (=> b!990424 (= lt!439415 (select (arr!30127 _keys!1544) from!1932))))

(assert (=> b!990424 (= lt!439408 (addApplyDifferent!476 lt!439422 lt!439423 minValue!1220 lt!439415))))

(assert (=> b!990424 (= (apply!897 (+!3092 lt!439422 (tuple2!14917 lt!439423 minValue!1220)) lt!439415) (apply!897 lt!439422 lt!439415))))

(assert (= (and d!117565 c!100433) b!990412))

(assert (= (and d!117565 (not c!100433)) b!990417))

(assert (= (and b!990417 c!100432) b!990422))

(assert (= (and b!990417 (not c!100432)) b!990405))

(assert (= (and b!990405 c!100431) b!990407))

(assert (= (and b!990405 (not c!100431)) b!990408))

(assert (= (or b!990407 b!990408) bm!41989))

(assert (= (or b!990422 bm!41989) bm!41984))

(assert (= (or b!990422 b!990407) bm!41983))

(assert (= (or b!990412 bm!41984) bm!41987))

(assert (= (or b!990412 bm!41983) bm!41986))

(assert (= (and d!117565 res!662252) b!990419))

(assert (= (and d!117565 c!100434) b!990424))

(assert (= (and d!117565 (not c!100434)) b!990418))

(assert (= (and d!117565 res!662250) b!990406))

(assert (= (and b!990406 res!662255) b!990421))

(assert (= (and b!990406 (not res!662254)) b!990420))

(assert (= (and b!990420 res!662256) b!990414))

(assert (= (and b!990406 res!662251) b!990404))

(assert (= (and b!990404 c!100430) b!990416))

(assert (= (and b!990404 (not c!100430)) b!990423))

(assert (= (and b!990416 res!662249) b!990415))

(assert (= (or b!990416 b!990423) bm!41985))

(assert (= (and b!990404 res!662257) b!990413))

(assert (= (and b!990413 c!100435) b!990411))

(assert (= (and b!990413 (not c!100435)) b!990410))

(assert (= (and b!990411 res!662253) b!990409))

(assert (= (or b!990411 b!990410) bm!41988))

(declare-fun b_lambda!15169 () Bool)

(assert (=> (not b_lambda!15169) (not b!990414)))

(assert (=> b!990414 t!29819))

(declare-fun b_and!32241 () Bool)

(assert (= b_and!32239 (and (=> t!29819 result!13651) b_and!32241)))

(declare-fun m!917817 () Bool)

(assert (=> b!990409 m!917817))

(assert (=> d!117565 m!917665))

(declare-fun m!917819 () Bool)

(assert (=> b!990412 m!917819))

(assert (=> b!990414 m!917675))

(assert (=> b!990414 m!917679))

(assert (=> b!990414 m!917681))

(assert (=> b!990414 m!917679))

(assert (=> b!990414 m!917675))

(assert (=> b!990414 m!917643))

(declare-fun m!917821 () Bool)

(assert (=> b!990414 m!917821))

(assert (=> b!990414 m!917643))

(assert (=> b!990421 m!917643))

(assert (=> b!990421 m!917643))

(assert (=> b!990421 m!917663))

(declare-fun m!917823 () Bool)

(assert (=> bm!41985 m!917823))

(declare-fun m!917825 () Bool)

(assert (=> bm!41987 m!917825))

(assert (=> b!990420 m!917643))

(assert (=> b!990420 m!917643))

(declare-fun m!917827 () Bool)

(assert (=> b!990420 m!917827))

(declare-fun m!917829 () Bool)

(assert (=> b!990424 m!917829))

(declare-fun m!917831 () Bool)

(assert (=> b!990424 m!917831))

(declare-fun m!917833 () Bool)

(assert (=> b!990424 m!917833))

(declare-fun m!917835 () Bool)

(assert (=> b!990424 m!917835))

(declare-fun m!917837 () Bool)

(assert (=> b!990424 m!917837))

(declare-fun m!917839 () Bool)

(assert (=> b!990424 m!917839))

(declare-fun m!917841 () Bool)

(assert (=> b!990424 m!917841))

(assert (=> b!990424 m!917829))

(declare-fun m!917843 () Bool)

(assert (=> b!990424 m!917843))

(declare-fun m!917845 () Bool)

(assert (=> b!990424 m!917845))

(declare-fun m!917847 () Bool)

(assert (=> b!990424 m!917847))

(assert (=> b!990424 m!917643))

(declare-fun m!917849 () Bool)

(assert (=> b!990424 m!917849))

(declare-fun m!917851 () Bool)

(assert (=> b!990424 m!917851))

(assert (=> b!990424 m!917845))

(declare-fun m!917853 () Bool)

(assert (=> b!990424 m!917853))

(assert (=> b!990424 m!917849))

(assert (=> b!990424 m!917825))

(declare-fun m!917855 () Bool)

(assert (=> b!990424 m!917855))

(assert (=> b!990424 m!917833))

(declare-fun m!917857 () Bool)

(assert (=> b!990424 m!917857))

(declare-fun m!917859 () Bool)

(assert (=> bm!41986 m!917859))

(declare-fun m!917861 () Bool)

(assert (=> bm!41988 m!917861))

(declare-fun m!917863 () Bool)

(assert (=> b!990415 m!917863))

(assert (=> b!990419 m!917643))

(assert (=> b!990419 m!917643))

(assert (=> b!990419 m!917663))

(assert (=> b!990241 d!117565))

(declare-fun b!990425 () Bool)

(declare-fun res!662266 () Bool)

(declare-fun e!558478 () Bool)

(assert (=> b!990425 (=> (not res!662266) (not e!558478))))

(declare-fun e!558477 () Bool)

(assert (=> b!990425 (= res!662266 e!558477)))

(declare-fun c!100436 () Bool)

(assert (=> b!990425 (= c!100436 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41990 () Bool)

(declare-fun call!41996 () ListLongMap!13613)

(declare-fun call!41998 () ListLongMap!13613)

(assert (=> bm!41990 (= call!41996 call!41998)))

(declare-fun b!990426 () Bool)

(declare-fun c!100437 () Bool)

(assert (=> b!990426 (= c!100437 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!558473 () ListLongMap!13613)

(declare-fun e!558480 () ListLongMap!13613)

(assert (=> b!990426 (= e!558473 e!558480)))

(declare-fun b!990427 () Bool)

(declare-fun res!662260 () Bool)

(assert (=> b!990427 (=> (not res!662260) (not e!558478))))

(declare-fun e!558472 () Bool)

(assert (=> b!990427 (= res!662260 e!558472)))

(declare-fun res!662263 () Bool)

(assert (=> b!990427 (=> res!662263 e!558472)))

(declare-fun e!558481 () Bool)

(assert (=> b!990427 (= res!662263 (not e!558481))))

(declare-fun res!662264 () Bool)

(assert (=> b!990427 (=> (not res!662264) (not e!558481))))

(assert (=> b!990427 (= res!662264 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun b!990428 () Bool)

(assert (=> b!990428 (= e!558480 call!41996)))

(declare-fun bm!41991 () Bool)

(declare-fun call!41995 () ListLongMap!13613)

(declare-fun call!41994 () ListLongMap!13613)

(assert (=> bm!41991 (= call!41995 call!41994)))

(declare-fun b!990429 () Bool)

(declare-fun call!41999 () ListLongMap!13613)

(assert (=> b!990429 (= e!558480 call!41999)))

(declare-fun bm!41992 () Bool)

(declare-fun call!41997 () Bool)

(declare-fun lt!439436 () ListLongMap!13613)

(assert (=> bm!41992 (= call!41997 (contains!5723 lt!439436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!100438 () Bool)

(declare-fun c!100439 () Bool)

(declare-fun bm!41993 () Bool)

(assert (=> bm!41993 (= call!41998 (+!3092 (ite c!100439 call!41994 (ite c!100438 call!41995 call!41999)) (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun b!990430 () Bool)

(declare-fun e!558474 () Bool)

(assert (=> b!990430 (= e!558474 (= (apply!897 lt!439436 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun d!117567 () Bool)

(assert (=> d!117567 e!558478))

(declare-fun res!662259 () Bool)

(assert (=> d!117567 (=> (not res!662259) (not e!558478))))

(assert (=> d!117567 (= res!662259 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))))

(declare-fun lt!439432 () ListLongMap!13613)

(assert (=> d!117567 (= lt!439436 lt!439432)))

(declare-fun lt!439442 () Unit!32858)

(declare-fun e!558475 () Unit!32858)

(assert (=> d!117567 (= lt!439442 e!558475)))

(declare-fun c!100440 () Bool)

(declare-fun e!558479 () Bool)

(assert (=> d!117567 (= c!100440 e!558479)))

(declare-fun res!662261 () Bool)

(assert (=> d!117567 (=> (not res!662261) (not e!558479))))

(assert (=> d!117567 (= res!662261 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun e!558476 () ListLongMap!13613)

(assert (=> d!117567 (= lt!439432 e!558476)))

(assert (=> d!117567 (= c!100439 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117567 (validMask!0 mask!1948)))

(assert (=> d!117567 (= (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439436)))

(declare-fun b!990431 () Bool)

(declare-fun e!558483 () Bool)

(declare-fun call!41993 () Bool)

(assert (=> b!990431 (= e!558483 (not call!41993))))

(declare-fun b!990432 () Bool)

(assert (=> b!990432 (= e!558483 e!558474)))

(declare-fun res!662262 () Bool)

(assert (=> b!990432 (= res!662262 call!41993)))

(assert (=> b!990432 (=> (not res!662262) (not e!558474))))

(declare-fun b!990433 () Bool)

(assert (=> b!990433 (= e!558476 (+!3092 call!41998 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41994 () Bool)

(assert (=> bm!41994 (= call!41994 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun bm!41995 () Bool)

(assert (=> bm!41995 (= call!41993 (contains!5723 lt!439436 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990434 () Bool)

(assert (=> b!990434 (= e!558478 e!558483)))

(declare-fun c!100441 () Bool)

(assert (=> b!990434 (= c!100441 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!558482 () Bool)

(declare-fun b!990435 () Bool)

(assert (=> b!990435 (= e!558482 (= (apply!897 lt!439436 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990435 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30607 _values!1278)))))

(assert (=> b!990435 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun b!990436 () Bool)

(declare-fun e!558471 () Bool)

(assert (=> b!990436 (= e!558471 (= (apply!897 lt!439436 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!990437 () Bool)

(assert (=> b!990437 (= e!558477 e!558471)))

(declare-fun res!662258 () Bool)

(assert (=> b!990437 (= res!662258 call!41997)))

(assert (=> b!990437 (=> (not res!662258) (not e!558471))))

(declare-fun b!990438 () Bool)

(assert (=> b!990438 (= e!558476 e!558473)))

(assert (=> b!990438 (= c!100438 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990439 () Bool)

(declare-fun Unit!32863 () Unit!32858)

(assert (=> b!990439 (= e!558475 Unit!32863)))

(declare-fun bm!41996 () Bool)

(assert (=> bm!41996 (= call!41999 call!41995)))

(declare-fun b!990440 () Bool)

(assert (=> b!990440 (= e!558479 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990441 () Bool)

(assert (=> b!990441 (= e!558472 e!558482)))

(declare-fun res!662265 () Bool)

(assert (=> b!990441 (=> (not res!662265) (not e!558482))))

(assert (=> b!990441 (= res!662265 (contains!5723 lt!439436 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990441 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun b!990442 () Bool)

(assert (=> b!990442 (= e!558481 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990443 () Bool)

(assert (=> b!990443 (= e!558473 call!41996)))

(declare-fun b!990444 () Bool)

(assert (=> b!990444 (= e!558477 (not call!41997))))

(declare-fun b!990445 () Bool)

(declare-fun lt!439430 () Unit!32858)

(assert (=> b!990445 (= e!558475 lt!439430)))

(declare-fun lt!439428 () ListLongMap!13613)

(assert (=> b!990445 (= lt!439428 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439427 () (_ BitVec 64))

(assert (=> b!990445 (= lt!439427 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439446 () (_ BitVec 64))

(assert (=> b!990445 (= lt!439446 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439438 () Unit!32858)

(assert (=> b!990445 (= lt!439438 (addStillContains!616 lt!439428 lt!439427 zeroValue!1220 lt!439446))))

(assert (=> b!990445 (contains!5723 (+!3092 lt!439428 (tuple2!14917 lt!439427 zeroValue!1220)) lt!439446)))

(declare-fun lt!439429 () Unit!32858)

(assert (=> b!990445 (= lt!439429 lt!439438)))

(declare-fun lt!439434 () ListLongMap!13613)

(assert (=> b!990445 (= lt!439434 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439441 () (_ BitVec 64))

(assert (=> b!990445 (= lt!439441 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439433 () (_ BitVec 64))

(assert (=> b!990445 (= lt!439433 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439443 () Unit!32858)

(assert (=> b!990445 (= lt!439443 (addApplyDifferent!476 lt!439434 lt!439441 minValue!1220 lt!439433))))

(assert (=> b!990445 (= (apply!897 (+!3092 lt!439434 (tuple2!14917 lt!439441 minValue!1220)) lt!439433) (apply!897 lt!439434 lt!439433))))

(declare-fun lt!439425 () Unit!32858)

(assert (=> b!990445 (= lt!439425 lt!439443)))

(declare-fun lt!439435 () ListLongMap!13613)

(assert (=> b!990445 (= lt!439435 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439440 () (_ BitVec 64))

(assert (=> b!990445 (= lt!439440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439431 () (_ BitVec 64))

(assert (=> b!990445 (= lt!439431 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439426 () Unit!32858)

(assert (=> b!990445 (= lt!439426 (addApplyDifferent!476 lt!439435 lt!439440 zeroValue!1220 lt!439431))))

(assert (=> b!990445 (= (apply!897 (+!3092 lt!439435 (tuple2!14917 lt!439440 zeroValue!1220)) lt!439431) (apply!897 lt!439435 lt!439431))))

(declare-fun lt!439439 () Unit!32858)

(assert (=> b!990445 (= lt!439439 lt!439426)))

(declare-fun lt!439444 () ListLongMap!13613)

(assert (=> b!990445 (= lt!439444 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439445 () (_ BitVec 64))

(assert (=> b!990445 (= lt!439445 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439437 () (_ BitVec 64))

(assert (=> b!990445 (= lt!439437 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!990445 (= lt!439430 (addApplyDifferent!476 lt!439444 lt!439445 minValue!1220 lt!439437))))

(assert (=> b!990445 (= (apply!897 (+!3092 lt!439444 (tuple2!14917 lt!439445 minValue!1220)) lt!439437) (apply!897 lt!439444 lt!439437))))

(assert (= (and d!117567 c!100439) b!990433))

(assert (= (and d!117567 (not c!100439)) b!990438))

(assert (= (and b!990438 c!100438) b!990443))

(assert (= (and b!990438 (not c!100438)) b!990426))

(assert (= (and b!990426 c!100437) b!990428))

(assert (= (and b!990426 (not c!100437)) b!990429))

(assert (= (or b!990428 b!990429) bm!41996))

(assert (= (or b!990443 bm!41996) bm!41991))

(assert (= (or b!990443 b!990428) bm!41990))

(assert (= (or b!990433 bm!41991) bm!41994))

(assert (= (or b!990433 bm!41990) bm!41993))

(assert (= (and d!117567 res!662261) b!990440))

(assert (= (and d!117567 c!100440) b!990445))

(assert (= (and d!117567 (not c!100440)) b!990439))

(assert (= (and d!117567 res!662259) b!990427))

(assert (= (and b!990427 res!662264) b!990442))

(assert (= (and b!990427 (not res!662263)) b!990441))

(assert (= (and b!990441 res!662265) b!990435))

(assert (= (and b!990427 res!662260) b!990425))

(assert (= (and b!990425 c!100436) b!990437))

(assert (= (and b!990425 (not c!100436)) b!990444))

(assert (= (and b!990437 res!662258) b!990436))

(assert (= (or b!990437 b!990444) bm!41992))

(assert (= (and b!990425 res!662266) b!990434))

(assert (= (and b!990434 c!100441) b!990432))

(assert (= (and b!990434 (not c!100441)) b!990431))

(assert (= (and b!990432 res!662262) b!990430))

(assert (= (or b!990432 b!990431) bm!41995))

(declare-fun b_lambda!15171 () Bool)

(assert (=> (not b_lambda!15171) (not b!990435)))

(assert (=> b!990435 t!29819))

(declare-fun b_and!32243 () Bool)

(assert (= b_and!32241 (and (=> t!29819 result!13651) b_and!32243)))

(declare-fun m!917865 () Bool)

(assert (=> b!990430 m!917865))

(assert (=> d!117567 m!917665))

(declare-fun m!917867 () Bool)

(assert (=> b!990433 m!917867))

(assert (=> b!990435 m!917727))

(assert (=> b!990435 m!917679))

(assert (=> b!990435 m!917729))

(assert (=> b!990435 m!917679))

(assert (=> b!990435 m!917727))

(assert (=> b!990435 m!917731))

(declare-fun m!917869 () Bool)

(assert (=> b!990435 m!917869))

(assert (=> b!990435 m!917731))

(assert (=> b!990442 m!917731))

(assert (=> b!990442 m!917731))

(assert (=> b!990442 m!917753))

(declare-fun m!917871 () Bool)

(assert (=> bm!41992 m!917871))

(assert (=> bm!41994 m!917677))

(assert (=> b!990441 m!917731))

(assert (=> b!990441 m!917731))

(declare-fun m!917873 () Bool)

(assert (=> b!990441 m!917873))

(declare-fun m!917875 () Bool)

(assert (=> b!990445 m!917875))

(declare-fun m!917877 () Bool)

(assert (=> b!990445 m!917877))

(declare-fun m!917879 () Bool)

(assert (=> b!990445 m!917879))

(declare-fun m!917881 () Bool)

(assert (=> b!990445 m!917881))

(declare-fun m!917883 () Bool)

(assert (=> b!990445 m!917883))

(declare-fun m!917885 () Bool)

(assert (=> b!990445 m!917885))

(declare-fun m!917887 () Bool)

(assert (=> b!990445 m!917887))

(assert (=> b!990445 m!917875))

(declare-fun m!917889 () Bool)

(assert (=> b!990445 m!917889))

(declare-fun m!917891 () Bool)

(assert (=> b!990445 m!917891))

(declare-fun m!917893 () Bool)

(assert (=> b!990445 m!917893))

(assert (=> b!990445 m!917731))

(declare-fun m!917895 () Bool)

(assert (=> b!990445 m!917895))

(declare-fun m!917897 () Bool)

(assert (=> b!990445 m!917897))

(assert (=> b!990445 m!917891))

(declare-fun m!917899 () Bool)

(assert (=> b!990445 m!917899))

(assert (=> b!990445 m!917895))

(assert (=> b!990445 m!917677))

(declare-fun m!917901 () Bool)

(assert (=> b!990445 m!917901))

(assert (=> b!990445 m!917879))

(declare-fun m!917903 () Bool)

(assert (=> b!990445 m!917903))

(declare-fun m!917905 () Bool)

(assert (=> bm!41993 m!917905))

(declare-fun m!917907 () Bool)

(assert (=> bm!41995 m!917907))

(declare-fun m!917909 () Bool)

(assert (=> b!990436 m!917909))

(assert (=> b!990440 m!917731))

(assert (=> b!990440 m!917731))

(assert (=> b!990440 m!917753))

(assert (=> b!990241 d!117567))

(declare-fun d!117569 () Bool)

(declare-fun e!558484 () Bool)

(assert (=> d!117569 e!558484))

(declare-fun res!662268 () Bool)

(assert (=> d!117569 (=> (not res!662268) (not e!558484))))

(declare-fun lt!439450 () ListLongMap!13613)

(assert (=> d!117569 (= res!662268 (contains!5723 lt!439450 (_1!7469 lt!439290)))))

(declare-fun lt!439448 () List!20846)

(assert (=> d!117569 (= lt!439450 (ListLongMap!13614 lt!439448))))

(declare-fun lt!439449 () Unit!32858)

(declare-fun lt!439447 () Unit!32858)

(assert (=> d!117569 (= lt!439449 lt!439447)))

(assert (=> d!117569 (= (getValueByKey!514 lt!439448 (_1!7469 lt!439290)) (Some!519 (_2!7469 lt!439290)))))

(assert (=> d!117569 (= lt!439447 (lemmaContainsTupThenGetReturnValue!273 lt!439448 (_1!7469 lt!439290) (_2!7469 lt!439290)))))

(assert (=> d!117569 (= lt!439448 (insertStrictlySorted!330 (toList!6822 (+!3092 lt!439287 lt!439289)) (_1!7469 lt!439290) (_2!7469 lt!439290)))))

(assert (=> d!117569 (= (+!3092 (+!3092 lt!439287 lt!439289) lt!439290) lt!439450)))

(declare-fun b!990446 () Bool)

(declare-fun res!662267 () Bool)

(assert (=> b!990446 (=> (not res!662267) (not e!558484))))

(assert (=> b!990446 (= res!662267 (= (getValueByKey!514 (toList!6822 lt!439450) (_1!7469 lt!439290)) (Some!519 (_2!7469 lt!439290))))))

(declare-fun b!990447 () Bool)

(assert (=> b!990447 (= e!558484 (contains!5725 (toList!6822 lt!439450) lt!439290))))

(assert (= (and d!117569 res!662268) b!990446))

(assert (= (and b!990446 res!662267) b!990447))

(declare-fun m!917911 () Bool)

(assert (=> d!117569 m!917911))

(declare-fun m!917913 () Bool)

(assert (=> d!117569 m!917913))

(declare-fun m!917915 () Bool)

(assert (=> d!117569 m!917915))

(declare-fun m!917917 () Bool)

(assert (=> d!117569 m!917917))

(declare-fun m!917919 () Bool)

(assert (=> b!990446 m!917919))

(declare-fun m!917921 () Bool)

(assert (=> b!990447 m!917921))

(assert (=> b!990241 d!117569))

(declare-fun d!117571 () Bool)

(declare-fun e!558485 () Bool)

(assert (=> d!117571 e!558485))

(declare-fun res!662270 () Bool)

(assert (=> d!117571 (=> (not res!662270) (not e!558485))))

(declare-fun lt!439454 () ListLongMap!13613)

(assert (=> d!117571 (= res!662270 (contains!5723 lt!439454 (_1!7469 lt!439290)))))

(declare-fun lt!439452 () List!20846)

(assert (=> d!117571 (= lt!439454 (ListLongMap!13614 lt!439452))))

(declare-fun lt!439453 () Unit!32858)

(declare-fun lt!439451 () Unit!32858)

(assert (=> d!117571 (= lt!439453 lt!439451)))

(assert (=> d!117571 (= (getValueByKey!514 lt!439452 (_1!7469 lt!439290)) (Some!519 (_2!7469 lt!439290)))))

(assert (=> d!117571 (= lt!439451 (lemmaContainsTupThenGetReturnValue!273 lt!439452 (_1!7469 lt!439290) (_2!7469 lt!439290)))))

(assert (=> d!117571 (= lt!439452 (insertStrictlySorted!330 (toList!6822 lt!439287) (_1!7469 lt!439290) (_2!7469 lt!439290)))))

(assert (=> d!117571 (= (+!3092 lt!439287 lt!439290) lt!439454)))

(declare-fun b!990448 () Bool)

(declare-fun res!662269 () Bool)

(assert (=> b!990448 (=> (not res!662269) (not e!558485))))

(assert (=> b!990448 (= res!662269 (= (getValueByKey!514 (toList!6822 lt!439454) (_1!7469 lt!439290)) (Some!519 (_2!7469 lt!439290))))))

(declare-fun b!990449 () Bool)

(assert (=> b!990449 (= e!558485 (contains!5725 (toList!6822 lt!439454) lt!439290))))

(assert (= (and d!117571 res!662270) b!990448))

(assert (= (and b!990448 res!662269) b!990449))

(declare-fun m!917923 () Bool)

(assert (=> d!117571 m!917923))

(declare-fun m!917925 () Bool)

(assert (=> d!117571 m!917925))

(declare-fun m!917927 () Bool)

(assert (=> d!117571 m!917927))

(declare-fun m!917929 () Bool)

(assert (=> d!117571 m!917929))

(declare-fun m!917931 () Bool)

(assert (=> b!990448 m!917931))

(declare-fun m!917933 () Bool)

(assert (=> b!990449 m!917933))

(assert (=> b!990241 d!117571))

(declare-fun b!990456 () Bool)

(declare-fun e!558491 () Bool)

(assert (=> b!990456 (= e!558491 tp_is_empty!23295)))

(declare-fun b!990457 () Bool)

(declare-fun e!558490 () Bool)

(assert (=> b!990457 (= e!558490 tp_is_empty!23295)))

(declare-fun mapNonEmpty!36997 () Bool)

(declare-fun mapRes!36997 () Bool)

(declare-fun tp!70041 () Bool)

(assert (=> mapNonEmpty!36997 (= mapRes!36997 (and tp!70041 e!558491))))

(declare-fun mapKey!36997 () (_ BitVec 32))

(declare-fun mapValue!36997 () ValueCell!11166)

(declare-fun mapRest!36997 () (Array (_ BitVec 32) ValueCell!11166))

(assert (=> mapNonEmpty!36997 (= mapRest!36991 (store mapRest!36997 mapKey!36997 mapValue!36997))))

(declare-fun condMapEmpty!36997 () Bool)

(declare-fun mapDefault!36997 () ValueCell!11166)

(assert (=> mapNonEmpty!36991 (= condMapEmpty!36997 (= mapRest!36991 ((as const (Array (_ BitVec 32) ValueCell!11166)) mapDefault!36997)))))

(assert (=> mapNonEmpty!36991 (= tp!70032 (and e!558490 mapRes!36997))))

(declare-fun mapIsEmpty!36997 () Bool)

(assert (=> mapIsEmpty!36997 mapRes!36997))

(assert (= (and mapNonEmpty!36991 condMapEmpty!36997) mapIsEmpty!36997))

(assert (= (and mapNonEmpty!36991 (not condMapEmpty!36997)) mapNonEmpty!36997))

(assert (= (and mapNonEmpty!36997 ((_ is ValueCellFull!11166) mapValue!36997)) b!990456))

(assert (= (and mapNonEmpty!36991 ((_ is ValueCellFull!11166) mapDefault!36997)) b!990457))

(declare-fun m!917935 () Bool)

(assert (=> mapNonEmpty!36997 m!917935))

(declare-fun b_lambda!15173 () Bool)

(assert (= b_lambda!15169 (or (and start!84668 b_free!20079) b_lambda!15173)))

(declare-fun b_lambda!15175 () Bool)

(assert (= b_lambda!15171 (or (and start!84668 b_free!20079) b_lambda!15175)))

(declare-fun b_lambda!15177 () Bool)

(assert (= b_lambda!15165 (or (and start!84668 b_free!20079) b_lambda!15177)))

(declare-fun b_lambda!15179 () Bool)

(assert (= b_lambda!15167 (or (and start!84668 b_free!20079) b_lambda!15179)))

(check-sat (not bm!41993) (not d!117557) (not b!990287) (not b!990420) (not b!990361) (not b_lambda!15177) (not bm!41994) (not bm!41988) (not b!990318) tp_is_empty!23295 (not bm!41965) (not b!990448) (not b!990322) (not b!990357) (not b!990323) (not b!990419) (not b!990288) (not bm!41992) (not b!990421) (not b!990409) (not b!990433) (not b_lambda!15175) (not b!990348) (not b!990333) (not b!990324) (not d!117565) (not b_next!20079) (not b!990442) (not d!117563) (not b!990320) (not b!990415) (not bm!41987) (not b!990351) (not b!990356) (not b!990358) (not b!990435) (not bm!41962) (not b_lambda!15179) (not b!990359) (not bm!41968) (not b!990316) (not d!117561) (not b!990436) (not b!990445) (not b_lambda!15163) (not b!990317) (not b!990446) (not b!990414) b_and!32243 (not b!990424) (not bm!41995) (not b!990347) (not bm!41986) (not b!990360) (not b!990449) (not b!990313) (not b!990336) (not bm!41985) (not b_lambda!15173) (not d!117543) (not d!117567) (not d!117571) (not d!117569) (not mapNonEmpty!36997) (not b!990430) (not d!117559) (not b!990441) (not b!990440) (not b!990447) (not b!990412))
(check-sat b_and!32243 (not b_next!20079))
(get-model)

(declare-fun b!990467 () Bool)

(declare-fun e!558496 () Option!520)

(declare-fun e!558497 () Option!520)

(assert (=> b!990467 (= e!558496 e!558497)))

(declare-fun c!100447 () Bool)

(assert (=> b!990467 (= c!100447 (and ((_ is Cons!20842) (toList!6822 lt!439450)) (not (= (_1!7469 (h!22004 (toList!6822 lt!439450))) (_1!7469 lt!439290)))))))

(declare-fun d!117573 () Bool)

(declare-fun c!100446 () Bool)

(assert (=> d!117573 (= c!100446 (and ((_ is Cons!20842) (toList!6822 lt!439450)) (= (_1!7469 (h!22004 (toList!6822 lt!439450))) (_1!7469 lt!439290))))))

(assert (=> d!117573 (= (getValueByKey!514 (toList!6822 lt!439450) (_1!7469 lt!439290)) e!558496)))

(declare-fun b!990466 () Bool)

(assert (=> b!990466 (= e!558496 (Some!519 (_2!7469 (h!22004 (toList!6822 lt!439450)))))))

(declare-fun b!990468 () Bool)

(assert (=> b!990468 (= e!558497 (getValueByKey!514 (t!29821 (toList!6822 lt!439450)) (_1!7469 lt!439290)))))

(declare-fun b!990469 () Bool)

(assert (=> b!990469 (= e!558497 None!518)))

(assert (= (and d!117573 c!100446) b!990466))

(assert (= (and d!117573 (not c!100446)) b!990467))

(assert (= (and b!990467 c!100447) b!990468))

(assert (= (and b!990467 (not c!100447)) b!990469))

(declare-fun m!917937 () Bool)

(assert (=> b!990468 m!917937))

(assert (=> b!990446 d!117573))

(declare-fun d!117575 () Bool)

(declare-fun e!558502 () Bool)

(assert (=> d!117575 e!558502))

(declare-fun res!662273 () Bool)

(assert (=> d!117575 (=> res!662273 e!558502)))

(declare-fun lt!439466 () Bool)

(assert (=> d!117575 (= res!662273 (not lt!439466))))

(declare-fun lt!439465 () Bool)

(assert (=> d!117575 (= lt!439466 lt!439465)))

(declare-fun lt!439464 () Unit!32858)

(declare-fun e!558503 () Unit!32858)

(assert (=> d!117575 (= lt!439464 e!558503)))

(declare-fun c!100450 () Bool)

(assert (=> d!117575 (= c!100450 lt!439465)))

(declare-fun containsKey!479 (List!20846 (_ BitVec 64)) Bool)

(assert (=> d!117575 (= lt!439465 (containsKey!479 (toList!6822 lt!439321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117575 (= (contains!5723 lt!439321 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439466)))

(declare-fun b!990476 () Bool)

(declare-fun lt!439463 () Unit!32858)

(assert (=> b!990476 (= e!558503 lt!439463)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!375 (List!20846 (_ BitVec 64)) Unit!32858)

(assert (=> b!990476 (= lt!439463 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!384 (Option!520) Bool)

(assert (=> b!990476 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990477 () Bool)

(declare-fun Unit!32864 () Unit!32858)

(assert (=> b!990477 (= e!558503 Unit!32864)))

(declare-fun b!990478 () Bool)

(assert (=> b!990478 (= e!558502 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439321) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117575 c!100450) b!990476))

(assert (= (and d!117575 (not c!100450)) b!990477))

(assert (= (and d!117575 (not res!662273)) b!990478))

(declare-fun m!917939 () Bool)

(assert (=> d!117575 m!917939))

(declare-fun m!917941 () Bool)

(assert (=> b!990476 m!917941))

(declare-fun m!917943 () Bool)

(assert (=> b!990476 m!917943))

(assert (=> b!990476 m!917943))

(declare-fun m!917945 () Bool)

(assert (=> b!990476 m!917945))

(assert (=> b!990478 m!917943))

(assert (=> b!990478 m!917943))

(assert (=> b!990478 m!917945))

(assert (=> d!117543 d!117575))

(assert (=> d!117543 d!117549))

(declare-fun d!117577 () Bool)

(assert (=> d!117577 (= (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990313 d!117577))

(declare-fun d!117579 () Bool)

(declare-fun e!558504 () Bool)

(assert (=> d!117579 e!558504))

(declare-fun res!662274 () Bool)

(assert (=> d!117579 (=> res!662274 e!558504)))

(declare-fun lt!439470 () Bool)

(assert (=> d!117579 (= res!662274 (not lt!439470))))

(declare-fun lt!439469 () Bool)

(assert (=> d!117579 (= lt!439470 lt!439469)))

(declare-fun lt!439468 () Unit!32858)

(declare-fun e!558505 () Unit!32858)

(assert (=> d!117579 (= lt!439468 e!558505)))

(declare-fun c!100451 () Bool)

(assert (=> d!117579 (= c!100451 lt!439469)))

(assert (=> d!117579 (= lt!439469 (containsKey!479 (toList!6822 lt!439351) (_1!7469 lt!439289)))))

(assert (=> d!117579 (= (contains!5723 lt!439351 (_1!7469 lt!439289)) lt!439470)))

(declare-fun b!990479 () Bool)

(declare-fun lt!439467 () Unit!32858)

(assert (=> b!990479 (= e!558505 lt!439467)))

(assert (=> b!990479 (= lt!439467 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439351) (_1!7469 lt!439289)))))

(assert (=> b!990479 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439351) (_1!7469 lt!439289)))))

(declare-fun b!990480 () Bool)

(declare-fun Unit!32865 () Unit!32858)

(assert (=> b!990480 (= e!558505 Unit!32865)))

(declare-fun b!990481 () Bool)

(assert (=> b!990481 (= e!558504 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439351) (_1!7469 lt!439289))))))

(assert (= (and d!117579 c!100451) b!990479))

(assert (= (and d!117579 (not c!100451)) b!990480))

(assert (= (and d!117579 (not res!662274)) b!990481))

(declare-fun m!917947 () Bool)

(assert (=> d!117579 m!917947))

(declare-fun m!917949 () Bool)

(assert (=> b!990479 m!917949))

(assert (=> b!990479 m!917791))

(assert (=> b!990479 m!917791))

(declare-fun m!917951 () Bool)

(assert (=> b!990479 m!917951))

(assert (=> b!990481 m!917791))

(assert (=> b!990481 m!917791))

(assert (=> b!990481 m!917951))

(assert (=> d!117559 d!117579))

(declare-fun b!990483 () Bool)

(declare-fun e!558506 () Option!520)

(declare-fun e!558507 () Option!520)

(assert (=> b!990483 (= e!558506 e!558507)))

(declare-fun c!100453 () Bool)

(assert (=> b!990483 (= c!100453 (and ((_ is Cons!20842) lt!439349) (not (= (_1!7469 (h!22004 lt!439349)) (_1!7469 lt!439289)))))))

(declare-fun d!117581 () Bool)

(declare-fun c!100452 () Bool)

(assert (=> d!117581 (= c!100452 (and ((_ is Cons!20842) lt!439349) (= (_1!7469 (h!22004 lt!439349)) (_1!7469 lt!439289))))))

(assert (=> d!117581 (= (getValueByKey!514 lt!439349 (_1!7469 lt!439289)) e!558506)))

(declare-fun b!990482 () Bool)

(assert (=> b!990482 (= e!558506 (Some!519 (_2!7469 (h!22004 lt!439349))))))

(declare-fun b!990484 () Bool)

(assert (=> b!990484 (= e!558507 (getValueByKey!514 (t!29821 lt!439349) (_1!7469 lt!439289)))))

(declare-fun b!990485 () Bool)

(assert (=> b!990485 (= e!558507 None!518)))

(assert (= (and d!117581 c!100452) b!990482))

(assert (= (and d!117581 (not c!100452)) b!990483))

(assert (= (and b!990483 c!100453) b!990484))

(assert (= (and b!990483 (not c!100453)) b!990485))

(declare-fun m!917953 () Bool)

(assert (=> b!990484 m!917953))

(assert (=> d!117559 d!117581))

(declare-fun d!117583 () Bool)

(assert (=> d!117583 (= (getValueByKey!514 lt!439349 (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289)))))

(declare-fun lt!439473 () Unit!32858)

(declare-fun choose!1616 (List!20846 (_ BitVec 64) V!36043) Unit!32858)

(assert (=> d!117583 (= lt!439473 (choose!1616 lt!439349 (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(declare-fun e!558510 () Bool)

(assert (=> d!117583 e!558510))

(declare-fun res!662279 () Bool)

(assert (=> d!117583 (=> (not res!662279) (not e!558510))))

(declare-fun isStrictlySorted!517 (List!20846) Bool)

(assert (=> d!117583 (= res!662279 (isStrictlySorted!517 lt!439349))))

(assert (=> d!117583 (= (lemmaContainsTupThenGetReturnValue!273 lt!439349 (_1!7469 lt!439289) (_2!7469 lt!439289)) lt!439473)))

(declare-fun b!990490 () Bool)

(declare-fun res!662280 () Bool)

(assert (=> b!990490 (=> (not res!662280) (not e!558510))))

(assert (=> b!990490 (= res!662280 (containsKey!479 lt!439349 (_1!7469 lt!439289)))))

(declare-fun b!990491 () Bool)

(assert (=> b!990491 (= e!558510 (contains!5725 lt!439349 (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289))))))

(assert (= (and d!117583 res!662279) b!990490))

(assert (= (and b!990490 res!662280) b!990491))

(assert (=> d!117583 m!917785))

(declare-fun m!917955 () Bool)

(assert (=> d!117583 m!917955))

(declare-fun m!917957 () Bool)

(assert (=> d!117583 m!917957))

(declare-fun m!917959 () Bool)

(assert (=> b!990490 m!917959))

(declare-fun m!917961 () Bool)

(assert (=> b!990491 m!917961))

(assert (=> d!117559 d!117583))

(declare-fun b!990512 () Bool)

(declare-fun c!100465 () Bool)

(declare-fun c!100463 () Bool)

(declare-fun e!558521 () List!20846)

(assert (=> b!990512 (= e!558521 (ite c!100463 (t!29821 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100465 (Cons!20842 (h!22004 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29821 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20843)))))

(declare-fun b!990513 () Bool)

(declare-fun e!558524 () List!20846)

(declare-fun e!558525 () List!20846)

(assert (=> b!990513 (= e!558524 e!558525)))

(assert (=> b!990513 (= c!100463 (and ((_ is Cons!20842) (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7469 (h!22004 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7469 lt!439289))))))

(declare-fun b!990514 () Bool)

(declare-fun call!42008 () List!20846)

(assert (=> b!990514 (= e!558525 call!42008)))

(declare-fun b!990515 () Bool)

(assert (=> b!990515 (= c!100465 (and ((_ is Cons!20842) (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7469 (h!22004 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7469 lt!439289))))))

(declare-fun e!558523 () List!20846)

(assert (=> b!990515 (= e!558525 e!558523)))

(declare-fun b!990516 () Bool)

(declare-fun e!558522 () Bool)

(declare-fun lt!439476 () List!20846)

(assert (=> b!990516 (= e!558522 (contains!5725 lt!439476 (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289))))))

(declare-fun b!990517 () Bool)

(declare-fun call!42007 () List!20846)

(assert (=> b!990517 (= e!558523 call!42007)))

(declare-fun b!990518 () Bool)

(assert (=> b!990518 (= e!558523 call!42007)))

(declare-fun bm!42003 () Bool)

(declare-fun call!42006 () List!20846)

(assert (=> bm!42003 (= call!42008 call!42006)))

(declare-fun b!990519 () Bool)

(assert (=> b!990519 (= e!558521 (insertStrictlySorted!330 (t!29821 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(declare-fun b!990520 () Bool)

(assert (=> b!990520 (= e!558524 call!42006)))

(declare-fun b!990521 () Bool)

(declare-fun res!662285 () Bool)

(assert (=> b!990521 (=> (not res!662285) (not e!558522))))

(assert (=> b!990521 (= res!662285 (containsKey!479 lt!439476 (_1!7469 lt!439289)))))

(declare-fun c!100464 () Bool)

(declare-fun bm!42005 () Bool)

(declare-fun $colon$colon!556 (List!20846 tuple2!14916) List!20846)

(assert (=> bm!42005 (= call!42006 ($colon$colon!556 e!558521 (ite c!100464 (h!22004 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289)))))))

(declare-fun c!100462 () Bool)

(assert (=> bm!42005 (= c!100462 c!100464)))

(declare-fun d!117585 () Bool)

(assert (=> d!117585 e!558522))

(declare-fun res!662286 () Bool)

(assert (=> d!117585 (=> (not res!662286) (not e!558522))))

(assert (=> d!117585 (= res!662286 (isStrictlySorted!517 lt!439476))))

(assert (=> d!117585 (= lt!439476 e!558524)))

(assert (=> d!117585 (= c!100464 (and ((_ is Cons!20842) (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7469 (h!22004 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7469 lt!439289))))))

(assert (=> d!117585 (isStrictlySorted!517 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117585 (= (insertStrictlySorted!330 (toList!6822 (getCurrentListMap!3872 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7469 lt!439289) (_2!7469 lt!439289)) lt!439476)))

(declare-fun bm!42004 () Bool)

(assert (=> bm!42004 (= call!42007 call!42008)))

(assert (= (and d!117585 c!100464) b!990520))

(assert (= (and d!117585 (not c!100464)) b!990513))

(assert (= (and b!990513 c!100463) b!990514))

(assert (= (and b!990513 (not c!100463)) b!990515))

(assert (= (and b!990515 c!100465) b!990517))

(assert (= (and b!990515 (not c!100465)) b!990518))

(assert (= (or b!990517 b!990518) bm!42004))

(assert (= (or b!990514 bm!42004) bm!42003))

(assert (= (or b!990520 bm!42003) bm!42005))

(assert (= (and bm!42005 c!100462) b!990519))

(assert (= (and bm!42005 (not c!100462)) b!990512))

(assert (= (and d!117585 res!662286) b!990521))

(assert (= (and b!990521 res!662285) b!990516))

(declare-fun m!917963 () Bool)

(assert (=> b!990521 m!917963))

(declare-fun m!917965 () Bool)

(assert (=> bm!42005 m!917965))

(declare-fun m!917967 () Bool)

(assert (=> b!990519 m!917967))

(declare-fun m!917969 () Bool)

(assert (=> d!117585 m!917969))

(declare-fun m!917971 () Bool)

(assert (=> d!117585 m!917971))

(declare-fun m!917973 () Bool)

(assert (=> b!990516 m!917973))

(assert (=> d!117559 d!117585))

(declare-fun d!117587 () Bool)

(declare-fun e!558526 () Bool)

(assert (=> d!117587 e!558526))

(declare-fun res!662287 () Bool)

(assert (=> d!117587 (=> res!662287 e!558526)))

(declare-fun lt!439480 () Bool)

(assert (=> d!117587 (= res!662287 (not lt!439480))))

(declare-fun lt!439479 () Bool)

(assert (=> d!117587 (= lt!439480 lt!439479)))

(declare-fun lt!439478 () Unit!32858)

(declare-fun e!558527 () Unit!32858)

(assert (=> d!117587 (= lt!439478 e!558527)))

(declare-fun c!100466 () Bool)

(assert (=> d!117587 (= c!100466 lt!439479)))

(assert (=> d!117587 (= lt!439479 (containsKey!479 (toList!6822 lt!439414) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117587 (= (contains!5723 lt!439414 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439480)))

(declare-fun b!990522 () Bool)

(declare-fun lt!439477 () Unit!32858)

(assert (=> b!990522 (= e!558527 lt!439477)))

(assert (=> b!990522 (= lt!439477 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439414) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990522 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439414) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990523 () Bool)

(declare-fun Unit!32866 () Unit!32858)

(assert (=> b!990523 (= e!558527 Unit!32866)))

(declare-fun b!990524 () Bool)

(assert (=> b!990524 (= e!558526 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439414) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117587 c!100466) b!990522))

(assert (= (and d!117587 (not c!100466)) b!990523))

(assert (= (and d!117587 (not res!662287)) b!990524))

(declare-fun m!917975 () Bool)

(assert (=> d!117587 m!917975))

(declare-fun m!917977 () Bool)

(assert (=> b!990522 m!917977))

(declare-fun m!917979 () Bool)

(assert (=> b!990522 m!917979))

(assert (=> b!990522 m!917979))

(declare-fun m!917981 () Bool)

(assert (=> b!990522 m!917981))

(assert (=> b!990524 m!917979))

(assert (=> b!990524 m!917979))

(assert (=> b!990524 m!917981))

(assert (=> bm!41988 d!117587))

(assert (=> b!990442 d!117577))

(declare-fun d!117589 () Bool)

(declare-fun e!558528 () Bool)

(assert (=> d!117589 e!558528))

(declare-fun res!662288 () Bool)

(assert (=> d!117589 (=> res!662288 e!558528)))

(declare-fun lt!439484 () Bool)

(assert (=> d!117589 (= res!662288 (not lt!439484))))

(declare-fun lt!439483 () Bool)

(assert (=> d!117589 (= lt!439484 lt!439483)))

(declare-fun lt!439482 () Unit!32858)

(declare-fun e!558529 () Unit!32858)

(assert (=> d!117589 (= lt!439482 e!558529)))

(declare-fun c!100467 () Bool)

(assert (=> d!117589 (= c!100467 lt!439483)))

(assert (=> d!117589 (= lt!439483 (containsKey!479 (toList!6822 lt!439355) (_1!7469 lt!439289)))))

(assert (=> d!117589 (= (contains!5723 lt!439355 (_1!7469 lt!439289)) lt!439484)))

(declare-fun b!990525 () Bool)

(declare-fun lt!439481 () Unit!32858)

(assert (=> b!990525 (= e!558529 lt!439481)))

(assert (=> b!990525 (= lt!439481 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439355) (_1!7469 lt!439289)))))

(assert (=> b!990525 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439355) (_1!7469 lt!439289)))))

(declare-fun b!990526 () Bool)

(declare-fun Unit!32867 () Unit!32858)

(assert (=> b!990526 (= e!558529 Unit!32867)))

(declare-fun b!990527 () Bool)

(assert (=> b!990527 (= e!558528 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439355) (_1!7469 lt!439289))))))

(assert (= (and d!117589 c!100467) b!990525))

(assert (= (and d!117589 (not c!100467)) b!990526))

(assert (= (and d!117589 (not res!662288)) b!990527))

(declare-fun m!917983 () Bool)

(assert (=> d!117589 m!917983))

(declare-fun m!917985 () Bool)

(assert (=> b!990525 m!917985))

(assert (=> b!990525 m!917803))

(assert (=> b!990525 m!917803))

(declare-fun m!917987 () Bool)

(assert (=> b!990525 m!917987))

(assert (=> b!990527 m!917803))

(assert (=> b!990527 m!917803))

(assert (=> b!990527 m!917987))

(assert (=> d!117561 d!117589))

(declare-fun b!990529 () Bool)

(declare-fun e!558530 () Option!520)

(declare-fun e!558531 () Option!520)

(assert (=> b!990529 (= e!558530 e!558531)))

(declare-fun c!100469 () Bool)

(assert (=> b!990529 (= c!100469 (and ((_ is Cons!20842) lt!439353) (not (= (_1!7469 (h!22004 lt!439353)) (_1!7469 lt!439289)))))))

(declare-fun d!117591 () Bool)

(declare-fun c!100468 () Bool)

(assert (=> d!117591 (= c!100468 (and ((_ is Cons!20842) lt!439353) (= (_1!7469 (h!22004 lt!439353)) (_1!7469 lt!439289))))))

(assert (=> d!117591 (= (getValueByKey!514 lt!439353 (_1!7469 lt!439289)) e!558530)))

(declare-fun b!990528 () Bool)

(assert (=> b!990528 (= e!558530 (Some!519 (_2!7469 (h!22004 lt!439353))))))

(declare-fun b!990530 () Bool)

(assert (=> b!990530 (= e!558531 (getValueByKey!514 (t!29821 lt!439353) (_1!7469 lt!439289)))))

(declare-fun b!990531 () Bool)

(assert (=> b!990531 (= e!558531 None!518)))

(assert (= (and d!117591 c!100468) b!990528))

(assert (= (and d!117591 (not c!100468)) b!990529))

(assert (= (and b!990529 c!100469) b!990530))

(assert (= (and b!990529 (not c!100469)) b!990531))

(declare-fun m!917989 () Bool)

(assert (=> b!990530 m!917989))

(assert (=> d!117561 d!117591))

(declare-fun d!117593 () Bool)

(assert (=> d!117593 (= (getValueByKey!514 lt!439353 (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289)))))

(declare-fun lt!439485 () Unit!32858)

(assert (=> d!117593 (= lt!439485 (choose!1616 lt!439353 (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(declare-fun e!558532 () Bool)

(assert (=> d!117593 e!558532))

(declare-fun res!662289 () Bool)

(assert (=> d!117593 (=> (not res!662289) (not e!558532))))

(assert (=> d!117593 (= res!662289 (isStrictlySorted!517 lt!439353))))

(assert (=> d!117593 (= (lemmaContainsTupThenGetReturnValue!273 lt!439353 (_1!7469 lt!439289) (_2!7469 lt!439289)) lt!439485)))

(declare-fun b!990532 () Bool)

(declare-fun res!662290 () Bool)

(assert (=> b!990532 (=> (not res!662290) (not e!558532))))

(assert (=> b!990532 (= res!662290 (containsKey!479 lt!439353 (_1!7469 lt!439289)))))

(declare-fun b!990533 () Bool)

(assert (=> b!990533 (= e!558532 (contains!5725 lt!439353 (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289))))))

(assert (= (and d!117593 res!662289) b!990532))

(assert (= (and b!990532 res!662290) b!990533))

(assert (=> d!117593 m!917797))

(declare-fun m!917991 () Bool)

(assert (=> d!117593 m!917991))

(declare-fun m!917993 () Bool)

(assert (=> d!117593 m!917993))

(declare-fun m!917995 () Bool)

(assert (=> b!990532 m!917995))

(declare-fun m!917997 () Bool)

(assert (=> b!990533 m!917997))

(assert (=> d!117561 d!117593))

(declare-fun e!558533 () List!20846)

(declare-fun b!990534 () Bool)

(declare-fun c!100471 () Bool)

(declare-fun c!100473 () Bool)

(assert (=> b!990534 (= e!558533 (ite c!100471 (t!29821 (toList!6822 (+!3092 lt!439287 lt!439290))) (ite c!100473 (Cons!20842 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439290))) (t!29821 (toList!6822 (+!3092 lt!439287 lt!439290)))) Nil!20843)))))

(declare-fun b!990535 () Bool)

(declare-fun e!558536 () List!20846)

(declare-fun e!558537 () List!20846)

(assert (=> b!990535 (= e!558536 e!558537)))

(assert (=> b!990535 (= c!100471 (and ((_ is Cons!20842) (toList!6822 (+!3092 lt!439287 lt!439290))) (= (_1!7469 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439290)))) (_1!7469 lt!439289))))))

(declare-fun b!990536 () Bool)

(declare-fun call!42011 () List!20846)

(assert (=> b!990536 (= e!558537 call!42011)))

(declare-fun b!990537 () Bool)

(assert (=> b!990537 (= c!100473 (and ((_ is Cons!20842) (toList!6822 (+!3092 lt!439287 lt!439290))) (bvsgt (_1!7469 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439290)))) (_1!7469 lt!439289))))))

(declare-fun e!558535 () List!20846)

(assert (=> b!990537 (= e!558537 e!558535)))

(declare-fun b!990538 () Bool)

(declare-fun e!558534 () Bool)

(declare-fun lt!439486 () List!20846)

(assert (=> b!990538 (= e!558534 (contains!5725 lt!439486 (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289))))))

(declare-fun b!990539 () Bool)

(declare-fun call!42010 () List!20846)

(assert (=> b!990539 (= e!558535 call!42010)))

(declare-fun b!990540 () Bool)

(assert (=> b!990540 (= e!558535 call!42010)))

(declare-fun bm!42006 () Bool)

(declare-fun call!42009 () List!20846)

(assert (=> bm!42006 (= call!42011 call!42009)))

(declare-fun b!990541 () Bool)

(assert (=> b!990541 (= e!558533 (insertStrictlySorted!330 (t!29821 (toList!6822 (+!3092 lt!439287 lt!439290))) (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(declare-fun b!990542 () Bool)

(assert (=> b!990542 (= e!558536 call!42009)))

(declare-fun b!990543 () Bool)

(declare-fun res!662291 () Bool)

(assert (=> b!990543 (=> (not res!662291) (not e!558534))))

(assert (=> b!990543 (= res!662291 (containsKey!479 lt!439486 (_1!7469 lt!439289)))))

(declare-fun bm!42008 () Bool)

(declare-fun c!100472 () Bool)

(assert (=> bm!42008 (= call!42009 ($colon$colon!556 e!558533 (ite c!100472 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439290))) (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289)))))))

(declare-fun c!100470 () Bool)

(assert (=> bm!42008 (= c!100470 c!100472)))

(declare-fun d!117595 () Bool)

(assert (=> d!117595 e!558534))

(declare-fun res!662292 () Bool)

(assert (=> d!117595 (=> (not res!662292) (not e!558534))))

(assert (=> d!117595 (= res!662292 (isStrictlySorted!517 lt!439486))))

(assert (=> d!117595 (= lt!439486 e!558536)))

(assert (=> d!117595 (= c!100472 (and ((_ is Cons!20842) (toList!6822 (+!3092 lt!439287 lt!439290))) (bvslt (_1!7469 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439290)))) (_1!7469 lt!439289))))))

(assert (=> d!117595 (isStrictlySorted!517 (toList!6822 (+!3092 lt!439287 lt!439290)))))

(assert (=> d!117595 (= (insertStrictlySorted!330 (toList!6822 (+!3092 lt!439287 lt!439290)) (_1!7469 lt!439289) (_2!7469 lt!439289)) lt!439486)))

(declare-fun bm!42007 () Bool)

(assert (=> bm!42007 (= call!42010 call!42011)))

(assert (= (and d!117595 c!100472) b!990542))

(assert (= (and d!117595 (not c!100472)) b!990535))

(assert (= (and b!990535 c!100471) b!990536))

(assert (= (and b!990535 (not c!100471)) b!990537))

(assert (= (and b!990537 c!100473) b!990539))

(assert (= (and b!990537 (not c!100473)) b!990540))

(assert (= (or b!990539 b!990540) bm!42007))

(assert (= (or b!990536 bm!42007) bm!42006))

(assert (= (or b!990542 bm!42006) bm!42008))

(assert (= (and bm!42008 c!100470) b!990541))

(assert (= (and bm!42008 (not c!100470)) b!990534))

(assert (= (and d!117595 res!662292) b!990543))

(assert (= (and b!990543 res!662291) b!990538))

(declare-fun m!917999 () Bool)

(assert (=> b!990543 m!917999))

(declare-fun m!918001 () Bool)

(assert (=> bm!42008 m!918001))

(declare-fun m!918003 () Bool)

(assert (=> b!990541 m!918003))

(declare-fun m!918005 () Bool)

(assert (=> d!117595 m!918005))

(declare-fun m!918007 () Bool)

(assert (=> d!117595 m!918007))

(declare-fun m!918009 () Bool)

(assert (=> b!990538 m!918009))

(assert (=> d!117561 d!117595))

(declare-fun b!990545 () Bool)

(declare-fun e!558538 () Option!520)

(declare-fun e!558539 () Option!520)

(assert (=> b!990545 (= e!558538 e!558539)))

(declare-fun c!100475 () Bool)

(assert (=> b!990545 (= c!100475 (and ((_ is Cons!20842) (toList!6822 lt!439454)) (not (= (_1!7469 (h!22004 (toList!6822 lt!439454))) (_1!7469 lt!439290)))))))

(declare-fun d!117597 () Bool)

(declare-fun c!100474 () Bool)

(assert (=> d!117597 (= c!100474 (and ((_ is Cons!20842) (toList!6822 lt!439454)) (= (_1!7469 (h!22004 (toList!6822 lt!439454))) (_1!7469 lt!439290))))))

(assert (=> d!117597 (= (getValueByKey!514 (toList!6822 lt!439454) (_1!7469 lt!439290)) e!558538)))

(declare-fun b!990544 () Bool)

(assert (=> b!990544 (= e!558538 (Some!519 (_2!7469 (h!22004 (toList!6822 lt!439454)))))))

(declare-fun b!990546 () Bool)

(assert (=> b!990546 (= e!558539 (getValueByKey!514 (t!29821 (toList!6822 lt!439454)) (_1!7469 lt!439290)))))

(declare-fun b!990547 () Bool)

(assert (=> b!990547 (= e!558539 None!518)))

(assert (= (and d!117597 c!100474) b!990544))

(assert (= (and d!117597 (not c!100474)) b!990545))

(assert (= (and b!990545 c!100475) b!990546))

(assert (= (and b!990545 (not c!100475)) b!990547))

(declare-fun m!918011 () Bool)

(assert (=> b!990546 m!918011))

(assert (=> b!990448 d!117597))

(declare-fun d!117599 () Bool)

(declare-fun get!15644 (Option!520) V!36043)

(assert (=> d!117599 (= (apply!897 lt!439414 (select (arr!30127 _keys!1544) from!1932)) (get!15644 (getValueByKey!514 (toList!6822 lt!439414) (select (arr!30127 _keys!1544) from!1932))))))

(declare-fun bs!28120 () Bool)

(assert (= bs!28120 d!117599))

(assert (=> bs!28120 m!917643))

(declare-fun m!918013 () Bool)

(assert (=> bs!28120 m!918013))

(assert (=> bs!28120 m!918013))

(declare-fun m!918015 () Bool)

(assert (=> bs!28120 m!918015))

(assert (=> b!990414 d!117599))

(assert (=> b!990414 d!117541))

(declare-fun d!117601 () Bool)

(declare-fun e!558540 () Bool)

(assert (=> d!117601 e!558540))

(declare-fun res!662294 () Bool)

(assert (=> d!117601 (=> (not res!662294) (not e!558540))))

(declare-fun lt!439490 () ListLongMap!13613)

(assert (=> d!117601 (= res!662294 (contains!5723 lt!439490 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))))

(declare-fun lt!439488 () List!20846)

(assert (=> d!117601 (= lt!439490 (ListLongMap!13614 lt!439488))))

(declare-fun lt!439489 () Unit!32858)

(declare-fun lt!439487 () Unit!32858)

(assert (=> d!117601 (= lt!439489 lt!439487)))

(assert (=> d!117601 (= (getValueByKey!514 lt!439488 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))) (Some!519 (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))))

(assert (=> d!117601 (= lt!439487 (lemmaContainsTupThenGetReturnValue!273 lt!439488 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))))

(assert (=> d!117601 (= lt!439488 (insertStrictlySorted!330 (toList!6822 lt!439287) (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))))

(assert (=> d!117601 (= (+!3092 lt!439287 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) lt!439490)))

(declare-fun b!990548 () Bool)

(declare-fun res!662293 () Bool)

(assert (=> b!990548 (=> (not res!662293) (not e!558540))))

(assert (=> b!990548 (= res!662293 (= (getValueByKey!514 (toList!6822 lt!439490) (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))) (Some!519 (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)))))))

(declare-fun b!990549 () Bool)

(assert (=> b!990549 (= e!558540 (contains!5725 (toList!6822 lt!439490) (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)))))

(assert (= (and d!117601 res!662294) b!990548))

(assert (= (and b!990548 res!662293) b!990549))

(declare-fun m!918017 () Bool)

(assert (=> d!117601 m!918017))

(declare-fun m!918019 () Bool)

(assert (=> d!117601 m!918019))

(declare-fun m!918021 () Bool)

(assert (=> d!117601 m!918021))

(declare-fun m!918023 () Bool)

(assert (=> d!117601 m!918023))

(declare-fun m!918025 () Bool)

(assert (=> b!990548 m!918025))

(declare-fun m!918027 () Bool)

(assert (=> b!990549 m!918027))

(assert (=> d!117563 d!117601))

(declare-fun d!117603 () Bool)

(assert (=> d!117603 (= (+!3092 (+!3092 lt!439287 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (+!3092 (+!3092 lt!439287 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (=> d!117603 true))

(declare-fun _$28!191 () Unit!32858)

(assert (=> d!117603 (= (choose!1615 lt!439287 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30127 _keys!1544) from!1932) lt!439286) _$28!191)))

(declare-fun bs!28121 () Bool)

(assert (= bs!28121 d!117603))

(assert (=> bs!28121 m!917809))

(assert (=> bs!28121 m!917809))

(assert (=> bs!28121 m!917811))

(assert (=> bs!28121 m!917813))

(assert (=> bs!28121 m!917813))

(assert (=> bs!28121 m!917815))

(assert (=> d!117563 d!117603))

(declare-fun d!117605 () Bool)

(declare-fun e!558541 () Bool)

(assert (=> d!117605 e!558541))

(declare-fun res!662296 () Bool)

(assert (=> d!117605 (=> (not res!662296) (not e!558541))))

(declare-fun lt!439494 () ListLongMap!13613)

(assert (=> d!117605 (= res!662296 (contains!5723 lt!439494 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439492 () List!20846)

(assert (=> d!117605 (= lt!439494 (ListLongMap!13614 lt!439492))))

(declare-fun lt!439493 () Unit!32858)

(declare-fun lt!439491 () Unit!32858)

(assert (=> d!117605 (= lt!439493 lt!439491)))

(assert (=> d!117605 (= (getValueByKey!514 lt!439492 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117605 (= lt!439491 (lemmaContainsTupThenGetReturnValue!273 lt!439492 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117605 (= lt!439492 (insertStrictlySorted!330 (toList!6822 (+!3092 lt!439287 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))) (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117605 (= (+!3092 (+!3092 lt!439287 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439494)))

(declare-fun b!990550 () Bool)

(declare-fun res!662295 () Bool)

(assert (=> b!990550 (=> (not res!662295) (not e!558541))))

(assert (=> b!990550 (= res!662295 (= (getValueByKey!514 (toList!6822 lt!439494) (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990551 () Bool)

(assert (=> b!990551 (= e!558541 (contains!5725 (toList!6822 lt!439494) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117605 res!662296) b!990550))

(assert (= (and b!990550 res!662295) b!990551))

(declare-fun m!918029 () Bool)

(assert (=> d!117605 m!918029))

(declare-fun m!918031 () Bool)

(assert (=> d!117605 m!918031))

(declare-fun m!918033 () Bool)

(assert (=> d!117605 m!918033))

(declare-fun m!918035 () Bool)

(assert (=> d!117605 m!918035))

(declare-fun m!918037 () Bool)

(assert (=> b!990550 m!918037))

(declare-fun m!918039 () Bool)

(assert (=> b!990551 m!918039))

(assert (=> d!117563 d!117605))

(declare-fun d!117607 () Bool)

(declare-fun e!558542 () Bool)

(assert (=> d!117607 e!558542))

(declare-fun res!662298 () Bool)

(assert (=> d!117607 (=> (not res!662298) (not e!558542))))

(declare-fun lt!439498 () ListLongMap!13613)

(assert (=> d!117607 (= res!662298 (contains!5723 lt!439498 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439496 () List!20846)

(assert (=> d!117607 (= lt!439498 (ListLongMap!13614 lt!439496))))

(declare-fun lt!439497 () Unit!32858)

(declare-fun lt!439495 () Unit!32858)

(assert (=> d!117607 (= lt!439497 lt!439495)))

(assert (=> d!117607 (= (getValueByKey!514 lt!439496 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117607 (= lt!439495 (lemmaContainsTupThenGetReturnValue!273 lt!439496 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117607 (= lt!439496 (insertStrictlySorted!330 (toList!6822 lt!439287) (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117607 (= (+!3092 lt!439287 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439498)))

(declare-fun b!990552 () Bool)

(declare-fun res!662297 () Bool)

(assert (=> b!990552 (=> (not res!662297) (not e!558542))))

(assert (=> b!990552 (= res!662297 (= (getValueByKey!514 (toList!6822 lt!439498) (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990553 () Bool)

(assert (=> b!990553 (= e!558542 (contains!5725 (toList!6822 lt!439498) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117607 res!662298) b!990552))

(assert (= (and b!990552 res!662297) b!990553))

(declare-fun m!918041 () Bool)

(assert (=> d!117607 m!918041))

(declare-fun m!918043 () Bool)

(assert (=> d!117607 m!918043))

(declare-fun m!918045 () Bool)

(assert (=> d!117607 m!918045))

(declare-fun m!918047 () Bool)

(assert (=> d!117607 m!918047))

(declare-fun m!918049 () Bool)

(assert (=> b!990552 m!918049))

(declare-fun m!918051 () Bool)

(assert (=> b!990553 m!918051))

(assert (=> d!117563 d!117607))

(declare-fun d!117609 () Bool)

(declare-fun e!558543 () Bool)

(assert (=> d!117609 e!558543))

(declare-fun res!662300 () Bool)

(assert (=> d!117609 (=> (not res!662300) (not e!558543))))

(declare-fun lt!439502 () ListLongMap!13613)

(assert (=> d!117609 (= res!662300 (contains!5723 lt!439502 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))))

(declare-fun lt!439500 () List!20846)

(assert (=> d!117609 (= lt!439502 (ListLongMap!13614 lt!439500))))

(declare-fun lt!439501 () Unit!32858)

(declare-fun lt!439499 () Unit!32858)

(assert (=> d!117609 (= lt!439501 lt!439499)))

(assert (=> d!117609 (= (getValueByKey!514 lt!439500 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))) (Some!519 (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))))

(assert (=> d!117609 (= lt!439499 (lemmaContainsTupThenGetReturnValue!273 lt!439500 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))))

(assert (=> d!117609 (= lt!439500 (insertStrictlySorted!330 (toList!6822 (+!3092 lt!439287 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))))))

(assert (=> d!117609 (= (+!3092 (+!3092 lt!439287 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)) lt!439502)))

(declare-fun b!990554 () Bool)

(declare-fun res!662299 () Bool)

(assert (=> b!990554 (=> (not res!662299) (not e!558543))))

(assert (=> b!990554 (= res!662299 (= (getValueByKey!514 (toList!6822 lt!439502) (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286))) (Some!519 (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)))))))

(declare-fun b!990555 () Bool)

(assert (=> b!990555 (= e!558543 (contains!5725 (toList!6822 lt!439502) (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) lt!439286)))))

(assert (= (and d!117609 res!662300) b!990554))

(assert (= (and b!990554 res!662299) b!990555))

(declare-fun m!918053 () Bool)

(assert (=> d!117609 m!918053))

(declare-fun m!918055 () Bool)

(assert (=> d!117609 m!918055))

(declare-fun m!918057 () Bool)

(assert (=> d!117609 m!918057))

(declare-fun m!918059 () Bool)

(assert (=> d!117609 m!918059))

(declare-fun m!918061 () Bool)

(assert (=> b!990554 m!918061))

(declare-fun m!918063 () Bool)

(assert (=> b!990555 m!918063))

(assert (=> d!117563 d!117609))

(declare-fun d!117611 () Bool)

(declare-fun e!558544 () Bool)

(assert (=> d!117611 e!558544))

(declare-fun res!662301 () Bool)

(assert (=> d!117611 (=> res!662301 e!558544)))

(declare-fun lt!439506 () Bool)

(assert (=> d!117611 (= res!662301 (not lt!439506))))

(declare-fun lt!439505 () Bool)

(assert (=> d!117611 (= lt!439506 lt!439505)))

(declare-fun lt!439504 () Unit!32858)

(declare-fun e!558545 () Unit!32858)

(assert (=> d!117611 (= lt!439504 e!558545)))

(declare-fun c!100476 () Bool)

(assert (=> d!117611 (= c!100476 lt!439505)))

(assert (=> d!117611 (= lt!439505 (containsKey!479 (toList!6822 lt!439321) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117611 (= (contains!5723 lt!439321 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439506)))

(declare-fun b!990556 () Bool)

(declare-fun lt!439503 () Unit!32858)

(assert (=> b!990556 (= e!558545 lt!439503)))

(assert (=> b!990556 (= lt!439503 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439321) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990556 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439321) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990557 () Bool)

(declare-fun Unit!32868 () Unit!32858)

(assert (=> b!990557 (= e!558545 Unit!32868)))

(declare-fun b!990558 () Bool)

(assert (=> b!990558 (= e!558544 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439321) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117611 c!100476) b!990556))

(assert (= (and d!117611 (not c!100476)) b!990557))

(assert (= (and d!117611 (not res!662301)) b!990558))

(assert (=> d!117611 m!917731))

(declare-fun m!918065 () Bool)

(assert (=> d!117611 m!918065))

(assert (=> b!990556 m!917731))

(declare-fun m!918067 () Bool)

(assert (=> b!990556 m!918067))

(assert (=> b!990556 m!917731))

(declare-fun m!918069 () Bool)

(assert (=> b!990556 m!918069))

(assert (=> b!990556 m!918069))

(declare-fun m!918071 () Bool)

(assert (=> b!990556 m!918071))

(assert (=> b!990558 m!917731))

(assert (=> b!990558 m!918069))

(assert (=> b!990558 m!918069))

(assert (=> b!990558 m!918071))

(assert (=> b!990317 d!117611))

(assert (=> d!117567 d!117549))

(declare-fun d!117613 () Bool)

(declare-fun e!558546 () Bool)

(assert (=> d!117613 e!558546))

(declare-fun res!662302 () Bool)

(assert (=> d!117613 (=> res!662302 e!558546)))

(declare-fun lt!439510 () Bool)

(assert (=> d!117613 (= res!662302 (not lt!439510))))

(declare-fun lt!439509 () Bool)

(assert (=> d!117613 (= lt!439510 lt!439509)))

(declare-fun lt!439508 () Unit!32858)

(declare-fun e!558547 () Unit!32858)

(assert (=> d!117613 (= lt!439508 e!558547)))

(declare-fun c!100477 () Bool)

(assert (=> d!117613 (= c!100477 lt!439509)))

(assert (=> d!117613 (= lt!439509 (containsKey!479 (toList!6822 lt!439436) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117613 (= (contains!5723 lt!439436 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439510)))

(declare-fun b!990559 () Bool)

(declare-fun lt!439507 () Unit!32858)

(assert (=> b!990559 (= e!558547 lt!439507)))

(assert (=> b!990559 (= lt!439507 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439436) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990559 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439436) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990560 () Bool)

(declare-fun Unit!32869 () Unit!32858)

(assert (=> b!990560 (= e!558547 Unit!32869)))

(declare-fun b!990561 () Bool)

(assert (=> b!990561 (= e!558546 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439436) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117613 c!100477) b!990559))

(assert (= (and d!117613 (not c!100477)) b!990560))

(assert (= (and d!117613 (not res!662302)) b!990561))

(declare-fun m!918073 () Bool)

(assert (=> d!117613 m!918073))

(declare-fun m!918075 () Bool)

(assert (=> b!990559 m!918075))

(declare-fun m!918077 () Bool)

(assert (=> b!990559 m!918077))

(assert (=> b!990559 m!918077))

(declare-fun m!918079 () Bool)

(assert (=> b!990559 m!918079))

(assert (=> b!990561 m!918077))

(assert (=> b!990561 m!918077))

(assert (=> b!990561 m!918079))

(assert (=> bm!41992 d!117613))

(assert (=> d!117565 d!117549))

(declare-fun d!117615 () Bool)

(assert (=> d!117615 (= (apply!897 lt!439436 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15644 (getValueByKey!514 (toList!6822 lt!439436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28122 () Bool)

(assert (= bs!28122 d!117615))

(declare-fun m!918081 () Bool)

(assert (=> bs!28122 m!918081))

(assert (=> bs!28122 m!918081))

(declare-fun m!918083 () Bool)

(assert (=> bs!28122 m!918083))

(assert (=> b!990430 d!117615))

(declare-fun b!990563 () Bool)

(declare-fun e!558548 () Option!520)

(declare-fun e!558549 () Option!520)

(assert (=> b!990563 (= e!558548 e!558549)))

(declare-fun c!100479 () Bool)

(assert (=> b!990563 (= c!100479 (and ((_ is Cons!20842) (toList!6822 lt!439347)) (not (= (_1!7469 (h!22004 (toList!6822 lt!439347))) (_1!7469 lt!439289)))))))

(declare-fun d!117617 () Bool)

(declare-fun c!100478 () Bool)

(assert (=> d!117617 (= c!100478 (and ((_ is Cons!20842) (toList!6822 lt!439347)) (= (_1!7469 (h!22004 (toList!6822 lt!439347))) (_1!7469 lt!439289))))))

(assert (=> d!117617 (= (getValueByKey!514 (toList!6822 lt!439347) (_1!7469 lt!439289)) e!558548)))

(declare-fun b!990562 () Bool)

(assert (=> b!990562 (= e!558548 (Some!519 (_2!7469 (h!22004 (toList!6822 lt!439347)))))))

(declare-fun b!990564 () Bool)

(assert (=> b!990564 (= e!558549 (getValueByKey!514 (t!29821 (toList!6822 lt!439347)) (_1!7469 lt!439289)))))

(declare-fun b!990565 () Bool)

(assert (=> b!990565 (= e!558549 None!518)))

(assert (= (and d!117617 c!100478) b!990562))

(assert (= (and d!117617 (not c!100478)) b!990563))

(assert (= (and b!990563 c!100479) b!990564))

(assert (= (and b!990563 (not c!100479)) b!990565))

(declare-fun m!918085 () Bool)

(assert (=> b!990564 m!918085))

(assert (=> b!990356 d!117617))

(declare-fun b!990567 () Bool)

(declare-fun e!558550 () Option!520)

(declare-fun e!558551 () Option!520)

(assert (=> b!990567 (= e!558550 e!558551)))

(declare-fun c!100481 () Bool)

(assert (=> b!990567 (= c!100481 (and ((_ is Cons!20842) (toList!6822 lt!439351)) (not (= (_1!7469 (h!22004 (toList!6822 lt!439351))) (_1!7469 lt!439289)))))))

(declare-fun d!117619 () Bool)

(declare-fun c!100480 () Bool)

(assert (=> d!117619 (= c!100480 (and ((_ is Cons!20842) (toList!6822 lt!439351)) (= (_1!7469 (h!22004 (toList!6822 lt!439351))) (_1!7469 lt!439289))))))

(assert (=> d!117619 (= (getValueByKey!514 (toList!6822 lt!439351) (_1!7469 lt!439289)) e!558550)))

(declare-fun b!990566 () Bool)

(assert (=> b!990566 (= e!558550 (Some!519 (_2!7469 (h!22004 (toList!6822 lt!439351)))))))

(declare-fun b!990568 () Bool)

(assert (=> b!990568 (= e!558551 (getValueByKey!514 (t!29821 (toList!6822 lt!439351)) (_1!7469 lt!439289)))))

(declare-fun b!990569 () Bool)

(assert (=> b!990569 (= e!558551 None!518)))

(assert (= (and d!117619 c!100480) b!990566))

(assert (= (and d!117619 (not c!100480)) b!990567))

(assert (= (and b!990567 c!100481) b!990568))

(assert (= (and b!990567 (not c!100481)) b!990569))

(declare-fun m!918087 () Bool)

(assert (=> b!990568 m!918087))

(assert (=> b!990358 d!117619))

(declare-fun d!117621 () Bool)

(assert (=> d!117621 (= (validKeyInArray!0 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990347 d!117621))

(assert (=> b!990419 d!117555))

(declare-fun d!117623 () Bool)

(declare-fun e!558552 () Bool)

(assert (=> d!117623 e!558552))

(declare-fun res!662304 () Bool)

(assert (=> d!117623 (=> (not res!662304) (not e!558552))))

(declare-fun lt!439514 () ListLongMap!13613)

(assert (=> d!117623 (= res!662304 (contains!5723 lt!439514 (_1!7469 (tuple2!14917 lt!439325 lt!439320))))))

(declare-fun lt!439512 () List!20846)

(assert (=> d!117623 (= lt!439514 (ListLongMap!13614 lt!439512))))

(declare-fun lt!439513 () Unit!32858)

(declare-fun lt!439511 () Unit!32858)

(assert (=> d!117623 (= lt!439513 lt!439511)))

(assert (=> d!117623 (= (getValueByKey!514 lt!439512 (_1!7469 (tuple2!14917 lt!439325 lt!439320))) (Some!519 (_2!7469 (tuple2!14917 lt!439325 lt!439320))))))

(assert (=> d!117623 (= lt!439511 (lemmaContainsTupThenGetReturnValue!273 lt!439512 (_1!7469 (tuple2!14917 lt!439325 lt!439320)) (_2!7469 (tuple2!14917 lt!439325 lt!439320))))))

(assert (=> d!117623 (= lt!439512 (insertStrictlySorted!330 (toList!6822 lt!439324) (_1!7469 (tuple2!14917 lt!439325 lt!439320)) (_2!7469 (tuple2!14917 lt!439325 lt!439320))))))

(assert (=> d!117623 (= (+!3092 lt!439324 (tuple2!14917 lt!439325 lt!439320)) lt!439514)))

(declare-fun b!990570 () Bool)

(declare-fun res!662303 () Bool)

(assert (=> b!990570 (=> (not res!662303) (not e!558552))))

(assert (=> b!990570 (= res!662303 (= (getValueByKey!514 (toList!6822 lt!439514) (_1!7469 (tuple2!14917 lt!439325 lt!439320))) (Some!519 (_2!7469 (tuple2!14917 lt!439325 lt!439320)))))))

(declare-fun b!990571 () Bool)

(assert (=> b!990571 (= e!558552 (contains!5725 (toList!6822 lt!439514) (tuple2!14917 lt!439325 lt!439320)))))

(assert (= (and d!117623 res!662304) b!990570))

(assert (= (and b!990570 res!662303) b!990571))

(declare-fun m!918089 () Bool)

(assert (=> d!117623 m!918089))

(declare-fun m!918091 () Bool)

(assert (=> d!117623 m!918091))

(declare-fun m!918093 () Bool)

(assert (=> d!117623 m!918093))

(declare-fun m!918095 () Bool)

(assert (=> d!117623 m!918095))

(declare-fun m!918097 () Bool)

(assert (=> b!990570 m!918097))

(declare-fun m!918099 () Bool)

(assert (=> b!990571 m!918099))

(assert (=> b!990323 d!117623))

(declare-fun d!117625 () Bool)

(declare-fun e!558553 () Bool)

(assert (=> d!117625 e!558553))

(declare-fun res!662305 () Bool)

(assert (=> d!117625 (=> res!662305 e!558553)))

(declare-fun lt!439518 () Bool)

(assert (=> d!117625 (= res!662305 (not lt!439518))))

(declare-fun lt!439517 () Bool)

(assert (=> d!117625 (= lt!439518 lt!439517)))

(declare-fun lt!439516 () Unit!32858)

(declare-fun e!558554 () Unit!32858)

(assert (=> d!117625 (= lt!439516 e!558554)))

(declare-fun c!100482 () Bool)

(assert (=> d!117625 (= c!100482 lt!439517)))

(assert (=> d!117625 (= lt!439517 (containsKey!479 (toList!6822 (+!3092 lt!439324 (tuple2!14917 lt!439325 lt!439320))) lt!439326))))

(assert (=> d!117625 (= (contains!5723 (+!3092 lt!439324 (tuple2!14917 lt!439325 lt!439320)) lt!439326) lt!439518)))

(declare-fun b!990572 () Bool)

(declare-fun lt!439515 () Unit!32858)

(assert (=> b!990572 (= e!558554 lt!439515)))

(assert (=> b!990572 (= lt!439515 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 (+!3092 lt!439324 (tuple2!14917 lt!439325 lt!439320))) lt!439326))))

(assert (=> b!990572 (isDefined!384 (getValueByKey!514 (toList!6822 (+!3092 lt!439324 (tuple2!14917 lt!439325 lt!439320))) lt!439326))))

(declare-fun b!990573 () Bool)

(declare-fun Unit!32870 () Unit!32858)

(assert (=> b!990573 (= e!558554 Unit!32870)))

(declare-fun b!990574 () Bool)

(assert (=> b!990574 (= e!558553 (isDefined!384 (getValueByKey!514 (toList!6822 (+!3092 lt!439324 (tuple2!14917 lt!439325 lt!439320))) lt!439326)))))

(assert (= (and d!117625 c!100482) b!990572))

(assert (= (and d!117625 (not c!100482)) b!990573))

(assert (= (and d!117625 (not res!662305)) b!990574))

(declare-fun m!918101 () Bool)

(assert (=> d!117625 m!918101))

(declare-fun m!918103 () Bool)

(assert (=> b!990572 m!918103))

(declare-fun m!918105 () Bool)

(assert (=> b!990572 m!918105))

(assert (=> b!990572 m!918105))

(declare-fun m!918107 () Bool)

(assert (=> b!990572 m!918107))

(assert (=> b!990574 m!918105))

(assert (=> b!990574 m!918105))

(assert (=> b!990574 m!918107))

(assert (=> b!990323 d!117625))

(declare-fun d!117627 () Bool)

(declare-fun e!558555 () Bool)

(assert (=> d!117627 e!558555))

(declare-fun res!662307 () Bool)

(assert (=> d!117627 (=> (not res!662307) (not e!558555))))

(declare-fun lt!439522 () ListLongMap!13613)

(assert (=> d!117627 (= res!662307 (contains!5723 lt!439522 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!439520 () List!20846)

(assert (=> d!117627 (= lt!439522 (ListLongMap!13614 lt!439520))))

(declare-fun lt!439521 () Unit!32858)

(declare-fun lt!439519 () Unit!32858)

(assert (=> d!117627 (= lt!439521 lt!439519)))

(assert (=> d!117627 (= (getValueByKey!514 lt!439520 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!519 (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117627 (= lt!439519 (lemmaContainsTupThenGetReturnValue!273 lt!439520 (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117627 (= lt!439520 (insertStrictlySorted!330 (toList!6822 call!41965) (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117627 (= (+!3092 call!41965 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!439522)))

(declare-fun b!990575 () Bool)

(declare-fun res!662306 () Bool)

(assert (=> b!990575 (=> (not res!662306) (not e!558555))))

(assert (=> b!990575 (= res!662306 (= (getValueByKey!514 (toList!6822 lt!439522) (_1!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!519 (_2!7469 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!990576 () Bool)

(assert (=> b!990576 (= e!558555 (contains!5725 (toList!6822 lt!439522) (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117627 res!662307) b!990575))

(assert (= (and b!990575 res!662306) b!990576))

(declare-fun m!918109 () Bool)

(assert (=> d!117627 m!918109))

(declare-fun m!918111 () Bool)

(assert (=> d!117627 m!918111))

(declare-fun m!918113 () Bool)

(assert (=> d!117627 m!918113))

(declare-fun m!918115 () Bool)

(assert (=> d!117627 m!918115))

(declare-fun m!918117 () Bool)

(assert (=> b!990575 m!918117))

(declare-fun m!918119 () Bool)

(assert (=> b!990576 m!918119))

(assert (=> b!990323 d!117627))

(declare-fun d!117629 () Bool)

(assert (=> d!117629 (not (contains!5723 (+!3092 lt!439324 (tuple2!14917 lt!439325 lt!439320)) lt!439326))))

(declare-fun lt!439525 () Unit!32858)

(declare-fun choose!1617 (ListLongMap!13613 (_ BitVec 64) V!36043 (_ BitVec 64)) Unit!32858)

(assert (=> d!117629 (= lt!439525 (choose!1617 lt!439324 lt!439325 lt!439320 lt!439326))))

(declare-fun e!558558 () Bool)

(assert (=> d!117629 e!558558))

(declare-fun res!662310 () Bool)

(assert (=> d!117629 (=> (not res!662310) (not e!558558))))

(assert (=> d!117629 (= res!662310 (not (contains!5723 lt!439324 lt!439326)))))

(assert (=> d!117629 (= (addStillNotContains!236 lt!439324 lt!439325 lt!439320 lt!439326) lt!439525)))

(declare-fun b!990580 () Bool)

(assert (=> b!990580 (= e!558558 (not (= lt!439325 lt!439326)))))

(assert (= (and d!117629 res!662310) b!990580))

(assert (=> d!117629 m!917737))

(assert (=> d!117629 m!917737))

(assert (=> d!117629 m!917743))

(declare-fun m!918121 () Bool)

(assert (=> d!117629 m!918121))

(declare-fun m!918123 () Bool)

(assert (=> d!117629 m!918123))

(assert (=> b!990323 d!117629))

(declare-fun d!117631 () Bool)

(declare-fun c!100483 () Bool)

(assert (=> d!117631 (= c!100483 ((_ is ValueCellFull!11166) (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!558559 () V!36043)

(assert (=> d!117631 (= (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558559)))

(declare-fun b!990581 () Bool)

(assert (=> b!990581 (= e!558559 (get!15642 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990582 () Bool)

(assert (=> b!990582 (= e!558559 (get!15643 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117631 c!100483) b!990581))

(assert (= (and d!117631 (not c!100483)) b!990582))

(assert (=> b!990581 m!917727))

(assert (=> b!990581 m!917679))

(declare-fun m!918125 () Bool)

(assert (=> b!990581 m!918125))

(assert (=> b!990582 m!917727))

(assert (=> b!990582 m!917679))

(declare-fun m!918127 () Bool)

(assert (=> b!990582 m!918127))

(assert (=> b!990323 d!117631))

(declare-fun b!990584 () Bool)

(declare-fun e!558560 () Option!520)

(declare-fun e!558561 () Option!520)

(assert (=> b!990584 (= e!558560 e!558561)))

(declare-fun c!100485 () Bool)

(assert (=> b!990584 (= c!100485 (and ((_ is Cons!20842) (toList!6822 lt!439355)) (not (= (_1!7469 (h!22004 (toList!6822 lt!439355))) (_1!7469 lt!439289)))))))

(declare-fun d!117633 () Bool)

(declare-fun c!100484 () Bool)

(assert (=> d!117633 (= c!100484 (and ((_ is Cons!20842) (toList!6822 lt!439355)) (= (_1!7469 (h!22004 (toList!6822 lt!439355))) (_1!7469 lt!439289))))))

(assert (=> d!117633 (= (getValueByKey!514 (toList!6822 lt!439355) (_1!7469 lt!439289)) e!558560)))

(declare-fun b!990583 () Bool)

(assert (=> b!990583 (= e!558560 (Some!519 (_2!7469 (h!22004 (toList!6822 lt!439355)))))))

(declare-fun b!990585 () Bool)

(assert (=> b!990585 (= e!558561 (getValueByKey!514 (t!29821 (toList!6822 lt!439355)) (_1!7469 lt!439289)))))

(declare-fun b!990586 () Bool)

(assert (=> b!990586 (= e!558561 None!518)))

(assert (= (and d!117633 c!100484) b!990583))

(assert (= (and d!117633 (not c!100484)) b!990584))

(assert (= (and b!990584 c!100485) b!990585))

(assert (= (and b!990584 (not c!100485)) b!990586))

(declare-fun m!918129 () Bool)

(assert (=> b!990585 m!918129))

(assert (=> b!990360 d!117633))

(assert (=> bm!41994 d!117543))

(assert (=> b!990421 d!117555))

(assert (=> b!990333 d!117621))

(declare-fun d!117635 () Bool)

(declare-fun res!662311 () Bool)

(declare-fun e!558564 () Bool)

(assert (=> d!117635 (=> res!662311 e!558564)))

(assert (=> d!117635 (= res!662311 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30606 _keys!1544)))))

(assert (=> d!117635 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100417 (Cons!20841 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842)) e!558564)))

(declare-fun b!990587 () Bool)

(declare-fun e!558562 () Bool)

(assert (=> b!990587 (= e!558564 e!558562)))

(declare-fun res!662312 () Bool)

(assert (=> b!990587 (=> (not res!662312) (not e!558562))))

(declare-fun e!558565 () Bool)

(assert (=> b!990587 (= res!662312 (not e!558565))))

(declare-fun res!662313 () Bool)

(assert (=> b!990587 (=> (not res!662313) (not e!558565))))

(assert (=> b!990587 (= res!662313 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!990588 () Bool)

(assert (=> b!990588 (= e!558565 (contains!5724 (ite c!100417 (Cons!20841 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!42009 () Bool)

(declare-fun c!100486 () Bool)

(declare-fun call!42012 () Bool)

(assert (=> bm!42009 (= call!42012 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100486 (Cons!20841 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100417 (Cons!20841 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842)) (ite c!100417 (Cons!20841 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) Nil!20842) Nil!20842))))))

(declare-fun b!990589 () Bool)

(declare-fun e!558563 () Bool)

(assert (=> b!990589 (= e!558563 call!42012)))

(declare-fun b!990590 () Bool)

(assert (=> b!990590 (= e!558563 call!42012)))

(declare-fun b!990591 () Bool)

(assert (=> b!990591 (= e!558562 e!558563)))

(assert (=> b!990591 (= c!100486 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!117635 (not res!662311)) b!990587))

(assert (= (and b!990587 res!662313) b!990588))

(assert (= (and b!990587 res!662312) b!990591))

(assert (= (and b!990591 c!100486) b!990590))

(assert (= (and b!990591 (not c!100486)) b!990589))

(assert (= (or b!990590 b!990589) bm!42009))

(declare-fun m!918131 () Bool)

(assert (=> b!990587 m!918131))

(assert (=> b!990587 m!918131))

(declare-fun m!918133 () Bool)

(assert (=> b!990587 m!918133))

(assert (=> b!990588 m!918131))

(assert (=> b!990588 m!918131))

(declare-fun m!918135 () Bool)

(assert (=> b!990588 m!918135))

(assert (=> bm!42009 m!918131))

(declare-fun m!918137 () Bool)

(assert (=> bm!42009 m!918137))

(assert (=> b!990591 m!918131))

(assert (=> b!990591 m!918131))

(assert (=> b!990591 m!918133))

(assert (=> bm!41968 d!117635))

(declare-fun b!990592 () Bool)

(declare-fun e!558572 () Bool)

(assert (=> b!990592 (= e!558572 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!990592 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!990593 () Bool)

(declare-fun e!558569 () ListLongMap!13613)

(assert (=> b!990593 (= e!558569 (ListLongMap!13614 Nil!20843))))

(declare-fun b!990594 () Bool)

(declare-fun e!558570 () ListLongMap!13613)

(declare-fun call!42013 () ListLongMap!13613)

(assert (=> b!990594 (= e!558570 call!42013)))

(declare-fun b!990595 () Bool)

(declare-fun res!662317 () Bool)

(declare-fun e!558567 () Bool)

(assert (=> b!990595 (=> (not res!662317) (not e!558567))))

(declare-fun lt!439527 () ListLongMap!13613)

(assert (=> b!990595 (= res!662317 (not (contains!5723 lt!439527 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990596 () Bool)

(declare-fun e!558566 () Bool)

(declare-fun e!558568 () Bool)

(assert (=> b!990596 (= e!558566 e!558568)))

(assert (=> b!990596 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30606 _keys!1544)))))

(declare-fun res!662315 () Bool)

(assert (=> b!990596 (= res!662315 (contains!5723 lt!439527 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!990596 (=> (not res!662315) (not e!558568))))

(declare-fun d!117637 () Bool)

(assert (=> d!117637 e!558567))

(declare-fun res!662316 () Bool)

(assert (=> d!117637 (=> (not res!662316) (not e!558567))))

(assert (=> d!117637 (= res!662316 (not (contains!5723 lt!439527 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117637 (= lt!439527 e!558569)))

(declare-fun c!100490 () Bool)

(assert (=> d!117637 (= c!100490 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30606 _keys!1544)))))

(assert (=> d!117637 (validMask!0 mask!1948)))

(assert (=> d!117637 (= (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!439527)))

(declare-fun b!990597 () Bool)

(assert (=> b!990597 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30606 _keys!1544)))))

(assert (=> b!990597 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30607 _values!1278)))))

(assert (=> b!990597 (= e!558568 (= (apply!897 lt!439527 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990598 () Bool)

(declare-fun e!558571 () Bool)

(assert (=> b!990598 (= e!558566 e!558571)))

(declare-fun c!100489 () Bool)

(assert (=> b!990598 (= c!100489 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30606 _keys!1544)))))

(declare-fun b!990599 () Bool)

(assert (=> b!990599 (= e!558571 (isEmpty!726 lt!439527))))

(declare-fun b!990600 () Bool)

(assert (=> b!990600 (= e!558567 e!558566)))

(declare-fun c!100487 () Bool)

(assert (=> b!990600 (= c!100487 e!558572)))

(declare-fun res!662314 () Bool)

(assert (=> b!990600 (=> (not res!662314) (not e!558572))))

(assert (=> b!990600 (= res!662314 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30606 _keys!1544)))))

(declare-fun b!990601 () Bool)

(assert (=> b!990601 (= e!558569 e!558570)))

(declare-fun c!100488 () Bool)

(assert (=> b!990601 (= c!100488 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun b!990602 () Bool)

(declare-fun lt!439529 () Unit!32858)

(declare-fun lt!439528 () Unit!32858)

(assert (=> b!990602 (= lt!439529 lt!439528)))

(declare-fun lt!439530 () ListLongMap!13613)

(declare-fun lt!439532 () (_ BitVec 64))

(declare-fun lt!439526 () V!36043)

(declare-fun lt!439531 () (_ BitVec 64))

(assert (=> b!990602 (not (contains!5723 (+!3092 lt!439530 (tuple2!14917 lt!439531 lt!439526)) lt!439532))))

(assert (=> b!990602 (= lt!439528 (addStillNotContains!236 lt!439530 lt!439531 lt!439526 lt!439532))))

(assert (=> b!990602 (= lt!439532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990602 (= lt!439526 (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990602 (= lt!439531 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(assert (=> b!990602 (= lt!439530 call!42013)))

(assert (=> b!990602 (= e!558570 (+!3092 call!42013 (tuple2!14917 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15640 (select (arr!30128 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990603 () Bool)

(assert (=> b!990603 (= e!558571 (= lt!439527 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!42010 () Bool)

(assert (=> bm!42010 (= call!42013 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(assert (= (and d!117637 c!100490) b!990593))

(assert (= (and d!117637 (not c!100490)) b!990601))

(assert (= (and b!990601 c!100488) b!990602))

(assert (= (and b!990601 (not c!100488)) b!990594))

(assert (= (or b!990602 b!990594) bm!42010))

(assert (= (and d!117637 res!662316) b!990595))

(assert (= (and b!990595 res!662317) b!990600))

(assert (= (and b!990600 res!662314) b!990592))

(assert (= (and b!990600 c!100487) b!990596))

(assert (= (and b!990600 (not c!100487)) b!990598))

(assert (= (and b!990596 res!662315) b!990597))

(assert (= (and b!990598 c!100489) b!990603))

(assert (= (and b!990598 (not c!100489)) b!990599))

(declare-fun b_lambda!15181 () Bool)

(assert (=> (not b_lambda!15181) (not b!990597)))

(assert (=> b!990597 t!29819))

(declare-fun b_and!32245 () Bool)

(assert (= b_and!32243 (and (=> t!29819 result!13651) b_and!32245)))

(declare-fun b_lambda!15183 () Bool)

(assert (=> (not b_lambda!15183) (not b!990602)))

(assert (=> b!990602 t!29819))

(declare-fun b_and!32247 () Bool)

(assert (= b_and!32245 (and (=> t!29819 result!13651) b_and!32247)))

(declare-fun m!918139 () Bool)

(assert (=> b!990597 m!918139))

(assert (=> b!990597 m!917679))

(declare-fun m!918141 () Bool)

(assert (=> b!990597 m!918141))

(declare-fun m!918143 () Bool)

(assert (=> b!990597 m!918143))

(assert (=> b!990597 m!917679))

(assert (=> b!990597 m!918139))

(assert (=> b!990597 m!918143))

(declare-fun m!918145 () Bool)

(assert (=> b!990597 m!918145))

(assert (=> b!990596 m!918143))

(assert (=> b!990596 m!918143))

(declare-fun m!918147 () Bool)

(assert (=> b!990596 m!918147))

(assert (=> b!990602 m!918139))

(assert (=> b!990602 m!917679))

(assert (=> b!990602 m!918141))

(declare-fun m!918149 () Bool)

(assert (=> b!990602 m!918149))

(assert (=> b!990602 m!918143))

(declare-fun m!918151 () Bool)

(assert (=> b!990602 m!918151))

(declare-fun m!918153 () Bool)

(assert (=> b!990602 m!918153))

(assert (=> b!990602 m!917679))

(assert (=> b!990602 m!918149))

(declare-fun m!918155 () Bool)

(assert (=> b!990602 m!918155))

(assert (=> b!990602 m!918139))

(declare-fun m!918157 () Bool)

(assert (=> b!990599 m!918157))

(declare-fun m!918159 () Bool)

(assert (=> b!990603 m!918159))

(assert (=> bm!42010 m!918159))

(declare-fun m!918161 () Bool)

(assert (=> b!990595 m!918161))

(declare-fun m!918163 () Bool)

(assert (=> d!117637 m!918163))

(assert (=> d!117637 m!917665))

(assert (=> b!990592 m!918143))

(assert (=> b!990592 m!918143))

(declare-fun m!918165 () Bool)

(assert (=> b!990592 m!918165))

(assert (=> b!990601 m!918143))

(assert (=> b!990601 m!918143))

(assert (=> b!990601 m!918165))

(assert (=> bm!41962 d!117637))

(declare-fun d!117639 () Bool)

(assert (=> d!117639 (= (get!15642 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14268 (select (arr!30128 _values!1278) from!1932)))))

(assert (=> b!990287 d!117639))

(declare-fun d!117641 () Bool)

(assert (=> d!117641 (= (apply!897 lt!439436 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15644 (getValueByKey!514 (toList!6822 lt!439436) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28123 () Bool)

(assert (= bs!28123 d!117641))

(assert (=> bs!28123 m!918077))

(assert (=> bs!28123 m!918077))

(declare-fun m!918167 () Bool)

(assert (=> bs!28123 m!918167))

(assert (=> b!990436 d!117641))

(declare-fun d!117643 () Bool)

(assert (=> d!117643 (arrayContainsKey!0 _keys!1544 lt!439335 #b00000000000000000000000000000000)))

(declare-fun lt!439535 () Unit!32858)

(declare-fun choose!13 (array!62551 (_ BitVec 64) (_ BitVec 32)) Unit!32858)

(assert (=> d!117643 (= lt!439535 (choose!13 _keys!1544 lt!439335 #b00000000000000000000000000000000))))

(assert (=> d!117643 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117643 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439335 #b00000000000000000000000000000000) lt!439535)))

(declare-fun bs!28124 () Bool)

(assert (= bs!28124 d!117643))

(assert (=> bs!28124 m!917763))

(declare-fun m!918169 () Bool)

(assert (=> bs!28124 m!918169))

(assert (=> b!990336 d!117643))

(declare-fun d!117645 () Bool)

(declare-fun res!662322 () Bool)

(declare-fun e!558577 () Bool)

(assert (=> d!117645 (=> res!662322 e!558577)))

(assert (=> d!117645 (= res!662322 (= (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) lt!439335))))

(assert (=> d!117645 (= (arrayContainsKey!0 _keys!1544 lt!439335 #b00000000000000000000000000000000) e!558577)))

(declare-fun b!990608 () Bool)

(declare-fun e!558578 () Bool)

(assert (=> b!990608 (= e!558577 e!558578)))

(declare-fun res!662323 () Bool)

(assert (=> b!990608 (=> (not res!662323) (not e!558578))))

(assert (=> b!990608 (= res!662323 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30606 _keys!1544)))))

(declare-fun b!990609 () Bool)

(assert (=> b!990609 (= e!558578 (arrayContainsKey!0 _keys!1544 lt!439335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117645 (not res!662322)) b!990608))

(assert (= (and b!990608 res!662323) b!990609))

(assert (=> d!117645 m!917755))

(declare-fun m!918171 () Bool)

(assert (=> b!990609 m!918171))

(assert (=> b!990336 d!117645))

(declare-fun b!990622 () Bool)

(declare-fun e!558586 () SeekEntryResult!9212)

(declare-fun lt!439543 () SeekEntryResult!9212)

(assert (=> b!990622 (= e!558586 (MissingZero!9212 (index!39221 lt!439543)))))

(declare-fun b!990623 () Bool)

(declare-fun e!558587 () SeekEntryResult!9212)

(declare-fun e!558585 () SeekEntryResult!9212)

(assert (=> b!990623 (= e!558587 e!558585)))

(declare-fun lt!439542 () (_ BitVec 64))

(assert (=> b!990623 (= lt!439542 (select (arr!30127 _keys!1544) (index!39221 lt!439543)))))

(declare-fun c!100498 () Bool)

(assert (=> b!990623 (= c!100498 (= lt!439542 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990624 () Bool)

(declare-fun c!100497 () Bool)

(assert (=> b!990624 (= c!100497 (= lt!439542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990624 (= e!558585 e!558586)))

(declare-fun d!117647 () Bool)

(declare-fun lt!439544 () SeekEntryResult!9212)

(assert (=> d!117647 (and (or ((_ is Undefined!9212) lt!439544) (not ((_ is Found!9212) lt!439544)) (and (bvsge (index!39220 lt!439544) #b00000000000000000000000000000000) (bvslt (index!39220 lt!439544) (size!30606 _keys!1544)))) (or ((_ is Undefined!9212) lt!439544) ((_ is Found!9212) lt!439544) (not ((_ is MissingZero!9212) lt!439544)) (and (bvsge (index!39219 lt!439544) #b00000000000000000000000000000000) (bvslt (index!39219 lt!439544) (size!30606 _keys!1544)))) (or ((_ is Undefined!9212) lt!439544) ((_ is Found!9212) lt!439544) ((_ is MissingZero!9212) lt!439544) (not ((_ is MissingVacant!9212) lt!439544)) (and (bvsge (index!39222 lt!439544) #b00000000000000000000000000000000) (bvslt (index!39222 lt!439544) (size!30606 _keys!1544)))) (or ((_ is Undefined!9212) lt!439544) (ite ((_ is Found!9212) lt!439544) (= (select (arr!30127 _keys!1544) (index!39220 lt!439544)) (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9212) lt!439544) (= (select (arr!30127 _keys!1544) (index!39219 lt!439544)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9212) lt!439544) (= (select (arr!30127 _keys!1544) (index!39222 lt!439544)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117647 (= lt!439544 e!558587)))

(declare-fun c!100499 () Bool)

(assert (=> d!117647 (= c!100499 (and ((_ is Intermediate!9212) lt!439543) (undefined!10024 lt!439543)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62551 (_ BitVec 32)) SeekEntryResult!9212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117647 (= lt!439543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117647 (validMask!0 mask!1948)))

(assert (=> d!117647 (= (seekEntryOrOpen!0 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!439544)))

(declare-fun b!990625 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62551 (_ BitVec 32)) SeekEntryResult!9212)

(assert (=> b!990625 (= e!558586 (seekKeyOrZeroReturnVacant!0 (x!86186 lt!439543) (index!39221 lt!439543) (index!39221 lt!439543) (select (arr!30127 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!990626 () Bool)

(assert (=> b!990626 (= e!558585 (Found!9212 (index!39221 lt!439543)))))

(declare-fun b!990627 () Bool)

(assert (=> b!990627 (= e!558587 Undefined!9212)))

(assert (= (and d!117647 c!100499) b!990627))

(assert (= (and d!117647 (not c!100499)) b!990623))

(assert (= (and b!990623 c!100498) b!990626))

(assert (= (and b!990623 (not c!100498)) b!990624))

(assert (= (and b!990624 c!100497) b!990622))

(assert (= (and b!990624 (not c!100497)) b!990625))

(declare-fun m!918173 () Bool)

(assert (=> b!990623 m!918173))

(declare-fun m!918175 () Bool)

(assert (=> d!117647 m!918175))

(assert (=> d!117647 m!917665))

(declare-fun m!918177 () Bool)

(assert (=> d!117647 m!918177))

(assert (=> d!117647 m!917755))

(declare-fun m!918179 () Bool)

(assert (=> d!117647 m!918179))

(declare-fun m!918181 () Bool)

(assert (=> d!117647 m!918181))

(assert (=> d!117647 m!918179))

(assert (=> d!117647 m!917755))

(declare-fun m!918183 () Bool)

(assert (=> d!117647 m!918183))

(assert (=> b!990625 m!917755))

(declare-fun m!918185 () Bool)

(assert (=> b!990625 m!918185))

(assert (=> b!990336 d!117647))

(declare-fun d!117649 () Bool)

(declare-fun e!558588 () Bool)

(assert (=> d!117649 e!558588))

(declare-fun res!662324 () Bool)

(assert (=> d!117649 (=> res!662324 e!558588)))

(declare-fun lt!439548 () Bool)

(assert (=> d!117649 (= res!662324 (not lt!439548))))

(declare-fun lt!439547 () Bool)

(assert (=> d!117649 (= lt!439548 lt!439547)))

(declare-fun lt!439546 () Unit!32858)

(declare-fun e!558589 () Unit!32858)

(assert (=> d!117649 (= lt!439546 e!558589)))

(declare-fun c!100500 () Bool)

(assert (=> d!117649 (= c!100500 lt!439547)))

(assert (=> d!117649 (= lt!439547 (containsKey!479 (toList!6822 lt!439414) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117649 (= (contains!5723 lt!439414 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439548)))

(declare-fun b!990628 () Bool)

(declare-fun lt!439545 () Unit!32858)

(assert (=> b!990628 (= e!558589 lt!439545)))

(assert (=> b!990628 (= lt!439545 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439414) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990628 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439414) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990629 () Bool)

(declare-fun Unit!32871 () Unit!32858)

(assert (=> b!990629 (= e!558589 Unit!32871)))

(declare-fun b!990630 () Bool)

(assert (=> b!990630 (= e!558588 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439414) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117649 c!100500) b!990628))

(assert (= (and d!117649 (not c!100500)) b!990629))

(assert (= (and d!117649 (not res!662324)) b!990630))

(declare-fun m!918187 () Bool)

(assert (=> d!117649 m!918187))

(declare-fun m!918189 () Bool)

(assert (=> b!990628 m!918189))

(declare-fun m!918191 () Bool)

(assert (=> b!990628 m!918191))

(assert (=> b!990628 m!918191))

(declare-fun m!918193 () Bool)

(assert (=> b!990628 m!918193))

(assert (=> b!990630 m!918191))

(assert (=> b!990630 m!918191))

(assert (=> b!990630 m!918193))

(assert (=> bm!41985 d!117649))

(declare-fun d!117651 () Bool)

(assert (=> d!117651 (= (apply!897 lt!439414 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15644 (getValueByKey!514 (toList!6822 lt!439414) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28125 () Bool)

(assert (= bs!28125 d!117651))

(assert (=> bs!28125 m!917979))

(assert (=> bs!28125 m!917979))

(declare-fun m!918195 () Bool)

(assert (=> bs!28125 m!918195))

(assert (=> b!990409 d!117651))

(declare-fun d!117653 () Bool)

(declare-fun e!558590 () Bool)

(assert (=> d!117653 e!558590))

(declare-fun res!662325 () Bool)

(assert (=> d!117653 (=> res!662325 e!558590)))

(declare-fun lt!439552 () Bool)

(assert (=> d!117653 (= res!662325 (not lt!439552))))

(declare-fun lt!439551 () Bool)

(assert (=> d!117653 (= lt!439552 lt!439551)))

(declare-fun lt!439550 () Unit!32858)

(declare-fun e!558591 () Unit!32858)

(assert (=> d!117653 (= lt!439550 e!558591)))

(declare-fun c!100501 () Bool)

(assert (=> d!117653 (= c!100501 lt!439551)))

(assert (=> d!117653 (= lt!439551 (containsKey!479 (toList!6822 lt!439347) (_1!7469 lt!439289)))))

(assert (=> d!117653 (= (contains!5723 lt!439347 (_1!7469 lt!439289)) lt!439552)))

(declare-fun b!990631 () Bool)

(declare-fun lt!439549 () Unit!32858)

(assert (=> b!990631 (= e!558591 lt!439549)))

(assert (=> b!990631 (= lt!439549 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439347) (_1!7469 lt!439289)))))

(assert (=> b!990631 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439347) (_1!7469 lt!439289)))))

(declare-fun b!990632 () Bool)

(declare-fun Unit!32872 () Unit!32858)

(assert (=> b!990632 (= e!558591 Unit!32872)))

(declare-fun b!990633 () Bool)

(assert (=> b!990633 (= e!558590 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439347) (_1!7469 lt!439289))))))

(assert (= (and d!117653 c!100501) b!990631))

(assert (= (and d!117653 (not c!100501)) b!990632))

(assert (= (and d!117653 (not res!662325)) b!990633))

(declare-fun m!918197 () Bool)

(assert (=> d!117653 m!918197))

(declare-fun m!918199 () Bool)

(assert (=> b!990631 m!918199))

(assert (=> b!990631 m!917779))

(assert (=> b!990631 m!917779))

(declare-fun m!918201 () Bool)

(assert (=> b!990631 m!918201))

(assert (=> b!990633 m!917779))

(assert (=> b!990633 m!917779))

(assert (=> b!990633 m!918201))

(assert (=> d!117557 d!117653))

(declare-fun b!990635 () Bool)

(declare-fun e!558592 () Option!520)

(declare-fun e!558593 () Option!520)

(assert (=> b!990635 (= e!558592 e!558593)))

(declare-fun c!100503 () Bool)

(assert (=> b!990635 (= c!100503 (and ((_ is Cons!20842) lt!439345) (not (= (_1!7469 (h!22004 lt!439345)) (_1!7469 lt!439289)))))))

(declare-fun d!117655 () Bool)

(declare-fun c!100502 () Bool)

(assert (=> d!117655 (= c!100502 (and ((_ is Cons!20842) lt!439345) (= (_1!7469 (h!22004 lt!439345)) (_1!7469 lt!439289))))))

(assert (=> d!117655 (= (getValueByKey!514 lt!439345 (_1!7469 lt!439289)) e!558592)))

(declare-fun b!990634 () Bool)

(assert (=> b!990634 (= e!558592 (Some!519 (_2!7469 (h!22004 lt!439345))))))

(declare-fun b!990636 () Bool)

(assert (=> b!990636 (= e!558593 (getValueByKey!514 (t!29821 lt!439345) (_1!7469 lt!439289)))))

(declare-fun b!990637 () Bool)

(assert (=> b!990637 (= e!558593 None!518)))

(assert (= (and d!117655 c!100502) b!990634))

(assert (= (and d!117655 (not c!100502)) b!990635))

(assert (= (and b!990635 c!100503) b!990636))

(assert (= (and b!990635 (not c!100503)) b!990637))

(declare-fun m!918203 () Bool)

(assert (=> b!990636 m!918203))

(assert (=> d!117557 d!117655))

(declare-fun d!117657 () Bool)

(assert (=> d!117657 (= (getValueByKey!514 lt!439345 (_1!7469 lt!439289)) (Some!519 (_2!7469 lt!439289)))))

(declare-fun lt!439553 () Unit!32858)

(assert (=> d!117657 (= lt!439553 (choose!1616 lt!439345 (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(declare-fun e!558594 () Bool)

(assert (=> d!117657 e!558594))

(declare-fun res!662326 () Bool)

(assert (=> d!117657 (=> (not res!662326) (not e!558594))))

(assert (=> d!117657 (= res!662326 (isStrictlySorted!517 lt!439345))))

(assert (=> d!117657 (= (lemmaContainsTupThenGetReturnValue!273 lt!439345 (_1!7469 lt!439289) (_2!7469 lt!439289)) lt!439553)))

(declare-fun b!990638 () Bool)

(declare-fun res!662327 () Bool)

(assert (=> b!990638 (=> (not res!662327) (not e!558594))))

(assert (=> b!990638 (= res!662327 (containsKey!479 lt!439345 (_1!7469 lt!439289)))))

(declare-fun b!990639 () Bool)

(assert (=> b!990639 (= e!558594 (contains!5725 lt!439345 (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289))))))

(assert (= (and d!117657 res!662326) b!990638))

(assert (= (and b!990638 res!662327) b!990639))

(assert (=> d!117657 m!917773))

(declare-fun m!918205 () Bool)

(assert (=> d!117657 m!918205))

(declare-fun m!918207 () Bool)

(assert (=> d!117657 m!918207))

(declare-fun m!918209 () Bool)

(assert (=> b!990638 m!918209))

(declare-fun m!918211 () Bool)

(assert (=> b!990639 m!918211))

(assert (=> d!117557 d!117657))

(declare-fun c!100505 () Bool)

(declare-fun c!100507 () Bool)

(declare-fun e!558595 () List!20846)

(declare-fun b!990640 () Bool)

(assert (=> b!990640 (= e!558595 (ite c!100505 (t!29821 (toList!6822 lt!439287)) (ite c!100507 (Cons!20842 (h!22004 (toList!6822 lt!439287)) (t!29821 (toList!6822 lt!439287))) Nil!20843)))))

(declare-fun b!990641 () Bool)

(declare-fun e!558598 () List!20846)

(declare-fun e!558599 () List!20846)

(assert (=> b!990641 (= e!558598 e!558599)))

(assert (=> b!990641 (= c!100505 (and ((_ is Cons!20842) (toList!6822 lt!439287)) (= (_1!7469 (h!22004 (toList!6822 lt!439287))) (_1!7469 lt!439289))))))

(declare-fun b!990642 () Bool)

(declare-fun call!42016 () List!20846)

(assert (=> b!990642 (= e!558599 call!42016)))

(declare-fun b!990643 () Bool)

(assert (=> b!990643 (= c!100507 (and ((_ is Cons!20842) (toList!6822 lt!439287)) (bvsgt (_1!7469 (h!22004 (toList!6822 lt!439287))) (_1!7469 lt!439289))))))

(declare-fun e!558597 () List!20846)

(assert (=> b!990643 (= e!558599 e!558597)))

(declare-fun b!990644 () Bool)

(declare-fun e!558596 () Bool)

(declare-fun lt!439554 () List!20846)

(assert (=> b!990644 (= e!558596 (contains!5725 lt!439554 (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289))))))

(declare-fun b!990645 () Bool)

(declare-fun call!42015 () List!20846)

(assert (=> b!990645 (= e!558597 call!42015)))

(declare-fun b!990646 () Bool)

(assert (=> b!990646 (= e!558597 call!42015)))

(declare-fun bm!42011 () Bool)

(declare-fun call!42014 () List!20846)

(assert (=> bm!42011 (= call!42016 call!42014)))

(declare-fun b!990647 () Bool)

(assert (=> b!990647 (= e!558595 (insertStrictlySorted!330 (t!29821 (toList!6822 lt!439287)) (_1!7469 lt!439289) (_2!7469 lt!439289)))))

(declare-fun b!990648 () Bool)

(assert (=> b!990648 (= e!558598 call!42014)))

(declare-fun b!990649 () Bool)

(declare-fun res!662328 () Bool)

(assert (=> b!990649 (=> (not res!662328) (not e!558596))))

(assert (=> b!990649 (= res!662328 (containsKey!479 lt!439554 (_1!7469 lt!439289)))))

(declare-fun c!100506 () Bool)

(declare-fun bm!42013 () Bool)

(assert (=> bm!42013 (= call!42014 ($colon$colon!556 e!558595 (ite c!100506 (h!22004 (toList!6822 lt!439287)) (tuple2!14917 (_1!7469 lt!439289) (_2!7469 lt!439289)))))))

(declare-fun c!100504 () Bool)

(assert (=> bm!42013 (= c!100504 c!100506)))

(declare-fun d!117659 () Bool)

(assert (=> d!117659 e!558596))

(declare-fun res!662329 () Bool)

(assert (=> d!117659 (=> (not res!662329) (not e!558596))))

(assert (=> d!117659 (= res!662329 (isStrictlySorted!517 lt!439554))))

(assert (=> d!117659 (= lt!439554 e!558598)))

(assert (=> d!117659 (= c!100506 (and ((_ is Cons!20842) (toList!6822 lt!439287)) (bvslt (_1!7469 (h!22004 (toList!6822 lt!439287))) (_1!7469 lt!439289))))))

(assert (=> d!117659 (isStrictlySorted!517 (toList!6822 lt!439287))))

(assert (=> d!117659 (= (insertStrictlySorted!330 (toList!6822 lt!439287) (_1!7469 lt!439289) (_2!7469 lt!439289)) lt!439554)))

(declare-fun bm!42012 () Bool)

(assert (=> bm!42012 (= call!42015 call!42016)))

(assert (= (and d!117659 c!100506) b!990648))

(assert (= (and d!117659 (not c!100506)) b!990641))

(assert (= (and b!990641 c!100505) b!990642))

(assert (= (and b!990641 (not c!100505)) b!990643))

(assert (= (and b!990643 c!100507) b!990645))

(assert (= (and b!990643 (not c!100507)) b!990646))

(assert (= (or b!990645 b!990646) bm!42012))

(assert (= (or b!990642 bm!42012) bm!42011))

(assert (= (or b!990648 bm!42011) bm!42013))

(assert (= (and bm!42013 c!100504) b!990647))

(assert (= (and bm!42013 (not c!100504)) b!990640))

(assert (= (and d!117659 res!662329) b!990649))

(assert (= (and b!990649 res!662328) b!990644))

(declare-fun m!918213 () Bool)

(assert (=> b!990649 m!918213))

(declare-fun m!918215 () Bool)

(assert (=> bm!42013 m!918215))

(declare-fun m!918217 () Bool)

(assert (=> b!990647 m!918217))

(declare-fun m!918219 () Bool)

(assert (=> d!117659 m!918219))

(declare-fun m!918221 () Bool)

(assert (=> d!117659 m!918221))

(declare-fun m!918223 () Bool)

(assert (=> b!990644 m!918223))

(assert (=> d!117557 d!117659))

(declare-fun d!117661 () Bool)

(declare-fun e!558600 () Bool)

(assert (=> d!117661 e!558600))

(declare-fun res!662330 () Bool)

(assert (=> d!117661 (=> res!662330 e!558600)))

(declare-fun lt!439558 () Bool)

(assert (=> d!117661 (= res!662330 (not lt!439558))))

(declare-fun lt!439557 () Bool)

(assert (=> d!117661 (= lt!439558 lt!439557)))

(declare-fun lt!439556 () Unit!32858)

(declare-fun e!558601 () Unit!32858)

(assert (=> d!117661 (= lt!439556 e!558601)))

(declare-fun c!100508 () Bool)

(assert (=> d!117661 (= c!100508 lt!439557)))

(assert (=> d!117661 (= lt!439557 (containsKey!479 (toList!6822 lt!439436) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117661 (= (contains!5723 lt!439436 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439558)))

(declare-fun b!990650 () Bool)

(declare-fun lt!439555 () Unit!32858)

(assert (=> b!990650 (= e!558601 lt!439555)))

(assert (=> b!990650 (= lt!439555 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439436) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990650 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439436) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990651 () Bool)

(declare-fun Unit!32873 () Unit!32858)

(assert (=> b!990651 (= e!558601 Unit!32873)))

(declare-fun b!990652 () Bool)

(assert (=> b!990652 (= e!558600 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439436) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117661 c!100508) b!990650))

(assert (= (and d!117661 (not c!100508)) b!990651))

(assert (= (and d!117661 (not res!662330)) b!990652))

(assert (=> d!117661 m!917731))

(declare-fun m!918225 () Bool)

(assert (=> d!117661 m!918225))

(assert (=> b!990650 m!917731))

(declare-fun m!918227 () Bool)

(assert (=> b!990650 m!918227))

(assert (=> b!990650 m!917731))

(declare-fun m!918229 () Bool)

(assert (=> b!990650 m!918229))

(assert (=> b!990650 m!918229))

(declare-fun m!918231 () Bool)

(assert (=> b!990650 m!918231))

(assert (=> b!990652 m!917731))

(assert (=> b!990652 m!918229))

(assert (=> b!990652 m!918229))

(assert (=> b!990652 m!918231))

(assert (=> b!990441 d!117661))

(declare-fun b!990653 () Bool)

(declare-fun e!558608 () Bool)

(assert (=> b!990653 (= e!558608 (validKeyInArray!0 (select (arr!30127 _keys!1544) from!1932)))))

(assert (=> b!990653 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun b!990654 () Bool)

(declare-fun e!558605 () ListLongMap!13613)

(assert (=> b!990654 (= e!558605 (ListLongMap!13614 Nil!20843))))

(declare-fun b!990655 () Bool)

(declare-fun e!558606 () ListLongMap!13613)

(declare-fun call!42017 () ListLongMap!13613)

(assert (=> b!990655 (= e!558606 call!42017)))

(declare-fun b!990656 () Bool)

(declare-fun res!662334 () Bool)

(declare-fun e!558603 () Bool)

(assert (=> b!990656 (=> (not res!662334) (not e!558603))))

(declare-fun lt!439560 () ListLongMap!13613)

(assert (=> b!990656 (= res!662334 (not (contains!5723 lt!439560 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990657 () Bool)

(declare-fun e!558602 () Bool)

(declare-fun e!558604 () Bool)

(assert (=> b!990657 (= e!558602 e!558604)))

(assert (=> b!990657 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30606 _keys!1544)))))

(declare-fun res!662332 () Bool)

(assert (=> b!990657 (= res!662332 (contains!5723 lt!439560 (select (arr!30127 _keys!1544) from!1932)))))

(assert (=> b!990657 (=> (not res!662332) (not e!558604))))

(declare-fun d!117663 () Bool)

(assert (=> d!117663 e!558603))

(declare-fun res!662333 () Bool)

(assert (=> d!117663 (=> (not res!662333) (not e!558603))))

(assert (=> d!117663 (= res!662333 (not (contains!5723 lt!439560 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117663 (= lt!439560 e!558605)))

(declare-fun c!100512 () Bool)

(assert (=> d!117663 (= c!100512 (bvsge from!1932 (size!30606 _keys!1544)))))

(assert (=> d!117663 (validMask!0 mask!1948)))

(assert (=> d!117663 (= (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439560)))

(declare-fun b!990658 () Bool)

(assert (=> b!990658 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30606 _keys!1544)))))

(assert (=> b!990658 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30607 _values!1278)))))

(assert (=> b!990658 (= e!558604 (= (apply!897 lt!439560 (select (arr!30127 _keys!1544) from!1932)) (get!15640 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990659 () Bool)

(declare-fun e!558607 () Bool)

(assert (=> b!990659 (= e!558602 e!558607)))

(declare-fun c!100511 () Bool)

(assert (=> b!990659 (= c!100511 (bvslt from!1932 (size!30606 _keys!1544)))))

(declare-fun b!990660 () Bool)

(assert (=> b!990660 (= e!558607 (isEmpty!726 lt!439560))))

(declare-fun b!990661 () Bool)

(assert (=> b!990661 (= e!558603 e!558602)))

(declare-fun c!100509 () Bool)

(assert (=> b!990661 (= c!100509 e!558608)))

(declare-fun res!662331 () Bool)

(assert (=> b!990661 (=> (not res!662331) (not e!558608))))

(assert (=> b!990661 (= res!662331 (bvslt from!1932 (size!30606 _keys!1544)))))

(declare-fun b!990662 () Bool)

(assert (=> b!990662 (= e!558605 e!558606)))

(declare-fun c!100510 () Bool)

(assert (=> b!990662 (= c!100510 (validKeyInArray!0 (select (arr!30127 _keys!1544) from!1932)))))

(declare-fun b!990663 () Bool)

(declare-fun lt!439562 () Unit!32858)

(declare-fun lt!439561 () Unit!32858)

(assert (=> b!990663 (= lt!439562 lt!439561)))

(declare-fun lt!439564 () (_ BitVec 64))

(declare-fun lt!439563 () ListLongMap!13613)

(declare-fun lt!439565 () (_ BitVec 64))

(declare-fun lt!439559 () V!36043)

(assert (=> b!990663 (not (contains!5723 (+!3092 lt!439563 (tuple2!14917 lt!439564 lt!439559)) lt!439565))))

(assert (=> b!990663 (= lt!439561 (addStillNotContains!236 lt!439563 lt!439564 lt!439559 lt!439565))))

(assert (=> b!990663 (= lt!439565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990663 (= lt!439559 (get!15640 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990663 (= lt!439564 (select (arr!30127 _keys!1544) from!1932))))

(assert (=> b!990663 (= lt!439563 call!42017)))

(assert (=> b!990663 (= e!558606 (+!3092 call!42017 (tuple2!14917 (select (arr!30127 _keys!1544) from!1932) (get!15640 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990664 () Bool)

(assert (=> b!990664 (= e!558607 (= lt!439560 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!42014 () Bool)

(assert (=> bm!42014 (= call!42017 (getCurrentListMapNoExtraKeys!3510 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(assert (= (and d!117663 c!100512) b!990654))

(assert (= (and d!117663 (not c!100512)) b!990662))

(assert (= (and b!990662 c!100510) b!990663))

(assert (= (and b!990662 (not c!100510)) b!990655))

(assert (= (or b!990663 b!990655) bm!42014))

(assert (= (and d!117663 res!662333) b!990656))

(assert (= (and b!990656 res!662334) b!990661))

(assert (= (and b!990661 res!662331) b!990653))

(assert (= (and b!990661 c!100509) b!990657))

(assert (= (and b!990661 (not c!100509)) b!990659))

(assert (= (and b!990657 res!662332) b!990658))

(assert (= (and b!990659 c!100511) b!990664))

(assert (= (and b!990659 (not c!100511)) b!990660))

(declare-fun b_lambda!15185 () Bool)

(assert (=> (not b_lambda!15185) (not b!990658)))

(assert (=> b!990658 t!29819))

(declare-fun b_and!32249 () Bool)

(assert (= b_and!32247 (and (=> t!29819 result!13651) b_and!32249)))

(declare-fun b_lambda!15187 () Bool)

(assert (=> (not b_lambda!15187) (not b!990663)))

(assert (=> b!990663 t!29819))

(declare-fun b_and!32251 () Bool)

(assert (= b_and!32249 (and (=> t!29819 result!13651) b_and!32251)))

(assert (=> b!990658 m!917675))

(assert (=> b!990658 m!917679))

(assert (=> b!990658 m!917681))

(assert (=> b!990658 m!917643))

(assert (=> b!990658 m!917679))

(assert (=> b!990658 m!917675))

(assert (=> b!990658 m!917643))

(declare-fun m!918233 () Bool)

(assert (=> b!990658 m!918233))

(assert (=> b!990657 m!917643))

(assert (=> b!990657 m!917643))

(declare-fun m!918235 () Bool)

(assert (=> b!990657 m!918235))

(assert (=> b!990663 m!917675))

(assert (=> b!990663 m!917679))

(assert (=> b!990663 m!917681))

(declare-fun m!918237 () Bool)

(assert (=> b!990663 m!918237))

(assert (=> b!990663 m!917643))

(declare-fun m!918239 () Bool)

(assert (=> b!990663 m!918239))

(declare-fun m!918241 () Bool)

(assert (=> b!990663 m!918241))

(assert (=> b!990663 m!917679))

(assert (=> b!990663 m!918237))

(declare-fun m!918243 () Bool)

(assert (=> b!990663 m!918243))

(assert (=> b!990663 m!917675))

(declare-fun m!918245 () Bool)

(assert (=> b!990660 m!918245))

(declare-fun m!918247 () Bool)

(assert (=> b!990664 m!918247))

(assert (=> bm!42014 m!918247))

(declare-fun m!918249 () Bool)

(assert (=> b!990656 m!918249))

(declare-fun m!918251 () Bool)

(assert (=> d!117663 m!918251))

(assert (=> d!117663 m!917665))

(assert (=> b!990653 m!917643))

(assert (=> b!990653 m!917643))

(assert (=> b!990653 m!917663))

(assert (=> b!990662 m!917643))

(assert (=> b!990662 m!917643))

(assert (=> b!990662 m!917663))

(assert (=> bm!41987 d!117663))

(declare-fun d!117665 () Bool)

(declare-fun lt!439568 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!422 (List!20846) (InoxSet tuple2!14916))

(assert (=> d!117665 (= lt!439568 (select (content!422 (toList!6822 lt!439450)) lt!439290))))

(declare-fun e!558613 () Bool)

(assert (=> d!117665 (= lt!439568 e!558613)))

(declare-fun res!662339 () Bool)

(assert (=> d!117665 (=> (not res!662339) (not e!558613))))

(assert (=> d!117665 (= res!662339 ((_ is Cons!20842) (toList!6822 lt!439450)))))

(assert (=> d!117665 (= (contains!5725 (toList!6822 lt!439450) lt!439290) lt!439568)))

(declare-fun b!990669 () Bool)

(declare-fun e!558614 () Bool)

(assert (=> b!990669 (= e!558613 e!558614)))

(declare-fun res!662340 () Bool)

(assert (=> b!990669 (=> res!662340 e!558614)))

(assert (=> b!990669 (= res!662340 (= (h!22004 (toList!6822 lt!439450)) lt!439290))))

(declare-fun b!990670 () Bool)

(assert (=> b!990670 (= e!558614 (contains!5725 (t!29821 (toList!6822 lt!439450)) lt!439290))))

(assert (= (and d!117665 res!662339) b!990669))

(assert (= (and b!990669 (not res!662340)) b!990670))

(declare-fun m!918253 () Bool)

(assert (=> d!117665 m!918253))

(declare-fun m!918255 () Bool)

(assert (=> d!117665 m!918255))

(declare-fun m!918257 () Bool)

(assert (=> b!990670 m!918257))

(assert (=> b!990447 d!117665))

(declare-fun d!117667 () Bool)

(declare-fun e!558615 () Bool)

(assert (=> d!117667 e!558615))

(declare-fun res!662341 () Bool)

(assert (=> d!117667 (=> res!662341 e!558615)))

(declare-fun lt!439572 () Bool)

(assert (=> d!117667 (= res!662341 (not lt!439572))))

(declare-fun lt!439571 () Bool)

(assert (=> d!117667 (= lt!439572 lt!439571)))

(declare-fun lt!439570 () Unit!32858)

(declare-fun e!558616 () Unit!32858)

(assert (=> d!117667 (= lt!439570 e!558616)))

(declare-fun c!100513 () Bool)

(assert (=> d!117667 (= c!100513 lt!439571)))

(assert (=> d!117667 (= lt!439571 (containsKey!479 (toList!6822 lt!439321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117667 (= (contains!5723 lt!439321 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439572)))

(declare-fun b!990671 () Bool)

(declare-fun lt!439569 () Unit!32858)

(assert (=> b!990671 (= e!558616 lt!439569)))

(assert (=> b!990671 (= lt!439569 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990671 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990672 () Bool)

(declare-fun Unit!32874 () Unit!32858)

(assert (=> b!990672 (= e!558616 Unit!32874)))

(declare-fun b!990673 () Bool)

(assert (=> b!990673 (= e!558615 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117667 c!100513) b!990671))

(assert (= (and d!117667 (not c!100513)) b!990672))

(assert (= (and d!117667 (not res!662341)) b!990673))

(declare-fun m!918259 () Bool)

(assert (=> d!117667 m!918259))

(declare-fun m!918261 () Bool)

(assert (=> b!990671 m!918261))

(declare-fun m!918263 () Bool)

(assert (=> b!990671 m!918263))

(assert (=> b!990671 m!918263))

(declare-fun m!918265 () Bool)

(assert (=> b!990671 m!918265))

(assert (=> b!990673 m!918263))

(assert (=> b!990673 m!918263))

(assert (=> b!990673 m!918265))

(assert (=> b!990316 d!117667))

(declare-fun d!117669 () Bool)

(declare-fun lt!439573 () Bool)

(assert (=> d!117669 (= lt!439573 (select (content!422 (toList!6822 lt!439454)) lt!439290))))

(declare-fun e!558617 () Bool)

(assert (=> d!117669 (= lt!439573 e!558617)))

(declare-fun res!662342 () Bool)

(assert (=> d!117669 (=> (not res!662342) (not e!558617))))

(assert (=> d!117669 (= res!662342 ((_ is Cons!20842) (toList!6822 lt!439454)))))

(assert (=> d!117669 (= (contains!5725 (toList!6822 lt!439454) lt!439290) lt!439573)))

(declare-fun b!990674 () Bool)

(declare-fun e!558618 () Bool)

(assert (=> b!990674 (= e!558617 e!558618)))

(declare-fun res!662343 () Bool)

(assert (=> b!990674 (=> res!662343 e!558618)))

(assert (=> b!990674 (= res!662343 (= (h!22004 (toList!6822 lt!439454)) lt!439290))))

(declare-fun b!990675 () Bool)

(assert (=> b!990675 (= e!558618 (contains!5725 (t!29821 (toList!6822 lt!439454)) lt!439290))))

(assert (= (and d!117669 res!662342) b!990674))

(assert (= (and b!990674 (not res!662343)) b!990675))

(declare-fun m!918267 () Bool)

(assert (=> d!117669 m!918267))

(declare-fun m!918269 () Bool)

(assert (=> d!117669 m!918269))

(declare-fun m!918271 () Bool)

(assert (=> b!990675 m!918271))

(assert (=> b!990449 d!117669))

(declare-fun d!117671 () Bool)

(assert (=> d!117671 (= (apply!897 (+!3092 lt!439434 (tuple2!14917 lt!439441 minValue!1220)) lt!439433) (apply!897 lt!439434 lt!439433))))

(declare-fun lt!439576 () Unit!32858)

(declare-fun choose!1618 (ListLongMap!13613 (_ BitVec 64) V!36043 (_ BitVec 64)) Unit!32858)

(assert (=> d!117671 (= lt!439576 (choose!1618 lt!439434 lt!439441 minValue!1220 lt!439433))))

(declare-fun e!558621 () Bool)

(assert (=> d!117671 e!558621))

(declare-fun res!662346 () Bool)

(assert (=> d!117671 (=> (not res!662346) (not e!558621))))

(assert (=> d!117671 (= res!662346 (contains!5723 lt!439434 lt!439433))))

(assert (=> d!117671 (= (addApplyDifferent!476 lt!439434 lt!439441 minValue!1220 lt!439433) lt!439576)))

(declare-fun b!990679 () Bool)

(assert (=> b!990679 (= e!558621 (not (= lt!439433 lt!439441)))))

(assert (= (and d!117671 res!662346) b!990679))

(assert (=> d!117671 m!917889))

(declare-fun m!918273 () Bool)

(assert (=> d!117671 m!918273))

(declare-fun m!918275 () Bool)

(assert (=> d!117671 m!918275))

(assert (=> d!117671 m!917875))

(assert (=> d!117671 m!917877))

(assert (=> d!117671 m!917875))

(assert (=> b!990445 d!117671))

(declare-fun d!117673 () Bool)

(assert (=> d!117673 (= (apply!897 (+!3092 lt!439434 (tuple2!14917 lt!439441 minValue!1220)) lt!439433) (get!15644 (getValueByKey!514 (toList!6822 (+!3092 lt!439434 (tuple2!14917 lt!439441 minValue!1220))) lt!439433)))))

(declare-fun bs!28126 () Bool)

(assert (= bs!28126 d!117673))

(declare-fun m!918277 () Bool)

(assert (=> bs!28126 m!918277))

(assert (=> bs!28126 m!918277))

(declare-fun m!918279 () Bool)

(assert (=> bs!28126 m!918279))

(assert (=> b!990445 d!117673))

(declare-fun d!117675 () Bool)

(assert (=> d!117675 (= (apply!897 lt!439434 lt!439433) (get!15644 (getValueByKey!514 (toList!6822 lt!439434) lt!439433)))))

(declare-fun bs!28127 () Bool)

(assert (= bs!28127 d!117675))

(declare-fun m!918281 () Bool)

(assert (=> bs!28127 m!918281))

(assert (=> bs!28127 m!918281))

(declare-fun m!918283 () Bool)

(assert (=> bs!28127 m!918283))

(assert (=> b!990445 d!117675))

(assert (=> b!990445 d!117543))

(declare-fun d!117677 () Bool)

(declare-fun e!558622 () Bool)

(assert (=> d!117677 e!558622))

(declare-fun res!662347 () Bool)

(assert (=> d!117677 (=> res!662347 e!558622)))

(declare-fun lt!439580 () Bool)

(assert (=> d!117677 (= res!662347 (not lt!439580))))

(declare-fun lt!439579 () Bool)

(assert (=> d!117677 (= lt!439580 lt!439579)))

(declare-fun lt!439578 () Unit!32858)

(declare-fun e!558623 () Unit!32858)

(assert (=> d!117677 (= lt!439578 e!558623)))

(declare-fun c!100514 () Bool)

(assert (=> d!117677 (= c!100514 lt!439579)))

(assert (=> d!117677 (= lt!439579 (containsKey!479 (toList!6822 (+!3092 lt!439428 (tuple2!14917 lt!439427 zeroValue!1220))) lt!439446))))

(assert (=> d!117677 (= (contains!5723 (+!3092 lt!439428 (tuple2!14917 lt!439427 zeroValue!1220)) lt!439446) lt!439580)))

(declare-fun b!990680 () Bool)

(declare-fun lt!439577 () Unit!32858)

(assert (=> b!990680 (= e!558623 lt!439577)))

(assert (=> b!990680 (= lt!439577 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 (+!3092 lt!439428 (tuple2!14917 lt!439427 zeroValue!1220))) lt!439446))))

(assert (=> b!990680 (isDefined!384 (getValueByKey!514 (toList!6822 (+!3092 lt!439428 (tuple2!14917 lt!439427 zeroValue!1220))) lt!439446))))

(declare-fun b!990681 () Bool)

(declare-fun Unit!32875 () Unit!32858)

(assert (=> b!990681 (= e!558623 Unit!32875)))

(declare-fun b!990682 () Bool)

(assert (=> b!990682 (= e!558622 (isDefined!384 (getValueByKey!514 (toList!6822 (+!3092 lt!439428 (tuple2!14917 lt!439427 zeroValue!1220))) lt!439446)))))

(assert (= (and d!117677 c!100514) b!990680))

(assert (= (and d!117677 (not c!100514)) b!990681))

(assert (= (and d!117677 (not res!662347)) b!990682))

(declare-fun m!918285 () Bool)

(assert (=> d!117677 m!918285))

(declare-fun m!918287 () Bool)

(assert (=> b!990680 m!918287))

(declare-fun m!918289 () Bool)

(assert (=> b!990680 m!918289))

(assert (=> b!990680 m!918289))

(declare-fun m!918291 () Bool)

(assert (=> b!990680 m!918291))

(assert (=> b!990682 m!918289))

(assert (=> b!990682 m!918289))

(assert (=> b!990682 m!918291))

(assert (=> b!990445 d!117677))

(declare-fun d!117679 () Bool)

(assert (=> d!117679 (contains!5723 (+!3092 lt!439428 (tuple2!14917 lt!439427 zeroValue!1220)) lt!439446)))

(declare-fun lt!439583 () Unit!32858)

(declare-fun choose!1619 (ListLongMap!13613 (_ BitVec 64) V!36043 (_ BitVec 64)) Unit!32858)

(assert (=> d!117679 (= lt!439583 (choose!1619 lt!439428 lt!439427 zeroValue!1220 lt!439446))))

(assert (=> d!117679 (contains!5723 lt!439428 lt!439446)))

(assert (=> d!117679 (= (addStillContains!616 lt!439428 lt!439427 zeroValue!1220 lt!439446) lt!439583)))

(declare-fun bs!28128 () Bool)

(assert (= bs!28128 d!117679))

(assert (=> bs!28128 m!917895))

(assert (=> bs!28128 m!917895))

(assert (=> bs!28128 m!917897))

(declare-fun m!918293 () Bool)

(assert (=> bs!28128 m!918293))

(declare-fun m!918295 () Bool)

(assert (=> bs!28128 m!918295))

(assert (=> b!990445 d!117679))

(declare-fun d!117681 () Bool)

(assert (=> d!117681 (= (apply!897 (+!3092 lt!439435 (tuple2!14917 lt!439440 zeroValue!1220)) lt!439431) (apply!897 lt!439435 lt!439431))))

(declare-fun lt!439584 () Unit!32858)

(assert (=> d!117681 (= lt!439584 (choose!1618 lt!439435 lt!439440 zeroValue!1220 lt!439431))))

(declare-fun e!558624 () Bool)

(assert (=> d!117681 e!558624))

(declare-fun res!662348 () Bool)

(assert (=> d!117681 (=> (not res!662348) (not e!558624))))

(assert (=> d!117681 (= res!662348 (contains!5723 lt!439435 lt!439431))))

(assert (=> d!117681 (= (addApplyDifferent!476 lt!439435 lt!439440 zeroValue!1220 lt!439431) lt!439584)))

(declare-fun b!990684 () Bool)

(assert (=> b!990684 (= e!558624 (not (= lt!439431 lt!439440)))))

(assert (= (and d!117681 res!662348) b!990684))

(assert (=> d!117681 m!917883))

(declare-fun m!918297 () Bool)

(assert (=> d!117681 m!918297))

(declare-fun m!918299 () Bool)

(assert (=> d!117681 m!918299))

(assert (=> d!117681 m!917879))

(assert (=> d!117681 m!917903))

(assert (=> d!117681 m!917879))

(assert (=> b!990445 d!117681))

(declare-fun d!117683 () Bool)

(declare-fun e!558625 () Bool)

(assert (=> d!117683 e!558625))

(declare-fun res!662350 () Bool)

(assert (=> d!117683 (=> (not res!662350) (not e!558625))))

(declare-fun lt!439588 () ListLongMap!13613)

(assert (=> d!117683 (= res!662350 (contains!5723 lt!439588 (_1!7469 (tuple2!14917 lt!439445 minValue!1220))))))

(declare-fun lt!439586 () List!20846)

(assert (=> d!117683 (= lt!439588 (ListLongMap!13614 lt!439586))))

(declare-fun lt!439587 () Unit!32858)

(declare-fun lt!439585 () Unit!32858)

(assert (=> d!117683 (= lt!439587 lt!439585)))

(assert (=> d!117683 (= (getValueByKey!514 lt!439586 (_1!7469 (tuple2!14917 lt!439445 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439445 minValue!1220))))))

(assert (=> d!117683 (= lt!439585 (lemmaContainsTupThenGetReturnValue!273 lt!439586 (_1!7469 (tuple2!14917 lt!439445 minValue!1220)) (_2!7469 (tuple2!14917 lt!439445 minValue!1220))))))

(assert (=> d!117683 (= lt!439586 (insertStrictlySorted!330 (toList!6822 lt!439444) (_1!7469 (tuple2!14917 lt!439445 minValue!1220)) (_2!7469 (tuple2!14917 lt!439445 minValue!1220))))))

(assert (=> d!117683 (= (+!3092 lt!439444 (tuple2!14917 lt!439445 minValue!1220)) lt!439588)))

(declare-fun b!990685 () Bool)

(declare-fun res!662349 () Bool)

(assert (=> b!990685 (=> (not res!662349) (not e!558625))))

(assert (=> b!990685 (= res!662349 (= (getValueByKey!514 (toList!6822 lt!439588) (_1!7469 (tuple2!14917 lt!439445 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439445 minValue!1220)))))))

(declare-fun b!990686 () Bool)

(assert (=> b!990686 (= e!558625 (contains!5725 (toList!6822 lt!439588) (tuple2!14917 lt!439445 minValue!1220)))))

(assert (= (and d!117683 res!662350) b!990685))

(assert (= (and b!990685 res!662349) b!990686))

(declare-fun m!918301 () Bool)

(assert (=> d!117683 m!918301))

(declare-fun m!918303 () Bool)

(assert (=> d!117683 m!918303))

(declare-fun m!918305 () Bool)

(assert (=> d!117683 m!918305))

(declare-fun m!918307 () Bool)

(assert (=> d!117683 m!918307))

(declare-fun m!918309 () Bool)

(assert (=> b!990685 m!918309))

(declare-fun m!918311 () Bool)

(assert (=> b!990686 m!918311))

(assert (=> b!990445 d!117683))

(declare-fun d!117685 () Bool)

(assert (=> d!117685 (= (apply!897 (+!3092 lt!439444 (tuple2!14917 lt!439445 minValue!1220)) lt!439437) (get!15644 (getValueByKey!514 (toList!6822 (+!3092 lt!439444 (tuple2!14917 lt!439445 minValue!1220))) lt!439437)))))

(declare-fun bs!28129 () Bool)

(assert (= bs!28129 d!117685))

(declare-fun m!918313 () Bool)

(assert (=> bs!28129 m!918313))

(assert (=> bs!28129 m!918313))

(declare-fun m!918315 () Bool)

(assert (=> bs!28129 m!918315))

(assert (=> b!990445 d!117685))

(declare-fun d!117687 () Bool)

(assert (=> d!117687 (= (apply!897 (+!3092 lt!439435 (tuple2!14917 lt!439440 zeroValue!1220)) lt!439431) (get!15644 (getValueByKey!514 (toList!6822 (+!3092 lt!439435 (tuple2!14917 lt!439440 zeroValue!1220))) lt!439431)))))

(declare-fun bs!28130 () Bool)

(assert (= bs!28130 d!117687))

(declare-fun m!918317 () Bool)

(assert (=> bs!28130 m!918317))

(assert (=> bs!28130 m!918317))

(declare-fun m!918319 () Bool)

(assert (=> bs!28130 m!918319))

(assert (=> b!990445 d!117687))

(declare-fun d!117689 () Bool)

(declare-fun e!558626 () Bool)

(assert (=> d!117689 e!558626))

(declare-fun res!662352 () Bool)

(assert (=> d!117689 (=> (not res!662352) (not e!558626))))

(declare-fun lt!439592 () ListLongMap!13613)

(assert (=> d!117689 (= res!662352 (contains!5723 lt!439592 (_1!7469 (tuple2!14917 lt!439440 zeroValue!1220))))))

(declare-fun lt!439590 () List!20846)

(assert (=> d!117689 (= lt!439592 (ListLongMap!13614 lt!439590))))

(declare-fun lt!439591 () Unit!32858)

(declare-fun lt!439589 () Unit!32858)

(assert (=> d!117689 (= lt!439591 lt!439589)))

(assert (=> d!117689 (= (getValueByKey!514 lt!439590 (_1!7469 (tuple2!14917 lt!439440 zeroValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439440 zeroValue!1220))))))

(assert (=> d!117689 (= lt!439589 (lemmaContainsTupThenGetReturnValue!273 lt!439590 (_1!7469 (tuple2!14917 lt!439440 zeroValue!1220)) (_2!7469 (tuple2!14917 lt!439440 zeroValue!1220))))))

(assert (=> d!117689 (= lt!439590 (insertStrictlySorted!330 (toList!6822 lt!439435) (_1!7469 (tuple2!14917 lt!439440 zeroValue!1220)) (_2!7469 (tuple2!14917 lt!439440 zeroValue!1220))))))

(assert (=> d!117689 (= (+!3092 lt!439435 (tuple2!14917 lt!439440 zeroValue!1220)) lt!439592)))

(declare-fun b!990687 () Bool)

(declare-fun res!662351 () Bool)

(assert (=> b!990687 (=> (not res!662351) (not e!558626))))

(assert (=> b!990687 (= res!662351 (= (getValueByKey!514 (toList!6822 lt!439592) (_1!7469 (tuple2!14917 lt!439440 zeroValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439440 zeroValue!1220)))))))

(declare-fun b!990688 () Bool)

(assert (=> b!990688 (= e!558626 (contains!5725 (toList!6822 lt!439592) (tuple2!14917 lt!439440 zeroValue!1220)))))

(assert (= (and d!117689 res!662352) b!990687))

(assert (= (and b!990687 res!662351) b!990688))

(declare-fun m!918321 () Bool)

(assert (=> d!117689 m!918321))

(declare-fun m!918323 () Bool)

(assert (=> d!117689 m!918323))

(declare-fun m!918325 () Bool)

(assert (=> d!117689 m!918325))

(declare-fun m!918327 () Bool)

(assert (=> d!117689 m!918327))

(declare-fun m!918329 () Bool)

(assert (=> b!990687 m!918329))

(declare-fun m!918331 () Bool)

(assert (=> b!990688 m!918331))

(assert (=> b!990445 d!117689))

(declare-fun d!117691 () Bool)

(declare-fun e!558627 () Bool)

(assert (=> d!117691 e!558627))

(declare-fun res!662354 () Bool)

(assert (=> d!117691 (=> (not res!662354) (not e!558627))))

(declare-fun lt!439596 () ListLongMap!13613)

(assert (=> d!117691 (= res!662354 (contains!5723 lt!439596 (_1!7469 (tuple2!14917 lt!439441 minValue!1220))))))

(declare-fun lt!439594 () List!20846)

(assert (=> d!117691 (= lt!439596 (ListLongMap!13614 lt!439594))))

(declare-fun lt!439595 () Unit!32858)

(declare-fun lt!439593 () Unit!32858)

(assert (=> d!117691 (= lt!439595 lt!439593)))

(assert (=> d!117691 (= (getValueByKey!514 lt!439594 (_1!7469 (tuple2!14917 lt!439441 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439441 minValue!1220))))))

(assert (=> d!117691 (= lt!439593 (lemmaContainsTupThenGetReturnValue!273 lt!439594 (_1!7469 (tuple2!14917 lt!439441 minValue!1220)) (_2!7469 (tuple2!14917 lt!439441 minValue!1220))))))

(assert (=> d!117691 (= lt!439594 (insertStrictlySorted!330 (toList!6822 lt!439434) (_1!7469 (tuple2!14917 lt!439441 minValue!1220)) (_2!7469 (tuple2!14917 lt!439441 minValue!1220))))))

(assert (=> d!117691 (= (+!3092 lt!439434 (tuple2!14917 lt!439441 minValue!1220)) lt!439596)))

(declare-fun b!990689 () Bool)

(declare-fun res!662353 () Bool)

(assert (=> b!990689 (=> (not res!662353) (not e!558627))))

(assert (=> b!990689 (= res!662353 (= (getValueByKey!514 (toList!6822 lt!439596) (_1!7469 (tuple2!14917 lt!439441 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439441 minValue!1220)))))))

(declare-fun b!990690 () Bool)

(assert (=> b!990690 (= e!558627 (contains!5725 (toList!6822 lt!439596) (tuple2!14917 lt!439441 minValue!1220)))))

(assert (= (and d!117691 res!662354) b!990689))

(assert (= (and b!990689 res!662353) b!990690))

(declare-fun m!918333 () Bool)

(assert (=> d!117691 m!918333))

(declare-fun m!918335 () Bool)

(assert (=> d!117691 m!918335))

(declare-fun m!918337 () Bool)

(assert (=> d!117691 m!918337))

(declare-fun m!918339 () Bool)

(assert (=> d!117691 m!918339))

(declare-fun m!918341 () Bool)

(assert (=> b!990689 m!918341))

(declare-fun m!918343 () Bool)

(assert (=> b!990690 m!918343))

(assert (=> b!990445 d!117691))

(declare-fun d!117693 () Bool)

(assert (=> d!117693 (= (apply!897 (+!3092 lt!439444 (tuple2!14917 lt!439445 minValue!1220)) lt!439437) (apply!897 lt!439444 lt!439437))))

(declare-fun lt!439597 () Unit!32858)

(assert (=> d!117693 (= lt!439597 (choose!1618 lt!439444 lt!439445 minValue!1220 lt!439437))))

(declare-fun e!558628 () Bool)

(assert (=> d!117693 e!558628))

(declare-fun res!662355 () Bool)

(assert (=> d!117693 (=> (not res!662355) (not e!558628))))

(assert (=> d!117693 (= res!662355 (contains!5723 lt!439444 lt!439437))))

(assert (=> d!117693 (= (addApplyDifferent!476 lt!439444 lt!439445 minValue!1220 lt!439437) lt!439597)))

(declare-fun b!990691 () Bool)

(assert (=> b!990691 (= e!558628 (not (= lt!439437 lt!439445)))))

(assert (= (and d!117693 res!662355) b!990691))

(assert (=> d!117693 m!917901))

(declare-fun m!918345 () Bool)

(assert (=> d!117693 m!918345))

(declare-fun m!918347 () Bool)

(assert (=> d!117693 m!918347))

(assert (=> d!117693 m!917891))

(assert (=> d!117693 m!917893))

(assert (=> d!117693 m!917891))

(assert (=> b!990445 d!117693))

(declare-fun d!117695 () Bool)

(assert (=> d!117695 (= (apply!897 lt!439435 lt!439431) (get!15644 (getValueByKey!514 (toList!6822 lt!439435) lt!439431)))))

(declare-fun bs!28131 () Bool)

(assert (= bs!28131 d!117695))

(declare-fun m!918349 () Bool)

(assert (=> bs!28131 m!918349))

(assert (=> bs!28131 m!918349))

(declare-fun m!918351 () Bool)

(assert (=> bs!28131 m!918351))

(assert (=> b!990445 d!117695))

(declare-fun d!117697 () Bool)

(assert (=> d!117697 (= (apply!897 lt!439444 lt!439437) (get!15644 (getValueByKey!514 (toList!6822 lt!439444) lt!439437)))))

(declare-fun bs!28132 () Bool)

(assert (= bs!28132 d!117697))

(declare-fun m!918353 () Bool)

(assert (=> bs!28132 m!918353))

(assert (=> bs!28132 m!918353))

(declare-fun m!918355 () Bool)

(assert (=> bs!28132 m!918355))

(assert (=> b!990445 d!117697))

(declare-fun d!117699 () Bool)

(declare-fun e!558629 () Bool)

(assert (=> d!117699 e!558629))

(declare-fun res!662357 () Bool)

(assert (=> d!117699 (=> (not res!662357) (not e!558629))))

(declare-fun lt!439601 () ListLongMap!13613)

(assert (=> d!117699 (= res!662357 (contains!5723 lt!439601 (_1!7469 (tuple2!14917 lt!439427 zeroValue!1220))))))

(declare-fun lt!439599 () List!20846)

(assert (=> d!117699 (= lt!439601 (ListLongMap!13614 lt!439599))))

(declare-fun lt!439600 () Unit!32858)

(declare-fun lt!439598 () Unit!32858)

(assert (=> d!117699 (= lt!439600 lt!439598)))

(assert (=> d!117699 (= (getValueByKey!514 lt!439599 (_1!7469 (tuple2!14917 lt!439427 zeroValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439427 zeroValue!1220))))))

(assert (=> d!117699 (= lt!439598 (lemmaContainsTupThenGetReturnValue!273 lt!439599 (_1!7469 (tuple2!14917 lt!439427 zeroValue!1220)) (_2!7469 (tuple2!14917 lt!439427 zeroValue!1220))))))

(assert (=> d!117699 (= lt!439599 (insertStrictlySorted!330 (toList!6822 lt!439428) (_1!7469 (tuple2!14917 lt!439427 zeroValue!1220)) (_2!7469 (tuple2!14917 lt!439427 zeroValue!1220))))))

(assert (=> d!117699 (= (+!3092 lt!439428 (tuple2!14917 lt!439427 zeroValue!1220)) lt!439601)))

(declare-fun b!990692 () Bool)

(declare-fun res!662356 () Bool)

(assert (=> b!990692 (=> (not res!662356) (not e!558629))))

(assert (=> b!990692 (= res!662356 (= (getValueByKey!514 (toList!6822 lt!439601) (_1!7469 (tuple2!14917 lt!439427 zeroValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439427 zeroValue!1220)))))))

(declare-fun b!990693 () Bool)

(assert (=> b!990693 (= e!558629 (contains!5725 (toList!6822 lt!439601) (tuple2!14917 lt!439427 zeroValue!1220)))))

(assert (= (and d!117699 res!662357) b!990692))

(assert (= (and b!990692 res!662356) b!990693))

(declare-fun m!918357 () Bool)

(assert (=> d!117699 m!918357))

(declare-fun m!918359 () Bool)

(assert (=> d!117699 m!918359))

(declare-fun m!918361 () Bool)

(assert (=> d!117699 m!918361))

(declare-fun m!918363 () Bool)

(assert (=> d!117699 m!918363))

(declare-fun m!918365 () Bool)

(assert (=> b!990692 m!918365))

(declare-fun m!918367 () Bool)

(assert (=> b!990693 m!918367))

(assert (=> b!990445 d!117699))

(declare-fun d!117701 () Bool)

(assert (=> d!117701 (= (apply!897 lt!439414 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15644 (getValueByKey!514 (toList!6822 lt!439414) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28133 () Bool)

(assert (= bs!28133 d!117701))

(assert (=> bs!28133 m!918191))

(assert (=> bs!28133 m!918191))

(declare-fun m!918369 () Bool)

(assert (=> bs!28133 m!918369))

(assert (=> b!990415 d!117701))

(declare-fun d!117703 () Bool)

(assert (=> d!117703 (= (apply!897 lt!439321 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15644 (getValueByKey!514 (toList!6822 lt!439321) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28134 () Bool)

(assert (= bs!28134 d!117703))

(assert (=> bs!28134 m!917731))

(assert (=> bs!28134 m!918069))

(assert (=> bs!28134 m!918069))

(declare-fun m!918371 () Bool)

(assert (=> bs!28134 m!918371))

(assert (=> b!990318 d!117703))

(assert (=> b!990318 d!117631))

(declare-fun d!117705 () Bool)

(declare-fun isEmpty!727 (List!20846) Bool)

(assert (=> d!117705 (= (isEmpty!726 lt!439321) (isEmpty!727 (toList!6822 lt!439321)))))

(declare-fun bs!28135 () Bool)

(assert (= bs!28135 d!117705))

(declare-fun m!918373 () Bool)

(assert (=> bs!28135 m!918373))

(assert (=> b!990320 d!117705))

(declare-fun d!117707 () Bool)

(declare-fun e!558630 () Bool)

(assert (=> d!117707 e!558630))

(declare-fun res!662359 () Bool)

(assert (=> d!117707 (=> (not res!662359) (not e!558630))))

(declare-fun lt!439605 () ListLongMap!13613)

(assert (=> d!117707 (= res!662359 (contains!5723 lt!439605 (_1!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439603 () List!20846)

(assert (=> d!117707 (= lt!439605 (ListLongMap!13614 lt!439603))))

(declare-fun lt!439604 () Unit!32858)

(declare-fun lt!439602 () Unit!32858)

(assert (=> d!117707 (= lt!439604 lt!439602)))

(assert (=> d!117707 (= (getValueByKey!514 lt!439603 (_1!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!519 (_2!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117707 (= lt!439602 (lemmaContainsTupThenGetReturnValue!273 lt!439603 (_1!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117707 (= lt!439603 (insertStrictlySorted!330 (toList!6822 (ite c!100439 call!41994 (ite c!100438 call!41995 call!41999))) (_1!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117707 (= (+!3092 (ite c!100439 call!41994 (ite c!100438 call!41995 call!41999)) (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439605)))

(declare-fun b!990694 () Bool)

(declare-fun res!662358 () Bool)

(assert (=> b!990694 (=> (not res!662358) (not e!558630))))

(assert (=> b!990694 (= res!662358 (= (getValueByKey!514 (toList!6822 lt!439605) (_1!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!519 (_2!7469 (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!990695 () Bool)

(assert (=> b!990695 (= e!558630 (contains!5725 (toList!6822 lt!439605) (ite (or c!100439 c!100438) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117707 res!662359) b!990694))

(assert (= (and b!990694 res!662358) b!990695))

(declare-fun m!918375 () Bool)

(assert (=> d!117707 m!918375))

(declare-fun m!918377 () Bool)

(assert (=> d!117707 m!918377))

(declare-fun m!918379 () Bool)

(assert (=> d!117707 m!918379))

(declare-fun m!918381 () Bool)

(assert (=> d!117707 m!918381))

(declare-fun m!918383 () Bool)

(assert (=> b!990694 m!918383))

(declare-fun m!918385 () Bool)

(assert (=> b!990695 m!918385))

(assert (=> bm!41993 d!117707))

(declare-fun d!117709 () Bool)

(declare-fun lt!439606 () Bool)

(assert (=> d!117709 (= lt!439606 (select (content!422 (toList!6822 lt!439347)) lt!439289))))

(declare-fun e!558631 () Bool)

(assert (=> d!117709 (= lt!439606 e!558631)))

(declare-fun res!662360 () Bool)

(assert (=> d!117709 (=> (not res!662360) (not e!558631))))

(assert (=> d!117709 (= res!662360 ((_ is Cons!20842) (toList!6822 lt!439347)))))

(assert (=> d!117709 (= (contains!5725 (toList!6822 lt!439347) lt!439289) lt!439606)))

(declare-fun b!990696 () Bool)

(declare-fun e!558632 () Bool)

(assert (=> b!990696 (= e!558631 e!558632)))

(declare-fun res!662361 () Bool)

(assert (=> b!990696 (=> res!662361 e!558632)))

(assert (=> b!990696 (= res!662361 (= (h!22004 (toList!6822 lt!439347)) lt!439289))))

(declare-fun b!990697 () Bool)

(assert (=> b!990697 (= e!558632 (contains!5725 (t!29821 (toList!6822 lt!439347)) lt!439289))))

(assert (= (and d!117709 res!662360) b!990696))

(assert (= (and b!990696 (not res!662361)) b!990697))

(declare-fun m!918387 () Bool)

(assert (=> d!117709 m!918387))

(declare-fun m!918389 () Bool)

(assert (=> d!117709 m!918389))

(declare-fun m!918391 () Bool)

(assert (=> b!990697 m!918391))

(assert (=> b!990357 d!117709))

(declare-fun d!117711 () Bool)

(declare-fun lt!439607 () Bool)

(assert (=> d!117711 (= lt!439607 (select (content!422 (toList!6822 lt!439351)) lt!439289))))

(declare-fun e!558633 () Bool)

(assert (=> d!117711 (= lt!439607 e!558633)))

(declare-fun res!662362 () Bool)

(assert (=> d!117711 (=> (not res!662362) (not e!558633))))

(assert (=> d!117711 (= res!662362 ((_ is Cons!20842) (toList!6822 lt!439351)))))

(assert (=> d!117711 (= (contains!5725 (toList!6822 lt!439351) lt!439289) lt!439607)))

(declare-fun b!990698 () Bool)

(declare-fun e!558634 () Bool)

(assert (=> b!990698 (= e!558633 e!558634)))

(declare-fun res!662363 () Bool)

(assert (=> b!990698 (=> res!662363 e!558634)))

(assert (=> b!990698 (= res!662363 (= (h!22004 (toList!6822 lt!439351)) lt!439289))))

(declare-fun b!990699 () Bool)

(assert (=> b!990699 (= e!558634 (contains!5725 (t!29821 (toList!6822 lt!439351)) lt!439289))))

(assert (= (and d!117711 res!662362) b!990698))

(assert (= (and b!990698 (not res!662363)) b!990699))

(declare-fun m!918393 () Bool)

(assert (=> d!117711 m!918393))

(declare-fun m!918395 () Bool)

(assert (=> d!117711 m!918395))

(declare-fun m!918397 () Bool)

(assert (=> b!990699 m!918397))

(assert (=> b!990359 d!117711))

(assert (=> b!990322 d!117577))

(assert (=> b!990324 d!117637))

(declare-fun d!117713 () Bool)

(declare-fun e!558635 () Bool)

(assert (=> d!117713 e!558635))

(declare-fun res!662365 () Bool)

(assert (=> d!117713 (=> (not res!662365) (not e!558635))))

(declare-fun lt!439611 () ListLongMap!13613)

(assert (=> d!117713 (= res!662365 (contains!5723 lt!439611 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439609 () List!20846)

(assert (=> d!117713 (= lt!439611 (ListLongMap!13614 lt!439609))))

(declare-fun lt!439610 () Unit!32858)

(declare-fun lt!439608 () Unit!32858)

(assert (=> d!117713 (= lt!439610 lt!439608)))

(assert (=> d!117713 (= (getValueByKey!514 lt!439609 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117713 (= lt!439608 (lemmaContainsTupThenGetReturnValue!273 lt!439609 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117713 (= lt!439609 (insertStrictlySorted!330 (toList!6822 call!41998) (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117713 (= (+!3092 call!41998 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439611)))

(declare-fun b!990700 () Bool)

(declare-fun res!662364 () Bool)

(assert (=> b!990700 (=> (not res!662364) (not e!558635))))

(assert (=> b!990700 (= res!662364 (= (getValueByKey!514 (toList!6822 lt!439611) (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990701 () Bool)

(assert (=> b!990701 (= e!558635 (contains!5725 (toList!6822 lt!439611) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117713 res!662365) b!990700))

(assert (= (and b!990700 res!662364) b!990701))

(declare-fun m!918399 () Bool)

(assert (=> d!117713 m!918399))

(declare-fun m!918401 () Bool)

(assert (=> d!117713 m!918401))

(declare-fun m!918403 () Bool)

(assert (=> d!117713 m!918403))

(declare-fun m!918405 () Bool)

(assert (=> d!117713 m!918405))

(declare-fun m!918407 () Bool)

(assert (=> b!990700 m!918407))

(declare-fun m!918409 () Bool)

(assert (=> b!990701 m!918409))

(assert (=> b!990433 d!117713))

(declare-fun d!117715 () Bool)

(declare-fun e!558636 () Bool)

(assert (=> d!117715 e!558636))

(declare-fun res!662366 () Bool)

(assert (=> d!117715 (=> res!662366 e!558636)))

(declare-fun lt!439615 () Bool)

(assert (=> d!117715 (= res!662366 (not lt!439615))))

(declare-fun lt!439614 () Bool)

(assert (=> d!117715 (= lt!439615 lt!439614)))

(declare-fun lt!439613 () Unit!32858)

(declare-fun e!558637 () Unit!32858)

(assert (=> d!117715 (= lt!439613 e!558637)))

(declare-fun c!100515 () Bool)

(assert (=> d!117715 (= c!100515 lt!439614)))

(assert (=> d!117715 (= lt!439614 (containsKey!479 (toList!6822 lt!439414) (select (arr!30127 _keys!1544) from!1932)))))

(assert (=> d!117715 (= (contains!5723 lt!439414 (select (arr!30127 _keys!1544) from!1932)) lt!439615)))

(declare-fun b!990702 () Bool)

(declare-fun lt!439612 () Unit!32858)

(assert (=> b!990702 (= e!558637 lt!439612)))

(assert (=> b!990702 (= lt!439612 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439414) (select (arr!30127 _keys!1544) from!1932)))))

(assert (=> b!990702 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439414) (select (arr!30127 _keys!1544) from!1932)))))

(declare-fun b!990703 () Bool)

(declare-fun Unit!32876 () Unit!32858)

(assert (=> b!990703 (= e!558637 Unit!32876)))

(declare-fun b!990704 () Bool)

(assert (=> b!990704 (= e!558636 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439414) (select (arr!30127 _keys!1544) from!1932))))))

(assert (= (and d!117715 c!100515) b!990702))

(assert (= (and d!117715 (not c!100515)) b!990703))

(assert (= (and d!117715 (not res!662366)) b!990704))

(assert (=> d!117715 m!917643))

(declare-fun m!918411 () Bool)

(assert (=> d!117715 m!918411))

(assert (=> b!990702 m!917643))

(declare-fun m!918413 () Bool)

(assert (=> b!990702 m!918413))

(assert (=> b!990702 m!917643))

(assert (=> b!990702 m!918013))

(assert (=> b!990702 m!918013))

(declare-fun m!918415 () Bool)

(assert (=> b!990702 m!918415))

(assert (=> b!990704 m!917643))

(assert (=> b!990704 m!918013))

(assert (=> b!990704 m!918013))

(assert (=> b!990704 m!918415))

(assert (=> b!990420 d!117715))

(declare-fun d!117717 () Bool)

(declare-fun lt!439618 () Bool)

(declare-fun content!423 (List!20845) (InoxSet (_ BitVec 64)))

(assert (=> d!117717 (= lt!439618 (select (content!423 Nil!20842) (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!558642 () Bool)

(assert (=> d!117717 (= lt!439618 e!558642)))

(declare-fun res!662371 () Bool)

(assert (=> d!117717 (=> (not res!662371) (not e!558642))))

(assert (=> d!117717 (= res!662371 ((_ is Cons!20841) Nil!20842))))

(assert (=> d!117717 (= (contains!5724 Nil!20842 (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)) lt!439618)))

(declare-fun b!990709 () Bool)

(declare-fun e!558643 () Bool)

(assert (=> b!990709 (= e!558642 e!558643)))

(declare-fun res!662372 () Bool)

(assert (=> b!990709 (=> res!662372 e!558643)))

(assert (=> b!990709 (= res!662372 (= (h!22003 Nil!20842) (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990710 () Bool)

(assert (=> b!990710 (= e!558643 (contains!5724 (t!29820 Nil!20842) (select (arr!30127 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117717 res!662371) b!990709))

(assert (= (and b!990709 (not res!662372)) b!990710))

(declare-fun m!918417 () Bool)

(assert (=> d!117717 m!918417))

(assert (=> d!117717 m!917755))

(declare-fun m!918419 () Bool)

(assert (=> d!117717 m!918419))

(assert (=> b!990710 m!917755))

(declare-fun m!918421 () Bool)

(assert (=> b!990710 m!918421))

(assert (=> b!990348 d!117717))

(declare-fun d!117719 () Bool)

(declare-fun lt!439619 () Bool)

(assert (=> d!117719 (= lt!439619 (select (content!422 (toList!6822 lt!439355)) lt!439289))))

(declare-fun e!558644 () Bool)

(assert (=> d!117719 (= lt!439619 e!558644)))

(declare-fun res!662373 () Bool)

(assert (=> d!117719 (=> (not res!662373) (not e!558644))))

(assert (=> d!117719 (= res!662373 ((_ is Cons!20842) (toList!6822 lt!439355)))))

(assert (=> d!117719 (= (contains!5725 (toList!6822 lt!439355) lt!439289) lt!439619)))

(declare-fun b!990711 () Bool)

(declare-fun e!558645 () Bool)

(assert (=> b!990711 (= e!558644 e!558645)))

(declare-fun res!662374 () Bool)

(assert (=> b!990711 (=> res!662374 e!558645)))

(assert (=> b!990711 (= res!662374 (= (h!22004 (toList!6822 lt!439355)) lt!439289))))

(declare-fun b!990712 () Bool)

(assert (=> b!990712 (= e!558645 (contains!5725 (t!29821 (toList!6822 lt!439355)) lt!439289))))

(assert (= (and d!117719 res!662373) b!990711))

(assert (= (and b!990711 (not res!662374)) b!990712))

(declare-fun m!918423 () Bool)

(assert (=> d!117719 m!918423))

(declare-fun m!918425 () Bool)

(assert (=> d!117719 m!918425))

(declare-fun m!918427 () Bool)

(assert (=> b!990712 m!918427))

(assert (=> b!990361 d!117719))

(declare-fun b!990713 () Bool)

(declare-fun e!558648 () Bool)

(declare-fun e!558647 () Bool)

(assert (=> b!990713 (= e!558648 e!558647)))

(declare-fun c!100516 () Bool)

(assert (=> b!990713 (= c!100516 (validKeyInArray!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!42015 () Bool)

(declare-fun call!42018 () Bool)

(assert (=> bm!42015 (= call!42018 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!990714 () Bool)

(declare-fun e!558646 () Bool)

(assert (=> b!990714 (= e!558646 call!42018)))

(declare-fun b!990715 () Bool)

(assert (=> b!990715 (= e!558647 call!42018)))

(declare-fun b!990716 () Bool)

(assert (=> b!990716 (= e!558647 e!558646)))

(declare-fun lt!439622 () (_ BitVec 64))

(assert (=> b!990716 (= lt!439622 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!439620 () Unit!32858)

(assert (=> b!990716 (= lt!439620 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439622 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!990716 (arrayContainsKey!0 _keys!1544 lt!439622 #b00000000000000000000000000000000)))

(declare-fun lt!439621 () Unit!32858)

(assert (=> b!990716 (= lt!439621 lt!439620)))

(declare-fun res!662375 () Bool)

(assert (=> b!990716 (= res!662375 (= (seekEntryOrOpen!0 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9212 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!990716 (=> (not res!662375) (not e!558646))))

(declare-fun d!117721 () Bool)

(declare-fun res!662376 () Bool)

(assert (=> d!117721 (=> res!662376 e!558648)))

(assert (=> d!117721 (= res!662376 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30606 _keys!1544)))))

(assert (=> d!117721 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!558648)))

(assert (= (and d!117721 (not res!662376)) b!990713))

(assert (= (and b!990713 c!100516) b!990716))

(assert (= (and b!990713 (not c!100516)) b!990715))

(assert (= (and b!990716 res!662375) b!990714))

(assert (= (or b!990714 b!990715) bm!42015))

(assert (=> b!990713 m!918131))

(assert (=> b!990713 m!918131))

(assert (=> b!990713 m!918133))

(declare-fun m!918429 () Bool)

(assert (=> bm!42015 m!918429))

(assert (=> b!990716 m!918131))

(declare-fun m!918431 () Bool)

(assert (=> b!990716 m!918431))

(declare-fun m!918433 () Bool)

(assert (=> b!990716 m!918433))

(assert (=> b!990716 m!918131))

(declare-fun m!918435 () Bool)

(assert (=> b!990716 m!918435))

(assert (=> bm!41965 d!117721))

(declare-fun d!117723 () Bool)

(declare-fun e!558649 () Bool)

(assert (=> d!117723 e!558649))

(declare-fun res!662377 () Bool)

(assert (=> d!117723 (=> res!662377 e!558649)))

(declare-fun lt!439626 () Bool)

(assert (=> d!117723 (= res!662377 (not lt!439626))))

(declare-fun lt!439625 () Bool)

(assert (=> d!117723 (= lt!439626 lt!439625)))

(declare-fun lt!439624 () Unit!32858)

(declare-fun e!558650 () Unit!32858)

(assert (=> d!117723 (= lt!439624 e!558650)))

(declare-fun c!100517 () Bool)

(assert (=> d!117723 (= c!100517 lt!439625)))

(assert (=> d!117723 (= lt!439625 (containsKey!479 (toList!6822 lt!439436) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117723 (= (contains!5723 lt!439436 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439626)))

(declare-fun b!990717 () Bool)

(declare-fun lt!439623 () Unit!32858)

(assert (=> b!990717 (= e!558650 lt!439623)))

(assert (=> b!990717 (= lt!439623 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439436) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990717 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439436) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990718 () Bool)

(declare-fun Unit!32877 () Unit!32858)

(assert (=> b!990718 (= e!558650 Unit!32877)))

(declare-fun b!990719 () Bool)

(assert (=> b!990719 (= e!558649 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117723 c!100517) b!990717))

(assert (= (and d!117723 (not c!100517)) b!990718))

(assert (= (and d!117723 (not res!662377)) b!990719))

(declare-fun m!918437 () Bool)

(assert (=> d!117723 m!918437))

(declare-fun m!918439 () Bool)

(assert (=> b!990717 m!918439))

(assert (=> b!990717 m!918081))

(assert (=> b!990717 m!918081))

(declare-fun m!918441 () Bool)

(assert (=> b!990717 m!918441))

(assert (=> b!990719 m!918081))

(assert (=> b!990719 m!918081))

(assert (=> b!990719 m!918441))

(assert (=> bm!41995 d!117723))

(declare-fun d!117725 () Bool)

(declare-fun e!558651 () Bool)

(assert (=> d!117725 e!558651))

(declare-fun res!662378 () Bool)

(assert (=> d!117725 (=> res!662378 e!558651)))

(declare-fun lt!439630 () Bool)

(assert (=> d!117725 (= res!662378 (not lt!439630))))

(declare-fun lt!439629 () Bool)

(assert (=> d!117725 (= lt!439630 lt!439629)))

(declare-fun lt!439628 () Unit!32858)

(declare-fun e!558652 () Unit!32858)

(assert (=> d!117725 (= lt!439628 e!558652)))

(declare-fun c!100518 () Bool)

(assert (=> d!117725 (= c!100518 lt!439629)))

(assert (=> d!117725 (= lt!439629 (containsKey!479 (toList!6822 lt!439450) (_1!7469 lt!439290)))))

(assert (=> d!117725 (= (contains!5723 lt!439450 (_1!7469 lt!439290)) lt!439630)))

(declare-fun b!990720 () Bool)

(declare-fun lt!439627 () Unit!32858)

(assert (=> b!990720 (= e!558652 lt!439627)))

(assert (=> b!990720 (= lt!439627 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439450) (_1!7469 lt!439290)))))

(assert (=> b!990720 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439450) (_1!7469 lt!439290)))))

(declare-fun b!990721 () Bool)

(declare-fun Unit!32878 () Unit!32858)

(assert (=> b!990721 (= e!558652 Unit!32878)))

(declare-fun b!990722 () Bool)

(assert (=> b!990722 (= e!558651 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439450) (_1!7469 lt!439290))))))

(assert (= (and d!117725 c!100518) b!990720))

(assert (= (and d!117725 (not c!100518)) b!990721))

(assert (= (and d!117725 (not res!662378)) b!990722))

(declare-fun m!918443 () Bool)

(assert (=> d!117725 m!918443))

(declare-fun m!918445 () Bool)

(assert (=> b!990720 m!918445))

(assert (=> b!990720 m!917919))

(assert (=> b!990720 m!917919))

(declare-fun m!918447 () Bool)

(assert (=> b!990720 m!918447))

(assert (=> b!990722 m!917919))

(assert (=> b!990722 m!917919))

(assert (=> b!990722 m!918447))

(assert (=> d!117569 d!117725))

(declare-fun b!990724 () Bool)

(declare-fun e!558653 () Option!520)

(declare-fun e!558654 () Option!520)

(assert (=> b!990724 (= e!558653 e!558654)))

(declare-fun c!100520 () Bool)

(assert (=> b!990724 (= c!100520 (and ((_ is Cons!20842) lt!439448) (not (= (_1!7469 (h!22004 lt!439448)) (_1!7469 lt!439290)))))))

(declare-fun d!117727 () Bool)

(declare-fun c!100519 () Bool)

(assert (=> d!117727 (= c!100519 (and ((_ is Cons!20842) lt!439448) (= (_1!7469 (h!22004 lt!439448)) (_1!7469 lt!439290))))))

(assert (=> d!117727 (= (getValueByKey!514 lt!439448 (_1!7469 lt!439290)) e!558653)))

(declare-fun b!990723 () Bool)

(assert (=> b!990723 (= e!558653 (Some!519 (_2!7469 (h!22004 lt!439448))))))

(declare-fun b!990725 () Bool)

(assert (=> b!990725 (= e!558654 (getValueByKey!514 (t!29821 lt!439448) (_1!7469 lt!439290)))))

(declare-fun b!990726 () Bool)

(assert (=> b!990726 (= e!558654 None!518)))

(assert (= (and d!117727 c!100519) b!990723))

(assert (= (and d!117727 (not c!100519)) b!990724))

(assert (= (and b!990724 c!100520) b!990725))

(assert (= (and b!990724 (not c!100520)) b!990726))

(declare-fun m!918449 () Bool)

(assert (=> b!990725 m!918449))

(assert (=> d!117569 d!117727))

(declare-fun d!117729 () Bool)

(assert (=> d!117729 (= (getValueByKey!514 lt!439448 (_1!7469 lt!439290)) (Some!519 (_2!7469 lt!439290)))))

(declare-fun lt!439631 () Unit!32858)

(assert (=> d!117729 (= lt!439631 (choose!1616 lt!439448 (_1!7469 lt!439290) (_2!7469 lt!439290)))))

(declare-fun e!558655 () Bool)

(assert (=> d!117729 e!558655))

(declare-fun res!662379 () Bool)

(assert (=> d!117729 (=> (not res!662379) (not e!558655))))

(assert (=> d!117729 (= res!662379 (isStrictlySorted!517 lt!439448))))

(assert (=> d!117729 (= (lemmaContainsTupThenGetReturnValue!273 lt!439448 (_1!7469 lt!439290) (_2!7469 lt!439290)) lt!439631)))

(declare-fun b!990727 () Bool)

(declare-fun res!662380 () Bool)

(assert (=> b!990727 (=> (not res!662380) (not e!558655))))

(assert (=> b!990727 (= res!662380 (containsKey!479 lt!439448 (_1!7469 lt!439290)))))

(declare-fun b!990728 () Bool)

(assert (=> b!990728 (= e!558655 (contains!5725 lt!439448 (tuple2!14917 (_1!7469 lt!439290) (_2!7469 lt!439290))))))

(assert (= (and d!117729 res!662379) b!990727))

(assert (= (and b!990727 res!662380) b!990728))

(assert (=> d!117729 m!917913))

(declare-fun m!918451 () Bool)

(assert (=> d!117729 m!918451))

(declare-fun m!918453 () Bool)

(assert (=> d!117729 m!918453))

(declare-fun m!918455 () Bool)

(assert (=> b!990727 m!918455))

(declare-fun m!918457 () Bool)

(assert (=> b!990728 m!918457))

(assert (=> d!117569 d!117729))

(declare-fun c!100522 () Bool)

(declare-fun b!990729 () Bool)

(declare-fun c!100524 () Bool)

(declare-fun e!558656 () List!20846)

(assert (=> b!990729 (= e!558656 (ite c!100522 (t!29821 (toList!6822 (+!3092 lt!439287 lt!439289))) (ite c!100524 (Cons!20842 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439289))) (t!29821 (toList!6822 (+!3092 lt!439287 lt!439289)))) Nil!20843)))))

(declare-fun b!990730 () Bool)

(declare-fun e!558659 () List!20846)

(declare-fun e!558660 () List!20846)

(assert (=> b!990730 (= e!558659 e!558660)))

(assert (=> b!990730 (= c!100522 (and ((_ is Cons!20842) (toList!6822 (+!3092 lt!439287 lt!439289))) (= (_1!7469 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439289)))) (_1!7469 lt!439290))))))

(declare-fun b!990731 () Bool)

(declare-fun call!42021 () List!20846)

(assert (=> b!990731 (= e!558660 call!42021)))

(declare-fun b!990732 () Bool)

(assert (=> b!990732 (= c!100524 (and ((_ is Cons!20842) (toList!6822 (+!3092 lt!439287 lt!439289))) (bvsgt (_1!7469 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439289)))) (_1!7469 lt!439290))))))

(declare-fun e!558658 () List!20846)

(assert (=> b!990732 (= e!558660 e!558658)))

(declare-fun b!990733 () Bool)

(declare-fun e!558657 () Bool)

(declare-fun lt!439632 () List!20846)

(assert (=> b!990733 (= e!558657 (contains!5725 lt!439632 (tuple2!14917 (_1!7469 lt!439290) (_2!7469 lt!439290))))))

(declare-fun b!990734 () Bool)

(declare-fun call!42020 () List!20846)

(assert (=> b!990734 (= e!558658 call!42020)))

(declare-fun b!990735 () Bool)

(assert (=> b!990735 (= e!558658 call!42020)))

(declare-fun bm!42016 () Bool)

(declare-fun call!42019 () List!20846)

(assert (=> bm!42016 (= call!42021 call!42019)))

(declare-fun b!990736 () Bool)

(assert (=> b!990736 (= e!558656 (insertStrictlySorted!330 (t!29821 (toList!6822 (+!3092 lt!439287 lt!439289))) (_1!7469 lt!439290) (_2!7469 lt!439290)))))

(declare-fun b!990737 () Bool)

(assert (=> b!990737 (= e!558659 call!42019)))

(declare-fun b!990738 () Bool)

(declare-fun res!662381 () Bool)

(assert (=> b!990738 (=> (not res!662381) (not e!558657))))

(assert (=> b!990738 (= res!662381 (containsKey!479 lt!439632 (_1!7469 lt!439290)))))

(declare-fun c!100523 () Bool)

(declare-fun bm!42018 () Bool)

(assert (=> bm!42018 (= call!42019 ($colon$colon!556 e!558656 (ite c!100523 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439289))) (tuple2!14917 (_1!7469 lt!439290) (_2!7469 lt!439290)))))))

(declare-fun c!100521 () Bool)

(assert (=> bm!42018 (= c!100521 c!100523)))

(declare-fun d!117731 () Bool)

(assert (=> d!117731 e!558657))

(declare-fun res!662382 () Bool)

(assert (=> d!117731 (=> (not res!662382) (not e!558657))))

(assert (=> d!117731 (= res!662382 (isStrictlySorted!517 lt!439632))))

(assert (=> d!117731 (= lt!439632 e!558659)))

(assert (=> d!117731 (= c!100523 (and ((_ is Cons!20842) (toList!6822 (+!3092 lt!439287 lt!439289))) (bvslt (_1!7469 (h!22004 (toList!6822 (+!3092 lt!439287 lt!439289)))) (_1!7469 lt!439290))))))

(assert (=> d!117731 (isStrictlySorted!517 (toList!6822 (+!3092 lt!439287 lt!439289)))))

(assert (=> d!117731 (= (insertStrictlySorted!330 (toList!6822 (+!3092 lt!439287 lt!439289)) (_1!7469 lt!439290) (_2!7469 lt!439290)) lt!439632)))

(declare-fun bm!42017 () Bool)

(assert (=> bm!42017 (= call!42020 call!42021)))

(assert (= (and d!117731 c!100523) b!990737))

(assert (= (and d!117731 (not c!100523)) b!990730))

(assert (= (and b!990730 c!100522) b!990731))

(assert (= (and b!990730 (not c!100522)) b!990732))

(assert (= (and b!990732 c!100524) b!990734))

(assert (= (and b!990732 (not c!100524)) b!990735))

(assert (= (or b!990734 b!990735) bm!42017))

(assert (= (or b!990731 bm!42017) bm!42016))

(assert (= (or b!990737 bm!42016) bm!42018))

(assert (= (and bm!42018 c!100521) b!990736))

(assert (= (and bm!42018 (not c!100521)) b!990729))

(assert (= (and d!117731 res!662382) b!990738))

(assert (= (and b!990738 res!662381) b!990733))

(declare-fun m!918459 () Bool)

(assert (=> b!990738 m!918459))

(declare-fun m!918461 () Bool)

(assert (=> bm!42018 m!918461))

(declare-fun m!918463 () Bool)

(assert (=> b!990736 m!918463))

(declare-fun m!918465 () Bool)

(assert (=> d!117731 m!918465))

(declare-fun m!918467 () Bool)

(assert (=> d!117731 m!918467))

(declare-fun m!918469 () Bool)

(assert (=> b!990733 m!918469))

(assert (=> d!117569 d!117731))

(declare-fun d!117733 () Bool)

(assert (=> d!117733 (= (get!15643 (select (arr!30128 _values!1278) from!1932) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1873 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990288 d!117733))

(declare-fun d!117735 () Bool)

(assert (=> d!117735 (= (apply!897 lt!439436 (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15644 (getValueByKey!514 (toList!6822 lt!439436) (select (arr!30127 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28136 () Bool)

(assert (= bs!28136 d!117735))

(assert (=> bs!28136 m!917731))

(assert (=> bs!28136 m!918229))

(assert (=> bs!28136 m!918229))

(declare-fun m!918471 () Bool)

(assert (=> bs!28136 m!918471))

(assert (=> b!990435 d!117735))

(assert (=> b!990435 d!117631))

(declare-fun d!117737 () Bool)

(declare-fun e!558661 () Bool)

(assert (=> d!117737 e!558661))

(declare-fun res!662383 () Bool)

(assert (=> d!117737 (=> res!662383 e!558661)))

(declare-fun lt!439636 () Bool)

(assert (=> d!117737 (= res!662383 (not lt!439636))))

(declare-fun lt!439635 () Bool)

(assert (=> d!117737 (= lt!439636 lt!439635)))

(declare-fun lt!439634 () Unit!32858)

(declare-fun e!558662 () Unit!32858)

(assert (=> d!117737 (= lt!439634 e!558662)))

(declare-fun c!100525 () Bool)

(assert (=> d!117737 (= c!100525 lt!439635)))

(assert (=> d!117737 (= lt!439635 (containsKey!479 (toList!6822 (+!3092 lt!439406 (tuple2!14917 lt!439405 zeroValue!1220))) lt!439424))))

(assert (=> d!117737 (= (contains!5723 (+!3092 lt!439406 (tuple2!14917 lt!439405 zeroValue!1220)) lt!439424) lt!439636)))

(declare-fun b!990739 () Bool)

(declare-fun lt!439633 () Unit!32858)

(assert (=> b!990739 (= e!558662 lt!439633)))

(assert (=> b!990739 (= lt!439633 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 (+!3092 lt!439406 (tuple2!14917 lt!439405 zeroValue!1220))) lt!439424))))

(assert (=> b!990739 (isDefined!384 (getValueByKey!514 (toList!6822 (+!3092 lt!439406 (tuple2!14917 lt!439405 zeroValue!1220))) lt!439424))))

(declare-fun b!990740 () Bool)

(declare-fun Unit!32879 () Unit!32858)

(assert (=> b!990740 (= e!558662 Unit!32879)))

(declare-fun b!990741 () Bool)

(assert (=> b!990741 (= e!558661 (isDefined!384 (getValueByKey!514 (toList!6822 (+!3092 lt!439406 (tuple2!14917 lt!439405 zeroValue!1220))) lt!439424)))))

(assert (= (and d!117737 c!100525) b!990739))

(assert (= (and d!117737 (not c!100525)) b!990740))

(assert (= (and d!117737 (not res!662383)) b!990741))

(declare-fun m!918473 () Bool)

(assert (=> d!117737 m!918473))

(declare-fun m!918475 () Bool)

(assert (=> b!990739 m!918475))

(declare-fun m!918477 () Bool)

(assert (=> b!990739 m!918477))

(assert (=> b!990739 m!918477))

(declare-fun m!918479 () Bool)

(assert (=> b!990739 m!918479))

(assert (=> b!990741 m!918477))

(assert (=> b!990741 m!918477))

(assert (=> b!990741 m!918479))

(assert (=> b!990424 d!117737))

(declare-fun d!117739 () Bool)

(declare-fun e!558663 () Bool)

(assert (=> d!117739 e!558663))

(declare-fun res!662385 () Bool)

(assert (=> d!117739 (=> (not res!662385) (not e!558663))))

(declare-fun lt!439640 () ListLongMap!13613)

(assert (=> d!117739 (= res!662385 (contains!5723 lt!439640 (_1!7469 (tuple2!14917 lt!439418 zeroValue!1220))))))

(declare-fun lt!439638 () List!20846)

(assert (=> d!117739 (= lt!439640 (ListLongMap!13614 lt!439638))))

(declare-fun lt!439639 () Unit!32858)

(declare-fun lt!439637 () Unit!32858)

(assert (=> d!117739 (= lt!439639 lt!439637)))

(assert (=> d!117739 (= (getValueByKey!514 lt!439638 (_1!7469 (tuple2!14917 lt!439418 zeroValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439418 zeroValue!1220))))))

(assert (=> d!117739 (= lt!439637 (lemmaContainsTupThenGetReturnValue!273 lt!439638 (_1!7469 (tuple2!14917 lt!439418 zeroValue!1220)) (_2!7469 (tuple2!14917 lt!439418 zeroValue!1220))))))

(assert (=> d!117739 (= lt!439638 (insertStrictlySorted!330 (toList!6822 lt!439413) (_1!7469 (tuple2!14917 lt!439418 zeroValue!1220)) (_2!7469 (tuple2!14917 lt!439418 zeroValue!1220))))))

(assert (=> d!117739 (= (+!3092 lt!439413 (tuple2!14917 lt!439418 zeroValue!1220)) lt!439640)))

(declare-fun b!990742 () Bool)

(declare-fun res!662384 () Bool)

(assert (=> b!990742 (=> (not res!662384) (not e!558663))))

(assert (=> b!990742 (= res!662384 (= (getValueByKey!514 (toList!6822 lt!439640) (_1!7469 (tuple2!14917 lt!439418 zeroValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439418 zeroValue!1220)))))))

(declare-fun b!990743 () Bool)

(assert (=> b!990743 (= e!558663 (contains!5725 (toList!6822 lt!439640) (tuple2!14917 lt!439418 zeroValue!1220)))))

(assert (= (and d!117739 res!662385) b!990742))

(assert (= (and b!990742 res!662384) b!990743))

(declare-fun m!918481 () Bool)

(assert (=> d!117739 m!918481))

(declare-fun m!918483 () Bool)

(assert (=> d!117739 m!918483))

(declare-fun m!918485 () Bool)

(assert (=> d!117739 m!918485))

(declare-fun m!918487 () Bool)

(assert (=> d!117739 m!918487))

(declare-fun m!918489 () Bool)

(assert (=> b!990742 m!918489))

(declare-fun m!918491 () Bool)

(assert (=> b!990743 m!918491))

(assert (=> b!990424 d!117739))

(declare-fun d!117741 () Bool)

(assert (=> d!117741 (= (apply!897 (+!3092 lt!439413 (tuple2!14917 lt!439418 zeroValue!1220)) lt!439409) (apply!897 lt!439413 lt!439409))))

(declare-fun lt!439641 () Unit!32858)

(assert (=> d!117741 (= lt!439641 (choose!1618 lt!439413 lt!439418 zeroValue!1220 lt!439409))))

(declare-fun e!558664 () Bool)

(assert (=> d!117741 e!558664))

(declare-fun res!662386 () Bool)

(assert (=> d!117741 (=> (not res!662386) (not e!558664))))

(assert (=> d!117741 (= res!662386 (contains!5723 lt!439413 lt!439409))))

(assert (=> d!117741 (= (addApplyDifferent!476 lt!439413 lt!439418 zeroValue!1220 lt!439409) lt!439641)))

(declare-fun b!990744 () Bool)

(assert (=> b!990744 (= e!558664 (not (= lt!439409 lt!439418)))))

(assert (= (and d!117741 res!662386) b!990744))

(assert (=> d!117741 m!917837))

(declare-fun m!918493 () Bool)

(assert (=> d!117741 m!918493))

(declare-fun m!918495 () Bool)

(assert (=> d!117741 m!918495))

(assert (=> d!117741 m!917833))

(assert (=> d!117741 m!917857))

(assert (=> d!117741 m!917833))

(assert (=> b!990424 d!117741))

(declare-fun d!117743 () Bool)

(assert (=> d!117743 (= (apply!897 (+!3092 lt!439422 (tuple2!14917 lt!439423 minValue!1220)) lt!439415) (apply!897 lt!439422 lt!439415))))

(declare-fun lt!439642 () Unit!32858)

(assert (=> d!117743 (= lt!439642 (choose!1618 lt!439422 lt!439423 minValue!1220 lt!439415))))

(declare-fun e!558665 () Bool)

(assert (=> d!117743 e!558665))

(declare-fun res!662387 () Bool)

(assert (=> d!117743 (=> (not res!662387) (not e!558665))))

(assert (=> d!117743 (= res!662387 (contains!5723 lt!439422 lt!439415))))

(assert (=> d!117743 (= (addApplyDifferent!476 lt!439422 lt!439423 minValue!1220 lt!439415) lt!439642)))

(declare-fun b!990745 () Bool)

(assert (=> b!990745 (= e!558665 (not (= lt!439415 lt!439423)))))

(assert (= (and d!117743 res!662387) b!990745))

(assert (=> d!117743 m!917855))

(declare-fun m!918497 () Bool)

(assert (=> d!117743 m!918497))

(declare-fun m!918499 () Bool)

(assert (=> d!117743 m!918499))

(assert (=> d!117743 m!917845))

(assert (=> d!117743 m!917847))

(assert (=> d!117743 m!917845))

(assert (=> b!990424 d!117743))

(declare-fun d!117745 () Bool)

(declare-fun e!558666 () Bool)

(assert (=> d!117745 e!558666))

(declare-fun res!662389 () Bool)

(assert (=> d!117745 (=> (not res!662389) (not e!558666))))

(declare-fun lt!439646 () ListLongMap!13613)

(assert (=> d!117745 (= res!662389 (contains!5723 lt!439646 (_1!7469 (tuple2!14917 lt!439423 minValue!1220))))))

(declare-fun lt!439644 () List!20846)

(assert (=> d!117745 (= lt!439646 (ListLongMap!13614 lt!439644))))

(declare-fun lt!439645 () Unit!32858)

(declare-fun lt!439643 () Unit!32858)

(assert (=> d!117745 (= lt!439645 lt!439643)))

(assert (=> d!117745 (= (getValueByKey!514 lt!439644 (_1!7469 (tuple2!14917 lt!439423 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439423 minValue!1220))))))

(assert (=> d!117745 (= lt!439643 (lemmaContainsTupThenGetReturnValue!273 lt!439644 (_1!7469 (tuple2!14917 lt!439423 minValue!1220)) (_2!7469 (tuple2!14917 lt!439423 minValue!1220))))))

(assert (=> d!117745 (= lt!439644 (insertStrictlySorted!330 (toList!6822 lt!439422) (_1!7469 (tuple2!14917 lt!439423 minValue!1220)) (_2!7469 (tuple2!14917 lt!439423 minValue!1220))))))

(assert (=> d!117745 (= (+!3092 lt!439422 (tuple2!14917 lt!439423 minValue!1220)) lt!439646)))

(declare-fun b!990746 () Bool)

(declare-fun res!662388 () Bool)

(assert (=> b!990746 (=> (not res!662388) (not e!558666))))

(assert (=> b!990746 (= res!662388 (= (getValueByKey!514 (toList!6822 lt!439646) (_1!7469 (tuple2!14917 lt!439423 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439423 minValue!1220)))))))

(declare-fun b!990747 () Bool)

(assert (=> b!990747 (= e!558666 (contains!5725 (toList!6822 lt!439646) (tuple2!14917 lt!439423 minValue!1220)))))

(assert (= (and d!117745 res!662389) b!990746))

(assert (= (and b!990746 res!662388) b!990747))

(declare-fun m!918501 () Bool)

(assert (=> d!117745 m!918501))

(declare-fun m!918503 () Bool)

(assert (=> d!117745 m!918503))

(declare-fun m!918505 () Bool)

(assert (=> d!117745 m!918505))

(declare-fun m!918507 () Bool)

(assert (=> d!117745 m!918507))

(declare-fun m!918509 () Bool)

(assert (=> b!990746 m!918509))

(declare-fun m!918511 () Bool)

(assert (=> b!990747 m!918511))

(assert (=> b!990424 d!117745))

(declare-fun d!117747 () Bool)

(declare-fun e!558667 () Bool)

(assert (=> d!117747 e!558667))

(declare-fun res!662391 () Bool)

(assert (=> d!117747 (=> (not res!662391) (not e!558667))))

(declare-fun lt!439650 () ListLongMap!13613)

(assert (=> d!117747 (= res!662391 (contains!5723 lt!439650 (_1!7469 (tuple2!14917 lt!439419 minValue!1220))))))

(declare-fun lt!439648 () List!20846)

(assert (=> d!117747 (= lt!439650 (ListLongMap!13614 lt!439648))))

(declare-fun lt!439649 () Unit!32858)

(declare-fun lt!439647 () Unit!32858)

(assert (=> d!117747 (= lt!439649 lt!439647)))

(assert (=> d!117747 (= (getValueByKey!514 lt!439648 (_1!7469 (tuple2!14917 lt!439419 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439419 minValue!1220))))))

(assert (=> d!117747 (= lt!439647 (lemmaContainsTupThenGetReturnValue!273 lt!439648 (_1!7469 (tuple2!14917 lt!439419 minValue!1220)) (_2!7469 (tuple2!14917 lt!439419 minValue!1220))))))

(assert (=> d!117747 (= lt!439648 (insertStrictlySorted!330 (toList!6822 lt!439412) (_1!7469 (tuple2!14917 lt!439419 minValue!1220)) (_2!7469 (tuple2!14917 lt!439419 minValue!1220))))))

(assert (=> d!117747 (= (+!3092 lt!439412 (tuple2!14917 lt!439419 minValue!1220)) lt!439650)))

(declare-fun b!990748 () Bool)

(declare-fun res!662390 () Bool)

(assert (=> b!990748 (=> (not res!662390) (not e!558667))))

(assert (=> b!990748 (= res!662390 (= (getValueByKey!514 (toList!6822 lt!439650) (_1!7469 (tuple2!14917 lt!439419 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439419 minValue!1220)))))))

(declare-fun b!990749 () Bool)

(assert (=> b!990749 (= e!558667 (contains!5725 (toList!6822 lt!439650) (tuple2!14917 lt!439419 minValue!1220)))))

(assert (= (and d!117747 res!662391) b!990748))

(assert (= (and b!990748 res!662390) b!990749))

(declare-fun m!918513 () Bool)

(assert (=> d!117747 m!918513))

(declare-fun m!918515 () Bool)

(assert (=> d!117747 m!918515))

(declare-fun m!918517 () Bool)

(assert (=> d!117747 m!918517))

(declare-fun m!918519 () Bool)

(assert (=> d!117747 m!918519))

(declare-fun m!918521 () Bool)

(assert (=> b!990748 m!918521))

(declare-fun m!918523 () Bool)

(assert (=> b!990749 m!918523))

(assert (=> b!990424 d!117747))

(declare-fun d!117749 () Bool)

(declare-fun e!558668 () Bool)

(assert (=> d!117749 e!558668))

(declare-fun res!662393 () Bool)

(assert (=> d!117749 (=> (not res!662393) (not e!558668))))

(declare-fun lt!439654 () ListLongMap!13613)

(assert (=> d!117749 (= res!662393 (contains!5723 lt!439654 (_1!7469 (tuple2!14917 lt!439405 zeroValue!1220))))))

(declare-fun lt!439652 () List!20846)

(assert (=> d!117749 (= lt!439654 (ListLongMap!13614 lt!439652))))

(declare-fun lt!439653 () Unit!32858)

(declare-fun lt!439651 () Unit!32858)

(assert (=> d!117749 (= lt!439653 lt!439651)))

(assert (=> d!117749 (= (getValueByKey!514 lt!439652 (_1!7469 (tuple2!14917 lt!439405 zeroValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439405 zeroValue!1220))))))

(assert (=> d!117749 (= lt!439651 (lemmaContainsTupThenGetReturnValue!273 lt!439652 (_1!7469 (tuple2!14917 lt!439405 zeroValue!1220)) (_2!7469 (tuple2!14917 lt!439405 zeroValue!1220))))))

(assert (=> d!117749 (= lt!439652 (insertStrictlySorted!330 (toList!6822 lt!439406) (_1!7469 (tuple2!14917 lt!439405 zeroValue!1220)) (_2!7469 (tuple2!14917 lt!439405 zeroValue!1220))))))

(assert (=> d!117749 (= (+!3092 lt!439406 (tuple2!14917 lt!439405 zeroValue!1220)) lt!439654)))

(declare-fun b!990750 () Bool)

(declare-fun res!662392 () Bool)

(assert (=> b!990750 (=> (not res!662392) (not e!558668))))

(assert (=> b!990750 (= res!662392 (= (getValueByKey!514 (toList!6822 lt!439654) (_1!7469 (tuple2!14917 lt!439405 zeroValue!1220))) (Some!519 (_2!7469 (tuple2!14917 lt!439405 zeroValue!1220)))))))

(declare-fun b!990751 () Bool)

(assert (=> b!990751 (= e!558668 (contains!5725 (toList!6822 lt!439654) (tuple2!14917 lt!439405 zeroValue!1220)))))

(assert (= (and d!117749 res!662393) b!990750))

(assert (= (and b!990750 res!662392) b!990751))

(declare-fun m!918525 () Bool)

(assert (=> d!117749 m!918525))

(declare-fun m!918527 () Bool)

(assert (=> d!117749 m!918527))

(declare-fun m!918529 () Bool)

(assert (=> d!117749 m!918529))

(declare-fun m!918531 () Bool)

(assert (=> d!117749 m!918531))

(declare-fun m!918533 () Bool)

(assert (=> b!990750 m!918533))

(declare-fun m!918535 () Bool)

(assert (=> b!990751 m!918535))

(assert (=> b!990424 d!117749))

(declare-fun d!117751 () Bool)

(assert (=> d!117751 (= (apply!897 (+!3092 lt!439412 (tuple2!14917 lt!439419 minValue!1220)) lt!439411) (get!15644 (getValueByKey!514 (toList!6822 (+!3092 lt!439412 (tuple2!14917 lt!439419 minValue!1220))) lt!439411)))))

(declare-fun bs!28137 () Bool)

(assert (= bs!28137 d!117751))

(declare-fun m!918537 () Bool)

(assert (=> bs!28137 m!918537))

(assert (=> bs!28137 m!918537))

(declare-fun m!918539 () Bool)

(assert (=> bs!28137 m!918539))

(assert (=> b!990424 d!117751))

(assert (=> b!990424 d!117663))

(declare-fun d!117753 () Bool)

(assert (=> d!117753 (= (apply!897 lt!439422 lt!439415) (get!15644 (getValueByKey!514 (toList!6822 lt!439422) lt!439415)))))

(declare-fun bs!28138 () Bool)

(assert (= bs!28138 d!117753))

(declare-fun m!918541 () Bool)

(assert (=> bs!28138 m!918541))

(assert (=> bs!28138 m!918541))

(declare-fun m!918543 () Bool)

(assert (=> bs!28138 m!918543))

(assert (=> b!990424 d!117753))

(declare-fun d!117755 () Bool)

(assert (=> d!117755 (= (apply!897 lt!439413 lt!439409) (get!15644 (getValueByKey!514 (toList!6822 lt!439413) lt!439409)))))

(declare-fun bs!28139 () Bool)

(assert (= bs!28139 d!117755))

(declare-fun m!918545 () Bool)

(assert (=> bs!28139 m!918545))

(assert (=> bs!28139 m!918545))

(declare-fun m!918547 () Bool)

(assert (=> bs!28139 m!918547))

(assert (=> b!990424 d!117755))

(declare-fun d!117757 () Bool)

(assert (=> d!117757 (= (apply!897 (+!3092 lt!439422 (tuple2!14917 lt!439423 minValue!1220)) lt!439415) (get!15644 (getValueByKey!514 (toList!6822 (+!3092 lt!439422 (tuple2!14917 lt!439423 minValue!1220))) lt!439415)))))

(declare-fun bs!28140 () Bool)

(assert (= bs!28140 d!117757))

(declare-fun m!918549 () Bool)

(assert (=> bs!28140 m!918549))

(assert (=> bs!28140 m!918549))

(declare-fun m!918551 () Bool)

(assert (=> bs!28140 m!918551))

(assert (=> b!990424 d!117757))

(declare-fun d!117759 () Bool)

(assert (=> d!117759 (= (apply!897 lt!439412 lt!439411) (get!15644 (getValueByKey!514 (toList!6822 lt!439412) lt!439411)))))

(declare-fun bs!28141 () Bool)

(assert (= bs!28141 d!117759))

(declare-fun m!918553 () Bool)

(assert (=> bs!28141 m!918553))

(assert (=> bs!28141 m!918553))

(declare-fun m!918555 () Bool)

(assert (=> bs!28141 m!918555))

(assert (=> b!990424 d!117759))

(declare-fun d!117761 () Bool)

(assert (=> d!117761 (= (apply!897 (+!3092 lt!439413 (tuple2!14917 lt!439418 zeroValue!1220)) lt!439409) (get!15644 (getValueByKey!514 (toList!6822 (+!3092 lt!439413 (tuple2!14917 lt!439418 zeroValue!1220))) lt!439409)))))

(declare-fun bs!28142 () Bool)

(assert (= bs!28142 d!117761))

(declare-fun m!918557 () Bool)

(assert (=> bs!28142 m!918557))

(assert (=> bs!28142 m!918557))

(declare-fun m!918559 () Bool)

(assert (=> bs!28142 m!918559))

(assert (=> b!990424 d!117761))

(declare-fun d!117763 () Bool)

(assert (=> d!117763 (contains!5723 (+!3092 lt!439406 (tuple2!14917 lt!439405 zeroValue!1220)) lt!439424)))

(declare-fun lt!439655 () Unit!32858)

(assert (=> d!117763 (= lt!439655 (choose!1619 lt!439406 lt!439405 zeroValue!1220 lt!439424))))

(assert (=> d!117763 (contains!5723 lt!439406 lt!439424)))

(assert (=> d!117763 (= (addStillContains!616 lt!439406 lt!439405 zeroValue!1220 lt!439424) lt!439655)))

(declare-fun bs!28143 () Bool)

(assert (= bs!28143 d!117763))

(assert (=> bs!28143 m!917849))

(assert (=> bs!28143 m!917849))

(assert (=> bs!28143 m!917851))

(declare-fun m!918561 () Bool)

(assert (=> bs!28143 m!918561))

(declare-fun m!918563 () Bool)

(assert (=> bs!28143 m!918563))

(assert (=> b!990424 d!117763))

(declare-fun d!117765 () Bool)

(assert (=> d!117765 (= (apply!897 (+!3092 lt!439412 (tuple2!14917 lt!439419 minValue!1220)) lt!439411) (apply!897 lt!439412 lt!439411))))

(declare-fun lt!439656 () Unit!32858)

(assert (=> d!117765 (= lt!439656 (choose!1618 lt!439412 lt!439419 minValue!1220 lt!439411))))

(declare-fun e!558669 () Bool)

(assert (=> d!117765 e!558669))

(declare-fun res!662394 () Bool)

(assert (=> d!117765 (=> (not res!662394) (not e!558669))))

(assert (=> d!117765 (= res!662394 (contains!5723 lt!439412 lt!439411))))

(assert (=> d!117765 (= (addApplyDifferent!476 lt!439412 lt!439419 minValue!1220 lt!439411) lt!439656)))

(declare-fun b!990752 () Bool)

(assert (=> b!990752 (= e!558669 (not (= lt!439411 lt!439419)))))

(assert (= (and d!117765 res!662394) b!990752))

(assert (=> d!117765 m!917843))

(declare-fun m!918565 () Bool)

(assert (=> d!117765 m!918565))

(declare-fun m!918567 () Bool)

(assert (=> d!117765 m!918567))

(assert (=> d!117765 m!917829))

(assert (=> d!117765 m!917831))

(assert (=> d!117765 m!917829))

(assert (=> b!990424 d!117765))

(assert (=> b!990351 d!117621))

(declare-fun d!117767 () Bool)

(declare-fun e!558670 () Bool)

(assert (=> d!117767 e!558670))

(declare-fun res!662395 () Bool)

(assert (=> d!117767 (=> res!662395 e!558670)))

(declare-fun lt!439660 () Bool)

(assert (=> d!117767 (= res!662395 (not lt!439660))))

(declare-fun lt!439659 () Bool)

(assert (=> d!117767 (= lt!439660 lt!439659)))

(declare-fun lt!439658 () Unit!32858)

(declare-fun e!558671 () Unit!32858)

(assert (=> d!117767 (= lt!439658 e!558671)))

(declare-fun c!100526 () Bool)

(assert (=> d!117767 (= c!100526 lt!439659)))

(assert (=> d!117767 (= lt!439659 (containsKey!479 (toList!6822 lt!439454) (_1!7469 lt!439290)))))

(assert (=> d!117767 (= (contains!5723 lt!439454 (_1!7469 lt!439290)) lt!439660)))

(declare-fun b!990753 () Bool)

(declare-fun lt!439657 () Unit!32858)

(assert (=> b!990753 (= e!558671 lt!439657)))

(assert (=> b!990753 (= lt!439657 (lemmaContainsKeyImpliesGetValueByKeyDefined!375 (toList!6822 lt!439454) (_1!7469 lt!439290)))))

(assert (=> b!990753 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439454) (_1!7469 lt!439290)))))

(declare-fun b!990754 () Bool)

(declare-fun Unit!32880 () Unit!32858)

(assert (=> b!990754 (= e!558671 Unit!32880)))

(declare-fun b!990755 () Bool)

(assert (=> b!990755 (= e!558670 (isDefined!384 (getValueByKey!514 (toList!6822 lt!439454) (_1!7469 lt!439290))))))

(assert (= (and d!117767 c!100526) b!990753))

(assert (= (and d!117767 (not c!100526)) b!990754))

(assert (= (and d!117767 (not res!662395)) b!990755))

(declare-fun m!918569 () Bool)

(assert (=> d!117767 m!918569))

(declare-fun m!918571 () Bool)

(assert (=> b!990753 m!918571))

(assert (=> b!990753 m!917931))

(assert (=> b!990753 m!917931))

(declare-fun m!918573 () Bool)

(assert (=> b!990753 m!918573))

(assert (=> b!990755 m!917931))

(assert (=> b!990755 m!917931))

(assert (=> b!990755 m!918573))

(assert (=> d!117571 d!117767))

(declare-fun b!990757 () Bool)

(declare-fun e!558672 () Option!520)

(declare-fun e!558673 () Option!520)

(assert (=> b!990757 (= e!558672 e!558673)))

(declare-fun c!100528 () Bool)

(assert (=> b!990757 (= c!100528 (and ((_ is Cons!20842) lt!439452) (not (= (_1!7469 (h!22004 lt!439452)) (_1!7469 lt!439290)))))))

(declare-fun d!117769 () Bool)

(declare-fun c!100527 () Bool)

(assert (=> d!117769 (= c!100527 (and ((_ is Cons!20842) lt!439452) (= (_1!7469 (h!22004 lt!439452)) (_1!7469 lt!439290))))))

(assert (=> d!117769 (= (getValueByKey!514 lt!439452 (_1!7469 lt!439290)) e!558672)))

(declare-fun b!990756 () Bool)

(assert (=> b!990756 (= e!558672 (Some!519 (_2!7469 (h!22004 lt!439452))))))

(declare-fun b!990758 () Bool)

(assert (=> b!990758 (= e!558673 (getValueByKey!514 (t!29821 lt!439452) (_1!7469 lt!439290)))))

(declare-fun b!990759 () Bool)

(assert (=> b!990759 (= e!558673 None!518)))

(assert (= (and d!117769 c!100527) b!990756))

(assert (= (and d!117769 (not c!100527)) b!990757))

(assert (= (and b!990757 c!100528) b!990758))

(assert (= (and b!990757 (not c!100528)) b!990759))

(declare-fun m!918575 () Bool)

(assert (=> b!990758 m!918575))

(assert (=> d!117571 d!117769))

(declare-fun d!117771 () Bool)

(assert (=> d!117771 (= (getValueByKey!514 lt!439452 (_1!7469 lt!439290)) (Some!519 (_2!7469 lt!439290)))))

(declare-fun lt!439661 () Unit!32858)

(assert (=> d!117771 (= lt!439661 (choose!1616 lt!439452 (_1!7469 lt!439290) (_2!7469 lt!439290)))))

(declare-fun e!558674 () Bool)

(assert (=> d!117771 e!558674))

(declare-fun res!662396 () Bool)

(assert (=> d!117771 (=> (not res!662396) (not e!558674))))

(assert (=> d!117771 (= res!662396 (isStrictlySorted!517 lt!439452))))

(assert (=> d!117771 (= (lemmaContainsTupThenGetReturnValue!273 lt!439452 (_1!7469 lt!439290) (_2!7469 lt!439290)) lt!439661)))

(declare-fun b!990760 () Bool)

(declare-fun res!662397 () Bool)

(assert (=> b!990760 (=> (not res!662397) (not e!558674))))

(assert (=> b!990760 (= res!662397 (containsKey!479 lt!439452 (_1!7469 lt!439290)))))

(declare-fun b!990761 () Bool)

(assert (=> b!990761 (= e!558674 (contains!5725 lt!439452 (tuple2!14917 (_1!7469 lt!439290) (_2!7469 lt!439290))))))

(assert (= (and d!117771 res!662396) b!990760))

(assert (= (and b!990760 res!662397) b!990761))

(assert (=> d!117771 m!917925))

(declare-fun m!918577 () Bool)

(assert (=> d!117771 m!918577))

(declare-fun m!918579 () Bool)

(assert (=> d!117771 m!918579))

(declare-fun m!918581 () Bool)

(assert (=> b!990760 m!918581))

(declare-fun m!918583 () Bool)

(assert (=> b!990761 m!918583))

(assert (=> d!117571 d!117771))

(declare-fun b!990762 () Bool)

(declare-fun c!100532 () Bool)

(declare-fun c!100530 () Bool)

(declare-fun e!558675 () List!20846)

(assert (=> b!990762 (= e!558675 (ite c!100530 (t!29821 (toList!6822 lt!439287)) (ite c!100532 (Cons!20842 (h!22004 (toList!6822 lt!439287)) (t!29821 (toList!6822 lt!439287))) Nil!20843)))))

(declare-fun b!990763 () Bool)

(declare-fun e!558678 () List!20846)

(declare-fun e!558679 () List!20846)

(assert (=> b!990763 (= e!558678 e!558679)))

(assert (=> b!990763 (= c!100530 (and ((_ is Cons!20842) (toList!6822 lt!439287)) (= (_1!7469 (h!22004 (toList!6822 lt!439287))) (_1!7469 lt!439290))))))

(declare-fun b!990764 () Bool)

(declare-fun call!42024 () List!20846)

(assert (=> b!990764 (= e!558679 call!42024)))

(declare-fun b!990765 () Bool)

(assert (=> b!990765 (= c!100532 (and ((_ is Cons!20842) (toList!6822 lt!439287)) (bvsgt (_1!7469 (h!22004 (toList!6822 lt!439287))) (_1!7469 lt!439290))))))

(declare-fun e!558677 () List!20846)

(assert (=> b!990765 (= e!558679 e!558677)))

(declare-fun b!990766 () Bool)

(declare-fun e!558676 () Bool)

(declare-fun lt!439662 () List!20846)

(assert (=> b!990766 (= e!558676 (contains!5725 lt!439662 (tuple2!14917 (_1!7469 lt!439290) (_2!7469 lt!439290))))))

(declare-fun b!990767 () Bool)

(declare-fun call!42023 () List!20846)

(assert (=> b!990767 (= e!558677 call!42023)))

(declare-fun b!990768 () Bool)

(assert (=> b!990768 (= e!558677 call!42023)))

(declare-fun bm!42019 () Bool)

(declare-fun call!42022 () List!20846)

(assert (=> bm!42019 (= call!42024 call!42022)))

(declare-fun b!990769 () Bool)

(assert (=> b!990769 (= e!558675 (insertStrictlySorted!330 (t!29821 (toList!6822 lt!439287)) (_1!7469 lt!439290) (_2!7469 lt!439290)))))

(declare-fun b!990770 () Bool)

(assert (=> b!990770 (= e!558678 call!42022)))

(declare-fun b!990771 () Bool)

(declare-fun res!662398 () Bool)

(assert (=> b!990771 (=> (not res!662398) (not e!558676))))

(assert (=> b!990771 (= res!662398 (containsKey!479 lt!439662 (_1!7469 lt!439290)))))

(declare-fun bm!42021 () Bool)

(declare-fun c!100531 () Bool)

(assert (=> bm!42021 (= call!42022 ($colon$colon!556 e!558675 (ite c!100531 (h!22004 (toList!6822 lt!439287)) (tuple2!14917 (_1!7469 lt!439290) (_2!7469 lt!439290)))))))

(declare-fun c!100529 () Bool)

(assert (=> bm!42021 (= c!100529 c!100531)))

(declare-fun d!117773 () Bool)

(assert (=> d!117773 e!558676))

(declare-fun res!662399 () Bool)

(assert (=> d!117773 (=> (not res!662399) (not e!558676))))

(assert (=> d!117773 (= res!662399 (isStrictlySorted!517 lt!439662))))

(assert (=> d!117773 (= lt!439662 e!558678)))

(assert (=> d!117773 (= c!100531 (and ((_ is Cons!20842) (toList!6822 lt!439287)) (bvslt (_1!7469 (h!22004 (toList!6822 lt!439287))) (_1!7469 lt!439290))))))

(assert (=> d!117773 (isStrictlySorted!517 (toList!6822 lt!439287))))

(assert (=> d!117773 (= (insertStrictlySorted!330 (toList!6822 lt!439287) (_1!7469 lt!439290) (_2!7469 lt!439290)) lt!439662)))

(declare-fun bm!42020 () Bool)

(assert (=> bm!42020 (= call!42023 call!42024)))

(assert (= (and d!117773 c!100531) b!990770))

(assert (= (and d!117773 (not c!100531)) b!990763))

(assert (= (and b!990763 c!100530) b!990764))

(assert (= (and b!990763 (not c!100530)) b!990765))

(assert (= (and b!990765 c!100532) b!990767))

(assert (= (and b!990765 (not c!100532)) b!990768))

(assert (= (or b!990767 b!990768) bm!42020))

(assert (= (or b!990764 bm!42020) bm!42019))

(assert (= (or b!990770 bm!42019) bm!42021))

(assert (= (and bm!42021 c!100529) b!990769))

(assert (= (and bm!42021 (not c!100529)) b!990762))

(assert (= (and d!117773 res!662399) b!990771))

(assert (= (and b!990771 res!662398) b!990766))

(declare-fun m!918585 () Bool)

(assert (=> b!990771 m!918585))

(declare-fun m!918587 () Bool)

(assert (=> bm!42021 m!918587))

(declare-fun m!918589 () Bool)

(assert (=> b!990769 m!918589))

(declare-fun m!918591 () Bool)

(assert (=> d!117773 m!918591))

(assert (=> d!117773 m!918221))

(declare-fun m!918593 () Bool)

(assert (=> b!990766 m!918593))

(assert (=> d!117571 d!117773))

(declare-fun d!117775 () Bool)

(declare-fun e!558680 () Bool)

(assert (=> d!117775 e!558680))

(declare-fun res!662401 () Bool)

(assert (=> d!117775 (=> (not res!662401) (not e!558680))))

(declare-fun lt!439666 () ListLongMap!13613)

(assert (=> d!117775 (= res!662401 (contains!5723 lt!439666 (_1!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439664 () List!20846)

(assert (=> d!117775 (= lt!439666 (ListLongMap!13614 lt!439664))))

(declare-fun lt!439665 () Unit!32858)

(declare-fun lt!439663 () Unit!32858)

(assert (=> d!117775 (= lt!439665 lt!439663)))

(assert (=> d!117775 (= (getValueByKey!514 lt!439664 (_1!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!519 (_2!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117775 (= lt!439663 (lemmaContainsTupThenGetReturnValue!273 lt!439664 (_1!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117775 (= lt!439664 (insertStrictlySorted!330 (toList!6822 (ite c!100433 call!41987 (ite c!100432 call!41988 call!41992))) (_1!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117775 (= (+!3092 (ite c!100433 call!41987 (ite c!100432 call!41988 call!41992)) (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439666)))

(declare-fun b!990772 () Bool)

(declare-fun res!662400 () Bool)

(assert (=> b!990772 (=> (not res!662400) (not e!558680))))

(assert (=> b!990772 (= res!662400 (= (getValueByKey!514 (toList!6822 lt!439666) (_1!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!519 (_2!7469 (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!990773 () Bool)

(assert (=> b!990773 (= e!558680 (contains!5725 (toList!6822 lt!439666) (ite (or c!100433 c!100432) (tuple2!14917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117775 res!662401) b!990772))

(assert (= (and b!990772 res!662400) b!990773))

(declare-fun m!918595 () Bool)

(assert (=> d!117775 m!918595))

(declare-fun m!918597 () Bool)

(assert (=> d!117775 m!918597))

(declare-fun m!918599 () Bool)

(assert (=> d!117775 m!918599))

(declare-fun m!918601 () Bool)

(assert (=> d!117775 m!918601))

(declare-fun m!918603 () Bool)

(assert (=> b!990772 m!918603))

(declare-fun m!918605 () Bool)

(assert (=> b!990773 m!918605))

(assert (=> bm!41986 d!117775))

(declare-fun d!117777 () Bool)

(declare-fun e!558681 () Bool)

(assert (=> d!117777 e!558681))

(declare-fun res!662403 () Bool)

(assert (=> d!117777 (=> (not res!662403) (not e!558681))))

(declare-fun lt!439670 () ListLongMap!13613)

(assert (=> d!117777 (= res!662403 (contains!5723 lt!439670 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439668 () List!20846)

(assert (=> d!117777 (= lt!439670 (ListLongMap!13614 lt!439668))))

(declare-fun lt!439669 () Unit!32858)

(declare-fun lt!439667 () Unit!32858)

(assert (=> d!117777 (= lt!439669 lt!439667)))

(assert (=> d!117777 (= (getValueByKey!514 lt!439668 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117777 (= lt!439667 (lemmaContainsTupThenGetReturnValue!273 lt!439668 (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117777 (= lt!439668 (insertStrictlySorted!330 (toList!6822 call!41991) (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117777 (= (+!3092 call!41991 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439670)))

(declare-fun b!990774 () Bool)

(declare-fun res!662402 () Bool)

(assert (=> b!990774 (=> (not res!662402) (not e!558681))))

(assert (=> b!990774 (= res!662402 (= (getValueByKey!514 (toList!6822 lt!439670) (_1!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!519 (_2!7469 (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990775 () Bool)

(assert (=> b!990775 (= e!558681 (contains!5725 (toList!6822 lt!439670) (tuple2!14917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117777 res!662403) b!990774))

(assert (= (and b!990774 res!662402) b!990775))

(declare-fun m!918607 () Bool)

(assert (=> d!117777 m!918607))

(declare-fun m!918609 () Bool)

(assert (=> d!117777 m!918609))

(declare-fun m!918611 () Bool)

(assert (=> d!117777 m!918611))

(declare-fun m!918613 () Bool)

(assert (=> d!117777 m!918613))

(declare-fun m!918615 () Bool)

(assert (=> b!990774 m!918615))

(declare-fun m!918617 () Bool)

(assert (=> b!990775 m!918617))

(assert (=> b!990412 d!117777))

(assert (=> b!990440 d!117577))

(declare-fun b!990776 () Bool)

(declare-fun e!558683 () Bool)

(assert (=> b!990776 (= e!558683 tp_is_empty!23295)))

(declare-fun b!990777 () Bool)

(declare-fun e!558682 () Bool)

(assert (=> b!990777 (= e!558682 tp_is_empty!23295)))

(declare-fun mapNonEmpty!36998 () Bool)

(declare-fun mapRes!36998 () Bool)

(declare-fun tp!70042 () Bool)

(assert (=> mapNonEmpty!36998 (= mapRes!36998 (and tp!70042 e!558683))))

(declare-fun mapRest!36998 () (Array (_ BitVec 32) ValueCell!11166))

(declare-fun mapValue!36998 () ValueCell!11166)

(declare-fun mapKey!36998 () (_ BitVec 32))

(assert (=> mapNonEmpty!36998 (= mapRest!36997 (store mapRest!36998 mapKey!36998 mapValue!36998))))

(declare-fun condMapEmpty!36998 () Bool)

(declare-fun mapDefault!36998 () ValueCell!11166)

(assert (=> mapNonEmpty!36997 (= condMapEmpty!36998 (= mapRest!36997 ((as const (Array (_ BitVec 32) ValueCell!11166)) mapDefault!36998)))))

(assert (=> mapNonEmpty!36997 (= tp!70041 (and e!558682 mapRes!36998))))

(declare-fun mapIsEmpty!36998 () Bool)

(assert (=> mapIsEmpty!36998 mapRes!36998))

(assert (= (and mapNonEmpty!36997 condMapEmpty!36998) mapIsEmpty!36998))

(assert (= (and mapNonEmpty!36997 (not condMapEmpty!36998)) mapNonEmpty!36998))

(assert (= (and mapNonEmpty!36998 ((_ is ValueCellFull!11166) mapValue!36998)) b!990776))

(assert (= (and mapNonEmpty!36997 ((_ is ValueCellFull!11166) mapDefault!36998)) b!990777))

(declare-fun m!918619 () Bool)

(assert (=> mapNonEmpty!36998 m!918619))

(declare-fun b_lambda!15189 () Bool)

(assert (= b_lambda!15185 (or (and start!84668 b_free!20079) b_lambda!15189)))

(declare-fun b_lambda!15191 () Bool)

(assert (= b_lambda!15183 (or (and start!84668 b_free!20079) b_lambda!15191)))

(declare-fun b_lambda!15193 () Bool)

(assert (= b_lambda!15187 (or (and start!84668 b_free!20079) b_lambda!15193)))

(declare-fun b_lambda!15195 () Bool)

(assert (= b_lambda!15181 (or (and start!84668 b_free!20079) b_lambda!15195)))

(check-sat (not d!117575) (not d!117699) (not d!117595) (not d!117679) (not d!117747) (not b!990746) (not b!990700) (not d!117729) (not b!990743) (not b!990639) (not d!117629) (not b!990561) (not b_lambda!15193) (not d!117735) (not b!990739) (not b!990748) (not d!117669) (not b!990597) (not b!990538) (not d!117647) (not bm!42018) (not b!990670) (not d!117677) (not b!990596) (not b!990701) (not b!990719) (not b!990601) (not b!990585) (not d!117767) (not b!990638) (not d!117637) (not b!990712) (not d!117691) (not d!117653) (not b!990592) (not b!990686) (not d!117759) (not d!117611) (not bm!42010) (not d!117713) (not b_lambda!15195) (not b!990581) (not d!117583) (not b!990720) (not b!990771) (not b!990738) (not b!990549) (not d!117625) (not b!990702) (not b!990555) (not d!117599) (not b!990571) (not d!117585) (not d!117777) (not b!990553) (not b!990685) (not d!117649) (not b!990582) (not b!990633) (not d!117739) (not d!117687) (not b!990751) (not d!117725) (not b!990657) (not d!117755) (not b!990570) (not b_lambda!15175) (not d!117661) (not b!990541) (not d!117761) (not b!990671) (not b_next!20079) (not b!990548) (not b!990658) b_and!32251 (not d!117665) (not b!990693) (not b!990680) (not b!990649) (not b!990559) (not b!990564) (not bm!42014) (not d!117705) (not d!117751) (not d!117709) (not b!990689) (not b!990543) (not b!990716) (not d!117601) (not bm!42013) (not b!990733) (not b!990530) (not b!990673) (not b!990587) (not b!990656) (not d!117763) (not bm!42021) (not d!117753) (not b!990568) (not b_lambda!15191) (not b!990682) (not b!990552) (not b!990574) (not b!990479) (not b!990609) (not b!990647) (not d!117757) (not d!117675) (not b!990663) (not b!990591) (not b_lambda!15179) (not b!990692) (not d!117745) (not b!990527) (not d!117615) (not d!117701) (not b_lambda!15177) (not b!990630) (not b!990551) (not b!990522) (not b!990550) (not b!990524) (not b!990599) (not b!990742) (not b!990636) (not b!990546) (not d!117685) (not d!117711) (not d!117723) (not b!990603) (not b!990576) (not b!990521) (not d!117603) (not b_lambda!15163) (not b!990575) (not d!117623) (not b!990650) (not b!990652) (not b!990750) (not b!990631) (not b!990695) (not d!117663) (not b!990588) (not b!990481) (not d!117593) (not b!990758) (not d!117743) (not bm!42009) (not d!117659) (not bm!42008) (not b!990761) (not b!990694) (not d!117771) (not b!990773) (not d!117775) (not b!990484) (not d!117587) (not d!117681) (not d!117657) (not b!990736) (not b!990760) (not d!117683) (not d!117715) (not b!990490) (not b!990727) (not d!117717) (not d!117641) (not b!990602) (not d!117673) (not b!990722) (not b!990747) (not b!990766) (not b!990525) (not b_lambda!15189) (not b!990774) (not bm!42005) (not b!990753) (not b!990556) (not b!990687) (not b!990532) (not d!117749) (not d!117693) (not b!990697) (not d!117719) (not b!990595) tp_is_empty!23295 (not b!990468) (not d!117689) (not d!117613) (not d!117695) (not d!117703) (not b!990491) (not b!990653) (not b!990713) (not b!990664) (not mapNonEmpty!36998) (not b!990519) (not b!990717) (not b!990675) (not b!990710) (not b!990572) (not d!117605) (not b!990478) (not d!117589) (not b!990704) (not b!990660) (not d!117773) (not d!117765) (not d!117607) (not b!990749) (not b!990755) (not b_lambda!15173) (not b!990741) (not b!990625) (not d!117741) (not d!117737) (not b!990662) (not d!117667) (not b!990476) (not b!990725) (not b!990558) (not d!117707) (not b!990769) (not b!990690) (not d!117671) (not b!990775) (not b!990772) (not b!990728) (not d!117643) (not b!990699) (not d!117697) (not d!117651) (not b!990516) (not d!117731) (not bm!42015) (not b!990644) (not b!990688) (not d!117609) (not b!990554) (not d!117579) (not b!990533) (not d!117627) (not b!990628))
(check-sat b_and!32251 (not b_next!20079))
