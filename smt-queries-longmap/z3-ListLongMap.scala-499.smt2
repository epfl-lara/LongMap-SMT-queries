; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11314 () Bool)

(assert start!11314)

(declare-fun b!93611 () Bool)

(declare-fun b_free!2381 () Bool)

(declare-fun b_next!2381 () Bool)

(assert (=> b!93611 (= b_free!2381 (not b_next!2381))))

(declare-fun tp!9407 () Bool)

(declare-fun b_and!5711 () Bool)

(assert (=> b!93611 (= tp!9407 b_and!5711)))

(declare-fun b!93616 () Bool)

(declare-fun b_free!2383 () Bool)

(declare-fun b_next!2383 () Bool)

(assert (=> b!93616 (= b_free!2383 (not b_next!2383))))

(declare-fun tp!9406 () Bool)

(declare-fun b_and!5713 () Bool)

(assert (=> b!93616 (= tp!9406 b_and!5713)))

(declare-fun b!93599 () Bool)

(declare-fun res!47487 () Bool)

(declare-fun e!61115 () Bool)

(assert (=> b!93599 (=> (not res!47487) (not e!61115))))

(declare-datatypes ((V!3123 0))(
  ( (V!3124 (val!1348 Int)) )
))
(declare-datatypes ((array!4187 0))(
  ( (array!4188 (arr!1991 (Array (_ BitVec 32) (_ BitVec 64))) (size!2239 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!960 0))(
  ( (ValueCellFull!960 (v!2753 V!3123)) (EmptyCell!960) )
))
(declare-datatypes ((array!4189 0))(
  ( (array!4190 (arr!1992 (Array (_ BitVec 32) ValueCell!960)) (size!2240 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!828 0))(
  ( (LongMapFixedSize!829 (defaultEntry!2431 Int) (mask!6503 (_ BitVec 32)) (extraKeys!2260 (_ BitVec 32)) (zeroValue!2318 V!3123) (minValue!2318 V!3123) (_size!463 (_ BitVec 32)) (_keys!4113 array!4187) (_values!2414 array!4189) (_vacant!463 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!828)

(declare-fun valid!369 (LongMapFixedSize!828) Bool)

(assert (=> b!93599 (= res!47487 (valid!369 newMap!16))))

(declare-fun b!93600 () Bool)

(declare-fun e!61113 () Bool)

(declare-fun e!61105 () Bool)

(declare-fun mapRes!3654 () Bool)

(assert (=> b!93600 (= e!61113 (and e!61105 mapRes!3654))))

(declare-fun condMapEmpty!3653 () Bool)

(declare-fun mapDefault!3653 () ValueCell!960)

(assert (=> b!93600 (= condMapEmpty!3653 (= (arr!1992 (_values!2414 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!960)) mapDefault!3653)))))

(declare-fun b!93601 () Bool)

(declare-fun e!61116 () Bool)

(declare-fun e!61103 () Bool)

(assert (=> b!93601 (= e!61116 e!61103)))

(declare-fun mapNonEmpty!3653 () Bool)

(declare-fun mapRes!3653 () Bool)

(declare-fun tp!9408 () Bool)

(declare-fun e!61107 () Bool)

(assert (=> mapNonEmpty!3653 (= mapRes!3653 (and tp!9408 e!61107))))

(declare-fun mapRest!3654 () (Array (_ BitVec 32) ValueCell!960))

(declare-fun mapValue!3654 () ValueCell!960)

(declare-datatypes ((Cell!628 0))(
  ( (Cell!629 (v!2754 LongMapFixedSize!828)) )
))
(declare-datatypes ((LongMap!628 0))(
  ( (LongMap!629 (underlying!325 Cell!628)) )
))
(declare-fun thiss!992 () LongMap!628)

(declare-fun mapKey!3654 () (_ BitVec 32))

(assert (=> mapNonEmpty!3653 (= (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) (store mapRest!3654 mapKey!3654 mapValue!3654))))

(declare-fun b!93602 () Bool)

(declare-fun res!47486 () Bool)

(assert (=> b!93602 (=> (not res!47486) (not e!61115))))

(assert (=> b!93602 (= res!47486 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6503 newMap!16)) (_size!463 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun b!93603 () Bool)

(declare-fun e!61114 () Bool)

(declare-fun tp_is_empty!2607 () Bool)

(assert (=> b!93603 (= e!61114 tp_is_empty!2607)))

(declare-fun b!93604 () Bool)

(declare-fun e!61109 () Bool)

(assert (=> b!93604 (= e!61109 tp_is_empty!2607)))

(declare-fun b!93605 () Bool)

(declare-fun e!61104 () Bool)

(assert (=> b!93605 (= e!61115 e!61104)))

(declare-fun res!47490 () Bool)

(assert (=> b!93605 (=> (not res!47490) (not e!61104))))

(declare-datatypes ((tuple2!2302 0))(
  ( (tuple2!2303 (_1!1162 (_ BitVec 64)) (_2!1162 V!3123)) )
))
(declare-datatypes ((List!1564 0))(
  ( (Nil!1561) (Cons!1560 (h!2152 tuple2!2302) (t!5454 List!1564)) )
))
(declare-datatypes ((ListLongMap!1515 0))(
  ( (ListLongMap!1516 (toList!773 List!1564)) )
))
(declare-fun lt!46350 () ListLongMap!1515)

(declare-fun lt!46346 () ListLongMap!1515)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!93605 (= res!47490 (and (= lt!46350 lt!46346) (not (= (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1238 (LongMapFixedSize!828) ListLongMap!1515)

(assert (=> b!93605 (= lt!46346 (map!1238 newMap!16))))

(declare-fun getCurrentListMap!465 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 (_ BitVec 32) Int) ListLongMap!1515)

(assert (=> b!93605 (= lt!46350 (getCurrentListMap!465 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun b!93606 () Bool)

(assert (=> b!93606 (= e!61107 tp_is_empty!2607)))

(declare-fun b!93607 () Bool)

(declare-fun e!61110 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!93607 (= e!61110 (not (validMask!0 (mask!6503 (v!2754 (underlying!325 thiss!992))))))))

(declare-fun b!93608 () Bool)

(declare-datatypes ((Unit!2787 0))(
  ( (Unit!2788) )
))
(declare-fun e!61106 () Unit!2787)

(declare-fun Unit!2789 () Unit!2787)

(assert (=> b!93608 (= e!61106 Unit!2789)))

(declare-fun b!93609 () Bool)

(assert (=> b!93609 (= e!61104 e!61110)))

(declare-fun res!47488 () Bool)

(assert (=> b!93609 (=> (not res!47488) (not e!61110))))

(declare-datatypes ((tuple2!2304 0))(
  ( (tuple2!2305 (_1!1163 Bool) (_2!1163 LongMapFixedSize!828)) )
))
(declare-fun lt!46349 () tuple2!2304)

(assert (=> b!93609 (= res!47488 (and (_1!1163 lt!46349) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!46352 () Unit!2787)

(assert (=> b!93609 (= lt!46352 e!61106)))

(declare-fun c!15583 () Bool)

(declare-fun contains!787 (ListLongMap!1515 (_ BitVec 64)) Bool)

(assert (=> b!93609 (= c!15583 (contains!787 lt!46346 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun update!132 (LongMapFixedSize!828 (_ BitVec 64) V!3123) tuple2!2304)

(declare-fun get!1256 (ValueCell!960 V!3123) V!3123)

(declare-fun dynLambda!360 (Int (_ BitVec 64)) V!3123)

(assert (=> b!93609 (= lt!46349 (update!132 newMap!16 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!93610 () Bool)

(declare-fun e!61117 () Bool)

(assert (=> b!93610 (= e!61117 (and e!61109 mapRes!3653))))

(declare-fun condMapEmpty!3654 () Bool)

(declare-fun mapDefault!3654 () ValueCell!960)

(assert (=> b!93610 (= condMapEmpty!3654 (= (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!960)) mapDefault!3654)))))

(declare-fun array_inv!1237 (array!4187) Bool)

(declare-fun array_inv!1238 (array!4189) Bool)

(assert (=> b!93611 (= e!61103 (and tp!9407 tp_is_empty!2607 (array_inv!1237 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (array_inv!1238 (_values!2414 (v!2754 (underlying!325 thiss!992)))) e!61117))))

(declare-fun mapIsEmpty!3653 () Bool)

(assert (=> mapIsEmpty!3653 mapRes!3654))

(declare-fun mapNonEmpty!3654 () Bool)

(declare-fun tp!9405 () Bool)

(assert (=> mapNonEmpty!3654 (= mapRes!3654 (and tp!9405 e!61114))))

(declare-fun mapKey!3653 () (_ BitVec 32))

(declare-fun mapValue!3653 () ValueCell!960)

(declare-fun mapRest!3653 () (Array (_ BitVec 32) ValueCell!960))

(assert (=> mapNonEmpty!3654 (= (arr!1992 (_values!2414 newMap!16)) (store mapRest!3653 mapKey!3653 mapValue!3653))))

(declare-fun b!93612 () Bool)

(declare-fun Unit!2790 () Unit!2787)

(assert (=> b!93612 (= e!61106 Unit!2790)))

(declare-fun lt!46348 () Unit!2787)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!83 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 (_ BitVec 64) (_ BitVec 32) Int) Unit!2787)

(assert (=> b!93612 (= lt!46348 (lemmaListMapContainsThenArrayContainsFrom!83 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!93612 (arrayContainsKey!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!46347 () Unit!2787)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4187 (_ BitVec 32) (_ BitVec 32)) Unit!2787)

(assert (=> b!93612 (= lt!46347 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1565 0))(
  ( (Nil!1562) (Cons!1561 (h!2153 (_ BitVec 64)) (t!5455 List!1565)) )
))
(declare-fun arrayNoDuplicates!0 (array!4187 (_ BitVec 32) List!1565) Bool)

(assert (=> b!93612 (arrayNoDuplicates!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) from!355 Nil!1562)))

(declare-fun lt!46351 () Unit!2787)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4187 (_ BitVec 32) (_ BitVec 64) List!1565) Unit!2787)

(assert (=> b!93612 (= lt!46351 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (Cons!1561 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) Nil!1562)))))

(assert (=> b!93612 false))

(declare-fun b!93613 () Bool)

(declare-fun e!61102 () Bool)

(assert (=> b!93613 (= e!61102 e!61116)))

(declare-fun b!93614 () Bool)

(declare-fun res!47489 () Bool)

(assert (=> b!93614 (=> (not res!47489) (not e!61115))))

(assert (=> b!93614 (= res!47489 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992)))))))))

(declare-fun b!93615 () Bool)

(assert (=> b!93615 (= e!61105 tp_is_empty!2607)))

(declare-fun res!47485 () Bool)

(assert (=> start!11314 (=> (not res!47485) (not e!61115))))

(declare-fun valid!370 (LongMap!628) Bool)

(assert (=> start!11314 (= res!47485 (valid!370 thiss!992))))

(assert (=> start!11314 e!61115))

(assert (=> start!11314 e!61102))

(assert (=> start!11314 true))

(declare-fun e!61112 () Bool)

(assert (=> start!11314 e!61112))

(declare-fun mapIsEmpty!3654 () Bool)

(assert (=> mapIsEmpty!3654 mapRes!3653))

(assert (=> b!93616 (= e!61112 (and tp!9406 tp_is_empty!2607 (array_inv!1237 (_keys!4113 newMap!16)) (array_inv!1238 (_values!2414 newMap!16)) e!61113))))

(assert (= (and start!11314 res!47485) b!93614))

(assert (= (and b!93614 res!47489) b!93599))

(assert (= (and b!93599 res!47487) b!93602))

(assert (= (and b!93602 res!47486) b!93605))

(assert (= (and b!93605 res!47490) b!93609))

(assert (= (and b!93609 c!15583) b!93612))

(assert (= (and b!93609 (not c!15583)) b!93608))

(assert (= (and b!93609 res!47488) b!93607))

(assert (= (and b!93610 condMapEmpty!3654) mapIsEmpty!3654))

(assert (= (and b!93610 (not condMapEmpty!3654)) mapNonEmpty!3653))

(get-info :version)

(assert (= (and mapNonEmpty!3653 ((_ is ValueCellFull!960) mapValue!3654)) b!93606))

(assert (= (and b!93610 ((_ is ValueCellFull!960) mapDefault!3654)) b!93604))

(assert (= b!93611 b!93610))

(assert (= b!93601 b!93611))

(assert (= b!93613 b!93601))

(assert (= start!11314 b!93613))

(assert (= (and b!93600 condMapEmpty!3653) mapIsEmpty!3653))

(assert (= (and b!93600 (not condMapEmpty!3653)) mapNonEmpty!3654))

(assert (= (and mapNonEmpty!3654 ((_ is ValueCellFull!960) mapValue!3653)) b!93603))

(assert (= (and b!93600 ((_ is ValueCellFull!960) mapDefault!3653)) b!93615))

(assert (= b!93616 b!93600))

(assert (= start!11314 b!93616))

(declare-fun b_lambda!4131 () Bool)

(assert (=> (not b_lambda!4131) (not b!93609)))

(declare-fun t!5451 () Bool)

(declare-fun tb!1857 () Bool)

(assert (=> (and b!93611 (= (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))) t!5451) tb!1857))

(declare-fun result!3167 () Bool)

(assert (=> tb!1857 (= result!3167 tp_is_empty!2607)))

(assert (=> b!93609 t!5451))

(declare-fun b_and!5715 () Bool)

(assert (= b_and!5711 (and (=> t!5451 result!3167) b_and!5715)))

(declare-fun t!5453 () Bool)

(declare-fun tb!1859 () Bool)

(assert (=> (and b!93616 (= (defaultEntry!2431 newMap!16) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))) t!5453) tb!1859))

(declare-fun result!3171 () Bool)

(assert (= result!3171 result!3167))

(assert (=> b!93609 t!5453))

(declare-fun b_and!5717 () Bool)

(assert (= b_and!5713 (and (=> t!5453 result!3171) b_and!5717)))

(declare-fun m!101071 () Bool)

(assert (=> b!93599 m!101071))

(declare-fun m!101073 () Bool)

(assert (=> b!93616 m!101073))

(declare-fun m!101075 () Bool)

(assert (=> b!93616 m!101075))

(declare-fun m!101077 () Bool)

(assert (=> start!11314 m!101077))

(declare-fun m!101079 () Bool)

(assert (=> b!93607 m!101079))

(declare-fun m!101081 () Bool)

(assert (=> b!93612 m!101081))

(declare-fun m!101083 () Bool)

(assert (=> b!93612 m!101083))

(declare-fun m!101085 () Bool)

(assert (=> b!93612 m!101085))

(declare-fun m!101087 () Bool)

(assert (=> b!93612 m!101087))

(assert (=> b!93612 m!101085))

(assert (=> b!93612 m!101085))

(declare-fun m!101089 () Bool)

(assert (=> b!93612 m!101089))

(assert (=> b!93612 m!101085))

(declare-fun m!101091 () Bool)

(assert (=> b!93612 m!101091))

(assert (=> b!93605 m!101085))

(declare-fun m!101093 () Bool)

(assert (=> b!93605 m!101093))

(declare-fun m!101095 () Bool)

(assert (=> b!93605 m!101095))

(declare-fun m!101097 () Bool)

(assert (=> mapNonEmpty!3653 m!101097))

(declare-fun m!101099 () Bool)

(assert (=> mapNonEmpty!3654 m!101099))

(declare-fun m!101101 () Bool)

(assert (=> b!93611 m!101101))

(declare-fun m!101103 () Bool)

(assert (=> b!93611 m!101103))

(declare-fun m!101105 () Bool)

(assert (=> b!93609 m!101105))

(declare-fun m!101107 () Bool)

(assert (=> b!93609 m!101107))

(declare-fun m!101109 () Bool)

(assert (=> b!93609 m!101109))

(assert (=> b!93609 m!101085))

(assert (=> b!93609 m!101107))

(assert (=> b!93609 m!101085))

(declare-fun m!101111 () Bool)

(assert (=> b!93609 m!101111))

(assert (=> b!93609 m!101085))

(assert (=> b!93609 m!101109))

(declare-fun m!101113 () Bool)

(assert (=> b!93609 m!101113))

(assert (=> b!93609 m!101105))

(check-sat tp_is_empty!2607 (not b_next!2381) (not b!93611) (not b!93616) b_and!5717 (not b!93609) (not mapNonEmpty!3653) (not start!11314) (not b_next!2383) (not mapNonEmpty!3654) (not b!93599) (not b!93605) (not b!93612) b_and!5715 (not b_lambda!4131) (not b!93607))
(check-sat b_and!5715 b_and!5717 (not b_next!2381) (not b_next!2383))
(get-model)

(declare-fun b_lambda!4135 () Bool)

(assert (= b_lambda!4131 (or (and b!93611 b_free!2381) (and b!93616 b_free!2383 (= (defaultEntry!2431 newMap!16) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))))) b_lambda!4135)))

(check-sat tp_is_empty!2607 (not b_next!2381) (not b!93611) (not b!93616) b_and!5717 (not b!93609) (not mapNonEmpty!3653) (not start!11314) (not b_next!2383) (not b!93607) (not mapNonEmpty!3654) (not b!93599) (not b!93612) b_and!5715 (not b!93605) (not b_lambda!4135))
(check-sat b_and!5715 b_and!5717 (not b_next!2381) (not b_next!2383))
(get-model)

(declare-fun d!24551 () Bool)

(assert (=> d!24551 (= (map!1238 newMap!16) (getCurrentListMap!465 (_keys!4113 newMap!16) (_values!2414 newMap!16) (mask!6503 newMap!16) (extraKeys!2260 newMap!16) (zeroValue!2318 newMap!16) (minValue!2318 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2431 newMap!16)))))

(declare-fun bs!3861 () Bool)

(assert (= bs!3861 d!24551))

(declare-fun m!101159 () Bool)

(assert (=> bs!3861 m!101159))

(assert (=> b!93605 d!24551))

(declare-fun b!93717 () Bool)

(declare-fun e!61201 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!93717 (= e!61201 (validKeyInArray!0 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!9282 () Bool)

(declare-fun call!9290 () ListLongMap!1515)

(declare-fun call!9287 () ListLongMap!1515)

(assert (=> bm!9282 (= call!9290 call!9287)))

(declare-fun b!93718 () Bool)

(declare-fun e!61192 () Bool)

(declare-fun e!61198 () Bool)

(assert (=> b!93718 (= e!61192 e!61198)))

(declare-fun c!15599 () Bool)

(assert (=> b!93718 (= c!15599 (not (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9283 () Bool)

(declare-fun call!9286 () Bool)

(declare-fun lt!46438 () ListLongMap!1515)

(assert (=> bm!9283 (= call!9286 (contains!787 lt!46438 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93719 () Bool)

(declare-fun e!61202 () Unit!2787)

(declare-fun lt!46425 () Unit!2787)

(assert (=> b!93719 (= e!61202 lt!46425)))

(declare-fun lt!46430 () ListLongMap!1515)

(declare-fun getCurrentListMapNoExtraKeys!97 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 (_ BitVec 32) Int) ListLongMap!1515)

(assert (=> b!93719 (= lt!46430 (getCurrentListMapNoExtraKeys!97 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun lt!46435 () (_ BitVec 64))

(assert (=> b!93719 (= lt!46435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46422 () (_ BitVec 64))

(assert (=> b!93719 (= lt!46422 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46427 () Unit!2787)

(declare-fun addStillContains!65 (ListLongMap!1515 (_ BitVec 64) V!3123 (_ BitVec 64)) Unit!2787)

(assert (=> b!93719 (= lt!46427 (addStillContains!65 lt!46430 lt!46435 (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) lt!46422))))

(declare-fun +!132 (ListLongMap!1515 tuple2!2302) ListLongMap!1515)

(assert (=> b!93719 (contains!787 (+!132 lt!46430 (tuple2!2303 lt!46435 (zeroValue!2318 (v!2754 (underlying!325 thiss!992))))) lt!46422)))

(declare-fun lt!46436 () Unit!2787)

(assert (=> b!93719 (= lt!46436 lt!46427)))

(declare-fun lt!46423 () ListLongMap!1515)

(assert (=> b!93719 (= lt!46423 (getCurrentListMapNoExtraKeys!97 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun lt!46437 () (_ BitVec 64))

(assert (=> b!93719 (= lt!46437 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46432 () (_ BitVec 64))

(assert (=> b!93719 (= lt!46432 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46433 () Unit!2787)

(declare-fun addApplyDifferent!65 (ListLongMap!1515 (_ BitVec 64) V!3123 (_ BitVec 64)) Unit!2787)

(assert (=> b!93719 (= lt!46433 (addApplyDifferent!65 lt!46423 lt!46437 (minValue!2318 (v!2754 (underlying!325 thiss!992))) lt!46432))))

(declare-fun apply!89 (ListLongMap!1515 (_ BitVec 64)) V!3123)

(assert (=> b!93719 (= (apply!89 (+!132 lt!46423 (tuple2!2303 lt!46437 (minValue!2318 (v!2754 (underlying!325 thiss!992))))) lt!46432) (apply!89 lt!46423 lt!46432))))

(declare-fun lt!46428 () Unit!2787)

(assert (=> b!93719 (= lt!46428 lt!46433)))

(declare-fun lt!46419 () ListLongMap!1515)

(assert (=> b!93719 (= lt!46419 (getCurrentListMapNoExtraKeys!97 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun lt!46418 () (_ BitVec 64))

(assert (=> b!93719 (= lt!46418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46429 () (_ BitVec 64))

(assert (=> b!93719 (= lt!46429 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46434 () Unit!2787)

(assert (=> b!93719 (= lt!46434 (addApplyDifferent!65 lt!46419 lt!46418 (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) lt!46429))))

(assert (=> b!93719 (= (apply!89 (+!132 lt!46419 (tuple2!2303 lt!46418 (zeroValue!2318 (v!2754 (underlying!325 thiss!992))))) lt!46429) (apply!89 lt!46419 lt!46429))))

(declare-fun lt!46431 () Unit!2787)

(assert (=> b!93719 (= lt!46431 lt!46434)))

(declare-fun lt!46424 () ListLongMap!1515)

(assert (=> b!93719 (= lt!46424 (getCurrentListMapNoExtraKeys!97 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun lt!46421 () (_ BitVec 64))

(assert (=> b!93719 (= lt!46421 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46426 () (_ BitVec 64))

(assert (=> b!93719 (= lt!46426 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!93719 (= lt!46425 (addApplyDifferent!65 lt!46424 lt!46421 (minValue!2318 (v!2754 (underlying!325 thiss!992))) lt!46426))))

(assert (=> b!93719 (= (apply!89 (+!132 lt!46424 (tuple2!2303 lt!46421 (minValue!2318 (v!2754 (underlying!325 thiss!992))))) lt!46426) (apply!89 lt!46424 lt!46426))))

(declare-fun b!93720 () Bool)

(declare-fun e!61195 () Bool)

(assert (=> b!93720 (= e!61198 e!61195)))

(declare-fun res!47530 () Bool)

(assert (=> b!93720 (= res!47530 call!9286)))

(assert (=> b!93720 (=> (not res!47530) (not e!61195))))

(declare-fun b!93721 () Bool)

(assert (=> b!93721 (= e!61195 (= (apply!89 lt!46438 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2318 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun bm!9284 () Bool)

(declare-fun call!9285 () ListLongMap!1515)

(declare-fun call!9289 () ListLongMap!1515)

(declare-fun c!15601 () Bool)

(declare-fun c!15603 () Bool)

(declare-fun call!9288 () ListLongMap!1515)

(assert (=> bm!9284 (= call!9287 (+!132 (ite c!15603 call!9288 (ite c!15601 call!9289 call!9285)) (ite (or c!15603 c!15601) (tuple2!2303 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2318 (v!2754 (underlying!325 thiss!992)))) (tuple2!2303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2318 (v!2754 (underlying!325 thiss!992)))))))))

(declare-fun b!93722 () Bool)

(declare-fun c!15604 () Bool)

(assert (=> b!93722 (= c!15604 (and (not (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!61197 () ListLongMap!1515)

(declare-fun e!61200 () ListLongMap!1515)

(assert (=> b!93722 (= e!61197 e!61200)))

(declare-fun bm!9285 () Bool)

(assert (=> bm!9285 (= call!9285 call!9289)))

(declare-fun b!93723 () Bool)

(declare-fun e!61199 () ListLongMap!1515)

(assert (=> b!93723 (= e!61199 e!61197)))

(assert (=> b!93723 (= c!15601 (and (not (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93724 () Bool)

(assert (=> b!93724 (= e!61199 (+!132 call!9287 (tuple2!2303 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2318 (v!2754 (underlying!325 thiss!992))))))))

(declare-fun b!93725 () Bool)

(declare-fun res!47531 () Bool)

(assert (=> b!93725 (=> (not res!47531) (not e!61192))))

(declare-fun e!61196 () Bool)

(assert (=> b!93725 (= res!47531 e!61196)))

(declare-fun c!15600 () Bool)

(assert (=> b!93725 (= c!15600 (not (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!93726 () Bool)

(declare-fun call!9291 () Bool)

(assert (=> b!93726 (= e!61196 (not call!9291))))

(declare-fun b!93727 () Bool)

(declare-fun res!47534 () Bool)

(assert (=> b!93727 (=> (not res!47534) (not e!61192))))

(declare-fun e!61203 () Bool)

(assert (=> b!93727 (= res!47534 e!61203)))

(declare-fun res!47528 () Bool)

(assert (=> b!93727 (=> res!47528 e!61203)))

(assert (=> b!93727 (= res!47528 (not e!61201))))

(declare-fun res!47532 () Bool)

(assert (=> b!93727 (=> (not res!47532) (not e!61201))))

(assert (=> b!93727 (= res!47532 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992))))))))

(declare-fun b!93728 () Bool)

(assert (=> b!93728 (= e!61200 call!9290)))

(declare-fun b!93729 () Bool)

(assert (=> b!93729 (= e!61198 (not call!9286))))

(declare-fun b!93730 () Bool)

(declare-fun e!61194 () Bool)

(assert (=> b!93730 (= e!61194 (validKeyInArray!0 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!24553 () Bool)

(assert (=> d!24553 e!61192))

(declare-fun res!47533 () Bool)

(assert (=> d!24553 (=> (not res!47533) (not e!61192))))

(assert (=> d!24553 (= res!47533 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992))))))))))

(declare-fun lt!46439 () ListLongMap!1515)

(assert (=> d!24553 (= lt!46438 lt!46439)))

(declare-fun lt!46420 () Unit!2787)

(assert (=> d!24553 (= lt!46420 e!61202)))

(declare-fun c!15602 () Bool)

(assert (=> d!24553 (= c!15602 e!61194)))

(declare-fun res!47535 () Bool)

(assert (=> d!24553 (=> (not res!47535) (not e!61194))))

(assert (=> d!24553 (= res!47535 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992))))))))

(assert (=> d!24553 (= lt!46439 e!61199)))

(assert (=> d!24553 (= c!15603 (and (not (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24553 (validMask!0 (mask!6503 (v!2754 (underlying!325 thiss!992))))))

(assert (=> d!24553 (= (getCurrentListMap!465 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))) lt!46438)))

(declare-fun b!93731 () Bool)

(declare-fun e!61193 () Bool)

(assert (=> b!93731 (= e!61203 e!61193)))

(declare-fun res!47527 () Bool)

(assert (=> b!93731 (=> (not res!47527) (not e!61193))))

(assert (=> b!93731 (= res!47527 (contains!787 lt!46438 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93731 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992))))))))

(declare-fun bm!9286 () Bool)

(assert (=> bm!9286 (= call!9288 (getCurrentListMapNoExtraKeys!97 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))))))

(declare-fun b!93732 () Bool)

(assert (=> b!93732 (= e!61197 call!9290)))

(declare-fun b!93733 () Bool)

(assert (=> b!93733 (= e!61200 call!9285)))

(declare-fun bm!9287 () Bool)

(assert (=> bm!9287 (= call!9289 call!9288)))

(declare-fun b!93734 () Bool)

(declare-fun e!61204 () Bool)

(assert (=> b!93734 (= e!61196 e!61204)))

(declare-fun res!47529 () Bool)

(assert (=> b!93734 (= res!47529 call!9291)))

(assert (=> b!93734 (=> (not res!47529) (not e!61204))))

(declare-fun b!93735 () Bool)

(assert (=> b!93735 (= e!61193 (= (apply!89 lt!46438 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93735 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2240 (_values!2414 (v!2754 (underlying!325 thiss!992))))))))

(assert (=> b!93735 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992))))))))

(declare-fun b!93736 () Bool)

(declare-fun Unit!2791 () Unit!2787)

(assert (=> b!93736 (= e!61202 Unit!2791)))

(declare-fun bm!9288 () Bool)

(assert (=> bm!9288 (= call!9291 (contains!787 lt!46438 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93737 () Bool)

(assert (=> b!93737 (= e!61204 (= (apply!89 lt!46438 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2318 (v!2754 (underlying!325 thiss!992)))))))

(assert (= (and d!24553 c!15603) b!93724))

(assert (= (and d!24553 (not c!15603)) b!93723))

(assert (= (and b!93723 c!15601) b!93732))

(assert (= (and b!93723 (not c!15601)) b!93722))

(assert (= (and b!93722 c!15604) b!93728))

(assert (= (and b!93722 (not c!15604)) b!93733))

(assert (= (or b!93728 b!93733) bm!9285))

(assert (= (or b!93732 bm!9285) bm!9287))

(assert (= (or b!93732 b!93728) bm!9282))

(assert (= (or b!93724 bm!9287) bm!9286))

(assert (= (or b!93724 bm!9282) bm!9284))

(assert (= (and d!24553 res!47535) b!93730))

(assert (= (and d!24553 c!15602) b!93719))

(assert (= (and d!24553 (not c!15602)) b!93736))

(assert (= (and d!24553 res!47533) b!93727))

(assert (= (and b!93727 res!47532) b!93717))

(assert (= (and b!93727 (not res!47528)) b!93731))

(assert (= (and b!93731 res!47527) b!93735))

(assert (= (and b!93727 res!47534) b!93725))

(assert (= (and b!93725 c!15600) b!93734))

(assert (= (and b!93725 (not c!15600)) b!93726))

(assert (= (and b!93734 res!47529) b!93737))

(assert (= (or b!93734 b!93726) bm!9288))

(assert (= (and b!93725 res!47531) b!93718))

(assert (= (and b!93718 c!15599) b!93720))

(assert (= (and b!93718 (not c!15599)) b!93729))

(assert (= (and b!93720 res!47530) b!93721))

(assert (= (or b!93720 b!93729) bm!9283))

(declare-fun b_lambda!4137 () Bool)

(assert (=> (not b_lambda!4137) (not b!93735)))

(assert (=> b!93735 t!5451))

(declare-fun b_and!5727 () Bool)

(assert (= b_and!5715 (and (=> t!5451 result!3167) b_and!5727)))

(assert (=> b!93735 t!5453))

(declare-fun b_and!5729 () Bool)

(assert (= b_and!5717 (and (=> t!5453 result!3171) b_and!5729)))

(declare-fun m!101161 () Bool)

(assert (=> b!93724 m!101161))

(declare-fun m!101163 () Bool)

(assert (=> b!93717 m!101163))

(assert (=> b!93717 m!101163))

(declare-fun m!101165 () Bool)

(assert (=> b!93717 m!101165))

(declare-fun m!101167 () Bool)

(assert (=> b!93721 m!101167))

(declare-fun m!101169 () Bool)

(assert (=> bm!9286 m!101169))

(declare-fun m!101171 () Bool)

(assert (=> bm!9284 m!101171))

(declare-fun m!101173 () Bool)

(assert (=> b!93719 m!101173))

(declare-fun m!101175 () Bool)

(assert (=> b!93719 m!101175))

(declare-fun m!101177 () Bool)

(assert (=> b!93719 m!101177))

(declare-fun m!101179 () Bool)

(assert (=> b!93719 m!101179))

(declare-fun m!101181 () Bool)

(assert (=> b!93719 m!101181))

(declare-fun m!101183 () Bool)

(assert (=> b!93719 m!101183))

(declare-fun m!101185 () Bool)

(assert (=> b!93719 m!101185))

(assert (=> b!93719 m!101173))

(assert (=> b!93719 m!101169))

(assert (=> b!93719 m!101163))

(declare-fun m!101187 () Bool)

(assert (=> b!93719 m!101187))

(declare-fun m!101189 () Bool)

(assert (=> b!93719 m!101189))

(declare-fun m!101191 () Bool)

(assert (=> b!93719 m!101191))

(assert (=> b!93719 m!101177))

(declare-fun m!101193 () Bool)

(assert (=> b!93719 m!101193))

(declare-fun m!101195 () Bool)

(assert (=> b!93719 m!101195))

(assert (=> b!93719 m!101179))

(declare-fun m!101197 () Bool)

(assert (=> b!93719 m!101197))

(assert (=> b!93719 m!101191))

(declare-fun m!101199 () Bool)

(assert (=> b!93719 m!101199))

(declare-fun m!101201 () Bool)

(assert (=> b!93719 m!101201))

(assert (=> b!93730 m!101163))

(assert (=> b!93730 m!101163))

(assert (=> b!93730 m!101165))

(assert (=> b!93735 m!101163))

(declare-fun m!101203 () Bool)

(assert (=> b!93735 m!101203))

(assert (=> b!93735 m!101163))

(declare-fun m!101205 () Bool)

(assert (=> b!93735 m!101205))

(assert (=> b!93735 m!101107))

(assert (=> b!93735 m!101205))

(assert (=> b!93735 m!101107))

(declare-fun m!101207 () Bool)

(assert (=> b!93735 m!101207))

(declare-fun m!101209 () Bool)

(assert (=> b!93737 m!101209))

(assert (=> b!93731 m!101163))

(assert (=> b!93731 m!101163))

(declare-fun m!101211 () Bool)

(assert (=> b!93731 m!101211))

(declare-fun m!101213 () Bool)

(assert (=> bm!9283 m!101213))

(assert (=> d!24553 m!101079))

(declare-fun m!101215 () Bool)

(assert (=> bm!9288 m!101215))

(assert (=> b!93605 d!24553))

(declare-fun d!24555 () Bool)

(assert (=> d!24555 (= (valid!370 thiss!992) (valid!369 (v!2754 (underlying!325 thiss!992))))))

(declare-fun bs!3862 () Bool)

(assert (= bs!3862 d!24555))

(declare-fun m!101217 () Bool)

(assert (=> bs!3862 m!101217))

(assert (=> start!11314 d!24555))

(declare-fun d!24557 () Bool)

(declare-fun e!61210 () Bool)

(assert (=> d!24557 e!61210))

(declare-fun res!47538 () Bool)

(assert (=> d!24557 (=> res!47538 e!61210)))

(declare-fun lt!46449 () Bool)

(assert (=> d!24557 (= res!47538 (not lt!46449))))

(declare-fun lt!46448 () Bool)

(assert (=> d!24557 (= lt!46449 lt!46448)))

(declare-fun lt!46450 () Unit!2787)

(declare-fun e!61209 () Unit!2787)

(assert (=> d!24557 (= lt!46450 e!61209)))

(declare-fun c!15607 () Bool)

(assert (=> d!24557 (= c!15607 lt!46448)))

(declare-fun containsKey!151 (List!1564 (_ BitVec 64)) Bool)

(assert (=> d!24557 (= lt!46448 (containsKey!151 (toList!773 lt!46346) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(assert (=> d!24557 (= (contains!787 lt!46346 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)) lt!46449)))

(declare-fun b!93744 () Bool)

(declare-fun lt!46451 () Unit!2787)

(assert (=> b!93744 (= e!61209 lt!46451)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!99 (List!1564 (_ BitVec 64)) Unit!2787)

(assert (=> b!93744 (= lt!46451 (lemmaContainsKeyImpliesGetValueByKeyDefined!99 (toList!773 lt!46346) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-datatypes ((Option!153 0))(
  ( (Some!152 (v!2758 V!3123)) (None!151) )
))
(declare-fun isDefined!100 (Option!153) Bool)

(declare-fun getValueByKey!147 (List!1564 (_ BitVec 64)) Option!153)

(assert (=> b!93744 (isDefined!100 (getValueByKey!147 (toList!773 lt!46346) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun b!93745 () Bool)

(declare-fun Unit!2792 () Unit!2787)

(assert (=> b!93745 (= e!61209 Unit!2792)))

(declare-fun b!93746 () Bool)

(assert (=> b!93746 (= e!61210 (isDefined!100 (getValueByKey!147 (toList!773 lt!46346) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355))))))

(assert (= (and d!24557 c!15607) b!93744))

(assert (= (and d!24557 (not c!15607)) b!93745))

(assert (= (and d!24557 (not res!47538)) b!93746))

(assert (=> d!24557 m!101085))

(declare-fun m!101219 () Bool)

(assert (=> d!24557 m!101219))

(assert (=> b!93744 m!101085))

(declare-fun m!101221 () Bool)

(assert (=> b!93744 m!101221))

(assert (=> b!93744 m!101085))

(declare-fun m!101223 () Bool)

(assert (=> b!93744 m!101223))

(assert (=> b!93744 m!101223))

(declare-fun m!101225 () Bool)

(assert (=> b!93744 m!101225))

(assert (=> b!93746 m!101085))

(assert (=> b!93746 m!101223))

(assert (=> b!93746 m!101223))

(assert (=> b!93746 m!101225))

(assert (=> b!93609 d!24557))

(declare-datatypes ((SeekEntryResult!250 0))(
  ( (MissingZero!250 (index!3141 (_ BitVec 32))) (Found!250 (index!3142 (_ BitVec 32))) (Intermediate!250 (undefined!1062 Bool) (index!3143 (_ BitVec 32)) (x!12614 (_ BitVec 32))) (Undefined!250) (MissingVacant!250 (index!3144 (_ BitVec 32))) )
))
(declare-fun lt!46511 () SeekEntryResult!250)

(declare-fun b!93827 () Bool)

(declare-fun e!61271 () Bool)

(assert (=> b!93827 (= e!61271 (= (select (arr!1991 (_keys!4113 newMap!16)) (index!3142 lt!46511)) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun b!93828 () Bool)

(declare-fun e!61257 () ListLongMap!1515)

(declare-fun call!9355 () ListLongMap!1515)

(assert (=> b!93828 (= e!61257 call!9355)))

(declare-fun lt!46519 () (_ BitVec 32))

(declare-fun c!15646 () Bool)

(declare-fun bm!9337 () Bool)

(declare-fun c!15639 () Bool)

(assert (=> bm!9337 (= call!9355 (getCurrentListMap!465 (_keys!4113 newMap!16) (_values!2414 newMap!16) (mask!6503 newMap!16) (ite c!15646 (ite c!15639 (extraKeys!2260 newMap!16) lt!46519) (extraKeys!2260 newMap!16)) (zeroValue!2318 newMap!16) (ite c!15646 (ite c!15639 (minValue!2318 newMap!16) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2318 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2431 newMap!16)))))

(declare-fun b!93829 () Bool)

(declare-fun e!61255 () tuple2!2304)

(declare-fun e!61268 () tuple2!2304)

(assert (=> b!93829 (= e!61255 e!61268)))

(declare-fun c!15636 () Bool)

(declare-fun lt!46525 () SeekEntryResult!250)

(assert (=> b!93829 (= c!15636 ((_ is MissingZero!250) lt!46525))))

(declare-fun b!93830 () Bool)

(declare-fun res!47573 () Bool)

(declare-fun lt!46532 () SeekEntryResult!250)

(assert (=> b!93830 (= res!47573 (= (select (arr!1991 (_keys!4113 newMap!16)) (index!3144 lt!46532)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!61264 () Bool)

(assert (=> b!93830 (=> (not res!47573) (not e!61264))))

(declare-fun b!93831 () Bool)

(declare-fun res!47570 () Bool)

(declare-fun e!61269 () Bool)

(assert (=> b!93831 (=> (not res!47570) (not e!61269))))

(assert (=> b!93831 (= res!47570 (= (select (arr!1991 (_keys!4113 newMap!16)) (index!3141 lt!46532)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93832 () Bool)

(declare-fun e!61256 () Unit!2787)

(declare-fun Unit!2793 () Unit!2787)

(assert (=> b!93832 (= e!61256 Unit!2793)))

(declare-fun lt!46529 () Unit!2787)

(declare-fun call!9363 () Unit!2787)

(assert (=> b!93832 (= lt!46529 call!9363)))

(declare-fun lt!46521 () SeekEntryResult!250)

(declare-fun call!9359 () SeekEntryResult!250)

(assert (=> b!93832 (= lt!46521 call!9359)))

(declare-fun res!47580 () Bool)

(assert (=> b!93832 (= res!47580 ((_ is Found!250) lt!46521))))

(declare-fun e!61253 () Bool)

(assert (=> b!93832 (=> (not res!47580) (not e!61253))))

(assert (=> b!93832 e!61253))

(declare-fun lt!46528 () Unit!2787)

(assert (=> b!93832 (= lt!46528 lt!46529)))

(assert (=> b!93832 false))

(declare-fun bm!9338 () Bool)

(declare-fun c!15645 () Bool)

(declare-fun c!15638 () Bool)

(assert (=> bm!9338 (= c!15645 c!15638)))

(declare-fun call!9362 () Bool)

(assert (=> bm!9338 (= call!9362 (contains!787 e!61257 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun b!93833 () Bool)

(declare-fun e!61259 () Bool)

(declare-fun e!61262 () Bool)

(assert (=> b!93833 (= e!61259 e!61262)))

(declare-fun res!47577 () Bool)

(declare-fun call!9340 () Bool)

(assert (=> b!93833 (= res!47577 call!9340)))

(assert (=> b!93833 (=> (not res!47577) (not e!61262))))

(declare-fun b!93834 () Bool)

(declare-fun call!9350 () ListLongMap!1515)

(assert (=> b!93834 (= e!61257 call!9350)))

(declare-fun bm!9339 () Bool)

(declare-fun c!15644 () Bool)

(declare-fun call!9361 () tuple2!2304)

(declare-fun updateHelperNewKey!38 (LongMapFixedSize!828 (_ BitVec 64) V!3123 (_ BitVec 32)) tuple2!2304)

(assert (=> bm!9339 (= call!9361 (updateHelperNewKey!38 newMap!16 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!15644 (index!3144 lt!46525) (index!3141 lt!46525))))))

(declare-fun bm!9340 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!38 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 (_ BitVec 64) Int) Unit!2787)

(assert (=> bm!9340 (= call!9363 (lemmaInListMapThenSeekEntryOrOpenFindsIt!38 (_keys!4113 newMap!16) (_values!2414 newMap!16) (mask!6503 newMap!16) (extraKeys!2260 newMap!16) (zeroValue!2318 newMap!16) (minValue!2318 newMap!16) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (defaultEntry!2431 newMap!16)))))

(declare-fun b!93835 () Bool)

(declare-fun e!61273 () Bool)

(declare-fun call!9341 () Bool)

(assert (=> b!93835 (= e!61273 (not call!9341))))

(declare-fun b!93836 () Bool)

(declare-fun res!47574 () Bool)

(assert (=> b!93836 (=> (not res!47574) (not e!61269))))

(declare-fun call!9348 () Bool)

(assert (=> b!93836 (= res!47574 call!9348)))

(declare-fun e!61270 () Bool)

(assert (=> b!93836 (= e!61270 e!61269)))

(declare-fun lt!46508 () SeekEntryResult!250)

(declare-fun bm!9341 () Bool)

(declare-fun call!9349 () Bool)

(declare-fun c!15635 () Bool)

(declare-fun c!15640 () Bool)

(declare-fun c!15641 () Bool)

(declare-fun c!15634 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9341 (= call!9349 (inRange!0 (ite c!15638 (ite c!15640 (index!3142 lt!46521) (ite c!15634 (index!3141 lt!46508) (index!3144 lt!46508))) (ite c!15635 (index!3142 lt!46511) (ite c!15641 (index!3141 lt!46532) (index!3144 lt!46532)))) (mask!6503 newMap!16)))))

(declare-fun b!93837 () Bool)

(declare-fun c!15637 () Bool)

(assert (=> b!93837 (= c!15637 ((_ is MissingVacant!250) lt!46532))))

(declare-fun e!61267 () Bool)

(assert (=> b!93837 (= e!61270 e!61267)))

(declare-fun b!93838 () Bool)

(declare-fun res!47572 () Bool)

(declare-fun call!9360 () Bool)

(assert (=> b!93838 (= res!47572 call!9360)))

(assert (=> b!93838 (=> (not res!47572) (not e!61271))))

(declare-fun bm!9342 () Bool)

(declare-fun call!9354 () SeekEntryResult!250)

(declare-fun call!9352 () SeekEntryResult!250)

(assert (=> bm!9342 (= call!9354 call!9352)))

(declare-fun bm!9343 () Bool)

(assert (=> bm!9343 (= call!9350 (getCurrentListMap!465 (_keys!4113 newMap!16) (ite c!15638 (_values!2414 newMap!16) (array!4190 (store (arr!1992 (_values!2414 newMap!16)) (index!3142 lt!46525) (ValueCellFull!960 (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2240 (_values!2414 newMap!16)))) (mask!6503 newMap!16) (extraKeys!2260 newMap!16) (zeroValue!2318 newMap!16) (minValue!2318 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2431 newMap!16)))))

(declare-fun b!93839 () Bool)

(declare-fun lt!46517 () Unit!2787)

(declare-fun lt!46524 () Unit!2787)

(assert (=> b!93839 (= lt!46517 lt!46524)))

(declare-fun call!9356 () ListLongMap!1515)

(declare-fun call!9345 () ListLongMap!1515)

(assert (=> b!93839 (= call!9356 call!9345)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!38 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 V!3123 Int) Unit!2787)

(assert (=> b!93839 (= lt!46524 (lemmaChangeLongMinValueKeyThenAddPairToListMap!38 (_keys!4113 newMap!16) (_values!2414 newMap!16) (mask!6503 newMap!16) (extraKeys!2260 newMap!16) lt!46519 (zeroValue!2318 newMap!16) (minValue!2318 newMap!16) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2431 newMap!16)))))

(assert (=> b!93839 (= lt!46519 (bvor (extraKeys!2260 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!61272 () tuple2!2304)

(assert (=> b!93839 (= e!61272 (tuple2!2305 true (LongMapFixedSize!829 (defaultEntry!2431 newMap!16) (mask!6503 newMap!16) (bvor (extraKeys!2260 newMap!16) #b00000000000000000000000000000010) (zeroValue!2318 newMap!16) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!463 newMap!16) (_keys!4113 newMap!16) (_values!2414 newMap!16) (_vacant!463 newMap!16))))))

(declare-fun b!93840 () Bool)

(declare-fun c!15643 () Bool)

(assert (=> b!93840 (= c!15643 ((_ is MissingVacant!250) lt!46508))))

(declare-fun e!61266 () Bool)

(assert (=> b!93840 (= e!61266 e!61259)))

(declare-fun call!9346 () ListLongMap!1515)

(declare-fun call!9343 () ListLongMap!1515)

(declare-fun bm!9344 () Bool)

(assert (=> bm!9344 (= call!9346 (+!132 (ite c!15646 (ite c!15639 call!9345 call!9343) call!9355) (ite c!15646 (ite c!15639 (tuple2!2303 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2303 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2303 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!93841 () Bool)

(declare-fun e!61254 () Bool)

(declare-fun e!61261 () Bool)

(assert (=> b!93841 (= e!61254 e!61261)))

(declare-fun c!15642 () Bool)

(declare-fun lt!46530 () tuple2!2304)

(assert (=> b!93841 (= c!15642 (_1!1163 lt!46530))))

(declare-fun b!93842 () Bool)

(assert (=> b!93842 (= c!15644 ((_ is MissingVacant!250) lt!46525))))

(declare-fun e!61263 () tuple2!2304)

(assert (=> b!93842 (= e!61263 e!61255)))

(declare-fun b!93843 () Bool)

(declare-fun lt!46523 () Unit!2787)

(assert (=> b!93843 (= lt!46523 e!61256)))

(assert (=> b!93843 (= c!15640 call!9362)))

(assert (=> b!93843 (= e!61263 (tuple2!2305 false newMap!16))))

(declare-fun bm!9345 () Bool)

(assert (=> bm!9345 (= call!9360 call!9349)))

(declare-fun bm!9346 () Bool)

(declare-fun call!9351 () ListLongMap!1515)

(assert (=> bm!9346 (= call!9351 (map!1238 newMap!16))))

(declare-fun d!24559 () Bool)

(assert (=> d!24559 e!61254))

(declare-fun res!47578 () Bool)

(assert (=> d!24559 (=> (not res!47578) (not e!61254))))

(assert (=> d!24559 (= res!47578 (valid!369 (_2!1163 lt!46530)))))

(declare-fun e!61260 () tuple2!2304)

(assert (=> d!24559 (= lt!46530 e!61260)))

(assert (=> d!24559 (= c!15646 (= (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvneg (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355))))))

(assert (=> d!24559 (valid!369 newMap!16)))

(assert (=> d!24559 (= (update!132 newMap!16 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!46530)))

(declare-fun b!93844 () Bool)

(assert (=> b!93844 (= e!61267 ((_ is Undefined!250) lt!46532))))

(declare-fun bm!9347 () Bool)

(assert (=> bm!9347 (= call!9345 call!9355)))

(declare-fun bm!9348 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4187 (_ BitVec 32)) SeekEntryResult!250)

(assert (=> bm!9348 (= call!9352 (seekEntryOrOpen!0 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (_keys!4113 newMap!16) (mask!6503 newMap!16)))))

(declare-fun b!93845 () Bool)

(declare-fun call!9358 () Bool)

(assert (=> b!93845 (= e!61269 (not call!9358))))

(declare-fun b!93846 () Bool)

(assert (=> b!93846 (= e!61253 (= (select (arr!1991 (_keys!4113 newMap!16)) (index!3142 lt!46521)) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun bm!9349 () Bool)

(declare-fun call!9344 () Bool)

(assert (=> bm!9349 (= call!9358 call!9344)))

(declare-fun b!93847 () Bool)

(declare-fun res!47575 () Bool)

(assert (=> b!93847 (=> (not res!47575) (not e!61273))))

(assert (=> b!93847 (= res!47575 (= (select (arr!1991 (_keys!4113 newMap!16)) (index!3141 lt!46508)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9350 () Bool)

(assert (=> bm!9350 (= call!9344 (arrayContainsKey!0 (_keys!4113 newMap!16) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!46506 () (_ BitVec 32))

(declare-fun lt!46520 () array!4189)

(declare-fun call!9353 () ListLongMap!1515)

(declare-fun bm!9351 () Bool)

(assert (=> bm!9351 (= call!9353 (getCurrentListMap!465 (_keys!4113 newMap!16) (ite c!15646 (_values!2414 newMap!16) lt!46520) (mask!6503 newMap!16) (ite (and c!15646 c!15639) lt!46506 (extraKeys!2260 newMap!16)) (ite (and c!15646 c!15639) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2318 newMap!16)) (minValue!2318 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2431 newMap!16)))))

(declare-fun bm!9352 () Bool)

(assert (=> bm!9352 (= call!9343 call!9353)))

(declare-fun bm!9353 () Bool)

(assert (=> bm!9353 (= call!9341 call!9344)))

(declare-fun b!93848 () Bool)

(declare-fun e!61265 () Unit!2787)

(declare-fun Unit!2794 () Unit!2787)

(assert (=> b!93848 (= e!61265 Unit!2794)))

(declare-fun lt!46527 () Unit!2787)

(declare-fun call!9357 () Unit!2787)

(assert (=> b!93848 (= lt!46527 call!9357)))

(assert (=> b!93848 (= lt!46532 call!9354)))

(assert (=> b!93848 (= c!15641 ((_ is MissingZero!250) lt!46532))))

(assert (=> b!93848 e!61270))

(declare-fun lt!46516 () Unit!2787)

(assert (=> b!93848 (= lt!46516 lt!46527)))

(assert (=> b!93848 false))

(declare-fun b!93849 () Bool)

(assert (=> b!93849 (= e!61267 e!61264)))

(declare-fun res!47568 () Bool)

(assert (=> b!93849 (= res!47568 call!9348)))

(assert (=> b!93849 (=> (not res!47568) (not e!61264))))

(declare-fun b!93850 () Bool)

(declare-fun lt!46522 () Unit!2787)

(declare-fun lt!46531 () Unit!2787)

(assert (=> b!93850 (= lt!46522 lt!46531)))

(assert (=> b!93850 (= call!9356 call!9343)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!38 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 V!3123 Int) Unit!2787)

(assert (=> b!93850 (= lt!46531 (lemmaChangeZeroKeyThenAddPairToListMap!38 (_keys!4113 newMap!16) (_values!2414 newMap!16) (mask!6503 newMap!16) (extraKeys!2260 newMap!16) lt!46506 (zeroValue!2318 newMap!16) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2318 newMap!16) (defaultEntry!2431 newMap!16)))))

(assert (=> b!93850 (= lt!46506 (bvor (extraKeys!2260 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!93850 (= e!61272 (tuple2!2305 true (LongMapFixedSize!829 (defaultEntry!2431 newMap!16) (mask!6503 newMap!16) (bvor (extraKeys!2260 newMap!16) #b00000000000000000000000000000001) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2318 newMap!16) (_size!463 newMap!16) (_keys!4113 newMap!16) (_values!2414 newMap!16) (_vacant!463 newMap!16))))))

(declare-fun bm!9354 () Bool)

(declare-fun call!9347 () Bool)

(assert (=> bm!9354 (= call!9340 call!9347)))

(declare-fun b!93851 () Bool)

(assert (=> b!93851 (= e!61260 e!61263)))

(assert (=> b!93851 (= lt!46525 (seekEntryOrOpen!0 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (_keys!4113 newMap!16) (mask!6503 newMap!16)))))

(assert (=> b!93851 (= c!15638 ((_ is Undefined!250) lt!46525))))

(declare-fun b!93852 () Bool)

(declare-fun lt!46510 () tuple2!2304)

(assert (=> b!93852 (= lt!46510 call!9361)))

(assert (=> b!93852 (= e!61268 (tuple2!2305 (_1!1163 lt!46510) (_2!1163 lt!46510)))))

(declare-fun bm!9355 () Bool)

(assert (=> bm!9355 (= call!9356 call!9346)))

(declare-fun b!93853 () Bool)

(declare-fun lt!46512 () tuple2!2304)

(assert (=> b!93853 (= e!61255 (tuple2!2305 (_1!1163 lt!46512) (_2!1163 lt!46512)))))

(assert (=> b!93853 (= lt!46512 call!9361)))

(declare-fun b!93854 () Bool)

(declare-fun res!47576 () Bool)

(assert (=> b!93854 (= res!47576 (= (select (arr!1991 (_keys!4113 newMap!16)) (index!3144 lt!46508)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!93854 (=> (not res!47576) (not e!61262))))

(declare-fun b!93855 () Bool)

(declare-fun lt!46509 () Unit!2787)

(assert (=> b!93855 (= e!61256 lt!46509)))

(assert (=> b!93855 (= lt!46509 call!9357)))

(assert (=> b!93855 (= lt!46508 call!9359)))

(assert (=> b!93855 (= c!15634 ((_ is MissingZero!250) lt!46508))))

(assert (=> b!93855 e!61266))

(declare-fun b!93856 () Bool)

(declare-fun lt!46513 () Unit!2787)

(assert (=> b!93856 (= e!61265 lt!46513)))

(assert (=> b!93856 (= lt!46513 call!9363)))

(assert (=> b!93856 (= lt!46511 call!9354)))

(declare-fun res!47569 () Bool)

(assert (=> b!93856 (= res!47569 ((_ is Found!250) lt!46511))))

(assert (=> b!93856 (=> (not res!47569) (not e!61271))))

(assert (=> b!93856 e!61271))

(declare-fun b!93857 () Bool)

(assert (=> b!93857 (= e!61262 (not call!9341))))

(declare-fun b!93858 () Bool)

(assert (=> b!93858 (= e!61259 ((_ is Undefined!250) lt!46508))))

(declare-fun b!93859 () Bool)

(declare-fun res!47567 () Bool)

(assert (=> b!93859 (= res!47567 call!9347)))

(assert (=> b!93859 (=> (not res!47567) (not e!61253))))

(declare-fun b!93860 () Bool)

(declare-fun call!9342 () ListLongMap!1515)

(declare-fun e!61258 () Bool)

(assert (=> b!93860 (= e!61258 (= call!9342 (+!132 call!9351 (tuple2!2303 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!9356 () Bool)

(assert (=> bm!9356 (= call!9347 call!9349)))

(declare-fun b!93861 () Bool)

(declare-fun res!47579 () Bool)

(assert (=> b!93861 (=> (not res!47579) (not e!61273))))

(assert (=> b!93861 (= res!47579 call!9340)))

(assert (=> b!93861 (= e!61266 e!61273)))

(declare-fun bm!9357 () Bool)

(assert (=> bm!9357 (= call!9342 (map!1238 (_2!1163 lt!46530)))))

(declare-fun b!93862 () Bool)

(assert (=> b!93862 (= e!61261 e!61258)))

(declare-fun res!47571 () Bool)

(assert (=> b!93862 (= res!47571 (contains!787 call!9342 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(assert (=> b!93862 (=> (not res!47571) (not e!61258))))

(declare-fun b!93863 () Bool)

(assert (=> b!93863 (= e!61264 (not call!9358))))

(declare-fun b!93864 () Bool)

(assert (=> b!93864 (= e!61260 e!61272)))

(assert (=> b!93864 (= c!15639 (= (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9358 () Bool)

(assert (=> bm!9358 (= call!9348 call!9360)))

(declare-fun bm!9359 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!38 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 (_ BitVec 64) Int) Unit!2787)

(assert (=> bm!9359 (= call!9357 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!38 (_keys!4113 newMap!16) (_values!2414 newMap!16) (mask!6503 newMap!16) (extraKeys!2260 newMap!16) (zeroValue!2318 newMap!16) (minValue!2318 newMap!16) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (defaultEntry!2431 newMap!16)))))

(declare-fun bm!9360 () Bool)

(assert (=> bm!9360 (= call!9359 call!9352)))

(declare-fun b!93865 () Bool)

(assert (=> b!93865 (= e!61261 (= call!9342 call!9351))))

(declare-fun b!93866 () Bool)

(declare-fun lt!46514 () Unit!2787)

(declare-fun lt!46518 () Unit!2787)

(assert (=> b!93866 (= lt!46514 lt!46518)))

(assert (=> b!93866 (contains!787 call!9353 (select (arr!1991 (_keys!4113 newMap!16)) (index!3142 lt!46525)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!99 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 (_ BitVec 32) Int) Unit!2787)

(assert (=> b!93866 (= lt!46518 (lemmaValidKeyInArrayIsInListMap!99 (_keys!4113 newMap!16) lt!46520 (mask!6503 newMap!16) (extraKeys!2260 newMap!16) (zeroValue!2318 newMap!16) (minValue!2318 newMap!16) (index!3142 lt!46525) (defaultEntry!2431 newMap!16)))))

(assert (=> b!93866 (= lt!46520 (array!4190 (store (arr!1992 (_values!2414 newMap!16)) (index!3142 lt!46525) (ValueCellFull!960 (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2240 (_values!2414 newMap!16))))))

(declare-fun lt!46507 () Unit!2787)

(declare-fun lt!46526 () Unit!2787)

(assert (=> b!93866 (= lt!46507 lt!46526)))

(assert (=> b!93866 (= call!9346 call!9350)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!38 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 (_ BitVec 32) (_ BitVec 64) V!3123 Int) Unit!2787)

(assert (=> b!93866 (= lt!46526 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!38 (_keys!4113 newMap!16) (_values!2414 newMap!16) (mask!6503 newMap!16) (extraKeys!2260 newMap!16) (zeroValue!2318 newMap!16) (minValue!2318 newMap!16) (index!3142 lt!46525) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2431 newMap!16)))))

(declare-fun lt!46515 () Unit!2787)

(assert (=> b!93866 (= lt!46515 e!61265)))

(assert (=> b!93866 (= c!15635 call!9362)))

(assert (=> b!93866 (= e!61268 (tuple2!2305 true (LongMapFixedSize!829 (defaultEntry!2431 newMap!16) (mask!6503 newMap!16) (extraKeys!2260 newMap!16) (zeroValue!2318 newMap!16) (minValue!2318 newMap!16) (_size!463 newMap!16) (_keys!4113 newMap!16) (array!4190 (store (arr!1992 (_values!2414 newMap!16)) (index!3142 lt!46525) (ValueCellFull!960 (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2240 (_values!2414 newMap!16))) (_vacant!463 newMap!16))))))

(assert (= (and d!24559 c!15646) b!93864))

(assert (= (and d!24559 (not c!15646)) b!93851))

(assert (= (and b!93864 c!15639) b!93850))

(assert (= (and b!93864 (not c!15639)) b!93839))

(assert (= (or b!93850 b!93839) bm!9352))

(assert (= (or b!93850 b!93839) bm!9347))

(assert (= (or b!93850 b!93839) bm!9355))

(assert (= (and b!93851 c!15638) b!93843))

(assert (= (and b!93851 (not c!15638)) b!93842))

(assert (= (and b!93843 c!15640) b!93832))

(assert (= (and b!93843 (not c!15640)) b!93855))

(assert (= (and b!93832 res!47580) b!93859))

(assert (= (and b!93859 res!47567) b!93846))

(assert (= (and b!93855 c!15634) b!93861))

(assert (= (and b!93855 (not c!15634)) b!93840))

(assert (= (and b!93861 res!47579) b!93847))

(assert (= (and b!93847 res!47575) b!93835))

(assert (= (and b!93840 c!15643) b!93833))

(assert (= (and b!93840 (not c!15643)) b!93858))

(assert (= (and b!93833 res!47577) b!93854))

(assert (= (and b!93854 res!47576) b!93857))

(assert (= (or b!93861 b!93833) bm!9354))

(assert (= (or b!93835 b!93857) bm!9353))

(assert (= (or b!93859 bm!9354) bm!9356))

(assert (= (or b!93832 b!93855) bm!9360))

(assert (= (and b!93842 c!15644) b!93853))

(assert (= (and b!93842 (not c!15644)) b!93829))

(assert (= (and b!93829 c!15636) b!93852))

(assert (= (and b!93829 (not c!15636)) b!93866))

(assert (= (and b!93866 c!15635) b!93856))

(assert (= (and b!93866 (not c!15635)) b!93848))

(assert (= (and b!93856 res!47569) b!93838))

(assert (= (and b!93838 res!47572) b!93827))

(assert (= (and b!93848 c!15641) b!93836))

(assert (= (and b!93848 (not c!15641)) b!93837))

(assert (= (and b!93836 res!47574) b!93831))

(assert (= (and b!93831 res!47570) b!93845))

(assert (= (and b!93837 c!15637) b!93849))

(assert (= (and b!93837 (not c!15637)) b!93844))

(assert (= (and b!93849 res!47568) b!93830))

(assert (= (and b!93830 res!47573) b!93863))

(assert (= (or b!93836 b!93849) bm!9358))

(assert (= (or b!93845 b!93863) bm!9349))

(assert (= (or b!93838 bm!9358) bm!9345))

(assert (= (or b!93856 b!93848) bm!9342))

(assert (= (or b!93853 b!93852) bm!9339))

(assert (= (or bm!9353 bm!9349) bm!9350))

(assert (= (or bm!9360 bm!9342) bm!9348))

(assert (= (or bm!9356 bm!9345) bm!9341))

(assert (= (or b!93843 b!93866) bm!9343))

(assert (= (or b!93855 b!93848) bm!9359))

(assert (= (or b!93832 b!93856) bm!9340))

(assert (= (or b!93843 b!93866) bm!9338))

(assert (= (and bm!9338 c!15645) b!93834))

(assert (= (and bm!9338 (not c!15645)) b!93828))

(assert (= (or bm!9352 b!93866) bm!9351))

(assert (= (or bm!9347 b!93828 b!93866) bm!9337))

(assert (= (or bm!9355 b!93866) bm!9344))

(assert (= (and d!24559 res!47578) b!93841))

(assert (= (and b!93841 c!15642) b!93862))

(assert (= (and b!93841 (not c!15642)) b!93865))

(assert (= (and b!93862 res!47571) b!93860))

(assert (= (or b!93862 b!93860 b!93865) bm!9357))

(assert (= (or b!93860 b!93865) bm!9346))

(declare-fun m!101227 () Bool)

(assert (=> bm!9351 m!101227))

(declare-fun m!101229 () Bool)

(assert (=> bm!9357 m!101229))

(declare-fun m!101231 () Bool)

(assert (=> bm!9337 m!101231))

(assert (=> bm!9350 m!101085))

(declare-fun m!101233 () Bool)

(assert (=> bm!9350 m!101233))

(declare-fun m!101235 () Bool)

(assert (=> b!93866 m!101235))

(assert (=> b!93866 m!101085))

(assert (=> b!93866 m!101109))

(declare-fun m!101237 () Bool)

(assert (=> b!93866 m!101237))

(declare-fun m!101239 () Bool)

(assert (=> b!93866 m!101239))

(assert (=> b!93866 m!101239))

(declare-fun m!101241 () Bool)

(assert (=> b!93866 m!101241))

(declare-fun m!101243 () Bool)

(assert (=> b!93866 m!101243))

(assert (=> bm!9340 m!101085))

(declare-fun m!101245 () Bool)

(assert (=> bm!9340 m!101245))

(declare-fun m!101247 () Bool)

(assert (=> b!93827 m!101247))

(assert (=> bm!9343 m!101235))

(declare-fun m!101249 () Bool)

(assert (=> bm!9343 m!101249))

(declare-fun m!101251 () Bool)

(assert (=> b!93860 m!101251))

(declare-fun m!101253 () Bool)

(assert (=> d!24559 m!101253))

(assert (=> d!24559 m!101071))

(assert (=> bm!9339 m!101085))

(assert (=> bm!9339 m!101109))

(declare-fun m!101255 () Bool)

(assert (=> bm!9339 m!101255))

(assert (=> b!93862 m!101085))

(declare-fun m!101257 () Bool)

(assert (=> b!93862 m!101257))

(declare-fun m!101259 () Bool)

(assert (=> b!93854 m!101259))

(assert (=> bm!9348 m!101085))

(declare-fun m!101261 () Bool)

(assert (=> bm!9348 m!101261))

(declare-fun m!101263 () Bool)

(assert (=> bm!9344 m!101263))

(assert (=> b!93839 m!101109))

(declare-fun m!101265 () Bool)

(assert (=> b!93839 m!101265))

(declare-fun m!101267 () Bool)

(assert (=> b!93846 m!101267))

(declare-fun m!101269 () Bool)

(assert (=> b!93830 m!101269))

(assert (=> bm!9346 m!101093))

(declare-fun m!101271 () Bool)

(assert (=> bm!9341 m!101271))

(declare-fun m!101273 () Bool)

(assert (=> b!93831 m!101273))

(assert (=> bm!9338 m!101085))

(declare-fun m!101275 () Bool)

(assert (=> bm!9338 m!101275))

(assert (=> b!93851 m!101085))

(assert (=> b!93851 m!101261))

(assert (=> b!93850 m!101109))

(declare-fun m!101277 () Bool)

(assert (=> b!93850 m!101277))

(declare-fun m!101279 () Bool)

(assert (=> b!93847 m!101279))

(assert (=> bm!9359 m!101085))

(declare-fun m!101281 () Bool)

(assert (=> bm!9359 m!101281))

(assert (=> b!93609 d!24559))

(declare-fun d!24561 () Bool)

(declare-fun c!15649 () Bool)

(assert (=> d!24561 (= c!15649 ((_ is ValueCellFull!960) (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun e!61276 () V!3123)

(assert (=> d!24561 (= (get!1256 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!61276)))

(declare-fun b!93871 () Bool)

(declare-fun get!1257 (ValueCell!960 V!3123) V!3123)

(assert (=> b!93871 (= e!61276 (get!1257 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93872 () Bool)

(declare-fun get!1258 (ValueCell!960 V!3123) V!3123)

(assert (=> b!93872 (= e!61276 (get!1258 (select (arr!1992 (_values!2414 (v!2754 (underlying!325 thiss!992)))) from!355) (dynLambda!360 (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24561 c!15649) b!93871))

(assert (= (and d!24561 (not c!15649)) b!93872))

(assert (=> b!93871 m!101105))

(assert (=> b!93871 m!101107))

(declare-fun m!101283 () Bool)

(assert (=> b!93871 m!101283))

(assert (=> b!93872 m!101105))

(assert (=> b!93872 m!101107))

(declare-fun m!101285 () Bool)

(assert (=> b!93872 m!101285))

(assert (=> b!93609 d!24561))

(declare-fun d!24563 () Bool)

(assert (=> d!24563 (= (array_inv!1237 (_keys!4113 newMap!16)) (bvsge (size!2239 (_keys!4113 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!93616 d!24563))

(declare-fun d!24565 () Bool)

(assert (=> d!24565 (= (array_inv!1238 (_values!2414 newMap!16)) (bvsge (size!2240 (_values!2414 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!93616 d!24565))

(declare-fun d!24567 () Bool)

(declare-fun res!47587 () Bool)

(declare-fun e!61279 () Bool)

(assert (=> d!24567 (=> (not res!47587) (not e!61279))))

(declare-fun simpleValid!65 (LongMapFixedSize!828) Bool)

(assert (=> d!24567 (= res!47587 (simpleValid!65 newMap!16))))

(assert (=> d!24567 (= (valid!369 newMap!16) e!61279)))

(declare-fun b!93879 () Bool)

(declare-fun res!47588 () Bool)

(assert (=> b!93879 (=> (not res!47588) (not e!61279))))

(declare-fun arrayCountValidKeys!0 (array!4187 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!93879 (= res!47588 (= (arrayCountValidKeys!0 (_keys!4113 newMap!16) #b00000000000000000000000000000000 (size!2239 (_keys!4113 newMap!16))) (_size!463 newMap!16)))))

(declare-fun b!93880 () Bool)

(declare-fun res!47589 () Bool)

(assert (=> b!93880 (=> (not res!47589) (not e!61279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4187 (_ BitVec 32)) Bool)

(assert (=> b!93880 (= res!47589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4113 newMap!16) (mask!6503 newMap!16)))))

(declare-fun b!93881 () Bool)

(assert (=> b!93881 (= e!61279 (arrayNoDuplicates!0 (_keys!4113 newMap!16) #b00000000000000000000000000000000 Nil!1562))))

(assert (= (and d!24567 res!47587) b!93879))

(assert (= (and b!93879 res!47588) b!93880))

(assert (= (and b!93880 res!47589) b!93881))

(declare-fun m!101287 () Bool)

(assert (=> d!24567 m!101287))

(declare-fun m!101289 () Bool)

(assert (=> b!93879 m!101289))

(declare-fun m!101291 () Bool)

(assert (=> b!93880 m!101291))

(declare-fun m!101293 () Bool)

(assert (=> b!93881 m!101293))

(assert (=> b!93599 d!24567))

(declare-fun d!24569 () Bool)

(assert (=> d!24569 (not (arrayContainsKey!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!46535 () Unit!2787)

(declare-fun choose!68 (array!4187 (_ BitVec 32) (_ BitVec 64) List!1565) Unit!2787)

(assert (=> d!24569 (= lt!46535 (choose!68 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (Cons!1561 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) Nil!1562)))))

(assert (=> d!24569 (bvslt (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24569 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (Cons!1561 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) Nil!1562)) lt!46535)))

(declare-fun bs!3863 () Bool)

(assert (= bs!3863 d!24569))

(assert (=> bs!3863 m!101085))

(assert (=> bs!3863 m!101089))

(assert (=> bs!3863 m!101085))

(declare-fun m!101295 () Bool)

(assert (=> bs!3863 m!101295))

(assert (=> b!93612 d!24569))

(declare-fun d!24571 () Bool)

(assert (=> d!24571 (arrayNoDuplicates!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) from!355 Nil!1562)))

(declare-fun lt!46538 () Unit!2787)

(declare-fun choose!39 (array!4187 (_ BitVec 32) (_ BitVec 32)) Unit!2787)

(assert (=> d!24571 (= lt!46538 (choose!39 (_keys!4113 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24571 (bvslt (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24571 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000000 from!355) lt!46538)))

(declare-fun bs!3864 () Bool)

(assert (= bs!3864 d!24571))

(assert (=> bs!3864 m!101083))

(declare-fun m!101297 () Bool)

(assert (=> bs!3864 m!101297))

(assert (=> b!93612 d!24571))

(declare-fun d!24573 () Bool)

(declare-fun res!47594 () Bool)

(declare-fun e!61284 () Bool)

(assert (=> d!24573 (=> res!47594 e!61284)))

(assert (=> d!24573 (= res!47594 (= (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(assert (=> d!24573 (= (arrayContainsKey!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!61284)))

(declare-fun b!93886 () Bool)

(declare-fun e!61285 () Bool)

(assert (=> b!93886 (= e!61284 e!61285)))

(declare-fun res!47595 () Bool)

(assert (=> b!93886 (=> (not res!47595) (not e!61285))))

(assert (=> b!93886 (= res!47595 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992))))))))

(declare-fun b!93887 () Bool)

(assert (=> b!93887 (= e!61285 (arrayContainsKey!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24573 (not res!47594)) b!93886))

(assert (= (and b!93886 res!47595) b!93887))

(assert (=> d!24573 m!101163))

(assert (=> b!93887 m!101085))

(declare-fun m!101299 () Bool)

(assert (=> b!93887 m!101299))

(assert (=> b!93612 d!24573))

(declare-fun d!24575 () Bool)

(declare-fun e!61288 () Bool)

(assert (=> d!24575 e!61288))

(declare-fun c!15652 () Bool)

(assert (=> d!24575 (= c!15652 (and (not (= (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46541 () Unit!2787)

(declare-fun choose!558 (array!4187 array!4189 (_ BitVec 32) (_ BitVec 32) V!3123 V!3123 (_ BitVec 64) (_ BitVec 32) Int) Unit!2787)

(assert (=> d!24575 (= lt!46541 (choose!558 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))))))

(assert (=> d!24575 (validMask!0 (mask!6503 (v!2754 (underlying!325 thiss!992))))))

(assert (=> d!24575 (= (lemmaListMapContainsThenArrayContainsFrom!83 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (_values!2414 (v!2754 (underlying!325 thiss!992))) (mask!6503 (v!2754 (underlying!325 thiss!992))) (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) (zeroValue!2318 (v!2754 (underlying!325 thiss!992))) (minValue!2318 (v!2754 (underlying!325 thiss!992))) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992)))) lt!46541)))

(declare-fun b!93892 () Bool)

(assert (=> b!93892 (= e!61288 (arrayContainsKey!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!93893 () Bool)

(assert (=> b!93893 (= e!61288 (ite (= (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2260 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24575 c!15652) b!93892))

(assert (= (and d!24575 (not c!15652)) b!93893))

(assert (=> d!24575 m!101085))

(declare-fun m!101301 () Bool)

(assert (=> d!24575 m!101301))

(assert (=> d!24575 m!101079))

(assert (=> b!93892 m!101085))

(assert (=> b!93892 m!101089))

(assert (=> b!93612 d!24575))

(declare-fun d!24577 () Bool)

(declare-fun res!47604 () Bool)

(declare-fun e!61298 () Bool)

(assert (=> d!24577 (=> res!47604 e!61298)))

(assert (=> d!24577 (= res!47604 (bvsge from!355 (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992))))))))

(assert (=> d!24577 (= (arrayNoDuplicates!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) from!355 Nil!1562) e!61298)))

(declare-fun b!93904 () Bool)

(declare-fun e!61297 () Bool)

(declare-fun e!61299 () Bool)

(assert (=> b!93904 (= e!61297 e!61299)))

(declare-fun c!15655 () Bool)

(assert (=> b!93904 (= c!15655 (validKeyInArray!0 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun b!93905 () Bool)

(assert (=> b!93905 (= e!61298 e!61297)))

(declare-fun res!47603 () Bool)

(assert (=> b!93905 (=> (not res!47603) (not e!61297))))

(declare-fun e!61300 () Bool)

(assert (=> b!93905 (= res!47603 (not e!61300))))

(declare-fun res!47602 () Bool)

(assert (=> b!93905 (=> (not res!47602) (not e!61300))))

(assert (=> b!93905 (= res!47602 (validKeyInArray!0 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun b!93906 () Bool)

(declare-fun call!9366 () Bool)

(assert (=> b!93906 (= e!61299 call!9366)))

(declare-fun b!93907 () Bool)

(declare-fun contains!788 (List!1565 (_ BitVec 64)) Bool)

(assert (=> b!93907 (= e!61300 (contains!788 Nil!1562 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355)))))

(declare-fun bm!9363 () Bool)

(assert (=> bm!9363 (= call!9366 (arrayNoDuplicates!0 (_keys!4113 (v!2754 (underlying!325 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15655 (Cons!1561 (select (arr!1991 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) from!355) Nil!1562) Nil!1562)))))

(declare-fun b!93908 () Bool)

(assert (=> b!93908 (= e!61299 call!9366)))

(assert (= (and d!24577 (not res!47604)) b!93905))

(assert (= (and b!93905 res!47602) b!93907))

(assert (= (and b!93905 res!47603) b!93904))

(assert (= (and b!93904 c!15655) b!93906))

(assert (= (and b!93904 (not c!15655)) b!93908))

(assert (= (or b!93906 b!93908) bm!9363))

(assert (=> b!93904 m!101085))

(assert (=> b!93904 m!101085))

(declare-fun m!101303 () Bool)

(assert (=> b!93904 m!101303))

(assert (=> b!93905 m!101085))

(assert (=> b!93905 m!101085))

(assert (=> b!93905 m!101303))

(assert (=> b!93907 m!101085))

(assert (=> b!93907 m!101085))

(declare-fun m!101305 () Bool)

(assert (=> b!93907 m!101305))

(assert (=> bm!9363 m!101085))

(declare-fun m!101307 () Bool)

(assert (=> bm!9363 m!101307))

(assert (=> b!93612 d!24577))

(declare-fun d!24579 () Bool)

(assert (=> d!24579 (= (validMask!0 (mask!6503 (v!2754 (underlying!325 thiss!992)))) (and (or (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000000111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000001111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000011111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000000111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000001111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000011111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000000111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000001111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000011111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000000111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000001111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000011111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000000111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000001111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000011111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000000111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000001111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000011111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000000111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000001111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000011111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000000111111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000001111111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000011111111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00000111111111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00001111111111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00011111111111111111111111111111) (= (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6503 (v!2754 (underlying!325 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!93607 d!24579))

(declare-fun d!24581 () Bool)

(assert (=> d!24581 (= (array_inv!1237 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) (bvsge (size!2239 (_keys!4113 (v!2754 (underlying!325 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!93611 d!24581))

(declare-fun d!24583 () Bool)

(assert (=> d!24583 (= (array_inv!1238 (_values!2414 (v!2754 (underlying!325 thiss!992)))) (bvsge (size!2240 (_values!2414 (v!2754 (underlying!325 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!93611 d!24583))

(declare-fun b!93915 () Bool)

(declare-fun e!61305 () Bool)

(assert (=> b!93915 (= e!61305 tp_is_empty!2607)))

(declare-fun mapIsEmpty!3663 () Bool)

(declare-fun mapRes!3663 () Bool)

(assert (=> mapIsEmpty!3663 mapRes!3663))

(declare-fun b!93916 () Bool)

(declare-fun e!61306 () Bool)

(assert (=> b!93916 (= e!61306 tp_is_empty!2607)))

(declare-fun mapNonEmpty!3663 () Bool)

(declare-fun tp!9423 () Bool)

(assert (=> mapNonEmpty!3663 (= mapRes!3663 (and tp!9423 e!61305))))

(declare-fun mapKey!3663 () (_ BitVec 32))

(declare-fun mapRest!3663 () (Array (_ BitVec 32) ValueCell!960))

(declare-fun mapValue!3663 () ValueCell!960)

(assert (=> mapNonEmpty!3663 (= mapRest!3653 (store mapRest!3663 mapKey!3663 mapValue!3663))))

(declare-fun condMapEmpty!3663 () Bool)

(declare-fun mapDefault!3663 () ValueCell!960)

(assert (=> mapNonEmpty!3654 (= condMapEmpty!3663 (= mapRest!3653 ((as const (Array (_ BitVec 32) ValueCell!960)) mapDefault!3663)))))

(assert (=> mapNonEmpty!3654 (= tp!9405 (and e!61306 mapRes!3663))))

(assert (= (and mapNonEmpty!3654 condMapEmpty!3663) mapIsEmpty!3663))

(assert (= (and mapNonEmpty!3654 (not condMapEmpty!3663)) mapNonEmpty!3663))

(assert (= (and mapNonEmpty!3663 ((_ is ValueCellFull!960) mapValue!3663)) b!93915))

(assert (= (and mapNonEmpty!3654 ((_ is ValueCellFull!960) mapDefault!3663)) b!93916))

(declare-fun m!101309 () Bool)

(assert (=> mapNonEmpty!3663 m!101309))

(declare-fun b!93917 () Bool)

(declare-fun e!61307 () Bool)

(assert (=> b!93917 (= e!61307 tp_is_empty!2607)))

(declare-fun mapIsEmpty!3664 () Bool)

(declare-fun mapRes!3664 () Bool)

(assert (=> mapIsEmpty!3664 mapRes!3664))

(declare-fun b!93918 () Bool)

(declare-fun e!61308 () Bool)

(assert (=> b!93918 (= e!61308 tp_is_empty!2607)))

(declare-fun mapNonEmpty!3664 () Bool)

(declare-fun tp!9424 () Bool)

(assert (=> mapNonEmpty!3664 (= mapRes!3664 (and tp!9424 e!61307))))

(declare-fun mapKey!3664 () (_ BitVec 32))

(declare-fun mapRest!3664 () (Array (_ BitVec 32) ValueCell!960))

(declare-fun mapValue!3664 () ValueCell!960)

(assert (=> mapNonEmpty!3664 (= mapRest!3654 (store mapRest!3664 mapKey!3664 mapValue!3664))))

(declare-fun condMapEmpty!3664 () Bool)

(declare-fun mapDefault!3664 () ValueCell!960)

(assert (=> mapNonEmpty!3653 (= condMapEmpty!3664 (= mapRest!3654 ((as const (Array (_ BitVec 32) ValueCell!960)) mapDefault!3664)))))

(assert (=> mapNonEmpty!3653 (= tp!9408 (and e!61308 mapRes!3664))))

(assert (= (and mapNonEmpty!3653 condMapEmpty!3664) mapIsEmpty!3664))

(assert (= (and mapNonEmpty!3653 (not condMapEmpty!3664)) mapNonEmpty!3664))

(assert (= (and mapNonEmpty!3664 ((_ is ValueCellFull!960) mapValue!3664)) b!93917))

(assert (= (and mapNonEmpty!3653 ((_ is ValueCellFull!960) mapDefault!3664)) b!93918))

(declare-fun m!101311 () Bool)

(assert (=> mapNonEmpty!3664 m!101311))

(declare-fun b_lambda!4139 () Bool)

(assert (= b_lambda!4137 (or (and b!93611 b_free!2381) (and b!93616 b_free!2383 (= (defaultEntry!2431 newMap!16) (defaultEntry!2431 (v!2754 (underlying!325 thiss!992))))) b_lambda!4139)))

(check-sat tp_is_empty!2607 (not b!93850) (not bm!9350) (not d!24553) (not d!24555) (not bm!9344) (not b_lambda!4139) (not b!93892) (not b!93724) (not b!93866) b_and!5729 (not bm!9286) (not bm!9337) (not b_next!2381) (not b!93879) (not b!93731) (not bm!9351) (not bm!9341) (not b!93717) (not b!93730) (not bm!9363) (not b!93862) b_and!5727 (not b!93735) (not bm!9338) (not b!93872) (not bm!9348) (not b!93839) (not b!93871) (not bm!9359) (not b_next!2383) (not d!24571) (not d!24567) (not bm!9340) (not d!24557) (not b!93881) (not b!93907) (not bm!9343) (not d!24569) (not b!93737) (not bm!9288) (not bm!9357) (not b!93719) (not bm!9346) (not b!93905) (not bm!9284) (not bm!9339) (not b!93904) (not mapNonEmpty!3664) (not mapNonEmpty!3663) (not b!93880) (not b!93721) (not b!93860) (not d!24551) (not d!24559) (not b!93851) (not d!24575) (not b_lambda!4135) (not b!93887) (not bm!9283) (not b!93744) (not b!93746))
(check-sat b_and!5727 b_and!5729 (not b_next!2381) (not b_next!2383))
