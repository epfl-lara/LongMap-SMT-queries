; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77278 () Bool)

(assert start!77278)

(declare-fun b!901435 () Bool)

(declare-fun b_free!16081 () Bool)

(declare-fun b_next!16081 () Bool)

(assert (=> b!901435 (= b_free!16081 (not b_next!16081))))

(declare-fun tp!56346 () Bool)

(declare-fun b_and!26393 () Bool)

(assert (=> b!901435 (= tp!56346 b_and!26393)))

(declare-fun b!901422 () Bool)

(declare-fun res!608603 () Bool)

(declare-fun e!504682 () Bool)

(assert (=> b!901422 (=> (not res!608603) (not e!504682))))

(declare-datatypes ((array!52859 0))(
  ( (array!52860 (arr!25397 (Array (_ BitVec 32) (_ BitVec 64))) (size!25858 (_ BitVec 32))) )
))
(declare-datatypes ((V!29511 0))(
  ( (V!29512 (val!9255 Int)) )
))
(declare-datatypes ((ValueCell!8723 0))(
  ( (ValueCellFull!8723 (v!11753 V!29511)) (EmptyCell!8723) )
))
(declare-datatypes ((array!52861 0))(
  ( (array!52862 (arr!25398 (Array (_ BitVec 32) ValueCell!8723)) (size!25859 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4462 0))(
  ( (LongMapFixedSize!4463 (defaultEntry!5474 Int) (mask!26282 (_ BitVec 32)) (extraKeys!5204 (_ BitVec 32)) (zeroValue!5308 V!29511) (minValue!5308 V!29511) (_size!2286 (_ BitVec 32)) (_keys!10284 array!52859) (_values!5495 array!52861) (_vacant!2286 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4462)

(assert (=> b!901422 (= res!608603 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!504674 () Bool)

(assert (=> b!901422 (= e!504674 e!504682)))

(declare-fun bm!40141 () Bool)

(declare-fun call!40145 () V!29511)

(declare-datatypes ((tuple2!12100 0))(
  ( (tuple2!12101 (_1!6061 (_ BitVec 64)) (_2!6061 V!29511)) )
))
(declare-datatypes ((List!17888 0))(
  ( (Nil!17885) (Cons!17884 (h!19030 tuple2!12100) (t!25248 List!17888)) )
))
(declare-datatypes ((ListLongMap!10787 0))(
  ( (ListLongMap!10788 (toList!5409 List!17888)) )
))
(declare-fun lt!407323 () ListLongMap!10787)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun apply!416 (ListLongMap!10787 (_ BitVec 64)) V!29511)

(assert (=> bm!40141 (= call!40145 (apply!416 lt!407323 key!785))))

(declare-fun b!901424 () Bool)

(declare-fun e!504680 () Bool)

(declare-fun lt!407328 () V!29511)

(declare-fun dynLambda!1311 (Int (_ BitVec 64)) V!29511)

(assert (=> b!901424 (= e!504680 (= lt!407328 (dynLambda!1311 (defaultEntry!5474 thiss!1181) key!785)))))

(declare-fun b!901425 () Bool)

(declare-fun e!504677 () Bool)

(declare-fun e!504675 () Bool)

(assert (=> b!901425 (= e!504677 (not e!504675))))

(declare-fun res!608604 () Bool)

(assert (=> b!901425 (=> res!608604 e!504675)))

(declare-datatypes ((SeekEntryResult!8953 0))(
  ( (MissingZero!8953 (index!38183 (_ BitVec 32))) (Found!8953 (index!38184 (_ BitVec 32))) (Intermediate!8953 (undefined!9765 Bool) (index!38185 (_ BitVec 32)) (x!76823 (_ BitVec 32))) (Undefined!8953) (MissingVacant!8953 (index!38186 (_ BitVec 32))) )
))
(declare-fun lt!407324 () SeekEntryResult!8953)

(get-info :version)

(assert (=> b!901425 (= res!608604 (not ((_ is Found!8953) lt!407324)))))

(declare-fun e!504673 () Bool)

(assert (=> b!901425 e!504673))

(declare-fun res!608606 () Bool)

(assert (=> b!901425 (=> res!608606 e!504673)))

(assert (=> b!901425 (= res!608606 (not ((_ is Found!8953) lt!407324)))))

(declare-datatypes ((Unit!30562 0))(
  ( (Unit!30563) )
))
(declare-fun lt!407327 () Unit!30562)

(declare-fun lemmaSeekEntryGivesInRangeIndex!113 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64)) Unit!30562)

(assert (=> b!901425 (= lt!407327 (lemmaSeekEntryGivesInRangeIndex!113 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52859 (_ BitVec 32)) SeekEntryResult!8953)

(assert (=> b!901425 (= lt!407324 (seekEntry!0 key!785 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)))))

(declare-fun b!901426 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901426 (= e!504673 (inRange!0 (index!38184 lt!407324) (mask!26282 thiss!1181)))))

(declare-fun b!901427 () Bool)

(declare-fun e!504679 () Bool)

(assert (=> b!901427 (= e!504679 (= call!40145 (zeroValue!5308 thiss!1181)))))

(declare-fun b!901428 () Bool)

(declare-fun call!40144 () V!29511)

(assert (=> b!901428 (= e!504682 (= call!40144 (minValue!5308 thiss!1181)))))

(declare-fun mapIsEmpty!29302 () Bool)

(declare-fun mapRes!29302 () Bool)

(assert (=> mapIsEmpty!29302 mapRes!29302))

(declare-fun b!901429 () Bool)

(assert (=> b!901429 (= e!504675 e!504680)))

(declare-fun c!95456 () Bool)

(declare-fun contains!4415 (LongMapFixedSize!4462 (_ BitVec 64)) Bool)

(assert (=> b!901429 (= c!95456 (contains!4415 thiss!1181 key!785))))

(declare-fun get!13369 (ValueCell!8723 V!29511) V!29511)

(assert (=> b!901429 (= lt!407328 (get!13369 (select (arr!25398 (_values!5495 thiss!1181)) (index!38184 lt!407324)) (dynLambda!1311 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!504676 () Bool)

(assert (=> b!901429 e!504676))

(declare-fun c!95457 () Bool)

(assert (=> b!901429 (= c!95457 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407322 () Unit!30562)

(declare-fun lemmaKeyInListMapThenSameValueInArray!12 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64) (_ BitVec 32) Int) Unit!30562)

(assert (=> b!901429 (= lt!407322 (lemmaKeyInListMapThenSameValueInArray!12 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785 (index!38184 lt!407324) (defaultEntry!5474 thiss!1181)))))

(declare-fun contains!4416 (ListLongMap!10787 (_ BitVec 64)) Bool)

(assert (=> b!901429 (contains!4416 lt!407323 (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407324)))))

(declare-fun getCurrentListMap!2627 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 32) Int) ListLongMap!10787)

(assert (=> b!901429 (= lt!407323 (getCurrentListMap!2627 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!407326 () Unit!30562)

(declare-fun lemmaValidKeyInArrayIsInListMap!263 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 32) Int) Unit!30562)

(assert (=> b!901429 (= lt!407326 (lemmaValidKeyInArrayIsInListMap!263 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) (index!38184 lt!407324) (defaultEntry!5474 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901429 (arrayContainsKey!0 (_keys!10284 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407325 () Unit!30562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52859 (_ BitVec 64) (_ BitVec 32)) Unit!30562)

(assert (=> b!901429 (= lt!407325 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10284 thiss!1181) key!785 (index!38184 lt!407324)))))

(declare-fun b!901423 () Bool)

(declare-fun res!608607 () Bool)

(assert (=> b!901423 (=> (not res!608607) (not e!504677))))

(assert (=> b!901423 (= res!608607 (not (= key!785 (bvneg key!785))))))

(declare-fun res!608605 () Bool)

(assert (=> start!77278 (=> (not res!608605) (not e!504677))))

(declare-fun valid!1720 (LongMapFixedSize!4462) Bool)

(assert (=> start!77278 (= res!608605 (valid!1720 thiss!1181))))

(assert (=> start!77278 e!504677))

(declare-fun e!504678 () Bool)

(assert (=> start!77278 e!504678))

(assert (=> start!77278 true))

(declare-fun b!901430 () Bool)

(declare-fun e!504672 () Bool)

(declare-fun e!504684 () Bool)

(assert (=> b!901430 (= e!504672 (and e!504684 mapRes!29302))))

(declare-fun condMapEmpty!29302 () Bool)

(declare-fun mapDefault!29302 () ValueCell!8723)

(assert (=> b!901430 (= condMapEmpty!29302 (= (arr!25398 (_values!5495 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8723)) mapDefault!29302)))))

(declare-fun b!901431 () Bool)

(assert (=> b!901431 (= e!504676 e!504674)))

(declare-fun c!95455 () Bool)

(assert (=> b!901431 (= c!95455 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901432 () Bool)

(assert (=> b!901432 (= e!504676 e!504679)))

(declare-fun res!608608 () Bool)

(assert (=> b!901432 (= res!608608 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901432 (=> (not res!608608) (not e!504679))))

(declare-fun b!901433 () Bool)

(declare-fun e!504681 () Bool)

(declare-fun tp_is_empty!18409 () Bool)

(assert (=> b!901433 (= e!504681 tp_is_empty!18409)))

(declare-fun b!901434 () Bool)

(assert (=> b!901434 (= e!504684 tp_is_empty!18409)))

(declare-fun array_inv!19974 (array!52859) Bool)

(declare-fun array_inv!19975 (array!52861) Bool)

(assert (=> b!901435 (= e!504678 (and tp!56346 tp_is_empty!18409 (array_inv!19974 (_keys!10284 thiss!1181)) (array_inv!19975 (_values!5495 thiss!1181)) e!504672))))

(declare-fun bm!40142 () Bool)

(assert (=> bm!40142 (= call!40144 call!40145)))

(declare-fun b!901436 () Bool)

(assert (=> b!901436 (= e!504674 (= call!40144 (get!13369 (select (arr!25398 (_values!5495 thiss!1181)) (index!38184 lt!407324)) (dynLambda!1311 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!901437 () Bool)

(declare-datatypes ((Option!473 0))(
  ( (Some!472 (v!11754 V!29511)) (None!471) )
))
(declare-fun get!13370 (Option!473) V!29511)

(declare-fun getValueByKey!467 (List!17888 (_ BitVec 64)) Option!473)

(declare-fun map!12282 (LongMapFixedSize!4462) ListLongMap!10787)

(assert (=> b!901437 (= e!504680 (= lt!407328 (get!13370 (getValueByKey!467 (toList!5409 (map!12282 thiss!1181)) key!785))))))

(declare-fun mapNonEmpty!29302 () Bool)

(declare-fun tp!56347 () Bool)

(assert (=> mapNonEmpty!29302 (= mapRes!29302 (and tp!56347 e!504681))))

(declare-fun mapKey!29302 () (_ BitVec 32))

(declare-fun mapValue!29302 () ValueCell!8723)

(declare-fun mapRest!29302 () (Array (_ BitVec 32) ValueCell!8723))

(assert (=> mapNonEmpty!29302 (= (arr!25398 (_values!5495 thiss!1181)) (store mapRest!29302 mapKey!29302 mapValue!29302))))

(assert (= (and start!77278 res!608605) b!901423))

(assert (= (and b!901423 res!608607) b!901425))

(assert (= (and b!901425 (not res!608606)) b!901426))

(assert (= (and b!901425 (not res!608604)) b!901429))

(assert (= (and b!901429 c!95457) b!901432))

(assert (= (and b!901429 (not c!95457)) b!901431))

(assert (= (and b!901432 res!608608) b!901427))

(assert (= (and b!901431 c!95455) b!901422))

(assert (= (and b!901431 (not c!95455)) b!901436))

(assert (= (and b!901422 res!608603) b!901428))

(assert (= (or b!901428 b!901436) bm!40142))

(assert (= (or b!901427 bm!40142) bm!40141))

(assert (= (and b!901429 c!95456) b!901437))

(assert (= (and b!901429 (not c!95456)) b!901424))

(assert (= (and b!901430 condMapEmpty!29302) mapIsEmpty!29302))

(assert (= (and b!901430 (not condMapEmpty!29302)) mapNonEmpty!29302))

(assert (= (and mapNonEmpty!29302 ((_ is ValueCellFull!8723) mapValue!29302)) b!901433))

(assert (= (and b!901430 ((_ is ValueCellFull!8723) mapDefault!29302)) b!901434))

(assert (= b!901435 b!901430))

(assert (= start!77278 b!901435))

(declare-fun b_lambda!13029 () Bool)

(assert (=> (not b_lambda!13029) (not b!901424)))

(declare-fun t!25245 () Bool)

(declare-fun tb!5209 () Bool)

(assert (=> (and b!901435 (= (defaultEntry!5474 thiss!1181) (defaultEntry!5474 thiss!1181)) t!25245) tb!5209))

(declare-fun result!10211 () Bool)

(assert (=> tb!5209 (= result!10211 tp_is_empty!18409)))

(assert (=> b!901424 t!25245))

(declare-fun b_and!26395 () Bool)

(assert (= b_and!26393 (and (=> t!25245 result!10211) b_and!26395)))

(declare-fun b_lambda!13031 () Bool)

(assert (=> (not b_lambda!13031) (not b!901429)))

(declare-fun t!25247 () Bool)

(declare-fun tb!5211 () Bool)

(assert (=> (and b!901435 (= (defaultEntry!5474 thiss!1181) (defaultEntry!5474 thiss!1181)) t!25247) tb!5211))

(declare-fun result!10215 () Bool)

(assert (=> tb!5211 (= result!10215 tp_is_empty!18409)))

(assert (=> b!901429 t!25247))

(declare-fun b_and!26397 () Bool)

(assert (= b_and!26395 (and (=> t!25247 result!10215) b_and!26397)))

(declare-fun b_lambda!13033 () Bool)

(assert (=> (not b_lambda!13033) (not b!901436)))

(assert (=> b!901436 t!25247))

(declare-fun b_and!26399 () Bool)

(assert (= b_and!26397 (and (=> t!25247 result!10215) b_and!26399)))

(declare-fun m!837111 () Bool)

(assert (=> mapNonEmpty!29302 m!837111))

(declare-fun m!837113 () Bool)

(assert (=> b!901424 m!837113))

(declare-fun m!837115 () Bool)

(assert (=> b!901436 m!837115))

(declare-fun m!837117 () Bool)

(assert (=> b!901436 m!837117))

(assert (=> b!901436 m!837115))

(assert (=> b!901436 m!837117))

(declare-fun m!837119 () Bool)

(assert (=> b!901436 m!837119))

(declare-fun m!837121 () Bool)

(assert (=> b!901437 m!837121))

(declare-fun m!837123 () Bool)

(assert (=> b!901437 m!837123))

(assert (=> b!901437 m!837123))

(declare-fun m!837125 () Bool)

(assert (=> b!901437 m!837125))

(declare-fun m!837127 () Bool)

(assert (=> start!77278 m!837127))

(declare-fun m!837129 () Bool)

(assert (=> bm!40141 m!837129))

(declare-fun m!837131 () Bool)

(assert (=> b!901425 m!837131))

(declare-fun m!837133 () Bool)

(assert (=> b!901425 m!837133))

(declare-fun m!837135 () Bool)

(assert (=> b!901435 m!837135))

(declare-fun m!837137 () Bool)

(assert (=> b!901435 m!837137))

(assert (=> b!901429 m!837117))

(declare-fun m!837139 () Bool)

(assert (=> b!901429 m!837139))

(declare-fun m!837141 () Bool)

(assert (=> b!901429 m!837141))

(declare-fun m!837143 () Bool)

(assert (=> b!901429 m!837143))

(declare-fun m!837145 () Bool)

(assert (=> b!901429 m!837145))

(declare-fun m!837147 () Bool)

(assert (=> b!901429 m!837147))

(declare-fun m!837149 () Bool)

(assert (=> b!901429 m!837149))

(assert (=> b!901429 m!837143))

(declare-fun m!837151 () Bool)

(assert (=> b!901429 m!837151))

(declare-fun m!837153 () Bool)

(assert (=> b!901429 m!837153))

(assert (=> b!901429 m!837115))

(assert (=> b!901429 m!837117))

(assert (=> b!901429 m!837119))

(assert (=> b!901429 m!837115))

(declare-fun m!837155 () Bool)

(assert (=> b!901426 m!837155))

(check-sat (not b_lambda!13031) (not mapNonEmpty!29302) (not b!901426) (not b!901435) tp_is_empty!18409 (not b_lambda!13029) (not b!901425) (not b_lambda!13033) (not b!901436) (not bm!40141) (not b!901437) (not b_next!16081) (not b!901429) (not start!77278) b_and!26399)
(check-sat b_and!26399 (not b_next!16081))
(get-model)

(declare-fun b_lambda!13047 () Bool)

(assert (= b_lambda!13029 (or (and b!901435 b_free!16081) b_lambda!13047)))

(declare-fun b_lambda!13049 () Bool)

(assert (= b_lambda!13033 (or (and b!901435 b_free!16081) b_lambda!13049)))

(declare-fun b_lambda!13051 () Bool)

(assert (= b_lambda!13031 (or (and b!901435 b_free!16081) b_lambda!13051)))

(check-sat (not mapNonEmpty!29302) (not b!901426) (not b!901435) (not b_lambda!13047) tp_is_empty!18409 (not b!901425) (not bm!40141) (not b_next!16081) (not b!901429) (not b_lambda!13051) (not b!901436) (not start!77278) b_and!26399 (not b!901437) (not b_lambda!13049))
(check-sat b_and!26399 (not b_next!16081))
(get-model)

(declare-fun d!111661 () Bool)

(declare-fun c!95478 () Bool)

(assert (=> d!111661 (= c!95478 ((_ is ValueCellFull!8723) (select (arr!25398 (_values!5495 thiss!1181)) (index!38184 lt!407324))))))

(declare-fun e!504765 () V!29511)

(assert (=> d!111661 (= (get!13369 (select (arr!25398 (_values!5495 thiss!1181)) (index!38184 lt!407324)) (dynLambda!1311 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!504765)))

(declare-fun b!901544 () Bool)

(declare-fun get!13375 (ValueCell!8723 V!29511) V!29511)

(assert (=> b!901544 (= e!504765 (get!13375 (select (arr!25398 (_values!5495 thiss!1181)) (index!38184 lt!407324)) (dynLambda!1311 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!901545 () Bool)

(declare-fun get!13376 (ValueCell!8723 V!29511) V!29511)

(assert (=> b!901545 (= e!504765 (get!13376 (select (arr!25398 (_values!5495 thiss!1181)) (index!38184 lt!407324)) (dynLambda!1311 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111661 c!95478) b!901544))

(assert (= (and d!111661 (not c!95478)) b!901545))

(assert (=> b!901544 m!837115))

(assert (=> b!901544 m!837117))

(declare-fun m!837249 () Bool)

(assert (=> b!901544 m!837249))

(assert (=> b!901545 m!837115))

(assert (=> b!901545 m!837117))

(declare-fun m!837251 () Bool)

(assert (=> b!901545 m!837251))

(assert (=> b!901436 d!111661))

(declare-fun d!111663 () Bool)

(assert (=> d!111663 (= (get!13370 (getValueByKey!467 (toList!5409 (map!12282 thiss!1181)) key!785)) (v!11754 (getValueByKey!467 (toList!5409 (map!12282 thiss!1181)) key!785)))))

(assert (=> b!901437 d!111663))

(declare-fun b!901556 () Bool)

(declare-fun e!504771 () Option!473)

(assert (=> b!901556 (= e!504771 (getValueByKey!467 (t!25248 (toList!5409 (map!12282 thiss!1181))) key!785))))

(declare-fun d!111665 () Bool)

(declare-fun c!95483 () Bool)

(assert (=> d!111665 (= c!95483 (and ((_ is Cons!17884) (toList!5409 (map!12282 thiss!1181))) (= (_1!6061 (h!19030 (toList!5409 (map!12282 thiss!1181)))) key!785)))))

(declare-fun e!504770 () Option!473)

(assert (=> d!111665 (= (getValueByKey!467 (toList!5409 (map!12282 thiss!1181)) key!785) e!504770)))

(declare-fun b!901554 () Bool)

(assert (=> b!901554 (= e!504770 (Some!472 (_2!6061 (h!19030 (toList!5409 (map!12282 thiss!1181))))))))

(declare-fun b!901557 () Bool)

(assert (=> b!901557 (= e!504771 None!471)))

(declare-fun b!901555 () Bool)

(assert (=> b!901555 (= e!504770 e!504771)))

(declare-fun c!95484 () Bool)

(assert (=> b!901555 (= c!95484 (and ((_ is Cons!17884) (toList!5409 (map!12282 thiss!1181))) (not (= (_1!6061 (h!19030 (toList!5409 (map!12282 thiss!1181)))) key!785))))))

(assert (= (and d!111665 c!95483) b!901554))

(assert (= (and d!111665 (not c!95483)) b!901555))

(assert (= (and b!901555 c!95484) b!901556))

(assert (= (and b!901555 (not c!95484)) b!901557))

(declare-fun m!837253 () Bool)

(assert (=> b!901556 m!837253))

(assert (=> b!901437 d!111665))

(declare-fun d!111667 () Bool)

(assert (=> d!111667 (= (map!12282 thiss!1181) (getCurrentListMap!2627 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun bs!25277 () Bool)

(assert (= bs!25277 d!111667))

(assert (=> bs!25277 m!837151))

(assert (=> b!901437 d!111667))

(declare-fun d!111669 () Bool)

(assert (=> d!111669 (= (apply!416 lt!407323 key!785) (get!13370 (getValueByKey!467 (toList!5409 lt!407323) key!785)))))

(declare-fun bs!25278 () Bool)

(assert (= bs!25278 d!111669))

(declare-fun m!837255 () Bool)

(assert (=> bs!25278 m!837255))

(assert (=> bs!25278 m!837255))

(declare-fun m!837257 () Bool)

(assert (=> bs!25278 m!837257))

(assert (=> bm!40141 d!111669))

(declare-fun b!901572 () Bool)

(declare-fun e!504785 () Bool)

(declare-fun call!40168 () V!29511)

(assert (=> b!901572 (= e!504785 (= call!40168 (zeroValue!5308 thiss!1181)))))

(declare-fun bm!40163 () Bool)

(declare-fun call!40169 () V!29511)

(assert (=> bm!40163 (= call!40169 call!40168)))

(declare-fun e!504784 () Bool)

(declare-fun b!901573 () Bool)

(assert (=> b!901573 (= e!504784 (= call!40169 (get!13369 (select (arr!25398 (_values!5495 thiss!1181)) (index!38184 lt!407324)) (dynLambda!1311 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901573 (and (bvsge (index!38184 lt!407324) #b00000000000000000000000000000000) (bvslt (index!38184 lt!407324) (size!25859 (_values!5495 thiss!1181))))))

(declare-fun b!901574 () Bool)

(declare-fun e!504786 () Bool)

(assert (=> b!901574 (= e!504786 e!504785)))

(declare-fun res!608651 () Bool)

(assert (=> b!901574 (= res!608651 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901574 (=> (not res!608651) (not e!504785))))

(declare-fun call!40166 () ListLongMap!10787)

(declare-fun bm!40164 () Bool)

(declare-fun call!40167 () ListLongMap!10787)

(declare-fun c!95490 () Bool)

(assert (=> bm!40164 (= call!40168 (apply!416 (ite c!95490 call!40166 call!40167) key!785))))

(declare-fun d!111671 () Bool)

(assert (=> d!111671 e!504786))

(assert (=> d!111671 (= c!95490 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!407373 () Unit!30562)

(declare-fun choose!1532 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64) (_ BitVec 32) Int) Unit!30562)

(assert (=> d!111671 (= lt!407373 (choose!1532 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785 (index!38184 lt!407324) (defaultEntry!5474 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111671 (validMask!0 (mask!26282 thiss!1181))))

(assert (=> d!111671 (= (lemmaKeyInListMapThenSameValueInArray!12 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785 (index!38184 lt!407324) (defaultEntry!5474 thiss!1181)) lt!407373)))

(declare-fun b!901575 () Bool)

(declare-fun e!504782 () Bool)

(assert (=> b!901575 (= e!504786 e!504782)))

(declare-fun c!95489 () Bool)

(assert (=> b!901575 (= c!95489 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40165 () Bool)

(assert (=> bm!40165 (= call!40166 (getCurrentListMap!2627 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun bm!40166 () Bool)

(assert (=> bm!40166 (= call!40167 call!40166)))

(declare-fun b!901576 () Bool)

(declare-fun res!608653 () Bool)

(declare-fun e!504783 () Bool)

(assert (=> b!901576 (=> (not res!608653) (not e!504783))))

(assert (=> b!901576 (= res!608653 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!901576 (= e!504782 e!504783)))

(declare-fun b!901577 () Bool)

(declare-fun res!608652 () Bool)

(assert (=> b!901577 (=> (not res!608652) (not e!504784))))

(assert (=> b!901577 (= res!608652 (arrayContainsKey!0 (_keys!10284 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!901577 (= e!504782 e!504784)))

(declare-fun b!901578 () Bool)

(assert (=> b!901578 (= e!504783 (= call!40169 (minValue!5308 thiss!1181)))))

(assert (= (and d!111671 c!95490) b!901574))

(assert (= (and d!111671 (not c!95490)) b!901575))

(assert (= (and b!901574 res!608651) b!901572))

(assert (= (and b!901575 c!95489) b!901576))

(assert (= (and b!901575 (not c!95489)) b!901577))

(assert (= (and b!901576 res!608653) b!901578))

(assert (= (and b!901577 res!608652) b!901573))

(assert (= (or b!901578 b!901573) bm!40166))

(assert (= (or b!901578 b!901573) bm!40163))

(assert (= (or b!901572 bm!40166) bm!40165))

(assert (= (or b!901572 bm!40163) bm!40164))

(declare-fun b_lambda!13053 () Bool)

(assert (=> (not b_lambda!13053) (not b!901573)))

(assert (=> b!901573 t!25247))

(declare-fun b_and!26417 () Bool)

(assert (= b_and!26399 (and (=> t!25247 result!10215) b_and!26417)))

(declare-fun m!837259 () Bool)

(assert (=> bm!40164 m!837259))

(assert (=> bm!40165 m!837151))

(assert (=> b!901577 m!837147))

(declare-fun m!837261 () Bool)

(assert (=> d!111671 m!837261))

(declare-fun m!837263 () Bool)

(assert (=> d!111671 m!837263))

(assert (=> b!901573 m!837115))

(assert (=> b!901573 m!837117))

(assert (=> b!901573 m!837115))

(assert (=> b!901573 m!837117))

(assert (=> b!901573 m!837119))

(assert (=> b!901429 d!111671))

(declare-fun d!111673 () Bool)

(assert (=> d!111673 (arrayContainsKey!0 (_keys!10284 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407376 () Unit!30562)

(declare-fun choose!13 (array!52859 (_ BitVec 64) (_ BitVec 32)) Unit!30562)

(assert (=> d!111673 (= lt!407376 (choose!13 (_keys!10284 thiss!1181) key!785 (index!38184 lt!407324)))))

(assert (=> d!111673 (bvsge (index!38184 lt!407324) #b00000000000000000000000000000000)))

(assert (=> d!111673 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10284 thiss!1181) key!785 (index!38184 lt!407324)) lt!407376)))

(declare-fun bs!25279 () Bool)

(assert (= bs!25279 d!111673))

(assert (=> bs!25279 m!837147))

(declare-fun m!837265 () Bool)

(assert (=> bs!25279 m!837265))

(assert (=> b!901429 d!111673))

(declare-fun d!111675 () Bool)

(declare-fun res!608658 () Bool)

(declare-fun e!504791 () Bool)

(assert (=> d!111675 (=> res!608658 e!504791)))

(assert (=> d!111675 (= res!608658 (= (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111675 (= (arrayContainsKey!0 (_keys!10284 thiss!1181) key!785 #b00000000000000000000000000000000) e!504791)))

(declare-fun b!901583 () Bool)

(declare-fun e!504792 () Bool)

(assert (=> b!901583 (= e!504791 e!504792)))

(declare-fun res!608659 () Bool)

(assert (=> b!901583 (=> (not res!608659) (not e!504792))))

(assert (=> b!901583 (= res!608659 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25858 (_keys!10284 thiss!1181))))))

(declare-fun b!901584 () Bool)

(assert (=> b!901584 (= e!504792 (arrayContainsKey!0 (_keys!10284 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111675 (not res!608658)) b!901583))

(assert (= (and b!901583 res!608659) b!901584))

(declare-fun m!837267 () Bool)

(assert (=> d!111675 m!837267))

(declare-fun m!837269 () Bool)

(assert (=> b!901584 m!837269))

(assert (=> b!901429 d!111675))

(assert (=> b!901429 d!111661))

(declare-fun bm!40181 () Bool)

(declare-fun call!40190 () ListLongMap!10787)

(declare-fun call!40184 () ListLongMap!10787)

(assert (=> bm!40181 (= call!40190 call!40184)))

(declare-fun b!901627 () Bool)

(declare-fun e!504828 () ListLongMap!10787)

(assert (=> b!901627 (= e!504828 call!40190)))

(declare-fun b!901628 () Bool)

(declare-fun e!504825 () ListLongMap!10787)

(declare-fun e!504830 () ListLongMap!10787)

(assert (=> b!901628 (= e!504825 e!504830)))

(declare-fun c!95508 () Bool)

(assert (=> b!901628 (= c!95508 (and (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40182 () Bool)

(declare-fun call!40189 () Bool)

(declare-fun lt!407425 () ListLongMap!10787)

(assert (=> bm!40182 (= call!40189 (contains!4416 lt!407425 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901629 () Bool)

(declare-fun e!504826 () Bool)

(declare-fun e!504822 () Bool)

(assert (=> b!901629 (= e!504826 e!504822)))

(declare-fun res!608680 () Bool)

(assert (=> b!901629 (= res!608680 call!40189)))

(assert (=> b!901629 (=> (not res!608680) (not e!504822))))

(declare-fun b!901630 () Bool)

(declare-fun e!504831 () Bool)

(assert (=> b!901630 (= e!504831 (= (apply!416 lt!407425 (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000)) (get!13369 (select (arr!25398 (_values!5495 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1311 (defaultEntry!5474 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901630 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25859 (_values!5495 thiss!1181))))))

(assert (=> b!901630 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25858 (_keys!10284 thiss!1181))))))

(declare-fun b!901631 () Bool)

(assert (=> b!901631 (= e!504830 call!40190)))

(declare-fun d!111677 () Bool)

(declare-fun e!504824 () Bool)

(assert (=> d!111677 e!504824))

(declare-fun res!608685 () Bool)

(assert (=> d!111677 (=> (not res!608685) (not e!504824))))

(assert (=> d!111677 (= res!608685 (or (bvsge #b00000000000000000000000000000000 (size!25858 (_keys!10284 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25858 (_keys!10284 thiss!1181))))))))

(declare-fun lt!407431 () ListLongMap!10787)

(assert (=> d!111677 (= lt!407425 lt!407431)))

(declare-fun lt!407433 () Unit!30562)

(declare-fun e!504827 () Unit!30562)

(assert (=> d!111677 (= lt!407433 e!504827)))

(declare-fun c!95504 () Bool)

(declare-fun e!504829 () Bool)

(assert (=> d!111677 (= c!95504 e!504829)))

(declare-fun res!608682 () Bool)

(assert (=> d!111677 (=> (not res!608682) (not e!504829))))

(assert (=> d!111677 (= res!608682 (bvslt #b00000000000000000000000000000000 (size!25858 (_keys!10284 thiss!1181))))))

(assert (=> d!111677 (= lt!407431 e!504825)))

(declare-fun c!95503 () Bool)

(assert (=> d!111677 (= c!95503 (and (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111677 (validMask!0 (mask!26282 thiss!1181))))

(assert (=> d!111677 (= (getCurrentListMap!2627 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)) lt!407425)))

(declare-fun b!901632 () Bool)

(declare-fun +!2627 (ListLongMap!10787 tuple2!12100) ListLongMap!10787)

(assert (=> b!901632 (= e!504825 (+!2627 call!40184 (tuple2!12101 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5308 thiss!1181))))))

(declare-fun b!901633 () Bool)

(declare-fun Unit!30564 () Unit!30562)

(assert (=> b!901633 (= e!504827 Unit!30564)))

(declare-fun b!901634 () Bool)

(declare-fun res!608684 () Bool)

(assert (=> b!901634 (=> (not res!608684) (not e!504824))))

(declare-fun e!504821 () Bool)

(assert (=> b!901634 (= res!608684 e!504821)))

(declare-fun res!608678 () Bool)

(assert (=> b!901634 (=> res!608678 e!504821)))

(declare-fun e!504820 () Bool)

(assert (=> b!901634 (= res!608678 (not e!504820))))

(declare-fun res!608681 () Bool)

(assert (=> b!901634 (=> (not res!608681) (not e!504820))))

(assert (=> b!901634 (= res!608681 (bvslt #b00000000000000000000000000000000 (size!25858 (_keys!10284 thiss!1181))))))

(declare-fun b!901635 () Bool)

(declare-fun c!95506 () Bool)

(assert (=> b!901635 (= c!95506 (and (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901635 (= e!504830 e!504828)))

(declare-fun b!901636 () Bool)

(declare-fun e!504819 () Bool)

(declare-fun call!40185 () Bool)

(assert (=> b!901636 (= e!504819 (not call!40185))))

(declare-fun b!901637 () Bool)

(declare-fun e!504823 () Bool)

(assert (=> b!901637 (= e!504819 e!504823)))

(declare-fun res!608679 () Bool)

(assert (=> b!901637 (= res!608679 call!40185)))

(assert (=> b!901637 (=> (not res!608679) (not e!504823))))

(declare-fun b!901638 () Bool)

(assert (=> b!901638 (= e!504826 (not call!40189))))

(declare-fun b!901639 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901639 (= e!504820 (validKeyInArray!0 (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901640 () Bool)

(assert (=> b!901640 (= e!504824 e!504819)))

(declare-fun c!95507 () Bool)

(assert (=> b!901640 (= c!95507 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40183 () Bool)

(declare-fun call!40188 () ListLongMap!10787)

(declare-fun call!40187 () ListLongMap!10787)

(assert (=> bm!40183 (= call!40188 call!40187)))

(declare-fun bm!40184 () Bool)

(declare-fun call!40186 () ListLongMap!10787)

(assert (=> bm!40184 (= call!40184 (+!2627 (ite c!95503 call!40187 (ite c!95508 call!40188 call!40186)) (ite (or c!95503 c!95508) (tuple2!12101 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5308 thiss!1181)) (tuple2!12101 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5308 thiss!1181)))))))

(declare-fun b!901641 () Bool)

(declare-fun res!608686 () Bool)

(assert (=> b!901641 (=> (not res!608686) (not e!504824))))

(assert (=> b!901641 (= res!608686 e!504826)))

(declare-fun c!95505 () Bool)

(assert (=> b!901641 (= c!95505 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901642 () Bool)

(assert (=> b!901642 (= e!504822 (= (apply!416 lt!407425 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5308 thiss!1181)))))

(declare-fun b!901643 () Bool)

(assert (=> b!901643 (= e!504829 (validKeyInArray!0 (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40185 () Bool)

(assert (=> bm!40185 (= call!40186 call!40188)))

(declare-fun bm!40186 () Bool)

(assert (=> bm!40186 (= call!40185 (contains!4416 lt!407425 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901644 () Bool)

(assert (=> b!901644 (= e!504828 call!40186)))

(declare-fun b!901645 () Bool)

(assert (=> b!901645 (= e!504823 (= (apply!416 lt!407425 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5308 thiss!1181)))))

(declare-fun bm!40187 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3324 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 32) Int) ListLongMap!10787)

(assert (=> bm!40187 (= call!40187 (getCurrentListMapNoExtraKeys!3324 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun b!901646 () Bool)

(declare-fun lt!407421 () Unit!30562)

(assert (=> b!901646 (= e!504827 lt!407421)))

(declare-fun lt!407429 () ListLongMap!10787)

(assert (=> b!901646 (= lt!407429 (getCurrentListMapNoExtraKeys!3324 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!407437 () (_ BitVec 64))

(assert (=> b!901646 (= lt!407437 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407435 () (_ BitVec 64))

(assert (=> b!901646 (= lt!407435 (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407438 () Unit!30562)

(declare-fun addStillContains!342 (ListLongMap!10787 (_ BitVec 64) V!29511 (_ BitVec 64)) Unit!30562)

(assert (=> b!901646 (= lt!407438 (addStillContains!342 lt!407429 lt!407437 (zeroValue!5308 thiss!1181) lt!407435))))

(assert (=> b!901646 (contains!4416 (+!2627 lt!407429 (tuple2!12101 lt!407437 (zeroValue!5308 thiss!1181))) lt!407435)))

(declare-fun lt!407436 () Unit!30562)

(assert (=> b!901646 (= lt!407436 lt!407438)))

(declare-fun lt!407441 () ListLongMap!10787)

(assert (=> b!901646 (= lt!407441 (getCurrentListMapNoExtraKeys!3324 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!407422 () (_ BitVec 64))

(assert (=> b!901646 (= lt!407422 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407440 () (_ BitVec 64))

(assert (=> b!901646 (= lt!407440 (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407428 () Unit!30562)

(declare-fun addApplyDifferent!342 (ListLongMap!10787 (_ BitVec 64) V!29511 (_ BitVec 64)) Unit!30562)

(assert (=> b!901646 (= lt!407428 (addApplyDifferent!342 lt!407441 lt!407422 (minValue!5308 thiss!1181) lt!407440))))

(assert (=> b!901646 (= (apply!416 (+!2627 lt!407441 (tuple2!12101 lt!407422 (minValue!5308 thiss!1181))) lt!407440) (apply!416 lt!407441 lt!407440))))

(declare-fun lt!407432 () Unit!30562)

(assert (=> b!901646 (= lt!407432 lt!407428)))

(declare-fun lt!407424 () ListLongMap!10787)

(assert (=> b!901646 (= lt!407424 (getCurrentListMapNoExtraKeys!3324 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!407442 () (_ BitVec 64))

(assert (=> b!901646 (= lt!407442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407426 () (_ BitVec 64))

(assert (=> b!901646 (= lt!407426 (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407430 () Unit!30562)

(assert (=> b!901646 (= lt!407430 (addApplyDifferent!342 lt!407424 lt!407442 (zeroValue!5308 thiss!1181) lt!407426))))

(assert (=> b!901646 (= (apply!416 (+!2627 lt!407424 (tuple2!12101 lt!407442 (zeroValue!5308 thiss!1181))) lt!407426) (apply!416 lt!407424 lt!407426))))

(declare-fun lt!407439 () Unit!30562)

(assert (=> b!901646 (= lt!407439 lt!407430)))

(declare-fun lt!407427 () ListLongMap!10787)

(assert (=> b!901646 (= lt!407427 (getCurrentListMapNoExtraKeys!3324 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun lt!407434 () (_ BitVec 64))

(assert (=> b!901646 (= lt!407434 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407423 () (_ BitVec 64))

(assert (=> b!901646 (= lt!407423 (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901646 (= lt!407421 (addApplyDifferent!342 lt!407427 lt!407434 (minValue!5308 thiss!1181) lt!407423))))

(assert (=> b!901646 (= (apply!416 (+!2627 lt!407427 (tuple2!12101 lt!407434 (minValue!5308 thiss!1181))) lt!407423) (apply!416 lt!407427 lt!407423))))

(declare-fun b!901647 () Bool)

(assert (=> b!901647 (= e!504821 e!504831)))

(declare-fun res!608683 () Bool)

(assert (=> b!901647 (=> (not res!608683) (not e!504831))))

(assert (=> b!901647 (= res!608683 (contains!4416 lt!407425 (select (arr!25397 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25858 (_keys!10284 thiss!1181))))))

(assert (= (and d!111677 c!95503) b!901632))

(assert (= (and d!111677 (not c!95503)) b!901628))

(assert (= (and b!901628 c!95508) b!901631))

(assert (= (and b!901628 (not c!95508)) b!901635))

(assert (= (and b!901635 c!95506) b!901627))

(assert (= (and b!901635 (not c!95506)) b!901644))

(assert (= (or b!901627 b!901644) bm!40185))

(assert (= (or b!901631 bm!40185) bm!40183))

(assert (= (or b!901631 b!901627) bm!40181))

(assert (= (or b!901632 bm!40183) bm!40187))

(assert (= (or b!901632 bm!40181) bm!40184))

(assert (= (and d!111677 res!608682) b!901643))

(assert (= (and d!111677 c!95504) b!901646))

(assert (= (and d!111677 (not c!95504)) b!901633))

(assert (= (and d!111677 res!608685) b!901634))

(assert (= (and b!901634 res!608681) b!901639))

(assert (= (and b!901634 (not res!608678)) b!901647))

(assert (= (and b!901647 res!608683) b!901630))

(assert (= (and b!901634 res!608684) b!901641))

(assert (= (and b!901641 c!95505) b!901629))

(assert (= (and b!901641 (not c!95505)) b!901638))

(assert (= (and b!901629 res!608680) b!901642))

(assert (= (or b!901629 b!901638) bm!40182))

(assert (= (and b!901641 res!608686) b!901640))

(assert (= (and b!901640 c!95507) b!901637))

(assert (= (and b!901640 (not c!95507)) b!901636))

(assert (= (and b!901637 res!608679) b!901645))

(assert (= (or b!901637 b!901636) bm!40186))

(declare-fun b_lambda!13055 () Bool)

(assert (=> (not b_lambda!13055) (not b!901630)))

(assert (=> b!901630 t!25247))

(declare-fun b_and!26419 () Bool)

(assert (= b_and!26417 (and (=> t!25247 result!10215) b_and!26419)))

(declare-fun m!837271 () Bool)

(assert (=> b!901632 m!837271))

(declare-fun m!837273 () Bool)

(assert (=> b!901645 m!837273))

(declare-fun m!837275 () Bool)

(assert (=> bm!40182 m!837275))

(declare-fun m!837277 () Bool)

(assert (=> bm!40186 m!837277))

(assert (=> d!111677 m!837263))

(declare-fun m!837279 () Bool)

(assert (=> bm!40187 m!837279))

(declare-fun m!837281 () Bool)

(assert (=> bm!40184 m!837281))

(assert (=> b!901630 m!837117))

(declare-fun m!837283 () Bool)

(assert (=> b!901630 m!837283))

(assert (=> b!901630 m!837117))

(declare-fun m!837285 () Bool)

(assert (=> b!901630 m!837285))

(assert (=> b!901630 m!837267))

(assert (=> b!901630 m!837283))

(assert (=> b!901630 m!837267))

(declare-fun m!837287 () Bool)

(assert (=> b!901630 m!837287))

(assert (=> b!901646 m!837279))

(declare-fun m!837289 () Bool)

(assert (=> b!901646 m!837289))

(declare-fun m!837291 () Bool)

(assert (=> b!901646 m!837291))

(declare-fun m!837293 () Bool)

(assert (=> b!901646 m!837293))

(declare-fun m!837295 () Bool)

(assert (=> b!901646 m!837295))

(declare-fun m!837297 () Bool)

(assert (=> b!901646 m!837297))

(declare-fun m!837299 () Bool)

(assert (=> b!901646 m!837299))

(assert (=> b!901646 m!837289))

(declare-fun m!837301 () Bool)

(assert (=> b!901646 m!837301))

(declare-fun m!837303 () Bool)

(assert (=> b!901646 m!837303))

(assert (=> b!901646 m!837301))

(declare-fun m!837305 () Bool)

(assert (=> b!901646 m!837305))

(assert (=> b!901646 m!837303))

(declare-fun m!837307 () Bool)

(assert (=> b!901646 m!837307))

(declare-fun m!837309 () Bool)

(assert (=> b!901646 m!837309))

(declare-fun m!837311 () Bool)

(assert (=> b!901646 m!837311))

(declare-fun m!837313 () Bool)

(assert (=> b!901646 m!837313))

(declare-fun m!837315 () Bool)

(assert (=> b!901646 m!837315))

(assert (=> b!901646 m!837309))

(assert (=> b!901646 m!837267))

(declare-fun m!837317 () Bool)

(assert (=> b!901646 m!837317))

(assert (=> b!901647 m!837267))

(assert (=> b!901647 m!837267))

(declare-fun m!837319 () Bool)

(assert (=> b!901647 m!837319))

(declare-fun m!837321 () Bool)

(assert (=> b!901642 m!837321))

(assert (=> b!901643 m!837267))

(assert (=> b!901643 m!837267))

(declare-fun m!837323 () Bool)

(assert (=> b!901643 m!837323))

(assert (=> b!901639 m!837267))

(assert (=> b!901639 m!837267))

(assert (=> b!901639 m!837323))

(assert (=> b!901429 d!111677))

(declare-fun d!111679 () Bool)

(declare-fun e!504834 () Bool)

(assert (=> d!111679 e!504834))

(declare-fun res!608689 () Bool)

(assert (=> d!111679 (=> (not res!608689) (not e!504834))))

(assert (=> d!111679 (= res!608689 (and (bvsge (index!38184 lt!407324) #b00000000000000000000000000000000) (bvslt (index!38184 lt!407324) (size!25858 (_keys!10284 thiss!1181)))))))

(declare-fun lt!407445 () Unit!30562)

(declare-fun choose!1533 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 32) Int) Unit!30562)

(assert (=> d!111679 (= lt!407445 (choose!1533 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) (index!38184 lt!407324) (defaultEntry!5474 thiss!1181)))))

(assert (=> d!111679 (validMask!0 (mask!26282 thiss!1181))))

(assert (=> d!111679 (= (lemmaValidKeyInArrayIsInListMap!263 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) (index!38184 lt!407324) (defaultEntry!5474 thiss!1181)) lt!407445)))

(declare-fun b!901650 () Bool)

(assert (=> b!901650 (= e!504834 (contains!4416 (getCurrentListMap!2627 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)) (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407324))))))

(assert (= (and d!111679 res!608689) b!901650))

(declare-fun m!837325 () Bool)

(assert (=> d!111679 m!837325))

(assert (=> d!111679 m!837263))

(assert (=> b!901650 m!837151))

(assert (=> b!901650 m!837143))

(assert (=> b!901650 m!837151))

(assert (=> b!901650 m!837143))

(declare-fun m!837327 () Bool)

(assert (=> b!901650 m!837327))

(assert (=> b!901429 d!111679))

(declare-fun d!111681 () Bool)

(declare-fun e!504839 () Bool)

(assert (=> d!111681 e!504839))

(declare-fun res!608692 () Bool)

(assert (=> d!111681 (=> res!608692 e!504839)))

(declare-fun lt!407456 () Bool)

(assert (=> d!111681 (= res!608692 (not lt!407456))))

(declare-fun lt!407454 () Bool)

(assert (=> d!111681 (= lt!407456 lt!407454)))

(declare-fun lt!407457 () Unit!30562)

(declare-fun e!504840 () Unit!30562)

(assert (=> d!111681 (= lt!407457 e!504840)))

(declare-fun c!95511 () Bool)

(assert (=> d!111681 (= c!95511 lt!407454)))

(declare-fun containsKey!435 (List!17888 (_ BitVec 64)) Bool)

(assert (=> d!111681 (= lt!407454 (containsKey!435 (toList!5409 lt!407323) (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407324))))))

(assert (=> d!111681 (= (contains!4416 lt!407323 (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407324))) lt!407456)))

(declare-fun b!901657 () Bool)

(declare-fun lt!407455 () Unit!30562)

(assert (=> b!901657 (= e!504840 lt!407455)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!330 (List!17888 (_ BitVec 64)) Unit!30562)

(assert (=> b!901657 (= lt!407455 (lemmaContainsKeyImpliesGetValueByKeyDefined!330 (toList!5409 lt!407323) (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407324))))))

(declare-fun isDefined!343 (Option!473) Bool)

(assert (=> b!901657 (isDefined!343 (getValueByKey!467 (toList!5409 lt!407323) (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407324))))))

(declare-fun b!901658 () Bool)

(declare-fun Unit!30565 () Unit!30562)

(assert (=> b!901658 (= e!504840 Unit!30565)))

(declare-fun b!901659 () Bool)

(assert (=> b!901659 (= e!504839 (isDefined!343 (getValueByKey!467 (toList!5409 lt!407323) (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407324)))))))

(assert (= (and d!111681 c!95511) b!901657))

(assert (= (and d!111681 (not c!95511)) b!901658))

(assert (= (and d!111681 (not res!608692)) b!901659))

(assert (=> d!111681 m!837143))

(declare-fun m!837329 () Bool)

(assert (=> d!111681 m!837329))

(assert (=> b!901657 m!837143))

(declare-fun m!837331 () Bool)

(assert (=> b!901657 m!837331))

(assert (=> b!901657 m!837143))

(declare-fun m!837333 () Bool)

(assert (=> b!901657 m!837333))

(assert (=> b!901657 m!837333))

(declare-fun m!837335 () Bool)

(assert (=> b!901657 m!837335))

(assert (=> b!901659 m!837143))

(assert (=> b!901659 m!837333))

(assert (=> b!901659 m!837333))

(assert (=> b!901659 m!837335))

(assert (=> b!901429 d!111681))

(declare-fun b!901681 () Bool)

(declare-fun e!504851 () Bool)

(declare-fun call!40199 () Bool)

(assert (=> b!901681 (= e!504851 call!40199)))

(declare-fun bm!40194 () Bool)

(declare-fun call!40197 () ListLongMap!10787)

(assert (=> bm!40194 (= call!40197 (getCurrentListMap!2627 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5474 thiss!1181)))))

(declare-fun b!901682 () Bool)

(declare-fun e!504854 () Bool)

(assert (=> b!901682 (= e!504854 false)))

(declare-fun c!95523 () Bool)

(declare-fun call!40198 () Bool)

(assert (=> b!901682 (= c!95523 call!40198)))

(declare-fun lt!407490 () Unit!30562)

(declare-fun e!504852 () Unit!30562)

(assert (=> b!901682 (= lt!407490 e!504852)))

(declare-fun b!901683 () Bool)

(declare-fun e!504853 () Bool)

(assert (=> b!901683 (= e!504853 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901684 () Bool)

(assert (=> b!901684 false))

(declare-fun lt!407498 () Unit!30562)

(declare-fun lt!407499 () Unit!30562)

(assert (=> b!901684 (= lt!407498 lt!407499)))

(declare-fun lt!407492 () SeekEntryResult!8953)

(declare-fun lt!407496 () (_ BitVec 32))

(assert (=> b!901684 (and ((_ is Found!8953) lt!407492) (= (index!38184 lt!407492) lt!407496))))

(assert (=> b!901684 (= lt!407492 (seekEntry!0 key!785 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52859 (_ BitVec 32)) Unit!30562)

(assert (=> b!901684 (= lt!407499 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!407496 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)))))

(declare-fun lt!407491 () Unit!30562)

(declare-fun lt!407495 () Unit!30562)

(assert (=> b!901684 (= lt!407491 lt!407495)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52859 (_ BitVec 32)) Bool)

(assert (=> b!901684 (arrayForallSeekEntryOrOpenFound!0 lt!407496 (_keys!10284 thiss!1181) (mask!26282 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30562)

(assert (=> b!901684 (= lt!407495 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10284 thiss!1181) (mask!26282 thiss!1181) #b00000000000000000000000000000000 lt!407496))))

(declare-fun arrayScanForKey!0 (array!52859 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901684 (= lt!407496 (arrayScanForKey!0 (_keys!10284 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!407502 () Unit!30562)

(declare-fun lt!407488 () Unit!30562)

(assert (=> b!901684 (= lt!407502 lt!407488)))

(assert (=> b!901684 e!504851))

(declare-fun c!95524 () Bool)

(assert (=> b!901684 (= c!95524 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!172 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64) Int) Unit!30562)

(assert (=> b!901684 (= lt!407488 (lemmaKeyInListMapIsInArray!172 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785 (defaultEntry!5474 thiss!1181)))))

(declare-fun Unit!30566 () Unit!30562)

(assert (=> b!901684 (= e!504852 Unit!30566)))

(declare-fun b!901685 () Bool)

(declare-fun e!504855 () Bool)

(assert (=> b!901685 (= e!504853 e!504855)))

(declare-fun c!95526 () Bool)

(assert (=> b!901685 (= c!95526 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901686 () Bool)

(declare-fun Unit!30567 () Unit!30562)

(assert (=> b!901686 (= e!504852 Unit!30567)))

(declare-fun lt!407500 () SeekEntryResult!8953)

(declare-fun c!95525 () Bool)

(declare-fun bm!40195 () Bool)

(assert (=> bm!40195 (= call!40198 (contains!4416 call!40197 (ite c!95525 (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407500)) key!785)))))

(declare-fun b!901687 () Bool)

(assert (=> b!901687 (= c!95525 ((_ is Found!8953) lt!407500))))

(assert (=> b!901687 (= lt!407500 (seekEntry!0 key!785 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)))))

(assert (=> b!901687 (= e!504855 e!504854)))

(declare-fun b!901688 () Bool)

(assert (=> b!901688 (= e!504855 (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901680 () Bool)

(assert (=> b!901680 (= e!504854 true)))

(declare-fun lt!407501 () Unit!30562)

(assert (=> b!901680 (= lt!407501 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10284 thiss!1181) key!785 (index!38184 lt!407500)))))

(assert (=> b!901680 call!40199))

(declare-fun lt!407489 () Unit!30562)

(assert (=> b!901680 (= lt!407489 lt!407501)))

(declare-fun lt!407494 () Unit!30562)

(assert (=> b!901680 (= lt!407494 (lemmaValidKeyInArrayIsInListMap!263 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) (index!38184 lt!407500) (defaultEntry!5474 thiss!1181)))))

(assert (=> b!901680 call!40198))

(declare-fun lt!407493 () Unit!30562)

(assert (=> b!901680 (= lt!407493 lt!407494)))

(declare-fun d!111683 () Bool)

(declare-fun lt!407497 () Bool)

(assert (=> d!111683 (= lt!407497 (contains!4416 (map!12282 thiss!1181) key!785))))

(assert (=> d!111683 (= lt!407497 e!504853)))

(declare-fun c!95522 () Bool)

(assert (=> d!111683 (= c!95522 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111683 (valid!1720 thiss!1181)))

(assert (=> d!111683 (= (contains!4415 thiss!1181 key!785) lt!407497)))

(declare-fun b!901689 () Bool)

(assert (=> b!901689 (= e!504851 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5204 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!40196 () Bool)

(assert (=> bm!40196 (= call!40199 (arrayContainsKey!0 (_keys!10284 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (= (and d!111683 c!95522) b!901683))

(assert (= (and d!111683 (not c!95522)) b!901685))

(assert (= (and b!901685 c!95526) b!901688))

(assert (= (and b!901685 (not c!95526)) b!901687))

(assert (= (and b!901687 c!95525) b!901680))

(assert (= (and b!901687 (not c!95525)) b!901682))

(assert (= (and b!901682 c!95523) b!901684))

(assert (= (and b!901682 (not c!95523)) b!901686))

(assert (= (and b!901684 c!95524) b!901681))

(assert (= (and b!901684 (not c!95524)) b!901689))

(assert (= (or b!901680 b!901681) bm!40196))

(assert (= (or b!901680 b!901682) bm!40194))

(assert (= (or b!901680 b!901682) bm!40195))

(assert (=> bm!40194 m!837151))

(declare-fun m!837337 () Bool)

(assert (=> bm!40195 m!837337))

(declare-fun m!837339 () Bool)

(assert (=> bm!40195 m!837339))

(assert (=> d!111683 m!837121))

(assert (=> d!111683 m!837121))

(declare-fun m!837341 () Bool)

(assert (=> d!111683 m!837341))

(assert (=> d!111683 m!837127))

(assert (=> b!901687 m!837133))

(declare-fun m!837343 () Bool)

(assert (=> b!901680 m!837343))

(declare-fun m!837345 () Bool)

(assert (=> b!901680 m!837345))

(assert (=> bm!40196 m!837147))

(declare-fun m!837347 () Bool)

(assert (=> b!901684 m!837347))

(declare-fun m!837349 () Bool)

(assert (=> b!901684 m!837349))

(assert (=> b!901684 m!837133))

(declare-fun m!837351 () Bool)

(assert (=> b!901684 m!837351))

(declare-fun m!837353 () Bool)

(assert (=> b!901684 m!837353))

(declare-fun m!837355 () Bool)

(assert (=> b!901684 m!837355))

(assert (=> b!901429 d!111683))

(declare-fun d!111685 () Bool)

(declare-fun e!504858 () Bool)

(assert (=> d!111685 e!504858))

(declare-fun res!608695 () Bool)

(assert (=> d!111685 (=> res!608695 e!504858)))

(declare-fun lt!407508 () SeekEntryResult!8953)

(assert (=> d!111685 (= res!608695 (not ((_ is Found!8953) lt!407508)))))

(assert (=> d!111685 (= lt!407508 (seekEntry!0 key!785 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)))))

(declare-fun lt!407507 () Unit!30562)

(declare-fun choose!1534 (array!52859 array!52861 (_ BitVec 32) (_ BitVec 32) V!29511 V!29511 (_ BitVec 64)) Unit!30562)

(assert (=> d!111685 (= lt!407507 (choose!1534 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785))))

(assert (=> d!111685 (validMask!0 (mask!26282 thiss!1181))))

(assert (=> d!111685 (= (lemmaSeekEntryGivesInRangeIndex!113 (_keys!10284 thiss!1181) (_values!5495 thiss!1181) (mask!26282 thiss!1181) (extraKeys!5204 thiss!1181) (zeroValue!5308 thiss!1181) (minValue!5308 thiss!1181) key!785) lt!407507)))

(declare-fun b!901692 () Bool)

(assert (=> b!901692 (= e!504858 (inRange!0 (index!38184 lt!407508) (mask!26282 thiss!1181)))))

(assert (= (and d!111685 (not res!608695)) b!901692))

(assert (=> d!111685 m!837133))

(declare-fun m!837357 () Bool)

(assert (=> d!111685 m!837357))

(assert (=> d!111685 m!837263))

(declare-fun m!837359 () Bool)

(assert (=> b!901692 m!837359))

(assert (=> b!901425 d!111685))

(declare-fun b!901705 () Bool)

(declare-fun e!504866 () SeekEntryResult!8953)

(declare-fun lt!407518 () SeekEntryResult!8953)

(assert (=> b!901705 (= e!504866 (Found!8953 (index!38185 lt!407518)))))

(declare-fun d!111687 () Bool)

(declare-fun lt!407520 () SeekEntryResult!8953)

(assert (=> d!111687 (and (or ((_ is MissingVacant!8953) lt!407520) (not ((_ is Found!8953) lt!407520)) (and (bvsge (index!38184 lt!407520) #b00000000000000000000000000000000) (bvslt (index!38184 lt!407520) (size!25858 (_keys!10284 thiss!1181))))) (not ((_ is MissingVacant!8953) lt!407520)) (or (not ((_ is Found!8953) lt!407520)) (= (select (arr!25397 (_keys!10284 thiss!1181)) (index!38184 lt!407520)) key!785)))))

(declare-fun e!504867 () SeekEntryResult!8953)

(assert (=> d!111687 (= lt!407520 e!504867)))

(declare-fun c!95535 () Bool)

(assert (=> d!111687 (= c!95535 (and ((_ is Intermediate!8953) lt!407518) (undefined!9765 lt!407518)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52859 (_ BitVec 32)) SeekEntryResult!8953)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111687 (= lt!407518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26282 thiss!1181)) key!785 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)))))

(assert (=> d!111687 (validMask!0 (mask!26282 thiss!1181))))

(assert (=> d!111687 (= (seekEntry!0 key!785 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)) lt!407520)))

(declare-fun b!901706 () Bool)

(assert (=> b!901706 (= e!504867 Undefined!8953)))

(declare-fun b!901707 () Bool)

(assert (=> b!901707 (= e!504867 e!504866)))

(declare-fun lt!407519 () (_ BitVec 64))

(assert (=> b!901707 (= lt!407519 (select (arr!25397 (_keys!10284 thiss!1181)) (index!38185 lt!407518)))))

(declare-fun c!95533 () Bool)

(assert (=> b!901707 (= c!95533 (= lt!407519 key!785))))

(declare-fun b!901708 () Bool)

(declare-fun e!504865 () SeekEntryResult!8953)

(declare-fun lt!407517 () SeekEntryResult!8953)

(assert (=> b!901708 (= e!504865 (ite ((_ is MissingVacant!8953) lt!407517) (MissingZero!8953 (index!38186 lt!407517)) lt!407517))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52859 (_ BitVec 32)) SeekEntryResult!8953)

(assert (=> b!901708 (= lt!407517 (seekKeyOrZeroReturnVacant!0 (x!76823 lt!407518) (index!38185 lt!407518) (index!38185 lt!407518) key!785 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)))))

(declare-fun b!901709 () Bool)

(declare-fun c!95534 () Bool)

(assert (=> b!901709 (= c!95534 (= lt!407519 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!901709 (= e!504866 e!504865)))

(declare-fun b!901710 () Bool)

(assert (=> b!901710 (= e!504865 (MissingZero!8953 (index!38185 lt!407518)))))

(assert (= (and d!111687 c!95535) b!901706))

(assert (= (and d!111687 (not c!95535)) b!901707))

(assert (= (and b!901707 c!95533) b!901705))

(assert (= (and b!901707 (not c!95533)) b!901709))

(assert (= (and b!901709 c!95534) b!901710))

(assert (= (and b!901709 (not c!95534)) b!901708))

(declare-fun m!837361 () Bool)

(assert (=> d!111687 m!837361))

(declare-fun m!837363 () Bool)

(assert (=> d!111687 m!837363))

(assert (=> d!111687 m!837363))

(declare-fun m!837365 () Bool)

(assert (=> d!111687 m!837365))

(assert (=> d!111687 m!837263))

(declare-fun m!837367 () Bool)

(assert (=> b!901707 m!837367))

(declare-fun m!837369 () Bool)

(assert (=> b!901708 m!837369))

(assert (=> b!901425 d!111687))

(declare-fun d!111689 () Bool)

(assert (=> d!111689 (= (array_inv!19974 (_keys!10284 thiss!1181)) (bvsge (size!25858 (_keys!10284 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901435 d!111689))

(declare-fun d!111691 () Bool)

(assert (=> d!111691 (= (array_inv!19975 (_values!5495 thiss!1181)) (bvsge (size!25859 (_values!5495 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901435 d!111691))

(declare-fun d!111693 () Bool)

(assert (=> d!111693 (= (inRange!0 (index!38184 lt!407324) (mask!26282 thiss!1181)) (and (bvsge (index!38184 lt!407324) #b00000000000000000000000000000000) (bvslt (index!38184 lt!407324) (bvadd (mask!26282 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901426 d!111693))

(declare-fun d!111695 () Bool)

(declare-fun res!608702 () Bool)

(declare-fun e!504870 () Bool)

(assert (=> d!111695 (=> (not res!608702) (not e!504870))))

(declare-fun simpleValid!334 (LongMapFixedSize!4462) Bool)

(assert (=> d!111695 (= res!608702 (simpleValid!334 thiss!1181))))

(assert (=> d!111695 (= (valid!1720 thiss!1181) e!504870)))

(declare-fun b!901717 () Bool)

(declare-fun res!608703 () Bool)

(assert (=> b!901717 (=> (not res!608703) (not e!504870))))

(declare-fun arrayCountValidKeys!0 (array!52859 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901717 (= res!608703 (= (arrayCountValidKeys!0 (_keys!10284 thiss!1181) #b00000000000000000000000000000000 (size!25858 (_keys!10284 thiss!1181))) (_size!2286 thiss!1181)))))

(declare-fun b!901718 () Bool)

(declare-fun res!608704 () Bool)

(assert (=> b!901718 (=> (not res!608704) (not e!504870))))

(assert (=> b!901718 (= res!608704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10284 thiss!1181) (mask!26282 thiss!1181)))))

(declare-fun b!901719 () Bool)

(declare-datatypes ((List!17891 0))(
  ( (Nil!17888) (Cons!17887 (h!19033 (_ BitVec 64)) (t!25259 List!17891)) )
))
(declare-fun arrayNoDuplicates!0 (array!52859 (_ BitVec 32) List!17891) Bool)

(assert (=> b!901719 (= e!504870 (arrayNoDuplicates!0 (_keys!10284 thiss!1181) #b00000000000000000000000000000000 Nil!17888))))

(assert (= (and d!111695 res!608702) b!901717))

(assert (= (and b!901717 res!608703) b!901718))

(assert (= (and b!901718 res!608704) b!901719))

(declare-fun m!837371 () Bool)

(assert (=> d!111695 m!837371))

(declare-fun m!837373 () Bool)

(assert (=> b!901717 m!837373))

(declare-fun m!837375 () Bool)

(assert (=> b!901718 m!837375))

(declare-fun m!837377 () Bool)

(assert (=> b!901719 m!837377))

(assert (=> start!77278 d!111695))

(declare-fun b!901727 () Bool)

(declare-fun e!504876 () Bool)

(assert (=> b!901727 (= e!504876 tp_is_empty!18409)))

(declare-fun mapNonEmpty!29311 () Bool)

(declare-fun mapRes!29311 () Bool)

(declare-fun tp!56362 () Bool)

(declare-fun e!504875 () Bool)

(assert (=> mapNonEmpty!29311 (= mapRes!29311 (and tp!56362 e!504875))))

(declare-fun mapValue!29311 () ValueCell!8723)

(declare-fun mapKey!29311 () (_ BitVec 32))

(declare-fun mapRest!29311 () (Array (_ BitVec 32) ValueCell!8723))

(assert (=> mapNonEmpty!29311 (= mapRest!29302 (store mapRest!29311 mapKey!29311 mapValue!29311))))

(declare-fun mapIsEmpty!29311 () Bool)

(assert (=> mapIsEmpty!29311 mapRes!29311))

(declare-fun b!901726 () Bool)

(assert (=> b!901726 (= e!504875 tp_is_empty!18409)))

(declare-fun condMapEmpty!29311 () Bool)

(declare-fun mapDefault!29311 () ValueCell!8723)

(assert (=> mapNonEmpty!29302 (= condMapEmpty!29311 (= mapRest!29302 ((as const (Array (_ BitVec 32) ValueCell!8723)) mapDefault!29311)))))

(assert (=> mapNonEmpty!29302 (= tp!56347 (and e!504876 mapRes!29311))))

(assert (= (and mapNonEmpty!29302 condMapEmpty!29311) mapIsEmpty!29311))

(assert (= (and mapNonEmpty!29302 (not condMapEmpty!29311)) mapNonEmpty!29311))

(assert (= (and mapNonEmpty!29311 ((_ is ValueCellFull!8723) mapValue!29311)) b!901726))

(assert (= (and mapNonEmpty!29302 ((_ is ValueCellFull!8723) mapDefault!29311)) b!901727))

(declare-fun m!837379 () Bool)

(assert (=> mapNonEmpty!29311 m!837379))

(declare-fun b_lambda!13057 () Bool)

(assert (= b_lambda!13053 (or (and b!901435 b_free!16081) b_lambda!13057)))

(declare-fun b_lambda!13059 () Bool)

(assert (= b_lambda!13055 (or (and b!901435 b_free!16081) b_lambda!13059)))

(check-sat (not b!901642) (not d!111679) (not b!901632) (not b!901692) (not b_lambda!13059) (not d!111673) (not d!111677) (not b!901708) (not bm!40187) (not b!901643) (not b_lambda!13057) (not b_lambda!13049) (not b!901657) (not b_lambda!13047) (not bm!40184) (not mapNonEmpty!29311) (not b!901645) (not b!901573) (not d!111695) (not b!901545) tp_is_empty!18409 (not b!901717) (not b!901544) (not b!901659) (not b!901639) (not d!111671) (not bm!40196) (not b!901577) (not d!111687) b_and!26419 (not bm!40165) (not d!111667) (not b!901556) (not d!111685) (not b_next!16081) (not b!901647) (not bm!40186) (not d!111681) (not b!901650) (not b_lambda!13051) (not bm!40194) (not b!901646) (not b!901687) (not d!111683) (not bm!40182) (not d!111669) (not b!901680) (not bm!40195) (not bm!40164) (not b!901684) (not b!901718) (not b!901719) (not b!901630) (not b!901584))
(check-sat b_and!26419 (not b_next!16081))
