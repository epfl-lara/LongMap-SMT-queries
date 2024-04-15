; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76104 () Bool)

(assert start!76104)

(declare-fun b!894130 () Bool)

(declare-fun b_free!15865 () Bool)

(declare-fun b_next!15865 () Bool)

(assert (=> b!894130 (= b_free!15865 (not b_next!15865))))

(declare-fun tp!55580 () Bool)

(declare-fun b_and!26125 () Bool)

(assert (=> b!894130 (= tp!55580 b_and!26125)))

(declare-fun b!894127 () Bool)

(declare-fun res!605217 () Bool)

(declare-fun e!499390 () Bool)

(assert (=> b!894127 (=> (not res!605217) (not e!499390))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!52357 0))(
  ( (array!52358 (arr!25181 (Array (_ BitVec 32) (_ BitVec 64))) (size!25629 (_ BitVec 32))) )
))
(declare-datatypes ((V!29223 0))(
  ( (V!29224 (val!9147 Int)) )
))
(declare-datatypes ((ValueCell!8615 0))(
  ( (ValueCellFull!8615 (v!11633 V!29223)) (EmptyCell!8615) )
))
(declare-datatypes ((array!52359 0))(
  ( (array!52360 (arr!25182 (Array (_ BitVec 32) ValueCell!8615)) (size!25630 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4246 0))(
  ( (LongMapFixedSize!4247 (defaultEntry!5335 Int) (mask!25885 (_ BitVec 32)) (extraKeys!5031 (_ BitVec 32)) (zeroValue!5135 V!29223) (minValue!5135 V!29223) (_size!2178 (_ BitVec 32)) (_keys!10027 array!52357) (_values!5322 array!52359) (_vacant!2178 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4246)

(assert (=> b!894127 (= res!605217 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!894128 () Bool)

(declare-fun e!499392 () Bool)

(declare-fun tp_is_empty!18193 () Bool)

(assert (=> b!894128 (= e!499392 tp_is_empty!18193)))

(declare-fun b!894129 () Bool)

(declare-fun dynLambda!1298 (Int (_ BitVec 64)) V!29223)

(declare-datatypes ((Option!461 0))(
  ( (Some!460 (v!11634 V!29223)) (None!459) )
))
(declare-fun get!13269 (Option!461) V!29223)

(declare-datatypes ((tuple2!12046 0))(
  ( (tuple2!12047 (_1!6034 (_ BitVec 64)) (_2!6034 V!29223)) )
))
(declare-datatypes ((List!17813 0))(
  ( (Nil!17810) (Cons!17809 (h!18942 tuple2!12046) (t!25139 List!17813)) )
))
(declare-fun getValueByKey!455 (List!17813 (_ BitVec 64)) Option!461)

(declare-datatypes ((ListLongMap!10733 0))(
  ( (ListLongMap!10734 (toList!5382 List!17813)) )
))
(declare-fun map!12209 (LongMapFixedSize!4246) ListLongMap!10733)

(assert (=> b!894129 (= e!499390 (not (= (dynLambda!1298 (defaultEntry!5335 thiss!1181) key!785) (get!13269 (getValueByKey!455 (toList!5382 (map!12209 thiss!1181)) key!785)))))))

(declare-fun mapIsEmpty!28860 () Bool)

(declare-fun mapRes!28860 () Bool)

(assert (=> mapIsEmpty!28860 mapRes!28860))

(declare-fun e!499389 () Bool)

(declare-fun e!499391 () Bool)

(declare-fun array_inv!19830 (array!52357) Bool)

(declare-fun array_inv!19831 (array!52359) Bool)

(assert (=> b!894130 (= e!499391 (and tp!55580 tp_is_empty!18193 (array_inv!19830 (_keys!10027 thiss!1181)) (array_inv!19831 (_values!5322 thiss!1181)) e!499389))))

(declare-fun b!894131 () Bool)

(declare-fun e!499394 () Bool)

(assert (=> b!894131 (= e!499394 tp_is_empty!18193)))

(declare-fun res!605219 () Bool)

(assert (=> start!76104 (=> (not res!605219) (not e!499390))))

(declare-fun valid!1649 (LongMapFixedSize!4246) Bool)

(assert (=> start!76104 (= res!605219 (valid!1649 thiss!1181))))

(assert (=> start!76104 e!499390))

(assert (=> start!76104 e!499391))

(assert (=> start!76104 true))

(declare-fun b!894132 () Bool)

(declare-fun res!605218 () Bool)

(assert (=> b!894132 (=> (not res!605218) (not e!499390))))

(declare-fun contains!4362 (LongMapFixedSize!4246 (_ BitVec 64)) Bool)

(assert (=> b!894132 (= res!605218 (contains!4362 thiss!1181 key!785))))

(declare-fun mapNonEmpty!28860 () Bool)

(declare-fun tp!55581 () Bool)

(assert (=> mapNonEmpty!28860 (= mapRes!28860 (and tp!55581 e!499394))))

(declare-fun mapKey!28860 () (_ BitVec 32))

(declare-fun mapValue!28860 () ValueCell!8615)

(declare-fun mapRest!28860 () (Array (_ BitVec 32) ValueCell!8615))

(assert (=> mapNonEmpty!28860 (= (arr!25182 (_values!5322 thiss!1181)) (store mapRest!28860 mapKey!28860 mapValue!28860))))

(declare-fun b!894133 () Bool)

(assert (=> b!894133 (= e!499389 (and e!499392 mapRes!28860))))

(declare-fun condMapEmpty!28860 () Bool)

(declare-fun mapDefault!28860 () ValueCell!8615)

(assert (=> b!894133 (= condMapEmpty!28860 (= (arr!25182 (_values!5322 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8615)) mapDefault!28860)))))

(assert (= (and start!76104 res!605219) b!894127))

(assert (= (and b!894127 res!605217) b!894132))

(assert (= (and b!894132 res!605218) b!894129))

(assert (= (and b!894133 condMapEmpty!28860) mapIsEmpty!28860))

(assert (= (and b!894133 (not condMapEmpty!28860)) mapNonEmpty!28860))

(get-info :version)

(assert (= (and mapNonEmpty!28860 ((_ is ValueCellFull!8615) mapValue!28860)) b!894131))

(assert (= (and b!894133 ((_ is ValueCellFull!8615) mapDefault!28860)) b!894128))

(assert (= b!894130 b!894133))

(assert (= start!76104 b!894130))

(declare-fun b_lambda!12933 () Bool)

(assert (=> (not b_lambda!12933) (not b!894129)))

(declare-fun t!25138 () Bool)

(declare-fun tb!5177 () Bool)

(assert (=> (and b!894130 (= (defaultEntry!5335 thiss!1181) (defaultEntry!5335 thiss!1181)) t!25138) tb!5177))

(declare-fun result!10077 () Bool)

(assert (=> tb!5177 (= result!10077 tp_is_empty!18193)))

(assert (=> b!894129 t!25138))

(declare-fun b_and!26127 () Bool)

(assert (= b_and!26125 (and (=> t!25138 result!10077) b_and!26127)))

(declare-fun m!831691 () Bool)

(assert (=> b!894130 m!831691))

(declare-fun m!831693 () Bool)

(assert (=> b!894130 m!831693))

(declare-fun m!831695 () Bool)

(assert (=> start!76104 m!831695))

(declare-fun m!831697 () Bool)

(assert (=> mapNonEmpty!28860 m!831697))

(declare-fun m!831699 () Bool)

(assert (=> b!894132 m!831699))

(declare-fun m!831701 () Bool)

(assert (=> b!894129 m!831701))

(declare-fun m!831703 () Bool)

(assert (=> b!894129 m!831703))

(declare-fun m!831705 () Bool)

(assert (=> b!894129 m!831705))

(assert (=> b!894129 m!831705))

(declare-fun m!831707 () Bool)

(assert (=> b!894129 m!831707))

(check-sat (not mapNonEmpty!28860) tp_is_empty!18193 (not b_next!15865) (not b_lambda!12933) (not b!894130) (not b!894132) (not b!894129) b_and!26127 (not start!76104))
(check-sat b_and!26127 (not b_next!15865))
(get-model)

(declare-fun b_lambda!12939 () Bool)

(assert (= b_lambda!12933 (or (and b!894130 b_free!15865) b_lambda!12939)))

(check-sat (not mapNonEmpty!28860) tp_is_empty!18193 (not b_next!15865) (not b!894130) (not b_lambda!12939) (not b!894132) (not b!894129) b_and!26127 (not start!76104))
(check-sat b_and!26127 (not b_next!15865))
(get-model)

(declare-fun d!110441 () Bool)

(assert (=> d!110441 (= (get!13269 (getValueByKey!455 (toList!5382 (map!12209 thiss!1181)) key!785)) (v!11634 (getValueByKey!455 (toList!5382 (map!12209 thiss!1181)) key!785)))))

(assert (=> b!894129 d!110441))

(declare-fun d!110443 () Bool)

(declare-fun c!94319 () Bool)

(assert (=> d!110443 (= c!94319 (and ((_ is Cons!17809) (toList!5382 (map!12209 thiss!1181))) (= (_1!6034 (h!18942 (toList!5382 (map!12209 thiss!1181)))) key!785)))))

(declare-fun e!499435 () Option!461)

(assert (=> d!110443 (= (getValueByKey!455 (toList!5382 (map!12209 thiss!1181)) key!785) e!499435)))

(declare-fun b!894190 () Bool)

(assert (=> b!894190 (= e!499435 (Some!460 (_2!6034 (h!18942 (toList!5382 (map!12209 thiss!1181))))))))

(declare-fun b!894191 () Bool)

(declare-fun e!499436 () Option!461)

(assert (=> b!894191 (= e!499435 e!499436)))

(declare-fun c!94320 () Bool)

(assert (=> b!894191 (= c!94320 (and ((_ is Cons!17809) (toList!5382 (map!12209 thiss!1181))) (not (= (_1!6034 (h!18942 (toList!5382 (map!12209 thiss!1181)))) key!785))))))

(declare-fun b!894192 () Bool)

(assert (=> b!894192 (= e!499436 (getValueByKey!455 (t!25139 (toList!5382 (map!12209 thiss!1181))) key!785))))

(declare-fun b!894193 () Bool)

(assert (=> b!894193 (= e!499436 None!459)))

(assert (= (and d!110443 c!94319) b!894190))

(assert (= (and d!110443 (not c!94319)) b!894191))

(assert (= (and b!894191 c!94320) b!894192))

(assert (= (and b!894191 (not c!94320)) b!894193))

(declare-fun m!831745 () Bool)

(assert (=> b!894192 m!831745))

(assert (=> b!894129 d!110443))

(declare-fun d!110445 () Bool)

(declare-fun getCurrentListMap!2601 (array!52357 array!52359 (_ BitVec 32) (_ BitVec 32) V!29223 V!29223 (_ BitVec 32) Int) ListLongMap!10733)

(assert (=> d!110445 (= (map!12209 thiss!1181) (getCurrentListMap!2601 (_keys!10027 thiss!1181) (_values!5322 thiss!1181) (mask!25885 thiss!1181) (extraKeys!5031 thiss!1181) (zeroValue!5135 thiss!1181) (minValue!5135 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5335 thiss!1181)))))

(declare-fun bs!25090 () Bool)

(assert (= bs!25090 d!110445))

(declare-fun m!831747 () Bool)

(assert (=> bs!25090 m!831747))

(assert (=> b!894129 d!110445))

(declare-fun b!894214 () Bool)

(declare-datatypes ((Unit!30394 0))(
  ( (Unit!30395) )
))
(declare-fun e!499447 () Unit!30394)

(declare-fun Unit!30396 () Unit!30394)

(assert (=> b!894214 (= e!499447 Unit!30396)))

(declare-fun b!894215 () Bool)

(assert (=> b!894215 false))

(declare-fun lt!404034 () Unit!30394)

(declare-fun lt!404035 () Unit!30394)

(assert (=> b!894215 (= lt!404034 lt!404035)))

(declare-datatypes ((SeekEntryResult!8872 0))(
  ( (MissingZero!8872 (index!37859 (_ BitVec 32))) (Found!8872 (index!37860 (_ BitVec 32))) (Intermediate!8872 (undefined!9684 Bool) (index!37861 (_ BitVec 32)) (x!76039 (_ BitVec 32))) (Undefined!8872) (MissingVacant!8872 (index!37862 (_ BitVec 32))) )
))
(declare-fun lt!404039 () SeekEntryResult!8872)

(declare-fun lt!404040 () (_ BitVec 32))

(assert (=> b!894215 (and ((_ is Found!8872) lt!404039) (= (index!37860 lt!404039) lt!404040))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52357 (_ BitVec 32)) SeekEntryResult!8872)

(assert (=> b!894215 (= lt!404039 (seekEntry!0 key!785 (_keys!10027 thiss!1181) (mask!25885 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52357 (_ BitVec 32)) Unit!30394)

(assert (=> b!894215 (= lt!404035 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!404040 (_keys!10027 thiss!1181) (mask!25885 thiss!1181)))))

(declare-fun lt!404048 () Unit!30394)

(declare-fun lt!404041 () Unit!30394)

(assert (=> b!894215 (= lt!404048 lt!404041)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52357 (_ BitVec 32)) Bool)

(assert (=> b!894215 (arrayForallSeekEntryOrOpenFound!0 lt!404040 (_keys!10027 thiss!1181) (mask!25885 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30394)

(assert (=> b!894215 (= lt!404041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10027 thiss!1181) (mask!25885 thiss!1181) #b00000000000000000000000000000000 lt!404040))))

(declare-fun arrayScanForKey!0 (array!52357 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894215 (= lt!404040 (arrayScanForKey!0 (_keys!10027 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!404036 () Unit!30394)

(declare-fun lt!404042 () Unit!30394)

(assert (=> b!894215 (= lt!404036 lt!404042)))

(declare-fun e!499449 () Bool)

(assert (=> b!894215 e!499449))

(declare-fun c!94333 () Bool)

(assert (=> b!894215 (= c!94333 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!171 (array!52357 array!52359 (_ BitVec 32) (_ BitVec 32) V!29223 V!29223 (_ BitVec 64) Int) Unit!30394)

(assert (=> b!894215 (= lt!404042 (lemmaKeyInListMapIsInArray!171 (_keys!10027 thiss!1181) (_values!5322 thiss!1181) (mask!25885 thiss!1181) (extraKeys!5031 thiss!1181) (zeroValue!5135 thiss!1181) (minValue!5135 thiss!1181) key!785 (defaultEntry!5335 thiss!1181)))))

(declare-fun Unit!30397 () Unit!30394)

(assert (=> b!894215 (= e!499447 Unit!30397)))

(declare-fun bm!39687 () Bool)

(declare-fun call!39692 () ListLongMap!10733)

(assert (=> bm!39687 (= call!39692 (getCurrentListMap!2601 (_keys!10027 thiss!1181) (_values!5322 thiss!1181) (mask!25885 thiss!1181) (extraKeys!5031 thiss!1181) (zeroValue!5135 thiss!1181) (minValue!5135 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5335 thiss!1181)))))

(declare-fun b!894216 () Bool)

(declare-fun e!499451 () Bool)

(declare-fun e!499450 () Bool)

(assert (=> b!894216 (= e!499451 e!499450)))

(declare-fun c!94334 () Bool)

(assert (=> b!894216 (= c!94334 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39688 () Bool)

(declare-fun call!39691 () Bool)

(declare-fun arrayContainsKey!0 (array!52357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39688 (= call!39691 (arrayContainsKey!0 (_keys!10027 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun call!39690 () Bool)

(declare-fun bm!39689 () Bool)

(declare-fun lt!404045 () SeekEntryResult!8872)

(declare-fun c!94332 () Bool)

(declare-fun contains!4363 (ListLongMap!10733 (_ BitVec 64)) Bool)

(assert (=> bm!39689 (= call!39690 (contains!4363 call!39692 (ite c!94332 (select (arr!25181 (_keys!10027 thiss!1181)) (index!37860 lt!404045)) key!785)))))

(declare-fun b!894217 () Bool)

(declare-fun e!499448 () Bool)

(assert (=> b!894217 (= e!499448 true)))

(declare-fun lt!404047 () Unit!30394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52357 (_ BitVec 64) (_ BitVec 32)) Unit!30394)

(assert (=> b!894217 (= lt!404047 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10027 thiss!1181) key!785 (index!37860 lt!404045)))))

(assert (=> b!894217 call!39691))

(declare-fun lt!404043 () Unit!30394)

(assert (=> b!894217 (= lt!404043 lt!404047)))

(declare-fun lt!404037 () Unit!30394)

(declare-fun lemmaValidKeyInArrayIsInListMap!237 (array!52357 array!52359 (_ BitVec 32) (_ BitVec 32) V!29223 V!29223 (_ BitVec 32) Int) Unit!30394)

(assert (=> b!894217 (= lt!404037 (lemmaValidKeyInArrayIsInListMap!237 (_keys!10027 thiss!1181) (_values!5322 thiss!1181) (mask!25885 thiss!1181) (extraKeys!5031 thiss!1181) (zeroValue!5135 thiss!1181) (minValue!5135 thiss!1181) (index!37860 lt!404045) (defaultEntry!5335 thiss!1181)))))

(assert (=> b!894217 call!39690))

(declare-fun lt!404044 () Unit!30394)

(assert (=> b!894217 (= lt!404044 lt!404037)))

(declare-fun b!894218 () Bool)

(assert (=> b!894218 (= c!94332 ((_ is Found!8872) lt!404045))))

(assert (=> b!894218 (= lt!404045 (seekEntry!0 key!785 (_keys!10027 thiss!1181) (mask!25885 thiss!1181)))))

(assert (=> b!894218 (= e!499450 e!499448)))

(declare-fun b!894220 () Bool)

(assert (=> b!894220 (= e!499450 (not (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!894221 () Bool)

(assert (=> b!894221 (= e!499449 call!39691)))

(declare-fun b!894222 () Bool)

(assert (=> b!894222 (= e!499448 false)))

(declare-fun c!94335 () Bool)

(assert (=> b!894222 (= c!94335 call!39690)))

(declare-fun lt!404046 () Unit!30394)

(assert (=> b!894222 (= lt!404046 e!499447)))

(declare-fun b!894223 () Bool)

(assert (=> b!894223 (= e!499449 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!894219 () Bool)

(assert (=> b!894219 (= e!499451 (not (= (bvand (extraKeys!5031 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!110447 () Bool)

(declare-fun lt!404038 () Bool)

(assert (=> d!110447 (= lt!404038 (contains!4363 (map!12209 thiss!1181) key!785))))

(assert (=> d!110447 (= lt!404038 e!499451)))

(declare-fun c!94331 () Bool)

(assert (=> d!110447 (= c!94331 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110447 (valid!1649 thiss!1181)))

(assert (=> d!110447 (= (contains!4362 thiss!1181 key!785) lt!404038)))

(assert (= (and d!110447 c!94331) b!894219))

(assert (= (and d!110447 (not c!94331)) b!894216))

(assert (= (and b!894216 c!94334) b!894220))

(assert (= (and b!894216 (not c!94334)) b!894218))

(assert (= (and b!894218 c!94332) b!894217))

(assert (= (and b!894218 (not c!94332)) b!894222))

(assert (= (and b!894222 c!94335) b!894215))

(assert (= (and b!894222 (not c!94335)) b!894214))

(assert (= (and b!894215 c!94333) b!894221))

(assert (= (and b!894215 (not c!94333)) b!894223))

(assert (= (or b!894217 b!894221) bm!39688))

(assert (= (or b!894217 b!894222) bm!39687))

(assert (= (or b!894217 b!894222) bm!39689))

(declare-fun m!831749 () Bool)

(assert (=> bm!39689 m!831749))

(declare-fun m!831751 () Bool)

(assert (=> bm!39689 m!831751))

(assert (=> d!110447 m!831703))

(assert (=> d!110447 m!831703))

(declare-fun m!831753 () Bool)

(assert (=> d!110447 m!831753))

(assert (=> d!110447 m!831695))

(declare-fun m!831755 () Bool)

(assert (=> bm!39688 m!831755))

(declare-fun m!831757 () Bool)

(assert (=> b!894215 m!831757))

(declare-fun m!831759 () Bool)

(assert (=> b!894215 m!831759))

(declare-fun m!831761 () Bool)

(assert (=> b!894215 m!831761))

(declare-fun m!831763 () Bool)

(assert (=> b!894215 m!831763))

(declare-fun m!831765 () Bool)

(assert (=> b!894215 m!831765))

(declare-fun m!831767 () Bool)

(assert (=> b!894215 m!831767))

(declare-fun m!831769 () Bool)

(assert (=> b!894217 m!831769))

(declare-fun m!831771 () Bool)

(assert (=> b!894217 m!831771))

(assert (=> b!894218 m!831757))

(assert (=> bm!39687 m!831747))

(assert (=> b!894132 d!110447))

(declare-fun d!110449 () Bool)

(assert (=> d!110449 (= (array_inv!19830 (_keys!10027 thiss!1181)) (bvsge (size!25629 (_keys!10027 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894130 d!110449))

(declare-fun d!110451 () Bool)

(assert (=> d!110451 (= (array_inv!19831 (_values!5322 thiss!1181)) (bvsge (size!25630 (_values!5322 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894130 d!110451))

(declare-fun d!110453 () Bool)

(declare-fun res!605244 () Bool)

(declare-fun e!499454 () Bool)

(assert (=> d!110453 (=> (not res!605244) (not e!499454))))

(declare-fun simpleValid!299 (LongMapFixedSize!4246) Bool)

(assert (=> d!110453 (= res!605244 (simpleValid!299 thiss!1181))))

(assert (=> d!110453 (= (valid!1649 thiss!1181) e!499454)))

(declare-fun b!894230 () Bool)

(declare-fun res!605245 () Bool)

(assert (=> b!894230 (=> (not res!605245) (not e!499454))))

(declare-fun arrayCountValidKeys!0 (array!52357 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894230 (= res!605245 (= (arrayCountValidKeys!0 (_keys!10027 thiss!1181) #b00000000000000000000000000000000 (size!25629 (_keys!10027 thiss!1181))) (_size!2178 thiss!1181)))))

(declare-fun b!894231 () Bool)

(declare-fun res!605246 () Bool)

(assert (=> b!894231 (=> (not res!605246) (not e!499454))))

(assert (=> b!894231 (= res!605246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10027 thiss!1181) (mask!25885 thiss!1181)))))

(declare-fun b!894232 () Bool)

(declare-datatypes ((List!17814 0))(
  ( (Nil!17811) (Cons!17810 (h!18943 (_ BitVec 64)) (t!25144 List!17814)) )
))
(declare-fun arrayNoDuplicates!0 (array!52357 (_ BitVec 32) List!17814) Bool)

(assert (=> b!894232 (= e!499454 (arrayNoDuplicates!0 (_keys!10027 thiss!1181) #b00000000000000000000000000000000 Nil!17811))))

(assert (= (and d!110453 res!605244) b!894230))

(assert (= (and b!894230 res!605245) b!894231))

(assert (= (and b!894231 res!605246) b!894232))

(declare-fun m!831773 () Bool)

(assert (=> d!110453 m!831773))

(declare-fun m!831775 () Bool)

(assert (=> b!894230 m!831775))

(declare-fun m!831777 () Bool)

(assert (=> b!894231 m!831777))

(declare-fun m!831779 () Bool)

(assert (=> b!894232 m!831779))

(assert (=> start!76104 d!110453))

(declare-fun mapNonEmpty!28869 () Bool)

(declare-fun mapRes!28869 () Bool)

(declare-fun tp!55596 () Bool)

(declare-fun e!499460 () Bool)

(assert (=> mapNonEmpty!28869 (= mapRes!28869 (and tp!55596 e!499460))))

(declare-fun mapValue!28869 () ValueCell!8615)

(declare-fun mapKey!28869 () (_ BitVec 32))

(declare-fun mapRest!28869 () (Array (_ BitVec 32) ValueCell!8615))

(assert (=> mapNonEmpty!28869 (= mapRest!28860 (store mapRest!28869 mapKey!28869 mapValue!28869))))

(declare-fun b!894239 () Bool)

(assert (=> b!894239 (= e!499460 tp_is_empty!18193)))

(declare-fun mapIsEmpty!28869 () Bool)

(assert (=> mapIsEmpty!28869 mapRes!28869))

(declare-fun condMapEmpty!28869 () Bool)

(declare-fun mapDefault!28869 () ValueCell!8615)

(assert (=> mapNonEmpty!28860 (= condMapEmpty!28869 (= mapRest!28860 ((as const (Array (_ BitVec 32) ValueCell!8615)) mapDefault!28869)))))

(declare-fun e!499459 () Bool)

(assert (=> mapNonEmpty!28860 (= tp!55581 (and e!499459 mapRes!28869))))

(declare-fun b!894240 () Bool)

(assert (=> b!894240 (= e!499459 tp_is_empty!18193)))

(assert (= (and mapNonEmpty!28860 condMapEmpty!28869) mapIsEmpty!28869))

(assert (= (and mapNonEmpty!28860 (not condMapEmpty!28869)) mapNonEmpty!28869))

(assert (= (and mapNonEmpty!28869 ((_ is ValueCellFull!8615) mapValue!28869)) b!894239))

(assert (= (and mapNonEmpty!28860 ((_ is ValueCellFull!8615) mapDefault!28869)) b!894240))

(declare-fun m!831781 () Bool)

(assert (=> mapNonEmpty!28869 m!831781))

(check-sat (not bm!39688) (not mapNonEmpty!28869) (not d!110445) (not b!894215) (not b!894231) (not b!894217) (not b!894192) (not bm!39687) b_and!26127 (not b_lambda!12939) (not d!110447) (not b!894232) (not d!110453) tp_is_empty!18193 (not bm!39689) (not b_next!15865) (not b!894218) (not b!894230))
(check-sat b_and!26127 (not b_next!15865))
