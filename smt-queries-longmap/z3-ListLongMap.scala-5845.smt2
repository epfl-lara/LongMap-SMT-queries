; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75482 () Bool)

(assert start!75482)

(declare-fun b!888185 () Bool)

(declare-fun b_free!15571 () Bool)

(declare-fun b_next!15571 () Bool)

(assert (=> b!888185 (= b_free!15571 (not b_next!15571))))

(declare-fun tp!54664 () Bool)

(declare-fun b_and!25783 () Bool)

(assert (=> b!888185 (= tp!54664 b_and!25783)))

(declare-fun b!888182 () Bool)

(declare-fun e!494890 () Bool)

(declare-fun tp_is_empty!17899 () Bool)

(assert (=> b!888182 (= e!494890 tp_is_empty!17899)))

(declare-fun b!888183 () Bool)

(declare-fun e!494886 () Bool)

(declare-datatypes ((array!51751 0))(
  ( (array!51752 (arr!24887 (Array (_ BitVec 32) (_ BitVec 64))) (size!25330 (_ BitVec 32))) )
))
(declare-datatypes ((V!28831 0))(
  ( (V!28832 (val!9000 Int)) )
))
(declare-datatypes ((ValueCell!8468 0))(
  ( (ValueCellFull!8468 (v!11467 V!28831)) (EmptyCell!8468) )
))
(declare-datatypes ((array!51753 0))(
  ( (array!51754 (arr!24888 (Array (_ BitVec 32) ValueCell!8468)) (size!25331 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3952 0))(
  ( (LongMapFixedSize!3953 (defaultEntry!5170 Int) (mask!25585 (_ BitVec 32)) (extraKeys!4864 (_ BitVec 32)) (zeroValue!4968 V!28831) (minValue!4968 V!28831) (_size!2031 (_ BitVec 32)) (_keys!9844 array!51751) (_values!5155 array!51753) (_vacant!2031 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3952)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!444 0))(
  ( (Some!443 (v!11468 V!28831)) (None!442) )
))
(declare-fun isDefined!319 (Option!444) Bool)

(declare-datatypes ((tuple2!11954 0))(
  ( (tuple2!11955 (_1!5988 (_ BitVec 64)) (_2!5988 V!28831)) )
))
(declare-datatypes ((List!17698 0))(
  ( (Nil!17695) (Cons!17694 (h!18825 tuple2!11954) (t!24986 List!17698)) )
))
(declare-fun getValueByKey!438 (List!17698 (_ BitVec 64)) Option!444)

(declare-datatypes ((ListLongMap!10641 0))(
  ( (ListLongMap!10642 (toList!5336 List!17698)) )
))
(declare-fun map!12094 (LongMapFixedSize!3952) ListLongMap!10641)

(assert (=> b!888183 (= e!494886 (not (isDefined!319 (getValueByKey!438 (toList!5336 (map!12094 thiss!1181)) key!785))))))

(declare-fun b!888184 () Bool)

(declare-fun res!602261 () Bool)

(assert (=> b!888184 (=> (not res!602261) (not e!494886))))

(assert (=> b!888184 (= res!602261 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!602260 () Bool)

(assert (=> start!75482 (=> (not res!602260) (not e!494886))))

(declare-fun valid!1549 (LongMapFixedSize!3952) Bool)

(assert (=> start!75482 (= res!602260 (valid!1549 thiss!1181))))

(assert (=> start!75482 e!494886))

(declare-fun e!494885 () Bool)

(assert (=> start!75482 e!494885))

(assert (=> start!75482 true))

(declare-fun mapIsEmpty!28385 () Bool)

(declare-fun mapRes!28385 () Bool)

(assert (=> mapIsEmpty!28385 mapRes!28385))

(declare-fun e!494887 () Bool)

(declare-fun array_inv!19628 (array!51751) Bool)

(declare-fun array_inv!19629 (array!51753) Bool)

(assert (=> b!888185 (= e!494885 (and tp!54664 tp_is_empty!17899 (array_inv!19628 (_keys!9844 thiss!1181)) (array_inv!19629 (_values!5155 thiss!1181)) e!494887))))

(declare-fun mapNonEmpty!28385 () Bool)

(declare-fun tp!54665 () Bool)

(declare-fun e!494888 () Bool)

(assert (=> mapNonEmpty!28385 (= mapRes!28385 (and tp!54665 e!494888))))

(declare-fun mapRest!28385 () (Array (_ BitVec 32) ValueCell!8468))

(declare-fun mapKey!28385 () (_ BitVec 32))

(declare-fun mapValue!28385 () ValueCell!8468)

(assert (=> mapNonEmpty!28385 (= (arr!24888 (_values!5155 thiss!1181)) (store mapRest!28385 mapKey!28385 mapValue!28385))))

(declare-fun b!888186 () Bool)

(assert (=> b!888186 (= e!494888 tp_is_empty!17899)))

(declare-fun b!888187 () Bool)

(declare-fun res!602262 () Bool)

(assert (=> b!888187 (=> (not res!602262) (not e!494886))))

(declare-fun contains!4299 (LongMapFixedSize!3952 (_ BitVec 64)) Bool)

(assert (=> b!888187 (= res!602262 (contains!4299 thiss!1181 key!785))))

(declare-fun b!888188 () Bool)

(assert (=> b!888188 (= e!494887 (and e!494890 mapRes!28385))))

(declare-fun condMapEmpty!28385 () Bool)

(declare-fun mapDefault!28385 () ValueCell!8468)

(assert (=> b!888188 (= condMapEmpty!28385 (= (arr!24888 (_values!5155 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8468)) mapDefault!28385)))))

(assert (= (and start!75482 res!602260) b!888184))

(assert (= (and b!888184 res!602261) b!888187))

(assert (= (and b!888187 res!602262) b!888183))

(assert (= (and b!888188 condMapEmpty!28385) mapIsEmpty!28385))

(assert (= (and b!888188 (not condMapEmpty!28385)) mapNonEmpty!28385))

(get-info :version)

(assert (= (and mapNonEmpty!28385 ((_ is ValueCellFull!8468) mapValue!28385)) b!888186))

(assert (= (and b!888188 ((_ is ValueCellFull!8468) mapDefault!28385)) b!888182))

(assert (= b!888185 b!888188))

(assert (= start!75482 b!888185))

(declare-fun m!826971 () Bool)

(assert (=> start!75482 m!826971))

(declare-fun m!826973 () Bool)

(assert (=> mapNonEmpty!28385 m!826973))

(declare-fun m!826975 () Bool)

(assert (=> b!888185 m!826975))

(declare-fun m!826977 () Bool)

(assert (=> b!888185 m!826977))

(declare-fun m!826979 () Bool)

(assert (=> b!888183 m!826979))

(declare-fun m!826981 () Bool)

(assert (=> b!888183 m!826981))

(assert (=> b!888183 m!826981))

(declare-fun m!826983 () Bool)

(assert (=> b!888183 m!826983))

(declare-fun m!826985 () Bool)

(assert (=> b!888187 m!826985))

(check-sat (not b!888183) b_and!25783 tp_is_empty!17899 (not b!888187) (not mapNonEmpty!28385) (not b_next!15571) (not b!888185) (not start!75482))
(check-sat b_and!25783 (not b_next!15571))
(get-model)

(declare-fun b!888251 () Bool)

(declare-fun e!494937 () Bool)

(assert (=> b!888251 (= e!494937 false)))

(declare-fun c!93774 () Bool)

(declare-fun call!39426 () Bool)

(assert (=> b!888251 (= c!93774 call!39426)))

(declare-datatypes ((Unit!30209 0))(
  ( (Unit!30210) )
))
(declare-fun lt!401537 () Unit!30209)

(declare-fun e!494939 () Unit!30209)

(assert (=> b!888251 (= lt!401537 e!494939)))

(declare-fun b!888252 () Bool)

(declare-fun e!494941 () Bool)

(assert (=> b!888252 (= e!494941 (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888253 () Bool)

(declare-fun c!93773 () Bool)

(declare-datatypes ((SeekEntryResult!8763 0))(
  ( (MissingZero!8763 (index!37423 (_ BitVec 32))) (Found!8763 (index!37424 (_ BitVec 32))) (Intermediate!8763 (undefined!9575 Bool) (index!37425 (_ BitVec 32)) (x!75378 (_ BitVec 32))) (Undefined!8763) (MissingVacant!8763 (index!37426 (_ BitVec 32))) )
))
(declare-fun lt!401527 () SeekEntryResult!8763)

(assert (=> b!888253 (= c!93773 ((_ is Found!8763) lt!401527))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51751 (_ BitVec 32)) SeekEntryResult!8763)

(assert (=> b!888253 (= lt!401527 (seekEntry!0 key!785 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(assert (=> b!888253 (= e!494941 e!494937)))

(declare-fun d!109849 () Bool)

(declare-fun lt!401538 () Bool)

(declare-fun contains!4300 (ListLongMap!10641 (_ BitVec 64)) Bool)

(assert (=> d!109849 (= lt!401538 (contains!4300 (map!12094 thiss!1181) key!785))))

(declare-fun e!494938 () Bool)

(assert (=> d!109849 (= lt!401538 e!494938)))

(declare-fun c!93776 () Bool)

(assert (=> d!109849 (= c!93776 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109849 (valid!1549 thiss!1181)))

(assert (=> d!109849 (= (contains!4299 thiss!1181 key!785) lt!401538)))

(declare-fun bm!39421 () Bool)

(declare-fun call!39425 () ListLongMap!10641)

(assert (=> bm!39421 (= call!39426 (contains!4300 call!39425 (ite c!93773 (select (arr!24887 (_keys!9844 thiss!1181)) (index!37424 lt!401527)) key!785)))))

(declare-fun b!888254 () Bool)

(assert (=> b!888254 (= e!494938 e!494941)))

(declare-fun c!93777 () Bool)

(assert (=> b!888254 (= c!93777 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888255 () Bool)

(assert (=> b!888255 (= e!494938 (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!888256 () Bool)

(declare-fun e!494940 () Bool)

(assert (=> b!888256 (= e!494940 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!39422 () Bool)

(declare-fun getCurrentListMap!2567 (array!51751 array!51753 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 32) Int) ListLongMap!10641)

(assert (=> bm!39422 (= call!39425 (getCurrentListMap!2567 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun b!888257 () Bool)

(assert (=> b!888257 (= e!494937 true)))

(declare-fun lt!401528 () Unit!30209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51751 (_ BitVec 64) (_ BitVec 32)) Unit!30209)

(assert (=> b!888257 (= lt!401528 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9844 thiss!1181) key!785 (index!37424 lt!401527)))))

(declare-fun call!39424 () Bool)

(assert (=> b!888257 call!39424))

(declare-fun lt!401535 () Unit!30209)

(assert (=> b!888257 (= lt!401535 lt!401528)))

(declare-fun lt!401525 () Unit!30209)

(declare-fun lemmaValidKeyInArrayIsInListMap!203 (array!51751 array!51753 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 32) Int) Unit!30209)

(assert (=> b!888257 (= lt!401525 (lemmaValidKeyInArrayIsInListMap!203 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) (index!37424 lt!401527) (defaultEntry!5170 thiss!1181)))))

(assert (=> b!888257 call!39426))

(declare-fun lt!401529 () Unit!30209)

(assert (=> b!888257 (= lt!401529 lt!401525)))

(declare-fun b!888258 () Bool)

(assert (=> b!888258 (= e!494940 call!39424)))

(declare-fun b!888259 () Bool)

(assert (=> b!888259 false))

(declare-fun lt!401534 () Unit!30209)

(declare-fun lt!401536 () Unit!30209)

(assert (=> b!888259 (= lt!401534 lt!401536)))

(declare-fun lt!401539 () SeekEntryResult!8763)

(declare-fun lt!401532 () (_ BitVec 32))

(assert (=> b!888259 (and ((_ is Found!8763) lt!401539) (= (index!37424 lt!401539) lt!401532))))

(assert (=> b!888259 (= lt!401539 (seekEntry!0 key!785 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51751 (_ BitVec 32)) Unit!30209)

(assert (=> b!888259 (= lt!401536 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401532 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(declare-fun lt!401533 () Unit!30209)

(declare-fun lt!401530 () Unit!30209)

(assert (=> b!888259 (= lt!401533 lt!401530)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51751 (_ BitVec 32)) Bool)

(assert (=> b!888259 (arrayForallSeekEntryOrOpenFound!0 lt!401532 (_keys!9844 thiss!1181) (mask!25585 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30209)

(assert (=> b!888259 (= lt!401530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9844 thiss!1181) (mask!25585 thiss!1181) #b00000000000000000000000000000000 lt!401532))))

(declare-fun arrayScanForKey!0 (array!51751 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888259 (= lt!401532 (arrayScanForKey!0 (_keys!9844 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!401531 () Unit!30209)

(declare-fun lt!401526 () Unit!30209)

(assert (=> b!888259 (= lt!401531 lt!401526)))

(assert (=> b!888259 e!494940))

(declare-fun c!93775 () Bool)

(assert (=> b!888259 (= c!93775 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!165 (array!51751 array!51753 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 64) Int) Unit!30209)

(assert (=> b!888259 (= lt!401526 (lemmaKeyInListMapIsInArray!165 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) key!785 (defaultEntry!5170 thiss!1181)))))

(declare-fun Unit!30211 () Unit!30209)

(assert (=> b!888259 (= e!494939 Unit!30211)))

(declare-fun bm!39423 () Bool)

(declare-fun arrayContainsKey!0 (array!51751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39423 (= call!39424 (arrayContainsKey!0 (_keys!9844 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!888260 () Bool)

(declare-fun Unit!30212 () Unit!30209)

(assert (=> b!888260 (= e!494939 Unit!30212)))

(assert (= (and d!109849 c!93776) b!888255))

(assert (= (and d!109849 (not c!93776)) b!888254))

(assert (= (and b!888254 c!93777) b!888252))

(assert (= (and b!888254 (not c!93777)) b!888253))

(assert (= (and b!888253 c!93773) b!888257))

(assert (= (and b!888253 (not c!93773)) b!888251))

(assert (= (and b!888251 c!93774) b!888259))

(assert (= (and b!888251 (not c!93774)) b!888260))

(assert (= (and b!888259 c!93775) b!888258))

(assert (= (and b!888259 (not c!93775)) b!888256))

(assert (= (or b!888257 b!888258) bm!39423))

(assert (= (or b!888257 b!888251) bm!39422))

(assert (= (or b!888257 b!888251) bm!39421))

(declare-fun m!827019 () Bool)

(assert (=> b!888253 m!827019))

(declare-fun m!827021 () Bool)

(assert (=> bm!39421 m!827021))

(declare-fun m!827023 () Bool)

(assert (=> bm!39421 m!827023))

(declare-fun m!827025 () Bool)

(assert (=> bm!39423 m!827025))

(declare-fun m!827027 () Bool)

(assert (=> bm!39422 m!827027))

(assert (=> d!109849 m!826979))

(assert (=> d!109849 m!826979))

(declare-fun m!827029 () Bool)

(assert (=> d!109849 m!827029))

(assert (=> d!109849 m!826971))

(declare-fun m!827031 () Bool)

(assert (=> b!888259 m!827031))

(declare-fun m!827033 () Bool)

(assert (=> b!888259 m!827033))

(declare-fun m!827035 () Bool)

(assert (=> b!888259 m!827035))

(assert (=> b!888259 m!827019))

(declare-fun m!827037 () Bool)

(assert (=> b!888259 m!827037))

(declare-fun m!827039 () Bool)

(assert (=> b!888259 m!827039))

(declare-fun m!827041 () Bool)

(assert (=> b!888257 m!827041))

(declare-fun m!827043 () Bool)

(assert (=> b!888257 m!827043))

(assert (=> b!888187 d!109849))

(declare-fun d!109851 () Bool)

(declare-fun isEmpty!681 (Option!444) Bool)

(assert (=> d!109851 (= (isDefined!319 (getValueByKey!438 (toList!5336 (map!12094 thiss!1181)) key!785)) (not (isEmpty!681 (getValueByKey!438 (toList!5336 (map!12094 thiss!1181)) key!785))))))

(declare-fun bs!24886 () Bool)

(assert (= bs!24886 d!109851))

(assert (=> bs!24886 m!826981))

(declare-fun m!827045 () Bool)

(assert (=> bs!24886 m!827045))

(assert (=> b!888183 d!109851))

(declare-fun b!888269 () Bool)

(declare-fun e!494946 () Option!444)

(assert (=> b!888269 (= e!494946 (Some!443 (_2!5988 (h!18825 (toList!5336 (map!12094 thiss!1181))))))))

(declare-fun b!888270 () Bool)

(declare-fun e!494947 () Option!444)

(assert (=> b!888270 (= e!494946 e!494947)))

(declare-fun c!93783 () Bool)

(assert (=> b!888270 (= c!93783 (and ((_ is Cons!17694) (toList!5336 (map!12094 thiss!1181))) (not (= (_1!5988 (h!18825 (toList!5336 (map!12094 thiss!1181)))) key!785))))))

(declare-fun d!109853 () Bool)

(declare-fun c!93782 () Bool)

(assert (=> d!109853 (= c!93782 (and ((_ is Cons!17694) (toList!5336 (map!12094 thiss!1181))) (= (_1!5988 (h!18825 (toList!5336 (map!12094 thiss!1181)))) key!785)))))

(assert (=> d!109853 (= (getValueByKey!438 (toList!5336 (map!12094 thiss!1181)) key!785) e!494946)))

(declare-fun b!888272 () Bool)

(assert (=> b!888272 (= e!494947 None!442)))

(declare-fun b!888271 () Bool)

(assert (=> b!888271 (= e!494947 (getValueByKey!438 (t!24986 (toList!5336 (map!12094 thiss!1181))) key!785))))

(assert (= (and d!109853 c!93782) b!888269))

(assert (= (and d!109853 (not c!93782)) b!888270))

(assert (= (and b!888270 c!93783) b!888271))

(assert (= (and b!888270 (not c!93783)) b!888272))

(declare-fun m!827047 () Bool)

(assert (=> b!888271 m!827047))

(assert (=> b!888183 d!109853))

(declare-fun d!109855 () Bool)

(assert (=> d!109855 (= (map!12094 thiss!1181) (getCurrentListMap!2567 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun bs!24887 () Bool)

(assert (= bs!24887 d!109855))

(assert (=> bs!24887 m!827027))

(assert (=> b!888183 d!109855))

(declare-fun d!109857 () Bool)

(assert (=> d!109857 (= (array_inv!19628 (_keys!9844 thiss!1181)) (bvsge (size!25330 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888185 d!109857))

(declare-fun d!109859 () Bool)

(assert (=> d!109859 (= (array_inv!19629 (_values!5155 thiss!1181)) (bvsge (size!25331 (_values!5155 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888185 d!109859))

(declare-fun d!109861 () Bool)

(declare-fun res!602287 () Bool)

(declare-fun e!494950 () Bool)

(assert (=> d!109861 (=> (not res!602287) (not e!494950))))

(declare-fun simpleValid!290 (LongMapFixedSize!3952) Bool)

(assert (=> d!109861 (= res!602287 (simpleValid!290 thiss!1181))))

(assert (=> d!109861 (= (valid!1549 thiss!1181) e!494950)))

(declare-fun b!888279 () Bool)

(declare-fun res!602288 () Bool)

(assert (=> b!888279 (=> (not res!602288) (not e!494950))))

(declare-fun arrayCountValidKeys!0 (array!51751 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888279 (= res!602288 (= (arrayCountValidKeys!0 (_keys!9844 thiss!1181) #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))) (_size!2031 thiss!1181)))))

(declare-fun b!888280 () Bool)

(declare-fun res!602289 () Bool)

(assert (=> b!888280 (=> (not res!602289) (not e!494950))))

(assert (=> b!888280 (= res!602289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(declare-fun b!888281 () Bool)

(declare-datatypes ((List!17700 0))(
  ( (Nil!17697) (Cons!17696 (h!18827 (_ BitVec 64)) (t!24988 List!17700)) )
))
(declare-fun arrayNoDuplicates!0 (array!51751 (_ BitVec 32) List!17700) Bool)

(assert (=> b!888281 (= e!494950 (arrayNoDuplicates!0 (_keys!9844 thiss!1181) #b00000000000000000000000000000000 Nil!17697))))

(assert (= (and d!109861 res!602287) b!888279))

(assert (= (and b!888279 res!602288) b!888280))

(assert (= (and b!888280 res!602289) b!888281))

(declare-fun m!827049 () Bool)

(assert (=> d!109861 m!827049))

(declare-fun m!827051 () Bool)

(assert (=> b!888279 m!827051))

(declare-fun m!827053 () Bool)

(assert (=> b!888280 m!827053))

(declare-fun m!827055 () Bool)

(assert (=> b!888281 m!827055))

(assert (=> start!75482 d!109861))

(declare-fun mapIsEmpty!28394 () Bool)

(declare-fun mapRes!28394 () Bool)

(assert (=> mapIsEmpty!28394 mapRes!28394))

(declare-fun condMapEmpty!28394 () Bool)

(declare-fun mapDefault!28394 () ValueCell!8468)

(assert (=> mapNonEmpty!28385 (= condMapEmpty!28394 (= mapRest!28385 ((as const (Array (_ BitVec 32) ValueCell!8468)) mapDefault!28394)))))

(declare-fun e!494955 () Bool)

(assert (=> mapNonEmpty!28385 (= tp!54665 (and e!494955 mapRes!28394))))

(declare-fun b!888289 () Bool)

(assert (=> b!888289 (= e!494955 tp_is_empty!17899)))

(declare-fun mapNonEmpty!28394 () Bool)

(declare-fun tp!54680 () Bool)

(declare-fun e!494956 () Bool)

(assert (=> mapNonEmpty!28394 (= mapRes!28394 (and tp!54680 e!494956))))

(declare-fun mapRest!28394 () (Array (_ BitVec 32) ValueCell!8468))

(declare-fun mapValue!28394 () ValueCell!8468)

(declare-fun mapKey!28394 () (_ BitVec 32))

(assert (=> mapNonEmpty!28394 (= mapRest!28385 (store mapRest!28394 mapKey!28394 mapValue!28394))))

(declare-fun b!888288 () Bool)

(assert (=> b!888288 (= e!494956 tp_is_empty!17899)))

(assert (= (and mapNonEmpty!28385 condMapEmpty!28394) mapIsEmpty!28394))

(assert (= (and mapNonEmpty!28385 (not condMapEmpty!28394)) mapNonEmpty!28394))

(assert (= (and mapNonEmpty!28394 ((_ is ValueCellFull!8468) mapValue!28394)) b!888288))

(assert (= (and mapNonEmpty!28385 ((_ is ValueCellFull!8468) mapDefault!28394)) b!888289))

(declare-fun m!827057 () Bool)

(assert (=> mapNonEmpty!28394 m!827057))

(check-sat (not b!888259) (not b!888281) (not b!888280) (not d!109851) b_and!25783 tp_is_empty!17899 (not b!888253) (not mapNonEmpty!28394) (not d!109861) (not b!888279) (not d!109849) (not bm!39423) (not b!888271) (not bm!39422) (not bm!39421) (not d!109855) (not b_next!15571) (not b!888257))
(check-sat b_and!25783 (not b_next!15571))
(get-model)

(declare-fun b!888332 () Bool)

(declare-fun e!494994 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!888332 (= e!494994 (validKeyInArray!0 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888333 () Bool)

(declare-fun e!494983 () ListLongMap!10641)

(declare-fun call!39444 () ListLongMap!10641)

(assert (=> b!888333 (= e!494983 call!39444)))

(declare-fun bm!39438 () Bool)

(declare-fun call!39446 () ListLongMap!10641)

(declare-fun call!39442 () ListLongMap!10641)

(assert (=> bm!39438 (= call!39446 call!39442)))

(declare-fun b!888334 () Bool)

(declare-fun e!494995 () Bool)

(declare-fun call!39445 () Bool)

(assert (=> b!888334 (= e!494995 (not call!39445))))

(declare-fun b!888335 () Bool)

(declare-fun e!494989 () Bool)

(assert (=> b!888335 (= e!494989 (validKeyInArray!0 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888337 () Bool)

(declare-fun e!494985 () Bool)

(declare-fun e!494990 () Bool)

(assert (=> b!888337 (= e!494985 e!494990)))

(declare-fun res!602314 () Bool)

(declare-fun call!39447 () Bool)

(assert (=> b!888337 (= res!602314 call!39447)))

(assert (=> b!888337 (=> (not res!602314) (not e!494990))))

(declare-fun bm!39439 () Bool)

(declare-fun call!39441 () ListLongMap!10641)

(declare-fun getCurrentListMapNoExtraKeys!3309 (array!51751 array!51753 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 32) Int) ListLongMap!10641)

(assert (=> bm!39439 (= call!39441 (getCurrentListMapNoExtraKeys!3309 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun b!888338 () Bool)

(declare-fun res!602309 () Bool)

(declare-fun e!494984 () Bool)

(assert (=> b!888338 (=> (not res!602309) (not e!494984))))

(declare-fun e!494986 () Bool)

(assert (=> b!888338 (= res!602309 e!494986)))

(declare-fun res!602313 () Bool)

(assert (=> b!888338 (=> res!602313 e!494986)))

(assert (=> b!888338 (= res!602313 (not e!494994))))

(declare-fun res!602311 () Bool)

(assert (=> b!888338 (=> (not res!602311) (not e!494994))))

(assert (=> b!888338 (= res!602311 (bvslt #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))))))

(declare-fun b!888339 () Bool)

(declare-fun e!494993 () ListLongMap!10641)

(declare-fun call!39443 () ListLongMap!10641)

(declare-fun +!2612 (ListLongMap!10641 tuple2!11954) ListLongMap!10641)

(assert (=> b!888339 (= e!494993 (+!2612 call!39443 (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4968 thiss!1181))))))

(declare-fun b!888340 () Bool)

(declare-fun c!93797 () Bool)

(assert (=> b!888340 (= c!93797 (and (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!494992 () ListLongMap!10641)

(assert (=> b!888340 (= e!494992 e!494983)))

(declare-fun b!888341 () Bool)

(declare-fun lt!401591 () ListLongMap!10641)

(declare-fun apply!397 (ListLongMap!10641 (_ BitVec 64)) V!28831)

(assert (=> b!888341 (= e!494990 (= (apply!397 lt!401591 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4968 thiss!1181)))))

(declare-fun b!888342 () Bool)

(declare-fun res!602312 () Bool)

(assert (=> b!888342 (=> (not res!602312) (not e!494984))))

(assert (=> b!888342 (= res!602312 e!494995)))

(declare-fun c!93798 () Bool)

(assert (=> b!888342 (= c!93798 (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39440 () Bool)

(assert (=> bm!39440 (= call!39444 call!39443)))

(declare-fun b!888343 () Bool)

(assert (=> b!888343 (= e!494992 call!39444)))

(declare-fun b!888336 () Bool)

(declare-fun e!494991 () Bool)

(assert (=> b!888336 (= e!494995 e!494991)))

(declare-fun res!602316 () Bool)

(assert (=> b!888336 (= res!602316 call!39445)))

(assert (=> b!888336 (=> (not res!602316) (not e!494991))))

(declare-fun d!109863 () Bool)

(assert (=> d!109863 e!494984))

(declare-fun res!602315 () Bool)

(assert (=> d!109863 (=> (not res!602315) (not e!494984))))

(assert (=> d!109863 (= res!602315 (or (bvsge #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))))))))

(declare-fun lt!401598 () ListLongMap!10641)

(assert (=> d!109863 (= lt!401591 lt!401598)))

(declare-fun lt!401592 () Unit!30209)

(declare-fun e!494988 () Unit!30209)

(assert (=> d!109863 (= lt!401592 e!494988)))

(declare-fun c!93800 () Bool)

(assert (=> d!109863 (= c!93800 e!494989)))

(declare-fun res!602310 () Bool)

(assert (=> d!109863 (=> (not res!602310) (not e!494989))))

(assert (=> d!109863 (= res!602310 (bvslt #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))))))

(assert (=> d!109863 (= lt!401598 e!494993)))

(declare-fun c!93799 () Bool)

(assert (=> d!109863 (= c!93799 (and (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!109863 (validMask!0 (mask!25585 thiss!1181))))

(assert (=> d!109863 (= (getCurrentListMap!2567 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)) lt!401591)))

(declare-fun b!888344 () Bool)

(assert (=> b!888344 (= e!494991 (= (apply!397 lt!401591 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4968 thiss!1181)))))

(declare-fun c!93796 () Bool)

(declare-fun bm!39441 () Bool)

(assert (=> bm!39441 (= call!39443 (+!2612 (ite c!93799 call!39441 (ite c!93796 call!39442 call!39446)) (ite (or c!93799 c!93796) (tuple2!11955 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4968 thiss!1181)) (tuple2!11955 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4968 thiss!1181)))))))

(declare-fun b!888345 () Bool)

(assert (=> b!888345 (= e!494984 e!494985)))

(declare-fun c!93801 () Bool)

(assert (=> b!888345 (= c!93801 (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888346 () Bool)

(assert (=> b!888346 (= e!494985 (not call!39447))))

(declare-fun b!888347 () Bool)

(declare-fun e!494987 () Bool)

(assert (=> b!888347 (= e!494986 e!494987)))

(declare-fun res!602308 () Bool)

(assert (=> b!888347 (=> (not res!602308) (not e!494987))))

(assert (=> b!888347 (= res!602308 (contains!4300 lt!401591 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!888347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))))))

(declare-fun bm!39442 () Bool)

(assert (=> bm!39442 (= call!39442 call!39441)))

(declare-fun bm!39443 () Bool)

(assert (=> bm!39443 (= call!39447 (contains!4300 lt!401591 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888348 () Bool)

(declare-fun get!13151 (ValueCell!8468 V!28831) V!28831)

(declare-fun dynLambda!1288 (Int (_ BitVec 64)) V!28831)

(assert (=> b!888348 (= e!494987 (= (apply!397 lt!401591 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)) (get!13151 (select (arr!24888 (_values!5155 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1288 (defaultEntry!5170 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!888348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25331 (_values!5155 thiss!1181))))))

(assert (=> b!888348 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))))))

(declare-fun b!888349 () Bool)

(assert (=> b!888349 (= e!494993 e!494992)))

(assert (=> b!888349 (= c!93796 (and (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39444 () Bool)

(assert (=> bm!39444 (= call!39445 (contains!4300 lt!401591 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888350 () Bool)

(declare-fun Unit!30213 () Unit!30209)

(assert (=> b!888350 (= e!494988 Unit!30213)))

(declare-fun b!888351 () Bool)

(declare-fun lt!401599 () Unit!30209)

(assert (=> b!888351 (= e!494988 lt!401599)))

(declare-fun lt!401587 () ListLongMap!10641)

(assert (=> b!888351 (= lt!401587 (getCurrentListMapNoExtraKeys!3309 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun lt!401588 () (_ BitVec 64))

(assert (=> b!888351 (= lt!401588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401586 () (_ BitVec 64))

(assert (=> b!888351 (= lt!401586 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401593 () Unit!30209)

(declare-fun addStillContains!327 (ListLongMap!10641 (_ BitVec 64) V!28831 (_ BitVec 64)) Unit!30209)

(assert (=> b!888351 (= lt!401593 (addStillContains!327 lt!401587 lt!401588 (zeroValue!4968 thiss!1181) lt!401586))))

(assert (=> b!888351 (contains!4300 (+!2612 lt!401587 (tuple2!11955 lt!401588 (zeroValue!4968 thiss!1181))) lt!401586)))

(declare-fun lt!401596 () Unit!30209)

(assert (=> b!888351 (= lt!401596 lt!401593)))

(declare-fun lt!401603 () ListLongMap!10641)

(assert (=> b!888351 (= lt!401603 (getCurrentListMapNoExtraKeys!3309 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun lt!401602 () (_ BitVec 64))

(assert (=> b!888351 (= lt!401602 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401605 () (_ BitVec 64))

(assert (=> b!888351 (= lt!401605 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401584 () Unit!30209)

(declare-fun addApplyDifferent!327 (ListLongMap!10641 (_ BitVec 64) V!28831 (_ BitVec 64)) Unit!30209)

(assert (=> b!888351 (= lt!401584 (addApplyDifferent!327 lt!401603 lt!401602 (minValue!4968 thiss!1181) lt!401605))))

(assert (=> b!888351 (= (apply!397 (+!2612 lt!401603 (tuple2!11955 lt!401602 (minValue!4968 thiss!1181))) lt!401605) (apply!397 lt!401603 lt!401605))))

(declare-fun lt!401595 () Unit!30209)

(assert (=> b!888351 (= lt!401595 lt!401584)))

(declare-fun lt!401601 () ListLongMap!10641)

(assert (=> b!888351 (= lt!401601 (getCurrentListMapNoExtraKeys!3309 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun lt!401589 () (_ BitVec 64))

(assert (=> b!888351 (= lt!401589 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401597 () (_ BitVec 64))

(assert (=> b!888351 (= lt!401597 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401585 () Unit!30209)

(assert (=> b!888351 (= lt!401585 (addApplyDifferent!327 lt!401601 lt!401589 (zeroValue!4968 thiss!1181) lt!401597))))

(assert (=> b!888351 (= (apply!397 (+!2612 lt!401601 (tuple2!11955 lt!401589 (zeroValue!4968 thiss!1181))) lt!401597) (apply!397 lt!401601 lt!401597))))

(declare-fun lt!401590 () Unit!30209)

(assert (=> b!888351 (= lt!401590 lt!401585)))

(declare-fun lt!401604 () ListLongMap!10641)

(assert (=> b!888351 (= lt!401604 (getCurrentListMapNoExtraKeys!3309 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun lt!401594 () (_ BitVec 64))

(assert (=> b!888351 (= lt!401594 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401600 () (_ BitVec 64))

(assert (=> b!888351 (= lt!401600 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888351 (= lt!401599 (addApplyDifferent!327 lt!401604 lt!401594 (minValue!4968 thiss!1181) lt!401600))))

(assert (=> b!888351 (= (apply!397 (+!2612 lt!401604 (tuple2!11955 lt!401594 (minValue!4968 thiss!1181))) lt!401600) (apply!397 lt!401604 lt!401600))))

(declare-fun b!888352 () Bool)

(assert (=> b!888352 (= e!494983 call!39446)))

(assert (= (and d!109863 c!93799) b!888339))

(assert (= (and d!109863 (not c!93799)) b!888349))

(assert (= (and b!888349 c!93796) b!888343))

(assert (= (and b!888349 (not c!93796)) b!888340))

(assert (= (and b!888340 c!93797) b!888333))

(assert (= (and b!888340 (not c!93797)) b!888352))

(assert (= (or b!888333 b!888352) bm!39438))

(assert (= (or b!888343 bm!39438) bm!39442))

(assert (= (or b!888343 b!888333) bm!39440))

(assert (= (or b!888339 bm!39442) bm!39439))

(assert (= (or b!888339 bm!39440) bm!39441))

(assert (= (and d!109863 res!602310) b!888335))

(assert (= (and d!109863 c!93800) b!888351))

(assert (= (and d!109863 (not c!93800)) b!888350))

(assert (= (and d!109863 res!602315) b!888338))

(assert (= (and b!888338 res!602311) b!888332))

(assert (= (and b!888338 (not res!602313)) b!888347))

(assert (= (and b!888347 res!602308) b!888348))

(assert (= (and b!888338 res!602309) b!888342))

(assert (= (and b!888342 c!93798) b!888336))

(assert (= (and b!888342 (not c!93798)) b!888334))

(assert (= (and b!888336 res!602316) b!888344))

(assert (= (or b!888336 b!888334) bm!39444))

(assert (= (and b!888342 res!602312) b!888345))

(assert (= (and b!888345 c!93801) b!888337))

(assert (= (and b!888345 (not c!93801)) b!888346))

(assert (= (and b!888337 res!602314) b!888341))

(assert (= (or b!888337 b!888346) bm!39443))

(declare-fun b_lambda!12861 () Bool)

(assert (=> (not b_lambda!12861) (not b!888348)))

(declare-fun t!24990 () Bool)

(declare-fun tb!5141 () Bool)

(assert (=> (and b!888185 (= (defaultEntry!5170 thiss!1181) (defaultEntry!5170 thiss!1181)) t!24990) tb!5141))

(declare-fun result!9993 () Bool)

(assert (=> tb!5141 (= result!9993 tp_is_empty!17899)))

(assert (=> b!888348 t!24990))

(declare-fun b_and!25789 () Bool)

(assert (= b_and!25783 (and (=> t!24990 result!9993) b_and!25789)))

(declare-fun m!827059 () Bool)

(assert (=> d!109863 m!827059))

(declare-fun m!827061 () Bool)

(assert (=> b!888347 m!827061))

(assert (=> b!888347 m!827061))

(declare-fun m!827063 () Bool)

(assert (=> b!888347 m!827063))

(assert (=> b!888348 m!827061))

(assert (=> b!888348 m!827061))

(declare-fun m!827065 () Bool)

(assert (=> b!888348 m!827065))

(declare-fun m!827067 () Bool)

(assert (=> b!888348 m!827067))

(declare-fun m!827069 () Bool)

(assert (=> b!888348 m!827069))

(assert (=> b!888348 m!827067))

(assert (=> b!888348 m!827069))

(declare-fun m!827071 () Bool)

(assert (=> b!888348 m!827071))

(declare-fun m!827073 () Bool)

(assert (=> bm!39444 m!827073))

(declare-fun m!827075 () Bool)

(assert (=> b!888339 m!827075))

(declare-fun m!827077 () Bool)

(assert (=> b!888341 m!827077))

(declare-fun m!827079 () Bool)

(assert (=> bm!39439 m!827079))

(declare-fun m!827081 () Bool)

(assert (=> b!888344 m!827081))

(assert (=> b!888335 m!827061))

(assert (=> b!888335 m!827061))

(declare-fun m!827083 () Bool)

(assert (=> b!888335 m!827083))

(declare-fun m!827085 () Bool)

(assert (=> bm!39443 m!827085))

(declare-fun m!827087 () Bool)

(assert (=> bm!39441 m!827087))

(assert (=> b!888332 m!827061))

(assert (=> b!888332 m!827061))

(assert (=> b!888332 m!827083))

(declare-fun m!827089 () Bool)

(assert (=> b!888351 m!827089))

(declare-fun m!827091 () Bool)

(assert (=> b!888351 m!827091))

(declare-fun m!827093 () Bool)

(assert (=> b!888351 m!827093))

(assert (=> b!888351 m!827093))

(declare-fun m!827095 () Bool)

(assert (=> b!888351 m!827095))

(assert (=> b!888351 m!827089))

(declare-fun m!827097 () Bool)

(assert (=> b!888351 m!827097))

(declare-fun m!827099 () Bool)

(assert (=> b!888351 m!827099))

(assert (=> b!888351 m!827097))

(declare-fun m!827101 () Bool)

(assert (=> b!888351 m!827101))

(assert (=> b!888351 m!827061))

(declare-fun m!827103 () Bool)

(assert (=> b!888351 m!827103))

(declare-fun m!827105 () Bool)

(assert (=> b!888351 m!827105))

(declare-fun m!827107 () Bool)

(assert (=> b!888351 m!827107))

(assert (=> b!888351 m!827105))

(declare-fun m!827109 () Bool)

(assert (=> b!888351 m!827109))

(declare-fun m!827111 () Bool)

(assert (=> b!888351 m!827111))

(assert (=> b!888351 m!827079))

(declare-fun m!827113 () Bool)

(assert (=> b!888351 m!827113))

(declare-fun m!827115 () Bool)

(assert (=> b!888351 m!827115))

(declare-fun m!827117 () Bool)

(assert (=> b!888351 m!827117))

(assert (=> bm!39422 d!109863))

(declare-fun d!109865 () Bool)

(assert (=> d!109865 (= (isEmpty!681 (getValueByKey!438 (toList!5336 (map!12094 thiss!1181)) key!785)) (not ((_ is Some!443) (getValueByKey!438 (toList!5336 (map!12094 thiss!1181)) key!785))))))

(assert (=> d!109851 d!109865))

(declare-fun d!109867 () Bool)

(assert (=> d!109867 (arrayContainsKey!0 (_keys!9844 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!401608 () Unit!30209)

(declare-fun choose!13 (array!51751 (_ BitVec 64) (_ BitVec 32)) Unit!30209)

(assert (=> d!109867 (= lt!401608 (choose!13 (_keys!9844 thiss!1181) key!785 (index!37424 lt!401527)))))

(assert (=> d!109867 (bvsge (index!37424 lt!401527) #b00000000000000000000000000000000)))

(assert (=> d!109867 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9844 thiss!1181) key!785 (index!37424 lt!401527)) lt!401608)))

(declare-fun bs!24888 () Bool)

(assert (= bs!24888 d!109867))

(assert (=> bs!24888 m!827025))

(declare-fun m!827119 () Bool)

(assert (=> bs!24888 m!827119))

(assert (=> b!888257 d!109867))

(declare-fun d!109869 () Bool)

(declare-fun e!494998 () Bool)

(assert (=> d!109869 e!494998))

(declare-fun res!602319 () Bool)

(assert (=> d!109869 (=> (not res!602319) (not e!494998))))

(assert (=> d!109869 (= res!602319 (and (bvsge (index!37424 lt!401527) #b00000000000000000000000000000000) (bvslt (index!37424 lt!401527) (size!25330 (_keys!9844 thiss!1181)))))))

(declare-fun lt!401611 () Unit!30209)

(declare-fun choose!1467 (array!51751 array!51753 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 32) Int) Unit!30209)

(assert (=> d!109869 (= lt!401611 (choose!1467 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) (index!37424 lt!401527) (defaultEntry!5170 thiss!1181)))))

(assert (=> d!109869 (validMask!0 (mask!25585 thiss!1181))))

(assert (=> d!109869 (= (lemmaValidKeyInArrayIsInListMap!203 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) (index!37424 lt!401527) (defaultEntry!5170 thiss!1181)) lt!401611)))

(declare-fun b!888357 () Bool)

(assert (=> b!888357 (= e!494998 (contains!4300 (getCurrentListMap!2567 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)) (select (arr!24887 (_keys!9844 thiss!1181)) (index!37424 lt!401527))))))

(assert (= (and d!109869 res!602319) b!888357))

(declare-fun m!827121 () Bool)

(assert (=> d!109869 m!827121))

(assert (=> d!109869 m!827059))

(assert (=> b!888357 m!827027))

(assert (=> b!888357 m!827021))

(assert (=> b!888357 m!827027))

(assert (=> b!888357 m!827021))

(declare-fun m!827123 () Bool)

(assert (=> b!888357 m!827123))

(assert (=> b!888257 d!109869))

(declare-fun d!109871 () Bool)

(declare-fun e!495001 () Bool)

(assert (=> d!109871 e!495001))

(declare-fun c!93804 () Bool)

(assert (=> d!109871 (= c!93804 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401614 () Unit!30209)

(declare-fun choose!1468 (array!51751 array!51753 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 64) Int) Unit!30209)

(assert (=> d!109871 (= lt!401614 (choose!1468 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) key!785 (defaultEntry!5170 thiss!1181)))))

(assert (=> d!109871 (validMask!0 (mask!25585 thiss!1181))))

(assert (=> d!109871 (= (lemmaKeyInListMapIsInArray!165 (_keys!9844 thiss!1181) (_values!5155 thiss!1181) (mask!25585 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) key!785 (defaultEntry!5170 thiss!1181)) lt!401614)))

(declare-fun b!888362 () Bool)

(assert (=> b!888362 (= e!495001 (arrayContainsKey!0 (_keys!9844 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!888363 () Bool)

(assert (=> b!888363 (= e!495001 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!109871 c!93804) b!888362))

(assert (= (and d!109871 (not c!93804)) b!888363))

(declare-fun m!827125 () Bool)

(assert (=> d!109871 m!827125))

(assert (=> d!109871 m!827059))

(assert (=> b!888362 m!827025))

(assert (=> b!888259 d!109871))

(declare-fun d!109873 () Bool)

(declare-fun lt!401617 () (_ BitVec 32))

(assert (=> d!109873 (and (or (bvslt lt!401617 #b00000000000000000000000000000000) (bvsge lt!401617 (size!25330 (_keys!9844 thiss!1181))) (and (bvsge lt!401617 #b00000000000000000000000000000000) (bvslt lt!401617 (size!25330 (_keys!9844 thiss!1181))))) (bvsge lt!401617 #b00000000000000000000000000000000) (bvslt lt!401617 (size!25330 (_keys!9844 thiss!1181))) (= (select (arr!24887 (_keys!9844 thiss!1181)) lt!401617) key!785))))

(declare-fun e!495004 () (_ BitVec 32))

(assert (=> d!109873 (= lt!401617 e!495004)))

(declare-fun c!93807 () Bool)

(assert (=> d!109873 (= c!93807 (= (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!109873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))) (bvslt (size!25330 (_keys!9844 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!109873 (= (arrayScanForKey!0 (_keys!9844 thiss!1181) key!785 #b00000000000000000000000000000000) lt!401617)))

(declare-fun b!888368 () Bool)

(assert (=> b!888368 (= e!495004 #b00000000000000000000000000000000)))

(declare-fun b!888369 () Bool)

(assert (=> b!888369 (= e!495004 (arrayScanForKey!0 (_keys!9844 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!109873 c!93807) b!888368))

(assert (= (and d!109873 (not c!93807)) b!888369))

(declare-fun m!827127 () Bool)

(assert (=> d!109873 m!827127))

(assert (=> d!109873 m!827061))

(declare-fun m!827129 () Bool)

(assert (=> b!888369 m!827129))

(assert (=> b!888259 d!109873))

(declare-fun b!888378 () Bool)

(declare-fun e!495012 () Bool)

(declare-fun e!495011 () Bool)

(assert (=> b!888378 (= e!495012 e!495011)))

(declare-fun lt!401624 () (_ BitVec 64))

(assert (=> b!888378 (= lt!401624 (select (arr!24887 (_keys!9844 thiss!1181)) lt!401532))))

(declare-fun lt!401626 () Unit!30209)

(assert (=> b!888378 (= lt!401626 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9844 thiss!1181) lt!401624 lt!401532))))

(assert (=> b!888378 (arrayContainsKey!0 (_keys!9844 thiss!1181) lt!401624 #b00000000000000000000000000000000)))

(declare-fun lt!401625 () Unit!30209)

(assert (=> b!888378 (= lt!401625 lt!401626)))

(declare-fun res!602324 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51751 (_ BitVec 32)) SeekEntryResult!8763)

(assert (=> b!888378 (= res!602324 (= (seekEntryOrOpen!0 (select (arr!24887 (_keys!9844 thiss!1181)) lt!401532) (_keys!9844 thiss!1181) (mask!25585 thiss!1181)) (Found!8763 lt!401532)))))

(assert (=> b!888378 (=> (not res!602324) (not e!495011))))

(declare-fun bm!39447 () Bool)

(declare-fun call!39450 () Bool)

(assert (=> bm!39447 (= call!39450 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!401532 #b00000000000000000000000000000001) (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(declare-fun d!109875 () Bool)

(declare-fun res!602325 () Bool)

(declare-fun e!495013 () Bool)

(assert (=> d!109875 (=> res!602325 e!495013)))

(assert (=> d!109875 (= res!602325 (bvsge lt!401532 (size!25330 (_keys!9844 thiss!1181))))))

(assert (=> d!109875 (= (arrayForallSeekEntryOrOpenFound!0 lt!401532 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)) e!495013)))

(declare-fun b!888379 () Bool)

(assert (=> b!888379 (= e!495011 call!39450)))

(declare-fun b!888380 () Bool)

(assert (=> b!888380 (= e!495013 e!495012)))

(declare-fun c!93810 () Bool)

(assert (=> b!888380 (= c!93810 (validKeyInArray!0 (select (arr!24887 (_keys!9844 thiss!1181)) lt!401532)))))

(declare-fun b!888381 () Bool)

(assert (=> b!888381 (= e!495012 call!39450)))

(assert (= (and d!109875 (not res!602325)) b!888380))

(assert (= (and b!888380 c!93810) b!888378))

(assert (= (and b!888380 (not c!93810)) b!888381))

(assert (= (and b!888378 res!602324) b!888379))

(assert (= (or b!888379 b!888381) bm!39447))

(declare-fun m!827131 () Bool)

(assert (=> b!888378 m!827131))

(declare-fun m!827133 () Bool)

(assert (=> b!888378 m!827133))

(declare-fun m!827135 () Bool)

(assert (=> b!888378 m!827135))

(assert (=> b!888378 m!827131))

(declare-fun m!827137 () Bool)

(assert (=> b!888378 m!827137))

(declare-fun m!827139 () Bool)

(assert (=> bm!39447 m!827139))

(assert (=> b!888380 m!827131))

(assert (=> b!888380 m!827131))

(declare-fun m!827141 () Bool)

(assert (=> b!888380 m!827141))

(assert (=> b!888259 d!109875))

(declare-fun d!109877 () Bool)

(declare-fun lt!401632 () SeekEntryResult!8763)

(assert (=> d!109877 (and ((_ is Found!8763) lt!401632) (= (index!37424 lt!401632) lt!401532))))

(assert (=> d!109877 (= lt!401632 (seekEntry!0 key!785 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(declare-fun lt!401631 () Unit!30209)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!51751 (_ BitVec 32)) Unit!30209)

(assert (=> d!109877 (= lt!401631 (choose!0 key!785 lt!401532 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(assert (=> d!109877 (validMask!0 (mask!25585 thiss!1181))))

(assert (=> d!109877 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401532 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)) lt!401631)))

(declare-fun bs!24889 () Bool)

(assert (= bs!24889 d!109877))

(assert (=> bs!24889 m!827019))

(declare-fun m!827143 () Bool)

(assert (=> bs!24889 m!827143))

(assert (=> bs!24889 m!827059))

(assert (=> b!888259 d!109877))

(declare-fun d!109879 () Bool)

(assert (=> d!109879 (arrayForallSeekEntryOrOpenFound!0 lt!401532 (_keys!9844 thiss!1181) (mask!25585 thiss!1181))))

(declare-fun lt!401635 () Unit!30209)

(declare-fun choose!38 (array!51751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30209)

(assert (=> d!109879 (= lt!401635 (choose!38 (_keys!9844 thiss!1181) (mask!25585 thiss!1181) #b00000000000000000000000000000000 lt!401532))))

(assert (=> d!109879 (validMask!0 (mask!25585 thiss!1181))))

(assert (=> d!109879 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9844 thiss!1181) (mask!25585 thiss!1181) #b00000000000000000000000000000000 lt!401532) lt!401635)))

(declare-fun bs!24890 () Bool)

(assert (= bs!24890 d!109879))

(assert (=> bs!24890 m!827031))

(declare-fun m!827145 () Bool)

(assert (=> bs!24890 m!827145))

(assert (=> bs!24890 m!827059))

(assert (=> b!888259 d!109879))

(declare-fun b!888394 () Bool)

(declare-fun e!495021 () SeekEntryResult!8763)

(assert (=> b!888394 (= e!495021 Undefined!8763)))

(declare-fun d!109881 () Bool)

(declare-fun lt!401646 () SeekEntryResult!8763)

(assert (=> d!109881 (and (or ((_ is MissingVacant!8763) lt!401646) (not ((_ is Found!8763) lt!401646)) (and (bvsge (index!37424 lt!401646) #b00000000000000000000000000000000) (bvslt (index!37424 lt!401646) (size!25330 (_keys!9844 thiss!1181))))) (not ((_ is MissingVacant!8763) lt!401646)) (or (not ((_ is Found!8763) lt!401646)) (= (select (arr!24887 (_keys!9844 thiss!1181)) (index!37424 lt!401646)) key!785)))))

(assert (=> d!109881 (= lt!401646 e!495021)))

(declare-fun c!93818 () Bool)

(declare-fun lt!401644 () SeekEntryResult!8763)

(assert (=> d!109881 (= c!93818 (and ((_ is Intermediate!8763) lt!401644) (undefined!9575 lt!401644)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51751 (_ BitVec 32)) SeekEntryResult!8763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!109881 (= lt!401644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25585 thiss!1181)) key!785 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(assert (=> d!109881 (validMask!0 (mask!25585 thiss!1181))))

(assert (=> d!109881 (= (seekEntry!0 key!785 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)) lt!401646)))

(declare-fun b!888395 () Bool)

(declare-fun e!495020 () SeekEntryResult!8763)

(declare-fun lt!401645 () SeekEntryResult!8763)

(assert (=> b!888395 (= e!495020 (ite ((_ is MissingVacant!8763) lt!401645) (MissingZero!8763 (index!37426 lt!401645)) lt!401645))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51751 (_ BitVec 32)) SeekEntryResult!8763)

(assert (=> b!888395 (= lt!401645 (seekKeyOrZeroReturnVacant!0 (x!75378 lt!401644) (index!37425 lt!401644) (index!37425 lt!401644) key!785 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(declare-fun b!888396 () Bool)

(assert (=> b!888396 (= e!495020 (MissingZero!8763 (index!37425 lt!401644)))))

(declare-fun b!888397 () Bool)

(declare-fun c!93819 () Bool)

(declare-fun lt!401647 () (_ BitVec 64))

(assert (=> b!888397 (= c!93819 (= lt!401647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!495022 () SeekEntryResult!8763)

(assert (=> b!888397 (= e!495022 e!495020)))

(declare-fun b!888398 () Bool)

(assert (=> b!888398 (= e!495022 (Found!8763 (index!37425 lt!401644)))))

(declare-fun b!888399 () Bool)

(assert (=> b!888399 (= e!495021 e!495022)))

(assert (=> b!888399 (= lt!401647 (select (arr!24887 (_keys!9844 thiss!1181)) (index!37425 lt!401644)))))

(declare-fun c!93817 () Bool)

(assert (=> b!888399 (= c!93817 (= lt!401647 key!785))))

(assert (= (and d!109881 c!93818) b!888394))

(assert (= (and d!109881 (not c!93818)) b!888399))

(assert (= (and b!888399 c!93817) b!888398))

(assert (= (and b!888399 (not c!93817)) b!888397))

(assert (= (and b!888397 c!93819) b!888396))

(assert (= (and b!888397 (not c!93819)) b!888395))

(declare-fun m!827147 () Bool)

(assert (=> d!109881 m!827147))

(declare-fun m!827149 () Bool)

(assert (=> d!109881 m!827149))

(assert (=> d!109881 m!827149))

(declare-fun m!827151 () Bool)

(assert (=> d!109881 m!827151))

(assert (=> d!109881 m!827059))

(declare-fun m!827153 () Bool)

(assert (=> b!888395 m!827153))

(declare-fun m!827155 () Bool)

(assert (=> b!888399 m!827155))

(assert (=> b!888259 d!109881))

(declare-fun b!888411 () Bool)

(declare-fun e!495025 () Bool)

(assert (=> b!888411 (= e!495025 (and (bvsge (extraKeys!4864 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4864 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2031 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!109883 () Bool)

(declare-fun res!602336 () Bool)

(assert (=> d!109883 (=> (not res!602336) (not e!495025))))

(assert (=> d!109883 (= res!602336 (validMask!0 (mask!25585 thiss!1181)))))

(assert (=> d!109883 (= (simpleValid!290 thiss!1181) e!495025)))

(declare-fun b!888410 () Bool)

(declare-fun res!602334 () Bool)

(assert (=> b!888410 (=> (not res!602334) (not e!495025))))

(declare-fun size!25336 (LongMapFixedSize!3952) (_ BitVec 32))

(assert (=> b!888410 (= res!602334 (= (size!25336 thiss!1181) (bvadd (_size!2031 thiss!1181) (bvsdiv (bvadd (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!888408 () Bool)

(declare-fun res!602335 () Bool)

(assert (=> b!888408 (=> (not res!602335) (not e!495025))))

(assert (=> b!888408 (= res!602335 (and (= (size!25331 (_values!5155 thiss!1181)) (bvadd (mask!25585 thiss!1181) #b00000000000000000000000000000001)) (= (size!25330 (_keys!9844 thiss!1181)) (size!25331 (_values!5155 thiss!1181))) (bvsge (_size!2031 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2031 thiss!1181) (bvadd (mask!25585 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!888409 () Bool)

(declare-fun res!602337 () Bool)

(assert (=> b!888409 (=> (not res!602337) (not e!495025))))

(assert (=> b!888409 (= res!602337 (bvsge (size!25336 thiss!1181) (_size!2031 thiss!1181)))))

(assert (= (and d!109883 res!602336) b!888408))

(assert (= (and b!888408 res!602335) b!888409))

(assert (= (and b!888409 res!602337) b!888410))

(assert (= (and b!888410 res!602334) b!888411))

(assert (=> d!109883 m!827059))

(declare-fun m!827157 () Bool)

(assert (=> b!888410 m!827157))

(assert (=> b!888409 m!827157))

(assert (=> d!109861 d!109883))

(declare-fun b!888412 () Bool)

(declare-fun e!495027 () Bool)

(declare-fun e!495026 () Bool)

(assert (=> b!888412 (= e!495027 e!495026)))

(declare-fun lt!401648 () (_ BitVec 64))

(assert (=> b!888412 (= lt!401648 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401650 () Unit!30209)

(assert (=> b!888412 (= lt!401650 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9844 thiss!1181) lt!401648 #b00000000000000000000000000000000))))

(assert (=> b!888412 (arrayContainsKey!0 (_keys!9844 thiss!1181) lt!401648 #b00000000000000000000000000000000)))

(declare-fun lt!401649 () Unit!30209)

(assert (=> b!888412 (= lt!401649 lt!401650)))

(declare-fun res!602338 () Bool)

(assert (=> b!888412 (= res!602338 (= (seekEntryOrOpen!0 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000) (_keys!9844 thiss!1181) (mask!25585 thiss!1181)) (Found!8763 #b00000000000000000000000000000000)))))

(assert (=> b!888412 (=> (not res!602338) (not e!495026))))

(declare-fun bm!39448 () Bool)

(declare-fun call!39451 () Bool)

(assert (=> bm!39448 (= call!39451 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9844 thiss!1181) (mask!25585 thiss!1181)))))

(declare-fun d!109885 () Bool)

(declare-fun res!602339 () Bool)

(declare-fun e!495028 () Bool)

(assert (=> d!109885 (=> res!602339 e!495028)))

(assert (=> d!109885 (= res!602339 (bvsge #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))))))

(assert (=> d!109885 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9844 thiss!1181) (mask!25585 thiss!1181)) e!495028)))

(declare-fun b!888413 () Bool)

(assert (=> b!888413 (= e!495026 call!39451)))

(declare-fun b!888414 () Bool)

(assert (=> b!888414 (= e!495028 e!495027)))

(declare-fun c!93820 () Bool)

(assert (=> b!888414 (= c!93820 (validKeyInArray!0 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888415 () Bool)

(assert (=> b!888415 (= e!495027 call!39451)))

(assert (= (and d!109885 (not res!602339)) b!888414))

(assert (= (and b!888414 c!93820) b!888412))

(assert (= (and b!888414 (not c!93820)) b!888415))

(assert (= (and b!888412 res!602338) b!888413))

(assert (= (or b!888413 b!888415) bm!39448))

(assert (=> b!888412 m!827061))

(declare-fun m!827159 () Bool)

(assert (=> b!888412 m!827159))

(declare-fun m!827161 () Bool)

(assert (=> b!888412 m!827161))

(assert (=> b!888412 m!827061))

(declare-fun m!827163 () Bool)

(assert (=> b!888412 m!827163))

(declare-fun m!827165 () Bool)

(assert (=> bm!39448 m!827165))

(assert (=> b!888414 m!827061))

(assert (=> b!888414 m!827061))

(assert (=> b!888414 m!827083))

(assert (=> b!888280 d!109885))

(assert (=> b!888253 d!109881))

(declare-fun d!109887 () Bool)

(declare-fun e!495034 () Bool)

(assert (=> d!109887 e!495034))

(declare-fun res!602342 () Bool)

(assert (=> d!109887 (=> res!602342 e!495034)))

(declare-fun lt!401659 () Bool)

(assert (=> d!109887 (= res!602342 (not lt!401659))))

(declare-fun lt!401660 () Bool)

(assert (=> d!109887 (= lt!401659 lt!401660)))

(declare-fun lt!401661 () Unit!30209)

(declare-fun e!495033 () Unit!30209)

(assert (=> d!109887 (= lt!401661 e!495033)))

(declare-fun c!93823 () Bool)

(assert (=> d!109887 (= c!93823 lt!401660)))

(declare-fun containsKey!420 (List!17698 (_ BitVec 64)) Bool)

(assert (=> d!109887 (= lt!401660 (containsKey!420 (toList!5336 (map!12094 thiss!1181)) key!785))))

(assert (=> d!109887 (= (contains!4300 (map!12094 thiss!1181) key!785) lt!401659)))

(declare-fun b!888422 () Bool)

(declare-fun lt!401662 () Unit!30209)

(assert (=> b!888422 (= e!495033 lt!401662)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!315 (List!17698 (_ BitVec 64)) Unit!30209)

(assert (=> b!888422 (= lt!401662 (lemmaContainsKeyImpliesGetValueByKeyDefined!315 (toList!5336 (map!12094 thiss!1181)) key!785))))

(assert (=> b!888422 (isDefined!319 (getValueByKey!438 (toList!5336 (map!12094 thiss!1181)) key!785))))

(declare-fun b!888423 () Bool)

(declare-fun Unit!30214 () Unit!30209)

(assert (=> b!888423 (= e!495033 Unit!30214)))

(declare-fun b!888424 () Bool)

(assert (=> b!888424 (= e!495034 (isDefined!319 (getValueByKey!438 (toList!5336 (map!12094 thiss!1181)) key!785)))))

(assert (= (and d!109887 c!93823) b!888422))

(assert (= (and d!109887 (not c!93823)) b!888423))

(assert (= (and d!109887 (not res!602342)) b!888424))

(declare-fun m!827167 () Bool)

(assert (=> d!109887 m!827167))

(declare-fun m!827169 () Bool)

(assert (=> b!888422 m!827169))

(assert (=> b!888422 m!826981))

(assert (=> b!888422 m!826981))

(assert (=> b!888422 m!826983))

(assert (=> b!888424 m!826981))

(assert (=> b!888424 m!826981))

(assert (=> b!888424 m!826983))

(assert (=> d!109849 d!109887))

(assert (=> d!109849 d!109855))

(assert (=> d!109849 d!109861))

(declare-fun b!888435 () Bool)

(declare-fun e!495043 () Bool)

(declare-fun call!39454 () Bool)

(assert (=> b!888435 (= e!495043 call!39454)))

(declare-fun d!109889 () Bool)

(declare-fun res!602351 () Bool)

(declare-fun e!495046 () Bool)

(assert (=> d!109889 (=> res!602351 e!495046)))

(assert (=> d!109889 (= res!602351 (bvsge #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))))))

(assert (=> d!109889 (= (arrayNoDuplicates!0 (_keys!9844 thiss!1181) #b00000000000000000000000000000000 Nil!17697) e!495046)))

(declare-fun bm!39451 () Bool)

(declare-fun c!93826 () Bool)

(assert (=> bm!39451 (= call!39454 (arrayNoDuplicates!0 (_keys!9844 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93826 (Cons!17696 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000) Nil!17697) Nil!17697)))))

(declare-fun b!888436 () Bool)

(declare-fun e!495045 () Bool)

(assert (=> b!888436 (= e!495046 e!495045)))

(declare-fun res!602349 () Bool)

(assert (=> b!888436 (=> (not res!602349) (not e!495045))))

(declare-fun e!495044 () Bool)

(assert (=> b!888436 (= res!602349 (not e!495044))))

(declare-fun res!602350 () Bool)

(assert (=> b!888436 (=> (not res!602350) (not e!495044))))

(assert (=> b!888436 (= res!602350 (validKeyInArray!0 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888437 () Bool)

(assert (=> b!888437 (= e!495045 e!495043)))

(assert (=> b!888437 (= c!93826 (validKeyInArray!0 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888438 () Bool)

(assert (=> b!888438 (= e!495043 call!39454)))

(declare-fun b!888439 () Bool)

(declare-fun contains!4301 (List!17700 (_ BitVec 64)) Bool)

(assert (=> b!888439 (= e!495044 (contains!4301 Nil!17697 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!109889 (not res!602351)) b!888436))

(assert (= (and b!888436 res!602350) b!888439))

(assert (= (and b!888436 res!602349) b!888437))

(assert (= (and b!888437 c!93826) b!888438))

(assert (= (and b!888437 (not c!93826)) b!888435))

(assert (= (or b!888438 b!888435) bm!39451))

(assert (=> bm!39451 m!827061))

(declare-fun m!827171 () Bool)

(assert (=> bm!39451 m!827171))

(assert (=> b!888436 m!827061))

(assert (=> b!888436 m!827061))

(assert (=> b!888436 m!827083))

(assert (=> b!888437 m!827061))

(assert (=> b!888437 m!827061))

(assert (=> b!888437 m!827083))

(assert (=> b!888439 m!827061))

(assert (=> b!888439 m!827061))

(declare-fun m!827173 () Bool)

(assert (=> b!888439 m!827173))

(assert (=> b!888281 d!109889))

(declare-fun b!888440 () Bool)

(declare-fun e!495047 () Option!444)

(assert (=> b!888440 (= e!495047 (Some!443 (_2!5988 (h!18825 (t!24986 (toList!5336 (map!12094 thiss!1181)))))))))

(declare-fun b!888441 () Bool)

(declare-fun e!495048 () Option!444)

(assert (=> b!888441 (= e!495047 e!495048)))

(declare-fun c!93828 () Bool)

(assert (=> b!888441 (= c!93828 (and ((_ is Cons!17694) (t!24986 (toList!5336 (map!12094 thiss!1181)))) (not (= (_1!5988 (h!18825 (t!24986 (toList!5336 (map!12094 thiss!1181))))) key!785))))))

(declare-fun d!109891 () Bool)

(declare-fun c!93827 () Bool)

(assert (=> d!109891 (= c!93827 (and ((_ is Cons!17694) (t!24986 (toList!5336 (map!12094 thiss!1181)))) (= (_1!5988 (h!18825 (t!24986 (toList!5336 (map!12094 thiss!1181))))) key!785)))))

(assert (=> d!109891 (= (getValueByKey!438 (t!24986 (toList!5336 (map!12094 thiss!1181))) key!785) e!495047)))

(declare-fun b!888443 () Bool)

(assert (=> b!888443 (= e!495048 None!442)))

(declare-fun b!888442 () Bool)

(assert (=> b!888442 (= e!495048 (getValueByKey!438 (t!24986 (t!24986 (toList!5336 (map!12094 thiss!1181)))) key!785))))

(assert (= (and d!109891 c!93827) b!888440))

(assert (= (and d!109891 (not c!93827)) b!888441))

(assert (= (and b!888441 c!93828) b!888442))

(assert (= (and b!888441 (not c!93828)) b!888443))

(declare-fun m!827175 () Bool)

(assert (=> b!888442 m!827175))

(assert (=> b!888271 d!109891))

(declare-fun d!109893 () Bool)

(declare-fun res!602356 () Bool)

(declare-fun e!495053 () Bool)

(assert (=> d!109893 (=> res!602356 e!495053)))

(assert (=> d!109893 (= res!602356 (= (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!109893 (= (arrayContainsKey!0 (_keys!9844 thiss!1181) key!785 #b00000000000000000000000000000000) e!495053)))

(declare-fun b!888448 () Bool)

(declare-fun e!495054 () Bool)

(assert (=> b!888448 (= e!495053 e!495054)))

(declare-fun res!602357 () Bool)

(assert (=> b!888448 (=> (not res!602357) (not e!495054))))

(assert (=> b!888448 (= res!602357 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25330 (_keys!9844 thiss!1181))))))

(declare-fun b!888449 () Bool)

(assert (=> b!888449 (= e!495054 (arrayContainsKey!0 (_keys!9844 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!109893 (not res!602356)) b!888448))

(assert (= (and b!888448 res!602357) b!888449))

(assert (=> d!109893 m!827061))

(declare-fun m!827177 () Bool)

(assert (=> b!888449 m!827177))

(assert (=> bm!39423 d!109893))

(declare-fun d!109895 () Bool)

(declare-fun lt!401665 () (_ BitVec 32))

(assert (=> d!109895 (and (bvsge lt!401665 #b00000000000000000000000000000000) (bvsle lt!401665 (bvsub (size!25330 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!495059 () (_ BitVec 32))

(assert (=> d!109895 (= lt!401665 e!495059)))

(declare-fun c!93833 () Bool)

(assert (=> d!109895 (= c!93833 (bvsge #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))))))

(assert (=> d!109895 (and (bvsle #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25330 (_keys!9844 thiss!1181)) (size!25330 (_keys!9844 thiss!1181))))))

(assert (=> d!109895 (= (arrayCountValidKeys!0 (_keys!9844 thiss!1181) #b00000000000000000000000000000000 (size!25330 (_keys!9844 thiss!1181))) lt!401665)))

(declare-fun b!888458 () Bool)

(assert (=> b!888458 (= e!495059 #b00000000000000000000000000000000)))

(declare-fun bm!39454 () Bool)

(declare-fun call!39457 () (_ BitVec 32))

(assert (=> bm!39454 (= call!39457 (arrayCountValidKeys!0 (_keys!9844 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25330 (_keys!9844 thiss!1181))))))

(declare-fun b!888459 () Bool)

(declare-fun e!495060 () (_ BitVec 32))

(assert (=> b!888459 (= e!495059 e!495060)))

(declare-fun c!93834 () Bool)

(assert (=> b!888459 (= c!93834 (validKeyInArray!0 (select (arr!24887 (_keys!9844 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888460 () Bool)

(assert (=> b!888460 (= e!495060 call!39457)))

(declare-fun b!888461 () Bool)

(assert (=> b!888461 (= e!495060 (bvadd #b00000000000000000000000000000001 call!39457))))

(assert (= (and d!109895 c!93833) b!888458))

(assert (= (and d!109895 (not c!93833)) b!888459))

(assert (= (and b!888459 c!93834) b!888461))

(assert (= (and b!888459 (not c!93834)) b!888460))

(assert (= (or b!888461 b!888460) bm!39454))

(declare-fun m!827179 () Bool)

(assert (=> bm!39454 m!827179))

(assert (=> b!888459 m!827061))

(assert (=> b!888459 m!827061))

(assert (=> b!888459 m!827083))

(assert (=> b!888279 d!109895))

(assert (=> d!109855 d!109863))

(declare-fun d!109897 () Bool)

(declare-fun e!495062 () Bool)

(assert (=> d!109897 e!495062))

(declare-fun res!602358 () Bool)

(assert (=> d!109897 (=> res!602358 e!495062)))

(declare-fun lt!401666 () Bool)

(assert (=> d!109897 (= res!602358 (not lt!401666))))

(declare-fun lt!401667 () Bool)

(assert (=> d!109897 (= lt!401666 lt!401667)))

(declare-fun lt!401668 () Unit!30209)

(declare-fun e!495061 () Unit!30209)

(assert (=> d!109897 (= lt!401668 e!495061)))

(declare-fun c!93835 () Bool)

(assert (=> d!109897 (= c!93835 lt!401667)))

(assert (=> d!109897 (= lt!401667 (containsKey!420 (toList!5336 call!39425) (ite c!93773 (select (arr!24887 (_keys!9844 thiss!1181)) (index!37424 lt!401527)) key!785)))))

(assert (=> d!109897 (= (contains!4300 call!39425 (ite c!93773 (select (arr!24887 (_keys!9844 thiss!1181)) (index!37424 lt!401527)) key!785)) lt!401666)))

(declare-fun b!888462 () Bool)

(declare-fun lt!401669 () Unit!30209)

(assert (=> b!888462 (= e!495061 lt!401669)))

(assert (=> b!888462 (= lt!401669 (lemmaContainsKeyImpliesGetValueByKeyDefined!315 (toList!5336 call!39425) (ite c!93773 (select (arr!24887 (_keys!9844 thiss!1181)) (index!37424 lt!401527)) key!785)))))

(assert (=> b!888462 (isDefined!319 (getValueByKey!438 (toList!5336 call!39425) (ite c!93773 (select (arr!24887 (_keys!9844 thiss!1181)) (index!37424 lt!401527)) key!785)))))

(declare-fun b!888463 () Bool)

(declare-fun Unit!30215 () Unit!30209)

(assert (=> b!888463 (= e!495061 Unit!30215)))

(declare-fun b!888464 () Bool)

(assert (=> b!888464 (= e!495062 (isDefined!319 (getValueByKey!438 (toList!5336 call!39425) (ite c!93773 (select (arr!24887 (_keys!9844 thiss!1181)) (index!37424 lt!401527)) key!785))))))

(assert (= (and d!109897 c!93835) b!888462))

(assert (= (and d!109897 (not c!93835)) b!888463))

(assert (= (and d!109897 (not res!602358)) b!888464))

(declare-fun m!827181 () Bool)

(assert (=> d!109897 m!827181))

(declare-fun m!827183 () Bool)

(assert (=> b!888462 m!827183))

(declare-fun m!827185 () Bool)

(assert (=> b!888462 m!827185))

(assert (=> b!888462 m!827185))

(declare-fun m!827187 () Bool)

(assert (=> b!888462 m!827187))

(assert (=> b!888464 m!827185))

(assert (=> b!888464 m!827185))

(assert (=> b!888464 m!827187))

(assert (=> bm!39421 d!109897))

(declare-fun mapIsEmpty!28395 () Bool)

(declare-fun mapRes!28395 () Bool)

(assert (=> mapIsEmpty!28395 mapRes!28395))

(declare-fun condMapEmpty!28395 () Bool)

(declare-fun mapDefault!28395 () ValueCell!8468)

(assert (=> mapNonEmpty!28394 (= condMapEmpty!28395 (= mapRest!28394 ((as const (Array (_ BitVec 32) ValueCell!8468)) mapDefault!28395)))))

(declare-fun e!495063 () Bool)

(assert (=> mapNonEmpty!28394 (= tp!54680 (and e!495063 mapRes!28395))))

(declare-fun b!888466 () Bool)

(assert (=> b!888466 (= e!495063 tp_is_empty!17899)))

(declare-fun mapNonEmpty!28395 () Bool)

(declare-fun tp!54681 () Bool)

(declare-fun e!495064 () Bool)

(assert (=> mapNonEmpty!28395 (= mapRes!28395 (and tp!54681 e!495064))))

(declare-fun mapKey!28395 () (_ BitVec 32))

(declare-fun mapRest!28395 () (Array (_ BitVec 32) ValueCell!8468))

(declare-fun mapValue!28395 () ValueCell!8468)

(assert (=> mapNonEmpty!28395 (= mapRest!28394 (store mapRest!28395 mapKey!28395 mapValue!28395))))

(declare-fun b!888465 () Bool)

(assert (=> b!888465 (= e!495064 tp_is_empty!17899)))

(assert (= (and mapNonEmpty!28394 condMapEmpty!28395) mapIsEmpty!28395))

(assert (= (and mapNonEmpty!28394 (not condMapEmpty!28395)) mapNonEmpty!28395))

(assert (= (and mapNonEmpty!28395 ((_ is ValueCellFull!8468) mapValue!28395)) b!888465))

(assert (= (and mapNonEmpty!28394 ((_ is ValueCellFull!8468) mapDefault!28395)) b!888466))

(declare-fun m!827189 () Bool)

(assert (=> mapNonEmpty!28395 m!827189))

(declare-fun b_lambda!12863 () Bool)

(assert (= b_lambda!12861 (or (and b!888185 b_free!15571) b_lambda!12863)))

(check-sat (not b!888344) (not bm!39443) (not b!888357) (not b!888442) (not b!888436) (not b!888439) (not b!888437) (not b!888380) (not b!888341) (not b!888348) (not d!109887) (not b!888410) (not b!888351) (not bm!39444) (not d!109863) (not b!888378) (not bm!39451) (not d!109897) (not b_lambda!12863) (not bm!39454) (not b!888414) (not b!888409) (not b!888335) (not b!888395) (not d!109871) (not bm!39447) (not b!888362) (not b!888424) (not b!888339) (not d!109881) (not b!888459) (not b!888332) tp_is_empty!17899 (not b!888462) b_and!25789 (not d!109869) (not b!888347) (not d!109877) (not d!109867) (not bm!39448) (not b!888422) (not b_next!15571) (not bm!39439) (not d!109883) (not b!888412) (not d!109879) (not b!888449) (not bm!39441) (not b!888464) (not b!888369) (not mapNonEmpty!28395))
(check-sat b_and!25789 (not b_next!15571))
