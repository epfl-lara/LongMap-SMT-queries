; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13686 () Bool)

(assert start!13686)

(declare-fun b!126102 () Bool)

(declare-fun b_free!2845 () Bool)

(declare-fun b_next!2845 () Bool)

(assert (=> b!126102 (= b_free!2845 (not b_next!2845))))

(declare-fun tp!10942 () Bool)

(declare-fun b_and!7757 () Bool)

(assert (=> b!126102 (= tp!10942 b_and!7757)))

(declare-fun b!126097 () Bool)

(declare-fun b_free!2847 () Bool)

(declare-fun b_next!2847 () Bool)

(assert (=> b!126097 (= b_free!2847 (not b_next!2847))))

(declare-fun tp!10944 () Bool)

(declare-fun b_and!7759 () Bool)

(assert (=> b!126097 (= tp!10944 b_and!7759)))

(declare-fun mapIsEmpty!4493 () Bool)

(declare-fun mapRes!4494 () Bool)

(assert (=> mapIsEmpty!4493 mapRes!4494))

(declare-fun b!126089 () Bool)

(declare-fun e!82358 () Bool)

(declare-fun e!82359 () Bool)

(assert (=> b!126089 (= e!82358 e!82359)))

(declare-fun b!126090 () Bool)

(declare-fun res!61015 () Bool)

(declare-fun e!82366 () Bool)

(assert (=> b!126090 (=> (not res!61015) (not e!82366))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3433 0))(
  ( (V!3434 (val!1464 Int)) )
))
(declare-datatypes ((array!4681 0))(
  ( (array!4682 (arr!2216 (Array (_ BitVec 32) (_ BitVec 64))) (size!2480 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1076 0))(
  ( (ValueCellFull!1076 (v!3123 V!3433)) (EmptyCell!1076) )
))
(declare-datatypes ((array!4683 0))(
  ( (array!4684 (arr!2217 (Array (_ BitVec 32) ValueCell!1076)) (size!2481 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1060 0))(
  ( (LongMapFixedSize!1061 (defaultEntry!2782 Int) (mask!7038 (_ BitVec 32)) (extraKeys!2563 (_ BitVec 32)) (zeroValue!2645 V!3433) (minValue!2645 V!3433) (_size!579 (_ BitVec 32)) (_keys!4515 array!4681) (_values!2765 array!4683) (_vacant!579 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!856 0))(
  ( (Cell!857 (v!3124 LongMapFixedSize!1060)) )
))
(declare-datatypes ((LongMap!856 0))(
  ( (LongMap!857 (underlying!439 Cell!856)) )
))
(declare-fun thiss!992 () LongMap!856)

(assert (=> b!126090 (= res!61015 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun mapNonEmpty!4493 () Bool)

(declare-fun tp!10943 () Bool)

(declare-fun e!82363 () Bool)

(assert (=> mapNonEmpty!4493 (= mapRes!4494 (and tp!10943 e!82363))))

(declare-fun mapRest!4494 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun newMap!16 () LongMapFixedSize!1060)

(declare-fun mapKey!4493 () (_ BitVec 32))

(declare-fun mapValue!4493 () ValueCell!1076)

(assert (=> mapNonEmpty!4493 (= (arr!2217 (_values!2765 newMap!16)) (store mapRest!4494 mapKey!4493 mapValue!4493))))

(declare-fun mapIsEmpty!4494 () Bool)

(declare-fun mapRes!4493 () Bool)

(assert (=> mapIsEmpty!4494 mapRes!4493))

(declare-fun b!126091 () Bool)

(declare-fun e!82364 () Bool)

(assert (=> b!126091 (= e!82359 e!82364)))

(declare-fun b!126092 () Bool)

(declare-fun e!82354 () Bool)

(declare-fun tp_is_empty!2839 () Bool)

(assert (=> b!126092 (= e!82354 tp_is_empty!2839)))

(declare-fun b!126093 () Bool)

(declare-fun e!82362 () Bool)

(assert (=> b!126093 (= e!82362 (and e!82354 mapRes!4493))))

(declare-fun condMapEmpty!4494 () Bool)

(declare-fun mapDefault!4494 () ValueCell!1076)

(assert (=> b!126093 (= condMapEmpty!4494 (= (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4494)))))

(declare-fun b!126094 () Bool)

(declare-fun e!82356 () Bool)

(assert (=> b!126094 (= e!82356 (and (= (size!2481 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7038 (v!3124 (underlying!439 thiss!992))))) (not (= (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (size!2481 (_values!2765 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126096 () Bool)

(declare-fun e!82365 () Bool)

(declare-fun e!82353 () Bool)

(assert (=> b!126096 (= e!82365 (and e!82353 mapRes!4494))))

(declare-fun condMapEmpty!4493 () Bool)

(declare-fun mapDefault!4493 () ValueCell!1076)

(assert (=> b!126096 (= condMapEmpty!4493 (= (arr!2217 (_values!2765 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4493)))))

(declare-fun e!82355 () Bool)

(declare-fun array_inv!1389 (array!4681) Bool)

(declare-fun array_inv!1390 (array!4683) Bool)

(assert (=> b!126097 (= e!82355 (and tp!10944 tp_is_empty!2839 (array_inv!1389 (_keys!4515 newMap!16)) (array_inv!1390 (_values!2765 newMap!16)) e!82365))))

(declare-fun b!126098 () Bool)

(assert (=> b!126098 (= e!82353 tp_is_empty!2839)))

(declare-fun mapNonEmpty!4494 () Bool)

(declare-fun tp!10941 () Bool)

(declare-fun e!82360 () Bool)

(assert (=> mapNonEmpty!4494 (= mapRes!4493 (and tp!10941 e!82360))))

(declare-fun mapKey!4494 () (_ BitVec 32))

(declare-fun mapValue!4494 () ValueCell!1076)

(declare-fun mapRest!4493 () (Array (_ BitVec 32) ValueCell!1076))

(assert (=> mapNonEmpty!4494 (= (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (store mapRest!4493 mapKey!4494 mapValue!4494))))

(declare-fun b!126099 () Bool)

(declare-fun res!61011 () Bool)

(assert (=> b!126099 (=> (not res!61011) (not e!82356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!126099 (= res!61011 (validMask!0 (mask!7038 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126100 () Bool)

(assert (=> b!126100 (= e!82360 tp_is_empty!2839)))

(declare-fun b!126101 () Bool)

(declare-fun res!61013 () Bool)

(assert (=> b!126101 (=> (not res!61013) (not e!82366))))

(declare-fun valid!520 (LongMapFixedSize!1060) Bool)

(assert (=> b!126101 (= res!61013 (valid!520 newMap!16))))

(assert (=> b!126102 (= e!82364 (and tp!10942 tp_is_empty!2839 (array_inv!1389 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (array_inv!1390 (_values!2765 (v!3124 (underlying!439 thiss!992)))) e!82362))))

(declare-fun b!126103 () Bool)

(declare-fun e!82367 () Bool)

(assert (=> b!126103 (= e!82367 e!82356)))

(declare-fun res!61012 () Bool)

(assert (=> b!126103 (=> (not res!61012) (not e!82356))))

(declare-datatypes ((tuple2!2524 0))(
  ( (tuple2!2525 (_1!1273 (_ BitVec 64)) (_2!1273 V!3433)) )
))
(declare-datatypes ((List!1678 0))(
  ( (Nil!1675) (Cons!1674 (h!2276 tuple2!2524) (t!6017 List!1678)) )
))
(declare-datatypes ((ListLongMap!1633 0))(
  ( (ListLongMap!1634 (toList!832 List!1678)) )
))
(declare-fun lt!65054 () ListLongMap!1633)

(declare-fun contains!864 (ListLongMap!1633 (_ BitVec 64)) Bool)

(assert (=> b!126103 (= res!61012 (contains!864 lt!65054 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2526 0))(
  ( (tuple2!2527 (_1!1274 Bool) (_2!1274 LongMapFixedSize!1060)) )
))
(declare-fun lt!65055 () tuple2!2526)

(declare-fun update!186 (LongMapFixedSize!1060 (_ BitVec 64) V!3433) tuple2!2526)

(declare-fun get!1452 (ValueCell!1076 V!3433) V!3433)

(declare-fun dynLambda!416 (Int (_ BitVec 64)) V!3433)

(assert (=> b!126103 (= lt!65055 (update!186 newMap!16 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126104 () Bool)

(assert (=> b!126104 (= e!82366 e!82367)))

(declare-fun res!61010 () Bool)

(assert (=> b!126104 (=> (not res!61010) (not e!82367))))

(declare-fun lt!65053 () ListLongMap!1633)

(assert (=> b!126104 (= res!61010 (and (= lt!65053 lt!65054) (not (= (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1380 (LongMapFixedSize!1060) ListLongMap!1633)

(assert (=> b!126104 (= lt!65054 (map!1380 newMap!16))))

(declare-fun getCurrentListMap!512 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) Int) ListLongMap!1633)

(assert (=> b!126104 (= lt!65053 (getCurrentListMap!512 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126105 () Bool)

(assert (=> b!126105 (= e!82363 tp_is_empty!2839)))

(declare-fun res!61009 () Bool)

(assert (=> start!13686 (=> (not res!61009) (not e!82366))))

(declare-fun valid!521 (LongMap!856) Bool)

(assert (=> start!13686 (= res!61009 (valid!521 thiss!992))))

(assert (=> start!13686 e!82366))

(assert (=> start!13686 e!82358))

(assert (=> start!13686 true))

(assert (=> start!13686 e!82355))

(declare-fun b!126095 () Bool)

(declare-fun res!61014 () Bool)

(assert (=> b!126095 (=> (not res!61014) (not e!82366))))

(assert (=> b!126095 (= res!61014 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7038 newMap!16)) (_size!579 (v!3124 (underlying!439 thiss!992)))))))

(assert (= (and start!13686 res!61009) b!126090))

(assert (= (and b!126090 res!61015) b!126101))

(assert (= (and b!126101 res!61013) b!126095))

(assert (= (and b!126095 res!61014) b!126104))

(assert (= (and b!126104 res!61010) b!126103))

(assert (= (and b!126103 res!61012) b!126099))

(assert (= (and b!126099 res!61011) b!126094))

(assert (= (and b!126093 condMapEmpty!4494) mapIsEmpty!4494))

(assert (= (and b!126093 (not condMapEmpty!4494)) mapNonEmpty!4494))

(get-info :version)

(assert (= (and mapNonEmpty!4494 ((_ is ValueCellFull!1076) mapValue!4494)) b!126100))

(assert (= (and b!126093 ((_ is ValueCellFull!1076) mapDefault!4494)) b!126092))

(assert (= b!126102 b!126093))

(assert (= b!126091 b!126102))

(assert (= b!126089 b!126091))

(assert (= start!13686 b!126089))

(assert (= (and b!126096 condMapEmpty!4493) mapIsEmpty!4493))

(assert (= (and b!126096 (not condMapEmpty!4493)) mapNonEmpty!4493))

(assert (= (and mapNonEmpty!4493 ((_ is ValueCellFull!1076) mapValue!4493)) b!126105))

(assert (= (and b!126096 ((_ is ValueCellFull!1076) mapDefault!4493)) b!126098))

(assert (= b!126097 b!126096))

(assert (= start!13686 b!126097))

(declare-fun b_lambda!5565 () Bool)

(assert (=> (not b_lambda!5565) (not b!126103)))

(declare-fun t!6014 () Bool)

(declare-fun tb!2301 () Bool)

(assert (=> (and b!126102 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))) t!6014) tb!2301))

(declare-fun result!3823 () Bool)

(assert (=> tb!2301 (= result!3823 tp_is_empty!2839)))

(assert (=> b!126103 t!6014))

(declare-fun b_and!7761 () Bool)

(assert (= b_and!7757 (and (=> t!6014 result!3823) b_and!7761)))

(declare-fun t!6016 () Bool)

(declare-fun tb!2303 () Bool)

(assert (=> (and b!126097 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))) t!6016) tb!2303))

(declare-fun result!3827 () Bool)

(assert (= result!3827 result!3823))

(assert (=> b!126103 t!6016))

(declare-fun b_and!7763 () Bool)

(assert (= b_and!7759 (and (=> t!6016 result!3827) b_and!7763)))

(declare-fun m!147201 () Bool)

(assert (=> b!126099 m!147201))

(declare-fun m!147203 () Bool)

(assert (=> mapNonEmpty!4493 m!147203))

(declare-fun m!147205 () Bool)

(assert (=> mapNonEmpty!4494 m!147205))

(declare-fun m!147207 () Bool)

(assert (=> b!126103 m!147207))

(declare-fun m!147209 () Bool)

(assert (=> b!126103 m!147209))

(declare-fun m!147211 () Bool)

(assert (=> b!126103 m!147211))

(declare-fun m!147213 () Bool)

(assert (=> b!126103 m!147213))

(declare-fun m!147215 () Bool)

(assert (=> b!126103 m!147215))

(assert (=> b!126103 m!147207))

(assert (=> b!126103 m!147213))

(assert (=> b!126103 m!147207))

(assert (=> b!126103 m!147215))

(declare-fun m!147217 () Bool)

(assert (=> b!126103 m!147217))

(assert (=> b!126103 m!147211))

(declare-fun m!147219 () Bool)

(assert (=> b!126101 m!147219))

(declare-fun m!147221 () Bool)

(assert (=> start!13686 m!147221))

(declare-fun m!147223 () Bool)

(assert (=> b!126097 m!147223))

(declare-fun m!147225 () Bool)

(assert (=> b!126097 m!147225))

(declare-fun m!147227 () Bool)

(assert (=> b!126102 m!147227))

(declare-fun m!147229 () Bool)

(assert (=> b!126102 m!147229))

(assert (=> b!126104 m!147207))

(declare-fun m!147231 () Bool)

(assert (=> b!126104 m!147231))

(declare-fun m!147233 () Bool)

(assert (=> b!126104 m!147233))

(check-sat (not b!126103) (not mapNonEmpty!4494) (not b!126102) (not b_next!2845) (not mapNonEmpty!4493) b_and!7763 (not b!126101) (not start!13686) (not b!126104) (not b!126099) b_and!7761 (not b_lambda!5565) (not b_next!2847) (not b!126097) tp_is_empty!2839)
(check-sat b_and!7761 b_and!7763 (not b_next!2845) (not b_next!2847))
(get-model)

(declare-fun b_lambda!5571 () Bool)

(assert (= b_lambda!5565 (or (and b!126102 b_free!2845) (and b!126097 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))))) b_lambda!5571)))

(check-sat (not b!126103) (not mapNonEmpty!4494) (not b!126102) (not b_next!2845) (not b_next!2847) (not mapNonEmpty!4493) b_and!7763 (not b!126101) (not start!13686) (not b_lambda!5571) (not b!126104) (not b!126099) b_and!7761 (not b!126097) tp_is_empty!2839)
(check-sat b_and!7761 b_and!7763 (not b_next!2845) (not b_next!2847))
(get-model)

(declare-fun d!38135 () Bool)

(assert (=> d!38135 (= (valid!521 thiss!992) (valid!520 (v!3124 (underlying!439 thiss!992))))))

(declare-fun bs!5238 () Bool)

(assert (= bs!5238 d!38135))

(declare-fun m!147303 () Bool)

(assert (=> bs!5238 m!147303))

(assert (=> start!13686 d!38135))

(declare-fun d!38137 () Bool)

(declare-fun e!82463 () Bool)

(assert (=> d!38137 e!82463))

(declare-fun res!61060 () Bool)

(assert (=> d!38137 (=> res!61060 e!82463)))

(declare-fun lt!65083 () Bool)

(assert (=> d!38137 (= res!61060 (not lt!65083))))

(declare-fun lt!65082 () Bool)

(assert (=> d!38137 (= lt!65083 lt!65082)))

(declare-datatypes ((Unit!3928 0))(
  ( (Unit!3929) )
))
(declare-fun lt!65085 () Unit!3928)

(declare-fun e!82462 () Unit!3928)

(assert (=> d!38137 (= lt!65085 e!82462)))

(declare-fun c!23047 () Bool)

(assert (=> d!38137 (= c!23047 lt!65082)))

(declare-fun containsKey!171 (List!1678 (_ BitVec 64)) Bool)

(assert (=> d!38137 (= lt!65082 (containsKey!171 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38137 (= (contains!864 lt!65054 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65083)))

(declare-fun b!126220 () Bool)

(declare-fun lt!65084 () Unit!3928)

(assert (=> b!126220 (= e!82462 lt!65084)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!119 (List!1678 (_ BitVec 64)) Unit!3928)

(assert (=> b!126220 (= lt!65084 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-datatypes ((Option!174 0))(
  ( (Some!173 (v!3130 V!3433)) (None!172) )
))
(declare-fun isDefined!120 (Option!174) Bool)

(declare-fun getValueByKey!168 (List!1678 (_ BitVec 64)) Option!174)

(assert (=> b!126220 (isDefined!120 (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126221 () Bool)

(declare-fun Unit!3930 () Unit!3928)

(assert (=> b!126221 (= e!82462 Unit!3930)))

(declare-fun b!126222 () Bool)

(assert (=> b!126222 (= e!82463 (isDefined!120 (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (= (and d!38137 c!23047) b!126220))

(assert (= (and d!38137 (not c!23047)) b!126221))

(assert (= (and d!38137 (not res!61060)) b!126222))

(assert (=> d!38137 m!147207))

(declare-fun m!147305 () Bool)

(assert (=> d!38137 m!147305))

(assert (=> b!126220 m!147207))

(declare-fun m!147307 () Bool)

(assert (=> b!126220 m!147307))

(assert (=> b!126220 m!147207))

(declare-fun m!147309 () Bool)

(assert (=> b!126220 m!147309))

(assert (=> b!126220 m!147309))

(declare-fun m!147311 () Bool)

(assert (=> b!126220 m!147311))

(assert (=> b!126222 m!147207))

(assert (=> b!126222 m!147309))

(assert (=> b!126222 m!147309))

(assert (=> b!126222 m!147311))

(assert (=> b!126103 d!38137))

(declare-fun bm!13545 () Bool)

(declare-fun call!13561 () ListLongMap!1633)

(assert (=> bm!13545 (= call!13561 (map!1380 newMap!16))))

(declare-fun b!126307 () Bool)

(declare-fun e!82513 () Unit!3928)

(declare-fun Unit!3931 () Unit!3928)

(assert (=> b!126307 (= e!82513 Unit!3931)))

(declare-fun lt!65166 () Unit!3928)

(declare-fun call!13550 () Unit!3928)

(assert (=> b!126307 (= lt!65166 call!13550)))

(declare-datatypes ((SeekEntryResult!264 0))(
  ( (MissingZero!264 (index!3211 (_ BitVec 32))) (Found!264 (index!3212 (_ BitVec 32))) (Intermediate!264 (undefined!1076 Bool) (index!3213 (_ BitVec 32)) (x!14957 (_ BitVec 32))) (Undefined!264) (MissingVacant!264 (index!3214 (_ BitVec 32))) )
))
(declare-fun lt!65163 () SeekEntryResult!264)

(declare-fun call!13549 () SeekEntryResult!264)

(assert (=> b!126307 (= lt!65163 call!13549)))

(declare-fun c!23078 () Bool)

(assert (=> b!126307 (= c!23078 ((_ is MissingZero!264) lt!65163))))

(declare-fun e!82509 () Bool)

(assert (=> b!126307 e!82509))

(declare-fun lt!65140 () Unit!3928)

(assert (=> b!126307 (= lt!65140 lt!65166)))

(assert (=> b!126307 false))

(declare-fun bm!13546 () Bool)

(declare-fun call!13560 () SeekEntryResult!264)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4681 (_ BitVec 32)) SeekEntryResult!264)

(assert (=> bm!13546 (= call!13560 (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun lt!65153 () SeekEntryResult!264)

(declare-fun b!126308 () Bool)

(declare-fun e!82515 () Bool)

(assert (=> b!126308 (= e!82515 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65153)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126309 () Bool)

(declare-fun res!61096 () Bool)

(declare-fun call!13567 () Bool)

(assert (=> b!126309 (= res!61096 call!13567)))

(declare-fun e!82511 () Bool)

(assert (=> b!126309 (=> (not res!61096) (not e!82511))))

(declare-fun bm!13547 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) Int) Unit!3928)

(assert (=> bm!13547 (= call!13550 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(declare-fun b!126310 () Bool)

(declare-fun c!23089 () Bool)

(assert (=> b!126310 (= c!23089 ((_ is MissingVacant!264) lt!65163))))

(declare-fun e!82526 () Bool)

(assert (=> b!126310 (= e!82509 e!82526)))

(declare-fun b!126312 () Bool)

(declare-fun lt!65146 () Unit!3928)

(assert (=> b!126312 (= e!82513 lt!65146)))

(declare-fun call!13559 () Unit!3928)

(assert (=> b!126312 (= lt!65146 call!13559)))

(declare-fun lt!65144 () SeekEntryResult!264)

(assert (=> b!126312 (= lt!65144 call!13549)))

(declare-fun res!61089 () Bool)

(assert (=> b!126312 (= res!61089 ((_ is Found!264) lt!65144))))

(assert (=> b!126312 (=> (not res!61089) (not e!82511))))

(assert (=> b!126312 e!82511))

(declare-fun b!126313 () Bool)

(assert (=> b!126313 (= e!82526 ((_ is Undefined!264) lt!65163))))

(declare-fun e!82522 () ListLongMap!1633)

(declare-fun bm!13548 () Bool)

(declare-fun c!23087 () Bool)

(declare-fun c!23084 () Bool)

(declare-fun call!13551 () ListLongMap!1633)

(declare-fun +!164 (ListLongMap!1633 tuple2!2524) ListLongMap!1633)

(assert (=> bm!13548 (= call!13551 (+!164 e!82522 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23079 () Bool)

(assert (=> bm!13548 (= c!23079 c!23087)))

(declare-fun b!126314 () Bool)

(declare-fun e!82521 () Bool)

(declare-fun call!13566 () ListLongMap!1633)

(assert (=> b!126314 (= e!82521 (= call!13566 call!13561))))

(declare-fun bm!13549 () Bool)

(declare-fun call!13552 () Bool)

(assert (=> bm!13549 (= call!13567 call!13552)))

(declare-fun bm!13550 () Bool)

(declare-fun c!23088 () Bool)

(declare-fun c!23081 () Bool)

(assert (=> bm!13550 (= c!23088 c!23081)))

(declare-fun call!13548 () Bool)

(declare-fun e!82525 () ListLongMap!1633)

(declare-fun lt!65160 () SeekEntryResult!264)

(assert (=> bm!13550 (= call!13548 (contains!864 e!82525 (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(declare-fun b!126315 () Bool)

(declare-fun e!82529 () Bool)

(declare-fun e!82518 () Bool)

(assert (=> b!126315 (= e!82529 e!82518)))

(declare-fun res!61098 () Bool)

(declare-fun call!13558 () Bool)

(assert (=> b!126315 (= res!61098 call!13558)))

(assert (=> b!126315 (=> (not res!61098) (not e!82518))))

(declare-fun lt!65161 () SeekEntryResult!264)

(declare-fun c!23083 () Bool)

(declare-fun bm!13551 () Bool)

(declare-fun c!23086 () Bool)

(declare-fun c!23080 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13551 (= call!13552 (inRange!0 (ite c!23081 (ite c!23083 (index!3212 lt!65153) (ite c!23086 (index!3211 lt!65161) (index!3214 lt!65161))) (ite c!23080 (index!3212 lt!65144) (ite c!23078 (index!3211 lt!65163) (index!3214 lt!65163)))) (mask!7038 newMap!16)))))

(declare-fun b!126316 () Bool)

(assert (=> b!126316 (= e!82522 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13552 () Bool)

(declare-fun call!13570 () Bool)

(declare-fun arrayContainsKey!0 (array!4681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13552 (= call!13570 (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!126317 () Bool)

(declare-fun c!23082 () Bool)

(assert (=> b!126317 (= c!23082 ((_ is MissingVacant!264) lt!65161))))

(declare-fun e!82524 () Bool)

(assert (=> b!126317 (= e!82524 e!82529)))

(declare-fun b!126318 () Bool)

(declare-fun e!82514 () Unit!3928)

(declare-fun Unit!3932 () Unit!3928)

(assert (=> b!126318 (= e!82514 Unit!3932)))

(declare-fun lt!65142 () Unit!3928)

(assert (=> b!126318 (= lt!65142 call!13559)))

(declare-fun call!13555 () SeekEntryResult!264)

(assert (=> b!126318 (= lt!65153 call!13555)))

(declare-fun res!61094 () Bool)

(assert (=> b!126318 (= res!61094 ((_ is Found!264) lt!65153))))

(assert (=> b!126318 (=> (not res!61094) (not e!82515))))

(assert (=> b!126318 e!82515))

(declare-fun lt!65149 () Unit!3928)

(assert (=> b!126318 (= lt!65149 lt!65142)))

(assert (=> b!126318 false))

(declare-fun bm!13553 () Bool)

(assert (=> bm!13553 (= call!13555 call!13560)))

(declare-fun b!126319 () Bool)

(declare-fun e!82528 () tuple2!2526)

(declare-fun lt!65151 () tuple2!2526)

(assert (=> b!126319 (= e!82528 (tuple2!2527 (_1!1274 lt!65151) (_2!1274 lt!65151)))))

(declare-fun call!13556 () tuple2!2526)

(assert (=> b!126319 (= lt!65151 call!13556)))

(declare-fun b!126320 () Bool)

(declare-fun c!23085 () Bool)

(assert (=> b!126320 (= c!23085 ((_ is MissingVacant!264) lt!65160))))

(declare-fun e!82510 () tuple2!2526)

(assert (=> b!126320 (= e!82510 e!82528)))

(declare-fun b!126321 () Bool)

(declare-fun e!82527 () tuple2!2526)

(assert (=> b!126321 (= e!82528 e!82527)))

(declare-fun c!23076 () Bool)

(assert (=> b!126321 (= c!23076 ((_ is MissingZero!264) lt!65160))))

(declare-fun bm!13554 () Bool)

(declare-fun call!13557 () ListLongMap!1633)

(declare-fun call!13571 () ListLongMap!1633)

(assert (=> bm!13554 (= call!13557 call!13571)))

(declare-fun bm!13555 () Bool)

(declare-fun call!13564 () ListLongMap!1633)

(declare-fun call!13563 () ListLongMap!1633)

(assert (=> bm!13555 (= call!13564 call!13563)))

(declare-fun bm!13556 () Bool)

(assert (=> bm!13556 (= call!13549 call!13560)))

(declare-fun bm!13557 () Bool)

(declare-fun call!13554 () Bool)

(assert (=> bm!13557 (= call!13554 call!13570)))

(declare-fun lt!65155 () array!4683)

(declare-fun bm!13558 () Bool)

(assert (=> bm!13558 (= call!13571 (getCurrentListMap!512 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!126322 () Bool)

(declare-fun lt!65141 () Unit!3928)

(assert (=> b!126322 (= e!82514 lt!65141)))

(assert (=> b!126322 (= lt!65141 call!13550)))

(assert (=> b!126322 (= lt!65161 call!13555)))

(assert (=> b!126322 (= c!23086 ((_ is MissingZero!264) lt!65161))))

(assert (=> b!126322 e!82524))

(declare-fun b!126323 () Bool)

(declare-fun lt!65162 () Unit!3928)

(assert (=> b!126323 (= lt!65162 e!82514)))

(assert (=> b!126323 (= c!23083 call!13548)))

(assert (=> b!126323 (= e!82510 (tuple2!2527 false newMap!16))))

(declare-fun bm!13559 () Bool)

(declare-fun call!13568 () Bool)

(assert (=> bm!13559 (= call!13558 call!13568)))

(declare-fun b!126324 () Bool)

(declare-fun e!82517 () Bool)

(assert (=> b!126324 (= e!82526 e!82517)))

(declare-fun res!61099 () Bool)

(declare-fun call!13565 () Bool)

(assert (=> b!126324 (= res!61099 call!13565)))

(assert (=> b!126324 (=> (not res!61099) (not e!82517))))

(declare-fun b!126325 () Bool)

(declare-fun res!61092 () Bool)

(assert (=> b!126325 (= res!61092 call!13568)))

(assert (=> b!126325 (=> (not res!61092) (not e!82515))))

(declare-fun b!126326 () Bool)

(declare-fun lt!65147 () Unit!3928)

(declare-fun lt!65156 () Unit!3928)

(assert (=> b!126326 (= lt!65147 lt!65156)))

(assert (=> b!126326 call!13548))

(declare-fun lemmaValidKeyInArrayIsInListMap!116 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) Int) Unit!3928)

(assert (=> b!126326 (= lt!65156 (lemmaValidKeyInArrayIsInListMap!116 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3212 lt!65160) (defaultEntry!2782 newMap!16)))))

(assert (=> b!126326 (= lt!65155 (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))))

(declare-fun lt!65148 () Unit!3928)

(declare-fun lt!65150 () Unit!3928)

(assert (=> b!126326 (= lt!65148 lt!65150)))

(assert (=> b!126326 (= call!13551 call!13564)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) (_ BitVec 64) V!3433 Int) Unit!3928)

(assert (=> b!126326 (= lt!65150 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3212 lt!65160) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65157 () Unit!3928)

(assert (=> b!126326 (= lt!65157 e!82513)))

(assert (=> b!126326 (= c!23080 (contains!864 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126326 (= e!82527 (tuple2!2527 true (LongMapFixedSize!1061 (defaultEntry!2782 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (_size!579 newMap!16) (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (_vacant!579 newMap!16))))))

(declare-fun b!126327 () Bool)

(assert (=> b!126327 (= e!82511 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65144)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65165 () (_ BitVec 32))

(declare-fun lt!65143 () (_ BitVec 32))

(declare-fun bm!13560 () Bool)

(assert (=> bm!13560 (= call!13563 (getCurrentListMap!512 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun b!126328 () Bool)

(declare-fun res!61093 () Bool)

(declare-fun e!82519 () Bool)

(assert (=> b!126328 (=> (not res!61093) (not e!82519))))

(assert (=> b!126328 (= res!61093 call!13565)))

(assert (=> b!126328 (= e!82509 e!82519)))

(declare-fun bm!13561 () Bool)

(declare-fun call!13553 () ListLongMap!1633)

(assert (=> bm!13561 (= call!13553 call!13551)))

(declare-fun bm!13562 () Bool)

(assert (=> bm!13562 (= call!13565 call!13567)))

(declare-fun b!126329 () Bool)

(declare-fun e!82516 () Bool)

(declare-fun call!13569 () Bool)

(assert (=> b!126329 (= e!82516 (not call!13569))))

(declare-fun b!126330 () Bool)

(assert (=> b!126330 (= e!82525 call!13571)))

(declare-fun b!126331 () Bool)

(declare-fun res!61097 () Bool)

(assert (=> b!126331 (=> (not res!61097) (not e!82516))))

(assert (=> b!126331 (= res!61097 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3211 lt!65161)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126332 () Bool)

(declare-fun e!82508 () Bool)

(assert (=> b!126332 (= e!82521 e!82508)))

(declare-fun res!61101 () Bool)

(assert (=> b!126332 (= res!61101 (contains!864 call!13566 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126332 (=> (not res!61101) (not e!82508))))

(declare-fun b!126333 () Bool)

(assert (=> b!126333 (= e!82508 (= call!13566 (+!164 call!13561 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13563 () Bool)

(declare-fun call!13562 () ListLongMap!1633)

(assert (=> bm!13563 (= call!13562 call!13563)))

(declare-fun bm!13564 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) Int) Unit!3928)

(assert (=> bm!13564 (= call!13559 (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(declare-fun b!126334 () Bool)

(declare-fun res!61095 () Bool)

(assert (=> b!126334 (= res!61095 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3214 lt!65163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126334 (=> (not res!61095) (not e!82517))))

(declare-fun b!126335 () Bool)

(declare-fun lt!65159 () tuple2!2526)

(assert (=> b!126335 (= lt!65159 call!13556)))

(assert (=> b!126335 (= e!82527 (tuple2!2527 (_1!1274 lt!65159) (_2!1274 lt!65159)))))

(declare-fun b!126336 () Bool)

(declare-fun e!82520 () tuple2!2526)

(declare-fun e!82523 () tuple2!2526)

(assert (=> b!126336 (= e!82520 e!82523)))

(assert (=> b!126336 (= c!23084 (= (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126337 () Bool)

(declare-fun res!61091 () Bool)

(assert (=> b!126337 (=> (not res!61091) (not e!82516))))

(assert (=> b!126337 (= res!61091 call!13558)))

(assert (=> b!126337 (= e!82524 e!82516)))

(declare-fun bm!13565 () Bool)

(declare-fun updateHelperNewKey!56 (LongMapFixedSize!1060 (_ BitVec 64) V!3433 (_ BitVec 32)) tuple2!2526)

(assert (=> bm!13565 (= call!13556 (updateHelperNewKey!56 newMap!16 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))))))

(declare-fun b!126338 () Bool)

(assert (=> b!126338 (= e!82529 ((_ is Undefined!264) lt!65161))))

(declare-fun b!126339 () Bool)

(declare-fun lt!65154 () Unit!3928)

(declare-fun lt!65164 () Unit!3928)

(assert (=> b!126339 (= lt!65154 lt!65164)))

(assert (=> b!126339 (= call!13553 call!13562)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 V!3433 Int) Unit!3928)

(assert (=> b!126339 (= lt!65164 (lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(assert (=> b!126339 (= lt!65165 (bvor (extraKeys!2563 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!126339 (= e!82523 (tuple2!2527 true (LongMapFixedSize!1061 (defaultEntry!2782 newMap!16) (mask!7038 newMap!16) (bvor (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!579 newMap!16) (_keys!4515 newMap!16) (_values!2765 newMap!16) (_vacant!579 newMap!16))))))

(declare-fun b!126340 () Bool)

(assert (=> b!126340 (= e!82520 e!82510)))

(assert (=> b!126340 (= lt!65160 (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(assert (=> b!126340 (= c!23081 ((_ is Undefined!264) lt!65160))))

(declare-fun b!126341 () Bool)

(assert (=> b!126341 (= e!82519 (not call!13554))))

(declare-fun b!126342 () Bool)

(declare-fun res!61102 () Bool)

(assert (=> b!126342 (= res!61102 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3214 lt!65161)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126342 (=> (not res!61102) (not e!82518))))

(declare-fun b!126343 () Bool)

(assert (=> b!126343 (= e!82525 call!13564)))

(declare-fun bm!13566 () Bool)

(assert (=> bm!13566 (= call!13569 call!13570)))

(declare-fun b!126344 () Bool)

(assert (=> b!126344 (= e!82522 call!13557)))

(declare-fun b!126345 () Bool)

(declare-fun lt!65158 () Unit!3928)

(declare-fun lt!65145 () Unit!3928)

(assert (=> b!126345 (= lt!65158 lt!65145)))

(assert (=> b!126345 (= call!13553 call!13562)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!56 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 V!3433 Int) Unit!3928)

(assert (=> b!126345 (= lt!65145 (lemmaChangeZeroKeyThenAddPairToListMap!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) lt!65143 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (defaultEntry!2782 newMap!16)))))

(assert (=> b!126345 (= lt!65143 (bvor (extraKeys!2563 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!126345 (= e!82523 (tuple2!2527 true (LongMapFixedSize!1061 (defaultEntry!2782 newMap!16) (mask!7038 newMap!16) (bvor (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (_size!579 newMap!16) (_keys!4515 newMap!16) (_values!2765 newMap!16) (_vacant!579 newMap!16))))))

(declare-fun b!126346 () Bool)

(declare-fun e!82512 () Bool)

(assert (=> b!126346 (= e!82512 e!82521)))

(declare-fun c!23077 () Bool)

(declare-fun lt!65152 () tuple2!2526)

(assert (=> b!126346 (= c!23077 (_1!1274 lt!65152))))

(declare-fun b!126347 () Bool)

(declare-fun res!61100 () Bool)

(assert (=> b!126347 (=> (not res!61100) (not e!82519))))

(assert (=> b!126347 (= res!61100 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3211 lt!65163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126348 () Bool)

(assert (=> b!126348 (= e!82518 (not call!13569))))

(declare-fun b!126311 () Bool)

(assert (=> b!126311 (= e!82517 (not call!13554))))

(declare-fun d!38139 () Bool)

(assert (=> d!38139 e!82512))

(declare-fun res!61090 () Bool)

(assert (=> d!38139 (=> (not res!61090) (not e!82512))))

(assert (=> d!38139 (= res!61090 (valid!520 (_2!1274 lt!65152)))))

(assert (=> d!38139 (= lt!65152 e!82520)))

(assert (=> d!38139 (= c!23087 (= (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (bvneg (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38139 (valid!520 newMap!16)))

(assert (=> d!38139 (= (update!186 newMap!16 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!65152)))

(declare-fun bm!13567 () Bool)

(assert (=> bm!13567 (= call!13568 call!13552)))

(declare-fun bm!13568 () Bool)

(assert (=> bm!13568 (= call!13566 (map!1380 (_2!1274 lt!65152)))))

(assert (= (and d!38139 c!23087) b!126336))

(assert (= (and d!38139 (not c!23087)) b!126340))

(assert (= (and b!126336 c!23084) b!126345))

(assert (= (and b!126336 (not c!23084)) b!126339))

(assert (= (or b!126345 b!126339) bm!13554))

(assert (= (or b!126345 b!126339) bm!13563))

(assert (= (or b!126345 b!126339) bm!13561))

(assert (= (and b!126340 c!23081) b!126323))

(assert (= (and b!126340 (not c!23081)) b!126320))

(assert (= (and b!126323 c!23083) b!126318))

(assert (= (and b!126323 (not c!23083)) b!126322))

(assert (= (and b!126318 res!61094) b!126325))

(assert (= (and b!126325 res!61092) b!126308))

(assert (= (and b!126322 c!23086) b!126337))

(assert (= (and b!126322 (not c!23086)) b!126317))

(assert (= (and b!126337 res!61091) b!126331))

(assert (= (and b!126331 res!61097) b!126329))

(assert (= (and b!126317 c!23082) b!126315))

(assert (= (and b!126317 (not c!23082)) b!126338))

(assert (= (and b!126315 res!61098) b!126342))

(assert (= (and b!126342 res!61102) b!126348))

(assert (= (or b!126337 b!126315) bm!13559))

(assert (= (or b!126329 b!126348) bm!13566))

(assert (= (or b!126325 bm!13559) bm!13567))

(assert (= (or b!126318 b!126322) bm!13553))

(assert (= (and b!126320 c!23085) b!126319))

(assert (= (and b!126320 (not c!23085)) b!126321))

(assert (= (and b!126321 c!23076) b!126335))

(assert (= (and b!126321 (not c!23076)) b!126326))

(assert (= (and b!126326 c!23080) b!126312))

(assert (= (and b!126326 (not c!23080)) b!126307))

(assert (= (and b!126312 res!61089) b!126309))

(assert (= (and b!126309 res!61096) b!126327))

(assert (= (and b!126307 c!23078) b!126328))

(assert (= (and b!126307 (not c!23078)) b!126310))

(assert (= (and b!126328 res!61093) b!126347))

(assert (= (and b!126347 res!61100) b!126341))

(assert (= (and b!126310 c!23089) b!126324))

(assert (= (and b!126310 (not c!23089)) b!126313))

(assert (= (and b!126324 res!61099) b!126334))

(assert (= (and b!126334 res!61095) b!126311))

(assert (= (or b!126328 b!126324) bm!13562))

(assert (= (or b!126341 b!126311) bm!13557))

(assert (= (or b!126309 bm!13562) bm!13549))

(assert (= (or b!126312 b!126307) bm!13556))

(assert (= (or b!126319 b!126335) bm!13565))

(assert (= (or b!126318 b!126312) bm!13564))

(assert (= (or bm!13553 bm!13556) bm!13546))

(assert (= (or b!126323 b!126326) bm!13555))

(assert (= (or bm!13567 bm!13549) bm!13551))

(assert (= (or bm!13566 bm!13557) bm!13552))

(assert (= (or b!126322 b!126307) bm!13547))

(assert (= (or b!126323 b!126326) bm!13550))

(assert (= (and bm!13550 c!23088) b!126343))

(assert (= (and bm!13550 (not c!23088)) b!126330))

(assert (= (or bm!13563 bm!13555) bm!13560))

(assert (= (or bm!13554 b!126330) bm!13558))

(assert (= (or bm!13561 b!126326) bm!13548))

(assert (= (and bm!13548 c!23079) b!126344))

(assert (= (and bm!13548 (not c!23079)) b!126316))

(assert (= (and d!38139 res!61090) b!126346))

(assert (= (and b!126346 c!23077) b!126332))

(assert (= (and b!126346 (not c!23077)) b!126314))

(assert (= (and b!126332 res!61101) b!126333))

(assert (= (or b!126332 b!126333 b!126314) bm!13568))

(assert (= (or b!126333 b!126314) bm!13545))

(declare-fun m!147313 () Bool)

(assert (=> b!126308 m!147313))

(declare-fun m!147315 () Bool)

(assert (=> d!38139 m!147315))

(assert (=> d!38139 m!147219))

(assert (=> b!126339 m!147215))

(declare-fun m!147317 () Bool)

(assert (=> b!126339 m!147317))

(declare-fun m!147319 () Bool)

(assert (=> bm!13560 m!147319))

(declare-fun m!147321 () Bool)

(assert (=> bm!13560 m!147321))

(assert (=> b!126332 m!147207))

(declare-fun m!147323 () Bool)

(assert (=> b!126332 m!147323))

(declare-fun m!147325 () Bool)

(assert (=> b!126316 m!147325))

(assert (=> bm!13552 m!147207))

(declare-fun m!147327 () Bool)

(assert (=> bm!13552 m!147327))

(declare-fun m!147329 () Bool)

(assert (=> bm!13568 m!147329))

(declare-fun m!147331 () Bool)

(assert (=> b!126333 m!147331))

(declare-fun m!147333 () Bool)

(assert (=> b!126327 m!147333))

(declare-fun m!147335 () Bool)

(assert (=> b!126331 m!147335))

(declare-fun m!147337 () Bool)

(assert (=> bm!13558 m!147337))

(declare-fun m!147339 () Bool)

(assert (=> b!126326 m!147339))

(assert (=> b!126326 m!147207))

(assert (=> b!126326 m!147215))

(declare-fun m!147341 () Bool)

(assert (=> b!126326 m!147341))

(assert (=> b!126326 m!147325))

(assert (=> b!126326 m!147207))

(declare-fun m!147343 () Bool)

(assert (=> b!126326 m!147343))

(assert (=> b!126326 m!147319))

(assert (=> b!126326 m!147325))

(declare-fun m!147345 () Bool)

(assert (=> b!126347 m!147345))

(assert (=> bm!13545 m!147231))

(declare-fun m!147347 () Bool)

(assert (=> b!126342 m!147347))

(declare-fun m!147349 () Bool)

(assert (=> bm!13548 m!147349))

(assert (=> b!126345 m!147215))

(declare-fun m!147351 () Bool)

(assert (=> b!126345 m!147351))

(assert (=> bm!13564 m!147207))

(declare-fun m!147353 () Bool)

(assert (=> bm!13564 m!147353))

(assert (=> b!126340 m!147207))

(declare-fun m!147355 () Bool)

(assert (=> b!126340 m!147355))

(assert (=> bm!13565 m!147207))

(assert (=> bm!13565 m!147215))

(declare-fun m!147357 () Bool)

(assert (=> bm!13565 m!147357))

(assert (=> bm!13546 m!147207))

(assert (=> bm!13546 m!147355))

(assert (=> bm!13547 m!147207))

(declare-fun m!147359 () Bool)

(assert (=> bm!13547 m!147359))

(declare-fun m!147361 () Bool)

(assert (=> b!126334 m!147361))

(declare-fun m!147363 () Bool)

(assert (=> bm!13551 m!147363))

(declare-fun m!147365 () Bool)

(assert (=> bm!13550 m!147365))

(declare-fun m!147367 () Bool)

(assert (=> bm!13550 m!147367))

(assert (=> b!126103 d!38139))

(declare-fun d!38141 () Bool)

(declare-fun c!23092 () Bool)

(assert (=> d!38141 (= c!23092 ((_ is ValueCellFull!1076) (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!82532 () V!3433)

(assert (=> d!38141 (= (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82532)))

(declare-fun b!126353 () Bool)

(declare-fun get!1454 (ValueCell!1076 V!3433) V!3433)

(assert (=> b!126353 (= e!82532 (get!1454 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126354 () Bool)

(declare-fun get!1455 (ValueCell!1076 V!3433) V!3433)

(assert (=> b!126354 (= e!82532 (get!1455 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38141 c!23092) b!126353))

(assert (= (and d!38141 (not c!23092)) b!126354))

(assert (=> b!126353 m!147211))

(assert (=> b!126353 m!147213))

(declare-fun m!147369 () Bool)

(assert (=> b!126353 m!147369))

(assert (=> b!126354 m!147211))

(assert (=> b!126354 m!147213))

(declare-fun m!147371 () Bool)

(assert (=> b!126354 m!147371))

(assert (=> b!126103 d!38141))

(declare-fun d!38143 () Bool)

(assert (=> d!38143 (= (validMask!0 (mask!7038 (v!3124 (underlying!439 thiss!992)))) (and (or (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000001111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000011111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000001111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000011111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000001111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000011111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000001111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000011111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000001111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000011111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000001111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000011111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000001111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000011111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000111111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000001111111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000011111111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000111111111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00001111111111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00011111111111111111111111111111) (= (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!126099 d!38143))

(declare-fun d!38145 () Bool)

(assert (=> d!38145 (= (map!1380 newMap!16) (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bs!5239 () Bool)

(assert (= bs!5239 d!38145))

(assert (=> bs!5239 m!147325))

(assert (=> b!126104 d!38145))

(declare-fun b!126397 () Bool)

(declare-fun e!82564 () Bool)

(declare-fun e!82571 () Bool)

(assert (=> b!126397 (= e!82564 e!82571)))

(declare-fun c!23110 () Bool)

(assert (=> b!126397 (= c!23110 (not (= (bvand (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126398 () Bool)

(declare-fun e!82568 () ListLongMap!1633)

(declare-fun e!82569 () ListLongMap!1633)

(assert (=> b!126398 (= e!82568 e!82569)))

(declare-fun c!23106 () Bool)

(assert (=> b!126398 (= c!23106 (and (not (= (bvand (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!13586 () ListLongMap!1633)

(declare-fun call!13589 () ListLongMap!1633)

(declare-fun call!13592 () ListLongMap!1633)

(declare-fun c!23109 () Bool)

(declare-fun bm!13583 () Bool)

(declare-fun call!13591 () ListLongMap!1633)

(assert (=> bm!13583 (= call!13591 (+!164 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)) (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun bm!13584 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!131 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) Int) ListLongMap!1633)

(assert (=> bm!13584 (= call!13586 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun bm!13585 () Bool)

(declare-fun call!13590 () Bool)

(declare-fun lt!65225 () ListLongMap!1633)

(assert (=> bm!13585 (= call!13590 (contains!864 lt!65225 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126399 () Bool)

(declare-fun e!82559 () Bool)

(declare-fun e!82563 () Bool)

(assert (=> b!126399 (= e!82559 e!82563)))

(declare-fun res!61125 () Bool)

(assert (=> b!126399 (=> (not res!61125) (not e!82563))))

(assert (=> b!126399 (= res!61125 (contains!864 lt!65225 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126399 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun bm!13586 () Bool)

(assert (=> bm!13586 (= call!13592 call!13589)))

(declare-fun b!126400 () Bool)

(declare-fun e!82566 () ListLongMap!1633)

(declare-fun call!13588 () ListLongMap!1633)

(assert (=> b!126400 (= e!82566 call!13588)))

(declare-fun b!126401 () Bool)

(declare-fun res!61121 () Bool)

(assert (=> b!126401 (=> (not res!61121) (not e!82564))))

(assert (=> b!126401 (= res!61121 e!82559)))

(declare-fun res!61122 () Bool)

(assert (=> b!126401 (=> res!61122 e!82559)))

(declare-fun e!82562 () Bool)

(assert (=> b!126401 (= res!61122 (not e!82562))))

(declare-fun res!61127 () Bool)

(assert (=> b!126401 (=> (not res!61127) (not e!82562))))

(assert (=> b!126401 (= res!61127 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126402 () Bool)

(declare-fun e!82565 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!126402 (= e!82565 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126403 () Bool)

(declare-fun e!82560 () Bool)

(declare-fun apply!111 (ListLongMap!1633 (_ BitVec 64)) V!3433)

(assert (=> b!126403 (= e!82560 (= (apply!111 lt!65225 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126404 () Bool)

(declare-fun res!61128 () Bool)

(assert (=> b!126404 (=> (not res!61128) (not e!82564))))

(declare-fun e!82561 () Bool)

(assert (=> b!126404 (= res!61128 e!82561)))

(declare-fun c!23105 () Bool)

(assert (=> b!126404 (= c!23105 (not (= (bvand (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13587 () Bool)

(assert (=> bm!13587 (= call!13588 call!13591)))

(declare-fun b!126405 () Bool)

(assert (=> b!126405 (= e!82569 call!13588)))

(declare-fun b!126406 () Bool)

(assert (=> b!126406 (= e!82566 call!13592)))

(declare-fun bm!13588 () Bool)

(assert (=> bm!13588 (= call!13589 call!13586)))

(declare-fun b!126407 () Bool)

(assert (=> b!126407 (= e!82571 e!82560)))

(declare-fun res!61124 () Bool)

(assert (=> b!126407 (= res!61124 call!13590)))

(assert (=> b!126407 (=> (not res!61124) (not e!82560))))

(declare-fun b!126408 () Bool)

(declare-fun c!23108 () Bool)

(assert (=> b!126408 (= c!23108 (and (not (= (bvand (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126408 (= e!82569 e!82566)))

(declare-fun b!126409 () Bool)

(assert (=> b!126409 (= e!82571 (not call!13590))))

(declare-fun b!126410 () Bool)

(assert (=> b!126410 (= e!82563 (= (apply!111 lt!65225 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126410 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2481 (_values!2765 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> b!126410 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126411 () Bool)

(declare-fun call!13587 () Bool)

(assert (=> b!126411 (= e!82561 (not call!13587))))

(declare-fun bm!13589 () Bool)

(assert (=> bm!13589 (= call!13587 (contains!864 lt!65225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126412 () Bool)

(declare-fun e!82570 () Bool)

(assert (=> b!126412 (= e!82570 (= (apply!111 lt!65225 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126413 () Bool)

(declare-fun e!82567 () Unit!3928)

(declare-fun lt!65228 () Unit!3928)

(assert (=> b!126413 (= e!82567 lt!65228)))

(declare-fun lt!65213 () ListLongMap!1633)

(assert (=> b!126413 (= lt!65213 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun lt!65232 () (_ BitVec 64))

(assert (=> b!126413 (= lt!65232 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65230 () (_ BitVec 64))

(assert (=> b!126413 (= lt!65230 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65215 () Unit!3928)

(declare-fun addStillContains!87 (ListLongMap!1633 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3928)

(assert (=> b!126413 (= lt!65215 (addStillContains!87 lt!65213 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65230))))

(assert (=> b!126413 (contains!864 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65230)))

(declare-fun lt!65219 () Unit!3928)

(assert (=> b!126413 (= lt!65219 lt!65215)))

(declare-fun lt!65223 () ListLongMap!1633)

(assert (=> b!126413 (= lt!65223 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun lt!65216 () (_ BitVec 64))

(assert (=> b!126413 (= lt!65216 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65226 () (_ BitVec 64))

(assert (=> b!126413 (= lt!65226 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65221 () Unit!3928)

(declare-fun addApplyDifferent!87 (ListLongMap!1633 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3928)

(assert (=> b!126413 (= lt!65221 (addApplyDifferent!87 lt!65223 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65226))))

(assert (=> b!126413 (= (apply!111 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65226) (apply!111 lt!65223 lt!65226))))

(declare-fun lt!65231 () Unit!3928)

(assert (=> b!126413 (= lt!65231 lt!65221)))

(declare-fun lt!65214 () ListLongMap!1633)

(assert (=> b!126413 (= lt!65214 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun lt!65222 () (_ BitVec 64))

(assert (=> b!126413 (= lt!65222 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65212 () (_ BitVec 64))

(assert (=> b!126413 (= lt!65212 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65211 () Unit!3928)

(assert (=> b!126413 (= lt!65211 (addApplyDifferent!87 lt!65214 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65212))))

(assert (=> b!126413 (= (apply!111 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65212) (apply!111 lt!65214 lt!65212))))

(declare-fun lt!65220 () Unit!3928)

(assert (=> b!126413 (= lt!65220 lt!65211)))

(declare-fun lt!65227 () ListLongMap!1633)

(assert (=> b!126413 (= lt!65227 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun lt!65218 () (_ BitVec 64))

(assert (=> b!126413 (= lt!65218 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65224 () (_ BitVec 64))

(assert (=> b!126413 (= lt!65224 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!126413 (= lt!65228 (addApplyDifferent!87 lt!65227 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65224))))

(assert (=> b!126413 (= (apply!111 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65224) (apply!111 lt!65227 lt!65224))))

(declare-fun b!126414 () Bool)

(declare-fun Unit!3933 () Unit!3928)

(assert (=> b!126414 (= e!82567 Unit!3933)))

(declare-fun d!38147 () Bool)

(assert (=> d!38147 e!82564))

(declare-fun res!61129 () Bool)

(assert (=> d!38147 (=> (not res!61129) (not e!82564))))

(assert (=> d!38147 (= res!61129 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun lt!65217 () ListLongMap!1633)

(assert (=> d!38147 (= lt!65225 lt!65217)))

(declare-fun lt!65229 () Unit!3928)

(assert (=> d!38147 (= lt!65229 e!82567)))

(declare-fun c!23107 () Bool)

(assert (=> d!38147 (= c!23107 e!82565)))

(declare-fun res!61126 () Bool)

(assert (=> d!38147 (=> (not res!61126) (not e!82565))))

(assert (=> d!38147 (= res!61126 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38147 (= lt!65217 e!82568)))

(assert (=> d!38147 (= c!23109 (and (not (= (bvand (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38147 (validMask!0 (mask!7038 (v!3124 (underlying!439 thiss!992))))))

(assert (=> d!38147 (= (getCurrentListMap!512 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))) lt!65225)))

(declare-fun b!126415 () Bool)

(assert (=> b!126415 (= e!82562 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126416 () Bool)

(assert (=> b!126416 (= e!82568 (+!164 call!13591 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126417 () Bool)

(assert (=> b!126417 (= e!82561 e!82570)))

(declare-fun res!61123 () Bool)

(assert (=> b!126417 (= res!61123 call!13587)))

(assert (=> b!126417 (=> (not res!61123) (not e!82570))))

(assert (= (and d!38147 c!23109) b!126416))

(assert (= (and d!38147 (not c!23109)) b!126398))

(assert (= (and b!126398 c!23106) b!126405))

(assert (= (and b!126398 (not c!23106)) b!126408))

(assert (= (and b!126408 c!23108) b!126400))

(assert (= (and b!126408 (not c!23108)) b!126406))

(assert (= (or b!126400 b!126406) bm!13586))

(assert (= (or b!126405 bm!13586) bm!13588))

(assert (= (or b!126405 b!126400) bm!13587))

(assert (= (or b!126416 bm!13588) bm!13584))

(assert (= (or b!126416 bm!13587) bm!13583))

(assert (= (and d!38147 res!61126) b!126402))

(assert (= (and d!38147 c!23107) b!126413))

(assert (= (and d!38147 (not c!23107)) b!126414))

(assert (= (and d!38147 res!61129) b!126401))

(assert (= (and b!126401 res!61127) b!126415))

(assert (= (and b!126401 (not res!61122)) b!126399))

(assert (= (and b!126399 res!61125) b!126410))

(assert (= (and b!126401 res!61121) b!126404))

(assert (= (and b!126404 c!23105) b!126417))

(assert (= (and b!126404 (not c!23105)) b!126411))

(assert (= (and b!126417 res!61123) b!126412))

(assert (= (or b!126417 b!126411) bm!13589))

(assert (= (and b!126404 res!61128) b!126397))

(assert (= (and b!126397 c!23110) b!126407))

(assert (= (and b!126397 (not c!23110)) b!126409))

(assert (= (and b!126407 res!61124) b!126403))

(assert (= (or b!126407 b!126409) bm!13585))

(declare-fun b_lambda!5573 () Bool)

(assert (=> (not b_lambda!5573) (not b!126410)))

(assert (=> b!126410 t!6014))

(declare-fun b_and!7781 () Bool)

(assert (= b_and!7761 (and (=> t!6014 result!3823) b_and!7781)))

(assert (=> b!126410 t!6016))

(declare-fun b_and!7783 () Bool)

(assert (= b_and!7763 (and (=> t!6016 result!3827) b_and!7783)))

(declare-fun m!147373 () Bool)

(assert (=> b!126415 m!147373))

(assert (=> b!126415 m!147373))

(declare-fun m!147375 () Bool)

(assert (=> b!126415 m!147375))

(declare-fun m!147377 () Bool)

(assert (=> b!126413 m!147377))

(declare-fun m!147379 () Bool)

(assert (=> b!126413 m!147379))

(declare-fun m!147381 () Bool)

(assert (=> b!126413 m!147381))

(declare-fun m!147383 () Bool)

(assert (=> b!126413 m!147383))

(declare-fun m!147385 () Bool)

(assert (=> b!126413 m!147385))

(assert (=> b!126413 m!147383))

(declare-fun m!147387 () Bool)

(assert (=> b!126413 m!147387))

(declare-fun m!147389 () Bool)

(assert (=> b!126413 m!147389))

(declare-fun m!147391 () Bool)

(assert (=> b!126413 m!147391))

(declare-fun m!147393 () Bool)

(assert (=> b!126413 m!147393))

(assert (=> b!126413 m!147379))

(declare-fun m!147395 () Bool)

(assert (=> b!126413 m!147395))

(declare-fun m!147397 () Bool)

(assert (=> b!126413 m!147397))

(declare-fun m!147399 () Bool)

(assert (=> b!126413 m!147399))

(declare-fun m!147401 () Bool)

(assert (=> b!126413 m!147401))

(declare-fun m!147403 () Bool)

(assert (=> b!126413 m!147403))

(declare-fun m!147405 () Bool)

(assert (=> b!126413 m!147405))

(assert (=> b!126413 m!147373))

(assert (=> b!126413 m!147387))

(assert (=> b!126413 m!147399))

(declare-fun m!147407 () Bool)

(assert (=> b!126413 m!147407))

(declare-fun m!147409 () Bool)

(assert (=> bm!13589 m!147409))

(declare-fun m!147411 () Bool)

(assert (=> bm!13583 m!147411))

(assert (=> bm!13584 m!147405))

(declare-fun m!147413 () Bool)

(assert (=> b!126403 m!147413))

(assert (=> b!126402 m!147373))

(assert (=> b!126402 m!147373))

(assert (=> b!126402 m!147375))

(assert (=> b!126399 m!147373))

(assert (=> b!126399 m!147373))

(declare-fun m!147415 () Bool)

(assert (=> b!126399 m!147415))

(assert (=> b!126410 m!147213))

(assert (=> b!126410 m!147373))

(declare-fun m!147417 () Bool)

(assert (=> b!126410 m!147417))

(assert (=> b!126410 m!147373))

(declare-fun m!147419 () Bool)

(assert (=> b!126410 m!147419))

(assert (=> b!126410 m!147419))

(assert (=> b!126410 m!147213))

(declare-fun m!147421 () Bool)

(assert (=> b!126410 m!147421))

(declare-fun m!147423 () Bool)

(assert (=> bm!13585 m!147423))

(declare-fun m!147425 () Bool)

(assert (=> b!126416 m!147425))

(declare-fun m!147427 () Bool)

(assert (=> b!126412 m!147427))

(assert (=> d!38147 m!147201))

(assert (=> b!126104 d!38147))

(declare-fun d!38149 () Bool)

(declare-fun res!61136 () Bool)

(declare-fun e!82574 () Bool)

(assert (=> d!38149 (=> (not res!61136) (not e!82574))))

(declare-fun simpleValid!87 (LongMapFixedSize!1060) Bool)

(assert (=> d!38149 (= res!61136 (simpleValid!87 newMap!16))))

(assert (=> d!38149 (= (valid!520 newMap!16) e!82574)))

(declare-fun b!126424 () Bool)

(declare-fun res!61137 () Bool)

(assert (=> b!126424 (=> (not res!61137) (not e!82574))))

(declare-fun arrayCountValidKeys!0 (array!4681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!126424 (= res!61137 (= (arrayCountValidKeys!0 (_keys!4515 newMap!16) #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (_size!579 newMap!16)))))

(declare-fun b!126425 () Bool)

(declare-fun res!61138 () Bool)

(assert (=> b!126425 (=> (not res!61138) (not e!82574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4681 (_ BitVec 32)) Bool)

(assert (=> b!126425 (= res!61138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun b!126426 () Bool)

(declare-datatypes ((List!1680 0))(
  ( (Nil!1677) (Cons!1676 (h!2278 (_ BitVec 64)) (t!6027 List!1680)) )
))
(declare-fun arrayNoDuplicates!0 (array!4681 (_ BitVec 32) List!1680) Bool)

(assert (=> b!126426 (= e!82574 (arrayNoDuplicates!0 (_keys!4515 newMap!16) #b00000000000000000000000000000000 Nil!1677))))

(assert (= (and d!38149 res!61136) b!126424))

(assert (= (and b!126424 res!61137) b!126425))

(assert (= (and b!126425 res!61138) b!126426))

(declare-fun m!147429 () Bool)

(assert (=> d!38149 m!147429))

(declare-fun m!147431 () Bool)

(assert (=> b!126424 m!147431))

(declare-fun m!147433 () Bool)

(assert (=> b!126425 m!147433))

(declare-fun m!147435 () Bool)

(assert (=> b!126426 m!147435))

(assert (=> b!126101 d!38149))

(declare-fun d!38151 () Bool)

(assert (=> d!38151 (= (array_inv!1389 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvsge (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!126102 d!38151))

(declare-fun d!38153 () Bool)

(assert (=> d!38153 (= (array_inv!1390 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvsge (size!2481 (_values!2765 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!126102 d!38153))

(declare-fun d!38155 () Bool)

(assert (=> d!38155 (= (array_inv!1389 (_keys!4515 newMap!16)) (bvsge (size!2480 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126097 d!38155))

(declare-fun d!38157 () Bool)

(assert (=> d!38157 (= (array_inv!1390 (_values!2765 newMap!16)) (bvsge (size!2481 (_values!2765 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126097 d!38157))

(declare-fun condMapEmpty!4509 () Bool)

(declare-fun mapDefault!4509 () ValueCell!1076)

(assert (=> mapNonEmpty!4494 (= condMapEmpty!4509 (= mapRest!4493 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4509)))))

(declare-fun e!82579 () Bool)

(declare-fun mapRes!4509 () Bool)

(assert (=> mapNonEmpty!4494 (= tp!10941 (and e!82579 mapRes!4509))))

(declare-fun b!126433 () Bool)

(declare-fun e!82580 () Bool)

(assert (=> b!126433 (= e!82580 tp_is_empty!2839)))

(declare-fun mapNonEmpty!4509 () Bool)

(declare-fun tp!10971 () Bool)

(assert (=> mapNonEmpty!4509 (= mapRes!4509 (and tp!10971 e!82580))))

(declare-fun mapKey!4509 () (_ BitVec 32))

(declare-fun mapRest!4509 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapValue!4509 () ValueCell!1076)

(assert (=> mapNonEmpty!4509 (= mapRest!4493 (store mapRest!4509 mapKey!4509 mapValue!4509))))

(declare-fun b!126434 () Bool)

(assert (=> b!126434 (= e!82579 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4509 () Bool)

(assert (=> mapIsEmpty!4509 mapRes!4509))

(assert (= (and mapNonEmpty!4494 condMapEmpty!4509) mapIsEmpty!4509))

(assert (= (and mapNonEmpty!4494 (not condMapEmpty!4509)) mapNonEmpty!4509))

(assert (= (and mapNonEmpty!4509 ((_ is ValueCellFull!1076) mapValue!4509)) b!126433))

(assert (= (and mapNonEmpty!4494 ((_ is ValueCellFull!1076) mapDefault!4509)) b!126434))

(declare-fun m!147437 () Bool)

(assert (=> mapNonEmpty!4509 m!147437))

(declare-fun condMapEmpty!4510 () Bool)

(declare-fun mapDefault!4510 () ValueCell!1076)

(assert (=> mapNonEmpty!4493 (= condMapEmpty!4510 (= mapRest!4494 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4510)))))

(declare-fun e!82581 () Bool)

(declare-fun mapRes!4510 () Bool)

(assert (=> mapNonEmpty!4493 (= tp!10943 (and e!82581 mapRes!4510))))

(declare-fun b!126435 () Bool)

(declare-fun e!82582 () Bool)

(assert (=> b!126435 (= e!82582 tp_is_empty!2839)))

(declare-fun mapNonEmpty!4510 () Bool)

(declare-fun tp!10972 () Bool)

(assert (=> mapNonEmpty!4510 (= mapRes!4510 (and tp!10972 e!82582))))

(declare-fun mapKey!4510 () (_ BitVec 32))

(declare-fun mapRest!4510 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapValue!4510 () ValueCell!1076)

(assert (=> mapNonEmpty!4510 (= mapRest!4494 (store mapRest!4510 mapKey!4510 mapValue!4510))))

(declare-fun b!126436 () Bool)

(assert (=> b!126436 (= e!82581 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4510 () Bool)

(assert (=> mapIsEmpty!4510 mapRes!4510))

(assert (= (and mapNonEmpty!4493 condMapEmpty!4510) mapIsEmpty!4510))

(assert (= (and mapNonEmpty!4493 (not condMapEmpty!4510)) mapNonEmpty!4510))

(assert (= (and mapNonEmpty!4510 ((_ is ValueCellFull!1076) mapValue!4510)) b!126435))

(assert (= (and mapNonEmpty!4493 ((_ is ValueCellFull!1076) mapDefault!4510)) b!126436))

(declare-fun m!147439 () Bool)

(assert (=> mapNonEmpty!4510 m!147439))

(declare-fun b_lambda!5575 () Bool)

(assert (= b_lambda!5573 (or (and b!126102 b_free!2845) (and b!126097 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))))) b_lambda!5575)))

(check-sat (not b!126399) (not b!126416) (not bm!13552) (not bm!13551) (not d!38139) (not b!126402) (not b_next!2847) (not mapNonEmpty!4510) (not b!126339) tp_is_empty!2839 (not b!126410) (not b!126424) (not b!126220) (not bm!13568) (not b!126413) (not bm!13564) (not mapNonEmpty!4509) (not bm!13550) (not d!38149) (not bm!13584) (not b!126403) (not b!126222) (not bm!13565) (not bm!13558) (not b!126326) (not b!126345) (not bm!13583) (not bm!13545) (not b!126332) (not b_lambda!5571) (not b_lambda!5575) (not bm!13548) (not b!126412) (not bm!13546) b_and!7781 (not b!126333) (not bm!13589) (not b!126415) (not bm!13547) (not bm!13585) (not b!126353) (not d!38147) (not b!126316) (not b!126354) (not b!126426) (not b_next!2845) (not d!38137) b_and!7783 (not b!126425) (not b!126340) (not bm!13560) (not d!38135) (not d!38145))
(check-sat b_and!7781 b_and!7783 (not b_next!2845) (not b_next!2847))
(get-model)

(declare-fun b!126471 () Bool)

(declare-fun res!61162 () Bool)

(declare-fun e!82600 () Bool)

(assert (=> b!126471 (=> (not res!61162) (not e!82600))))

(declare-fun lt!65321 () tuple2!2526)

(assert (=> b!126471 (= res!61162 (valid!520 (_2!1274 lt!65321)))))

(declare-fun b!126472 () Bool)

(declare-fun res!61158 () Bool)

(assert (=> b!126472 (=> (not res!61158) (not e!82600))))

(assert (=> b!126472 (= res!61158 (contains!864 (map!1380 (_2!1274 lt!65321)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126473 () Bool)

(declare-fun res!61163 () Bool)

(declare-fun call!13601 () Bool)

(assert (=> b!126473 (= res!61163 call!13601)))

(declare-fun e!82601 () Bool)

(assert (=> b!126473 (=> (not res!61163) (not e!82601))))

(declare-fun b!126474 () Bool)

(declare-fun e!82603 () Unit!3928)

(declare-fun Unit!3934 () Unit!3928)

(assert (=> b!126474 (= e!82603 Unit!3934)))

(declare-fun lt!65314 () Unit!3928)

(declare-fun lemmaArrayContainsKeyThenInListMap!37 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) (_ BitVec 32) Int) Unit!3928)

(assert (=> b!126474 (= lt!65314 (lemmaArrayContainsKeyThenInListMap!37 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> b!126474 (contains!864 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))

(declare-fun lt!65319 () Unit!3928)

(assert (=> b!126474 (= lt!65319 lt!65314)))

(assert (=> b!126474 false))

(declare-fun c!23121 () Bool)

(declare-fun lt!65295 () SeekEntryResult!264)

(declare-fun bm!13598 () Bool)

(declare-fun c!23120 () Bool)

(declare-fun lt!65299 () SeekEntryResult!264)

(assert (=> bm!13598 (= call!13601 (inRange!0 (ite c!23120 (index!3212 lt!65299) (ite c!23121 (index!3211 lt!65295) (index!3214 lt!65295))) (mask!7038 newMap!16)))))

(declare-fun b!126475 () Bool)

(declare-fun e!82599 () Bool)

(declare-fun call!13602 () Bool)

(assert (=> b!126475 (= e!82599 (not call!13602))))

(declare-fun b!126476 () Bool)

(declare-fun e!82605 () Unit!3928)

(declare-fun lt!65298 () Unit!3928)

(assert (=> b!126476 (= e!82605 lt!65298)))

(assert (=> b!126476 (= lt!65298 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(declare-fun call!13603 () SeekEntryResult!264)

(assert (=> b!126476 (= lt!65295 call!13603)))

(assert (=> b!126476 (= c!23121 ((_ is MissingZero!264) lt!65295))))

(declare-fun e!82604 () Bool)

(assert (=> b!126476 e!82604))

(declare-fun bm!13599 () Bool)

(declare-fun call!13604 () Bool)

(assert (=> bm!13599 (= call!13604 call!13601)))

(declare-fun d!38159 () Bool)

(assert (=> d!38159 e!82600))

(declare-fun res!61157 () Bool)

(assert (=> d!38159 (=> (not res!61157) (not e!82600))))

(assert (=> d!38159 (= res!61157 (_1!1274 lt!65321))))

(assert (=> d!38159 (= lt!65321 (tuple2!2527 true (LongMapFixedSize!1061 (defaultEntry!2782 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (bvadd (_size!579 newMap!16) #b00000000000000000000000000000001) (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (_vacant!579 newMap!16))))))

(declare-fun lt!65301 () Unit!3928)

(declare-fun lt!65320 () Unit!3928)

(assert (=> d!38159 (= lt!65301 lt!65320)))

(declare-fun lt!65307 () array!4681)

(declare-fun lt!65300 () array!4683)

(assert (=> d!38159 (contains!864 (getCurrentListMap!512 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))))))

(assert (=> d!38159 (= lt!65320 (lemmaValidKeyInArrayIsInListMap!116 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38159 (= lt!65300 (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))))

(assert (=> d!38159 (= lt!65307 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun lt!65306 () Unit!3928)

(declare-fun lt!65311 () Unit!3928)

(assert (=> d!38159 (= lt!65306 lt!65311)))

(declare-fun lt!65315 () array!4681)

(assert (=> d!38159 (= (arrayCountValidKeys!0 lt!65315 (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (bvadd (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4681 (_ BitVec 32)) Unit!3928)

(assert (=> d!38159 (= lt!65311 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!65315 (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))))))

(assert (=> d!38159 (= lt!65315 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun lt!65293 () Unit!3928)

(declare-fun lt!65309 () Unit!3928)

(assert (=> d!38159 (= lt!65293 lt!65309)))

(declare-fun lt!65305 () array!4681)

(assert (=> d!38159 (arrayContainsKey!0 lt!65305 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4681 (_ BitVec 64) (_ BitVec 32)) Unit!3928)

(assert (=> d!38159 (= lt!65309 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!65305 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))))))

(assert (=> d!38159 (= lt!65305 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun lt!65310 () Unit!3928)

(declare-fun lt!65297 () Unit!3928)

(assert (=> d!38159 (= lt!65310 lt!65297)))

(assert (=> d!38159 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!512 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!37 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) (_ BitVec 64) V!3433 Int) Unit!3928)

(assert (=> d!38159 (= lt!65297 (lemmaAddValidKeyToArrayThenAddPairToListMap!37 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65322 () Unit!3928)

(declare-fun lt!65308 () Unit!3928)

(assert (=> d!38159 (= lt!65322 lt!65308)))

(assert (=> d!38159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (mask!7038 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4681 (_ BitVec 32) (_ BitVec 32)) Unit!3928)

(assert (=> d!38159 (= lt!65308 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (mask!7038 newMap!16)))))

(declare-fun lt!65294 () Unit!3928)

(declare-fun lt!65312 () Unit!3928)

(assert (=> d!38159 (= lt!65294 lt!65312)))

(assert (=> d!38159 (= (arrayCountValidKeys!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4515 newMap!16) #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4681 (_ BitVec 32) (_ BitVec 64)) Unit!3928)

(assert (=> d!38159 (= lt!65312 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4515 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65302 () Unit!3928)

(declare-fun lt!65318 () Unit!3928)

(assert (=> d!38159 (= lt!65302 lt!65318)))

(declare-fun lt!65317 () (_ BitVec 32))

(declare-fun lt!65313 () List!1680)

(assert (=> d!38159 (arrayNoDuplicates!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) lt!65317 lt!65313)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4681 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1680) Unit!3928)

(assert (=> d!38159 (= lt!65318 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) lt!65317 lt!65313))))

(assert (=> d!38159 (= lt!65313 Nil!1677)))

(assert (=> d!38159 (= lt!65317 #b00000000000000000000000000000000)))

(declare-fun lt!65304 () Unit!3928)

(assert (=> d!38159 (= lt!65304 e!82603)))

(declare-fun c!23119 () Bool)

(assert (=> d!38159 (= c!23119 (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!65316 () Unit!3928)

(assert (=> d!38159 (= lt!65316 e!82605)))

(assert (=> d!38159 (= c!23120 (contains!864 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38159 (valid!520 newMap!16)))

(assert (=> d!38159 (= (updateHelperNewKey!56 newMap!16 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))) lt!65321)))

(declare-fun b!126477 () Bool)

(declare-fun e!82602 () Bool)

(assert (=> b!126477 (= e!82602 (not call!13602))))

(declare-fun b!126478 () Bool)

(declare-fun res!61160 () Bool)

(assert (=> b!126478 (=> (not res!61160) (not e!82602))))

(assert (=> b!126478 (= res!61160 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3211 lt!65295)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126479 () Bool)

(declare-fun c!23122 () Bool)

(assert (=> b!126479 (= c!23122 ((_ is MissingVacant!264) lt!65295))))

(declare-fun e!82606 () Bool)

(assert (=> b!126479 (= e!82604 e!82606)))

(declare-fun bm!13600 () Bool)

(assert (=> bm!13600 (= call!13602 (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!126480 () Bool)

(declare-fun res!61164 () Bool)

(assert (=> b!126480 (= res!61164 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3214 lt!65295)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126480 (=> (not res!61164) (not e!82599))))

(declare-fun b!126481 () Bool)

(assert (=> b!126481 (= e!82606 ((_ is Undefined!264) lt!65295))))

(declare-fun bm!13601 () Bool)

(assert (=> bm!13601 (= call!13603 (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun b!126482 () Bool)

(assert (=> b!126482 (= e!82601 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65299)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126483 () Bool)

(assert (=> b!126483 (= e!82606 e!82599)))

(declare-fun res!61165 () Bool)

(assert (=> b!126483 (= res!61165 call!13604)))

(assert (=> b!126483 (=> (not res!61165) (not e!82599))))

(declare-fun b!126484 () Bool)

(declare-fun Unit!3935 () Unit!3928)

(assert (=> b!126484 (= e!82605 Unit!3935)))

(declare-fun lt!65296 () Unit!3928)

(assert (=> b!126484 (= lt!65296 (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(assert (=> b!126484 (= lt!65299 call!13603)))

(declare-fun res!61159 () Bool)

(assert (=> b!126484 (= res!61159 ((_ is Found!264) lt!65299))))

(assert (=> b!126484 (=> (not res!61159) (not e!82601))))

(assert (=> b!126484 e!82601))

(declare-fun lt!65303 () Unit!3928)

(assert (=> b!126484 (= lt!65303 lt!65296)))

(assert (=> b!126484 false))

(declare-fun b!126485 () Bool)

(declare-fun Unit!3936 () Unit!3928)

(assert (=> b!126485 (= e!82603 Unit!3936)))

(declare-fun b!126486 () Bool)

(declare-fun res!61161 () Bool)

(assert (=> b!126486 (=> (not res!61161) (not e!82602))))

(assert (=> b!126486 (= res!61161 call!13604)))

(assert (=> b!126486 (= e!82604 e!82602)))

(declare-fun b!126487 () Bool)

(assert (=> b!126487 (= e!82600 (= (map!1380 (_2!1274 lt!65321)) (+!164 (map!1380 newMap!16) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38159 c!23120) b!126484))

(assert (= (and d!38159 (not c!23120)) b!126476))

(assert (= (and b!126484 res!61159) b!126473))

(assert (= (and b!126473 res!61163) b!126482))

(assert (= (and b!126476 c!23121) b!126486))

(assert (= (and b!126476 (not c!23121)) b!126479))

(assert (= (and b!126486 res!61161) b!126478))

(assert (= (and b!126478 res!61160) b!126477))

(assert (= (and b!126479 c!23122) b!126483))

(assert (= (and b!126479 (not c!23122)) b!126481))

(assert (= (and b!126483 res!61165) b!126480))

(assert (= (and b!126480 res!61164) b!126475))

(assert (= (or b!126486 b!126483) bm!13599))

(assert (= (or b!126477 b!126475) bm!13600))

(assert (= (or b!126473 bm!13599) bm!13598))

(assert (= (or b!126484 b!126476) bm!13601))

(assert (= (and d!38159 c!23119) b!126474))

(assert (= (and d!38159 (not c!23119)) b!126485))

(assert (= (and d!38159 res!61157) b!126471))

(assert (= (and b!126471 res!61162) b!126472))

(assert (= (and b!126472 res!61158) b!126487))

(assert (=> bm!13600 m!147207))

(assert (=> bm!13600 m!147327))

(assert (=> b!126476 m!147207))

(assert (=> b!126476 m!147359))

(assert (=> b!126474 m!147207))

(declare-fun m!147441 () Bool)

(assert (=> b!126474 m!147441))

(assert (=> b!126474 m!147325))

(assert (=> b!126474 m!147325))

(assert (=> b!126474 m!147207))

(assert (=> b!126474 m!147343))

(declare-fun m!147443 () Bool)

(assert (=> b!126472 m!147443))

(assert (=> b!126472 m!147443))

(assert (=> b!126472 m!147207))

(declare-fun m!147445 () Bool)

(assert (=> b!126472 m!147445))

(declare-fun m!147447 () Bool)

(assert (=> b!126471 m!147447))

(declare-fun m!147449 () Bool)

(assert (=> b!126482 m!147449))

(declare-fun m!147451 () Bool)

(assert (=> b!126480 m!147451))

(assert (=> bm!13601 m!147207))

(assert (=> bm!13601 m!147355))

(declare-fun m!147453 () Bool)

(assert (=> b!126478 m!147453))

(assert (=> d!38159 m!147207))

(assert (=> d!38159 m!147215))

(declare-fun m!147455 () Bool)

(assert (=> d!38159 m!147455))

(declare-fun m!147457 () Bool)

(assert (=> d!38159 m!147457))

(assert (=> d!38159 m!147207))

(declare-fun m!147459 () Bool)

(assert (=> d!38159 m!147459))

(declare-fun m!147461 () Bool)

(assert (=> d!38159 m!147461))

(declare-fun m!147463 () Bool)

(assert (=> d!38159 m!147463))

(declare-fun m!147465 () Bool)

(assert (=> d!38159 m!147465))

(declare-fun m!147467 () Bool)

(assert (=> d!38159 m!147467))

(declare-fun m!147469 () Bool)

(assert (=> d!38159 m!147469))

(declare-fun m!147471 () Bool)

(assert (=> d!38159 m!147471))

(assert (=> d!38159 m!147325))

(declare-fun m!147473 () Bool)

(assert (=> d!38159 m!147473))

(assert (=> d!38159 m!147207))

(declare-fun m!147475 () Bool)

(assert (=> d!38159 m!147475))

(declare-fun m!147477 () Bool)

(assert (=> d!38159 m!147477))

(assert (=> d!38159 m!147207))

(declare-fun m!147479 () Bool)

(assert (=> d!38159 m!147479))

(assert (=> d!38159 m!147207))

(declare-fun m!147481 () Bool)

(assert (=> d!38159 m!147481))

(assert (=> d!38159 m!147465))

(assert (=> d!38159 m!147471))

(declare-fun m!147483 () Bool)

(assert (=> d!38159 m!147483))

(assert (=> d!38159 m!147207))

(declare-fun m!147485 () Bool)

(assert (=> d!38159 m!147485))

(assert (=> d!38159 m!147325))

(assert (=> d!38159 m!147207))

(assert (=> d!38159 m!147343))

(declare-fun m!147487 () Bool)

(assert (=> d!38159 m!147487))

(assert (=> d!38159 m!147325))

(assert (=> d!38159 m!147207))

(assert (=> d!38159 m!147327))

(assert (=> d!38159 m!147431))

(declare-fun m!147489 () Bool)

(assert (=> d!38159 m!147489))

(declare-fun m!147491 () Bool)

(assert (=> d!38159 m!147491))

(assert (=> d!38159 m!147219))

(assert (=> b!126484 m!147207))

(assert (=> b!126484 m!147353))

(assert (=> b!126487 m!147443))

(assert (=> b!126487 m!147231))

(assert (=> b!126487 m!147231))

(declare-fun m!147493 () Bool)

(assert (=> b!126487 m!147493))

(declare-fun m!147495 () Bool)

(assert (=> bm!13598 m!147495))

(assert (=> bm!13565 d!38159))

(declare-fun d!38161 () Bool)

(assert (=> d!38161 (= (get!1454 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3123 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126353 d!38161))

(declare-fun d!38163 () Bool)

(declare-fun e!82609 () Bool)

(assert (=> d!38163 e!82609))

(declare-fun res!61171 () Bool)

(assert (=> d!38163 (=> (not res!61171) (not e!82609))))

(declare-fun lt!65331 () ListLongMap!1633)

(assert (=> d!38163 (= res!61171 (contains!864 lt!65331 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!65332 () List!1678)

(assert (=> d!38163 (= lt!65331 (ListLongMap!1634 lt!65332))))

(declare-fun lt!65334 () Unit!3928)

(declare-fun lt!65333 () Unit!3928)

(assert (=> d!38163 (= lt!65334 lt!65333)))

(assert (=> d!38163 (= (getValueByKey!168 lt!65332 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!173 (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!83 (List!1678 (_ BitVec 64) V!3433) Unit!3928)

(assert (=> d!38163 (= lt!65333 (lemmaContainsTupThenGetReturnValue!83 lt!65332 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!86 (List!1678 (_ BitVec 64) V!3433) List!1678)

(assert (=> d!38163 (= lt!65332 (insertStrictlySorted!86 (toList!832 e!82522) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38163 (= (+!164 e!82522 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65331)))

(declare-fun b!126492 () Bool)

(declare-fun res!61170 () Bool)

(assert (=> b!126492 (=> (not res!61170) (not e!82609))))

(assert (=> b!126492 (= res!61170 (= (getValueByKey!168 (toList!832 lt!65331) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!173 (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!126493 () Bool)

(declare-fun contains!866 (List!1678 tuple2!2524) Bool)

(assert (=> b!126493 (= e!82609 (contains!866 (toList!832 lt!65331) (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38163 res!61171) b!126492))

(assert (= (and b!126492 res!61170) b!126493))

(declare-fun m!147497 () Bool)

(assert (=> d!38163 m!147497))

(declare-fun m!147499 () Bool)

(assert (=> d!38163 m!147499))

(declare-fun m!147501 () Bool)

(assert (=> d!38163 m!147501))

(declare-fun m!147503 () Bool)

(assert (=> d!38163 m!147503))

(declare-fun m!147505 () Bool)

(assert (=> b!126492 m!147505))

(declare-fun m!147507 () Bool)

(assert (=> b!126493 m!147507))

(assert (=> bm!13548 d!38163))

(declare-fun d!38165 () Bool)

(declare-fun e!82611 () Bool)

(assert (=> d!38165 e!82611))

(declare-fun res!61172 () Bool)

(assert (=> d!38165 (=> res!61172 e!82611)))

(declare-fun lt!65336 () Bool)

(assert (=> d!38165 (= res!61172 (not lt!65336))))

(declare-fun lt!65335 () Bool)

(assert (=> d!38165 (= lt!65336 lt!65335)))

(declare-fun lt!65338 () Unit!3928)

(declare-fun e!82610 () Unit!3928)

(assert (=> d!38165 (= lt!65338 e!82610)))

(declare-fun c!23123 () Bool)

(assert (=> d!38165 (= c!23123 lt!65335)))

(assert (=> d!38165 (= lt!65335 (containsKey!171 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38165 (= (contains!864 lt!65225 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65336)))

(declare-fun b!126494 () Bool)

(declare-fun lt!65337 () Unit!3928)

(assert (=> b!126494 (= e!82610 lt!65337)))

(assert (=> b!126494 (= lt!65337 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126494 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126495 () Bool)

(declare-fun Unit!3937 () Unit!3928)

(assert (=> b!126495 (= e!82610 Unit!3937)))

(declare-fun b!126496 () Bool)

(assert (=> b!126496 (= e!82611 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38165 c!23123) b!126494))

(assert (= (and d!38165 (not c!23123)) b!126495))

(assert (= (and d!38165 (not res!61172)) b!126496))

(declare-fun m!147509 () Bool)

(assert (=> d!38165 m!147509))

(declare-fun m!147511 () Bool)

(assert (=> b!126494 m!147511))

(declare-fun m!147513 () Bool)

(assert (=> b!126494 m!147513))

(assert (=> b!126494 m!147513))

(declare-fun m!147515 () Bool)

(assert (=> b!126494 m!147515))

(assert (=> b!126496 m!147513))

(assert (=> b!126496 m!147513))

(assert (=> b!126496 m!147515))

(assert (=> bm!13589 d!38165))

(declare-fun d!38167 () Bool)

(assert (=> d!38167 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65341 () Unit!3928)

(declare-fun choose!767 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 V!3433 Int) Unit!3928)

(assert (=> d!38167 (= lt!65341 (choose!767 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38167 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38167 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) lt!65341)))

(declare-fun bs!5240 () Bool)

(assert (= bs!5240 d!38167))

(assert (=> bs!5240 m!147325))

(declare-fun m!147517 () Bool)

(assert (=> bs!5240 m!147517))

(assert (=> bs!5240 m!147325))

(declare-fun m!147519 () Bool)

(assert (=> bs!5240 m!147519))

(assert (=> bs!5240 m!147215))

(declare-fun m!147521 () Bool)

(assert (=> bs!5240 m!147521))

(assert (=> bs!5240 m!147215))

(declare-fun m!147523 () Bool)

(assert (=> bs!5240 m!147523))

(assert (=> b!126339 d!38167))

(assert (=> d!38147 d!38143))

(declare-fun b!126497 () Bool)

(declare-fun e!82617 () Bool)

(declare-fun e!82624 () Bool)

(assert (=> b!126497 (= e!82617 e!82624)))

(declare-fun c!23129 () Bool)

(assert (=> b!126497 (= c!23129 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126498 () Bool)

(declare-fun e!82621 () ListLongMap!1633)

(declare-fun e!82622 () ListLongMap!1633)

(assert (=> b!126498 (= e!82621 e!82622)))

(declare-fun c!23125 () Bool)

(assert (=> b!126498 (= c!23125 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!13605 () ListLongMap!1633)

(declare-fun c!23128 () Bool)

(declare-fun call!13608 () ListLongMap!1633)

(declare-fun call!13611 () ListLongMap!1633)

(declare-fun bm!13602 () Bool)

(declare-fun call!13610 () ListLongMap!1633)

(assert (=> bm!13602 (= call!13610 (+!164 (ite c!23128 call!13605 (ite c!23125 call!13608 call!13611)) (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun bm!13603 () Bool)

(assert (=> bm!13603 (= call!13605 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13604 () Bool)

(declare-fun call!13609 () Bool)

(declare-fun lt!65356 () ListLongMap!1633)

(assert (=> bm!13604 (= call!13609 (contains!864 lt!65356 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126499 () Bool)

(declare-fun e!82612 () Bool)

(declare-fun e!82616 () Bool)

(assert (=> b!126499 (= e!82612 e!82616)))

(declare-fun res!61177 () Bool)

(assert (=> b!126499 (=> (not res!61177) (not e!82616))))

(assert (=> b!126499 (= res!61177 (contains!864 lt!65356 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126499 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun bm!13605 () Bool)

(assert (=> bm!13605 (= call!13611 call!13608)))

(declare-fun b!126500 () Bool)

(declare-fun e!82619 () ListLongMap!1633)

(declare-fun call!13607 () ListLongMap!1633)

(assert (=> b!126500 (= e!82619 call!13607)))

(declare-fun b!126501 () Bool)

(declare-fun res!61173 () Bool)

(assert (=> b!126501 (=> (not res!61173) (not e!82617))))

(assert (=> b!126501 (= res!61173 e!82612)))

(declare-fun res!61174 () Bool)

(assert (=> b!126501 (=> res!61174 e!82612)))

(declare-fun e!82615 () Bool)

(assert (=> b!126501 (= res!61174 (not e!82615))))

(declare-fun res!61179 () Bool)

(assert (=> b!126501 (=> (not res!61179) (not e!82615))))

(assert (=> b!126501 (= res!61179 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126502 () Bool)

(declare-fun e!82618 () Bool)

(assert (=> b!126502 (= e!82618 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126503 () Bool)

(declare-fun e!82613 () Bool)

(assert (=> b!126503 (= e!82613 (= (apply!111 lt!65356 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!126504 () Bool)

(declare-fun res!61180 () Bool)

(assert (=> b!126504 (=> (not res!61180) (not e!82617))))

(declare-fun e!82614 () Bool)

(assert (=> b!126504 (= res!61180 e!82614)))

(declare-fun c!23124 () Bool)

(assert (=> b!126504 (= c!23124 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13606 () Bool)

(assert (=> bm!13606 (= call!13607 call!13610)))

(declare-fun b!126505 () Bool)

(assert (=> b!126505 (= e!82622 call!13607)))

(declare-fun b!126506 () Bool)

(assert (=> b!126506 (= e!82619 call!13611)))

(declare-fun bm!13607 () Bool)

(assert (=> bm!13607 (= call!13608 call!13605)))

(declare-fun b!126507 () Bool)

(assert (=> b!126507 (= e!82624 e!82613)))

(declare-fun res!61176 () Bool)

(assert (=> b!126507 (= res!61176 call!13609)))

(assert (=> b!126507 (=> (not res!61176) (not e!82613))))

(declare-fun b!126508 () Bool)

(declare-fun c!23127 () Bool)

(assert (=> b!126508 (= c!23127 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126508 (= e!82622 e!82619)))

(declare-fun b!126509 () Bool)

(assert (=> b!126509 (= e!82624 (not call!13609))))

(declare-fun b!126510 () Bool)

(assert (=> b!126510 (= e!82616 (= (apply!111 lt!65356 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (ite c!23087 (_values!2765 newMap!16) lt!65155)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126510 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (ite c!23087 (_values!2765 newMap!16) lt!65155))))))

(assert (=> b!126510 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126511 () Bool)

(declare-fun call!13606 () Bool)

(assert (=> b!126511 (= e!82614 (not call!13606))))

(declare-fun bm!13608 () Bool)

(assert (=> bm!13608 (= call!13606 (contains!864 lt!65356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126512 () Bool)

(declare-fun e!82623 () Bool)

(assert (=> b!126512 (= e!82623 (= (apply!111 lt!65356 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!126513 () Bool)

(declare-fun e!82620 () Unit!3928)

(declare-fun lt!65359 () Unit!3928)

(assert (=> b!126513 (= e!82620 lt!65359)))

(declare-fun lt!65344 () ListLongMap!1633)

(assert (=> b!126513 (= lt!65344 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65363 () (_ BitVec 64))

(assert (=> b!126513 (= lt!65363 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65361 () (_ BitVec 64))

(assert (=> b!126513 (= lt!65361 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65346 () Unit!3928)

(assert (=> b!126513 (= lt!65346 (addStillContains!87 lt!65344 lt!65363 (zeroValue!2645 newMap!16) lt!65361))))

(assert (=> b!126513 (contains!864 (+!164 lt!65344 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16))) lt!65361)))

(declare-fun lt!65350 () Unit!3928)

(assert (=> b!126513 (= lt!65350 lt!65346)))

(declare-fun lt!65354 () ListLongMap!1633)

(assert (=> b!126513 (= lt!65354 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65347 () (_ BitVec 64))

(assert (=> b!126513 (= lt!65347 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65357 () (_ BitVec 64))

(assert (=> b!126513 (= lt!65357 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65352 () Unit!3928)

(assert (=> b!126513 (= lt!65352 (addApplyDifferent!87 lt!65354 lt!65347 (minValue!2645 newMap!16) lt!65357))))

(assert (=> b!126513 (= (apply!111 (+!164 lt!65354 (tuple2!2525 lt!65347 (minValue!2645 newMap!16))) lt!65357) (apply!111 lt!65354 lt!65357))))

(declare-fun lt!65362 () Unit!3928)

(assert (=> b!126513 (= lt!65362 lt!65352)))

(declare-fun lt!65345 () ListLongMap!1633)

(assert (=> b!126513 (= lt!65345 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65353 () (_ BitVec 64))

(assert (=> b!126513 (= lt!65353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65343 () (_ BitVec 64))

(assert (=> b!126513 (= lt!65343 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65342 () Unit!3928)

(assert (=> b!126513 (= lt!65342 (addApplyDifferent!87 lt!65345 lt!65353 (zeroValue!2645 newMap!16) lt!65343))))

(assert (=> b!126513 (= (apply!111 (+!164 lt!65345 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16))) lt!65343) (apply!111 lt!65345 lt!65343))))

(declare-fun lt!65351 () Unit!3928)

(assert (=> b!126513 (= lt!65351 lt!65342)))

(declare-fun lt!65358 () ListLongMap!1633)

(assert (=> b!126513 (= lt!65358 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65349 () (_ BitVec 64))

(assert (=> b!126513 (= lt!65349 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65355 () (_ BitVec 64))

(assert (=> b!126513 (= lt!65355 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126513 (= lt!65359 (addApplyDifferent!87 lt!65358 lt!65349 (minValue!2645 newMap!16) lt!65355))))

(assert (=> b!126513 (= (apply!111 (+!164 lt!65358 (tuple2!2525 lt!65349 (minValue!2645 newMap!16))) lt!65355) (apply!111 lt!65358 lt!65355))))

(declare-fun b!126514 () Bool)

(declare-fun Unit!3938 () Unit!3928)

(assert (=> b!126514 (= e!82620 Unit!3938)))

(declare-fun d!38169 () Bool)

(assert (=> d!38169 e!82617))

(declare-fun res!61181 () Bool)

(assert (=> d!38169 (=> (not res!61181) (not e!82617))))

(assert (=> d!38169 (= res!61181 (or (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun lt!65348 () ListLongMap!1633)

(assert (=> d!38169 (= lt!65356 lt!65348)))

(declare-fun lt!65360 () Unit!3928)

(assert (=> d!38169 (= lt!65360 e!82620)))

(declare-fun c!23126 () Bool)

(assert (=> d!38169 (= c!23126 e!82618)))

(declare-fun res!61178 () Bool)

(assert (=> d!38169 (=> (not res!61178) (not e!82618))))

(assert (=> d!38169 (= res!61178 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38169 (= lt!65348 e!82621)))

(assert (=> d!38169 (= c!23128 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38169 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38169 (= (getCurrentListMap!512 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65356)))

(declare-fun b!126515 () Bool)

(assert (=> b!126515 (= e!82615 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126516 () Bool)

(assert (=> b!126516 (= e!82621 (+!164 call!13610 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun b!126517 () Bool)

(assert (=> b!126517 (= e!82614 e!82623)))

(declare-fun res!61175 () Bool)

(assert (=> b!126517 (= res!61175 call!13606)))

(assert (=> b!126517 (=> (not res!61175) (not e!82623))))

(assert (= (and d!38169 c!23128) b!126516))

(assert (= (and d!38169 (not c!23128)) b!126498))

(assert (= (and b!126498 c!23125) b!126505))

(assert (= (and b!126498 (not c!23125)) b!126508))

(assert (= (and b!126508 c!23127) b!126500))

(assert (= (and b!126508 (not c!23127)) b!126506))

(assert (= (or b!126500 b!126506) bm!13605))

(assert (= (or b!126505 bm!13605) bm!13607))

(assert (= (or b!126505 b!126500) bm!13606))

(assert (= (or b!126516 bm!13607) bm!13603))

(assert (= (or b!126516 bm!13606) bm!13602))

(assert (= (and d!38169 res!61178) b!126502))

(assert (= (and d!38169 c!23126) b!126513))

(assert (= (and d!38169 (not c!23126)) b!126514))

(assert (= (and d!38169 res!61181) b!126501))

(assert (= (and b!126501 res!61179) b!126515))

(assert (= (and b!126501 (not res!61174)) b!126499))

(assert (= (and b!126499 res!61177) b!126510))

(assert (= (and b!126501 res!61173) b!126504))

(assert (= (and b!126504 c!23124) b!126517))

(assert (= (and b!126504 (not c!23124)) b!126511))

(assert (= (and b!126517 res!61175) b!126512))

(assert (= (or b!126517 b!126511) bm!13608))

(assert (= (and b!126504 res!61180) b!126497))

(assert (= (and b!126497 c!23129) b!126507))

(assert (= (and b!126497 (not c!23129)) b!126509))

(assert (= (and b!126507 res!61176) b!126503))

(assert (= (or b!126507 b!126509) bm!13604))

(declare-fun b_lambda!5577 () Bool)

(assert (=> (not b_lambda!5577) (not b!126510)))

(declare-fun tb!2313 () Bool)

(declare-fun t!6029 () Bool)

(assert (=> (and b!126102 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16)) t!6029) tb!2313))

(declare-fun result!3843 () Bool)

(assert (=> tb!2313 (= result!3843 tp_is_empty!2839)))

(assert (=> b!126510 t!6029))

(declare-fun b_and!7785 () Bool)

(assert (= b_and!7781 (and (=> t!6029 result!3843) b_and!7785)))

(declare-fun t!6031 () Bool)

(declare-fun tb!2315 () Bool)

(assert (=> (and b!126097 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 newMap!16)) t!6031) tb!2315))

(declare-fun result!3845 () Bool)

(assert (= result!3845 result!3843))

(assert (=> b!126510 t!6031))

(declare-fun b_and!7787 () Bool)

(assert (= b_and!7783 (and (=> t!6031 result!3845) b_and!7787)))

(declare-fun m!147525 () Bool)

(assert (=> b!126515 m!147525))

(assert (=> b!126515 m!147525))

(declare-fun m!147527 () Bool)

(assert (=> b!126515 m!147527))

(declare-fun m!147529 () Bool)

(assert (=> b!126513 m!147529))

(declare-fun m!147531 () Bool)

(assert (=> b!126513 m!147531))

(declare-fun m!147533 () Bool)

(assert (=> b!126513 m!147533))

(declare-fun m!147535 () Bool)

(assert (=> b!126513 m!147535))

(declare-fun m!147537 () Bool)

(assert (=> b!126513 m!147537))

(assert (=> b!126513 m!147535))

(declare-fun m!147539 () Bool)

(assert (=> b!126513 m!147539))

(declare-fun m!147541 () Bool)

(assert (=> b!126513 m!147541))

(declare-fun m!147543 () Bool)

(assert (=> b!126513 m!147543))

(declare-fun m!147545 () Bool)

(assert (=> b!126513 m!147545))

(assert (=> b!126513 m!147531))

(declare-fun m!147547 () Bool)

(assert (=> b!126513 m!147547))

(declare-fun m!147549 () Bool)

(assert (=> b!126513 m!147549))

(declare-fun m!147551 () Bool)

(assert (=> b!126513 m!147551))

(declare-fun m!147553 () Bool)

(assert (=> b!126513 m!147553))

(declare-fun m!147555 () Bool)

(assert (=> b!126513 m!147555))

(declare-fun m!147557 () Bool)

(assert (=> b!126513 m!147557))

(assert (=> b!126513 m!147525))

(assert (=> b!126513 m!147539))

(assert (=> b!126513 m!147551))

(declare-fun m!147559 () Bool)

(assert (=> b!126513 m!147559))

(declare-fun m!147561 () Bool)

(assert (=> bm!13608 m!147561))

(declare-fun m!147563 () Bool)

(assert (=> bm!13602 m!147563))

(assert (=> bm!13603 m!147557))

(declare-fun m!147565 () Bool)

(assert (=> b!126503 m!147565))

(assert (=> b!126502 m!147525))

(assert (=> b!126502 m!147525))

(assert (=> b!126502 m!147527))

(assert (=> b!126499 m!147525))

(assert (=> b!126499 m!147525))

(declare-fun m!147567 () Bool)

(assert (=> b!126499 m!147567))

(declare-fun m!147569 () Bool)

(assert (=> b!126510 m!147569))

(assert (=> b!126510 m!147525))

(declare-fun m!147571 () Bool)

(assert (=> b!126510 m!147571))

(assert (=> b!126510 m!147525))

(declare-fun m!147573 () Bool)

(assert (=> b!126510 m!147573))

(assert (=> b!126510 m!147573))

(assert (=> b!126510 m!147569))

(declare-fun m!147575 () Bool)

(assert (=> b!126510 m!147575))

(declare-fun m!147577 () Bool)

(assert (=> bm!13604 m!147577))

(declare-fun m!147579 () Bool)

(assert (=> b!126516 m!147579))

(declare-fun m!147581 () Bool)

(assert (=> b!126512 m!147581))

(assert (=> d!38169 m!147517))

(assert (=> bm!13558 d!38169))

(declare-fun d!38171 () Bool)

(declare-fun get!1456 (Option!174) V!3433)

(assert (=> d!38171 (= (apply!111 lt!65225 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1456 (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5241 () Bool)

(assert (= bs!5241 d!38171))

(assert (=> bs!5241 m!147373))

(declare-fun m!147583 () Bool)

(assert (=> bs!5241 m!147583))

(assert (=> bs!5241 m!147583))

(declare-fun m!147585 () Bool)

(assert (=> bs!5241 m!147585))

(assert (=> b!126410 d!38171))

(declare-fun d!38173 () Bool)

(declare-fun c!23130 () Bool)

(assert (=> d!38173 (= c!23130 ((_ is ValueCellFull!1076) (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!82625 () V!3433)

(assert (=> d!38173 (= (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82625)))

(declare-fun b!126518 () Bool)

(assert (=> b!126518 (= e!82625 (get!1454 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126519 () Bool)

(assert (=> b!126519 (= e!82625 (get!1455 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38173 c!23130) b!126518))

(assert (= (and d!38173 (not c!23130)) b!126519))

(assert (=> b!126518 m!147419))

(assert (=> b!126518 m!147213))

(declare-fun m!147587 () Bool)

(assert (=> b!126518 m!147587))

(assert (=> b!126519 m!147419))

(assert (=> b!126519 m!147213))

(declare-fun m!147589 () Bool)

(assert (=> b!126519 m!147589))

(assert (=> b!126410 d!38173))

(declare-fun d!38175 () Bool)

(declare-fun res!61182 () Bool)

(declare-fun e!82626 () Bool)

(assert (=> d!38175 (=> (not res!61182) (not e!82626))))

(assert (=> d!38175 (= res!61182 (simpleValid!87 (_2!1274 lt!65152)))))

(assert (=> d!38175 (= (valid!520 (_2!1274 lt!65152)) e!82626)))

(declare-fun b!126520 () Bool)

(declare-fun res!61183 () Bool)

(assert (=> b!126520 (=> (not res!61183) (not e!82626))))

(assert (=> b!126520 (= res!61183 (= (arrayCountValidKeys!0 (_keys!4515 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))) (_size!579 (_2!1274 lt!65152))))))

(declare-fun b!126521 () Bool)

(declare-fun res!61184 () Bool)

(assert (=> b!126521 (=> (not res!61184) (not e!82626))))

(assert (=> b!126521 (= res!61184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4515 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152))))))

(declare-fun b!126522 () Bool)

(assert (=> b!126522 (= e!82626 (arrayNoDuplicates!0 (_keys!4515 (_2!1274 lt!65152)) #b00000000000000000000000000000000 Nil!1677))))

(assert (= (and d!38175 res!61182) b!126520))

(assert (= (and b!126520 res!61183) b!126521))

(assert (= (and b!126521 res!61184) b!126522))

(declare-fun m!147591 () Bool)

(assert (=> d!38175 m!147591))

(declare-fun m!147593 () Bool)

(assert (=> b!126520 m!147593))

(declare-fun m!147595 () Bool)

(assert (=> b!126521 m!147595))

(declare-fun m!147597 () Bool)

(assert (=> b!126522 m!147597))

(assert (=> d!38139 d!38175))

(assert (=> d!38139 d!38149))

(declare-fun d!38177 () Bool)

(declare-fun e!82629 () Bool)

(assert (=> d!38177 e!82629))

(declare-fun res!61190 () Bool)

(assert (=> d!38177 (=> (not res!61190) (not e!82629))))

(declare-fun lt!65368 () SeekEntryResult!264)

(assert (=> d!38177 (= res!61190 ((_ is Found!264) lt!65368))))

(assert (=> d!38177 (= lt!65368 (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun lt!65369 () Unit!3928)

(declare-fun choose!768 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) Int) Unit!3928)

(assert (=> d!38177 (= lt!65369 (choose!768 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38177 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38177 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)) lt!65369)))

(declare-fun b!126527 () Bool)

(declare-fun res!61189 () Bool)

(assert (=> b!126527 (=> (not res!61189) (not e!82629))))

(assert (=> b!126527 (= res!61189 (inRange!0 (index!3212 lt!65368) (mask!7038 newMap!16)))))

(declare-fun b!126528 () Bool)

(assert (=> b!126528 (= e!82629 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65368)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126528 (and (bvsge (index!3212 lt!65368) #b00000000000000000000000000000000) (bvslt (index!3212 lt!65368) (size!2480 (_keys!4515 newMap!16))))))

(assert (= (and d!38177 res!61190) b!126527))

(assert (= (and b!126527 res!61189) b!126528))

(assert (=> d!38177 m!147207))

(assert (=> d!38177 m!147355))

(assert (=> d!38177 m!147207))

(declare-fun m!147599 () Bool)

(assert (=> d!38177 m!147599))

(assert (=> d!38177 m!147517))

(declare-fun m!147601 () Bool)

(assert (=> b!126527 m!147601))

(declare-fun m!147603 () Bool)

(assert (=> b!126528 m!147603))

(assert (=> bm!13564 d!38177))

(declare-fun d!38179 () Bool)

(declare-fun res!61195 () Bool)

(declare-fun e!82634 () Bool)

(assert (=> d!38179 (=> res!61195 e!82634)))

(assert (=> d!38179 (= res!61195 (and ((_ is Cons!1674) (toList!832 lt!65054)) (= (_1!1273 (h!2276 (toList!832 lt!65054))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38179 (= (containsKey!171 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82634)))

(declare-fun b!126533 () Bool)

(declare-fun e!82635 () Bool)

(assert (=> b!126533 (= e!82634 e!82635)))

(declare-fun res!61196 () Bool)

(assert (=> b!126533 (=> (not res!61196) (not e!82635))))

(assert (=> b!126533 (= res!61196 (and (or (not ((_ is Cons!1674) (toList!832 lt!65054))) (bvsle (_1!1273 (h!2276 (toList!832 lt!65054))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))) ((_ is Cons!1674) (toList!832 lt!65054)) (bvslt (_1!1273 (h!2276 (toList!832 lt!65054))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun b!126534 () Bool)

(assert (=> b!126534 (= e!82635 (containsKey!171 (t!6017 (toList!832 lt!65054)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38179 (not res!61195)) b!126533))

(assert (= (and b!126533 res!61196) b!126534))

(assert (=> b!126534 m!147207))

(declare-fun m!147605 () Bool)

(assert (=> b!126534 m!147605))

(assert (=> d!38137 d!38179))

(declare-fun b!126551 () Bool)

(declare-fun res!61205 () Bool)

(declare-fun e!82647 () Bool)

(assert (=> b!126551 (=> (not res!61205) (not e!82647))))

(declare-fun lt!65375 () SeekEntryResult!264)

(assert (=> b!126551 (= res!61205 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3214 lt!65375)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126551 (and (bvsge (index!3214 lt!65375) #b00000000000000000000000000000000) (bvslt (index!3214 lt!65375) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun bm!13613 () Bool)

(declare-fun call!13617 () Bool)

(assert (=> bm!13613 (= call!13617 (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!126552 () Bool)

(declare-fun res!61208 () Bool)

(assert (=> b!126552 (=> (not res!61208) (not e!82647))))

(declare-fun call!13616 () Bool)

(assert (=> b!126552 (= res!61208 call!13616)))

(declare-fun e!82645 () Bool)

(assert (=> b!126552 (= e!82645 e!82647)))

(declare-fun d!38181 () Bool)

(declare-fun e!82644 () Bool)

(assert (=> d!38181 e!82644))

(declare-fun c!23136 () Bool)

(assert (=> d!38181 (= c!23136 ((_ is MissingZero!264) lt!65375))))

(assert (=> d!38181 (= lt!65375 (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun lt!65374 () Unit!3928)

(declare-fun choose!769 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) Int) Unit!3928)

(assert (=> d!38181 (= lt!65374 (choose!769 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38181 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38181 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)) lt!65374)))

(declare-fun b!126553 () Bool)

(declare-fun e!82646 () Bool)

(assert (=> b!126553 (= e!82644 e!82646)))

(declare-fun res!61206 () Bool)

(assert (=> b!126553 (= res!61206 call!13616)))

(assert (=> b!126553 (=> (not res!61206) (not e!82646))))

(declare-fun b!126554 () Bool)

(assert (=> b!126554 (= e!82644 e!82645)))

(declare-fun c!23135 () Bool)

(assert (=> b!126554 (= c!23135 ((_ is MissingVacant!264) lt!65375))))

(declare-fun b!126555 () Bool)

(assert (=> b!126555 (= e!82647 (not call!13617))))

(declare-fun bm!13614 () Bool)

(assert (=> bm!13614 (= call!13616 (inRange!0 (ite c!23136 (index!3211 lt!65375) (index!3214 lt!65375)) (mask!7038 newMap!16)))))

(declare-fun b!126556 () Bool)

(assert (=> b!126556 (= e!82645 ((_ is Undefined!264) lt!65375))))

(declare-fun b!126557 () Bool)

(assert (=> b!126557 (and (bvsge (index!3211 lt!65375) #b00000000000000000000000000000000) (bvslt (index!3211 lt!65375) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun res!61207 () Bool)

(assert (=> b!126557 (= res!61207 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3211 lt!65375)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126557 (=> (not res!61207) (not e!82646))))

(declare-fun b!126558 () Bool)

(assert (=> b!126558 (= e!82646 (not call!13617))))

(assert (= (and d!38181 c!23136) b!126553))

(assert (= (and d!38181 (not c!23136)) b!126554))

(assert (= (and b!126553 res!61206) b!126557))

(assert (= (and b!126557 res!61207) b!126558))

(assert (= (and b!126554 c!23135) b!126552))

(assert (= (and b!126554 (not c!23135)) b!126556))

(assert (= (and b!126552 res!61208) b!126551))

(assert (= (and b!126551 res!61205) b!126555))

(assert (= (or b!126553 b!126552) bm!13614))

(assert (= (or b!126558 b!126555) bm!13613))

(assert (=> bm!13613 m!147207))

(assert (=> bm!13613 m!147327))

(declare-fun m!147607 () Bool)

(assert (=> b!126551 m!147607))

(assert (=> d!38181 m!147207))

(assert (=> d!38181 m!147355))

(assert (=> d!38181 m!147207))

(declare-fun m!147609 () Bool)

(assert (=> d!38181 m!147609))

(assert (=> d!38181 m!147517))

(declare-fun m!147611 () Bool)

(assert (=> b!126557 m!147611))

(declare-fun m!147613 () Bool)

(assert (=> bm!13614 m!147613))

(assert (=> bm!13547 d!38181))

(declare-fun b!126559 () Bool)

(declare-fun e!82653 () Bool)

(declare-fun e!82660 () Bool)

(assert (=> b!126559 (= e!82653 e!82660)))

(declare-fun c!23142 () Bool)

(assert (=> b!126559 (= c!23142 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126560 () Bool)

(declare-fun e!82657 () ListLongMap!1633)

(declare-fun e!82658 () ListLongMap!1633)

(assert (=> b!126560 (= e!82657 e!82658)))

(declare-fun c!23138 () Bool)

(assert (=> b!126560 (= c!23138 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13615 () Bool)

(declare-fun c!23141 () Bool)

(declare-fun call!13623 () ListLongMap!1633)

(declare-fun call!13618 () ListLongMap!1633)

(declare-fun call!13621 () ListLongMap!1633)

(declare-fun call!13624 () ListLongMap!1633)

(assert (=> bm!13615 (= call!13623 (+!164 (ite c!23141 call!13618 (ite c!23138 call!13621 call!13624)) (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun bm!13616 () Bool)

(assert (=> bm!13616 (= call!13618 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13617 () Bool)

(declare-fun call!13622 () Bool)

(declare-fun lt!65390 () ListLongMap!1633)

(assert (=> bm!13617 (= call!13622 (contains!864 lt!65390 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126561 () Bool)

(declare-fun e!82648 () Bool)

(declare-fun e!82652 () Bool)

(assert (=> b!126561 (= e!82648 e!82652)))

(declare-fun res!61213 () Bool)

(assert (=> b!126561 (=> (not res!61213) (not e!82652))))

(assert (=> b!126561 (= res!61213 (contains!864 lt!65390 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126561 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun bm!13618 () Bool)

(assert (=> bm!13618 (= call!13624 call!13621)))

(declare-fun b!126562 () Bool)

(declare-fun e!82655 () ListLongMap!1633)

(declare-fun call!13620 () ListLongMap!1633)

(assert (=> b!126562 (= e!82655 call!13620)))

(declare-fun b!126563 () Bool)

(declare-fun res!61209 () Bool)

(assert (=> b!126563 (=> (not res!61209) (not e!82653))))

(assert (=> b!126563 (= res!61209 e!82648)))

(declare-fun res!61210 () Bool)

(assert (=> b!126563 (=> res!61210 e!82648)))

(declare-fun e!82651 () Bool)

(assert (=> b!126563 (= res!61210 (not e!82651))))

(declare-fun res!61215 () Bool)

(assert (=> b!126563 (=> (not res!61215) (not e!82651))))

(assert (=> b!126563 (= res!61215 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126564 () Bool)

(declare-fun e!82654 () Bool)

(assert (=> b!126564 (= e!82654 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126565 () Bool)

(declare-fun e!82649 () Bool)

(assert (=> b!126565 (= e!82649 (= (apply!111 lt!65390 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!126566 () Bool)

(declare-fun res!61216 () Bool)

(assert (=> b!126566 (=> (not res!61216) (not e!82653))))

(declare-fun e!82650 () Bool)

(assert (=> b!126566 (= res!61216 e!82650)))

(declare-fun c!23137 () Bool)

(assert (=> b!126566 (= c!23137 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13619 () Bool)

(assert (=> bm!13619 (= call!13620 call!13623)))

(declare-fun b!126567 () Bool)

(assert (=> b!126567 (= e!82658 call!13620)))

(declare-fun b!126568 () Bool)

(assert (=> b!126568 (= e!82655 call!13624)))

(declare-fun bm!13620 () Bool)

(assert (=> bm!13620 (= call!13621 call!13618)))

(declare-fun b!126569 () Bool)

(assert (=> b!126569 (= e!82660 e!82649)))

(declare-fun res!61212 () Bool)

(assert (=> b!126569 (= res!61212 call!13622)))

(assert (=> b!126569 (=> (not res!61212) (not e!82649))))

(declare-fun b!126570 () Bool)

(declare-fun c!23140 () Bool)

(assert (=> b!126570 (= c!23140 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126570 (= e!82658 e!82655)))

(declare-fun b!126571 () Bool)

(assert (=> b!126571 (= e!82660 (not call!13622))))

(declare-fun b!126572 () Bool)

(assert (=> b!126572 (= e!82652 (= (apply!111 lt!65390 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126572 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (_values!2765 newMap!16))))))

(assert (=> b!126572 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126573 () Bool)

(declare-fun call!13619 () Bool)

(assert (=> b!126573 (= e!82650 (not call!13619))))

(declare-fun bm!13621 () Bool)

(assert (=> bm!13621 (= call!13619 (contains!864 lt!65390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126574 () Bool)

(declare-fun e!82659 () Bool)

(assert (=> b!126574 (= e!82659 (= (apply!111 lt!65390 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!126575 () Bool)

(declare-fun e!82656 () Unit!3928)

(declare-fun lt!65393 () Unit!3928)

(assert (=> b!126575 (= e!82656 lt!65393)))

(declare-fun lt!65378 () ListLongMap!1633)

(assert (=> b!126575 (= lt!65378 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65397 () (_ BitVec 64))

(assert (=> b!126575 (= lt!65397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65395 () (_ BitVec 64))

(assert (=> b!126575 (= lt!65395 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65380 () Unit!3928)

(assert (=> b!126575 (= lt!65380 (addStillContains!87 lt!65378 lt!65397 (zeroValue!2645 newMap!16) lt!65395))))

(assert (=> b!126575 (contains!864 (+!164 lt!65378 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16))) lt!65395)))

(declare-fun lt!65384 () Unit!3928)

(assert (=> b!126575 (= lt!65384 lt!65380)))

(declare-fun lt!65388 () ListLongMap!1633)

(assert (=> b!126575 (= lt!65388 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65381 () (_ BitVec 64))

(assert (=> b!126575 (= lt!65381 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65391 () (_ BitVec 64))

(assert (=> b!126575 (= lt!65391 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65386 () Unit!3928)

(assert (=> b!126575 (= lt!65386 (addApplyDifferent!87 lt!65388 lt!65381 (minValue!2645 newMap!16) lt!65391))))

(assert (=> b!126575 (= (apply!111 (+!164 lt!65388 (tuple2!2525 lt!65381 (minValue!2645 newMap!16))) lt!65391) (apply!111 lt!65388 lt!65391))))

(declare-fun lt!65396 () Unit!3928)

(assert (=> b!126575 (= lt!65396 lt!65386)))

(declare-fun lt!65379 () ListLongMap!1633)

(assert (=> b!126575 (= lt!65379 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65387 () (_ BitVec 64))

(assert (=> b!126575 (= lt!65387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65377 () (_ BitVec 64))

(assert (=> b!126575 (= lt!65377 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65376 () Unit!3928)

(assert (=> b!126575 (= lt!65376 (addApplyDifferent!87 lt!65379 lt!65387 (zeroValue!2645 newMap!16) lt!65377))))

(assert (=> b!126575 (= (apply!111 (+!164 lt!65379 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16))) lt!65377) (apply!111 lt!65379 lt!65377))))

(declare-fun lt!65385 () Unit!3928)

(assert (=> b!126575 (= lt!65385 lt!65376)))

(declare-fun lt!65392 () ListLongMap!1633)

(assert (=> b!126575 (= lt!65392 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65383 () (_ BitVec 64))

(assert (=> b!126575 (= lt!65383 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65389 () (_ BitVec 64))

(assert (=> b!126575 (= lt!65389 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126575 (= lt!65393 (addApplyDifferent!87 lt!65392 lt!65383 (minValue!2645 newMap!16) lt!65389))))

(assert (=> b!126575 (= (apply!111 (+!164 lt!65392 (tuple2!2525 lt!65383 (minValue!2645 newMap!16))) lt!65389) (apply!111 lt!65392 lt!65389))))

(declare-fun b!126576 () Bool)

(declare-fun Unit!3939 () Unit!3928)

(assert (=> b!126576 (= e!82656 Unit!3939)))

(declare-fun d!38183 () Bool)

(assert (=> d!38183 e!82653))

(declare-fun res!61217 () Bool)

(assert (=> d!38183 (=> (not res!61217) (not e!82653))))

(assert (=> d!38183 (= res!61217 (or (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun lt!65382 () ListLongMap!1633)

(assert (=> d!38183 (= lt!65390 lt!65382)))

(declare-fun lt!65394 () Unit!3928)

(assert (=> d!38183 (= lt!65394 e!82656)))

(declare-fun c!23139 () Bool)

(assert (=> d!38183 (= c!23139 e!82654)))

(declare-fun res!61214 () Bool)

(assert (=> d!38183 (=> (not res!61214) (not e!82654))))

(assert (=> d!38183 (= res!61214 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38183 (= lt!65382 e!82657)))

(assert (=> d!38183 (= c!23141 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38183 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38183 (= (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65390)))

(declare-fun b!126577 () Bool)

(assert (=> b!126577 (= e!82651 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126578 () Bool)

(assert (=> b!126578 (= e!82657 (+!164 call!13623 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun b!126579 () Bool)

(assert (=> b!126579 (= e!82650 e!82659)))

(declare-fun res!61211 () Bool)

(assert (=> b!126579 (= res!61211 call!13619)))

(assert (=> b!126579 (=> (not res!61211) (not e!82659))))

(assert (= (and d!38183 c!23141) b!126578))

(assert (= (and d!38183 (not c!23141)) b!126560))

(assert (= (and b!126560 c!23138) b!126567))

(assert (= (and b!126560 (not c!23138)) b!126570))

(assert (= (and b!126570 c!23140) b!126562))

(assert (= (and b!126570 (not c!23140)) b!126568))

(assert (= (or b!126562 b!126568) bm!13618))

(assert (= (or b!126567 bm!13618) bm!13620))

(assert (= (or b!126567 b!126562) bm!13619))

(assert (= (or b!126578 bm!13620) bm!13616))

(assert (= (or b!126578 bm!13619) bm!13615))

(assert (= (and d!38183 res!61214) b!126564))

(assert (= (and d!38183 c!23139) b!126575))

(assert (= (and d!38183 (not c!23139)) b!126576))

(assert (= (and d!38183 res!61217) b!126563))

(assert (= (and b!126563 res!61215) b!126577))

(assert (= (and b!126563 (not res!61210)) b!126561))

(assert (= (and b!126561 res!61213) b!126572))

(assert (= (and b!126563 res!61209) b!126566))

(assert (= (and b!126566 c!23137) b!126579))

(assert (= (and b!126566 (not c!23137)) b!126573))

(assert (= (and b!126579 res!61211) b!126574))

(assert (= (or b!126579 b!126573) bm!13621))

(assert (= (and b!126566 res!61216) b!126559))

(assert (= (and b!126559 c!23142) b!126569))

(assert (= (and b!126559 (not c!23142)) b!126571))

(assert (= (and b!126569 res!61212) b!126565))

(assert (= (or b!126569 b!126571) bm!13617))

(declare-fun b_lambda!5579 () Bool)

(assert (=> (not b_lambda!5579) (not b!126572)))

(assert (=> b!126572 t!6029))

(declare-fun b_and!7789 () Bool)

(assert (= b_and!7785 (and (=> t!6029 result!3843) b_and!7789)))

(assert (=> b!126572 t!6031))

(declare-fun b_and!7791 () Bool)

(assert (= b_and!7787 (and (=> t!6031 result!3845) b_and!7791)))

(assert (=> b!126577 m!147525))

(assert (=> b!126577 m!147525))

(assert (=> b!126577 m!147527))

(declare-fun m!147615 () Bool)

(assert (=> b!126575 m!147615))

(declare-fun m!147617 () Bool)

(assert (=> b!126575 m!147617))

(declare-fun m!147619 () Bool)

(assert (=> b!126575 m!147619))

(declare-fun m!147621 () Bool)

(assert (=> b!126575 m!147621))

(declare-fun m!147623 () Bool)

(assert (=> b!126575 m!147623))

(assert (=> b!126575 m!147621))

(declare-fun m!147625 () Bool)

(assert (=> b!126575 m!147625))

(declare-fun m!147627 () Bool)

(assert (=> b!126575 m!147627))

(declare-fun m!147629 () Bool)

(assert (=> b!126575 m!147629))

(declare-fun m!147631 () Bool)

(assert (=> b!126575 m!147631))

(assert (=> b!126575 m!147617))

(declare-fun m!147633 () Bool)

(assert (=> b!126575 m!147633))

(declare-fun m!147635 () Bool)

(assert (=> b!126575 m!147635))

(declare-fun m!147637 () Bool)

(assert (=> b!126575 m!147637))

(declare-fun m!147639 () Bool)

(assert (=> b!126575 m!147639))

(declare-fun m!147641 () Bool)

(assert (=> b!126575 m!147641))

(declare-fun m!147643 () Bool)

(assert (=> b!126575 m!147643))

(assert (=> b!126575 m!147525))

(assert (=> b!126575 m!147625))

(assert (=> b!126575 m!147637))

(declare-fun m!147645 () Bool)

(assert (=> b!126575 m!147645))

(declare-fun m!147647 () Bool)

(assert (=> bm!13621 m!147647))

(declare-fun m!147649 () Bool)

(assert (=> bm!13615 m!147649))

(assert (=> bm!13616 m!147643))

(declare-fun m!147651 () Bool)

(assert (=> b!126565 m!147651))

(assert (=> b!126564 m!147525))

(assert (=> b!126564 m!147525))

(assert (=> b!126564 m!147527))

(assert (=> b!126561 m!147525))

(assert (=> b!126561 m!147525))

(declare-fun m!147653 () Bool)

(assert (=> b!126561 m!147653))

(assert (=> b!126572 m!147569))

(assert (=> b!126572 m!147525))

(declare-fun m!147655 () Bool)

(assert (=> b!126572 m!147655))

(assert (=> b!126572 m!147525))

(declare-fun m!147657 () Bool)

(assert (=> b!126572 m!147657))

(assert (=> b!126572 m!147657))

(assert (=> b!126572 m!147569))

(declare-fun m!147659 () Bool)

(assert (=> b!126572 m!147659))

(declare-fun m!147661 () Bool)

(assert (=> bm!13617 m!147661))

(declare-fun m!147663 () Bool)

(assert (=> b!126578 m!147663))

(declare-fun m!147665 () Bool)

(assert (=> b!126574 m!147665))

(assert (=> d!38183 m!147517))

(assert (=> d!38145 d!38183))

(declare-fun d!38185 () Bool)

(assert (=> d!38185 (= (map!1380 (_2!1274 lt!65152)) (getCurrentListMap!512 (_keys!4515 (_2!1274 lt!65152)) (_values!2765 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152)) (extraKeys!2563 (_2!1274 lt!65152)) (zeroValue!2645 (_2!1274 lt!65152)) (minValue!2645 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1274 lt!65152))))))

(declare-fun bs!5242 () Bool)

(assert (= bs!5242 d!38185))

(declare-fun m!147667 () Bool)

(assert (=> bs!5242 m!147667))

(assert (=> bm!13568 d!38185))

(assert (=> bm!13545 d!38145))

(declare-fun d!38187 () Bool)

(declare-fun e!82662 () Bool)

(assert (=> d!38187 e!82662))

(declare-fun res!61218 () Bool)

(assert (=> d!38187 (=> res!61218 e!82662)))

(declare-fun lt!65399 () Bool)

(assert (=> d!38187 (= res!61218 (not lt!65399))))

(declare-fun lt!65398 () Bool)

(assert (=> d!38187 (= lt!65399 lt!65398)))

(declare-fun lt!65401 () Unit!3928)

(declare-fun e!82661 () Unit!3928)

(assert (=> d!38187 (= lt!65401 e!82661)))

(declare-fun c!23143 () Bool)

(assert (=> d!38187 (= c!23143 lt!65398)))

(assert (=> d!38187 (= lt!65398 (containsKey!171 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38187 (= (contains!864 call!13566 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65399)))

(declare-fun b!126580 () Bool)

(declare-fun lt!65400 () Unit!3928)

(assert (=> b!126580 (= e!82661 lt!65400)))

(assert (=> b!126580 (= lt!65400 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126580 (isDefined!120 (getValueByKey!168 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126581 () Bool)

(declare-fun Unit!3940 () Unit!3928)

(assert (=> b!126581 (= e!82661 Unit!3940)))

(declare-fun b!126582 () Bool)

(assert (=> b!126582 (= e!82662 (isDefined!120 (getValueByKey!168 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (= (and d!38187 c!23143) b!126580))

(assert (= (and d!38187 (not c!23143)) b!126581))

(assert (= (and d!38187 (not res!61218)) b!126582))

(assert (=> d!38187 m!147207))

(declare-fun m!147669 () Bool)

(assert (=> d!38187 m!147669))

(assert (=> b!126580 m!147207))

(declare-fun m!147671 () Bool)

(assert (=> b!126580 m!147671))

(assert (=> b!126580 m!147207))

(declare-fun m!147673 () Bool)

(assert (=> b!126580 m!147673))

(assert (=> b!126580 m!147673))

(declare-fun m!147675 () Bool)

(assert (=> b!126580 m!147675))

(assert (=> b!126582 m!147207))

(assert (=> b!126582 m!147673))

(assert (=> b!126582 m!147673))

(assert (=> b!126582 m!147675))

(assert (=> b!126332 d!38187))

(declare-fun b!126595 () Bool)

(declare-fun e!82670 () SeekEntryResult!264)

(declare-fun lt!65408 () SeekEntryResult!264)

(assert (=> b!126595 (= e!82670 (MissingZero!264 (index!3213 lt!65408)))))

(declare-fun b!126596 () Bool)

(declare-fun e!82671 () SeekEntryResult!264)

(assert (=> b!126596 (= e!82671 Undefined!264)))

(declare-fun b!126597 () Bool)

(declare-fun e!82669 () SeekEntryResult!264)

(assert (=> b!126597 (= e!82669 (Found!264 (index!3213 lt!65408)))))

(declare-fun b!126598 () Bool)

(declare-fun c!23150 () Bool)

(declare-fun lt!65409 () (_ BitVec 64))

(assert (=> b!126598 (= c!23150 (= lt!65409 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126598 (= e!82669 e!82670)))

(declare-fun b!126599 () Bool)

(assert (=> b!126599 (= e!82671 e!82669)))

(assert (=> b!126599 (= lt!65409 (select (arr!2216 (_keys!4515 newMap!16)) (index!3213 lt!65408)))))

(declare-fun c!23151 () Bool)

(assert (=> b!126599 (= c!23151 (= lt!65409 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126600 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4681 (_ BitVec 32)) SeekEntryResult!264)

(assert (=> b!126600 (= e!82670 (seekKeyOrZeroReturnVacant!0 (x!14957 lt!65408) (index!3213 lt!65408) (index!3213 lt!65408) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun lt!65410 () SeekEntryResult!264)

(declare-fun d!38189 () Bool)

(assert (=> d!38189 (and (or ((_ is Undefined!264) lt!65410) (not ((_ is Found!264) lt!65410)) (and (bvsge (index!3212 lt!65410) #b00000000000000000000000000000000) (bvslt (index!3212 lt!65410) (size!2480 (_keys!4515 newMap!16))))) (or ((_ is Undefined!264) lt!65410) ((_ is Found!264) lt!65410) (not ((_ is MissingZero!264) lt!65410)) (and (bvsge (index!3211 lt!65410) #b00000000000000000000000000000000) (bvslt (index!3211 lt!65410) (size!2480 (_keys!4515 newMap!16))))) (or ((_ is Undefined!264) lt!65410) ((_ is Found!264) lt!65410) ((_ is MissingZero!264) lt!65410) (not ((_ is MissingVacant!264) lt!65410)) (and (bvsge (index!3214 lt!65410) #b00000000000000000000000000000000) (bvslt (index!3214 lt!65410) (size!2480 (_keys!4515 newMap!16))))) (or ((_ is Undefined!264) lt!65410) (ite ((_ is Found!264) lt!65410) (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65410)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite ((_ is MissingZero!264) lt!65410) (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3211 lt!65410)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!264) lt!65410) (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3214 lt!65410)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38189 (= lt!65410 e!82671)))

(declare-fun c!23152 () Bool)

(assert (=> d!38189 (= c!23152 (and ((_ is Intermediate!264) lt!65408) (undefined!1076 lt!65408)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4681 (_ BitVec 32)) SeekEntryResult!264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!38189 (= lt!65408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7038 newMap!16)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(assert (=> d!38189 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38189 (= (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)) lt!65410)))

(assert (= (and d!38189 c!23152) b!126596))

(assert (= (and d!38189 (not c!23152)) b!126599))

(assert (= (and b!126599 c!23151) b!126597))

(assert (= (and b!126599 (not c!23151)) b!126598))

(assert (= (and b!126598 c!23150) b!126595))

(assert (= (and b!126598 (not c!23150)) b!126600))

(declare-fun m!147677 () Bool)

(assert (=> b!126599 m!147677))

(assert (=> b!126600 m!147207))

(declare-fun m!147679 () Bool)

(assert (=> b!126600 m!147679))

(declare-fun m!147681 () Bool)

(assert (=> d!38189 m!147681))

(declare-fun m!147683 () Bool)

(assert (=> d!38189 m!147683))

(assert (=> d!38189 m!147207))

(declare-fun m!147685 () Bool)

(assert (=> d!38189 m!147685))

(declare-fun m!147687 () Bool)

(assert (=> d!38189 m!147687))

(declare-fun m!147689 () Bool)

(assert (=> d!38189 m!147689))

(assert (=> d!38189 m!147207))

(assert (=> d!38189 m!147683))

(assert (=> d!38189 m!147517))

(assert (=> bm!13546 d!38189))

(declare-fun d!38191 () Bool)

(declare-fun e!82672 () Bool)

(assert (=> d!38191 e!82672))

(declare-fun res!61220 () Bool)

(assert (=> d!38191 (=> (not res!61220) (not e!82672))))

(declare-fun lt!65411 () ListLongMap!1633)

(assert (=> d!38191 (= res!61220 (contains!864 lt!65411 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65412 () List!1678)

(assert (=> d!38191 (= lt!65411 (ListLongMap!1634 lt!65412))))

(declare-fun lt!65414 () Unit!3928)

(declare-fun lt!65413 () Unit!3928)

(assert (=> d!38191 (= lt!65414 lt!65413)))

(assert (=> d!38191 (= (getValueByKey!168 lt!65412 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38191 (= lt!65413 (lemmaContainsTupThenGetReturnValue!83 lt!65412 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38191 (= lt!65412 (insertStrictlySorted!86 (toList!832 call!13561) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38191 (= (+!164 call!13561 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65411)))

(declare-fun b!126601 () Bool)

(declare-fun res!61219 () Bool)

(assert (=> b!126601 (=> (not res!61219) (not e!82672))))

(assert (=> b!126601 (= res!61219 (= (getValueByKey!168 (toList!832 lt!65411) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126602 () Bool)

(assert (=> b!126602 (= e!82672 (contains!866 (toList!832 lt!65411) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38191 res!61220) b!126601))

(assert (= (and b!126601 res!61219) b!126602))

(declare-fun m!147691 () Bool)

(assert (=> d!38191 m!147691))

(declare-fun m!147693 () Bool)

(assert (=> d!38191 m!147693))

(declare-fun m!147695 () Bool)

(assert (=> d!38191 m!147695))

(declare-fun m!147697 () Bool)

(assert (=> d!38191 m!147697))

(declare-fun m!147699 () Bool)

(assert (=> b!126601 m!147699))

(declare-fun m!147701 () Bool)

(assert (=> b!126602 m!147701))

(assert (=> b!126333 d!38191))

(declare-fun d!38193 () Bool)

(assert (=> d!38193 (= (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126402 d!38193))

(declare-fun d!38195 () Bool)

(assert (=> d!38195 (= (apply!111 lt!65225 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5243 () Bool)

(assert (= bs!5243 d!38195))

(declare-fun m!147703 () Bool)

(assert (=> bs!5243 m!147703))

(assert (=> bs!5243 m!147703))

(declare-fun m!147705 () Bool)

(assert (=> bs!5243 m!147705))

(assert (=> b!126403 d!38195))

(declare-fun d!38197 () Bool)

(declare-fun lt!65417 () (_ BitVec 32))

(assert (=> d!38197 (and (bvsge lt!65417 #b00000000000000000000000000000000) (bvsle lt!65417 (bvsub (size!2480 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!82678 () (_ BitVec 32))

(assert (=> d!38197 (= lt!65417 e!82678)))

(declare-fun c!23158 () Bool)

(assert (=> d!38197 (= c!23158 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38197 (and (bvsle #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2480 (_keys!4515 newMap!16)) (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38197 (= (arrayCountValidKeys!0 (_keys!4515 newMap!16) #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) lt!65417)))

(declare-fun b!126611 () Bool)

(declare-fun e!82677 () (_ BitVec 32))

(declare-fun call!13627 () (_ BitVec 32))

(assert (=> b!126611 (= e!82677 (bvadd #b00000000000000000000000000000001 call!13627))))

(declare-fun bm!13624 () Bool)

(assert (=> bm!13624 (= call!13627 (arrayCountValidKeys!0 (_keys!4515 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126612 () Bool)

(assert (=> b!126612 (= e!82677 call!13627)))

(declare-fun b!126613 () Bool)

(assert (=> b!126613 (= e!82678 #b00000000000000000000000000000000)))

(declare-fun b!126614 () Bool)

(assert (=> b!126614 (= e!82678 e!82677)))

(declare-fun c!23157 () Bool)

(assert (=> b!126614 (= c!23157 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38197 c!23158) b!126613))

(assert (= (and d!38197 (not c!23158)) b!126614))

(assert (= (and b!126614 c!23157) b!126611))

(assert (= (and b!126614 (not c!23157)) b!126612))

(assert (= (or b!126611 b!126612) bm!13624))

(declare-fun m!147707 () Bool)

(assert (=> bm!13624 m!147707))

(assert (=> b!126614 m!147525))

(assert (=> b!126614 m!147525))

(assert (=> b!126614 m!147527))

(assert (=> b!126424 d!38197))

(declare-fun d!38199 () Bool)

(declare-fun res!61225 () Bool)

(declare-fun e!82683 () Bool)

(assert (=> d!38199 (=> res!61225 e!82683)))

(assert (=> d!38199 (= res!61225 (= (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38199 (= (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000) e!82683)))

(declare-fun b!126619 () Bool)

(declare-fun e!82684 () Bool)

(assert (=> b!126619 (= e!82683 e!82684)))

(declare-fun res!61226 () Bool)

(assert (=> b!126619 (=> (not res!61226) (not e!82684))))

(assert (=> b!126619 (= res!61226 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126620 () Bool)

(assert (=> b!126620 (= e!82684 (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38199 (not res!61225)) b!126619))

(assert (= (and b!126619 res!61226) b!126620))

(assert (=> d!38199 m!147525))

(assert (=> b!126620 m!147207))

(declare-fun m!147709 () Bool)

(assert (=> b!126620 m!147709))

(assert (=> bm!13552 d!38199))

(assert (=> b!126316 d!38183))

(declare-fun d!38201 () Bool)

(declare-fun res!61227 () Bool)

(declare-fun e!82685 () Bool)

(assert (=> d!38201 (=> (not res!61227) (not e!82685))))

(assert (=> d!38201 (= res!61227 (simpleValid!87 (v!3124 (underlying!439 thiss!992))))))

(assert (=> d!38201 (= (valid!520 (v!3124 (underlying!439 thiss!992))) e!82685)))

(declare-fun b!126621 () Bool)

(declare-fun res!61228 () Bool)

(assert (=> b!126621 (=> (not res!61228) (not e!82685))))

(assert (=> b!126621 (= res!61228 (= (arrayCountValidKeys!0 (_keys!4515 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000 (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))) (_size!579 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126622 () Bool)

(declare-fun res!61229 () Bool)

(assert (=> b!126622 (=> (not res!61229) (not e!82685))))

(assert (=> b!126622 (= res!61229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126623 () Bool)

(assert (=> b!126623 (= e!82685 (arrayNoDuplicates!0 (_keys!4515 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000 Nil!1677))))

(assert (= (and d!38201 res!61227) b!126621))

(assert (= (and b!126621 res!61228) b!126622))

(assert (= (and b!126622 res!61229) b!126623))

(declare-fun m!147711 () Bool)

(assert (=> d!38201 m!147711))

(declare-fun m!147713 () Bool)

(assert (=> b!126621 m!147713))

(declare-fun m!147715 () Bool)

(assert (=> b!126622 m!147715))

(declare-fun m!147717 () Bool)

(assert (=> b!126623 m!147717))

(assert (=> d!38135 d!38201))

(declare-fun d!38203 () Bool)

(assert (=> d!38203 (isDefined!120 (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65420 () Unit!3928)

(declare-fun choose!770 (List!1678 (_ BitVec 64)) Unit!3928)

(assert (=> d!38203 (= lt!65420 (choose!770 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!82688 () Bool)

(assert (=> d!38203 e!82688))

(declare-fun res!61232 () Bool)

(assert (=> d!38203 (=> (not res!61232) (not e!82688))))

(declare-fun isStrictlySorted!304 (List!1678) Bool)

(assert (=> d!38203 (= res!61232 (isStrictlySorted!304 (toList!832 lt!65054)))))

(assert (=> d!38203 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65420)))

(declare-fun b!126626 () Bool)

(assert (=> b!126626 (= e!82688 (containsKey!171 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38203 res!61232) b!126626))

(assert (=> d!38203 m!147207))

(assert (=> d!38203 m!147309))

(assert (=> d!38203 m!147309))

(assert (=> d!38203 m!147311))

(assert (=> d!38203 m!147207))

(declare-fun m!147719 () Bool)

(assert (=> d!38203 m!147719))

(declare-fun m!147721 () Bool)

(assert (=> d!38203 m!147721))

(assert (=> b!126626 m!147207))

(assert (=> b!126626 m!147305))

(assert (=> b!126220 d!38203))

(declare-fun d!38205 () Bool)

(declare-fun isEmpty!402 (Option!174) Bool)

(assert (=> d!38205 (= (isDefined!120 (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))) (not (isEmpty!402 (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun bs!5244 () Bool)

(assert (= bs!5244 d!38205))

(assert (=> bs!5244 m!147309))

(declare-fun m!147723 () Bool)

(assert (=> bs!5244 m!147723))

(assert (=> b!126220 d!38205))

(declare-fun b!126638 () Bool)

(declare-fun e!82694 () Option!174)

(assert (=> b!126638 (= e!82694 None!172)))

(declare-fun b!126635 () Bool)

(declare-fun e!82693 () Option!174)

(assert (=> b!126635 (= e!82693 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65054)))))))

(declare-fun b!126637 () Bool)

(assert (=> b!126637 (= e!82694 (getValueByKey!168 (t!6017 (toList!832 lt!65054)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun d!38207 () Bool)

(declare-fun c!23163 () Bool)

(assert (=> d!38207 (= c!23163 (and ((_ is Cons!1674) (toList!832 lt!65054)) (= (_1!1273 (h!2276 (toList!832 lt!65054))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38207 (= (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82693)))

(declare-fun b!126636 () Bool)

(assert (=> b!126636 (= e!82693 e!82694)))

(declare-fun c!23164 () Bool)

(assert (=> b!126636 (= c!23164 (and ((_ is Cons!1674) (toList!832 lt!65054)) (not (= (_1!1273 (h!2276 (toList!832 lt!65054))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(assert (= (and d!38207 c!23163) b!126635))

(assert (= (and d!38207 (not c!23163)) b!126636))

(assert (= (and b!126636 c!23164) b!126637))

(assert (= (and b!126636 (not c!23164)) b!126638))

(assert (=> b!126637 m!147207))

(declare-fun m!147725 () Bool)

(assert (=> b!126637 m!147725))

(assert (=> b!126220 d!38207))

(assert (=> b!126222 d!38205))

(assert (=> b!126222 d!38207))

(declare-fun b!126647 () Bool)

(declare-fun e!82702 () Bool)

(declare-fun e!82701 () Bool)

(assert (=> b!126647 (= e!82702 e!82701)))

(declare-fun lt!65429 () (_ BitVec 64))

(assert (=> b!126647 (= lt!65429 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65428 () Unit!3928)

(assert (=> b!126647 (= lt!65428 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4515 newMap!16) lt!65429 #b00000000000000000000000000000000))))

(assert (=> b!126647 (arrayContainsKey!0 (_keys!4515 newMap!16) lt!65429 #b00000000000000000000000000000000)))

(declare-fun lt!65427 () Unit!3928)

(assert (=> b!126647 (= lt!65427 lt!65428)))

(declare-fun res!61238 () Bool)

(assert (=> b!126647 (= res!61238 (= (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (_keys!4515 newMap!16) (mask!7038 newMap!16)) (Found!264 #b00000000000000000000000000000000)))))

(assert (=> b!126647 (=> (not res!61238) (not e!82701))))

(declare-fun bm!13627 () Bool)

(declare-fun call!13630 () Bool)

(assert (=> bm!13627 (= call!13630 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun b!126648 () Bool)

(assert (=> b!126648 (= e!82701 call!13630)))

(declare-fun b!126649 () Bool)

(declare-fun e!82703 () Bool)

(assert (=> b!126649 (= e!82703 e!82702)))

(declare-fun c!23167 () Bool)

(assert (=> b!126649 (= c!23167 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38209 () Bool)

(declare-fun res!61237 () Bool)

(assert (=> d!38209 (=> res!61237 e!82703)))

(assert (=> d!38209 (= res!61237 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38209 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4515 newMap!16) (mask!7038 newMap!16)) e!82703)))

(declare-fun b!126650 () Bool)

(assert (=> b!126650 (= e!82702 call!13630)))

(assert (= (and d!38209 (not res!61237)) b!126649))

(assert (= (and b!126649 c!23167) b!126647))

(assert (= (and b!126649 (not c!23167)) b!126650))

(assert (= (and b!126647 res!61238) b!126648))

(assert (= (or b!126648 b!126650) bm!13627))

(assert (=> b!126647 m!147525))

(declare-fun m!147727 () Bool)

(assert (=> b!126647 m!147727))

(declare-fun m!147729 () Bool)

(assert (=> b!126647 m!147729))

(assert (=> b!126647 m!147525))

(declare-fun m!147731 () Bool)

(assert (=> b!126647 m!147731))

(declare-fun m!147733 () Bool)

(assert (=> bm!13627 m!147733))

(assert (=> b!126649 m!147525))

(assert (=> b!126649 m!147525))

(assert (=> b!126649 m!147527))

(assert (=> b!126425 d!38209))

(declare-fun d!38211 () Bool)

(assert (=> d!38211 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65143 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65432 () Unit!3928)

(declare-fun choose!771 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 V!3433 Int) Unit!3928)

(assert (=> d!38211 (= lt!65432 (choose!771 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) lt!65143 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38211 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38211 (= (lemmaChangeZeroKeyThenAddPairToListMap!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) lt!65143 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (defaultEntry!2782 newMap!16)) lt!65432)))

(declare-fun bs!5245 () Bool)

(assert (= bs!5245 d!38211))

(assert (=> bs!5245 m!147325))

(assert (=> bs!5245 m!147215))

(declare-fun m!147735 () Bool)

(assert (=> bs!5245 m!147735))

(assert (=> bs!5245 m!147215))

(declare-fun m!147737 () Bool)

(assert (=> bs!5245 m!147737))

(assert (=> bs!5245 m!147325))

(declare-fun m!147739 () Bool)

(assert (=> bs!5245 m!147739))

(assert (=> bs!5245 m!147517))

(assert (=> b!126345 d!38211))

(declare-fun b!126661 () Bool)

(declare-fun e!82715 () Bool)

(declare-fun call!13633 () Bool)

(assert (=> b!126661 (= e!82715 call!13633)))

(declare-fun b!126662 () Bool)

(assert (=> b!126662 (= e!82715 call!13633)))

(declare-fun b!126663 () Bool)

(declare-fun e!82713 () Bool)

(assert (=> b!126663 (= e!82713 e!82715)))

(declare-fun c!23170 () Bool)

(assert (=> b!126663 (= c!23170 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126664 () Bool)

(declare-fun e!82714 () Bool)

(assert (=> b!126664 (= e!82714 e!82713)))

(declare-fun res!61246 () Bool)

(assert (=> b!126664 (=> (not res!61246) (not e!82713))))

(declare-fun e!82712 () Bool)

(assert (=> b!126664 (= res!61246 (not e!82712))))

(declare-fun res!61245 () Bool)

(assert (=> b!126664 (=> (not res!61245) (not e!82712))))

(assert (=> b!126664 (= res!61245 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126665 () Bool)

(declare-fun contains!867 (List!1680 (_ BitVec 64)) Bool)

(assert (=> b!126665 (= e!82712 (contains!867 Nil!1677 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13630 () Bool)

(assert (=> bm!13630 (= call!13633 (arrayNoDuplicates!0 (_keys!4515 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23170 (Cons!1676 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) Nil!1677) Nil!1677)))))

(declare-fun d!38213 () Bool)

(declare-fun res!61247 () Bool)

(assert (=> d!38213 (=> res!61247 e!82714)))

(assert (=> d!38213 (= res!61247 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38213 (= (arrayNoDuplicates!0 (_keys!4515 newMap!16) #b00000000000000000000000000000000 Nil!1677) e!82714)))

(assert (= (and d!38213 (not res!61247)) b!126664))

(assert (= (and b!126664 res!61245) b!126665))

(assert (= (and b!126664 res!61246) b!126663))

(assert (= (and b!126663 c!23170) b!126661))

(assert (= (and b!126663 (not c!23170)) b!126662))

(assert (= (or b!126661 b!126662) bm!13630))

(assert (=> b!126663 m!147525))

(assert (=> b!126663 m!147525))

(assert (=> b!126663 m!147527))

(assert (=> b!126664 m!147525))

(assert (=> b!126664 m!147525))

(assert (=> b!126664 m!147527))

(assert (=> b!126665 m!147525))

(assert (=> b!126665 m!147525))

(declare-fun m!147741 () Bool)

(assert (=> b!126665 m!147741))

(assert (=> bm!13630 m!147525))

(declare-fun m!147743 () Bool)

(assert (=> bm!13630 m!147743))

(assert (=> b!126426 d!38213))

(declare-fun d!38215 () Bool)

(declare-fun e!82717 () Bool)

(assert (=> d!38215 e!82717))

(declare-fun res!61248 () Bool)

(assert (=> d!38215 (=> res!61248 e!82717)))

(declare-fun lt!65434 () Bool)

(assert (=> d!38215 (= res!61248 (not lt!65434))))

(declare-fun lt!65433 () Bool)

(assert (=> d!38215 (= lt!65434 lt!65433)))

(declare-fun lt!65436 () Unit!3928)

(declare-fun e!82716 () Unit!3928)

(assert (=> d!38215 (= lt!65436 e!82716)))

(declare-fun c!23171 () Bool)

(assert (=> d!38215 (= c!23171 lt!65433)))

(assert (=> d!38215 (= lt!65433 (containsKey!171 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38215 (= (contains!864 lt!65225 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65434)))

(declare-fun b!126666 () Bool)

(declare-fun lt!65435 () Unit!3928)

(assert (=> b!126666 (= e!82716 lt!65435)))

(assert (=> b!126666 (= lt!65435 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126666 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126667 () Bool)

(declare-fun Unit!3941 () Unit!3928)

(assert (=> b!126667 (= e!82716 Unit!3941)))

(declare-fun b!126668 () Bool)

(assert (=> b!126668 (= e!82717 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38215 c!23171) b!126666))

(assert (= (and d!38215 (not c!23171)) b!126667))

(assert (= (and d!38215 (not res!61248)) b!126668))

(declare-fun m!147745 () Bool)

(assert (=> d!38215 m!147745))

(declare-fun m!147747 () Bool)

(assert (=> b!126666 m!147747))

(assert (=> b!126666 m!147703))

(assert (=> b!126666 m!147703))

(declare-fun m!147749 () Bool)

(assert (=> b!126666 m!147749))

(assert (=> b!126668 m!147703))

(assert (=> b!126668 m!147703))

(assert (=> b!126668 m!147749))

(assert (=> bm!13585 d!38215))

(assert (=> b!126415 d!38193))

(declare-fun d!38217 () Bool)

(declare-fun e!82718 () Bool)

(assert (=> d!38217 e!82718))

(declare-fun res!61250 () Bool)

(assert (=> d!38217 (=> (not res!61250) (not e!82718))))

(declare-fun lt!65437 () ListLongMap!1633)

(assert (=> d!38217 (= res!61250 (contains!864 lt!65437 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65438 () List!1678)

(assert (=> d!38217 (= lt!65437 (ListLongMap!1634 lt!65438))))

(declare-fun lt!65440 () Unit!3928)

(declare-fun lt!65439 () Unit!3928)

(assert (=> d!38217 (= lt!65440 lt!65439)))

(assert (=> d!38217 (= (getValueByKey!168 lt!65438 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38217 (= lt!65439 (lemmaContainsTupThenGetReturnValue!83 lt!65438 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38217 (= lt!65438 (insertStrictlySorted!86 (toList!832 call!13591) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38217 (= (+!164 call!13591 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65437)))

(declare-fun b!126669 () Bool)

(declare-fun res!61249 () Bool)

(assert (=> b!126669 (=> (not res!61249) (not e!82718))))

(assert (=> b!126669 (= res!61249 (= (getValueByKey!168 (toList!832 lt!65437) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126670 () Bool)

(assert (=> b!126670 (= e!82718 (contains!866 (toList!832 lt!65437) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38217 res!61250) b!126669))

(assert (= (and b!126669 res!61249) b!126670))

(declare-fun m!147751 () Bool)

(assert (=> d!38217 m!147751))

(declare-fun m!147753 () Bool)

(assert (=> d!38217 m!147753))

(declare-fun m!147755 () Bool)

(assert (=> d!38217 m!147755))

(declare-fun m!147757 () Bool)

(assert (=> d!38217 m!147757))

(declare-fun m!147759 () Bool)

(assert (=> b!126669 m!147759))

(declare-fun m!147761 () Bool)

(assert (=> b!126670 m!147761))

(assert (=> b!126416 d!38217))

(declare-fun b!126671 () Bool)

(declare-fun e!82724 () Bool)

(declare-fun e!82731 () Bool)

(assert (=> b!126671 (= e!82724 e!82731)))

(declare-fun c!23177 () Bool)

(assert (=> b!126671 (= c!23177 (not (= (bvand (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126672 () Bool)

(declare-fun e!82728 () ListLongMap!1633)

(declare-fun e!82729 () ListLongMap!1633)

(assert (=> b!126672 (= e!82728 e!82729)))

(declare-fun c!23173 () Bool)

(assert (=> b!126672 (= c!23173 (and (not (= (bvand (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!23176 () Bool)

(declare-fun bm!13631 () Bool)

(declare-fun call!13637 () ListLongMap!1633)

(declare-fun call!13634 () ListLongMap!1633)

(declare-fun call!13639 () ListLongMap!1633)

(declare-fun call!13640 () ListLongMap!1633)

(assert (=> bm!13631 (= call!13639 (+!164 (ite c!23176 call!13634 (ite c!23173 call!13637 call!13640)) (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(declare-fun bm!13632 () Bool)

(assert (=> bm!13632 (= call!13634 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13633 () Bool)

(declare-fun call!13638 () Bool)

(declare-fun lt!65455 () ListLongMap!1633)

(assert (=> bm!13633 (= call!13638 (contains!864 lt!65455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126673 () Bool)

(declare-fun e!82719 () Bool)

(declare-fun e!82723 () Bool)

(assert (=> b!126673 (= e!82719 e!82723)))

(declare-fun res!61255 () Bool)

(assert (=> b!126673 (=> (not res!61255) (not e!82723))))

(assert (=> b!126673 (= res!61255 (contains!864 lt!65455 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun bm!13634 () Bool)

(assert (=> bm!13634 (= call!13640 call!13637)))

(declare-fun b!126674 () Bool)

(declare-fun e!82726 () ListLongMap!1633)

(declare-fun call!13636 () ListLongMap!1633)

(assert (=> b!126674 (= e!82726 call!13636)))

(declare-fun b!126675 () Bool)

(declare-fun res!61251 () Bool)

(assert (=> b!126675 (=> (not res!61251) (not e!82724))))

(assert (=> b!126675 (= res!61251 e!82719)))

(declare-fun res!61252 () Bool)

(assert (=> b!126675 (=> res!61252 e!82719)))

(declare-fun e!82722 () Bool)

(assert (=> b!126675 (= res!61252 (not e!82722))))

(declare-fun res!61257 () Bool)

(assert (=> b!126675 (=> (not res!61257) (not e!82722))))

(assert (=> b!126675 (= res!61257 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126676 () Bool)

(declare-fun e!82725 () Bool)

(assert (=> b!126676 (= e!82725 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126677 () Bool)

(declare-fun e!82720 () Bool)

(assert (=> b!126677 (= e!82720 (= (apply!111 lt!65455 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))

(declare-fun b!126678 () Bool)

(declare-fun res!61258 () Bool)

(assert (=> b!126678 (=> (not res!61258) (not e!82724))))

(declare-fun e!82721 () Bool)

(assert (=> b!126678 (= res!61258 e!82721)))

(declare-fun c!23172 () Bool)

(assert (=> b!126678 (= c!23172 (not (= (bvand (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13635 () Bool)

(assert (=> bm!13635 (= call!13636 call!13639)))

(declare-fun b!126679 () Bool)

(assert (=> b!126679 (= e!82729 call!13636)))

(declare-fun b!126680 () Bool)

(assert (=> b!126680 (= e!82726 call!13640)))

(declare-fun bm!13636 () Bool)

(assert (=> bm!13636 (= call!13637 call!13634)))

(declare-fun b!126681 () Bool)

(assert (=> b!126681 (= e!82731 e!82720)))

(declare-fun res!61254 () Bool)

(assert (=> b!126681 (= res!61254 call!13638)))

(assert (=> b!126681 (=> (not res!61254) (not e!82720))))

(declare-fun c!23175 () Bool)

(declare-fun b!126682 () Bool)

(assert (=> b!126682 (= c!23175 (and (not (= (bvand (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!126682 (= e!82729 e!82726)))

(declare-fun b!126683 () Bool)

(assert (=> b!126683 (= e!82731 (not call!13638))))

(declare-fun b!126684 () Bool)

(assert (=> b!126684 (= e!82723 (= (apply!111 lt!65455 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))))))))

(assert (=> b!126684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126685 () Bool)

(declare-fun call!13635 () Bool)

(assert (=> b!126685 (= e!82721 (not call!13635))))

(declare-fun bm!13637 () Bool)

(assert (=> bm!13637 (= call!13635 (contains!864 lt!65455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82730 () Bool)

(declare-fun b!126686 () Bool)

(assert (=> b!126686 (= e!82730 (= (apply!111 lt!65455 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))

(declare-fun b!126687 () Bool)

(declare-fun e!82727 () Unit!3928)

(declare-fun lt!65458 () Unit!3928)

(assert (=> b!126687 (= e!82727 lt!65458)))

(declare-fun lt!65443 () ListLongMap!1633)

(assert (=> b!126687 (= lt!65443 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65462 () (_ BitVec 64))

(assert (=> b!126687 (= lt!65462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65460 () (_ BitVec 64))

(assert (=> b!126687 (= lt!65460 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65445 () Unit!3928)

(assert (=> b!126687 (= lt!65445 (addStillContains!87 lt!65443 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65460))))

(assert (=> b!126687 (contains!864 (+!164 lt!65443 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65460)))

(declare-fun lt!65449 () Unit!3928)

(assert (=> b!126687 (= lt!65449 lt!65445)))

(declare-fun lt!65453 () ListLongMap!1633)

(assert (=> b!126687 (= lt!65453 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65446 () (_ BitVec 64))

(assert (=> b!126687 (= lt!65446 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65456 () (_ BitVec 64))

(assert (=> b!126687 (= lt!65456 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65451 () Unit!3928)

(assert (=> b!126687 (= lt!65451 (addApplyDifferent!87 lt!65453 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65456))))

(assert (=> b!126687 (= (apply!111 (+!164 lt!65453 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65456) (apply!111 lt!65453 lt!65456))))

(declare-fun lt!65461 () Unit!3928)

(assert (=> b!126687 (= lt!65461 lt!65451)))

(declare-fun lt!65444 () ListLongMap!1633)

(assert (=> b!126687 (= lt!65444 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65452 () (_ BitVec 64))

(assert (=> b!126687 (= lt!65452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65442 () (_ BitVec 64))

(assert (=> b!126687 (= lt!65442 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65441 () Unit!3928)

(assert (=> b!126687 (= lt!65441 (addApplyDifferent!87 lt!65444 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65442))))

(assert (=> b!126687 (= (apply!111 (+!164 lt!65444 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65442) (apply!111 lt!65444 lt!65442))))

(declare-fun lt!65450 () Unit!3928)

(assert (=> b!126687 (= lt!65450 lt!65441)))

(declare-fun lt!65457 () ListLongMap!1633)

(assert (=> b!126687 (= lt!65457 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65448 () (_ BitVec 64))

(assert (=> b!126687 (= lt!65448 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65454 () (_ BitVec 64))

(assert (=> b!126687 (= lt!65454 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126687 (= lt!65458 (addApplyDifferent!87 lt!65457 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65454))))

(assert (=> b!126687 (= (apply!111 (+!164 lt!65457 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65454) (apply!111 lt!65457 lt!65454))))

(declare-fun b!126688 () Bool)

(declare-fun Unit!3942 () Unit!3928)

(assert (=> b!126688 (= e!82727 Unit!3942)))

(declare-fun d!38219 () Bool)

(assert (=> d!38219 e!82724))

(declare-fun res!61259 () Bool)

(assert (=> d!38219 (=> (not res!61259) (not e!82724))))

(assert (=> d!38219 (= res!61259 (or (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun lt!65447 () ListLongMap!1633)

(assert (=> d!38219 (= lt!65455 lt!65447)))

(declare-fun lt!65459 () Unit!3928)

(assert (=> d!38219 (= lt!65459 e!82727)))

(declare-fun c!23174 () Bool)

(assert (=> d!38219 (= c!23174 e!82725)))

(declare-fun res!61256 () Bool)

(assert (=> d!38219 (=> (not res!61256) (not e!82725))))

(assert (=> d!38219 (= res!61256 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38219 (= lt!65447 e!82728)))

(assert (=> d!38219 (= c!23176 (and (not (= (bvand (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38219 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38219 (= (getCurrentListMap!512 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65455)))

(declare-fun b!126689 () Bool)

(assert (=> b!126689 (= e!82722 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126690 () Bool)

(assert (=> b!126690 (= e!82728 (+!164 call!13639 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))

(declare-fun b!126691 () Bool)

(assert (=> b!126691 (= e!82721 e!82730)))

(declare-fun res!61253 () Bool)

(assert (=> b!126691 (= res!61253 call!13635)))

(assert (=> b!126691 (=> (not res!61253) (not e!82730))))

(assert (= (and d!38219 c!23176) b!126690))

(assert (= (and d!38219 (not c!23176)) b!126672))

(assert (= (and b!126672 c!23173) b!126679))

(assert (= (and b!126672 (not c!23173)) b!126682))

(assert (= (and b!126682 c!23175) b!126674))

(assert (= (and b!126682 (not c!23175)) b!126680))

(assert (= (or b!126674 b!126680) bm!13634))

(assert (= (or b!126679 bm!13634) bm!13636))

(assert (= (or b!126679 b!126674) bm!13635))

(assert (= (or b!126690 bm!13636) bm!13632))

(assert (= (or b!126690 bm!13635) bm!13631))

(assert (= (and d!38219 res!61256) b!126676))

(assert (= (and d!38219 c!23174) b!126687))

(assert (= (and d!38219 (not c!23174)) b!126688))

(assert (= (and d!38219 res!61259) b!126675))

(assert (= (and b!126675 res!61257) b!126689))

(assert (= (and b!126675 (not res!61252)) b!126673))

(assert (= (and b!126673 res!61255) b!126684))

(assert (= (and b!126675 res!61251) b!126678))

(assert (= (and b!126678 c!23172) b!126691))

(assert (= (and b!126678 (not c!23172)) b!126685))

(assert (= (and b!126691 res!61253) b!126686))

(assert (= (or b!126691 b!126685) bm!13637))

(assert (= (and b!126678 res!61258) b!126671))

(assert (= (and b!126671 c!23177) b!126681))

(assert (= (and b!126671 (not c!23177)) b!126683))

(assert (= (and b!126681 res!61254) b!126677))

(assert (= (or b!126681 b!126683) bm!13633))

(declare-fun b_lambda!5581 () Bool)

(assert (=> (not b_lambda!5581) (not b!126684)))

(assert (=> b!126684 t!6029))

(declare-fun b_and!7793 () Bool)

(assert (= b_and!7789 (and (=> t!6029 result!3843) b_and!7793)))

(assert (=> b!126684 t!6031))

(declare-fun b_and!7795 () Bool)

(assert (= b_and!7791 (and (=> t!6031 result!3845) b_and!7795)))

(assert (=> b!126689 m!147525))

(assert (=> b!126689 m!147525))

(assert (=> b!126689 m!147527))

(declare-fun m!147763 () Bool)

(assert (=> b!126687 m!147763))

(declare-fun m!147765 () Bool)

(assert (=> b!126687 m!147765))

(declare-fun m!147767 () Bool)

(assert (=> b!126687 m!147767))

(declare-fun m!147769 () Bool)

(assert (=> b!126687 m!147769))

(declare-fun m!147771 () Bool)

(assert (=> b!126687 m!147771))

(assert (=> b!126687 m!147769))

(declare-fun m!147773 () Bool)

(assert (=> b!126687 m!147773))

(declare-fun m!147775 () Bool)

(assert (=> b!126687 m!147775))

(declare-fun m!147777 () Bool)

(assert (=> b!126687 m!147777))

(declare-fun m!147779 () Bool)

(assert (=> b!126687 m!147779))

(assert (=> b!126687 m!147765))

(declare-fun m!147781 () Bool)

(assert (=> b!126687 m!147781))

(declare-fun m!147783 () Bool)

(assert (=> b!126687 m!147783))

(declare-fun m!147785 () Bool)

(assert (=> b!126687 m!147785))

(declare-fun m!147787 () Bool)

(assert (=> b!126687 m!147787))

(declare-fun m!147789 () Bool)

(assert (=> b!126687 m!147789))

(declare-fun m!147791 () Bool)

(assert (=> b!126687 m!147791))

(assert (=> b!126687 m!147525))

(assert (=> b!126687 m!147773))

(assert (=> b!126687 m!147785))

(declare-fun m!147793 () Bool)

(assert (=> b!126687 m!147793))

(declare-fun m!147795 () Bool)

(assert (=> bm!13637 m!147795))

(declare-fun m!147797 () Bool)

(assert (=> bm!13631 m!147797))

(assert (=> bm!13632 m!147791))

(declare-fun m!147799 () Bool)

(assert (=> b!126677 m!147799))

(assert (=> b!126676 m!147525))

(assert (=> b!126676 m!147525))

(assert (=> b!126676 m!147527))

(assert (=> b!126673 m!147525))

(assert (=> b!126673 m!147525))

(declare-fun m!147801 () Bool)

(assert (=> b!126673 m!147801))

(assert (=> b!126684 m!147569))

(assert (=> b!126684 m!147525))

(declare-fun m!147803 () Bool)

(assert (=> b!126684 m!147803))

(assert (=> b!126684 m!147525))

(declare-fun m!147805 () Bool)

(assert (=> b!126684 m!147805))

(assert (=> b!126684 m!147805))

(assert (=> b!126684 m!147569))

(declare-fun m!147807 () Bool)

(assert (=> b!126684 m!147807))

(declare-fun m!147809 () Bool)

(assert (=> bm!13633 m!147809))

(declare-fun m!147811 () Bool)

(assert (=> b!126690 m!147811))

(declare-fun m!147813 () Bool)

(assert (=> b!126686 m!147813))

(assert (=> d!38219 m!147517))

(assert (=> bm!13560 d!38219))

(declare-fun b!126701 () Bool)

(declare-fun res!61271 () Bool)

(declare-fun e!82734 () Bool)

(assert (=> b!126701 (=> (not res!61271) (not e!82734))))

(declare-fun size!2486 (LongMapFixedSize!1060) (_ BitVec 32))

(assert (=> b!126701 (= res!61271 (bvsge (size!2486 newMap!16) (_size!579 newMap!16)))))

(declare-fun d!38221 () Bool)

(declare-fun res!61270 () Bool)

(assert (=> d!38221 (=> (not res!61270) (not e!82734))))

(assert (=> d!38221 (= res!61270 (validMask!0 (mask!7038 newMap!16)))))

(assert (=> d!38221 (= (simpleValid!87 newMap!16) e!82734)))

(declare-fun b!126700 () Bool)

(declare-fun res!61269 () Bool)

(assert (=> b!126700 (=> (not res!61269) (not e!82734))))

(assert (=> b!126700 (= res!61269 (and (= (size!2481 (_values!2765 newMap!16)) (bvadd (mask!7038 newMap!16) #b00000000000000000000000000000001)) (= (size!2480 (_keys!4515 newMap!16)) (size!2481 (_values!2765 newMap!16))) (bvsge (_size!579 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!579 newMap!16) (bvadd (mask!7038 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!126702 () Bool)

(declare-fun res!61268 () Bool)

(assert (=> b!126702 (=> (not res!61268) (not e!82734))))

(assert (=> b!126702 (= res!61268 (= (size!2486 newMap!16) (bvadd (_size!579 newMap!16) (bvsdiv (bvadd (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!126703 () Bool)

(assert (=> b!126703 (= e!82734 (and (bvsge (extraKeys!2563 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2563 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!579 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!38221 res!61270) b!126700))

(assert (= (and b!126700 res!61269) b!126701))

(assert (= (and b!126701 res!61271) b!126702))

(assert (= (and b!126702 res!61268) b!126703))

(declare-fun m!147815 () Bool)

(assert (=> b!126701 m!147815))

(assert (=> d!38221 m!147517))

(assert (=> b!126702 m!147815))

(assert (=> d!38149 d!38221))

(declare-fun d!38223 () Bool)

(declare-fun e!82736 () Bool)

(assert (=> d!38223 e!82736))

(declare-fun res!61272 () Bool)

(assert (=> d!38223 (=> res!61272 e!82736)))

(declare-fun lt!65464 () Bool)

(assert (=> d!38223 (= res!61272 (not lt!65464))))

(declare-fun lt!65463 () Bool)

(assert (=> d!38223 (= lt!65464 lt!65463)))

(declare-fun lt!65466 () Unit!3928)

(declare-fun e!82735 () Unit!3928)

(assert (=> d!38223 (= lt!65466 e!82735)))

(declare-fun c!23178 () Bool)

(assert (=> d!38223 (= c!23178 lt!65463)))

(assert (=> d!38223 (= lt!65463 (containsKey!171 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38223 (= (contains!864 lt!65225 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!65464)))

(declare-fun b!126704 () Bool)

(declare-fun lt!65465 () Unit!3928)

(assert (=> b!126704 (= e!82735 lt!65465)))

(assert (=> b!126704 (= lt!65465 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126704 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126705 () Bool)

(declare-fun Unit!3943 () Unit!3928)

(assert (=> b!126705 (= e!82735 Unit!3943)))

(declare-fun b!126706 () Bool)

(assert (=> b!126706 (= e!82736 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38223 c!23178) b!126704))

(assert (= (and d!38223 (not c!23178)) b!126705))

(assert (= (and d!38223 (not res!61272)) b!126706))

(assert (=> d!38223 m!147373))

(declare-fun m!147817 () Bool)

(assert (=> d!38223 m!147817))

(assert (=> b!126704 m!147373))

(declare-fun m!147819 () Bool)

(assert (=> b!126704 m!147819))

(assert (=> b!126704 m!147373))

(assert (=> b!126704 m!147583))

(assert (=> b!126704 m!147583))

(declare-fun m!147821 () Bool)

(assert (=> b!126704 m!147821))

(assert (=> b!126706 m!147373))

(assert (=> b!126706 m!147583))

(assert (=> b!126706 m!147583))

(assert (=> b!126706 m!147821))

(assert (=> b!126399 d!38223))

(declare-fun d!38225 () Bool)

(assert (=> d!38225 (= (inRange!0 (ite c!23081 (ite c!23083 (index!3212 lt!65153) (ite c!23086 (index!3211 lt!65161) (index!3214 lt!65161))) (ite c!23080 (index!3212 lt!65144) (ite c!23078 (index!3211 lt!65163) (index!3214 lt!65163)))) (mask!7038 newMap!16)) (and (bvsge (ite c!23081 (ite c!23083 (index!3212 lt!65153) (ite c!23086 (index!3211 lt!65161) (index!3214 lt!65161))) (ite c!23080 (index!3212 lt!65144) (ite c!23078 (index!3211 lt!65163) (index!3214 lt!65163)))) #b00000000000000000000000000000000) (bvslt (ite c!23081 (ite c!23083 (index!3212 lt!65153) (ite c!23086 (index!3211 lt!65161) (index!3214 lt!65161))) (ite c!23080 (index!3212 lt!65144) (ite c!23078 (index!3211 lt!65163) (index!3214 lt!65163)))) (bvadd (mask!7038 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13551 d!38225))

(assert (=> b!126340 d!38189))

(declare-fun d!38227 () Bool)

(assert (=> d!38227 (= (apply!111 lt!65225 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5246 () Bool)

(assert (= bs!5246 d!38227))

(assert (=> bs!5246 m!147513))

(assert (=> bs!5246 m!147513))

(declare-fun m!147823 () Bool)

(assert (=> bs!5246 m!147823))

(assert (=> b!126412 d!38227))

(declare-fun d!38229 () Bool)

(declare-fun e!82737 () Bool)

(assert (=> d!38229 e!82737))

(declare-fun res!61274 () Bool)

(assert (=> d!38229 (=> (not res!61274) (not e!82737))))

(declare-fun lt!65467 () ListLongMap!1633)

(assert (=> d!38229 (= res!61274 (contains!864 lt!65467 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65468 () List!1678)

(assert (=> d!38229 (= lt!65467 (ListLongMap!1634 lt!65468))))

(declare-fun lt!65470 () Unit!3928)

(declare-fun lt!65469 () Unit!3928)

(assert (=> d!38229 (= lt!65470 lt!65469)))

(assert (=> d!38229 (= (getValueByKey!168 lt!65468 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38229 (= lt!65469 (lemmaContainsTupThenGetReturnValue!83 lt!65468 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38229 (= lt!65468 (insertStrictlySorted!86 (toList!832 lt!65223) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38229 (= (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65467)))

(declare-fun b!126707 () Bool)

(declare-fun res!61273 () Bool)

(assert (=> b!126707 (=> (not res!61273) (not e!82737))))

(assert (=> b!126707 (= res!61273 (= (getValueByKey!168 (toList!832 lt!65467) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126708 () Bool)

(assert (=> b!126708 (= e!82737 (contains!866 (toList!832 lt!65467) (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38229 res!61274) b!126707))

(assert (= (and b!126707 res!61273) b!126708))

(declare-fun m!147825 () Bool)

(assert (=> d!38229 m!147825))

(declare-fun m!147827 () Bool)

(assert (=> d!38229 m!147827))

(declare-fun m!147829 () Bool)

(assert (=> d!38229 m!147829))

(declare-fun m!147831 () Bool)

(assert (=> d!38229 m!147831))

(declare-fun m!147833 () Bool)

(assert (=> b!126707 m!147833))

(declare-fun m!147835 () Bool)

(assert (=> b!126708 m!147835))

(assert (=> b!126413 d!38229))

(declare-fun d!38231 () Bool)

(assert (=> d!38231 (= (apply!111 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65224) (apply!111 lt!65227 lt!65224))))

(declare-fun lt!65473 () Unit!3928)

(declare-fun choose!772 (ListLongMap!1633 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3928)

(assert (=> d!38231 (= lt!65473 (choose!772 lt!65227 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65224))))

(declare-fun e!82740 () Bool)

(assert (=> d!38231 e!82740))

(declare-fun res!61277 () Bool)

(assert (=> d!38231 (=> (not res!61277) (not e!82740))))

(assert (=> d!38231 (= res!61277 (contains!864 lt!65227 lt!65224))))

(assert (=> d!38231 (= (addApplyDifferent!87 lt!65227 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65224) lt!65473)))

(declare-fun b!126712 () Bool)

(assert (=> b!126712 (= e!82740 (not (= lt!65224 lt!65218)))))

(assert (= (and d!38231 res!61277) b!126712))

(assert (=> d!38231 m!147387))

(assert (=> d!38231 m!147387))

(assert (=> d!38231 m!147389))

(declare-fun m!147837 () Bool)

(assert (=> d!38231 m!147837))

(assert (=> d!38231 m!147397))

(declare-fun m!147839 () Bool)

(assert (=> d!38231 m!147839))

(assert (=> b!126413 d!38231))

(declare-fun d!38233 () Bool)

(declare-fun e!82741 () Bool)

(assert (=> d!38233 e!82741))

(declare-fun res!61279 () Bool)

(assert (=> d!38233 (=> (not res!61279) (not e!82741))))

(declare-fun lt!65474 () ListLongMap!1633)

(assert (=> d!38233 (= res!61279 (contains!864 lt!65474 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65475 () List!1678)

(assert (=> d!38233 (= lt!65474 (ListLongMap!1634 lt!65475))))

(declare-fun lt!65477 () Unit!3928)

(declare-fun lt!65476 () Unit!3928)

(assert (=> d!38233 (= lt!65477 lt!65476)))

(assert (=> d!38233 (= (getValueByKey!168 lt!65475 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38233 (= lt!65476 (lemmaContainsTupThenGetReturnValue!83 lt!65475 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38233 (= lt!65475 (insertStrictlySorted!86 (toList!832 lt!65214) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38233 (= (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65474)))

(declare-fun b!126713 () Bool)

(declare-fun res!61278 () Bool)

(assert (=> b!126713 (=> (not res!61278) (not e!82741))))

(assert (=> b!126713 (= res!61278 (= (getValueByKey!168 (toList!832 lt!65474) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126714 () Bool)

(assert (=> b!126714 (= e!82741 (contains!866 (toList!832 lt!65474) (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38233 res!61279) b!126713))

(assert (= (and b!126713 res!61278) b!126714))

(declare-fun m!147841 () Bool)

(assert (=> d!38233 m!147841))

(declare-fun m!147843 () Bool)

(assert (=> d!38233 m!147843))

(declare-fun m!147845 () Bool)

(assert (=> d!38233 m!147845))

(declare-fun m!147847 () Bool)

(assert (=> d!38233 m!147847))

(declare-fun m!147849 () Bool)

(assert (=> b!126713 m!147849))

(declare-fun m!147851 () Bool)

(assert (=> b!126714 m!147851))

(assert (=> b!126413 d!38233))

(declare-fun d!38235 () Bool)

(assert (=> d!38235 (= (apply!111 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65226) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65226)))))

(declare-fun bs!5247 () Bool)

(assert (= bs!5247 d!38235))

(declare-fun m!147853 () Bool)

(assert (=> bs!5247 m!147853))

(assert (=> bs!5247 m!147853))

(declare-fun m!147855 () Bool)

(assert (=> bs!5247 m!147855))

(assert (=> b!126413 d!38235))

(declare-fun d!38237 () Bool)

(assert (=> d!38237 (= (apply!111 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65212) (apply!111 lt!65214 lt!65212))))

(declare-fun lt!65478 () Unit!3928)

(assert (=> d!38237 (= lt!65478 (choose!772 lt!65214 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65212))))

(declare-fun e!82742 () Bool)

(assert (=> d!38237 e!82742))

(declare-fun res!61280 () Bool)

(assert (=> d!38237 (=> (not res!61280) (not e!82742))))

(assert (=> d!38237 (= res!61280 (contains!864 lt!65214 lt!65212))))

(assert (=> d!38237 (= (addApplyDifferent!87 lt!65214 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65212) lt!65478)))

(declare-fun b!126715 () Bool)

(assert (=> b!126715 (= e!82742 (not (= lt!65212 lt!65222)))))

(assert (= (and d!38237 res!61280) b!126715))

(assert (=> d!38237 m!147379))

(assert (=> d!38237 m!147379))

(assert (=> d!38237 m!147395))

(declare-fun m!147857 () Bool)

(assert (=> d!38237 m!147857))

(assert (=> d!38237 m!147377))

(declare-fun m!147859 () Bool)

(assert (=> d!38237 m!147859))

(assert (=> b!126413 d!38237))

(declare-fun d!38239 () Bool)

(assert (=> d!38239 (= (apply!111 lt!65223 lt!65226) (get!1456 (getValueByKey!168 (toList!832 lt!65223) lt!65226)))))

(declare-fun bs!5248 () Bool)

(assert (= bs!5248 d!38239))

(declare-fun m!147861 () Bool)

(assert (=> bs!5248 m!147861))

(assert (=> bs!5248 m!147861))

(declare-fun m!147863 () Bool)

(assert (=> bs!5248 m!147863))

(assert (=> b!126413 d!38239))

(declare-fun d!38241 () Bool)

(assert (=> d!38241 (= (apply!111 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65226) (apply!111 lt!65223 lt!65226))))

(declare-fun lt!65479 () Unit!3928)

(assert (=> d!38241 (= lt!65479 (choose!772 lt!65223 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65226))))

(declare-fun e!82743 () Bool)

(assert (=> d!38241 e!82743))

(declare-fun res!61281 () Bool)

(assert (=> d!38241 (=> (not res!61281) (not e!82743))))

(assert (=> d!38241 (= res!61281 (contains!864 lt!65223 lt!65226))))

(assert (=> d!38241 (= (addApplyDifferent!87 lt!65223 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65226) lt!65479)))

(declare-fun b!126716 () Bool)

(assert (=> b!126716 (= e!82743 (not (= lt!65226 lt!65216)))))

(assert (= (and d!38241 res!61281) b!126716))

(assert (=> d!38241 m!147383))

(assert (=> d!38241 m!147383))

(assert (=> d!38241 m!147385))

(declare-fun m!147865 () Bool)

(assert (=> d!38241 m!147865))

(assert (=> d!38241 m!147381))

(declare-fun m!147867 () Bool)

(assert (=> d!38241 m!147867))

(assert (=> b!126413 d!38241))

(declare-fun d!38243 () Bool)

(assert (=> d!38243 (= (apply!111 lt!65214 lt!65212) (get!1456 (getValueByKey!168 (toList!832 lt!65214) lt!65212)))))

(declare-fun bs!5249 () Bool)

(assert (= bs!5249 d!38243))

(declare-fun m!147869 () Bool)

(assert (=> bs!5249 m!147869))

(assert (=> bs!5249 m!147869))

(declare-fun m!147871 () Bool)

(assert (=> bs!5249 m!147871))

(assert (=> b!126413 d!38243))

(declare-fun d!38245 () Bool)

(declare-fun e!82744 () Bool)

(assert (=> d!38245 e!82744))

(declare-fun res!61283 () Bool)

(assert (=> d!38245 (=> (not res!61283) (not e!82744))))

(declare-fun lt!65480 () ListLongMap!1633)

(assert (=> d!38245 (= res!61283 (contains!864 lt!65480 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65481 () List!1678)

(assert (=> d!38245 (= lt!65480 (ListLongMap!1634 lt!65481))))

(declare-fun lt!65483 () Unit!3928)

(declare-fun lt!65482 () Unit!3928)

(assert (=> d!38245 (= lt!65483 lt!65482)))

(assert (=> d!38245 (= (getValueByKey!168 lt!65481 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38245 (= lt!65482 (lemmaContainsTupThenGetReturnValue!83 lt!65481 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38245 (= lt!65481 (insertStrictlySorted!86 (toList!832 lt!65213) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38245 (= (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65480)))

(declare-fun b!126717 () Bool)

(declare-fun res!61282 () Bool)

(assert (=> b!126717 (=> (not res!61282) (not e!82744))))

(assert (=> b!126717 (= res!61282 (= (getValueByKey!168 (toList!832 lt!65480) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126718 () Bool)

(assert (=> b!126718 (= e!82744 (contains!866 (toList!832 lt!65480) (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38245 res!61283) b!126717))

(assert (= (and b!126717 res!61282) b!126718))

(declare-fun m!147873 () Bool)

(assert (=> d!38245 m!147873))

(declare-fun m!147875 () Bool)

(assert (=> d!38245 m!147875))

(declare-fun m!147877 () Bool)

(assert (=> d!38245 m!147877))

(declare-fun m!147879 () Bool)

(assert (=> d!38245 m!147879))

(declare-fun m!147881 () Bool)

(assert (=> b!126717 m!147881))

(declare-fun m!147883 () Bool)

(assert (=> b!126718 m!147883))

(assert (=> b!126413 d!38245))

(declare-fun d!38247 () Bool)

(assert (=> d!38247 (contains!864 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65230)))

(declare-fun lt!65486 () Unit!3928)

(declare-fun choose!773 (ListLongMap!1633 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3928)

(assert (=> d!38247 (= lt!65486 (choose!773 lt!65213 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65230))))

(assert (=> d!38247 (contains!864 lt!65213 lt!65230)))

(assert (=> d!38247 (= (addStillContains!87 lt!65213 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65230) lt!65486)))

(declare-fun bs!5250 () Bool)

(assert (= bs!5250 d!38247))

(assert (=> bs!5250 m!147399))

(assert (=> bs!5250 m!147399))

(assert (=> bs!5250 m!147401))

(declare-fun m!147885 () Bool)

(assert (=> bs!5250 m!147885))

(declare-fun m!147887 () Bool)

(assert (=> bs!5250 m!147887))

(assert (=> b!126413 d!38247))

(declare-fun b!126744 () Bool)

(declare-fun e!82759 () Bool)

(declare-fun e!82760 () Bool)

(assert (=> b!126744 (= e!82759 e!82760)))

(assert (=> b!126744 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun res!61295 () Bool)

(declare-fun lt!65501 () ListLongMap!1633)

(assert (=> b!126744 (= res!61295 (contains!864 lt!65501 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126744 (=> (not res!61295) (not e!82760))))

(declare-fun b!126745 () Bool)

(declare-fun e!82764 () Bool)

(assert (=> b!126745 (= e!82764 (= lt!65501 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun bm!13640 () Bool)

(declare-fun call!13643 () ListLongMap!1633)

(assert (=> bm!13640 (= call!13643 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126746 () Bool)

(declare-fun e!82763 () ListLongMap!1633)

(declare-fun e!82765 () ListLongMap!1633)

(assert (=> b!126746 (= e!82763 e!82765)))

(declare-fun c!23189 () Bool)

(assert (=> b!126746 (= c!23189 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126747 () Bool)

(declare-fun lt!65505 () Unit!3928)

(declare-fun lt!65504 () Unit!3928)

(assert (=> b!126747 (= lt!65505 lt!65504)))

(declare-fun lt!65502 () (_ BitVec 64))

(declare-fun lt!65507 () V!3433)

(declare-fun lt!65503 () (_ BitVec 64))

(declare-fun lt!65506 () ListLongMap!1633)

(assert (=> b!126747 (not (contains!864 (+!164 lt!65506 (tuple2!2525 lt!65502 lt!65507)) lt!65503))))

(declare-fun addStillNotContains!58 (ListLongMap!1633 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3928)

(assert (=> b!126747 (= lt!65504 (addStillNotContains!58 lt!65506 lt!65502 lt!65507 lt!65503))))

(assert (=> b!126747 (= lt!65503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126747 (= lt!65507 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126747 (= lt!65502 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!126747 (= lt!65506 call!13643)))

(assert (=> b!126747 (= e!82765 (+!164 call!13643 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38249 () Bool)

(declare-fun e!82762 () Bool)

(assert (=> d!38249 e!82762))

(declare-fun res!61293 () Bool)

(assert (=> d!38249 (=> (not res!61293) (not e!82762))))

(assert (=> d!38249 (= res!61293 (not (contains!864 lt!65501 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38249 (= lt!65501 e!82763)))

(declare-fun c!23188 () Bool)

(assert (=> d!38249 (= c!23188 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38249 (validMask!0 (mask!7038 (v!3124 (underlying!439 thiss!992))))))

(assert (=> d!38249 (= (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))) lt!65501)))

(declare-fun b!126748 () Bool)

(declare-fun res!61294 () Bool)

(assert (=> b!126748 (=> (not res!61294) (not e!82762))))

(assert (=> b!126748 (= res!61294 (not (contains!864 lt!65501 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126749 () Bool)

(declare-fun e!82761 () Bool)

(assert (=> b!126749 (= e!82761 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126749 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!126750 () Bool)

(assert (=> b!126750 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> b!126750 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2481 (_values!2765 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> b!126750 (= e!82760 (= (apply!111 lt!65501 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126751 () Bool)

(assert (=> b!126751 (= e!82765 call!13643)))

(declare-fun b!126752 () Bool)

(assert (=> b!126752 (= e!82759 e!82764)))

(declare-fun c!23187 () Bool)

(assert (=> b!126752 (= c!23187 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126753 () Bool)

(declare-fun isEmpty!403 (ListLongMap!1633) Bool)

(assert (=> b!126753 (= e!82764 (isEmpty!403 lt!65501))))

(declare-fun b!126754 () Bool)

(assert (=> b!126754 (= e!82762 e!82759)))

(declare-fun c!23190 () Bool)

(assert (=> b!126754 (= c!23190 e!82761)))

(declare-fun res!61292 () Bool)

(assert (=> b!126754 (=> (not res!61292) (not e!82761))))

(assert (=> b!126754 (= res!61292 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126755 () Bool)

(assert (=> b!126755 (= e!82763 (ListLongMap!1634 Nil!1675))))

(assert (= (and d!38249 c!23188) b!126755))

(assert (= (and d!38249 (not c!23188)) b!126746))

(assert (= (and b!126746 c!23189) b!126747))

(assert (= (and b!126746 (not c!23189)) b!126751))

(assert (= (or b!126747 b!126751) bm!13640))

(assert (= (and d!38249 res!61293) b!126748))

(assert (= (and b!126748 res!61294) b!126754))

(assert (= (and b!126754 res!61292) b!126749))

(assert (= (and b!126754 c!23190) b!126744))

(assert (= (and b!126754 (not c!23190)) b!126752))

(assert (= (and b!126744 res!61295) b!126750))

(assert (= (and b!126752 c!23187) b!126745))

(assert (= (and b!126752 (not c!23187)) b!126753))

(declare-fun b_lambda!5583 () Bool)

(assert (=> (not b_lambda!5583) (not b!126747)))

(assert (=> b!126747 t!6014))

(declare-fun b_and!7797 () Bool)

(assert (= b_and!7793 (and (=> t!6014 result!3823) b_and!7797)))

(assert (=> b!126747 t!6016))

(declare-fun b_and!7799 () Bool)

(assert (= b_and!7795 (and (=> t!6016 result!3827) b_and!7799)))

(declare-fun b_lambda!5585 () Bool)

(assert (=> (not b_lambda!5585) (not b!126750)))

(assert (=> b!126750 t!6014))

(declare-fun b_and!7801 () Bool)

(assert (= b_and!7797 (and (=> t!6014 result!3823) b_and!7801)))

(assert (=> b!126750 t!6016))

(declare-fun b_and!7803 () Bool)

(assert (= b_and!7799 (and (=> t!6016 result!3827) b_and!7803)))

(declare-fun m!147889 () Bool)

(assert (=> b!126747 m!147889))

(assert (=> b!126747 m!147373))

(declare-fun m!147891 () Bool)

(assert (=> b!126747 m!147891))

(assert (=> b!126747 m!147889))

(declare-fun m!147893 () Bool)

(assert (=> b!126747 m!147893))

(assert (=> b!126747 m!147213))

(assert (=> b!126747 m!147419))

(assert (=> b!126747 m!147419))

(assert (=> b!126747 m!147213))

(assert (=> b!126747 m!147421))

(declare-fun m!147895 () Bool)

(assert (=> b!126747 m!147895))

(declare-fun m!147897 () Bool)

(assert (=> b!126745 m!147897))

(declare-fun m!147899 () Bool)

(assert (=> b!126753 m!147899))

(declare-fun m!147901 () Bool)

(assert (=> d!38249 m!147901))

(assert (=> d!38249 m!147201))

(assert (=> bm!13640 m!147897))

(assert (=> b!126750 m!147373))

(declare-fun m!147903 () Bool)

(assert (=> b!126750 m!147903))

(assert (=> b!126750 m!147373))

(assert (=> b!126750 m!147213))

(assert (=> b!126750 m!147419))

(assert (=> b!126750 m!147419))

(assert (=> b!126750 m!147213))

(assert (=> b!126750 m!147421))

(assert (=> b!126749 m!147373))

(assert (=> b!126749 m!147373))

(assert (=> b!126749 m!147375))

(assert (=> b!126746 m!147373))

(assert (=> b!126746 m!147373))

(assert (=> b!126746 m!147375))

(assert (=> b!126744 m!147373))

(assert (=> b!126744 m!147373))

(declare-fun m!147905 () Bool)

(assert (=> b!126744 m!147905))

(declare-fun m!147907 () Bool)

(assert (=> b!126748 m!147907))

(assert (=> b!126413 d!38249))

(declare-fun d!38251 () Bool)

(declare-fun e!82766 () Bool)

(assert (=> d!38251 e!82766))

(declare-fun res!61297 () Bool)

(assert (=> d!38251 (=> (not res!61297) (not e!82766))))

(declare-fun lt!65508 () ListLongMap!1633)

(assert (=> d!38251 (= res!61297 (contains!864 lt!65508 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65509 () List!1678)

(assert (=> d!38251 (= lt!65508 (ListLongMap!1634 lt!65509))))

(declare-fun lt!65511 () Unit!3928)

(declare-fun lt!65510 () Unit!3928)

(assert (=> d!38251 (= lt!65511 lt!65510)))

(assert (=> d!38251 (= (getValueByKey!168 lt!65509 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38251 (= lt!65510 (lemmaContainsTupThenGetReturnValue!83 lt!65509 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38251 (= lt!65509 (insertStrictlySorted!86 (toList!832 lt!65227) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38251 (= (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65508)))

(declare-fun b!126756 () Bool)

(declare-fun res!61296 () Bool)

(assert (=> b!126756 (=> (not res!61296) (not e!82766))))

(assert (=> b!126756 (= res!61296 (= (getValueByKey!168 (toList!832 lt!65508) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126757 () Bool)

(assert (=> b!126757 (= e!82766 (contains!866 (toList!832 lt!65508) (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38251 res!61297) b!126756))

(assert (= (and b!126756 res!61296) b!126757))

(declare-fun m!147909 () Bool)

(assert (=> d!38251 m!147909))

(declare-fun m!147911 () Bool)

(assert (=> d!38251 m!147911))

(declare-fun m!147913 () Bool)

(assert (=> d!38251 m!147913))

(declare-fun m!147915 () Bool)

(assert (=> d!38251 m!147915))

(declare-fun m!147917 () Bool)

(assert (=> b!126756 m!147917))

(declare-fun m!147919 () Bool)

(assert (=> b!126757 m!147919))

(assert (=> b!126413 d!38251))

(declare-fun d!38253 () Bool)

(assert (=> d!38253 (= (apply!111 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65224) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65224)))))

(declare-fun bs!5251 () Bool)

(assert (= bs!5251 d!38253))

(declare-fun m!147921 () Bool)

(assert (=> bs!5251 m!147921))

(assert (=> bs!5251 m!147921))

(declare-fun m!147923 () Bool)

(assert (=> bs!5251 m!147923))

(assert (=> b!126413 d!38253))

(declare-fun d!38255 () Bool)

(assert (=> d!38255 (= (apply!111 lt!65227 lt!65224) (get!1456 (getValueByKey!168 (toList!832 lt!65227) lt!65224)))))

(declare-fun bs!5252 () Bool)

(assert (= bs!5252 d!38255))

(declare-fun m!147925 () Bool)

(assert (=> bs!5252 m!147925))

(assert (=> bs!5252 m!147925))

(declare-fun m!147927 () Bool)

(assert (=> bs!5252 m!147927))

(assert (=> b!126413 d!38255))

(declare-fun d!38257 () Bool)

(assert (=> d!38257 (= (apply!111 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65212) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65212)))))

(declare-fun bs!5253 () Bool)

(assert (= bs!5253 d!38257))

(declare-fun m!147929 () Bool)

(assert (=> bs!5253 m!147929))

(assert (=> bs!5253 m!147929))

(declare-fun m!147931 () Bool)

(assert (=> bs!5253 m!147931))

(assert (=> b!126413 d!38257))

(declare-fun d!38259 () Bool)

(declare-fun e!82768 () Bool)

(assert (=> d!38259 e!82768))

(declare-fun res!61298 () Bool)

(assert (=> d!38259 (=> res!61298 e!82768)))

(declare-fun lt!65513 () Bool)

(assert (=> d!38259 (= res!61298 (not lt!65513))))

(declare-fun lt!65512 () Bool)

(assert (=> d!38259 (= lt!65513 lt!65512)))

(declare-fun lt!65515 () Unit!3928)

(declare-fun e!82767 () Unit!3928)

(assert (=> d!38259 (= lt!65515 e!82767)))

(declare-fun c!23191 () Bool)

(assert (=> d!38259 (= c!23191 lt!65512)))

(assert (=> d!38259 (= lt!65512 (containsKey!171 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230))))

(assert (=> d!38259 (= (contains!864 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65230) lt!65513)))

(declare-fun b!126758 () Bool)

(declare-fun lt!65514 () Unit!3928)

(assert (=> b!126758 (= e!82767 lt!65514)))

(assert (=> b!126758 (= lt!65514 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230))))

(assert (=> b!126758 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230))))

(declare-fun b!126759 () Bool)

(declare-fun Unit!3944 () Unit!3928)

(assert (=> b!126759 (= e!82767 Unit!3944)))

(declare-fun b!126760 () Bool)

(assert (=> b!126760 (= e!82768 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230)))))

(assert (= (and d!38259 c!23191) b!126758))

(assert (= (and d!38259 (not c!23191)) b!126759))

(assert (= (and d!38259 (not res!61298)) b!126760))

(declare-fun m!147933 () Bool)

(assert (=> d!38259 m!147933))

(declare-fun m!147935 () Bool)

(assert (=> b!126758 m!147935))

(declare-fun m!147937 () Bool)

(assert (=> b!126758 m!147937))

(assert (=> b!126758 m!147937))

(declare-fun m!147939 () Bool)

(assert (=> b!126758 m!147939))

(assert (=> b!126760 m!147937))

(assert (=> b!126760 m!147937))

(assert (=> b!126760 m!147939))

(assert (=> b!126413 d!38259))

(declare-fun d!38261 () Bool)

(assert (=> d!38261 (= (get!1455 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126354 d!38261))

(declare-fun d!38263 () Bool)

(declare-fun e!82771 () Bool)

(assert (=> d!38263 e!82771))

(declare-fun res!61301 () Bool)

(assert (=> d!38263 (=> (not res!61301) (not e!82771))))

(assert (=> d!38263 (= res!61301 (and (bvsge (index!3212 lt!65160) #b00000000000000000000000000000000) (bvslt (index!3212 lt!65160) (size!2480 (_keys!4515 newMap!16)))))))

(declare-fun lt!65518 () Unit!3928)

(declare-fun choose!774 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) Int) Unit!3928)

(assert (=> d!38263 (= lt!65518 (choose!774 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3212 lt!65160) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38263 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38263 (= (lemmaValidKeyInArrayIsInListMap!116 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3212 lt!65160) (defaultEntry!2782 newMap!16)) lt!65518)))

(declare-fun b!126763 () Bool)

(assert (=> b!126763 (= e!82771 (contains!864 (getCurrentListMap!512 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))))

(assert (= (and d!38263 res!61301) b!126763))

(declare-fun m!147941 () Bool)

(assert (=> d!38263 m!147941))

(assert (=> d!38263 m!147517))

(declare-fun m!147943 () Bool)

(assert (=> b!126763 m!147943))

(assert (=> b!126763 m!147365))

(assert (=> b!126763 m!147943))

(assert (=> b!126763 m!147365))

(declare-fun m!147945 () Bool)

(assert (=> b!126763 m!147945))

(assert (=> b!126326 d!38263))

(declare-fun d!38265 () Bool)

(declare-fun e!82774 () Bool)

(assert (=> d!38265 e!82774))

(declare-fun res!61304 () Bool)

(assert (=> d!38265 (=> (not res!61304) (not e!82774))))

(assert (=> d!38265 (= res!61304 (and (bvsge (index!3212 lt!65160) #b00000000000000000000000000000000) (bvslt (index!3212 lt!65160) (size!2481 (_values!2765 newMap!16)))))))

(declare-fun lt!65521 () Unit!3928)

(declare-fun choose!775 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) (_ BitVec 64) V!3433 Int) Unit!3928)

(assert (=> d!38265 (= lt!65521 (choose!775 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3212 lt!65160) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38265 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38265 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3212 lt!65160) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) lt!65521)))

(declare-fun b!126766 () Bool)

(assert (=> b!126766 (= e!82774 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!512 (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))))

(assert (= (and d!38265 res!61304) b!126766))

(assert (=> d!38265 m!147207))

(assert (=> d!38265 m!147215))

(declare-fun m!147947 () Bool)

(assert (=> d!38265 m!147947))

(assert (=> d!38265 m!147517))

(assert (=> b!126766 m!147325))

(assert (=> b!126766 m!147325))

(assert (=> b!126766 m!147473))

(assert (=> b!126766 m!147319))

(declare-fun m!147949 () Bool)

(assert (=> b!126766 m!147949))

(assert (=> b!126326 d!38265))

(declare-fun d!38267 () Bool)

(declare-fun e!82776 () Bool)

(assert (=> d!38267 e!82776))

(declare-fun res!61305 () Bool)

(assert (=> d!38267 (=> res!61305 e!82776)))

(declare-fun lt!65523 () Bool)

(assert (=> d!38267 (= res!61305 (not lt!65523))))

(declare-fun lt!65522 () Bool)

(assert (=> d!38267 (= lt!65523 lt!65522)))

(declare-fun lt!65525 () Unit!3928)

(declare-fun e!82775 () Unit!3928)

(assert (=> d!38267 (= lt!65525 e!82775)))

(declare-fun c!23192 () Bool)

(assert (=> d!38267 (= c!23192 lt!65522)))

(assert (=> d!38267 (= lt!65522 (containsKey!171 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38267 (= (contains!864 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65523)))

(declare-fun b!126767 () Bool)

(declare-fun lt!65524 () Unit!3928)

(assert (=> b!126767 (= e!82775 lt!65524)))

(assert (=> b!126767 (= lt!65524 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126767 (isDefined!120 (getValueByKey!168 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126768 () Bool)

(declare-fun Unit!3945 () Unit!3928)

(assert (=> b!126768 (= e!82775 Unit!3945)))

(declare-fun b!126769 () Bool)

(assert (=> b!126769 (= e!82776 (isDefined!120 (getValueByKey!168 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (= (and d!38267 c!23192) b!126767))

(assert (= (and d!38267 (not c!23192)) b!126768))

(assert (= (and d!38267 (not res!61305)) b!126769))

(assert (=> d!38267 m!147207))

(declare-fun m!147951 () Bool)

(assert (=> d!38267 m!147951))

(assert (=> b!126767 m!147207))

(declare-fun m!147953 () Bool)

(assert (=> b!126767 m!147953))

(assert (=> b!126767 m!147207))

(declare-fun m!147955 () Bool)

(assert (=> b!126767 m!147955))

(assert (=> b!126767 m!147955))

(declare-fun m!147957 () Bool)

(assert (=> b!126767 m!147957))

(assert (=> b!126769 m!147207))

(assert (=> b!126769 m!147955))

(assert (=> b!126769 m!147955))

(assert (=> b!126769 m!147957))

(assert (=> b!126326 d!38267))

(assert (=> b!126326 d!38183))

(assert (=> bm!13584 d!38249))

(declare-fun d!38269 () Bool)

(declare-fun e!82778 () Bool)

(assert (=> d!38269 e!82778))

(declare-fun res!61306 () Bool)

(assert (=> d!38269 (=> res!61306 e!82778)))

(declare-fun lt!65527 () Bool)

(assert (=> d!38269 (= res!61306 (not lt!65527))))

(declare-fun lt!65526 () Bool)

(assert (=> d!38269 (= lt!65527 lt!65526)))

(declare-fun lt!65529 () Unit!3928)

(declare-fun e!82777 () Unit!3928)

(assert (=> d!38269 (= lt!65529 e!82777)))

(declare-fun c!23193 () Bool)

(assert (=> d!38269 (= c!23193 lt!65526)))

(assert (=> d!38269 (= lt!65526 (containsKey!171 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(assert (=> d!38269 (= (contains!864 e!82525 (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))) lt!65527)))

(declare-fun b!126770 () Bool)

(declare-fun lt!65528 () Unit!3928)

(assert (=> b!126770 (= e!82777 lt!65528)))

(assert (=> b!126770 (= lt!65528 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(assert (=> b!126770 (isDefined!120 (getValueByKey!168 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(declare-fun b!126771 () Bool)

(declare-fun Unit!3946 () Unit!3928)

(assert (=> b!126771 (= e!82777 Unit!3946)))

(declare-fun b!126772 () Bool)

(assert (=> b!126772 (= e!82778 (isDefined!120 (getValueByKey!168 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))))))

(assert (= (and d!38269 c!23193) b!126770))

(assert (= (and d!38269 (not c!23193)) b!126771))

(assert (= (and d!38269 (not res!61306)) b!126772))

(declare-fun m!147959 () Bool)

(assert (=> d!38269 m!147959))

(declare-fun m!147961 () Bool)

(assert (=> b!126770 m!147961))

(declare-fun m!147963 () Bool)

(assert (=> b!126770 m!147963))

(assert (=> b!126770 m!147963))

(declare-fun m!147965 () Bool)

(assert (=> b!126770 m!147965))

(assert (=> b!126772 m!147963))

(assert (=> b!126772 m!147963))

(assert (=> b!126772 m!147965))

(assert (=> bm!13550 d!38269))

(declare-fun d!38271 () Bool)

(declare-fun e!82779 () Bool)

(assert (=> d!38271 e!82779))

(declare-fun res!61308 () Bool)

(assert (=> d!38271 (=> (not res!61308) (not e!82779))))

(declare-fun lt!65530 () ListLongMap!1633)

(assert (=> d!38271 (= res!61308 (contains!864 lt!65530 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun lt!65531 () List!1678)

(assert (=> d!38271 (= lt!65530 (ListLongMap!1634 lt!65531))))

(declare-fun lt!65533 () Unit!3928)

(declare-fun lt!65532 () Unit!3928)

(assert (=> d!38271 (= lt!65533 lt!65532)))

(assert (=> d!38271 (= (getValueByKey!168 lt!65531 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) (Some!173 (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38271 (= lt!65532 (lemmaContainsTupThenGetReturnValue!83 lt!65531 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38271 (= lt!65531 (insertStrictlySorted!86 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592))) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38271 (= (+!164 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)) (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65530)))

(declare-fun b!126773 () Bool)

(declare-fun res!61307 () Bool)

(assert (=> b!126773 (=> (not res!61307) (not e!82779))))

(assert (=> b!126773 (= res!61307 (= (getValueByKey!168 (toList!832 lt!65530) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) (Some!173 (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!126774 () Bool)

(assert (=> b!126774 (= e!82779 (contains!866 (toList!832 lt!65530) (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (= (and d!38271 res!61308) b!126773))

(assert (= (and b!126773 res!61307) b!126774))

(declare-fun m!147967 () Bool)

(assert (=> d!38271 m!147967))

(declare-fun m!147969 () Bool)

(assert (=> d!38271 m!147969))

(declare-fun m!147971 () Bool)

(assert (=> d!38271 m!147971))

(declare-fun m!147973 () Bool)

(assert (=> d!38271 m!147973))

(declare-fun m!147975 () Bool)

(assert (=> b!126773 m!147975))

(declare-fun m!147977 () Bool)

(assert (=> b!126774 m!147977))

(assert (=> bm!13583 d!38271))

(declare-fun condMapEmpty!4511 () Bool)

(declare-fun mapDefault!4511 () ValueCell!1076)

(assert (=> mapNonEmpty!4509 (= condMapEmpty!4511 (= mapRest!4509 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4511)))))

(declare-fun e!82780 () Bool)

(declare-fun mapRes!4511 () Bool)

(assert (=> mapNonEmpty!4509 (= tp!10971 (and e!82780 mapRes!4511))))

(declare-fun b!126775 () Bool)

(declare-fun e!82781 () Bool)

(assert (=> b!126775 (= e!82781 tp_is_empty!2839)))

(declare-fun mapNonEmpty!4511 () Bool)

(declare-fun tp!10973 () Bool)

(assert (=> mapNonEmpty!4511 (= mapRes!4511 (and tp!10973 e!82781))))

(declare-fun mapRest!4511 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapKey!4511 () (_ BitVec 32))

(declare-fun mapValue!4511 () ValueCell!1076)

(assert (=> mapNonEmpty!4511 (= mapRest!4509 (store mapRest!4511 mapKey!4511 mapValue!4511))))

(declare-fun b!126776 () Bool)

(assert (=> b!126776 (= e!82780 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4511 () Bool)

(assert (=> mapIsEmpty!4511 mapRes!4511))

(assert (= (and mapNonEmpty!4509 condMapEmpty!4511) mapIsEmpty!4511))

(assert (= (and mapNonEmpty!4509 (not condMapEmpty!4511)) mapNonEmpty!4511))

(assert (= (and mapNonEmpty!4511 ((_ is ValueCellFull!1076) mapValue!4511)) b!126775))

(assert (= (and mapNonEmpty!4509 ((_ is ValueCellFull!1076) mapDefault!4511)) b!126776))

(declare-fun m!147979 () Bool)

(assert (=> mapNonEmpty!4511 m!147979))

(declare-fun condMapEmpty!4512 () Bool)

(declare-fun mapDefault!4512 () ValueCell!1076)

(assert (=> mapNonEmpty!4510 (= condMapEmpty!4512 (= mapRest!4510 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4512)))))

(declare-fun e!82782 () Bool)

(declare-fun mapRes!4512 () Bool)

(assert (=> mapNonEmpty!4510 (= tp!10972 (and e!82782 mapRes!4512))))

(declare-fun b!126777 () Bool)

(declare-fun e!82783 () Bool)

(assert (=> b!126777 (= e!82783 tp_is_empty!2839)))

(declare-fun mapNonEmpty!4512 () Bool)

(declare-fun tp!10974 () Bool)

(assert (=> mapNonEmpty!4512 (= mapRes!4512 (and tp!10974 e!82783))))

(declare-fun mapRest!4512 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapValue!4512 () ValueCell!1076)

(declare-fun mapKey!4512 () (_ BitVec 32))

(assert (=> mapNonEmpty!4512 (= mapRest!4510 (store mapRest!4512 mapKey!4512 mapValue!4512))))

(declare-fun b!126778 () Bool)

(assert (=> b!126778 (= e!82782 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4512 () Bool)

(assert (=> mapIsEmpty!4512 mapRes!4512))

(assert (= (and mapNonEmpty!4510 condMapEmpty!4512) mapIsEmpty!4512))

(assert (= (and mapNonEmpty!4510 (not condMapEmpty!4512)) mapNonEmpty!4512))

(assert (= (and mapNonEmpty!4512 ((_ is ValueCellFull!1076) mapValue!4512)) b!126777))

(assert (= (and mapNonEmpty!4510 ((_ is ValueCellFull!1076) mapDefault!4512)) b!126778))

(declare-fun m!147981 () Bool)

(assert (=> mapNonEmpty!4512 m!147981))

(declare-fun b_lambda!5587 () Bool)

(assert (= b_lambda!5581 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5587)))

(declare-fun b_lambda!5589 () Bool)

(assert (= b_lambda!5579 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5589)))

(declare-fun b_lambda!5591 () Bool)

(assert (= b_lambda!5585 (or (and b!126102 b_free!2845) (and b!126097 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))))) b_lambda!5591)))

(declare-fun b_lambda!5593 () Bool)

(assert (= b_lambda!5583 (or (and b!126102 b_free!2845) (and b!126097 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))))) b_lambda!5593)))

(declare-fun b_lambda!5595 () Bool)

(assert (= b_lambda!5577 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5595)))

(check-sat (not b!126676) (not b!126772) (not b!126753) (not b!126515) (not d!38217) (not b!126763) (not b!126561) (not d!38237) (not d!38195) (not b!126773) (not d!38165) (not d!38235) (not b!126704) (not bm!13640) b_and!7803 (not b!126774) (not bm!13600) (not d!38257) (not d!38205) (not d!38231) (not b!126474) (not b!126747) (not b!126521) (not b_lambda!5593) (not b!126713) (not d!38181) (not b!126620) (not b!126669) (not d!38203) (not b!126499) (not b!126687) (not b_lambda!5589) (not b_lambda!5587) (not d!38259) (not b!126518) (not b!126503) (not bm!13601) (not d!38223) (not d!38183) (not b!126673) (not d!38267) (not b!126744) (not d!38249) (not d!38263) (not b!126601) (not d!38241) (not b!126718) (not bm!13613) (not b!126668) (not b!126706) (not b!126582) (not d!38171) (not b!126717) (not b!126756) (not b!126572) (not b!126623) (not bm!13608) (not b!126471) (not b!126758) (not d!38219) (not b!126647) (not d!38253) (not d!38239) (not d!38251) (not b_lambda!5591) (not b!126649) (not bm!13616) (not b!126769) (not bm!13637) (not b!126534) (not b!126502) (not d!38247) (not b!126614) (not d!38169) (not b_lambda!5571) (not b!126580) (not b_lambda!5575) (not bm!13624) (not d!38177) (not b!126600) (not d!38191) (not b!126750) (not b!126565) (not d!38159) (not bm!13632) (not d!38215) (not b!126684) (not bm!13614) (not d!38269) (not d!38201) (not d!38243) (not b!126577) (not b!126708) (not d!38227) (not b!126663) (not bm!13630) (not b!126527) (not d!38167) (not bm!13627) (not b!126770) (not b!126702) (not b!126757) (not b!126767) (not b!126484) (not d!38229) (not b!126626) (not bm!13598) (not b!126516) (not bm!13604) (not b!126522) b_and!7801 (not b!126493) (not b!126602) (not bm!13631) (not d!38255) (not b!126510) (not b!126512) (not b_lambda!5595) (not b!126564) (not b_next!2845) (not b!126476) (not bm!13602) (not b!126760) (not b!126701) (not b!126707) (not d!38211) (not d!38233) (not mapNonEmpty!4512) (not d!38185) (not bm!13615) (not b!126670) (not bm!13603) (not b!126714) (not b_next!2847) (not bm!13621) (not b!126666) (not b!126520) (not d!38163) (not b!126575) (not d!38175) (not b!126746) (not b!126689) (not b!126574) (not b!126492) (not b!126665) (not bm!13633) (not b!126496) (not bm!13617) (not d!38271) (not b!126690) (not d!38221) (not b!126677) (not b!126487) (not b!126513) (not b!126494) (not b!126622) (not b!126749) (not b!126519) (not d!38265) (not d!38187) (not b!126472) (not b!126748) (not b!126745) (not d!38245) (not b!126621) (not b!126664) tp_is_empty!2839 (not b!126578) (not b!126766) (not d!38189) (not mapNonEmpty!4511) (not b!126637) (not b!126686))
(check-sat b_and!7801 b_and!7803 (not b_next!2845) (not b_next!2847))
(get-model)

(declare-fun d!38273 () Bool)

(assert (=> d!38273 (= (apply!111 (+!164 lt!65379 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16))) lt!65377) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65379 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16)))) lt!65377)))))

(declare-fun bs!5254 () Bool)

(assert (= bs!5254 d!38273))

(declare-fun m!147983 () Bool)

(assert (=> bs!5254 m!147983))

(assert (=> bs!5254 m!147983))

(declare-fun m!147985 () Bool)

(assert (=> bs!5254 m!147985))

(assert (=> b!126575 d!38273))

(declare-fun d!38275 () Bool)

(assert (=> d!38275 (= (apply!111 (+!164 lt!65379 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16))) lt!65377) (apply!111 lt!65379 lt!65377))))

(declare-fun lt!65534 () Unit!3928)

(assert (=> d!38275 (= lt!65534 (choose!772 lt!65379 lt!65387 (zeroValue!2645 newMap!16) lt!65377))))

(declare-fun e!82784 () Bool)

(assert (=> d!38275 e!82784))

(declare-fun res!61309 () Bool)

(assert (=> d!38275 (=> (not res!61309) (not e!82784))))

(assert (=> d!38275 (= res!61309 (contains!864 lt!65379 lt!65377))))

(assert (=> d!38275 (= (addApplyDifferent!87 lt!65379 lt!65387 (zeroValue!2645 newMap!16) lt!65377) lt!65534)))

(declare-fun b!126779 () Bool)

(assert (=> b!126779 (= e!82784 (not (= lt!65377 lt!65387)))))

(assert (= (and d!38275 res!61309) b!126779))

(assert (=> d!38275 m!147617))

(assert (=> d!38275 m!147617))

(assert (=> d!38275 m!147633))

(declare-fun m!147987 () Bool)

(assert (=> d!38275 m!147987))

(assert (=> d!38275 m!147615))

(declare-fun m!147989 () Bool)

(assert (=> d!38275 m!147989))

(assert (=> b!126575 d!38275))

(declare-fun d!38277 () Bool)

(assert (=> d!38277 (contains!864 (+!164 lt!65378 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16))) lt!65395)))

(declare-fun lt!65535 () Unit!3928)

(assert (=> d!38277 (= lt!65535 (choose!773 lt!65378 lt!65397 (zeroValue!2645 newMap!16) lt!65395))))

(assert (=> d!38277 (contains!864 lt!65378 lt!65395)))

(assert (=> d!38277 (= (addStillContains!87 lt!65378 lt!65397 (zeroValue!2645 newMap!16) lt!65395) lt!65535)))

(declare-fun bs!5255 () Bool)

(assert (= bs!5255 d!38277))

(assert (=> bs!5255 m!147637))

(assert (=> bs!5255 m!147637))

(assert (=> bs!5255 m!147639))

(declare-fun m!147991 () Bool)

(assert (=> bs!5255 m!147991))

(declare-fun m!147993 () Bool)

(assert (=> bs!5255 m!147993))

(assert (=> b!126575 d!38277))

(declare-fun d!38279 () Bool)

(declare-fun e!82785 () Bool)

(assert (=> d!38279 e!82785))

(declare-fun res!61311 () Bool)

(assert (=> d!38279 (=> (not res!61311) (not e!82785))))

(declare-fun lt!65536 () ListLongMap!1633)

(assert (=> d!38279 (= res!61311 (contains!864 lt!65536 (_1!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16)))))))

(declare-fun lt!65537 () List!1678)

(assert (=> d!38279 (= lt!65536 (ListLongMap!1634 lt!65537))))

(declare-fun lt!65539 () Unit!3928)

(declare-fun lt!65538 () Unit!3928)

(assert (=> d!38279 (= lt!65539 lt!65538)))

(assert (=> d!38279 (= (getValueByKey!168 lt!65537 (_1!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38279 (= lt!65538 (lemmaContainsTupThenGetReturnValue!83 lt!65537 (_1!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38279 (= lt!65537 (insertStrictlySorted!86 (toList!832 lt!65379) (_1!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38279 (= (+!164 lt!65379 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16))) lt!65536)))

(declare-fun b!126780 () Bool)

(declare-fun res!61310 () Bool)

(assert (=> b!126780 (=> (not res!61310) (not e!82785))))

(assert (=> b!126780 (= res!61310 (= (getValueByKey!168 (toList!832 lt!65536) (_1!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16))))))))

(declare-fun b!126781 () Bool)

(assert (=> b!126781 (= e!82785 (contains!866 (toList!832 lt!65536) (tuple2!2525 lt!65387 (zeroValue!2645 newMap!16))))))

(assert (= (and d!38279 res!61311) b!126780))

(assert (= (and b!126780 res!61310) b!126781))

(declare-fun m!147995 () Bool)

(assert (=> d!38279 m!147995))

(declare-fun m!147997 () Bool)

(assert (=> d!38279 m!147997))

(declare-fun m!147999 () Bool)

(assert (=> d!38279 m!147999))

(declare-fun m!148001 () Bool)

(assert (=> d!38279 m!148001))

(declare-fun m!148003 () Bool)

(assert (=> b!126780 m!148003))

(declare-fun m!148005 () Bool)

(assert (=> b!126781 m!148005))

(assert (=> b!126575 d!38279))

(declare-fun d!38281 () Bool)

(assert (=> d!38281 (= (apply!111 (+!164 lt!65388 (tuple2!2525 lt!65381 (minValue!2645 newMap!16))) lt!65391) (apply!111 lt!65388 lt!65391))))

(declare-fun lt!65540 () Unit!3928)

(assert (=> d!38281 (= lt!65540 (choose!772 lt!65388 lt!65381 (minValue!2645 newMap!16) lt!65391))))

(declare-fun e!82786 () Bool)

(assert (=> d!38281 e!82786))

(declare-fun res!61312 () Bool)

(assert (=> d!38281 (=> (not res!61312) (not e!82786))))

(assert (=> d!38281 (= res!61312 (contains!864 lt!65388 lt!65391))))

(assert (=> d!38281 (= (addApplyDifferent!87 lt!65388 lt!65381 (minValue!2645 newMap!16) lt!65391) lt!65540)))

(declare-fun b!126782 () Bool)

(assert (=> b!126782 (= e!82786 (not (= lt!65391 lt!65381)))))

(assert (= (and d!38281 res!61312) b!126782))

(assert (=> d!38281 m!147621))

(assert (=> d!38281 m!147621))

(assert (=> d!38281 m!147623))

(declare-fun m!148007 () Bool)

(assert (=> d!38281 m!148007))

(assert (=> d!38281 m!147619))

(declare-fun m!148009 () Bool)

(assert (=> d!38281 m!148009))

(assert (=> b!126575 d!38281))

(declare-fun d!38283 () Bool)

(assert (=> d!38283 (= (apply!111 (+!164 lt!65392 (tuple2!2525 lt!65383 (minValue!2645 newMap!16))) lt!65389) (apply!111 lt!65392 lt!65389))))

(declare-fun lt!65541 () Unit!3928)

(assert (=> d!38283 (= lt!65541 (choose!772 lt!65392 lt!65383 (minValue!2645 newMap!16) lt!65389))))

(declare-fun e!82787 () Bool)

(assert (=> d!38283 e!82787))

(declare-fun res!61313 () Bool)

(assert (=> d!38283 (=> (not res!61313) (not e!82787))))

(assert (=> d!38283 (= res!61313 (contains!864 lt!65392 lt!65389))))

(assert (=> d!38283 (= (addApplyDifferent!87 lt!65392 lt!65383 (minValue!2645 newMap!16) lt!65389) lt!65541)))

(declare-fun b!126783 () Bool)

(assert (=> b!126783 (= e!82787 (not (= lt!65389 lt!65383)))))

(assert (= (and d!38283 res!61313) b!126783))

(assert (=> d!38283 m!147625))

(assert (=> d!38283 m!147625))

(assert (=> d!38283 m!147627))

(declare-fun m!148011 () Bool)

(assert (=> d!38283 m!148011))

(assert (=> d!38283 m!147635))

(declare-fun m!148013 () Bool)

(assert (=> d!38283 m!148013))

(assert (=> b!126575 d!38283))

(declare-fun d!38285 () Bool)

(declare-fun e!82788 () Bool)

(assert (=> d!38285 e!82788))

(declare-fun res!61315 () Bool)

(assert (=> d!38285 (=> (not res!61315) (not e!82788))))

(declare-fun lt!65542 () ListLongMap!1633)

(assert (=> d!38285 (= res!61315 (contains!864 lt!65542 (_1!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))))))

(declare-fun lt!65543 () List!1678)

(assert (=> d!38285 (= lt!65542 (ListLongMap!1634 lt!65543))))

(declare-fun lt!65545 () Unit!3928)

(declare-fun lt!65544 () Unit!3928)

(assert (=> d!38285 (= lt!65545 lt!65544)))

(assert (=> d!38285 (= (getValueByKey!168 lt!65543 (_1!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38285 (= lt!65544 (lemmaContainsTupThenGetReturnValue!83 lt!65543 (_1!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38285 (= lt!65543 (insertStrictlySorted!86 (toList!832 lt!65378) (_1!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38285 (= (+!164 lt!65378 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16))) lt!65542)))

(declare-fun b!126784 () Bool)

(declare-fun res!61314 () Bool)

(assert (=> b!126784 (=> (not res!61314) (not e!82788))))

(assert (=> b!126784 (= res!61314 (= (getValueByKey!168 (toList!832 lt!65542) (_1!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16))))))))

(declare-fun b!126785 () Bool)

(assert (=> b!126785 (= e!82788 (contains!866 (toList!832 lt!65542) (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16))))))

(assert (= (and d!38285 res!61315) b!126784))

(assert (= (and b!126784 res!61314) b!126785))

(declare-fun m!148015 () Bool)

(assert (=> d!38285 m!148015))

(declare-fun m!148017 () Bool)

(assert (=> d!38285 m!148017))

(declare-fun m!148019 () Bool)

(assert (=> d!38285 m!148019))

(declare-fun m!148021 () Bool)

(assert (=> d!38285 m!148021))

(declare-fun m!148023 () Bool)

(assert (=> b!126784 m!148023))

(declare-fun m!148025 () Bool)

(assert (=> b!126785 m!148025))

(assert (=> b!126575 d!38285))

(declare-fun d!38287 () Bool)

(assert (=> d!38287 (= (apply!111 lt!65379 lt!65377) (get!1456 (getValueByKey!168 (toList!832 lt!65379) lt!65377)))))

(declare-fun bs!5256 () Bool)

(assert (= bs!5256 d!38287))

(declare-fun m!148027 () Bool)

(assert (=> bs!5256 m!148027))

(assert (=> bs!5256 m!148027))

(declare-fun m!148029 () Bool)

(assert (=> bs!5256 m!148029))

(assert (=> b!126575 d!38287))

(declare-fun d!38289 () Bool)

(assert (=> d!38289 (= (apply!111 lt!65392 lt!65389) (get!1456 (getValueByKey!168 (toList!832 lt!65392) lt!65389)))))

(declare-fun bs!5257 () Bool)

(assert (= bs!5257 d!38289))

(declare-fun m!148031 () Bool)

(assert (=> bs!5257 m!148031))

(assert (=> bs!5257 m!148031))

(declare-fun m!148033 () Bool)

(assert (=> bs!5257 m!148033))

(assert (=> b!126575 d!38289))

(declare-fun d!38291 () Bool)

(assert (=> d!38291 (= (apply!111 (+!164 lt!65388 (tuple2!2525 lt!65381 (minValue!2645 newMap!16))) lt!65391) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65388 (tuple2!2525 lt!65381 (minValue!2645 newMap!16)))) lt!65391)))))

(declare-fun bs!5258 () Bool)

(assert (= bs!5258 d!38291))

(declare-fun m!148035 () Bool)

(assert (=> bs!5258 m!148035))

(assert (=> bs!5258 m!148035))

(declare-fun m!148037 () Bool)

(assert (=> bs!5258 m!148037))

(assert (=> b!126575 d!38291))

(declare-fun b!126786 () Bool)

(declare-fun e!82789 () Bool)

(declare-fun e!82790 () Bool)

(assert (=> b!126786 (= e!82789 e!82790)))

(assert (=> b!126786 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun res!61319 () Bool)

(declare-fun lt!65546 () ListLongMap!1633)

(assert (=> b!126786 (= res!61319 (contains!864 lt!65546 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126786 (=> (not res!61319) (not e!82790))))

(declare-fun b!126787 () Bool)

(declare-fun e!82794 () Bool)

(assert (=> b!126787 (= e!82794 (= lt!65546 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16))))))

(declare-fun bm!13641 () Bool)

(declare-fun call!13644 () ListLongMap!1633)

(assert (=> bm!13641 (= call!13644 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16)))))

(declare-fun b!126788 () Bool)

(declare-fun e!82793 () ListLongMap!1633)

(declare-fun e!82795 () ListLongMap!1633)

(assert (=> b!126788 (= e!82793 e!82795)))

(declare-fun c!23196 () Bool)

(assert (=> b!126788 (= c!23196 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126789 () Bool)

(declare-fun lt!65550 () Unit!3928)

(declare-fun lt!65549 () Unit!3928)

(assert (=> b!126789 (= lt!65550 lt!65549)))

(declare-fun lt!65551 () ListLongMap!1633)

(declare-fun lt!65548 () (_ BitVec 64))

(declare-fun lt!65547 () (_ BitVec 64))

(declare-fun lt!65552 () V!3433)

(assert (=> b!126789 (not (contains!864 (+!164 lt!65551 (tuple2!2525 lt!65547 lt!65552)) lt!65548))))

(assert (=> b!126789 (= lt!65549 (addStillNotContains!58 lt!65551 lt!65547 lt!65552 lt!65548))))

(assert (=> b!126789 (= lt!65548 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126789 (= lt!65552 (get!1452 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126789 (= lt!65547 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126789 (= lt!65551 call!13644)))

(assert (=> b!126789 (= e!82795 (+!164 call!13644 (tuple2!2525 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (get!1452 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38293 () Bool)

(declare-fun e!82792 () Bool)

(assert (=> d!38293 e!82792))

(declare-fun res!61317 () Bool)

(assert (=> d!38293 (=> (not res!61317) (not e!82792))))

(assert (=> d!38293 (= res!61317 (not (contains!864 lt!65546 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38293 (= lt!65546 e!82793)))

(declare-fun c!23195 () Bool)

(assert (=> d!38293 (= c!23195 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38293 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38293 (= (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65546)))

(declare-fun b!126790 () Bool)

(declare-fun res!61318 () Bool)

(assert (=> b!126790 (=> (not res!61318) (not e!82792))))

(assert (=> b!126790 (= res!61318 (not (contains!864 lt!65546 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126791 () Bool)

(declare-fun e!82791 () Bool)

(assert (=> b!126791 (= e!82791 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126791 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!126792 () Bool)

(assert (=> b!126792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> b!126792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (_values!2765 newMap!16))))))

(assert (=> b!126792 (= e!82790 (= (apply!111 lt!65546 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126793 () Bool)

(assert (=> b!126793 (= e!82795 call!13644)))

(declare-fun b!126794 () Bool)

(assert (=> b!126794 (= e!82789 e!82794)))

(declare-fun c!23194 () Bool)

(assert (=> b!126794 (= c!23194 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126795 () Bool)

(assert (=> b!126795 (= e!82794 (isEmpty!403 lt!65546))))

(declare-fun b!126796 () Bool)

(assert (=> b!126796 (= e!82792 e!82789)))

(declare-fun c!23197 () Bool)

(assert (=> b!126796 (= c!23197 e!82791)))

(declare-fun res!61316 () Bool)

(assert (=> b!126796 (=> (not res!61316) (not e!82791))))

(assert (=> b!126796 (= res!61316 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126797 () Bool)

(assert (=> b!126797 (= e!82793 (ListLongMap!1634 Nil!1675))))

(assert (= (and d!38293 c!23195) b!126797))

(assert (= (and d!38293 (not c!23195)) b!126788))

(assert (= (and b!126788 c!23196) b!126789))

(assert (= (and b!126788 (not c!23196)) b!126793))

(assert (= (or b!126789 b!126793) bm!13641))

(assert (= (and d!38293 res!61317) b!126790))

(assert (= (and b!126790 res!61318) b!126796))

(assert (= (and b!126796 res!61316) b!126791))

(assert (= (and b!126796 c!23197) b!126786))

(assert (= (and b!126796 (not c!23197)) b!126794))

(assert (= (and b!126786 res!61319) b!126792))

(assert (= (and b!126794 c!23194) b!126787))

(assert (= (and b!126794 (not c!23194)) b!126795))

(declare-fun b_lambda!5597 () Bool)

(assert (=> (not b_lambda!5597) (not b!126789)))

(assert (=> b!126789 t!6029))

(declare-fun b_and!7805 () Bool)

(assert (= b_and!7801 (and (=> t!6029 result!3843) b_and!7805)))

(assert (=> b!126789 t!6031))

(declare-fun b_and!7807 () Bool)

(assert (= b_and!7803 (and (=> t!6031 result!3845) b_and!7807)))

(declare-fun b_lambda!5599 () Bool)

(assert (=> (not b_lambda!5599) (not b!126792)))

(assert (=> b!126792 t!6029))

(declare-fun b_and!7809 () Bool)

(assert (= b_and!7805 (and (=> t!6029 result!3843) b_and!7809)))

(assert (=> b!126792 t!6031))

(declare-fun b_and!7811 () Bool)

(assert (= b_and!7807 (and (=> t!6031 result!3845) b_and!7811)))

(declare-fun m!148039 () Bool)

(assert (=> b!126789 m!148039))

(assert (=> b!126789 m!147525))

(declare-fun m!148041 () Bool)

(assert (=> b!126789 m!148041))

(assert (=> b!126789 m!148039))

(declare-fun m!148043 () Bool)

(assert (=> b!126789 m!148043))

(assert (=> b!126789 m!147569))

(assert (=> b!126789 m!147657))

(assert (=> b!126789 m!147657))

(assert (=> b!126789 m!147569))

(assert (=> b!126789 m!147659))

(declare-fun m!148045 () Bool)

(assert (=> b!126789 m!148045))

(declare-fun m!148047 () Bool)

(assert (=> b!126787 m!148047))

(declare-fun m!148049 () Bool)

(assert (=> b!126795 m!148049))

(declare-fun m!148051 () Bool)

(assert (=> d!38293 m!148051))

(assert (=> d!38293 m!147517))

(assert (=> bm!13641 m!148047))

(assert (=> b!126792 m!147525))

(declare-fun m!148053 () Bool)

(assert (=> b!126792 m!148053))

(assert (=> b!126792 m!147525))

(assert (=> b!126792 m!147569))

(assert (=> b!126792 m!147657))

(assert (=> b!126792 m!147657))

(assert (=> b!126792 m!147569))

(assert (=> b!126792 m!147659))

(assert (=> b!126791 m!147525))

(assert (=> b!126791 m!147525))

(assert (=> b!126791 m!147527))

(assert (=> b!126788 m!147525))

(assert (=> b!126788 m!147525))

(assert (=> b!126788 m!147527))

(assert (=> b!126786 m!147525))

(assert (=> b!126786 m!147525))

(declare-fun m!148055 () Bool)

(assert (=> b!126786 m!148055))

(declare-fun m!148057 () Bool)

(assert (=> b!126790 m!148057))

(assert (=> b!126575 d!38293))

(declare-fun d!38295 () Bool)

(assert (=> d!38295 (= (apply!111 (+!164 lt!65392 (tuple2!2525 lt!65383 (minValue!2645 newMap!16))) lt!65389) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65392 (tuple2!2525 lt!65383 (minValue!2645 newMap!16)))) lt!65389)))))

(declare-fun bs!5259 () Bool)

(assert (= bs!5259 d!38295))

(declare-fun m!148059 () Bool)

(assert (=> bs!5259 m!148059))

(assert (=> bs!5259 m!148059))

(declare-fun m!148061 () Bool)

(assert (=> bs!5259 m!148061))

(assert (=> b!126575 d!38295))

(declare-fun d!38297 () Bool)

(assert (=> d!38297 (= (apply!111 lt!65388 lt!65391) (get!1456 (getValueByKey!168 (toList!832 lt!65388) lt!65391)))))

(declare-fun bs!5260 () Bool)

(assert (= bs!5260 d!38297))

(declare-fun m!148063 () Bool)

(assert (=> bs!5260 m!148063))

(assert (=> bs!5260 m!148063))

(declare-fun m!148065 () Bool)

(assert (=> bs!5260 m!148065))

(assert (=> b!126575 d!38297))

(declare-fun d!38299 () Bool)

(declare-fun e!82796 () Bool)

(assert (=> d!38299 e!82796))

(declare-fun res!61321 () Bool)

(assert (=> d!38299 (=> (not res!61321) (not e!82796))))

(declare-fun lt!65553 () ListLongMap!1633)

(assert (=> d!38299 (= res!61321 (contains!864 lt!65553 (_1!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16)))))))

(declare-fun lt!65554 () List!1678)

(assert (=> d!38299 (= lt!65553 (ListLongMap!1634 lt!65554))))

(declare-fun lt!65556 () Unit!3928)

(declare-fun lt!65555 () Unit!3928)

(assert (=> d!38299 (= lt!65556 lt!65555)))

(assert (=> d!38299 (= (getValueByKey!168 lt!65554 (_1!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16)))))))

(assert (=> d!38299 (= lt!65555 (lemmaContainsTupThenGetReturnValue!83 lt!65554 (_1!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16)))))))

(assert (=> d!38299 (= lt!65554 (insertStrictlySorted!86 (toList!832 lt!65388) (_1!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16)))))))

(assert (=> d!38299 (= (+!164 lt!65388 (tuple2!2525 lt!65381 (minValue!2645 newMap!16))) lt!65553)))

(declare-fun b!126798 () Bool)

(declare-fun res!61320 () Bool)

(assert (=> b!126798 (=> (not res!61320) (not e!82796))))

(assert (=> b!126798 (= res!61320 (= (getValueByKey!168 (toList!832 lt!65553) (_1!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65381 (minValue!2645 newMap!16))))))))

(declare-fun b!126799 () Bool)

(assert (=> b!126799 (= e!82796 (contains!866 (toList!832 lt!65553) (tuple2!2525 lt!65381 (minValue!2645 newMap!16))))))

(assert (= (and d!38299 res!61321) b!126798))

(assert (= (and b!126798 res!61320) b!126799))

(declare-fun m!148067 () Bool)

(assert (=> d!38299 m!148067))

(declare-fun m!148069 () Bool)

(assert (=> d!38299 m!148069))

(declare-fun m!148071 () Bool)

(assert (=> d!38299 m!148071))

(declare-fun m!148073 () Bool)

(assert (=> d!38299 m!148073))

(declare-fun m!148075 () Bool)

(assert (=> b!126798 m!148075))

(declare-fun m!148077 () Bool)

(assert (=> b!126799 m!148077))

(assert (=> b!126575 d!38299))

(declare-fun d!38301 () Bool)

(declare-fun e!82798 () Bool)

(assert (=> d!38301 e!82798))

(declare-fun res!61322 () Bool)

(assert (=> d!38301 (=> res!61322 e!82798)))

(declare-fun lt!65558 () Bool)

(assert (=> d!38301 (= res!61322 (not lt!65558))))

(declare-fun lt!65557 () Bool)

(assert (=> d!38301 (= lt!65558 lt!65557)))

(declare-fun lt!65560 () Unit!3928)

(declare-fun e!82797 () Unit!3928)

(assert (=> d!38301 (= lt!65560 e!82797)))

(declare-fun c!23198 () Bool)

(assert (=> d!38301 (= c!23198 lt!65557)))

(assert (=> d!38301 (= lt!65557 (containsKey!171 (toList!832 (+!164 lt!65378 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))) lt!65395))))

(assert (=> d!38301 (= (contains!864 (+!164 lt!65378 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16))) lt!65395) lt!65558)))

(declare-fun b!126800 () Bool)

(declare-fun lt!65559 () Unit!3928)

(assert (=> b!126800 (= e!82797 lt!65559)))

(assert (=> b!126800 (= lt!65559 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (+!164 lt!65378 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))) lt!65395))))

(assert (=> b!126800 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65378 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))) lt!65395))))

(declare-fun b!126801 () Bool)

(declare-fun Unit!3947 () Unit!3928)

(assert (=> b!126801 (= e!82797 Unit!3947)))

(declare-fun b!126802 () Bool)

(assert (=> b!126802 (= e!82798 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65378 (tuple2!2525 lt!65397 (zeroValue!2645 newMap!16)))) lt!65395)))))

(assert (= (and d!38301 c!23198) b!126800))

(assert (= (and d!38301 (not c!23198)) b!126801))

(assert (= (and d!38301 (not res!61322)) b!126802))

(declare-fun m!148079 () Bool)

(assert (=> d!38301 m!148079))

(declare-fun m!148081 () Bool)

(assert (=> b!126800 m!148081))

(declare-fun m!148083 () Bool)

(assert (=> b!126800 m!148083))

(assert (=> b!126800 m!148083))

(declare-fun m!148085 () Bool)

(assert (=> b!126800 m!148085))

(assert (=> b!126802 m!148083))

(assert (=> b!126802 m!148083))

(assert (=> b!126802 m!148085))

(assert (=> b!126575 d!38301))

(declare-fun d!38303 () Bool)

(declare-fun e!82799 () Bool)

(assert (=> d!38303 e!82799))

(declare-fun res!61324 () Bool)

(assert (=> d!38303 (=> (not res!61324) (not e!82799))))

(declare-fun lt!65561 () ListLongMap!1633)

(assert (=> d!38303 (= res!61324 (contains!864 lt!65561 (_1!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16)))))))

(declare-fun lt!65562 () List!1678)

(assert (=> d!38303 (= lt!65561 (ListLongMap!1634 lt!65562))))

(declare-fun lt!65564 () Unit!3928)

(declare-fun lt!65563 () Unit!3928)

(assert (=> d!38303 (= lt!65564 lt!65563)))

(assert (=> d!38303 (= (getValueByKey!168 lt!65562 (_1!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16)))))))

(assert (=> d!38303 (= lt!65563 (lemmaContainsTupThenGetReturnValue!83 lt!65562 (_1!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16)))))))

(assert (=> d!38303 (= lt!65562 (insertStrictlySorted!86 (toList!832 lt!65392) (_1!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16)))))))

(assert (=> d!38303 (= (+!164 lt!65392 (tuple2!2525 lt!65383 (minValue!2645 newMap!16))) lt!65561)))

(declare-fun b!126803 () Bool)

(declare-fun res!61323 () Bool)

(assert (=> b!126803 (=> (not res!61323) (not e!82799))))

(assert (=> b!126803 (= res!61323 (= (getValueByKey!168 (toList!832 lt!65561) (_1!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65383 (minValue!2645 newMap!16))))))))

(declare-fun b!126804 () Bool)

(assert (=> b!126804 (= e!82799 (contains!866 (toList!832 lt!65561) (tuple2!2525 lt!65383 (minValue!2645 newMap!16))))))

(assert (= (and d!38303 res!61324) b!126803))

(assert (= (and b!126803 res!61323) b!126804))

(declare-fun m!148087 () Bool)

(assert (=> d!38303 m!148087))

(declare-fun m!148089 () Bool)

(assert (=> d!38303 m!148089))

(declare-fun m!148091 () Bool)

(assert (=> d!38303 m!148091))

(declare-fun m!148093 () Bool)

(assert (=> d!38303 m!148093))

(declare-fun m!148095 () Bool)

(assert (=> b!126803 m!148095))

(declare-fun m!148097 () Bool)

(assert (=> b!126804 m!148097))

(assert (=> b!126575 d!38303))

(declare-fun d!38305 () Bool)

(declare-fun e!82800 () Bool)

(assert (=> d!38305 e!82800))

(declare-fun res!61326 () Bool)

(assert (=> d!38305 (=> (not res!61326) (not e!82800))))

(declare-fun lt!65565 () ListLongMap!1633)

(assert (=> d!38305 (= res!61326 (contains!864 lt!65565 (_1!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(declare-fun lt!65566 () List!1678)

(assert (=> d!38305 (= lt!65565 (ListLongMap!1634 lt!65566))))

(declare-fun lt!65568 () Unit!3928)

(declare-fun lt!65567 () Unit!3928)

(assert (=> d!38305 (= lt!65568 lt!65567)))

(assert (=> d!38305 (= (getValueByKey!168 lt!65566 (_1!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38305 (= lt!65567 (lemmaContainsTupThenGetReturnValue!83 lt!65566 (_1!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (_2!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38305 (= lt!65566 (insertStrictlySorted!86 (toList!832 (ite c!23141 call!13618 (ite c!23138 call!13621 call!13624))) (_1!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (_2!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38305 (= (+!164 (ite c!23141 call!13618 (ite c!23138 call!13621 call!13624)) (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) lt!65565)))

(declare-fun b!126805 () Bool)

(declare-fun res!61325 () Bool)

(assert (=> b!126805 (=> (not res!61325) (not e!82800))))

(assert (=> b!126805 (= res!61325 (= (getValueByKey!168 (toList!832 lt!65565) (_1!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))))

(declare-fun b!126806 () Bool)

(assert (=> b!126806 (= e!82800 (contains!866 (toList!832 lt!65565) (ite (or c!23141 c!23138) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (= (and d!38305 res!61326) b!126805))

(assert (= (and b!126805 res!61325) b!126806))

(declare-fun m!148099 () Bool)

(assert (=> d!38305 m!148099))

(declare-fun m!148101 () Bool)

(assert (=> d!38305 m!148101))

(declare-fun m!148103 () Bool)

(assert (=> d!38305 m!148103))

(declare-fun m!148105 () Bool)

(assert (=> d!38305 m!148105))

(declare-fun m!148107 () Bool)

(assert (=> b!126805 m!148107))

(declare-fun m!148109 () Bool)

(assert (=> b!126806 m!148109))

(assert (=> bm!13615 d!38305))

(declare-fun d!38307 () Bool)

(declare-fun lt!65571 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!126 (List!1678) (InoxSet tuple2!2524))

(assert (=> d!38307 (= lt!65571 (select (content!126 (toList!832 lt!65411)) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!82805 () Bool)

(assert (=> d!38307 (= lt!65571 e!82805)))

(declare-fun res!61332 () Bool)

(assert (=> d!38307 (=> (not res!61332) (not e!82805))))

(assert (=> d!38307 (= res!61332 ((_ is Cons!1674) (toList!832 lt!65411)))))

(assert (=> d!38307 (= (contains!866 (toList!832 lt!65411) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65571)))

(declare-fun b!126811 () Bool)

(declare-fun e!82806 () Bool)

(assert (=> b!126811 (= e!82805 e!82806)))

(declare-fun res!61331 () Bool)

(assert (=> b!126811 (=> res!61331 e!82806)))

(assert (=> b!126811 (= res!61331 (= (h!2276 (toList!832 lt!65411)) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!126812 () Bool)

(assert (=> b!126812 (= e!82806 (contains!866 (t!6017 (toList!832 lt!65411)) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38307 res!61332) b!126811))

(assert (= (and b!126811 (not res!61331)) b!126812))

(declare-fun m!148111 () Bool)

(assert (=> d!38307 m!148111))

(declare-fun m!148113 () Bool)

(assert (=> d!38307 m!148113))

(declare-fun m!148115 () Bool)

(assert (=> b!126812 m!148115))

(assert (=> b!126602 d!38307))

(assert (=> bm!13601 d!38189))

(declare-fun d!38309 () Bool)

(declare-fun lt!65572 () Bool)

(assert (=> d!38309 (= lt!65572 (select (content!126 (toList!832 lt!65480)) (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!82807 () Bool)

(assert (=> d!38309 (= lt!65572 e!82807)))

(declare-fun res!61334 () Bool)

(assert (=> d!38309 (=> (not res!61334) (not e!82807))))

(assert (=> d!38309 (= res!61334 ((_ is Cons!1674) (toList!832 lt!65480)))))

(assert (=> d!38309 (= (contains!866 (toList!832 lt!65480) (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65572)))

(declare-fun b!126813 () Bool)

(declare-fun e!82808 () Bool)

(assert (=> b!126813 (= e!82807 e!82808)))

(declare-fun res!61333 () Bool)

(assert (=> b!126813 (=> res!61333 e!82808)))

(assert (=> b!126813 (= res!61333 (= (h!2276 (toList!832 lt!65480)) (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126814 () Bool)

(assert (=> b!126814 (= e!82808 (contains!866 (t!6017 (toList!832 lt!65480)) (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38309 res!61334) b!126813))

(assert (= (and b!126813 (not res!61333)) b!126814))

(declare-fun m!148117 () Bool)

(assert (=> d!38309 m!148117))

(declare-fun m!148119 () Bool)

(assert (=> d!38309 m!148119))

(declare-fun m!148121 () Bool)

(assert (=> b!126814 m!148121))

(assert (=> b!126718 d!38309))

(declare-fun b!126818 () Bool)

(declare-fun e!82810 () Option!174)

(assert (=> b!126818 (= e!82810 None!172)))

(declare-fun b!126815 () Bool)

(declare-fun e!82809 () Option!174)

(assert (=> b!126815 (= e!82809 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65530)))))))

(declare-fun b!126817 () Bool)

(assert (=> b!126817 (= e!82810 (getValueByKey!168 (t!6017 (toList!832 lt!65530)) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun d!38311 () Bool)

(declare-fun c!23199 () Bool)

(assert (=> d!38311 (= c!23199 (and ((_ is Cons!1674) (toList!832 lt!65530)) (= (_1!1273 (h!2276 (toList!832 lt!65530))) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (=> d!38311 (= (getValueByKey!168 (toList!832 lt!65530) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) e!82809)))

(declare-fun b!126816 () Bool)

(assert (=> b!126816 (= e!82809 e!82810)))

(declare-fun c!23200 () Bool)

(assert (=> b!126816 (= c!23200 (and ((_ is Cons!1674) (toList!832 lt!65530)) (not (= (_1!1273 (h!2276 (toList!832 lt!65530))) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))))

(assert (= (and d!38311 c!23199) b!126815))

(assert (= (and d!38311 (not c!23199)) b!126816))

(assert (= (and b!126816 c!23200) b!126817))

(assert (= (and b!126816 (not c!23200)) b!126818))

(declare-fun m!148123 () Bool)

(assert (=> b!126817 m!148123))

(assert (=> b!126773 d!38311))

(declare-fun d!38313 () Bool)

(assert (=> d!38313 (= (isDefined!120 (getValueByKey!168 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))) (not (isEmpty!402 (getValueByKey!168 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun bs!5261 () Bool)

(assert (= bs!5261 d!38313))

(assert (=> bs!5261 m!147673))

(declare-fun m!148125 () Bool)

(assert (=> bs!5261 m!148125))

(assert (=> b!126582 d!38313))

(declare-fun b!126822 () Bool)

(declare-fun e!82812 () Option!174)

(assert (=> b!126822 (= e!82812 None!172)))

(declare-fun b!126819 () Bool)

(declare-fun e!82811 () Option!174)

(assert (=> b!126819 (= e!82811 (Some!173 (_2!1273 (h!2276 (toList!832 call!13566)))))))

(declare-fun b!126821 () Bool)

(assert (=> b!126821 (= e!82812 (getValueByKey!168 (t!6017 (toList!832 call!13566)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun c!23201 () Bool)

(declare-fun d!38315 () Bool)

(assert (=> d!38315 (= c!23201 (and ((_ is Cons!1674) (toList!832 call!13566)) (= (_1!1273 (h!2276 (toList!832 call!13566))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38315 (= (getValueByKey!168 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82811)))

(declare-fun b!126820 () Bool)

(assert (=> b!126820 (= e!82811 e!82812)))

(declare-fun c!23202 () Bool)

(assert (=> b!126820 (= c!23202 (and ((_ is Cons!1674) (toList!832 call!13566)) (not (= (_1!1273 (h!2276 (toList!832 call!13566))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(assert (= (and d!38315 c!23201) b!126819))

(assert (= (and d!38315 (not c!23201)) b!126820))

(assert (= (and b!126820 c!23202) b!126821))

(assert (= (and b!126820 (not c!23202)) b!126822))

(assert (=> b!126821 m!147207))

(declare-fun m!148127 () Bool)

(assert (=> b!126821 m!148127))

(assert (=> b!126582 d!38315))

(declare-fun d!38317 () Bool)

(declare-fun res!61335 () Bool)

(declare-fun e!82813 () Bool)

(assert (=> d!38317 (=> res!61335 e!82813)))

(assert (=> d!38317 (= res!61335 (and ((_ is Cons!1674) (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))) (= (_1!1273 (h!2276 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38317 (= (containsKey!171 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82813)))

(declare-fun b!126823 () Bool)

(declare-fun e!82814 () Bool)

(assert (=> b!126823 (= e!82813 e!82814)))

(declare-fun res!61336 () Bool)

(assert (=> b!126823 (=> (not res!61336) (not e!82814))))

(assert (=> b!126823 (= res!61336 (and (or (not ((_ is Cons!1674) (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))) (bvsle (_1!1273 (h!2276 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))) ((_ is Cons!1674) (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))) (bvslt (_1!1273 (h!2276 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun b!126824 () Bool)

(assert (=> b!126824 (= e!82814 (containsKey!171 (t!6017 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38317 (not res!61335)) b!126823))

(assert (= (and b!126823 res!61336) b!126824))

(assert (=> b!126824 m!147207))

(declare-fun m!148129 () Bool)

(assert (=> b!126824 m!148129))

(assert (=> d!38267 d!38317))

(declare-fun d!38319 () Bool)

(assert (=> d!38319 (= (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!402 (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5262 () Bool)

(assert (= bs!5262 d!38319))

(assert (=> bs!5262 m!147513))

(declare-fun m!148131 () Bool)

(assert (=> bs!5262 m!148131))

(assert (=> b!126496 d!38319))

(declare-fun b!126828 () Bool)

(declare-fun e!82816 () Option!174)

(assert (=> b!126828 (= e!82816 None!172)))

(declare-fun b!126825 () Bool)

(declare-fun e!82815 () Option!174)

(assert (=> b!126825 (= e!82815 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65225)))))))

(declare-fun b!126827 () Bool)

(assert (=> b!126827 (= e!82816 (getValueByKey!168 (t!6017 (toList!832 lt!65225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!38321 () Bool)

(declare-fun c!23203 () Bool)

(assert (=> d!38321 (= c!23203 (and ((_ is Cons!1674) (toList!832 lt!65225)) (= (_1!1273 (h!2276 (toList!832 lt!65225))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38321 (= (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000) e!82815)))

(declare-fun b!126826 () Bool)

(assert (=> b!126826 (= e!82815 e!82816)))

(declare-fun c!23204 () Bool)

(assert (=> b!126826 (= c!23204 (and ((_ is Cons!1674) (toList!832 lt!65225)) (not (= (_1!1273 (h!2276 (toList!832 lt!65225))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38321 c!23203) b!126825))

(assert (= (and d!38321 (not c!23203)) b!126826))

(assert (= (and b!126826 c!23204) b!126827))

(assert (= (and b!126826 (not c!23204)) b!126828))

(declare-fun m!148133 () Bool)

(assert (=> b!126827 m!148133))

(assert (=> b!126496 d!38321))

(declare-fun d!38323 () Bool)

(declare-fun res!61337 () Bool)

(declare-fun e!82817 () Bool)

(assert (=> d!38323 (=> res!61337 e!82817)))

(assert (=> d!38323 (= res!61337 (and ((_ is Cons!1674) (toList!832 e!82525)) (= (_1!1273 (h!2276 (toList!832 e!82525))) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))))))

(assert (=> d!38323 (= (containsKey!171 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))) e!82817)))

(declare-fun b!126829 () Bool)

(declare-fun e!82818 () Bool)

(assert (=> b!126829 (= e!82817 e!82818)))

(declare-fun res!61338 () Bool)

(assert (=> b!126829 (=> (not res!61338) (not e!82818))))

(assert (=> b!126829 (= res!61338 (and (or (not ((_ is Cons!1674) (toList!832 e!82525))) (bvsle (_1!1273 (h!2276 (toList!832 e!82525))) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))) ((_ is Cons!1674) (toList!832 e!82525)) (bvslt (_1!1273 (h!2276 (toList!832 e!82525))) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))))))

(declare-fun b!126830 () Bool)

(assert (=> b!126830 (= e!82818 (containsKey!171 (t!6017 (toList!832 e!82525)) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(assert (= (and d!38323 (not res!61337)) b!126829))

(assert (= (and b!126829 res!61338) b!126830))

(declare-fun m!148135 () Bool)

(assert (=> b!126830 m!148135))

(assert (=> d!38269 d!38323))

(declare-fun b!126834 () Bool)

(declare-fun e!82820 () Option!174)

(assert (=> b!126834 (= e!82820 None!172)))

(declare-fun b!126831 () Bool)

(declare-fun e!82819 () Option!174)

(assert (=> b!126831 (= e!82819 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65437)))))))

(declare-fun b!126833 () Bool)

(assert (=> b!126833 (= e!82820 (getValueByKey!168 (t!6017 (toList!832 lt!65437)) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun d!38325 () Bool)

(declare-fun c!23205 () Bool)

(assert (=> d!38325 (= c!23205 (and ((_ is Cons!1674) (toList!832 lt!65437)) (= (_1!1273 (h!2276 (toList!832 lt!65437))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38325 (= (getValueByKey!168 (toList!832 lt!65437) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!82819)))

(declare-fun b!126832 () Bool)

(assert (=> b!126832 (= e!82819 e!82820)))

(declare-fun c!23206 () Bool)

(assert (=> b!126832 (= c!23206 (and ((_ is Cons!1674) (toList!832 lt!65437)) (not (= (_1!1273 (h!2276 (toList!832 lt!65437))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38325 c!23205) b!126831))

(assert (= (and d!38325 (not c!23205)) b!126832))

(assert (= (and b!126832 c!23206) b!126833))

(assert (= (and b!126832 (not c!23206)) b!126834))

(declare-fun m!148137 () Bool)

(assert (=> b!126833 m!148137))

(assert (=> b!126669 d!38325))

(declare-fun d!38327 () Bool)

(assert (=> d!38327 (= (apply!111 lt!65390 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1456 (getValueByKey!168 (toList!832 lt!65390) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5263 () Bool)

(assert (= bs!5263 d!38327))

(assert (=> bs!5263 m!147525))

(declare-fun m!148139 () Bool)

(assert (=> bs!5263 m!148139))

(assert (=> bs!5263 m!148139))

(declare-fun m!148141 () Bool)

(assert (=> bs!5263 m!148141))

(assert (=> b!126572 d!38327))

(declare-fun d!38329 () Bool)

(declare-fun c!23207 () Bool)

(assert (=> d!38329 (= c!23207 ((_ is ValueCellFull!1076) (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!82821 () V!3433)

(assert (=> d!38329 (= (get!1452 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82821)))

(declare-fun b!126835 () Bool)

(assert (=> b!126835 (= e!82821 (get!1454 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126836 () Bool)

(assert (=> b!126836 (= e!82821 (get!1455 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38329 c!23207) b!126835))

(assert (= (and d!38329 (not c!23207)) b!126836))

(assert (=> b!126835 m!147657))

(assert (=> b!126835 m!147569))

(declare-fun m!148143 () Bool)

(assert (=> b!126835 m!148143))

(assert (=> b!126836 m!147657))

(assert (=> b!126836 m!147569))

(declare-fun m!148145 () Bool)

(assert (=> b!126836 m!148145))

(assert (=> b!126572 d!38329))

(declare-fun d!38331 () Bool)

(declare-fun e!82823 () Bool)

(assert (=> d!38331 e!82823))

(declare-fun res!61339 () Bool)

(assert (=> d!38331 (=> res!61339 e!82823)))

(declare-fun lt!65574 () Bool)

(assert (=> d!38331 (= res!61339 (not lt!65574))))

(declare-fun lt!65573 () Bool)

(assert (=> d!38331 (= lt!65574 lt!65573)))

(declare-fun lt!65576 () Unit!3928)

(declare-fun e!82822 () Unit!3928)

(assert (=> d!38331 (= lt!65576 e!82822)))

(declare-fun c!23208 () Bool)

(assert (=> d!38331 (= c!23208 lt!65573)))

(assert (=> d!38331 (= lt!65573 (containsKey!171 (toList!832 lt!65530) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38331 (= (contains!864 lt!65530 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) lt!65574)))

(declare-fun b!126837 () Bool)

(declare-fun lt!65575 () Unit!3928)

(assert (=> b!126837 (= e!82822 lt!65575)))

(assert (=> b!126837 (= lt!65575 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65530) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!126837 (isDefined!120 (getValueByKey!168 (toList!832 lt!65530) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126838 () Bool)

(declare-fun Unit!3948 () Unit!3928)

(assert (=> b!126838 (= e!82822 Unit!3948)))

(declare-fun b!126839 () Bool)

(assert (=> b!126839 (= e!82823 (isDefined!120 (getValueByKey!168 (toList!832 lt!65530) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38331 c!23208) b!126837))

(assert (= (and d!38331 (not c!23208)) b!126838))

(assert (= (and d!38331 (not res!61339)) b!126839))

(declare-fun m!148147 () Bool)

(assert (=> d!38331 m!148147))

(declare-fun m!148149 () Bool)

(assert (=> b!126837 m!148149))

(assert (=> b!126837 m!147975))

(assert (=> b!126837 m!147975))

(declare-fun m!148151 () Bool)

(assert (=> b!126837 m!148151))

(assert (=> b!126839 m!147975))

(assert (=> b!126839 m!147975))

(assert (=> b!126839 m!148151))

(assert (=> d!38271 d!38331))

(declare-fun b!126843 () Bool)

(declare-fun e!82825 () Option!174)

(assert (=> b!126843 (= e!82825 None!172)))

(declare-fun b!126840 () Bool)

(declare-fun e!82824 () Option!174)

(assert (=> b!126840 (= e!82824 (Some!173 (_2!1273 (h!2276 lt!65531))))))

(declare-fun b!126842 () Bool)

(assert (=> b!126842 (= e!82825 (getValueByKey!168 (t!6017 lt!65531) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun d!38333 () Bool)

(declare-fun c!23209 () Bool)

(assert (=> d!38333 (= c!23209 (and ((_ is Cons!1674) lt!65531) (= (_1!1273 (h!2276 lt!65531)) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (=> d!38333 (= (getValueByKey!168 lt!65531 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) e!82824)))

(declare-fun b!126841 () Bool)

(assert (=> b!126841 (= e!82824 e!82825)))

(declare-fun c!23210 () Bool)

(assert (=> b!126841 (= c!23210 (and ((_ is Cons!1674) lt!65531) (not (= (_1!1273 (h!2276 lt!65531)) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))))

(assert (= (and d!38333 c!23209) b!126840))

(assert (= (and d!38333 (not c!23209)) b!126841))

(assert (= (and b!126841 c!23210) b!126842))

(assert (= (and b!126841 (not c!23210)) b!126843))

(declare-fun m!148153 () Bool)

(assert (=> b!126842 m!148153))

(assert (=> d!38271 d!38333))

(declare-fun d!38335 () Bool)

(assert (=> d!38335 (= (getValueByKey!168 lt!65531 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) (Some!173 (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun lt!65579 () Unit!3928)

(declare-fun choose!776 (List!1678 (_ BitVec 64) V!3433) Unit!3928)

(assert (=> d!38335 (= lt!65579 (choose!776 lt!65531 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!82828 () Bool)

(assert (=> d!38335 e!82828))

(declare-fun res!61344 () Bool)

(assert (=> d!38335 (=> (not res!61344) (not e!82828))))

(assert (=> d!38335 (= res!61344 (isStrictlySorted!304 lt!65531))))

(assert (=> d!38335 (= (lemmaContainsTupThenGetReturnValue!83 lt!65531 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) lt!65579)))

(declare-fun b!126848 () Bool)

(declare-fun res!61345 () Bool)

(assert (=> b!126848 (=> (not res!61345) (not e!82828))))

(assert (=> b!126848 (= res!61345 (containsKey!171 lt!65531 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126849 () Bool)

(assert (=> b!126849 (= e!82828 (contains!866 lt!65531 (tuple2!2525 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38335 res!61344) b!126848))

(assert (= (and b!126848 res!61345) b!126849))

(assert (=> d!38335 m!147969))

(declare-fun m!148155 () Bool)

(assert (=> d!38335 m!148155))

(declare-fun m!148157 () Bool)

(assert (=> d!38335 m!148157))

(declare-fun m!148159 () Bool)

(assert (=> b!126848 m!148159))

(declare-fun m!148161 () Bool)

(assert (=> b!126849 m!148161))

(assert (=> d!38271 d!38335))

(declare-fun bm!13648 () Bool)

(declare-fun call!13652 () List!1678)

(declare-fun call!13653 () List!1678)

(assert (=> bm!13648 (= call!13652 call!13653)))

(declare-fun b!126870 () Bool)

(declare-fun e!82843 () List!1678)

(declare-fun call!13651 () List!1678)

(assert (=> b!126870 (= e!82843 call!13651)))

(declare-fun e!82840 () List!1678)

(declare-fun b!126871 () Bool)

(assert (=> b!126871 (= e!82840 (insertStrictlySorted!86 (t!6017 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)))) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126872 () Bool)

(declare-fun e!82842 () List!1678)

(declare-fun e!82839 () List!1678)

(assert (=> b!126872 (= e!82842 e!82839)))

(declare-fun c!23221 () Bool)

(assert (=> b!126872 (= c!23221 (and ((_ is Cons!1674) (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)))) (= (_1!1273 (h!2276 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592))))) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23222 () Bool)

(declare-fun b!126873 () Bool)

(assert (=> b!126873 (= e!82840 (ite c!23221 (t!6017 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)))) (ite c!23222 (Cons!1674 (h!2276 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)))) (t!6017 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592))))) Nil!1675)))))

(declare-fun b!126874 () Bool)

(assert (=> b!126874 (= e!82843 call!13651)))

(declare-fun b!126875 () Bool)

(assert (=> b!126875 (= e!82842 call!13653)))

(declare-fun bm!13649 () Bool)

(declare-fun c!23219 () Bool)

(declare-fun $colon$colon!88 (List!1678 tuple2!2524) List!1678)

(assert (=> bm!13649 (= call!13653 ($colon$colon!88 e!82840 (ite c!23219 (h!2276 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)))) (tuple2!2525 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))))

(declare-fun c!23220 () Bool)

(assert (=> bm!13649 (= c!23220 c!23219)))

(declare-fun d!38337 () Bool)

(declare-fun e!82841 () Bool)

(assert (=> d!38337 e!82841))

(declare-fun res!61351 () Bool)

(assert (=> d!38337 (=> (not res!61351) (not e!82841))))

(declare-fun lt!65582 () List!1678)

(assert (=> d!38337 (= res!61351 (isStrictlySorted!304 lt!65582))))

(assert (=> d!38337 (= lt!65582 e!82842)))

(assert (=> d!38337 (= c!23219 (and ((_ is Cons!1674) (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)))) (bvslt (_1!1273 (h!2276 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592))))) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (=> d!38337 (isStrictlySorted!304 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592))))))

(assert (=> d!38337 (= (insertStrictlySorted!86 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592))) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) lt!65582)))

(declare-fun b!126876 () Bool)

(assert (=> b!126876 (= c!23222 (and ((_ is Cons!1674) (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592)))) (bvsgt (_1!1273 (h!2276 (toList!832 (ite c!23109 call!13586 (ite c!23106 call!13589 call!13592))))) (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (=> b!126876 (= e!82839 e!82843)))

(declare-fun b!126877 () Bool)

(assert (=> b!126877 (= e!82839 call!13652)))

(declare-fun b!126878 () Bool)

(declare-fun res!61350 () Bool)

(assert (=> b!126878 (=> (not res!61350) (not e!82841))))

(assert (=> b!126878 (= res!61350 (containsKey!171 lt!65582 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun bm!13650 () Bool)

(assert (=> bm!13650 (= call!13651 call!13652)))

(declare-fun b!126879 () Bool)

(assert (=> b!126879 (= e!82841 (contains!866 lt!65582 (tuple2!2525 (_1!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (_2!1273 (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38337 c!23219) b!126875))

(assert (= (and d!38337 (not c!23219)) b!126872))

(assert (= (and b!126872 c!23221) b!126877))

(assert (= (and b!126872 (not c!23221)) b!126876))

(assert (= (and b!126876 c!23222) b!126870))

(assert (= (and b!126876 (not c!23222)) b!126874))

(assert (= (or b!126870 b!126874) bm!13650))

(assert (= (or b!126877 bm!13650) bm!13648))

(assert (= (or b!126875 bm!13648) bm!13649))

(assert (= (and bm!13649 c!23220) b!126871))

(assert (= (and bm!13649 (not c!23220)) b!126873))

(assert (= (and d!38337 res!61351) b!126878))

(assert (= (and b!126878 res!61350) b!126879))

(declare-fun m!148163 () Bool)

(assert (=> b!126879 m!148163))

(declare-fun m!148165 () Bool)

(assert (=> b!126871 m!148165))

(declare-fun m!148167 () Bool)

(assert (=> b!126878 m!148167))

(declare-fun m!148169 () Bool)

(assert (=> d!38337 m!148169))

(declare-fun m!148171 () Bool)

(assert (=> d!38337 m!148171))

(declare-fun m!148173 () Bool)

(assert (=> bm!13649 m!148173))

(assert (=> d!38271 d!38337))

(declare-fun d!38339 () Bool)

(declare-fun isEmpty!404 (List!1678) Bool)

(assert (=> d!38339 (= (isEmpty!403 lt!65501) (isEmpty!404 (toList!832 lt!65501)))))

(declare-fun bs!5264 () Bool)

(assert (= bs!5264 d!38339))

(declare-fun m!148175 () Bool)

(assert (=> bs!5264 m!148175))

(assert (=> b!126753 d!38339))

(assert (=> b!126749 d!38193))

(declare-fun d!38341 () Bool)

(assert (=> d!38341 (= (size!2486 newMap!16) (bvadd (_size!579 newMap!16) (bvsdiv (bvadd (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!126702 d!38341))

(declare-fun d!38343 () Bool)

(declare-fun lt!65588 () SeekEntryResult!264)

(assert (=> d!38343 (and (or ((_ is Undefined!264) lt!65588) (not ((_ is Found!264) lt!65588)) (and (bvsge (index!3212 lt!65588) #b00000000000000000000000000000000) (bvslt (index!3212 lt!65588) (size!2480 (_keys!4515 newMap!16))))) (or ((_ is Undefined!264) lt!65588) ((_ is Found!264) lt!65588) (not ((_ is MissingVacant!264) lt!65588)) (not (= (index!3214 lt!65588) (index!3213 lt!65408))) (and (bvsge (index!3214 lt!65588) #b00000000000000000000000000000000) (bvslt (index!3214 lt!65588) (size!2480 (_keys!4515 newMap!16))))) (or ((_ is Undefined!264) lt!65588) (ite ((_ is Found!264) lt!65588) (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65588)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (and ((_ is MissingVacant!264) lt!65588) (= (index!3214 lt!65588) (index!3213 lt!65408)) (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3214 lt!65588)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!82852 () SeekEntryResult!264)

(assert (=> d!38343 (= lt!65588 e!82852)))

(declare-fun c!23231 () Bool)

(assert (=> d!38343 (= c!23231 (bvsge (x!14957 lt!65408) #b01111111111111111111111111111110))))

(declare-fun lt!65587 () (_ BitVec 64))

(assert (=> d!38343 (= lt!65587 (select (arr!2216 (_keys!4515 newMap!16)) (index!3213 lt!65408)))))

(assert (=> d!38343 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38343 (= (seekKeyOrZeroReturnVacant!0 (x!14957 lt!65408) (index!3213 lt!65408) (index!3213 lt!65408) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)) lt!65588)))

(declare-fun b!126892 () Bool)

(declare-fun e!82851 () SeekEntryResult!264)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!126892 (= e!82851 (seekKeyOrZeroReturnVacant!0 (bvadd (x!14957 lt!65408) #b00000000000000000000000000000001) (nextIndex!0 (index!3213 lt!65408) (bvadd (x!14957 lt!65408) #b00000000000000000000000000000001) (mask!7038 newMap!16)) (index!3213 lt!65408) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun b!126893 () Bool)

(assert (=> b!126893 (= e!82852 Undefined!264)))

(declare-fun b!126894 () Bool)

(declare-fun e!82850 () SeekEntryResult!264)

(assert (=> b!126894 (= e!82850 (Found!264 (index!3213 lt!65408)))))

(declare-fun b!126895 () Bool)

(assert (=> b!126895 (= e!82851 (MissingVacant!264 (index!3213 lt!65408)))))

(declare-fun b!126896 () Bool)

(assert (=> b!126896 (= e!82852 e!82850)))

(declare-fun c!23230 () Bool)

(assert (=> b!126896 (= c!23230 (= lt!65587 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126897 () Bool)

(declare-fun c!23229 () Bool)

(assert (=> b!126897 (= c!23229 (= lt!65587 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126897 (= e!82850 e!82851)))

(assert (= (and d!38343 c!23231) b!126893))

(assert (= (and d!38343 (not c!23231)) b!126896))

(assert (= (and b!126896 c!23230) b!126894))

(assert (= (and b!126896 (not c!23230)) b!126897))

(assert (= (and b!126897 c!23229) b!126895))

(assert (= (and b!126897 (not c!23229)) b!126892))

(declare-fun m!148177 () Bool)

(assert (=> d!38343 m!148177))

(declare-fun m!148179 () Bool)

(assert (=> d!38343 m!148179))

(assert (=> d!38343 m!147677))

(assert (=> d!38343 m!147517))

(declare-fun m!148181 () Bool)

(assert (=> b!126892 m!148181))

(assert (=> b!126892 m!148181))

(assert (=> b!126892 m!147207))

(declare-fun m!148183 () Bool)

(assert (=> b!126892 m!148183))

(assert (=> b!126600 d!38343))

(assert (=> b!126476 d!38181))

(declare-fun lt!65589 () Bool)

(declare-fun d!38345 () Bool)

(assert (=> d!38345 (= lt!65589 (select (content!126 (toList!832 lt!65331)) (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82853 () Bool)

(assert (=> d!38345 (= lt!65589 e!82853)))

(declare-fun res!61353 () Bool)

(assert (=> d!38345 (=> (not res!61353) (not e!82853))))

(assert (=> d!38345 (= res!61353 ((_ is Cons!1674) (toList!832 lt!65331)))))

(assert (=> d!38345 (= (contains!866 (toList!832 lt!65331) (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65589)))

(declare-fun b!126898 () Bool)

(declare-fun e!82854 () Bool)

(assert (=> b!126898 (= e!82853 e!82854)))

(declare-fun res!61352 () Bool)

(assert (=> b!126898 (=> res!61352 e!82854)))

(assert (=> b!126898 (= res!61352 (= (h!2276 (toList!832 lt!65331)) (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126899 () Bool)

(assert (=> b!126899 (= e!82854 (contains!866 (t!6017 (toList!832 lt!65331)) (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38345 res!61353) b!126898))

(assert (= (and b!126898 (not res!61352)) b!126899))

(declare-fun m!148185 () Bool)

(assert (=> d!38345 m!148185))

(declare-fun m!148187 () Bool)

(assert (=> d!38345 m!148187))

(declare-fun m!148189 () Bool)

(assert (=> b!126899 m!148189))

(assert (=> b!126493 d!38345))

(declare-fun d!38347 () Bool)

(assert (=> d!38347 (= (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65226)) (v!3130 (getValueByKey!168 (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65226)))))

(assert (=> d!38235 d!38347))

(declare-fun b!126903 () Bool)

(declare-fun e!82856 () Option!174)

(assert (=> b!126903 (= e!82856 None!172)))

(declare-fun b!126900 () Bool)

(declare-fun e!82855 () Option!174)

(assert (=> b!126900 (= e!82855 (Some!173 (_2!1273 (h!2276 (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))))

(declare-fun b!126902 () Bool)

(assert (=> b!126902 (= e!82856 (getValueByKey!168 (t!6017 (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) lt!65226))))

(declare-fun c!23232 () Bool)

(declare-fun d!38349 () Bool)

(assert (=> d!38349 (= c!23232 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65226)))))

(assert (=> d!38349 (= (getValueByKey!168 (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65226) e!82855)))

(declare-fun b!126901 () Bool)

(assert (=> b!126901 (= e!82855 e!82856)))

(declare-fun c!23233 () Bool)

(assert (=> b!126901 (= c!23233 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) (not (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65226))))))

(assert (= (and d!38349 c!23232) b!126900))

(assert (= (and d!38349 (not c!23232)) b!126901))

(assert (= (and b!126901 c!23233) b!126902))

(assert (= (and b!126901 (not c!23233)) b!126903))

(declare-fun m!148191 () Bool)

(assert (=> b!126902 m!148191))

(assert (=> d!38235 d!38349))

(declare-fun b!126904 () Bool)

(declare-fun e!82858 () Bool)

(declare-fun e!82857 () Bool)

(assert (=> b!126904 (= e!82858 e!82857)))

(declare-fun lt!65592 () (_ BitVec 64))

(assert (=> b!126904 (= lt!65592 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!65591 () Unit!3928)

(assert (=> b!126904 (= lt!65591 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4515 (v!3124 (underlying!439 thiss!992))) lt!65592 #b00000000000000000000000000000000))))

(assert (=> b!126904 (arrayContainsKey!0 (_keys!4515 (v!3124 (underlying!439 thiss!992))) lt!65592 #b00000000000000000000000000000000)))

(declare-fun lt!65590 () Unit!3928)

(assert (=> b!126904 (= lt!65590 lt!65591)))

(declare-fun res!61355 () Bool)

(assert (=> b!126904 (= res!61355 (= (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000) (_keys!4515 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992)))) (Found!264 #b00000000000000000000000000000000)))))

(assert (=> b!126904 (=> (not res!61355) (not e!82857))))

(declare-fun bm!13651 () Bool)

(declare-fun call!13654 () Bool)

(assert (=> bm!13651 (= call!13654 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4515 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126905 () Bool)

(assert (=> b!126905 (= e!82857 call!13654)))

(declare-fun b!126906 () Bool)

(declare-fun e!82859 () Bool)

(assert (=> b!126906 (= e!82859 e!82858)))

(declare-fun c!23234 () Bool)

(assert (=> b!126906 (= c!23234 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!38351 () Bool)

(declare-fun res!61354 () Bool)

(assert (=> d!38351 (=> res!61354 e!82859)))

(assert (=> d!38351 (= res!61354 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38351 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992)))) e!82859)))

(declare-fun b!126907 () Bool)

(assert (=> b!126907 (= e!82858 call!13654)))

(assert (= (and d!38351 (not res!61354)) b!126906))

(assert (= (and b!126906 c!23234) b!126904))

(assert (= (and b!126906 (not c!23234)) b!126907))

(assert (= (and b!126904 res!61355) b!126905))

(assert (= (or b!126905 b!126907) bm!13651))

(declare-fun m!148193 () Bool)

(assert (=> b!126904 m!148193))

(declare-fun m!148195 () Bool)

(assert (=> b!126904 m!148195))

(declare-fun m!148197 () Bool)

(assert (=> b!126904 m!148197))

(assert (=> b!126904 m!148193))

(declare-fun m!148199 () Bool)

(assert (=> b!126904 m!148199))

(declare-fun m!148201 () Bool)

(assert (=> bm!13651 m!148201))

(assert (=> b!126906 m!148193))

(assert (=> b!126906 m!148193))

(declare-fun m!148203 () Bool)

(assert (=> b!126906 m!148203))

(assert (=> b!126622 d!38351))

(declare-fun b!126908 () Bool)

(declare-fun e!82860 () Bool)

(declare-fun e!82861 () Bool)

(assert (=> b!126908 (= e!82860 e!82861)))

(assert (=> b!126908 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun res!61359 () Bool)

(declare-fun lt!65593 () ListLongMap!1633)

(assert (=> b!126908 (= res!61359 (contains!864 lt!65593 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126908 (=> (not res!61359) (not e!82861))))

(declare-fun b!126909 () Bool)

(declare-fun e!82865 () Bool)

(assert (=> b!126909 (= e!82865 (= lt!65593 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16))))))

(declare-fun bm!13652 () Bool)

(declare-fun call!13655 () ListLongMap!1633)

(assert (=> bm!13652 (= call!13655 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16)))))

(declare-fun b!126910 () Bool)

(declare-fun e!82864 () ListLongMap!1633)

(declare-fun e!82866 () ListLongMap!1633)

(assert (=> b!126910 (= e!82864 e!82866)))

(declare-fun c!23237 () Bool)

(assert (=> b!126910 (= c!23237 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126911 () Bool)

(declare-fun lt!65597 () Unit!3928)

(declare-fun lt!65596 () Unit!3928)

(assert (=> b!126911 (= lt!65597 lt!65596)))

(declare-fun lt!65594 () (_ BitVec 64))

(declare-fun lt!65595 () (_ BitVec 64))

(declare-fun lt!65598 () ListLongMap!1633)

(declare-fun lt!65599 () V!3433)

(assert (=> b!126911 (not (contains!864 (+!164 lt!65598 (tuple2!2525 lt!65594 lt!65599)) lt!65595))))

(assert (=> b!126911 (= lt!65596 (addStillNotContains!58 lt!65598 lt!65594 lt!65599 lt!65595))))

(assert (=> b!126911 (= lt!65595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126911 (= lt!65599 (get!1452 (select (arr!2217 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126911 (= lt!65594 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126911 (= lt!65598 call!13655)))

(assert (=> b!126911 (= e!82866 (+!164 call!13655 (tuple2!2525 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (get!1452 (select (arr!2217 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38353 () Bool)

(declare-fun e!82863 () Bool)

(assert (=> d!38353 e!82863))

(declare-fun res!61357 () Bool)

(assert (=> d!38353 (=> (not res!61357) (not e!82863))))

(assert (=> d!38353 (= res!61357 (not (contains!864 lt!65593 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38353 (= lt!65593 e!82864)))

(declare-fun c!23236 () Bool)

(assert (=> d!38353 (= c!23236 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38353 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38353 (= (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) (mask!7038 newMap!16) (ite c!23087 (ite c!23084 lt!65143 lt!65165) (extraKeys!2563 newMap!16)) (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65593)))

(declare-fun b!126912 () Bool)

(declare-fun res!61358 () Bool)

(assert (=> b!126912 (=> (not res!61358) (not e!82863))))

(assert (=> b!126912 (= res!61358 (not (contains!864 lt!65593 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126913 () Bool)

(declare-fun e!82862 () Bool)

(assert (=> b!126913 (= e!82862 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126913 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!126914 () Bool)

(assert (=> b!126914 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> b!126914 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))))))))

(assert (=> b!126914 (= e!82861 (= (apply!111 lt!65593 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126915 () Bool)

(assert (=> b!126915 (= e!82866 call!13655)))

(declare-fun b!126916 () Bool)

(assert (=> b!126916 (= e!82860 e!82865)))

(declare-fun c!23235 () Bool)

(assert (=> b!126916 (= c!23235 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126917 () Bool)

(assert (=> b!126917 (= e!82865 (isEmpty!403 lt!65593))))

(declare-fun b!126918 () Bool)

(assert (=> b!126918 (= e!82863 e!82860)))

(declare-fun c!23238 () Bool)

(assert (=> b!126918 (= c!23238 e!82862)))

(declare-fun res!61356 () Bool)

(assert (=> b!126918 (=> (not res!61356) (not e!82862))))

(assert (=> b!126918 (= res!61356 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!126919 () Bool)

(assert (=> b!126919 (= e!82864 (ListLongMap!1634 Nil!1675))))

(assert (= (and d!38353 c!23236) b!126919))

(assert (= (and d!38353 (not c!23236)) b!126910))

(assert (= (and b!126910 c!23237) b!126911))

(assert (= (and b!126910 (not c!23237)) b!126915))

(assert (= (or b!126911 b!126915) bm!13652))

(assert (= (and d!38353 res!61357) b!126912))

(assert (= (and b!126912 res!61358) b!126918))

(assert (= (and b!126918 res!61356) b!126913))

(assert (= (and b!126918 c!23238) b!126908))

(assert (= (and b!126918 (not c!23238)) b!126916))

(assert (= (and b!126908 res!61359) b!126914))

(assert (= (and b!126916 c!23235) b!126909))

(assert (= (and b!126916 (not c!23235)) b!126917))

(declare-fun b_lambda!5601 () Bool)

(assert (=> (not b_lambda!5601) (not b!126911)))

(assert (=> b!126911 t!6029))

(declare-fun b_and!7813 () Bool)

(assert (= b_and!7809 (and (=> t!6029 result!3843) b_and!7813)))

(assert (=> b!126911 t!6031))

(declare-fun b_and!7815 () Bool)

(assert (= b_and!7811 (and (=> t!6031 result!3845) b_and!7815)))

(declare-fun b_lambda!5603 () Bool)

(assert (=> (not b_lambda!5603) (not b!126914)))

(assert (=> b!126914 t!6029))

(declare-fun b_and!7817 () Bool)

(assert (= b_and!7813 (and (=> t!6029 result!3843) b_and!7817)))

(assert (=> b!126914 t!6031))

(declare-fun b_and!7819 () Bool)

(assert (= b_and!7815 (and (=> t!6031 result!3845) b_and!7819)))

(declare-fun m!148205 () Bool)

(assert (=> b!126911 m!148205))

(assert (=> b!126911 m!147525))

(declare-fun m!148207 () Bool)

(assert (=> b!126911 m!148207))

(assert (=> b!126911 m!148205))

(declare-fun m!148209 () Bool)

(assert (=> b!126911 m!148209))

(assert (=> b!126911 m!147569))

(assert (=> b!126911 m!147805))

(assert (=> b!126911 m!147805))

(assert (=> b!126911 m!147569))

(assert (=> b!126911 m!147807))

(declare-fun m!148211 () Bool)

(assert (=> b!126911 m!148211))

(declare-fun m!148213 () Bool)

(assert (=> b!126909 m!148213))

(declare-fun m!148215 () Bool)

(assert (=> b!126917 m!148215))

(declare-fun m!148217 () Bool)

(assert (=> d!38353 m!148217))

(assert (=> d!38353 m!147517))

(assert (=> bm!13652 m!148213))

(assert (=> b!126914 m!147525))

(declare-fun m!148219 () Bool)

(assert (=> b!126914 m!148219))

(assert (=> b!126914 m!147525))

(assert (=> b!126914 m!147569))

(assert (=> b!126914 m!147805))

(assert (=> b!126914 m!147805))

(assert (=> b!126914 m!147569))

(assert (=> b!126914 m!147807))

(assert (=> b!126913 m!147525))

(assert (=> b!126913 m!147525))

(assert (=> b!126913 m!147527))

(assert (=> b!126910 m!147525))

(assert (=> b!126910 m!147525))

(assert (=> b!126910 m!147527))

(assert (=> b!126908 m!147525))

(assert (=> b!126908 m!147525))

(declare-fun m!148221 () Bool)

(assert (=> b!126908 m!148221))

(declare-fun m!148223 () Bool)

(assert (=> b!126912 m!148223))

(assert (=> bm!13632 d!38353))

(declare-fun d!38355 () Bool)

(assert (=> d!38355 (= (get!1456 (getValueByKey!168 (toList!832 lt!65223) lt!65226)) (v!3130 (getValueByKey!168 (toList!832 lt!65223) lt!65226)))))

(assert (=> d!38239 d!38355))

(declare-fun b!126923 () Bool)

(declare-fun e!82868 () Option!174)

(assert (=> b!126923 (= e!82868 None!172)))

(declare-fun b!126920 () Bool)

(declare-fun e!82867 () Option!174)

(assert (=> b!126920 (= e!82867 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65223)))))))

(declare-fun b!126922 () Bool)

(assert (=> b!126922 (= e!82868 (getValueByKey!168 (t!6017 (toList!832 lt!65223)) lt!65226))))

(declare-fun d!38357 () Bool)

(declare-fun c!23239 () Bool)

(assert (=> d!38357 (= c!23239 (and ((_ is Cons!1674) (toList!832 lt!65223)) (= (_1!1273 (h!2276 (toList!832 lt!65223))) lt!65226)))))

(assert (=> d!38357 (= (getValueByKey!168 (toList!832 lt!65223) lt!65226) e!82867)))

(declare-fun b!126921 () Bool)

(assert (=> b!126921 (= e!82867 e!82868)))

(declare-fun c!23240 () Bool)

(assert (=> b!126921 (= c!23240 (and ((_ is Cons!1674) (toList!832 lt!65223)) (not (= (_1!1273 (h!2276 (toList!832 lt!65223))) lt!65226))))))

(assert (= (and d!38357 c!23239) b!126920))

(assert (= (and d!38357 (not c!23239)) b!126921))

(assert (= (and b!126921 c!23240) b!126922))

(assert (= (and b!126921 (not c!23240)) b!126923))

(declare-fun m!148225 () Bool)

(assert (=> b!126922 m!148225))

(assert (=> d!38239 d!38357))

(declare-fun d!38359 () Bool)

(assert (=> d!38359 (= (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65224)) (v!3130 (getValueByKey!168 (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65224)))))

(assert (=> d!38253 d!38359))

(declare-fun b!126927 () Bool)

(declare-fun e!82870 () Option!174)

(assert (=> b!126927 (= e!82870 None!172)))

(declare-fun e!82869 () Option!174)

(declare-fun b!126924 () Bool)

(assert (=> b!126924 (= e!82869 (Some!173 (_2!1273 (h!2276 (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))))

(declare-fun b!126926 () Bool)

(assert (=> b!126926 (= e!82870 (getValueByKey!168 (t!6017 (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) lt!65224))))

(declare-fun d!38361 () Bool)

(declare-fun c!23241 () Bool)

(assert (=> d!38361 (= c!23241 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65224)))))

(assert (=> d!38361 (= (getValueByKey!168 (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65224) e!82869)))

(declare-fun b!126925 () Bool)

(assert (=> b!126925 (= e!82869 e!82870)))

(declare-fun c!23242 () Bool)

(assert (=> b!126925 (= c!23242 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))) (not (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65224))))))

(assert (= (and d!38361 c!23241) b!126924))

(assert (= (and d!38361 (not c!23241)) b!126925))

(assert (= (and b!126925 c!23242) b!126926))

(assert (= (and b!126925 (not c!23242)) b!126927))

(declare-fun m!148227 () Bool)

(assert (=> b!126926 m!148227))

(assert (=> d!38253 d!38361))

(declare-fun d!38363 () Bool)

(declare-fun res!61360 () Bool)

(declare-fun e!82871 () Bool)

(assert (=> d!38363 (=> res!61360 e!82871)))

(assert (=> d!38363 (= res!61360 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65230)))))

(assert (=> d!38363 (= (containsKey!171 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230) e!82871)))

(declare-fun b!126928 () Bool)

(declare-fun e!82872 () Bool)

(assert (=> b!126928 (= e!82871 e!82872)))

(declare-fun res!61361 () Bool)

(assert (=> b!126928 (=> (not res!61361) (not e!82872))))

(assert (=> b!126928 (= res!61361 (and (or (not ((_ is Cons!1674) (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))) (bvsle (_1!1273 (h!2276 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65230)) ((_ is Cons!1674) (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) (bvslt (_1!1273 (h!2276 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65230)))))

(declare-fun b!126929 () Bool)

(assert (=> b!126929 (= e!82872 (containsKey!171 (t!6017 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) lt!65230))))

(assert (= (and d!38363 (not res!61360)) b!126928))

(assert (= (and b!126928 res!61361) b!126929))

(declare-fun m!148229 () Bool)

(assert (=> b!126929 m!148229))

(assert (=> d!38259 d!38363))

(declare-fun d!38365 () Bool)

(declare-fun e!82874 () Bool)

(assert (=> d!38365 e!82874))

(declare-fun res!61362 () Bool)

(assert (=> d!38365 (=> res!61362 e!82874)))

(declare-fun lt!65601 () Bool)

(assert (=> d!38365 (= res!61362 (not lt!65601))))

(declare-fun lt!65600 () Bool)

(assert (=> d!38365 (= lt!65601 lt!65600)))

(declare-fun lt!65603 () Unit!3928)

(declare-fun e!82873 () Unit!3928)

(assert (=> d!38365 (= lt!65603 e!82873)))

(declare-fun c!23243 () Bool)

(assert (=> d!38365 (= c!23243 lt!65600)))

(assert (=> d!38365 (= lt!65600 (containsKey!171 (toList!832 lt!65437) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38365 (= (contains!864 lt!65437 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65601)))

(declare-fun b!126930 () Bool)

(declare-fun lt!65602 () Unit!3928)

(assert (=> b!126930 (= e!82873 lt!65602)))

(assert (=> b!126930 (= lt!65602 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65437) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!126930 (isDefined!120 (getValueByKey!168 (toList!832 lt!65437) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126931 () Bool)

(declare-fun Unit!3949 () Unit!3928)

(assert (=> b!126931 (= e!82873 Unit!3949)))

(declare-fun b!126932 () Bool)

(assert (=> b!126932 (= e!82874 (isDefined!120 (getValueByKey!168 (toList!832 lt!65437) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38365 c!23243) b!126930))

(assert (= (and d!38365 (not c!23243)) b!126931))

(assert (= (and d!38365 (not res!61362)) b!126932))

(declare-fun m!148231 () Bool)

(assert (=> d!38365 m!148231))

(declare-fun m!148233 () Bool)

(assert (=> b!126930 m!148233))

(assert (=> b!126930 m!147759))

(assert (=> b!126930 m!147759))

(declare-fun m!148235 () Bool)

(assert (=> b!126930 m!148235))

(assert (=> b!126932 m!147759))

(assert (=> b!126932 m!147759))

(assert (=> b!126932 m!148235))

(assert (=> d!38217 d!38365))

(declare-fun b!126936 () Bool)

(declare-fun e!82876 () Option!174)

(assert (=> b!126936 (= e!82876 None!172)))

(declare-fun b!126933 () Bool)

(declare-fun e!82875 () Option!174)

(assert (=> b!126933 (= e!82875 (Some!173 (_2!1273 (h!2276 lt!65438))))))

(declare-fun b!126935 () Bool)

(assert (=> b!126935 (= e!82876 (getValueByKey!168 (t!6017 lt!65438) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun d!38367 () Bool)

(declare-fun c!23244 () Bool)

(assert (=> d!38367 (= c!23244 (and ((_ is Cons!1674) lt!65438) (= (_1!1273 (h!2276 lt!65438)) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38367 (= (getValueByKey!168 lt!65438 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!82875)))

(declare-fun b!126934 () Bool)

(assert (=> b!126934 (= e!82875 e!82876)))

(declare-fun c!23245 () Bool)

(assert (=> b!126934 (= c!23245 (and ((_ is Cons!1674) lt!65438) (not (= (_1!1273 (h!2276 lt!65438)) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38367 c!23244) b!126933))

(assert (= (and d!38367 (not c!23244)) b!126934))

(assert (= (and b!126934 c!23245) b!126935))

(assert (= (and b!126934 (not c!23245)) b!126936))

(declare-fun m!148237 () Bool)

(assert (=> b!126935 m!148237))

(assert (=> d!38217 d!38367))

(declare-fun d!38369 () Bool)

(assert (=> d!38369 (= (getValueByKey!168 lt!65438 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65604 () Unit!3928)

(assert (=> d!38369 (= lt!65604 (choose!776 lt!65438 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!82877 () Bool)

(assert (=> d!38369 e!82877))

(declare-fun res!61363 () Bool)

(assert (=> d!38369 (=> (not res!61363) (not e!82877))))

(assert (=> d!38369 (= res!61363 (isStrictlySorted!304 lt!65438))))

(assert (=> d!38369 (= (lemmaContainsTupThenGetReturnValue!83 lt!65438 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65604)))

(declare-fun b!126937 () Bool)

(declare-fun res!61364 () Bool)

(assert (=> b!126937 (=> (not res!61364) (not e!82877))))

(assert (=> b!126937 (= res!61364 (containsKey!171 lt!65438 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126938 () Bool)

(assert (=> b!126938 (= e!82877 (contains!866 lt!65438 (tuple2!2525 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38369 res!61363) b!126937))

(assert (= (and b!126937 res!61364) b!126938))

(assert (=> d!38369 m!147753))

(declare-fun m!148239 () Bool)

(assert (=> d!38369 m!148239))

(declare-fun m!148241 () Bool)

(assert (=> d!38369 m!148241))

(declare-fun m!148243 () Bool)

(assert (=> b!126937 m!148243))

(declare-fun m!148245 () Bool)

(assert (=> b!126938 m!148245))

(assert (=> d!38217 d!38369))

(declare-fun bm!13653 () Bool)

(declare-fun call!13657 () List!1678)

(declare-fun call!13658 () List!1678)

(assert (=> bm!13653 (= call!13657 call!13658)))

(declare-fun b!126939 () Bool)

(declare-fun e!82882 () List!1678)

(declare-fun call!13656 () List!1678)

(assert (=> b!126939 (= e!82882 call!13656)))

(declare-fun b!126940 () Bool)

(declare-fun e!82879 () List!1678)

(assert (=> b!126940 (= e!82879 (insertStrictlySorted!86 (t!6017 (toList!832 call!13591)) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126941 () Bool)

(declare-fun e!82881 () List!1678)

(declare-fun e!82878 () List!1678)

(assert (=> b!126941 (= e!82881 e!82878)))

(declare-fun c!23248 () Bool)

(assert (=> b!126941 (= c!23248 (and ((_ is Cons!1674) (toList!832 call!13591)) (= (_1!1273 (h!2276 (toList!832 call!13591))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun c!23249 () Bool)

(declare-fun b!126942 () Bool)

(assert (=> b!126942 (= e!82879 (ite c!23248 (t!6017 (toList!832 call!13591)) (ite c!23249 (Cons!1674 (h!2276 (toList!832 call!13591)) (t!6017 (toList!832 call!13591))) Nil!1675)))))

(declare-fun b!126943 () Bool)

(assert (=> b!126943 (= e!82882 call!13656)))

(declare-fun b!126944 () Bool)

(assert (=> b!126944 (= e!82881 call!13658)))

(declare-fun c!23246 () Bool)

(declare-fun bm!13654 () Bool)

(assert (=> bm!13654 (= call!13658 ($colon$colon!88 e!82879 (ite c!23246 (h!2276 (toList!832 call!13591)) (tuple2!2525 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23247 () Bool)

(assert (=> bm!13654 (= c!23247 c!23246)))

(declare-fun d!38371 () Bool)

(declare-fun e!82880 () Bool)

(assert (=> d!38371 e!82880))

(declare-fun res!61366 () Bool)

(assert (=> d!38371 (=> (not res!61366) (not e!82880))))

(declare-fun lt!65605 () List!1678)

(assert (=> d!38371 (= res!61366 (isStrictlySorted!304 lt!65605))))

(assert (=> d!38371 (= lt!65605 e!82881)))

(assert (=> d!38371 (= c!23246 (and ((_ is Cons!1674) (toList!832 call!13591)) (bvslt (_1!1273 (h!2276 (toList!832 call!13591))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38371 (isStrictlySorted!304 (toList!832 call!13591))))

(assert (=> d!38371 (= (insertStrictlySorted!86 (toList!832 call!13591) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65605)))

(declare-fun b!126945 () Bool)

(assert (=> b!126945 (= c!23249 (and ((_ is Cons!1674) (toList!832 call!13591)) (bvsgt (_1!1273 (h!2276 (toList!832 call!13591))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!126945 (= e!82878 e!82882)))

(declare-fun b!126946 () Bool)

(assert (=> b!126946 (= e!82878 call!13657)))

(declare-fun b!126947 () Bool)

(declare-fun res!61365 () Bool)

(assert (=> b!126947 (=> (not res!61365) (not e!82880))))

(assert (=> b!126947 (= res!61365 (containsKey!171 lt!65605 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun bm!13655 () Bool)

(assert (=> bm!13655 (= call!13656 call!13657)))

(declare-fun b!126948 () Bool)

(assert (=> b!126948 (= e!82880 (contains!866 lt!65605 (tuple2!2525 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38371 c!23246) b!126944))

(assert (= (and d!38371 (not c!23246)) b!126941))

(assert (= (and b!126941 c!23248) b!126946))

(assert (= (and b!126941 (not c!23248)) b!126945))

(assert (= (and b!126945 c!23249) b!126939))

(assert (= (and b!126945 (not c!23249)) b!126943))

(assert (= (or b!126939 b!126943) bm!13655))

(assert (= (or b!126946 bm!13655) bm!13653))

(assert (= (or b!126944 bm!13653) bm!13654))

(assert (= (and bm!13654 c!23247) b!126940))

(assert (= (and bm!13654 (not c!23247)) b!126942))

(assert (= (and d!38371 res!61366) b!126947))

(assert (= (and b!126947 res!61365) b!126948))

(declare-fun m!148247 () Bool)

(assert (=> b!126948 m!148247))

(declare-fun m!148249 () Bool)

(assert (=> b!126940 m!148249))

(declare-fun m!148251 () Bool)

(assert (=> b!126947 m!148251))

(declare-fun m!148253 () Bool)

(assert (=> d!38371 m!148253))

(declare-fun m!148255 () Bool)

(assert (=> d!38371 m!148255))

(declare-fun m!148257 () Bool)

(assert (=> bm!13654 m!148257))

(assert (=> d!38217 d!38371))

(declare-fun b!126949 () Bool)

(declare-fun e!82883 () Bool)

(declare-fun e!82884 () Bool)

(assert (=> b!126949 (= e!82883 e!82884)))

(assert (=> b!126949 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun res!61370 () Bool)

(declare-fun lt!65606 () ListLongMap!1633)

(assert (=> b!126949 (= res!61370 (contains!864 lt!65606 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!126949 (=> (not res!61370) (not e!82884))))

(declare-fun b!126950 () Bool)

(declare-fun e!82888 () Bool)

(assert (=> b!126950 (= e!82888 (= lt!65606 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun bm!13656 () Bool)

(declare-fun call!13659 () ListLongMap!1633)

(assert (=> bm!13656 (= call!13659 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126951 () Bool)

(declare-fun e!82887 () ListLongMap!1633)

(declare-fun e!82889 () ListLongMap!1633)

(assert (=> b!126951 (= e!82887 e!82889)))

(declare-fun c!23252 () Bool)

(assert (=> b!126951 (= c!23252 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!126952 () Bool)

(declare-fun lt!65610 () Unit!3928)

(declare-fun lt!65609 () Unit!3928)

(assert (=> b!126952 (= lt!65610 lt!65609)))

(declare-fun lt!65612 () V!3433)

(declare-fun lt!65611 () ListLongMap!1633)

(declare-fun lt!65608 () (_ BitVec 64))

(declare-fun lt!65607 () (_ BitVec 64))

(assert (=> b!126952 (not (contains!864 (+!164 lt!65611 (tuple2!2525 lt!65607 lt!65612)) lt!65608))))

(assert (=> b!126952 (= lt!65609 (addStillNotContains!58 lt!65611 lt!65607 lt!65612 lt!65608))))

(assert (=> b!126952 (= lt!65608 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126952 (= lt!65612 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126952 (= lt!65607 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!126952 (= lt!65611 call!13659)))

(assert (=> b!126952 (= e!82889 (+!164 call!13659 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38373 () Bool)

(declare-fun e!82886 () Bool)

(assert (=> d!38373 e!82886))

(declare-fun res!61368 () Bool)

(assert (=> d!38373 (=> (not res!61368) (not e!82886))))

(assert (=> d!38373 (= res!61368 (not (contains!864 lt!65606 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38373 (= lt!65606 e!82887)))

(declare-fun c!23251 () Bool)

(assert (=> d!38373 (= c!23251 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38373 (validMask!0 (mask!7038 (v!3124 (underlying!439 thiss!992))))))

(assert (=> d!38373 (= (getCurrentListMapNoExtraKeys!131 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (_values!2765 (v!3124 (underlying!439 thiss!992))) (mask!7038 (v!3124 (underlying!439 thiss!992))) (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) (minValue!2645 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992)))) lt!65606)))

(declare-fun b!126953 () Bool)

(declare-fun res!61369 () Bool)

(assert (=> b!126953 (=> (not res!61369) (not e!82886))))

(assert (=> b!126953 (= res!61369 (not (contains!864 lt!65606 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126954 () Bool)

(declare-fun e!82885 () Bool)

(assert (=> b!126954 (= e!82885 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!126954 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!126955 () Bool)

(assert (=> b!126955 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> b!126955 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2481 (_values!2765 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> b!126955 (= e!82884 (= (apply!111 lt!65606 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126956 () Bool)

(assert (=> b!126956 (= e!82889 call!13659)))

(declare-fun b!126957 () Bool)

(assert (=> b!126957 (= e!82883 e!82888)))

(declare-fun c!23250 () Bool)

(assert (=> b!126957 (= c!23250 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126958 () Bool)

(assert (=> b!126958 (= e!82888 (isEmpty!403 lt!65606))))

(declare-fun b!126959 () Bool)

(assert (=> b!126959 (= e!82886 e!82883)))

(declare-fun c!23253 () Bool)

(assert (=> b!126959 (= c!23253 e!82885)))

(declare-fun res!61367 () Bool)

(assert (=> b!126959 (=> (not res!61367) (not e!82885))))

(assert (=> b!126959 (= res!61367 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126960 () Bool)

(assert (=> b!126960 (= e!82887 (ListLongMap!1634 Nil!1675))))

(assert (= (and d!38373 c!23251) b!126960))

(assert (= (and d!38373 (not c!23251)) b!126951))

(assert (= (and b!126951 c!23252) b!126952))

(assert (= (and b!126951 (not c!23252)) b!126956))

(assert (= (or b!126952 b!126956) bm!13656))

(assert (= (and d!38373 res!61368) b!126953))

(assert (= (and b!126953 res!61369) b!126959))

(assert (= (and b!126959 res!61367) b!126954))

(assert (= (and b!126959 c!23253) b!126949))

(assert (= (and b!126959 (not c!23253)) b!126957))

(assert (= (and b!126949 res!61370) b!126955))

(assert (= (and b!126957 c!23250) b!126950))

(assert (= (and b!126957 (not c!23250)) b!126958))

(declare-fun b_lambda!5605 () Bool)

(assert (=> (not b_lambda!5605) (not b!126952)))

(assert (=> b!126952 t!6014))

(declare-fun b_and!7821 () Bool)

(assert (= b_and!7817 (and (=> t!6014 result!3823) b_and!7821)))

(assert (=> b!126952 t!6016))

(declare-fun b_and!7823 () Bool)

(assert (= b_and!7819 (and (=> t!6016 result!3827) b_and!7823)))

(declare-fun b_lambda!5607 () Bool)

(assert (=> (not b_lambda!5607) (not b!126955)))

(assert (=> b!126955 t!6014))

(declare-fun b_and!7825 () Bool)

(assert (= b_and!7821 (and (=> t!6014 result!3823) b_and!7825)))

(assert (=> b!126955 t!6016))

(declare-fun b_and!7827 () Bool)

(assert (= b_and!7823 (and (=> t!6016 result!3827) b_and!7827)))

(declare-fun m!148259 () Bool)

(assert (=> b!126952 m!148259))

(declare-fun m!148261 () Bool)

(assert (=> b!126952 m!148261))

(declare-fun m!148263 () Bool)

(assert (=> b!126952 m!148263))

(assert (=> b!126952 m!148259))

(declare-fun m!148265 () Bool)

(assert (=> b!126952 m!148265))

(assert (=> b!126952 m!147213))

(declare-fun m!148267 () Bool)

(assert (=> b!126952 m!148267))

(assert (=> b!126952 m!148267))

(assert (=> b!126952 m!147213))

(declare-fun m!148269 () Bool)

(assert (=> b!126952 m!148269))

(declare-fun m!148271 () Bool)

(assert (=> b!126952 m!148271))

(declare-fun m!148273 () Bool)

(assert (=> b!126950 m!148273))

(declare-fun m!148275 () Bool)

(assert (=> b!126958 m!148275))

(declare-fun m!148277 () Bool)

(assert (=> d!38373 m!148277))

(assert (=> d!38373 m!147201))

(assert (=> bm!13656 m!148273))

(assert (=> b!126955 m!148261))

(declare-fun m!148279 () Bool)

(assert (=> b!126955 m!148279))

(assert (=> b!126955 m!148261))

(assert (=> b!126955 m!147213))

(assert (=> b!126955 m!148267))

(assert (=> b!126955 m!148267))

(assert (=> b!126955 m!147213))

(assert (=> b!126955 m!148269))

(assert (=> b!126954 m!148261))

(assert (=> b!126954 m!148261))

(declare-fun m!148281 () Bool)

(assert (=> b!126954 m!148281))

(assert (=> b!126951 m!148261))

(assert (=> b!126951 m!148261))

(assert (=> b!126951 m!148281))

(assert (=> b!126949 m!148261))

(assert (=> b!126949 m!148261))

(declare-fun m!148283 () Bool)

(assert (=> b!126949 m!148283))

(declare-fun m!148285 () Bool)

(assert (=> b!126953 m!148285))

(assert (=> bm!13640 d!38373))

(declare-fun b!126961 () Bool)

(declare-fun e!82893 () Bool)

(declare-fun call!13660 () Bool)

(assert (=> b!126961 (= e!82893 call!13660)))

(declare-fun b!126962 () Bool)

(assert (=> b!126962 (= e!82893 call!13660)))

(declare-fun b!126963 () Bool)

(declare-fun e!82891 () Bool)

(assert (=> b!126963 (= e!82891 e!82893)))

(declare-fun c!23254 () Bool)

(assert (=> b!126963 (= c!23254 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!126964 () Bool)

(declare-fun e!82892 () Bool)

(assert (=> b!126964 (= e!82892 e!82891)))

(declare-fun res!61372 () Bool)

(assert (=> b!126964 (=> (not res!61372) (not e!82891))))

(declare-fun e!82890 () Bool)

(assert (=> b!126964 (= res!61372 (not e!82890))))

(declare-fun res!61371 () Bool)

(assert (=> b!126964 (=> (not res!61371) (not e!82890))))

(assert (=> b!126964 (= res!61371 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!126965 () Bool)

(assert (=> b!126965 (= e!82890 (contains!867 (ite c!23170 (Cons!1676 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) Nil!1677) Nil!1677) (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!13657 () Bool)

(assert (=> bm!13657 (= call!13660 (arrayNoDuplicates!0 (_keys!4515 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!23254 (Cons!1676 (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!23170 (Cons!1676 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) Nil!1677) Nil!1677)) (ite c!23170 (Cons!1676 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) Nil!1677) Nil!1677))))))

(declare-fun d!38375 () Bool)

(declare-fun res!61373 () Bool)

(assert (=> d!38375 (=> res!61373 e!82892)))

(assert (=> d!38375 (= res!61373 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38375 (= (arrayNoDuplicates!0 (_keys!4515 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23170 (Cons!1676 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) Nil!1677) Nil!1677)) e!82892)))

(assert (= (and d!38375 (not res!61373)) b!126964))

(assert (= (and b!126964 res!61371) b!126965))

(assert (= (and b!126964 res!61372) b!126963))

(assert (= (and b!126963 c!23254) b!126961))

(assert (= (and b!126963 (not c!23254)) b!126962))

(assert (= (or b!126961 b!126962) bm!13657))

(declare-fun m!148287 () Bool)

(assert (=> b!126963 m!148287))

(assert (=> b!126963 m!148287))

(declare-fun m!148289 () Bool)

(assert (=> b!126963 m!148289))

(assert (=> b!126964 m!148287))

(assert (=> b!126964 m!148287))

(assert (=> b!126964 m!148289))

(assert (=> b!126965 m!148287))

(assert (=> b!126965 m!148287))

(declare-fun m!148291 () Bool)

(assert (=> b!126965 m!148291))

(assert (=> bm!13657 m!148287))

(declare-fun m!148293 () Bool)

(assert (=> bm!13657 m!148293))

(assert (=> bm!13630 d!38375))

(declare-fun d!38377 () Bool)

(declare-fun e!82895 () Bool)

(assert (=> d!38377 e!82895))

(declare-fun res!61374 () Bool)

(assert (=> d!38377 (=> res!61374 e!82895)))

(declare-fun lt!65614 () Bool)

(assert (=> d!38377 (= res!61374 (not lt!65614))))

(declare-fun lt!65613 () Bool)

(assert (=> d!38377 (= lt!65614 lt!65613)))

(declare-fun lt!65616 () Unit!3928)

(declare-fun e!82894 () Unit!3928)

(assert (=> d!38377 (= lt!65616 e!82894)))

(declare-fun c!23255 () Bool)

(assert (=> d!38377 (= c!23255 lt!65613)))

(assert (=> d!38377 (= lt!65613 (containsKey!171 (toList!832 lt!65356) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38377 (= (contains!864 lt!65356 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65614)))

(declare-fun b!126966 () Bool)

(declare-fun lt!65615 () Unit!3928)

(assert (=> b!126966 (= e!82894 lt!65615)))

(assert (=> b!126966 (= lt!65615 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65356) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126966 (isDefined!120 (getValueByKey!168 (toList!832 lt!65356) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126967 () Bool)

(declare-fun Unit!3950 () Unit!3928)

(assert (=> b!126967 (= e!82894 Unit!3950)))

(declare-fun b!126968 () Bool)

(assert (=> b!126968 (= e!82895 (isDefined!120 (getValueByKey!168 (toList!832 lt!65356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38377 c!23255) b!126966))

(assert (= (and d!38377 (not c!23255)) b!126967))

(assert (= (and d!38377 (not res!61374)) b!126968))

(declare-fun m!148295 () Bool)

(assert (=> d!38377 m!148295))

(declare-fun m!148297 () Bool)

(assert (=> b!126966 m!148297))

(declare-fun m!148299 () Bool)

(assert (=> b!126966 m!148299))

(assert (=> b!126966 m!148299))

(declare-fun m!148301 () Bool)

(assert (=> b!126966 m!148301))

(assert (=> b!126968 m!148299))

(assert (=> b!126968 m!148299))

(assert (=> b!126968 m!148301))

(assert (=> bm!13604 d!38377))

(declare-fun d!38379 () Bool)

(assert (=> d!38379 (= (validMask!0 (mask!7038 newMap!16)) (and (or (= (mask!7038 newMap!16) #b00000000000000000000000000000111) (= (mask!7038 newMap!16) #b00000000000000000000000000001111) (= (mask!7038 newMap!16) #b00000000000000000000000000011111) (= (mask!7038 newMap!16) #b00000000000000000000000000111111) (= (mask!7038 newMap!16) #b00000000000000000000000001111111) (= (mask!7038 newMap!16) #b00000000000000000000000011111111) (= (mask!7038 newMap!16) #b00000000000000000000000111111111) (= (mask!7038 newMap!16) #b00000000000000000000001111111111) (= (mask!7038 newMap!16) #b00000000000000000000011111111111) (= (mask!7038 newMap!16) #b00000000000000000000111111111111) (= (mask!7038 newMap!16) #b00000000000000000001111111111111) (= (mask!7038 newMap!16) #b00000000000000000011111111111111) (= (mask!7038 newMap!16) #b00000000000000000111111111111111) (= (mask!7038 newMap!16) #b00000000000000001111111111111111) (= (mask!7038 newMap!16) #b00000000000000011111111111111111) (= (mask!7038 newMap!16) #b00000000000000111111111111111111) (= (mask!7038 newMap!16) #b00000000000001111111111111111111) (= (mask!7038 newMap!16) #b00000000000011111111111111111111) (= (mask!7038 newMap!16) #b00000000000111111111111111111111) (= (mask!7038 newMap!16) #b00000000001111111111111111111111) (= (mask!7038 newMap!16) #b00000000011111111111111111111111) (= (mask!7038 newMap!16) #b00000000111111111111111111111111) (= (mask!7038 newMap!16) #b00000001111111111111111111111111) (= (mask!7038 newMap!16) #b00000011111111111111111111111111) (= (mask!7038 newMap!16) #b00000111111111111111111111111111) (= (mask!7038 newMap!16) #b00001111111111111111111111111111) (= (mask!7038 newMap!16) #b00011111111111111111111111111111) (= (mask!7038 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7038 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!38221 d!38379))

(declare-fun d!38381 () Bool)

(assert (=> d!38381 (= (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126515 d!38381))

(assert (=> b!126649 d!38381))

(declare-fun d!38383 () Bool)

(declare-fun e!82897 () Bool)

(assert (=> d!38383 e!82897))

(declare-fun res!61375 () Bool)

(assert (=> d!38383 (=> res!61375 e!82897)))

(declare-fun lt!65618 () Bool)

(assert (=> d!38383 (= res!61375 (not lt!65618))))

(declare-fun lt!65617 () Bool)

(assert (=> d!38383 (= lt!65618 lt!65617)))

(declare-fun lt!65620 () Unit!3928)

(declare-fun e!82896 () Unit!3928)

(assert (=> d!38383 (= lt!65620 e!82896)))

(declare-fun c!23256 () Bool)

(assert (=> d!38383 (= c!23256 lt!65617)))

(assert (=> d!38383 (= lt!65617 (containsKey!171 (toList!832 lt!65501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38383 (= (contains!864 lt!65501 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65618)))

(declare-fun b!126969 () Bool)

(declare-fun lt!65619 () Unit!3928)

(assert (=> b!126969 (= e!82896 lt!65619)))

(assert (=> b!126969 (= lt!65619 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126969 (isDefined!120 (getValueByKey!168 (toList!832 lt!65501) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126970 () Bool)

(declare-fun Unit!3951 () Unit!3928)

(assert (=> b!126970 (= e!82896 Unit!3951)))

(declare-fun b!126971 () Bool)

(assert (=> b!126971 (= e!82897 (isDefined!120 (getValueByKey!168 (toList!832 lt!65501) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38383 c!23256) b!126969))

(assert (= (and d!38383 (not c!23256)) b!126970))

(assert (= (and d!38383 (not res!61375)) b!126971))

(declare-fun m!148303 () Bool)

(assert (=> d!38383 m!148303))

(declare-fun m!148305 () Bool)

(assert (=> b!126969 m!148305))

(declare-fun m!148307 () Bool)

(assert (=> b!126969 m!148307))

(assert (=> b!126969 m!148307))

(declare-fun m!148309 () Bool)

(assert (=> b!126969 m!148309))

(assert (=> b!126971 m!148307))

(assert (=> b!126971 m!148307))

(assert (=> b!126971 m!148309))

(assert (=> d!38249 d!38383))

(assert (=> d!38249 d!38143))

(declare-fun d!38385 () Bool)

(assert (=> d!38385 (isDefined!120 (getValueByKey!168 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65621 () Unit!3928)

(assert (=> d!38385 (= lt!65621 (choose!770 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!82898 () Bool)

(assert (=> d!38385 e!82898))

(declare-fun res!61376 () Bool)

(assert (=> d!38385 (=> (not res!61376) (not e!82898))))

(assert (=> d!38385 (= res!61376 (isStrictlySorted!304 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))))

(assert (=> d!38385 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65621)))

(declare-fun b!126972 () Bool)

(assert (=> b!126972 (= e!82898 (containsKey!171 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38385 res!61376) b!126972))

(assert (=> d!38385 m!147207))

(assert (=> d!38385 m!147955))

(assert (=> d!38385 m!147955))

(assert (=> d!38385 m!147957))

(assert (=> d!38385 m!147207))

(declare-fun m!148311 () Bool)

(assert (=> d!38385 m!148311))

(declare-fun m!148313 () Bool)

(assert (=> d!38385 m!148313))

(assert (=> b!126972 m!147207))

(assert (=> b!126972 m!147951))

(assert (=> b!126767 d!38385))

(declare-fun d!38387 () Bool)

(assert (=> d!38387 (= (isDefined!120 (getValueByKey!168 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))) (not (isEmpty!402 (getValueByKey!168 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun bs!5265 () Bool)

(assert (= bs!5265 d!38387))

(assert (=> bs!5265 m!147955))

(declare-fun m!148315 () Bool)

(assert (=> bs!5265 m!148315))

(assert (=> b!126767 d!38387))

(declare-fun b!126976 () Bool)

(declare-fun e!82900 () Option!174)

(assert (=> b!126976 (= e!82900 None!172)))

(declare-fun b!126973 () Bool)

(declare-fun e!82899 () Option!174)

(assert (=> b!126973 (= e!82899 (Some!173 (_2!1273 (h!2276 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))))))

(declare-fun b!126975 () Bool)

(assert (=> b!126975 (= e!82900 (getValueByKey!168 (t!6017 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun c!23257 () Bool)

(declare-fun d!38389 () Bool)

(assert (=> d!38389 (= c!23257 (and ((_ is Cons!1674) (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))) (= (_1!1273 (h!2276 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38389 (= (getValueByKey!168 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82899)))

(declare-fun b!126974 () Bool)

(assert (=> b!126974 (= e!82899 e!82900)))

(declare-fun c!23258 () Bool)

(assert (=> b!126974 (= c!23258 (and ((_ is Cons!1674) (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))) (not (= (_1!1273 (h!2276 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(assert (= (and d!38389 c!23257) b!126973))

(assert (= (and d!38389 (not c!23257)) b!126974))

(assert (= (and b!126974 c!23258) b!126975))

(assert (= (and b!126974 (not c!23258)) b!126976))

(assert (=> b!126975 m!147207))

(declare-fun m!148317 () Bool)

(assert (=> b!126975 m!148317))

(assert (=> b!126767 d!38389))

(declare-fun d!38391 () Bool)

(declare-fun e!82902 () Bool)

(assert (=> d!38391 e!82902))

(declare-fun res!61377 () Bool)

(assert (=> d!38391 (=> res!61377 e!82902)))

(declare-fun lt!65623 () Bool)

(assert (=> d!38391 (= res!61377 (not lt!65623))))

(declare-fun lt!65622 () Bool)

(assert (=> d!38391 (= lt!65623 lt!65622)))

(declare-fun lt!65625 () Unit!3928)

(declare-fun e!82901 () Unit!3928)

(assert (=> d!38391 (= lt!65625 e!82901)))

(declare-fun c!23259 () Bool)

(assert (=> d!38391 (= c!23259 lt!65622)))

(assert (=> d!38391 (= lt!65622 (containsKey!171 (toList!832 lt!65356) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38391 (= (contains!864 lt!65356 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65623)))

(declare-fun b!126977 () Bool)

(declare-fun lt!65624 () Unit!3928)

(assert (=> b!126977 (= e!82901 lt!65624)))

(assert (=> b!126977 (= lt!65624 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65356) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126977 (isDefined!120 (getValueByKey!168 (toList!832 lt!65356) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126978 () Bool)

(declare-fun Unit!3952 () Unit!3928)

(assert (=> b!126978 (= e!82901 Unit!3952)))

(declare-fun b!126979 () Bool)

(assert (=> b!126979 (= e!82902 (isDefined!120 (getValueByKey!168 (toList!832 lt!65356) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38391 c!23259) b!126977))

(assert (= (and d!38391 (not c!23259)) b!126978))

(assert (= (and d!38391 (not res!61377)) b!126979))

(declare-fun m!148319 () Bool)

(assert (=> d!38391 m!148319))

(declare-fun m!148321 () Bool)

(assert (=> b!126977 m!148321))

(declare-fun m!148323 () Bool)

(assert (=> b!126977 m!148323))

(assert (=> b!126977 m!148323))

(declare-fun m!148325 () Bool)

(assert (=> b!126977 m!148325))

(assert (=> b!126979 m!148323))

(assert (=> b!126979 m!148323))

(assert (=> b!126979 m!148325))

(assert (=> bm!13608 d!38391))

(declare-fun d!38393 () Bool)

(assert (=> d!38393 (= (get!1456 (getValueByKey!168 (toList!832 lt!65214) lt!65212)) (v!3130 (getValueByKey!168 (toList!832 lt!65214) lt!65212)))))

(assert (=> d!38243 d!38393))

(declare-fun b!126983 () Bool)

(declare-fun e!82904 () Option!174)

(assert (=> b!126983 (= e!82904 None!172)))

(declare-fun b!126980 () Bool)

(declare-fun e!82903 () Option!174)

(assert (=> b!126980 (= e!82903 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65214)))))))

(declare-fun b!126982 () Bool)

(assert (=> b!126982 (= e!82904 (getValueByKey!168 (t!6017 (toList!832 lt!65214)) lt!65212))))

(declare-fun d!38395 () Bool)

(declare-fun c!23260 () Bool)

(assert (=> d!38395 (= c!23260 (and ((_ is Cons!1674) (toList!832 lt!65214)) (= (_1!1273 (h!2276 (toList!832 lt!65214))) lt!65212)))))

(assert (=> d!38395 (= (getValueByKey!168 (toList!832 lt!65214) lt!65212) e!82903)))

(declare-fun b!126981 () Bool)

(assert (=> b!126981 (= e!82903 e!82904)))

(declare-fun c!23261 () Bool)

(assert (=> b!126981 (= c!23261 (and ((_ is Cons!1674) (toList!832 lt!65214)) (not (= (_1!1273 (h!2276 (toList!832 lt!65214))) lt!65212))))))

(assert (= (and d!38395 c!23260) b!126980))

(assert (= (and d!38395 (not c!23260)) b!126981))

(assert (= (and b!126981 c!23261) b!126982))

(assert (= (and b!126981 (not c!23261)) b!126983))

(declare-fun m!148327 () Bool)

(assert (=> b!126982 m!148327))

(assert (=> d!38243 d!38395))

(assert (=> b!126484 d!38177))

(declare-fun d!38397 () Bool)

(assert (=> d!38397 (= (apply!111 lt!65356 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1456 (getValueByKey!168 (toList!832 lt!65356) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5266 () Bool)

(assert (= bs!5266 d!38397))

(assert (=> bs!5266 m!147525))

(declare-fun m!148329 () Bool)

(assert (=> bs!5266 m!148329))

(assert (=> bs!5266 m!148329))

(declare-fun m!148331 () Bool)

(assert (=> bs!5266 m!148331))

(assert (=> b!126510 d!38397))

(declare-fun c!23262 () Bool)

(declare-fun d!38399 () Bool)

(assert (=> d!38399 (= c!23262 ((_ is ValueCellFull!1076) (select (arr!2217 (ite c!23087 (_values!2765 newMap!16) lt!65155)) #b00000000000000000000000000000000)))))

(declare-fun e!82905 () V!3433)

(assert (=> d!38399 (= (get!1452 (select (arr!2217 (ite c!23087 (_values!2765 newMap!16) lt!65155)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82905)))

(declare-fun b!126984 () Bool)

(assert (=> b!126984 (= e!82905 (get!1454 (select (arr!2217 (ite c!23087 (_values!2765 newMap!16) lt!65155)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126985 () Bool)

(assert (=> b!126985 (= e!82905 (get!1455 (select (arr!2217 (ite c!23087 (_values!2765 newMap!16) lt!65155)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38399 c!23262) b!126984))

(assert (= (and d!38399 (not c!23262)) b!126985))

(assert (=> b!126984 m!147573))

(assert (=> b!126984 m!147569))

(declare-fun m!148333 () Bool)

(assert (=> b!126984 m!148333))

(assert (=> b!126985 m!147573))

(assert (=> b!126985 m!147569))

(declare-fun m!148335 () Bool)

(assert (=> b!126985 m!148335))

(assert (=> b!126510 d!38399))

(declare-fun lt!65626 () Bool)

(declare-fun d!38401 () Bool)

(assert (=> d!38401 (= lt!65626 (select (content!126 (toList!832 lt!65508)) (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!82906 () Bool)

(assert (=> d!38401 (= lt!65626 e!82906)))

(declare-fun res!61379 () Bool)

(assert (=> d!38401 (=> (not res!61379) (not e!82906))))

(assert (=> d!38401 (= res!61379 ((_ is Cons!1674) (toList!832 lt!65508)))))

(assert (=> d!38401 (= (contains!866 (toList!832 lt!65508) (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65626)))

(declare-fun b!126986 () Bool)

(declare-fun e!82907 () Bool)

(assert (=> b!126986 (= e!82906 e!82907)))

(declare-fun res!61378 () Bool)

(assert (=> b!126986 (=> res!61378 e!82907)))

(assert (=> b!126986 (= res!61378 (= (h!2276 (toList!832 lt!65508)) (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126987 () Bool)

(assert (=> b!126987 (= e!82907 (contains!866 (t!6017 (toList!832 lt!65508)) (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38401 res!61379) b!126986))

(assert (= (and b!126986 (not res!61378)) b!126987))

(declare-fun m!148337 () Bool)

(assert (=> d!38401 m!148337))

(declare-fun m!148339 () Bool)

(assert (=> d!38401 m!148339))

(declare-fun m!148341 () Bool)

(assert (=> b!126987 m!148341))

(assert (=> b!126757 d!38401))

(declare-fun d!38403 () Bool)

(assert (=> d!38403 (= (get!1456 (getValueByKey!168 (toList!832 lt!65227) lt!65224)) (v!3130 (getValueByKey!168 (toList!832 lt!65227) lt!65224)))))

(assert (=> d!38255 d!38403))

(declare-fun b!126991 () Bool)

(declare-fun e!82909 () Option!174)

(assert (=> b!126991 (= e!82909 None!172)))

(declare-fun b!126988 () Bool)

(declare-fun e!82908 () Option!174)

(assert (=> b!126988 (= e!82908 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65227)))))))

(declare-fun b!126990 () Bool)

(assert (=> b!126990 (= e!82909 (getValueByKey!168 (t!6017 (toList!832 lt!65227)) lt!65224))))

(declare-fun d!38405 () Bool)

(declare-fun c!23263 () Bool)

(assert (=> d!38405 (= c!23263 (and ((_ is Cons!1674) (toList!832 lt!65227)) (= (_1!1273 (h!2276 (toList!832 lt!65227))) lt!65224)))))

(assert (=> d!38405 (= (getValueByKey!168 (toList!832 lt!65227) lt!65224) e!82908)))

(declare-fun b!126989 () Bool)

(assert (=> b!126989 (= e!82908 e!82909)))

(declare-fun c!23264 () Bool)

(assert (=> b!126989 (= c!23264 (and ((_ is Cons!1674) (toList!832 lt!65227)) (not (= (_1!1273 (h!2276 (toList!832 lt!65227))) lt!65224))))))

(assert (= (and d!38405 c!23263) b!126988))

(assert (= (and d!38405 (not c!23263)) b!126989))

(assert (= (and b!126989 c!23264) b!126990))

(assert (= (and b!126989 (not c!23264)) b!126991))

(declare-fun m!148343 () Bool)

(assert (=> b!126990 m!148343))

(assert (=> d!38255 d!38405))

(declare-fun d!38407 () Bool)

(declare-fun e!82911 () Bool)

(assert (=> d!38407 e!82911))

(declare-fun res!61380 () Bool)

(assert (=> d!38407 (=> res!61380 e!82911)))

(declare-fun lt!65628 () Bool)

(assert (=> d!38407 (= res!61380 (not lt!65628))))

(declare-fun lt!65627 () Bool)

(assert (=> d!38407 (= lt!65628 lt!65627)))

(declare-fun lt!65630 () Unit!3928)

(declare-fun e!82910 () Unit!3928)

(assert (=> d!38407 (= lt!65630 e!82910)))

(declare-fun c!23265 () Bool)

(assert (=> d!38407 (= c!23265 lt!65627)))

(assert (=> d!38407 (= lt!65627 (containsKey!171 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))))

(assert (=> d!38407 (= (contains!864 (getCurrentListMap!512 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))) lt!65628)))

(declare-fun b!126992 () Bool)

(declare-fun lt!65629 () Unit!3928)

(assert (=> b!126992 (= e!82910 lt!65629)))

(assert (=> b!126992 (= lt!65629 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))))

(assert (=> b!126992 (isDefined!120 (getValueByKey!168 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))))

(declare-fun b!126993 () Bool)

(declare-fun Unit!3953 () Unit!3928)

(assert (=> b!126993 (= e!82910 Unit!3953)))

(declare-fun b!126994 () Bool)

(assert (=> b!126994 (= e!82911 (isDefined!120 (getValueByKey!168 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(assert (= (and d!38407 c!23265) b!126992))

(assert (= (and d!38407 (not c!23265)) b!126993))

(assert (= (and d!38407 (not res!61380)) b!126994))

(assert (=> d!38407 m!147365))

(declare-fun m!148345 () Bool)

(assert (=> d!38407 m!148345))

(assert (=> b!126992 m!147365))

(declare-fun m!148347 () Bool)

(assert (=> b!126992 m!148347))

(assert (=> b!126992 m!147365))

(declare-fun m!148349 () Bool)

(assert (=> b!126992 m!148349))

(assert (=> b!126992 m!148349))

(declare-fun m!148351 () Bool)

(assert (=> b!126992 m!148351))

(assert (=> b!126994 m!147365))

(assert (=> b!126994 m!148349))

(assert (=> b!126994 m!148349))

(assert (=> b!126994 m!148351))

(assert (=> b!126763 d!38407))

(declare-fun b!126995 () Bool)

(declare-fun e!82917 () Bool)

(declare-fun e!82924 () Bool)

(assert (=> b!126995 (= e!82917 e!82924)))

(declare-fun c!23271 () Bool)

(assert (=> b!126995 (= c!23271 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126996 () Bool)

(declare-fun e!82921 () ListLongMap!1633)

(declare-fun e!82922 () ListLongMap!1633)

(assert (=> b!126996 (= e!82921 e!82922)))

(declare-fun c!23267 () Bool)

(assert (=> b!126996 (= c!23267 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!13666 () ListLongMap!1633)

(declare-fun call!13664 () ListLongMap!1633)

(declare-fun call!13667 () ListLongMap!1633)

(declare-fun c!23270 () Bool)

(declare-fun bm!13658 () Bool)

(declare-fun call!13661 () ListLongMap!1633)

(assert (=> bm!13658 (= call!13666 (+!164 (ite c!23270 call!13661 (ite c!23267 call!13664 call!13667)) (ite (or c!23270 c!23267) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun bm!13659 () Bool)

(assert (=> bm!13659 (= call!13661 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13660 () Bool)

(declare-fun call!13665 () Bool)

(declare-fun lt!65645 () ListLongMap!1633)

(assert (=> bm!13660 (= call!13665 (contains!864 lt!65645 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126997 () Bool)

(declare-fun e!82912 () Bool)

(declare-fun e!82916 () Bool)

(assert (=> b!126997 (= e!82912 e!82916)))

(declare-fun res!61385 () Bool)

(assert (=> b!126997 (=> (not res!61385) (not e!82916))))

(assert (=> b!126997 (= res!61385 (contains!864 lt!65645 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun bm!13661 () Bool)

(assert (=> bm!13661 (= call!13667 call!13664)))

(declare-fun b!126998 () Bool)

(declare-fun e!82919 () ListLongMap!1633)

(declare-fun call!13663 () ListLongMap!1633)

(assert (=> b!126998 (= e!82919 call!13663)))

(declare-fun b!126999 () Bool)

(declare-fun res!61381 () Bool)

(assert (=> b!126999 (=> (not res!61381) (not e!82917))))

(assert (=> b!126999 (= res!61381 e!82912)))

(declare-fun res!61382 () Bool)

(assert (=> b!126999 (=> res!61382 e!82912)))

(declare-fun e!82915 () Bool)

(assert (=> b!126999 (= res!61382 (not e!82915))))

(declare-fun res!61387 () Bool)

(assert (=> b!126999 (=> (not res!61387) (not e!82915))))

(assert (=> b!126999 (= res!61387 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127000 () Bool)

(declare-fun e!82918 () Bool)

(assert (=> b!127000 (= e!82918 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127001 () Bool)

(declare-fun e!82913 () Bool)

(assert (=> b!127001 (= e!82913 (= (apply!111 lt!65645 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127002 () Bool)

(declare-fun res!61388 () Bool)

(assert (=> b!127002 (=> (not res!61388) (not e!82917))))

(declare-fun e!82914 () Bool)

(assert (=> b!127002 (= res!61388 e!82914)))

(declare-fun c!23266 () Bool)

(assert (=> b!127002 (= c!23266 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13662 () Bool)

(assert (=> bm!13662 (= call!13663 call!13666)))

(declare-fun b!127003 () Bool)

(assert (=> b!127003 (= e!82922 call!13663)))

(declare-fun b!127004 () Bool)

(assert (=> b!127004 (= e!82919 call!13667)))

(declare-fun bm!13663 () Bool)

(assert (=> bm!13663 (= call!13664 call!13661)))

(declare-fun b!127005 () Bool)

(assert (=> b!127005 (= e!82924 e!82913)))

(declare-fun res!61384 () Bool)

(assert (=> b!127005 (= res!61384 call!13665)))

(assert (=> b!127005 (=> (not res!61384) (not e!82913))))

(declare-fun b!127006 () Bool)

(declare-fun c!23269 () Bool)

(assert (=> b!127006 (= c!23269 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127006 (= e!82922 e!82919)))

(declare-fun b!127007 () Bool)

(assert (=> b!127007 (= e!82924 (not call!13665))))

(declare-fun b!127008 () Bool)

(assert (=> b!127008 (= e!82916 (= (apply!111 lt!65645 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 lt!65155) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 lt!65155)))))

(assert (=> b!127008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127009 () Bool)

(declare-fun call!13662 () Bool)

(assert (=> b!127009 (= e!82914 (not call!13662))))

(declare-fun bm!13664 () Bool)

(assert (=> bm!13664 (= call!13662 (contains!864 lt!65645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127010 () Bool)

(declare-fun e!82923 () Bool)

(assert (=> b!127010 (= e!82923 (= (apply!111 lt!65645 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127011 () Bool)

(declare-fun e!82920 () Unit!3928)

(declare-fun lt!65648 () Unit!3928)

(assert (=> b!127011 (= e!82920 lt!65648)))

(declare-fun lt!65633 () ListLongMap!1633)

(assert (=> b!127011 (= lt!65633 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65652 () (_ BitVec 64))

(assert (=> b!127011 (= lt!65652 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65650 () (_ BitVec 64))

(assert (=> b!127011 (= lt!65650 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65635 () Unit!3928)

(assert (=> b!127011 (= lt!65635 (addStillContains!87 lt!65633 lt!65652 (zeroValue!2645 newMap!16) lt!65650))))

(assert (=> b!127011 (contains!864 (+!164 lt!65633 (tuple2!2525 lt!65652 (zeroValue!2645 newMap!16))) lt!65650)))

(declare-fun lt!65639 () Unit!3928)

(assert (=> b!127011 (= lt!65639 lt!65635)))

(declare-fun lt!65643 () ListLongMap!1633)

(assert (=> b!127011 (= lt!65643 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65636 () (_ BitVec 64))

(assert (=> b!127011 (= lt!65636 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65646 () (_ BitVec 64))

(assert (=> b!127011 (= lt!65646 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65641 () Unit!3928)

(assert (=> b!127011 (= lt!65641 (addApplyDifferent!87 lt!65643 lt!65636 (minValue!2645 newMap!16) lt!65646))))

(assert (=> b!127011 (= (apply!111 (+!164 lt!65643 (tuple2!2525 lt!65636 (minValue!2645 newMap!16))) lt!65646) (apply!111 lt!65643 lt!65646))))

(declare-fun lt!65651 () Unit!3928)

(assert (=> b!127011 (= lt!65651 lt!65641)))

(declare-fun lt!65634 () ListLongMap!1633)

(assert (=> b!127011 (= lt!65634 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65642 () (_ BitVec 64))

(assert (=> b!127011 (= lt!65642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65632 () (_ BitVec 64))

(assert (=> b!127011 (= lt!65632 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65631 () Unit!3928)

(assert (=> b!127011 (= lt!65631 (addApplyDifferent!87 lt!65634 lt!65642 (zeroValue!2645 newMap!16) lt!65632))))

(assert (=> b!127011 (= (apply!111 (+!164 lt!65634 (tuple2!2525 lt!65642 (zeroValue!2645 newMap!16))) lt!65632) (apply!111 lt!65634 lt!65632))))

(declare-fun lt!65640 () Unit!3928)

(assert (=> b!127011 (= lt!65640 lt!65631)))

(declare-fun lt!65647 () ListLongMap!1633)

(assert (=> b!127011 (= lt!65647 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65638 () (_ BitVec 64))

(assert (=> b!127011 (= lt!65638 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65644 () (_ BitVec 64))

(assert (=> b!127011 (= lt!65644 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127011 (= lt!65648 (addApplyDifferent!87 lt!65647 lt!65638 (minValue!2645 newMap!16) lt!65644))))

(assert (=> b!127011 (= (apply!111 (+!164 lt!65647 (tuple2!2525 lt!65638 (minValue!2645 newMap!16))) lt!65644) (apply!111 lt!65647 lt!65644))))

(declare-fun b!127012 () Bool)

(declare-fun Unit!3954 () Unit!3928)

(assert (=> b!127012 (= e!82920 Unit!3954)))

(declare-fun d!38409 () Bool)

(assert (=> d!38409 e!82917))

(declare-fun res!61389 () Bool)

(assert (=> d!38409 (=> (not res!61389) (not e!82917))))

(assert (=> d!38409 (= res!61389 (or (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun lt!65637 () ListLongMap!1633)

(assert (=> d!38409 (= lt!65645 lt!65637)))

(declare-fun lt!65649 () Unit!3928)

(assert (=> d!38409 (= lt!65649 e!82920)))

(declare-fun c!23268 () Bool)

(assert (=> d!38409 (= c!23268 e!82918)))

(declare-fun res!61386 () Bool)

(assert (=> d!38409 (=> (not res!61386) (not e!82918))))

(assert (=> d!38409 (= res!61386 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38409 (= lt!65637 e!82921)))

(assert (=> d!38409 (= c!23270 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38409 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38409 (= (getCurrentListMap!512 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65645)))

(declare-fun b!127013 () Bool)

(assert (=> b!127013 (= e!82915 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127014 () Bool)

(assert (=> b!127014 (= e!82921 (+!164 call!13666 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun b!127015 () Bool)

(assert (=> b!127015 (= e!82914 e!82923)))

(declare-fun res!61383 () Bool)

(assert (=> b!127015 (= res!61383 call!13662)))

(assert (=> b!127015 (=> (not res!61383) (not e!82923))))

(assert (= (and d!38409 c!23270) b!127014))

(assert (= (and d!38409 (not c!23270)) b!126996))

(assert (= (and b!126996 c!23267) b!127003))

(assert (= (and b!126996 (not c!23267)) b!127006))

(assert (= (and b!127006 c!23269) b!126998))

(assert (= (and b!127006 (not c!23269)) b!127004))

(assert (= (or b!126998 b!127004) bm!13661))

(assert (= (or b!127003 bm!13661) bm!13663))

(assert (= (or b!127003 b!126998) bm!13662))

(assert (= (or b!127014 bm!13663) bm!13659))

(assert (= (or b!127014 bm!13662) bm!13658))

(assert (= (and d!38409 res!61386) b!127000))

(assert (= (and d!38409 c!23268) b!127011))

(assert (= (and d!38409 (not c!23268)) b!127012))

(assert (= (and d!38409 res!61389) b!126999))

(assert (= (and b!126999 res!61387) b!127013))

(assert (= (and b!126999 (not res!61382)) b!126997))

(assert (= (and b!126997 res!61385) b!127008))

(assert (= (and b!126999 res!61381) b!127002))

(assert (= (and b!127002 c!23266) b!127015))

(assert (= (and b!127002 (not c!23266)) b!127009))

(assert (= (and b!127015 res!61383) b!127010))

(assert (= (or b!127015 b!127009) bm!13664))

(assert (= (and b!127002 res!61388) b!126995))

(assert (= (and b!126995 c!23271) b!127005))

(assert (= (and b!126995 (not c!23271)) b!127007))

(assert (= (and b!127005 res!61384) b!127001))

(assert (= (or b!127005 b!127007) bm!13660))

(declare-fun b_lambda!5609 () Bool)

(assert (=> (not b_lambda!5609) (not b!127008)))

(assert (=> b!127008 t!6029))

(declare-fun b_and!7829 () Bool)

(assert (= b_and!7825 (and (=> t!6029 result!3843) b_and!7829)))

(assert (=> b!127008 t!6031))

(declare-fun b_and!7831 () Bool)

(assert (= b_and!7827 (and (=> t!6031 result!3845) b_and!7831)))

(assert (=> b!127013 m!147525))

(assert (=> b!127013 m!147525))

(assert (=> b!127013 m!147527))

(declare-fun m!148353 () Bool)

(assert (=> b!127011 m!148353))

(declare-fun m!148355 () Bool)

(assert (=> b!127011 m!148355))

(declare-fun m!148357 () Bool)

(assert (=> b!127011 m!148357))

(declare-fun m!148359 () Bool)

(assert (=> b!127011 m!148359))

(declare-fun m!148361 () Bool)

(assert (=> b!127011 m!148361))

(assert (=> b!127011 m!148359))

(declare-fun m!148363 () Bool)

(assert (=> b!127011 m!148363))

(declare-fun m!148365 () Bool)

(assert (=> b!127011 m!148365))

(declare-fun m!148367 () Bool)

(assert (=> b!127011 m!148367))

(declare-fun m!148369 () Bool)

(assert (=> b!127011 m!148369))

(assert (=> b!127011 m!148355))

(declare-fun m!148371 () Bool)

(assert (=> b!127011 m!148371))

(declare-fun m!148373 () Bool)

(assert (=> b!127011 m!148373))

(declare-fun m!148375 () Bool)

(assert (=> b!127011 m!148375))

(declare-fun m!148377 () Bool)

(assert (=> b!127011 m!148377))

(declare-fun m!148379 () Bool)

(assert (=> b!127011 m!148379))

(declare-fun m!148381 () Bool)

(assert (=> b!127011 m!148381))

(assert (=> b!127011 m!147525))

(assert (=> b!127011 m!148363))

(assert (=> b!127011 m!148375))

(declare-fun m!148383 () Bool)

(assert (=> b!127011 m!148383))

(declare-fun m!148385 () Bool)

(assert (=> bm!13664 m!148385))

(declare-fun m!148387 () Bool)

(assert (=> bm!13658 m!148387))

(assert (=> bm!13659 m!148381))

(declare-fun m!148389 () Bool)

(assert (=> b!127001 m!148389))

(assert (=> b!127000 m!147525))

(assert (=> b!127000 m!147525))

(assert (=> b!127000 m!147527))

(assert (=> b!126997 m!147525))

(assert (=> b!126997 m!147525))

(declare-fun m!148391 () Bool)

(assert (=> b!126997 m!148391))

(assert (=> b!127008 m!147569))

(assert (=> b!127008 m!147525))

(declare-fun m!148393 () Bool)

(assert (=> b!127008 m!148393))

(assert (=> b!127008 m!147525))

(declare-fun m!148395 () Bool)

(assert (=> b!127008 m!148395))

(assert (=> b!127008 m!148395))

(assert (=> b!127008 m!147569))

(declare-fun m!148397 () Bool)

(assert (=> b!127008 m!148397))

(declare-fun m!148399 () Bool)

(assert (=> bm!13660 m!148399))

(declare-fun m!148401 () Bool)

(assert (=> b!127014 m!148401))

(declare-fun m!148403 () Bool)

(assert (=> b!127010 m!148403))

(assert (=> d!38409 m!147517))

(assert (=> b!126763 d!38409))

(assert (=> d!38181 d!38189))

(declare-fun b!127032 () Bool)

(declare-fun e!82934 () Bool)

(declare-fun e!82933 () Bool)

(assert (=> b!127032 (= e!82934 e!82933)))

(declare-fun c!23276 () Bool)

(declare-fun lt!65655 () SeekEntryResult!264)

(assert (=> b!127032 (= c!23276 ((_ is MissingVacant!264) lt!65655))))

(declare-fun b!127033 () Bool)

(assert (=> b!127033 (= e!82933 ((_ is Undefined!264) lt!65655))))

(declare-fun b!127034 () Bool)

(declare-fun res!61401 () Bool)

(declare-fun e!82935 () Bool)

(assert (=> b!127034 (=> (not res!61401) (not e!82935))))

(assert (=> b!127034 (= res!61401 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3214 lt!65655)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!23277 () Bool)

(declare-fun bm!13669 () Bool)

(declare-fun call!13672 () Bool)

(assert (=> bm!13669 (= call!13672 (inRange!0 (ite c!23277 (index!3211 lt!65655) (index!3214 lt!65655)) (mask!7038 newMap!16)))))

(declare-fun b!127035 () Bool)

(declare-fun res!61400 () Bool)

(assert (=> b!127035 (= res!61400 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3211 lt!65655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82936 () Bool)

(assert (=> b!127035 (=> (not res!61400) (not e!82936))))

(declare-fun b!127036 () Bool)

(declare-fun res!61399 () Bool)

(assert (=> b!127036 (=> (not res!61399) (not e!82935))))

(assert (=> b!127036 (= res!61399 call!13672)))

(assert (=> b!127036 (= e!82933 e!82935)))

(declare-fun d!38411 () Bool)

(assert (=> d!38411 e!82934))

(assert (=> d!38411 (= c!23277 ((_ is MissingZero!264) lt!65655))))

(assert (=> d!38411 (= lt!65655 (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(assert (=> d!38411 true))

(declare-fun _$34!950 () Unit!3928)

(assert (=> d!38411 (= (choose!769 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)) _$34!950)))

(declare-fun call!13673 () Bool)

(declare-fun bm!13670 () Bool)

(assert (=> bm!13670 (= call!13673 (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!127037 () Bool)

(assert (=> b!127037 (= e!82936 (not call!13673))))

(declare-fun b!127038 () Bool)

(assert (=> b!127038 (= e!82934 e!82936)))

(declare-fun res!61398 () Bool)

(assert (=> b!127038 (= res!61398 call!13672)))

(assert (=> b!127038 (=> (not res!61398) (not e!82936))))

(declare-fun b!127039 () Bool)

(assert (=> b!127039 (= e!82935 (not call!13673))))

(assert (= (and d!38411 c!23277) b!127038))

(assert (= (and d!38411 (not c!23277)) b!127032))

(assert (= (and b!127038 res!61398) b!127035))

(assert (= (and b!127035 res!61400) b!127037))

(assert (= (and b!127032 c!23276) b!127036))

(assert (= (and b!127032 (not c!23276)) b!127033))

(assert (= (and b!127036 res!61399) b!127034))

(assert (= (and b!127034 res!61401) b!127039))

(assert (= (or b!127038 b!127036) bm!13669))

(assert (= (or b!127037 b!127039) bm!13670))

(assert (=> bm!13670 m!147207))

(assert (=> bm!13670 m!147327))

(assert (=> d!38411 m!147207))

(assert (=> d!38411 m!147355))

(declare-fun m!148405 () Bool)

(assert (=> b!127035 m!148405))

(declare-fun m!148407 () Bool)

(assert (=> b!127034 m!148407))

(declare-fun m!148409 () Bool)

(assert (=> bm!13669 m!148409))

(assert (=> d!38181 d!38411))

(assert (=> d!38181 d!38379))

(declare-fun b!127043 () Bool)

(declare-fun e!82938 () Option!174)

(assert (=> b!127043 (= e!82938 None!172)))

(declare-fun b!127040 () Bool)

(declare-fun e!82937 () Option!174)

(assert (=> b!127040 (= e!82937 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65480)))))))

(declare-fun b!127042 () Bool)

(assert (=> b!127042 (= e!82938 (getValueByKey!168 (t!6017 (toList!832 lt!65480)) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun d!38413 () Bool)

(declare-fun c!23278 () Bool)

(assert (=> d!38413 (= c!23278 (and ((_ is Cons!1674) (toList!832 lt!65480)) (= (_1!1273 (h!2276 (toList!832 lt!65480))) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38413 (= (getValueByKey!168 (toList!832 lt!65480) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!82937)))

(declare-fun b!127041 () Bool)

(assert (=> b!127041 (= e!82937 e!82938)))

(declare-fun c!23279 () Bool)

(assert (=> b!127041 (= c!23279 (and ((_ is Cons!1674) (toList!832 lt!65480)) (not (= (_1!1273 (h!2276 (toList!832 lt!65480))) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38413 c!23278) b!127040))

(assert (= (and d!38413 (not c!23278)) b!127041))

(assert (= (and b!127041 c!23279) b!127042))

(assert (= (and b!127041 (not c!23279)) b!127043))

(declare-fun m!148411 () Bool)

(assert (=> b!127042 m!148411))

(assert (=> b!126717 d!38413))

(declare-fun d!38415 () Bool)

(assert (=> d!38415 (= (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230)) (not (isEmpty!402 (getValueByKey!168 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230))))))

(declare-fun bs!5267 () Bool)

(assert (= bs!5267 d!38415))

(assert (=> bs!5267 m!147937))

(declare-fun m!148413 () Bool)

(assert (=> bs!5267 m!148413))

(assert (=> b!126760 d!38415))

(declare-fun b!127047 () Bool)

(declare-fun e!82940 () Option!174)

(assert (=> b!127047 (= e!82940 None!172)))

(declare-fun e!82939 () Option!174)

(declare-fun b!127044 () Bool)

(assert (=> b!127044 (= e!82939 (Some!173 (_2!1273 (h!2276 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))))

(declare-fun b!127046 () Bool)

(assert (=> b!127046 (= e!82940 (getValueByKey!168 (t!6017 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) lt!65230))))

(declare-fun c!23280 () Bool)

(declare-fun d!38417 () Bool)

(assert (=> d!38417 (= c!23280 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65230)))))

(assert (=> d!38417 (= (getValueByKey!168 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230) e!82939)))

(declare-fun b!127045 () Bool)

(assert (=> b!127045 (= e!82939 e!82940)))

(declare-fun c!23281 () Bool)

(assert (=> b!127045 (= c!23281 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) (not (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65230))))))

(assert (= (and d!38417 c!23280) b!127044))

(assert (= (and d!38417 (not c!23280)) b!127045))

(assert (= (and b!127045 c!23281) b!127046))

(assert (= (and b!127045 (not c!23281)) b!127047))

(declare-fun m!148415 () Bool)

(assert (=> b!127046 m!148415))

(assert (=> b!126760 d!38417))

(assert (=> d!38237 d!38233))

(declare-fun d!38419 () Bool)

(declare-fun e!82942 () Bool)

(assert (=> d!38419 e!82942))

(declare-fun res!61402 () Bool)

(assert (=> d!38419 (=> res!61402 e!82942)))

(declare-fun lt!65657 () Bool)

(assert (=> d!38419 (= res!61402 (not lt!65657))))

(declare-fun lt!65656 () Bool)

(assert (=> d!38419 (= lt!65657 lt!65656)))

(declare-fun lt!65659 () Unit!3928)

(declare-fun e!82941 () Unit!3928)

(assert (=> d!38419 (= lt!65659 e!82941)))

(declare-fun c!23282 () Bool)

(assert (=> d!38419 (= c!23282 lt!65656)))

(assert (=> d!38419 (= lt!65656 (containsKey!171 (toList!832 lt!65214) lt!65212))))

(assert (=> d!38419 (= (contains!864 lt!65214 lt!65212) lt!65657)))

(declare-fun b!127048 () Bool)

(declare-fun lt!65658 () Unit!3928)

(assert (=> b!127048 (= e!82941 lt!65658)))

(assert (=> b!127048 (= lt!65658 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65214) lt!65212))))

(assert (=> b!127048 (isDefined!120 (getValueByKey!168 (toList!832 lt!65214) lt!65212))))

(declare-fun b!127049 () Bool)

(declare-fun Unit!3955 () Unit!3928)

(assert (=> b!127049 (= e!82941 Unit!3955)))

(declare-fun b!127050 () Bool)

(assert (=> b!127050 (= e!82942 (isDefined!120 (getValueByKey!168 (toList!832 lt!65214) lt!65212)))))

(assert (= (and d!38419 c!23282) b!127048))

(assert (= (and d!38419 (not c!23282)) b!127049))

(assert (= (and d!38419 (not res!61402)) b!127050))

(declare-fun m!148417 () Bool)

(assert (=> d!38419 m!148417))

(declare-fun m!148419 () Bool)

(assert (=> b!127048 m!148419))

(assert (=> b!127048 m!147869))

(assert (=> b!127048 m!147869))

(declare-fun m!148421 () Bool)

(assert (=> b!127048 m!148421))

(assert (=> b!127050 m!147869))

(assert (=> b!127050 m!147869))

(assert (=> b!127050 m!148421))

(assert (=> d!38237 d!38419))

(assert (=> d!38237 d!38257))

(assert (=> d!38237 d!38243))

(declare-fun d!38421 () Bool)

(assert (=> d!38421 (= (apply!111 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65212) (apply!111 lt!65214 lt!65212))))

(assert (=> d!38421 true))

(declare-fun _$34!953 () Unit!3928)

(assert (=> d!38421 (= (choose!772 lt!65214 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65212) _$34!953)))

(declare-fun bs!5268 () Bool)

(assert (= bs!5268 d!38421))

(assert (=> bs!5268 m!147379))

(assert (=> bs!5268 m!147379))

(assert (=> bs!5268 m!147395))

(assert (=> bs!5268 m!147377))

(assert (=> d!38237 d!38421))

(declare-fun d!38423 () Bool)

(declare-fun lt!65660 () Bool)

(assert (=> d!38423 (= lt!65660 (select (content!126 (toList!832 lt!65474)) (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!82943 () Bool)

(assert (=> d!38423 (= lt!65660 e!82943)))

(declare-fun res!61404 () Bool)

(assert (=> d!38423 (=> (not res!61404) (not e!82943))))

(assert (=> d!38423 (= res!61404 ((_ is Cons!1674) (toList!832 lt!65474)))))

(assert (=> d!38423 (= (contains!866 (toList!832 lt!65474) (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65660)))

(declare-fun b!127052 () Bool)

(declare-fun e!82944 () Bool)

(assert (=> b!127052 (= e!82943 e!82944)))

(declare-fun res!61403 () Bool)

(assert (=> b!127052 (=> res!61403 e!82944)))

(assert (=> b!127052 (= res!61403 (= (h!2276 (toList!832 lt!65474)) (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!127053 () Bool)

(assert (=> b!127053 (= e!82944 (contains!866 (t!6017 (toList!832 lt!65474)) (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38423 res!61404) b!127052))

(assert (= (and b!127052 (not res!61403)) b!127053))

(declare-fun m!148423 () Bool)

(assert (=> d!38423 m!148423))

(declare-fun m!148425 () Bool)

(assert (=> d!38423 m!148425))

(declare-fun m!148427 () Bool)

(assert (=> b!127053 m!148427))

(assert (=> b!126714 d!38423))

(declare-fun d!38425 () Bool)

(assert (=> d!38425 (= (apply!111 lt!65390 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!168 (toList!832 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5269 () Bool)

(assert (= bs!5269 d!38425))

(declare-fun m!148429 () Bool)

(assert (=> bs!5269 m!148429))

(assert (=> bs!5269 m!148429))

(declare-fun m!148431 () Bool)

(assert (=> bs!5269 m!148431))

(assert (=> b!126574 d!38425))

(declare-fun d!38427 () Bool)

(assert (=> d!38427 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!65661 () Unit!3928)

(assert (=> d!38427 (= lt!65661 (choose!770 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82945 () Bool)

(assert (=> d!38427 e!82945))

(declare-fun res!61405 () Bool)

(assert (=> d!38427 (=> (not res!61405) (not e!82945))))

(assert (=> d!38427 (= res!61405 (isStrictlySorted!304 (toList!832 lt!65225)))))

(assert (=> d!38427 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000) lt!65661)))

(declare-fun b!127054 () Bool)

(assert (=> b!127054 (= e!82945 (containsKey!171 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38427 res!61405) b!127054))

(assert (=> d!38427 m!147703))

(assert (=> d!38427 m!147703))

(assert (=> d!38427 m!147749))

(declare-fun m!148433 () Bool)

(assert (=> d!38427 m!148433))

(declare-fun m!148435 () Bool)

(assert (=> d!38427 m!148435))

(assert (=> b!127054 m!147745))

(assert (=> b!126666 d!38427))

(declare-fun d!38429 () Bool)

(assert (=> d!38429 (= (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!402 (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5270 () Bool)

(assert (= bs!5270 d!38429))

(assert (=> bs!5270 m!147703))

(declare-fun m!148437 () Bool)

(assert (=> bs!5270 m!148437))

(assert (=> b!126666 d!38429))

(declare-fun b!127058 () Bool)

(declare-fun e!82947 () Option!174)

(assert (=> b!127058 (= e!82947 None!172)))

(declare-fun b!127055 () Bool)

(declare-fun e!82946 () Option!174)

(assert (=> b!127055 (= e!82946 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65225)))))))

(declare-fun b!127057 () Bool)

(assert (=> b!127057 (= e!82947 (getValueByKey!168 (t!6017 (toList!832 lt!65225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!38431 () Bool)

(declare-fun c!23283 () Bool)

(assert (=> d!38431 (= c!23283 (and ((_ is Cons!1674) (toList!832 lt!65225)) (= (_1!1273 (h!2276 (toList!832 lt!65225))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38431 (= (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000) e!82946)))

(declare-fun b!127056 () Bool)

(assert (=> b!127056 (= e!82946 e!82947)))

(declare-fun c!23284 () Bool)

(assert (=> b!127056 (= c!23284 (and ((_ is Cons!1674) (toList!832 lt!65225)) (not (= (_1!1273 (h!2276 (toList!832 lt!65225))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38431 c!23283) b!127055))

(assert (= (and d!38431 (not c!23283)) b!127056))

(assert (= (and b!127056 c!23284) b!127057))

(assert (= (and b!127056 (not c!23284)) b!127058))

(declare-fun m!148439 () Bool)

(assert (=> b!127057 m!148439))

(assert (=> b!126666 d!38431))

(declare-fun d!38433 () Bool)

(assert (=> d!38433 (= (get!1455 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126519 d!38433))

(declare-fun b!127062 () Bool)

(declare-fun e!82949 () Option!174)

(assert (=> b!127062 (= e!82949 None!172)))

(declare-fun b!127059 () Bool)

(declare-fun e!82948 () Option!174)

(assert (=> b!127059 (= e!82948 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65411)))))))

(declare-fun b!127061 () Bool)

(assert (=> b!127061 (= e!82949 (getValueByKey!168 (t!6017 (toList!832 lt!65411)) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23285 () Bool)

(declare-fun d!38435 () Bool)

(assert (=> d!38435 (= c!23285 (and ((_ is Cons!1674) (toList!832 lt!65411)) (= (_1!1273 (h!2276 (toList!832 lt!65411))) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38435 (= (getValueByKey!168 (toList!832 lt!65411) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!82948)))

(declare-fun b!127060 () Bool)

(assert (=> b!127060 (= e!82948 e!82949)))

(declare-fun c!23286 () Bool)

(assert (=> b!127060 (= c!23286 (and ((_ is Cons!1674) (toList!832 lt!65411)) (not (= (_1!1273 (h!2276 (toList!832 lt!65411))) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38435 c!23285) b!127059))

(assert (= (and d!38435 (not c!23285)) b!127060))

(assert (= (and b!127060 c!23286) b!127061))

(assert (= (and b!127060 (not c!23286)) b!127062))

(declare-fun m!148441 () Bool)

(assert (=> b!127061 m!148441))

(assert (=> b!126601 d!38435))

(declare-fun d!38437 () Bool)

(declare-fun e!82950 () Bool)

(assert (=> d!38437 e!82950))

(declare-fun res!61407 () Bool)

(assert (=> d!38437 (=> (not res!61407) (not e!82950))))

(declare-fun lt!65662 () ListLongMap!1633)

(assert (=> d!38437 (= res!61407 (contains!864 lt!65662 (_1!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65663 () List!1678)

(assert (=> d!38437 (= lt!65662 (ListLongMap!1634 lt!65663))))

(declare-fun lt!65665 () Unit!3928)

(declare-fun lt!65664 () Unit!3928)

(assert (=> d!38437 (= lt!65665 lt!65664)))

(assert (=> d!38437 (= (getValueByKey!168 lt!65663 (_1!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38437 (= lt!65664 (lemmaContainsTupThenGetReturnValue!83 lt!65663 (_1!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38437 (= lt!65663 (insertStrictlySorted!86 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (_1!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38437 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65662)))

(declare-fun b!127063 () Bool)

(declare-fun res!61406 () Bool)

(assert (=> b!127063 (=> (not res!61406) (not e!82950))))

(assert (=> b!127063 (= res!61406 (= (getValueByKey!168 (toList!832 lt!65662) (_1!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127064 () Bool)

(assert (=> b!127064 (= e!82950 (contains!866 (toList!832 lt!65662) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38437 res!61407) b!127063))

(assert (= (and b!127063 res!61406) b!127064))

(declare-fun m!148443 () Bool)

(assert (=> d!38437 m!148443))

(declare-fun m!148445 () Bool)

(assert (=> d!38437 m!148445))

(declare-fun m!148447 () Bool)

(assert (=> d!38437 m!148447))

(declare-fun m!148449 () Bool)

(assert (=> d!38437 m!148449))

(declare-fun m!148451 () Bool)

(assert (=> b!127063 m!148451))

(declare-fun m!148453 () Bool)

(assert (=> b!127064 m!148453))

(assert (=> d!38211 d!38437))

(declare-fun d!38439 () Bool)

(assert (=> d!38439 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65143 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> d!38439 true))

(declare-fun _$7!107 () Unit!3928)

(assert (=> d!38439 (= (choose!771 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) lt!65143 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) (defaultEntry!2782 newMap!16)) _$7!107)))

(declare-fun bs!5271 () Bool)

(assert (= bs!5271 d!38439))

(assert (=> bs!5271 m!147325))

(assert (=> bs!5271 m!147325))

(assert (=> bs!5271 m!147739))

(assert (=> bs!5271 m!147215))

(assert (=> bs!5271 m!147735))

(assert (=> d!38211 d!38439))

(assert (=> d!38211 d!38183))

(assert (=> d!38211 d!38379))

(declare-fun b!127065 () Bool)

(declare-fun e!82956 () Bool)

(declare-fun e!82963 () Bool)

(assert (=> b!127065 (= e!82956 e!82963)))

(declare-fun c!23292 () Bool)

(assert (=> b!127065 (= c!23292 (not (= (bvand lt!65143 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127066 () Bool)

(declare-fun e!82960 () ListLongMap!1633)

(declare-fun e!82961 () ListLongMap!1633)

(assert (=> b!127066 (= e!82960 e!82961)))

(declare-fun c!23288 () Bool)

(assert (=> b!127066 (= c!23288 (and (not (= (bvand lt!65143 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!65143 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!13680 () ListLongMap!1633)

(declare-fun call!13679 () ListLongMap!1633)

(declare-fun call!13677 () ListLongMap!1633)

(declare-fun bm!13671 () Bool)

(declare-fun c!23291 () Bool)

(declare-fun call!13674 () ListLongMap!1633)

(assert (=> bm!13671 (= call!13679 (+!164 (ite c!23291 call!13674 (ite c!23288 call!13677 call!13680)) (ite (or c!23291 c!23288) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun bm!13672 () Bool)

(assert (=> bm!13672 (= call!13674 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65143 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13673 () Bool)

(declare-fun call!13678 () Bool)

(declare-fun lt!65680 () ListLongMap!1633)

(assert (=> bm!13673 (= call!13678 (contains!864 lt!65680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127067 () Bool)

(declare-fun e!82951 () Bool)

(declare-fun e!82955 () Bool)

(assert (=> b!127067 (= e!82951 e!82955)))

(declare-fun res!61412 () Bool)

(assert (=> b!127067 (=> (not res!61412) (not e!82955))))

(assert (=> b!127067 (= res!61412 (contains!864 lt!65680 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun bm!13674 () Bool)

(assert (=> bm!13674 (= call!13680 call!13677)))

(declare-fun b!127068 () Bool)

(declare-fun e!82958 () ListLongMap!1633)

(declare-fun call!13676 () ListLongMap!1633)

(assert (=> b!127068 (= e!82958 call!13676)))

(declare-fun b!127069 () Bool)

(declare-fun res!61408 () Bool)

(assert (=> b!127069 (=> (not res!61408) (not e!82956))))

(assert (=> b!127069 (= res!61408 e!82951)))

(declare-fun res!61409 () Bool)

(assert (=> b!127069 (=> res!61409 e!82951)))

(declare-fun e!82954 () Bool)

(assert (=> b!127069 (= res!61409 (not e!82954))))

(declare-fun res!61414 () Bool)

(assert (=> b!127069 (=> (not res!61414) (not e!82954))))

(assert (=> b!127069 (= res!61414 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127070 () Bool)

(declare-fun e!82957 () Bool)

(assert (=> b!127070 (= e!82957 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127071 () Bool)

(declare-fun e!82952 () Bool)

(assert (=> b!127071 (= e!82952 (= (apply!111 lt!65680 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127072 () Bool)

(declare-fun res!61415 () Bool)

(assert (=> b!127072 (=> (not res!61415) (not e!82956))))

(declare-fun e!82953 () Bool)

(assert (=> b!127072 (= res!61415 e!82953)))

(declare-fun c!23287 () Bool)

(assert (=> b!127072 (= c!23287 (not (= (bvand lt!65143 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13675 () Bool)

(assert (=> bm!13675 (= call!13676 call!13679)))

(declare-fun b!127073 () Bool)

(assert (=> b!127073 (= e!82961 call!13676)))

(declare-fun b!127074 () Bool)

(assert (=> b!127074 (= e!82958 call!13680)))

(declare-fun bm!13676 () Bool)

(assert (=> bm!13676 (= call!13677 call!13674)))

(declare-fun b!127075 () Bool)

(assert (=> b!127075 (= e!82963 e!82952)))

(declare-fun res!61411 () Bool)

(assert (=> b!127075 (= res!61411 call!13678)))

(assert (=> b!127075 (=> (not res!61411) (not e!82952))))

(declare-fun b!127076 () Bool)

(declare-fun c!23290 () Bool)

(assert (=> b!127076 (= c!23290 (and (not (= (bvand lt!65143 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!65143 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127076 (= e!82961 e!82958)))

(declare-fun b!127077 () Bool)

(assert (=> b!127077 (= e!82963 (not call!13678))))

(declare-fun b!127078 () Bool)

(assert (=> b!127078 (= e!82955 (= (apply!111 lt!65680 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (_values!2765 newMap!16))))))

(assert (=> b!127078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127079 () Bool)

(declare-fun call!13675 () Bool)

(assert (=> b!127079 (= e!82953 (not call!13675))))

(declare-fun bm!13677 () Bool)

(assert (=> bm!13677 (= call!13675 (contains!864 lt!65680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127080 () Bool)

(declare-fun e!82962 () Bool)

(assert (=> b!127080 (= e!82962 (= (apply!111 lt!65680 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127081 () Bool)

(declare-fun e!82959 () Unit!3928)

(declare-fun lt!65683 () Unit!3928)

(assert (=> b!127081 (= e!82959 lt!65683)))

(declare-fun lt!65668 () ListLongMap!1633)

(assert (=> b!127081 (= lt!65668 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65143 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65687 () (_ BitVec 64))

(assert (=> b!127081 (= lt!65687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65685 () (_ BitVec 64))

(assert (=> b!127081 (= lt!65685 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65670 () Unit!3928)

(assert (=> b!127081 (= lt!65670 (addStillContains!87 lt!65668 lt!65687 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65685))))

(assert (=> b!127081 (contains!864 (+!164 lt!65668 (tuple2!2525 lt!65687 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65685)))

(declare-fun lt!65674 () Unit!3928)

(assert (=> b!127081 (= lt!65674 lt!65670)))

(declare-fun lt!65678 () ListLongMap!1633)

(assert (=> b!127081 (= lt!65678 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65143 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65671 () (_ BitVec 64))

(assert (=> b!127081 (= lt!65671 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65681 () (_ BitVec 64))

(assert (=> b!127081 (= lt!65681 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65676 () Unit!3928)

(assert (=> b!127081 (= lt!65676 (addApplyDifferent!87 lt!65678 lt!65671 (minValue!2645 newMap!16) lt!65681))))

(assert (=> b!127081 (= (apply!111 (+!164 lt!65678 (tuple2!2525 lt!65671 (minValue!2645 newMap!16))) lt!65681) (apply!111 lt!65678 lt!65681))))

(declare-fun lt!65686 () Unit!3928)

(assert (=> b!127081 (= lt!65686 lt!65676)))

(declare-fun lt!65669 () ListLongMap!1633)

(assert (=> b!127081 (= lt!65669 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65143 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65677 () (_ BitVec 64))

(assert (=> b!127081 (= lt!65677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65667 () (_ BitVec 64))

(assert (=> b!127081 (= lt!65667 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65666 () Unit!3928)

(assert (=> b!127081 (= lt!65666 (addApplyDifferent!87 lt!65669 lt!65677 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65667))))

(assert (=> b!127081 (= (apply!111 (+!164 lt!65669 (tuple2!2525 lt!65677 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65667) (apply!111 lt!65669 lt!65667))))

(declare-fun lt!65675 () Unit!3928)

(assert (=> b!127081 (= lt!65675 lt!65666)))

(declare-fun lt!65682 () ListLongMap!1633)

(assert (=> b!127081 (= lt!65682 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65143 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65673 () (_ BitVec 64))

(assert (=> b!127081 (= lt!65673 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65679 () (_ BitVec 64))

(assert (=> b!127081 (= lt!65679 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127081 (= lt!65683 (addApplyDifferent!87 lt!65682 lt!65673 (minValue!2645 newMap!16) lt!65679))))

(assert (=> b!127081 (= (apply!111 (+!164 lt!65682 (tuple2!2525 lt!65673 (minValue!2645 newMap!16))) lt!65679) (apply!111 lt!65682 lt!65679))))

(declare-fun b!127082 () Bool)

(declare-fun Unit!3956 () Unit!3928)

(assert (=> b!127082 (= e!82959 Unit!3956)))

(declare-fun d!38441 () Bool)

(assert (=> d!38441 e!82956))

(declare-fun res!61416 () Bool)

(assert (=> d!38441 (=> (not res!61416) (not e!82956))))

(assert (=> d!38441 (= res!61416 (or (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun lt!65672 () ListLongMap!1633)

(assert (=> d!38441 (= lt!65680 lt!65672)))

(declare-fun lt!65684 () Unit!3928)

(assert (=> d!38441 (= lt!65684 e!82959)))

(declare-fun c!23289 () Bool)

(assert (=> d!38441 (= c!23289 e!82957)))

(declare-fun res!61413 () Bool)

(assert (=> d!38441 (=> (not res!61413) (not e!82957))))

(assert (=> d!38441 (= res!61413 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38441 (= lt!65672 e!82960)))

(assert (=> d!38441 (= c!23291 (and (not (= (bvand lt!65143 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!65143 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38441 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38441 (= (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65143 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65680)))

(declare-fun b!127083 () Bool)

(assert (=> b!127083 (= e!82954 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127084 () Bool)

(assert (=> b!127084 (= e!82960 (+!164 call!13679 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun b!127085 () Bool)

(assert (=> b!127085 (= e!82953 e!82962)))

(declare-fun res!61410 () Bool)

(assert (=> b!127085 (= res!61410 call!13675)))

(assert (=> b!127085 (=> (not res!61410) (not e!82962))))

(assert (= (and d!38441 c!23291) b!127084))

(assert (= (and d!38441 (not c!23291)) b!127066))

(assert (= (and b!127066 c!23288) b!127073))

(assert (= (and b!127066 (not c!23288)) b!127076))

(assert (= (and b!127076 c!23290) b!127068))

(assert (= (and b!127076 (not c!23290)) b!127074))

(assert (= (or b!127068 b!127074) bm!13674))

(assert (= (or b!127073 bm!13674) bm!13676))

(assert (= (or b!127073 b!127068) bm!13675))

(assert (= (or b!127084 bm!13676) bm!13672))

(assert (= (or b!127084 bm!13675) bm!13671))

(assert (= (and d!38441 res!61413) b!127070))

(assert (= (and d!38441 c!23289) b!127081))

(assert (= (and d!38441 (not c!23289)) b!127082))

(assert (= (and d!38441 res!61416) b!127069))

(assert (= (and b!127069 res!61414) b!127083))

(assert (= (and b!127069 (not res!61409)) b!127067))

(assert (= (and b!127067 res!61412) b!127078))

(assert (= (and b!127069 res!61408) b!127072))

(assert (= (and b!127072 c!23287) b!127085))

(assert (= (and b!127072 (not c!23287)) b!127079))

(assert (= (and b!127085 res!61410) b!127080))

(assert (= (or b!127085 b!127079) bm!13677))

(assert (= (and b!127072 res!61415) b!127065))

(assert (= (and b!127065 c!23292) b!127075))

(assert (= (and b!127065 (not c!23292)) b!127077))

(assert (= (and b!127075 res!61411) b!127071))

(assert (= (or b!127075 b!127077) bm!13673))

(declare-fun b_lambda!5611 () Bool)

(assert (=> (not b_lambda!5611) (not b!127078)))

(assert (=> b!127078 t!6029))

(declare-fun b_and!7833 () Bool)

(assert (= b_and!7829 (and (=> t!6029 result!3843) b_and!7833)))

(assert (=> b!127078 t!6031))

(declare-fun b_and!7835 () Bool)

(assert (= b_and!7831 (and (=> t!6031 result!3845) b_and!7835)))

(assert (=> b!127083 m!147525))

(assert (=> b!127083 m!147525))

(assert (=> b!127083 m!147527))

(declare-fun m!148455 () Bool)

(assert (=> b!127081 m!148455))

(declare-fun m!148457 () Bool)

(assert (=> b!127081 m!148457))

(declare-fun m!148459 () Bool)

(assert (=> b!127081 m!148459))

(declare-fun m!148461 () Bool)

(assert (=> b!127081 m!148461))

(declare-fun m!148463 () Bool)

(assert (=> b!127081 m!148463))

(assert (=> b!127081 m!148461))

(declare-fun m!148465 () Bool)

(assert (=> b!127081 m!148465))

(declare-fun m!148467 () Bool)

(assert (=> b!127081 m!148467))

(declare-fun m!148469 () Bool)

(assert (=> b!127081 m!148469))

(assert (=> b!127081 m!147215))

(declare-fun m!148471 () Bool)

(assert (=> b!127081 m!148471))

(assert (=> b!127081 m!148457))

(declare-fun m!148473 () Bool)

(assert (=> b!127081 m!148473))

(declare-fun m!148475 () Bool)

(assert (=> b!127081 m!148475))

(declare-fun m!148477 () Bool)

(assert (=> b!127081 m!148477))

(declare-fun m!148479 () Bool)

(assert (=> b!127081 m!148479))

(declare-fun m!148481 () Bool)

(assert (=> b!127081 m!148481))

(assert (=> b!127081 m!147215))

(declare-fun m!148483 () Bool)

(assert (=> b!127081 m!148483))

(assert (=> b!127081 m!147525))

(assert (=> b!127081 m!148465))

(assert (=> b!127081 m!148477))

(assert (=> b!127081 m!147215))

(declare-fun m!148485 () Bool)

(assert (=> b!127081 m!148485))

(declare-fun m!148487 () Bool)

(assert (=> bm!13677 m!148487))

(declare-fun m!148489 () Bool)

(assert (=> bm!13671 m!148489))

(assert (=> bm!13672 m!147215))

(assert (=> bm!13672 m!148483))

(declare-fun m!148491 () Bool)

(assert (=> b!127071 m!148491))

(assert (=> b!127070 m!147525))

(assert (=> b!127070 m!147525))

(assert (=> b!127070 m!147527))

(assert (=> b!127067 m!147525))

(assert (=> b!127067 m!147525))

(declare-fun m!148493 () Bool)

(assert (=> b!127067 m!148493))

(assert (=> b!127078 m!147569))

(assert (=> b!127078 m!147525))

(declare-fun m!148495 () Bool)

(assert (=> b!127078 m!148495))

(assert (=> b!127078 m!147525))

(assert (=> b!127078 m!147657))

(assert (=> b!127078 m!147657))

(assert (=> b!127078 m!147569))

(assert (=> b!127078 m!147659))

(declare-fun m!148497 () Bool)

(assert (=> bm!13673 m!148497))

(declare-fun m!148499 () Bool)

(assert (=> b!127084 m!148499))

(declare-fun m!148501 () Bool)

(assert (=> b!127080 m!148501))

(assert (=> d!38441 m!147517))

(assert (=> d!38211 d!38441))

(assert (=> b!126701 d!38341))

(declare-fun d!38443 () Bool)

(declare-fun res!61417 () Bool)

(declare-fun e!82964 () Bool)

(assert (=> d!38443 (=> res!61417 e!82964)))

(assert (=> d!38443 (= res!61417 (and ((_ is Cons!1674) (t!6017 (toList!832 lt!65054))) (= (_1!1273 (h!2276 (t!6017 (toList!832 lt!65054)))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38443 (= (containsKey!171 (t!6017 (toList!832 lt!65054)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82964)))

(declare-fun b!127086 () Bool)

(declare-fun e!82965 () Bool)

(assert (=> b!127086 (= e!82964 e!82965)))

(declare-fun res!61418 () Bool)

(assert (=> b!127086 (=> (not res!61418) (not e!82965))))

(assert (=> b!127086 (= res!61418 (and (or (not ((_ is Cons!1674) (t!6017 (toList!832 lt!65054)))) (bvsle (_1!1273 (h!2276 (t!6017 (toList!832 lt!65054)))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))) ((_ is Cons!1674) (t!6017 (toList!832 lt!65054))) (bvslt (_1!1273 (h!2276 (t!6017 (toList!832 lt!65054)))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun b!127087 () Bool)

(assert (=> b!127087 (= e!82965 (containsKey!171 (t!6017 (t!6017 (toList!832 lt!65054))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38443 (not res!61417)) b!127086))

(assert (= (and b!127086 res!61418) b!127087))

(assert (=> b!127087 m!147207))

(declare-fun m!148503 () Bool)

(assert (=> b!127087 m!148503))

(assert (=> b!126534 d!38443))

(declare-fun d!38445 () Bool)

(assert (=> d!38445 (= (apply!111 lt!65455 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!168 (toList!832 lt!65455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5272 () Bool)

(assert (= bs!5272 d!38445))

(declare-fun m!148505 () Bool)

(assert (=> bs!5272 m!148505))

(assert (=> bs!5272 m!148505))

(declare-fun m!148507 () Bool)

(assert (=> bs!5272 m!148507))

(assert (=> b!126677 d!38445))

(assert (=> d!38241 d!38229))

(declare-fun d!38447 () Bool)

(assert (=> d!38447 (= (apply!111 (+!164 lt!65223 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65226) (apply!111 lt!65223 lt!65226))))

(assert (=> d!38447 true))

(declare-fun _$34!954 () Unit!3928)

(assert (=> d!38447 (= (choose!772 lt!65223 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65226) _$34!954)))

(declare-fun bs!5273 () Bool)

(assert (= bs!5273 d!38447))

(assert (=> bs!5273 m!147383))

(assert (=> bs!5273 m!147383))

(assert (=> bs!5273 m!147385))

(assert (=> bs!5273 m!147381))

(assert (=> d!38241 d!38447))

(assert (=> d!38241 d!38235))

(assert (=> d!38241 d!38239))

(declare-fun d!38449 () Bool)

(declare-fun e!82967 () Bool)

(assert (=> d!38449 e!82967))

(declare-fun res!61419 () Bool)

(assert (=> d!38449 (=> res!61419 e!82967)))

(declare-fun lt!65689 () Bool)

(assert (=> d!38449 (= res!61419 (not lt!65689))))

(declare-fun lt!65688 () Bool)

(assert (=> d!38449 (= lt!65689 lt!65688)))

(declare-fun lt!65691 () Unit!3928)

(declare-fun e!82966 () Unit!3928)

(assert (=> d!38449 (= lt!65691 e!82966)))

(declare-fun c!23293 () Bool)

(assert (=> d!38449 (= c!23293 lt!65688)))

(assert (=> d!38449 (= lt!65688 (containsKey!171 (toList!832 lt!65223) lt!65226))))

(assert (=> d!38449 (= (contains!864 lt!65223 lt!65226) lt!65689)))

(declare-fun b!127088 () Bool)

(declare-fun lt!65690 () Unit!3928)

(assert (=> b!127088 (= e!82966 lt!65690)))

(assert (=> b!127088 (= lt!65690 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65223) lt!65226))))

(assert (=> b!127088 (isDefined!120 (getValueByKey!168 (toList!832 lt!65223) lt!65226))))

(declare-fun b!127089 () Bool)

(declare-fun Unit!3957 () Unit!3928)

(assert (=> b!127089 (= e!82966 Unit!3957)))

(declare-fun b!127090 () Bool)

(assert (=> b!127090 (= e!82967 (isDefined!120 (getValueByKey!168 (toList!832 lt!65223) lt!65226)))))

(assert (= (and d!38449 c!23293) b!127088))

(assert (= (and d!38449 (not c!23293)) b!127089))

(assert (= (and d!38449 (not res!61419)) b!127090))

(declare-fun m!148509 () Bool)

(assert (=> d!38449 m!148509))

(declare-fun m!148511 () Bool)

(assert (=> b!127088 m!148511))

(assert (=> b!127088 m!147861))

(assert (=> b!127088 m!147861))

(declare-fun m!148513 () Bool)

(assert (=> b!127088 m!148513))

(assert (=> b!127090 m!147861))

(assert (=> b!127090 m!147861))

(assert (=> b!127090 m!148513))

(assert (=> d!38241 d!38449))

(declare-fun d!38451 () Bool)

(declare-fun e!82969 () Bool)

(assert (=> d!38451 e!82969))

(declare-fun res!61420 () Bool)

(assert (=> d!38451 (=> res!61420 e!82969)))

(declare-fun lt!65693 () Bool)

(assert (=> d!38451 (= res!61420 (not lt!65693))))

(declare-fun lt!65692 () Bool)

(assert (=> d!38451 (= lt!65693 lt!65692)))

(declare-fun lt!65695 () Unit!3928)

(declare-fun e!82968 () Unit!3928)

(assert (=> d!38451 (= lt!65695 e!82968)))

(declare-fun c!23294 () Bool)

(assert (=> d!38451 (= c!23294 lt!65692)))

(assert (=> d!38451 (= lt!65692 (containsKey!171 (toList!832 lt!65480) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38451 (= (contains!864 lt!65480 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65693)))

(declare-fun b!127091 () Bool)

(declare-fun lt!65694 () Unit!3928)

(assert (=> b!127091 (= e!82968 lt!65694)))

(assert (=> b!127091 (= lt!65694 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65480) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!127091 (isDefined!120 (getValueByKey!168 (toList!832 lt!65480) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127092 () Bool)

(declare-fun Unit!3958 () Unit!3928)

(assert (=> b!127092 (= e!82968 Unit!3958)))

(declare-fun b!127093 () Bool)

(assert (=> b!127093 (= e!82969 (isDefined!120 (getValueByKey!168 (toList!832 lt!65480) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38451 c!23294) b!127091))

(assert (= (and d!38451 (not c!23294)) b!127092))

(assert (= (and d!38451 (not res!61420)) b!127093))

(declare-fun m!148515 () Bool)

(assert (=> d!38451 m!148515))

(declare-fun m!148517 () Bool)

(assert (=> b!127091 m!148517))

(assert (=> b!127091 m!147881))

(assert (=> b!127091 m!147881))

(declare-fun m!148519 () Bool)

(assert (=> b!127091 m!148519))

(assert (=> b!127093 m!147881))

(assert (=> b!127093 m!147881))

(assert (=> b!127093 m!148519))

(assert (=> d!38245 d!38451))

(declare-fun b!127097 () Bool)

(declare-fun e!82971 () Option!174)

(assert (=> b!127097 (= e!82971 None!172)))

(declare-fun b!127094 () Bool)

(declare-fun e!82970 () Option!174)

(assert (=> b!127094 (= e!82970 (Some!173 (_2!1273 (h!2276 lt!65481))))))

(declare-fun b!127096 () Bool)

(assert (=> b!127096 (= e!82971 (getValueByKey!168 (t!6017 lt!65481) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun d!38453 () Bool)

(declare-fun c!23295 () Bool)

(assert (=> d!38453 (= c!23295 (and ((_ is Cons!1674) lt!65481) (= (_1!1273 (h!2276 lt!65481)) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38453 (= (getValueByKey!168 lt!65481 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!82970)))

(declare-fun b!127095 () Bool)

(assert (=> b!127095 (= e!82970 e!82971)))

(declare-fun c!23296 () Bool)

(assert (=> b!127095 (= c!23296 (and ((_ is Cons!1674) lt!65481) (not (= (_1!1273 (h!2276 lt!65481)) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38453 c!23295) b!127094))

(assert (= (and d!38453 (not c!23295)) b!127095))

(assert (= (and b!127095 c!23296) b!127096))

(assert (= (and b!127095 (not c!23296)) b!127097))

(declare-fun m!148521 () Bool)

(assert (=> b!127096 m!148521))

(assert (=> d!38245 d!38453))

(declare-fun d!38455 () Bool)

(assert (=> d!38455 (= (getValueByKey!168 lt!65481 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65696 () Unit!3928)

(assert (=> d!38455 (= lt!65696 (choose!776 lt!65481 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!82972 () Bool)

(assert (=> d!38455 e!82972))

(declare-fun res!61421 () Bool)

(assert (=> d!38455 (=> (not res!61421) (not e!82972))))

(assert (=> d!38455 (= res!61421 (isStrictlySorted!304 lt!65481))))

(assert (=> d!38455 (= (lemmaContainsTupThenGetReturnValue!83 lt!65481 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65696)))

(declare-fun b!127098 () Bool)

(declare-fun res!61422 () Bool)

(assert (=> b!127098 (=> (not res!61422) (not e!82972))))

(assert (=> b!127098 (= res!61422 (containsKey!171 lt!65481 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127099 () Bool)

(assert (=> b!127099 (= e!82972 (contains!866 lt!65481 (tuple2!2525 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38455 res!61421) b!127098))

(assert (= (and b!127098 res!61422) b!127099))

(assert (=> d!38455 m!147875))

(declare-fun m!148523 () Bool)

(assert (=> d!38455 m!148523))

(declare-fun m!148525 () Bool)

(assert (=> d!38455 m!148525))

(declare-fun m!148527 () Bool)

(assert (=> b!127098 m!148527))

(declare-fun m!148529 () Bool)

(assert (=> b!127099 m!148529))

(assert (=> d!38245 d!38455))

(declare-fun bm!13678 () Bool)

(declare-fun call!13682 () List!1678)

(declare-fun call!13683 () List!1678)

(assert (=> bm!13678 (= call!13682 call!13683)))

(declare-fun b!127100 () Bool)

(declare-fun e!82977 () List!1678)

(declare-fun call!13681 () List!1678)

(assert (=> b!127100 (= e!82977 call!13681)))

(declare-fun b!127101 () Bool)

(declare-fun e!82974 () List!1678)

(assert (=> b!127101 (= e!82974 (insertStrictlySorted!86 (t!6017 (toList!832 lt!65213)) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127102 () Bool)

(declare-fun e!82976 () List!1678)

(declare-fun e!82973 () List!1678)

(assert (=> b!127102 (= e!82976 e!82973)))

(declare-fun c!23299 () Bool)

(assert (=> b!127102 (= c!23299 (and ((_ is Cons!1674) (toList!832 lt!65213)) (= (_1!1273 (h!2276 (toList!832 lt!65213))) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!127103 () Bool)

(declare-fun c!23300 () Bool)

(assert (=> b!127103 (= e!82974 (ite c!23299 (t!6017 (toList!832 lt!65213)) (ite c!23300 (Cons!1674 (h!2276 (toList!832 lt!65213)) (t!6017 (toList!832 lt!65213))) Nil!1675)))))

(declare-fun b!127104 () Bool)

(assert (=> b!127104 (= e!82977 call!13681)))

(declare-fun b!127105 () Bool)

(assert (=> b!127105 (= e!82976 call!13683)))

(declare-fun bm!13679 () Bool)

(declare-fun c!23297 () Bool)

(assert (=> bm!13679 (= call!13683 ($colon$colon!88 e!82974 (ite c!23297 (h!2276 (toList!832 lt!65213)) (tuple2!2525 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23298 () Bool)

(assert (=> bm!13679 (= c!23298 c!23297)))

(declare-fun d!38457 () Bool)

(declare-fun e!82975 () Bool)

(assert (=> d!38457 e!82975))

(declare-fun res!61424 () Bool)

(assert (=> d!38457 (=> (not res!61424) (not e!82975))))

(declare-fun lt!65697 () List!1678)

(assert (=> d!38457 (= res!61424 (isStrictlySorted!304 lt!65697))))

(assert (=> d!38457 (= lt!65697 e!82976)))

(assert (=> d!38457 (= c!23297 (and ((_ is Cons!1674) (toList!832 lt!65213)) (bvslt (_1!1273 (h!2276 (toList!832 lt!65213))) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38457 (isStrictlySorted!304 (toList!832 lt!65213))))

(assert (=> d!38457 (= (insertStrictlySorted!86 (toList!832 lt!65213) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65697)))

(declare-fun b!127106 () Bool)

(assert (=> b!127106 (= c!23300 (and ((_ is Cons!1674) (toList!832 lt!65213)) (bvsgt (_1!1273 (h!2276 (toList!832 lt!65213))) (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!127106 (= e!82973 e!82977)))

(declare-fun b!127107 () Bool)

(assert (=> b!127107 (= e!82973 call!13682)))

(declare-fun b!127108 () Bool)

(declare-fun res!61423 () Bool)

(assert (=> b!127108 (=> (not res!61423) (not e!82975))))

(assert (=> b!127108 (= res!61423 (containsKey!171 lt!65697 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun bm!13680 () Bool)

(assert (=> bm!13680 (= call!13681 call!13682)))

(declare-fun b!127109 () Bool)

(assert (=> b!127109 (= e!82975 (contains!866 lt!65697 (tuple2!2525 (_1!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38457 c!23297) b!127105))

(assert (= (and d!38457 (not c!23297)) b!127102))

(assert (= (and b!127102 c!23299) b!127107))

(assert (= (and b!127102 (not c!23299)) b!127106))

(assert (= (and b!127106 c!23300) b!127100))

(assert (= (and b!127106 (not c!23300)) b!127104))

(assert (= (or b!127100 b!127104) bm!13680))

(assert (= (or b!127107 bm!13680) bm!13678))

(assert (= (or b!127105 bm!13678) bm!13679))

(assert (= (and bm!13679 c!23298) b!127101))

(assert (= (and bm!13679 (not c!23298)) b!127103))

(assert (= (and d!38457 res!61424) b!127108))

(assert (= (and b!127108 res!61423) b!127109))

(declare-fun m!148531 () Bool)

(assert (=> b!127109 m!148531))

(declare-fun m!148533 () Bool)

(assert (=> b!127101 m!148533))

(declare-fun m!148535 () Bool)

(assert (=> b!127108 m!148535))

(declare-fun m!148537 () Bool)

(assert (=> d!38457 m!148537))

(declare-fun m!148539 () Bool)

(assert (=> d!38457 m!148539))

(declare-fun m!148541 () Bool)

(assert (=> bm!13679 m!148541))

(assert (=> d!38245 d!38457))

(declare-fun d!38459 () Bool)

(declare-fun lt!65698 () (_ BitVec 32))

(assert (=> d!38459 (and (bvsge lt!65698 #b00000000000000000000000000000000) (bvsle lt!65698 (bvsub (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!82979 () (_ BitVec 32))

(assert (=> d!38459 (= lt!65698 e!82979)))

(declare-fun c!23302 () Bool)

(assert (=> d!38459 (= c!23302 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38459 (and (bvsle #b00000000000000000000000000000000 (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38459 (= (arrayCountValidKeys!0 (_keys!4515 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000 (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))) lt!65698)))

(declare-fun b!127110 () Bool)

(declare-fun e!82978 () (_ BitVec 32))

(declare-fun call!13684 () (_ BitVec 32))

(assert (=> b!127110 (= e!82978 (bvadd #b00000000000000000000000000000001 call!13684))))

(declare-fun bm!13681 () Bool)

(assert (=> bm!13681 (= call!13684 (arrayCountValidKeys!0 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!127111 () Bool)

(assert (=> b!127111 (= e!82978 call!13684)))

(declare-fun b!127112 () Bool)

(assert (=> b!127112 (= e!82979 #b00000000000000000000000000000000)))

(declare-fun b!127113 () Bool)

(assert (=> b!127113 (= e!82979 e!82978)))

(declare-fun c!23301 () Bool)

(assert (=> b!127113 (= c!23301 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!38459 c!23302) b!127112))

(assert (= (and d!38459 (not c!23302)) b!127113))

(assert (= (and b!127113 c!23301) b!127110))

(assert (= (and b!127113 (not c!23301)) b!127111))

(assert (= (or b!127110 b!127111) bm!13681))

(declare-fun m!148543 () Bool)

(assert (=> bm!13681 m!148543))

(assert (=> b!127113 m!148193))

(assert (=> b!127113 m!148193))

(assert (=> b!127113 m!148203))

(assert (=> b!126621 d!38459))

(declare-fun b!127117 () Bool)

(declare-fun e!82981 () Option!174)

(assert (=> b!127117 (= e!82981 None!172)))

(declare-fun b!127114 () Bool)

(declare-fun e!82980 () Option!174)

(assert (=> b!127114 (= e!82980 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65331)))))))

(declare-fun b!127116 () Bool)

(assert (=> b!127116 (= e!82981 (getValueByKey!168 (t!6017 (toList!832 lt!65331)) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!38461 () Bool)

(declare-fun c!23303 () Bool)

(assert (=> d!38461 (= c!23303 (and ((_ is Cons!1674) (toList!832 lt!65331)) (= (_1!1273 (h!2276 (toList!832 lt!65331))) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!38461 (= (getValueByKey!168 (toList!832 lt!65331) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!82980)))

(declare-fun b!127115 () Bool)

(assert (=> b!127115 (= e!82980 e!82981)))

(declare-fun c!23304 () Bool)

(assert (=> b!127115 (= c!23304 (and ((_ is Cons!1674) (toList!832 lt!65331)) (not (= (_1!1273 (h!2276 (toList!832 lt!65331))) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (= (and d!38461 c!23303) b!127114))

(assert (= (and d!38461 (not c!23303)) b!127115))

(assert (= (and b!127115 c!23304) b!127116))

(assert (= (and b!127115 (not c!23304)) b!127117))

(declare-fun m!148545 () Bool)

(assert (=> b!127116 m!148545))

(assert (=> b!126492 d!38461))

(declare-fun d!38463 () Bool)

(declare-fun e!82983 () Bool)

(assert (=> d!38463 e!82983))

(declare-fun res!61425 () Bool)

(assert (=> d!38463 (=> res!61425 e!82983)))

(declare-fun lt!65700 () Bool)

(assert (=> d!38463 (= res!61425 (not lt!65700))))

(declare-fun lt!65699 () Bool)

(assert (=> d!38463 (= lt!65700 lt!65699)))

(declare-fun lt!65702 () Unit!3928)

(declare-fun e!82982 () Unit!3928)

(assert (=> d!38463 (= lt!65702 e!82982)))

(declare-fun c!23305 () Bool)

(assert (=> d!38463 (= c!23305 lt!65699)))

(assert (=> d!38463 (= lt!65699 (containsKey!171 (toList!832 lt!65501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38463 (= (contains!864 lt!65501 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65700)))

(declare-fun b!127118 () Bool)

(declare-fun lt!65701 () Unit!3928)

(assert (=> b!127118 (= e!82982 lt!65701)))

(assert (=> b!127118 (= lt!65701 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127118 (isDefined!120 (getValueByKey!168 (toList!832 lt!65501) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127119 () Bool)

(declare-fun Unit!3959 () Unit!3928)

(assert (=> b!127119 (= e!82982 Unit!3959)))

(declare-fun b!127120 () Bool)

(assert (=> b!127120 (= e!82983 (isDefined!120 (getValueByKey!168 (toList!832 lt!65501) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38463 c!23305) b!127118))

(assert (= (and d!38463 (not c!23305)) b!127119))

(assert (= (and d!38463 (not res!61425)) b!127120))

(declare-fun m!148547 () Bool)

(assert (=> d!38463 m!148547))

(declare-fun m!148549 () Bool)

(assert (=> b!127118 m!148549))

(declare-fun m!148551 () Bool)

(assert (=> b!127118 m!148551))

(assert (=> b!127118 m!148551))

(declare-fun m!148553 () Bool)

(assert (=> b!127118 m!148553))

(assert (=> b!127120 m!148551))

(assert (=> b!127120 m!148551))

(assert (=> b!127120 m!148553))

(assert (=> b!126748 d!38463))

(declare-fun b!127121 () Bool)

(declare-fun e!82987 () Bool)

(declare-fun call!13685 () Bool)

(assert (=> b!127121 (= e!82987 call!13685)))

(declare-fun b!127122 () Bool)

(assert (=> b!127122 (= e!82987 call!13685)))

(declare-fun b!127123 () Bool)

(declare-fun e!82985 () Bool)

(assert (=> b!127123 (= e!82985 e!82987)))

(declare-fun c!23306 () Bool)

(assert (=> b!127123 (= c!23306 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(declare-fun b!127124 () Bool)

(declare-fun e!82986 () Bool)

(assert (=> b!127124 (= e!82986 e!82985)))

(declare-fun res!61427 () Bool)

(assert (=> b!127124 (=> (not res!61427) (not e!82985))))

(declare-fun e!82984 () Bool)

(assert (=> b!127124 (= res!61427 (not e!82984))))

(declare-fun res!61426 () Bool)

(assert (=> b!127124 (=> (not res!61426) (not e!82984))))

(assert (=> b!127124 (= res!61426 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(declare-fun b!127125 () Bool)

(assert (=> b!127125 (= e!82984 (contains!867 Nil!1677 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(declare-fun bm!13682 () Bool)

(assert (=> bm!13682 (= call!13685 (arrayNoDuplicates!0 (_keys!4515 (_2!1274 lt!65152)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23306 (Cons!1676 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000) Nil!1677) Nil!1677)))))

(declare-fun d!38465 () Bool)

(declare-fun res!61428 () Bool)

(assert (=> d!38465 (=> res!61428 e!82986)))

(assert (=> d!38465 (= res!61428 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(assert (=> d!38465 (= (arrayNoDuplicates!0 (_keys!4515 (_2!1274 lt!65152)) #b00000000000000000000000000000000 Nil!1677) e!82986)))

(assert (= (and d!38465 (not res!61428)) b!127124))

(assert (= (and b!127124 res!61426) b!127125))

(assert (= (and b!127124 res!61427) b!127123))

(assert (= (and b!127123 c!23306) b!127121))

(assert (= (and b!127123 (not c!23306)) b!127122))

(assert (= (or b!127121 b!127122) bm!13682))

(declare-fun m!148555 () Bool)

(assert (=> b!127123 m!148555))

(assert (=> b!127123 m!148555))

(declare-fun m!148557 () Bool)

(assert (=> b!127123 m!148557))

(assert (=> b!127124 m!148555))

(assert (=> b!127124 m!148555))

(assert (=> b!127124 m!148557))

(assert (=> b!127125 m!148555))

(assert (=> b!127125 m!148555))

(declare-fun m!148559 () Bool)

(assert (=> b!127125 m!148559))

(assert (=> bm!13682 m!148555))

(declare-fun m!148561 () Bool)

(assert (=> bm!13682 m!148561))

(assert (=> b!126522 d!38465))

(assert (=> d!38231 d!38251))

(declare-fun d!38467 () Bool)

(assert (=> d!38467 (= (apply!111 (+!164 lt!65227 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65224) (apply!111 lt!65227 lt!65224))))

(assert (=> d!38467 true))

(declare-fun _$34!955 () Unit!3928)

(assert (=> d!38467 (= (choose!772 lt!65227 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65224) _$34!955)))

(declare-fun bs!5274 () Bool)

(assert (= bs!5274 d!38467))

(assert (=> bs!5274 m!147387))

(assert (=> bs!5274 m!147387))

(assert (=> bs!5274 m!147389))

(assert (=> bs!5274 m!147397))

(assert (=> d!38231 d!38467))

(declare-fun d!38469 () Bool)

(declare-fun e!82989 () Bool)

(assert (=> d!38469 e!82989))

(declare-fun res!61429 () Bool)

(assert (=> d!38469 (=> res!61429 e!82989)))

(declare-fun lt!65704 () Bool)

(assert (=> d!38469 (= res!61429 (not lt!65704))))

(declare-fun lt!65703 () Bool)

(assert (=> d!38469 (= lt!65704 lt!65703)))

(declare-fun lt!65706 () Unit!3928)

(declare-fun e!82988 () Unit!3928)

(assert (=> d!38469 (= lt!65706 e!82988)))

(declare-fun c!23307 () Bool)

(assert (=> d!38469 (= c!23307 lt!65703)))

(assert (=> d!38469 (= lt!65703 (containsKey!171 (toList!832 lt!65227) lt!65224))))

(assert (=> d!38469 (= (contains!864 lt!65227 lt!65224) lt!65704)))

(declare-fun b!127126 () Bool)

(declare-fun lt!65705 () Unit!3928)

(assert (=> b!127126 (= e!82988 lt!65705)))

(assert (=> b!127126 (= lt!65705 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65227) lt!65224))))

(assert (=> b!127126 (isDefined!120 (getValueByKey!168 (toList!832 lt!65227) lt!65224))))

(declare-fun b!127127 () Bool)

(declare-fun Unit!3960 () Unit!3928)

(assert (=> b!127127 (= e!82988 Unit!3960)))

(declare-fun b!127128 () Bool)

(assert (=> b!127128 (= e!82989 (isDefined!120 (getValueByKey!168 (toList!832 lt!65227) lt!65224)))))

(assert (= (and d!38469 c!23307) b!127126))

(assert (= (and d!38469 (not c!23307)) b!127127))

(assert (= (and d!38469 (not res!61429)) b!127128))

(declare-fun m!148563 () Bool)

(assert (=> d!38469 m!148563))

(declare-fun m!148565 () Bool)

(assert (=> b!127126 m!148565))

(assert (=> b!127126 m!147925))

(assert (=> b!127126 m!147925))

(declare-fun m!148567 () Bool)

(assert (=> b!127126 m!148567))

(assert (=> b!127128 m!147925))

(assert (=> b!127128 m!147925))

(assert (=> b!127128 m!148567))

(assert (=> d!38231 d!38469))

(assert (=> d!38231 d!38253))

(assert (=> d!38231 d!38255))

(declare-fun d!38471 () Bool)

(assert (=> d!38471 (= (apply!111 lt!65390 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!168 (toList!832 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5275 () Bool)

(assert (= bs!5275 d!38471))

(declare-fun m!148569 () Bool)

(assert (=> bs!5275 m!148569))

(assert (=> bs!5275 m!148569))

(declare-fun m!148571 () Bool)

(assert (=> bs!5275 m!148571))

(assert (=> b!126565 d!38471))

(assert (=> b!126745 d!38373))

(declare-fun d!38473 () Bool)

(assert (=> d!38473 (= (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!402 (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5276 () Bool)

(assert (= bs!5276 d!38473))

(assert (=> bs!5276 m!147583))

(declare-fun m!148573 () Bool)

(assert (=> bs!5276 m!148573))

(assert (=> b!126706 d!38473))

(declare-fun b!127132 () Bool)

(declare-fun e!82991 () Option!174)

(assert (=> b!127132 (= e!82991 None!172)))

(declare-fun b!127129 () Bool)

(declare-fun e!82990 () Option!174)

(assert (=> b!127129 (= e!82990 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65225)))))))

(declare-fun b!127131 () Bool)

(assert (=> b!127131 (= e!82991 (getValueByKey!168 (t!6017 (toList!832 lt!65225)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!38475 () Bool)

(declare-fun c!23308 () Bool)

(assert (=> d!38475 (= c!23308 (and ((_ is Cons!1674) (toList!832 lt!65225)) (= (_1!1273 (h!2276 (toList!832 lt!65225))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38475 (= (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!82990)))

(declare-fun b!127130 () Bool)

(assert (=> b!127130 (= e!82990 e!82991)))

(declare-fun c!23309 () Bool)

(assert (=> b!127130 (= c!23309 (and ((_ is Cons!1674) (toList!832 lt!65225)) (not (= (_1!1273 (h!2276 (toList!832 lt!65225))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(assert (= (and d!38475 c!23308) b!127129))

(assert (= (and d!38475 (not c!23308)) b!127130))

(assert (= (and b!127130 c!23309) b!127131))

(assert (= (and b!127130 (not c!23309)) b!127132))

(assert (=> b!127131 m!147373))

(declare-fun m!148575 () Bool)

(assert (=> b!127131 m!148575))

(assert (=> b!126706 d!38475))

(declare-fun d!38477 () Bool)

(declare-fun e!82993 () Bool)

(assert (=> d!38477 e!82993))

(declare-fun res!61430 () Bool)

(assert (=> d!38477 (=> res!61430 e!82993)))

(declare-fun lt!65708 () Bool)

(assert (=> d!38477 (= res!61430 (not lt!65708))))

(declare-fun lt!65707 () Bool)

(assert (=> d!38477 (= lt!65708 lt!65707)))

(declare-fun lt!65710 () Unit!3928)

(declare-fun e!82992 () Unit!3928)

(assert (=> d!38477 (= lt!65710 e!82992)))

(declare-fun c!23310 () Bool)

(assert (=> d!38477 (= c!23310 lt!65707)))

(assert (=> d!38477 (= lt!65707 (containsKey!171 (toList!832 lt!65411) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38477 (= (contains!864 lt!65411 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65708)))

(declare-fun b!127133 () Bool)

(declare-fun lt!65709 () Unit!3928)

(assert (=> b!127133 (= e!82992 lt!65709)))

(assert (=> b!127133 (= lt!65709 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65411) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!127133 (isDefined!120 (getValueByKey!168 (toList!832 lt!65411) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127134 () Bool)

(declare-fun Unit!3961 () Unit!3928)

(assert (=> b!127134 (= e!82992 Unit!3961)))

(declare-fun b!127135 () Bool)

(assert (=> b!127135 (= e!82993 (isDefined!120 (getValueByKey!168 (toList!832 lt!65411) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38477 c!23310) b!127133))

(assert (= (and d!38477 (not c!23310)) b!127134))

(assert (= (and d!38477 (not res!61430)) b!127135))

(declare-fun m!148577 () Bool)

(assert (=> d!38477 m!148577))

(declare-fun m!148579 () Bool)

(assert (=> b!127133 m!148579))

(assert (=> b!127133 m!147699))

(assert (=> b!127133 m!147699))

(declare-fun m!148581 () Bool)

(assert (=> b!127133 m!148581))

(assert (=> b!127135 m!147699))

(assert (=> b!127135 m!147699))

(assert (=> b!127135 m!148581))

(assert (=> d!38191 d!38477))

(declare-fun b!127139 () Bool)

(declare-fun e!82995 () Option!174)

(assert (=> b!127139 (= e!82995 None!172)))

(declare-fun b!127136 () Bool)

(declare-fun e!82994 () Option!174)

(assert (=> b!127136 (= e!82994 (Some!173 (_2!1273 (h!2276 lt!65412))))))

(declare-fun b!127138 () Bool)

(assert (=> b!127138 (= e!82995 (getValueByKey!168 (t!6017 lt!65412) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!38479 () Bool)

(declare-fun c!23311 () Bool)

(assert (=> d!38479 (= c!23311 (and ((_ is Cons!1674) lt!65412) (= (_1!1273 (h!2276 lt!65412)) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38479 (= (getValueByKey!168 lt!65412 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!82994)))

(declare-fun b!127137 () Bool)

(assert (=> b!127137 (= e!82994 e!82995)))

(declare-fun c!23312 () Bool)

(assert (=> b!127137 (= c!23312 (and ((_ is Cons!1674) lt!65412) (not (= (_1!1273 (h!2276 lt!65412)) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38479 c!23311) b!127136))

(assert (= (and d!38479 (not c!23311)) b!127137))

(assert (= (and b!127137 c!23312) b!127138))

(assert (= (and b!127137 (not c!23312)) b!127139))

(declare-fun m!148583 () Bool)

(assert (=> b!127138 m!148583))

(assert (=> d!38191 d!38479))

(declare-fun d!38481 () Bool)

(assert (=> d!38481 (= (getValueByKey!168 lt!65412 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65711 () Unit!3928)

(assert (=> d!38481 (= lt!65711 (choose!776 lt!65412 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82996 () Bool)

(assert (=> d!38481 e!82996))

(declare-fun res!61431 () Bool)

(assert (=> d!38481 (=> (not res!61431) (not e!82996))))

(assert (=> d!38481 (= res!61431 (isStrictlySorted!304 lt!65412))))

(assert (=> d!38481 (= (lemmaContainsTupThenGetReturnValue!83 lt!65412 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65711)))

(declare-fun b!127140 () Bool)

(declare-fun res!61432 () Bool)

(assert (=> b!127140 (=> (not res!61432) (not e!82996))))

(assert (=> b!127140 (= res!61432 (containsKey!171 lt!65412 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127141 () Bool)

(assert (=> b!127141 (= e!82996 (contains!866 lt!65412 (tuple2!2525 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38481 res!61431) b!127140))

(assert (= (and b!127140 res!61432) b!127141))

(assert (=> d!38481 m!147693))

(declare-fun m!148585 () Bool)

(assert (=> d!38481 m!148585))

(declare-fun m!148587 () Bool)

(assert (=> d!38481 m!148587))

(declare-fun m!148589 () Bool)

(assert (=> b!127140 m!148589))

(declare-fun m!148591 () Bool)

(assert (=> b!127141 m!148591))

(assert (=> d!38191 d!38481))

(declare-fun bm!13683 () Bool)

(declare-fun call!13687 () List!1678)

(declare-fun call!13688 () List!1678)

(assert (=> bm!13683 (= call!13687 call!13688)))

(declare-fun b!127142 () Bool)

(declare-fun e!83001 () List!1678)

(declare-fun call!13686 () List!1678)

(assert (=> b!127142 (= e!83001 call!13686)))

(declare-fun b!127143 () Bool)

(declare-fun e!82998 () List!1678)

(assert (=> b!127143 (= e!82998 (insertStrictlySorted!86 (t!6017 (toList!832 call!13561)) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127144 () Bool)

(declare-fun e!83000 () List!1678)

(declare-fun e!82997 () List!1678)

(assert (=> b!127144 (= e!83000 e!82997)))

(declare-fun c!23315 () Bool)

(assert (=> b!127144 (= c!23315 (and ((_ is Cons!1674) (toList!832 call!13561)) (= (_1!1273 (h!2276 (toList!832 call!13561))) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!23316 () Bool)

(declare-fun b!127145 () Bool)

(assert (=> b!127145 (= e!82998 (ite c!23315 (t!6017 (toList!832 call!13561)) (ite c!23316 (Cons!1674 (h!2276 (toList!832 call!13561)) (t!6017 (toList!832 call!13561))) Nil!1675)))))

(declare-fun b!127146 () Bool)

(assert (=> b!127146 (= e!83001 call!13686)))

(declare-fun b!127147 () Bool)

(assert (=> b!127147 (= e!83000 call!13688)))

(declare-fun c!23313 () Bool)

(declare-fun bm!13684 () Bool)

(assert (=> bm!13684 (= call!13688 ($colon$colon!88 e!82998 (ite c!23313 (h!2276 (toList!832 call!13561)) (tuple2!2525 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23314 () Bool)

(assert (=> bm!13684 (= c!23314 c!23313)))

(declare-fun d!38483 () Bool)

(declare-fun e!82999 () Bool)

(assert (=> d!38483 e!82999))

(declare-fun res!61434 () Bool)

(assert (=> d!38483 (=> (not res!61434) (not e!82999))))

(declare-fun lt!65712 () List!1678)

(assert (=> d!38483 (= res!61434 (isStrictlySorted!304 lt!65712))))

(assert (=> d!38483 (= lt!65712 e!83000)))

(assert (=> d!38483 (= c!23313 (and ((_ is Cons!1674) (toList!832 call!13561)) (bvslt (_1!1273 (h!2276 (toList!832 call!13561))) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38483 (isStrictlySorted!304 (toList!832 call!13561))))

(assert (=> d!38483 (= (insertStrictlySorted!86 (toList!832 call!13561) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65712)))

(declare-fun b!127148 () Bool)

(assert (=> b!127148 (= c!23316 (and ((_ is Cons!1674) (toList!832 call!13561)) (bvsgt (_1!1273 (h!2276 (toList!832 call!13561))) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!127148 (= e!82997 e!83001)))

(declare-fun b!127149 () Bool)

(assert (=> b!127149 (= e!82997 call!13687)))

(declare-fun b!127150 () Bool)

(declare-fun res!61433 () Bool)

(assert (=> b!127150 (=> (not res!61433) (not e!82999))))

(assert (=> b!127150 (= res!61433 (containsKey!171 lt!65712 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13685 () Bool)

(assert (=> bm!13685 (= call!13686 call!13687)))

(declare-fun b!127151 () Bool)

(assert (=> b!127151 (= e!82999 (contains!866 lt!65712 (tuple2!2525 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38483 c!23313) b!127147))

(assert (= (and d!38483 (not c!23313)) b!127144))

(assert (= (and b!127144 c!23315) b!127149))

(assert (= (and b!127144 (not c!23315)) b!127148))

(assert (= (and b!127148 c!23316) b!127142))

(assert (= (and b!127148 (not c!23316)) b!127146))

(assert (= (or b!127142 b!127146) bm!13685))

(assert (= (or b!127149 bm!13685) bm!13683))

(assert (= (or b!127147 bm!13683) bm!13684))

(assert (= (and bm!13684 c!23314) b!127143))

(assert (= (and bm!13684 (not c!23314)) b!127145))

(assert (= (and d!38483 res!61434) b!127150))

(assert (= (and b!127150 res!61433) b!127151))

(declare-fun m!148593 () Bool)

(assert (=> b!127151 m!148593))

(declare-fun m!148595 () Bool)

(assert (=> b!127143 m!148595))

(declare-fun m!148597 () Bool)

(assert (=> b!127150 m!148597))

(declare-fun m!148599 () Bool)

(assert (=> d!38483 m!148599))

(declare-fun m!148601 () Bool)

(assert (=> d!38483 m!148601))

(declare-fun m!148603 () Bool)

(assert (=> bm!13684 m!148603))

(assert (=> d!38191 d!38483))

(declare-fun d!38485 () Bool)

(declare-fun e!83003 () Bool)

(assert (=> d!38485 e!83003))

(declare-fun res!61435 () Bool)

(assert (=> d!38485 (=> res!61435 e!83003)))

(declare-fun lt!65714 () Bool)

(assert (=> d!38485 (= res!61435 (not lt!65714))))

(declare-fun lt!65713 () Bool)

(assert (=> d!38485 (= lt!65714 lt!65713)))

(declare-fun lt!65716 () Unit!3928)

(declare-fun e!83002 () Unit!3928)

(assert (=> d!38485 (= lt!65716 e!83002)))

(declare-fun c!23317 () Bool)

(assert (=> d!38485 (= c!23317 lt!65713)))

(assert (=> d!38485 (= lt!65713 (containsKey!171 (toList!832 (map!1380 (_2!1274 lt!65321))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38485 (= (contains!864 (map!1380 (_2!1274 lt!65321)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65714)))

(declare-fun b!127152 () Bool)

(declare-fun lt!65715 () Unit!3928)

(assert (=> b!127152 (= e!83002 lt!65715)))

(assert (=> b!127152 (= lt!65715 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (map!1380 (_2!1274 lt!65321))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!127152 (isDefined!120 (getValueByKey!168 (toList!832 (map!1380 (_2!1274 lt!65321))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!127153 () Bool)

(declare-fun Unit!3962 () Unit!3928)

(assert (=> b!127153 (= e!83002 Unit!3962)))

(declare-fun b!127154 () Bool)

(assert (=> b!127154 (= e!83003 (isDefined!120 (getValueByKey!168 (toList!832 (map!1380 (_2!1274 lt!65321))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (= (and d!38485 c!23317) b!127152))

(assert (= (and d!38485 (not c!23317)) b!127153))

(assert (= (and d!38485 (not res!61435)) b!127154))

(assert (=> d!38485 m!147207))

(declare-fun m!148605 () Bool)

(assert (=> d!38485 m!148605))

(assert (=> b!127152 m!147207))

(declare-fun m!148607 () Bool)

(assert (=> b!127152 m!148607))

(assert (=> b!127152 m!147207))

(declare-fun m!148609 () Bool)

(assert (=> b!127152 m!148609))

(assert (=> b!127152 m!148609))

(declare-fun m!148611 () Bool)

(assert (=> b!127152 m!148611))

(assert (=> b!127154 m!147207))

(assert (=> b!127154 m!148609))

(assert (=> b!127154 m!148609))

(assert (=> b!127154 m!148611))

(assert (=> b!126472 d!38485))

(declare-fun d!38487 () Bool)

(assert (=> d!38487 (= (map!1380 (_2!1274 lt!65321)) (getCurrentListMap!512 (_keys!4515 (_2!1274 lt!65321)) (_values!2765 (_2!1274 lt!65321)) (mask!7038 (_2!1274 lt!65321)) (extraKeys!2563 (_2!1274 lt!65321)) (zeroValue!2645 (_2!1274 lt!65321)) (minValue!2645 (_2!1274 lt!65321)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1274 lt!65321))))))

(declare-fun bs!5277 () Bool)

(assert (= bs!5277 d!38487))

(declare-fun m!148613 () Bool)

(assert (=> bs!5277 m!148613))

(assert (=> b!126472 d!38487))

(declare-fun b!127155 () Bool)

(declare-fun e!83004 () Bool)

(declare-fun e!83005 () Bool)

(assert (=> b!127155 (= e!83004 e!83005)))

(assert (=> b!127155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun res!61439 () Bool)

(declare-fun lt!65717 () ListLongMap!1633)

(assert (=> b!127155 (= res!61439 (contains!864 lt!65717 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127155 (=> (not res!61439) (not e!83005))))

(declare-fun e!83009 () Bool)

(declare-fun b!127156 () Bool)

(assert (=> b!127156 (= e!83009 (= lt!65717 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16))))))

(declare-fun bm!13686 () Bool)

(declare-fun call!13689 () ListLongMap!1633)

(assert (=> bm!13686 (= call!13689 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2782 newMap!16)))))

(declare-fun b!127157 () Bool)

(declare-fun e!83008 () ListLongMap!1633)

(declare-fun e!83010 () ListLongMap!1633)

(assert (=> b!127157 (= e!83008 e!83010)))

(declare-fun c!23320 () Bool)

(assert (=> b!127157 (= c!23320 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127158 () Bool)

(declare-fun lt!65721 () Unit!3928)

(declare-fun lt!65720 () Unit!3928)

(assert (=> b!127158 (= lt!65721 lt!65720)))

(declare-fun lt!65718 () (_ BitVec 64))

(declare-fun lt!65719 () (_ BitVec 64))

(declare-fun lt!65722 () ListLongMap!1633)

(declare-fun lt!65723 () V!3433)

(assert (=> b!127158 (not (contains!864 (+!164 lt!65722 (tuple2!2525 lt!65718 lt!65723)) lt!65719))))

(assert (=> b!127158 (= lt!65720 (addStillNotContains!58 lt!65722 lt!65718 lt!65723 lt!65719))))

(assert (=> b!127158 (= lt!65719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!127158 (= lt!65723 (get!1452 (select (arr!2217 (ite c!23087 (_values!2765 newMap!16) lt!65155)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!127158 (= lt!65718 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127158 (= lt!65722 call!13689)))

(assert (=> b!127158 (= e!83010 (+!164 call!13689 (tuple2!2525 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (get!1452 (select (arr!2217 (ite c!23087 (_values!2765 newMap!16) lt!65155)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!38489 () Bool)

(declare-fun e!83007 () Bool)

(assert (=> d!38489 e!83007))

(declare-fun res!61437 () Bool)

(assert (=> d!38489 (=> (not res!61437) (not e!83007))))

(assert (=> d!38489 (= res!61437 (not (contains!864 lt!65717 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38489 (= lt!65717 e!83008)))

(declare-fun c!23319 () Bool)

(assert (=> d!38489 (= c!23319 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38489 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38489 (= (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (ite c!23087 (_values!2765 newMap!16) lt!65155) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65717)))

(declare-fun b!127159 () Bool)

(declare-fun res!61438 () Bool)

(assert (=> b!127159 (=> (not res!61438) (not e!83007))))

(assert (=> b!127159 (= res!61438 (not (contains!864 lt!65717 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127160 () Bool)

(declare-fun e!83006 () Bool)

(assert (=> b!127160 (= e!83006 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127160 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!127161 () Bool)

(assert (=> b!127161 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> b!127161 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (ite c!23087 (_values!2765 newMap!16) lt!65155))))))

(assert (=> b!127161 (= e!83005 (= (apply!111 lt!65717 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (ite c!23087 (_values!2765 newMap!16) lt!65155)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127162 () Bool)

(assert (=> b!127162 (= e!83010 call!13689)))

(declare-fun b!127163 () Bool)

(assert (=> b!127163 (= e!83004 e!83009)))

(declare-fun c!23318 () Bool)

(assert (=> b!127163 (= c!23318 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127164 () Bool)

(assert (=> b!127164 (= e!83009 (isEmpty!403 lt!65717))))

(declare-fun b!127165 () Bool)

(assert (=> b!127165 (= e!83007 e!83004)))

(declare-fun c!23321 () Bool)

(assert (=> b!127165 (= c!23321 e!83006)))

(declare-fun res!61436 () Bool)

(assert (=> b!127165 (=> (not res!61436) (not e!83006))))

(assert (=> b!127165 (= res!61436 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127166 () Bool)

(assert (=> b!127166 (= e!83008 (ListLongMap!1634 Nil!1675))))

(assert (= (and d!38489 c!23319) b!127166))

(assert (= (and d!38489 (not c!23319)) b!127157))

(assert (= (and b!127157 c!23320) b!127158))

(assert (= (and b!127157 (not c!23320)) b!127162))

(assert (= (or b!127158 b!127162) bm!13686))

(assert (= (and d!38489 res!61437) b!127159))

(assert (= (and b!127159 res!61438) b!127165))

(assert (= (and b!127165 res!61436) b!127160))

(assert (= (and b!127165 c!23321) b!127155))

(assert (= (and b!127165 (not c!23321)) b!127163))

(assert (= (and b!127155 res!61439) b!127161))

(assert (= (and b!127163 c!23318) b!127156))

(assert (= (and b!127163 (not c!23318)) b!127164))

(declare-fun b_lambda!5613 () Bool)

(assert (=> (not b_lambda!5613) (not b!127158)))

(assert (=> b!127158 t!6029))

(declare-fun b_and!7837 () Bool)

(assert (= b_and!7833 (and (=> t!6029 result!3843) b_and!7837)))

(assert (=> b!127158 t!6031))

(declare-fun b_and!7839 () Bool)

(assert (= b_and!7835 (and (=> t!6031 result!3845) b_and!7839)))

(declare-fun b_lambda!5615 () Bool)

(assert (=> (not b_lambda!5615) (not b!127161)))

(assert (=> b!127161 t!6029))

(declare-fun b_and!7841 () Bool)

(assert (= b_and!7837 (and (=> t!6029 result!3843) b_and!7841)))

(assert (=> b!127161 t!6031))

(declare-fun b_and!7843 () Bool)

(assert (= b_and!7839 (and (=> t!6031 result!3845) b_and!7843)))

(declare-fun m!148615 () Bool)

(assert (=> b!127158 m!148615))

(assert (=> b!127158 m!147525))

(declare-fun m!148617 () Bool)

(assert (=> b!127158 m!148617))

(assert (=> b!127158 m!148615))

(declare-fun m!148619 () Bool)

(assert (=> b!127158 m!148619))

(assert (=> b!127158 m!147569))

(assert (=> b!127158 m!147573))

(assert (=> b!127158 m!147573))

(assert (=> b!127158 m!147569))

(assert (=> b!127158 m!147575))

(declare-fun m!148621 () Bool)

(assert (=> b!127158 m!148621))

(declare-fun m!148623 () Bool)

(assert (=> b!127156 m!148623))

(declare-fun m!148625 () Bool)

(assert (=> b!127164 m!148625))

(declare-fun m!148627 () Bool)

(assert (=> d!38489 m!148627))

(assert (=> d!38489 m!147517))

(assert (=> bm!13686 m!148623))

(assert (=> b!127161 m!147525))

(declare-fun m!148629 () Bool)

(assert (=> b!127161 m!148629))

(assert (=> b!127161 m!147525))

(assert (=> b!127161 m!147569))

(assert (=> b!127161 m!147573))

(assert (=> b!127161 m!147573))

(assert (=> b!127161 m!147569))

(assert (=> b!127161 m!147575))

(assert (=> b!127160 m!147525))

(assert (=> b!127160 m!147525))

(assert (=> b!127160 m!147527))

(assert (=> b!127157 m!147525))

(assert (=> b!127157 m!147525))

(assert (=> b!127157 m!147527))

(assert (=> b!127155 m!147525))

(assert (=> b!127155 m!147525))

(declare-fun m!148631 () Bool)

(assert (=> b!127155 m!148631))

(declare-fun m!148633 () Bool)

(assert (=> b!127159 m!148633))

(assert (=> bm!13603 d!38489))

(declare-fun d!38491 () Bool)

(assert (=> d!38491 (= (apply!111 (+!164 lt!65453 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65456) (apply!111 lt!65453 lt!65456))))

(declare-fun lt!65724 () Unit!3928)

(assert (=> d!38491 (= lt!65724 (choose!772 lt!65453 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65456))))

(declare-fun e!83011 () Bool)

(assert (=> d!38491 e!83011))

(declare-fun res!61440 () Bool)

(assert (=> d!38491 (=> (not res!61440) (not e!83011))))

(assert (=> d!38491 (= res!61440 (contains!864 lt!65453 lt!65456))))

(assert (=> d!38491 (= (addApplyDifferent!87 lt!65453 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65456) lt!65724)))

(declare-fun b!127167 () Bool)

(assert (=> b!127167 (= e!83011 (not (= lt!65456 lt!65446)))))

(assert (= (and d!38491 res!61440) b!127167))

(assert (=> d!38491 m!147769))

(assert (=> d!38491 m!147769))

(assert (=> d!38491 m!147771))

(declare-fun m!148635 () Bool)

(assert (=> d!38491 m!148635))

(assert (=> d!38491 m!147767))

(declare-fun m!148637 () Bool)

(assert (=> d!38491 m!148637))

(assert (=> b!126687 d!38491))

(declare-fun d!38493 () Bool)

(assert (=> d!38493 (= (apply!111 (+!164 lt!65444 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65442) (apply!111 lt!65444 lt!65442))))

(declare-fun lt!65725 () Unit!3928)

(assert (=> d!38493 (= lt!65725 (choose!772 lt!65444 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65442))))

(declare-fun e!83012 () Bool)

(assert (=> d!38493 e!83012))

(declare-fun res!61441 () Bool)

(assert (=> d!38493 (=> (not res!61441) (not e!83012))))

(assert (=> d!38493 (= res!61441 (contains!864 lt!65444 lt!65442))))

(assert (=> d!38493 (= (addApplyDifferent!87 lt!65444 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65442) lt!65725)))

(declare-fun b!127168 () Bool)

(assert (=> b!127168 (= e!83012 (not (= lt!65442 lt!65452)))))

(assert (= (and d!38493 res!61441) b!127168))

(assert (=> d!38493 m!147765))

(assert (=> d!38493 m!147765))

(assert (=> d!38493 m!147781))

(declare-fun m!148639 () Bool)

(assert (=> d!38493 m!148639))

(assert (=> d!38493 m!147763))

(declare-fun m!148641 () Bool)

(assert (=> d!38493 m!148641))

(assert (=> b!126687 d!38493))

(declare-fun d!38495 () Bool)

(assert (=> d!38495 (= (apply!111 lt!65457 lt!65454) (get!1456 (getValueByKey!168 (toList!832 lt!65457) lt!65454)))))

(declare-fun bs!5278 () Bool)

(assert (= bs!5278 d!38495))

(declare-fun m!148643 () Bool)

(assert (=> bs!5278 m!148643))

(assert (=> bs!5278 m!148643))

(declare-fun m!148645 () Bool)

(assert (=> bs!5278 m!148645))

(assert (=> b!126687 d!38495))

(assert (=> b!126687 d!38353))

(declare-fun d!38497 () Bool)

(assert (=> d!38497 (= (apply!111 lt!65444 lt!65442) (get!1456 (getValueByKey!168 (toList!832 lt!65444) lt!65442)))))

(declare-fun bs!5279 () Bool)

(assert (= bs!5279 d!38497))

(declare-fun m!148647 () Bool)

(assert (=> bs!5279 m!148647))

(assert (=> bs!5279 m!148647))

(declare-fun m!148649 () Bool)

(assert (=> bs!5279 m!148649))

(assert (=> b!126687 d!38497))

(declare-fun d!38499 () Bool)

(declare-fun e!83013 () Bool)

(assert (=> d!38499 e!83013))

(declare-fun res!61443 () Bool)

(assert (=> d!38499 (=> (not res!61443) (not e!83013))))

(declare-fun lt!65726 () ListLongMap!1633)

(assert (=> d!38499 (= res!61443 (contains!864 lt!65726 (_1!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(declare-fun lt!65727 () List!1678)

(assert (=> d!38499 (= lt!65726 (ListLongMap!1634 lt!65727))))

(declare-fun lt!65729 () Unit!3928)

(declare-fun lt!65728 () Unit!3928)

(assert (=> d!38499 (= lt!65729 lt!65728)))

(assert (=> d!38499 (= (getValueByKey!168 lt!65727 (_1!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38499 (= lt!65728 (lemmaContainsTupThenGetReturnValue!83 lt!65727 (_1!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38499 (= lt!65727 (insertStrictlySorted!86 (toList!832 lt!65444) (_1!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38499 (= (+!164 lt!65444 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65726)))

(declare-fun b!127169 () Bool)

(declare-fun res!61442 () Bool)

(assert (=> b!127169 (=> (not res!61442) (not e!83013))))

(assert (=> b!127169 (= res!61442 (= (getValueByKey!168 (toList!832 lt!65726) (_1!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))))))))

(declare-fun b!127170 () Bool)

(assert (=> b!127170 (= e!83013 (contains!866 (toList!832 lt!65726) (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))))))

(assert (= (and d!38499 res!61443) b!127169))

(assert (= (and b!127169 res!61442) b!127170))

(declare-fun m!148651 () Bool)

(assert (=> d!38499 m!148651))

(declare-fun m!148653 () Bool)

(assert (=> d!38499 m!148653))

(declare-fun m!148655 () Bool)

(assert (=> d!38499 m!148655))

(declare-fun m!148657 () Bool)

(assert (=> d!38499 m!148657))

(declare-fun m!148659 () Bool)

(assert (=> b!127169 m!148659))

(declare-fun m!148661 () Bool)

(assert (=> b!127170 m!148661))

(assert (=> b!126687 d!38499))

(declare-fun d!38501 () Bool)

(assert (=> d!38501 (= (apply!111 (+!164 lt!65453 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65456) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65453 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) lt!65456)))))

(declare-fun bs!5280 () Bool)

(assert (= bs!5280 d!38501))

(declare-fun m!148663 () Bool)

(assert (=> bs!5280 m!148663))

(assert (=> bs!5280 m!148663))

(declare-fun m!148665 () Bool)

(assert (=> bs!5280 m!148665))

(assert (=> b!126687 d!38501))

(declare-fun d!38503 () Bool)

(assert (=> d!38503 (= (apply!111 (+!164 lt!65444 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65442) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65444 (tuple2!2525 lt!65452 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65442)))))

(declare-fun bs!5281 () Bool)

(assert (= bs!5281 d!38503))

(declare-fun m!148667 () Bool)

(assert (=> bs!5281 m!148667))

(assert (=> bs!5281 m!148667))

(declare-fun m!148669 () Bool)

(assert (=> bs!5281 m!148669))

(assert (=> b!126687 d!38503))

(declare-fun d!38505 () Bool)

(assert (=> d!38505 (= (apply!111 (+!164 lt!65457 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65454) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65457 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) lt!65454)))))

(declare-fun bs!5282 () Bool)

(assert (= bs!5282 d!38505))

(declare-fun m!148671 () Bool)

(assert (=> bs!5282 m!148671))

(assert (=> bs!5282 m!148671))

(declare-fun m!148673 () Bool)

(assert (=> bs!5282 m!148673))

(assert (=> b!126687 d!38505))

(declare-fun d!38507 () Bool)

(declare-fun e!83015 () Bool)

(assert (=> d!38507 e!83015))

(declare-fun res!61444 () Bool)

(assert (=> d!38507 (=> res!61444 e!83015)))

(declare-fun lt!65731 () Bool)

(assert (=> d!38507 (= res!61444 (not lt!65731))))

(declare-fun lt!65730 () Bool)

(assert (=> d!38507 (= lt!65731 lt!65730)))

(declare-fun lt!65733 () Unit!3928)

(declare-fun e!83014 () Unit!3928)

(assert (=> d!38507 (= lt!65733 e!83014)))

(declare-fun c!23322 () Bool)

(assert (=> d!38507 (= c!23322 lt!65730)))

(assert (=> d!38507 (= lt!65730 (containsKey!171 (toList!832 (+!164 lt!65443 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65460))))

(assert (=> d!38507 (= (contains!864 (+!164 lt!65443 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65460) lt!65731)))

(declare-fun b!127171 () Bool)

(declare-fun lt!65732 () Unit!3928)

(assert (=> b!127171 (= e!83014 lt!65732)))

(assert (=> b!127171 (= lt!65732 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (+!164 lt!65443 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65460))))

(assert (=> b!127171 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65443 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65460))))

(declare-fun b!127172 () Bool)

(declare-fun Unit!3963 () Unit!3928)

(assert (=> b!127172 (= e!83014 Unit!3963)))

(declare-fun b!127173 () Bool)

(assert (=> b!127173 (= e!83015 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65443 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) lt!65460)))))

(assert (= (and d!38507 c!23322) b!127171))

(assert (= (and d!38507 (not c!23322)) b!127172))

(assert (= (and d!38507 (not res!61444)) b!127173))

(declare-fun m!148675 () Bool)

(assert (=> d!38507 m!148675))

(declare-fun m!148677 () Bool)

(assert (=> b!127171 m!148677))

(declare-fun m!148679 () Bool)

(assert (=> b!127171 m!148679))

(assert (=> b!127171 m!148679))

(declare-fun m!148681 () Bool)

(assert (=> b!127171 m!148681))

(assert (=> b!127173 m!148679))

(assert (=> b!127173 m!148679))

(assert (=> b!127173 m!148681))

(assert (=> b!126687 d!38507))

(declare-fun d!38509 () Bool)

(declare-fun e!83016 () Bool)

(assert (=> d!38509 e!83016))

(declare-fun res!61446 () Bool)

(assert (=> d!38509 (=> (not res!61446) (not e!83016))))

(declare-fun lt!65734 () ListLongMap!1633)

(assert (=> d!38509 (= res!61446 (contains!864 lt!65734 (_1!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(declare-fun lt!65735 () List!1678)

(assert (=> d!38509 (= lt!65734 (ListLongMap!1634 lt!65735))))

(declare-fun lt!65737 () Unit!3928)

(declare-fun lt!65736 () Unit!3928)

(assert (=> d!38509 (= lt!65737 lt!65736)))

(assert (=> d!38509 (= (getValueByKey!168 lt!65735 (_1!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38509 (= lt!65736 (lemmaContainsTupThenGetReturnValue!83 lt!65735 (_1!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38509 (= lt!65735 (insertStrictlySorted!86 (toList!832 lt!65457) (_1!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38509 (= (+!164 lt!65457 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65734)))

(declare-fun b!127174 () Bool)

(declare-fun res!61445 () Bool)

(assert (=> b!127174 (=> (not res!61445) (not e!83016))))

(assert (=> b!127174 (= res!61445 (= (getValueByKey!168 (toList!832 lt!65734) (_1!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(declare-fun b!127175 () Bool)

(assert (=> b!127175 (= e!83016 (contains!866 (toList!832 lt!65734) (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))

(assert (= (and d!38509 res!61446) b!127174))

(assert (= (and b!127174 res!61445) b!127175))

(declare-fun m!148683 () Bool)

(assert (=> d!38509 m!148683))

(declare-fun m!148685 () Bool)

(assert (=> d!38509 m!148685))

(declare-fun m!148687 () Bool)

(assert (=> d!38509 m!148687))

(declare-fun m!148689 () Bool)

(assert (=> d!38509 m!148689))

(declare-fun m!148691 () Bool)

(assert (=> b!127174 m!148691))

(declare-fun m!148693 () Bool)

(assert (=> b!127175 m!148693))

(assert (=> b!126687 d!38509))

(declare-fun d!38511 () Bool)

(assert (=> d!38511 (= (apply!111 lt!65453 lt!65456) (get!1456 (getValueByKey!168 (toList!832 lt!65453) lt!65456)))))

(declare-fun bs!5283 () Bool)

(assert (= bs!5283 d!38511))

(declare-fun m!148695 () Bool)

(assert (=> bs!5283 m!148695))

(assert (=> bs!5283 m!148695))

(declare-fun m!148697 () Bool)

(assert (=> bs!5283 m!148697))

(assert (=> b!126687 d!38511))

(declare-fun d!38513 () Bool)

(declare-fun e!83017 () Bool)

(assert (=> d!38513 e!83017))

(declare-fun res!61448 () Bool)

(assert (=> d!38513 (=> (not res!61448) (not e!83017))))

(declare-fun lt!65738 () ListLongMap!1633)

(assert (=> d!38513 (= res!61448 (contains!864 lt!65738 (_1!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(declare-fun lt!65739 () List!1678)

(assert (=> d!38513 (= lt!65738 (ListLongMap!1634 lt!65739))))

(declare-fun lt!65741 () Unit!3928)

(declare-fun lt!65740 () Unit!3928)

(assert (=> d!38513 (= lt!65741 lt!65740)))

(assert (=> d!38513 (= (getValueByKey!168 lt!65739 (_1!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38513 (= lt!65740 (lemmaContainsTupThenGetReturnValue!83 lt!65739 (_1!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38513 (= lt!65739 (insertStrictlySorted!86 (toList!832 lt!65453) (_1!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38513 (= (+!164 lt!65453 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65738)))

(declare-fun b!127176 () Bool)

(declare-fun res!61447 () Bool)

(assert (=> b!127176 (=> (not res!61447) (not e!83017))))

(assert (=> b!127176 (= res!61447 (= (getValueByKey!168 (toList!832 lt!65738) (_1!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(declare-fun b!127177 () Bool)

(assert (=> b!127177 (= e!83017 (contains!866 (toList!832 lt!65738) (tuple2!2525 lt!65446 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))

(assert (= (and d!38513 res!61448) b!127176))

(assert (= (and b!127176 res!61447) b!127177))

(declare-fun m!148699 () Bool)

(assert (=> d!38513 m!148699))

(declare-fun m!148701 () Bool)

(assert (=> d!38513 m!148701))

(declare-fun m!148703 () Bool)

(assert (=> d!38513 m!148703))

(declare-fun m!148705 () Bool)

(assert (=> d!38513 m!148705))

(declare-fun m!148707 () Bool)

(assert (=> b!127176 m!148707))

(declare-fun m!148709 () Bool)

(assert (=> b!127177 m!148709))

(assert (=> b!126687 d!38513))

(declare-fun d!38515 () Bool)

(assert (=> d!38515 (= (apply!111 (+!164 lt!65457 (tuple2!2525 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65454) (apply!111 lt!65457 lt!65454))))

(declare-fun lt!65742 () Unit!3928)

(assert (=> d!38515 (= lt!65742 (choose!772 lt!65457 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65454))))

(declare-fun e!83018 () Bool)

(assert (=> d!38515 e!83018))

(declare-fun res!61449 () Bool)

(assert (=> d!38515 (=> (not res!61449) (not e!83018))))

(assert (=> d!38515 (= res!61449 (contains!864 lt!65457 lt!65454))))

(assert (=> d!38515 (= (addApplyDifferent!87 lt!65457 lt!65448 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)) lt!65454) lt!65742)))

(declare-fun b!127178 () Bool)

(assert (=> b!127178 (= e!83018 (not (= lt!65454 lt!65448)))))

(assert (= (and d!38515 res!61449) b!127178))

(assert (=> d!38515 m!147773))

(assert (=> d!38515 m!147773))

(assert (=> d!38515 m!147775))

(declare-fun m!148711 () Bool)

(assert (=> d!38515 m!148711))

(assert (=> d!38515 m!147783))

(declare-fun m!148713 () Bool)

(assert (=> d!38515 m!148713))

(assert (=> b!126687 d!38515))

(declare-fun d!38517 () Bool)

(declare-fun e!83019 () Bool)

(assert (=> d!38517 e!83019))

(declare-fun res!61451 () Bool)

(assert (=> d!38517 (=> (not res!61451) (not e!83019))))

(declare-fun lt!65743 () ListLongMap!1633)

(assert (=> d!38517 (= res!61451 (contains!864 lt!65743 (_1!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(declare-fun lt!65744 () List!1678)

(assert (=> d!38517 (= lt!65743 (ListLongMap!1634 lt!65744))))

(declare-fun lt!65746 () Unit!3928)

(declare-fun lt!65745 () Unit!3928)

(assert (=> d!38517 (= lt!65746 lt!65745)))

(assert (=> d!38517 (= (getValueByKey!168 lt!65744 (_1!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38517 (= lt!65745 (lemmaContainsTupThenGetReturnValue!83 lt!65744 (_1!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38517 (= lt!65744 (insertStrictlySorted!86 (toList!832 lt!65443) (_1!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))))))

(assert (=> d!38517 (= (+!164 lt!65443 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65743)))

(declare-fun b!127179 () Bool)

(declare-fun res!61450 () Bool)

(assert (=> b!127179 (=> (not res!61450) (not e!83019))))

(assert (=> b!127179 (= res!61450 (= (getValueByKey!168 (toList!832 lt!65743) (_1!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))))))))

(declare-fun b!127180 () Bool)

(assert (=> b!127180 (= e!83019 (contains!866 (toList!832 lt!65743) (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))))))

(assert (= (and d!38517 res!61451) b!127179))

(assert (= (and b!127179 res!61450) b!127180))

(declare-fun m!148715 () Bool)

(assert (=> d!38517 m!148715))

(declare-fun m!148717 () Bool)

(assert (=> d!38517 m!148717))

(declare-fun m!148719 () Bool)

(assert (=> d!38517 m!148719))

(declare-fun m!148721 () Bool)

(assert (=> d!38517 m!148721))

(declare-fun m!148723 () Bool)

(assert (=> b!127179 m!148723))

(declare-fun m!148725 () Bool)

(assert (=> b!127180 m!148725))

(assert (=> b!126687 d!38517))

(declare-fun d!38519 () Bool)

(assert (=> d!38519 (contains!864 (+!164 lt!65443 (tuple2!2525 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)))) lt!65460)))

(declare-fun lt!65747 () Unit!3928)

(assert (=> d!38519 (= lt!65747 (choose!773 lt!65443 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65460))))

(assert (=> d!38519 (contains!864 lt!65443 lt!65460)))

(assert (=> d!38519 (= (addStillContains!87 lt!65443 lt!65462 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16)) lt!65460) lt!65747)))

(declare-fun bs!5284 () Bool)

(assert (= bs!5284 d!38519))

(assert (=> bs!5284 m!147785))

(assert (=> bs!5284 m!147785))

(assert (=> bs!5284 m!147787))

(declare-fun m!148727 () Bool)

(assert (=> bs!5284 m!148727))

(declare-fun m!148729 () Bool)

(assert (=> bs!5284 m!148729))

(assert (=> b!126687 d!38519))

(declare-fun d!38521 () Bool)

(declare-fun e!83020 () Bool)

(assert (=> d!38521 e!83020))

(declare-fun res!61453 () Bool)

(assert (=> d!38521 (=> (not res!61453) (not e!83020))))

(declare-fun lt!65748 () ListLongMap!1633)

(assert (=> d!38521 (= res!61453 (contains!864 lt!65748 (_1!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(declare-fun lt!65749 () List!1678)

(assert (=> d!38521 (= lt!65748 (ListLongMap!1634 lt!65749))))

(declare-fun lt!65751 () Unit!3928)

(declare-fun lt!65750 () Unit!3928)

(assert (=> d!38521 (= lt!65751 lt!65750)))

(assert (=> d!38521 (= (getValueByKey!168 lt!65749 (_1!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))) (Some!173 (_2!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(assert (=> d!38521 (= lt!65750 (lemmaContainsTupThenGetReturnValue!83 lt!65749 (_1!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (_2!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(assert (=> d!38521 (= lt!65749 (insertStrictlySorted!86 (toList!832 (ite c!23176 call!13634 (ite c!23173 call!13637 call!13640))) (_1!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (_2!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(assert (=> d!38521 (= (+!164 (ite c!23176 call!13634 (ite c!23173 call!13637 call!13640)) (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) lt!65748)))

(declare-fun b!127181 () Bool)

(declare-fun res!61452 () Bool)

(assert (=> b!127181 (=> (not res!61452) (not e!83020))))

(assert (=> b!127181 (= res!61452 (= (getValueByKey!168 (toList!832 lt!65748) (_1!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))) (Some!173 (_2!1273 (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))))

(declare-fun b!127182 () Bool)

(assert (=> b!127182 (= e!83020 (contains!866 (toList!832 lt!65748) (ite (or c!23176 c!23173) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23087 c!23084) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2645 newMap!16))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (= (and d!38521 res!61453) b!127181))

(assert (= (and b!127181 res!61452) b!127182))

(declare-fun m!148731 () Bool)

(assert (=> d!38521 m!148731))

(declare-fun m!148733 () Bool)

(assert (=> d!38521 m!148733))

(declare-fun m!148735 () Bool)

(assert (=> d!38521 m!148735))

(declare-fun m!148737 () Bool)

(assert (=> d!38521 m!148737))

(declare-fun m!148739 () Bool)

(assert (=> b!127181 m!148739))

(declare-fun m!148741 () Bool)

(assert (=> b!127182 m!148741))

(assert (=> bm!13631 d!38521))

(declare-fun d!38523 () Bool)

(assert (=> d!38523 (= (apply!111 lt!65455 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1456 (getValueByKey!168 (toList!832 lt!65455) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5285 () Bool)

(assert (= bs!5285 d!38523))

(assert (=> bs!5285 m!147525))

(declare-fun m!148743 () Bool)

(assert (=> bs!5285 m!148743))

(assert (=> bs!5285 m!148743))

(declare-fun m!148745 () Bool)

(assert (=> bs!5285 m!148745))

(assert (=> b!126684 d!38523))

(declare-fun c!23323 () Bool)

(declare-fun d!38525 () Bool)

(assert (=> d!38525 (= c!23323 ((_ is ValueCellFull!1076) (select (arr!2217 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!83021 () V!3433)

(assert (=> d!38525 (= (get!1452 (select (arr!2217 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83021)))

(declare-fun b!127183 () Bool)

(assert (=> b!127183 (= e!83021 (get!1454 (select (arr!2217 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127184 () Bool)

(assert (=> b!127184 (= e!83021 (get!1455 (select (arr!2217 (ite (or c!23087 c!23081) (_values!2765 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38525 c!23323) b!127183))

(assert (= (and d!38525 (not c!23323)) b!127184))

(assert (=> b!127183 m!147805))

(assert (=> b!127183 m!147569))

(declare-fun m!148747 () Bool)

(assert (=> b!127183 m!148747))

(assert (=> b!127184 m!147805))

(assert (=> b!127184 m!147569))

(declare-fun m!148749 () Bool)

(assert (=> b!127184 m!148749))

(assert (=> b!126684 d!38525))

(declare-fun d!38527 () Bool)

(assert (=> d!38527 (= (isEmpty!402 (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))) (not ((_ is Some!173) (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(assert (=> d!38205 d!38527))

(declare-fun d!38529 () Bool)

(declare-fun lt!65754 () Bool)

(declare-fun content!127 (List!1680) (InoxSet (_ BitVec 64)))

(assert (=> d!38529 (= lt!65754 (select (content!127 Nil!1677) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!83027 () Bool)

(assert (=> d!38529 (= lt!65754 e!83027)))

(declare-fun res!61459 () Bool)

(assert (=> d!38529 (=> (not res!61459) (not e!83027))))

(assert (=> d!38529 (= res!61459 ((_ is Cons!1676) Nil!1677))))

(assert (=> d!38529 (= (contains!867 Nil!1677 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) lt!65754)))

(declare-fun b!127189 () Bool)

(declare-fun e!83026 () Bool)

(assert (=> b!127189 (= e!83027 e!83026)))

(declare-fun res!61458 () Bool)

(assert (=> b!127189 (=> res!61458 e!83026)))

(assert (=> b!127189 (= res!61458 (= (h!2278 Nil!1677) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127190 () Bool)

(assert (=> b!127190 (= e!83026 (contains!867 (t!6027 Nil!1677) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38529 res!61459) b!127189))

(assert (= (and b!127189 (not res!61458)) b!127190))

(declare-fun m!148751 () Bool)

(assert (=> d!38529 m!148751))

(assert (=> d!38529 m!147525))

(declare-fun m!148753 () Bool)

(assert (=> d!38529 m!148753))

(assert (=> b!127190 m!147525))

(declare-fun m!148755 () Bool)

(assert (=> b!127190 m!148755))

(assert (=> b!126665 d!38529))

(assert (=> b!126577 d!38381))

(declare-fun b!127194 () Bool)

(declare-fun e!83029 () Option!174)

(assert (=> b!127194 (= e!83029 None!172)))

(declare-fun b!127191 () Bool)

(declare-fun e!83028 () Option!174)

(assert (=> b!127191 (= e!83028 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65508)))))))

(declare-fun b!127193 () Bool)

(assert (=> b!127193 (= e!83029 (getValueByKey!168 (t!6017 (toList!832 lt!65508)) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun d!38531 () Bool)

(declare-fun c!23324 () Bool)

(assert (=> d!38531 (= c!23324 (and ((_ is Cons!1674) (toList!832 lt!65508)) (= (_1!1273 (h!2276 (toList!832 lt!65508))) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38531 (= (getValueByKey!168 (toList!832 lt!65508) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!83028)))

(declare-fun b!127192 () Bool)

(assert (=> b!127192 (= e!83028 e!83029)))

(declare-fun c!23325 () Bool)

(assert (=> b!127192 (= c!23325 (and ((_ is Cons!1674) (toList!832 lt!65508)) (not (= (_1!1273 (h!2276 (toList!832 lt!65508))) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38531 c!23324) b!127191))

(assert (= (and d!38531 (not c!23324)) b!127192))

(assert (= (and b!127192 c!23325) b!127193))

(assert (= (and b!127192 (not c!23325)) b!127194))

(declare-fun m!148757 () Bool)

(assert (=> b!127193 m!148757))

(assert (=> b!126756 d!38531))

(declare-fun d!38533 () Bool)

(declare-fun e!83031 () Bool)

(assert (=> d!38533 e!83031))

(declare-fun res!61460 () Bool)

(assert (=> d!38533 (=> res!61460 e!83031)))

(declare-fun lt!65756 () Bool)

(assert (=> d!38533 (= res!61460 (not lt!65756))))

(declare-fun lt!65755 () Bool)

(assert (=> d!38533 (= lt!65756 lt!65755)))

(declare-fun lt!65758 () Unit!3928)

(declare-fun e!83030 () Unit!3928)

(assert (=> d!38533 (= lt!65758 e!83030)))

(declare-fun c!23326 () Bool)

(assert (=> d!38533 (= c!23326 lt!65755)))

(assert (=> d!38533 (= lt!65755 (containsKey!171 (toList!832 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38533 (= (contains!864 lt!65390 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65756)))

(declare-fun b!127195 () Bool)

(declare-fun lt!65757 () Unit!3928)

(assert (=> b!127195 (= e!83030 lt!65757)))

(assert (=> b!127195 (= lt!65757 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127195 (isDefined!120 (getValueByKey!168 (toList!832 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127196 () Bool)

(declare-fun Unit!3964 () Unit!3928)

(assert (=> b!127196 (= e!83030 Unit!3964)))

(declare-fun b!127197 () Bool)

(assert (=> b!127197 (= e!83031 (isDefined!120 (getValueByKey!168 (toList!832 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38533 c!23326) b!127195))

(assert (= (and d!38533 (not c!23326)) b!127196))

(assert (= (and d!38533 (not res!61460)) b!127197))

(declare-fun m!148759 () Bool)

(assert (=> d!38533 m!148759))

(declare-fun m!148761 () Bool)

(assert (=> b!127195 m!148761))

(assert (=> b!127195 m!148569))

(assert (=> b!127195 m!148569))

(declare-fun m!148763 () Bool)

(assert (=> b!127195 m!148763))

(assert (=> b!127197 m!148569))

(assert (=> b!127197 m!148569))

(assert (=> b!127197 m!148763))

(assert (=> bm!13617 d!38533))

(assert (=> b!126626 d!38179))

(declare-fun b!127201 () Bool)

(declare-fun e!83033 () Option!174)

(assert (=> b!127201 (= e!83033 None!172)))

(declare-fun b!127198 () Bool)

(declare-fun e!83032 () Option!174)

(assert (=> b!127198 (= e!83032 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65474)))))))

(declare-fun b!127200 () Bool)

(assert (=> b!127200 (= e!83033 (getValueByKey!168 (t!6017 (toList!832 lt!65474)) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun d!38535 () Bool)

(declare-fun c!23327 () Bool)

(assert (=> d!38535 (= c!23327 (and ((_ is Cons!1674) (toList!832 lt!65474)) (= (_1!1273 (h!2276 (toList!832 lt!65474))) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38535 (= (getValueByKey!168 (toList!832 lt!65474) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!83032)))

(declare-fun b!127199 () Bool)

(assert (=> b!127199 (= e!83032 e!83033)))

(declare-fun c!23328 () Bool)

(assert (=> b!127199 (= c!23328 (and ((_ is Cons!1674) (toList!832 lt!65474)) (not (= (_1!1273 (h!2276 (toList!832 lt!65474))) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38535 c!23327) b!127198))

(assert (= (and d!38535 (not c!23327)) b!127199))

(assert (= (and b!127199 c!23328) b!127200))

(assert (= (and b!127199 (not c!23328)) b!127201))

(declare-fun m!148765 () Bool)

(assert (=> b!127200 m!148765))

(assert (=> b!126713 d!38535))

(declare-fun d!38537 () Bool)

(declare-fun e!83035 () Bool)

(assert (=> d!38537 e!83035))

(declare-fun res!61461 () Bool)

(assert (=> d!38537 (=> res!61461 e!83035)))

(declare-fun lt!65760 () Bool)

(assert (=> d!38537 (= res!61461 (not lt!65760))))

(declare-fun lt!65759 () Bool)

(assert (=> d!38537 (= lt!65760 lt!65759)))

(declare-fun lt!65762 () Unit!3928)

(declare-fun e!83034 () Unit!3928)

(assert (=> d!38537 (= lt!65762 e!83034)))

(declare-fun c!23329 () Bool)

(assert (=> d!38537 (= c!23329 lt!65759)))

(assert (=> d!38537 (= lt!65759 (containsKey!171 (toList!832 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38537 (= (contains!864 lt!65390 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65760)))

(declare-fun b!127202 () Bool)

(declare-fun lt!65761 () Unit!3928)

(assert (=> b!127202 (= e!83034 lt!65761)))

(assert (=> b!127202 (= lt!65761 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127202 (isDefined!120 (getValueByKey!168 (toList!832 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127203 () Bool)

(declare-fun Unit!3965 () Unit!3928)

(assert (=> b!127203 (= e!83034 Unit!3965)))

(declare-fun b!127204 () Bool)

(assert (=> b!127204 (= e!83035 (isDefined!120 (getValueByKey!168 (toList!832 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38537 c!23329) b!127202))

(assert (= (and d!38537 (not c!23329)) b!127203))

(assert (= (and d!38537 (not res!61461)) b!127204))

(declare-fun m!148767 () Bool)

(assert (=> d!38537 m!148767))

(declare-fun m!148769 () Bool)

(assert (=> b!127202 m!148769))

(assert (=> b!127202 m!148429))

(assert (=> b!127202 m!148429))

(declare-fun m!148771 () Bool)

(assert (=> b!127202 m!148771))

(assert (=> b!127204 m!148429))

(assert (=> b!127204 m!148429))

(assert (=> b!127204 m!148771))

(assert (=> bm!13621 d!38537))

(declare-fun d!38539 () Bool)

(assert (=> d!38539 (= (get!1456 (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3130 (getValueByKey!168 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38195 d!38539))

(assert (=> d!38195 d!38431))

(declare-fun d!38541 () Bool)

(assert (=> d!38541 (contains!864 (getCurrentListMap!512 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))

(assert (=> d!38541 true))

(declare-fun _$16!142 () Unit!3928)

(assert (=> d!38541 (= (choose!774 (_keys!4515 newMap!16) lt!65155 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3212 lt!65160) (defaultEntry!2782 newMap!16)) _$16!142)))

(declare-fun bs!5286 () Bool)

(assert (= bs!5286 d!38541))

(assert (=> bs!5286 m!147943))

(assert (=> bs!5286 m!147365))

(assert (=> bs!5286 m!147943))

(assert (=> bs!5286 m!147365))

(assert (=> bs!5286 m!147945))

(assert (=> d!38263 d!38541))

(assert (=> d!38263 d!38379))

(assert (=> b!126676 d!38381))

(declare-fun d!38543 () Bool)

(assert (=> d!38543 (isDefined!120 (getValueByKey!168 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65763 () Unit!3928)

(assert (=> d!38543 (= lt!65763 (choose!770 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!83036 () Bool)

(assert (=> d!38543 e!83036))

(declare-fun res!61462 () Bool)

(assert (=> d!38543 (=> (not res!61462) (not e!83036))))

(assert (=> d!38543 (= res!61462 (isStrictlySorted!304 (toList!832 call!13566)))))

(assert (=> d!38543 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65763)))

(declare-fun b!127205 () Bool)

(assert (=> b!127205 (= e!83036 (containsKey!171 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38543 res!61462) b!127205))

(assert (=> d!38543 m!147207))

(assert (=> d!38543 m!147673))

(assert (=> d!38543 m!147673))

(assert (=> d!38543 m!147675))

(assert (=> d!38543 m!147207))

(declare-fun m!148773 () Bool)

(assert (=> d!38543 m!148773))

(declare-fun m!148775 () Bool)

(assert (=> d!38543 m!148775))

(assert (=> b!127205 m!147207))

(assert (=> b!127205 m!147669))

(assert (=> b!126580 d!38543))

(assert (=> b!126580 d!38313))

(assert (=> b!126580 d!38315))

(declare-fun d!38545 () Bool)

(assert (=> d!38545 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!65764 () Unit!3928)

(assert (=> d!38545 (= lt!65764 (choose!770 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!83037 () Bool)

(assert (=> d!38545 e!83037))

(declare-fun res!61463 () Bool)

(assert (=> d!38545 (=> (not res!61463) (not e!83037))))

(assert (=> d!38545 (= res!61463 (isStrictlySorted!304 (toList!832 lt!65225)))))

(assert (=> d!38545 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000) lt!65764)))

(declare-fun b!127206 () Bool)

(assert (=> b!127206 (= e!83037 (containsKey!171 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38545 res!61463) b!127206))

(assert (=> d!38545 m!147513))

(assert (=> d!38545 m!147513))

(assert (=> d!38545 m!147515))

(declare-fun m!148777 () Bool)

(assert (=> d!38545 m!148777))

(assert (=> d!38545 m!148435))

(assert (=> b!127206 m!147509))

(assert (=> b!126494 d!38545))

(assert (=> b!126494 d!38319))

(assert (=> b!126494 d!38321))

(declare-fun d!38547 () Bool)

(assert (=> d!38547 (= (get!1454 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3123 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126518 d!38547))

(declare-fun d!38549 () Bool)

(declare-fun lt!65765 () Bool)

(assert (=> d!38549 (= lt!65765 (select (content!126 (toList!832 lt!65467)) (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!83038 () Bool)

(assert (=> d!38549 (= lt!65765 e!83038)))

(declare-fun res!61465 () Bool)

(assert (=> d!38549 (=> (not res!61465) (not e!83038))))

(assert (=> d!38549 (= res!61465 ((_ is Cons!1674) (toList!832 lt!65467)))))

(assert (=> d!38549 (= (contains!866 (toList!832 lt!65467) (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65765)))

(declare-fun b!127207 () Bool)

(declare-fun e!83039 () Bool)

(assert (=> b!127207 (= e!83038 e!83039)))

(declare-fun res!61464 () Bool)

(assert (=> b!127207 (=> res!61464 e!83039)))

(assert (=> b!127207 (= res!61464 (= (h!2276 (toList!832 lt!65467)) (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!127208 () Bool)

(assert (=> b!127208 (= e!83039 (contains!866 (t!6017 (toList!832 lt!65467)) (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38549 res!61465) b!127207))

(assert (= (and b!127207 (not res!61464)) b!127208))

(declare-fun m!148779 () Bool)

(assert (=> d!38549 m!148779))

(declare-fun m!148781 () Bool)

(assert (=> d!38549 m!148781))

(declare-fun m!148783 () Bool)

(assert (=> b!127208 m!148783))

(assert (=> b!126708 d!38549))

(declare-fun d!38551 () Bool)

(declare-fun lt!65766 () (_ BitVec 32))

(assert (=> d!38551 (and (bvsge lt!65766 #b00000000000000000000000000000000) (bvsle lt!65766 (bvsub (size!2480 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!83041 () (_ BitVec 32))

(assert (=> d!38551 (= lt!65766 e!83041)))

(declare-fun c!23331 () Bool)

(assert (=> d!38551 (= c!23331 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38551 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2480 (_keys!4515 newMap!16)) (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38551 (= (arrayCountValidKeys!0 (_keys!4515 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))) lt!65766)))

(declare-fun b!127209 () Bool)

(declare-fun e!83040 () (_ BitVec 32))

(declare-fun call!13690 () (_ BitVec 32))

(assert (=> b!127209 (= e!83040 (bvadd #b00000000000000000000000000000001 call!13690))))

(declare-fun bm!13687 () Bool)

(assert (=> bm!13687 (= call!13690 (arrayCountValidKeys!0 (_keys!4515 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127210 () Bool)

(assert (=> b!127210 (= e!83040 call!13690)))

(declare-fun b!127211 () Bool)

(assert (=> b!127211 (= e!83041 #b00000000000000000000000000000000)))

(declare-fun b!127212 () Bool)

(assert (=> b!127212 (= e!83041 e!83040)))

(declare-fun c!23330 () Bool)

(assert (=> b!127212 (= c!23330 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!38551 c!23331) b!127211))

(assert (= (and d!38551 (not c!23331)) b!127212))

(assert (= (and b!127212 c!23330) b!127209))

(assert (= (and b!127212 (not c!23330)) b!127210))

(assert (= (or b!127209 b!127210) bm!13687))

(declare-fun m!148785 () Bool)

(assert (=> bm!13687 m!148785))

(assert (=> b!127212 m!148287))

(assert (=> b!127212 m!148287))

(assert (=> b!127212 m!148289))

(assert (=> bm!13624 d!38551))

(declare-fun d!38553 () Bool)

(declare-fun e!83043 () Bool)

(assert (=> d!38553 e!83043))

(declare-fun res!61466 () Bool)

(assert (=> d!38553 (=> res!61466 e!83043)))

(declare-fun lt!65768 () Bool)

(assert (=> d!38553 (= res!61466 (not lt!65768))))

(declare-fun lt!65767 () Bool)

(assert (=> d!38553 (= lt!65768 lt!65767)))

(declare-fun lt!65770 () Unit!3928)

(declare-fun e!83042 () Unit!3928)

(assert (=> d!38553 (= lt!65770 e!83042)))

(declare-fun c!23332 () Bool)

(assert (=> d!38553 (= c!23332 lt!65767)))

(assert (=> d!38553 (= lt!65767 (containsKey!171 (toList!832 lt!65474) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38553 (= (contains!864 lt!65474 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65768)))

(declare-fun b!127213 () Bool)

(declare-fun lt!65769 () Unit!3928)

(assert (=> b!127213 (= e!83042 lt!65769)))

(assert (=> b!127213 (= lt!65769 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65474) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!127213 (isDefined!120 (getValueByKey!168 (toList!832 lt!65474) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127214 () Bool)

(declare-fun Unit!3966 () Unit!3928)

(assert (=> b!127214 (= e!83042 Unit!3966)))

(declare-fun b!127215 () Bool)

(assert (=> b!127215 (= e!83043 (isDefined!120 (getValueByKey!168 (toList!832 lt!65474) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38553 c!23332) b!127213))

(assert (= (and d!38553 (not c!23332)) b!127214))

(assert (= (and d!38553 (not res!61466)) b!127215))

(declare-fun m!148787 () Bool)

(assert (=> d!38553 m!148787))

(declare-fun m!148789 () Bool)

(assert (=> b!127213 m!148789))

(assert (=> b!127213 m!147849))

(assert (=> b!127213 m!147849))

(declare-fun m!148791 () Bool)

(assert (=> b!127213 m!148791))

(assert (=> b!127215 m!147849))

(assert (=> b!127215 m!147849))

(assert (=> b!127215 m!148791))

(assert (=> d!38233 d!38553))

(declare-fun b!127219 () Bool)

(declare-fun e!83045 () Option!174)

(assert (=> b!127219 (= e!83045 None!172)))

(declare-fun b!127216 () Bool)

(declare-fun e!83044 () Option!174)

(assert (=> b!127216 (= e!83044 (Some!173 (_2!1273 (h!2276 lt!65475))))))

(declare-fun b!127218 () Bool)

(assert (=> b!127218 (= e!83045 (getValueByKey!168 (t!6017 lt!65475) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun d!38555 () Bool)

(declare-fun c!23333 () Bool)

(assert (=> d!38555 (= c!23333 (and ((_ is Cons!1674) lt!65475) (= (_1!1273 (h!2276 lt!65475)) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38555 (= (getValueByKey!168 lt!65475 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!83044)))

(declare-fun b!127217 () Bool)

(assert (=> b!127217 (= e!83044 e!83045)))

(declare-fun c!23334 () Bool)

(assert (=> b!127217 (= c!23334 (and ((_ is Cons!1674) lt!65475) (not (= (_1!1273 (h!2276 lt!65475)) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38555 c!23333) b!127216))

(assert (= (and d!38555 (not c!23333)) b!127217))

(assert (= (and b!127217 c!23334) b!127218))

(assert (= (and b!127217 (not c!23334)) b!127219))

(declare-fun m!148793 () Bool)

(assert (=> b!127218 m!148793))

(assert (=> d!38233 d!38555))

(declare-fun d!38557 () Bool)

(assert (=> d!38557 (= (getValueByKey!168 lt!65475 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65771 () Unit!3928)

(assert (=> d!38557 (= lt!65771 (choose!776 lt!65475 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!83046 () Bool)

(assert (=> d!38557 e!83046))

(declare-fun res!61467 () Bool)

(assert (=> d!38557 (=> (not res!61467) (not e!83046))))

(assert (=> d!38557 (= res!61467 (isStrictlySorted!304 lt!65475))))

(assert (=> d!38557 (= (lemmaContainsTupThenGetReturnValue!83 lt!65475 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65771)))

(declare-fun b!127220 () Bool)

(declare-fun res!61468 () Bool)

(assert (=> b!127220 (=> (not res!61468) (not e!83046))))

(assert (=> b!127220 (= res!61468 (containsKey!171 lt!65475 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127221 () Bool)

(assert (=> b!127221 (= e!83046 (contains!866 lt!65475 (tuple2!2525 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38557 res!61467) b!127220))

(assert (= (and b!127220 res!61468) b!127221))

(assert (=> d!38557 m!147843))

(declare-fun m!148795 () Bool)

(assert (=> d!38557 m!148795))

(declare-fun m!148797 () Bool)

(assert (=> d!38557 m!148797))

(declare-fun m!148799 () Bool)

(assert (=> b!127220 m!148799))

(declare-fun m!148801 () Bool)

(assert (=> b!127221 m!148801))

(assert (=> d!38233 d!38557))

(declare-fun bm!13688 () Bool)

(declare-fun call!13692 () List!1678)

(declare-fun call!13693 () List!1678)

(assert (=> bm!13688 (= call!13692 call!13693)))

(declare-fun b!127222 () Bool)

(declare-fun e!83051 () List!1678)

(declare-fun call!13691 () List!1678)

(assert (=> b!127222 (= e!83051 call!13691)))

(declare-fun b!127223 () Bool)

(declare-fun e!83048 () List!1678)

(assert (=> b!127223 (= e!83048 (insertStrictlySorted!86 (t!6017 (toList!832 lt!65214)) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127224 () Bool)

(declare-fun e!83050 () List!1678)

(declare-fun e!83047 () List!1678)

(assert (=> b!127224 (= e!83050 e!83047)))

(declare-fun c!23337 () Bool)

(assert (=> b!127224 (= c!23337 (and ((_ is Cons!1674) (toList!832 lt!65214)) (= (_1!1273 (h!2276 (toList!832 lt!65214))) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun c!23338 () Bool)

(declare-fun b!127225 () Bool)

(assert (=> b!127225 (= e!83048 (ite c!23337 (t!6017 (toList!832 lt!65214)) (ite c!23338 (Cons!1674 (h!2276 (toList!832 lt!65214)) (t!6017 (toList!832 lt!65214))) Nil!1675)))))

(declare-fun b!127226 () Bool)

(assert (=> b!127226 (= e!83051 call!13691)))

(declare-fun b!127227 () Bool)

(assert (=> b!127227 (= e!83050 call!13693)))

(declare-fun c!23335 () Bool)

(declare-fun bm!13689 () Bool)

(assert (=> bm!13689 (= call!13693 ($colon$colon!88 e!83048 (ite c!23335 (h!2276 (toList!832 lt!65214)) (tuple2!2525 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23336 () Bool)

(assert (=> bm!13689 (= c!23336 c!23335)))

(declare-fun d!38559 () Bool)

(declare-fun e!83049 () Bool)

(assert (=> d!38559 e!83049))

(declare-fun res!61470 () Bool)

(assert (=> d!38559 (=> (not res!61470) (not e!83049))))

(declare-fun lt!65772 () List!1678)

(assert (=> d!38559 (= res!61470 (isStrictlySorted!304 lt!65772))))

(assert (=> d!38559 (= lt!65772 e!83050)))

(assert (=> d!38559 (= c!23335 (and ((_ is Cons!1674) (toList!832 lt!65214)) (bvslt (_1!1273 (h!2276 (toList!832 lt!65214))) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38559 (isStrictlySorted!304 (toList!832 lt!65214))))

(assert (=> d!38559 (= (insertStrictlySorted!86 (toList!832 lt!65214) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65772)))

(declare-fun b!127228 () Bool)

(assert (=> b!127228 (= c!23338 (and ((_ is Cons!1674) (toList!832 lt!65214)) (bvsgt (_1!1273 (h!2276 (toList!832 lt!65214))) (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!127228 (= e!83047 e!83051)))

(declare-fun b!127229 () Bool)

(assert (=> b!127229 (= e!83047 call!13692)))

(declare-fun b!127230 () Bool)

(declare-fun res!61469 () Bool)

(assert (=> b!127230 (=> (not res!61469) (not e!83049))))

(assert (=> b!127230 (= res!61469 (containsKey!171 lt!65772 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun bm!13690 () Bool)

(assert (=> bm!13690 (= call!13691 call!13692)))

(declare-fun b!127231 () Bool)

(assert (=> b!127231 (= e!83049 (contains!866 lt!65772 (tuple2!2525 (_1!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38559 c!23335) b!127227))

(assert (= (and d!38559 (not c!23335)) b!127224))

(assert (= (and b!127224 c!23337) b!127229))

(assert (= (and b!127224 (not c!23337)) b!127228))

(assert (= (and b!127228 c!23338) b!127222))

(assert (= (and b!127228 (not c!23338)) b!127226))

(assert (= (or b!127222 b!127226) bm!13690))

(assert (= (or b!127229 bm!13690) bm!13688))

(assert (= (or b!127227 bm!13688) bm!13689))

(assert (= (and bm!13689 c!23336) b!127223))

(assert (= (and bm!13689 (not c!23336)) b!127225))

(assert (= (and d!38559 res!61470) b!127230))

(assert (= (and b!127230 res!61469) b!127231))

(declare-fun m!148803 () Bool)

(assert (=> b!127231 m!148803))

(declare-fun m!148805 () Bool)

(assert (=> b!127223 m!148805))

(declare-fun m!148807 () Bool)

(assert (=> b!127230 m!148807))

(declare-fun m!148809 () Bool)

(assert (=> d!38559 m!148809))

(declare-fun m!148811 () Bool)

(assert (=> d!38559 m!148811))

(declare-fun m!148813 () Bool)

(assert (=> bm!13689 m!148813))

(assert (=> d!38233 d!38559))

(assert (=> d!38219 d!38379))

(declare-fun d!38561 () Bool)

(declare-fun e!83052 () Bool)

(assert (=> d!38561 e!83052))

(declare-fun res!61472 () Bool)

(assert (=> d!38561 (=> (not res!61472) (not e!83052))))

(declare-fun lt!65773 () ListLongMap!1633)

(assert (=> d!38561 (= res!61472 (contains!864 lt!65773 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65774 () List!1678)

(assert (=> d!38561 (= lt!65773 (ListLongMap!1634 lt!65774))))

(declare-fun lt!65776 () Unit!3928)

(declare-fun lt!65775 () Unit!3928)

(assert (=> d!38561 (= lt!65776 lt!65775)))

(assert (=> d!38561 (= (getValueByKey!168 lt!65774 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38561 (= lt!65775 (lemmaContainsTupThenGetReturnValue!83 lt!65774 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38561 (= lt!65774 (insertStrictlySorted!86 (toList!832 call!13643) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38561 (= (+!164 call!13643 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65773)))

(declare-fun b!127232 () Bool)

(declare-fun res!61471 () Bool)

(assert (=> b!127232 (=> (not res!61471) (not e!83052))))

(assert (=> b!127232 (= res!61471 (= (getValueByKey!168 (toList!832 lt!65773) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127233 () Bool)

(assert (=> b!127233 (= e!83052 (contains!866 (toList!832 lt!65773) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38561 res!61472) b!127232))

(assert (= (and b!127232 res!61471) b!127233))

(declare-fun m!148815 () Bool)

(assert (=> d!38561 m!148815))

(declare-fun m!148817 () Bool)

(assert (=> d!38561 m!148817))

(declare-fun m!148819 () Bool)

(assert (=> d!38561 m!148819))

(declare-fun m!148821 () Bool)

(assert (=> d!38561 m!148821))

(declare-fun m!148823 () Bool)

(assert (=> b!127232 m!148823))

(declare-fun m!148825 () Bool)

(assert (=> b!127233 m!148825))

(assert (=> b!126747 d!38561))

(declare-fun d!38563 () Bool)

(declare-fun e!83054 () Bool)

(assert (=> d!38563 e!83054))

(declare-fun res!61473 () Bool)

(assert (=> d!38563 (=> res!61473 e!83054)))

(declare-fun lt!65778 () Bool)

(assert (=> d!38563 (= res!61473 (not lt!65778))))

(declare-fun lt!65777 () Bool)

(assert (=> d!38563 (= lt!65778 lt!65777)))

(declare-fun lt!65780 () Unit!3928)

(declare-fun e!83053 () Unit!3928)

(assert (=> d!38563 (= lt!65780 e!83053)))

(declare-fun c!23339 () Bool)

(assert (=> d!38563 (= c!23339 lt!65777)))

(assert (=> d!38563 (= lt!65777 (containsKey!171 (toList!832 (+!164 lt!65506 (tuple2!2525 lt!65502 lt!65507))) lt!65503))))

(assert (=> d!38563 (= (contains!864 (+!164 lt!65506 (tuple2!2525 lt!65502 lt!65507)) lt!65503) lt!65778)))

(declare-fun b!127234 () Bool)

(declare-fun lt!65779 () Unit!3928)

(assert (=> b!127234 (= e!83053 lt!65779)))

(assert (=> b!127234 (= lt!65779 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (+!164 lt!65506 (tuple2!2525 lt!65502 lt!65507))) lt!65503))))

(assert (=> b!127234 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65506 (tuple2!2525 lt!65502 lt!65507))) lt!65503))))

(declare-fun b!127235 () Bool)

(declare-fun Unit!3967 () Unit!3928)

(assert (=> b!127235 (= e!83053 Unit!3967)))

(declare-fun b!127236 () Bool)

(assert (=> b!127236 (= e!83054 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65506 (tuple2!2525 lt!65502 lt!65507))) lt!65503)))))

(assert (= (and d!38563 c!23339) b!127234))

(assert (= (and d!38563 (not c!23339)) b!127235))

(assert (= (and d!38563 (not res!61473)) b!127236))

(declare-fun m!148827 () Bool)

(assert (=> d!38563 m!148827))

(declare-fun m!148829 () Bool)

(assert (=> b!127234 m!148829))

(declare-fun m!148831 () Bool)

(assert (=> b!127234 m!148831))

(assert (=> b!127234 m!148831))

(declare-fun m!148833 () Bool)

(assert (=> b!127234 m!148833))

(assert (=> b!127236 m!148831))

(assert (=> b!127236 m!148831))

(assert (=> b!127236 m!148833))

(assert (=> b!126747 d!38563))

(declare-fun d!38565 () Bool)

(assert (=> d!38565 (not (contains!864 (+!164 lt!65506 (tuple2!2525 lt!65502 lt!65507)) lt!65503))))

(declare-fun lt!65783 () Unit!3928)

(declare-fun choose!777 (ListLongMap!1633 (_ BitVec 64) V!3433 (_ BitVec 64)) Unit!3928)

(assert (=> d!38565 (= lt!65783 (choose!777 lt!65506 lt!65502 lt!65507 lt!65503))))

(declare-fun e!83057 () Bool)

(assert (=> d!38565 e!83057))

(declare-fun res!61476 () Bool)

(assert (=> d!38565 (=> (not res!61476) (not e!83057))))

(assert (=> d!38565 (= res!61476 (not (contains!864 lt!65506 lt!65503)))))

(assert (=> d!38565 (= (addStillNotContains!58 lt!65506 lt!65502 lt!65507 lt!65503) lt!65783)))

(declare-fun b!127240 () Bool)

(assert (=> b!127240 (= e!83057 (not (= lt!65502 lt!65503)))))

(assert (= (and d!38565 res!61476) b!127240))

(assert (=> d!38565 m!147889))

(assert (=> d!38565 m!147889))

(assert (=> d!38565 m!147893))

(declare-fun m!148835 () Bool)

(assert (=> d!38565 m!148835))

(declare-fun m!148837 () Bool)

(assert (=> d!38565 m!148837))

(assert (=> b!126747 d!38565))

(declare-fun d!38567 () Bool)

(declare-fun e!83058 () Bool)

(assert (=> d!38567 e!83058))

(declare-fun res!61478 () Bool)

(assert (=> d!38567 (=> (not res!61478) (not e!83058))))

(declare-fun lt!65784 () ListLongMap!1633)

(assert (=> d!38567 (= res!61478 (contains!864 lt!65784 (_1!1273 (tuple2!2525 lt!65502 lt!65507))))))

(declare-fun lt!65785 () List!1678)

(assert (=> d!38567 (= lt!65784 (ListLongMap!1634 lt!65785))))

(declare-fun lt!65787 () Unit!3928)

(declare-fun lt!65786 () Unit!3928)

(assert (=> d!38567 (= lt!65787 lt!65786)))

(assert (=> d!38567 (= (getValueByKey!168 lt!65785 (_1!1273 (tuple2!2525 lt!65502 lt!65507))) (Some!173 (_2!1273 (tuple2!2525 lt!65502 lt!65507))))))

(assert (=> d!38567 (= lt!65786 (lemmaContainsTupThenGetReturnValue!83 lt!65785 (_1!1273 (tuple2!2525 lt!65502 lt!65507)) (_2!1273 (tuple2!2525 lt!65502 lt!65507))))))

(assert (=> d!38567 (= lt!65785 (insertStrictlySorted!86 (toList!832 lt!65506) (_1!1273 (tuple2!2525 lt!65502 lt!65507)) (_2!1273 (tuple2!2525 lt!65502 lt!65507))))))

(assert (=> d!38567 (= (+!164 lt!65506 (tuple2!2525 lt!65502 lt!65507)) lt!65784)))

(declare-fun b!127241 () Bool)

(declare-fun res!61477 () Bool)

(assert (=> b!127241 (=> (not res!61477) (not e!83058))))

(assert (=> b!127241 (= res!61477 (= (getValueByKey!168 (toList!832 lt!65784) (_1!1273 (tuple2!2525 lt!65502 lt!65507))) (Some!173 (_2!1273 (tuple2!2525 lt!65502 lt!65507)))))))

(declare-fun b!127242 () Bool)

(assert (=> b!127242 (= e!83058 (contains!866 (toList!832 lt!65784) (tuple2!2525 lt!65502 lt!65507)))))

(assert (= (and d!38567 res!61478) b!127241))

(assert (= (and b!127241 res!61477) b!127242))

(declare-fun m!148839 () Bool)

(assert (=> d!38567 m!148839))

(declare-fun m!148841 () Bool)

(assert (=> d!38567 m!148841))

(declare-fun m!148843 () Bool)

(assert (=> d!38567 m!148843))

(declare-fun m!148845 () Bool)

(assert (=> d!38567 m!148845))

(declare-fun m!148847 () Bool)

(assert (=> b!127241 m!148847))

(declare-fun m!148849 () Bool)

(assert (=> b!127242 m!148849))

(assert (=> b!126747 d!38567))

(assert (=> b!126747 d!38173))

(declare-fun d!38569 () Bool)

(declare-fun res!61479 () Bool)

(declare-fun e!83059 () Bool)

(assert (=> d!38569 (=> res!61479 e!83059)))

(assert (=> d!38569 (= res!61479 (and ((_ is Cons!1674) (toList!832 lt!65225)) (= (_1!1273 (h!2276 (toList!832 lt!65225))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38569 (= (containsKey!171 (toList!832 lt!65225) #b1000000000000000000000000000000000000000000000000000000000000000) e!83059)))

(declare-fun b!127243 () Bool)

(declare-fun e!83060 () Bool)

(assert (=> b!127243 (= e!83059 e!83060)))

(declare-fun res!61480 () Bool)

(assert (=> b!127243 (=> (not res!61480) (not e!83060))))

(assert (=> b!127243 (= res!61480 (and (or (not ((_ is Cons!1674) (toList!832 lt!65225))) (bvsle (_1!1273 (h!2276 (toList!832 lt!65225))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1674) (toList!832 lt!65225)) (bvslt (_1!1273 (h!2276 (toList!832 lt!65225))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127244 () Bool)

(assert (=> b!127244 (= e!83060 (containsKey!171 (t!6017 (toList!832 lt!65225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38569 (not res!61479)) b!127243))

(assert (= (and b!127243 res!61480) b!127244))

(declare-fun m!148851 () Bool)

(assert (=> b!127244 m!148851))

(assert (=> d!38215 d!38569))

(declare-fun d!38571 () Bool)

(declare-fun e!83061 () Bool)

(assert (=> d!38571 e!83061))

(declare-fun res!61482 () Bool)

(assert (=> d!38571 (=> (not res!61482) (not e!83061))))

(declare-fun lt!65788 () ListLongMap!1633)

(assert (=> d!38571 (= res!61482 (contains!864 lt!65788 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65789 () List!1678)

(assert (=> d!38571 (= lt!65788 (ListLongMap!1634 lt!65789))))

(declare-fun lt!65791 () Unit!3928)

(declare-fun lt!65790 () Unit!3928)

(assert (=> d!38571 (= lt!65791 lt!65790)))

(assert (=> d!38571 (= (getValueByKey!168 lt!65789 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38571 (= lt!65790 (lemmaContainsTupThenGetReturnValue!83 lt!65789 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38571 (= lt!65789 (insertStrictlySorted!86 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38571 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65788)))

(declare-fun b!127245 () Bool)

(declare-fun res!61481 () Bool)

(assert (=> b!127245 (=> (not res!61481) (not e!83061))))

(assert (=> b!127245 (= res!61481 (= (getValueByKey!168 (toList!832 lt!65788) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127246 () Bool)

(assert (=> b!127246 (= e!83061 (contains!866 (toList!832 lt!65788) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38571 res!61482) b!127245))

(assert (= (and b!127245 res!61481) b!127246))

(declare-fun m!148853 () Bool)

(assert (=> d!38571 m!148853))

(declare-fun m!148855 () Bool)

(assert (=> d!38571 m!148855))

(declare-fun m!148857 () Bool)

(assert (=> d!38571 m!148857))

(declare-fun m!148859 () Bool)

(assert (=> d!38571 m!148859))

(declare-fun m!148861 () Bool)

(assert (=> b!127245 m!148861))

(declare-fun m!148863 () Bool)

(assert (=> b!127246 m!148863))

(assert (=> b!126766 d!38571))

(assert (=> b!126766 d!38183))

(declare-fun b!127247 () Bool)

(declare-fun e!83067 () Bool)

(declare-fun e!83074 () Bool)

(assert (=> b!127247 (= e!83067 e!83074)))

(declare-fun c!23345 () Bool)

(assert (=> b!127247 (= c!23345 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127248 () Bool)

(declare-fun e!83071 () ListLongMap!1633)

(declare-fun e!83072 () ListLongMap!1633)

(assert (=> b!127248 (= e!83071 e!83072)))

(declare-fun c!23341 () Bool)

(assert (=> b!127248 (= c!23341 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!13694 () ListLongMap!1633)

(declare-fun c!23344 () Bool)

(declare-fun call!13699 () ListLongMap!1633)

(declare-fun bm!13691 () Bool)

(declare-fun call!13697 () ListLongMap!1633)

(declare-fun call!13700 () ListLongMap!1633)

(assert (=> bm!13691 (= call!13699 (+!164 (ite c!23344 call!13694 (ite c!23341 call!13697 call!13700)) (ite (or c!23344 c!23341) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun bm!13692 () Bool)

(assert (=> bm!13692 (= call!13694 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13693 () Bool)

(declare-fun call!13698 () Bool)

(declare-fun lt!65806 () ListLongMap!1633)

(assert (=> bm!13693 (= call!13698 (contains!864 lt!65806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127249 () Bool)

(declare-fun e!83062 () Bool)

(declare-fun e!83066 () Bool)

(assert (=> b!127249 (= e!83062 e!83066)))

(declare-fun res!61487 () Bool)

(assert (=> b!127249 (=> (not res!61487) (not e!83066))))

(assert (=> b!127249 (= res!61487 (contains!864 lt!65806 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun bm!13694 () Bool)

(assert (=> bm!13694 (= call!13700 call!13697)))

(declare-fun b!127250 () Bool)

(declare-fun e!83069 () ListLongMap!1633)

(declare-fun call!13696 () ListLongMap!1633)

(assert (=> b!127250 (= e!83069 call!13696)))

(declare-fun b!127251 () Bool)

(declare-fun res!61483 () Bool)

(assert (=> b!127251 (=> (not res!61483) (not e!83067))))

(assert (=> b!127251 (= res!61483 e!83062)))

(declare-fun res!61484 () Bool)

(assert (=> b!127251 (=> res!61484 e!83062)))

(declare-fun e!83065 () Bool)

(assert (=> b!127251 (= res!61484 (not e!83065))))

(declare-fun res!61489 () Bool)

(assert (=> b!127251 (=> (not res!61489) (not e!83065))))

(assert (=> b!127251 (= res!61489 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127252 () Bool)

(declare-fun e!83068 () Bool)

(assert (=> b!127252 (= e!83068 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127253 () Bool)

(declare-fun e!83063 () Bool)

(assert (=> b!127253 (= e!83063 (= (apply!111 lt!65806 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127254 () Bool)

(declare-fun res!61490 () Bool)

(assert (=> b!127254 (=> (not res!61490) (not e!83067))))

(declare-fun e!83064 () Bool)

(assert (=> b!127254 (= res!61490 e!83064)))

(declare-fun c!23340 () Bool)

(assert (=> b!127254 (= c!23340 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13695 () Bool)

(assert (=> bm!13695 (= call!13696 call!13699)))

(declare-fun b!127255 () Bool)

(assert (=> b!127255 (= e!83072 call!13696)))

(declare-fun b!127256 () Bool)

(assert (=> b!127256 (= e!83069 call!13700)))

(declare-fun bm!13696 () Bool)

(assert (=> bm!13696 (= call!13697 call!13694)))

(declare-fun b!127257 () Bool)

(assert (=> b!127257 (= e!83074 e!83063)))

(declare-fun res!61486 () Bool)

(assert (=> b!127257 (= res!61486 call!13698)))

(assert (=> b!127257 (=> (not res!61486) (not e!83063))))

(declare-fun b!127258 () Bool)

(declare-fun c!23343 () Bool)

(assert (=> b!127258 (= c!23343 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127258 (= e!83072 e!83069)))

(declare-fun b!127259 () Bool)

(assert (=> b!127259 (= e!83074 (not call!13698))))

(declare-fun b!127260 () Bool)

(assert (=> b!127260 (= e!83066 (= (apply!111 lt!65806 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127260 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))))))

(assert (=> b!127260 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127261 () Bool)

(declare-fun call!13695 () Bool)

(assert (=> b!127261 (= e!83064 (not call!13695))))

(declare-fun bm!13697 () Bool)

(assert (=> bm!13697 (= call!13695 (contains!864 lt!65806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127262 () Bool)

(declare-fun e!83073 () Bool)

(assert (=> b!127262 (= e!83073 (= (apply!111 lt!65806 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127263 () Bool)

(declare-fun e!83070 () Unit!3928)

(declare-fun lt!65809 () Unit!3928)

(assert (=> b!127263 (= e!83070 lt!65809)))

(declare-fun lt!65794 () ListLongMap!1633)

(assert (=> b!127263 (= lt!65794 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65813 () (_ BitVec 64))

(assert (=> b!127263 (= lt!65813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65811 () (_ BitVec 64))

(assert (=> b!127263 (= lt!65811 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65796 () Unit!3928)

(assert (=> b!127263 (= lt!65796 (addStillContains!87 lt!65794 lt!65813 (zeroValue!2645 newMap!16) lt!65811))))

(assert (=> b!127263 (contains!864 (+!164 lt!65794 (tuple2!2525 lt!65813 (zeroValue!2645 newMap!16))) lt!65811)))

(declare-fun lt!65800 () Unit!3928)

(assert (=> b!127263 (= lt!65800 lt!65796)))

(declare-fun lt!65804 () ListLongMap!1633)

(assert (=> b!127263 (= lt!65804 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65797 () (_ BitVec 64))

(assert (=> b!127263 (= lt!65797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65807 () (_ BitVec 64))

(assert (=> b!127263 (= lt!65807 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65802 () Unit!3928)

(assert (=> b!127263 (= lt!65802 (addApplyDifferent!87 lt!65804 lt!65797 (minValue!2645 newMap!16) lt!65807))))

(assert (=> b!127263 (= (apply!111 (+!164 lt!65804 (tuple2!2525 lt!65797 (minValue!2645 newMap!16))) lt!65807) (apply!111 lt!65804 lt!65807))))

(declare-fun lt!65812 () Unit!3928)

(assert (=> b!127263 (= lt!65812 lt!65802)))

(declare-fun lt!65795 () ListLongMap!1633)

(assert (=> b!127263 (= lt!65795 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65803 () (_ BitVec 64))

(assert (=> b!127263 (= lt!65803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65793 () (_ BitVec 64))

(assert (=> b!127263 (= lt!65793 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65792 () Unit!3928)

(assert (=> b!127263 (= lt!65792 (addApplyDifferent!87 lt!65795 lt!65803 (zeroValue!2645 newMap!16) lt!65793))))

(assert (=> b!127263 (= (apply!111 (+!164 lt!65795 (tuple2!2525 lt!65803 (zeroValue!2645 newMap!16))) lt!65793) (apply!111 lt!65795 lt!65793))))

(declare-fun lt!65801 () Unit!3928)

(assert (=> b!127263 (= lt!65801 lt!65792)))

(declare-fun lt!65808 () ListLongMap!1633)

(assert (=> b!127263 (= lt!65808 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65799 () (_ BitVec 64))

(assert (=> b!127263 (= lt!65799 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65805 () (_ BitVec 64))

(assert (=> b!127263 (= lt!65805 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127263 (= lt!65809 (addApplyDifferent!87 lt!65808 lt!65799 (minValue!2645 newMap!16) lt!65805))))

(assert (=> b!127263 (= (apply!111 (+!164 lt!65808 (tuple2!2525 lt!65799 (minValue!2645 newMap!16))) lt!65805) (apply!111 lt!65808 lt!65805))))

(declare-fun b!127264 () Bool)

(declare-fun Unit!3968 () Unit!3928)

(assert (=> b!127264 (= e!83070 Unit!3968)))

(declare-fun d!38573 () Bool)

(assert (=> d!38573 e!83067))

(declare-fun res!61491 () Bool)

(assert (=> d!38573 (=> (not res!61491) (not e!83067))))

(assert (=> d!38573 (= res!61491 (or (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun lt!65798 () ListLongMap!1633)

(assert (=> d!38573 (= lt!65806 lt!65798)))

(declare-fun lt!65810 () Unit!3928)

(assert (=> d!38573 (= lt!65810 e!83070)))

(declare-fun c!23342 () Bool)

(assert (=> d!38573 (= c!23342 e!83068)))

(declare-fun res!61488 () Bool)

(assert (=> d!38573 (=> (not res!61488) (not e!83068))))

(assert (=> d!38573 (= res!61488 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38573 (= lt!65798 e!83071)))

(assert (=> d!38573 (= c!23344 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38573 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38573 (= (getCurrentListMap!512 (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65806)))

(declare-fun b!127265 () Bool)

(assert (=> b!127265 (= e!83065 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127266 () Bool)

(assert (=> b!127266 (= e!83071 (+!164 call!13699 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun b!127267 () Bool)

(assert (=> b!127267 (= e!83064 e!83073)))

(declare-fun res!61485 () Bool)

(assert (=> b!127267 (= res!61485 call!13695)))

(assert (=> b!127267 (=> (not res!61485) (not e!83073))))

(assert (= (and d!38573 c!23344) b!127266))

(assert (= (and d!38573 (not c!23344)) b!127248))

(assert (= (and b!127248 c!23341) b!127255))

(assert (= (and b!127248 (not c!23341)) b!127258))

(assert (= (and b!127258 c!23343) b!127250))

(assert (= (and b!127258 (not c!23343)) b!127256))

(assert (= (or b!127250 b!127256) bm!13694))

(assert (= (or b!127255 bm!13694) bm!13696))

(assert (= (or b!127255 b!127250) bm!13695))

(assert (= (or b!127266 bm!13696) bm!13692))

(assert (= (or b!127266 bm!13695) bm!13691))

(assert (= (and d!38573 res!61488) b!127252))

(assert (= (and d!38573 c!23342) b!127263))

(assert (= (and d!38573 (not c!23342)) b!127264))

(assert (= (and d!38573 res!61491) b!127251))

(assert (= (and b!127251 res!61489) b!127265))

(assert (= (and b!127251 (not res!61484)) b!127249))

(assert (= (and b!127249 res!61487) b!127260))

(assert (= (and b!127251 res!61483) b!127254))

(assert (= (and b!127254 c!23340) b!127267))

(assert (= (and b!127254 (not c!23340)) b!127261))

(assert (= (and b!127267 res!61485) b!127262))

(assert (= (or b!127267 b!127261) bm!13697))

(assert (= (and b!127254 res!61490) b!127247))

(assert (= (and b!127247 c!23345) b!127257))

(assert (= (and b!127247 (not c!23345)) b!127259))

(assert (= (and b!127257 res!61486) b!127253))

(assert (= (or b!127257 b!127259) bm!13693))

(declare-fun b_lambda!5617 () Bool)

(assert (=> (not b_lambda!5617) (not b!127260)))

(assert (=> b!127260 t!6029))

(declare-fun b_and!7845 () Bool)

(assert (= b_and!7841 (and (=> t!6029 result!3843) b_and!7845)))

(assert (=> b!127260 t!6031))

(declare-fun b_and!7847 () Bool)

(assert (= b_and!7843 (and (=> t!6031 result!3845) b_and!7847)))

(assert (=> b!127265 m!147525))

(assert (=> b!127265 m!147525))

(assert (=> b!127265 m!147527))

(declare-fun m!148865 () Bool)

(assert (=> b!127263 m!148865))

(declare-fun m!148867 () Bool)

(assert (=> b!127263 m!148867))

(declare-fun m!148869 () Bool)

(assert (=> b!127263 m!148869))

(declare-fun m!148871 () Bool)

(assert (=> b!127263 m!148871))

(declare-fun m!148873 () Bool)

(assert (=> b!127263 m!148873))

(assert (=> b!127263 m!148871))

(declare-fun m!148875 () Bool)

(assert (=> b!127263 m!148875))

(declare-fun m!148877 () Bool)

(assert (=> b!127263 m!148877))

(declare-fun m!148879 () Bool)

(assert (=> b!127263 m!148879))

(declare-fun m!148881 () Bool)

(assert (=> b!127263 m!148881))

(assert (=> b!127263 m!148867))

(declare-fun m!148883 () Bool)

(assert (=> b!127263 m!148883))

(declare-fun m!148885 () Bool)

(assert (=> b!127263 m!148885))

(declare-fun m!148887 () Bool)

(assert (=> b!127263 m!148887))

(declare-fun m!148889 () Bool)

(assert (=> b!127263 m!148889))

(declare-fun m!148891 () Bool)

(assert (=> b!127263 m!148891))

(declare-fun m!148893 () Bool)

(assert (=> b!127263 m!148893))

(assert (=> b!127263 m!147525))

(assert (=> b!127263 m!148875))

(assert (=> b!127263 m!148887))

(declare-fun m!148895 () Bool)

(assert (=> b!127263 m!148895))

(declare-fun m!148897 () Bool)

(assert (=> bm!13697 m!148897))

(declare-fun m!148899 () Bool)

(assert (=> bm!13691 m!148899))

(assert (=> bm!13692 m!148893))

(declare-fun m!148901 () Bool)

(assert (=> b!127253 m!148901))

(assert (=> b!127252 m!147525))

(assert (=> b!127252 m!147525))

(assert (=> b!127252 m!147527))

(assert (=> b!127249 m!147525))

(assert (=> b!127249 m!147525))

(declare-fun m!148903 () Bool)

(assert (=> b!127249 m!148903))

(assert (=> b!127260 m!147569))

(assert (=> b!127260 m!147525))

(declare-fun m!148905 () Bool)

(assert (=> b!127260 m!148905))

(assert (=> b!127260 m!147525))

(declare-fun m!148907 () Bool)

(assert (=> b!127260 m!148907))

(assert (=> b!127260 m!148907))

(assert (=> b!127260 m!147569))

(declare-fun m!148909 () Bool)

(assert (=> b!127260 m!148909))

(declare-fun m!148911 () Bool)

(assert (=> bm!13693 m!148911))

(declare-fun m!148913 () Bool)

(assert (=> b!127266 m!148913))

(declare-fun m!148915 () Bool)

(assert (=> b!127262 m!148915))

(assert (=> d!38573 m!147517))

(assert (=> b!126766 d!38573))

(declare-fun d!38575 () Bool)

(assert (=> d!38575 (= (apply!111 lt!65356 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!168 (toList!832 lt!65356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5287 () Bool)

(assert (= bs!5287 d!38575))

(assert (=> bs!5287 m!148299))

(assert (=> bs!5287 m!148299))

(declare-fun m!148917 () Bool)

(assert (=> bs!5287 m!148917))

(assert (=> b!126503 d!38575))

(declare-fun d!38577 () Bool)

(assert (=> d!38577 (= (inRange!0 (ite c!23136 (index!3211 lt!65375) (index!3214 lt!65375)) (mask!7038 newMap!16)) (and (bvsge (ite c!23136 (index!3211 lt!65375) (index!3214 lt!65375)) #b00000000000000000000000000000000) (bvslt (ite c!23136 (index!3211 lt!65375) (index!3214 lt!65375)) (bvadd (mask!7038 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13614 d!38577))

(declare-fun d!38579 () Bool)

(assert (=> d!38579 (= (inRange!0 (ite c!23120 (index!3212 lt!65299) (ite c!23121 (index!3211 lt!65295) (index!3214 lt!65295))) (mask!7038 newMap!16)) (and (bvsge (ite c!23120 (index!3212 lt!65299) (ite c!23121 (index!3211 lt!65295) (index!3214 lt!65295))) #b00000000000000000000000000000000) (bvslt (ite c!23120 (index!3212 lt!65299) (ite c!23121 (index!3211 lt!65295) (index!3214 lt!65295))) (bvadd (mask!7038 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13598 d!38579))

(declare-fun d!38581 () Bool)

(declare-fun e!83075 () Bool)

(assert (=> d!38581 e!83075))

(declare-fun res!61493 () Bool)

(assert (=> d!38581 (=> (not res!61493) (not e!83075))))

(declare-fun lt!65814 () ListLongMap!1633)

(assert (=> d!38581 (= res!61493 (contains!864 lt!65814 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(declare-fun lt!65815 () List!1678)

(assert (=> d!38581 (= lt!65814 (ListLongMap!1634 lt!65815))))

(declare-fun lt!65817 () Unit!3928)

(declare-fun lt!65816 () Unit!3928)

(assert (=> d!38581 (= lt!65817 lt!65816)))

(assert (=> d!38581 (= (getValueByKey!168 lt!65815 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38581 (= lt!65816 (lemmaContainsTupThenGetReturnValue!83 lt!65815 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38581 (= lt!65815 (insertStrictlySorted!86 (toList!832 call!13639) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))))))

(assert (=> d!38581 (= (+!164 call!13639 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))) lt!65814)))

(declare-fun b!127268 () Bool)

(declare-fun res!61492 () Bool)

(assert (=> b!127268 (=> (not res!61492) (not e!83075))))

(assert (=> b!127268 (= res!61492 (= (getValueByKey!168 (toList!832 lt!65814) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))))

(declare-fun b!127269 () Bool)

(assert (=> b!127269 (= e!83075 (contains!866 (toList!832 lt!65814) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23087 (ite c!23084 (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2645 newMap!16)))))))

(assert (= (and d!38581 res!61493) b!127268))

(assert (= (and b!127268 res!61492) b!127269))

(declare-fun m!148919 () Bool)

(assert (=> d!38581 m!148919))

(declare-fun m!148921 () Bool)

(assert (=> d!38581 m!148921))

(declare-fun m!148923 () Bool)

(assert (=> d!38581 m!148923))

(declare-fun m!148925 () Bool)

(assert (=> d!38581 m!148925))

(declare-fun m!148927 () Bool)

(assert (=> b!127268 m!148927))

(declare-fun m!148929 () Bool)

(assert (=> b!127269 m!148929))

(assert (=> b!126690 d!38581))

(declare-fun d!38583 () Bool)

(declare-fun e!83077 () Bool)

(assert (=> d!38583 e!83077))

(declare-fun res!61494 () Bool)

(assert (=> d!38583 (=> res!61494 e!83077)))

(declare-fun lt!65819 () Bool)

(assert (=> d!38583 (= res!61494 (not lt!65819))))

(declare-fun lt!65818 () Bool)

(assert (=> d!38583 (= lt!65819 lt!65818)))

(declare-fun lt!65821 () Unit!3928)

(declare-fun e!83076 () Unit!3928)

(assert (=> d!38583 (= lt!65821 e!83076)))

(declare-fun c!23346 () Bool)

(assert (=> d!38583 (= c!23346 lt!65818)))

(assert (=> d!38583 (= lt!65818 (containsKey!171 (toList!832 lt!65455) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38583 (= (contains!864 lt!65455 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) lt!65819)))

(declare-fun b!127270 () Bool)

(declare-fun lt!65820 () Unit!3928)

(assert (=> b!127270 (= e!83076 lt!65820)))

(assert (=> b!127270 (= lt!65820 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65455) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127270 (isDefined!120 (getValueByKey!168 (toList!832 lt!65455) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127271 () Bool)

(declare-fun Unit!3969 () Unit!3928)

(assert (=> b!127271 (= e!83076 Unit!3969)))

(declare-fun b!127272 () Bool)

(assert (=> b!127272 (= e!83077 (isDefined!120 (getValueByKey!168 (toList!832 lt!65455) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38583 c!23346) b!127270))

(assert (= (and d!38583 (not c!23346)) b!127271))

(assert (= (and d!38583 (not res!61494)) b!127272))

(assert (=> d!38583 m!147525))

(declare-fun m!148931 () Bool)

(assert (=> d!38583 m!148931))

(assert (=> b!127270 m!147525))

(declare-fun m!148933 () Bool)

(assert (=> b!127270 m!148933))

(assert (=> b!127270 m!147525))

(assert (=> b!127270 m!148743))

(assert (=> b!127270 m!148743))

(declare-fun m!148935 () Bool)

(assert (=> b!127270 m!148935))

(assert (=> b!127272 m!147525))

(assert (=> b!127272 m!148743))

(assert (=> b!127272 m!148743))

(assert (=> b!127272 m!148935))

(assert (=> b!126673 d!38583))

(declare-fun d!38585 () Bool)

(declare-fun e!83079 () Bool)

(assert (=> d!38585 e!83079))

(declare-fun res!61495 () Bool)

(assert (=> d!38585 (=> res!61495 e!83079)))

(declare-fun lt!65823 () Bool)

(assert (=> d!38585 (= res!61495 (not lt!65823))))

(declare-fun lt!65822 () Bool)

(assert (=> d!38585 (= lt!65823 lt!65822)))

(declare-fun lt!65825 () Unit!3928)

(declare-fun e!83078 () Unit!3928)

(assert (=> d!38585 (= lt!65825 e!83078)))

(declare-fun c!23347 () Bool)

(assert (=> d!38585 (= c!23347 lt!65822)))

(assert (=> d!38585 (= lt!65822 (containsKey!171 (toList!832 lt!65508) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38585 (= (contains!864 lt!65508 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65823)))

(declare-fun b!127273 () Bool)

(declare-fun lt!65824 () Unit!3928)

(assert (=> b!127273 (= e!83078 lt!65824)))

(assert (=> b!127273 (= lt!65824 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65508) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!127273 (isDefined!120 (getValueByKey!168 (toList!832 lt!65508) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127274 () Bool)

(declare-fun Unit!3970 () Unit!3928)

(assert (=> b!127274 (= e!83078 Unit!3970)))

(declare-fun b!127275 () Bool)

(assert (=> b!127275 (= e!83079 (isDefined!120 (getValueByKey!168 (toList!832 lt!65508) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38585 c!23347) b!127273))

(assert (= (and d!38585 (not c!23347)) b!127274))

(assert (= (and d!38585 (not res!61495)) b!127275))

(declare-fun m!148937 () Bool)

(assert (=> d!38585 m!148937))

(declare-fun m!148939 () Bool)

(assert (=> b!127273 m!148939))

(assert (=> b!127273 m!147917))

(assert (=> b!127273 m!147917))

(declare-fun m!148941 () Bool)

(assert (=> b!127273 m!148941))

(assert (=> b!127275 m!147917))

(assert (=> b!127275 m!147917))

(assert (=> b!127275 m!148941))

(assert (=> d!38251 d!38585))

(declare-fun b!127279 () Bool)

(declare-fun e!83081 () Option!174)

(assert (=> b!127279 (= e!83081 None!172)))

(declare-fun b!127276 () Bool)

(declare-fun e!83080 () Option!174)

(assert (=> b!127276 (= e!83080 (Some!173 (_2!1273 (h!2276 lt!65509))))))

(declare-fun b!127278 () Bool)

(assert (=> b!127278 (= e!83081 (getValueByKey!168 (t!6017 lt!65509) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun c!23348 () Bool)

(declare-fun d!38587 () Bool)

(assert (=> d!38587 (= c!23348 (and ((_ is Cons!1674) lt!65509) (= (_1!1273 (h!2276 lt!65509)) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38587 (= (getValueByKey!168 lt!65509 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!83080)))

(declare-fun b!127277 () Bool)

(assert (=> b!127277 (= e!83080 e!83081)))

(declare-fun c!23349 () Bool)

(assert (=> b!127277 (= c!23349 (and ((_ is Cons!1674) lt!65509) (not (= (_1!1273 (h!2276 lt!65509)) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38587 c!23348) b!127276))

(assert (= (and d!38587 (not c!23348)) b!127277))

(assert (= (and b!127277 c!23349) b!127278))

(assert (= (and b!127277 (not c!23349)) b!127279))

(declare-fun m!148943 () Bool)

(assert (=> b!127278 m!148943))

(assert (=> d!38251 d!38587))

(declare-fun d!38589 () Bool)

(assert (=> d!38589 (= (getValueByKey!168 lt!65509 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65826 () Unit!3928)

(assert (=> d!38589 (= lt!65826 (choose!776 lt!65509 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!83082 () Bool)

(assert (=> d!38589 e!83082))

(declare-fun res!61496 () Bool)

(assert (=> d!38589 (=> (not res!61496) (not e!83082))))

(assert (=> d!38589 (= res!61496 (isStrictlySorted!304 lt!65509))))

(assert (=> d!38589 (= (lemmaContainsTupThenGetReturnValue!83 lt!65509 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65826)))

(declare-fun b!127280 () Bool)

(declare-fun res!61497 () Bool)

(assert (=> b!127280 (=> (not res!61497) (not e!83082))))

(assert (=> b!127280 (= res!61497 (containsKey!171 lt!65509 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127281 () Bool)

(assert (=> b!127281 (= e!83082 (contains!866 lt!65509 (tuple2!2525 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38589 res!61496) b!127280))

(assert (= (and b!127280 res!61497) b!127281))

(assert (=> d!38589 m!147911))

(declare-fun m!148945 () Bool)

(assert (=> d!38589 m!148945))

(declare-fun m!148947 () Bool)

(assert (=> d!38589 m!148947))

(declare-fun m!148949 () Bool)

(assert (=> b!127280 m!148949))

(declare-fun m!148951 () Bool)

(assert (=> b!127281 m!148951))

(assert (=> d!38251 d!38589))

(declare-fun bm!13698 () Bool)

(declare-fun call!13702 () List!1678)

(declare-fun call!13703 () List!1678)

(assert (=> bm!13698 (= call!13702 call!13703)))

(declare-fun b!127282 () Bool)

(declare-fun e!83087 () List!1678)

(declare-fun call!13701 () List!1678)

(assert (=> b!127282 (= e!83087 call!13701)))

(declare-fun e!83084 () List!1678)

(declare-fun b!127283 () Bool)

(assert (=> b!127283 (= e!83084 (insertStrictlySorted!86 (t!6017 (toList!832 lt!65227)) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127284 () Bool)

(declare-fun e!83086 () List!1678)

(declare-fun e!83083 () List!1678)

(assert (=> b!127284 (= e!83086 e!83083)))

(declare-fun c!23352 () Bool)

(assert (=> b!127284 (= c!23352 (and ((_ is Cons!1674) (toList!832 lt!65227)) (= (_1!1273 (h!2276 (toList!832 lt!65227))) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun c!23353 () Bool)

(declare-fun b!127285 () Bool)

(assert (=> b!127285 (= e!83084 (ite c!23352 (t!6017 (toList!832 lt!65227)) (ite c!23353 (Cons!1674 (h!2276 (toList!832 lt!65227)) (t!6017 (toList!832 lt!65227))) Nil!1675)))))

(declare-fun b!127286 () Bool)

(assert (=> b!127286 (= e!83087 call!13701)))

(declare-fun b!127287 () Bool)

(assert (=> b!127287 (= e!83086 call!13703)))

(declare-fun c!23350 () Bool)

(declare-fun bm!13699 () Bool)

(assert (=> bm!13699 (= call!13703 ($colon$colon!88 e!83084 (ite c!23350 (h!2276 (toList!832 lt!65227)) (tuple2!2525 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23351 () Bool)

(assert (=> bm!13699 (= c!23351 c!23350)))

(declare-fun d!38591 () Bool)

(declare-fun e!83085 () Bool)

(assert (=> d!38591 e!83085))

(declare-fun res!61499 () Bool)

(assert (=> d!38591 (=> (not res!61499) (not e!83085))))

(declare-fun lt!65827 () List!1678)

(assert (=> d!38591 (= res!61499 (isStrictlySorted!304 lt!65827))))

(assert (=> d!38591 (= lt!65827 e!83086)))

(assert (=> d!38591 (= c!23350 (and ((_ is Cons!1674) (toList!832 lt!65227)) (bvslt (_1!1273 (h!2276 (toList!832 lt!65227))) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38591 (isStrictlySorted!304 (toList!832 lt!65227))))

(assert (=> d!38591 (= (insertStrictlySorted!86 (toList!832 lt!65227) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65827)))

(declare-fun b!127288 () Bool)

(assert (=> b!127288 (= c!23353 (and ((_ is Cons!1674) (toList!832 lt!65227)) (bvsgt (_1!1273 (h!2276 (toList!832 lt!65227))) (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!127288 (= e!83083 e!83087)))

(declare-fun b!127289 () Bool)

(assert (=> b!127289 (= e!83083 call!13702)))

(declare-fun b!127290 () Bool)

(declare-fun res!61498 () Bool)

(assert (=> b!127290 (=> (not res!61498) (not e!83085))))

(assert (=> b!127290 (= res!61498 (containsKey!171 lt!65827 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun bm!13700 () Bool)

(assert (=> bm!13700 (= call!13701 call!13702)))

(declare-fun b!127291 () Bool)

(assert (=> b!127291 (= e!83085 (contains!866 lt!65827 (tuple2!2525 (_1!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65218 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38591 c!23350) b!127287))

(assert (= (and d!38591 (not c!23350)) b!127284))

(assert (= (and b!127284 c!23352) b!127289))

(assert (= (and b!127284 (not c!23352)) b!127288))

(assert (= (and b!127288 c!23353) b!127282))

(assert (= (and b!127288 (not c!23353)) b!127286))

(assert (= (or b!127282 b!127286) bm!13700))

(assert (= (or b!127289 bm!13700) bm!13698))

(assert (= (or b!127287 bm!13698) bm!13699))

(assert (= (and bm!13699 c!23351) b!127283))

(assert (= (and bm!13699 (not c!23351)) b!127285))

(assert (= (and d!38591 res!61499) b!127290))

(assert (= (and b!127290 res!61498) b!127291))

(declare-fun m!148953 () Bool)

(assert (=> b!127291 m!148953))

(declare-fun m!148955 () Bool)

(assert (=> b!127283 m!148955))

(declare-fun m!148957 () Bool)

(assert (=> b!127290 m!148957))

(declare-fun m!148959 () Bool)

(assert (=> d!38591 m!148959))

(declare-fun m!148961 () Bool)

(assert (=> d!38591 m!148961))

(declare-fun m!148963 () Bool)

(assert (=> bm!13699 m!148963))

(assert (=> d!38251 d!38591))

(declare-fun d!38593 () Bool)

(assert (=> d!38593 (= (apply!111 lt!65455 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!168 (toList!832 lt!65455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5288 () Bool)

(assert (= bs!5288 d!38593))

(declare-fun m!148965 () Bool)

(assert (=> bs!5288 m!148965))

(assert (=> bs!5288 m!148965))

(declare-fun m!148967 () Bool)

(assert (=> bs!5288 m!148967))

(assert (=> b!126686 d!38593))

(assert (=> b!126769 d!38387))

(assert (=> b!126769 d!38389))

(declare-fun d!38595 () Bool)

(assert (=> d!38595 (= (isDefined!120 (getValueByKey!168 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))) (not (isEmpty!402 (getValueByKey!168 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))))

(declare-fun bs!5289 () Bool)

(assert (= bs!5289 d!38595))

(assert (=> bs!5289 m!147963))

(declare-fun m!148969 () Bool)

(assert (=> bs!5289 m!148969))

(assert (=> b!126772 d!38595))

(declare-fun b!127295 () Bool)

(declare-fun e!83089 () Option!174)

(assert (=> b!127295 (= e!83089 None!172)))

(declare-fun b!127292 () Bool)

(declare-fun e!83088 () Option!174)

(assert (=> b!127292 (= e!83088 (Some!173 (_2!1273 (h!2276 (toList!832 e!82525)))))))

(declare-fun b!127294 () Bool)

(assert (=> b!127294 (= e!83089 (getValueByKey!168 (t!6017 (toList!832 e!82525)) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(declare-fun d!38597 () Bool)

(declare-fun c!23354 () Bool)

(assert (=> d!38597 (= c!23354 (and ((_ is Cons!1674) (toList!832 e!82525)) (= (_1!1273 (h!2276 (toList!832 e!82525))) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160))))))))

(assert (=> d!38597 (= (getValueByKey!168 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))) e!83088)))

(declare-fun b!127293 () Bool)

(assert (=> b!127293 (= e!83088 e!83089)))

(declare-fun c!23355 () Bool)

(assert (=> b!127293 (= c!23355 (and ((_ is Cons!1674) (toList!832 e!82525)) (not (= (_1!1273 (h!2276 (toList!832 e!82525))) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))))

(assert (= (and d!38597 c!23354) b!127292))

(assert (= (and d!38597 (not c!23354)) b!127293))

(assert (= (and b!127293 c!23355) b!127294))

(assert (= (and b!127293 (not c!23355)) b!127295))

(declare-fun m!148971 () Bool)

(assert (=> b!127294 m!148971))

(assert (=> b!126772 d!38597))

(declare-fun b!127296 () Bool)

(declare-fun e!83091 () Bool)

(declare-fun e!83090 () Bool)

(assert (=> b!127296 (= e!83091 e!83090)))

(declare-fun lt!65830 () (_ BitVec 64))

(assert (=> b!127296 (= lt!65830 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000))))

(declare-fun lt!65829 () Unit!3928)

(assert (=> b!127296 (= lt!65829 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4515 (_2!1274 lt!65152)) lt!65830 #b00000000000000000000000000000000))))

(assert (=> b!127296 (arrayContainsKey!0 (_keys!4515 (_2!1274 lt!65152)) lt!65830 #b00000000000000000000000000000000)))

(declare-fun lt!65828 () Unit!3928)

(assert (=> b!127296 (= lt!65828 lt!65829)))

(declare-fun res!61501 () Bool)

(assert (=> b!127296 (= res!61501 (= (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000) (_keys!4515 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152))) (Found!264 #b00000000000000000000000000000000)))))

(assert (=> b!127296 (=> (not res!61501) (not e!83090))))

(declare-fun bm!13701 () Bool)

(declare-fun call!13704 () Bool)

(assert (=> bm!13701 (= call!13704 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4515 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152))))))

(declare-fun b!127297 () Bool)

(assert (=> b!127297 (= e!83090 call!13704)))

(declare-fun b!127298 () Bool)

(declare-fun e!83092 () Bool)

(assert (=> b!127298 (= e!83092 e!83091)))

(declare-fun c!23356 () Bool)

(assert (=> b!127298 (= c!23356 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(declare-fun d!38599 () Bool)

(declare-fun res!61500 () Bool)

(assert (=> d!38599 (=> res!61500 e!83092)))

(assert (=> d!38599 (= res!61500 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(assert (=> d!38599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4515 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152))) e!83092)))

(declare-fun b!127299 () Bool)

(assert (=> b!127299 (= e!83091 call!13704)))

(assert (= (and d!38599 (not res!61500)) b!127298))

(assert (= (and b!127298 c!23356) b!127296))

(assert (= (and b!127298 (not c!23356)) b!127299))

(assert (= (and b!127296 res!61501) b!127297))

(assert (= (or b!127297 b!127299) bm!13701))

(assert (=> b!127296 m!148555))

(declare-fun m!148973 () Bool)

(assert (=> b!127296 m!148973))

(declare-fun m!148975 () Bool)

(assert (=> b!127296 m!148975))

(assert (=> b!127296 m!148555))

(declare-fun m!148977 () Bool)

(assert (=> b!127296 m!148977))

(declare-fun m!148979 () Bool)

(assert (=> bm!13701 m!148979))

(assert (=> b!127298 m!148555))

(assert (=> b!127298 m!148555))

(assert (=> b!127298 m!148557))

(assert (=> b!126521 d!38599))

(declare-fun b!127301 () Bool)

(declare-fun res!61505 () Bool)

(declare-fun e!83093 () Bool)

(assert (=> b!127301 (=> (not res!61505) (not e!83093))))

(assert (=> b!127301 (= res!61505 (bvsge (size!2486 (v!3124 (underlying!439 thiss!992))) (_size!579 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun d!38601 () Bool)

(declare-fun res!61504 () Bool)

(assert (=> d!38601 (=> (not res!61504) (not e!83093))))

(assert (=> d!38601 (= res!61504 (validMask!0 (mask!7038 (v!3124 (underlying!439 thiss!992)))))))

(assert (=> d!38601 (= (simpleValid!87 (v!3124 (underlying!439 thiss!992))) e!83093)))

(declare-fun b!127300 () Bool)

(declare-fun res!61503 () Bool)

(assert (=> b!127300 (=> (not res!61503) (not e!83093))))

(assert (=> b!127300 (= res!61503 (and (= (size!2481 (_values!2765 (v!3124 (underlying!439 thiss!992)))) (bvadd (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001)) (= (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (size!2481 (_values!2765 (v!3124 (underlying!439 thiss!992))))) (bvsge (_size!579 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!579 (v!3124 (underlying!439 thiss!992))) (bvadd (mask!7038 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!127302 () Bool)

(declare-fun res!61502 () Bool)

(assert (=> b!127302 (=> (not res!61502) (not e!83093))))

(assert (=> b!127302 (= res!61502 (= (size!2486 (v!3124 (underlying!439 thiss!992))) (bvadd (_size!579 (v!3124 (underlying!439 thiss!992))) (bvsdiv (bvadd (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!127303 () Bool)

(assert (=> b!127303 (= e!83093 (and (bvsge (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2563 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!579 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!38601 res!61504) b!127300))

(assert (= (and b!127300 res!61503) b!127301))

(assert (= (and b!127301 res!61505) b!127302))

(assert (= (and b!127302 res!61502) b!127303))

(declare-fun m!148981 () Bool)

(assert (=> b!127301 m!148981))

(assert (=> d!38601 m!147201))

(assert (=> b!127302 m!148981))

(assert (=> d!38201 d!38601))

(assert (=> b!126564 d!38381))

(declare-fun d!38603 () Bool)

(declare-fun e!83095 () Bool)

(assert (=> d!38603 e!83095))

(declare-fun res!61506 () Bool)

(assert (=> d!38603 (=> res!61506 e!83095)))

(declare-fun lt!65832 () Bool)

(assert (=> d!38603 (= res!61506 (not lt!65832))))

(declare-fun lt!65831 () Bool)

(assert (=> d!38603 (= lt!65832 lt!65831)))

(declare-fun lt!65834 () Unit!3928)

(declare-fun e!83094 () Unit!3928)

(assert (=> d!38603 (= lt!65834 e!83094)))

(declare-fun c!23357 () Bool)

(assert (=> d!38603 (= c!23357 lt!65831)))

(assert (=> d!38603 (= lt!65831 (containsKey!171 (toList!832 lt!65501) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38603 (= (contains!864 lt!65501 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!65832)))

(declare-fun b!127304 () Bool)

(declare-fun lt!65833 () Unit!3928)

(assert (=> b!127304 (= e!83094 lt!65833)))

(assert (=> b!127304 (= lt!65833 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65501) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!127304 (isDefined!120 (getValueByKey!168 (toList!832 lt!65501) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!127305 () Bool)

(declare-fun Unit!3971 () Unit!3928)

(assert (=> b!127305 (= e!83094 Unit!3971)))

(declare-fun b!127306 () Bool)

(assert (=> b!127306 (= e!83095 (isDefined!120 (getValueByKey!168 (toList!832 lt!65501) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38603 c!23357) b!127304))

(assert (= (and d!38603 (not c!23357)) b!127305))

(assert (= (and d!38603 (not res!61506)) b!127306))

(assert (=> d!38603 m!147373))

(declare-fun m!148983 () Bool)

(assert (=> d!38603 m!148983))

(assert (=> b!127304 m!147373))

(declare-fun m!148985 () Bool)

(assert (=> b!127304 m!148985))

(assert (=> b!127304 m!147373))

(declare-fun m!148987 () Bool)

(assert (=> b!127304 m!148987))

(assert (=> b!127304 m!148987))

(declare-fun m!148989 () Bool)

(assert (=> b!127304 m!148989))

(assert (=> b!127306 m!147373))

(assert (=> b!127306 m!148987))

(assert (=> b!127306 m!148987))

(assert (=> b!127306 m!148989))

(assert (=> b!126744 d!38603))

(assert (=> d!38203 d!38205))

(assert (=> d!38203 d!38207))

(declare-fun d!38605 () Bool)

(assert (=> d!38605 (isDefined!120 (getValueByKey!168 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38605 true))

(declare-fun _$12!390 () Unit!3928)

(assert (=> d!38605 (= (choose!770 (toList!832 lt!65054) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) _$12!390)))

(declare-fun bs!5290 () Bool)

(assert (= bs!5290 d!38605))

(assert (=> bs!5290 m!147207))

(assert (=> bs!5290 m!147309))

(assert (=> bs!5290 m!147309))

(assert (=> bs!5290 m!147311))

(assert (=> d!38203 d!38605))

(declare-fun d!38607 () Bool)

(declare-fun res!61511 () Bool)

(declare-fun e!83100 () Bool)

(assert (=> d!38607 (=> res!61511 e!83100)))

(assert (=> d!38607 (= res!61511 (or ((_ is Nil!1675) (toList!832 lt!65054)) ((_ is Nil!1675) (t!6017 (toList!832 lt!65054)))))))

(assert (=> d!38607 (= (isStrictlySorted!304 (toList!832 lt!65054)) e!83100)))

(declare-fun b!127311 () Bool)

(declare-fun e!83101 () Bool)

(assert (=> b!127311 (= e!83100 e!83101)))

(declare-fun res!61512 () Bool)

(assert (=> b!127311 (=> (not res!61512) (not e!83101))))

(assert (=> b!127311 (= res!61512 (bvslt (_1!1273 (h!2276 (toList!832 lt!65054))) (_1!1273 (h!2276 (t!6017 (toList!832 lt!65054))))))))

(declare-fun b!127312 () Bool)

(assert (=> b!127312 (= e!83101 (isStrictlySorted!304 (t!6017 (toList!832 lt!65054))))))

(assert (= (and d!38607 (not res!61511)) b!127311))

(assert (= (and b!127311 res!61512) b!127312))

(declare-fun m!148991 () Bool)

(assert (=> b!127312 m!148991))

(assert (=> d!38203 d!38607))

(declare-fun d!38609 () Bool)

(declare-fun res!61513 () Bool)

(declare-fun e!83102 () Bool)

(assert (=> d!38609 (=> res!61513 e!83102)))

(assert (=> d!38609 (= res!61513 (= (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38609 (= (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!83102)))

(declare-fun b!127313 () Bool)

(declare-fun e!83103 () Bool)

(assert (=> b!127313 (= e!83102 e!83103)))

(declare-fun res!61514 () Bool)

(assert (=> b!127313 (=> (not res!61514) (not e!83103))))

(assert (=> b!127313 (= res!61514 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127314 () Bool)

(assert (=> b!127314 (= e!83103 (arrayContainsKey!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!38609 (not res!61513)) b!127313))

(assert (= (and b!127313 res!61514) b!127314))

(assert (=> d!38609 m!148287))

(assert (=> b!127314 m!147207))

(declare-fun m!148993 () Bool)

(assert (=> b!127314 m!148993))

(assert (=> b!126620 d!38609))

(declare-fun d!38611 () Bool)

(declare-fun e!83104 () Bool)

(assert (=> d!38611 e!83104))

(declare-fun res!61516 () Bool)

(assert (=> d!38611 (=> (not res!61516) (not e!83104))))

(declare-fun lt!65835 () ListLongMap!1633)

(assert (=> d!38611 (= res!61516 (contains!864 lt!65835 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun lt!65836 () List!1678)

(assert (=> d!38611 (= lt!65835 (ListLongMap!1634 lt!65836))))

(declare-fun lt!65838 () Unit!3928)

(declare-fun lt!65837 () Unit!3928)

(assert (=> d!38611 (= lt!65838 lt!65837)))

(assert (=> d!38611 (= (getValueByKey!168 lt!65836 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38611 (= lt!65837 (lemmaContainsTupThenGetReturnValue!83 lt!65836 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38611 (= lt!65836 (insertStrictlySorted!86 (toList!832 call!13623) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38611 (= (+!164 call!13623 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) lt!65835)))

(declare-fun b!127315 () Bool)

(declare-fun res!61515 () Bool)

(assert (=> b!127315 (=> (not res!61515) (not e!83104))))

(assert (=> b!127315 (= res!61515 (= (getValueByKey!168 (toList!832 lt!65835) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(declare-fun b!127316 () Bool)

(assert (=> b!127316 (= e!83104 (contains!866 (toList!832 lt!65835) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(assert (= (and d!38611 res!61516) b!127315))

(assert (= (and b!127315 res!61515) b!127316))

(declare-fun m!148995 () Bool)

(assert (=> d!38611 m!148995))

(declare-fun m!148997 () Bool)

(assert (=> d!38611 m!148997))

(declare-fun m!148999 () Bool)

(assert (=> d!38611 m!148999))

(declare-fun m!149001 () Bool)

(assert (=> d!38611 m!149001))

(declare-fun m!149003 () Bool)

(assert (=> b!127315 m!149003))

(declare-fun m!149005 () Bool)

(assert (=> b!127316 m!149005))

(assert (=> b!126578 d!38611))

(declare-fun d!38613 () Bool)

(declare-fun e!83106 () Bool)

(assert (=> d!38613 e!83106))

(declare-fun res!61517 () Bool)

(assert (=> d!38613 (=> res!61517 e!83106)))

(declare-fun lt!65840 () Bool)

(assert (=> d!38613 (= res!61517 (not lt!65840))))

(declare-fun lt!65839 () Bool)

(assert (=> d!38613 (= lt!65840 lt!65839)))

(declare-fun lt!65842 () Unit!3928)

(declare-fun e!83105 () Unit!3928)

(assert (=> d!38613 (= lt!65842 e!83105)))

(declare-fun c!23358 () Bool)

(assert (=> d!38613 (= c!23358 lt!65839)))

(assert (=> d!38613 (= lt!65839 (containsKey!171 (toList!832 lt!65390) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38613 (= (contains!864 lt!65390 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) lt!65840)))

(declare-fun b!127317 () Bool)

(declare-fun lt!65841 () Unit!3928)

(assert (=> b!127317 (= e!83105 lt!65841)))

(assert (=> b!127317 (= lt!65841 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65390) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127317 (isDefined!120 (getValueByKey!168 (toList!832 lt!65390) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127318 () Bool)

(declare-fun Unit!3972 () Unit!3928)

(assert (=> b!127318 (= e!83105 Unit!3972)))

(declare-fun b!127319 () Bool)

(assert (=> b!127319 (= e!83106 (isDefined!120 (getValueByKey!168 (toList!832 lt!65390) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38613 c!23358) b!127317))

(assert (= (and d!38613 (not c!23358)) b!127318))

(assert (= (and d!38613 (not res!61517)) b!127319))

(assert (=> d!38613 m!147525))

(declare-fun m!149007 () Bool)

(assert (=> d!38613 m!149007))

(assert (=> b!127317 m!147525))

(declare-fun m!149009 () Bool)

(assert (=> b!127317 m!149009))

(assert (=> b!127317 m!147525))

(assert (=> b!127317 m!148139))

(assert (=> b!127317 m!148139))

(declare-fun m!149011 () Bool)

(assert (=> b!127317 m!149011))

(assert (=> b!127319 m!147525))

(assert (=> b!127319 m!148139))

(assert (=> b!127319 m!148139))

(assert (=> b!127319 m!149011))

(assert (=> b!126561 d!38613))

(declare-fun d!38615 () Bool)

(declare-fun e!83108 () Bool)

(assert (=> d!38615 e!83108))

(declare-fun res!61518 () Bool)

(assert (=> d!38615 (=> res!61518 e!83108)))

(declare-fun lt!65844 () Bool)

(assert (=> d!38615 (= res!61518 (not lt!65844))))

(declare-fun lt!65843 () Bool)

(assert (=> d!38615 (= lt!65844 lt!65843)))

(declare-fun lt!65846 () Unit!3928)

(declare-fun e!83107 () Unit!3928)

(assert (=> d!38615 (= lt!65846 e!83107)))

(declare-fun c!23359 () Bool)

(assert (=> d!38615 (= c!23359 lt!65843)))

(assert (=> d!38615 (= lt!65843 (containsKey!171 (toList!832 lt!65331) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38615 (= (contains!864 lt!65331 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65844)))

(declare-fun b!127320 () Bool)

(declare-fun lt!65845 () Unit!3928)

(assert (=> b!127320 (= e!83107 lt!65845)))

(assert (=> b!127320 (= lt!65845 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65331) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!127320 (isDefined!120 (getValueByKey!168 (toList!832 lt!65331) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127321 () Bool)

(declare-fun Unit!3973 () Unit!3928)

(assert (=> b!127321 (= e!83107 Unit!3973)))

(declare-fun b!127322 () Bool)

(assert (=> b!127322 (= e!83108 (isDefined!120 (getValueByKey!168 (toList!832 lt!65331) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38615 c!23359) b!127320))

(assert (= (and d!38615 (not c!23359)) b!127321))

(assert (= (and d!38615 (not res!61518)) b!127322))

(declare-fun m!149013 () Bool)

(assert (=> d!38615 m!149013))

(declare-fun m!149015 () Bool)

(assert (=> b!127320 m!149015))

(assert (=> b!127320 m!147505))

(assert (=> b!127320 m!147505))

(declare-fun m!149017 () Bool)

(assert (=> b!127320 m!149017))

(assert (=> b!127322 m!147505))

(assert (=> b!127322 m!147505))

(assert (=> b!127322 m!149017))

(assert (=> d!38163 d!38615))

(declare-fun b!127326 () Bool)

(declare-fun e!83110 () Option!174)

(assert (=> b!127326 (= e!83110 None!172)))

(declare-fun b!127323 () Bool)

(declare-fun e!83109 () Option!174)

(assert (=> b!127323 (= e!83109 (Some!173 (_2!1273 (h!2276 lt!65332))))))

(declare-fun b!127325 () Bool)

(assert (=> b!127325 (= e!83110 (getValueByKey!168 (t!6017 lt!65332) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!23360 () Bool)

(declare-fun d!38617 () Bool)

(assert (=> d!38617 (= c!23360 (and ((_ is Cons!1674) lt!65332) (= (_1!1273 (h!2276 lt!65332)) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!38617 (= (getValueByKey!168 lt!65332 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!83109)))

(declare-fun b!127324 () Bool)

(assert (=> b!127324 (= e!83109 e!83110)))

(declare-fun c!23361 () Bool)

(assert (=> b!127324 (= c!23361 (and ((_ is Cons!1674) lt!65332) (not (= (_1!1273 (h!2276 lt!65332)) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (= (and d!38617 c!23360) b!127323))

(assert (= (and d!38617 (not c!23360)) b!127324))

(assert (= (and b!127324 c!23361) b!127325))

(assert (= (and b!127324 (not c!23361)) b!127326))

(declare-fun m!149019 () Bool)

(assert (=> b!127325 m!149019))

(assert (=> d!38163 d!38617))

(declare-fun d!38619 () Bool)

(assert (=> d!38619 (= (getValueByKey!168 lt!65332 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!173 (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!65847 () Unit!3928)

(assert (=> d!38619 (= lt!65847 (choose!776 lt!65332 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!83111 () Bool)

(assert (=> d!38619 e!83111))

(declare-fun res!61519 () Bool)

(assert (=> d!38619 (=> (not res!61519) (not e!83111))))

(assert (=> d!38619 (= res!61519 (isStrictlySorted!304 lt!65332))))

(assert (=> d!38619 (= (lemmaContainsTupThenGetReturnValue!83 lt!65332 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65847)))

(declare-fun b!127327 () Bool)

(declare-fun res!61520 () Bool)

(assert (=> b!127327 (=> (not res!61520) (not e!83111))))

(assert (=> b!127327 (= res!61520 (containsKey!171 lt!65332 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127328 () Bool)

(assert (=> b!127328 (= e!83111 (contains!866 lt!65332 (tuple2!2525 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38619 res!61519) b!127327))

(assert (= (and b!127327 res!61520) b!127328))

(assert (=> d!38619 m!147499))

(declare-fun m!149021 () Bool)

(assert (=> d!38619 m!149021))

(declare-fun m!149023 () Bool)

(assert (=> d!38619 m!149023))

(declare-fun m!149025 () Bool)

(assert (=> b!127327 m!149025))

(declare-fun m!149027 () Bool)

(assert (=> b!127328 m!149027))

(assert (=> d!38163 d!38619))

(declare-fun bm!13702 () Bool)

(declare-fun call!13706 () List!1678)

(declare-fun call!13707 () List!1678)

(assert (=> bm!13702 (= call!13706 call!13707)))

(declare-fun b!127329 () Bool)

(declare-fun e!83116 () List!1678)

(declare-fun call!13705 () List!1678)

(assert (=> b!127329 (= e!83116 call!13705)))

(declare-fun e!83113 () List!1678)

(declare-fun b!127330 () Bool)

(assert (=> b!127330 (= e!83113 (insertStrictlySorted!86 (t!6017 (toList!832 e!82522)) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127331 () Bool)

(declare-fun e!83115 () List!1678)

(declare-fun e!83112 () List!1678)

(assert (=> b!127331 (= e!83115 e!83112)))

(declare-fun c!23364 () Bool)

(assert (=> b!127331 (= c!23364 (and ((_ is Cons!1674) (toList!832 e!82522)) (= (_1!1273 (h!2276 (toList!832 e!82522))) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!127332 () Bool)

(declare-fun c!23365 () Bool)

(assert (=> b!127332 (= e!83113 (ite c!23364 (t!6017 (toList!832 e!82522)) (ite c!23365 (Cons!1674 (h!2276 (toList!832 e!82522)) (t!6017 (toList!832 e!82522))) Nil!1675)))))

(declare-fun b!127333 () Bool)

(assert (=> b!127333 (= e!83116 call!13705)))

(declare-fun b!127334 () Bool)

(assert (=> b!127334 (= e!83115 call!13707)))

(declare-fun c!23362 () Bool)

(declare-fun bm!13703 () Bool)

(assert (=> bm!13703 (= call!13707 ($colon$colon!88 e!83113 (ite c!23362 (h!2276 (toList!832 e!82522)) (tuple2!2525 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!23363 () Bool)

(assert (=> bm!13703 (= c!23363 c!23362)))

(declare-fun d!38621 () Bool)

(declare-fun e!83114 () Bool)

(assert (=> d!38621 e!83114))

(declare-fun res!61522 () Bool)

(assert (=> d!38621 (=> (not res!61522) (not e!83114))))

(declare-fun lt!65848 () List!1678)

(assert (=> d!38621 (= res!61522 (isStrictlySorted!304 lt!65848))))

(assert (=> d!38621 (= lt!65848 e!83115)))

(assert (=> d!38621 (= c!23362 (and ((_ is Cons!1674) (toList!832 e!82522)) (bvslt (_1!1273 (h!2276 (toList!832 e!82522))) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!38621 (isStrictlySorted!304 (toList!832 e!82522))))

(assert (=> d!38621 (= (insertStrictlySorted!86 (toList!832 e!82522) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65848)))

(declare-fun b!127335 () Bool)

(assert (=> b!127335 (= c!23365 (and ((_ is Cons!1674) (toList!832 e!82522)) (bvsgt (_1!1273 (h!2276 (toList!832 e!82522))) (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!127335 (= e!83112 e!83116)))

(declare-fun b!127336 () Bool)

(assert (=> b!127336 (= e!83112 call!13706)))

(declare-fun b!127337 () Bool)

(declare-fun res!61521 () Bool)

(assert (=> b!127337 (=> (not res!61521) (not e!83114))))

(assert (=> b!127337 (= res!61521 (containsKey!171 lt!65848 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!13704 () Bool)

(assert (=> bm!13704 (= call!13705 call!13706)))

(declare-fun b!127338 () Bool)

(assert (=> b!127338 (= e!83114 (contains!866 lt!65848 (tuple2!2525 (_1!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1273 (ite c!23087 (ite c!23084 (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38621 c!23362) b!127334))

(assert (= (and d!38621 (not c!23362)) b!127331))

(assert (= (and b!127331 c!23364) b!127336))

(assert (= (and b!127331 (not c!23364)) b!127335))

(assert (= (and b!127335 c!23365) b!127329))

(assert (= (and b!127335 (not c!23365)) b!127333))

(assert (= (or b!127329 b!127333) bm!13704))

(assert (= (or b!127336 bm!13704) bm!13702))

(assert (= (or b!127334 bm!13702) bm!13703))

(assert (= (and bm!13703 c!23363) b!127330))

(assert (= (and bm!13703 (not c!23363)) b!127332))

(assert (= (and d!38621 res!61522) b!127337))

(assert (= (and b!127337 res!61521) b!127338))

(declare-fun m!149029 () Bool)

(assert (=> b!127338 m!149029))

(declare-fun m!149031 () Bool)

(assert (=> b!127330 m!149031))

(declare-fun m!149033 () Bool)

(assert (=> b!127337 m!149033))

(declare-fun m!149035 () Bool)

(assert (=> d!38621 m!149035))

(declare-fun m!149037 () Bool)

(assert (=> d!38621 m!149037))

(declare-fun m!149039 () Bool)

(assert (=> bm!13703 m!149039))

(assert (=> d!38163 d!38621))

(assert (=> b!126664 d!38381))

(assert (=> d!38183 d!38379))

(declare-fun b!127339 () Bool)

(declare-fun e!83118 () Bool)

(declare-fun e!83117 () Bool)

(assert (=> b!127339 (= e!83118 e!83117)))

(declare-fun lt!65851 () (_ BitVec 64))

(assert (=> b!127339 (= lt!65851 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65850 () Unit!3928)

(assert (=> b!127339 (= lt!65850 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) lt!65851 #b00000000000000000000000000000000))))

(assert (=> b!127339 (arrayContainsKey!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) lt!65851 #b00000000000000000000000000000000)))

(declare-fun lt!65849 () Unit!3928)

(assert (=> b!127339 (= lt!65849 lt!65850)))

(declare-fun res!61524 () Bool)

(assert (=> b!127339 (= res!61524 (= (seekEntryOrOpen!0 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000) (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (mask!7038 newMap!16)) (Found!264 #b00000000000000000000000000000000)))))

(assert (=> b!127339 (=> (not res!61524) (not e!83117))))

(declare-fun bm!13705 () Bool)

(declare-fun call!13708 () Bool)

(assert (=> bm!13705 (= call!13708 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (mask!7038 newMap!16)))))

(declare-fun b!127340 () Bool)

(assert (=> b!127340 (= e!83117 call!13708)))

(declare-fun b!127341 () Bool)

(declare-fun e!83119 () Bool)

(assert (=> b!127341 (= e!83119 e!83118)))

(declare-fun c!23366 () Bool)

(assert (=> b!127341 (= c!23366 (validKeyInArray!0 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!38623 () Bool)

(declare-fun res!61523 () Bool)

(assert (=> d!38623 (=> res!61523 e!83119)))

(assert (=> d!38623 (= res!61523 (bvsge #b00000000000000000000000000000000 (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))))

(assert (=> d!38623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (mask!7038 newMap!16)) e!83119)))

(declare-fun b!127342 () Bool)

(assert (=> b!127342 (= e!83118 call!13708)))

(assert (= (and d!38623 (not res!61523)) b!127341))

(assert (= (and b!127341 c!23366) b!127339))

(assert (= (and b!127341 (not c!23366)) b!127342))

(assert (= (and b!127339 res!61524) b!127340))

(assert (= (or b!127340 b!127342) bm!13705))

(declare-fun m!149041 () Bool)

(assert (=> b!127339 m!149041))

(declare-fun m!149043 () Bool)

(assert (=> b!127339 m!149043))

(declare-fun m!149045 () Bool)

(assert (=> b!127339 m!149045))

(assert (=> b!127339 m!149041))

(declare-fun m!149047 () Bool)

(assert (=> b!127339 m!149047))

(declare-fun m!149049 () Bool)

(assert (=> bm!13705 m!149049))

(assert (=> b!127341 m!149041))

(assert (=> b!127341 m!149041))

(declare-fun m!149051 () Bool)

(assert (=> b!127341 m!149051))

(assert (=> d!38159 d!38623))

(declare-fun b!127343 () Bool)

(declare-fun e!83125 () Bool)

(declare-fun e!83132 () Bool)

(assert (=> b!127343 (= e!83125 e!83132)))

(declare-fun c!23372 () Bool)

(assert (=> b!127343 (= c!23372 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127344 () Bool)

(declare-fun e!83129 () ListLongMap!1633)

(declare-fun e!83130 () ListLongMap!1633)

(assert (=> b!127344 (= e!83129 e!83130)))

(declare-fun c!23368 () Bool)

(assert (=> b!127344 (= c!23368 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!13712 () ListLongMap!1633)

(declare-fun call!13714 () ListLongMap!1633)

(declare-fun call!13715 () ListLongMap!1633)

(declare-fun c!23371 () Bool)

(declare-fun call!13709 () ListLongMap!1633)

(declare-fun bm!13706 () Bool)

(assert (=> bm!13706 (= call!13714 (+!164 (ite c!23371 call!13709 (ite c!23368 call!13712 call!13715)) (ite (or c!23371 c!23368) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun bm!13707 () Bool)

(assert (=> bm!13707 (= call!13709 (getCurrentListMapNoExtraKeys!131 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13708 () Bool)

(declare-fun call!13713 () Bool)

(declare-fun lt!65866 () ListLongMap!1633)

(assert (=> bm!13708 (= call!13713 (contains!864 lt!65866 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127345 () Bool)

(declare-fun e!83120 () Bool)

(declare-fun e!83124 () Bool)

(assert (=> b!127345 (= e!83120 e!83124)))

(declare-fun res!61529 () Bool)

(assert (=> b!127345 (=> (not res!61529) (not e!83124))))

(assert (=> b!127345 (= res!61529 (contains!864 lt!65866 (select (arr!2216 lt!65307) #b00000000000000000000000000000000)))))

(assert (=> b!127345 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 lt!65307)))))

(declare-fun bm!13709 () Bool)

(assert (=> bm!13709 (= call!13715 call!13712)))

(declare-fun b!127346 () Bool)

(declare-fun e!83127 () ListLongMap!1633)

(declare-fun call!13711 () ListLongMap!1633)

(assert (=> b!127346 (= e!83127 call!13711)))

(declare-fun b!127347 () Bool)

(declare-fun res!61525 () Bool)

(assert (=> b!127347 (=> (not res!61525) (not e!83125))))

(assert (=> b!127347 (= res!61525 e!83120)))

(declare-fun res!61526 () Bool)

(assert (=> b!127347 (=> res!61526 e!83120)))

(declare-fun e!83123 () Bool)

(assert (=> b!127347 (= res!61526 (not e!83123))))

(declare-fun res!61531 () Bool)

(assert (=> b!127347 (=> (not res!61531) (not e!83123))))

(assert (=> b!127347 (= res!61531 (bvslt #b00000000000000000000000000000000 (size!2480 lt!65307)))))

(declare-fun b!127348 () Bool)

(declare-fun e!83126 () Bool)

(assert (=> b!127348 (= e!83126 (validKeyInArray!0 (select (arr!2216 lt!65307) #b00000000000000000000000000000000)))))

(declare-fun b!127349 () Bool)

(declare-fun e!83121 () Bool)

(assert (=> b!127349 (= e!83121 (= (apply!111 lt!65866 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127350 () Bool)

(declare-fun res!61532 () Bool)

(assert (=> b!127350 (=> (not res!61532) (not e!83125))))

(declare-fun e!83122 () Bool)

(assert (=> b!127350 (= res!61532 e!83122)))

(declare-fun c!23367 () Bool)

(assert (=> b!127350 (= c!23367 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13710 () Bool)

(assert (=> bm!13710 (= call!13711 call!13714)))

(declare-fun b!127351 () Bool)

(assert (=> b!127351 (= e!83130 call!13711)))

(declare-fun b!127352 () Bool)

(assert (=> b!127352 (= e!83127 call!13715)))

(declare-fun bm!13711 () Bool)

(assert (=> bm!13711 (= call!13712 call!13709)))

(declare-fun b!127353 () Bool)

(assert (=> b!127353 (= e!83132 e!83121)))

(declare-fun res!61528 () Bool)

(assert (=> b!127353 (= res!61528 call!13713)))

(assert (=> b!127353 (=> (not res!61528) (not e!83121))))

(declare-fun b!127354 () Bool)

(declare-fun c!23370 () Bool)

(assert (=> b!127354 (= c!23370 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127354 (= e!83130 e!83127)))

(declare-fun b!127355 () Bool)

(assert (=> b!127355 (= e!83132 (not call!13713))))

(declare-fun b!127356 () Bool)

(assert (=> b!127356 (= e!83124 (= (apply!111 lt!65866 (select (arr!2216 lt!65307) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 lt!65300) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 lt!65300)))))

(assert (=> b!127356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 lt!65307)))))

(declare-fun b!127357 () Bool)

(declare-fun call!13710 () Bool)

(assert (=> b!127357 (= e!83122 (not call!13710))))

(declare-fun bm!13712 () Bool)

(assert (=> bm!13712 (= call!13710 (contains!864 lt!65866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127358 () Bool)

(declare-fun e!83131 () Bool)

(assert (=> b!127358 (= e!83131 (= (apply!111 lt!65866 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127359 () Bool)

(declare-fun e!83128 () Unit!3928)

(declare-fun lt!65869 () Unit!3928)

(assert (=> b!127359 (= e!83128 lt!65869)))

(declare-fun lt!65854 () ListLongMap!1633)

(assert (=> b!127359 (= lt!65854 (getCurrentListMapNoExtraKeys!131 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65873 () (_ BitVec 64))

(assert (=> b!127359 (= lt!65873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65871 () (_ BitVec 64))

(assert (=> b!127359 (= lt!65871 (select (arr!2216 lt!65307) #b00000000000000000000000000000000))))

(declare-fun lt!65856 () Unit!3928)

(assert (=> b!127359 (= lt!65856 (addStillContains!87 lt!65854 lt!65873 (zeroValue!2645 newMap!16) lt!65871))))

(assert (=> b!127359 (contains!864 (+!164 lt!65854 (tuple2!2525 lt!65873 (zeroValue!2645 newMap!16))) lt!65871)))

(declare-fun lt!65860 () Unit!3928)

(assert (=> b!127359 (= lt!65860 lt!65856)))

(declare-fun lt!65864 () ListLongMap!1633)

(assert (=> b!127359 (= lt!65864 (getCurrentListMapNoExtraKeys!131 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65857 () (_ BitVec 64))

(assert (=> b!127359 (= lt!65857 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65867 () (_ BitVec 64))

(assert (=> b!127359 (= lt!65867 (select (arr!2216 lt!65307) #b00000000000000000000000000000000))))

(declare-fun lt!65862 () Unit!3928)

(assert (=> b!127359 (= lt!65862 (addApplyDifferent!87 lt!65864 lt!65857 (minValue!2645 newMap!16) lt!65867))))

(assert (=> b!127359 (= (apply!111 (+!164 lt!65864 (tuple2!2525 lt!65857 (minValue!2645 newMap!16))) lt!65867) (apply!111 lt!65864 lt!65867))))

(declare-fun lt!65872 () Unit!3928)

(assert (=> b!127359 (= lt!65872 lt!65862)))

(declare-fun lt!65855 () ListLongMap!1633)

(assert (=> b!127359 (= lt!65855 (getCurrentListMapNoExtraKeys!131 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65863 () (_ BitVec 64))

(assert (=> b!127359 (= lt!65863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65853 () (_ BitVec 64))

(assert (=> b!127359 (= lt!65853 (select (arr!2216 lt!65307) #b00000000000000000000000000000000))))

(declare-fun lt!65852 () Unit!3928)

(assert (=> b!127359 (= lt!65852 (addApplyDifferent!87 lt!65855 lt!65863 (zeroValue!2645 newMap!16) lt!65853))))

(assert (=> b!127359 (= (apply!111 (+!164 lt!65855 (tuple2!2525 lt!65863 (zeroValue!2645 newMap!16))) lt!65853) (apply!111 lt!65855 lt!65853))))

(declare-fun lt!65861 () Unit!3928)

(assert (=> b!127359 (= lt!65861 lt!65852)))

(declare-fun lt!65868 () ListLongMap!1633)

(assert (=> b!127359 (= lt!65868 (getCurrentListMapNoExtraKeys!131 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65859 () (_ BitVec 64))

(assert (=> b!127359 (= lt!65859 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65865 () (_ BitVec 64))

(assert (=> b!127359 (= lt!65865 (select (arr!2216 lt!65307) #b00000000000000000000000000000000))))

(assert (=> b!127359 (= lt!65869 (addApplyDifferent!87 lt!65868 lt!65859 (minValue!2645 newMap!16) lt!65865))))

(assert (=> b!127359 (= (apply!111 (+!164 lt!65868 (tuple2!2525 lt!65859 (minValue!2645 newMap!16))) lt!65865) (apply!111 lt!65868 lt!65865))))

(declare-fun b!127360 () Bool)

(declare-fun Unit!3974 () Unit!3928)

(assert (=> b!127360 (= e!83128 Unit!3974)))

(declare-fun d!38625 () Bool)

(assert (=> d!38625 e!83125))

(declare-fun res!61533 () Bool)

(assert (=> d!38625 (=> (not res!61533) (not e!83125))))

(assert (=> d!38625 (= res!61533 (or (bvsge #b00000000000000000000000000000000 (size!2480 lt!65307)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 lt!65307)))))))

(declare-fun lt!65858 () ListLongMap!1633)

(assert (=> d!38625 (= lt!65866 lt!65858)))

(declare-fun lt!65870 () Unit!3928)

(assert (=> d!38625 (= lt!65870 e!83128)))

(declare-fun c!23369 () Bool)

(assert (=> d!38625 (= c!23369 e!83126)))

(declare-fun res!61530 () Bool)

(assert (=> d!38625 (=> (not res!61530) (not e!83126))))

(assert (=> d!38625 (= res!61530 (bvslt #b00000000000000000000000000000000 (size!2480 lt!65307)))))

(assert (=> d!38625 (= lt!65858 e!83129)))

(assert (=> d!38625 (= c!23371 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38625 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38625 (= (getCurrentListMap!512 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65866)))

(declare-fun b!127361 () Bool)

(assert (=> b!127361 (= e!83123 (validKeyInArray!0 (select (arr!2216 lt!65307) #b00000000000000000000000000000000)))))

(declare-fun b!127362 () Bool)

(assert (=> b!127362 (= e!83129 (+!164 call!13714 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun b!127363 () Bool)

(assert (=> b!127363 (= e!83122 e!83131)))

(declare-fun res!61527 () Bool)

(assert (=> b!127363 (= res!61527 call!13710)))

(assert (=> b!127363 (=> (not res!61527) (not e!83131))))

(assert (= (and d!38625 c!23371) b!127362))

(assert (= (and d!38625 (not c!23371)) b!127344))

(assert (= (and b!127344 c!23368) b!127351))

(assert (= (and b!127344 (not c!23368)) b!127354))

(assert (= (and b!127354 c!23370) b!127346))

(assert (= (and b!127354 (not c!23370)) b!127352))

(assert (= (or b!127346 b!127352) bm!13709))

(assert (= (or b!127351 bm!13709) bm!13711))

(assert (= (or b!127351 b!127346) bm!13710))

(assert (= (or b!127362 bm!13711) bm!13707))

(assert (= (or b!127362 bm!13710) bm!13706))

(assert (= (and d!38625 res!61530) b!127348))

(assert (= (and d!38625 c!23369) b!127359))

(assert (= (and d!38625 (not c!23369)) b!127360))

(assert (= (and d!38625 res!61533) b!127347))

(assert (= (and b!127347 res!61531) b!127361))

(assert (= (and b!127347 (not res!61526)) b!127345))

(assert (= (and b!127345 res!61529) b!127356))

(assert (= (and b!127347 res!61525) b!127350))

(assert (= (and b!127350 c!23367) b!127363))

(assert (= (and b!127350 (not c!23367)) b!127357))

(assert (= (and b!127363 res!61527) b!127358))

(assert (= (or b!127363 b!127357) bm!13712))

(assert (= (and b!127350 res!61532) b!127343))

(assert (= (and b!127343 c!23372) b!127353))

(assert (= (and b!127343 (not c!23372)) b!127355))

(assert (= (and b!127353 res!61528) b!127349))

(assert (= (or b!127353 b!127355) bm!13708))

(declare-fun b_lambda!5619 () Bool)

(assert (=> (not b_lambda!5619) (not b!127356)))

(assert (=> b!127356 t!6029))

(declare-fun b_and!7849 () Bool)

(assert (= b_and!7845 (and (=> t!6029 result!3843) b_and!7849)))

(assert (=> b!127356 t!6031))

(declare-fun b_and!7851 () Bool)

(assert (= b_and!7847 (and (=> t!6031 result!3845) b_and!7851)))

(declare-fun m!149053 () Bool)

(assert (=> b!127361 m!149053))

(assert (=> b!127361 m!149053))

(declare-fun m!149055 () Bool)

(assert (=> b!127361 m!149055))

(declare-fun m!149057 () Bool)

(assert (=> b!127359 m!149057))

(declare-fun m!149059 () Bool)

(assert (=> b!127359 m!149059))

(declare-fun m!149061 () Bool)

(assert (=> b!127359 m!149061))

(declare-fun m!149063 () Bool)

(assert (=> b!127359 m!149063))

(declare-fun m!149065 () Bool)

(assert (=> b!127359 m!149065))

(assert (=> b!127359 m!149063))

(declare-fun m!149067 () Bool)

(assert (=> b!127359 m!149067))

(declare-fun m!149069 () Bool)

(assert (=> b!127359 m!149069))

(declare-fun m!149071 () Bool)

(assert (=> b!127359 m!149071))

(declare-fun m!149073 () Bool)

(assert (=> b!127359 m!149073))

(assert (=> b!127359 m!149059))

(declare-fun m!149075 () Bool)

(assert (=> b!127359 m!149075))

(declare-fun m!149077 () Bool)

(assert (=> b!127359 m!149077))

(declare-fun m!149079 () Bool)

(assert (=> b!127359 m!149079))

(declare-fun m!149081 () Bool)

(assert (=> b!127359 m!149081))

(declare-fun m!149083 () Bool)

(assert (=> b!127359 m!149083))

(declare-fun m!149085 () Bool)

(assert (=> b!127359 m!149085))

(assert (=> b!127359 m!149053))

(assert (=> b!127359 m!149067))

(assert (=> b!127359 m!149079))

(declare-fun m!149087 () Bool)

(assert (=> b!127359 m!149087))

(declare-fun m!149089 () Bool)

(assert (=> bm!13712 m!149089))

(declare-fun m!149091 () Bool)

(assert (=> bm!13706 m!149091))

(assert (=> bm!13707 m!149085))

(declare-fun m!149093 () Bool)

(assert (=> b!127349 m!149093))

(assert (=> b!127348 m!149053))

(assert (=> b!127348 m!149053))

(assert (=> b!127348 m!149055))

(assert (=> b!127345 m!149053))

(assert (=> b!127345 m!149053))

(declare-fun m!149095 () Bool)

(assert (=> b!127345 m!149095))

(assert (=> b!127356 m!147569))

(assert (=> b!127356 m!149053))

(declare-fun m!149097 () Bool)

(assert (=> b!127356 m!149097))

(assert (=> b!127356 m!149053))

(declare-fun m!149099 () Bool)

(assert (=> b!127356 m!149099))

(assert (=> b!127356 m!149099))

(assert (=> b!127356 m!147569))

(declare-fun m!149101 () Bool)

(assert (=> b!127356 m!149101))

(declare-fun m!149103 () Bool)

(assert (=> bm!13708 m!149103))

(declare-fun m!149105 () Bool)

(assert (=> b!127362 m!149105))

(declare-fun m!149107 () Bool)

(assert (=> b!127358 m!149107))

(assert (=> d!38625 m!147517))

(assert (=> d!38159 d!38625))

(declare-fun d!38627 () Bool)

(declare-fun e!83135 () Bool)

(assert (=> d!38627 e!83135))

(declare-fun res!61536 () Bool)

(assert (=> d!38627 (=> (not res!61536) (not e!83135))))

(assert (=> d!38627 (= res!61536 (and (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000) (bvslt (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (size!2480 (_keys!4515 newMap!16)))))))

(declare-fun lt!65876 () Unit!3928)

(declare-fun choose!41 (array!4681 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1680) Unit!3928)

(assert (=> d!38627 (= lt!65876 (choose!41 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) lt!65317 lt!65313))))

(assert (=> d!38627 (bvslt (size!2480 (_keys!4515 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!38627 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4515 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) lt!65317 lt!65313) lt!65876)))

(declare-fun b!127366 () Bool)

(assert (=> b!127366 (= e!83135 (arrayNoDuplicates!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) lt!65317 lt!65313))))

(assert (= (and d!38627 res!61536) b!127366))

(assert (=> d!38627 m!147207))

(declare-fun m!149109 () Bool)

(assert (=> d!38627 m!149109))

(assert (=> b!127366 m!147487))

(assert (=> b!127366 m!147461))

(assert (=> d!38159 d!38627))

(declare-fun d!38629 () Bool)

(declare-fun lt!65877 () (_ BitVec 32))

(assert (=> d!38629 (and (bvsge lt!65877 #b00000000000000000000000000000000) (bvsle lt!65877 (bvsub (size!2480 lt!65315) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)))))))

(declare-fun e!83137 () (_ BitVec 32))

(assert (=> d!38629 (= lt!65877 e!83137)))

(declare-fun c!23374 () Bool)

(assert (=> d!38629 (= c!23374 (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (bvadd (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000001)))))

(assert (=> d!38629 (and (bvsle (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (bvadd (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000001)) (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000001) (size!2480 lt!65315)))))

(assert (=> d!38629 (= (arrayCountValidKeys!0 lt!65315 (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (bvadd (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000001)) lt!65877)))

(declare-fun b!127367 () Bool)

(declare-fun e!83136 () (_ BitVec 32))

(declare-fun call!13716 () (_ BitVec 32))

(assert (=> b!127367 (= e!83136 (bvadd #b00000000000000000000000000000001 call!13716))))

(declare-fun bm!13713 () Bool)

(assert (=> bm!13713 (= call!13716 (arrayCountValidKeys!0 lt!65315 (bvadd (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000001) (bvadd (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000001)))))

(declare-fun b!127368 () Bool)

(assert (=> b!127368 (= e!83136 call!13716)))

(declare-fun b!127369 () Bool)

(assert (=> b!127369 (= e!83137 #b00000000000000000000000000000000)))

(declare-fun b!127370 () Bool)

(assert (=> b!127370 (= e!83137 e!83136)))

(declare-fun c!23373 () Bool)

(assert (=> b!127370 (= c!23373 (validKeyInArray!0 (select (arr!2216 lt!65315) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)))))))

(assert (= (and d!38629 c!23374) b!127369))

(assert (= (and d!38629 (not c!23374)) b!127370))

(assert (= (and b!127370 c!23373) b!127367))

(assert (= (and b!127370 (not c!23373)) b!127368))

(assert (= (or b!127367 b!127368) bm!13713))

(declare-fun m!149111 () Bool)

(assert (=> bm!13713 m!149111))

(declare-fun m!149113 () Bool)

(assert (=> b!127370 m!149113))

(assert (=> b!127370 m!149113))

(declare-fun m!149115 () Bool)

(assert (=> b!127370 m!149115))

(assert (=> d!38159 d!38629))

(assert (=> d!38159 d!38267))

(assert (=> d!38159 d!38149))

(declare-fun d!38631 () Bool)

(declare-fun res!61537 () Bool)

(declare-fun e!83138 () Bool)

(assert (=> d!38631 (=> res!61537 e!83138)))

(assert (=> d!38631 (= res!61537 (= (select (arr!2216 lt!65305) #b00000000000000000000000000000000) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38631 (= (arrayContainsKey!0 lt!65305 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000) e!83138)))

(declare-fun b!127371 () Bool)

(declare-fun e!83139 () Bool)

(assert (=> b!127371 (= e!83138 e!83139)))

(declare-fun res!61538 () Bool)

(assert (=> b!127371 (=> (not res!61538) (not e!83139))))

(assert (=> b!127371 (= res!61538 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 lt!65305)))))

(declare-fun b!127372 () Bool)

(assert (=> b!127372 (= e!83139 (arrayContainsKey!0 lt!65305 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38631 (not res!61537)) b!127371))

(assert (= (and b!127371 res!61538) b!127372))

(declare-fun m!149117 () Bool)

(assert (=> d!38631 m!149117))

(assert (=> b!127372 m!147207))

(declare-fun m!149119 () Bool)

(assert (=> b!127372 m!149119))

(assert (=> d!38159 d!38631))

(assert (=> d!38159 d!38197))

(declare-fun d!38633 () Bool)

(declare-fun e!83141 () Bool)

(assert (=> d!38633 e!83141))

(declare-fun res!61539 () Bool)

(assert (=> d!38633 (=> res!61539 e!83141)))

(declare-fun lt!65879 () Bool)

(assert (=> d!38633 (= res!61539 (not lt!65879))))

(declare-fun lt!65878 () Bool)

(assert (=> d!38633 (= lt!65879 lt!65878)))

(declare-fun lt!65881 () Unit!3928)

(declare-fun e!83140 () Unit!3928)

(assert (=> d!38633 (= lt!65881 e!83140)))

(declare-fun c!23375 () Bool)

(assert (=> d!38633 (= c!23375 lt!65878)))

(assert (=> d!38633 (= lt!65878 (containsKey!171 (toList!832 (getCurrentListMap!512 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)))))))

(assert (=> d!38633 (= (contains!864 (getCurrentListMap!512 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)))) lt!65879)))

(declare-fun b!127373 () Bool)

(declare-fun lt!65880 () Unit!3928)

(assert (=> b!127373 (= e!83140 lt!65880)))

(assert (=> b!127373 (= lt!65880 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (getCurrentListMap!512 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)))))))

(assert (=> b!127373 (isDefined!120 (getValueByKey!168 (toList!832 (getCurrentListMap!512 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)))))))

(declare-fun b!127374 () Bool)

(declare-fun Unit!3975 () Unit!3928)

(assert (=> b!127374 (= e!83140 Unit!3975)))

(declare-fun b!127375 () Bool)

(assert (=> b!127375 (= e!83141 (isDefined!120 (getValueByKey!168 (toList!832 (getCurrentListMap!512 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (select (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))))))))

(assert (= (and d!38633 c!23375) b!127373))

(assert (= (and d!38633 (not c!23375)) b!127374))

(assert (= (and d!38633 (not res!61539)) b!127375))

(assert (=> d!38633 m!147471))

(declare-fun m!149121 () Bool)

(assert (=> d!38633 m!149121))

(assert (=> b!127373 m!147471))

(declare-fun m!149123 () Bool)

(assert (=> b!127373 m!149123))

(assert (=> b!127373 m!147471))

(declare-fun m!149125 () Bool)

(assert (=> b!127373 m!149125))

(assert (=> b!127373 m!149125))

(declare-fun m!149127 () Bool)

(assert (=> b!127373 m!149127))

(assert (=> b!127375 m!147471))

(assert (=> b!127375 m!149125))

(assert (=> b!127375 m!149125))

(assert (=> b!127375 m!149127))

(assert (=> d!38159 d!38633))

(declare-fun e!83147 () Bool)

(declare-fun b!127387 () Bool)

(assert (=> b!127387 (= e!83147 (= (arrayCountValidKeys!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4515 newMap!16) #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun b!127386 () Bool)

(declare-fun e!83146 () Bool)

(assert (=> b!127386 (= e!83146 (bvslt (size!2480 (_keys!4515 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun d!38635 () Bool)

(assert (=> d!38635 e!83147))

(declare-fun res!61549 () Bool)

(assert (=> d!38635 (=> (not res!61549) (not e!83147))))

(assert (=> d!38635 (= res!61549 (and (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000) (bvslt (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (size!2480 (_keys!4515 newMap!16)))))))

(declare-fun lt!65884 () Unit!3928)

(declare-fun choose!1 (array!4681 (_ BitVec 32) (_ BitVec 64)) Unit!3928)

(assert (=> d!38635 (= lt!65884 (choose!1 (_keys!4515 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38635 e!83146))

(declare-fun res!61548 () Bool)

(assert (=> d!38635 (=> (not res!61548) (not e!83146))))

(assert (=> d!38635 (= res!61548 (and (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000) (bvslt (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (size!2480 (_keys!4515 newMap!16)))))))

(assert (=> d!38635 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4515 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65884)))

(declare-fun b!127384 () Bool)

(declare-fun res!61550 () Bool)

(assert (=> b!127384 (=> (not res!61550) (not e!83146))))

(assert (=> b!127384 (= res!61550 (not (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))))))))

(declare-fun b!127385 () Bool)

(declare-fun res!61551 () Bool)

(assert (=> b!127385 (=> (not res!61551) (not e!83146))))

(assert (=> b!127385 (= res!61551 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38635 res!61548) b!127384))

(assert (= (and b!127384 res!61550) b!127385))

(assert (= (and b!127385 res!61551) b!127386))

(assert (= (and d!38635 res!61549) b!127387))

(assert (=> b!127387 m!147487))

(assert (=> b!127387 m!147463))

(assert (=> b!127387 m!147431))

(assert (=> d!38635 m!147207))

(declare-fun m!149129 () Bool)

(assert (=> d!38635 m!149129))

(declare-fun m!149131 () Bool)

(assert (=> b!127384 m!149131))

(assert (=> b!127384 m!149131))

(declare-fun m!149133 () Bool)

(assert (=> b!127384 m!149133))

(assert (=> b!127385 m!147207))

(declare-fun m!149135 () Bool)

(assert (=> b!127385 m!149135))

(assert (=> d!38159 d!38635))

(declare-fun d!38637 () Bool)

(declare-fun lt!65885 () (_ BitVec 32))

(assert (=> d!38637 (and (bvsge lt!65885 #b00000000000000000000000000000000) (bvsle lt!65885 (bvsub (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun e!83149 () (_ BitVec 32))

(assert (=> d!38637 (= lt!65885 e!83149)))

(declare-fun c!23377 () Bool)

(assert (=> d!38637 (= c!23377 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38637 (and (bvsle #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2480 (_keys!4515 newMap!16)) (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))))

(assert (=> d!38637 (= (arrayCountValidKeys!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) lt!65885)))

(declare-fun b!127388 () Bool)

(declare-fun e!83148 () (_ BitVec 32))

(declare-fun call!13717 () (_ BitVec 32))

(assert (=> b!127388 (= e!83148 (bvadd #b00000000000000000000000000000001 call!13717))))

(declare-fun bm!13714 () Bool)

(assert (=> bm!13714 (= call!13717 (arrayCountValidKeys!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127389 () Bool)

(assert (=> b!127389 (= e!83148 call!13717)))

(declare-fun b!127390 () Bool)

(assert (=> b!127390 (= e!83149 #b00000000000000000000000000000000)))

(declare-fun b!127391 () Bool)

(assert (=> b!127391 (= e!83149 e!83148)))

(declare-fun c!23376 () Bool)

(assert (=> b!127391 (= c!23376 (validKeyInArray!0 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (= (and d!38637 c!23377) b!127390))

(assert (= (and d!38637 (not c!23377)) b!127391))

(assert (= (and b!127391 c!23376) b!127388))

(assert (= (and b!127391 (not c!23376)) b!127389))

(assert (= (or b!127388 b!127389) bm!13714))

(declare-fun m!149137 () Bool)

(assert (=> bm!13714 m!149137))

(assert (=> b!127391 m!149041))

(assert (=> b!127391 m!149041))

(assert (=> b!127391 m!149051))

(assert (=> d!38159 d!38637))

(declare-fun d!38639 () Bool)

(declare-fun e!83150 () Bool)

(assert (=> d!38639 e!83150))

(declare-fun res!61552 () Bool)

(assert (=> d!38639 (=> (not res!61552) (not e!83150))))

(assert (=> d!38639 (= res!61552 (and (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000) (bvslt (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (size!2480 lt!65307))))))

(declare-fun lt!65886 () Unit!3928)

(assert (=> d!38639 (= lt!65886 (choose!774 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38639 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38639 (= (lemmaValidKeyInArrayIsInListMap!116 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (defaultEntry!2782 newMap!16)) lt!65886)))

(declare-fun b!127392 () Bool)

(assert (=> b!127392 (= e!83150 (contains!864 (getCurrentListMap!512 lt!65307 lt!65300 (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 lt!65307) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)))))))

(assert (= (and d!38639 res!61552) b!127392))

(declare-fun m!149139 () Bool)

(assert (=> d!38639 m!149139))

(assert (=> d!38639 m!147517))

(assert (=> b!127392 m!147465))

(declare-fun m!149141 () Bool)

(assert (=> b!127392 m!149141))

(assert (=> b!127392 m!147465))

(assert (=> b!127392 m!149141))

(declare-fun m!149143 () Bool)

(assert (=> b!127392 m!149143))

(assert (=> d!38159 d!38639))

(assert (=> d!38159 d!38571))

(assert (=> d!38159 d!38183))

(declare-fun d!38641 () Bool)

(declare-fun e!83153 () Bool)

(assert (=> d!38641 e!83153))

(declare-fun res!61555 () Bool)

(assert (=> d!38641 (=> (not res!61555) (not e!83153))))

(assert (=> d!38641 (= res!61555 (and (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000) (bvslt (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (size!2480 (_keys!4515 newMap!16))) (bvslt (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (size!2481 (_values!2765 newMap!16)))))))

(declare-fun lt!65889 () Unit!3928)

(declare-fun choose!778 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 32) (_ BitVec 64) V!3433 Int) Unit!3928)

(assert (=> d!38641 (= lt!65889 (choose!778 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)))))

(assert (=> d!38641 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38641 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!37 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) lt!65889)))

(declare-fun b!127395 () Bool)

(assert (=> b!127395 (= e!83153 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!512 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))))))

(assert (= (and d!38641 res!61555) b!127395))

(assert (=> d!38641 m!147207))

(assert (=> d!38641 m!147215))

(declare-fun m!149145 () Bool)

(assert (=> d!38641 m!149145))

(assert (=> d!38641 m!147517))

(assert (=> b!127395 m!147325))

(assert (=> b!127395 m!147473))

(assert (=> b!127395 m!147487))

(assert (=> b!127395 m!147491))

(assert (=> b!127395 m!147489))

(assert (=> b!127395 m!147325))

(assert (=> d!38159 d!38641))

(assert (=> d!38159 d!38199))

(declare-fun d!38643 () Bool)

(declare-fun e!83156 () Bool)

(assert (=> d!38643 e!83156))

(declare-fun res!61558 () Bool)

(assert (=> d!38643 (=> (not res!61558) (not e!83156))))

(assert (=> d!38643 (= res!61558 (and (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000) (bvslt (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (size!2480 (_keys!4515 newMap!16)))))))

(declare-fun lt!65892 () Unit!3928)

(declare-fun choose!102 ((_ BitVec 64) array!4681 (_ BitVec 32) (_ BitVec 32)) Unit!3928)

(assert (=> d!38643 (= lt!65892 (choose!102 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (mask!7038 newMap!16)))))

(assert (=> d!38643 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38643 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (mask!7038 newMap!16)) lt!65892)))

(declare-fun b!127398 () Bool)

(assert (=> b!127398 (= e!83156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (mask!7038 newMap!16)))))

(assert (= (and d!38643 res!61558) b!127398))

(assert (=> d!38643 m!147207))

(declare-fun m!149147 () Bool)

(assert (=> d!38643 m!149147))

(assert (=> d!38643 m!147517))

(assert (=> b!127398 m!147487))

(assert (=> b!127398 m!147477))

(assert (=> d!38159 d!38643))

(declare-fun d!38645 () Bool)

(assert (=> d!38645 (= (arrayCountValidKeys!0 lt!65315 (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (bvadd (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!65895 () Unit!3928)

(declare-fun choose!2 (array!4681 (_ BitVec 32)) Unit!3928)

(assert (=> d!38645 (= lt!65895 (choose!2 lt!65315 (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))))))

(declare-fun e!83159 () Bool)

(assert (=> d!38645 e!83159))

(declare-fun res!61563 () Bool)

(assert (=> d!38645 (=> (not res!61563) (not e!83159))))

(assert (=> d!38645 (= res!61563 (and (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000) (bvslt (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (size!2480 lt!65315))))))

(assert (=> d!38645 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!65315 (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))) lt!65895)))

(declare-fun b!127403 () Bool)

(declare-fun res!61564 () Bool)

(assert (=> b!127403 (=> (not res!61564) (not e!83159))))

(assert (=> b!127403 (= res!61564 (validKeyInArray!0 (select (arr!2216 lt!65315) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)))))))

(declare-fun b!127404 () Bool)

(assert (=> b!127404 (= e!83159 (bvslt (size!2480 lt!65315) #b01111111111111111111111111111111))))

(assert (= (and d!38645 res!61563) b!127403))

(assert (= (and b!127403 res!61564) b!127404))

(assert (=> d!38645 m!147467))

(declare-fun m!149149 () Bool)

(assert (=> d!38645 m!149149))

(assert (=> b!127403 m!149113))

(assert (=> b!127403 m!149113))

(assert (=> b!127403 m!149115))

(assert (=> d!38159 d!38645))

(declare-fun b!127405 () Bool)

(declare-fun e!83165 () Bool)

(declare-fun e!83172 () Bool)

(assert (=> b!127405 (= e!83165 e!83172)))

(declare-fun c!23383 () Bool)

(assert (=> b!127405 (= c!23383 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127406 () Bool)

(declare-fun e!83169 () ListLongMap!1633)

(declare-fun e!83170 () ListLongMap!1633)

(assert (=> b!127406 (= e!83169 e!83170)))

(declare-fun c!23379 () Bool)

(assert (=> b!127406 (= c!23379 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!13715 () Bool)

(declare-fun c!23382 () Bool)

(declare-fun call!13724 () ListLongMap!1633)

(declare-fun call!13721 () ListLongMap!1633)

(declare-fun call!13718 () ListLongMap!1633)

(declare-fun call!13723 () ListLongMap!1633)

(assert (=> bm!13715 (= call!13723 (+!164 (ite c!23382 call!13718 (ite c!23379 call!13721 call!13724)) (ite (or c!23382 c!23379) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun bm!13716 () Bool)

(assert (=> bm!13716 (= call!13718 (getCurrentListMapNoExtraKeys!131 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13717 () Bool)

(declare-fun call!13722 () Bool)

(declare-fun lt!65910 () ListLongMap!1633)

(assert (=> bm!13717 (= call!13722 (contains!864 lt!65910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127407 () Bool)

(declare-fun e!83160 () Bool)

(declare-fun e!83164 () Bool)

(assert (=> b!127407 (= e!83160 e!83164)))

(declare-fun res!61569 () Bool)

(assert (=> b!127407 (=> (not res!61569) (not e!83164))))

(assert (=> b!127407 (= res!61569 (contains!864 lt!65910 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!127407 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun bm!13718 () Bool)

(assert (=> bm!13718 (= call!13724 call!13721)))

(declare-fun b!127408 () Bool)

(declare-fun e!83167 () ListLongMap!1633)

(declare-fun call!13720 () ListLongMap!1633)

(assert (=> b!127408 (= e!83167 call!13720)))

(declare-fun b!127409 () Bool)

(declare-fun res!61565 () Bool)

(assert (=> b!127409 (=> (not res!61565) (not e!83165))))

(assert (=> b!127409 (= res!61565 e!83160)))

(declare-fun res!61566 () Bool)

(assert (=> b!127409 (=> res!61566 e!83160)))

(declare-fun e!83163 () Bool)

(assert (=> b!127409 (= res!61566 (not e!83163))))

(declare-fun res!61571 () Bool)

(assert (=> b!127409 (=> (not res!61571) (not e!83163))))

(assert (=> b!127409 (= res!61571 (bvslt #b00000000000000000000000000000000 (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun b!127410 () Bool)

(declare-fun e!83166 () Bool)

(assert (=> b!127410 (= e!83166 (validKeyInArray!0 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!127411 () Bool)

(declare-fun e!83161 () Bool)

(assert (=> b!127411 (= e!83161 (= (apply!111 lt!65910 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 newMap!16)))))

(declare-fun b!127412 () Bool)

(declare-fun res!61572 () Bool)

(assert (=> b!127412 (=> (not res!61572) (not e!83165))))

(declare-fun e!83162 () Bool)

(assert (=> b!127412 (= res!61572 e!83162)))

(declare-fun c!23378 () Bool)

(assert (=> b!127412 (= c!23378 (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13719 () Bool)

(assert (=> bm!13719 (= call!13720 call!13723)))

(declare-fun b!127413 () Bool)

(assert (=> b!127413 (= e!83170 call!13720)))

(declare-fun b!127414 () Bool)

(assert (=> b!127414 (= e!83167 call!13724)))

(declare-fun bm!13720 () Bool)

(assert (=> bm!13720 (= call!13721 call!13718)))

(declare-fun b!127415 () Bool)

(assert (=> b!127415 (= e!83172 e!83161)))

(declare-fun res!61568 () Bool)

(assert (=> b!127415 (= res!61568 call!13722)))

(assert (=> b!127415 (=> (not res!61568) (not e!83161))))

(declare-fun b!127416 () Bool)

(declare-fun c!23381 () Bool)

(assert (=> b!127416 (= c!23381 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127416 (= e!83170 e!83167)))

(declare-fun b!127417 () Bool)

(assert (=> b!127417 (= e!83172 (not call!13722))))

(declare-fun b!127418 () Bool)

(assert (=> b!127418 (= e!83164 (= (apply!111 lt!65910 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))))))))

(assert (=> b!127418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun b!127419 () Bool)

(declare-fun call!13719 () Bool)

(assert (=> b!127419 (= e!83162 (not call!13719))))

(declare-fun bm!13721 () Bool)

(assert (=> bm!13721 (= call!13719 (contains!864 lt!65910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127420 () Bool)

(declare-fun e!83171 () Bool)

(assert (=> b!127420 (= e!83171 (= (apply!111 lt!65910 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127421 () Bool)

(declare-fun e!83168 () Unit!3928)

(declare-fun lt!65913 () Unit!3928)

(assert (=> b!127421 (= e!83168 lt!65913)))

(declare-fun lt!65898 () ListLongMap!1633)

(assert (=> b!127421 (= lt!65898 (getCurrentListMapNoExtraKeys!131 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65917 () (_ BitVec 64))

(assert (=> b!127421 (= lt!65917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65915 () (_ BitVec 64))

(assert (=> b!127421 (= lt!65915 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65900 () Unit!3928)

(assert (=> b!127421 (= lt!65900 (addStillContains!87 lt!65898 lt!65917 (zeroValue!2645 newMap!16) lt!65915))))

(assert (=> b!127421 (contains!864 (+!164 lt!65898 (tuple2!2525 lt!65917 (zeroValue!2645 newMap!16))) lt!65915)))

(declare-fun lt!65904 () Unit!3928)

(assert (=> b!127421 (= lt!65904 lt!65900)))

(declare-fun lt!65908 () ListLongMap!1633)

(assert (=> b!127421 (= lt!65908 (getCurrentListMapNoExtraKeys!131 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65901 () (_ BitVec 64))

(assert (=> b!127421 (= lt!65901 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65911 () (_ BitVec 64))

(assert (=> b!127421 (= lt!65911 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65906 () Unit!3928)

(assert (=> b!127421 (= lt!65906 (addApplyDifferent!87 lt!65908 lt!65901 (minValue!2645 newMap!16) lt!65911))))

(assert (=> b!127421 (= (apply!111 (+!164 lt!65908 (tuple2!2525 lt!65901 (minValue!2645 newMap!16))) lt!65911) (apply!111 lt!65908 lt!65911))))

(declare-fun lt!65916 () Unit!3928)

(assert (=> b!127421 (= lt!65916 lt!65906)))

(declare-fun lt!65899 () ListLongMap!1633)

(assert (=> b!127421 (= lt!65899 (getCurrentListMapNoExtraKeys!131 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65907 () (_ BitVec 64))

(assert (=> b!127421 (= lt!65907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65897 () (_ BitVec 64))

(assert (=> b!127421 (= lt!65897 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65896 () Unit!3928)

(assert (=> b!127421 (= lt!65896 (addApplyDifferent!87 lt!65899 lt!65907 (zeroValue!2645 newMap!16) lt!65897))))

(assert (=> b!127421 (= (apply!111 (+!164 lt!65899 (tuple2!2525 lt!65907 (zeroValue!2645 newMap!16))) lt!65897) (apply!111 lt!65899 lt!65897))))

(declare-fun lt!65905 () Unit!3928)

(assert (=> b!127421 (= lt!65905 lt!65896)))

(declare-fun lt!65912 () ListLongMap!1633)

(assert (=> b!127421 (= lt!65912 (getCurrentListMapNoExtraKeys!131 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!65903 () (_ BitVec 64))

(assert (=> b!127421 (= lt!65903 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65909 () (_ BitVec 64))

(assert (=> b!127421 (= lt!65909 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!127421 (= lt!65913 (addApplyDifferent!87 lt!65912 lt!65903 (minValue!2645 newMap!16) lt!65909))))

(assert (=> b!127421 (= (apply!111 (+!164 lt!65912 (tuple2!2525 lt!65903 (minValue!2645 newMap!16))) lt!65909) (apply!111 lt!65912 lt!65909))))

(declare-fun b!127422 () Bool)

(declare-fun Unit!3976 () Unit!3928)

(assert (=> b!127422 (= e!83168 Unit!3976)))

(declare-fun d!38647 () Bool)

(assert (=> d!38647 e!83165))

(declare-fun res!61573 () Bool)

(assert (=> d!38647 (=> (not res!61573) (not e!83165))))

(assert (=> d!38647 (= res!61573 (or (bvsge #b00000000000000000000000000000000 (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))))))

(declare-fun lt!65902 () ListLongMap!1633)

(assert (=> d!38647 (= lt!65910 lt!65902)))

(declare-fun lt!65914 () Unit!3928)

(assert (=> d!38647 (= lt!65914 e!83168)))

(declare-fun c!23380 () Bool)

(assert (=> d!38647 (= c!23380 e!83166)))

(declare-fun res!61570 () Bool)

(assert (=> d!38647 (=> (not res!61570) (not e!83166))))

(assert (=> d!38647 (= res!61570 (bvslt #b00000000000000000000000000000000 (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))))

(assert (=> d!38647 (= lt!65902 e!83169)))

(assert (=> d!38647 (= c!23382 (and (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38647 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38647 (= (getCurrentListMap!512 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!65910)))

(declare-fun b!127423 () Bool)

(assert (=> b!127423 (= e!83163 (validKeyInArray!0 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!127424 () Bool)

(assert (=> b!127424 (= e!83169 (+!164 call!13723 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(declare-fun b!127425 () Bool)

(assert (=> b!127425 (= e!83162 e!83171)))

(declare-fun res!61567 () Bool)

(assert (=> b!127425 (= res!61567 call!13719)))

(assert (=> b!127425 (=> (not res!61567) (not e!83171))))

(assert (= (and d!38647 c!23382) b!127424))

(assert (= (and d!38647 (not c!23382)) b!127406))

(assert (= (and b!127406 c!23379) b!127413))

(assert (= (and b!127406 (not c!23379)) b!127416))

(assert (= (and b!127416 c!23381) b!127408))

(assert (= (and b!127416 (not c!23381)) b!127414))

(assert (= (or b!127408 b!127414) bm!13718))

(assert (= (or b!127413 bm!13718) bm!13720))

(assert (= (or b!127413 b!127408) bm!13719))

(assert (= (or b!127424 bm!13720) bm!13716))

(assert (= (or b!127424 bm!13719) bm!13715))

(assert (= (and d!38647 res!61570) b!127410))

(assert (= (and d!38647 c!23380) b!127421))

(assert (= (and d!38647 (not c!23380)) b!127422))

(assert (= (and d!38647 res!61573) b!127409))

(assert (= (and b!127409 res!61571) b!127423))

(assert (= (and b!127409 (not res!61566)) b!127407))

(assert (= (and b!127407 res!61569) b!127418))

(assert (= (and b!127409 res!61565) b!127412))

(assert (= (and b!127412 c!23378) b!127425))

(assert (= (and b!127412 (not c!23378)) b!127419))

(assert (= (and b!127425 res!61567) b!127420))

(assert (= (or b!127425 b!127419) bm!13721))

(assert (= (and b!127412 res!61572) b!127405))

(assert (= (and b!127405 c!23383) b!127415))

(assert (= (and b!127405 (not c!23383)) b!127417))

(assert (= (and b!127415 res!61568) b!127411))

(assert (= (or b!127415 b!127417) bm!13717))

(declare-fun b_lambda!5621 () Bool)

(assert (=> (not b_lambda!5621) (not b!127418)))

(assert (=> b!127418 t!6029))

(declare-fun b_and!7853 () Bool)

(assert (= b_and!7849 (and (=> t!6029 result!3843) b_and!7853)))

(assert (=> b!127418 t!6031))

(declare-fun b_and!7855 () Bool)

(assert (= b_and!7851 (and (=> t!6031 result!3845) b_and!7855)))

(assert (=> b!127423 m!149041))

(assert (=> b!127423 m!149041))

(assert (=> b!127423 m!149051))

(declare-fun m!149151 () Bool)

(assert (=> b!127421 m!149151))

(declare-fun m!149153 () Bool)

(assert (=> b!127421 m!149153))

(declare-fun m!149155 () Bool)

(assert (=> b!127421 m!149155))

(declare-fun m!149157 () Bool)

(assert (=> b!127421 m!149157))

(declare-fun m!149159 () Bool)

(assert (=> b!127421 m!149159))

(assert (=> b!127421 m!149157))

(declare-fun m!149161 () Bool)

(assert (=> b!127421 m!149161))

(declare-fun m!149163 () Bool)

(assert (=> b!127421 m!149163))

(declare-fun m!149165 () Bool)

(assert (=> b!127421 m!149165))

(declare-fun m!149167 () Bool)

(assert (=> b!127421 m!149167))

(assert (=> b!127421 m!149153))

(declare-fun m!149169 () Bool)

(assert (=> b!127421 m!149169))

(declare-fun m!149171 () Bool)

(assert (=> b!127421 m!149171))

(declare-fun m!149173 () Bool)

(assert (=> b!127421 m!149173))

(declare-fun m!149175 () Bool)

(assert (=> b!127421 m!149175))

(declare-fun m!149177 () Bool)

(assert (=> b!127421 m!149177))

(declare-fun m!149179 () Bool)

(assert (=> b!127421 m!149179))

(assert (=> b!127421 m!149041))

(assert (=> b!127421 m!149161))

(assert (=> b!127421 m!149173))

(declare-fun m!149181 () Bool)

(assert (=> b!127421 m!149181))

(declare-fun m!149183 () Bool)

(assert (=> bm!13721 m!149183))

(declare-fun m!149185 () Bool)

(assert (=> bm!13715 m!149185))

(assert (=> bm!13716 m!149179))

(declare-fun m!149187 () Bool)

(assert (=> b!127411 m!149187))

(assert (=> b!127410 m!149041))

(assert (=> b!127410 m!149041))

(assert (=> b!127410 m!149051))

(assert (=> b!127407 m!149041))

(assert (=> b!127407 m!149041))

(declare-fun m!149189 () Bool)

(assert (=> b!127407 m!149189))

(assert (=> b!127418 m!147569))

(assert (=> b!127418 m!149041))

(declare-fun m!149191 () Bool)

(assert (=> b!127418 m!149191))

(assert (=> b!127418 m!149041))

(declare-fun m!149193 () Bool)

(assert (=> b!127418 m!149193))

(assert (=> b!127418 m!149193))

(assert (=> b!127418 m!147569))

(declare-fun m!149195 () Bool)

(assert (=> b!127418 m!149195))

(declare-fun m!149197 () Bool)

(assert (=> bm!13717 m!149197))

(declare-fun m!149199 () Bool)

(assert (=> b!127424 m!149199))

(declare-fun m!149201 () Bool)

(assert (=> b!127420 m!149201))

(assert (=> d!38647 m!147517))

(assert (=> d!38159 d!38647))

(declare-fun d!38649 () Bool)

(assert (=> d!38649 (arrayContainsKey!0 lt!65305 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!65920 () Unit!3928)

(declare-fun choose!13 (array!4681 (_ BitVec 64) (_ BitVec 32)) Unit!3928)

(assert (=> d!38649 (= lt!65920 (choose!13 lt!65305 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))))))

(assert (=> d!38649 (bvsge (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) #b00000000000000000000000000000000)))

(assert (=> d!38649 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!65305 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160))) lt!65920)))

(declare-fun bs!5291 () Bool)

(assert (= bs!5291 d!38649))

(assert (=> bs!5291 m!147207))

(assert (=> bs!5291 m!147459))

(assert (=> bs!5291 m!147207))

(declare-fun m!149203 () Bool)

(assert (=> bs!5291 m!149203))

(assert (=> d!38159 d!38649))

(declare-fun b!127426 () Bool)

(declare-fun e!83176 () Bool)

(declare-fun call!13725 () Bool)

(assert (=> b!127426 (= e!83176 call!13725)))

(declare-fun b!127427 () Bool)

(assert (=> b!127427 (= e!83176 call!13725)))

(declare-fun b!127428 () Bool)

(declare-fun e!83174 () Bool)

(assert (=> b!127428 (= e!83174 e!83176)))

(declare-fun c!23384 () Bool)

(assert (=> b!127428 (= c!23384 (validKeyInArray!0 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) lt!65317)))))

(declare-fun b!127429 () Bool)

(declare-fun e!83175 () Bool)

(assert (=> b!127429 (= e!83175 e!83174)))

(declare-fun res!61575 () Bool)

(assert (=> b!127429 (=> (not res!61575) (not e!83174))))

(declare-fun e!83173 () Bool)

(assert (=> b!127429 (= res!61575 (not e!83173))))

(declare-fun res!61574 () Bool)

(assert (=> b!127429 (=> (not res!61574) (not e!83173))))

(assert (=> b!127429 (= res!61574 (validKeyInArray!0 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) lt!65317)))))

(declare-fun b!127430 () Bool)

(assert (=> b!127430 (= e!83173 (contains!867 lt!65313 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) lt!65317)))))

(declare-fun bm!13722 () Bool)

(assert (=> bm!13722 (= call!13725 (arrayNoDuplicates!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) (bvadd lt!65317 #b00000000000000000000000000000001) (ite c!23384 (Cons!1676 (select (arr!2216 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16)))) lt!65317) lt!65313) lt!65313)))))

(declare-fun d!38651 () Bool)

(declare-fun res!61576 () Bool)

(assert (=> d!38651 (=> res!61576 e!83175)))

(assert (=> d!38651 (= res!61576 (bvsge lt!65317 (size!2480 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))))))))

(assert (=> d!38651 (= (arrayNoDuplicates!0 (array!4682 (store (arr!2216 (_keys!4515 newMap!16)) (ite c!23085 (index!3214 lt!65160) (index!3211 lt!65160)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2480 (_keys!4515 newMap!16))) lt!65317 lt!65313) e!83175)))

(assert (= (and d!38651 (not res!61576)) b!127429))

(assert (= (and b!127429 res!61574) b!127430))

(assert (= (and b!127429 res!61575) b!127428))

(assert (= (and b!127428 c!23384) b!127426))

(assert (= (and b!127428 (not c!23384)) b!127427))

(assert (= (or b!127426 b!127427) bm!13722))

(declare-fun m!149205 () Bool)

(assert (=> b!127428 m!149205))

(assert (=> b!127428 m!149205))

(declare-fun m!149207 () Bool)

(assert (=> b!127428 m!149207))

(assert (=> b!127429 m!149205))

(assert (=> b!127429 m!149205))

(assert (=> b!127429 m!149207))

(assert (=> b!127430 m!149205))

(assert (=> b!127430 m!149205))

(declare-fun m!149209 () Bool)

(assert (=> b!127430 m!149209))

(assert (=> bm!13722 m!149205))

(declare-fun m!149211 () Bool)

(assert (=> bm!13722 m!149211))

(assert (=> d!38159 d!38651))

(declare-fun d!38653 () Bool)

(declare-fun e!83177 () Bool)

(assert (=> d!38653 e!83177))

(declare-fun res!61578 () Bool)

(assert (=> d!38653 (=> (not res!61578) (not e!83177))))

(declare-fun lt!65921 () ListLongMap!1633)

(assert (=> d!38653 (= res!61578 (contains!864 lt!65921 (_1!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(declare-fun lt!65922 () List!1678)

(assert (=> d!38653 (= lt!65921 (ListLongMap!1634 lt!65922))))

(declare-fun lt!65924 () Unit!3928)

(declare-fun lt!65923 () Unit!3928)

(assert (=> d!38653 (= lt!65924 lt!65923)))

(assert (=> d!38653 (= (getValueByKey!168 lt!65922 (_1!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38653 (= lt!65923 (lemmaContainsTupThenGetReturnValue!83 lt!65922 (_1!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (_2!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38653 (= lt!65922 (insertStrictlySorted!86 (toList!832 (ite c!23128 call!13605 (ite c!23125 call!13608 call!13611))) (_1!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (_2!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(assert (=> d!38653 (= (+!164 (ite c!23128 call!13605 (ite c!23125 call!13608 call!13611)) (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) lt!65921)))

(declare-fun b!127431 () Bool)

(declare-fun res!61577 () Bool)

(assert (=> b!127431 (=> (not res!61577) (not e!83177))))

(assert (=> b!127431 (= res!61577 (= (getValueByKey!168 (toList!832 lt!65921) (_1!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))) (Some!173 (_2!1273 (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))))

(declare-fun b!127432 () Bool)

(assert (=> b!127432 (= e!83177 (contains!866 (toList!832 lt!65921) (ite (or c!23128 c!23125) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (= (and d!38653 res!61578) b!127431))

(assert (= (and b!127431 res!61577) b!127432))

(declare-fun m!149213 () Bool)

(assert (=> d!38653 m!149213))

(declare-fun m!149215 () Bool)

(assert (=> d!38653 m!149215))

(declare-fun m!149217 () Bool)

(assert (=> d!38653 m!149217))

(declare-fun m!149219 () Bool)

(assert (=> d!38653 m!149219))

(declare-fun m!149221 () Bool)

(assert (=> b!127431 m!149221))

(declare-fun m!149223 () Bool)

(assert (=> b!127432 m!149223))

(assert (=> bm!13602 d!38653))

(assert (=> b!126513 d!38489))

(declare-fun d!38655 () Bool)

(assert (=> d!38655 (= (apply!111 lt!65358 lt!65355) (get!1456 (getValueByKey!168 (toList!832 lt!65358) lt!65355)))))

(declare-fun bs!5292 () Bool)

(assert (= bs!5292 d!38655))

(declare-fun m!149225 () Bool)

(assert (=> bs!5292 m!149225))

(assert (=> bs!5292 m!149225))

(declare-fun m!149227 () Bool)

(assert (=> bs!5292 m!149227))

(assert (=> b!126513 d!38655))

(declare-fun d!38657 () Bool)

(declare-fun e!83178 () Bool)

(assert (=> d!38657 e!83178))

(declare-fun res!61580 () Bool)

(assert (=> d!38657 (=> (not res!61580) (not e!83178))))

(declare-fun lt!65925 () ListLongMap!1633)

(assert (=> d!38657 (= res!61580 (contains!864 lt!65925 (_1!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))))))

(declare-fun lt!65926 () List!1678)

(assert (=> d!38657 (= lt!65925 (ListLongMap!1634 lt!65926))))

(declare-fun lt!65928 () Unit!3928)

(declare-fun lt!65927 () Unit!3928)

(assert (=> d!38657 (= lt!65928 lt!65927)))

(assert (=> d!38657 (= (getValueByKey!168 lt!65926 (_1!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38657 (= lt!65927 (lemmaContainsTupThenGetReturnValue!83 lt!65926 (_1!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38657 (= lt!65926 (insertStrictlySorted!86 (toList!832 lt!65344) (_1!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38657 (= (+!164 lt!65344 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16))) lt!65925)))

(declare-fun b!127433 () Bool)

(declare-fun res!61579 () Bool)

(assert (=> b!127433 (=> (not res!61579) (not e!83178))))

(assert (=> b!127433 (= res!61579 (= (getValueByKey!168 (toList!832 lt!65925) (_1!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16))))))))

(declare-fun b!127434 () Bool)

(assert (=> b!127434 (= e!83178 (contains!866 (toList!832 lt!65925) (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16))))))

(assert (= (and d!38657 res!61580) b!127433))

(assert (= (and b!127433 res!61579) b!127434))

(declare-fun m!149229 () Bool)

(assert (=> d!38657 m!149229))

(declare-fun m!149231 () Bool)

(assert (=> d!38657 m!149231))

(declare-fun m!149233 () Bool)

(assert (=> d!38657 m!149233))

(declare-fun m!149235 () Bool)

(assert (=> d!38657 m!149235))

(declare-fun m!149237 () Bool)

(assert (=> b!127433 m!149237))

(declare-fun m!149239 () Bool)

(assert (=> b!127434 m!149239))

(assert (=> b!126513 d!38657))

(declare-fun d!38659 () Bool)

(declare-fun e!83180 () Bool)

(assert (=> d!38659 e!83180))

(declare-fun res!61581 () Bool)

(assert (=> d!38659 (=> res!61581 e!83180)))

(declare-fun lt!65930 () Bool)

(assert (=> d!38659 (= res!61581 (not lt!65930))))

(declare-fun lt!65929 () Bool)

(assert (=> d!38659 (= lt!65930 lt!65929)))

(declare-fun lt!65932 () Unit!3928)

(declare-fun e!83179 () Unit!3928)

(assert (=> d!38659 (= lt!65932 e!83179)))

(declare-fun c!23385 () Bool)

(assert (=> d!38659 (= c!23385 lt!65929)))

(assert (=> d!38659 (= lt!65929 (containsKey!171 (toList!832 (+!164 lt!65344 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))) lt!65361))))

(assert (=> d!38659 (= (contains!864 (+!164 lt!65344 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16))) lt!65361) lt!65930)))

(declare-fun b!127435 () Bool)

(declare-fun lt!65931 () Unit!3928)

(assert (=> b!127435 (= e!83179 lt!65931)))

(assert (=> b!127435 (= lt!65931 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (+!164 lt!65344 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))) lt!65361))))

(assert (=> b!127435 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65344 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))) lt!65361))))

(declare-fun b!127436 () Bool)

(declare-fun Unit!3977 () Unit!3928)

(assert (=> b!127436 (= e!83179 Unit!3977)))

(declare-fun b!127437 () Bool)

(assert (=> b!127437 (= e!83180 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65344 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16)))) lt!65361)))))

(assert (= (and d!38659 c!23385) b!127435))

(assert (= (and d!38659 (not c!23385)) b!127436))

(assert (= (and d!38659 (not res!61581)) b!127437))

(declare-fun m!149241 () Bool)

(assert (=> d!38659 m!149241))

(declare-fun m!149243 () Bool)

(assert (=> b!127435 m!149243))

(declare-fun m!149245 () Bool)

(assert (=> b!127435 m!149245))

(assert (=> b!127435 m!149245))

(declare-fun m!149247 () Bool)

(assert (=> b!127435 m!149247))

(assert (=> b!127437 m!149245))

(assert (=> b!127437 m!149245))

(assert (=> b!127437 m!149247))

(assert (=> b!126513 d!38659))

(declare-fun d!38661 () Bool)

(assert (=> d!38661 (contains!864 (+!164 lt!65344 (tuple2!2525 lt!65363 (zeroValue!2645 newMap!16))) lt!65361)))

(declare-fun lt!65933 () Unit!3928)

(assert (=> d!38661 (= lt!65933 (choose!773 lt!65344 lt!65363 (zeroValue!2645 newMap!16) lt!65361))))

(assert (=> d!38661 (contains!864 lt!65344 lt!65361)))

(assert (=> d!38661 (= (addStillContains!87 lt!65344 lt!65363 (zeroValue!2645 newMap!16) lt!65361) lt!65933)))

(declare-fun bs!5293 () Bool)

(assert (= bs!5293 d!38661))

(assert (=> bs!5293 m!147551))

(assert (=> bs!5293 m!147551))

(assert (=> bs!5293 m!147553))

(declare-fun m!149249 () Bool)

(assert (=> bs!5293 m!149249))

(declare-fun m!149251 () Bool)

(assert (=> bs!5293 m!149251))

(assert (=> b!126513 d!38661))

(declare-fun d!38663 () Bool)

(assert (=> d!38663 (= (apply!111 (+!164 lt!65354 (tuple2!2525 lt!65347 (minValue!2645 newMap!16))) lt!65357) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65354 (tuple2!2525 lt!65347 (minValue!2645 newMap!16)))) lt!65357)))))

(declare-fun bs!5294 () Bool)

(assert (= bs!5294 d!38663))

(declare-fun m!149253 () Bool)

(assert (=> bs!5294 m!149253))

(assert (=> bs!5294 m!149253))

(declare-fun m!149255 () Bool)

(assert (=> bs!5294 m!149255))

(assert (=> b!126513 d!38663))

(declare-fun d!38665 () Bool)

(assert (=> d!38665 (= (apply!111 (+!164 lt!65354 (tuple2!2525 lt!65347 (minValue!2645 newMap!16))) lt!65357) (apply!111 lt!65354 lt!65357))))

(declare-fun lt!65934 () Unit!3928)

(assert (=> d!38665 (= lt!65934 (choose!772 lt!65354 lt!65347 (minValue!2645 newMap!16) lt!65357))))

(declare-fun e!83181 () Bool)

(assert (=> d!38665 e!83181))

(declare-fun res!61582 () Bool)

(assert (=> d!38665 (=> (not res!61582) (not e!83181))))

(assert (=> d!38665 (= res!61582 (contains!864 lt!65354 lt!65357))))

(assert (=> d!38665 (= (addApplyDifferent!87 lt!65354 lt!65347 (minValue!2645 newMap!16) lt!65357) lt!65934)))

(declare-fun b!127438 () Bool)

(assert (=> b!127438 (= e!83181 (not (= lt!65357 lt!65347)))))

(assert (= (and d!38665 res!61582) b!127438))

(assert (=> d!38665 m!147535))

(assert (=> d!38665 m!147535))

(assert (=> d!38665 m!147537))

(declare-fun m!149257 () Bool)

(assert (=> d!38665 m!149257))

(assert (=> d!38665 m!147533))

(declare-fun m!149259 () Bool)

(assert (=> d!38665 m!149259))

(assert (=> b!126513 d!38665))

(declare-fun d!38667 () Bool)

(assert (=> d!38667 (= (apply!111 (+!164 lt!65358 (tuple2!2525 lt!65349 (minValue!2645 newMap!16))) lt!65355) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65358 (tuple2!2525 lt!65349 (minValue!2645 newMap!16)))) lt!65355)))))

(declare-fun bs!5295 () Bool)

(assert (= bs!5295 d!38667))

(declare-fun m!149261 () Bool)

(assert (=> bs!5295 m!149261))

(assert (=> bs!5295 m!149261))

(declare-fun m!149263 () Bool)

(assert (=> bs!5295 m!149263))

(assert (=> b!126513 d!38667))

(declare-fun d!38669 () Bool)

(declare-fun e!83182 () Bool)

(assert (=> d!38669 e!83182))

(declare-fun res!61584 () Bool)

(assert (=> d!38669 (=> (not res!61584) (not e!83182))))

(declare-fun lt!65935 () ListLongMap!1633)

(assert (=> d!38669 (= res!61584 (contains!864 lt!65935 (_1!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16)))))))

(declare-fun lt!65936 () List!1678)

(assert (=> d!38669 (= lt!65935 (ListLongMap!1634 lt!65936))))

(declare-fun lt!65938 () Unit!3928)

(declare-fun lt!65937 () Unit!3928)

(assert (=> d!38669 (= lt!65938 lt!65937)))

(assert (=> d!38669 (= (getValueByKey!168 lt!65936 (_1!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38669 (= lt!65937 (lemmaContainsTupThenGetReturnValue!83 lt!65936 (_1!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38669 (= lt!65936 (insertStrictlySorted!86 (toList!832 lt!65345) (_1!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16)))))))

(assert (=> d!38669 (= (+!164 lt!65345 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16))) lt!65935)))

(declare-fun b!127439 () Bool)

(declare-fun res!61583 () Bool)

(assert (=> b!127439 (=> (not res!61583) (not e!83182))))

(assert (=> b!127439 (= res!61583 (= (getValueByKey!168 (toList!832 lt!65935) (_1!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16))))))))

(declare-fun b!127440 () Bool)

(assert (=> b!127440 (= e!83182 (contains!866 (toList!832 lt!65935) (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16))))))

(assert (= (and d!38669 res!61584) b!127439))

(assert (= (and b!127439 res!61583) b!127440))

(declare-fun m!149265 () Bool)

(assert (=> d!38669 m!149265))

(declare-fun m!149267 () Bool)

(assert (=> d!38669 m!149267))

(declare-fun m!149269 () Bool)

(assert (=> d!38669 m!149269))

(declare-fun m!149271 () Bool)

(assert (=> d!38669 m!149271))

(declare-fun m!149273 () Bool)

(assert (=> b!127439 m!149273))

(declare-fun m!149275 () Bool)

(assert (=> b!127440 m!149275))

(assert (=> b!126513 d!38669))

(declare-fun d!38671 () Bool)

(declare-fun e!83183 () Bool)

(assert (=> d!38671 e!83183))

(declare-fun res!61586 () Bool)

(assert (=> d!38671 (=> (not res!61586) (not e!83183))))

(declare-fun lt!65939 () ListLongMap!1633)

(assert (=> d!38671 (= res!61586 (contains!864 lt!65939 (_1!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16)))))))

(declare-fun lt!65940 () List!1678)

(assert (=> d!38671 (= lt!65939 (ListLongMap!1634 lt!65940))))

(declare-fun lt!65942 () Unit!3928)

(declare-fun lt!65941 () Unit!3928)

(assert (=> d!38671 (= lt!65942 lt!65941)))

(assert (=> d!38671 (= (getValueByKey!168 lt!65940 (_1!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16)))))))

(assert (=> d!38671 (= lt!65941 (lemmaContainsTupThenGetReturnValue!83 lt!65940 (_1!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16)))))))

(assert (=> d!38671 (= lt!65940 (insertStrictlySorted!86 (toList!832 lt!65354) (_1!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16)))))))

(assert (=> d!38671 (= (+!164 lt!65354 (tuple2!2525 lt!65347 (minValue!2645 newMap!16))) lt!65939)))

(declare-fun b!127441 () Bool)

(declare-fun res!61585 () Bool)

(assert (=> b!127441 (=> (not res!61585) (not e!83183))))

(assert (=> b!127441 (= res!61585 (= (getValueByKey!168 (toList!832 lt!65939) (_1!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65347 (minValue!2645 newMap!16))))))))

(declare-fun b!127442 () Bool)

(assert (=> b!127442 (= e!83183 (contains!866 (toList!832 lt!65939) (tuple2!2525 lt!65347 (minValue!2645 newMap!16))))))

(assert (= (and d!38671 res!61586) b!127441))

(assert (= (and b!127441 res!61585) b!127442))

(declare-fun m!149277 () Bool)

(assert (=> d!38671 m!149277))

(declare-fun m!149279 () Bool)

(assert (=> d!38671 m!149279))

(declare-fun m!149281 () Bool)

(assert (=> d!38671 m!149281))

(declare-fun m!149283 () Bool)

(assert (=> d!38671 m!149283))

(declare-fun m!149285 () Bool)

(assert (=> b!127441 m!149285))

(declare-fun m!149287 () Bool)

(assert (=> b!127442 m!149287))

(assert (=> b!126513 d!38671))

(declare-fun d!38673 () Bool)

(assert (=> d!38673 (= (apply!111 (+!164 lt!65345 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16))) lt!65343) (apply!111 lt!65345 lt!65343))))

(declare-fun lt!65943 () Unit!3928)

(assert (=> d!38673 (= lt!65943 (choose!772 lt!65345 lt!65353 (zeroValue!2645 newMap!16) lt!65343))))

(declare-fun e!83184 () Bool)

(assert (=> d!38673 e!83184))

(declare-fun res!61587 () Bool)

(assert (=> d!38673 (=> (not res!61587) (not e!83184))))

(assert (=> d!38673 (= res!61587 (contains!864 lt!65345 lt!65343))))

(assert (=> d!38673 (= (addApplyDifferent!87 lt!65345 lt!65353 (zeroValue!2645 newMap!16) lt!65343) lt!65943)))

(declare-fun b!127443 () Bool)

(assert (=> b!127443 (= e!83184 (not (= lt!65343 lt!65353)))))

(assert (= (and d!38673 res!61587) b!127443))

(assert (=> d!38673 m!147531))

(assert (=> d!38673 m!147531))

(assert (=> d!38673 m!147547))

(declare-fun m!149289 () Bool)

(assert (=> d!38673 m!149289))

(assert (=> d!38673 m!147529))

(declare-fun m!149291 () Bool)

(assert (=> d!38673 m!149291))

(assert (=> b!126513 d!38673))

(declare-fun d!38675 () Bool)

(assert (=> d!38675 (= (apply!111 lt!65354 lt!65357) (get!1456 (getValueByKey!168 (toList!832 lt!65354) lt!65357)))))

(declare-fun bs!5296 () Bool)

(assert (= bs!5296 d!38675))

(declare-fun m!149293 () Bool)

(assert (=> bs!5296 m!149293))

(assert (=> bs!5296 m!149293))

(declare-fun m!149295 () Bool)

(assert (=> bs!5296 m!149295))

(assert (=> b!126513 d!38675))

(declare-fun d!38677 () Bool)

(assert (=> d!38677 (= (apply!111 lt!65345 lt!65343) (get!1456 (getValueByKey!168 (toList!832 lt!65345) lt!65343)))))

(declare-fun bs!5297 () Bool)

(assert (= bs!5297 d!38677))

(declare-fun m!149297 () Bool)

(assert (=> bs!5297 m!149297))

(assert (=> bs!5297 m!149297))

(declare-fun m!149299 () Bool)

(assert (=> bs!5297 m!149299))

(assert (=> b!126513 d!38677))

(declare-fun d!38679 () Bool)

(declare-fun e!83185 () Bool)

(assert (=> d!38679 e!83185))

(declare-fun res!61589 () Bool)

(assert (=> d!38679 (=> (not res!61589) (not e!83185))))

(declare-fun lt!65944 () ListLongMap!1633)

(assert (=> d!38679 (= res!61589 (contains!864 lt!65944 (_1!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16)))))))

(declare-fun lt!65945 () List!1678)

(assert (=> d!38679 (= lt!65944 (ListLongMap!1634 lt!65945))))

(declare-fun lt!65947 () Unit!3928)

(declare-fun lt!65946 () Unit!3928)

(assert (=> d!38679 (= lt!65947 lt!65946)))

(assert (=> d!38679 (= (getValueByKey!168 lt!65945 (_1!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16)))))))

(assert (=> d!38679 (= lt!65946 (lemmaContainsTupThenGetReturnValue!83 lt!65945 (_1!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16)))))))

(assert (=> d!38679 (= lt!65945 (insertStrictlySorted!86 (toList!832 lt!65358) (_1!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16)))))))

(assert (=> d!38679 (= (+!164 lt!65358 (tuple2!2525 lt!65349 (minValue!2645 newMap!16))) lt!65944)))

(declare-fun b!127444 () Bool)

(declare-fun res!61588 () Bool)

(assert (=> b!127444 (=> (not res!61588) (not e!83185))))

(assert (=> b!127444 (= res!61588 (= (getValueByKey!168 (toList!832 lt!65944) (_1!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 lt!65349 (minValue!2645 newMap!16))))))))

(declare-fun b!127445 () Bool)

(assert (=> b!127445 (= e!83185 (contains!866 (toList!832 lt!65944) (tuple2!2525 lt!65349 (minValue!2645 newMap!16))))))

(assert (= (and d!38679 res!61589) b!127444))

(assert (= (and b!127444 res!61588) b!127445))

(declare-fun m!149301 () Bool)

(assert (=> d!38679 m!149301))

(declare-fun m!149303 () Bool)

(assert (=> d!38679 m!149303))

(declare-fun m!149305 () Bool)

(assert (=> d!38679 m!149305))

(declare-fun m!149307 () Bool)

(assert (=> d!38679 m!149307))

(declare-fun m!149309 () Bool)

(assert (=> b!127444 m!149309))

(declare-fun m!149311 () Bool)

(assert (=> b!127445 m!149311))

(assert (=> b!126513 d!38679))

(declare-fun d!38681 () Bool)

(assert (=> d!38681 (= (apply!111 (+!164 lt!65345 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16))) lt!65343) (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65345 (tuple2!2525 lt!65353 (zeroValue!2645 newMap!16)))) lt!65343)))))

(declare-fun bs!5298 () Bool)

(assert (= bs!5298 d!38681))

(declare-fun m!149313 () Bool)

(assert (=> bs!5298 m!149313))

(assert (=> bs!5298 m!149313))

(declare-fun m!149315 () Bool)

(assert (=> bs!5298 m!149315))

(assert (=> b!126513 d!38681))

(declare-fun d!38683 () Bool)

(assert (=> d!38683 (= (apply!111 (+!164 lt!65358 (tuple2!2525 lt!65349 (minValue!2645 newMap!16))) lt!65355) (apply!111 lt!65358 lt!65355))))

(declare-fun lt!65948 () Unit!3928)

(assert (=> d!38683 (= lt!65948 (choose!772 lt!65358 lt!65349 (minValue!2645 newMap!16) lt!65355))))

(declare-fun e!83186 () Bool)

(assert (=> d!38683 e!83186))

(declare-fun res!61590 () Bool)

(assert (=> d!38683 (=> (not res!61590) (not e!83186))))

(assert (=> d!38683 (= res!61590 (contains!864 lt!65358 lt!65355))))

(assert (=> d!38683 (= (addApplyDifferent!87 lt!65358 lt!65349 (minValue!2645 newMap!16) lt!65355) lt!65948)))

(declare-fun b!127446 () Bool)

(assert (=> b!127446 (= e!83186 (not (= lt!65355 lt!65349)))))

(assert (= (and d!38683 res!61590) b!127446))

(assert (=> d!38683 m!147539))

(assert (=> d!38683 m!147539))

(assert (=> d!38683 m!147541))

(declare-fun m!149317 () Bool)

(assert (=> d!38683 m!149317))

(assert (=> d!38683 m!147549))

(declare-fun m!149319 () Bool)

(assert (=> d!38683 m!149319))

(assert (=> b!126513 d!38683))

(declare-fun d!38685 () Bool)

(declare-fun res!61591 () Bool)

(declare-fun e!83187 () Bool)

(assert (=> d!38685 (=> (not res!61591) (not e!83187))))

(assert (=> d!38685 (= res!61591 (simpleValid!87 (_2!1274 lt!65321)))))

(assert (=> d!38685 (= (valid!520 (_2!1274 lt!65321)) e!83187)))

(declare-fun b!127447 () Bool)

(declare-fun res!61592 () Bool)

(assert (=> b!127447 (=> (not res!61592) (not e!83187))))

(assert (=> b!127447 (= res!61592 (= (arrayCountValidKeys!0 (_keys!4515 (_2!1274 lt!65321)) #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65321)))) (_size!579 (_2!1274 lt!65321))))))

(declare-fun b!127448 () Bool)

(declare-fun res!61593 () Bool)

(assert (=> b!127448 (=> (not res!61593) (not e!83187))))

(assert (=> b!127448 (= res!61593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4515 (_2!1274 lt!65321)) (mask!7038 (_2!1274 lt!65321))))))

(declare-fun b!127449 () Bool)

(assert (=> b!127449 (= e!83187 (arrayNoDuplicates!0 (_keys!4515 (_2!1274 lt!65321)) #b00000000000000000000000000000000 Nil!1677))))

(assert (= (and d!38685 res!61591) b!127447))

(assert (= (and b!127447 res!61592) b!127448))

(assert (= (and b!127448 res!61593) b!127449))

(declare-fun m!149321 () Bool)

(assert (=> d!38685 m!149321))

(declare-fun m!149323 () Bool)

(assert (=> b!127447 m!149323))

(declare-fun m!149325 () Bool)

(assert (=> b!127448 m!149325))

(declare-fun m!149327 () Bool)

(assert (=> b!127449 m!149327))

(assert (=> b!126471 d!38685))

(declare-fun b!127450 () Bool)

(declare-fun e!83189 () Bool)

(declare-fun e!83188 () Bool)

(assert (=> b!127450 (= e!83189 e!83188)))

(declare-fun lt!65951 () (_ BitVec 64))

(assert (=> b!127450 (= lt!65951 (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!65950 () Unit!3928)

(assert (=> b!127450 (= lt!65950 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4515 newMap!16) lt!65951 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!127450 (arrayContainsKey!0 (_keys!4515 newMap!16) lt!65951 #b00000000000000000000000000000000)))

(declare-fun lt!65949 () Unit!3928)

(assert (=> b!127450 (= lt!65949 lt!65950)))

(declare-fun res!61595 () Bool)

(assert (=> b!127450 (= res!61595 (= (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4515 newMap!16) (mask!7038 newMap!16)) (Found!264 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!127450 (=> (not res!61595) (not e!83188))))

(declare-fun bm!13723 () Bool)

(declare-fun call!13726 () Bool)

(assert (=> bm!13723 (= call!13726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun b!127451 () Bool)

(assert (=> b!127451 (= e!83188 call!13726)))

(declare-fun b!127452 () Bool)

(declare-fun e!83190 () Bool)

(assert (=> b!127452 (= e!83190 e!83189)))

(declare-fun c!23386 () Bool)

(assert (=> b!127452 (= c!23386 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!38687 () Bool)

(declare-fun res!61594 () Bool)

(assert (=> d!38687 (=> res!61594 e!83190)))

(assert (=> d!38687 (= res!61594 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38687 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4515 newMap!16) (mask!7038 newMap!16)) e!83190)))

(declare-fun b!127453 () Bool)

(assert (=> b!127453 (= e!83189 call!13726)))

(assert (= (and d!38687 (not res!61594)) b!127452))

(assert (= (and b!127452 c!23386) b!127450))

(assert (= (and b!127452 (not c!23386)) b!127453))

(assert (= (and b!127450 res!61595) b!127451))

(assert (= (or b!127451 b!127453) bm!13723))

(assert (=> b!127450 m!148287))

(declare-fun m!149329 () Bool)

(assert (=> b!127450 m!149329))

(declare-fun m!149331 () Bool)

(assert (=> b!127450 m!149331))

(assert (=> b!127450 m!148287))

(declare-fun m!149333 () Bool)

(assert (=> b!127450 m!149333))

(declare-fun m!149335 () Bool)

(assert (=> bm!13723 m!149335))

(assert (=> b!127452 m!148287))

(assert (=> b!127452 m!148287))

(assert (=> b!127452 m!148289))

(assert (=> bm!13627 d!38687))

(declare-fun d!38689 () Bool)

(assert (=> d!38689 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!512 (_keys!4515 newMap!16) (array!4684 (store (arr!2217 (_values!2765 newMap!16)) (index!3212 lt!65160) (ValueCellFull!1076 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2481 (_values!2765 newMap!16))) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> d!38689 true))

(declare-fun _$5!125 () Unit!3928)

(assert (=> d!38689 (= (choose!775 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (index!3212 lt!65160) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) _$5!125)))

(declare-fun bs!5299 () Bool)

(assert (= bs!5299 d!38689))

(assert (=> bs!5299 m!147325))

(assert (=> bs!5299 m!147325))

(assert (=> bs!5299 m!147473))

(assert (=> bs!5299 m!147319))

(assert (=> bs!5299 m!147949))

(assert (=> d!38265 d!38689))

(assert (=> d!38265 d!38379))

(declare-fun b!127454 () Bool)

(declare-fun e!83196 () Bool)

(declare-fun e!83203 () Bool)

(assert (=> b!127454 (= e!83196 e!83203)))

(declare-fun c!23392 () Bool)

(assert (=> b!127454 (= c!23392 (not (= (bvand (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127455 () Bool)

(declare-fun e!83200 () ListLongMap!1633)

(declare-fun e!83201 () ListLongMap!1633)

(assert (=> b!127455 (= e!83200 e!83201)))

(declare-fun c!23388 () Bool)

(assert (=> b!127455 (= c!23388 (and (not (= (bvand (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!13730 () ListLongMap!1633)

(declare-fun call!13733 () ListLongMap!1633)

(declare-fun call!13732 () ListLongMap!1633)

(declare-fun call!13727 () ListLongMap!1633)

(declare-fun bm!13724 () Bool)

(declare-fun c!23391 () Bool)

(assert (=> bm!13724 (= call!13732 (+!164 (ite c!23391 call!13727 (ite c!23388 call!13730 call!13733)) (ite (or c!23391 c!23388) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (_2!1274 lt!65152))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (_2!1274 lt!65152))))))))

(declare-fun bm!13725 () Bool)

(assert (=> bm!13725 (= call!13727 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (_2!1274 lt!65152)) (_values!2765 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152)) (extraKeys!2563 (_2!1274 lt!65152)) (zeroValue!2645 (_2!1274 lt!65152)) (minValue!2645 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1274 lt!65152))))))

(declare-fun bm!13726 () Bool)

(declare-fun call!13731 () Bool)

(declare-fun lt!65966 () ListLongMap!1633)

(assert (=> bm!13726 (= call!13731 (contains!864 lt!65966 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127456 () Bool)

(declare-fun e!83191 () Bool)

(declare-fun e!83195 () Bool)

(assert (=> b!127456 (= e!83191 e!83195)))

(declare-fun res!61600 () Bool)

(assert (=> b!127456 (=> (not res!61600) (not e!83195))))

(assert (=> b!127456 (= res!61600 (contains!864 lt!65966 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(assert (=> b!127456 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(declare-fun bm!13727 () Bool)

(assert (=> bm!13727 (= call!13733 call!13730)))

(declare-fun b!127457 () Bool)

(declare-fun e!83198 () ListLongMap!1633)

(declare-fun call!13729 () ListLongMap!1633)

(assert (=> b!127457 (= e!83198 call!13729)))

(declare-fun b!127458 () Bool)

(declare-fun res!61596 () Bool)

(assert (=> b!127458 (=> (not res!61596) (not e!83196))))

(assert (=> b!127458 (= res!61596 e!83191)))

(declare-fun res!61597 () Bool)

(assert (=> b!127458 (=> res!61597 e!83191)))

(declare-fun e!83194 () Bool)

(assert (=> b!127458 (= res!61597 (not e!83194))))

(declare-fun res!61602 () Bool)

(assert (=> b!127458 (=> (not res!61602) (not e!83194))))

(assert (=> b!127458 (= res!61602 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(declare-fun b!127459 () Bool)

(declare-fun e!83197 () Bool)

(assert (=> b!127459 (= e!83197 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(declare-fun b!127460 () Bool)

(declare-fun e!83192 () Bool)

(assert (=> b!127460 (= e!83192 (= (apply!111 lt!65966 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2645 (_2!1274 lt!65152))))))

(declare-fun b!127461 () Bool)

(declare-fun res!61603 () Bool)

(assert (=> b!127461 (=> (not res!61603) (not e!83196))))

(declare-fun e!83193 () Bool)

(assert (=> b!127461 (= res!61603 e!83193)))

(declare-fun c!23387 () Bool)

(assert (=> b!127461 (= c!23387 (not (= (bvand (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13728 () Bool)

(assert (=> bm!13728 (= call!13729 call!13732)))

(declare-fun b!127462 () Bool)

(assert (=> b!127462 (= e!83201 call!13729)))

(declare-fun b!127463 () Bool)

(assert (=> b!127463 (= e!83198 call!13733)))

(declare-fun bm!13729 () Bool)

(assert (=> bm!13729 (= call!13730 call!13727)))

(declare-fun b!127464 () Bool)

(assert (=> b!127464 (= e!83203 e!83192)))

(declare-fun res!61599 () Bool)

(assert (=> b!127464 (= res!61599 call!13731)))

(assert (=> b!127464 (=> (not res!61599) (not e!83192))))

(declare-fun b!127465 () Bool)

(declare-fun c!23390 () Bool)

(assert (=> b!127465 (= c!23390 (and (not (= (bvand (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127465 (= e!83201 e!83198)))

(declare-fun b!127466 () Bool)

(assert (=> b!127466 (= e!83203 (not call!13731))))

(declare-fun b!127467 () Bool)

(assert (=> b!127467 (= e!83195 (= (apply!111 lt!65966 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (_values!2765 (_2!1274 lt!65152))) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 (_2!1274 lt!65152)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (_values!2765 (_2!1274 lt!65152)))))))

(assert (=> b!127467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(declare-fun b!127468 () Bool)

(declare-fun call!13728 () Bool)

(assert (=> b!127468 (= e!83193 (not call!13728))))

(declare-fun bm!13730 () Bool)

(assert (=> bm!13730 (= call!13728 (contains!864 lt!65966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127469 () Bool)

(declare-fun e!83202 () Bool)

(assert (=> b!127469 (= e!83202 (= (apply!111 lt!65966 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 (_2!1274 lt!65152))))))

(declare-fun b!127470 () Bool)

(declare-fun e!83199 () Unit!3928)

(declare-fun lt!65969 () Unit!3928)

(assert (=> b!127470 (= e!83199 lt!65969)))

(declare-fun lt!65954 () ListLongMap!1633)

(assert (=> b!127470 (= lt!65954 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (_2!1274 lt!65152)) (_values!2765 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152)) (extraKeys!2563 (_2!1274 lt!65152)) (zeroValue!2645 (_2!1274 lt!65152)) (minValue!2645 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1274 lt!65152))))))

(declare-fun lt!65973 () (_ BitVec 64))

(assert (=> b!127470 (= lt!65973 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65971 () (_ BitVec 64))

(assert (=> b!127470 (= lt!65971 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000))))

(declare-fun lt!65956 () Unit!3928)

(assert (=> b!127470 (= lt!65956 (addStillContains!87 lt!65954 lt!65973 (zeroValue!2645 (_2!1274 lt!65152)) lt!65971))))

(assert (=> b!127470 (contains!864 (+!164 lt!65954 (tuple2!2525 lt!65973 (zeroValue!2645 (_2!1274 lt!65152)))) lt!65971)))

(declare-fun lt!65960 () Unit!3928)

(assert (=> b!127470 (= lt!65960 lt!65956)))

(declare-fun lt!65964 () ListLongMap!1633)

(assert (=> b!127470 (= lt!65964 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (_2!1274 lt!65152)) (_values!2765 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152)) (extraKeys!2563 (_2!1274 lt!65152)) (zeroValue!2645 (_2!1274 lt!65152)) (minValue!2645 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1274 lt!65152))))))

(declare-fun lt!65957 () (_ BitVec 64))

(assert (=> b!127470 (= lt!65957 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65967 () (_ BitVec 64))

(assert (=> b!127470 (= lt!65967 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000))))

(declare-fun lt!65962 () Unit!3928)

(assert (=> b!127470 (= lt!65962 (addApplyDifferent!87 lt!65964 lt!65957 (minValue!2645 (_2!1274 lt!65152)) lt!65967))))

(assert (=> b!127470 (= (apply!111 (+!164 lt!65964 (tuple2!2525 lt!65957 (minValue!2645 (_2!1274 lt!65152)))) lt!65967) (apply!111 lt!65964 lt!65967))))

(declare-fun lt!65972 () Unit!3928)

(assert (=> b!127470 (= lt!65972 lt!65962)))

(declare-fun lt!65955 () ListLongMap!1633)

(assert (=> b!127470 (= lt!65955 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (_2!1274 lt!65152)) (_values!2765 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152)) (extraKeys!2563 (_2!1274 lt!65152)) (zeroValue!2645 (_2!1274 lt!65152)) (minValue!2645 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1274 lt!65152))))))

(declare-fun lt!65963 () (_ BitVec 64))

(assert (=> b!127470 (= lt!65963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65953 () (_ BitVec 64))

(assert (=> b!127470 (= lt!65953 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000))))

(declare-fun lt!65952 () Unit!3928)

(assert (=> b!127470 (= lt!65952 (addApplyDifferent!87 lt!65955 lt!65963 (zeroValue!2645 (_2!1274 lt!65152)) lt!65953))))

(assert (=> b!127470 (= (apply!111 (+!164 lt!65955 (tuple2!2525 lt!65963 (zeroValue!2645 (_2!1274 lt!65152)))) lt!65953) (apply!111 lt!65955 lt!65953))))

(declare-fun lt!65961 () Unit!3928)

(assert (=> b!127470 (= lt!65961 lt!65952)))

(declare-fun lt!65968 () ListLongMap!1633)

(assert (=> b!127470 (= lt!65968 (getCurrentListMapNoExtraKeys!131 (_keys!4515 (_2!1274 lt!65152)) (_values!2765 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152)) (extraKeys!2563 (_2!1274 lt!65152)) (zeroValue!2645 (_2!1274 lt!65152)) (minValue!2645 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1274 lt!65152))))))

(declare-fun lt!65959 () (_ BitVec 64))

(assert (=> b!127470 (= lt!65959 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65965 () (_ BitVec 64))

(assert (=> b!127470 (= lt!65965 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000))))

(assert (=> b!127470 (= lt!65969 (addApplyDifferent!87 lt!65968 lt!65959 (minValue!2645 (_2!1274 lt!65152)) lt!65965))))

(assert (=> b!127470 (= (apply!111 (+!164 lt!65968 (tuple2!2525 lt!65959 (minValue!2645 (_2!1274 lt!65152)))) lt!65965) (apply!111 lt!65968 lt!65965))))

(declare-fun b!127471 () Bool)

(declare-fun Unit!3978 () Unit!3928)

(assert (=> b!127471 (= e!83199 Unit!3978)))

(declare-fun d!38691 () Bool)

(assert (=> d!38691 e!83196))

(declare-fun res!61604 () Bool)

(assert (=> d!38691 (=> (not res!61604) (not e!83196))))

(assert (=> d!38691 (= res!61604 (or (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))))

(declare-fun lt!65958 () ListLongMap!1633)

(assert (=> d!38691 (= lt!65966 lt!65958)))

(declare-fun lt!65970 () Unit!3928)

(assert (=> d!38691 (= lt!65970 e!83199)))

(declare-fun c!23389 () Bool)

(assert (=> d!38691 (= c!23389 e!83197)))

(declare-fun res!61601 () Bool)

(assert (=> d!38691 (=> (not res!61601) (not e!83197))))

(assert (=> d!38691 (= res!61601 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(assert (=> d!38691 (= lt!65958 e!83200)))

(assert (=> d!38691 (= c!23391 (and (not (= (bvand (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38691 (validMask!0 (mask!7038 (_2!1274 lt!65152)))))

(assert (=> d!38691 (= (getCurrentListMap!512 (_keys!4515 (_2!1274 lt!65152)) (_values!2765 (_2!1274 lt!65152)) (mask!7038 (_2!1274 lt!65152)) (extraKeys!2563 (_2!1274 lt!65152)) (zeroValue!2645 (_2!1274 lt!65152)) (minValue!2645 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (defaultEntry!2782 (_2!1274 lt!65152))) lt!65966)))

(declare-fun b!127472 () Bool)

(assert (=> b!127472 (= e!83194 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(declare-fun b!127473 () Bool)

(assert (=> b!127473 (= e!83200 (+!164 call!13732 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (_2!1274 lt!65152)))))))

(declare-fun b!127474 () Bool)

(assert (=> b!127474 (= e!83193 e!83202)))

(declare-fun res!61598 () Bool)

(assert (=> b!127474 (= res!61598 call!13728)))

(assert (=> b!127474 (=> (not res!61598) (not e!83202))))

(assert (= (and d!38691 c!23391) b!127473))

(assert (= (and d!38691 (not c!23391)) b!127455))

(assert (= (and b!127455 c!23388) b!127462))

(assert (= (and b!127455 (not c!23388)) b!127465))

(assert (= (and b!127465 c!23390) b!127457))

(assert (= (and b!127465 (not c!23390)) b!127463))

(assert (= (or b!127457 b!127463) bm!13727))

(assert (= (or b!127462 bm!13727) bm!13729))

(assert (= (or b!127462 b!127457) bm!13728))

(assert (= (or b!127473 bm!13729) bm!13725))

(assert (= (or b!127473 bm!13728) bm!13724))

(assert (= (and d!38691 res!61601) b!127459))

(assert (= (and d!38691 c!23389) b!127470))

(assert (= (and d!38691 (not c!23389)) b!127471))

(assert (= (and d!38691 res!61604) b!127458))

(assert (= (and b!127458 res!61602) b!127472))

(assert (= (and b!127458 (not res!61597)) b!127456))

(assert (= (and b!127456 res!61600) b!127467))

(assert (= (and b!127458 res!61596) b!127461))

(assert (= (and b!127461 c!23387) b!127474))

(assert (= (and b!127461 (not c!23387)) b!127468))

(assert (= (and b!127474 res!61598) b!127469))

(assert (= (or b!127474 b!127468) bm!13730))

(assert (= (and b!127461 res!61603) b!127454))

(assert (= (and b!127454 c!23392) b!127464))

(assert (= (and b!127454 (not c!23392)) b!127466))

(assert (= (and b!127464 res!61599) b!127460))

(assert (= (or b!127464 b!127466) bm!13726))

(declare-fun b_lambda!5623 () Bool)

(assert (=> (not b_lambda!5623) (not b!127467)))

(declare-fun tb!2317 () Bool)

(declare-fun t!6033 () Bool)

(assert (=> (and b!126102 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 (_2!1274 lt!65152))) t!6033) tb!2317))

(declare-fun result!3847 () Bool)

(assert (=> tb!2317 (= result!3847 tp_is_empty!2839)))

(assert (=> b!127467 t!6033))

(declare-fun b_and!7857 () Bool)

(assert (= b_and!7853 (and (=> t!6033 result!3847) b_and!7857)))

(declare-fun t!6035 () Bool)

(declare-fun tb!2319 () Bool)

(assert (=> (and b!126097 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (_2!1274 lt!65152))) t!6035) tb!2319))

(declare-fun result!3849 () Bool)

(assert (= result!3849 result!3847))

(assert (=> b!127467 t!6035))

(declare-fun b_and!7859 () Bool)

(assert (= b_and!7855 (and (=> t!6035 result!3849) b_and!7859)))

(assert (=> b!127472 m!148555))

(assert (=> b!127472 m!148555))

(assert (=> b!127472 m!148557))

(declare-fun m!149337 () Bool)

(assert (=> b!127470 m!149337))

(declare-fun m!149339 () Bool)

(assert (=> b!127470 m!149339))

(declare-fun m!149341 () Bool)

(assert (=> b!127470 m!149341))

(declare-fun m!149343 () Bool)

(assert (=> b!127470 m!149343))

(declare-fun m!149345 () Bool)

(assert (=> b!127470 m!149345))

(assert (=> b!127470 m!149343))

(declare-fun m!149347 () Bool)

(assert (=> b!127470 m!149347))

(declare-fun m!149349 () Bool)

(assert (=> b!127470 m!149349))

(declare-fun m!149351 () Bool)

(assert (=> b!127470 m!149351))

(declare-fun m!149353 () Bool)

(assert (=> b!127470 m!149353))

(assert (=> b!127470 m!149339))

(declare-fun m!149355 () Bool)

(assert (=> b!127470 m!149355))

(declare-fun m!149357 () Bool)

(assert (=> b!127470 m!149357))

(declare-fun m!149359 () Bool)

(assert (=> b!127470 m!149359))

(declare-fun m!149361 () Bool)

(assert (=> b!127470 m!149361))

(declare-fun m!149363 () Bool)

(assert (=> b!127470 m!149363))

(declare-fun m!149365 () Bool)

(assert (=> b!127470 m!149365))

(assert (=> b!127470 m!148555))

(assert (=> b!127470 m!149347))

(assert (=> b!127470 m!149359))

(declare-fun m!149367 () Bool)

(assert (=> b!127470 m!149367))

(declare-fun m!149369 () Bool)

(assert (=> bm!13730 m!149369))

(declare-fun m!149371 () Bool)

(assert (=> bm!13724 m!149371))

(assert (=> bm!13725 m!149365))

(declare-fun m!149373 () Bool)

(assert (=> b!127460 m!149373))

(assert (=> b!127459 m!148555))

(assert (=> b!127459 m!148555))

(assert (=> b!127459 m!148557))

(assert (=> b!127456 m!148555))

(assert (=> b!127456 m!148555))

(declare-fun m!149375 () Bool)

(assert (=> b!127456 m!149375))

(declare-fun m!149377 () Bool)

(assert (=> b!127467 m!149377))

(assert (=> b!127467 m!148555))

(declare-fun m!149379 () Bool)

(assert (=> b!127467 m!149379))

(assert (=> b!127467 m!148555))

(declare-fun m!149381 () Bool)

(assert (=> b!127467 m!149381))

(assert (=> b!127467 m!149381))

(assert (=> b!127467 m!149377))

(declare-fun m!149383 () Bool)

(assert (=> b!127467 m!149383))

(declare-fun m!149385 () Bool)

(assert (=> bm!13726 m!149385))

(declare-fun m!149387 () Bool)

(assert (=> b!127473 m!149387))

(declare-fun m!149389 () Bool)

(assert (=> b!127469 m!149389))

(declare-fun m!149391 () Bool)

(assert (=> d!38691 m!149391))

(assert (=> d!38185 d!38691))

(declare-fun b!127476 () Bool)

(declare-fun res!61608 () Bool)

(declare-fun e!83204 () Bool)

(assert (=> b!127476 (=> (not res!61608) (not e!83204))))

(assert (=> b!127476 (= res!61608 (bvsge (size!2486 (_2!1274 lt!65152)) (_size!579 (_2!1274 lt!65152))))))

(declare-fun d!38693 () Bool)

(declare-fun res!61607 () Bool)

(assert (=> d!38693 (=> (not res!61607) (not e!83204))))

(assert (=> d!38693 (= res!61607 (validMask!0 (mask!7038 (_2!1274 lt!65152))))))

(assert (=> d!38693 (= (simpleValid!87 (_2!1274 lt!65152)) e!83204)))

(declare-fun b!127475 () Bool)

(declare-fun res!61606 () Bool)

(assert (=> b!127475 (=> (not res!61606) (not e!83204))))

(assert (=> b!127475 (= res!61606 (and (= (size!2481 (_values!2765 (_2!1274 lt!65152))) (bvadd (mask!7038 (_2!1274 lt!65152)) #b00000000000000000000000000000001)) (= (size!2480 (_keys!4515 (_2!1274 lt!65152))) (size!2481 (_values!2765 (_2!1274 lt!65152)))) (bvsge (_size!579 (_2!1274 lt!65152)) #b00000000000000000000000000000000) (bvsle (_size!579 (_2!1274 lt!65152)) (bvadd (mask!7038 (_2!1274 lt!65152)) #b00000000000000000000000000000001))))))

(declare-fun b!127477 () Bool)

(declare-fun res!61605 () Bool)

(assert (=> b!127477 (=> (not res!61605) (not e!83204))))

(assert (=> b!127477 (= res!61605 (= (size!2486 (_2!1274 lt!65152)) (bvadd (_size!579 (_2!1274 lt!65152)) (bvsdiv (bvadd (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!127478 () Bool)

(assert (=> b!127478 (= e!83204 (and (bvsge (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000000) (bvsle (extraKeys!2563 (_2!1274 lt!65152)) #b00000000000000000000000000000011) (bvsge (_vacant!579 (_2!1274 lt!65152)) #b00000000000000000000000000000000)))))

(assert (= (and d!38693 res!61607) b!127475))

(assert (= (and b!127475 res!61606) b!127476))

(assert (= (and b!127476 res!61608) b!127477))

(assert (= (and b!127477 res!61605) b!127478))

(declare-fun m!149393 () Bool)

(assert (=> b!127476 m!149393))

(assert (=> d!38693 m!149391))

(assert (=> b!127477 m!149393))

(assert (=> d!38175 d!38693))

(assert (=> b!126668 d!38429))

(assert (=> b!126668 d!38431))

(assert (=> bm!13616 d!38293))

(declare-fun d!38695 () Bool)

(assert (=> d!38695 (= (get!1456 (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3130 (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38171 d!38695))

(assert (=> d!38171 d!38475))

(declare-fun d!38697 () Bool)

(assert (=> d!38697 (= (get!1456 (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3130 (getValueByKey!168 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38227 d!38697))

(assert (=> d!38227 d!38321))

(assert (=> b!126614 d!38381))

(declare-fun d!38699 () Bool)

(assert (=> d!38699 (isDefined!120 (getValueByKey!168 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(declare-fun lt!65974 () Unit!3928)

(assert (=> d!38699 (= lt!65974 (choose!770 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(declare-fun e!83205 () Bool)

(assert (=> d!38699 e!83205))

(declare-fun res!61609 () Bool)

(assert (=> d!38699 (=> (not res!61609) (not e!83205))))

(assert (=> d!38699 (= res!61609 (isStrictlySorted!304 (toList!832 e!82525)))))

(assert (=> d!38699 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))) lt!65974)))

(declare-fun b!127479 () Bool)

(assert (=> b!127479 (= e!83205 (containsKey!171 (toList!832 e!82525) (ite c!23081 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65160)))))))

(assert (= (and d!38699 res!61609) b!127479))

(assert (=> d!38699 m!147963))

(assert (=> d!38699 m!147963))

(assert (=> d!38699 m!147965))

(declare-fun m!149395 () Bool)

(assert (=> d!38699 m!149395))

(declare-fun m!149397 () Bool)

(assert (=> d!38699 m!149397))

(assert (=> b!127479 m!147959))

(assert (=> b!126770 d!38699))

(assert (=> b!126770 d!38595))

(assert (=> b!126770 d!38597))

(declare-fun lt!65975 () Bool)

(declare-fun d!38701 () Bool)

(assert (=> d!38701 (= lt!65975 (select (content!126 (toList!832 lt!65530)) (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!83206 () Bool)

(assert (=> d!38701 (= lt!65975 e!83206)))

(declare-fun res!61611 () Bool)

(assert (=> d!38701 (=> (not res!61611) (not e!83206))))

(assert (=> d!38701 (= res!61611 ((_ is Cons!1674) (toList!832 lt!65530)))))

(assert (=> d!38701 (= (contains!866 (toList!832 lt!65530) (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65975)))

(declare-fun b!127480 () Bool)

(declare-fun e!83207 () Bool)

(assert (=> b!127480 (= e!83206 e!83207)))

(declare-fun res!61610 () Bool)

(assert (=> b!127480 (=> res!61610 e!83207)))

(assert (=> b!127480 (= res!61610 (= (h!2276 (toList!832 lt!65530)) (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127481 () Bool)

(assert (=> b!127481 (= e!83207 (contains!866 (t!6017 (toList!832 lt!65530)) (ite (or c!23109 c!23106) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (= (and d!38701 res!61611) b!127480))

(assert (= (and b!127480 (not res!61610)) b!127481))

(declare-fun m!149399 () Bool)

(assert (=> d!38701 m!149399))

(declare-fun m!149401 () Bool)

(assert (=> d!38701 m!149401))

(declare-fun m!149403 () Bool)

(assert (=> b!127481 m!149403))

(assert (=> b!126774 d!38701))

(declare-fun d!38703 () Bool)

(declare-fun res!61612 () Bool)

(declare-fun e!83208 () Bool)

(assert (=> d!38703 (=> res!61612 e!83208)))

(assert (=> d!38703 (= res!61612 (and ((_ is Cons!1674) (toList!832 lt!65225)) (= (_1!1273 (h!2276 (toList!832 lt!65225))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38703 (= (containsKey!171 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!83208)))

(declare-fun b!127482 () Bool)

(declare-fun e!83209 () Bool)

(assert (=> b!127482 (= e!83208 e!83209)))

(declare-fun res!61613 () Bool)

(assert (=> b!127482 (=> (not res!61613) (not e!83209))))

(assert (=> b!127482 (= res!61613 (and (or (not ((_ is Cons!1674) (toList!832 lt!65225))) (bvsle (_1!1273 (h!2276 (toList!832 lt!65225))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1674) (toList!832 lt!65225)) (bvslt (_1!1273 (h!2276 (toList!832 lt!65225))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!127483 () Bool)

(assert (=> b!127483 (= e!83209 (containsKey!171 (t!6017 (toList!832 lt!65225)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38703 (not res!61612)) b!127482))

(assert (= (and b!127482 res!61613) b!127483))

(assert (=> b!127483 m!147373))

(declare-fun m!149405 () Bool)

(assert (=> b!127483 m!149405))

(assert (=> d!38223 d!38703))

(declare-fun d!38705 () Bool)

(assert (=> d!38705 (isDefined!120 (getValueByKey!168 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230))))

(declare-fun lt!65976 () Unit!3928)

(assert (=> d!38705 (= lt!65976 (choose!770 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230))))

(declare-fun e!83210 () Bool)

(assert (=> d!38705 e!83210))

(declare-fun res!61614 () Bool)

(assert (=> d!38705 (=> (not res!61614) (not e!83210))))

(assert (=> d!38705 (= res!61614 (isStrictlySorted!304 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38705 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230) lt!65976)))

(declare-fun b!127484 () Bool)

(assert (=> b!127484 (= e!83210 (containsKey!171 (toList!832 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65230))))

(assert (= (and d!38705 res!61614) b!127484))

(assert (=> d!38705 m!147937))

(assert (=> d!38705 m!147937))

(assert (=> d!38705 m!147939))

(declare-fun m!149407 () Bool)

(assert (=> d!38705 m!149407))

(declare-fun m!149409 () Bool)

(assert (=> d!38705 m!149409))

(assert (=> b!127484 m!147933))

(assert (=> b!126758 d!38705))

(assert (=> b!126758 d!38415))

(assert (=> b!126758 d!38417))

(declare-fun b!127488 () Bool)

(declare-fun e!83212 () Option!174)

(assert (=> b!127488 (= e!83212 None!172)))

(declare-fun b!127485 () Bool)

(declare-fun e!83211 () Option!174)

(assert (=> b!127485 (= e!83211 (Some!173 (_2!1273 (h!2276 (t!6017 (toList!832 lt!65054))))))))

(declare-fun b!127487 () Bool)

(assert (=> b!127487 (= e!83212 (getValueByKey!168 (t!6017 (t!6017 (toList!832 lt!65054))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun d!38707 () Bool)

(declare-fun c!23393 () Bool)

(assert (=> d!38707 (= c!23393 (and ((_ is Cons!1674) (t!6017 (toList!832 lt!65054))) (= (_1!1273 (h!2276 (t!6017 (toList!832 lt!65054)))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38707 (= (getValueByKey!168 (t!6017 (toList!832 lt!65054)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) e!83211)))

(declare-fun b!127486 () Bool)

(assert (=> b!127486 (= e!83211 e!83212)))

(declare-fun c!23394 () Bool)

(assert (=> b!127486 (= c!23394 (and ((_ is Cons!1674) (t!6017 (toList!832 lt!65054))) (not (= (_1!1273 (h!2276 (t!6017 (toList!832 lt!65054)))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(assert (= (and d!38707 c!23393) b!127485))

(assert (= (and d!38707 (not c!23393)) b!127486))

(assert (= (and b!127486 c!23394) b!127487))

(assert (= (and b!127486 (not c!23394)) b!127488))

(assert (=> b!127487 m!147207))

(declare-fun m!149411 () Bool)

(assert (=> b!127487 m!149411))

(assert (=> b!126637 d!38707))

(assert (=> d!38177 d!38189))

(declare-fun d!38709 () Bool)

(declare-fun e!83215 () Bool)

(assert (=> d!38709 e!83215))

(declare-fun res!61619 () Bool)

(assert (=> d!38709 (=> (not res!61619) (not e!83215))))

(declare-fun lt!65979 () SeekEntryResult!264)

(assert (=> d!38709 (= res!61619 ((_ is Found!264) lt!65979))))

(assert (=> d!38709 (= lt!65979 (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(assert (=> d!38709 true))

(declare-fun _$33!105 () Unit!3928)

(assert (=> d!38709 (= (choose!768 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2782 newMap!16)) _$33!105)))

(declare-fun b!127493 () Bool)

(declare-fun res!61620 () Bool)

(assert (=> b!127493 (=> (not res!61620) (not e!83215))))

(assert (=> b!127493 (= res!61620 (inRange!0 (index!3212 lt!65979) (mask!7038 newMap!16)))))

(declare-fun b!127494 () Bool)

(assert (=> b!127494 (= e!83215 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!65979)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38709 res!61619) b!127493))

(assert (= (and b!127493 res!61620) b!127494))

(assert (=> d!38709 m!147207))

(assert (=> d!38709 m!147355))

(declare-fun m!149413 () Bool)

(assert (=> b!127493 m!149413))

(declare-fun m!149415 () Bool)

(assert (=> b!127494 m!149415))

(assert (=> d!38177 d!38709))

(assert (=> d!38177 d!38379))

(declare-fun d!38711 () Bool)

(declare-fun lt!65980 () Bool)

(assert (=> d!38711 (= lt!65980 (select (content!126 (toList!832 lt!65437)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!83216 () Bool)

(assert (=> d!38711 (= lt!65980 e!83216)))

(declare-fun res!61622 () Bool)

(assert (=> d!38711 (=> (not res!61622) (not e!83216))))

(assert (=> d!38711 (= res!61622 ((_ is Cons!1674) (toList!832 lt!65437)))))

(assert (=> d!38711 (= (contains!866 (toList!832 lt!65437) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65980)))

(declare-fun b!127495 () Bool)

(declare-fun e!83217 () Bool)

(assert (=> b!127495 (= e!83216 e!83217)))

(declare-fun res!61621 () Bool)

(assert (=> b!127495 (=> res!61621 e!83217)))

(assert (=> b!127495 (= res!61621 (= (h!2276 (toList!832 lt!65437)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!127496 () Bool)

(assert (=> b!127496 (= e!83217 (contains!866 (t!6017 (toList!832 lt!65437)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38711 res!61622) b!127495))

(assert (= (and b!127495 (not res!61621)) b!127496))

(declare-fun m!149417 () Bool)

(assert (=> d!38711 m!149417))

(declare-fun m!149419 () Bool)

(assert (=> d!38711 m!149419))

(declare-fun m!149421 () Bool)

(assert (=> b!127496 m!149421))

(assert (=> b!126670 d!38711))

(declare-fun b!127497 () Bool)

(declare-fun e!83221 () Bool)

(declare-fun call!13734 () Bool)

(assert (=> b!127497 (= e!83221 call!13734)))

(declare-fun b!127498 () Bool)

(assert (=> b!127498 (= e!83221 call!13734)))

(declare-fun b!127499 () Bool)

(declare-fun e!83219 () Bool)

(assert (=> b!127499 (= e!83219 e!83221)))

(declare-fun c!23395 () Bool)

(assert (=> b!127499 (= c!23395 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!127500 () Bool)

(declare-fun e!83220 () Bool)

(assert (=> b!127500 (= e!83220 e!83219)))

(declare-fun res!61624 () Bool)

(assert (=> b!127500 (=> (not res!61624) (not e!83219))))

(declare-fun e!83218 () Bool)

(assert (=> b!127500 (= res!61624 (not e!83218))))

(declare-fun res!61623 () Bool)

(assert (=> b!127500 (=> (not res!61623) (not e!83218))))

(assert (=> b!127500 (= res!61623 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!127501 () Bool)

(assert (=> b!127501 (= e!83218 (contains!867 Nil!1677 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13731 () Bool)

(assert (=> bm!13731 (= call!13734 (arrayNoDuplicates!0 (_keys!4515 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23395 (Cons!1676 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000) Nil!1677) Nil!1677)))))

(declare-fun d!38713 () Bool)

(declare-fun res!61625 () Bool)

(assert (=> d!38713 (=> res!61625 e!83220)))

(assert (=> d!38713 (= res!61625 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38713 (= (arrayNoDuplicates!0 (_keys!4515 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000 Nil!1677) e!83220)))

(assert (= (and d!38713 (not res!61625)) b!127500))

(assert (= (and b!127500 res!61623) b!127501))

(assert (= (and b!127500 res!61624) b!127499))

(assert (= (and b!127499 c!23395) b!127497))

(assert (= (and b!127499 (not c!23395)) b!127498))

(assert (= (or b!127497 b!127498) bm!13731))

(assert (=> b!127499 m!148193))

(assert (=> b!127499 m!148193))

(assert (=> b!127499 m!148203))

(assert (=> b!127500 m!148193))

(assert (=> b!127500 m!148193))

(assert (=> b!127500 m!148203))

(assert (=> b!127501 m!148193))

(assert (=> b!127501 m!148193))

(declare-fun m!149423 () Bool)

(assert (=> b!127501 m!149423))

(assert (=> bm!13731 m!148193))

(declare-fun m!149425 () Bool)

(assert (=> bm!13731 m!149425))

(assert (=> b!126623 d!38713))

(declare-fun d!38715 () Bool)

(assert (=> d!38715 (= (apply!111 lt!65501 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1456 (getValueByKey!168 (toList!832 lt!65501) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5300 () Bool)

(assert (= bs!5300 d!38715))

(assert (=> bs!5300 m!147373))

(assert (=> bs!5300 m!148987))

(assert (=> bs!5300 m!148987))

(declare-fun m!149427 () Bool)

(assert (=> bs!5300 m!149427))

(assert (=> b!126750 d!38715))

(assert (=> b!126750 d!38173))

(declare-fun b!127505 () Bool)

(declare-fun e!83223 () Option!174)

(assert (=> b!127505 (= e!83223 None!172)))

(declare-fun b!127502 () Bool)

(declare-fun e!83222 () Option!174)

(assert (=> b!127502 (= e!83222 (Some!173 (_2!1273 (h!2276 (toList!832 lt!65467)))))))

(declare-fun b!127504 () Bool)

(assert (=> b!127504 (= e!83223 (getValueByKey!168 (t!6017 (toList!832 lt!65467)) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun c!23396 () Bool)

(declare-fun d!38717 () Bool)

(assert (=> d!38717 (= c!23396 (and ((_ is Cons!1674) (toList!832 lt!65467)) (= (_1!1273 (h!2276 (toList!832 lt!65467))) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38717 (= (getValueByKey!168 (toList!832 lt!65467) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!83222)))

(declare-fun b!127503 () Bool)

(assert (=> b!127503 (= e!83222 e!83223)))

(declare-fun c!23397 () Bool)

(assert (=> b!127503 (= c!23397 (and ((_ is Cons!1674) (toList!832 lt!65467)) (not (= (_1!1273 (h!2276 (toList!832 lt!65467))) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38717 c!23396) b!127502))

(assert (= (and d!38717 (not c!23396)) b!127503))

(assert (= (and b!127503 c!23397) b!127504))

(assert (= (and b!127503 (not c!23397)) b!127505))

(declare-fun m!149429 () Bool)

(assert (=> b!127504 m!149429))

(assert (=> b!126707 d!38717))

(assert (=> bm!13600 d!38199))

(assert (=> b!126746 d!38193))

(assert (=> b!126502 d!38381))

(assert (=> d!38247 d!38259))

(assert (=> d!38247 d!38245))

(declare-fun d!38719 () Bool)

(assert (=> d!38719 (contains!864 (+!164 lt!65213 (tuple2!2525 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))) lt!65230)))

(assert (=> d!38719 true))

(declare-fun _$35!372 () Unit!3928)

(assert (=> d!38719 (= (choose!773 lt!65213 lt!65232 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))) lt!65230) _$35!372)))

(declare-fun bs!5301 () Bool)

(assert (= bs!5301 d!38719))

(assert (=> bs!5301 m!147399))

(assert (=> bs!5301 m!147399))

(assert (=> bs!5301 m!147401))

(assert (=> d!38247 d!38719))

(declare-fun d!38721 () Bool)

(declare-fun e!83225 () Bool)

(assert (=> d!38721 e!83225))

(declare-fun res!61626 () Bool)

(assert (=> d!38721 (=> res!61626 e!83225)))

(declare-fun lt!65982 () Bool)

(assert (=> d!38721 (= res!61626 (not lt!65982))))

(declare-fun lt!65981 () Bool)

(assert (=> d!38721 (= lt!65982 lt!65981)))

(declare-fun lt!65984 () Unit!3928)

(declare-fun e!83224 () Unit!3928)

(assert (=> d!38721 (= lt!65984 e!83224)))

(declare-fun c!23398 () Bool)

(assert (=> d!38721 (= c!23398 lt!65981)))

(assert (=> d!38721 (= lt!65981 (containsKey!171 (toList!832 lt!65213) lt!65230))))

(assert (=> d!38721 (= (contains!864 lt!65213 lt!65230) lt!65982)))

(declare-fun b!127507 () Bool)

(declare-fun lt!65983 () Unit!3928)

(assert (=> b!127507 (= e!83224 lt!65983)))

(assert (=> b!127507 (= lt!65983 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65213) lt!65230))))

(assert (=> b!127507 (isDefined!120 (getValueByKey!168 (toList!832 lt!65213) lt!65230))))

(declare-fun b!127508 () Bool)

(declare-fun Unit!3979 () Unit!3928)

(assert (=> b!127508 (= e!83224 Unit!3979)))

(declare-fun b!127509 () Bool)

(assert (=> b!127509 (= e!83225 (isDefined!120 (getValueByKey!168 (toList!832 lt!65213) lt!65230)))))

(assert (= (and d!38721 c!23398) b!127507))

(assert (= (and d!38721 (not c!23398)) b!127508))

(assert (= (and d!38721 (not res!61626)) b!127509))

(declare-fun m!149431 () Bool)

(assert (=> d!38721 m!149431))

(declare-fun m!149433 () Bool)

(assert (=> b!127507 m!149433))

(declare-fun m!149435 () Bool)

(assert (=> b!127507 m!149435))

(assert (=> b!127507 m!149435))

(declare-fun m!149437 () Bool)

(assert (=> b!127507 m!149437))

(assert (=> b!127509 m!149435))

(assert (=> b!127509 m!149435))

(assert (=> b!127509 m!149437))

(assert (=> d!38247 d!38721))

(declare-fun d!38723 () Bool)

(declare-fun e!83227 () Bool)

(assert (=> d!38723 e!83227))

(declare-fun res!61627 () Bool)

(assert (=> d!38723 (=> res!61627 e!83227)))

(declare-fun lt!65986 () Bool)

(assert (=> d!38723 (= res!61627 (not lt!65986))))

(declare-fun lt!65985 () Bool)

(assert (=> d!38723 (= lt!65986 lt!65985)))

(declare-fun lt!65988 () Unit!3928)

(declare-fun e!83226 () Unit!3928)

(assert (=> d!38723 (= lt!65988 e!83226)))

(declare-fun c!23399 () Bool)

(assert (=> d!38723 (= c!23399 lt!65985)))

(assert (=> d!38723 (= lt!65985 (containsKey!171 (toList!832 lt!65356) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38723 (= (contains!864 lt!65356 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) lt!65986)))

(declare-fun b!127510 () Bool)

(declare-fun lt!65987 () Unit!3928)

(assert (=> b!127510 (= e!83226 lt!65987)))

(assert (=> b!127510 (= lt!65987 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65356) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127510 (isDefined!120 (getValueByKey!168 (toList!832 lt!65356) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127511 () Bool)

(declare-fun Unit!3980 () Unit!3928)

(assert (=> b!127511 (= e!83226 Unit!3980)))

(declare-fun b!127512 () Bool)

(assert (=> b!127512 (= e!83227 (isDefined!120 (getValueByKey!168 (toList!832 lt!65356) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38723 c!23399) b!127510))

(assert (= (and d!38723 (not c!23399)) b!127511))

(assert (= (and d!38723 (not res!61627)) b!127512))

(assert (=> d!38723 m!147525))

(declare-fun m!149439 () Bool)

(assert (=> d!38723 m!149439))

(assert (=> b!127510 m!147525))

(declare-fun m!149441 () Bool)

(assert (=> b!127510 m!149441))

(assert (=> b!127510 m!147525))

(assert (=> b!127510 m!148329))

(assert (=> b!127510 m!148329))

(declare-fun m!149443 () Bool)

(assert (=> b!127510 m!149443))

(assert (=> b!127512 m!147525))

(assert (=> b!127512 m!148329))

(assert (=> b!127512 m!148329))

(assert (=> b!127512 m!149443))

(assert (=> b!126499 d!38723))

(assert (=> d!38169 d!38379))

(assert (=> b!126689 d!38381))

(declare-fun d!38725 () Bool)

(declare-fun e!83229 () Bool)

(assert (=> d!38725 e!83229))

(declare-fun res!61628 () Bool)

(assert (=> d!38725 (=> res!61628 e!83229)))

(declare-fun lt!65990 () Bool)

(assert (=> d!38725 (= res!61628 (not lt!65990))))

(declare-fun lt!65989 () Bool)

(assert (=> d!38725 (= lt!65990 lt!65989)))

(declare-fun lt!65992 () Unit!3928)

(declare-fun e!83228 () Unit!3928)

(assert (=> d!38725 (= lt!65992 e!83228)))

(declare-fun c!23400 () Bool)

(assert (=> d!38725 (= c!23400 lt!65989)))

(assert (=> d!38725 (= lt!65989 (containsKey!171 (toList!832 lt!65455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38725 (= (contains!864 lt!65455 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65990)))

(declare-fun b!127513 () Bool)

(declare-fun lt!65991 () Unit!3928)

(assert (=> b!127513 (= e!83228 lt!65991)))

(assert (=> b!127513 (= lt!65991 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127513 (isDefined!120 (getValueByKey!168 (toList!832 lt!65455) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127514 () Bool)

(declare-fun Unit!3981 () Unit!3928)

(assert (=> b!127514 (= e!83228 Unit!3981)))

(declare-fun b!127515 () Bool)

(assert (=> b!127515 (= e!83229 (isDefined!120 (getValueByKey!168 (toList!832 lt!65455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38725 c!23400) b!127513))

(assert (= (and d!38725 (not c!23400)) b!127514))

(assert (= (and d!38725 (not res!61628)) b!127515))

(declare-fun m!149445 () Bool)

(assert (=> d!38725 m!149445))

(declare-fun m!149447 () Bool)

(assert (=> b!127513 m!149447))

(assert (=> b!127513 m!148505))

(assert (=> b!127513 m!148505))

(declare-fun m!149449 () Bool)

(assert (=> b!127513 m!149449))

(assert (=> b!127515 m!148505))

(assert (=> b!127515 m!148505))

(assert (=> b!127515 m!149449))

(assert (=> bm!13633 d!38725))

(declare-fun d!38727 () Bool)

(declare-fun res!61629 () Bool)

(declare-fun e!83230 () Bool)

(assert (=> d!38727 (=> res!61629 e!83230)))

(assert (=> d!38727 (= res!61629 (and ((_ is Cons!1674) (toList!832 lt!65225)) (= (_1!1273 (h!2276 (toList!832 lt!65225))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38727 (= (containsKey!171 (toList!832 lt!65225) #b0000000000000000000000000000000000000000000000000000000000000000) e!83230)))

(declare-fun b!127516 () Bool)

(declare-fun e!83231 () Bool)

(assert (=> b!127516 (= e!83230 e!83231)))

(declare-fun res!61630 () Bool)

(assert (=> b!127516 (=> (not res!61630) (not e!83231))))

(assert (=> b!127516 (= res!61630 (and (or (not ((_ is Cons!1674) (toList!832 lt!65225))) (bvsle (_1!1273 (h!2276 (toList!832 lt!65225))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1674) (toList!832 lt!65225)) (bvslt (_1!1273 (h!2276 (toList!832 lt!65225))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127517 () Bool)

(assert (=> b!127517 (= e!83231 (containsKey!171 (t!6017 (toList!832 lt!65225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38727 (not res!61629)) b!127516))

(assert (= (and b!127516 res!61630) b!127517))

(declare-fun m!149451 () Bool)

(assert (=> b!127517 m!149451))

(assert (=> d!38165 d!38727))

(declare-fun d!38729 () Bool)

(assert (=> d!38729 (= (inRange!0 (index!3212 lt!65368) (mask!7038 newMap!16)) (and (bvsge (index!3212 lt!65368) #b00000000000000000000000000000000) (bvslt (index!3212 lt!65368) (bvadd (mask!7038 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!126527 d!38729))

(declare-fun d!38731 () Bool)

(declare-fun e!83232 () Bool)

(assert (=> d!38731 e!83232))

(declare-fun res!61632 () Bool)

(assert (=> d!38731 (=> (not res!61632) (not e!83232))))

(declare-fun lt!65993 () ListLongMap!1633)

(assert (=> d!38731 (= res!61632 (contains!864 lt!65993 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65994 () List!1678)

(assert (=> d!38731 (= lt!65993 (ListLongMap!1634 lt!65994))))

(declare-fun lt!65996 () Unit!3928)

(declare-fun lt!65995 () Unit!3928)

(assert (=> d!38731 (= lt!65996 lt!65995)))

(assert (=> d!38731 (= (getValueByKey!168 lt!65994 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38731 (= lt!65995 (lemmaContainsTupThenGetReturnValue!83 lt!65994 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38731 (= lt!65994 (insertStrictlySorted!86 (toList!832 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38731 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65993)))

(declare-fun b!127518 () Bool)

(declare-fun res!61631 () Bool)

(assert (=> b!127518 (=> (not res!61631) (not e!83232))))

(assert (=> b!127518 (= res!61631 (= (getValueByKey!168 (toList!832 lt!65993) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127519 () Bool)

(assert (=> b!127519 (= e!83232 (contains!866 (toList!832 lt!65993) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38731 res!61632) b!127518))

(assert (= (and b!127518 res!61631) b!127519))

(declare-fun m!149453 () Bool)

(assert (=> d!38731 m!149453))

(declare-fun m!149455 () Bool)

(assert (=> d!38731 m!149455))

(declare-fun m!149457 () Bool)

(assert (=> d!38731 m!149457))

(declare-fun m!149459 () Bool)

(assert (=> d!38731 m!149459))

(declare-fun m!149461 () Bool)

(assert (=> b!127518 m!149461))

(declare-fun m!149463 () Bool)

(assert (=> b!127519 m!149463))

(assert (=> d!38167 d!38731))

(declare-fun b!127520 () Bool)

(declare-fun e!83238 () Bool)

(declare-fun e!83245 () Bool)

(assert (=> b!127520 (= e!83238 e!83245)))

(declare-fun c!23406 () Bool)

(assert (=> b!127520 (= c!23406 (not (= (bvand lt!65165 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127521 () Bool)

(declare-fun e!83242 () ListLongMap!1633)

(declare-fun e!83243 () ListLongMap!1633)

(assert (=> b!127521 (= e!83242 e!83243)))

(declare-fun c!23402 () Bool)

(assert (=> b!127521 (= c!23402 (and (not (= (bvand lt!65165 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!65165 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!13738 () ListLongMap!1633)

(declare-fun bm!13732 () Bool)

(declare-fun call!13740 () ListLongMap!1633)

(declare-fun c!23405 () Bool)

(declare-fun call!13741 () ListLongMap!1633)

(declare-fun call!13735 () ListLongMap!1633)

(assert (=> bm!13732 (= call!13740 (+!164 (ite c!23405 call!13735 (ite c!23402 call!13738 call!13741)) (ite (or c!23405 c!23402) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2645 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13733 () Bool)

(assert (=> bm!13733 (= call!13735 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun bm!13734 () Bool)

(declare-fun call!13739 () Bool)

(declare-fun lt!66011 () ListLongMap!1633)

(assert (=> bm!13734 (= call!13739 (contains!864 lt!66011 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127522 () Bool)

(declare-fun e!83233 () Bool)

(declare-fun e!83237 () Bool)

(assert (=> b!127522 (= e!83233 e!83237)))

(declare-fun res!61637 () Bool)

(assert (=> b!127522 (=> (not res!61637) (not e!83237))))

(assert (=> b!127522 (= res!61637 (contains!864 lt!66011 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun bm!13735 () Bool)

(assert (=> bm!13735 (= call!13741 call!13738)))

(declare-fun b!127523 () Bool)

(declare-fun e!83240 () ListLongMap!1633)

(declare-fun call!13737 () ListLongMap!1633)

(assert (=> b!127523 (= e!83240 call!13737)))

(declare-fun b!127524 () Bool)

(declare-fun res!61633 () Bool)

(assert (=> b!127524 (=> (not res!61633) (not e!83238))))

(assert (=> b!127524 (= res!61633 e!83233)))

(declare-fun res!61634 () Bool)

(assert (=> b!127524 (=> res!61634 e!83233)))

(declare-fun e!83236 () Bool)

(assert (=> b!127524 (= res!61634 (not e!83236))))

(declare-fun res!61639 () Bool)

(assert (=> b!127524 (=> (not res!61639) (not e!83236))))

(assert (=> b!127524 (= res!61639 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127525 () Bool)

(declare-fun e!83239 () Bool)

(assert (=> b!127525 (= e!83239 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127526 () Bool)

(declare-fun e!83234 () Bool)

(assert (=> b!127526 (= e!83234 (= (apply!111 lt!66011 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127527 () Bool)

(declare-fun res!61640 () Bool)

(assert (=> b!127527 (=> (not res!61640) (not e!83238))))

(declare-fun e!83235 () Bool)

(assert (=> b!127527 (= res!61640 e!83235)))

(declare-fun c!23401 () Bool)

(assert (=> b!127527 (= c!23401 (not (= (bvand lt!65165 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!13736 () Bool)

(assert (=> bm!13736 (= call!13737 call!13740)))

(declare-fun b!127528 () Bool)

(assert (=> b!127528 (= e!83243 call!13737)))

(declare-fun b!127529 () Bool)

(assert (=> b!127529 (= e!83240 call!13741)))

(declare-fun bm!13737 () Bool)

(assert (=> bm!13737 (= call!13738 call!13735)))

(declare-fun b!127530 () Bool)

(assert (=> b!127530 (= e!83245 e!83234)))

(declare-fun res!61636 () Bool)

(assert (=> b!127530 (= res!61636 call!13739)))

(assert (=> b!127530 (=> (not res!61636) (not e!83234))))

(declare-fun b!127531 () Bool)

(declare-fun c!23404 () Bool)

(assert (=> b!127531 (= c!23404 (and (not (= (bvand lt!65165 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!65165 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127531 (= e!83243 e!83240)))

(declare-fun b!127532 () Bool)

(assert (=> b!127532 (= e!83245 (not call!13739))))

(declare-fun b!127533 () Bool)

(assert (=> b!127533 (= e!83237 (= (apply!111 lt!66011 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (get!1452 (select (arr!2217 (_values!2765 newMap!16)) #b00000000000000000000000000000000) (dynLambda!416 (defaultEntry!2782 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2481 (_values!2765 newMap!16))))))

(assert (=> b!127533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127534 () Bool)

(declare-fun call!13736 () Bool)

(assert (=> b!127534 (= e!83235 (not call!13736))))

(declare-fun bm!13738 () Bool)

(assert (=> bm!13738 (= call!13736 (contains!864 lt!66011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127535 () Bool)

(declare-fun e!83244 () Bool)

(assert (=> b!127535 (= e!83244 (= (apply!111 lt!66011 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2645 newMap!16)))))

(declare-fun b!127536 () Bool)

(declare-fun e!83241 () Unit!3928)

(declare-fun lt!66014 () Unit!3928)

(assert (=> b!127536 (= e!83241 lt!66014)))

(declare-fun lt!65999 () ListLongMap!1633)

(assert (=> b!127536 (= lt!65999 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!66018 () (_ BitVec 64))

(assert (=> b!127536 (= lt!66018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66016 () (_ BitVec 64))

(assert (=> b!127536 (= lt!66016 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66001 () Unit!3928)

(assert (=> b!127536 (= lt!66001 (addStillContains!87 lt!65999 lt!66018 (zeroValue!2645 newMap!16) lt!66016))))

(assert (=> b!127536 (contains!864 (+!164 lt!65999 (tuple2!2525 lt!66018 (zeroValue!2645 newMap!16))) lt!66016)))

(declare-fun lt!66005 () Unit!3928)

(assert (=> b!127536 (= lt!66005 lt!66001)))

(declare-fun lt!66009 () ListLongMap!1633)

(assert (=> b!127536 (= lt!66009 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!66002 () (_ BitVec 64))

(assert (=> b!127536 (= lt!66002 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66012 () (_ BitVec 64))

(assert (=> b!127536 (= lt!66012 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66007 () Unit!3928)

(assert (=> b!127536 (= lt!66007 (addApplyDifferent!87 lt!66009 lt!66002 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66012))))

(assert (=> b!127536 (= (apply!111 (+!164 lt!66009 (tuple2!2525 lt!66002 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66012) (apply!111 lt!66009 lt!66012))))

(declare-fun lt!66017 () Unit!3928)

(assert (=> b!127536 (= lt!66017 lt!66007)))

(declare-fun lt!66000 () ListLongMap!1633)

(assert (=> b!127536 (= lt!66000 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!66008 () (_ BitVec 64))

(assert (=> b!127536 (= lt!66008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65998 () (_ BitVec 64))

(assert (=> b!127536 (= lt!65998 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65997 () Unit!3928)

(assert (=> b!127536 (= lt!65997 (addApplyDifferent!87 lt!66000 lt!66008 (zeroValue!2645 newMap!16) lt!65998))))

(assert (=> b!127536 (= (apply!111 (+!164 lt!66000 (tuple2!2525 lt!66008 (zeroValue!2645 newMap!16))) lt!65998) (apply!111 lt!66000 lt!65998))))

(declare-fun lt!66006 () Unit!3928)

(assert (=> b!127536 (= lt!66006 lt!65997)))

(declare-fun lt!66013 () ListLongMap!1633)

(assert (=> b!127536 (= lt!66013 (getCurrentListMapNoExtraKeys!131 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(declare-fun lt!66004 () (_ BitVec 64))

(assert (=> b!127536 (= lt!66004 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66010 () (_ BitVec 64))

(assert (=> b!127536 (= lt!66010 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127536 (= lt!66014 (addApplyDifferent!87 lt!66013 lt!66004 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66010))))

(assert (=> b!127536 (= (apply!111 (+!164 lt!66013 (tuple2!2525 lt!66004 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66010) (apply!111 lt!66013 lt!66010))))

(declare-fun b!127537 () Bool)

(declare-fun Unit!3982 () Unit!3928)

(assert (=> b!127537 (= e!83241 Unit!3982)))

(declare-fun d!38733 () Bool)

(assert (=> d!38733 e!83238))

(declare-fun res!61641 () Bool)

(assert (=> d!38733 (=> (not res!61641) (not e!83238))))

(assert (=> d!38733 (= res!61641 (or (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))))

(declare-fun lt!66003 () ListLongMap!1633)

(assert (=> d!38733 (= lt!66011 lt!66003)))

(declare-fun lt!66015 () Unit!3928)

(assert (=> d!38733 (= lt!66015 e!83241)))

(declare-fun c!23403 () Bool)

(assert (=> d!38733 (= c!23403 e!83239)))

(declare-fun res!61638 () Bool)

(assert (=> d!38733 (=> (not res!61638) (not e!83239))))

(assert (=> d!38733 (= res!61638 (bvslt #b00000000000000000000000000000000 (size!2480 (_keys!4515 newMap!16))))))

(assert (=> d!38733 (= lt!66003 e!83242)))

(assert (=> d!38733 (= c!23405 (and (not (= (bvand lt!65165 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!65165 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38733 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38733 (= (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!66011)))

(declare-fun b!127538 () Bool)

(assert (=> b!127538 (= e!83236 (validKeyInArray!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127539 () Bool)

(assert (=> b!127539 (= e!83242 (+!164 call!13740 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!127540 () Bool)

(assert (=> b!127540 (= e!83235 e!83244)))

(declare-fun res!61635 () Bool)

(assert (=> b!127540 (= res!61635 call!13736)))

(assert (=> b!127540 (=> (not res!61635) (not e!83244))))

(assert (= (and d!38733 c!23405) b!127539))

(assert (= (and d!38733 (not c!23405)) b!127521))

(assert (= (and b!127521 c!23402) b!127528))

(assert (= (and b!127521 (not c!23402)) b!127531))

(assert (= (and b!127531 c!23404) b!127523))

(assert (= (and b!127531 (not c!23404)) b!127529))

(assert (= (or b!127523 b!127529) bm!13735))

(assert (= (or b!127528 bm!13735) bm!13737))

(assert (= (or b!127528 b!127523) bm!13736))

(assert (= (or b!127539 bm!13737) bm!13733))

(assert (= (or b!127539 bm!13736) bm!13732))

(assert (= (and d!38733 res!61638) b!127525))

(assert (= (and d!38733 c!23403) b!127536))

(assert (= (and d!38733 (not c!23403)) b!127537))

(assert (= (and d!38733 res!61641) b!127524))

(assert (= (and b!127524 res!61639) b!127538))

(assert (= (and b!127524 (not res!61634)) b!127522))

(assert (= (and b!127522 res!61637) b!127533))

(assert (= (and b!127524 res!61633) b!127527))

(assert (= (and b!127527 c!23401) b!127540))

(assert (= (and b!127527 (not c!23401)) b!127534))

(assert (= (and b!127540 res!61635) b!127535))

(assert (= (or b!127540 b!127534) bm!13738))

(assert (= (and b!127527 res!61640) b!127520))

(assert (= (and b!127520 c!23406) b!127530))

(assert (= (and b!127520 (not c!23406)) b!127532))

(assert (= (and b!127530 res!61636) b!127526))

(assert (= (or b!127530 b!127532) bm!13734))

(declare-fun b_lambda!5625 () Bool)

(assert (=> (not b_lambda!5625) (not b!127533)))

(assert (=> b!127533 t!6029))

(declare-fun b_and!7861 () Bool)

(assert (= b_and!7857 (and (=> t!6029 result!3843) b_and!7861)))

(assert (=> b!127533 t!6031))

(declare-fun b_and!7863 () Bool)

(assert (= b_and!7859 (and (=> t!6031 result!3845) b_and!7863)))

(assert (=> b!127538 m!147525))

(assert (=> b!127538 m!147525))

(assert (=> b!127538 m!147527))

(declare-fun m!149465 () Bool)

(assert (=> b!127536 m!149465))

(declare-fun m!149467 () Bool)

(assert (=> b!127536 m!149467))

(declare-fun m!149469 () Bool)

(assert (=> b!127536 m!149469))

(declare-fun m!149471 () Bool)

(assert (=> b!127536 m!149471))

(declare-fun m!149473 () Bool)

(assert (=> b!127536 m!149473))

(assert (=> b!127536 m!149471))

(declare-fun m!149475 () Bool)

(assert (=> b!127536 m!149475))

(declare-fun m!149477 () Bool)

(assert (=> b!127536 m!149477))

(assert (=> b!127536 m!147215))

(declare-fun m!149479 () Bool)

(assert (=> b!127536 m!149479))

(declare-fun m!149481 () Bool)

(assert (=> b!127536 m!149481))

(assert (=> b!127536 m!149467))

(declare-fun m!149483 () Bool)

(assert (=> b!127536 m!149483))

(declare-fun m!149485 () Bool)

(assert (=> b!127536 m!149485))

(declare-fun m!149487 () Bool)

(assert (=> b!127536 m!149487))

(declare-fun m!149489 () Bool)

(assert (=> b!127536 m!149489))

(assert (=> b!127536 m!147215))

(declare-fun m!149491 () Bool)

(assert (=> b!127536 m!149491))

(assert (=> b!127536 m!147215))

(declare-fun m!149493 () Bool)

(assert (=> b!127536 m!149493))

(assert (=> b!127536 m!147525))

(assert (=> b!127536 m!149475))

(assert (=> b!127536 m!149487))

(declare-fun m!149495 () Bool)

(assert (=> b!127536 m!149495))

(declare-fun m!149497 () Bool)

(assert (=> bm!13738 m!149497))

(declare-fun m!149499 () Bool)

(assert (=> bm!13732 m!149499))

(assert (=> bm!13733 m!147215))

(assert (=> bm!13733 m!149493))

(declare-fun m!149501 () Bool)

(assert (=> b!127526 m!149501))

(assert (=> b!127525 m!147525))

(assert (=> b!127525 m!147525))

(assert (=> b!127525 m!147527))

(assert (=> b!127522 m!147525))

(assert (=> b!127522 m!147525))

(declare-fun m!149503 () Bool)

(assert (=> b!127522 m!149503))

(assert (=> b!127533 m!147569))

(assert (=> b!127533 m!147525))

(declare-fun m!149505 () Bool)

(assert (=> b!127533 m!149505))

(assert (=> b!127533 m!147525))

(assert (=> b!127533 m!147657))

(assert (=> b!127533 m!147657))

(assert (=> b!127533 m!147569))

(assert (=> b!127533 m!147659))

(declare-fun m!149507 () Bool)

(assert (=> bm!13734 m!149507))

(declare-fun m!149509 () Bool)

(assert (=> b!127539 m!149509))

(declare-fun m!149511 () Bool)

(assert (=> b!127535 m!149511))

(assert (=> d!38733 m!147517))

(assert (=> d!38167 d!38733))

(assert (=> d!38167 d!38183))

(declare-fun d!38735 () Bool)

(assert (=> d!38735 (= (+!164 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> d!38735 true))

(declare-fun _$8!109 () Unit!3928)

(assert (=> d!38735 (= (choose!767 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) lt!65165 (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2782 newMap!16)) _$8!109)))

(declare-fun bs!5302 () Bool)

(assert (= bs!5302 d!38735))

(assert (=> bs!5302 m!147325))

(assert (=> bs!5302 m!147325))

(assert (=> bs!5302 m!147519))

(assert (=> bs!5302 m!147215))

(assert (=> bs!5302 m!147521))

(assert (=> d!38167 d!38735))

(assert (=> d!38167 d!38379))

(declare-fun d!38737 () Bool)

(declare-fun lt!66019 () (_ BitVec 32))

(assert (=> d!38737 (and (bvsge lt!66019 #b00000000000000000000000000000000) (bvsle lt!66019 (bvsub (size!2480 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(declare-fun e!83247 () (_ BitVec 32))

(assert (=> d!38737 (= lt!66019 e!83247)))

(declare-fun c!23408 () Bool)

(assert (=> d!38737 (= c!23408 (bvsge #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(assert (=> d!38737 (and (bvsle #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2480 (_keys!4515 (_2!1274 lt!65152))) (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(assert (=> d!38737 (= (arrayCountValidKeys!0 (_keys!4515 (_2!1274 lt!65152)) #b00000000000000000000000000000000 (size!2480 (_keys!4515 (_2!1274 lt!65152)))) lt!66019)))

(declare-fun b!127541 () Bool)

(declare-fun e!83246 () (_ BitVec 32))

(declare-fun call!13742 () (_ BitVec 32))

(assert (=> b!127541 (= e!83246 (bvadd #b00000000000000000000000000000001 call!13742))))

(declare-fun bm!13739 () Bool)

(assert (=> bm!13739 (= call!13742 (arrayCountValidKeys!0 (_keys!4515 (_2!1274 lt!65152)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 (_2!1274 lt!65152)))))))

(declare-fun b!127542 () Bool)

(assert (=> b!127542 (= e!83246 call!13742)))

(declare-fun b!127543 () Bool)

(assert (=> b!127543 (= e!83247 #b00000000000000000000000000000000)))

(declare-fun b!127544 () Bool)

(assert (=> b!127544 (= e!83247 e!83246)))

(declare-fun c!23407 () Bool)

(assert (=> b!127544 (= c!23407 (validKeyInArray!0 (select (arr!2216 (_keys!4515 (_2!1274 lt!65152))) #b00000000000000000000000000000000)))))

(assert (= (and d!38737 c!23408) b!127543))

(assert (= (and d!38737 (not c!23408)) b!127544))

(assert (= (and b!127544 c!23407) b!127541))

(assert (= (and b!127544 (not c!23407)) b!127542))

(assert (= (or b!127541 b!127542) bm!13739))

(declare-fun m!149513 () Bool)

(assert (=> bm!13739 m!149513))

(assert (=> b!127544 m!148555))

(assert (=> b!127544 m!148555))

(assert (=> b!127544 m!148557))

(assert (=> b!126520 d!38737))

(declare-fun d!38739 () Bool)

(declare-fun e!83249 () Bool)

(assert (=> d!38739 e!83249))

(declare-fun res!61642 () Bool)

(assert (=> d!38739 (=> res!61642 e!83249)))

(declare-fun lt!66021 () Bool)

(assert (=> d!38739 (= res!61642 (not lt!66021))))

(declare-fun lt!66020 () Bool)

(assert (=> d!38739 (= lt!66021 lt!66020)))

(declare-fun lt!66023 () Unit!3928)

(declare-fun e!83248 () Unit!3928)

(assert (=> d!38739 (= lt!66023 e!83248)))

(declare-fun c!23409 () Bool)

(assert (=> d!38739 (= c!23409 lt!66020)))

(assert (=> d!38739 (= lt!66020 (containsKey!171 (toList!832 lt!65467) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38739 (= (contains!864 lt!65467 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!66021)))

(declare-fun b!127545 () Bool)

(declare-fun lt!66022 () Unit!3928)

(assert (=> b!127545 (= e!83248 lt!66022)))

(assert (=> b!127545 (= lt!66022 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65467) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!127545 (isDefined!120 (getValueByKey!168 (toList!832 lt!65467) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127546 () Bool)

(declare-fun Unit!3983 () Unit!3928)

(assert (=> b!127546 (= e!83248 Unit!3983)))

(declare-fun b!127547 () Bool)

(assert (=> b!127547 (= e!83249 (isDefined!120 (getValueByKey!168 (toList!832 lt!65467) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38739 c!23409) b!127545))

(assert (= (and d!38739 (not c!23409)) b!127546))

(assert (= (and d!38739 (not res!61642)) b!127547))

(declare-fun m!149515 () Bool)

(assert (=> d!38739 m!149515))

(declare-fun m!149517 () Bool)

(assert (=> b!127545 m!149517))

(assert (=> b!127545 m!147833))

(assert (=> b!127545 m!147833))

(declare-fun m!149519 () Bool)

(assert (=> b!127545 m!149519))

(assert (=> b!127547 m!147833))

(assert (=> b!127547 m!147833))

(assert (=> b!127547 m!149519))

(assert (=> d!38229 d!38739))

(declare-fun b!127551 () Bool)

(declare-fun e!83251 () Option!174)

(assert (=> b!127551 (= e!83251 None!172)))

(declare-fun b!127548 () Bool)

(declare-fun e!83250 () Option!174)

(assert (=> b!127548 (= e!83250 (Some!173 (_2!1273 (h!2276 lt!65468))))))

(declare-fun b!127550 () Bool)

(assert (=> b!127550 (= e!83251 (getValueByKey!168 (t!6017 lt!65468) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun d!38741 () Bool)

(declare-fun c!23410 () Bool)

(assert (=> d!38741 (= c!23410 (and ((_ is Cons!1674) lt!65468) (= (_1!1273 (h!2276 lt!65468)) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38741 (= (getValueByKey!168 lt!65468 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) e!83250)))

(declare-fun b!127549 () Bool)

(assert (=> b!127549 (= e!83250 e!83251)))

(declare-fun c!23411 () Bool)

(assert (=> b!127549 (= c!23411 (and ((_ is Cons!1674) lt!65468) (not (= (_1!1273 (h!2276 lt!65468)) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38741 c!23410) b!127548))

(assert (= (and d!38741 (not c!23410)) b!127549))

(assert (= (and b!127549 c!23411) b!127550))

(assert (= (and b!127549 (not c!23411)) b!127551))

(declare-fun m!149521 () Bool)

(assert (=> b!127550 m!149521))

(assert (=> d!38229 d!38741))

(declare-fun d!38743 () Bool)

(assert (=> d!38743 (= (getValueByKey!168 lt!65468 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) (Some!173 (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!66024 () Unit!3928)

(assert (=> d!38743 (= lt!66024 (choose!776 lt!65468 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!83252 () Bool)

(assert (=> d!38743 e!83252))

(declare-fun res!61643 () Bool)

(assert (=> d!38743 (=> (not res!61643) (not e!83252))))

(assert (=> d!38743 (= res!61643 (isStrictlySorted!304 lt!65468))))

(assert (=> d!38743 (= (lemmaContainsTupThenGetReturnValue!83 lt!65468 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!66024)))

(declare-fun b!127552 () Bool)

(declare-fun res!61644 () Bool)

(assert (=> b!127552 (=> (not res!61644) (not e!83252))))

(assert (=> b!127552 (= res!61644 (containsKey!171 lt!65468 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127553 () Bool)

(assert (=> b!127553 (= e!83252 (contains!866 lt!65468 (tuple2!2525 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38743 res!61643) b!127552))

(assert (= (and b!127552 res!61644) b!127553))

(assert (=> d!38743 m!147827))

(declare-fun m!149523 () Bool)

(assert (=> d!38743 m!149523))

(declare-fun m!149525 () Bool)

(assert (=> d!38743 m!149525))

(declare-fun m!149527 () Bool)

(assert (=> b!127552 m!149527))

(declare-fun m!149529 () Bool)

(assert (=> b!127553 m!149529))

(assert (=> d!38229 d!38743))

(declare-fun bm!13740 () Bool)

(declare-fun call!13744 () List!1678)

(declare-fun call!13745 () List!1678)

(assert (=> bm!13740 (= call!13744 call!13745)))

(declare-fun b!127554 () Bool)

(declare-fun e!83257 () List!1678)

(declare-fun call!13743 () List!1678)

(assert (=> b!127554 (= e!83257 call!13743)))

(declare-fun b!127555 () Bool)

(declare-fun e!83254 () List!1678)

(assert (=> b!127555 (= e!83254 (insertStrictlySorted!86 (t!6017 (toList!832 lt!65223)) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127556 () Bool)

(declare-fun e!83256 () List!1678)

(declare-fun e!83253 () List!1678)

(assert (=> b!127556 (= e!83256 e!83253)))

(declare-fun c!23414 () Bool)

(assert (=> b!127556 (= c!23414 (and ((_ is Cons!1674) (toList!832 lt!65223)) (= (_1!1273 (h!2276 (toList!832 lt!65223))) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun c!23415 () Bool)

(declare-fun b!127557 () Bool)

(assert (=> b!127557 (= e!83254 (ite c!23414 (t!6017 (toList!832 lt!65223)) (ite c!23415 (Cons!1674 (h!2276 (toList!832 lt!65223)) (t!6017 (toList!832 lt!65223))) Nil!1675)))))

(declare-fun b!127558 () Bool)

(assert (=> b!127558 (= e!83257 call!13743)))

(declare-fun b!127559 () Bool)

(assert (=> b!127559 (= e!83256 call!13745)))

(declare-fun bm!13741 () Bool)

(declare-fun c!23412 () Bool)

(assert (=> bm!13741 (= call!13745 ($colon$colon!88 e!83254 (ite c!23412 (h!2276 (toList!832 lt!65223)) (tuple2!2525 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23413 () Bool)

(assert (=> bm!13741 (= c!23413 c!23412)))

(declare-fun d!38745 () Bool)

(declare-fun e!83255 () Bool)

(assert (=> d!38745 e!83255))

(declare-fun res!61646 () Bool)

(assert (=> d!38745 (=> (not res!61646) (not e!83255))))

(declare-fun lt!66025 () List!1678)

(assert (=> d!38745 (= res!61646 (isStrictlySorted!304 lt!66025))))

(assert (=> d!38745 (= lt!66025 e!83256)))

(assert (=> d!38745 (= c!23412 (and ((_ is Cons!1674) (toList!832 lt!65223)) (bvslt (_1!1273 (h!2276 (toList!832 lt!65223))) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38745 (isStrictlySorted!304 (toList!832 lt!65223))))

(assert (=> d!38745 (= (insertStrictlySorted!86 (toList!832 lt!65223) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!66025)))

(declare-fun b!127560 () Bool)

(assert (=> b!127560 (= c!23415 (and ((_ is Cons!1674) (toList!832 lt!65223)) (bvsgt (_1!1273 (h!2276 (toList!832 lt!65223))) (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!127560 (= e!83253 e!83257)))

(declare-fun b!127561 () Bool)

(assert (=> b!127561 (= e!83253 call!13744)))

(declare-fun b!127562 () Bool)

(declare-fun res!61645 () Bool)

(assert (=> b!127562 (=> (not res!61645) (not e!83255))))

(assert (=> b!127562 (= res!61645 (containsKey!171 lt!66025 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun bm!13742 () Bool)

(assert (=> bm!13742 (= call!13743 call!13744)))

(declare-fun b!127563 () Bool)

(assert (=> b!127563 (= e!83255 (contains!866 lt!66025 (tuple2!2525 (_1!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))) (_2!1273 (tuple2!2525 lt!65216 (minValue!2645 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38745 c!23412) b!127559))

(assert (= (and d!38745 (not c!23412)) b!127556))

(assert (= (and b!127556 c!23414) b!127561))

(assert (= (and b!127556 (not c!23414)) b!127560))

(assert (= (and b!127560 c!23415) b!127554))

(assert (= (and b!127560 (not c!23415)) b!127558))

(assert (= (or b!127554 b!127558) bm!13742))

(assert (= (or b!127561 bm!13742) bm!13740))

(assert (= (or b!127559 bm!13740) bm!13741))

(assert (= (and bm!13741 c!23413) b!127555))

(assert (= (and bm!13741 (not c!23413)) b!127557))

(assert (= (and d!38745 res!61646) b!127562))

(assert (= (and b!127562 res!61645) b!127563))

(declare-fun m!149531 () Bool)

(assert (=> b!127563 m!149531))

(declare-fun m!149533 () Bool)

(assert (=> b!127555 m!149533))

(declare-fun m!149535 () Bool)

(assert (=> b!127562 m!149535))

(declare-fun m!149537 () Bool)

(assert (=> d!38745 m!149537))

(declare-fun m!149539 () Bool)

(assert (=> d!38745 m!149539))

(declare-fun m!149541 () Bool)

(assert (=> bm!13741 m!149541))

(assert (=> d!38229 d!38745))

(declare-fun d!38747 () Bool)

(assert (=> d!38747 (isDefined!120 (getValueByKey!168 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!66026 () Unit!3928)

(assert (=> d!38747 (= lt!66026 (choose!770 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!83258 () Bool)

(assert (=> d!38747 e!83258))

(declare-fun res!61647 () Bool)

(assert (=> d!38747 (=> (not res!61647) (not e!83258))))

(assert (=> d!38747 (= res!61647 (isStrictlySorted!304 (toList!832 lt!65225)))))

(assert (=> d!38747 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66026)))

(declare-fun b!127564 () Bool)

(assert (=> b!127564 (= e!83258 (containsKey!171 (toList!832 lt!65225) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38747 res!61647) b!127564))

(assert (=> d!38747 m!147373))

(assert (=> d!38747 m!147583))

(assert (=> d!38747 m!147583))

(assert (=> d!38747 m!147821))

(assert (=> d!38747 m!147373))

(declare-fun m!149543 () Bool)

(assert (=> d!38747 m!149543))

(assert (=> d!38747 m!148435))

(assert (=> b!127564 m!147373))

(assert (=> b!127564 m!147817))

(assert (=> b!126704 d!38747))

(assert (=> b!126704 d!38473))

(assert (=> b!126704 d!38475))

(assert (=> bm!13613 d!38199))

(declare-fun d!38749 () Bool)

(declare-fun e!83259 () Bool)

(assert (=> d!38749 e!83259))

(declare-fun res!61649 () Bool)

(assert (=> d!38749 (=> (not res!61649) (not e!83259))))

(declare-fun lt!66027 () ListLongMap!1633)

(assert (=> d!38749 (= res!61649 (contains!864 lt!66027 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(declare-fun lt!66028 () List!1678)

(assert (=> d!38749 (= lt!66027 (ListLongMap!1634 lt!66028))))

(declare-fun lt!66030 () Unit!3928)

(declare-fun lt!66029 () Unit!3928)

(assert (=> d!38749 (= lt!66030 lt!66029)))

(assert (=> d!38749 (= (getValueByKey!168 lt!66028 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38749 (= lt!66029 (lemmaContainsTupThenGetReturnValue!83 lt!66028 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38749 (= lt!66028 (insertStrictlySorted!86 (toList!832 call!13610) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))))))

(assert (=> d!38749 (= (+!164 call!13610 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))) lt!66027)))

(declare-fun b!127565 () Bool)

(declare-fun res!61648 () Bool)

(assert (=> b!127565 (=> (not res!61648) (not e!83259))))

(assert (=> b!127565 (= res!61648 (= (getValueByKey!168 (toList!832 lt!66027) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16)))) (Some!173 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))))

(declare-fun b!127566 () Bool)

(assert (=> b!127566 (= e!83259 (contains!866 (toList!832 lt!66027) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2645 newMap!16))))))

(assert (= (and d!38749 res!61649) b!127565))

(assert (= (and b!127565 res!61648) b!127566))

(declare-fun m!149545 () Bool)

(assert (=> d!38749 m!149545))

(declare-fun m!149547 () Bool)

(assert (=> d!38749 m!149547))

(declare-fun m!149549 () Bool)

(assert (=> d!38749 m!149549))

(declare-fun m!149551 () Bool)

(assert (=> d!38749 m!149551))

(declare-fun m!149553 () Bool)

(assert (=> b!127565 m!149553))

(declare-fun m!149555 () Bool)

(assert (=> b!127566 m!149555))

(assert (=> b!126516 d!38749))

(declare-fun d!38751 () Bool)

(assert (=> d!38751 (contains!864 (getCurrentListMap!512 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))

(declare-fun lt!66033 () Unit!3928)

(declare-fun choose!779 (array!4681 array!4683 (_ BitVec 32) (_ BitVec 32) V!3433 V!3433 (_ BitVec 64) (_ BitVec 32) Int) Unit!3928)

(assert (=> d!38751 (= lt!66033 (choose!779 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)))))

(assert (=> d!38751 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38751 (= (lemmaArrayContainsKeyThenInListMap!37 (_keys!4515 newMap!16) (_values!2765 newMap!16) (mask!7038 newMap!16) (extraKeys!2563 newMap!16) (zeroValue!2645 newMap!16) (minValue!2645 newMap!16) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2782 newMap!16)) lt!66033)))

(declare-fun bs!5303 () Bool)

(assert (= bs!5303 d!38751))

(assert (=> bs!5303 m!147325))

(assert (=> bs!5303 m!147325))

(assert (=> bs!5303 m!147207))

(assert (=> bs!5303 m!147343))

(assert (=> bs!5303 m!147207))

(declare-fun m!149557 () Bool)

(assert (=> bs!5303 m!149557))

(assert (=> bs!5303 m!147517))

(assert (=> b!126474 d!38751))

(assert (=> b!126474 d!38267))

(assert (=> b!126474 d!38183))

(assert (=> b!126663 d!38381))

(declare-fun d!38753 () Bool)

(assert (=> d!38753 (= (apply!111 lt!65356 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!168 (toList!832 lt!65356) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5304 () Bool)

(assert (= bs!5304 d!38753))

(assert (=> bs!5304 m!148323))

(assert (=> bs!5304 m!148323))

(declare-fun m!149559 () Bool)

(assert (=> bs!5304 m!149559))

(assert (=> b!126512 d!38753))

(assert (=> b!126487 d!38487))

(declare-fun d!38755 () Bool)

(declare-fun e!83260 () Bool)

(assert (=> d!38755 e!83260))

(declare-fun res!61651 () Bool)

(assert (=> d!38755 (=> (not res!61651) (not e!83260))))

(declare-fun lt!66034 () ListLongMap!1633)

(assert (=> d!38755 (= res!61651 (contains!864 lt!66034 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66035 () List!1678)

(assert (=> d!38755 (= lt!66034 (ListLongMap!1634 lt!66035))))

(declare-fun lt!66037 () Unit!3928)

(declare-fun lt!66036 () Unit!3928)

(assert (=> d!38755 (= lt!66037 lt!66036)))

(assert (=> d!38755 (= (getValueByKey!168 lt!66035 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38755 (= lt!66036 (lemmaContainsTupThenGetReturnValue!83 lt!66035 (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38755 (= lt!66035 (insertStrictlySorted!86 (toList!832 (map!1380 newMap!16)) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38755 (= (+!164 (map!1380 newMap!16) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66034)))

(declare-fun b!127567 () Bool)

(declare-fun res!61650 () Bool)

(assert (=> b!127567 (=> (not res!61650) (not e!83260))))

(assert (=> b!127567 (= res!61650 (= (getValueByKey!168 (toList!832 lt!66034) (_1!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!173 (_2!1273 (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127568 () Bool)

(assert (=> b!127568 (= e!83260 (contains!866 (toList!832 lt!66034) (tuple2!2525 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1452 (select (arr!2217 (_values!2765 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!416 (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38755 res!61651) b!127567))

(assert (= (and b!127567 res!61650) b!127568))

(declare-fun m!149561 () Bool)

(assert (=> d!38755 m!149561))

(declare-fun m!149563 () Bool)

(assert (=> d!38755 m!149563))

(declare-fun m!149565 () Bool)

(assert (=> d!38755 m!149565))

(declare-fun m!149567 () Bool)

(assert (=> d!38755 m!149567))

(declare-fun m!149569 () Bool)

(assert (=> b!127567 m!149569))

(declare-fun m!149571 () Bool)

(assert (=> b!127568 m!149571))

(assert (=> b!126487 d!38755))

(assert (=> b!126487 d!38145))

(declare-fun d!38757 () Bool)

(assert (=> d!38757 (arrayContainsKey!0 (_keys!4515 newMap!16) lt!65429 #b00000000000000000000000000000000)))

(declare-fun lt!66038 () Unit!3928)

(assert (=> d!38757 (= lt!66038 (choose!13 (_keys!4515 newMap!16) lt!65429 #b00000000000000000000000000000000))))

(assert (=> d!38757 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!38757 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4515 newMap!16) lt!65429 #b00000000000000000000000000000000) lt!66038)))

(declare-fun bs!5305 () Bool)

(assert (= bs!5305 d!38757))

(assert (=> bs!5305 m!147729))

(declare-fun m!149573 () Bool)

(assert (=> bs!5305 m!149573))

(assert (=> b!126647 d!38757))

(declare-fun d!38759 () Bool)

(declare-fun res!61652 () Bool)

(declare-fun e!83261 () Bool)

(assert (=> d!38759 (=> res!61652 e!83261)))

(assert (=> d!38759 (= res!61652 (= (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) lt!65429))))

(assert (=> d!38759 (= (arrayContainsKey!0 (_keys!4515 newMap!16) lt!65429 #b00000000000000000000000000000000) e!83261)))

(declare-fun b!127569 () Bool)

(declare-fun e!83262 () Bool)

(assert (=> b!127569 (= e!83261 e!83262)))

(declare-fun res!61653 () Bool)

(assert (=> b!127569 (=> (not res!61653) (not e!83262))))

(assert (=> b!127569 (= res!61653 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun b!127570 () Bool)

(assert (=> b!127570 (= e!83262 (arrayContainsKey!0 (_keys!4515 newMap!16) lt!65429 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38759 (not res!61652)) b!127569))

(assert (= (and b!127569 res!61653) b!127570))

(assert (=> d!38759 m!147525))

(declare-fun m!149575 () Bool)

(assert (=> b!127570 m!149575))

(assert (=> b!126647 d!38759))

(declare-fun b!127571 () Bool)

(declare-fun e!83264 () SeekEntryResult!264)

(declare-fun lt!66039 () SeekEntryResult!264)

(assert (=> b!127571 (= e!83264 (MissingZero!264 (index!3213 lt!66039)))))

(declare-fun b!127572 () Bool)

(declare-fun e!83265 () SeekEntryResult!264)

(assert (=> b!127572 (= e!83265 Undefined!264)))

(declare-fun b!127573 () Bool)

(declare-fun e!83263 () SeekEntryResult!264)

(assert (=> b!127573 (= e!83263 (Found!264 (index!3213 lt!66039)))))

(declare-fun b!127574 () Bool)

(declare-fun c!23416 () Bool)

(declare-fun lt!66040 () (_ BitVec 64))

(assert (=> b!127574 (= c!23416 (= lt!66040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127574 (= e!83263 e!83264)))

(declare-fun b!127575 () Bool)

(assert (=> b!127575 (= e!83265 e!83263)))

(assert (=> b!127575 (= lt!66040 (select (arr!2216 (_keys!4515 newMap!16)) (index!3213 lt!66039)))))

(declare-fun c!23417 () Bool)

(assert (=> b!127575 (= c!23417 (= lt!66040 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127576 () Bool)

(assert (=> b!127576 (= e!83264 (seekKeyOrZeroReturnVacant!0 (x!14957 lt!66039) (index!3213 lt!66039) (index!3213 lt!66039) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun d!38761 () Bool)

(declare-fun lt!66041 () SeekEntryResult!264)

(assert (=> d!38761 (and (or ((_ is Undefined!264) lt!66041) (not ((_ is Found!264) lt!66041)) (and (bvsge (index!3212 lt!66041) #b00000000000000000000000000000000) (bvslt (index!3212 lt!66041) (size!2480 (_keys!4515 newMap!16))))) (or ((_ is Undefined!264) lt!66041) ((_ is Found!264) lt!66041) (not ((_ is MissingZero!264) lt!66041)) (and (bvsge (index!3211 lt!66041) #b00000000000000000000000000000000) (bvslt (index!3211 lt!66041) (size!2480 (_keys!4515 newMap!16))))) (or ((_ is Undefined!264) lt!66041) ((_ is Found!264) lt!66041) ((_ is MissingZero!264) lt!66041) (not ((_ is MissingVacant!264) lt!66041)) (and (bvsge (index!3214 lt!66041) #b00000000000000000000000000000000) (bvslt (index!3214 lt!66041) (size!2480 (_keys!4515 newMap!16))))) (or ((_ is Undefined!264) lt!66041) (ite ((_ is Found!264) lt!66041) (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3212 lt!66041)) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!264) lt!66041) (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3211 lt!66041)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!264) lt!66041) (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3214 lt!66041)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38761 (= lt!66041 e!83265)))

(declare-fun c!23418 () Bool)

(assert (=> d!38761 (= c!23418 (and ((_ is Intermediate!264) lt!66039) (undefined!1076 lt!66039)))))

(assert (=> d!38761 (= lt!66039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (mask!7038 newMap!16)) (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(assert (=> d!38761 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38761 (= (seekEntryOrOpen!0 (select (arr!2216 (_keys!4515 newMap!16)) #b00000000000000000000000000000000) (_keys!4515 newMap!16) (mask!7038 newMap!16)) lt!66041)))

(assert (= (and d!38761 c!23418) b!127572))

(assert (= (and d!38761 (not c!23418)) b!127575))

(assert (= (and b!127575 c!23417) b!127573))

(assert (= (and b!127575 (not c!23417)) b!127574))

(assert (= (and b!127574 c!23416) b!127571))

(assert (= (and b!127574 (not c!23416)) b!127576))

(declare-fun m!149577 () Bool)

(assert (=> b!127575 m!149577))

(assert (=> b!127576 m!147525))

(declare-fun m!149579 () Bool)

(assert (=> b!127576 m!149579))

(declare-fun m!149581 () Bool)

(assert (=> d!38761 m!149581))

(declare-fun m!149583 () Bool)

(assert (=> d!38761 m!149583))

(assert (=> d!38761 m!147525))

(declare-fun m!149585 () Bool)

(assert (=> d!38761 m!149585))

(declare-fun m!149587 () Bool)

(assert (=> d!38761 m!149587))

(declare-fun m!149589 () Bool)

(assert (=> d!38761 m!149589))

(assert (=> d!38761 m!147525))

(assert (=> d!38761 m!149583))

(assert (=> d!38761 m!147517))

(assert (=> b!126647 d!38761))

(declare-fun d!38763 () Bool)

(declare-fun e!83267 () Bool)

(assert (=> d!38763 e!83267))

(declare-fun res!61654 () Bool)

(assert (=> d!38763 (=> res!61654 e!83267)))

(declare-fun lt!66043 () Bool)

(assert (=> d!38763 (= res!61654 (not lt!66043))))

(declare-fun lt!66042 () Bool)

(assert (=> d!38763 (= lt!66043 lt!66042)))

(declare-fun lt!66045 () Unit!3928)

(declare-fun e!83266 () Unit!3928)

(assert (=> d!38763 (= lt!66045 e!83266)))

(declare-fun c!23419 () Bool)

(assert (=> d!38763 (= c!23419 lt!66042)))

(assert (=> d!38763 (= lt!66042 (containsKey!171 (toList!832 lt!65455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38763 (= (contains!864 lt!65455 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66043)))

(declare-fun b!127577 () Bool)

(declare-fun lt!66044 () Unit!3928)

(assert (=> b!127577 (= e!83266 lt!66044)))

(assert (=> b!127577 (= lt!66044 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!832 lt!65455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127577 (isDefined!120 (getValueByKey!168 (toList!832 lt!65455) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127578 () Bool)

(declare-fun Unit!3984 () Unit!3928)

(assert (=> b!127578 (= e!83266 Unit!3984)))

(declare-fun b!127579 () Bool)

(assert (=> b!127579 (= e!83267 (isDefined!120 (getValueByKey!168 (toList!832 lt!65455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38763 c!23419) b!127577))

(assert (= (and d!38763 (not c!23419)) b!127578))

(assert (= (and d!38763 (not res!61654)) b!127579))

(declare-fun m!149591 () Bool)

(assert (=> d!38763 m!149591))

(declare-fun m!149593 () Bool)

(assert (=> b!127577 m!149593))

(assert (=> b!127577 m!148965))

(assert (=> b!127577 m!148965))

(declare-fun m!149595 () Bool)

(assert (=> b!127577 m!149595))

(assert (=> b!127579 m!148965))

(assert (=> b!127579 m!148965))

(assert (=> b!127579 m!149595))

(assert (=> bm!13637 d!38763))

(declare-fun b!127598 () Bool)

(declare-fun e!83278 () Bool)

(declare-fun lt!66051 () SeekEntryResult!264)

(assert (=> b!127598 (= e!83278 (bvsge (x!14957 lt!66051) #b01111111111111111111111111111110))))

(declare-fun e!83282 () SeekEntryResult!264)

(declare-fun b!127599 () Bool)

(assert (=> b!127599 (= e!83282 (Intermediate!264 false (toIndex!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7038 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!127600 () Bool)

(declare-fun e!83280 () Bool)

(assert (=> b!127600 (= e!83278 e!83280)))

(declare-fun res!61661 () Bool)

(assert (=> b!127600 (= res!61661 (and ((_ is Intermediate!264) lt!66051) (not (undefined!1076 lt!66051)) (bvslt (x!14957 lt!66051) #b01111111111111111111111111111110) (bvsge (x!14957 lt!66051) #b00000000000000000000000000000000) (bvsge (x!14957 lt!66051) #b00000000000000000000000000000000)))))

(assert (=> b!127600 (=> (not res!61661) (not e!83280))))

(declare-fun b!127601 () Bool)

(assert (=> b!127601 (and (bvsge (index!3213 lt!66051) #b00000000000000000000000000000000) (bvslt (index!3213 lt!66051) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun e!83281 () Bool)

(assert (=> b!127601 (= e!83281 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3213 lt!66051)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127602 () Bool)

(assert (=> b!127602 (and (bvsge (index!3213 lt!66051) #b00000000000000000000000000000000) (bvslt (index!3213 lt!66051) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun res!61662 () Bool)

(assert (=> b!127602 (= res!61662 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3213 lt!66051)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127602 (=> res!61662 e!83281)))

(declare-fun b!127603 () Bool)

(declare-fun e!83279 () SeekEntryResult!264)

(assert (=> b!127603 (= e!83279 e!83282)))

(declare-fun lt!66050 () (_ BitVec 64))

(declare-fun c!23426 () Bool)

(assert (=> b!127603 (= c!23426 (or (= lt!66050 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) (= (bvadd lt!66050 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127604 () Bool)

(assert (=> b!127604 (= e!83282 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7038 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7038 newMap!16)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)))))

(declare-fun d!38765 () Bool)

(assert (=> d!38765 e!83278))

(declare-fun c!23428 () Bool)

(assert (=> d!38765 (= c!23428 (and ((_ is Intermediate!264) lt!66051) (undefined!1076 lt!66051)))))

(assert (=> d!38765 (= lt!66051 e!83279)))

(declare-fun c!23427 () Bool)

(assert (=> d!38765 (= c!23427 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!38765 (= lt!66050 (select (arr!2216 (_keys!4515 newMap!16)) (toIndex!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7038 newMap!16))))))

(assert (=> d!38765 (validMask!0 (mask!7038 newMap!16))))

(assert (=> d!38765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7038 newMap!16)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4515 newMap!16) (mask!7038 newMap!16)) lt!66051)))

(declare-fun b!127605 () Bool)

(assert (=> b!127605 (= e!83279 (Intermediate!264 true (toIndex!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7038 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!127606 () Bool)

(assert (=> b!127606 (and (bvsge (index!3213 lt!66051) #b00000000000000000000000000000000) (bvslt (index!3213 lt!66051) (size!2480 (_keys!4515 newMap!16))))))

(declare-fun res!61663 () Bool)

(assert (=> b!127606 (= res!61663 (= (select (arr!2216 (_keys!4515 newMap!16)) (index!3213 lt!66051)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!127606 (=> res!61663 e!83281)))

(assert (=> b!127606 (= e!83280 e!83281)))

(assert (= (and d!38765 c!23427) b!127605))

(assert (= (and d!38765 (not c!23427)) b!127603))

(assert (= (and b!127603 c!23426) b!127599))

(assert (= (and b!127603 (not c!23426)) b!127604))

(assert (= (and d!38765 c!23428) b!127598))

(assert (= (and d!38765 (not c!23428)) b!127600))

(assert (= (and b!127600 res!61661) b!127606))

(assert (= (and b!127606 (not res!61663)) b!127602))

(assert (= (and b!127602 (not res!61662)) b!127601))

(assert (=> d!38765 m!147683))

(declare-fun m!149597 () Bool)

(assert (=> d!38765 m!149597))

(assert (=> d!38765 m!147517))

(declare-fun m!149599 () Bool)

(assert (=> b!127601 m!149599))

(assert (=> b!127606 m!149599))

(assert (=> b!127602 m!149599))

(assert (=> b!127604 m!147683))

(declare-fun m!149601 () Bool)

(assert (=> b!127604 m!149601))

(assert (=> b!127604 m!149601))

(assert (=> b!127604 m!147207))

(declare-fun m!149603 () Bool)

(assert (=> b!127604 m!149603))

(assert (=> d!38189 d!38765))

(declare-fun d!38767 () Bool)

(declare-fun lt!66057 () (_ BitVec 32))

(declare-fun lt!66056 () (_ BitVec 32))

(assert (=> d!38767 (= lt!66057 (bvmul (bvxor lt!66056 (bvlshr lt!66056 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!38767 (= lt!66056 ((_ extract 31 0) (bvand (bvxor (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (bvlshr (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!38767 (and (bvsge (mask!7038 newMap!16) #b00000000000000000000000000000000) (let ((res!61664 (let ((h!2279 ((_ extract 31 0) (bvand (bvxor (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (bvlshr (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15061 (bvmul (bvxor h!2279 (bvlshr h!2279 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15061 (bvlshr x!15061 #b00000000000000000000000000001101)) (mask!7038 newMap!16)))))) (and (bvslt res!61664 (bvadd (mask!7038 newMap!16) #b00000000000000000000000000000001)) (bvsge res!61664 #b00000000000000000000000000000000))))))

(assert (=> d!38767 (= (toIndex!0 (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7038 newMap!16)) (bvand (bvxor lt!66057 (bvlshr lt!66057 #b00000000000000000000000000001101)) (mask!7038 newMap!16)))))

(assert (=> d!38189 d!38767))

(assert (=> d!38189 d!38379))

(declare-fun d!38769 () Bool)

(declare-fun res!61665 () Bool)

(declare-fun e!83283 () Bool)

(assert (=> d!38769 (=> res!61665 e!83283)))

(assert (=> d!38769 (= res!61665 (and ((_ is Cons!1674) (toList!832 call!13566)) (= (_1!1273 (h!2276 (toList!832 call!13566))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38769 (= (containsKey!171 (toList!832 call!13566) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)) e!83283)))

(declare-fun b!127607 () Bool)

(declare-fun e!83284 () Bool)

(assert (=> b!127607 (= e!83283 e!83284)))

(declare-fun res!61666 () Bool)

(assert (=> b!127607 (=> (not res!61666) (not e!83284))))

(assert (=> b!127607 (= res!61666 (and (or (not ((_ is Cons!1674) (toList!832 call!13566))) (bvsle (_1!1273 (h!2276 (toList!832 call!13566))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))) ((_ is Cons!1674) (toList!832 call!13566)) (bvslt (_1!1273 (h!2276 (toList!832 call!13566))) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun b!127608 () Bool)

(assert (=> b!127608 (= e!83284 (containsKey!171 (t!6017 (toList!832 call!13566)) (select (arr!2216 (_keys!4515 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38769 (not res!61665)) b!127607))

(assert (= (and b!127607 res!61666) b!127608))

(assert (=> b!127608 m!147207))

(declare-fun m!149605 () Bool)

(assert (=> b!127608 m!149605))

(assert (=> d!38187 d!38769))

(declare-fun d!38771 () Bool)

(assert (=> d!38771 (= (get!1456 (getValueByKey!168 (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65212)) (v!3130 (getValueByKey!168 (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65212)))))

(assert (=> d!38257 d!38771))

(declare-fun b!127612 () Bool)

(declare-fun e!83286 () Option!174)

(assert (=> b!127612 (= e!83286 None!172)))

(declare-fun b!127609 () Bool)

(declare-fun e!83285 () Option!174)

(assert (=> b!127609 (= e!83285 (Some!173 (_2!1273 (h!2276 (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))))))))

(declare-fun b!127611 () Bool)

(assert (=> b!127611 (= e!83286 (getValueByKey!168 (t!6017 (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) lt!65212))))

(declare-fun d!38773 () Bool)

(declare-fun c!23429 () Bool)

(assert (=> d!38773 (= c!23429 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65212)))))

(assert (=> d!38773 (= (getValueByKey!168 (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))) lt!65212) e!83285)))

(declare-fun b!127610 () Bool)

(assert (=> b!127610 (= e!83285 e!83286)))

(declare-fun c!23430 () Bool)

(assert (=> b!127610 (= c!23430 (and ((_ is Cons!1674) (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992))))))) (not (= (_1!1273 (h!2276 (toList!832 (+!164 lt!65214 (tuple2!2525 lt!65222 (zeroValue!2645 (v!3124 (underlying!439 thiss!992)))))))) lt!65212))))))

(assert (= (and d!38773 c!23429) b!127609))

(assert (= (and d!38773 (not c!23429)) b!127610))

(assert (= (and b!127610 c!23430) b!127611))

(assert (= (and b!127610 (not c!23430)) b!127612))

(declare-fun m!149607 () Bool)

(assert (=> b!127611 m!149607))

(assert (=> d!38257 d!38773))

(declare-fun condMapEmpty!4513 () Bool)

(declare-fun mapDefault!4513 () ValueCell!1076)

(assert (=> mapNonEmpty!4511 (= condMapEmpty!4513 (= mapRest!4511 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4513)))))

(declare-fun e!83287 () Bool)

(declare-fun mapRes!4513 () Bool)

(assert (=> mapNonEmpty!4511 (= tp!10973 (and e!83287 mapRes!4513))))

(declare-fun b!127613 () Bool)

(declare-fun e!83288 () Bool)

(assert (=> b!127613 (= e!83288 tp_is_empty!2839)))

(declare-fun mapNonEmpty!4513 () Bool)

(declare-fun tp!10975 () Bool)

(assert (=> mapNonEmpty!4513 (= mapRes!4513 (and tp!10975 e!83288))))

(declare-fun mapKey!4513 () (_ BitVec 32))

(declare-fun mapRest!4513 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapValue!4513 () ValueCell!1076)

(assert (=> mapNonEmpty!4513 (= mapRest!4511 (store mapRest!4513 mapKey!4513 mapValue!4513))))

(declare-fun b!127614 () Bool)

(assert (=> b!127614 (= e!83287 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4513 () Bool)

(assert (=> mapIsEmpty!4513 mapRes!4513))

(assert (= (and mapNonEmpty!4511 condMapEmpty!4513) mapIsEmpty!4513))

(assert (= (and mapNonEmpty!4511 (not condMapEmpty!4513)) mapNonEmpty!4513))

(assert (= (and mapNonEmpty!4513 ((_ is ValueCellFull!1076) mapValue!4513)) b!127613))

(assert (= (and mapNonEmpty!4511 ((_ is ValueCellFull!1076) mapDefault!4513)) b!127614))

(declare-fun m!149609 () Bool)

(assert (=> mapNonEmpty!4513 m!149609))

(declare-fun condMapEmpty!4514 () Bool)

(declare-fun mapDefault!4514 () ValueCell!1076)

(assert (=> mapNonEmpty!4512 (= condMapEmpty!4514 (= mapRest!4512 ((as const (Array (_ BitVec 32) ValueCell!1076)) mapDefault!4514)))))

(declare-fun e!83289 () Bool)

(declare-fun mapRes!4514 () Bool)

(assert (=> mapNonEmpty!4512 (= tp!10974 (and e!83289 mapRes!4514))))

(declare-fun b!127615 () Bool)

(declare-fun e!83290 () Bool)

(assert (=> b!127615 (= e!83290 tp_is_empty!2839)))

(declare-fun mapNonEmpty!4514 () Bool)

(declare-fun tp!10976 () Bool)

(assert (=> mapNonEmpty!4514 (= mapRes!4514 (and tp!10976 e!83290))))

(declare-fun mapRest!4514 () (Array (_ BitVec 32) ValueCell!1076))

(declare-fun mapKey!4514 () (_ BitVec 32))

(declare-fun mapValue!4514 () ValueCell!1076)

(assert (=> mapNonEmpty!4514 (= mapRest!4512 (store mapRest!4514 mapKey!4514 mapValue!4514))))

(declare-fun b!127616 () Bool)

(assert (=> b!127616 (= e!83289 tp_is_empty!2839)))

(declare-fun mapIsEmpty!4514 () Bool)

(assert (=> mapIsEmpty!4514 mapRes!4514))

(assert (= (and mapNonEmpty!4512 condMapEmpty!4514) mapIsEmpty!4514))

(assert (= (and mapNonEmpty!4512 (not condMapEmpty!4514)) mapNonEmpty!4514))

(assert (= (and mapNonEmpty!4514 ((_ is ValueCellFull!1076) mapValue!4514)) b!127615))

(assert (= (and mapNonEmpty!4512 ((_ is ValueCellFull!1076) mapDefault!4514)) b!127616))

(declare-fun m!149611 () Bool)

(assert (=> mapNonEmpty!4514 m!149611))

(declare-fun b_lambda!5627 () Bool)

(assert (= b_lambda!5625 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5627)))

(declare-fun b_lambda!5629 () Bool)

(assert (= b_lambda!5615 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5629)))

(declare-fun b_lambda!5631 () Bool)

(assert (= b_lambda!5617 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5631)))

(declare-fun b_lambda!5633 () Bool)

(assert (= b_lambda!5611 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5633)))

(declare-fun b_lambda!5635 () Bool)

(assert (= b_lambda!5613 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5635)))

(declare-fun b_lambda!5637 () Bool)

(assert (= b_lambda!5609 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5637)))

(declare-fun b_lambda!5639 () Bool)

(assert (= b_lambda!5601 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5639)))

(declare-fun b_lambda!5641 () Bool)

(assert (= b_lambda!5603 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5641)))

(declare-fun b_lambda!5643 () Bool)

(assert (= b_lambda!5621 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5643)))

(declare-fun b_lambda!5645 () Bool)

(assert (= b_lambda!5597 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5645)))

(declare-fun b_lambda!5647 () Bool)

(assert (= b_lambda!5605 (or (and b!126102 b_free!2845) (and b!126097 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))))) b_lambda!5647)))

(declare-fun b_lambda!5649 () Bool)

(assert (= b_lambda!5599 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5649)))

(declare-fun b_lambda!5651 () Bool)

(assert (= b_lambda!5607 (or (and b!126102 b_free!2845) (and b!126097 b_free!2847 (= (defaultEntry!2782 newMap!16) (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))))) b_lambda!5651)))

(declare-fun b_lambda!5653 () Bool)

(assert (= b_lambda!5619 (or (and b!126102 b_free!2845 (= (defaultEntry!2782 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2782 newMap!16))) (and b!126097 b_free!2847) b_lambda!5653)))

(check-sat (not b!127190) (not d!38499) (not d!38647) (not b!127577) (not b!127294) (not b!126908) (not b!127174) (not b!127604) (not b!127539) (not b!127499) (not b!127160) (not b!127221) (not d!38627) (not b!127512) (not b!127437) (not b!127218) (not b!127046) (not d!38297) (not bm!13670) (not d!38377) (not b!127430) (not bm!13715) (not b!126780) (not d!38513) (not d!38739) (not b!127411) (not b!126830) (not d!38625) (not d!38509) (not bm!13651) (not d!38309) (not b!126836) (not b!127010) (not d!38521) (not bm!13686) (not d!38411) (not b!127155) (not mapNonEmpty!4513) (not d!38675) (not b!127325) (not d!38487) (not b_lambda!5641) (not d!38563) (not b!126955) (not b!126792) (not b!126922) (not d!38455) (not b!127202) (not b!127067) (not b!127150) (not b!126878) (not d!38511) (not b!126994) (not b!127120) (not b!127322) (not b!126912) (not b!127193) (not b!127291) (not b!126940) (not d!38285) (not b!127312) (not b!127241) (not b!127418) (not b!127087) (not b!126938) (not d!38735) (not b!126966) (not b!127170) (not d!38275) (not d!38681) (not bm!13730) (not d!38495) (not bm!13673) (not b!127141) (not b!126837) (not b_lambda!5629) (not b!127233) (not b_lambda!5633) (not b!127372) (not d!38445) (not d!38585) b_and!7863 (not b!127384) (not d!38747) (not d!38683) (not b!127096) (not bm!13652) (not b!127124) (not d!38667) (not b!126835) (not d!38751) (not bm!13714) (not d!38639) (not b_lambda!5593) (not b!127158) (not b!127339) (not b!127439) (not b!127517) (not b!126791) (not bm!13697) (not bm!13677) (not b!126821) (not d!38519) (not d!38489) (not b!127118) (not b!126879) (not bm!13732) (not d!38691) (not bm!13691) (not bm!13693) (not b!127301) (not bm!13717) (not d!38467) (not d!38505) (not b!126982) (not b!126913) (not b!127050) (not d!38313) (not b!126963) (not d!38689) (not bm!13654) (not b!127000) (not b!126803) (not b!127275) (not b!127433) (not b!126947) (not d!38661) (not b!127133) (not d!38553) (not b!127125) (not b!127200) (not d!38401) (not b!126926) (not b!127547) (not b_lambda!5589) (not b_lambda!5587) (not b!127522) (not b_lambda!5647) (not d!38409) (not bm!13641) (not b!126950) (not b!127302) (not d!38365) (not b!127421) (not d!38281) (not b!127535) (not b!127579) (not b!127366) (not bm!13716) (not b!126789) (not b!126849) (not b!127472) (not b!127262) (not b!127611) (not b!127507) (not bm!13672) (not b!126949) (not b!127090) (not b!126972) (not b!126909) (not b!127544) (not b!126798) (not b!126951) (not d!38277) (not d!38559) (not b!127375) (not b!127234) (not d!38619) (not b!127242) (not b!127296) (not b!127011) (not b!127272) (not bm!13649) (not d!38427) (not b!127088) (not b!127164) (not b!127314) (not b!126805) (not d!38469) (not d!38491) (not b_lambda!5649) (not d!38529) (not b!126839) (not b!127231) (not d!38549) (not b_lambda!5623) (not b!127249) (not b!127570) (not b!127538) (not b!126899) (not b!127473) (not b!126871) (not b!127101) (not d!38533) (not b!127014) (not b!127236) (not b!127330) (not d!38719) (not b!127608) (not b!126984) (not mapNonEmpty!4514) (not b!126795) (not b!126953) (not b_lambda!5591) (not b!127459) (not b!127091) (not d!38477) (not b!127373) (not d!38331) (not b!127268) (not b!127452) (not b!127232) (not d!38641) (not d!38457) (not d!38473) (not b!127084) (not d!38391) (not b!127467) (not d!38273) (not bm!13664) (not d!38709) (not b!126812) (not d!38633) (not d!38573) (not d!38671) (not d!38613) (not b!127154) (not b!126979) (not bm!13721) (not bm!13733) (not d!38669) (not d!38523) (not b!127348) (not d!38517) (not b!127304) (not b!127265) (not b!127513) (not b!127568) (not b!127109) (not d!38299) (not b!127403) (not d!38291) (not b!127143) (not d!38483) (not b!127460) (not bm!13657) (not b!127483) (not b!127338) (not b!127395) (not b!127319) (not b_lambda!5571) (not b_lambda!5575) (not b!126937) (not b!127358) (not b!127108) (not d!38545) (not bm!13726) (not b!127576) (not b!127070) (not d!38561) (not b!127317) (not b!127298) (not b!127327) (not b!126804) (not d!38441) (not d!38595) (not d!38575) (not b!127223) (not b!127135) (not b!126930) (not b!127337) (not bm!13684) (not b!127536) (not d!38449) (not d!38733) (not b!127555) (not b!127054) (not b!126785) (not b!126914) (not b!127204) (not d!38497) (not bm!13656) (not b!127469) (not b!126833) (not b!127083) (not b!127252) (not b!127441) (not bm!13724) (not d!38283) (not d!38659) (not b!127500) (not d!38679) (not b!127280) (not b!126790) (not b!127435) (not b!127447) (not d!38537) (not b!127290) (not b!127181) (not d!38701) (not b!127244) (not b!127484) (not b!127487) (not d!38657) (not d!38677) (not b!127398) (not d!38565) (not b!126935) (not d!38645) (not b!127179) (not d!38447) (not bm!13687) (not d!38705) (not b!126906) (not b!127042) (not b!127341) (not b!126787) (not b!126985) (not d!38289) (not b!127434) (not b!127126) (not b!127306) (not d!38693) (not b!126911) (not d!38481) (not b!127195) (not bm!13703) (not b!127140) (not b!127215) (not b!127567) (not b!127061) (not b!127429) (not b!127053) (not b!127442) (not b!126902) (not b!126997) (not d!38685) (not bm!13669) (not d!38711) (not b!127212) (not d!38503) (not b!127428) (not bm!13692) (not b!126971) (not d!38485) (not bm!13741) (not b!127501) (not d!38731) (not b!127116) (not b!126968) (not b!126964) (not d!38543) (not b!127440) (not d!38761) (not d!38373) (not b!127213) (not b!127477) (not b!127525) (not d!38653) (not d!38615) (not d!38493) (not b!127008) (not d!38421) (not d!38303) (not b!127420) (not bm!13712) (not b!127270) (not d!38643) (not d!38425) (not d!38571) (not b!127450) (not b!126814) (not d!38295) (not b!127515) (not b!127183) (not b!127481) (not b!127496) (not d!38337) (not b!126948) (not b!127407) (not b!127448) (not d!38749) (not b!127078) (not bm!13701) (not b!127510) (not b!127533) (not bm!13658) (not b!126987) (not d!38611) (not d!38591) (not b!126954) (not bm!13722) (not b!127128) (not b!127099) (not b!127385) (not d!38387) (not b_lambda!5595) (not d!38593) (not b!127081) (not bm!13739) (not d!38451) (not d!38655) (not b!127152) b_and!7861 (not bm!13723) (not b_next!2845) (not b!127564) (not b!127356) (not b!126788) (not b!127545) (not b!127479) (not b!127504) (not d!38601) (not d!38471) (not b!127173) (not b!126992) (not bm!13734) (not d!38423) (not b!127526) (not d!38301) (not d!38725) (not d!38369) (not b!127071) (not bm!13707) (not b!127151) (not b!126781) (not b!127320) (not d!38307) (not b!127156) (not d!38385) (not b!127278) (not d!38439) (not b!127449) (not b!127260) (not d!38397) (not bm!13671) (not b!127550) (not d!38621) (not b!126817) (not b!127431) (not b!127370) (not b!127361) (not b!127281) (not d!38589) (not b!127566) (not d!38673) (not b_lambda!5653) (not d!38383) (not d!38353) (not d!38567) (not d!38279) (not b!127123) (not d!38765) (not bm!13738) (not b!127220) (not d!38287) (not d!38745) (not d!38501) (not b!127269) (not d!38753) (not b!126848) (not b!127175) (not b_next!2847) (not b!127230) (not bm!13699) (not d!38463) (not b!127392) (not b!126958) (not b!126842) (not d!38583) (not b!127080) (not b!126827) (not d!38557) (not d!38603) (not b!127266) (not d!38327) (not d!38635) (not b!126786) (not d!38699) (not b!127013) (not b!126969) (not b!127063) (not b!127246) (not b_lambda!5637) (not bm!13659) (not b!127316) (not b!127161) (not b_lambda!5627) (not bm!13681) (not b!127113) (not b!127565) (not b!127159) (not d!38763) (not b!127432) (not b!127131) (not b!126929) (not d!38415) (not b!127362) (not b!127171) (not d!38755) (not b!126975) (not b!127445) (not b_lambda!5651) (not b!127444) (not b_lambda!5645) (not bm!13708) (not b!127093) (not d!38605) (not d!38723) (not bm!13705) (not b!127057) (not b!126904) (not d!38541) (not b!127359) (not b!126806) (not b!127001) (not b!126802) (not b!127182) (not b!127553) (not b!127098) (not b!127283) (not b!127391) (not b!127423) (not b!127509) (not b!127562) (not b!127253) (not d!38319) (not b!127197) (not b_lambda!5643) (not bm!13689) (not d!38335) (not b_lambda!5631) (not b!126990) (not b!127184) (not b!127245) (not b!127157) (not d!38343) (not d!38339) (not b!127273) (not d!38507) (not b!127424) (not d!38437) (not d!38293) (not d!38649) (not d!38429) (not b!126799) (not b!126800) (not bm!13706) (not b!127552) (not d!38515) (not b!127470) (not d!38345) (not d!38581) (not bm!13679) (not b!126917) (not bm!13713) (not b!127177) (not b!127476) (not b!127518) (not b!127315) (not b!127563) (not b!127519) (not b!127048) (not d!38305) (not b!127180) (not d!38743) (not b!126784) (not b!127206) (not b!127208) (not d!38371) (not b!127493) (not b!126910) (not b!127138) (not b!126952) (not d!38407) tp_is_empty!2839 (not b!126892) (not b!127345) (not b!126932) (not b!127263) (not d!38757) (not b!127349) (not d!38715) (not b!127169) (not d!38721) (not b!127328) (not b!127387) (not bm!13682) (not b!127410) (not b_lambda!5635) (not bm!13725) (not d!38419) (not bm!13731) (not b!126977) (not b!127064) (not d!38665) (not b!126824) (not b!127456) (not bm!13660) (not b!127176) (not b!127205) (not b!126965) (not d!38663) (not b_lambda!5639))
(check-sat b_and!7861 b_and!7863 (not b_next!2845) (not b_next!2847))
