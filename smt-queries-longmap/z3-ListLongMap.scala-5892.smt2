; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75920 () Bool)

(assert start!75920)

(declare-fun b!893094 () Bool)

(declare-fun b_free!15853 () Bool)

(declare-fun b_next!15853 () Bool)

(assert (=> b!893094 (= b_free!15853 (not b_next!15853))))

(declare-fun tp!55534 () Bool)

(declare-fun b_and!26089 () Bool)

(assert (=> b!893094 (= tp!55534 b_and!26089)))

(declare-fun b!893089 () Bool)

(declare-fun e!498731 () Bool)

(declare-fun tp_is_empty!18181 () Bool)

(assert (=> b!893089 (= e!498731 tp_is_empty!18181)))

(declare-fun b!893090 () Bool)

(declare-fun res!604865 () Bool)

(declare-fun e!498737 () Bool)

(assert (=> b!893090 (=> (not res!604865) (not e!498737))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!52329 0))(
  ( (array!52330 (arr!25169 (Array (_ BitVec 32) (_ BitVec 64))) (size!25615 (_ BitVec 32))) )
))
(declare-datatypes ((V!29207 0))(
  ( (V!29208 (val!9141 Int)) )
))
(declare-datatypes ((ValueCell!8609 0))(
  ( (ValueCellFull!8609 (v!11619 V!29207)) (EmptyCell!8609) )
))
(declare-datatypes ((array!52331 0))(
  ( (array!52332 (arr!25170 (Array (_ BitVec 32) ValueCell!8609)) (size!25616 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4234 0))(
  ( (LongMapFixedSize!4235 (defaultEntry!5317 Int) (mask!25841 (_ BitVec 32)) (extraKeys!5013 (_ BitVec 32)) (zeroValue!5117 V!29207) (minValue!5117 V!29207) (_size!2172 (_ BitVec 32)) (_keys!9999 array!52329) (_values!5304 array!52331) (_vacant!2172 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4234)

(assert (=> b!893090 (= res!604865 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!893091 () Bool)

(declare-fun e!498735 () Bool)

(assert (=> b!893091 (= e!498735 tp_is_empty!18181)))

(declare-fun b!893092 () Bool)

(declare-fun e!498732 () Bool)

(declare-datatypes ((Option!455 0))(
  ( (Some!454 (v!11620 V!29207)) (None!453) )
))
(declare-fun get!13253 (Option!455) V!29207)

(declare-datatypes ((tuple2!12034 0))(
  ( (tuple2!12035 (_1!6028 (_ BitVec 64)) (_2!6028 V!29207)) )
))
(declare-datatypes ((List!17805 0))(
  ( (Nil!17802) (Cons!17801 (h!18932 tuple2!12034) (t!25115 List!17805)) )
))
(declare-fun getValueByKey!449 (List!17805 (_ BitVec 64)) Option!455)

(declare-datatypes ((ListLongMap!10721 0))(
  ( (ListLongMap!10722 (toList!5376 List!17805)) )
))
(declare-fun map!12199 (LongMapFixedSize!4234) ListLongMap!10721)

(assert (=> b!893092 (= e!498732 (not (= (zeroValue!5117 thiss!1181) (get!13253 (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785)))))))

(declare-fun b!893093 () Bool)

(declare-fun dynLambda!1293 (Int (_ BitVec 64)) V!29207)

(assert (=> b!893093 (= e!498732 (not (= (zeroValue!5117 thiss!1181) (dynLambda!1293 (defaultEntry!5317 thiss!1181) key!785))))))

(declare-fun e!498736 () Bool)

(declare-fun e!498733 () Bool)

(declare-fun array_inv!19824 (array!52329) Bool)

(declare-fun array_inv!19825 (array!52331) Bool)

(assert (=> b!893094 (= e!498733 (and tp!55534 tp_is_empty!18181 (array_inv!19824 (_keys!9999 thiss!1181)) (array_inv!19825 (_values!5304 thiss!1181)) e!498736))))

(declare-fun res!604866 () Bool)

(assert (=> start!75920 (=> (not res!604866) (not e!498737))))

(declare-fun valid!1643 (LongMapFixedSize!4234) Bool)

(assert (=> start!75920 (= res!604866 (valid!1643 thiss!1181))))

(assert (=> start!75920 e!498737))

(assert (=> start!75920 e!498733))

(assert (=> start!75920 true))

(declare-fun b!893095 () Bool)

(declare-fun mapRes!28832 () Bool)

(assert (=> b!893095 (= e!498736 (and e!498731 mapRes!28832))))

(declare-fun condMapEmpty!28832 () Bool)

(declare-fun mapDefault!28832 () ValueCell!8609)

(assert (=> b!893095 (= condMapEmpty!28832 (= (arr!25170 (_values!5304 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8609)) mapDefault!28832)))))

(declare-fun mapNonEmpty!28832 () Bool)

(declare-fun tp!55535 () Bool)

(assert (=> mapNonEmpty!28832 (= mapRes!28832 (and tp!55535 e!498735))))

(declare-fun mapValue!28832 () ValueCell!8609)

(declare-fun mapRest!28832 () (Array (_ BitVec 32) ValueCell!8609))

(declare-fun mapKey!28832 () (_ BitVec 32))

(assert (=> mapNonEmpty!28832 (= (arr!25170 (_values!5304 thiss!1181)) (store mapRest!28832 mapKey!28832 mapValue!28832))))

(declare-fun b!893096 () Bool)

(assert (=> b!893096 (= e!498737 e!498732)))

(declare-fun c!94027 () Bool)

(declare-fun contains!4352 (LongMapFixedSize!4234 (_ BitVec 64)) Bool)

(assert (=> b!893096 (= c!94027 (contains!4352 thiss!1181 key!785))))

(declare-fun mapIsEmpty!28832 () Bool)

(assert (=> mapIsEmpty!28832 mapRes!28832))

(assert (= (and start!75920 res!604866) b!893090))

(assert (= (and b!893090 res!604865) b!893096))

(assert (= (and b!893096 c!94027) b!893092))

(assert (= (and b!893096 (not c!94027)) b!893093))

(assert (= (and b!893095 condMapEmpty!28832) mapIsEmpty!28832))

(assert (= (and b!893095 (not condMapEmpty!28832)) mapNonEmpty!28832))

(get-info :version)

(assert (= (and mapNonEmpty!28832 ((_ is ValueCellFull!8609) mapValue!28832)) b!893091))

(assert (= (and b!893095 ((_ is ValueCellFull!8609) mapDefault!28832)) b!893089))

(assert (= b!893094 b!893095))

(assert (= start!75920 b!893094))

(declare-fun b_lambda!12893 () Bool)

(assert (=> (not b_lambda!12893) (not b!893093)))

(declare-fun t!25114 () Bool)

(declare-fun tb!5161 () Bool)

(assert (=> (and b!893094 (= (defaultEntry!5317 thiss!1181) (defaultEntry!5317 thiss!1181)) t!25114) tb!5161))

(declare-fun result!10045 () Bool)

(assert (=> tb!5161 (= result!10045 tp_is_empty!18181)))

(assert (=> b!893093 t!25114))

(declare-fun b_and!26091 () Bool)

(assert (= b_and!26089 (and (=> t!25114 result!10045) b_and!26091)))

(declare-fun m!830643 () Bool)

(assert (=> b!893092 m!830643))

(declare-fun m!830645 () Bool)

(assert (=> b!893092 m!830645))

(assert (=> b!893092 m!830645))

(declare-fun m!830647 () Bool)

(assert (=> b!893092 m!830647))

(declare-fun m!830649 () Bool)

(assert (=> start!75920 m!830649))

(declare-fun m!830651 () Bool)

(assert (=> mapNonEmpty!28832 m!830651))

(declare-fun m!830653 () Bool)

(assert (=> b!893094 m!830653))

(declare-fun m!830655 () Bool)

(assert (=> b!893094 m!830655))

(declare-fun m!830657 () Bool)

(assert (=> b!893096 m!830657))

(declare-fun m!830659 () Bool)

(assert (=> b!893093 m!830659))

(check-sat (not mapNonEmpty!28832) (not b_next!15853) (not start!75920) (not b!893092) b_and!26091 (not b!893094) tp_is_empty!18181 (not b_lambda!12893) (not b!893096))
(check-sat b_and!26091 (not b_next!15853))
(get-model)

(declare-fun b_lambda!12899 () Bool)

(assert (= b_lambda!12893 (or (and b!893094 b_free!15853) b_lambda!12899)))

(check-sat (not mapNonEmpty!28832) (not b_next!15853) (not start!75920) (not b!893092) (not b_lambda!12899) b_and!26091 (not b!893094) (not b!893096) tp_is_empty!18181)
(check-sat b_and!26091 (not b_next!15853))
(get-model)

(declare-fun d!110105 () Bool)

(assert (=> d!110105 (= (get!13253 (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785)) (v!11620 (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785)))))

(assert (=> b!893092 d!110105))

(declare-fun d!110107 () Bool)

(declare-fun c!94038 () Bool)

(assert (=> d!110107 (= c!94038 (and ((_ is Cons!17801) (toList!5376 (map!12199 thiss!1181))) (= (_1!6028 (h!18932 (toList!5376 (map!12199 thiss!1181)))) key!785)))))

(declare-fun e!498784 () Option!455)

(assert (=> d!110107 (= (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785) e!498784)))

(declare-fun b!893159 () Bool)

(assert (=> b!893159 (= e!498784 (Some!454 (_2!6028 (h!18932 (toList!5376 (map!12199 thiss!1181))))))))

(declare-fun b!893162 () Bool)

(declare-fun e!498785 () Option!455)

(assert (=> b!893162 (= e!498785 None!453)))

(declare-fun b!893160 () Bool)

(assert (=> b!893160 (= e!498784 e!498785)))

(declare-fun c!94039 () Bool)

(assert (=> b!893160 (= c!94039 (and ((_ is Cons!17801) (toList!5376 (map!12199 thiss!1181))) (not (= (_1!6028 (h!18932 (toList!5376 (map!12199 thiss!1181)))) key!785))))))

(declare-fun b!893161 () Bool)

(assert (=> b!893161 (= e!498785 (getValueByKey!449 (t!25115 (toList!5376 (map!12199 thiss!1181))) key!785))))

(assert (= (and d!110107 c!94038) b!893159))

(assert (= (and d!110107 (not c!94038)) b!893160))

(assert (= (and b!893160 c!94039) b!893161))

(assert (= (and b!893160 (not c!94039)) b!893162))

(declare-fun m!830697 () Bool)

(assert (=> b!893161 m!830697))

(assert (=> b!893092 d!110107))

(declare-fun d!110109 () Bool)

(declare-fun getCurrentListMap!2599 (array!52329 array!52331 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 32) Int) ListLongMap!10721)

(assert (=> d!110109 (= (map!12199 thiss!1181) (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun bs!25040 () Bool)

(assert (= bs!25040 d!110109))

(declare-fun m!830699 () Bool)

(assert (=> bs!25040 m!830699))

(assert (=> b!893092 d!110109))

(declare-fun d!110111 () Bool)

(declare-fun res!604885 () Bool)

(declare-fun e!498788 () Bool)

(assert (=> d!110111 (=> (not res!604885) (not e!498788))))

(declare-fun simpleValid!297 (LongMapFixedSize!4234) Bool)

(assert (=> d!110111 (= res!604885 (simpleValid!297 thiss!1181))))

(assert (=> d!110111 (= (valid!1643 thiss!1181) e!498788)))

(declare-fun b!893169 () Bool)

(declare-fun res!604886 () Bool)

(assert (=> b!893169 (=> (not res!604886) (not e!498788))))

(declare-fun arrayCountValidKeys!0 (array!52329 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893169 (= res!604886 (= (arrayCountValidKeys!0 (_keys!9999 thiss!1181) #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))) (_size!2172 thiss!1181)))))

(declare-fun b!893170 () Bool)

(declare-fun res!604887 () Bool)

(assert (=> b!893170 (=> (not res!604887) (not e!498788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52329 (_ BitVec 32)) Bool)

(assert (=> b!893170 (= res!604887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun b!893171 () Bool)

(declare-datatypes ((List!17808 0))(
  ( (Nil!17805) (Cons!17804 (h!18935 (_ BitVec 64)) (t!25122 List!17808)) )
))
(declare-fun arrayNoDuplicates!0 (array!52329 (_ BitVec 32) List!17808) Bool)

(assert (=> b!893171 (= e!498788 (arrayNoDuplicates!0 (_keys!9999 thiss!1181) #b00000000000000000000000000000000 Nil!17805))))

(assert (= (and d!110111 res!604885) b!893169))

(assert (= (and b!893169 res!604886) b!893170))

(assert (= (and b!893170 res!604887) b!893171))

(declare-fun m!830701 () Bool)

(assert (=> d!110111 m!830701))

(declare-fun m!830703 () Bool)

(assert (=> b!893169 m!830703))

(declare-fun m!830705 () Bool)

(assert (=> b!893170 m!830705))

(declare-fun m!830707 () Bool)

(assert (=> b!893171 m!830707))

(assert (=> start!75920 d!110111))

(declare-fun b!893192 () Bool)

(declare-fun e!498799 () Bool)

(declare-fun e!498803 () Bool)

(assert (=> b!893192 (= e!498799 e!498803)))

(declare-fun c!94051 () Bool)

(assert (=> b!893192 (= c!94051 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39593 () Bool)

(declare-fun call!39596 () ListLongMap!10721)

(assert (=> bm!39593 (= call!39596 (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun d!110113 () Bool)

(declare-fun lt!403430 () Bool)

(declare-fun contains!4355 (ListLongMap!10721 (_ BitVec 64)) Bool)

(assert (=> d!110113 (= lt!403430 (contains!4355 (map!12199 thiss!1181) key!785))))

(assert (=> d!110113 (= lt!403430 e!498799)))

(declare-fun c!94052 () Bool)

(assert (=> d!110113 (= c!94052 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110113 (valid!1643 thiss!1181)))

(assert (=> d!110113 (= (contains!4352 thiss!1181 key!785) lt!403430)))

(declare-fun bm!39594 () Bool)

(declare-fun call!39597 () Bool)

(declare-fun arrayContainsKey!0 (array!52329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39594 (= call!39597 (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!893193 () Bool)

(declare-datatypes ((Unit!30370 0))(
  ( (Unit!30371) )
))
(declare-fun e!498801 () Unit!30370)

(declare-fun Unit!30372 () Unit!30370)

(assert (=> b!893193 (= e!498801 Unit!30372)))

(declare-fun b!893194 () Bool)

(assert (=> b!893194 (= e!498799 (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!893195 () Bool)

(declare-fun e!498800 () Bool)

(assert (=> b!893195 (= e!498800 true)))

(declare-fun lt!403434 () Unit!30370)

(declare-datatypes ((SeekEntryResult!8870 0))(
  ( (MissingZero!8870 (index!37851 (_ BitVec 32))) (Found!8870 (index!37852 (_ BitVec 32))) (Intermediate!8870 (undefined!9682 Bool) (index!37853 (_ BitVec 32)) (x!75965 (_ BitVec 32))) (Undefined!8870) (MissingVacant!8870 (index!37854 (_ BitVec 32))) )
))
(declare-fun lt!403422 () SeekEntryResult!8870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52329 (_ BitVec 64) (_ BitVec 32)) Unit!30370)

(assert (=> b!893195 (= lt!403434 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9999 thiss!1181) key!785 (index!37852 lt!403422)))))

(assert (=> b!893195 call!39597))

(declare-fun lt!403431 () Unit!30370)

(assert (=> b!893195 (= lt!403431 lt!403434)))

(declare-fun lt!403425 () Unit!30370)

(declare-fun lemmaValidKeyInArrayIsInListMap!235 (array!52329 array!52331 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 32) Int) Unit!30370)

(assert (=> b!893195 (= lt!403425 (lemmaValidKeyInArrayIsInListMap!235 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (index!37852 lt!403422) (defaultEntry!5317 thiss!1181)))))

(declare-fun call!39598 () Bool)

(assert (=> b!893195 call!39598))

(declare-fun lt!403428 () Unit!30370)

(assert (=> b!893195 (= lt!403428 lt!403425)))

(declare-fun b!893196 () Bool)

(assert (=> b!893196 false))

(declare-fun lt!403432 () Unit!30370)

(declare-fun lt!403429 () Unit!30370)

(assert (=> b!893196 (= lt!403432 lt!403429)))

(declare-fun lt!403427 () SeekEntryResult!8870)

(declare-fun lt!403436 () (_ BitVec 32))

(assert (=> b!893196 (and ((_ is Found!8870) lt!403427) (= (index!37852 lt!403427) lt!403436))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52329 (_ BitVec 32)) SeekEntryResult!8870)

(assert (=> b!893196 (= lt!403427 (seekEntry!0 key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52329 (_ BitVec 32)) Unit!30370)

(assert (=> b!893196 (= lt!403429 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403436 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun lt!403423 () Unit!30370)

(declare-fun lt!403435 () Unit!30370)

(assert (=> b!893196 (= lt!403423 lt!403435)))

(assert (=> b!893196 (arrayForallSeekEntryOrOpenFound!0 lt!403436 (_keys!9999 thiss!1181) (mask!25841 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30370)

(assert (=> b!893196 (= lt!403435 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9999 thiss!1181) (mask!25841 thiss!1181) #b00000000000000000000000000000000 lt!403436))))

(declare-fun arrayScanForKey!0 (array!52329 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893196 (= lt!403436 (arrayScanForKey!0 (_keys!9999 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403426 () Unit!30370)

(declare-fun lt!403424 () Unit!30370)

(assert (=> b!893196 (= lt!403426 lt!403424)))

(declare-fun e!498802 () Bool)

(assert (=> b!893196 e!498802))

(declare-fun c!94053 () Bool)

(assert (=> b!893196 (= c!94053 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!169 (array!52329 array!52331 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 64) Int) Unit!30370)

(assert (=> b!893196 (= lt!403424 (lemmaKeyInListMapIsInArray!169 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) key!785 (defaultEntry!5317 thiss!1181)))))

(declare-fun Unit!30373 () Unit!30370)

(assert (=> b!893196 (= e!498801 Unit!30373)))

(declare-fun b!893197 () Bool)

(assert (=> b!893197 (= e!498802 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!893198 () Bool)

(assert (=> b!893198 (= e!498800 false)))

(declare-fun c!94050 () Bool)

(assert (=> b!893198 (= c!94050 call!39598)))

(declare-fun lt!403433 () Unit!30370)

(assert (=> b!893198 (= lt!403433 e!498801)))

(declare-fun b!893199 () Bool)

(assert (=> b!893199 (= e!498802 call!39597)))

(declare-fun b!893200 () Bool)

(declare-fun c!94054 () Bool)

(assert (=> b!893200 (= c!94054 ((_ is Found!8870) lt!403422))))

(assert (=> b!893200 (= lt!403422 (seekEntry!0 key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (=> b!893200 (= e!498803 e!498800)))

(declare-fun bm!39595 () Bool)

(assert (=> bm!39595 (= call!39598 (contains!4355 call!39596 (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(declare-fun b!893201 () Bool)

(assert (=> b!893201 (= e!498803 (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!110113 c!94052) b!893194))

(assert (= (and d!110113 (not c!94052)) b!893192))

(assert (= (and b!893192 c!94051) b!893201))

(assert (= (and b!893192 (not c!94051)) b!893200))

(assert (= (and b!893200 c!94054) b!893195))

(assert (= (and b!893200 (not c!94054)) b!893198))

(assert (= (and b!893198 c!94050) b!893196))

(assert (= (and b!893198 (not c!94050)) b!893193))

(assert (= (and b!893196 c!94053) b!893199))

(assert (= (and b!893196 (not c!94053)) b!893197))

(assert (= (or b!893195 b!893199) bm!39594))

(assert (= (or b!893195 b!893198) bm!39593))

(assert (= (or b!893195 b!893198) bm!39595))

(assert (=> d!110113 m!830643))

(assert (=> d!110113 m!830643))

(declare-fun m!830709 () Bool)

(assert (=> d!110113 m!830709))

(assert (=> d!110113 m!830649))

(declare-fun m!830711 () Bool)

(assert (=> b!893196 m!830711))

(declare-fun m!830713 () Bool)

(assert (=> b!893196 m!830713))

(declare-fun m!830715 () Bool)

(assert (=> b!893196 m!830715))

(declare-fun m!830717 () Bool)

(assert (=> b!893196 m!830717))

(declare-fun m!830719 () Bool)

(assert (=> b!893196 m!830719))

(declare-fun m!830721 () Bool)

(assert (=> b!893196 m!830721))

(declare-fun m!830723 () Bool)

(assert (=> b!893195 m!830723))

(declare-fun m!830725 () Bool)

(assert (=> b!893195 m!830725))

(assert (=> bm!39593 m!830699))

(declare-fun m!830727 () Bool)

(assert (=> bm!39594 m!830727))

(declare-fun m!830729 () Bool)

(assert (=> bm!39595 m!830729))

(declare-fun m!830731 () Bool)

(assert (=> bm!39595 m!830731))

(assert (=> b!893200 m!830721))

(assert (=> b!893096 d!110113))

(declare-fun d!110115 () Bool)

(assert (=> d!110115 (= (array_inv!19824 (_keys!9999 thiss!1181)) (bvsge (size!25615 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893094 d!110115))

(declare-fun d!110117 () Bool)

(assert (=> d!110117 (= (array_inv!19825 (_values!5304 thiss!1181)) (bvsge (size!25616 (_values!5304 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893094 d!110117))

(declare-fun mapIsEmpty!28841 () Bool)

(declare-fun mapRes!28841 () Bool)

(assert (=> mapIsEmpty!28841 mapRes!28841))

(declare-fun b!893208 () Bool)

(declare-fun e!498808 () Bool)

(assert (=> b!893208 (= e!498808 tp_is_empty!18181)))

(declare-fun mapNonEmpty!28841 () Bool)

(declare-fun tp!55550 () Bool)

(assert (=> mapNonEmpty!28841 (= mapRes!28841 (and tp!55550 e!498808))))

(declare-fun mapKey!28841 () (_ BitVec 32))

(declare-fun mapValue!28841 () ValueCell!8609)

(declare-fun mapRest!28841 () (Array (_ BitVec 32) ValueCell!8609))

(assert (=> mapNonEmpty!28841 (= mapRest!28832 (store mapRest!28841 mapKey!28841 mapValue!28841))))

(declare-fun b!893209 () Bool)

(declare-fun e!498809 () Bool)

(assert (=> b!893209 (= e!498809 tp_is_empty!18181)))

(declare-fun condMapEmpty!28841 () Bool)

(declare-fun mapDefault!28841 () ValueCell!8609)

(assert (=> mapNonEmpty!28832 (= condMapEmpty!28841 (= mapRest!28832 ((as const (Array (_ BitVec 32) ValueCell!8609)) mapDefault!28841)))))

(assert (=> mapNonEmpty!28832 (= tp!55535 (and e!498809 mapRes!28841))))

(assert (= (and mapNonEmpty!28832 condMapEmpty!28841) mapIsEmpty!28841))

(assert (= (and mapNonEmpty!28832 (not condMapEmpty!28841)) mapNonEmpty!28841))

(assert (= (and mapNonEmpty!28841 ((_ is ValueCellFull!8609) mapValue!28841)) b!893208))

(assert (= (and mapNonEmpty!28832 ((_ is ValueCellFull!8609) mapDefault!28841)) b!893209))

(declare-fun m!830733 () Bool)

(assert (=> mapNonEmpty!28841 m!830733))

(check-sat (not b!893171) (not b!893200) (not b_next!15853) (not bm!39595) (not bm!39593) (not b_lambda!12899) (not mapNonEmpty!28841) (not d!110113) (not d!110111) tp_is_empty!18181 (not b!893161) (not b!893170) b_and!26091 (not bm!39594) (not b!893169) (not d!110109) (not b!893195) (not b!893196))
(check-sat b_and!26091 (not b_next!15853))
(get-model)

(declare-fun d!110119 () Bool)

(declare-fun c!94055 () Bool)

(assert (=> d!110119 (= c!94055 (and ((_ is Cons!17801) (t!25115 (toList!5376 (map!12199 thiss!1181)))) (= (_1!6028 (h!18932 (t!25115 (toList!5376 (map!12199 thiss!1181))))) key!785)))))

(declare-fun e!498810 () Option!455)

(assert (=> d!110119 (= (getValueByKey!449 (t!25115 (toList!5376 (map!12199 thiss!1181))) key!785) e!498810)))

(declare-fun b!893210 () Bool)

(assert (=> b!893210 (= e!498810 (Some!454 (_2!6028 (h!18932 (t!25115 (toList!5376 (map!12199 thiss!1181)))))))))

(declare-fun b!893213 () Bool)

(declare-fun e!498811 () Option!455)

(assert (=> b!893213 (= e!498811 None!453)))

(declare-fun b!893211 () Bool)

(assert (=> b!893211 (= e!498810 e!498811)))

(declare-fun c!94056 () Bool)

(assert (=> b!893211 (= c!94056 (and ((_ is Cons!17801) (t!25115 (toList!5376 (map!12199 thiss!1181)))) (not (= (_1!6028 (h!18932 (t!25115 (toList!5376 (map!12199 thiss!1181))))) key!785))))))

(declare-fun b!893212 () Bool)

(assert (=> b!893212 (= e!498811 (getValueByKey!449 (t!25115 (t!25115 (toList!5376 (map!12199 thiss!1181)))) key!785))))

(assert (= (and d!110119 c!94055) b!893210))

(assert (= (and d!110119 (not c!94055)) b!893211))

(assert (= (and b!893211 c!94056) b!893212))

(assert (= (and b!893211 (not c!94056)) b!893213))

(declare-fun m!830735 () Bool)

(assert (=> b!893212 m!830735))

(assert (=> b!893161 d!110119))

(declare-fun b!893226 () Bool)

(declare-fun e!498818 () SeekEntryResult!8870)

(declare-fun lt!403447 () SeekEntryResult!8870)

(assert (=> b!893226 (= e!498818 (MissingZero!8870 (index!37853 lt!403447)))))

(declare-fun b!893227 () Bool)

(declare-fun e!498819 () SeekEntryResult!8870)

(assert (=> b!893227 (= e!498819 (Found!8870 (index!37853 lt!403447)))))

(declare-fun b!893228 () Bool)

(declare-fun e!498820 () SeekEntryResult!8870)

(assert (=> b!893228 (= e!498820 e!498819)))

(declare-fun lt!403448 () (_ BitVec 64))

(assert (=> b!893228 (= lt!403448 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37853 lt!403447)))))

(declare-fun c!94064 () Bool)

(assert (=> b!893228 (= c!94064 (= lt!403448 key!785))))

(declare-fun b!893229 () Bool)

(assert (=> b!893229 (= e!498820 Undefined!8870)))

(declare-fun d!110121 () Bool)

(declare-fun lt!403446 () SeekEntryResult!8870)

(assert (=> d!110121 (and (or ((_ is MissingVacant!8870) lt!403446) (not ((_ is Found!8870) lt!403446)) (and (bvsge (index!37852 lt!403446) #b00000000000000000000000000000000) (bvslt (index!37852 lt!403446) (size!25615 (_keys!9999 thiss!1181))))) (not ((_ is MissingVacant!8870) lt!403446)) (or (not ((_ is Found!8870) lt!403446)) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403446)) key!785)))))

(assert (=> d!110121 (= lt!403446 e!498820)))

(declare-fun c!94065 () Bool)

(assert (=> d!110121 (= c!94065 (and ((_ is Intermediate!8870) lt!403447) (undefined!9682 lt!403447)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52329 (_ BitVec 32)) SeekEntryResult!8870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110121 (= lt!403447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25841 thiss!1181)) key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110121 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110121 (= (seekEntry!0 key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) lt!403446)))

(declare-fun b!893230 () Bool)

(declare-fun c!94063 () Bool)

(assert (=> b!893230 (= c!94063 (= lt!403448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893230 (= e!498819 e!498818)))

(declare-fun b!893231 () Bool)

(declare-fun lt!403445 () SeekEntryResult!8870)

(assert (=> b!893231 (= e!498818 (ite ((_ is MissingVacant!8870) lt!403445) (MissingZero!8870 (index!37854 lt!403445)) lt!403445))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52329 (_ BitVec 32)) SeekEntryResult!8870)

(assert (=> b!893231 (= lt!403445 (seekKeyOrZeroReturnVacant!0 (x!75965 lt!403447) (index!37853 lt!403447) (index!37853 lt!403447) key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (= (and d!110121 c!94065) b!893229))

(assert (= (and d!110121 (not c!94065)) b!893228))

(assert (= (and b!893228 c!94064) b!893227))

(assert (= (and b!893228 (not c!94064)) b!893230))

(assert (= (and b!893230 c!94063) b!893226))

(assert (= (and b!893230 (not c!94063)) b!893231))

(declare-fun m!830737 () Bool)

(assert (=> b!893228 m!830737))

(declare-fun m!830739 () Bool)

(assert (=> d!110121 m!830739))

(declare-fun m!830741 () Bool)

(assert (=> d!110121 m!830741))

(assert (=> d!110121 m!830741))

(declare-fun m!830743 () Bool)

(assert (=> d!110121 m!830743))

(declare-fun m!830745 () Bool)

(assert (=> d!110121 m!830745))

(declare-fun m!830747 () Bool)

(assert (=> b!893231 m!830747))

(assert (=> b!893200 d!110121))

(declare-fun d!110123 () Bool)

(declare-fun e!498825 () Bool)

(assert (=> d!110123 e!498825))

(declare-fun res!604890 () Bool)

(assert (=> d!110123 (=> res!604890 e!498825)))

(declare-fun lt!403460 () Bool)

(assert (=> d!110123 (= res!604890 (not lt!403460))))

(declare-fun lt!403459 () Bool)

(assert (=> d!110123 (= lt!403460 lt!403459)))

(declare-fun lt!403458 () Unit!30370)

(declare-fun e!498826 () Unit!30370)

(assert (=> d!110123 (= lt!403458 e!498826)))

(declare-fun c!94068 () Bool)

(assert (=> d!110123 (= c!94068 lt!403459)))

(declare-fun containsKey!422 (List!17805 (_ BitVec 64)) Bool)

(assert (=> d!110123 (= lt!403459 (containsKey!422 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(assert (=> d!110123 (= (contains!4355 call!39596 (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)) lt!403460)))

(declare-fun b!893238 () Bool)

(declare-fun lt!403457 () Unit!30370)

(assert (=> b!893238 (= e!498826 lt!403457)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!317 (List!17805 (_ BitVec 64)) Unit!30370)

(assert (=> b!893238 (= lt!403457 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(declare-fun isDefined!330 (Option!455) Bool)

(assert (=> b!893238 (isDefined!330 (getValueByKey!449 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(declare-fun b!893239 () Bool)

(declare-fun Unit!30374 () Unit!30370)

(assert (=> b!893239 (= e!498826 Unit!30374)))

(declare-fun b!893240 () Bool)

(assert (=> b!893240 (= e!498825 (isDefined!330 (getValueByKey!449 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785))))))

(assert (= (and d!110123 c!94068) b!893238))

(assert (= (and d!110123 (not c!94068)) b!893239))

(assert (= (and d!110123 (not res!604890)) b!893240))

(declare-fun m!830749 () Bool)

(assert (=> d!110123 m!830749))

(declare-fun m!830751 () Bool)

(assert (=> b!893238 m!830751))

(declare-fun m!830753 () Bool)

(assert (=> b!893238 m!830753))

(assert (=> b!893238 m!830753))

(declare-fun m!830755 () Bool)

(assert (=> b!893238 m!830755))

(assert (=> b!893240 m!830753))

(assert (=> b!893240 m!830753))

(assert (=> b!893240 m!830755))

(assert (=> bm!39595 d!110123))

(declare-fun d!110125 () Bool)

(declare-fun res!604900 () Bool)

(declare-fun e!498829 () Bool)

(assert (=> d!110125 (=> (not res!604900) (not e!498829))))

(assert (=> d!110125 (= res!604900 (validMask!0 (mask!25841 thiss!1181)))))

(assert (=> d!110125 (= (simpleValid!297 thiss!1181) e!498829)))

(declare-fun b!893249 () Bool)

(declare-fun res!604901 () Bool)

(assert (=> b!893249 (=> (not res!604901) (not e!498829))))

(assert (=> b!893249 (= res!604901 (and (= (size!25616 (_values!5304 thiss!1181)) (bvadd (mask!25841 thiss!1181) #b00000000000000000000000000000001)) (= (size!25615 (_keys!9999 thiss!1181)) (size!25616 (_values!5304 thiss!1181))) (bvsge (_size!2172 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2172 thiss!1181) (bvadd (mask!25841 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!893252 () Bool)

(assert (=> b!893252 (= e!498829 (and (bvsge (extraKeys!5013 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5013 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2172 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!893251 () Bool)

(declare-fun res!604902 () Bool)

(assert (=> b!893251 (=> (not res!604902) (not e!498829))))

(declare-fun size!25621 (LongMapFixedSize!4234) (_ BitVec 32))

(assert (=> b!893251 (= res!604902 (= (size!25621 thiss!1181) (bvadd (_size!2172 thiss!1181) (bvsdiv (bvadd (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!893250 () Bool)

(declare-fun res!604899 () Bool)

(assert (=> b!893250 (=> (not res!604899) (not e!498829))))

(assert (=> b!893250 (= res!604899 (bvsge (size!25621 thiss!1181) (_size!2172 thiss!1181)))))

(assert (= (and d!110125 res!604900) b!893249))

(assert (= (and b!893249 res!604901) b!893250))

(assert (= (and b!893250 res!604899) b!893251))

(assert (= (and b!893251 res!604902) b!893252))

(assert (=> d!110125 m!830745))

(declare-fun m!830757 () Bool)

(assert (=> b!893251 m!830757))

(assert (=> b!893250 m!830757))

(assert (=> d!110111 d!110125))

(declare-fun b!893295 () Bool)

(declare-fun e!498860 () Unit!30370)

(declare-fun lt!403525 () Unit!30370)

(assert (=> b!893295 (= e!498860 lt!403525)))

(declare-fun lt!403520 () ListLongMap!10721)

(declare-fun getCurrentListMapNoExtraKeys!3311 (array!52329 array!52331 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 32) Int) ListLongMap!10721)

(assert (=> b!893295 (= lt!403520 (getCurrentListMapNoExtraKeys!3311 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun lt!403521 () (_ BitVec 64))

(assert (=> b!893295 (= lt!403521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403511 () (_ BitVec 64))

(assert (=> b!893295 (= lt!403511 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403523 () Unit!30370)

(declare-fun addStillContains!329 (ListLongMap!10721 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30370)

(assert (=> b!893295 (= lt!403523 (addStillContains!329 lt!403520 lt!403521 (zeroValue!5117 thiss!1181) lt!403511))))

(declare-fun +!2614 (ListLongMap!10721 tuple2!12034) ListLongMap!10721)

(assert (=> b!893295 (contains!4355 (+!2614 lt!403520 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181))) lt!403511)))

(declare-fun lt!403509 () Unit!30370)

(assert (=> b!893295 (= lt!403509 lt!403523)))

(declare-fun lt!403526 () ListLongMap!10721)

(assert (=> b!893295 (= lt!403526 (getCurrentListMapNoExtraKeys!3311 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun lt!403518 () (_ BitVec 64))

(assert (=> b!893295 (= lt!403518 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403524 () (_ BitVec 64))

(assert (=> b!893295 (= lt!403524 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403517 () Unit!30370)

(declare-fun addApplyDifferent!329 (ListLongMap!10721 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30370)

(assert (=> b!893295 (= lt!403517 (addApplyDifferent!329 lt!403526 lt!403518 (minValue!5117 thiss!1181) lt!403524))))

(declare-fun apply!403 (ListLongMap!10721 (_ BitVec 64)) V!29207)

(assert (=> b!893295 (= (apply!403 (+!2614 lt!403526 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181))) lt!403524) (apply!403 lt!403526 lt!403524))))

(declare-fun lt!403512 () Unit!30370)

(assert (=> b!893295 (= lt!403512 lt!403517)))

(declare-fun lt!403519 () ListLongMap!10721)

(assert (=> b!893295 (= lt!403519 (getCurrentListMapNoExtraKeys!3311 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun lt!403513 () (_ BitVec 64))

(assert (=> b!893295 (= lt!403513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403507 () (_ BitVec 64))

(assert (=> b!893295 (= lt!403507 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403505 () Unit!30370)

(assert (=> b!893295 (= lt!403505 (addApplyDifferent!329 lt!403519 lt!403513 (zeroValue!5117 thiss!1181) lt!403507))))

(assert (=> b!893295 (= (apply!403 (+!2614 lt!403519 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181))) lt!403507) (apply!403 lt!403519 lt!403507))))

(declare-fun lt!403510 () Unit!30370)

(assert (=> b!893295 (= lt!403510 lt!403505)))

(declare-fun lt!403522 () ListLongMap!10721)

(assert (=> b!893295 (= lt!403522 (getCurrentListMapNoExtraKeys!3311 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun lt!403508 () (_ BitVec 64))

(assert (=> b!893295 (= lt!403508 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403514 () (_ BitVec 64))

(assert (=> b!893295 (= lt!403514 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893295 (= lt!403525 (addApplyDifferent!329 lt!403522 lt!403508 (minValue!5117 thiss!1181) lt!403514))))

(assert (=> b!893295 (= (apply!403 (+!2614 lt!403522 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181))) lt!403514) (apply!403 lt!403522 lt!403514))))

(declare-fun b!893296 () Bool)

(declare-fun e!498857 () Bool)

(declare-fun call!39614 () Bool)

(assert (=> b!893296 (= e!498857 (not call!39614))))

(declare-fun b!893297 () Bool)

(declare-fun Unit!30375 () Unit!30370)

(assert (=> b!893297 (= e!498860 Unit!30375)))

(declare-fun b!893298 () Bool)

(declare-fun e!498867 () Bool)

(assert (=> b!893298 (= e!498857 e!498867)))

(declare-fun res!604922 () Bool)

(assert (=> b!893298 (= res!604922 call!39614)))

(assert (=> b!893298 (=> (not res!604922) (not e!498867))))

(declare-fun b!893299 () Bool)

(declare-fun res!604925 () Bool)

(declare-fun e!498861 () Bool)

(assert (=> b!893299 (=> (not res!604925) (not e!498861))))

(declare-fun e!498866 () Bool)

(assert (=> b!893299 (= res!604925 e!498866)))

(declare-fun res!604926 () Bool)

(assert (=> b!893299 (=> res!604926 e!498866)))

(declare-fun e!498864 () Bool)

(assert (=> b!893299 (= res!604926 (not e!498864))))

(declare-fun res!604928 () Bool)

(assert (=> b!893299 (=> (not res!604928) (not e!498864))))

(assert (=> b!893299 (= res!604928 (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893300 () Bool)

(declare-fun e!498863 () ListLongMap!10721)

(declare-fun call!39615 () ListLongMap!10721)

(assert (=> b!893300 (= e!498863 call!39615)))

(declare-fun bm!39611 () Bool)

(declare-fun call!39617 () ListLongMap!10721)

(assert (=> bm!39611 (= call!39615 call!39617)))

(declare-fun b!893301 () Bool)

(assert (=> b!893301 (= e!498861 e!498857)))

(declare-fun c!94082 () Bool)

(assert (=> b!893301 (= c!94082 (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!893302 () Bool)

(declare-fun e!498858 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!893302 (= e!498858 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39612 () Bool)

(declare-fun call!39619 () ListLongMap!10721)

(assert (=> bm!39612 (= call!39619 (getCurrentListMapNoExtraKeys!3311 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun b!893303 () Bool)

(declare-fun e!498868 () Bool)

(assert (=> b!893303 (= e!498866 e!498868)))

(declare-fun res!604924 () Bool)

(assert (=> b!893303 (=> (not res!604924) (not e!498868))))

(declare-fun lt!403516 () ListLongMap!10721)

(assert (=> b!893303 (= res!604924 (contains!4355 lt!403516 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893304 () Bool)

(declare-fun res!604921 () Bool)

(assert (=> b!893304 (=> (not res!604921) (not e!498861))))

(declare-fun e!498862 () Bool)

(assert (=> b!893304 (= res!604921 e!498862)))

(declare-fun c!94086 () Bool)

(assert (=> b!893304 (= c!94086 (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!893305 () Bool)

(declare-fun get!13256 (ValueCell!8609 V!29207) V!29207)

(assert (=> b!893305 (= e!498868 (= (apply!403 lt!403516 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)) (get!13256 (select (arr!25170 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1293 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25616 (_values!5304 thiss!1181))))))

(assert (=> b!893305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893306 () Bool)

(declare-fun e!498859 () ListLongMap!10721)

(declare-fun e!498865 () ListLongMap!10721)

(assert (=> b!893306 (= e!498859 e!498865)))

(declare-fun c!94083 () Bool)

(assert (=> b!893306 (= c!94083 (and (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!893307 () Bool)

(declare-fun e!498856 () Bool)

(assert (=> b!893307 (= e!498856 (= (apply!403 lt!403516 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5117 thiss!1181)))))

(declare-fun bm!39613 () Bool)

(assert (=> bm!39613 (= call!39614 (contains!4355 lt!403516 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39614 () Bool)

(declare-fun call!39618 () Bool)

(assert (=> bm!39614 (= call!39618 (contains!4355 lt!403516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893308 () Bool)

(assert (=> b!893308 (= e!498862 e!498856)))

(declare-fun res!604929 () Bool)

(assert (=> b!893308 (= res!604929 call!39618)))

(assert (=> b!893308 (=> (not res!604929) (not e!498856))))

(declare-fun b!893309 () Bool)

(declare-fun call!39613 () ListLongMap!10721)

(assert (=> b!893309 (= e!498863 call!39613)))

(declare-fun b!893310 () Bool)

(assert (=> b!893310 (= e!498864 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893311 () Bool)

(declare-fun c!94085 () Bool)

(assert (=> b!893311 (= c!94085 (and (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!893311 (= e!498865 e!498863)))

(declare-fun b!893312 () Bool)

(declare-fun call!39616 () ListLongMap!10721)

(assert (=> b!893312 (= e!498859 (+!2614 call!39616 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))

(declare-fun b!893313 () Bool)

(assert (=> b!893313 (= e!498865 call!39613)))

(declare-fun bm!39610 () Bool)

(assert (=> bm!39610 (= call!39613 call!39616)))

(declare-fun d!110127 () Bool)

(assert (=> d!110127 e!498861))

(declare-fun res!604927 () Bool)

(assert (=> d!110127 (=> (not res!604927) (not e!498861))))

(assert (=> d!110127 (= res!604927 (or (bvsge #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))))

(declare-fun lt!403506 () ListLongMap!10721)

(assert (=> d!110127 (= lt!403516 lt!403506)))

(declare-fun lt!403515 () Unit!30370)

(assert (=> d!110127 (= lt!403515 e!498860)))

(declare-fun c!94081 () Bool)

(assert (=> d!110127 (= c!94081 e!498858)))

(declare-fun res!604923 () Bool)

(assert (=> d!110127 (=> (not res!604923) (not e!498858))))

(assert (=> d!110127 (= res!604923 (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110127 (= lt!403506 e!498859)))

(declare-fun c!94084 () Bool)

(assert (=> d!110127 (= c!94084 (and (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110127 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110127 (= (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) lt!403516)))

(declare-fun bm!39615 () Bool)

(assert (=> bm!39615 (= call!39617 call!39619)))

(declare-fun b!893314 () Bool)

(assert (=> b!893314 (= e!498862 (not call!39618))))

(declare-fun b!893315 () Bool)

(assert (=> b!893315 (= e!498867 (= (apply!403 lt!403516 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5117 thiss!1181)))))

(declare-fun bm!39616 () Bool)

(assert (=> bm!39616 (= call!39616 (+!2614 (ite c!94084 call!39619 (ite c!94083 call!39617 call!39615)) (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (= (and d!110127 c!94084) b!893312))

(assert (= (and d!110127 (not c!94084)) b!893306))

(assert (= (and b!893306 c!94083) b!893313))

(assert (= (and b!893306 (not c!94083)) b!893311))

(assert (= (and b!893311 c!94085) b!893309))

(assert (= (and b!893311 (not c!94085)) b!893300))

(assert (= (or b!893309 b!893300) bm!39611))

(assert (= (or b!893313 bm!39611) bm!39615))

(assert (= (or b!893313 b!893309) bm!39610))

(assert (= (or b!893312 bm!39615) bm!39612))

(assert (= (or b!893312 bm!39610) bm!39616))

(assert (= (and d!110127 res!604923) b!893302))

(assert (= (and d!110127 c!94081) b!893295))

(assert (= (and d!110127 (not c!94081)) b!893297))

(assert (= (and d!110127 res!604927) b!893299))

(assert (= (and b!893299 res!604928) b!893310))

(assert (= (and b!893299 (not res!604926)) b!893303))

(assert (= (and b!893303 res!604924) b!893305))

(assert (= (and b!893299 res!604925) b!893304))

(assert (= (and b!893304 c!94086) b!893308))

(assert (= (and b!893304 (not c!94086)) b!893314))

(assert (= (and b!893308 res!604929) b!893307))

(assert (= (or b!893308 b!893314) bm!39614))

(assert (= (and b!893304 res!604921) b!893301))

(assert (= (and b!893301 c!94082) b!893298))

(assert (= (and b!893301 (not c!94082)) b!893296))

(assert (= (and b!893298 res!604922) b!893315))

(assert (= (or b!893298 b!893296) bm!39613))

(declare-fun b_lambda!12901 () Bool)

(assert (=> (not b_lambda!12901) (not b!893305)))

(declare-fun t!25124 () Bool)

(declare-fun tb!5167 () Bool)

(assert (=> (and b!893094 (= (defaultEntry!5317 thiss!1181) (defaultEntry!5317 thiss!1181)) t!25124) tb!5167))

(declare-fun result!10059 () Bool)

(assert (=> tb!5167 (= result!10059 tp_is_empty!18181)))

(assert (=> b!893305 t!25124))

(declare-fun b_and!26101 () Bool)

(assert (= b_and!26091 (and (=> t!25124 result!10059) b_and!26101)))

(declare-fun m!830759 () Bool)

(assert (=> b!893302 m!830759))

(assert (=> b!893302 m!830759))

(declare-fun m!830761 () Bool)

(assert (=> b!893302 m!830761))

(declare-fun m!830763 () Bool)

(assert (=> bm!39613 m!830763))

(declare-fun m!830765 () Bool)

(assert (=> b!893315 m!830765))

(declare-fun m!830767 () Bool)

(assert (=> bm!39616 m!830767))

(declare-fun m!830769 () Bool)

(assert (=> b!893307 m!830769))

(declare-fun m!830771 () Bool)

(assert (=> b!893312 m!830771))

(declare-fun m!830773 () Bool)

(assert (=> bm!39614 m!830773))

(assert (=> b!893310 m!830759))

(assert (=> b!893310 m!830759))

(assert (=> b!893310 m!830761))

(assert (=> d!110127 m!830745))

(declare-fun m!830775 () Bool)

(assert (=> b!893295 m!830775))

(declare-fun m!830777 () Bool)

(assert (=> b!893295 m!830777))

(declare-fun m!830779 () Bool)

(assert (=> b!893295 m!830779))

(declare-fun m!830781 () Bool)

(assert (=> b!893295 m!830781))

(declare-fun m!830783 () Bool)

(assert (=> b!893295 m!830783))

(declare-fun m!830785 () Bool)

(assert (=> b!893295 m!830785))

(declare-fun m!830787 () Bool)

(assert (=> b!893295 m!830787))

(assert (=> b!893295 m!830781))

(declare-fun m!830789 () Bool)

(assert (=> b!893295 m!830789))

(assert (=> b!893295 m!830785))

(declare-fun m!830791 () Bool)

(assert (=> b!893295 m!830791))

(assert (=> b!893295 m!830777))

(assert (=> b!893295 m!830759))

(declare-fun m!830793 () Bool)

(assert (=> b!893295 m!830793))

(declare-fun m!830795 () Bool)

(assert (=> b!893295 m!830795))

(declare-fun m!830797 () Bool)

(assert (=> b!893295 m!830797))

(declare-fun m!830799 () Bool)

(assert (=> b!893295 m!830799))

(declare-fun m!830801 () Bool)

(assert (=> b!893295 m!830801))

(declare-fun m!830803 () Bool)

(assert (=> b!893295 m!830803))

(declare-fun m!830805 () Bool)

(assert (=> b!893295 m!830805))

(assert (=> b!893295 m!830799))

(assert (=> b!893303 m!830759))

(assert (=> b!893303 m!830759))

(declare-fun m!830807 () Bool)

(assert (=> b!893303 m!830807))

(assert (=> bm!39612 m!830805))

(declare-fun m!830809 () Bool)

(assert (=> b!893305 m!830809))

(declare-fun m!830811 () Bool)

(assert (=> b!893305 m!830811))

(assert (=> b!893305 m!830759))

(declare-fun m!830813 () Bool)

(assert (=> b!893305 m!830813))

(assert (=> b!893305 m!830809))

(assert (=> b!893305 m!830811))

(declare-fun m!830815 () Bool)

(assert (=> b!893305 m!830815))

(assert (=> b!893305 m!830759))

(assert (=> bm!39593 d!110127))

(declare-fun b!893324 () Bool)

(declare-fun e!498874 () (_ BitVec 32))

(declare-fun call!39622 () (_ BitVec 32))

(assert (=> b!893324 (= e!498874 call!39622)))

(declare-fun b!893325 () Bool)

(declare-fun e!498873 () (_ BitVec 32))

(assert (=> b!893325 (= e!498873 #b00000000000000000000000000000000)))

(declare-fun b!893326 () Bool)

(assert (=> b!893326 (= e!498873 e!498874)))

(declare-fun c!94091 () Bool)

(assert (=> b!893326 (= c!94091 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39619 () Bool)

(assert (=> bm!39619 (= call!39622 (arrayCountValidKeys!0 (_keys!9999 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun d!110129 () Bool)

(declare-fun lt!403529 () (_ BitVec 32))

(assert (=> d!110129 (and (bvsge lt!403529 #b00000000000000000000000000000000) (bvsle lt!403529 (bvsub (size!25615 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110129 (= lt!403529 e!498873)))

(declare-fun c!94092 () Bool)

(assert (=> d!110129 (= c!94092 (bvsge #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110129 (and (bvsle #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25615 (_keys!9999 thiss!1181)) (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110129 (= (arrayCountValidKeys!0 (_keys!9999 thiss!1181) #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))) lt!403529)))

(declare-fun b!893327 () Bool)

(assert (=> b!893327 (= e!498874 (bvadd #b00000000000000000000000000000001 call!39622))))

(assert (= (and d!110129 c!94092) b!893325))

(assert (= (and d!110129 (not c!94092)) b!893326))

(assert (= (and b!893326 c!94091) b!893327))

(assert (= (and b!893326 (not c!94091)) b!893324))

(assert (= (or b!893327 b!893324) bm!39619))

(assert (=> b!893326 m!830759))

(assert (=> b!893326 m!830759))

(assert (=> b!893326 m!830761))

(declare-fun m!830817 () Bool)

(assert (=> bm!39619 m!830817))

(assert (=> b!893169 d!110129))

(declare-fun d!110131 () Bool)

(declare-fun res!604934 () Bool)

(declare-fun e!498879 () Bool)

(assert (=> d!110131 (=> res!604934 e!498879)))

(assert (=> d!110131 (= res!604934 (= (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110131 (= (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 #b00000000000000000000000000000000) e!498879)))

(declare-fun b!893332 () Bool)

(declare-fun e!498880 () Bool)

(assert (=> b!893332 (= e!498879 e!498880)))

(declare-fun res!604935 () Bool)

(assert (=> b!893332 (=> (not res!604935) (not e!498880))))

(assert (=> b!893332 (= res!604935 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893333 () Bool)

(assert (=> b!893333 (= e!498880 (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110131 (not res!604934)) b!893332))

(assert (= (and b!893332 res!604935) b!893333))

(assert (=> d!110131 m!830759))

(declare-fun m!830819 () Bool)

(assert (=> b!893333 m!830819))

(assert (=> bm!39594 d!110131))

(declare-fun b!893342 () Bool)

(declare-fun e!498889 () Bool)

(declare-fun call!39625 () Bool)

(assert (=> b!893342 (= e!498889 call!39625)))

(declare-fun b!893343 () Bool)

(declare-fun e!498888 () Bool)

(assert (=> b!893343 (= e!498888 e!498889)))

(declare-fun c!94095 () Bool)

(assert (=> b!893343 (= c!94095 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893344 () Bool)

(declare-fun e!498887 () Bool)

(assert (=> b!893344 (= e!498889 e!498887)))

(declare-fun lt!403538 () (_ BitVec 64))

(assert (=> b!893344 (= lt!403538 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403536 () Unit!30370)

(assert (=> b!893344 (= lt!403536 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9999 thiss!1181) lt!403538 #b00000000000000000000000000000000))))

(assert (=> b!893344 (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403538 #b00000000000000000000000000000000)))

(declare-fun lt!403537 () Unit!30370)

(assert (=> b!893344 (= lt!403537 lt!403536)))

(declare-fun res!604941 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52329 (_ BitVec 32)) SeekEntryResult!8870)

(assert (=> b!893344 (= res!604941 (= (seekEntryOrOpen!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) (Found!8870 #b00000000000000000000000000000000)))))

(assert (=> b!893344 (=> (not res!604941) (not e!498887))))

(declare-fun d!110133 () Bool)

(declare-fun res!604940 () Bool)

(assert (=> d!110133 (=> res!604940 e!498888)))

(assert (=> d!110133 (= res!604940 (bvsge #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) e!498888)))

(declare-fun b!893345 () Bool)

(assert (=> b!893345 (= e!498887 call!39625)))

(declare-fun bm!39622 () Bool)

(assert (=> bm!39622 (= call!39625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (= (and d!110133 (not res!604940)) b!893343))

(assert (= (and b!893343 c!94095) b!893344))

(assert (= (and b!893343 (not c!94095)) b!893342))

(assert (= (and b!893344 res!604941) b!893345))

(assert (= (or b!893345 b!893342) bm!39622))

(assert (=> b!893343 m!830759))

(assert (=> b!893343 m!830759))

(assert (=> b!893343 m!830761))

(assert (=> b!893344 m!830759))

(declare-fun m!830821 () Bool)

(assert (=> b!893344 m!830821))

(declare-fun m!830823 () Bool)

(assert (=> b!893344 m!830823))

(assert (=> b!893344 m!830759))

(declare-fun m!830825 () Bool)

(assert (=> b!893344 m!830825))

(declare-fun m!830827 () Bool)

(assert (=> bm!39622 m!830827))

(assert (=> b!893170 d!110133))

(declare-fun d!110135 () Bool)

(declare-fun e!498890 () Bool)

(assert (=> d!110135 e!498890))

(declare-fun res!604942 () Bool)

(assert (=> d!110135 (=> res!604942 e!498890)))

(declare-fun lt!403542 () Bool)

(assert (=> d!110135 (= res!604942 (not lt!403542))))

(declare-fun lt!403541 () Bool)

(assert (=> d!110135 (= lt!403542 lt!403541)))

(declare-fun lt!403540 () Unit!30370)

(declare-fun e!498891 () Unit!30370)

(assert (=> d!110135 (= lt!403540 e!498891)))

(declare-fun c!94096 () Bool)

(assert (=> d!110135 (= c!94096 lt!403541)))

(assert (=> d!110135 (= lt!403541 (containsKey!422 (toList!5376 (map!12199 thiss!1181)) key!785))))

(assert (=> d!110135 (= (contains!4355 (map!12199 thiss!1181) key!785) lt!403542)))

(declare-fun b!893346 () Bool)

(declare-fun lt!403539 () Unit!30370)

(assert (=> b!893346 (= e!498891 lt!403539)))

(assert (=> b!893346 (= lt!403539 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 (map!12199 thiss!1181)) key!785))))

(assert (=> b!893346 (isDefined!330 (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785))))

(declare-fun b!893347 () Bool)

(declare-fun Unit!30376 () Unit!30370)

(assert (=> b!893347 (= e!498891 Unit!30376)))

(declare-fun b!893348 () Bool)

(assert (=> b!893348 (= e!498890 (isDefined!330 (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785)))))

(assert (= (and d!110135 c!94096) b!893346))

(assert (= (and d!110135 (not c!94096)) b!893347))

(assert (= (and d!110135 (not res!604942)) b!893348))

(declare-fun m!830829 () Bool)

(assert (=> d!110135 m!830829))

(declare-fun m!830831 () Bool)

(assert (=> b!893346 m!830831))

(assert (=> b!893346 m!830645))

(assert (=> b!893346 m!830645))

(declare-fun m!830833 () Bool)

(assert (=> b!893346 m!830833))

(assert (=> b!893348 m!830645))

(assert (=> b!893348 m!830645))

(assert (=> b!893348 m!830833))

(assert (=> d!110113 d!110135))

(assert (=> d!110113 d!110109))

(assert (=> d!110113 d!110111))

(declare-fun d!110137 () Bool)

(declare-fun res!604950 () Bool)

(declare-fun e!498900 () Bool)

(assert (=> d!110137 (=> res!604950 e!498900)))

(assert (=> d!110137 (= res!604950 (bvsge #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110137 (= (arrayNoDuplicates!0 (_keys!9999 thiss!1181) #b00000000000000000000000000000000 Nil!17805) e!498900)))

(declare-fun b!893359 () Bool)

(declare-fun e!498901 () Bool)

(declare-fun call!39628 () Bool)

(assert (=> b!893359 (= e!498901 call!39628)))

(declare-fun b!893360 () Bool)

(declare-fun e!498903 () Bool)

(assert (=> b!893360 (= e!498900 e!498903)))

(declare-fun res!604949 () Bool)

(assert (=> b!893360 (=> (not res!604949) (not e!498903))))

(declare-fun e!498902 () Bool)

(assert (=> b!893360 (= res!604949 (not e!498902))))

(declare-fun res!604951 () Bool)

(assert (=> b!893360 (=> (not res!604951) (not e!498902))))

(assert (=> b!893360 (= res!604951 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893361 () Bool)

(assert (=> b!893361 (= e!498903 e!498901)))

(declare-fun c!94099 () Bool)

(assert (=> b!893361 (= c!94099 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39625 () Bool)

(assert (=> bm!39625 (= call!39628 (arrayNoDuplicates!0 (_keys!9999 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94099 (Cons!17804 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) Nil!17805) Nil!17805)))))

(declare-fun b!893362 () Bool)

(declare-fun contains!4356 (List!17808 (_ BitVec 64)) Bool)

(assert (=> b!893362 (= e!498902 (contains!4356 Nil!17805 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893363 () Bool)

(assert (=> b!893363 (= e!498901 call!39628)))

(assert (= (and d!110137 (not res!604950)) b!893360))

(assert (= (and b!893360 res!604951) b!893362))

(assert (= (and b!893360 res!604949) b!893361))

(assert (= (and b!893361 c!94099) b!893359))

(assert (= (and b!893361 (not c!94099)) b!893363))

(assert (= (or b!893359 b!893363) bm!39625))

(assert (=> b!893360 m!830759))

(assert (=> b!893360 m!830759))

(assert (=> b!893360 m!830761))

(assert (=> b!893361 m!830759))

(assert (=> b!893361 m!830759))

(assert (=> b!893361 m!830761))

(assert (=> bm!39625 m!830759))

(declare-fun m!830835 () Bool)

(assert (=> bm!39625 m!830835))

(assert (=> b!893362 m!830759))

(assert (=> b!893362 m!830759))

(declare-fun m!830837 () Bool)

(assert (=> b!893362 m!830837))

(assert (=> b!893171 d!110137))

(assert (=> d!110109 d!110127))

(declare-fun d!110139 () Bool)

(assert (=> d!110139 (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403545 () Unit!30370)

(declare-fun choose!13 (array!52329 (_ BitVec 64) (_ BitVec 32)) Unit!30370)

(assert (=> d!110139 (= lt!403545 (choose!13 (_keys!9999 thiss!1181) key!785 (index!37852 lt!403422)))))

(assert (=> d!110139 (bvsge (index!37852 lt!403422) #b00000000000000000000000000000000)))

(assert (=> d!110139 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9999 thiss!1181) key!785 (index!37852 lt!403422)) lt!403545)))

(declare-fun bs!25041 () Bool)

(assert (= bs!25041 d!110139))

(assert (=> bs!25041 m!830727))

(declare-fun m!830839 () Bool)

(assert (=> bs!25041 m!830839))

(assert (=> b!893195 d!110139))

(declare-fun d!110141 () Bool)

(declare-fun e!498906 () Bool)

(assert (=> d!110141 e!498906))

(declare-fun res!604954 () Bool)

(assert (=> d!110141 (=> (not res!604954) (not e!498906))))

(assert (=> d!110141 (= res!604954 (and (bvsge (index!37852 lt!403422) #b00000000000000000000000000000000) (bvslt (index!37852 lt!403422) (size!25615 (_keys!9999 thiss!1181)))))))

(declare-fun lt!403548 () Unit!30370)

(declare-fun choose!1473 (array!52329 array!52331 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 32) Int) Unit!30370)

(assert (=> d!110141 (= lt!403548 (choose!1473 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (index!37852 lt!403422) (defaultEntry!5317 thiss!1181)))))

(assert (=> d!110141 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110141 (= (lemmaValidKeyInArrayIsInListMap!235 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (index!37852 lt!403422) (defaultEntry!5317 thiss!1181)) lt!403548)))

(declare-fun b!893366 () Bool)

(assert (=> b!893366 (= e!498906 (contains!4355 (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422))))))

(assert (= (and d!110141 res!604954) b!893366))

(declare-fun m!830841 () Bool)

(assert (=> d!110141 m!830841))

(assert (=> d!110141 m!830745))

(assert (=> b!893366 m!830699))

(assert (=> b!893366 m!830729))

(assert (=> b!893366 m!830699))

(assert (=> b!893366 m!830729))

(declare-fun m!830843 () Bool)

(assert (=> b!893366 m!830843))

(assert (=> b!893195 d!110141))

(declare-fun d!110143 () Bool)

(declare-fun e!498909 () Bool)

(assert (=> d!110143 e!498909))

(declare-fun c!94102 () Bool)

(assert (=> d!110143 (= c!94102 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!403551 () Unit!30370)

(declare-fun choose!1474 (array!52329 array!52331 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 64) Int) Unit!30370)

(assert (=> d!110143 (= lt!403551 (choose!1474 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) key!785 (defaultEntry!5317 thiss!1181)))))

(assert (=> d!110143 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110143 (= (lemmaKeyInListMapIsInArray!169 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) key!785 (defaultEntry!5317 thiss!1181)) lt!403551)))

(declare-fun b!893371 () Bool)

(assert (=> b!893371 (= e!498909 (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!893372 () Bool)

(assert (=> b!893372 (= e!498909 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110143 c!94102) b!893371))

(assert (= (and d!110143 (not c!94102)) b!893372))

(declare-fun m!830845 () Bool)

(assert (=> d!110143 m!830845))

(assert (=> d!110143 m!830745))

(assert (=> b!893371 m!830727))

(assert (=> b!893196 d!110143))

(declare-fun b!893373 () Bool)

(declare-fun e!498912 () Bool)

(declare-fun call!39629 () Bool)

(assert (=> b!893373 (= e!498912 call!39629)))

(declare-fun b!893374 () Bool)

(declare-fun e!498911 () Bool)

(assert (=> b!893374 (= e!498911 e!498912)))

(declare-fun c!94103 () Bool)

(assert (=> b!893374 (= c!94103 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436)))))

(declare-fun b!893375 () Bool)

(declare-fun e!498910 () Bool)

(assert (=> b!893375 (= e!498912 e!498910)))

(declare-fun lt!403554 () (_ BitVec 64))

(assert (=> b!893375 (= lt!403554 (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436))))

(declare-fun lt!403552 () Unit!30370)

(assert (=> b!893375 (= lt!403552 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9999 thiss!1181) lt!403554 lt!403436))))

(assert (=> b!893375 (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403554 #b00000000000000000000000000000000)))

(declare-fun lt!403553 () Unit!30370)

(assert (=> b!893375 (= lt!403553 lt!403552)))

(declare-fun res!604956 () Bool)

(assert (=> b!893375 (= res!604956 (= (seekEntryOrOpen!0 (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) (Found!8870 lt!403436)))))

(assert (=> b!893375 (=> (not res!604956) (not e!498910))))

(declare-fun d!110145 () Bool)

(declare-fun res!604955 () Bool)

(assert (=> d!110145 (=> res!604955 e!498911)))

(assert (=> d!110145 (= res!604955 (bvsge lt!403436 (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110145 (= (arrayForallSeekEntryOrOpenFound!0 lt!403436 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) e!498911)))

(declare-fun b!893376 () Bool)

(assert (=> b!893376 (= e!498910 call!39629)))

(declare-fun bm!39626 () Bool)

(assert (=> bm!39626 (= call!39629 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403436 #b00000000000000000000000000000001) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (= (and d!110145 (not res!604955)) b!893374))

(assert (= (and b!893374 c!94103) b!893375))

(assert (= (and b!893374 (not c!94103)) b!893373))

(assert (= (and b!893375 res!604956) b!893376))

(assert (= (or b!893376 b!893373) bm!39626))

(declare-fun m!830847 () Bool)

(assert (=> b!893374 m!830847))

(assert (=> b!893374 m!830847))

(declare-fun m!830849 () Bool)

(assert (=> b!893374 m!830849))

(assert (=> b!893375 m!830847))

(declare-fun m!830851 () Bool)

(assert (=> b!893375 m!830851))

(declare-fun m!830853 () Bool)

(assert (=> b!893375 m!830853))

(assert (=> b!893375 m!830847))

(declare-fun m!830855 () Bool)

(assert (=> b!893375 m!830855))

(declare-fun m!830857 () Bool)

(assert (=> bm!39626 m!830857))

(assert (=> b!893196 d!110145))

(declare-fun d!110147 () Bool)

(assert (=> d!110147 (arrayForallSeekEntryOrOpenFound!0 lt!403436 (_keys!9999 thiss!1181) (mask!25841 thiss!1181))))

(declare-fun lt!403557 () Unit!30370)

(declare-fun choose!38 (array!52329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30370)

(assert (=> d!110147 (= lt!403557 (choose!38 (_keys!9999 thiss!1181) (mask!25841 thiss!1181) #b00000000000000000000000000000000 lt!403436))))

(assert (=> d!110147 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110147 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9999 thiss!1181) (mask!25841 thiss!1181) #b00000000000000000000000000000000 lt!403436) lt!403557)))

(declare-fun bs!25042 () Bool)

(assert (= bs!25042 d!110147))

(assert (=> bs!25042 m!830715))

(declare-fun m!830859 () Bool)

(assert (=> bs!25042 m!830859))

(assert (=> bs!25042 m!830745))

(assert (=> b!893196 d!110147))

(declare-fun d!110149 () Bool)

(declare-fun lt!403560 () (_ BitVec 32))

(assert (=> d!110149 (and (or (bvslt lt!403560 #b00000000000000000000000000000000) (bvsge lt!403560 (size!25615 (_keys!9999 thiss!1181))) (and (bvsge lt!403560 #b00000000000000000000000000000000) (bvslt lt!403560 (size!25615 (_keys!9999 thiss!1181))))) (bvsge lt!403560 #b00000000000000000000000000000000) (bvslt lt!403560 (size!25615 (_keys!9999 thiss!1181))) (= (select (arr!25169 (_keys!9999 thiss!1181)) lt!403560) key!785))))

(declare-fun e!498915 () (_ BitVec 32))

(assert (=> d!110149 (= lt!403560 e!498915)))

(declare-fun c!94106 () Bool)

(assert (=> d!110149 (= c!94106 (= (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110149 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))) (bvslt (size!25615 (_keys!9999 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110149 (= (arrayScanForKey!0 (_keys!9999 thiss!1181) key!785 #b00000000000000000000000000000000) lt!403560)))

(declare-fun b!893381 () Bool)

(assert (=> b!893381 (= e!498915 #b00000000000000000000000000000000)))

(declare-fun b!893382 () Bool)

(assert (=> b!893382 (= e!498915 (arrayScanForKey!0 (_keys!9999 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110149 c!94106) b!893381))

(assert (= (and d!110149 (not c!94106)) b!893382))

(declare-fun m!830861 () Bool)

(assert (=> d!110149 m!830861))

(assert (=> d!110149 m!830759))

(declare-fun m!830863 () Bool)

(assert (=> b!893382 m!830863))

(assert (=> b!893196 d!110149))

(declare-fun d!110151 () Bool)

(declare-fun lt!403566 () SeekEntryResult!8870)

(assert (=> d!110151 (and ((_ is Found!8870) lt!403566) (= (index!37852 lt!403566) lt!403436))))

(assert (=> d!110151 (= lt!403566 (seekEntry!0 key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun lt!403565 () Unit!30370)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!52329 (_ BitVec 32)) Unit!30370)

(assert (=> d!110151 (= lt!403565 (choose!0 key!785 lt!403436 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (=> d!110151 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110151 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403436 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) lt!403565)))

(declare-fun bs!25043 () Bool)

(assert (= bs!25043 d!110151))

(assert (=> bs!25043 m!830721))

(declare-fun m!830865 () Bool)

(assert (=> bs!25043 m!830865))

(assert (=> bs!25043 m!830745))

(assert (=> b!893196 d!110151))

(assert (=> b!893196 d!110121))

(declare-fun mapIsEmpty!28842 () Bool)

(declare-fun mapRes!28842 () Bool)

(assert (=> mapIsEmpty!28842 mapRes!28842))

(declare-fun b!893383 () Bool)

(declare-fun e!498916 () Bool)

(assert (=> b!893383 (= e!498916 tp_is_empty!18181)))

(declare-fun mapNonEmpty!28842 () Bool)

(declare-fun tp!55551 () Bool)

(assert (=> mapNonEmpty!28842 (= mapRes!28842 (and tp!55551 e!498916))))

(declare-fun mapValue!28842 () ValueCell!8609)

(declare-fun mapRest!28842 () (Array (_ BitVec 32) ValueCell!8609))

(declare-fun mapKey!28842 () (_ BitVec 32))

(assert (=> mapNonEmpty!28842 (= mapRest!28841 (store mapRest!28842 mapKey!28842 mapValue!28842))))

(declare-fun b!893384 () Bool)

(declare-fun e!498917 () Bool)

(assert (=> b!893384 (= e!498917 tp_is_empty!18181)))

(declare-fun condMapEmpty!28842 () Bool)

(declare-fun mapDefault!28842 () ValueCell!8609)

(assert (=> mapNonEmpty!28841 (= condMapEmpty!28842 (= mapRest!28841 ((as const (Array (_ BitVec 32) ValueCell!8609)) mapDefault!28842)))))

(assert (=> mapNonEmpty!28841 (= tp!55550 (and e!498917 mapRes!28842))))

(assert (= (and mapNonEmpty!28841 condMapEmpty!28842) mapIsEmpty!28842))

(assert (= (and mapNonEmpty!28841 (not condMapEmpty!28842)) mapNonEmpty!28842))

(assert (= (and mapNonEmpty!28842 ((_ is ValueCellFull!8609) mapValue!28842)) b!893383))

(assert (= (and mapNonEmpty!28841 ((_ is ValueCellFull!8609) mapDefault!28842)) b!893384))

(declare-fun m!830867 () Bool)

(assert (=> mapNonEmpty!28842 m!830867))

(declare-fun b_lambda!12903 () Bool)

(assert (= b_lambda!12901 (or (and b!893094 b_free!15853) b_lambda!12903)))

(check-sat (not b_next!15853) (not b!893251) (not b!893343) (not b!893362) (not d!110147) tp_is_empty!18181 (not b!893366) (not bm!39613) (not d!110151) (not bm!39614) (not d!110139) (not bm!39619) (not d!110121) (not b!893310) (not b!893360) (not b!893326) (not b!893344) (not b!893346) (not b!893212) (not bm!39622) (not d!110135) (not b!893333) (not b!893238) (not b_lambda!12899) (not d!110127) (not mapNonEmpty!28842) (not b!893348) (not b!893250) (not d!110143) (not b!893307) (not b!893361) (not bm!39625) (not b!893302) (not b!893312) (not b!893371) (not d!110123) (not b!893375) (not bm!39612) b_and!26101 (not b_lambda!12903) (not b!893382) (not b!893303) (not d!110125) (not b!893374) (not b!893305) (not b!893231) (not b!893315) (not d!110141) (not b!893240) (not b!893295) (not bm!39626) (not bm!39616))
(check-sat b_and!26101 (not b_next!15853))
(get-model)

(declare-fun b!893385 () Bool)

(declare-fun e!498920 () Bool)

(declare-fun call!39630 () Bool)

(assert (=> b!893385 (= e!498920 call!39630)))

(declare-fun b!893386 () Bool)

(declare-fun e!498919 () Bool)

(assert (=> b!893386 (= e!498919 e!498920)))

(declare-fun c!94107 () Bool)

(assert (=> b!893386 (= c!94107 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd lt!403436 #b00000000000000000000000000000001))))))

(declare-fun b!893387 () Bool)

(declare-fun e!498918 () Bool)

(assert (=> b!893387 (= e!498920 e!498918)))

(declare-fun lt!403569 () (_ BitVec 64))

(assert (=> b!893387 (= lt!403569 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd lt!403436 #b00000000000000000000000000000001)))))

(declare-fun lt!403567 () Unit!30370)

(assert (=> b!893387 (= lt!403567 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9999 thiss!1181) lt!403569 (bvadd lt!403436 #b00000000000000000000000000000001)))))

(assert (=> b!893387 (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403569 #b00000000000000000000000000000000)))

(declare-fun lt!403568 () Unit!30370)

(assert (=> b!893387 (= lt!403568 lt!403567)))

(declare-fun res!604958 () Bool)

(assert (=> b!893387 (= res!604958 (= (seekEntryOrOpen!0 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd lt!403436 #b00000000000000000000000000000001)) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) (Found!8870 (bvadd lt!403436 #b00000000000000000000000000000001))))))

(assert (=> b!893387 (=> (not res!604958) (not e!498918))))

(declare-fun d!110153 () Bool)

(declare-fun res!604957 () Bool)

(assert (=> d!110153 (=> res!604957 e!498919)))

(assert (=> d!110153 (= res!604957 (bvsge (bvadd lt!403436 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110153 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403436 #b00000000000000000000000000000001) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) e!498919)))

(declare-fun b!893388 () Bool)

(assert (=> b!893388 (= e!498918 call!39630)))

(declare-fun bm!39627 () Bool)

(assert (=> bm!39627 (= call!39630 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403436 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (= (and d!110153 (not res!604957)) b!893386))

(assert (= (and b!893386 c!94107) b!893387))

(assert (= (and b!893386 (not c!94107)) b!893385))

(assert (= (and b!893387 res!604958) b!893388))

(assert (= (or b!893388 b!893385) bm!39627))

(declare-fun m!830869 () Bool)

(assert (=> b!893386 m!830869))

(assert (=> b!893386 m!830869))

(declare-fun m!830871 () Bool)

(assert (=> b!893386 m!830871))

(assert (=> b!893387 m!830869))

(declare-fun m!830873 () Bool)

(assert (=> b!893387 m!830873))

(declare-fun m!830875 () Bool)

(assert (=> b!893387 m!830875))

(assert (=> b!893387 m!830869))

(declare-fun m!830877 () Bool)

(assert (=> b!893387 m!830877))

(declare-fun m!830879 () Bool)

(assert (=> bm!39627 m!830879))

(assert (=> bm!39626 d!110153))

(assert (=> d!110139 d!110131))

(declare-fun d!110155 () Bool)

(assert (=> d!110155 (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110155 true))

(declare-fun _$60!397 () Unit!30370)

(assert (=> d!110155 (= (choose!13 (_keys!9999 thiss!1181) key!785 (index!37852 lt!403422)) _$60!397)))

(declare-fun bs!25044 () Bool)

(assert (= bs!25044 d!110155))

(assert (=> bs!25044 m!830727))

(assert (=> d!110139 d!110155))

(declare-fun d!110157 () Bool)

(declare-fun isEmpty!685 (Option!455) Bool)

(assert (=> d!110157 (= (isDefined!330 (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785)) (not (isEmpty!685 (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785))))))

(declare-fun bs!25045 () Bool)

(assert (= bs!25045 d!110157))

(assert (=> bs!25045 m!830645))

(declare-fun m!830881 () Bool)

(assert (=> bs!25045 m!830881))

(assert (=> b!893348 d!110157))

(assert (=> b!893348 d!110107))

(declare-fun b!893389 () Bool)

(declare-fun e!498923 () Bool)

(declare-fun call!39631 () Bool)

(assert (=> b!893389 (= e!498923 call!39631)))

(declare-fun b!893390 () Bool)

(declare-fun e!498922 () Bool)

(assert (=> b!893390 (= e!498922 e!498923)))

(declare-fun c!94108 () Bool)

(assert (=> b!893390 (= c!94108 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!893391 () Bool)

(declare-fun e!498921 () Bool)

(assert (=> b!893391 (= e!498923 e!498921)))

(declare-fun lt!403572 () (_ BitVec 64))

(assert (=> b!893391 (= lt!403572 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!403570 () Unit!30370)

(assert (=> b!893391 (= lt!403570 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9999 thiss!1181) lt!403572 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!893391 (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403572 #b00000000000000000000000000000000)))

(declare-fun lt!403571 () Unit!30370)

(assert (=> b!893391 (= lt!403571 lt!403570)))

(declare-fun res!604960 () Bool)

(assert (=> b!893391 (= res!604960 (= (seekEntryOrOpen!0 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) (Found!8870 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!893391 (=> (not res!604960) (not e!498921))))

(declare-fun d!110159 () Bool)

(declare-fun res!604959 () Bool)

(assert (=> d!110159 (=> res!604959 e!498922)))

(assert (=> d!110159 (= res!604959 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110159 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) e!498922)))

(declare-fun b!893392 () Bool)

(assert (=> b!893392 (= e!498921 call!39631)))

(declare-fun bm!39628 () Bool)

(assert (=> bm!39628 (= call!39631 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (= (and d!110159 (not res!604959)) b!893390))

(assert (= (and b!893390 c!94108) b!893391))

(assert (= (and b!893390 (not c!94108)) b!893389))

(assert (= (and b!893391 res!604960) b!893392))

(assert (= (or b!893392 b!893389) bm!39628))

(declare-fun m!830883 () Bool)

(assert (=> b!893390 m!830883))

(assert (=> b!893390 m!830883))

(declare-fun m!830885 () Bool)

(assert (=> b!893390 m!830885))

(assert (=> b!893391 m!830883))

(declare-fun m!830887 () Bool)

(assert (=> b!893391 m!830887))

(declare-fun m!830889 () Bool)

(assert (=> b!893391 m!830889))

(assert (=> b!893391 m!830883))

(declare-fun m!830891 () Bool)

(assert (=> b!893391 m!830891))

(declare-fun m!830893 () Bool)

(assert (=> bm!39628 m!830893))

(assert (=> bm!39622 d!110159))

(assert (=> b!893371 d!110131))

(declare-fun d!110161 () Bool)

(assert (=> d!110161 (= (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893326 d!110161))

(declare-fun d!110163 () Bool)

(assert (=> d!110163 (= (apply!403 lt!403516 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13253 (getValueByKey!449 (toList!5376 lt!403516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25046 () Bool)

(assert (= bs!25046 d!110163))

(declare-fun m!830895 () Bool)

(assert (=> bs!25046 m!830895))

(assert (=> bs!25046 m!830895))

(declare-fun m!830897 () Bool)

(assert (=> bs!25046 m!830897))

(assert (=> b!893315 d!110163))

(declare-fun d!110165 () Bool)

(declare-fun e!498926 () Bool)

(assert (=> d!110165 e!498926))

(declare-fun res!604966 () Bool)

(assert (=> d!110165 (=> (not res!604966) (not e!498926))))

(declare-fun lt!403583 () ListLongMap!10721)

(assert (=> d!110165 (= res!604966 (contains!4355 lt!403583 (_1!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(declare-fun lt!403584 () List!17805)

(assert (=> d!110165 (= lt!403583 (ListLongMap!10722 lt!403584))))

(declare-fun lt!403582 () Unit!30370)

(declare-fun lt!403581 () Unit!30370)

(assert (=> d!110165 (= lt!403582 lt!403581)))

(assert (=> d!110165 (= (getValueByKey!449 lt!403584 (_1!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))) (Some!454 (_2!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!247 (List!17805 (_ BitVec 64) V!29207) Unit!30370)

(assert (=> d!110165 (= lt!403581 (lemmaContainsTupThenGetReturnValue!247 lt!403584 (_1!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) (_2!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(declare-fun insertStrictlySorted!304 (List!17805 (_ BitVec 64) V!29207) List!17805)

(assert (=> d!110165 (= lt!403584 (insertStrictlySorted!304 (toList!5376 (ite c!94084 call!39619 (ite c!94083 call!39617 call!39615))) (_1!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) (_2!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(assert (=> d!110165 (= (+!2614 (ite c!94084 call!39619 (ite c!94083 call!39617 call!39615)) (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) lt!403583)))

(declare-fun b!893397 () Bool)

(declare-fun res!604965 () Bool)

(assert (=> b!893397 (=> (not res!604965) (not e!498926))))

(assert (=> b!893397 (= res!604965 (= (getValueByKey!449 (toList!5376 lt!403583) (_1!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))) (Some!454 (_2!6028 (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))))

(declare-fun b!893398 () Bool)

(declare-fun contains!4357 (List!17805 tuple2!12034) Bool)

(assert (=> b!893398 (= e!498926 (contains!4357 (toList!5376 lt!403583) (ite (or c!94084 c!94083) (tuple2!12035 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (= (and d!110165 res!604966) b!893397))

(assert (= (and b!893397 res!604965) b!893398))

(declare-fun m!830899 () Bool)

(assert (=> d!110165 m!830899))

(declare-fun m!830901 () Bool)

(assert (=> d!110165 m!830901))

(declare-fun m!830903 () Bool)

(assert (=> d!110165 m!830903))

(declare-fun m!830905 () Bool)

(assert (=> d!110165 m!830905))

(declare-fun m!830907 () Bool)

(assert (=> b!893397 m!830907))

(declare-fun m!830909 () Bool)

(assert (=> b!893398 m!830909))

(assert (=> bm!39616 d!110165))

(declare-fun d!110167 () Bool)

(assert (=> d!110167 (= (validMask!0 (mask!25841 thiss!1181)) (and (or (= (mask!25841 thiss!1181) #b00000000000000000000000000000111) (= (mask!25841 thiss!1181) #b00000000000000000000000000001111) (= (mask!25841 thiss!1181) #b00000000000000000000000000011111) (= (mask!25841 thiss!1181) #b00000000000000000000000000111111) (= (mask!25841 thiss!1181) #b00000000000000000000000001111111) (= (mask!25841 thiss!1181) #b00000000000000000000000011111111) (= (mask!25841 thiss!1181) #b00000000000000000000000111111111) (= (mask!25841 thiss!1181) #b00000000000000000000001111111111) (= (mask!25841 thiss!1181) #b00000000000000000000011111111111) (= (mask!25841 thiss!1181) #b00000000000000000000111111111111) (= (mask!25841 thiss!1181) #b00000000000000000001111111111111) (= (mask!25841 thiss!1181) #b00000000000000000011111111111111) (= (mask!25841 thiss!1181) #b00000000000000000111111111111111) (= (mask!25841 thiss!1181) #b00000000000000001111111111111111) (= (mask!25841 thiss!1181) #b00000000000000011111111111111111) (= (mask!25841 thiss!1181) #b00000000000000111111111111111111) (= (mask!25841 thiss!1181) #b00000000000001111111111111111111) (= (mask!25841 thiss!1181) #b00000000000011111111111111111111) (= (mask!25841 thiss!1181) #b00000000000111111111111111111111) (= (mask!25841 thiss!1181) #b00000000001111111111111111111111) (= (mask!25841 thiss!1181) #b00000000011111111111111111111111) (= (mask!25841 thiss!1181) #b00000000111111111111111111111111) (= (mask!25841 thiss!1181) #b00000001111111111111111111111111) (= (mask!25841 thiss!1181) #b00000011111111111111111111111111) (= (mask!25841 thiss!1181) #b00000111111111111111111111111111) (= (mask!25841 thiss!1181) #b00001111111111111111111111111111) (= (mask!25841 thiss!1181) #b00011111111111111111111111111111) (= (mask!25841 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25841 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!110125 d!110167))

(declare-fun b!893399 () Bool)

(declare-fun e!498928 () (_ BitVec 32))

(declare-fun call!39632 () (_ BitVec 32))

(assert (=> b!893399 (= e!498928 call!39632)))

(declare-fun b!893400 () Bool)

(declare-fun e!498927 () (_ BitVec 32))

(assert (=> b!893400 (= e!498927 #b00000000000000000000000000000000)))

(declare-fun b!893401 () Bool)

(assert (=> b!893401 (= e!498927 e!498928)))

(declare-fun c!94109 () Bool)

(assert (=> b!893401 (= c!94109 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!39629 () Bool)

(assert (=> bm!39629 (= call!39632 (arrayCountValidKeys!0 (_keys!9999 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun d!110169 () Bool)

(declare-fun lt!403585 () (_ BitVec 32))

(assert (=> d!110169 (and (bvsge lt!403585 #b00000000000000000000000000000000) (bvsle lt!403585 (bvsub (size!25615 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!110169 (= lt!403585 e!498927)))

(declare-fun c!94110 () Bool)

(assert (=> d!110169 (= c!94110 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110169 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!25615 (_keys!9999 thiss!1181)) (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110169 (= (arrayCountValidKeys!0 (_keys!9999 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))) lt!403585)))

(declare-fun b!893402 () Bool)

(assert (=> b!893402 (= e!498928 (bvadd #b00000000000000000000000000000001 call!39632))))

(assert (= (and d!110169 c!94110) b!893400))

(assert (= (and d!110169 (not c!94110)) b!893401))

(assert (= (and b!893401 c!94109) b!893402))

(assert (= (and b!893401 (not c!94109)) b!893399))

(assert (= (or b!893402 b!893399) bm!39629))

(assert (=> b!893401 m!830883))

(assert (=> b!893401 m!830883))

(assert (=> b!893401 m!830885))

(declare-fun m!830911 () Bool)

(assert (=> bm!39629 m!830911))

(assert (=> bm!39619 d!110169))

(declare-fun d!110171 () Bool)

(declare-fun lt!403586 () (_ BitVec 32))

(assert (=> d!110171 (and (or (bvslt lt!403586 #b00000000000000000000000000000000) (bvsge lt!403586 (size!25615 (_keys!9999 thiss!1181))) (and (bvsge lt!403586 #b00000000000000000000000000000000) (bvslt lt!403586 (size!25615 (_keys!9999 thiss!1181))))) (bvsge lt!403586 #b00000000000000000000000000000000) (bvslt lt!403586 (size!25615 (_keys!9999 thiss!1181))) (= (select (arr!25169 (_keys!9999 thiss!1181)) lt!403586) key!785))))

(declare-fun e!498929 () (_ BitVec 32))

(assert (=> d!110171 (= lt!403586 e!498929)))

(declare-fun c!94111 () Bool)

(assert (=> d!110171 (= c!94111 (= (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110171 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))) (bvslt (size!25615 (_keys!9999 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110171 (= (arrayScanForKey!0 (_keys!9999 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!403586)))

(declare-fun b!893403 () Bool)

(assert (=> b!893403 (= e!498929 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!893404 () Bool)

(assert (=> b!893404 (= e!498929 (arrayScanForKey!0 (_keys!9999 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110171 c!94111) b!893403))

(assert (= (and d!110171 (not c!94111)) b!893404))

(declare-fun m!830913 () Bool)

(assert (=> d!110171 m!830913))

(assert (=> d!110171 m!830883))

(declare-fun m!830915 () Bool)

(assert (=> b!893404 m!830915))

(assert (=> b!893382 d!110171))

(declare-fun b!893417 () Bool)

(declare-fun e!498936 () SeekEntryResult!8870)

(declare-fun e!498937 () SeekEntryResult!8870)

(assert (=> b!893417 (= e!498936 e!498937)))

(declare-fun c!94120 () Bool)

(declare-fun lt!403592 () (_ BitVec 64))

(assert (=> b!893417 (= c!94120 (= lt!403592 key!785))))

(declare-fun b!893418 () Bool)

(declare-fun e!498938 () SeekEntryResult!8870)

(assert (=> b!893418 (= e!498938 (MissingVacant!8870 (index!37853 lt!403447)))))

(declare-fun b!893419 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893419 (= e!498938 (seekKeyOrZeroReturnVacant!0 (bvadd (x!75965 lt!403447) #b00000000000000000000000000000001) (nextIndex!0 (index!37853 lt!403447) (x!75965 lt!403447) (mask!25841 thiss!1181)) (index!37853 lt!403447) key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun b!893420 () Bool)

(declare-fun c!94118 () Bool)

(assert (=> b!893420 (= c!94118 (= lt!403592 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893420 (= e!498937 e!498938)))

(declare-fun lt!403591 () SeekEntryResult!8870)

(declare-fun d!110173 () Bool)

(assert (=> d!110173 (and (or ((_ is Undefined!8870) lt!403591) (not ((_ is Found!8870) lt!403591)) (and (bvsge (index!37852 lt!403591) #b00000000000000000000000000000000) (bvslt (index!37852 lt!403591) (size!25615 (_keys!9999 thiss!1181))))) (or ((_ is Undefined!8870) lt!403591) ((_ is Found!8870) lt!403591) (not ((_ is MissingVacant!8870) lt!403591)) (not (= (index!37854 lt!403591) (index!37853 lt!403447))) (and (bvsge (index!37854 lt!403591) #b00000000000000000000000000000000) (bvslt (index!37854 lt!403591) (size!25615 (_keys!9999 thiss!1181))))) (or ((_ is Undefined!8870) lt!403591) (ite ((_ is Found!8870) lt!403591) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403591)) key!785) (and ((_ is MissingVacant!8870) lt!403591) (= (index!37854 lt!403591) (index!37853 lt!403447)) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37854 lt!403591)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110173 (= lt!403591 e!498936)))

(declare-fun c!94119 () Bool)

(assert (=> d!110173 (= c!94119 (bvsge (x!75965 lt!403447) #b01111111111111111111111111111110))))

(assert (=> d!110173 (= lt!403592 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37853 lt!403447)))))

(assert (=> d!110173 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110173 (= (seekKeyOrZeroReturnVacant!0 (x!75965 lt!403447) (index!37853 lt!403447) (index!37853 lt!403447) key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) lt!403591)))

(declare-fun b!893421 () Bool)

(assert (=> b!893421 (= e!498936 Undefined!8870)))

(declare-fun b!893422 () Bool)

(assert (=> b!893422 (= e!498937 (Found!8870 (index!37853 lt!403447)))))

(assert (= (and d!110173 c!94119) b!893421))

(assert (= (and d!110173 (not c!94119)) b!893417))

(assert (= (and b!893417 c!94120) b!893422))

(assert (= (and b!893417 (not c!94120)) b!893420))

(assert (= (and b!893420 c!94118) b!893418))

(assert (= (and b!893420 (not c!94118)) b!893419))

(declare-fun m!830917 () Bool)

(assert (=> b!893419 m!830917))

(assert (=> b!893419 m!830917))

(declare-fun m!830919 () Bool)

(assert (=> b!893419 m!830919))

(declare-fun m!830921 () Bool)

(assert (=> d!110173 m!830921))

(declare-fun m!830923 () Bool)

(assert (=> d!110173 m!830923))

(assert (=> d!110173 m!830737))

(assert (=> d!110173 m!830745))

(assert (=> b!893231 d!110173))

(assert (=> b!893302 d!110161))

(declare-fun b!893447 () Bool)

(declare-fun e!498958 () ListLongMap!10721)

(declare-fun call!39635 () ListLongMap!10721)

(assert (=> b!893447 (= e!498958 call!39635)))

(declare-fun b!893448 () Bool)

(declare-fun e!498953 () ListLongMap!10721)

(assert (=> b!893448 (= e!498953 (ListLongMap!10722 Nil!17802))))

(declare-fun b!893449 () Bool)

(assert (=> b!893449 (= e!498953 e!498958)))

(declare-fun c!94132 () Bool)

(assert (=> b!893449 (= c!94132 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39632 () Bool)

(assert (=> bm!39632 (= call!39635 (getCurrentListMapNoExtraKeys!3311 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5317 thiss!1181)))))

(declare-fun b!893450 () Bool)

(declare-fun e!498955 () Bool)

(assert (=> b!893450 (= e!498955 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893450 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!110175 () Bool)

(declare-fun e!498954 () Bool)

(assert (=> d!110175 e!498954))

(declare-fun res!604977 () Bool)

(assert (=> d!110175 (=> (not res!604977) (not e!498954))))

(declare-fun lt!403609 () ListLongMap!10721)

(assert (=> d!110175 (= res!604977 (not (contains!4355 lt!403609 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!110175 (= lt!403609 e!498953)))

(declare-fun c!94129 () Bool)

(assert (=> d!110175 (= c!94129 (bvsge #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110175 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110175 (= (getCurrentListMapNoExtraKeys!3311 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) lt!403609)))

(declare-fun b!893451 () Bool)

(declare-fun lt!403611 () Unit!30370)

(declare-fun lt!403613 () Unit!30370)

(assert (=> b!893451 (= lt!403611 lt!403613)))

(declare-fun lt!403607 () ListLongMap!10721)

(declare-fun lt!403610 () (_ BitVec 64))

(declare-fun lt!403612 () V!29207)

(declare-fun lt!403608 () (_ BitVec 64))

(assert (=> b!893451 (not (contains!4355 (+!2614 lt!403607 (tuple2!12035 lt!403608 lt!403612)) lt!403610))))

(declare-fun addStillNotContains!213 (ListLongMap!10721 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30370)

(assert (=> b!893451 (= lt!403613 (addStillNotContains!213 lt!403607 lt!403608 lt!403612 lt!403610))))

(assert (=> b!893451 (= lt!403610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!893451 (= lt!403612 (get!13256 (select (arr!25170 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1293 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!893451 (= lt!403608 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893451 (= lt!403607 call!39635)))

(assert (=> b!893451 (= e!498958 (+!2614 call!39635 (tuple2!12035 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) (get!13256 (select (arr!25170 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1293 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!893452 () Bool)

(declare-fun e!498959 () Bool)

(declare-fun e!498956 () Bool)

(assert (=> b!893452 (= e!498959 e!498956)))

(declare-fun c!94130 () Bool)

(assert (=> b!893452 (= c!94130 (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893453 () Bool)

(assert (=> b!893453 (= e!498954 e!498959)))

(declare-fun c!94131 () Bool)

(assert (=> b!893453 (= c!94131 e!498955)))

(declare-fun res!604975 () Bool)

(assert (=> b!893453 (=> (not res!604975) (not e!498955))))

(assert (=> b!893453 (= res!604975 (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893454 () Bool)

(assert (=> b!893454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> b!893454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25616 (_values!5304 thiss!1181))))))

(declare-fun e!498957 () Bool)

(assert (=> b!893454 (= e!498957 (= (apply!403 lt!403609 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)) (get!13256 (select (arr!25170 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1293 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!893455 () Bool)

(assert (=> b!893455 (= e!498956 (= lt!403609 (getCurrentListMapNoExtraKeys!3311 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5317 thiss!1181))))))

(declare-fun b!893456 () Bool)

(declare-fun isEmpty!686 (ListLongMap!10721) Bool)

(assert (=> b!893456 (= e!498956 (isEmpty!686 lt!403609))))

(declare-fun b!893457 () Bool)

(declare-fun res!604976 () Bool)

(assert (=> b!893457 (=> (not res!604976) (not e!498954))))

(assert (=> b!893457 (= res!604976 (not (contains!4355 lt!403609 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893458 () Bool)

(assert (=> b!893458 (= e!498959 e!498957)))

(assert (=> b!893458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun res!604978 () Bool)

(assert (=> b!893458 (= res!604978 (contains!4355 lt!403609 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893458 (=> (not res!604978) (not e!498957))))

(assert (= (and d!110175 c!94129) b!893448))

(assert (= (and d!110175 (not c!94129)) b!893449))

(assert (= (and b!893449 c!94132) b!893451))

(assert (= (and b!893449 (not c!94132)) b!893447))

(assert (= (or b!893451 b!893447) bm!39632))

(assert (= (and d!110175 res!604977) b!893457))

(assert (= (and b!893457 res!604976) b!893453))

(assert (= (and b!893453 res!604975) b!893450))

(assert (= (and b!893453 c!94131) b!893458))

(assert (= (and b!893453 (not c!94131)) b!893452))

(assert (= (and b!893458 res!604978) b!893454))

(assert (= (and b!893452 c!94130) b!893455))

(assert (= (and b!893452 (not c!94130)) b!893456))

(declare-fun b_lambda!12905 () Bool)

(assert (=> (not b_lambda!12905) (not b!893451)))

(assert (=> b!893451 t!25124))

(declare-fun b_and!26103 () Bool)

(assert (= b_and!26101 (and (=> t!25124 result!10059) b_and!26103)))

(declare-fun b_lambda!12907 () Bool)

(assert (=> (not b_lambda!12907) (not b!893454)))

(assert (=> b!893454 t!25124))

(declare-fun b_and!26105 () Bool)

(assert (= b_and!26103 (and (=> t!25124 result!10059) b_and!26105)))

(declare-fun m!830925 () Bool)

(assert (=> b!893457 m!830925))

(declare-fun m!830927 () Bool)

(assert (=> b!893456 m!830927))

(assert (=> b!893450 m!830759))

(assert (=> b!893450 m!830759))

(assert (=> b!893450 m!830761))

(declare-fun m!830929 () Bool)

(assert (=> b!893451 m!830929))

(declare-fun m!830931 () Bool)

(assert (=> b!893451 m!830931))

(assert (=> b!893451 m!830811))

(declare-fun m!830933 () Bool)

(assert (=> b!893451 m!830933))

(declare-fun m!830935 () Bool)

(assert (=> b!893451 m!830935))

(assert (=> b!893451 m!830809))

(assert (=> b!893451 m!830933))

(assert (=> b!893451 m!830809))

(assert (=> b!893451 m!830811))

(assert (=> b!893451 m!830815))

(assert (=> b!893451 m!830759))

(declare-fun m!830937 () Bool)

(assert (=> d!110175 m!830937))

(assert (=> d!110175 m!830745))

(assert (=> b!893454 m!830759))

(declare-fun m!830939 () Bool)

(assert (=> b!893454 m!830939))

(assert (=> b!893454 m!830809))

(assert (=> b!893454 m!830811))

(assert (=> b!893454 m!830809))

(assert (=> b!893454 m!830811))

(assert (=> b!893454 m!830815))

(assert (=> b!893454 m!830759))

(assert (=> b!893458 m!830759))

(assert (=> b!893458 m!830759))

(declare-fun m!830941 () Bool)

(assert (=> b!893458 m!830941))

(declare-fun m!830943 () Bool)

(assert (=> bm!39632 m!830943))

(assert (=> b!893449 m!830759))

(assert (=> b!893449 m!830759))

(assert (=> b!893449 m!830761))

(assert (=> b!893455 m!830943))

(assert (=> bm!39612 d!110175))

(declare-fun d!110177 () Bool)

(declare-fun e!498960 () Bool)

(assert (=> d!110177 e!498960))

(declare-fun res!604979 () Bool)

(assert (=> d!110177 (=> res!604979 e!498960)))

(declare-fun lt!403617 () Bool)

(assert (=> d!110177 (= res!604979 (not lt!403617))))

(declare-fun lt!403616 () Bool)

(assert (=> d!110177 (= lt!403617 lt!403616)))

(declare-fun lt!403615 () Unit!30370)

(declare-fun e!498961 () Unit!30370)

(assert (=> d!110177 (= lt!403615 e!498961)))

(declare-fun c!94133 () Bool)

(assert (=> d!110177 (= c!94133 lt!403616)))

(assert (=> d!110177 (= lt!403616 (containsKey!422 (toList!5376 lt!403516) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110177 (= (contains!4355 lt!403516 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)) lt!403617)))

(declare-fun b!893459 () Bool)

(declare-fun lt!403614 () Unit!30370)

(assert (=> b!893459 (= e!498961 lt!403614)))

(assert (=> b!893459 (= lt!403614 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 lt!403516) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893459 (isDefined!330 (getValueByKey!449 (toList!5376 lt!403516) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893460 () Bool)

(declare-fun Unit!30377 () Unit!30370)

(assert (=> b!893460 (= e!498961 Unit!30377)))

(declare-fun b!893461 () Bool)

(assert (=> b!893461 (= e!498960 (isDefined!330 (getValueByKey!449 (toList!5376 lt!403516) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!110177 c!94133) b!893459))

(assert (= (and d!110177 (not c!94133)) b!893460))

(assert (= (and d!110177 (not res!604979)) b!893461))

(assert (=> d!110177 m!830759))

(declare-fun m!830945 () Bool)

(assert (=> d!110177 m!830945))

(assert (=> b!893459 m!830759))

(declare-fun m!830947 () Bool)

(assert (=> b!893459 m!830947))

(assert (=> b!893459 m!830759))

(declare-fun m!830949 () Bool)

(assert (=> b!893459 m!830949))

(assert (=> b!893459 m!830949))

(declare-fun m!830951 () Bool)

(assert (=> b!893459 m!830951))

(assert (=> b!893461 m!830759))

(assert (=> b!893461 m!830949))

(assert (=> b!893461 m!830949))

(assert (=> b!893461 m!830951))

(assert (=> b!893303 d!110177))

(declare-fun d!110179 () Bool)

(assert (=> d!110179 (= (size!25621 thiss!1181) (bvadd (_size!2172 thiss!1181) (bvsdiv (bvadd (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!893250 d!110179))

(declare-fun d!110181 () Bool)

(assert (=> d!110181 (= (apply!403 lt!403516 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)) (get!13253 (getValueByKey!449 (toList!5376 lt!403516) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25047 () Bool)

(assert (= bs!25047 d!110181))

(assert (=> bs!25047 m!830759))

(assert (=> bs!25047 m!830949))

(assert (=> bs!25047 m!830949))

(declare-fun m!830953 () Bool)

(assert (=> bs!25047 m!830953))

(assert (=> b!893305 d!110181))

(declare-fun d!110183 () Bool)

(declare-fun c!94136 () Bool)

(assert (=> d!110183 (= c!94136 ((_ is ValueCellFull!8609) (select (arr!25170 (_values!5304 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!498964 () V!29207)

(assert (=> d!110183 (= (get!13256 (select (arr!25170 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1293 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!498964)))

(declare-fun b!893466 () Bool)

(declare-fun get!13257 (ValueCell!8609 V!29207) V!29207)

(assert (=> b!893466 (= e!498964 (get!13257 (select (arr!25170 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1293 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893467 () Bool)

(declare-fun get!13258 (ValueCell!8609 V!29207) V!29207)

(assert (=> b!893467 (= e!498964 (get!13258 (select (arr!25170 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1293 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110183 c!94136) b!893466))

(assert (= (and d!110183 (not c!94136)) b!893467))

(assert (=> b!893466 m!830809))

(assert (=> b!893466 m!830811))

(declare-fun m!830955 () Bool)

(assert (=> b!893466 m!830955))

(assert (=> b!893467 m!830809))

(assert (=> b!893467 m!830811))

(declare-fun m!830957 () Bool)

(assert (=> b!893467 m!830957))

(assert (=> b!893305 d!110183))

(assert (=> b!893251 d!110179))

(declare-fun d!110185 () Bool)

(declare-fun res!604984 () Bool)

(declare-fun e!498969 () Bool)

(assert (=> d!110185 (=> res!604984 e!498969)))

(assert (=> d!110185 (= res!604984 (and ((_ is Cons!17801) (toList!5376 (map!12199 thiss!1181))) (= (_1!6028 (h!18932 (toList!5376 (map!12199 thiss!1181)))) key!785)))))

(assert (=> d!110185 (= (containsKey!422 (toList!5376 (map!12199 thiss!1181)) key!785) e!498969)))

(declare-fun b!893472 () Bool)

(declare-fun e!498970 () Bool)

(assert (=> b!893472 (= e!498969 e!498970)))

(declare-fun res!604985 () Bool)

(assert (=> b!893472 (=> (not res!604985) (not e!498970))))

(assert (=> b!893472 (= res!604985 (and (or (not ((_ is Cons!17801) (toList!5376 (map!12199 thiss!1181)))) (bvsle (_1!6028 (h!18932 (toList!5376 (map!12199 thiss!1181)))) key!785)) ((_ is Cons!17801) (toList!5376 (map!12199 thiss!1181))) (bvslt (_1!6028 (h!18932 (toList!5376 (map!12199 thiss!1181)))) key!785)))))

(declare-fun b!893473 () Bool)

(assert (=> b!893473 (= e!498970 (containsKey!422 (t!25115 (toList!5376 (map!12199 thiss!1181))) key!785))))

(assert (= (and d!110185 (not res!604984)) b!893472))

(assert (= (and b!893472 res!604985) b!893473))

(declare-fun m!830959 () Bool)

(assert (=> b!893473 m!830959))

(assert (=> d!110135 d!110185))

(declare-fun d!110187 () Bool)

(declare-fun res!604986 () Bool)

(declare-fun e!498971 () Bool)

(assert (=> d!110187 (=> res!604986 e!498971)))

(assert (=> d!110187 (= res!604986 (= (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110187 (= (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!498971)))

(declare-fun b!893474 () Bool)

(declare-fun e!498972 () Bool)

(assert (=> b!893474 (= e!498971 e!498972)))

(declare-fun res!604987 () Bool)

(assert (=> b!893474 (=> (not res!604987) (not e!498972))))

(assert (=> b!893474 (= res!604987 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893475 () Bool)

(assert (=> b!893475 (= e!498972 (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110187 (not res!604986)) b!893474))

(assert (= (and b!893474 res!604987) b!893475))

(assert (=> d!110187 m!830883))

(declare-fun m!830961 () Bool)

(assert (=> b!893475 m!830961))

(assert (=> b!893333 d!110187))

(assert (=> d!110151 d!110121))

(declare-fun d!110189 () Bool)

(declare-fun lt!403620 () SeekEntryResult!8870)

(assert (=> d!110189 (and ((_ is Found!8870) lt!403620) (= (index!37852 lt!403620) lt!403436))))

(assert (=> d!110189 (= lt!403620 (seekEntry!0 key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (=> d!110189 true))

(declare-fun _$57!19 () Unit!30370)

(assert (=> d!110189 (= (choose!0 key!785 lt!403436 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) _$57!19)))

(declare-fun bs!25048 () Bool)

(assert (= bs!25048 d!110189))

(assert (=> bs!25048 m!830721))

(assert (=> d!110151 d!110189))

(assert (=> d!110151 d!110167))

(declare-fun d!110191 () Bool)

(declare-fun c!94137 () Bool)

(assert (=> d!110191 (= c!94137 (and ((_ is Cons!17801) (t!25115 (t!25115 (toList!5376 (map!12199 thiss!1181))))) (= (_1!6028 (h!18932 (t!25115 (t!25115 (toList!5376 (map!12199 thiss!1181)))))) key!785)))))

(declare-fun e!498973 () Option!455)

(assert (=> d!110191 (= (getValueByKey!449 (t!25115 (t!25115 (toList!5376 (map!12199 thiss!1181)))) key!785) e!498973)))

(declare-fun b!893476 () Bool)

(assert (=> b!893476 (= e!498973 (Some!454 (_2!6028 (h!18932 (t!25115 (t!25115 (toList!5376 (map!12199 thiss!1181))))))))))

(declare-fun b!893479 () Bool)

(declare-fun e!498974 () Option!455)

(assert (=> b!893479 (= e!498974 None!453)))

(declare-fun b!893477 () Bool)

(assert (=> b!893477 (= e!498973 e!498974)))

(declare-fun c!94138 () Bool)

(assert (=> b!893477 (= c!94138 (and ((_ is Cons!17801) (t!25115 (t!25115 (toList!5376 (map!12199 thiss!1181))))) (not (= (_1!6028 (h!18932 (t!25115 (t!25115 (toList!5376 (map!12199 thiss!1181)))))) key!785))))))

(declare-fun b!893478 () Bool)

(assert (=> b!893478 (= e!498974 (getValueByKey!449 (t!25115 (t!25115 (t!25115 (toList!5376 (map!12199 thiss!1181))))) key!785))))

(assert (= (and d!110191 c!94137) b!893476))

(assert (= (and d!110191 (not c!94137)) b!893477))

(assert (= (and b!893477 c!94138) b!893478))

(assert (= (and b!893477 (not c!94138)) b!893479))

(declare-fun m!830963 () Bool)

(assert (=> b!893478 m!830963))

(assert (=> b!893212 d!110191))

(assert (=> b!893360 d!110161))

(declare-fun d!110193 () Bool)

(assert (=> d!110193 (= (apply!403 lt!403516 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13253 (getValueByKey!449 (toList!5376 lt!403516) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25049 () Bool)

(assert (= bs!25049 d!110193))

(declare-fun m!830965 () Bool)

(assert (=> bs!25049 m!830965))

(assert (=> bs!25049 m!830965))

(declare-fun m!830967 () Bool)

(assert (=> bs!25049 m!830967))

(assert (=> b!893307 d!110193))

(assert (=> b!893361 d!110161))

(declare-fun d!110195 () Bool)

(assert (=> d!110195 (isDefined!330 (getValueByKey!449 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(declare-fun lt!403623 () Unit!30370)

(declare-fun choose!1475 (List!17805 (_ BitVec 64)) Unit!30370)

(assert (=> d!110195 (= lt!403623 (choose!1475 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(declare-fun e!498977 () Bool)

(assert (=> d!110195 e!498977))

(declare-fun res!604990 () Bool)

(assert (=> d!110195 (=> (not res!604990) (not e!498977))))

(declare-fun isStrictlySorted!491 (List!17805) Bool)

(assert (=> d!110195 (= res!604990 (isStrictlySorted!491 (toList!5376 call!39596)))))

(assert (=> d!110195 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)) lt!403623)))

(declare-fun b!893482 () Bool)

(assert (=> b!893482 (= e!498977 (containsKey!422 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(assert (= (and d!110195 res!604990) b!893482))

(assert (=> d!110195 m!830753))

(assert (=> d!110195 m!830753))

(assert (=> d!110195 m!830755))

(declare-fun m!830969 () Bool)

(assert (=> d!110195 m!830969))

(declare-fun m!830971 () Bool)

(assert (=> d!110195 m!830971))

(assert (=> b!893482 m!830749))

(assert (=> b!893238 d!110195))

(declare-fun d!110197 () Bool)

(assert (=> d!110197 (= (isDefined!330 (getValueByKey!449 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785))) (not (isEmpty!685 (getValueByKey!449 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))))

(declare-fun bs!25050 () Bool)

(assert (= bs!25050 d!110197))

(assert (=> bs!25050 m!830753))

(declare-fun m!830973 () Bool)

(assert (=> bs!25050 m!830973))

(assert (=> b!893238 d!110197))

(declare-fun c!94139 () Bool)

(declare-fun d!110199 () Bool)

(assert (=> d!110199 (= c!94139 (and ((_ is Cons!17801) (toList!5376 call!39596)) (= (_1!6028 (h!18932 (toList!5376 call!39596))) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785))))))

(declare-fun e!498978 () Option!455)

(assert (=> d!110199 (= (getValueByKey!449 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)) e!498978)))

(declare-fun b!893483 () Bool)

(assert (=> b!893483 (= e!498978 (Some!454 (_2!6028 (h!18932 (toList!5376 call!39596)))))))

(declare-fun b!893486 () Bool)

(declare-fun e!498979 () Option!455)

(assert (=> b!893486 (= e!498979 None!453)))

(declare-fun b!893484 () Bool)

(assert (=> b!893484 (= e!498978 e!498979)))

(declare-fun c!94140 () Bool)

(assert (=> b!893484 (= c!94140 (and ((_ is Cons!17801) (toList!5376 call!39596)) (not (= (_1!6028 (h!18932 (toList!5376 call!39596))) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))))

(declare-fun b!893485 () Bool)

(assert (=> b!893485 (= e!498979 (getValueByKey!449 (t!25115 (toList!5376 call!39596)) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(assert (= (and d!110199 c!94139) b!893483))

(assert (= (and d!110199 (not c!94139)) b!893484))

(assert (= (and b!893484 c!94140) b!893485))

(assert (= (and b!893484 (not c!94140)) b!893486))

(declare-fun m!830975 () Bool)

(assert (=> b!893485 m!830975))

(assert (=> b!893238 d!110199))

(declare-fun d!110201 () Bool)

(assert (=> d!110201 (contains!4355 (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)))))

(assert (=> d!110201 true))

(declare-fun _$16!172 () Unit!30370)

(assert (=> d!110201 (= (choose!1473 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (index!37852 lt!403422) (defaultEntry!5317 thiss!1181)) _$16!172)))

(declare-fun bs!25051 () Bool)

(assert (= bs!25051 d!110201))

(assert (=> bs!25051 m!830699))

(assert (=> bs!25051 m!830729))

(assert (=> bs!25051 m!830699))

(assert (=> bs!25051 m!830729))

(assert (=> bs!25051 m!830843))

(assert (=> d!110141 d!110201))

(assert (=> d!110141 d!110167))

(declare-fun d!110203 () Bool)

(declare-fun res!604992 () Bool)

(declare-fun e!498980 () Bool)

(assert (=> d!110203 (=> res!604992 e!498980)))

(assert (=> d!110203 (= res!604992 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> d!110203 (= (arrayNoDuplicates!0 (_keys!9999 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94099 (Cons!17804 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) Nil!17805) Nil!17805)) e!498980)))

(declare-fun b!893487 () Bool)

(declare-fun e!498981 () Bool)

(declare-fun call!39636 () Bool)

(assert (=> b!893487 (= e!498981 call!39636)))

(declare-fun b!893488 () Bool)

(declare-fun e!498983 () Bool)

(assert (=> b!893488 (= e!498980 e!498983)))

(declare-fun res!604991 () Bool)

(assert (=> b!893488 (=> (not res!604991) (not e!498983))))

(declare-fun e!498982 () Bool)

(assert (=> b!893488 (= res!604991 (not e!498982))))

(declare-fun res!604993 () Bool)

(assert (=> b!893488 (=> (not res!604993) (not e!498982))))

(assert (=> b!893488 (= res!604993 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!893489 () Bool)

(assert (=> b!893489 (= e!498983 e!498981)))

(declare-fun c!94141 () Bool)

(assert (=> b!893489 (= c!94141 (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!39633 () Bool)

(assert (=> bm!39633 (= call!39636 (arrayNoDuplicates!0 (_keys!9999 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!94141 (Cons!17804 (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!94099 (Cons!17804 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) Nil!17805) Nil!17805)) (ite c!94099 (Cons!17804 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) Nil!17805) Nil!17805))))))

(declare-fun b!893490 () Bool)

(assert (=> b!893490 (= e!498982 (contains!4356 (ite c!94099 (Cons!17804 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) Nil!17805) Nil!17805) (select (arr!25169 (_keys!9999 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!893491 () Bool)

(assert (=> b!893491 (= e!498981 call!39636)))

(assert (= (and d!110203 (not res!604992)) b!893488))

(assert (= (and b!893488 res!604993) b!893490))

(assert (= (and b!893488 res!604991) b!893489))

(assert (= (and b!893489 c!94141) b!893487))

(assert (= (and b!893489 (not c!94141)) b!893491))

(assert (= (or b!893487 b!893491) bm!39633))

(assert (=> b!893488 m!830883))

(assert (=> b!893488 m!830883))

(assert (=> b!893488 m!830885))

(assert (=> b!893489 m!830883))

(assert (=> b!893489 m!830883))

(assert (=> b!893489 m!830885))

(assert (=> bm!39633 m!830883))

(declare-fun m!830977 () Bool)

(assert (=> bm!39633 m!830977))

(assert (=> b!893490 m!830883))

(assert (=> b!893490 m!830883))

(declare-fun m!830979 () Bool)

(assert (=> b!893490 m!830979))

(assert (=> bm!39625 d!110203))

(assert (=> d!110147 d!110145))

(declare-fun d!110205 () Bool)

(assert (=> d!110205 (arrayForallSeekEntryOrOpenFound!0 lt!403436 (_keys!9999 thiss!1181) (mask!25841 thiss!1181))))

(assert (=> d!110205 true))

(declare-fun _$72!116 () Unit!30370)

(assert (=> d!110205 (= (choose!38 (_keys!9999 thiss!1181) (mask!25841 thiss!1181) #b00000000000000000000000000000000 lt!403436) _$72!116)))

(declare-fun bs!25052 () Bool)

(assert (= bs!25052 d!110205))

(assert (=> bs!25052 m!830715))

(assert (=> d!110147 d!110205))

(assert (=> d!110147 d!110167))

(declare-fun d!110207 () Bool)

(declare-fun e!498984 () Bool)

(assert (=> d!110207 e!498984))

(declare-fun res!604994 () Bool)

(assert (=> d!110207 (=> res!604994 e!498984)))

(declare-fun lt!403627 () Bool)

(assert (=> d!110207 (= res!604994 (not lt!403627))))

(declare-fun lt!403626 () Bool)

(assert (=> d!110207 (= lt!403627 lt!403626)))

(declare-fun lt!403625 () Unit!30370)

(declare-fun e!498985 () Unit!30370)

(assert (=> d!110207 (= lt!403625 e!498985)))

(declare-fun c!94142 () Bool)

(assert (=> d!110207 (= c!94142 lt!403626)))

(assert (=> d!110207 (= lt!403626 (containsKey!422 (toList!5376 (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181))) (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422))))))

(assert (=> d!110207 (= (contains!4355 (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422))) lt!403627)))

(declare-fun b!893492 () Bool)

(declare-fun lt!403624 () Unit!30370)

(assert (=> b!893492 (= e!498985 lt!403624)))

(assert (=> b!893492 (= lt!403624 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181))) (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422))))))

(assert (=> b!893492 (isDefined!330 (getValueByKey!449 (toList!5376 (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181))) (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422))))))

(declare-fun b!893493 () Bool)

(declare-fun Unit!30378 () Unit!30370)

(assert (=> b!893493 (= e!498985 Unit!30378)))

(declare-fun b!893494 () Bool)

(assert (=> b!893494 (= e!498984 (isDefined!330 (getValueByKey!449 (toList!5376 (getCurrentListMap!2599 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181))) (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)))))))

(assert (= (and d!110207 c!94142) b!893492))

(assert (= (and d!110207 (not c!94142)) b!893493))

(assert (= (and d!110207 (not res!604994)) b!893494))

(assert (=> d!110207 m!830729))

(declare-fun m!830981 () Bool)

(assert (=> d!110207 m!830981))

(assert (=> b!893492 m!830729))

(declare-fun m!830983 () Bool)

(assert (=> b!893492 m!830983))

(assert (=> b!893492 m!830729))

(declare-fun m!830985 () Bool)

(assert (=> b!893492 m!830985))

(assert (=> b!893492 m!830985))

(declare-fun m!830987 () Bool)

(assert (=> b!893492 m!830987))

(assert (=> b!893494 m!830729))

(assert (=> b!893494 m!830985))

(assert (=> b!893494 m!830985))

(assert (=> b!893494 m!830987))

(assert (=> b!893366 d!110207))

(assert (=> b!893366 d!110127))

(declare-fun d!110209 () Bool)

(declare-fun e!498986 () Bool)

(assert (=> d!110209 e!498986))

(declare-fun res!604995 () Bool)

(assert (=> d!110209 (=> res!604995 e!498986)))

(declare-fun lt!403631 () Bool)

(assert (=> d!110209 (= res!604995 (not lt!403631))))

(declare-fun lt!403630 () Bool)

(assert (=> d!110209 (= lt!403631 lt!403630)))

(declare-fun lt!403629 () Unit!30370)

(declare-fun e!498987 () Unit!30370)

(assert (=> d!110209 (= lt!403629 e!498987)))

(declare-fun c!94143 () Bool)

(assert (=> d!110209 (= c!94143 lt!403630)))

(assert (=> d!110209 (= lt!403630 (containsKey!422 (toList!5376 lt!403516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110209 (= (contains!4355 lt!403516 #b1000000000000000000000000000000000000000000000000000000000000000) lt!403631)))

(declare-fun b!893495 () Bool)

(declare-fun lt!403628 () Unit!30370)

(assert (=> b!893495 (= e!498987 lt!403628)))

(assert (=> b!893495 (= lt!403628 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 lt!403516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893495 (isDefined!330 (getValueByKey!449 (toList!5376 lt!403516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893496 () Bool)

(declare-fun Unit!30379 () Unit!30370)

(assert (=> b!893496 (= e!498987 Unit!30379)))

(declare-fun b!893497 () Bool)

(assert (=> b!893497 (= e!498986 (isDefined!330 (getValueByKey!449 (toList!5376 lt!403516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110209 c!94143) b!893495))

(assert (= (and d!110209 (not c!94143)) b!893496))

(assert (= (and d!110209 (not res!604995)) b!893497))

(declare-fun m!830989 () Bool)

(assert (=> d!110209 m!830989))

(declare-fun m!830991 () Bool)

(assert (=> b!893495 m!830991))

(assert (=> b!893495 m!830895))

(assert (=> b!893495 m!830895))

(declare-fun m!830993 () Bool)

(assert (=> b!893495 m!830993))

(assert (=> b!893497 m!830895))

(assert (=> b!893497 m!830895))

(assert (=> b!893497 m!830993))

(assert (=> bm!39613 d!110209))

(declare-fun d!110211 () Bool)

(declare-fun e!498988 () Bool)

(assert (=> d!110211 e!498988))

(declare-fun res!604996 () Bool)

(assert (=> d!110211 (=> res!604996 e!498988)))

(declare-fun lt!403635 () Bool)

(assert (=> d!110211 (= res!604996 (not lt!403635))))

(declare-fun lt!403634 () Bool)

(assert (=> d!110211 (= lt!403635 lt!403634)))

(declare-fun lt!403633 () Unit!30370)

(declare-fun e!498989 () Unit!30370)

(assert (=> d!110211 (= lt!403633 e!498989)))

(declare-fun c!94144 () Bool)

(assert (=> d!110211 (= c!94144 lt!403634)))

(assert (=> d!110211 (= lt!403634 (containsKey!422 (toList!5376 lt!403516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110211 (= (contains!4355 lt!403516 #b0000000000000000000000000000000000000000000000000000000000000000) lt!403635)))

(declare-fun b!893498 () Bool)

(declare-fun lt!403632 () Unit!30370)

(assert (=> b!893498 (= e!498989 lt!403632)))

(assert (=> b!893498 (= lt!403632 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 lt!403516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893498 (isDefined!330 (getValueByKey!449 (toList!5376 lt!403516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893499 () Bool)

(declare-fun Unit!30380 () Unit!30370)

(assert (=> b!893499 (= e!498989 Unit!30380)))

(declare-fun b!893500 () Bool)

(assert (=> b!893500 (= e!498988 (isDefined!330 (getValueByKey!449 (toList!5376 lt!403516) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110211 c!94144) b!893498))

(assert (= (and d!110211 (not c!94144)) b!893499))

(assert (= (and d!110211 (not res!604996)) b!893500))

(declare-fun m!830995 () Bool)

(assert (=> d!110211 m!830995))

(declare-fun m!830997 () Bool)

(assert (=> b!893498 m!830997))

(assert (=> b!893498 m!830965))

(assert (=> b!893498 m!830965))

(declare-fun m!830999 () Bool)

(assert (=> b!893498 m!830999))

(assert (=> b!893500 m!830965))

(assert (=> b!893500 m!830965))

(assert (=> b!893500 m!830999))

(assert (=> bm!39614 d!110211))

(declare-fun d!110213 () Bool)

(declare-fun lt!403638 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!398 (List!17808) (InoxSet (_ BitVec 64)))

(assert (=> d!110213 (= lt!403638 (select (content!398 Nil!17805) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!498995 () Bool)

(assert (=> d!110213 (= lt!403638 e!498995)))

(declare-fun res!605002 () Bool)

(assert (=> d!110213 (=> (not res!605002) (not e!498995))))

(assert (=> d!110213 (= res!605002 ((_ is Cons!17804) Nil!17805))))

(assert (=> d!110213 (= (contains!4356 Nil!17805 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)) lt!403638)))

(declare-fun b!893505 () Bool)

(declare-fun e!498994 () Bool)

(assert (=> b!893505 (= e!498995 e!498994)))

(declare-fun res!605001 () Bool)

(assert (=> b!893505 (=> res!605001 e!498994)))

(assert (=> b!893505 (= res!605001 (= (h!18935 Nil!17805) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893506 () Bool)

(assert (=> b!893506 (= e!498994 (contains!4356 (t!25122 Nil!17805) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110213 res!605002) b!893505))

(assert (= (and b!893505 (not res!605001)) b!893506))

(declare-fun m!831001 () Bool)

(assert (=> d!110213 m!831001))

(assert (=> d!110213 m!830759))

(declare-fun m!831003 () Bool)

(assert (=> d!110213 m!831003))

(assert (=> b!893506 m!830759))

(declare-fun m!831005 () Bool)

(assert (=> b!893506 m!831005))

(assert (=> b!893362 d!110213))

(assert (=> b!893240 d!110197))

(assert (=> b!893240 d!110199))

(declare-fun b!893525 () Bool)

(declare-fun lt!403644 () SeekEntryResult!8870)

(assert (=> b!893525 (and (bvsge (index!37853 lt!403644) #b00000000000000000000000000000000) (bvslt (index!37853 lt!403644) (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun res!605010 () Bool)

(assert (=> b!893525 (= res!605010 (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37853 lt!403644)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499009 () Bool)

(assert (=> b!893525 (=> res!605010 e!499009)))

(declare-fun d!110215 () Bool)

(declare-fun e!499007 () Bool)

(assert (=> d!110215 e!499007))

(declare-fun c!94152 () Bool)

(assert (=> d!110215 (= c!94152 (and ((_ is Intermediate!8870) lt!403644) (undefined!9682 lt!403644)))))

(declare-fun e!499010 () SeekEntryResult!8870)

(assert (=> d!110215 (= lt!403644 e!499010)))

(declare-fun c!94151 () Bool)

(assert (=> d!110215 (= c!94151 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!403643 () (_ BitVec 64))

(assert (=> d!110215 (= lt!403643 (select (arr!25169 (_keys!9999 thiss!1181)) (toIndex!0 key!785 (mask!25841 thiss!1181))))))

(assert (=> d!110215 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25841 thiss!1181)) key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) lt!403644)))

(declare-fun b!893526 () Bool)

(assert (=> b!893526 (and (bvsge (index!37853 lt!403644) #b00000000000000000000000000000000) (bvslt (index!37853 lt!403644) (size!25615 (_keys!9999 thiss!1181))))))

(assert (=> b!893526 (= e!499009 (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37853 lt!403644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893527 () Bool)

(declare-fun e!499008 () Bool)

(assert (=> b!893527 (= e!499007 e!499008)))

(declare-fun res!605011 () Bool)

(assert (=> b!893527 (= res!605011 (and ((_ is Intermediate!8870) lt!403644) (not (undefined!9682 lt!403644)) (bvslt (x!75965 lt!403644) #b01111111111111111111111111111110) (bvsge (x!75965 lt!403644) #b00000000000000000000000000000000) (bvsge (x!75965 lt!403644) #b00000000000000000000000000000000)))))

(assert (=> b!893527 (=> (not res!605011) (not e!499008))))

(declare-fun b!893528 () Bool)

(declare-fun e!499006 () SeekEntryResult!8870)

(assert (=> b!893528 (= e!499010 e!499006)))

(declare-fun c!94153 () Bool)

(assert (=> b!893528 (= c!94153 (or (= lt!403643 key!785) (= (bvadd lt!403643 lt!403643) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893529 () Bool)

(assert (=> b!893529 (= e!499006 (Intermediate!8870 false (toIndex!0 key!785 (mask!25841 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!893530 () Bool)

(assert (=> b!893530 (= e!499010 (Intermediate!8870 true (toIndex!0 key!785 (mask!25841 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!893531 () Bool)

(assert (=> b!893531 (= e!499006 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25841 thiss!1181)) #b00000000000000000000000000000000 (mask!25841 thiss!1181)) key!785 (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun b!893532 () Bool)

(assert (=> b!893532 (and (bvsge (index!37853 lt!403644) #b00000000000000000000000000000000) (bvslt (index!37853 lt!403644) (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun res!605009 () Bool)

(assert (=> b!893532 (= res!605009 (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37853 lt!403644)) key!785))))

(assert (=> b!893532 (=> res!605009 e!499009)))

(assert (=> b!893532 (= e!499008 e!499009)))

(declare-fun b!893533 () Bool)

(assert (=> b!893533 (= e!499007 (bvsge (x!75965 lt!403644) #b01111111111111111111111111111110))))

(assert (= (and d!110215 c!94151) b!893530))

(assert (= (and d!110215 (not c!94151)) b!893528))

(assert (= (and b!893528 c!94153) b!893529))

(assert (= (and b!893528 (not c!94153)) b!893531))

(assert (= (and d!110215 c!94152) b!893533))

(assert (= (and d!110215 (not c!94152)) b!893527))

(assert (= (and b!893527 res!605011) b!893532))

(assert (= (and b!893532 (not res!605009)) b!893525))

(assert (= (and b!893525 (not res!605010)) b!893526))

(assert (=> b!893531 m!830741))

(declare-fun m!831007 () Bool)

(assert (=> b!893531 m!831007))

(assert (=> b!893531 m!831007))

(declare-fun m!831009 () Bool)

(assert (=> b!893531 m!831009))

(declare-fun m!831011 () Bool)

(assert (=> b!893525 m!831011))

(assert (=> d!110215 m!830741))

(declare-fun m!831013 () Bool)

(assert (=> d!110215 m!831013))

(assert (=> d!110215 m!830745))

(assert (=> b!893526 m!831011))

(assert (=> b!893532 m!831011))

(assert (=> d!110121 d!110215))

(declare-fun d!110217 () Bool)

(declare-fun lt!403650 () (_ BitVec 32))

(declare-fun lt!403649 () (_ BitVec 32))

(assert (=> d!110217 (= lt!403650 (bvmul (bvxor lt!403649 (bvlshr lt!403649 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110217 (= lt!403649 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110217 (and (bvsge (mask!25841 thiss!1181) #b00000000000000000000000000000000) (let ((res!605012 (let ((h!18936 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!75977 (bvmul (bvxor h!18936 (bvlshr h!18936 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!75977 (bvlshr x!75977 #b00000000000000000000000000001101)) (mask!25841 thiss!1181)))))) (and (bvslt res!605012 (bvadd (mask!25841 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605012 #b00000000000000000000000000000000))))))

(assert (=> d!110217 (= (toIndex!0 key!785 (mask!25841 thiss!1181)) (bvand (bvxor lt!403650 (bvlshr lt!403650 #b00000000000000000000000000001101)) (mask!25841 thiss!1181)))))

(assert (=> d!110121 d!110217))

(assert (=> d!110121 d!110167))

(assert (=> d!110127 d!110167))

(assert (=> b!893310 d!110161))

(declare-fun d!110219 () Bool)

(assert (=> d!110219 (= (validKeyInArray!0 (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436)) (and (not (= (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893374 d!110219))

(assert (=> b!893343 d!110161))

(declare-fun d!110221 () Bool)

(assert (=> d!110221 (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403554 #b00000000000000000000000000000000)))

(declare-fun lt!403651 () Unit!30370)

(assert (=> d!110221 (= lt!403651 (choose!13 (_keys!9999 thiss!1181) lt!403554 lt!403436))))

(assert (=> d!110221 (bvsge lt!403436 #b00000000000000000000000000000000)))

(assert (=> d!110221 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9999 thiss!1181) lt!403554 lt!403436) lt!403651)))

(declare-fun bs!25053 () Bool)

(assert (= bs!25053 d!110221))

(assert (=> bs!25053 m!830853))

(declare-fun m!831015 () Bool)

(assert (=> bs!25053 m!831015))

(assert (=> b!893375 d!110221))

(declare-fun d!110223 () Bool)

(declare-fun res!605013 () Bool)

(declare-fun e!499011 () Bool)

(assert (=> d!110223 (=> res!605013 e!499011)))

(assert (=> d!110223 (= res!605013 (= (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) lt!403554))))

(assert (=> d!110223 (= (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403554 #b00000000000000000000000000000000) e!499011)))

(declare-fun b!893534 () Bool)

(declare-fun e!499012 () Bool)

(assert (=> b!893534 (= e!499011 e!499012)))

(declare-fun res!605014 () Bool)

(assert (=> b!893534 (=> (not res!605014) (not e!499012))))

(assert (=> b!893534 (= res!605014 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893535 () Bool)

(assert (=> b!893535 (= e!499012 (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403554 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110223 (not res!605013)) b!893534))

(assert (= (and b!893534 res!605014) b!893535))

(assert (=> d!110223 m!830759))

(declare-fun m!831017 () Bool)

(assert (=> b!893535 m!831017))

(assert (=> b!893375 d!110223))

(declare-fun b!893548 () Bool)

(declare-fun e!499020 () SeekEntryResult!8870)

(declare-fun lt!403660 () SeekEntryResult!8870)

(assert (=> b!893548 (= e!499020 (MissingZero!8870 (index!37853 lt!403660)))))

(declare-fun b!893549 () Bool)

(assert (=> b!893549 (= e!499020 (seekKeyOrZeroReturnVacant!0 (x!75965 lt!403660) (index!37853 lt!403660) (index!37853 lt!403660) (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun b!893550 () Bool)

(declare-fun c!94162 () Bool)

(declare-fun lt!403658 () (_ BitVec 64))

(assert (=> b!893550 (= c!94162 (= lt!403658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499021 () SeekEntryResult!8870)

(assert (=> b!893550 (= e!499021 e!499020)))

(declare-fun b!893551 () Bool)

(declare-fun e!499019 () SeekEntryResult!8870)

(assert (=> b!893551 (= e!499019 Undefined!8870)))

(declare-fun d!110225 () Bool)

(declare-fun lt!403659 () SeekEntryResult!8870)

(assert (=> d!110225 (and (or ((_ is Undefined!8870) lt!403659) (not ((_ is Found!8870) lt!403659)) (and (bvsge (index!37852 lt!403659) #b00000000000000000000000000000000) (bvslt (index!37852 lt!403659) (size!25615 (_keys!9999 thiss!1181))))) (or ((_ is Undefined!8870) lt!403659) ((_ is Found!8870) lt!403659) (not ((_ is MissingZero!8870) lt!403659)) (and (bvsge (index!37851 lt!403659) #b00000000000000000000000000000000) (bvslt (index!37851 lt!403659) (size!25615 (_keys!9999 thiss!1181))))) (or ((_ is Undefined!8870) lt!403659) ((_ is Found!8870) lt!403659) ((_ is MissingZero!8870) lt!403659) (not ((_ is MissingVacant!8870) lt!403659)) (and (bvsge (index!37854 lt!403659) #b00000000000000000000000000000000) (bvslt (index!37854 lt!403659) (size!25615 (_keys!9999 thiss!1181))))) (or ((_ is Undefined!8870) lt!403659) (ite ((_ is Found!8870) lt!403659) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403659)) (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436)) (ite ((_ is MissingZero!8870) lt!403659) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37851 lt!403659)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8870) lt!403659) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37854 lt!403659)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110225 (= lt!403659 e!499019)))

(declare-fun c!94161 () Bool)

(assert (=> d!110225 (= c!94161 (and ((_ is Intermediate!8870) lt!403660) (undefined!9682 lt!403660)))))

(assert (=> d!110225 (= lt!403660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436) (mask!25841 thiss!1181)) (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (=> d!110225 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110225 (= (seekEntryOrOpen!0 (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) lt!403659)))

(declare-fun b!893552 () Bool)

(assert (=> b!893552 (= e!499019 e!499021)))

(assert (=> b!893552 (= lt!403658 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37853 lt!403660)))))

(declare-fun c!94160 () Bool)

(assert (=> b!893552 (= c!94160 (= lt!403658 (select (arr!25169 (_keys!9999 thiss!1181)) lt!403436)))))

(declare-fun b!893553 () Bool)

(assert (=> b!893553 (= e!499021 (Found!8870 (index!37853 lt!403660)))))

(assert (= (and d!110225 c!94161) b!893551))

(assert (= (and d!110225 (not c!94161)) b!893552))

(assert (= (and b!893552 c!94160) b!893553))

(assert (= (and b!893552 (not c!94160)) b!893550))

(assert (= (and b!893550 c!94162) b!893548))

(assert (= (and b!893550 (not c!94162)) b!893549))

(assert (=> b!893549 m!830847))

(declare-fun m!831019 () Bool)

(assert (=> b!893549 m!831019))

(declare-fun m!831021 () Bool)

(assert (=> d!110225 m!831021))

(assert (=> d!110225 m!830745))

(assert (=> d!110225 m!830847))

(declare-fun m!831023 () Bool)

(assert (=> d!110225 m!831023))

(assert (=> d!110225 m!831023))

(assert (=> d!110225 m!830847))

(declare-fun m!831025 () Bool)

(assert (=> d!110225 m!831025))

(declare-fun m!831027 () Bool)

(assert (=> d!110225 m!831027))

(declare-fun m!831029 () Bool)

(assert (=> d!110225 m!831029))

(declare-fun m!831031 () Bool)

(assert (=> b!893552 m!831031))

(assert (=> b!893375 d!110225))

(declare-fun d!110227 () Bool)

(declare-fun e!499022 () Bool)

(assert (=> d!110227 e!499022))

(declare-fun res!605016 () Bool)

(assert (=> d!110227 (=> (not res!605016) (not e!499022))))

(declare-fun lt!403663 () ListLongMap!10721)

(assert (=> d!110227 (= res!605016 (contains!4355 lt!403663 (_1!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))))))

(declare-fun lt!403664 () List!17805)

(assert (=> d!110227 (= lt!403663 (ListLongMap!10722 lt!403664))))

(declare-fun lt!403662 () Unit!30370)

(declare-fun lt!403661 () Unit!30370)

(assert (=> d!110227 (= lt!403662 lt!403661)))

(assert (=> d!110227 (= (getValueByKey!449 lt!403664 (_1!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110227 (= lt!403661 (lemmaContainsTupThenGetReturnValue!247 lt!403664 (_1!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110227 (= lt!403664 (insertStrictlySorted!304 (toList!5376 lt!403520) (_1!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110227 (= (+!2614 lt!403520 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181))) lt!403663)))

(declare-fun b!893554 () Bool)

(declare-fun res!605015 () Bool)

(assert (=> b!893554 (=> (not res!605015) (not e!499022))))

(assert (=> b!893554 (= res!605015 (= (getValueByKey!449 (toList!5376 lt!403663) (_1!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181))))))))

(declare-fun b!893555 () Bool)

(assert (=> b!893555 (= e!499022 (contains!4357 (toList!5376 lt!403663) (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181))))))

(assert (= (and d!110227 res!605016) b!893554))

(assert (= (and b!893554 res!605015) b!893555))

(declare-fun m!831033 () Bool)

(assert (=> d!110227 m!831033))

(declare-fun m!831035 () Bool)

(assert (=> d!110227 m!831035))

(declare-fun m!831037 () Bool)

(assert (=> d!110227 m!831037))

(declare-fun m!831039 () Bool)

(assert (=> d!110227 m!831039))

(declare-fun m!831041 () Bool)

(assert (=> b!893554 m!831041))

(declare-fun m!831043 () Bool)

(assert (=> b!893555 m!831043))

(assert (=> b!893295 d!110227))

(declare-fun d!110229 () Bool)

(assert (=> d!110229 (= (apply!403 (+!2614 lt!403522 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181))) lt!403514) (apply!403 lt!403522 lt!403514))))

(declare-fun lt!403667 () Unit!30370)

(declare-fun choose!1476 (ListLongMap!10721 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30370)

(assert (=> d!110229 (= lt!403667 (choose!1476 lt!403522 lt!403508 (minValue!5117 thiss!1181) lt!403514))))

(declare-fun e!499025 () Bool)

(assert (=> d!110229 e!499025))

(declare-fun res!605019 () Bool)

(assert (=> d!110229 (=> (not res!605019) (not e!499025))))

(assert (=> d!110229 (= res!605019 (contains!4355 lt!403522 lt!403514))))

(assert (=> d!110229 (= (addApplyDifferent!329 lt!403522 lt!403508 (minValue!5117 thiss!1181) lt!403514) lt!403667)))

(declare-fun b!893559 () Bool)

(assert (=> b!893559 (= e!499025 (not (= lt!403514 lt!403508)))))

(assert (= (and d!110229 res!605019) b!893559))

(declare-fun m!831045 () Bool)

(assert (=> d!110229 m!831045))

(assert (=> d!110229 m!830799))

(assert (=> d!110229 m!830789))

(declare-fun m!831047 () Bool)

(assert (=> d!110229 m!831047))

(assert (=> d!110229 m!830799))

(assert (=> d!110229 m!830801))

(assert (=> b!893295 d!110229))

(declare-fun d!110231 () Bool)

(declare-fun e!499026 () Bool)

(assert (=> d!110231 e!499026))

(declare-fun res!605021 () Bool)

(assert (=> d!110231 (=> (not res!605021) (not e!499026))))

(declare-fun lt!403670 () ListLongMap!10721)

(assert (=> d!110231 (= res!605021 (contains!4355 lt!403670 (_1!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181)))))))

(declare-fun lt!403671 () List!17805)

(assert (=> d!110231 (= lt!403670 (ListLongMap!10722 lt!403671))))

(declare-fun lt!403669 () Unit!30370)

(declare-fun lt!403668 () Unit!30370)

(assert (=> d!110231 (= lt!403669 lt!403668)))

(assert (=> d!110231 (= (getValueByKey!449 lt!403671 (_1!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181)))))))

(assert (=> d!110231 (= lt!403668 (lemmaContainsTupThenGetReturnValue!247 lt!403671 (_1!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181)))))))

(assert (=> d!110231 (= lt!403671 (insertStrictlySorted!304 (toList!5376 lt!403526) (_1!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181)))))))

(assert (=> d!110231 (= (+!2614 lt!403526 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181))) lt!403670)))

(declare-fun b!893560 () Bool)

(declare-fun res!605020 () Bool)

(assert (=> b!893560 (=> (not res!605020) (not e!499026))))

(assert (=> b!893560 (= res!605020 (= (getValueByKey!449 (toList!5376 lt!403670) (_1!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181))))))))

(declare-fun b!893561 () Bool)

(assert (=> b!893561 (= e!499026 (contains!4357 (toList!5376 lt!403670) (tuple2!12035 lt!403518 (minValue!5117 thiss!1181))))))

(assert (= (and d!110231 res!605021) b!893560))

(assert (= (and b!893560 res!605020) b!893561))

(declare-fun m!831049 () Bool)

(assert (=> d!110231 m!831049))

(declare-fun m!831051 () Bool)

(assert (=> d!110231 m!831051))

(declare-fun m!831053 () Bool)

(assert (=> d!110231 m!831053))

(declare-fun m!831055 () Bool)

(assert (=> d!110231 m!831055))

(declare-fun m!831057 () Bool)

(assert (=> b!893560 m!831057))

(declare-fun m!831059 () Bool)

(assert (=> b!893561 m!831059))

(assert (=> b!893295 d!110231))

(declare-fun d!110233 () Bool)

(assert (=> d!110233 (= (apply!403 lt!403522 lt!403514) (get!13253 (getValueByKey!449 (toList!5376 lt!403522) lt!403514)))))

(declare-fun bs!25054 () Bool)

(assert (= bs!25054 d!110233))

(declare-fun m!831061 () Bool)

(assert (=> bs!25054 m!831061))

(assert (=> bs!25054 m!831061))

(declare-fun m!831063 () Bool)

(assert (=> bs!25054 m!831063))

(assert (=> b!893295 d!110233))

(declare-fun d!110235 () Bool)

(declare-fun e!499027 () Bool)

(assert (=> d!110235 e!499027))

(declare-fun res!605022 () Bool)

(assert (=> d!110235 (=> res!605022 e!499027)))

(declare-fun lt!403675 () Bool)

(assert (=> d!110235 (= res!605022 (not lt!403675))))

(declare-fun lt!403674 () Bool)

(assert (=> d!110235 (= lt!403675 lt!403674)))

(declare-fun lt!403673 () Unit!30370)

(declare-fun e!499028 () Unit!30370)

(assert (=> d!110235 (= lt!403673 e!499028)))

(declare-fun c!94163 () Bool)

(assert (=> d!110235 (= c!94163 lt!403674)))

(assert (=> d!110235 (= lt!403674 (containsKey!422 (toList!5376 (+!2614 lt!403520 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))) lt!403511))))

(assert (=> d!110235 (= (contains!4355 (+!2614 lt!403520 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181))) lt!403511) lt!403675)))

(declare-fun b!893562 () Bool)

(declare-fun lt!403672 () Unit!30370)

(assert (=> b!893562 (= e!499028 lt!403672)))

(assert (=> b!893562 (= lt!403672 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 (+!2614 lt!403520 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))) lt!403511))))

(assert (=> b!893562 (isDefined!330 (getValueByKey!449 (toList!5376 (+!2614 lt!403520 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))) lt!403511))))

(declare-fun b!893563 () Bool)

(declare-fun Unit!30381 () Unit!30370)

(assert (=> b!893563 (= e!499028 Unit!30381)))

(declare-fun b!893564 () Bool)

(assert (=> b!893564 (= e!499027 (isDefined!330 (getValueByKey!449 (toList!5376 (+!2614 lt!403520 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181)))) lt!403511)))))

(assert (= (and d!110235 c!94163) b!893562))

(assert (= (and d!110235 (not c!94163)) b!893563))

(assert (= (and d!110235 (not res!605022)) b!893564))

(declare-fun m!831065 () Bool)

(assert (=> d!110235 m!831065))

(declare-fun m!831067 () Bool)

(assert (=> b!893562 m!831067))

(declare-fun m!831069 () Bool)

(assert (=> b!893562 m!831069))

(assert (=> b!893562 m!831069))

(declare-fun m!831071 () Bool)

(assert (=> b!893562 m!831071))

(assert (=> b!893564 m!831069))

(assert (=> b!893564 m!831069))

(assert (=> b!893564 m!831071))

(assert (=> b!893295 d!110235))

(declare-fun d!110237 () Bool)

(assert (=> d!110237 (= (apply!403 (+!2614 lt!403526 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181))) lt!403524) (apply!403 lt!403526 lt!403524))))

(declare-fun lt!403676 () Unit!30370)

(assert (=> d!110237 (= lt!403676 (choose!1476 lt!403526 lt!403518 (minValue!5117 thiss!1181) lt!403524))))

(declare-fun e!499029 () Bool)

(assert (=> d!110237 e!499029))

(declare-fun res!605023 () Bool)

(assert (=> d!110237 (=> (not res!605023) (not e!499029))))

(assert (=> d!110237 (= res!605023 (contains!4355 lt!403526 lt!403524))))

(assert (=> d!110237 (= (addApplyDifferent!329 lt!403526 lt!403518 (minValue!5117 thiss!1181) lt!403524) lt!403676)))

(declare-fun b!893565 () Bool)

(assert (=> b!893565 (= e!499029 (not (= lt!403524 lt!403518)))))

(assert (= (and d!110237 res!605023) b!893565))

(declare-fun m!831073 () Bool)

(assert (=> d!110237 m!831073))

(assert (=> d!110237 m!830777))

(assert (=> d!110237 m!830791))

(declare-fun m!831075 () Bool)

(assert (=> d!110237 m!831075))

(assert (=> d!110237 m!830777))

(assert (=> d!110237 m!830779))

(assert (=> b!893295 d!110237))

(declare-fun d!110239 () Bool)

(declare-fun e!499030 () Bool)

(assert (=> d!110239 e!499030))

(declare-fun res!605025 () Bool)

(assert (=> d!110239 (=> (not res!605025) (not e!499030))))

(declare-fun lt!403679 () ListLongMap!10721)

(assert (=> d!110239 (= res!605025 (contains!4355 lt!403679 (_1!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181)))))))

(declare-fun lt!403680 () List!17805)

(assert (=> d!110239 (= lt!403679 (ListLongMap!10722 lt!403680))))

(declare-fun lt!403678 () Unit!30370)

(declare-fun lt!403677 () Unit!30370)

(assert (=> d!110239 (= lt!403678 lt!403677)))

(assert (=> d!110239 (= (getValueByKey!449 lt!403680 (_1!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181)))))))

(assert (=> d!110239 (= lt!403677 (lemmaContainsTupThenGetReturnValue!247 lt!403680 (_1!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181)))))))

(assert (=> d!110239 (= lt!403680 (insertStrictlySorted!304 (toList!5376 lt!403522) (_1!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181)))))))

(assert (=> d!110239 (= (+!2614 lt!403522 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181))) lt!403679)))

(declare-fun b!893566 () Bool)

(declare-fun res!605024 () Bool)

(assert (=> b!893566 (=> (not res!605024) (not e!499030))))

(assert (=> b!893566 (= res!605024 (= (getValueByKey!449 (toList!5376 lt!403679) (_1!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181))))))))

(declare-fun b!893567 () Bool)

(assert (=> b!893567 (= e!499030 (contains!4357 (toList!5376 lt!403679) (tuple2!12035 lt!403508 (minValue!5117 thiss!1181))))))

(assert (= (and d!110239 res!605025) b!893566))

(assert (= (and b!893566 res!605024) b!893567))

(declare-fun m!831077 () Bool)

(assert (=> d!110239 m!831077))

(declare-fun m!831079 () Bool)

(assert (=> d!110239 m!831079))

(declare-fun m!831081 () Bool)

(assert (=> d!110239 m!831081))

(declare-fun m!831083 () Bool)

(assert (=> d!110239 m!831083))

(declare-fun m!831085 () Bool)

(assert (=> b!893566 m!831085))

(declare-fun m!831087 () Bool)

(assert (=> b!893567 m!831087))

(assert (=> b!893295 d!110239))

(declare-fun d!110241 () Bool)

(assert (=> d!110241 (= (apply!403 lt!403519 lt!403507) (get!13253 (getValueByKey!449 (toList!5376 lt!403519) lt!403507)))))

(declare-fun bs!25055 () Bool)

(assert (= bs!25055 d!110241))

(declare-fun m!831089 () Bool)

(assert (=> bs!25055 m!831089))

(assert (=> bs!25055 m!831089))

(declare-fun m!831091 () Bool)

(assert (=> bs!25055 m!831091))

(assert (=> b!893295 d!110241))

(assert (=> b!893295 d!110175))

(declare-fun d!110243 () Bool)

(assert (=> d!110243 (= (apply!403 (+!2614 lt!403519 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181))) lt!403507) (apply!403 lt!403519 lt!403507))))

(declare-fun lt!403681 () Unit!30370)

(assert (=> d!110243 (= lt!403681 (choose!1476 lt!403519 lt!403513 (zeroValue!5117 thiss!1181) lt!403507))))

(declare-fun e!499031 () Bool)

(assert (=> d!110243 e!499031))

(declare-fun res!605026 () Bool)

(assert (=> d!110243 (=> (not res!605026) (not e!499031))))

(assert (=> d!110243 (= res!605026 (contains!4355 lt!403519 lt!403507))))

(assert (=> d!110243 (= (addApplyDifferent!329 lt!403519 lt!403513 (zeroValue!5117 thiss!1181) lt!403507) lt!403681)))

(declare-fun b!893568 () Bool)

(assert (=> b!893568 (= e!499031 (not (= lt!403507 lt!403513)))))

(assert (= (and d!110243 res!605026) b!893568))

(declare-fun m!831093 () Bool)

(assert (=> d!110243 m!831093))

(assert (=> d!110243 m!830785))

(assert (=> d!110243 m!830803))

(declare-fun m!831095 () Bool)

(assert (=> d!110243 m!831095))

(assert (=> d!110243 m!830785))

(assert (=> d!110243 m!830787))

(assert (=> b!893295 d!110243))

(declare-fun d!110245 () Bool)

(assert (=> d!110245 (= (apply!403 (+!2614 lt!403526 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181))) lt!403524) (get!13253 (getValueByKey!449 (toList!5376 (+!2614 lt!403526 (tuple2!12035 lt!403518 (minValue!5117 thiss!1181)))) lt!403524)))))

(declare-fun bs!25056 () Bool)

(assert (= bs!25056 d!110245))

(declare-fun m!831097 () Bool)

(assert (=> bs!25056 m!831097))

(assert (=> bs!25056 m!831097))

(declare-fun m!831099 () Bool)

(assert (=> bs!25056 m!831099))

(assert (=> b!893295 d!110245))

(declare-fun d!110247 () Bool)

(assert (=> d!110247 (contains!4355 (+!2614 lt!403520 (tuple2!12035 lt!403521 (zeroValue!5117 thiss!1181))) lt!403511)))

(declare-fun lt!403684 () Unit!30370)

(declare-fun choose!1477 (ListLongMap!10721 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30370)

(assert (=> d!110247 (= lt!403684 (choose!1477 lt!403520 lt!403521 (zeroValue!5117 thiss!1181) lt!403511))))

(assert (=> d!110247 (contains!4355 lt!403520 lt!403511)))

(assert (=> d!110247 (= (addStillContains!329 lt!403520 lt!403521 (zeroValue!5117 thiss!1181) lt!403511) lt!403684)))

(declare-fun bs!25057 () Bool)

(assert (= bs!25057 d!110247))

(assert (=> bs!25057 m!830781))

(assert (=> bs!25057 m!830781))

(assert (=> bs!25057 m!830783))

(declare-fun m!831101 () Bool)

(assert (=> bs!25057 m!831101))

(declare-fun m!831103 () Bool)

(assert (=> bs!25057 m!831103))

(assert (=> b!893295 d!110247))

(declare-fun d!110249 () Bool)

(assert (=> d!110249 (= (apply!403 (+!2614 lt!403522 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181))) lt!403514) (get!13253 (getValueByKey!449 (toList!5376 (+!2614 lt!403522 (tuple2!12035 lt!403508 (minValue!5117 thiss!1181)))) lt!403514)))))

(declare-fun bs!25058 () Bool)

(assert (= bs!25058 d!110249))

(declare-fun m!831105 () Bool)

(assert (=> bs!25058 m!831105))

(assert (=> bs!25058 m!831105))

(declare-fun m!831107 () Bool)

(assert (=> bs!25058 m!831107))

(assert (=> b!893295 d!110249))

(declare-fun d!110251 () Bool)

(assert (=> d!110251 (= (apply!403 lt!403526 lt!403524) (get!13253 (getValueByKey!449 (toList!5376 lt!403526) lt!403524)))))

(declare-fun bs!25059 () Bool)

(assert (= bs!25059 d!110251))

(declare-fun m!831109 () Bool)

(assert (=> bs!25059 m!831109))

(assert (=> bs!25059 m!831109))

(declare-fun m!831111 () Bool)

(assert (=> bs!25059 m!831111))

(assert (=> b!893295 d!110251))

(declare-fun d!110253 () Bool)

(declare-fun e!499032 () Bool)

(assert (=> d!110253 e!499032))

(declare-fun res!605028 () Bool)

(assert (=> d!110253 (=> (not res!605028) (not e!499032))))

(declare-fun lt!403687 () ListLongMap!10721)

(assert (=> d!110253 (= res!605028 (contains!4355 lt!403687 (_1!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181)))))))

(declare-fun lt!403688 () List!17805)

(assert (=> d!110253 (= lt!403687 (ListLongMap!10722 lt!403688))))

(declare-fun lt!403686 () Unit!30370)

(declare-fun lt!403685 () Unit!30370)

(assert (=> d!110253 (= lt!403686 lt!403685)))

(assert (=> d!110253 (= (getValueByKey!449 lt!403688 (_1!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110253 (= lt!403685 (lemmaContainsTupThenGetReturnValue!247 lt!403688 (_1!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110253 (= lt!403688 (insertStrictlySorted!304 (toList!5376 lt!403519) (_1!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110253 (= (+!2614 lt!403519 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181))) lt!403687)))

(declare-fun b!893570 () Bool)

(declare-fun res!605027 () Bool)

(assert (=> b!893570 (=> (not res!605027) (not e!499032))))

(assert (=> b!893570 (= res!605027 (= (getValueByKey!449 (toList!5376 lt!403687) (_1!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181))))))))

(declare-fun b!893571 () Bool)

(assert (=> b!893571 (= e!499032 (contains!4357 (toList!5376 lt!403687) (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181))))))

(assert (= (and d!110253 res!605028) b!893570))

(assert (= (and b!893570 res!605027) b!893571))

(declare-fun m!831113 () Bool)

(assert (=> d!110253 m!831113))

(declare-fun m!831115 () Bool)

(assert (=> d!110253 m!831115))

(declare-fun m!831117 () Bool)

(assert (=> d!110253 m!831117))

(declare-fun m!831119 () Bool)

(assert (=> d!110253 m!831119))

(declare-fun m!831121 () Bool)

(assert (=> b!893570 m!831121))

(declare-fun m!831123 () Bool)

(assert (=> b!893571 m!831123))

(assert (=> b!893295 d!110253))

(declare-fun d!110255 () Bool)

(assert (=> d!110255 (= (apply!403 (+!2614 lt!403519 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181))) lt!403507) (get!13253 (getValueByKey!449 (toList!5376 (+!2614 lt!403519 (tuple2!12035 lt!403513 (zeroValue!5117 thiss!1181)))) lt!403507)))))

(declare-fun bs!25060 () Bool)

(assert (= bs!25060 d!110255))

(declare-fun m!831125 () Bool)

(assert (=> bs!25060 m!831125))

(assert (=> bs!25060 m!831125))

(declare-fun m!831127 () Bool)

(assert (=> bs!25060 m!831127))

(assert (=> b!893295 d!110255))

(declare-fun d!110257 () Bool)

(assert (=> d!110257 (isDefined!330 (getValueByKey!449 (toList!5376 (map!12199 thiss!1181)) key!785))))

(declare-fun lt!403689 () Unit!30370)

(assert (=> d!110257 (= lt!403689 (choose!1475 (toList!5376 (map!12199 thiss!1181)) key!785))))

(declare-fun e!499033 () Bool)

(assert (=> d!110257 e!499033))

(declare-fun res!605029 () Bool)

(assert (=> d!110257 (=> (not res!605029) (not e!499033))))

(assert (=> d!110257 (= res!605029 (isStrictlySorted!491 (toList!5376 (map!12199 thiss!1181))))))

(assert (=> d!110257 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5376 (map!12199 thiss!1181)) key!785) lt!403689)))

(declare-fun b!893572 () Bool)

(assert (=> b!893572 (= e!499033 (containsKey!422 (toList!5376 (map!12199 thiss!1181)) key!785))))

(assert (= (and d!110257 res!605029) b!893572))

(assert (=> d!110257 m!830645))

(assert (=> d!110257 m!830645))

(assert (=> d!110257 m!830833))

(declare-fun m!831129 () Bool)

(assert (=> d!110257 m!831129))

(declare-fun m!831131 () Bool)

(assert (=> d!110257 m!831131))

(assert (=> b!893572 m!830829))

(assert (=> b!893346 d!110257))

(assert (=> b!893346 d!110157))

(assert (=> b!893346 d!110107))

(declare-fun d!110259 () Bool)

(declare-fun res!605030 () Bool)

(declare-fun e!499034 () Bool)

(assert (=> d!110259 (=> res!605030 e!499034)))

(assert (=> d!110259 (= res!605030 (and ((_ is Cons!17801) (toList!5376 call!39596)) (= (_1!6028 (h!18932 (toList!5376 call!39596))) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785))))))

(assert (=> d!110259 (= (containsKey!422 (toList!5376 call!39596) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)) e!499034)))

(declare-fun b!893573 () Bool)

(declare-fun e!499035 () Bool)

(assert (=> b!893573 (= e!499034 e!499035)))

(declare-fun res!605031 () Bool)

(assert (=> b!893573 (=> (not res!605031) (not e!499035))))

(assert (=> b!893573 (= res!605031 (and (or (not ((_ is Cons!17801) (toList!5376 call!39596))) (bvsle (_1!6028 (h!18932 (toList!5376 call!39596))) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785))) ((_ is Cons!17801) (toList!5376 call!39596)) (bvslt (_1!6028 (h!18932 (toList!5376 call!39596))) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785))))))

(declare-fun b!893574 () Bool)

(assert (=> b!893574 (= e!499035 (containsKey!422 (t!25115 (toList!5376 call!39596)) (ite c!94054 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403422)) key!785)))))

(assert (= (and d!110259 (not res!605030)) b!893573))

(assert (= (and b!893573 res!605031) b!893574))

(declare-fun m!831133 () Bool)

(assert (=> b!893574 m!831133))

(assert (=> d!110123 d!110259))

(declare-fun d!110261 () Bool)

(declare-fun e!499038 () Bool)

(assert (=> d!110261 e!499038))

(declare-fun c!94166 () Bool)

(assert (=> d!110261 (= c!94166 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!110261 true))

(declare-fun _$15!89 () Unit!30370)

(assert (=> d!110261 (= (choose!1474 (_keys!9999 thiss!1181) (_values!5304 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) key!785 (defaultEntry!5317 thiss!1181)) _$15!89)))

(declare-fun b!893579 () Bool)

(assert (=> b!893579 (= e!499038 (arrayContainsKey!0 (_keys!9999 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!893580 () Bool)

(assert (=> b!893580 (= e!499038 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110261 c!94166) b!893579))

(assert (= (and d!110261 (not c!94166)) b!893580))

(assert (=> b!893579 m!830727))

(assert (=> d!110143 d!110261))

(assert (=> d!110143 d!110167))

(declare-fun d!110263 () Bool)

(assert (=> d!110263 (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403538 #b00000000000000000000000000000000)))

(declare-fun lt!403690 () Unit!30370)

(assert (=> d!110263 (= lt!403690 (choose!13 (_keys!9999 thiss!1181) lt!403538 #b00000000000000000000000000000000))))

(assert (=> d!110263 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!110263 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9999 thiss!1181) lt!403538 #b00000000000000000000000000000000) lt!403690)))

(declare-fun bs!25061 () Bool)

(assert (= bs!25061 d!110263))

(assert (=> bs!25061 m!830823))

(declare-fun m!831135 () Bool)

(assert (=> bs!25061 m!831135))

(assert (=> b!893344 d!110263))

(declare-fun d!110265 () Bool)

(declare-fun res!605032 () Bool)

(declare-fun e!499039 () Bool)

(assert (=> d!110265 (=> res!605032 e!499039)))

(assert (=> d!110265 (= res!605032 (= (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) lt!403538))))

(assert (=> d!110265 (= (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403538 #b00000000000000000000000000000000) e!499039)))

(declare-fun b!893581 () Bool)

(declare-fun e!499040 () Bool)

(assert (=> b!893581 (= e!499039 e!499040)))

(declare-fun res!605033 () Bool)

(assert (=> b!893581 (=> (not res!605033) (not e!499040))))

(assert (=> b!893581 (= res!605033 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25615 (_keys!9999 thiss!1181))))))

(declare-fun b!893582 () Bool)

(assert (=> b!893582 (= e!499040 (arrayContainsKey!0 (_keys!9999 thiss!1181) lt!403538 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110265 (not res!605032)) b!893581))

(assert (= (and b!893581 res!605033) b!893582))

(assert (=> d!110265 m!830759))

(declare-fun m!831137 () Bool)

(assert (=> b!893582 m!831137))

(assert (=> b!893344 d!110265))

(declare-fun b!893583 () Bool)

(declare-fun e!499042 () SeekEntryResult!8870)

(declare-fun lt!403693 () SeekEntryResult!8870)

(assert (=> b!893583 (= e!499042 (MissingZero!8870 (index!37853 lt!403693)))))

(declare-fun b!893584 () Bool)

(assert (=> b!893584 (= e!499042 (seekKeyOrZeroReturnVacant!0 (x!75965 lt!403693) (index!37853 lt!403693) (index!37853 lt!403693) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun b!893585 () Bool)

(declare-fun c!94169 () Bool)

(declare-fun lt!403691 () (_ BitVec 64))

(assert (=> b!893585 (= c!94169 (= lt!403691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499043 () SeekEntryResult!8870)

(assert (=> b!893585 (= e!499043 e!499042)))

(declare-fun b!893586 () Bool)

(declare-fun e!499041 () SeekEntryResult!8870)

(assert (=> b!893586 (= e!499041 Undefined!8870)))

(declare-fun d!110267 () Bool)

(declare-fun lt!403692 () SeekEntryResult!8870)

(assert (=> d!110267 (and (or ((_ is Undefined!8870) lt!403692) (not ((_ is Found!8870) lt!403692)) (and (bvsge (index!37852 lt!403692) #b00000000000000000000000000000000) (bvslt (index!37852 lt!403692) (size!25615 (_keys!9999 thiss!1181))))) (or ((_ is Undefined!8870) lt!403692) ((_ is Found!8870) lt!403692) (not ((_ is MissingZero!8870) lt!403692)) (and (bvsge (index!37851 lt!403692) #b00000000000000000000000000000000) (bvslt (index!37851 lt!403692) (size!25615 (_keys!9999 thiss!1181))))) (or ((_ is Undefined!8870) lt!403692) ((_ is Found!8870) lt!403692) ((_ is MissingZero!8870) lt!403692) (not ((_ is MissingVacant!8870) lt!403692)) (and (bvsge (index!37854 lt!403692) #b00000000000000000000000000000000) (bvslt (index!37854 lt!403692) (size!25615 (_keys!9999 thiss!1181))))) (or ((_ is Undefined!8870) lt!403692) (ite ((_ is Found!8870) lt!403692) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37852 lt!403692)) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8870) lt!403692) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37851 lt!403692)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8870) lt!403692) (= (select (arr!25169 (_keys!9999 thiss!1181)) (index!37854 lt!403692)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110267 (= lt!403692 e!499041)))

(declare-fun c!94168 () Bool)

(assert (=> d!110267 (= c!94168 (and ((_ is Intermediate!8870) lt!403693) (undefined!9682 lt!403693)))))

(assert (=> d!110267 (= lt!403693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) (mask!25841 thiss!1181)) (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)))))

(assert (=> d!110267 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110267 (= (seekEntryOrOpen!0 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000) (_keys!9999 thiss!1181) (mask!25841 thiss!1181)) lt!403692)))

(declare-fun b!893587 () Bool)

(assert (=> b!893587 (= e!499041 e!499043)))

(assert (=> b!893587 (= lt!403691 (select (arr!25169 (_keys!9999 thiss!1181)) (index!37853 lt!403693)))))

(declare-fun c!94167 () Bool)

(assert (=> b!893587 (= c!94167 (= lt!403691 (select (arr!25169 (_keys!9999 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893588 () Bool)

(assert (=> b!893588 (= e!499043 (Found!8870 (index!37853 lt!403693)))))

(assert (= (and d!110267 c!94168) b!893586))

(assert (= (and d!110267 (not c!94168)) b!893587))

(assert (= (and b!893587 c!94167) b!893588))

(assert (= (and b!893587 (not c!94167)) b!893585))

(assert (= (and b!893585 c!94169) b!893583))

(assert (= (and b!893585 (not c!94169)) b!893584))

(assert (=> b!893584 m!830759))

(declare-fun m!831139 () Bool)

(assert (=> b!893584 m!831139))

(declare-fun m!831141 () Bool)

(assert (=> d!110267 m!831141))

(assert (=> d!110267 m!830745))

(assert (=> d!110267 m!830759))

(declare-fun m!831143 () Bool)

(assert (=> d!110267 m!831143))

(assert (=> d!110267 m!831143))

(assert (=> d!110267 m!830759))

(declare-fun m!831145 () Bool)

(assert (=> d!110267 m!831145))

(declare-fun m!831147 () Bool)

(assert (=> d!110267 m!831147))

(declare-fun m!831149 () Bool)

(assert (=> d!110267 m!831149))

(declare-fun m!831151 () Bool)

(assert (=> b!893587 m!831151))

(assert (=> b!893344 d!110267))

(declare-fun d!110269 () Bool)

(declare-fun e!499044 () Bool)

(assert (=> d!110269 e!499044))

(declare-fun res!605035 () Bool)

(assert (=> d!110269 (=> (not res!605035) (not e!499044))))

(declare-fun lt!403696 () ListLongMap!10721)

(assert (=> d!110269 (= res!605035 (contains!4355 lt!403696 (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(declare-fun lt!403697 () List!17805)

(assert (=> d!110269 (= lt!403696 (ListLongMap!10722 lt!403697))))

(declare-fun lt!403695 () Unit!30370)

(declare-fun lt!403694 () Unit!30370)

(assert (=> d!110269 (= lt!403695 lt!403694)))

(assert (=> d!110269 (= (getValueByKey!449 lt!403697 (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (=> d!110269 (= lt!403694 (lemmaContainsTupThenGetReturnValue!247 lt!403697 (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (=> d!110269 (= lt!403697 (insertStrictlySorted!304 (toList!5376 call!39616) (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))) (_2!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (=> d!110269 (= (+!2614 call!39616 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))) lt!403696)))

(declare-fun b!893589 () Bool)

(declare-fun res!605034 () Bool)

(assert (=> b!893589 (=> (not res!605034) (not e!499044))))

(assert (=> b!893589 (= res!605034 (= (getValueByKey!449 (toList!5376 lt!403696) (_1!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) (Some!454 (_2!6028 (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(declare-fun b!893590 () Bool)

(assert (=> b!893590 (= e!499044 (contains!4357 (toList!5376 lt!403696) (tuple2!12035 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))

(assert (= (and d!110269 res!605035) b!893589))

(assert (= (and b!893589 res!605034) b!893590))

(declare-fun m!831153 () Bool)

(assert (=> d!110269 m!831153))

(declare-fun m!831155 () Bool)

(assert (=> d!110269 m!831155))

(declare-fun m!831157 () Bool)

(assert (=> d!110269 m!831157))

(declare-fun m!831159 () Bool)

(assert (=> d!110269 m!831159))

(declare-fun m!831161 () Bool)

(assert (=> b!893589 m!831161))

(declare-fun m!831163 () Bool)

(assert (=> b!893590 m!831163))

(assert (=> b!893312 d!110269))

(declare-fun mapIsEmpty!28843 () Bool)

(declare-fun mapRes!28843 () Bool)

(assert (=> mapIsEmpty!28843 mapRes!28843))

(declare-fun b!893591 () Bool)

(declare-fun e!499045 () Bool)

(assert (=> b!893591 (= e!499045 tp_is_empty!18181)))

(declare-fun mapNonEmpty!28843 () Bool)

(declare-fun tp!55552 () Bool)

(assert (=> mapNonEmpty!28843 (= mapRes!28843 (and tp!55552 e!499045))))

(declare-fun mapValue!28843 () ValueCell!8609)

(declare-fun mapKey!28843 () (_ BitVec 32))

(declare-fun mapRest!28843 () (Array (_ BitVec 32) ValueCell!8609))

(assert (=> mapNonEmpty!28843 (= mapRest!28842 (store mapRest!28843 mapKey!28843 mapValue!28843))))

(declare-fun b!893592 () Bool)

(declare-fun e!499046 () Bool)

(assert (=> b!893592 (= e!499046 tp_is_empty!18181)))

(declare-fun condMapEmpty!28843 () Bool)

(declare-fun mapDefault!28843 () ValueCell!8609)

(assert (=> mapNonEmpty!28842 (= condMapEmpty!28843 (= mapRest!28842 ((as const (Array (_ BitVec 32) ValueCell!8609)) mapDefault!28843)))))

(assert (=> mapNonEmpty!28842 (= tp!55551 (and e!499046 mapRes!28843))))

(assert (= (and mapNonEmpty!28842 condMapEmpty!28843) mapIsEmpty!28843))

(assert (= (and mapNonEmpty!28842 (not condMapEmpty!28843)) mapNonEmpty!28843))

(assert (= (and mapNonEmpty!28843 ((_ is ValueCellFull!8609) mapValue!28843)) b!893591))

(assert (= (and mapNonEmpty!28842 ((_ is ValueCellFull!8609) mapDefault!28843)) b!893592))

(declare-fun m!831165 () Bool)

(assert (=> mapNonEmpty!28843 m!831165))

(declare-fun b_lambda!12909 () Bool)

(assert (= b_lambda!12907 (or (and b!893094 b_free!15853) b_lambda!12909)))

(declare-fun b_lambda!12911 () Bool)

(assert (= b_lambda!12905 (or (and b!893094 b_free!15853) b_lambda!12911)))

(check-sat (not mapNonEmpty!28843) (not b!893497) (not d!110201) (not b!893531) (not b!893495) (not b!893582) (not b!893579) (not b!893449) (not d!110215) (not bm!39633) (not b!893457) (not d!110255) (not d!110241) (not d!110231) (not b!893404) (not b_next!15853) (not b!893458) (not b!893506) (not b!893390) (not b!893566) (not b!893590) (not b!893456) (not d!110211) (not d!110221) (not b!893489) (not b!893571) (not d!110237) (not b!893401) (not d!110253) (not d!110243) (not b!893535) (not b!893567) (not d!110257) (not d!110247) (not b!893467) (not d!110233) (not d!110165) (not bm!39627) (not d!110205) (not b!893485) (not d!110195) (not d!110177) (not b!893475) (not d!110263) (not b_lambda!12899) (not b!893589) (not b!893478) (not b!893564) (not d!110229) (not d!110173) (not b!893490) (not b_lambda!12911) (not d!110245) (not d!110207) (not d!110163) (not b!893454) (not d!110189) (not d!110235) (not bm!39629) (not bm!39632) (not d!110197) (not b!893398) (not d!110181) (not b!893466) (not d!110239) (not b!893450) (not b!893419) (not d!110251) (not d!110213) (not d!110155) (not b!893397) (not d!110193) (not b!893561) (not b!893560) (not b_lambda!12903) (not b!893562) (not b!893554) (not b!893482) (not d!110175) (not d!110249) (not b!893584) (not b!893492) (not b!893572) (not b_lambda!12909) (not b!893473) (not b!893386) (not b!893455) (not b!893555) (not d!110225) (not b!893570) (not b!893391) b_and!26105 tp_is_empty!18181 (not b!893574) (not b!893451) (not b!893459) (not d!110267) (not d!110157) (not b!893461) (not b!893488) (not d!110227) (not b!893500) (not b!893549) (not b!893498) (not b!893494) (not d!110209) (not d!110269) (not b!893387) (not bm!39628))
(check-sat b_and!26105 (not b_next!15853))
