; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24282 () Bool)

(assert start!24282)

(declare-fun b!254017 () Bool)

(declare-fun b_free!6679 () Bool)

(declare-fun b_next!6679 () Bool)

(assert (=> b!254017 (= b_free!6679 (not b_next!6679))))

(declare-fun tp!23325 () Bool)

(declare-fun b_and!13695 () Bool)

(assert (=> b!254017 (= tp!23325 b_and!13695)))

(declare-fun b!254009 () Bool)

(declare-fun res!124339 () Bool)

(declare-fun e!164639 () Bool)

(assert (=> b!254009 (=> (not res!124339) (not e!164639))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!254009 (= res!124339 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254010 () Bool)

(declare-fun e!164646 () Bool)

(assert (=> b!254010 (= e!164646 true)))

(declare-fun lt!127184 () Bool)

(declare-datatypes ((V!8369 0))(
  ( (V!8370 (val!3315 Int)) )
))
(declare-datatypes ((ValueCell!2927 0))(
  ( (ValueCellFull!2927 (v!5383 V!8369)) (EmptyCell!2927) )
))
(declare-datatypes ((array!12405 0))(
  ( (array!12406 (arr!5877 (Array (_ BitVec 32) ValueCell!2927)) (size!6225 (_ BitVec 32))) )
))
(declare-datatypes ((array!12407 0))(
  ( (array!12408 (arr!5878 (Array (_ BitVec 32) (_ BitVec 64))) (size!6226 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3754 0))(
  ( (LongMapFixedSize!3755 (defaultEntry!4690 Int) (mask!10933 (_ BitVec 32)) (extraKeys!4427 (_ BitVec 32)) (zeroValue!4531 V!8369) (minValue!4531 V!8369) (_size!1926 (_ BitVec 32)) (_keys!6843 array!12407) (_values!4673 array!12405) (_vacant!1926 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3754)

(declare-datatypes ((List!3737 0))(
  ( (Nil!3734) (Cons!3733 (h!4395 (_ BitVec 64)) (t!8775 List!3737)) )
))
(declare-fun arrayNoDuplicates!0 (array!12407 (_ BitVec 32) List!3737) Bool)

(assert (=> b!254010 (= lt!127184 (arrayNoDuplicates!0 (_keys!6843 thiss!1504) #b00000000000000000000000000000000 Nil!3734))))

(declare-fun b!254011 () Bool)

(declare-datatypes ((Unit!7837 0))(
  ( (Unit!7838) )
))
(declare-fun e!164640 () Unit!7837)

(declare-fun lt!127182 () Unit!7837)

(assert (=> b!254011 (= e!164640 lt!127182)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!412 (array!12407 array!12405 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 64) Int) Unit!7837)

(assert (=> b!254011 (= lt!127182 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!412 (_keys!6843 thiss!1504) (_values!4673 thiss!1504) (mask!10933 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) key!932 (defaultEntry!4690 thiss!1504)))))

(declare-fun c!42839 () Bool)

(declare-datatypes ((SeekEntryResult!1142 0))(
  ( (MissingZero!1142 (index!6738 (_ BitVec 32))) (Found!1142 (index!6739 (_ BitVec 32))) (Intermediate!1142 (undefined!1954 Bool) (index!6740 (_ BitVec 32)) (x!24849 (_ BitVec 32))) (Undefined!1142) (MissingVacant!1142 (index!6741 (_ BitVec 32))) )
))
(declare-fun lt!127185 () SeekEntryResult!1142)

(get-info :version)

(assert (=> b!254011 (= c!42839 ((_ is MissingZero!1142) lt!127185))))

(declare-fun e!164644 () Bool)

(assert (=> b!254011 e!164644))

(declare-fun b!254012 () Bool)

(declare-fun e!164649 () Bool)

(declare-fun e!164642 () Bool)

(assert (=> b!254012 (= e!164649 e!164642)))

(declare-fun res!124330 () Bool)

(assert (=> b!254012 (=> (not res!124330) (not e!164642))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254012 (= res!124330 (inRange!0 index!297 (mask!10933 thiss!1504)))))

(declare-fun lt!127183 () Unit!7837)

(assert (=> b!254012 (= lt!127183 e!164640)))

(declare-fun c!42840 () Bool)

(declare-datatypes ((tuple2!4834 0))(
  ( (tuple2!4835 (_1!2428 (_ BitVec 64)) (_2!2428 V!8369)) )
))
(declare-datatypes ((List!3738 0))(
  ( (Nil!3735) (Cons!3734 (h!4396 tuple2!4834) (t!8776 List!3738)) )
))
(declare-datatypes ((ListLongMap!3737 0))(
  ( (ListLongMap!3738 (toList!1884 List!3738)) )
))
(declare-fun contains!1819 (ListLongMap!3737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1393 (array!12407 array!12405 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 32) Int) ListLongMap!3737)

(assert (=> b!254012 (= c!42840 (contains!1819 (getCurrentListMap!1393 (_keys!6843 thiss!1504) (_values!4673 thiss!1504) (mask!10933 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4690 thiss!1504)) key!932))))

(declare-fun b!254013 () Bool)

(declare-fun res!124329 () Bool)

(assert (=> b!254013 (= res!124329 (= (select (arr!5878 (_keys!6843 thiss!1504)) (index!6741 lt!127185)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164647 () Bool)

(assert (=> b!254013 (=> (not res!124329) (not e!164647))))

(declare-fun b!254014 () Bool)

(declare-fun e!164651 () Bool)

(declare-fun call!23959 () Bool)

(assert (=> b!254014 (= e!164651 (not call!23959))))

(declare-fun bm!23955 () Bool)

(declare-fun arrayContainsKey!0 (array!12407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23955 (= call!23959 (arrayContainsKey!0 (_keys!6843 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254015 () Bool)

(assert (=> b!254015 (= e!164647 (not call!23959))))

(declare-fun b!254016 () Bool)

(assert (=> b!254016 (= e!164639 e!164649)))

(declare-fun res!124337 () Bool)

(assert (=> b!254016 (=> (not res!124337) (not e!164649))))

(assert (=> b!254016 (= res!124337 (or (= lt!127185 (MissingZero!1142 index!297)) (= lt!127185 (MissingVacant!1142 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12407 (_ BitVec 32)) SeekEntryResult!1142)

(assert (=> b!254016 (= lt!127185 (seekEntryOrOpen!0 key!932 (_keys!6843 thiss!1504) (mask!10933 thiss!1504)))))

(declare-fun e!164645 () Bool)

(declare-fun e!164650 () Bool)

(declare-fun tp_is_empty!6541 () Bool)

(declare-fun array_inv!3875 (array!12407) Bool)

(declare-fun array_inv!3876 (array!12405) Bool)

(assert (=> b!254017 (= e!164650 (and tp!23325 tp_is_empty!6541 (array_inv!3875 (_keys!6843 thiss!1504)) (array_inv!3876 (_values!4673 thiss!1504)) e!164645))))

(declare-fun b!254018 () Bool)

(declare-fun e!164643 () Unit!7837)

(declare-fun Unit!7839 () Unit!7837)

(assert (=> b!254018 (= e!164643 Unit!7839)))

(declare-fun lt!127178 () Unit!7837)

(declare-fun lemmaArrayContainsKeyThenInListMap!222 (array!12407 array!12405 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 64) (_ BitVec 32) Int) Unit!7837)

(assert (=> b!254018 (= lt!127178 (lemmaArrayContainsKeyThenInListMap!222 (_keys!6843 thiss!1504) (_values!4673 thiss!1504) (mask!10933 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4690 thiss!1504)))))

(assert (=> b!254018 false))

(declare-fun res!124334 () Bool)

(assert (=> start!24282 (=> (not res!124334) (not e!164639))))

(declare-fun valid!1469 (LongMapFixedSize!3754) Bool)

(assert (=> start!24282 (= res!124334 (valid!1469 thiss!1504))))

(assert (=> start!24282 e!164639))

(assert (=> start!24282 e!164650))

(assert (=> start!24282 true))

(declare-fun b!254019 () Bool)

(declare-fun res!124335 () Bool)

(assert (=> b!254019 (=> res!124335 e!164646)))

(assert (=> b!254019 (= res!124335 (or (not (= (size!6225 (_values!4673 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10933 thiss!1504)))) (not (= (size!6226 (_keys!6843 thiss!1504)) (size!6225 (_values!4673 thiss!1504)))) (bvslt (mask!10933 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4427 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4427 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!254020 () Bool)

(declare-fun e!164637 () Bool)

(assert (=> b!254020 (= e!164637 ((_ is Undefined!1142) lt!127185))))

(declare-fun b!254021 () Bool)

(declare-fun Unit!7840 () Unit!7837)

(assert (=> b!254021 (= e!164643 Unit!7840)))

(declare-fun b!254022 () Bool)

(declare-fun res!124332 () Bool)

(assert (=> b!254022 (=> (not res!124332) (not e!164651))))

(assert (=> b!254022 (= res!124332 (= (select (arr!5878 (_keys!6843 thiss!1504)) (index!6738 lt!127185)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254023 () Bool)

(declare-fun e!164641 () Bool)

(assert (=> b!254023 (= e!164641 tp_is_empty!6541)))

(declare-fun b!254024 () Bool)

(assert (=> b!254024 (= e!164642 (not e!164646))))

(declare-fun res!124338 () Bool)

(assert (=> b!254024 (=> res!124338 e!164646)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254024 (= res!124338 (not (validMask!0 (mask!10933 thiss!1504))))))

(declare-fun lt!127186 () array!12407)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12407 (_ BitVec 32)) Bool)

(assert (=> b!254024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127186 (mask!10933 thiss!1504))))

(declare-fun lt!127181 () Unit!7837)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12407 (_ BitVec 32) (_ BitVec 32)) Unit!7837)

(assert (=> b!254024 (= lt!127181 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6843 thiss!1504) index!297 (mask!10933 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12407 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254024 (= (arrayCountValidKeys!0 lt!127186 #b00000000000000000000000000000000 (size!6226 (_keys!6843 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6843 thiss!1504) #b00000000000000000000000000000000 (size!6226 (_keys!6843 thiss!1504)))))))

(declare-fun lt!127177 () Unit!7837)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12407 (_ BitVec 32) (_ BitVec 64)) Unit!7837)

(assert (=> b!254024 (= lt!127177 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6843 thiss!1504) index!297 key!932))))

(assert (=> b!254024 (arrayNoDuplicates!0 lt!127186 #b00000000000000000000000000000000 Nil!3734)))

(assert (=> b!254024 (= lt!127186 (array!12408 (store (arr!5878 (_keys!6843 thiss!1504)) index!297 key!932) (size!6226 (_keys!6843 thiss!1504))))))

(declare-fun lt!127180 () Unit!7837)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12407 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3737) Unit!7837)

(assert (=> b!254024 (= lt!127180 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6843 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3734))))

(declare-fun lt!127176 () Unit!7837)

(assert (=> b!254024 (= lt!127176 e!164643)))

(declare-fun c!42838 () Bool)

(assert (=> b!254024 (= c!42838 (arrayContainsKey!0 (_keys!6843 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254025 () Bool)

(declare-fun Unit!7841 () Unit!7837)

(assert (=> b!254025 (= e!164640 Unit!7841)))

(declare-fun lt!127179 () Unit!7837)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!414 (array!12407 array!12405 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 64) Int) Unit!7837)

(assert (=> b!254025 (= lt!127179 (lemmaInListMapThenSeekEntryOrOpenFindsIt!414 (_keys!6843 thiss!1504) (_values!4673 thiss!1504) (mask!10933 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) key!932 (defaultEntry!4690 thiss!1504)))))

(assert (=> b!254025 false))

(declare-fun b!254026 () Bool)

(declare-fun e!164638 () Bool)

(assert (=> b!254026 (= e!164638 tp_is_empty!6541)))

(declare-fun b!254027 () Bool)

(assert (=> b!254027 (= e!164637 e!164647)))

(declare-fun res!124333 () Bool)

(declare-fun call!23958 () Bool)

(assert (=> b!254027 (= res!124333 call!23958)))

(assert (=> b!254027 (=> (not res!124333) (not e!164647))))

(declare-fun b!254028 () Bool)

(declare-fun res!124331 () Bool)

(assert (=> b!254028 (=> (not res!124331) (not e!164651))))

(assert (=> b!254028 (= res!124331 call!23958)))

(assert (=> b!254028 (= e!164644 e!164651)))

(declare-fun b!254029 () Bool)

(declare-fun res!124336 () Bool)

(assert (=> b!254029 (=> res!124336 e!164646)))

(assert (=> b!254029 (= res!124336 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6843 thiss!1504) (mask!10933 thiss!1504))))))

(declare-fun b!254030 () Bool)

(declare-fun c!42837 () Bool)

(assert (=> b!254030 (= c!42837 ((_ is MissingVacant!1142) lt!127185))))

(assert (=> b!254030 (= e!164644 e!164637)))

(declare-fun bm!23956 () Bool)

(assert (=> bm!23956 (= call!23958 (inRange!0 (ite c!42839 (index!6738 lt!127185) (index!6741 lt!127185)) (mask!10933 thiss!1504)))))

(declare-fun b!254031 () Bool)

(declare-fun mapRes!11127 () Bool)

(assert (=> b!254031 (= e!164645 (and e!164641 mapRes!11127))))

(declare-fun condMapEmpty!11127 () Bool)

(declare-fun mapDefault!11127 () ValueCell!2927)

(assert (=> b!254031 (= condMapEmpty!11127 (= (arr!5877 (_values!4673 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2927)) mapDefault!11127)))))

(declare-fun mapNonEmpty!11127 () Bool)

(declare-fun tp!23324 () Bool)

(assert (=> mapNonEmpty!11127 (= mapRes!11127 (and tp!23324 e!164638))))

(declare-fun mapRest!11127 () (Array (_ BitVec 32) ValueCell!2927))

(declare-fun mapKey!11127 () (_ BitVec 32))

(declare-fun mapValue!11127 () ValueCell!2927)

(assert (=> mapNonEmpty!11127 (= (arr!5877 (_values!4673 thiss!1504)) (store mapRest!11127 mapKey!11127 mapValue!11127))))

(declare-fun mapIsEmpty!11127 () Bool)

(assert (=> mapIsEmpty!11127 mapRes!11127))

(assert (= (and start!24282 res!124334) b!254009))

(assert (= (and b!254009 res!124339) b!254016))

(assert (= (and b!254016 res!124337) b!254012))

(assert (= (and b!254012 c!42840) b!254025))

(assert (= (and b!254012 (not c!42840)) b!254011))

(assert (= (and b!254011 c!42839) b!254028))

(assert (= (and b!254011 (not c!42839)) b!254030))

(assert (= (and b!254028 res!124331) b!254022))

(assert (= (and b!254022 res!124332) b!254014))

(assert (= (and b!254030 c!42837) b!254027))

(assert (= (and b!254030 (not c!42837)) b!254020))

(assert (= (and b!254027 res!124333) b!254013))

(assert (= (and b!254013 res!124329) b!254015))

(assert (= (or b!254028 b!254027) bm!23956))

(assert (= (or b!254014 b!254015) bm!23955))

(assert (= (and b!254012 res!124330) b!254024))

(assert (= (and b!254024 c!42838) b!254018))

(assert (= (and b!254024 (not c!42838)) b!254021))

(assert (= (and b!254024 (not res!124338)) b!254019))

(assert (= (and b!254019 (not res!124335)) b!254029))

(assert (= (and b!254029 (not res!124336)) b!254010))

(assert (= (and b!254031 condMapEmpty!11127) mapIsEmpty!11127))

(assert (= (and b!254031 (not condMapEmpty!11127)) mapNonEmpty!11127))

(assert (= (and mapNonEmpty!11127 ((_ is ValueCellFull!2927) mapValue!11127)) b!254026))

(assert (= (and b!254031 ((_ is ValueCellFull!2927) mapDefault!11127)) b!254023))

(assert (= b!254017 b!254031))

(assert (= start!24282 b!254017))

(declare-fun m!269177 () Bool)

(assert (=> b!254025 m!269177))

(declare-fun m!269179 () Bool)

(assert (=> mapNonEmpty!11127 m!269179))

(declare-fun m!269181 () Bool)

(assert (=> b!254010 m!269181))

(declare-fun m!269183 () Bool)

(assert (=> b!254017 m!269183))

(declare-fun m!269185 () Bool)

(assert (=> b!254017 m!269185))

(declare-fun m!269187 () Bool)

(assert (=> b!254016 m!269187))

(declare-fun m!269189 () Bool)

(assert (=> b!254022 m!269189))

(declare-fun m!269191 () Bool)

(assert (=> b!254013 m!269191))

(declare-fun m!269193 () Bool)

(assert (=> b!254024 m!269193))

(declare-fun m!269195 () Bool)

(assert (=> b!254024 m!269195))

(declare-fun m!269197 () Bool)

(assert (=> b!254024 m!269197))

(declare-fun m!269199 () Bool)

(assert (=> b!254024 m!269199))

(declare-fun m!269201 () Bool)

(assert (=> b!254024 m!269201))

(declare-fun m!269203 () Bool)

(assert (=> b!254024 m!269203))

(declare-fun m!269205 () Bool)

(assert (=> b!254024 m!269205))

(declare-fun m!269207 () Bool)

(assert (=> b!254024 m!269207))

(declare-fun m!269209 () Bool)

(assert (=> b!254024 m!269209))

(declare-fun m!269211 () Bool)

(assert (=> b!254024 m!269211))

(declare-fun m!269213 () Bool)

(assert (=> bm!23956 m!269213))

(declare-fun m!269215 () Bool)

(assert (=> b!254018 m!269215))

(declare-fun m!269217 () Bool)

(assert (=> b!254029 m!269217))

(assert (=> bm!23955 m!269195))

(declare-fun m!269219 () Bool)

(assert (=> start!24282 m!269219))

(declare-fun m!269221 () Bool)

(assert (=> b!254011 m!269221))

(declare-fun m!269223 () Bool)

(assert (=> b!254012 m!269223))

(declare-fun m!269225 () Bool)

(assert (=> b!254012 m!269225))

(assert (=> b!254012 m!269225))

(declare-fun m!269227 () Bool)

(assert (=> b!254012 m!269227))

(check-sat (not mapNonEmpty!11127) (not b!254018) (not b!254029) b_and!13695 (not start!24282) (not b!254012) (not bm!23956) (not b!254017) (not b_next!6679) (not b!254010) (not b!254024) (not b!254016) (not b!254011) tp_is_empty!6541 (not bm!23955) (not b!254025))
(check-sat b_and!13695 (not b_next!6679))
