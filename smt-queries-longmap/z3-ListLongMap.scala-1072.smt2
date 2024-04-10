; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22116 () Bool)

(assert start!22116)

(declare-fun b!230175 () Bool)

(declare-fun b_free!6183 () Bool)

(declare-fun b_next!6183 () Bool)

(assert (=> b!230175 (= b_free!6183 (not b_next!6183))))

(declare-fun tp!21690 () Bool)

(declare-fun b_and!13081 () Bool)

(assert (=> b!230175 (= tp!21690 b_and!13081)))

(declare-fun b!230160 () Bool)

(declare-fun e!149352 () Bool)

(declare-fun call!21383 () Bool)

(assert (=> b!230160 (= e!149352 (not call!21383))))

(declare-fun b!230161 () Bool)

(declare-fun e!149355 () Bool)

(declare-fun e!149356 () Bool)

(assert (=> b!230161 (= e!149355 e!149356)))

(declare-fun res!113228 () Bool)

(assert (=> b!230161 (=> (not res!113228) (not e!149356))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7707 0))(
  ( (V!7708 (val!3067 Int)) )
))
(declare-datatypes ((ValueCell!2679 0))(
  ( (ValueCellFull!2679 (v!5087 V!7707)) (EmptyCell!2679) )
))
(declare-datatypes ((array!11333 0))(
  ( (array!11334 (arr!5386 (Array (_ BitVec 32) ValueCell!2679)) (size!5719 (_ BitVec 32))) )
))
(declare-datatypes ((array!11335 0))(
  ( (array!11336 (arr!5387 (Array (_ BitVec 32) (_ BitVec 64))) (size!5720 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3258 0))(
  ( (LongMapFixedSize!3259 (defaultEntry!4288 Int) (mask!10176 (_ BitVec 32)) (extraKeys!4025 (_ BitVec 32)) (zeroValue!4129 V!7707) (minValue!4129 V!7707) (_size!1678 (_ BitVec 32)) (_keys!6342 array!11335) (_values!4271 array!11333) (_vacant!1678 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3258)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230161 (= res!113228 (inRange!0 index!297 (mask!10176 thiss!1504)))))

(declare-datatypes ((Unit!7041 0))(
  ( (Unit!7042) )
))
(declare-fun lt!115811 () Unit!7041)

(declare-fun e!149359 () Unit!7041)

(assert (=> b!230161 (= lt!115811 e!149359)))

(declare-fun c!38193 () Bool)

(declare-datatypes ((tuple2!4526 0))(
  ( (tuple2!4527 (_1!2274 (_ BitVec 64)) (_2!2274 V!7707)) )
))
(declare-datatypes ((List!3449 0))(
  ( (Nil!3446) (Cons!3445 (h!4093 tuple2!4526) (t!8408 List!3449)) )
))
(declare-datatypes ((ListLongMap!3439 0))(
  ( (ListLongMap!3440 (toList!1735 List!3449)) )
))
(declare-fun lt!115813 () ListLongMap!3439)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1608 (ListLongMap!3439 (_ BitVec 64)) Bool)

(assert (=> b!230161 (= c!38193 (contains!1608 lt!115813 key!932))))

(declare-fun getCurrentListMap!1263 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7707 V!7707 (_ BitVec 32) Int) ListLongMap!3439)

(assert (=> b!230161 (= lt!115813 (getCurrentListMap!1263 (_keys!6342 thiss!1504) (_values!4271 thiss!1504) (mask!10176 thiss!1504) (extraKeys!4025 thiss!1504) (zeroValue!4129 thiss!1504) (minValue!4129 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4288 thiss!1504)))))

(declare-fun b!230162 () Bool)

(declare-fun e!149357 () Bool)

(assert (=> b!230162 (= e!149357 e!149352)))

(declare-fun res!113227 () Bool)

(declare-fun call!21384 () Bool)

(assert (=> b!230162 (= res!113227 call!21384)))

(assert (=> b!230162 (=> (not res!113227) (not e!149352))))

(declare-fun b!230163 () Bool)

(declare-datatypes ((SeekEntryResult!933 0))(
  ( (MissingZero!933 (index!5902 (_ BitVec 32))) (Found!933 (index!5903 (_ BitVec 32))) (Intermediate!933 (undefined!1745 Bool) (index!5904 (_ BitVec 32)) (x!23425 (_ BitVec 32))) (Undefined!933) (MissingVacant!933 (index!5905 (_ BitVec 32))) )
))
(declare-fun lt!115806 () SeekEntryResult!933)

(get-info :version)

(assert (=> b!230163 (= e!149357 ((_ is Undefined!933) lt!115806))))

(declare-fun b!230164 () Bool)

(declare-fun res!113226 () Bool)

(declare-fun e!149349 () Bool)

(assert (=> b!230164 (=> (not res!113226) (not e!149349))))

(assert (=> b!230164 (= res!113226 call!21384)))

(declare-fun e!149360 () Bool)

(assert (=> b!230164 (= e!149360 e!149349)))

(declare-fun bm!21380 () Bool)

(declare-fun c!38194 () Bool)

(assert (=> bm!21380 (= call!21384 (inRange!0 (ite c!38194 (index!5902 lt!115806) (index!5905 lt!115806)) (mask!10176 thiss!1504)))))

(declare-fun mapNonEmpty!10237 () Bool)

(declare-fun mapRes!10237 () Bool)

(declare-fun tp!21691 () Bool)

(declare-fun e!149348 () Bool)

(assert (=> mapNonEmpty!10237 (= mapRes!10237 (and tp!21691 e!149348))))

(declare-fun mapKey!10237 () (_ BitVec 32))

(declare-fun mapValue!10237 () ValueCell!2679)

(declare-fun mapRest!10237 () (Array (_ BitVec 32) ValueCell!2679))

(assert (=> mapNonEmpty!10237 (= (arr!5386 (_values!4271 thiss!1504)) (store mapRest!10237 mapKey!10237 mapValue!10237))))

(declare-fun b!230165 () Bool)

(assert (=> b!230165 (= e!149356 (not true))))

(declare-fun v!346 () V!7707)

(declare-fun lt!115812 () array!11335)

(declare-fun +!603 (ListLongMap!3439 tuple2!4526) ListLongMap!3439)

(assert (=> b!230165 (= (+!603 lt!115813 (tuple2!4527 key!932 v!346)) (getCurrentListMap!1263 lt!115812 (array!11334 (store (arr!5386 (_values!4271 thiss!1504)) index!297 (ValueCellFull!2679 v!346)) (size!5719 (_values!4271 thiss!1504))) (mask!10176 thiss!1504) (extraKeys!4025 thiss!1504) (zeroValue!4129 thiss!1504) (minValue!4129 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4288 thiss!1504)))))

(declare-fun lt!115816 () Unit!7041)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!57 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7707 V!7707 (_ BitVec 32) (_ BitVec 64) V!7707 Int) Unit!7041)

(assert (=> b!230165 (= lt!115816 (lemmaAddValidKeyToArrayThenAddPairToListMap!57 (_keys!6342 thiss!1504) (_values!4271 thiss!1504) (mask!10176 thiss!1504) (extraKeys!4025 thiss!1504) (zeroValue!4129 thiss!1504) (minValue!4129 thiss!1504) index!297 key!932 v!346 (defaultEntry!4288 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11335 (_ BitVec 32)) Bool)

(assert (=> b!230165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115812 (mask!10176 thiss!1504))))

(declare-fun lt!115809 () Unit!7041)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11335 (_ BitVec 32) (_ BitVec 32)) Unit!7041)

(assert (=> b!230165 (= lt!115809 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6342 thiss!1504) index!297 (mask!10176 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11335 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230165 (= (arrayCountValidKeys!0 lt!115812 #b00000000000000000000000000000000 (size!5720 (_keys!6342 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6342 thiss!1504) #b00000000000000000000000000000000 (size!5720 (_keys!6342 thiss!1504)))))))

(declare-fun lt!115807 () Unit!7041)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11335 (_ BitVec 32) (_ BitVec 64)) Unit!7041)

(assert (=> b!230165 (= lt!115807 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6342 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3450 0))(
  ( (Nil!3447) (Cons!3446 (h!4094 (_ BitVec 64)) (t!8409 List!3450)) )
))
(declare-fun arrayNoDuplicates!0 (array!11335 (_ BitVec 32) List!3450) Bool)

(assert (=> b!230165 (arrayNoDuplicates!0 lt!115812 #b00000000000000000000000000000000 Nil!3447)))

(assert (=> b!230165 (= lt!115812 (array!11336 (store (arr!5387 (_keys!6342 thiss!1504)) index!297 key!932) (size!5720 (_keys!6342 thiss!1504))))))

(declare-fun lt!115808 () Unit!7041)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3450) Unit!7041)

(assert (=> b!230165 (= lt!115808 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6342 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3447))))

(declare-fun lt!115815 () Unit!7041)

(declare-fun e!149354 () Unit!7041)

(assert (=> b!230165 (= lt!115815 e!149354)))

(declare-fun c!38196 () Bool)

(declare-fun arrayContainsKey!0 (array!11335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230165 (= c!38196 (arrayContainsKey!0 (_keys!6342 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230166 () Bool)

(declare-fun c!38195 () Bool)

(assert (=> b!230166 (= c!38195 ((_ is MissingVacant!933) lt!115806))))

(assert (=> b!230166 (= e!149360 e!149357)))

(declare-fun b!230167 () Bool)

(declare-fun Unit!7043 () Unit!7041)

(assert (=> b!230167 (= e!149354 Unit!7043)))

(declare-fun lt!115810 () Unit!7041)

(declare-fun lemmaArrayContainsKeyThenInListMap!122 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7707 V!7707 (_ BitVec 64) (_ BitVec 32) Int) Unit!7041)

(assert (=> b!230167 (= lt!115810 (lemmaArrayContainsKeyThenInListMap!122 (_keys!6342 thiss!1504) (_values!4271 thiss!1504) (mask!10176 thiss!1504) (extraKeys!4025 thiss!1504) (zeroValue!4129 thiss!1504) (minValue!4129 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4288 thiss!1504)))))

(assert (=> b!230167 false))

(declare-fun b!230168 () Bool)

(declare-fun res!113232 () Bool)

(assert (=> b!230168 (= res!113232 (= (select (arr!5387 (_keys!6342 thiss!1504)) (index!5905 lt!115806)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230168 (=> (not res!113232) (not e!149352))))

(declare-fun b!230170 () Bool)

(declare-fun Unit!7044 () Unit!7041)

(assert (=> b!230170 (= e!149354 Unit!7044)))

(declare-fun mapIsEmpty!10237 () Bool)

(assert (=> mapIsEmpty!10237 mapRes!10237))

(declare-fun b!230171 () Bool)

(assert (=> b!230171 (= e!149349 (not call!21383))))

(declare-fun b!230172 () Bool)

(declare-fun res!113231 () Bool)

(declare-fun e!149351 () Bool)

(assert (=> b!230172 (=> (not res!113231) (not e!149351))))

(assert (=> b!230172 (= res!113231 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230173 () Bool)

(declare-fun res!113229 () Bool)

(assert (=> b!230173 (=> (not res!113229) (not e!149349))))

(assert (=> b!230173 (= res!113229 (= (select (arr!5387 (_keys!6342 thiss!1504)) (index!5902 lt!115806)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21381 () Bool)

(assert (=> bm!21381 (= call!21383 (arrayContainsKey!0 (_keys!6342 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230174 () Bool)

(assert (=> b!230174 (= e!149351 e!149355)))

(declare-fun res!113230 () Bool)

(assert (=> b!230174 (=> (not res!113230) (not e!149355))))

(assert (=> b!230174 (= res!113230 (or (= lt!115806 (MissingZero!933 index!297)) (= lt!115806 (MissingVacant!933 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11335 (_ BitVec 32)) SeekEntryResult!933)

(assert (=> b!230174 (= lt!115806 (seekEntryOrOpen!0 key!932 (_keys!6342 thiss!1504) (mask!10176 thiss!1504)))))

(declare-fun e!149353 () Bool)

(declare-fun e!149350 () Bool)

(declare-fun tp_is_empty!6045 () Bool)

(declare-fun array_inv!3555 (array!11335) Bool)

(declare-fun array_inv!3556 (array!11333) Bool)

(assert (=> b!230175 (= e!149353 (and tp!21690 tp_is_empty!6045 (array_inv!3555 (_keys!6342 thiss!1504)) (array_inv!3556 (_values!4271 thiss!1504)) e!149350))))

(declare-fun b!230176 () Bool)

(declare-fun Unit!7045 () Unit!7041)

(assert (=> b!230176 (= e!149359 Unit!7045)))

(declare-fun lt!115817 () Unit!7041)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!288 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7707 V!7707 (_ BitVec 64) Int) Unit!7041)

(assert (=> b!230176 (= lt!115817 (lemmaInListMapThenSeekEntryOrOpenFindsIt!288 (_keys!6342 thiss!1504) (_values!4271 thiss!1504) (mask!10176 thiss!1504) (extraKeys!4025 thiss!1504) (zeroValue!4129 thiss!1504) (minValue!4129 thiss!1504) key!932 (defaultEntry!4288 thiss!1504)))))

(assert (=> b!230176 false))

(declare-fun b!230177 () Bool)

(declare-fun e!149347 () Bool)

(assert (=> b!230177 (= e!149347 tp_is_empty!6045)))

(declare-fun b!230178 () Bool)

(declare-fun lt!115814 () Unit!7041)

(assert (=> b!230178 (= e!149359 lt!115814)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!305 (array!11335 array!11333 (_ BitVec 32) (_ BitVec 32) V!7707 V!7707 (_ BitVec 64) Int) Unit!7041)

(assert (=> b!230178 (= lt!115814 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!305 (_keys!6342 thiss!1504) (_values!4271 thiss!1504) (mask!10176 thiss!1504) (extraKeys!4025 thiss!1504) (zeroValue!4129 thiss!1504) (minValue!4129 thiss!1504) key!932 (defaultEntry!4288 thiss!1504)))))

(assert (=> b!230178 (= c!38194 ((_ is MissingZero!933) lt!115806))))

(assert (=> b!230178 e!149360))

(declare-fun b!230179 () Bool)

(assert (=> b!230179 (= e!149348 tp_is_empty!6045)))

(declare-fun b!230169 () Bool)

(assert (=> b!230169 (= e!149350 (and e!149347 mapRes!10237))))

(declare-fun condMapEmpty!10237 () Bool)

(declare-fun mapDefault!10237 () ValueCell!2679)

(assert (=> b!230169 (= condMapEmpty!10237 (= (arr!5386 (_values!4271 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2679)) mapDefault!10237)))))

(declare-fun res!113233 () Bool)

(assert (=> start!22116 (=> (not res!113233) (not e!149351))))

(declare-fun valid!1299 (LongMapFixedSize!3258) Bool)

(assert (=> start!22116 (= res!113233 (valid!1299 thiss!1504))))

(assert (=> start!22116 e!149351))

(assert (=> start!22116 e!149353))

(assert (=> start!22116 true))

(assert (=> start!22116 tp_is_empty!6045))

(assert (= (and start!22116 res!113233) b!230172))

(assert (= (and b!230172 res!113231) b!230174))

(assert (= (and b!230174 res!113230) b!230161))

(assert (= (and b!230161 c!38193) b!230176))

(assert (= (and b!230161 (not c!38193)) b!230178))

(assert (= (and b!230178 c!38194) b!230164))

(assert (= (and b!230178 (not c!38194)) b!230166))

(assert (= (and b!230164 res!113226) b!230173))

(assert (= (and b!230173 res!113229) b!230171))

(assert (= (and b!230166 c!38195) b!230162))

(assert (= (and b!230166 (not c!38195)) b!230163))

(assert (= (and b!230162 res!113227) b!230168))

(assert (= (and b!230168 res!113232) b!230160))

(assert (= (or b!230164 b!230162) bm!21380))

(assert (= (or b!230171 b!230160) bm!21381))

(assert (= (and b!230161 res!113228) b!230165))

(assert (= (and b!230165 c!38196) b!230167))

(assert (= (and b!230165 (not c!38196)) b!230170))

(assert (= (and b!230169 condMapEmpty!10237) mapIsEmpty!10237))

(assert (= (and b!230169 (not condMapEmpty!10237)) mapNonEmpty!10237))

(assert (= (and mapNonEmpty!10237 ((_ is ValueCellFull!2679) mapValue!10237)) b!230179))

(assert (= (and b!230169 ((_ is ValueCellFull!2679) mapDefault!10237)) b!230177))

(assert (= b!230175 b!230169))

(assert (= start!22116 b!230175))

(declare-fun m!251561 () Bool)

(assert (=> bm!21381 m!251561))

(declare-fun m!251563 () Bool)

(assert (=> bm!21380 m!251563))

(declare-fun m!251565 () Bool)

(assert (=> start!22116 m!251565))

(declare-fun m!251567 () Bool)

(assert (=> b!230175 m!251567))

(declare-fun m!251569 () Bool)

(assert (=> b!230175 m!251569))

(declare-fun m!251571 () Bool)

(assert (=> b!230165 m!251571))

(declare-fun m!251573 () Bool)

(assert (=> b!230165 m!251573))

(declare-fun m!251575 () Bool)

(assert (=> b!230165 m!251575))

(declare-fun m!251577 () Bool)

(assert (=> b!230165 m!251577))

(declare-fun m!251579 () Bool)

(assert (=> b!230165 m!251579))

(declare-fun m!251581 () Bool)

(assert (=> b!230165 m!251581))

(declare-fun m!251583 () Bool)

(assert (=> b!230165 m!251583))

(declare-fun m!251585 () Bool)

(assert (=> b!230165 m!251585))

(declare-fun m!251587 () Bool)

(assert (=> b!230165 m!251587))

(assert (=> b!230165 m!251561))

(declare-fun m!251589 () Bool)

(assert (=> b!230165 m!251589))

(declare-fun m!251591 () Bool)

(assert (=> b!230165 m!251591))

(declare-fun m!251593 () Bool)

(assert (=> b!230165 m!251593))

(declare-fun m!251595 () Bool)

(assert (=> b!230167 m!251595))

(declare-fun m!251597 () Bool)

(assert (=> mapNonEmpty!10237 m!251597))

(declare-fun m!251599 () Bool)

(assert (=> b!230174 m!251599))

(declare-fun m!251601 () Bool)

(assert (=> b!230176 m!251601))

(declare-fun m!251603 () Bool)

(assert (=> b!230161 m!251603))

(declare-fun m!251605 () Bool)

(assert (=> b!230161 m!251605))

(declare-fun m!251607 () Bool)

(assert (=> b!230161 m!251607))

(declare-fun m!251609 () Bool)

(assert (=> b!230173 m!251609))

(declare-fun m!251611 () Bool)

(assert (=> b!230168 m!251611))

(declare-fun m!251613 () Bool)

(assert (=> b!230178 m!251613))

(check-sat (not b_next!6183) (not start!22116) (not b!230161) (not bm!21380) (not b!230167) (not b!230175) (not b!230165) tp_is_empty!6045 (not mapNonEmpty!10237) b_and!13081 (not b!230178) (not bm!21381) (not b!230174) (not b!230176))
(check-sat b_and!13081 (not b_next!6183))
