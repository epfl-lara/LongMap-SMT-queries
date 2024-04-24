; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76106 () Bool)

(assert start!76106)

(declare-fun b!894236 () Bool)

(declare-fun b_free!15853 () Bool)

(declare-fun b_next!15853 () Bool)

(assert (=> b!894236 (= b_free!15853 (not b_next!15853))))

(declare-fun tp!55535 () Bool)

(declare-fun b_and!26125 () Bool)

(assert (=> b!894236 (= tp!55535 b_and!26125)))

(declare-fun b!894231 () Bool)

(declare-fun e!499463 () Bool)

(declare-datatypes ((array!52385 0))(
  ( (array!52386 (arr!25192 (Array (_ BitVec 32) (_ BitVec 64))) (size!25637 (_ BitVec 32))) )
))
(declare-datatypes ((V!29207 0))(
  ( (V!29208 (val!9141 Int)) )
))
(declare-datatypes ((ValueCell!8609 0))(
  ( (ValueCellFull!8609 (v!11619 V!29207)) (EmptyCell!8609) )
))
(declare-datatypes ((array!52387 0))(
  ( (array!52388 (arr!25193 (Array (_ BitVec 32) ValueCell!8609)) (size!25638 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4234 0))(
  ( (LongMapFixedSize!4235 (defaultEntry!5317 Int) (mask!25891 (_ BitVec 32)) (extraKeys!5013 (_ BitVec 32)) (zeroValue!5117 V!29207) (minValue!5117 V!29207) (_size!2172 (_ BitVec 32)) (_keys!10032 array!52385) (_values!5304 array!52387) (_vacant!2172 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4234)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!452 0))(
  ( (Some!451 (v!11620 V!29207)) (None!450) )
))
(declare-fun get!13275 (Option!452) V!29207)

(declare-datatypes ((tuple2!11932 0))(
  ( (tuple2!11933 (_1!5977 (_ BitVec 64)) (_2!5977 V!29207)) )
))
(declare-datatypes ((List!17749 0))(
  ( (Nil!17746) (Cons!17745 (h!18882 tuple2!11932) (t!25060 List!17749)) )
))
(declare-fun getValueByKey!446 (List!17749 (_ BitVec 64)) Option!452)

(declare-datatypes ((ListLongMap!10631 0))(
  ( (ListLongMap!10632 (toList!5331 List!17749)) )
))
(declare-fun map!12201 (LongMapFixedSize!4234) ListLongMap!10631)

(assert (=> b!894231 (= e!499463 (not (= (zeroValue!5117 thiss!1181) (get!13275 (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785)))))))

(declare-fun res!605320 () Bool)

(declare-fun e!499461 () Bool)

(assert (=> start!76106 (=> (not res!605320) (not e!499461))))

(declare-fun valid!1649 (LongMapFixedSize!4234) Bool)

(assert (=> start!76106 (= res!605320 (valid!1649 thiss!1181))))

(assert (=> start!76106 e!499461))

(declare-fun e!499465 () Bool)

(assert (=> start!76106 e!499465))

(assert (=> start!76106 true))

(declare-fun mapNonEmpty!28832 () Bool)

(declare-fun mapRes!28832 () Bool)

(declare-fun tp!55534 () Bool)

(declare-fun e!499466 () Bool)

(assert (=> mapNonEmpty!28832 (= mapRes!28832 (and tp!55534 e!499466))))

(declare-fun mapValue!28832 () ValueCell!8609)

(declare-fun mapRest!28832 () (Array (_ BitVec 32) ValueCell!8609))

(declare-fun mapKey!28832 () (_ BitVec 32))

(assert (=> mapNonEmpty!28832 (= (arr!25193 (_values!5304 thiss!1181)) (store mapRest!28832 mapKey!28832 mapValue!28832))))

(declare-fun b!894232 () Bool)

(declare-fun res!605319 () Bool)

(assert (=> b!894232 (=> (not res!605319) (not e!499461))))

(assert (=> b!894232 (= res!605319 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!894233 () Bool)

(declare-fun e!499462 () Bool)

(declare-fun e!499467 () Bool)

(assert (=> b!894233 (= e!499462 (and e!499467 mapRes!28832))))

(declare-fun condMapEmpty!28832 () Bool)

(declare-fun mapDefault!28832 () ValueCell!8609)

(assert (=> b!894233 (= condMapEmpty!28832 (= (arr!25193 (_values!5304 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8609)) mapDefault!28832)))))

(declare-fun b!894234 () Bool)

(declare-fun tp_is_empty!18181 () Bool)

(assert (=> b!894234 (= e!499466 tp_is_empty!18181)))

(declare-fun b!894235 () Bool)

(declare-fun dynLambda!1313 (Int (_ BitVec 64)) V!29207)

(assert (=> b!894235 (= e!499463 (not (= (zeroValue!5117 thiss!1181) (dynLambda!1313 (defaultEntry!5317 thiss!1181) key!785))))))

(declare-fun array_inv!19834 (array!52385) Bool)

(declare-fun array_inv!19835 (array!52387) Bool)

(assert (=> b!894236 (= e!499465 (and tp!55535 tp_is_empty!18181 (array_inv!19834 (_keys!10032 thiss!1181)) (array_inv!19835 (_values!5304 thiss!1181)) e!499462))))

(declare-fun b!894237 () Bool)

(assert (=> b!894237 (= e!499467 tp_is_empty!18181)))

(declare-fun b!894238 () Bool)

(assert (=> b!894238 (= e!499461 e!499463)))

(declare-fun c!94374 () Bool)

(declare-fun contains!4351 (LongMapFixedSize!4234 (_ BitVec 64)) Bool)

(assert (=> b!894238 (= c!94374 (contains!4351 thiss!1181 key!785))))

(declare-fun mapIsEmpty!28832 () Bool)

(assert (=> mapIsEmpty!28832 mapRes!28832))

(assert (= (and start!76106 res!605320) b!894232))

(assert (= (and b!894232 res!605319) b!894238))

(assert (= (and b!894238 c!94374) b!894231))

(assert (= (and b!894238 (not c!94374)) b!894235))

(assert (= (and b!894233 condMapEmpty!28832) mapIsEmpty!28832))

(assert (= (and b!894233 (not condMapEmpty!28832)) mapNonEmpty!28832))

(get-info :version)

(assert (= (and mapNonEmpty!28832 ((_ is ValueCellFull!8609) mapValue!28832)) b!894234))

(assert (= (and b!894233 ((_ is ValueCellFull!8609) mapDefault!28832)) b!894237))

(assert (= b!894236 b!894233))

(assert (= start!76106 b!894236))

(declare-fun b_lambda!12925 () Bool)

(assert (=> (not b_lambda!12925) (not b!894235)))

(declare-fun t!25059 () Bool)

(declare-fun tb!5161 () Bool)

(assert (=> (and b!894236 (= (defaultEntry!5317 thiss!1181) (defaultEntry!5317 thiss!1181)) t!25059) tb!5161))

(declare-fun result!10045 () Bool)

(assert (=> tb!5161 (= result!10045 tp_is_empty!18181)))

(assert (=> b!894235 t!25059))

(declare-fun b_and!26127 () Bool)

(assert (= b_and!26125 (and (=> t!25059 result!10045) b_and!26127)))

(declare-fun m!832695 () Bool)

(assert (=> b!894231 m!832695))

(declare-fun m!832697 () Bool)

(assert (=> b!894231 m!832697))

(assert (=> b!894231 m!832697))

(declare-fun m!832699 () Bool)

(assert (=> b!894231 m!832699))

(declare-fun m!832701 () Bool)

(assert (=> b!894235 m!832701))

(declare-fun m!832703 () Bool)

(assert (=> b!894238 m!832703))

(declare-fun m!832705 () Bool)

(assert (=> mapNonEmpty!28832 m!832705))

(declare-fun m!832707 () Bool)

(assert (=> start!76106 m!832707))

(declare-fun m!832709 () Bool)

(assert (=> b!894236 m!832709))

(declare-fun m!832711 () Bool)

(assert (=> b!894236 m!832711))

(check-sat (not b!894236) (not start!76106) (not b!894238) (not mapNonEmpty!28832) (not b!894231) (not b_lambda!12925) b_and!26127 tp_is_empty!18181 (not b_next!15853))
(check-sat b_and!26127 (not b_next!15853))
(get-model)

(declare-fun b_lambda!12931 () Bool)

(assert (= b_lambda!12925 (or (and b!894236 b_free!15853) b_lambda!12931)))

(check-sat (not b!894236) (not start!76106) (not b!894238) (not mapNonEmpty!28832) (not b!894231) (not b_lambda!12931) b_and!26127 tp_is_empty!18181 (not b_next!15853))
(check-sat b_and!26127 (not b_next!15853))
(get-model)

(declare-fun d!110625 () Bool)

(declare-fun res!605339 () Bool)

(declare-fun e!499512 () Bool)

(assert (=> d!110625 (=> (not res!605339) (not e!499512))))

(declare-fun simpleValid!297 (LongMapFixedSize!4234) Bool)

(assert (=> d!110625 (= res!605339 (simpleValid!297 thiss!1181))))

(assert (=> d!110625 (= (valid!1649 thiss!1181) e!499512)))

(declare-fun b!894299 () Bool)

(declare-fun res!605340 () Bool)

(assert (=> b!894299 (=> (not res!605340) (not e!499512))))

(declare-fun arrayCountValidKeys!0 (array!52385 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894299 (= res!605340 (= (arrayCountValidKeys!0 (_keys!10032 thiss!1181) #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))) (_size!2172 thiss!1181)))))

(declare-fun b!894300 () Bool)

(declare-fun res!605341 () Bool)

(assert (=> b!894300 (=> (not res!605341) (not e!499512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52385 (_ BitVec 32)) Bool)

(assert (=> b!894300 (= res!605341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun b!894301 () Bool)

(declare-datatypes ((List!17750 0))(
  ( (Nil!17747) (Cons!17746 (h!18883 (_ BitVec 64)) (t!25065 List!17750)) )
))
(declare-fun arrayNoDuplicates!0 (array!52385 (_ BitVec 32) List!17750) Bool)

(assert (=> b!894301 (= e!499512 (arrayNoDuplicates!0 (_keys!10032 thiss!1181) #b00000000000000000000000000000000 Nil!17747))))

(assert (= (and d!110625 res!605339) b!894299))

(assert (= (and b!894299 res!605340) b!894300))

(assert (= (and b!894300 res!605341) b!894301))

(declare-fun m!832749 () Bool)

(assert (=> d!110625 m!832749))

(declare-fun m!832751 () Bool)

(assert (=> b!894299 m!832751))

(declare-fun m!832753 () Bool)

(assert (=> b!894300 m!832753))

(declare-fun m!832755 () Bool)

(assert (=> b!894301 m!832755))

(assert (=> start!76106 d!110625))

(declare-fun b!894322 () Bool)

(declare-fun e!499527 () Bool)

(assert (=> b!894322 (= e!499527 true)))

(declare-datatypes ((SeekEntryResult!8819 0))(
  ( (MissingZero!8819 (index!37647 (_ BitVec 32))) (Found!8819 (index!37648 (_ BitVec 32))) (Intermediate!8819 (undefined!9631 Bool) (index!37649 (_ BitVec 32)) (x!75933 (_ BitVec 32))) (Undefined!8819) (MissingVacant!8819 (index!37650 (_ BitVec 32))) )
))
(declare-fun lt!404023 () SeekEntryResult!8819)

(declare-datatypes ((Unit!30412 0))(
  ( (Unit!30413) )
))
(declare-fun lt!404026 () Unit!30412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52385 (_ BitVec 64) (_ BitVec 32)) Unit!30412)

(assert (=> b!894322 (= lt!404026 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10032 thiss!1181) key!785 (index!37648 lt!404023)))))

(declare-fun call!39667 () Bool)

(assert (=> b!894322 call!39667))

(declare-fun lt!404019 () Unit!30412)

(assert (=> b!894322 (= lt!404019 lt!404026)))

(declare-fun lt!404033 () Unit!30412)

(declare-fun lemmaValidKeyInArrayIsInListMap!237 (array!52385 array!52387 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 32) Int) Unit!30412)

(assert (=> b!894322 (= lt!404033 (lemmaValidKeyInArrayIsInListMap!237 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (index!37648 lt!404023) (defaultEntry!5317 thiss!1181)))))

(declare-fun call!39668 () Bool)

(assert (=> b!894322 call!39668))

(declare-fun lt!404028 () Unit!30412)

(assert (=> b!894322 (= lt!404028 lt!404033)))

(declare-fun bm!39664 () Bool)

(declare-fun arrayContainsKey!0 (array!52385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39664 (= call!39667 (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!894323 () Bool)

(declare-fun e!499523 () Bool)

(declare-fun e!499525 () Bool)

(assert (=> b!894323 (= e!499523 e!499525)))

(declare-fun c!94394 () Bool)

(assert (=> b!894323 (= c!94394 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39665 () Bool)

(declare-fun call!39669 () ListLongMap!10631)

(declare-fun getCurrentListMap!2607 (array!52385 array!52387 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 32) Int) ListLongMap!10631)

(assert (=> bm!39665 (= call!39669 (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun b!894324 () Bool)

(assert (=> b!894324 (= e!499527 false)))

(declare-fun c!94392 () Bool)

(assert (=> b!894324 (= c!94392 call!39668)))

(declare-fun lt!404030 () Unit!30412)

(declare-fun e!499526 () Unit!30412)

(assert (=> b!894324 (= lt!404030 e!499526)))

(declare-fun b!894325 () Bool)

(declare-fun Unit!30414 () Unit!30412)

(assert (=> b!894325 (= e!499526 Unit!30414)))

(declare-fun b!894326 () Bool)

(assert (=> b!894326 false))

(declare-fun lt!404031 () Unit!30412)

(declare-fun lt!404021 () Unit!30412)

(assert (=> b!894326 (= lt!404031 lt!404021)))

(declare-fun lt!404024 () SeekEntryResult!8819)

(declare-fun lt!404027 () (_ BitVec 32))

(assert (=> b!894326 (and ((_ is Found!8819) lt!404024) (= (index!37648 lt!404024) lt!404027))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52385 (_ BitVec 32)) SeekEntryResult!8819)

(assert (=> b!894326 (= lt!404024 (seekEntry!0 key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52385 (_ BitVec 32)) Unit!30412)

(assert (=> b!894326 (= lt!404021 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!404027 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun lt!404020 () Unit!30412)

(declare-fun lt!404032 () Unit!30412)

(assert (=> b!894326 (= lt!404020 lt!404032)))

(assert (=> b!894326 (arrayForallSeekEntryOrOpenFound!0 lt!404027 (_keys!10032 thiss!1181) (mask!25891 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30412)

(assert (=> b!894326 (= lt!404032 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10032 thiss!1181) (mask!25891 thiss!1181) #b00000000000000000000000000000000 lt!404027))))

(declare-fun arrayScanForKey!0 (array!52385 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894326 (= lt!404027 (arrayScanForKey!0 (_keys!10032 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!404029 () Unit!30412)

(declare-fun lt!404025 () Unit!30412)

(assert (=> b!894326 (= lt!404029 lt!404025)))

(declare-fun e!499524 () Bool)

(assert (=> b!894326 e!499524))

(declare-fun c!94391 () Bool)

(assert (=> b!894326 (= c!94391 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!165 (array!52385 array!52387 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 64) Int) Unit!30412)

(assert (=> b!894326 (= lt!404025 (lemmaKeyInListMapIsInArray!165 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) key!785 (defaultEntry!5317 thiss!1181)))))

(declare-fun Unit!30415 () Unit!30412)

(assert (=> b!894326 (= e!499526 Unit!30415)))

(declare-fun c!94393 () Bool)

(declare-fun bm!39666 () Bool)

(declare-fun contains!4352 (ListLongMap!10631 (_ BitVec 64)) Bool)

(assert (=> bm!39666 (= call!39668 (contains!4352 call!39669 (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(declare-fun b!894327 () Bool)

(assert (=> b!894327 (= e!499524 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!110627 () Bool)

(declare-fun lt!404022 () Bool)

(assert (=> d!110627 (= lt!404022 (contains!4352 (map!12201 thiss!1181) key!785))))

(assert (=> d!110627 (= lt!404022 e!499523)))

(declare-fun c!94395 () Bool)

(assert (=> d!110627 (= c!94395 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110627 (valid!1649 thiss!1181)))

(assert (=> d!110627 (= (contains!4351 thiss!1181 key!785) lt!404022)))

(declare-fun b!894328 () Bool)

(assert (=> b!894328 (= e!499525 (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!894329 () Bool)

(assert (=> b!894329 (= e!499523 (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!894330 () Bool)

(assert (=> b!894330 (= c!94393 ((_ is Found!8819) lt!404023))))

(assert (=> b!894330 (= lt!404023 (seekEntry!0 key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(assert (=> b!894330 (= e!499525 e!499527)))

(declare-fun b!894331 () Bool)

(assert (=> b!894331 (= e!499524 call!39667)))

(assert (= (and d!110627 c!94395) b!894329))

(assert (= (and d!110627 (not c!94395)) b!894323))

(assert (= (and b!894323 c!94394) b!894328))

(assert (= (and b!894323 (not c!94394)) b!894330))

(assert (= (and b!894330 c!94393) b!894322))

(assert (= (and b!894330 (not c!94393)) b!894324))

(assert (= (and b!894324 c!94392) b!894326))

(assert (= (and b!894324 (not c!94392)) b!894325))

(assert (= (and b!894326 c!94391) b!894331))

(assert (= (and b!894326 (not c!94391)) b!894327))

(assert (= (or b!894322 b!894331) bm!39664))

(assert (= (or b!894322 b!894324) bm!39665))

(assert (= (or b!894322 b!894324) bm!39666))

(declare-fun m!832757 () Bool)

(assert (=> bm!39665 m!832757))

(declare-fun m!832759 () Bool)

(assert (=> b!894326 m!832759))

(declare-fun m!832761 () Bool)

(assert (=> b!894326 m!832761))

(declare-fun m!832763 () Bool)

(assert (=> b!894326 m!832763))

(declare-fun m!832765 () Bool)

(assert (=> b!894326 m!832765))

(declare-fun m!832767 () Bool)

(assert (=> b!894326 m!832767))

(declare-fun m!832769 () Bool)

(assert (=> b!894326 m!832769))

(assert (=> b!894330 m!832767))

(assert (=> d!110627 m!832695))

(assert (=> d!110627 m!832695))

(declare-fun m!832771 () Bool)

(assert (=> d!110627 m!832771))

(assert (=> d!110627 m!832707))

(declare-fun m!832773 () Bool)

(assert (=> bm!39664 m!832773))

(declare-fun m!832775 () Bool)

(assert (=> bm!39666 m!832775))

(declare-fun m!832777 () Bool)

(assert (=> bm!39666 m!832777))

(declare-fun m!832779 () Bool)

(assert (=> b!894322 m!832779))

(declare-fun m!832781 () Bool)

(assert (=> b!894322 m!832781))

(assert (=> b!894238 d!110627))

(declare-fun d!110629 () Bool)

(assert (=> d!110629 (= (get!13275 (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785)) (v!11620 (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785)))))

(assert (=> b!894231 d!110629))

(declare-fun b!894342 () Bool)

(declare-fun e!499533 () Option!452)

(assert (=> b!894342 (= e!499533 (getValueByKey!446 (t!25060 (toList!5331 (map!12201 thiss!1181))) key!785))))

(declare-fun b!894343 () Bool)

(assert (=> b!894343 (= e!499533 None!450)))

(declare-fun d!110631 () Bool)

(declare-fun c!94400 () Bool)

(assert (=> d!110631 (= c!94400 (and ((_ is Cons!17745) (toList!5331 (map!12201 thiss!1181))) (= (_1!5977 (h!18882 (toList!5331 (map!12201 thiss!1181)))) key!785)))))

(declare-fun e!499532 () Option!452)

(assert (=> d!110631 (= (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785) e!499532)))

(declare-fun b!894341 () Bool)

(assert (=> b!894341 (= e!499532 e!499533)))

(declare-fun c!94401 () Bool)

(assert (=> b!894341 (= c!94401 (and ((_ is Cons!17745) (toList!5331 (map!12201 thiss!1181))) (not (= (_1!5977 (h!18882 (toList!5331 (map!12201 thiss!1181)))) key!785))))))

(declare-fun b!894340 () Bool)

(assert (=> b!894340 (= e!499532 (Some!451 (_2!5977 (h!18882 (toList!5331 (map!12201 thiss!1181))))))))

(assert (= (and d!110631 c!94400) b!894340))

(assert (= (and d!110631 (not c!94400)) b!894341))

(assert (= (and b!894341 c!94401) b!894342))

(assert (= (and b!894341 (not c!94401)) b!894343))

(declare-fun m!832783 () Bool)

(assert (=> b!894342 m!832783))

(assert (=> b!894231 d!110631))

(declare-fun d!110633 () Bool)

(assert (=> d!110633 (= (map!12201 thiss!1181) (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun bs!25086 () Bool)

(assert (= bs!25086 d!110633))

(assert (=> bs!25086 m!832757))

(assert (=> b!894231 d!110633))

(declare-fun d!110635 () Bool)

(assert (=> d!110635 (= (array_inv!19834 (_keys!10032 thiss!1181)) (bvsge (size!25637 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894236 d!110635))

(declare-fun d!110637 () Bool)

(assert (=> d!110637 (= (array_inv!19835 (_values!5304 thiss!1181)) (bvsge (size!25638 (_values!5304 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894236 d!110637))

(declare-fun mapNonEmpty!28841 () Bool)

(declare-fun mapRes!28841 () Bool)

(declare-fun tp!55550 () Bool)

(declare-fun e!499538 () Bool)

(assert (=> mapNonEmpty!28841 (= mapRes!28841 (and tp!55550 e!499538))))

(declare-fun mapValue!28841 () ValueCell!8609)

(declare-fun mapRest!28841 () (Array (_ BitVec 32) ValueCell!8609))

(declare-fun mapKey!28841 () (_ BitVec 32))

(assert (=> mapNonEmpty!28841 (= mapRest!28832 (store mapRest!28841 mapKey!28841 mapValue!28841))))

(declare-fun condMapEmpty!28841 () Bool)

(declare-fun mapDefault!28841 () ValueCell!8609)

(assert (=> mapNonEmpty!28832 (= condMapEmpty!28841 (= mapRest!28832 ((as const (Array (_ BitVec 32) ValueCell!8609)) mapDefault!28841)))))

(declare-fun e!499539 () Bool)

(assert (=> mapNonEmpty!28832 (= tp!55534 (and e!499539 mapRes!28841))))

(declare-fun b!894351 () Bool)

(assert (=> b!894351 (= e!499539 tp_is_empty!18181)))

(declare-fun b!894350 () Bool)

(assert (=> b!894350 (= e!499538 tp_is_empty!18181)))

(declare-fun mapIsEmpty!28841 () Bool)

(assert (=> mapIsEmpty!28841 mapRes!28841))

(assert (= (and mapNonEmpty!28832 condMapEmpty!28841) mapIsEmpty!28841))

(assert (= (and mapNonEmpty!28832 (not condMapEmpty!28841)) mapNonEmpty!28841))

(assert (= (and mapNonEmpty!28841 ((_ is ValueCellFull!8609) mapValue!28841)) b!894350))

(assert (= (and mapNonEmpty!28832 ((_ is ValueCellFull!8609) mapDefault!28841)) b!894351))

(declare-fun m!832785 () Bool)

(assert (=> mapNonEmpty!28841 m!832785))

(check-sat (not bm!39665) (not bm!39664) (not b!894322) (not bm!39666) (not b!894342) (not b_lambda!12931) (not b!894301) (not b!894300) b_and!26127 (not b!894330) (not d!110625) (not b!894299) (not mapNonEmpty!28841) (not b_next!15853) (not d!110633) (not d!110627) (not b!894326) tp_is_empty!18181)
(check-sat b_and!26127 (not b_next!15853))
(get-model)

(declare-fun d!110639 () Bool)

(assert (=> d!110639 (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404036 () Unit!30412)

(declare-fun choose!13 (array!52385 (_ BitVec 64) (_ BitVec 32)) Unit!30412)

(assert (=> d!110639 (= lt!404036 (choose!13 (_keys!10032 thiss!1181) key!785 (index!37648 lt!404023)))))

(assert (=> d!110639 (bvsge (index!37648 lt!404023) #b00000000000000000000000000000000)))

(assert (=> d!110639 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10032 thiss!1181) key!785 (index!37648 lt!404023)) lt!404036)))

(declare-fun bs!25087 () Bool)

(assert (= bs!25087 d!110639))

(assert (=> bs!25087 m!832773))

(declare-fun m!832787 () Bool)

(assert (=> bs!25087 m!832787))

(assert (=> b!894322 d!110639))

(declare-fun d!110641 () Bool)

(declare-fun e!499542 () Bool)

(assert (=> d!110641 e!499542))

(declare-fun res!605344 () Bool)

(assert (=> d!110641 (=> (not res!605344) (not e!499542))))

(assert (=> d!110641 (= res!605344 (and (bvsge (index!37648 lt!404023) #b00000000000000000000000000000000) (bvslt (index!37648 lt!404023) (size!25637 (_keys!10032 thiss!1181)))))))

(declare-fun lt!404039 () Unit!30412)

(declare-fun choose!1470 (array!52385 array!52387 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 32) Int) Unit!30412)

(assert (=> d!110641 (= lt!404039 (choose!1470 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (index!37648 lt!404023) (defaultEntry!5317 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110641 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110641 (= (lemmaValidKeyInArrayIsInListMap!237 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (index!37648 lt!404023) (defaultEntry!5317 thiss!1181)) lt!404039)))

(declare-fun b!894354 () Bool)

(assert (=> b!894354 (= e!499542 (contains!4352 (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023))))))

(assert (= (and d!110641 res!605344) b!894354))

(declare-fun m!832789 () Bool)

(assert (=> d!110641 m!832789))

(declare-fun m!832791 () Bool)

(assert (=> d!110641 m!832791))

(assert (=> b!894354 m!832757))

(assert (=> b!894354 m!832775))

(assert (=> b!894354 m!832757))

(assert (=> b!894354 m!832775))

(declare-fun m!832793 () Bool)

(assert (=> b!894354 m!832793))

(assert (=> b!894322 d!110641))

(declare-fun b!894367 () Bool)

(declare-fun e!499551 () SeekEntryResult!8819)

(declare-fun lt!404050 () SeekEntryResult!8819)

(assert (=> b!894367 (= e!499551 (MissingZero!8819 (index!37649 lt!404050)))))

(declare-fun b!894369 () Bool)

(declare-fun e!499549 () SeekEntryResult!8819)

(assert (=> b!894369 (= e!499549 (Found!8819 (index!37649 lt!404050)))))

(declare-fun b!894370 () Bool)

(declare-fun lt!404051 () SeekEntryResult!8819)

(assert (=> b!894370 (= e!499551 (ite ((_ is MissingVacant!8819) lt!404051) (MissingZero!8819 (index!37650 lt!404051)) lt!404051))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52385 (_ BitVec 32)) SeekEntryResult!8819)

(assert (=> b!894370 (= lt!404051 (seekKeyOrZeroReturnVacant!0 (x!75933 lt!404050) (index!37649 lt!404050) (index!37649 lt!404050) key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun b!894371 () Bool)

(declare-fun e!499550 () SeekEntryResult!8819)

(assert (=> b!894371 (= e!499550 e!499549)))

(declare-fun lt!404048 () (_ BitVec 64))

(assert (=> b!894371 (= lt!404048 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37649 lt!404050)))))

(declare-fun c!94410 () Bool)

(assert (=> b!894371 (= c!94410 (= lt!404048 key!785))))

(declare-fun b!894372 () Bool)

(assert (=> b!894372 (= e!499550 Undefined!8819)))

(declare-fun d!110643 () Bool)

(declare-fun lt!404049 () SeekEntryResult!8819)

(assert (=> d!110643 (and (or ((_ is MissingVacant!8819) lt!404049) (not ((_ is Found!8819) lt!404049)) (and (bvsge (index!37648 lt!404049) #b00000000000000000000000000000000) (bvslt (index!37648 lt!404049) (size!25637 (_keys!10032 thiss!1181))))) (not ((_ is MissingVacant!8819) lt!404049)) (or (not ((_ is Found!8819) lt!404049)) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404049)) key!785)))))

(assert (=> d!110643 (= lt!404049 e!499550)))

(declare-fun c!94409 () Bool)

(assert (=> d!110643 (= c!94409 (and ((_ is Intermediate!8819) lt!404050) (undefined!9631 lt!404050)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52385 (_ BitVec 32)) SeekEntryResult!8819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110643 (= lt!404050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25891 thiss!1181)) key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(assert (=> d!110643 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110643 (= (seekEntry!0 key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) lt!404049)))

(declare-fun b!894368 () Bool)

(declare-fun c!94408 () Bool)

(assert (=> b!894368 (= c!94408 (= lt!404048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894368 (= e!499549 e!499551)))

(assert (= (and d!110643 c!94409) b!894372))

(assert (= (and d!110643 (not c!94409)) b!894371))

(assert (= (and b!894371 c!94410) b!894369))

(assert (= (and b!894371 (not c!94410)) b!894368))

(assert (= (and b!894368 c!94408) b!894367))

(assert (= (and b!894368 (not c!94408)) b!894370))

(declare-fun m!832795 () Bool)

(assert (=> b!894370 m!832795))

(declare-fun m!832797 () Bool)

(assert (=> b!894371 m!832797))

(declare-fun m!832799 () Bool)

(assert (=> d!110643 m!832799))

(declare-fun m!832801 () Bool)

(assert (=> d!110643 m!832801))

(assert (=> d!110643 m!832801))

(declare-fun m!832803 () Bool)

(assert (=> d!110643 m!832803))

(assert (=> d!110643 m!832791))

(assert (=> b!894330 d!110643))

(declare-fun b!894383 () Bool)

(declare-fun res!605356 () Bool)

(declare-fun e!499554 () Bool)

(assert (=> b!894383 (=> (not res!605356) (not e!499554))))

(declare-fun size!25643 (LongMapFixedSize!4234) (_ BitVec 32))

(assert (=> b!894383 (= res!605356 (= (size!25643 thiss!1181) (bvadd (_size!2172 thiss!1181) (bvsdiv (bvadd (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!894382 () Bool)

(declare-fun res!605354 () Bool)

(assert (=> b!894382 (=> (not res!605354) (not e!499554))))

(assert (=> b!894382 (= res!605354 (bvsge (size!25643 thiss!1181) (_size!2172 thiss!1181)))))

(declare-fun b!894384 () Bool)

(assert (=> b!894384 (= e!499554 (and (bvsge (extraKeys!5013 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5013 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2172 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!894381 () Bool)

(declare-fun res!605355 () Bool)

(assert (=> b!894381 (=> (not res!605355) (not e!499554))))

(assert (=> b!894381 (= res!605355 (and (= (size!25638 (_values!5304 thiss!1181)) (bvadd (mask!25891 thiss!1181) #b00000000000000000000000000000001)) (= (size!25637 (_keys!10032 thiss!1181)) (size!25638 (_values!5304 thiss!1181))) (bvsge (_size!2172 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2172 thiss!1181) (bvadd (mask!25891 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!110645 () Bool)

(declare-fun res!605353 () Bool)

(assert (=> d!110645 (=> (not res!605353) (not e!499554))))

(assert (=> d!110645 (= res!605353 (validMask!0 (mask!25891 thiss!1181)))))

(assert (=> d!110645 (= (simpleValid!297 thiss!1181) e!499554)))

(assert (= (and d!110645 res!605353) b!894381))

(assert (= (and b!894381 res!605355) b!894382))

(assert (= (and b!894382 res!605354) b!894383))

(assert (= (and b!894383 res!605356) b!894384))

(declare-fun m!832805 () Bool)

(assert (=> b!894383 m!832805))

(assert (=> b!894382 m!832805))

(assert (=> d!110645 m!832791))

(assert (=> d!110625 d!110645))

(declare-fun d!110647 () Bool)

(declare-fun res!605361 () Bool)

(declare-fun e!499559 () Bool)

(assert (=> d!110647 (=> res!605361 e!499559)))

(assert (=> d!110647 (= res!605361 (= (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110647 (= (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 #b00000000000000000000000000000000) e!499559)))

(declare-fun b!894389 () Bool)

(declare-fun e!499560 () Bool)

(assert (=> b!894389 (= e!499559 e!499560)))

(declare-fun res!605362 () Bool)

(assert (=> b!894389 (=> (not res!605362) (not e!499560))))

(assert (=> b!894389 (= res!605362 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894390 () Bool)

(assert (=> b!894390 (= e!499560 (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110647 (not res!605361)) b!894389))

(assert (= (and b!894389 res!605362) b!894390))

(declare-fun m!832807 () Bool)

(assert (=> d!110647 m!832807))

(declare-fun m!832809 () Bool)

(assert (=> b!894390 m!832809))

(assert (=> bm!39664 d!110647))

(declare-fun b!894399 () Bool)

(declare-fun e!499565 () (_ BitVec 32))

(assert (=> b!894399 (= e!499565 #b00000000000000000000000000000000)))

(declare-fun b!894400 () Bool)

(declare-fun e!499566 () (_ BitVec 32))

(declare-fun call!39672 () (_ BitVec 32))

(assert (=> b!894400 (= e!499566 call!39672)))

(declare-fun d!110649 () Bool)

(declare-fun lt!404054 () (_ BitVec 32))

(assert (=> d!110649 (and (bvsge lt!404054 #b00000000000000000000000000000000) (bvsle lt!404054 (bvsub (size!25637 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110649 (= lt!404054 e!499565)))

(declare-fun c!94415 () Bool)

(assert (=> d!110649 (= c!94415 (bvsge #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110649 (and (bvsle #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25637 (_keys!10032 thiss!1181)) (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110649 (= (arrayCountValidKeys!0 (_keys!10032 thiss!1181) #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))) lt!404054)))

(declare-fun bm!39669 () Bool)

(assert (=> bm!39669 (= call!39672 (arrayCountValidKeys!0 (_keys!10032 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894401 () Bool)

(assert (=> b!894401 (= e!499566 (bvadd #b00000000000000000000000000000001 call!39672))))

(declare-fun b!894402 () Bool)

(assert (=> b!894402 (= e!499565 e!499566)))

(declare-fun c!94416 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!894402 (= c!94416 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110649 c!94415) b!894399))

(assert (= (and d!110649 (not c!94415)) b!894402))

(assert (= (and b!894402 c!94416) b!894401))

(assert (= (and b!894402 (not c!94416)) b!894400))

(assert (= (or b!894401 b!894400) bm!39669))

(declare-fun m!832811 () Bool)

(assert (=> bm!39669 m!832811))

(assert (=> b!894402 m!832807))

(assert (=> b!894402 m!832807))

(declare-fun m!832813 () Bool)

(assert (=> b!894402 m!832813))

(assert (=> b!894299 d!110649))

(declare-fun b!894405 () Bool)

(declare-fun e!499568 () Option!452)

(assert (=> b!894405 (= e!499568 (getValueByKey!446 (t!25060 (t!25060 (toList!5331 (map!12201 thiss!1181)))) key!785))))

(declare-fun b!894406 () Bool)

(assert (=> b!894406 (= e!499568 None!450)))

(declare-fun d!110651 () Bool)

(declare-fun c!94417 () Bool)

(assert (=> d!110651 (= c!94417 (and ((_ is Cons!17745) (t!25060 (toList!5331 (map!12201 thiss!1181)))) (= (_1!5977 (h!18882 (t!25060 (toList!5331 (map!12201 thiss!1181))))) key!785)))))

(declare-fun e!499567 () Option!452)

(assert (=> d!110651 (= (getValueByKey!446 (t!25060 (toList!5331 (map!12201 thiss!1181))) key!785) e!499567)))

(declare-fun b!894404 () Bool)

(assert (=> b!894404 (= e!499567 e!499568)))

(declare-fun c!94418 () Bool)

(assert (=> b!894404 (= c!94418 (and ((_ is Cons!17745) (t!25060 (toList!5331 (map!12201 thiss!1181)))) (not (= (_1!5977 (h!18882 (t!25060 (toList!5331 (map!12201 thiss!1181))))) key!785))))))

(declare-fun b!894403 () Bool)

(assert (=> b!894403 (= e!499567 (Some!451 (_2!5977 (h!18882 (t!25060 (toList!5331 (map!12201 thiss!1181)))))))))

(assert (= (and d!110651 c!94417) b!894403))

(assert (= (and d!110651 (not c!94417)) b!894404))

(assert (= (and b!894404 c!94418) b!894405))

(assert (= (and b!894404 (not c!94418)) b!894406))

(declare-fun m!832815 () Bool)

(assert (=> b!894405 m!832815))

(assert (=> b!894342 d!110651))

(declare-fun d!110653 () Bool)

(declare-fun e!499573 () Bool)

(assert (=> d!110653 e!499573))

(declare-fun res!605365 () Bool)

(assert (=> d!110653 (=> res!605365 e!499573)))

(declare-fun lt!404063 () Bool)

(assert (=> d!110653 (= res!605365 (not lt!404063))))

(declare-fun lt!404064 () Bool)

(assert (=> d!110653 (= lt!404063 lt!404064)))

(declare-fun lt!404066 () Unit!30412)

(declare-fun e!499574 () Unit!30412)

(assert (=> d!110653 (= lt!404066 e!499574)))

(declare-fun c!94421 () Bool)

(assert (=> d!110653 (= c!94421 lt!404064)))

(declare-fun containsKey!424 (List!17749 (_ BitVec 64)) Bool)

(assert (=> d!110653 (= lt!404064 (containsKey!424 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(assert (=> d!110653 (= (contains!4352 call!39669 (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)) lt!404063)))

(declare-fun b!894413 () Bool)

(declare-fun lt!404065 () Unit!30412)

(assert (=> b!894413 (= e!499574 lt!404065)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!318 (List!17749 (_ BitVec 64)) Unit!30412)

(assert (=> b!894413 (= lt!404065 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(declare-fun isDefined!326 (Option!452) Bool)

(assert (=> b!894413 (isDefined!326 (getValueByKey!446 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(declare-fun b!894414 () Bool)

(declare-fun Unit!30416 () Unit!30412)

(assert (=> b!894414 (= e!499574 Unit!30416)))

(declare-fun b!894415 () Bool)

(assert (=> b!894415 (= e!499573 (isDefined!326 (getValueByKey!446 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785))))))

(assert (= (and d!110653 c!94421) b!894413))

(assert (= (and d!110653 (not c!94421)) b!894414))

(assert (= (and d!110653 (not res!605365)) b!894415))

(declare-fun m!832817 () Bool)

(assert (=> d!110653 m!832817))

(declare-fun m!832819 () Bool)

(assert (=> b!894413 m!832819))

(declare-fun m!832821 () Bool)

(assert (=> b!894413 m!832821))

(assert (=> b!894413 m!832821))

(declare-fun m!832823 () Bool)

(assert (=> b!894413 m!832823))

(assert (=> b!894415 m!832821))

(assert (=> b!894415 m!832821))

(assert (=> b!894415 m!832823))

(assert (=> bm!39666 d!110653))

(assert (=> b!894326 d!110643))

(declare-fun d!110655 () Bool)

(declare-fun lt!404069 () (_ BitVec 32))

(assert (=> d!110655 (and (or (bvslt lt!404069 #b00000000000000000000000000000000) (bvsge lt!404069 (size!25637 (_keys!10032 thiss!1181))) (and (bvsge lt!404069 #b00000000000000000000000000000000) (bvslt lt!404069 (size!25637 (_keys!10032 thiss!1181))))) (bvsge lt!404069 #b00000000000000000000000000000000) (bvslt lt!404069 (size!25637 (_keys!10032 thiss!1181))) (= (select (arr!25192 (_keys!10032 thiss!1181)) lt!404069) key!785))))

(declare-fun e!499577 () (_ BitVec 32))

(assert (=> d!110655 (= lt!404069 e!499577)))

(declare-fun c!94424 () Bool)

(assert (=> d!110655 (= c!94424 (= (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))) (bvslt (size!25637 (_keys!10032 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110655 (= (arrayScanForKey!0 (_keys!10032 thiss!1181) key!785 #b00000000000000000000000000000000) lt!404069)))

(declare-fun b!894420 () Bool)

(assert (=> b!894420 (= e!499577 #b00000000000000000000000000000000)))

(declare-fun b!894421 () Bool)

(assert (=> b!894421 (= e!499577 (arrayScanForKey!0 (_keys!10032 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110655 c!94424) b!894420))

(assert (= (and d!110655 (not c!94424)) b!894421))

(declare-fun m!832825 () Bool)

(assert (=> d!110655 m!832825))

(assert (=> d!110655 m!832807))

(declare-fun m!832827 () Bool)

(assert (=> b!894421 m!832827))

(assert (=> b!894326 d!110655))

(declare-fun d!110657 () Bool)

(assert (=> d!110657 (arrayForallSeekEntryOrOpenFound!0 lt!404027 (_keys!10032 thiss!1181) (mask!25891 thiss!1181))))

(declare-fun lt!404072 () Unit!30412)

(declare-fun choose!38 (array!52385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30412)

(assert (=> d!110657 (= lt!404072 (choose!38 (_keys!10032 thiss!1181) (mask!25891 thiss!1181) #b00000000000000000000000000000000 lt!404027))))

(assert (=> d!110657 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110657 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10032 thiss!1181) (mask!25891 thiss!1181) #b00000000000000000000000000000000 lt!404027) lt!404072)))

(declare-fun bs!25088 () Bool)

(assert (= bs!25088 d!110657))

(assert (=> bs!25088 m!832763))

(declare-fun m!832829 () Bool)

(assert (=> bs!25088 m!832829))

(assert (=> bs!25088 m!832791))

(assert (=> b!894326 d!110657))

(declare-fun bm!39672 () Bool)

(declare-fun call!39675 () Bool)

(assert (=> bm!39672 (= call!39675 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!404027 #b00000000000000000000000000000001) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun d!110659 () Bool)

(declare-fun res!605370 () Bool)

(declare-fun e!499584 () Bool)

(assert (=> d!110659 (=> res!605370 e!499584)))

(assert (=> d!110659 (= res!605370 (bvsge lt!404027 (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110659 (= (arrayForallSeekEntryOrOpenFound!0 lt!404027 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) e!499584)))

(declare-fun b!894430 () Bool)

(declare-fun e!499586 () Bool)

(assert (=> b!894430 (= e!499586 call!39675)))

(declare-fun b!894431 () Bool)

(declare-fun e!499585 () Bool)

(assert (=> b!894431 (= e!499586 e!499585)))

(declare-fun lt!404081 () (_ BitVec 64))

(assert (=> b!894431 (= lt!404081 (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027))))

(declare-fun lt!404079 () Unit!30412)

(assert (=> b!894431 (= lt!404079 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10032 thiss!1181) lt!404081 lt!404027))))

(assert (=> b!894431 (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404081 #b00000000000000000000000000000000)))

(declare-fun lt!404080 () Unit!30412)

(assert (=> b!894431 (= lt!404080 lt!404079)))

(declare-fun res!605371 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52385 (_ BitVec 32)) SeekEntryResult!8819)

(assert (=> b!894431 (= res!605371 (= (seekEntryOrOpen!0 (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) (Found!8819 lt!404027)))))

(assert (=> b!894431 (=> (not res!605371) (not e!499585))))

(declare-fun b!894432 () Bool)

(assert (=> b!894432 (= e!499584 e!499586)))

(declare-fun c!94427 () Bool)

(assert (=> b!894432 (= c!94427 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027)))))

(declare-fun b!894433 () Bool)

(assert (=> b!894433 (= e!499585 call!39675)))

(assert (= (and d!110659 (not res!605370)) b!894432))

(assert (= (and b!894432 c!94427) b!894431))

(assert (= (and b!894432 (not c!94427)) b!894430))

(assert (= (and b!894431 res!605371) b!894433))

(assert (= (or b!894433 b!894430) bm!39672))

(declare-fun m!832831 () Bool)

(assert (=> bm!39672 m!832831))

(declare-fun m!832833 () Bool)

(assert (=> b!894431 m!832833))

(declare-fun m!832835 () Bool)

(assert (=> b!894431 m!832835))

(declare-fun m!832837 () Bool)

(assert (=> b!894431 m!832837))

(assert (=> b!894431 m!832833))

(declare-fun m!832839 () Bool)

(assert (=> b!894431 m!832839))

(assert (=> b!894432 m!832833))

(assert (=> b!894432 m!832833))

(declare-fun m!832841 () Bool)

(assert (=> b!894432 m!832841))

(assert (=> b!894326 d!110659))

(declare-fun d!110661 () Bool)

(declare-fun e!499589 () Bool)

(assert (=> d!110661 e!499589))

(declare-fun c!94430 () Bool)

(assert (=> d!110661 (= c!94430 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!404084 () Unit!30412)

(declare-fun choose!1471 (array!52385 array!52387 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 64) Int) Unit!30412)

(assert (=> d!110661 (= lt!404084 (choose!1471 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) key!785 (defaultEntry!5317 thiss!1181)))))

(assert (=> d!110661 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110661 (= (lemmaKeyInListMapIsInArray!165 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) key!785 (defaultEntry!5317 thiss!1181)) lt!404084)))

(declare-fun b!894438 () Bool)

(assert (=> b!894438 (= e!499589 (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!894439 () Bool)

(assert (=> b!894439 (= e!499589 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110661 c!94430) b!894438))

(assert (= (and d!110661 (not c!94430)) b!894439))

(declare-fun m!832843 () Bool)

(assert (=> d!110661 m!832843))

(assert (=> d!110661 m!832791))

(assert (=> b!894438 m!832773))

(assert (=> b!894326 d!110661))

(declare-fun d!110663 () Bool)

(declare-fun lt!404090 () SeekEntryResult!8819)

(assert (=> d!110663 (and ((_ is Found!8819) lt!404090) (= (index!37648 lt!404090) lt!404027))))

(assert (=> d!110663 (= lt!404090 (seekEntry!0 key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun lt!404089 () Unit!30412)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!52385 (_ BitVec 32)) Unit!30412)

(assert (=> d!110663 (= lt!404089 (choose!0 key!785 lt!404027 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(assert (=> d!110663 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110663 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!404027 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) lt!404089)))

(declare-fun bs!25089 () Bool)

(assert (= bs!25089 d!110663))

(assert (=> bs!25089 m!832767))

(declare-fun m!832845 () Bool)

(assert (=> bs!25089 m!832845))

(assert (=> bs!25089 m!832791))

(assert (=> b!894326 d!110663))

(declare-fun b!894482 () Bool)

(declare-fun e!499628 () Bool)

(declare-fun lt!404149 () ListLongMap!10631)

(declare-fun apply!403 (ListLongMap!10631 (_ BitVec 64)) V!29207)

(assert (=> b!894482 (= e!499628 (= (apply!403 lt!404149 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5117 thiss!1181)))))

(declare-fun bm!39687 () Bool)

(declare-fun call!39695 () Bool)

(assert (=> bm!39687 (= call!39695 (contains!4352 lt!404149 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894483 () Bool)

(declare-fun e!499625 () ListLongMap!10631)

(declare-fun call!39696 () ListLongMap!10631)

(assert (=> b!894483 (= e!499625 call!39696)))

(declare-fun d!110665 () Bool)

(declare-fun e!499622 () Bool)

(assert (=> d!110665 e!499622))

(declare-fun res!605397 () Bool)

(assert (=> d!110665 (=> (not res!605397) (not e!499622))))

(assert (=> d!110665 (= res!605397 (or (bvsge #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))))

(declare-fun lt!404143 () ListLongMap!10631)

(assert (=> d!110665 (= lt!404149 lt!404143)))

(declare-fun lt!404148 () Unit!30412)

(declare-fun e!499620 () Unit!30412)

(assert (=> d!110665 (= lt!404148 e!499620)))

(declare-fun c!94445 () Bool)

(declare-fun e!499618 () Bool)

(assert (=> d!110665 (= c!94445 e!499618)))

(declare-fun res!605396 () Bool)

(assert (=> d!110665 (=> (not res!605396) (not e!499618))))

(assert (=> d!110665 (= res!605396 (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun e!499619 () ListLongMap!10631)

(assert (=> d!110665 (= lt!404143 e!499619)))

(declare-fun c!94446 () Bool)

(assert (=> d!110665 (= c!94446 (and (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110665 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110665 (= (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) lt!404149)))

(declare-fun b!894484 () Bool)

(declare-fun e!499627 () Bool)

(declare-fun get!13276 (ValueCell!8609 V!29207) V!29207)

(assert (=> b!894484 (= e!499627 (= (apply!403 lt!404149 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)) (get!13276 (select (arr!25193 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1313 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!894484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25638 (_values!5304 thiss!1181))))))

(assert (=> b!894484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun bm!39688 () Bool)

(declare-fun call!39690 () Bool)

(assert (=> bm!39688 (= call!39690 (contains!4352 lt!404149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39689 () Bool)

(declare-fun call!39692 () ListLongMap!10631)

(declare-fun getCurrentListMapNoExtraKeys!3319 (array!52385 array!52387 (_ BitVec 32) (_ BitVec 32) V!29207 V!29207 (_ BitVec 32) Int) ListLongMap!10631)

(assert (=> bm!39689 (= call!39692 (getCurrentListMapNoExtraKeys!3319 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun b!894485 () Bool)

(declare-fun e!499617 () Bool)

(assert (=> b!894485 (= e!499617 e!499627)))

(declare-fun res!605390 () Bool)

(assert (=> b!894485 (=> (not res!605390) (not e!499627))))

(assert (=> b!894485 (= res!605390 (contains!4352 lt!404149 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun bm!39690 () Bool)

(declare-fun call!39693 () ListLongMap!10631)

(assert (=> bm!39690 (= call!39696 call!39693)))

(declare-fun bm!39691 () Bool)

(declare-fun call!39691 () ListLongMap!10631)

(declare-fun c!94447 () Bool)

(declare-fun call!39694 () ListLongMap!10631)

(declare-fun +!2598 (ListLongMap!10631 tuple2!11932) ListLongMap!10631)

(assert (=> bm!39691 (= call!39693 (+!2598 (ite c!94446 call!39692 (ite c!94447 call!39691 call!39694)) (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(declare-fun b!894486 () Bool)

(declare-fun e!499621 () ListLongMap!10631)

(assert (=> b!894486 (= e!499621 call!39696)))

(declare-fun b!894487 () Bool)

(declare-fun res!605391 () Bool)

(assert (=> b!894487 (=> (not res!605391) (not e!499622))))

(declare-fun e!499616 () Bool)

(assert (=> b!894487 (= res!605391 e!499616)))

(declare-fun c!94444 () Bool)

(assert (=> b!894487 (= c!94444 (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!894488 () Bool)

(assert (=> b!894488 (= e!499616 e!499628)))

(declare-fun res!605392 () Bool)

(assert (=> b!894488 (= res!605392 call!39690)))

(assert (=> b!894488 (=> (not res!605392) (not e!499628))))

(declare-fun bm!39692 () Bool)

(assert (=> bm!39692 (= call!39694 call!39691)))

(declare-fun b!894489 () Bool)

(assert (=> b!894489 (= e!499621 call!39694)))

(declare-fun b!894490 () Bool)

(assert (=> b!894490 (= e!499618 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894491 () Bool)

(declare-fun lt!404155 () Unit!30412)

(assert (=> b!894491 (= e!499620 lt!404155)))

(declare-fun lt!404151 () ListLongMap!10631)

(assert (=> b!894491 (= lt!404151 (getCurrentListMapNoExtraKeys!3319 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun lt!404146 () (_ BitVec 64))

(assert (=> b!894491 (= lt!404146 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404137 () (_ BitVec 64))

(assert (=> b!894491 (= lt!404137 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404153 () Unit!30412)

(declare-fun addStillContains!329 (ListLongMap!10631 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30412)

(assert (=> b!894491 (= lt!404153 (addStillContains!329 lt!404151 lt!404146 (zeroValue!5117 thiss!1181) lt!404137))))

(assert (=> b!894491 (contains!4352 (+!2598 lt!404151 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181))) lt!404137)))

(declare-fun lt!404152 () Unit!30412)

(assert (=> b!894491 (= lt!404152 lt!404153)))

(declare-fun lt!404138 () ListLongMap!10631)

(assert (=> b!894491 (= lt!404138 (getCurrentListMapNoExtraKeys!3319 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun lt!404139 () (_ BitVec 64))

(assert (=> b!894491 (= lt!404139 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404140 () (_ BitVec 64))

(assert (=> b!894491 (= lt!404140 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404136 () Unit!30412)

(declare-fun addApplyDifferent!329 (ListLongMap!10631 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30412)

(assert (=> b!894491 (= lt!404136 (addApplyDifferent!329 lt!404138 lt!404139 (minValue!5117 thiss!1181) lt!404140))))

(assert (=> b!894491 (= (apply!403 (+!2598 lt!404138 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181))) lt!404140) (apply!403 lt!404138 lt!404140))))

(declare-fun lt!404147 () Unit!30412)

(assert (=> b!894491 (= lt!404147 lt!404136)))

(declare-fun lt!404144 () ListLongMap!10631)

(assert (=> b!894491 (= lt!404144 (getCurrentListMapNoExtraKeys!3319 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun lt!404156 () (_ BitVec 64))

(assert (=> b!894491 (= lt!404156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404142 () (_ BitVec 64))

(assert (=> b!894491 (= lt!404142 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404141 () Unit!30412)

(assert (=> b!894491 (= lt!404141 (addApplyDifferent!329 lt!404144 lt!404156 (zeroValue!5117 thiss!1181) lt!404142))))

(assert (=> b!894491 (= (apply!403 (+!2598 lt!404144 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181))) lt!404142) (apply!403 lt!404144 lt!404142))))

(declare-fun lt!404154 () Unit!30412)

(assert (=> b!894491 (= lt!404154 lt!404141)))

(declare-fun lt!404150 () ListLongMap!10631)

(assert (=> b!894491 (= lt!404150 (getCurrentListMapNoExtraKeys!3319 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)))))

(declare-fun lt!404145 () (_ BitVec 64))

(assert (=> b!894491 (= lt!404145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404135 () (_ BitVec 64))

(assert (=> b!894491 (= lt!404135 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894491 (= lt!404155 (addApplyDifferent!329 lt!404150 lt!404145 (minValue!5117 thiss!1181) lt!404135))))

(assert (=> b!894491 (= (apply!403 (+!2598 lt!404150 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181))) lt!404135) (apply!403 lt!404150 lt!404135))))

(declare-fun b!894492 () Bool)

(declare-fun Unit!30417 () Unit!30412)

(assert (=> b!894492 (= e!499620 Unit!30417)))

(declare-fun b!894493 () Bool)

(assert (=> b!894493 (= e!499616 (not call!39690))))

(declare-fun b!894494 () Bool)

(declare-fun c!94448 () Bool)

(assert (=> b!894494 (= c!94448 (and (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!894494 (= e!499625 e!499621)))

(declare-fun b!894495 () Bool)

(declare-fun e!499623 () Bool)

(assert (=> b!894495 (= e!499623 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894496 () Bool)

(declare-fun e!499626 () Bool)

(assert (=> b!894496 (= e!499622 e!499626)))

(declare-fun c!94443 () Bool)

(assert (=> b!894496 (= c!94443 (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!894497 () Bool)

(assert (=> b!894497 (= e!499619 e!499625)))

(assert (=> b!894497 (= c!94447 (and (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39693 () Bool)

(assert (=> bm!39693 (= call!39691 call!39692)))

(declare-fun b!894498 () Bool)

(assert (=> b!894498 (= e!499619 (+!2598 call!39693 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))

(declare-fun b!894499 () Bool)

(declare-fun res!605395 () Bool)

(assert (=> b!894499 (=> (not res!605395) (not e!499622))))

(assert (=> b!894499 (= res!605395 e!499617)))

(declare-fun res!605398 () Bool)

(assert (=> b!894499 (=> res!605398 e!499617)))

(assert (=> b!894499 (= res!605398 (not e!499623))))

(declare-fun res!605394 () Bool)

(assert (=> b!894499 (=> (not res!605394) (not e!499623))))

(assert (=> b!894499 (= res!605394 (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894500 () Bool)

(declare-fun e!499624 () Bool)

(assert (=> b!894500 (= e!499626 e!499624)))

(declare-fun res!605393 () Bool)

(assert (=> b!894500 (= res!605393 call!39695)))

(assert (=> b!894500 (=> (not res!605393) (not e!499624))))

(declare-fun b!894501 () Bool)

(assert (=> b!894501 (= e!499626 (not call!39695))))

(declare-fun b!894502 () Bool)

(assert (=> b!894502 (= e!499624 (= (apply!403 lt!404149 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5117 thiss!1181)))))

(assert (= (and d!110665 c!94446) b!894498))

(assert (= (and d!110665 (not c!94446)) b!894497))

(assert (= (and b!894497 c!94447) b!894483))

(assert (= (and b!894497 (not c!94447)) b!894494))

(assert (= (and b!894494 c!94448) b!894486))

(assert (= (and b!894494 (not c!94448)) b!894489))

(assert (= (or b!894486 b!894489) bm!39692))

(assert (= (or b!894483 bm!39692) bm!39693))

(assert (= (or b!894483 b!894486) bm!39690))

(assert (= (or b!894498 bm!39693) bm!39689))

(assert (= (or b!894498 bm!39690) bm!39691))

(assert (= (and d!110665 res!605396) b!894490))

(assert (= (and d!110665 c!94445) b!894491))

(assert (= (and d!110665 (not c!94445)) b!894492))

(assert (= (and d!110665 res!605397) b!894499))

(assert (= (and b!894499 res!605394) b!894495))

(assert (= (and b!894499 (not res!605398)) b!894485))

(assert (= (and b!894485 res!605390) b!894484))

(assert (= (and b!894499 res!605395) b!894487))

(assert (= (and b!894487 c!94444) b!894488))

(assert (= (and b!894487 (not c!94444)) b!894493))

(assert (= (and b!894488 res!605392) b!894482))

(assert (= (or b!894488 b!894493) bm!39688))

(assert (= (and b!894487 res!605391) b!894496))

(assert (= (and b!894496 c!94443) b!894500))

(assert (= (and b!894496 (not c!94443)) b!894501))

(assert (= (and b!894500 res!605393) b!894502))

(assert (= (or b!894500 b!894501) bm!39687))

(declare-fun b_lambda!12933 () Bool)

(assert (=> (not b_lambda!12933) (not b!894484)))

(declare-fun t!25067 () Bool)

(declare-fun tb!5167 () Bool)

(assert (=> (and b!894236 (= (defaultEntry!5317 thiss!1181) (defaultEntry!5317 thiss!1181)) t!25067) tb!5167))

(declare-fun result!10059 () Bool)

(assert (=> tb!5167 (= result!10059 tp_is_empty!18181)))

(assert (=> b!894484 t!25067))

(declare-fun b_and!26137 () Bool)

(assert (= b_and!26127 (and (=> t!25067 result!10059) b_and!26137)))

(declare-fun m!832847 () Bool)

(assert (=> bm!39689 m!832847))

(assert (=> b!894485 m!832807))

(assert (=> b!894485 m!832807))

(declare-fun m!832849 () Bool)

(assert (=> b!894485 m!832849))

(declare-fun m!832851 () Bool)

(assert (=> b!894482 m!832851))

(declare-fun m!832853 () Bool)

(assert (=> b!894498 m!832853))

(assert (=> d!110665 m!832791))

(declare-fun m!832855 () Bool)

(assert (=> b!894484 m!832855))

(assert (=> b!894484 m!832807))

(declare-fun m!832857 () Bool)

(assert (=> b!894484 m!832857))

(assert (=> b!894484 m!832807))

(declare-fun m!832859 () Bool)

(assert (=> b!894484 m!832859))

(assert (=> b!894484 m!832855))

(declare-fun m!832861 () Bool)

(assert (=> b!894484 m!832861))

(assert (=> b!894484 m!832859))

(declare-fun m!832863 () Bool)

(assert (=> b!894491 m!832863))

(declare-fun m!832865 () Bool)

(assert (=> b!894491 m!832865))

(declare-fun m!832867 () Bool)

(assert (=> b!894491 m!832867))

(declare-fun m!832869 () Bool)

(assert (=> b!894491 m!832869))

(assert (=> b!894491 m!832867))

(declare-fun m!832871 () Bool)

(assert (=> b!894491 m!832871))

(declare-fun m!832873 () Bool)

(assert (=> b!894491 m!832873))

(assert (=> b!894491 m!832807))

(declare-fun m!832875 () Bool)

(assert (=> b!894491 m!832875))

(assert (=> b!894491 m!832847))

(declare-fun m!832877 () Bool)

(assert (=> b!894491 m!832877))

(declare-fun m!832879 () Bool)

(assert (=> b!894491 m!832879))

(declare-fun m!832881 () Bool)

(assert (=> b!894491 m!832881))

(declare-fun m!832883 () Bool)

(assert (=> b!894491 m!832883))

(declare-fun m!832885 () Bool)

(assert (=> b!894491 m!832885))

(assert (=> b!894491 m!832871))

(assert (=> b!894491 m!832879))

(declare-fun m!832887 () Bool)

(assert (=> b!894491 m!832887))

(declare-fun m!832889 () Bool)

(assert (=> b!894491 m!832889))

(declare-fun m!832891 () Bool)

(assert (=> b!894491 m!832891))

(assert (=> b!894491 m!832883))

(declare-fun m!832893 () Bool)

(assert (=> b!894502 m!832893))

(declare-fun m!832895 () Bool)

(assert (=> bm!39687 m!832895))

(assert (=> b!894495 m!832807))

(assert (=> b!894495 m!832807))

(assert (=> b!894495 m!832813))

(assert (=> b!894490 m!832807))

(assert (=> b!894490 m!832807))

(assert (=> b!894490 m!832813))

(declare-fun m!832897 () Bool)

(assert (=> bm!39691 m!832897))

(declare-fun m!832899 () Bool)

(assert (=> bm!39688 m!832899))

(assert (=> bm!39665 d!110665))

(declare-fun b!894513 () Bool)

(declare-fun e!499640 () Bool)

(declare-fun contains!4353 (List!17750 (_ BitVec 64)) Bool)

(assert (=> b!894513 (= e!499640 (contains!4353 Nil!17747 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110667 () Bool)

(declare-fun res!605405 () Bool)

(declare-fun e!499639 () Bool)

(assert (=> d!110667 (=> res!605405 e!499639)))

(assert (=> d!110667 (= res!605405 (bvsge #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110667 (= (arrayNoDuplicates!0 (_keys!10032 thiss!1181) #b00000000000000000000000000000000 Nil!17747) e!499639)))

(declare-fun b!894514 () Bool)

(declare-fun e!499638 () Bool)

(declare-fun e!499637 () Bool)

(assert (=> b!894514 (= e!499638 e!499637)))

(declare-fun c!94451 () Bool)

(assert (=> b!894514 (= c!94451 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894515 () Bool)

(declare-fun call!39699 () Bool)

(assert (=> b!894515 (= e!499637 call!39699)))

(declare-fun bm!39696 () Bool)

(assert (=> bm!39696 (= call!39699 (arrayNoDuplicates!0 (_keys!10032 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94451 (Cons!17746 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) Nil!17747) Nil!17747)))))

(declare-fun b!894516 () Bool)

(assert (=> b!894516 (= e!499637 call!39699)))

(declare-fun b!894517 () Bool)

(assert (=> b!894517 (= e!499639 e!499638)))

(declare-fun res!605407 () Bool)

(assert (=> b!894517 (=> (not res!605407) (not e!499638))))

(assert (=> b!894517 (= res!605407 (not e!499640))))

(declare-fun res!605406 () Bool)

(assert (=> b!894517 (=> (not res!605406) (not e!499640))))

(assert (=> b!894517 (= res!605406 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110667 (not res!605405)) b!894517))

(assert (= (and b!894517 res!605406) b!894513))

(assert (= (and b!894517 res!605407) b!894514))

(assert (= (and b!894514 c!94451) b!894515))

(assert (= (and b!894514 (not c!94451)) b!894516))

(assert (= (or b!894515 b!894516) bm!39696))

(assert (=> b!894513 m!832807))

(assert (=> b!894513 m!832807))

(declare-fun m!832901 () Bool)

(assert (=> b!894513 m!832901))

(assert (=> b!894514 m!832807))

(assert (=> b!894514 m!832807))

(assert (=> b!894514 m!832813))

(assert (=> bm!39696 m!832807))

(declare-fun m!832903 () Bool)

(assert (=> bm!39696 m!832903))

(assert (=> b!894517 m!832807))

(assert (=> b!894517 m!832807))

(assert (=> b!894517 m!832813))

(assert (=> b!894301 d!110667))

(declare-fun bm!39697 () Bool)

(declare-fun call!39700 () Bool)

(assert (=> bm!39697 (= call!39700 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun d!110669 () Bool)

(declare-fun res!605408 () Bool)

(declare-fun e!499641 () Bool)

(assert (=> d!110669 (=> res!605408 e!499641)))

(assert (=> d!110669 (= res!605408 (bvsge #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110669 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) e!499641)))

(declare-fun b!894518 () Bool)

(declare-fun e!499643 () Bool)

(assert (=> b!894518 (= e!499643 call!39700)))

(declare-fun b!894519 () Bool)

(declare-fun e!499642 () Bool)

(assert (=> b!894519 (= e!499643 e!499642)))

(declare-fun lt!404159 () (_ BitVec 64))

(assert (=> b!894519 (= lt!404159 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404157 () Unit!30412)

(assert (=> b!894519 (= lt!404157 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10032 thiss!1181) lt!404159 #b00000000000000000000000000000000))))

(assert (=> b!894519 (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404159 #b00000000000000000000000000000000)))

(declare-fun lt!404158 () Unit!30412)

(assert (=> b!894519 (= lt!404158 lt!404157)))

(declare-fun res!605409 () Bool)

(assert (=> b!894519 (= res!605409 (= (seekEntryOrOpen!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) (Found!8819 #b00000000000000000000000000000000)))))

(assert (=> b!894519 (=> (not res!605409) (not e!499642))))

(declare-fun b!894520 () Bool)

(assert (=> b!894520 (= e!499641 e!499643)))

(declare-fun c!94452 () Bool)

(assert (=> b!894520 (= c!94452 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894521 () Bool)

(assert (=> b!894521 (= e!499642 call!39700)))

(assert (= (and d!110669 (not res!605408)) b!894520))

(assert (= (and b!894520 c!94452) b!894519))

(assert (= (and b!894520 (not c!94452)) b!894518))

(assert (= (and b!894519 res!605409) b!894521))

(assert (= (or b!894521 b!894518) bm!39697))

(declare-fun m!832905 () Bool)

(assert (=> bm!39697 m!832905))

(assert (=> b!894519 m!832807))

(declare-fun m!832907 () Bool)

(assert (=> b!894519 m!832907))

(declare-fun m!832909 () Bool)

(assert (=> b!894519 m!832909))

(assert (=> b!894519 m!832807))

(declare-fun m!832911 () Bool)

(assert (=> b!894519 m!832911))

(assert (=> b!894520 m!832807))

(assert (=> b!894520 m!832807))

(assert (=> b!894520 m!832813))

(assert (=> b!894300 d!110669))

(assert (=> d!110633 d!110665))

(declare-fun d!110671 () Bool)

(declare-fun e!499644 () Bool)

(assert (=> d!110671 e!499644))

(declare-fun res!605410 () Bool)

(assert (=> d!110671 (=> res!605410 e!499644)))

(declare-fun lt!404160 () Bool)

(assert (=> d!110671 (= res!605410 (not lt!404160))))

(declare-fun lt!404161 () Bool)

(assert (=> d!110671 (= lt!404160 lt!404161)))

(declare-fun lt!404163 () Unit!30412)

(declare-fun e!499645 () Unit!30412)

(assert (=> d!110671 (= lt!404163 e!499645)))

(declare-fun c!94453 () Bool)

(assert (=> d!110671 (= c!94453 lt!404161)))

(assert (=> d!110671 (= lt!404161 (containsKey!424 (toList!5331 (map!12201 thiss!1181)) key!785))))

(assert (=> d!110671 (= (contains!4352 (map!12201 thiss!1181) key!785) lt!404160)))

(declare-fun b!894522 () Bool)

(declare-fun lt!404162 () Unit!30412)

(assert (=> b!894522 (= e!499645 lt!404162)))

(assert (=> b!894522 (= lt!404162 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 (map!12201 thiss!1181)) key!785))))

(assert (=> b!894522 (isDefined!326 (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785))))

(declare-fun b!894523 () Bool)

(declare-fun Unit!30418 () Unit!30412)

(assert (=> b!894523 (= e!499645 Unit!30418)))

(declare-fun b!894524 () Bool)

(assert (=> b!894524 (= e!499644 (isDefined!326 (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785)))))

(assert (= (and d!110671 c!94453) b!894522))

(assert (= (and d!110671 (not c!94453)) b!894523))

(assert (= (and d!110671 (not res!605410)) b!894524))

(declare-fun m!832913 () Bool)

(assert (=> d!110671 m!832913))

(declare-fun m!832915 () Bool)

(assert (=> b!894522 m!832915))

(assert (=> b!894522 m!832697))

(assert (=> b!894522 m!832697))

(declare-fun m!832917 () Bool)

(assert (=> b!894522 m!832917))

(assert (=> b!894524 m!832697))

(assert (=> b!894524 m!832697))

(assert (=> b!894524 m!832917))

(assert (=> d!110627 d!110671))

(assert (=> d!110627 d!110633))

(assert (=> d!110627 d!110625))

(declare-fun mapNonEmpty!28842 () Bool)

(declare-fun mapRes!28842 () Bool)

(declare-fun tp!55551 () Bool)

(declare-fun e!499646 () Bool)

(assert (=> mapNonEmpty!28842 (= mapRes!28842 (and tp!55551 e!499646))))

(declare-fun mapRest!28842 () (Array (_ BitVec 32) ValueCell!8609))

(declare-fun mapValue!28842 () ValueCell!8609)

(declare-fun mapKey!28842 () (_ BitVec 32))

(assert (=> mapNonEmpty!28842 (= mapRest!28841 (store mapRest!28842 mapKey!28842 mapValue!28842))))

(declare-fun condMapEmpty!28842 () Bool)

(declare-fun mapDefault!28842 () ValueCell!8609)

(assert (=> mapNonEmpty!28841 (= condMapEmpty!28842 (= mapRest!28841 ((as const (Array (_ BitVec 32) ValueCell!8609)) mapDefault!28842)))))

(declare-fun e!499647 () Bool)

(assert (=> mapNonEmpty!28841 (= tp!55550 (and e!499647 mapRes!28842))))

(declare-fun b!894526 () Bool)

(assert (=> b!894526 (= e!499647 tp_is_empty!18181)))

(declare-fun b!894525 () Bool)

(assert (=> b!894525 (= e!499646 tp_is_empty!18181)))

(declare-fun mapIsEmpty!28842 () Bool)

(assert (=> mapIsEmpty!28842 mapRes!28842))

(assert (= (and mapNonEmpty!28841 condMapEmpty!28842) mapIsEmpty!28842))

(assert (= (and mapNonEmpty!28841 (not condMapEmpty!28842)) mapNonEmpty!28842))

(assert (= (and mapNonEmpty!28842 ((_ is ValueCellFull!8609) mapValue!28842)) b!894525))

(assert (= (and mapNonEmpty!28841 ((_ is ValueCellFull!8609) mapDefault!28842)) b!894526))

(declare-fun m!832919 () Bool)

(assert (=> mapNonEmpty!28842 m!832919))

(declare-fun b_lambda!12935 () Bool)

(assert (= b_lambda!12933 (or (and b!894236 b_free!15853) b_lambda!12935)))

(check-sat (not b!894354) (not b!894382) (not b!894485) (not b!894484) (not b!894432) (not bm!39672) (not d!110653) (not b!894517) (not d!110661) (not b!894502) (not bm!39669) (not b!894498) (not b!894402) (not bm!39689) (not d!110641) (not d!110665) (not b!894513) (not b!894370) (not d!110645) (not b!894438) (not b!894520) (not mapNonEmpty!28842) (not bm!39687) (not b!894522) (not b!894482) (not d!110643) (not b!894490) (not d!110657) (not bm!39697) (not b_lambda!12931) (not b!894405) (not bm!39696) (not b!894383) (not b!894495) (not b!894390) (not d!110639) (not bm!39691) (not b!894514) (not b!894431) (not b!894524) b_and!26137 (not b!894415) (not b!894413) (not b!894491) (not b_lambda!12935) tp_is_empty!18181 (not bm!39688) (not d!110663) (not b!894519) (not b!894421) (not b_next!15853) (not d!110671))
(check-sat b_and!26137 (not b_next!15853))
(get-model)

(declare-fun d!110673 () Bool)

(assert (=> d!110673 (= (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!894517 d!110673))

(declare-fun d!110675 () Bool)

(assert (=> d!110675 (= (apply!403 (+!2598 lt!404138 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181))) lt!404140) (get!13275 (getValueByKey!446 (toList!5331 (+!2598 lt!404138 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181)))) lt!404140)))))

(declare-fun bs!25090 () Bool)

(assert (= bs!25090 d!110675))

(declare-fun m!832921 () Bool)

(assert (=> bs!25090 m!832921))

(assert (=> bs!25090 m!832921))

(declare-fun m!832923 () Bool)

(assert (=> bs!25090 m!832923))

(assert (=> b!894491 d!110675))

(declare-fun d!110677 () Bool)

(assert (=> d!110677 (= (apply!403 lt!404138 lt!404140) (get!13275 (getValueByKey!446 (toList!5331 lt!404138) lt!404140)))))

(declare-fun bs!25091 () Bool)

(assert (= bs!25091 d!110677))

(declare-fun m!832925 () Bool)

(assert (=> bs!25091 m!832925))

(assert (=> bs!25091 m!832925))

(declare-fun m!832927 () Bool)

(assert (=> bs!25091 m!832927))

(assert (=> b!894491 d!110677))

(declare-fun d!110679 () Bool)

(declare-fun e!499650 () Bool)

(assert (=> d!110679 e!499650))

(declare-fun res!605416 () Bool)

(assert (=> d!110679 (=> (not res!605416) (not e!499650))))

(declare-fun lt!404175 () ListLongMap!10631)

(assert (=> d!110679 (= res!605416 (contains!4352 lt!404175 (_1!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181)))))))

(declare-fun lt!404174 () List!17749)

(assert (=> d!110679 (= lt!404175 (ListLongMap!10632 lt!404174))))

(declare-fun lt!404173 () Unit!30412)

(declare-fun lt!404172 () Unit!30412)

(assert (=> d!110679 (= lt!404173 lt!404172)))

(assert (=> d!110679 (= (getValueByKey!446 lt!404174 (_1!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!247 (List!17749 (_ BitVec 64) V!29207) Unit!30412)

(assert (=> d!110679 (= lt!404172 (lemmaContainsTupThenGetReturnValue!247 lt!404174 (_1!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181)))))))

(declare-fun insertStrictlySorted!304 (List!17749 (_ BitVec 64) V!29207) List!17749)

(assert (=> d!110679 (= lt!404174 (insertStrictlySorted!304 (toList!5331 lt!404138) (_1!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181)))))))

(assert (=> d!110679 (= (+!2598 lt!404138 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181))) lt!404175)))

(declare-fun b!894531 () Bool)

(declare-fun res!605415 () Bool)

(assert (=> b!894531 (=> (not res!605415) (not e!499650))))

(assert (=> b!894531 (= res!605415 (= (getValueByKey!446 (toList!5331 lt!404175) (_1!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181))))))))

(declare-fun b!894532 () Bool)

(declare-fun contains!4354 (List!17749 tuple2!11932) Bool)

(assert (=> b!894532 (= e!499650 (contains!4354 (toList!5331 lt!404175) (tuple2!11933 lt!404139 (minValue!5117 thiss!1181))))))

(assert (= (and d!110679 res!605416) b!894531))

(assert (= (and b!894531 res!605415) b!894532))

(declare-fun m!832929 () Bool)

(assert (=> d!110679 m!832929))

(declare-fun m!832931 () Bool)

(assert (=> d!110679 m!832931))

(declare-fun m!832933 () Bool)

(assert (=> d!110679 m!832933))

(declare-fun m!832935 () Bool)

(assert (=> d!110679 m!832935))

(declare-fun m!832937 () Bool)

(assert (=> b!894531 m!832937))

(declare-fun m!832939 () Bool)

(assert (=> b!894532 m!832939))

(assert (=> b!894491 d!110679))

(declare-fun d!110681 () Bool)

(declare-fun e!499651 () Bool)

(assert (=> d!110681 e!499651))

(declare-fun res!605418 () Bool)

(assert (=> d!110681 (=> (not res!605418) (not e!499651))))

(declare-fun lt!404179 () ListLongMap!10631)

(assert (=> d!110681 (= res!605418 (contains!4352 lt!404179 (_1!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181)))))))

(declare-fun lt!404178 () List!17749)

(assert (=> d!110681 (= lt!404179 (ListLongMap!10632 lt!404178))))

(declare-fun lt!404177 () Unit!30412)

(declare-fun lt!404176 () Unit!30412)

(assert (=> d!110681 (= lt!404177 lt!404176)))

(assert (=> d!110681 (= (getValueByKey!446 lt!404178 (_1!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110681 (= lt!404176 (lemmaContainsTupThenGetReturnValue!247 lt!404178 (_1!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110681 (= lt!404178 (insertStrictlySorted!304 (toList!5331 lt!404144) (_1!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110681 (= (+!2598 lt!404144 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181))) lt!404179)))

(declare-fun b!894533 () Bool)

(declare-fun res!605417 () Bool)

(assert (=> b!894533 (=> (not res!605417) (not e!499651))))

(assert (=> b!894533 (= res!605417 (= (getValueByKey!446 (toList!5331 lt!404179) (_1!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181))))))))

(declare-fun b!894534 () Bool)

(assert (=> b!894534 (= e!499651 (contains!4354 (toList!5331 lt!404179) (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181))))))

(assert (= (and d!110681 res!605418) b!894533))

(assert (= (and b!894533 res!605417) b!894534))

(declare-fun m!832941 () Bool)

(assert (=> d!110681 m!832941))

(declare-fun m!832943 () Bool)

(assert (=> d!110681 m!832943))

(declare-fun m!832945 () Bool)

(assert (=> d!110681 m!832945))

(declare-fun m!832947 () Bool)

(assert (=> d!110681 m!832947))

(declare-fun m!832949 () Bool)

(assert (=> b!894533 m!832949))

(declare-fun m!832951 () Bool)

(assert (=> b!894534 m!832951))

(assert (=> b!894491 d!110681))

(declare-fun d!110683 () Bool)

(assert (=> d!110683 (= (apply!403 lt!404144 lt!404142) (get!13275 (getValueByKey!446 (toList!5331 lt!404144) lt!404142)))))

(declare-fun bs!25092 () Bool)

(assert (= bs!25092 d!110683))

(declare-fun m!832953 () Bool)

(assert (=> bs!25092 m!832953))

(assert (=> bs!25092 m!832953))

(declare-fun m!832955 () Bool)

(assert (=> bs!25092 m!832955))

(assert (=> b!894491 d!110683))

(declare-fun d!110685 () Bool)

(declare-fun e!499652 () Bool)

(assert (=> d!110685 e!499652))

(declare-fun res!605419 () Bool)

(assert (=> d!110685 (=> res!605419 e!499652)))

(declare-fun lt!404180 () Bool)

(assert (=> d!110685 (= res!605419 (not lt!404180))))

(declare-fun lt!404181 () Bool)

(assert (=> d!110685 (= lt!404180 lt!404181)))

(declare-fun lt!404183 () Unit!30412)

(declare-fun e!499653 () Unit!30412)

(assert (=> d!110685 (= lt!404183 e!499653)))

(declare-fun c!94454 () Bool)

(assert (=> d!110685 (= c!94454 lt!404181)))

(assert (=> d!110685 (= lt!404181 (containsKey!424 (toList!5331 (+!2598 lt!404151 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))) lt!404137))))

(assert (=> d!110685 (= (contains!4352 (+!2598 lt!404151 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181))) lt!404137) lt!404180)))

(declare-fun b!894535 () Bool)

(declare-fun lt!404182 () Unit!30412)

(assert (=> b!894535 (= e!499653 lt!404182)))

(assert (=> b!894535 (= lt!404182 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 (+!2598 lt!404151 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))) lt!404137))))

(assert (=> b!894535 (isDefined!326 (getValueByKey!446 (toList!5331 (+!2598 lt!404151 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))) lt!404137))))

(declare-fun b!894536 () Bool)

(declare-fun Unit!30419 () Unit!30412)

(assert (=> b!894536 (= e!499653 Unit!30419)))

(declare-fun b!894537 () Bool)

(assert (=> b!894537 (= e!499652 (isDefined!326 (getValueByKey!446 (toList!5331 (+!2598 lt!404151 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))) lt!404137)))))

(assert (= (and d!110685 c!94454) b!894535))

(assert (= (and d!110685 (not c!94454)) b!894536))

(assert (= (and d!110685 (not res!605419)) b!894537))

(declare-fun m!832957 () Bool)

(assert (=> d!110685 m!832957))

(declare-fun m!832959 () Bool)

(assert (=> b!894535 m!832959))

(declare-fun m!832961 () Bool)

(assert (=> b!894535 m!832961))

(assert (=> b!894535 m!832961))

(declare-fun m!832963 () Bool)

(assert (=> b!894535 m!832963))

(assert (=> b!894537 m!832961))

(assert (=> b!894537 m!832961))

(assert (=> b!894537 m!832963))

(assert (=> b!894491 d!110685))

(declare-fun d!110687 () Bool)

(assert (=> d!110687 (= (apply!403 (+!2598 lt!404150 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181))) lt!404135) (get!13275 (getValueByKey!446 (toList!5331 (+!2598 lt!404150 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181)))) lt!404135)))))

(declare-fun bs!25093 () Bool)

(assert (= bs!25093 d!110687))

(declare-fun m!832965 () Bool)

(assert (=> bs!25093 m!832965))

(assert (=> bs!25093 m!832965))

(declare-fun m!832967 () Bool)

(assert (=> bs!25093 m!832967))

(assert (=> b!894491 d!110687))

(declare-fun d!110689 () Bool)

(assert (=> d!110689 (= (apply!403 (+!2598 lt!404138 (tuple2!11933 lt!404139 (minValue!5117 thiss!1181))) lt!404140) (apply!403 lt!404138 lt!404140))))

(declare-fun lt!404186 () Unit!30412)

(declare-fun choose!1472 (ListLongMap!10631 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30412)

(assert (=> d!110689 (= lt!404186 (choose!1472 lt!404138 lt!404139 (minValue!5117 thiss!1181) lt!404140))))

(declare-fun e!499656 () Bool)

(assert (=> d!110689 e!499656))

(declare-fun res!605422 () Bool)

(assert (=> d!110689 (=> (not res!605422) (not e!499656))))

(assert (=> d!110689 (= res!605422 (contains!4352 lt!404138 lt!404140))))

(assert (=> d!110689 (= (addApplyDifferent!329 lt!404138 lt!404139 (minValue!5117 thiss!1181) lt!404140) lt!404186)))

(declare-fun b!894541 () Bool)

(assert (=> b!894541 (= e!499656 (not (= lt!404140 lt!404139)))))

(assert (= (and d!110689 res!605422) b!894541))

(assert (=> d!110689 m!832863))

(declare-fun m!832969 () Bool)

(assert (=> d!110689 m!832969))

(assert (=> d!110689 m!832871))

(assert (=> d!110689 m!832873))

(declare-fun m!832971 () Bool)

(assert (=> d!110689 m!832971))

(assert (=> d!110689 m!832871))

(assert (=> b!894491 d!110689))

(declare-fun d!110691 () Bool)

(assert (=> d!110691 (= (apply!403 (+!2598 lt!404144 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181))) lt!404142) (apply!403 lt!404144 lt!404142))))

(declare-fun lt!404187 () Unit!30412)

(assert (=> d!110691 (= lt!404187 (choose!1472 lt!404144 lt!404156 (zeroValue!5117 thiss!1181) lt!404142))))

(declare-fun e!499657 () Bool)

(assert (=> d!110691 e!499657))

(declare-fun res!605423 () Bool)

(assert (=> d!110691 (=> (not res!605423) (not e!499657))))

(assert (=> d!110691 (= res!605423 (contains!4352 lt!404144 lt!404142))))

(assert (=> d!110691 (= (addApplyDifferent!329 lt!404144 lt!404156 (zeroValue!5117 thiss!1181) lt!404142) lt!404187)))

(declare-fun b!894542 () Bool)

(assert (=> b!894542 (= e!499657 (not (= lt!404142 lt!404156)))))

(assert (= (and d!110691 res!605423) b!894542))

(assert (=> d!110691 m!832877))

(declare-fun m!832973 () Bool)

(assert (=> d!110691 m!832973))

(assert (=> d!110691 m!832879))

(assert (=> d!110691 m!832881))

(declare-fun m!832975 () Bool)

(assert (=> d!110691 m!832975))

(assert (=> d!110691 m!832879))

(assert (=> b!894491 d!110691))

(declare-fun d!110693 () Bool)

(assert (=> d!110693 (= (apply!403 lt!404150 lt!404135) (get!13275 (getValueByKey!446 (toList!5331 lt!404150) lt!404135)))))

(declare-fun bs!25094 () Bool)

(assert (= bs!25094 d!110693))

(declare-fun m!832977 () Bool)

(assert (=> bs!25094 m!832977))

(assert (=> bs!25094 m!832977))

(declare-fun m!832979 () Bool)

(assert (=> bs!25094 m!832979))

(assert (=> b!894491 d!110693))

(declare-fun d!110695 () Bool)

(assert (=> d!110695 (contains!4352 (+!2598 lt!404151 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181))) lt!404137)))

(declare-fun lt!404190 () Unit!30412)

(declare-fun choose!1473 (ListLongMap!10631 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30412)

(assert (=> d!110695 (= lt!404190 (choose!1473 lt!404151 lt!404146 (zeroValue!5117 thiss!1181) lt!404137))))

(assert (=> d!110695 (contains!4352 lt!404151 lt!404137)))

(assert (=> d!110695 (= (addStillContains!329 lt!404151 lt!404146 (zeroValue!5117 thiss!1181) lt!404137) lt!404190)))

(declare-fun bs!25095 () Bool)

(assert (= bs!25095 d!110695))

(assert (=> bs!25095 m!832867))

(assert (=> bs!25095 m!832867))

(assert (=> bs!25095 m!832869))

(declare-fun m!832981 () Bool)

(assert (=> bs!25095 m!832981))

(declare-fun m!832983 () Bool)

(assert (=> bs!25095 m!832983))

(assert (=> b!894491 d!110695))

(declare-fun d!110697 () Bool)

(assert (=> d!110697 (= (apply!403 (+!2598 lt!404144 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181))) lt!404142) (get!13275 (getValueByKey!446 (toList!5331 (+!2598 lt!404144 (tuple2!11933 lt!404156 (zeroValue!5117 thiss!1181)))) lt!404142)))))

(declare-fun bs!25096 () Bool)

(assert (= bs!25096 d!110697))

(declare-fun m!832985 () Bool)

(assert (=> bs!25096 m!832985))

(assert (=> bs!25096 m!832985))

(declare-fun m!832987 () Bool)

(assert (=> bs!25096 m!832987))

(assert (=> b!894491 d!110697))

(declare-fun d!110699 () Bool)

(declare-fun e!499658 () Bool)

(assert (=> d!110699 e!499658))

(declare-fun res!605425 () Bool)

(assert (=> d!110699 (=> (not res!605425) (not e!499658))))

(declare-fun lt!404194 () ListLongMap!10631)

(assert (=> d!110699 (= res!605425 (contains!4352 lt!404194 (_1!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181)))))))

(declare-fun lt!404193 () List!17749)

(assert (=> d!110699 (= lt!404194 (ListLongMap!10632 lt!404193))))

(declare-fun lt!404192 () Unit!30412)

(declare-fun lt!404191 () Unit!30412)

(assert (=> d!110699 (= lt!404192 lt!404191)))

(assert (=> d!110699 (= (getValueByKey!446 lt!404193 (_1!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181)))))))

(assert (=> d!110699 (= lt!404191 (lemmaContainsTupThenGetReturnValue!247 lt!404193 (_1!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181)))))))

(assert (=> d!110699 (= lt!404193 (insertStrictlySorted!304 (toList!5331 lt!404150) (_1!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181)))))))

(assert (=> d!110699 (= (+!2598 lt!404150 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181))) lt!404194)))

(declare-fun b!894544 () Bool)

(declare-fun res!605424 () Bool)

(assert (=> b!894544 (=> (not res!605424) (not e!499658))))

(assert (=> b!894544 (= res!605424 (= (getValueByKey!446 (toList!5331 lt!404194) (_1!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181))))))))

(declare-fun b!894545 () Bool)

(assert (=> b!894545 (= e!499658 (contains!4354 (toList!5331 lt!404194) (tuple2!11933 lt!404145 (minValue!5117 thiss!1181))))))

(assert (= (and d!110699 res!605425) b!894544))

(assert (= (and b!894544 res!605424) b!894545))

(declare-fun m!832989 () Bool)

(assert (=> d!110699 m!832989))

(declare-fun m!832991 () Bool)

(assert (=> d!110699 m!832991))

(declare-fun m!832993 () Bool)

(assert (=> d!110699 m!832993))

(declare-fun m!832995 () Bool)

(assert (=> d!110699 m!832995))

(declare-fun m!832997 () Bool)

(assert (=> b!894544 m!832997))

(declare-fun m!832999 () Bool)

(assert (=> b!894545 m!832999))

(assert (=> b!894491 d!110699))

(declare-fun d!110701 () Bool)

(declare-fun e!499659 () Bool)

(assert (=> d!110701 e!499659))

(declare-fun res!605427 () Bool)

(assert (=> d!110701 (=> (not res!605427) (not e!499659))))

(declare-fun lt!404198 () ListLongMap!10631)

(assert (=> d!110701 (= res!605427 (contains!4352 lt!404198 (_1!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))))))

(declare-fun lt!404197 () List!17749)

(assert (=> d!110701 (= lt!404198 (ListLongMap!10632 lt!404197))))

(declare-fun lt!404196 () Unit!30412)

(declare-fun lt!404195 () Unit!30412)

(assert (=> d!110701 (= lt!404196 lt!404195)))

(assert (=> d!110701 (= (getValueByKey!446 lt!404197 (_1!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110701 (= lt!404195 (lemmaContainsTupThenGetReturnValue!247 lt!404197 (_1!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110701 (= lt!404197 (insertStrictlySorted!304 (toList!5331 lt!404151) (_1!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))))))

(assert (=> d!110701 (= (+!2598 lt!404151 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181))) lt!404198)))

(declare-fun b!894546 () Bool)

(declare-fun res!605426 () Bool)

(assert (=> b!894546 (=> (not res!605426) (not e!499659))))

(assert (=> b!894546 (= res!605426 (= (getValueByKey!446 (toList!5331 lt!404198) (_1!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181))))))))

(declare-fun b!894547 () Bool)

(assert (=> b!894547 (= e!499659 (contains!4354 (toList!5331 lt!404198) (tuple2!11933 lt!404146 (zeroValue!5117 thiss!1181))))))

(assert (= (and d!110701 res!605427) b!894546))

(assert (= (and b!894546 res!605426) b!894547))

(declare-fun m!833001 () Bool)

(assert (=> d!110701 m!833001))

(declare-fun m!833003 () Bool)

(assert (=> d!110701 m!833003))

(declare-fun m!833005 () Bool)

(assert (=> d!110701 m!833005))

(declare-fun m!833007 () Bool)

(assert (=> d!110701 m!833007))

(declare-fun m!833009 () Bool)

(assert (=> b!894546 m!833009))

(declare-fun m!833011 () Bool)

(assert (=> b!894547 m!833011))

(assert (=> b!894491 d!110701))

(declare-fun bm!39700 () Bool)

(declare-fun call!39703 () ListLongMap!10631)

(assert (=> bm!39700 (= call!39703 (getCurrentListMapNoExtraKeys!3319 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5317 thiss!1181)))))

(declare-fun b!894572 () Bool)

(declare-fun e!499674 () ListLongMap!10631)

(declare-fun e!499678 () ListLongMap!10631)

(assert (=> b!894572 (= e!499674 e!499678)))

(declare-fun c!94465 () Bool)

(assert (=> b!894572 (= c!94465 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894573 () Bool)

(declare-fun e!499679 () Bool)

(declare-fun e!499680 () Bool)

(assert (=> b!894573 (= e!499679 e!499680)))

(declare-fun c!94463 () Bool)

(declare-fun e!499676 () Bool)

(assert (=> b!894573 (= c!94463 e!499676)))

(declare-fun res!605437 () Bool)

(assert (=> b!894573 (=> (not res!605437) (not e!499676))))

(assert (=> b!894573 (= res!605437 (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894574 () Bool)

(declare-fun e!499677 () Bool)

(declare-fun lt!404219 () ListLongMap!10631)

(declare-fun isEmpty!686 (ListLongMap!10631) Bool)

(assert (=> b!894574 (= e!499677 (isEmpty!686 lt!404219))))

(declare-fun b!894575 () Bool)

(assert (=> b!894575 (= e!499680 e!499677)))

(declare-fun c!94464 () Bool)

(assert (=> b!894575 (= c!94464 (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894576 () Bool)

(declare-fun res!605438 () Bool)

(assert (=> b!894576 (=> (not res!605438) (not e!499679))))

(assert (=> b!894576 (= res!605438 (not (contains!4352 lt!404219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!110703 () Bool)

(assert (=> d!110703 e!499679))

(declare-fun res!605439 () Bool)

(assert (=> d!110703 (=> (not res!605439) (not e!499679))))

(assert (=> d!110703 (= res!605439 (not (contains!4352 lt!404219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!110703 (= lt!404219 e!499674)))

(declare-fun c!94466 () Bool)

(assert (=> d!110703 (= c!94466 (bvsge #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110703 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110703 (= (getCurrentListMapNoExtraKeys!3319 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) lt!404219)))

(declare-fun b!894577 () Bool)

(assert (=> b!894577 (= e!499678 call!39703)))

(declare-fun b!894578 () Bool)

(assert (=> b!894578 (= e!499676 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894578 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!894579 () Bool)

(assert (=> b!894579 (= e!499677 (= lt!404219 (getCurrentListMapNoExtraKeys!3319 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5317 thiss!1181))))))

(declare-fun b!894580 () Bool)

(declare-fun lt!404218 () Unit!30412)

(declare-fun lt!404216 () Unit!30412)

(assert (=> b!894580 (= lt!404218 lt!404216)))

(declare-fun lt!404215 () V!29207)

(declare-fun lt!404213 () (_ BitVec 64))

(declare-fun lt!404214 () ListLongMap!10631)

(declare-fun lt!404217 () (_ BitVec 64))

(assert (=> b!894580 (not (contains!4352 (+!2598 lt!404214 (tuple2!11933 lt!404213 lt!404215)) lt!404217))))

(declare-fun addStillNotContains!214 (ListLongMap!10631 (_ BitVec 64) V!29207 (_ BitVec 64)) Unit!30412)

(assert (=> b!894580 (= lt!404216 (addStillNotContains!214 lt!404214 lt!404213 lt!404215 lt!404217))))

(assert (=> b!894580 (= lt!404217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!894580 (= lt!404215 (get!13276 (select (arr!25193 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1313 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!894580 (= lt!404213 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894580 (= lt!404214 call!39703)))

(assert (=> b!894580 (= e!499678 (+!2598 call!39703 (tuple2!11933 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) (get!13276 (select (arr!25193 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1313 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!894581 () Bool)

(declare-fun e!499675 () Bool)

(assert (=> b!894581 (= e!499680 e!499675)))

(assert (=> b!894581 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun res!605436 () Bool)

(assert (=> b!894581 (= res!605436 (contains!4352 lt!404219 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894581 (=> (not res!605436) (not e!499675))))

(declare-fun b!894582 () Bool)

(assert (=> b!894582 (= e!499674 (ListLongMap!10632 Nil!17746))))

(declare-fun b!894583 () Bool)

(assert (=> b!894583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> b!894583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25638 (_values!5304 thiss!1181))))))

(assert (=> b!894583 (= e!499675 (= (apply!403 lt!404219 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)) (get!13276 (select (arr!25193 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1313 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!110703 c!94466) b!894582))

(assert (= (and d!110703 (not c!94466)) b!894572))

(assert (= (and b!894572 c!94465) b!894580))

(assert (= (and b!894572 (not c!94465)) b!894577))

(assert (= (or b!894580 b!894577) bm!39700))

(assert (= (and d!110703 res!605439) b!894576))

(assert (= (and b!894576 res!605438) b!894573))

(assert (= (and b!894573 res!605437) b!894578))

(assert (= (and b!894573 c!94463) b!894581))

(assert (= (and b!894573 (not c!94463)) b!894575))

(assert (= (and b!894581 res!605436) b!894583))

(assert (= (and b!894575 c!94464) b!894579))

(assert (= (and b!894575 (not c!94464)) b!894574))

(declare-fun b_lambda!12937 () Bool)

(assert (=> (not b_lambda!12937) (not b!894580)))

(assert (=> b!894580 t!25067))

(declare-fun b_and!26139 () Bool)

(assert (= b_and!26137 (and (=> t!25067 result!10059) b_and!26139)))

(declare-fun b_lambda!12939 () Bool)

(assert (=> (not b_lambda!12939) (not b!894583)))

(assert (=> b!894583 t!25067))

(declare-fun b_and!26141 () Bool)

(assert (= b_and!26139 (and (=> t!25067 result!10059) b_and!26141)))

(declare-fun m!833013 () Bool)

(assert (=> b!894579 m!833013))

(assert (=> b!894572 m!832807))

(assert (=> b!894572 m!832807))

(assert (=> b!894572 m!832813))

(assert (=> bm!39700 m!833013))

(declare-fun m!833015 () Bool)

(assert (=> b!894574 m!833015))

(declare-fun m!833017 () Bool)

(assert (=> b!894580 m!833017))

(assert (=> b!894580 m!832859))

(assert (=> b!894580 m!832807))

(declare-fun m!833019 () Bool)

(assert (=> b!894580 m!833019))

(declare-fun m!833021 () Bool)

(assert (=> b!894580 m!833021))

(assert (=> b!894580 m!833017))

(declare-fun m!833023 () Bool)

(assert (=> b!894580 m!833023))

(assert (=> b!894580 m!832855))

(assert (=> b!894580 m!832859))

(assert (=> b!894580 m!832855))

(assert (=> b!894580 m!832861))

(assert (=> b!894578 m!832807))

(assert (=> b!894578 m!832807))

(assert (=> b!894578 m!832813))

(declare-fun m!833025 () Bool)

(assert (=> d!110703 m!833025))

(assert (=> d!110703 m!832791))

(assert (=> b!894581 m!832807))

(assert (=> b!894581 m!832807))

(declare-fun m!833027 () Bool)

(assert (=> b!894581 m!833027))

(assert (=> b!894583 m!832859))

(assert (=> b!894583 m!832807))

(assert (=> b!894583 m!832807))

(declare-fun m!833029 () Bool)

(assert (=> b!894583 m!833029))

(assert (=> b!894583 m!832855))

(assert (=> b!894583 m!832859))

(assert (=> b!894583 m!832855))

(assert (=> b!894583 m!832861))

(declare-fun m!833031 () Bool)

(assert (=> b!894576 m!833031))

(assert (=> b!894491 d!110703))

(declare-fun d!110705 () Bool)

(assert (=> d!110705 (= (apply!403 (+!2598 lt!404150 (tuple2!11933 lt!404145 (minValue!5117 thiss!1181))) lt!404135) (apply!403 lt!404150 lt!404135))))

(declare-fun lt!404220 () Unit!30412)

(assert (=> d!110705 (= lt!404220 (choose!1472 lt!404150 lt!404145 (minValue!5117 thiss!1181) lt!404135))))

(declare-fun e!499681 () Bool)

(assert (=> d!110705 e!499681))

(declare-fun res!605440 () Bool)

(assert (=> d!110705 (=> (not res!605440) (not e!499681))))

(assert (=> d!110705 (= res!605440 (contains!4352 lt!404150 lt!404135))))

(assert (=> d!110705 (= (addApplyDifferent!329 lt!404150 lt!404145 (minValue!5117 thiss!1181) lt!404135) lt!404220)))

(declare-fun b!894584 () Bool)

(assert (=> b!894584 (= e!499681 (not (= lt!404135 lt!404145)))))

(assert (= (and d!110705 res!605440) b!894584))

(assert (=> d!110705 m!832875))

(declare-fun m!833033 () Bool)

(assert (=> d!110705 m!833033))

(assert (=> d!110705 m!832883))

(assert (=> d!110705 m!832885))

(declare-fun m!833035 () Bool)

(assert (=> d!110705 m!833035))

(assert (=> d!110705 m!832883))

(assert (=> b!894491 d!110705))

(declare-fun d!110707 () Bool)

(declare-fun lt!404221 () (_ BitVec 32))

(assert (=> d!110707 (and (or (bvslt lt!404221 #b00000000000000000000000000000000) (bvsge lt!404221 (size!25637 (_keys!10032 thiss!1181))) (and (bvsge lt!404221 #b00000000000000000000000000000000) (bvslt lt!404221 (size!25637 (_keys!10032 thiss!1181))))) (bvsge lt!404221 #b00000000000000000000000000000000) (bvslt lt!404221 (size!25637 (_keys!10032 thiss!1181))) (= (select (arr!25192 (_keys!10032 thiss!1181)) lt!404221) key!785))))

(declare-fun e!499682 () (_ BitVec 32))

(assert (=> d!110707 (= lt!404221 e!499682)))

(declare-fun c!94467 () Bool)

(assert (=> d!110707 (= c!94467 (= (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110707 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))) (bvslt (size!25637 (_keys!10032 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110707 (= (arrayScanForKey!0 (_keys!10032 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!404221)))

(declare-fun b!894585 () Bool)

(assert (=> b!894585 (= e!499682 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!894586 () Bool)

(assert (=> b!894586 (= e!499682 (arrayScanForKey!0 (_keys!10032 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110707 c!94467) b!894585))

(assert (= (and d!110707 (not c!94467)) b!894586))

(declare-fun m!833037 () Bool)

(assert (=> d!110707 m!833037))

(declare-fun m!833039 () Bool)

(assert (=> d!110707 m!833039))

(declare-fun m!833041 () Bool)

(assert (=> b!894586 m!833041))

(assert (=> b!894421 d!110707))

(declare-fun d!110709 () Bool)

(declare-fun isEmpty!687 (Option!452) Bool)

(assert (=> d!110709 (= (isDefined!326 (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785)) (not (isEmpty!687 (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785))))))

(declare-fun bs!25097 () Bool)

(assert (= bs!25097 d!110709))

(assert (=> bs!25097 m!832697))

(declare-fun m!833043 () Bool)

(assert (=> bs!25097 m!833043))

(assert (=> b!894524 d!110709))

(assert (=> b!894524 d!110631))

(assert (=> b!894402 d!110673))

(assert (=> b!894490 d!110673))

(declare-fun b!894587 () Bool)

(declare-fun e!499683 () (_ BitVec 32))

(assert (=> b!894587 (= e!499683 #b00000000000000000000000000000000)))

(declare-fun b!894588 () Bool)

(declare-fun e!499684 () (_ BitVec 32))

(declare-fun call!39704 () (_ BitVec 32))

(assert (=> b!894588 (= e!499684 call!39704)))

(declare-fun d!110711 () Bool)

(declare-fun lt!404222 () (_ BitVec 32))

(assert (=> d!110711 (and (bvsge lt!404222 #b00000000000000000000000000000000) (bvsle lt!404222 (bvsub (size!25637 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!110711 (= lt!404222 e!499683)))

(declare-fun c!94468 () Bool)

(assert (=> d!110711 (= c!94468 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110711 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!25637 (_keys!10032 thiss!1181)) (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110711 (= (arrayCountValidKeys!0 (_keys!10032 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))) lt!404222)))

(declare-fun bm!39701 () Bool)

(assert (=> bm!39701 (= call!39704 (arrayCountValidKeys!0 (_keys!10032 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894589 () Bool)

(assert (=> b!894589 (= e!499684 (bvadd #b00000000000000000000000000000001 call!39704))))

(declare-fun b!894590 () Bool)

(assert (=> b!894590 (= e!499683 e!499684)))

(declare-fun c!94469 () Bool)

(assert (=> b!894590 (= c!94469 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!110711 c!94468) b!894587))

(assert (= (and d!110711 (not c!94468)) b!894590))

(assert (= (and b!894590 c!94469) b!894589))

(assert (= (and b!894590 (not c!94469)) b!894588))

(assert (= (or b!894589 b!894588) bm!39701))

(declare-fun m!833045 () Bool)

(assert (=> bm!39701 m!833045))

(assert (=> b!894590 m!833039))

(assert (=> b!894590 m!833039))

(declare-fun m!833047 () Bool)

(assert (=> b!894590 m!833047))

(assert (=> bm!39669 d!110711))

(declare-fun d!110713 () Bool)

(declare-fun e!499687 () Bool)

(assert (=> d!110713 e!499687))

(declare-fun c!94472 () Bool)

(assert (=> d!110713 (= c!94472 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!110713 true))

(declare-fun _$15!89 () Unit!30412)

(assert (=> d!110713 (= (choose!1471 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) key!785 (defaultEntry!5317 thiss!1181)) _$15!89)))

(declare-fun b!894595 () Bool)

(assert (=> b!894595 (= e!499687 (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!894596 () Bool)

(assert (=> b!894596 (= e!499687 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5013 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110713 c!94472) b!894595))

(assert (= (and d!110713 (not c!94472)) b!894596))

(assert (=> b!894595 m!832773))

(assert (=> d!110661 d!110713))

(declare-fun d!110715 () Bool)

(assert (=> d!110715 (= (validMask!0 (mask!25891 thiss!1181)) (and (or (= (mask!25891 thiss!1181) #b00000000000000000000000000000111) (= (mask!25891 thiss!1181) #b00000000000000000000000000001111) (= (mask!25891 thiss!1181) #b00000000000000000000000000011111) (= (mask!25891 thiss!1181) #b00000000000000000000000000111111) (= (mask!25891 thiss!1181) #b00000000000000000000000001111111) (= (mask!25891 thiss!1181) #b00000000000000000000000011111111) (= (mask!25891 thiss!1181) #b00000000000000000000000111111111) (= (mask!25891 thiss!1181) #b00000000000000000000001111111111) (= (mask!25891 thiss!1181) #b00000000000000000000011111111111) (= (mask!25891 thiss!1181) #b00000000000000000000111111111111) (= (mask!25891 thiss!1181) #b00000000000000000001111111111111) (= (mask!25891 thiss!1181) #b00000000000000000011111111111111) (= (mask!25891 thiss!1181) #b00000000000000000111111111111111) (= (mask!25891 thiss!1181) #b00000000000000001111111111111111) (= (mask!25891 thiss!1181) #b00000000000000011111111111111111) (= (mask!25891 thiss!1181) #b00000000000000111111111111111111) (= (mask!25891 thiss!1181) #b00000000000001111111111111111111) (= (mask!25891 thiss!1181) #b00000000000011111111111111111111) (= (mask!25891 thiss!1181) #b00000000000111111111111111111111) (= (mask!25891 thiss!1181) #b00000000001111111111111111111111) (= (mask!25891 thiss!1181) #b00000000011111111111111111111111) (= (mask!25891 thiss!1181) #b00000000111111111111111111111111) (= (mask!25891 thiss!1181) #b00000001111111111111111111111111) (= (mask!25891 thiss!1181) #b00000011111111111111111111111111) (= (mask!25891 thiss!1181) #b00000111111111111111111111111111) (= (mask!25891 thiss!1181) #b00001111111111111111111111111111) (= (mask!25891 thiss!1181) #b00011111111111111111111111111111) (= (mask!25891 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25891 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!110661 d!110715))

(declare-fun d!110717 () Bool)

(declare-fun res!605441 () Bool)

(declare-fun e!499688 () Bool)

(assert (=> d!110717 (=> res!605441 e!499688)))

(assert (=> d!110717 (= res!605441 (= (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110717 (= (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!499688)))

(declare-fun b!894597 () Bool)

(declare-fun e!499689 () Bool)

(assert (=> b!894597 (= e!499688 e!499689)))

(declare-fun res!605442 () Bool)

(assert (=> b!894597 (=> (not res!605442) (not e!499689))))

(assert (=> b!894597 (= res!605442 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894598 () Bool)

(assert (=> b!894598 (= e!499689 (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110717 (not res!605441)) b!894597))

(assert (= (and b!894597 res!605442) b!894598))

(assert (=> d!110717 m!833039))

(declare-fun m!833049 () Bool)

(assert (=> b!894598 m!833049))

(assert (=> b!894390 d!110717))

(declare-fun d!110719 () Bool)

(assert (=> d!110719 (isDefined!326 (getValueByKey!446 (toList!5331 (map!12201 thiss!1181)) key!785))))

(declare-fun lt!404225 () Unit!30412)

(declare-fun choose!1474 (List!17749 (_ BitVec 64)) Unit!30412)

(assert (=> d!110719 (= lt!404225 (choose!1474 (toList!5331 (map!12201 thiss!1181)) key!785))))

(declare-fun e!499692 () Bool)

(assert (=> d!110719 e!499692))

(declare-fun res!605445 () Bool)

(assert (=> d!110719 (=> (not res!605445) (not e!499692))))

(declare-fun isStrictlySorted!483 (List!17749) Bool)

(assert (=> d!110719 (= res!605445 (isStrictlySorted!483 (toList!5331 (map!12201 thiss!1181))))))

(assert (=> d!110719 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 (map!12201 thiss!1181)) key!785) lt!404225)))

(declare-fun b!894601 () Bool)

(assert (=> b!894601 (= e!499692 (containsKey!424 (toList!5331 (map!12201 thiss!1181)) key!785))))

(assert (= (and d!110719 res!605445) b!894601))

(assert (=> d!110719 m!832697))

(assert (=> d!110719 m!832697))

(assert (=> d!110719 m!832917))

(declare-fun m!833051 () Bool)

(assert (=> d!110719 m!833051))

(declare-fun m!833053 () Bool)

(assert (=> d!110719 m!833053))

(assert (=> b!894601 m!832913))

(assert (=> b!894522 d!110719))

(assert (=> b!894522 d!110709))

(assert (=> b!894522 d!110631))

(declare-fun d!110721 () Bool)

(declare-fun res!605450 () Bool)

(declare-fun e!499697 () Bool)

(assert (=> d!110721 (=> res!605450 e!499697)))

(assert (=> d!110721 (= res!605450 (and ((_ is Cons!17745) (toList!5331 call!39669)) (= (_1!5977 (h!18882 (toList!5331 call!39669))) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785))))))

(assert (=> d!110721 (= (containsKey!424 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)) e!499697)))

(declare-fun b!894606 () Bool)

(declare-fun e!499698 () Bool)

(assert (=> b!894606 (= e!499697 e!499698)))

(declare-fun res!605451 () Bool)

(assert (=> b!894606 (=> (not res!605451) (not e!499698))))

(assert (=> b!894606 (= res!605451 (and (or (not ((_ is Cons!17745) (toList!5331 call!39669))) (bvsle (_1!5977 (h!18882 (toList!5331 call!39669))) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785))) ((_ is Cons!17745) (toList!5331 call!39669)) (bvslt (_1!5977 (h!18882 (toList!5331 call!39669))) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785))))))

(declare-fun b!894607 () Bool)

(assert (=> b!894607 (= e!499698 (containsKey!424 (t!25060 (toList!5331 call!39669)) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(assert (= (and d!110721 (not res!605450)) b!894606))

(assert (= (and b!894606 res!605451) b!894607))

(declare-fun m!833055 () Bool)

(assert (=> b!894607 m!833055))

(assert (=> d!110653 d!110721))

(declare-fun d!110723 () Bool)

(assert (=> d!110723 (contains!4352 (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)))))

(assert (=> d!110723 true))

(declare-fun _$16!172 () Unit!30412)

(assert (=> d!110723 (= (choose!1470 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) (index!37648 lt!404023) (defaultEntry!5317 thiss!1181)) _$16!172)))

(declare-fun bs!25098 () Bool)

(assert (= bs!25098 d!110723))

(assert (=> bs!25098 m!832757))

(assert (=> bs!25098 m!832775))

(assert (=> bs!25098 m!832757))

(assert (=> bs!25098 m!832775))

(assert (=> bs!25098 m!832793))

(assert (=> d!110641 d!110723))

(assert (=> d!110641 d!110715))

(assert (=> b!894520 d!110673))

(declare-fun d!110725 () Bool)

(declare-fun e!499699 () Bool)

(assert (=> d!110725 e!499699))

(declare-fun res!605452 () Bool)

(assert (=> d!110725 (=> res!605452 e!499699)))

(declare-fun lt!404226 () Bool)

(assert (=> d!110725 (= res!605452 (not lt!404226))))

(declare-fun lt!404227 () Bool)

(assert (=> d!110725 (= lt!404226 lt!404227)))

(declare-fun lt!404229 () Unit!30412)

(declare-fun e!499700 () Unit!30412)

(assert (=> d!110725 (= lt!404229 e!499700)))

(declare-fun c!94473 () Bool)

(assert (=> d!110725 (= c!94473 lt!404227)))

(assert (=> d!110725 (= lt!404227 (containsKey!424 (toList!5331 (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181))) (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023))))))

(assert (=> d!110725 (= (contains!4352 (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181)) (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023))) lt!404226)))

(declare-fun b!894608 () Bool)

(declare-fun lt!404228 () Unit!30412)

(assert (=> b!894608 (= e!499700 lt!404228)))

(assert (=> b!894608 (= lt!404228 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181))) (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023))))))

(assert (=> b!894608 (isDefined!326 (getValueByKey!446 (toList!5331 (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181))) (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023))))))

(declare-fun b!894609 () Bool)

(declare-fun Unit!30420 () Unit!30412)

(assert (=> b!894609 (= e!499700 Unit!30420)))

(declare-fun b!894610 () Bool)

(assert (=> b!894610 (= e!499699 (isDefined!326 (getValueByKey!446 (toList!5331 (getCurrentListMap!2607 (_keys!10032 thiss!1181) (_values!5304 thiss!1181) (mask!25891 thiss!1181) (extraKeys!5013 thiss!1181) (zeroValue!5117 thiss!1181) (minValue!5117 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5317 thiss!1181))) (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)))))))

(assert (= (and d!110725 c!94473) b!894608))

(assert (= (and d!110725 (not c!94473)) b!894609))

(assert (= (and d!110725 (not res!605452)) b!894610))

(assert (=> d!110725 m!832775))

(declare-fun m!833057 () Bool)

(assert (=> d!110725 m!833057))

(assert (=> b!894608 m!832775))

(declare-fun m!833059 () Bool)

(assert (=> b!894608 m!833059))

(assert (=> b!894608 m!832775))

(declare-fun m!833061 () Bool)

(assert (=> b!894608 m!833061))

(assert (=> b!894608 m!833061))

(declare-fun m!833063 () Bool)

(assert (=> b!894608 m!833063))

(assert (=> b!894610 m!832775))

(assert (=> b!894610 m!833061))

(assert (=> b!894610 m!833061))

(assert (=> b!894610 m!833063))

(assert (=> b!894354 d!110725))

(assert (=> b!894354 d!110665))

(declare-fun b!894611 () Bool)

(declare-fun e!499704 () Bool)

(assert (=> b!894611 (= e!499704 (contains!4353 (ite c!94451 (Cons!17746 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) Nil!17747) Nil!17747) (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!110727 () Bool)

(declare-fun res!605453 () Bool)

(declare-fun e!499703 () Bool)

(assert (=> d!110727 (=> res!605453 e!499703)))

(assert (=> d!110727 (= res!605453 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110727 (= (arrayNoDuplicates!0 (_keys!10032 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94451 (Cons!17746 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) Nil!17747) Nil!17747)) e!499703)))

(declare-fun b!894612 () Bool)

(declare-fun e!499702 () Bool)

(declare-fun e!499701 () Bool)

(assert (=> b!894612 (= e!499702 e!499701)))

(declare-fun c!94474 () Bool)

(assert (=> b!894612 (= c!94474 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894613 () Bool)

(declare-fun call!39705 () Bool)

(assert (=> b!894613 (= e!499701 call!39705)))

(declare-fun bm!39702 () Bool)

(assert (=> bm!39702 (= call!39705 (arrayNoDuplicates!0 (_keys!10032 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!94474 (Cons!17746 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!94451 (Cons!17746 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) Nil!17747) Nil!17747)) (ite c!94451 (Cons!17746 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) Nil!17747) Nil!17747))))))

(declare-fun b!894614 () Bool)

(assert (=> b!894614 (= e!499701 call!39705)))

(declare-fun b!894615 () Bool)

(assert (=> b!894615 (= e!499703 e!499702)))

(declare-fun res!605455 () Bool)

(assert (=> b!894615 (=> (not res!605455) (not e!499702))))

(assert (=> b!894615 (= res!605455 (not e!499704))))

(declare-fun res!605454 () Bool)

(assert (=> b!894615 (=> (not res!605454) (not e!499704))))

(assert (=> b!894615 (= res!605454 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!110727 (not res!605453)) b!894615))

(assert (= (and b!894615 res!605454) b!894611))

(assert (= (and b!894615 res!605455) b!894612))

(assert (= (and b!894612 c!94474) b!894613))

(assert (= (and b!894612 (not c!94474)) b!894614))

(assert (= (or b!894613 b!894614) bm!39702))

(assert (=> b!894611 m!833039))

(assert (=> b!894611 m!833039))

(declare-fun m!833065 () Bool)

(assert (=> b!894611 m!833065))

(assert (=> b!894612 m!833039))

(assert (=> b!894612 m!833039))

(assert (=> b!894612 m!833047))

(assert (=> bm!39702 m!833039))

(declare-fun m!833067 () Bool)

(assert (=> bm!39702 m!833067))

(assert (=> b!894615 m!833039))

(assert (=> b!894615 m!833039))

(assert (=> b!894615 m!833047))

(assert (=> bm!39696 d!110727))

(declare-fun d!110729 () Bool)

(assert (=> d!110729 (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404159 #b00000000000000000000000000000000)))

(declare-fun lt!404230 () Unit!30412)

(assert (=> d!110729 (= lt!404230 (choose!13 (_keys!10032 thiss!1181) lt!404159 #b00000000000000000000000000000000))))

(assert (=> d!110729 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!110729 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10032 thiss!1181) lt!404159 #b00000000000000000000000000000000) lt!404230)))

(declare-fun bs!25099 () Bool)

(assert (= bs!25099 d!110729))

(assert (=> bs!25099 m!832909))

(declare-fun m!833069 () Bool)

(assert (=> bs!25099 m!833069))

(assert (=> b!894519 d!110729))

(declare-fun d!110731 () Bool)

(declare-fun res!605456 () Bool)

(declare-fun e!499705 () Bool)

(assert (=> d!110731 (=> res!605456 e!499705)))

(assert (=> d!110731 (= res!605456 (= (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) lt!404159))))

(assert (=> d!110731 (= (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404159 #b00000000000000000000000000000000) e!499705)))

(declare-fun b!894616 () Bool)

(declare-fun e!499706 () Bool)

(assert (=> b!894616 (= e!499705 e!499706)))

(declare-fun res!605457 () Bool)

(assert (=> b!894616 (=> (not res!605457) (not e!499706))))

(assert (=> b!894616 (= res!605457 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894617 () Bool)

(assert (=> b!894617 (= e!499706 (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404159 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110731 (not res!605456)) b!894616))

(assert (= (and b!894616 res!605457) b!894617))

(assert (=> d!110731 m!832807))

(declare-fun m!833071 () Bool)

(assert (=> b!894617 m!833071))

(assert (=> b!894519 d!110731))

(declare-fun b!894630 () Bool)

(declare-fun e!499713 () SeekEntryResult!8819)

(declare-fun lt!404238 () SeekEntryResult!8819)

(assert (=> b!894630 (= e!499713 (Found!8819 (index!37649 lt!404238)))))

(declare-fun b!894631 () Bool)

(declare-fun e!499714 () SeekEntryResult!8819)

(assert (=> b!894631 (= e!499714 Undefined!8819)))

(declare-fun b!894632 () Bool)

(assert (=> b!894632 (= e!499714 e!499713)))

(declare-fun lt!404237 () (_ BitVec 64))

(assert (=> b!894632 (= lt!404237 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37649 lt!404238)))))

(declare-fun c!94483 () Bool)

(assert (=> b!894632 (= c!94483 (= lt!404237 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110733 () Bool)

(declare-fun lt!404239 () SeekEntryResult!8819)

(assert (=> d!110733 (and (or ((_ is Undefined!8819) lt!404239) (not ((_ is Found!8819) lt!404239)) (and (bvsge (index!37648 lt!404239) #b00000000000000000000000000000000) (bvslt (index!37648 lt!404239) (size!25637 (_keys!10032 thiss!1181))))) (or ((_ is Undefined!8819) lt!404239) ((_ is Found!8819) lt!404239) (not ((_ is MissingZero!8819) lt!404239)) (and (bvsge (index!37647 lt!404239) #b00000000000000000000000000000000) (bvslt (index!37647 lt!404239) (size!25637 (_keys!10032 thiss!1181))))) (or ((_ is Undefined!8819) lt!404239) ((_ is Found!8819) lt!404239) ((_ is MissingZero!8819) lt!404239) (not ((_ is MissingVacant!8819) lt!404239)) (and (bvsge (index!37650 lt!404239) #b00000000000000000000000000000000) (bvslt (index!37650 lt!404239) (size!25637 (_keys!10032 thiss!1181))))) (or ((_ is Undefined!8819) lt!404239) (ite ((_ is Found!8819) lt!404239) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404239)) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8819) lt!404239) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37647 lt!404239)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8819) lt!404239) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37650 lt!404239)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110733 (= lt!404239 e!499714)))

(declare-fun c!94481 () Bool)

(assert (=> d!110733 (= c!94481 (and ((_ is Intermediate!8819) lt!404238) (undefined!9631 lt!404238)))))

(assert (=> d!110733 (= lt!404238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) (mask!25891 thiss!1181)) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(assert (=> d!110733 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110733 (= (seekEntryOrOpen!0 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) lt!404239)))

(declare-fun b!894633 () Bool)

(declare-fun e!499715 () SeekEntryResult!8819)

(assert (=> b!894633 (= e!499715 (MissingZero!8819 (index!37649 lt!404238)))))

(declare-fun b!894634 () Bool)

(assert (=> b!894634 (= e!499715 (seekKeyOrZeroReturnVacant!0 (x!75933 lt!404238) (index!37649 lt!404238) (index!37649 lt!404238) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun b!894635 () Bool)

(declare-fun c!94482 () Bool)

(assert (=> b!894635 (= c!94482 (= lt!404237 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894635 (= e!499713 e!499715)))

(assert (= (and d!110733 c!94481) b!894631))

(assert (= (and d!110733 (not c!94481)) b!894632))

(assert (= (and b!894632 c!94483) b!894630))

(assert (= (and b!894632 (not c!94483)) b!894635))

(assert (= (and b!894635 c!94482) b!894633))

(assert (= (and b!894635 (not c!94482)) b!894634))

(declare-fun m!833073 () Bool)

(assert (=> b!894632 m!833073))

(assert (=> d!110733 m!832791))

(declare-fun m!833075 () Bool)

(assert (=> d!110733 m!833075))

(assert (=> d!110733 m!832807))

(declare-fun m!833077 () Bool)

(assert (=> d!110733 m!833077))

(declare-fun m!833079 () Bool)

(assert (=> d!110733 m!833079))

(declare-fun m!833081 () Bool)

(assert (=> d!110733 m!833081))

(assert (=> d!110733 m!832807))

(assert (=> d!110733 m!833075))

(declare-fun m!833083 () Bool)

(assert (=> d!110733 m!833083))

(assert (=> b!894634 m!832807))

(declare-fun m!833085 () Bool)

(assert (=> b!894634 m!833085))

(assert (=> b!894519 d!110733))

(assert (=> b!894514 d!110673))

(declare-fun bm!39703 () Bool)

(declare-fun call!39706 () Bool)

(assert (=> bm!39703 (= call!39706 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun d!110735 () Bool)

(declare-fun res!605458 () Bool)

(declare-fun e!499716 () Bool)

(assert (=> d!110735 (=> res!605458 e!499716)))

(assert (=> d!110735 (= res!605458 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110735 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) e!499716)))

(declare-fun b!894636 () Bool)

(declare-fun e!499718 () Bool)

(assert (=> b!894636 (= e!499718 call!39706)))

(declare-fun b!894637 () Bool)

(declare-fun e!499717 () Bool)

(assert (=> b!894637 (= e!499718 e!499717)))

(declare-fun lt!404242 () (_ BitVec 64))

(assert (=> b!894637 (= lt!404242 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!404240 () Unit!30412)

(assert (=> b!894637 (= lt!404240 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10032 thiss!1181) lt!404242 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!894637 (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404242 #b00000000000000000000000000000000)))

(declare-fun lt!404241 () Unit!30412)

(assert (=> b!894637 (= lt!404241 lt!404240)))

(declare-fun res!605459 () Bool)

(assert (=> b!894637 (= res!605459 (= (seekEntryOrOpen!0 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) (Found!8819 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!894637 (=> (not res!605459) (not e!499717))))

(declare-fun b!894638 () Bool)

(assert (=> b!894638 (= e!499716 e!499718)))

(declare-fun c!94484 () Bool)

(assert (=> b!894638 (= c!94484 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894639 () Bool)

(assert (=> b!894639 (= e!499717 call!39706)))

(assert (= (and d!110735 (not res!605458)) b!894638))

(assert (= (and b!894638 c!94484) b!894637))

(assert (= (and b!894638 (not c!94484)) b!894636))

(assert (= (and b!894637 res!605459) b!894639))

(assert (= (or b!894639 b!894636) bm!39703))

(declare-fun m!833087 () Bool)

(assert (=> bm!39703 m!833087))

(assert (=> b!894637 m!833039))

(declare-fun m!833089 () Bool)

(assert (=> b!894637 m!833089))

(declare-fun m!833091 () Bool)

(assert (=> b!894637 m!833091))

(assert (=> b!894637 m!833039))

(declare-fun m!833093 () Bool)

(assert (=> b!894637 m!833093))

(assert (=> b!894638 m!833039))

(assert (=> b!894638 m!833039))

(assert (=> b!894638 m!833047))

(assert (=> bm!39697 d!110735))

(declare-fun d!110737 () Bool)

(declare-fun lt!404245 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!400 (List!17750) (InoxSet (_ BitVec 64)))

(assert (=> d!110737 (= lt!404245 (select (content!400 Nil!17747) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499723 () Bool)

(assert (=> d!110737 (= lt!404245 e!499723)))

(declare-fun res!605464 () Bool)

(assert (=> d!110737 (=> (not res!605464) (not e!499723))))

(assert (=> d!110737 (= res!605464 ((_ is Cons!17746) Nil!17747))))

(assert (=> d!110737 (= (contains!4353 Nil!17747 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)) lt!404245)))

(declare-fun b!894644 () Bool)

(declare-fun e!499724 () Bool)

(assert (=> b!894644 (= e!499723 e!499724)))

(declare-fun res!605465 () Bool)

(assert (=> b!894644 (=> res!605465 e!499724)))

(assert (=> b!894644 (= res!605465 (= (h!18883 Nil!17747) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894645 () Bool)

(assert (=> b!894645 (= e!499724 (contains!4353 (t!25065 Nil!17747) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110737 res!605464) b!894644))

(assert (= (and b!894644 (not res!605465)) b!894645))

(declare-fun m!833095 () Bool)

(assert (=> d!110737 m!833095))

(assert (=> d!110737 m!832807))

(declare-fun m!833097 () Bool)

(assert (=> d!110737 m!833097))

(assert (=> b!894645 m!832807))

(declare-fun m!833099 () Bool)

(assert (=> b!894645 m!833099))

(assert (=> b!894513 d!110737))

(declare-fun d!110739 () Bool)

(assert (=> d!110739 (= (isDefined!326 (getValueByKey!446 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785))) (not (isEmpty!687 (getValueByKey!446 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))))

(declare-fun bs!25100 () Bool)

(assert (= bs!25100 d!110739))

(assert (=> bs!25100 m!832821))

(declare-fun m!833101 () Bool)

(assert (=> bs!25100 m!833101))

(assert (=> b!894415 d!110739))

(declare-fun e!499726 () Option!452)

(declare-fun b!894648 () Bool)

(assert (=> b!894648 (= e!499726 (getValueByKey!446 (t!25060 (toList!5331 call!39669)) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(declare-fun b!894649 () Bool)

(assert (=> b!894649 (= e!499726 None!450)))

(declare-fun d!110741 () Bool)

(declare-fun c!94485 () Bool)

(assert (=> d!110741 (= c!94485 (and ((_ is Cons!17745) (toList!5331 call!39669)) (= (_1!5977 (h!18882 (toList!5331 call!39669))) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785))))))

(declare-fun e!499725 () Option!452)

(assert (=> d!110741 (= (getValueByKey!446 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)) e!499725)))

(declare-fun b!894647 () Bool)

(assert (=> b!894647 (= e!499725 e!499726)))

(declare-fun c!94486 () Bool)

(assert (=> b!894647 (= c!94486 (and ((_ is Cons!17745) (toList!5331 call!39669)) (not (= (_1!5977 (h!18882 (toList!5331 call!39669))) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))))

(declare-fun b!894646 () Bool)

(assert (=> b!894646 (= e!499725 (Some!451 (_2!5977 (h!18882 (toList!5331 call!39669)))))))

(assert (= (and d!110741 c!94485) b!894646))

(assert (= (and d!110741 (not c!94485)) b!894647))

(assert (= (and b!894647 c!94486) b!894648))

(assert (= (and b!894647 (not c!94486)) b!894649))

(declare-fun m!833103 () Bool)

(assert (=> b!894648 m!833103))

(assert (=> b!894415 d!110741))

(declare-fun d!110743 () Bool)

(assert (=> d!110743 (= (size!25643 thiss!1181) (bvadd (_size!2172 thiss!1181) (bvsdiv (bvadd (extraKeys!5013 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!894382 d!110743))

(declare-fun b!894652 () Bool)

(declare-fun e!499728 () Option!452)

(assert (=> b!894652 (= e!499728 (getValueByKey!446 (t!25060 (t!25060 (t!25060 (toList!5331 (map!12201 thiss!1181))))) key!785))))

(declare-fun b!894653 () Bool)

(assert (=> b!894653 (= e!499728 None!450)))

(declare-fun d!110745 () Bool)

(declare-fun c!94487 () Bool)

(assert (=> d!110745 (= c!94487 (and ((_ is Cons!17745) (t!25060 (t!25060 (toList!5331 (map!12201 thiss!1181))))) (= (_1!5977 (h!18882 (t!25060 (t!25060 (toList!5331 (map!12201 thiss!1181)))))) key!785)))))

(declare-fun e!499727 () Option!452)

(assert (=> d!110745 (= (getValueByKey!446 (t!25060 (t!25060 (toList!5331 (map!12201 thiss!1181)))) key!785) e!499727)))

(declare-fun b!894651 () Bool)

(assert (=> b!894651 (= e!499727 e!499728)))

(declare-fun c!94488 () Bool)

(assert (=> b!894651 (= c!94488 (and ((_ is Cons!17745) (t!25060 (t!25060 (toList!5331 (map!12201 thiss!1181))))) (not (= (_1!5977 (h!18882 (t!25060 (t!25060 (toList!5331 (map!12201 thiss!1181)))))) key!785))))))

(declare-fun b!894650 () Bool)

(assert (=> b!894650 (= e!499727 (Some!451 (_2!5977 (h!18882 (t!25060 (t!25060 (toList!5331 (map!12201 thiss!1181))))))))))

(assert (= (and d!110745 c!94487) b!894650))

(assert (= (and d!110745 (not c!94487)) b!894651))

(assert (= (and b!894651 c!94488) b!894652))

(assert (= (and b!894651 (not c!94488)) b!894653))

(declare-fun m!833105 () Bool)

(assert (=> b!894652 m!833105))

(assert (=> b!894405 d!110745))

(declare-fun b!894666 () Bool)

(declare-fun e!499737 () SeekEntryResult!8819)

(assert (=> b!894666 (= e!499737 Undefined!8819)))

(declare-fun b!894667 () Bool)

(declare-fun e!499735 () SeekEntryResult!8819)

(assert (=> b!894667 (= e!499735 (MissingVacant!8819 (index!37649 lt!404050)))))

(declare-fun lt!404250 () SeekEntryResult!8819)

(declare-fun d!110747 () Bool)

(assert (=> d!110747 (and (or ((_ is Undefined!8819) lt!404250) (not ((_ is Found!8819) lt!404250)) (and (bvsge (index!37648 lt!404250) #b00000000000000000000000000000000) (bvslt (index!37648 lt!404250) (size!25637 (_keys!10032 thiss!1181))))) (or ((_ is Undefined!8819) lt!404250) ((_ is Found!8819) lt!404250) (not ((_ is MissingVacant!8819) lt!404250)) (not (= (index!37650 lt!404250) (index!37649 lt!404050))) (and (bvsge (index!37650 lt!404250) #b00000000000000000000000000000000) (bvslt (index!37650 lt!404250) (size!25637 (_keys!10032 thiss!1181))))) (or ((_ is Undefined!8819) lt!404250) (ite ((_ is Found!8819) lt!404250) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404250)) key!785) (and ((_ is MissingVacant!8819) lt!404250) (= (index!37650 lt!404250) (index!37649 lt!404050)) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37650 lt!404250)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110747 (= lt!404250 e!499737)))

(declare-fun c!94495 () Bool)

(assert (=> d!110747 (= c!94495 (bvsge (x!75933 lt!404050) #b01111111111111111111111111111110))))

(declare-fun lt!404251 () (_ BitVec 64))

(assert (=> d!110747 (= lt!404251 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37649 lt!404050)))))

(assert (=> d!110747 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110747 (= (seekKeyOrZeroReturnVacant!0 (x!75933 lt!404050) (index!37649 lt!404050) (index!37649 lt!404050) key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) lt!404250)))

(declare-fun b!894668 () Bool)

(declare-fun c!94496 () Bool)

(assert (=> b!894668 (= c!94496 (= lt!404251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499736 () SeekEntryResult!8819)

(assert (=> b!894668 (= e!499736 e!499735)))

(declare-fun b!894669 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894669 (= e!499735 (seekKeyOrZeroReturnVacant!0 (bvadd (x!75933 lt!404050) #b00000000000000000000000000000001) (nextIndex!0 (index!37649 lt!404050) (bvadd (x!75933 lt!404050) #b00000000000000000000000000000001) (mask!25891 thiss!1181)) (index!37649 lt!404050) key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun b!894670 () Bool)

(assert (=> b!894670 (= e!499737 e!499736)))

(declare-fun c!94497 () Bool)

(assert (=> b!894670 (= c!94497 (= lt!404251 key!785))))

(declare-fun b!894671 () Bool)

(assert (=> b!894671 (= e!499736 (Found!8819 (index!37649 lt!404050)))))

(assert (= (and d!110747 c!94495) b!894666))

(assert (= (and d!110747 (not c!94495)) b!894670))

(assert (= (and b!894670 c!94497) b!894671))

(assert (= (and b!894670 (not c!94497)) b!894668))

(assert (= (and b!894668 c!94496) b!894667))

(assert (= (and b!894668 (not c!94496)) b!894669))

(declare-fun m!833107 () Bool)

(assert (=> d!110747 m!833107))

(declare-fun m!833109 () Bool)

(assert (=> d!110747 m!833109))

(assert (=> d!110747 m!832797))

(assert (=> d!110747 m!832791))

(declare-fun m!833111 () Bool)

(assert (=> b!894669 m!833111))

(assert (=> b!894669 m!833111))

(declare-fun m!833113 () Bool)

(assert (=> b!894669 m!833113))

(assert (=> b!894370 d!110747))

(assert (=> b!894383 d!110743))

(declare-fun d!110749 () Bool)

(declare-fun e!499738 () Bool)

(assert (=> d!110749 e!499738))

(declare-fun res!605466 () Bool)

(assert (=> d!110749 (=> res!605466 e!499738)))

(declare-fun lt!404252 () Bool)

(assert (=> d!110749 (= res!605466 (not lt!404252))))

(declare-fun lt!404253 () Bool)

(assert (=> d!110749 (= lt!404252 lt!404253)))

(declare-fun lt!404255 () Unit!30412)

(declare-fun e!499739 () Unit!30412)

(assert (=> d!110749 (= lt!404255 e!499739)))

(declare-fun c!94498 () Bool)

(assert (=> d!110749 (= c!94498 lt!404253)))

(assert (=> d!110749 (= lt!404253 (containsKey!424 (toList!5331 lt!404149) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110749 (= (contains!4352 lt!404149 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)) lt!404252)))

(declare-fun b!894672 () Bool)

(declare-fun lt!404254 () Unit!30412)

(assert (=> b!894672 (= e!499739 lt!404254)))

(assert (=> b!894672 (= lt!404254 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 lt!404149) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894672 (isDefined!326 (getValueByKey!446 (toList!5331 lt!404149) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894673 () Bool)

(declare-fun Unit!30421 () Unit!30412)

(assert (=> b!894673 (= e!499739 Unit!30421)))

(declare-fun b!894674 () Bool)

(assert (=> b!894674 (= e!499738 (isDefined!326 (getValueByKey!446 (toList!5331 lt!404149) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!110749 c!94498) b!894672))

(assert (= (and d!110749 (not c!94498)) b!894673))

(assert (= (and d!110749 (not res!605466)) b!894674))

(assert (=> d!110749 m!832807))

(declare-fun m!833115 () Bool)

(assert (=> d!110749 m!833115))

(assert (=> b!894672 m!832807))

(declare-fun m!833117 () Bool)

(assert (=> b!894672 m!833117))

(assert (=> b!894672 m!832807))

(declare-fun m!833119 () Bool)

(assert (=> b!894672 m!833119))

(assert (=> b!894672 m!833119))

(declare-fun m!833121 () Bool)

(assert (=> b!894672 m!833121))

(assert (=> b!894674 m!832807))

(assert (=> b!894674 m!833119))

(assert (=> b!894674 m!833119))

(assert (=> b!894674 m!833121))

(assert (=> b!894485 d!110749))

(declare-fun d!110751 () Bool)

(declare-fun e!499740 () Bool)

(assert (=> d!110751 e!499740))

(declare-fun res!605468 () Bool)

(assert (=> d!110751 (=> (not res!605468) (not e!499740))))

(declare-fun lt!404259 () ListLongMap!10631)

(assert (=> d!110751 (= res!605468 (contains!4352 lt!404259 (_1!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(declare-fun lt!404258 () List!17749)

(assert (=> d!110751 (= lt!404259 (ListLongMap!10632 lt!404258))))

(declare-fun lt!404257 () Unit!30412)

(declare-fun lt!404256 () Unit!30412)

(assert (=> d!110751 (= lt!404257 lt!404256)))

(assert (=> d!110751 (= (getValueByKey!446 lt!404258 (_1!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))) (Some!451 (_2!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(assert (=> d!110751 (= lt!404256 (lemmaContainsTupThenGetReturnValue!247 lt!404258 (_1!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) (_2!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(assert (=> d!110751 (= lt!404258 (insertStrictlySorted!304 (toList!5331 (ite c!94446 call!39692 (ite c!94447 call!39691 call!39694))) (_1!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) (_2!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(assert (=> d!110751 (= (+!2598 (ite c!94446 call!39692 (ite c!94447 call!39691 call!39694)) (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) lt!404259)))

(declare-fun b!894675 () Bool)

(declare-fun res!605467 () Bool)

(assert (=> b!894675 (=> (not res!605467) (not e!499740))))

(assert (=> b!894675 (= res!605467 (= (getValueByKey!446 (toList!5331 lt!404259) (_1!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))) (Some!451 (_2!5977 (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))))

(declare-fun b!894676 () Bool)

(assert (=> b!894676 (= e!499740 (contains!4354 (toList!5331 lt!404259) (ite (or c!94446 c!94447) (tuple2!11933 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5117 thiss!1181)) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (= (and d!110751 res!605468) b!894675))

(assert (= (and b!894675 res!605467) b!894676))

(declare-fun m!833123 () Bool)

(assert (=> d!110751 m!833123))

(declare-fun m!833125 () Bool)

(assert (=> d!110751 m!833125))

(declare-fun m!833127 () Bool)

(assert (=> d!110751 m!833127))

(declare-fun m!833129 () Bool)

(assert (=> d!110751 m!833129))

(declare-fun m!833131 () Bool)

(assert (=> b!894675 m!833131))

(declare-fun m!833133 () Bool)

(assert (=> b!894676 m!833133))

(assert (=> bm!39691 d!110751))

(declare-fun d!110753 () Bool)

(declare-fun e!499741 () Bool)

(assert (=> d!110753 e!499741))

(declare-fun res!605469 () Bool)

(assert (=> d!110753 (=> res!605469 e!499741)))

(declare-fun lt!404260 () Bool)

(assert (=> d!110753 (= res!605469 (not lt!404260))))

(declare-fun lt!404261 () Bool)

(assert (=> d!110753 (= lt!404260 lt!404261)))

(declare-fun lt!404263 () Unit!30412)

(declare-fun e!499742 () Unit!30412)

(assert (=> d!110753 (= lt!404263 e!499742)))

(declare-fun c!94499 () Bool)

(assert (=> d!110753 (= c!94499 lt!404261)))

(assert (=> d!110753 (= lt!404261 (containsKey!424 (toList!5331 lt!404149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110753 (= (contains!4352 lt!404149 #b0000000000000000000000000000000000000000000000000000000000000000) lt!404260)))

(declare-fun b!894677 () Bool)

(declare-fun lt!404262 () Unit!30412)

(assert (=> b!894677 (= e!499742 lt!404262)))

(assert (=> b!894677 (= lt!404262 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 lt!404149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894677 (isDefined!326 (getValueByKey!446 (toList!5331 lt!404149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894678 () Bool)

(declare-fun Unit!30422 () Unit!30412)

(assert (=> b!894678 (= e!499742 Unit!30422)))

(declare-fun b!894679 () Bool)

(assert (=> b!894679 (= e!499741 (isDefined!326 (getValueByKey!446 (toList!5331 lt!404149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110753 c!94499) b!894677))

(assert (= (and d!110753 (not c!94499)) b!894678))

(assert (= (and d!110753 (not res!605469)) b!894679))

(declare-fun m!833135 () Bool)

(assert (=> d!110753 m!833135))

(declare-fun m!833137 () Bool)

(assert (=> b!894677 m!833137))

(declare-fun m!833139 () Bool)

(assert (=> b!894677 m!833139))

(assert (=> b!894677 m!833139))

(declare-fun m!833141 () Bool)

(assert (=> b!894677 m!833141))

(assert (=> b!894679 m!833139))

(assert (=> b!894679 m!833139))

(assert (=> b!894679 m!833141))

(assert (=> bm!39688 d!110753))

(declare-fun d!110755 () Bool)

(assert (=> d!110755 (isDefined!326 (getValueByKey!446 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(declare-fun lt!404264 () Unit!30412)

(assert (=> d!110755 (= lt!404264 (choose!1474 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(declare-fun e!499743 () Bool)

(assert (=> d!110755 e!499743))

(declare-fun res!605470 () Bool)

(assert (=> d!110755 (=> (not res!605470) (not e!499743))))

(assert (=> d!110755 (= res!605470 (isStrictlySorted!483 (toList!5331 call!39669)))))

(assert (=> d!110755 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)) lt!404264)))

(declare-fun b!894680 () Bool)

(assert (=> b!894680 (= e!499743 (containsKey!424 (toList!5331 call!39669) (ite c!94393 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404023)) key!785)))))

(assert (= (and d!110755 res!605470) b!894680))

(assert (=> d!110755 m!832821))

(assert (=> d!110755 m!832821))

(assert (=> d!110755 m!832823))

(declare-fun m!833143 () Bool)

(assert (=> d!110755 m!833143))

(declare-fun m!833145 () Bool)

(assert (=> d!110755 m!833145))

(assert (=> b!894680 m!832817))

(assert (=> b!894413 d!110755))

(assert (=> b!894413 d!110739))

(assert (=> b!894413 d!110741))

(declare-fun d!110757 () Bool)

(declare-fun res!605471 () Bool)

(declare-fun e!499744 () Bool)

(assert (=> d!110757 (=> res!605471 e!499744)))

(assert (=> d!110757 (= res!605471 (and ((_ is Cons!17745) (toList!5331 (map!12201 thiss!1181))) (= (_1!5977 (h!18882 (toList!5331 (map!12201 thiss!1181)))) key!785)))))

(assert (=> d!110757 (= (containsKey!424 (toList!5331 (map!12201 thiss!1181)) key!785) e!499744)))

(declare-fun b!894681 () Bool)

(declare-fun e!499745 () Bool)

(assert (=> b!894681 (= e!499744 e!499745)))

(declare-fun res!605472 () Bool)

(assert (=> b!894681 (=> (not res!605472) (not e!499745))))

(assert (=> b!894681 (= res!605472 (and (or (not ((_ is Cons!17745) (toList!5331 (map!12201 thiss!1181)))) (bvsle (_1!5977 (h!18882 (toList!5331 (map!12201 thiss!1181)))) key!785)) ((_ is Cons!17745) (toList!5331 (map!12201 thiss!1181))) (bvslt (_1!5977 (h!18882 (toList!5331 (map!12201 thiss!1181)))) key!785)))))

(declare-fun b!894682 () Bool)

(assert (=> b!894682 (= e!499745 (containsKey!424 (t!25060 (toList!5331 (map!12201 thiss!1181))) key!785))))

(assert (= (and d!110757 (not res!605471)) b!894681))

(assert (= (and b!894681 res!605472) b!894682))

(declare-fun m!833147 () Bool)

(assert (=> b!894682 m!833147))

(assert (=> d!110671 d!110757))

(declare-fun d!110759 () Bool)

(assert (=> d!110759 (= (apply!403 lt!404149 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13275 (getValueByKey!446 (toList!5331 lt!404149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25101 () Bool)

(assert (= bs!25101 d!110759))

(declare-fun m!833149 () Bool)

(assert (=> bs!25101 m!833149))

(assert (=> bs!25101 m!833149))

(declare-fun m!833151 () Bool)

(assert (=> bs!25101 m!833151))

(assert (=> b!894502 d!110759))

(assert (=> bm!39689 d!110703))

(declare-fun d!110761 () Bool)

(declare-fun e!499746 () Bool)

(assert (=> d!110761 e!499746))

(declare-fun res!605474 () Bool)

(assert (=> d!110761 (=> (not res!605474) (not e!499746))))

(declare-fun lt!404268 () ListLongMap!10631)

(assert (=> d!110761 (= res!605474 (contains!4352 lt!404268 (_1!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(declare-fun lt!404267 () List!17749)

(assert (=> d!110761 (= lt!404268 (ListLongMap!10632 lt!404267))))

(declare-fun lt!404266 () Unit!30412)

(declare-fun lt!404265 () Unit!30412)

(assert (=> d!110761 (= lt!404266 lt!404265)))

(assert (=> d!110761 (= (getValueByKey!446 lt!404267 (_1!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (=> d!110761 (= lt!404265 (lemmaContainsTupThenGetReturnValue!247 lt!404267 (_1!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (=> d!110761 (= lt!404267 (insertStrictlySorted!304 (toList!5331 call!39693) (_1!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))) (_2!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))))))

(assert (=> d!110761 (= (+!2598 call!39693 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))) lt!404268)))

(declare-fun b!894683 () Bool)

(declare-fun res!605473 () Bool)

(assert (=> b!894683 (=> (not res!605473) (not e!499746))))

(assert (=> b!894683 (= res!605473 (= (getValueByKey!446 (toList!5331 lt!404268) (_1!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181)))) (Some!451 (_2!5977 (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))))

(declare-fun b!894684 () Bool)

(assert (=> b!894684 (= e!499746 (contains!4354 (toList!5331 lt!404268) (tuple2!11933 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5117 thiss!1181))))))

(assert (= (and d!110761 res!605474) b!894683))

(assert (= (and b!894683 res!605473) b!894684))

(declare-fun m!833153 () Bool)

(assert (=> d!110761 m!833153))

(declare-fun m!833155 () Bool)

(assert (=> d!110761 m!833155))

(declare-fun m!833157 () Bool)

(assert (=> d!110761 m!833157))

(declare-fun m!833159 () Bool)

(assert (=> d!110761 m!833159))

(declare-fun m!833161 () Bool)

(assert (=> b!894683 m!833161))

(declare-fun m!833163 () Bool)

(assert (=> b!894684 m!833163))

(assert (=> b!894498 d!110761))

(declare-fun d!110763 () Bool)

(declare-fun e!499747 () Bool)

(assert (=> d!110763 e!499747))

(declare-fun res!605475 () Bool)

(assert (=> d!110763 (=> res!605475 e!499747)))

(declare-fun lt!404269 () Bool)

(assert (=> d!110763 (= res!605475 (not lt!404269))))

(declare-fun lt!404270 () Bool)

(assert (=> d!110763 (= lt!404269 lt!404270)))

(declare-fun lt!404272 () Unit!30412)

(declare-fun e!499748 () Unit!30412)

(assert (=> d!110763 (= lt!404272 e!499748)))

(declare-fun c!94500 () Bool)

(assert (=> d!110763 (= c!94500 lt!404270)))

(assert (=> d!110763 (= lt!404270 (containsKey!424 (toList!5331 lt!404149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110763 (= (contains!4352 lt!404149 #b1000000000000000000000000000000000000000000000000000000000000000) lt!404269)))

(declare-fun b!894685 () Bool)

(declare-fun lt!404271 () Unit!30412)

(assert (=> b!894685 (= e!499748 lt!404271)))

(assert (=> b!894685 (= lt!404271 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5331 lt!404149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894685 (isDefined!326 (getValueByKey!446 (toList!5331 lt!404149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894686 () Bool)

(declare-fun Unit!30423 () Unit!30412)

(assert (=> b!894686 (= e!499748 Unit!30423)))

(declare-fun b!894687 () Bool)

(assert (=> b!894687 (= e!499747 (isDefined!326 (getValueByKey!446 (toList!5331 lt!404149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110763 c!94500) b!894685))

(assert (= (and d!110763 (not c!94500)) b!894686))

(assert (= (and d!110763 (not res!605475)) b!894687))

(declare-fun m!833165 () Bool)

(assert (=> d!110763 m!833165))

(declare-fun m!833167 () Bool)

(assert (=> b!894685 m!833167))

(assert (=> b!894685 m!833149))

(assert (=> b!894685 m!833149))

(declare-fun m!833169 () Bool)

(assert (=> b!894685 m!833169))

(assert (=> b!894687 m!833149))

(assert (=> b!894687 m!833149))

(assert (=> b!894687 m!833169))

(assert (=> bm!39687 d!110763))

(assert (=> d!110657 d!110659))

(declare-fun d!110765 () Bool)

(assert (=> d!110765 (arrayForallSeekEntryOrOpenFound!0 lt!404027 (_keys!10032 thiss!1181) (mask!25891 thiss!1181))))

(assert (=> d!110765 true))

(declare-fun _$72!113 () Unit!30412)

(assert (=> d!110765 (= (choose!38 (_keys!10032 thiss!1181) (mask!25891 thiss!1181) #b00000000000000000000000000000000 lt!404027) _$72!113)))

(declare-fun bs!25102 () Bool)

(assert (= bs!25102 d!110765))

(assert (=> bs!25102 m!832763))

(assert (=> d!110657 d!110765))

(assert (=> d!110657 d!110715))

(assert (=> d!110645 d!110715))

(declare-fun d!110767 () Bool)

(assert (=> d!110767 (= (apply!403 lt!404149 (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000)) (get!13275 (getValueByKey!446 (toList!5331 lt!404149) (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25103 () Bool)

(assert (= bs!25103 d!110767))

(assert (=> bs!25103 m!832807))

(assert (=> bs!25103 m!833119))

(assert (=> bs!25103 m!833119))

(declare-fun m!833171 () Bool)

(assert (=> bs!25103 m!833171))

(assert (=> b!894484 d!110767))

(declare-fun d!110769 () Bool)

(declare-fun c!94503 () Bool)

(assert (=> d!110769 (= c!94503 ((_ is ValueCellFull!8609) (select (arr!25193 (_values!5304 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499751 () V!29207)

(assert (=> d!110769 (= (get!13276 (select (arr!25193 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1313 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!499751)))

(declare-fun b!894692 () Bool)

(declare-fun get!13277 (ValueCell!8609 V!29207) V!29207)

(assert (=> b!894692 (= e!499751 (get!13277 (select (arr!25193 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1313 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!894693 () Bool)

(declare-fun get!13278 (ValueCell!8609 V!29207) V!29207)

(assert (=> b!894693 (= e!499751 (get!13278 (select (arr!25193 (_values!5304 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1313 (defaultEntry!5317 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110769 c!94503) b!894692))

(assert (= (and d!110769 (not c!94503)) b!894693))

(assert (=> b!894692 m!832859))

(assert (=> b!894692 m!832855))

(declare-fun m!833173 () Bool)

(assert (=> b!894692 m!833173))

(assert (=> b!894693 m!832859))

(assert (=> b!894693 m!832855))

(declare-fun m!833175 () Bool)

(assert (=> b!894693 m!833175))

(assert (=> b!894484 d!110769))

(assert (=> d!110663 d!110643))

(declare-fun d!110771 () Bool)

(declare-fun lt!404275 () SeekEntryResult!8819)

(assert (=> d!110771 (and ((_ is Found!8819) lt!404275) (= (index!37648 lt!404275) lt!404027))))

(assert (=> d!110771 (= lt!404275 (seekEntry!0 key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(assert (=> d!110771 true))

(declare-fun _$57!19 () Unit!30412)

(assert (=> d!110771 (= (choose!0 key!785 lt!404027 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) _$57!19)))

(declare-fun bs!25104 () Bool)

(assert (= bs!25104 d!110771))

(assert (=> bs!25104 m!832767))

(assert (=> d!110663 d!110771))

(assert (=> d!110663 d!110715))

(declare-fun d!110773 () Bool)

(assert (=> d!110773 (= (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027)) (and (not (= (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!894432 d!110773))

(assert (=> d!110639 d!110647))

(declare-fun d!110775 () Bool)

(assert (=> d!110775 (arrayContainsKey!0 (_keys!10032 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110775 true))

(declare-fun _$60!400 () Unit!30412)

(assert (=> d!110775 (= (choose!13 (_keys!10032 thiss!1181) key!785 (index!37648 lt!404023)) _$60!400)))

(declare-fun bs!25105 () Bool)

(assert (= bs!25105 d!110775))

(assert (=> bs!25105 m!832773))

(assert (=> d!110639 d!110775))

(declare-fun d!110777 () Bool)

(assert (=> d!110777 (= (apply!403 lt!404149 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13275 (getValueByKey!446 (toList!5331 lt!404149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25106 () Bool)

(assert (= bs!25106 d!110777))

(assert (=> bs!25106 m!833139))

(assert (=> bs!25106 m!833139))

(declare-fun m!833177 () Bool)

(assert (=> bs!25106 m!833177))

(assert (=> b!894482 d!110777))

(declare-fun d!110779 () Bool)

(assert (=> d!110779 (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404081 #b00000000000000000000000000000000)))

(declare-fun lt!404276 () Unit!30412)

(assert (=> d!110779 (= lt!404276 (choose!13 (_keys!10032 thiss!1181) lt!404081 lt!404027))))

(assert (=> d!110779 (bvsge lt!404027 #b00000000000000000000000000000000)))

(assert (=> d!110779 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10032 thiss!1181) lt!404081 lt!404027) lt!404276)))

(declare-fun bs!25107 () Bool)

(assert (= bs!25107 d!110779))

(assert (=> bs!25107 m!832837))

(declare-fun m!833179 () Bool)

(assert (=> bs!25107 m!833179))

(assert (=> b!894431 d!110779))

(declare-fun d!110781 () Bool)

(declare-fun res!605476 () Bool)

(declare-fun e!499752 () Bool)

(assert (=> d!110781 (=> res!605476 e!499752)))

(assert (=> d!110781 (= res!605476 (= (select (arr!25192 (_keys!10032 thiss!1181)) #b00000000000000000000000000000000) lt!404081))))

(assert (=> d!110781 (= (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404081 #b00000000000000000000000000000000) e!499752)))

(declare-fun b!894694 () Bool)

(declare-fun e!499753 () Bool)

(assert (=> b!894694 (= e!499752 e!499753)))

(declare-fun res!605477 () Bool)

(assert (=> b!894694 (=> (not res!605477) (not e!499753))))

(assert (=> b!894694 (= res!605477 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun b!894695 () Bool)

(assert (=> b!894695 (= e!499753 (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404081 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110781 (not res!605476)) b!894694))

(assert (= (and b!894694 res!605477) b!894695))

(assert (=> d!110781 m!832807))

(declare-fun m!833181 () Bool)

(assert (=> b!894695 m!833181))

(assert (=> b!894431 d!110781))

(declare-fun b!894696 () Bool)

(declare-fun e!499754 () SeekEntryResult!8819)

(declare-fun lt!404278 () SeekEntryResult!8819)

(assert (=> b!894696 (= e!499754 (Found!8819 (index!37649 lt!404278)))))

(declare-fun b!894697 () Bool)

(declare-fun e!499755 () SeekEntryResult!8819)

(assert (=> b!894697 (= e!499755 Undefined!8819)))

(declare-fun b!894698 () Bool)

(assert (=> b!894698 (= e!499755 e!499754)))

(declare-fun lt!404277 () (_ BitVec 64))

(assert (=> b!894698 (= lt!404277 (select (arr!25192 (_keys!10032 thiss!1181)) (index!37649 lt!404278)))))

(declare-fun c!94506 () Bool)

(assert (=> b!894698 (= c!94506 (= lt!404277 (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027)))))

(declare-fun d!110783 () Bool)

(declare-fun lt!404279 () SeekEntryResult!8819)

(assert (=> d!110783 (and (or ((_ is Undefined!8819) lt!404279) (not ((_ is Found!8819) lt!404279)) (and (bvsge (index!37648 lt!404279) #b00000000000000000000000000000000) (bvslt (index!37648 lt!404279) (size!25637 (_keys!10032 thiss!1181))))) (or ((_ is Undefined!8819) lt!404279) ((_ is Found!8819) lt!404279) (not ((_ is MissingZero!8819) lt!404279)) (and (bvsge (index!37647 lt!404279) #b00000000000000000000000000000000) (bvslt (index!37647 lt!404279) (size!25637 (_keys!10032 thiss!1181))))) (or ((_ is Undefined!8819) lt!404279) ((_ is Found!8819) lt!404279) ((_ is MissingZero!8819) lt!404279) (not ((_ is MissingVacant!8819) lt!404279)) (and (bvsge (index!37650 lt!404279) #b00000000000000000000000000000000) (bvslt (index!37650 lt!404279) (size!25637 (_keys!10032 thiss!1181))))) (or ((_ is Undefined!8819) lt!404279) (ite ((_ is Found!8819) lt!404279) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37648 lt!404279)) (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027)) (ite ((_ is MissingZero!8819) lt!404279) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37647 lt!404279)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8819) lt!404279) (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37650 lt!404279)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110783 (= lt!404279 e!499755)))

(declare-fun c!94504 () Bool)

(assert (=> d!110783 (= c!94504 (and ((_ is Intermediate!8819) lt!404278) (undefined!9631 lt!404278)))))

(assert (=> d!110783 (= lt!404278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027) (mask!25891 thiss!1181)) (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(assert (=> d!110783 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110783 (= (seekEntryOrOpen!0 (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) lt!404279)))

(declare-fun b!894699 () Bool)

(declare-fun e!499756 () SeekEntryResult!8819)

(assert (=> b!894699 (= e!499756 (MissingZero!8819 (index!37649 lt!404278)))))

(declare-fun b!894700 () Bool)

(assert (=> b!894700 (= e!499756 (seekKeyOrZeroReturnVacant!0 (x!75933 lt!404278) (index!37649 lt!404278) (index!37649 lt!404278) (select (arr!25192 (_keys!10032 thiss!1181)) lt!404027) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun b!894701 () Bool)

(declare-fun c!94505 () Bool)

(assert (=> b!894701 (= c!94505 (= lt!404277 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894701 (= e!499754 e!499756)))

(assert (= (and d!110783 c!94504) b!894697))

(assert (= (and d!110783 (not c!94504)) b!894698))

(assert (= (and b!894698 c!94506) b!894696))

(assert (= (and b!894698 (not c!94506)) b!894701))

(assert (= (and b!894701 c!94505) b!894699))

(assert (= (and b!894701 (not c!94505)) b!894700))

(declare-fun m!833183 () Bool)

(assert (=> b!894698 m!833183))

(assert (=> d!110783 m!832791))

(declare-fun m!833185 () Bool)

(assert (=> d!110783 m!833185))

(assert (=> d!110783 m!832833))

(declare-fun m!833187 () Bool)

(assert (=> d!110783 m!833187))

(declare-fun m!833189 () Bool)

(assert (=> d!110783 m!833189))

(declare-fun m!833191 () Bool)

(assert (=> d!110783 m!833191))

(assert (=> d!110783 m!832833))

(assert (=> d!110783 m!833185))

(declare-fun m!833193 () Bool)

(assert (=> d!110783 m!833193))

(assert (=> b!894700 m!832833))

(declare-fun m!833195 () Bool)

(assert (=> b!894700 m!833195))

(assert (=> b!894431 d!110783))

(declare-fun b!894720 () Bool)

(declare-fun lt!404284 () SeekEntryResult!8819)

(assert (=> b!894720 (and (bvsge (index!37649 lt!404284) #b00000000000000000000000000000000) (bvslt (index!37649 lt!404284) (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun res!605485 () Bool)

(assert (=> b!894720 (= res!605485 (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37649 lt!404284)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499767 () Bool)

(assert (=> b!894720 (=> res!605485 e!499767)))

(declare-fun b!894721 () Bool)

(assert (=> b!894721 (and (bvsge (index!37649 lt!404284) #b00000000000000000000000000000000) (bvslt (index!37649 lt!404284) (size!25637 (_keys!10032 thiss!1181))))))

(declare-fun res!605484 () Bool)

(assert (=> b!894721 (= res!605484 (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37649 lt!404284)) key!785))))

(assert (=> b!894721 (=> res!605484 e!499767)))

(declare-fun e!499771 () Bool)

(assert (=> b!894721 (= e!499771 e!499767)))

(declare-fun b!894722 () Bool)

(declare-fun e!499768 () SeekEntryResult!8819)

(declare-fun e!499769 () SeekEntryResult!8819)

(assert (=> b!894722 (= e!499768 e!499769)))

(declare-fun c!94513 () Bool)

(declare-fun lt!404285 () (_ BitVec 64))

(assert (=> b!894722 (= c!94513 (or (= lt!404285 key!785) (= (bvadd lt!404285 lt!404285) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!894723 () Bool)

(declare-fun e!499770 () Bool)

(assert (=> b!894723 (= e!499770 (bvsge (x!75933 lt!404284) #b01111111111111111111111111111110))))

(declare-fun b!894724 () Bool)

(assert (=> b!894724 (= e!499769 (Intermediate!8819 false (toIndex!0 key!785 (mask!25891 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894725 () Bool)

(assert (=> b!894725 (and (bvsge (index!37649 lt!404284) #b00000000000000000000000000000000) (bvslt (index!37649 lt!404284) (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> b!894725 (= e!499767 (= (select (arr!25192 (_keys!10032 thiss!1181)) (index!37649 lt!404284)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894726 () Bool)

(assert (=> b!894726 (= e!499769 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25891 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!25891 thiss!1181)) key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun b!894727 () Bool)

(assert (=> b!894727 (= e!499770 e!499771)))

(declare-fun res!605486 () Bool)

(assert (=> b!894727 (= res!605486 (and ((_ is Intermediate!8819) lt!404284) (not (undefined!9631 lt!404284)) (bvslt (x!75933 lt!404284) #b01111111111111111111111111111110) (bvsge (x!75933 lt!404284) #b00000000000000000000000000000000) (bvsge (x!75933 lt!404284) #b00000000000000000000000000000000)))))

(assert (=> b!894727 (=> (not res!605486) (not e!499771))))

(declare-fun d!110785 () Bool)

(assert (=> d!110785 e!499770))

(declare-fun c!94515 () Bool)

(assert (=> d!110785 (= c!94515 (and ((_ is Intermediate!8819) lt!404284) (undefined!9631 lt!404284)))))

(assert (=> d!110785 (= lt!404284 e!499768)))

(declare-fun c!94514 () Bool)

(assert (=> d!110785 (= c!94514 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110785 (= lt!404285 (select (arr!25192 (_keys!10032 thiss!1181)) (toIndex!0 key!785 (mask!25891 thiss!1181))))))

(assert (=> d!110785 (validMask!0 (mask!25891 thiss!1181))))

(assert (=> d!110785 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25891 thiss!1181)) key!785 (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) lt!404284)))

(declare-fun b!894728 () Bool)

(assert (=> b!894728 (= e!499768 (Intermediate!8819 true (toIndex!0 key!785 (mask!25891 thiss!1181)) #b00000000000000000000000000000000))))

(assert (= (and d!110785 c!94514) b!894728))

(assert (= (and d!110785 (not c!94514)) b!894722))

(assert (= (and b!894722 c!94513) b!894724))

(assert (= (and b!894722 (not c!94513)) b!894726))

(assert (= (and d!110785 c!94515) b!894723))

(assert (= (and d!110785 (not c!94515)) b!894727))

(assert (= (and b!894727 res!605486) b!894721))

(assert (= (and b!894721 (not res!605484)) b!894720))

(assert (= (and b!894720 (not res!605485)) b!894725))

(declare-fun m!833197 () Bool)

(assert (=> b!894721 m!833197))

(assert (=> b!894720 m!833197))

(assert (=> d!110785 m!832801))

(declare-fun m!833199 () Bool)

(assert (=> d!110785 m!833199))

(assert (=> d!110785 m!832791))

(assert (=> b!894725 m!833197))

(assert (=> b!894726 m!832801))

(declare-fun m!833201 () Bool)

(assert (=> b!894726 m!833201))

(assert (=> b!894726 m!833201))

(declare-fun m!833203 () Bool)

(assert (=> b!894726 m!833203))

(assert (=> d!110643 d!110785))

(declare-fun d!110787 () Bool)

(declare-fun lt!404291 () (_ BitVec 32))

(declare-fun lt!404290 () (_ BitVec 32))

(assert (=> d!110787 (= lt!404291 (bvmul (bvxor lt!404290 (bvlshr lt!404290 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110787 (= lt!404290 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110787 (and (bvsge (mask!25891 thiss!1181) #b00000000000000000000000000000000) (let ((res!605487 (let ((h!18884 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!75945 (bvmul (bvxor h!18884 (bvlshr h!18884 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!75945 (bvlshr x!75945 #b00000000000000000000000000001101)) (mask!25891 thiss!1181)))))) (and (bvslt res!605487 (bvadd (mask!25891 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605487 #b00000000000000000000000000000000))))))

(assert (=> d!110787 (= (toIndex!0 key!785 (mask!25891 thiss!1181)) (bvand (bvxor lt!404291 (bvlshr lt!404291 #b00000000000000000000000000001101)) (mask!25891 thiss!1181)))))

(assert (=> d!110643 d!110787))

(assert (=> d!110643 d!110715))

(assert (=> d!110665 d!110715))

(declare-fun bm!39704 () Bool)

(declare-fun call!39707 () Bool)

(assert (=> bm!39704 (= call!39707 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!404027 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)))))

(declare-fun d!110789 () Bool)

(declare-fun res!605488 () Bool)

(declare-fun e!499772 () Bool)

(assert (=> d!110789 (=> res!605488 e!499772)))

(assert (=> d!110789 (= res!605488 (bvsge (bvadd lt!404027 #b00000000000000000000000000000001) (size!25637 (_keys!10032 thiss!1181))))))

(assert (=> d!110789 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!404027 #b00000000000000000000000000000001) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) e!499772)))

(declare-fun b!894729 () Bool)

(declare-fun e!499774 () Bool)

(assert (=> b!894729 (= e!499774 call!39707)))

(declare-fun b!894730 () Bool)

(declare-fun e!499773 () Bool)

(assert (=> b!894730 (= e!499774 e!499773)))

(declare-fun lt!404294 () (_ BitVec 64))

(assert (=> b!894730 (= lt!404294 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd lt!404027 #b00000000000000000000000000000001)))))

(declare-fun lt!404292 () Unit!30412)

(assert (=> b!894730 (= lt!404292 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10032 thiss!1181) lt!404294 (bvadd lt!404027 #b00000000000000000000000000000001)))))

(assert (=> b!894730 (arrayContainsKey!0 (_keys!10032 thiss!1181) lt!404294 #b00000000000000000000000000000000)))

(declare-fun lt!404293 () Unit!30412)

(assert (=> b!894730 (= lt!404293 lt!404292)))

(declare-fun res!605489 () Bool)

(assert (=> b!894730 (= res!605489 (= (seekEntryOrOpen!0 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd lt!404027 #b00000000000000000000000000000001)) (_keys!10032 thiss!1181) (mask!25891 thiss!1181)) (Found!8819 (bvadd lt!404027 #b00000000000000000000000000000001))))))

(assert (=> b!894730 (=> (not res!605489) (not e!499773))))

(declare-fun b!894731 () Bool)

(assert (=> b!894731 (= e!499772 e!499774)))

(declare-fun c!94516 () Bool)

(assert (=> b!894731 (= c!94516 (validKeyInArray!0 (select (arr!25192 (_keys!10032 thiss!1181)) (bvadd lt!404027 #b00000000000000000000000000000001))))))

(declare-fun b!894732 () Bool)

(assert (=> b!894732 (= e!499773 call!39707)))

(assert (= (and d!110789 (not res!605488)) b!894731))

(assert (= (and b!894731 c!94516) b!894730))

(assert (= (and b!894731 (not c!94516)) b!894729))

(assert (= (and b!894730 res!605489) b!894732))

(assert (= (or b!894732 b!894729) bm!39704))

(declare-fun m!833205 () Bool)

(assert (=> bm!39704 m!833205))

(declare-fun m!833207 () Bool)

(assert (=> b!894730 m!833207))

(declare-fun m!833209 () Bool)

(assert (=> b!894730 m!833209))

(declare-fun m!833211 () Bool)

(assert (=> b!894730 m!833211))

(assert (=> b!894730 m!833207))

(declare-fun m!833213 () Bool)

(assert (=> b!894730 m!833213))

(assert (=> b!894731 m!833207))

(assert (=> b!894731 m!833207))

(declare-fun m!833215 () Bool)

(assert (=> b!894731 m!833215))

(assert (=> bm!39672 d!110789))

(assert (=> b!894495 d!110673))

(assert (=> b!894438 d!110647))

(declare-fun mapNonEmpty!28843 () Bool)

(declare-fun mapRes!28843 () Bool)

(declare-fun tp!55552 () Bool)

(declare-fun e!499775 () Bool)

(assert (=> mapNonEmpty!28843 (= mapRes!28843 (and tp!55552 e!499775))))

(declare-fun mapValue!28843 () ValueCell!8609)

(declare-fun mapKey!28843 () (_ BitVec 32))

(declare-fun mapRest!28843 () (Array (_ BitVec 32) ValueCell!8609))

(assert (=> mapNonEmpty!28843 (= mapRest!28842 (store mapRest!28843 mapKey!28843 mapValue!28843))))

(declare-fun condMapEmpty!28843 () Bool)

(declare-fun mapDefault!28843 () ValueCell!8609)

(assert (=> mapNonEmpty!28842 (= condMapEmpty!28843 (= mapRest!28842 ((as const (Array (_ BitVec 32) ValueCell!8609)) mapDefault!28843)))))

(declare-fun e!499776 () Bool)

(assert (=> mapNonEmpty!28842 (= tp!55551 (and e!499776 mapRes!28843))))

(declare-fun b!894734 () Bool)

(assert (=> b!894734 (= e!499776 tp_is_empty!18181)))

(declare-fun b!894733 () Bool)

(assert (=> b!894733 (= e!499775 tp_is_empty!18181)))

(declare-fun mapIsEmpty!28843 () Bool)

(assert (=> mapIsEmpty!28843 mapRes!28843))

(assert (= (and mapNonEmpty!28842 condMapEmpty!28843) mapIsEmpty!28843))

(assert (= (and mapNonEmpty!28842 (not condMapEmpty!28843)) mapNonEmpty!28843))

(assert (= (and mapNonEmpty!28843 ((_ is ValueCellFull!8609) mapValue!28843)) b!894733))

(assert (= (and mapNonEmpty!28842 ((_ is ValueCellFull!8609) mapDefault!28843)) b!894734))

(declare-fun m!833217 () Bool)

(assert (=> mapNonEmpty!28843 m!833217))

(declare-fun b_lambda!12941 () Bool)

(assert (= b_lambda!12939 (or (and b!894236 b_free!15853) b_lambda!12941)))

(declare-fun b_lambda!12943 () Bool)

(assert (= b_lambda!12937 (or (and b!894236 b_free!15853) b_lambda!12943)))

(check-sat (not b!894652) (not d!110719) (not d!110779) (not d!110687) (not b!894695) (not b!894598) (not b!894547) (not b!894534) (not d!110723) (not b!894544) (not d!110759) b_and!26141 (not b!894637) (not b!894583) (not bm!39701) (not d!110697) (not b!894595) (not b!894726) (not b!894601) (not b!894578) (not b!894581) (not b!894685) (not d!110675) (not b!894693) (not d!110775) (not d!110725) (not b!894546) (not d!110703) (not b!894669) (not b!894679) (not d!110753) (not b!894576) (not b!894730) (not d!110679) (not b!894731) (not b!894680) (not b!894610) (not b!894532) (not b!894579) (not d!110765) (not d!110709) (not d!110695) (not b!894687) (not b!894545) (not d!110763) (not d!110677) (not b!894531) (not b!894700) (not b!894672) (not d!110777) (not b_lambda!12943) (not b!894572) (not d!110751) (not d!110681) (not b!894607) (not b!894537) (not d!110737) (not d!110693) (not b!894574) (not b!894634) (not d!110691) (not b!894615) (not b_lambda!12931) (not b!894677) (not d!110755) (not b!894617) (not b!894692) (not b_lambda!12941) (not d!110729) (not b!894674) (not b!894612) (not d!110749) (not d!110685) (not b!894684) (not d!110771) (not d!110783) (not d!110705) (not d!110699) (not d!110689) (not b!894645) (not b!894590) (not b!894676) (not d!110733) (not b!894683) (not b!894535) (not bm!39700) (not d!110785) (not d!110767) (not b!894608) (not bm!39704) (not b!894533) (not d!110747) (not b!894580) (not b!894682) (not b!894648) (not mapNonEmpty!28843) (not bm!39702) (not b!894638) (not d!110739) (not d!110683) (not b_lambda!12935) tp_is_empty!18181 (not bm!39703) (not d!110761) (not b!894611) (not b!894675) (not d!110701) (not b!894586) (not b_next!15853))
(check-sat b_and!26141 (not b_next!15853))
