; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76012 () Bool)

(assert start!76012)

(declare-fun b!893610 () Bool)

(declare-fun b_free!15859 () Bool)

(declare-fun b_next!15859 () Bool)

(assert (=> b!893610 (= b_free!15859 (not b_next!15859))))

(declare-fun tp!55557 () Bool)

(declare-fun b_and!26107 () Bool)

(assert (=> b!893610 (= tp!55557 b_and!26107)))

(declare-fun b!893609 () Bool)

(declare-fun e!499063 () Bool)

(declare-datatypes ((array!52343 0))(
  ( (array!52344 (arr!25175 (Array (_ BitVec 32) (_ BitVec 64))) (size!25622 (_ BitVec 32))) )
))
(declare-datatypes ((V!29215 0))(
  ( (V!29216 (val!9144 Int)) )
))
(declare-datatypes ((ValueCell!8612 0))(
  ( (ValueCellFull!8612 (v!11626 V!29215)) (EmptyCell!8612) )
))
(declare-datatypes ((array!52345 0))(
  ( (array!52346 (arr!25176 (Array (_ BitVec 32) ValueCell!8612)) (size!25623 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4240 0))(
  ( (LongMapFixedSize!4241 (defaultEntry!5326 Int) (mask!25863 (_ BitVec 32)) (extraKeys!5022 (_ BitVec 32)) (zeroValue!5126 V!29215) (minValue!5126 V!29215) (_size!2175 (_ BitVec 32)) (_keys!10013 array!52343) (_values!5313 array!52345) (_vacant!2175 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4240)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun dynLambda!1295 (Int (_ BitVec 64)) V!29215)

(assert (=> b!893609 (= e!499063 (not (= (minValue!5126 thiss!1181) (dynLambda!1295 (defaultEntry!5326 thiss!1181) key!785))))))

(declare-fun mapIsEmpty!28846 () Bool)

(declare-fun mapRes!28846 () Bool)

(assert (=> mapIsEmpty!28846 mapRes!28846))

(declare-fun e!499065 () Bool)

(declare-fun tp_is_empty!18187 () Bool)

(declare-fun e!499067 () Bool)

(declare-fun array_inv!19826 (array!52343) Bool)

(declare-fun array_inv!19827 (array!52345) Bool)

(assert (=> b!893610 (= e!499067 (and tp!55557 tp_is_empty!18187 (array_inv!19826 (_keys!10013 thiss!1181)) (array_inv!19827 (_values!5313 thiss!1181)) e!499065))))

(declare-fun res!605041 () Bool)

(declare-fun e!499061 () Bool)

(assert (=> start!76012 (=> (not res!605041) (not e!499061))))

(declare-fun valid!1646 (LongMapFixedSize!4240) Bool)

(assert (=> start!76012 (= res!605041 (valid!1646 thiss!1181))))

(assert (=> start!76012 e!499061))

(assert (=> start!76012 e!499067))

(assert (=> start!76012 true))

(declare-fun b!893611 () Bool)

(declare-fun res!605040 () Bool)

(assert (=> b!893611 (=> (not res!605040) (not e!499061))))

(assert (=> b!893611 (= res!605040 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!893612 () Bool)

(assert (=> b!893612 (= e!499061 e!499063)))

(declare-fun c!94172 () Bool)

(declare-fun contains!4358 (LongMapFixedSize!4240 (_ BitVec 64)) Bool)

(assert (=> b!893612 (= c!94172 (contains!4358 thiss!1181 key!785))))

(declare-fun b!893613 () Bool)

(declare-datatypes ((Option!458 0))(
  ( (Some!457 (v!11627 V!29215)) (None!456) )
))
(declare-fun get!13261 (Option!458) V!29215)

(declare-datatypes ((tuple2!12040 0))(
  ( (tuple2!12041 (_1!6031 (_ BitVec 64)) (_2!6031 V!29215)) )
))
(declare-datatypes ((List!17809 0))(
  ( (Nil!17806) (Cons!17805 (h!18937 tuple2!12040) (t!25127 List!17809)) )
))
(declare-fun getValueByKey!452 (List!17809 (_ BitVec 64)) Option!458)

(declare-datatypes ((ListLongMap!10727 0))(
  ( (ListLongMap!10728 (toList!5379 List!17809)) )
))
(declare-fun map!12204 (LongMapFixedSize!4240) ListLongMap!10727)

(assert (=> b!893613 (= e!499063 (not (= (minValue!5126 thiss!1181) (get!13261 (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785)))))))

(declare-fun b!893614 () Bool)

(declare-fun e!499066 () Bool)

(assert (=> b!893614 (= e!499065 (and e!499066 mapRes!28846))))

(declare-fun condMapEmpty!28846 () Bool)

(declare-fun mapDefault!28846 () ValueCell!8612)

(assert (=> b!893614 (= condMapEmpty!28846 (= (arr!25176 (_values!5313 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8612)) mapDefault!28846)))))

(declare-fun b!893615 () Bool)

(assert (=> b!893615 (= e!499066 tp_is_empty!18187)))

(declare-fun mapNonEmpty!28846 () Bool)

(declare-fun tp!55558 () Bool)

(declare-fun e!499064 () Bool)

(assert (=> mapNonEmpty!28846 (= mapRes!28846 (and tp!55558 e!499064))))

(declare-fun mapRest!28846 () (Array (_ BitVec 32) ValueCell!8612))

(declare-fun mapKey!28846 () (_ BitVec 32))

(declare-fun mapValue!28846 () ValueCell!8612)

(assert (=> mapNonEmpty!28846 (= (arr!25176 (_values!5313 thiss!1181)) (store mapRest!28846 mapKey!28846 mapValue!28846))))

(declare-fun b!893616 () Bool)

(assert (=> b!893616 (= e!499064 tp_is_empty!18187)))

(assert (= (and start!76012 res!605041) b!893611))

(assert (= (and b!893611 res!605040) b!893612))

(assert (= (and b!893612 c!94172) b!893613))

(assert (= (and b!893612 (not c!94172)) b!893609))

(assert (= (and b!893614 condMapEmpty!28846) mapIsEmpty!28846))

(assert (= (and b!893614 (not condMapEmpty!28846)) mapNonEmpty!28846))

(get-info :version)

(assert (= (and mapNonEmpty!28846 ((_ is ValueCellFull!8612) mapValue!28846)) b!893616))

(assert (= (and b!893614 ((_ is ValueCellFull!8612) mapDefault!28846)) b!893615))

(assert (= b!893610 b!893614))

(assert (= start!76012 b!893610))

(declare-fun b_lambda!12913 () Bool)

(assert (=> (not b_lambda!12913) (not b!893609)))

(declare-fun t!25126 () Bool)

(declare-fun tb!5169 () Bool)

(assert (=> (and b!893610 (= (defaultEntry!5326 thiss!1181) (defaultEntry!5326 thiss!1181)) t!25126) tb!5169))

(declare-fun result!10061 () Bool)

(assert (=> tb!5169 (= result!10061 tp_is_empty!18187)))

(assert (=> b!893609 t!25126))

(declare-fun b_and!26109 () Bool)

(assert (= b_and!26107 (and (=> t!25126 result!10061) b_and!26109)))

(declare-fun m!831167 () Bool)

(assert (=> b!893612 m!831167))

(declare-fun m!831169 () Bool)

(assert (=> start!76012 m!831169))

(declare-fun m!831171 () Bool)

(assert (=> b!893613 m!831171))

(declare-fun m!831173 () Bool)

(assert (=> b!893613 m!831173))

(assert (=> b!893613 m!831173))

(declare-fun m!831175 () Bool)

(assert (=> b!893613 m!831175))

(declare-fun m!831177 () Bool)

(assert (=> b!893609 m!831177))

(declare-fun m!831179 () Bool)

(assert (=> b!893610 m!831179))

(declare-fun m!831181 () Bool)

(assert (=> b!893610 m!831181))

(declare-fun m!831183 () Bool)

(assert (=> mapNonEmpty!28846 m!831183))

(check-sat (not mapNonEmpty!28846) (not b!893610) (not start!76012) (not b!893612) (not b!893613) (not b_next!15859) b_and!26109 tp_is_empty!18187 (not b_lambda!12913))
(check-sat b_and!26109 (not b_next!15859))
(get-model)

(declare-fun b_lambda!12919 () Bool)

(assert (= b_lambda!12913 (or (and b!893610 b_free!15859) b_lambda!12919)))

(check-sat (not mapNonEmpty!28846) (not b!893610) (not start!76012) (not b!893612) (not b!893613) (not b_lambda!12919) (not b_next!15859) b_and!26109 tp_is_empty!18187)
(check-sat b_and!26109 (not b_next!15859))
(get-model)

(declare-fun d!110273 () Bool)

(assert (=> d!110273 (= (array_inv!19826 (_keys!10013 thiss!1181)) (bvsge (size!25622 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893610 d!110273))

(declare-fun d!110275 () Bool)

(assert (=> d!110275 (= (array_inv!19827 (_values!5313 thiss!1181)) (bvsge (size!25623 (_values!5313 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893610 d!110275))

(declare-fun d!110277 () Bool)

(assert (=> d!110277 (= (get!13261 (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785)) (v!11627 (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785)))))

(assert (=> b!893613 d!110277))

(declare-fun b!893681 () Bool)

(declare-fun e!499115 () Option!458)

(assert (=> b!893681 (= e!499115 (getValueByKey!452 (t!25127 (toList!5379 (map!12204 thiss!1181))) key!785))))

(declare-fun b!893682 () Bool)

(assert (=> b!893682 (= e!499115 None!456)))

(declare-fun d!110279 () Bool)

(declare-fun c!94183 () Bool)

(assert (=> d!110279 (= c!94183 (and ((_ is Cons!17805) (toList!5379 (map!12204 thiss!1181))) (= (_1!6031 (h!18937 (toList!5379 (map!12204 thiss!1181)))) key!785)))))

(declare-fun e!499114 () Option!458)

(assert (=> d!110279 (= (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785) e!499114)))

(declare-fun b!893680 () Bool)

(assert (=> b!893680 (= e!499114 e!499115)))

(declare-fun c!94184 () Bool)

(assert (=> b!893680 (= c!94184 (and ((_ is Cons!17805) (toList!5379 (map!12204 thiss!1181))) (not (= (_1!6031 (h!18937 (toList!5379 (map!12204 thiss!1181)))) key!785))))))

(declare-fun b!893679 () Bool)

(assert (=> b!893679 (= e!499114 (Some!457 (_2!6031 (h!18937 (toList!5379 (map!12204 thiss!1181))))))))

(assert (= (and d!110279 c!94183) b!893679))

(assert (= (and d!110279 (not c!94183)) b!893680))

(assert (= (and b!893680 c!94184) b!893681))

(assert (= (and b!893680 (not c!94184)) b!893682))

(declare-fun m!831221 () Bool)

(assert (=> b!893681 m!831221))

(assert (=> b!893613 d!110279))

(declare-fun d!110281 () Bool)

(declare-fun getCurrentListMap!2600 (array!52343 array!52345 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 32) Int) ListLongMap!10727)

(assert (=> d!110281 (= (map!12204 thiss!1181) (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun bs!25065 () Bool)

(assert (= bs!25065 d!110281))

(declare-fun m!831223 () Bool)

(assert (=> bs!25065 m!831223))

(assert (=> b!893613 d!110281))

(declare-fun bm!39640 () Bool)

(declare-fun call!39645 () Bool)

(declare-fun arrayContainsKey!0 (array!52343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39640 (= call!39645 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun bm!39641 () Bool)

(declare-fun call!39643 () ListLongMap!10727)

(assert (=> bm!39641 (= call!39643 (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun b!893703 () Bool)

(declare-fun c!94195 () Bool)

(declare-datatypes ((SeekEntryResult!8871 0))(
  ( (MissingZero!8871 (index!37855 (_ BitVec 32))) (Found!8871 (index!37856 (_ BitVec 32))) (Intermediate!8871 (undefined!9683 Bool) (index!37857 (_ BitVec 32)) (x!76002 (_ BitVec 32))) (Undefined!8871) (MissingVacant!8871 (index!37858 (_ BitVec 32))) )
))
(declare-fun lt!403733 () SeekEntryResult!8871)

(assert (=> b!893703 (= c!94195 ((_ is Found!8871) lt!403733))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52343 (_ BitVec 32)) SeekEntryResult!8871)

(assert (=> b!893703 (= lt!403733 (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun e!499126 () Bool)

(declare-fun e!499129 () Bool)

(assert (=> b!893703 (= e!499126 e!499129)))

(declare-fun b!893704 () Bool)

(assert (=> b!893704 (= e!499129 true)))

(declare-datatypes ((Unit!30382 0))(
  ( (Unit!30383) )
))
(declare-fun lt!403732 () Unit!30382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52343 (_ BitVec 64) (_ BitVec 32)) Unit!30382)

(assert (=> b!893704 (= lt!403732 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) key!785 (index!37856 lt!403733)))))

(assert (=> b!893704 call!39645))

(declare-fun lt!403736 () Unit!30382)

(assert (=> b!893704 (= lt!403736 lt!403732)))

(declare-fun lt!403731 () Unit!30382)

(declare-fun lemmaValidKeyInArrayIsInListMap!236 (array!52343 array!52345 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 32) Int) Unit!30382)

(assert (=> b!893704 (= lt!403731 (lemmaValidKeyInArrayIsInListMap!236 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (index!37856 lt!403733) (defaultEntry!5326 thiss!1181)))))

(declare-fun call!39644 () Bool)

(assert (=> b!893704 call!39644))

(declare-fun lt!403740 () Unit!30382)

(assert (=> b!893704 (= lt!403740 lt!403731)))

(declare-fun bm!39642 () Bool)

(declare-fun contains!4359 (ListLongMap!10727 (_ BitVec 64)) Bool)

(assert (=> bm!39642 (= call!39644 (contains!4359 call!39643 (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(declare-fun b!893705 () Bool)

(declare-fun e!499128 () Bool)

(assert (=> b!893705 (= e!499128 call!39645)))

(declare-fun b!893706 () Bool)

(assert (=> b!893706 (= e!499128 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!893707 () Bool)

(assert (=> b!893707 false))

(declare-fun lt!403737 () Unit!30382)

(declare-fun lt!403729 () Unit!30382)

(assert (=> b!893707 (= lt!403737 lt!403729)))

(declare-fun lt!403738 () SeekEntryResult!8871)

(declare-fun lt!403728 () (_ BitVec 32))

(assert (=> b!893707 (and ((_ is Found!8871) lt!403738) (= (index!37856 lt!403738) lt!403728))))

(assert (=> b!893707 (= lt!403738 (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52343 (_ BitVec 32)) Unit!30382)

(assert (=> b!893707 (= lt!403729 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403728 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun lt!403739 () Unit!30382)

(declare-fun lt!403734 () Unit!30382)

(assert (=> b!893707 (= lt!403739 lt!403734)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52343 (_ BitVec 32)) Bool)

(assert (=> b!893707 (arrayForallSeekEntryOrOpenFound!0 lt!403728 (_keys!10013 thiss!1181) (mask!25863 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30382)

(assert (=> b!893707 (= lt!403734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10013 thiss!1181) (mask!25863 thiss!1181) #b00000000000000000000000000000000 lt!403728))))

(declare-fun arrayScanForKey!0 (array!52343 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893707 (= lt!403728 (arrayScanForKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403742 () Unit!30382)

(declare-fun lt!403741 () Unit!30382)

(assert (=> b!893707 (= lt!403742 lt!403741)))

(assert (=> b!893707 e!499128))

(declare-fun c!94196 () Bool)

(assert (=> b!893707 (= c!94196 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!170 (array!52343 array!52345 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 64) Int) Unit!30382)

(assert (=> b!893707 (= lt!403741 (lemmaKeyInListMapIsInArray!170 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) key!785 (defaultEntry!5326 thiss!1181)))))

(declare-fun e!499127 () Unit!30382)

(declare-fun Unit!30384 () Unit!30382)

(assert (=> b!893707 (= e!499127 Unit!30384)))

(declare-fun b!893708 () Bool)

(assert (=> b!893708 (= e!499129 false)))

(declare-fun c!94197 () Bool)

(assert (=> b!893708 (= c!94197 call!39644)))

(declare-fun lt!403735 () Unit!30382)

(assert (=> b!893708 (= lt!403735 e!499127)))

(declare-fun d!110283 () Bool)

(declare-fun lt!403730 () Bool)

(assert (=> d!110283 (= lt!403730 (contains!4359 (map!12204 thiss!1181) key!785))))

(declare-fun e!499130 () Bool)

(assert (=> d!110283 (= lt!403730 e!499130)))

(declare-fun c!94198 () Bool)

(assert (=> d!110283 (= c!94198 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110283 (valid!1646 thiss!1181)))

(assert (=> d!110283 (= (contains!4358 thiss!1181 key!785) lt!403730)))

(declare-fun b!893709 () Bool)

(assert (=> b!893709 (= e!499130 (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!893710 () Bool)

(declare-fun Unit!30385 () Unit!30382)

(assert (=> b!893710 (= e!499127 Unit!30385)))

(declare-fun b!893711 () Bool)

(assert (=> b!893711 (= e!499130 e!499126)))

(declare-fun c!94199 () Bool)

(assert (=> b!893711 (= c!94199 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893712 () Bool)

(assert (=> b!893712 (= e!499126 (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!110283 c!94198) b!893709))

(assert (= (and d!110283 (not c!94198)) b!893711))

(assert (= (and b!893711 c!94199) b!893712))

(assert (= (and b!893711 (not c!94199)) b!893703))

(assert (= (and b!893703 c!94195) b!893704))

(assert (= (and b!893703 (not c!94195)) b!893708))

(assert (= (and b!893708 c!94197) b!893707))

(assert (= (and b!893708 (not c!94197)) b!893710))

(assert (= (and b!893707 c!94196) b!893705))

(assert (= (and b!893707 (not c!94196)) b!893706))

(assert (= (or b!893704 b!893705) bm!39640))

(assert (= (or b!893704 b!893708) bm!39641))

(assert (= (or b!893704 b!893708) bm!39642))

(assert (=> d!110283 m!831171))

(assert (=> d!110283 m!831171))

(declare-fun m!831225 () Bool)

(assert (=> d!110283 m!831225))

(assert (=> d!110283 m!831169))

(declare-fun m!831227 () Bool)

(assert (=> b!893703 m!831227))

(declare-fun m!831229 () Bool)

(assert (=> bm!39642 m!831229))

(declare-fun m!831231 () Bool)

(assert (=> bm!39642 m!831231))

(declare-fun m!831233 () Bool)

(assert (=> bm!39640 m!831233))

(declare-fun m!831235 () Bool)

(assert (=> b!893707 m!831235))

(assert (=> b!893707 m!831227))

(declare-fun m!831237 () Bool)

(assert (=> b!893707 m!831237))

(declare-fun m!831239 () Bool)

(assert (=> b!893707 m!831239))

(declare-fun m!831241 () Bool)

(assert (=> b!893707 m!831241))

(declare-fun m!831243 () Bool)

(assert (=> b!893707 m!831243))

(assert (=> bm!39641 m!831223))

(declare-fun m!831245 () Bool)

(assert (=> b!893704 m!831245))

(declare-fun m!831247 () Bool)

(assert (=> b!893704 m!831247))

(assert (=> b!893612 d!110283))

(declare-fun d!110285 () Bool)

(declare-fun res!605060 () Bool)

(declare-fun e!499133 () Bool)

(assert (=> d!110285 (=> (not res!605060) (not e!499133))))

(declare-fun simpleValid!298 (LongMapFixedSize!4240) Bool)

(assert (=> d!110285 (= res!605060 (simpleValid!298 thiss!1181))))

(assert (=> d!110285 (= (valid!1646 thiss!1181) e!499133)))

(declare-fun b!893719 () Bool)

(declare-fun res!605061 () Bool)

(assert (=> b!893719 (=> (not res!605061) (not e!499133))))

(declare-fun arrayCountValidKeys!0 (array!52343 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893719 (= res!605061 (= (arrayCountValidKeys!0 (_keys!10013 thiss!1181) #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))) (_size!2175 thiss!1181)))))

(declare-fun b!893720 () Bool)

(declare-fun res!605062 () Bool)

(assert (=> b!893720 (=> (not res!605062) (not e!499133))))

(assert (=> b!893720 (= res!605062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!893721 () Bool)

(declare-datatypes ((List!17812 0))(
  ( (Nil!17809) (Cons!17808 (h!18940 (_ BitVec 64)) (t!25134 List!17812)) )
))
(declare-fun arrayNoDuplicates!0 (array!52343 (_ BitVec 32) List!17812) Bool)

(assert (=> b!893721 (= e!499133 (arrayNoDuplicates!0 (_keys!10013 thiss!1181) #b00000000000000000000000000000000 Nil!17809))))

(assert (= (and d!110285 res!605060) b!893719))

(assert (= (and b!893719 res!605061) b!893720))

(assert (= (and b!893720 res!605062) b!893721))

(declare-fun m!831249 () Bool)

(assert (=> d!110285 m!831249))

(declare-fun m!831251 () Bool)

(assert (=> b!893719 m!831251))

(declare-fun m!831253 () Bool)

(assert (=> b!893720 m!831253))

(declare-fun m!831255 () Bool)

(assert (=> b!893721 m!831255))

(assert (=> start!76012 d!110285))

(declare-fun condMapEmpty!28855 () Bool)

(declare-fun mapDefault!28855 () ValueCell!8612)

(assert (=> mapNonEmpty!28846 (= condMapEmpty!28855 (= mapRest!28846 ((as const (Array (_ BitVec 32) ValueCell!8612)) mapDefault!28855)))))

(declare-fun e!499138 () Bool)

(declare-fun mapRes!28855 () Bool)

(assert (=> mapNonEmpty!28846 (= tp!55558 (and e!499138 mapRes!28855))))

(declare-fun mapIsEmpty!28855 () Bool)

(assert (=> mapIsEmpty!28855 mapRes!28855))

(declare-fun b!893729 () Bool)

(assert (=> b!893729 (= e!499138 tp_is_empty!18187)))

(declare-fun b!893728 () Bool)

(declare-fun e!499139 () Bool)

(assert (=> b!893728 (= e!499139 tp_is_empty!18187)))

(declare-fun mapNonEmpty!28855 () Bool)

(declare-fun tp!55573 () Bool)

(assert (=> mapNonEmpty!28855 (= mapRes!28855 (and tp!55573 e!499139))))

(declare-fun mapKey!28855 () (_ BitVec 32))

(declare-fun mapValue!28855 () ValueCell!8612)

(declare-fun mapRest!28855 () (Array (_ BitVec 32) ValueCell!8612))

(assert (=> mapNonEmpty!28855 (= mapRest!28846 (store mapRest!28855 mapKey!28855 mapValue!28855))))

(assert (= (and mapNonEmpty!28846 condMapEmpty!28855) mapIsEmpty!28855))

(assert (= (and mapNonEmpty!28846 (not condMapEmpty!28855)) mapNonEmpty!28855))

(assert (= (and mapNonEmpty!28855 ((_ is ValueCellFull!8612) mapValue!28855)) b!893728))

(assert (= (and mapNonEmpty!28846 ((_ is ValueCellFull!8612) mapDefault!28855)) b!893729))

(declare-fun m!831257 () Bool)

(assert (=> mapNonEmpty!28855 m!831257))

(check-sat (not mapNonEmpty!28855) (not bm!39642) (not d!110281) (not d!110283) (not b!893707) (not d!110285) (not bm!39640) (not bm!39641) (not b_lambda!12919) (not b_next!15859) b_and!26109 tp_is_empty!18187 (not b!893703) (not b!893720) (not b!893681) (not b!893704) (not b!893721) (not b!893719))
(check-sat b_and!26109 (not b_next!15859))
(get-model)

(declare-fun b!893740 () Bool)

(declare-fun e!499151 () Bool)

(declare-fun call!39648 () Bool)

(assert (=> b!893740 (= e!499151 call!39648)))

(declare-fun b!893741 () Bool)

(declare-fun e!499150 () Bool)

(declare-fun e!499149 () Bool)

(assert (=> b!893741 (= e!499150 e!499149)))

(declare-fun res!605069 () Bool)

(assert (=> b!893741 (=> (not res!605069) (not e!499149))))

(declare-fun e!499148 () Bool)

(assert (=> b!893741 (= res!605069 (not e!499148))))

(declare-fun res!605071 () Bool)

(assert (=> b!893741 (=> (not res!605071) (not e!499148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!893741 (= res!605071 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110287 () Bool)

(declare-fun res!605070 () Bool)

(assert (=> d!110287 (=> res!605070 e!499150)))

(assert (=> d!110287 (= res!605070 (bvsge #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110287 (= (arrayNoDuplicates!0 (_keys!10013 thiss!1181) #b00000000000000000000000000000000 Nil!17809) e!499150)))

(declare-fun b!893742 () Bool)

(declare-fun contains!4360 (List!17812 (_ BitVec 64)) Bool)

(assert (=> b!893742 (= e!499148 (contains!4360 Nil!17809 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893743 () Bool)

(assert (=> b!893743 (= e!499149 e!499151)))

(declare-fun c!94202 () Bool)

(assert (=> b!893743 (= c!94202 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893744 () Bool)

(assert (=> b!893744 (= e!499151 call!39648)))

(declare-fun bm!39645 () Bool)

(assert (=> bm!39645 (= call!39648 (arrayNoDuplicates!0 (_keys!10013 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94202 (Cons!17808 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) Nil!17809) Nil!17809)))))

(assert (= (and d!110287 (not res!605070)) b!893741))

(assert (= (and b!893741 res!605071) b!893742))

(assert (= (and b!893741 res!605069) b!893743))

(assert (= (and b!893743 c!94202) b!893740))

(assert (= (and b!893743 (not c!94202)) b!893744))

(assert (= (or b!893740 b!893744) bm!39645))

(declare-fun m!831259 () Bool)

(assert (=> b!893741 m!831259))

(assert (=> b!893741 m!831259))

(declare-fun m!831261 () Bool)

(assert (=> b!893741 m!831261))

(assert (=> b!893742 m!831259))

(assert (=> b!893742 m!831259))

(declare-fun m!831263 () Bool)

(assert (=> b!893742 m!831263))

(assert (=> b!893743 m!831259))

(assert (=> b!893743 m!831259))

(assert (=> b!893743 m!831261))

(assert (=> bm!39645 m!831259))

(declare-fun m!831265 () Bool)

(assert (=> bm!39645 m!831265))

(assert (=> b!893721 d!110287))

(declare-fun b!893753 () Bool)

(declare-fun e!499160 () Bool)

(declare-fun e!499159 () Bool)

(assert (=> b!893753 (= e!499160 e!499159)))

(declare-fun lt!403749 () (_ BitVec 64))

(assert (=> b!893753 (= lt!403749 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403751 () Unit!30382)

(assert (=> b!893753 (= lt!403751 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) lt!403749 #b00000000000000000000000000000000))))

(assert (=> b!893753 (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403749 #b00000000000000000000000000000000)))

(declare-fun lt!403750 () Unit!30382)

(assert (=> b!893753 (= lt!403750 lt!403751)))

(declare-fun res!605077 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52343 (_ BitVec 32)) SeekEntryResult!8871)

(assert (=> b!893753 (= res!605077 (= (seekEntryOrOpen!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) (Found!8871 #b00000000000000000000000000000000)))))

(assert (=> b!893753 (=> (not res!605077) (not e!499159))))

(declare-fun b!893754 () Bool)

(declare-fun e!499158 () Bool)

(assert (=> b!893754 (= e!499158 e!499160)))

(declare-fun c!94205 () Bool)

(assert (=> b!893754 (= c!94205 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39648 () Bool)

(declare-fun call!39651 () Bool)

(assert (=> bm!39648 (= call!39651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!893755 () Bool)

(assert (=> b!893755 (= e!499159 call!39651)))

(declare-fun d!110289 () Bool)

(declare-fun res!605076 () Bool)

(assert (=> d!110289 (=> res!605076 e!499158)))

(assert (=> d!110289 (= res!605076 (bvsge #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110289 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) e!499158)))

(declare-fun b!893756 () Bool)

(assert (=> b!893756 (= e!499160 call!39651)))

(assert (= (and d!110289 (not res!605076)) b!893754))

(assert (= (and b!893754 c!94205) b!893753))

(assert (= (and b!893754 (not c!94205)) b!893756))

(assert (= (and b!893753 res!605077) b!893755))

(assert (= (or b!893755 b!893756) bm!39648))

(assert (=> b!893753 m!831259))

(declare-fun m!831267 () Bool)

(assert (=> b!893753 m!831267))

(declare-fun m!831269 () Bool)

(assert (=> b!893753 m!831269))

(assert (=> b!893753 m!831259))

(declare-fun m!831271 () Bool)

(assert (=> b!893753 m!831271))

(assert (=> b!893754 m!831259))

(assert (=> b!893754 m!831259))

(assert (=> b!893754 m!831261))

(declare-fun m!831273 () Bool)

(assert (=> bm!39648 m!831273))

(assert (=> b!893720 d!110289))

(declare-fun b!893765 () Bool)

(declare-fun e!499166 () (_ BitVec 32))

(declare-fun e!499165 () (_ BitVec 32))

(assert (=> b!893765 (= e!499166 e!499165)))

(declare-fun c!94211 () Bool)

(assert (=> b!893765 (= c!94211 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893766 () Bool)

(declare-fun call!39654 () (_ BitVec 32))

(assert (=> b!893766 (= e!499165 (bvadd #b00000000000000000000000000000001 call!39654))))

(declare-fun d!110291 () Bool)

(declare-fun lt!403754 () (_ BitVec 32))

(assert (=> d!110291 (and (bvsge lt!403754 #b00000000000000000000000000000000) (bvsle lt!403754 (bvsub (size!25622 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110291 (= lt!403754 e!499166)))

(declare-fun c!94210 () Bool)

(assert (=> d!110291 (= c!94210 (bvsge #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110291 (and (bvsle #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25622 (_keys!10013 thiss!1181)) (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110291 (= (arrayCountValidKeys!0 (_keys!10013 thiss!1181) #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))) lt!403754)))

(declare-fun b!893767 () Bool)

(assert (=> b!893767 (= e!499166 #b00000000000000000000000000000000)))

(declare-fun b!893768 () Bool)

(assert (=> b!893768 (= e!499165 call!39654)))

(declare-fun bm!39651 () Bool)

(assert (=> bm!39651 (= call!39654 (arrayCountValidKeys!0 (_keys!10013 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(assert (= (and d!110291 c!94210) b!893767))

(assert (= (and d!110291 (not c!94210)) b!893765))

(assert (= (and b!893765 c!94211) b!893766))

(assert (= (and b!893765 (not c!94211)) b!893768))

(assert (= (or b!893766 b!893768) bm!39651))

(assert (=> b!893765 m!831259))

(assert (=> b!893765 m!831259))

(assert (=> b!893765 m!831261))

(declare-fun m!831275 () Bool)

(assert (=> bm!39651 m!831275))

(assert (=> b!893719 d!110291))

(declare-fun d!110293 () Bool)

(declare-fun e!499169 () Bool)

(assert (=> d!110293 e!499169))

(declare-fun c!94214 () Bool)

(assert (=> d!110293 (= c!94214 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!403757 () Unit!30382)

(declare-fun choose!1478 (array!52343 array!52345 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 64) Int) Unit!30382)

(assert (=> d!110293 (= lt!403757 (choose!1478 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) key!785 (defaultEntry!5326 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110293 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110293 (= (lemmaKeyInListMapIsInArray!170 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) key!785 (defaultEntry!5326 thiss!1181)) lt!403757)))

(declare-fun b!893773 () Bool)

(assert (=> b!893773 (= e!499169 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!893774 () Bool)

(assert (=> b!893774 (= e!499169 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110293 c!94214) b!893773))

(assert (= (and d!110293 (not c!94214)) b!893774))

(declare-fun m!831277 () Bool)

(assert (=> d!110293 m!831277))

(declare-fun m!831279 () Bool)

(assert (=> d!110293 m!831279))

(assert (=> b!893773 m!831233))

(assert (=> b!893707 d!110293))

(declare-fun b!893787 () Bool)

(declare-fun e!499176 () SeekEntryResult!8871)

(declare-fun e!499177 () SeekEntryResult!8871)

(assert (=> b!893787 (= e!499176 e!499177)))

(declare-fun lt!403767 () (_ BitVec 64))

(declare-fun lt!403769 () SeekEntryResult!8871)

(assert (=> b!893787 (= lt!403767 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37857 lt!403769)))))

(declare-fun c!94221 () Bool)

(assert (=> b!893787 (= c!94221 (= lt!403767 key!785))))

(declare-fun b!893788 () Bool)

(assert (=> b!893788 (= e!499177 (Found!8871 (index!37857 lt!403769)))))

(declare-fun b!893789 () Bool)

(declare-fun c!94222 () Bool)

(assert (=> b!893789 (= c!94222 (= lt!403767 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499178 () SeekEntryResult!8871)

(assert (=> b!893789 (= e!499177 e!499178)))

(declare-fun b!893790 () Bool)

(assert (=> b!893790 (= e!499178 (MissingZero!8871 (index!37857 lt!403769)))))

(declare-fun b!893791 () Bool)

(assert (=> b!893791 (= e!499176 Undefined!8871)))

(declare-fun d!110295 () Bool)

(declare-fun lt!403768 () SeekEntryResult!8871)

(assert (=> d!110295 (and (or ((_ is MissingVacant!8871) lt!403768) (not ((_ is Found!8871) lt!403768)) (and (bvsge (index!37856 lt!403768) #b00000000000000000000000000000000) (bvslt (index!37856 lt!403768) (size!25622 (_keys!10013 thiss!1181))))) (not ((_ is MissingVacant!8871) lt!403768)) (or (not ((_ is Found!8871) lt!403768)) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403768)) key!785)))))

(assert (=> d!110295 (= lt!403768 e!499176)))

(declare-fun c!94223 () Bool)

(assert (=> d!110295 (= c!94223 (and ((_ is Intermediate!8871) lt!403769) (undefined!9683 lt!403769)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52343 (_ BitVec 32)) SeekEntryResult!8871)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110295 (= lt!403769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25863 thiss!1181)) key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(assert (=> d!110295 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110295 (= (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) lt!403768)))

(declare-fun b!893792 () Bool)

(declare-fun lt!403766 () SeekEntryResult!8871)

(assert (=> b!893792 (= e!499178 (ite ((_ is MissingVacant!8871) lt!403766) (MissingZero!8871 (index!37858 lt!403766)) lt!403766))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52343 (_ BitVec 32)) SeekEntryResult!8871)

(assert (=> b!893792 (= lt!403766 (seekKeyOrZeroReturnVacant!0 (x!76002 lt!403769) (index!37857 lt!403769) (index!37857 lt!403769) key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(assert (= (and d!110295 c!94223) b!893791))

(assert (= (and d!110295 (not c!94223)) b!893787))

(assert (= (and b!893787 c!94221) b!893788))

(assert (= (and b!893787 (not c!94221)) b!893789))

(assert (= (and b!893789 c!94222) b!893790))

(assert (= (and b!893789 (not c!94222)) b!893792))

(declare-fun m!831281 () Bool)

(assert (=> b!893787 m!831281))

(declare-fun m!831283 () Bool)

(assert (=> d!110295 m!831283))

(declare-fun m!831285 () Bool)

(assert (=> d!110295 m!831285))

(assert (=> d!110295 m!831285))

(declare-fun m!831287 () Bool)

(assert (=> d!110295 m!831287))

(assert (=> d!110295 m!831279))

(declare-fun m!831289 () Bool)

(assert (=> b!893792 m!831289))

(assert (=> b!893707 d!110295))

(declare-fun d!110297 () Bool)

(assert (=> d!110297 (arrayForallSeekEntryOrOpenFound!0 lt!403728 (_keys!10013 thiss!1181) (mask!25863 thiss!1181))))

(declare-fun lt!403772 () Unit!30382)

(declare-fun choose!38 (array!52343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30382)

(assert (=> d!110297 (= lt!403772 (choose!38 (_keys!10013 thiss!1181) (mask!25863 thiss!1181) #b00000000000000000000000000000000 lt!403728))))

(assert (=> d!110297 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110297 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10013 thiss!1181) (mask!25863 thiss!1181) #b00000000000000000000000000000000 lt!403728) lt!403772)))

(declare-fun bs!25066 () Bool)

(assert (= bs!25066 d!110297))

(assert (=> bs!25066 m!831241))

(declare-fun m!831291 () Bool)

(assert (=> bs!25066 m!831291))

(assert (=> bs!25066 m!831279))

(assert (=> b!893707 d!110297))

(declare-fun b!893793 () Bool)

(declare-fun e!499181 () Bool)

(declare-fun e!499180 () Bool)

(assert (=> b!893793 (= e!499181 e!499180)))

(declare-fun lt!403773 () (_ BitVec 64))

(assert (=> b!893793 (= lt!403773 (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728))))

(declare-fun lt!403775 () Unit!30382)

(assert (=> b!893793 (= lt!403775 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) lt!403773 lt!403728))))

(assert (=> b!893793 (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403773 #b00000000000000000000000000000000)))

(declare-fun lt!403774 () Unit!30382)

(assert (=> b!893793 (= lt!403774 lt!403775)))

(declare-fun res!605079 () Bool)

(assert (=> b!893793 (= res!605079 (= (seekEntryOrOpen!0 (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) (Found!8871 lt!403728)))))

(assert (=> b!893793 (=> (not res!605079) (not e!499180))))

(declare-fun b!893794 () Bool)

(declare-fun e!499179 () Bool)

(assert (=> b!893794 (= e!499179 e!499181)))

(declare-fun c!94224 () Bool)

(assert (=> b!893794 (= c!94224 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728)))))

(declare-fun bm!39652 () Bool)

(declare-fun call!39655 () Bool)

(assert (=> bm!39652 (= call!39655 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403728 #b00000000000000000000000000000001) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!893795 () Bool)

(assert (=> b!893795 (= e!499180 call!39655)))

(declare-fun d!110299 () Bool)

(declare-fun res!605078 () Bool)

(assert (=> d!110299 (=> res!605078 e!499179)))

(assert (=> d!110299 (= res!605078 (bvsge lt!403728 (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110299 (= (arrayForallSeekEntryOrOpenFound!0 lt!403728 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) e!499179)))

(declare-fun b!893796 () Bool)

(assert (=> b!893796 (= e!499181 call!39655)))

(assert (= (and d!110299 (not res!605078)) b!893794))

(assert (= (and b!893794 c!94224) b!893793))

(assert (= (and b!893794 (not c!94224)) b!893796))

(assert (= (and b!893793 res!605079) b!893795))

(assert (= (or b!893795 b!893796) bm!39652))

(declare-fun m!831293 () Bool)

(assert (=> b!893793 m!831293))

(declare-fun m!831295 () Bool)

(assert (=> b!893793 m!831295))

(declare-fun m!831297 () Bool)

(assert (=> b!893793 m!831297))

(assert (=> b!893793 m!831293))

(declare-fun m!831299 () Bool)

(assert (=> b!893793 m!831299))

(assert (=> b!893794 m!831293))

(assert (=> b!893794 m!831293))

(declare-fun m!831301 () Bool)

(assert (=> b!893794 m!831301))

(declare-fun m!831303 () Bool)

(assert (=> bm!39652 m!831303))

(assert (=> b!893707 d!110299))

(declare-fun d!110301 () Bool)

(declare-fun lt!403781 () SeekEntryResult!8871)

(assert (=> d!110301 (and ((_ is Found!8871) lt!403781) (= (index!37856 lt!403781) lt!403728))))

(assert (=> d!110301 (= lt!403781 (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun lt!403780 () Unit!30382)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!52343 (_ BitVec 32)) Unit!30382)

(assert (=> d!110301 (= lt!403780 (choose!0 key!785 lt!403728 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(assert (=> d!110301 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110301 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403728 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) lt!403780)))

(declare-fun bs!25067 () Bool)

(assert (= bs!25067 d!110301))

(assert (=> bs!25067 m!831227))

(declare-fun m!831305 () Bool)

(assert (=> bs!25067 m!831305))

(assert (=> bs!25067 m!831279))

(assert (=> b!893707 d!110301))

(declare-fun d!110303 () Bool)

(declare-fun lt!403784 () (_ BitVec 32))

(assert (=> d!110303 (and (or (bvslt lt!403784 #b00000000000000000000000000000000) (bvsge lt!403784 (size!25622 (_keys!10013 thiss!1181))) (and (bvsge lt!403784 #b00000000000000000000000000000000) (bvslt lt!403784 (size!25622 (_keys!10013 thiss!1181))))) (bvsge lt!403784 #b00000000000000000000000000000000) (bvslt lt!403784 (size!25622 (_keys!10013 thiss!1181))) (= (select (arr!25175 (_keys!10013 thiss!1181)) lt!403784) key!785))))

(declare-fun e!499184 () (_ BitVec 32))

(assert (=> d!110303 (= lt!403784 e!499184)))

(declare-fun c!94227 () Bool)

(assert (=> d!110303 (= c!94227 (= (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))) (bvslt (size!25622 (_keys!10013 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110303 (= (arrayScanForKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000) lt!403784)))

(declare-fun b!893801 () Bool)

(assert (=> b!893801 (= e!499184 #b00000000000000000000000000000000)))

(declare-fun b!893802 () Bool)

(assert (=> b!893802 (= e!499184 (arrayScanForKey!0 (_keys!10013 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110303 c!94227) b!893801))

(assert (= (and d!110303 (not c!94227)) b!893802))

(declare-fun m!831307 () Bool)

(assert (=> d!110303 m!831307))

(assert (=> d!110303 m!831259))

(declare-fun m!831309 () Bool)

(assert (=> b!893802 m!831309))

(assert (=> b!893707 d!110303))

(declare-fun b!893811 () Bool)

(declare-fun res!605088 () Bool)

(declare-fun e!499187 () Bool)

(assert (=> b!893811 (=> (not res!605088) (not e!499187))))

(assert (=> b!893811 (= res!605088 (and (= (size!25623 (_values!5313 thiss!1181)) (bvadd (mask!25863 thiss!1181) #b00000000000000000000000000000001)) (= (size!25622 (_keys!10013 thiss!1181)) (size!25623 (_values!5313 thiss!1181))) (bvsge (_size!2175 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2175 thiss!1181) (bvadd (mask!25863 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!893812 () Bool)

(declare-fun res!605091 () Bool)

(assert (=> b!893812 (=> (not res!605091) (not e!499187))))

(declare-fun size!25628 (LongMapFixedSize!4240) (_ BitVec 32))

(assert (=> b!893812 (= res!605091 (bvsge (size!25628 thiss!1181) (_size!2175 thiss!1181)))))

(declare-fun b!893813 () Bool)

(declare-fun res!605090 () Bool)

(assert (=> b!893813 (=> (not res!605090) (not e!499187))))

(assert (=> b!893813 (= res!605090 (= (size!25628 thiss!1181) (bvadd (_size!2175 thiss!1181) (bvsdiv (bvadd (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!893814 () Bool)

(assert (=> b!893814 (= e!499187 (and (bvsge (extraKeys!5022 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5022 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2175 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!110305 () Bool)

(declare-fun res!605089 () Bool)

(assert (=> d!110305 (=> (not res!605089) (not e!499187))))

(assert (=> d!110305 (= res!605089 (validMask!0 (mask!25863 thiss!1181)))))

(assert (=> d!110305 (= (simpleValid!298 thiss!1181) e!499187)))

(assert (= (and d!110305 res!605089) b!893811))

(assert (= (and b!893811 res!605088) b!893812))

(assert (= (and b!893812 res!605091) b!893813))

(assert (= (and b!893813 res!605090) b!893814))

(declare-fun m!831311 () Bool)

(assert (=> b!893812 m!831311))

(assert (=> b!893813 m!831311))

(assert (=> d!110305 m!831279))

(assert (=> d!110285 d!110305))

(declare-fun b!893857 () Bool)

(declare-fun e!499226 () Bool)

(declare-fun e!499219 () Bool)

(assert (=> b!893857 (= e!499226 e!499219)))

(declare-fun res!605116 () Bool)

(declare-fun call!39673 () Bool)

(assert (=> b!893857 (= res!605116 call!39673)))

(assert (=> b!893857 (=> (not res!605116) (not e!499219))))

(declare-fun b!893858 () Bool)

(declare-fun e!499216 () Bool)

(declare-fun e!499215 () Bool)

(assert (=> b!893858 (= e!499216 e!499215)))

(declare-fun res!605111 () Bool)

(declare-fun call!39671 () Bool)

(assert (=> b!893858 (= res!605111 call!39671)))

(assert (=> b!893858 (=> (not res!605111) (not e!499215))))

(declare-fun b!893859 () Bool)

(declare-fun lt!403850 () ListLongMap!10727)

(declare-fun apply!404 (ListLongMap!10727 (_ BitVec 64)) V!29215)

(assert (=> b!893859 (= e!499215 (= (apply!404 lt!403850 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5126 thiss!1181)))))

(declare-fun b!893860 () Bool)

(declare-fun e!499223 () Bool)

(declare-fun get!13264 (ValueCell!8612 V!29215) V!29215)

(assert (=> b!893860 (= e!499223 (= (apply!404 lt!403850 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)) (get!13264 (select (arr!25176 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1295 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25623 (_values!5313 thiss!1181))))))

(assert (=> b!893860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!893861 () Bool)

(declare-fun e!499217 () Bool)

(assert (=> b!893861 (= e!499217 e!499223)))

(declare-fun res!605112 () Bool)

(assert (=> b!893861 (=> (not res!605112) (not e!499223))))

(assert (=> b!893861 (= res!605112 (contains!4359 lt!403850 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!893862 () Bool)

(declare-fun e!499220 () Bool)

(assert (=> b!893862 (= e!499220 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun call!39675 () ListLongMap!10727)

(declare-fun call!39674 () ListLongMap!10727)

(declare-fun call!39672 () ListLongMap!10727)

(declare-fun c!94243 () Bool)

(declare-fun call!39676 () ListLongMap!10727)

(declare-fun c!94242 () Bool)

(declare-fun bm!39667 () Bool)

(declare-fun +!2615 (ListLongMap!10727 tuple2!12040) ListLongMap!10727)

(assert (=> bm!39667 (= call!39672 (+!2615 (ite c!94242 call!39676 (ite c!94243 call!39675 call!39674)) (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(declare-fun b!893864 () Bool)

(declare-fun e!499224 () Unit!30382)

(declare-fun Unit!30386 () Unit!30382)

(assert (=> b!893864 (= e!499224 Unit!30386)))

(declare-fun b!893865 () Bool)

(declare-fun e!499218 () ListLongMap!10727)

(assert (=> b!893865 (= e!499218 call!39674)))

(declare-fun bm!39668 () Bool)

(assert (=> bm!39668 (= call!39671 (contains!4359 lt!403850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893866 () Bool)

(declare-fun e!499221 () ListLongMap!10727)

(assert (=> b!893866 (= e!499221 (+!2615 call!39672 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))

(declare-fun b!893867 () Bool)

(declare-fun e!499225 () Bool)

(assert (=> b!893867 (= e!499225 e!499226)))

(declare-fun c!94241 () Bool)

(assert (=> b!893867 (= c!94241 (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39669 () Bool)

(assert (=> bm!39669 (= call!39675 call!39676)))

(declare-fun b!893868 () Bool)

(declare-fun c!94244 () Bool)

(assert (=> b!893868 (= c!94244 (and (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!499214 () ListLongMap!10727)

(assert (=> b!893868 (= e!499214 e!499218)))

(declare-fun b!893869 () Bool)

(assert (=> b!893869 (= e!499221 e!499214)))

(assert (=> b!893869 (= c!94243 (and (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!893870 () Bool)

(declare-fun call!39670 () ListLongMap!10727)

(assert (=> b!893870 (= e!499214 call!39670)))

(declare-fun bm!39670 () Bool)

(assert (=> bm!39670 (= call!39674 call!39675)))

(declare-fun b!893871 () Bool)

(assert (=> b!893871 (= e!499219 (= (apply!404 lt!403850 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5126 thiss!1181)))))

(declare-fun bm!39671 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3312 (array!52343 array!52345 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 32) Int) ListLongMap!10727)

(assert (=> bm!39671 (= call!39676 (getCurrentListMapNoExtraKeys!3312 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun b!893872 () Bool)

(assert (=> b!893872 (= e!499218 call!39670)))

(declare-fun b!893873 () Bool)

(declare-fun res!605114 () Bool)

(assert (=> b!893873 (=> (not res!605114) (not e!499225))))

(assert (=> b!893873 (= res!605114 e!499217)))

(declare-fun res!605110 () Bool)

(assert (=> b!893873 (=> res!605110 e!499217)))

(assert (=> b!893873 (= res!605110 (not e!499220))))

(declare-fun res!605118 () Bool)

(assert (=> b!893873 (=> (not res!605118) (not e!499220))))

(assert (=> b!893873 (= res!605118 (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!893874 () Bool)

(declare-fun e!499222 () Bool)

(assert (=> b!893874 (= e!499222 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893875 () Bool)

(declare-fun res!605115 () Bool)

(assert (=> b!893875 (=> (not res!605115) (not e!499225))))

(assert (=> b!893875 (= res!605115 e!499216)))

(declare-fun c!94240 () Bool)

(assert (=> b!893875 (= c!94240 (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39672 () Bool)

(assert (=> bm!39672 (= call!39670 call!39672)))

(declare-fun b!893876 () Bool)

(assert (=> b!893876 (= e!499216 (not call!39671))))

(declare-fun bm!39673 () Bool)

(assert (=> bm!39673 (= call!39673 (contains!4359 lt!403850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893877 () Bool)

(assert (=> b!893877 (= e!499226 (not call!39673))))

(declare-fun d!110307 () Bool)

(assert (=> d!110307 e!499225))

(declare-fun res!605113 () Bool)

(assert (=> d!110307 (=> (not res!605113) (not e!499225))))

(assert (=> d!110307 (= res!605113 (or (bvsge #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))))

(declare-fun lt!403831 () ListLongMap!10727)

(assert (=> d!110307 (= lt!403850 lt!403831)))

(declare-fun lt!403835 () Unit!30382)

(assert (=> d!110307 (= lt!403835 e!499224)))

(declare-fun c!94245 () Bool)

(assert (=> d!110307 (= c!94245 e!499222)))

(declare-fun res!605117 () Bool)

(assert (=> d!110307 (=> (not res!605117) (not e!499222))))

(assert (=> d!110307 (= res!605117 (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110307 (= lt!403831 e!499221)))

(assert (=> d!110307 (= c!94242 (and (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110307 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110307 (= (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) lt!403850)))

(declare-fun b!893863 () Bool)

(declare-fun lt!403845 () Unit!30382)

(assert (=> b!893863 (= e!499224 lt!403845)))

(declare-fun lt!403839 () ListLongMap!10727)

(assert (=> b!893863 (= lt!403839 (getCurrentListMapNoExtraKeys!3312 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun lt!403834 () (_ BitVec 64))

(assert (=> b!893863 (= lt!403834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403849 () (_ BitVec 64))

(assert (=> b!893863 (= lt!403849 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403846 () Unit!30382)

(declare-fun addStillContains!330 (ListLongMap!10727 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30382)

(assert (=> b!893863 (= lt!403846 (addStillContains!330 lt!403839 lt!403834 (zeroValue!5126 thiss!1181) lt!403849))))

(assert (=> b!893863 (contains!4359 (+!2615 lt!403839 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181))) lt!403849)))

(declare-fun lt!403840 () Unit!30382)

(assert (=> b!893863 (= lt!403840 lt!403846)))

(declare-fun lt!403836 () ListLongMap!10727)

(assert (=> b!893863 (= lt!403836 (getCurrentListMapNoExtraKeys!3312 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun lt!403829 () (_ BitVec 64))

(assert (=> b!893863 (= lt!403829 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403830 () (_ BitVec 64))

(assert (=> b!893863 (= lt!403830 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403837 () Unit!30382)

(declare-fun addApplyDifferent!330 (ListLongMap!10727 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30382)

(assert (=> b!893863 (= lt!403837 (addApplyDifferent!330 lt!403836 lt!403829 (minValue!5126 thiss!1181) lt!403830))))

(assert (=> b!893863 (= (apply!404 (+!2615 lt!403836 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181))) lt!403830) (apply!404 lt!403836 lt!403830))))

(declare-fun lt!403844 () Unit!30382)

(assert (=> b!893863 (= lt!403844 lt!403837)))

(declare-fun lt!403832 () ListLongMap!10727)

(assert (=> b!893863 (= lt!403832 (getCurrentListMapNoExtraKeys!3312 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun lt!403843 () (_ BitVec 64))

(assert (=> b!893863 (= lt!403843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403833 () (_ BitVec 64))

(assert (=> b!893863 (= lt!403833 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403838 () Unit!30382)

(assert (=> b!893863 (= lt!403838 (addApplyDifferent!330 lt!403832 lt!403843 (zeroValue!5126 thiss!1181) lt!403833))))

(assert (=> b!893863 (= (apply!404 (+!2615 lt!403832 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181))) lt!403833) (apply!404 lt!403832 lt!403833))))

(declare-fun lt!403847 () Unit!30382)

(assert (=> b!893863 (= lt!403847 lt!403838)))

(declare-fun lt!403848 () ListLongMap!10727)

(assert (=> b!893863 (= lt!403848 (getCurrentListMapNoExtraKeys!3312 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)))))

(declare-fun lt!403841 () (_ BitVec 64))

(assert (=> b!893863 (= lt!403841 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403842 () (_ BitVec 64))

(assert (=> b!893863 (= lt!403842 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893863 (= lt!403845 (addApplyDifferent!330 lt!403848 lt!403841 (minValue!5126 thiss!1181) lt!403842))))

(assert (=> b!893863 (= (apply!404 (+!2615 lt!403848 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181))) lt!403842) (apply!404 lt!403848 lt!403842))))

(assert (= (and d!110307 c!94242) b!893866))

(assert (= (and d!110307 (not c!94242)) b!893869))

(assert (= (and b!893869 c!94243) b!893870))

(assert (= (and b!893869 (not c!94243)) b!893868))

(assert (= (and b!893868 c!94244) b!893872))

(assert (= (and b!893868 (not c!94244)) b!893865))

(assert (= (or b!893872 b!893865) bm!39670))

(assert (= (or b!893870 bm!39670) bm!39669))

(assert (= (or b!893870 b!893872) bm!39672))

(assert (= (or b!893866 bm!39669) bm!39671))

(assert (= (or b!893866 bm!39672) bm!39667))

(assert (= (and d!110307 res!605117) b!893874))

(assert (= (and d!110307 c!94245) b!893863))

(assert (= (and d!110307 (not c!94245)) b!893864))

(assert (= (and d!110307 res!605113) b!893873))

(assert (= (and b!893873 res!605118) b!893862))

(assert (= (and b!893873 (not res!605110)) b!893861))

(assert (= (and b!893861 res!605112) b!893860))

(assert (= (and b!893873 res!605114) b!893875))

(assert (= (and b!893875 c!94240) b!893858))

(assert (= (and b!893875 (not c!94240)) b!893876))

(assert (= (and b!893858 res!605111) b!893859))

(assert (= (or b!893858 b!893876) bm!39668))

(assert (= (and b!893875 res!605115) b!893867))

(assert (= (and b!893867 c!94241) b!893857))

(assert (= (and b!893867 (not c!94241)) b!893877))

(assert (= (and b!893857 res!605116) b!893871))

(assert (= (or b!893857 b!893877) bm!39673))

(declare-fun b_lambda!12921 () Bool)

(assert (=> (not b_lambda!12921) (not b!893860)))

(declare-fun t!25136 () Bool)

(declare-fun tb!5175 () Bool)

(assert (=> (and b!893610 (= (defaultEntry!5326 thiss!1181) (defaultEntry!5326 thiss!1181)) t!25136) tb!5175))

(declare-fun result!10075 () Bool)

(assert (=> tb!5175 (= result!10075 tp_is_empty!18187)))

(assert (=> b!893860 t!25136))

(declare-fun b_and!26119 () Bool)

(assert (= b_and!26109 (and (=> t!25136 result!10075) b_and!26119)))

(declare-fun m!831313 () Bool)

(assert (=> bm!39673 m!831313))

(declare-fun m!831315 () Bool)

(assert (=> b!893863 m!831315))

(declare-fun m!831317 () Bool)

(assert (=> b!893863 m!831317))

(declare-fun m!831319 () Bool)

(assert (=> b!893863 m!831319))

(declare-fun m!831321 () Bool)

(assert (=> b!893863 m!831321))

(declare-fun m!831323 () Bool)

(assert (=> b!893863 m!831323))

(declare-fun m!831325 () Bool)

(assert (=> b!893863 m!831325))

(declare-fun m!831327 () Bool)

(assert (=> b!893863 m!831327))

(assert (=> b!893863 m!831259))

(declare-fun m!831329 () Bool)

(assert (=> b!893863 m!831329))

(declare-fun m!831331 () Bool)

(assert (=> b!893863 m!831331))

(declare-fun m!831333 () Bool)

(assert (=> b!893863 m!831333))

(declare-fun m!831335 () Bool)

(assert (=> b!893863 m!831335))

(declare-fun m!831337 () Bool)

(assert (=> b!893863 m!831337))

(declare-fun m!831339 () Bool)

(assert (=> b!893863 m!831339))

(declare-fun m!831341 () Bool)

(assert (=> b!893863 m!831341))

(assert (=> b!893863 m!831335))

(declare-fun m!831343 () Bool)

(assert (=> b!893863 m!831343))

(assert (=> b!893863 m!831329))

(assert (=> b!893863 m!831325))

(declare-fun m!831345 () Bool)

(assert (=> b!893863 m!831345))

(assert (=> b!893863 m!831339))

(declare-fun m!831347 () Bool)

(assert (=> b!893866 m!831347))

(declare-fun m!831349 () Bool)

(assert (=> b!893859 m!831349))

(assert (=> b!893861 m!831259))

(assert (=> b!893861 m!831259))

(declare-fun m!831351 () Bool)

(assert (=> b!893861 m!831351))

(assert (=> bm!39671 m!831337))

(assert (=> d!110307 m!831279))

(declare-fun m!831353 () Bool)

(assert (=> b!893860 m!831353))

(declare-fun m!831355 () Bool)

(assert (=> b!893860 m!831355))

(declare-fun m!831357 () Bool)

(assert (=> b!893860 m!831357))

(assert (=> b!893860 m!831353))

(assert (=> b!893860 m!831259))

(declare-fun m!831359 () Bool)

(assert (=> b!893860 m!831359))

(assert (=> b!893860 m!831259))

(assert (=> b!893860 m!831355))

(declare-fun m!831361 () Bool)

(assert (=> bm!39668 m!831361))

(assert (=> b!893862 m!831259))

(assert (=> b!893862 m!831259))

(assert (=> b!893862 m!831261))

(assert (=> b!893874 m!831259))

(assert (=> b!893874 m!831259))

(assert (=> b!893874 m!831261))

(declare-fun m!831363 () Bool)

(assert (=> bm!39667 m!831363))

(declare-fun m!831365 () Bool)

(assert (=> b!893871 m!831365))

(assert (=> d!110281 d!110307))

(declare-fun d!110309 () Bool)

(declare-fun e!499232 () Bool)

(assert (=> d!110309 e!499232))

(declare-fun res!605121 () Bool)

(assert (=> d!110309 (=> res!605121 e!499232)))

(declare-fun lt!403859 () Bool)

(assert (=> d!110309 (= res!605121 (not lt!403859))))

(declare-fun lt!403862 () Bool)

(assert (=> d!110309 (= lt!403859 lt!403862)))

(declare-fun lt!403861 () Unit!30382)

(declare-fun e!499231 () Unit!30382)

(assert (=> d!110309 (= lt!403861 e!499231)))

(declare-fun c!94248 () Bool)

(assert (=> d!110309 (= c!94248 lt!403862)))

(declare-fun containsKey!423 (List!17809 (_ BitVec 64)) Bool)

(assert (=> d!110309 (= lt!403862 (containsKey!423 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(assert (=> d!110309 (= (contains!4359 call!39643 (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)) lt!403859)))

(declare-fun b!893884 () Bool)

(declare-fun lt!403860 () Unit!30382)

(assert (=> b!893884 (= e!499231 lt!403860)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!318 (List!17809 (_ BitVec 64)) Unit!30382)

(assert (=> b!893884 (= lt!403860 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(declare-fun isDefined!331 (Option!458) Bool)

(assert (=> b!893884 (isDefined!331 (getValueByKey!452 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(declare-fun b!893885 () Bool)

(declare-fun Unit!30387 () Unit!30382)

(assert (=> b!893885 (= e!499231 Unit!30387)))

(declare-fun b!893886 () Bool)

(assert (=> b!893886 (= e!499232 (isDefined!331 (getValueByKey!452 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785))))))

(assert (= (and d!110309 c!94248) b!893884))

(assert (= (and d!110309 (not c!94248)) b!893885))

(assert (= (and d!110309 (not res!605121)) b!893886))

(declare-fun m!831367 () Bool)

(assert (=> d!110309 m!831367))

(declare-fun m!831369 () Bool)

(assert (=> b!893884 m!831369))

(declare-fun m!831371 () Bool)

(assert (=> b!893884 m!831371))

(assert (=> b!893884 m!831371))

(declare-fun m!831373 () Bool)

(assert (=> b!893884 m!831373))

(assert (=> b!893886 m!831371))

(assert (=> b!893886 m!831371))

(assert (=> b!893886 m!831373))

(assert (=> bm!39642 d!110309))

(declare-fun d!110311 () Bool)

(assert (=> d!110311 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403865 () Unit!30382)

(declare-fun choose!13 (array!52343 (_ BitVec 64) (_ BitVec 32)) Unit!30382)

(assert (=> d!110311 (= lt!403865 (choose!13 (_keys!10013 thiss!1181) key!785 (index!37856 lt!403733)))))

(assert (=> d!110311 (bvsge (index!37856 lt!403733) #b00000000000000000000000000000000)))

(assert (=> d!110311 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) key!785 (index!37856 lt!403733)) lt!403865)))

(declare-fun bs!25068 () Bool)

(assert (= bs!25068 d!110311))

(assert (=> bs!25068 m!831233))

(declare-fun m!831375 () Bool)

(assert (=> bs!25068 m!831375))

(assert (=> b!893704 d!110311))

(declare-fun d!110313 () Bool)

(declare-fun e!499235 () Bool)

(assert (=> d!110313 e!499235))

(declare-fun res!605124 () Bool)

(assert (=> d!110313 (=> (not res!605124) (not e!499235))))

(assert (=> d!110313 (= res!605124 (and (bvsge (index!37856 lt!403733) #b00000000000000000000000000000000) (bvslt (index!37856 lt!403733) (size!25622 (_keys!10013 thiss!1181)))))))

(declare-fun lt!403868 () Unit!30382)

(declare-fun choose!1479 (array!52343 array!52345 (_ BitVec 32) (_ BitVec 32) V!29215 V!29215 (_ BitVec 32) Int) Unit!30382)

(assert (=> d!110313 (= lt!403868 (choose!1479 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (index!37856 lt!403733) (defaultEntry!5326 thiss!1181)))))

(assert (=> d!110313 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110313 (= (lemmaValidKeyInArrayIsInListMap!236 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (index!37856 lt!403733) (defaultEntry!5326 thiss!1181)) lt!403868)))

(declare-fun b!893889 () Bool)

(assert (=> b!893889 (= e!499235 (contains!4359 (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733))))))

(assert (= (and d!110313 res!605124) b!893889))

(declare-fun m!831377 () Bool)

(assert (=> d!110313 m!831377))

(assert (=> d!110313 m!831279))

(assert (=> b!893889 m!831223))

(assert (=> b!893889 m!831229))

(assert (=> b!893889 m!831223))

(assert (=> b!893889 m!831229))

(declare-fun m!831379 () Bool)

(assert (=> b!893889 m!831379))

(assert (=> b!893704 d!110313))

(assert (=> b!893703 d!110295))

(declare-fun d!110315 () Bool)

(declare-fun e!499237 () Bool)

(assert (=> d!110315 e!499237))

(declare-fun res!605125 () Bool)

(assert (=> d!110315 (=> res!605125 e!499237)))

(declare-fun lt!403869 () Bool)

(assert (=> d!110315 (= res!605125 (not lt!403869))))

(declare-fun lt!403872 () Bool)

(assert (=> d!110315 (= lt!403869 lt!403872)))

(declare-fun lt!403871 () Unit!30382)

(declare-fun e!499236 () Unit!30382)

(assert (=> d!110315 (= lt!403871 e!499236)))

(declare-fun c!94249 () Bool)

(assert (=> d!110315 (= c!94249 lt!403872)))

(assert (=> d!110315 (= lt!403872 (containsKey!423 (toList!5379 (map!12204 thiss!1181)) key!785))))

(assert (=> d!110315 (= (contains!4359 (map!12204 thiss!1181) key!785) lt!403869)))

(declare-fun b!893890 () Bool)

(declare-fun lt!403870 () Unit!30382)

(assert (=> b!893890 (= e!499236 lt!403870)))

(assert (=> b!893890 (= lt!403870 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 (map!12204 thiss!1181)) key!785))))

(assert (=> b!893890 (isDefined!331 (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785))))

(declare-fun b!893891 () Bool)

(declare-fun Unit!30388 () Unit!30382)

(assert (=> b!893891 (= e!499236 Unit!30388)))

(declare-fun b!893892 () Bool)

(assert (=> b!893892 (= e!499237 (isDefined!331 (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785)))))

(assert (= (and d!110315 c!94249) b!893890))

(assert (= (and d!110315 (not c!94249)) b!893891))

(assert (= (and d!110315 (not res!605125)) b!893892))

(declare-fun m!831381 () Bool)

(assert (=> d!110315 m!831381))

(declare-fun m!831383 () Bool)

(assert (=> b!893890 m!831383))

(assert (=> b!893890 m!831173))

(assert (=> b!893890 m!831173))

(declare-fun m!831385 () Bool)

(assert (=> b!893890 m!831385))

(assert (=> b!893892 m!831173))

(assert (=> b!893892 m!831173))

(assert (=> b!893892 m!831385))

(assert (=> d!110283 d!110315))

(assert (=> d!110283 d!110281))

(assert (=> d!110283 d!110285))

(assert (=> bm!39641 d!110307))

(declare-fun d!110317 () Bool)

(declare-fun res!605130 () Bool)

(declare-fun e!499242 () Bool)

(assert (=> d!110317 (=> res!605130 e!499242)))

(assert (=> d!110317 (= res!605130 (= (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110317 (= (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000) e!499242)))

(declare-fun b!893897 () Bool)

(declare-fun e!499243 () Bool)

(assert (=> b!893897 (= e!499242 e!499243)))

(declare-fun res!605131 () Bool)

(assert (=> b!893897 (=> (not res!605131) (not e!499243))))

(assert (=> b!893897 (= res!605131 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!893898 () Bool)

(assert (=> b!893898 (= e!499243 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110317 (not res!605130)) b!893897))

(assert (= (and b!893897 res!605131) b!893898))

(assert (=> d!110317 m!831259))

(declare-fun m!831387 () Bool)

(assert (=> b!893898 m!831387))

(assert (=> bm!39640 d!110317))

(declare-fun b!893901 () Bool)

(declare-fun e!499245 () Option!458)

(assert (=> b!893901 (= e!499245 (getValueByKey!452 (t!25127 (t!25127 (toList!5379 (map!12204 thiss!1181)))) key!785))))

(declare-fun b!893902 () Bool)

(assert (=> b!893902 (= e!499245 None!456)))

(declare-fun d!110319 () Bool)

(declare-fun c!94250 () Bool)

(assert (=> d!110319 (= c!94250 (and ((_ is Cons!17805) (t!25127 (toList!5379 (map!12204 thiss!1181)))) (= (_1!6031 (h!18937 (t!25127 (toList!5379 (map!12204 thiss!1181))))) key!785)))))

(declare-fun e!499244 () Option!458)

(assert (=> d!110319 (= (getValueByKey!452 (t!25127 (toList!5379 (map!12204 thiss!1181))) key!785) e!499244)))

(declare-fun b!893900 () Bool)

(assert (=> b!893900 (= e!499244 e!499245)))

(declare-fun c!94251 () Bool)

(assert (=> b!893900 (= c!94251 (and ((_ is Cons!17805) (t!25127 (toList!5379 (map!12204 thiss!1181)))) (not (= (_1!6031 (h!18937 (t!25127 (toList!5379 (map!12204 thiss!1181))))) key!785))))))

(declare-fun b!893899 () Bool)

(assert (=> b!893899 (= e!499244 (Some!457 (_2!6031 (h!18937 (t!25127 (toList!5379 (map!12204 thiss!1181)))))))))

(assert (= (and d!110319 c!94250) b!893899))

(assert (= (and d!110319 (not c!94250)) b!893900))

(assert (= (and b!893900 c!94251) b!893901))

(assert (= (and b!893900 (not c!94251)) b!893902))

(declare-fun m!831389 () Bool)

(assert (=> b!893901 m!831389))

(assert (=> b!893681 d!110319))

(declare-fun condMapEmpty!28856 () Bool)

(declare-fun mapDefault!28856 () ValueCell!8612)

(assert (=> mapNonEmpty!28855 (= condMapEmpty!28856 (= mapRest!28855 ((as const (Array (_ BitVec 32) ValueCell!8612)) mapDefault!28856)))))

(declare-fun e!499246 () Bool)

(declare-fun mapRes!28856 () Bool)

(assert (=> mapNonEmpty!28855 (= tp!55573 (and e!499246 mapRes!28856))))

(declare-fun mapIsEmpty!28856 () Bool)

(assert (=> mapIsEmpty!28856 mapRes!28856))

(declare-fun b!893904 () Bool)

(assert (=> b!893904 (= e!499246 tp_is_empty!18187)))

(declare-fun b!893903 () Bool)

(declare-fun e!499247 () Bool)

(assert (=> b!893903 (= e!499247 tp_is_empty!18187)))

(declare-fun mapNonEmpty!28856 () Bool)

(declare-fun tp!55574 () Bool)

(assert (=> mapNonEmpty!28856 (= mapRes!28856 (and tp!55574 e!499247))))

(declare-fun mapRest!28856 () (Array (_ BitVec 32) ValueCell!8612))

(declare-fun mapKey!28856 () (_ BitVec 32))

(declare-fun mapValue!28856 () ValueCell!8612)

(assert (=> mapNonEmpty!28856 (= mapRest!28855 (store mapRest!28856 mapKey!28856 mapValue!28856))))

(assert (= (and mapNonEmpty!28855 condMapEmpty!28856) mapIsEmpty!28856))

(assert (= (and mapNonEmpty!28855 (not condMapEmpty!28856)) mapNonEmpty!28856))

(assert (= (and mapNonEmpty!28856 ((_ is ValueCellFull!8612) mapValue!28856)) b!893903))

(assert (= (and mapNonEmpty!28855 ((_ is ValueCellFull!8612) mapDefault!28856)) b!893904))

(declare-fun m!831391 () Bool)

(assert (=> mapNonEmpty!28856 m!831391))

(declare-fun b_lambda!12923 () Bool)

(assert (= b_lambda!12921 (or (and b!893610 b_free!15859) b_lambda!12923)))

(check-sat (not bm!39667) (not b!893884) (not d!110307) (not b!893863) b_and!26119 (not b!893866) (not b!893871) (not d!110305) (not mapNonEmpty!28856) (not b!893886) (not b!893765) (not b!893874) (not bm!39648) (not bm!39673) (not d!110295) (not b!893898) (not b!893859) (not bm!39652) (not b!893892) (not b!893861) (not d!110313) (not b!893743) (not b!893794) (not b!893753) (not d!110301) (not b!893812) (not b!893890) (not bm!39668) (not b!893792) (not b!893862) (not b!893754) (not b!893860) (not bm!39651) (not b_lambda!12919) (not d!110309) (not b!893773) (not b_next!15859) (not b!893901) (not b!893742) (not b!893813) (not b!893802) tp_is_empty!18187 (not d!110311) (not bm!39671) (not b_lambda!12923) (not b!893741) (not b!893793) (not b!893889) (not d!110315) (not bm!39645) (not d!110293) (not d!110297))
(check-sat b_and!26119 (not b_next!15859))
(get-model)

(declare-fun d!110321 () Bool)

(assert (=> d!110321 (= (apply!404 (+!2615 lt!403836 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181))) lt!403830) (apply!404 lt!403836 lt!403830))))

(declare-fun lt!403875 () Unit!30382)

(declare-fun choose!1480 (ListLongMap!10727 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30382)

(assert (=> d!110321 (= lt!403875 (choose!1480 lt!403836 lt!403829 (minValue!5126 thiss!1181) lt!403830))))

(declare-fun e!499250 () Bool)

(assert (=> d!110321 e!499250))

(declare-fun res!605134 () Bool)

(assert (=> d!110321 (=> (not res!605134) (not e!499250))))

(assert (=> d!110321 (= res!605134 (contains!4359 lt!403836 lt!403830))))

(assert (=> d!110321 (= (addApplyDifferent!330 lt!403836 lt!403829 (minValue!5126 thiss!1181) lt!403830) lt!403875)))

(declare-fun b!893908 () Bool)

(assert (=> b!893908 (= e!499250 (not (= lt!403830 lt!403829)))))

(assert (= (and d!110321 res!605134) b!893908))

(assert (=> d!110321 m!831329))

(assert (=> d!110321 m!831331))

(declare-fun m!831393 () Bool)

(assert (=> d!110321 m!831393))

(assert (=> d!110321 m!831345))

(assert (=> d!110321 m!831329))

(declare-fun m!831395 () Bool)

(assert (=> d!110321 m!831395))

(assert (=> b!893863 d!110321))

(declare-fun d!110323 () Bool)

(assert (=> d!110323 (= (apply!404 (+!2615 lt!403836 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181))) lt!403830) (get!13261 (getValueByKey!452 (toList!5379 (+!2615 lt!403836 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181)))) lt!403830)))))

(declare-fun bs!25069 () Bool)

(assert (= bs!25069 d!110323))

(declare-fun m!831397 () Bool)

(assert (=> bs!25069 m!831397))

(assert (=> bs!25069 m!831397))

(declare-fun m!831399 () Bool)

(assert (=> bs!25069 m!831399))

(assert (=> b!893863 d!110323))

(declare-fun d!110325 () Bool)

(assert (=> d!110325 (= (apply!404 lt!403848 lt!403842) (get!13261 (getValueByKey!452 (toList!5379 lt!403848) lt!403842)))))

(declare-fun bs!25070 () Bool)

(assert (= bs!25070 d!110325))

(declare-fun m!831401 () Bool)

(assert (=> bs!25070 m!831401))

(assert (=> bs!25070 m!831401))

(declare-fun m!831403 () Bool)

(assert (=> bs!25070 m!831403))

(assert (=> b!893863 d!110325))

(declare-fun d!110327 () Bool)

(declare-fun e!499253 () Bool)

(assert (=> d!110327 e!499253))

(declare-fun res!605139 () Bool)

(assert (=> d!110327 (=> (not res!605139) (not e!499253))))

(declare-fun lt!403887 () ListLongMap!10727)

(assert (=> d!110327 (= res!605139 (contains!4359 lt!403887 (_1!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181)))))))

(declare-fun lt!403886 () List!17809)

(assert (=> d!110327 (= lt!403887 (ListLongMap!10728 lt!403886))))

(declare-fun lt!403885 () Unit!30382)

(declare-fun lt!403884 () Unit!30382)

(assert (=> d!110327 (= lt!403885 lt!403884)))

(assert (=> d!110327 (= (getValueByKey!452 lt!403886 (_1!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!248 (List!17809 (_ BitVec 64) V!29215) Unit!30382)

(assert (=> d!110327 (= lt!403884 (lemmaContainsTupThenGetReturnValue!248 lt!403886 (_1!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181)))))))

(declare-fun insertStrictlySorted!305 (List!17809 (_ BitVec 64) V!29215) List!17809)

(assert (=> d!110327 (= lt!403886 (insertStrictlySorted!305 (toList!5379 lt!403832) (_1!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110327 (= (+!2615 lt!403832 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181))) lt!403887)))

(declare-fun b!893913 () Bool)

(declare-fun res!605140 () Bool)

(assert (=> b!893913 (=> (not res!605140) (not e!499253))))

(assert (=> b!893913 (= res!605140 (= (getValueByKey!452 (toList!5379 lt!403887) (_1!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181))))))))

(declare-fun b!893914 () Bool)

(declare-fun contains!4361 (List!17809 tuple2!12040) Bool)

(assert (=> b!893914 (= e!499253 (contains!4361 (toList!5379 lt!403887) (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181))))))

(assert (= (and d!110327 res!605139) b!893913))

(assert (= (and b!893913 res!605140) b!893914))

(declare-fun m!831405 () Bool)

(assert (=> d!110327 m!831405))

(declare-fun m!831407 () Bool)

(assert (=> d!110327 m!831407))

(declare-fun m!831409 () Bool)

(assert (=> d!110327 m!831409))

(declare-fun m!831411 () Bool)

(assert (=> d!110327 m!831411))

(declare-fun m!831413 () Bool)

(assert (=> b!893913 m!831413))

(declare-fun m!831415 () Bool)

(assert (=> b!893914 m!831415))

(assert (=> b!893863 d!110327))

(declare-fun d!110329 () Bool)

(declare-fun e!499255 () Bool)

(assert (=> d!110329 e!499255))

(declare-fun res!605141 () Bool)

(assert (=> d!110329 (=> res!605141 e!499255)))

(declare-fun lt!403888 () Bool)

(assert (=> d!110329 (= res!605141 (not lt!403888))))

(declare-fun lt!403891 () Bool)

(assert (=> d!110329 (= lt!403888 lt!403891)))

(declare-fun lt!403890 () Unit!30382)

(declare-fun e!499254 () Unit!30382)

(assert (=> d!110329 (= lt!403890 e!499254)))

(declare-fun c!94252 () Bool)

(assert (=> d!110329 (= c!94252 lt!403891)))

(assert (=> d!110329 (= lt!403891 (containsKey!423 (toList!5379 (+!2615 lt!403839 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))) lt!403849))))

(assert (=> d!110329 (= (contains!4359 (+!2615 lt!403839 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181))) lt!403849) lt!403888)))

(declare-fun b!893915 () Bool)

(declare-fun lt!403889 () Unit!30382)

(assert (=> b!893915 (= e!499254 lt!403889)))

(assert (=> b!893915 (= lt!403889 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 (+!2615 lt!403839 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))) lt!403849))))

(assert (=> b!893915 (isDefined!331 (getValueByKey!452 (toList!5379 (+!2615 lt!403839 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))) lt!403849))))

(declare-fun b!893916 () Bool)

(declare-fun Unit!30389 () Unit!30382)

(assert (=> b!893916 (= e!499254 Unit!30389)))

(declare-fun b!893917 () Bool)

(assert (=> b!893917 (= e!499255 (isDefined!331 (getValueByKey!452 (toList!5379 (+!2615 lt!403839 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))) lt!403849)))))

(assert (= (and d!110329 c!94252) b!893915))

(assert (= (and d!110329 (not c!94252)) b!893916))

(assert (= (and d!110329 (not res!605141)) b!893917))

(declare-fun m!831417 () Bool)

(assert (=> d!110329 m!831417))

(declare-fun m!831419 () Bool)

(assert (=> b!893915 m!831419))

(declare-fun m!831421 () Bool)

(assert (=> b!893915 m!831421))

(assert (=> b!893915 m!831421))

(declare-fun m!831423 () Bool)

(assert (=> b!893915 m!831423))

(assert (=> b!893917 m!831421))

(assert (=> b!893917 m!831421))

(assert (=> b!893917 m!831423))

(assert (=> b!893863 d!110329))

(declare-fun d!110331 () Bool)

(declare-fun e!499256 () Bool)

(assert (=> d!110331 e!499256))

(declare-fun res!605142 () Bool)

(assert (=> d!110331 (=> (not res!605142) (not e!499256))))

(declare-fun lt!403895 () ListLongMap!10727)

(assert (=> d!110331 (= res!605142 (contains!4359 lt!403895 (_1!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))))))

(declare-fun lt!403894 () List!17809)

(assert (=> d!110331 (= lt!403895 (ListLongMap!10728 lt!403894))))

(declare-fun lt!403893 () Unit!30382)

(declare-fun lt!403892 () Unit!30382)

(assert (=> d!110331 (= lt!403893 lt!403892)))

(assert (=> d!110331 (= (getValueByKey!452 lt!403894 (_1!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110331 (= lt!403892 (lemmaContainsTupThenGetReturnValue!248 lt!403894 (_1!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110331 (= lt!403894 (insertStrictlySorted!305 (toList!5379 lt!403839) (_1!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))))))

(assert (=> d!110331 (= (+!2615 lt!403839 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181))) lt!403895)))

(declare-fun b!893918 () Bool)

(declare-fun res!605143 () Bool)

(assert (=> b!893918 (=> (not res!605143) (not e!499256))))

(assert (=> b!893918 (= res!605143 (= (getValueByKey!452 (toList!5379 lt!403895) (_1!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181))))))))

(declare-fun b!893919 () Bool)

(assert (=> b!893919 (= e!499256 (contains!4361 (toList!5379 lt!403895) (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181))))))

(assert (= (and d!110331 res!605142) b!893918))

(assert (= (and b!893918 res!605143) b!893919))

(declare-fun m!831425 () Bool)

(assert (=> d!110331 m!831425))

(declare-fun m!831427 () Bool)

(assert (=> d!110331 m!831427))

(declare-fun m!831429 () Bool)

(assert (=> d!110331 m!831429))

(declare-fun m!831431 () Bool)

(assert (=> d!110331 m!831431))

(declare-fun m!831433 () Bool)

(assert (=> b!893918 m!831433))

(declare-fun m!831435 () Bool)

(assert (=> b!893919 m!831435))

(assert (=> b!893863 d!110331))

(declare-fun d!110333 () Bool)

(declare-fun e!499257 () Bool)

(assert (=> d!110333 e!499257))

(declare-fun res!605144 () Bool)

(assert (=> d!110333 (=> (not res!605144) (not e!499257))))

(declare-fun lt!403899 () ListLongMap!10727)

(assert (=> d!110333 (= res!605144 (contains!4359 lt!403899 (_1!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181)))))))

(declare-fun lt!403898 () List!17809)

(assert (=> d!110333 (= lt!403899 (ListLongMap!10728 lt!403898))))

(declare-fun lt!403897 () Unit!30382)

(declare-fun lt!403896 () Unit!30382)

(assert (=> d!110333 (= lt!403897 lt!403896)))

(assert (=> d!110333 (= (getValueByKey!452 lt!403898 (_1!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181)))))))

(assert (=> d!110333 (= lt!403896 (lemmaContainsTupThenGetReturnValue!248 lt!403898 (_1!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181)))))))

(assert (=> d!110333 (= lt!403898 (insertStrictlySorted!305 (toList!5379 lt!403836) (_1!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181)))))))

(assert (=> d!110333 (= (+!2615 lt!403836 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181))) lt!403899)))

(declare-fun b!893920 () Bool)

(declare-fun res!605145 () Bool)

(assert (=> b!893920 (=> (not res!605145) (not e!499257))))

(assert (=> b!893920 (= res!605145 (= (getValueByKey!452 (toList!5379 lt!403899) (_1!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 lt!403829 (minValue!5126 thiss!1181))))))))

(declare-fun b!893921 () Bool)

(assert (=> b!893921 (= e!499257 (contains!4361 (toList!5379 lt!403899) (tuple2!12041 lt!403829 (minValue!5126 thiss!1181))))))

(assert (= (and d!110333 res!605144) b!893920))

(assert (= (and b!893920 res!605145) b!893921))

(declare-fun m!831437 () Bool)

(assert (=> d!110333 m!831437))

(declare-fun m!831439 () Bool)

(assert (=> d!110333 m!831439))

(declare-fun m!831441 () Bool)

(assert (=> d!110333 m!831441))

(declare-fun m!831443 () Bool)

(assert (=> d!110333 m!831443))

(declare-fun m!831445 () Bool)

(assert (=> b!893920 m!831445))

(declare-fun m!831447 () Bool)

(assert (=> b!893921 m!831447))

(assert (=> b!893863 d!110333))

(declare-fun d!110335 () Bool)

(assert (=> d!110335 (= (apply!404 (+!2615 lt!403848 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181))) lt!403842) (get!13261 (getValueByKey!452 (toList!5379 (+!2615 lt!403848 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181)))) lt!403842)))))

(declare-fun bs!25071 () Bool)

(assert (= bs!25071 d!110335))

(declare-fun m!831449 () Bool)

(assert (=> bs!25071 m!831449))

(assert (=> bs!25071 m!831449))

(declare-fun m!831451 () Bool)

(assert (=> bs!25071 m!831451))

(assert (=> b!893863 d!110335))

(declare-fun d!110337 () Bool)

(declare-fun e!499258 () Bool)

(assert (=> d!110337 e!499258))

(declare-fun res!605146 () Bool)

(assert (=> d!110337 (=> (not res!605146) (not e!499258))))

(declare-fun lt!403903 () ListLongMap!10727)

(assert (=> d!110337 (= res!605146 (contains!4359 lt!403903 (_1!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181)))))))

(declare-fun lt!403902 () List!17809)

(assert (=> d!110337 (= lt!403903 (ListLongMap!10728 lt!403902))))

(declare-fun lt!403901 () Unit!30382)

(declare-fun lt!403900 () Unit!30382)

(assert (=> d!110337 (= lt!403901 lt!403900)))

(assert (=> d!110337 (= (getValueByKey!452 lt!403902 (_1!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181)))))))

(assert (=> d!110337 (= lt!403900 (lemmaContainsTupThenGetReturnValue!248 lt!403902 (_1!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181)))))))

(assert (=> d!110337 (= lt!403902 (insertStrictlySorted!305 (toList!5379 lt!403848) (_1!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181)))))))

(assert (=> d!110337 (= (+!2615 lt!403848 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181))) lt!403903)))

(declare-fun b!893922 () Bool)

(declare-fun res!605147 () Bool)

(assert (=> b!893922 (=> (not res!605147) (not e!499258))))

(assert (=> b!893922 (= res!605147 (= (getValueByKey!452 (toList!5379 lt!403903) (_1!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181))))))))

(declare-fun b!893923 () Bool)

(assert (=> b!893923 (= e!499258 (contains!4361 (toList!5379 lt!403903) (tuple2!12041 lt!403841 (minValue!5126 thiss!1181))))))

(assert (= (and d!110337 res!605146) b!893922))

(assert (= (and b!893922 res!605147) b!893923))

(declare-fun m!831453 () Bool)

(assert (=> d!110337 m!831453))

(declare-fun m!831455 () Bool)

(assert (=> d!110337 m!831455))

(declare-fun m!831457 () Bool)

(assert (=> d!110337 m!831457))

(declare-fun m!831459 () Bool)

(assert (=> d!110337 m!831459))

(declare-fun m!831461 () Bool)

(assert (=> b!893922 m!831461))

(declare-fun m!831463 () Bool)

(assert (=> b!893923 m!831463))

(assert (=> b!893863 d!110337))

(declare-fun d!110339 () Bool)

(assert (=> d!110339 (= (apply!404 (+!2615 lt!403832 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181))) lt!403833) (get!13261 (getValueByKey!452 (toList!5379 (+!2615 lt!403832 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181)))) lt!403833)))))

(declare-fun bs!25072 () Bool)

(assert (= bs!25072 d!110339))

(declare-fun m!831465 () Bool)

(assert (=> bs!25072 m!831465))

(assert (=> bs!25072 m!831465))

(declare-fun m!831467 () Bool)

(assert (=> bs!25072 m!831467))

(assert (=> b!893863 d!110339))

(declare-fun d!110341 () Bool)

(assert (=> d!110341 (= (apply!404 (+!2615 lt!403832 (tuple2!12041 lt!403843 (zeroValue!5126 thiss!1181))) lt!403833) (apply!404 lt!403832 lt!403833))))

(declare-fun lt!403904 () Unit!30382)

(assert (=> d!110341 (= lt!403904 (choose!1480 lt!403832 lt!403843 (zeroValue!5126 thiss!1181) lt!403833))))

(declare-fun e!499259 () Bool)

(assert (=> d!110341 e!499259))

(declare-fun res!605148 () Bool)

(assert (=> d!110341 (=> (not res!605148) (not e!499259))))

(assert (=> d!110341 (= res!605148 (contains!4359 lt!403832 lt!403833))))

(assert (=> d!110341 (= (addApplyDifferent!330 lt!403832 lt!403843 (zeroValue!5126 thiss!1181) lt!403833) lt!403904)))

(declare-fun b!893924 () Bool)

(assert (=> b!893924 (= e!499259 (not (= lt!403833 lt!403843)))))

(assert (= (and d!110341 res!605148) b!893924))

(assert (=> d!110341 m!831339))

(assert (=> d!110341 m!831341))

(declare-fun m!831469 () Bool)

(assert (=> d!110341 m!831469))

(assert (=> d!110341 m!831317))

(assert (=> d!110341 m!831339))

(declare-fun m!831471 () Bool)

(assert (=> d!110341 m!831471))

(assert (=> b!893863 d!110341))

(declare-fun d!110343 () Bool)

(assert (=> d!110343 (= (apply!404 lt!403836 lt!403830) (get!13261 (getValueByKey!452 (toList!5379 lt!403836) lt!403830)))))

(declare-fun bs!25073 () Bool)

(assert (= bs!25073 d!110343))

(declare-fun m!831473 () Bool)

(assert (=> bs!25073 m!831473))

(assert (=> bs!25073 m!831473))

(declare-fun m!831475 () Bool)

(assert (=> bs!25073 m!831475))

(assert (=> b!893863 d!110343))

(declare-fun d!110345 () Bool)

(assert (=> d!110345 (= (apply!404 (+!2615 lt!403848 (tuple2!12041 lt!403841 (minValue!5126 thiss!1181))) lt!403842) (apply!404 lt!403848 lt!403842))))

(declare-fun lt!403905 () Unit!30382)

(assert (=> d!110345 (= lt!403905 (choose!1480 lt!403848 lt!403841 (minValue!5126 thiss!1181) lt!403842))))

(declare-fun e!499260 () Bool)

(assert (=> d!110345 e!499260))

(declare-fun res!605149 () Bool)

(assert (=> d!110345 (=> (not res!605149) (not e!499260))))

(assert (=> d!110345 (= res!605149 (contains!4359 lt!403848 lt!403842))))

(assert (=> d!110345 (= (addApplyDifferent!330 lt!403848 lt!403841 (minValue!5126 thiss!1181) lt!403842) lt!403905)))

(declare-fun b!893925 () Bool)

(assert (=> b!893925 (= e!499260 (not (= lt!403842 lt!403841)))))

(assert (= (and d!110345 res!605149) b!893925))

(assert (=> d!110345 m!831335))

(assert (=> d!110345 m!831343))

(declare-fun m!831477 () Bool)

(assert (=> d!110345 m!831477))

(assert (=> d!110345 m!831319))

(assert (=> d!110345 m!831335))

(declare-fun m!831479 () Bool)

(assert (=> d!110345 m!831479))

(assert (=> b!893863 d!110345))

(declare-fun d!110347 () Bool)

(assert (=> d!110347 (= (apply!404 lt!403832 lt!403833) (get!13261 (getValueByKey!452 (toList!5379 lt!403832) lt!403833)))))

(declare-fun bs!25074 () Bool)

(assert (= bs!25074 d!110347))

(declare-fun m!831481 () Bool)

(assert (=> bs!25074 m!831481))

(assert (=> bs!25074 m!831481))

(declare-fun m!831483 () Bool)

(assert (=> bs!25074 m!831483))

(assert (=> b!893863 d!110347))

(declare-fun d!110349 () Bool)

(assert (=> d!110349 (contains!4359 (+!2615 lt!403839 (tuple2!12041 lt!403834 (zeroValue!5126 thiss!1181))) lt!403849)))

(declare-fun lt!403908 () Unit!30382)

(declare-fun choose!1481 (ListLongMap!10727 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30382)

(assert (=> d!110349 (= lt!403908 (choose!1481 lt!403839 lt!403834 (zeroValue!5126 thiss!1181) lt!403849))))

(assert (=> d!110349 (contains!4359 lt!403839 lt!403849)))

(assert (=> d!110349 (= (addStillContains!330 lt!403839 lt!403834 (zeroValue!5126 thiss!1181) lt!403849) lt!403908)))

(declare-fun bs!25075 () Bool)

(assert (= bs!25075 d!110349))

(assert (=> bs!25075 m!831325))

(assert (=> bs!25075 m!831325))

(assert (=> bs!25075 m!831327))

(declare-fun m!831485 () Bool)

(assert (=> bs!25075 m!831485))

(declare-fun m!831487 () Bool)

(assert (=> bs!25075 m!831487))

(assert (=> b!893863 d!110349))

(declare-fun b!893951 () Bool)

(declare-fun e!499281 () Bool)

(declare-fun e!499276 () Bool)

(assert (=> b!893951 (= e!499281 e!499276)))

(declare-fun c!94261 () Bool)

(assert (=> b!893951 (= c!94261 (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!893952 () Bool)

(declare-fun lt!403923 () ListLongMap!10727)

(declare-fun isEmpty!687 (ListLongMap!10727) Bool)

(assert (=> b!893952 (= e!499276 (isEmpty!687 lt!403923))))

(declare-fun b!893953 () Bool)

(declare-fun e!499275 () ListLongMap!10727)

(declare-fun call!39679 () ListLongMap!10727)

(assert (=> b!893953 (= e!499275 call!39679)))

(declare-fun b!893954 () Bool)

(declare-fun e!499279 () Bool)

(assert (=> b!893954 (= e!499279 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893954 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!893955 () Bool)

(assert (=> b!893955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> b!893955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25623 (_values!5313 thiss!1181))))))

(declare-fun e!499277 () Bool)

(assert (=> b!893955 (= e!499277 (= (apply!404 lt!403923 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)) (get!13264 (select (arr!25176 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1295 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!893956 () Bool)

(declare-fun lt!403929 () Unit!30382)

(declare-fun lt!403926 () Unit!30382)

(assert (=> b!893956 (= lt!403929 lt!403926)))

(declare-fun lt!403928 () (_ BitVec 64))

(declare-fun lt!403925 () V!29215)

(declare-fun lt!403927 () ListLongMap!10727)

(declare-fun lt!403924 () (_ BitVec 64))

(assert (=> b!893956 (not (contains!4359 (+!2615 lt!403927 (tuple2!12041 lt!403924 lt!403925)) lt!403928))))

(declare-fun addStillNotContains!214 (ListLongMap!10727 (_ BitVec 64) V!29215 (_ BitVec 64)) Unit!30382)

(assert (=> b!893956 (= lt!403926 (addStillNotContains!214 lt!403927 lt!403924 lt!403925 lt!403928))))

(assert (=> b!893956 (= lt!403928 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!893956 (= lt!403925 (get!13264 (select (arr!25176 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1295 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!893956 (= lt!403924 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893956 (= lt!403927 call!39679)))

(assert (=> b!893956 (= e!499275 (+!2615 call!39679 (tuple2!12041 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) (get!13264 (select (arr!25176 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1295 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!893957 () Bool)

(declare-fun e!499280 () Bool)

(assert (=> b!893957 (= e!499280 e!499281)))

(declare-fun c!94263 () Bool)

(assert (=> b!893957 (= c!94263 e!499279)))

(declare-fun res!605159 () Bool)

(assert (=> b!893957 (=> (not res!605159) (not e!499279))))

(assert (=> b!893957 (= res!605159 (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!893958 () Bool)

(declare-fun e!499278 () ListLongMap!10727)

(assert (=> b!893958 (= e!499278 (ListLongMap!10728 Nil!17806))))

(declare-fun d!110351 () Bool)

(assert (=> d!110351 e!499280))

(declare-fun res!605160 () Bool)

(assert (=> d!110351 (=> (not res!605160) (not e!499280))))

(assert (=> d!110351 (= res!605160 (not (contains!4359 lt!403923 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!110351 (= lt!403923 e!499278)))

(declare-fun c!94264 () Bool)

(assert (=> d!110351 (= c!94264 (bvsge #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110351 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110351 (= (getCurrentListMapNoExtraKeys!3312 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) lt!403923)))

(declare-fun b!893959 () Bool)

(assert (=> b!893959 (= e!499276 (= lt!403923 (getCurrentListMapNoExtraKeys!3312 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5326 thiss!1181))))))

(declare-fun b!893960 () Bool)

(declare-fun res!605158 () Bool)

(assert (=> b!893960 (=> (not res!605158) (not e!499280))))

(assert (=> b!893960 (= res!605158 (not (contains!4359 lt!403923 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893961 () Bool)

(assert (=> b!893961 (= e!499281 e!499277)))

(assert (=> b!893961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun res!605161 () Bool)

(assert (=> b!893961 (= res!605161 (contains!4359 lt!403923 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893961 (=> (not res!605161) (not e!499277))))

(declare-fun b!893962 () Bool)

(assert (=> b!893962 (= e!499278 e!499275)))

(declare-fun c!94262 () Bool)

(assert (=> b!893962 (= c!94262 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39676 () Bool)

(assert (=> bm!39676 (= call!39679 (getCurrentListMapNoExtraKeys!3312 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5326 thiss!1181)))))

(assert (= (and d!110351 c!94264) b!893958))

(assert (= (and d!110351 (not c!94264)) b!893962))

(assert (= (and b!893962 c!94262) b!893956))

(assert (= (and b!893962 (not c!94262)) b!893953))

(assert (= (or b!893956 b!893953) bm!39676))

(assert (= (and d!110351 res!605160) b!893960))

(assert (= (and b!893960 res!605158) b!893957))

(assert (= (and b!893957 res!605159) b!893954))

(assert (= (and b!893957 c!94263) b!893961))

(assert (= (and b!893957 (not c!94263)) b!893951))

(assert (= (and b!893961 res!605161) b!893955))

(assert (= (and b!893951 c!94261) b!893959))

(assert (= (and b!893951 (not c!94261)) b!893952))

(declare-fun b_lambda!12925 () Bool)

(assert (=> (not b_lambda!12925) (not b!893955)))

(assert (=> b!893955 t!25136))

(declare-fun b_and!26121 () Bool)

(assert (= b_and!26119 (and (=> t!25136 result!10075) b_and!26121)))

(declare-fun b_lambda!12927 () Bool)

(assert (=> (not b_lambda!12927) (not b!893956)))

(assert (=> b!893956 t!25136))

(declare-fun b_and!26123 () Bool)

(assert (= b_and!26121 (and (=> t!25136 result!10075) b_and!26123)))

(assert (=> b!893955 m!831259))

(assert (=> b!893955 m!831259))

(declare-fun m!831489 () Bool)

(assert (=> b!893955 m!831489))

(assert (=> b!893955 m!831353))

(assert (=> b!893955 m!831353))

(assert (=> b!893955 m!831355))

(assert (=> b!893955 m!831357))

(assert (=> b!893955 m!831355))

(assert (=> b!893954 m!831259))

(assert (=> b!893954 m!831259))

(assert (=> b!893954 m!831261))

(declare-fun m!831491 () Bool)

(assert (=> bm!39676 m!831491))

(declare-fun m!831493 () Bool)

(assert (=> b!893960 m!831493))

(assert (=> b!893961 m!831259))

(assert (=> b!893961 m!831259))

(declare-fun m!831495 () Bool)

(assert (=> b!893961 m!831495))

(assert (=> b!893959 m!831491))

(assert (=> b!893962 m!831259))

(assert (=> b!893962 m!831259))

(assert (=> b!893962 m!831261))

(assert (=> b!893956 m!831259))

(declare-fun m!831497 () Bool)

(assert (=> b!893956 m!831497))

(declare-fun m!831499 () Bool)

(assert (=> b!893956 m!831499))

(assert (=> b!893956 m!831353))

(assert (=> b!893956 m!831499))

(declare-fun m!831501 () Bool)

(assert (=> b!893956 m!831501))

(assert (=> b!893956 m!831353))

(assert (=> b!893956 m!831355))

(assert (=> b!893956 m!831357))

(declare-fun m!831503 () Bool)

(assert (=> b!893956 m!831503))

(assert (=> b!893956 m!831355))

(declare-fun m!831505 () Bool)

(assert (=> b!893952 m!831505))

(declare-fun m!831507 () Bool)

(assert (=> d!110351 m!831507))

(assert (=> d!110351 m!831279))

(assert (=> b!893863 d!110351))

(declare-fun d!110353 () Bool)

(assert (=> d!110353 (= (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893743 d!110353))

(assert (=> b!893765 d!110353))

(declare-fun d!110355 () Bool)

(declare-fun e!499282 () Bool)

(assert (=> d!110355 e!499282))

(declare-fun res!605162 () Bool)

(assert (=> d!110355 (=> (not res!605162) (not e!499282))))

(declare-fun lt!403933 () ListLongMap!10727)

(assert (=> d!110355 (= res!605162 (contains!4359 lt!403933 (_1!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(declare-fun lt!403932 () List!17809)

(assert (=> d!110355 (= lt!403933 (ListLongMap!10728 lt!403932))))

(declare-fun lt!403931 () Unit!30382)

(declare-fun lt!403930 () Unit!30382)

(assert (=> d!110355 (= lt!403931 lt!403930)))

(assert (=> d!110355 (= (getValueByKey!452 lt!403932 (_1!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))) (Some!457 (_2!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(assert (=> d!110355 (= lt!403930 (lemmaContainsTupThenGetReturnValue!248 lt!403932 (_1!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) (_2!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(assert (=> d!110355 (= lt!403932 (insertStrictlySorted!305 (toList!5379 (ite c!94242 call!39676 (ite c!94243 call!39675 call!39674))) (_1!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) (_2!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(assert (=> d!110355 (= (+!2615 (ite c!94242 call!39676 (ite c!94243 call!39675 call!39674)) (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) lt!403933)))

(declare-fun b!893963 () Bool)

(declare-fun res!605163 () Bool)

(assert (=> b!893963 (=> (not res!605163) (not e!499282))))

(assert (=> b!893963 (= res!605163 (= (getValueByKey!452 (toList!5379 lt!403933) (_1!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))) (Some!457 (_2!6031 (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))))

(declare-fun b!893964 () Bool)

(assert (=> b!893964 (= e!499282 (contains!4361 (toList!5379 lt!403933) (ite (or c!94242 c!94243) (tuple2!12041 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5126 thiss!1181)) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(assert (= (and d!110355 res!605162) b!893963))

(assert (= (and b!893963 res!605163) b!893964))

(declare-fun m!831509 () Bool)

(assert (=> d!110355 m!831509))

(declare-fun m!831511 () Bool)

(assert (=> d!110355 m!831511))

(declare-fun m!831513 () Bool)

(assert (=> d!110355 m!831513))

(declare-fun m!831515 () Bool)

(assert (=> d!110355 m!831515))

(declare-fun m!831517 () Bool)

(assert (=> b!893963 m!831517))

(declare-fun m!831519 () Bool)

(assert (=> b!893964 m!831519))

(assert (=> bm!39667 d!110355))

(declare-fun d!110357 () Bool)

(declare-fun lt!403936 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!399 (List!17812) (InoxSet (_ BitVec 64)))

(assert (=> d!110357 (= lt!403936 (select (content!399 Nil!17809) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499287 () Bool)

(assert (=> d!110357 (= lt!403936 e!499287)))

(declare-fun res!605169 () Bool)

(assert (=> d!110357 (=> (not res!605169) (not e!499287))))

(assert (=> d!110357 (= res!605169 ((_ is Cons!17808) Nil!17809))))

(assert (=> d!110357 (= (contains!4360 Nil!17809 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)) lt!403936)))

(declare-fun b!893969 () Bool)

(declare-fun e!499288 () Bool)

(assert (=> b!893969 (= e!499287 e!499288)))

(declare-fun res!605168 () Bool)

(assert (=> b!893969 (=> res!605168 e!499288)))

(assert (=> b!893969 (= res!605168 (= (h!18940 Nil!17809) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893970 () Bool)

(assert (=> b!893970 (= e!499288 (contains!4360 (t!25134 Nil!17809) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110357 res!605169) b!893969))

(assert (= (and b!893969 (not res!605168)) b!893970))

(declare-fun m!831521 () Bool)

(assert (=> d!110357 m!831521))

(assert (=> d!110357 m!831259))

(declare-fun m!831523 () Bool)

(assert (=> d!110357 m!831523))

(assert (=> b!893970 m!831259))

(declare-fun m!831525 () Bool)

(assert (=> b!893970 m!831525))

(assert (=> b!893742 d!110357))

(assert (=> b!893862 d!110353))

(assert (=> d!110301 d!110295))

(declare-fun d!110359 () Bool)

(declare-fun lt!403939 () SeekEntryResult!8871)

(assert (=> d!110359 (and ((_ is Found!8871) lt!403939) (= (index!37856 lt!403939) lt!403728))))

(assert (=> d!110359 (= lt!403939 (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(assert (=> d!110359 true))

(declare-fun _$57!22 () Unit!30382)

(assert (=> d!110359 (= (choose!0 key!785 lt!403728 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) _$57!22)))

(declare-fun bs!25076 () Bool)

(assert (= bs!25076 d!110359))

(assert (=> bs!25076 m!831227))

(assert (=> d!110301 d!110359))

(declare-fun d!110361 () Bool)

(assert (=> d!110361 (= (validMask!0 (mask!25863 thiss!1181)) (and (or (= (mask!25863 thiss!1181) #b00000000000000000000000000000111) (= (mask!25863 thiss!1181) #b00000000000000000000000000001111) (= (mask!25863 thiss!1181) #b00000000000000000000000000011111) (= (mask!25863 thiss!1181) #b00000000000000000000000000111111) (= (mask!25863 thiss!1181) #b00000000000000000000000001111111) (= (mask!25863 thiss!1181) #b00000000000000000000000011111111) (= (mask!25863 thiss!1181) #b00000000000000000000000111111111) (= (mask!25863 thiss!1181) #b00000000000000000000001111111111) (= (mask!25863 thiss!1181) #b00000000000000000000011111111111) (= (mask!25863 thiss!1181) #b00000000000000000000111111111111) (= (mask!25863 thiss!1181) #b00000000000000000001111111111111) (= (mask!25863 thiss!1181) #b00000000000000000011111111111111) (= (mask!25863 thiss!1181) #b00000000000000000111111111111111) (= (mask!25863 thiss!1181) #b00000000000000001111111111111111) (= (mask!25863 thiss!1181) #b00000000000000011111111111111111) (= (mask!25863 thiss!1181) #b00000000000000111111111111111111) (= (mask!25863 thiss!1181) #b00000000000001111111111111111111) (= (mask!25863 thiss!1181) #b00000000000011111111111111111111) (= (mask!25863 thiss!1181) #b00000000000111111111111111111111) (= (mask!25863 thiss!1181) #b00000000001111111111111111111111) (= (mask!25863 thiss!1181) #b00000000011111111111111111111111) (= (mask!25863 thiss!1181) #b00000000111111111111111111111111) (= (mask!25863 thiss!1181) #b00000001111111111111111111111111) (= (mask!25863 thiss!1181) #b00000011111111111111111111111111) (= (mask!25863 thiss!1181) #b00000111111111111111111111111111) (= (mask!25863 thiss!1181) #b00001111111111111111111111111111) (= (mask!25863 thiss!1181) #b00011111111111111111111111111111) (= (mask!25863 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25863 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!110301 d!110361))

(assert (=> b!893741 d!110353))

(assert (=> d!110305 d!110361))

(declare-fun d!110363 () Bool)

(declare-fun e!499290 () Bool)

(assert (=> d!110363 e!499290))

(declare-fun res!605170 () Bool)

(assert (=> d!110363 (=> res!605170 e!499290)))

(declare-fun lt!403940 () Bool)

(assert (=> d!110363 (= res!605170 (not lt!403940))))

(declare-fun lt!403943 () Bool)

(assert (=> d!110363 (= lt!403940 lt!403943)))

(declare-fun lt!403942 () Unit!30382)

(declare-fun e!499289 () Unit!30382)

(assert (=> d!110363 (= lt!403942 e!499289)))

(declare-fun c!94265 () Bool)

(assert (=> d!110363 (= c!94265 lt!403943)))

(assert (=> d!110363 (= lt!403943 (containsKey!423 (toList!5379 lt!403850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110363 (= (contains!4359 lt!403850 #b1000000000000000000000000000000000000000000000000000000000000000) lt!403940)))

(declare-fun b!893971 () Bool)

(declare-fun lt!403941 () Unit!30382)

(assert (=> b!893971 (= e!499289 lt!403941)))

(assert (=> b!893971 (= lt!403941 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 lt!403850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893971 (isDefined!331 (getValueByKey!452 (toList!5379 lt!403850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893972 () Bool)

(declare-fun Unit!30390 () Unit!30382)

(assert (=> b!893972 (= e!499289 Unit!30390)))

(declare-fun b!893973 () Bool)

(assert (=> b!893973 (= e!499290 (isDefined!331 (getValueByKey!452 (toList!5379 lt!403850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110363 c!94265) b!893971))

(assert (= (and d!110363 (not c!94265)) b!893972))

(assert (= (and d!110363 (not res!605170)) b!893973))

(declare-fun m!831527 () Bool)

(assert (=> d!110363 m!831527))

(declare-fun m!831529 () Bool)

(assert (=> b!893971 m!831529))

(declare-fun m!831531 () Bool)

(assert (=> b!893971 m!831531))

(assert (=> b!893971 m!831531))

(declare-fun m!831533 () Bool)

(assert (=> b!893971 m!831533))

(assert (=> b!893973 m!831531))

(assert (=> b!893973 m!831531))

(assert (=> b!893973 m!831533))

(assert (=> bm!39673 d!110363))

(assert (=> d!110297 d!110299))

(declare-fun d!110365 () Bool)

(assert (=> d!110365 (arrayForallSeekEntryOrOpenFound!0 lt!403728 (_keys!10013 thiss!1181) (mask!25863 thiss!1181))))

(assert (=> d!110365 true))

(declare-fun _$72!119 () Unit!30382)

(assert (=> d!110365 (= (choose!38 (_keys!10013 thiss!1181) (mask!25863 thiss!1181) #b00000000000000000000000000000000 lt!403728) _$72!119)))

(declare-fun bs!25077 () Bool)

(assert (= bs!25077 d!110365))

(assert (=> bs!25077 m!831241))

(assert (=> d!110297 d!110365))

(assert (=> d!110297 d!110361))

(declare-fun d!110367 () Bool)

(assert (=> d!110367 (contains!4359 (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)))))

(assert (=> d!110367 true))

(declare-fun _$16!175 () Unit!30382)

(assert (=> d!110367 (= (choose!1479 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) (index!37856 lt!403733) (defaultEntry!5326 thiss!1181)) _$16!175)))

(declare-fun bs!25078 () Bool)

(assert (= bs!25078 d!110367))

(assert (=> bs!25078 m!831223))

(assert (=> bs!25078 m!831229))

(assert (=> bs!25078 m!831223))

(assert (=> bs!25078 m!831229))

(assert (=> bs!25078 m!831379))

(assert (=> d!110313 d!110367))

(assert (=> d!110313 d!110361))

(declare-fun d!110369 () Bool)

(declare-fun e!499292 () Bool)

(assert (=> d!110369 e!499292))

(declare-fun res!605171 () Bool)

(assert (=> d!110369 (=> res!605171 e!499292)))

(declare-fun lt!403944 () Bool)

(assert (=> d!110369 (= res!605171 (not lt!403944))))

(declare-fun lt!403947 () Bool)

(assert (=> d!110369 (= lt!403944 lt!403947)))

(declare-fun lt!403946 () Unit!30382)

(declare-fun e!499291 () Unit!30382)

(assert (=> d!110369 (= lt!403946 e!499291)))

(declare-fun c!94266 () Bool)

(assert (=> d!110369 (= c!94266 lt!403947)))

(assert (=> d!110369 (= lt!403947 (containsKey!423 (toList!5379 lt!403850) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110369 (= (contains!4359 lt!403850 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)) lt!403944)))

(declare-fun b!893974 () Bool)

(declare-fun lt!403945 () Unit!30382)

(assert (=> b!893974 (= e!499291 lt!403945)))

(assert (=> b!893974 (= lt!403945 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 lt!403850) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893974 (isDefined!331 (getValueByKey!452 (toList!5379 lt!403850) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893975 () Bool)

(declare-fun Unit!30391 () Unit!30382)

(assert (=> b!893975 (= e!499291 Unit!30391)))

(declare-fun b!893976 () Bool)

(assert (=> b!893976 (= e!499292 (isDefined!331 (getValueByKey!452 (toList!5379 lt!403850) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!110369 c!94266) b!893974))

(assert (= (and d!110369 (not c!94266)) b!893975))

(assert (= (and d!110369 (not res!605171)) b!893976))

(assert (=> d!110369 m!831259))

(declare-fun m!831535 () Bool)

(assert (=> d!110369 m!831535))

(assert (=> b!893974 m!831259))

(declare-fun m!831537 () Bool)

(assert (=> b!893974 m!831537))

(assert (=> b!893974 m!831259))

(declare-fun m!831539 () Bool)

(assert (=> b!893974 m!831539))

(assert (=> b!893974 m!831539))

(declare-fun m!831541 () Bool)

(assert (=> b!893974 m!831541))

(assert (=> b!893976 m!831259))

(assert (=> b!893976 m!831539))

(assert (=> b!893976 m!831539))

(assert (=> b!893976 m!831541))

(assert (=> b!893861 d!110369))

(declare-fun d!110371 () Bool)

(declare-fun e!499294 () Bool)

(assert (=> d!110371 e!499294))

(declare-fun res!605172 () Bool)

(assert (=> d!110371 (=> res!605172 e!499294)))

(declare-fun lt!403948 () Bool)

(assert (=> d!110371 (= res!605172 (not lt!403948))))

(declare-fun lt!403951 () Bool)

(assert (=> d!110371 (= lt!403948 lt!403951)))

(declare-fun lt!403950 () Unit!30382)

(declare-fun e!499293 () Unit!30382)

(assert (=> d!110371 (= lt!403950 e!499293)))

(declare-fun c!94267 () Bool)

(assert (=> d!110371 (= c!94267 lt!403951)))

(assert (=> d!110371 (= lt!403951 (containsKey!423 (toList!5379 (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181))) (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733))))))

(assert (=> d!110371 (= (contains!4359 (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181)) (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733))) lt!403948)))

(declare-fun b!893977 () Bool)

(declare-fun lt!403949 () Unit!30382)

(assert (=> b!893977 (= e!499293 lt!403949)))

(assert (=> b!893977 (= lt!403949 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181))) (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733))))))

(assert (=> b!893977 (isDefined!331 (getValueByKey!452 (toList!5379 (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181))) (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733))))))

(declare-fun b!893978 () Bool)

(declare-fun Unit!30392 () Unit!30382)

(assert (=> b!893978 (= e!499293 Unit!30392)))

(declare-fun b!893979 () Bool)

(assert (=> b!893979 (= e!499294 (isDefined!331 (getValueByKey!452 (toList!5379 (getCurrentListMap!2600 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5326 thiss!1181))) (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)))))))

(assert (= (and d!110371 c!94267) b!893977))

(assert (= (and d!110371 (not c!94267)) b!893978))

(assert (= (and d!110371 (not res!605172)) b!893979))

(assert (=> d!110371 m!831229))

(declare-fun m!831543 () Bool)

(assert (=> d!110371 m!831543))

(assert (=> b!893977 m!831229))

(declare-fun m!831545 () Bool)

(assert (=> b!893977 m!831545))

(assert (=> b!893977 m!831229))

(declare-fun m!831547 () Bool)

(assert (=> b!893977 m!831547))

(assert (=> b!893977 m!831547))

(declare-fun m!831549 () Bool)

(assert (=> b!893977 m!831549))

(assert (=> b!893979 m!831229))

(assert (=> b!893979 m!831547))

(assert (=> b!893979 m!831547))

(assert (=> b!893979 m!831549))

(assert (=> b!893889 d!110371))

(assert (=> b!893889 d!110307))

(declare-fun d!110373 () Bool)

(assert (=> d!110373 (= (apply!404 lt!403850 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)) (get!13261 (getValueByKey!452 (toList!5379 lt!403850) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25079 () Bool)

(assert (= bs!25079 d!110373))

(assert (=> bs!25079 m!831259))

(assert (=> bs!25079 m!831539))

(assert (=> bs!25079 m!831539))

(declare-fun m!831551 () Bool)

(assert (=> bs!25079 m!831551))

(assert (=> b!893860 d!110373))

(declare-fun d!110375 () Bool)

(declare-fun c!94270 () Bool)

(assert (=> d!110375 (= c!94270 ((_ is ValueCellFull!8612) (select (arr!25176 (_values!5313 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499297 () V!29215)

(assert (=> d!110375 (= (get!13264 (select (arr!25176 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1295 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!499297)))

(declare-fun b!893984 () Bool)

(declare-fun get!13265 (ValueCell!8612 V!29215) V!29215)

(assert (=> b!893984 (= e!499297 (get!13265 (select (arr!25176 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1295 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893985 () Bool)

(declare-fun get!13266 (ValueCell!8612 V!29215) V!29215)

(assert (=> b!893985 (= e!499297 (get!13266 (select (arr!25176 (_values!5313 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1295 (defaultEntry!5326 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110375 c!94270) b!893984))

(assert (= (and d!110375 (not c!94270)) b!893985))

(assert (=> b!893984 m!831353))

(assert (=> b!893984 m!831355))

(declare-fun m!831553 () Bool)

(assert (=> b!893984 m!831553))

(assert (=> b!893985 m!831353))

(assert (=> b!893985 m!831355))

(declare-fun m!831555 () Bool)

(assert (=> b!893985 m!831555))

(assert (=> b!893860 d!110375))

(declare-fun b!893986 () Bool)

(declare-fun e!499300 () Bool)

(declare-fun e!499299 () Bool)

(assert (=> b!893986 (= e!499300 e!499299)))

(declare-fun lt!403952 () (_ BitVec 64))

(assert (=> b!893986 (= lt!403952 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!403954 () Unit!30382)

(assert (=> b!893986 (= lt!403954 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) lt!403952 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!893986 (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403952 #b00000000000000000000000000000000)))

(declare-fun lt!403953 () Unit!30382)

(assert (=> b!893986 (= lt!403953 lt!403954)))

(declare-fun res!605174 () Bool)

(assert (=> b!893986 (= res!605174 (= (seekEntryOrOpen!0 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) (Found!8871 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!893986 (=> (not res!605174) (not e!499299))))

(declare-fun b!893987 () Bool)

(declare-fun e!499298 () Bool)

(assert (=> b!893987 (= e!499298 e!499300)))

(declare-fun c!94271 () Bool)

(assert (=> b!893987 (= c!94271 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!39677 () Bool)

(declare-fun call!39680 () Bool)

(assert (=> bm!39677 (= call!39680 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!893988 () Bool)

(assert (=> b!893988 (= e!499299 call!39680)))

(declare-fun d!110377 () Bool)

(declare-fun res!605173 () Bool)

(assert (=> d!110377 (=> res!605173 e!499298)))

(assert (=> d!110377 (= res!605173 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110377 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) e!499298)))

(declare-fun b!893989 () Bool)

(assert (=> b!893989 (= e!499300 call!39680)))

(assert (= (and d!110377 (not res!605173)) b!893987))

(assert (= (and b!893987 c!94271) b!893986))

(assert (= (and b!893987 (not c!94271)) b!893989))

(assert (= (and b!893986 res!605174) b!893988))

(assert (= (or b!893988 b!893989) bm!39677))

(declare-fun m!831557 () Bool)

(assert (=> b!893986 m!831557))

(declare-fun m!831559 () Bool)

(assert (=> b!893986 m!831559))

(declare-fun m!831561 () Bool)

(assert (=> b!893986 m!831561))

(assert (=> b!893986 m!831557))

(declare-fun m!831563 () Bool)

(assert (=> b!893986 m!831563))

(assert (=> b!893987 m!831557))

(assert (=> b!893987 m!831557))

(declare-fun m!831565 () Bool)

(assert (=> b!893987 m!831565))

(declare-fun m!831567 () Bool)

(assert (=> bm!39677 m!831567))

(assert (=> bm!39648 d!110377))

(declare-fun b!894008 () Bool)

(declare-fun e!499312 () Bool)

(declare-fun e!499313 () Bool)

(assert (=> b!894008 (= e!499312 e!499313)))

(declare-fun res!605182 () Bool)

(declare-fun lt!403959 () SeekEntryResult!8871)

(assert (=> b!894008 (= res!605182 (and ((_ is Intermediate!8871) lt!403959) (not (undefined!9683 lt!403959)) (bvslt (x!76002 lt!403959) #b01111111111111111111111111111110) (bvsge (x!76002 lt!403959) #b00000000000000000000000000000000) (bvsge (x!76002 lt!403959) #b00000000000000000000000000000000)))))

(assert (=> b!894008 (=> (not res!605182) (not e!499313))))

(declare-fun b!894009 () Bool)

(assert (=> b!894009 (and (bvsge (index!37857 lt!403959) #b00000000000000000000000000000000) (bvslt (index!37857 lt!403959) (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun res!605181 () Bool)

(assert (=> b!894009 (= res!605181 (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37857 lt!403959)) key!785))))

(declare-fun e!499314 () Bool)

(assert (=> b!894009 (=> res!605181 e!499314)))

(assert (=> b!894009 (= e!499313 e!499314)))

(declare-fun b!894010 () Bool)

(assert (=> b!894010 (= e!499312 (bvsge (x!76002 lt!403959) #b01111111111111111111111111111110))))

(declare-fun b!894011 () Bool)

(declare-fun e!499311 () SeekEntryResult!8871)

(assert (=> b!894011 (= e!499311 (Intermediate!8871 true (toIndex!0 key!785 (mask!25863 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894012 () Bool)

(declare-fun e!499315 () SeekEntryResult!8871)

(assert (=> b!894012 (= e!499311 e!499315)))

(declare-fun c!94278 () Bool)

(declare-fun lt!403960 () (_ BitVec 64))

(assert (=> b!894012 (= c!94278 (or (= lt!403960 key!785) (= (bvadd lt!403960 lt!403960) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!110379 () Bool)

(assert (=> d!110379 e!499312))

(declare-fun c!94280 () Bool)

(assert (=> d!110379 (= c!94280 (and ((_ is Intermediate!8871) lt!403959) (undefined!9683 lt!403959)))))

(assert (=> d!110379 (= lt!403959 e!499311)))

(declare-fun c!94279 () Bool)

(assert (=> d!110379 (= c!94279 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110379 (= lt!403960 (select (arr!25175 (_keys!10013 thiss!1181)) (toIndex!0 key!785 (mask!25863 thiss!1181))))))

(assert (=> d!110379 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110379 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25863 thiss!1181)) key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) lt!403959)))

(declare-fun b!894013 () Bool)

(assert (=> b!894013 (and (bvsge (index!37857 lt!403959) #b00000000000000000000000000000000) (bvslt (index!37857 lt!403959) (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> b!894013 (= e!499314 (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37857 lt!403959)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894014 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894014 (= e!499315 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25863 thiss!1181)) #b00000000000000000000000000000000 (mask!25863 thiss!1181)) key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!894015 () Bool)

(assert (=> b!894015 (and (bvsge (index!37857 lt!403959) #b00000000000000000000000000000000) (bvslt (index!37857 lt!403959) (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun res!605183 () Bool)

(assert (=> b!894015 (= res!605183 (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37857 lt!403959)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894015 (=> res!605183 e!499314)))

(declare-fun b!894016 () Bool)

(assert (=> b!894016 (= e!499315 (Intermediate!8871 false (toIndex!0 key!785 (mask!25863 thiss!1181)) #b00000000000000000000000000000000))))

(assert (= (and d!110379 c!94279) b!894011))

(assert (= (and d!110379 (not c!94279)) b!894012))

(assert (= (and b!894012 c!94278) b!894016))

(assert (= (and b!894012 (not c!94278)) b!894014))

(assert (= (and d!110379 c!94280) b!894010))

(assert (= (and d!110379 (not c!94280)) b!894008))

(assert (= (and b!894008 res!605182) b!894009))

(assert (= (and b!894009 (not res!605181)) b!894015))

(assert (= (and b!894015 (not res!605183)) b!894013))

(declare-fun m!831569 () Bool)

(assert (=> b!894009 m!831569))

(assert (=> b!894015 m!831569))

(assert (=> d!110379 m!831285))

(declare-fun m!831571 () Bool)

(assert (=> d!110379 m!831571))

(assert (=> d!110379 m!831279))

(assert (=> b!894013 m!831569))

(assert (=> b!894014 m!831285))

(declare-fun m!831573 () Bool)

(assert (=> b!894014 m!831573))

(assert (=> b!894014 m!831573))

(declare-fun m!831575 () Bool)

(assert (=> b!894014 m!831575))

(assert (=> d!110295 d!110379))

(declare-fun d!110381 () Bool)

(declare-fun lt!403966 () (_ BitVec 32))

(declare-fun lt!403965 () (_ BitVec 32))

(assert (=> d!110381 (= lt!403966 (bvmul (bvxor lt!403965 (bvlshr lt!403965 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110381 (= lt!403965 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110381 (and (bvsge (mask!25863 thiss!1181) #b00000000000000000000000000000000) (let ((res!605184 (let ((h!18941 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76013 (bvmul (bvxor h!18941 (bvlshr h!18941 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76013 (bvlshr x!76013 #b00000000000000000000000000001101)) (mask!25863 thiss!1181)))))) (and (bvslt res!605184 (bvadd (mask!25863 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605184 #b00000000000000000000000000000000))))))

(assert (=> d!110381 (= (toIndex!0 key!785 (mask!25863 thiss!1181)) (bvand (bvxor lt!403966 (bvlshr lt!403966 #b00000000000000000000000000001101)) (mask!25863 thiss!1181)))))

(assert (=> d!110295 d!110381))

(assert (=> d!110295 d!110361))

(declare-fun d!110383 () Bool)

(assert (=> d!110383 (= (apply!404 lt!403850 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13261 (getValueByKey!452 (toList!5379 lt!403850) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25080 () Bool)

(assert (= bs!25080 d!110383))

(declare-fun m!831577 () Bool)

(assert (=> bs!25080 m!831577))

(assert (=> bs!25080 m!831577))

(declare-fun m!831579 () Bool)

(assert (=> bs!25080 m!831579))

(assert (=> b!893859 d!110383))

(assert (=> b!893754 d!110353))

(declare-fun d!110385 () Bool)

(assert (=> d!110385 (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403749 #b00000000000000000000000000000000)))

(declare-fun lt!403967 () Unit!30382)

(assert (=> d!110385 (= lt!403967 (choose!13 (_keys!10013 thiss!1181) lt!403749 #b00000000000000000000000000000000))))

(assert (=> d!110385 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!110385 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) lt!403749 #b00000000000000000000000000000000) lt!403967)))

(declare-fun bs!25081 () Bool)

(assert (= bs!25081 d!110385))

(assert (=> bs!25081 m!831269))

(declare-fun m!831581 () Bool)

(assert (=> bs!25081 m!831581))

(assert (=> b!893753 d!110385))

(declare-fun d!110387 () Bool)

(declare-fun res!605185 () Bool)

(declare-fun e!499316 () Bool)

(assert (=> d!110387 (=> res!605185 e!499316)))

(assert (=> d!110387 (= res!605185 (= (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) lt!403749))))

(assert (=> d!110387 (= (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403749 #b00000000000000000000000000000000) e!499316)))

(declare-fun b!894017 () Bool)

(declare-fun e!499317 () Bool)

(assert (=> b!894017 (= e!499316 e!499317)))

(declare-fun res!605186 () Bool)

(assert (=> b!894017 (=> (not res!605186) (not e!499317))))

(assert (=> b!894017 (= res!605186 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!894018 () Bool)

(assert (=> b!894018 (= e!499317 (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403749 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110387 (not res!605185)) b!894017))

(assert (= (and b!894017 res!605186) b!894018))

(assert (=> d!110387 m!831259))

(declare-fun m!831583 () Bool)

(assert (=> b!894018 m!831583))

(assert (=> b!893753 d!110387))

(declare-fun d!110389 () Bool)

(declare-fun lt!403976 () SeekEntryResult!8871)

(assert (=> d!110389 (and (or ((_ is Undefined!8871) lt!403976) (not ((_ is Found!8871) lt!403976)) (and (bvsge (index!37856 lt!403976) #b00000000000000000000000000000000) (bvslt (index!37856 lt!403976) (size!25622 (_keys!10013 thiss!1181))))) (or ((_ is Undefined!8871) lt!403976) ((_ is Found!8871) lt!403976) (not ((_ is MissingZero!8871) lt!403976)) (and (bvsge (index!37855 lt!403976) #b00000000000000000000000000000000) (bvslt (index!37855 lt!403976) (size!25622 (_keys!10013 thiss!1181))))) (or ((_ is Undefined!8871) lt!403976) ((_ is Found!8871) lt!403976) ((_ is MissingZero!8871) lt!403976) (not ((_ is MissingVacant!8871) lt!403976)) (and (bvsge (index!37858 lt!403976) #b00000000000000000000000000000000) (bvslt (index!37858 lt!403976) (size!25622 (_keys!10013 thiss!1181))))) (or ((_ is Undefined!8871) lt!403976) (ite ((_ is Found!8871) lt!403976) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403976)) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8871) lt!403976) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37855 lt!403976)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8871) lt!403976) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37858 lt!403976)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!499325 () SeekEntryResult!8871)

(assert (=> d!110389 (= lt!403976 e!499325)))

(declare-fun c!94287 () Bool)

(declare-fun lt!403975 () SeekEntryResult!8871)

(assert (=> d!110389 (= c!94287 (and ((_ is Intermediate!8871) lt!403975) (undefined!9683 lt!403975)))))

(assert (=> d!110389 (= lt!403975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) (mask!25863 thiss!1181)) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(assert (=> d!110389 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110389 (= (seekEntryOrOpen!0 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) lt!403976)))

(declare-fun b!894031 () Bool)

(declare-fun e!499326 () SeekEntryResult!8871)

(assert (=> b!894031 (= e!499326 (seekKeyOrZeroReturnVacant!0 (x!76002 lt!403975) (index!37857 lt!403975) (index!37857 lt!403975) (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!894032 () Bool)

(assert (=> b!894032 (= e!499326 (MissingZero!8871 (index!37857 lt!403975)))))

(declare-fun b!894033 () Bool)

(assert (=> b!894033 (= e!499325 Undefined!8871)))

(declare-fun b!894034 () Bool)

(declare-fun e!499324 () SeekEntryResult!8871)

(assert (=> b!894034 (= e!499325 e!499324)))

(declare-fun lt!403974 () (_ BitVec 64))

(assert (=> b!894034 (= lt!403974 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37857 lt!403975)))))

(declare-fun c!94289 () Bool)

(assert (=> b!894034 (= c!94289 (= lt!403974 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894035 () Bool)

(declare-fun c!94288 () Bool)

(assert (=> b!894035 (= c!94288 (= lt!403974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894035 (= e!499324 e!499326)))

(declare-fun b!894036 () Bool)

(assert (=> b!894036 (= e!499324 (Found!8871 (index!37857 lt!403975)))))

(assert (= (and d!110389 c!94287) b!894033))

(assert (= (and d!110389 (not c!94287)) b!894034))

(assert (= (and b!894034 c!94289) b!894036))

(assert (= (and b!894034 (not c!94289)) b!894035))

(assert (= (and b!894035 c!94288) b!894032))

(assert (= (and b!894035 (not c!94288)) b!894031))

(declare-fun m!831585 () Bool)

(assert (=> d!110389 m!831585))

(declare-fun m!831587 () Bool)

(assert (=> d!110389 m!831587))

(assert (=> d!110389 m!831259))

(declare-fun m!831589 () Bool)

(assert (=> d!110389 m!831589))

(declare-fun m!831591 () Bool)

(assert (=> d!110389 m!831591))

(assert (=> d!110389 m!831259))

(assert (=> d!110389 m!831587))

(assert (=> d!110389 m!831279))

(declare-fun m!831593 () Bool)

(assert (=> d!110389 m!831593))

(assert (=> b!894031 m!831259))

(declare-fun m!831595 () Bool)

(assert (=> b!894031 m!831595))

(declare-fun m!831597 () Bool)

(assert (=> b!894034 m!831597))

(assert (=> b!893753 d!110389))

(declare-fun d!110391 () Bool)

(declare-fun isEmpty!688 (Option!458) Bool)

(assert (=> d!110391 (= (isDefined!331 (getValueByKey!452 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785))) (not (isEmpty!688 (getValueByKey!452 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))))

(declare-fun bs!25082 () Bool)

(assert (= bs!25082 d!110391))

(assert (=> bs!25082 m!831371))

(declare-fun m!831599 () Bool)

(assert (=> bs!25082 m!831599))

(assert (=> b!893886 d!110391))

(declare-fun b!894039 () Bool)

(declare-fun e!499328 () Option!458)

(assert (=> b!894039 (= e!499328 (getValueByKey!452 (t!25127 (toList!5379 call!39643)) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(declare-fun b!894040 () Bool)

(assert (=> b!894040 (= e!499328 None!456)))

(declare-fun d!110393 () Bool)

(declare-fun c!94290 () Bool)

(assert (=> d!110393 (= c!94290 (and ((_ is Cons!17805) (toList!5379 call!39643)) (= (_1!6031 (h!18937 (toList!5379 call!39643))) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785))))))

(declare-fun e!499327 () Option!458)

(assert (=> d!110393 (= (getValueByKey!452 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)) e!499327)))

(declare-fun b!894038 () Bool)

(assert (=> b!894038 (= e!499327 e!499328)))

(declare-fun c!94291 () Bool)

(assert (=> b!894038 (= c!94291 (and ((_ is Cons!17805) (toList!5379 call!39643)) (not (= (_1!6031 (h!18937 (toList!5379 call!39643))) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))))

(declare-fun b!894037 () Bool)

(assert (=> b!894037 (= e!499327 (Some!457 (_2!6031 (h!18937 (toList!5379 call!39643)))))))

(assert (= (and d!110393 c!94290) b!894037))

(assert (= (and d!110393 (not c!94290)) b!894038))

(assert (= (and b!894038 c!94291) b!894039))

(assert (= (and b!894038 (not c!94291)) b!894040))

(declare-fun m!831601 () Bool)

(assert (=> b!894039 m!831601))

(assert (=> b!893886 d!110393))

(declare-fun d!110395 () Bool)

(assert (=> d!110395 (= (isDefined!331 (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785)) (not (isEmpty!688 (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785))))))

(declare-fun bs!25083 () Bool)

(assert (= bs!25083 d!110395))

(assert (=> bs!25083 m!831173))

(declare-fun m!831603 () Bool)

(assert (=> bs!25083 m!831603))

(assert (=> b!893892 d!110395))

(assert (=> b!893892 d!110279))

(declare-fun d!110397 () Bool)

(assert (=> d!110397 (isDefined!331 (getValueByKey!452 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(declare-fun lt!403979 () Unit!30382)

(declare-fun choose!1482 (List!17809 (_ BitVec 64)) Unit!30382)

(assert (=> d!110397 (= lt!403979 (choose!1482 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(declare-fun e!499331 () Bool)

(assert (=> d!110397 e!499331))

(declare-fun res!605189 () Bool)

(assert (=> d!110397 (=> (not res!605189) (not e!499331))))

(declare-fun isStrictlySorted!492 (List!17809) Bool)

(assert (=> d!110397 (= res!605189 (isStrictlySorted!492 (toList!5379 call!39643)))))

(assert (=> d!110397 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)) lt!403979)))

(declare-fun b!894043 () Bool)

(assert (=> b!894043 (= e!499331 (containsKey!423 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(assert (= (and d!110397 res!605189) b!894043))

(assert (=> d!110397 m!831371))

(assert (=> d!110397 m!831371))

(assert (=> d!110397 m!831373))

(declare-fun m!831605 () Bool)

(assert (=> d!110397 m!831605))

(declare-fun m!831607 () Bool)

(assert (=> d!110397 m!831607))

(assert (=> b!894043 m!831367))

(assert (=> b!893884 d!110397))

(assert (=> b!893884 d!110391))

(assert (=> b!893884 d!110393))

(assert (=> b!893874 d!110353))

(declare-fun d!110399 () Bool)

(declare-fun lt!403980 () (_ BitVec 32))

(assert (=> d!110399 (and (or (bvslt lt!403980 #b00000000000000000000000000000000) (bvsge lt!403980 (size!25622 (_keys!10013 thiss!1181))) (and (bvsge lt!403980 #b00000000000000000000000000000000) (bvslt lt!403980 (size!25622 (_keys!10013 thiss!1181))))) (bvsge lt!403980 #b00000000000000000000000000000000) (bvslt lt!403980 (size!25622 (_keys!10013 thiss!1181))) (= (select (arr!25175 (_keys!10013 thiss!1181)) lt!403980) key!785))))

(declare-fun e!499332 () (_ BitVec 32))

(assert (=> d!110399 (= lt!403980 e!499332)))

(declare-fun c!94292 () Bool)

(assert (=> d!110399 (= c!94292 (= (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110399 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))) (bvslt (size!25622 (_keys!10013 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110399 (= (arrayScanForKey!0 (_keys!10013 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!403980)))

(declare-fun b!894044 () Bool)

(assert (=> b!894044 (= e!499332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!894045 () Bool)

(assert (=> b!894045 (= e!499332 (arrayScanForKey!0 (_keys!10013 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110399 c!94292) b!894044))

(assert (= (and d!110399 (not c!94292)) b!894045))

(declare-fun m!831609 () Bool)

(assert (=> d!110399 m!831609))

(assert (=> d!110399 m!831557))

(declare-fun m!831611 () Bool)

(assert (=> b!894045 m!831611))

(assert (=> b!893802 d!110399))

(declare-fun b!894048 () Bool)

(declare-fun e!499334 () Option!458)

(assert (=> b!894048 (= e!499334 (getValueByKey!452 (t!25127 (t!25127 (t!25127 (toList!5379 (map!12204 thiss!1181))))) key!785))))

(declare-fun b!894049 () Bool)

(assert (=> b!894049 (= e!499334 None!456)))

(declare-fun d!110401 () Bool)

(declare-fun c!94293 () Bool)

(assert (=> d!110401 (= c!94293 (and ((_ is Cons!17805) (t!25127 (t!25127 (toList!5379 (map!12204 thiss!1181))))) (= (_1!6031 (h!18937 (t!25127 (t!25127 (toList!5379 (map!12204 thiss!1181)))))) key!785)))))

(declare-fun e!499333 () Option!458)

(assert (=> d!110401 (= (getValueByKey!452 (t!25127 (t!25127 (toList!5379 (map!12204 thiss!1181)))) key!785) e!499333)))

(declare-fun b!894047 () Bool)

(assert (=> b!894047 (= e!499333 e!499334)))

(declare-fun c!94294 () Bool)

(assert (=> b!894047 (= c!94294 (and ((_ is Cons!17805) (t!25127 (t!25127 (toList!5379 (map!12204 thiss!1181))))) (not (= (_1!6031 (h!18937 (t!25127 (t!25127 (toList!5379 (map!12204 thiss!1181)))))) key!785))))))

(declare-fun b!894046 () Bool)

(assert (=> b!894046 (= e!499333 (Some!457 (_2!6031 (h!18937 (t!25127 (t!25127 (toList!5379 (map!12204 thiss!1181))))))))))

(assert (= (and d!110401 c!94293) b!894046))

(assert (= (and d!110401 (not c!94293)) b!894047))

(assert (= (and b!894047 c!94294) b!894048))

(assert (= (and b!894047 (not c!94294)) b!894049))

(declare-fun m!831613 () Bool)

(assert (=> b!894048 m!831613))

(assert (=> b!893901 d!110401))

(assert (=> bm!39671 d!110351))

(declare-fun d!110403 () Bool)

(assert (=> d!110403 (isDefined!331 (getValueByKey!452 (toList!5379 (map!12204 thiss!1181)) key!785))))

(declare-fun lt!403981 () Unit!30382)

(assert (=> d!110403 (= lt!403981 (choose!1482 (toList!5379 (map!12204 thiss!1181)) key!785))))

(declare-fun e!499335 () Bool)

(assert (=> d!110403 e!499335))

(declare-fun res!605190 () Bool)

(assert (=> d!110403 (=> (not res!605190) (not e!499335))))

(assert (=> d!110403 (= res!605190 (isStrictlySorted!492 (toList!5379 (map!12204 thiss!1181))))))

(assert (=> d!110403 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 (map!12204 thiss!1181)) key!785) lt!403981)))

(declare-fun b!894050 () Bool)

(assert (=> b!894050 (= e!499335 (containsKey!423 (toList!5379 (map!12204 thiss!1181)) key!785))))

(assert (= (and d!110403 res!605190) b!894050))

(assert (=> d!110403 m!831173))

(assert (=> d!110403 m!831173))

(assert (=> d!110403 m!831385))

(declare-fun m!831615 () Bool)

(assert (=> d!110403 m!831615))

(declare-fun m!831617 () Bool)

(assert (=> d!110403 m!831617))

(assert (=> b!894050 m!831381))

(assert (=> b!893890 d!110403))

(assert (=> b!893890 d!110395))

(assert (=> b!893890 d!110279))

(declare-fun d!110405 () Bool)

(assert (=> d!110405 (= (apply!404 lt!403850 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13261 (getValueByKey!452 (toList!5379 lt!403850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25084 () Bool)

(assert (= bs!25084 d!110405))

(assert (=> bs!25084 m!831531))

(assert (=> bs!25084 m!831531))

(declare-fun m!831619 () Bool)

(assert (=> bs!25084 m!831619))

(assert (=> b!893871 d!110405))

(assert (=> d!110307 d!110361))

(assert (=> b!893773 d!110317))

(declare-fun d!110407 () Bool)

(declare-fun e!499338 () Bool)

(assert (=> d!110407 e!499338))

(declare-fun c!94297 () Bool)

(assert (=> d!110407 (= c!94297 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!110407 true))

(declare-fun _$15!92 () Unit!30382)

(assert (=> d!110407 (= (choose!1478 (_keys!10013 thiss!1181) (_values!5313 thiss!1181) (mask!25863 thiss!1181) (extraKeys!5022 thiss!1181) (zeroValue!5126 thiss!1181) (minValue!5126 thiss!1181) key!785 (defaultEntry!5326 thiss!1181)) _$15!92)))

(declare-fun b!894055 () Bool)

(assert (=> b!894055 (= e!499338 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!894056 () Bool)

(assert (=> b!894056 (= e!499338 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5022 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110407 c!94297) b!894055))

(assert (= (and d!110407 (not c!94297)) b!894056))

(assert (=> b!894055 m!831233))

(assert (=> d!110293 d!110407))

(assert (=> d!110293 d!110361))

(declare-fun b!894069 () Bool)

(declare-fun e!499347 () SeekEntryResult!8871)

(assert (=> b!894069 (= e!499347 (Found!8871 (index!37857 lt!403769)))))

(declare-fun lt!403986 () SeekEntryResult!8871)

(declare-fun d!110409 () Bool)

(assert (=> d!110409 (and (or ((_ is Undefined!8871) lt!403986) (not ((_ is Found!8871) lt!403986)) (and (bvsge (index!37856 lt!403986) #b00000000000000000000000000000000) (bvslt (index!37856 lt!403986) (size!25622 (_keys!10013 thiss!1181))))) (or ((_ is Undefined!8871) lt!403986) ((_ is Found!8871) lt!403986) (not ((_ is MissingVacant!8871) lt!403986)) (not (= (index!37858 lt!403986) (index!37857 lt!403769))) (and (bvsge (index!37858 lt!403986) #b00000000000000000000000000000000) (bvslt (index!37858 lt!403986) (size!25622 (_keys!10013 thiss!1181))))) (or ((_ is Undefined!8871) lt!403986) (ite ((_ is Found!8871) lt!403986) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403986)) key!785) (and ((_ is MissingVacant!8871) lt!403986) (= (index!37858 lt!403986) (index!37857 lt!403769)) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37858 lt!403986)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!499345 () SeekEntryResult!8871)

(assert (=> d!110409 (= lt!403986 e!499345)))

(declare-fun c!94305 () Bool)

(assert (=> d!110409 (= c!94305 (bvsge (x!76002 lt!403769) #b01111111111111111111111111111110))))

(declare-fun lt!403987 () (_ BitVec 64))

(assert (=> d!110409 (= lt!403987 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37857 lt!403769)))))

(assert (=> d!110409 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110409 (= (seekKeyOrZeroReturnVacant!0 (x!76002 lt!403769) (index!37857 lt!403769) (index!37857 lt!403769) key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) lt!403986)))

(declare-fun b!894070 () Bool)

(declare-fun e!499346 () SeekEntryResult!8871)

(assert (=> b!894070 (= e!499346 (MissingVacant!8871 (index!37857 lt!403769)))))

(declare-fun b!894071 () Bool)

(assert (=> b!894071 (= e!499345 Undefined!8871)))

(declare-fun b!894072 () Bool)

(assert (=> b!894072 (= e!499346 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76002 lt!403769) #b00000000000000000000000000000001) (nextIndex!0 (index!37857 lt!403769) (x!76002 lt!403769) (mask!25863 thiss!1181)) (index!37857 lt!403769) key!785 (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!894073 () Bool)

(assert (=> b!894073 (= e!499345 e!499347)))

(declare-fun c!94304 () Bool)

(assert (=> b!894073 (= c!94304 (= lt!403987 key!785))))

(declare-fun b!894074 () Bool)

(declare-fun c!94306 () Bool)

(assert (=> b!894074 (= c!94306 (= lt!403987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894074 (= e!499347 e!499346)))

(assert (= (and d!110409 c!94305) b!894071))

(assert (= (and d!110409 (not c!94305)) b!894073))

(assert (= (and b!894073 c!94304) b!894069))

(assert (= (and b!894073 (not c!94304)) b!894074))

(assert (= (and b!894074 c!94306) b!894070))

(assert (= (and b!894074 (not c!94306)) b!894072))

(declare-fun m!831621 () Bool)

(assert (=> d!110409 m!831621))

(declare-fun m!831623 () Bool)

(assert (=> d!110409 m!831623))

(assert (=> d!110409 m!831281))

(assert (=> d!110409 m!831279))

(declare-fun m!831625 () Bool)

(assert (=> b!894072 m!831625))

(assert (=> b!894072 m!831625))

(declare-fun m!831627 () Bool)

(assert (=> b!894072 m!831627))

(assert (=> b!893792 d!110409))

(declare-fun d!110411 () Bool)

(assert (=> d!110411 (= (size!25628 thiss!1181) (bvadd (_size!2175 thiss!1181) (bvsdiv (bvadd (extraKeys!5022 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!893813 d!110411))

(assert (=> d!110311 d!110317))

(declare-fun d!110413 () Bool)

(assert (=> d!110413 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110413 true))

(declare-fun _$60!400 () Unit!30382)

(assert (=> d!110413 (= (choose!13 (_keys!10013 thiss!1181) key!785 (index!37856 lt!403733)) _$60!400)))

(declare-fun bs!25085 () Bool)

(assert (= bs!25085 d!110413))

(assert (=> bs!25085 m!831233))

(assert (=> d!110311 d!110413))

(assert (=> b!893812 d!110411))

(declare-fun d!110415 () Bool)

(declare-fun e!499348 () Bool)

(assert (=> d!110415 e!499348))

(declare-fun res!605191 () Bool)

(assert (=> d!110415 (=> (not res!605191) (not e!499348))))

(declare-fun lt!403991 () ListLongMap!10727)

(assert (=> d!110415 (= res!605191 (contains!4359 lt!403991 (_1!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(declare-fun lt!403990 () List!17809)

(assert (=> d!110415 (= lt!403991 (ListLongMap!10728 lt!403990))))

(declare-fun lt!403989 () Unit!30382)

(declare-fun lt!403988 () Unit!30382)

(assert (=> d!110415 (= lt!403989 lt!403988)))

(assert (=> d!110415 (= (getValueByKey!452 lt!403990 (_1!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(assert (=> d!110415 (= lt!403988 (lemmaContainsTupThenGetReturnValue!248 lt!403990 (_1!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(assert (=> d!110415 (= lt!403990 (insertStrictlySorted!305 (toList!5379 call!39672) (_1!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))) (_2!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))))))

(assert (=> d!110415 (= (+!2615 call!39672 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))) lt!403991)))

(declare-fun b!894075 () Bool)

(declare-fun res!605192 () Bool)

(assert (=> b!894075 (=> (not res!605192) (not e!499348))))

(assert (=> b!894075 (= res!605192 (= (getValueByKey!452 (toList!5379 lt!403991) (_1!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181)))) (Some!457 (_2!6031 (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))))

(declare-fun b!894076 () Bool)

(assert (=> b!894076 (= e!499348 (contains!4361 (toList!5379 lt!403991) (tuple2!12041 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5126 thiss!1181))))))

(assert (= (and d!110415 res!605191) b!894075))

(assert (= (and b!894075 res!605192) b!894076))

(declare-fun m!831629 () Bool)

(assert (=> d!110415 m!831629))

(declare-fun m!831631 () Bool)

(assert (=> d!110415 m!831631))

(declare-fun m!831633 () Bool)

(assert (=> d!110415 m!831633))

(declare-fun m!831635 () Bool)

(assert (=> d!110415 m!831635))

(declare-fun m!831637 () Bool)

(assert (=> b!894075 m!831637))

(declare-fun m!831639 () Bool)

(assert (=> b!894076 m!831639))

(assert (=> b!893866 d!110415))

(declare-fun d!110417 () Bool)

(declare-fun res!605197 () Bool)

(declare-fun e!499353 () Bool)

(assert (=> d!110417 (=> res!605197 e!499353)))

(assert (=> d!110417 (= res!605197 (and ((_ is Cons!17805) (toList!5379 (map!12204 thiss!1181))) (= (_1!6031 (h!18937 (toList!5379 (map!12204 thiss!1181)))) key!785)))))

(assert (=> d!110417 (= (containsKey!423 (toList!5379 (map!12204 thiss!1181)) key!785) e!499353)))

(declare-fun b!894081 () Bool)

(declare-fun e!499354 () Bool)

(assert (=> b!894081 (= e!499353 e!499354)))

(declare-fun res!605198 () Bool)

(assert (=> b!894081 (=> (not res!605198) (not e!499354))))

(assert (=> b!894081 (= res!605198 (and (or (not ((_ is Cons!17805) (toList!5379 (map!12204 thiss!1181)))) (bvsle (_1!6031 (h!18937 (toList!5379 (map!12204 thiss!1181)))) key!785)) ((_ is Cons!17805) (toList!5379 (map!12204 thiss!1181))) (bvslt (_1!6031 (h!18937 (toList!5379 (map!12204 thiss!1181)))) key!785)))))

(declare-fun b!894082 () Bool)

(assert (=> b!894082 (= e!499354 (containsKey!423 (t!25127 (toList!5379 (map!12204 thiss!1181))) key!785))))

(assert (= (and d!110417 (not res!605197)) b!894081))

(assert (= (and b!894081 res!605198) b!894082))

(declare-fun m!831641 () Bool)

(assert (=> b!894082 m!831641))

(assert (=> d!110315 d!110417))

(declare-fun b!894083 () Bool)

(declare-fun e!499357 () Bool)

(declare-fun e!499356 () Bool)

(assert (=> b!894083 (= e!499357 e!499356)))

(declare-fun lt!403992 () (_ BitVec 64))

(assert (=> b!894083 (= lt!403992 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd lt!403728 #b00000000000000000000000000000001)))))

(declare-fun lt!403994 () Unit!30382)

(assert (=> b!894083 (= lt!403994 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) lt!403992 (bvadd lt!403728 #b00000000000000000000000000000001)))))

(assert (=> b!894083 (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403992 #b00000000000000000000000000000000)))

(declare-fun lt!403993 () Unit!30382)

(assert (=> b!894083 (= lt!403993 lt!403994)))

(declare-fun res!605200 () Bool)

(assert (=> b!894083 (= res!605200 (= (seekEntryOrOpen!0 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd lt!403728 #b00000000000000000000000000000001)) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) (Found!8871 (bvadd lt!403728 #b00000000000000000000000000000001))))))

(assert (=> b!894083 (=> (not res!605200) (not e!499356))))

(declare-fun b!894084 () Bool)

(declare-fun e!499355 () Bool)

(assert (=> b!894084 (= e!499355 e!499357)))

(declare-fun c!94307 () Bool)

(assert (=> b!894084 (= c!94307 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd lt!403728 #b00000000000000000000000000000001))))))

(declare-fun bm!39678 () Bool)

(declare-fun call!39681 () Bool)

(assert (=> bm!39678 (= call!39681 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403728 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!894085 () Bool)

(assert (=> b!894085 (= e!499356 call!39681)))

(declare-fun d!110419 () Bool)

(declare-fun res!605199 () Bool)

(assert (=> d!110419 (=> res!605199 e!499355)))

(assert (=> d!110419 (= res!605199 (bvsge (bvadd lt!403728 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110419 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403728 #b00000000000000000000000000000001) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) e!499355)))

(declare-fun b!894086 () Bool)

(assert (=> b!894086 (= e!499357 call!39681)))

(assert (= (and d!110419 (not res!605199)) b!894084))

(assert (= (and b!894084 c!94307) b!894083))

(assert (= (and b!894084 (not c!94307)) b!894086))

(assert (= (and b!894083 res!605200) b!894085))

(assert (= (or b!894085 b!894086) bm!39678))

(declare-fun m!831643 () Bool)

(assert (=> b!894083 m!831643))

(declare-fun m!831645 () Bool)

(assert (=> b!894083 m!831645))

(declare-fun m!831647 () Bool)

(assert (=> b!894083 m!831647))

(assert (=> b!894083 m!831643))

(declare-fun m!831649 () Bool)

(assert (=> b!894083 m!831649))

(assert (=> b!894084 m!831643))

(assert (=> b!894084 m!831643))

(declare-fun m!831651 () Bool)

(assert (=> b!894084 m!831651))

(declare-fun m!831653 () Bool)

(assert (=> bm!39678 m!831653))

(assert (=> bm!39652 d!110419))

(declare-fun b!894087 () Bool)

(declare-fun e!499359 () (_ BitVec 32))

(declare-fun e!499358 () (_ BitVec 32))

(assert (=> b!894087 (= e!499359 e!499358)))

(declare-fun c!94309 () Bool)

(assert (=> b!894087 (= c!94309 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894088 () Bool)

(declare-fun call!39682 () (_ BitVec 32))

(assert (=> b!894088 (= e!499358 (bvadd #b00000000000000000000000000000001 call!39682))))

(declare-fun d!110421 () Bool)

(declare-fun lt!403995 () (_ BitVec 32))

(assert (=> d!110421 (and (bvsge lt!403995 #b00000000000000000000000000000000) (bvsle lt!403995 (bvsub (size!25622 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!110421 (= lt!403995 e!499359)))

(declare-fun c!94308 () Bool)

(assert (=> d!110421 (= c!94308 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110421 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!25622 (_keys!10013 thiss!1181)) (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110421 (= (arrayCountValidKeys!0 (_keys!10013 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))) lt!403995)))

(declare-fun b!894089 () Bool)

(assert (=> b!894089 (= e!499359 #b00000000000000000000000000000000)))

(declare-fun b!894090 () Bool)

(assert (=> b!894090 (= e!499358 call!39682)))

(declare-fun bm!39679 () Bool)

(assert (=> bm!39679 (= call!39682 (arrayCountValidKeys!0 (_keys!10013 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(assert (= (and d!110421 c!94308) b!894089))

(assert (= (and d!110421 (not c!94308)) b!894087))

(assert (= (and b!894087 c!94309) b!894088))

(assert (= (and b!894087 (not c!94309)) b!894090))

(assert (= (or b!894088 b!894090) bm!39679))

(assert (=> b!894087 m!831557))

(assert (=> b!894087 m!831557))

(assert (=> b!894087 m!831565))

(declare-fun m!831655 () Bool)

(assert (=> bm!39679 m!831655))

(assert (=> bm!39651 d!110421))

(declare-fun d!110423 () Bool)

(declare-fun e!499361 () Bool)

(assert (=> d!110423 e!499361))

(declare-fun res!605201 () Bool)

(assert (=> d!110423 (=> res!605201 e!499361)))

(declare-fun lt!403996 () Bool)

(assert (=> d!110423 (= res!605201 (not lt!403996))))

(declare-fun lt!403999 () Bool)

(assert (=> d!110423 (= lt!403996 lt!403999)))

(declare-fun lt!403998 () Unit!30382)

(declare-fun e!499360 () Unit!30382)

(assert (=> d!110423 (= lt!403998 e!499360)))

(declare-fun c!94310 () Bool)

(assert (=> d!110423 (= c!94310 lt!403999)))

(assert (=> d!110423 (= lt!403999 (containsKey!423 (toList!5379 lt!403850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110423 (= (contains!4359 lt!403850 #b0000000000000000000000000000000000000000000000000000000000000000) lt!403996)))

(declare-fun b!894091 () Bool)

(declare-fun lt!403997 () Unit!30382)

(assert (=> b!894091 (= e!499360 lt!403997)))

(assert (=> b!894091 (= lt!403997 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5379 lt!403850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894091 (isDefined!331 (getValueByKey!452 (toList!5379 lt!403850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894092 () Bool)

(declare-fun Unit!30393 () Unit!30382)

(assert (=> b!894092 (= e!499360 Unit!30393)))

(declare-fun b!894093 () Bool)

(assert (=> b!894093 (= e!499361 (isDefined!331 (getValueByKey!452 (toList!5379 lt!403850) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110423 c!94310) b!894091))

(assert (= (and d!110423 (not c!94310)) b!894092))

(assert (= (and d!110423 (not res!605201)) b!894093))

(declare-fun m!831657 () Bool)

(assert (=> d!110423 m!831657))

(declare-fun m!831659 () Bool)

(assert (=> b!894091 m!831659))

(assert (=> b!894091 m!831577))

(assert (=> b!894091 m!831577))

(declare-fun m!831661 () Bool)

(assert (=> b!894091 m!831661))

(assert (=> b!894093 m!831577))

(assert (=> b!894093 m!831577))

(assert (=> b!894093 m!831661))

(assert (=> bm!39668 d!110423))

(declare-fun b!894094 () Bool)

(declare-fun e!499365 () Bool)

(declare-fun call!39683 () Bool)

(assert (=> b!894094 (= e!499365 call!39683)))

(declare-fun b!894095 () Bool)

(declare-fun e!499364 () Bool)

(declare-fun e!499363 () Bool)

(assert (=> b!894095 (= e!499364 e!499363)))

(declare-fun res!605202 () Bool)

(assert (=> b!894095 (=> (not res!605202) (not e!499363))))

(declare-fun e!499362 () Bool)

(assert (=> b!894095 (= res!605202 (not e!499362))))

(declare-fun res!605204 () Bool)

(assert (=> b!894095 (=> (not res!605204) (not e!499362))))

(assert (=> b!894095 (= res!605204 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!110425 () Bool)

(declare-fun res!605203 () Bool)

(assert (=> d!110425 (=> res!605203 e!499364)))

(assert (=> d!110425 (= res!605203 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(assert (=> d!110425 (= (arrayNoDuplicates!0 (_keys!10013 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94202 (Cons!17808 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) Nil!17809) Nil!17809)) e!499364)))

(declare-fun b!894096 () Bool)

(assert (=> b!894096 (= e!499362 (contains!4360 (ite c!94202 (Cons!17808 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) Nil!17809) Nil!17809) (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894097 () Bool)

(assert (=> b!894097 (= e!499363 e!499365)))

(declare-fun c!94311 () Bool)

(assert (=> b!894097 (= c!94311 (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894098 () Bool)

(assert (=> b!894098 (= e!499365 call!39683)))

(declare-fun bm!39680 () Bool)

(assert (=> bm!39680 (= call!39683 (arrayNoDuplicates!0 (_keys!10013 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!94311 (Cons!17808 (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!94202 (Cons!17808 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) Nil!17809) Nil!17809)) (ite c!94202 (Cons!17808 (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) Nil!17809) Nil!17809))))))

(assert (= (and d!110425 (not res!605203)) b!894095))

(assert (= (and b!894095 res!605204) b!894096))

(assert (= (and b!894095 res!605202) b!894097))

(assert (= (and b!894097 c!94311) b!894094))

(assert (= (and b!894097 (not c!94311)) b!894098))

(assert (= (or b!894094 b!894098) bm!39680))

(assert (=> b!894095 m!831557))

(assert (=> b!894095 m!831557))

(assert (=> b!894095 m!831565))

(assert (=> b!894096 m!831557))

(assert (=> b!894096 m!831557))

(declare-fun m!831663 () Bool)

(assert (=> b!894096 m!831663))

(assert (=> b!894097 m!831557))

(assert (=> b!894097 m!831557))

(assert (=> b!894097 m!831565))

(assert (=> bm!39680 m!831557))

(declare-fun m!831665 () Bool)

(assert (=> bm!39680 m!831665))

(assert (=> bm!39645 d!110425))

(declare-fun d!110427 () Bool)

(assert (=> d!110427 (= (validKeyInArray!0 (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728)) (and (not (= (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893794 d!110427))

(declare-fun d!110429 () Bool)

(declare-fun res!605205 () Bool)

(declare-fun e!499366 () Bool)

(assert (=> d!110429 (=> res!605205 e!499366)))

(assert (=> d!110429 (= res!605205 (= (select (arr!25175 (_keys!10013 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110429 (= (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!499366)))

(declare-fun b!894099 () Bool)

(declare-fun e!499367 () Bool)

(assert (=> b!894099 (= e!499366 e!499367)))

(declare-fun res!605206 () Bool)

(assert (=> b!894099 (=> (not res!605206) (not e!499367))))

(assert (=> b!894099 (= res!605206 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!894100 () Bool)

(assert (=> b!894100 (= e!499367 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110429 (not res!605205)) b!894099))

(assert (= (and b!894099 res!605206) b!894100))

(assert (=> d!110429 m!831557))

(declare-fun m!831667 () Bool)

(assert (=> b!894100 m!831667))

(assert (=> b!893898 d!110429))

(declare-fun d!110431 () Bool)

(assert (=> d!110431 (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403773 #b00000000000000000000000000000000)))

(declare-fun lt!404000 () Unit!30382)

(assert (=> d!110431 (= lt!404000 (choose!13 (_keys!10013 thiss!1181) lt!403773 lt!403728))))

(assert (=> d!110431 (bvsge lt!403728 #b00000000000000000000000000000000)))

(assert (=> d!110431 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) lt!403773 lt!403728) lt!404000)))

(declare-fun bs!25086 () Bool)

(assert (= bs!25086 d!110431))

(assert (=> bs!25086 m!831297))

(declare-fun m!831669 () Bool)

(assert (=> bs!25086 m!831669))

(assert (=> b!893793 d!110431))

(declare-fun d!110433 () Bool)

(declare-fun res!605207 () Bool)

(declare-fun e!499368 () Bool)

(assert (=> d!110433 (=> res!605207 e!499368)))

(assert (=> d!110433 (= res!605207 (= (select (arr!25175 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) lt!403773))))

(assert (=> d!110433 (= (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403773 #b00000000000000000000000000000000) e!499368)))

(declare-fun b!894101 () Bool)

(declare-fun e!499369 () Bool)

(assert (=> b!894101 (= e!499368 e!499369)))

(declare-fun res!605208 () Bool)

(assert (=> b!894101 (=> (not res!605208) (not e!499369))))

(assert (=> b!894101 (= res!605208 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25622 (_keys!10013 thiss!1181))))))

(declare-fun b!894102 () Bool)

(assert (=> b!894102 (= e!499369 (arrayContainsKey!0 (_keys!10013 thiss!1181) lt!403773 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110433 (not res!605207)) b!894101))

(assert (= (and b!894101 res!605208) b!894102))

(assert (=> d!110433 m!831259))

(declare-fun m!831671 () Bool)

(assert (=> b!894102 m!831671))

(assert (=> b!893793 d!110433))

(declare-fun d!110435 () Bool)

(declare-fun lt!404003 () SeekEntryResult!8871)

(assert (=> d!110435 (and (or ((_ is Undefined!8871) lt!404003) (not ((_ is Found!8871) lt!404003)) (and (bvsge (index!37856 lt!404003) #b00000000000000000000000000000000) (bvslt (index!37856 lt!404003) (size!25622 (_keys!10013 thiss!1181))))) (or ((_ is Undefined!8871) lt!404003) ((_ is Found!8871) lt!404003) (not ((_ is MissingZero!8871) lt!404003)) (and (bvsge (index!37855 lt!404003) #b00000000000000000000000000000000) (bvslt (index!37855 lt!404003) (size!25622 (_keys!10013 thiss!1181))))) (or ((_ is Undefined!8871) lt!404003) ((_ is Found!8871) lt!404003) ((_ is MissingZero!8871) lt!404003) (not ((_ is MissingVacant!8871) lt!404003)) (and (bvsge (index!37858 lt!404003) #b00000000000000000000000000000000) (bvslt (index!37858 lt!404003) (size!25622 (_keys!10013 thiss!1181))))) (or ((_ is Undefined!8871) lt!404003) (ite ((_ is Found!8871) lt!404003) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!404003)) (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728)) (ite ((_ is MissingZero!8871) lt!404003) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37855 lt!404003)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8871) lt!404003) (= (select (arr!25175 (_keys!10013 thiss!1181)) (index!37858 lt!404003)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!499371 () SeekEntryResult!8871)

(assert (=> d!110435 (= lt!404003 e!499371)))

(declare-fun c!94312 () Bool)

(declare-fun lt!404002 () SeekEntryResult!8871)

(assert (=> d!110435 (= c!94312 (and ((_ is Intermediate!8871) lt!404002) (undefined!9683 lt!404002)))))

(assert (=> d!110435 (= lt!404002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728) (mask!25863 thiss!1181)) (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(assert (=> d!110435 (validMask!0 (mask!25863 thiss!1181))))

(assert (=> d!110435 (= (seekEntryOrOpen!0 (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)) lt!404003)))

(declare-fun e!499372 () SeekEntryResult!8871)

(declare-fun b!894103 () Bool)

(assert (=> b!894103 (= e!499372 (seekKeyOrZeroReturnVacant!0 (x!76002 lt!404002) (index!37857 lt!404002) (index!37857 lt!404002) (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728) (_keys!10013 thiss!1181) (mask!25863 thiss!1181)))))

(declare-fun b!894104 () Bool)

(assert (=> b!894104 (= e!499372 (MissingZero!8871 (index!37857 lt!404002)))))

(declare-fun b!894105 () Bool)

(assert (=> b!894105 (= e!499371 Undefined!8871)))

(declare-fun b!894106 () Bool)

(declare-fun e!499370 () SeekEntryResult!8871)

(assert (=> b!894106 (= e!499371 e!499370)))

(declare-fun lt!404001 () (_ BitVec 64))

(assert (=> b!894106 (= lt!404001 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37857 lt!404002)))))

(declare-fun c!94314 () Bool)

(assert (=> b!894106 (= c!94314 (= lt!404001 (select (arr!25175 (_keys!10013 thiss!1181)) lt!403728)))))

(declare-fun b!894107 () Bool)

(declare-fun c!94313 () Bool)

(assert (=> b!894107 (= c!94313 (= lt!404001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894107 (= e!499370 e!499372)))

(declare-fun b!894108 () Bool)

(assert (=> b!894108 (= e!499370 (Found!8871 (index!37857 lt!404002)))))

(assert (= (and d!110435 c!94312) b!894105))

(assert (= (and d!110435 (not c!94312)) b!894106))

(assert (= (and b!894106 c!94314) b!894108))

(assert (= (and b!894106 (not c!94314)) b!894107))

(assert (= (and b!894107 c!94313) b!894104))

(assert (= (and b!894107 (not c!94313)) b!894103))

(declare-fun m!831673 () Bool)

(assert (=> d!110435 m!831673))

(declare-fun m!831675 () Bool)

(assert (=> d!110435 m!831675))

(assert (=> d!110435 m!831293))

(declare-fun m!831677 () Bool)

(assert (=> d!110435 m!831677))

(declare-fun m!831679 () Bool)

(assert (=> d!110435 m!831679))

(assert (=> d!110435 m!831293))

(assert (=> d!110435 m!831675))

(assert (=> d!110435 m!831279))

(declare-fun m!831681 () Bool)

(assert (=> d!110435 m!831681))

(assert (=> b!894103 m!831293))

(declare-fun m!831683 () Bool)

(assert (=> b!894103 m!831683))

(declare-fun m!831685 () Bool)

(assert (=> b!894106 m!831685))

(assert (=> b!893793 d!110435))

(declare-fun d!110437 () Bool)

(declare-fun res!605209 () Bool)

(declare-fun e!499373 () Bool)

(assert (=> d!110437 (=> res!605209 e!499373)))

(assert (=> d!110437 (= res!605209 (and ((_ is Cons!17805) (toList!5379 call!39643)) (= (_1!6031 (h!18937 (toList!5379 call!39643))) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785))))))

(assert (=> d!110437 (= (containsKey!423 (toList!5379 call!39643) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)) e!499373)))

(declare-fun b!894109 () Bool)

(declare-fun e!499374 () Bool)

(assert (=> b!894109 (= e!499373 e!499374)))

(declare-fun res!605210 () Bool)

(assert (=> b!894109 (=> (not res!605210) (not e!499374))))

(assert (=> b!894109 (= res!605210 (and (or (not ((_ is Cons!17805) (toList!5379 call!39643))) (bvsle (_1!6031 (h!18937 (toList!5379 call!39643))) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785))) ((_ is Cons!17805) (toList!5379 call!39643)) (bvslt (_1!6031 (h!18937 (toList!5379 call!39643))) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785))))))

(declare-fun b!894110 () Bool)

(assert (=> b!894110 (= e!499374 (containsKey!423 (t!25127 (toList!5379 call!39643)) (ite c!94195 (select (arr!25175 (_keys!10013 thiss!1181)) (index!37856 lt!403733)) key!785)))))

(assert (= (and d!110437 (not res!605209)) b!894109))

(assert (= (and b!894109 res!605210) b!894110))

(declare-fun m!831687 () Bool)

(assert (=> b!894110 m!831687))

(assert (=> d!110309 d!110437))

(declare-fun condMapEmpty!28857 () Bool)

(declare-fun mapDefault!28857 () ValueCell!8612)

(assert (=> mapNonEmpty!28856 (= condMapEmpty!28857 (= mapRest!28856 ((as const (Array (_ BitVec 32) ValueCell!8612)) mapDefault!28857)))))

(declare-fun e!499375 () Bool)

(declare-fun mapRes!28857 () Bool)

(assert (=> mapNonEmpty!28856 (= tp!55574 (and e!499375 mapRes!28857))))

(declare-fun mapIsEmpty!28857 () Bool)

(assert (=> mapIsEmpty!28857 mapRes!28857))

(declare-fun b!894112 () Bool)

(assert (=> b!894112 (= e!499375 tp_is_empty!18187)))

(declare-fun b!894111 () Bool)

(declare-fun e!499376 () Bool)

(assert (=> b!894111 (= e!499376 tp_is_empty!18187)))

(declare-fun mapNonEmpty!28857 () Bool)

(declare-fun tp!55575 () Bool)

(assert (=> mapNonEmpty!28857 (= mapRes!28857 (and tp!55575 e!499376))))

(declare-fun mapKey!28857 () (_ BitVec 32))

(declare-fun mapValue!28857 () ValueCell!8612)

(declare-fun mapRest!28857 () (Array (_ BitVec 32) ValueCell!8612))

(assert (=> mapNonEmpty!28857 (= mapRest!28856 (store mapRest!28857 mapKey!28857 mapValue!28857))))

(assert (= (and mapNonEmpty!28856 condMapEmpty!28857) mapIsEmpty!28857))

(assert (= (and mapNonEmpty!28856 (not condMapEmpty!28857)) mapNonEmpty!28857))

(assert (= (and mapNonEmpty!28857 ((_ is ValueCellFull!8612) mapValue!28857)) b!894111))

(assert (= (and mapNonEmpty!28856 ((_ is ValueCellFull!8612) mapDefault!28857)) b!894112))

(declare-fun m!831689 () Bool)

(assert (=> mapNonEmpty!28857 m!831689))

(declare-fun b_lambda!12929 () Bool)

(assert (= b_lambda!12925 (or (and b!893610 b_free!15859) b_lambda!12929)))

(declare-fun b_lambda!12931 () Bool)

(assert (= b_lambda!12927 (or (and b!893610 b_free!15859) b_lambda!12931)))

(check-sat (not b!893922) (not d!110347) (not b!893979) (not b!893977) (not bm!39677) (not b!894043) (not b!894100) (not d!110415) (not b!894091) (not b!893955) (not d!110413) (not b!894045) (not b!893985) (not b!894103) (not d!110325) (not b!894093) (not b!893914) (not b!893959) (not b!894075) (not b!893973) (not d!110345) (not b!893960) (not b!894110) (not b!893971) (not d!110385) (not b!893915) (not b!894014) (not d!110403) (not b!893963) (not b!894050) (not b!893970) (not d!110371) (not b!894096) (not d!110379) (not d!110341) (not d!110321) (not d!110363) (not d!110389) (not b!894031) (not b!893920) (not b!893976) (not bm!39680) (not b!893921) (not b!893918) (not d!110359) (not d!110339) (not b!894076) (not d!110327) (not d!110331) b_and!26123 (not b!893954) (not d!110335) (not b!893952) (not b!894072) (not b!894018) (not b!893986) (not d!110323) (not d!110367) (not bm!39679) (not b_lambda!12929) (not b!893984) (not d!110357) (not b!894087) (not b!893962) (not d!110383) (not bm!39676) (not b!894082) (not b_lambda!12931) (not b!894039) (not d!110337) (not mapNonEmpty!28857) (not b!894084) (not d!110431) (not b!893964) (not d!110373) (not b_lambda!12919) (not d!110329) (not d!110351) (not d!110435) (not b_next!15859) (not b!893923) (not d!110343) (not d!110423) (not d!110355) (not b!893919) (not b!893974) (not bm!39678) (not d!110391) (not b!894083) (not d!110333) (not b!894048) tp_is_empty!18187 (not d!110349) (not d!110369) (not d!110409) (not b!893913) (not b!894097) (not b!894102) (not d!110397) (not b_lambda!12923) (not b!893956) (not b!893961) (not b!893917) (not b!893987) (not b!894055) (not b!894095) (not d!110395) (not d!110365) (not d!110405))
(check-sat b_and!26123 (not b_next!15859))
