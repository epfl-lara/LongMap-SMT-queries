; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77464 () Bool)

(assert start!77464)

(declare-fun b!902574 () Bool)

(declare-fun b_free!16081 () Bool)

(declare-fun b_next!16081 () Bool)

(assert (=> b!902574 (= b_free!16081 (not b_next!16081))))

(declare-fun tp!56346 () Bool)

(declare-fun b_and!26429 () Bool)

(assert (=> b!902574 (= tp!56346 b_and!26429)))

(declare-fun b!902564 () Bool)

(declare-datatypes ((array!52915 0))(
  ( (array!52916 (arr!25420 (Array (_ BitVec 32) (_ BitVec 64))) (size!25880 (_ BitVec 32))) )
))
(declare-datatypes ((V!29511 0))(
  ( (V!29512 (val!9255 Int)) )
))
(declare-datatypes ((ValueCell!8723 0))(
  ( (ValueCellFull!8723 (v!11753 V!29511)) (EmptyCell!8723) )
))
(declare-datatypes ((array!52917 0))(
  ( (array!52918 (arr!25421 (Array (_ BitVec 32) ValueCell!8723)) (size!25881 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4462 0))(
  ( (LongMapFixedSize!4463 (defaultEntry!5474 Int) (mask!26332 (_ BitVec 32)) (extraKeys!5204 (_ BitVec 32)) (zeroValue!5308 V!29511) (minValue!5308 V!29511) (_size!2286 (_ BitVec 32)) (_keys!10317 array!52915) (_values!5495 array!52917) (_vacant!2286 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4462)

(declare-fun lt!407920 () V!29511)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun e!505409 () Bool)

(declare-fun dynLambda!1333 (Int (_ BitVec 64)) V!29511)

(assert (=> b!902564 (= e!505409 (= lt!407920 (dynLambda!1333 (defaultEntry!5474 thiss!1181) key!785)))))

(declare-fun bm!40213 () Bool)

(declare-fun call!40216 () V!29511)

(declare-fun call!40215 () V!29511)

(assert (=> bm!40213 (= call!40216 call!40215)))

(declare-fun b!902565 () Bool)

(declare-fun e!505404 () Bool)

(assert (=> b!902565 (= e!505404 e!505409)))

(declare-fun c!95804 () Bool)

(declare-fun contains!4416 (LongMapFixedSize!4462 (_ BitVec 64)) Bool)

(assert (=> b!902565 (= c!95804 (contains!4416 thiss!1181 key!785))))

(declare-datatypes ((SeekEntryResult!8908 0))(
  ( (MissingZero!8908 (index!38003 (_ BitVec 32))) (Found!8908 (index!38004 (_ BitVec 32))) (Intermediate!8908 (undefined!9720 Bool) (index!38005 (_ BitVec 32)) (x!76797 (_ BitVec 32))) (Undefined!8908) (MissingVacant!8908 (index!38006 (_ BitVec 32))) )
))
(declare-fun lt!407923 () SeekEntryResult!8908)

(declare-fun get!13392 (ValueCell!8723 V!29511) V!29511)

(assert (=> b!902565 (= lt!407920 (get!13392 (select (arr!25421 (_values!5495 thiss!1181)) (index!38004 lt!407923)) (dynLambda!1333 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!505411 () Bool)

(assert (=> b!902565 e!505411))

(declare-fun c!95803 () Bool)

(assert (=> b!902565 (= c!95803 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30622 0))(
  ( (Unit!30623) )
))
(declare-fun lt!407924 () Unit!30622)

(declare-fun lemmaKeyInListMapThenSameValueInArray!12 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64) (_ BitVec 32) Int) Unit!30622)

(assert (=> b!902565 (= lt!407924 (lemmaKeyInListMapThenSameValueInArray!12 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785 (index!38004 lt!407923) (defaultEntry!5474 thiss!1181)))))

(declare-datatypes ((tuple2!12000 0))(
  ( (tuple2!12001 (_1!6011 (_ BitVec 64)) (_2!6011 V!29511)) )
))
(declare-datatypes ((List!17830 0))(
  ( (Nil!17827) (Cons!17826 (h!18978 tuple2!12000) (t!25191 List!17830)) )
))
(declare-datatypes ((ListLongMap!10699 0))(
  ( (ListLongMap!10700 (toList!5365 List!17830)) )
))
(declare-fun lt!407925 () ListLongMap!10699)

(declare-fun contains!4417 (ListLongMap!10699 (_ BitVec 64)) Bool)

(assert (=> b!902565 (contains!4417 lt!407925 (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!407923)))))

(declare-fun getCurrentListMap!2636 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 32) Int) ListLongMap!10699)

(assert (=> b!902565 (= lt!407925 (getCurrentListMap!2636 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!407922 () Unit!30622)

(declare-fun lemmaValidKeyInArrayIsInListMap!266 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 32) Int) Unit!30622)

(assert (=> b!902565 (= lt!407922 (lemmaValidKeyInArrayIsInListMap!266 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) (index!38004 lt!407923) (defaultEntry!5474 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902565 (arrayContainsKey!0 (_keys!10317 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407919 () Unit!30622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52915 (_ BitVec 64) (_ BitVec 32)) Unit!30622)

(assert (=> b!902565 (= lt!407919 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10317 thiss!1181) key!785 (index!38004 lt!407923)))))

(declare-fun b!902566 () Bool)

(declare-fun e!505403 () Bool)

(assert (=> b!902566 (= e!505411 e!505403)))

(declare-fun c!95802 () Bool)

(assert (=> b!902566 (= c!95802 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902567 () Bool)

(declare-datatypes ((Option!470 0))(
  ( (Some!469 (v!11754 V!29511)) (None!468) )
))
(declare-fun get!13393 (Option!470) V!29511)

(declare-fun getValueByKey!464 (List!17830 (_ BitVec 64)) Option!470)

(declare-fun map!12284 (LongMapFixedSize!4462) ListLongMap!10699)

(assert (=> b!902567 (= e!505409 (= lt!407920 (get!13393 (getValueByKey!464 (toList!5365 (map!12284 thiss!1181)) key!785))))))

(declare-fun b!902568 () Bool)

(declare-fun res!609058 () Bool)

(declare-fun e!505413 () Bool)

(assert (=> b!902568 (=> (not res!609058) (not e!505413))))

(assert (=> b!902568 (= res!609058 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!902568 (= e!505403 e!505413)))

(declare-fun b!902569 () Bool)

(declare-fun e!505408 () Bool)

(declare-fun e!505414 () Bool)

(declare-fun mapRes!29302 () Bool)

(assert (=> b!902569 (= e!505408 (and e!505414 mapRes!29302))))

(declare-fun condMapEmpty!29302 () Bool)

(declare-fun mapDefault!29302 () ValueCell!8723)

(assert (=> b!902569 (= condMapEmpty!29302 (= (arr!25421 (_values!5495 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8723)) mapDefault!29302)))))

(declare-fun mapIsEmpty!29302 () Bool)

(assert (=> mapIsEmpty!29302 mapRes!29302))

(declare-fun b!902570 () Bool)

(declare-fun tp_is_empty!18409 () Bool)

(assert (=> b!902570 (= e!505414 tp_is_empty!18409)))

(declare-fun b!902571 () Bool)

(declare-fun e!505406 () Bool)

(assert (=> b!902571 (= e!505411 e!505406)))

(declare-fun res!609062 () Bool)

(assert (=> b!902571 (= res!609062 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!902571 (=> (not res!609062) (not e!505406))))

(declare-fun b!902572 () Bool)

(declare-fun e!505405 () Bool)

(assert (=> b!902572 (= e!505405 tp_is_empty!18409)))

(declare-fun b!902573 () Bool)

(assert (=> b!902573 (= e!505406 (= call!40215 (zeroValue!5308 thiss!1181)))))

(declare-fun bm!40212 () Bool)

(declare-fun apply!418 (ListLongMap!10699 (_ BitVec 64)) V!29511)

(assert (=> bm!40212 (= call!40215 (apply!418 lt!407925 key!785))))

(declare-fun res!609059 () Bool)

(declare-fun e!505402 () Bool)

(assert (=> start!77464 (=> (not res!609059) (not e!505402))))

(declare-fun valid!1725 (LongMapFixedSize!4462) Bool)

(assert (=> start!77464 (= res!609059 (valid!1725 thiss!1181))))

(assert (=> start!77464 e!505402))

(declare-fun e!505412 () Bool)

(assert (=> start!77464 e!505412))

(assert (=> start!77464 true))

(declare-fun array_inv!19998 (array!52915) Bool)

(declare-fun array_inv!19999 (array!52917) Bool)

(assert (=> b!902574 (= e!505412 (and tp!56346 tp_is_empty!18409 (array_inv!19998 (_keys!10317 thiss!1181)) (array_inv!19999 (_values!5495 thiss!1181)) e!505408))))

(declare-fun b!902575 () Bool)

(declare-fun res!609057 () Bool)

(assert (=> b!902575 (=> (not res!609057) (not e!505402))))

(assert (=> b!902575 (= res!609057 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!29302 () Bool)

(declare-fun tp!56347 () Bool)

(assert (=> mapNonEmpty!29302 (= mapRes!29302 (and tp!56347 e!505405))))

(declare-fun mapRest!29302 () (Array (_ BitVec 32) ValueCell!8723))

(declare-fun mapKey!29302 () (_ BitVec 32))

(declare-fun mapValue!29302 () ValueCell!8723)

(assert (=> mapNonEmpty!29302 (= (arr!25421 (_values!5495 thiss!1181)) (store mapRest!29302 mapKey!29302 mapValue!29302))))

(declare-fun b!902576 () Bool)

(assert (=> b!902576 (= e!505402 (not e!505404))))

(declare-fun res!609060 () Bool)

(assert (=> b!902576 (=> res!609060 e!505404)))

(get-info :version)

(assert (=> b!902576 (= res!609060 (not ((_ is Found!8908) lt!407923)))))

(declare-fun e!505407 () Bool)

(assert (=> b!902576 e!505407))

(declare-fun res!609061 () Bool)

(assert (=> b!902576 (=> res!609061 e!505407)))

(assert (=> b!902576 (= res!609061 (not ((_ is Found!8908) lt!407923)))))

(declare-fun lt!407921 () Unit!30622)

(declare-fun lemmaSeekEntryGivesInRangeIndex!124 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64)) Unit!30622)

(assert (=> b!902576 (= lt!407921 (lemmaSeekEntryGivesInRangeIndex!124 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52915 (_ BitVec 32)) SeekEntryResult!8908)

(assert (=> b!902576 (= lt!407923 (seekEntry!0 key!785 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)))))

(declare-fun b!902577 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!902577 (= e!505407 (inRange!0 (index!38004 lt!407923) (mask!26332 thiss!1181)))))

(declare-fun b!902578 () Bool)

(assert (=> b!902578 (= e!505413 (= call!40216 (minValue!5308 thiss!1181)))))

(declare-fun b!902579 () Bool)

(assert (=> b!902579 (= e!505403 (= call!40216 (get!13392 (select (arr!25421 (_values!5495 thiss!1181)) (index!38004 lt!407923)) (dynLambda!1333 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77464 res!609059) b!902575))

(assert (= (and b!902575 res!609057) b!902576))

(assert (= (and b!902576 (not res!609061)) b!902577))

(assert (= (and b!902576 (not res!609060)) b!902565))

(assert (= (and b!902565 c!95803) b!902571))

(assert (= (and b!902565 (not c!95803)) b!902566))

(assert (= (and b!902571 res!609062) b!902573))

(assert (= (and b!902566 c!95802) b!902568))

(assert (= (and b!902566 (not c!95802)) b!902579))

(assert (= (and b!902568 res!609058) b!902578))

(assert (= (or b!902578 b!902579) bm!40213))

(assert (= (or b!902573 bm!40213) bm!40212))

(assert (= (and b!902565 c!95804) b!902567))

(assert (= (and b!902565 (not c!95804)) b!902564))

(assert (= (and b!902569 condMapEmpty!29302) mapIsEmpty!29302))

(assert (= (and b!902569 (not condMapEmpty!29302)) mapNonEmpty!29302))

(assert (= (and mapNonEmpty!29302 ((_ is ValueCellFull!8723) mapValue!29302)) b!902572))

(assert (= (and b!902569 ((_ is ValueCellFull!8723) mapDefault!29302)) b!902570))

(assert (= b!902574 b!902569))

(assert (= start!77464 b!902574))

(declare-fun b_lambda!13061 () Bool)

(assert (=> (not b_lambda!13061) (not b!902564)))

(declare-fun t!25188 () Bool)

(declare-fun tb!5209 () Bool)

(assert (=> (and b!902574 (= (defaultEntry!5474 thiss!1181) (defaultEntry!5474 thiss!1181)) t!25188) tb!5209))

(declare-fun result!10211 () Bool)

(assert (=> tb!5209 (= result!10211 tp_is_empty!18409)))

(assert (=> b!902564 t!25188))

(declare-fun b_and!26431 () Bool)

(assert (= b_and!26429 (and (=> t!25188 result!10211) b_and!26431)))

(declare-fun b_lambda!13063 () Bool)

(assert (=> (not b_lambda!13063) (not b!902565)))

(declare-fun t!25190 () Bool)

(declare-fun tb!5211 () Bool)

(assert (=> (and b!902574 (= (defaultEntry!5474 thiss!1181) (defaultEntry!5474 thiss!1181)) t!25190) tb!5211))

(declare-fun result!10215 () Bool)

(assert (=> tb!5211 (= result!10215 tp_is_empty!18409)))

(assert (=> b!902565 t!25190))

(declare-fun b_and!26433 () Bool)

(assert (= b_and!26431 (and (=> t!25190 result!10215) b_and!26433)))

(declare-fun b_lambda!13065 () Bool)

(assert (=> (not b_lambda!13065) (not b!902579)))

(assert (=> b!902579 t!25190))

(declare-fun b_and!26435 () Bool)

(assert (= b_and!26433 (and (=> t!25190 result!10215) b_and!26435)))

(declare-fun m!839163 () Bool)

(assert (=> mapNonEmpty!29302 m!839163))

(declare-fun m!839165 () Bool)

(assert (=> b!902579 m!839165))

(declare-fun m!839167 () Bool)

(assert (=> b!902579 m!839167))

(assert (=> b!902579 m!839165))

(assert (=> b!902579 m!839167))

(declare-fun m!839169 () Bool)

(assert (=> b!902579 m!839169))

(declare-fun m!839171 () Bool)

(assert (=> b!902577 m!839171))

(assert (=> b!902565 m!839167))

(declare-fun m!839173 () Bool)

(assert (=> b!902565 m!839173))

(declare-fun m!839175 () Bool)

(assert (=> b!902565 m!839175))

(declare-fun m!839177 () Bool)

(assert (=> b!902565 m!839177))

(assert (=> b!902565 m!839165))

(assert (=> b!902565 m!839167))

(assert (=> b!902565 m!839169))

(declare-fun m!839179 () Bool)

(assert (=> b!902565 m!839179))

(declare-fun m!839181 () Bool)

(assert (=> b!902565 m!839181))

(declare-fun m!839183 () Bool)

(assert (=> b!902565 m!839183))

(declare-fun m!839185 () Bool)

(assert (=> b!902565 m!839185))

(assert (=> b!902565 m!839181))

(assert (=> b!902565 m!839165))

(declare-fun m!839187 () Bool)

(assert (=> b!902565 m!839187))

(declare-fun m!839189 () Bool)

(assert (=> bm!40212 m!839189))

(declare-fun m!839191 () Bool)

(assert (=> b!902574 m!839191))

(declare-fun m!839193 () Bool)

(assert (=> b!902574 m!839193))

(declare-fun m!839195 () Bool)

(assert (=> b!902567 m!839195))

(declare-fun m!839197 () Bool)

(assert (=> b!902567 m!839197))

(assert (=> b!902567 m!839197))

(declare-fun m!839199 () Bool)

(assert (=> b!902567 m!839199))

(declare-fun m!839201 () Bool)

(assert (=> b!902564 m!839201))

(declare-fun m!839203 () Bool)

(assert (=> b!902576 m!839203))

(declare-fun m!839205 () Bool)

(assert (=> b!902576 m!839205))

(declare-fun m!839207 () Bool)

(assert (=> start!77464 m!839207))

(check-sat (not b_lambda!13063) tp_is_empty!18409 (not b_lambda!13065) (not b!902576) (not b!902567) (not b!902565) (not b_lambda!13061) (not start!77464) (not bm!40212) (not mapNonEmpty!29302) (not b_next!16081) (not b!902577) b_and!26435 (not b!902574) (not b!902579))
(check-sat b_and!26435 (not b_next!16081))
(get-model)

(declare-fun b_lambda!13079 () Bool)

(assert (= b_lambda!13061 (or (and b!902574 b_free!16081) b_lambda!13079)))

(declare-fun b_lambda!13081 () Bool)

(assert (= b_lambda!13063 (or (and b!902574 b_free!16081) b_lambda!13081)))

(declare-fun b_lambda!13083 () Bool)

(assert (= b_lambda!13065 (or (and b!902574 b_free!16081) b_lambda!13083)))

(check-sat (not b_lambda!13081) tp_is_empty!18409 (not b!902567) (not b!902565) (not start!77464) (not bm!40212) (not mapNonEmpty!29302) (not b!902577) b_and!26435 (not b!902576) (not b_lambda!13083) (not b!902574) (not b!902579) (not b_next!16081) (not b_lambda!13079))
(check-sat b_and!26435 (not b_next!16081))
(get-model)

(declare-fun d!112181 () Bool)

(assert (=> d!112181 (= (array_inv!19998 (_keys!10317 thiss!1181)) (bvsge (size!25880 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902574 d!112181))

(declare-fun d!112183 () Bool)

(assert (=> d!112183 (= (array_inv!19999 (_values!5495 thiss!1181)) (bvsge (size!25881 (_values!5495 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902574 d!112183))

(declare-fun d!112185 () Bool)

(declare-fun c!95825 () Bool)

(assert (=> d!112185 (= c!95825 ((_ is ValueCellFull!8723) (select (arr!25421 (_values!5495 thiss!1181)) (index!38004 lt!407923))))))

(declare-fun e!505495 () V!29511)

(assert (=> d!112185 (= (get!13392 (select (arr!25421 (_values!5495 thiss!1181)) (index!38004 lt!407923)) (dynLambda!1333 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!505495)))

(declare-fun b!902686 () Bool)

(declare-fun get!13395 (ValueCell!8723 V!29511) V!29511)

(assert (=> b!902686 (= e!505495 (get!13395 (select (arr!25421 (_values!5495 thiss!1181)) (index!38004 lt!407923)) (dynLambda!1333 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!902687 () Bool)

(declare-fun get!13396 (ValueCell!8723 V!29511) V!29511)

(assert (=> b!902687 (= e!505495 (get!13396 (select (arr!25421 (_values!5495 thiss!1181)) (index!38004 lt!407923)) (dynLambda!1333 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!112185 c!95825) b!902686))

(assert (= (and d!112185 (not c!95825)) b!902687))

(assert (=> b!902686 m!839165))

(assert (=> b!902686 m!839167))

(declare-fun m!839301 () Bool)

(assert (=> b!902686 m!839301))

(assert (=> b!902687 m!839165))

(assert (=> b!902687 m!839167))

(declare-fun m!839303 () Bool)

(assert (=> b!902687 m!839303))

(assert (=> b!902579 d!112185))

(declare-fun b!902702 () Bool)

(declare-fun e!505508 () Bool)

(declare-fun e!505510 () Bool)

(assert (=> b!902702 (= e!505508 e!505510)))

(declare-fun c!95830 () Bool)

(assert (=> b!902702 (= c!95830 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902703 () Bool)

(declare-fun res!609107 () Bool)

(declare-fun e!505507 () Bool)

(assert (=> b!902703 (=> (not res!609107) (not e!505507))))

(assert (=> b!902703 (= res!609107 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!902703 (= e!505510 e!505507)))

(declare-fun bm!40234 () Bool)

(declare-fun call!40240 () V!29511)

(declare-fun call!40238 () V!29511)

(assert (=> bm!40234 (= call!40240 call!40238)))

(declare-fun b!902704 () Bool)

(declare-fun e!505506 () Bool)

(assert (=> b!902704 (= e!505508 e!505506)))

(declare-fun res!609106 () Bool)

(assert (=> b!902704 (= res!609106 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!902704 (=> (not res!609106) (not e!505506))))

(declare-fun b!902705 () Bool)

(declare-fun res!609105 () Bool)

(declare-fun e!505509 () Bool)

(assert (=> b!902705 (=> (not res!609105) (not e!505509))))

(assert (=> b!902705 (= res!609105 (arrayContainsKey!0 (_keys!10317 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!902705 (= e!505510 e!505509)))

(declare-fun d!112187 () Bool)

(assert (=> d!112187 e!505508))

(declare-fun c!95831 () Bool)

(assert (=> d!112187 (= c!95831 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407970 () Unit!30622)

(declare-fun choose!1529 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64) (_ BitVec 32) Int) Unit!30622)

(assert (=> d!112187 (= lt!407970 (choose!1529 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785 (index!38004 lt!407923) (defaultEntry!5474 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!112187 (validMask!0 (mask!26332 thiss!1181))))

(assert (=> d!112187 (= (lemmaKeyInListMapThenSameValueInArray!12 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785 (index!38004 lt!407923) (defaultEntry!5474 thiss!1181)) lt!407970)))

(declare-fun b!902706 () Bool)

(assert (=> b!902706 (= e!505507 (= call!40240 (minValue!5308 thiss!1181)))))

(declare-fun call!40239 () ListLongMap!10699)

(declare-fun bm!40235 () Bool)

(declare-fun call!40237 () ListLongMap!10699)

(assert (=> bm!40235 (= call!40238 (apply!418 (ite c!95831 call!40237 call!40239) key!785))))

(declare-fun bm!40236 () Bool)

(assert (=> bm!40236 (= call!40239 call!40237)))

(declare-fun bm!40237 () Bool)

(assert (=> bm!40237 (= call!40237 (getCurrentListMap!2636 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun b!902707 () Bool)

(assert (=> b!902707 (= e!505506 (= call!40238 (zeroValue!5308 thiss!1181)))))

(declare-fun b!902708 () Bool)

(assert (=> b!902708 (= e!505509 (= call!40240 (get!13392 (select (arr!25421 (_values!5495 thiss!1181)) (index!38004 lt!407923)) (dynLambda!1333 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!902708 (and (bvsge (index!38004 lt!407923) #b00000000000000000000000000000000) (bvslt (index!38004 lt!407923) (size!25881 (_values!5495 thiss!1181))))))

(assert (= (and d!112187 c!95831) b!902704))

(assert (= (and d!112187 (not c!95831)) b!902702))

(assert (= (and b!902704 res!609106) b!902707))

(assert (= (and b!902702 c!95830) b!902703))

(assert (= (and b!902702 (not c!95830)) b!902705))

(assert (= (and b!902703 res!609107) b!902706))

(assert (= (and b!902705 res!609105) b!902708))

(assert (= (or b!902706 b!902708) bm!40236))

(assert (= (or b!902706 b!902708) bm!40234))

(assert (= (or b!902707 bm!40236) bm!40237))

(assert (= (or b!902707 bm!40234) bm!40235))

(declare-fun b_lambda!13085 () Bool)

(assert (=> (not b_lambda!13085) (not b!902708)))

(assert (=> b!902708 t!25190))

(declare-fun b_and!26453 () Bool)

(assert (= b_and!26435 (and (=> t!25190 result!10215) b_and!26453)))

(assert (=> b!902705 m!839185))

(assert (=> bm!40237 m!839179))

(assert (=> b!902708 m!839165))

(assert (=> b!902708 m!839167))

(assert (=> b!902708 m!839165))

(assert (=> b!902708 m!839167))

(assert (=> b!902708 m!839169))

(declare-fun m!839305 () Bool)

(assert (=> d!112187 m!839305))

(declare-fun m!839307 () Bool)

(assert (=> d!112187 m!839307))

(declare-fun m!839309 () Bool)

(assert (=> bm!40235 m!839309))

(assert (=> b!902565 d!112187))

(assert (=> b!902565 d!112185))

(declare-fun d!112189 () Bool)

(declare-fun res!609112 () Bool)

(declare-fun e!505515 () Bool)

(assert (=> d!112189 (=> res!609112 e!505515)))

(assert (=> d!112189 (= res!609112 (= (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!112189 (= (arrayContainsKey!0 (_keys!10317 thiss!1181) key!785 #b00000000000000000000000000000000) e!505515)))

(declare-fun b!902713 () Bool)

(declare-fun e!505516 () Bool)

(assert (=> b!902713 (= e!505515 e!505516)))

(declare-fun res!609113 () Bool)

(assert (=> b!902713 (=> (not res!609113) (not e!505516))))

(assert (=> b!902713 (= res!609113 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25880 (_keys!10317 thiss!1181))))))

(declare-fun b!902714 () Bool)

(assert (=> b!902714 (= e!505516 (arrayContainsKey!0 (_keys!10317 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112189 (not res!609112)) b!902713))

(assert (= (and b!902713 res!609113) b!902714))

(declare-fun m!839311 () Bool)

(assert (=> d!112189 m!839311))

(declare-fun m!839313 () Bool)

(assert (=> b!902714 m!839313))

(assert (=> b!902565 d!112189))

(declare-fun b!902757 () Bool)

(declare-fun e!505550 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902757 (= e!505550 (validKeyInArray!0 (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40252 () Bool)

(declare-fun call!40255 () Bool)

(declare-fun lt!408034 () ListLongMap!10699)

(assert (=> bm!40252 (= call!40255 (contains!4417 lt!408034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902758 () Bool)

(declare-fun e!505549 () Bool)

(assert (=> b!902758 (= e!505549 (not call!40255))))

(declare-fun bm!40253 () Bool)

(declare-fun call!40260 () ListLongMap!10699)

(declare-fun call!40256 () ListLongMap!10699)

(assert (=> bm!40253 (= call!40260 call!40256)))

(declare-fun d!112191 () Bool)

(declare-fun e!505543 () Bool)

(assert (=> d!112191 e!505543))

(declare-fun res!609138 () Bool)

(assert (=> d!112191 (=> (not res!609138) (not e!505543))))

(assert (=> d!112191 (= res!609138 (or (bvsge #b00000000000000000000000000000000 (size!25880 (_keys!10317 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25880 (_keys!10317 thiss!1181))))))))

(declare-fun lt!408029 () ListLongMap!10699)

(assert (=> d!112191 (= lt!408034 lt!408029)))

(declare-fun lt!408020 () Unit!30622)

(declare-fun e!505551 () Unit!30622)

(assert (=> d!112191 (= lt!408020 e!505551)))

(declare-fun c!95845 () Bool)

(assert (=> d!112191 (= c!95845 e!505550)))

(declare-fun res!609133 () Bool)

(assert (=> d!112191 (=> (not res!609133) (not e!505550))))

(assert (=> d!112191 (= res!609133 (bvslt #b00000000000000000000000000000000 (size!25880 (_keys!10317 thiss!1181))))))

(declare-fun e!505547 () ListLongMap!10699)

(assert (=> d!112191 (= lt!408029 e!505547)))

(declare-fun c!95846 () Bool)

(assert (=> d!112191 (= c!95846 (and (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112191 (validMask!0 (mask!26332 thiss!1181))))

(assert (=> d!112191 (= (getCurrentListMap!2636 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)) lt!408034)))

(declare-fun b!902759 () Bool)

(declare-fun e!505553 () Bool)

(assert (=> b!902759 (= e!505553 (= (apply!418 lt!408034 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5308 thiss!1181)))))

(declare-fun b!902760 () Bool)

(declare-fun e!505544 () Bool)

(declare-fun e!505546 () Bool)

(assert (=> b!902760 (= e!505544 e!505546)))

(declare-fun res!609135 () Bool)

(assert (=> b!902760 (=> (not res!609135) (not e!505546))))

(assert (=> b!902760 (= res!609135 (contains!4417 lt!408034 (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!902760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25880 (_keys!10317 thiss!1181))))))

(declare-fun b!902761 () Bool)

(declare-fun e!505554 () Bool)

(declare-fun call!40261 () Bool)

(assert (=> b!902761 (= e!505554 (not call!40261))))

(declare-fun b!902762 () Bool)

(declare-fun e!505552 () Bool)

(assert (=> b!902762 (= e!505554 e!505552)))

(declare-fun res!609134 () Bool)

(assert (=> b!902762 (= res!609134 call!40261)))

(assert (=> b!902762 (=> (not res!609134) (not e!505552))))

(declare-fun b!902763 () Bool)

(declare-fun e!505545 () ListLongMap!10699)

(assert (=> b!902763 (= e!505547 e!505545)))

(declare-fun c!95847 () Bool)

(assert (=> b!902763 (= c!95847 (and (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40254 () Bool)

(assert (=> bm!40254 (= call!40261 (contains!4417 lt!408034 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40255 () Bool)

(declare-fun call!40257 () ListLongMap!10699)

(assert (=> bm!40255 (= call!40257 call!40260)))

(declare-fun b!902764 () Bool)

(declare-fun call!40258 () ListLongMap!10699)

(declare-fun +!2611 (ListLongMap!10699 tuple2!12000) ListLongMap!10699)

(assert (=> b!902764 (= e!505547 (+!2611 call!40258 (tuple2!12001 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5308 thiss!1181))))))

(declare-fun b!902765 () Bool)

(assert (=> b!902765 (= e!505552 (= (apply!418 lt!408034 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5308 thiss!1181)))))

(declare-fun bm!40256 () Bool)

(assert (=> bm!40256 (= call!40258 (+!2611 (ite c!95846 call!40256 (ite c!95847 call!40260 call!40257)) (ite (or c!95846 c!95847) (tuple2!12001 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5308 thiss!1181)) (tuple2!12001 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5308 thiss!1181)))))))

(declare-fun b!902766 () Bool)

(declare-fun c!95849 () Bool)

(assert (=> b!902766 (= c!95849 (and (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!505555 () ListLongMap!10699)

(assert (=> b!902766 (= e!505545 e!505555)))

(declare-fun b!902767 () Bool)

(assert (=> b!902767 (= e!505543 e!505554)))

(declare-fun c!95844 () Bool)

(assert (=> b!902767 (= c!95844 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!902768 () Bool)

(assert (=> b!902768 (= e!505555 call!40257)))

(declare-fun bm!40257 () Bool)

(declare-fun call!40259 () ListLongMap!10699)

(assert (=> bm!40257 (= call!40259 call!40258)))

(declare-fun b!902769 () Bool)

(assert (=> b!902769 (= e!505545 call!40259)))

(declare-fun b!902770 () Bool)

(declare-fun res!609136 () Bool)

(assert (=> b!902770 (=> (not res!609136) (not e!505543))))

(assert (=> b!902770 (= res!609136 e!505549)))

(declare-fun c!95848 () Bool)

(assert (=> b!902770 (= c!95848 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!902771 () Bool)

(assert (=> b!902771 (= e!505546 (= (apply!418 lt!408034 (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000)) (get!13392 (select (arr!25421 (_values!5495 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1333 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!902771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25881 (_values!5495 thiss!1181))))))

(assert (=> b!902771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25880 (_keys!10317 thiss!1181))))))

(declare-fun b!902772 () Bool)

(assert (=> b!902772 (= e!505549 e!505553)))

(declare-fun res!609137 () Bool)

(assert (=> b!902772 (= res!609137 call!40255)))

(assert (=> b!902772 (=> (not res!609137) (not e!505553))))

(declare-fun b!902773 () Bool)

(declare-fun e!505548 () Bool)

(assert (=> b!902773 (= e!505548 (validKeyInArray!0 (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!902774 () Bool)

(assert (=> b!902774 (= e!505555 call!40259)))

(declare-fun bm!40258 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3332 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 32) Int) ListLongMap!10699)

(assert (=> bm!40258 (= call!40256 (getCurrentListMapNoExtraKeys!3332 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun b!902775 () Bool)

(declare-fun res!609132 () Bool)

(assert (=> b!902775 (=> (not res!609132) (not e!505543))))

(assert (=> b!902775 (= res!609132 e!505544)))

(declare-fun res!609139 () Bool)

(assert (=> b!902775 (=> res!609139 e!505544)))

(assert (=> b!902775 (= res!609139 (not e!505548))))

(declare-fun res!609140 () Bool)

(assert (=> b!902775 (=> (not res!609140) (not e!505548))))

(assert (=> b!902775 (= res!609140 (bvslt #b00000000000000000000000000000000 (size!25880 (_keys!10317 thiss!1181))))))

(declare-fun b!902776 () Bool)

(declare-fun Unit!30626 () Unit!30622)

(assert (=> b!902776 (= e!505551 Unit!30626)))

(declare-fun b!902777 () Bool)

(declare-fun lt!408021 () Unit!30622)

(assert (=> b!902777 (= e!505551 lt!408021)))

(declare-fun lt!408016 () ListLongMap!10699)

(assert (=> b!902777 (= lt!408016 (getCurrentListMapNoExtraKeys!3332 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!408031 () (_ BitVec 64))

(assert (=> b!902777 (= lt!408031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!408025 () (_ BitVec 64))

(assert (=> b!902777 (= lt!408025 (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!408027 () Unit!30622)

(declare-fun addStillContains!342 (ListLongMap!10699 (_ BitVec 64) V!29511 (_ BitVec 64)) Unit!30622)

(assert (=> b!902777 (= lt!408027 (addStillContains!342 lt!408016 lt!408031 (zeroValue!5308 thiss!1181) lt!408025))))

(assert (=> b!902777 (contains!4417 (+!2611 lt!408016 (tuple2!12001 lt!408031 (zeroValue!5308 thiss!1181))) lt!408025)))

(declare-fun lt!408015 () Unit!30622)

(assert (=> b!902777 (= lt!408015 lt!408027)))

(declare-fun lt!408017 () ListLongMap!10699)

(assert (=> b!902777 (= lt!408017 (getCurrentListMapNoExtraKeys!3332 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!408026 () (_ BitVec 64))

(assert (=> b!902777 (= lt!408026 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!408032 () (_ BitVec 64))

(assert (=> b!902777 (= lt!408032 (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!408018 () Unit!30622)

(declare-fun addApplyDifferent!342 (ListLongMap!10699 (_ BitVec 64) V!29511 (_ BitVec 64)) Unit!30622)

(assert (=> b!902777 (= lt!408018 (addApplyDifferent!342 lt!408017 lt!408026 (minValue!5308 thiss!1181) lt!408032))))

(assert (=> b!902777 (= (apply!418 (+!2611 lt!408017 (tuple2!12001 lt!408026 (minValue!5308 thiss!1181))) lt!408032) (apply!418 lt!408017 lt!408032))))

(declare-fun lt!408023 () Unit!30622)

(assert (=> b!902777 (= lt!408023 lt!408018)))

(declare-fun lt!408030 () ListLongMap!10699)

(assert (=> b!902777 (= lt!408030 (getCurrentListMapNoExtraKeys!3332 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!408022 () (_ BitVec 64))

(assert (=> b!902777 (= lt!408022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!408036 () (_ BitVec 64))

(assert (=> b!902777 (= lt!408036 (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!408019 () Unit!30622)

(assert (=> b!902777 (= lt!408019 (addApplyDifferent!342 lt!408030 lt!408022 (zeroValue!5308 thiss!1181) lt!408036))))

(assert (=> b!902777 (= (apply!418 (+!2611 lt!408030 (tuple2!12001 lt!408022 (zeroValue!5308 thiss!1181))) lt!408036) (apply!418 lt!408030 lt!408036))))

(declare-fun lt!408024 () Unit!30622)

(assert (=> b!902777 (= lt!408024 lt!408019)))

(declare-fun lt!408035 () ListLongMap!10699)

(assert (=> b!902777 (= lt!408035 (getCurrentListMapNoExtraKeys!3332 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!408028 () (_ BitVec 64))

(assert (=> b!902777 (= lt!408028 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!408033 () (_ BitVec 64))

(assert (=> b!902777 (= lt!408033 (select (arr!25420 (_keys!10317 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902777 (= lt!408021 (addApplyDifferent!342 lt!408035 lt!408028 (minValue!5308 thiss!1181) lt!408033))))

(assert (=> b!902777 (= (apply!418 (+!2611 lt!408035 (tuple2!12001 lt!408028 (minValue!5308 thiss!1181))) lt!408033) (apply!418 lt!408035 lt!408033))))

(assert (= (and d!112191 c!95846) b!902764))

(assert (= (and d!112191 (not c!95846)) b!902763))

(assert (= (and b!902763 c!95847) b!902769))

(assert (= (and b!902763 (not c!95847)) b!902766))

(assert (= (and b!902766 c!95849) b!902774))

(assert (= (and b!902766 (not c!95849)) b!902768))

(assert (= (or b!902774 b!902768) bm!40255))

(assert (= (or b!902769 bm!40255) bm!40253))

(assert (= (or b!902769 b!902774) bm!40257))

(assert (= (or b!902764 bm!40253) bm!40258))

(assert (= (or b!902764 bm!40257) bm!40256))

(assert (= (and d!112191 res!609133) b!902757))

(assert (= (and d!112191 c!95845) b!902777))

(assert (= (and d!112191 (not c!95845)) b!902776))

(assert (= (and d!112191 res!609138) b!902775))

(assert (= (and b!902775 res!609140) b!902773))

(assert (= (and b!902775 (not res!609139)) b!902760))

(assert (= (and b!902760 res!609135) b!902771))

(assert (= (and b!902775 res!609132) b!902770))

(assert (= (and b!902770 c!95848) b!902772))

(assert (= (and b!902770 (not c!95848)) b!902758))

(assert (= (and b!902772 res!609137) b!902759))

(assert (= (or b!902772 b!902758) bm!40252))

(assert (= (and b!902770 res!609136) b!902767))

(assert (= (and b!902767 c!95844) b!902762))

(assert (= (and b!902767 (not c!95844)) b!902761))

(assert (= (and b!902762 res!609134) b!902765))

(assert (= (or b!902762 b!902761) bm!40254))

(declare-fun b_lambda!13087 () Bool)

(assert (=> (not b_lambda!13087) (not b!902771)))

(assert (=> b!902771 t!25190))

(declare-fun b_and!26455 () Bool)

(assert (= b_and!26453 (and (=> t!25190 result!10215) b_and!26455)))

(declare-fun m!839315 () Bool)

(assert (=> bm!40258 m!839315))

(declare-fun m!839317 () Bool)

(assert (=> b!902777 m!839317))

(declare-fun m!839319 () Bool)

(assert (=> b!902777 m!839319))

(assert (=> b!902777 m!839311))

(declare-fun m!839321 () Bool)

(assert (=> b!902777 m!839321))

(declare-fun m!839323 () Bool)

(assert (=> b!902777 m!839323))

(declare-fun m!839325 () Bool)

(assert (=> b!902777 m!839325))

(declare-fun m!839327 () Bool)

(assert (=> b!902777 m!839327))

(declare-fun m!839329 () Bool)

(assert (=> b!902777 m!839329))

(declare-fun m!839331 () Bool)

(assert (=> b!902777 m!839331))

(assert (=> b!902777 m!839315))

(assert (=> b!902777 m!839329))

(assert (=> b!902777 m!839321))

(declare-fun m!839333 () Bool)

(assert (=> b!902777 m!839333))

(declare-fun m!839335 () Bool)

(assert (=> b!902777 m!839335))

(declare-fun m!839337 () Bool)

(assert (=> b!902777 m!839337))

(declare-fun m!839339 () Bool)

(assert (=> b!902777 m!839339))

(declare-fun m!839341 () Bool)

(assert (=> b!902777 m!839341))

(assert (=> b!902777 m!839325))

(declare-fun m!839343 () Bool)

(assert (=> b!902777 m!839343))

(assert (=> b!902777 m!839339))

(declare-fun m!839345 () Bool)

(assert (=> b!902777 m!839345))

(assert (=> b!902757 m!839311))

(assert (=> b!902757 m!839311))

(declare-fun m!839347 () Bool)

(assert (=> b!902757 m!839347))

(assert (=> b!902773 m!839311))

(assert (=> b!902773 m!839311))

(assert (=> b!902773 m!839347))

(declare-fun m!839349 () Bool)

(assert (=> b!902765 m!839349))

(declare-fun m!839351 () Bool)

(assert (=> bm!40256 m!839351))

(declare-fun m!839353 () Bool)

(assert (=> b!902764 m!839353))

(declare-fun m!839355 () Bool)

(assert (=> b!902759 m!839355))

(assert (=> d!112191 m!839307))

(declare-fun m!839357 () Bool)

(assert (=> bm!40254 m!839357))

(declare-fun m!839359 () Bool)

(assert (=> b!902771 m!839359))

(assert (=> b!902771 m!839167))

(declare-fun m!839361 () Bool)

(assert (=> b!902771 m!839361))

(assert (=> b!902771 m!839311))

(assert (=> b!902771 m!839311))

(declare-fun m!839363 () Bool)

(assert (=> b!902771 m!839363))

(assert (=> b!902771 m!839167))

(assert (=> b!902771 m!839359))

(declare-fun m!839365 () Bool)

(assert (=> bm!40252 m!839365))

(assert (=> b!902760 m!839311))

(assert (=> b!902760 m!839311))

(declare-fun m!839367 () Bool)

(assert (=> b!902760 m!839367))

(assert (=> b!902565 d!112191))

(declare-fun b!902798 () Bool)

(declare-fun e!505568 () Bool)

(assert (=> b!902798 (= e!505568 false)))

(declare-fun c!95861 () Bool)

(declare-fun call!40269 () Bool)

(assert (=> b!902798 (= c!95861 call!40269)))

(declare-fun lt!408076 () Unit!30622)

(declare-fun e!505569 () Unit!30622)

(assert (=> b!902798 (= lt!408076 e!505569)))

(declare-fun b!902799 () Bool)

(declare-fun e!505566 () Bool)

(assert (=> b!902799 (= e!505566 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!902800 () Bool)

(assert (=> b!902800 false))

(declare-fun lt!408075 () Unit!30622)

(declare-fun lt!408078 () Unit!30622)

(assert (=> b!902800 (= lt!408075 lt!408078)))

(declare-fun lt!408074 () SeekEntryResult!8908)

(declare-fun lt!408069 () (_ BitVec 32))

(assert (=> b!902800 (and ((_ is Found!8908) lt!408074) (= (index!38004 lt!408074) lt!408069))))

(assert (=> b!902800 (= lt!408074 (seekEntry!0 key!785 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52915 (_ BitVec 32)) Unit!30622)

(assert (=> b!902800 (= lt!408078 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!408069 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)))))

(declare-fun lt!408077 () Unit!30622)

(declare-fun lt!408080 () Unit!30622)

(assert (=> b!902800 (= lt!408077 lt!408080)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52915 (_ BitVec 32)) Bool)

(assert (=> b!902800 (arrayForallSeekEntryOrOpenFound!0 lt!408069 (_keys!10317 thiss!1181) (mask!26332 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30622)

(assert (=> b!902800 (= lt!408080 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10317 thiss!1181) (mask!26332 thiss!1181) #b00000000000000000000000000000000 lt!408069))))

(declare-fun arrayScanForKey!0 (array!52915 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!902800 (= lt!408069 (arrayScanForKey!0 (_keys!10317 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!408070 () Unit!30622)

(declare-fun lt!408081 () Unit!30622)

(assert (=> b!902800 (= lt!408070 lt!408081)))

(declare-fun e!505567 () Bool)

(assert (=> b!902800 e!505567))

(declare-fun c!95860 () Bool)

(assert (=> b!902800 (= c!95860 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!168 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64) Int) Unit!30622)

(assert (=> b!902800 (= lt!408081 (lemmaKeyInListMapIsInArray!168 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785 (defaultEntry!5474 thiss!1181)))))

(declare-fun Unit!30627 () Unit!30622)

(assert (=> b!902800 (= e!505569 Unit!30627)))

(declare-fun b!902801 () Bool)

(assert (=> b!902801 (= e!505567 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!902802 () Bool)

(declare-fun c!95864 () Bool)

(declare-fun lt!408072 () SeekEntryResult!8908)

(assert (=> b!902802 (= c!95864 ((_ is Found!8908) lt!408072))))

(assert (=> b!902802 (= lt!408072 (seekEntry!0 key!785 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)))))

(assert (=> b!902802 (= e!505566 e!505568)))

(declare-fun bm!40265 () Bool)

(declare-fun call!40270 () ListLongMap!10699)

(assert (=> bm!40265 (= call!40270 (getCurrentListMap!2636 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun b!902804 () Bool)

(declare-fun e!505570 () Bool)

(assert (=> b!902804 (= e!505570 e!505566)))

(declare-fun c!95863 () Bool)

(assert (=> b!902804 (= c!95863 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902803 () Bool)

(declare-fun Unit!30628 () Unit!30622)

(assert (=> b!902803 (= e!505569 Unit!30628)))

(declare-fun d!112193 () Bool)

(declare-fun lt!408067 () Bool)

(assert (=> d!112193 (= lt!408067 (contains!4417 (map!12284 thiss!1181) key!785))))

(assert (=> d!112193 (= lt!408067 e!505570)))

(declare-fun c!95862 () Bool)

(assert (=> d!112193 (= c!95862 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112193 (valid!1725 thiss!1181)))

(assert (=> d!112193 (= (contains!4416 thiss!1181 key!785) lt!408067)))

(declare-fun b!902805 () Bool)

(assert (=> b!902805 (= e!505568 true)))

(declare-fun lt!408079 () Unit!30622)

(assert (=> b!902805 (= lt!408079 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10317 thiss!1181) key!785 (index!38004 lt!408072)))))

(declare-fun call!40268 () Bool)

(assert (=> b!902805 call!40268))

(declare-fun lt!408073 () Unit!30622)

(assert (=> b!902805 (= lt!408073 lt!408079)))

(declare-fun lt!408068 () Unit!30622)

(assert (=> b!902805 (= lt!408068 (lemmaValidKeyInArrayIsInListMap!266 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) (index!38004 lt!408072) (defaultEntry!5474 thiss!1181)))))

(assert (=> b!902805 call!40269))

(declare-fun lt!408071 () Unit!30622)

(assert (=> b!902805 (= lt!408071 lt!408068)))

(declare-fun bm!40266 () Bool)

(assert (=> bm!40266 (= call!40268 (arrayContainsKey!0 (_keys!10317 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!902806 () Bool)

(assert (=> b!902806 (= e!505570 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!902807 () Bool)

(assert (=> b!902807 (= e!505567 call!40268)))

(declare-fun bm!40267 () Bool)

(assert (=> bm!40267 (= call!40269 (contains!4417 call!40270 (ite c!95864 (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!408072)) key!785)))))

(assert (= (and d!112193 c!95862) b!902806))

(assert (= (and d!112193 (not c!95862)) b!902804))

(assert (= (and b!902804 c!95863) b!902799))

(assert (= (and b!902804 (not c!95863)) b!902802))

(assert (= (and b!902802 c!95864) b!902805))

(assert (= (and b!902802 (not c!95864)) b!902798))

(assert (= (and b!902798 c!95861) b!902800))

(assert (= (and b!902798 (not c!95861)) b!902803))

(assert (= (and b!902800 c!95860) b!902807))

(assert (= (and b!902800 (not c!95860)) b!902801))

(assert (= (or b!902805 b!902807) bm!40266))

(assert (= (or b!902805 b!902798) bm!40265))

(assert (= (or b!902805 b!902798) bm!40267))

(declare-fun m!839369 () Bool)

(assert (=> b!902800 m!839369))

(declare-fun m!839371 () Bool)

(assert (=> b!902800 m!839371))

(assert (=> b!902800 m!839205))

(declare-fun m!839373 () Bool)

(assert (=> b!902800 m!839373))

(declare-fun m!839375 () Bool)

(assert (=> b!902800 m!839375))

(declare-fun m!839377 () Bool)

(assert (=> b!902800 m!839377))

(assert (=> bm!40266 m!839185))

(declare-fun m!839379 () Bool)

(assert (=> bm!40267 m!839379))

(declare-fun m!839381 () Bool)

(assert (=> bm!40267 m!839381))

(assert (=> bm!40265 m!839179))

(assert (=> d!112193 m!839195))

(assert (=> d!112193 m!839195))

(declare-fun m!839383 () Bool)

(assert (=> d!112193 m!839383))

(assert (=> d!112193 m!839207))

(assert (=> b!902802 m!839205))

(declare-fun m!839385 () Bool)

(assert (=> b!902805 m!839385))

(declare-fun m!839387 () Bool)

(assert (=> b!902805 m!839387))

(assert (=> b!902565 d!112193))

(declare-fun d!112195 () Bool)

(assert (=> d!112195 (arrayContainsKey!0 (_keys!10317 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!408084 () Unit!30622)

(declare-fun choose!13 (array!52915 (_ BitVec 64) (_ BitVec 32)) Unit!30622)

(assert (=> d!112195 (= lt!408084 (choose!13 (_keys!10317 thiss!1181) key!785 (index!38004 lt!407923)))))

(assert (=> d!112195 (bvsge (index!38004 lt!407923) #b00000000000000000000000000000000)))

(assert (=> d!112195 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10317 thiss!1181) key!785 (index!38004 lt!407923)) lt!408084)))

(declare-fun bs!25323 () Bool)

(assert (= bs!25323 d!112195))

(assert (=> bs!25323 m!839185))

(declare-fun m!839389 () Bool)

(assert (=> bs!25323 m!839389))

(assert (=> b!902565 d!112195))

(declare-fun d!112197 () Bool)

(declare-fun e!505575 () Bool)

(assert (=> d!112197 e!505575))

(declare-fun res!609143 () Bool)

(assert (=> d!112197 (=> res!609143 e!505575)))

(declare-fun lt!408095 () Bool)

(assert (=> d!112197 (= res!609143 (not lt!408095))))

(declare-fun lt!408094 () Bool)

(assert (=> d!112197 (= lt!408095 lt!408094)))

(declare-fun lt!408096 () Unit!30622)

(declare-fun e!505576 () Unit!30622)

(assert (=> d!112197 (= lt!408096 e!505576)))

(declare-fun c!95867 () Bool)

(assert (=> d!112197 (= c!95867 lt!408094)))

(declare-fun containsKey!437 (List!17830 (_ BitVec 64)) Bool)

(assert (=> d!112197 (= lt!408094 (containsKey!437 (toList!5365 lt!407925) (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!407923))))))

(assert (=> d!112197 (= (contains!4417 lt!407925 (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!407923))) lt!408095)))

(declare-fun b!902814 () Bool)

(declare-fun lt!408093 () Unit!30622)

(assert (=> b!902814 (= e!505576 lt!408093)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!331 (List!17830 (_ BitVec 64)) Unit!30622)

(assert (=> b!902814 (= lt!408093 (lemmaContainsKeyImpliesGetValueByKeyDefined!331 (toList!5365 lt!407925) (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!407923))))))

(declare-fun isDefined!339 (Option!470) Bool)

(assert (=> b!902814 (isDefined!339 (getValueByKey!464 (toList!5365 lt!407925) (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!407923))))))

(declare-fun b!902815 () Bool)

(declare-fun Unit!30629 () Unit!30622)

(assert (=> b!902815 (= e!505576 Unit!30629)))

(declare-fun b!902816 () Bool)

(assert (=> b!902816 (= e!505575 (isDefined!339 (getValueByKey!464 (toList!5365 lt!407925) (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!407923)))))))

(assert (= (and d!112197 c!95867) b!902814))

(assert (= (and d!112197 (not c!95867)) b!902815))

(assert (= (and d!112197 (not res!609143)) b!902816))

(assert (=> d!112197 m!839181))

(declare-fun m!839391 () Bool)

(assert (=> d!112197 m!839391))

(assert (=> b!902814 m!839181))

(declare-fun m!839393 () Bool)

(assert (=> b!902814 m!839393))

(assert (=> b!902814 m!839181))

(declare-fun m!839395 () Bool)

(assert (=> b!902814 m!839395))

(assert (=> b!902814 m!839395))

(declare-fun m!839397 () Bool)

(assert (=> b!902814 m!839397))

(assert (=> b!902816 m!839181))

(assert (=> b!902816 m!839395))

(assert (=> b!902816 m!839395))

(assert (=> b!902816 m!839397))

(assert (=> b!902565 d!112197))

(declare-fun d!112199 () Bool)

(declare-fun e!505579 () Bool)

(assert (=> d!112199 e!505579))

(declare-fun res!609146 () Bool)

(assert (=> d!112199 (=> (not res!609146) (not e!505579))))

(assert (=> d!112199 (= res!609146 (and (bvsge (index!38004 lt!407923) #b00000000000000000000000000000000) (bvslt (index!38004 lt!407923) (size!25880 (_keys!10317 thiss!1181)))))))

(declare-fun lt!408099 () Unit!30622)

(declare-fun choose!1530 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 32) Int) Unit!30622)

(assert (=> d!112199 (= lt!408099 (choose!1530 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) (index!38004 lt!407923) (defaultEntry!5474 thiss!1181)))))

(assert (=> d!112199 (validMask!0 (mask!26332 thiss!1181))))

(assert (=> d!112199 (= (lemmaValidKeyInArrayIsInListMap!266 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) (index!38004 lt!407923) (defaultEntry!5474 thiss!1181)) lt!408099)))

(declare-fun b!902819 () Bool)

(assert (=> b!902819 (= e!505579 (contains!4417 (getCurrentListMap!2636 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)) (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!407923))))))

(assert (= (and d!112199 res!609146) b!902819))

(declare-fun m!839399 () Bool)

(assert (=> d!112199 m!839399))

(assert (=> d!112199 m!839307))

(assert (=> b!902819 m!839179))

(assert (=> b!902819 m!839181))

(assert (=> b!902819 m!839179))

(assert (=> b!902819 m!839181))

(declare-fun m!839401 () Bool)

(assert (=> b!902819 m!839401))

(assert (=> b!902565 d!112199))

(declare-fun d!112201 () Bool)

(declare-fun e!505582 () Bool)

(assert (=> d!112201 e!505582))

(declare-fun res!609149 () Bool)

(assert (=> d!112201 (=> res!609149 e!505582)))

(declare-fun lt!408105 () SeekEntryResult!8908)

(assert (=> d!112201 (= res!609149 (not ((_ is Found!8908) lt!408105)))))

(assert (=> d!112201 (= lt!408105 (seekEntry!0 key!785 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)))))

(declare-fun lt!408104 () Unit!30622)

(declare-fun choose!1531 (array!52915 array!52917 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64)) Unit!30622)

(assert (=> d!112201 (= lt!408104 (choose!1531 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785))))

(assert (=> d!112201 (validMask!0 (mask!26332 thiss!1181))))

(assert (=> d!112201 (= (lemmaSeekEntryGivesInRangeIndex!124 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785) lt!408104)))

(declare-fun b!902822 () Bool)

(assert (=> b!902822 (= e!505582 (inRange!0 (index!38004 lt!408105) (mask!26332 thiss!1181)))))

(assert (= (and d!112201 (not res!609149)) b!902822))

(assert (=> d!112201 m!839205))

(declare-fun m!839403 () Bool)

(assert (=> d!112201 m!839403))

(assert (=> d!112201 m!839307))

(declare-fun m!839405 () Bool)

(assert (=> b!902822 m!839405))

(assert (=> b!902576 d!112201))

(declare-fun b!902835 () Bool)

(declare-fun e!505590 () SeekEntryResult!8908)

(assert (=> b!902835 (= e!505590 Undefined!8908)))

(declare-fun b!902836 () Bool)

(declare-fun e!505591 () SeekEntryResult!8908)

(declare-fun lt!408117 () SeekEntryResult!8908)

(assert (=> b!902836 (= e!505591 (MissingZero!8908 (index!38005 lt!408117)))))

(declare-fun b!902837 () Bool)

(declare-fun c!95875 () Bool)

(declare-fun lt!408116 () (_ BitVec 64))

(assert (=> b!902837 (= c!95875 (= lt!408116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!505589 () SeekEntryResult!8908)

(assert (=> b!902837 (= e!505589 e!505591)))

(declare-fun b!902838 () Bool)

(assert (=> b!902838 (= e!505589 (Found!8908 (index!38005 lt!408117)))))

(declare-fun b!902839 () Bool)

(declare-fun lt!408115 () SeekEntryResult!8908)

(assert (=> b!902839 (= e!505591 (ite ((_ is MissingVacant!8908) lt!408115) (MissingZero!8908 (index!38006 lt!408115)) lt!408115))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52915 (_ BitVec 32)) SeekEntryResult!8908)

(assert (=> b!902839 (= lt!408115 (seekKeyOrZeroReturnVacant!0 (x!76797 lt!408117) (index!38005 lt!408117) (index!38005 lt!408117) key!785 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)))))

(declare-fun d!112203 () Bool)

(declare-fun lt!408114 () SeekEntryResult!8908)

(assert (=> d!112203 (and (or ((_ is MissingVacant!8908) lt!408114) (not ((_ is Found!8908) lt!408114)) (and (bvsge (index!38004 lt!408114) #b00000000000000000000000000000000) (bvslt (index!38004 lt!408114) (size!25880 (_keys!10317 thiss!1181))))) (not ((_ is MissingVacant!8908) lt!408114)) (or (not ((_ is Found!8908) lt!408114)) (= (select (arr!25420 (_keys!10317 thiss!1181)) (index!38004 lt!408114)) key!785)))))

(assert (=> d!112203 (= lt!408114 e!505590)))

(declare-fun c!95876 () Bool)

(assert (=> d!112203 (= c!95876 (and ((_ is Intermediate!8908) lt!408117) (undefined!9720 lt!408117)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52915 (_ BitVec 32)) SeekEntryResult!8908)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112203 (= lt!408117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26332 thiss!1181)) key!785 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)))))

(assert (=> d!112203 (validMask!0 (mask!26332 thiss!1181))))

(assert (=> d!112203 (= (seekEntry!0 key!785 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)) lt!408114)))

(declare-fun b!902840 () Bool)

(assert (=> b!902840 (= e!505590 e!505589)))

(assert (=> b!902840 (= lt!408116 (select (arr!25420 (_keys!10317 thiss!1181)) (index!38005 lt!408117)))))

(declare-fun c!95874 () Bool)

(assert (=> b!902840 (= c!95874 (= lt!408116 key!785))))

(assert (= (and d!112203 c!95876) b!902835))

(assert (= (and d!112203 (not c!95876)) b!902840))

(assert (= (and b!902840 c!95874) b!902838))

(assert (= (and b!902840 (not c!95874)) b!902837))

(assert (= (and b!902837 c!95875) b!902836))

(assert (= (and b!902837 (not c!95875)) b!902839))

(declare-fun m!839407 () Bool)

(assert (=> b!902839 m!839407))

(declare-fun m!839409 () Bool)

(assert (=> d!112203 m!839409))

(declare-fun m!839411 () Bool)

(assert (=> d!112203 m!839411))

(assert (=> d!112203 m!839411))

(declare-fun m!839413 () Bool)

(assert (=> d!112203 m!839413))

(assert (=> d!112203 m!839307))

(declare-fun m!839415 () Bool)

(assert (=> b!902840 m!839415))

(assert (=> b!902576 d!112203))

(declare-fun d!112205 () Bool)

(assert (=> d!112205 (= (apply!418 lt!407925 key!785) (get!13393 (getValueByKey!464 (toList!5365 lt!407925) key!785)))))

(declare-fun bs!25324 () Bool)

(assert (= bs!25324 d!112205))

(declare-fun m!839417 () Bool)

(assert (=> bs!25324 m!839417))

(assert (=> bs!25324 m!839417))

(declare-fun m!839419 () Bool)

(assert (=> bs!25324 m!839419))

(assert (=> bm!40212 d!112205))

(declare-fun d!112207 () Bool)

(declare-fun res!609156 () Bool)

(declare-fun e!505594 () Bool)

(assert (=> d!112207 (=> (not res!609156) (not e!505594))))

(declare-fun simpleValid!334 (LongMapFixedSize!4462) Bool)

(assert (=> d!112207 (= res!609156 (simpleValid!334 thiss!1181))))

(assert (=> d!112207 (= (valid!1725 thiss!1181) e!505594)))

(declare-fun b!902847 () Bool)

(declare-fun res!609157 () Bool)

(assert (=> b!902847 (=> (not res!609157) (not e!505594))))

(declare-fun arrayCountValidKeys!0 (array!52915 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!902847 (= res!609157 (= (arrayCountValidKeys!0 (_keys!10317 thiss!1181) #b00000000000000000000000000000000 (size!25880 (_keys!10317 thiss!1181))) (_size!2286 thiss!1181)))))

(declare-fun b!902848 () Bool)

(declare-fun res!609158 () Bool)

(assert (=> b!902848 (=> (not res!609158) (not e!505594))))

(assert (=> b!902848 (= res!609158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10317 thiss!1181) (mask!26332 thiss!1181)))))

(declare-fun b!902849 () Bool)

(declare-datatypes ((List!17833 0))(
  ( (Nil!17830) (Cons!17829 (h!18981 (_ BitVec 64)) (t!25202 List!17833)) )
))
(declare-fun arrayNoDuplicates!0 (array!52915 (_ BitVec 32) List!17833) Bool)

(assert (=> b!902849 (= e!505594 (arrayNoDuplicates!0 (_keys!10317 thiss!1181) #b00000000000000000000000000000000 Nil!17830))))

(assert (= (and d!112207 res!609156) b!902847))

(assert (= (and b!902847 res!609157) b!902848))

(assert (= (and b!902848 res!609158) b!902849))

(declare-fun m!839421 () Bool)

(assert (=> d!112207 m!839421))

(declare-fun m!839423 () Bool)

(assert (=> b!902847 m!839423))

(declare-fun m!839425 () Bool)

(assert (=> b!902848 m!839425))

(declare-fun m!839427 () Bool)

(assert (=> b!902849 m!839427))

(assert (=> start!77464 d!112207))

(declare-fun d!112209 () Bool)

(assert (=> d!112209 (= (get!13393 (getValueByKey!464 (toList!5365 (map!12284 thiss!1181)) key!785)) (v!11754 (getValueByKey!464 (toList!5365 (map!12284 thiss!1181)) key!785)))))

(assert (=> b!902567 d!112209))

(declare-fun b!902859 () Bool)

(declare-fun e!505599 () Option!470)

(declare-fun e!505600 () Option!470)

(assert (=> b!902859 (= e!505599 e!505600)))

(declare-fun c!95882 () Bool)

(assert (=> b!902859 (= c!95882 (and ((_ is Cons!17826) (toList!5365 (map!12284 thiss!1181))) (not (= (_1!6011 (h!18978 (toList!5365 (map!12284 thiss!1181)))) key!785))))))

(declare-fun b!902861 () Bool)

(assert (=> b!902861 (= e!505600 None!468)))

(declare-fun b!902858 () Bool)

(assert (=> b!902858 (= e!505599 (Some!469 (_2!6011 (h!18978 (toList!5365 (map!12284 thiss!1181))))))))

(declare-fun b!902860 () Bool)

(assert (=> b!902860 (= e!505600 (getValueByKey!464 (t!25191 (toList!5365 (map!12284 thiss!1181))) key!785))))

(declare-fun d!112211 () Bool)

(declare-fun c!95881 () Bool)

(assert (=> d!112211 (= c!95881 (and ((_ is Cons!17826) (toList!5365 (map!12284 thiss!1181))) (= (_1!6011 (h!18978 (toList!5365 (map!12284 thiss!1181)))) key!785)))))

(assert (=> d!112211 (= (getValueByKey!464 (toList!5365 (map!12284 thiss!1181)) key!785) e!505599)))

(assert (= (and d!112211 c!95881) b!902858))

(assert (= (and d!112211 (not c!95881)) b!902859))

(assert (= (and b!902859 c!95882) b!902860))

(assert (= (and b!902859 (not c!95882)) b!902861))

(declare-fun m!839429 () Bool)

(assert (=> b!902860 m!839429))

(assert (=> b!902567 d!112211))

(declare-fun d!112213 () Bool)

(assert (=> d!112213 (= (map!12284 thiss!1181) (getCurrentListMap!2636 (_keys!10317 thiss!1181) (_values!5495 thiss!1181) (mask!26332 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun bs!25325 () Bool)

(assert (= bs!25325 d!112213))

(assert (=> bs!25325 m!839179))

(assert (=> b!902567 d!112213))

(declare-fun d!112215 () Bool)

(assert (=> d!112215 (= (inRange!0 (index!38004 lt!407923) (mask!26332 thiss!1181)) (and (bvsge (index!38004 lt!407923) #b00000000000000000000000000000000) (bvslt (index!38004 lt!407923) (bvadd (mask!26332 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!902577 d!112215))

(declare-fun mapNonEmpty!29311 () Bool)

(declare-fun mapRes!29311 () Bool)

(declare-fun tp!56362 () Bool)

(declare-fun e!505605 () Bool)

(assert (=> mapNonEmpty!29311 (= mapRes!29311 (and tp!56362 e!505605))))

(declare-fun mapValue!29311 () ValueCell!8723)

(declare-fun mapRest!29311 () (Array (_ BitVec 32) ValueCell!8723))

(declare-fun mapKey!29311 () (_ BitVec 32))

(assert (=> mapNonEmpty!29311 (= mapRest!29302 (store mapRest!29311 mapKey!29311 mapValue!29311))))

(declare-fun b!902868 () Bool)

(assert (=> b!902868 (= e!505605 tp_is_empty!18409)))

(declare-fun b!902869 () Bool)

(declare-fun e!505606 () Bool)

(assert (=> b!902869 (= e!505606 tp_is_empty!18409)))

(declare-fun condMapEmpty!29311 () Bool)

(declare-fun mapDefault!29311 () ValueCell!8723)

(assert (=> mapNonEmpty!29302 (= condMapEmpty!29311 (= mapRest!29302 ((as const (Array (_ BitVec 32) ValueCell!8723)) mapDefault!29311)))))

(assert (=> mapNonEmpty!29302 (= tp!56347 (and e!505606 mapRes!29311))))

(declare-fun mapIsEmpty!29311 () Bool)

(assert (=> mapIsEmpty!29311 mapRes!29311))

(assert (= (and mapNonEmpty!29302 condMapEmpty!29311) mapIsEmpty!29311))

(assert (= (and mapNonEmpty!29302 (not condMapEmpty!29311)) mapNonEmpty!29311))

(assert (= (and mapNonEmpty!29311 ((_ is ValueCellFull!8723) mapValue!29311)) b!902868))

(assert (= (and mapNonEmpty!29302 ((_ is ValueCellFull!8723) mapDefault!29311)) b!902869))

(declare-fun m!839431 () Bool)

(assert (=> mapNonEmpty!29311 m!839431))

(declare-fun b_lambda!13089 () Bool)

(assert (= b_lambda!13085 (or (and b!902574 b_free!16081) b_lambda!13089)))

(declare-fun b_lambda!13091 () Bool)

(assert (= b_lambda!13087 (or (and b!902574 b_free!16081) b_lambda!13091)))

(check-sat (not b!902822) (not d!112207) (not d!112201) (not b!902764) (not b!902765) (not bm!40256) (not d!112197) (not b!902847) (not b!902708) (not d!112199) (not b!902814) (not bm!40235) (not d!112195) (not b!902686) (not d!112187) (not b_lambda!13081) (not bm!40237) (not b!902760) tp_is_empty!18409 (not b!902759) (not bm!40265) (not d!112213) (not bm!40252) (not d!112203) (not b_lambda!13083) (not b!902705) (not bm!40266) (not mapNonEmpty!29311) (not b!902816) (not b!902714) (not b!902805) (not b!902771) (not b!902839) (not bm!40267) (not b!902773) (not b!902860) (not d!112191) (not b!902848) (not b!902849) (not b!902687) (not bm!40258) (not b!902757) (not b!902802) (not b!902777) (not b_lambda!13091) (not b!902800) (not b!902819) (not b_lambda!13089) (not bm!40254) b_and!26455 (not d!112193) (not b_next!16081) (not d!112205) (not b_lambda!13079))
(check-sat b_and!26455 (not b_next!16081))
