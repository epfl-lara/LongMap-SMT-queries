; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76026 () Bool)

(assert start!76026)

(declare-fun b!893631 () Bool)

(declare-fun b_free!15829 () Bool)

(declare-fun b_next!15829 () Bool)

(assert (=> b!893631 (= b_free!15829 (not b_next!15829))))

(declare-fun tp!55457 () Bool)

(declare-fun b_and!26091 () Bool)

(assert (=> b!893631 (= tp!55457 b_and!26091)))

(declare-fun mapNonEmpty!28790 () Bool)

(declare-fun mapRes!28790 () Bool)

(declare-fun tp!55456 () Bool)

(declare-fun e!499004 () Bool)

(assert (=> mapNonEmpty!28790 (= mapRes!28790 (and tp!55456 e!499004))))

(declare-datatypes ((V!29175 0))(
  ( (V!29176 (val!9129 Int)) )
))
(declare-datatypes ((ValueCell!8597 0))(
  ( (ValueCellFull!8597 (v!11604 V!29175)) (EmptyCell!8597) )
))
(declare-fun mapValue!28790 () ValueCell!8597)

(declare-fun mapRest!28790 () (Array (_ BitVec 32) ValueCell!8597))

(declare-datatypes ((array!52333 0))(
  ( (array!52334 (arr!25168 (Array (_ BitVec 32) (_ BitVec 64))) (size!25613 (_ BitVec 32))) )
))
(declare-datatypes ((array!52335 0))(
  ( (array!52336 (arr!25169 (Array (_ BitVec 32) ValueCell!8597)) (size!25614 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4210 0))(
  ( (LongMapFixedSize!4211 (defaultEntry!5302 Int) (mask!25862 (_ BitVec 32)) (extraKeys!4996 (_ BitVec 32)) (zeroValue!5100 V!29175) (minValue!5100 V!29175) (_size!2160 (_ BitVec 32)) (_keys!10013 array!52333) (_values!5287 array!52335) (_vacant!2160 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4210)

(declare-fun mapKey!28790 () (_ BitVec 32))

(assert (=> mapNonEmpty!28790 (= (arr!25169 (_values!5287 thiss!1181)) (store mapRest!28790 mapKey!28790 mapValue!28790))))

(declare-fun res!605090 () Bool)

(declare-fun e!498998 () Bool)

(assert (=> start!76026 (=> (not res!605090) (not e!498998))))

(declare-fun valid!1639 (LongMapFixedSize!4210) Bool)

(assert (=> start!76026 (= res!605090 (valid!1639 thiss!1181))))

(assert (=> start!76026 e!498998))

(declare-fun e!498999 () Bool)

(assert (=> start!76026 e!498999))

(assert (=> start!76026 true))

(declare-fun b!893620 () Bool)

(declare-fun tp_is_empty!18157 () Bool)

(assert (=> b!893620 (= e!499004 tp_is_empty!18157)))

(declare-fun bm!39593 () Bool)

(declare-fun call!39596 () V!29175)

(declare-datatypes ((tuple2!11924 0))(
  ( (tuple2!11925 (_1!5973 (_ BitVec 64)) (_2!5973 V!29175)) )
))
(declare-datatypes ((List!17743 0))(
  ( (Nil!17740) (Cons!17739 (h!18876 tuple2!11924) (t!25048 List!17743)) )
))
(declare-datatypes ((ListLongMap!10623 0))(
  ( (ListLongMap!10624 (toList!5327 List!17743)) )
))
(declare-fun lt!403674 () ListLongMap!10623)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun apply!401 (ListLongMap!10623 (_ BitVec 64)) V!29175)

(assert (=> bm!39593 (= call!39596 (apply!401 lt!403674 key!785))))

(declare-fun b!893621 () Bool)

(declare-fun e!498995 () Bool)

(declare-fun e!498994 () Bool)

(assert (=> b!893621 (= e!498995 (and e!498994 mapRes!28790))))

(declare-fun condMapEmpty!28790 () Bool)

(declare-fun mapDefault!28790 () ValueCell!8597)

(assert (=> b!893621 (= condMapEmpty!28790 (= (arr!25169 (_values!5287 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8597)) mapDefault!28790)))))

(declare-fun b!893622 () Bool)

(declare-fun res!605088 () Bool)

(assert (=> b!893622 (=> (not res!605088) (not e!498998))))

(assert (=> b!893622 (= res!605088 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893623 () Bool)

(declare-fun e!499002 () Bool)

(assert (=> b!893623 (= e!498998 (not e!499002))))

(declare-fun res!605087 () Bool)

(assert (=> b!893623 (=> res!605087 e!499002)))

(declare-datatypes ((SeekEntryResult!8810 0))(
  ( (MissingZero!8810 (index!37611 (_ BitVec 32))) (Found!8810 (index!37612 (_ BitVec 32))) (Intermediate!8810 (undefined!9622 Bool) (index!37613 (_ BitVec 32)) (x!75854 (_ BitVec 32))) (Undefined!8810) (MissingVacant!8810 (index!37614 (_ BitVec 32))) )
))
(declare-fun lt!403671 () SeekEntryResult!8810)

(get-info :version)

(assert (=> b!893623 (= res!605087 (not ((_ is Found!8810) lt!403671)))))

(declare-fun e!498997 () Bool)

(assert (=> b!893623 e!498997))

(declare-fun res!605092 () Bool)

(assert (=> b!893623 (=> res!605092 e!498997)))

(assert (=> b!893623 (= res!605092 (not ((_ is Found!8810) lt!403671)))))

(declare-datatypes ((Unit!30388 0))(
  ( (Unit!30389) )
))
(declare-fun lt!403672 () Unit!30388)

(declare-fun lemmaSeekEntryGivesInRangeIndex!60 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64)) Unit!30388)

(assert (=> b!893623 (= lt!403672 (lemmaSeekEntryGivesInRangeIndex!60 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52333 (_ BitVec 32)) SeekEntryResult!8810)

(assert (=> b!893623 (= lt!403671 (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)))))

(declare-fun bm!39594 () Bool)

(declare-fun call!39597 () V!29175)

(assert (=> bm!39594 (= call!39597 call!39596)))

(declare-fun b!893624 () Bool)

(assert (=> b!893624 (= e!498994 tp_is_empty!18157)))

(declare-fun b!893625 () Bool)

(declare-fun res!605086 () Bool)

(declare-fun e!498993 () Bool)

(assert (=> b!893625 (=> (not res!605086) (not e!498993))))

(assert (=> b!893625 (= res!605086 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!499003 () Bool)

(assert (=> b!893625 (= e!499003 e!498993)))

(declare-fun b!893626 () Bool)

(assert (=> b!893626 (= e!498993 (= call!39597 (minValue!5100 thiss!1181)))))

(declare-fun b!893627 () Bool)

(declare-fun e!499000 () Bool)

(declare-fun e!499005 () Bool)

(assert (=> b!893627 (= e!499000 e!499005)))

(declare-fun res!605089 () Bool)

(assert (=> b!893627 (= res!605089 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!893627 (=> (not res!605089) (not e!499005))))

(declare-fun b!893628 () Bool)

(declare-fun get!13262 (ValueCell!8597 V!29175) V!29175)

(declare-fun dynLambda!1311 (Int (_ BitVec 64)) V!29175)

(assert (=> b!893628 (= e!499003 (= call!39597 (get!13262 (select (arr!25169 (_values!5287 thiss!1181)) (index!37612 lt!403671)) (dynLambda!1311 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!28790 () Bool)

(assert (=> mapIsEmpty!28790 mapRes!28790))

(declare-fun b!893629 () Bool)

(declare-fun e!498996 () Bool)

(assert (=> b!893629 (= e!499002 e!498996)))

(declare-fun res!605091 () Bool)

(assert (=> b!893629 (=> res!605091 e!498996)))

(declare-fun contains!4342 (LongMapFixedSize!4210 (_ BitVec 64)) Bool)

(assert (=> b!893629 (= res!605091 (not (contains!4342 thiss!1181 key!785)))))

(assert (=> b!893629 e!499000))

(declare-fun c!94269 () Bool)

(assert (=> b!893629 (= c!94269 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403676 () Unit!30388)

(declare-fun lemmaKeyInListMapThenSameValueInArray!8 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64) (_ BitVec 32) Int) Unit!30388)

(assert (=> b!893629 (= lt!403676 (lemmaKeyInListMapThenSameValueInArray!8 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785 (index!37612 lt!403671) (defaultEntry!5302 thiss!1181)))))

(declare-fun contains!4343 (ListLongMap!10623 (_ BitVec 64)) Bool)

(assert (=> b!893629 (contains!4343 lt!403674 (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403671)))))

(declare-fun getCurrentListMap!2604 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 32) Int) ListLongMap!10623)

(assert (=> b!893629 (= lt!403674 (getCurrentListMap!2604 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403673 () Unit!30388)

(declare-fun lemmaValidKeyInArrayIsInListMap!234 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 32) Int) Unit!30388)

(assert (=> b!893629 (= lt!403673 (lemmaValidKeyInArrayIsInListMap!234 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) (index!37612 lt!403671) (defaultEntry!5302 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!893629 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403675 () Unit!30388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52333 (_ BitVec 64) (_ BitVec 32)) Unit!30388)

(assert (=> b!893629 (= lt!403675 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) key!785 (index!37612 lt!403671)))))

(declare-fun b!893630 () Bool)

(assert (=> b!893630 (= e!499000 e!499003)))

(declare-fun c!94268 () Bool)

(assert (=> b!893630 (= c!94268 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!19818 (array!52333) Bool)

(declare-fun array_inv!19819 (array!52335) Bool)

(assert (=> b!893631 (= e!498999 (and tp!55457 tp_is_empty!18157 (array_inv!19818 (_keys!10013 thiss!1181)) (array_inv!19819 (_values!5287 thiss!1181)) e!498995))))

(declare-fun b!893632 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893632 (= e!498997 (inRange!0 (index!37612 lt!403671) (mask!25862 thiss!1181)))))

(declare-fun b!893633 () Bool)

(assert (=> b!893633 (= e!499005 (= call!39596 (zeroValue!5100 thiss!1181)))))

(declare-fun b!893634 () Bool)

(declare-datatypes ((Option!449 0))(
  ( (Some!448 (v!11605 V!29175)) (None!447) )
))
(declare-fun isDefined!323 (Option!449) Bool)

(declare-fun getValueByKey!443 (List!17743 (_ BitVec 64)) Option!449)

(declare-fun map!12190 (LongMapFixedSize!4210) ListLongMap!10623)

(assert (=> b!893634 (= e!498996 (isDefined!323 (getValueByKey!443 (toList!5327 (map!12190 thiss!1181)) key!785)))))

(assert (= (and start!76026 res!605090) b!893622))

(assert (= (and b!893622 res!605088) b!893623))

(assert (= (and b!893623 (not res!605092)) b!893632))

(assert (= (and b!893623 (not res!605087)) b!893629))

(assert (= (and b!893629 c!94269) b!893627))

(assert (= (and b!893629 (not c!94269)) b!893630))

(assert (= (and b!893627 res!605089) b!893633))

(assert (= (and b!893630 c!94268) b!893625))

(assert (= (and b!893630 (not c!94268)) b!893628))

(assert (= (and b!893625 res!605086) b!893626))

(assert (= (or b!893626 b!893628) bm!39594))

(assert (= (or b!893633 bm!39594) bm!39593))

(assert (= (and b!893629 (not res!605091)) b!893634))

(assert (= (and b!893621 condMapEmpty!28790) mapIsEmpty!28790))

(assert (= (and b!893621 (not condMapEmpty!28790)) mapNonEmpty!28790))

(assert (= (and mapNonEmpty!28790 ((_ is ValueCellFull!8597) mapValue!28790)) b!893620))

(assert (= (and b!893621 ((_ is ValueCellFull!8597) mapDefault!28790)) b!893624))

(assert (= b!893631 b!893621))

(assert (= start!76026 b!893631))

(declare-fun b_lambda!12909 () Bool)

(assert (=> (not b_lambda!12909) (not b!893628)))

(declare-fun t!25047 () Bool)

(declare-fun tb!5155 () Bool)

(assert (=> (and b!893631 (= (defaultEntry!5302 thiss!1181) (defaultEntry!5302 thiss!1181)) t!25047) tb!5155))

(declare-fun result!10029 () Bool)

(assert (=> tb!5155 (= result!10029 tp_is_empty!18157)))

(assert (=> b!893628 t!25047))

(declare-fun b_and!26093 () Bool)

(assert (= b_and!26091 (and (=> t!25047 result!10029) b_and!26093)))

(declare-fun m!832219 () Bool)

(assert (=> b!893634 m!832219))

(declare-fun m!832221 () Bool)

(assert (=> b!893634 m!832221))

(assert (=> b!893634 m!832221))

(declare-fun m!832223 () Bool)

(assert (=> b!893634 m!832223))

(declare-fun m!832225 () Bool)

(assert (=> bm!39593 m!832225))

(declare-fun m!832227 () Bool)

(assert (=> b!893632 m!832227))

(declare-fun m!832229 () Bool)

(assert (=> b!893623 m!832229))

(declare-fun m!832231 () Bool)

(assert (=> b!893623 m!832231))

(declare-fun m!832233 () Bool)

(assert (=> mapNonEmpty!28790 m!832233))

(declare-fun m!832235 () Bool)

(assert (=> start!76026 m!832235))

(declare-fun m!832237 () Bool)

(assert (=> b!893628 m!832237))

(declare-fun m!832239 () Bool)

(assert (=> b!893628 m!832239))

(assert (=> b!893628 m!832237))

(assert (=> b!893628 m!832239))

(declare-fun m!832241 () Bool)

(assert (=> b!893628 m!832241))

(declare-fun m!832243 () Bool)

(assert (=> b!893629 m!832243))

(declare-fun m!832245 () Bool)

(assert (=> b!893629 m!832245))

(declare-fun m!832247 () Bool)

(assert (=> b!893629 m!832247))

(declare-fun m!832249 () Bool)

(assert (=> b!893629 m!832249))

(declare-fun m!832251 () Bool)

(assert (=> b!893629 m!832251))

(assert (=> b!893629 m!832243))

(declare-fun m!832253 () Bool)

(assert (=> b!893629 m!832253))

(declare-fun m!832255 () Bool)

(assert (=> b!893629 m!832255))

(declare-fun m!832257 () Bool)

(assert (=> b!893629 m!832257))

(declare-fun m!832259 () Bool)

(assert (=> b!893631 m!832259))

(declare-fun m!832261 () Bool)

(assert (=> b!893631 m!832261))

(check-sat (not start!76026) (not b!893632) (not b!893631) (not b_lambda!12909) (not b!893629) tp_is_empty!18157 (not b!893623) (not b!893628) b_and!26093 (not b!893634) (not mapNonEmpty!28790) (not bm!39593) (not b_next!15829))
(check-sat b_and!26093 (not b_next!15829))
(get-model)

(declare-fun b_lambda!12915 () Bool)

(assert (= b_lambda!12909 (or (and b!893631 b_free!15829) b_lambda!12915)))

(check-sat (not start!76026) (not b!893632) (not b!893631) (not b!893629) tp_is_empty!18157 (not b!893623) (not b_lambda!12915) (not b!893628) b_and!26093 (not b!893634) (not mapNonEmpty!28790) (not bm!39593) (not b_next!15829))
(check-sat b_and!26093 (not b_next!15829))
(get-model)

(declare-fun d!110561 () Bool)

(assert (=> d!110561 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403715 () Unit!30388)

(declare-fun choose!13 (array!52333 (_ BitVec 64) (_ BitVec 32)) Unit!30388)

(assert (=> d!110561 (= lt!403715 (choose!13 (_keys!10013 thiss!1181) key!785 (index!37612 lt!403671)))))

(assert (=> d!110561 (bvsge (index!37612 lt!403671) #b00000000000000000000000000000000)))

(assert (=> d!110561 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) key!785 (index!37612 lt!403671)) lt!403715)))

(declare-fun bs!25068 () Bool)

(assert (= bs!25068 d!110561))

(assert (=> bs!25068 m!832249))

(declare-fun m!832351 () Bool)

(assert (=> bs!25068 m!832351))

(assert (=> b!893629 d!110561))

(declare-fun d!110563 () Bool)

(declare-fun e!499086 () Bool)

(assert (=> d!110563 e!499086))

(declare-fun res!605137 () Bool)

(assert (=> d!110563 (=> (not res!605137) (not e!499086))))

(assert (=> d!110563 (= res!605137 (and (bvsge (index!37612 lt!403671) #b00000000000000000000000000000000) (bvslt (index!37612 lt!403671) (size!25613 (_keys!10013 thiss!1181)))))))

(declare-fun lt!403718 () Unit!30388)

(declare-fun choose!1466 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 32) Int) Unit!30388)

(assert (=> d!110563 (= lt!403718 (choose!1466 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) (index!37612 lt!403671) (defaultEntry!5302 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110563 (validMask!0 (mask!25862 thiss!1181))))

(assert (=> d!110563 (= (lemmaValidKeyInArrayIsInListMap!234 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) (index!37612 lt!403671) (defaultEntry!5302 thiss!1181)) lt!403718)))

(declare-fun b!893733 () Bool)

(assert (=> b!893733 (= e!499086 (contains!4343 (getCurrentListMap!2604 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)) (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403671))))))

(assert (= (and d!110563 res!605137) b!893733))

(declare-fun m!832353 () Bool)

(assert (=> d!110563 m!832353))

(declare-fun m!832355 () Bool)

(assert (=> d!110563 m!832355))

(assert (=> b!893733 m!832255))

(assert (=> b!893733 m!832243))

(assert (=> b!893733 m!832255))

(assert (=> b!893733 m!832243))

(declare-fun m!832357 () Bool)

(assert (=> b!893733 m!832357))

(assert (=> b!893629 d!110563))

(declare-fun b!893776 () Bool)

(declare-fun e!499116 () Bool)

(declare-fun lt!403767 () ListLongMap!10623)

(assert (=> b!893776 (= e!499116 (= (apply!401 lt!403767 (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)) (get!13262 (select (arr!25169 (_values!5287 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1311 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893776 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25614 (_values!5287 thiss!1181))))))

(assert (=> b!893776 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25613 (_keys!10013 thiss!1181))))))

(declare-fun bm!39621 () Bool)

(declare-fun call!39626 () ListLongMap!10623)

(declare-fun call!39624 () ListLongMap!10623)

(assert (=> bm!39621 (= call!39626 call!39624)))

(declare-fun bm!39622 () Bool)

(declare-fun call!39625 () Bool)

(assert (=> bm!39622 (= call!39625 (contains!4343 lt!403767 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893777 () Bool)

(declare-fun e!499113 () Unit!30388)

(declare-fun lt!403766 () Unit!30388)

(assert (=> b!893777 (= e!499113 lt!403766)))

(declare-fun lt!403775 () ListLongMap!10623)

(declare-fun getCurrentListMapNoExtraKeys!3318 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 32) Int) ListLongMap!10623)

(assert (=> b!893777 (= lt!403775 (getCurrentListMapNoExtraKeys!3318 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403776 () (_ BitVec 64))

(assert (=> b!893777 (= lt!403776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403781 () (_ BitVec 64))

(assert (=> b!893777 (= lt!403781 (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403773 () Unit!30388)

(declare-fun addStillContains!328 (ListLongMap!10623 (_ BitVec 64) V!29175 (_ BitVec 64)) Unit!30388)

(assert (=> b!893777 (= lt!403773 (addStillContains!328 lt!403775 lt!403776 (zeroValue!5100 thiss!1181) lt!403781))))

(declare-fun +!2597 (ListLongMap!10623 tuple2!11924) ListLongMap!10623)

(assert (=> b!893777 (contains!4343 (+!2597 lt!403775 (tuple2!11925 lt!403776 (zeroValue!5100 thiss!1181))) lt!403781)))

(declare-fun lt!403782 () Unit!30388)

(assert (=> b!893777 (= lt!403782 lt!403773)))

(declare-fun lt!403777 () ListLongMap!10623)

(assert (=> b!893777 (= lt!403777 (getCurrentListMapNoExtraKeys!3318 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403772 () (_ BitVec 64))

(assert (=> b!893777 (= lt!403772 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403780 () (_ BitVec 64))

(assert (=> b!893777 (= lt!403780 (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403771 () Unit!30388)

(declare-fun addApplyDifferent!328 (ListLongMap!10623 (_ BitVec 64) V!29175 (_ BitVec 64)) Unit!30388)

(assert (=> b!893777 (= lt!403771 (addApplyDifferent!328 lt!403777 lt!403772 (minValue!5100 thiss!1181) lt!403780))))

(assert (=> b!893777 (= (apply!401 (+!2597 lt!403777 (tuple2!11925 lt!403772 (minValue!5100 thiss!1181))) lt!403780) (apply!401 lt!403777 lt!403780))))

(declare-fun lt!403778 () Unit!30388)

(assert (=> b!893777 (= lt!403778 lt!403771)))

(declare-fun lt!403765 () ListLongMap!10623)

(assert (=> b!893777 (= lt!403765 (getCurrentListMapNoExtraKeys!3318 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403770 () (_ BitVec 64))

(assert (=> b!893777 (= lt!403770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403763 () (_ BitVec 64))

(assert (=> b!893777 (= lt!403763 (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403768 () Unit!30388)

(assert (=> b!893777 (= lt!403768 (addApplyDifferent!328 lt!403765 lt!403770 (zeroValue!5100 thiss!1181) lt!403763))))

(assert (=> b!893777 (= (apply!401 (+!2597 lt!403765 (tuple2!11925 lt!403770 (zeroValue!5100 thiss!1181))) lt!403763) (apply!401 lt!403765 lt!403763))))

(declare-fun lt!403784 () Unit!30388)

(assert (=> b!893777 (= lt!403784 lt!403768)))

(declare-fun lt!403779 () ListLongMap!10623)

(assert (=> b!893777 (= lt!403779 (getCurrentListMapNoExtraKeys!3318 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun lt!403783 () (_ BitVec 64))

(assert (=> b!893777 (= lt!403783 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403769 () (_ BitVec 64))

(assert (=> b!893777 (= lt!403769 (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893777 (= lt!403766 (addApplyDifferent!328 lt!403779 lt!403783 (minValue!5100 thiss!1181) lt!403769))))

(assert (=> b!893777 (= (apply!401 (+!2597 lt!403779 (tuple2!11925 lt!403783 (minValue!5100 thiss!1181))) lt!403769) (apply!401 lt!403779 lt!403769))))

(declare-fun b!893778 () Bool)

(declare-fun e!499120 () Bool)

(declare-fun e!499118 () Bool)

(assert (=> b!893778 (= e!499120 e!499118)))

(declare-fun res!605161 () Bool)

(assert (=> b!893778 (= res!605161 call!39625)))

(assert (=> b!893778 (=> (not res!605161) (not e!499118))))

(declare-fun b!893779 () Bool)

(declare-fun e!499124 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!893779 (= e!499124 (validKeyInArray!0 (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893780 () Bool)

(declare-fun e!499122 () ListLongMap!10623)

(assert (=> b!893780 (= e!499122 call!39626)))

(declare-fun bm!39623 () Bool)

(declare-fun call!39627 () Bool)

(assert (=> bm!39623 (= call!39627 (contains!4343 lt!403767 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893782 () Bool)

(declare-fun e!499121 () Bool)

(declare-fun e!499117 () Bool)

(assert (=> b!893782 (= e!499121 e!499117)))

(declare-fun c!94298 () Bool)

(assert (=> b!893782 (= c!94298 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!39629 () ListLongMap!10623)

(declare-fun call!39630 () ListLongMap!10623)

(declare-fun bm!39624 () Bool)

(declare-fun c!94296 () Bool)

(declare-fun c!94294 () Bool)

(assert (=> bm!39624 (= call!39630 (+!2597 (ite c!94294 call!39629 (ite c!94296 call!39624 call!39626)) (ite (or c!94294 c!94296) (tuple2!11925 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5100 thiss!1181)) (tuple2!11925 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5100 thiss!1181)))))))

(declare-fun b!893783 () Bool)

(declare-fun e!499114 () ListLongMap!10623)

(declare-fun e!499125 () ListLongMap!10623)

(assert (=> b!893783 (= e!499114 e!499125)))

(assert (=> b!893783 (= c!94296 (and (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!893784 () Bool)

(assert (=> b!893784 (= e!499118 (= (apply!401 lt!403767 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5100 thiss!1181)))))

(declare-fun b!893785 () Bool)

(assert (=> b!893785 (= e!499120 (not call!39625))))

(declare-fun b!893786 () Bool)

(declare-fun Unit!30394 () Unit!30388)

(assert (=> b!893786 (= e!499113 Unit!30394)))

(declare-fun b!893787 () Bool)

(declare-fun c!94297 () Bool)

(assert (=> b!893787 (= c!94297 (and (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!893787 (= e!499125 e!499122)))

(declare-fun b!893788 () Bool)

(declare-fun e!499123 () Bool)

(assert (=> b!893788 (= e!499123 (= (apply!401 lt!403767 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5100 thiss!1181)))))

(declare-fun b!893789 () Bool)

(assert (=> b!893789 (= e!499114 (+!2597 call!39630 (tuple2!11925 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5100 thiss!1181))))))

(declare-fun b!893790 () Bool)

(declare-fun e!499115 () Bool)

(assert (=> b!893790 (= e!499115 (validKeyInArray!0 (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39625 () Bool)

(assert (=> bm!39625 (= call!39629 (getCurrentListMapNoExtraKeys!3318 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun bm!39626 () Bool)

(declare-fun call!39628 () ListLongMap!10623)

(assert (=> bm!39626 (= call!39628 call!39630)))

(declare-fun b!893791 () Bool)

(assert (=> b!893791 (= e!499117 e!499123)))

(declare-fun res!605158 () Bool)

(assert (=> b!893791 (= res!605158 call!39627)))

(assert (=> b!893791 (=> (not res!605158) (not e!499123))))

(declare-fun b!893792 () Bool)

(declare-fun e!499119 () Bool)

(assert (=> b!893792 (= e!499119 e!499116)))

(declare-fun res!605157 () Bool)

(assert (=> b!893792 (=> (not res!605157) (not e!499116))))

(assert (=> b!893792 (= res!605157 (contains!4343 lt!403767 (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25613 (_keys!10013 thiss!1181))))))

(declare-fun bm!39627 () Bool)

(assert (=> bm!39627 (= call!39624 call!39629)))

(declare-fun b!893781 () Bool)

(assert (=> b!893781 (= e!499122 call!39628)))

(declare-fun d!110565 () Bool)

(assert (=> d!110565 e!499121))

(declare-fun res!605164 () Bool)

(assert (=> d!110565 (=> (not res!605164) (not e!499121))))

(assert (=> d!110565 (= res!605164 (or (bvsge #b00000000000000000000000000000000 (size!25613 (_keys!10013 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25613 (_keys!10013 thiss!1181))))))))

(declare-fun lt!403764 () ListLongMap!10623)

(assert (=> d!110565 (= lt!403767 lt!403764)))

(declare-fun lt!403774 () Unit!30388)

(assert (=> d!110565 (= lt!403774 e!499113)))

(declare-fun c!94295 () Bool)

(assert (=> d!110565 (= c!94295 e!499124)))

(declare-fun res!605159 () Bool)

(assert (=> d!110565 (=> (not res!605159) (not e!499124))))

(assert (=> d!110565 (= res!605159 (bvslt #b00000000000000000000000000000000 (size!25613 (_keys!10013 thiss!1181))))))

(assert (=> d!110565 (= lt!403764 e!499114)))

(assert (=> d!110565 (= c!94294 (and (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110565 (validMask!0 (mask!25862 thiss!1181))))

(assert (=> d!110565 (= (getCurrentListMap!2604 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)) lt!403767)))

(declare-fun b!893793 () Bool)

(assert (=> b!893793 (= e!499125 call!39628)))

(declare-fun b!893794 () Bool)

(assert (=> b!893794 (= e!499117 (not call!39627))))

(declare-fun b!893795 () Bool)

(declare-fun res!605156 () Bool)

(assert (=> b!893795 (=> (not res!605156) (not e!499121))))

(assert (=> b!893795 (= res!605156 e!499119)))

(declare-fun res!605160 () Bool)

(assert (=> b!893795 (=> res!605160 e!499119)))

(assert (=> b!893795 (= res!605160 (not e!499115))))

(declare-fun res!605163 () Bool)

(assert (=> b!893795 (=> (not res!605163) (not e!499115))))

(assert (=> b!893795 (= res!605163 (bvslt #b00000000000000000000000000000000 (size!25613 (_keys!10013 thiss!1181))))))

(declare-fun b!893796 () Bool)

(declare-fun res!605162 () Bool)

(assert (=> b!893796 (=> (not res!605162) (not e!499121))))

(assert (=> b!893796 (= res!605162 e!499120)))

(declare-fun c!94299 () Bool)

(assert (=> b!893796 (= c!94299 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!110565 c!94294) b!893789))

(assert (= (and d!110565 (not c!94294)) b!893783))

(assert (= (and b!893783 c!94296) b!893793))

(assert (= (and b!893783 (not c!94296)) b!893787))

(assert (= (and b!893787 c!94297) b!893781))

(assert (= (and b!893787 (not c!94297)) b!893780))

(assert (= (or b!893781 b!893780) bm!39621))

(assert (= (or b!893793 bm!39621) bm!39627))

(assert (= (or b!893793 b!893781) bm!39626))

(assert (= (or b!893789 bm!39627) bm!39625))

(assert (= (or b!893789 bm!39626) bm!39624))

(assert (= (and d!110565 res!605159) b!893779))

(assert (= (and d!110565 c!94295) b!893777))

(assert (= (and d!110565 (not c!94295)) b!893786))

(assert (= (and d!110565 res!605164) b!893795))

(assert (= (and b!893795 res!605163) b!893790))

(assert (= (and b!893795 (not res!605160)) b!893792))

(assert (= (and b!893792 res!605157) b!893776))

(assert (= (and b!893795 res!605156) b!893796))

(assert (= (and b!893796 c!94299) b!893778))

(assert (= (and b!893796 (not c!94299)) b!893785))

(assert (= (and b!893778 res!605161) b!893784))

(assert (= (or b!893778 b!893785) bm!39622))

(assert (= (and b!893796 res!605162) b!893782))

(assert (= (and b!893782 c!94298) b!893791))

(assert (= (and b!893782 (not c!94298)) b!893794))

(assert (= (and b!893791 res!605158) b!893788))

(assert (= (or b!893791 b!893794) bm!39623))

(declare-fun b_lambda!12917 () Bool)

(assert (=> (not b_lambda!12917) (not b!893776)))

(assert (=> b!893776 t!25047))

(declare-fun b_and!26103 () Bool)

(assert (= b_and!26093 (and (=> t!25047 result!10029) b_and!26103)))

(declare-fun m!832359 () Bool)

(assert (=> b!893789 m!832359))

(declare-fun m!832361 () Bool)

(assert (=> b!893779 m!832361))

(assert (=> b!893779 m!832361))

(declare-fun m!832363 () Bool)

(assert (=> b!893779 m!832363))

(declare-fun m!832365 () Bool)

(assert (=> bm!39625 m!832365))

(assert (=> b!893790 m!832361))

(assert (=> b!893790 m!832361))

(assert (=> b!893790 m!832363))

(declare-fun m!832367 () Bool)

(assert (=> bm!39623 m!832367))

(declare-fun m!832369 () Bool)

(assert (=> bm!39624 m!832369))

(declare-fun m!832371 () Bool)

(assert (=> b!893788 m!832371))

(declare-fun m!832373 () Bool)

(assert (=> b!893776 m!832373))

(assert (=> b!893776 m!832373))

(assert (=> b!893776 m!832239))

(declare-fun m!832375 () Bool)

(assert (=> b!893776 m!832375))

(assert (=> b!893776 m!832361))

(declare-fun m!832377 () Bool)

(assert (=> b!893776 m!832377))

(assert (=> b!893776 m!832361))

(assert (=> b!893776 m!832239))

(declare-fun m!832379 () Bool)

(assert (=> b!893784 m!832379))

(declare-fun m!832381 () Bool)

(assert (=> bm!39622 m!832381))

(declare-fun m!832383 () Bool)

(assert (=> b!893777 m!832383))

(assert (=> b!893777 m!832383))

(declare-fun m!832385 () Bool)

(assert (=> b!893777 m!832385))

(declare-fun m!832387 () Bool)

(assert (=> b!893777 m!832387))

(declare-fun m!832389 () Bool)

(assert (=> b!893777 m!832389))

(declare-fun m!832391 () Bool)

(assert (=> b!893777 m!832391))

(assert (=> b!893777 m!832365))

(declare-fun m!832393 () Bool)

(assert (=> b!893777 m!832393))

(declare-fun m!832395 () Bool)

(assert (=> b!893777 m!832395))

(assert (=> b!893777 m!832361))

(declare-fun m!832397 () Bool)

(assert (=> b!893777 m!832397))

(declare-fun m!832399 () Bool)

(assert (=> b!893777 m!832399))

(declare-fun m!832401 () Bool)

(assert (=> b!893777 m!832401))

(declare-fun m!832403 () Bool)

(assert (=> b!893777 m!832403))

(declare-fun m!832405 () Bool)

(assert (=> b!893777 m!832405))

(assert (=> b!893777 m!832393))

(declare-fun m!832407 () Bool)

(assert (=> b!893777 m!832407))

(declare-fun m!832409 () Bool)

(assert (=> b!893777 m!832409))

(declare-fun m!832411 () Bool)

(assert (=> b!893777 m!832411))

(assert (=> b!893777 m!832409))

(assert (=> b!893777 m!832397))

(assert (=> b!893792 m!832361))

(assert (=> b!893792 m!832361))

(declare-fun m!832413 () Bool)

(assert (=> b!893792 m!832413))

(assert (=> d!110565 m!832355))

(assert (=> b!893629 d!110565))

(declare-fun b!893817 () Bool)

(declare-fun c!94314 () Bool)

(declare-fun lt!403825 () SeekEntryResult!8810)

(assert (=> b!893817 (= c!94314 ((_ is Found!8810) lt!403825))))

(assert (=> b!893817 (= lt!403825 (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)))))

(declare-fun e!499136 () Bool)

(declare-fun e!499138 () Bool)

(assert (=> b!893817 (= e!499136 e!499138)))

(declare-fun b!893818 () Bool)

(assert (=> b!893818 (= e!499136 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!893819 () Bool)

(declare-fun e!499140 () Bool)

(assert (=> b!893819 (= e!499140 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!893820 () Bool)

(assert (=> b!893820 false))

(declare-fun lt!403822 () Unit!30388)

(declare-fun lt!403816 () Unit!30388)

(assert (=> b!893820 (= lt!403822 lt!403816)))

(declare-fun lt!403823 () SeekEntryResult!8810)

(declare-fun lt!403827 () (_ BitVec 32))

(assert (=> b!893820 (and ((_ is Found!8810) lt!403823) (= (index!37612 lt!403823) lt!403827))))

(assert (=> b!893820 (= lt!403823 (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52333 (_ BitVec 32)) Unit!30388)

(assert (=> b!893820 (= lt!403816 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403827 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)))))

(declare-fun lt!403820 () Unit!30388)

(declare-fun lt!403826 () Unit!30388)

(assert (=> b!893820 (= lt!403820 lt!403826)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52333 (_ BitVec 32)) Bool)

(assert (=> b!893820 (arrayForallSeekEntryOrOpenFound!0 lt!403827 (_keys!10013 thiss!1181) (mask!25862 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30388)

(assert (=> b!893820 (= lt!403826 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10013 thiss!1181) (mask!25862 thiss!1181) #b00000000000000000000000000000000 lt!403827))))

(declare-fun arrayScanForKey!0 (array!52333 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893820 (= lt!403827 (arrayScanForKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403829 () Unit!30388)

(declare-fun lt!403817 () Unit!30388)

(assert (=> b!893820 (= lt!403829 lt!403817)))

(assert (=> b!893820 e!499140))

(declare-fun c!94313 () Bool)

(assert (=> b!893820 (= c!94313 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!163 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64) Int) Unit!30388)

(assert (=> b!893820 (= lt!403817 (lemmaKeyInListMapIsInArray!163 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785 (defaultEntry!5302 thiss!1181)))))

(declare-fun e!499139 () Unit!30388)

(declare-fun Unit!30395 () Unit!30388)

(assert (=> b!893820 (= e!499139 Unit!30395)))

(declare-fun b!893821 () Bool)

(declare-fun e!499137 () Bool)

(assert (=> b!893821 (= e!499137 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!893822 () Bool)

(assert (=> b!893822 (= e!499138 true)))

(declare-fun lt!403815 () Unit!30388)

(assert (=> b!893822 (= lt!403815 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10013 thiss!1181) key!785 (index!37612 lt!403825)))))

(declare-fun call!39638 () Bool)

(assert (=> b!893822 call!39638))

(declare-fun lt!403819 () Unit!30388)

(assert (=> b!893822 (= lt!403819 lt!403815)))

(declare-fun lt!403828 () Unit!30388)

(assert (=> b!893822 (= lt!403828 (lemmaValidKeyInArrayIsInListMap!234 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) (index!37612 lt!403825) (defaultEntry!5302 thiss!1181)))))

(declare-fun call!39637 () Bool)

(assert (=> b!893822 call!39637))

(declare-fun lt!403821 () Unit!30388)

(assert (=> b!893822 (= lt!403821 lt!403828)))

(declare-fun d!110567 () Bool)

(declare-fun lt!403824 () Bool)

(assert (=> d!110567 (= lt!403824 (contains!4343 (map!12190 thiss!1181) key!785))))

(assert (=> d!110567 (= lt!403824 e!499137)))

(declare-fun c!94312 () Bool)

(assert (=> d!110567 (= c!94312 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110567 (valid!1639 thiss!1181)))

(assert (=> d!110567 (= (contains!4342 thiss!1181 key!785) lt!403824)))

(declare-fun bm!39634 () Bool)

(declare-fun call!39639 () ListLongMap!10623)

(assert (=> bm!39634 (= call!39639 (getCurrentListMap!2604 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun bm!39635 () Bool)

(assert (=> bm!39635 (= call!39638 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!893823 () Bool)

(assert (=> b!893823 (= e!499140 call!39638)))

(declare-fun b!893824 () Bool)

(assert (=> b!893824 (= e!499138 false)))

(declare-fun c!94310 () Bool)

(assert (=> b!893824 (= c!94310 call!39637)))

(declare-fun lt!403818 () Unit!30388)

(assert (=> b!893824 (= lt!403818 e!499139)))

(declare-fun b!893825 () Bool)

(declare-fun Unit!30396 () Unit!30388)

(assert (=> b!893825 (= e!499139 Unit!30396)))

(declare-fun bm!39636 () Bool)

(assert (=> bm!39636 (= call!39637 (contains!4343 call!39639 (ite c!94314 (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403825)) key!785)))))

(declare-fun b!893826 () Bool)

(assert (=> b!893826 (= e!499137 e!499136)))

(declare-fun c!94311 () Bool)

(assert (=> b!893826 (= c!94311 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!110567 c!94312) b!893821))

(assert (= (and d!110567 (not c!94312)) b!893826))

(assert (= (and b!893826 c!94311) b!893818))

(assert (= (and b!893826 (not c!94311)) b!893817))

(assert (= (and b!893817 c!94314) b!893822))

(assert (= (and b!893817 (not c!94314)) b!893824))

(assert (= (and b!893824 c!94310) b!893820))

(assert (= (and b!893824 (not c!94310)) b!893825))

(assert (= (and b!893820 c!94313) b!893823))

(assert (= (and b!893820 (not c!94313)) b!893819))

(assert (= (or b!893822 b!893823) bm!39635))

(assert (= (or b!893822 b!893824) bm!39634))

(assert (= (or b!893822 b!893824) bm!39636))

(assert (=> b!893817 m!832231))

(assert (=> bm!39635 m!832249))

(assert (=> d!110567 m!832219))

(assert (=> d!110567 m!832219))

(declare-fun m!832415 () Bool)

(assert (=> d!110567 m!832415))

(assert (=> d!110567 m!832235))

(declare-fun m!832417 () Bool)

(assert (=> b!893820 m!832417))

(declare-fun m!832419 () Bool)

(assert (=> b!893820 m!832419))

(declare-fun m!832421 () Bool)

(assert (=> b!893820 m!832421))

(assert (=> b!893820 m!832231))

(declare-fun m!832423 () Bool)

(assert (=> b!893820 m!832423))

(declare-fun m!832425 () Bool)

(assert (=> b!893820 m!832425))

(assert (=> bm!39634 m!832255))

(declare-fun m!832427 () Bool)

(assert (=> b!893822 m!832427))

(declare-fun m!832429 () Bool)

(assert (=> b!893822 m!832429))

(declare-fun m!832431 () Bool)

(assert (=> bm!39636 m!832431))

(declare-fun m!832433 () Bool)

(assert (=> bm!39636 m!832433))

(assert (=> b!893629 d!110567))

(declare-fun bm!39645 () Bool)

(declare-fun call!39650 () ListLongMap!10623)

(assert (=> bm!39645 (= call!39650 (getCurrentListMap!2604 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun b!893842 () Bool)

(declare-fun e!499154 () Bool)

(declare-fun call!39649 () V!29175)

(assert (=> b!893842 (= e!499154 (= call!39649 (zeroValue!5100 thiss!1181)))))

(declare-fun call!39651 () V!29175)

(declare-fun b!893843 () Bool)

(declare-fun e!499155 () Bool)

(assert (=> b!893843 (= e!499155 (= call!39651 (get!13262 (select (arr!25169 (_values!5287 thiss!1181)) (index!37612 lt!403671)) (dynLambda!1311 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893843 (and (bvsge (index!37612 lt!403671) #b00000000000000000000000000000000) (bvslt (index!37612 lt!403671) (size!25614 (_values!5287 thiss!1181))))))

(declare-fun b!893844 () Bool)

(declare-fun e!499151 () Bool)

(declare-fun e!499153 () Bool)

(assert (=> b!893844 (= e!499151 e!499153)))

(declare-fun c!94320 () Bool)

(assert (=> b!893844 (= c!94320 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893845 () Bool)

(declare-fun res!605173 () Bool)

(declare-fun e!499152 () Bool)

(assert (=> b!893845 (=> (not res!605173) (not e!499152))))

(assert (=> b!893845 (= res!605173 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!893845 (= e!499153 e!499152)))

(declare-fun bm!39646 () Bool)

(assert (=> bm!39646 (= call!39651 call!39649)))

(declare-fun bm!39647 () Bool)

(declare-fun call!39648 () ListLongMap!10623)

(assert (=> bm!39647 (= call!39648 call!39650)))

(declare-fun b!893846 () Bool)

(assert (=> b!893846 (= e!499152 (= call!39651 (minValue!5100 thiss!1181)))))

(declare-fun b!893841 () Bool)

(declare-fun res!605171 () Bool)

(assert (=> b!893841 (=> (not res!605171) (not e!499155))))

(assert (=> b!893841 (= res!605171 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (=> b!893841 (= e!499153 e!499155)))

(declare-fun d!110569 () Bool)

(assert (=> d!110569 e!499151))

(declare-fun c!94319 () Bool)

(assert (=> d!110569 (= c!94319 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403832 () Unit!30388)

(declare-fun choose!1467 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64) (_ BitVec 32) Int) Unit!30388)

(assert (=> d!110569 (= lt!403832 (choose!1467 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785 (index!37612 lt!403671) (defaultEntry!5302 thiss!1181)))))

(assert (=> d!110569 (validMask!0 (mask!25862 thiss!1181))))

(assert (=> d!110569 (= (lemmaKeyInListMapThenSameValueInArray!8 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785 (index!37612 lt!403671) (defaultEntry!5302 thiss!1181)) lt!403832)))

(declare-fun b!893847 () Bool)

(assert (=> b!893847 (= e!499151 e!499154)))

(declare-fun res!605172 () Bool)

(assert (=> b!893847 (= res!605172 (not (= (bvand (extraKeys!4996 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!893847 (=> (not res!605172) (not e!499154))))

(declare-fun bm!39648 () Bool)

(assert (=> bm!39648 (= call!39649 (apply!401 (ite c!94319 call!39650 call!39648) key!785))))

(assert (= (and d!110569 c!94319) b!893847))

(assert (= (and d!110569 (not c!94319)) b!893844))

(assert (= (and b!893847 res!605172) b!893842))

(assert (= (and b!893844 c!94320) b!893845))

(assert (= (and b!893844 (not c!94320)) b!893841))

(assert (= (and b!893845 res!605173) b!893846))

(assert (= (and b!893841 res!605171) b!893843))

(assert (= (or b!893846 b!893843) bm!39647))

(assert (= (or b!893846 b!893843) bm!39646))

(assert (= (or b!893842 bm!39647) bm!39645))

(assert (= (or b!893842 bm!39646) bm!39648))

(declare-fun b_lambda!12919 () Bool)

(assert (=> (not b_lambda!12919) (not b!893843)))

(assert (=> b!893843 t!25047))

(declare-fun b_and!26105 () Bool)

(assert (= b_and!26103 (and (=> t!25047 result!10029) b_and!26105)))

(declare-fun m!832435 () Bool)

(assert (=> d!110569 m!832435))

(assert (=> d!110569 m!832355))

(assert (=> b!893841 m!832249))

(assert (=> b!893843 m!832237))

(assert (=> b!893843 m!832239))

(assert (=> b!893843 m!832237))

(assert (=> b!893843 m!832239))

(assert (=> b!893843 m!832241))

(assert (=> bm!39645 m!832255))

(declare-fun m!832437 () Bool)

(assert (=> bm!39648 m!832437))

(assert (=> b!893629 d!110569))

(declare-fun d!110571 () Bool)

(declare-fun res!605178 () Bool)

(declare-fun e!499160 () Bool)

(assert (=> d!110571 (=> res!605178 e!499160)))

(assert (=> d!110571 (= res!605178 (= (select (arr!25168 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110571 (= (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 #b00000000000000000000000000000000) e!499160)))

(declare-fun b!893852 () Bool)

(declare-fun e!499161 () Bool)

(assert (=> b!893852 (= e!499160 e!499161)))

(declare-fun res!605179 () Bool)

(assert (=> b!893852 (=> (not res!605179) (not e!499161))))

(assert (=> b!893852 (= res!605179 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25613 (_keys!10013 thiss!1181))))))

(declare-fun b!893853 () Bool)

(assert (=> b!893853 (= e!499161 (arrayContainsKey!0 (_keys!10013 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110571 (not res!605178)) b!893852))

(assert (= (and b!893852 res!605179) b!893853))

(assert (=> d!110571 m!832361))

(declare-fun m!832439 () Bool)

(assert (=> b!893853 m!832439))

(assert (=> b!893629 d!110571))

(declare-fun d!110573 () Bool)

(declare-fun e!499166 () Bool)

(assert (=> d!110573 e!499166))

(declare-fun res!605182 () Bool)

(assert (=> d!110573 (=> res!605182 e!499166)))

(declare-fun lt!403843 () Bool)

(assert (=> d!110573 (= res!605182 (not lt!403843))))

(declare-fun lt!403844 () Bool)

(assert (=> d!110573 (= lt!403843 lt!403844)))

(declare-fun lt!403842 () Unit!30388)

(declare-fun e!499167 () Unit!30388)

(assert (=> d!110573 (= lt!403842 e!499167)))

(declare-fun c!94323 () Bool)

(assert (=> d!110573 (= c!94323 lt!403844)))

(declare-fun containsKey!423 (List!17743 (_ BitVec 64)) Bool)

(assert (=> d!110573 (= lt!403844 (containsKey!423 (toList!5327 lt!403674) (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403671))))))

(assert (=> d!110573 (= (contains!4343 lt!403674 (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403671))) lt!403843)))

(declare-fun b!893860 () Bool)

(declare-fun lt!403841 () Unit!30388)

(assert (=> b!893860 (= e!499167 lt!403841)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!317 (List!17743 (_ BitVec 64)) Unit!30388)

(assert (=> b!893860 (= lt!403841 (lemmaContainsKeyImpliesGetValueByKeyDefined!317 (toList!5327 lt!403674) (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403671))))))

(assert (=> b!893860 (isDefined!323 (getValueByKey!443 (toList!5327 lt!403674) (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403671))))))

(declare-fun b!893861 () Bool)

(declare-fun Unit!30397 () Unit!30388)

(assert (=> b!893861 (= e!499167 Unit!30397)))

(declare-fun b!893862 () Bool)

(assert (=> b!893862 (= e!499166 (isDefined!323 (getValueByKey!443 (toList!5327 lt!403674) (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403671)))))))

(assert (= (and d!110573 c!94323) b!893860))

(assert (= (and d!110573 (not c!94323)) b!893861))

(assert (= (and d!110573 (not res!605182)) b!893862))

(assert (=> d!110573 m!832243))

(declare-fun m!832441 () Bool)

(assert (=> d!110573 m!832441))

(assert (=> b!893860 m!832243))

(declare-fun m!832443 () Bool)

(assert (=> b!893860 m!832443))

(assert (=> b!893860 m!832243))

(declare-fun m!832445 () Bool)

(assert (=> b!893860 m!832445))

(assert (=> b!893860 m!832445))

(declare-fun m!832447 () Bool)

(assert (=> b!893860 m!832447))

(assert (=> b!893862 m!832243))

(assert (=> b!893862 m!832445))

(assert (=> b!893862 m!832445))

(assert (=> b!893862 m!832447))

(assert (=> b!893629 d!110573))

(declare-fun d!110575 () Bool)

(assert (=> d!110575 (= (array_inv!19818 (_keys!10013 thiss!1181)) (bvsge (size!25613 (_keys!10013 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893631 d!110575))

(declare-fun d!110577 () Bool)

(assert (=> d!110577 (= (array_inv!19819 (_values!5287 thiss!1181)) (bvsge (size!25614 (_values!5287 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893631 d!110577))

(declare-fun d!110579 () Bool)

(assert (=> d!110579 (= (inRange!0 (index!37612 lt!403671) (mask!25862 thiss!1181)) (and (bvsge (index!37612 lt!403671) #b00000000000000000000000000000000) (bvslt (index!37612 lt!403671) (bvadd (mask!25862 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!893632 d!110579))

(declare-fun d!110581 () Bool)

(declare-fun e!499170 () Bool)

(assert (=> d!110581 e!499170))

(declare-fun res!605185 () Bool)

(assert (=> d!110581 (=> res!605185 e!499170)))

(declare-fun lt!403850 () SeekEntryResult!8810)

(assert (=> d!110581 (= res!605185 (not ((_ is Found!8810) lt!403850)))))

(assert (=> d!110581 (= lt!403850 (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)))))

(declare-fun lt!403849 () Unit!30388)

(declare-fun choose!1468 (array!52333 array!52335 (_ BitVec 32) (_ BitVec 32) V!29175 V!29175 (_ BitVec 64)) Unit!30388)

(assert (=> d!110581 (= lt!403849 (choose!1468 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785))))

(assert (=> d!110581 (validMask!0 (mask!25862 thiss!1181))))

(assert (=> d!110581 (= (lemmaSeekEntryGivesInRangeIndex!60 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) key!785) lt!403849)))

(declare-fun b!893865 () Bool)

(assert (=> b!893865 (= e!499170 (inRange!0 (index!37612 lt!403850) (mask!25862 thiss!1181)))))

(assert (= (and d!110581 (not res!605185)) b!893865))

(assert (=> d!110581 m!832231))

(declare-fun m!832449 () Bool)

(assert (=> d!110581 m!832449))

(assert (=> d!110581 m!832355))

(declare-fun m!832451 () Bool)

(assert (=> b!893865 m!832451))

(assert (=> b!893623 d!110581))

(declare-fun b!893878 () Bool)

(declare-fun e!499179 () SeekEntryResult!8810)

(declare-fun lt!403862 () SeekEntryResult!8810)

(assert (=> b!893878 (= e!499179 (ite ((_ is MissingVacant!8810) lt!403862) (MissingZero!8810 (index!37614 lt!403862)) lt!403862))))

(declare-fun lt!403859 () SeekEntryResult!8810)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52333 (_ BitVec 32)) SeekEntryResult!8810)

(assert (=> b!893878 (= lt!403862 (seekKeyOrZeroReturnVacant!0 (x!75854 lt!403859) (index!37613 lt!403859) (index!37613 lt!403859) key!785 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)))))

(declare-fun b!893879 () Bool)

(declare-fun e!499178 () SeekEntryResult!8810)

(assert (=> b!893879 (= e!499178 Undefined!8810)))

(declare-fun b!893880 () Bool)

(declare-fun e!499177 () SeekEntryResult!8810)

(assert (=> b!893880 (= e!499177 (Found!8810 (index!37613 lt!403859)))))

(declare-fun b!893881 () Bool)

(declare-fun c!94331 () Bool)

(declare-fun lt!403861 () (_ BitVec 64))

(assert (=> b!893881 (= c!94331 (= lt!403861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893881 (= e!499177 e!499179)))

(declare-fun b!893882 () Bool)

(assert (=> b!893882 (= e!499178 e!499177)))

(assert (=> b!893882 (= lt!403861 (select (arr!25168 (_keys!10013 thiss!1181)) (index!37613 lt!403859)))))

(declare-fun c!94330 () Bool)

(assert (=> b!893882 (= c!94330 (= lt!403861 key!785))))

(declare-fun b!893883 () Bool)

(assert (=> b!893883 (= e!499179 (MissingZero!8810 (index!37613 lt!403859)))))

(declare-fun d!110583 () Bool)

(declare-fun lt!403860 () SeekEntryResult!8810)

(assert (=> d!110583 (and (or ((_ is MissingVacant!8810) lt!403860) (not ((_ is Found!8810) lt!403860)) (and (bvsge (index!37612 lt!403860) #b00000000000000000000000000000000) (bvslt (index!37612 lt!403860) (size!25613 (_keys!10013 thiss!1181))))) (not ((_ is MissingVacant!8810) lt!403860)) (or (not ((_ is Found!8810) lt!403860)) (= (select (arr!25168 (_keys!10013 thiss!1181)) (index!37612 lt!403860)) key!785)))))

(assert (=> d!110583 (= lt!403860 e!499178)))

(declare-fun c!94332 () Bool)

(assert (=> d!110583 (= c!94332 (and ((_ is Intermediate!8810) lt!403859) (undefined!9622 lt!403859)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52333 (_ BitVec 32)) SeekEntryResult!8810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110583 (= lt!403859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25862 thiss!1181)) key!785 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)))))

(assert (=> d!110583 (validMask!0 (mask!25862 thiss!1181))))

(assert (=> d!110583 (= (seekEntry!0 key!785 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)) lt!403860)))

(assert (= (and d!110583 c!94332) b!893879))

(assert (= (and d!110583 (not c!94332)) b!893882))

(assert (= (and b!893882 c!94330) b!893880))

(assert (= (and b!893882 (not c!94330)) b!893881))

(assert (= (and b!893881 c!94331) b!893883))

(assert (= (and b!893881 (not c!94331)) b!893878))

(declare-fun m!832453 () Bool)

(assert (=> b!893878 m!832453))

(declare-fun m!832455 () Bool)

(assert (=> b!893882 m!832455))

(declare-fun m!832457 () Bool)

(assert (=> d!110583 m!832457))

(declare-fun m!832459 () Bool)

(assert (=> d!110583 m!832459))

(assert (=> d!110583 m!832459))

(declare-fun m!832461 () Bool)

(assert (=> d!110583 m!832461))

(assert (=> d!110583 m!832355))

(assert (=> b!893623 d!110583))

(declare-fun d!110585 () Bool)

(declare-fun res!605192 () Bool)

(declare-fun e!499182 () Bool)

(assert (=> d!110585 (=> (not res!605192) (not e!499182))))

(declare-fun simpleValid!295 (LongMapFixedSize!4210) Bool)

(assert (=> d!110585 (= res!605192 (simpleValid!295 thiss!1181))))

(assert (=> d!110585 (= (valid!1639 thiss!1181) e!499182)))

(declare-fun b!893890 () Bool)

(declare-fun res!605193 () Bool)

(assert (=> b!893890 (=> (not res!605193) (not e!499182))))

(declare-fun arrayCountValidKeys!0 (array!52333 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893890 (= res!605193 (= (arrayCountValidKeys!0 (_keys!10013 thiss!1181) #b00000000000000000000000000000000 (size!25613 (_keys!10013 thiss!1181))) (_size!2160 thiss!1181)))))

(declare-fun b!893891 () Bool)

(declare-fun res!605194 () Bool)

(assert (=> b!893891 (=> (not res!605194) (not e!499182))))

(assert (=> b!893891 (= res!605194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10013 thiss!1181) (mask!25862 thiss!1181)))))

(declare-fun b!893892 () Bool)

(declare-datatypes ((List!17745 0))(
  ( (Nil!17742) (Cons!17741 (h!18878 (_ BitVec 64)) (t!25054 List!17745)) )
))
(declare-fun arrayNoDuplicates!0 (array!52333 (_ BitVec 32) List!17745) Bool)

(assert (=> b!893892 (= e!499182 (arrayNoDuplicates!0 (_keys!10013 thiss!1181) #b00000000000000000000000000000000 Nil!17742))))

(assert (= (and d!110585 res!605192) b!893890))

(assert (= (and b!893890 res!605193) b!893891))

(assert (= (and b!893891 res!605194) b!893892))

(declare-fun m!832463 () Bool)

(assert (=> d!110585 m!832463))

(declare-fun m!832465 () Bool)

(assert (=> b!893890 m!832465))

(declare-fun m!832467 () Bool)

(assert (=> b!893891 m!832467))

(declare-fun m!832469 () Bool)

(assert (=> b!893892 m!832469))

(assert (=> start!76026 d!110585))

(declare-fun d!110587 () Bool)

(declare-fun c!94335 () Bool)

(assert (=> d!110587 (= c!94335 ((_ is ValueCellFull!8597) (select (arr!25169 (_values!5287 thiss!1181)) (index!37612 lt!403671))))))

(declare-fun e!499185 () V!29175)

(assert (=> d!110587 (= (get!13262 (select (arr!25169 (_values!5287 thiss!1181)) (index!37612 lt!403671)) (dynLambda!1311 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!499185)))

(declare-fun b!893897 () Bool)

(declare-fun get!13264 (ValueCell!8597 V!29175) V!29175)

(assert (=> b!893897 (= e!499185 (get!13264 (select (arr!25169 (_values!5287 thiss!1181)) (index!37612 lt!403671)) (dynLambda!1311 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893898 () Bool)

(declare-fun get!13265 (ValueCell!8597 V!29175) V!29175)

(assert (=> b!893898 (= e!499185 (get!13265 (select (arr!25169 (_values!5287 thiss!1181)) (index!37612 lt!403671)) (dynLambda!1311 (defaultEntry!5302 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110587 c!94335) b!893897))

(assert (= (and d!110587 (not c!94335)) b!893898))

(assert (=> b!893897 m!832237))

(assert (=> b!893897 m!832239))

(declare-fun m!832471 () Bool)

(assert (=> b!893897 m!832471))

(assert (=> b!893898 m!832237))

(assert (=> b!893898 m!832239))

(declare-fun m!832473 () Bool)

(assert (=> b!893898 m!832473))

(assert (=> b!893628 d!110587))

(declare-fun d!110589 () Bool)

(declare-fun isEmpty!684 (Option!449) Bool)

(assert (=> d!110589 (= (isDefined!323 (getValueByKey!443 (toList!5327 (map!12190 thiss!1181)) key!785)) (not (isEmpty!684 (getValueByKey!443 (toList!5327 (map!12190 thiss!1181)) key!785))))))

(declare-fun bs!25069 () Bool)

(assert (= bs!25069 d!110589))

(assert (=> bs!25069 m!832221))

(declare-fun m!832475 () Bool)

(assert (=> bs!25069 m!832475))

(assert (=> b!893634 d!110589))

(declare-fun b!893908 () Bool)

(declare-fun e!499190 () Option!449)

(declare-fun e!499191 () Option!449)

(assert (=> b!893908 (= e!499190 e!499191)))

(declare-fun c!94341 () Bool)

(assert (=> b!893908 (= c!94341 (and ((_ is Cons!17739) (toList!5327 (map!12190 thiss!1181))) (not (= (_1!5973 (h!18876 (toList!5327 (map!12190 thiss!1181)))) key!785))))))

(declare-fun b!893907 () Bool)

(assert (=> b!893907 (= e!499190 (Some!448 (_2!5973 (h!18876 (toList!5327 (map!12190 thiss!1181))))))))

(declare-fun b!893910 () Bool)

(assert (=> b!893910 (= e!499191 None!447)))

(declare-fun d!110591 () Bool)

(declare-fun c!94340 () Bool)

(assert (=> d!110591 (= c!94340 (and ((_ is Cons!17739) (toList!5327 (map!12190 thiss!1181))) (= (_1!5973 (h!18876 (toList!5327 (map!12190 thiss!1181)))) key!785)))))

(assert (=> d!110591 (= (getValueByKey!443 (toList!5327 (map!12190 thiss!1181)) key!785) e!499190)))

(declare-fun b!893909 () Bool)

(assert (=> b!893909 (= e!499191 (getValueByKey!443 (t!25048 (toList!5327 (map!12190 thiss!1181))) key!785))))

(assert (= (and d!110591 c!94340) b!893907))

(assert (= (and d!110591 (not c!94340)) b!893908))

(assert (= (and b!893908 c!94341) b!893909))

(assert (= (and b!893908 (not c!94341)) b!893910))

(declare-fun m!832477 () Bool)

(assert (=> b!893909 m!832477))

(assert (=> b!893634 d!110591))

(declare-fun d!110593 () Bool)

(assert (=> d!110593 (= (map!12190 thiss!1181) (getCurrentListMap!2604 (_keys!10013 thiss!1181) (_values!5287 thiss!1181) (mask!25862 thiss!1181) (extraKeys!4996 thiss!1181) (zeroValue!5100 thiss!1181) (minValue!5100 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5302 thiss!1181)))))

(declare-fun bs!25070 () Bool)

(assert (= bs!25070 d!110593))

(assert (=> bs!25070 m!832255))

(assert (=> b!893634 d!110593))

(declare-fun d!110595 () Bool)

(declare-fun get!13266 (Option!449) V!29175)

(assert (=> d!110595 (= (apply!401 lt!403674 key!785) (get!13266 (getValueByKey!443 (toList!5327 lt!403674) key!785)))))

(declare-fun bs!25071 () Bool)

(assert (= bs!25071 d!110595))

(declare-fun m!832479 () Bool)

(assert (=> bs!25071 m!832479))

(assert (=> bs!25071 m!832479))

(declare-fun m!832481 () Bool)

(assert (=> bs!25071 m!832481))

(assert (=> bm!39593 d!110595))

(declare-fun mapIsEmpty!28799 () Bool)

(declare-fun mapRes!28799 () Bool)

(assert (=> mapIsEmpty!28799 mapRes!28799))

(declare-fun b!893917 () Bool)

(declare-fun e!499196 () Bool)

(assert (=> b!893917 (= e!499196 tp_is_empty!18157)))

(declare-fun b!893918 () Bool)

(declare-fun e!499197 () Bool)

(assert (=> b!893918 (= e!499197 tp_is_empty!18157)))

(declare-fun condMapEmpty!28799 () Bool)

(declare-fun mapDefault!28799 () ValueCell!8597)

(assert (=> mapNonEmpty!28790 (= condMapEmpty!28799 (= mapRest!28790 ((as const (Array (_ BitVec 32) ValueCell!8597)) mapDefault!28799)))))

(assert (=> mapNonEmpty!28790 (= tp!55456 (and e!499197 mapRes!28799))))

(declare-fun mapNonEmpty!28799 () Bool)

(declare-fun tp!55472 () Bool)

(assert (=> mapNonEmpty!28799 (= mapRes!28799 (and tp!55472 e!499196))))

(declare-fun mapValue!28799 () ValueCell!8597)

(declare-fun mapKey!28799 () (_ BitVec 32))

(declare-fun mapRest!28799 () (Array (_ BitVec 32) ValueCell!8597))

(assert (=> mapNonEmpty!28799 (= mapRest!28790 (store mapRest!28799 mapKey!28799 mapValue!28799))))

(assert (= (and mapNonEmpty!28790 condMapEmpty!28799) mapIsEmpty!28799))

(assert (= (and mapNonEmpty!28790 (not condMapEmpty!28799)) mapNonEmpty!28799))

(assert (= (and mapNonEmpty!28799 ((_ is ValueCellFull!8597) mapValue!28799)) b!893917))

(assert (= (and mapNonEmpty!28790 ((_ is ValueCellFull!8597) mapDefault!28799)) b!893918))

(declare-fun m!832483 () Bool)

(assert (=> mapNonEmpty!28799 m!832483))

(declare-fun b_lambda!12921 () Bool)

(assert (= b_lambda!12917 (or (and b!893631 b_free!15829) b_lambda!12921)))

(declare-fun b_lambda!12923 () Bool)

(assert (= b_lambda!12919 (or (and b!893631 b_free!15829) b_lambda!12923)))

(check-sat (not b!893853) (not b!893897) (not b!893788) (not b!893776) (not b!893865) (not mapNonEmpty!28799) (not bm!39636) (not bm!39635) (not b!893890) (not b!893784) (not d!110585) (not d!110565) (not b!893733) (not bm!39622) (not bm!39625) (not b_lambda!12921) (not d!110567) (not b!893891) (not b!893878) (not b!893841) (not b!893862) (not b!893822) (not b!893820) (not b!893777) (not d!110561) (not b!893817) (not d!110583) (not d!110593) (not b!893860) (not b!893779) b_and!26105 tp_is_empty!18157 (not b!893792) (not b!893909) (not b_next!15829) (not bm!39648) (not b!893843) (not d!110569) (not d!110589) (not b!893789) (not bm!39634) (not d!110563) (not b!893790) (not d!110573) (not bm!39624) (not bm!39623) (not b_lambda!12915) (not d!110581) (not b!893892) (not b_lambda!12923) (not d!110595) (not b!893898) (not bm!39645))
(check-sat b_and!26105 (not b_next!15829))
