; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21854 () Bool)

(assert start!21854)

(declare-fun b!220312 () Bool)

(declare-fun b_free!5917 () Bool)

(declare-fun b_next!5917 () Bool)

(assert (=> b!220312 (= b_free!5917 (not b_next!5917))))

(declare-fun tp!20892 () Bool)

(declare-fun b_and!12829 () Bool)

(assert (=> b!220312 (= tp!20892 b_and!12829)))

(declare-fun b!220305 () Bool)

(declare-datatypes ((Unit!6549 0))(
  ( (Unit!6550) )
))
(declare-fun e!143244 () Unit!6549)

(declare-fun lt!112200 () Unit!6549)

(assert (=> b!220305 (= e!143244 lt!112200)))

(declare-datatypes ((V!7353 0))(
  ( (V!7354 (val!2934 Int)) )
))
(declare-datatypes ((ValueCell!2546 0))(
  ( (ValueCellFull!2546 (v!4955 V!7353)) (EmptyCell!2546) )
))
(declare-datatypes ((array!10799 0))(
  ( (array!10800 (arr!5119 (Array (_ BitVec 32) ValueCell!2546)) (size!5452 (_ BitVec 32))) )
))
(declare-datatypes ((array!10801 0))(
  ( (array!10802 (arr!5120 (Array (_ BitVec 32) (_ BitVec 64))) (size!5453 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2992 0))(
  ( (LongMapFixedSize!2993 (defaultEntry!4155 Int) (mask!9955 (_ BitVec 32)) (extraKeys!3892 (_ BitVec 32)) (zeroValue!3996 V!7353) (minValue!3996 V!7353) (_size!1545 (_ BitVec 32)) (_keys!6209 array!10801) (_values!4138 array!10799) (_vacant!1545 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2992)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!195 (array!10801 array!10799 (_ BitVec 32) (_ BitVec 32) V!7353 V!7353 (_ BitVec 64) Int) Unit!6549)

(assert (=> b!220305 (= lt!112200 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!195 (_keys!6209 thiss!1504) (_values!4138 thiss!1504) (mask!9955 thiss!1504) (extraKeys!3892 thiss!1504) (zeroValue!3996 thiss!1504) (minValue!3996 thiss!1504) key!932 (defaultEntry!4155 thiss!1504)))))

(declare-fun c!36672 () Bool)

(declare-datatypes ((SeekEntryResult!783 0))(
  ( (MissingZero!783 (index!5302 (_ BitVec 32))) (Found!783 (index!5303 (_ BitVec 32))) (Intermediate!783 (undefined!1595 Bool) (index!5304 (_ BitVec 32)) (x!22923 (_ BitVec 32))) (Undefined!783) (MissingVacant!783 (index!5305 (_ BitVec 32))) )
))
(declare-fun lt!112197 () SeekEntryResult!783)

(get-info :version)

(assert (=> b!220305 (= c!36672 ((_ is MissingZero!783) lt!112197))))

(declare-fun e!143253 () Bool)

(assert (=> b!220305 e!143253))

(declare-fun b!220306 () Bool)

(declare-fun c!36673 () Bool)

(assert (=> b!220306 (= c!36673 ((_ is MissingVacant!783) lt!112197))))

(declare-fun e!143243 () Bool)

(assert (=> b!220306 (= e!143253 e!143243)))

(declare-fun b!220308 () Bool)

(declare-fun e!143248 () Bool)

(declare-fun call!20573 () Bool)

(assert (=> b!220308 (= e!143248 (not call!20573))))

(declare-fun b!220309 () Bool)

(declare-fun e!143245 () Bool)

(assert (=> b!220309 (= e!143243 e!143245)))

(declare-fun res!108019 () Bool)

(declare-fun call!20574 () Bool)

(assert (=> b!220309 (= res!108019 call!20574)))

(assert (=> b!220309 (=> (not res!108019) (not e!143245))))

(declare-fun b!220310 () Bool)

(declare-fun e!143251 () Bool)

(declare-fun tp_is_empty!5779 () Bool)

(assert (=> b!220310 (= e!143251 tp_is_empty!5779)))

(declare-fun b!220311 () Bool)

(declare-fun e!143254 () Bool)

(declare-fun e!143249 () Bool)

(assert (=> b!220311 (= e!143254 e!143249)))

(declare-fun res!108013 () Bool)

(assert (=> b!220311 (=> (not res!108013) (not e!143249))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220311 (= res!108013 (inRange!0 index!297 (mask!9955 thiss!1504)))))

(declare-fun lt!112198 () Unit!6549)

(assert (=> b!220311 (= lt!112198 e!143244)))

(declare-fun c!36671 () Bool)

(declare-datatypes ((tuple2!4276 0))(
  ( (tuple2!4277 (_1!2149 (_ BitVec 64)) (_2!2149 V!7353)) )
))
(declare-datatypes ((List!3172 0))(
  ( (Nil!3169) (Cons!3168 (h!3816 tuple2!4276) (t!8123 List!3172)) )
))
(declare-datatypes ((ListLongMap!3191 0))(
  ( (ListLongMap!3192 (toList!1611 List!3172)) )
))
(declare-fun contains!1468 (ListLongMap!3191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1143 (array!10801 array!10799 (_ BitVec 32) (_ BitVec 32) V!7353 V!7353 (_ BitVec 32) Int) ListLongMap!3191)

(assert (=> b!220311 (= c!36671 (contains!1468 (getCurrentListMap!1143 (_keys!6209 thiss!1504) (_values!4138 thiss!1504) (mask!9955 thiss!1504) (extraKeys!3892 thiss!1504) (zeroValue!3996 thiss!1504) (minValue!3996 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4155 thiss!1504)) key!932))))

(declare-fun e!143255 () Bool)

(declare-fun e!143246 () Bool)

(declare-fun array_inv!3363 (array!10801) Bool)

(declare-fun array_inv!3364 (array!10799) Bool)

(assert (=> b!220312 (= e!143255 (and tp!20892 tp_is_empty!5779 (array_inv!3363 (_keys!6209 thiss!1504)) (array_inv!3364 (_values!4138 thiss!1504)) e!143246))))

(declare-fun b!220313 () Bool)

(declare-fun res!108022 () Bool)

(assert (=> b!220313 (=> (not res!108022) (not e!143248))))

(assert (=> b!220313 (= res!108022 call!20574)))

(assert (=> b!220313 (= e!143253 e!143248)))

(declare-fun b!220314 () Bool)

(assert (=> b!220314 (= e!143249 false)))

(declare-fun lt!112201 () Bool)

(declare-datatypes ((List!3173 0))(
  ( (Nil!3170) (Cons!3169 (h!3817 (_ BitVec 64)) (t!8124 List!3173)) )
))
(declare-fun arrayNoDuplicates!0 (array!10801 (_ BitVec 32) List!3173) Bool)

(assert (=> b!220314 (= lt!112201 (arrayNoDuplicates!0 (_keys!6209 thiss!1504) #b00000000000000000000000000000000 Nil!3170))))

(declare-fun mapIsEmpty!9838 () Bool)

(declare-fun mapRes!9838 () Bool)

(assert (=> mapIsEmpty!9838 mapRes!9838))

(declare-fun b!220315 () Bool)

(declare-fun res!108011 () Bool)

(assert (=> b!220315 (=> (not res!108011) (not e!143248))))

(assert (=> b!220315 (= res!108011 (= (select (arr!5120 (_keys!6209 thiss!1504)) (index!5302 lt!112197)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220316 () Bool)

(declare-fun res!108016 () Bool)

(assert (=> b!220316 (=> (not res!108016) (not e!143249))))

(declare-fun arrayContainsKey!0 (array!10801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220316 (= res!108016 (arrayContainsKey!0 (_keys!6209 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220317 () Bool)

(declare-fun res!108015 () Bool)

(assert (=> b!220317 (=> (not res!108015) (not e!143249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10801 (_ BitVec 32)) Bool)

(assert (=> b!220317 (= res!108015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6209 thiss!1504) (mask!9955 thiss!1504)))))

(declare-fun b!220318 () Bool)

(assert (=> b!220318 (= e!143243 ((_ is Undefined!783) lt!112197))))

(declare-fun bm!20570 () Bool)

(assert (=> bm!20570 (= call!20573 (arrayContainsKey!0 (_keys!6209 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9838 () Bool)

(declare-fun tp!20893 () Bool)

(assert (=> mapNonEmpty!9838 (= mapRes!9838 (and tp!20893 e!143251))))

(declare-fun mapValue!9838 () ValueCell!2546)

(declare-fun mapRest!9838 () (Array (_ BitVec 32) ValueCell!2546))

(declare-fun mapKey!9838 () (_ BitVec 32))

(assert (=> mapNonEmpty!9838 (= (arr!5119 (_values!4138 thiss!1504)) (store mapRest!9838 mapKey!9838 mapValue!9838))))

(declare-fun b!220319 () Bool)

(declare-fun res!108014 () Bool)

(assert (=> b!220319 (=> (not res!108014) (not e!143249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220319 (= res!108014 (validMask!0 (mask!9955 thiss!1504)))))

(declare-fun b!220320 () Bool)

(declare-fun res!108020 () Bool)

(declare-fun e!143252 () Bool)

(assert (=> b!220320 (=> (not res!108020) (not e!143252))))

(assert (=> b!220320 (= res!108020 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220321 () Bool)

(assert (=> b!220321 (= e!143252 e!143254)))

(declare-fun res!108021 () Bool)

(assert (=> b!220321 (=> (not res!108021) (not e!143254))))

(assert (=> b!220321 (= res!108021 (or (= lt!112197 (MissingZero!783 index!297)) (= lt!112197 (MissingVacant!783 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10801 (_ BitVec 32)) SeekEntryResult!783)

(assert (=> b!220321 (= lt!112197 (seekEntryOrOpen!0 key!932 (_keys!6209 thiss!1504) (mask!9955 thiss!1504)))))

(declare-fun b!220322 () Bool)

(declare-fun res!108017 () Bool)

(assert (=> b!220322 (= res!108017 (= (select (arr!5120 (_keys!6209 thiss!1504)) (index!5305 lt!112197)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220322 (=> (not res!108017) (not e!143245))))

(declare-fun b!220307 () Bool)

(declare-fun e!143250 () Bool)

(assert (=> b!220307 (= e!143250 tp_is_empty!5779)))

(declare-fun res!108012 () Bool)

(assert (=> start!21854 (=> (not res!108012) (not e!143252))))

(declare-fun valid!1220 (LongMapFixedSize!2992) Bool)

(assert (=> start!21854 (= res!108012 (valid!1220 thiss!1504))))

(assert (=> start!21854 e!143252))

(assert (=> start!21854 e!143255))

(assert (=> start!21854 true))

(declare-fun b!220323 () Bool)

(declare-fun Unit!6551 () Unit!6549)

(assert (=> b!220323 (= e!143244 Unit!6551)))

(declare-fun lt!112199 () Unit!6549)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!199 (array!10801 array!10799 (_ BitVec 32) (_ BitVec 32) V!7353 V!7353 (_ BitVec 64) Int) Unit!6549)

(assert (=> b!220323 (= lt!112199 (lemmaInListMapThenSeekEntryOrOpenFindsIt!199 (_keys!6209 thiss!1504) (_values!4138 thiss!1504) (mask!9955 thiss!1504) (extraKeys!3892 thiss!1504) (zeroValue!3996 thiss!1504) (minValue!3996 thiss!1504) key!932 (defaultEntry!4155 thiss!1504)))))

(assert (=> b!220323 false))

(declare-fun b!220324 () Bool)

(declare-fun res!108018 () Bool)

(assert (=> b!220324 (=> (not res!108018) (not e!143249))))

(assert (=> b!220324 (= res!108018 (and (= (size!5452 (_values!4138 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9955 thiss!1504))) (= (size!5453 (_keys!6209 thiss!1504)) (size!5452 (_values!4138 thiss!1504))) (bvsge (mask!9955 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3892 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3892 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun bm!20571 () Bool)

(assert (=> bm!20571 (= call!20574 (inRange!0 (ite c!36672 (index!5302 lt!112197) (index!5305 lt!112197)) (mask!9955 thiss!1504)))))

(declare-fun b!220325 () Bool)

(assert (=> b!220325 (= e!143245 (not call!20573))))

(declare-fun b!220326 () Bool)

(assert (=> b!220326 (= e!143246 (and e!143250 mapRes!9838))))

(declare-fun condMapEmpty!9838 () Bool)

(declare-fun mapDefault!9838 () ValueCell!2546)

(assert (=> b!220326 (= condMapEmpty!9838 (= (arr!5119 (_values!4138 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2546)) mapDefault!9838)))))

(assert (= (and start!21854 res!108012) b!220320))

(assert (= (and b!220320 res!108020) b!220321))

(assert (= (and b!220321 res!108021) b!220311))

(assert (= (and b!220311 c!36671) b!220323))

(assert (= (and b!220311 (not c!36671)) b!220305))

(assert (= (and b!220305 c!36672) b!220313))

(assert (= (and b!220305 (not c!36672)) b!220306))

(assert (= (and b!220313 res!108022) b!220315))

(assert (= (and b!220315 res!108011) b!220308))

(assert (= (and b!220306 c!36673) b!220309))

(assert (= (and b!220306 (not c!36673)) b!220318))

(assert (= (and b!220309 res!108019) b!220322))

(assert (= (and b!220322 res!108017) b!220325))

(assert (= (or b!220313 b!220309) bm!20571))

(assert (= (or b!220308 b!220325) bm!20570))

(assert (= (and b!220311 res!108013) b!220316))

(assert (= (and b!220316 res!108016) b!220319))

(assert (= (and b!220319 res!108014) b!220324))

(assert (= (and b!220324 res!108018) b!220317))

(assert (= (and b!220317 res!108015) b!220314))

(assert (= (and b!220326 condMapEmpty!9838) mapIsEmpty!9838))

(assert (= (and b!220326 (not condMapEmpty!9838)) mapNonEmpty!9838))

(assert (= (and mapNonEmpty!9838 ((_ is ValueCellFull!2546) mapValue!9838)) b!220310))

(assert (= (and b!220326 ((_ is ValueCellFull!2546) mapDefault!9838)) b!220307))

(assert (= b!220312 b!220326))

(assert (= start!21854 b!220312))

(declare-fun m!245653 () Bool)

(assert (=> start!21854 m!245653))

(declare-fun m!245655 () Bool)

(assert (=> b!220312 m!245655))

(declare-fun m!245657 () Bool)

(assert (=> b!220312 m!245657))

(declare-fun m!245659 () Bool)

(assert (=> bm!20571 m!245659))

(declare-fun m!245661 () Bool)

(assert (=> bm!20570 m!245661))

(declare-fun m!245663 () Bool)

(assert (=> mapNonEmpty!9838 m!245663))

(declare-fun m!245665 () Bool)

(assert (=> b!220323 m!245665))

(declare-fun m!245667 () Bool)

(assert (=> b!220319 m!245667))

(declare-fun m!245669 () Bool)

(assert (=> b!220311 m!245669))

(declare-fun m!245671 () Bool)

(assert (=> b!220311 m!245671))

(assert (=> b!220311 m!245671))

(declare-fun m!245673 () Bool)

(assert (=> b!220311 m!245673))

(declare-fun m!245675 () Bool)

(assert (=> b!220315 m!245675))

(declare-fun m!245677 () Bool)

(assert (=> b!220321 m!245677))

(declare-fun m!245679 () Bool)

(assert (=> b!220314 m!245679))

(declare-fun m!245681 () Bool)

(assert (=> b!220317 m!245681))

(declare-fun m!245683 () Bool)

(assert (=> b!220322 m!245683))

(declare-fun m!245685 () Bool)

(assert (=> b!220305 m!245685))

(assert (=> b!220316 m!245661))

(check-sat (not b!220311) (not b!220317) b_and!12829 (not b!220321) (not b!220316) (not bm!20570) (not start!21854) (not b!220305) (not b!220312) (not b!220314) (not b!220323) (not b!220319) (not b_next!5917) tp_is_empty!5779 (not mapNonEmpty!9838) (not bm!20571))
(check-sat b_and!12829 (not b_next!5917))
