; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22108 () Bool)

(assert start!22108)

(declare-fun b!229923 () Bool)

(declare-fun b_free!6175 () Bool)

(declare-fun b_next!6175 () Bool)

(assert (=> b!229923 (= b_free!6175 (not b_next!6175))))

(declare-fun tp!21667 () Bool)

(declare-fun b_and!13073 () Bool)

(assert (=> b!229923 (= tp!21667 b_and!13073)))

(declare-fun b!229920 () Bool)

(declare-fun e!149180 () Bool)

(declare-fun e!149179 () Bool)

(assert (=> b!229920 (= e!149180 e!149179)))

(declare-fun res!113133 () Bool)

(assert (=> b!229920 (=> (not res!113133) (not e!149179))))

(declare-datatypes ((SeekEntryResult!929 0))(
  ( (MissingZero!929 (index!5886 (_ BitVec 32))) (Found!929 (index!5887 (_ BitVec 32))) (Intermediate!929 (undefined!1741 Bool) (index!5888 (_ BitVec 32)) (x!23413 (_ BitVec 32))) (Undefined!929) (MissingVacant!929 (index!5889 (_ BitVec 32))) )
))
(declare-fun lt!115671 () SeekEntryResult!929)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229920 (= res!113133 (or (= lt!115671 (MissingZero!929 index!297)) (= lt!115671 (MissingVacant!929 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7697 0))(
  ( (V!7698 (val!3063 Int)) )
))
(declare-datatypes ((ValueCell!2675 0))(
  ( (ValueCellFull!2675 (v!5083 V!7697)) (EmptyCell!2675) )
))
(declare-datatypes ((array!11317 0))(
  ( (array!11318 (arr!5378 (Array (_ BitVec 32) ValueCell!2675)) (size!5711 (_ BitVec 32))) )
))
(declare-datatypes ((array!11319 0))(
  ( (array!11320 (arr!5379 (Array (_ BitVec 32) (_ BitVec 64))) (size!5712 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3250 0))(
  ( (LongMapFixedSize!3251 (defaultEntry!4284 Int) (mask!10170 (_ BitVec 32)) (extraKeys!4021 (_ BitVec 32)) (zeroValue!4125 V!7697) (minValue!4125 V!7697) (_size!1674 (_ BitVec 32)) (_keys!6338 array!11319) (_values!4267 array!11317) (_vacant!1674 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3250)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11319 (_ BitVec 32)) SeekEntryResult!929)

(assert (=> b!229920 (= lt!115671 (seekEntryOrOpen!0 key!932 (_keys!6338 thiss!1504) (mask!10170 thiss!1504)))))

(declare-fun b!229921 () Bool)

(declare-fun e!149189 () Bool)

(assert (=> b!229921 (= e!149179 e!149189)))

(declare-fun res!113134 () Bool)

(assert (=> b!229921 (=> (not res!113134) (not e!149189))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229921 (= res!113134 (inRange!0 index!297 (mask!10170 thiss!1504)))))

(declare-datatypes ((Unit!7023 0))(
  ( (Unit!7024) )
))
(declare-fun lt!115668 () Unit!7023)

(declare-fun e!149181 () Unit!7023)

(assert (=> b!229921 (= lt!115668 e!149181)))

(declare-fun c!38146 () Bool)

(declare-datatypes ((tuple2!4518 0))(
  ( (tuple2!4519 (_1!2270 (_ BitVec 64)) (_2!2270 V!7697)) )
))
(declare-datatypes ((List!3442 0))(
  ( (Nil!3439) (Cons!3438 (h!4086 tuple2!4518) (t!8401 List!3442)) )
))
(declare-datatypes ((ListLongMap!3431 0))(
  ( (ListLongMap!3432 (toList!1731 List!3442)) )
))
(declare-fun lt!115664 () ListLongMap!3431)

(declare-fun contains!1604 (ListLongMap!3431 (_ BitVec 64)) Bool)

(assert (=> b!229921 (= c!38146 (contains!1604 lt!115664 key!932))))

(declare-fun getCurrentListMap!1259 (array!11319 array!11317 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 32) Int) ListLongMap!3431)

(assert (=> b!229921 (= lt!115664 (getCurrentListMap!1259 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(declare-fun mapIsEmpty!10225 () Bool)

(declare-fun mapRes!10225 () Bool)

(assert (=> mapIsEmpty!10225 mapRes!10225))

(declare-fun bm!21356 () Bool)

(declare-fun call!21359 () Bool)

(declare-fun arrayContainsKey!0 (array!11319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21356 (= call!21359 (arrayContainsKey!0 (_keys!6338 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!149185 () Bool)

(declare-fun e!149183 () Bool)

(declare-fun tp_is_empty!6037 () Bool)

(declare-fun array_inv!3549 (array!11319) Bool)

(declare-fun array_inv!3550 (array!11317) Bool)

(assert (=> b!229923 (= e!149183 (and tp!21667 tp_is_empty!6037 (array_inv!3549 (_keys!6338 thiss!1504)) (array_inv!3550 (_values!4267 thiss!1504)) e!149185))))

(declare-fun b!229924 () Bool)

(declare-fun e!149191 () Bool)

(declare-fun e!149184 () Bool)

(assert (=> b!229924 (= e!149191 e!149184)))

(declare-fun res!113132 () Bool)

(declare-fun call!21360 () Bool)

(assert (=> b!229924 (= res!113132 call!21360)))

(assert (=> b!229924 (=> (not res!113132) (not e!149184))))

(declare-fun b!229925 () Bool)

(declare-fun lt!115667 () Unit!7023)

(assert (=> b!229925 (= e!149181 lt!115667)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!302 (array!11319 array!11317 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) Int) Unit!7023)

(assert (=> b!229925 (= lt!115667 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!302 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 (defaultEntry!4284 thiss!1504)))))

(declare-fun c!38148 () Bool)

(assert (=> b!229925 (= c!38148 (is-MissingZero!929 lt!115671))))

(declare-fun e!149192 () Bool)

(assert (=> b!229925 e!149192))

(declare-fun b!229926 () Bool)

(declare-fun res!113130 () Bool)

(declare-fun e!149190 () Bool)

(assert (=> b!229926 (=> (not res!113130) (not e!149190))))

(assert (=> b!229926 (= res!113130 call!21360)))

(assert (=> b!229926 (= e!149192 e!149190)))

(declare-fun b!229927 () Bool)

(declare-fun e!149187 () Bool)

(assert (=> b!229927 (= e!149187 tp_is_empty!6037)))

(declare-fun b!229928 () Bool)

(declare-fun e!149182 () Unit!7023)

(declare-fun Unit!7025 () Unit!7023)

(assert (=> b!229928 (= e!149182 Unit!7025)))

(declare-fun b!229929 () Bool)

(declare-fun c!38147 () Bool)

(assert (=> b!229929 (= c!38147 (is-MissingVacant!929 lt!115671))))

(assert (=> b!229929 (= e!149192 e!149191)))

(declare-fun b!229930 () Bool)

(declare-fun Unit!7026 () Unit!7023)

(assert (=> b!229930 (= e!149182 Unit!7026)))

(declare-fun lt!115662 () Unit!7023)

(declare-fun lemmaArrayContainsKeyThenInListMap!119 (array!11319 array!11317 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) (_ BitVec 32) Int) Unit!7023)

(assert (=> b!229930 (= lt!115662 (lemmaArrayContainsKeyThenInListMap!119 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(assert (=> b!229930 false))

(declare-fun b!229922 () Bool)

(assert (=> b!229922 (= e!149189 (not true))))

(declare-fun lt!115673 () array!11319)

(declare-fun v!346 () V!7697)

(declare-fun +!600 (ListLongMap!3431 tuple2!4518) ListLongMap!3431)

(assert (=> b!229922 (= (+!600 lt!115664 (tuple2!4519 key!932 v!346)) (getCurrentListMap!1259 lt!115673 (array!11318 (store (arr!5378 (_values!4267 thiss!1504)) index!297 (ValueCellFull!2675 v!346)) (size!5711 (_values!4267 thiss!1504))) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4284 thiss!1504)))))

(declare-fun lt!115666 () Unit!7023)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!54 (array!11319 array!11317 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 32) (_ BitVec 64) V!7697 Int) Unit!7023)

(assert (=> b!229922 (= lt!115666 (lemmaAddValidKeyToArrayThenAddPairToListMap!54 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) index!297 key!932 v!346 (defaultEntry!4284 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11319 (_ BitVec 32)) Bool)

(assert (=> b!229922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115673 (mask!10170 thiss!1504))))

(declare-fun lt!115670 () Unit!7023)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11319 (_ BitVec 32) (_ BitVec 32)) Unit!7023)

(assert (=> b!229922 (= lt!115670 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6338 thiss!1504) index!297 (mask!10170 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11319 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229922 (= (arrayCountValidKeys!0 lt!115673 #b00000000000000000000000000000000 (size!5712 (_keys!6338 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6338 thiss!1504) #b00000000000000000000000000000000 (size!5712 (_keys!6338 thiss!1504)))))))

(declare-fun lt!115665 () Unit!7023)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11319 (_ BitVec 32) (_ BitVec 64)) Unit!7023)

(assert (=> b!229922 (= lt!115665 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6338 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3443 0))(
  ( (Nil!3440) (Cons!3439 (h!4087 (_ BitVec 64)) (t!8402 List!3443)) )
))
(declare-fun arrayNoDuplicates!0 (array!11319 (_ BitVec 32) List!3443) Bool)

(assert (=> b!229922 (arrayNoDuplicates!0 lt!115673 #b00000000000000000000000000000000 Nil!3440)))

(assert (=> b!229922 (= lt!115673 (array!11320 (store (arr!5379 (_keys!6338 thiss!1504)) index!297 key!932) (size!5712 (_keys!6338 thiss!1504))))))

(declare-fun lt!115663 () Unit!7023)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3443) Unit!7023)

(assert (=> b!229922 (= lt!115663 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6338 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3440))))

(declare-fun lt!115672 () Unit!7023)

(assert (=> b!229922 (= lt!115672 e!149182)))

(declare-fun c!38145 () Bool)

(assert (=> b!229922 (= c!38145 (arrayContainsKey!0 (_keys!6338 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!113136 () Bool)

(assert (=> start!22108 (=> (not res!113136) (not e!149180))))

(declare-fun valid!1296 (LongMapFixedSize!3250) Bool)

(assert (=> start!22108 (= res!113136 (valid!1296 thiss!1504))))

(assert (=> start!22108 e!149180))

(assert (=> start!22108 e!149183))

(assert (=> start!22108 true))

(assert (=> start!22108 tp_is_empty!6037))

(declare-fun mapNonEmpty!10225 () Bool)

(declare-fun tp!21666 () Bool)

(assert (=> mapNonEmpty!10225 (= mapRes!10225 (and tp!21666 e!149187))))

(declare-fun mapRest!10225 () (Array (_ BitVec 32) ValueCell!2675))

(declare-fun mapValue!10225 () ValueCell!2675)

(declare-fun mapKey!10225 () (_ BitVec 32))

(assert (=> mapNonEmpty!10225 (= (arr!5378 (_values!4267 thiss!1504)) (store mapRest!10225 mapKey!10225 mapValue!10225))))

(declare-fun b!229931 () Bool)

(assert (=> b!229931 (= e!149191 (is-Undefined!929 lt!115671))))

(declare-fun bm!21357 () Bool)

(assert (=> bm!21357 (= call!21360 (inRange!0 (ite c!38148 (index!5886 lt!115671) (index!5889 lt!115671)) (mask!10170 thiss!1504)))))

(declare-fun b!229932 () Bool)

(assert (=> b!229932 (= e!149190 (not call!21359))))

(declare-fun b!229933 () Bool)

(assert (=> b!229933 (= e!149184 (not call!21359))))

(declare-fun b!229934 () Bool)

(declare-fun Unit!7027 () Unit!7023)

(assert (=> b!229934 (= e!149181 Unit!7027)))

(declare-fun lt!115669 () Unit!7023)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!285 (array!11319 array!11317 (_ BitVec 32) (_ BitVec 32) V!7697 V!7697 (_ BitVec 64) Int) Unit!7023)

(assert (=> b!229934 (= lt!115669 (lemmaInListMapThenSeekEntryOrOpenFindsIt!285 (_keys!6338 thiss!1504) (_values!4267 thiss!1504) (mask!10170 thiss!1504) (extraKeys!4021 thiss!1504) (zeroValue!4125 thiss!1504) (minValue!4125 thiss!1504) key!932 (defaultEntry!4284 thiss!1504)))))

(assert (=> b!229934 false))

(declare-fun b!229935 () Bool)

(declare-fun e!149188 () Bool)

(assert (=> b!229935 (= e!149188 tp_is_empty!6037)))

(declare-fun b!229936 () Bool)

(declare-fun res!113131 () Bool)

(assert (=> b!229936 (=> (not res!113131) (not e!149180))))

(assert (=> b!229936 (= res!113131 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229937 () Bool)

(assert (=> b!229937 (= e!149185 (and e!149188 mapRes!10225))))

(declare-fun condMapEmpty!10225 () Bool)

(declare-fun mapDefault!10225 () ValueCell!2675)

