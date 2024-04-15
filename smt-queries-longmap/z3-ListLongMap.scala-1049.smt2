; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21980 () Bool)

(assert start!21980)

(declare-fun b!225150 () Bool)

(declare-fun b_free!6043 () Bool)

(declare-fun b_next!6043 () Bool)

(assert (=> b!225150 (= b_free!6043 (not b_next!6043))))

(declare-fun tp!21271 () Bool)

(declare-fun b_and!12915 () Bool)

(assert (=> b!225150 (= tp!21271 b_and!12915)))

(declare-fun bm!20936 () Bool)

(declare-datatypes ((V!7521 0))(
  ( (V!7522 (val!2997 Int)) )
))
(declare-datatypes ((ValueCell!2609 0))(
  ( (ValueCellFull!2609 (v!5011 V!7521)) (EmptyCell!2609) )
))
(declare-datatypes ((array!11045 0))(
  ( (array!11046 (arr!5241 (Array (_ BitVec 32) ValueCell!2609)) (size!5575 (_ BitVec 32))) )
))
(declare-datatypes ((array!11047 0))(
  ( (array!11048 (arr!5242 (Array (_ BitVec 32) (_ BitVec 64))) (size!5576 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3118 0))(
  ( (LongMapFixedSize!3119 (defaultEntry!4218 Int) (mask!10059 (_ BitVec 32)) (extraKeys!3955 (_ BitVec 32)) (zeroValue!4059 V!7521) (minValue!4059 V!7521) (_size!1608 (_ BitVec 32)) (_keys!6271 array!11047) (_values!4201 array!11045) (_vacant!1608 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3118)

(declare-fun c!37328 () Bool)

(declare-datatypes ((SeekEntryResult!865 0))(
  ( (MissingZero!865 (index!5630 (_ BitVec 32))) (Found!865 (index!5631 (_ BitVec 32))) (Intermediate!865 (undefined!1677 Bool) (index!5632 (_ BitVec 32)) (x!23172 (_ BitVec 32))) (Undefined!865) (MissingVacant!865 (index!5633 (_ BitVec 32))) )
))
(declare-fun lt!113296 () SeekEntryResult!865)

(declare-fun call!20939 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20936 (= call!20939 (inRange!0 (ite c!37328 (index!5630 lt!113296) (index!5633 lt!113296)) (mask!10059 thiss!1504)))))

(declare-fun b!225131 () Bool)

(declare-fun res!110778 () Bool)

(declare-fun e!146133 () Bool)

(assert (=> b!225131 (=> (not res!110778) (not e!146133))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!225131 (= res!110778 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225132 () Bool)

(declare-fun c!37330 () Bool)

(get-info :version)

(assert (=> b!225132 (= c!37330 ((_ is MissingVacant!865) lt!113296))))

(declare-fun e!146128 () Bool)

(declare-fun e!146119 () Bool)

(assert (=> b!225132 (= e!146128 e!146119)))

(declare-fun b!225133 () Bool)

(declare-fun res!110774 () Bool)

(declare-fun e!146127 () Bool)

(assert (=> b!225133 (=> (not res!110774) (not e!146127))))

(assert (=> b!225133 (= res!110774 call!20939)))

(assert (=> b!225133 (= e!146128 e!146127)))

(declare-fun mapIsEmpty!10027 () Bool)

(declare-fun mapRes!10027 () Bool)

(assert (=> mapIsEmpty!10027 mapRes!10027))

(declare-fun b!225134 () Bool)

(declare-fun e!146125 () Bool)

(declare-fun call!20940 () Bool)

(assert (=> b!225134 (= e!146125 (not call!20940))))

(declare-fun b!225135 () Bool)

(declare-datatypes ((Unit!6738 0))(
  ( (Unit!6739) )
))
(declare-fun e!146126 () Unit!6738)

(declare-fun Unit!6740 () Unit!6738)

(assert (=> b!225135 (= e!146126 Unit!6740)))

(declare-fun lt!113292 () Unit!6738)

(declare-fun lemmaArrayContainsKeyThenInListMap!84 (array!11047 array!11045 (_ BitVec 32) (_ BitVec 32) V!7521 V!7521 (_ BitVec 64) (_ BitVec 32) Int) Unit!6738)

(assert (=> b!225135 (= lt!113292 (lemmaArrayContainsKeyThenInListMap!84 (_keys!6271 thiss!1504) (_values!4201 thiss!1504) (mask!10059 thiss!1504) (extraKeys!3955 thiss!1504) (zeroValue!4059 thiss!1504) (minValue!4059 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4218 thiss!1504)))))

(assert (=> b!225135 false))

(declare-fun b!225136 () Bool)

(declare-fun res!110768 () Bool)

(declare-fun e!146122 () Bool)

(assert (=> b!225136 (=> res!110768 e!146122)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225136 (= res!110768 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225137 () Bool)

(assert (=> b!225137 (= e!146122 true)))

(declare-fun lt!113298 () Bool)

(declare-datatypes ((List!3335 0))(
  ( (Nil!3332) (Cons!3331 (h!3979 (_ BitVec 64)) (t!8285 List!3335)) )
))
(declare-fun arrayNoDuplicates!0 (array!11047 (_ BitVec 32) List!3335) Bool)

(assert (=> b!225137 (= lt!113298 (arrayNoDuplicates!0 (_keys!6271 thiss!1504) #b00000000000000000000000000000000 Nil!3332))))

(declare-fun res!110771 () Bool)

(assert (=> start!21980 (=> (not res!110771) (not e!146133))))

(declare-fun valid!1267 (LongMapFixedSize!3118) Bool)

(assert (=> start!21980 (= res!110771 (valid!1267 thiss!1504))))

(assert (=> start!21980 e!146133))

(declare-fun e!146131 () Bool)

(assert (=> start!21980 e!146131))

(assert (=> start!21980 true))

(declare-fun b!225130 () Bool)

(declare-fun e!146130 () Bool)

(assert (=> b!225130 (= e!146133 e!146130)))

(declare-fun res!110773 () Bool)

(assert (=> b!225130 (=> (not res!110773) (not e!146130))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225130 (= res!110773 (or (= lt!113296 (MissingZero!865 index!297)) (= lt!113296 (MissingVacant!865 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11047 (_ BitVec 32)) SeekEntryResult!865)

(assert (=> b!225130 (= lt!113296 (seekEntryOrOpen!0 key!932 (_keys!6271 thiss!1504) (mask!10059 thiss!1504)))))

(declare-fun b!225138 () Bool)

(declare-fun e!146129 () Unit!6738)

(declare-fun Unit!6741 () Unit!6738)

(assert (=> b!225138 (= e!146129 Unit!6741)))

(declare-fun lt!113299 () Unit!6738)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!240 (array!11047 array!11045 (_ BitVec 32) (_ BitVec 32) V!7521 V!7521 (_ BitVec 64) Int) Unit!6738)

(assert (=> b!225138 (= lt!113299 (lemmaInListMapThenSeekEntryOrOpenFindsIt!240 (_keys!6271 thiss!1504) (_values!4201 thiss!1504) (mask!10059 thiss!1504) (extraKeys!3955 thiss!1504) (zeroValue!4059 thiss!1504) (minValue!4059 thiss!1504) key!932 (defaultEntry!4218 thiss!1504)))))

(assert (=> b!225138 false))

(declare-fun b!225139 () Bool)

(declare-fun e!146120 () Bool)

(assert (=> b!225139 (= e!146120 (not e!146122))))

(declare-fun res!110777 () Bool)

(assert (=> b!225139 (=> res!110777 e!146122)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225139 (= res!110777 (not (validMask!0 (mask!10059 thiss!1504))))))

(declare-fun lt!113295 () array!11047)

(declare-fun arrayCountValidKeys!0 (array!11047 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225139 (= (arrayCountValidKeys!0 lt!113295 #b00000000000000000000000000000000 (size!5576 (_keys!6271 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6271 thiss!1504) #b00000000000000000000000000000000 (size!5576 (_keys!6271 thiss!1504)))))))

(declare-fun lt!113301 () Unit!6738)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11047 (_ BitVec 32) (_ BitVec 64)) Unit!6738)

(assert (=> b!225139 (= lt!113301 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6271 thiss!1504) index!297 key!932))))

(assert (=> b!225139 (arrayNoDuplicates!0 lt!113295 #b00000000000000000000000000000000 Nil!3332)))

(assert (=> b!225139 (= lt!113295 (array!11048 (store (arr!5242 (_keys!6271 thiss!1504)) index!297 key!932) (size!5576 (_keys!6271 thiss!1504))))))

(declare-fun lt!113297 () Unit!6738)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11047 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3335) Unit!6738)

(assert (=> b!225139 (= lt!113297 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6271 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3332))))

(declare-fun lt!113293 () Unit!6738)

(assert (=> b!225139 (= lt!113293 e!146126)))

(declare-fun c!37329 () Bool)

(declare-fun lt!113300 () Bool)

(assert (=> b!225139 (= c!37329 lt!113300)))

(declare-fun arrayContainsKey!0 (array!11047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225139 (= lt!113300 (arrayContainsKey!0 (_keys!6271 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225140 () Bool)

(declare-fun e!146132 () Bool)

(declare-fun e!146121 () Bool)

(assert (=> b!225140 (= e!146132 (and e!146121 mapRes!10027))))

(declare-fun condMapEmpty!10027 () Bool)

(declare-fun mapDefault!10027 () ValueCell!2609)

(assert (=> b!225140 (= condMapEmpty!10027 (= (arr!5241 (_values!4201 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2609)) mapDefault!10027)))))

(declare-fun b!225141 () Bool)

(assert (=> b!225141 (= e!146119 e!146125)))

(declare-fun res!110780 () Bool)

(assert (=> b!225141 (= res!110780 call!20939)))

(assert (=> b!225141 (=> (not res!110780) (not e!146125))))

(declare-fun b!225142 () Bool)

(declare-fun res!110779 () Bool)

(assert (=> b!225142 (=> res!110779 e!146122)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11047 (_ BitVec 32)) Bool)

(assert (=> b!225142 (= res!110779 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6271 thiss!1504) (mask!10059 thiss!1504))))))

(declare-fun b!225143 () Bool)

(assert (=> b!225143 (= e!146127 (not call!20940))))

(declare-fun bm!20937 () Bool)

(assert (=> bm!20937 (= call!20940 (arrayContainsKey!0 (_keys!6271 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225144 () Bool)

(declare-fun Unit!6742 () Unit!6738)

(assert (=> b!225144 (= e!146126 Unit!6742)))

(declare-fun b!225145 () Bool)

(assert (=> b!225145 (= e!146130 e!146120)))

(declare-fun res!110769 () Bool)

(assert (=> b!225145 (=> (not res!110769) (not e!146120))))

(assert (=> b!225145 (= res!110769 (inRange!0 index!297 (mask!10059 thiss!1504)))))

(declare-fun lt!113294 () Unit!6738)

(assert (=> b!225145 (= lt!113294 e!146129)))

(declare-fun c!37327 () Bool)

(declare-datatypes ((tuple2!4406 0))(
  ( (tuple2!4407 (_1!2214 (_ BitVec 64)) (_2!2214 V!7521)) )
))
(declare-datatypes ((List!3336 0))(
  ( (Nil!3333) (Cons!3332 (h!3980 tuple2!4406) (t!8286 List!3336)) )
))
(declare-datatypes ((ListLongMap!3309 0))(
  ( (ListLongMap!3310 (toList!1670 List!3336)) )
))
(declare-fun contains!1545 (ListLongMap!3309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1179 (array!11047 array!11045 (_ BitVec 32) (_ BitVec 32) V!7521 V!7521 (_ BitVec 32) Int) ListLongMap!3309)

(assert (=> b!225145 (= c!37327 (contains!1545 (getCurrentListMap!1179 (_keys!6271 thiss!1504) (_values!4201 thiss!1504) (mask!10059 thiss!1504) (extraKeys!3955 thiss!1504) (zeroValue!4059 thiss!1504) (minValue!4059 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4218 thiss!1504)) key!932))))

(declare-fun b!225146 () Bool)

(declare-fun res!110776 () Bool)

(assert (=> b!225146 (= res!110776 (= (select (arr!5242 (_keys!6271 thiss!1504)) (index!5633 lt!113296)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!225146 (=> (not res!110776) (not e!146125))))

(declare-fun b!225147 () Bool)

(declare-fun res!110770 () Bool)

(assert (=> b!225147 (=> res!110770 e!146122)))

(assert (=> b!225147 (= res!110770 (or (not (= (size!5576 (_keys!6271 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10059 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5576 (_keys!6271 thiss!1504)))))))

(declare-fun mapNonEmpty!10027 () Bool)

(declare-fun tp!21270 () Bool)

(declare-fun e!146124 () Bool)

(assert (=> mapNonEmpty!10027 (= mapRes!10027 (and tp!21270 e!146124))))

(declare-fun mapValue!10027 () ValueCell!2609)

(declare-fun mapRest!10027 () (Array (_ BitVec 32) ValueCell!2609))

(declare-fun mapKey!10027 () (_ BitVec 32))

(assert (=> mapNonEmpty!10027 (= (arr!5241 (_values!4201 thiss!1504)) (store mapRest!10027 mapKey!10027 mapValue!10027))))

(declare-fun b!225148 () Bool)

(declare-fun tp_is_empty!5905 () Bool)

(assert (=> b!225148 (= e!146121 tp_is_empty!5905)))

(declare-fun b!225149 () Bool)

(declare-fun res!110772 () Bool)

(assert (=> b!225149 (=> res!110772 e!146122)))

(assert (=> b!225149 (= res!110772 lt!113300)))

(declare-fun array_inv!3457 (array!11047) Bool)

(declare-fun array_inv!3458 (array!11045) Bool)

(assert (=> b!225150 (= e!146131 (and tp!21271 tp_is_empty!5905 (array_inv!3457 (_keys!6271 thiss!1504)) (array_inv!3458 (_values!4201 thiss!1504)) e!146132))))

(declare-fun b!225151 () Bool)

(assert (=> b!225151 (= e!146119 ((_ is Undefined!865) lt!113296))))

(declare-fun b!225152 () Bool)

(assert (=> b!225152 (= e!146124 tp_is_empty!5905)))

(declare-fun b!225153 () Bool)

(declare-fun res!110775 () Bool)

(assert (=> b!225153 (=> (not res!110775) (not e!146127))))

(assert (=> b!225153 (= res!110775 (= (select (arr!5242 (_keys!6271 thiss!1504)) (index!5630 lt!113296)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225154 () Bool)

(declare-fun lt!113302 () Unit!6738)

(assert (=> b!225154 (= e!146129 lt!113302)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!239 (array!11047 array!11045 (_ BitVec 32) (_ BitVec 32) V!7521 V!7521 (_ BitVec 64) Int) Unit!6738)

(assert (=> b!225154 (= lt!113302 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!239 (_keys!6271 thiss!1504) (_values!4201 thiss!1504) (mask!10059 thiss!1504) (extraKeys!3955 thiss!1504) (zeroValue!4059 thiss!1504) (minValue!4059 thiss!1504) key!932 (defaultEntry!4218 thiss!1504)))))

(assert (=> b!225154 (= c!37328 ((_ is MissingZero!865) lt!113296))))

(assert (=> b!225154 e!146128))

(assert (= (and start!21980 res!110771) b!225131))

(assert (= (and b!225131 res!110778) b!225130))

(assert (= (and b!225130 res!110773) b!225145))

(assert (= (and b!225145 c!37327) b!225138))

(assert (= (and b!225145 (not c!37327)) b!225154))

(assert (= (and b!225154 c!37328) b!225133))

(assert (= (and b!225154 (not c!37328)) b!225132))

(assert (= (and b!225133 res!110774) b!225153))

(assert (= (and b!225153 res!110775) b!225143))

(assert (= (and b!225132 c!37330) b!225141))

(assert (= (and b!225132 (not c!37330)) b!225151))

(assert (= (and b!225141 res!110780) b!225146))

(assert (= (and b!225146 res!110776) b!225134))

(assert (= (or b!225133 b!225141) bm!20936))

(assert (= (or b!225143 b!225134) bm!20937))

(assert (= (and b!225145 res!110769) b!225139))

(assert (= (and b!225139 c!37329) b!225135))

(assert (= (and b!225139 (not c!37329)) b!225144))

(assert (= (and b!225139 (not res!110777)) b!225147))

(assert (= (and b!225147 (not res!110770)) b!225136))

(assert (= (and b!225136 (not res!110768)) b!225149))

(assert (= (and b!225149 (not res!110772)) b!225142))

(assert (= (and b!225142 (not res!110779)) b!225137))

(assert (= (and b!225140 condMapEmpty!10027) mapIsEmpty!10027))

(assert (= (and b!225140 (not condMapEmpty!10027)) mapNonEmpty!10027))

(assert (= (and mapNonEmpty!10027 ((_ is ValueCellFull!2609) mapValue!10027)) b!225152))

(assert (= (and b!225140 ((_ is ValueCellFull!2609) mapDefault!10027)) b!225148))

(assert (= b!225150 b!225140))

(assert (= start!21980 b!225150))

(declare-fun m!247333 () Bool)

(assert (=> b!225136 m!247333))

(declare-fun m!247335 () Bool)

(assert (=> b!225146 m!247335))

(declare-fun m!247337 () Bool)

(assert (=> bm!20937 m!247337))

(declare-fun m!247339 () Bool)

(assert (=> b!225137 m!247339))

(declare-fun m!247341 () Bool)

(assert (=> start!21980 m!247341))

(declare-fun m!247343 () Bool)

(assert (=> b!225150 m!247343))

(declare-fun m!247345 () Bool)

(assert (=> b!225150 m!247345))

(declare-fun m!247347 () Bool)

(assert (=> mapNonEmpty!10027 m!247347))

(declare-fun m!247349 () Bool)

(assert (=> b!225139 m!247349))

(assert (=> b!225139 m!247337))

(declare-fun m!247351 () Bool)

(assert (=> b!225139 m!247351))

(declare-fun m!247353 () Bool)

(assert (=> b!225139 m!247353))

(declare-fun m!247355 () Bool)

(assert (=> b!225139 m!247355))

(declare-fun m!247357 () Bool)

(assert (=> b!225139 m!247357))

(declare-fun m!247359 () Bool)

(assert (=> b!225139 m!247359))

(declare-fun m!247361 () Bool)

(assert (=> b!225139 m!247361))

(declare-fun m!247363 () Bool)

(assert (=> b!225138 m!247363))

(declare-fun m!247365 () Bool)

(assert (=> b!225145 m!247365))

(declare-fun m!247367 () Bool)

(assert (=> b!225145 m!247367))

(assert (=> b!225145 m!247367))

(declare-fun m!247369 () Bool)

(assert (=> b!225145 m!247369))

(declare-fun m!247371 () Bool)

(assert (=> b!225154 m!247371))

(declare-fun m!247373 () Bool)

(assert (=> b!225135 m!247373))

(declare-fun m!247375 () Bool)

(assert (=> b!225153 m!247375))

(declare-fun m!247377 () Bool)

(assert (=> bm!20936 m!247377))

(declare-fun m!247379 () Bool)

(assert (=> b!225142 m!247379))

(declare-fun m!247381 () Bool)

(assert (=> b!225130 m!247381))

(check-sat (not mapNonEmpty!10027) (not b!225135) tp_is_empty!5905 (not b!225130) (not bm!20936) (not b!225142) (not b!225139) (not b!225137) (not b!225150) (not b_next!6043) b_and!12915 (not bm!20937) (not b!225145) (not b!225136) (not b!225138) (not b!225154) (not start!21980))
(check-sat b_and!12915 (not b_next!6043))
