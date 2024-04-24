; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22088 () Bool)

(assert start!22088)

(declare-fun b!229182 () Bool)

(declare-fun b_free!6151 () Bool)

(declare-fun b_next!6151 () Bool)

(assert (=> b!229182 (= b_free!6151 (not b_next!6151))))

(declare-fun tp!21594 () Bool)

(declare-fun b_and!13063 () Bool)

(assert (=> b!229182 (= tp!21594 b_and!13063)))

(declare-fun b!229172 () Bool)

(declare-fun e!148680 () Bool)

(declare-fun call!21275 () Bool)

(assert (=> b!229172 (= e!148680 (not call!21275))))

(declare-fun b!229173 () Bool)

(declare-fun res!112792 () Bool)

(declare-datatypes ((V!7665 0))(
  ( (V!7666 (val!3051 Int)) )
))
(declare-datatypes ((ValueCell!2663 0))(
  ( (ValueCellFull!2663 (v!5072 V!7665)) (EmptyCell!2663) )
))
(declare-datatypes ((array!11267 0))(
  ( (array!11268 (arr!5353 (Array (_ BitVec 32) ValueCell!2663)) (size!5686 (_ BitVec 32))) )
))
(declare-datatypes ((array!11269 0))(
  ( (array!11270 (arr!5354 (Array (_ BitVec 32) (_ BitVec 64))) (size!5687 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3226 0))(
  ( (LongMapFixedSize!3227 (defaultEntry!4272 Int) (mask!10150 (_ BitVec 32)) (extraKeys!4009 (_ BitVec 32)) (zeroValue!4113 V!7665) (minValue!4113 V!7665) (_size!1662 (_ BitVec 32)) (_keys!6326 array!11269) (_values!4255 array!11267) (_vacant!1662 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3226)

(declare-datatypes ((SeekEntryResult!886 0))(
  ( (MissingZero!886 (index!5714 (_ BitVec 32))) (Found!886 (index!5715 (_ BitVec 32))) (Intermediate!886 (undefined!1698 Bool) (index!5716 (_ BitVec 32)) (x!23338 (_ BitVec 32))) (Undefined!886) (MissingVacant!886 (index!5717 (_ BitVec 32))) )
))
(declare-fun lt!115322 () SeekEntryResult!886)

(assert (=> b!229173 (= res!112792 (= (select (arr!5354 (_keys!6326 thiss!1504)) (index!5717 lt!115322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229173 (=> (not res!112792) (not e!148680))))

(declare-fun mapNonEmpty!10189 () Bool)

(declare-fun mapRes!10189 () Bool)

(declare-fun tp!21595 () Bool)

(declare-fun e!148679 () Bool)

(assert (=> mapNonEmpty!10189 (= mapRes!10189 (and tp!21595 e!148679))))

(declare-fun mapValue!10189 () ValueCell!2663)

(declare-fun mapRest!10189 () (Array (_ BitVec 32) ValueCell!2663))

(declare-fun mapKey!10189 () (_ BitVec 32))

(assert (=> mapNonEmpty!10189 (= (arr!5353 (_values!4255 thiss!1504)) (store mapRest!10189 mapKey!10189 mapValue!10189))))

(declare-fun bm!21272 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21272 (= call!21275 (arrayContainsKey!0 (_keys!6326 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229174 () Bool)

(declare-fun e!148685 () Bool)

(get-info :version)

(assert (=> b!229174 (= e!148685 ((_ is Undefined!886) lt!115322))))

(declare-fun b!229175 () Bool)

(declare-fun c!38014 () Bool)

(assert (=> b!229175 (= c!38014 ((_ is MissingVacant!886) lt!115322))))

(declare-fun e!148686 () Bool)

(assert (=> b!229175 (= e!148686 e!148685)))

(declare-fun b!229176 () Bool)

(declare-fun res!112797 () Bool)

(declare-fun e!148682 () Bool)

(assert (=> b!229176 (=> res!112797 e!148682)))

(assert (=> b!229176 (= res!112797 (or (not (= (size!5686 (_values!4255 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10150 thiss!1504)))) (not (= (size!5687 (_keys!6326 thiss!1504)) (size!5686 (_values!4255 thiss!1504)))) (bvslt (mask!10150 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4009 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4009 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229178 () Bool)

(declare-datatypes ((Unit!6959 0))(
  ( (Unit!6960) )
))
(declare-fun e!148674 () Unit!6959)

(declare-fun Unit!6961 () Unit!6959)

(assert (=> b!229178 (= e!148674 Unit!6961)))

(declare-fun lt!115324 () Unit!6959)

(declare-fun lemmaArrayContainsKeyThenInListMap!119 (array!11269 array!11267 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 64) (_ BitVec 32) Int) Unit!6959)

(assert (=> b!229178 (= lt!115324 (lemmaArrayContainsKeyThenInListMap!119 (_keys!6326 thiss!1504) (_values!4255 thiss!1504) (mask!10150 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4272 thiss!1504)))))

(assert (=> b!229178 false))

(declare-fun b!229179 () Bool)

(declare-fun e!148678 () Bool)

(declare-fun e!148675 () Bool)

(assert (=> b!229179 (= e!148678 e!148675)))

(declare-fun res!112793 () Bool)

(assert (=> b!229179 (=> (not res!112793) (not e!148675))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229179 (= res!112793 (inRange!0 index!297 (mask!10150 thiss!1504)))))

(declare-fun lt!115319 () Unit!6959)

(declare-fun e!148676 () Unit!6959)

(assert (=> b!229179 (= lt!115319 e!148676)))

(declare-fun c!38017 () Bool)

(declare-datatypes ((tuple2!4428 0))(
  ( (tuple2!4429 (_1!2225 (_ BitVec 64)) (_2!2225 V!7665)) )
))
(declare-datatypes ((List!3343 0))(
  ( (Nil!3340) (Cons!3339 (h!3987 tuple2!4428) (t!8294 List!3343)) )
))
(declare-datatypes ((ListLongMap!3343 0))(
  ( (ListLongMap!3344 (toList!1687 List!3343)) )
))
(declare-fun contains!1576 (ListLongMap!3343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1219 (array!11269 array!11267 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 32) Int) ListLongMap!3343)

(assert (=> b!229179 (= c!38017 (contains!1576 (getCurrentListMap!1219 (_keys!6326 thiss!1504) (_values!4255 thiss!1504) (mask!10150 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4272 thiss!1504)) key!932))))

(declare-fun b!229180 () Bool)

(declare-fun Unit!6962 () Unit!6959)

(assert (=> b!229180 (= e!148674 Unit!6962)))

(declare-fun mapIsEmpty!10189 () Bool)

(assert (=> mapIsEmpty!10189 mapRes!10189))

(declare-fun b!229181 () Bool)

(declare-fun res!112789 () Bool)

(assert (=> b!229181 (=> res!112789 e!148682)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11269 (_ BitVec 32)) Bool)

(assert (=> b!229181 (= res!112789 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6326 thiss!1504) (mask!10150 thiss!1504))))))

(declare-fun e!148684 () Bool)

(declare-fun tp_is_empty!6013 () Bool)

(declare-fun e!148683 () Bool)

(declare-fun array_inv!3517 (array!11269) Bool)

(declare-fun array_inv!3518 (array!11267) Bool)

(assert (=> b!229182 (= e!148683 (and tp!21594 tp_is_empty!6013 (array_inv!3517 (_keys!6326 thiss!1504)) (array_inv!3518 (_values!4255 thiss!1504)) e!148684))))

(declare-fun b!229183 () Bool)

(declare-fun e!148688 () Bool)

(assert (=> b!229183 (= e!148688 tp_is_empty!6013)))

(declare-fun b!229184 () Bool)

(declare-fun e!148677 () Bool)

(assert (=> b!229184 (= e!148677 (not call!21275))))

(declare-fun b!229185 () Bool)

(assert (=> b!229185 (= e!148682 true)))

(declare-fun lt!115321 () Bool)

(declare-datatypes ((List!3344 0))(
  ( (Nil!3341) (Cons!3340 (h!3988 (_ BitVec 64)) (t!8295 List!3344)) )
))
(declare-fun arrayNoDuplicates!0 (array!11269 (_ BitVec 32) List!3344) Bool)

(assert (=> b!229185 (= lt!115321 (arrayNoDuplicates!0 (_keys!6326 thiss!1504) #b00000000000000000000000000000000 Nil!3341))))

(declare-fun b!229186 () Bool)

(declare-fun Unit!6963 () Unit!6959)

(assert (=> b!229186 (= e!148676 Unit!6963)))

(declare-fun lt!115317 () Unit!6959)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!279 (array!11269 array!11267 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 64) Int) Unit!6959)

(assert (=> b!229186 (= lt!115317 (lemmaInListMapThenSeekEntryOrOpenFindsIt!279 (_keys!6326 thiss!1504) (_values!4255 thiss!1504) (mask!10150 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) key!932 (defaultEntry!4272 thiss!1504)))))

(assert (=> b!229186 false))

(declare-fun b!229187 () Bool)

(assert (=> b!229187 (= e!148685 e!148680)))

(declare-fun res!112790 () Bool)

(declare-fun call!21276 () Bool)

(assert (=> b!229187 (= res!112790 call!21276)))

(assert (=> b!229187 (=> (not res!112790) (not e!148680))))

(declare-fun b!229188 () Bool)

(assert (=> b!229188 (= e!148679 tp_is_empty!6013)))

(declare-fun b!229189 () Bool)

(declare-fun lt!115323 () Unit!6959)

(assert (=> b!229189 (= e!148676 lt!115323)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!272 (array!11269 array!11267 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 64) Int) Unit!6959)

(assert (=> b!229189 (= lt!115323 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!272 (_keys!6326 thiss!1504) (_values!4255 thiss!1504) (mask!10150 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) key!932 (defaultEntry!4272 thiss!1504)))))

(declare-fun c!38015 () Bool)

(assert (=> b!229189 (= c!38015 ((_ is MissingZero!886) lt!115322))))

(assert (=> b!229189 e!148686))

(declare-fun b!229190 () Bool)

(assert (=> b!229190 (= e!148675 (not e!148682))))

(declare-fun res!112795 () Bool)

(assert (=> b!229190 (=> res!112795 e!148682)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229190 (= res!112795 (not (validMask!0 (mask!10150 thiss!1504))))))

(declare-fun lt!115318 () array!11269)

(assert (=> b!229190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115318 (mask!10150 thiss!1504))))

(declare-fun lt!115315 () Unit!6959)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11269 (_ BitVec 32) (_ BitVec 32)) Unit!6959)

(assert (=> b!229190 (= lt!115315 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6326 thiss!1504) index!297 (mask!10150 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11269 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229190 (= (arrayCountValidKeys!0 lt!115318 #b00000000000000000000000000000000 (size!5687 (_keys!6326 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6326 thiss!1504) #b00000000000000000000000000000000 (size!5687 (_keys!6326 thiss!1504)))))))

(declare-fun lt!115320 () Unit!6959)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11269 (_ BitVec 32) (_ BitVec 64)) Unit!6959)

(assert (=> b!229190 (= lt!115320 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6326 thiss!1504) index!297 key!932))))

(assert (=> b!229190 (arrayNoDuplicates!0 lt!115318 #b00000000000000000000000000000000 Nil!3341)))

(assert (=> b!229190 (= lt!115318 (array!11270 (store (arr!5354 (_keys!6326 thiss!1504)) index!297 key!932) (size!5687 (_keys!6326 thiss!1504))))))

(declare-fun lt!115316 () Unit!6959)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3344) Unit!6959)

(assert (=> b!229190 (= lt!115316 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6326 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3341))))

(declare-fun lt!115314 () Unit!6959)

(assert (=> b!229190 (= lt!115314 e!148674)))

(declare-fun c!38016 () Bool)

(assert (=> b!229190 (= c!38016 (arrayContainsKey!0 (_keys!6326 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229191 () Bool)

(declare-fun res!112796 () Bool)

(assert (=> b!229191 (=> (not res!112796) (not e!148677))))

(assert (=> b!229191 (= res!112796 call!21276)))

(assert (=> b!229191 (= e!148686 e!148677)))

(declare-fun b!229177 () Bool)

(declare-fun res!112788 () Bool)

(assert (=> b!229177 (=> (not res!112788) (not e!148677))))

(assert (=> b!229177 (= res!112788 (= (select (arr!5354 (_keys!6326 thiss!1504)) (index!5714 lt!115322)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!112798 () Bool)

(declare-fun e!148681 () Bool)

(assert (=> start!22088 (=> (not res!112798) (not e!148681))))

(declare-fun valid!1297 (LongMapFixedSize!3226) Bool)

(assert (=> start!22088 (= res!112798 (valid!1297 thiss!1504))))

(assert (=> start!22088 e!148681))

(assert (=> start!22088 e!148683))

(assert (=> start!22088 true))

(declare-fun b!229192 () Bool)

(declare-fun res!112794 () Bool)

(assert (=> b!229192 (=> (not res!112794) (not e!148681))))

(assert (=> b!229192 (= res!112794 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21273 () Bool)

(assert (=> bm!21273 (= call!21276 (inRange!0 (ite c!38015 (index!5714 lt!115322) (index!5717 lt!115322)) (mask!10150 thiss!1504)))))

(declare-fun b!229193 () Bool)

(assert (=> b!229193 (= e!148681 e!148678)))

(declare-fun res!112791 () Bool)

(assert (=> b!229193 (=> (not res!112791) (not e!148678))))

(assert (=> b!229193 (= res!112791 (or (= lt!115322 (MissingZero!886 index!297)) (= lt!115322 (MissingVacant!886 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11269 (_ BitVec 32)) SeekEntryResult!886)

(assert (=> b!229193 (= lt!115322 (seekEntryOrOpen!0 key!932 (_keys!6326 thiss!1504) (mask!10150 thiss!1504)))))

(declare-fun b!229194 () Bool)

(assert (=> b!229194 (= e!148684 (and e!148688 mapRes!10189))))

(declare-fun condMapEmpty!10189 () Bool)

(declare-fun mapDefault!10189 () ValueCell!2663)

(assert (=> b!229194 (= condMapEmpty!10189 (= (arr!5353 (_values!4255 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2663)) mapDefault!10189)))))

(assert (= (and start!22088 res!112798) b!229192))

(assert (= (and b!229192 res!112794) b!229193))

(assert (= (and b!229193 res!112791) b!229179))

(assert (= (and b!229179 c!38017) b!229186))

(assert (= (and b!229179 (not c!38017)) b!229189))

(assert (= (and b!229189 c!38015) b!229191))

(assert (= (and b!229189 (not c!38015)) b!229175))

(assert (= (and b!229191 res!112796) b!229177))

(assert (= (and b!229177 res!112788) b!229184))

(assert (= (and b!229175 c!38014) b!229187))

(assert (= (and b!229175 (not c!38014)) b!229174))

(assert (= (and b!229187 res!112790) b!229173))

(assert (= (and b!229173 res!112792) b!229172))

(assert (= (or b!229191 b!229187) bm!21273))

(assert (= (or b!229184 b!229172) bm!21272))

(assert (= (and b!229179 res!112793) b!229190))

(assert (= (and b!229190 c!38016) b!229178))

(assert (= (and b!229190 (not c!38016)) b!229180))

(assert (= (and b!229190 (not res!112795)) b!229176))

(assert (= (and b!229176 (not res!112797)) b!229181))

(assert (= (and b!229181 (not res!112789)) b!229185))

(assert (= (and b!229194 condMapEmpty!10189) mapIsEmpty!10189))

(assert (= (and b!229194 (not condMapEmpty!10189)) mapNonEmpty!10189))

(assert (= (and mapNonEmpty!10189 ((_ is ValueCellFull!2663) mapValue!10189)) b!229188))

(assert (= (and b!229194 ((_ is ValueCellFull!2663) mapDefault!10189)) b!229183))

(assert (= b!229182 b!229194))

(assert (= start!22088 b!229182))

(declare-fun m!250897 () Bool)

(assert (=> b!229182 m!250897))

(declare-fun m!250899 () Bool)

(assert (=> b!229182 m!250899))

(declare-fun m!250901 () Bool)

(assert (=> b!229179 m!250901))

(declare-fun m!250903 () Bool)

(assert (=> b!229179 m!250903))

(assert (=> b!229179 m!250903))

(declare-fun m!250905 () Bool)

(assert (=> b!229179 m!250905))

(declare-fun m!250907 () Bool)

(assert (=> b!229189 m!250907))

(declare-fun m!250909 () Bool)

(assert (=> b!229185 m!250909))

(declare-fun m!250911 () Bool)

(assert (=> bm!21273 m!250911))

(declare-fun m!250913 () Bool)

(assert (=> b!229177 m!250913))

(declare-fun m!250915 () Bool)

(assert (=> b!229173 m!250915))

(declare-fun m!250917 () Bool)

(assert (=> mapNonEmpty!10189 m!250917))

(declare-fun m!250919 () Bool)

(assert (=> b!229178 m!250919))

(declare-fun m!250921 () Bool)

(assert (=> b!229193 m!250921))

(declare-fun m!250923 () Bool)

(assert (=> b!229186 m!250923))

(declare-fun m!250925 () Bool)

(assert (=> b!229181 m!250925))

(declare-fun m!250927 () Bool)

(assert (=> start!22088 m!250927))

(declare-fun m!250929 () Bool)

(assert (=> bm!21272 m!250929))

(declare-fun m!250931 () Bool)

(assert (=> b!229190 m!250931))

(assert (=> b!229190 m!250929))

(declare-fun m!250933 () Bool)

(assert (=> b!229190 m!250933))

(declare-fun m!250935 () Bool)

(assert (=> b!229190 m!250935))

(declare-fun m!250937 () Bool)

(assert (=> b!229190 m!250937))

(declare-fun m!250939 () Bool)

(assert (=> b!229190 m!250939))

(declare-fun m!250941 () Bool)

(assert (=> b!229190 m!250941))

(declare-fun m!250943 () Bool)

(assert (=> b!229190 m!250943))

(declare-fun m!250945 () Bool)

(assert (=> b!229190 m!250945))

(declare-fun m!250947 () Bool)

(assert (=> b!229190 m!250947))

(check-sat (not bm!21272) (not b!229185) (not mapNonEmpty!10189) b_and!13063 tp_is_empty!6013 (not bm!21273) (not b!229193) (not b_next!6151) (not start!22088) (not b!229190) (not b!229181) (not b!229179) (not b!229186) (not b!229189) (not b!229182) (not b!229178))
(check-sat b_and!13063 (not b_next!6151))
