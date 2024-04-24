; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21974 () Bool)

(assert start!21974)

(declare-fun b!225118 () Bool)

(declare-fun b_free!6037 () Bool)

(declare-fun b_next!6037 () Bool)

(assert (=> b!225118 (= b_free!6037 (not b_next!6037))))

(declare-fun tp!21252 () Bool)

(declare-fun b_and!12949 () Bool)

(assert (=> b!225118 (= tp!21252 b_and!12949)))

(declare-fun b!225099 () Bool)

(declare-fun e!146115 () Bool)

(declare-fun e!146120 () Bool)

(assert (=> b!225099 (= e!146115 e!146120)))

(declare-fun res!110777 () Bool)

(assert (=> b!225099 (=> (not res!110777) (not e!146120))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7513 0))(
  ( (V!7514 (val!2994 Int)) )
))
(declare-datatypes ((ValueCell!2606 0))(
  ( (ValueCellFull!2606 (v!5015 V!7513)) (EmptyCell!2606) )
))
(declare-datatypes ((array!11039 0))(
  ( (array!11040 (arr!5239 (Array (_ BitVec 32) ValueCell!2606)) (size!5572 (_ BitVec 32))) )
))
(declare-datatypes ((array!11041 0))(
  ( (array!11042 (arr!5240 (Array (_ BitVec 32) (_ BitVec 64))) (size!5573 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3112 0))(
  ( (LongMapFixedSize!3113 (defaultEntry!4215 Int) (mask!10055 (_ BitVec 32)) (extraKeys!3952 (_ BitVec 32)) (zeroValue!4056 V!7513) (minValue!4056 V!7513) (_size!1605 (_ BitVec 32)) (_keys!6269 array!11041) (_values!4198 array!11039) (_vacant!1605 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3112)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225099 (= res!110777 (inRange!0 index!297 (mask!10055 thiss!1504)))))

(declare-datatypes ((Unit!6753 0))(
  ( (Unit!6754) )
))
(declare-fun lt!113443 () Unit!6753)

(declare-fun e!146119 () Unit!6753)

(assert (=> b!225099 (= lt!113443 e!146119)))

(declare-fun c!37330 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4352 0))(
  ( (tuple2!4353 (_1!2187 (_ BitVec 64)) (_2!2187 V!7513)) )
))
(declare-datatypes ((List!3258 0))(
  ( (Nil!3255) (Cons!3254 (h!3902 tuple2!4352) (t!8209 List!3258)) )
))
(declare-datatypes ((ListLongMap!3267 0))(
  ( (ListLongMap!3268 (toList!1649 List!3258)) )
))
(declare-fun contains!1538 (ListLongMap!3267 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1181 (array!11041 array!11039 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 32) Int) ListLongMap!3267)

(assert (=> b!225099 (= c!37330 (contains!1538 (getCurrentListMap!1181 (_keys!6269 thiss!1504) (_values!4198 thiss!1504) (mask!10055 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4215 thiss!1504)) key!932))))

(declare-fun b!225100 () Bool)

(declare-fun e!146110 () Bool)

(declare-fun tp_is_empty!5899 () Bool)

(assert (=> b!225100 (= e!146110 tp_is_empty!5899)))

(declare-fun b!225101 () Bool)

(declare-fun e!146117 () Bool)

(assert (=> b!225101 (= e!146117 tp_is_empty!5899)))

(declare-fun b!225102 () Bool)

(declare-fun e!146121 () Bool)

(declare-fun call!20933 () Bool)

(assert (=> b!225102 (= e!146121 (not call!20933))))

(declare-fun b!225103 () Bool)

(declare-fun e!146116 () Bool)

(declare-fun e!146109 () Bool)

(assert (=> b!225103 (= e!146116 e!146109)))

(declare-fun res!110774 () Bool)

(declare-fun call!20934 () Bool)

(assert (=> b!225103 (= res!110774 call!20934)))

(assert (=> b!225103 (=> (not res!110774) (not e!146109))))

(declare-fun b!225104 () Bool)

(declare-fun c!37332 () Bool)

(declare-datatypes ((SeekEntryResult!838 0))(
  ( (MissingZero!838 (index!5522 (_ BitVec 32))) (Found!838 (index!5523 (_ BitVec 32))) (Intermediate!838 (undefined!1650 Bool) (index!5524 (_ BitVec 32)) (x!23138 (_ BitVec 32))) (Undefined!838) (MissingVacant!838 (index!5525 (_ BitVec 32))) )
))
(declare-fun lt!113433 () SeekEntryResult!838)

(get-info :version)

(assert (=> b!225104 (= c!37332 ((_ is MissingVacant!838) lt!113433))))

(declare-fun e!146111 () Bool)

(assert (=> b!225104 (= e!146111 e!146116)))

(declare-fun b!225105 () Bool)

(declare-fun e!146122 () Bool)

(assert (=> b!225105 (= e!146120 (not e!146122))))

(declare-fun res!110773 () Bool)

(assert (=> b!225105 (=> res!110773 e!146122)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225105 (= res!110773 (not (validMask!0 (mask!10055 thiss!1504))))))

(declare-fun lt!113437 () array!11041)

(declare-fun arrayCountValidKeys!0 (array!11041 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225105 (= (arrayCountValidKeys!0 lt!113437 #b00000000000000000000000000000000 (size!5573 (_keys!6269 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6269 thiss!1504) #b00000000000000000000000000000000 (size!5573 (_keys!6269 thiss!1504)))))))

(declare-fun lt!113435 () Unit!6753)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11041 (_ BitVec 32) (_ BitVec 64)) Unit!6753)

(assert (=> b!225105 (= lt!113435 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6269 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3259 0))(
  ( (Nil!3256) (Cons!3255 (h!3903 (_ BitVec 64)) (t!8210 List!3259)) )
))
(declare-fun arrayNoDuplicates!0 (array!11041 (_ BitVec 32) List!3259) Bool)

(assert (=> b!225105 (arrayNoDuplicates!0 lt!113437 #b00000000000000000000000000000000 Nil!3256)))

(assert (=> b!225105 (= lt!113437 (array!11042 (store (arr!5240 (_keys!6269 thiss!1504)) index!297 key!932) (size!5573 (_keys!6269 thiss!1504))))))

(declare-fun lt!113439 () Unit!6753)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11041 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3259) Unit!6753)

(assert (=> b!225105 (= lt!113439 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6269 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3256))))

(declare-fun lt!113434 () Unit!6753)

(declare-fun e!146123 () Unit!6753)

(assert (=> b!225105 (= lt!113434 e!146123)))

(declare-fun c!37331 () Bool)

(declare-fun lt!113442 () Bool)

(assert (=> b!225105 (= c!37331 lt!113442)))

(declare-fun arrayContainsKey!0 (array!11041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225105 (= lt!113442 (arrayContainsKey!0 (_keys!6269 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225106 () Bool)

(declare-fun res!110775 () Bool)

(assert (=> b!225106 (=> (not res!110775) (not e!146121))))

(assert (=> b!225106 (= res!110775 call!20934)))

(assert (=> b!225106 (= e!146111 e!146121)))

(declare-fun b!225107 () Bool)

(declare-fun res!110768 () Bool)

(declare-fun e!146113 () Bool)

(assert (=> b!225107 (=> (not res!110768) (not e!146113))))

(assert (=> b!225107 (= res!110768 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225108 () Bool)

(declare-fun res!110770 () Bool)

(assert (=> b!225108 (=> res!110770 e!146122)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11041 (_ BitVec 32)) Bool)

(assert (=> b!225108 (= res!110770 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6269 thiss!1504) (mask!10055 thiss!1504))))))

(declare-fun b!225109 () Bool)

(assert (=> b!225109 (= e!146109 (not call!20933))))

(declare-fun bm!20930 () Bool)

(declare-fun c!37333 () Bool)

(assert (=> bm!20930 (= call!20934 (inRange!0 (ite c!37333 (index!5522 lt!113433) (index!5525 lt!113433)) (mask!10055 thiss!1504)))))

(declare-fun bm!20931 () Bool)

(assert (=> bm!20931 (= call!20933 (arrayContainsKey!0 (_keys!6269 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225110 () Bool)

(assert (=> b!225110 (= e!146113 e!146115)))

(declare-fun res!110779 () Bool)

(assert (=> b!225110 (=> (not res!110779) (not e!146115))))

(assert (=> b!225110 (= res!110779 (or (= lt!113433 (MissingZero!838 index!297)) (= lt!113433 (MissingVacant!838 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11041 (_ BitVec 32)) SeekEntryResult!838)

(assert (=> b!225110 (= lt!113433 (seekEntryOrOpen!0 key!932 (_keys!6269 thiss!1504) (mask!10055 thiss!1504)))))

(declare-fun mapIsEmpty!10018 () Bool)

(declare-fun mapRes!10018 () Bool)

(assert (=> mapIsEmpty!10018 mapRes!10018))

(declare-fun b!225111 () Bool)

(declare-fun res!110771 () Bool)

(assert (=> b!225111 (=> res!110771 e!146122)))

(assert (=> b!225111 (= res!110771 lt!113442)))

(declare-fun b!225112 () Bool)

(declare-fun Unit!6755 () Unit!6753)

(assert (=> b!225112 (= e!146123 Unit!6755)))

(declare-fun mapNonEmpty!10018 () Bool)

(declare-fun tp!21253 () Bool)

(assert (=> mapNonEmpty!10018 (= mapRes!10018 (and tp!21253 e!146110))))

(declare-fun mapRest!10018 () (Array (_ BitVec 32) ValueCell!2606))

(declare-fun mapValue!10018 () ValueCell!2606)

(declare-fun mapKey!10018 () (_ BitVec 32))

(assert (=> mapNonEmpty!10018 (= (arr!5239 (_values!4198 thiss!1504)) (store mapRest!10018 mapKey!10018 mapValue!10018))))

(declare-fun b!225113 () Bool)

(declare-fun Unit!6756 () Unit!6753)

(assert (=> b!225113 (= e!146119 Unit!6756)))

(declare-fun lt!113440 () Unit!6753)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!244 (array!11041 array!11039 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) Int) Unit!6753)

(assert (=> b!225113 (= lt!113440 (lemmaInListMapThenSeekEntryOrOpenFindsIt!244 (_keys!6269 thiss!1504) (_values!4198 thiss!1504) (mask!10055 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 (defaultEntry!4215 thiss!1504)))))

(assert (=> b!225113 false))

(declare-fun b!225114 () Bool)

(assert (=> b!225114 (= e!146122 true)))

(declare-fun lt!113438 () Bool)

(assert (=> b!225114 (= lt!113438 (arrayNoDuplicates!0 (_keys!6269 thiss!1504) #b00000000000000000000000000000000 Nil!3256))))

(declare-fun b!225115 () Bool)

(declare-fun res!110769 () Bool)

(assert (=> b!225115 (=> res!110769 e!146122)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225115 (= res!110769 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225116 () Bool)

(assert (=> b!225116 (= e!146116 ((_ is Undefined!838) lt!113433))))

(declare-fun b!225117 () Bool)

(declare-fun e!146118 () Bool)

(assert (=> b!225117 (= e!146118 (and e!146117 mapRes!10018))))

(declare-fun condMapEmpty!10018 () Bool)

(declare-fun mapDefault!10018 () ValueCell!2606)

(assert (=> b!225117 (= condMapEmpty!10018 (= (arr!5239 (_values!4198 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2606)) mapDefault!10018)))))

(declare-fun e!146114 () Bool)

(declare-fun array_inv!3443 (array!11041) Bool)

(declare-fun array_inv!3444 (array!11039) Bool)

(assert (=> b!225118 (= e!146114 (and tp!21252 tp_is_empty!5899 (array_inv!3443 (_keys!6269 thiss!1504)) (array_inv!3444 (_values!4198 thiss!1504)) e!146118))))

(declare-fun res!110772 () Bool)

(assert (=> start!21974 (=> (not res!110772) (not e!146113))))

(declare-fun valid!1260 (LongMapFixedSize!3112) Bool)

(assert (=> start!21974 (= res!110772 (valid!1260 thiss!1504))))

(assert (=> start!21974 e!146113))

(assert (=> start!21974 e!146114))

(assert (=> start!21974 true))

(declare-fun b!225119 () Bool)

(declare-fun res!110767 () Bool)

(assert (=> b!225119 (= res!110767 (= (select (arr!5240 (_keys!6269 thiss!1504)) (index!5525 lt!113433)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!225119 (=> (not res!110767) (not e!146109))))

(declare-fun b!225120 () Bool)

(declare-fun res!110778 () Bool)

(assert (=> b!225120 (=> res!110778 e!146122)))

(assert (=> b!225120 (= res!110778 (or (not (= (size!5573 (_keys!6269 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10055 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5573 (_keys!6269 thiss!1504)))))))

(declare-fun b!225121 () Bool)

(declare-fun Unit!6757 () Unit!6753)

(assert (=> b!225121 (= e!146123 Unit!6757)))

(declare-fun lt!113436 () Unit!6753)

(declare-fun lemmaArrayContainsKeyThenInListMap!81 (array!11041 array!11039 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) (_ BitVec 32) Int) Unit!6753)

(assert (=> b!225121 (= lt!113436 (lemmaArrayContainsKeyThenInListMap!81 (_keys!6269 thiss!1504) (_values!4198 thiss!1504) (mask!10055 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4215 thiss!1504)))))

(assert (=> b!225121 false))

(declare-fun b!225122 () Bool)

(declare-fun lt!113441 () Unit!6753)

(assert (=> b!225122 (= e!146119 lt!113441)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!235 (array!11041 array!11039 (_ BitVec 32) (_ BitVec 32) V!7513 V!7513 (_ BitVec 64) Int) Unit!6753)

(assert (=> b!225122 (= lt!113441 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!235 (_keys!6269 thiss!1504) (_values!4198 thiss!1504) (mask!10055 thiss!1504) (extraKeys!3952 thiss!1504) (zeroValue!4056 thiss!1504) (minValue!4056 thiss!1504) key!932 (defaultEntry!4215 thiss!1504)))))

(assert (=> b!225122 (= c!37333 ((_ is MissingZero!838) lt!113433))))

(assert (=> b!225122 e!146111))

(declare-fun b!225123 () Bool)

(declare-fun res!110776 () Bool)

(assert (=> b!225123 (=> (not res!110776) (not e!146121))))

(assert (=> b!225123 (= res!110776 (= (select (arr!5240 (_keys!6269 thiss!1504)) (index!5522 lt!113433)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!21974 res!110772) b!225107))

(assert (= (and b!225107 res!110768) b!225110))

(assert (= (and b!225110 res!110779) b!225099))

(assert (= (and b!225099 c!37330) b!225113))

(assert (= (and b!225099 (not c!37330)) b!225122))

(assert (= (and b!225122 c!37333) b!225106))

(assert (= (and b!225122 (not c!37333)) b!225104))

(assert (= (and b!225106 res!110775) b!225123))

(assert (= (and b!225123 res!110776) b!225102))

(assert (= (and b!225104 c!37332) b!225103))

(assert (= (and b!225104 (not c!37332)) b!225116))

(assert (= (and b!225103 res!110774) b!225119))

(assert (= (and b!225119 res!110767) b!225109))

(assert (= (or b!225106 b!225103) bm!20930))

(assert (= (or b!225102 b!225109) bm!20931))

(assert (= (and b!225099 res!110777) b!225105))

(assert (= (and b!225105 c!37331) b!225121))

(assert (= (and b!225105 (not c!37331)) b!225112))

(assert (= (and b!225105 (not res!110773)) b!225120))

(assert (= (and b!225120 (not res!110778)) b!225115))

(assert (= (and b!225115 (not res!110769)) b!225111))

(assert (= (and b!225111 (not res!110771)) b!225108))

(assert (= (and b!225108 (not res!110770)) b!225114))

(assert (= (and b!225117 condMapEmpty!10018) mapIsEmpty!10018))

(assert (= (and b!225117 (not condMapEmpty!10018)) mapNonEmpty!10018))

(assert (= (and mapNonEmpty!10018 ((_ is ValueCellFull!2606) mapValue!10018)) b!225100))

(assert (= (and b!225117 ((_ is ValueCellFull!2606) mapDefault!10018)) b!225101))

(assert (= b!225118 b!225117))

(assert (= start!21974 b!225118))

(declare-fun m!247981 () Bool)

(assert (=> b!225105 m!247981))

(declare-fun m!247983 () Bool)

(assert (=> b!225105 m!247983))

(declare-fun m!247985 () Bool)

(assert (=> b!225105 m!247985))

(declare-fun m!247987 () Bool)

(assert (=> b!225105 m!247987))

(declare-fun m!247989 () Bool)

(assert (=> b!225105 m!247989))

(declare-fun m!247991 () Bool)

(assert (=> b!225105 m!247991))

(declare-fun m!247993 () Bool)

(assert (=> b!225105 m!247993))

(declare-fun m!247995 () Bool)

(assert (=> b!225105 m!247995))

(declare-fun m!247997 () Bool)

(assert (=> b!225122 m!247997))

(declare-fun m!247999 () Bool)

(assert (=> start!21974 m!247999))

(declare-fun m!248001 () Bool)

(assert (=> b!225121 m!248001))

(declare-fun m!248003 () Bool)

(assert (=> mapNonEmpty!10018 m!248003))

(declare-fun m!248005 () Bool)

(assert (=> b!225119 m!248005))

(declare-fun m!248007 () Bool)

(assert (=> b!225110 m!248007))

(declare-fun m!248009 () Bool)

(assert (=> b!225114 m!248009))

(declare-fun m!248011 () Bool)

(assert (=> b!225108 m!248011))

(declare-fun m!248013 () Bool)

(assert (=> b!225113 m!248013))

(declare-fun m!248015 () Bool)

(assert (=> b!225123 m!248015))

(declare-fun m!248017 () Bool)

(assert (=> b!225118 m!248017))

(declare-fun m!248019 () Bool)

(assert (=> b!225118 m!248019))

(declare-fun m!248021 () Bool)

(assert (=> b!225099 m!248021))

(declare-fun m!248023 () Bool)

(assert (=> b!225099 m!248023))

(assert (=> b!225099 m!248023))

(declare-fun m!248025 () Bool)

(assert (=> b!225099 m!248025))

(declare-fun m!248027 () Bool)

(assert (=> bm!20930 m!248027))

(declare-fun m!248029 () Bool)

(assert (=> b!225115 m!248029))

(assert (=> bm!20931 m!247995))

(check-sat (not b!225115) (not b!225114) (not b!225122) (not b!225113) (not bm!20930) (not b!225105) (not b!225118) (not start!21974) b_and!12949 (not b!225121) (not b_next!6037) tp_is_empty!5899 (not b!225108) (not b!225099) (not mapNonEmpty!10018) (not bm!20931) (not b!225110))
(check-sat b_and!12949 (not b_next!6037))
