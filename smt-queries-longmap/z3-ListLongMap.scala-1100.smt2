; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22568 () Bool)

(assert start!22568)

(declare-fun b!235777 () Bool)

(declare-fun b_free!6349 () Bool)

(declare-fun b_next!6349 () Bool)

(assert (=> b!235777 (= b_free!6349 (not b_next!6349))))

(declare-fun tp!22219 () Bool)

(declare-fun b_and!13255 () Bool)

(assert (=> b!235777 (= tp!22219 b_and!13255)))

(declare-fun b!235774 () Bool)

(declare-fun e!153118 () Bool)

(declare-fun tp_is_empty!6211 () Bool)

(assert (=> b!235774 (= e!153118 tp_is_empty!6211)))

(declare-fun b!235775 () Bool)

(declare-fun e!153116 () Bool)

(assert (=> b!235775 (= e!153116 tp_is_empty!6211)))

(declare-fun b!235776 () Bool)

(declare-fun res!115619 () Bool)

(declare-fun e!153120 () Bool)

(assert (=> b!235776 (=> (not res!115619) (not e!153120))))

(declare-datatypes ((V!7929 0))(
  ( (V!7930 (val!3150 Int)) )
))
(declare-datatypes ((ValueCell!2762 0))(
  ( (ValueCellFull!2762 (v!5173 V!7929)) (EmptyCell!2762) )
))
(declare-datatypes ((array!11675 0))(
  ( (array!11676 (arr!5547 (Array (_ BitVec 32) ValueCell!2762)) (size!5885 (_ BitVec 32))) )
))
(declare-datatypes ((array!11677 0))(
  ( (array!11678 (arr!5548 (Array (_ BitVec 32) (_ BitVec 64))) (size!5886 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3424 0))(
  ( (LongMapFixedSize!3425 (defaultEntry!4384 Int) (mask!10364 (_ BitVec 32)) (extraKeys!4121 (_ BitVec 32)) (zeroValue!4225 V!7929) (minValue!4225 V!7929) (_size!1761 (_ BitVec 32)) (_keys!6461 array!11677) (_values!4367 array!11675) (_vacant!1761 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3424)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4620 0))(
  ( (tuple2!4621 (_1!2321 (_ BitVec 64)) (_2!2321 V!7929)) )
))
(declare-datatypes ((List!3542 0))(
  ( (Nil!3539) (Cons!3538 (h!4190 tuple2!4620) (t!8510 List!3542)) )
))
(declare-datatypes ((ListLongMap!3523 0))(
  ( (ListLongMap!3524 (toList!1777 List!3542)) )
))
(declare-fun contains!1658 (ListLongMap!3523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1286 (array!11677 array!11675 (_ BitVec 32) (_ BitVec 32) V!7929 V!7929 (_ BitVec 32) Int) ListLongMap!3523)

(assert (=> b!235776 (= res!115619 (not (contains!1658 (getCurrentListMap!1286 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)) key!932)))))

(declare-fun e!153122 () Bool)

(declare-fun e!153117 () Bool)

(declare-fun array_inv!3659 (array!11677) Bool)

(declare-fun array_inv!3660 (array!11675) Bool)

(assert (=> b!235777 (= e!153117 (and tp!22219 tp_is_empty!6211 (array_inv!3659 (_keys!6461 thiss!1504)) (array_inv!3660 (_values!4367 thiss!1504)) e!153122))))

(declare-fun res!115620 () Bool)

(declare-fun e!153121 () Bool)

(assert (=> start!22568 (=> (not res!115620) (not e!153121))))

(declare-fun valid!1361 (LongMapFixedSize!3424) Bool)

(assert (=> start!22568 (= res!115620 (valid!1361 thiss!1504))))

(assert (=> start!22568 e!153121))

(assert (=> start!22568 e!153117))

(assert (=> start!22568 true))

(declare-fun b!235778 () Bool)

(declare-fun res!115621 () Bool)

(assert (=> b!235778 (=> (not res!115621) (not e!153121))))

(assert (=> b!235778 (= res!115621 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10517 () Bool)

(declare-fun mapRes!10517 () Bool)

(assert (=> mapIsEmpty!10517 mapRes!10517))

(declare-fun b!235779 () Bool)

(assert (=> b!235779 (= e!153121 e!153120)))

(declare-fun res!115618 () Bool)

(assert (=> b!235779 (=> (not res!115618) (not e!153120))))

(declare-datatypes ((SeekEntryResult!996 0))(
  ( (MissingZero!996 (index!6154 (_ BitVec 32))) (Found!996 (index!6155 (_ BitVec 32))) (Intermediate!996 (undefined!1808 Bool) (index!6156 (_ BitVec 32)) (x!23833 (_ BitVec 32))) (Undefined!996) (MissingVacant!996 (index!6157 (_ BitVec 32))) )
))
(declare-fun lt!119094 () SeekEntryResult!996)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235779 (= res!115618 (or (= lt!119094 (MissingZero!996 index!297)) (= lt!119094 (MissingVacant!996 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11677 (_ BitVec 32)) SeekEntryResult!996)

(assert (=> b!235779 (= lt!119094 (seekEntryOrOpen!0 key!932 (_keys!6461 thiss!1504) (mask!10364 thiss!1504)))))

(declare-fun b!235780 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235780 (= e!153120 (not (validMask!0 (mask!10364 thiss!1504))))))

(declare-fun b!235781 () Bool)

(assert (=> b!235781 (= e!153122 (and e!153116 mapRes!10517))))

(declare-fun condMapEmpty!10517 () Bool)

(declare-fun mapDefault!10517 () ValueCell!2762)

(assert (=> b!235781 (= condMapEmpty!10517 (= (arr!5547 (_values!4367 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2762)) mapDefault!10517)))))

(declare-fun mapNonEmpty!10517 () Bool)

(declare-fun tp!22220 () Bool)

(assert (=> mapNonEmpty!10517 (= mapRes!10517 (and tp!22220 e!153118))))

(declare-fun mapRest!10517 () (Array (_ BitVec 32) ValueCell!2762))

(declare-fun mapValue!10517 () ValueCell!2762)

(declare-fun mapKey!10517 () (_ BitVec 32))

(assert (=> mapNonEmpty!10517 (= (arr!5547 (_values!4367 thiss!1504)) (store mapRest!10517 mapKey!10517 mapValue!10517))))

(assert (= (and start!22568 res!115620) b!235778))

(assert (= (and b!235778 res!115621) b!235779))

(assert (= (and b!235779 res!115618) b!235776))

(assert (= (and b!235776 res!115619) b!235780))

(assert (= (and b!235781 condMapEmpty!10517) mapIsEmpty!10517))

(assert (= (and b!235781 (not condMapEmpty!10517)) mapNonEmpty!10517))

(get-info :version)

(assert (= (and mapNonEmpty!10517 ((_ is ValueCellFull!2762) mapValue!10517)) b!235774))

(assert (= (and b!235781 ((_ is ValueCellFull!2762) mapDefault!10517)) b!235775))

(assert (= b!235777 b!235781))

(assert (= start!22568 b!235777))

(declare-fun m!256261 () Bool)

(assert (=> start!22568 m!256261))

(declare-fun m!256263 () Bool)

(assert (=> b!235779 m!256263))

(declare-fun m!256265 () Bool)

(assert (=> b!235776 m!256265))

(assert (=> b!235776 m!256265))

(declare-fun m!256267 () Bool)

(assert (=> b!235776 m!256267))

(declare-fun m!256269 () Bool)

(assert (=> b!235780 m!256269))

(declare-fun m!256271 () Bool)

(assert (=> b!235777 m!256271))

(declare-fun m!256273 () Bool)

(assert (=> b!235777 m!256273))

(declare-fun m!256275 () Bool)

(assert (=> mapNonEmpty!10517 m!256275))

(check-sat tp_is_empty!6211 (not b!235777) (not mapNonEmpty!10517) (not b_next!6349) (not b!235779) (not start!22568) (not b!235780) (not b!235776) b_and!13255)
(check-sat b_and!13255 (not b_next!6349))
(get-model)

(declare-fun d!59171 () Bool)

(declare-fun res!115652 () Bool)

(declare-fun e!153167 () Bool)

(assert (=> d!59171 (=> (not res!115652) (not e!153167))))

(declare-fun simpleValid!235 (LongMapFixedSize!3424) Bool)

(assert (=> d!59171 (= res!115652 (simpleValid!235 thiss!1504))))

(assert (=> d!59171 (= (valid!1361 thiss!1504) e!153167)))

(declare-fun b!235836 () Bool)

(declare-fun res!115653 () Bool)

(assert (=> b!235836 (=> (not res!115653) (not e!153167))))

(declare-fun arrayCountValidKeys!0 (array!11677 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235836 (= res!115653 (= (arrayCountValidKeys!0 (_keys!6461 thiss!1504) #b00000000000000000000000000000000 (size!5886 (_keys!6461 thiss!1504))) (_size!1761 thiss!1504)))))

(declare-fun b!235837 () Bool)

(declare-fun res!115654 () Bool)

(assert (=> b!235837 (=> (not res!115654) (not e!153167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11677 (_ BitVec 32)) Bool)

(assert (=> b!235837 (= res!115654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6461 thiss!1504) (mask!10364 thiss!1504)))))

(declare-fun b!235838 () Bool)

(declare-datatypes ((List!3543 0))(
  ( (Nil!3540) (Cons!3539 (h!4191 (_ BitVec 64)) (t!8513 List!3543)) )
))
(declare-fun arrayNoDuplicates!0 (array!11677 (_ BitVec 32) List!3543) Bool)

(assert (=> b!235838 (= e!153167 (arrayNoDuplicates!0 (_keys!6461 thiss!1504) #b00000000000000000000000000000000 Nil!3540))))

(assert (= (and d!59171 res!115652) b!235836))

(assert (= (and b!235836 res!115653) b!235837))

(assert (= (and b!235837 res!115654) b!235838))

(declare-fun m!256309 () Bool)

(assert (=> d!59171 m!256309))

(declare-fun m!256311 () Bool)

(assert (=> b!235836 m!256311))

(declare-fun m!256313 () Bool)

(assert (=> b!235837 m!256313))

(declare-fun m!256315 () Bool)

(assert (=> b!235838 m!256315))

(assert (=> start!22568 d!59171))

(declare-fun d!59173 () Bool)

(assert (=> d!59173 (= (validMask!0 (mask!10364 thiss!1504)) (and (or (= (mask!10364 thiss!1504) #b00000000000000000000000000000111) (= (mask!10364 thiss!1504) #b00000000000000000000000000001111) (= (mask!10364 thiss!1504) #b00000000000000000000000000011111) (= (mask!10364 thiss!1504) #b00000000000000000000000000111111) (= (mask!10364 thiss!1504) #b00000000000000000000000001111111) (= (mask!10364 thiss!1504) #b00000000000000000000000011111111) (= (mask!10364 thiss!1504) #b00000000000000000000000111111111) (= (mask!10364 thiss!1504) #b00000000000000000000001111111111) (= (mask!10364 thiss!1504) #b00000000000000000000011111111111) (= (mask!10364 thiss!1504) #b00000000000000000000111111111111) (= (mask!10364 thiss!1504) #b00000000000000000001111111111111) (= (mask!10364 thiss!1504) #b00000000000000000011111111111111) (= (mask!10364 thiss!1504) #b00000000000000000111111111111111) (= (mask!10364 thiss!1504) #b00000000000000001111111111111111) (= (mask!10364 thiss!1504) #b00000000000000011111111111111111) (= (mask!10364 thiss!1504) #b00000000000000111111111111111111) (= (mask!10364 thiss!1504) #b00000000000001111111111111111111) (= (mask!10364 thiss!1504) #b00000000000011111111111111111111) (= (mask!10364 thiss!1504) #b00000000000111111111111111111111) (= (mask!10364 thiss!1504) #b00000000001111111111111111111111) (= (mask!10364 thiss!1504) #b00000000011111111111111111111111) (= (mask!10364 thiss!1504) #b00000000111111111111111111111111) (= (mask!10364 thiss!1504) #b00000001111111111111111111111111) (= (mask!10364 thiss!1504) #b00000011111111111111111111111111) (= (mask!10364 thiss!1504) #b00000111111111111111111111111111) (= (mask!10364 thiss!1504) #b00001111111111111111111111111111) (= (mask!10364 thiss!1504) #b00011111111111111111111111111111) (= (mask!10364 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10364 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235780 d!59173))

(declare-fun d!59175 () Bool)

(declare-fun e!153173 () Bool)

(assert (=> d!59175 e!153173))

(declare-fun res!115657 () Bool)

(assert (=> d!59175 (=> res!115657 e!153173)))

(declare-fun lt!119109 () Bool)

(assert (=> d!59175 (= res!115657 (not lt!119109))))

(declare-fun lt!119112 () Bool)

(assert (=> d!59175 (= lt!119109 lt!119112)))

(declare-datatypes ((Unit!7260 0))(
  ( (Unit!7261) )
))
(declare-fun lt!119111 () Unit!7260)

(declare-fun e!153172 () Unit!7260)

(assert (=> d!59175 (= lt!119111 e!153172)))

(declare-fun c!39257 () Bool)

(assert (=> d!59175 (= c!39257 lt!119112)))

(declare-fun containsKey!260 (List!3542 (_ BitVec 64)) Bool)

(assert (=> d!59175 (= lt!119112 (containsKey!260 (toList!1777 (getCurrentListMap!1286 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504))) key!932))))

(assert (=> d!59175 (= (contains!1658 (getCurrentListMap!1286 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)) key!932) lt!119109)))

(declare-fun b!235845 () Bool)

(declare-fun lt!119110 () Unit!7260)

(assert (=> b!235845 (= e!153172 lt!119110)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!209 (List!3542 (_ BitVec 64)) Unit!7260)

(assert (=> b!235845 (= lt!119110 (lemmaContainsKeyImpliesGetValueByKeyDefined!209 (toList!1777 (getCurrentListMap!1286 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504))) key!932))))

(declare-datatypes ((Option!274 0))(
  ( (Some!273 (v!5176 V!7929)) (None!272) )
))
(declare-fun isDefined!210 (Option!274) Bool)

(declare-fun getValueByKey!268 (List!3542 (_ BitVec 64)) Option!274)

(assert (=> b!235845 (isDefined!210 (getValueByKey!268 (toList!1777 (getCurrentListMap!1286 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504))) key!932))))

(declare-fun b!235846 () Bool)

(declare-fun Unit!7262 () Unit!7260)

(assert (=> b!235846 (= e!153172 Unit!7262)))

(declare-fun b!235847 () Bool)

(assert (=> b!235847 (= e!153173 (isDefined!210 (getValueByKey!268 (toList!1777 (getCurrentListMap!1286 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504))) key!932)))))

(assert (= (and d!59175 c!39257) b!235845))

(assert (= (and d!59175 (not c!39257)) b!235846))

(assert (= (and d!59175 (not res!115657)) b!235847))

(declare-fun m!256317 () Bool)

(assert (=> d!59175 m!256317))

(declare-fun m!256319 () Bool)

(assert (=> b!235845 m!256319))

(declare-fun m!256321 () Bool)

(assert (=> b!235845 m!256321))

(assert (=> b!235845 m!256321))

(declare-fun m!256323 () Bool)

(assert (=> b!235845 m!256323))

(assert (=> b!235847 m!256321))

(assert (=> b!235847 m!256321))

(assert (=> b!235847 m!256323))

(assert (=> b!235776 d!59175))

(declare-fun bm!21918 () Bool)

(declare-fun call!21923 () ListLongMap!3523)

(declare-fun call!21926 () ListLongMap!3523)

(assert (=> bm!21918 (= call!21923 call!21926)))

(declare-fun b!235890 () Bool)

(declare-fun e!153206 () Bool)

(declare-fun lt!119167 () ListLongMap!3523)

(declare-fun apply!212 (ListLongMap!3523 (_ BitVec 64)) V!7929)

(assert (=> b!235890 (= e!153206 (= (apply!212 lt!119167 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4225 thiss!1504)))))

(declare-fun b!235891 () Bool)

(declare-fun res!115677 () Bool)

(declare-fun e!153207 () Bool)

(assert (=> b!235891 (=> (not res!115677) (not e!153207))))

(declare-fun e!153201 () Bool)

(assert (=> b!235891 (= res!115677 e!153201)))

(declare-fun c!39274 () Bool)

(assert (=> b!235891 (= c!39274 (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!21919 () Bool)

(declare-fun c!39275 () Bool)

(declare-fun call!21927 () ListLongMap!3523)

(declare-fun call!21924 () ListLongMap!3523)

(declare-fun c!39270 () Bool)

(declare-fun +!645 (ListLongMap!3523 tuple2!4620) ListLongMap!3523)

(assert (=> bm!21919 (= call!21927 (+!645 (ite c!39275 call!21926 (ite c!39270 call!21923 call!21924)) (ite (or c!39275 c!39270) (tuple2!4621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4225 thiss!1504)) (tuple2!4621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4225 thiss!1504)))))))

(declare-fun b!235892 () Bool)

(declare-fun e!153203 () ListLongMap!3523)

(declare-fun call!21921 () ListLongMap!3523)

(assert (=> b!235892 (= e!153203 call!21921)))

(declare-fun b!235893 () Bool)

(declare-fun e!153205 () ListLongMap!3523)

(assert (=> b!235893 (= e!153205 (+!645 call!21927 (tuple2!4621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4225 thiss!1504))))))

(declare-fun b!235894 () Bool)

(declare-fun e!153200 () Bool)

(declare-fun call!21922 () Bool)

(assert (=> b!235894 (= e!153200 (not call!21922))))

(declare-fun bm!21920 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!528 (array!11677 array!11675 (_ BitVec 32) (_ BitVec 32) V!7929 V!7929 (_ BitVec 32) Int) ListLongMap!3523)

(assert (=> bm!21920 (= call!21926 (getCurrentListMapNoExtraKeys!528 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun b!235895 () Bool)

(declare-fun c!39273 () Bool)

(assert (=> b!235895 (= c!39273 (and (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!153212 () ListLongMap!3523)

(assert (=> b!235895 (= e!153203 e!153212)))

(declare-fun b!235896 () Bool)

(assert (=> b!235896 (= e!153207 e!153200)))

(declare-fun c!39271 () Bool)

(assert (=> b!235896 (= c!39271 (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!59177 () Bool)

(assert (=> d!59177 e!153207))

(declare-fun res!115680 () Bool)

(assert (=> d!59177 (=> (not res!115680) (not e!153207))))

(assert (=> d!59177 (= res!115680 (or (bvsge #b00000000000000000000000000000000 (size!5886 (_keys!6461 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5886 (_keys!6461 thiss!1504))))))))

(declare-fun lt!119175 () ListLongMap!3523)

(assert (=> d!59177 (= lt!119167 lt!119175)))

(declare-fun lt!119168 () Unit!7260)

(declare-fun e!153209 () Unit!7260)

(assert (=> d!59177 (= lt!119168 e!153209)))

(declare-fun c!39272 () Bool)

(declare-fun e!153211 () Bool)

(assert (=> d!59177 (= c!39272 e!153211)))

(declare-fun res!115683 () Bool)

(assert (=> d!59177 (=> (not res!115683) (not e!153211))))

(assert (=> d!59177 (= res!115683 (bvslt #b00000000000000000000000000000000 (size!5886 (_keys!6461 thiss!1504))))))

(assert (=> d!59177 (= lt!119175 e!153205)))

(assert (=> d!59177 (= c!39275 (and (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59177 (validMask!0 (mask!10364 thiss!1504))))

(assert (=> d!59177 (= (getCurrentListMap!1286 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)) lt!119167)))

(declare-fun b!235897 () Bool)

(assert (=> b!235897 (= e!153205 e!153203)))

(assert (=> b!235897 (= c!39270 (and (not (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4121 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235898 () Bool)

(declare-fun e!153208 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235898 (= e!153208 (validKeyInArray!0 (select (arr!5548 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21921 () Bool)

(assert (=> bm!21921 (= call!21922 (contains!1658 lt!119167 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21922 () Bool)

(assert (=> bm!21922 (= call!21924 call!21923)))

(declare-fun b!235899 () Bool)

(declare-fun e!153210 () Bool)

(assert (=> b!235899 (= e!153201 e!153210)))

(declare-fun res!115676 () Bool)

(declare-fun call!21925 () Bool)

(assert (=> b!235899 (= res!115676 call!21925)))

(assert (=> b!235899 (=> (not res!115676) (not e!153210))))

(declare-fun b!235900 () Bool)

(assert (=> b!235900 (= e!153211 (validKeyInArray!0 (select (arr!5548 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235901 () Bool)

(assert (=> b!235901 (= e!153212 call!21921)))

(declare-fun b!235902 () Bool)

(assert (=> b!235902 (= e!153210 (= (apply!212 lt!119167 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4225 thiss!1504)))))

(declare-fun b!235903 () Bool)

(assert (=> b!235903 (= e!153212 call!21924)))

(declare-fun b!235904 () Bool)

(declare-fun Unit!7263 () Unit!7260)

(assert (=> b!235904 (= e!153209 Unit!7263)))

(declare-fun b!235905 () Bool)

(declare-fun res!115684 () Bool)

(assert (=> b!235905 (=> (not res!115684) (not e!153207))))

(declare-fun e!153202 () Bool)

(assert (=> b!235905 (= res!115684 e!153202)))

(declare-fun res!115678 () Bool)

(assert (=> b!235905 (=> res!115678 e!153202)))

(assert (=> b!235905 (= res!115678 (not e!153208))))

(declare-fun res!115681 () Bool)

(assert (=> b!235905 (=> (not res!115681) (not e!153208))))

(assert (=> b!235905 (= res!115681 (bvslt #b00000000000000000000000000000000 (size!5886 (_keys!6461 thiss!1504))))))

(declare-fun bm!21923 () Bool)

(assert (=> bm!21923 (= call!21925 (contains!1658 lt!119167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235906 () Bool)

(declare-fun e!153204 () Bool)

(assert (=> b!235906 (= e!153202 e!153204)))

(declare-fun res!115682 () Bool)

(assert (=> b!235906 (=> (not res!115682) (not e!153204))))

(assert (=> b!235906 (= res!115682 (contains!1658 lt!119167 (select (arr!5548 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235906 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5886 (_keys!6461 thiss!1504))))))

(declare-fun b!235907 () Bool)

(declare-fun get!2847 (ValueCell!2762 V!7929) V!7929)

(declare-fun dynLambda!546 (Int (_ BitVec 64)) V!7929)

(assert (=> b!235907 (= e!153204 (= (apply!212 lt!119167 (select (arr!5548 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000)) (get!2847 (select (arr!5547 (_values!4367 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!546 (defaultEntry!4384 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5885 (_values!4367 thiss!1504))))))

(assert (=> b!235907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5886 (_keys!6461 thiss!1504))))))

(declare-fun bm!21924 () Bool)

(assert (=> bm!21924 (= call!21921 call!21927)))

(declare-fun b!235908 () Bool)

(assert (=> b!235908 (= e!153200 e!153206)))

(declare-fun res!115679 () Bool)

(assert (=> b!235908 (= res!115679 call!21922)))

(assert (=> b!235908 (=> (not res!115679) (not e!153206))))

(declare-fun b!235909 () Bool)

(assert (=> b!235909 (= e!153201 (not call!21925))))

(declare-fun b!235910 () Bool)

(declare-fun lt!119166 () Unit!7260)

(assert (=> b!235910 (= e!153209 lt!119166)))

(declare-fun lt!119158 () ListLongMap!3523)

(assert (=> b!235910 (= lt!119158 (getCurrentListMapNoExtraKeys!528 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun lt!119173 () (_ BitVec 64))

(assert (=> b!235910 (= lt!119173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119164 () (_ BitVec 64))

(assert (=> b!235910 (= lt!119164 (select (arr!5548 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119162 () Unit!7260)

(declare-fun addStillContains!188 (ListLongMap!3523 (_ BitVec 64) V!7929 (_ BitVec 64)) Unit!7260)

(assert (=> b!235910 (= lt!119162 (addStillContains!188 lt!119158 lt!119173 (zeroValue!4225 thiss!1504) lt!119164))))

(assert (=> b!235910 (contains!1658 (+!645 lt!119158 (tuple2!4621 lt!119173 (zeroValue!4225 thiss!1504))) lt!119164)))

(declare-fun lt!119163 () Unit!7260)

(assert (=> b!235910 (= lt!119163 lt!119162)))

(declare-fun lt!119178 () ListLongMap!3523)

(assert (=> b!235910 (= lt!119178 (getCurrentListMapNoExtraKeys!528 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun lt!119177 () (_ BitVec 64))

(assert (=> b!235910 (= lt!119177 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119160 () (_ BitVec 64))

(assert (=> b!235910 (= lt!119160 (select (arr!5548 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119165 () Unit!7260)

(declare-fun addApplyDifferent!188 (ListLongMap!3523 (_ BitVec 64) V!7929 (_ BitVec 64)) Unit!7260)

(assert (=> b!235910 (= lt!119165 (addApplyDifferent!188 lt!119178 lt!119177 (minValue!4225 thiss!1504) lt!119160))))

(assert (=> b!235910 (= (apply!212 (+!645 lt!119178 (tuple2!4621 lt!119177 (minValue!4225 thiss!1504))) lt!119160) (apply!212 lt!119178 lt!119160))))

(declare-fun lt!119172 () Unit!7260)

(assert (=> b!235910 (= lt!119172 lt!119165)))

(declare-fun lt!119171 () ListLongMap!3523)

(assert (=> b!235910 (= lt!119171 (getCurrentListMapNoExtraKeys!528 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun lt!119170 () (_ BitVec 64))

(assert (=> b!235910 (= lt!119170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119174 () (_ BitVec 64))

(assert (=> b!235910 (= lt!119174 (select (arr!5548 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119176 () Unit!7260)

(assert (=> b!235910 (= lt!119176 (addApplyDifferent!188 lt!119171 lt!119170 (zeroValue!4225 thiss!1504) lt!119174))))

(assert (=> b!235910 (= (apply!212 (+!645 lt!119171 (tuple2!4621 lt!119170 (zeroValue!4225 thiss!1504))) lt!119174) (apply!212 lt!119171 lt!119174))))

(declare-fun lt!119161 () Unit!7260)

(assert (=> b!235910 (= lt!119161 lt!119176)))

(declare-fun lt!119169 () ListLongMap!3523)

(assert (=> b!235910 (= lt!119169 (getCurrentListMapNoExtraKeys!528 (_keys!6461 thiss!1504) (_values!4367 thiss!1504) (mask!10364 thiss!1504) (extraKeys!4121 thiss!1504) (zeroValue!4225 thiss!1504) (minValue!4225 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4384 thiss!1504)))))

(declare-fun lt!119159 () (_ BitVec 64))

(assert (=> b!235910 (= lt!119159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119157 () (_ BitVec 64))

(assert (=> b!235910 (= lt!119157 (select (arr!5548 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235910 (= lt!119166 (addApplyDifferent!188 lt!119169 lt!119159 (minValue!4225 thiss!1504) lt!119157))))

(assert (=> b!235910 (= (apply!212 (+!645 lt!119169 (tuple2!4621 lt!119159 (minValue!4225 thiss!1504))) lt!119157) (apply!212 lt!119169 lt!119157))))

(assert (= (and d!59177 c!39275) b!235893))

(assert (= (and d!59177 (not c!39275)) b!235897))

(assert (= (and b!235897 c!39270) b!235892))

(assert (= (and b!235897 (not c!39270)) b!235895))

(assert (= (and b!235895 c!39273) b!235901))

(assert (= (and b!235895 (not c!39273)) b!235903))

(assert (= (or b!235901 b!235903) bm!21922))

(assert (= (or b!235892 bm!21922) bm!21918))

(assert (= (or b!235892 b!235901) bm!21924))

(assert (= (or b!235893 bm!21918) bm!21920))

(assert (= (or b!235893 bm!21924) bm!21919))

(assert (= (and d!59177 res!115683) b!235900))

(assert (= (and d!59177 c!39272) b!235910))

(assert (= (and d!59177 (not c!39272)) b!235904))

(assert (= (and d!59177 res!115680) b!235905))

(assert (= (and b!235905 res!115681) b!235898))

(assert (= (and b!235905 (not res!115678)) b!235906))

(assert (= (and b!235906 res!115682) b!235907))

(assert (= (and b!235905 res!115684) b!235891))

(assert (= (and b!235891 c!39274) b!235899))

(assert (= (and b!235891 (not c!39274)) b!235909))

(assert (= (and b!235899 res!115676) b!235902))

(assert (= (or b!235899 b!235909) bm!21923))

(assert (= (and b!235891 res!115677) b!235896))

(assert (= (and b!235896 c!39271) b!235908))

(assert (= (and b!235896 (not c!39271)) b!235894))

(assert (= (and b!235908 res!115679) b!235890))

(assert (= (or b!235908 b!235894) bm!21921))

(declare-fun b_lambda!7893 () Bool)

(assert (=> (not b_lambda!7893) (not b!235907)))

(declare-fun t!8512 () Bool)

(declare-fun tb!2929 () Bool)

(assert (=> (and b!235777 (= (defaultEntry!4384 thiss!1504) (defaultEntry!4384 thiss!1504)) t!8512) tb!2929))

(declare-fun result!5125 () Bool)

(assert (=> tb!2929 (= result!5125 tp_is_empty!6211)))

(assert (=> b!235907 t!8512))

(declare-fun b_and!13261 () Bool)

(assert (= b_and!13255 (and (=> t!8512 result!5125) b_and!13261)))

(declare-fun m!256325 () Bool)

(assert (=> b!235902 m!256325))

(declare-fun m!256327 () Bool)

(assert (=> b!235906 m!256327))

(assert (=> b!235906 m!256327))

(declare-fun m!256329 () Bool)

(assert (=> b!235906 m!256329))

(declare-fun m!256331 () Bool)

(assert (=> bm!21921 m!256331))

(assert (=> b!235898 m!256327))

(assert (=> b!235898 m!256327))

(declare-fun m!256333 () Bool)

(assert (=> b!235898 m!256333))

(declare-fun m!256335 () Bool)

(assert (=> b!235890 m!256335))

(assert (=> d!59177 m!256269))

(declare-fun m!256337 () Bool)

(assert (=> b!235907 m!256337))

(declare-fun m!256339 () Bool)

(assert (=> b!235907 m!256339))

(declare-fun m!256341 () Bool)

(assert (=> b!235907 m!256341))

(assert (=> b!235907 m!256327))

(assert (=> b!235907 m!256337))

(assert (=> b!235907 m!256327))

(declare-fun m!256343 () Bool)

(assert (=> b!235907 m!256343))

(assert (=> b!235907 m!256339))

(assert (=> b!235900 m!256327))

(assert (=> b!235900 m!256327))

(assert (=> b!235900 m!256333))

(declare-fun m!256345 () Bool)

(assert (=> bm!21923 m!256345))

(declare-fun m!256347 () Bool)

(assert (=> b!235893 m!256347))

(declare-fun m!256349 () Bool)

(assert (=> bm!21920 m!256349))

(declare-fun m!256351 () Bool)

(assert (=> b!235910 m!256351))

(assert (=> b!235910 m!256349))

(declare-fun m!256353 () Bool)

(assert (=> b!235910 m!256353))

(declare-fun m!256355 () Bool)

(assert (=> b!235910 m!256355))

(declare-fun m!256357 () Bool)

(assert (=> b!235910 m!256357))

(assert (=> b!235910 m!256327))

(declare-fun m!256359 () Bool)

(assert (=> b!235910 m!256359))

(declare-fun m!256361 () Bool)

(assert (=> b!235910 m!256361))

(declare-fun m!256363 () Bool)

(assert (=> b!235910 m!256363))

(declare-fun m!256365 () Bool)

(assert (=> b!235910 m!256365))

(declare-fun m!256367 () Bool)

(assert (=> b!235910 m!256367))

(declare-fun m!256369 () Bool)

(assert (=> b!235910 m!256369))

(declare-fun m!256371 () Bool)

(assert (=> b!235910 m!256371))

(declare-fun m!256373 () Bool)

(assert (=> b!235910 m!256373))

(assert (=> b!235910 m!256355))

(declare-fun m!256375 () Bool)

(assert (=> b!235910 m!256375))

(assert (=> b!235910 m!256361))

(assert (=> b!235910 m!256353))

(declare-fun m!256377 () Bool)

(assert (=> b!235910 m!256377))

(assert (=> b!235910 m!256367))

(declare-fun m!256379 () Bool)

(assert (=> b!235910 m!256379))

(declare-fun m!256381 () Bool)

(assert (=> bm!21919 m!256381))

(assert (=> b!235776 d!59177))

(declare-fun d!59179 () Bool)

(assert (=> d!59179 (= (array_inv!3659 (_keys!6461 thiss!1504)) (bvsge (size!5886 (_keys!6461 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235777 d!59179))

(declare-fun d!59181 () Bool)

(assert (=> d!59181 (= (array_inv!3660 (_values!4367 thiss!1504)) (bvsge (size!5885 (_values!4367 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235777 d!59181))

(declare-fun b!235925 () Bool)

(declare-fun c!39284 () Bool)

(declare-fun lt!119185 () (_ BitVec 64))

(assert (=> b!235925 (= c!39284 (= lt!119185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153219 () SeekEntryResult!996)

(declare-fun e!153221 () SeekEntryResult!996)

(assert (=> b!235925 (= e!153219 e!153221)))

(declare-fun b!235926 () Bool)

(declare-fun e!153220 () SeekEntryResult!996)

(assert (=> b!235926 (= e!153220 Undefined!996)))

(declare-fun d!59183 () Bool)

(declare-fun lt!119187 () SeekEntryResult!996)

(assert (=> d!59183 (and (or ((_ is Undefined!996) lt!119187) (not ((_ is Found!996) lt!119187)) (and (bvsge (index!6155 lt!119187) #b00000000000000000000000000000000) (bvslt (index!6155 lt!119187) (size!5886 (_keys!6461 thiss!1504))))) (or ((_ is Undefined!996) lt!119187) ((_ is Found!996) lt!119187) (not ((_ is MissingZero!996) lt!119187)) (and (bvsge (index!6154 lt!119187) #b00000000000000000000000000000000) (bvslt (index!6154 lt!119187) (size!5886 (_keys!6461 thiss!1504))))) (or ((_ is Undefined!996) lt!119187) ((_ is Found!996) lt!119187) ((_ is MissingZero!996) lt!119187) (not ((_ is MissingVacant!996) lt!119187)) (and (bvsge (index!6157 lt!119187) #b00000000000000000000000000000000) (bvslt (index!6157 lt!119187) (size!5886 (_keys!6461 thiss!1504))))) (or ((_ is Undefined!996) lt!119187) (ite ((_ is Found!996) lt!119187) (= (select (arr!5548 (_keys!6461 thiss!1504)) (index!6155 lt!119187)) key!932) (ite ((_ is MissingZero!996) lt!119187) (= (select (arr!5548 (_keys!6461 thiss!1504)) (index!6154 lt!119187)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!996) lt!119187) (= (select (arr!5548 (_keys!6461 thiss!1504)) (index!6157 lt!119187)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59183 (= lt!119187 e!153220)))

(declare-fun c!39283 () Bool)

(declare-fun lt!119186 () SeekEntryResult!996)

(assert (=> d!59183 (= c!39283 (and ((_ is Intermediate!996) lt!119186) (undefined!1808 lt!119186)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11677 (_ BitVec 32)) SeekEntryResult!996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59183 (= lt!119186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10364 thiss!1504)) key!932 (_keys!6461 thiss!1504) (mask!10364 thiss!1504)))))

(assert (=> d!59183 (validMask!0 (mask!10364 thiss!1504))))

(assert (=> d!59183 (= (seekEntryOrOpen!0 key!932 (_keys!6461 thiss!1504) (mask!10364 thiss!1504)) lt!119187)))

(declare-fun b!235927 () Bool)

(assert (=> b!235927 (= e!153220 e!153219)))

(assert (=> b!235927 (= lt!119185 (select (arr!5548 (_keys!6461 thiss!1504)) (index!6156 lt!119186)))))

(declare-fun c!39282 () Bool)

(assert (=> b!235927 (= c!39282 (= lt!119185 key!932))))

(declare-fun b!235928 () Bool)

(assert (=> b!235928 (= e!153221 (MissingZero!996 (index!6156 lt!119186)))))

(declare-fun b!235929 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11677 (_ BitVec 32)) SeekEntryResult!996)

(assert (=> b!235929 (= e!153221 (seekKeyOrZeroReturnVacant!0 (x!23833 lt!119186) (index!6156 lt!119186) (index!6156 lt!119186) key!932 (_keys!6461 thiss!1504) (mask!10364 thiss!1504)))))

(declare-fun b!235930 () Bool)

(assert (=> b!235930 (= e!153219 (Found!996 (index!6156 lt!119186)))))

(assert (= (and d!59183 c!39283) b!235926))

(assert (= (and d!59183 (not c!39283)) b!235927))

(assert (= (and b!235927 c!39282) b!235930))

(assert (= (and b!235927 (not c!39282)) b!235925))

(assert (= (and b!235925 c!39284) b!235928))

(assert (= (and b!235925 (not c!39284)) b!235929))

(declare-fun m!256383 () Bool)

(assert (=> d!59183 m!256383))

(declare-fun m!256385 () Bool)

(assert (=> d!59183 m!256385))

(assert (=> d!59183 m!256385))

(declare-fun m!256387 () Bool)

(assert (=> d!59183 m!256387))

(declare-fun m!256389 () Bool)

(assert (=> d!59183 m!256389))

(assert (=> d!59183 m!256269))

(declare-fun m!256391 () Bool)

(assert (=> d!59183 m!256391))

(declare-fun m!256393 () Bool)

(assert (=> b!235927 m!256393))

(declare-fun m!256395 () Bool)

(assert (=> b!235929 m!256395))

(assert (=> b!235779 d!59183))

(declare-fun b!235937 () Bool)

(declare-fun e!153226 () Bool)

(assert (=> b!235937 (= e!153226 tp_is_empty!6211)))

(declare-fun condMapEmpty!10526 () Bool)

(declare-fun mapDefault!10526 () ValueCell!2762)

(assert (=> mapNonEmpty!10517 (= condMapEmpty!10526 (= mapRest!10517 ((as const (Array (_ BitVec 32) ValueCell!2762)) mapDefault!10526)))))

(declare-fun e!153227 () Bool)

(declare-fun mapRes!10526 () Bool)

(assert (=> mapNonEmpty!10517 (= tp!22220 (and e!153227 mapRes!10526))))

(declare-fun mapNonEmpty!10526 () Bool)

(declare-fun tp!22235 () Bool)

(assert (=> mapNonEmpty!10526 (= mapRes!10526 (and tp!22235 e!153226))))

(declare-fun mapValue!10526 () ValueCell!2762)

(declare-fun mapRest!10526 () (Array (_ BitVec 32) ValueCell!2762))

(declare-fun mapKey!10526 () (_ BitVec 32))

(assert (=> mapNonEmpty!10526 (= mapRest!10517 (store mapRest!10526 mapKey!10526 mapValue!10526))))

(declare-fun mapIsEmpty!10526 () Bool)

(assert (=> mapIsEmpty!10526 mapRes!10526))

(declare-fun b!235938 () Bool)

(assert (=> b!235938 (= e!153227 tp_is_empty!6211)))

(assert (= (and mapNonEmpty!10517 condMapEmpty!10526) mapIsEmpty!10526))

(assert (= (and mapNonEmpty!10517 (not condMapEmpty!10526)) mapNonEmpty!10526))

(assert (= (and mapNonEmpty!10526 ((_ is ValueCellFull!2762) mapValue!10526)) b!235937))

(assert (= (and mapNonEmpty!10517 ((_ is ValueCellFull!2762) mapDefault!10526)) b!235938))

(declare-fun m!256397 () Bool)

(assert (=> mapNonEmpty!10526 m!256397))

(declare-fun b_lambda!7895 () Bool)

(assert (= b_lambda!7893 (or (and b!235777 b_free!6349) b_lambda!7895)))

(check-sat b_and!13261 (not d!59175) (not b_lambda!7895) tp_is_empty!6211 (not b!235837) (not b!235898) (not b!235900) (not b!235907) (not d!59177) (not b!235847) (not b!235838) (not b!235906) (not d!59183) (not bm!21919) (not b!235893) (not b!235929) (not d!59171) (not b!235910) (not bm!21920) (not b_next!6349) (not b!235902) (not b!235836) (not bm!21921) (not mapNonEmpty!10526) (not b!235845) (not b!235890) (not bm!21923))
(check-sat b_and!13261 (not b_next!6349))
