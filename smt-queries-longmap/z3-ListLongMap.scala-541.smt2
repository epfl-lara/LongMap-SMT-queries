; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13962 () Bool)

(assert start!13962)

(declare-fun b!129225 () Bool)

(declare-fun b_free!2885 () Bool)

(declare-fun b_next!2885 () Bool)

(assert (=> b!129225 (= b_free!2885 (not b_next!2885))))

(declare-fun tp!11080 () Bool)

(declare-fun b_and!7991 () Bool)

(assert (=> b!129225 (= tp!11080 b_and!7991)))

(declare-fun b!129213 () Bool)

(declare-fun b_free!2887 () Bool)

(declare-fun b_next!2887 () Bool)

(assert (=> b!129213 (= b_free!2887 (not b_next!2887))))

(declare-fun tp!11079 () Bool)

(declare-fun b_and!7993 () Bool)

(assert (=> b!129213 (= tp!11079 b_and!7993)))

(declare-fun b!129209 () Bool)

(declare-fun e!84355 () Bool)

(declare-fun e!84344 () Bool)

(declare-fun mapRes!4570 () Bool)

(assert (=> b!129209 (= e!84355 (and e!84344 mapRes!4570))))

(declare-fun condMapEmpty!4570 () Bool)

(declare-datatypes ((V!3459 0))(
  ( (V!3460 (val!1474 Int)) )
))
(declare-datatypes ((array!4739 0))(
  ( (array!4740 (arr!2243 (Array (_ BitVec 32) (_ BitVec 64))) (size!2509 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1086 0))(
  ( (ValueCellFull!1086 (v!3161 V!3459)) (EmptyCell!1086) )
))
(declare-datatypes ((array!4741 0))(
  ( (array!4742 (arr!2244 (Array (_ BitVec 32) ValueCell!1086)) (size!2510 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1080 0))(
  ( (LongMapFixedSize!1081 (defaultEntry!2824 Int) (mask!7102 (_ BitVec 32)) (extraKeys!2597 (_ BitVec 32)) (zeroValue!2683 V!3459) (minValue!2683 V!3459) (_size!589 (_ BitVec 32)) (_keys!4565 array!4739) (_values!2807 array!4741) (_vacant!589 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!874 0))(
  ( (Cell!875 (v!3162 LongMapFixedSize!1080)) )
))
(declare-datatypes ((LongMap!874 0))(
  ( (LongMap!875 (underlying!448 Cell!874)) )
))
(declare-fun thiss!992 () LongMap!874)

(declare-fun mapDefault!4569 () ValueCell!1086)

(assert (=> b!129209 (= condMapEmpty!4570 (= (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1086)) mapDefault!4569)))))

(declare-fun b!129210 () Bool)

(declare-fun e!84358 () Bool)

(assert (=> b!129210 (= e!84358 (and (= (size!2510 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7102 (v!3162 (underlying!448 thiss!992))))) (= (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (size!2510 (_values!2807 (v!3162 (underlying!448 thiss!992))))) (bvsge (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!129211 () Bool)

(declare-fun res!62367 () Bool)

(declare-fun e!84345 () Bool)

(assert (=> b!129211 (=> (not res!62367) (not e!84345))))

(declare-fun newMap!16 () LongMapFixedSize!1080)

(assert (=> b!129211 (= res!62367 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7102 newMap!16)) (_size!589 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun mapIsEmpty!4569 () Bool)

(declare-fun mapRes!4569 () Bool)

(assert (=> mapIsEmpty!4569 mapRes!4569))

(declare-fun b!129212 () Bool)

(declare-fun e!84353 () Bool)

(declare-fun e!84351 () Bool)

(assert (=> b!129212 (= e!84353 e!84351)))

(declare-fun res!62370 () Bool)

(assert (=> start!13962 (=> (not res!62370) (not e!84345))))

(declare-fun valid!514 (LongMap!874) Bool)

(assert (=> start!13962 (= res!62370 (valid!514 thiss!992))))

(assert (=> start!13962 e!84345))

(declare-fun e!84356 () Bool)

(assert (=> start!13962 e!84356))

(assert (=> start!13962 true))

(declare-fun e!84347 () Bool)

(assert (=> start!13962 e!84347))

(declare-fun e!84349 () Bool)

(declare-fun tp_is_empty!2859 () Bool)

(declare-fun array_inv!1411 (array!4739) Bool)

(declare-fun array_inv!1412 (array!4741) Bool)

(assert (=> b!129213 (= e!84347 (and tp!11079 tp_is_empty!2859 (array_inv!1411 (_keys!4565 newMap!16)) (array_inv!1412 (_values!2807 newMap!16)) e!84349))))

(declare-fun b!129214 () Bool)

(declare-fun e!84350 () Bool)

(assert (=> b!129214 (= e!84350 tp_is_empty!2859)))

(declare-fun b!129215 () Bool)

(declare-fun res!62368 () Bool)

(assert (=> b!129215 (=> (not res!62368) (not e!84345))))

(declare-fun valid!515 (LongMapFixedSize!1080) Bool)

(assert (=> b!129215 (= res!62368 (valid!515 newMap!16))))

(declare-fun b!129216 () Bool)

(assert (=> b!129216 (= e!84344 tp_is_empty!2859)))

(declare-fun b!129217 () Bool)

(declare-fun res!62373 () Bool)

(assert (=> b!129217 (=> (not res!62373) (not e!84345))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!129217 (= res!62373 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!129218 () Bool)

(assert (=> b!129218 (= e!84356 e!84353)))

(declare-fun b!129219 () Bool)

(declare-fun e!84354 () Bool)

(assert (=> b!129219 (= e!84349 (and e!84354 mapRes!4569))))

(declare-fun condMapEmpty!4569 () Bool)

(declare-fun mapDefault!4570 () ValueCell!1086)

(assert (=> b!129219 (= condMapEmpty!4569 (= (arr!2244 (_values!2807 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1086)) mapDefault!4570)))))

(declare-fun b!129220 () Bool)

(assert (=> b!129220 (= e!84354 tp_is_empty!2859)))

(declare-fun b!129221 () Bool)

(declare-fun e!84357 () Bool)

(assert (=> b!129221 (= e!84357 tp_is_empty!2859)))

(declare-fun mapIsEmpty!4570 () Bool)

(assert (=> mapIsEmpty!4570 mapRes!4570))

(declare-fun b!129222 () Bool)

(declare-fun e!84348 () Bool)

(assert (=> b!129222 (= e!84348 e!84358)))

(declare-fun res!62372 () Bool)

(assert (=> b!129222 (=> (not res!62372) (not e!84358))))

(declare-datatypes ((tuple2!2608 0))(
  ( (tuple2!2609 (_1!1315 (_ BitVec 64)) (_2!1315 V!3459)) )
))
(declare-datatypes ((List!1708 0))(
  ( (Nil!1705) (Cons!1704 (h!2308 tuple2!2608) (t!6107 List!1708)) )
))
(declare-datatypes ((ListLongMap!1697 0))(
  ( (ListLongMap!1698 (toList!864 List!1708)) )
))
(declare-fun lt!67005 () ListLongMap!1697)

(declare-fun contains!889 (ListLongMap!1697 (_ BitVec 64)) Bool)

(assert (=> b!129222 (= res!62372 (contains!889 lt!67005 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2610 0))(
  ( (tuple2!2611 (_1!1316 Bool) (_2!1316 LongMapFixedSize!1080)) )
))
(declare-fun lt!67007 () tuple2!2610)

(declare-fun update!190 (LongMapFixedSize!1080 (_ BitVec 64) V!3459) tuple2!2610)

(declare-fun get!1463 (ValueCell!1086 V!3459) V!3459)

(declare-fun dynLambda!421 (Int (_ BitVec 64)) V!3459)

(assert (=> b!129222 (= lt!67007 (update!190 newMap!16 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129223 () Bool)

(declare-fun res!62369 () Bool)

(assert (=> b!129223 (=> (not res!62369) (not e!84358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!129223 (= res!62369 (validMask!0 (mask!7102 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun mapNonEmpty!4569 () Bool)

(declare-fun tp!11077 () Bool)

(assert (=> mapNonEmpty!4569 (= mapRes!4569 (and tp!11077 e!84350))))

(declare-fun mapValue!4569 () ValueCell!1086)

(declare-fun mapKey!4570 () (_ BitVec 32))

(declare-fun mapRest!4569 () (Array (_ BitVec 32) ValueCell!1086))

(assert (=> mapNonEmpty!4569 (= (arr!2244 (_values!2807 newMap!16)) (store mapRest!4569 mapKey!4570 mapValue!4569))))

(declare-fun mapNonEmpty!4570 () Bool)

(declare-fun tp!11078 () Bool)

(assert (=> mapNonEmpty!4570 (= mapRes!4570 (and tp!11078 e!84357))))

(declare-fun mapValue!4570 () ValueCell!1086)

(declare-fun mapRest!4570 () (Array (_ BitVec 32) ValueCell!1086))

(declare-fun mapKey!4569 () (_ BitVec 32))

(assert (=> mapNonEmpty!4570 (= (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (store mapRest!4570 mapKey!4569 mapValue!4570))))

(declare-fun b!129224 () Bool)

(assert (=> b!129224 (= e!84345 e!84348)))

(declare-fun res!62371 () Bool)

(assert (=> b!129224 (=> (not res!62371) (not e!84348))))

(declare-fun lt!67006 () ListLongMap!1697)

(assert (=> b!129224 (= res!62371 (and (= lt!67006 lt!67005) (not (= (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1398 (LongMapFixedSize!1080) ListLongMap!1697)

(assert (=> b!129224 (= lt!67005 (map!1398 newMap!16))))

(declare-fun getCurrentListMap!541 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 32) Int) ListLongMap!1697)

(assert (=> b!129224 (= lt!67006 (getCurrentListMap!541 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))))))

(assert (=> b!129225 (= e!84351 (and tp!11080 tp_is_empty!2859 (array_inv!1411 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (array_inv!1412 (_values!2807 (v!3162 (underlying!448 thiss!992)))) e!84355))))

(assert (= (and start!13962 res!62370) b!129217))

(assert (= (and b!129217 res!62373) b!129215))

(assert (= (and b!129215 res!62368) b!129211))

(assert (= (and b!129211 res!62367) b!129224))

(assert (= (and b!129224 res!62371) b!129222))

(assert (= (and b!129222 res!62372) b!129223))

(assert (= (and b!129223 res!62369) b!129210))

(assert (= (and b!129209 condMapEmpty!4570) mapIsEmpty!4570))

(assert (= (and b!129209 (not condMapEmpty!4570)) mapNonEmpty!4570))

(get-info :version)

(assert (= (and mapNonEmpty!4570 ((_ is ValueCellFull!1086) mapValue!4570)) b!129221))

(assert (= (and b!129209 ((_ is ValueCellFull!1086) mapDefault!4569)) b!129216))

(assert (= b!129225 b!129209))

(assert (= b!129212 b!129225))

(assert (= b!129218 b!129212))

(assert (= start!13962 b!129218))

(assert (= (and b!129219 condMapEmpty!4569) mapIsEmpty!4569))

(assert (= (and b!129219 (not condMapEmpty!4569)) mapNonEmpty!4569))

(assert (= (and mapNonEmpty!4569 ((_ is ValueCellFull!1086) mapValue!4569)) b!129214))

(assert (= (and b!129219 ((_ is ValueCellFull!1086) mapDefault!4570)) b!129220))

(assert (= b!129213 b!129219))

(assert (= start!13962 b!129213))

(declare-fun b_lambda!5735 () Bool)

(assert (=> (not b_lambda!5735) (not b!129222)))

(declare-fun t!6104 () Bool)

(declare-fun tb!2361 () Bool)

(assert (=> (and b!129225 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))) t!6104) tb!2361))

(declare-fun result!3907 () Bool)

(assert (=> tb!2361 (= result!3907 tp_is_empty!2859)))

(assert (=> b!129222 t!6104))

(declare-fun b_and!7995 () Bool)

(assert (= b_and!7991 (and (=> t!6104 result!3907) b_and!7995)))

(declare-fun t!6106 () Bool)

(declare-fun tb!2363 () Bool)

(assert (=> (and b!129213 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))) t!6106) tb!2363))

(declare-fun result!3911 () Bool)

(assert (= result!3911 result!3907))

(assert (=> b!129222 t!6106))

(declare-fun b_and!7997 () Bool)

(assert (= b_and!7993 (and (=> t!6106 result!3911) b_and!7997)))

(declare-fun m!151761 () Bool)

(assert (=> mapNonEmpty!4570 m!151761))

(declare-fun m!151763 () Bool)

(assert (=> b!129222 m!151763))

(declare-fun m!151765 () Bool)

(assert (=> b!129222 m!151765))

(declare-fun m!151767 () Bool)

(assert (=> b!129222 m!151767))

(declare-fun m!151769 () Bool)

(assert (=> b!129222 m!151769))

(assert (=> b!129222 m!151769))

(declare-fun m!151771 () Bool)

(assert (=> b!129222 m!151771))

(assert (=> b!129222 m!151765))

(assert (=> b!129222 m!151769))

(assert (=> b!129222 m!151767))

(declare-fun m!151773 () Bool)

(assert (=> b!129222 m!151773))

(assert (=> b!129222 m!151763))

(declare-fun m!151775 () Bool)

(assert (=> mapNonEmpty!4569 m!151775))

(assert (=> b!129224 m!151769))

(declare-fun m!151777 () Bool)

(assert (=> b!129224 m!151777))

(declare-fun m!151779 () Bool)

(assert (=> b!129224 m!151779))

(declare-fun m!151781 () Bool)

(assert (=> b!129223 m!151781))

(declare-fun m!151783 () Bool)

(assert (=> b!129225 m!151783))

(declare-fun m!151785 () Bool)

(assert (=> b!129225 m!151785))

(declare-fun m!151787 () Bool)

(assert (=> start!13962 m!151787))

(declare-fun m!151789 () Bool)

(assert (=> b!129215 m!151789))

(declare-fun m!151791 () Bool)

(assert (=> b!129213 m!151791))

(declare-fun m!151793 () Bool)

(assert (=> b!129213 m!151793))

(check-sat (not b!129223) b_and!7997 (not mapNonEmpty!4570) (not b!129225) (not mapNonEmpty!4569) (not b_next!2885) tp_is_empty!2859 (not b!129224) (not b_next!2887) (not b!129222) (not b!129215) (not start!13962) (not b!129213) (not b_lambda!5735) b_and!7995)
(check-sat b_and!7995 b_and!7997 (not b_next!2885) (not b_next!2887))
(get-model)

(declare-fun b_lambda!5739 () Bool)

(assert (= b_lambda!5735 (or (and b!129225 b_free!2885) (and b!129213 b_free!2887 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))))) b_lambda!5739)))

(check-sat (not b!129223) b_and!7997 (not b!129225) b_and!7995 (not mapNonEmpty!4569) (not b_next!2885) tp_is_empty!2859 (not b!129224) (not b_next!2887) (not b!129222) (not b_lambda!5739) (not mapNonEmpty!4570) (not b!129215) (not start!13962) (not b!129213))
(check-sat b_and!7995 b_and!7997 (not b_next!2885) (not b_next!2887))
(get-model)

(declare-fun d!39215 () Bool)

(declare-fun res!62401 () Bool)

(declare-fun e!84406 () Bool)

(assert (=> d!39215 (=> (not res!62401) (not e!84406))))

(declare-fun simpleValid!89 (LongMapFixedSize!1080) Bool)

(assert (=> d!39215 (= res!62401 (simpleValid!89 newMap!16))))

(assert (=> d!39215 (= (valid!515 newMap!16) e!84406)))

(declare-fun b!129287 () Bool)

(declare-fun res!62402 () Bool)

(assert (=> b!129287 (=> (not res!62402) (not e!84406))))

(declare-fun arrayCountValidKeys!0 (array!4739 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!129287 (= res!62402 (= (arrayCountValidKeys!0 (_keys!4565 newMap!16) #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (_size!589 newMap!16)))))

(declare-fun b!129288 () Bool)

(declare-fun res!62403 () Bool)

(assert (=> b!129288 (=> (not res!62403) (not e!84406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4739 (_ BitVec 32)) Bool)

(assert (=> b!129288 (= res!62403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun b!129289 () Bool)

(declare-datatypes ((List!1709 0))(
  ( (Nil!1706) (Cons!1705 (h!2309 (_ BitVec 64)) (t!6112 List!1709)) )
))
(declare-fun arrayNoDuplicates!0 (array!4739 (_ BitVec 32) List!1709) Bool)

(assert (=> b!129289 (= e!84406 (arrayNoDuplicates!0 (_keys!4565 newMap!16) #b00000000000000000000000000000000 Nil!1706))))

(assert (= (and d!39215 res!62401) b!129287))

(assert (= (and b!129287 res!62402) b!129288))

(assert (= (and b!129288 res!62403) b!129289))

(declare-fun m!151829 () Bool)

(assert (=> d!39215 m!151829))

(declare-fun m!151831 () Bool)

(assert (=> b!129287 m!151831))

(declare-fun m!151833 () Bool)

(assert (=> b!129288 m!151833))

(declare-fun m!151835 () Bool)

(assert (=> b!129289 m!151835))

(assert (=> b!129215 d!39215))

(declare-fun d!39217 () Bool)

(assert (=> d!39217 (= (valid!514 thiss!992) (valid!515 (v!3162 (underlying!448 thiss!992))))))

(declare-fun bs!5363 () Bool)

(assert (= bs!5363 d!39217))

(declare-fun m!151837 () Bool)

(assert (=> bs!5363 m!151837))

(assert (=> start!13962 d!39217))

(declare-fun d!39219 () Bool)

(assert (=> d!39219 (= (map!1398 newMap!16) (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun bs!5364 () Bool)

(assert (= bs!5364 d!39219))

(declare-fun m!151839 () Bool)

(assert (=> bs!5364 m!151839))

(assert (=> b!129224 d!39219))

(declare-fun b!129332 () Bool)

(declare-fun e!84443 () Bool)

(declare-fun lt!67067 () ListLongMap!1697)

(declare-fun apply!113 (ListLongMap!1697 (_ BitVec 64)) V!3459)

(assert (=> b!129332 (= e!84443 (= (apply!113 lt!67067 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129332 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2510 (_values!2807 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> b!129332 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!129333 () Bool)

(declare-fun e!84435 () Bool)

(declare-fun e!84442 () Bool)

(assert (=> b!129333 (= e!84435 e!84442)))

(declare-fun res!62428 () Bool)

(declare-fun call!14004 () Bool)

(assert (=> b!129333 (= res!62428 call!14004)))

(assert (=> b!129333 (=> (not res!62428) (not e!84442))))

(declare-fun b!129334 () Bool)

(declare-fun e!84444 () Bool)

(declare-fun call!14005 () Bool)

(assert (=> b!129334 (= e!84444 (not call!14005))))

(declare-fun bm!13997 () Bool)

(assert (=> bm!13997 (= call!14005 (contains!889 lt!67067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129335 () Bool)

(declare-datatypes ((Unit!4039 0))(
  ( (Unit!4040) )
))
(declare-fun e!84445 () Unit!4039)

(declare-fun lt!67077 () Unit!4039)

(assert (=> b!129335 (= e!84445 lt!67077)))

(declare-fun lt!67079 () ListLongMap!1697)

(declare-fun getCurrentListMapNoExtraKeys!138 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 32) Int) ListLongMap!1697)

(assert (=> b!129335 (= lt!67079 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun lt!67075 () (_ BitVec 64))

(assert (=> b!129335 (= lt!67075 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67068 () (_ BitVec 64))

(assert (=> b!129335 (= lt!67068 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!67074 () Unit!4039)

(declare-fun addStillContains!89 (ListLongMap!1697 (_ BitVec 64) V!3459 (_ BitVec 64)) Unit!4039)

(assert (=> b!129335 (= lt!67074 (addStillContains!89 lt!67079 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67068))))

(declare-fun +!172 (ListLongMap!1697 tuple2!2608) ListLongMap!1697)

(assert (=> b!129335 (contains!889 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67068)))

(declare-fun lt!67081 () Unit!4039)

(assert (=> b!129335 (= lt!67081 lt!67074)))

(declare-fun lt!67069 () ListLongMap!1697)

(assert (=> b!129335 (= lt!67069 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun lt!67072 () (_ BitVec 64))

(assert (=> b!129335 (= lt!67072 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67063 () (_ BitVec 64))

(assert (=> b!129335 (= lt!67063 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!67078 () Unit!4039)

(declare-fun addApplyDifferent!89 (ListLongMap!1697 (_ BitVec 64) V!3459 (_ BitVec 64)) Unit!4039)

(assert (=> b!129335 (= lt!67078 (addApplyDifferent!89 lt!67069 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67063))))

(assert (=> b!129335 (= (apply!113 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67063) (apply!113 lt!67069 lt!67063))))

(declare-fun lt!67076 () Unit!4039)

(assert (=> b!129335 (= lt!67076 lt!67078)))

(declare-fun lt!67061 () ListLongMap!1697)

(assert (=> b!129335 (= lt!67061 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun lt!67064 () (_ BitVec 64))

(assert (=> b!129335 (= lt!67064 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67065 () (_ BitVec 64))

(assert (=> b!129335 (= lt!67065 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!67062 () Unit!4039)

(assert (=> b!129335 (= lt!67062 (addApplyDifferent!89 lt!67061 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67065))))

(assert (=> b!129335 (= (apply!113 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67065) (apply!113 lt!67061 lt!67065))))

(declare-fun lt!67073 () Unit!4039)

(assert (=> b!129335 (= lt!67073 lt!67062)))

(declare-fun lt!67071 () ListLongMap!1697)

(assert (=> b!129335 (= lt!67071 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun lt!67080 () (_ BitVec 64))

(assert (=> b!129335 (= lt!67080 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67066 () (_ BitVec 64))

(assert (=> b!129335 (= lt!67066 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!129335 (= lt!67077 (addApplyDifferent!89 lt!67071 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67066))))

(assert (=> b!129335 (= (apply!113 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67066) (apply!113 lt!67071 lt!67066))))

(declare-fun b!129336 () Bool)

(declare-fun res!62430 () Bool)

(declare-fun e!84436 () Bool)

(assert (=> b!129336 (=> (not res!62430) (not e!84436))))

(assert (=> b!129336 (= res!62430 e!84444)))

(declare-fun c!23757 () Bool)

(assert (=> b!129336 (= c!23757 (not (= (bvand (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129337 () Bool)

(declare-fun e!84433 () ListLongMap!1697)

(declare-fun call!14003 () ListLongMap!1697)

(assert (=> b!129337 (= e!84433 call!14003)))

(declare-fun b!129338 () Bool)

(declare-fun res!62429 () Bool)

(assert (=> b!129338 (=> (not res!62429) (not e!84436))))

(declare-fun e!84437 () Bool)

(assert (=> b!129338 (= res!62429 e!84437)))

(declare-fun res!62425 () Bool)

(assert (=> b!129338 (=> res!62425 e!84437)))

(declare-fun e!84434 () Bool)

(assert (=> b!129338 (= res!62425 (not e!84434))))

(declare-fun res!62423 () Bool)

(assert (=> b!129338 (=> (not res!62423) (not e!84434))))

(assert (=> b!129338 (= res!62423 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun bm!13998 () Bool)

(declare-fun call!14001 () ListLongMap!1697)

(declare-fun call!14000 () ListLongMap!1697)

(assert (=> bm!13998 (= call!14001 call!14000)))

(declare-fun d!39221 () Bool)

(assert (=> d!39221 e!84436))

(declare-fun res!62426 () Bool)

(assert (=> d!39221 (=> (not res!62426) (not e!84436))))

(assert (=> d!39221 (= res!62426 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun lt!67082 () ListLongMap!1697)

(assert (=> d!39221 (= lt!67067 lt!67082)))

(declare-fun lt!67070 () Unit!4039)

(assert (=> d!39221 (= lt!67070 e!84445)))

(declare-fun c!23758 () Bool)

(declare-fun e!84440 () Bool)

(assert (=> d!39221 (= c!23758 e!84440)))

(declare-fun res!62427 () Bool)

(assert (=> d!39221 (=> (not res!62427) (not e!84440))))

(assert (=> d!39221 (= res!62427 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun e!84438 () ListLongMap!1697)

(assert (=> d!39221 (= lt!67082 e!84438)))

(declare-fun c!23759 () Bool)

(assert (=> d!39221 (= c!23759 (and (not (= (bvand (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39221 (validMask!0 (mask!7102 (v!3162 (underlying!448 thiss!992))))))

(assert (=> d!39221 (= (getCurrentListMap!541 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))) lt!67067)))

(declare-fun b!129339 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!129339 (= e!84440 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129340 () Bool)

(declare-fun e!84441 () ListLongMap!1697)

(declare-fun call!14006 () ListLongMap!1697)

(assert (=> b!129340 (= e!84441 call!14006)))

(declare-fun bm!13999 () Bool)

(assert (=> bm!13999 (= call!14004 (contains!889 lt!67067 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129341 () Bool)

(assert (=> b!129341 (= e!84437 e!84443)))

(declare-fun res!62424 () Bool)

(assert (=> b!129341 (=> (not res!62424) (not e!84443))))

(assert (=> b!129341 (= res!62424 (contains!889 lt!67067 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!129342 () Bool)

(declare-fun c!23761 () Bool)

(assert (=> b!129342 (= c!23761 (and (not (= (bvand (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129342 (= e!84441 e!84433)))

(declare-fun b!129343 () Bool)

(assert (=> b!129343 (= e!84436 e!84435)))

(declare-fun c!23756 () Bool)

(assert (=> b!129343 (= c!23756 (not (= (bvand (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129344 () Bool)

(declare-fun Unit!4041 () Unit!4039)

(assert (=> b!129344 (= e!84445 Unit!4041)))

(declare-fun bm!14000 () Bool)

(assert (=> bm!14000 (= call!14000 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!129345 () Bool)

(assert (=> b!129345 (= e!84438 e!84441)))

(declare-fun c!23760 () Bool)

(assert (=> b!129345 (= c!23760 (and (not (= (bvand (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14001 () Bool)

(declare-fun call!14002 () ListLongMap!1697)

(assert (=> bm!14001 (= call!14002 (+!172 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)) (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!129346 () Bool)

(assert (=> b!129346 (= e!84434 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129347 () Bool)

(assert (=> b!129347 (= e!84442 (= (apply!113 lt!67067 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!129348 () Bool)

(declare-fun e!84439 () Bool)

(assert (=> b!129348 (= e!84444 e!84439)))

(declare-fun res!62422 () Bool)

(assert (=> b!129348 (= res!62422 call!14005)))

(assert (=> b!129348 (=> (not res!62422) (not e!84439))))

(declare-fun bm!14002 () Bool)

(assert (=> bm!14002 (= call!14003 call!14001)))

(declare-fun bm!14003 () Bool)

(assert (=> bm!14003 (= call!14006 call!14002)))

(declare-fun b!129349 () Bool)

(assert (=> b!129349 (= e!84433 call!14006)))

(declare-fun b!129350 () Bool)

(assert (=> b!129350 (= e!84439 (= (apply!113 lt!67067 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!129351 () Bool)

(assert (=> b!129351 (= e!84438 (+!172 call!14002 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!129352 () Bool)

(assert (=> b!129352 (= e!84435 (not call!14004))))

(assert (= (and d!39221 c!23759) b!129351))

(assert (= (and d!39221 (not c!23759)) b!129345))

(assert (= (and b!129345 c!23760) b!129340))

(assert (= (and b!129345 (not c!23760)) b!129342))

(assert (= (and b!129342 c!23761) b!129349))

(assert (= (and b!129342 (not c!23761)) b!129337))

(assert (= (or b!129349 b!129337) bm!14002))

(assert (= (or b!129340 bm!14002) bm!13998))

(assert (= (or b!129340 b!129349) bm!14003))

(assert (= (or b!129351 bm!13998) bm!14000))

(assert (= (or b!129351 bm!14003) bm!14001))

(assert (= (and d!39221 res!62427) b!129339))

(assert (= (and d!39221 c!23758) b!129335))

(assert (= (and d!39221 (not c!23758)) b!129344))

(assert (= (and d!39221 res!62426) b!129338))

(assert (= (and b!129338 res!62423) b!129346))

(assert (= (and b!129338 (not res!62425)) b!129341))

(assert (= (and b!129341 res!62424) b!129332))

(assert (= (and b!129338 res!62429) b!129336))

(assert (= (and b!129336 c!23757) b!129348))

(assert (= (and b!129336 (not c!23757)) b!129334))

(assert (= (and b!129348 res!62422) b!129350))

(assert (= (or b!129348 b!129334) bm!13997))

(assert (= (and b!129336 res!62430) b!129343))

(assert (= (and b!129343 c!23756) b!129333))

(assert (= (and b!129343 (not c!23756)) b!129352))

(assert (= (and b!129333 res!62428) b!129347))

(assert (= (or b!129333 b!129352) bm!13999))

(declare-fun b_lambda!5741 () Bool)

(assert (=> (not b_lambda!5741) (not b!129332)))

(assert (=> b!129332 t!6104))

(declare-fun b_and!8007 () Bool)

(assert (= b_and!7995 (and (=> t!6104 result!3907) b_and!8007)))

(assert (=> b!129332 t!6106))

(declare-fun b_and!8009 () Bool)

(assert (= b_and!7997 (and (=> t!6106 result!3911) b_and!8009)))

(declare-fun m!151841 () Bool)

(assert (=> bm!14000 m!151841))

(declare-fun m!151843 () Bool)

(assert (=> bm!13999 m!151843))

(declare-fun m!151845 () Bool)

(assert (=> bm!14001 m!151845))

(declare-fun m!151847 () Bool)

(assert (=> b!129332 m!151847))

(assert (=> b!129332 m!151765))

(declare-fun m!151849 () Bool)

(assert (=> b!129332 m!151849))

(declare-fun m!151851 () Bool)

(assert (=> b!129332 m!151851))

(assert (=> b!129332 m!151851))

(declare-fun m!151853 () Bool)

(assert (=> b!129332 m!151853))

(assert (=> b!129332 m!151847))

(assert (=> b!129332 m!151765))

(declare-fun m!151855 () Bool)

(assert (=> b!129350 m!151855))

(assert (=> b!129346 m!151851))

(assert (=> b!129346 m!151851))

(declare-fun m!151857 () Bool)

(assert (=> b!129346 m!151857))

(assert (=> b!129339 m!151851))

(assert (=> b!129339 m!151851))

(assert (=> b!129339 m!151857))

(assert (=> d!39221 m!151781))

(declare-fun m!151859 () Bool)

(assert (=> b!129347 m!151859))

(declare-fun m!151861 () Bool)

(assert (=> b!129351 m!151861))

(declare-fun m!151863 () Bool)

(assert (=> bm!13997 m!151863))

(assert (=> b!129341 m!151851))

(assert (=> b!129341 m!151851))

(declare-fun m!151865 () Bool)

(assert (=> b!129341 m!151865))

(declare-fun m!151867 () Bool)

(assert (=> b!129335 m!151867))

(declare-fun m!151869 () Bool)

(assert (=> b!129335 m!151869))

(declare-fun m!151871 () Bool)

(assert (=> b!129335 m!151871))

(declare-fun m!151873 () Bool)

(assert (=> b!129335 m!151873))

(assert (=> b!129335 m!151841))

(declare-fun m!151875 () Bool)

(assert (=> b!129335 m!151875))

(declare-fun m!151877 () Bool)

(assert (=> b!129335 m!151877))

(declare-fun m!151879 () Bool)

(assert (=> b!129335 m!151879))

(declare-fun m!151881 () Bool)

(assert (=> b!129335 m!151881))

(declare-fun m!151883 () Bool)

(assert (=> b!129335 m!151883))

(assert (=> b!129335 m!151851))

(declare-fun m!151885 () Bool)

(assert (=> b!129335 m!151885))

(declare-fun m!151887 () Bool)

(assert (=> b!129335 m!151887))

(declare-fun m!151889 () Bool)

(assert (=> b!129335 m!151889))

(assert (=> b!129335 m!151875))

(declare-fun m!151891 () Bool)

(assert (=> b!129335 m!151891))

(declare-fun m!151893 () Bool)

(assert (=> b!129335 m!151893))

(assert (=> b!129335 m!151881))

(assert (=> b!129335 m!151887))

(assert (=> b!129335 m!151869))

(declare-fun m!151895 () Bool)

(assert (=> b!129335 m!151895))

(assert (=> b!129224 d!39221))

(declare-fun d!39223 () Bool)

(assert (=> d!39223 (= (array_inv!1411 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvsge (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!129225 d!39223))

(declare-fun d!39225 () Bool)

(assert (=> d!39225 (= (array_inv!1412 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvsge (size!2510 (_values!2807 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!129225 d!39225))

(declare-fun d!39227 () Bool)

(declare-fun e!84450 () Bool)

(assert (=> d!39227 e!84450))

(declare-fun res!62433 () Bool)

(assert (=> d!39227 (=> res!62433 e!84450)))

(declare-fun lt!67094 () Bool)

(assert (=> d!39227 (= res!62433 (not lt!67094))))

(declare-fun lt!67093 () Bool)

(assert (=> d!39227 (= lt!67094 lt!67093)))

(declare-fun lt!67092 () Unit!4039)

(declare-fun e!84451 () Unit!4039)

(assert (=> d!39227 (= lt!67092 e!84451)))

(declare-fun c!23764 () Bool)

(assert (=> d!39227 (= c!23764 lt!67093)))

(declare-fun containsKey!173 (List!1708 (_ BitVec 64)) Bool)

(assert (=> d!39227 (= lt!67093 (containsKey!173 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39227 (= (contains!889 lt!67005 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67094)))

(declare-fun b!129359 () Bool)

(declare-fun lt!67091 () Unit!4039)

(assert (=> b!129359 (= e!84451 lt!67091)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!121 (List!1708 (_ BitVec 64)) Unit!4039)

(assert (=> b!129359 (= lt!67091 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-datatypes ((Option!175 0))(
  ( (Some!174 (v!3165 V!3459)) (None!173) )
))
(declare-fun isDefined!122 (Option!175) Bool)

(declare-fun getValueByKey!169 (List!1708 (_ BitVec 64)) Option!175)

(assert (=> b!129359 (isDefined!122 (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129360 () Bool)

(declare-fun Unit!4042 () Unit!4039)

(assert (=> b!129360 (= e!84451 Unit!4042)))

(declare-fun b!129361 () Bool)

(assert (=> b!129361 (= e!84450 (isDefined!122 (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (= (and d!39227 c!23764) b!129359))

(assert (= (and d!39227 (not c!23764)) b!129360))

(assert (= (and d!39227 (not res!62433)) b!129361))

(assert (=> d!39227 m!151769))

(declare-fun m!151897 () Bool)

(assert (=> d!39227 m!151897))

(assert (=> b!129359 m!151769))

(declare-fun m!151899 () Bool)

(assert (=> b!129359 m!151899))

(assert (=> b!129359 m!151769))

(declare-fun m!151901 () Bool)

(assert (=> b!129359 m!151901))

(assert (=> b!129359 m!151901))

(declare-fun m!151903 () Bool)

(assert (=> b!129359 m!151903))

(assert (=> b!129361 m!151769))

(assert (=> b!129361 m!151901))

(assert (=> b!129361 m!151901))

(assert (=> b!129361 m!151903))

(assert (=> b!129222 d!39227))

(declare-fun b!129442 () Bool)

(declare-fun res!62471 () Bool)

(declare-datatypes ((SeekEntryResult!272 0))(
  ( (MissingZero!272 (index!3245 (_ BitVec 32))) (Found!272 (index!3246 (_ BitVec 32))) (Intermediate!272 (undefined!1084 Bool) (index!3247 (_ BitVec 32)) (x!15267 (_ BitVec 32))) (Undefined!272) (MissingVacant!272 (index!3248 (_ BitVec 32))) )
))
(declare-fun lt!67168 () SeekEntryResult!272)

(assert (=> b!129442 (= res!62471 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3248 lt!67168)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84499 () Bool)

(assert (=> b!129442 (=> (not res!62471) (not e!84499))))

(declare-fun call!14076 () SeekEntryResult!272)

(declare-fun bm!14052 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4739 (_ BitVec 32)) SeekEntryResult!272)

(assert (=> bm!14052 (= call!14076 (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun bm!14053 () Bool)

(declare-fun call!14062 () Bool)

(declare-fun call!14056 () Bool)

(assert (=> bm!14053 (= call!14062 call!14056)))

(declare-fun b!129443 () Bool)

(declare-fun e!84508 () tuple2!2610)

(declare-fun e!84513 () tuple2!2610)

(assert (=> b!129443 (= e!84508 e!84513)))

(declare-fun lt!67161 () SeekEntryResult!272)

(assert (=> b!129443 (= lt!67161 (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun c!23795 () Bool)

(assert (=> b!129443 (= c!23795 ((_ is Undefined!272) lt!67161))))

(declare-fun bm!14054 () Bool)

(declare-fun call!14060 () Bool)

(assert (=> bm!14054 (= call!14060 call!14056)))

(declare-fun b!129444 () Bool)

(declare-fun e!84494 () Unit!4039)

(declare-fun Unit!4043 () Unit!4039)

(assert (=> b!129444 (= e!84494 Unit!4043)))

(declare-fun lt!67158 () Unit!4039)

(declare-fun call!14070 () Unit!4039)

(assert (=> b!129444 (= lt!67158 call!14070)))

(declare-fun lt!67153 () SeekEntryResult!272)

(declare-fun call!14065 () SeekEntryResult!272)

(assert (=> b!129444 (= lt!67153 call!14065)))

(declare-fun res!62462 () Bool)

(assert (=> b!129444 (= res!62462 ((_ is Found!272) lt!67153))))

(declare-fun e!84498 () Bool)

(assert (=> b!129444 (=> (not res!62462) (not e!84498))))

(assert (=> b!129444 e!84498))

(declare-fun lt!67163 () Unit!4039)

(assert (=> b!129444 (= lt!67163 lt!67158)))

(assert (=> b!129444 false))

(declare-fun b!129445 () Bool)

(declare-fun res!62466 () Bool)

(declare-fun e!84502 () Bool)

(assert (=> b!129445 (=> (not res!62466) (not e!84502))))

(declare-fun call!14061 () Bool)

(assert (=> b!129445 (= res!62466 call!14061)))

(declare-fun e!84511 () Bool)

(assert (=> b!129445 (= e!84511 e!84502)))

(declare-fun call!14069 () ListLongMap!1697)

(declare-fun bm!14055 () Bool)

(assert (=> bm!14055 (= call!14069 (getCurrentListMap!541 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun bm!14056 () Bool)

(declare-fun c!23800 () Bool)

(declare-fun call!14055 () ListLongMap!1697)

(declare-fun call!14077 () ListLongMap!1697)

(declare-fun c!23802 () Bool)

(declare-fun call!14057 () ListLongMap!1697)

(assert (=> bm!14056 (= call!14055 (+!172 (ite c!23800 call!14057 call!14077) (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129446 () Bool)

(declare-fun lt!67175 () Unit!4039)

(assert (=> b!129446 (= e!84494 lt!67175)))

(declare-fun call!14066 () Unit!4039)

(assert (=> b!129446 (= lt!67175 call!14066)))

(assert (=> b!129446 (= lt!67168 call!14065)))

(declare-fun c!23797 () Bool)

(assert (=> b!129446 (= c!23797 ((_ is MissingZero!272) lt!67168))))

(declare-fun e!84496 () Bool)

(assert (=> b!129446 e!84496))

(declare-fun b!129447 () Bool)

(declare-fun c!23791 () Bool)

(assert (=> b!129447 (= c!23791 ((_ is MissingVacant!272) lt!67168))))

(declare-fun e!84495 () Bool)

(assert (=> b!129447 (= e!84496 e!84495)))

(declare-fun bm!14057 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!58 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 64) Int) Unit!4039)

(assert (=> bm!14057 (= call!14070 (lemmaInListMapThenSeekEntryOrOpenFindsIt!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)))))

(declare-fun b!129448 () Bool)

(declare-fun e!84506 () tuple2!2610)

(assert (=> b!129448 (= e!84508 e!84506)))

(assert (=> b!129448 (= c!23802 (= (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129449 () Bool)

(declare-fun e!84500 () ListLongMap!1697)

(declare-fun call!14073 () ListLongMap!1697)

(assert (=> b!129449 (= e!84500 call!14073)))

(declare-fun bm!14058 () Bool)

(declare-fun call!14075 () Bool)

(declare-fun call!14072 () Bool)

(assert (=> bm!14058 (= call!14075 call!14072)))

(declare-fun b!129450 () Bool)

(assert (=> b!129450 (= e!84495 ((_ is Undefined!272) lt!67168))))

(declare-fun bm!14059 () Bool)

(declare-fun call!14067 () Bool)

(declare-fun call!14074 () Bool)

(assert (=> bm!14059 (= call!14067 call!14074)))

(declare-fun b!129451 () Bool)

(declare-fun e!84507 () Bool)

(assert (=> b!129451 (= e!84507 (not call!14060))))

(declare-fun b!129452 () Bool)

(assert (=> b!129452 (= e!84499 (not call!14062))))

(declare-fun lt!67167 () SeekEntryResult!272)

(declare-fun b!129453 () Bool)

(declare-fun e!84501 () Bool)

(assert (=> b!129453 (= e!84501 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67167)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129454 () Bool)

(declare-fun lt!67170 () tuple2!2610)

(declare-fun call!14063 () tuple2!2610)

(assert (=> b!129454 (= lt!67170 call!14063)))

(declare-fun e!84497 () tuple2!2610)

(assert (=> b!129454 (= e!84497 (tuple2!2611 (_1!1316 lt!67170) (_2!1316 lt!67170)))))

(declare-fun b!129455 () Bool)

(declare-fun res!62470 () Bool)

(declare-fun e!84503 () Bool)

(assert (=> b!129455 (=> (not res!62470) (not e!84503))))

(assert (=> b!129455 (= res!62470 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3245 lt!67168)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14060 () Bool)

(assert (=> bm!14060 (= call!14072 call!14074)))

(declare-fun b!129456 () Bool)

(declare-fun lt!67165 () Unit!4039)

(declare-fun lt!67150 () Unit!4039)

(assert (=> b!129456 (= lt!67165 lt!67150)))

(declare-fun call!14064 () ListLongMap!1697)

(declare-fun call!14071 () ListLongMap!1697)

(assert (=> b!129456 (= call!14064 call!14071)))

(declare-fun lt!67172 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!58 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 V!3459 Int) Unit!4039)

(assert (=> b!129456 (= lt!67150 (lemmaChangeZeroKeyThenAddPairToListMap!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) lt!67172 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) (defaultEntry!2824 newMap!16)))))

(assert (=> b!129456 (= lt!67172 (bvor (extraKeys!2597 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!129456 (= e!84506 (tuple2!2611 true (LongMapFixedSize!1081 (defaultEntry!2824 newMap!16) (mask!7102 newMap!16) (bvor (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) (_size!589 newMap!16) (_keys!4565 newMap!16) (_values!2807 newMap!16) (_vacant!589 newMap!16))))))

(declare-fun b!129457 () Bool)

(assert (=> b!129457 (= e!84502 (not call!14060))))

(declare-fun b!129458 () Bool)

(declare-fun lt!67156 () Unit!4039)

(declare-fun lt!67173 () Unit!4039)

(assert (=> b!129458 (= lt!67156 lt!67173)))

(assert (=> b!129458 (= call!14064 call!14071)))

(declare-fun lt!67164 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!58 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 V!3459 Int) Unit!4039)

(assert (=> b!129458 (= lt!67173 (lemmaChangeLongMinValueKeyThenAddPairToListMap!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)))))

(assert (=> b!129458 (= lt!67164 (bvor (extraKeys!2597 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!129458 (= e!84506 (tuple2!2611 true (LongMapFixedSize!1081 (defaultEntry!2824 newMap!16) (mask!7102 newMap!16) (bvor (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!589 newMap!16) (_keys!4565 newMap!16) (_values!2807 newMap!16) (_vacant!589 newMap!16))))))

(declare-fun b!129459 () Bool)

(declare-fun e!84510 () Bool)

(declare-fun e!84505 () Bool)

(assert (=> b!129459 (= e!84510 e!84505)))

(declare-fun res!62467 () Bool)

(declare-fun call!14078 () ListLongMap!1697)

(assert (=> b!129459 (= res!62467 (contains!889 call!14078 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!129459 (=> (not res!62467) (not e!84505))))

(declare-fun b!129460 () Bool)

(declare-fun e!84509 () Bool)

(assert (=> b!129460 (= e!84509 e!84507)))

(declare-fun res!62472 () Bool)

(assert (=> b!129460 (= res!62472 call!14061)))

(assert (=> b!129460 (=> (not res!62472) (not e!84507))))

(declare-fun b!129461 () Bool)

(declare-fun e!84504 () tuple2!2610)

(assert (=> b!129461 (= e!84504 e!84497)))

(declare-fun c!23798 () Bool)

(assert (=> b!129461 (= c!23798 ((_ is MissingZero!272) lt!67161))))

(declare-fun bm!14061 () Bool)

(assert (=> bm!14061 (= call!14065 call!14076)))

(declare-fun b!129462 () Bool)

(declare-fun res!62473 () Bool)

(assert (=> b!129462 (=> (not res!62473) (not e!84503))))

(assert (=> b!129462 (= res!62473 call!14075)))

(assert (=> b!129462 (= e!84496 e!84503)))

(declare-fun bm!14062 () Bool)

(assert (=> bm!14062 (= call!14064 call!14055)))

(declare-fun b!129463 () Bool)

(assert (=> b!129463 (= e!84500 call!14069)))

(declare-fun b!129464 () Bool)

(declare-fun res!62475 () Bool)

(assert (=> b!129464 (= res!62475 call!14072)))

(assert (=> b!129464 (=> (not res!62475) (not e!84498))))

(declare-fun b!129465 () Bool)

(declare-fun c!23793 () Bool)

(declare-fun lt!67162 () SeekEntryResult!272)

(assert (=> b!129465 (= c!23793 ((_ is MissingVacant!272) lt!67162))))

(assert (=> b!129465 (= e!84511 e!84509)))

(declare-fun lt!67149 () array!4741)

(declare-fun bm!14063 () Bool)

(assert (=> bm!14063 (= call!14073 (getCurrentListMap!541 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!129466 () Bool)

(assert (=> b!129466 (= e!84495 e!84499)))

(declare-fun res!62474 () Bool)

(assert (=> b!129466 (= res!62474 call!14075)))

(assert (=> b!129466 (=> (not res!62474) (not e!84499))))

(declare-fun call!14068 () ListLongMap!1697)

(declare-fun b!129467 () Bool)

(assert (=> b!129467 (= e!84505 (= call!14078 (+!172 call!14068 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!14064 () Bool)

(declare-fun call!14058 () SeekEntryResult!272)

(assert (=> bm!14064 (= call!14058 call!14076)))

(declare-fun b!129468 () Bool)

(declare-fun e!84512 () Unit!4039)

(declare-fun lt!67155 () Unit!4039)

(assert (=> b!129468 (= e!84512 lt!67155)))

(assert (=> b!129468 (= lt!67155 call!14070)))

(assert (=> b!129468 (= lt!67167 call!14058)))

(declare-fun res!62465 () Bool)

(assert (=> b!129468 (= res!62465 ((_ is Found!272) lt!67167))))

(assert (=> b!129468 (=> (not res!62465) (not e!84501))))

(assert (=> b!129468 e!84501))

(declare-fun bm!14065 () Bool)

(declare-fun lt!67159 () tuple2!2610)

(assert (=> bm!14065 (= call!14078 (map!1398 (_2!1316 lt!67159)))))

(declare-fun b!129469 () Bool)

(declare-fun res!62468 () Bool)

(assert (=> b!129469 (= res!62468 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3248 lt!67162)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129469 (=> (not res!62468) (not e!84507))))

(declare-fun bm!14066 () Bool)

(assert (=> bm!14066 (= call!14057 call!14077)))

(declare-fun b!129470 () Bool)

(declare-fun e!84514 () Bool)

(assert (=> b!129470 (= e!84514 e!84510)))

(declare-fun c!23796 () Bool)

(assert (=> b!129470 (= c!23796 (_1!1316 lt!67159))))

(declare-fun b!129471 () Bool)

(declare-fun lt!67157 () Unit!4039)

(assert (=> b!129471 (= lt!67157 e!84494)))

(declare-fun c!23801 () Bool)

(declare-fun call!14059 () Bool)

(assert (=> b!129471 (= c!23801 call!14059)))

(assert (=> b!129471 (= e!84513 (tuple2!2611 false newMap!16))))

(declare-fun bm!14067 () Bool)

(declare-fun c!23792 () Bool)

(declare-fun updateHelperNewKey!58 (LongMapFixedSize!1080 (_ BitVec 64) V!3459 (_ BitVec 32)) tuple2!2610)

(assert (=> bm!14067 (= call!14063 (updateHelperNewKey!58 newMap!16 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))))))

(declare-fun bm!14068 () Bool)

(assert (=> bm!14068 (= call!14061 call!14067)))

(declare-fun b!129472 () Bool)

(assert (=> b!129472 (= e!84503 (not call!14062))))

(declare-fun b!129473 () Bool)

(declare-fun res!62469 () Bool)

(assert (=> b!129473 (=> (not res!62469) (not e!84502))))

(assert (=> b!129473 (= res!62469 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3245 lt!67162)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!14069 () Bool)

(assert (=> bm!14069 (= call!14071 call!14073)))

(declare-fun bm!14070 () Bool)

(assert (=> bm!14070 (= call!14077 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!129474 () Bool)

(declare-fun Unit!4044 () Unit!4039)

(assert (=> b!129474 (= e!84512 Unit!4044)))

(declare-fun lt!67171 () Unit!4039)

(assert (=> b!129474 (= lt!67171 call!14066)))

(assert (=> b!129474 (= lt!67162 call!14058)))

(declare-fun c!23803 () Bool)

(assert (=> b!129474 (= c!23803 ((_ is MissingZero!272) lt!67162))))

(assert (=> b!129474 e!84511))

(declare-fun lt!67160 () Unit!4039)

(assert (=> b!129474 (= lt!67160 lt!67171)))

(assert (=> b!129474 false))

(declare-fun bm!14071 () Bool)

(declare-fun arrayContainsKey!0 (array!4739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!14071 (= call!14056 (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!39229 () Bool)

(assert (=> d!39229 e!84514))

(declare-fun res!62464 () Bool)

(assert (=> d!39229 (=> (not res!62464) (not e!84514))))

(assert (=> d!39229 (= res!62464 (valid!515 (_2!1316 lt!67159)))))

(assert (=> d!39229 (= lt!67159 e!84508)))

(assert (=> d!39229 (= c!23800 (= (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (bvneg (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39229 (valid!515 newMap!16)))

(assert (=> d!39229 (= (update!190 newMap!16 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!67159)))

(declare-fun b!129475 () Bool)

(declare-fun lt!67169 () Unit!4039)

(declare-fun lt!67152 () Unit!4039)

(assert (=> b!129475 (= lt!67169 lt!67152)))

(assert (=> b!129475 call!14059))

(declare-fun lemmaValidKeyInArrayIsInListMap!119 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 32) Int) Unit!4039)

(assert (=> b!129475 (= lt!67152 (lemmaValidKeyInArrayIsInListMap!119 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (index!3246 lt!67161) (defaultEntry!2824 newMap!16)))))

(assert (=> b!129475 (= lt!67149 (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))))

(declare-fun lt!67151 () Unit!4039)

(declare-fun lt!67174 () Unit!4039)

(assert (=> b!129475 (= lt!67151 lt!67174)))

(assert (=> b!129475 (= call!14055 call!14069)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!58 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 32) (_ BitVec 64) V!3459 Int) Unit!4039)

(assert (=> b!129475 (= lt!67174 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (index!3246 lt!67161) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67154 () Unit!4039)

(assert (=> b!129475 (= lt!67154 e!84512)))

(declare-fun c!23799 () Bool)

(assert (=> b!129475 (= c!23799 (contains!889 call!14077 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!129475 (= e!84497 (tuple2!2611 true (LongMapFixedSize!1081 (defaultEntry!2824 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (_size!589 newMap!16) (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (_vacant!589 newMap!16))))))

(declare-fun bm!14072 () Bool)

(assert (=> bm!14072 (= call!14068 (map!1398 newMap!16))))

(declare-fun b!129476 () Bool)

(declare-fun lt!67166 () tuple2!2610)

(assert (=> b!129476 (= e!84504 (tuple2!2611 (_1!1316 lt!67166) (_2!1316 lt!67166)))))

(assert (=> b!129476 (= lt!67166 call!14063)))

(declare-fun bm!14073 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!14073 (= call!14074 (inRange!0 (ite c!23795 (ite c!23801 (index!3246 lt!67153) (ite c!23797 (index!3245 lt!67168) (index!3248 lt!67168))) (ite c!23799 (index!3246 lt!67167) (ite c!23803 (index!3245 lt!67162) (index!3248 lt!67162)))) (mask!7102 newMap!16)))))

(declare-fun b!129477 () Bool)

(assert (=> b!129477 (= e!84510 (= call!14078 call!14068))))

(declare-fun b!129478 () Bool)

(assert (=> b!129478 (= e!84498 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67153)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129479 () Bool)

(assert (=> b!129479 (= e!84509 ((_ is Undefined!272) lt!67162))))

(declare-fun bm!14074 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!58 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 64) Int) Unit!4039)

(assert (=> bm!14074 (= call!14066 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)))))

(declare-fun bm!14075 () Bool)

(declare-fun c!23794 () Bool)

(assert (=> bm!14075 (= c!23794 c!23795)))

(assert (=> bm!14075 (= call!14059 (contains!889 e!84500 (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(declare-fun b!129480 () Bool)

(declare-fun res!62463 () Bool)

(assert (=> b!129480 (= res!62463 call!14067)))

(assert (=> b!129480 (=> (not res!62463) (not e!84501))))

(declare-fun b!129481 () Bool)

(assert (=> b!129481 (= c!23792 ((_ is MissingVacant!272) lt!67161))))

(assert (=> b!129481 (= e!84513 e!84504)))

(assert (= (and d!39229 c!23800) b!129448))

(assert (= (and d!39229 (not c!23800)) b!129443))

(assert (= (and b!129448 c!23802) b!129456))

(assert (= (and b!129448 (not c!23802)) b!129458))

(assert (= (or b!129456 b!129458) bm!14066))

(assert (= (or b!129456 b!129458) bm!14069))

(assert (= (or b!129456 b!129458) bm!14062))

(assert (= (and b!129443 c!23795) b!129471))

(assert (= (and b!129443 (not c!23795)) b!129481))

(assert (= (and b!129471 c!23801) b!129444))

(assert (= (and b!129471 (not c!23801)) b!129446))

(assert (= (and b!129444 res!62462) b!129464))

(assert (= (and b!129464 res!62475) b!129478))

(assert (= (and b!129446 c!23797) b!129462))

(assert (= (and b!129446 (not c!23797)) b!129447))

(assert (= (and b!129462 res!62473) b!129455))

(assert (= (and b!129455 res!62470) b!129472))

(assert (= (and b!129447 c!23791) b!129466))

(assert (= (and b!129447 (not c!23791)) b!129450))

(assert (= (and b!129466 res!62474) b!129442))

(assert (= (and b!129442 res!62471) b!129452))

(assert (= (or b!129462 b!129466) bm!14058))

(assert (= (or b!129472 b!129452) bm!14053))

(assert (= (or b!129464 bm!14058) bm!14060))

(assert (= (or b!129444 b!129446) bm!14061))

(assert (= (and b!129481 c!23792) b!129476))

(assert (= (and b!129481 (not c!23792)) b!129461))

(assert (= (and b!129461 c!23798) b!129454))

(assert (= (and b!129461 (not c!23798)) b!129475))

(assert (= (and b!129475 c!23799) b!129468))

(assert (= (and b!129475 (not c!23799)) b!129474))

(assert (= (and b!129468 res!62465) b!129480))

(assert (= (and b!129480 res!62463) b!129453))

(assert (= (and b!129474 c!23803) b!129445))

(assert (= (and b!129474 (not c!23803)) b!129465))

(assert (= (and b!129445 res!62466) b!129473))

(assert (= (and b!129473 res!62469) b!129457))

(assert (= (and b!129465 c!23793) b!129460))

(assert (= (and b!129465 (not c!23793)) b!129479))

(assert (= (and b!129460 res!62472) b!129469))

(assert (= (and b!129469 res!62468) b!129451))

(assert (= (or b!129445 b!129460) bm!14068))

(assert (= (or b!129457 b!129451) bm!14054))

(assert (= (or b!129480 bm!14068) bm!14059))

(assert (= (or b!129468 b!129474) bm!14064))

(assert (= (or b!129476 b!129454) bm!14067))

(assert (= (or bm!14060 bm!14059) bm!14073))

(assert (= (or b!129444 b!129468) bm!14057))

(assert (= (or b!129446 b!129474) bm!14074))

(assert (= (or bm!14053 bm!14054) bm!14071))

(assert (= (or b!129471 b!129475) bm!14055))

(assert (= (or bm!14061 bm!14064) bm!14052))

(assert (= (or b!129471 b!129475) bm!14075))

(assert (= (and bm!14075 c!23794) b!129463))

(assert (= (and bm!14075 (not c!23794)) b!129449))

(assert (= (or bm!14069 b!129449) bm!14063))

(assert (= (or bm!14066 b!129475) bm!14070))

(assert (= (or bm!14062 b!129475) bm!14056))

(assert (= (and d!39229 res!62464) b!129470))

(assert (= (and b!129470 c!23796) b!129459))

(assert (= (and b!129470 (not c!23796)) b!129477))

(assert (= (and b!129459 res!62467) b!129467))

(assert (= (or b!129467 b!129477) bm!14072))

(assert (= (or b!129459 b!129467 b!129477) bm!14065))

(declare-fun m!151905 () Bool)

(assert (=> b!129473 m!151905))

(declare-fun m!151907 () Bool)

(assert (=> bm!14075 m!151907))

(declare-fun m!151909 () Bool)

(assert (=> bm!14075 m!151909))

(declare-fun m!151911 () Bool)

(assert (=> b!129478 m!151911))

(assert (=> bm!14052 m!151769))

(declare-fun m!151913 () Bool)

(assert (=> bm!14052 m!151913))

(assert (=> bm!14057 m!151769))

(declare-fun m!151915 () Bool)

(assert (=> bm!14057 m!151915))

(declare-fun m!151917 () Bool)

(assert (=> bm!14073 m!151917))

(declare-fun m!151919 () Bool)

(assert (=> bm!14055 m!151919))

(declare-fun m!151921 () Bool)

(assert (=> bm!14055 m!151921))

(declare-fun m!151923 () Bool)

(assert (=> b!129442 m!151923))

(declare-fun m!151925 () Bool)

(assert (=> bm!14056 m!151925))

(assert (=> b!129443 m!151769))

(assert (=> b!129443 m!151913))

(assert (=> bm!14071 m!151769))

(declare-fun m!151927 () Bool)

(assert (=> bm!14071 m!151927))

(declare-fun m!151929 () Bool)

(assert (=> b!129455 m!151929))

(declare-fun m!151931 () Bool)

(assert (=> b!129467 m!151931))

(declare-fun m!151933 () Bool)

(assert (=> b!129453 m!151933))

(assert (=> bm!14074 m!151769))

(declare-fun m!151935 () Bool)

(assert (=> bm!14074 m!151935))

(assert (=> b!129458 m!151767))

(declare-fun m!151937 () Bool)

(assert (=> b!129458 m!151937))

(declare-fun m!151939 () Bool)

(assert (=> b!129469 m!151939))

(assert (=> bm!14070 m!151839))

(assert (=> bm!14072 m!151777))

(assert (=> bm!14067 m!151769))

(assert (=> bm!14067 m!151767))

(declare-fun m!151941 () Bool)

(assert (=> bm!14067 m!151941))

(assert (=> b!129459 m!151769))

(declare-fun m!151943 () Bool)

(assert (=> b!129459 m!151943))

(assert (=> b!129456 m!151767))

(declare-fun m!151945 () Bool)

(assert (=> b!129456 m!151945))

(declare-fun m!151947 () Bool)

(assert (=> bm!14065 m!151947))

(declare-fun m!151949 () Bool)

(assert (=> d!39229 m!151949))

(assert (=> d!39229 m!151789))

(declare-fun m!151951 () Bool)

(assert (=> b!129475 m!151951))

(assert (=> b!129475 m!151919))

(assert (=> b!129475 m!151769))

(assert (=> b!129475 m!151767))

(declare-fun m!151953 () Bool)

(assert (=> b!129475 m!151953))

(assert (=> b!129475 m!151769))

(declare-fun m!151955 () Bool)

(assert (=> b!129475 m!151955))

(declare-fun m!151957 () Bool)

(assert (=> bm!14063 m!151957))

(assert (=> b!129222 d!39229))

(declare-fun d!39231 () Bool)

(declare-fun c!23806 () Bool)

(assert (=> d!39231 (= c!23806 ((_ is ValueCellFull!1086) (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun e!84517 () V!3459)

(assert (=> d!39231 (= (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84517)))

(declare-fun b!129486 () Bool)

(declare-fun get!1464 (ValueCell!1086 V!3459) V!3459)

(assert (=> b!129486 (= e!84517 (get!1464 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129487 () Bool)

(declare-fun get!1465 (ValueCell!1086 V!3459) V!3459)

(assert (=> b!129487 (= e!84517 (get!1465 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39231 c!23806) b!129486))

(assert (= (and d!39231 (not c!23806)) b!129487))

(assert (=> b!129486 m!151763))

(assert (=> b!129486 m!151765))

(declare-fun m!151959 () Bool)

(assert (=> b!129486 m!151959))

(assert (=> b!129487 m!151763))

(assert (=> b!129487 m!151765))

(declare-fun m!151961 () Bool)

(assert (=> b!129487 m!151961))

(assert (=> b!129222 d!39231))

(declare-fun d!39233 () Bool)

(assert (=> d!39233 (= (array_inv!1411 (_keys!4565 newMap!16)) (bvsge (size!2509 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129213 d!39233))

(declare-fun d!39235 () Bool)

(assert (=> d!39235 (= (array_inv!1412 (_values!2807 newMap!16)) (bvsge (size!2510 (_values!2807 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129213 d!39235))

(declare-fun d!39237 () Bool)

(assert (=> d!39237 (= (validMask!0 (mask!7102 (v!3162 (underlying!448 thiss!992)))) (and (or (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000001111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000011111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000001111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000011111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000001111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000011111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000001111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000011111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000001111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000011111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000001111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000011111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000001111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000011111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000111111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000001111111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000011111111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000111111111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00001111111111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00011111111111111111111111111111) (= (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!129223 d!39237))

(declare-fun condMapEmpty!4579 () Bool)

(declare-fun mapDefault!4579 () ValueCell!1086)

(assert (=> mapNonEmpty!4570 (= condMapEmpty!4579 (= mapRest!4570 ((as const (Array (_ BitVec 32) ValueCell!1086)) mapDefault!4579)))))

(declare-fun e!84523 () Bool)

(declare-fun mapRes!4579 () Bool)

(assert (=> mapNonEmpty!4570 (= tp!11078 (and e!84523 mapRes!4579))))

(declare-fun b!129494 () Bool)

(declare-fun e!84522 () Bool)

(assert (=> b!129494 (= e!84522 tp_is_empty!2859)))

(declare-fun mapIsEmpty!4579 () Bool)

(assert (=> mapIsEmpty!4579 mapRes!4579))

(declare-fun b!129495 () Bool)

(assert (=> b!129495 (= e!84523 tp_is_empty!2859)))

(declare-fun mapNonEmpty!4579 () Bool)

(declare-fun tp!11095 () Bool)

(assert (=> mapNonEmpty!4579 (= mapRes!4579 (and tp!11095 e!84522))))

(declare-fun mapRest!4579 () (Array (_ BitVec 32) ValueCell!1086))

(declare-fun mapKey!4579 () (_ BitVec 32))

(declare-fun mapValue!4579 () ValueCell!1086)

(assert (=> mapNonEmpty!4579 (= mapRest!4570 (store mapRest!4579 mapKey!4579 mapValue!4579))))

(assert (= (and mapNonEmpty!4570 condMapEmpty!4579) mapIsEmpty!4579))

(assert (= (and mapNonEmpty!4570 (not condMapEmpty!4579)) mapNonEmpty!4579))

(assert (= (and mapNonEmpty!4579 ((_ is ValueCellFull!1086) mapValue!4579)) b!129494))

(assert (= (and mapNonEmpty!4570 ((_ is ValueCellFull!1086) mapDefault!4579)) b!129495))

(declare-fun m!151963 () Bool)

(assert (=> mapNonEmpty!4579 m!151963))

(declare-fun condMapEmpty!4580 () Bool)

(declare-fun mapDefault!4580 () ValueCell!1086)

(assert (=> mapNonEmpty!4569 (= condMapEmpty!4580 (= mapRest!4569 ((as const (Array (_ BitVec 32) ValueCell!1086)) mapDefault!4580)))))

(declare-fun e!84525 () Bool)

(declare-fun mapRes!4580 () Bool)

(assert (=> mapNonEmpty!4569 (= tp!11077 (and e!84525 mapRes!4580))))

(declare-fun b!129496 () Bool)

(declare-fun e!84524 () Bool)

(assert (=> b!129496 (= e!84524 tp_is_empty!2859)))

(declare-fun mapIsEmpty!4580 () Bool)

(assert (=> mapIsEmpty!4580 mapRes!4580))

(declare-fun b!129497 () Bool)

(assert (=> b!129497 (= e!84525 tp_is_empty!2859)))

(declare-fun mapNonEmpty!4580 () Bool)

(declare-fun tp!11096 () Bool)

(assert (=> mapNonEmpty!4580 (= mapRes!4580 (and tp!11096 e!84524))))

(declare-fun mapKey!4580 () (_ BitVec 32))

(declare-fun mapRest!4580 () (Array (_ BitVec 32) ValueCell!1086))

(declare-fun mapValue!4580 () ValueCell!1086)

(assert (=> mapNonEmpty!4580 (= mapRest!4569 (store mapRest!4580 mapKey!4580 mapValue!4580))))

(assert (= (and mapNonEmpty!4569 condMapEmpty!4580) mapIsEmpty!4580))

(assert (= (and mapNonEmpty!4569 (not condMapEmpty!4580)) mapNonEmpty!4580))

(assert (= (and mapNonEmpty!4580 ((_ is ValueCellFull!1086) mapValue!4580)) b!129496))

(assert (= (and mapNonEmpty!4569 ((_ is ValueCellFull!1086) mapDefault!4580)) b!129497))

(declare-fun m!151965 () Bool)

(assert (=> mapNonEmpty!4580 m!151965))

(declare-fun b_lambda!5743 () Bool)

(assert (= b_lambda!5741 (or (and b!129225 b_free!2885) (and b!129213 b_free!2887 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))))) b_lambda!5743)))

(check-sat (not b_lambda!5743) (not bm!14072) (not b!129487) (not b_lambda!5739) (not b!129351) (not b!129346) (not b!129339) (not b!129350) (not d!39219) (not bm!13999) (not bm!14067) (not b_next!2887) (not b!129288) (not d!39217) (not b!129287) (not bm!14063) (not b!129443) (not d!39229) (not bm!14075) (not bm!13997) (not b!129456) (not b!129361) b_and!8007 (not b!129486) (not b!129289) (not bm!14065) (not b!129359) (not bm!14073) (not d!39215) (not b!129332) (not bm!14071) (not bm!14000) (not b!129335) (not bm!14055) (not b!129347) (not d!39221) (not mapNonEmpty!4580) (not bm!14074) (not bm!14056) b_and!8009 (not b!129341) (not d!39227) (not mapNonEmpty!4579) (not bm!14057) (not bm!14001) (not b_next!2885) (not b!129467) (not b!129459) (not bm!14070) (not bm!14052) tp_is_empty!2859 (not b!129475) (not b!129458))
(check-sat b_and!8007 b_and!8009 (not b_next!2885) (not b_next!2887))
(get-model)

(declare-fun d!39239 () Bool)

(declare-fun res!62480 () Bool)

(declare-fun e!84530 () Bool)

(assert (=> d!39239 (=> res!62480 e!84530)))

(assert (=> d!39239 (= res!62480 (and ((_ is Cons!1704) (toList!864 lt!67005)) (= (_1!1315 (h!2308 (toList!864 lt!67005))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39239 (= (containsKey!173 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) e!84530)))

(declare-fun b!129502 () Bool)

(declare-fun e!84531 () Bool)

(assert (=> b!129502 (= e!84530 e!84531)))

(declare-fun res!62481 () Bool)

(assert (=> b!129502 (=> (not res!62481) (not e!84531))))

(assert (=> b!129502 (= res!62481 (and (or (not ((_ is Cons!1704) (toList!864 lt!67005))) (bvsle (_1!1315 (h!2308 (toList!864 lt!67005))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))) ((_ is Cons!1704) (toList!864 lt!67005)) (bvslt (_1!1315 (h!2308 (toList!864 lt!67005))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(declare-fun b!129503 () Bool)

(assert (=> b!129503 (= e!84531 (containsKey!173 (t!6107 (toList!864 lt!67005)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39239 (not res!62480)) b!129502))

(assert (= (and b!129502 res!62481) b!129503))

(assert (=> b!129503 m!151769))

(declare-fun m!151967 () Bool)

(assert (=> b!129503 m!151967))

(assert (=> d!39227 d!39239))

(declare-fun d!39241 () Bool)

(declare-fun e!84534 () Bool)

(assert (=> d!39241 e!84534))

(declare-fun res!62486 () Bool)

(assert (=> d!39241 (=> (not res!62486) (not e!84534))))

(declare-fun lt!67185 () ListLongMap!1697)

(assert (=> d!39241 (= res!62486 (contains!889 lt!67185 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun lt!67186 () List!1708)

(assert (=> d!39241 (= lt!67185 (ListLongMap!1698 lt!67186))))

(declare-fun lt!67187 () Unit!4039)

(declare-fun lt!67184 () Unit!4039)

(assert (=> d!39241 (= lt!67187 lt!67184)))

(assert (=> d!39241 (= (getValueByKey!169 lt!67186 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) (Some!174 (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!84 (List!1708 (_ BitVec 64) V!3459) Unit!4039)

(assert (=> d!39241 (= lt!67184 (lemmaContainsTupThenGetReturnValue!84 lt!67186 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun insertStrictlySorted!87 (List!1708 (_ BitVec 64) V!3459) List!1708)

(assert (=> d!39241 (= lt!67186 (insertStrictlySorted!87 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003))) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39241 (= (+!172 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)) (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67185)))

(declare-fun b!129508 () Bool)

(declare-fun res!62487 () Bool)

(assert (=> b!129508 (=> (not res!62487) (not e!84534))))

(assert (=> b!129508 (= res!62487 (= (getValueByKey!169 (toList!864 lt!67185) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) (Some!174 (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun b!129509 () Bool)

(declare-fun contains!890 (List!1708 tuple2!2608) Bool)

(assert (=> b!129509 (= e!84534 (contains!890 (toList!864 lt!67185) (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (= (and d!39241 res!62486) b!129508))

(assert (= (and b!129508 res!62487) b!129509))

(declare-fun m!151969 () Bool)

(assert (=> d!39241 m!151969))

(declare-fun m!151971 () Bool)

(assert (=> d!39241 m!151971))

(declare-fun m!151973 () Bool)

(assert (=> d!39241 m!151973))

(declare-fun m!151975 () Bool)

(assert (=> d!39241 m!151975))

(declare-fun m!151977 () Bool)

(assert (=> b!129508 m!151977))

(declare-fun m!151979 () Bool)

(assert (=> b!129509 m!151979))

(assert (=> bm!14001 d!39241))

(assert (=> d!39221 d!39237))

(assert (=> bm!14072 d!39219))

(declare-fun d!39243 () Bool)

(declare-fun e!84537 () Bool)

(assert (=> d!39243 e!84537))

(declare-fun res!62492 () Bool)

(assert (=> d!39243 (=> (not res!62492) (not e!84537))))

(declare-fun lt!67192 () SeekEntryResult!272)

(assert (=> d!39243 (= res!62492 ((_ is Found!272) lt!67192))))

(assert (=> d!39243 (= lt!67192 (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun lt!67193 () Unit!4039)

(declare-fun choose!786 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 64) Int) Unit!4039)

(assert (=> d!39243 (= lt!67193 (choose!786 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39243 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39243 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)) lt!67193)))

(declare-fun b!129514 () Bool)

(declare-fun res!62493 () Bool)

(assert (=> b!129514 (=> (not res!62493) (not e!84537))))

(assert (=> b!129514 (= res!62493 (inRange!0 (index!3246 lt!67192) (mask!7102 newMap!16)))))

(declare-fun b!129515 () Bool)

(assert (=> b!129515 (= e!84537 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67192)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!129515 (and (bvsge (index!3246 lt!67192) #b00000000000000000000000000000000) (bvslt (index!3246 lt!67192) (size!2509 (_keys!4565 newMap!16))))))

(assert (= (and d!39243 res!62492) b!129514))

(assert (= (and b!129514 res!62493) b!129515))

(assert (=> d!39243 m!151769))

(assert (=> d!39243 m!151913))

(assert (=> d!39243 m!151769))

(declare-fun m!151981 () Bool)

(assert (=> d!39243 m!151981))

(declare-fun m!151983 () Bool)

(assert (=> d!39243 m!151983))

(declare-fun m!151985 () Bool)

(assert (=> b!129514 m!151985))

(declare-fun m!151987 () Bool)

(assert (=> b!129515 m!151987))

(assert (=> bm!14057 d!39243))

(declare-fun d!39245 () Bool)

(declare-fun e!84538 () Bool)

(assert (=> d!39245 e!84538))

(declare-fun res!62494 () Bool)

(assert (=> d!39245 (=> (not res!62494) (not e!84538))))

(declare-fun lt!67195 () ListLongMap!1697)

(assert (=> d!39245 (= res!62494 (contains!889 lt!67195 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67196 () List!1708)

(assert (=> d!39245 (= lt!67195 (ListLongMap!1698 lt!67196))))

(declare-fun lt!67197 () Unit!4039)

(declare-fun lt!67194 () Unit!4039)

(assert (=> d!39245 (= lt!67197 lt!67194)))

(assert (=> d!39245 (= (getValueByKey!169 lt!67196 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39245 (= lt!67194 (lemmaContainsTupThenGetReturnValue!84 lt!67196 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39245 (= lt!67196 (insertStrictlySorted!87 (toList!864 call!14068) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39245 (= (+!172 call!14068 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67195)))

(declare-fun b!129516 () Bool)

(declare-fun res!62495 () Bool)

(assert (=> b!129516 (=> (not res!62495) (not e!84538))))

(assert (=> b!129516 (= res!62495 (= (getValueByKey!169 (toList!864 lt!67195) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129517 () Bool)

(assert (=> b!129517 (= e!84538 (contains!890 (toList!864 lt!67195) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39245 res!62494) b!129516))

(assert (= (and b!129516 res!62495) b!129517))

(declare-fun m!151989 () Bool)

(assert (=> d!39245 m!151989))

(declare-fun m!151991 () Bool)

(assert (=> d!39245 m!151991))

(declare-fun m!151993 () Bool)

(assert (=> d!39245 m!151993))

(declare-fun m!151995 () Bool)

(assert (=> d!39245 m!151995))

(declare-fun m!151997 () Bool)

(assert (=> b!129516 m!151997))

(declare-fun m!151999 () Bool)

(assert (=> b!129517 m!151999))

(assert (=> b!129467 d!39245))

(declare-fun b!129518 () Bool)

(declare-fun e!84549 () Bool)

(declare-fun lt!67204 () ListLongMap!1697)

(assert (=> b!129518 (= e!84549 (= (apply!113 lt!67204 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (ite c!23800 (_values!2807 newMap!16) lt!67149)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (ite c!23800 (_values!2807 newMap!16) lt!67149))))))

(assert (=> b!129518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129519 () Bool)

(declare-fun e!84541 () Bool)

(declare-fun e!84548 () Bool)

(assert (=> b!129519 (= e!84541 e!84548)))

(declare-fun res!62502 () Bool)

(declare-fun call!14083 () Bool)

(assert (=> b!129519 (= res!62502 call!14083)))

(assert (=> b!129519 (=> (not res!62502) (not e!84548))))

(declare-fun b!129520 () Bool)

(declare-fun e!84550 () Bool)

(declare-fun call!14084 () Bool)

(assert (=> b!129520 (= e!84550 (not call!14084))))

(declare-fun bm!14076 () Bool)

(assert (=> bm!14076 (= call!14084 (contains!889 lt!67204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129521 () Bool)

(declare-fun e!84551 () Unit!4039)

(declare-fun lt!67214 () Unit!4039)

(assert (=> b!129521 (= e!84551 lt!67214)))

(declare-fun lt!67216 () ListLongMap!1697)

(assert (=> b!129521 (= lt!67216 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67212 () (_ BitVec 64))

(assert (=> b!129521 (= lt!67212 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67205 () (_ BitVec 64))

(assert (=> b!129521 (= lt!67205 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67211 () Unit!4039)

(assert (=> b!129521 (= lt!67211 (addStillContains!89 lt!67216 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) lt!67205))))

(assert (=> b!129521 (contains!889 (+!172 lt!67216 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) lt!67205)))

(declare-fun lt!67218 () Unit!4039)

(assert (=> b!129521 (= lt!67218 lt!67211)))

(declare-fun lt!67206 () ListLongMap!1697)

(assert (=> b!129521 (= lt!67206 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67209 () (_ BitVec 64))

(assert (=> b!129521 (= lt!67209 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67200 () (_ BitVec 64))

(assert (=> b!129521 (= lt!67200 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67215 () Unit!4039)

(assert (=> b!129521 (= lt!67215 (addApplyDifferent!89 lt!67206 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) lt!67200))))

(assert (=> b!129521 (= (apply!113 (+!172 lt!67206 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67200) (apply!113 lt!67206 lt!67200))))

(declare-fun lt!67213 () Unit!4039)

(assert (=> b!129521 (= lt!67213 lt!67215)))

(declare-fun lt!67198 () ListLongMap!1697)

(assert (=> b!129521 (= lt!67198 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67201 () (_ BitVec 64))

(assert (=> b!129521 (= lt!67201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67202 () (_ BitVec 64))

(assert (=> b!129521 (= lt!67202 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67199 () Unit!4039)

(assert (=> b!129521 (= lt!67199 (addApplyDifferent!89 lt!67198 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) lt!67202))))

(assert (=> b!129521 (= (apply!113 (+!172 lt!67198 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) lt!67202) (apply!113 lt!67198 lt!67202))))

(declare-fun lt!67210 () Unit!4039)

(assert (=> b!129521 (= lt!67210 lt!67199)))

(declare-fun lt!67208 () ListLongMap!1697)

(assert (=> b!129521 (= lt!67208 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67217 () (_ BitVec 64))

(assert (=> b!129521 (= lt!67217 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67203 () (_ BitVec 64))

(assert (=> b!129521 (= lt!67203 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129521 (= lt!67214 (addApplyDifferent!89 lt!67208 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) lt!67203))))

(assert (=> b!129521 (= (apply!113 (+!172 lt!67208 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67203) (apply!113 lt!67208 lt!67203))))

(declare-fun b!129522 () Bool)

(declare-fun res!62504 () Bool)

(declare-fun e!84542 () Bool)

(assert (=> b!129522 (=> (not res!62504) (not e!84542))))

(assert (=> b!129522 (= res!62504 e!84550)))

(declare-fun c!23808 () Bool)

(assert (=> b!129522 (= c!23808 (not (= (bvand (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129523 () Bool)

(declare-fun e!84539 () ListLongMap!1697)

(declare-fun call!14082 () ListLongMap!1697)

(assert (=> b!129523 (= e!84539 call!14082)))

(declare-fun b!129524 () Bool)

(declare-fun res!62503 () Bool)

(assert (=> b!129524 (=> (not res!62503) (not e!84542))))

(declare-fun e!84543 () Bool)

(assert (=> b!129524 (= res!62503 e!84543)))

(declare-fun res!62499 () Bool)

(assert (=> b!129524 (=> res!62499 e!84543)))

(declare-fun e!84540 () Bool)

(assert (=> b!129524 (= res!62499 (not e!84540))))

(declare-fun res!62497 () Bool)

(assert (=> b!129524 (=> (not res!62497) (not e!84540))))

(assert (=> b!129524 (= res!62497 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun bm!14077 () Bool)

(declare-fun call!14080 () ListLongMap!1697)

(declare-fun call!14079 () ListLongMap!1697)

(assert (=> bm!14077 (= call!14080 call!14079)))

(declare-fun d!39247 () Bool)

(assert (=> d!39247 e!84542))

(declare-fun res!62500 () Bool)

(assert (=> d!39247 (=> (not res!62500) (not e!84542))))

(assert (=> d!39247 (= res!62500 (or (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun lt!67219 () ListLongMap!1697)

(assert (=> d!39247 (= lt!67204 lt!67219)))

(declare-fun lt!67207 () Unit!4039)

(assert (=> d!39247 (= lt!67207 e!84551)))

(declare-fun c!23809 () Bool)

(declare-fun e!84546 () Bool)

(assert (=> d!39247 (= c!23809 e!84546)))

(declare-fun res!62501 () Bool)

(assert (=> d!39247 (=> (not res!62501) (not e!84546))))

(assert (=> d!39247 (= res!62501 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun e!84544 () ListLongMap!1697)

(assert (=> d!39247 (= lt!67219 e!84544)))

(declare-fun c!23810 () Bool)

(assert (=> d!39247 (= c!23810 (and (not (= (bvand (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39247 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39247 (= (getCurrentListMap!541 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67204)))

(declare-fun b!129525 () Bool)

(assert (=> b!129525 (= e!84546 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129526 () Bool)

(declare-fun e!84547 () ListLongMap!1697)

(declare-fun call!14085 () ListLongMap!1697)

(assert (=> b!129526 (= e!84547 call!14085)))

(declare-fun bm!14078 () Bool)

(assert (=> bm!14078 (= call!14083 (contains!889 lt!67204 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129527 () Bool)

(assert (=> b!129527 (= e!84543 e!84549)))

(declare-fun res!62498 () Bool)

(assert (=> b!129527 (=> (not res!62498) (not e!84549))))

(assert (=> b!129527 (= res!62498 (contains!889 lt!67204 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129528 () Bool)

(declare-fun c!23812 () Bool)

(assert (=> b!129528 (= c!23812 (and (not (= (bvand (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129528 (= e!84547 e!84539)))

(declare-fun b!129529 () Bool)

(assert (=> b!129529 (= e!84542 e!84541)))

(declare-fun c!23807 () Bool)

(assert (=> b!129529 (= c!23807 (not (= (bvand (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129530 () Bool)

(declare-fun Unit!4045 () Unit!4039)

(assert (=> b!129530 (= e!84551 Unit!4045)))

(declare-fun bm!14079 () Bool)

(assert (=> bm!14079 (= call!14079 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!129531 () Bool)

(assert (=> b!129531 (= e!84544 e!84547)))

(declare-fun c!23811 () Bool)

(assert (=> b!129531 (= c!23811 (and (not (= (bvand (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14080 () Bool)

(declare-fun call!14081 () ListLongMap!1697)

(assert (=> bm!14080 (= call!14081 (+!172 (ite c!23810 call!14079 (ite c!23811 call!14080 call!14082)) (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(declare-fun b!129532 () Bool)

(assert (=> b!129532 (= e!84540 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129533 () Bool)

(assert (=> b!129533 (= e!84548 (= (apply!113 lt!67204 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))

(declare-fun b!129534 () Bool)

(declare-fun e!84545 () Bool)

(assert (=> b!129534 (= e!84550 e!84545)))

(declare-fun res!62496 () Bool)

(assert (=> b!129534 (= res!62496 call!14084)))

(assert (=> b!129534 (=> (not res!62496) (not e!84545))))

(declare-fun bm!14081 () Bool)

(assert (=> bm!14081 (= call!14082 call!14080)))

(declare-fun bm!14082 () Bool)

(assert (=> bm!14082 (= call!14085 call!14081)))

(declare-fun b!129535 () Bool)

(assert (=> b!129535 (= e!84539 call!14085)))

(declare-fun b!129536 () Bool)

(assert (=> b!129536 (= e!84545 (= (apply!113 lt!67204 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))

(declare-fun b!129537 () Bool)

(assert (=> b!129537 (= e!84544 (+!172 call!14081 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))

(declare-fun b!129538 () Bool)

(assert (=> b!129538 (= e!84541 (not call!14083))))

(assert (= (and d!39247 c!23810) b!129537))

(assert (= (and d!39247 (not c!23810)) b!129531))

(assert (= (and b!129531 c!23811) b!129526))

(assert (= (and b!129531 (not c!23811)) b!129528))

(assert (= (and b!129528 c!23812) b!129535))

(assert (= (and b!129528 (not c!23812)) b!129523))

(assert (= (or b!129535 b!129523) bm!14081))

(assert (= (or b!129526 bm!14081) bm!14077))

(assert (= (or b!129526 b!129535) bm!14082))

(assert (= (or b!129537 bm!14077) bm!14079))

(assert (= (or b!129537 bm!14082) bm!14080))

(assert (= (and d!39247 res!62501) b!129525))

(assert (= (and d!39247 c!23809) b!129521))

(assert (= (and d!39247 (not c!23809)) b!129530))

(assert (= (and d!39247 res!62500) b!129524))

(assert (= (and b!129524 res!62497) b!129532))

(assert (= (and b!129524 (not res!62499)) b!129527))

(assert (= (and b!129527 res!62498) b!129518))

(assert (= (and b!129524 res!62503) b!129522))

(assert (= (and b!129522 c!23808) b!129534))

(assert (= (and b!129522 (not c!23808)) b!129520))

(assert (= (and b!129534 res!62496) b!129536))

(assert (= (or b!129534 b!129520) bm!14076))

(assert (= (and b!129522 res!62504) b!129529))

(assert (= (and b!129529 c!23807) b!129519))

(assert (= (and b!129529 (not c!23807)) b!129538))

(assert (= (and b!129519 res!62502) b!129533))

(assert (= (or b!129519 b!129538) bm!14078))

(declare-fun b_lambda!5745 () Bool)

(assert (=> (not b_lambda!5745) (not b!129518)))

(declare-fun t!6114 () Bool)

(declare-fun tb!2369 () Bool)

(assert (=> (and b!129225 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16)) t!6114) tb!2369))

(declare-fun result!3921 () Bool)

(assert (=> tb!2369 (= result!3921 tp_is_empty!2859)))

(assert (=> b!129518 t!6114))

(declare-fun b_and!8011 () Bool)

(assert (= b_and!8007 (and (=> t!6114 result!3921) b_and!8011)))

(declare-fun t!6116 () Bool)

(declare-fun tb!2371 () Bool)

(assert (=> (and b!129213 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 newMap!16)) t!6116) tb!2371))

(declare-fun result!3923 () Bool)

(assert (= result!3923 result!3921))

(assert (=> b!129518 t!6116))

(declare-fun b_and!8013 () Bool)

(assert (= b_and!8009 (and (=> t!6116 result!3923) b_and!8013)))

(declare-fun m!152001 () Bool)

(assert (=> bm!14079 m!152001))

(declare-fun m!152003 () Bool)

(assert (=> bm!14078 m!152003))

(declare-fun m!152005 () Bool)

(assert (=> bm!14080 m!152005))

(declare-fun m!152007 () Bool)

(assert (=> b!129518 m!152007))

(declare-fun m!152009 () Bool)

(assert (=> b!129518 m!152009))

(declare-fun m!152011 () Bool)

(assert (=> b!129518 m!152011))

(declare-fun m!152013 () Bool)

(assert (=> b!129518 m!152013))

(assert (=> b!129518 m!152013))

(declare-fun m!152015 () Bool)

(assert (=> b!129518 m!152015))

(assert (=> b!129518 m!152007))

(assert (=> b!129518 m!152009))

(declare-fun m!152017 () Bool)

(assert (=> b!129536 m!152017))

(assert (=> b!129532 m!152013))

(assert (=> b!129532 m!152013))

(declare-fun m!152019 () Bool)

(assert (=> b!129532 m!152019))

(assert (=> b!129525 m!152013))

(assert (=> b!129525 m!152013))

(assert (=> b!129525 m!152019))

(assert (=> d!39247 m!151983))

(declare-fun m!152021 () Bool)

(assert (=> b!129533 m!152021))

(declare-fun m!152023 () Bool)

(assert (=> b!129537 m!152023))

(declare-fun m!152025 () Bool)

(assert (=> bm!14076 m!152025))

(assert (=> b!129527 m!152013))

(assert (=> b!129527 m!152013))

(declare-fun m!152027 () Bool)

(assert (=> b!129527 m!152027))

(declare-fun m!152029 () Bool)

(assert (=> b!129521 m!152029))

(declare-fun m!152031 () Bool)

(assert (=> b!129521 m!152031))

(declare-fun m!152033 () Bool)

(assert (=> b!129521 m!152033))

(declare-fun m!152035 () Bool)

(assert (=> b!129521 m!152035))

(assert (=> b!129521 m!152001))

(declare-fun m!152037 () Bool)

(assert (=> b!129521 m!152037))

(declare-fun m!152039 () Bool)

(assert (=> b!129521 m!152039))

(declare-fun m!152041 () Bool)

(assert (=> b!129521 m!152041))

(declare-fun m!152043 () Bool)

(assert (=> b!129521 m!152043))

(declare-fun m!152045 () Bool)

(assert (=> b!129521 m!152045))

(assert (=> b!129521 m!152013))

(declare-fun m!152047 () Bool)

(assert (=> b!129521 m!152047))

(declare-fun m!152049 () Bool)

(assert (=> b!129521 m!152049))

(declare-fun m!152051 () Bool)

(assert (=> b!129521 m!152051))

(assert (=> b!129521 m!152037))

(declare-fun m!152053 () Bool)

(assert (=> b!129521 m!152053))

(declare-fun m!152055 () Bool)

(assert (=> b!129521 m!152055))

(assert (=> b!129521 m!152043))

(assert (=> b!129521 m!152049))

(assert (=> b!129521 m!152031))

(declare-fun m!152057 () Bool)

(assert (=> b!129521 m!152057))

(assert (=> bm!14063 d!39247))

(declare-fun b!129563 () Bool)

(declare-fun e!84570 () ListLongMap!1697)

(declare-fun e!84572 () ListLongMap!1697)

(assert (=> b!129563 (= e!84570 e!84572)))

(declare-fun c!23823 () Bool)

(assert (=> b!129563 (= c!23823 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129564 () Bool)

(declare-fun lt!67239 () Unit!4039)

(declare-fun lt!67236 () Unit!4039)

(assert (=> b!129564 (= lt!67239 lt!67236)))

(declare-fun lt!67234 () ListLongMap!1697)

(declare-fun lt!67237 () (_ BitVec 64))

(declare-fun lt!67235 () V!3459)

(declare-fun lt!67238 () (_ BitVec 64))

(assert (=> b!129564 (not (contains!889 (+!172 lt!67234 (tuple2!2609 lt!67238 lt!67235)) lt!67237))))

(declare-fun addStillNotContains!58 (ListLongMap!1697 (_ BitVec 64) V!3459 (_ BitVec 64)) Unit!4039)

(assert (=> b!129564 (= lt!67236 (addStillNotContains!58 lt!67234 lt!67238 lt!67235 lt!67237))))

(assert (=> b!129564 (= lt!67237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!129564 (= lt!67235 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!129564 (= lt!67238 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!14088 () ListLongMap!1697)

(assert (=> b!129564 (= lt!67234 call!14088)))

(assert (=> b!129564 (= e!84572 (+!172 call!14088 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!67240 () ListLongMap!1697)

(declare-fun e!84566 () Bool)

(declare-fun b!129565 () Bool)

(assert (=> b!129565 (= e!84566 (= lt!67240 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!129566 () Bool)

(declare-fun res!62515 () Bool)

(declare-fun e!84569 () Bool)

(assert (=> b!129566 (=> (not res!62515) (not e!84569))))

(assert (=> b!129566 (= res!62515 (not (contains!889 lt!67240 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129567 () Bool)

(assert (=> b!129567 (= e!84572 call!14088)))

(declare-fun bm!14085 () Bool)

(assert (=> bm!14085 (= call!14088 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!129568 () Bool)

(assert (=> b!129568 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> b!129568 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2510 (_values!2807 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun e!84571 () Bool)

(assert (=> b!129568 (= e!84571 (= (apply!113 lt!67240 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129569 () Bool)

(declare-fun e!84567 () Bool)

(assert (=> b!129569 (= e!84567 e!84571)))

(assert (=> b!129569 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun res!62513 () Bool)

(assert (=> b!129569 (= res!62513 (contains!889 lt!67240 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129569 (=> (not res!62513) (not e!84571))))

(declare-fun d!39249 () Bool)

(assert (=> d!39249 e!84569))

(declare-fun res!62516 () Bool)

(assert (=> d!39249 (=> (not res!62516) (not e!84569))))

(assert (=> d!39249 (= res!62516 (not (contains!889 lt!67240 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39249 (= lt!67240 e!84570)))

(declare-fun c!23822 () Bool)

(assert (=> d!39249 (= c!23822 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> d!39249 (validMask!0 (mask!7102 (v!3162 (underlying!448 thiss!992))))))

(assert (=> d!39249 (= (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))) lt!67240)))

(declare-fun b!129570 () Bool)

(assert (=> b!129570 (= e!84567 e!84566)))

(declare-fun c!23824 () Bool)

(assert (=> b!129570 (= c!23824 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!129571 () Bool)

(declare-fun e!84568 () Bool)

(assert (=> b!129571 (= e!84568 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129571 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!129572 () Bool)

(declare-fun isEmpty!402 (ListLongMap!1697) Bool)

(assert (=> b!129572 (= e!84566 (isEmpty!402 lt!67240))))

(declare-fun b!129573 () Bool)

(assert (=> b!129573 (= e!84570 (ListLongMap!1698 Nil!1705))))

(declare-fun b!129574 () Bool)

(assert (=> b!129574 (= e!84569 e!84567)))

(declare-fun c!23821 () Bool)

(assert (=> b!129574 (= c!23821 e!84568)))

(declare-fun res!62514 () Bool)

(assert (=> b!129574 (=> (not res!62514) (not e!84568))))

(assert (=> b!129574 (= res!62514 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39249 c!23822) b!129573))

(assert (= (and d!39249 (not c!23822)) b!129563))

(assert (= (and b!129563 c!23823) b!129564))

(assert (= (and b!129563 (not c!23823)) b!129567))

(assert (= (or b!129564 b!129567) bm!14085))

(assert (= (and d!39249 res!62516) b!129566))

(assert (= (and b!129566 res!62515) b!129574))

(assert (= (and b!129574 res!62514) b!129571))

(assert (= (and b!129574 c!23821) b!129569))

(assert (= (and b!129574 (not c!23821)) b!129570))

(assert (= (and b!129569 res!62513) b!129568))

(assert (= (and b!129570 c!23824) b!129565))

(assert (= (and b!129570 (not c!23824)) b!129572))

(declare-fun b_lambda!5747 () Bool)

(assert (=> (not b_lambda!5747) (not b!129564)))

(assert (=> b!129564 t!6104))

(declare-fun b_and!8015 () Bool)

(assert (= b_and!8011 (and (=> t!6104 result!3907) b_and!8015)))

(assert (=> b!129564 t!6106))

(declare-fun b_and!8017 () Bool)

(assert (= b_and!8013 (and (=> t!6106 result!3911) b_and!8017)))

(declare-fun b_lambda!5749 () Bool)

(assert (=> (not b_lambda!5749) (not b!129568)))

(assert (=> b!129568 t!6104))

(declare-fun b_and!8019 () Bool)

(assert (= b_and!8015 (and (=> t!6104 result!3907) b_and!8019)))

(assert (=> b!129568 t!6106))

(declare-fun b_and!8021 () Bool)

(assert (= b_and!8017 (and (=> t!6106 result!3911) b_and!8021)))

(declare-fun m!152059 () Bool)

(assert (=> b!129572 m!152059))

(declare-fun m!152061 () Bool)

(assert (=> d!39249 m!152061))

(assert (=> d!39249 m!151781))

(assert (=> b!129568 m!151847))

(assert (=> b!129568 m!151851))

(declare-fun m!152063 () Bool)

(assert (=> b!129568 m!152063))

(assert (=> b!129568 m!151851))

(assert (=> b!129568 m!151847))

(assert (=> b!129568 m!151765))

(assert (=> b!129568 m!151849))

(assert (=> b!129568 m!151765))

(assert (=> b!129563 m!151851))

(assert (=> b!129563 m!151851))

(assert (=> b!129563 m!151857))

(assert (=> b!129569 m!151851))

(assert (=> b!129569 m!151851))

(declare-fun m!152065 () Bool)

(assert (=> b!129569 m!152065))

(declare-fun m!152067 () Bool)

(assert (=> bm!14085 m!152067))

(declare-fun m!152069 () Bool)

(assert (=> b!129566 m!152069))

(assert (=> b!129571 m!151851))

(assert (=> b!129571 m!151851))

(assert (=> b!129571 m!151857))

(assert (=> b!129564 m!151847))

(declare-fun m!152071 () Bool)

(assert (=> b!129564 m!152071))

(declare-fun m!152073 () Bool)

(assert (=> b!129564 m!152073))

(assert (=> b!129564 m!151851))

(declare-fun m!152075 () Bool)

(assert (=> b!129564 m!152075))

(assert (=> b!129564 m!151765))

(assert (=> b!129564 m!152071))

(assert (=> b!129564 m!151847))

(assert (=> b!129564 m!151765))

(assert (=> b!129564 m!151849))

(declare-fun m!152077 () Bool)

(assert (=> b!129564 m!152077))

(assert (=> b!129565 m!152067))

(assert (=> bm!14000 d!39249))

(declare-fun d!39251 () Bool)

(assert (=> d!39251 (= (inRange!0 (ite c!23795 (ite c!23801 (index!3246 lt!67153) (ite c!23797 (index!3245 lt!67168) (index!3248 lt!67168))) (ite c!23799 (index!3246 lt!67167) (ite c!23803 (index!3245 lt!67162) (index!3248 lt!67162)))) (mask!7102 newMap!16)) (and (bvsge (ite c!23795 (ite c!23801 (index!3246 lt!67153) (ite c!23797 (index!3245 lt!67168) (index!3248 lt!67168))) (ite c!23799 (index!3246 lt!67167) (ite c!23803 (index!3245 lt!67162) (index!3248 lt!67162)))) #b00000000000000000000000000000000) (bvslt (ite c!23795 (ite c!23801 (index!3246 lt!67153) (ite c!23797 (index!3245 lt!67168) (index!3248 lt!67168))) (ite c!23799 (index!3246 lt!67167) (ite c!23803 (index!3245 lt!67162) (index!3248 lt!67162)))) (bvadd (mask!7102 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14073 d!39251))

(declare-fun d!39253 () Bool)

(declare-fun e!84573 () Bool)

(assert (=> d!39253 e!84573))

(declare-fun res!62517 () Bool)

(assert (=> d!39253 (=> res!62517 e!84573)))

(declare-fun lt!67244 () Bool)

(assert (=> d!39253 (= res!62517 (not lt!67244))))

(declare-fun lt!67243 () Bool)

(assert (=> d!39253 (= lt!67244 lt!67243)))

(declare-fun lt!67242 () Unit!4039)

(declare-fun e!84574 () Unit!4039)

(assert (=> d!39253 (= lt!67242 e!84574)))

(declare-fun c!23825 () Bool)

(assert (=> d!39253 (= c!23825 lt!67243)))

(assert (=> d!39253 (= lt!67243 (containsKey!173 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(assert (=> d!39253 (= (contains!889 e!84500 (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))) lt!67244)))

(declare-fun b!129575 () Bool)

(declare-fun lt!67241 () Unit!4039)

(assert (=> b!129575 (= e!84574 lt!67241)))

(assert (=> b!129575 (= lt!67241 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(assert (=> b!129575 (isDefined!122 (getValueByKey!169 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(declare-fun b!129576 () Bool)

(declare-fun Unit!4046 () Unit!4039)

(assert (=> b!129576 (= e!84574 Unit!4046)))

(declare-fun b!129577 () Bool)

(assert (=> b!129577 (= e!84573 (isDefined!122 (getValueByKey!169 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))))))

(assert (= (and d!39253 c!23825) b!129575))

(assert (= (and d!39253 (not c!23825)) b!129576))

(assert (= (and d!39253 (not res!62517)) b!129577))

(declare-fun m!152079 () Bool)

(assert (=> d!39253 m!152079))

(declare-fun m!152081 () Bool)

(assert (=> b!129575 m!152081))

(declare-fun m!152083 () Bool)

(assert (=> b!129575 m!152083))

(assert (=> b!129575 m!152083))

(declare-fun m!152085 () Bool)

(assert (=> b!129575 m!152085))

(assert (=> b!129577 m!152083))

(assert (=> b!129577 m!152083))

(assert (=> b!129577 m!152085))

(assert (=> bm!14075 d!39253))

(declare-fun b!129594 () Bool)

(declare-fun res!62528 () Bool)

(declare-fun e!84586 () Bool)

(assert (=> b!129594 (=> (not res!62528) (not e!84586))))

(declare-fun call!14094 () Bool)

(assert (=> b!129594 (= res!62528 call!14094)))

(declare-fun e!84585 () Bool)

(assert (=> b!129594 (= e!84585 e!84586)))

(declare-fun b!129595 () Bool)

(declare-fun call!14093 () Bool)

(assert (=> b!129595 (= e!84586 (not call!14093))))

(declare-fun d!39255 () Bool)

(declare-fun e!84584 () Bool)

(assert (=> d!39255 e!84584))

(declare-fun c!23830 () Bool)

(declare-fun lt!67250 () SeekEntryResult!272)

(assert (=> d!39255 (= c!23830 ((_ is MissingZero!272) lt!67250))))

(assert (=> d!39255 (= lt!67250 (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun lt!67249 () Unit!4039)

(declare-fun choose!787 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 64) Int) Unit!4039)

(assert (=> d!39255 (= lt!67249 (choose!787 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39255 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39255 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)) lt!67249)))

(declare-fun b!129596 () Bool)

(assert (=> b!129596 (= e!84585 ((_ is Undefined!272) lt!67250))))

(declare-fun b!129597 () Bool)

(declare-fun res!62527 () Bool)

(assert (=> b!129597 (=> (not res!62527) (not e!84586))))

(assert (=> b!129597 (= res!62527 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3248 lt!67250)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129597 (and (bvsge (index!3248 lt!67250) #b00000000000000000000000000000000) (bvslt (index!3248 lt!67250) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129598 () Bool)

(declare-fun e!84583 () Bool)

(assert (=> b!129598 (= e!84583 (not call!14093))))

(declare-fun bm!14090 () Bool)

(assert (=> bm!14090 (= call!14093 (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!129599 () Bool)

(assert (=> b!129599 (= e!84584 e!84583)))

(declare-fun res!62529 () Bool)

(assert (=> b!129599 (= res!62529 call!14094)))

(assert (=> b!129599 (=> (not res!62529) (not e!84583))))

(declare-fun b!129600 () Bool)

(assert (=> b!129600 (= e!84584 e!84585)))

(declare-fun c!23831 () Bool)

(assert (=> b!129600 (= c!23831 ((_ is MissingVacant!272) lt!67250))))

(declare-fun b!129601 () Bool)

(assert (=> b!129601 (and (bvsge (index!3245 lt!67250) #b00000000000000000000000000000000) (bvslt (index!3245 lt!67250) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun res!62526 () Bool)

(assert (=> b!129601 (= res!62526 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3245 lt!67250)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129601 (=> (not res!62526) (not e!84583))))

(declare-fun bm!14091 () Bool)

(assert (=> bm!14091 (= call!14094 (inRange!0 (ite c!23830 (index!3245 lt!67250) (index!3248 lt!67250)) (mask!7102 newMap!16)))))

(assert (= (and d!39255 c!23830) b!129599))

(assert (= (and d!39255 (not c!23830)) b!129600))

(assert (= (and b!129599 res!62529) b!129601))

(assert (= (and b!129601 res!62526) b!129598))

(assert (= (and b!129600 c!23831) b!129594))

(assert (= (and b!129600 (not c!23831)) b!129596))

(assert (= (and b!129594 res!62528) b!129597))

(assert (= (and b!129597 res!62527) b!129595))

(assert (= (or b!129599 b!129594) bm!14091))

(assert (= (or b!129598 b!129595) bm!14090))

(declare-fun m!152087 () Bool)

(assert (=> bm!14091 m!152087))

(declare-fun m!152089 () Bool)

(assert (=> b!129597 m!152089))

(declare-fun m!152091 () Bool)

(assert (=> b!129601 m!152091))

(assert (=> bm!14090 m!151769))

(assert (=> bm!14090 m!151927))

(assert (=> d!39255 m!151769))

(assert (=> d!39255 m!151913))

(assert (=> d!39255 m!151769))

(declare-fun m!152093 () Bool)

(assert (=> d!39255 m!152093))

(assert (=> d!39255 m!151983))

(assert (=> bm!14074 d!39255))

(declare-fun d!39257 () Bool)

(declare-fun res!62530 () Bool)

(declare-fun e!84587 () Bool)

(assert (=> d!39257 (=> (not res!62530) (not e!84587))))

(assert (=> d!39257 (= res!62530 (simpleValid!89 (_2!1316 lt!67159)))))

(assert (=> d!39257 (= (valid!515 (_2!1316 lt!67159)) e!84587)))

(declare-fun b!129602 () Bool)

(declare-fun res!62531 () Bool)

(assert (=> b!129602 (=> (not res!62531) (not e!84587))))

(assert (=> b!129602 (= res!62531 (= (arrayCountValidKeys!0 (_keys!4565 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))) (_size!589 (_2!1316 lt!67159))))))

(declare-fun b!129603 () Bool)

(declare-fun res!62532 () Bool)

(assert (=> b!129603 (=> (not res!62532) (not e!84587))))

(assert (=> b!129603 (= res!62532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4565 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159))))))

(declare-fun b!129604 () Bool)

(assert (=> b!129604 (= e!84587 (arrayNoDuplicates!0 (_keys!4565 (_2!1316 lt!67159)) #b00000000000000000000000000000000 Nil!1706))))

(assert (= (and d!39257 res!62530) b!129602))

(assert (= (and b!129602 res!62531) b!129603))

(assert (= (and b!129603 res!62532) b!129604))

(declare-fun m!152095 () Bool)

(assert (=> d!39257 m!152095))

(declare-fun m!152097 () Bool)

(assert (=> b!129602 m!152097))

(declare-fun m!152099 () Bool)

(assert (=> b!129603 m!152099))

(declare-fun m!152101 () Bool)

(assert (=> b!129604 m!152101))

(assert (=> d!39229 d!39257))

(assert (=> d!39229 d!39215))

(declare-fun d!39259 () Bool)

(declare-fun res!62533 () Bool)

(declare-fun e!84588 () Bool)

(assert (=> d!39259 (=> (not res!62533) (not e!84588))))

(assert (=> d!39259 (= res!62533 (simpleValid!89 (v!3162 (underlying!448 thiss!992))))))

(assert (=> d!39259 (= (valid!515 (v!3162 (underlying!448 thiss!992))) e!84588)))

(declare-fun b!129605 () Bool)

(declare-fun res!62534 () Bool)

(assert (=> b!129605 (=> (not res!62534) (not e!84588))))

(assert (=> b!129605 (= res!62534 (= (arrayCountValidKeys!0 (_keys!4565 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000 (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))) (_size!589 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!129606 () Bool)

(declare-fun res!62535 () Bool)

(assert (=> b!129606 (=> (not res!62535) (not e!84588))))

(assert (=> b!129606 (= res!62535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!129607 () Bool)

(assert (=> b!129607 (= e!84588 (arrayNoDuplicates!0 (_keys!4565 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000 Nil!1706))))

(assert (= (and d!39259 res!62533) b!129605))

(assert (= (and b!129605 res!62534) b!129606))

(assert (= (and b!129606 res!62535) b!129607))

(declare-fun m!152103 () Bool)

(assert (=> d!39259 m!152103))

(declare-fun m!152105 () Bool)

(assert (=> b!129605 m!152105))

(declare-fun m!152107 () Bool)

(assert (=> b!129606 m!152107))

(declare-fun m!152109 () Bool)

(assert (=> b!129607 m!152109))

(assert (=> d!39217 d!39259))

(declare-fun d!39261 () Bool)

(assert (=> d!39261 (= (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129346 d!39261))

(declare-fun d!39263 () Bool)

(declare-fun get!1466 (Option!175) V!3459)

(assert (=> d!39263 (= (apply!113 lt!67067 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5365 () Bool)

(assert (= bs!5365 d!39263))

(declare-fun m!152111 () Bool)

(assert (=> bs!5365 m!152111))

(assert (=> bs!5365 m!152111))

(declare-fun m!152113 () Bool)

(assert (=> bs!5365 m!152113))

(assert (=> b!129347 d!39263))

(declare-fun d!39265 () Bool)

(assert (=> d!39265 (= (apply!113 lt!67067 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1466 (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5366 () Bool)

(assert (= bs!5366 d!39265))

(assert (=> bs!5366 m!151851))

(declare-fun m!152115 () Bool)

(assert (=> bs!5366 m!152115))

(assert (=> bs!5366 m!152115))

(declare-fun m!152117 () Bool)

(assert (=> bs!5366 m!152117))

(assert (=> b!129332 d!39265))

(declare-fun d!39267 () Bool)

(declare-fun c!23832 () Bool)

(assert (=> d!39267 (= c!23832 ((_ is ValueCellFull!1086) (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!84589 () V!3459)

(assert (=> d!39267 (= (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84589)))

(declare-fun b!129608 () Bool)

(assert (=> b!129608 (= e!84589 (get!1464 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129609 () Bool)

(assert (=> b!129609 (= e!84589 (get!1465 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39267 c!23832) b!129608))

(assert (= (and d!39267 (not c!23832)) b!129609))

(assert (=> b!129608 m!151847))

(assert (=> b!129608 m!151765))

(declare-fun m!152119 () Bool)

(assert (=> b!129608 m!152119))

(assert (=> b!129609 m!151847))

(assert (=> b!129609 m!151765))

(declare-fun m!152121 () Bool)

(assert (=> b!129609 m!152121))

(assert (=> b!129332 d!39267))

(declare-fun d!39269 () Bool)

(assert (=> d!39269 (= (map!1398 (_2!1316 lt!67159)) (getCurrentListMap!541 (_keys!4565 (_2!1316 lt!67159)) (_values!2807 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159)) (extraKeys!2597 (_2!1316 lt!67159)) (zeroValue!2683 (_2!1316 lt!67159)) (minValue!2683 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (defaultEntry!2824 (_2!1316 lt!67159))))))

(declare-fun bs!5367 () Bool)

(assert (= bs!5367 d!39269))

(declare-fun m!152123 () Bool)

(assert (=> bs!5367 m!152123))

(assert (=> bm!14065 d!39269))

(declare-fun b!129644 () Bool)

(declare-fun res!62556 () Bool)

(declare-fun e!84607 () Bool)

(assert (=> b!129644 (=> (not res!62556) (not e!84607))))

(declare-fun lt!67331 () SeekEntryResult!272)

(assert (=> b!129644 (= res!62556 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3245 lt!67331)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129645 () Bool)

(declare-fun e!84612 () Unit!4039)

(declare-fun lt!67318 () Unit!4039)

(assert (=> b!129645 (= e!84612 lt!67318)))

(assert (=> b!129645 (= lt!67318 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)))))

(declare-fun call!14104 () SeekEntryResult!272)

(assert (=> b!129645 (= lt!67331 call!14104)))

(declare-fun c!23843 () Bool)

(assert (=> b!129645 (= c!23843 ((_ is MissingZero!272) lt!67331))))

(declare-fun e!84606 () Bool)

(assert (=> b!129645 e!84606))

(declare-fun call!14103 () Bool)

(declare-fun bm!14100 () Bool)

(assert (=> bm!14100 (= call!14103 (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!129646 () Bool)

(assert (=> b!129646 (= e!84607 (not call!14103))))

(declare-fun lt!67334 () tuple2!2610)

(declare-fun e!84610 () Bool)

(declare-fun b!129648 () Bool)

(assert (=> b!129648 (= e!84610 (= (map!1398 (_2!1316 lt!67334)) (+!172 (map!1398 newMap!16) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!14101 () Bool)

(assert (=> bm!14101 (= call!14104 (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun b!129649 () Bool)

(declare-fun res!62555 () Bool)

(assert (=> b!129649 (=> (not res!62555) (not e!84610))))

(assert (=> b!129649 (= res!62555 (valid!515 (_2!1316 lt!67334)))))

(declare-fun b!129650 () Bool)

(declare-fun c!23841 () Bool)

(assert (=> b!129650 (= c!23841 ((_ is MissingVacant!272) lt!67331))))

(declare-fun e!84609 () Bool)

(assert (=> b!129650 (= e!84606 e!84609)))

(declare-fun call!14106 () Bool)

(declare-fun lt!67313 () SeekEntryResult!272)

(declare-fun c!23844 () Bool)

(declare-fun bm!14102 () Bool)

(assert (=> bm!14102 (= call!14106 (inRange!0 (ite c!23844 (index!3246 lt!67313) (ite c!23843 (index!3245 lt!67331) (index!3248 lt!67331))) (mask!7102 newMap!16)))))

(declare-fun b!129647 () Bool)

(declare-fun res!62559 () Bool)

(assert (=> b!129647 (= res!62559 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3248 lt!67331)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84613 () Bool)

(assert (=> b!129647 (=> (not res!62559) (not e!84613))))

(declare-fun d!39271 () Bool)

(assert (=> d!39271 e!84610))

(declare-fun res!62557 () Bool)

(assert (=> d!39271 (=> (not res!62557) (not e!84610))))

(assert (=> d!39271 (= res!62557 (_1!1316 lt!67334))))

(assert (=> d!39271 (= lt!67334 (tuple2!2611 true (LongMapFixedSize!1081 (defaultEntry!2824 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (bvadd (_size!589 newMap!16) #b00000000000000000000000000000001) (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (_vacant!589 newMap!16))))))

(declare-fun lt!67322 () Unit!4039)

(declare-fun lt!67326 () Unit!4039)

(assert (=> d!39271 (= lt!67322 lt!67326)))

(declare-fun lt!67312 () array!4739)

(declare-fun lt!67316 () array!4741)

(assert (=> d!39271 (contains!889 (getCurrentListMap!541 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))))))

(assert (=> d!39271 (= lt!67326 (lemmaValidKeyInArrayIsInListMap!119 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39271 (= lt!67316 (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))))

(assert (=> d!39271 (= lt!67312 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun lt!67337 () Unit!4039)

(declare-fun lt!67320 () Unit!4039)

(assert (=> d!39271 (= lt!67337 lt!67320)))

(declare-fun lt!67323 () array!4739)

(assert (=> d!39271 (= (arrayCountValidKeys!0 lt!67323 (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (bvadd (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4739 (_ BitVec 32)) Unit!4039)

(assert (=> d!39271 (= lt!67320 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!67323 (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))))))

(assert (=> d!39271 (= lt!67323 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun lt!67317 () Unit!4039)

(declare-fun lt!67327 () Unit!4039)

(assert (=> d!39271 (= lt!67317 lt!67327)))

(declare-fun lt!67315 () array!4739)

(assert (=> d!39271 (arrayContainsKey!0 lt!67315 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4739 (_ BitVec 64) (_ BitVec 32)) Unit!4039)

(assert (=> d!39271 (= lt!67327 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!67315 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))))))

(assert (=> d!39271 (= lt!67315 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun lt!67336 () Unit!4039)

(declare-fun lt!67340 () Unit!4039)

(assert (=> d!39271 (= lt!67336 lt!67340)))

(assert (=> d!39271 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!541 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!39 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 32) (_ BitVec 64) V!3459 Int) Unit!4039)

(assert (=> d!39271 (= lt!67340 (lemmaAddValidKeyToArrayThenAddPairToListMap!39 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67332 () Unit!4039)

(declare-fun lt!67321 () Unit!4039)

(assert (=> d!39271 (= lt!67332 lt!67321)))

(assert (=> d!39271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (mask!7102 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4739 (_ BitVec 32) (_ BitVec 32)) Unit!4039)

(assert (=> d!39271 (= lt!67321 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (mask!7102 newMap!16)))))

(declare-fun lt!67338 () Unit!4039)

(declare-fun lt!67325 () Unit!4039)

(assert (=> d!39271 (= lt!67338 lt!67325)))

(assert (=> d!39271 (= (arrayCountValidKeys!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4565 newMap!16) #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4739 (_ BitVec 32) (_ BitVec 64)) Unit!4039)

(assert (=> d!39271 (= lt!67325 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4565 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun lt!67319 () Unit!4039)

(declare-fun lt!67324 () Unit!4039)

(assert (=> d!39271 (= lt!67319 lt!67324)))

(declare-fun lt!67328 () (_ BitVec 32))

(declare-fun lt!67311 () List!1709)

(assert (=> d!39271 (arrayNoDuplicates!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) lt!67328 lt!67311)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1709) Unit!4039)

(assert (=> d!39271 (= lt!67324 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) lt!67328 lt!67311))))

(assert (=> d!39271 (= lt!67311 Nil!1706)))

(assert (=> d!39271 (= lt!67328 #b00000000000000000000000000000000)))

(declare-fun lt!67333 () Unit!4039)

(declare-fun e!84608 () Unit!4039)

(assert (=> d!39271 (= lt!67333 e!84608)))

(declare-fun c!23842 () Bool)

(assert (=> d!39271 (= c!23842 (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!67314 () Unit!4039)

(assert (=> d!39271 (= lt!67314 e!84612)))

(assert (=> d!39271 (= c!23844 (contains!889 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39271 (valid!515 newMap!16)))

(assert (=> d!39271 (= (updateHelperNewKey!58 newMap!16 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))) lt!67334)))

(declare-fun b!129651 () Bool)

(declare-fun e!84611 () Bool)

(assert (=> b!129651 (= e!84611 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67313)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129652 () Bool)

(assert (=> b!129652 (= e!84609 ((_ is Undefined!272) lt!67331))))

(declare-fun b!129653 () Bool)

(declare-fun Unit!4047 () Unit!4039)

(assert (=> b!129653 (= e!84608 Unit!4047)))

(declare-fun lt!67329 () Unit!4039)

(declare-fun lemmaArrayContainsKeyThenInListMap!39 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 64) (_ BitVec 32) Int) Unit!4039)

(assert (=> b!129653 (= lt!67329 (lemmaArrayContainsKeyThenInListMap!39 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(assert (=> b!129653 (contains!889 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))

(declare-fun lt!67330 () Unit!4039)

(assert (=> b!129653 (= lt!67330 lt!67329)))

(assert (=> b!129653 false))

(declare-fun b!129654 () Bool)

(assert (=> b!129654 (= e!84609 e!84613)))

(declare-fun res!62560 () Bool)

(declare-fun call!14105 () Bool)

(assert (=> b!129654 (= res!62560 call!14105)))

(assert (=> b!129654 (=> (not res!62560) (not e!84613))))

(declare-fun b!129655 () Bool)

(assert (=> b!129655 (= e!84613 (not call!14103))))

(declare-fun b!129656 () Bool)

(declare-fun Unit!4048 () Unit!4039)

(assert (=> b!129656 (= e!84612 Unit!4048)))

(declare-fun lt!67339 () Unit!4039)

(assert (=> b!129656 (= lt!67339 (lemmaInListMapThenSeekEntryOrOpenFindsIt!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)))))

(assert (=> b!129656 (= lt!67313 call!14104)))

(declare-fun res!62562 () Bool)

(assert (=> b!129656 (= res!62562 ((_ is Found!272) lt!67313))))

(assert (=> b!129656 (=> (not res!62562) (not e!84611))))

(assert (=> b!129656 e!84611))

(declare-fun lt!67335 () Unit!4039)

(assert (=> b!129656 (= lt!67335 lt!67339)))

(assert (=> b!129656 false))

(declare-fun b!129657 () Bool)

(declare-fun res!62554 () Bool)

(assert (=> b!129657 (=> (not res!62554) (not e!84607))))

(assert (=> b!129657 (= res!62554 call!14105)))

(assert (=> b!129657 (= e!84606 e!84607)))

(declare-fun bm!14103 () Bool)

(assert (=> bm!14103 (= call!14105 call!14106)))

(declare-fun b!129658 () Bool)

(declare-fun res!62558 () Bool)

(assert (=> b!129658 (=> (not res!62558) (not e!84610))))

(assert (=> b!129658 (= res!62558 (contains!889 (map!1398 (_2!1316 lt!67334)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129659 () Bool)

(declare-fun res!62561 () Bool)

(assert (=> b!129659 (= res!62561 call!14106)))

(assert (=> b!129659 (=> (not res!62561) (not e!84611))))

(declare-fun b!129660 () Bool)

(declare-fun Unit!4049 () Unit!4039)

(assert (=> b!129660 (= e!84608 Unit!4049)))

(assert (= (and d!39271 c!23844) b!129656))

(assert (= (and d!39271 (not c!23844)) b!129645))

(assert (= (and b!129656 res!62562) b!129659))

(assert (= (and b!129659 res!62561) b!129651))

(assert (= (and b!129645 c!23843) b!129657))

(assert (= (and b!129645 (not c!23843)) b!129650))

(assert (= (and b!129657 res!62554) b!129644))

(assert (= (and b!129644 res!62556) b!129646))

(assert (= (and b!129650 c!23841) b!129654))

(assert (= (and b!129650 (not c!23841)) b!129652))

(assert (= (and b!129654 res!62560) b!129647))

(assert (= (and b!129647 res!62559) b!129655))

(assert (= (or b!129657 b!129654) bm!14103))

(assert (= (or b!129646 b!129655) bm!14100))

(assert (= (or b!129659 bm!14103) bm!14102))

(assert (= (or b!129656 b!129645) bm!14101))

(assert (= (and d!39271 c!23842) b!129653))

(assert (= (and d!39271 (not c!23842)) b!129660))

(assert (= (and d!39271 res!62557) b!129649))

(assert (= (and b!129649 res!62555) b!129658))

(assert (= (and b!129658 res!62558) b!129648))

(assert (=> b!129645 m!151769))

(assert (=> b!129645 m!151935))

(assert (=> b!129656 m!151769))

(assert (=> b!129656 m!151915))

(declare-fun m!152125 () Bool)

(assert (=> bm!14102 m!152125))

(declare-fun m!152127 () Bool)

(assert (=> b!129648 m!152127))

(assert (=> b!129648 m!151777))

(assert (=> b!129648 m!151777))

(declare-fun m!152129 () Bool)

(assert (=> b!129648 m!152129))

(declare-fun m!152131 () Bool)

(assert (=> b!129644 m!152131))

(declare-fun m!152133 () Bool)

(assert (=> b!129647 m!152133))

(assert (=> bm!14101 m!151769))

(assert (=> bm!14101 m!151913))

(assert (=> b!129658 m!152127))

(assert (=> b!129658 m!152127))

(assert (=> b!129658 m!151769))

(declare-fun m!152135 () Bool)

(assert (=> b!129658 m!152135))

(assert (=> b!129653 m!151769))

(declare-fun m!152137 () Bool)

(assert (=> b!129653 m!152137))

(assert (=> b!129653 m!151839))

(assert (=> b!129653 m!151839))

(assert (=> b!129653 m!151769))

(declare-fun m!152139 () Bool)

(assert (=> b!129653 m!152139))

(assert (=> bm!14100 m!151769))

(assert (=> bm!14100 m!151927))

(declare-fun m!152141 () Bool)

(assert (=> d!39271 m!152141))

(assert (=> d!39271 m!151769))

(assert (=> d!39271 m!151927))

(declare-fun m!152143 () Bool)

(assert (=> d!39271 m!152143))

(declare-fun m!152145 () Bool)

(assert (=> d!39271 m!152145))

(declare-fun m!152147 () Bool)

(assert (=> d!39271 m!152147))

(declare-fun m!152149 () Bool)

(assert (=> d!39271 m!152149))

(assert (=> d!39271 m!151831))

(declare-fun m!152151 () Bool)

(assert (=> d!39271 m!152151))

(declare-fun m!152153 () Bool)

(assert (=> d!39271 m!152153))

(assert (=> d!39271 m!151769))

(declare-fun m!152155 () Bool)

(assert (=> d!39271 m!152155))

(assert (=> d!39271 m!151839))

(assert (=> d!39271 m!151769))

(assert (=> d!39271 m!151767))

(declare-fun m!152157 () Bool)

(assert (=> d!39271 m!152157))

(declare-fun m!152159 () Bool)

(assert (=> d!39271 m!152159))

(declare-fun m!152161 () Bool)

(assert (=> d!39271 m!152161))

(assert (=> d!39271 m!152149))

(assert (=> d!39271 m!152161))

(declare-fun m!152163 () Bool)

(assert (=> d!39271 m!152163))

(assert (=> d!39271 m!151769))

(declare-fun m!152165 () Bool)

(assert (=> d!39271 m!152165))

(declare-fun m!152167 () Bool)

(assert (=> d!39271 m!152167))

(assert (=> d!39271 m!151769))

(declare-fun m!152169 () Bool)

(assert (=> d!39271 m!152169))

(assert (=> d!39271 m!151789))

(declare-fun m!152171 () Bool)

(assert (=> d!39271 m!152171))

(assert (=> d!39271 m!151769))

(declare-fun m!152173 () Bool)

(assert (=> d!39271 m!152173))

(assert (=> d!39271 m!151769))

(declare-fun m!152175 () Bool)

(assert (=> d!39271 m!152175))

(assert (=> d!39271 m!151839))

(declare-fun m!152177 () Bool)

(assert (=> d!39271 m!152177))

(assert (=> d!39271 m!151839))

(assert (=> d!39271 m!151769))

(assert (=> d!39271 m!152139))

(declare-fun m!152179 () Bool)

(assert (=> b!129651 m!152179))

(declare-fun m!152181 () Bool)

(assert (=> b!129649 m!152181))

(assert (=> bm!14067 d!39271))

(declare-fun d!39273 () Bool)

(assert (=> d!39273 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67172 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67343 () Unit!4039)

(declare-fun choose!788 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 V!3459 Int) Unit!4039)

(assert (=> d!39273 (= lt!67343 (choose!788 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) lt!67172 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39273 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39273 (= (lemmaChangeZeroKeyThenAddPairToListMap!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) lt!67172 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) (defaultEntry!2824 newMap!16)) lt!67343)))

(declare-fun bs!5368 () Bool)

(assert (= bs!5368 d!39273))

(assert (=> bs!5368 m!151839))

(declare-fun m!152183 () Bool)

(assert (=> bs!5368 m!152183))

(assert (=> bs!5368 m!151767))

(declare-fun m!152185 () Bool)

(assert (=> bs!5368 m!152185))

(assert (=> bs!5368 m!151839))

(assert (=> bs!5368 m!151767))

(declare-fun m!152187 () Bool)

(assert (=> bs!5368 m!152187))

(assert (=> bs!5368 m!151983))

(assert (=> b!129456 d!39273))

(declare-fun b!129673 () Bool)

(declare-fun e!84620 () SeekEntryResult!272)

(declare-fun lt!67352 () SeekEntryResult!272)

(assert (=> b!129673 (= e!84620 (MissingZero!272 (index!3247 lt!67352)))))

(declare-fun b!129674 () Bool)

(declare-fun c!23852 () Bool)

(declare-fun lt!67350 () (_ BitVec 64))

(assert (=> b!129674 (= c!23852 (= lt!67350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84622 () SeekEntryResult!272)

(assert (=> b!129674 (= e!84622 e!84620)))

(declare-fun b!129676 () Bool)

(assert (=> b!129676 (= e!84622 (Found!272 (index!3247 lt!67352)))))

(declare-fun b!129677 () Bool)

(declare-fun e!84621 () SeekEntryResult!272)

(assert (=> b!129677 (= e!84621 e!84622)))

(assert (=> b!129677 (= lt!67350 (select (arr!2243 (_keys!4565 newMap!16)) (index!3247 lt!67352)))))

(declare-fun c!23851 () Bool)

(assert (=> b!129677 (= c!23851 (= lt!67350 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129678 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4739 (_ BitVec 32)) SeekEntryResult!272)

(assert (=> b!129678 (= e!84620 (seekKeyOrZeroReturnVacant!0 (x!15267 lt!67352) (index!3247 lt!67352) (index!3247 lt!67352) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun lt!67351 () SeekEntryResult!272)

(declare-fun d!39275 () Bool)

(assert (=> d!39275 (and (or ((_ is Undefined!272) lt!67351) (not ((_ is Found!272) lt!67351)) (and (bvsge (index!3246 lt!67351) #b00000000000000000000000000000000) (bvslt (index!3246 lt!67351) (size!2509 (_keys!4565 newMap!16))))) (or ((_ is Undefined!272) lt!67351) ((_ is Found!272) lt!67351) (not ((_ is MissingZero!272) lt!67351)) (and (bvsge (index!3245 lt!67351) #b00000000000000000000000000000000) (bvslt (index!3245 lt!67351) (size!2509 (_keys!4565 newMap!16))))) (or ((_ is Undefined!272) lt!67351) ((_ is Found!272) lt!67351) ((_ is MissingZero!272) lt!67351) (not ((_ is MissingVacant!272) lt!67351)) (and (bvsge (index!3248 lt!67351) #b00000000000000000000000000000000) (bvslt (index!3248 lt!67351) (size!2509 (_keys!4565 newMap!16))))) (or ((_ is Undefined!272) lt!67351) (ite ((_ is Found!272) lt!67351) (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67351)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (ite ((_ is MissingZero!272) lt!67351) (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3245 lt!67351)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!272) lt!67351) (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3248 lt!67351)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39275 (= lt!67351 e!84621)))

(declare-fun c!23853 () Bool)

(assert (=> d!39275 (= c!23853 (and ((_ is Intermediate!272) lt!67352) (undefined!1084 lt!67352)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4739 (_ BitVec 32)) SeekEntryResult!272)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!39275 (= lt!67352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (mask!7102 newMap!16)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(assert (=> d!39275 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39275 (= (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)) lt!67351)))

(declare-fun b!129675 () Bool)

(assert (=> b!129675 (= e!84621 Undefined!272)))

(assert (= (and d!39275 c!23853) b!129675))

(assert (= (and d!39275 (not c!23853)) b!129677))

(assert (= (and b!129677 c!23851) b!129676))

(assert (= (and b!129677 (not c!23851)) b!129674))

(assert (= (and b!129674 c!23852) b!129673))

(assert (= (and b!129674 (not c!23852)) b!129678))

(declare-fun m!152189 () Bool)

(assert (=> b!129677 m!152189))

(assert (=> b!129678 m!151769))

(declare-fun m!152191 () Bool)

(assert (=> b!129678 m!152191))

(declare-fun m!152193 () Bool)

(assert (=> d!39275 m!152193))

(assert (=> d!39275 m!151983))

(declare-fun m!152195 () Bool)

(assert (=> d!39275 m!152195))

(assert (=> d!39275 m!151769))

(declare-fun m!152197 () Bool)

(assert (=> d!39275 m!152197))

(declare-fun m!152199 () Bool)

(assert (=> d!39275 m!152199))

(declare-fun m!152201 () Bool)

(assert (=> d!39275 m!152201))

(assert (=> d!39275 m!151769))

(assert (=> d!39275 m!152195))

(assert (=> bm!14052 d!39275))

(declare-fun d!39277 () Bool)

(declare-fun e!84623 () Bool)

(assert (=> d!39277 e!84623))

(declare-fun res!62563 () Bool)

(assert (=> d!39277 (=> res!62563 e!84623)))

(declare-fun lt!67356 () Bool)

(assert (=> d!39277 (= res!62563 (not lt!67356))))

(declare-fun lt!67355 () Bool)

(assert (=> d!39277 (= lt!67356 lt!67355)))

(declare-fun lt!67354 () Unit!4039)

(declare-fun e!84624 () Unit!4039)

(assert (=> d!39277 (= lt!67354 e!84624)))

(declare-fun c!23854 () Bool)

(assert (=> d!39277 (= c!23854 lt!67355)))

(assert (=> d!39277 (= lt!67355 (containsKey!173 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39277 (= (contains!889 lt!67067 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67356)))

(declare-fun b!129679 () Bool)

(declare-fun lt!67353 () Unit!4039)

(assert (=> b!129679 (= e!84624 lt!67353)))

(assert (=> b!129679 (= lt!67353 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129679 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129680 () Bool)

(declare-fun Unit!4050 () Unit!4039)

(assert (=> b!129680 (= e!84624 Unit!4050)))

(declare-fun b!129681 () Bool)

(assert (=> b!129681 (= e!84623 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39277 c!23854) b!129679))

(assert (= (and d!39277 (not c!23854)) b!129680))

(assert (= (and d!39277 (not res!62563)) b!129681))

(declare-fun m!152203 () Bool)

(assert (=> d!39277 m!152203))

(declare-fun m!152205 () Bool)

(assert (=> b!129679 m!152205))

(declare-fun m!152207 () Bool)

(assert (=> b!129679 m!152207))

(assert (=> b!129679 m!152207))

(declare-fun m!152209 () Bool)

(assert (=> b!129679 m!152209))

(assert (=> b!129681 m!152207))

(assert (=> b!129681 m!152207))

(assert (=> b!129681 m!152209))

(assert (=> bm!13997 d!39277))

(declare-fun d!39279 () Bool)

(assert (=> d!39279 (isDefined!122 (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun lt!67359 () Unit!4039)

(declare-fun choose!789 (List!1708 (_ BitVec 64)) Unit!4039)

(assert (=> d!39279 (= lt!67359 (choose!789 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun e!84627 () Bool)

(assert (=> d!39279 e!84627))

(declare-fun res!62566 () Bool)

(assert (=> d!39279 (=> (not res!62566) (not e!84627))))

(declare-fun isStrictlySorted!319 (List!1708) Bool)

(assert (=> d!39279 (= res!62566 (isStrictlySorted!319 (toList!864 lt!67005)))))

(assert (=> d!39279 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67359)))

(declare-fun b!129684 () Bool)

(assert (=> b!129684 (= e!84627 (containsKey!173 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39279 res!62566) b!129684))

(assert (=> d!39279 m!151769))

(assert (=> d!39279 m!151901))

(assert (=> d!39279 m!151901))

(assert (=> d!39279 m!151903))

(assert (=> d!39279 m!151769))

(declare-fun m!152211 () Bool)

(assert (=> d!39279 m!152211))

(declare-fun m!152213 () Bool)

(assert (=> d!39279 m!152213))

(assert (=> b!129684 m!151769))

(assert (=> b!129684 m!151897))

(assert (=> b!129359 d!39279))

(declare-fun d!39281 () Bool)

(declare-fun isEmpty!403 (Option!175) Bool)

(assert (=> d!39281 (= (isDefined!122 (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))) (not (isEmpty!403 (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun bs!5369 () Bool)

(assert (= bs!5369 d!39281))

(assert (=> bs!5369 m!151901))

(declare-fun m!152215 () Bool)

(assert (=> bs!5369 m!152215))

(assert (=> b!129359 d!39281))

(declare-fun b!129695 () Bool)

(declare-fun e!84633 () Option!175)

(assert (=> b!129695 (= e!84633 (getValueByKey!169 (t!6107 (toList!864 lt!67005)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129693 () Bool)

(declare-fun e!84632 () Option!175)

(assert (=> b!129693 (= e!84632 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67005)))))))

(declare-fun b!129694 () Bool)

(assert (=> b!129694 (= e!84632 e!84633)))

(declare-fun c!23860 () Bool)

(assert (=> b!129694 (= c!23860 (and ((_ is Cons!1704) (toList!864 lt!67005)) (not (= (_1!1315 (h!2308 (toList!864 lt!67005))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun d!39283 () Bool)

(declare-fun c!23859 () Bool)

(assert (=> d!39283 (= c!23859 (and ((_ is Cons!1704) (toList!864 lt!67005)) (= (_1!1315 (h!2308 (toList!864 lt!67005))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39283 (= (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) e!84632)))

(declare-fun b!129696 () Bool)

(assert (=> b!129696 (= e!84633 None!173)))

(assert (= (and d!39283 c!23859) b!129693))

(assert (= (and d!39283 (not c!23859)) b!129694))

(assert (= (and b!129694 c!23860) b!129695))

(assert (= (and b!129694 (not c!23860)) b!129696))

(assert (=> b!129695 m!151769))

(declare-fun m!152217 () Bool)

(assert (=> b!129695 m!152217))

(assert (=> b!129359 d!39283))

(declare-fun d!39285 () Bool)

(declare-fun e!84634 () Bool)

(assert (=> d!39285 e!84634))

(declare-fun res!62567 () Bool)

(assert (=> d!39285 (=> res!62567 e!84634)))

(declare-fun lt!67363 () Bool)

(assert (=> d!39285 (= res!62567 (not lt!67363))))

(declare-fun lt!67362 () Bool)

(assert (=> d!39285 (= lt!67363 lt!67362)))

(declare-fun lt!67361 () Unit!4039)

(declare-fun e!84635 () Unit!4039)

(assert (=> d!39285 (= lt!67361 e!84635)))

(declare-fun c!23861 () Bool)

(assert (=> d!39285 (= c!23861 lt!67362)))

(assert (=> d!39285 (= lt!67362 (containsKey!173 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39285 (= (contains!889 call!14078 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67363)))

(declare-fun b!129697 () Bool)

(declare-fun lt!67360 () Unit!4039)

(assert (=> b!129697 (= e!84635 lt!67360)))

(assert (=> b!129697 (= lt!67360 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!129697 (isDefined!122 (getValueByKey!169 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129698 () Bool)

(declare-fun Unit!4051 () Unit!4039)

(assert (=> b!129698 (= e!84635 Unit!4051)))

(declare-fun b!129699 () Bool)

(assert (=> b!129699 (= e!84634 (isDefined!122 (getValueByKey!169 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (= (and d!39285 c!23861) b!129697))

(assert (= (and d!39285 (not c!23861)) b!129698))

(assert (= (and d!39285 (not res!62567)) b!129699))

(assert (=> d!39285 m!151769))

(declare-fun m!152219 () Bool)

(assert (=> d!39285 m!152219))

(assert (=> b!129697 m!151769))

(declare-fun m!152221 () Bool)

(assert (=> b!129697 m!152221))

(assert (=> b!129697 m!151769))

(declare-fun m!152223 () Bool)

(assert (=> b!129697 m!152223))

(assert (=> b!129697 m!152223))

(declare-fun m!152225 () Bool)

(assert (=> b!129697 m!152225))

(assert (=> b!129699 m!151769))

(assert (=> b!129699 m!152223))

(assert (=> b!129699 m!152223))

(assert (=> b!129699 m!152225))

(assert (=> b!129459 d!39285))

(declare-fun d!39287 () Bool)

(assert (=> d!39287 (= (apply!113 lt!67067 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5370 () Bool)

(assert (= bs!5370 d!39287))

(assert (=> bs!5370 m!152207))

(assert (=> bs!5370 m!152207))

(declare-fun m!152227 () Bool)

(assert (=> bs!5370 m!152227))

(assert (=> b!129350 d!39287))

(declare-fun d!39289 () Bool)

(assert (=> d!39289 (= (apply!113 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67065) (apply!113 lt!67061 lt!67065))))

(declare-fun lt!67366 () Unit!4039)

(declare-fun choose!790 (ListLongMap!1697 (_ BitVec 64) V!3459 (_ BitVec 64)) Unit!4039)

(assert (=> d!39289 (= lt!67366 (choose!790 lt!67061 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67065))))

(declare-fun e!84638 () Bool)

(assert (=> d!39289 e!84638))

(declare-fun res!62570 () Bool)

(assert (=> d!39289 (=> (not res!62570) (not e!84638))))

(assert (=> d!39289 (= res!62570 (contains!889 lt!67061 lt!67065))))

(assert (=> d!39289 (= (addApplyDifferent!89 lt!67061 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67065) lt!67366)))

(declare-fun b!129703 () Bool)

(assert (=> b!129703 (= e!84638 (not (= lt!67065 lt!67064)))))

(assert (= (and d!39289 res!62570) b!129703))

(assert (=> d!39289 m!151887))

(assert (=> d!39289 m!151889))

(declare-fun m!152229 () Bool)

(assert (=> d!39289 m!152229))

(assert (=> d!39289 m!151887))

(assert (=> d!39289 m!151877))

(declare-fun m!152231 () Bool)

(assert (=> d!39289 m!152231))

(assert (=> b!129335 d!39289))

(declare-fun d!39291 () Bool)

(declare-fun e!84639 () Bool)

(assert (=> d!39291 e!84639))

(declare-fun res!62571 () Bool)

(assert (=> d!39291 (=> (not res!62571) (not e!84639))))

(declare-fun lt!67368 () ListLongMap!1697)

(assert (=> d!39291 (= res!62571 (contains!889 lt!67368 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67369 () List!1708)

(assert (=> d!39291 (= lt!67368 (ListLongMap!1698 lt!67369))))

(declare-fun lt!67370 () Unit!4039)

(declare-fun lt!67367 () Unit!4039)

(assert (=> d!39291 (= lt!67370 lt!67367)))

(assert (=> d!39291 (= (getValueByKey!169 lt!67369 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39291 (= lt!67367 (lemmaContainsTupThenGetReturnValue!84 lt!67369 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39291 (= lt!67369 (insertStrictlySorted!87 (toList!864 lt!67069) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39291 (= (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67368)))

(declare-fun b!129704 () Bool)

(declare-fun res!62572 () Bool)

(assert (=> b!129704 (=> (not res!62572) (not e!84639))))

(assert (=> b!129704 (= res!62572 (= (getValueByKey!169 (toList!864 lt!67368) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!129705 () Bool)

(assert (=> b!129705 (= e!84639 (contains!890 (toList!864 lt!67368) (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39291 res!62571) b!129704))

(assert (= (and b!129704 res!62572) b!129705))

(declare-fun m!152233 () Bool)

(assert (=> d!39291 m!152233))

(declare-fun m!152235 () Bool)

(assert (=> d!39291 m!152235))

(declare-fun m!152237 () Bool)

(assert (=> d!39291 m!152237))

(declare-fun m!152239 () Bool)

(assert (=> d!39291 m!152239))

(declare-fun m!152241 () Bool)

(assert (=> b!129704 m!152241))

(declare-fun m!152243 () Bool)

(assert (=> b!129705 m!152243))

(assert (=> b!129335 d!39291))

(declare-fun d!39293 () Bool)

(declare-fun e!84640 () Bool)

(assert (=> d!39293 e!84640))

(declare-fun res!62573 () Bool)

(assert (=> d!39293 (=> (not res!62573) (not e!84640))))

(declare-fun lt!67372 () ListLongMap!1697)

(assert (=> d!39293 (= res!62573 (contains!889 lt!67372 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67373 () List!1708)

(assert (=> d!39293 (= lt!67372 (ListLongMap!1698 lt!67373))))

(declare-fun lt!67374 () Unit!4039)

(declare-fun lt!67371 () Unit!4039)

(assert (=> d!39293 (= lt!67374 lt!67371)))

(assert (=> d!39293 (= (getValueByKey!169 lt!67373 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39293 (= lt!67371 (lemmaContainsTupThenGetReturnValue!84 lt!67373 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39293 (= lt!67373 (insertStrictlySorted!87 (toList!864 lt!67071) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39293 (= (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67372)))

(declare-fun b!129706 () Bool)

(declare-fun res!62574 () Bool)

(assert (=> b!129706 (=> (not res!62574) (not e!84640))))

(assert (=> b!129706 (= res!62574 (= (getValueByKey!169 (toList!864 lt!67372) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!129707 () Bool)

(assert (=> b!129707 (= e!84640 (contains!890 (toList!864 lt!67372) (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39293 res!62573) b!129706))

(assert (= (and b!129706 res!62574) b!129707))

(declare-fun m!152245 () Bool)

(assert (=> d!39293 m!152245))

(declare-fun m!152247 () Bool)

(assert (=> d!39293 m!152247))

(declare-fun m!152249 () Bool)

(assert (=> d!39293 m!152249))

(declare-fun m!152251 () Bool)

(assert (=> d!39293 m!152251))

(declare-fun m!152253 () Bool)

(assert (=> b!129706 m!152253))

(declare-fun m!152255 () Bool)

(assert (=> b!129707 m!152255))

(assert (=> b!129335 d!39293))

(assert (=> b!129335 d!39249))

(declare-fun d!39295 () Bool)

(assert (=> d!39295 (= (apply!113 lt!67071 lt!67066) (get!1466 (getValueByKey!169 (toList!864 lt!67071) lt!67066)))))

(declare-fun bs!5371 () Bool)

(assert (= bs!5371 d!39295))

(declare-fun m!152257 () Bool)

(assert (=> bs!5371 m!152257))

(assert (=> bs!5371 m!152257))

(declare-fun m!152259 () Bool)

(assert (=> bs!5371 m!152259))

(assert (=> b!129335 d!39295))

(declare-fun d!39297 () Bool)

(assert (=> d!39297 (= (apply!113 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67066) (apply!113 lt!67071 lt!67066))))

(declare-fun lt!67375 () Unit!4039)

(assert (=> d!39297 (= lt!67375 (choose!790 lt!67071 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67066))))

(declare-fun e!84641 () Bool)

(assert (=> d!39297 e!84641))

(declare-fun res!62575 () Bool)

(assert (=> d!39297 (=> (not res!62575) (not e!84641))))

(assert (=> d!39297 (= res!62575 (contains!889 lt!67071 lt!67066))))

(assert (=> d!39297 (= (addApplyDifferent!89 lt!67071 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67066) lt!67375)))

(declare-fun b!129708 () Bool)

(assert (=> b!129708 (= e!84641 (not (= lt!67066 lt!67080)))))

(assert (= (and d!39297 res!62575) b!129708))

(assert (=> d!39297 m!151875))

(assert (=> d!39297 m!151891))

(declare-fun m!152261 () Bool)

(assert (=> d!39297 m!152261))

(assert (=> d!39297 m!151875))

(assert (=> d!39297 m!151885))

(declare-fun m!152263 () Bool)

(assert (=> d!39297 m!152263))

(assert (=> b!129335 d!39297))

(declare-fun d!39299 () Bool)

(assert (=> d!39299 (= (apply!113 lt!67069 lt!67063) (get!1466 (getValueByKey!169 (toList!864 lt!67069) lt!67063)))))

(declare-fun bs!5372 () Bool)

(assert (= bs!5372 d!39299))

(declare-fun m!152265 () Bool)

(assert (=> bs!5372 m!152265))

(assert (=> bs!5372 m!152265))

(declare-fun m!152267 () Bool)

(assert (=> bs!5372 m!152267))

(assert (=> b!129335 d!39299))

(declare-fun d!39301 () Bool)

(declare-fun e!84642 () Bool)

(assert (=> d!39301 e!84642))

(declare-fun res!62576 () Bool)

(assert (=> d!39301 (=> (not res!62576) (not e!84642))))

(declare-fun lt!67377 () ListLongMap!1697)

(assert (=> d!39301 (= res!62576 (contains!889 lt!67377 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67378 () List!1708)

(assert (=> d!39301 (= lt!67377 (ListLongMap!1698 lt!67378))))

(declare-fun lt!67379 () Unit!4039)

(declare-fun lt!67376 () Unit!4039)

(assert (=> d!39301 (= lt!67379 lt!67376)))

(assert (=> d!39301 (= (getValueByKey!169 lt!67378 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39301 (= lt!67376 (lemmaContainsTupThenGetReturnValue!84 lt!67378 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39301 (= lt!67378 (insertStrictlySorted!87 (toList!864 lt!67079) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39301 (= (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67377)))

(declare-fun b!129709 () Bool)

(declare-fun res!62577 () Bool)

(assert (=> b!129709 (=> (not res!62577) (not e!84642))))

(assert (=> b!129709 (= res!62577 (= (getValueByKey!169 (toList!864 lt!67377) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!129710 () Bool)

(assert (=> b!129710 (= e!84642 (contains!890 (toList!864 lt!67377) (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39301 res!62576) b!129709))

(assert (= (and b!129709 res!62577) b!129710))

(declare-fun m!152269 () Bool)

(assert (=> d!39301 m!152269))

(declare-fun m!152271 () Bool)

(assert (=> d!39301 m!152271))

(declare-fun m!152273 () Bool)

(assert (=> d!39301 m!152273))

(declare-fun m!152275 () Bool)

(assert (=> d!39301 m!152275))

(declare-fun m!152277 () Bool)

(assert (=> b!129709 m!152277))

(declare-fun m!152279 () Bool)

(assert (=> b!129710 m!152279))

(assert (=> b!129335 d!39301))

(declare-fun d!39303 () Bool)

(declare-fun e!84643 () Bool)

(assert (=> d!39303 e!84643))

(declare-fun res!62578 () Bool)

(assert (=> d!39303 (=> res!62578 e!84643)))

(declare-fun lt!67383 () Bool)

(assert (=> d!39303 (= res!62578 (not lt!67383))))

(declare-fun lt!67382 () Bool)

(assert (=> d!39303 (= lt!67383 lt!67382)))

(declare-fun lt!67381 () Unit!4039)

(declare-fun e!84644 () Unit!4039)

(assert (=> d!39303 (= lt!67381 e!84644)))

(declare-fun c!23862 () Bool)

(assert (=> d!39303 (= c!23862 lt!67382)))

(assert (=> d!39303 (= lt!67382 (containsKey!173 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068))))

(assert (=> d!39303 (= (contains!889 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67068) lt!67383)))

(declare-fun b!129711 () Bool)

(declare-fun lt!67380 () Unit!4039)

(assert (=> b!129711 (= e!84644 lt!67380)))

(assert (=> b!129711 (= lt!67380 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068))))

(assert (=> b!129711 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068))))

(declare-fun b!129712 () Bool)

(declare-fun Unit!4052 () Unit!4039)

(assert (=> b!129712 (= e!84644 Unit!4052)))

(declare-fun b!129713 () Bool)

(assert (=> b!129713 (= e!84643 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068)))))

(assert (= (and d!39303 c!23862) b!129711))

(assert (= (and d!39303 (not c!23862)) b!129712))

(assert (= (and d!39303 (not res!62578)) b!129713))

(declare-fun m!152281 () Bool)

(assert (=> d!39303 m!152281))

(declare-fun m!152283 () Bool)

(assert (=> b!129711 m!152283))

(declare-fun m!152285 () Bool)

(assert (=> b!129711 m!152285))

(assert (=> b!129711 m!152285))

(declare-fun m!152287 () Bool)

(assert (=> b!129711 m!152287))

(assert (=> b!129713 m!152285))

(assert (=> b!129713 m!152285))

(assert (=> b!129713 m!152287))

(assert (=> b!129335 d!39303))

(declare-fun d!39305 () Bool)

(assert (=> d!39305 (= (apply!113 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67066) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67066)))))

(declare-fun bs!5373 () Bool)

(assert (= bs!5373 d!39305))

(declare-fun m!152289 () Bool)

(assert (=> bs!5373 m!152289))

(assert (=> bs!5373 m!152289))

(declare-fun m!152291 () Bool)

(assert (=> bs!5373 m!152291))

(assert (=> b!129335 d!39305))

(declare-fun d!39307 () Bool)

(assert (=> d!39307 (= (apply!113 lt!67061 lt!67065) (get!1466 (getValueByKey!169 (toList!864 lt!67061) lt!67065)))))

(declare-fun bs!5374 () Bool)

(assert (= bs!5374 d!39307))

(declare-fun m!152293 () Bool)

(assert (=> bs!5374 m!152293))

(assert (=> bs!5374 m!152293))

(declare-fun m!152295 () Bool)

(assert (=> bs!5374 m!152295))

(assert (=> b!129335 d!39307))

(declare-fun d!39309 () Bool)

(assert (=> d!39309 (= (apply!113 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67063) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67063)))))

(declare-fun bs!5375 () Bool)

(assert (= bs!5375 d!39309))

(declare-fun m!152297 () Bool)

(assert (=> bs!5375 m!152297))

(assert (=> bs!5375 m!152297))

(declare-fun m!152299 () Bool)

(assert (=> bs!5375 m!152299))

(assert (=> b!129335 d!39309))

(declare-fun d!39311 () Bool)

(assert (=> d!39311 (= (apply!113 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67065) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67065)))))

(declare-fun bs!5376 () Bool)

(assert (= bs!5376 d!39311))

(declare-fun m!152301 () Bool)

(assert (=> bs!5376 m!152301))

(assert (=> bs!5376 m!152301))

(declare-fun m!152303 () Bool)

(assert (=> bs!5376 m!152303))

(assert (=> b!129335 d!39311))

(declare-fun d!39313 () Bool)

(assert (=> d!39313 (= (apply!113 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67063) (apply!113 lt!67069 lt!67063))))

(declare-fun lt!67384 () Unit!4039)

(assert (=> d!39313 (= lt!67384 (choose!790 lt!67069 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67063))))

(declare-fun e!84645 () Bool)

(assert (=> d!39313 e!84645))

(declare-fun res!62579 () Bool)

(assert (=> d!39313 (=> (not res!62579) (not e!84645))))

(assert (=> d!39313 (= res!62579 (contains!889 lt!67069 lt!67063))))

(assert (=> d!39313 (= (addApplyDifferent!89 lt!67069 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67063) lt!67384)))

(declare-fun b!129714 () Bool)

(assert (=> b!129714 (= e!84645 (not (= lt!67063 lt!67072)))))

(assert (= (and d!39313 res!62579) b!129714))

(assert (=> d!39313 m!151869))

(assert (=> d!39313 m!151871))

(declare-fun m!152305 () Bool)

(assert (=> d!39313 m!152305))

(assert (=> d!39313 m!151869))

(assert (=> d!39313 m!151893))

(declare-fun m!152307 () Bool)

(assert (=> d!39313 m!152307))

(assert (=> b!129335 d!39313))

(declare-fun d!39315 () Bool)

(assert (=> d!39315 (contains!889 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67068)))

(declare-fun lt!67387 () Unit!4039)

(declare-fun choose!791 (ListLongMap!1697 (_ BitVec 64) V!3459 (_ BitVec 64)) Unit!4039)

(assert (=> d!39315 (= lt!67387 (choose!791 lt!67079 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67068))))

(assert (=> d!39315 (contains!889 lt!67079 lt!67068)))

(assert (=> d!39315 (= (addStillContains!89 lt!67079 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67068) lt!67387)))

(declare-fun bs!5377 () Bool)

(assert (= bs!5377 d!39315))

(assert (=> bs!5377 m!151881))

(assert (=> bs!5377 m!151881))

(assert (=> bs!5377 m!151883))

(declare-fun m!152309 () Bool)

(assert (=> bs!5377 m!152309))

(declare-fun m!152311 () Bool)

(assert (=> bs!5377 m!152311))

(assert (=> b!129335 d!39315))

(declare-fun d!39317 () Bool)

(declare-fun e!84646 () Bool)

(assert (=> d!39317 e!84646))

(declare-fun res!62580 () Bool)

(assert (=> d!39317 (=> (not res!62580) (not e!84646))))

(declare-fun lt!67389 () ListLongMap!1697)

(assert (=> d!39317 (= res!62580 (contains!889 lt!67389 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67390 () List!1708)

(assert (=> d!39317 (= lt!67389 (ListLongMap!1698 lt!67390))))

(declare-fun lt!67391 () Unit!4039)

(declare-fun lt!67388 () Unit!4039)

(assert (=> d!39317 (= lt!67391 lt!67388)))

(assert (=> d!39317 (= (getValueByKey!169 lt!67390 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39317 (= lt!67388 (lemmaContainsTupThenGetReturnValue!84 lt!67390 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39317 (= lt!67390 (insertStrictlySorted!87 (toList!864 lt!67061) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39317 (= (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67389)))

(declare-fun b!129716 () Bool)

(declare-fun res!62581 () Bool)

(assert (=> b!129716 (=> (not res!62581) (not e!84646))))

(assert (=> b!129716 (= res!62581 (= (getValueByKey!169 (toList!864 lt!67389) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!129717 () Bool)

(assert (=> b!129717 (= e!84646 (contains!890 (toList!864 lt!67389) (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39317 res!62580) b!129716))

(assert (= (and b!129716 res!62581) b!129717))

(declare-fun m!152313 () Bool)

(assert (=> d!39317 m!152313))

(declare-fun m!152315 () Bool)

(assert (=> d!39317 m!152315))

(declare-fun m!152317 () Bool)

(assert (=> d!39317 m!152317))

(declare-fun m!152319 () Bool)

(assert (=> d!39317 m!152319))

(declare-fun m!152321 () Bool)

(assert (=> b!129716 m!152321))

(declare-fun m!152323 () Bool)

(assert (=> b!129717 m!152323))

(assert (=> b!129335 d!39317))

(declare-fun d!39319 () Bool)

(assert (=> d!39319 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67394 () Unit!4039)

(declare-fun choose!792 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 V!3459 Int) Unit!4039)

(assert (=> d!39319 (= lt!67394 (choose!792 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39319 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39319 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)) lt!67394)))

(declare-fun bs!5378 () Bool)

(assert (= bs!5378 d!39319))

(assert (=> bs!5378 m!151983))

(assert (=> bs!5378 m!151767))

(declare-fun m!152325 () Bool)

(assert (=> bs!5378 m!152325))

(assert (=> bs!5378 m!151767))

(declare-fun m!152327 () Bool)

(assert (=> bs!5378 m!152327))

(assert (=> bs!5378 m!151839))

(declare-fun m!152329 () Bool)

(assert (=> bs!5378 m!152329))

(assert (=> bs!5378 m!151839))

(assert (=> b!129458 d!39319))

(declare-fun d!39321 () Bool)

(declare-fun e!84647 () Bool)

(assert (=> d!39321 e!84647))

(declare-fun res!62582 () Bool)

(assert (=> d!39321 (=> (not res!62582) (not e!84647))))

(declare-fun lt!67396 () ListLongMap!1697)

(assert (=> d!39321 (= res!62582 (contains!889 lt!67396 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67397 () List!1708)

(assert (=> d!39321 (= lt!67396 (ListLongMap!1698 lt!67397))))

(declare-fun lt!67398 () Unit!4039)

(declare-fun lt!67395 () Unit!4039)

(assert (=> d!39321 (= lt!67398 lt!67395)))

(assert (=> d!39321 (= (getValueByKey!169 lt!67397 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39321 (= lt!67395 (lemmaContainsTupThenGetReturnValue!84 lt!67397 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39321 (= lt!67397 (insertStrictlySorted!87 (toList!864 call!14002) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39321 (= (+!172 call!14002 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67396)))

(declare-fun b!129718 () Bool)

(declare-fun res!62583 () Bool)

(assert (=> b!129718 (=> (not res!62583) (not e!84647))))

(assert (=> b!129718 (= res!62583 (= (getValueByKey!169 (toList!864 lt!67396) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!129719 () Bool)

(assert (=> b!129719 (= e!84647 (contains!890 (toList!864 lt!67396) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39321 res!62582) b!129718))

(assert (= (and b!129718 res!62583) b!129719))

(declare-fun m!152331 () Bool)

(assert (=> d!39321 m!152331))

(declare-fun m!152333 () Bool)

(assert (=> d!39321 m!152333))

(declare-fun m!152335 () Bool)

(assert (=> d!39321 m!152335))

(declare-fun m!152337 () Bool)

(assert (=> d!39321 m!152337))

(declare-fun m!152339 () Bool)

(assert (=> b!129718 m!152339))

(declare-fun m!152341 () Bool)

(assert (=> b!129719 m!152341))

(assert (=> b!129351 d!39321))

(assert (=> b!129443 d!39275))

(declare-fun d!39323 () Bool)

(declare-fun e!84648 () Bool)

(assert (=> d!39323 e!84648))

(declare-fun res!62584 () Bool)

(assert (=> d!39323 (=> res!62584 e!84648)))

(declare-fun lt!67402 () Bool)

(assert (=> d!39323 (= res!62584 (not lt!67402))))

(declare-fun lt!67401 () Bool)

(assert (=> d!39323 (= lt!67402 lt!67401)))

(declare-fun lt!67400 () Unit!4039)

(declare-fun e!84649 () Unit!4039)

(assert (=> d!39323 (= lt!67400 e!84649)))

(declare-fun c!23863 () Bool)

(assert (=> d!39323 (= c!23863 lt!67401)))

(assert (=> d!39323 (= lt!67401 (containsKey!173 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39323 (= (contains!889 lt!67067 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67402)))

(declare-fun b!129720 () Bool)

(declare-fun lt!67399 () Unit!4039)

(assert (=> b!129720 (= e!84649 lt!67399)))

(assert (=> b!129720 (= lt!67399 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129720 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129721 () Bool)

(declare-fun Unit!4053 () Unit!4039)

(assert (=> b!129721 (= e!84649 Unit!4053)))

(declare-fun b!129722 () Bool)

(assert (=> b!129722 (= e!84648 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39323 c!23863) b!129720))

(assert (= (and d!39323 (not c!23863)) b!129721))

(assert (= (and d!39323 (not res!62584)) b!129722))

(declare-fun m!152343 () Bool)

(assert (=> d!39323 m!152343))

(declare-fun m!152345 () Bool)

(assert (=> b!129720 m!152345))

(assert (=> b!129720 m!152111))

(assert (=> b!129720 m!152111))

(declare-fun m!152347 () Bool)

(assert (=> b!129720 m!152347))

(assert (=> b!129722 m!152111))

(assert (=> b!129722 m!152111))

(assert (=> b!129722 m!152347))

(assert (=> bm!13999 d!39323))

(declare-fun bm!14106 () Bool)

(declare-fun call!14109 () (_ BitVec 32))

(assert (=> bm!14106 (= call!14109 (arrayCountValidKeys!0 (_keys!4565 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129731 () Bool)

(declare-fun e!84655 () (_ BitVec 32))

(assert (=> b!129731 (= e!84655 (bvadd #b00000000000000000000000000000001 call!14109))))

(declare-fun d!39325 () Bool)

(declare-fun lt!67405 () (_ BitVec 32))

(assert (=> d!39325 (and (bvsge lt!67405 #b00000000000000000000000000000000) (bvsle lt!67405 (bvsub (size!2509 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!84654 () (_ BitVec 32))

(assert (=> d!39325 (= lt!67405 e!84654)))

(declare-fun c!23868 () Bool)

(assert (=> d!39325 (= c!23868 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39325 (and (bvsle #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2509 (_keys!4565 newMap!16)) (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39325 (= (arrayCountValidKeys!0 (_keys!4565 newMap!16) #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) lt!67405)))

(declare-fun b!129732 () Bool)

(assert (=> b!129732 (= e!84655 call!14109)))

(declare-fun b!129733 () Bool)

(assert (=> b!129733 (= e!84654 e!84655)))

(declare-fun c!23869 () Bool)

(assert (=> b!129733 (= c!23869 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129734 () Bool)

(assert (=> b!129734 (= e!84654 #b00000000000000000000000000000000)))

(assert (= (and d!39325 c!23868) b!129734))

(assert (= (and d!39325 (not c!23868)) b!129733))

(assert (= (and b!129733 c!23869) b!129731))

(assert (= (and b!129733 (not c!23869)) b!129732))

(assert (= (or b!129731 b!129732) bm!14106))

(declare-fun m!152349 () Bool)

(assert (=> bm!14106 m!152349))

(assert (=> b!129733 m!152013))

(assert (=> b!129733 m!152013))

(assert (=> b!129733 m!152019))

(assert (=> b!129287 d!39325))

(declare-fun b!129735 () Bool)

(declare-fun e!84666 () Bool)

(declare-fun lt!67412 () ListLongMap!1697)

(assert (=> b!129735 (= e!84666 (= (apply!113 lt!67412 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (_values!2807 newMap!16))))))

(assert (=> b!129735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129736 () Bool)

(declare-fun e!84658 () Bool)

(declare-fun e!84665 () Bool)

(assert (=> b!129736 (= e!84658 e!84665)))

(declare-fun res!62591 () Bool)

(declare-fun call!14114 () Bool)

(assert (=> b!129736 (= res!62591 call!14114)))

(assert (=> b!129736 (=> (not res!62591) (not e!84665))))

(declare-fun b!129737 () Bool)

(declare-fun e!84667 () Bool)

(declare-fun call!14115 () Bool)

(assert (=> b!129737 (= e!84667 (not call!14115))))

(declare-fun bm!14107 () Bool)

(assert (=> bm!14107 (= call!14115 (contains!889 lt!67412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129738 () Bool)

(declare-fun e!84668 () Unit!4039)

(declare-fun lt!67422 () Unit!4039)

(assert (=> b!129738 (= e!84668 lt!67422)))

(declare-fun lt!67424 () ListLongMap!1697)

(assert (=> b!129738 (= lt!67424 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67420 () (_ BitVec 64))

(assert (=> b!129738 (= lt!67420 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67413 () (_ BitVec 64))

(assert (=> b!129738 (= lt!67413 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67419 () Unit!4039)

(assert (=> b!129738 (= lt!67419 (addStillContains!89 lt!67424 lt!67420 (zeroValue!2683 newMap!16) lt!67413))))

(assert (=> b!129738 (contains!889 (+!172 lt!67424 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16))) lt!67413)))

(declare-fun lt!67426 () Unit!4039)

(assert (=> b!129738 (= lt!67426 lt!67419)))

(declare-fun lt!67414 () ListLongMap!1697)

(assert (=> b!129738 (= lt!67414 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67417 () (_ BitVec 64))

(assert (=> b!129738 (= lt!67417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67408 () (_ BitVec 64))

(assert (=> b!129738 (= lt!67408 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67423 () Unit!4039)

(assert (=> b!129738 (= lt!67423 (addApplyDifferent!89 lt!67414 lt!67417 (minValue!2683 newMap!16) lt!67408))))

(assert (=> b!129738 (= (apply!113 (+!172 lt!67414 (tuple2!2609 lt!67417 (minValue!2683 newMap!16))) lt!67408) (apply!113 lt!67414 lt!67408))))

(declare-fun lt!67421 () Unit!4039)

(assert (=> b!129738 (= lt!67421 lt!67423)))

(declare-fun lt!67406 () ListLongMap!1697)

(assert (=> b!129738 (= lt!67406 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67409 () (_ BitVec 64))

(assert (=> b!129738 (= lt!67409 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67410 () (_ BitVec 64))

(assert (=> b!129738 (= lt!67410 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67407 () Unit!4039)

(assert (=> b!129738 (= lt!67407 (addApplyDifferent!89 lt!67406 lt!67409 (zeroValue!2683 newMap!16) lt!67410))))

(assert (=> b!129738 (= (apply!113 (+!172 lt!67406 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16))) lt!67410) (apply!113 lt!67406 lt!67410))))

(declare-fun lt!67418 () Unit!4039)

(assert (=> b!129738 (= lt!67418 lt!67407)))

(declare-fun lt!67416 () ListLongMap!1697)

(assert (=> b!129738 (= lt!67416 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67425 () (_ BitVec 64))

(assert (=> b!129738 (= lt!67425 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67411 () (_ BitVec 64))

(assert (=> b!129738 (= lt!67411 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129738 (= lt!67422 (addApplyDifferent!89 lt!67416 lt!67425 (minValue!2683 newMap!16) lt!67411))))

(assert (=> b!129738 (= (apply!113 (+!172 lt!67416 (tuple2!2609 lt!67425 (minValue!2683 newMap!16))) lt!67411) (apply!113 lt!67416 lt!67411))))

(declare-fun b!129739 () Bool)

(declare-fun res!62593 () Bool)

(declare-fun e!84659 () Bool)

(assert (=> b!129739 (=> (not res!62593) (not e!84659))))

(assert (=> b!129739 (= res!62593 e!84667)))

(declare-fun c!23871 () Bool)

(assert (=> b!129739 (= c!23871 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129740 () Bool)

(declare-fun e!84656 () ListLongMap!1697)

(declare-fun call!14113 () ListLongMap!1697)

(assert (=> b!129740 (= e!84656 call!14113)))

(declare-fun b!129741 () Bool)

(declare-fun res!62592 () Bool)

(assert (=> b!129741 (=> (not res!62592) (not e!84659))))

(declare-fun e!84660 () Bool)

(assert (=> b!129741 (= res!62592 e!84660)))

(declare-fun res!62588 () Bool)

(assert (=> b!129741 (=> res!62588 e!84660)))

(declare-fun e!84657 () Bool)

(assert (=> b!129741 (= res!62588 (not e!84657))))

(declare-fun res!62586 () Bool)

(assert (=> b!129741 (=> (not res!62586) (not e!84657))))

(assert (=> b!129741 (= res!62586 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun bm!14108 () Bool)

(declare-fun call!14111 () ListLongMap!1697)

(declare-fun call!14110 () ListLongMap!1697)

(assert (=> bm!14108 (= call!14111 call!14110)))

(declare-fun d!39327 () Bool)

(assert (=> d!39327 e!84659))

(declare-fun res!62589 () Bool)

(assert (=> d!39327 (=> (not res!62589) (not e!84659))))

(assert (=> d!39327 (= res!62589 (or (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun lt!67427 () ListLongMap!1697)

(assert (=> d!39327 (= lt!67412 lt!67427)))

(declare-fun lt!67415 () Unit!4039)

(assert (=> d!39327 (= lt!67415 e!84668)))

(declare-fun c!23872 () Bool)

(declare-fun e!84663 () Bool)

(assert (=> d!39327 (= c!23872 e!84663)))

(declare-fun res!62590 () Bool)

(assert (=> d!39327 (=> (not res!62590) (not e!84663))))

(assert (=> d!39327 (= res!62590 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun e!84661 () ListLongMap!1697)

(assert (=> d!39327 (= lt!67427 e!84661)))

(declare-fun c!23873 () Bool)

(assert (=> d!39327 (= c!23873 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39327 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39327 (= (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67412)))

(declare-fun b!129742 () Bool)

(assert (=> b!129742 (= e!84663 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129743 () Bool)

(declare-fun e!84664 () ListLongMap!1697)

(declare-fun call!14116 () ListLongMap!1697)

(assert (=> b!129743 (= e!84664 call!14116)))

(declare-fun bm!14109 () Bool)

(assert (=> bm!14109 (= call!14114 (contains!889 lt!67412 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129744 () Bool)

(assert (=> b!129744 (= e!84660 e!84666)))

(declare-fun res!62587 () Bool)

(assert (=> b!129744 (=> (not res!62587) (not e!84666))))

(assert (=> b!129744 (= res!62587 (contains!889 lt!67412 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129744 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129745 () Bool)

(declare-fun c!23875 () Bool)

(assert (=> b!129745 (= c!23875 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129745 (= e!84664 e!84656)))

(declare-fun b!129746 () Bool)

(assert (=> b!129746 (= e!84659 e!84658)))

(declare-fun c!23870 () Bool)

(assert (=> b!129746 (= c!23870 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129747 () Bool)

(declare-fun Unit!4054 () Unit!4039)

(assert (=> b!129747 (= e!84668 Unit!4054)))

(declare-fun bm!14110 () Bool)

(assert (=> bm!14110 (= call!14110 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!129748 () Bool)

(assert (=> b!129748 (= e!84661 e!84664)))

(declare-fun c!23874 () Bool)

(assert (=> b!129748 (= c!23874 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!14112 () ListLongMap!1697)

(declare-fun bm!14111 () Bool)

(assert (=> bm!14111 (= call!14112 (+!172 (ite c!23873 call!14110 (ite c!23874 call!14111 call!14113)) (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun b!129749 () Bool)

(assert (=> b!129749 (= e!84657 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129750 () Bool)

(assert (=> b!129750 (= e!84665 (= (apply!113 lt!67412 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 newMap!16)))))

(declare-fun b!129751 () Bool)

(declare-fun e!84662 () Bool)

(assert (=> b!129751 (= e!84667 e!84662)))

(declare-fun res!62585 () Bool)

(assert (=> b!129751 (= res!62585 call!14115)))

(assert (=> b!129751 (=> (not res!62585) (not e!84662))))

(declare-fun bm!14112 () Bool)

(assert (=> bm!14112 (= call!14113 call!14111)))

(declare-fun bm!14113 () Bool)

(assert (=> bm!14113 (= call!14116 call!14112)))

(declare-fun b!129752 () Bool)

(assert (=> b!129752 (= e!84656 call!14116)))

(declare-fun b!129753 () Bool)

(assert (=> b!129753 (= e!84662 (= (apply!113 lt!67412 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 newMap!16)))))

(declare-fun b!129754 () Bool)

(assert (=> b!129754 (= e!84661 (+!172 call!14112 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(declare-fun b!129755 () Bool)

(assert (=> b!129755 (= e!84658 (not call!14114))))

(assert (= (and d!39327 c!23873) b!129754))

(assert (= (and d!39327 (not c!23873)) b!129748))

(assert (= (and b!129748 c!23874) b!129743))

(assert (= (and b!129748 (not c!23874)) b!129745))

(assert (= (and b!129745 c!23875) b!129752))

(assert (= (and b!129745 (not c!23875)) b!129740))

(assert (= (or b!129752 b!129740) bm!14112))

(assert (= (or b!129743 bm!14112) bm!14108))

(assert (= (or b!129743 b!129752) bm!14113))

(assert (= (or b!129754 bm!14108) bm!14110))

(assert (= (or b!129754 bm!14113) bm!14111))

(assert (= (and d!39327 res!62590) b!129742))

(assert (= (and d!39327 c!23872) b!129738))

(assert (= (and d!39327 (not c!23872)) b!129747))

(assert (= (and d!39327 res!62589) b!129741))

(assert (= (and b!129741 res!62586) b!129749))

(assert (= (and b!129741 (not res!62588)) b!129744))

(assert (= (and b!129744 res!62587) b!129735))

(assert (= (and b!129741 res!62592) b!129739))

(assert (= (and b!129739 c!23871) b!129751))

(assert (= (and b!129739 (not c!23871)) b!129737))

(assert (= (and b!129751 res!62585) b!129753))

(assert (= (or b!129751 b!129737) bm!14107))

(assert (= (and b!129739 res!62593) b!129746))

(assert (= (and b!129746 c!23870) b!129736))

(assert (= (and b!129746 (not c!23870)) b!129755))

(assert (= (and b!129736 res!62591) b!129750))

(assert (= (or b!129736 b!129755) bm!14109))

(declare-fun b_lambda!5751 () Bool)

(assert (=> (not b_lambda!5751) (not b!129735)))

(assert (=> b!129735 t!6114))

(declare-fun b_and!8023 () Bool)

(assert (= b_and!8019 (and (=> t!6114 result!3921) b_and!8023)))

(assert (=> b!129735 t!6116))

(declare-fun b_and!8025 () Bool)

(assert (= b_and!8021 (and (=> t!6116 result!3923) b_and!8025)))

(declare-fun m!152351 () Bool)

(assert (=> bm!14110 m!152351))

(declare-fun m!152353 () Bool)

(assert (=> bm!14109 m!152353))

(declare-fun m!152355 () Bool)

(assert (=> bm!14111 m!152355))

(declare-fun m!152357 () Bool)

(assert (=> b!129735 m!152357))

(assert (=> b!129735 m!152009))

(declare-fun m!152359 () Bool)

(assert (=> b!129735 m!152359))

(assert (=> b!129735 m!152013))

(assert (=> b!129735 m!152013))

(declare-fun m!152361 () Bool)

(assert (=> b!129735 m!152361))

(assert (=> b!129735 m!152357))

(assert (=> b!129735 m!152009))

(declare-fun m!152363 () Bool)

(assert (=> b!129753 m!152363))

(assert (=> b!129749 m!152013))

(assert (=> b!129749 m!152013))

(assert (=> b!129749 m!152019))

(assert (=> b!129742 m!152013))

(assert (=> b!129742 m!152013))

(assert (=> b!129742 m!152019))

(assert (=> d!39327 m!151983))

(declare-fun m!152365 () Bool)

(assert (=> b!129750 m!152365))

(declare-fun m!152367 () Bool)

(assert (=> b!129754 m!152367))

(declare-fun m!152369 () Bool)

(assert (=> bm!14107 m!152369))

(assert (=> b!129744 m!152013))

(assert (=> b!129744 m!152013))

(declare-fun m!152371 () Bool)

(assert (=> b!129744 m!152371))

(declare-fun m!152373 () Bool)

(assert (=> b!129738 m!152373))

(declare-fun m!152375 () Bool)

(assert (=> b!129738 m!152375))

(declare-fun m!152377 () Bool)

(assert (=> b!129738 m!152377))

(declare-fun m!152379 () Bool)

(assert (=> b!129738 m!152379))

(assert (=> b!129738 m!152351))

(declare-fun m!152381 () Bool)

(assert (=> b!129738 m!152381))

(declare-fun m!152383 () Bool)

(assert (=> b!129738 m!152383))

(declare-fun m!152385 () Bool)

(assert (=> b!129738 m!152385))

(declare-fun m!152387 () Bool)

(assert (=> b!129738 m!152387))

(declare-fun m!152389 () Bool)

(assert (=> b!129738 m!152389))

(assert (=> b!129738 m!152013))

(declare-fun m!152391 () Bool)

(assert (=> b!129738 m!152391))

(declare-fun m!152393 () Bool)

(assert (=> b!129738 m!152393))

(declare-fun m!152395 () Bool)

(assert (=> b!129738 m!152395))

(assert (=> b!129738 m!152381))

(declare-fun m!152397 () Bool)

(assert (=> b!129738 m!152397))

(declare-fun m!152399 () Bool)

(assert (=> b!129738 m!152399))

(assert (=> b!129738 m!152387))

(assert (=> b!129738 m!152393))

(assert (=> b!129738 m!152375))

(declare-fun m!152401 () Bool)

(assert (=> b!129738 m!152401))

(assert (=> bm!14070 d!39327))

(declare-fun d!39329 () Bool)

(assert (=> d!39329 (= (get!1465 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129487 d!39329))

(declare-fun b!129756 () Bool)

(declare-fun lt!67434 () ListLongMap!1697)

(declare-fun e!84679 () Bool)

(assert (=> b!129756 (= e!84679 (= (apply!113 lt!67434 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))))))))

(assert (=> b!129756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129757 () Bool)

(declare-fun e!84671 () Bool)

(declare-fun e!84678 () Bool)

(assert (=> b!129757 (= e!84671 e!84678)))

(declare-fun res!62600 () Bool)

(declare-fun call!14121 () Bool)

(assert (=> b!129757 (= res!62600 call!14121)))

(assert (=> b!129757 (=> (not res!62600) (not e!84678))))

(declare-fun b!129758 () Bool)

(declare-fun e!84680 () Bool)

(declare-fun call!14122 () Bool)

(assert (=> b!129758 (= e!84680 (not call!14122))))

(declare-fun bm!14114 () Bool)

(assert (=> bm!14114 (= call!14122 (contains!889 lt!67434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129759 () Bool)

(declare-fun e!84681 () Unit!4039)

(declare-fun lt!67444 () Unit!4039)

(assert (=> b!129759 (= e!84681 lt!67444)))

(declare-fun lt!67446 () ListLongMap!1697)

(assert (=> b!129759 (= lt!67446 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67442 () (_ BitVec 64))

(assert (=> b!129759 (= lt!67442 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67435 () (_ BitVec 64))

(assert (=> b!129759 (= lt!67435 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67441 () Unit!4039)

(assert (=> b!129759 (= lt!67441 (addStillContains!89 lt!67446 lt!67442 (zeroValue!2683 newMap!16) lt!67435))))

(assert (=> b!129759 (contains!889 (+!172 lt!67446 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16))) lt!67435)))

(declare-fun lt!67448 () Unit!4039)

(assert (=> b!129759 (= lt!67448 lt!67441)))

(declare-fun lt!67436 () ListLongMap!1697)

(assert (=> b!129759 (= lt!67436 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67439 () (_ BitVec 64))

(assert (=> b!129759 (= lt!67439 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67430 () (_ BitVec 64))

(assert (=> b!129759 (= lt!67430 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67445 () Unit!4039)

(assert (=> b!129759 (= lt!67445 (addApplyDifferent!89 lt!67436 lt!67439 (minValue!2683 newMap!16) lt!67430))))

(assert (=> b!129759 (= (apply!113 (+!172 lt!67436 (tuple2!2609 lt!67439 (minValue!2683 newMap!16))) lt!67430) (apply!113 lt!67436 lt!67430))))

(declare-fun lt!67443 () Unit!4039)

(assert (=> b!129759 (= lt!67443 lt!67445)))

(declare-fun lt!67428 () ListLongMap!1697)

(assert (=> b!129759 (= lt!67428 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67431 () (_ BitVec 64))

(assert (=> b!129759 (= lt!67431 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67432 () (_ BitVec 64))

(assert (=> b!129759 (= lt!67432 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67429 () Unit!4039)

(assert (=> b!129759 (= lt!67429 (addApplyDifferent!89 lt!67428 lt!67431 (zeroValue!2683 newMap!16) lt!67432))))

(assert (=> b!129759 (= (apply!113 (+!172 lt!67428 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16))) lt!67432) (apply!113 lt!67428 lt!67432))))

(declare-fun lt!67440 () Unit!4039)

(assert (=> b!129759 (= lt!67440 lt!67429)))

(declare-fun lt!67438 () ListLongMap!1697)

(assert (=> b!129759 (= lt!67438 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67447 () (_ BitVec 64))

(assert (=> b!129759 (= lt!67447 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67433 () (_ BitVec 64))

(assert (=> b!129759 (= lt!67433 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129759 (= lt!67444 (addApplyDifferent!89 lt!67438 lt!67447 (minValue!2683 newMap!16) lt!67433))))

(assert (=> b!129759 (= (apply!113 (+!172 lt!67438 (tuple2!2609 lt!67447 (minValue!2683 newMap!16))) lt!67433) (apply!113 lt!67438 lt!67433))))

(declare-fun b!129760 () Bool)

(declare-fun res!62602 () Bool)

(declare-fun e!84672 () Bool)

(assert (=> b!129760 (=> (not res!62602) (not e!84672))))

(assert (=> b!129760 (= res!62602 e!84680)))

(declare-fun c!23877 () Bool)

(assert (=> b!129760 (= c!23877 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129761 () Bool)

(declare-fun e!84669 () ListLongMap!1697)

(declare-fun call!14120 () ListLongMap!1697)

(assert (=> b!129761 (= e!84669 call!14120)))

(declare-fun b!129762 () Bool)

(declare-fun res!62601 () Bool)

(assert (=> b!129762 (=> (not res!62601) (not e!84672))))

(declare-fun e!84673 () Bool)

(assert (=> b!129762 (= res!62601 e!84673)))

(declare-fun res!62597 () Bool)

(assert (=> b!129762 (=> res!62597 e!84673)))

(declare-fun e!84670 () Bool)

(assert (=> b!129762 (= res!62597 (not e!84670))))

(declare-fun res!62595 () Bool)

(assert (=> b!129762 (=> (not res!62595) (not e!84670))))

(assert (=> b!129762 (= res!62595 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun bm!14115 () Bool)

(declare-fun call!14118 () ListLongMap!1697)

(declare-fun call!14117 () ListLongMap!1697)

(assert (=> bm!14115 (= call!14118 call!14117)))

(declare-fun d!39331 () Bool)

(assert (=> d!39331 e!84672))

(declare-fun res!62598 () Bool)

(assert (=> d!39331 (=> (not res!62598) (not e!84672))))

(assert (=> d!39331 (= res!62598 (or (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun lt!67449 () ListLongMap!1697)

(assert (=> d!39331 (= lt!67434 lt!67449)))

(declare-fun lt!67437 () Unit!4039)

(assert (=> d!39331 (= lt!67437 e!84681)))

(declare-fun c!23878 () Bool)

(declare-fun e!84676 () Bool)

(assert (=> d!39331 (= c!23878 e!84676)))

(declare-fun res!62599 () Bool)

(assert (=> d!39331 (=> (not res!62599) (not e!84676))))

(assert (=> d!39331 (= res!62599 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun e!84674 () ListLongMap!1697)

(assert (=> d!39331 (= lt!67449 e!84674)))

(declare-fun c!23879 () Bool)

(assert (=> d!39331 (= c!23879 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39331 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39331 (= (getCurrentListMap!541 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67434)))

(declare-fun b!129763 () Bool)

(assert (=> b!129763 (= e!84676 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129764 () Bool)

(declare-fun e!84677 () ListLongMap!1697)

(declare-fun call!14123 () ListLongMap!1697)

(assert (=> b!129764 (= e!84677 call!14123)))

(declare-fun bm!14116 () Bool)

(assert (=> bm!14116 (= call!14121 (contains!889 lt!67434 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129765 () Bool)

(assert (=> b!129765 (= e!84673 e!84679)))

(declare-fun res!62596 () Bool)

(assert (=> b!129765 (=> (not res!62596) (not e!84679))))

(assert (=> b!129765 (= res!62596 (contains!889 lt!67434 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129766 () Bool)

(declare-fun c!23881 () Bool)

(assert (=> b!129766 (= c!23881 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129766 (= e!84677 e!84669)))

(declare-fun b!129767 () Bool)

(assert (=> b!129767 (= e!84672 e!84671)))

(declare-fun c!23876 () Bool)

(assert (=> b!129767 (= c!23876 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129768 () Bool)

(declare-fun Unit!4055 () Unit!4039)

(assert (=> b!129768 (= e!84681 Unit!4055)))

(declare-fun bm!14117 () Bool)

(assert (=> bm!14117 (= call!14117 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!129769 () Bool)

(assert (=> b!129769 (= e!84674 e!84677)))

(declare-fun c!23880 () Bool)

(assert (=> b!129769 (= c!23880 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14118 () Bool)

(declare-fun call!14119 () ListLongMap!1697)

(assert (=> bm!14118 (= call!14119 (+!172 (ite c!23879 call!14117 (ite c!23880 call!14118 call!14120)) (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun b!129770 () Bool)

(assert (=> b!129770 (= e!84670 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129771 () Bool)

(assert (=> b!129771 (= e!84678 (= (apply!113 lt!67434 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 newMap!16)))))

(declare-fun b!129772 () Bool)

(declare-fun e!84675 () Bool)

(assert (=> b!129772 (= e!84680 e!84675)))

(declare-fun res!62594 () Bool)

(assert (=> b!129772 (= res!62594 call!14122)))

(assert (=> b!129772 (=> (not res!62594) (not e!84675))))

(declare-fun bm!14119 () Bool)

(assert (=> bm!14119 (= call!14120 call!14118)))

(declare-fun bm!14120 () Bool)

(assert (=> bm!14120 (= call!14123 call!14119)))

(declare-fun b!129773 () Bool)

(assert (=> b!129773 (= e!84669 call!14123)))

(declare-fun b!129774 () Bool)

(assert (=> b!129774 (= e!84675 (= (apply!113 lt!67434 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 newMap!16)))))

(declare-fun b!129775 () Bool)

(assert (=> b!129775 (= e!84674 (+!172 call!14119 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(declare-fun b!129776 () Bool)

(assert (=> b!129776 (= e!84671 (not call!14121))))

(assert (= (and d!39331 c!23879) b!129775))

(assert (= (and d!39331 (not c!23879)) b!129769))

(assert (= (and b!129769 c!23880) b!129764))

(assert (= (and b!129769 (not c!23880)) b!129766))

(assert (= (and b!129766 c!23881) b!129773))

(assert (= (and b!129766 (not c!23881)) b!129761))

(assert (= (or b!129773 b!129761) bm!14119))

(assert (= (or b!129764 bm!14119) bm!14115))

(assert (= (or b!129764 b!129773) bm!14120))

(assert (= (or b!129775 bm!14115) bm!14117))

(assert (= (or b!129775 bm!14120) bm!14118))

(assert (= (and d!39331 res!62599) b!129763))

(assert (= (and d!39331 c!23878) b!129759))

(assert (= (and d!39331 (not c!23878)) b!129768))

(assert (= (and d!39331 res!62598) b!129762))

(assert (= (and b!129762 res!62595) b!129770))

(assert (= (and b!129762 (not res!62597)) b!129765))

(assert (= (and b!129765 res!62596) b!129756))

(assert (= (and b!129762 res!62601) b!129760))

(assert (= (and b!129760 c!23877) b!129772))

(assert (= (and b!129760 (not c!23877)) b!129758))

(assert (= (and b!129772 res!62594) b!129774))

(assert (= (or b!129772 b!129758) bm!14114))

(assert (= (and b!129760 res!62602) b!129767))

(assert (= (and b!129767 c!23876) b!129757))

(assert (= (and b!129767 (not c!23876)) b!129776))

(assert (= (and b!129757 res!62600) b!129771))

(assert (= (or b!129757 b!129776) bm!14116))

(declare-fun b_lambda!5753 () Bool)

(assert (=> (not b_lambda!5753) (not b!129756)))

(assert (=> b!129756 t!6114))

(declare-fun b_and!8027 () Bool)

(assert (= b_and!8023 (and (=> t!6114 result!3921) b_and!8027)))

(assert (=> b!129756 t!6116))

(declare-fun b_and!8029 () Bool)

(assert (= b_and!8025 (and (=> t!6116 result!3923) b_and!8029)))

(declare-fun m!152403 () Bool)

(assert (=> bm!14117 m!152403))

(declare-fun m!152405 () Bool)

(assert (=> bm!14116 m!152405))

(declare-fun m!152407 () Bool)

(assert (=> bm!14118 m!152407))

(declare-fun m!152409 () Bool)

(assert (=> b!129756 m!152409))

(assert (=> b!129756 m!152009))

(declare-fun m!152411 () Bool)

(assert (=> b!129756 m!152411))

(assert (=> b!129756 m!152013))

(assert (=> b!129756 m!152013))

(declare-fun m!152413 () Bool)

(assert (=> b!129756 m!152413))

(assert (=> b!129756 m!152409))

(assert (=> b!129756 m!152009))

(declare-fun m!152415 () Bool)

(assert (=> b!129774 m!152415))

(assert (=> b!129770 m!152013))

(assert (=> b!129770 m!152013))

(assert (=> b!129770 m!152019))

(assert (=> b!129763 m!152013))

(assert (=> b!129763 m!152013))

(assert (=> b!129763 m!152019))

(assert (=> d!39331 m!151983))

(declare-fun m!152417 () Bool)

(assert (=> b!129771 m!152417))

(declare-fun m!152419 () Bool)

(assert (=> b!129775 m!152419))

(declare-fun m!152421 () Bool)

(assert (=> bm!14114 m!152421))

(assert (=> b!129765 m!152013))

(assert (=> b!129765 m!152013))

(declare-fun m!152423 () Bool)

(assert (=> b!129765 m!152423))

(declare-fun m!152425 () Bool)

(assert (=> b!129759 m!152425))

(declare-fun m!152427 () Bool)

(assert (=> b!129759 m!152427))

(declare-fun m!152429 () Bool)

(assert (=> b!129759 m!152429))

(declare-fun m!152431 () Bool)

(assert (=> b!129759 m!152431))

(assert (=> b!129759 m!152403))

(declare-fun m!152433 () Bool)

(assert (=> b!129759 m!152433))

(declare-fun m!152435 () Bool)

(assert (=> b!129759 m!152435))

(declare-fun m!152437 () Bool)

(assert (=> b!129759 m!152437))

(declare-fun m!152439 () Bool)

(assert (=> b!129759 m!152439))

(declare-fun m!152441 () Bool)

(assert (=> b!129759 m!152441))

(assert (=> b!129759 m!152013))

(declare-fun m!152443 () Bool)

(assert (=> b!129759 m!152443))

(declare-fun m!152445 () Bool)

(assert (=> b!129759 m!152445))

(declare-fun m!152447 () Bool)

(assert (=> b!129759 m!152447))

(assert (=> b!129759 m!152433))

(declare-fun m!152449 () Bool)

(assert (=> b!129759 m!152449))

(declare-fun m!152451 () Bool)

(assert (=> b!129759 m!152451))

(assert (=> b!129759 m!152439))

(assert (=> b!129759 m!152445))

(assert (=> b!129759 m!152427))

(declare-fun m!152453 () Bool)

(assert (=> b!129759 m!152453))

(assert (=> bm!14055 d!39331))

(assert (=> b!129361 d!39281))

(assert (=> b!129361 d!39283))

(declare-fun d!39333 () Bool)

(declare-fun e!84682 () Bool)

(assert (=> d!39333 e!84682))

(declare-fun res!62603 () Bool)

(assert (=> d!39333 (=> res!62603 e!84682)))

(declare-fun lt!67453 () Bool)

(assert (=> d!39333 (= res!62603 (not lt!67453))))

(declare-fun lt!67452 () Bool)

(assert (=> d!39333 (= lt!67453 lt!67452)))

(declare-fun lt!67451 () Unit!4039)

(declare-fun e!84683 () Unit!4039)

(assert (=> d!39333 (= lt!67451 e!84683)))

(declare-fun c!23882 () Bool)

(assert (=> d!39333 (= c!23882 lt!67452)))

(assert (=> d!39333 (= lt!67452 (containsKey!173 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!39333 (= (contains!889 lt!67067 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!67453)))

(declare-fun b!129777 () Bool)

(declare-fun lt!67450 () Unit!4039)

(assert (=> b!129777 (= e!84683 lt!67450)))

(assert (=> b!129777 (= lt!67450 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129777 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129778 () Bool)

(declare-fun Unit!4056 () Unit!4039)

(assert (=> b!129778 (= e!84683 Unit!4056)))

(declare-fun b!129779 () Bool)

(assert (=> b!129779 (= e!84682 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!39333 c!23882) b!129777))

(assert (= (and d!39333 (not c!23882)) b!129778))

(assert (= (and d!39333 (not res!62603)) b!129779))

(assert (=> d!39333 m!151851))

(declare-fun m!152455 () Bool)

(assert (=> d!39333 m!152455))

(assert (=> b!129777 m!151851))

(declare-fun m!152457 () Bool)

(assert (=> b!129777 m!152457))

(assert (=> b!129777 m!151851))

(assert (=> b!129777 m!152115))

(assert (=> b!129777 m!152115))

(declare-fun m!152459 () Bool)

(assert (=> b!129777 m!152459))

(assert (=> b!129779 m!151851))

(assert (=> b!129779 m!152115))

(assert (=> b!129779 m!152115))

(assert (=> b!129779 m!152459))

(assert (=> b!129341 d!39333))

(declare-fun b!129788 () Bool)

(declare-fun e!84690 () Bool)

(declare-fun e!84691 () Bool)

(assert (=> b!129788 (= e!84690 e!84691)))

(declare-fun c!23885 () Bool)

(assert (=> b!129788 (= c!23885 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!39335 () Bool)

(declare-fun res!62608 () Bool)

(assert (=> d!39335 (=> res!62608 e!84690)))

(assert (=> d!39335 (= res!62608 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4565 newMap!16) (mask!7102 newMap!16)) e!84690)))

(declare-fun b!129789 () Bool)

(declare-fun e!84692 () Bool)

(declare-fun call!14126 () Bool)

(assert (=> b!129789 (= e!84692 call!14126)))

(declare-fun bm!14123 () Bool)

(assert (=> bm!14123 (= call!14126 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun b!129790 () Bool)

(assert (=> b!129790 (= e!84691 e!84692)))

(declare-fun lt!67460 () (_ BitVec 64))

(assert (=> b!129790 (= lt!67460 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67461 () Unit!4039)

(assert (=> b!129790 (= lt!67461 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4565 newMap!16) lt!67460 #b00000000000000000000000000000000))))

(assert (=> b!129790 (arrayContainsKey!0 (_keys!4565 newMap!16) lt!67460 #b00000000000000000000000000000000)))

(declare-fun lt!67462 () Unit!4039)

(assert (=> b!129790 (= lt!67462 lt!67461)))

(declare-fun res!62609 () Bool)

(assert (=> b!129790 (= res!62609 (= (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (_keys!4565 newMap!16) (mask!7102 newMap!16)) (Found!272 #b00000000000000000000000000000000)))))

(assert (=> b!129790 (=> (not res!62609) (not e!84692))))

(declare-fun b!129791 () Bool)

(assert (=> b!129791 (= e!84691 call!14126)))

(assert (= (and d!39335 (not res!62608)) b!129788))

(assert (= (and b!129788 c!23885) b!129790))

(assert (= (and b!129788 (not c!23885)) b!129791))

(assert (= (and b!129790 res!62609) b!129789))

(assert (= (or b!129789 b!129791) bm!14123))

(assert (=> b!129788 m!152013))

(assert (=> b!129788 m!152013))

(assert (=> b!129788 m!152019))

(declare-fun m!152461 () Bool)

(assert (=> bm!14123 m!152461))

(assert (=> b!129790 m!152013))

(declare-fun m!152463 () Bool)

(assert (=> b!129790 m!152463))

(declare-fun m!152465 () Bool)

(assert (=> b!129790 m!152465))

(assert (=> b!129790 m!152013))

(declare-fun m!152467 () Bool)

(assert (=> b!129790 m!152467))

(assert (=> b!129288 d!39335))

(declare-fun d!39337 () Bool)

(assert (=> d!39337 (= (get!1464 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3161 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!129486 d!39337))

(declare-fun b!129802 () Bool)

(declare-fun e!84703 () Bool)

(declare-fun contains!891 (List!1709 (_ BitVec 64)) Bool)

(assert (=> b!129802 (= e!84703 (contains!891 Nil!1706 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129803 () Bool)

(declare-fun e!84702 () Bool)

(declare-fun e!84701 () Bool)

(assert (=> b!129803 (= e!84702 e!84701)))

(declare-fun c!23888 () Bool)

(assert (=> b!129803 (= c!23888 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!39339 () Bool)

(declare-fun res!62618 () Bool)

(declare-fun e!84704 () Bool)

(assert (=> d!39339 (=> res!62618 e!84704)))

(assert (=> d!39339 (= res!62618 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39339 (= (arrayNoDuplicates!0 (_keys!4565 newMap!16) #b00000000000000000000000000000000 Nil!1706) e!84704)))

(declare-fun b!129804 () Bool)

(declare-fun call!14129 () Bool)

(assert (=> b!129804 (= e!84701 call!14129)))

(declare-fun b!129805 () Bool)

(assert (=> b!129805 (= e!84704 e!84702)))

(declare-fun res!62617 () Bool)

(assert (=> b!129805 (=> (not res!62617) (not e!84702))))

(assert (=> b!129805 (= res!62617 (not e!84703))))

(declare-fun res!62616 () Bool)

(assert (=> b!129805 (=> (not res!62616) (not e!84703))))

(assert (=> b!129805 (= res!62616 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!14126 () Bool)

(assert (=> bm!14126 (= call!14129 (arrayNoDuplicates!0 (_keys!4565 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23888 (Cons!1705 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) Nil!1706) Nil!1706)))))

(declare-fun b!129806 () Bool)

(assert (=> b!129806 (= e!84701 call!14129)))

(assert (= (and d!39339 (not res!62618)) b!129805))

(assert (= (and b!129805 res!62616) b!129802))

(assert (= (and b!129805 res!62617) b!129803))

(assert (= (and b!129803 c!23888) b!129804))

(assert (= (and b!129803 (not c!23888)) b!129806))

(assert (= (or b!129804 b!129806) bm!14126))

(assert (=> b!129802 m!152013))

(assert (=> b!129802 m!152013))

(declare-fun m!152469 () Bool)

(assert (=> b!129802 m!152469))

(assert (=> b!129803 m!152013))

(assert (=> b!129803 m!152013))

(assert (=> b!129803 m!152019))

(assert (=> b!129805 m!152013))

(assert (=> b!129805 m!152013))

(assert (=> b!129805 m!152019))

(assert (=> bm!14126 m!152013))

(declare-fun m!152471 () Bool)

(assert (=> bm!14126 m!152471))

(assert (=> b!129289 d!39339))

(declare-fun d!39341 () Bool)

(declare-fun e!84707 () Bool)

(assert (=> d!39341 e!84707))

(declare-fun res!62621 () Bool)

(assert (=> d!39341 (=> (not res!62621) (not e!84707))))

(assert (=> d!39341 (= res!62621 (and (bvsge (index!3246 lt!67161) #b00000000000000000000000000000000) (bvslt (index!3246 lt!67161) (size!2509 (_keys!4565 newMap!16)))))))

(declare-fun lt!67465 () Unit!4039)

(declare-fun choose!793 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 32) Int) Unit!4039)

(assert (=> d!39341 (= lt!67465 (choose!793 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (index!3246 lt!67161) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39341 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39341 (= (lemmaValidKeyInArrayIsInListMap!119 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (index!3246 lt!67161) (defaultEntry!2824 newMap!16)) lt!67465)))

(declare-fun b!129809 () Bool)

(assert (=> b!129809 (= e!84707 (contains!889 (getCurrentListMap!541 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))))

(assert (= (and d!39341 res!62621) b!129809))

(declare-fun m!152473 () Bool)

(assert (=> d!39341 m!152473))

(assert (=> d!39341 m!151983))

(declare-fun m!152475 () Bool)

(assert (=> b!129809 m!152475))

(assert (=> b!129809 m!151907))

(assert (=> b!129809 m!152475))

(assert (=> b!129809 m!151907))

(declare-fun m!152477 () Bool)

(assert (=> b!129809 m!152477))

(assert (=> b!129475 d!39341))

(declare-fun d!39343 () Bool)

(declare-fun e!84710 () Bool)

(assert (=> d!39343 e!84710))

(declare-fun res!62624 () Bool)

(assert (=> d!39343 (=> (not res!62624) (not e!84710))))

(assert (=> d!39343 (= res!62624 (and (bvsge (index!3246 lt!67161) #b00000000000000000000000000000000) (bvslt (index!3246 lt!67161) (size!2510 (_values!2807 newMap!16)))))))

(declare-fun lt!67468 () Unit!4039)

(declare-fun choose!794 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 32) (_ BitVec 64) V!3459 Int) Unit!4039)

(assert (=> d!39343 (= lt!67468 (choose!794 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (index!3246 lt!67161) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39343 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39343 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!58 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (index!3246 lt!67161) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)) lt!67468)))

(declare-fun b!129812 () Bool)

(assert (=> b!129812 (= e!84710 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!541 (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))))))

(assert (= (and d!39343 res!62624) b!129812))

(assert (=> d!39343 m!151769))

(assert (=> d!39343 m!151767))

(declare-fun m!152479 () Bool)

(assert (=> d!39343 m!152479))

(assert (=> d!39343 m!151983))

(assert (=> b!129812 m!151839))

(assert (=> b!129812 m!151839))

(assert (=> b!129812 m!152177))

(assert (=> b!129812 m!151919))

(declare-fun m!152481 () Bool)

(assert (=> b!129812 m!152481))

(assert (=> b!129475 d!39343))

(declare-fun d!39345 () Bool)

(declare-fun e!84711 () Bool)

(assert (=> d!39345 e!84711))

(declare-fun res!62625 () Bool)

(assert (=> d!39345 (=> res!62625 e!84711)))

(declare-fun lt!67472 () Bool)

(assert (=> d!39345 (= res!62625 (not lt!67472))))

(declare-fun lt!67471 () Bool)

(assert (=> d!39345 (= lt!67472 lt!67471)))

(declare-fun lt!67470 () Unit!4039)

(declare-fun e!84712 () Unit!4039)

(assert (=> d!39345 (= lt!67470 e!84712)))

(declare-fun c!23889 () Bool)

(assert (=> d!39345 (= c!23889 lt!67471)))

(assert (=> d!39345 (= lt!67471 (containsKey!173 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39345 (= (contains!889 call!14077 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67472)))

(declare-fun b!129813 () Bool)

(declare-fun lt!67469 () Unit!4039)

(assert (=> b!129813 (= e!84712 lt!67469)))

(assert (=> b!129813 (= lt!67469 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!129813 (isDefined!122 (getValueByKey!169 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129814 () Bool)

(declare-fun Unit!4057 () Unit!4039)

(assert (=> b!129814 (= e!84712 Unit!4057)))

(declare-fun b!129815 () Bool)

(assert (=> b!129815 (= e!84711 (isDefined!122 (getValueByKey!169 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (= (and d!39345 c!23889) b!129813))

(assert (= (and d!39345 (not c!23889)) b!129814))

(assert (= (and d!39345 (not res!62625)) b!129815))

(assert (=> d!39345 m!151769))

(declare-fun m!152483 () Bool)

(assert (=> d!39345 m!152483))

(assert (=> b!129813 m!151769))

(declare-fun m!152485 () Bool)

(assert (=> b!129813 m!152485))

(assert (=> b!129813 m!151769))

(declare-fun m!152487 () Bool)

(assert (=> b!129813 m!152487))

(assert (=> b!129813 m!152487))

(declare-fun m!152489 () Bool)

(assert (=> b!129813 m!152489))

(assert (=> b!129815 m!151769))

(assert (=> b!129815 m!152487))

(assert (=> b!129815 m!152487))

(assert (=> b!129815 m!152489))

(assert (=> b!129475 d!39345))

(assert (=> b!129339 d!39261))

(declare-fun d!39347 () Bool)

(declare-fun res!62630 () Bool)

(declare-fun e!84717 () Bool)

(assert (=> d!39347 (=> res!62630 e!84717)))

(assert (=> d!39347 (= res!62630 (= (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39347 (= (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000) e!84717)))

(declare-fun b!129820 () Bool)

(declare-fun e!84718 () Bool)

(assert (=> b!129820 (= e!84717 e!84718)))

(declare-fun res!62631 () Bool)

(assert (=> b!129820 (=> (not res!62631) (not e!84718))))

(assert (=> b!129820 (= res!62631 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129821 () Bool)

(assert (=> b!129821 (= e!84718 (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39347 (not res!62630)) b!129820))

(assert (= (and b!129820 res!62631) b!129821))

(assert (=> d!39347 m!152013))

(assert (=> b!129821 m!151769))

(declare-fun m!152491 () Bool)

(assert (=> b!129821 m!152491))

(assert (=> bm!14071 d!39347))

(assert (=> d!39219 d!39327))

(declare-fun d!39349 () Bool)

(declare-fun res!62642 () Bool)

(declare-fun e!84721 () Bool)

(assert (=> d!39349 (=> (not res!62642) (not e!84721))))

(assert (=> d!39349 (= res!62642 (validMask!0 (mask!7102 newMap!16)))))

(assert (=> d!39349 (= (simpleValid!89 newMap!16) e!84721)))

(declare-fun b!129832 () Bool)

(declare-fun res!62641 () Bool)

(assert (=> b!129832 (=> (not res!62641) (not e!84721))))

(declare-fun size!2513 (LongMapFixedSize!1080) (_ BitVec 32))

(assert (=> b!129832 (= res!62641 (= (size!2513 newMap!16) (bvadd (_size!589 newMap!16) (bvsdiv (bvadd (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!129833 () Bool)

(assert (=> b!129833 (= e!84721 (and (bvsge (extraKeys!2597 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2597 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!589 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!129831 () Bool)

(declare-fun res!62643 () Bool)

(assert (=> b!129831 (=> (not res!62643) (not e!84721))))

(assert (=> b!129831 (= res!62643 (bvsge (size!2513 newMap!16) (_size!589 newMap!16)))))

(declare-fun b!129830 () Bool)

(declare-fun res!62640 () Bool)

(assert (=> b!129830 (=> (not res!62640) (not e!84721))))

(assert (=> b!129830 (= res!62640 (and (= (size!2510 (_values!2807 newMap!16)) (bvadd (mask!7102 newMap!16) #b00000000000000000000000000000001)) (= (size!2509 (_keys!4565 newMap!16)) (size!2510 (_values!2807 newMap!16))) (bvsge (_size!589 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!589 newMap!16) (bvadd (mask!7102 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!39349 res!62642) b!129830))

(assert (= (and b!129830 res!62640) b!129831))

(assert (= (and b!129831 res!62643) b!129832))

(assert (= (and b!129832 res!62641) b!129833))

(assert (=> d!39349 m!151983))

(declare-fun m!152493 () Bool)

(assert (=> b!129832 m!152493))

(assert (=> b!129831 m!152493))

(assert (=> d!39215 d!39349))

(declare-fun d!39351 () Bool)

(declare-fun e!84722 () Bool)

(assert (=> d!39351 e!84722))

(declare-fun res!62644 () Bool)

(assert (=> d!39351 (=> (not res!62644) (not e!84722))))

(declare-fun lt!67474 () ListLongMap!1697)

(assert (=> d!39351 (= res!62644 (contains!889 lt!67474 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!67475 () List!1708)

(assert (=> d!39351 (= lt!67474 (ListLongMap!1698 lt!67475))))

(declare-fun lt!67476 () Unit!4039)

(declare-fun lt!67473 () Unit!4039)

(assert (=> d!39351 (= lt!67476 lt!67473)))

(assert (=> d!39351 (= (getValueByKey!169 lt!67475 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!174 (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39351 (= lt!67473 (lemmaContainsTupThenGetReturnValue!84 lt!67475 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39351 (= lt!67475 (insertStrictlySorted!87 (toList!864 (ite c!23800 call!14057 call!14077)) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39351 (= (+!172 (ite c!23800 call!14057 call!14077) (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67474)))

(declare-fun b!129834 () Bool)

(declare-fun res!62645 () Bool)

(assert (=> b!129834 (=> (not res!62645) (not e!84722))))

(assert (=> b!129834 (= res!62645 (= (getValueByKey!169 (toList!864 lt!67474) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!174 (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!129835 () Bool)

(assert (=> b!129835 (= e!84722 (contains!890 (toList!864 lt!67474) (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39351 res!62644) b!129834))

(assert (= (and b!129834 res!62645) b!129835))

(declare-fun m!152495 () Bool)

(assert (=> d!39351 m!152495))

(declare-fun m!152497 () Bool)

(assert (=> d!39351 m!152497))

(declare-fun m!152499 () Bool)

(assert (=> d!39351 m!152499))

(declare-fun m!152501 () Bool)

(assert (=> d!39351 m!152501))

(declare-fun m!152503 () Bool)

(assert (=> b!129834 m!152503))

(declare-fun m!152505 () Bool)

(assert (=> b!129835 m!152505))

(assert (=> bm!14056 d!39351))

(declare-fun condMapEmpty!4581 () Bool)

(declare-fun mapDefault!4581 () ValueCell!1086)

(assert (=> mapNonEmpty!4579 (= condMapEmpty!4581 (= mapRest!4579 ((as const (Array (_ BitVec 32) ValueCell!1086)) mapDefault!4581)))))

(declare-fun e!84724 () Bool)

(declare-fun mapRes!4581 () Bool)

(assert (=> mapNonEmpty!4579 (= tp!11095 (and e!84724 mapRes!4581))))

(declare-fun b!129836 () Bool)

(declare-fun e!84723 () Bool)

(assert (=> b!129836 (= e!84723 tp_is_empty!2859)))

(declare-fun mapIsEmpty!4581 () Bool)

(assert (=> mapIsEmpty!4581 mapRes!4581))

(declare-fun b!129837 () Bool)

(assert (=> b!129837 (= e!84724 tp_is_empty!2859)))

(declare-fun mapNonEmpty!4581 () Bool)

(declare-fun tp!11097 () Bool)

(assert (=> mapNonEmpty!4581 (= mapRes!4581 (and tp!11097 e!84723))))

(declare-fun mapKey!4581 () (_ BitVec 32))

(declare-fun mapRest!4581 () (Array (_ BitVec 32) ValueCell!1086))

(declare-fun mapValue!4581 () ValueCell!1086)

(assert (=> mapNonEmpty!4581 (= mapRest!4579 (store mapRest!4581 mapKey!4581 mapValue!4581))))

(assert (= (and mapNonEmpty!4579 condMapEmpty!4581) mapIsEmpty!4581))

(assert (= (and mapNonEmpty!4579 (not condMapEmpty!4581)) mapNonEmpty!4581))

(assert (= (and mapNonEmpty!4581 ((_ is ValueCellFull!1086) mapValue!4581)) b!129836))

(assert (= (and mapNonEmpty!4579 ((_ is ValueCellFull!1086) mapDefault!4581)) b!129837))

(declare-fun m!152507 () Bool)

(assert (=> mapNonEmpty!4581 m!152507))

(declare-fun condMapEmpty!4582 () Bool)

(declare-fun mapDefault!4582 () ValueCell!1086)

(assert (=> mapNonEmpty!4580 (= condMapEmpty!4582 (= mapRest!4580 ((as const (Array (_ BitVec 32) ValueCell!1086)) mapDefault!4582)))))

(declare-fun e!84726 () Bool)

(declare-fun mapRes!4582 () Bool)

(assert (=> mapNonEmpty!4580 (= tp!11096 (and e!84726 mapRes!4582))))

(declare-fun b!129838 () Bool)

(declare-fun e!84725 () Bool)

(assert (=> b!129838 (= e!84725 tp_is_empty!2859)))

(declare-fun mapIsEmpty!4582 () Bool)

(assert (=> mapIsEmpty!4582 mapRes!4582))

(declare-fun b!129839 () Bool)

(assert (=> b!129839 (= e!84726 tp_is_empty!2859)))

(declare-fun mapNonEmpty!4582 () Bool)

(declare-fun tp!11098 () Bool)

(assert (=> mapNonEmpty!4582 (= mapRes!4582 (and tp!11098 e!84725))))

(declare-fun mapKey!4582 () (_ BitVec 32))

(declare-fun mapValue!4582 () ValueCell!1086)

(declare-fun mapRest!4582 () (Array (_ BitVec 32) ValueCell!1086))

(assert (=> mapNonEmpty!4582 (= mapRest!4580 (store mapRest!4582 mapKey!4582 mapValue!4582))))

(assert (= (and mapNonEmpty!4580 condMapEmpty!4582) mapIsEmpty!4582))

(assert (= (and mapNonEmpty!4580 (not condMapEmpty!4582)) mapNonEmpty!4582))

(assert (= (and mapNonEmpty!4582 ((_ is ValueCellFull!1086) mapValue!4582)) b!129838))

(assert (= (and mapNonEmpty!4580 ((_ is ValueCellFull!1086) mapDefault!4582)) b!129839))

(declare-fun m!152509 () Bool)

(assert (=> mapNonEmpty!4582 m!152509))

(declare-fun b_lambda!5755 () Bool)

(assert (= b_lambda!5751 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5755)))

(declare-fun b_lambda!5757 () Bool)

(assert (= b_lambda!5753 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5757)))

(declare-fun b_lambda!5759 () Bool)

(assert (= b_lambda!5747 (or (and b!129225 b_free!2885) (and b!129213 b_free!2887 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))))) b_lambda!5759)))

(declare-fun b_lambda!5761 () Bool)

(assert (= b_lambda!5749 (or (and b!129225 b_free!2885) (and b!129213 b_free!2887 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))))) b_lambda!5761)))

(declare-fun b_lambda!5763 () Bool)

(assert (= b_lambda!5745 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5763)))

(check-sat (not b!129834) (not b!129815) (not b_lambda!5743) (not b!129711) (not d!39291) (not b_lambda!5755) (not bm!14090) (not b!129604) (not b_lambda!5761) (not b!129735) (not b!129777) (not b!129788) (not d!39241) (not b!129775) (not d!39327) (not b!129805) (not bm!14116) (not b!129609) (not b!129608) (not b_lambda!5757) (not b_next!2887) (not d!39319) (not b!129821) (not d!39297) (not b!129749) (not b!129779) (not b!129812) (not bm!14076) (not b!129518) (not b!129525) (not d!39315) (not b!129709) (not b!129707) (not bm!14080) (not b!129699) (not d!39271) (not d!39351) (not b!129569) (not d!39257) (not b!129577) (not bm!14085) (not b!129565) (not b!129705) (not d!39247) (not b!129527) (not d!39303) (not d!39295) (not b!129658) (not d!39313) (not b!129517) (not d!39305) (not d!39255) (not b!129790) (not d!39307) (not d!39245) (not d!39277) (not d!39263) (not bm!14118) (not b!129572) b_and!8027 (not bm!14117) (not b!129648) (not b_lambda!5739) (not b!129679) (not d!39331) (not b!129508) (not b!129533) (not b!129809) (not d!39243) (not bm!14109) (not d!39293) (not d!39299) (not b!129656) (not bm!14078) (not b!129514) (not bm!14100) (not b!129835) (not b!129832) (not bm!14091) (not d!39341) b_and!8029 (not b!129649) (not b!129605) (not d!39281) (not b!129532) (not bm!14106) (not b!129771) (not bm!14101) (not b!129653) (not b!129536) (not d!39265) (not b!129607) (not b!129719) (not b!129521) (not b!129684) (not d!39273) (not mapNonEmpty!4581) (not b!129509) (not b_lambda!5763) (not d!39269) (not b_lambda!5759) (not b!129566) (not b!129802) (not bm!14126) (not b!129718) (not bm!14111) (not b!129706) (not d!39345) (not b!129722) (not b!129803) (not d!39249) (not d!39285) (not b!129738) (not bm!14110) (not b!129765) (not d!39321) (not d!39311) (not b!129563) (not d!39323) (not b!129503) (not b!129678) (not b!129695) (not bm!14079) (not d!39333) (not b!129717) (not b!129564) (not b!129575) (not b!129750) (not d!39259) (not b!129744) (not b!129742) (not b!129813) (not b!129568) (not b!129697) (not b!129759) (not b!129770) (not b!129733) (not b!129603) (not b!129537) (not b!129681) (not mapNonEmpty!4582) (not bm!14102) (not bm!14123) (not d!39287) (not d!39301) (not d!39309) (not b_next!2885) (not b!129710) (not d!39317) (not b!129606) (not bm!14114) (not b!129645) (not b!129774) (not b!129754) (not b!129516) (not d!39253) (not d!39289) (not b!129571) (not b!129720) (not b!129713) (not bm!14107) (not d!39275) (not d!39349) (not b!129831) (not d!39279) tp_is_empty!2859 (not b!129704) (not b!129716) (not b!129756) (not b!129763) (not d!39343) (not b!129602) (not b!129753))
(check-sat b_and!8027 b_and!8029 (not b_next!2885) (not b_next!2887))
(get-model)

(declare-fun bm!14127 () Bool)

(declare-fun call!14130 () (_ BitVec 32))

(assert (=> bm!14127 (= call!14130 (arrayCountValidKeys!0 (_keys!4565 (_2!1316 lt!67159)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(declare-fun b!129840 () Bool)

(declare-fun e!84728 () (_ BitVec 32))

(assert (=> b!129840 (= e!84728 (bvadd #b00000000000000000000000000000001 call!14130))))

(declare-fun d!39353 () Bool)

(declare-fun lt!67477 () (_ BitVec 32))

(assert (=> d!39353 (and (bvsge lt!67477 #b00000000000000000000000000000000) (bvsle lt!67477 (bvsub (size!2509 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(declare-fun e!84727 () (_ BitVec 32))

(assert (=> d!39353 (= lt!67477 e!84727)))

(declare-fun c!23890 () Bool)

(assert (=> d!39353 (= c!23890 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(assert (=> d!39353 (and (bvsle #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2509 (_keys!4565 (_2!1316 lt!67159))) (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(assert (=> d!39353 (= (arrayCountValidKeys!0 (_keys!4565 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))) lt!67477)))

(declare-fun b!129841 () Bool)

(assert (=> b!129841 (= e!84728 call!14130)))

(declare-fun b!129842 () Bool)

(assert (=> b!129842 (= e!84727 e!84728)))

(declare-fun c!23891 () Bool)

(assert (=> b!129842 (= c!23891 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(declare-fun b!129843 () Bool)

(assert (=> b!129843 (= e!84727 #b00000000000000000000000000000000)))

(assert (= (and d!39353 c!23890) b!129843))

(assert (= (and d!39353 (not c!23890)) b!129842))

(assert (= (and b!129842 c!23891) b!129840))

(assert (= (and b!129842 (not c!23891)) b!129841))

(assert (= (or b!129840 b!129841) bm!14127))

(declare-fun m!152511 () Bool)

(assert (=> bm!14127 m!152511))

(declare-fun m!152513 () Bool)

(assert (=> b!129842 m!152513))

(assert (=> b!129842 m!152513))

(declare-fun m!152515 () Bool)

(assert (=> b!129842 m!152515))

(assert (=> b!129602 d!39353))

(declare-fun d!39355 () Bool)

(declare-fun lt!67480 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!129 (List!1708) (InoxSet tuple2!2608))

(assert (=> d!39355 (= lt!67480 (select (content!129 (toList!864 lt!67474)) (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84734 () Bool)

(assert (=> d!39355 (= lt!67480 e!84734)))

(declare-fun res!62650 () Bool)

(assert (=> d!39355 (=> (not res!62650) (not e!84734))))

(assert (=> d!39355 (= res!62650 ((_ is Cons!1704) (toList!864 lt!67474)))))

(assert (=> d!39355 (= (contains!890 (toList!864 lt!67474) (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67480)))

(declare-fun b!129848 () Bool)

(declare-fun e!84733 () Bool)

(assert (=> b!129848 (= e!84734 e!84733)))

(declare-fun res!62651 () Bool)

(assert (=> b!129848 (=> res!62651 e!84733)))

(assert (=> b!129848 (= res!62651 (= (h!2308 (toList!864 lt!67474)) (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129849 () Bool)

(assert (=> b!129849 (= e!84733 (contains!890 (t!6107 (toList!864 lt!67474)) (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39355 res!62650) b!129848))

(assert (= (and b!129848 (not res!62651)) b!129849))

(declare-fun m!152517 () Bool)

(assert (=> d!39355 m!152517))

(declare-fun m!152519 () Bool)

(assert (=> d!39355 m!152519))

(declare-fun m!152521 () Bool)

(assert (=> b!129849 m!152521))

(assert (=> b!129835 d!39355))

(declare-fun d!39357 () Bool)

(assert (=> d!39357 (= (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129749 d!39357))

(declare-fun d!39359 () Bool)

(declare-fun e!84735 () Bool)

(assert (=> d!39359 e!84735))

(declare-fun res!62652 () Bool)

(assert (=> d!39359 (=> res!62652 e!84735)))

(declare-fun lt!67484 () Bool)

(assert (=> d!39359 (= res!62652 (not lt!67484))))

(declare-fun lt!67483 () Bool)

(assert (=> d!39359 (= lt!67484 lt!67483)))

(declare-fun lt!67482 () Unit!4039)

(declare-fun e!84736 () Unit!4039)

(assert (=> d!39359 (= lt!67482 e!84736)))

(declare-fun c!23892 () Bool)

(assert (=> d!39359 (= c!23892 lt!67483)))

(assert (=> d!39359 (= lt!67483 (containsKey!173 (toList!864 lt!67240) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39359 (= (contains!889 lt!67240 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67484)))

(declare-fun b!129850 () Bool)

(declare-fun lt!67481 () Unit!4039)

(assert (=> b!129850 (= e!84736 lt!67481)))

(assert (=> b!129850 (= lt!67481 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67240) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129850 (isDefined!122 (getValueByKey!169 (toList!864 lt!67240) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129851 () Bool)

(declare-fun Unit!4058 () Unit!4039)

(assert (=> b!129851 (= e!84736 Unit!4058)))

(declare-fun b!129852 () Bool)

(assert (=> b!129852 (= e!84735 (isDefined!122 (getValueByKey!169 (toList!864 lt!67240) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39359 c!23892) b!129850))

(assert (= (and d!39359 (not c!23892)) b!129851))

(assert (= (and d!39359 (not res!62652)) b!129852))

(declare-fun m!152523 () Bool)

(assert (=> d!39359 m!152523))

(declare-fun m!152525 () Bool)

(assert (=> b!129850 m!152525))

(declare-fun m!152527 () Bool)

(assert (=> b!129850 m!152527))

(assert (=> b!129850 m!152527))

(declare-fun m!152529 () Bool)

(assert (=> b!129850 m!152529))

(assert (=> b!129852 m!152527))

(assert (=> b!129852 m!152527))

(assert (=> b!129852 m!152529))

(assert (=> d!39249 d!39359))

(assert (=> d!39249 d!39237))

(declare-fun d!39361 () Bool)

(declare-fun e!84737 () Bool)

(assert (=> d!39361 e!84737))

(declare-fun res!62653 () Bool)

(assert (=> d!39361 (=> res!62653 e!84737)))

(declare-fun lt!67488 () Bool)

(assert (=> d!39361 (= res!62653 (not lt!67488))))

(declare-fun lt!67487 () Bool)

(assert (=> d!39361 (= lt!67488 lt!67487)))

(declare-fun lt!67486 () Unit!4039)

(declare-fun e!84738 () Unit!4039)

(assert (=> d!39361 (= lt!67486 e!84738)))

(declare-fun c!23893 () Bool)

(assert (=> d!39361 (= c!23893 lt!67487)))

(assert (=> d!39361 (= lt!67487 (containsKey!173 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))))

(assert (=> d!39361 (= (contains!889 (getCurrentListMap!541 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))) lt!67488)))

(declare-fun b!129853 () Bool)

(declare-fun lt!67485 () Unit!4039)

(assert (=> b!129853 (= e!84738 lt!67485)))

(assert (=> b!129853 (= lt!67485 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))))

(assert (=> b!129853 (isDefined!122 (getValueByKey!169 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))))

(declare-fun b!129854 () Bool)

(declare-fun Unit!4059 () Unit!4039)

(assert (=> b!129854 (= e!84738 Unit!4059)))

(declare-fun b!129855 () Bool)

(assert (=> b!129855 (= e!84737 (isDefined!122 (getValueByKey!169 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(assert (= (and d!39361 c!23893) b!129853))

(assert (= (and d!39361 (not c!23893)) b!129854))

(assert (= (and d!39361 (not res!62653)) b!129855))

(assert (=> d!39361 m!151907))

(declare-fun m!152531 () Bool)

(assert (=> d!39361 m!152531))

(assert (=> b!129853 m!151907))

(declare-fun m!152533 () Bool)

(assert (=> b!129853 m!152533))

(assert (=> b!129853 m!151907))

(declare-fun m!152535 () Bool)

(assert (=> b!129853 m!152535))

(assert (=> b!129853 m!152535))

(declare-fun m!152537 () Bool)

(assert (=> b!129853 m!152537))

(assert (=> b!129855 m!151907))

(assert (=> b!129855 m!152535))

(assert (=> b!129855 m!152535))

(assert (=> b!129855 m!152537))

(assert (=> b!129809 d!39361))

(declare-fun e!84749 () Bool)

(declare-fun lt!67495 () ListLongMap!1697)

(declare-fun b!129856 () Bool)

(assert (=> b!129856 (= e!84749 (= (apply!113 lt!67495 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 lt!67149) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129856 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 lt!67149)))))

(assert (=> b!129856 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129857 () Bool)

(declare-fun e!84741 () Bool)

(declare-fun e!84748 () Bool)

(assert (=> b!129857 (= e!84741 e!84748)))

(declare-fun res!62660 () Bool)

(declare-fun call!14135 () Bool)

(assert (=> b!129857 (= res!62660 call!14135)))

(assert (=> b!129857 (=> (not res!62660) (not e!84748))))

(declare-fun b!129858 () Bool)

(declare-fun e!84750 () Bool)

(declare-fun call!14136 () Bool)

(assert (=> b!129858 (= e!84750 (not call!14136))))

(declare-fun bm!14128 () Bool)

(assert (=> bm!14128 (= call!14136 (contains!889 lt!67495 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129859 () Bool)

(declare-fun e!84751 () Unit!4039)

(declare-fun lt!67505 () Unit!4039)

(assert (=> b!129859 (= e!84751 lt!67505)))

(declare-fun lt!67507 () ListLongMap!1697)

(assert (=> b!129859 (= lt!67507 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67503 () (_ BitVec 64))

(assert (=> b!129859 (= lt!67503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67496 () (_ BitVec 64))

(assert (=> b!129859 (= lt!67496 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67502 () Unit!4039)

(assert (=> b!129859 (= lt!67502 (addStillContains!89 lt!67507 lt!67503 (zeroValue!2683 newMap!16) lt!67496))))

(assert (=> b!129859 (contains!889 (+!172 lt!67507 (tuple2!2609 lt!67503 (zeroValue!2683 newMap!16))) lt!67496)))

(declare-fun lt!67509 () Unit!4039)

(assert (=> b!129859 (= lt!67509 lt!67502)))

(declare-fun lt!67497 () ListLongMap!1697)

(assert (=> b!129859 (= lt!67497 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67500 () (_ BitVec 64))

(assert (=> b!129859 (= lt!67500 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67491 () (_ BitVec 64))

(assert (=> b!129859 (= lt!67491 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67506 () Unit!4039)

(assert (=> b!129859 (= lt!67506 (addApplyDifferent!89 lt!67497 lt!67500 (minValue!2683 newMap!16) lt!67491))))

(assert (=> b!129859 (= (apply!113 (+!172 lt!67497 (tuple2!2609 lt!67500 (minValue!2683 newMap!16))) lt!67491) (apply!113 lt!67497 lt!67491))))

(declare-fun lt!67504 () Unit!4039)

(assert (=> b!129859 (= lt!67504 lt!67506)))

(declare-fun lt!67489 () ListLongMap!1697)

(assert (=> b!129859 (= lt!67489 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67492 () (_ BitVec 64))

(assert (=> b!129859 (= lt!67492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67493 () (_ BitVec 64))

(assert (=> b!129859 (= lt!67493 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67490 () Unit!4039)

(assert (=> b!129859 (= lt!67490 (addApplyDifferent!89 lt!67489 lt!67492 (zeroValue!2683 newMap!16) lt!67493))))

(assert (=> b!129859 (= (apply!113 (+!172 lt!67489 (tuple2!2609 lt!67492 (zeroValue!2683 newMap!16))) lt!67493) (apply!113 lt!67489 lt!67493))))

(declare-fun lt!67501 () Unit!4039)

(assert (=> b!129859 (= lt!67501 lt!67490)))

(declare-fun lt!67499 () ListLongMap!1697)

(assert (=> b!129859 (= lt!67499 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67508 () (_ BitVec 64))

(assert (=> b!129859 (= lt!67508 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67494 () (_ BitVec 64))

(assert (=> b!129859 (= lt!67494 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129859 (= lt!67505 (addApplyDifferent!89 lt!67499 lt!67508 (minValue!2683 newMap!16) lt!67494))))

(assert (=> b!129859 (= (apply!113 (+!172 lt!67499 (tuple2!2609 lt!67508 (minValue!2683 newMap!16))) lt!67494) (apply!113 lt!67499 lt!67494))))

(declare-fun b!129860 () Bool)

(declare-fun res!62662 () Bool)

(declare-fun e!84742 () Bool)

(assert (=> b!129860 (=> (not res!62662) (not e!84742))))

(assert (=> b!129860 (= res!62662 e!84750)))

(declare-fun c!23895 () Bool)

(assert (=> b!129860 (= c!23895 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129861 () Bool)

(declare-fun e!84739 () ListLongMap!1697)

(declare-fun call!14134 () ListLongMap!1697)

(assert (=> b!129861 (= e!84739 call!14134)))

(declare-fun b!129862 () Bool)

(declare-fun res!62661 () Bool)

(assert (=> b!129862 (=> (not res!62661) (not e!84742))))

(declare-fun e!84743 () Bool)

(assert (=> b!129862 (= res!62661 e!84743)))

(declare-fun res!62657 () Bool)

(assert (=> b!129862 (=> res!62657 e!84743)))

(declare-fun e!84740 () Bool)

(assert (=> b!129862 (= res!62657 (not e!84740))))

(declare-fun res!62655 () Bool)

(assert (=> b!129862 (=> (not res!62655) (not e!84740))))

(assert (=> b!129862 (= res!62655 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun bm!14129 () Bool)

(declare-fun call!14132 () ListLongMap!1697)

(declare-fun call!14131 () ListLongMap!1697)

(assert (=> bm!14129 (= call!14132 call!14131)))

(declare-fun d!39363 () Bool)

(assert (=> d!39363 e!84742))

(declare-fun res!62658 () Bool)

(assert (=> d!39363 (=> (not res!62658) (not e!84742))))

(assert (=> d!39363 (= res!62658 (or (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun lt!67510 () ListLongMap!1697)

(assert (=> d!39363 (= lt!67495 lt!67510)))

(declare-fun lt!67498 () Unit!4039)

(assert (=> d!39363 (= lt!67498 e!84751)))

(declare-fun c!23896 () Bool)

(declare-fun e!84746 () Bool)

(assert (=> d!39363 (= c!23896 e!84746)))

(declare-fun res!62659 () Bool)

(assert (=> d!39363 (=> (not res!62659) (not e!84746))))

(assert (=> d!39363 (= res!62659 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun e!84744 () ListLongMap!1697)

(assert (=> d!39363 (= lt!67510 e!84744)))

(declare-fun c!23897 () Bool)

(assert (=> d!39363 (= c!23897 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39363 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39363 (= (getCurrentListMap!541 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67495)))

(declare-fun b!129863 () Bool)

(assert (=> b!129863 (= e!84746 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129864 () Bool)

(declare-fun e!84747 () ListLongMap!1697)

(declare-fun call!14137 () ListLongMap!1697)

(assert (=> b!129864 (= e!84747 call!14137)))

(declare-fun bm!14130 () Bool)

(assert (=> bm!14130 (= call!14135 (contains!889 lt!67495 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129865 () Bool)

(assert (=> b!129865 (= e!84743 e!84749)))

(declare-fun res!62656 () Bool)

(assert (=> b!129865 (=> (not res!62656) (not e!84749))))

(assert (=> b!129865 (= res!62656 (contains!889 lt!67495 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129865 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129866 () Bool)

(declare-fun c!23899 () Bool)

(assert (=> b!129866 (= c!23899 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129866 (= e!84747 e!84739)))

(declare-fun b!129867 () Bool)

(assert (=> b!129867 (= e!84742 e!84741)))

(declare-fun c!23894 () Bool)

(assert (=> b!129867 (= c!23894 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129868 () Bool)

(declare-fun Unit!4060 () Unit!4039)

(assert (=> b!129868 (= e!84751 Unit!4060)))

(declare-fun bm!14131 () Bool)

(assert (=> bm!14131 (= call!14131 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!129869 () Bool)

(assert (=> b!129869 (= e!84744 e!84747)))

(declare-fun c!23898 () Bool)

(assert (=> b!129869 (= c!23898 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!14133 () ListLongMap!1697)

(declare-fun bm!14132 () Bool)

(assert (=> bm!14132 (= call!14133 (+!172 (ite c!23897 call!14131 (ite c!23898 call!14132 call!14134)) (ite (or c!23897 c!23898) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun b!129870 () Bool)

(assert (=> b!129870 (= e!84740 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129871 () Bool)

(assert (=> b!129871 (= e!84748 (= (apply!113 lt!67495 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 newMap!16)))))

(declare-fun b!129872 () Bool)

(declare-fun e!84745 () Bool)

(assert (=> b!129872 (= e!84750 e!84745)))

(declare-fun res!62654 () Bool)

(assert (=> b!129872 (= res!62654 call!14136)))

(assert (=> b!129872 (=> (not res!62654) (not e!84745))))

(declare-fun bm!14133 () Bool)

(assert (=> bm!14133 (= call!14134 call!14132)))

(declare-fun bm!14134 () Bool)

(assert (=> bm!14134 (= call!14137 call!14133)))

(declare-fun b!129873 () Bool)

(assert (=> b!129873 (= e!84739 call!14137)))

(declare-fun b!129874 () Bool)

(assert (=> b!129874 (= e!84745 (= (apply!113 lt!67495 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 newMap!16)))))

(declare-fun b!129875 () Bool)

(assert (=> b!129875 (= e!84744 (+!172 call!14133 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(declare-fun b!129876 () Bool)

(assert (=> b!129876 (= e!84741 (not call!14135))))

(assert (= (and d!39363 c!23897) b!129875))

(assert (= (and d!39363 (not c!23897)) b!129869))

(assert (= (and b!129869 c!23898) b!129864))

(assert (= (and b!129869 (not c!23898)) b!129866))

(assert (= (and b!129866 c!23899) b!129873))

(assert (= (and b!129866 (not c!23899)) b!129861))

(assert (= (or b!129873 b!129861) bm!14133))

(assert (= (or b!129864 bm!14133) bm!14129))

(assert (= (or b!129864 b!129873) bm!14134))

(assert (= (or b!129875 bm!14129) bm!14131))

(assert (= (or b!129875 bm!14134) bm!14132))

(assert (= (and d!39363 res!62659) b!129863))

(assert (= (and d!39363 c!23896) b!129859))

(assert (= (and d!39363 (not c!23896)) b!129868))

(assert (= (and d!39363 res!62658) b!129862))

(assert (= (and b!129862 res!62655) b!129870))

(assert (= (and b!129862 (not res!62657)) b!129865))

(assert (= (and b!129865 res!62656) b!129856))

(assert (= (and b!129862 res!62661) b!129860))

(assert (= (and b!129860 c!23895) b!129872))

(assert (= (and b!129860 (not c!23895)) b!129858))

(assert (= (and b!129872 res!62654) b!129874))

(assert (= (or b!129872 b!129858) bm!14128))

(assert (= (and b!129860 res!62662) b!129867))

(assert (= (and b!129867 c!23894) b!129857))

(assert (= (and b!129867 (not c!23894)) b!129876))

(assert (= (and b!129857 res!62660) b!129871))

(assert (= (or b!129857 b!129876) bm!14130))

(declare-fun b_lambda!5765 () Bool)

(assert (=> (not b_lambda!5765) (not b!129856)))

(assert (=> b!129856 t!6114))

(declare-fun b_and!8031 () Bool)

(assert (= b_and!8027 (and (=> t!6114 result!3921) b_and!8031)))

(assert (=> b!129856 t!6116))

(declare-fun b_and!8033 () Bool)

(assert (= b_and!8029 (and (=> t!6116 result!3923) b_and!8033)))

(declare-fun m!152539 () Bool)

(assert (=> bm!14131 m!152539))

(declare-fun m!152541 () Bool)

(assert (=> bm!14130 m!152541))

(declare-fun m!152543 () Bool)

(assert (=> bm!14132 m!152543))

(declare-fun m!152545 () Bool)

(assert (=> b!129856 m!152545))

(assert (=> b!129856 m!152009))

(declare-fun m!152547 () Bool)

(assert (=> b!129856 m!152547))

(assert (=> b!129856 m!152013))

(assert (=> b!129856 m!152013))

(declare-fun m!152549 () Bool)

(assert (=> b!129856 m!152549))

(assert (=> b!129856 m!152545))

(assert (=> b!129856 m!152009))

(declare-fun m!152551 () Bool)

(assert (=> b!129874 m!152551))

(assert (=> b!129870 m!152013))

(assert (=> b!129870 m!152013))

(assert (=> b!129870 m!152019))

(assert (=> b!129863 m!152013))

(assert (=> b!129863 m!152013))

(assert (=> b!129863 m!152019))

(assert (=> d!39363 m!151983))

(declare-fun m!152553 () Bool)

(assert (=> b!129871 m!152553))

(declare-fun m!152555 () Bool)

(assert (=> b!129875 m!152555))

(declare-fun m!152557 () Bool)

(assert (=> bm!14128 m!152557))

(assert (=> b!129865 m!152013))

(assert (=> b!129865 m!152013))

(declare-fun m!152559 () Bool)

(assert (=> b!129865 m!152559))

(declare-fun m!152561 () Bool)

(assert (=> b!129859 m!152561))

(declare-fun m!152563 () Bool)

(assert (=> b!129859 m!152563))

(declare-fun m!152565 () Bool)

(assert (=> b!129859 m!152565))

(declare-fun m!152567 () Bool)

(assert (=> b!129859 m!152567))

(assert (=> b!129859 m!152539))

(declare-fun m!152569 () Bool)

(assert (=> b!129859 m!152569))

(declare-fun m!152571 () Bool)

(assert (=> b!129859 m!152571))

(declare-fun m!152573 () Bool)

(assert (=> b!129859 m!152573))

(declare-fun m!152575 () Bool)

(assert (=> b!129859 m!152575))

(declare-fun m!152577 () Bool)

(assert (=> b!129859 m!152577))

(assert (=> b!129859 m!152013))

(declare-fun m!152579 () Bool)

(assert (=> b!129859 m!152579))

(declare-fun m!152581 () Bool)

(assert (=> b!129859 m!152581))

(declare-fun m!152583 () Bool)

(assert (=> b!129859 m!152583))

(assert (=> b!129859 m!152569))

(declare-fun m!152585 () Bool)

(assert (=> b!129859 m!152585))

(declare-fun m!152587 () Bool)

(assert (=> b!129859 m!152587))

(assert (=> b!129859 m!152575))

(assert (=> b!129859 m!152581))

(assert (=> b!129859 m!152563))

(declare-fun m!152589 () Bool)

(assert (=> b!129859 m!152589))

(assert (=> b!129809 d!39363))

(assert (=> b!129770 d!39357))

(declare-fun b!129877 () Bool)

(declare-fun e!84756 () ListLongMap!1697)

(declare-fun e!84758 () ListLongMap!1697)

(assert (=> b!129877 (= e!84756 e!84758)))

(declare-fun c!23902 () Bool)

(assert (=> b!129877 (= c!23902 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!129878 () Bool)

(declare-fun lt!67516 () Unit!4039)

(declare-fun lt!67513 () Unit!4039)

(assert (=> b!129878 (= lt!67516 lt!67513)))

(declare-fun lt!67512 () V!3459)

(declare-fun lt!67514 () (_ BitVec 64))

(declare-fun lt!67515 () (_ BitVec 64))

(declare-fun lt!67511 () ListLongMap!1697)

(assert (=> b!129878 (not (contains!889 (+!172 lt!67511 (tuple2!2609 lt!67515 lt!67512)) lt!67514))))

(assert (=> b!129878 (= lt!67513 (addStillNotContains!58 lt!67511 lt!67515 lt!67512 lt!67514))))

(assert (=> b!129878 (= lt!67514 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!129878 (= lt!67512 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!129878 (= lt!67515 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!14138 () ListLongMap!1697)

(assert (=> b!129878 (= lt!67511 call!14138)))

(assert (=> b!129878 (= e!84758 (+!172 call!14138 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!129879 () Bool)

(declare-fun e!84752 () Bool)

(declare-fun lt!67517 () ListLongMap!1697)

(assert (=> b!129879 (= e!84752 (= lt!67517 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!129880 () Bool)

(declare-fun res!62665 () Bool)

(declare-fun e!84755 () Bool)

(assert (=> b!129880 (=> (not res!62665) (not e!84755))))

(assert (=> b!129880 (= res!62665 (not (contains!889 lt!67517 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129881 () Bool)

(assert (=> b!129881 (= e!84758 call!14138)))

(declare-fun bm!14135 () Bool)

(assert (=> bm!14135 (= call!14138 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!129882 () Bool)

(assert (=> b!129882 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> b!129882 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2510 (_values!2807 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun e!84757 () Bool)

(assert (=> b!129882 (= e!84757 (= (apply!113 lt!67517 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129883 () Bool)

(declare-fun e!84753 () Bool)

(assert (=> b!129883 (= e!84753 e!84757)))

(assert (=> b!129883 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun res!62663 () Bool)

(assert (=> b!129883 (= res!62663 (contains!889 lt!67517 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!129883 (=> (not res!62663) (not e!84757))))

(declare-fun d!39365 () Bool)

(assert (=> d!39365 e!84755))

(declare-fun res!62666 () Bool)

(assert (=> d!39365 (=> (not res!62666) (not e!84755))))

(assert (=> d!39365 (= res!62666 (not (contains!889 lt!67517 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39365 (= lt!67517 e!84756)))

(declare-fun c!23901 () Bool)

(assert (=> d!39365 (= c!23901 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> d!39365 (validMask!0 (mask!7102 (v!3162 (underlying!448 thiss!992))))))

(assert (=> d!39365 (= (getCurrentListMapNoExtraKeys!138 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (_values!2807 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992))) (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) (minValue!2683 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992)))) lt!67517)))

(declare-fun b!129884 () Bool)

(assert (=> b!129884 (= e!84753 e!84752)))

(declare-fun c!23903 () Bool)

(assert (=> b!129884 (= c!23903 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!129885 () Bool)

(declare-fun e!84754 () Bool)

(assert (=> b!129885 (= e!84754 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!129885 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!129886 () Bool)

(assert (=> b!129886 (= e!84752 (isEmpty!402 lt!67517))))

(declare-fun b!129887 () Bool)

(assert (=> b!129887 (= e!84756 (ListLongMap!1698 Nil!1705))))

(declare-fun b!129888 () Bool)

(assert (=> b!129888 (= e!84755 e!84753)))

(declare-fun c!23900 () Bool)

(assert (=> b!129888 (= c!23900 e!84754)))

(declare-fun res!62664 () Bool)

(assert (=> b!129888 (=> (not res!62664) (not e!84754))))

(assert (=> b!129888 (= res!62664 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39365 c!23901) b!129887))

(assert (= (and d!39365 (not c!23901)) b!129877))

(assert (= (and b!129877 c!23902) b!129878))

(assert (= (and b!129877 (not c!23902)) b!129881))

(assert (= (or b!129878 b!129881) bm!14135))

(assert (= (and d!39365 res!62666) b!129880))

(assert (= (and b!129880 res!62665) b!129888))

(assert (= (and b!129888 res!62664) b!129885))

(assert (= (and b!129888 c!23900) b!129883))

(assert (= (and b!129888 (not c!23900)) b!129884))

(assert (= (and b!129883 res!62663) b!129882))

(assert (= (and b!129884 c!23903) b!129879))

(assert (= (and b!129884 (not c!23903)) b!129886))

(declare-fun b_lambda!5767 () Bool)

(assert (=> (not b_lambda!5767) (not b!129878)))

(assert (=> b!129878 t!6104))

(declare-fun b_and!8035 () Bool)

(assert (= b_and!8031 (and (=> t!6104 result!3907) b_and!8035)))

(assert (=> b!129878 t!6106))

(declare-fun b_and!8037 () Bool)

(assert (= b_and!8033 (and (=> t!6106 result!3911) b_and!8037)))

(declare-fun b_lambda!5769 () Bool)

(assert (=> (not b_lambda!5769) (not b!129882)))

(assert (=> b!129882 t!6104))

(declare-fun b_and!8039 () Bool)

(assert (= b_and!8035 (and (=> t!6104 result!3907) b_and!8039)))

(assert (=> b!129882 t!6106))

(declare-fun b_and!8041 () Bool)

(assert (= b_and!8037 (and (=> t!6106 result!3911) b_and!8041)))

(declare-fun m!152591 () Bool)

(assert (=> b!129886 m!152591))

(declare-fun m!152593 () Bool)

(assert (=> d!39365 m!152593))

(assert (=> d!39365 m!151781))

(declare-fun m!152595 () Bool)

(assert (=> b!129882 m!152595))

(declare-fun m!152597 () Bool)

(assert (=> b!129882 m!152597))

(declare-fun m!152599 () Bool)

(assert (=> b!129882 m!152599))

(assert (=> b!129882 m!152597))

(assert (=> b!129882 m!152595))

(assert (=> b!129882 m!151765))

(declare-fun m!152601 () Bool)

(assert (=> b!129882 m!152601))

(assert (=> b!129882 m!151765))

(assert (=> b!129877 m!152597))

(assert (=> b!129877 m!152597))

(declare-fun m!152603 () Bool)

(assert (=> b!129877 m!152603))

(assert (=> b!129883 m!152597))

(assert (=> b!129883 m!152597))

(declare-fun m!152605 () Bool)

(assert (=> b!129883 m!152605))

(declare-fun m!152607 () Bool)

(assert (=> bm!14135 m!152607))

(declare-fun m!152609 () Bool)

(assert (=> b!129880 m!152609))

(assert (=> b!129885 m!152597))

(assert (=> b!129885 m!152597))

(assert (=> b!129885 m!152603))

(assert (=> b!129878 m!152595))

(declare-fun m!152611 () Bool)

(assert (=> b!129878 m!152611))

(declare-fun m!152613 () Bool)

(assert (=> b!129878 m!152613))

(assert (=> b!129878 m!152597))

(declare-fun m!152615 () Bool)

(assert (=> b!129878 m!152615))

(assert (=> b!129878 m!151765))

(assert (=> b!129878 m!152611))

(assert (=> b!129878 m!152595))

(assert (=> b!129878 m!151765))

(assert (=> b!129878 m!152601))

(declare-fun m!152617 () Bool)

(assert (=> b!129878 m!152617))

(assert (=> b!129879 m!152607))

(assert (=> b!129565 d!39365))

(declare-fun d!39367 () Bool)

(declare-fun e!84759 () Bool)

(assert (=> d!39367 e!84759))

(declare-fun res!62667 () Bool)

(assert (=> d!39367 (=> (not res!62667) (not e!84759))))

(declare-fun lt!67519 () ListLongMap!1697)

(assert (=> d!39367 (= res!62667 (contains!889 lt!67519 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67520 () List!1708)

(assert (=> d!39367 (= lt!67519 (ListLongMap!1698 lt!67520))))

(declare-fun lt!67521 () Unit!4039)

(declare-fun lt!67518 () Unit!4039)

(assert (=> d!39367 (= lt!67521 lt!67518)))

(assert (=> d!39367 (= (getValueByKey!169 lt!67520 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39367 (= lt!67518 (lemmaContainsTupThenGetReturnValue!84 lt!67520 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39367 (= lt!67520 (insertStrictlySorted!87 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39367 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67519)))

(declare-fun b!129889 () Bool)

(declare-fun res!62668 () Bool)

(assert (=> b!129889 (=> (not res!62668) (not e!84759))))

(assert (=> b!129889 (= res!62668 (= (getValueByKey!169 (toList!864 lt!67519) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129890 () Bool)

(assert (=> b!129890 (= e!84759 (contains!890 (toList!864 lt!67519) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39367 res!62667) b!129889))

(assert (= (and b!129889 res!62668) b!129890))

(declare-fun m!152619 () Bool)

(assert (=> d!39367 m!152619))

(declare-fun m!152621 () Bool)

(assert (=> d!39367 m!152621))

(declare-fun m!152623 () Bool)

(assert (=> d!39367 m!152623))

(declare-fun m!152625 () Bool)

(assert (=> d!39367 m!152625))

(declare-fun m!152627 () Bool)

(assert (=> b!129889 m!152627))

(declare-fun m!152629 () Bool)

(assert (=> b!129890 m!152629))

(assert (=> d!39271 d!39367))

(declare-fun d!39369 () Bool)

(declare-fun e!84762 () Bool)

(assert (=> d!39369 e!84762))

(declare-fun res!62671 () Bool)

(assert (=> d!39369 (=> (not res!62671) (not e!84762))))

(assert (=> d!39369 (= res!62671 (and (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (size!2509 (_keys!4565 newMap!16)))))))

(declare-fun lt!67524 () Unit!4039)

(declare-fun choose!102 ((_ BitVec 64) array!4739 (_ BitVec 32) (_ BitVec 32)) Unit!4039)

(assert (=> d!39369 (= lt!67524 (choose!102 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (mask!7102 newMap!16)))))

(assert (=> d!39369 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39369 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (mask!7102 newMap!16)) lt!67524)))

(declare-fun b!129893 () Bool)

(assert (=> b!129893 (= e!84762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (mask!7102 newMap!16)))))

(assert (= (and d!39369 res!62671) b!129893))

(assert (=> d!39369 m!151769))

(declare-fun m!152631 () Bool)

(assert (=> d!39369 m!152631))

(assert (=> d!39369 m!151983))

(assert (=> b!129893 m!152143))

(assert (=> b!129893 m!152167))

(assert (=> d!39271 d!39369))

(declare-fun d!39371 () Bool)

(declare-fun e!84765 () Bool)

(assert (=> d!39371 e!84765))

(declare-fun res!62674 () Bool)

(assert (=> d!39371 (=> (not res!62674) (not e!84765))))

(assert (=> d!39371 (= res!62674 (and (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (size!2509 (_keys!4565 newMap!16))) (bvslt (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (size!2510 (_values!2807 newMap!16)))))))

(declare-fun lt!67527 () Unit!4039)

(declare-fun choose!795 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 32) (_ BitVec 64) V!3459 Int) Unit!4039)

(assert (=> d!39371 (= lt!67527 (choose!795 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39371 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39371 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!39 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)) lt!67527)))

(declare-fun b!129896 () Bool)

(assert (=> b!129896 (= e!84765 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!541 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))))))

(assert (= (and d!39371 res!62674) b!129896))

(assert (=> d!39371 m!151769))

(assert (=> d!39371 m!151767))

(declare-fun m!152633 () Bool)

(assert (=> d!39371 m!152633))

(assert (=> d!39371 m!151983))

(assert (=> b!129896 m!152143))

(assert (=> b!129896 m!152147))

(assert (=> b!129896 m!151839))

(assert (=> b!129896 m!152177))

(assert (=> b!129896 m!152145))

(assert (=> b!129896 m!151839))

(assert (=> d!39271 d!39371))

(declare-fun d!39373 () Bool)

(declare-fun e!84766 () Bool)

(assert (=> d!39373 e!84766))

(declare-fun res!62675 () Bool)

(assert (=> d!39373 (=> res!62675 e!84766)))

(declare-fun lt!67531 () Bool)

(assert (=> d!39373 (= res!62675 (not lt!67531))))

(declare-fun lt!67530 () Bool)

(assert (=> d!39373 (= lt!67531 lt!67530)))

(declare-fun lt!67529 () Unit!4039)

(declare-fun e!84767 () Unit!4039)

(assert (=> d!39373 (= lt!67529 e!84767)))

(declare-fun c!23904 () Bool)

(assert (=> d!39373 (= c!23904 lt!67530)))

(assert (=> d!39373 (= lt!67530 (containsKey!173 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39373 (= (contains!889 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67531)))

(declare-fun b!129897 () Bool)

(declare-fun lt!67528 () Unit!4039)

(assert (=> b!129897 (= e!84767 lt!67528)))

(assert (=> b!129897 (= lt!67528 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!129897 (isDefined!122 (getValueByKey!169 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129898 () Bool)

(declare-fun Unit!4061 () Unit!4039)

(assert (=> b!129898 (= e!84767 Unit!4061)))

(declare-fun b!129899 () Bool)

(assert (=> b!129899 (= e!84766 (isDefined!122 (getValueByKey!169 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (= (and d!39373 c!23904) b!129897))

(assert (= (and d!39373 (not c!23904)) b!129898))

(assert (= (and d!39373 (not res!62675)) b!129899))

(assert (=> d!39373 m!151769))

(declare-fun m!152635 () Bool)

(assert (=> d!39373 m!152635))

(assert (=> b!129897 m!151769))

(declare-fun m!152637 () Bool)

(assert (=> b!129897 m!152637))

(assert (=> b!129897 m!151769))

(declare-fun m!152639 () Bool)

(assert (=> b!129897 m!152639))

(assert (=> b!129897 m!152639))

(declare-fun m!152641 () Bool)

(assert (=> b!129897 m!152641))

(assert (=> b!129899 m!151769))

(assert (=> b!129899 m!152639))

(assert (=> b!129899 m!152639))

(assert (=> b!129899 m!152641))

(assert (=> d!39271 d!39373))

(assert (=> d!39271 d!39327))

(assert (=> d!39271 d!39215))

(declare-fun d!39375 () Bool)

(assert (=> d!39375 (= (arrayCountValidKeys!0 lt!67323 (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (bvadd (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!67534 () Unit!4039)

(declare-fun choose!2 (array!4739 (_ BitVec 32)) Unit!4039)

(assert (=> d!39375 (= lt!67534 (choose!2 lt!67323 (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))))))

(declare-fun e!84770 () Bool)

(assert (=> d!39375 e!84770))

(declare-fun res!62680 () Bool)

(assert (=> d!39375 (=> (not res!62680) (not e!84770))))

(assert (=> d!39375 (= res!62680 (and (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (size!2509 lt!67323))))))

(assert (=> d!39375 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!67323 (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))) lt!67534)))

(declare-fun b!129904 () Bool)

(declare-fun res!62681 () Bool)

(assert (=> b!129904 (=> (not res!62681) (not e!84770))))

(assert (=> b!129904 (= res!62681 (validKeyInArray!0 (select (arr!2243 lt!67323) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)))))))

(declare-fun b!129905 () Bool)

(assert (=> b!129905 (= e!84770 (bvslt (size!2509 lt!67323) #b01111111111111111111111111111111))))

(assert (= (and d!39375 res!62680) b!129904))

(assert (= (and b!129904 res!62681) b!129905))

(assert (=> d!39375 m!152171))

(declare-fun m!152643 () Bool)

(assert (=> d!39375 m!152643))

(declare-fun m!152645 () Bool)

(assert (=> b!129904 m!152645))

(assert (=> b!129904 m!152645))

(declare-fun m!152647 () Bool)

(assert (=> b!129904 m!152647))

(assert (=> d!39271 d!39375))

(declare-fun d!39377 () Bool)

(declare-fun e!84773 () Bool)

(assert (=> d!39377 e!84773))

(declare-fun res!62684 () Bool)

(assert (=> d!39377 (=> (not res!62684) (not e!84773))))

(assert (=> d!39377 (= res!62684 (and (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (size!2509 (_keys!4565 newMap!16)))))))

(declare-fun lt!67537 () Unit!4039)

(declare-fun choose!41 (array!4739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1709) Unit!4039)

(assert (=> d!39377 (= lt!67537 (choose!41 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) lt!67328 lt!67311))))

(assert (=> d!39377 (bvslt (size!2509 (_keys!4565 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!39377 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) lt!67328 lt!67311) lt!67537)))

(declare-fun b!129908 () Bool)

(assert (=> b!129908 (= e!84773 (arrayNoDuplicates!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) lt!67328 lt!67311))))

(assert (= (and d!39377 res!62684) b!129908))

(assert (=> d!39377 m!151769))

(declare-fun m!152649 () Bool)

(assert (=> d!39377 m!152649))

(assert (=> b!129908 m!152143))

(assert (=> b!129908 m!152141))

(assert (=> d!39271 d!39377))

(declare-fun call!14139 () (_ BitVec 32))

(declare-fun bm!14136 () Bool)

(assert (=> bm!14136 (= call!14139 (arrayCountValidKeys!0 lt!67323 (bvadd (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000001) (bvadd (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000001)))))

(declare-fun b!129909 () Bool)

(declare-fun e!84775 () (_ BitVec 32))

(assert (=> b!129909 (= e!84775 (bvadd #b00000000000000000000000000000001 call!14139))))

(declare-fun d!39379 () Bool)

(declare-fun lt!67538 () (_ BitVec 32))

(assert (=> d!39379 (and (bvsge lt!67538 #b00000000000000000000000000000000) (bvsle lt!67538 (bvsub (size!2509 lt!67323) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)))))))

(declare-fun e!84774 () (_ BitVec 32))

(assert (=> d!39379 (= lt!67538 e!84774)))

(declare-fun c!23905 () Bool)

(assert (=> d!39379 (= c!23905 (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (bvadd (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000001)))))

(assert (=> d!39379 (and (bvsle (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (bvadd (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000001)) (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000001) (size!2509 lt!67323)))))

(assert (=> d!39379 (= (arrayCountValidKeys!0 lt!67323 (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (bvadd (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000001)) lt!67538)))

(declare-fun b!129910 () Bool)

(assert (=> b!129910 (= e!84775 call!14139)))

(declare-fun b!129911 () Bool)

(assert (=> b!129911 (= e!84774 e!84775)))

(declare-fun c!23906 () Bool)

(assert (=> b!129911 (= c!23906 (validKeyInArray!0 (select (arr!2243 lt!67323) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)))))))

(declare-fun b!129912 () Bool)

(assert (=> b!129912 (= e!84774 #b00000000000000000000000000000000)))

(assert (= (and d!39379 c!23905) b!129912))

(assert (= (and d!39379 (not c!23905)) b!129911))

(assert (= (and b!129911 c!23906) b!129909))

(assert (= (and b!129911 (not c!23906)) b!129910))

(assert (= (or b!129909 b!129910) bm!14136))

(declare-fun m!152651 () Bool)

(assert (=> bm!14136 m!152651))

(assert (=> b!129911 m!152645))

(assert (=> b!129911 m!152645))

(assert (=> b!129911 m!152647))

(assert (=> d!39271 d!39379))

(declare-fun b!129913 () Bool)

(declare-fun e!84786 () Bool)

(declare-fun lt!67545 () ListLongMap!1697)

(assert (=> b!129913 (= e!84786 (= (apply!113 lt!67545 (select (arr!2243 lt!67312) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 lt!67316) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 lt!67316)))))

(assert (=> b!129913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 lt!67312)))))

(declare-fun b!129914 () Bool)

(declare-fun e!84778 () Bool)

(declare-fun e!84785 () Bool)

(assert (=> b!129914 (= e!84778 e!84785)))

(declare-fun res!62691 () Bool)

(declare-fun call!14144 () Bool)

(assert (=> b!129914 (= res!62691 call!14144)))

(assert (=> b!129914 (=> (not res!62691) (not e!84785))))

(declare-fun b!129915 () Bool)

(declare-fun e!84787 () Bool)

(declare-fun call!14145 () Bool)

(assert (=> b!129915 (= e!84787 (not call!14145))))

(declare-fun bm!14137 () Bool)

(assert (=> bm!14137 (= call!14145 (contains!889 lt!67545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129916 () Bool)

(declare-fun e!84788 () Unit!4039)

(declare-fun lt!67555 () Unit!4039)

(assert (=> b!129916 (= e!84788 lt!67555)))

(declare-fun lt!67557 () ListLongMap!1697)

(assert (=> b!129916 (= lt!67557 (getCurrentListMapNoExtraKeys!138 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67553 () (_ BitVec 64))

(assert (=> b!129916 (= lt!67553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67546 () (_ BitVec 64))

(assert (=> b!129916 (= lt!67546 (select (arr!2243 lt!67312) #b00000000000000000000000000000000))))

(declare-fun lt!67552 () Unit!4039)

(assert (=> b!129916 (= lt!67552 (addStillContains!89 lt!67557 lt!67553 (zeroValue!2683 newMap!16) lt!67546))))

(assert (=> b!129916 (contains!889 (+!172 lt!67557 (tuple2!2609 lt!67553 (zeroValue!2683 newMap!16))) lt!67546)))

(declare-fun lt!67559 () Unit!4039)

(assert (=> b!129916 (= lt!67559 lt!67552)))

(declare-fun lt!67547 () ListLongMap!1697)

(assert (=> b!129916 (= lt!67547 (getCurrentListMapNoExtraKeys!138 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67550 () (_ BitVec 64))

(assert (=> b!129916 (= lt!67550 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67541 () (_ BitVec 64))

(assert (=> b!129916 (= lt!67541 (select (arr!2243 lt!67312) #b00000000000000000000000000000000))))

(declare-fun lt!67556 () Unit!4039)

(assert (=> b!129916 (= lt!67556 (addApplyDifferent!89 lt!67547 lt!67550 (minValue!2683 newMap!16) lt!67541))))

(assert (=> b!129916 (= (apply!113 (+!172 lt!67547 (tuple2!2609 lt!67550 (minValue!2683 newMap!16))) lt!67541) (apply!113 lt!67547 lt!67541))))

(declare-fun lt!67554 () Unit!4039)

(assert (=> b!129916 (= lt!67554 lt!67556)))

(declare-fun lt!67539 () ListLongMap!1697)

(assert (=> b!129916 (= lt!67539 (getCurrentListMapNoExtraKeys!138 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67542 () (_ BitVec 64))

(assert (=> b!129916 (= lt!67542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67543 () (_ BitVec 64))

(assert (=> b!129916 (= lt!67543 (select (arr!2243 lt!67312) #b00000000000000000000000000000000))))

(declare-fun lt!67540 () Unit!4039)

(assert (=> b!129916 (= lt!67540 (addApplyDifferent!89 lt!67539 lt!67542 (zeroValue!2683 newMap!16) lt!67543))))

(assert (=> b!129916 (= (apply!113 (+!172 lt!67539 (tuple2!2609 lt!67542 (zeroValue!2683 newMap!16))) lt!67543) (apply!113 lt!67539 lt!67543))))

(declare-fun lt!67551 () Unit!4039)

(assert (=> b!129916 (= lt!67551 lt!67540)))

(declare-fun lt!67549 () ListLongMap!1697)

(assert (=> b!129916 (= lt!67549 (getCurrentListMapNoExtraKeys!138 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67558 () (_ BitVec 64))

(assert (=> b!129916 (= lt!67558 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67544 () (_ BitVec 64))

(assert (=> b!129916 (= lt!67544 (select (arr!2243 lt!67312) #b00000000000000000000000000000000))))

(assert (=> b!129916 (= lt!67555 (addApplyDifferent!89 lt!67549 lt!67558 (minValue!2683 newMap!16) lt!67544))))

(assert (=> b!129916 (= (apply!113 (+!172 lt!67549 (tuple2!2609 lt!67558 (minValue!2683 newMap!16))) lt!67544) (apply!113 lt!67549 lt!67544))))

(declare-fun b!129917 () Bool)

(declare-fun res!62693 () Bool)

(declare-fun e!84779 () Bool)

(assert (=> b!129917 (=> (not res!62693) (not e!84779))))

(assert (=> b!129917 (= res!62693 e!84787)))

(declare-fun c!23908 () Bool)

(assert (=> b!129917 (= c!23908 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129918 () Bool)

(declare-fun e!84776 () ListLongMap!1697)

(declare-fun call!14143 () ListLongMap!1697)

(assert (=> b!129918 (= e!84776 call!14143)))

(declare-fun b!129919 () Bool)

(declare-fun res!62692 () Bool)

(assert (=> b!129919 (=> (not res!62692) (not e!84779))))

(declare-fun e!84780 () Bool)

(assert (=> b!129919 (= res!62692 e!84780)))

(declare-fun res!62688 () Bool)

(assert (=> b!129919 (=> res!62688 e!84780)))

(declare-fun e!84777 () Bool)

(assert (=> b!129919 (= res!62688 (not e!84777))))

(declare-fun res!62686 () Bool)

(assert (=> b!129919 (=> (not res!62686) (not e!84777))))

(assert (=> b!129919 (= res!62686 (bvslt #b00000000000000000000000000000000 (size!2509 lt!67312)))))

(declare-fun bm!14138 () Bool)

(declare-fun call!14141 () ListLongMap!1697)

(declare-fun call!14140 () ListLongMap!1697)

(assert (=> bm!14138 (= call!14141 call!14140)))

(declare-fun d!39381 () Bool)

(assert (=> d!39381 e!84779))

(declare-fun res!62689 () Bool)

(assert (=> d!39381 (=> (not res!62689) (not e!84779))))

(assert (=> d!39381 (= res!62689 (or (bvsge #b00000000000000000000000000000000 (size!2509 lt!67312)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 lt!67312)))))))

(declare-fun lt!67560 () ListLongMap!1697)

(assert (=> d!39381 (= lt!67545 lt!67560)))

(declare-fun lt!67548 () Unit!4039)

(assert (=> d!39381 (= lt!67548 e!84788)))

(declare-fun c!23909 () Bool)

(declare-fun e!84783 () Bool)

(assert (=> d!39381 (= c!23909 e!84783)))

(declare-fun res!62690 () Bool)

(assert (=> d!39381 (=> (not res!62690) (not e!84783))))

(assert (=> d!39381 (= res!62690 (bvslt #b00000000000000000000000000000000 (size!2509 lt!67312)))))

(declare-fun e!84781 () ListLongMap!1697)

(assert (=> d!39381 (= lt!67560 e!84781)))

(declare-fun c!23910 () Bool)

(assert (=> d!39381 (= c!23910 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39381 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39381 (= (getCurrentListMap!541 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67545)))

(declare-fun b!129920 () Bool)

(assert (=> b!129920 (= e!84783 (validKeyInArray!0 (select (arr!2243 lt!67312) #b00000000000000000000000000000000)))))

(declare-fun b!129921 () Bool)

(declare-fun e!84784 () ListLongMap!1697)

(declare-fun call!14146 () ListLongMap!1697)

(assert (=> b!129921 (= e!84784 call!14146)))

(declare-fun bm!14139 () Bool)

(assert (=> bm!14139 (= call!14144 (contains!889 lt!67545 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129922 () Bool)

(assert (=> b!129922 (= e!84780 e!84786)))

(declare-fun res!62687 () Bool)

(assert (=> b!129922 (=> (not res!62687) (not e!84786))))

(assert (=> b!129922 (= res!62687 (contains!889 lt!67545 (select (arr!2243 lt!67312) #b00000000000000000000000000000000)))))

(assert (=> b!129922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 lt!67312)))))

(declare-fun b!129923 () Bool)

(declare-fun c!23912 () Bool)

(assert (=> b!129923 (= c!23912 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129923 (= e!84784 e!84776)))

(declare-fun b!129924 () Bool)

(assert (=> b!129924 (= e!84779 e!84778)))

(declare-fun c!23907 () Bool)

(assert (=> b!129924 (= c!23907 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129925 () Bool)

(declare-fun Unit!4062 () Unit!4039)

(assert (=> b!129925 (= e!84788 Unit!4062)))

(declare-fun bm!14140 () Bool)

(assert (=> bm!14140 (= call!14140 (getCurrentListMapNoExtraKeys!138 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!129926 () Bool)

(assert (=> b!129926 (= e!84781 e!84784)))

(declare-fun c!23911 () Bool)

(assert (=> b!129926 (= c!23911 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!14142 () ListLongMap!1697)

(declare-fun bm!14141 () Bool)

(assert (=> bm!14141 (= call!14142 (+!172 (ite c!23910 call!14140 (ite c!23911 call!14141 call!14143)) (ite (or c!23910 c!23911) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun b!129927 () Bool)

(assert (=> b!129927 (= e!84777 (validKeyInArray!0 (select (arr!2243 lt!67312) #b00000000000000000000000000000000)))))

(declare-fun b!129928 () Bool)

(assert (=> b!129928 (= e!84785 (= (apply!113 lt!67545 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 newMap!16)))))

(declare-fun b!129929 () Bool)

(declare-fun e!84782 () Bool)

(assert (=> b!129929 (= e!84787 e!84782)))

(declare-fun res!62685 () Bool)

(assert (=> b!129929 (= res!62685 call!14145)))

(assert (=> b!129929 (=> (not res!62685) (not e!84782))))

(declare-fun bm!14142 () Bool)

(assert (=> bm!14142 (= call!14143 call!14141)))

(declare-fun bm!14143 () Bool)

(assert (=> bm!14143 (= call!14146 call!14142)))

(declare-fun b!129930 () Bool)

(assert (=> b!129930 (= e!84776 call!14146)))

(declare-fun b!129931 () Bool)

(assert (=> b!129931 (= e!84782 (= (apply!113 lt!67545 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 newMap!16)))))

(declare-fun b!129932 () Bool)

(assert (=> b!129932 (= e!84781 (+!172 call!14142 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(declare-fun b!129933 () Bool)

(assert (=> b!129933 (= e!84778 (not call!14144))))

(assert (= (and d!39381 c!23910) b!129932))

(assert (= (and d!39381 (not c!23910)) b!129926))

(assert (= (and b!129926 c!23911) b!129921))

(assert (= (and b!129926 (not c!23911)) b!129923))

(assert (= (and b!129923 c!23912) b!129930))

(assert (= (and b!129923 (not c!23912)) b!129918))

(assert (= (or b!129930 b!129918) bm!14142))

(assert (= (or b!129921 bm!14142) bm!14138))

(assert (= (or b!129921 b!129930) bm!14143))

(assert (= (or b!129932 bm!14138) bm!14140))

(assert (= (or b!129932 bm!14143) bm!14141))

(assert (= (and d!39381 res!62690) b!129920))

(assert (= (and d!39381 c!23909) b!129916))

(assert (= (and d!39381 (not c!23909)) b!129925))

(assert (= (and d!39381 res!62689) b!129919))

(assert (= (and b!129919 res!62686) b!129927))

(assert (= (and b!129919 (not res!62688)) b!129922))

(assert (= (and b!129922 res!62687) b!129913))

(assert (= (and b!129919 res!62692) b!129917))

(assert (= (and b!129917 c!23908) b!129929))

(assert (= (and b!129917 (not c!23908)) b!129915))

(assert (= (and b!129929 res!62685) b!129931))

(assert (= (or b!129929 b!129915) bm!14137))

(assert (= (and b!129917 res!62693) b!129924))

(assert (= (and b!129924 c!23907) b!129914))

(assert (= (and b!129924 (not c!23907)) b!129933))

(assert (= (and b!129914 res!62691) b!129928))

(assert (= (or b!129914 b!129933) bm!14139))

(declare-fun b_lambda!5771 () Bool)

(assert (=> (not b_lambda!5771) (not b!129913)))

(assert (=> b!129913 t!6114))

(declare-fun b_and!8043 () Bool)

(assert (= b_and!8039 (and (=> t!6114 result!3921) b_and!8043)))

(assert (=> b!129913 t!6116))

(declare-fun b_and!8045 () Bool)

(assert (= b_and!8041 (and (=> t!6116 result!3923) b_and!8045)))

(declare-fun m!152653 () Bool)

(assert (=> bm!14140 m!152653))

(declare-fun m!152655 () Bool)

(assert (=> bm!14139 m!152655))

(declare-fun m!152657 () Bool)

(assert (=> bm!14141 m!152657))

(declare-fun m!152659 () Bool)

(assert (=> b!129913 m!152659))

(assert (=> b!129913 m!152009))

(declare-fun m!152661 () Bool)

(assert (=> b!129913 m!152661))

(declare-fun m!152663 () Bool)

(assert (=> b!129913 m!152663))

(assert (=> b!129913 m!152663))

(declare-fun m!152665 () Bool)

(assert (=> b!129913 m!152665))

(assert (=> b!129913 m!152659))

(assert (=> b!129913 m!152009))

(declare-fun m!152667 () Bool)

(assert (=> b!129931 m!152667))

(assert (=> b!129927 m!152663))

(assert (=> b!129927 m!152663))

(declare-fun m!152669 () Bool)

(assert (=> b!129927 m!152669))

(assert (=> b!129920 m!152663))

(assert (=> b!129920 m!152663))

(assert (=> b!129920 m!152669))

(assert (=> d!39381 m!151983))

(declare-fun m!152671 () Bool)

(assert (=> b!129928 m!152671))

(declare-fun m!152673 () Bool)

(assert (=> b!129932 m!152673))

(declare-fun m!152675 () Bool)

(assert (=> bm!14137 m!152675))

(assert (=> b!129922 m!152663))

(assert (=> b!129922 m!152663))

(declare-fun m!152677 () Bool)

(assert (=> b!129922 m!152677))

(declare-fun m!152679 () Bool)

(assert (=> b!129916 m!152679))

(declare-fun m!152681 () Bool)

(assert (=> b!129916 m!152681))

(declare-fun m!152683 () Bool)

(assert (=> b!129916 m!152683))

(declare-fun m!152685 () Bool)

(assert (=> b!129916 m!152685))

(assert (=> b!129916 m!152653))

(declare-fun m!152687 () Bool)

(assert (=> b!129916 m!152687))

(declare-fun m!152689 () Bool)

(assert (=> b!129916 m!152689))

(declare-fun m!152691 () Bool)

(assert (=> b!129916 m!152691))

(declare-fun m!152693 () Bool)

(assert (=> b!129916 m!152693))

(declare-fun m!152695 () Bool)

(assert (=> b!129916 m!152695))

(assert (=> b!129916 m!152663))

(declare-fun m!152697 () Bool)

(assert (=> b!129916 m!152697))

(declare-fun m!152699 () Bool)

(assert (=> b!129916 m!152699))

(declare-fun m!152701 () Bool)

(assert (=> b!129916 m!152701))

(assert (=> b!129916 m!152687))

(declare-fun m!152703 () Bool)

(assert (=> b!129916 m!152703))

(declare-fun m!152705 () Bool)

(assert (=> b!129916 m!152705))

(assert (=> b!129916 m!152693))

(assert (=> b!129916 m!152699))

(assert (=> b!129916 m!152681))

(declare-fun m!152707 () Bool)

(assert (=> b!129916 m!152707))

(assert (=> d!39271 d!39381))

(declare-fun d!39383 () Bool)

(declare-fun e!84789 () Bool)

(assert (=> d!39383 e!84789))

(declare-fun res!62694 () Bool)

(assert (=> d!39383 (=> (not res!62694) (not e!84789))))

(assert (=> d!39383 (= res!62694 (and (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (size!2509 lt!67312))))))

(declare-fun lt!67561 () Unit!4039)

(assert (=> d!39383 (= lt!67561 (choose!793 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (defaultEntry!2824 newMap!16)))))

(assert (=> d!39383 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39383 (= (lemmaValidKeyInArrayIsInListMap!119 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (defaultEntry!2824 newMap!16)) lt!67561)))

(declare-fun b!129934 () Bool)

(assert (=> b!129934 (= e!84789 (contains!889 (getCurrentListMap!541 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (arr!2243 lt!67312) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)))))))

(assert (= (and d!39383 res!62694) b!129934))

(declare-fun m!152709 () Bool)

(assert (=> d!39383 m!152709))

(assert (=> d!39383 m!151983))

(assert (=> b!129934 m!152149))

(declare-fun m!152711 () Bool)

(assert (=> b!129934 m!152711))

(assert (=> b!129934 m!152149))

(assert (=> b!129934 m!152711))

(declare-fun m!152713 () Bool)

(assert (=> b!129934 m!152713))

(assert (=> d!39271 d!39383))

(declare-fun d!39385 () Bool)

(declare-fun res!62695 () Bool)

(declare-fun e!84790 () Bool)

(assert (=> d!39385 (=> res!62695 e!84790)))

(assert (=> d!39385 (= res!62695 (= (select (arr!2243 lt!67315) #b00000000000000000000000000000000) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39385 (= (arrayContainsKey!0 lt!67315 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000) e!84790)))

(declare-fun b!129935 () Bool)

(declare-fun e!84791 () Bool)

(assert (=> b!129935 (= e!84790 e!84791)))

(declare-fun res!62696 () Bool)

(assert (=> b!129935 (=> (not res!62696) (not e!84791))))

(assert (=> b!129935 (= res!62696 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 lt!67315)))))

(declare-fun b!129936 () Bool)

(assert (=> b!129936 (= e!84791 (arrayContainsKey!0 lt!67315 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39385 (not res!62695)) b!129935))

(assert (= (and b!129935 res!62696) b!129936))

(declare-fun m!152715 () Bool)

(assert (=> d!39385 m!152715))

(assert (=> b!129936 m!151769))

(declare-fun m!152717 () Bool)

(assert (=> b!129936 m!152717))

(assert (=> d!39271 d!39385))

(declare-fun d!39387 () Bool)

(declare-fun e!84792 () Bool)

(assert (=> d!39387 e!84792))

(declare-fun res!62697 () Bool)

(assert (=> d!39387 (=> res!62697 e!84792)))

(declare-fun lt!67565 () Bool)

(assert (=> d!39387 (= res!62697 (not lt!67565))))

(declare-fun lt!67564 () Bool)

(assert (=> d!39387 (= lt!67565 lt!67564)))

(declare-fun lt!67563 () Unit!4039)

(declare-fun e!84793 () Unit!4039)

(assert (=> d!39387 (= lt!67563 e!84793)))

(declare-fun c!23913 () Bool)

(assert (=> d!39387 (= c!23913 lt!67564)))

(assert (=> d!39387 (= lt!67564 (containsKey!173 (toList!864 (getCurrentListMap!541 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)))))))

(assert (=> d!39387 (= (contains!889 (getCurrentListMap!541 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)))) lt!67565)))

(declare-fun b!129937 () Bool)

(declare-fun lt!67562 () Unit!4039)

(assert (=> b!129937 (= e!84793 lt!67562)))

(assert (=> b!129937 (= lt!67562 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (getCurrentListMap!541 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)))))))

(assert (=> b!129937 (isDefined!122 (getValueByKey!169 (toList!864 (getCurrentListMap!541 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)))))))

(declare-fun b!129938 () Bool)

(declare-fun Unit!4063 () Unit!4039)

(assert (=> b!129938 (= e!84793 Unit!4063)))

(declare-fun b!129939 () Bool)

(assert (=> b!129939 (= e!84792 (isDefined!122 (getValueByKey!169 (toList!864 (getCurrentListMap!541 lt!67312 lt!67316 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (select (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))))))))

(assert (= (and d!39387 c!23913) b!129937))

(assert (= (and d!39387 (not c!23913)) b!129938))

(assert (= (and d!39387 (not res!62697)) b!129939))

(assert (=> d!39387 m!152161))

(declare-fun m!152719 () Bool)

(assert (=> d!39387 m!152719))

(assert (=> b!129937 m!152161))

(declare-fun m!152721 () Bool)

(assert (=> b!129937 m!152721))

(assert (=> b!129937 m!152161))

(declare-fun m!152723 () Bool)

(assert (=> b!129937 m!152723))

(assert (=> b!129937 m!152723))

(declare-fun m!152725 () Bool)

(assert (=> b!129937 m!152725))

(assert (=> b!129939 m!152161))

(assert (=> b!129939 m!152723))

(assert (=> b!129939 m!152723))

(assert (=> b!129939 m!152725))

(assert (=> d!39271 d!39387))

(declare-fun lt!67572 () ListLongMap!1697)

(declare-fun e!84804 () Bool)

(declare-fun b!129940 () Bool)

(assert (=> b!129940 (= e!84804 (= (apply!113 lt!67572 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))))))

(assert (=> b!129940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun b!129941 () Bool)

(declare-fun e!84796 () Bool)

(declare-fun e!84803 () Bool)

(assert (=> b!129941 (= e!84796 e!84803)))

(declare-fun res!62704 () Bool)

(declare-fun call!14151 () Bool)

(assert (=> b!129941 (= res!62704 call!14151)))

(assert (=> b!129941 (=> (not res!62704) (not e!84803))))

(declare-fun b!129942 () Bool)

(declare-fun e!84805 () Bool)

(declare-fun call!14152 () Bool)

(assert (=> b!129942 (= e!84805 (not call!14152))))

(declare-fun bm!14144 () Bool)

(assert (=> bm!14144 (= call!14152 (contains!889 lt!67572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129943 () Bool)

(declare-fun e!84806 () Unit!4039)

(declare-fun lt!67582 () Unit!4039)

(assert (=> b!129943 (= e!84806 lt!67582)))

(declare-fun lt!67584 () ListLongMap!1697)

(assert (=> b!129943 (= lt!67584 (getCurrentListMapNoExtraKeys!138 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67580 () (_ BitVec 64))

(assert (=> b!129943 (= lt!67580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67573 () (_ BitVec 64))

(assert (=> b!129943 (= lt!67573 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!67579 () Unit!4039)

(assert (=> b!129943 (= lt!67579 (addStillContains!89 lt!67584 lt!67580 (zeroValue!2683 newMap!16) lt!67573))))

(assert (=> b!129943 (contains!889 (+!172 lt!67584 (tuple2!2609 lt!67580 (zeroValue!2683 newMap!16))) lt!67573)))

(declare-fun lt!67586 () Unit!4039)

(assert (=> b!129943 (= lt!67586 lt!67579)))

(declare-fun lt!67574 () ListLongMap!1697)

(assert (=> b!129943 (= lt!67574 (getCurrentListMapNoExtraKeys!138 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67577 () (_ BitVec 64))

(assert (=> b!129943 (= lt!67577 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67568 () (_ BitVec 64))

(assert (=> b!129943 (= lt!67568 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!67583 () Unit!4039)

(assert (=> b!129943 (= lt!67583 (addApplyDifferent!89 lt!67574 lt!67577 (minValue!2683 newMap!16) lt!67568))))

(assert (=> b!129943 (= (apply!113 (+!172 lt!67574 (tuple2!2609 lt!67577 (minValue!2683 newMap!16))) lt!67568) (apply!113 lt!67574 lt!67568))))

(declare-fun lt!67581 () Unit!4039)

(assert (=> b!129943 (= lt!67581 lt!67583)))

(declare-fun lt!67566 () ListLongMap!1697)

(assert (=> b!129943 (= lt!67566 (getCurrentListMapNoExtraKeys!138 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67569 () (_ BitVec 64))

(assert (=> b!129943 (= lt!67569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67570 () (_ BitVec 64))

(assert (=> b!129943 (= lt!67570 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!67567 () Unit!4039)

(assert (=> b!129943 (= lt!67567 (addApplyDifferent!89 lt!67566 lt!67569 (zeroValue!2683 newMap!16) lt!67570))))

(assert (=> b!129943 (= (apply!113 (+!172 lt!67566 (tuple2!2609 lt!67569 (zeroValue!2683 newMap!16))) lt!67570) (apply!113 lt!67566 lt!67570))))

(declare-fun lt!67578 () Unit!4039)

(assert (=> b!129943 (= lt!67578 lt!67567)))

(declare-fun lt!67576 () ListLongMap!1697)

(assert (=> b!129943 (= lt!67576 (getCurrentListMapNoExtraKeys!138 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67585 () (_ BitVec 64))

(assert (=> b!129943 (= lt!67585 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67571 () (_ BitVec 64))

(assert (=> b!129943 (= lt!67571 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!129943 (= lt!67582 (addApplyDifferent!89 lt!67576 lt!67585 (minValue!2683 newMap!16) lt!67571))))

(assert (=> b!129943 (= (apply!113 (+!172 lt!67576 (tuple2!2609 lt!67585 (minValue!2683 newMap!16))) lt!67571) (apply!113 lt!67576 lt!67571))))

(declare-fun b!129944 () Bool)

(declare-fun res!62706 () Bool)

(declare-fun e!84797 () Bool)

(assert (=> b!129944 (=> (not res!62706) (not e!84797))))

(assert (=> b!129944 (= res!62706 e!84805)))

(declare-fun c!23915 () Bool)

(assert (=> b!129944 (= c!23915 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129945 () Bool)

(declare-fun e!84794 () ListLongMap!1697)

(declare-fun call!14150 () ListLongMap!1697)

(assert (=> b!129945 (= e!84794 call!14150)))

(declare-fun b!129946 () Bool)

(declare-fun res!62705 () Bool)

(assert (=> b!129946 (=> (not res!62705) (not e!84797))))

(declare-fun e!84798 () Bool)

(assert (=> b!129946 (= res!62705 e!84798)))

(declare-fun res!62701 () Bool)

(assert (=> b!129946 (=> res!62701 e!84798)))

(declare-fun e!84795 () Bool)

(assert (=> b!129946 (= res!62701 (not e!84795))))

(declare-fun res!62699 () Bool)

(assert (=> b!129946 (=> (not res!62699) (not e!84795))))

(assert (=> b!129946 (= res!62699 (bvslt #b00000000000000000000000000000000 (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun bm!14145 () Bool)

(declare-fun call!14148 () ListLongMap!1697)

(declare-fun call!14147 () ListLongMap!1697)

(assert (=> bm!14145 (= call!14148 call!14147)))

(declare-fun d!39389 () Bool)

(assert (=> d!39389 e!84797))

(declare-fun res!62702 () Bool)

(assert (=> d!39389 (=> (not res!62702) (not e!84797))))

(assert (=> d!39389 (= res!62702 (or (bvsge #b00000000000000000000000000000000 (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))))))

(declare-fun lt!67587 () ListLongMap!1697)

(assert (=> d!39389 (= lt!67572 lt!67587)))

(declare-fun lt!67575 () Unit!4039)

(assert (=> d!39389 (= lt!67575 e!84806)))

(declare-fun c!23916 () Bool)

(declare-fun e!84801 () Bool)

(assert (=> d!39389 (= c!23916 e!84801)))

(declare-fun res!62703 () Bool)

(assert (=> d!39389 (=> (not res!62703) (not e!84801))))

(assert (=> d!39389 (= res!62703 (bvslt #b00000000000000000000000000000000 (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun e!84799 () ListLongMap!1697)

(assert (=> d!39389 (= lt!67587 e!84799)))

(declare-fun c!23917 () Bool)

(assert (=> d!39389 (= c!23917 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39389 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39389 (= (getCurrentListMap!541 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67572)))

(declare-fun b!129947 () Bool)

(assert (=> b!129947 (= e!84801 (validKeyInArray!0 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!129948 () Bool)

(declare-fun e!84802 () ListLongMap!1697)

(declare-fun call!14153 () ListLongMap!1697)

(assert (=> b!129948 (= e!84802 call!14153)))

(declare-fun bm!14146 () Bool)

(assert (=> bm!14146 (= call!14151 (contains!889 lt!67572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129949 () Bool)

(assert (=> b!129949 (= e!84798 e!84804)))

(declare-fun res!62700 () Bool)

(assert (=> b!129949 (=> (not res!62700) (not e!84804))))

(assert (=> b!129949 (= res!62700 (contains!889 lt!67572 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!129949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun b!129950 () Bool)

(declare-fun c!23919 () Bool)

(assert (=> b!129950 (= c!23919 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129950 (= e!84802 e!84794)))

(declare-fun b!129951 () Bool)

(assert (=> b!129951 (= e!84797 e!84796)))

(declare-fun c!23914 () Bool)

(assert (=> b!129951 (= c!23914 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129952 () Bool)

(declare-fun Unit!4064 () Unit!4039)

(assert (=> b!129952 (= e!84806 Unit!4064)))

(declare-fun bm!14147 () Bool)

(assert (=> bm!14147 (= call!14147 (getCurrentListMapNoExtraKeys!138 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!129953 () Bool)

(assert (=> b!129953 (= e!84799 e!84802)))

(declare-fun c!23918 () Bool)

(assert (=> b!129953 (= c!23918 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14148 () Bool)

(declare-fun call!14149 () ListLongMap!1697)

(assert (=> bm!14148 (= call!14149 (+!172 (ite c!23917 call!14147 (ite c!23918 call!14148 call!14150)) (ite (or c!23917 c!23918) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun b!129954 () Bool)

(assert (=> b!129954 (= e!84795 (validKeyInArray!0 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!129955 () Bool)

(assert (=> b!129955 (= e!84803 (= (apply!113 lt!67572 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 newMap!16)))))

(declare-fun b!129956 () Bool)

(declare-fun e!84800 () Bool)

(assert (=> b!129956 (= e!84805 e!84800)))

(declare-fun res!62698 () Bool)

(assert (=> b!129956 (= res!62698 call!14152)))

(assert (=> b!129956 (=> (not res!62698) (not e!84800))))

(declare-fun bm!14149 () Bool)

(assert (=> bm!14149 (= call!14150 call!14148)))

(declare-fun bm!14150 () Bool)

(assert (=> bm!14150 (= call!14153 call!14149)))

(declare-fun b!129957 () Bool)

(assert (=> b!129957 (= e!84794 call!14153)))

(declare-fun b!129958 () Bool)

(assert (=> b!129958 (= e!84800 (= (apply!113 lt!67572 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 newMap!16)))))

(declare-fun b!129959 () Bool)

(assert (=> b!129959 (= e!84799 (+!172 call!14149 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(declare-fun b!129960 () Bool)

(assert (=> b!129960 (= e!84796 (not call!14151))))

(assert (= (and d!39389 c!23917) b!129959))

(assert (= (and d!39389 (not c!23917)) b!129953))

(assert (= (and b!129953 c!23918) b!129948))

(assert (= (and b!129953 (not c!23918)) b!129950))

(assert (= (and b!129950 c!23919) b!129957))

(assert (= (and b!129950 (not c!23919)) b!129945))

(assert (= (or b!129957 b!129945) bm!14149))

(assert (= (or b!129948 bm!14149) bm!14145))

(assert (= (or b!129948 b!129957) bm!14150))

(assert (= (or b!129959 bm!14145) bm!14147))

(assert (= (or b!129959 bm!14150) bm!14148))

(assert (= (and d!39389 res!62703) b!129947))

(assert (= (and d!39389 c!23916) b!129943))

(assert (= (and d!39389 (not c!23916)) b!129952))

(assert (= (and d!39389 res!62702) b!129946))

(assert (= (and b!129946 res!62699) b!129954))

(assert (= (and b!129946 (not res!62701)) b!129949))

(assert (= (and b!129949 res!62700) b!129940))

(assert (= (and b!129946 res!62705) b!129944))

(assert (= (and b!129944 c!23915) b!129956))

(assert (= (and b!129944 (not c!23915)) b!129942))

(assert (= (and b!129956 res!62698) b!129958))

(assert (= (or b!129956 b!129942) bm!14144))

(assert (= (and b!129944 res!62706) b!129951))

(assert (= (and b!129951 c!23914) b!129941))

(assert (= (and b!129951 (not c!23914)) b!129960))

(assert (= (and b!129941 res!62704) b!129955))

(assert (= (or b!129941 b!129960) bm!14146))

(declare-fun b_lambda!5773 () Bool)

(assert (=> (not b_lambda!5773) (not b!129940)))

(assert (=> b!129940 t!6114))

(declare-fun b_and!8047 () Bool)

(assert (= b_and!8043 (and (=> t!6114 result!3921) b_and!8047)))

(assert (=> b!129940 t!6116))

(declare-fun b_and!8049 () Bool)

(assert (= b_and!8045 (and (=> t!6116 result!3923) b_and!8049)))

(declare-fun m!152727 () Bool)

(assert (=> bm!14147 m!152727))

(declare-fun m!152729 () Bool)

(assert (=> bm!14146 m!152729))

(declare-fun m!152731 () Bool)

(assert (=> bm!14148 m!152731))

(declare-fun m!152733 () Bool)

(assert (=> b!129940 m!152733))

(assert (=> b!129940 m!152009))

(declare-fun m!152735 () Bool)

(assert (=> b!129940 m!152735))

(declare-fun m!152737 () Bool)

(assert (=> b!129940 m!152737))

(assert (=> b!129940 m!152737))

(declare-fun m!152739 () Bool)

(assert (=> b!129940 m!152739))

(assert (=> b!129940 m!152733))

(assert (=> b!129940 m!152009))

(declare-fun m!152741 () Bool)

(assert (=> b!129958 m!152741))

(assert (=> b!129954 m!152737))

(assert (=> b!129954 m!152737))

(declare-fun m!152743 () Bool)

(assert (=> b!129954 m!152743))

(assert (=> b!129947 m!152737))

(assert (=> b!129947 m!152737))

(assert (=> b!129947 m!152743))

(assert (=> d!39389 m!151983))

(declare-fun m!152745 () Bool)

(assert (=> b!129955 m!152745))

(declare-fun m!152747 () Bool)

(assert (=> b!129959 m!152747))

(declare-fun m!152749 () Bool)

(assert (=> bm!14144 m!152749))

(assert (=> b!129949 m!152737))

(assert (=> b!129949 m!152737))

(declare-fun m!152751 () Bool)

(assert (=> b!129949 m!152751))

(declare-fun m!152753 () Bool)

(assert (=> b!129943 m!152753))

(declare-fun m!152755 () Bool)

(assert (=> b!129943 m!152755))

(declare-fun m!152757 () Bool)

(assert (=> b!129943 m!152757))

(declare-fun m!152759 () Bool)

(assert (=> b!129943 m!152759))

(assert (=> b!129943 m!152727))

(declare-fun m!152761 () Bool)

(assert (=> b!129943 m!152761))

(declare-fun m!152763 () Bool)

(assert (=> b!129943 m!152763))

(declare-fun m!152765 () Bool)

(assert (=> b!129943 m!152765))

(declare-fun m!152767 () Bool)

(assert (=> b!129943 m!152767))

(declare-fun m!152769 () Bool)

(assert (=> b!129943 m!152769))

(assert (=> b!129943 m!152737))

(declare-fun m!152771 () Bool)

(assert (=> b!129943 m!152771))

(declare-fun m!152773 () Bool)

(assert (=> b!129943 m!152773))

(declare-fun m!152775 () Bool)

(assert (=> b!129943 m!152775))

(assert (=> b!129943 m!152761))

(declare-fun m!152777 () Bool)

(assert (=> b!129943 m!152777))

(declare-fun m!152779 () Bool)

(assert (=> b!129943 m!152779))

(assert (=> b!129943 m!152767))

(assert (=> b!129943 m!152773))

(assert (=> b!129943 m!152755))

(declare-fun m!152781 () Bool)

(assert (=> b!129943 m!152781))

(assert (=> d!39271 d!39389))

(assert (=> d!39271 d!39347))

(declare-fun call!14154 () (_ BitVec 32))

(declare-fun bm!14151 () Bool)

(assert (=> bm!14151 (= call!14154 (arrayCountValidKeys!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!129961 () Bool)

(declare-fun e!84808 () (_ BitVec 32))

(assert (=> b!129961 (= e!84808 (bvadd #b00000000000000000000000000000001 call!14154))))

(declare-fun lt!67588 () (_ BitVec 32))

(declare-fun d!39391 () Bool)

(assert (=> d!39391 (and (bvsge lt!67588 #b00000000000000000000000000000000) (bvsle lt!67588 (bvsub (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun e!84807 () (_ BitVec 32))

(assert (=> d!39391 (= lt!67588 e!84807)))

(declare-fun c!23920 () Bool)

(assert (=> d!39391 (= c!23920 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39391 (and (bvsle #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2509 (_keys!4565 newMap!16)) (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))))

(assert (=> d!39391 (= (arrayCountValidKeys!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) lt!67588)))

(declare-fun b!129962 () Bool)

(assert (=> b!129962 (= e!84808 call!14154)))

(declare-fun b!129963 () Bool)

(assert (=> b!129963 (= e!84807 e!84808)))

(declare-fun c!23921 () Bool)

(assert (=> b!129963 (= c!23921 (validKeyInArray!0 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!129964 () Bool)

(assert (=> b!129964 (= e!84807 #b00000000000000000000000000000000)))

(assert (= (and d!39391 c!23920) b!129964))

(assert (= (and d!39391 (not c!23920)) b!129963))

(assert (= (and b!129963 c!23921) b!129961))

(assert (= (and b!129963 (not c!23921)) b!129962))

(assert (= (or b!129961 b!129962) bm!14151))

(declare-fun m!152783 () Bool)

(assert (=> bm!14151 m!152783))

(assert (=> b!129963 m!152737))

(assert (=> b!129963 m!152737))

(assert (=> b!129963 m!152743))

(assert (=> d!39271 d!39391))

(declare-fun b!129965 () Bool)

(declare-fun e!84809 () Bool)

(declare-fun e!84810 () Bool)

(assert (=> b!129965 (= e!84809 e!84810)))

(declare-fun c!23922 () Bool)

(assert (=> b!129965 (= c!23922 (validKeyInArray!0 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!39393 () Bool)

(declare-fun res!62707 () Bool)

(assert (=> d!39393 (=> res!62707 e!84809)))

(assert (=> d!39393 (= res!62707 (bvsge #b00000000000000000000000000000000 (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))))

(assert (=> d!39393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (mask!7102 newMap!16)) e!84809)))

(declare-fun b!129966 () Bool)

(declare-fun e!84811 () Bool)

(declare-fun call!14155 () Bool)

(assert (=> b!129966 (= e!84811 call!14155)))

(declare-fun bm!14152 () Bool)

(assert (=> bm!14152 (= call!14155 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (mask!7102 newMap!16)))))

(declare-fun b!129967 () Bool)

(assert (=> b!129967 (= e!84810 e!84811)))

(declare-fun lt!67589 () (_ BitVec 64))

(assert (=> b!129967 (= lt!67589 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!67590 () Unit!4039)

(assert (=> b!129967 (= lt!67590 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) lt!67589 #b00000000000000000000000000000000))))

(assert (=> b!129967 (arrayContainsKey!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) lt!67589 #b00000000000000000000000000000000)))

(declare-fun lt!67591 () Unit!4039)

(assert (=> b!129967 (= lt!67591 lt!67590)))

(declare-fun res!62708 () Bool)

(assert (=> b!129967 (= res!62708 (= (seekEntryOrOpen!0 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) #b00000000000000000000000000000000) (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (mask!7102 newMap!16)) (Found!272 #b00000000000000000000000000000000)))))

(assert (=> b!129967 (=> (not res!62708) (not e!84811))))

(declare-fun b!129968 () Bool)

(assert (=> b!129968 (= e!84810 call!14155)))

(assert (= (and d!39393 (not res!62707)) b!129965))

(assert (= (and b!129965 c!23922) b!129967))

(assert (= (and b!129965 (not c!23922)) b!129968))

(assert (= (and b!129967 res!62708) b!129966))

(assert (= (or b!129966 b!129968) bm!14152))

(assert (=> b!129965 m!152737))

(assert (=> b!129965 m!152737))

(assert (=> b!129965 m!152743))

(declare-fun m!152785 () Bool)

(assert (=> bm!14152 m!152785))

(assert (=> b!129967 m!152737))

(declare-fun m!152787 () Bool)

(assert (=> b!129967 m!152787))

(declare-fun m!152789 () Bool)

(assert (=> b!129967 m!152789))

(assert (=> b!129967 m!152737))

(declare-fun m!152791 () Bool)

(assert (=> b!129967 m!152791))

(assert (=> d!39271 d!39393))

(assert (=> d!39271 d!39325))

(declare-fun e!84814 () Bool)

(declare-fun b!129969 () Bool)

(assert (=> b!129969 (= e!84814 (contains!891 lt!67311 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) lt!67328)))))

(declare-fun b!129970 () Bool)

(declare-fun e!84813 () Bool)

(declare-fun e!84812 () Bool)

(assert (=> b!129970 (= e!84813 e!84812)))

(declare-fun c!23923 () Bool)

(assert (=> b!129970 (= c!23923 (validKeyInArray!0 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) lt!67328)))))

(declare-fun d!39395 () Bool)

(declare-fun res!62711 () Bool)

(declare-fun e!84815 () Bool)

(assert (=> d!39395 (=> res!62711 e!84815)))

(assert (=> d!39395 (= res!62711 (bvsge lt!67328 (size!2509 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))))))))

(assert (=> d!39395 (= (arrayNoDuplicates!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) lt!67328 lt!67311) e!84815)))

(declare-fun b!129971 () Bool)

(declare-fun call!14156 () Bool)

(assert (=> b!129971 (= e!84812 call!14156)))

(declare-fun b!129972 () Bool)

(assert (=> b!129972 (= e!84815 e!84813)))

(declare-fun res!62710 () Bool)

(assert (=> b!129972 (=> (not res!62710) (not e!84813))))

(assert (=> b!129972 (= res!62710 (not e!84814))))

(declare-fun res!62709 () Bool)

(assert (=> b!129972 (=> (not res!62709) (not e!84814))))

(assert (=> b!129972 (= res!62709 (validKeyInArray!0 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) lt!67328)))))

(declare-fun bm!14153 () Bool)

(assert (=> bm!14153 (= call!14156 (arrayNoDuplicates!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) (bvadd lt!67328 #b00000000000000000000000000000001) (ite c!23923 (Cons!1705 (select (arr!2243 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16)))) lt!67328) lt!67311) lt!67311)))))

(declare-fun b!129973 () Bool)

(assert (=> b!129973 (= e!84812 call!14156)))

(assert (= (and d!39395 (not res!62711)) b!129972))

(assert (= (and b!129972 res!62709) b!129969))

(assert (= (and b!129972 res!62710) b!129970))

(assert (= (and b!129970 c!23923) b!129971))

(assert (= (and b!129970 (not c!23923)) b!129973))

(assert (= (or b!129971 b!129973) bm!14153))

(declare-fun m!152793 () Bool)

(assert (=> b!129969 m!152793))

(assert (=> b!129969 m!152793))

(declare-fun m!152795 () Bool)

(assert (=> b!129969 m!152795))

(assert (=> b!129970 m!152793))

(assert (=> b!129970 m!152793))

(declare-fun m!152797 () Bool)

(assert (=> b!129970 m!152797))

(assert (=> b!129972 m!152793))

(assert (=> b!129972 m!152793))

(assert (=> b!129972 m!152797))

(assert (=> bm!14153 m!152793))

(declare-fun m!152799 () Bool)

(assert (=> bm!14153 m!152799))

(assert (=> d!39271 d!39395))

(declare-fun d!39397 () Bool)

(declare-fun e!84820 () Bool)

(assert (=> d!39397 e!84820))

(declare-fun res!62722 () Bool)

(assert (=> d!39397 (=> (not res!62722) (not e!84820))))

(assert (=> d!39397 (= res!62722 (and (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (size!2509 (_keys!4565 newMap!16)))))))

(declare-fun lt!67594 () Unit!4039)

(declare-fun choose!1 (array!4739 (_ BitVec 32) (_ BitVec 64)) Unit!4039)

(assert (=> d!39397 (= lt!67594 (choose!1 (_keys!4565 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun e!84821 () Bool)

(assert (=> d!39397 e!84821))

(declare-fun res!62720 () Bool)

(assert (=> d!39397 (=> (not res!62720) (not e!84821))))

(assert (=> d!39397 (= res!62720 (and (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000) (bvslt (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (size!2509 (_keys!4565 newMap!16)))))))

(assert (=> d!39397 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4565 newMap!16) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67594)))

(declare-fun b!129985 () Bool)

(assert (=> b!129985 (= e!84820 (= (arrayCountValidKeys!0 (array!4740 (store (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (size!2509 (_keys!4565 newMap!16))) #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4565 newMap!16) #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun b!129983 () Bool)

(declare-fun res!62721 () Bool)

(assert (=> b!129983 (=> (not res!62721) (not e!84821))))

(assert (=> b!129983 (= res!62721 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!129984 () Bool)

(assert (=> b!129984 (= e!84821 (bvslt (size!2509 (_keys!4565 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!129982 () Bool)

(declare-fun res!62723 () Bool)

(assert (=> b!129982 (=> (not res!62723) (not e!84821))))

(assert (=> b!129982 (= res!62723 (not (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))))))))

(assert (= (and d!39397 res!62720) b!129982))

(assert (= (and b!129982 res!62723) b!129983))

(assert (= (and b!129983 res!62721) b!129984))

(assert (= (and d!39397 res!62722) b!129985))

(assert (=> d!39397 m!151769))

(declare-fun m!152801 () Bool)

(assert (=> d!39397 m!152801))

(assert (=> b!129985 m!152143))

(assert (=> b!129985 m!152159))

(assert (=> b!129985 m!151831))

(assert (=> b!129983 m!151769))

(declare-fun m!152803 () Bool)

(assert (=> b!129983 m!152803))

(declare-fun m!152805 () Bool)

(assert (=> b!129982 m!152805))

(assert (=> b!129982 m!152805))

(declare-fun m!152807 () Bool)

(assert (=> b!129982 m!152807))

(assert (=> d!39271 d!39397))

(declare-fun d!39399 () Bool)

(assert (=> d!39399 (arrayContainsKey!0 lt!67315 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!67597 () Unit!4039)

(declare-fun choose!13 (array!4739 (_ BitVec 64) (_ BitVec 32)) Unit!4039)

(assert (=> d!39399 (= lt!67597 (choose!13 lt!67315 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))))))

(assert (=> d!39399 (bvsge (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161)) #b00000000000000000000000000000000)))

(assert (=> d!39399 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!67315 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (ite c!23792 (index!3248 lt!67161) (index!3245 lt!67161))) lt!67597)))

(declare-fun bs!5379 () Bool)

(assert (= bs!5379 d!39399))

(assert (=> bs!5379 m!151769))

(assert (=> bs!5379 m!152169))

(assert (=> bs!5379 m!151769))

(declare-fun m!152809 () Bool)

(assert (=> bs!5379 m!152809))

(assert (=> d!39271 d!39399))

(declare-fun d!39401 () Bool)

(assert (=> d!39401 (= (apply!113 lt!67204 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (getValueByKey!169 (toList!864 lt!67204) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5380 () Bool)

(assert (= bs!5380 d!39401))

(assert (=> bs!5380 m!152013))

(declare-fun m!152811 () Bool)

(assert (=> bs!5380 m!152811))

(assert (=> bs!5380 m!152811))

(declare-fun m!152813 () Bool)

(assert (=> bs!5380 m!152813))

(assert (=> b!129518 d!39401))

(declare-fun c!23924 () Bool)

(declare-fun d!39403 () Bool)

(assert (=> d!39403 (= c!23924 ((_ is ValueCellFull!1086) (select (arr!2244 (ite c!23800 (_values!2807 newMap!16) lt!67149)) #b00000000000000000000000000000000)))))

(declare-fun e!84822 () V!3459)

(assert (=> d!39403 (= (get!1463 (select (arr!2244 (ite c!23800 (_values!2807 newMap!16) lt!67149)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84822)))

(declare-fun b!129986 () Bool)

(assert (=> b!129986 (= e!84822 (get!1464 (select (arr!2244 (ite c!23800 (_values!2807 newMap!16) lt!67149)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129987 () Bool)

(assert (=> b!129987 (= e!84822 (get!1465 (select (arr!2244 (ite c!23800 (_values!2807 newMap!16) lt!67149)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39403 c!23924) b!129986))

(assert (= (and d!39403 (not c!23924)) b!129987))

(assert (=> b!129986 m!152007))

(assert (=> b!129986 m!152009))

(declare-fun m!152815 () Bool)

(assert (=> b!129986 m!152815))

(assert (=> b!129987 m!152007))

(assert (=> b!129987 m!152009))

(declare-fun m!152817 () Bool)

(assert (=> b!129987 m!152817))

(assert (=> b!129518 d!39403))

(declare-fun d!39405 () Bool)

(assert (=> d!39405 (= (apply!113 (+!172 lt!67198 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) lt!67202) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67198 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) lt!67202)))))

(declare-fun bs!5381 () Bool)

(assert (= bs!5381 d!39405))

(declare-fun m!152819 () Bool)

(assert (=> bs!5381 m!152819))

(assert (=> bs!5381 m!152819))

(declare-fun m!152821 () Bool)

(assert (=> bs!5381 m!152821))

(assert (=> b!129521 d!39405))

(declare-fun d!39407 () Bool)

(assert (=> d!39407 (= (apply!113 lt!67206 lt!67200) (get!1466 (getValueByKey!169 (toList!864 lt!67206) lt!67200)))))

(declare-fun bs!5382 () Bool)

(assert (= bs!5382 d!39407))

(declare-fun m!152823 () Bool)

(assert (=> bs!5382 m!152823))

(assert (=> bs!5382 m!152823))

(declare-fun m!152825 () Bool)

(assert (=> bs!5382 m!152825))

(assert (=> b!129521 d!39407))

(declare-fun d!39409 () Bool)

(assert (=> d!39409 (= (apply!113 (+!172 lt!67206 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67200) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67206 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) lt!67200)))))

(declare-fun bs!5383 () Bool)

(assert (= bs!5383 d!39409))

(declare-fun m!152827 () Bool)

(assert (=> bs!5383 m!152827))

(assert (=> bs!5383 m!152827))

(declare-fun m!152829 () Bool)

(assert (=> bs!5383 m!152829))

(assert (=> b!129521 d!39409))

(declare-fun d!39411 () Bool)

(assert (=> d!39411 (= (apply!113 (+!172 lt!67198 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) lt!67202) (apply!113 lt!67198 lt!67202))))

(declare-fun lt!67598 () Unit!4039)

(assert (=> d!39411 (= lt!67598 (choose!790 lt!67198 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) lt!67202))))

(declare-fun e!84823 () Bool)

(assert (=> d!39411 e!84823))

(declare-fun res!62724 () Bool)

(assert (=> d!39411 (=> (not res!62724) (not e!84823))))

(assert (=> d!39411 (= res!62724 (contains!889 lt!67198 lt!67202))))

(assert (=> d!39411 (= (addApplyDifferent!89 lt!67198 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) lt!67202) lt!67598)))

(declare-fun b!129988 () Bool)

(assert (=> b!129988 (= e!84823 (not (= lt!67202 lt!67201)))))

(assert (= (and d!39411 res!62724) b!129988))

(assert (=> d!39411 m!152049))

(assert (=> d!39411 m!152051))

(declare-fun m!152831 () Bool)

(assert (=> d!39411 m!152831))

(assert (=> d!39411 m!152049))

(assert (=> d!39411 m!152039))

(declare-fun m!152833 () Bool)

(assert (=> d!39411 m!152833))

(assert (=> b!129521 d!39411))

(declare-fun d!39413 () Bool)

(declare-fun e!84824 () Bool)

(assert (=> d!39413 e!84824))

(declare-fun res!62725 () Bool)

(assert (=> d!39413 (=> (not res!62725) (not e!84824))))

(declare-fun lt!67600 () ListLongMap!1697)

(assert (=> d!39413 (= res!62725 (contains!889 lt!67600 (_1!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(declare-fun lt!67601 () List!1708)

(assert (=> d!39413 (= lt!67600 (ListLongMap!1698 lt!67601))))

(declare-fun lt!67602 () Unit!4039)

(declare-fun lt!67599 () Unit!4039)

(assert (=> d!39413 (= lt!67602 lt!67599)))

(assert (=> d!39413 (= (getValueByKey!169 lt!67601 (_1!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39413 (= lt!67599 (lemmaContainsTupThenGetReturnValue!84 lt!67601 (_1!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39413 (= lt!67601 (insertStrictlySorted!87 (toList!864 lt!67208) (_1!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39413 (= (+!172 lt!67208 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67600)))

(declare-fun b!129989 () Bool)

(declare-fun res!62726 () Bool)

(assert (=> b!129989 (=> (not res!62726) (not e!84824))))

(assert (=> b!129989 (= res!62726 (= (getValueByKey!169 (toList!864 lt!67600) (_1!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))))

(declare-fun b!129990 () Bool)

(assert (=> b!129990 (= e!84824 (contains!890 (toList!864 lt!67600) (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))

(assert (= (and d!39413 res!62725) b!129989))

(assert (= (and b!129989 res!62726) b!129990))

(declare-fun m!152835 () Bool)

(assert (=> d!39413 m!152835))

(declare-fun m!152837 () Bool)

(assert (=> d!39413 m!152837))

(declare-fun m!152839 () Bool)

(assert (=> d!39413 m!152839))

(declare-fun m!152841 () Bool)

(assert (=> d!39413 m!152841))

(declare-fun m!152843 () Bool)

(assert (=> b!129989 m!152843))

(declare-fun m!152845 () Bool)

(assert (=> b!129990 m!152845))

(assert (=> b!129521 d!39413))

(declare-fun d!39415 () Bool)

(assert (=> d!39415 (contains!889 (+!172 lt!67216 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) lt!67205)))

(declare-fun lt!67603 () Unit!4039)

(assert (=> d!39415 (= lt!67603 (choose!791 lt!67216 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) lt!67205))))

(assert (=> d!39415 (contains!889 lt!67216 lt!67205)))

(assert (=> d!39415 (= (addStillContains!89 lt!67216 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) lt!67205) lt!67603)))

(declare-fun bs!5384 () Bool)

(assert (= bs!5384 d!39415))

(assert (=> bs!5384 m!152043))

(assert (=> bs!5384 m!152043))

(assert (=> bs!5384 m!152045))

(declare-fun m!152847 () Bool)

(assert (=> bs!5384 m!152847))

(declare-fun m!152849 () Bool)

(assert (=> bs!5384 m!152849))

(assert (=> b!129521 d!39415))

(declare-fun d!39417 () Bool)

(declare-fun e!84825 () Bool)

(assert (=> d!39417 e!84825))

(declare-fun res!62727 () Bool)

(assert (=> d!39417 (=> res!62727 e!84825)))

(declare-fun lt!67607 () Bool)

(assert (=> d!39417 (= res!62727 (not lt!67607))))

(declare-fun lt!67606 () Bool)

(assert (=> d!39417 (= lt!67607 lt!67606)))

(declare-fun lt!67605 () Unit!4039)

(declare-fun e!84826 () Unit!4039)

(assert (=> d!39417 (= lt!67605 e!84826)))

(declare-fun c!23925 () Bool)

(assert (=> d!39417 (= c!23925 lt!67606)))

(assert (=> d!39417 (= lt!67606 (containsKey!173 (toList!864 (+!172 lt!67216 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) lt!67205))))

(assert (=> d!39417 (= (contains!889 (+!172 lt!67216 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) lt!67205) lt!67607)))

(declare-fun b!129991 () Bool)

(declare-fun lt!67604 () Unit!4039)

(assert (=> b!129991 (= e!84826 lt!67604)))

(assert (=> b!129991 (= lt!67604 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (+!172 lt!67216 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) lt!67205))))

(assert (=> b!129991 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67216 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) lt!67205))))

(declare-fun b!129992 () Bool)

(declare-fun Unit!4065 () Unit!4039)

(assert (=> b!129992 (= e!84826 Unit!4065)))

(declare-fun b!129993 () Bool)

(assert (=> b!129993 (= e!84825 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67216 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) lt!67205)))))

(assert (= (and d!39417 c!23925) b!129991))

(assert (= (and d!39417 (not c!23925)) b!129992))

(assert (= (and d!39417 (not res!62727)) b!129993))

(declare-fun m!152851 () Bool)

(assert (=> d!39417 m!152851))

(declare-fun m!152853 () Bool)

(assert (=> b!129991 m!152853))

(declare-fun m!152855 () Bool)

(assert (=> b!129991 m!152855))

(assert (=> b!129991 m!152855))

(declare-fun m!152857 () Bool)

(assert (=> b!129991 m!152857))

(assert (=> b!129993 m!152855))

(assert (=> b!129993 m!152855))

(assert (=> b!129993 m!152857))

(assert (=> b!129521 d!39417))

(declare-fun d!39419 () Bool)

(assert (=> d!39419 (= (apply!113 (+!172 lt!67208 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67203) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67208 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) lt!67203)))))

(declare-fun bs!5385 () Bool)

(assert (= bs!5385 d!39419))

(declare-fun m!152859 () Bool)

(assert (=> bs!5385 m!152859))

(assert (=> bs!5385 m!152859))

(declare-fun m!152861 () Bool)

(assert (=> bs!5385 m!152861))

(assert (=> b!129521 d!39419))

(declare-fun d!39421 () Bool)

(declare-fun e!84827 () Bool)

(assert (=> d!39421 e!84827))

(declare-fun res!62728 () Bool)

(assert (=> d!39421 (=> (not res!62728) (not e!84827))))

(declare-fun lt!67609 () ListLongMap!1697)

(assert (=> d!39421 (= res!62728 (contains!889 lt!67609 (_1!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))))

(declare-fun lt!67610 () List!1708)

(assert (=> d!39421 (= lt!67609 (ListLongMap!1698 lt!67610))))

(declare-fun lt!67611 () Unit!4039)

(declare-fun lt!67608 () Unit!4039)

(assert (=> d!39421 (= lt!67611 lt!67608)))

(assert (=> d!39421 (= (getValueByKey!169 lt!67610 (_1!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))))

(assert (=> d!39421 (= lt!67608 (lemmaContainsTupThenGetReturnValue!84 lt!67610 (_1!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))))

(assert (=> d!39421 (= lt!67610 (insertStrictlySorted!87 (toList!864 lt!67198) (_1!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))))

(assert (=> d!39421 (= (+!172 lt!67198 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) lt!67609)))

(declare-fun b!129994 () Bool)

(declare-fun res!62729 () Bool)

(assert (=> b!129994 (=> (not res!62729) (not e!84827))))

(assert (=> b!129994 (= res!62729 (= (getValueByKey!169 (toList!864 lt!67609) (_1!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))))))))

(declare-fun b!129995 () Bool)

(assert (=> b!129995 (= e!84827 (contains!890 (toList!864 lt!67609) (tuple2!2609 lt!67201 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))))))

(assert (= (and d!39421 res!62728) b!129994))

(assert (= (and b!129994 res!62729) b!129995))

(declare-fun m!152863 () Bool)

(assert (=> d!39421 m!152863))

(declare-fun m!152865 () Bool)

(assert (=> d!39421 m!152865))

(declare-fun m!152867 () Bool)

(assert (=> d!39421 m!152867))

(declare-fun m!152869 () Bool)

(assert (=> d!39421 m!152869))

(declare-fun m!152871 () Bool)

(assert (=> b!129994 m!152871))

(declare-fun m!152873 () Bool)

(assert (=> b!129995 m!152873))

(assert (=> b!129521 d!39421))

(declare-fun d!39423 () Bool)

(assert (=> d!39423 (= (apply!113 lt!67198 lt!67202) (get!1466 (getValueByKey!169 (toList!864 lt!67198) lt!67202)))))

(declare-fun bs!5386 () Bool)

(assert (= bs!5386 d!39423))

(declare-fun m!152875 () Bool)

(assert (=> bs!5386 m!152875))

(assert (=> bs!5386 m!152875))

(declare-fun m!152877 () Bool)

(assert (=> bs!5386 m!152877))

(assert (=> b!129521 d!39423))

(declare-fun b!129996 () Bool)

(declare-fun e!84832 () ListLongMap!1697)

(declare-fun e!84834 () ListLongMap!1697)

(assert (=> b!129996 (= e!84832 e!84834)))

(declare-fun c!23928 () Bool)

(assert (=> b!129996 (= c!23928 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129997 () Bool)

(declare-fun lt!67617 () Unit!4039)

(declare-fun lt!67614 () Unit!4039)

(assert (=> b!129997 (= lt!67617 lt!67614)))

(declare-fun lt!67615 () (_ BitVec 64))

(declare-fun lt!67616 () (_ BitVec 64))

(declare-fun lt!67613 () V!3459)

(declare-fun lt!67612 () ListLongMap!1697)

(assert (=> b!129997 (not (contains!889 (+!172 lt!67612 (tuple2!2609 lt!67616 lt!67613)) lt!67615))))

(assert (=> b!129997 (= lt!67614 (addStillNotContains!58 lt!67612 lt!67616 lt!67613 lt!67615))))

(assert (=> b!129997 (= lt!67615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!129997 (= lt!67613 (get!1463 (select (arr!2244 (ite c!23800 (_values!2807 newMap!16) lt!67149)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!129997 (= lt!67616 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!14157 () ListLongMap!1697)

(assert (=> b!129997 (= lt!67612 call!14157)))

(assert (=> b!129997 (= e!84834 (+!172 call!14157 (tuple2!2609 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (get!1463 (select (arr!2244 (ite c!23800 (_values!2807 newMap!16) lt!67149)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!129998 () Bool)

(declare-fun lt!67618 () ListLongMap!1697)

(declare-fun e!84828 () Bool)

(assert (=> b!129998 (= e!84828 (= lt!67618 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2824 newMap!16))))))

(declare-fun b!129999 () Bool)

(declare-fun res!62732 () Bool)

(declare-fun e!84831 () Bool)

(assert (=> b!129999 (=> (not res!62732) (not e!84831))))

(assert (=> b!129999 (= res!62732 (not (contains!889 lt!67618 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130000 () Bool)

(assert (=> b!130000 (= e!84834 call!14157)))

(declare-fun bm!14154 () Bool)

(assert (=> bm!14154 (= call!14157 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2824 newMap!16)))))

(declare-fun b!130001 () Bool)

(assert (=> b!130001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> b!130001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (ite c!23800 (_values!2807 newMap!16) lt!67149))))))

(declare-fun e!84833 () Bool)

(assert (=> b!130001 (= e!84833 (= (apply!113 lt!67618 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (ite c!23800 (_values!2807 newMap!16) lt!67149)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130002 () Bool)

(declare-fun e!84829 () Bool)

(assert (=> b!130002 (= e!84829 e!84833)))

(assert (=> b!130002 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun res!62730 () Bool)

(assert (=> b!130002 (= res!62730 (contains!889 lt!67618 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130002 (=> (not res!62730) (not e!84833))))

(declare-fun d!39425 () Bool)

(assert (=> d!39425 e!84831))

(declare-fun res!62733 () Bool)

(assert (=> d!39425 (=> (not res!62733) (not e!84831))))

(assert (=> d!39425 (= res!62733 (not (contains!889 lt!67618 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39425 (= lt!67618 e!84832)))

(declare-fun c!23927 () Bool)

(assert (=> d!39425 (= c!23927 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39425 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39425 (= (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23800 (_values!2807 newMap!16) lt!67149) (mask!7102 newMap!16) (ite c!23800 (ite c!23802 lt!67172 lt!67164) (extraKeys!2597 newMap!16)) (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)) (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67618)))

(declare-fun b!130003 () Bool)

(assert (=> b!130003 (= e!84829 e!84828)))

(declare-fun c!23929 () Bool)

(assert (=> b!130003 (= c!23929 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130004 () Bool)

(declare-fun e!84830 () Bool)

(assert (=> b!130004 (= e!84830 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130004 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!130005 () Bool)

(assert (=> b!130005 (= e!84828 (isEmpty!402 lt!67618))))

(declare-fun b!130006 () Bool)

(assert (=> b!130006 (= e!84832 (ListLongMap!1698 Nil!1705))))

(declare-fun b!130007 () Bool)

(assert (=> b!130007 (= e!84831 e!84829)))

(declare-fun c!23926 () Bool)

(assert (=> b!130007 (= c!23926 e!84830)))

(declare-fun res!62731 () Bool)

(assert (=> b!130007 (=> (not res!62731) (not e!84830))))

(assert (=> b!130007 (= res!62731 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (= (and d!39425 c!23927) b!130006))

(assert (= (and d!39425 (not c!23927)) b!129996))

(assert (= (and b!129996 c!23928) b!129997))

(assert (= (and b!129996 (not c!23928)) b!130000))

(assert (= (or b!129997 b!130000) bm!14154))

(assert (= (and d!39425 res!62733) b!129999))

(assert (= (and b!129999 res!62732) b!130007))

(assert (= (and b!130007 res!62731) b!130004))

(assert (= (and b!130007 c!23926) b!130002))

(assert (= (and b!130007 (not c!23926)) b!130003))

(assert (= (and b!130002 res!62730) b!130001))

(assert (= (and b!130003 c!23929) b!129998))

(assert (= (and b!130003 (not c!23929)) b!130005))

(declare-fun b_lambda!5775 () Bool)

(assert (=> (not b_lambda!5775) (not b!129997)))

(assert (=> b!129997 t!6114))

(declare-fun b_and!8051 () Bool)

(assert (= b_and!8047 (and (=> t!6114 result!3921) b_and!8051)))

(assert (=> b!129997 t!6116))

(declare-fun b_and!8053 () Bool)

(assert (= b_and!8049 (and (=> t!6116 result!3923) b_and!8053)))

(declare-fun b_lambda!5777 () Bool)

(assert (=> (not b_lambda!5777) (not b!130001)))

(assert (=> b!130001 t!6114))

(declare-fun b_and!8055 () Bool)

(assert (= b_and!8051 (and (=> t!6114 result!3921) b_and!8055)))

(assert (=> b!130001 t!6116))

(declare-fun b_and!8057 () Bool)

(assert (= b_and!8053 (and (=> t!6116 result!3923) b_and!8057)))

(declare-fun m!152879 () Bool)

(assert (=> b!130005 m!152879))

(declare-fun m!152881 () Bool)

(assert (=> d!39425 m!152881))

(assert (=> d!39425 m!151983))

(assert (=> b!130001 m!152007))

(assert (=> b!130001 m!152013))

(declare-fun m!152883 () Bool)

(assert (=> b!130001 m!152883))

(assert (=> b!130001 m!152013))

(assert (=> b!130001 m!152007))

(assert (=> b!130001 m!152009))

(assert (=> b!130001 m!152011))

(assert (=> b!130001 m!152009))

(assert (=> b!129996 m!152013))

(assert (=> b!129996 m!152013))

(assert (=> b!129996 m!152019))

(assert (=> b!130002 m!152013))

(assert (=> b!130002 m!152013))

(declare-fun m!152885 () Bool)

(assert (=> b!130002 m!152885))

(declare-fun m!152887 () Bool)

(assert (=> bm!14154 m!152887))

(declare-fun m!152889 () Bool)

(assert (=> b!129999 m!152889))

(assert (=> b!130004 m!152013))

(assert (=> b!130004 m!152013))

(assert (=> b!130004 m!152019))

(assert (=> b!129997 m!152007))

(declare-fun m!152891 () Bool)

(assert (=> b!129997 m!152891))

(declare-fun m!152893 () Bool)

(assert (=> b!129997 m!152893))

(assert (=> b!129997 m!152013))

(declare-fun m!152895 () Bool)

(assert (=> b!129997 m!152895))

(assert (=> b!129997 m!152009))

(assert (=> b!129997 m!152891))

(assert (=> b!129997 m!152007))

(assert (=> b!129997 m!152009))

(assert (=> b!129997 m!152011))

(declare-fun m!152897 () Bool)

(assert (=> b!129997 m!152897))

(assert (=> b!129998 m!152887))

(assert (=> b!129521 d!39425))

(declare-fun d!39427 () Bool)

(declare-fun e!84835 () Bool)

(assert (=> d!39427 e!84835))

(declare-fun res!62734 () Bool)

(assert (=> d!39427 (=> (not res!62734) (not e!84835))))

(declare-fun lt!67620 () ListLongMap!1697)

(assert (=> d!39427 (= res!62734 (contains!889 lt!67620 (_1!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(declare-fun lt!67621 () List!1708)

(assert (=> d!39427 (= lt!67620 (ListLongMap!1698 lt!67621))))

(declare-fun lt!67622 () Unit!4039)

(declare-fun lt!67619 () Unit!4039)

(assert (=> d!39427 (= lt!67622 lt!67619)))

(assert (=> d!39427 (= (getValueByKey!169 lt!67621 (_1!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39427 (= lt!67619 (lemmaContainsTupThenGetReturnValue!84 lt!67621 (_1!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39427 (= lt!67621 (insertStrictlySorted!87 (toList!864 lt!67206) (_1!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39427 (= (+!172 lt!67206 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67620)))

(declare-fun b!130008 () Bool)

(declare-fun res!62735 () Bool)

(assert (=> b!130008 (=> (not res!62735) (not e!84835))))

(assert (=> b!130008 (= res!62735 (= (getValueByKey!169 (toList!864 lt!67620) (_1!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))))

(declare-fun b!130009 () Bool)

(assert (=> b!130009 (= e!84835 (contains!890 (toList!864 lt!67620) (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))

(assert (= (and d!39427 res!62734) b!130008))

(assert (= (and b!130008 res!62735) b!130009))

(declare-fun m!152899 () Bool)

(assert (=> d!39427 m!152899))

(declare-fun m!152901 () Bool)

(assert (=> d!39427 m!152901))

(declare-fun m!152903 () Bool)

(assert (=> d!39427 m!152903))

(declare-fun m!152905 () Bool)

(assert (=> d!39427 m!152905))

(declare-fun m!152907 () Bool)

(assert (=> b!130008 m!152907))

(declare-fun m!152909 () Bool)

(assert (=> b!130009 m!152909))

(assert (=> b!129521 d!39427))

(declare-fun d!39429 () Bool)

(assert (=> d!39429 (= (apply!113 (+!172 lt!67208 (tuple2!2609 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67203) (apply!113 lt!67208 lt!67203))))

(declare-fun lt!67623 () Unit!4039)

(assert (=> d!39429 (= lt!67623 (choose!790 lt!67208 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) lt!67203))))

(declare-fun e!84836 () Bool)

(assert (=> d!39429 e!84836))

(declare-fun res!62736 () Bool)

(assert (=> d!39429 (=> (not res!62736) (not e!84836))))

(assert (=> d!39429 (= res!62736 (contains!889 lt!67208 lt!67203))))

(assert (=> d!39429 (= (addApplyDifferent!89 lt!67208 lt!67217 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) lt!67203) lt!67623)))

(declare-fun b!130010 () Bool)

(assert (=> b!130010 (= e!84836 (not (= lt!67203 lt!67217)))))

(assert (= (and d!39429 res!62736) b!130010))

(assert (=> d!39429 m!152037))

(assert (=> d!39429 m!152053))

(declare-fun m!152911 () Bool)

(assert (=> d!39429 m!152911))

(assert (=> d!39429 m!152037))

(assert (=> d!39429 m!152047))

(declare-fun m!152913 () Bool)

(assert (=> d!39429 m!152913))

(assert (=> b!129521 d!39429))

(declare-fun d!39431 () Bool)

(declare-fun e!84837 () Bool)

(assert (=> d!39431 e!84837))

(declare-fun res!62737 () Bool)

(assert (=> d!39431 (=> (not res!62737) (not e!84837))))

(declare-fun lt!67625 () ListLongMap!1697)

(assert (=> d!39431 (= res!62737 (contains!889 lt!67625 (_1!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))))

(declare-fun lt!67626 () List!1708)

(assert (=> d!39431 (= lt!67625 (ListLongMap!1698 lt!67626))))

(declare-fun lt!67627 () Unit!4039)

(declare-fun lt!67624 () Unit!4039)

(assert (=> d!39431 (= lt!67627 lt!67624)))

(assert (=> d!39431 (= (getValueByKey!169 lt!67626 (_1!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))))

(assert (=> d!39431 (= lt!67624 (lemmaContainsTupThenGetReturnValue!84 lt!67626 (_1!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))))

(assert (=> d!39431 (= lt!67626 (insertStrictlySorted!87 (toList!864 lt!67216) (_1!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))))))

(assert (=> d!39431 (= (+!172 lt!67216 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))) lt!67625)))

(declare-fun b!130011 () Bool)

(declare-fun res!62738 () Bool)

(assert (=> b!130011 (=> (not res!62738) (not e!84837))))

(assert (=> b!130011 (= res!62738 (= (getValueByKey!169 (toList!864 lt!67625) (_1!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))))))))

(declare-fun b!130012 () Bool)

(assert (=> b!130012 (= e!84837 (contains!890 (toList!864 lt!67625) (tuple2!2609 lt!67212 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16)))))))

(assert (= (and d!39431 res!62737) b!130011))

(assert (= (and b!130011 res!62738) b!130012))

(declare-fun m!152915 () Bool)

(assert (=> d!39431 m!152915))

(declare-fun m!152917 () Bool)

(assert (=> d!39431 m!152917))

(declare-fun m!152919 () Bool)

(assert (=> d!39431 m!152919))

(declare-fun m!152921 () Bool)

(assert (=> d!39431 m!152921))

(declare-fun m!152923 () Bool)

(assert (=> b!130011 m!152923))

(declare-fun m!152925 () Bool)

(assert (=> b!130012 m!152925))

(assert (=> b!129521 d!39431))

(declare-fun d!39433 () Bool)

(assert (=> d!39433 (= (apply!113 lt!67208 lt!67203) (get!1466 (getValueByKey!169 (toList!864 lt!67208) lt!67203)))))

(declare-fun bs!5387 () Bool)

(assert (= bs!5387 d!39433))

(declare-fun m!152927 () Bool)

(assert (=> bs!5387 m!152927))

(assert (=> bs!5387 m!152927))

(declare-fun m!152929 () Bool)

(assert (=> bs!5387 m!152929))

(assert (=> b!129521 d!39433))

(declare-fun d!39435 () Bool)

(assert (=> d!39435 (= (apply!113 (+!172 lt!67206 (tuple2!2609 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67200) (apply!113 lt!67206 lt!67200))))

(declare-fun lt!67628 () Unit!4039)

(assert (=> d!39435 (= lt!67628 (choose!790 lt!67206 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) lt!67200))))

(declare-fun e!84838 () Bool)

(assert (=> d!39435 e!84838))

(declare-fun res!62739 () Bool)

(assert (=> d!39435 (=> (not res!62739) (not e!84838))))

(assert (=> d!39435 (= res!62739 (contains!889 lt!67206 lt!67200))))

(assert (=> d!39435 (= (addApplyDifferent!89 lt!67206 lt!67209 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)) lt!67200) lt!67628)))

(declare-fun b!130013 () Bool)

(assert (=> b!130013 (= e!84838 (not (= lt!67200 lt!67209)))))

(assert (= (and d!39435 res!62739) b!130013))

(assert (=> d!39435 m!152031))

(assert (=> d!39435 m!152033))

(declare-fun m!152931 () Bool)

(assert (=> d!39435 m!152931))

(assert (=> d!39435 m!152031))

(assert (=> d!39435 m!152055))

(declare-fun m!152933 () Bool)

(assert (=> d!39435 m!152933))

(assert (=> b!129521 d!39435))

(declare-fun d!39437 () Bool)

(assert (=> d!39437 (= (apply!113 lt!67204 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!864 lt!67204) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5388 () Bool)

(assert (= bs!5388 d!39437))

(declare-fun m!152935 () Bool)

(assert (=> bs!5388 m!152935))

(assert (=> bs!5388 m!152935))

(declare-fun m!152937 () Bool)

(assert (=> bs!5388 m!152937))

(assert (=> b!129536 d!39437))

(declare-fun d!39439 () Bool)

(assert (=> d!39439 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068))))

(declare-fun lt!67629 () Unit!4039)

(assert (=> d!39439 (= lt!67629 (choose!789 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068))))

(declare-fun e!84839 () Bool)

(assert (=> d!39439 e!84839))

(declare-fun res!62740 () Bool)

(assert (=> d!39439 (=> (not res!62740) (not e!84839))))

(assert (=> d!39439 (= res!62740 (isStrictlySorted!319 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39439 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068) lt!67629)))

(declare-fun b!130014 () Bool)

(assert (=> b!130014 (= e!84839 (containsKey!173 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068))))

(assert (= (and d!39439 res!62740) b!130014))

(assert (=> d!39439 m!152285))

(assert (=> d!39439 m!152285))

(assert (=> d!39439 m!152287))

(declare-fun m!152939 () Bool)

(assert (=> d!39439 m!152939))

(declare-fun m!152941 () Bool)

(assert (=> d!39439 m!152941))

(assert (=> b!130014 m!152281))

(assert (=> b!129711 d!39439))

(declare-fun d!39441 () Bool)

(assert (=> d!39441 (= (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068)) (not (isEmpty!403 (getValueByKey!169 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068))))))

(declare-fun bs!5389 () Bool)

(assert (= bs!5389 d!39441))

(assert (=> bs!5389 m!152285))

(declare-fun m!152943 () Bool)

(assert (=> bs!5389 m!152943))

(assert (=> b!129711 d!39441))

(declare-fun e!84841 () Option!175)

(declare-fun b!130017 () Bool)

(assert (=> b!130017 (= e!84841 (getValueByKey!169 (t!6107 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) lt!67068))))

(declare-fun e!84840 () Option!175)

(declare-fun b!130015 () Bool)

(assert (=> b!130015 (= e!84840 (Some!174 (_2!1315 (h!2308 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))))

(declare-fun b!130016 () Bool)

(assert (=> b!130016 (= e!84840 e!84841)))

(declare-fun c!23931 () Bool)

(assert (=> b!130016 (= c!23931 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) (not (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67068))))))

(declare-fun d!39443 () Bool)

(declare-fun c!23930 () Bool)

(assert (=> d!39443 (= c!23930 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67068)))))

(assert (=> d!39443 (= (getValueByKey!169 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068) e!84840)))

(declare-fun b!130018 () Bool)

(assert (=> b!130018 (= e!84841 None!173)))

(assert (= (and d!39443 c!23930) b!130015))

(assert (= (and d!39443 (not c!23930)) b!130016))

(assert (= (and b!130016 c!23931) b!130017))

(assert (= (and b!130016 (not c!23931)) b!130018))

(declare-fun m!152945 () Bool)

(assert (=> b!130017 m!152945))

(assert (=> b!129711 d!39443))

(declare-fun d!39445 () Bool)

(assert (=> d!39445 (= (isDefined!122 (getValueByKey!169 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))) (not (isEmpty!403 (getValueByKey!169 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun bs!5390 () Bool)

(assert (= bs!5390 d!39445))

(assert (=> bs!5390 m!152487))

(declare-fun m!152947 () Bool)

(assert (=> bs!5390 m!152947))

(assert (=> b!129815 d!39445))

(declare-fun e!84843 () Option!175)

(declare-fun b!130021 () Bool)

(assert (=> b!130021 (= e!84843 (getValueByKey!169 (t!6107 (toList!864 call!14077)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!130019 () Bool)

(declare-fun e!84842 () Option!175)

(assert (=> b!130019 (= e!84842 (Some!174 (_2!1315 (h!2308 (toList!864 call!14077)))))))

(declare-fun b!130020 () Bool)

(assert (=> b!130020 (= e!84842 e!84843)))

(declare-fun c!23933 () Bool)

(assert (=> b!130020 (= c!23933 (and ((_ is Cons!1704) (toList!864 call!14077)) (not (= (_1!1315 (h!2308 (toList!864 call!14077))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun c!23932 () Bool)

(declare-fun d!39447 () Bool)

(assert (=> d!39447 (= c!23932 (and ((_ is Cons!1704) (toList!864 call!14077)) (= (_1!1315 (h!2308 (toList!864 call!14077))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39447 (= (getValueByKey!169 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) e!84842)))

(declare-fun b!130022 () Bool)

(assert (=> b!130022 (= e!84843 None!173)))

(assert (= (and d!39447 c!23932) b!130019))

(assert (= (and d!39447 (not c!23932)) b!130020))

(assert (= (and b!130020 c!23933) b!130021))

(assert (= (and b!130020 (not c!23933)) b!130022))

(assert (=> b!130021 m!151769))

(declare-fun m!152949 () Bool)

(assert (=> b!130021 m!152949))

(assert (=> b!129815 d!39447))

(assert (=> d!39279 d!39281))

(assert (=> d!39279 d!39283))

(declare-fun d!39449 () Bool)

(assert (=> d!39449 (isDefined!122 (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39449 true))

(declare-fun _$12!396 () Unit!4039)

(assert (=> d!39449 (= (choose!789 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) _$12!396)))

(declare-fun bs!5391 () Bool)

(assert (= bs!5391 d!39449))

(assert (=> bs!5391 m!151769))

(assert (=> bs!5391 m!151901))

(assert (=> bs!5391 m!151901))

(assert (=> bs!5391 m!151903))

(assert (=> d!39279 d!39449))

(declare-fun d!39451 () Bool)

(declare-fun res!62745 () Bool)

(declare-fun e!84848 () Bool)

(assert (=> d!39451 (=> res!62745 e!84848)))

(assert (=> d!39451 (= res!62745 (or ((_ is Nil!1705) (toList!864 lt!67005)) ((_ is Nil!1705) (t!6107 (toList!864 lt!67005)))))))

(assert (=> d!39451 (= (isStrictlySorted!319 (toList!864 lt!67005)) e!84848)))

(declare-fun b!130027 () Bool)

(declare-fun e!84849 () Bool)

(assert (=> b!130027 (= e!84848 e!84849)))

(declare-fun res!62746 () Bool)

(assert (=> b!130027 (=> (not res!62746) (not e!84849))))

(assert (=> b!130027 (= res!62746 (bvslt (_1!1315 (h!2308 (toList!864 lt!67005))) (_1!1315 (h!2308 (t!6107 (toList!864 lt!67005))))))))

(declare-fun b!130028 () Bool)

(assert (=> b!130028 (= e!84849 (isStrictlySorted!319 (t!6107 (toList!864 lt!67005))))))

(assert (= (and d!39451 (not res!62745)) b!130027))

(assert (= (and b!130027 res!62746) b!130028))

(declare-fun m!152951 () Bool)

(assert (=> b!130028 m!152951))

(assert (=> d!39279 d!39451))

(declare-fun d!39453 () Bool)

(declare-fun res!62747 () Bool)

(declare-fun e!84850 () Bool)

(assert (=> d!39453 (=> res!62747 e!84850)))

(assert (=> d!39453 (= res!62747 (and ((_ is Cons!1704) (toList!864 lt!67067)) (= (_1!1315 (h!2308 (toList!864 lt!67067))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39453 (= (containsKey!173 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000) e!84850)))

(declare-fun b!130029 () Bool)

(declare-fun e!84851 () Bool)

(assert (=> b!130029 (= e!84850 e!84851)))

(declare-fun res!62748 () Bool)

(assert (=> b!130029 (=> (not res!62748) (not e!84851))))

(assert (=> b!130029 (= res!62748 (and (or (not ((_ is Cons!1704) (toList!864 lt!67067))) (bvsle (_1!1315 (h!2308 (toList!864 lt!67067))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1704) (toList!864 lt!67067)) (bvslt (_1!1315 (h!2308 (toList!864 lt!67067))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130030 () Bool)

(assert (=> b!130030 (= e!84851 (containsKey!173 (t!6107 (toList!864 lt!67067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39453 (not res!62747)) b!130029))

(assert (= (and b!130029 res!62748) b!130030))

(declare-fun m!152953 () Bool)

(assert (=> b!130030 m!152953))

(assert (=> d!39277 d!39453))

(assert (=> d!39243 d!39275))

(declare-fun d!39455 () Bool)

(declare-fun e!84854 () Bool)

(assert (=> d!39455 e!84854))

(declare-fun res!62754 () Bool)

(assert (=> d!39455 (=> (not res!62754) (not e!84854))))

(declare-fun lt!67632 () SeekEntryResult!272)

(assert (=> d!39455 (= res!62754 ((_ is Found!272) lt!67632))))

(assert (=> d!39455 (= lt!67632 (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(assert (=> d!39455 true))

(declare-fun _$33!111 () Unit!4039)

(assert (=> d!39455 (= (choose!786 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)) _$33!111)))

(declare-fun b!130035 () Bool)

(declare-fun res!62753 () Bool)

(assert (=> b!130035 (=> (not res!62753) (not e!84854))))

(assert (=> b!130035 (= res!62753 (inRange!0 (index!3246 lt!67632) (mask!7102 newMap!16)))))

(declare-fun b!130036 () Bool)

(assert (=> b!130036 (= e!84854 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67632)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39455 res!62754) b!130035))

(assert (= (and b!130035 res!62753) b!130036))

(assert (=> d!39455 m!151769))

(assert (=> d!39455 m!151913))

(declare-fun m!152955 () Bool)

(assert (=> b!130035 m!152955))

(declare-fun m!152957 () Bool)

(assert (=> b!130036 m!152957))

(assert (=> d!39243 d!39455))

(declare-fun d!39457 () Bool)

(assert (=> d!39457 (= (validMask!0 (mask!7102 newMap!16)) (and (or (= (mask!7102 newMap!16) #b00000000000000000000000000000111) (= (mask!7102 newMap!16) #b00000000000000000000000000001111) (= (mask!7102 newMap!16) #b00000000000000000000000000011111) (= (mask!7102 newMap!16) #b00000000000000000000000000111111) (= (mask!7102 newMap!16) #b00000000000000000000000001111111) (= (mask!7102 newMap!16) #b00000000000000000000000011111111) (= (mask!7102 newMap!16) #b00000000000000000000000111111111) (= (mask!7102 newMap!16) #b00000000000000000000001111111111) (= (mask!7102 newMap!16) #b00000000000000000000011111111111) (= (mask!7102 newMap!16) #b00000000000000000000111111111111) (= (mask!7102 newMap!16) #b00000000000000000001111111111111) (= (mask!7102 newMap!16) #b00000000000000000011111111111111) (= (mask!7102 newMap!16) #b00000000000000000111111111111111) (= (mask!7102 newMap!16) #b00000000000000001111111111111111) (= (mask!7102 newMap!16) #b00000000000000011111111111111111) (= (mask!7102 newMap!16) #b00000000000000111111111111111111) (= (mask!7102 newMap!16) #b00000000000001111111111111111111) (= (mask!7102 newMap!16) #b00000000000011111111111111111111) (= (mask!7102 newMap!16) #b00000000000111111111111111111111) (= (mask!7102 newMap!16) #b00000000001111111111111111111111) (= (mask!7102 newMap!16) #b00000000011111111111111111111111) (= (mask!7102 newMap!16) #b00000000111111111111111111111111) (= (mask!7102 newMap!16) #b00000001111111111111111111111111) (= (mask!7102 newMap!16) #b00000011111111111111111111111111) (= (mask!7102 newMap!16) #b00000111111111111111111111111111) (= (mask!7102 newMap!16) #b00001111111111111111111111111111) (= (mask!7102 newMap!16) #b00011111111111111111111111111111) (= (mask!7102 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7102 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!39243 d!39457))

(assert (=> d!39289 d!39311))

(declare-fun d!39459 () Bool)

(assert (=> d!39459 (= (apply!113 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67065) (apply!113 lt!67061 lt!67065))))

(assert (=> d!39459 true))

(declare-fun _$34!963 () Unit!4039)

(assert (=> d!39459 (= (choose!790 lt!67061 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67065) _$34!963)))

(declare-fun bs!5392 () Bool)

(assert (= bs!5392 d!39459))

(assert (=> bs!5392 m!151887))

(assert (=> bs!5392 m!151887))

(assert (=> bs!5392 m!151889))

(assert (=> bs!5392 m!151877))

(assert (=> d!39289 d!39459))

(assert (=> d!39289 d!39317))

(declare-fun d!39461 () Bool)

(declare-fun e!84855 () Bool)

(assert (=> d!39461 e!84855))

(declare-fun res!62755 () Bool)

(assert (=> d!39461 (=> res!62755 e!84855)))

(declare-fun lt!67636 () Bool)

(assert (=> d!39461 (= res!62755 (not lt!67636))))

(declare-fun lt!67635 () Bool)

(assert (=> d!39461 (= lt!67636 lt!67635)))

(declare-fun lt!67634 () Unit!4039)

(declare-fun e!84856 () Unit!4039)

(assert (=> d!39461 (= lt!67634 e!84856)))

(declare-fun c!23934 () Bool)

(assert (=> d!39461 (= c!23934 lt!67635)))

(assert (=> d!39461 (= lt!67635 (containsKey!173 (toList!864 lt!67061) lt!67065))))

(assert (=> d!39461 (= (contains!889 lt!67061 lt!67065) lt!67636)))

(declare-fun b!130038 () Bool)

(declare-fun lt!67633 () Unit!4039)

(assert (=> b!130038 (= e!84856 lt!67633)))

(assert (=> b!130038 (= lt!67633 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67061) lt!67065))))

(assert (=> b!130038 (isDefined!122 (getValueByKey!169 (toList!864 lt!67061) lt!67065))))

(declare-fun b!130039 () Bool)

(declare-fun Unit!4066 () Unit!4039)

(assert (=> b!130039 (= e!84856 Unit!4066)))

(declare-fun b!130040 () Bool)

(assert (=> b!130040 (= e!84855 (isDefined!122 (getValueByKey!169 (toList!864 lt!67061) lt!67065)))))

(assert (= (and d!39461 c!23934) b!130038))

(assert (= (and d!39461 (not c!23934)) b!130039))

(assert (= (and d!39461 (not res!62755)) b!130040))

(declare-fun m!152959 () Bool)

(assert (=> d!39461 m!152959))

(declare-fun m!152961 () Bool)

(assert (=> b!130038 m!152961))

(assert (=> b!130038 m!152293))

(assert (=> b!130038 m!152293))

(declare-fun m!152963 () Bool)

(assert (=> b!130038 m!152963))

(assert (=> b!130040 m!152293))

(assert (=> b!130040 m!152293))

(assert (=> b!130040 m!152963))

(assert (=> d!39289 d!39461))

(assert (=> d!39289 d!39307))

(declare-fun d!39463 () Bool)

(assert (=> d!39463 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!541 (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(assert (=> d!39463 true))

(declare-fun _$5!131 () Unit!4039)

(assert (=> d!39463 (= (choose!794 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (index!3246 lt!67161) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)) _$5!131)))

(declare-fun bs!5393 () Bool)

(assert (= bs!5393 d!39463))

(assert (=> bs!5393 m!151839))

(assert (=> bs!5393 m!151839))

(assert (=> bs!5393 m!152177))

(assert (=> bs!5393 m!151919))

(assert (=> bs!5393 m!152481))

(assert (=> d!39343 d!39463))

(assert (=> d!39343 d!39457))

(declare-fun d!39465 () Bool)

(assert (=> d!39465 (= (apply!113 lt!67240 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1466 (getValueByKey!169 (toList!864 lt!67240) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5394 () Bool)

(assert (= bs!5394 d!39465))

(assert (=> bs!5394 m!151851))

(declare-fun m!152965 () Bool)

(assert (=> bs!5394 m!152965))

(assert (=> bs!5394 m!152965))

(declare-fun m!152967 () Bool)

(assert (=> bs!5394 m!152967))

(assert (=> b!129568 d!39465))

(assert (=> b!129568 d!39267))

(declare-fun d!39467 () Bool)

(declare-fun e!84857 () Bool)

(assert (=> d!39467 e!84857))

(declare-fun res!62756 () Bool)

(assert (=> d!39467 (=> res!62756 e!84857)))

(declare-fun lt!67640 () Bool)

(assert (=> d!39467 (= res!62756 (not lt!67640))))

(declare-fun lt!67639 () Bool)

(assert (=> d!39467 (= lt!67640 lt!67639)))

(declare-fun lt!67638 () Unit!4039)

(declare-fun e!84858 () Unit!4039)

(assert (=> d!39467 (= lt!67638 e!84858)))

(declare-fun c!23935 () Bool)

(assert (=> d!39467 (= c!23935 lt!67639)))

(assert (=> d!39467 (= lt!67639 (containsKey!173 (toList!864 lt!67372) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39467 (= (contains!889 lt!67372 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67640)))

(declare-fun b!130041 () Bool)

(declare-fun lt!67637 () Unit!4039)

(assert (=> b!130041 (= e!84858 lt!67637)))

(assert (=> b!130041 (= lt!67637 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67372) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> b!130041 (isDefined!122 (getValueByKey!169 (toList!864 lt!67372) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130042 () Bool)

(declare-fun Unit!4067 () Unit!4039)

(assert (=> b!130042 (= e!84858 Unit!4067)))

(declare-fun b!130043 () Bool)

(assert (=> b!130043 (= e!84857 (isDefined!122 (getValueByKey!169 (toList!864 lt!67372) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39467 c!23935) b!130041))

(assert (= (and d!39467 (not c!23935)) b!130042))

(assert (= (and d!39467 (not res!62756)) b!130043))

(declare-fun m!152969 () Bool)

(assert (=> d!39467 m!152969))

(declare-fun m!152971 () Bool)

(assert (=> b!130041 m!152971))

(assert (=> b!130041 m!152253))

(assert (=> b!130041 m!152253))

(declare-fun m!152973 () Bool)

(assert (=> b!130041 m!152973))

(assert (=> b!130043 m!152253))

(assert (=> b!130043 m!152253))

(assert (=> b!130043 m!152973))

(assert (=> d!39293 d!39467))

(declare-fun b!130046 () Bool)

(declare-fun e!84860 () Option!175)

(assert (=> b!130046 (= e!84860 (getValueByKey!169 (t!6107 lt!67373) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130044 () Bool)

(declare-fun e!84859 () Option!175)

(assert (=> b!130044 (= e!84859 (Some!174 (_2!1315 (h!2308 lt!67373))))))

(declare-fun b!130045 () Bool)

(assert (=> b!130045 (= e!84859 e!84860)))

(declare-fun c!23937 () Bool)

(assert (=> b!130045 (= c!23937 (and ((_ is Cons!1704) lt!67373) (not (= (_1!1315 (h!2308 lt!67373)) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!23936 () Bool)

(declare-fun d!39469 () Bool)

(assert (=> d!39469 (= c!23936 (and ((_ is Cons!1704) lt!67373) (= (_1!1315 (h!2308 lt!67373)) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39469 (= (getValueByKey!169 lt!67373 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!84859)))

(declare-fun b!130047 () Bool)

(assert (=> b!130047 (= e!84860 None!173)))

(assert (= (and d!39469 c!23936) b!130044))

(assert (= (and d!39469 (not c!23936)) b!130045))

(assert (= (and b!130045 c!23937) b!130046))

(assert (= (and b!130045 (not c!23937)) b!130047))

(declare-fun m!152975 () Bool)

(assert (=> b!130046 m!152975))

(assert (=> d!39293 d!39469))

(declare-fun d!39471 () Bool)

(assert (=> d!39471 (= (getValueByKey!169 lt!67373 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67643 () Unit!4039)

(declare-fun choose!796 (List!1708 (_ BitVec 64) V!3459) Unit!4039)

(assert (=> d!39471 (= lt!67643 (choose!796 lt!67373 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun e!84863 () Bool)

(assert (=> d!39471 e!84863))

(declare-fun res!62761 () Bool)

(assert (=> d!39471 (=> (not res!62761) (not e!84863))))

(assert (=> d!39471 (= res!62761 (isStrictlySorted!319 lt!67373))))

(assert (=> d!39471 (= (lemmaContainsTupThenGetReturnValue!84 lt!67373 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67643)))

(declare-fun b!130052 () Bool)

(declare-fun res!62762 () Bool)

(assert (=> b!130052 (=> (not res!62762) (not e!84863))))

(assert (=> b!130052 (= res!62762 (containsKey!173 lt!67373 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130053 () Bool)

(assert (=> b!130053 (= e!84863 (contains!890 lt!67373 (tuple2!2609 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39471 res!62761) b!130052))

(assert (= (and b!130052 res!62762) b!130053))

(assert (=> d!39471 m!152247))

(declare-fun m!152977 () Bool)

(assert (=> d!39471 m!152977))

(declare-fun m!152979 () Bool)

(assert (=> d!39471 m!152979))

(declare-fun m!152981 () Bool)

(assert (=> b!130052 m!152981))

(declare-fun m!152983 () Bool)

(assert (=> b!130053 m!152983))

(assert (=> d!39293 d!39471))

(declare-fun e!84875 () List!1708)

(declare-fun c!23949 () Bool)

(declare-fun bm!14161 () Bool)

(declare-fun call!14166 () List!1708)

(declare-fun $colon$colon!91 (List!1708 tuple2!2608) List!1708)

(assert (=> bm!14161 (= call!14166 ($colon$colon!91 e!84875 (ite c!23949 (h!2308 (toList!864 lt!67071)) (tuple2!2609 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!23946 () Bool)

(assert (=> bm!14161 (= c!23946 c!23949)))

(declare-fun c!23948 () Bool)

(declare-fun c!23947 () Bool)

(declare-fun b!130074 () Bool)

(assert (=> b!130074 (= e!84875 (ite c!23947 (t!6107 (toList!864 lt!67071)) (ite c!23948 (Cons!1704 (h!2308 (toList!864 lt!67071)) (t!6107 (toList!864 lt!67071))) Nil!1705)))))

(declare-fun b!130075 () Bool)

(declare-fun e!84876 () List!1708)

(declare-fun call!14165 () List!1708)

(assert (=> b!130075 (= e!84876 call!14165)))

(declare-fun e!84878 () Bool)

(declare-fun lt!67646 () List!1708)

(declare-fun b!130076 () Bool)

(assert (=> b!130076 (= e!84878 (contains!890 lt!67646 (tuple2!2609 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130077 () Bool)

(declare-fun res!62768 () Bool)

(assert (=> b!130077 (=> (not res!62768) (not e!84878))))

(assert (=> b!130077 (= res!62768 (containsKey!173 lt!67646 (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130078 () Bool)

(assert (=> b!130078 (= e!84876 call!14165)))

(declare-fun b!130079 () Bool)

(declare-fun e!84874 () List!1708)

(declare-fun call!14164 () List!1708)

(assert (=> b!130079 (= e!84874 call!14164)))

(declare-fun b!130080 () Bool)

(assert (=> b!130080 (= c!23948 (and ((_ is Cons!1704) (toList!864 lt!67071)) (bvsgt (_1!1315 (h!2308 (toList!864 lt!67071))) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> b!130080 (= e!84874 e!84876)))

(declare-fun bm!14163 () Bool)

(assert (=> bm!14163 (= call!14164 call!14166)))

(declare-fun b!130081 () Bool)

(declare-fun e!84877 () List!1708)

(assert (=> b!130081 (= e!84877 e!84874)))

(assert (=> b!130081 (= c!23947 (and ((_ is Cons!1704) (toList!864 lt!67071)) (= (_1!1315 (h!2308 (toList!864 lt!67071))) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun bm!14162 () Bool)

(assert (=> bm!14162 (= call!14165 call!14164)))

(declare-fun d!39473 () Bool)

(assert (=> d!39473 e!84878))

(declare-fun res!62767 () Bool)

(assert (=> d!39473 (=> (not res!62767) (not e!84878))))

(assert (=> d!39473 (= res!62767 (isStrictlySorted!319 lt!67646))))

(assert (=> d!39473 (= lt!67646 e!84877)))

(assert (=> d!39473 (= c!23949 (and ((_ is Cons!1704) (toList!864 lt!67071)) (bvslt (_1!1315 (h!2308 (toList!864 lt!67071))) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39473 (isStrictlySorted!319 (toList!864 lt!67071))))

(assert (=> d!39473 (= (insertStrictlySorted!87 (toList!864 lt!67071) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67646)))

(declare-fun b!130082 () Bool)

(assert (=> b!130082 (= e!84877 call!14166)))

(declare-fun b!130083 () Bool)

(assert (=> b!130083 (= e!84875 (insertStrictlySorted!87 (t!6107 (toList!864 lt!67071)) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (= (and d!39473 c!23949) b!130082))

(assert (= (and d!39473 (not c!23949)) b!130081))

(assert (= (and b!130081 c!23947) b!130079))

(assert (= (and b!130081 (not c!23947)) b!130080))

(assert (= (and b!130080 c!23948) b!130075))

(assert (= (and b!130080 (not c!23948)) b!130078))

(assert (= (or b!130075 b!130078) bm!14162))

(assert (= (or b!130079 bm!14162) bm!14163))

(assert (= (or b!130082 bm!14163) bm!14161))

(assert (= (and bm!14161 c!23946) b!130083))

(assert (= (and bm!14161 (not c!23946)) b!130074))

(assert (= (and d!39473 res!62767) b!130077))

(assert (= (and b!130077 res!62768) b!130076))

(declare-fun m!152985 () Bool)

(assert (=> b!130076 m!152985))

(declare-fun m!152987 () Bool)

(assert (=> b!130077 m!152987))

(declare-fun m!152989 () Bool)

(assert (=> b!130083 m!152989))

(declare-fun m!152991 () Bool)

(assert (=> bm!14161 m!152991))

(declare-fun m!152993 () Bool)

(assert (=> d!39473 m!152993))

(declare-fun m!152995 () Bool)

(assert (=> d!39473 m!152995))

(assert (=> d!39293 d!39473))

(assert (=> b!129525 d!39357))

(declare-fun d!39475 () Bool)

(assert (=> d!39475 (= (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67063)) (v!3165 (getValueByKey!169 (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67063)))))

(assert (=> d!39309 d!39475))

(declare-fun e!84880 () Option!175)

(declare-fun b!130086 () Bool)

(assert (=> b!130086 (= e!84880 (getValueByKey!169 (t!6107 (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) lt!67063))))

(declare-fun b!130084 () Bool)

(declare-fun e!84879 () Option!175)

(assert (=> b!130084 (= e!84879 (Some!174 (_2!1315 (h!2308 (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))))

(declare-fun b!130085 () Bool)

(assert (=> b!130085 (= e!84879 e!84880)))

(declare-fun c!23951 () Bool)

(assert (=> b!130085 (= c!23951 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) (not (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67063))))))

(declare-fun d!39477 () Bool)

(declare-fun c!23950 () Bool)

(assert (=> d!39477 (= c!23950 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67063)))))

(assert (=> d!39477 (= (getValueByKey!169 (toList!864 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67063) e!84879)))

(declare-fun b!130087 () Bool)

(assert (=> b!130087 (= e!84880 None!173)))

(assert (= (and d!39477 c!23950) b!130084))

(assert (= (and d!39477 (not c!23950)) b!130085))

(assert (= (and b!130085 c!23951) b!130086))

(assert (= (and b!130085 (not c!23951)) b!130087))

(declare-fun m!152997 () Bool)

(assert (=> b!130086 m!152997))

(assert (=> d!39309 d!39477))

(declare-fun b!130088 () Bool)

(declare-fun e!84881 () Bool)

(declare-fun e!84882 () Bool)

(assert (=> b!130088 (= e!84881 e!84882)))

(declare-fun c!23952 () Bool)

(assert (=> b!130088 (= c!23952 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!39479 () Bool)

(declare-fun res!62769 () Bool)

(assert (=> d!39479 (=> res!62769 e!84881)))

(assert (=> d!39479 (= res!62769 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39479 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4565 newMap!16) (mask!7102 newMap!16)) e!84881)))

(declare-fun b!130089 () Bool)

(declare-fun e!84883 () Bool)

(declare-fun call!14167 () Bool)

(assert (=> b!130089 (= e!84883 call!14167)))

(declare-fun bm!14164 () Bool)

(assert (=> bm!14164 (= call!14167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun b!130090 () Bool)

(assert (=> b!130090 (= e!84882 e!84883)))

(declare-fun lt!67647 () (_ BitVec 64))

(assert (=> b!130090 (= lt!67647 (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!67648 () Unit!4039)

(assert (=> b!130090 (= lt!67648 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4565 newMap!16) lt!67647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!130090 (arrayContainsKey!0 (_keys!4565 newMap!16) lt!67647 #b00000000000000000000000000000000)))

(declare-fun lt!67649 () Unit!4039)

(assert (=> b!130090 (= lt!67649 lt!67648)))

(declare-fun res!62770 () Bool)

(assert (=> b!130090 (= res!62770 (= (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4565 newMap!16) (mask!7102 newMap!16)) (Found!272 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!130090 (=> (not res!62770) (not e!84883))))

(declare-fun b!130091 () Bool)

(assert (=> b!130091 (= e!84882 call!14167)))

(assert (= (and d!39479 (not res!62769)) b!130088))

(assert (= (and b!130088 c!23952) b!130090))

(assert (= (and b!130088 (not c!23952)) b!130091))

(assert (= (and b!130090 res!62770) b!130089))

(assert (= (or b!130089 b!130091) bm!14164))

(declare-fun m!152999 () Bool)

(assert (=> b!130088 m!152999))

(assert (=> b!130088 m!152999))

(declare-fun m!153001 () Bool)

(assert (=> b!130088 m!153001))

(declare-fun m!153003 () Bool)

(assert (=> bm!14164 m!153003))

(assert (=> b!130090 m!152999))

(declare-fun m!153005 () Bool)

(assert (=> b!130090 m!153005))

(declare-fun m!153007 () Bool)

(assert (=> b!130090 m!153007))

(assert (=> b!130090 m!152999))

(declare-fun m!153009 () Bool)

(assert (=> b!130090 m!153009))

(assert (=> bm!14123 d!39479))

(declare-fun b!130104 () Bool)

(declare-fun e!84892 () SeekEntryResult!272)

(assert (=> b!130104 (= e!84892 Undefined!272)))

(declare-fun b!130105 () Bool)

(declare-fun e!84891 () SeekEntryResult!272)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!130105 (= e!84891 (seekKeyOrZeroReturnVacant!0 (bvadd (x!15267 lt!67352) #b00000000000000000000000000000001) (nextIndex!0 (index!3247 lt!67352) (x!15267 lt!67352) (mask!7102 newMap!16)) (index!3247 lt!67352) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun b!130106 () Bool)

(declare-fun c!23960 () Bool)

(declare-fun lt!67655 () (_ BitVec 64))

(assert (=> b!130106 (= c!23960 (= lt!67655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84890 () SeekEntryResult!272)

(assert (=> b!130106 (= e!84890 e!84891)))

(declare-fun b!130107 () Bool)

(assert (=> b!130107 (= e!84891 (MissingVacant!272 (index!3247 lt!67352)))))

(declare-fun b!130108 () Bool)

(assert (=> b!130108 (= e!84890 (Found!272 (index!3247 lt!67352)))))

(declare-fun d!39481 () Bool)

(declare-fun lt!67654 () SeekEntryResult!272)

(assert (=> d!39481 (and (or ((_ is Undefined!272) lt!67654) (not ((_ is Found!272) lt!67654)) (and (bvsge (index!3246 lt!67654) #b00000000000000000000000000000000) (bvslt (index!3246 lt!67654) (size!2509 (_keys!4565 newMap!16))))) (or ((_ is Undefined!272) lt!67654) ((_ is Found!272) lt!67654) (not ((_ is MissingVacant!272) lt!67654)) (not (= (index!3248 lt!67654) (index!3247 lt!67352))) (and (bvsge (index!3248 lt!67654) #b00000000000000000000000000000000) (bvslt (index!3248 lt!67654) (size!2509 (_keys!4565 newMap!16))))) (or ((_ is Undefined!272) lt!67654) (ite ((_ is Found!272) lt!67654) (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67654)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (and ((_ is MissingVacant!272) lt!67654) (= (index!3248 lt!67654) (index!3247 lt!67352)) (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3248 lt!67654)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!39481 (= lt!67654 e!84892)))

(declare-fun c!23959 () Bool)

(assert (=> d!39481 (= c!23959 (bvsge (x!15267 lt!67352) #b01111111111111111111111111111110))))

(assert (=> d!39481 (= lt!67655 (select (arr!2243 (_keys!4565 newMap!16)) (index!3247 lt!67352)))))

(assert (=> d!39481 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39481 (= (seekKeyOrZeroReturnVacant!0 (x!15267 lt!67352) (index!3247 lt!67352) (index!3247 lt!67352) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)) lt!67654)))

(declare-fun b!130109 () Bool)

(assert (=> b!130109 (= e!84892 e!84890)))

(declare-fun c!23961 () Bool)

(assert (=> b!130109 (= c!23961 (= lt!67655 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39481 c!23959) b!130104))

(assert (= (and d!39481 (not c!23959)) b!130109))

(assert (= (and b!130109 c!23961) b!130108))

(assert (= (and b!130109 (not c!23961)) b!130106))

(assert (= (and b!130106 c!23960) b!130107))

(assert (= (and b!130106 (not c!23960)) b!130105))

(declare-fun m!153011 () Bool)

(assert (=> b!130105 m!153011))

(assert (=> b!130105 m!153011))

(assert (=> b!130105 m!151769))

(declare-fun m!153013 () Bool)

(assert (=> b!130105 m!153013))

(declare-fun m!153015 () Bool)

(assert (=> d!39481 m!153015))

(declare-fun m!153017 () Bool)

(assert (=> d!39481 m!153017))

(assert (=> d!39481 m!152189))

(assert (=> d!39481 m!151983))

(assert (=> b!129678 d!39481))

(declare-fun d!39483 () Bool)

(assert (=> d!39483 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!67656 () Unit!4039)

(assert (=> d!39483 (= lt!67656 (choose!789 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84893 () Bool)

(assert (=> d!39483 e!84893))

(declare-fun res!62771 () Bool)

(assert (=> d!39483 (=> (not res!62771) (not e!84893))))

(assert (=> d!39483 (= res!62771 (isStrictlySorted!319 (toList!864 lt!67067)))))

(assert (=> d!39483 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000) lt!67656)))

(declare-fun b!130110 () Bool)

(assert (=> b!130110 (= e!84893 (containsKey!173 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39483 res!62771) b!130110))

(assert (=> d!39483 m!152207))

(assert (=> d!39483 m!152207))

(assert (=> d!39483 m!152209))

(declare-fun m!153019 () Bool)

(assert (=> d!39483 m!153019))

(declare-fun m!153021 () Bool)

(assert (=> d!39483 m!153021))

(assert (=> b!130110 m!152203))

(assert (=> b!129679 d!39483))

(declare-fun d!39485 () Bool)

(assert (=> d!39485 (= (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!403 (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5395 () Bool)

(assert (= bs!5395 d!39485))

(assert (=> bs!5395 m!152207))

(declare-fun m!153023 () Bool)

(assert (=> bs!5395 m!153023))

(assert (=> b!129679 d!39485))

(declare-fun b!130113 () Bool)

(declare-fun e!84895 () Option!175)

(assert (=> b!130113 (= e!84895 (getValueByKey!169 (t!6107 (toList!864 lt!67067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130111 () Bool)

(declare-fun e!84894 () Option!175)

(assert (=> b!130111 (= e!84894 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67067)))))))

(declare-fun b!130112 () Bool)

(assert (=> b!130112 (= e!84894 e!84895)))

(declare-fun c!23963 () Bool)

(assert (=> b!130112 (= c!23963 (and ((_ is Cons!1704) (toList!864 lt!67067)) (not (= (_1!1315 (h!2308 (toList!864 lt!67067))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!39487 () Bool)

(declare-fun c!23962 () Bool)

(assert (=> d!39487 (= c!23962 (and ((_ is Cons!1704) (toList!864 lt!67067)) (= (_1!1315 (h!2308 (toList!864 lt!67067))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39487 (= (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000) e!84894)))

(declare-fun b!130114 () Bool)

(assert (=> b!130114 (= e!84895 None!173)))

(assert (= (and d!39487 c!23962) b!130111))

(assert (= (and d!39487 (not c!23962)) b!130112))

(assert (= (and b!130112 c!23963) b!130113))

(assert (= (and b!130112 (not c!23963)) b!130114))

(declare-fun m!153025 () Bool)

(assert (=> b!130113 m!153025))

(assert (=> b!129679 d!39487))

(declare-fun d!39489 () Bool)

(declare-fun e!84896 () Bool)

(assert (=> d!39489 e!84896))

(declare-fun res!62772 () Bool)

(assert (=> d!39489 (=> res!62772 e!84896)))

(declare-fun lt!67660 () Bool)

(assert (=> d!39489 (= res!62772 (not lt!67660))))

(declare-fun lt!67659 () Bool)

(assert (=> d!39489 (= lt!67660 lt!67659)))

(declare-fun lt!67658 () Unit!4039)

(declare-fun e!84897 () Unit!4039)

(assert (=> d!39489 (= lt!67658 e!84897)))

(declare-fun c!23964 () Bool)

(assert (=> d!39489 (= c!23964 lt!67659)))

(assert (=> d!39489 (= lt!67659 (containsKey!173 (toList!864 lt!67412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39489 (= (contains!889 lt!67412 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67660)))

(declare-fun b!130115 () Bool)

(declare-fun lt!67657 () Unit!4039)

(assert (=> b!130115 (= e!84897 lt!67657)))

(assert (=> b!130115 (= lt!67657 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130115 (isDefined!122 (getValueByKey!169 (toList!864 lt!67412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130116 () Bool)

(declare-fun Unit!4068 () Unit!4039)

(assert (=> b!130116 (= e!84897 Unit!4068)))

(declare-fun b!130117 () Bool)

(assert (=> b!130117 (= e!84896 (isDefined!122 (getValueByKey!169 (toList!864 lt!67412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39489 c!23964) b!130115))

(assert (= (and d!39489 (not c!23964)) b!130116))

(assert (= (and d!39489 (not res!62772)) b!130117))

(declare-fun m!153027 () Bool)

(assert (=> d!39489 m!153027))

(declare-fun m!153029 () Bool)

(assert (=> b!130115 m!153029))

(declare-fun m!153031 () Bool)

(assert (=> b!130115 m!153031))

(assert (=> b!130115 m!153031))

(declare-fun m!153033 () Bool)

(assert (=> b!130115 m!153033))

(assert (=> b!130117 m!153031))

(assert (=> b!130117 m!153031))

(assert (=> b!130117 m!153033))

(assert (=> bm!14109 d!39489))

(declare-fun d!39491 () Bool)

(assert (=> d!39491 (= (inRange!0 (ite c!23844 (index!3246 lt!67313) (ite c!23843 (index!3245 lt!67331) (index!3248 lt!67331))) (mask!7102 newMap!16)) (and (bvsge (ite c!23844 (index!3246 lt!67313) (ite c!23843 (index!3245 lt!67331) (index!3248 lt!67331))) #b00000000000000000000000000000000) (bvslt (ite c!23844 (index!3246 lt!67313) (ite c!23843 (index!3245 lt!67331) (index!3248 lt!67331))) (bvadd (mask!7102 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14102 d!39491))

(declare-fun d!39493 () Bool)

(assert (=> d!39493 (= (get!1466 (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3165 (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39263 d!39493))

(declare-fun b!130120 () Bool)

(declare-fun e!84899 () Option!175)

(assert (=> b!130120 (= e!84899 (getValueByKey!169 (t!6107 (toList!864 lt!67067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130118 () Bool)

(declare-fun e!84898 () Option!175)

(assert (=> b!130118 (= e!84898 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67067)))))))

(declare-fun b!130119 () Bool)

(assert (=> b!130119 (= e!84898 e!84899)))

(declare-fun c!23966 () Bool)

(assert (=> b!130119 (= c!23966 (and ((_ is Cons!1704) (toList!864 lt!67067)) (not (= (_1!1315 (h!2308 (toList!864 lt!67067))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!39495 () Bool)

(declare-fun c!23965 () Bool)

(assert (=> d!39495 (= c!23965 (and ((_ is Cons!1704) (toList!864 lt!67067)) (= (_1!1315 (h!2308 (toList!864 lt!67067))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39495 (= (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000) e!84898)))

(declare-fun b!130121 () Bool)

(assert (=> b!130121 (= e!84899 None!173)))

(assert (= (and d!39495 c!23965) b!130118))

(assert (= (and d!39495 (not c!23965)) b!130119))

(assert (= (and b!130119 c!23966) b!130120))

(assert (= (and b!130119 (not c!23966)) b!130121))

(declare-fun m!153035 () Bool)

(assert (=> b!130120 m!153035))

(assert (=> d!39263 d!39495))

(declare-fun d!39497 () Bool)

(declare-fun res!62773 () Bool)

(declare-fun e!84900 () Bool)

(assert (=> d!39497 (=> res!62773 e!84900)))

(assert (=> d!39497 (= res!62773 (and ((_ is Cons!1704) (toList!864 lt!67067)) (= (_1!1315 (h!2308 (toList!864 lt!67067))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39497 (= (containsKey!173 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000) e!84900)))

(declare-fun b!130122 () Bool)

(declare-fun e!84901 () Bool)

(assert (=> b!130122 (= e!84900 e!84901)))

(declare-fun res!62774 () Bool)

(assert (=> b!130122 (=> (not res!62774) (not e!84901))))

(assert (=> b!130122 (= res!62774 (and (or (not ((_ is Cons!1704) (toList!864 lt!67067))) (bvsle (_1!1315 (h!2308 (toList!864 lt!67067))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1704) (toList!864 lt!67067)) (bvslt (_1!1315 (h!2308 (toList!864 lt!67067))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130123 () Bool)

(assert (=> b!130123 (= e!84901 (containsKey!173 (t!6107 (toList!864 lt!67067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39497 (not res!62773)) b!130122))

(assert (= (and b!130122 res!62774) b!130123))

(declare-fun m!153037 () Bool)

(assert (=> b!130123 m!153037))

(assert (=> d!39323 d!39497))

(declare-fun d!39499 () Bool)

(assert (=> d!39499 (= (get!1464 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3161 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129608 d!39499))

(declare-fun b!130124 () Bool)

(declare-fun e!84904 () Bool)

(assert (=> b!130124 (= e!84904 (contains!891 (ite c!23888 (Cons!1705 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) Nil!1706) Nil!1706) (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!130125 () Bool)

(declare-fun e!84903 () Bool)

(declare-fun e!84902 () Bool)

(assert (=> b!130125 (= e!84903 e!84902)))

(declare-fun c!23967 () Bool)

(assert (=> b!130125 (= c!23967 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!39501 () Bool)

(declare-fun res!62777 () Bool)

(declare-fun e!84905 () Bool)

(assert (=> d!39501 (=> res!62777 e!84905)))

(assert (=> d!39501 (= res!62777 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39501 (= (arrayNoDuplicates!0 (_keys!4565 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23888 (Cons!1705 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) Nil!1706) Nil!1706)) e!84905)))

(declare-fun b!130126 () Bool)

(declare-fun call!14168 () Bool)

(assert (=> b!130126 (= e!84902 call!14168)))

(declare-fun b!130127 () Bool)

(assert (=> b!130127 (= e!84905 e!84903)))

(declare-fun res!62776 () Bool)

(assert (=> b!130127 (=> (not res!62776) (not e!84903))))

(assert (=> b!130127 (= res!62776 (not e!84904))))

(declare-fun res!62775 () Bool)

(assert (=> b!130127 (=> (not res!62775) (not e!84904))))

(assert (=> b!130127 (= res!62775 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!14165 () Bool)

(assert (=> bm!14165 (= call!14168 (arrayNoDuplicates!0 (_keys!4565 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!23967 (Cons!1705 (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!23888 (Cons!1705 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) Nil!1706) Nil!1706)) (ite c!23888 (Cons!1705 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) Nil!1706) Nil!1706))))))

(declare-fun b!130128 () Bool)

(assert (=> b!130128 (= e!84902 call!14168)))

(assert (= (and d!39501 (not res!62777)) b!130127))

(assert (= (and b!130127 res!62775) b!130124))

(assert (= (and b!130127 res!62776) b!130125))

(assert (= (and b!130125 c!23967) b!130126))

(assert (= (and b!130125 (not c!23967)) b!130128))

(assert (= (or b!130126 b!130128) bm!14165))

(assert (=> b!130124 m!152999))

(assert (=> b!130124 m!152999))

(declare-fun m!153039 () Bool)

(assert (=> b!130124 m!153039))

(assert (=> b!130125 m!152999))

(assert (=> b!130125 m!152999))

(assert (=> b!130125 m!153001))

(assert (=> b!130127 m!152999))

(assert (=> b!130127 m!152999))

(assert (=> b!130127 m!153001))

(assert (=> bm!14165 m!152999))

(declare-fun m!153041 () Bool)

(assert (=> bm!14165 m!153041))

(assert (=> bm!14126 d!39501))

(declare-fun d!39503 () Bool)

(assert (=> d!39503 (= (inRange!0 (index!3246 lt!67192) (mask!7102 newMap!16)) (and (bvsge (index!3246 lt!67192) #b00000000000000000000000000000000) (bvslt (index!3246 lt!67192) (bvadd (mask!7102 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!129514 d!39503))

(declare-fun bm!14166 () Bool)

(declare-fun call!14169 () (_ BitVec 32))

(assert (=> bm!14166 (= call!14169 (arrayCountValidKeys!0 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!130129 () Bool)

(declare-fun e!84907 () (_ BitVec 32))

(assert (=> b!130129 (= e!84907 (bvadd #b00000000000000000000000000000001 call!14169))))

(declare-fun d!39505 () Bool)

(declare-fun lt!67661 () (_ BitVec 32))

(assert (=> d!39505 (and (bvsge lt!67661 #b00000000000000000000000000000000) (bvsle lt!67661 (bvsub (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!84906 () (_ BitVec 32))

(assert (=> d!39505 (= lt!67661 e!84906)))

(declare-fun c!23968 () Bool)

(assert (=> d!39505 (= c!23968 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> d!39505 (and (bvsle #b00000000000000000000000000000000 (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> d!39505 (= (arrayCountValidKeys!0 (_keys!4565 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000 (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))) lt!67661)))

(declare-fun b!130130 () Bool)

(assert (=> b!130130 (= e!84907 call!14169)))

(declare-fun b!130131 () Bool)

(assert (=> b!130131 (= e!84906 e!84907)))

(declare-fun c!23969 () Bool)

(assert (=> b!130131 (= c!23969 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!130132 () Bool)

(assert (=> b!130132 (= e!84906 #b00000000000000000000000000000000)))

(assert (= (and d!39505 c!23968) b!130132))

(assert (= (and d!39505 (not c!23968)) b!130131))

(assert (= (and b!130131 c!23969) b!130129))

(assert (= (and b!130131 (not c!23969)) b!130130))

(assert (= (or b!130129 b!130130) bm!14166))

(declare-fun m!153043 () Bool)

(assert (=> bm!14166 m!153043))

(declare-fun m!153045 () Bool)

(assert (=> b!130131 m!153045))

(assert (=> b!130131 m!153045))

(declare-fun m!153047 () Bool)

(assert (=> b!130131 m!153047))

(assert (=> b!129605 d!39505))

(declare-fun d!39507 () Bool)

(declare-fun e!84908 () Bool)

(assert (=> d!39507 e!84908))

(declare-fun res!62778 () Bool)

(assert (=> d!39507 (=> res!62778 e!84908)))

(declare-fun lt!67665 () Bool)

(assert (=> d!39507 (= res!62778 (not lt!67665))))

(declare-fun lt!67664 () Bool)

(assert (=> d!39507 (= lt!67665 lt!67664)))

(declare-fun lt!67663 () Unit!4039)

(declare-fun e!84909 () Unit!4039)

(assert (=> d!39507 (= lt!67663 e!84909)))

(declare-fun c!23970 () Bool)

(assert (=> d!39507 (= c!23970 lt!67664)))

(assert (=> d!39507 (= lt!67664 (containsKey!173 (toList!864 lt!67434) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39507 (= (contains!889 lt!67434 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67665)))

(declare-fun b!130133 () Bool)

(declare-fun lt!67662 () Unit!4039)

(assert (=> b!130133 (= e!84909 lt!67662)))

(assert (=> b!130133 (= lt!67662 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67434) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130133 (isDefined!122 (getValueByKey!169 (toList!864 lt!67434) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130134 () Bool)

(declare-fun Unit!4069 () Unit!4039)

(assert (=> b!130134 (= e!84909 Unit!4069)))

(declare-fun b!130135 () Bool)

(assert (=> b!130135 (= e!84908 (isDefined!122 (getValueByKey!169 (toList!864 lt!67434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39507 c!23970) b!130133))

(assert (= (and d!39507 (not c!23970)) b!130134))

(assert (= (and d!39507 (not res!62778)) b!130135))

(declare-fun m!153049 () Bool)

(assert (=> d!39507 m!153049))

(declare-fun m!153051 () Bool)

(assert (=> b!130133 m!153051))

(declare-fun m!153053 () Bool)

(assert (=> b!130133 m!153053))

(assert (=> b!130133 m!153053))

(declare-fun m!153055 () Bool)

(assert (=> b!130133 m!153055))

(assert (=> b!130135 m!153053))

(assert (=> b!130135 m!153053))

(assert (=> b!130135 m!153055))

(assert (=> bm!14116 d!39507))

(declare-fun b!130138 () Bool)

(declare-fun e!84911 () Option!175)

(assert (=> b!130138 (= e!84911 (getValueByKey!169 (t!6107 (toList!864 lt!67372)) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130136 () Bool)

(declare-fun e!84910 () Option!175)

(assert (=> b!130136 (= e!84910 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67372)))))))

(declare-fun b!130137 () Bool)

(assert (=> b!130137 (= e!84910 e!84911)))

(declare-fun c!23972 () Bool)

(assert (=> b!130137 (= c!23972 (and ((_ is Cons!1704) (toList!864 lt!67372)) (not (= (_1!1315 (h!2308 (toList!864 lt!67372))) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun d!39509 () Bool)

(declare-fun c!23971 () Bool)

(assert (=> d!39509 (= c!23971 (and ((_ is Cons!1704) (toList!864 lt!67372)) (= (_1!1315 (h!2308 (toList!864 lt!67372))) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39509 (= (getValueByKey!169 (toList!864 lt!67372) (_1!1315 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!84910)))

(declare-fun b!130139 () Bool)

(assert (=> b!130139 (= e!84911 None!173)))

(assert (= (and d!39509 c!23971) b!130136))

(assert (= (and d!39509 (not c!23971)) b!130137))

(assert (= (and b!130137 c!23972) b!130138))

(assert (= (and b!130137 (not c!23972)) b!130139))

(declare-fun m!153057 () Bool)

(assert (=> b!130138 m!153057))

(assert (=> b!129706 d!39509))

(declare-fun d!39511 () Bool)

(declare-fun e!84912 () Bool)

(assert (=> d!39511 e!84912))

(declare-fun res!62779 () Bool)

(assert (=> d!39511 (=> (not res!62779) (not e!84912))))

(declare-fun lt!67667 () ListLongMap!1697)

(assert (=> d!39511 (= res!62779 (contains!889 lt!67667 (_1!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67668 () List!1708)

(assert (=> d!39511 (= lt!67667 (ListLongMap!1698 lt!67668))))

(declare-fun lt!67669 () Unit!4039)

(declare-fun lt!67666 () Unit!4039)

(assert (=> d!39511 (= lt!67669 lt!67666)))

(assert (=> d!39511 (= (getValueByKey!169 lt!67668 (_1!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39511 (= lt!67666 (lemmaContainsTupThenGetReturnValue!84 lt!67668 (_1!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39511 (= lt!67668 (insertStrictlySorted!87 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (_1!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39511 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67667)))

(declare-fun b!130140 () Bool)

(declare-fun res!62780 () Bool)

(assert (=> b!130140 (=> (not res!62780) (not e!84912))))

(assert (=> b!130140 (= res!62780 (= (getValueByKey!169 (toList!864 lt!67667) (_1!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130141 () Bool)

(assert (=> b!130141 (= e!84912 (contains!890 (toList!864 lt!67667) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39511 res!62779) b!130140))

(assert (= (and b!130140 res!62780) b!130141))

(declare-fun m!153059 () Bool)

(assert (=> d!39511 m!153059))

(declare-fun m!153061 () Bool)

(assert (=> d!39511 m!153061))

(declare-fun m!153063 () Bool)

(assert (=> d!39511 m!153063))

(declare-fun m!153065 () Bool)

(assert (=> d!39511 m!153065))

(declare-fun m!153067 () Bool)

(assert (=> b!130140 m!153067))

(declare-fun m!153069 () Bool)

(assert (=> b!130141 m!153069))

(assert (=> d!39273 d!39511))

(assert (=> d!39273 d!39327))

(declare-fun d!39513 () Bool)

(assert (=> d!39513 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67172 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(assert (=> d!39513 true))

(declare-fun _$7!113 () Unit!4039)

(assert (=> d!39513 (= (choose!788 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) lt!67172 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) (defaultEntry!2824 newMap!16)) _$7!113)))

(declare-fun bs!5396 () Bool)

(assert (= bs!5396 d!39513))

(assert (=> bs!5396 m!151839))

(assert (=> bs!5396 m!151839))

(assert (=> bs!5396 m!152183))

(assert (=> bs!5396 m!151767))

(assert (=> bs!5396 m!152185))

(assert (=> d!39273 d!39513))

(assert (=> d!39273 d!39457))

(declare-fun b!130142 () Bool)

(declare-fun e!84923 () Bool)

(declare-fun lt!67676 () ListLongMap!1697)

(assert (=> b!130142 (= e!84923 (= (apply!113 lt!67676 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (_values!2807 newMap!16))))))

(assert (=> b!130142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130143 () Bool)

(declare-fun e!84915 () Bool)

(declare-fun e!84922 () Bool)

(assert (=> b!130143 (= e!84915 e!84922)))

(declare-fun res!62787 () Bool)

(declare-fun call!14174 () Bool)

(assert (=> b!130143 (= res!62787 call!14174)))

(assert (=> b!130143 (=> (not res!62787) (not e!84922))))

(declare-fun b!130144 () Bool)

(declare-fun e!84924 () Bool)

(declare-fun call!14175 () Bool)

(assert (=> b!130144 (= e!84924 (not call!14175))))

(declare-fun bm!14167 () Bool)

(assert (=> bm!14167 (= call!14175 (contains!889 lt!67676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130145 () Bool)

(declare-fun e!84925 () Unit!4039)

(declare-fun lt!67686 () Unit!4039)

(assert (=> b!130145 (= e!84925 lt!67686)))

(declare-fun lt!67688 () ListLongMap!1697)

(assert (=> b!130145 (= lt!67688 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67172 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67684 () (_ BitVec 64))

(assert (=> b!130145 (= lt!67684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67677 () (_ BitVec 64))

(assert (=> b!130145 (= lt!67677 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67683 () Unit!4039)

(assert (=> b!130145 (= lt!67683 (addStillContains!89 lt!67688 lt!67684 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!67677))))

(assert (=> b!130145 (contains!889 (+!172 lt!67688 (tuple2!2609 lt!67684 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67677)))

(declare-fun lt!67690 () Unit!4039)

(assert (=> b!130145 (= lt!67690 lt!67683)))

(declare-fun lt!67678 () ListLongMap!1697)

(assert (=> b!130145 (= lt!67678 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67172 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67681 () (_ BitVec 64))

(assert (=> b!130145 (= lt!67681 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67672 () (_ BitVec 64))

(assert (=> b!130145 (= lt!67672 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67687 () Unit!4039)

(assert (=> b!130145 (= lt!67687 (addApplyDifferent!89 lt!67678 lt!67681 (minValue!2683 newMap!16) lt!67672))))

(assert (=> b!130145 (= (apply!113 (+!172 lt!67678 (tuple2!2609 lt!67681 (minValue!2683 newMap!16))) lt!67672) (apply!113 lt!67678 lt!67672))))

(declare-fun lt!67685 () Unit!4039)

(assert (=> b!130145 (= lt!67685 lt!67687)))

(declare-fun lt!67670 () ListLongMap!1697)

(assert (=> b!130145 (= lt!67670 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67172 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67673 () (_ BitVec 64))

(assert (=> b!130145 (= lt!67673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67674 () (_ BitVec 64))

(assert (=> b!130145 (= lt!67674 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67671 () Unit!4039)

(assert (=> b!130145 (= lt!67671 (addApplyDifferent!89 lt!67670 lt!67673 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!67674))))

(assert (=> b!130145 (= (apply!113 (+!172 lt!67670 (tuple2!2609 lt!67673 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67674) (apply!113 lt!67670 lt!67674))))

(declare-fun lt!67682 () Unit!4039)

(assert (=> b!130145 (= lt!67682 lt!67671)))

(declare-fun lt!67680 () ListLongMap!1697)

(assert (=> b!130145 (= lt!67680 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67172 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67689 () (_ BitVec 64))

(assert (=> b!130145 (= lt!67689 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67675 () (_ BitVec 64))

(assert (=> b!130145 (= lt!67675 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130145 (= lt!67686 (addApplyDifferent!89 lt!67680 lt!67689 (minValue!2683 newMap!16) lt!67675))))

(assert (=> b!130145 (= (apply!113 (+!172 lt!67680 (tuple2!2609 lt!67689 (minValue!2683 newMap!16))) lt!67675) (apply!113 lt!67680 lt!67675))))

(declare-fun b!130146 () Bool)

(declare-fun res!62789 () Bool)

(declare-fun e!84916 () Bool)

(assert (=> b!130146 (=> (not res!62789) (not e!84916))))

(assert (=> b!130146 (= res!62789 e!84924)))

(declare-fun c!23974 () Bool)

(assert (=> b!130146 (= c!23974 (not (= (bvand lt!67172 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130147 () Bool)

(declare-fun e!84913 () ListLongMap!1697)

(declare-fun call!14173 () ListLongMap!1697)

(assert (=> b!130147 (= e!84913 call!14173)))

(declare-fun b!130148 () Bool)

(declare-fun res!62788 () Bool)

(assert (=> b!130148 (=> (not res!62788) (not e!84916))))

(declare-fun e!84917 () Bool)

(assert (=> b!130148 (= res!62788 e!84917)))

(declare-fun res!62784 () Bool)

(assert (=> b!130148 (=> res!62784 e!84917)))

(declare-fun e!84914 () Bool)

(assert (=> b!130148 (= res!62784 (not e!84914))))

(declare-fun res!62782 () Bool)

(assert (=> b!130148 (=> (not res!62782) (not e!84914))))

(assert (=> b!130148 (= res!62782 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun bm!14168 () Bool)

(declare-fun call!14171 () ListLongMap!1697)

(declare-fun call!14170 () ListLongMap!1697)

(assert (=> bm!14168 (= call!14171 call!14170)))

(declare-fun d!39515 () Bool)

(assert (=> d!39515 e!84916))

(declare-fun res!62785 () Bool)

(assert (=> d!39515 (=> (not res!62785) (not e!84916))))

(assert (=> d!39515 (= res!62785 (or (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun lt!67691 () ListLongMap!1697)

(assert (=> d!39515 (= lt!67676 lt!67691)))

(declare-fun lt!67679 () Unit!4039)

(assert (=> d!39515 (= lt!67679 e!84925)))

(declare-fun c!23975 () Bool)

(declare-fun e!84920 () Bool)

(assert (=> d!39515 (= c!23975 e!84920)))

(declare-fun res!62786 () Bool)

(assert (=> d!39515 (=> (not res!62786) (not e!84920))))

(assert (=> d!39515 (= res!62786 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun e!84918 () ListLongMap!1697)

(assert (=> d!39515 (= lt!67691 e!84918)))

(declare-fun c!23976 () Bool)

(assert (=> d!39515 (= c!23976 (and (not (= (bvand lt!67172 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!67172 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39515 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39515 (= (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67172 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67676)))

(declare-fun b!130149 () Bool)

(assert (=> b!130149 (= e!84920 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130150 () Bool)

(declare-fun e!84921 () ListLongMap!1697)

(declare-fun call!14176 () ListLongMap!1697)

(assert (=> b!130150 (= e!84921 call!14176)))

(declare-fun bm!14169 () Bool)

(assert (=> bm!14169 (= call!14174 (contains!889 lt!67676 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130151 () Bool)

(assert (=> b!130151 (= e!84917 e!84923)))

(declare-fun res!62783 () Bool)

(assert (=> b!130151 (=> (not res!62783) (not e!84923))))

(assert (=> b!130151 (= res!62783 (contains!889 lt!67676 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130152 () Bool)

(declare-fun c!23978 () Bool)

(assert (=> b!130152 (= c!23978 (and (not (= (bvand lt!67172 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!67172 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130152 (= e!84921 e!84913)))

(declare-fun b!130153 () Bool)

(assert (=> b!130153 (= e!84916 e!84915)))

(declare-fun c!23973 () Bool)

(assert (=> b!130153 (= c!23973 (not (= (bvand lt!67172 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130154 () Bool)

(declare-fun Unit!4070 () Unit!4039)

(assert (=> b!130154 (= e!84925 Unit!4070)))

(declare-fun bm!14170 () Bool)

(assert (=> bm!14170 (= call!14170 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67172 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!130155 () Bool)

(assert (=> b!130155 (= e!84918 e!84921)))

(declare-fun c!23977 () Bool)

(assert (=> b!130155 (= c!23977 (and (not (= (bvand lt!67172 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!67172 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!14172 () ListLongMap!1697)

(declare-fun bm!14171 () Bool)

(assert (=> bm!14171 (= call!14172 (+!172 (ite c!23976 call!14170 (ite c!23977 call!14171 call!14173)) (ite (or c!23976 c!23977) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun b!130156 () Bool)

(assert (=> b!130156 (= e!84914 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130157 () Bool)

(assert (=> b!130157 (= e!84922 (= (apply!113 lt!67676 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 newMap!16)))))

(declare-fun b!130158 () Bool)

(declare-fun e!84919 () Bool)

(assert (=> b!130158 (= e!84924 e!84919)))

(declare-fun res!62781 () Bool)

(assert (=> b!130158 (= res!62781 call!14175)))

(assert (=> b!130158 (=> (not res!62781) (not e!84919))))

(declare-fun bm!14172 () Bool)

(assert (=> bm!14172 (= call!14173 call!14171)))

(declare-fun bm!14173 () Bool)

(assert (=> bm!14173 (= call!14176 call!14172)))

(declare-fun b!130159 () Bool)

(assert (=> b!130159 (= e!84913 call!14176)))

(declare-fun b!130160 () Bool)

(assert (=> b!130160 (= e!84919 (= (apply!113 lt!67676 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130161 () Bool)

(assert (=> b!130161 (= e!84918 (+!172 call!14172 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(declare-fun b!130162 () Bool)

(assert (=> b!130162 (= e!84915 (not call!14174))))

(assert (= (and d!39515 c!23976) b!130161))

(assert (= (and d!39515 (not c!23976)) b!130155))

(assert (= (and b!130155 c!23977) b!130150))

(assert (= (and b!130155 (not c!23977)) b!130152))

(assert (= (and b!130152 c!23978) b!130159))

(assert (= (and b!130152 (not c!23978)) b!130147))

(assert (= (or b!130159 b!130147) bm!14172))

(assert (= (or b!130150 bm!14172) bm!14168))

(assert (= (or b!130150 b!130159) bm!14173))

(assert (= (or b!130161 bm!14168) bm!14170))

(assert (= (or b!130161 bm!14173) bm!14171))

(assert (= (and d!39515 res!62786) b!130149))

(assert (= (and d!39515 c!23975) b!130145))

(assert (= (and d!39515 (not c!23975)) b!130154))

(assert (= (and d!39515 res!62785) b!130148))

(assert (= (and b!130148 res!62782) b!130156))

(assert (= (and b!130148 (not res!62784)) b!130151))

(assert (= (and b!130151 res!62783) b!130142))

(assert (= (and b!130148 res!62788) b!130146))

(assert (= (and b!130146 c!23974) b!130158))

(assert (= (and b!130146 (not c!23974)) b!130144))

(assert (= (and b!130158 res!62781) b!130160))

(assert (= (or b!130158 b!130144) bm!14167))

(assert (= (and b!130146 res!62789) b!130153))

(assert (= (and b!130153 c!23973) b!130143))

(assert (= (and b!130153 (not c!23973)) b!130162))

(assert (= (and b!130143 res!62787) b!130157))

(assert (= (or b!130143 b!130162) bm!14169))

(declare-fun b_lambda!5779 () Bool)

(assert (=> (not b_lambda!5779) (not b!130142)))

(assert (=> b!130142 t!6114))

(declare-fun b_and!8059 () Bool)

(assert (= b_and!8055 (and (=> t!6114 result!3921) b_and!8059)))

(assert (=> b!130142 t!6116))

(declare-fun b_and!8061 () Bool)

(assert (= b_and!8057 (and (=> t!6116 result!3923) b_and!8061)))

(assert (=> bm!14170 m!151767))

(declare-fun m!153071 () Bool)

(assert (=> bm!14170 m!153071))

(declare-fun m!153073 () Bool)

(assert (=> bm!14169 m!153073))

(declare-fun m!153075 () Bool)

(assert (=> bm!14171 m!153075))

(assert (=> b!130142 m!152357))

(assert (=> b!130142 m!152009))

(assert (=> b!130142 m!152359))

(assert (=> b!130142 m!152013))

(assert (=> b!130142 m!152013))

(declare-fun m!153077 () Bool)

(assert (=> b!130142 m!153077))

(assert (=> b!130142 m!152357))

(assert (=> b!130142 m!152009))

(declare-fun m!153079 () Bool)

(assert (=> b!130160 m!153079))

(assert (=> b!130156 m!152013))

(assert (=> b!130156 m!152013))

(assert (=> b!130156 m!152019))

(assert (=> b!130149 m!152013))

(assert (=> b!130149 m!152013))

(assert (=> b!130149 m!152019))

(assert (=> d!39515 m!151983))

(declare-fun m!153081 () Bool)

(assert (=> b!130157 m!153081))

(declare-fun m!153083 () Bool)

(assert (=> b!130161 m!153083))

(declare-fun m!153085 () Bool)

(assert (=> bm!14167 m!153085))

(assert (=> b!130151 m!152013))

(assert (=> b!130151 m!152013))

(declare-fun m!153087 () Bool)

(assert (=> b!130151 m!153087))

(assert (=> b!130145 m!151767))

(declare-fun m!153089 () Bool)

(assert (=> b!130145 m!153089))

(declare-fun m!153091 () Bool)

(assert (=> b!130145 m!153091))

(declare-fun m!153093 () Bool)

(assert (=> b!130145 m!153093))

(assert (=> b!130145 m!151767))

(declare-fun m!153095 () Bool)

(assert (=> b!130145 m!153095))

(assert (=> b!130145 m!151767))

(assert (=> b!130145 m!153071))

(declare-fun m!153097 () Bool)

(assert (=> b!130145 m!153097))

(declare-fun m!153099 () Bool)

(assert (=> b!130145 m!153099))

(declare-fun m!153101 () Bool)

(assert (=> b!130145 m!153101))

(declare-fun m!153103 () Bool)

(assert (=> b!130145 m!153103))

(declare-fun m!153105 () Bool)

(assert (=> b!130145 m!153105))

(assert (=> b!130145 m!152013))

(declare-fun m!153107 () Bool)

(assert (=> b!130145 m!153107))

(declare-fun m!153109 () Bool)

(assert (=> b!130145 m!153109))

(declare-fun m!153111 () Bool)

(assert (=> b!130145 m!153111))

(assert (=> b!130145 m!153097))

(declare-fun m!153113 () Bool)

(assert (=> b!130145 m!153113))

(declare-fun m!153115 () Bool)

(assert (=> b!130145 m!153115))

(assert (=> b!130145 m!153103))

(assert (=> b!130145 m!153109))

(assert (=> b!130145 m!153091))

(declare-fun m!153117 () Bool)

(assert (=> b!130145 m!153117))

(assert (=> d!39273 d!39515))

(declare-fun d!39517 () Bool)

(assert (=> d!39517 (isDefined!122 (getValueByKey!169 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(declare-fun lt!67692 () Unit!4039)

(assert (=> d!39517 (= lt!67692 (choose!789 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(declare-fun e!84926 () Bool)

(assert (=> d!39517 e!84926))

(declare-fun res!62790 () Bool)

(assert (=> d!39517 (=> (not res!62790) (not e!84926))))

(assert (=> d!39517 (= res!62790 (isStrictlySorted!319 (toList!864 e!84500)))))

(assert (=> d!39517 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))) lt!67692)))

(declare-fun b!130163 () Bool)

(assert (=> b!130163 (= e!84926 (containsKey!173 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(assert (= (and d!39517 res!62790) b!130163))

(assert (=> d!39517 m!152083))

(assert (=> d!39517 m!152083))

(assert (=> d!39517 m!152085))

(declare-fun m!153119 () Bool)

(assert (=> d!39517 m!153119))

(declare-fun m!153121 () Bool)

(assert (=> d!39517 m!153121))

(assert (=> b!130163 m!152079))

(assert (=> b!129575 d!39517))

(declare-fun d!39519 () Bool)

(assert (=> d!39519 (= (isDefined!122 (getValueByKey!169 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))) (not (isEmpty!403 (getValueByKey!169 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))))

(declare-fun bs!5397 () Bool)

(assert (= bs!5397 d!39519))

(assert (=> bs!5397 m!152083))

(declare-fun m!153123 () Bool)

(assert (=> bs!5397 m!153123))

(assert (=> b!129575 d!39519))

(declare-fun e!84928 () Option!175)

(declare-fun b!130166 () Bool)

(assert (=> b!130166 (= e!84928 (getValueByKey!169 (t!6107 (toList!864 e!84500)) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(declare-fun b!130164 () Bool)

(declare-fun e!84927 () Option!175)

(assert (=> b!130164 (= e!84927 (Some!174 (_2!1315 (h!2308 (toList!864 e!84500)))))))

(declare-fun b!130165 () Bool)

(assert (=> b!130165 (= e!84927 e!84928)))

(declare-fun c!23980 () Bool)

(assert (=> b!130165 (= c!23980 (and ((_ is Cons!1704) (toList!864 e!84500)) (not (= (_1!1315 (h!2308 (toList!864 e!84500))) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))))

(declare-fun c!23979 () Bool)

(declare-fun d!39521 () Bool)

(assert (=> d!39521 (= c!23979 (and ((_ is Cons!1704) (toList!864 e!84500)) (= (_1!1315 (h!2308 (toList!864 e!84500))) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))))))

(assert (=> d!39521 (= (getValueByKey!169 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))) e!84927)))

(declare-fun b!130167 () Bool)

(assert (=> b!130167 (= e!84928 None!173)))

(assert (= (and d!39521 c!23979) b!130164))

(assert (= (and d!39521 (not c!23979)) b!130165))

(assert (= (and b!130165 c!23980) b!130166))

(assert (= (and b!130165 (not c!23980)) b!130167))

(declare-fun m!153125 () Bool)

(assert (=> b!130166 m!153125))

(assert (=> b!129575 d!39521))

(declare-fun d!39523 () Bool)

(assert (=> d!39523 (= (apply!113 lt!67204 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!864 lt!67204) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5398 () Bool)

(assert (= bs!5398 d!39523))

(declare-fun m!153127 () Bool)

(assert (=> bs!5398 m!153127))

(assert (=> bs!5398 m!153127))

(declare-fun m!153129 () Bool)

(assert (=> bs!5398 m!153129))

(assert (=> b!129533 d!39523))

(declare-fun b!130170 () Bool)

(declare-fun e!84930 () Option!175)

(assert (=> b!130170 (= e!84930 (getValueByKey!169 (t!6107 (toList!864 lt!67474)) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130168 () Bool)

(declare-fun e!84929 () Option!175)

(assert (=> b!130168 (= e!84929 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67474)))))))

(declare-fun b!130169 () Bool)

(assert (=> b!130169 (= e!84929 e!84930)))

(declare-fun c!23982 () Bool)

(assert (=> b!130169 (= c!23982 (and ((_ is Cons!1704) (toList!864 lt!67474)) (not (= (_1!1315 (h!2308 (toList!864 lt!67474))) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun d!39525 () Bool)

(declare-fun c!23981 () Bool)

(assert (=> d!39525 (= c!23981 (and ((_ is Cons!1704) (toList!864 lt!67474)) (= (_1!1315 (h!2308 (toList!864 lt!67474))) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39525 (= (getValueByKey!169 (toList!864 lt!67474) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!84929)))

(declare-fun b!130171 () Bool)

(assert (=> b!130171 (= e!84930 None!173)))

(assert (= (and d!39525 c!23981) b!130168))

(assert (= (and d!39525 (not c!23981)) b!130169))

(assert (= (and b!130169 c!23982) b!130170))

(assert (= (and b!130169 (not c!23982)) b!130171))

(declare-fun m!153131 () Bool)

(assert (=> b!130170 m!153131))

(assert (=> b!129834 d!39525))

(declare-fun d!39527 () Bool)

(declare-fun e!84931 () Bool)

(assert (=> d!39527 e!84931))

(declare-fun res!62791 () Bool)

(assert (=> d!39527 (=> (not res!62791) (not e!84931))))

(declare-fun lt!67694 () ListLongMap!1697)

(assert (=> d!39527 (= res!62791 (contains!889 lt!67694 (_1!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(declare-fun lt!67695 () List!1708)

(assert (=> d!39527 (= lt!67694 (ListLongMap!1698 lt!67695))))

(declare-fun lt!67696 () Unit!4039)

(declare-fun lt!67693 () Unit!4039)

(assert (=> d!39527 (= lt!67696 lt!67693)))

(assert (=> d!39527 (= (getValueByKey!169 lt!67695 (_1!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(assert (=> d!39527 (= lt!67693 (lemmaContainsTupThenGetReturnValue!84 lt!67695 (_1!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) (_2!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(assert (=> d!39527 (= lt!67695 (insertStrictlySorted!87 (toList!864 (ite c!23873 call!14110 (ite c!23874 call!14111 call!14113))) (_1!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) (_2!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(assert (=> d!39527 (= (+!172 (ite c!23873 call!14110 (ite c!23874 call!14111 call!14113)) (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) lt!67694)))

(declare-fun b!130172 () Bool)

(declare-fun res!62792 () Bool)

(assert (=> b!130172 (=> (not res!62792) (not e!84931))))

(assert (=> b!130172 (= res!62792 (= (getValueByKey!169 (toList!864 lt!67694) (_1!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))))

(declare-fun b!130173 () Bool)

(assert (=> b!130173 (= e!84931 (contains!890 (toList!864 lt!67694) (ite (or c!23873 c!23874) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(assert (= (and d!39527 res!62791) b!130172))

(assert (= (and b!130172 res!62792) b!130173))

(declare-fun m!153133 () Bool)

(assert (=> d!39527 m!153133))

(declare-fun m!153135 () Bool)

(assert (=> d!39527 m!153135))

(declare-fun m!153137 () Bool)

(assert (=> d!39527 m!153137))

(declare-fun m!153139 () Bool)

(assert (=> d!39527 m!153139))

(declare-fun m!153141 () Bool)

(assert (=> b!130172 m!153141))

(declare-fun m!153143 () Bool)

(assert (=> b!130173 m!153143))

(assert (=> bm!14111 d!39527))

(assert (=> d!39349 d!39457))

(assert (=> b!129684 d!39239))

(declare-fun d!39529 () Bool)

(declare-fun res!62793 () Bool)

(declare-fun e!84932 () Bool)

(assert (=> d!39529 (=> res!62793 e!84932)))

(assert (=> d!39529 (= res!62793 (and ((_ is Cons!1704) (toList!864 call!14078)) (= (_1!1315 (h!2308 (toList!864 call!14078))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39529 (= (containsKey!173 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) e!84932)))

(declare-fun b!130174 () Bool)

(declare-fun e!84933 () Bool)

(assert (=> b!130174 (= e!84932 e!84933)))

(declare-fun res!62794 () Bool)

(assert (=> b!130174 (=> (not res!62794) (not e!84933))))

(assert (=> b!130174 (= res!62794 (and (or (not ((_ is Cons!1704) (toList!864 call!14078))) (bvsle (_1!1315 (h!2308 (toList!864 call!14078))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))) ((_ is Cons!1704) (toList!864 call!14078)) (bvslt (_1!1315 (h!2308 (toList!864 call!14078))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(declare-fun b!130175 () Bool)

(assert (=> b!130175 (= e!84933 (containsKey!173 (t!6107 (toList!864 call!14078)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39529 (not res!62793)) b!130174))

(assert (= (and b!130174 res!62794) b!130175))

(assert (=> b!130175 m!151769))

(declare-fun m!153145 () Bool)

(assert (=> b!130175 m!153145))

(assert (=> d!39285 d!39529))

(declare-fun d!39531 () Bool)

(declare-fun e!84934 () Bool)

(assert (=> d!39531 e!84934))

(declare-fun res!62795 () Bool)

(assert (=> d!39531 (=> (not res!62795) (not e!84934))))

(declare-fun lt!67698 () ListLongMap!1697)

(assert (=> d!39531 (= res!62795 (contains!889 lt!67698 (_1!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(declare-fun lt!67699 () List!1708)

(assert (=> d!39531 (= lt!67698 (ListLongMap!1698 lt!67699))))

(declare-fun lt!67700 () Unit!4039)

(declare-fun lt!67697 () Unit!4039)

(assert (=> d!39531 (= lt!67700 lt!67697)))

(assert (=> d!39531 (= (getValueByKey!169 lt!67699 (_1!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(assert (=> d!39531 (= lt!67697 (lemmaContainsTupThenGetReturnValue!84 lt!67699 (_1!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) (_2!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(assert (=> d!39531 (= lt!67699 (insertStrictlySorted!87 (toList!864 (ite c!23879 call!14117 (ite c!23880 call!14118 call!14120))) (_1!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) (_2!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(assert (=> d!39531 (= (+!172 (ite c!23879 call!14117 (ite c!23880 call!14118 call!14120)) (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) lt!67698)))

(declare-fun b!130176 () Bool)

(declare-fun res!62796 () Bool)

(assert (=> b!130176 (=> (not res!62796) (not e!84934))))

(assert (=> b!130176 (= res!62796 (= (getValueByKey!169 (toList!864 lt!67698) (_1!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))))

(declare-fun b!130177 () Bool)

(assert (=> b!130177 (= e!84934 (contains!890 (toList!864 lt!67698) (ite (or c!23879 c!23880) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(assert (= (and d!39531 res!62795) b!130176))

(assert (= (and b!130176 res!62796) b!130177))

(declare-fun m!153147 () Bool)

(assert (=> d!39531 m!153147))

(declare-fun m!153149 () Bool)

(assert (=> d!39531 m!153149))

(declare-fun m!153151 () Bool)

(assert (=> d!39531 m!153151))

(declare-fun m!153153 () Bool)

(assert (=> d!39531 m!153153))

(declare-fun m!153155 () Bool)

(assert (=> b!130176 m!153155))

(declare-fun m!153157 () Bool)

(assert (=> b!130177 m!153157))

(assert (=> bm!14118 d!39531))

(declare-fun d!39533 () Bool)

(assert (=> d!39533 (= (get!1466 (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3165 (getValueByKey!169 (toList!864 lt!67067) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39287 d!39533))

(assert (=> d!39287 d!39487))

(declare-fun d!39535 () Bool)

(assert (=> d!39535 (= (get!1466 (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3165 (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!39265 d!39535))

(declare-fun b!130180 () Bool)

(declare-fun e!84936 () Option!175)

(assert (=> b!130180 (= e!84936 (getValueByKey!169 (t!6107 (toList!864 lt!67067)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!130178 () Bool)

(declare-fun e!84935 () Option!175)

(assert (=> b!130178 (= e!84935 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67067)))))))

(declare-fun b!130179 () Bool)

(assert (=> b!130179 (= e!84935 e!84936)))

(declare-fun c!23984 () Bool)

(assert (=> b!130179 (= c!23984 (and ((_ is Cons!1704) (toList!864 lt!67067)) (not (= (_1!1315 (h!2308 (toList!864 lt!67067))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun d!39537 () Bool)

(declare-fun c!23983 () Bool)

(assert (=> d!39537 (= c!23983 (and ((_ is Cons!1704) (toList!864 lt!67067)) (= (_1!1315 (h!2308 (toList!864 lt!67067))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!39537 (= (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!84935)))

(declare-fun b!130181 () Bool)

(assert (=> b!130181 (= e!84936 None!173)))

(assert (= (and d!39537 c!23983) b!130178))

(assert (= (and d!39537 (not c!23983)) b!130179))

(assert (= (and b!130179 c!23984) b!130180))

(assert (= (and b!130179 (not c!23984)) b!130181))

(assert (=> b!130180 m!151851))

(declare-fun m!153159 () Bool)

(assert (=> b!130180 m!153159))

(assert (=> d!39265 d!39537))

(declare-fun bm!14174 () Bool)

(declare-fun call!14177 () (_ BitVec 32))

(assert (=> bm!14174 (= call!14177 (arrayCountValidKeys!0 (_keys!4565 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130182 () Bool)

(declare-fun e!84938 () (_ BitVec 32))

(assert (=> b!130182 (= e!84938 (bvadd #b00000000000000000000000000000001 call!14177))))

(declare-fun d!39539 () Bool)

(declare-fun lt!67701 () (_ BitVec 32))

(assert (=> d!39539 (and (bvsge lt!67701 #b00000000000000000000000000000000) (bvsle lt!67701 (bvsub (size!2509 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!84937 () (_ BitVec 32))

(assert (=> d!39539 (= lt!67701 e!84937)))

(declare-fun c!23985 () Bool)

(assert (=> d!39539 (= c!23985 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39539 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2509 (_keys!4565 newMap!16)) (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39539 (= (arrayCountValidKeys!0 (_keys!4565 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))) lt!67701)))

(declare-fun b!130183 () Bool)

(assert (=> b!130183 (= e!84938 call!14177)))

(declare-fun b!130184 () Bool)

(assert (=> b!130184 (= e!84937 e!84938)))

(declare-fun c!23986 () Bool)

(assert (=> b!130184 (= c!23986 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!130185 () Bool)

(assert (=> b!130185 (= e!84937 #b00000000000000000000000000000000)))

(assert (= (and d!39539 c!23985) b!130185))

(assert (= (and d!39539 (not c!23985)) b!130184))

(assert (= (and b!130184 c!23986) b!130182))

(assert (= (and b!130184 (not c!23986)) b!130183))

(assert (= (or b!130182 b!130183) bm!14174))

(declare-fun m!153161 () Bool)

(assert (=> bm!14174 m!153161))

(assert (=> b!130184 m!152999))

(assert (=> b!130184 m!152999))

(assert (=> b!130184 m!153001))

(assert (=> bm!14106 d!39539))

(assert (=> b!129564 d!39267))

(declare-fun d!39541 () Bool)

(declare-fun e!84939 () Bool)

(assert (=> d!39541 e!84939))

(declare-fun res!62797 () Bool)

(assert (=> d!39541 (=> res!62797 e!84939)))

(declare-fun lt!67705 () Bool)

(assert (=> d!39541 (= res!62797 (not lt!67705))))

(declare-fun lt!67704 () Bool)

(assert (=> d!39541 (= lt!67705 lt!67704)))

(declare-fun lt!67703 () Unit!4039)

(declare-fun e!84940 () Unit!4039)

(assert (=> d!39541 (= lt!67703 e!84940)))

(declare-fun c!23987 () Bool)

(assert (=> d!39541 (= c!23987 lt!67704)))

(assert (=> d!39541 (= lt!67704 (containsKey!173 (toList!864 (+!172 lt!67234 (tuple2!2609 lt!67238 lt!67235))) lt!67237))))

(assert (=> d!39541 (= (contains!889 (+!172 lt!67234 (tuple2!2609 lt!67238 lt!67235)) lt!67237) lt!67705)))

(declare-fun b!130186 () Bool)

(declare-fun lt!67702 () Unit!4039)

(assert (=> b!130186 (= e!84940 lt!67702)))

(assert (=> b!130186 (= lt!67702 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (+!172 lt!67234 (tuple2!2609 lt!67238 lt!67235))) lt!67237))))

(assert (=> b!130186 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67234 (tuple2!2609 lt!67238 lt!67235))) lt!67237))))

(declare-fun b!130187 () Bool)

(declare-fun Unit!4071 () Unit!4039)

(assert (=> b!130187 (= e!84940 Unit!4071)))

(declare-fun b!130188 () Bool)

(assert (=> b!130188 (= e!84939 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67234 (tuple2!2609 lt!67238 lt!67235))) lt!67237)))))

(assert (= (and d!39541 c!23987) b!130186))

(assert (= (and d!39541 (not c!23987)) b!130187))

(assert (= (and d!39541 (not res!62797)) b!130188))

(declare-fun m!153163 () Bool)

(assert (=> d!39541 m!153163))

(declare-fun m!153165 () Bool)

(assert (=> b!130186 m!153165))

(declare-fun m!153167 () Bool)

(assert (=> b!130186 m!153167))

(assert (=> b!130186 m!153167))

(declare-fun m!153169 () Bool)

(assert (=> b!130186 m!153169))

(assert (=> b!130188 m!153167))

(assert (=> b!130188 m!153167))

(assert (=> b!130188 m!153169))

(assert (=> b!129564 d!39541))

(declare-fun d!39543 () Bool)

(declare-fun e!84941 () Bool)

(assert (=> d!39543 e!84941))

(declare-fun res!62798 () Bool)

(assert (=> d!39543 (=> (not res!62798) (not e!84941))))

(declare-fun lt!67707 () ListLongMap!1697)

(assert (=> d!39543 (= res!62798 (contains!889 lt!67707 (_1!1315 (tuple2!2609 lt!67238 lt!67235))))))

(declare-fun lt!67708 () List!1708)

(assert (=> d!39543 (= lt!67707 (ListLongMap!1698 lt!67708))))

(declare-fun lt!67709 () Unit!4039)

(declare-fun lt!67706 () Unit!4039)

(assert (=> d!39543 (= lt!67709 lt!67706)))

(assert (=> d!39543 (= (getValueByKey!169 lt!67708 (_1!1315 (tuple2!2609 lt!67238 lt!67235))) (Some!174 (_2!1315 (tuple2!2609 lt!67238 lt!67235))))))

(assert (=> d!39543 (= lt!67706 (lemmaContainsTupThenGetReturnValue!84 lt!67708 (_1!1315 (tuple2!2609 lt!67238 lt!67235)) (_2!1315 (tuple2!2609 lt!67238 lt!67235))))))

(assert (=> d!39543 (= lt!67708 (insertStrictlySorted!87 (toList!864 lt!67234) (_1!1315 (tuple2!2609 lt!67238 lt!67235)) (_2!1315 (tuple2!2609 lt!67238 lt!67235))))))

(assert (=> d!39543 (= (+!172 lt!67234 (tuple2!2609 lt!67238 lt!67235)) lt!67707)))

(declare-fun b!130189 () Bool)

(declare-fun res!62799 () Bool)

(assert (=> b!130189 (=> (not res!62799) (not e!84941))))

(assert (=> b!130189 (= res!62799 (= (getValueByKey!169 (toList!864 lt!67707) (_1!1315 (tuple2!2609 lt!67238 lt!67235))) (Some!174 (_2!1315 (tuple2!2609 lt!67238 lt!67235)))))))

(declare-fun b!130190 () Bool)

(assert (=> b!130190 (= e!84941 (contains!890 (toList!864 lt!67707) (tuple2!2609 lt!67238 lt!67235)))))

(assert (= (and d!39543 res!62798) b!130189))

(assert (= (and b!130189 res!62799) b!130190))

(declare-fun m!153171 () Bool)

(assert (=> d!39543 m!153171))

(declare-fun m!153173 () Bool)

(assert (=> d!39543 m!153173))

(declare-fun m!153175 () Bool)

(assert (=> d!39543 m!153175))

(declare-fun m!153177 () Bool)

(assert (=> d!39543 m!153177))

(declare-fun m!153179 () Bool)

(assert (=> b!130189 m!153179))

(declare-fun m!153181 () Bool)

(assert (=> b!130190 m!153181))

(assert (=> b!129564 d!39543))

(declare-fun d!39545 () Bool)

(declare-fun e!84942 () Bool)

(assert (=> d!39545 e!84942))

(declare-fun res!62800 () Bool)

(assert (=> d!39545 (=> (not res!62800) (not e!84942))))

(declare-fun lt!67711 () ListLongMap!1697)

(assert (=> d!39545 (= res!62800 (contains!889 lt!67711 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67712 () List!1708)

(assert (=> d!39545 (= lt!67711 (ListLongMap!1698 lt!67712))))

(declare-fun lt!67713 () Unit!4039)

(declare-fun lt!67710 () Unit!4039)

(assert (=> d!39545 (= lt!67713 lt!67710)))

(assert (=> d!39545 (= (getValueByKey!169 lt!67712 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39545 (= lt!67710 (lemmaContainsTupThenGetReturnValue!84 lt!67712 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39545 (= lt!67712 (insertStrictlySorted!87 (toList!864 call!14088) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39545 (= (+!172 call!14088 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67711)))

(declare-fun b!130191 () Bool)

(declare-fun res!62801 () Bool)

(assert (=> b!130191 (=> (not res!62801) (not e!84942))))

(assert (=> b!130191 (= res!62801 (= (getValueByKey!169 (toList!864 lt!67711) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130192 () Bool)

(assert (=> b!130192 (= e!84942 (contains!890 (toList!864 lt!67711) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39545 res!62800) b!130191))

(assert (= (and b!130191 res!62801) b!130192))

(declare-fun m!153183 () Bool)

(assert (=> d!39545 m!153183))

(declare-fun m!153185 () Bool)

(assert (=> d!39545 m!153185))

(declare-fun m!153187 () Bool)

(assert (=> d!39545 m!153187))

(declare-fun m!153189 () Bool)

(assert (=> d!39545 m!153189))

(declare-fun m!153191 () Bool)

(assert (=> b!130191 m!153191))

(declare-fun m!153193 () Bool)

(assert (=> b!130192 m!153193))

(assert (=> b!129564 d!39545))

(declare-fun d!39547 () Bool)

(assert (=> d!39547 (not (contains!889 (+!172 lt!67234 (tuple2!2609 lt!67238 lt!67235)) lt!67237))))

(declare-fun lt!67716 () Unit!4039)

(declare-fun choose!797 (ListLongMap!1697 (_ BitVec 64) V!3459 (_ BitVec 64)) Unit!4039)

(assert (=> d!39547 (= lt!67716 (choose!797 lt!67234 lt!67238 lt!67235 lt!67237))))

(declare-fun e!84945 () Bool)

(assert (=> d!39547 e!84945))

(declare-fun res!62804 () Bool)

(assert (=> d!39547 (=> (not res!62804) (not e!84945))))

(assert (=> d!39547 (= res!62804 (not (contains!889 lt!67234 lt!67237)))))

(assert (=> d!39547 (= (addStillNotContains!58 lt!67234 lt!67238 lt!67235 lt!67237) lt!67716)))

(declare-fun b!130196 () Bool)

(assert (=> b!130196 (= e!84945 (not (= lt!67238 lt!67237)))))

(assert (= (and d!39547 res!62804) b!130196))

(assert (=> d!39547 m!152071))

(assert (=> d!39547 m!152071))

(assert (=> d!39547 m!152073))

(declare-fun m!153195 () Bool)

(assert (=> d!39547 m!153195))

(declare-fun m!153197 () Bool)

(assert (=> d!39547 m!153197))

(assert (=> b!129564 d!39547))

(declare-fun d!39549 () Bool)

(assert (=> d!39549 (= (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!403 (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5399 () Bool)

(assert (= bs!5399 d!39549))

(assert (=> bs!5399 m!152111))

(declare-fun m!153199 () Bool)

(assert (=> bs!5399 m!153199))

(assert (=> b!129722 d!39549))

(assert (=> b!129722 d!39495))

(declare-fun d!39551 () Bool)

(declare-fun e!84946 () Bool)

(assert (=> d!39551 e!84946))

(declare-fun res!62805 () Bool)

(assert (=> d!39551 (=> res!62805 e!84946)))

(declare-fun lt!67720 () Bool)

(assert (=> d!39551 (= res!62805 (not lt!67720))))

(declare-fun lt!67719 () Bool)

(assert (=> d!39551 (= lt!67720 lt!67719)))

(declare-fun lt!67718 () Unit!4039)

(declare-fun e!84947 () Unit!4039)

(assert (=> d!39551 (= lt!67718 e!84947)))

(declare-fun c!23988 () Bool)

(assert (=> d!39551 (= c!23988 lt!67719)))

(assert (=> d!39551 (= lt!67719 (containsKey!173 (toList!864 lt!67195) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39551 (= (contains!889 lt!67195 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67720)))

(declare-fun b!130197 () Bool)

(declare-fun lt!67717 () Unit!4039)

(assert (=> b!130197 (= e!84947 lt!67717)))

(assert (=> b!130197 (= lt!67717 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67195) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!130197 (isDefined!122 (getValueByKey!169 (toList!864 lt!67195) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130198 () Bool)

(declare-fun Unit!4072 () Unit!4039)

(assert (=> b!130198 (= e!84947 Unit!4072)))

(declare-fun b!130199 () Bool)

(assert (=> b!130199 (= e!84946 (isDefined!122 (getValueByKey!169 (toList!864 lt!67195) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39551 c!23988) b!130197))

(assert (= (and d!39551 (not c!23988)) b!130198))

(assert (= (and d!39551 (not res!62805)) b!130199))

(declare-fun m!153201 () Bool)

(assert (=> d!39551 m!153201))

(declare-fun m!153203 () Bool)

(assert (=> b!130197 m!153203))

(assert (=> b!130197 m!151997))

(assert (=> b!130197 m!151997))

(declare-fun m!153205 () Bool)

(assert (=> b!130197 m!153205))

(assert (=> b!130199 m!151997))

(assert (=> b!130199 m!151997))

(assert (=> b!130199 m!153205))

(assert (=> d!39245 d!39551))

(declare-fun b!130202 () Bool)

(declare-fun e!84949 () Option!175)

(assert (=> b!130202 (= e!84949 (getValueByKey!169 (t!6107 lt!67196) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130200 () Bool)

(declare-fun e!84948 () Option!175)

(assert (=> b!130200 (= e!84948 (Some!174 (_2!1315 (h!2308 lt!67196))))))

(declare-fun b!130201 () Bool)

(assert (=> b!130201 (= e!84948 e!84949)))

(declare-fun c!23990 () Bool)

(assert (=> b!130201 (= c!23990 (and ((_ is Cons!1704) lt!67196) (not (= (_1!1315 (h!2308 lt!67196)) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!39553 () Bool)

(declare-fun c!23989 () Bool)

(assert (=> d!39553 (= c!23989 (and ((_ is Cons!1704) lt!67196) (= (_1!1315 (h!2308 lt!67196)) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39553 (= (getValueByKey!169 lt!67196 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!84948)))

(declare-fun b!130203 () Bool)

(assert (=> b!130203 (= e!84949 None!173)))

(assert (= (and d!39553 c!23989) b!130200))

(assert (= (and d!39553 (not c!23989)) b!130201))

(assert (= (and b!130201 c!23990) b!130202))

(assert (= (and b!130201 (not c!23990)) b!130203))

(declare-fun m!153207 () Bool)

(assert (=> b!130202 m!153207))

(assert (=> d!39245 d!39553))

(declare-fun d!39555 () Bool)

(assert (=> d!39555 (= (getValueByKey!169 lt!67196 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67721 () Unit!4039)

(assert (=> d!39555 (= lt!67721 (choose!796 lt!67196 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84950 () Bool)

(assert (=> d!39555 e!84950))

(declare-fun res!62806 () Bool)

(assert (=> d!39555 (=> (not res!62806) (not e!84950))))

(assert (=> d!39555 (= res!62806 (isStrictlySorted!319 lt!67196))))

(assert (=> d!39555 (= (lemmaContainsTupThenGetReturnValue!84 lt!67196 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67721)))

(declare-fun b!130204 () Bool)

(declare-fun res!62807 () Bool)

(assert (=> b!130204 (=> (not res!62807) (not e!84950))))

(assert (=> b!130204 (= res!62807 (containsKey!173 lt!67196 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130205 () Bool)

(assert (=> b!130205 (= e!84950 (contains!890 lt!67196 (tuple2!2609 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39555 res!62806) b!130204))

(assert (= (and b!130204 res!62807) b!130205))

(assert (=> d!39555 m!151991))

(declare-fun m!153209 () Bool)

(assert (=> d!39555 m!153209))

(declare-fun m!153211 () Bool)

(assert (=> d!39555 m!153211))

(declare-fun m!153213 () Bool)

(assert (=> b!130204 m!153213))

(declare-fun m!153215 () Bool)

(assert (=> b!130205 m!153215))

(assert (=> d!39245 d!39555))

(declare-fun e!84952 () List!1708)

(declare-fun bm!14175 () Bool)

(declare-fun call!14180 () List!1708)

(declare-fun c!23994 () Bool)

(assert (=> bm!14175 (= call!14180 ($colon$colon!91 e!84952 (ite c!23994 (h!2308 (toList!864 call!14068)) (tuple2!2609 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23991 () Bool)

(assert (=> bm!14175 (= c!23991 c!23994)))

(declare-fun b!130206 () Bool)

(declare-fun c!23992 () Bool)

(declare-fun c!23993 () Bool)

(assert (=> b!130206 (= e!84952 (ite c!23992 (t!6107 (toList!864 call!14068)) (ite c!23993 (Cons!1704 (h!2308 (toList!864 call!14068)) (t!6107 (toList!864 call!14068))) Nil!1705)))))

(declare-fun b!130207 () Bool)

(declare-fun e!84953 () List!1708)

(declare-fun call!14179 () List!1708)

(assert (=> b!130207 (= e!84953 call!14179)))

(declare-fun b!130208 () Bool)

(declare-fun e!84955 () Bool)

(declare-fun lt!67722 () List!1708)

(assert (=> b!130208 (= e!84955 (contains!890 lt!67722 (tuple2!2609 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130209 () Bool)

(declare-fun res!62809 () Bool)

(assert (=> b!130209 (=> (not res!62809) (not e!84955))))

(assert (=> b!130209 (= res!62809 (containsKey!173 lt!67722 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130210 () Bool)

(assert (=> b!130210 (= e!84953 call!14179)))

(declare-fun b!130211 () Bool)

(declare-fun e!84951 () List!1708)

(declare-fun call!14178 () List!1708)

(assert (=> b!130211 (= e!84951 call!14178)))

(declare-fun b!130212 () Bool)

(assert (=> b!130212 (= c!23993 (and ((_ is Cons!1704) (toList!864 call!14068)) (bvsgt (_1!1315 (h!2308 (toList!864 call!14068))) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!130212 (= e!84951 e!84953)))

(declare-fun bm!14177 () Bool)

(assert (=> bm!14177 (= call!14178 call!14180)))

(declare-fun b!130213 () Bool)

(declare-fun e!84954 () List!1708)

(assert (=> b!130213 (= e!84954 e!84951)))

(assert (=> b!130213 (= c!23992 (and ((_ is Cons!1704) (toList!864 call!14068)) (= (_1!1315 (h!2308 (toList!864 call!14068))) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!14176 () Bool)

(assert (=> bm!14176 (= call!14179 call!14178)))

(declare-fun d!39557 () Bool)

(assert (=> d!39557 e!84955))

(declare-fun res!62808 () Bool)

(assert (=> d!39557 (=> (not res!62808) (not e!84955))))

(assert (=> d!39557 (= res!62808 (isStrictlySorted!319 lt!67722))))

(assert (=> d!39557 (= lt!67722 e!84954)))

(assert (=> d!39557 (= c!23994 (and ((_ is Cons!1704) (toList!864 call!14068)) (bvslt (_1!1315 (h!2308 (toList!864 call!14068))) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39557 (isStrictlySorted!319 (toList!864 call!14068))))

(assert (=> d!39557 (= (insertStrictlySorted!87 (toList!864 call!14068) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!67722)))

(declare-fun b!130214 () Bool)

(assert (=> b!130214 (= e!84954 call!14180)))

(declare-fun b!130215 () Bool)

(assert (=> b!130215 (= e!84952 (insertStrictlySorted!87 (t!6107 (toList!864 call!14068)) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39557 c!23994) b!130214))

(assert (= (and d!39557 (not c!23994)) b!130213))

(assert (= (and b!130213 c!23992) b!130211))

(assert (= (and b!130213 (not c!23992)) b!130212))

(assert (= (and b!130212 c!23993) b!130207))

(assert (= (and b!130212 (not c!23993)) b!130210))

(assert (= (or b!130207 b!130210) bm!14176))

(assert (= (or b!130211 bm!14176) bm!14177))

(assert (= (or b!130214 bm!14177) bm!14175))

(assert (= (and bm!14175 c!23991) b!130215))

(assert (= (and bm!14175 (not c!23991)) b!130206))

(assert (= (and d!39557 res!62808) b!130209))

(assert (= (and b!130209 res!62809) b!130208))

(declare-fun m!153217 () Bool)

(assert (=> b!130208 m!153217))

(declare-fun m!153219 () Bool)

(assert (=> b!130209 m!153219))

(declare-fun m!153221 () Bool)

(assert (=> b!130215 m!153221))

(declare-fun m!153223 () Bool)

(assert (=> bm!14175 m!153223))

(declare-fun m!153225 () Bool)

(assert (=> d!39557 m!153225))

(declare-fun m!153227 () Bool)

(assert (=> d!39557 m!153227))

(assert (=> d!39245 d!39557))

(assert (=> bm!14085 d!39365))

(declare-fun d!39559 () Bool)

(declare-fun e!84956 () Bool)

(assert (=> d!39559 e!84956))

(declare-fun res!62810 () Bool)

(assert (=> d!39559 (=> res!62810 e!84956)))

(declare-fun lt!67726 () Bool)

(assert (=> d!39559 (= res!62810 (not lt!67726))))

(declare-fun lt!67725 () Bool)

(assert (=> d!39559 (= lt!67726 lt!67725)))

(declare-fun lt!67724 () Unit!4039)

(declare-fun e!84957 () Unit!4039)

(assert (=> d!39559 (= lt!67724 e!84957)))

(declare-fun c!23995 () Bool)

(assert (=> d!39559 (= c!23995 lt!67725)))

(assert (=> d!39559 (= lt!67725 (containsKey!173 (toList!864 lt!67204) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39559 (= (contains!889 lt!67204 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67726)))

(declare-fun b!130216 () Bool)

(declare-fun lt!67723 () Unit!4039)

(assert (=> b!130216 (= e!84957 lt!67723)))

(assert (=> b!130216 (= lt!67723 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67204) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130216 (isDefined!122 (getValueByKey!169 (toList!864 lt!67204) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130217 () Bool)

(declare-fun Unit!4073 () Unit!4039)

(assert (=> b!130217 (= e!84957 Unit!4073)))

(declare-fun b!130218 () Bool)

(assert (=> b!130218 (= e!84956 (isDefined!122 (getValueByKey!169 (toList!864 lt!67204) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39559 c!23995) b!130216))

(assert (= (and d!39559 (not c!23995)) b!130217))

(assert (= (and d!39559 (not res!62810)) b!130218))

(declare-fun m!153229 () Bool)

(assert (=> d!39559 m!153229))

(declare-fun m!153231 () Bool)

(assert (=> b!130216 m!153231))

(assert (=> b!130216 m!152935))

(assert (=> b!130216 m!152935))

(declare-fun m!153233 () Bool)

(assert (=> b!130216 m!153233))

(assert (=> b!130218 m!152935))

(assert (=> b!130218 m!152935))

(assert (=> b!130218 m!153233))

(assert (=> bm!14076 d!39559))

(declare-fun d!39561 () Bool)

(assert (=> d!39561 (= (size!2513 newMap!16) (bvadd (_size!589 newMap!16) (bvsdiv (bvadd (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!129832 d!39561))

(declare-fun d!39563 () Bool)

(assert (=> d!39563 (= (get!1466 (getValueByKey!169 (toList!864 lt!67069) lt!67063)) (v!3165 (getValueByKey!169 (toList!864 lt!67069) lt!67063)))))

(assert (=> d!39299 d!39563))

(declare-fun b!130221 () Bool)

(declare-fun e!84959 () Option!175)

(assert (=> b!130221 (= e!84959 (getValueByKey!169 (t!6107 (toList!864 lt!67069)) lt!67063))))

(declare-fun b!130219 () Bool)

(declare-fun e!84958 () Option!175)

(assert (=> b!130219 (= e!84958 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67069)))))))

(declare-fun b!130220 () Bool)

(assert (=> b!130220 (= e!84958 e!84959)))

(declare-fun c!23997 () Bool)

(assert (=> b!130220 (= c!23997 (and ((_ is Cons!1704) (toList!864 lt!67069)) (not (= (_1!1315 (h!2308 (toList!864 lt!67069))) lt!67063))))))

(declare-fun d!39565 () Bool)

(declare-fun c!23996 () Bool)

(assert (=> d!39565 (= c!23996 (and ((_ is Cons!1704) (toList!864 lt!67069)) (= (_1!1315 (h!2308 (toList!864 lt!67069))) lt!67063)))))

(assert (=> d!39565 (= (getValueByKey!169 (toList!864 lt!67069) lt!67063) e!84958)))

(declare-fun b!130222 () Bool)

(assert (=> b!130222 (= e!84959 None!173)))

(assert (= (and d!39565 c!23996) b!130219))

(assert (= (and d!39565 (not c!23996)) b!130220))

(assert (= (and b!130220 c!23997) b!130221))

(assert (= (and b!130220 (not c!23997)) b!130222))

(declare-fun m!153235 () Bool)

(assert (=> b!130221 m!153235))

(assert (=> d!39299 d!39565))

(declare-fun d!39567 () Bool)

(declare-fun e!84960 () Bool)

(assert (=> d!39567 e!84960))

(declare-fun res!62811 () Bool)

(assert (=> d!39567 (=> (not res!62811) (not e!84960))))

(declare-fun lt!67728 () ListLongMap!1697)

(assert (=> d!39567 (= res!62811 (contains!889 lt!67728 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun lt!67729 () List!1708)

(assert (=> d!39567 (= lt!67728 (ListLongMap!1698 lt!67729))))

(declare-fun lt!67730 () Unit!4039)

(declare-fun lt!67727 () Unit!4039)

(assert (=> d!39567 (= lt!67730 lt!67727)))

(assert (=> d!39567 (= (getValueByKey!169 lt!67729 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(assert (=> d!39567 (= lt!67727 (lemmaContainsTupThenGetReturnValue!84 lt!67729 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(assert (=> d!39567 (= lt!67729 (insertStrictlySorted!87 (toList!864 call!14112) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(assert (=> d!39567 (= (+!172 call!14112 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))) lt!67728)))

(declare-fun b!130223 () Bool)

(declare-fun res!62812 () Bool)

(assert (=> b!130223 (=> (not res!62812) (not e!84960))))

(assert (=> b!130223 (= res!62812 (= (getValueByKey!169 (toList!864 lt!67728) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(declare-fun b!130224 () Bool)

(assert (=> b!130224 (= e!84960 (contains!890 (toList!864 lt!67728) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(assert (= (and d!39567 res!62811) b!130223))

(assert (= (and b!130223 res!62812) b!130224))

(declare-fun m!153237 () Bool)

(assert (=> d!39567 m!153237))

(declare-fun m!153239 () Bool)

(assert (=> d!39567 m!153239))

(declare-fun m!153241 () Bool)

(assert (=> d!39567 m!153241))

(declare-fun m!153243 () Bool)

(assert (=> d!39567 m!153243))

(declare-fun m!153245 () Bool)

(assert (=> b!130223 m!153245))

(declare-fun m!153247 () Bool)

(assert (=> b!130224 m!153247))

(assert (=> b!129754 d!39567))

(assert (=> b!129788 d!39357))

(declare-fun d!39569 () Bool)

(declare-fun e!84961 () Bool)

(assert (=> d!39569 e!84961))

(declare-fun res!62813 () Bool)

(assert (=> d!39569 (=> res!62813 e!84961)))

(declare-fun lt!67734 () Bool)

(assert (=> d!39569 (= res!62813 (not lt!67734))))

(declare-fun lt!67733 () Bool)

(assert (=> d!39569 (= lt!67734 lt!67733)))

(declare-fun lt!67732 () Unit!4039)

(declare-fun e!84962 () Unit!4039)

(assert (=> d!39569 (= lt!67732 e!84962)))

(declare-fun c!23998 () Bool)

(assert (=> d!39569 (= c!23998 lt!67733)))

(assert (=> d!39569 (= lt!67733 (containsKey!173 (toList!864 lt!67389) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39569 (= (contains!889 lt!67389 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67734)))

(declare-fun b!130225 () Bool)

(declare-fun lt!67731 () Unit!4039)

(assert (=> b!130225 (= e!84962 lt!67731)))

(assert (=> b!130225 (= lt!67731 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67389) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> b!130225 (isDefined!122 (getValueByKey!169 (toList!864 lt!67389) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130226 () Bool)

(declare-fun Unit!4074 () Unit!4039)

(assert (=> b!130226 (= e!84962 Unit!4074)))

(declare-fun b!130227 () Bool)

(assert (=> b!130227 (= e!84961 (isDefined!122 (getValueByKey!169 (toList!864 lt!67389) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39569 c!23998) b!130225))

(assert (= (and d!39569 (not c!23998)) b!130226))

(assert (= (and d!39569 (not res!62813)) b!130227))

(declare-fun m!153249 () Bool)

(assert (=> d!39569 m!153249))

(declare-fun m!153251 () Bool)

(assert (=> b!130225 m!153251))

(assert (=> b!130225 m!152321))

(assert (=> b!130225 m!152321))

(declare-fun m!153253 () Bool)

(assert (=> b!130225 m!153253))

(assert (=> b!130227 m!152321))

(assert (=> b!130227 m!152321))

(assert (=> b!130227 m!153253))

(assert (=> d!39317 d!39569))

(declare-fun b!130230 () Bool)

(declare-fun e!84964 () Option!175)

(assert (=> b!130230 (= e!84964 (getValueByKey!169 (t!6107 lt!67390) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130228 () Bool)

(declare-fun e!84963 () Option!175)

(assert (=> b!130228 (= e!84963 (Some!174 (_2!1315 (h!2308 lt!67390))))))

(declare-fun b!130229 () Bool)

(assert (=> b!130229 (= e!84963 e!84964)))

(declare-fun c!24000 () Bool)

(assert (=> b!130229 (= c!24000 (and ((_ is Cons!1704) lt!67390) (not (= (_1!1315 (h!2308 lt!67390)) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun d!39571 () Bool)

(declare-fun c!23999 () Bool)

(assert (=> d!39571 (= c!23999 (and ((_ is Cons!1704) lt!67390) (= (_1!1315 (h!2308 lt!67390)) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39571 (= (getValueByKey!169 lt!67390 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!84963)))

(declare-fun b!130231 () Bool)

(assert (=> b!130231 (= e!84964 None!173)))

(assert (= (and d!39571 c!23999) b!130228))

(assert (= (and d!39571 (not c!23999)) b!130229))

(assert (= (and b!130229 c!24000) b!130230))

(assert (= (and b!130229 (not c!24000)) b!130231))

(declare-fun m!153255 () Bool)

(assert (=> b!130230 m!153255))

(assert (=> d!39317 d!39571))

(declare-fun d!39573 () Bool)

(assert (=> d!39573 (= (getValueByKey!169 lt!67390 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67735 () Unit!4039)

(assert (=> d!39573 (= lt!67735 (choose!796 lt!67390 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun e!84965 () Bool)

(assert (=> d!39573 e!84965))

(declare-fun res!62814 () Bool)

(assert (=> d!39573 (=> (not res!62814) (not e!84965))))

(assert (=> d!39573 (= res!62814 (isStrictlySorted!319 lt!67390))))

(assert (=> d!39573 (= (lemmaContainsTupThenGetReturnValue!84 lt!67390 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67735)))

(declare-fun b!130232 () Bool)

(declare-fun res!62815 () Bool)

(assert (=> b!130232 (=> (not res!62815) (not e!84965))))

(assert (=> b!130232 (= res!62815 (containsKey!173 lt!67390 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130233 () Bool)

(assert (=> b!130233 (= e!84965 (contains!890 lt!67390 (tuple2!2609 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39573 res!62814) b!130232))

(assert (= (and b!130232 res!62815) b!130233))

(assert (=> d!39573 m!152315))

(declare-fun m!153257 () Bool)

(assert (=> d!39573 m!153257))

(declare-fun m!153259 () Bool)

(assert (=> d!39573 m!153259))

(declare-fun m!153261 () Bool)

(assert (=> b!130232 m!153261))

(declare-fun m!153263 () Bool)

(assert (=> b!130233 m!153263))

(assert (=> d!39317 d!39573))

(declare-fun e!84967 () List!1708)

(declare-fun call!14183 () List!1708)

(declare-fun bm!14178 () Bool)

(declare-fun c!24004 () Bool)

(assert (=> bm!14178 (= call!14183 ($colon$colon!91 e!84967 (ite c!24004 (h!2308 (toList!864 lt!67061)) (tuple2!2609 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!24001 () Bool)

(assert (=> bm!14178 (= c!24001 c!24004)))

(declare-fun c!24003 () Bool)

(declare-fun c!24002 () Bool)

(declare-fun b!130234 () Bool)

(assert (=> b!130234 (= e!84967 (ite c!24002 (t!6107 (toList!864 lt!67061)) (ite c!24003 (Cons!1704 (h!2308 (toList!864 lt!67061)) (t!6107 (toList!864 lt!67061))) Nil!1705)))))

(declare-fun b!130235 () Bool)

(declare-fun e!84968 () List!1708)

(declare-fun call!14182 () List!1708)

(assert (=> b!130235 (= e!84968 call!14182)))

(declare-fun e!84970 () Bool)

(declare-fun lt!67736 () List!1708)

(declare-fun b!130236 () Bool)

(assert (=> b!130236 (= e!84970 (contains!890 lt!67736 (tuple2!2609 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130237 () Bool)

(declare-fun res!62817 () Bool)

(assert (=> b!130237 (=> (not res!62817) (not e!84970))))

(assert (=> b!130237 (= res!62817 (containsKey!173 lt!67736 (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130238 () Bool)

(assert (=> b!130238 (= e!84968 call!14182)))

(declare-fun b!130239 () Bool)

(declare-fun e!84966 () List!1708)

(declare-fun call!14181 () List!1708)

(assert (=> b!130239 (= e!84966 call!14181)))

(declare-fun b!130240 () Bool)

(assert (=> b!130240 (= c!24003 (and ((_ is Cons!1704) (toList!864 lt!67061)) (bvsgt (_1!1315 (h!2308 (toList!864 lt!67061))) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> b!130240 (= e!84966 e!84968)))

(declare-fun bm!14180 () Bool)

(assert (=> bm!14180 (= call!14181 call!14183)))

(declare-fun b!130241 () Bool)

(declare-fun e!84969 () List!1708)

(assert (=> b!130241 (= e!84969 e!84966)))

(assert (=> b!130241 (= c!24002 (and ((_ is Cons!1704) (toList!864 lt!67061)) (= (_1!1315 (h!2308 (toList!864 lt!67061))) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun bm!14179 () Bool)

(assert (=> bm!14179 (= call!14182 call!14181)))

(declare-fun d!39575 () Bool)

(assert (=> d!39575 e!84970))

(declare-fun res!62816 () Bool)

(assert (=> d!39575 (=> (not res!62816) (not e!84970))))

(assert (=> d!39575 (= res!62816 (isStrictlySorted!319 lt!67736))))

(assert (=> d!39575 (= lt!67736 e!84969)))

(assert (=> d!39575 (= c!24004 (and ((_ is Cons!1704) (toList!864 lt!67061)) (bvslt (_1!1315 (h!2308 (toList!864 lt!67061))) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39575 (isStrictlySorted!319 (toList!864 lt!67061))))

(assert (=> d!39575 (= (insertStrictlySorted!87 (toList!864 lt!67061) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67736)))

(declare-fun b!130242 () Bool)

(assert (=> b!130242 (= e!84969 call!14183)))

(declare-fun b!130243 () Bool)

(assert (=> b!130243 (= e!84967 (insertStrictlySorted!87 (t!6107 (toList!864 lt!67061)) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (= (and d!39575 c!24004) b!130242))

(assert (= (and d!39575 (not c!24004)) b!130241))

(assert (= (and b!130241 c!24002) b!130239))

(assert (= (and b!130241 (not c!24002)) b!130240))

(assert (= (and b!130240 c!24003) b!130235))

(assert (= (and b!130240 (not c!24003)) b!130238))

(assert (= (or b!130235 b!130238) bm!14179))

(assert (= (or b!130239 bm!14179) bm!14180))

(assert (= (or b!130242 bm!14180) bm!14178))

(assert (= (and bm!14178 c!24001) b!130243))

(assert (= (and bm!14178 (not c!24001)) b!130234))

(assert (= (and d!39575 res!62816) b!130237))

(assert (= (and b!130237 res!62817) b!130236))

(declare-fun m!153265 () Bool)

(assert (=> b!130236 m!153265))

(declare-fun m!153267 () Bool)

(assert (=> b!130237 m!153267))

(declare-fun m!153269 () Bool)

(assert (=> b!130243 m!153269))

(declare-fun m!153271 () Bool)

(assert (=> bm!14178 m!153271))

(declare-fun m!153273 () Bool)

(assert (=> d!39575 m!153273))

(declare-fun m!153275 () Bool)

(assert (=> d!39575 m!153275))

(assert (=> d!39317 d!39575))

(declare-fun d!39577 () Bool)

(assert (=> d!39577 (isDefined!122 (getValueByKey!169 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun lt!67737 () Unit!4039)

(assert (=> d!39577 (= lt!67737 (choose!789 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun e!84971 () Bool)

(assert (=> d!39577 e!84971))

(declare-fun res!62818 () Bool)

(assert (=> d!39577 (=> (not res!62818) (not e!84971))))

(assert (=> d!39577 (= res!62818 (isStrictlySorted!319 (toList!864 call!14078)))))

(assert (=> d!39577 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67737)))

(declare-fun b!130244 () Bool)

(assert (=> b!130244 (= e!84971 (containsKey!173 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39577 res!62818) b!130244))

(assert (=> d!39577 m!151769))

(assert (=> d!39577 m!152223))

(assert (=> d!39577 m!152223))

(assert (=> d!39577 m!152225))

(assert (=> d!39577 m!151769))

(declare-fun m!153277 () Bool)

(assert (=> d!39577 m!153277))

(declare-fun m!153279 () Bool)

(assert (=> d!39577 m!153279))

(assert (=> b!130244 m!151769))

(assert (=> b!130244 m!152219))

(assert (=> b!129697 d!39577))

(declare-fun d!39579 () Bool)

(assert (=> d!39579 (= (isDefined!122 (getValueByKey!169 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))) (not (isEmpty!403 (getValueByKey!169 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun bs!5400 () Bool)

(assert (= bs!5400 d!39579))

(assert (=> bs!5400 m!152223))

(declare-fun m!153281 () Bool)

(assert (=> bs!5400 m!153281))

(assert (=> b!129697 d!39579))

(declare-fun e!84973 () Option!175)

(declare-fun b!130247 () Bool)

(assert (=> b!130247 (= e!84973 (getValueByKey!169 (t!6107 (toList!864 call!14078)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!130245 () Bool)

(declare-fun e!84972 () Option!175)

(assert (=> b!130245 (= e!84972 (Some!174 (_2!1315 (h!2308 (toList!864 call!14078)))))))

(declare-fun b!130246 () Bool)

(assert (=> b!130246 (= e!84972 e!84973)))

(declare-fun c!24006 () Bool)

(assert (=> b!130246 (= c!24006 (and ((_ is Cons!1704) (toList!864 call!14078)) (not (= (_1!1315 (h!2308 (toList!864 call!14078))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun d!39581 () Bool)

(declare-fun c!24005 () Bool)

(assert (=> d!39581 (= c!24005 (and ((_ is Cons!1704) (toList!864 call!14078)) (= (_1!1315 (h!2308 (toList!864 call!14078))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39581 (= (getValueByKey!169 (toList!864 call!14078) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) e!84972)))

(declare-fun b!130248 () Bool)

(assert (=> b!130248 (= e!84973 None!173)))

(assert (= (and d!39581 c!24005) b!130245))

(assert (= (and d!39581 (not c!24005)) b!130246))

(assert (= (and b!130246 c!24006) b!130247))

(assert (= (and b!130246 (not c!24006)) b!130248))

(assert (=> b!130247 m!151769))

(declare-fun m!153283 () Bool)

(assert (=> b!130247 m!153283))

(assert (=> b!129697 d!39581))

(assert (=> b!129812 d!39367))

(assert (=> b!129812 d!39327))

(declare-fun lt!67744 () ListLongMap!1697)

(declare-fun e!84984 () Bool)

(declare-fun b!130249 () Bool)

(assert (=> b!130249 (= e!84984 (= (apply!113 lt!67744 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))))))

(assert (=> b!130249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130250 () Bool)

(declare-fun e!84976 () Bool)

(declare-fun e!84983 () Bool)

(assert (=> b!130250 (= e!84976 e!84983)))

(declare-fun res!62825 () Bool)

(declare-fun call!14188 () Bool)

(assert (=> b!130250 (= res!62825 call!14188)))

(assert (=> b!130250 (=> (not res!62825) (not e!84983))))

(declare-fun b!130251 () Bool)

(declare-fun e!84985 () Bool)

(declare-fun call!14189 () Bool)

(assert (=> b!130251 (= e!84985 (not call!14189))))

(declare-fun bm!14181 () Bool)

(assert (=> bm!14181 (= call!14189 (contains!889 lt!67744 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130252 () Bool)

(declare-fun e!84986 () Unit!4039)

(declare-fun lt!67754 () Unit!4039)

(assert (=> b!130252 (= e!84986 lt!67754)))

(declare-fun lt!67756 () ListLongMap!1697)

(assert (=> b!130252 (= lt!67756 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67752 () (_ BitVec 64))

(assert (=> b!130252 (= lt!67752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67745 () (_ BitVec 64))

(assert (=> b!130252 (= lt!67745 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67751 () Unit!4039)

(assert (=> b!130252 (= lt!67751 (addStillContains!89 lt!67756 lt!67752 (zeroValue!2683 newMap!16) lt!67745))))

(assert (=> b!130252 (contains!889 (+!172 lt!67756 (tuple2!2609 lt!67752 (zeroValue!2683 newMap!16))) lt!67745)))

(declare-fun lt!67758 () Unit!4039)

(assert (=> b!130252 (= lt!67758 lt!67751)))

(declare-fun lt!67746 () ListLongMap!1697)

(assert (=> b!130252 (= lt!67746 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67749 () (_ BitVec 64))

(assert (=> b!130252 (= lt!67749 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67740 () (_ BitVec 64))

(assert (=> b!130252 (= lt!67740 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67755 () Unit!4039)

(assert (=> b!130252 (= lt!67755 (addApplyDifferent!89 lt!67746 lt!67749 (minValue!2683 newMap!16) lt!67740))))

(assert (=> b!130252 (= (apply!113 (+!172 lt!67746 (tuple2!2609 lt!67749 (minValue!2683 newMap!16))) lt!67740) (apply!113 lt!67746 lt!67740))))

(declare-fun lt!67753 () Unit!4039)

(assert (=> b!130252 (= lt!67753 lt!67755)))

(declare-fun lt!67738 () ListLongMap!1697)

(assert (=> b!130252 (= lt!67738 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67741 () (_ BitVec 64))

(assert (=> b!130252 (= lt!67741 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67742 () (_ BitVec 64))

(assert (=> b!130252 (= lt!67742 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67739 () Unit!4039)

(assert (=> b!130252 (= lt!67739 (addApplyDifferent!89 lt!67738 lt!67741 (zeroValue!2683 newMap!16) lt!67742))))

(assert (=> b!130252 (= (apply!113 (+!172 lt!67738 (tuple2!2609 lt!67741 (zeroValue!2683 newMap!16))) lt!67742) (apply!113 lt!67738 lt!67742))))

(declare-fun lt!67750 () Unit!4039)

(assert (=> b!130252 (= lt!67750 lt!67739)))

(declare-fun lt!67748 () ListLongMap!1697)

(assert (=> b!130252 (= lt!67748 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67757 () (_ BitVec 64))

(assert (=> b!130252 (= lt!67757 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67743 () (_ BitVec 64))

(assert (=> b!130252 (= lt!67743 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130252 (= lt!67754 (addApplyDifferent!89 lt!67748 lt!67757 (minValue!2683 newMap!16) lt!67743))))

(assert (=> b!130252 (= (apply!113 (+!172 lt!67748 (tuple2!2609 lt!67757 (minValue!2683 newMap!16))) lt!67743) (apply!113 lt!67748 lt!67743))))

(declare-fun b!130253 () Bool)

(declare-fun res!62827 () Bool)

(declare-fun e!84977 () Bool)

(assert (=> b!130253 (=> (not res!62827) (not e!84977))))

(assert (=> b!130253 (= res!62827 e!84985)))

(declare-fun c!24008 () Bool)

(assert (=> b!130253 (= c!24008 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130254 () Bool)

(declare-fun e!84974 () ListLongMap!1697)

(declare-fun call!14187 () ListLongMap!1697)

(assert (=> b!130254 (= e!84974 call!14187)))

(declare-fun b!130255 () Bool)

(declare-fun res!62826 () Bool)

(assert (=> b!130255 (=> (not res!62826) (not e!84977))))

(declare-fun e!84978 () Bool)

(assert (=> b!130255 (= res!62826 e!84978)))

(declare-fun res!62822 () Bool)

(assert (=> b!130255 (=> res!62822 e!84978)))

(declare-fun e!84975 () Bool)

(assert (=> b!130255 (= res!62822 (not e!84975))))

(declare-fun res!62820 () Bool)

(assert (=> b!130255 (=> (not res!62820) (not e!84975))))

(assert (=> b!130255 (= res!62820 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun bm!14182 () Bool)

(declare-fun call!14185 () ListLongMap!1697)

(declare-fun call!14184 () ListLongMap!1697)

(assert (=> bm!14182 (= call!14185 call!14184)))

(declare-fun d!39583 () Bool)

(assert (=> d!39583 e!84977))

(declare-fun res!62823 () Bool)

(assert (=> d!39583 (=> (not res!62823) (not e!84977))))

(assert (=> d!39583 (= res!62823 (or (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun lt!67759 () ListLongMap!1697)

(assert (=> d!39583 (= lt!67744 lt!67759)))

(declare-fun lt!67747 () Unit!4039)

(assert (=> d!39583 (= lt!67747 e!84986)))

(declare-fun c!24009 () Bool)

(declare-fun e!84981 () Bool)

(assert (=> d!39583 (= c!24009 e!84981)))

(declare-fun res!62824 () Bool)

(assert (=> d!39583 (=> (not res!62824) (not e!84981))))

(assert (=> d!39583 (= res!62824 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun e!84979 () ListLongMap!1697)

(assert (=> d!39583 (= lt!67759 e!84979)))

(declare-fun c!24010 () Bool)

(assert (=> d!39583 (= c!24010 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39583 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39583 (= (getCurrentListMap!541 (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67744)))

(declare-fun b!130256 () Bool)

(assert (=> b!130256 (= e!84981 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130257 () Bool)

(declare-fun e!84982 () ListLongMap!1697)

(declare-fun call!14190 () ListLongMap!1697)

(assert (=> b!130257 (= e!84982 call!14190)))

(declare-fun bm!14183 () Bool)

(assert (=> bm!14183 (= call!14188 (contains!889 lt!67744 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130258 () Bool)

(assert (=> b!130258 (= e!84978 e!84984)))

(declare-fun res!62821 () Bool)

(assert (=> b!130258 (=> (not res!62821) (not e!84984))))

(assert (=> b!130258 (= res!62821 (contains!889 lt!67744 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130259 () Bool)

(declare-fun c!24012 () Bool)

(assert (=> b!130259 (= c!24012 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130259 (= e!84982 e!84974)))

(declare-fun b!130260 () Bool)

(assert (=> b!130260 (= e!84977 e!84976)))

(declare-fun c!24007 () Bool)

(assert (=> b!130260 (= c!24007 (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130261 () Bool)

(declare-fun Unit!4075 () Unit!4039)

(assert (=> b!130261 (= e!84986 Unit!4075)))

(declare-fun bm!14184 () Bool)

(assert (=> bm!14184 (= call!14184 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!130262 () Bool)

(assert (=> b!130262 (= e!84979 e!84982)))

(declare-fun c!24011 () Bool)

(assert (=> b!130262 (= c!24011 (and (not (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14185 () Bool)

(declare-fun call!14186 () ListLongMap!1697)

(assert (=> bm!14185 (= call!14186 (+!172 (ite c!24010 call!14184 (ite c!24011 call!14185 call!14187)) (ite (or c!24010 c!24011) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun b!130263 () Bool)

(assert (=> b!130263 (= e!84975 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130264 () Bool)

(assert (=> b!130264 (= e!84983 (= (apply!113 lt!67744 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 newMap!16)))))

(declare-fun b!130265 () Bool)

(declare-fun e!84980 () Bool)

(assert (=> b!130265 (= e!84985 e!84980)))

(declare-fun res!62819 () Bool)

(assert (=> b!130265 (= res!62819 call!14189)))

(assert (=> b!130265 (=> (not res!62819) (not e!84980))))

(declare-fun bm!14186 () Bool)

(assert (=> bm!14186 (= call!14187 call!14185)))

(declare-fun bm!14187 () Bool)

(assert (=> bm!14187 (= call!14190 call!14186)))

(declare-fun b!130266 () Bool)

(assert (=> b!130266 (= e!84974 call!14190)))

(declare-fun b!130267 () Bool)

(assert (=> b!130267 (= e!84980 (= (apply!113 lt!67744 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 newMap!16)))))

(declare-fun b!130268 () Bool)

(assert (=> b!130268 (= e!84979 (+!172 call!14186 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(declare-fun b!130269 () Bool)

(assert (=> b!130269 (= e!84976 (not call!14188))))

(assert (= (and d!39583 c!24010) b!130268))

(assert (= (and d!39583 (not c!24010)) b!130262))

(assert (= (and b!130262 c!24011) b!130257))

(assert (= (and b!130262 (not c!24011)) b!130259))

(assert (= (and b!130259 c!24012) b!130266))

(assert (= (and b!130259 (not c!24012)) b!130254))

(assert (= (or b!130266 b!130254) bm!14186))

(assert (= (or b!130257 bm!14186) bm!14182))

(assert (= (or b!130257 b!130266) bm!14187))

(assert (= (or b!130268 bm!14182) bm!14184))

(assert (= (or b!130268 bm!14187) bm!14185))

(assert (= (and d!39583 res!62824) b!130256))

(assert (= (and d!39583 c!24009) b!130252))

(assert (= (and d!39583 (not c!24009)) b!130261))

(assert (= (and d!39583 res!62823) b!130255))

(assert (= (and b!130255 res!62820) b!130263))

(assert (= (and b!130255 (not res!62822)) b!130258))

(assert (= (and b!130258 res!62821) b!130249))

(assert (= (and b!130255 res!62826) b!130253))

(assert (= (and b!130253 c!24008) b!130265))

(assert (= (and b!130253 (not c!24008)) b!130251))

(assert (= (and b!130265 res!62819) b!130267))

(assert (= (or b!130265 b!130251) bm!14181))

(assert (= (and b!130253 res!62827) b!130260))

(assert (= (and b!130260 c!24007) b!130250))

(assert (= (and b!130260 (not c!24007)) b!130269))

(assert (= (and b!130250 res!62825) b!130264))

(assert (= (or b!130250 b!130269) bm!14183))

(declare-fun b_lambda!5781 () Bool)

(assert (=> (not b_lambda!5781) (not b!130249)))

(assert (=> b!130249 t!6114))

(declare-fun b_and!8063 () Bool)

(assert (= b_and!8059 (and (=> t!6114 result!3921) b_and!8063)))

(assert (=> b!130249 t!6116))

(declare-fun b_and!8065 () Bool)

(assert (= b_and!8061 (and (=> t!6116 result!3923) b_and!8065)))

(declare-fun m!153285 () Bool)

(assert (=> bm!14184 m!153285))

(declare-fun m!153287 () Bool)

(assert (=> bm!14183 m!153287))

(declare-fun m!153289 () Bool)

(assert (=> bm!14185 m!153289))

(declare-fun m!153291 () Bool)

(assert (=> b!130249 m!153291))

(assert (=> b!130249 m!152009))

(declare-fun m!153293 () Bool)

(assert (=> b!130249 m!153293))

(assert (=> b!130249 m!152013))

(assert (=> b!130249 m!152013))

(declare-fun m!153295 () Bool)

(assert (=> b!130249 m!153295))

(assert (=> b!130249 m!153291))

(assert (=> b!130249 m!152009))

(declare-fun m!153297 () Bool)

(assert (=> b!130267 m!153297))

(assert (=> b!130263 m!152013))

(assert (=> b!130263 m!152013))

(assert (=> b!130263 m!152019))

(assert (=> b!130256 m!152013))

(assert (=> b!130256 m!152013))

(assert (=> b!130256 m!152019))

(assert (=> d!39583 m!151983))

(declare-fun m!153299 () Bool)

(assert (=> b!130264 m!153299))

(declare-fun m!153301 () Bool)

(assert (=> b!130268 m!153301))

(declare-fun m!153303 () Bool)

(assert (=> bm!14181 m!153303))

(assert (=> b!130258 m!152013))

(assert (=> b!130258 m!152013))

(declare-fun m!153305 () Bool)

(assert (=> b!130258 m!153305))

(declare-fun m!153307 () Bool)

(assert (=> b!130252 m!153307))

(declare-fun m!153309 () Bool)

(assert (=> b!130252 m!153309))

(declare-fun m!153311 () Bool)

(assert (=> b!130252 m!153311))

(declare-fun m!153313 () Bool)

(assert (=> b!130252 m!153313))

(assert (=> b!130252 m!153285))

(declare-fun m!153315 () Bool)

(assert (=> b!130252 m!153315))

(declare-fun m!153317 () Bool)

(assert (=> b!130252 m!153317))

(declare-fun m!153319 () Bool)

(assert (=> b!130252 m!153319))

(declare-fun m!153321 () Bool)

(assert (=> b!130252 m!153321))

(declare-fun m!153323 () Bool)

(assert (=> b!130252 m!153323))

(assert (=> b!130252 m!152013))

(declare-fun m!153325 () Bool)

(assert (=> b!130252 m!153325))

(declare-fun m!153327 () Bool)

(assert (=> b!130252 m!153327))

(declare-fun m!153329 () Bool)

(assert (=> b!130252 m!153329))

(assert (=> b!130252 m!153315))

(declare-fun m!153331 () Bool)

(assert (=> b!130252 m!153331))

(declare-fun m!153333 () Bool)

(assert (=> b!130252 m!153333))

(assert (=> b!130252 m!153321))

(assert (=> b!130252 m!153327))

(assert (=> b!130252 m!153309))

(declare-fun m!153335 () Bool)

(assert (=> b!130252 m!153335))

(assert (=> b!129812 d!39583))

(declare-fun d!39585 () Bool)

(declare-fun isEmpty!404 (List!1708) Bool)

(assert (=> d!39585 (= (isEmpty!402 lt!67240) (isEmpty!404 (toList!864 lt!67240)))))

(declare-fun bs!5401 () Bool)

(assert (= bs!5401 d!39585))

(declare-fun m!153337 () Bool)

(assert (=> bs!5401 m!153337))

(assert (=> b!129572 d!39585))

(assert (=> b!129805 d!39357))

(declare-fun d!39587 () Bool)

(declare-fun res!62828 () Bool)

(declare-fun e!84987 () Bool)

(assert (=> d!39587 (=> res!62828 e!84987)))

(assert (=> d!39587 (= res!62828 (and ((_ is Cons!1704) (toList!864 e!84500)) (= (_1!1315 (h!2308 (toList!864 e!84500))) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))))))

(assert (=> d!39587 (= (containsKey!173 (toList!864 e!84500) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))) e!84987)))

(declare-fun b!130270 () Bool)

(declare-fun e!84988 () Bool)

(assert (=> b!130270 (= e!84987 e!84988)))

(declare-fun res!62829 () Bool)

(assert (=> b!130270 (=> (not res!62829) (not e!84988))))

(assert (=> b!130270 (= res!62829 (and (or (not ((_ is Cons!1704) (toList!864 e!84500))) (bvsle (_1!1315 (h!2308 (toList!864 e!84500))) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))) ((_ is Cons!1704) (toList!864 e!84500)) (bvslt (_1!1315 (h!2308 (toList!864 e!84500))) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161))))))))

(declare-fun b!130271 () Bool)

(assert (=> b!130271 (= e!84988 (containsKey!173 (t!6107 (toList!864 e!84500)) (ite c!23795 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))))

(assert (= (and d!39587 (not res!62828)) b!130270))

(assert (= (and b!130270 res!62829) b!130271))

(declare-fun m!153339 () Bool)

(assert (=> b!130271 m!153339))

(assert (=> d!39253 d!39587))

(assert (=> d!39255 d!39275))

(declare-fun b!130288 () Bool)

(declare-fun res!62840 () Bool)

(declare-fun lt!67762 () SeekEntryResult!272)

(assert (=> b!130288 (= res!62840 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3245 lt!67762)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84997 () Bool)

(assert (=> b!130288 (=> (not res!62840) (not e!84997))))

(declare-fun b!130289 () Bool)

(declare-fun e!84999 () Bool)

(assert (=> b!130289 (= e!84999 ((_ is Undefined!272) lt!67762))))

(declare-fun b!130290 () Bool)

(declare-fun e!84998 () Bool)

(assert (=> b!130290 (= e!84998 e!84999)))

(declare-fun c!24017 () Bool)

(assert (=> b!130290 (= c!24017 ((_ is MissingVacant!272) lt!67762))))

(declare-fun b!130291 () Bool)

(declare-fun e!85000 () Bool)

(declare-fun call!14195 () Bool)

(assert (=> b!130291 (= e!85000 (not call!14195))))

(declare-fun b!130292 () Bool)

(declare-fun res!62838 () Bool)

(assert (=> b!130292 (=> (not res!62838) (not e!85000))))

(assert (=> b!130292 (= res!62838 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3248 lt!67762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130293 () Bool)

(declare-fun res!62841 () Bool)

(assert (=> b!130293 (=> (not res!62841) (not e!85000))))

(declare-fun call!14196 () Bool)

(assert (=> b!130293 (= res!62841 call!14196)))

(assert (=> b!130293 (= e!84999 e!85000)))

(declare-fun c!24018 () Bool)

(declare-fun bm!14192 () Bool)

(assert (=> bm!14192 (= call!14196 (inRange!0 (ite c!24018 (index!3245 lt!67762) (index!3248 lt!67762)) (mask!7102 newMap!16)))))

(declare-fun b!130294 () Bool)

(assert (=> b!130294 (= e!84998 e!84997)))

(declare-fun res!62839 () Bool)

(assert (=> b!130294 (= res!62839 call!14196)))

(assert (=> b!130294 (=> (not res!62839) (not e!84997))))

(declare-fun bm!14193 () Bool)

(assert (=> bm!14193 (= call!14195 (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!39589 () Bool)

(assert (=> d!39589 e!84998))

(assert (=> d!39589 (= c!24018 ((_ is MissingZero!272) lt!67762))))

(assert (=> d!39589 (= lt!67762 (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(assert (=> d!39589 true))

(declare-fun _$34!966 () Unit!4039)

(assert (=> d!39589 (= (choose!787 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (defaultEntry!2824 newMap!16)) _$34!966)))

(declare-fun b!130295 () Bool)

(assert (=> b!130295 (= e!84997 (not call!14195))))

(assert (= (and d!39589 c!24018) b!130294))

(assert (= (and d!39589 (not c!24018)) b!130290))

(assert (= (and b!130294 res!62839) b!130288))

(assert (= (and b!130288 res!62840) b!130295))

(assert (= (and b!130290 c!24017) b!130293))

(assert (= (and b!130290 (not c!24017)) b!130289))

(assert (= (and b!130293 res!62841) b!130292))

(assert (= (and b!130292 res!62838) b!130291))

(assert (= (or b!130294 b!130293) bm!14192))

(assert (= (or b!130295 b!130291) bm!14193))

(declare-fun m!153341 () Bool)

(assert (=> b!130292 m!153341))

(declare-fun m!153343 () Bool)

(assert (=> bm!14192 m!153343))

(assert (=> bm!14193 m!151769))

(assert (=> bm!14193 m!151927))

(declare-fun m!153345 () Bool)

(assert (=> b!130288 m!153345))

(assert (=> d!39589 m!151769))

(assert (=> d!39589 m!151913))

(assert (=> d!39255 d!39589))

(assert (=> d!39255 d!39457))

(declare-fun d!39591 () Bool)

(declare-fun e!85001 () Bool)

(assert (=> d!39591 e!85001))

(declare-fun res!62842 () Bool)

(assert (=> d!39591 (=> res!62842 e!85001)))

(declare-fun lt!67766 () Bool)

(assert (=> d!39591 (= res!62842 (not lt!67766))))

(declare-fun lt!67765 () Bool)

(assert (=> d!39591 (= lt!67766 lt!67765)))

(declare-fun lt!67764 () Unit!4039)

(declare-fun e!85002 () Unit!4039)

(assert (=> d!39591 (= lt!67764 e!85002)))

(declare-fun c!24019 () Bool)

(assert (=> d!39591 (= c!24019 lt!67765)))

(assert (=> d!39591 (= lt!67765 (containsKey!173 (toList!864 lt!67204) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39591 (= (contains!889 lt!67204 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) lt!67766)))

(declare-fun b!130296 () Bool)

(declare-fun lt!67763 () Unit!4039)

(assert (=> b!130296 (= e!85002 lt!67763)))

(assert (=> b!130296 (= lt!67763 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67204) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130296 (isDefined!122 (getValueByKey!169 (toList!864 lt!67204) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130297 () Bool)

(declare-fun Unit!4076 () Unit!4039)

(assert (=> b!130297 (= e!85002 Unit!4076)))

(declare-fun b!130298 () Bool)

(assert (=> b!130298 (= e!85001 (isDefined!122 (getValueByKey!169 (toList!864 lt!67204) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39591 c!24019) b!130296))

(assert (= (and d!39591 (not c!24019)) b!130297))

(assert (= (and d!39591 (not res!62842)) b!130298))

(assert (=> d!39591 m!152013))

(declare-fun m!153347 () Bool)

(assert (=> d!39591 m!153347))

(assert (=> b!130296 m!152013))

(declare-fun m!153349 () Bool)

(assert (=> b!130296 m!153349))

(assert (=> b!130296 m!152013))

(assert (=> b!130296 m!152811))

(assert (=> b!130296 m!152811))

(declare-fun m!153351 () Bool)

(assert (=> b!130296 m!153351))

(assert (=> b!130298 m!152013))

(assert (=> b!130298 m!152811))

(assert (=> b!130298 m!152811))

(assert (=> b!130298 m!153351))

(assert (=> b!129527 d!39591))

(declare-fun d!39593 () Bool)

(declare-fun e!85003 () Bool)

(assert (=> d!39593 e!85003))

(declare-fun res!62843 () Bool)

(assert (=> d!39593 (=> res!62843 e!85003)))

(declare-fun lt!67770 () Bool)

(assert (=> d!39593 (= res!62843 (not lt!67770))))

(declare-fun lt!67769 () Bool)

(assert (=> d!39593 (= lt!67770 lt!67769)))

(declare-fun lt!67768 () Unit!4039)

(declare-fun e!85004 () Unit!4039)

(assert (=> d!39593 (= lt!67768 e!85004)))

(declare-fun c!24020 () Bool)

(assert (=> d!39593 (= c!24020 lt!67769)))

(assert (=> d!39593 (= lt!67769 (containsKey!173 (toList!864 lt!67474) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39593 (= (contains!889 lt!67474 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67770)))

(declare-fun b!130299 () Bool)

(declare-fun lt!67767 () Unit!4039)

(assert (=> b!130299 (= e!85004 lt!67767)))

(assert (=> b!130299 (= lt!67767 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67474) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!130299 (isDefined!122 (getValueByKey!169 (toList!864 lt!67474) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130300 () Bool)

(declare-fun Unit!4077 () Unit!4039)

(assert (=> b!130300 (= e!85004 Unit!4077)))

(declare-fun b!130301 () Bool)

(assert (=> b!130301 (= e!85003 (isDefined!122 (getValueByKey!169 (toList!864 lt!67474) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39593 c!24020) b!130299))

(assert (= (and d!39593 (not c!24020)) b!130300))

(assert (= (and d!39593 (not res!62843)) b!130301))

(declare-fun m!153353 () Bool)

(assert (=> d!39593 m!153353))

(declare-fun m!153355 () Bool)

(assert (=> b!130299 m!153355))

(assert (=> b!130299 m!152503))

(assert (=> b!130299 m!152503))

(declare-fun m!153357 () Bool)

(assert (=> b!130299 m!153357))

(assert (=> b!130301 m!152503))

(assert (=> b!130301 m!152503))

(assert (=> b!130301 m!153357))

(assert (=> d!39351 d!39593))

(declare-fun b!130304 () Bool)

(declare-fun e!85006 () Option!175)

(assert (=> b!130304 (= e!85006 (getValueByKey!169 (t!6107 lt!67475) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130302 () Bool)

(declare-fun e!85005 () Option!175)

(assert (=> b!130302 (= e!85005 (Some!174 (_2!1315 (h!2308 lt!67475))))))

(declare-fun b!130303 () Bool)

(assert (=> b!130303 (= e!85005 e!85006)))

(declare-fun c!24022 () Bool)

(assert (=> b!130303 (= c!24022 (and ((_ is Cons!1704) lt!67475) (not (= (_1!1315 (h!2308 lt!67475)) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!24021 () Bool)

(declare-fun d!39595 () Bool)

(assert (=> d!39595 (= c!24021 (and ((_ is Cons!1704) lt!67475) (= (_1!1315 (h!2308 lt!67475)) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39595 (= (getValueByKey!169 lt!67475 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!85005)))

(declare-fun b!130305 () Bool)

(assert (=> b!130305 (= e!85006 None!173)))

(assert (= (and d!39595 c!24021) b!130302))

(assert (= (and d!39595 (not c!24021)) b!130303))

(assert (= (and b!130303 c!24022) b!130304))

(assert (= (and b!130303 (not c!24022)) b!130305))

(declare-fun m!153359 () Bool)

(assert (=> b!130304 m!153359))

(assert (=> d!39351 d!39595))

(declare-fun d!39597 () Bool)

(assert (=> d!39597 (= (getValueByKey!169 lt!67475 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!174 (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!67771 () Unit!4039)

(assert (=> d!39597 (= lt!67771 (choose!796 lt!67475 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!85007 () Bool)

(assert (=> d!39597 e!85007))

(declare-fun res!62844 () Bool)

(assert (=> d!39597 (=> (not res!62844) (not e!85007))))

(assert (=> d!39597 (= res!62844 (isStrictlySorted!319 lt!67475))))

(assert (=> d!39597 (= (lemmaContainsTupThenGetReturnValue!84 lt!67475 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67771)))

(declare-fun b!130306 () Bool)

(declare-fun res!62845 () Bool)

(assert (=> b!130306 (=> (not res!62845) (not e!85007))))

(assert (=> b!130306 (= res!62845 (containsKey!173 lt!67475 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130307 () Bool)

(assert (=> b!130307 (= e!85007 (contains!890 lt!67475 (tuple2!2609 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39597 res!62844) b!130306))

(assert (= (and b!130306 res!62845) b!130307))

(assert (=> d!39597 m!152497))

(declare-fun m!153361 () Bool)

(assert (=> d!39597 m!153361))

(declare-fun m!153363 () Bool)

(assert (=> d!39597 m!153363))

(declare-fun m!153365 () Bool)

(assert (=> b!130306 m!153365))

(declare-fun m!153367 () Bool)

(assert (=> b!130307 m!153367))

(assert (=> d!39351 d!39597))

(declare-fun bm!14194 () Bool)

(declare-fun c!24026 () Bool)

(declare-fun e!85009 () List!1708)

(declare-fun call!14199 () List!1708)

(assert (=> bm!14194 (= call!14199 ($colon$colon!91 e!85009 (ite c!24026 (h!2308 (toList!864 (ite c!23800 call!14057 call!14077))) (tuple2!2609 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!24023 () Bool)

(assert (=> bm!14194 (= c!24023 c!24026)))

(declare-fun c!24025 () Bool)

(declare-fun b!130308 () Bool)

(declare-fun c!24024 () Bool)

(assert (=> b!130308 (= e!85009 (ite c!24024 (t!6107 (toList!864 (ite c!23800 call!14057 call!14077))) (ite c!24025 (Cons!1704 (h!2308 (toList!864 (ite c!23800 call!14057 call!14077))) (t!6107 (toList!864 (ite c!23800 call!14057 call!14077)))) Nil!1705)))))

(declare-fun b!130309 () Bool)

(declare-fun e!85010 () List!1708)

(declare-fun call!14198 () List!1708)

(assert (=> b!130309 (= e!85010 call!14198)))

(declare-fun lt!67772 () List!1708)

(declare-fun e!85012 () Bool)

(declare-fun b!130310 () Bool)

(assert (=> b!130310 (= e!85012 (contains!890 lt!67772 (tuple2!2609 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!130311 () Bool)

(declare-fun res!62847 () Bool)

(assert (=> b!130311 (=> (not res!62847) (not e!85012))))

(assert (=> b!130311 (= res!62847 (containsKey!173 lt!67772 (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130312 () Bool)

(assert (=> b!130312 (= e!85010 call!14198)))

(declare-fun b!130313 () Bool)

(declare-fun e!85008 () List!1708)

(declare-fun call!14197 () List!1708)

(assert (=> b!130313 (= e!85008 call!14197)))

(declare-fun b!130314 () Bool)

(assert (=> b!130314 (= c!24025 (and ((_ is Cons!1704) (toList!864 (ite c!23800 call!14057 call!14077))) (bvsgt (_1!1315 (h!2308 (toList!864 (ite c!23800 call!14057 call!14077)))) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!130314 (= e!85008 e!85010)))

(declare-fun bm!14196 () Bool)

(assert (=> bm!14196 (= call!14197 call!14199)))

(declare-fun b!130315 () Bool)

(declare-fun e!85011 () List!1708)

(assert (=> b!130315 (= e!85011 e!85008)))

(assert (=> b!130315 (= c!24024 (and ((_ is Cons!1704) (toList!864 (ite c!23800 call!14057 call!14077))) (= (_1!1315 (h!2308 (toList!864 (ite c!23800 call!14057 call!14077)))) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun bm!14195 () Bool)

(assert (=> bm!14195 (= call!14198 call!14197)))

(declare-fun d!39599 () Bool)

(assert (=> d!39599 e!85012))

(declare-fun res!62846 () Bool)

(assert (=> d!39599 (=> (not res!62846) (not e!85012))))

(assert (=> d!39599 (= res!62846 (isStrictlySorted!319 lt!67772))))

(assert (=> d!39599 (= lt!67772 e!85011)))

(assert (=> d!39599 (= c!24026 (and ((_ is Cons!1704) (toList!864 (ite c!23800 call!14057 call!14077))) (bvslt (_1!1315 (h!2308 (toList!864 (ite c!23800 call!14057 call!14077)))) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39599 (isStrictlySorted!319 (toList!864 (ite c!23800 call!14057 call!14077)))))

(assert (=> d!39599 (= (insertStrictlySorted!87 (toList!864 (ite c!23800 call!14057 call!14077)) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67772)))

(declare-fun b!130316 () Bool)

(assert (=> b!130316 (= e!85011 call!14199)))

(declare-fun b!130317 () Bool)

(assert (=> b!130317 (= e!85009 (insertStrictlySorted!87 (t!6107 (toList!864 (ite c!23800 call!14057 call!14077))) (_1!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1315 (ite c!23800 (ite c!23802 (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39599 c!24026) b!130316))

(assert (= (and d!39599 (not c!24026)) b!130315))

(assert (= (and b!130315 c!24024) b!130313))

(assert (= (and b!130315 (not c!24024)) b!130314))

(assert (= (and b!130314 c!24025) b!130309))

(assert (= (and b!130314 (not c!24025)) b!130312))

(assert (= (or b!130309 b!130312) bm!14195))

(assert (= (or b!130313 bm!14195) bm!14196))

(assert (= (or b!130316 bm!14196) bm!14194))

(assert (= (and bm!14194 c!24023) b!130317))

(assert (= (and bm!14194 (not c!24023)) b!130308))

(assert (= (and d!39599 res!62846) b!130311))

(assert (= (and b!130311 res!62847) b!130310))

(declare-fun m!153369 () Bool)

(assert (=> b!130310 m!153369))

(declare-fun m!153371 () Bool)

(assert (=> b!130311 m!153371))

(declare-fun m!153373 () Bool)

(assert (=> b!130317 m!153373))

(declare-fun m!153375 () Bool)

(assert (=> bm!14194 m!153375))

(declare-fun m!153377 () Bool)

(assert (=> d!39599 m!153377))

(declare-fun m!153379 () Bool)

(assert (=> d!39599 m!153379))

(assert (=> d!39351 d!39599))

(declare-fun d!39601 () Bool)

(declare-fun res!62850 () Bool)

(declare-fun e!85013 () Bool)

(assert (=> d!39601 (=> (not res!62850) (not e!85013))))

(assert (=> d!39601 (= res!62850 (validMask!0 (mask!7102 (v!3162 (underlying!448 thiss!992)))))))

(assert (=> d!39601 (= (simpleValid!89 (v!3162 (underlying!448 thiss!992))) e!85013)))

(declare-fun b!130320 () Bool)

(declare-fun res!62849 () Bool)

(assert (=> b!130320 (=> (not res!62849) (not e!85013))))

(assert (=> b!130320 (= res!62849 (= (size!2513 (v!3162 (underlying!448 thiss!992))) (bvadd (_size!589 (v!3162 (underlying!448 thiss!992))) (bvsdiv (bvadd (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!130321 () Bool)

(assert (=> b!130321 (= e!85013 (and (bvsge (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2597 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!589 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!130319 () Bool)

(declare-fun res!62851 () Bool)

(assert (=> b!130319 (=> (not res!62851) (not e!85013))))

(assert (=> b!130319 (= res!62851 (bvsge (size!2513 (v!3162 (underlying!448 thiss!992))) (_size!589 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!130318 () Bool)

(declare-fun res!62848 () Bool)

(assert (=> b!130318 (=> (not res!62848) (not e!85013))))

(assert (=> b!130318 (= res!62848 (and (= (size!2510 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000001)) (= (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (size!2510 (_values!2807 (v!3162 (underlying!448 thiss!992))))) (bvsge (_size!589 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!589 (v!3162 (underlying!448 thiss!992))) (bvadd (mask!7102 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000001))))))

(assert (= (and d!39601 res!62850) b!130318))

(assert (= (and b!130318 res!62848) b!130319))

(assert (= (and b!130319 res!62851) b!130320))

(assert (= (and b!130320 res!62849) b!130321))

(assert (=> d!39601 m!151781))

(declare-fun m!153381 () Bool)

(assert (=> b!130320 m!153381))

(assert (=> b!130319 m!153381))

(assert (=> d!39259 d!39601))

(assert (=> d!39315 d!39303))

(assert (=> d!39315 d!39301))

(declare-fun d!39603 () Bool)

(assert (=> d!39603 (contains!889 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67068)))

(assert (=> d!39603 true))

(declare-fun _$35!377 () Unit!4039)

(assert (=> d!39603 (= (choose!791 lt!67079 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67068) _$35!377)))

(declare-fun bs!5402 () Bool)

(assert (= bs!5402 d!39603))

(assert (=> bs!5402 m!151881))

(assert (=> bs!5402 m!151881))

(assert (=> bs!5402 m!151883))

(assert (=> d!39315 d!39603))

(declare-fun d!39605 () Bool)

(declare-fun e!85014 () Bool)

(assert (=> d!39605 e!85014))

(declare-fun res!62852 () Bool)

(assert (=> d!39605 (=> res!62852 e!85014)))

(declare-fun lt!67776 () Bool)

(assert (=> d!39605 (= res!62852 (not lt!67776))))

(declare-fun lt!67775 () Bool)

(assert (=> d!39605 (= lt!67776 lt!67775)))

(declare-fun lt!67774 () Unit!4039)

(declare-fun e!85015 () Unit!4039)

(assert (=> d!39605 (= lt!67774 e!85015)))

(declare-fun c!24027 () Bool)

(assert (=> d!39605 (= c!24027 lt!67775)))

(assert (=> d!39605 (= lt!67775 (containsKey!173 (toList!864 lt!67079) lt!67068))))

(assert (=> d!39605 (= (contains!889 lt!67079 lt!67068) lt!67776)))

(declare-fun b!130323 () Bool)

(declare-fun lt!67773 () Unit!4039)

(assert (=> b!130323 (= e!85015 lt!67773)))

(assert (=> b!130323 (= lt!67773 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67079) lt!67068))))

(assert (=> b!130323 (isDefined!122 (getValueByKey!169 (toList!864 lt!67079) lt!67068))))

(declare-fun b!130324 () Bool)

(declare-fun Unit!4078 () Unit!4039)

(assert (=> b!130324 (= e!85015 Unit!4078)))

(declare-fun b!130325 () Bool)

(assert (=> b!130325 (= e!85014 (isDefined!122 (getValueByKey!169 (toList!864 lt!67079) lt!67068)))))

(assert (= (and d!39605 c!24027) b!130323))

(assert (= (and d!39605 (not c!24027)) b!130324))

(assert (= (and d!39605 (not res!62852)) b!130325))

(declare-fun m!153383 () Bool)

(assert (=> d!39605 m!153383))

(declare-fun m!153385 () Bool)

(assert (=> b!130323 m!153385))

(declare-fun m!153387 () Bool)

(assert (=> b!130323 m!153387))

(assert (=> b!130323 m!153387))

(declare-fun m!153389 () Bool)

(assert (=> b!130323 m!153389))

(assert (=> b!130325 m!153387))

(assert (=> b!130325 m!153387))

(assert (=> b!130325 m!153389))

(assert (=> d!39315 d!39605))

(declare-fun lt!67777 () Bool)

(declare-fun d!39607 () Bool)

(assert (=> d!39607 (= lt!67777 (select (content!129 (toList!864 lt!67389)) (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun e!85017 () Bool)

(assert (=> d!39607 (= lt!67777 e!85017)))

(declare-fun res!62853 () Bool)

(assert (=> d!39607 (=> (not res!62853) (not e!85017))))

(assert (=> d!39607 (= res!62853 ((_ is Cons!1704) (toList!864 lt!67389)))))

(assert (=> d!39607 (= (contains!890 (toList!864 lt!67389) (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67777)))

(declare-fun b!130326 () Bool)

(declare-fun e!85016 () Bool)

(assert (=> b!130326 (= e!85017 e!85016)))

(declare-fun res!62854 () Bool)

(assert (=> b!130326 (=> res!62854 e!85016)))

(assert (=> b!130326 (= res!62854 (= (h!2308 (toList!864 lt!67389)) (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!130327 () Bool)

(assert (=> b!130327 (= e!85016 (contains!890 (t!6107 (toList!864 lt!67389)) (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39607 res!62853) b!130326))

(assert (= (and b!130326 (not res!62854)) b!130327))

(declare-fun m!153391 () Bool)

(assert (=> d!39607 m!153391))

(declare-fun m!153393 () Bool)

(assert (=> d!39607 m!153393))

(declare-fun m!153395 () Bool)

(assert (=> b!130327 m!153395))

(assert (=> b!129717 d!39607))

(declare-fun d!39609 () Bool)

(assert (=> d!39609 (= (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67065)) (v!3165 (getValueByKey!169 (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67065)))))

(assert (=> d!39311 d!39609))

(declare-fun b!130330 () Bool)

(declare-fun e!85019 () Option!175)

(assert (=> b!130330 (= e!85019 (getValueByKey!169 (t!6107 (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) lt!67065))))

(declare-fun b!130328 () Bool)

(declare-fun e!85018 () Option!175)

(assert (=> b!130328 (= e!85018 (Some!174 (_2!1315 (h!2308 (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))))

(declare-fun b!130329 () Bool)

(assert (=> b!130329 (= e!85018 e!85019)))

(declare-fun c!24029 () Bool)

(assert (=> b!130329 (= c!24029 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) (not (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67065))))))

(declare-fun c!24028 () Bool)

(declare-fun d!39611 () Bool)

(assert (=> d!39611 (= c!24028 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67065)))))

(assert (=> d!39611 (= (getValueByKey!169 (toList!864 (+!172 lt!67061 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67065) e!85018)))

(declare-fun b!130331 () Bool)

(assert (=> b!130331 (= e!85019 None!173)))

(assert (= (and d!39611 c!24028) b!130328))

(assert (= (and d!39611 (not c!24028)) b!130329))

(assert (= (and b!130329 c!24029) b!130330))

(assert (= (and b!130329 (not c!24029)) b!130331))

(declare-fun m!153397 () Bool)

(assert (=> b!130330 m!153397))

(assert (=> d!39311 d!39611))

(declare-fun d!39613 () Bool)

(declare-fun res!62857 () Bool)

(declare-fun e!85020 () Bool)

(assert (=> d!39613 (=> (not res!62857) (not e!85020))))

(assert (=> d!39613 (= res!62857 (validMask!0 (mask!7102 (_2!1316 lt!67159))))))

(assert (=> d!39613 (= (simpleValid!89 (_2!1316 lt!67159)) e!85020)))

(declare-fun b!130334 () Bool)

(declare-fun res!62856 () Bool)

(assert (=> b!130334 (=> (not res!62856) (not e!85020))))

(assert (=> b!130334 (= res!62856 (= (size!2513 (_2!1316 lt!67159)) (bvadd (_size!589 (_2!1316 lt!67159)) (bvsdiv (bvadd (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!130335 () Bool)

(assert (=> b!130335 (= e!85020 (and (bvsge (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000000) (bvsle (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000011) (bvsge (_vacant!589 (_2!1316 lt!67159)) #b00000000000000000000000000000000)))))

(declare-fun b!130333 () Bool)

(declare-fun res!62858 () Bool)

(assert (=> b!130333 (=> (not res!62858) (not e!85020))))

(assert (=> b!130333 (= res!62858 (bvsge (size!2513 (_2!1316 lt!67159)) (_size!589 (_2!1316 lt!67159))))))

(declare-fun b!130332 () Bool)

(declare-fun res!62855 () Bool)

(assert (=> b!130332 (=> (not res!62855) (not e!85020))))

(assert (=> b!130332 (= res!62855 (and (= (size!2510 (_values!2807 (_2!1316 lt!67159))) (bvadd (mask!7102 (_2!1316 lt!67159)) #b00000000000000000000000000000001)) (= (size!2509 (_keys!4565 (_2!1316 lt!67159))) (size!2510 (_values!2807 (_2!1316 lt!67159)))) (bvsge (_size!589 (_2!1316 lt!67159)) #b00000000000000000000000000000000) (bvsle (_size!589 (_2!1316 lt!67159)) (bvadd (mask!7102 (_2!1316 lt!67159)) #b00000000000000000000000000000001))))))

(assert (= (and d!39613 res!62857) b!130332))

(assert (= (and b!130332 res!62855) b!130333))

(assert (= (and b!130333 res!62858) b!130334))

(assert (= (and b!130334 res!62856) b!130335))

(declare-fun m!153399 () Bool)

(assert (=> d!39613 m!153399))

(declare-fun m!153401 () Bool)

(assert (=> b!130334 m!153401))

(assert (=> b!130333 m!153401))

(assert (=> d!39257 d!39613))

(declare-fun lt!67778 () Bool)

(declare-fun d!39615 () Bool)

(assert (=> d!39615 (= lt!67778 (select (content!129 (toList!864 lt!67195)) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!85022 () Bool)

(assert (=> d!39615 (= lt!67778 e!85022)))

(declare-fun res!62859 () Bool)

(assert (=> d!39615 (=> (not res!62859) (not e!85022))))

(assert (=> d!39615 (= res!62859 ((_ is Cons!1704) (toList!864 lt!67195)))))

(assert (=> d!39615 (= (contains!890 (toList!864 lt!67195) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67778)))

(declare-fun b!130336 () Bool)

(declare-fun e!85021 () Bool)

(assert (=> b!130336 (= e!85022 e!85021)))

(declare-fun res!62860 () Bool)

(assert (=> b!130336 (=> res!62860 e!85021)))

(assert (=> b!130336 (= res!62860 (= (h!2308 (toList!864 lt!67195)) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!130337 () Bool)

(assert (=> b!130337 (= e!85021 (contains!890 (t!6107 (toList!864 lt!67195)) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39615 res!62859) b!130336))

(assert (= (and b!130336 (not res!62860)) b!130337))

(declare-fun m!153403 () Bool)

(assert (=> d!39615 m!153403))

(declare-fun m!153405 () Bool)

(assert (=> d!39615 m!153405))

(declare-fun m!153407 () Bool)

(assert (=> b!130337 m!153407))

(assert (=> b!129517 d!39615))

(declare-fun d!39617 () Bool)

(assert (=> d!39617 (contains!889 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))

(declare-fun lt!67781 () Unit!4039)

(declare-fun choose!798 (array!4739 array!4741 (_ BitVec 32) (_ BitVec 32) V!3459 V!3459 (_ BitVec 64) (_ BitVec 32) Int) Unit!4039)

(assert (=> d!39617 (= lt!67781 (choose!798 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(assert (=> d!39617 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39617 (= (lemmaArrayContainsKeyThenInListMap!39 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67781)))

(declare-fun bs!5403 () Bool)

(assert (= bs!5403 d!39617))

(assert (=> bs!5403 m!151839))

(assert (=> bs!5403 m!151839))

(assert (=> bs!5403 m!151769))

(assert (=> bs!5403 m!152139))

(assert (=> bs!5403 m!151769))

(declare-fun m!153409 () Bool)

(assert (=> bs!5403 m!153409))

(assert (=> bs!5403 m!151983))

(assert (=> b!129653 d!39617))

(assert (=> b!129653 d!39373))

(assert (=> b!129653 d!39327))

(declare-fun b!130338 () Bool)

(declare-fun e!85033 () Bool)

(declare-fun lt!67788 () ListLongMap!1697)

(assert (=> b!130338 (= e!85033 (= (apply!113 lt!67788 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (_values!2807 (_2!1316 lt!67159))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 (_2!1316 lt!67159)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (_values!2807 (_2!1316 lt!67159)))))))

(assert (=> b!130338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(declare-fun b!130339 () Bool)

(declare-fun e!85025 () Bool)

(declare-fun e!85032 () Bool)

(assert (=> b!130339 (= e!85025 e!85032)))

(declare-fun res!62867 () Bool)

(declare-fun call!14204 () Bool)

(assert (=> b!130339 (= res!62867 call!14204)))

(assert (=> b!130339 (=> (not res!62867) (not e!85032))))

(declare-fun b!130340 () Bool)

(declare-fun e!85034 () Bool)

(declare-fun call!14205 () Bool)

(assert (=> b!130340 (= e!85034 (not call!14205))))

(declare-fun bm!14197 () Bool)

(assert (=> bm!14197 (= call!14205 (contains!889 lt!67788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130341 () Bool)

(declare-fun e!85035 () Unit!4039)

(declare-fun lt!67798 () Unit!4039)

(assert (=> b!130341 (= e!85035 lt!67798)))

(declare-fun lt!67800 () ListLongMap!1697)

(assert (=> b!130341 (= lt!67800 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (_2!1316 lt!67159)) (_values!2807 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159)) (extraKeys!2597 (_2!1316 lt!67159)) (zeroValue!2683 (_2!1316 lt!67159)) (minValue!2683 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (defaultEntry!2824 (_2!1316 lt!67159))))))

(declare-fun lt!67796 () (_ BitVec 64))

(assert (=> b!130341 (= lt!67796 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67789 () (_ BitVec 64))

(assert (=> b!130341 (= lt!67789 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000))))

(declare-fun lt!67795 () Unit!4039)

(assert (=> b!130341 (= lt!67795 (addStillContains!89 lt!67800 lt!67796 (zeroValue!2683 (_2!1316 lt!67159)) lt!67789))))

(assert (=> b!130341 (contains!889 (+!172 lt!67800 (tuple2!2609 lt!67796 (zeroValue!2683 (_2!1316 lt!67159)))) lt!67789)))

(declare-fun lt!67802 () Unit!4039)

(assert (=> b!130341 (= lt!67802 lt!67795)))

(declare-fun lt!67790 () ListLongMap!1697)

(assert (=> b!130341 (= lt!67790 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (_2!1316 lt!67159)) (_values!2807 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159)) (extraKeys!2597 (_2!1316 lt!67159)) (zeroValue!2683 (_2!1316 lt!67159)) (minValue!2683 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (defaultEntry!2824 (_2!1316 lt!67159))))))

(declare-fun lt!67793 () (_ BitVec 64))

(assert (=> b!130341 (= lt!67793 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67784 () (_ BitVec 64))

(assert (=> b!130341 (= lt!67784 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000))))

(declare-fun lt!67799 () Unit!4039)

(assert (=> b!130341 (= lt!67799 (addApplyDifferent!89 lt!67790 lt!67793 (minValue!2683 (_2!1316 lt!67159)) lt!67784))))

(assert (=> b!130341 (= (apply!113 (+!172 lt!67790 (tuple2!2609 lt!67793 (minValue!2683 (_2!1316 lt!67159)))) lt!67784) (apply!113 lt!67790 lt!67784))))

(declare-fun lt!67797 () Unit!4039)

(assert (=> b!130341 (= lt!67797 lt!67799)))

(declare-fun lt!67782 () ListLongMap!1697)

(assert (=> b!130341 (= lt!67782 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (_2!1316 lt!67159)) (_values!2807 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159)) (extraKeys!2597 (_2!1316 lt!67159)) (zeroValue!2683 (_2!1316 lt!67159)) (minValue!2683 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (defaultEntry!2824 (_2!1316 lt!67159))))))

(declare-fun lt!67785 () (_ BitVec 64))

(assert (=> b!130341 (= lt!67785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67786 () (_ BitVec 64))

(assert (=> b!130341 (= lt!67786 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000))))

(declare-fun lt!67783 () Unit!4039)

(assert (=> b!130341 (= lt!67783 (addApplyDifferent!89 lt!67782 lt!67785 (zeroValue!2683 (_2!1316 lt!67159)) lt!67786))))

(assert (=> b!130341 (= (apply!113 (+!172 lt!67782 (tuple2!2609 lt!67785 (zeroValue!2683 (_2!1316 lt!67159)))) lt!67786) (apply!113 lt!67782 lt!67786))))

(declare-fun lt!67794 () Unit!4039)

(assert (=> b!130341 (= lt!67794 lt!67783)))

(declare-fun lt!67792 () ListLongMap!1697)

(assert (=> b!130341 (= lt!67792 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (_2!1316 lt!67159)) (_values!2807 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159)) (extraKeys!2597 (_2!1316 lt!67159)) (zeroValue!2683 (_2!1316 lt!67159)) (minValue!2683 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (defaultEntry!2824 (_2!1316 lt!67159))))))

(declare-fun lt!67801 () (_ BitVec 64))

(assert (=> b!130341 (= lt!67801 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67787 () (_ BitVec 64))

(assert (=> b!130341 (= lt!67787 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000))))

(assert (=> b!130341 (= lt!67798 (addApplyDifferent!89 lt!67792 lt!67801 (minValue!2683 (_2!1316 lt!67159)) lt!67787))))

(assert (=> b!130341 (= (apply!113 (+!172 lt!67792 (tuple2!2609 lt!67801 (minValue!2683 (_2!1316 lt!67159)))) lt!67787) (apply!113 lt!67792 lt!67787))))

(declare-fun b!130342 () Bool)

(declare-fun res!62869 () Bool)

(declare-fun e!85026 () Bool)

(assert (=> b!130342 (=> (not res!62869) (not e!85026))))

(assert (=> b!130342 (= res!62869 e!85034)))

(declare-fun c!24031 () Bool)

(assert (=> b!130342 (= c!24031 (not (= (bvand (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130343 () Bool)

(declare-fun e!85023 () ListLongMap!1697)

(declare-fun call!14203 () ListLongMap!1697)

(assert (=> b!130343 (= e!85023 call!14203)))

(declare-fun b!130344 () Bool)

(declare-fun res!62868 () Bool)

(assert (=> b!130344 (=> (not res!62868) (not e!85026))))

(declare-fun e!85027 () Bool)

(assert (=> b!130344 (= res!62868 e!85027)))

(declare-fun res!62864 () Bool)

(assert (=> b!130344 (=> res!62864 e!85027)))

(declare-fun e!85024 () Bool)

(assert (=> b!130344 (= res!62864 (not e!85024))))

(declare-fun res!62862 () Bool)

(assert (=> b!130344 (=> (not res!62862) (not e!85024))))

(assert (=> b!130344 (= res!62862 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(declare-fun bm!14198 () Bool)

(declare-fun call!14201 () ListLongMap!1697)

(declare-fun call!14200 () ListLongMap!1697)

(assert (=> bm!14198 (= call!14201 call!14200)))

(declare-fun d!39619 () Bool)

(assert (=> d!39619 e!85026))

(declare-fun res!62865 () Bool)

(assert (=> d!39619 (=> (not res!62865) (not e!85026))))

(assert (=> d!39619 (= res!62865 (or (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))))

(declare-fun lt!67803 () ListLongMap!1697)

(assert (=> d!39619 (= lt!67788 lt!67803)))

(declare-fun lt!67791 () Unit!4039)

(assert (=> d!39619 (= lt!67791 e!85035)))

(declare-fun c!24032 () Bool)

(declare-fun e!85030 () Bool)

(assert (=> d!39619 (= c!24032 e!85030)))

(declare-fun res!62866 () Bool)

(assert (=> d!39619 (=> (not res!62866) (not e!85030))))

(assert (=> d!39619 (= res!62866 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(declare-fun e!85028 () ListLongMap!1697)

(assert (=> d!39619 (= lt!67803 e!85028)))

(declare-fun c!24033 () Bool)

(assert (=> d!39619 (= c!24033 (and (not (= (bvand (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39619 (validMask!0 (mask!7102 (_2!1316 lt!67159)))))

(assert (=> d!39619 (= (getCurrentListMap!541 (_keys!4565 (_2!1316 lt!67159)) (_values!2807 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159)) (extraKeys!2597 (_2!1316 lt!67159)) (zeroValue!2683 (_2!1316 lt!67159)) (minValue!2683 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (defaultEntry!2824 (_2!1316 lt!67159))) lt!67788)))

(declare-fun b!130345 () Bool)

(assert (=> b!130345 (= e!85030 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(declare-fun b!130346 () Bool)

(declare-fun e!85031 () ListLongMap!1697)

(declare-fun call!14206 () ListLongMap!1697)

(assert (=> b!130346 (= e!85031 call!14206)))

(declare-fun bm!14199 () Bool)

(assert (=> bm!14199 (= call!14204 (contains!889 lt!67788 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130347 () Bool)

(assert (=> b!130347 (= e!85027 e!85033)))

(declare-fun res!62863 () Bool)

(assert (=> b!130347 (=> (not res!62863) (not e!85033))))

(assert (=> b!130347 (= res!62863 (contains!889 lt!67788 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(assert (=> b!130347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(declare-fun b!130348 () Bool)

(declare-fun c!24035 () Bool)

(assert (=> b!130348 (= c!24035 (and (not (= (bvand (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130348 (= e!85031 e!85023)))

(declare-fun b!130349 () Bool)

(assert (=> b!130349 (= e!85026 e!85025)))

(declare-fun c!24030 () Bool)

(assert (=> b!130349 (= c!24030 (not (= (bvand (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130350 () Bool)

(declare-fun Unit!4079 () Unit!4039)

(assert (=> b!130350 (= e!85035 Unit!4079)))

(declare-fun bm!14200 () Bool)

(assert (=> bm!14200 (= call!14200 (getCurrentListMapNoExtraKeys!138 (_keys!4565 (_2!1316 lt!67159)) (_values!2807 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159)) (extraKeys!2597 (_2!1316 lt!67159)) (zeroValue!2683 (_2!1316 lt!67159)) (minValue!2683 (_2!1316 lt!67159)) #b00000000000000000000000000000000 (defaultEntry!2824 (_2!1316 lt!67159))))))

(declare-fun b!130351 () Bool)

(assert (=> b!130351 (= e!85028 e!85031)))

(declare-fun c!24034 () Bool)

(assert (=> b!130351 (= c!24034 (and (not (= (bvand (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2597 (_2!1316 lt!67159)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!14202 () ListLongMap!1697)

(declare-fun bm!14201 () Bool)

(assert (=> bm!14201 (= call!14202 (+!172 (ite c!24033 call!14200 (ite c!24034 call!14201 call!14203)) (ite (or c!24033 c!24034) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (_2!1316 lt!67159))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (_2!1316 lt!67159))))))))

(declare-fun b!130352 () Bool)

(assert (=> b!130352 (= e!85024 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(declare-fun b!130353 () Bool)

(assert (=> b!130353 (= e!85032 (= (apply!113 lt!67788 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2683 (_2!1316 lt!67159))))))

(declare-fun b!130354 () Bool)

(declare-fun e!85029 () Bool)

(assert (=> b!130354 (= e!85034 e!85029)))

(declare-fun res!62861 () Bool)

(assert (=> b!130354 (= res!62861 call!14205)))

(assert (=> b!130354 (=> (not res!62861) (not e!85029))))

(declare-fun bm!14202 () Bool)

(assert (=> bm!14202 (= call!14203 call!14201)))

(declare-fun bm!14203 () Bool)

(assert (=> bm!14203 (= call!14206 call!14202)))

(declare-fun b!130355 () Bool)

(assert (=> b!130355 (= e!85023 call!14206)))

(declare-fun b!130356 () Bool)

(assert (=> b!130356 (= e!85029 (= (apply!113 lt!67788 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 (_2!1316 lt!67159))))))

(declare-fun b!130357 () Bool)

(assert (=> b!130357 (= e!85028 (+!172 call!14202 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (_2!1316 lt!67159)))))))

(declare-fun b!130358 () Bool)

(assert (=> b!130358 (= e!85025 (not call!14204))))

(assert (= (and d!39619 c!24033) b!130357))

(assert (= (and d!39619 (not c!24033)) b!130351))

(assert (= (and b!130351 c!24034) b!130346))

(assert (= (and b!130351 (not c!24034)) b!130348))

(assert (= (and b!130348 c!24035) b!130355))

(assert (= (and b!130348 (not c!24035)) b!130343))

(assert (= (or b!130355 b!130343) bm!14202))

(assert (= (or b!130346 bm!14202) bm!14198))

(assert (= (or b!130346 b!130355) bm!14203))

(assert (= (or b!130357 bm!14198) bm!14200))

(assert (= (or b!130357 bm!14203) bm!14201))

(assert (= (and d!39619 res!62866) b!130345))

(assert (= (and d!39619 c!24032) b!130341))

(assert (= (and d!39619 (not c!24032)) b!130350))

(assert (= (and d!39619 res!62865) b!130344))

(assert (= (and b!130344 res!62862) b!130352))

(assert (= (and b!130344 (not res!62864)) b!130347))

(assert (= (and b!130347 res!62863) b!130338))

(assert (= (and b!130344 res!62868) b!130342))

(assert (= (and b!130342 c!24031) b!130354))

(assert (= (and b!130342 (not c!24031)) b!130340))

(assert (= (and b!130354 res!62861) b!130356))

(assert (= (or b!130354 b!130340) bm!14197))

(assert (= (and b!130342 res!62869) b!130349))

(assert (= (and b!130349 c!24030) b!130339))

(assert (= (and b!130349 (not c!24030)) b!130358))

(assert (= (and b!130339 res!62867) b!130353))

(assert (= (or b!130339 b!130358) bm!14199))

(declare-fun b_lambda!5783 () Bool)

(assert (=> (not b_lambda!5783) (not b!130338)))

(declare-fun tb!2373 () Bool)

(declare-fun t!6118 () Bool)

(assert (=> (and b!129225 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 (_2!1316 lt!67159))) t!6118) tb!2373))

(declare-fun result!3925 () Bool)

(assert (=> tb!2373 (= result!3925 tp_is_empty!2859)))

(assert (=> b!130338 t!6118))

(declare-fun b_and!8067 () Bool)

(assert (= b_and!8063 (and (=> t!6118 result!3925) b_and!8067)))

(declare-fun t!6120 () Bool)

(declare-fun tb!2375 () Bool)

(assert (=> (and b!129213 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 (_2!1316 lt!67159))) t!6120) tb!2375))

(declare-fun result!3927 () Bool)

(assert (= result!3927 result!3925))

(assert (=> b!130338 t!6120))

(declare-fun b_and!8069 () Bool)

(assert (= b_and!8065 (and (=> t!6120 result!3927) b_and!8069)))

(declare-fun m!153411 () Bool)

(assert (=> bm!14200 m!153411))

(declare-fun m!153413 () Bool)

(assert (=> bm!14199 m!153413))

(declare-fun m!153415 () Bool)

(assert (=> bm!14201 m!153415))

(declare-fun m!153417 () Bool)

(assert (=> b!130338 m!153417))

(declare-fun m!153419 () Bool)

(assert (=> b!130338 m!153419))

(declare-fun m!153421 () Bool)

(assert (=> b!130338 m!153421))

(assert (=> b!130338 m!152513))

(assert (=> b!130338 m!152513))

(declare-fun m!153423 () Bool)

(assert (=> b!130338 m!153423))

(assert (=> b!130338 m!153417))

(assert (=> b!130338 m!153419))

(declare-fun m!153425 () Bool)

(assert (=> b!130356 m!153425))

(assert (=> b!130352 m!152513))

(assert (=> b!130352 m!152513))

(assert (=> b!130352 m!152515))

(assert (=> b!130345 m!152513))

(assert (=> b!130345 m!152513))

(assert (=> b!130345 m!152515))

(assert (=> d!39619 m!153399))

(declare-fun m!153427 () Bool)

(assert (=> b!130353 m!153427))

(declare-fun m!153429 () Bool)

(assert (=> b!130357 m!153429))

(declare-fun m!153431 () Bool)

(assert (=> bm!14197 m!153431))

(assert (=> b!130347 m!152513))

(assert (=> b!130347 m!152513))

(declare-fun m!153433 () Bool)

(assert (=> b!130347 m!153433))

(declare-fun m!153435 () Bool)

(assert (=> b!130341 m!153435))

(declare-fun m!153437 () Bool)

(assert (=> b!130341 m!153437))

(declare-fun m!153439 () Bool)

(assert (=> b!130341 m!153439))

(declare-fun m!153441 () Bool)

(assert (=> b!130341 m!153441))

(assert (=> b!130341 m!153411))

(declare-fun m!153443 () Bool)

(assert (=> b!130341 m!153443))

(declare-fun m!153445 () Bool)

(assert (=> b!130341 m!153445))

(declare-fun m!153447 () Bool)

(assert (=> b!130341 m!153447))

(declare-fun m!153449 () Bool)

(assert (=> b!130341 m!153449))

(declare-fun m!153451 () Bool)

(assert (=> b!130341 m!153451))

(assert (=> b!130341 m!152513))

(declare-fun m!153453 () Bool)

(assert (=> b!130341 m!153453))

(declare-fun m!153455 () Bool)

(assert (=> b!130341 m!153455))

(declare-fun m!153457 () Bool)

(assert (=> b!130341 m!153457))

(assert (=> b!130341 m!153443))

(declare-fun m!153459 () Bool)

(assert (=> b!130341 m!153459))

(declare-fun m!153461 () Bool)

(assert (=> b!130341 m!153461))

(assert (=> b!130341 m!153449))

(assert (=> b!130341 m!153455))

(assert (=> b!130341 m!153437))

(declare-fun m!153463 () Bool)

(assert (=> b!130341 m!153463))

(assert (=> d!39269 d!39619))

(declare-fun d!39621 () Bool)

(assert (=> d!39621 (contains!889 (getCurrentListMap!541 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67161)))))

(assert (=> d!39621 true))

(declare-fun _$16!148 () Unit!4039)

(assert (=> d!39621 (= (choose!793 (_keys!4565 newMap!16) lt!67149 (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (index!3246 lt!67161) (defaultEntry!2824 newMap!16)) _$16!148)))

(declare-fun bs!5404 () Bool)

(assert (= bs!5404 d!39621))

(assert (=> bs!5404 m!152475))

(assert (=> bs!5404 m!151907))

(assert (=> bs!5404 m!152475))

(assert (=> bs!5404 m!151907))

(assert (=> bs!5404 m!152477))

(assert (=> d!39341 d!39621))

(assert (=> d!39341 d!39457))

(declare-fun d!39623 () Bool)

(declare-fun lt!67804 () Bool)

(assert (=> d!39623 (= lt!67804 (select (content!129 (toList!864 lt!67396)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun e!85037 () Bool)

(assert (=> d!39623 (= lt!67804 e!85037)))

(declare-fun res!62870 () Bool)

(assert (=> d!39623 (=> (not res!62870) (not e!85037))))

(assert (=> d!39623 (= res!62870 ((_ is Cons!1704) (toList!864 lt!67396)))))

(assert (=> d!39623 (= (contains!890 (toList!864 lt!67396) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67804)))

(declare-fun b!130359 () Bool)

(declare-fun e!85036 () Bool)

(assert (=> b!130359 (= e!85037 e!85036)))

(declare-fun res!62871 () Bool)

(assert (=> b!130359 (=> res!62871 e!85036)))

(assert (=> b!130359 (= res!62871 (= (h!2308 (toList!864 lt!67396)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!130360 () Bool)

(assert (=> b!130360 (= e!85036 (contains!890 (t!6107 (toList!864 lt!67396)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39623 res!62870) b!130359))

(assert (= (and b!130359 (not res!62871)) b!130360))

(declare-fun m!153465 () Bool)

(assert (=> d!39623 m!153465))

(declare-fun m!153467 () Bool)

(assert (=> d!39623 m!153467))

(declare-fun m!153469 () Bool)

(assert (=> b!130360 m!153469))

(assert (=> b!129719 d!39623))

(declare-fun lt!67805 () Bool)

(declare-fun d!39625 () Bool)

(assert (=> d!39625 (= lt!67805 (select (content!129 (toList!864 lt!67368)) (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun e!85039 () Bool)

(assert (=> d!39625 (= lt!67805 e!85039)))

(declare-fun res!62872 () Bool)

(assert (=> d!39625 (=> (not res!62872) (not e!85039))))

(assert (=> d!39625 (= res!62872 ((_ is Cons!1704) (toList!864 lt!67368)))))

(assert (=> d!39625 (= (contains!890 (toList!864 lt!67368) (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67805)))

(declare-fun b!130361 () Bool)

(declare-fun e!85038 () Bool)

(assert (=> b!130361 (= e!85039 e!85038)))

(declare-fun res!62873 () Bool)

(assert (=> b!130361 (=> res!62873 e!85038)))

(assert (=> b!130361 (= res!62873 (= (h!2308 (toList!864 lt!67368)) (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!130362 () Bool)

(assert (=> b!130362 (= e!85038 (contains!890 (t!6107 (toList!864 lt!67368)) (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39625 res!62872) b!130361))

(assert (= (and b!130361 (not res!62873)) b!130362))

(declare-fun m!153471 () Bool)

(assert (=> d!39625 m!153471))

(declare-fun m!153473 () Bool)

(assert (=> d!39625 m!153473))

(declare-fun m!153475 () Bool)

(assert (=> b!130362 m!153475))

(assert (=> b!129705 d!39625))

(declare-fun d!39627 () Bool)

(assert (=> d!39627 (= (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!403 (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5405 () Bool)

(assert (= bs!5405 d!39627))

(assert (=> bs!5405 m!152115))

(declare-fun m!153477 () Bool)

(assert (=> bs!5405 m!153477))

(assert (=> b!129779 d!39627))

(assert (=> b!129779 d!39537))

(assert (=> bm!14079 d!39425))

(declare-fun d!39629 () Bool)

(assert (=> d!39629 (= (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67066)) (v!3165 (getValueByKey!169 (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67066)))))

(assert (=> d!39305 d!39629))

(declare-fun e!85041 () Option!175)

(declare-fun b!130365 () Bool)

(assert (=> b!130365 (= e!85041 (getValueByKey!169 (t!6107 (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) lt!67066))))

(declare-fun b!130363 () Bool)

(declare-fun e!85040 () Option!175)

(assert (=> b!130363 (= e!85040 (Some!174 (_2!1315 (h!2308 (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))))

(declare-fun b!130364 () Bool)

(assert (=> b!130364 (= e!85040 e!85041)))

(declare-fun c!24037 () Bool)

(assert (=> b!130364 (= c!24037 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) (not (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67066))))))

(declare-fun c!24036 () Bool)

(declare-fun d!39631 () Bool)

(assert (=> d!39631 (= c!24036 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67066)))))

(assert (=> d!39631 (= (getValueByKey!169 (toList!864 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67066) e!85040)))

(declare-fun b!130366 () Bool)

(assert (=> b!130366 (= e!85041 None!173)))

(assert (= (and d!39631 c!24036) b!130363))

(assert (= (and d!39631 (not c!24036)) b!130364))

(assert (= (and b!130364 c!24037) b!130365))

(assert (= (and b!130364 (not c!24037)) b!130366))

(declare-fun m!153479 () Bool)

(assert (=> b!130365 m!153479))

(assert (=> d!39305 d!39631))

(declare-fun d!39633 () Bool)

(declare-fun res!62874 () Bool)

(declare-fun e!85042 () Bool)

(assert (=> d!39633 (=> res!62874 e!85042)))

(assert (=> d!39633 (= res!62874 (and ((_ is Cons!1704) (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) (= (_1!1315 (h!2308 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67068)))))

(assert (=> d!39633 (= (containsKey!173 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67068) e!85042)))

(declare-fun b!130367 () Bool)

(declare-fun e!85043 () Bool)

(assert (=> b!130367 (= e!85042 e!85043)))

(declare-fun res!62875 () Bool)

(assert (=> b!130367 (=> (not res!62875) (not e!85043))))

(assert (=> b!130367 (= res!62875 (and (or (not ((_ is Cons!1704) (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))) (bvsle (_1!1315 (h!2308 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67068)) ((_ is Cons!1704) (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) (bvslt (_1!1315 (h!2308 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))) lt!67068)))))

(declare-fun b!130368 () Bool)

(assert (=> b!130368 (= e!85043 (containsKey!173 (t!6107 (toList!864 (+!172 lt!67079 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))) lt!67068))))

(assert (= (and d!39633 (not res!62874)) b!130367))

(assert (= (and b!130367 res!62875) b!130368))

(declare-fun m!153481 () Bool)

(assert (=> b!130368 m!153481))

(assert (=> d!39303 d!39633))

(declare-fun d!39635 () Bool)

(declare-fun res!62876 () Bool)

(declare-fun e!85044 () Bool)

(assert (=> d!39635 (=> res!62876 e!85044)))

(assert (=> d!39635 (= res!62876 (= (select (arr!2243 (_keys!4565 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39635 (= (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!85044)))

(declare-fun b!130369 () Bool)

(declare-fun e!85045 () Bool)

(assert (=> b!130369 (= e!85044 e!85045)))

(declare-fun res!62877 () Bool)

(assert (=> b!130369 (=> (not res!62877) (not e!85045))))

(assert (=> b!130369 (= res!62877 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130370 () Bool)

(assert (=> b!130370 (= e!85045 (arrayContainsKey!0 (_keys!4565 newMap!16) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!39635 (not res!62876)) b!130369))

(assert (= (and b!130369 res!62877) b!130370))

(assert (=> d!39635 m!152999))

(assert (=> b!130370 m!151769))

(declare-fun m!153483 () Bool)

(assert (=> b!130370 m!153483))

(assert (=> b!129821 d!39635))

(assert (=> b!129563 d!39261))

(declare-fun e!85060 () SeekEntryResult!272)

(declare-fun b!130389 () Bool)

(assert (=> b!130389 (= e!85060 (Intermediate!272 false (toIndex!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (mask!7102 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!130390 () Bool)

(declare-fun e!85059 () Bool)

(declare-fun e!85057 () Bool)

(assert (=> b!130390 (= e!85059 e!85057)))

(declare-fun res!62884 () Bool)

(declare-fun lt!67810 () SeekEntryResult!272)

(assert (=> b!130390 (= res!62884 (and ((_ is Intermediate!272) lt!67810) (not (undefined!1084 lt!67810)) (bvslt (x!15267 lt!67810) #b01111111111111111111111111111110) (bvsge (x!15267 lt!67810) #b00000000000000000000000000000000) (bvsge (x!15267 lt!67810) #b00000000000000000000000000000000)))))

(assert (=> b!130390 (=> (not res!62884) (not e!85057))))

(declare-fun b!130391 () Bool)

(assert (=> b!130391 (and (bvsge (index!3247 lt!67810) #b00000000000000000000000000000000) (bvslt (index!3247 lt!67810) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun res!62885 () Bool)

(assert (=> b!130391 (= res!62885 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3247 lt!67810)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun e!85058 () Bool)

(assert (=> b!130391 (=> res!62885 e!85058)))

(assert (=> b!130391 (= e!85057 e!85058)))

(declare-fun b!130392 () Bool)

(assert (=> b!130392 (and (bvsge (index!3247 lt!67810) #b00000000000000000000000000000000) (bvslt (index!3247 lt!67810) (size!2509 (_keys!4565 newMap!16))))))

(assert (=> b!130392 (= e!85058 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3247 lt!67810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130393 () Bool)

(assert (=> b!130393 (= e!85060 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (mask!7102 newMap!16)) #b00000000000000000000000000000000 (mask!7102 newMap!16)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun b!130394 () Bool)

(declare-fun e!85056 () SeekEntryResult!272)

(assert (=> b!130394 (= e!85056 e!85060)))

(declare-fun lt!67811 () (_ BitVec 64))

(declare-fun c!24045 () Bool)

(assert (=> b!130394 (= c!24045 (or (= lt!67811 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) (= (bvadd lt!67811 lt!67811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130395 () Bool)

(assert (=> b!130395 (= e!85056 (Intermediate!272 true (toIndex!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (mask!7102 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!130396 () Bool)

(assert (=> b!130396 (and (bvsge (index!3247 lt!67810) #b00000000000000000000000000000000) (bvslt (index!3247 lt!67810) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun res!62886 () Bool)

(assert (=> b!130396 (= res!62886 (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3247 lt!67810)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130396 (=> res!62886 e!85058)))

(declare-fun b!130397 () Bool)

(assert (=> b!130397 (= e!85059 (bvsge (x!15267 lt!67810) #b01111111111111111111111111111110))))

(declare-fun d!39637 () Bool)

(assert (=> d!39637 e!85059))

(declare-fun c!24044 () Bool)

(assert (=> d!39637 (= c!24044 (and ((_ is Intermediate!272) lt!67810) (undefined!1084 lt!67810)))))

(assert (=> d!39637 (= lt!67810 e!85056)))

(declare-fun c!24046 () Bool)

(assert (=> d!39637 (= c!24046 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!39637 (= lt!67811 (select (arr!2243 (_keys!4565 newMap!16)) (toIndex!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (mask!7102 newMap!16))))))

(assert (=> d!39637 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (mask!7102 newMap!16)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (_keys!4565 newMap!16) (mask!7102 newMap!16)) lt!67810)))

(assert (= (and d!39637 c!24046) b!130395))

(assert (= (and d!39637 (not c!24046)) b!130394))

(assert (= (and b!130394 c!24045) b!130389))

(assert (= (and b!130394 (not c!24045)) b!130393))

(assert (= (and d!39637 c!24044) b!130397))

(assert (= (and d!39637 (not c!24044)) b!130390))

(assert (= (and b!130390 res!62884) b!130391))

(assert (= (and b!130391 (not res!62885)) b!130396))

(assert (= (and b!130396 (not res!62886)) b!130392))

(declare-fun m!153485 () Bool)

(assert (=> b!130396 m!153485))

(assert (=> b!130391 m!153485))

(assert (=> d!39637 m!152195))

(declare-fun m!153487 () Bool)

(assert (=> d!39637 m!153487))

(assert (=> d!39637 m!151983))

(assert (=> b!130393 m!152195))

(declare-fun m!153489 () Bool)

(assert (=> b!130393 m!153489))

(assert (=> b!130393 m!153489))

(assert (=> b!130393 m!151769))

(declare-fun m!153491 () Bool)

(assert (=> b!130393 m!153491))

(assert (=> b!130392 m!153485))

(assert (=> d!39275 d!39637))

(declare-fun d!39639 () Bool)

(declare-fun lt!67817 () (_ BitVec 32))

(declare-fun lt!67816 () (_ BitVec 32))

(assert (=> d!39639 (= lt!67817 (bvmul (bvxor lt!67816 (bvlshr lt!67816 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!39639 (= lt!67816 ((_ extract 31 0) (bvand (bvxor (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (bvlshr (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!39639 (and (bvsge (mask!7102 newMap!16) #b00000000000000000000000000000000) (let ((res!62887 (let ((h!2310 ((_ extract 31 0) (bvand (bvxor (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (bvlshr (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15371 (bvmul (bvxor h!2310 (bvlshr h!2310 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15371 (bvlshr x!15371 #b00000000000000000000000000001101)) (mask!7102 newMap!16)))))) (and (bvslt res!62887 (bvadd (mask!7102 newMap!16) #b00000000000000000000000000000001)) (bvsge res!62887 #b00000000000000000000000000000000))))))

(assert (=> d!39639 (= (toIndex!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (mask!7102 newMap!16)) (bvand (bvxor lt!67817 (bvlshr lt!67817 #b00000000000000000000000000001101)) (mask!7102 newMap!16)))))

(assert (=> d!39275 d!39639))

(assert (=> d!39275 d!39457))

(assert (=> b!129532 d!39357))

(assert (=> b!129577 d!39519))

(assert (=> b!129577 d!39521))

(declare-fun lt!67818 () Bool)

(declare-fun d!39641 () Bool)

(assert (=> d!39641 (= lt!67818 (select (content!129 (toList!864 lt!67377)) (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun e!85062 () Bool)

(assert (=> d!39641 (= lt!67818 e!85062)))

(declare-fun res!62888 () Bool)

(assert (=> d!39641 (=> (not res!62888) (not e!85062))))

(assert (=> d!39641 (= res!62888 ((_ is Cons!1704) (toList!864 lt!67377)))))

(assert (=> d!39641 (= (contains!890 (toList!864 lt!67377) (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67818)))

(declare-fun b!130398 () Bool)

(declare-fun e!85061 () Bool)

(assert (=> b!130398 (= e!85062 e!85061)))

(declare-fun res!62889 () Bool)

(assert (=> b!130398 (=> res!62889 e!85061)))

(assert (=> b!130398 (= res!62889 (= (h!2308 (toList!864 lt!67377)) (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!130399 () Bool)

(assert (=> b!130399 (= e!85061 (contains!890 (t!6107 (toList!864 lt!67377)) (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39641 res!62888) b!130398))

(assert (= (and b!130398 (not res!62889)) b!130399))

(declare-fun m!153493 () Bool)

(assert (=> d!39641 m!153493))

(declare-fun m!153495 () Bool)

(assert (=> d!39641 m!153495))

(declare-fun m!153497 () Bool)

(assert (=> b!130399 m!153497))

(assert (=> b!129710 d!39641))

(assert (=> d!39313 d!39291))

(declare-fun d!39643 () Bool)

(declare-fun e!85063 () Bool)

(assert (=> d!39643 e!85063))

(declare-fun res!62890 () Bool)

(assert (=> d!39643 (=> res!62890 e!85063)))

(declare-fun lt!67822 () Bool)

(assert (=> d!39643 (= res!62890 (not lt!67822))))

(declare-fun lt!67821 () Bool)

(assert (=> d!39643 (= lt!67822 lt!67821)))

(declare-fun lt!67820 () Unit!4039)

(declare-fun e!85064 () Unit!4039)

(assert (=> d!39643 (= lt!67820 e!85064)))

(declare-fun c!24047 () Bool)

(assert (=> d!39643 (= c!24047 lt!67821)))

(assert (=> d!39643 (= lt!67821 (containsKey!173 (toList!864 lt!67069) lt!67063))))

(assert (=> d!39643 (= (contains!889 lt!67069 lt!67063) lt!67822)))

(declare-fun b!130400 () Bool)

(declare-fun lt!67819 () Unit!4039)

(assert (=> b!130400 (= e!85064 lt!67819)))

(assert (=> b!130400 (= lt!67819 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67069) lt!67063))))

(assert (=> b!130400 (isDefined!122 (getValueByKey!169 (toList!864 lt!67069) lt!67063))))

(declare-fun b!130401 () Bool)

(declare-fun Unit!4080 () Unit!4039)

(assert (=> b!130401 (= e!85064 Unit!4080)))

(declare-fun b!130402 () Bool)

(assert (=> b!130402 (= e!85063 (isDefined!122 (getValueByKey!169 (toList!864 lt!67069) lt!67063)))))

(assert (= (and d!39643 c!24047) b!130400))

(assert (= (and d!39643 (not c!24047)) b!130401))

(assert (= (and d!39643 (not res!62890)) b!130402))

(declare-fun m!153499 () Bool)

(assert (=> d!39643 m!153499))

(declare-fun m!153501 () Bool)

(assert (=> b!130400 m!153501))

(assert (=> b!130400 m!152265))

(assert (=> b!130400 m!152265))

(declare-fun m!153503 () Bool)

(assert (=> b!130400 m!153503))

(assert (=> b!130402 m!152265))

(assert (=> b!130402 m!152265))

(assert (=> b!130402 m!153503))

(assert (=> d!39313 d!39643))

(assert (=> d!39313 d!39299))

(assert (=> d!39313 d!39309))

(declare-fun d!39645 () Bool)

(assert (=> d!39645 (= (apply!113 (+!172 lt!67069 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67063) (apply!113 lt!67069 lt!67063))))

(assert (=> d!39645 true))

(declare-fun _$34!967 () Unit!4039)

(assert (=> d!39645 (= (choose!790 lt!67069 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67063) _$34!967)))

(declare-fun bs!5406 () Bool)

(assert (= bs!5406 d!39645))

(assert (=> bs!5406 m!151869))

(assert (=> bs!5406 m!151869))

(assert (=> bs!5406 m!151871))

(assert (=> bs!5406 m!151893))

(assert (=> d!39313 d!39645))

(declare-fun d!39647 () Bool)

(assert (=> d!39647 (= (get!1466 (getValueByKey!169 (toList!864 lt!67061) lt!67065)) (v!3165 (getValueByKey!169 (toList!864 lt!67061) lt!67065)))))

(assert (=> d!39307 d!39647))

(declare-fun b!130405 () Bool)

(declare-fun e!85066 () Option!175)

(assert (=> b!130405 (= e!85066 (getValueByKey!169 (t!6107 (toList!864 lt!67061)) lt!67065))))

(declare-fun b!130403 () Bool)

(declare-fun e!85065 () Option!175)

(assert (=> b!130403 (= e!85065 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67061)))))))

(declare-fun b!130404 () Bool)

(assert (=> b!130404 (= e!85065 e!85066)))

(declare-fun c!24049 () Bool)

(assert (=> b!130404 (= c!24049 (and ((_ is Cons!1704) (toList!864 lt!67061)) (not (= (_1!1315 (h!2308 (toList!864 lt!67061))) lt!67065))))))

(declare-fun d!39649 () Bool)

(declare-fun c!24048 () Bool)

(assert (=> d!39649 (= c!24048 (and ((_ is Cons!1704) (toList!864 lt!67061)) (= (_1!1315 (h!2308 (toList!864 lt!67061))) lt!67065)))))

(assert (=> d!39649 (= (getValueByKey!169 (toList!864 lt!67061) lt!67065) e!85065)))

(declare-fun b!130406 () Bool)

(assert (=> b!130406 (= e!85066 None!173)))

(assert (= (and d!39649 c!24048) b!130403))

(assert (= (and d!39649 (not c!24048)) b!130404))

(assert (= (and b!130404 c!24049) b!130405))

(assert (= (and b!130404 (not c!24049)) b!130406))

(declare-fun m!153505 () Bool)

(assert (=> b!130405 m!153505))

(assert (=> d!39307 d!39649))

(declare-fun d!39651 () Bool)

(assert (=> d!39651 (= (apply!113 lt!67412 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (getValueByKey!169 (toList!864 lt!67412) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5407 () Bool)

(assert (= bs!5407 d!39651))

(assert (=> bs!5407 m!152013))

(declare-fun m!153507 () Bool)

(assert (=> bs!5407 m!153507))

(assert (=> bs!5407 m!153507))

(declare-fun m!153509 () Bool)

(assert (=> bs!5407 m!153509))

(assert (=> b!129735 d!39651))

(declare-fun d!39653 () Bool)

(declare-fun c!24050 () Bool)

(assert (=> d!39653 (= c!24050 ((_ is ValueCellFull!1086) (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!85067 () V!3459)

(assert (=> d!39653 (= (get!1463 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85067)))

(declare-fun b!130407 () Bool)

(assert (=> b!130407 (= e!85067 (get!1464 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130408 () Bool)

(assert (=> b!130408 (= e!85067 (get!1465 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39653 c!24050) b!130407))

(assert (= (and d!39653 (not c!24050)) b!130408))

(assert (=> b!130407 m!152357))

(assert (=> b!130407 m!152009))

(declare-fun m!153511 () Bool)

(assert (=> b!130407 m!153511))

(assert (=> b!130408 m!152357))

(assert (=> b!130408 m!152009))

(declare-fun m!153513 () Bool)

(assert (=> b!130408 m!153513))

(assert (=> b!129735 d!39653))

(declare-fun b!130409 () Bool)

(declare-fun e!85070 () Bool)

(assert (=> b!130409 (= e!85070 (contains!891 Nil!1706 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(declare-fun b!130410 () Bool)

(declare-fun e!85069 () Bool)

(declare-fun e!85068 () Bool)

(assert (=> b!130410 (= e!85069 e!85068)))

(declare-fun c!24051 () Bool)

(assert (=> b!130410 (= c!24051 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(declare-fun d!39655 () Bool)

(declare-fun res!62893 () Bool)

(declare-fun e!85071 () Bool)

(assert (=> d!39655 (=> res!62893 e!85071)))

(assert (=> d!39655 (= res!62893 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(assert (=> d!39655 (= (arrayNoDuplicates!0 (_keys!4565 (_2!1316 lt!67159)) #b00000000000000000000000000000000 Nil!1706) e!85071)))

(declare-fun b!130411 () Bool)

(declare-fun call!14207 () Bool)

(assert (=> b!130411 (= e!85068 call!14207)))

(declare-fun b!130412 () Bool)

(assert (=> b!130412 (= e!85071 e!85069)))

(declare-fun res!62892 () Bool)

(assert (=> b!130412 (=> (not res!62892) (not e!85069))))

(assert (=> b!130412 (= res!62892 (not e!85070))))

(declare-fun res!62891 () Bool)

(assert (=> b!130412 (=> (not res!62891) (not e!85070))))

(assert (=> b!130412 (= res!62891 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(declare-fun bm!14204 () Bool)

(assert (=> bm!14204 (= call!14207 (arrayNoDuplicates!0 (_keys!4565 (_2!1316 lt!67159)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24051 (Cons!1705 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000) Nil!1706) Nil!1706)))))

(declare-fun b!130413 () Bool)

(assert (=> b!130413 (= e!85068 call!14207)))

(assert (= (and d!39655 (not res!62893)) b!130412))

(assert (= (and b!130412 res!62891) b!130409))

(assert (= (and b!130412 res!62892) b!130410))

(assert (= (and b!130410 c!24051) b!130411))

(assert (= (and b!130410 (not c!24051)) b!130413))

(assert (= (or b!130411 b!130413) bm!14204))

(assert (=> b!130409 m!152513))

(assert (=> b!130409 m!152513))

(declare-fun m!153515 () Bool)

(assert (=> b!130409 m!153515))

(assert (=> b!130410 m!152513))

(assert (=> b!130410 m!152513))

(assert (=> b!130410 m!152515))

(assert (=> b!130412 m!152513))

(assert (=> b!130412 m!152513))

(assert (=> b!130412 m!152515))

(assert (=> bm!14204 m!152513))

(declare-fun m!153517 () Bool)

(assert (=> bm!14204 m!153517))

(assert (=> b!129604 d!39655))

(assert (=> bm!14090 d!39347))

(declare-fun d!39657 () Bool)

(assert (=> d!39657 (= (inRange!0 (ite c!23830 (index!3245 lt!67250) (index!3248 lt!67250)) (mask!7102 newMap!16)) (and (bvsge (ite c!23830 (index!3245 lt!67250) (index!3248 lt!67250)) #b00000000000000000000000000000000) (bvslt (ite c!23830 (index!3245 lt!67250) (index!3248 lt!67250)) (bvadd (mask!7102 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!14091 d!39657))

(assert (=> bm!14100 d!39347))

(declare-fun d!39659 () Bool)

(assert (=> d!39659 (isDefined!122 (getValueByKey!169 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun lt!67823 () Unit!4039)

(assert (=> d!39659 (= lt!67823 (choose!789 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun e!85072 () Bool)

(assert (=> d!39659 e!85072))

(declare-fun res!62894 () Bool)

(assert (=> d!39659 (=> (not res!62894) (not e!85072))))

(assert (=> d!39659 (= res!62894 (isStrictlySorted!319 (toList!864 call!14077)))))

(assert (=> d!39659 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67823)))

(declare-fun b!130414 () Bool)

(assert (=> b!130414 (= e!85072 (containsKey!173 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39659 res!62894) b!130414))

(assert (=> d!39659 m!151769))

(assert (=> d!39659 m!152487))

(assert (=> d!39659 m!152487))

(assert (=> d!39659 m!152489))

(assert (=> d!39659 m!151769))

(declare-fun m!153519 () Bool)

(assert (=> d!39659 m!153519))

(declare-fun m!153521 () Bool)

(assert (=> d!39659 m!153521))

(assert (=> b!130414 m!151769))

(assert (=> b!130414 m!152483))

(assert (=> b!129813 d!39659))

(assert (=> b!129813 d!39445))

(assert (=> b!129813 d!39447))

(assert (=> b!129733 d!39357))

(declare-fun d!39661 () Bool)

(assert (=> d!39661 (= (apply!113 lt!67434 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (getValueByKey!169 (toList!864 lt!67434) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5408 () Bool)

(assert (= bs!5408 d!39661))

(assert (=> bs!5408 m!152013))

(declare-fun m!153523 () Bool)

(assert (=> bs!5408 m!153523))

(assert (=> bs!5408 m!153523))

(declare-fun m!153525 () Bool)

(assert (=> bs!5408 m!153525))

(assert (=> b!129756 d!39661))

(declare-fun c!24052 () Bool)

(declare-fun d!39663 () Bool)

(assert (=> d!39663 (= c!24052 ((_ is ValueCellFull!1086) (select (arr!2244 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!85073 () V!3459)

(assert (=> d!39663 (= (get!1463 (select (arr!2244 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!85073)))

(declare-fun b!130415 () Bool)

(assert (=> b!130415 (= e!85073 (get!1464 (select (arr!2244 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130416 () Bool)

(assert (=> b!130416 (= e!85073 (get!1465 (select (arr!2244 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39663 c!24052) b!130415))

(assert (= (and d!39663 (not c!24052)) b!130416))

(assert (=> b!130415 m!152409))

(assert (=> b!130415 m!152009))

(declare-fun m!153527 () Bool)

(assert (=> b!130415 m!153527))

(assert (=> b!130416 m!152409))

(assert (=> b!130416 m!152009))

(declare-fun m!153529 () Bool)

(assert (=> b!130416 m!153529))

(assert (=> b!129756 d!39663))

(declare-fun d!39665 () Bool)

(declare-fun e!85074 () Bool)

(assert (=> d!39665 e!85074))

(declare-fun res!62895 () Bool)

(assert (=> d!39665 (=> (not res!62895) (not e!85074))))

(declare-fun lt!67825 () ListLongMap!1697)

(assert (=> d!39665 (= res!62895 (contains!889 lt!67825 (_1!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16)))))))

(declare-fun lt!67826 () List!1708)

(assert (=> d!39665 (= lt!67825 (ListLongMap!1698 lt!67826))))

(declare-fun lt!67827 () Unit!4039)

(declare-fun lt!67824 () Unit!4039)

(assert (=> d!39665 (= lt!67827 lt!67824)))

(assert (=> d!39665 (= (getValueByKey!169 lt!67826 (_1!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16)))))))

(assert (=> d!39665 (= lt!67824 (lemmaContainsTupThenGetReturnValue!84 lt!67826 (_1!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16)))))))

(assert (=> d!39665 (= lt!67826 (insertStrictlySorted!87 (toList!864 lt!67436) (_1!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16)))))))

(assert (=> d!39665 (= (+!172 lt!67436 (tuple2!2609 lt!67439 (minValue!2683 newMap!16))) lt!67825)))

(declare-fun b!130417 () Bool)

(declare-fun res!62896 () Bool)

(assert (=> b!130417 (=> (not res!62896) (not e!85074))))

(assert (=> b!130417 (= res!62896 (= (getValueByKey!169 (toList!864 lt!67825) (_1!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67439 (minValue!2683 newMap!16))))))))

(declare-fun b!130418 () Bool)

(assert (=> b!130418 (= e!85074 (contains!890 (toList!864 lt!67825) (tuple2!2609 lt!67439 (minValue!2683 newMap!16))))))

(assert (= (and d!39665 res!62895) b!130417))

(assert (= (and b!130417 res!62896) b!130418))

(declare-fun m!153531 () Bool)

(assert (=> d!39665 m!153531))

(declare-fun m!153533 () Bool)

(assert (=> d!39665 m!153533))

(declare-fun m!153535 () Bool)

(assert (=> d!39665 m!153535))

(declare-fun m!153537 () Bool)

(assert (=> d!39665 m!153537))

(declare-fun m!153539 () Bool)

(assert (=> b!130417 m!153539))

(declare-fun m!153541 () Bool)

(assert (=> b!130418 m!153541))

(assert (=> b!129759 d!39665))

(declare-fun d!39667 () Bool)

(assert (=> d!39667 (contains!889 (+!172 lt!67446 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16))) lt!67435)))

(declare-fun lt!67828 () Unit!4039)

(assert (=> d!39667 (= lt!67828 (choose!791 lt!67446 lt!67442 (zeroValue!2683 newMap!16) lt!67435))))

(assert (=> d!39667 (contains!889 lt!67446 lt!67435)))

(assert (=> d!39667 (= (addStillContains!89 lt!67446 lt!67442 (zeroValue!2683 newMap!16) lt!67435) lt!67828)))

(declare-fun bs!5409 () Bool)

(assert (= bs!5409 d!39667))

(assert (=> bs!5409 m!152439))

(assert (=> bs!5409 m!152439))

(assert (=> bs!5409 m!152441))

(declare-fun m!153543 () Bool)

(assert (=> bs!5409 m!153543))

(declare-fun m!153545 () Bool)

(assert (=> bs!5409 m!153545))

(assert (=> b!129759 d!39667))

(declare-fun d!39669 () Bool)

(assert (=> d!39669 (= (apply!113 lt!67436 lt!67430) (get!1466 (getValueByKey!169 (toList!864 lt!67436) lt!67430)))))

(declare-fun bs!5410 () Bool)

(assert (= bs!5410 d!39669))

(declare-fun m!153547 () Bool)

(assert (=> bs!5410 m!153547))

(assert (=> bs!5410 m!153547))

(declare-fun m!153549 () Bool)

(assert (=> bs!5410 m!153549))

(assert (=> b!129759 d!39669))

(declare-fun d!39671 () Bool)

(declare-fun e!85075 () Bool)

(assert (=> d!39671 e!85075))

(declare-fun res!62897 () Bool)

(assert (=> d!39671 (=> (not res!62897) (not e!85075))))

(declare-fun lt!67830 () ListLongMap!1697)

(assert (=> d!39671 (= res!62897 (contains!889 lt!67830 (_1!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16)))))))

(declare-fun lt!67831 () List!1708)

(assert (=> d!39671 (= lt!67830 (ListLongMap!1698 lt!67831))))

(declare-fun lt!67832 () Unit!4039)

(declare-fun lt!67829 () Unit!4039)

(assert (=> d!39671 (= lt!67832 lt!67829)))

(assert (=> d!39671 (= (getValueByKey!169 lt!67831 (_1!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39671 (= lt!67829 (lemmaContainsTupThenGetReturnValue!84 lt!67831 (_1!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39671 (= lt!67831 (insertStrictlySorted!87 (toList!864 lt!67428) (_1!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39671 (= (+!172 lt!67428 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16))) lt!67830)))

(declare-fun b!130419 () Bool)

(declare-fun res!62898 () Bool)

(assert (=> b!130419 (=> (not res!62898) (not e!85075))))

(assert (=> b!130419 (= res!62898 (= (getValueByKey!169 (toList!864 lt!67830) (_1!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16))))))))

(declare-fun b!130420 () Bool)

(assert (=> b!130420 (= e!85075 (contains!890 (toList!864 lt!67830) (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16))))))

(assert (= (and d!39671 res!62897) b!130419))

(assert (= (and b!130419 res!62898) b!130420))

(declare-fun m!153551 () Bool)

(assert (=> d!39671 m!153551))

(declare-fun m!153553 () Bool)

(assert (=> d!39671 m!153553))

(declare-fun m!153555 () Bool)

(assert (=> d!39671 m!153555))

(declare-fun m!153557 () Bool)

(assert (=> d!39671 m!153557))

(declare-fun m!153559 () Bool)

(assert (=> b!130419 m!153559))

(declare-fun m!153561 () Bool)

(assert (=> b!130420 m!153561))

(assert (=> b!129759 d!39671))

(declare-fun d!39673 () Bool)

(assert (=> d!39673 (= (apply!113 (+!172 lt!67438 (tuple2!2609 lt!67447 (minValue!2683 newMap!16))) lt!67433) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67438 (tuple2!2609 lt!67447 (minValue!2683 newMap!16)))) lt!67433)))))

(declare-fun bs!5411 () Bool)

(assert (= bs!5411 d!39673))

(declare-fun m!153563 () Bool)

(assert (=> bs!5411 m!153563))

(assert (=> bs!5411 m!153563))

(declare-fun m!153565 () Bool)

(assert (=> bs!5411 m!153565))

(assert (=> b!129759 d!39673))

(declare-fun d!39675 () Bool)

(assert (=> d!39675 (= (apply!113 lt!67438 lt!67433) (get!1466 (getValueByKey!169 (toList!864 lt!67438) lt!67433)))))

(declare-fun bs!5412 () Bool)

(assert (= bs!5412 d!39675))

(declare-fun m!153567 () Bool)

(assert (=> bs!5412 m!153567))

(assert (=> bs!5412 m!153567))

(declare-fun m!153569 () Bool)

(assert (=> bs!5412 m!153569))

(assert (=> b!129759 d!39675))

(declare-fun d!39677 () Bool)

(declare-fun e!85076 () Bool)

(assert (=> d!39677 e!85076))

(declare-fun res!62899 () Bool)

(assert (=> d!39677 (=> (not res!62899) (not e!85076))))

(declare-fun lt!67834 () ListLongMap!1697)

(assert (=> d!39677 (= res!62899 (contains!889 lt!67834 (_1!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16)))))))

(declare-fun lt!67835 () List!1708)

(assert (=> d!39677 (= lt!67834 (ListLongMap!1698 lt!67835))))

(declare-fun lt!67836 () Unit!4039)

(declare-fun lt!67833 () Unit!4039)

(assert (=> d!39677 (= lt!67836 lt!67833)))

(assert (=> d!39677 (= (getValueByKey!169 lt!67835 (_1!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16)))))))

(assert (=> d!39677 (= lt!67833 (lemmaContainsTupThenGetReturnValue!84 lt!67835 (_1!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16)))))))

(assert (=> d!39677 (= lt!67835 (insertStrictlySorted!87 (toList!864 lt!67438) (_1!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16)))))))

(assert (=> d!39677 (= (+!172 lt!67438 (tuple2!2609 lt!67447 (minValue!2683 newMap!16))) lt!67834)))

(declare-fun b!130421 () Bool)

(declare-fun res!62900 () Bool)

(assert (=> b!130421 (=> (not res!62900) (not e!85076))))

(assert (=> b!130421 (= res!62900 (= (getValueByKey!169 (toList!864 lt!67834) (_1!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67447 (minValue!2683 newMap!16))))))))

(declare-fun b!130422 () Bool)

(assert (=> b!130422 (= e!85076 (contains!890 (toList!864 lt!67834) (tuple2!2609 lt!67447 (minValue!2683 newMap!16))))))

(assert (= (and d!39677 res!62899) b!130421))

(assert (= (and b!130421 res!62900) b!130422))

(declare-fun m!153571 () Bool)

(assert (=> d!39677 m!153571))

(declare-fun m!153573 () Bool)

(assert (=> d!39677 m!153573))

(declare-fun m!153575 () Bool)

(assert (=> d!39677 m!153575))

(declare-fun m!153577 () Bool)

(assert (=> d!39677 m!153577))

(declare-fun m!153579 () Bool)

(assert (=> b!130421 m!153579))

(declare-fun m!153581 () Bool)

(assert (=> b!130422 m!153581))

(assert (=> b!129759 d!39677))

(declare-fun b!130423 () Bool)

(declare-fun e!85081 () ListLongMap!1697)

(declare-fun e!85083 () ListLongMap!1697)

(assert (=> b!130423 (= e!85081 e!85083)))

(declare-fun c!24055 () Bool)

(assert (=> b!130423 (= c!24055 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130424 () Bool)

(declare-fun lt!67842 () Unit!4039)

(declare-fun lt!67839 () Unit!4039)

(assert (=> b!130424 (= lt!67842 lt!67839)))

(declare-fun lt!67841 () (_ BitVec 64))

(declare-fun lt!67837 () ListLongMap!1697)

(declare-fun lt!67838 () V!3459)

(declare-fun lt!67840 () (_ BitVec 64))

(assert (=> b!130424 (not (contains!889 (+!172 lt!67837 (tuple2!2609 lt!67841 lt!67838)) lt!67840))))

(assert (=> b!130424 (= lt!67839 (addStillNotContains!58 lt!67837 lt!67841 lt!67838 lt!67840))))

(assert (=> b!130424 (= lt!67840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!130424 (= lt!67838 (get!1463 (select (arr!2244 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130424 (= lt!67841 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!14208 () ListLongMap!1697)

(assert (=> b!130424 (= lt!67837 call!14208)))

(assert (=> b!130424 (= e!85083 (+!172 call!14208 (tuple2!2609 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (get!1463 (select (arr!2244 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!67843 () ListLongMap!1697)

(declare-fun e!85077 () Bool)

(declare-fun b!130425 () Bool)

(assert (=> b!130425 (= e!85077 (= lt!67843 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2824 newMap!16))))))

(declare-fun b!130426 () Bool)

(declare-fun res!62903 () Bool)

(declare-fun e!85080 () Bool)

(assert (=> b!130426 (=> (not res!62903) (not e!85080))))

(assert (=> b!130426 (= res!62903 (not (contains!889 lt!67843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130427 () Bool)

(assert (=> b!130427 (= e!85083 call!14208)))

(declare-fun bm!14205 () Bool)

(assert (=> bm!14205 (= call!14208 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2824 newMap!16)))))

(declare-fun b!130428 () Bool)

(assert (=> b!130428 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> b!130428 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))))))))

(declare-fun e!85082 () Bool)

(assert (=> b!130428 (= e!85082 (= (apply!113 lt!67843 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130429 () Bool)

(declare-fun e!85078 () Bool)

(assert (=> b!130429 (= e!85078 e!85082)))

(assert (=> b!130429 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun res!62901 () Bool)

(assert (=> b!130429 (= res!62901 (contains!889 lt!67843 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130429 (=> (not res!62901) (not e!85082))))

(declare-fun d!39679 () Bool)

(assert (=> d!39679 e!85080))

(declare-fun res!62904 () Bool)

(assert (=> d!39679 (=> (not res!62904) (not e!85080))))

(assert (=> d!39679 (= res!62904 (not (contains!889 lt!67843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39679 (= lt!67843 e!85081)))

(declare-fun c!24054 () Bool)

(assert (=> d!39679 (= c!24054 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39679 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39679 (= (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (ite c!23795 (_values!2807 newMap!16) (array!4742 (store (arr!2244 (_values!2807 newMap!16)) (index!3246 lt!67161) (ValueCellFull!1086 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2510 (_values!2807 newMap!16)))) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67843)))

(declare-fun b!130430 () Bool)

(assert (=> b!130430 (= e!85078 e!85077)))

(declare-fun c!24056 () Bool)

(assert (=> b!130430 (= c!24056 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130431 () Bool)

(declare-fun e!85079 () Bool)

(assert (=> b!130431 (= e!85079 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130431 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!130432 () Bool)

(assert (=> b!130432 (= e!85077 (isEmpty!402 lt!67843))))

(declare-fun b!130433 () Bool)

(assert (=> b!130433 (= e!85081 (ListLongMap!1698 Nil!1705))))

(declare-fun b!130434 () Bool)

(assert (=> b!130434 (= e!85080 e!85078)))

(declare-fun c!24053 () Bool)

(assert (=> b!130434 (= c!24053 e!85079)))

(declare-fun res!62902 () Bool)

(assert (=> b!130434 (=> (not res!62902) (not e!85079))))

(assert (=> b!130434 (= res!62902 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (= (and d!39679 c!24054) b!130433))

(assert (= (and d!39679 (not c!24054)) b!130423))

(assert (= (and b!130423 c!24055) b!130424))

(assert (= (and b!130423 (not c!24055)) b!130427))

(assert (= (or b!130424 b!130427) bm!14205))

(assert (= (and d!39679 res!62904) b!130426))

(assert (= (and b!130426 res!62903) b!130434))

(assert (= (and b!130434 res!62902) b!130431))

(assert (= (and b!130434 c!24053) b!130429))

(assert (= (and b!130434 (not c!24053)) b!130430))

(assert (= (and b!130429 res!62901) b!130428))

(assert (= (and b!130430 c!24056) b!130425))

(assert (= (and b!130430 (not c!24056)) b!130432))

(declare-fun b_lambda!5785 () Bool)

(assert (=> (not b_lambda!5785) (not b!130424)))

(assert (=> b!130424 t!6114))

(declare-fun b_and!8071 () Bool)

(assert (= b_and!8067 (and (=> t!6114 result!3921) b_and!8071)))

(assert (=> b!130424 t!6116))

(declare-fun b_and!8073 () Bool)

(assert (= b_and!8069 (and (=> t!6116 result!3923) b_and!8073)))

(declare-fun b_lambda!5787 () Bool)

(assert (=> (not b_lambda!5787) (not b!130428)))

(assert (=> b!130428 t!6114))

(declare-fun b_and!8075 () Bool)

(assert (= b_and!8071 (and (=> t!6114 result!3921) b_and!8075)))

(assert (=> b!130428 t!6116))

(declare-fun b_and!8077 () Bool)

(assert (= b_and!8073 (and (=> t!6116 result!3923) b_and!8077)))

(declare-fun m!153583 () Bool)

(assert (=> b!130432 m!153583))

(declare-fun m!153585 () Bool)

(assert (=> d!39679 m!153585))

(assert (=> d!39679 m!151983))

(assert (=> b!130428 m!152409))

(assert (=> b!130428 m!152013))

(declare-fun m!153587 () Bool)

(assert (=> b!130428 m!153587))

(assert (=> b!130428 m!152013))

(assert (=> b!130428 m!152409))

(assert (=> b!130428 m!152009))

(assert (=> b!130428 m!152411))

(assert (=> b!130428 m!152009))

(assert (=> b!130423 m!152013))

(assert (=> b!130423 m!152013))

(assert (=> b!130423 m!152019))

(assert (=> b!130429 m!152013))

(assert (=> b!130429 m!152013))

(declare-fun m!153589 () Bool)

(assert (=> b!130429 m!153589))

(declare-fun m!153591 () Bool)

(assert (=> bm!14205 m!153591))

(declare-fun m!153593 () Bool)

(assert (=> b!130426 m!153593))

(assert (=> b!130431 m!152013))

(assert (=> b!130431 m!152013))

(assert (=> b!130431 m!152019))

(assert (=> b!130424 m!152409))

(declare-fun m!153595 () Bool)

(assert (=> b!130424 m!153595))

(declare-fun m!153597 () Bool)

(assert (=> b!130424 m!153597))

(assert (=> b!130424 m!152013))

(declare-fun m!153599 () Bool)

(assert (=> b!130424 m!153599))

(assert (=> b!130424 m!152009))

(assert (=> b!130424 m!153595))

(assert (=> b!130424 m!152409))

(assert (=> b!130424 m!152009))

(assert (=> b!130424 m!152411))

(declare-fun m!153601 () Bool)

(assert (=> b!130424 m!153601))

(assert (=> b!130425 m!153591))

(assert (=> b!129759 d!39679))

(declare-fun d!39681 () Bool)

(assert (=> d!39681 (= (apply!113 (+!172 lt!67428 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16))) lt!67432) (apply!113 lt!67428 lt!67432))))

(declare-fun lt!67844 () Unit!4039)

(assert (=> d!39681 (= lt!67844 (choose!790 lt!67428 lt!67431 (zeroValue!2683 newMap!16) lt!67432))))

(declare-fun e!85084 () Bool)

(assert (=> d!39681 e!85084))

(declare-fun res!62905 () Bool)

(assert (=> d!39681 (=> (not res!62905) (not e!85084))))

(assert (=> d!39681 (= res!62905 (contains!889 lt!67428 lt!67432))))

(assert (=> d!39681 (= (addApplyDifferent!89 lt!67428 lt!67431 (zeroValue!2683 newMap!16) lt!67432) lt!67844)))

(declare-fun b!130435 () Bool)

(assert (=> b!130435 (= e!85084 (not (= lt!67432 lt!67431)))))

(assert (= (and d!39681 res!62905) b!130435))

(assert (=> d!39681 m!152445))

(assert (=> d!39681 m!152447))

(declare-fun m!153603 () Bool)

(assert (=> d!39681 m!153603))

(assert (=> d!39681 m!152445))

(assert (=> d!39681 m!152435))

(declare-fun m!153605 () Bool)

(assert (=> d!39681 m!153605))

(assert (=> b!129759 d!39681))

(declare-fun d!39683 () Bool)

(assert (=> d!39683 (= (apply!113 (+!172 lt!67436 (tuple2!2609 lt!67439 (minValue!2683 newMap!16))) lt!67430) (apply!113 lt!67436 lt!67430))))

(declare-fun lt!67845 () Unit!4039)

(assert (=> d!39683 (= lt!67845 (choose!790 lt!67436 lt!67439 (minValue!2683 newMap!16) lt!67430))))

(declare-fun e!85085 () Bool)

(assert (=> d!39683 e!85085))

(declare-fun res!62906 () Bool)

(assert (=> d!39683 (=> (not res!62906) (not e!85085))))

(assert (=> d!39683 (= res!62906 (contains!889 lt!67436 lt!67430))))

(assert (=> d!39683 (= (addApplyDifferent!89 lt!67436 lt!67439 (minValue!2683 newMap!16) lt!67430) lt!67845)))

(declare-fun b!130436 () Bool)

(assert (=> b!130436 (= e!85085 (not (= lt!67430 lt!67439)))))

(assert (= (and d!39683 res!62906) b!130436))

(assert (=> d!39683 m!152427))

(assert (=> d!39683 m!152429))

(declare-fun m!153607 () Bool)

(assert (=> d!39683 m!153607))

(assert (=> d!39683 m!152427))

(assert (=> d!39683 m!152451))

(declare-fun m!153609 () Bool)

(assert (=> d!39683 m!153609))

(assert (=> b!129759 d!39683))

(declare-fun d!39685 () Bool)

(assert (=> d!39685 (= (apply!113 (+!172 lt!67436 (tuple2!2609 lt!67439 (minValue!2683 newMap!16))) lt!67430) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67436 (tuple2!2609 lt!67439 (minValue!2683 newMap!16)))) lt!67430)))))

(declare-fun bs!5413 () Bool)

(assert (= bs!5413 d!39685))

(declare-fun m!153611 () Bool)

(assert (=> bs!5413 m!153611))

(assert (=> bs!5413 m!153611))

(declare-fun m!153613 () Bool)

(assert (=> bs!5413 m!153613))

(assert (=> b!129759 d!39685))

(declare-fun d!39687 () Bool)

(assert (=> d!39687 (= (apply!113 (+!172 lt!67428 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16))) lt!67432) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67428 (tuple2!2609 lt!67431 (zeroValue!2683 newMap!16)))) lt!67432)))))

(declare-fun bs!5414 () Bool)

(assert (= bs!5414 d!39687))

(declare-fun m!153615 () Bool)

(assert (=> bs!5414 m!153615))

(assert (=> bs!5414 m!153615))

(declare-fun m!153617 () Bool)

(assert (=> bs!5414 m!153617))

(assert (=> b!129759 d!39687))

(declare-fun d!39689 () Bool)

(assert (=> d!39689 (= (apply!113 (+!172 lt!67438 (tuple2!2609 lt!67447 (minValue!2683 newMap!16))) lt!67433) (apply!113 lt!67438 lt!67433))))

(declare-fun lt!67846 () Unit!4039)

(assert (=> d!39689 (= lt!67846 (choose!790 lt!67438 lt!67447 (minValue!2683 newMap!16) lt!67433))))

(declare-fun e!85086 () Bool)

(assert (=> d!39689 e!85086))

(declare-fun res!62907 () Bool)

(assert (=> d!39689 (=> (not res!62907) (not e!85086))))

(assert (=> d!39689 (= res!62907 (contains!889 lt!67438 lt!67433))))

(assert (=> d!39689 (= (addApplyDifferent!89 lt!67438 lt!67447 (minValue!2683 newMap!16) lt!67433) lt!67846)))

(declare-fun b!130437 () Bool)

(assert (=> b!130437 (= e!85086 (not (= lt!67433 lt!67447)))))

(assert (= (and d!39689 res!62907) b!130437))

(assert (=> d!39689 m!152433))

(assert (=> d!39689 m!152449))

(declare-fun m!153619 () Bool)

(assert (=> d!39689 m!153619))

(assert (=> d!39689 m!152433))

(assert (=> d!39689 m!152443))

(declare-fun m!153621 () Bool)

(assert (=> d!39689 m!153621))

(assert (=> b!129759 d!39689))

(declare-fun d!39691 () Bool)

(assert (=> d!39691 (= (apply!113 lt!67428 lt!67432) (get!1466 (getValueByKey!169 (toList!864 lt!67428) lt!67432)))))

(declare-fun bs!5415 () Bool)

(assert (= bs!5415 d!39691))

(declare-fun m!153623 () Bool)

(assert (=> bs!5415 m!153623))

(assert (=> bs!5415 m!153623))

(declare-fun m!153625 () Bool)

(assert (=> bs!5415 m!153625))

(assert (=> b!129759 d!39691))

(declare-fun d!39693 () Bool)

(declare-fun e!85087 () Bool)

(assert (=> d!39693 e!85087))

(declare-fun res!62908 () Bool)

(assert (=> d!39693 (=> (not res!62908) (not e!85087))))

(declare-fun lt!67848 () ListLongMap!1697)

(assert (=> d!39693 (= res!62908 (contains!889 lt!67848 (_1!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))))))

(declare-fun lt!67849 () List!1708)

(assert (=> d!39693 (= lt!67848 (ListLongMap!1698 lt!67849))))

(declare-fun lt!67850 () Unit!4039)

(declare-fun lt!67847 () Unit!4039)

(assert (=> d!39693 (= lt!67850 lt!67847)))

(assert (=> d!39693 (= (getValueByKey!169 lt!67849 (_1!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39693 (= lt!67847 (lemmaContainsTupThenGetReturnValue!84 lt!67849 (_1!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39693 (= lt!67849 (insertStrictlySorted!87 (toList!864 lt!67446) (_1!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39693 (= (+!172 lt!67446 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16))) lt!67848)))

(declare-fun b!130438 () Bool)

(declare-fun res!62909 () Bool)

(assert (=> b!130438 (=> (not res!62909) (not e!85087))))

(assert (=> b!130438 (= res!62909 (= (getValueByKey!169 (toList!864 lt!67848) (_1!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16))))))))

(declare-fun b!130439 () Bool)

(assert (=> b!130439 (= e!85087 (contains!890 (toList!864 lt!67848) (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16))))))

(assert (= (and d!39693 res!62908) b!130438))

(assert (= (and b!130438 res!62909) b!130439))

(declare-fun m!153627 () Bool)

(assert (=> d!39693 m!153627))

(declare-fun m!153629 () Bool)

(assert (=> d!39693 m!153629))

(declare-fun m!153631 () Bool)

(assert (=> d!39693 m!153631))

(declare-fun m!153633 () Bool)

(assert (=> d!39693 m!153633))

(declare-fun m!153635 () Bool)

(assert (=> b!130438 m!153635))

(declare-fun m!153637 () Bool)

(assert (=> b!130439 m!153637))

(assert (=> b!129759 d!39693))

(declare-fun d!39695 () Bool)

(declare-fun e!85088 () Bool)

(assert (=> d!39695 e!85088))

(declare-fun res!62910 () Bool)

(assert (=> d!39695 (=> res!62910 e!85088)))

(declare-fun lt!67854 () Bool)

(assert (=> d!39695 (= res!62910 (not lt!67854))))

(declare-fun lt!67853 () Bool)

(assert (=> d!39695 (= lt!67854 lt!67853)))

(declare-fun lt!67852 () Unit!4039)

(declare-fun e!85089 () Unit!4039)

(assert (=> d!39695 (= lt!67852 e!85089)))

(declare-fun c!24057 () Bool)

(assert (=> d!39695 (= c!24057 lt!67853)))

(assert (=> d!39695 (= lt!67853 (containsKey!173 (toList!864 (+!172 lt!67446 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))) lt!67435))))

(assert (=> d!39695 (= (contains!889 (+!172 lt!67446 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16))) lt!67435) lt!67854)))

(declare-fun b!130440 () Bool)

(declare-fun lt!67851 () Unit!4039)

(assert (=> b!130440 (= e!85089 lt!67851)))

(assert (=> b!130440 (= lt!67851 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (+!172 lt!67446 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))) lt!67435))))

(assert (=> b!130440 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67446 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))) lt!67435))))

(declare-fun b!130441 () Bool)

(declare-fun Unit!4081 () Unit!4039)

(assert (=> b!130441 (= e!85089 Unit!4081)))

(declare-fun b!130442 () Bool)

(assert (=> b!130442 (= e!85088 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67446 (tuple2!2609 lt!67442 (zeroValue!2683 newMap!16)))) lt!67435)))))

(assert (= (and d!39695 c!24057) b!130440))

(assert (= (and d!39695 (not c!24057)) b!130441))

(assert (= (and d!39695 (not res!62910)) b!130442))

(declare-fun m!153639 () Bool)

(assert (=> d!39695 m!153639))

(declare-fun m!153641 () Bool)

(assert (=> b!130440 m!153641))

(declare-fun m!153643 () Bool)

(assert (=> b!130440 m!153643))

(assert (=> b!130440 m!153643))

(declare-fun m!153645 () Bool)

(assert (=> b!130440 m!153645))

(assert (=> b!130442 m!153643))

(assert (=> b!130442 m!153643))

(assert (=> b!130442 m!153645))

(assert (=> b!129759 d!39695))

(declare-fun d!39697 () Bool)

(assert (=> d!39697 (= (apply!113 lt!67434 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!864 lt!67434) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5416 () Bool)

(assert (= bs!5416 d!39697))

(declare-fun m!153647 () Bool)

(assert (=> bs!5416 m!153647))

(assert (=> bs!5416 m!153647))

(declare-fun m!153649 () Bool)

(assert (=> bs!5416 m!153649))

(assert (=> b!129774 d!39697))

(assert (=> b!129713 d!39441))

(assert (=> b!129713 d!39443))

(declare-fun d!39699 () Bool)

(assert (=> d!39699 (= (apply!113 lt!67412 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!864 lt!67412) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5417 () Bool)

(assert (= bs!5417 d!39699))

(declare-fun m!153651 () Bool)

(assert (=> bs!5417 m!153651))

(assert (=> bs!5417 m!153651))

(declare-fun m!153653 () Bool)

(assert (=> bs!5417 m!153653))

(assert (=> b!129753 d!39699))

(assert (=> b!129831 d!39561))

(declare-fun d!39701 () Bool)

(assert (=> d!39701 (= (apply!113 lt!67416 lt!67411) (get!1466 (getValueByKey!169 (toList!864 lt!67416) lt!67411)))))

(declare-fun bs!5418 () Bool)

(assert (= bs!5418 d!39701))

(declare-fun m!153655 () Bool)

(assert (=> bs!5418 m!153655))

(assert (=> bs!5418 m!153655))

(declare-fun m!153657 () Bool)

(assert (=> bs!5418 m!153657))

(assert (=> b!129738 d!39701))

(declare-fun d!39703 () Bool)

(declare-fun e!85090 () Bool)

(assert (=> d!39703 e!85090))

(declare-fun res!62911 () Bool)

(assert (=> d!39703 (=> (not res!62911) (not e!85090))))

(declare-fun lt!67856 () ListLongMap!1697)

(assert (=> d!39703 (= res!62911 (contains!889 lt!67856 (_1!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16)))))))

(declare-fun lt!67857 () List!1708)

(assert (=> d!39703 (= lt!67856 (ListLongMap!1698 lt!67857))))

(declare-fun lt!67858 () Unit!4039)

(declare-fun lt!67855 () Unit!4039)

(assert (=> d!39703 (= lt!67858 lt!67855)))

(assert (=> d!39703 (= (getValueByKey!169 lt!67857 (_1!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16)))))))

(assert (=> d!39703 (= lt!67855 (lemmaContainsTupThenGetReturnValue!84 lt!67857 (_1!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16)))))))

(assert (=> d!39703 (= lt!67857 (insertStrictlySorted!87 (toList!864 lt!67414) (_1!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16)))))))

(assert (=> d!39703 (= (+!172 lt!67414 (tuple2!2609 lt!67417 (minValue!2683 newMap!16))) lt!67856)))

(declare-fun b!130443 () Bool)

(declare-fun res!62912 () Bool)

(assert (=> b!130443 (=> (not res!62912) (not e!85090))))

(assert (=> b!130443 (= res!62912 (= (getValueByKey!169 (toList!864 lt!67856) (_1!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67417 (minValue!2683 newMap!16))))))))

(declare-fun b!130444 () Bool)

(assert (=> b!130444 (= e!85090 (contains!890 (toList!864 lt!67856) (tuple2!2609 lt!67417 (minValue!2683 newMap!16))))))

(assert (= (and d!39703 res!62911) b!130443))

(assert (= (and b!130443 res!62912) b!130444))

(declare-fun m!153659 () Bool)

(assert (=> d!39703 m!153659))

(declare-fun m!153661 () Bool)

(assert (=> d!39703 m!153661))

(declare-fun m!153663 () Bool)

(assert (=> d!39703 m!153663))

(declare-fun m!153665 () Bool)

(assert (=> d!39703 m!153665))

(declare-fun m!153667 () Bool)

(assert (=> b!130443 m!153667))

(declare-fun m!153669 () Bool)

(assert (=> b!130444 m!153669))

(assert (=> b!129738 d!39703))

(declare-fun d!39705 () Bool)

(assert (=> d!39705 (= (apply!113 (+!172 lt!67406 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16))) lt!67410) (apply!113 lt!67406 lt!67410))))

(declare-fun lt!67859 () Unit!4039)

(assert (=> d!39705 (= lt!67859 (choose!790 lt!67406 lt!67409 (zeroValue!2683 newMap!16) lt!67410))))

(declare-fun e!85091 () Bool)

(assert (=> d!39705 e!85091))

(declare-fun res!62913 () Bool)

(assert (=> d!39705 (=> (not res!62913) (not e!85091))))

(assert (=> d!39705 (= res!62913 (contains!889 lt!67406 lt!67410))))

(assert (=> d!39705 (= (addApplyDifferent!89 lt!67406 lt!67409 (zeroValue!2683 newMap!16) lt!67410) lt!67859)))

(declare-fun b!130445 () Bool)

(assert (=> b!130445 (= e!85091 (not (= lt!67410 lt!67409)))))

(assert (= (and d!39705 res!62913) b!130445))

(assert (=> d!39705 m!152393))

(assert (=> d!39705 m!152395))

(declare-fun m!153671 () Bool)

(assert (=> d!39705 m!153671))

(assert (=> d!39705 m!152393))

(assert (=> d!39705 m!152383))

(declare-fun m!153673 () Bool)

(assert (=> d!39705 m!153673))

(assert (=> b!129738 d!39705))

(declare-fun d!39707 () Bool)

(assert (=> d!39707 (= (apply!113 (+!172 lt!67414 (tuple2!2609 lt!67417 (minValue!2683 newMap!16))) lt!67408) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67414 (tuple2!2609 lt!67417 (minValue!2683 newMap!16)))) lt!67408)))))

(declare-fun bs!5419 () Bool)

(assert (= bs!5419 d!39707))

(declare-fun m!153675 () Bool)

(assert (=> bs!5419 m!153675))

(assert (=> bs!5419 m!153675))

(declare-fun m!153677 () Bool)

(assert (=> bs!5419 m!153677))

(assert (=> b!129738 d!39707))

(declare-fun d!39709 () Bool)

(declare-fun e!85092 () Bool)

(assert (=> d!39709 e!85092))

(declare-fun res!62914 () Bool)

(assert (=> d!39709 (=> res!62914 e!85092)))

(declare-fun lt!67863 () Bool)

(assert (=> d!39709 (= res!62914 (not lt!67863))))

(declare-fun lt!67862 () Bool)

(assert (=> d!39709 (= lt!67863 lt!67862)))

(declare-fun lt!67861 () Unit!4039)

(declare-fun e!85093 () Unit!4039)

(assert (=> d!39709 (= lt!67861 e!85093)))

(declare-fun c!24058 () Bool)

(assert (=> d!39709 (= c!24058 lt!67862)))

(assert (=> d!39709 (= lt!67862 (containsKey!173 (toList!864 (+!172 lt!67424 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))) lt!67413))))

(assert (=> d!39709 (= (contains!889 (+!172 lt!67424 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16))) lt!67413) lt!67863)))

(declare-fun b!130446 () Bool)

(declare-fun lt!67860 () Unit!4039)

(assert (=> b!130446 (= e!85093 lt!67860)))

(assert (=> b!130446 (= lt!67860 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (+!172 lt!67424 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))) lt!67413))))

(assert (=> b!130446 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67424 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))) lt!67413))))

(declare-fun b!130447 () Bool)

(declare-fun Unit!4082 () Unit!4039)

(assert (=> b!130447 (= e!85093 Unit!4082)))

(declare-fun b!130448 () Bool)

(assert (=> b!130448 (= e!85092 (isDefined!122 (getValueByKey!169 (toList!864 (+!172 lt!67424 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))) lt!67413)))))

(assert (= (and d!39709 c!24058) b!130446))

(assert (= (and d!39709 (not c!24058)) b!130447))

(assert (= (and d!39709 (not res!62914)) b!130448))

(declare-fun m!153679 () Bool)

(assert (=> d!39709 m!153679))

(declare-fun m!153681 () Bool)

(assert (=> b!130446 m!153681))

(declare-fun m!153683 () Bool)

(assert (=> b!130446 m!153683))

(assert (=> b!130446 m!153683))

(declare-fun m!153685 () Bool)

(assert (=> b!130446 m!153685))

(assert (=> b!130448 m!153683))

(assert (=> b!130448 m!153683))

(assert (=> b!130448 m!153685))

(assert (=> b!129738 d!39709))

(declare-fun d!39711 () Bool)

(assert (=> d!39711 (= (apply!113 lt!67406 lt!67410) (get!1466 (getValueByKey!169 (toList!864 lt!67406) lt!67410)))))

(declare-fun bs!5420 () Bool)

(assert (= bs!5420 d!39711))

(declare-fun m!153687 () Bool)

(assert (=> bs!5420 m!153687))

(assert (=> bs!5420 m!153687))

(declare-fun m!153689 () Bool)

(assert (=> bs!5420 m!153689))

(assert (=> b!129738 d!39711))

(declare-fun d!39713 () Bool)

(assert (=> d!39713 (contains!889 (+!172 lt!67424 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16))) lt!67413)))

(declare-fun lt!67864 () Unit!4039)

(assert (=> d!39713 (= lt!67864 (choose!791 lt!67424 lt!67420 (zeroValue!2683 newMap!16) lt!67413))))

(assert (=> d!39713 (contains!889 lt!67424 lt!67413)))

(assert (=> d!39713 (= (addStillContains!89 lt!67424 lt!67420 (zeroValue!2683 newMap!16) lt!67413) lt!67864)))

(declare-fun bs!5421 () Bool)

(assert (= bs!5421 d!39713))

(assert (=> bs!5421 m!152387))

(assert (=> bs!5421 m!152387))

(assert (=> bs!5421 m!152389))

(declare-fun m!153691 () Bool)

(assert (=> bs!5421 m!153691))

(declare-fun m!153693 () Bool)

(assert (=> bs!5421 m!153693))

(assert (=> b!129738 d!39713))

(declare-fun d!39715 () Bool)

(assert (=> d!39715 (= (apply!113 (+!172 lt!67416 (tuple2!2609 lt!67425 (minValue!2683 newMap!16))) lt!67411) (apply!113 lt!67416 lt!67411))))

(declare-fun lt!67865 () Unit!4039)

(assert (=> d!39715 (= lt!67865 (choose!790 lt!67416 lt!67425 (minValue!2683 newMap!16) lt!67411))))

(declare-fun e!85094 () Bool)

(assert (=> d!39715 e!85094))

(declare-fun res!62915 () Bool)

(assert (=> d!39715 (=> (not res!62915) (not e!85094))))

(assert (=> d!39715 (= res!62915 (contains!889 lt!67416 lt!67411))))

(assert (=> d!39715 (= (addApplyDifferent!89 lt!67416 lt!67425 (minValue!2683 newMap!16) lt!67411) lt!67865)))

(declare-fun b!130449 () Bool)

(assert (=> b!130449 (= e!85094 (not (= lt!67411 lt!67425)))))

(assert (= (and d!39715 res!62915) b!130449))

(assert (=> d!39715 m!152381))

(assert (=> d!39715 m!152397))

(declare-fun m!153695 () Bool)

(assert (=> d!39715 m!153695))

(assert (=> d!39715 m!152381))

(assert (=> d!39715 m!152391))

(declare-fun m!153697 () Bool)

(assert (=> d!39715 m!153697))

(assert (=> b!129738 d!39715))

(declare-fun d!39717 () Bool)

(declare-fun e!85095 () Bool)

(assert (=> d!39717 e!85095))

(declare-fun res!62916 () Bool)

(assert (=> d!39717 (=> (not res!62916) (not e!85095))))

(declare-fun lt!67867 () ListLongMap!1697)

(assert (=> d!39717 (= res!62916 (contains!889 lt!67867 (_1!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16)))))))

(declare-fun lt!67868 () List!1708)

(assert (=> d!39717 (= lt!67867 (ListLongMap!1698 lt!67868))))

(declare-fun lt!67869 () Unit!4039)

(declare-fun lt!67866 () Unit!4039)

(assert (=> d!39717 (= lt!67869 lt!67866)))

(assert (=> d!39717 (= (getValueByKey!169 lt!67868 (_1!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16)))))))

(assert (=> d!39717 (= lt!67866 (lemmaContainsTupThenGetReturnValue!84 lt!67868 (_1!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16)))))))

(assert (=> d!39717 (= lt!67868 (insertStrictlySorted!87 (toList!864 lt!67416) (_1!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16)))))))

(assert (=> d!39717 (= (+!172 lt!67416 (tuple2!2609 lt!67425 (minValue!2683 newMap!16))) lt!67867)))

(declare-fun b!130450 () Bool)

(declare-fun res!62917 () Bool)

(assert (=> b!130450 (=> (not res!62917) (not e!85095))))

(assert (=> b!130450 (= res!62917 (= (getValueByKey!169 (toList!864 lt!67867) (_1!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67425 (minValue!2683 newMap!16))))))))

(declare-fun b!130451 () Bool)

(assert (=> b!130451 (= e!85095 (contains!890 (toList!864 lt!67867) (tuple2!2609 lt!67425 (minValue!2683 newMap!16))))))

(assert (= (and d!39717 res!62916) b!130450))

(assert (= (and b!130450 res!62917) b!130451))

(declare-fun m!153699 () Bool)

(assert (=> d!39717 m!153699))

(declare-fun m!153701 () Bool)

(assert (=> d!39717 m!153701))

(declare-fun m!153703 () Bool)

(assert (=> d!39717 m!153703))

(declare-fun m!153705 () Bool)

(assert (=> d!39717 m!153705))

(declare-fun m!153707 () Bool)

(assert (=> b!130450 m!153707))

(declare-fun m!153709 () Bool)

(assert (=> b!130451 m!153709))

(assert (=> b!129738 d!39717))

(declare-fun d!39719 () Bool)

(assert (=> d!39719 (= (apply!113 lt!67414 lt!67408) (get!1466 (getValueByKey!169 (toList!864 lt!67414) lt!67408)))))

(declare-fun bs!5422 () Bool)

(assert (= bs!5422 d!39719))

(declare-fun m!153711 () Bool)

(assert (=> bs!5422 m!153711))

(assert (=> bs!5422 m!153711))

(declare-fun m!153713 () Bool)

(assert (=> bs!5422 m!153713))

(assert (=> b!129738 d!39719))

(declare-fun d!39721 () Bool)

(declare-fun e!85096 () Bool)

(assert (=> d!39721 e!85096))

(declare-fun res!62918 () Bool)

(assert (=> d!39721 (=> (not res!62918) (not e!85096))))

(declare-fun lt!67871 () ListLongMap!1697)

(assert (=> d!39721 (= res!62918 (contains!889 lt!67871 (_1!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16)))))))

(declare-fun lt!67872 () List!1708)

(assert (=> d!39721 (= lt!67871 (ListLongMap!1698 lt!67872))))

(declare-fun lt!67873 () Unit!4039)

(declare-fun lt!67870 () Unit!4039)

(assert (=> d!39721 (= lt!67873 lt!67870)))

(assert (=> d!39721 (= (getValueByKey!169 lt!67872 (_1!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39721 (= lt!67870 (lemmaContainsTupThenGetReturnValue!84 lt!67872 (_1!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39721 (= lt!67872 (insertStrictlySorted!87 (toList!864 lt!67406) (_1!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39721 (= (+!172 lt!67406 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16))) lt!67871)))

(declare-fun b!130452 () Bool)

(declare-fun res!62919 () Bool)

(assert (=> b!130452 (=> (not res!62919) (not e!85096))))

(assert (=> b!130452 (= res!62919 (= (getValueByKey!169 (toList!864 lt!67871) (_1!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16))))))))

(declare-fun b!130453 () Bool)

(assert (=> b!130453 (= e!85096 (contains!890 (toList!864 lt!67871) (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16))))))

(assert (= (and d!39721 res!62918) b!130452))

(assert (= (and b!130452 res!62919) b!130453))

(declare-fun m!153715 () Bool)

(assert (=> d!39721 m!153715))

(declare-fun m!153717 () Bool)

(assert (=> d!39721 m!153717))

(declare-fun m!153719 () Bool)

(assert (=> d!39721 m!153719))

(declare-fun m!153721 () Bool)

(assert (=> d!39721 m!153721))

(declare-fun m!153723 () Bool)

(assert (=> b!130452 m!153723))

(declare-fun m!153725 () Bool)

(assert (=> b!130453 m!153725))

(assert (=> b!129738 d!39721))

(declare-fun d!39723 () Bool)

(declare-fun e!85097 () Bool)

(assert (=> d!39723 e!85097))

(declare-fun res!62920 () Bool)

(assert (=> d!39723 (=> (not res!62920) (not e!85097))))

(declare-fun lt!67875 () ListLongMap!1697)

(assert (=> d!39723 (= res!62920 (contains!889 lt!67875 (_1!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))))))

(declare-fun lt!67876 () List!1708)

(assert (=> d!39723 (= lt!67875 (ListLongMap!1698 lt!67876))))

(declare-fun lt!67877 () Unit!4039)

(declare-fun lt!67874 () Unit!4039)

(assert (=> d!39723 (= lt!67877 lt!67874)))

(assert (=> d!39723 (= (getValueByKey!169 lt!67876 (_1!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39723 (= lt!67874 (lemmaContainsTupThenGetReturnValue!84 lt!67876 (_1!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39723 (= lt!67876 (insertStrictlySorted!87 (toList!864 lt!67424) (_1!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16))) (_2!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))))))

(assert (=> d!39723 (= (+!172 lt!67424 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16))) lt!67875)))

(declare-fun b!130454 () Bool)

(declare-fun res!62921 () Bool)

(assert (=> b!130454 (=> (not res!62921) (not e!85097))))

(assert (=> b!130454 (= res!62921 (= (getValueByKey!169 (toList!864 lt!67875) (_1!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16))))))))

(declare-fun b!130455 () Bool)

(assert (=> b!130455 (= e!85097 (contains!890 (toList!864 lt!67875) (tuple2!2609 lt!67420 (zeroValue!2683 newMap!16))))))

(assert (= (and d!39723 res!62920) b!130454))

(assert (= (and b!130454 res!62921) b!130455))

(declare-fun m!153727 () Bool)

(assert (=> d!39723 m!153727))

(declare-fun m!153729 () Bool)

(assert (=> d!39723 m!153729))

(declare-fun m!153731 () Bool)

(assert (=> d!39723 m!153731))

(declare-fun m!153733 () Bool)

(assert (=> d!39723 m!153733))

(declare-fun m!153735 () Bool)

(assert (=> b!130454 m!153735))

(declare-fun m!153737 () Bool)

(assert (=> b!130455 m!153737))

(assert (=> b!129738 d!39723))

(declare-fun d!39725 () Bool)

(assert (=> d!39725 (= (apply!113 (+!172 lt!67406 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16))) lt!67410) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67406 (tuple2!2609 lt!67409 (zeroValue!2683 newMap!16)))) lt!67410)))))

(declare-fun bs!5423 () Bool)

(assert (= bs!5423 d!39725))

(declare-fun m!153739 () Bool)

(assert (=> bs!5423 m!153739))

(assert (=> bs!5423 m!153739))

(declare-fun m!153741 () Bool)

(assert (=> bs!5423 m!153741))

(assert (=> b!129738 d!39725))

(declare-fun d!39727 () Bool)

(assert (=> d!39727 (= (apply!113 (+!172 lt!67416 (tuple2!2609 lt!67425 (minValue!2683 newMap!16))) lt!67411) (get!1466 (getValueByKey!169 (toList!864 (+!172 lt!67416 (tuple2!2609 lt!67425 (minValue!2683 newMap!16)))) lt!67411)))))

(declare-fun bs!5424 () Bool)

(assert (= bs!5424 d!39727))

(declare-fun m!153743 () Bool)

(assert (=> bs!5424 m!153743))

(assert (=> bs!5424 m!153743))

(declare-fun m!153745 () Bool)

(assert (=> bs!5424 m!153745))

(assert (=> b!129738 d!39727))

(declare-fun d!39729 () Bool)

(assert (=> d!39729 (= (apply!113 (+!172 lt!67414 (tuple2!2609 lt!67417 (minValue!2683 newMap!16))) lt!67408) (apply!113 lt!67414 lt!67408))))

(declare-fun lt!67878 () Unit!4039)

(assert (=> d!39729 (= lt!67878 (choose!790 lt!67414 lt!67417 (minValue!2683 newMap!16) lt!67408))))

(declare-fun e!85098 () Bool)

(assert (=> d!39729 e!85098))

(declare-fun res!62922 () Bool)

(assert (=> d!39729 (=> (not res!62922) (not e!85098))))

(assert (=> d!39729 (= res!62922 (contains!889 lt!67414 lt!67408))))

(assert (=> d!39729 (= (addApplyDifferent!89 lt!67414 lt!67417 (minValue!2683 newMap!16) lt!67408) lt!67878)))

(declare-fun b!130456 () Bool)

(assert (=> b!130456 (= e!85098 (not (= lt!67408 lt!67417)))))

(assert (= (and d!39729 res!62922) b!130456))

(assert (=> d!39729 m!152375))

(assert (=> d!39729 m!152377))

(declare-fun m!153747 () Bool)

(assert (=> d!39729 m!153747))

(assert (=> d!39729 m!152375))

(assert (=> d!39729 m!152399))

(declare-fun m!153749 () Bool)

(assert (=> d!39729 m!153749))

(assert (=> b!129738 d!39729))

(declare-fun b!130457 () Bool)

(declare-fun e!85103 () ListLongMap!1697)

(declare-fun e!85105 () ListLongMap!1697)

(assert (=> b!130457 (= e!85103 e!85105)))

(declare-fun c!24061 () Bool)

(assert (=> b!130457 (= c!24061 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130458 () Bool)

(declare-fun lt!67884 () Unit!4039)

(declare-fun lt!67881 () Unit!4039)

(assert (=> b!130458 (= lt!67884 lt!67881)))

(declare-fun lt!67882 () (_ BitVec 64))

(declare-fun lt!67883 () (_ BitVec 64))

(declare-fun lt!67879 () ListLongMap!1697)

(declare-fun lt!67880 () V!3459)

(assert (=> b!130458 (not (contains!889 (+!172 lt!67879 (tuple2!2609 lt!67883 lt!67880)) lt!67882))))

(assert (=> b!130458 (= lt!67881 (addStillNotContains!58 lt!67879 lt!67883 lt!67880 lt!67882))))

(assert (=> b!130458 (= lt!67882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!130458 (= lt!67880 (get!1463 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130458 (= lt!67883 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!14209 () ListLongMap!1697)

(assert (=> b!130458 (= lt!67879 call!14209)))

(assert (=> b!130458 (= e!85105 (+!172 call!14209 (tuple2!2609 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (get!1463 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!130459 () Bool)

(declare-fun e!85099 () Bool)

(declare-fun lt!67885 () ListLongMap!1697)

(assert (=> b!130459 (= e!85099 (= lt!67885 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2824 newMap!16))))))

(declare-fun b!130460 () Bool)

(declare-fun res!62925 () Bool)

(declare-fun e!85102 () Bool)

(assert (=> b!130460 (=> (not res!62925) (not e!85102))))

(assert (=> b!130460 (= res!62925 (not (contains!889 lt!67885 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!130461 () Bool)

(assert (=> b!130461 (= e!85105 call!14209)))

(declare-fun bm!14206 () Bool)

(assert (=> bm!14206 (= call!14209 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2824 newMap!16)))))

(declare-fun b!130462 () Bool)

(assert (=> b!130462 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> b!130462 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (_values!2807 newMap!16))))))

(declare-fun e!85104 () Bool)

(assert (=> b!130462 (= e!85104 (= (apply!113 lt!67885 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130463 () Bool)

(declare-fun e!85100 () Bool)

(assert (=> b!130463 (= e!85100 e!85104)))

(assert (=> b!130463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun res!62923 () Bool)

(assert (=> b!130463 (= res!62923 (contains!889 lt!67885 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130463 (=> (not res!62923) (not e!85104))))

(declare-fun d!39731 () Bool)

(assert (=> d!39731 e!85102))

(declare-fun res!62926 () Bool)

(assert (=> d!39731 (=> (not res!62926) (not e!85102))))

(assert (=> d!39731 (= res!62926 (not (contains!889 lt!67885 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39731 (= lt!67885 e!85103)))

(declare-fun c!24060 () Bool)

(assert (=> d!39731 (= c!24060 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (=> d!39731 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39731 (= (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67885)))

(declare-fun b!130464 () Bool)

(assert (=> b!130464 (= e!85100 e!85099)))

(declare-fun c!24062 () Bool)

(assert (=> b!130464 (= c!24062 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130465 () Bool)

(declare-fun e!85101 () Bool)

(assert (=> b!130465 (= e!85101 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130465 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!130466 () Bool)

(assert (=> b!130466 (= e!85099 (isEmpty!402 lt!67885))))

(declare-fun b!130467 () Bool)

(assert (=> b!130467 (= e!85103 (ListLongMap!1698 Nil!1705))))

(declare-fun b!130468 () Bool)

(assert (=> b!130468 (= e!85102 e!85100)))

(declare-fun c!24059 () Bool)

(assert (=> b!130468 (= c!24059 e!85101)))

(declare-fun res!62924 () Bool)

(assert (=> b!130468 (=> (not res!62924) (not e!85101))))

(assert (=> b!130468 (= res!62924 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(assert (= (and d!39731 c!24060) b!130467))

(assert (= (and d!39731 (not c!24060)) b!130457))

(assert (= (and b!130457 c!24061) b!130458))

(assert (= (and b!130457 (not c!24061)) b!130461))

(assert (= (or b!130458 b!130461) bm!14206))

(assert (= (and d!39731 res!62926) b!130460))

(assert (= (and b!130460 res!62925) b!130468))

(assert (= (and b!130468 res!62924) b!130465))

(assert (= (and b!130468 c!24059) b!130463))

(assert (= (and b!130468 (not c!24059)) b!130464))

(assert (= (and b!130463 res!62923) b!130462))

(assert (= (and b!130464 c!24062) b!130459))

(assert (= (and b!130464 (not c!24062)) b!130466))

(declare-fun b_lambda!5789 () Bool)

(assert (=> (not b_lambda!5789) (not b!130458)))

(assert (=> b!130458 t!6114))

(declare-fun b_and!8079 () Bool)

(assert (= b_and!8075 (and (=> t!6114 result!3921) b_and!8079)))

(assert (=> b!130458 t!6116))

(declare-fun b_and!8081 () Bool)

(assert (= b_and!8077 (and (=> t!6116 result!3923) b_and!8081)))

(declare-fun b_lambda!5791 () Bool)

(assert (=> (not b_lambda!5791) (not b!130462)))

(assert (=> b!130462 t!6114))

(declare-fun b_and!8083 () Bool)

(assert (= b_and!8079 (and (=> t!6114 result!3921) b_and!8083)))

(assert (=> b!130462 t!6116))

(declare-fun b_and!8085 () Bool)

(assert (= b_and!8081 (and (=> t!6116 result!3923) b_and!8085)))

(declare-fun m!153751 () Bool)

(assert (=> b!130466 m!153751))

(declare-fun m!153753 () Bool)

(assert (=> d!39731 m!153753))

(assert (=> d!39731 m!151983))

(assert (=> b!130462 m!152357))

(assert (=> b!130462 m!152013))

(declare-fun m!153755 () Bool)

(assert (=> b!130462 m!153755))

(assert (=> b!130462 m!152013))

(assert (=> b!130462 m!152357))

(assert (=> b!130462 m!152009))

(assert (=> b!130462 m!152359))

(assert (=> b!130462 m!152009))

(assert (=> b!130457 m!152013))

(assert (=> b!130457 m!152013))

(assert (=> b!130457 m!152019))

(assert (=> b!130463 m!152013))

(assert (=> b!130463 m!152013))

(declare-fun m!153757 () Bool)

(assert (=> b!130463 m!153757))

(declare-fun m!153759 () Bool)

(assert (=> bm!14206 m!153759))

(declare-fun m!153761 () Bool)

(assert (=> b!130460 m!153761))

(assert (=> b!130465 m!152013))

(assert (=> b!130465 m!152013))

(assert (=> b!130465 m!152019))

(assert (=> b!130458 m!152357))

(declare-fun m!153763 () Bool)

(assert (=> b!130458 m!153763))

(declare-fun m!153765 () Bool)

(assert (=> b!130458 m!153765))

(assert (=> b!130458 m!152013))

(declare-fun m!153767 () Bool)

(assert (=> b!130458 m!153767))

(assert (=> b!130458 m!152009))

(assert (=> b!130458 m!153763))

(assert (=> b!130458 m!152357))

(assert (=> b!130458 m!152009))

(assert (=> b!130458 m!152359))

(declare-fun m!153769 () Bool)

(assert (=> b!130458 m!153769))

(assert (=> b!130459 m!153759))

(assert (=> b!129738 d!39731))

(assert (=> d!39331 d!39457))

(declare-fun d!39733 () Bool)

(declare-fun e!85106 () Bool)

(assert (=> d!39733 e!85106))

(declare-fun res!62927 () Bool)

(assert (=> d!39733 (=> res!62927 e!85106)))

(declare-fun lt!67889 () Bool)

(assert (=> d!39733 (= res!62927 (not lt!67889))))

(declare-fun lt!67888 () Bool)

(assert (=> d!39733 (= lt!67889 lt!67888)))

(declare-fun lt!67887 () Unit!4039)

(declare-fun e!85107 () Unit!4039)

(assert (=> d!39733 (= lt!67887 e!85107)))

(declare-fun c!24063 () Bool)

(assert (=> d!39733 (= c!24063 lt!67888)))

(assert (=> d!39733 (= lt!67888 (containsKey!173 (toList!864 lt!67396) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39733 (= (contains!889 lt!67396 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67889)))

(declare-fun b!130469 () Bool)

(declare-fun lt!67886 () Unit!4039)

(assert (=> b!130469 (= e!85107 lt!67886)))

(assert (=> b!130469 (= lt!67886 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67396) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> b!130469 (isDefined!122 (getValueByKey!169 (toList!864 lt!67396) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130470 () Bool)

(declare-fun Unit!4083 () Unit!4039)

(assert (=> b!130470 (= e!85107 Unit!4083)))

(declare-fun b!130471 () Bool)

(assert (=> b!130471 (= e!85106 (isDefined!122 (getValueByKey!169 (toList!864 lt!67396) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39733 c!24063) b!130469))

(assert (= (and d!39733 (not c!24063)) b!130470))

(assert (= (and d!39733 (not res!62927)) b!130471))

(declare-fun m!153771 () Bool)

(assert (=> d!39733 m!153771))

(declare-fun m!153773 () Bool)

(assert (=> b!130469 m!153773))

(assert (=> b!130469 m!152339))

(assert (=> b!130469 m!152339))

(declare-fun m!153775 () Bool)

(assert (=> b!130469 m!153775))

(assert (=> b!130471 m!152339))

(assert (=> b!130471 m!152339))

(assert (=> b!130471 m!153775))

(assert (=> d!39321 d!39733))

(declare-fun b!130474 () Bool)

(declare-fun e!85109 () Option!175)

(assert (=> b!130474 (= e!85109 (getValueByKey!169 (t!6107 lt!67397) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130472 () Bool)

(declare-fun e!85108 () Option!175)

(assert (=> b!130472 (= e!85108 (Some!174 (_2!1315 (h!2308 lt!67397))))))

(declare-fun b!130473 () Bool)

(assert (=> b!130473 (= e!85108 e!85109)))

(declare-fun c!24065 () Bool)

(assert (=> b!130473 (= c!24065 (and ((_ is Cons!1704) lt!67397) (not (= (_1!1315 (h!2308 lt!67397)) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun d!39735 () Bool)

(declare-fun c!24064 () Bool)

(assert (=> d!39735 (= c!24064 (and ((_ is Cons!1704) lt!67397) (= (_1!1315 (h!2308 lt!67397)) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39735 (= (getValueByKey!169 lt!67397 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!85108)))

(declare-fun b!130475 () Bool)

(assert (=> b!130475 (= e!85109 None!173)))

(assert (= (and d!39735 c!24064) b!130472))

(assert (= (and d!39735 (not c!24064)) b!130473))

(assert (= (and b!130473 c!24065) b!130474))

(assert (= (and b!130473 (not c!24065)) b!130475))

(declare-fun m!153777 () Bool)

(assert (=> b!130474 m!153777))

(assert (=> d!39321 d!39735))

(declare-fun d!39737 () Bool)

(assert (=> d!39737 (= (getValueByKey!169 lt!67397 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67890 () Unit!4039)

(assert (=> d!39737 (= lt!67890 (choose!796 lt!67397 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun e!85110 () Bool)

(assert (=> d!39737 e!85110))

(declare-fun res!62928 () Bool)

(assert (=> d!39737 (=> (not res!62928) (not e!85110))))

(assert (=> d!39737 (= res!62928 (isStrictlySorted!319 lt!67397))))

(assert (=> d!39737 (= (lemmaContainsTupThenGetReturnValue!84 lt!67397 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67890)))

(declare-fun b!130476 () Bool)

(declare-fun res!62929 () Bool)

(assert (=> b!130476 (=> (not res!62929) (not e!85110))))

(assert (=> b!130476 (= res!62929 (containsKey!173 lt!67397 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130477 () Bool)

(assert (=> b!130477 (= e!85110 (contains!890 lt!67397 (tuple2!2609 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39737 res!62928) b!130476))

(assert (= (and b!130476 res!62929) b!130477))

(assert (=> d!39737 m!152333))

(declare-fun m!153779 () Bool)

(assert (=> d!39737 m!153779))

(declare-fun m!153781 () Bool)

(assert (=> d!39737 m!153781))

(declare-fun m!153783 () Bool)

(assert (=> b!130476 m!153783))

(declare-fun m!153785 () Bool)

(assert (=> b!130477 m!153785))

(assert (=> d!39321 d!39737))

(declare-fun bm!14207 () Bool)

(declare-fun e!85112 () List!1708)

(declare-fun c!24069 () Bool)

(declare-fun call!14212 () List!1708)

(assert (=> bm!14207 (= call!14212 ($colon$colon!91 e!85112 (ite c!24069 (h!2308 (toList!864 call!14002)) (tuple2!2609 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!24066 () Bool)

(assert (=> bm!14207 (= c!24066 c!24069)))

(declare-fun b!130478 () Bool)

(declare-fun c!24068 () Bool)

(declare-fun c!24067 () Bool)

(assert (=> b!130478 (= e!85112 (ite c!24067 (t!6107 (toList!864 call!14002)) (ite c!24068 (Cons!1704 (h!2308 (toList!864 call!14002)) (t!6107 (toList!864 call!14002))) Nil!1705)))))

(declare-fun b!130479 () Bool)

(declare-fun e!85113 () List!1708)

(declare-fun call!14211 () List!1708)

(assert (=> b!130479 (= e!85113 call!14211)))

(declare-fun b!130480 () Bool)

(declare-fun e!85115 () Bool)

(declare-fun lt!67891 () List!1708)

(assert (=> b!130480 (= e!85115 (contains!890 lt!67891 (tuple2!2609 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130481 () Bool)

(declare-fun res!62931 () Bool)

(assert (=> b!130481 (=> (not res!62931) (not e!85115))))

(assert (=> b!130481 (= res!62931 (containsKey!173 lt!67891 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130482 () Bool)

(assert (=> b!130482 (= e!85113 call!14211)))

(declare-fun b!130483 () Bool)

(declare-fun e!85111 () List!1708)

(declare-fun call!14210 () List!1708)

(assert (=> b!130483 (= e!85111 call!14210)))

(declare-fun b!130484 () Bool)

(assert (=> b!130484 (= c!24068 (and ((_ is Cons!1704) (toList!864 call!14002)) (bvsgt (_1!1315 (h!2308 (toList!864 call!14002))) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> b!130484 (= e!85111 e!85113)))

(declare-fun bm!14209 () Bool)

(assert (=> bm!14209 (= call!14210 call!14212)))

(declare-fun b!130485 () Bool)

(declare-fun e!85114 () List!1708)

(assert (=> b!130485 (= e!85114 e!85111)))

(assert (=> b!130485 (= c!24067 (and ((_ is Cons!1704) (toList!864 call!14002)) (= (_1!1315 (h!2308 (toList!864 call!14002))) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun bm!14208 () Bool)

(assert (=> bm!14208 (= call!14211 call!14210)))

(declare-fun d!39739 () Bool)

(assert (=> d!39739 e!85115))

(declare-fun res!62930 () Bool)

(assert (=> d!39739 (=> (not res!62930) (not e!85115))))

(assert (=> d!39739 (= res!62930 (isStrictlySorted!319 lt!67891))))

(assert (=> d!39739 (= lt!67891 e!85114)))

(assert (=> d!39739 (= c!24069 (and ((_ is Cons!1704) (toList!864 call!14002)) (bvslt (_1!1315 (h!2308 (toList!864 call!14002))) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39739 (isStrictlySorted!319 (toList!864 call!14002))))

(assert (=> d!39739 (= (insertStrictlySorted!87 (toList!864 call!14002) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67891)))

(declare-fun b!130486 () Bool)

(assert (=> b!130486 (= e!85114 call!14212)))

(declare-fun b!130487 () Bool)

(assert (=> b!130487 (= e!85112 (insertStrictlySorted!87 (t!6107 (toList!864 call!14002)) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (= (and d!39739 c!24069) b!130486))

(assert (= (and d!39739 (not c!24069)) b!130485))

(assert (= (and b!130485 c!24067) b!130483))

(assert (= (and b!130485 (not c!24067)) b!130484))

(assert (= (and b!130484 c!24068) b!130479))

(assert (= (and b!130484 (not c!24068)) b!130482))

(assert (= (or b!130479 b!130482) bm!14208))

(assert (= (or b!130483 bm!14208) bm!14209))

(assert (= (or b!130486 bm!14209) bm!14207))

(assert (= (and bm!14207 c!24066) b!130487))

(assert (= (and bm!14207 (not c!24066)) b!130478))

(assert (= (and d!39739 res!62930) b!130481))

(assert (= (and b!130481 res!62931) b!130480))

(declare-fun m!153787 () Bool)

(assert (=> b!130480 m!153787))

(declare-fun m!153789 () Bool)

(assert (=> b!130481 m!153789))

(declare-fun m!153791 () Bool)

(assert (=> b!130487 m!153791))

(declare-fun m!153793 () Bool)

(assert (=> bm!14207 m!153793))

(declare-fun m!153795 () Bool)

(assert (=> d!39739 m!153795))

(declare-fun m!153797 () Bool)

(assert (=> d!39739 m!153797))

(assert (=> d!39321 d!39739))

(declare-fun d!39741 () Bool)

(declare-fun res!62932 () Bool)

(declare-fun e!85116 () Bool)

(assert (=> d!39741 (=> (not res!62932) (not e!85116))))

(assert (=> d!39741 (= res!62932 (simpleValid!89 (_2!1316 lt!67334)))))

(assert (=> d!39741 (= (valid!515 (_2!1316 lt!67334)) e!85116)))

(declare-fun b!130488 () Bool)

(declare-fun res!62933 () Bool)

(assert (=> b!130488 (=> (not res!62933) (not e!85116))))

(assert (=> b!130488 (= res!62933 (= (arrayCountValidKeys!0 (_keys!4565 (_2!1316 lt!67334)) #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67334)))) (_size!589 (_2!1316 lt!67334))))))

(declare-fun b!130489 () Bool)

(declare-fun res!62934 () Bool)

(assert (=> b!130489 (=> (not res!62934) (not e!85116))))

(assert (=> b!130489 (= res!62934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4565 (_2!1316 lt!67334)) (mask!7102 (_2!1316 lt!67334))))))

(declare-fun b!130490 () Bool)

(assert (=> b!130490 (= e!85116 (arrayNoDuplicates!0 (_keys!4565 (_2!1316 lt!67334)) #b00000000000000000000000000000000 Nil!1706))))

(assert (= (and d!39741 res!62932) b!130488))

(assert (= (and b!130488 res!62933) b!130489))

(assert (= (and b!130489 res!62934) b!130490))

(declare-fun m!153799 () Bool)

(assert (=> d!39741 m!153799))

(declare-fun m!153801 () Bool)

(assert (=> b!130488 m!153801))

(declare-fun m!153803 () Bool)

(assert (=> b!130489 m!153803))

(declare-fun m!153805 () Bool)

(assert (=> b!130490 m!153805))

(assert (=> b!129649 d!39741))

(declare-fun d!39743 () Bool)

(declare-fun e!85117 () Bool)

(assert (=> d!39743 e!85117))

(declare-fun res!62935 () Bool)

(assert (=> d!39743 (=> res!62935 e!85117)))

(declare-fun lt!67895 () Bool)

(assert (=> d!39743 (= res!62935 (not lt!67895))))

(declare-fun lt!67894 () Bool)

(assert (=> d!39743 (= lt!67895 lt!67894)))

(declare-fun lt!67893 () Unit!4039)

(declare-fun e!85118 () Unit!4039)

(assert (=> d!39743 (= lt!67893 e!85118)))

(declare-fun c!24070 () Bool)

(assert (=> d!39743 (= c!24070 lt!67894)))

(assert (=> d!39743 (= lt!67894 (containsKey!173 (toList!864 lt!67368) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39743 (= (contains!889 lt!67368 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67895)))

(declare-fun b!130491 () Bool)

(declare-fun lt!67892 () Unit!4039)

(assert (=> b!130491 (= e!85118 lt!67892)))

(assert (=> b!130491 (= lt!67892 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67368) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> b!130491 (isDefined!122 (getValueByKey!169 (toList!864 lt!67368) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130492 () Bool)

(declare-fun Unit!4084 () Unit!4039)

(assert (=> b!130492 (= e!85118 Unit!4084)))

(declare-fun b!130493 () Bool)

(assert (=> b!130493 (= e!85117 (isDefined!122 (getValueByKey!169 (toList!864 lt!67368) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39743 c!24070) b!130491))

(assert (= (and d!39743 (not c!24070)) b!130492))

(assert (= (and d!39743 (not res!62935)) b!130493))

(declare-fun m!153807 () Bool)

(assert (=> d!39743 m!153807))

(declare-fun m!153809 () Bool)

(assert (=> b!130491 m!153809))

(assert (=> b!130491 m!152241))

(assert (=> b!130491 m!152241))

(declare-fun m!153811 () Bool)

(assert (=> b!130491 m!153811))

(assert (=> b!130493 m!152241))

(assert (=> b!130493 m!152241))

(assert (=> b!130493 m!153811))

(assert (=> d!39291 d!39743))

(declare-fun e!85120 () Option!175)

(declare-fun b!130496 () Bool)

(assert (=> b!130496 (= e!85120 (getValueByKey!169 (t!6107 lt!67369) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130494 () Bool)

(declare-fun e!85119 () Option!175)

(assert (=> b!130494 (= e!85119 (Some!174 (_2!1315 (h!2308 lt!67369))))))

(declare-fun b!130495 () Bool)

(assert (=> b!130495 (= e!85119 e!85120)))

(declare-fun c!24072 () Bool)

(assert (=> b!130495 (= c!24072 (and ((_ is Cons!1704) lt!67369) (not (= (_1!1315 (h!2308 lt!67369)) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!24071 () Bool)

(declare-fun d!39745 () Bool)

(assert (=> d!39745 (= c!24071 (and ((_ is Cons!1704) lt!67369) (= (_1!1315 (h!2308 lt!67369)) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39745 (= (getValueByKey!169 lt!67369 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!85119)))

(declare-fun b!130497 () Bool)

(assert (=> b!130497 (= e!85120 None!173)))

(assert (= (and d!39745 c!24071) b!130494))

(assert (= (and d!39745 (not c!24071)) b!130495))

(assert (= (and b!130495 c!24072) b!130496))

(assert (= (and b!130495 (not c!24072)) b!130497))

(declare-fun m!153813 () Bool)

(assert (=> b!130496 m!153813))

(assert (=> d!39291 d!39745))

(declare-fun d!39747 () Bool)

(assert (=> d!39747 (= (getValueByKey!169 lt!67369 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67896 () Unit!4039)

(assert (=> d!39747 (= lt!67896 (choose!796 lt!67369 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun e!85121 () Bool)

(assert (=> d!39747 e!85121))

(declare-fun res!62936 () Bool)

(assert (=> d!39747 (=> (not res!62936) (not e!85121))))

(assert (=> d!39747 (= res!62936 (isStrictlySorted!319 lt!67369))))

(assert (=> d!39747 (= (lemmaContainsTupThenGetReturnValue!84 lt!67369 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67896)))

(declare-fun b!130498 () Bool)

(declare-fun res!62937 () Bool)

(assert (=> b!130498 (=> (not res!62937) (not e!85121))))

(assert (=> b!130498 (= res!62937 (containsKey!173 lt!67369 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130499 () Bool)

(assert (=> b!130499 (= e!85121 (contains!890 lt!67369 (tuple2!2609 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39747 res!62936) b!130498))

(assert (= (and b!130498 res!62937) b!130499))

(assert (=> d!39747 m!152235))

(declare-fun m!153815 () Bool)

(assert (=> d!39747 m!153815))

(declare-fun m!153817 () Bool)

(assert (=> d!39747 m!153817))

(declare-fun m!153819 () Bool)

(assert (=> b!130498 m!153819))

(declare-fun m!153821 () Bool)

(assert (=> b!130499 m!153821))

(assert (=> d!39291 d!39747))

(declare-fun call!14215 () List!1708)

(declare-fun e!85123 () List!1708)

(declare-fun c!24076 () Bool)

(declare-fun bm!14210 () Bool)

(assert (=> bm!14210 (= call!14215 ($colon$colon!91 e!85123 (ite c!24076 (h!2308 (toList!864 lt!67069)) (tuple2!2609 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!24073 () Bool)

(assert (=> bm!14210 (= c!24073 c!24076)))

(declare-fun b!130500 () Bool)

(declare-fun c!24074 () Bool)

(declare-fun c!24075 () Bool)

(assert (=> b!130500 (= e!85123 (ite c!24074 (t!6107 (toList!864 lt!67069)) (ite c!24075 (Cons!1704 (h!2308 (toList!864 lt!67069)) (t!6107 (toList!864 lt!67069))) Nil!1705)))))

(declare-fun b!130501 () Bool)

(declare-fun e!85124 () List!1708)

(declare-fun call!14214 () List!1708)

(assert (=> b!130501 (= e!85124 call!14214)))

(declare-fun b!130502 () Bool)

(declare-fun e!85126 () Bool)

(declare-fun lt!67897 () List!1708)

(assert (=> b!130502 (= e!85126 (contains!890 lt!67897 (tuple2!2609 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130503 () Bool)

(declare-fun res!62939 () Bool)

(assert (=> b!130503 (=> (not res!62939) (not e!85126))))

(assert (=> b!130503 (= res!62939 (containsKey!173 lt!67897 (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130504 () Bool)

(assert (=> b!130504 (= e!85124 call!14214)))

(declare-fun b!130505 () Bool)

(declare-fun e!85122 () List!1708)

(declare-fun call!14213 () List!1708)

(assert (=> b!130505 (= e!85122 call!14213)))

(declare-fun b!130506 () Bool)

(assert (=> b!130506 (= c!24075 (and ((_ is Cons!1704) (toList!864 lt!67069)) (bvsgt (_1!1315 (h!2308 (toList!864 lt!67069))) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> b!130506 (= e!85122 e!85124)))

(declare-fun bm!14212 () Bool)

(assert (=> bm!14212 (= call!14213 call!14215)))

(declare-fun b!130507 () Bool)

(declare-fun e!85125 () List!1708)

(assert (=> b!130507 (= e!85125 e!85122)))

(assert (=> b!130507 (= c!24074 (and ((_ is Cons!1704) (toList!864 lt!67069)) (= (_1!1315 (h!2308 (toList!864 lt!67069))) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun bm!14211 () Bool)

(assert (=> bm!14211 (= call!14214 call!14213)))

(declare-fun d!39749 () Bool)

(assert (=> d!39749 e!85126))

(declare-fun res!62938 () Bool)

(assert (=> d!39749 (=> (not res!62938) (not e!85126))))

(assert (=> d!39749 (= res!62938 (isStrictlySorted!319 lt!67897))))

(assert (=> d!39749 (= lt!67897 e!85125)))

(assert (=> d!39749 (= c!24076 (and ((_ is Cons!1704) (toList!864 lt!67069)) (bvslt (_1!1315 (h!2308 (toList!864 lt!67069))) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39749 (isStrictlySorted!319 (toList!864 lt!67069))))

(assert (=> d!39749 (= (insertStrictlySorted!87 (toList!864 lt!67069) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67897)))

(declare-fun b!130508 () Bool)

(assert (=> b!130508 (= e!85125 call!14215)))

(declare-fun b!130509 () Bool)

(assert (=> b!130509 (= e!85123 (insertStrictlySorted!87 (t!6107 (toList!864 lt!67069)) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (= (and d!39749 c!24076) b!130508))

(assert (= (and d!39749 (not c!24076)) b!130507))

(assert (= (and b!130507 c!24074) b!130505))

(assert (= (and b!130507 (not c!24074)) b!130506))

(assert (= (and b!130506 c!24075) b!130501))

(assert (= (and b!130506 (not c!24075)) b!130504))

(assert (= (or b!130501 b!130504) bm!14211))

(assert (= (or b!130505 bm!14211) bm!14212))

(assert (= (or b!130508 bm!14212) bm!14210))

(assert (= (and bm!14210 c!24073) b!130509))

(assert (= (and bm!14210 (not c!24073)) b!130500))

(assert (= (and d!39749 res!62938) b!130503))

(assert (= (and b!130503 res!62939) b!130502))

(declare-fun m!153823 () Bool)

(assert (=> b!130502 m!153823))

(declare-fun m!153825 () Bool)

(assert (=> b!130503 m!153825))

(declare-fun m!153827 () Bool)

(assert (=> b!130509 m!153827))

(declare-fun m!153829 () Bool)

(assert (=> bm!14210 m!153829))

(declare-fun m!153831 () Bool)

(assert (=> d!39749 m!153831))

(declare-fun m!153833 () Bool)

(assert (=> d!39749 m!153833))

(assert (=> d!39291 d!39749))

(declare-fun d!39751 () Bool)

(declare-fun e!85127 () Bool)

(assert (=> d!39751 e!85127))

(declare-fun res!62940 () Bool)

(assert (=> d!39751 (=> (not res!62940) (not e!85127))))

(declare-fun lt!67899 () ListLongMap!1697)

(assert (=> d!39751 (= res!62940 (contains!889 lt!67899 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(declare-fun lt!67900 () List!1708)

(assert (=> d!39751 (= lt!67899 (ListLongMap!1698 lt!67900))))

(declare-fun lt!67901 () Unit!4039)

(declare-fun lt!67898 () Unit!4039)

(assert (=> d!39751 (= lt!67901 lt!67898)))

(assert (=> d!39751 (= (getValueByKey!169 lt!67900 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(assert (=> d!39751 (= lt!67898 (lemmaContainsTupThenGetReturnValue!84 lt!67900 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(assert (=> d!39751 (= lt!67900 (insertStrictlySorted!87 (toList!864 call!14119) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))))))

(assert (=> d!39751 (= (+!172 call!14119 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))) lt!67899)))

(declare-fun b!130510 () Bool)

(declare-fun res!62941 () Bool)

(assert (=> b!130510 (=> (not res!62941) (not e!85127))))

(assert (=> b!130510 (= res!62941 (= (getValueByKey!169 (toList!864 lt!67899) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16)))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))))

(declare-fun b!130511 () Bool)

(assert (=> b!130511 (= e!85127 (contains!890 (toList!864 lt!67899) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 newMap!16))))))

(assert (= (and d!39751 res!62940) b!130510))

(assert (= (and b!130510 res!62941) b!130511))

(declare-fun m!153835 () Bool)

(assert (=> d!39751 m!153835))

(declare-fun m!153837 () Bool)

(assert (=> d!39751 m!153837))

(declare-fun m!153839 () Bool)

(assert (=> d!39751 m!153839))

(declare-fun m!153841 () Bool)

(assert (=> d!39751 m!153841))

(declare-fun m!153843 () Bool)

(assert (=> b!130510 m!153843))

(declare-fun m!153845 () Bool)

(assert (=> b!130511 m!153845))

(assert (=> b!129775 d!39751))

(assert (=> d!39327 d!39457))

(assert (=> b!129571 d!39261))

(declare-fun b!130514 () Bool)

(declare-fun e!85129 () Option!175)

(assert (=> b!130514 (= e!85129 (getValueByKey!169 (t!6107 (toList!864 lt!67195)) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130512 () Bool)

(declare-fun e!85128 () Option!175)

(assert (=> b!130512 (= e!85128 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67195)))))))

(declare-fun b!130513 () Bool)

(assert (=> b!130513 (= e!85128 e!85129)))

(declare-fun c!24078 () Bool)

(assert (=> b!130513 (= c!24078 (and ((_ is Cons!1704) (toList!864 lt!67195)) (not (= (_1!1315 (h!2308 (toList!864 lt!67195))) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!24077 () Bool)

(declare-fun d!39753 () Bool)

(assert (=> d!39753 (= c!24077 (and ((_ is Cons!1704) (toList!864 lt!67195)) (= (_1!1315 (h!2308 (toList!864 lt!67195))) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39753 (= (getValueByKey!169 (toList!864 lt!67195) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!85128)))

(declare-fun b!130515 () Bool)

(assert (=> b!130515 (= e!85129 None!173)))

(assert (= (and d!39753 c!24077) b!130512))

(assert (= (and d!39753 (not c!24077)) b!130513))

(assert (= (and b!130513 c!24078) b!130514))

(assert (= (and b!130513 (not c!24078)) b!130515))

(declare-fun m!153847 () Bool)

(assert (=> b!130514 m!153847))

(assert (=> b!129516 d!39753))

(declare-fun d!39755 () Bool)

(assert (=> d!39755 (= (get!1466 (getValueByKey!169 (toList!864 lt!67071) lt!67066)) (v!3165 (getValueByKey!169 (toList!864 lt!67071) lt!67066)))))

(assert (=> d!39295 d!39755))

(declare-fun b!130518 () Bool)

(declare-fun e!85131 () Option!175)

(assert (=> b!130518 (= e!85131 (getValueByKey!169 (t!6107 (toList!864 lt!67071)) lt!67066))))

(declare-fun b!130516 () Bool)

(declare-fun e!85130 () Option!175)

(assert (=> b!130516 (= e!85130 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67071)))))))

(declare-fun b!130517 () Bool)

(assert (=> b!130517 (= e!85130 e!85131)))

(declare-fun c!24080 () Bool)

(assert (=> b!130517 (= c!24080 (and ((_ is Cons!1704) (toList!864 lt!67071)) (not (= (_1!1315 (h!2308 (toList!864 lt!67071))) lt!67066))))))

(declare-fun d!39757 () Bool)

(declare-fun c!24079 () Bool)

(assert (=> d!39757 (= c!24079 (and ((_ is Cons!1704) (toList!864 lt!67071)) (= (_1!1315 (h!2308 (toList!864 lt!67071))) lt!67066)))))

(assert (=> d!39757 (= (getValueByKey!169 (toList!864 lt!67071) lt!67066) e!85130)))

(declare-fun b!130519 () Bool)

(assert (=> b!130519 (= e!85131 None!173)))

(assert (= (and d!39757 c!24079) b!130516))

(assert (= (and d!39757 (not c!24079)) b!130517))

(assert (= (and b!130517 c!24080) b!130518))

(assert (= (and b!130517 (not c!24080)) b!130519))

(declare-fun m!153849 () Bool)

(assert (=> b!130518 m!153849))

(assert (=> d!39295 d!39757))

(assert (=> b!129763 d!39357))

(declare-fun d!39759 () Bool)

(declare-fun e!85132 () Bool)

(assert (=> d!39759 e!85132))

(declare-fun res!62942 () Bool)

(assert (=> d!39759 (=> res!62942 e!85132)))

(declare-fun lt!67905 () Bool)

(assert (=> d!39759 (= res!62942 (not lt!67905))))

(declare-fun lt!67904 () Bool)

(assert (=> d!39759 (= lt!67905 lt!67904)))

(declare-fun lt!67903 () Unit!4039)

(declare-fun e!85133 () Unit!4039)

(assert (=> d!39759 (= lt!67903 e!85133)))

(declare-fun c!24081 () Bool)

(assert (=> d!39759 (= c!24081 lt!67904)))

(assert (=> d!39759 (= lt!67904 (containsKey!173 (toList!864 lt!67204) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39759 (= (contains!889 lt!67204 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67905)))

(declare-fun b!130520 () Bool)

(declare-fun lt!67902 () Unit!4039)

(assert (=> b!130520 (= e!85133 lt!67902)))

(assert (=> b!130520 (= lt!67902 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67204) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130520 (isDefined!122 (getValueByKey!169 (toList!864 lt!67204) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130521 () Bool)

(declare-fun Unit!4085 () Unit!4039)

(assert (=> b!130521 (= e!85133 Unit!4085)))

(declare-fun b!130522 () Bool)

(assert (=> b!130522 (= e!85132 (isDefined!122 (getValueByKey!169 (toList!864 lt!67204) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39759 c!24081) b!130520))

(assert (= (and d!39759 (not c!24081)) b!130521))

(assert (= (and d!39759 (not res!62942)) b!130522))

(declare-fun m!153851 () Bool)

(assert (=> d!39759 m!153851))

(declare-fun m!153853 () Bool)

(assert (=> b!130520 m!153853))

(assert (=> b!130520 m!153127))

(assert (=> b!130520 m!153127))

(declare-fun m!153855 () Bool)

(assert (=> b!130520 m!153855))

(assert (=> b!130522 m!153127))

(assert (=> b!130522 m!153127))

(assert (=> b!130522 m!153855))

(assert (=> bm!14078 d!39759))

(assert (=> b!129742 d!39357))

(assert (=> b!129681 d!39485))

(assert (=> b!129681 d!39487))

(declare-fun d!39761 () Bool)

(declare-fun lt!67906 () Bool)

(assert (=> d!39761 (= lt!67906 (select (content!129 (toList!864 lt!67185)) (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun e!85135 () Bool)

(assert (=> d!39761 (= lt!67906 e!85135)))

(declare-fun res!62943 () Bool)

(assert (=> d!39761 (=> (not res!62943) (not e!85135))))

(assert (=> d!39761 (= res!62943 ((_ is Cons!1704) (toList!864 lt!67185)))))

(assert (=> d!39761 (= (contains!890 (toList!864 lt!67185) (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67906)))

(declare-fun b!130523 () Bool)

(declare-fun e!85134 () Bool)

(assert (=> b!130523 (= e!85135 e!85134)))

(declare-fun res!62944 () Bool)

(assert (=> b!130523 (=> res!62944 e!85134)))

(assert (=> b!130523 (= res!62944 (= (h!2308 (toList!864 lt!67185)) (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130524 () Bool)

(assert (=> b!130524 (= e!85134 (contains!890 (t!6107 (toList!864 lt!67185)) (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (= (and d!39761 res!62943) b!130523))

(assert (= (and b!130523 (not res!62944)) b!130524))

(declare-fun m!153857 () Bool)

(assert (=> d!39761 m!153857))

(declare-fun m!153859 () Bool)

(assert (=> d!39761 m!153859))

(declare-fun m!153861 () Bool)

(assert (=> b!130524 m!153861))

(assert (=> b!129509 d!39761))

(declare-fun e!85137 () Option!175)

(declare-fun b!130527 () Bool)

(assert (=> b!130527 (= e!85137 (getValueByKey!169 (t!6107 (toList!864 lt!67389)) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130525 () Bool)

(declare-fun e!85136 () Option!175)

(assert (=> b!130525 (= e!85136 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67389)))))))

(declare-fun b!130526 () Bool)

(assert (=> b!130526 (= e!85136 e!85137)))

(declare-fun c!24083 () Bool)

(assert (=> b!130526 (= c!24083 (and ((_ is Cons!1704) (toList!864 lt!67389)) (not (= (_1!1315 (h!2308 (toList!864 lt!67389))) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun d!39763 () Bool)

(declare-fun c!24082 () Bool)

(assert (=> d!39763 (= c!24082 (and ((_ is Cons!1704) (toList!864 lt!67389)) (= (_1!1315 (h!2308 (toList!864 lt!67389))) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39763 (= (getValueByKey!169 (toList!864 lt!67389) (_1!1315 (tuple2!2609 lt!67064 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!85136)))

(declare-fun b!130528 () Bool)

(assert (=> b!130528 (= e!85137 None!173)))

(assert (= (and d!39763 c!24082) b!130525))

(assert (= (and d!39763 (not c!24082)) b!130526))

(assert (= (and b!130526 c!24083) b!130527))

(assert (= (and b!130526 (not c!24083)) b!130528))

(declare-fun m!153863 () Bool)

(assert (=> b!130527 m!153863))

(assert (=> b!129716 d!39763))

(declare-fun b!130531 () Bool)

(declare-fun e!85139 () Option!175)

(assert (=> b!130531 (= e!85139 (getValueByKey!169 (t!6107 (toList!864 lt!67396)) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130529 () Bool)

(declare-fun e!85138 () Option!175)

(assert (=> b!130529 (= e!85138 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67396)))))))

(declare-fun b!130530 () Bool)

(assert (=> b!130530 (= e!85138 e!85139)))

(declare-fun c!24085 () Bool)

(assert (=> b!130530 (= c!24085 (and ((_ is Cons!1704) (toList!864 lt!67396)) (not (= (_1!1315 (h!2308 (toList!864 lt!67396))) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun d!39765 () Bool)

(declare-fun c!24084 () Bool)

(assert (=> d!39765 (= c!24084 (and ((_ is Cons!1704) (toList!864 lt!67396)) (= (_1!1315 (h!2308 (toList!864 lt!67396))) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39765 (= (getValueByKey!169 (toList!864 lt!67396) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!85138)))

(declare-fun b!130532 () Bool)

(assert (=> b!130532 (= e!85139 None!173)))

(assert (= (and d!39765 c!24084) b!130529))

(assert (= (and d!39765 (not c!24084)) b!130530))

(assert (= (and b!130530 c!24085) b!130531))

(assert (= (and b!130530 (not c!24085)) b!130532))

(declare-fun m!153865 () Bool)

(assert (=> b!130531 m!153865))

(assert (=> b!129718 d!39765))

(assert (=> b!129656 d!39243))

(declare-fun b!130535 () Bool)

(declare-fun e!85141 () Option!175)

(assert (=> b!130535 (= e!85141 (getValueByKey!169 (t!6107 (t!6107 (toList!864 lt!67005))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!130533 () Bool)

(declare-fun e!85140 () Option!175)

(assert (=> b!130533 (= e!85140 (Some!174 (_2!1315 (h!2308 (t!6107 (toList!864 lt!67005))))))))

(declare-fun b!130534 () Bool)

(assert (=> b!130534 (= e!85140 e!85141)))

(declare-fun c!24087 () Bool)

(assert (=> b!130534 (= c!24087 (and ((_ is Cons!1704) (t!6107 (toList!864 lt!67005))) (not (= (_1!1315 (h!2308 (t!6107 (toList!864 lt!67005)))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))))

(declare-fun d!39767 () Bool)

(declare-fun c!24086 () Bool)

(assert (=> d!39767 (= c!24086 (and ((_ is Cons!1704) (t!6107 (toList!864 lt!67005))) (= (_1!1315 (h!2308 (t!6107 (toList!864 lt!67005)))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39767 (= (getValueByKey!169 (t!6107 (toList!864 lt!67005)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) e!85140)))

(declare-fun b!130536 () Bool)

(assert (=> b!130536 (= e!85141 None!173)))

(assert (= (and d!39767 c!24086) b!130533))

(assert (= (and d!39767 (not c!24086)) b!130534))

(assert (= (and b!130534 c!24087) b!130535))

(assert (= (and b!130534 (not c!24087)) b!130536))

(assert (=> b!130535 m!151769))

(declare-fun m!153867 () Bool)

(assert (=> b!130535 m!153867))

(assert (=> b!129695 d!39767))

(declare-fun b!130537 () Bool)

(declare-fun e!85144 () Bool)

(assert (=> b!130537 (= e!85144 (contains!891 Nil!1706 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!130538 () Bool)

(declare-fun e!85143 () Bool)

(declare-fun e!85142 () Bool)

(assert (=> b!130538 (= e!85143 e!85142)))

(declare-fun c!24088 () Bool)

(assert (=> b!130538 (= c!24088 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!39769 () Bool)

(declare-fun res!62947 () Bool)

(declare-fun e!85145 () Bool)

(assert (=> d!39769 (=> res!62947 e!85145)))

(assert (=> d!39769 (= res!62947 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> d!39769 (= (arrayNoDuplicates!0 (_keys!4565 (v!3162 (underlying!448 thiss!992))) #b00000000000000000000000000000000 Nil!1706) e!85145)))

(declare-fun b!130539 () Bool)

(declare-fun call!14216 () Bool)

(assert (=> b!130539 (= e!85142 call!14216)))

(declare-fun b!130540 () Bool)

(assert (=> b!130540 (= e!85145 e!85143)))

(declare-fun res!62946 () Bool)

(assert (=> b!130540 (=> (not res!62946) (not e!85143))))

(assert (=> b!130540 (= res!62946 (not e!85144))))

(declare-fun res!62945 () Bool)

(assert (=> b!130540 (=> (not res!62945) (not e!85144))))

(assert (=> b!130540 (= res!62945 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!14213 () Bool)

(assert (=> bm!14213 (= call!14216 (arrayNoDuplicates!0 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!24088 (Cons!1705 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) Nil!1706) Nil!1706)))))

(declare-fun b!130541 () Bool)

(assert (=> b!130541 (= e!85142 call!14216)))

(assert (= (and d!39769 (not res!62947)) b!130540))

(assert (= (and b!130540 res!62945) b!130537))

(assert (= (and b!130540 res!62946) b!130538))

(assert (= (and b!130538 c!24088) b!130539))

(assert (= (and b!130538 (not c!24088)) b!130541))

(assert (= (or b!130539 b!130541) bm!14213))

(assert (=> b!130537 m!153045))

(assert (=> b!130537 m!153045))

(declare-fun m!153869 () Bool)

(assert (=> b!130537 m!153869))

(assert (=> b!130538 m!153045))

(assert (=> b!130538 m!153045))

(assert (=> b!130538 m!153047))

(assert (=> b!130540 m!153045))

(assert (=> b!130540 m!153045))

(assert (=> b!130540 m!153047))

(assert (=> bm!14213 m!153045))

(declare-fun m!153871 () Bool)

(assert (=> bm!14213 m!153871))

(assert (=> b!129607 d!39769))

(declare-fun e!85147 () Option!175)

(declare-fun b!130544 () Bool)

(assert (=> b!130544 (= e!85147 (getValueByKey!169 (t!6107 (toList!864 lt!67368)) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130542 () Bool)

(declare-fun e!85146 () Option!175)

(assert (=> b!130542 (= e!85146 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67368)))))))

(declare-fun b!130543 () Bool)

(assert (=> b!130543 (= e!85146 e!85147)))

(declare-fun c!24090 () Bool)

(assert (=> b!130543 (= c!24090 (and ((_ is Cons!1704) (toList!864 lt!67368)) (not (= (_1!1315 (h!2308 (toList!864 lt!67368))) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!24089 () Bool)

(declare-fun d!39771 () Bool)

(assert (=> d!39771 (= c!24089 (and ((_ is Cons!1704) (toList!864 lt!67368)) (= (_1!1315 (h!2308 (toList!864 lt!67368))) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39771 (= (getValueByKey!169 (toList!864 lt!67368) (_1!1315 (tuple2!2609 lt!67072 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!85146)))

(declare-fun b!130545 () Bool)

(assert (=> b!130545 (= e!85147 None!173)))

(assert (= (and d!39771 c!24089) b!130542))

(assert (= (and d!39771 (not c!24089)) b!130543))

(assert (= (and b!130543 c!24090) b!130544))

(assert (= (and b!130543 (not c!24090)) b!130545))

(declare-fun m!153873 () Bool)

(assert (=> b!130544 m!153873))

(assert (=> b!129704 d!39771))

(declare-fun b!130546 () Bool)

(declare-fun e!85148 () Bool)

(declare-fun e!85149 () Bool)

(assert (=> b!130546 (= e!85148 e!85149)))

(declare-fun c!24091 () Bool)

(assert (=> b!130546 (= c!24091 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000)))))

(declare-fun d!39773 () Bool)

(declare-fun res!62948 () Bool)

(assert (=> d!39773 (=> res!62948 e!85148)))

(assert (=> d!39773 (= res!62948 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 (_2!1316 lt!67159)))))))

(assert (=> d!39773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4565 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159))) e!85148)))

(declare-fun b!130547 () Bool)

(declare-fun e!85150 () Bool)

(declare-fun call!14217 () Bool)

(assert (=> b!130547 (= e!85150 call!14217)))

(declare-fun bm!14214 () Bool)

(assert (=> bm!14214 (= call!14217 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4565 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159))))))

(declare-fun b!130548 () Bool)

(assert (=> b!130548 (= e!85149 e!85150)))

(declare-fun lt!67907 () (_ BitVec 64))

(assert (=> b!130548 (= lt!67907 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000))))

(declare-fun lt!67908 () Unit!4039)

(assert (=> b!130548 (= lt!67908 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4565 (_2!1316 lt!67159)) lt!67907 #b00000000000000000000000000000000))))

(assert (=> b!130548 (arrayContainsKey!0 (_keys!4565 (_2!1316 lt!67159)) lt!67907 #b00000000000000000000000000000000)))

(declare-fun lt!67909 () Unit!4039)

(assert (=> b!130548 (= lt!67909 lt!67908)))

(declare-fun res!62949 () Bool)

(assert (=> b!130548 (= res!62949 (= (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (_2!1316 lt!67159))) #b00000000000000000000000000000000) (_keys!4565 (_2!1316 lt!67159)) (mask!7102 (_2!1316 lt!67159))) (Found!272 #b00000000000000000000000000000000)))))

(assert (=> b!130548 (=> (not res!62949) (not e!85150))))

(declare-fun b!130549 () Bool)

(assert (=> b!130549 (= e!85149 call!14217)))

(assert (= (and d!39773 (not res!62948)) b!130546))

(assert (= (and b!130546 c!24091) b!130548))

(assert (= (and b!130546 (not c!24091)) b!130549))

(assert (= (and b!130548 res!62949) b!130547))

(assert (= (or b!130547 b!130549) bm!14214))

(assert (=> b!130546 m!152513))

(assert (=> b!130546 m!152513))

(assert (=> b!130546 m!152515))

(declare-fun m!153875 () Bool)

(assert (=> bm!14214 m!153875))

(assert (=> b!130548 m!152513))

(declare-fun m!153877 () Bool)

(assert (=> b!130548 m!153877))

(declare-fun m!153879 () Bool)

(assert (=> b!130548 m!153879))

(assert (=> b!130548 m!152513))

(declare-fun m!153881 () Bool)

(assert (=> b!130548 m!153881))

(assert (=> b!129603 d!39773))

(declare-fun d!39775 () Bool)

(assert (=> d!39775 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!67910 () Unit!4039)

(assert (=> d!39775 (= lt!67910 (choose!789 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85151 () Bool)

(assert (=> d!39775 e!85151))

(declare-fun res!62950 () Bool)

(assert (=> d!39775 (=> (not res!62950) (not e!85151))))

(assert (=> d!39775 (= res!62950 (isStrictlySorted!319 (toList!864 lt!67067)))))

(assert (=> d!39775 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000) lt!67910)))

(declare-fun b!130550 () Bool)

(assert (=> b!130550 (= e!85151 (containsKey!173 (toList!864 lt!67067) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39775 res!62950) b!130550))

(assert (=> d!39775 m!152111))

(assert (=> d!39775 m!152111))

(assert (=> d!39775 m!152347))

(declare-fun m!153883 () Bool)

(assert (=> d!39775 m!153883))

(assert (=> d!39775 m!153021))

(assert (=> b!130550 m!152343))

(assert (=> b!129720 d!39775))

(assert (=> b!129720 d!39549))

(assert (=> b!129720 d!39495))

(declare-fun d!39777 () Bool)

(declare-fun e!85152 () Bool)

(assert (=> d!39777 e!85152))

(declare-fun res!62951 () Bool)

(assert (=> d!39777 (=> res!62951 e!85152)))

(declare-fun lt!67914 () Bool)

(assert (=> d!39777 (= res!62951 (not lt!67914))))

(declare-fun lt!67913 () Bool)

(assert (=> d!39777 (= lt!67914 lt!67913)))

(declare-fun lt!67912 () Unit!4039)

(declare-fun e!85153 () Unit!4039)

(assert (=> d!39777 (= lt!67912 e!85153)))

(declare-fun c!24092 () Bool)

(assert (=> d!39777 (= c!24092 lt!67913)))

(assert (=> d!39777 (= lt!67913 (containsKey!173 (toList!864 (map!1398 (_2!1316 lt!67334))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> d!39777 (= (contains!889 (map!1398 (_2!1316 lt!67334)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) lt!67914)))

(declare-fun b!130551 () Bool)

(declare-fun lt!67911 () Unit!4039)

(assert (=> b!130551 (= e!85153 lt!67911)))

(assert (=> b!130551 (= lt!67911 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 (map!1398 (_2!1316 lt!67334))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (=> b!130551 (isDefined!122 (getValueByKey!169 (toList!864 (map!1398 (_2!1316 lt!67334))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(declare-fun b!130552 () Bool)

(declare-fun Unit!4086 () Unit!4039)

(assert (=> b!130552 (= e!85153 Unit!4086)))

(declare-fun b!130553 () Bool)

(assert (=> b!130553 (= e!85152 (isDefined!122 (getValueByKey!169 (toList!864 (map!1398 (_2!1316 lt!67334))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (= (and d!39777 c!24092) b!130551))

(assert (= (and d!39777 (not c!24092)) b!130552))

(assert (= (and d!39777 (not res!62951)) b!130553))

(assert (=> d!39777 m!151769))

(declare-fun m!153885 () Bool)

(assert (=> d!39777 m!153885))

(assert (=> b!130551 m!151769))

(declare-fun m!153887 () Bool)

(assert (=> b!130551 m!153887))

(assert (=> b!130551 m!151769))

(declare-fun m!153889 () Bool)

(assert (=> b!130551 m!153889))

(assert (=> b!130551 m!153889))

(declare-fun m!153891 () Bool)

(assert (=> b!130551 m!153891))

(assert (=> b!130553 m!151769))

(assert (=> b!130553 m!153889))

(assert (=> b!130553 m!153889))

(assert (=> b!130553 m!153891))

(assert (=> b!129658 d!39777))

(declare-fun d!39779 () Bool)

(assert (=> d!39779 (= (map!1398 (_2!1316 lt!67334)) (getCurrentListMap!541 (_keys!4565 (_2!1316 lt!67334)) (_values!2807 (_2!1316 lt!67334)) (mask!7102 (_2!1316 lt!67334)) (extraKeys!2597 (_2!1316 lt!67334)) (zeroValue!2683 (_2!1316 lt!67334)) (minValue!2683 (_2!1316 lt!67334)) #b00000000000000000000000000000000 (defaultEntry!2824 (_2!1316 lt!67334))))))

(declare-fun bs!5425 () Bool)

(assert (= bs!5425 d!39779))

(declare-fun m!153893 () Bool)

(assert (=> bs!5425 m!153893))

(assert (=> b!129658 d!39779))

(declare-fun lt!67915 () Bool)

(declare-fun d!39781 () Bool)

(assert (=> d!39781 (= lt!67915 (select (content!129 (toList!864 lt!67372)) (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun e!85155 () Bool)

(assert (=> d!39781 (= lt!67915 e!85155)))

(declare-fun res!62952 () Bool)

(assert (=> d!39781 (=> (not res!62952) (not e!85155))))

(assert (=> d!39781 (= res!62952 ((_ is Cons!1704) (toList!864 lt!67372)))))

(assert (=> d!39781 (= (contains!890 (toList!864 lt!67372) (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67915)))

(declare-fun b!130554 () Bool)

(declare-fun e!85154 () Bool)

(assert (=> b!130554 (= e!85155 e!85154)))

(declare-fun res!62953 () Bool)

(assert (=> b!130554 (=> res!62953 e!85154)))

(assert (=> b!130554 (= res!62953 (= (h!2308 (toList!864 lt!67372)) (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(declare-fun b!130555 () Bool)

(assert (=> b!130555 (= e!85154 (contains!890 (t!6107 (toList!864 lt!67372)) (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))

(assert (= (and d!39781 res!62952) b!130554))

(assert (= (and b!130554 (not res!62953)) b!130555))

(declare-fun m!153895 () Bool)

(assert (=> d!39781 m!153895))

(declare-fun m!153897 () Bool)

(assert (=> d!39781 m!153897))

(declare-fun m!153899 () Bool)

(assert (=> b!130555 m!153899))

(assert (=> b!129707 d!39781))

(assert (=> bm!14117 d!39679))

(declare-fun d!39783 () Bool)

(declare-fun e!85156 () Bool)

(assert (=> d!39783 e!85156))

(declare-fun res!62954 () Bool)

(assert (=> d!39783 (=> (not res!62954) (not e!85156))))

(declare-fun lt!67917 () ListLongMap!1697)

(assert (=> d!39783 (= res!62954 (contains!889 lt!67917 (_1!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))))

(declare-fun lt!67918 () List!1708)

(assert (=> d!39783 (= lt!67917 (ListLongMap!1698 lt!67918))))

(declare-fun lt!67919 () Unit!4039)

(declare-fun lt!67916 () Unit!4039)

(assert (=> d!39783 (= lt!67919 lt!67916)))

(assert (=> d!39783 (= (getValueByKey!169 lt!67918 (_1!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))) (Some!174 (_2!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))))

(assert (=> d!39783 (= lt!67916 (lemmaContainsTupThenGetReturnValue!84 lt!67918 (_1!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) (_2!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))))

(assert (=> d!39783 (= lt!67918 (insertStrictlySorted!87 (toList!864 (ite c!23810 call!14079 (ite c!23811 call!14080 call!14082))) (_1!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) (_2!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))))

(assert (=> d!39783 (= (+!172 (ite c!23810 call!14079 (ite c!23811 call!14080 call!14082)) (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) lt!67917)))

(declare-fun b!130556 () Bool)

(declare-fun res!62955 () Bool)

(assert (=> b!130556 (=> (not res!62955) (not e!85156))))

(assert (=> b!130556 (= res!62955 (= (getValueByKey!169 (toList!864 lt!67917) (_1!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))) (Some!174 (_2!1315 (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))))

(declare-fun b!130557 () Bool)

(assert (=> b!130557 (= e!85156 (contains!890 (toList!864 lt!67917) (ite (or c!23810 c!23811) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23800 c!23802) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2683 newMap!16))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (= (and d!39783 res!62954) b!130556))

(assert (= (and b!130556 res!62955) b!130557))

(declare-fun m!153901 () Bool)

(assert (=> d!39783 m!153901))

(declare-fun m!153903 () Bool)

(assert (=> d!39783 m!153903))

(declare-fun m!153905 () Bool)

(assert (=> d!39783 m!153905))

(declare-fun m!153907 () Bool)

(assert (=> d!39783 m!153907))

(declare-fun m!153909 () Bool)

(assert (=> b!130556 m!153909))

(declare-fun m!153911 () Bool)

(assert (=> b!130557 m!153911))

(assert (=> bm!14080 d!39783))

(declare-fun d!39785 () Bool)

(declare-fun e!85157 () Bool)

(assert (=> d!39785 e!85157))

(declare-fun res!62956 () Bool)

(assert (=> d!39785 (=> res!62956 e!85157)))

(declare-fun lt!67923 () Bool)

(assert (=> d!39785 (= res!62956 (not lt!67923))))

(declare-fun lt!67922 () Bool)

(assert (=> d!39785 (= lt!67923 lt!67922)))

(declare-fun lt!67921 () Unit!4039)

(declare-fun e!85158 () Unit!4039)

(assert (=> d!39785 (= lt!67921 e!85158)))

(declare-fun c!24093 () Bool)

(assert (=> d!39785 (= c!24093 lt!67922)))

(assert (=> d!39785 (= lt!67922 (containsKey!173 (toList!864 lt!67071) lt!67066))))

(assert (=> d!39785 (= (contains!889 lt!67071 lt!67066) lt!67923)))

(declare-fun b!130558 () Bool)

(declare-fun lt!67920 () Unit!4039)

(assert (=> b!130558 (= e!85158 lt!67920)))

(assert (=> b!130558 (= lt!67920 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67071) lt!67066))))

(assert (=> b!130558 (isDefined!122 (getValueByKey!169 (toList!864 lt!67071) lt!67066))))

(declare-fun b!130559 () Bool)

(declare-fun Unit!4087 () Unit!4039)

(assert (=> b!130559 (= e!85158 Unit!4087)))

(declare-fun b!130560 () Bool)

(assert (=> b!130560 (= e!85157 (isDefined!122 (getValueByKey!169 (toList!864 lt!67071) lt!67066)))))

(assert (= (and d!39785 c!24093) b!130558))

(assert (= (and d!39785 (not c!24093)) b!130559))

(assert (= (and d!39785 (not res!62956)) b!130560))

(declare-fun m!153913 () Bool)

(assert (=> d!39785 m!153913))

(declare-fun m!153915 () Bool)

(assert (=> b!130558 m!153915))

(assert (=> b!130558 m!152257))

(assert (=> b!130558 m!152257))

(declare-fun m!153917 () Bool)

(assert (=> b!130558 m!153917))

(assert (=> b!130560 m!152257))

(assert (=> b!130560 m!152257))

(assert (=> b!130560 m!153917))

(assert (=> d!39297 d!39785))

(assert (=> d!39297 d!39293))

(assert (=> d!39297 d!39295))

(assert (=> d!39297 d!39305))

(declare-fun d!39787 () Bool)

(assert (=> d!39787 (= (apply!113 (+!172 lt!67071 (tuple2!2609 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))))) lt!67066) (apply!113 lt!67071 lt!67066))))

(assert (=> d!39787 true))

(declare-fun _$34!968 () Unit!4039)

(assert (=> d!39787 (= (choose!790 lt!67071 lt!67080 (minValue!2683 (v!3162 (underlying!448 thiss!992))) lt!67066) _$34!968)))

(declare-fun bs!5426 () Bool)

(assert (= bs!5426 d!39787))

(assert (=> bs!5426 m!151875))

(assert (=> bs!5426 m!151875))

(assert (=> bs!5426 m!151891))

(assert (=> bs!5426 m!151885))

(assert (=> d!39297 d!39787))

(declare-fun d!39789 () Bool)

(declare-fun e!85159 () Bool)

(assert (=> d!39789 e!85159))

(declare-fun res!62957 () Bool)

(assert (=> d!39789 (=> res!62957 e!85159)))

(declare-fun lt!67927 () Bool)

(assert (=> d!39789 (= res!62957 (not lt!67927))))

(declare-fun lt!67926 () Bool)

(assert (=> d!39789 (= lt!67927 lt!67926)))

(declare-fun lt!67925 () Unit!4039)

(declare-fun e!85160 () Unit!4039)

(assert (=> d!39789 (= lt!67925 e!85160)))

(declare-fun c!24094 () Bool)

(assert (=> d!39789 (= c!24094 lt!67926)))

(assert (=> d!39789 (= lt!67926 (containsKey!173 (toList!864 lt!67240) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39789 (= (contains!889 lt!67240 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67927)))

(declare-fun b!130561 () Bool)

(declare-fun lt!67924 () Unit!4039)

(assert (=> b!130561 (= e!85160 lt!67924)))

(assert (=> b!130561 (= lt!67924 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67240) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130561 (isDefined!122 (getValueByKey!169 (toList!864 lt!67240) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130562 () Bool)

(declare-fun Unit!4088 () Unit!4039)

(assert (=> b!130562 (= e!85160 Unit!4088)))

(declare-fun b!130563 () Bool)

(assert (=> b!130563 (= e!85159 (isDefined!122 (getValueByKey!169 (toList!864 lt!67240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39789 c!24094) b!130561))

(assert (= (and d!39789 (not c!24094)) b!130562))

(assert (= (and d!39789 (not res!62957)) b!130563))

(declare-fun m!153919 () Bool)

(assert (=> d!39789 m!153919))

(declare-fun m!153921 () Bool)

(assert (=> b!130561 m!153921))

(declare-fun m!153923 () Bool)

(assert (=> b!130561 m!153923))

(assert (=> b!130561 m!153923))

(declare-fun m!153925 () Bool)

(assert (=> b!130561 m!153925))

(assert (=> b!130563 m!153923))

(assert (=> b!130563 m!153923))

(assert (=> b!130563 m!153925))

(assert (=> b!129566 d!39789))

(declare-fun e!85162 () Option!175)

(declare-fun b!130566 () Bool)

(assert (=> b!130566 (= e!85162 (getValueByKey!169 (t!6107 (toList!864 lt!67377)) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130564 () Bool)

(declare-fun e!85161 () Option!175)

(assert (=> b!130564 (= e!85161 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67377)))))))

(declare-fun b!130565 () Bool)

(assert (=> b!130565 (= e!85161 e!85162)))

(declare-fun c!24096 () Bool)

(assert (=> b!130565 (= c!24096 (and ((_ is Cons!1704) (toList!864 lt!67377)) (not (= (_1!1315 (h!2308 (toList!864 lt!67377))) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!24095 () Bool)

(declare-fun d!39791 () Bool)

(assert (=> d!39791 (= c!24095 (and ((_ is Cons!1704) (toList!864 lt!67377)) (= (_1!1315 (h!2308 (toList!864 lt!67377))) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39791 (= (getValueByKey!169 (toList!864 lt!67377) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!85161)))

(declare-fun b!130567 () Bool)

(assert (=> b!130567 (= e!85162 None!173)))

(assert (= (and d!39791 c!24095) b!130564))

(assert (= (and d!39791 (not c!24095)) b!130565))

(assert (= (and b!130565 c!24096) b!130566))

(assert (= (and b!130565 (not c!24096)) b!130567))

(declare-fun m!153927 () Bool)

(assert (=> b!130566 m!153927))

(assert (=> b!129709 d!39791))

(declare-fun d!39793 () Bool)

(assert (=> d!39793 (= (apply!113 lt!67434 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!864 lt!67434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5427 () Bool)

(assert (= bs!5427 d!39793))

(assert (=> bs!5427 m!153053))

(assert (=> bs!5427 m!153053))

(declare-fun m!153929 () Bool)

(assert (=> bs!5427 m!153929))

(assert (=> b!129771 d!39793))

(declare-fun d!39795 () Bool)

(declare-fun res!62958 () Bool)

(declare-fun e!85163 () Bool)

(assert (=> d!39795 (=> res!62958 e!85163)))

(assert (=> d!39795 (= res!62958 (and ((_ is Cons!1704) (t!6107 (toList!864 lt!67005))) (= (_1!1315 (h!2308 (t!6107 (toList!864 lt!67005)))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39795 (= (containsKey!173 (t!6107 (toList!864 lt!67005)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) e!85163)))

(declare-fun b!130568 () Bool)

(declare-fun e!85164 () Bool)

(assert (=> b!130568 (= e!85163 e!85164)))

(declare-fun res!62959 () Bool)

(assert (=> b!130568 (=> (not res!62959) (not e!85164))))

(assert (=> b!130568 (= res!62959 (and (or (not ((_ is Cons!1704) (t!6107 (toList!864 lt!67005)))) (bvsle (_1!1315 (h!2308 (t!6107 (toList!864 lt!67005)))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))) ((_ is Cons!1704) (t!6107 (toList!864 lt!67005))) (bvslt (_1!1315 (h!2308 (t!6107 (toList!864 lt!67005)))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(declare-fun b!130569 () Bool)

(assert (=> b!130569 (= e!85164 (containsKey!173 (t!6107 (t!6107 (toList!864 lt!67005))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39795 (not res!62958)) b!130568))

(assert (= (and b!130568 res!62959) b!130569))

(assert (=> b!130569 m!151769))

(declare-fun m!153931 () Bool)

(assert (=> b!130569 m!153931))

(assert (=> b!129503 d!39795))

(declare-fun d!39797 () Bool)

(assert (=> d!39797 (= (apply!113 lt!67412 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!864 lt!67412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5428 () Bool)

(assert (= bs!5428 d!39797))

(assert (=> bs!5428 m!153031))

(assert (=> bs!5428 m!153031))

(declare-fun m!153933 () Bool)

(assert (=> bs!5428 m!153933))

(assert (=> b!129750 d!39797))

(declare-fun d!39799 () Bool)

(declare-fun e!85165 () Bool)

(assert (=> d!39799 e!85165))

(declare-fun res!62960 () Bool)

(assert (=> d!39799 (=> res!62960 e!85165)))

(declare-fun lt!67931 () Bool)

(assert (=> d!39799 (= res!62960 (not lt!67931))))

(declare-fun lt!67930 () Bool)

(assert (=> d!39799 (= lt!67931 lt!67930)))

(declare-fun lt!67929 () Unit!4039)

(declare-fun e!85166 () Unit!4039)

(assert (=> d!39799 (= lt!67929 e!85166)))

(declare-fun c!24097 () Bool)

(assert (=> d!39799 (= c!24097 lt!67930)))

(assert (=> d!39799 (= lt!67930 (containsKey!173 (toList!864 lt!67185) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39799 (= (contains!889 lt!67185 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) lt!67931)))

(declare-fun b!130570 () Bool)

(declare-fun lt!67928 () Unit!4039)

(assert (=> b!130570 (= e!85166 lt!67928)))

(assert (=> b!130570 (= lt!67928 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67185) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> b!130570 (isDefined!122 (getValueByKey!169 (toList!864 lt!67185) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130571 () Bool)

(declare-fun Unit!4089 () Unit!4039)

(assert (=> b!130571 (= e!85166 Unit!4089)))

(declare-fun b!130572 () Bool)

(assert (=> b!130572 (= e!85165 (isDefined!122 (getValueByKey!169 (toList!864 lt!67185) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(assert (= (and d!39799 c!24097) b!130570))

(assert (= (and d!39799 (not c!24097)) b!130571))

(assert (= (and d!39799 (not res!62960)) b!130572))

(declare-fun m!153935 () Bool)

(assert (=> d!39799 m!153935))

(declare-fun m!153937 () Bool)

(assert (=> b!130570 m!153937))

(assert (=> b!130570 m!151977))

(assert (=> b!130570 m!151977))

(declare-fun m!153939 () Bool)

(assert (=> b!130570 m!153939))

(assert (=> b!130572 m!151977))

(assert (=> b!130572 m!151977))

(assert (=> b!130572 m!153939))

(assert (=> d!39241 d!39799))

(declare-fun e!85168 () Option!175)

(declare-fun b!130575 () Bool)

(assert (=> b!130575 (= e!85168 (getValueByKey!169 (t!6107 lt!67186) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130573 () Bool)

(declare-fun e!85167 () Option!175)

(assert (=> b!130573 (= e!85167 (Some!174 (_2!1315 (h!2308 lt!67186))))))

(declare-fun b!130574 () Bool)

(assert (=> b!130574 (= e!85167 e!85168)))

(declare-fun c!24099 () Bool)

(assert (=> b!130574 (= c!24099 (and ((_ is Cons!1704) lt!67186) (not (= (_1!1315 (h!2308 lt!67186)) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))))

(declare-fun d!39801 () Bool)

(declare-fun c!24098 () Bool)

(assert (=> d!39801 (= c!24098 (and ((_ is Cons!1704) lt!67186) (= (_1!1315 (h!2308 lt!67186)) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(assert (=> d!39801 (= (getValueByKey!169 lt!67186 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) e!85167)))

(declare-fun b!130576 () Bool)

(assert (=> b!130576 (= e!85168 None!173)))

(assert (= (and d!39801 c!24098) b!130573))

(assert (= (and d!39801 (not c!24098)) b!130574))

(assert (= (and b!130574 c!24099) b!130575))

(assert (= (and b!130574 (not c!24099)) b!130576))

(declare-fun m!153941 () Bool)

(assert (=> b!130575 m!153941))

(assert (=> d!39241 d!39801))

(declare-fun d!39803 () Bool)

(assert (=> d!39803 (= (getValueByKey!169 lt!67186 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) (Some!174 (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun lt!67932 () Unit!4039)

(assert (=> d!39803 (= lt!67932 (choose!796 lt!67186 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun e!85169 () Bool)

(assert (=> d!39803 e!85169))

(declare-fun res!62961 () Bool)

(assert (=> d!39803 (=> (not res!62961) (not e!85169))))

(assert (=> d!39803 (= res!62961 (isStrictlySorted!319 lt!67186))))

(assert (=> d!39803 (= (lemmaContainsTupThenGetReturnValue!84 lt!67186 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) lt!67932)))

(declare-fun b!130577 () Bool)

(declare-fun res!62962 () Bool)

(assert (=> b!130577 (=> (not res!62962) (not e!85169))))

(assert (=> b!130577 (= res!62962 (containsKey!173 lt!67186 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130578 () Bool)

(assert (=> b!130578 (= e!85169 (contains!890 lt!67186 (tuple2!2609 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(assert (= (and d!39803 res!62961) b!130577))

(assert (= (and b!130577 res!62962) b!130578))

(assert (=> d!39803 m!151971))

(declare-fun m!153943 () Bool)

(assert (=> d!39803 m!153943))

(declare-fun m!153945 () Bool)

(assert (=> d!39803 m!153945))

(declare-fun m!153947 () Bool)

(assert (=> b!130577 m!153947))

(declare-fun m!153949 () Bool)

(assert (=> b!130578 m!153949))

(assert (=> d!39241 d!39803))

(declare-fun e!85171 () List!1708)

(declare-fun call!14220 () List!1708)

(declare-fun c!24103 () Bool)

(declare-fun bm!14215 () Bool)

(assert (=> bm!14215 (= call!14220 ($colon$colon!91 e!85171 (ite c!24103 (h!2308 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)))) (tuple2!2609 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))))

(declare-fun c!24100 () Bool)

(assert (=> bm!14215 (= c!24100 c!24103)))

(declare-fun c!24102 () Bool)

(declare-fun b!130579 () Bool)

(declare-fun c!24101 () Bool)

(assert (=> b!130579 (= e!85171 (ite c!24101 (t!6107 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)))) (ite c!24102 (Cons!1704 (h!2308 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)))) (t!6107 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003))))) Nil!1705)))))

(declare-fun b!130580 () Bool)

(declare-fun e!85172 () List!1708)

(declare-fun call!14219 () List!1708)

(assert (=> b!130580 (= e!85172 call!14219)))

(declare-fun lt!67933 () List!1708)

(declare-fun e!85174 () Bool)

(declare-fun b!130581 () Bool)

(assert (=> b!130581 (= e!85174 (contains!890 lt!67933 (tuple2!2609 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun b!130582 () Bool)

(declare-fun res!62964 () Bool)

(assert (=> b!130582 (=> (not res!62964) (not e!85174))))

(assert (=> b!130582 (= res!62964 (containsKey!173 lt!67933 (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130583 () Bool)

(assert (=> b!130583 (= e!85172 call!14219)))

(declare-fun b!130584 () Bool)

(declare-fun e!85170 () List!1708)

(declare-fun call!14218 () List!1708)

(assert (=> b!130584 (= e!85170 call!14218)))

(declare-fun b!130585 () Bool)

(assert (=> b!130585 (= c!24102 (and ((_ is Cons!1704) (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)))) (bvsgt (_1!1315 (h!2308 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003))))) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(assert (=> b!130585 (= e!85170 e!85172)))

(declare-fun bm!14217 () Bool)

(assert (=> bm!14217 (= call!14218 call!14220)))

(declare-fun b!130586 () Bool)

(declare-fun e!85173 () List!1708)

(assert (=> b!130586 (= e!85173 e!85170)))

(assert (=> b!130586 (= c!24101 (and ((_ is Cons!1704) (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)))) (= (_1!1315 (h!2308 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003))))) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun bm!14216 () Bool)

(assert (=> bm!14216 (= call!14219 call!14218)))

(declare-fun d!39805 () Bool)

(assert (=> d!39805 e!85174))

(declare-fun res!62963 () Bool)

(assert (=> d!39805 (=> (not res!62963) (not e!85174))))

(assert (=> d!39805 (= res!62963 (isStrictlySorted!319 lt!67933))))

(assert (=> d!39805 (= lt!67933 e!85173)))

(assert (=> d!39805 (= c!24103 (and ((_ is Cons!1704) (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)))) (bvslt (_1!1315 (h!2308 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003))))) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(assert (=> d!39805 (isStrictlySorted!319 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003))))))

(assert (=> d!39805 (= (insertStrictlySorted!87 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003))) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) lt!67933)))

(declare-fun b!130587 () Bool)

(assert (=> b!130587 (= e!85173 call!14220)))

(declare-fun b!130588 () Bool)

(assert (=> b!130588 (= e!85171 (insertStrictlySorted!87 (t!6107 (toList!864 (ite c!23759 call!14000 (ite c!23760 call!14001 call!14003)))) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))) (_2!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39805 c!24103) b!130587))

(assert (= (and d!39805 (not c!24103)) b!130586))

(assert (= (and b!130586 c!24101) b!130584))

(assert (= (and b!130586 (not c!24101)) b!130585))

(assert (= (and b!130585 c!24102) b!130580))

(assert (= (and b!130585 (not c!24102)) b!130583))

(assert (= (or b!130580 b!130583) bm!14216))

(assert (= (or b!130584 bm!14216) bm!14217))

(assert (= (or b!130587 bm!14217) bm!14215))

(assert (= (and bm!14215 c!24100) b!130588))

(assert (= (and bm!14215 (not c!24100)) b!130579))

(assert (= (and d!39805 res!62963) b!130582))

(assert (= (and b!130582 res!62964) b!130581))

(declare-fun m!153951 () Bool)

(assert (=> b!130581 m!153951))

(declare-fun m!153953 () Bool)

(assert (=> b!130582 m!153953))

(declare-fun m!153955 () Bool)

(assert (=> b!130588 m!153955))

(declare-fun m!153957 () Bool)

(assert (=> bm!14215 m!153957))

(declare-fun m!153959 () Bool)

(assert (=> d!39805 m!153959))

(declare-fun m!153961 () Bool)

(assert (=> d!39805 m!153961))

(assert (=> d!39241 d!39805))

(declare-fun d!39807 () Bool)

(assert (=> d!39807 (= (isEmpty!403 (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))) (not ((_ is Some!174) (getValueByKey!169 (toList!864 lt!67005) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))))

(assert (=> d!39281 d!39807))

(declare-fun d!39809 () Bool)

(declare-fun e!85175 () Bool)

(assert (=> d!39809 e!85175))

(declare-fun res!62965 () Bool)

(assert (=> d!39809 (=> res!62965 e!85175)))

(declare-fun lt!67937 () Bool)

(assert (=> d!39809 (= res!62965 (not lt!67937))))

(declare-fun lt!67936 () Bool)

(assert (=> d!39809 (= lt!67937 lt!67936)))

(declare-fun lt!67935 () Unit!4039)

(declare-fun e!85176 () Unit!4039)

(assert (=> d!39809 (= lt!67935 e!85176)))

(declare-fun c!24104 () Bool)

(assert (=> d!39809 (= c!24104 lt!67936)))

(assert (=> d!39809 (= lt!67936 (containsKey!173 (toList!864 lt!67412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39809 (= (contains!889 lt!67412 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67937)))

(declare-fun b!130589 () Bool)

(declare-fun lt!67934 () Unit!4039)

(assert (=> b!130589 (= e!85176 lt!67934)))

(assert (=> b!130589 (= lt!67934 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130589 (isDefined!122 (getValueByKey!169 (toList!864 lt!67412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130590 () Bool)

(declare-fun Unit!4090 () Unit!4039)

(assert (=> b!130590 (= e!85176 Unit!4090)))

(declare-fun b!130591 () Bool)

(assert (=> b!130591 (= e!85175 (isDefined!122 (getValueByKey!169 (toList!864 lt!67412) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39809 c!24104) b!130589))

(assert (= (and d!39809 (not c!24104)) b!130590))

(assert (= (and d!39809 (not res!62965)) b!130591))

(declare-fun m!153963 () Bool)

(assert (=> d!39809 m!153963))

(declare-fun m!153965 () Bool)

(assert (=> b!130589 m!153965))

(assert (=> b!130589 m!153651))

(assert (=> b!130589 m!153651))

(declare-fun m!153967 () Bool)

(assert (=> b!130589 m!153967))

(assert (=> b!130591 m!153651))

(assert (=> b!130591 m!153651))

(assert (=> b!130591 m!153967))

(assert (=> bm!14107 d!39809))

(assert (=> b!129645 d!39255))

(assert (=> b!129648 d!39779))

(declare-fun d!39811 () Bool)

(declare-fun e!85177 () Bool)

(assert (=> d!39811 e!85177))

(declare-fun res!62966 () Bool)

(assert (=> d!39811 (=> (not res!62966) (not e!85177))))

(declare-fun lt!67939 () ListLongMap!1697)

(assert (=> d!39811 (= res!62966 (contains!889 lt!67939 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67940 () List!1708)

(assert (=> d!39811 (= lt!67939 (ListLongMap!1698 lt!67940))))

(declare-fun lt!67941 () Unit!4039)

(declare-fun lt!67938 () Unit!4039)

(assert (=> d!39811 (= lt!67941 lt!67938)))

(assert (=> d!39811 (= (getValueByKey!169 lt!67940 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39811 (= lt!67938 (lemmaContainsTupThenGetReturnValue!84 lt!67940 (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39811 (= lt!67940 (insertStrictlySorted!87 (toList!864 (map!1398 newMap!16)) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39811 (= (+!172 (map!1398 newMap!16) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67939)))

(declare-fun b!130592 () Bool)

(declare-fun res!62967 () Bool)

(assert (=> b!130592 (=> (not res!62967) (not e!85177))))

(assert (=> b!130592 (= res!62967 (= (getValueByKey!169 (toList!864 lt!67939) (_1!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130593 () Bool)

(assert (=> b!130593 (= e!85177 (contains!890 (toList!864 lt!67939) (tuple2!2609 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39811 res!62966) b!130592))

(assert (= (and b!130592 res!62967) b!130593))

(declare-fun m!153969 () Bool)

(assert (=> d!39811 m!153969))

(declare-fun m!153971 () Bool)

(assert (=> d!39811 m!153971))

(declare-fun m!153973 () Bool)

(assert (=> d!39811 m!153973))

(declare-fun m!153975 () Bool)

(assert (=> d!39811 m!153975))

(declare-fun m!153977 () Bool)

(assert (=> b!130592 m!153977))

(declare-fun m!153979 () Bool)

(assert (=> b!130593 m!153979))

(assert (=> b!129648 d!39811))

(assert (=> b!129648 d!39219))

(declare-fun d!39813 () Bool)

(declare-fun e!85178 () Bool)

(assert (=> d!39813 e!85178))

(declare-fun res!62968 () Bool)

(assert (=> d!39813 (=> res!62968 e!85178)))

(declare-fun lt!67945 () Bool)

(assert (=> d!39813 (= res!62968 (not lt!67945))))

(declare-fun lt!67944 () Bool)

(assert (=> d!39813 (= lt!67945 lt!67944)))

(declare-fun lt!67943 () Unit!4039)

(declare-fun e!85179 () Unit!4039)

(assert (=> d!39813 (= lt!67943 e!85179)))

(declare-fun c!24105 () Bool)

(assert (=> d!39813 (= c!24105 lt!67944)))

(assert (=> d!39813 (= lt!67944 (containsKey!173 (toList!864 lt!67434) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39813 (= (contains!889 lt!67434 #b0000000000000000000000000000000000000000000000000000000000000000) lt!67945)))

(declare-fun b!130594 () Bool)

(declare-fun lt!67942 () Unit!4039)

(assert (=> b!130594 (= e!85179 lt!67942)))

(assert (=> b!130594 (= lt!67942 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67434) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!130594 (isDefined!122 (getValueByKey!169 (toList!864 lt!67434) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130595 () Bool)

(declare-fun Unit!4091 () Unit!4039)

(assert (=> b!130595 (= e!85179 Unit!4091)))

(declare-fun b!130596 () Bool)

(assert (=> b!130596 (= e!85178 (isDefined!122 (getValueByKey!169 (toList!864 lt!67434) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39813 c!24105) b!130594))

(assert (= (and d!39813 (not c!24105)) b!130595))

(assert (= (and d!39813 (not res!62968)) b!130596))

(declare-fun m!153981 () Bool)

(assert (=> d!39813 m!153981))

(declare-fun m!153983 () Bool)

(assert (=> b!130594 m!153983))

(assert (=> b!130594 m!153647))

(assert (=> b!130594 m!153647))

(declare-fun m!153985 () Bool)

(assert (=> b!130594 m!153985))

(assert (=> b!130596 m!153647))

(assert (=> b!130596 m!153647))

(assert (=> b!130596 m!153985))

(assert (=> bm!14114 d!39813))

(declare-fun d!39815 () Bool)

(declare-fun e!85180 () Bool)

(assert (=> d!39815 e!85180))

(declare-fun res!62969 () Bool)

(assert (=> d!39815 (=> (not res!62969) (not e!85180))))

(declare-fun lt!67947 () ListLongMap!1697)

(assert (=> d!39815 (= res!62969 (contains!889 lt!67947 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!67948 () List!1708)

(assert (=> d!39815 (= lt!67947 (ListLongMap!1698 lt!67948))))

(declare-fun lt!67949 () Unit!4039)

(declare-fun lt!67946 () Unit!4039)

(assert (=> d!39815 (= lt!67949 lt!67946)))

(assert (=> d!39815 (= (getValueByKey!169 lt!67948 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39815 (= lt!67946 (lemmaContainsTupThenGetReturnValue!84 lt!67948 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39815 (= lt!67948 (insertStrictlySorted!87 (toList!864 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16))) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39815 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67947)))

(declare-fun b!130597 () Bool)

(declare-fun res!62970 () Bool)

(assert (=> b!130597 (=> (not res!62970) (not e!85180))))

(assert (=> b!130597 (= res!62970 (= (getValueByKey!169 (toList!864 lt!67947) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!130598 () Bool)

(assert (=> b!130598 (= e!85180 (contains!890 (toList!864 lt!67947) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39815 res!62969) b!130597))

(assert (= (and b!130597 res!62970) b!130598))

(declare-fun m!153987 () Bool)

(assert (=> d!39815 m!153987))

(declare-fun m!153989 () Bool)

(assert (=> d!39815 m!153989))

(declare-fun m!153991 () Bool)

(assert (=> d!39815 m!153991))

(declare-fun m!153993 () Bool)

(assert (=> d!39815 m!153993))

(declare-fun m!153995 () Bool)

(assert (=> b!130597 m!153995))

(declare-fun m!153997 () Bool)

(assert (=> b!130598 m!153997))

(assert (=> d!39319 d!39815))

(assert (=> d!39319 d!39327))

(declare-fun b!130599 () Bool)

(declare-fun e!85191 () Bool)

(declare-fun lt!67956 () ListLongMap!1697)

(assert (=> b!130599 (= e!85191 (= (apply!113 lt!67956 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (get!1463 (select (arr!2244 (_values!2807 newMap!16)) #b00000000000000000000000000000000) (dynLambda!421 (defaultEntry!2824 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!130599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2510 (_values!2807 newMap!16))))))

(assert (=> b!130599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130600 () Bool)

(declare-fun e!85183 () Bool)

(declare-fun e!85190 () Bool)

(assert (=> b!130600 (= e!85183 e!85190)))

(declare-fun res!62977 () Bool)

(declare-fun call!14225 () Bool)

(assert (=> b!130600 (= res!62977 call!14225)))

(assert (=> b!130600 (=> (not res!62977) (not e!85190))))

(declare-fun b!130601 () Bool)

(declare-fun e!85192 () Bool)

(declare-fun call!14226 () Bool)

(assert (=> b!130601 (= e!85192 (not call!14226))))

(declare-fun bm!14218 () Bool)

(assert (=> bm!14218 (= call!14226 (contains!889 lt!67956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130602 () Bool)

(declare-fun e!85193 () Unit!4039)

(declare-fun lt!67966 () Unit!4039)

(assert (=> b!130602 (= e!85193 lt!67966)))

(declare-fun lt!67968 () ListLongMap!1697)

(assert (=> b!130602 (= lt!67968 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67964 () (_ BitVec 64))

(assert (=> b!130602 (= lt!67964 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67957 () (_ BitVec 64))

(assert (=> b!130602 (= lt!67957 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67963 () Unit!4039)

(assert (=> b!130602 (= lt!67963 (addStillContains!89 lt!67968 lt!67964 (zeroValue!2683 newMap!16) lt!67957))))

(assert (=> b!130602 (contains!889 (+!172 lt!67968 (tuple2!2609 lt!67964 (zeroValue!2683 newMap!16))) lt!67957)))

(declare-fun lt!67970 () Unit!4039)

(assert (=> b!130602 (= lt!67970 lt!67963)))

(declare-fun lt!67958 () ListLongMap!1697)

(assert (=> b!130602 (= lt!67958 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67961 () (_ BitVec 64))

(assert (=> b!130602 (= lt!67961 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67952 () (_ BitVec 64))

(assert (=> b!130602 (= lt!67952 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67967 () Unit!4039)

(assert (=> b!130602 (= lt!67967 (addApplyDifferent!89 lt!67958 lt!67961 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!67952))))

(assert (=> b!130602 (= (apply!113 (+!172 lt!67958 (tuple2!2609 lt!67961 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67952) (apply!113 lt!67958 lt!67952))))

(declare-fun lt!67965 () Unit!4039)

(assert (=> b!130602 (= lt!67965 lt!67967)))

(declare-fun lt!67950 () ListLongMap!1697)

(assert (=> b!130602 (= lt!67950 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67953 () (_ BitVec 64))

(assert (=> b!130602 (= lt!67953 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67954 () (_ BitVec 64))

(assert (=> b!130602 (= lt!67954 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67951 () Unit!4039)

(assert (=> b!130602 (= lt!67951 (addApplyDifferent!89 lt!67950 lt!67953 (zeroValue!2683 newMap!16) lt!67954))))

(assert (=> b!130602 (= (apply!113 (+!172 lt!67950 (tuple2!2609 lt!67953 (zeroValue!2683 newMap!16))) lt!67954) (apply!113 lt!67950 lt!67954))))

(declare-fun lt!67962 () Unit!4039)

(assert (=> b!130602 (= lt!67962 lt!67951)))

(declare-fun lt!67960 () ListLongMap!1697)

(assert (=> b!130602 (= lt!67960 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun lt!67969 () (_ BitVec 64))

(assert (=> b!130602 (= lt!67969 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67955 () (_ BitVec 64))

(assert (=> b!130602 (= lt!67955 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!130602 (= lt!67966 (addApplyDifferent!89 lt!67960 lt!67969 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!67955))))

(assert (=> b!130602 (= (apply!113 (+!172 lt!67960 (tuple2!2609 lt!67969 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67955) (apply!113 lt!67960 lt!67955))))

(declare-fun b!130603 () Bool)

(declare-fun res!62979 () Bool)

(declare-fun e!85184 () Bool)

(assert (=> b!130603 (=> (not res!62979) (not e!85184))))

(assert (=> b!130603 (= res!62979 e!85192)))

(declare-fun c!24107 () Bool)

(assert (=> b!130603 (= c!24107 (not (= (bvand lt!67164 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!130604 () Bool)

(declare-fun e!85181 () ListLongMap!1697)

(declare-fun call!14224 () ListLongMap!1697)

(assert (=> b!130604 (= e!85181 call!14224)))

(declare-fun b!130605 () Bool)

(declare-fun res!62978 () Bool)

(assert (=> b!130605 (=> (not res!62978) (not e!85184))))

(declare-fun e!85185 () Bool)

(assert (=> b!130605 (= res!62978 e!85185)))

(declare-fun res!62974 () Bool)

(assert (=> b!130605 (=> res!62974 e!85185)))

(declare-fun e!85182 () Bool)

(assert (=> b!130605 (= res!62974 (not e!85182))))

(declare-fun res!62972 () Bool)

(assert (=> b!130605 (=> (not res!62972) (not e!85182))))

(assert (=> b!130605 (= res!62972 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun bm!14219 () Bool)

(declare-fun call!14222 () ListLongMap!1697)

(declare-fun call!14221 () ListLongMap!1697)

(assert (=> bm!14219 (= call!14222 call!14221)))

(declare-fun d!39817 () Bool)

(assert (=> d!39817 e!85184))

(declare-fun res!62975 () Bool)

(assert (=> d!39817 (=> (not res!62975) (not e!85184))))

(assert (=> d!39817 (= res!62975 (or (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))))

(declare-fun lt!67971 () ListLongMap!1697)

(assert (=> d!39817 (= lt!67956 lt!67971)))

(declare-fun lt!67959 () Unit!4039)

(assert (=> d!39817 (= lt!67959 e!85193)))

(declare-fun c!24108 () Bool)

(declare-fun e!85188 () Bool)

(assert (=> d!39817 (= c!24108 e!85188)))

(declare-fun res!62976 () Bool)

(assert (=> d!39817 (=> (not res!62976) (not e!85188))))

(assert (=> d!39817 (= res!62976 (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun e!85186 () ListLongMap!1697)

(assert (=> d!39817 (= lt!67971 e!85186)))

(declare-fun c!24109 () Bool)

(assert (=> d!39817 (= c!24109 (and (not (= (bvand lt!67164 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!67164 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39817 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39817 (= (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) lt!67956)))

(declare-fun b!130606 () Bool)

(assert (=> b!130606 (= e!85188 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130607 () Bool)

(declare-fun e!85189 () ListLongMap!1697)

(declare-fun call!14227 () ListLongMap!1697)

(assert (=> b!130607 (= e!85189 call!14227)))

(declare-fun bm!14220 () Bool)

(assert (=> bm!14220 (= call!14225 (contains!889 lt!67956 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!130608 () Bool)

(assert (=> b!130608 (= e!85185 e!85191)))

(declare-fun res!62973 () Bool)

(assert (=> b!130608 (=> (not res!62973) (not e!85191))))

(assert (=> b!130608 (= res!62973 (contains!889 lt!67956 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130608 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130609 () Bool)

(declare-fun c!24111 () Bool)

(assert (=> b!130609 (= c!24111 (and (not (= (bvand lt!67164 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!67164 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!130609 (= e!85189 e!85181)))

(declare-fun b!130610 () Bool)

(assert (=> b!130610 (= e!85184 e!85183)))

(declare-fun c!24106 () Bool)

(assert (=> b!130610 (= c!24106 (not (= (bvand lt!67164 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!130611 () Bool)

(declare-fun Unit!4092 () Unit!4039)

(assert (=> b!130611 (= e!85193 Unit!4092)))

(declare-fun bm!14221 () Bool)

(assert (=> bm!14221 (= call!14221 (getCurrentListMapNoExtraKeys!138 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(declare-fun b!130612 () Bool)

(assert (=> b!130612 (= e!85186 e!85189)))

(declare-fun c!24110 () Bool)

(assert (=> b!130612 (= c!24110 (and (not (= (bvand lt!67164 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!67164 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!14222 () Bool)

(declare-fun call!14223 () ListLongMap!1697)

(assert (=> bm!14222 (= call!14223 (+!172 (ite c!24109 call!14221 (ite c!24110 call!14222 call!14224)) (ite (or c!24109 c!24110) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!130613 () Bool)

(assert (=> b!130613 (= e!85182 (validKeyInArray!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130614 () Bool)

(assert (=> b!130614 (= e!85190 (= (apply!113 lt!67956 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!130615 () Bool)

(declare-fun e!85187 () Bool)

(assert (=> b!130615 (= e!85192 e!85187)))

(declare-fun res!62971 () Bool)

(assert (=> b!130615 (= res!62971 call!14226)))

(assert (=> b!130615 (=> (not res!62971) (not e!85187))))

(declare-fun bm!14223 () Bool)

(assert (=> bm!14223 (= call!14224 call!14222)))

(declare-fun bm!14224 () Bool)

(assert (=> bm!14224 (= call!14227 call!14223)))

(declare-fun b!130616 () Bool)

(assert (=> b!130616 (= e!85181 call!14227)))

(declare-fun b!130617 () Bool)

(assert (=> b!130617 (= e!85187 (= (apply!113 lt!67956 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2683 newMap!16)))))

(declare-fun b!130618 () Bool)

(assert (=> b!130618 (= e!85186 (+!172 call!14223 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!130619 () Bool)

(assert (=> b!130619 (= e!85183 (not call!14225))))

(assert (= (and d!39817 c!24109) b!130618))

(assert (= (and d!39817 (not c!24109)) b!130612))

(assert (= (and b!130612 c!24110) b!130607))

(assert (= (and b!130612 (not c!24110)) b!130609))

(assert (= (and b!130609 c!24111) b!130616))

(assert (= (and b!130609 (not c!24111)) b!130604))

(assert (= (or b!130616 b!130604) bm!14223))

(assert (= (or b!130607 bm!14223) bm!14219))

(assert (= (or b!130607 b!130616) bm!14224))

(assert (= (or b!130618 bm!14219) bm!14221))

(assert (= (or b!130618 bm!14224) bm!14222))

(assert (= (and d!39817 res!62976) b!130606))

(assert (= (and d!39817 c!24108) b!130602))

(assert (= (and d!39817 (not c!24108)) b!130611))

(assert (= (and d!39817 res!62975) b!130605))

(assert (= (and b!130605 res!62972) b!130613))

(assert (= (and b!130605 (not res!62974)) b!130608))

(assert (= (and b!130608 res!62973) b!130599))

(assert (= (and b!130605 res!62978) b!130603))

(assert (= (and b!130603 c!24107) b!130615))

(assert (= (and b!130603 (not c!24107)) b!130601))

(assert (= (and b!130615 res!62971) b!130617))

(assert (= (or b!130615 b!130601) bm!14218))

(assert (= (and b!130603 res!62979) b!130610))

(assert (= (and b!130610 c!24106) b!130600))

(assert (= (and b!130610 (not c!24106)) b!130619))

(assert (= (and b!130600 res!62977) b!130614))

(assert (= (or b!130600 b!130619) bm!14220))

(declare-fun b_lambda!5793 () Bool)

(assert (=> (not b_lambda!5793) (not b!130599)))

(assert (=> b!130599 t!6114))

(declare-fun b_and!8087 () Bool)

(assert (= b_and!8083 (and (=> t!6114 result!3921) b_and!8087)))

(assert (=> b!130599 t!6116))

(declare-fun b_and!8089 () Bool)

(assert (= b_and!8085 (and (=> t!6116 result!3923) b_and!8089)))

(assert (=> bm!14221 m!151767))

(declare-fun m!153999 () Bool)

(assert (=> bm!14221 m!153999))

(declare-fun m!154001 () Bool)

(assert (=> bm!14220 m!154001))

(declare-fun m!154003 () Bool)

(assert (=> bm!14222 m!154003))

(assert (=> b!130599 m!152357))

(assert (=> b!130599 m!152009))

(assert (=> b!130599 m!152359))

(assert (=> b!130599 m!152013))

(assert (=> b!130599 m!152013))

(declare-fun m!154005 () Bool)

(assert (=> b!130599 m!154005))

(assert (=> b!130599 m!152357))

(assert (=> b!130599 m!152009))

(declare-fun m!154007 () Bool)

(assert (=> b!130617 m!154007))

(assert (=> b!130613 m!152013))

(assert (=> b!130613 m!152013))

(assert (=> b!130613 m!152019))

(assert (=> b!130606 m!152013))

(assert (=> b!130606 m!152013))

(assert (=> b!130606 m!152019))

(assert (=> d!39817 m!151983))

(declare-fun m!154009 () Bool)

(assert (=> b!130614 m!154009))

(declare-fun m!154011 () Bool)

(assert (=> b!130618 m!154011))

(declare-fun m!154013 () Bool)

(assert (=> bm!14218 m!154013))

(assert (=> b!130608 m!152013))

(assert (=> b!130608 m!152013))

(declare-fun m!154015 () Bool)

(assert (=> b!130608 m!154015))

(declare-fun m!154017 () Bool)

(assert (=> b!130602 m!154017))

(declare-fun m!154019 () Bool)

(assert (=> b!130602 m!154019))

(declare-fun m!154021 () Bool)

(assert (=> b!130602 m!154021))

(declare-fun m!154023 () Bool)

(assert (=> b!130602 m!154023))

(assert (=> b!130602 m!151767))

(assert (=> b!130602 m!153999))

(declare-fun m!154025 () Bool)

(assert (=> b!130602 m!154025))

(declare-fun m!154027 () Bool)

(assert (=> b!130602 m!154027))

(assert (=> b!130602 m!151767))

(declare-fun m!154029 () Bool)

(assert (=> b!130602 m!154029))

(declare-fun m!154031 () Bool)

(assert (=> b!130602 m!154031))

(declare-fun m!154033 () Bool)

(assert (=> b!130602 m!154033))

(assert (=> b!130602 m!152013))

(declare-fun m!154035 () Bool)

(assert (=> b!130602 m!154035))

(declare-fun m!154037 () Bool)

(assert (=> b!130602 m!154037))

(declare-fun m!154039 () Bool)

(assert (=> b!130602 m!154039))

(assert (=> b!130602 m!154025))

(declare-fun m!154041 () Bool)

(assert (=> b!130602 m!154041))

(declare-fun m!154043 () Bool)

(assert (=> b!130602 m!154043))

(assert (=> b!130602 m!154031))

(assert (=> b!130602 m!154037))

(assert (=> b!130602 m!154019))

(assert (=> b!130602 m!151767))

(declare-fun m!154045 () Bool)

(assert (=> b!130602 m!154045))

(assert (=> d!39319 d!39817))

(assert (=> d!39319 d!39457))

(declare-fun d!39819 () Bool)

(assert (=> d!39819 (= (+!172 (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!541 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2824 newMap!16)))))

(assert (=> d!39819 true))

(declare-fun _$8!115 () Unit!4039)

(assert (=> d!39819 (= (choose!792 (_keys!4565 newMap!16) (_values!2807 newMap!16) (mask!7102 newMap!16) (extraKeys!2597 newMap!16) lt!67164 (zeroValue!2683 newMap!16) (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2824 newMap!16)) _$8!115)))

(declare-fun bs!5429 () Bool)

(assert (= bs!5429 d!39819))

(assert (=> bs!5429 m!151839))

(assert (=> bs!5429 m!151839))

(assert (=> bs!5429 m!152329))

(assert (=> bs!5429 m!151767))

(assert (=> bs!5429 m!152327))

(assert (=> d!39319 d!39819))

(assert (=> d!39247 d!39457))

(declare-fun d!39821 () Bool)

(declare-fun lt!67974 () Bool)

(declare-fun content!130 (List!1709) (InoxSet (_ BitVec 64)))

(assert (=> d!39821 (= lt!67974 (select (content!130 Nil!1706) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!85198 () Bool)

(assert (=> d!39821 (= lt!67974 e!85198)))

(declare-fun res!62985 () Bool)

(assert (=> d!39821 (=> (not res!62985) (not e!85198))))

(assert (=> d!39821 (= res!62985 ((_ is Cons!1705) Nil!1706))))

(assert (=> d!39821 (= (contains!891 Nil!1706 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) lt!67974)))

(declare-fun b!130624 () Bool)

(declare-fun e!85199 () Bool)

(assert (=> b!130624 (= e!85198 e!85199)))

(declare-fun res!62984 () Bool)

(assert (=> b!130624 (=> res!62984 e!85199)))

(assert (=> b!130624 (= res!62984 (= (h!2309 Nil!1706) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130625 () Bool)

(assert (=> b!130625 (= e!85199 (contains!891 (t!6112 Nil!1706) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!39821 res!62985) b!130624))

(assert (= (and b!130624 (not res!62984)) b!130625))

(declare-fun m!154047 () Bool)

(assert (=> d!39821 m!154047))

(assert (=> d!39821 m!152013))

(declare-fun m!154049 () Bool)

(assert (=> d!39821 m!154049))

(assert (=> b!130625 m!152013))

(declare-fun m!154051 () Bool)

(assert (=> b!130625 m!154051))

(assert (=> b!129802 d!39821))

(declare-fun d!39823 () Bool)

(declare-fun e!85200 () Bool)

(assert (=> d!39823 e!85200))

(declare-fun res!62986 () Bool)

(assert (=> d!39823 (=> res!62986 e!85200)))

(declare-fun lt!67978 () Bool)

(assert (=> d!39823 (= res!62986 (not lt!67978))))

(declare-fun lt!67977 () Bool)

(assert (=> d!39823 (= lt!67978 lt!67977)))

(declare-fun lt!67976 () Unit!4039)

(declare-fun e!85201 () Unit!4039)

(assert (=> d!39823 (= lt!67976 e!85201)))

(declare-fun c!24112 () Bool)

(assert (=> d!39823 (= c!24112 lt!67977)))

(assert (=> d!39823 (= lt!67977 (containsKey!173 (toList!864 lt!67240) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!39823 (= (contains!889 lt!67240 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!67978)))

(declare-fun b!130626 () Bool)

(declare-fun lt!67975 () Unit!4039)

(assert (=> b!130626 (= e!85201 lt!67975)))

(assert (=> b!130626 (= lt!67975 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67240) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!130626 (isDefined!122 (getValueByKey!169 (toList!864 lt!67240) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!130627 () Bool)

(declare-fun Unit!4093 () Unit!4039)

(assert (=> b!130627 (= e!85201 Unit!4093)))

(declare-fun b!130628 () Bool)

(assert (=> b!130628 (= e!85200 (isDefined!122 (getValueByKey!169 (toList!864 lt!67240) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!39823 c!24112) b!130626))

(assert (= (and d!39823 (not c!24112)) b!130627))

(assert (= (and d!39823 (not res!62986)) b!130628))

(assert (=> d!39823 m!151851))

(declare-fun m!154053 () Bool)

(assert (=> d!39823 m!154053))

(assert (=> b!130626 m!151851))

(declare-fun m!154055 () Bool)

(assert (=> b!130626 m!154055))

(assert (=> b!130626 m!151851))

(assert (=> b!130626 m!152965))

(assert (=> b!130626 m!152965))

(declare-fun m!154057 () Bool)

(assert (=> b!130626 m!154057))

(assert (=> b!130628 m!151851))

(assert (=> b!130628 m!152965))

(assert (=> b!130628 m!152965))

(assert (=> b!130628 m!154057))

(assert (=> b!129569 d!39823))

(declare-fun d!39825 () Bool)

(declare-fun res!62987 () Bool)

(declare-fun e!85202 () Bool)

(assert (=> d!39825 (=> res!62987 e!85202)))

(assert (=> d!39825 (= res!62987 (and ((_ is Cons!1704) (toList!864 lt!67067)) (= (_1!1315 (h!2308 (toList!864 lt!67067))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!39825 (= (containsKey!173 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!85202)))

(declare-fun b!130629 () Bool)

(declare-fun e!85203 () Bool)

(assert (=> b!130629 (= e!85202 e!85203)))

(declare-fun res!62988 () Bool)

(assert (=> b!130629 (=> (not res!62988) (not e!85203))))

(assert (=> b!130629 (= res!62988 (and (or (not ((_ is Cons!1704) (toList!864 lt!67067))) (bvsle (_1!1315 (h!2308 (toList!864 lt!67067))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1704) (toList!864 lt!67067)) (bvslt (_1!1315 (h!2308 (toList!864 lt!67067))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!130630 () Bool)

(assert (=> b!130630 (= e!85203 (containsKey!173 (t!6107 (toList!864 lt!67067)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!39825 (not res!62987)) b!130629))

(assert (= (and b!130629 res!62988) b!130630))

(assert (=> b!130630 m!151851))

(declare-fun m!154059 () Bool)

(assert (=> b!130630 m!154059))

(assert (=> d!39333 d!39825))

(declare-fun d!39827 () Bool)

(declare-fun e!85204 () Bool)

(assert (=> d!39827 e!85204))

(declare-fun res!62989 () Bool)

(assert (=> d!39827 (=> (not res!62989) (not e!85204))))

(declare-fun lt!67980 () ListLongMap!1697)

(assert (=> d!39827 (= res!62989 (contains!889 lt!67980 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(declare-fun lt!67981 () List!1708)

(assert (=> d!39827 (= lt!67980 (ListLongMap!1698 lt!67981))))

(declare-fun lt!67982 () Unit!4039)

(declare-fun lt!67979 () Unit!4039)

(assert (=> d!39827 (= lt!67982 lt!67979)))

(assert (=> d!39827 (= (getValueByKey!169 lt!67981 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39827 (= lt!67979 (lemmaContainsTupThenGetReturnValue!84 lt!67981 (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39827 (= lt!67981 (insertStrictlySorted!87 (toList!864 call!14081) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))))))

(assert (=> d!39827 (= (+!172 call!14081 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))) lt!67980)))

(declare-fun b!130631 () Bool)

(declare-fun res!62990 () Bool)

(assert (=> b!130631 (=> (not res!62990) (not e!85204))))

(assert (=> b!130631 (= res!62990 (= (getValueByKey!169 (toList!864 lt!67980) (_1!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16))))) (Some!174 (_2!1315 (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))))

(declare-fun b!130632 () Bool)

(assert (=> b!130632 (= e!85204 (contains!890 (toList!864 lt!67980) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23800 (ite c!23802 (minValue!2683 newMap!16) (get!1463 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) from!355) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2683 newMap!16)))))))

(assert (= (and d!39827 res!62989) b!130631))

(assert (= (and b!130631 res!62990) b!130632))

(declare-fun m!154061 () Bool)

(assert (=> d!39827 m!154061))

(declare-fun m!154063 () Bool)

(assert (=> d!39827 m!154063))

(declare-fun m!154065 () Bool)

(assert (=> d!39827 m!154065))

(declare-fun m!154067 () Bool)

(assert (=> d!39827 m!154067))

(declare-fun m!154069 () Bool)

(assert (=> b!130631 m!154069))

(declare-fun m!154071 () Bool)

(assert (=> b!130632 m!154071))

(assert (=> b!129537 d!39827))

(declare-fun d!39829 () Bool)

(assert (=> d!39829 (arrayContainsKey!0 (_keys!4565 newMap!16) lt!67460 #b00000000000000000000000000000000)))

(declare-fun lt!67983 () Unit!4039)

(assert (=> d!39829 (= lt!67983 (choose!13 (_keys!4565 newMap!16) lt!67460 #b00000000000000000000000000000000))))

(assert (=> d!39829 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!39829 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4565 newMap!16) lt!67460 #b00000000000000000000000000000000) lt!67983)))

(declare-fun bs!5430 () Bool)

(assert (= bs!5430 d!39829))

(assert (=> bs!5430 m!152465))

(declare-fun m!154073 () Bool)

(assert (=> bs!5430 m!154073))

(assert (=> b!129790 d!39829))

(declare-fun d!39831 () Bool)

(declare-fun res!62991 () Bool)

(declare-fun e!85205 () Bool)

(assert (=> d!39831 (=> res!62991 e!85205)))

(assert (=> d!39831 (= res!62991 (= (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) lt!67460))))

(assert (=> d!39831 (= (arrayContainsKey!0 (_keys!4565 newMap!16) lt!67460 #b00000000000000000000000000000000) e!85205)))

(declare-fun b!130633 () Bool)

(declare-fun e!85206 () Bool)

(assert (=> b!130633 (= e!85205 e!85206)))

(declare-fun res!62992 () Bool)

(assert (=> b!130633 (=> (not res!62992) (not e!85206))))

(assert (=> b!130633 (= res!62992 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2509 (_keys!4565 newMap!16))))))

(declare-fun b!130634 () Bool)

(assert (=> b!130634 (= e!85206 (arrayContainsKey!0 (_keys!4565 newMap!16) lt!67460 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39831 (not res!62991)) b!130633))

(assert (= (and b!130633 res!62992) b!130634))

(assert (=> d!39831 m!152013))

(declare-fun m!154075 () Bool)

(assert (=> b!130634 m!154075))

(assert (=> b!129790 d!39831))

(declare-fun b!130635 () Bool)

(declare-fun e!85207 () SeekEntryResult!272)

(declare-fun lt!67986 () SeekEntryResult!272)

(assert (=> b!130635 (= e!85207 (MissingZero!272 (index!3247 lt!67986)))))

(declare-fun b!130636 () Bool)

(declare-fun c!24114 () Bool)

(declare-fun lt!67984 () (_ BitVec 64))

(assert (=> b!130636 (= c!24114 (= lt!67984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!85209 () SeekEntryResult!272)

(assert (=> b!130636 (= e!85209 e!85207)))

(declare-fun b!130638 () Bool)

(assert (=> b!130638 (= e!85209 (Found!272 (index!3247 lt!67986)))))

(declare-fun b!130639 () Bool)

(declare-fun e!85208 () SeekEntryResult!272)

(assert (=> b!130639 (= e!85208 e!85209)))

(assert (=> b!130639 (= lt!67984 (select (arr!2243 (_keys!4565 newMap!16)) (index!3247 lt!67986)))))

(declare-fun c!24113 () Bool)

(assert (=> b!130639 (= c!24113 (= lt!67984 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130640 () Bool)

(assert (=> b!130640 (= e!85207 (seekKeyOrZeroReturnVacant!0 (x!15267 lt!67986) (index!3247 lt!67986) (index!3247 lt!67986) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(declare-fun d!39833 () Bool)

(declare-fun lt!67985 () SeekEntryResult!272)

(assert (=> d!39833 (and (or ((_ is Undefined!272) lt!67985) (not ((_ is Found!272) lt!67985)) (and (bvsge (index!3246 lt!67985) #b00000000000000000000000000000000) (bvslt (index!3246 lt!67985) (size!2509 (_keys!4565 newMap!16))))) (or ((_ is Undefined!272) lt!67985) ((_ is Found!272) lt!67985) (not ((_ is MissingZero!272) lt!67985)) (and (bvsge (index!3245 lt!67985) #b00000000000000000000000000000000) (bvslt (index!3245 lt!67985) (size!2509 (_keys!4565 newMap!16))))) (or ((_ is Undefined!272) lt!67985) ((_ is Found!272) lt!67985) ((_ is MissingZero!272) lt!67985) (not ((_ is MissingVacant!272) lt!67985)) (and (bvsge (index!3248 lt!67985) #b00000000000000000000000000000000) (bvslt (index!3248 lt!67985) (size!2509 (_keys!4565 newMap!16))))) (or ((_ is Undefined!272) lt!67985) (ite ((_ is Found!272) lt!67985) (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3246 lt!67985)) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!272) lt!67985) (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3245 lt!67985)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!272) lt!67985) (= (select (arr!2243 (_keys!4565 newMap!16)) (index!3248 lt!67985)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39833 (= lt!67985 e!85208)))

(declare-fun c!24115 () Bool)

(assert (=> d!39833 (= c!24115 (and ((_ is Intermediate!272) lt!67986) (undefined!1084 lt!67986)))))

(assert (=> d!39833 (= lt!67986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (mask!7102 newMap!16)) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (_keys!4565 newMap!16) (mask!7102 newMap!16)))))

(assert (=> d!39833 (validMask!0 (mask!7102 newMap!16))))

(assert (=> d!39833 (= (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000) (_keys!4565 newMap!16) (mask!7102 newMap!16)) lt!67985)))

(declare-fun b!130637 () Bool)

(assert (=> b!130637 (= e!85208 Undefined!272)))

(assert (= (and d!39833 c!24115) b!130637))

(assert (= (and d!39833 (not c!24115)) b!130639))

(assert (= (and b!130639 c!24113) b!130638))

(assert (= (and b!130639 (not c!24113)) b!130636))

(assert (= (and b!130636 c!24114) b!130635))

(assert (= (and b!130636 (not c!24114)) b!130640))

(declare-fun m!154077 () Bool)

(assert (=> b!130639 m!154077))

(assert (=> b!130640 m!152013))

(declare-fun m!154079 () Bool)

(assert (=> b!130640 m!154079))

(declare-fun m!154081 () Bool)

(assert (=> d!39833 m!154081))

(assert (=> d!39833 m!151983))

(declare-fun m!154083 () Bool)

(assert (=> d!39833 m!154083))

(assert (=> d!39833 m!152013))

(declare-fun m!154085 () Bool)

(assert (=> d!39833 m!154085))

(declare-fun m!154087 () Bool)

(assert (=> d!39833 m!154087))

(declare-fun m!154089 () Bool)

(assert (=> d!39833 m!154089))

(assert (=> d!39833 m!152013))

(assert (=> d!39833 m!154083))

(assert (=> b!129790 d!39833))

(assert (=> b!129803 d!39357))

(assert (=> bm!14101 d!39275))

(declare-fun e!85211 () Option!175)

(declare-fun b!130643 () Bool)

(assert (=> b!130643 (= e!85211 (getValueByKey!169 (t!6107 (toList!864 lt!67185)) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130641 () Bool)

(declare-fun e!85210 () Option!175)

(assert (=> b!130641 (= e!85210 (Some!174 (_2!1315 (h!2308 (toList!864 lt!67185)))))))

(declare-fun b!130642 () Bool)

(assert (=> b!130642 (= e!85210 e!85211)))

(declare-fun c!24117 () Bool)

(assert (=> b!130642 (= c!24117 (and ((_ is Cons!1704) (toList!864 lt!67185)) (not (= (_1!1315 (h!2308 (toList!864 lt!67185))) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))))))))

(declare-fun c!24116 () Bool)

(declare-fun d!39835 () Bool)

(assert (=> d!39835 (= c!24116 (and ((_ is Cons!1704) (toList!864 lt!67185)) (= (_1!1315 (h!2308 (toList!864 lt!67185))) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(assert (=> d!39835 (= (getValueByKey!169 (toList!864 lt!67185) (_1!1315 (ite (or c!23759 c!23760) (tuple2!2609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))) (tuple2!2609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2683 (v!3162 (underlying!448 thiss!992))))))) e!85210)))

(declare-fun b!130644 () Bool)

(assert (=> b!130644 (= e!85211 None!173)))

(assert (= (and d!39835 c!24116) b!130641))

(assert (= (and d!39835 (not c!24116)) b!130642))

(assert (= (and b!130642 c!24117) b!130643))

(assert (= (and b!130642 (not c!24117)) b!130644))

(declare-fun m!154091 () Bool)

(assert (=> b!130643 m!154091))

(assert (=> b!129508 d!39835))

(declare-fun d!39837 () Bool)

(assert (=> d!39837 (= (get!1465 (select (arr!2244 (_values!2807 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!421 (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129609 d!39837))

(assert (=> b!129699 d!39579))

(assert (=> b!129699 d!39581))

(declare-fun d!39839 () Bool)

(declare-fun e!85212 () Bool)

(assert (=> d!39839 e!85212))

(declare-fun res!62993 () Bool)

(assert (=> d!39839 (=> res!62993 e!85212)))

(declare-fun lt!67990 () Bool)

(assert (=> d!39839 (= res!62993 (not lt!67990))))

(declare-fun lt!67989 () Bool)

(assert (=> d!39839 (= lt!67990 lt!67989)))

(declare-fun lt!67988 () Unit!4039)

(declare-fun e!85213 () Unit!4039)

(assert (=> d!39839 (= lt!67988 e!85213)))

(declare-fun c!24118 () Bool)

(assert (=> d!39839 (= c!24118 lt!67989)))

(assert (=> d!39839 (= lt!67989 (containsKey!173 (toList!864 lt!67377) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> d!39839 (= (contains!889 lt!67377 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67990)))

(declare-fun b!130645 () Bool)

(declare-fun lt!67987 () Unit!4039)

(assert (=> b!130645 (= e!85213 lt!67987)))

(assert (=> b!130645 (= lt!67987 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67377) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (=> b!130645 (isDefined!122 (getValueByKey!169 (toList!864 lt!67377) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130646 () Bool)

(declare-fun Unit!4094 () Unit!4039)

(assert (=> b!130646 (= e!85213 Unit!4094)))

(declare-fun b!130647 () Bool)

(assert (=> b!130647 (= e!85212 (isDefined!122 (getValueByKey!169 (toList!864 lt!67377) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39839 c!24118) b!130645))

(assert (= (and d!39839 (not c!24118)) b!130646))

(assert (= (and d!39839 (not res!62993)) b!130647))

(declare-fun m!154093 () Bool)

(assert (=> d!39839 m!154093))

(declare-fun m!154095 () Bool)

(assert (=> b!130645 m!154095))

(assert (=> b!130645 m!152277))

(assert (=> b!130645 m!152277))

(declare-fun m!154097 () Bool)

(assert (=> b!130645 m!154097))

(assert (=> b!130647 m!152277))

(assert (=> b!130647 m!152277))

(assert (=> b!130647 m!154097))

(assert (=> d!39301 d!39839))

(declare-fun e!85215 () Option!175)

(declare-fun b!130650 () Bool)

(assert (=> b!130650 (= e!85215 (getValueByKey!169 (t!6107 lt!67378) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130648 () Bool)

(declare-fun e!85214 () Option!175)

(assert (=> b!130648 (= e!85214 (Some!174 (_2!1315 (h!2308 lt!67378))))))

(declare-fun b!130649 () Bool)

(assert (=> b!130649 (= e!85214 e!85215)))

(declare-fun c!24120 () Bool)

(assert (=> b!130649 (= c!24120 (and ((_ is Cons!1704) lt!67378) (not (= (_1!1315 (h!2308 lt!67378)) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun d!39841 () Bool)

(declare-fun c!24119 () Bool)

(assert (=> d!39841 (= c!24119 (and ((_ is Cons!1704) lt!67378) (= (_1!1315 (h!2308 lt!67378)) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39841 (= (getValueByKey!169 lt!67378 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) e!85214)))

(declare-fun b!130651 () Bool)

(assert (=> b!130651 (= e!85215 None!173)))

(assert (= (and d!39841 c!24119) b!130648))

(assert (= (and d!39841 (not c!24119)) b!130649))

(assert (= (and b!130649 c!24120) b!130650))

(assert (= (and b!130649 (not c!24120)) b!130651))

(declare-fun m!154099 () Bool)

(assert (=> b!130650 m!154099))

(assert (=> d!39301 d!39841))

(declare-fun d!39843 () Bool)

(assert (=> d!39843 (= (getValueByKey!169 lt!67378 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) (Some!174 (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun lt!67991 () Unit!4039)

(assert (=> d!39843 (= lt!67991 (choose!796 lt!67378 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun e!85216 () Bool)

(assert (=> d!39843 e!85216))

(declare-fun res!62994 () Bool)

(assert (=> d!39843 (=> (not res!62994) (not e!85216))))

(assert (=> d!39843 (= res!62994 (isStrictlySorted!319 lt!67378))))

(assert (=> d!39843 (= (lemmaContainsTupThenGetReturnValue!84 lt!67378 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67991)))

(declare-fun b!130652 () Bool)

(declare-fun res!62995 () Bool)

(assert (=> b!130652 (=> (not res!62995) (not e!85216))))

(assert (=> b!130652 (= res!62995 (containsKey!173 lt!67378 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130653 () Bool)

(assert (=> b!130653 (= e!85216 (contains!890 lt!67378 (tuple2!2609 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (= (and d!39843 res!62994) b!130652))

(assert (= (and b!130652 res!62995) b!130653))

(assert (=> d!39843 m!152271))

(declare-fun m!154101 () Bool)

(assert (=> d!39843 m!154101))

(declare-fun m!154103 () Bool)

(assert (=> d!39843 m!154103))

(declare-fun m!154105 () Bool)

(assert (=> b!130652 m!154105))

(declare-fun m!154107 () Bool)

(assert (=> b!130653 m!154107))

(assert (=> d!39301 d!39843))

(declare-fun e!85218 () List!1708)

(declare-fun c!24124 () Bool)

(declare-fun call!14230 () List!1708)

(declare-fun bm!14225 () Bool)

(assert (=> bm!14225 (= call!14230 ($colon$colon!91 e!85218 (ite c!24124 (h!2308 (toList!864 lt!67079)) (tuple2!2609 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))))

(declare-fun c!24121 () Bool)

(assert (=> bm!14225 (= c!24121 c!24124)))

(declare-fun c!24123 () Bool)

(declare-fun c!24122 () Bool)

(declare-fun b!130654 () Bool)

(assert (=> b!130654 (= e!85218 (ite c!24122 (t!6107 (toList!864 lt!67079)) (ite c!24123 (Cons!1704 (h!2308 (toList!864 lt!67079)) (t!6107 (toList!864 lt!67079))) Nil!1705)))))

(declare-fun b!130655 () Bool)

(declare-fun e!85219 () List!1708)

(declare-fun call!14229 () List!1708)

(assert (=> b!130655 (= e!85219 call!14229)))

(declare-fun e!85221 () Bool)

(declare-fun lt!67992 () List!1708)

(declare-fun b!130656 () Bool)

(assert (=> b!130656 (= e!85221 (contains!890 lt!67992 (tuple2!2609 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun b!130657 () Bool)

(declare-fun res!62997 () Bool)

(assert (=> b!130657 (=> (not res!62997) (not e!85221))))

(assert (=> b!130657 (= res!62997 (containsKey!173 lt!67992 (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(declare-fun b!130658 () Bool)

(assert (=> b!130658 (= e!85219 call!14229)))

(declare-fun b!130659 () Bool)

(declare-fun e!85217 () List!1708)

(declare-fun call!14228 () List!1708)

(assert (=> b!130659 (= e!85217 call!14228)))

(declare-fun b!130660 () Bool)

(assert (=> b!130660 (= c!24123 (and ((_ is Cons!1704) (toList!864 lt!67079)) (bvsgt (_1!1315 (h!2308 (toList!864 lt!67079))) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> b!130660 (= e!85217 e!85219)))

(declare-fun bm!14227 () Bool)

(assert (=> bm!14227 (= call!14228 call!14230)))

(declare-fun b!130661 () Bool)

(declare-fun e!85220 () List!1708)

(assert (=> b!130661 (= e!85220 e!85217)))

(assert (=> b!130661 (= c!24122 (and ((_ is Cons!1704) (toList!864 lt!67079)) (= (_1!1315 (h!2308 (toList!864 lt!67079))) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(declare-fun bm!14226 () Bool)

(assert (=> bm!14226 (= call!14229 call!14228)))

(declare-fun d!39845 () Bool)

(assert (=> d!39845 e!85221))

(declare-fun res!62996 () Bool)

(assert (=> d!39845 (=> (not res!62996) (not e!85221))))

(assert (=> d!39845 (= res!62996 (isStrictlySorted!319 lt!67992))))

(assert (=> d!39845 (= lt!67992 e!85220)))

(assert (=> d!39845 (= c!24124 (and ((_ is Cons!1704) (toList!864 lt!67079)) (bvslt (_1!1315 (h!2308 (toList!864 lt!67079))) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))))))))

(assert (=> d!39845 (isStrictlySorted!319 (toList!864 lt!67079))))

(assert (=> d!39845 (= (insertStrictlySorted!87 (toList!864 lt!67079) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))) lt!67992)))

(declare-fun b!130662 () Bool)

(assert (=> b!130662 (= e!85220 call!14230)))

(declare-fun b!130663 () Bool)

(assert (=> b!130663 (= e!85218 (insertStrictlySorted!87 (t!6107 (toList!864 lt!67079)) (_1!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992))))) (_2!1315 (tuple2!2609 lt!67075 (zeroValue!2683 (v!3162 (underlying!448 thiss!992)))))))))

(assert (= (and d!39845 c!24124) b!130662))

(assert (= (and d!39845 (not c!24124)) b!130661))

(assert (= (and b!130661 c!24122) b!130659))

(assert (= (and b!130661 (not c!24122)) b!130660))

(assert (= (and b!130660 c!24123) b!130655))

(assert (= (and b!130660 (not c!24123)) b!130658))

(assert (= (or b!130655 b!130658) bm!14226))

(assert (= (or b!130659 bm!14226) bm!14227))

(assert (= (or b!130662 bm!14227) bm!14225))

(assert (= (and bm!14225 c!24121) b!130663))

(assert (= (and bm!14225 (not c!24121)) b!130654))

(assert (= (and d!39845 res!62996) b!130657))

(assert (= (and b!130657 res!62997) b!130656))

(declare-fun m!154109 () Bool)

(assert (=> b!130656 m!154109))

(declare-fun m!154111 () Bool)

(assert (=> b!130657 m!154111))

(declare-fun m!154113 () Bool)

(assert (=> b!130663 m!154113))

(declare-fun m!154115 () Bool)

(assert (=> bm!14225 m!154115))

(declare-fun m!154117 () Bool)

(assert (=> d!39845 m!154117))

(declare-fun m!154119 () Bool)

(assert (=> d!39845 m!154119))

(assert (=> d!39301 d!39845))

(declare-fun d!39847 () Bool)

(declare-fun e!85222 () Bool)

(assert (=> d!39847 e!85222))

(declare-fun res!62998 () Bool)

(assert (=> d!39847 (=> res!62998 e!85222)))

(declare-fun lt!67996 () Bool)

(assert (=> d!39847 (= res!62998 (not lt!67996))))

(declare-fun lt!67995 () Bool)

(assert (=> d!39847 (= lt!67996 lt!67995)))

(declare-fun lt!67994 () Unit!4039)

(declare-fun e!85223 () Unit!4039)

(assert (=> d!39847 (= lt!67994 e!85223)))

(declare-fun c!24125 () Bool)

(assert (=> d!39847 (= c!24125 lt!67995)))

(assert (=> d!39847 (= lt!67995 (containsKey!173 (toList!864 lt!67434) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39847 (= (contains!889 lt!67434 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) lt!67996)))

(declare-fun b!130664 () Bool)

(declare-fun lt!67993 () Unit!4039)

(assert (=> b!130664 (= e!85223 lt!67993)))

(assert (=> b!130664 (= lt!67993 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67434) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130664 (isDefined!122 (getValueByKey!169 (toList!864 lt!67434) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130665 () Bool)

(declare-fun Unit!4095 () Unit!4039)

(assert (=> b!130665 (= e!85223 Unit!4095)))

(declare-fun b!130666 () Bool)

(assert (=> b!130666 (= e!85222 (isDefined!122 (getValueByKey!169 (toList!864 lt!67434) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39847 c!24125) b!130664))

(assert (= (and d!39847 (not c!24125)) b!130665))

(assert (= (and d!39847 (not res!62998)) b!130666))

(assert (=> d!39847 m!152013))

(declare-fun m!154121 () Bool)

(assert (=> d!39847 m!154121))

(assert (=> b!130664 m!152013))

(declare-fun m!154123 () Bool)

(assert (=> b!130664 m!154123))

(assert (=> b!130664 m!152013))

(assert (=> b!130664 m!153523))

(assert (=> b!130664 m!153523))

(declare-fun m!154125 () Bool)

(assert (=> b!130664 m!154125))

(assert (=> b!130666 m!152013))

(assert (=> b!130666 m!153523))

(assert (=> b!130666 m!153523))

(assert (=> b!130666 m!154125))

(assert (=> b!129765 d!39847))

(declare-fun d!39849 () Bool)

(declare-fun res!62999 () Bool)

(declare-fun e!85224 () Bool)

(assert (=> d!39849 (=> res!62999 e!85224)))

(assert (=> d!39849 (= res!62999 (and ((_ is Cons!1704) (toList!864 call!14077)) (= (_1!1315 (h!2308 (toList!864 call!14077))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(assert (=> d!39849 (= (containsKey!173 (toList!864 call!14077) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)) e!85224)))

(declare-fun b!130667 () Bool)

(declare-fun e!85225 () Bool)

(assert (=> b!130667 (= e!85224 e!85225)))

(declare-fun res!63000 () Bool)

(assert (=> b!130667 (=> (not res!63000) (not e!85225))))

(assert (=> b!130667 (= res!63000 (and (or (not ((_ is Cons!1704) (toList!864 call!14077))) (bvsle (_1!1315 (h!2308 (toList!864 call!14077))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))) ((_ is Cons!1704) (toList!864 call!14077)) (bvslt (_1!1315 (h!2308 (toList!864 call!14077))) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355))))))

(declare-fun b!130668 () Bool)

(assert (=> b!130668 (= e!85225 (containsKey!173 (t!6107 (toList!864 call!14077)) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) from!355)))))

(assert (= (and d!39849 (not res!62999)) b!130667))

(assert (= (and b!130667 res!63000) b!130668))

(assert (=> b!130668 m!151769))

(declare-fun m!154127 () Bool)

(assert (=> b!130668 m!154127))

(assert (=> d!39345 d!39849))

(declare-fun d!39851 () Bool)

(assert (=> d!39851 (isDefined!122 (getValueByKey!169 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!67997 () Unit!4039)

(assert (=> d!39851 (= lt!67997 (choose!789 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!85226 () Bool)

(assert (=> d!39851 e!85226))

(declare-fun res!63001 () Bool)

(assert (=> d!39851 (=> (not res!63001) (not e!85226))))

(assert (=> d!39851 (= res!63001 (isStrictlySorted!319 (toList!864 lt!67067)))))

(assert (=> d!39851 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!67997)))

(declare-fun b!130669 () Bool)

(assert (=> b!130669 (= e!85226 (containsKey!173 (toList!864 lt!67067) (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!39851 res!63001) b!130669))

(assert (=> d!39851 m!151851))

(assert (=> d!39851 m!152115))

(assert (=> d!39851 m!152115))

(assert (=> d!39851 m!152459))

(assert (=> d!39851 m!151851))

(declare-fun m!154129 () Bool)

(assert (=> d!39851 m!154129))

(assert (=> d!39851 m!153021))

(assert (=> b!130669 m!151851))

(assert (=> b!130669 m!152455))

(assert (=> b!129777 d!39851))

(assert (=> b!129777 d!39627))

(assert (=> b!129777 d!39537))

(declare-fun d!39853 () Bool)

(declare-fun e!85227 () Bool)

(assert (=> d!39853 e!85227))

(declare-fun res!63002 () Bool)

(assert (=> d!39853 (=> res!63002 e!85227)))

(declare-fun lt!68001 () Bool)

(assert (=> d!39853 (= res!63002 (not lt!68001))))

(declare-fun lt!68000 () Bool)

(assert (=> d!39853 (= lt!68001 lt!68000)))

(declare-fun lt!67999 () Unit!4039)

(declare-fun e!85228 () Unit!4039)

(assert (=> d!39853 (= lt!67999 e!85228)))

(declare-fun c!24126 () Bool)

(assert (=> d!39853 (= c!24126 lt!68000)))

(assert (=> d!39853 (= lt!68000 (containsKey!173 (toList!864 lt!67412) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39853 (= (contains!889 lt!67412 (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)) lt!68001)))

(declare-fun b!130670 () Bool)

(declare-fun lt!67998 () Unit!4039)

(assert (=> b!130670 (= e!85228 lt!67998)))

(assert (=> b!130670 (= lt!67998 (lemmaContainsKeyImpliesGetValueByKeyDefined!121 (toList!864 lt!67412) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!130670 (isDefined!122 (getValueByKey!169 (toList!864 lt!67412) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!130671 () Bool)

(declare-fun Unit!4096 () Unit!4039)

(assert (=> b!130671 (= e!85228 Unit!4096)))

(declare-fun b!130672 () Bool)

(assert (=> b!130672 (= e!85227 (isDefined!122 (getValueByKey!169 (toList!864 lt!67412) (select (arr!2243 (_keys!4565 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39853 c!24126) b!130670))

(assert (= (and d!39853 (not c!24126)) b!130671))

(assert (= (and d!39853 (not res!63002)) b!130672))

(assert (=> d!39853 m!152013))

(declare-fun m!154131 () Bool)

(assert (=> d!39853 m!154131))

(assert (=> b!130670 m!152013))

(declare-fun m!154133 () Bool)

(assert (=> b!130670 m!154133))

(assert (=> b!130670 m!152013))

(assert (=> b!130670 m!153507))

(assert (=> b!130670 m!153507))

(declare-fun m!154135 () Bool)

(assert (=> b!130670 m!154135))

(assert (=> b!130672 m!152013))

(assert (=> b!130672 m!153507))

(assert (=> b!130672 m!153507))

(assert (=> b!130672 m!154135))

(assert (=> b!129744 d!39853))

(assert (=> bm!14110 d!39731))

(declare-fun b!130673 () Bool)

(declare-fun e!85229 () Bool)

(declare-fun e!85230 () Bool)

(assert (=> b!130673 (= e!85229 e!85230)))

(declare-fun c!24127 () Bool)

(assert (=> b!130673 (= c!24127 (validKeyInArray!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!39855 () Bool)

(declare-fun res!63003 () Bool)

(assert (=> d!39855 (=> res!63003 e!85229)))

(assert (=> d!39855 (= res!63003 (bvsge #b00000000000000000000000000000000 (size!2509 (_keys!4565 (v!3162 (underlying!448 thiss!992))))))))

(assert (=> d!39855 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4565 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992)))) e!85229)))

(declare-fun b!130674 () Bool)

(declare-fun e!85231 () Bool)

(declare-fun call!14231 () Bool)

(assert (=> b!130674 (= e!85231 call!14231)))

(declare-fun bm!14228 () Bool)

(assert (=> bm!14228 (= call!14231 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4565 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992)))))))

(declare-fun b!130675 () Bool)

(assert (=> b!130675 (= e!85230 e!85231)))

(declare-fun lt!68002 () (_ BitVec 64))

(assert (=> b!130675 (= lt!68002 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!68003 () Unit!4039)

(assert (=> b!130675 (= lt!68003 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4565 (v!3162 (underlying!448 thiss!992))) lt!68002 #b00000000000000000000000000000000))))

(assert (=> b!130675 (arrayContainsKey!0 (_keys!4565 (v!3162 (underlying!448 thiss!992))) lt!68002 #b00000000000000000000000000000000)))

(declare-fun lt!68004 () Unit!4039)

(assert (=> b!130675 (= lt!68004 lt!68003)))

(declare-fun res!63004 () Bool)

(assert (=> b!130675 (= res!63004 (= (seekEntryOrOpen!0 (select (arr!2243 (_keys!4565 (v!3162 (underlying!448 thiss!992)))) #b00000000000000000000000000000000) (_keys!4565 (v!3162 (underlying!448 thiss!992))) (mask!7102 (v!3162 (underlying!448 thiss!992)))) (Found!272 #b00000000000000000000000000000000)))))

(assert (=> b!130675 (=> (not res!63004) (not e!85231))))

(declare-fun b!130676 () Bool)

(assert (=> b!130676 (= e!85230 call!14231)))

(assert (= (and d!39855 (not res!63003)) b!130673))

(assert (= (and b!130673 c!24127) b!130675))

(assert (= (and b!130673 (not c!24127)) b!130676))

(assert (= (and b!130675 res!63004) b!130674))

(assert (= (or b!130674 b!130676) bm!14228))

(assert (=> b!130673 m!153045))

(assert (=> b!130673 m!153045))

(assert (=> b!130673 m!153047))

(declare-fun m!154137 () Bool)

(assert (=> bm!14228 m!154137))

(assert (=> b!130675 m!153045))

(declare-fun m!154139 () Bool)

(assert (=> b!130675 m!154139))

(declare-fun m!154141 () Bool)

(assert (=> b!130675 m!154141))

(assert (=> b!130675 m!153045))

(declare-fun m!154143 () Bool)

(assert (=> b!130675 m!154143))

(assert (=> b!129606 d!39855))

(declare-fun condMapEmpty!4583 () Bool)

(declare-fun mapDefault!4583 () ValueCell!1086)

(assert (=> mapNonEmpty!4581 (= condMapEmpty!4583 (= mapRest!4581 ((as const (Array (_ BitVec 32) ValueCell!1086)) mapDefault!4583)))))

(declare-fun e!85233 () Bool)

(declare-fun mapRes!4583 () Bool)

(assert (=> mapNonEmpty!4581 (= tp!11097 (and e!85233 mapRes!4583))))

(declare-fun b!130677 () Bool)

(declare-fun e!85232 () Bool)

(assert (=> b!130677 (= e!85232 tp_is_empty!2859)))

(declare-fun mapIsEmpty!4583 () Bool)

(assert (=> mapIsEmpty!4583 mapRes!4583))

(declare-fun b!130678 () Bool)

(assert (=> b!130678 (= e!85233 tp_is_empty!2859)))

(declare-fun mapNonEmpty!4583 () Bool)

(declare-fun tp!11099 () Bool)

(assert (=> mapNonEmpty!4583 (= mapRes!4583 (and tp!11099 e!85232))))

(declare-fun mapRest!4583 () (Array (_ BitVec 32) ValueCell!1086))

(declare-fun mapValue!4583 () ValueCell!1086)

(declare-fun mapKey!4583 () (_ BitVec 32))

(assert (=> mapNonEmpty!4583 (= mapRest!4581 (store mapRest!4583 mapKey!4583 mapValue!4583))))

(assert (= (and mapNonEmpty!4581 condMapEmpty!4583) mapIsEmpty!4583))

(assert (= (and mapNonEmpty!4581 (not condMapEmpty!4583)) mapNonEmpty!4583))

(assert (= (and mapNonEmpty!4583 ((_ is ValueCellFull!1086) mapValue!4583)) b!130677))

(assert (= (and mapNonEmpty!4581 ((_ is ValueCellFull!1086) mapDefault!4583)) b!130678))

(declare-fun m!154145 () Bool)

(assert (=> mapNonEmpty!4583 m!154145))

(declare-fun condMapEmpty!4584 () Bool)

(declare-fun mapDefault!4584 () ValueCell!1086)

(assert (=> mapNonEmpty!4582 (= condMapEmpty!4584 (= mapRest!4582 ((as const (Array (_ BitVec 32) ValueCell!1086)) mapDefault!4584)))))

(declare-fun e!85235 () Bool)

(declare-fun mapRes!4584 () Bool)

(assert (=> mapNonEmpty!4582 (= tp!11098 (and e!85235 mapRes!4584))))

(declare-fun b!130679 () Bool)

(declare-fun e!85234 () Bool)

(assert (=> b!130679 (= e!85234 tp_is_empty!2859)))

(declare-fun mapIsEmpty!4584 () Bool)

(assert (=> mapIsEmpty!4584 mapRes!4584))

(declare-fun b!130680 () Bool)

(assert (=> b!130680 (= e!85235 tp_is_empty!2859)))

(declare-fun mapNonEmpty!4584 () Bool)

(declare-fun tp!11100 () Bool)

(assert (=> mapNonEmpty!4584 (= mapRes!4584 (and tp!11100 e!85234))))

(declare-fun mapRest!4584 () (Array (_ BitVec 32) ValueCell!1086))

(declare-fun mapKey!4584 () (_ BitVec 32))

(declare-fun mapValue!4584 () ValueCell!1086)

(assert (=> mapNonEmpty!4584 (= mapRest!4582 (store mapRest!4584 mapKey!4584 mapValue!4584))))

(assert (= (and mapNonEmpty!4582 condMapEmpty!4584) mapIsEmpty!4584))

(assert (= (and mapNonEmpty!4582 (not condMapEmpty!4584)) mapNonEmpty!4584))

(assert (= (and mapNonEmpty!4584 ((_ is ValueCellFull!1086) mapValue!4584)) b!130679))

(assert (= (and mapNonEmpty!4582 ((_ is ValueCellFull!1086) mapDefault!4584)) b!130680))

(declare-fun m!154147 () Bool)

(assert (=> mapNonEmpty!4584 m!154147))

(declare-fun b_lambda!5795 () Bool)

(assert (= b_lambda!5785 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5795)))

(declare-fun b_lambda!5797 () Bool)

(assert (= b_lambda!5791 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5797)))

(declare-fun b_lambda!5799 () Bool)

(assert (= b_lambda!5787 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5799)))

(declare-fun b_lambda!5801 () Bool)

(assert (= b_lambda!5767 (or (and b!129225 b_free!2885) (and b!129213 b_free!2887 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))))) b_lambda!5801)))

(declare-fun b_lambda!5803 () Bool)

(assert (= b_lambda!5771 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5803)))

(declare-fun b_lambda!5805 () Bool)

(assert (= b_lambda!5773 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5805)))

(declare-fun b_lambda!5807 () Bool)

(assert (= b_lambda!5765 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5807)))

(declare-fun b_lambda!5809 () Bool)

(assert (= b_lambda!5777 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5809)))

(declare-fun b_lambda!5811 () Bool)

(assert (= b_lambda!5793 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5811)))

(declare-fun b_lambda!5813 () Bool)

(assert (= b_lambda!5769 (or (and b!129225 b_free!2885) (and b!129213 b_free!2887 (= (defaultEntry!2824 newMap!16) (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))))) b_lambda!5813)))

(declare-fun b_lambda!5815 () Bool)

(assert (= b_lambda!5781 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5815)))

(declare-fun b_lambda!5817 () Bool)

(assert (= b_lambda!5779 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5817)))

(declare-fun b_lambda!5819 () Bool)

(assert (= b_lambda!5789 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5819)))

(declare-fun b_lambda!5821 () Bool)

(assert (= b_lambda!5775 (or (and b!129225 b_free!2885 (= (defaultEntry!2824 (v!3162 (underlying!448 thiss!992))) (defaultEntry!2824 newMap!16))) (and b!129213 b_free!2887) b_lambda!5821)))

(check-sat (not b!130591) (not b!130444) (not b!130192) (not d!39559) (not b!129969) (not d!39691) (not b!130407) (not b!130323) (not b!129936) (not b_lambda!5755) (not b!130672) (not d!39555) (not b!129877) (not d!39761) (not b_lambda!5743) (not b!130577) (not b!130618) (not b_lambda!5761) (not b!130035) (not b!130043) (not b!130221) (not b!130428) (not b!130218) (not b!130511) (not b!129856) (not d!39441) (not b!130594) (not d!39389) (not b_lambda!5805) (not b!130001) (not d!39591) (not b!129850) (not b!130172) (not b!130581) (not b!130247) (not b!129994) (not b!129970) (not b!130337) (not b_next!2887) (not b!129920) (not b!130256) (not b!130053) (not b!130424) (not d!39817) (not d!39711) (not d!39783) (not b!130298) (not b_lambda!5757) (not b!130409) (not b!130663) (not d!39489) (not b!129996) (not b!130076) (not d!39709) (not b!130414) (not d!39673) (not b!130317) (not b!129922) (not b!130330) (not b_lambda!5783) (not bm!14141) (not d!39787) (not d!39747) (not b!130465) (not b!130614) (not d!39603) (not b!130599) (not d!39703) (not b!130263) (not bm!14169) (not b!130502) (not b!129947) (not b!130572) (not mapNonEmpty!4584) (not d!39405) (not b!129882) (not d!39675) (not b!129999) (not b!130457) (not bm!14132) (not b!130653) (not d!39485) (not d!39359) (not b_lambda!5819) (not d!39517) (not d!39375) (not d!39597) (not b!129878) (not b_lambda!5797) (not b!130402) (not bm!14206) (not b!130399) (not b!130244) (not b!129870) (not b!129853) (not b!129991) (not d!39437) (not d!39751) (not d!39461) (not mapNonEmpty!4583) (not b!130489) (not b!130205) (not b_lambda!5815) (not bm!14220) (not b!130243) (not b!130551) (not b!130458) (not b!129889) (not b!130548) (not b!130199) (not d!39627) (not d!39699) (not b!130160) (not d!39369) b_and!8089 (not b!129995) (not b!130514) (not d!39721) (not b!130520) (not b!130393) (not b!130459) (not d!39803) (not d!39789) (not d!39547) (not b!129987) (not d!39695) (not b!130188) (not b!130011) (not b!130509) (not d!39713) (not b!130480) (not bm!14154) (not d!39519) (not b!130347) (not d!39431) (not b!130077) (not b!130423) (not b!130028) (not bm!14167) b_and!8087 (not d!39427) (not d!39731) (not d!39589) (not b!129989) (not b!129880) (not b!130625) (not b!130589) (not bm!14148) (not b!130632) (not b!130645) (not d!39781) (not b!130296) (not b!130357) (not d!39667) (not d!39845) (not d!39361) (not b!129904) (not b!130531) (not bm!14210) (not b!130230) (not b!129940) (not b!130560) (not d!39827) (not b!130429) (not d!39623) (not b!130608) (not b!129890) (not b!130052) (not d!39413) (not b!130333) (not d!39813) (not b!129871) (not d!39465) (not b!130524) (not d!39601) (not d!39737) (not b!130432) (not b!130334) (not d!39809) (not bm!14228) (not d!39381) (not b!130191) (not b!129842) (not b!130141) (not d!39681) (not bm!14214) (not d!39617) (not b!130496) (not b!130652) (not d!39819) (not d!39793) (not d!39833) (not d!39625) (not b!130537) (not b_lambda!5739) (not b!130204) (not d!39637) (not b!130606) (not b_lambda!5801) (not b!130173) (not b!130421) (not b!130569) (not b!130163) (not b!130177) (not d!39779) (not b!130657) (not d!39575) (not d!39689) (not bm!14193) (not b!130310) (not bm!14127) (not d!39367) (not d!39541) (not b!130021) (not bm!14207) (not d!39697) (not b!130299) (not d!39511) (not b!129885) (not bm!14218) (not d!39401) (not d!39411) (not b!129865) (not b!130673) (not b!129897) (not b!130415) (not d!39371) (not b_lambda!5813) (not b!130041) (not b!130588) (not d!39419) (not b!130556) (not bm!14165) (not b!129958) (not b!130617) (not b!130488) (not b!130189) (not b!129986) (not b!129963) (not b_lambda!5795) (not b!130522) (not b!130166) (not d!39551) (not b!130463) (not bm!14140) (not b!130338) (not b!129932) (not b!129927) (not d!39421) (not b!130236) (not b!129863) (not b!130582) (not b!129990) (not d!39593) (not b!130125) (not b!130352) (not b!130643) (not d!39573) (not b!129896) (not d!39725) (not b!130418) (not b!129899) (not bm!14185) (not b!130176) (not d!39523) (not b!130307) (not bm!14194) (not d!39387) (not d!39685) (not b!130014) (not b!130460) (not b!130356) (not b!130535) (not b!130546) (not b!130110) (not d!39823) (not d!39605) (not d!39557) (not b!129937) (not b!130540) (not bm!14166) (not d!39715) (not b!130561) (not b!129893) (not b!130365) (not b!130124) (not b!130491) (not d!39407) (not b!130628) (not b!130598) (not b!129985) (not b!130306) (not b!130086) (not b!130439) (not d!39839) (not d!39439) (not d!39665) (not d!39545) (not b!129949) (not d!39729) (not b!130232) (not b!130038) (not d!39619) (not b!130311) (not b!130017) (not b!130157) (not d!39775) (not b!130264) (not d!39599) (not d!39467) (not b!130443) (not d!39417) (not d!39425) (not b!130002) (not d!39471) (not b_lambda!5799) (not b!130197) (not d!39583) (not b!130030) (not d!39569) (not b_lambda!5759) (not b!130140) (not b!130626) (not b!130476) (not b!130438) (not b!130481) (not b!130668) (not b!130083) (not b!130088) (not b!130596) (not b!130008) (not d!39717) (not b!129955) (not b!130004) (not b!129913) (not d!39661) (not b!130499) (not b_lambda!5763) (not d!39531) (not b!130510) (not bm!14151) (not bm!14144) (not d!39567) (not b!129965) (not b!130670) (not d!39543) (not b!130631) (not d!39613) (not b!130161) (not b!130345) (not d!39377) (not bm!14205) (not b!129982) (not b_lambda!5811) (not b!130650) (not b!130412) (not b!130142) (not b!130425) (not d!39355) (not d!39399) (not b!130578) (not b!130123) (not d!39645) (not b!129983) (not b!130151) (not b!130422) (not b!130120) (not b!130417) (not b!130145) (not b!130304) (not b!130455) (not d!39363) (not b!129886) (not b!130133) (not d!39797) (not d!39643) (not b!130040) (not bm!14131) (not bm!14215) (not d!39805) (not b!129908) (not b!130487) (not d!39799) (not b!130575) (not b!129852) (not b!130105) (not b!130208) (not bm!14201) (not d!39679) (not b!130090) (not b!130156) (not b!129916) (not d!39397) (not b!130563) (not bm!14178) (not b!130149) (not b!130223) (not bm!14137) (not d!39513) (not b!130634) (not bm!14147) (not b!130237) (not bm!14184) (not d!39507) (not b!130593) (not d!39843) (not d!39449) (not b!130224) (not bm!14136) (not b!130664) (not b!130360) (not b!130630) (not bm!14204) (not bm!14174) (not b!130341) (not b!129939) (not b!130557) (not b!130440) (not b!130442) (not b!130477) (not b!130216) (not d!39415) (not b!130012) (not b!130666) (not b!130410) (not b!130301) (not b!129875) (not b!130405) (not b!129954) (not b!130252) (not b!129967) (not b!129855) (not b!130180) (not bm!14153) (not bm!14200) (not bm!14128) (not b_lambda!5803) (not d!39759) (not d!39677) (not d!39851) (not b!129879) (not b!129931) (not d!39409) (not b!130527) (not b!129874) (not b!130131) (not d!39815) (not b!130453) (not bm!14225) (not b!130138) (not b!130446) (not d!39423) (not b!130613) (not b!130675) (not bm!14221) (not b!130462) (not b!130186) (not d!39687) (not b!130267) (not d!39739) (not bm!14135) (not d!39671) (not d!39707) (not b!130209) (not d!39615) (not b!130656) (not b!130170) (not d!39651) (not bm!14152) (not b!130469) (not b!130474) (not b!130327) (not b!130115) (not b!130454) (not bm!14146) (not b!130268) (not d!39821) (not d!39483) (not b!130225) (not d!39777) (not b!130518) (not d!39743) (not b!129928) (not b!130190) (not d!39829) (not b!130555) (not d!39459) (not b!129911) (not b!130592) (not d!39693) (not b!130117) (not d!39741) (not b!130544) (not b!130325) (not b!130320) (not b!130127) (not b_next!2885) (not b!130370) (not b!129993) (not b!130202) (not d!39527) (not d!39659) (not bm!14183) (not b!130400) (not b!129997) (not d!39607) (not d!39455) (not d!39577) (not b!130451) (not d!39383) (not bm!14222) (not d!39847) (not b!130597) (not b!130426) (not b!130005) (not bm!14139) (not b!130319) (not d!39641) (not b!130503) (not b!130215) (not b!130184) (not b!129943) (not b!130233) (not b!130420) (not d!39515) (not b!130368) (not b!129998) (not b!129883) (not d!39621) (not b!130046) (not b!130113) (not b_lambda!5817) (not b!130419) (not d!39463) (not bm!14170) (not d!39701) (not b!130570) (not d!39683) (not b!130408) (not b_lambda!5821) (not b!130566) (not bm!14161) (not d!39549) (not d!39429) (not b!129959) (not b!130640) (not b_lambda!5807) (not bm!14181) (not d!39433) (not d!39365) (not d!39373) (not b!130353) (not bm!14199) (not b!130249) (not d!39749) (not b!130448) (not b!130271) (not d!39435) (not b!130498) (not d!39853) (not bm!14197) (not d!39733) (not b!130493) (not d!39669) (not bm!14130) (not d!39723) (not b!129934) (not b!130490) (not bm!14171) (not b!130602) (not bm!14164) (not d!39785) (not b!130450) (not b!130553) (not d!39727) (not d!39445) (not d!39579) tp_is_empty!2859 (not b!130135) (not b!130416) (not b!130538) (not b!130452) (not b!130550) (not d!39585) (not b_lambda!5809) (not b!130009) (not b!130471) (not b!130431) (not d!39705) (not b!130227) (not bm!14175) (not b!129859) (not bm!14213) (not b!130558) (not b!129849) (not bm!14192) (not b!130647) (not b!130362) (not b!130175) (not b!129972) (not d!39811) (not d!39719) (not b!130669) (not b!130258) (not d!39481) (not b!130466) (not d!39473))
(check-sat b_and!8087 b_and!8089 (not b_next!2885) (not b_next!2887))
