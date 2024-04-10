; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24274 () Bool)

(assert start!24274)

(declare-fun b!254024 () Bool)

(declare-fun b_free!6675 () Bool)

(declare-fun b_next!6675 () Bool)

(assert (=> b!254024 (= b_free!6675 (not b_next!6675))))

(declare-fun tp!23312 () Bool)

(declare-fun b_and!13717 () Bool)

(assert (=> b!254024 (= tp!23312 b_and!13717)))

(declare-fun b!254006 () Bool)

(declare-fun c!42841 () Bool)

(declare-datatypes ((SeekEntryResult!1144 0))(
  ( (MissingZero!1144 (index!6746 (_ BitVec 32))) (Found!1144 (index!6747 (_ BitVec 32))) (Intermediate!1144 (undefined!1956 Bool) (index!6748 (_ BitVec 32)) (x!24844 (_ BitVec 32))) (Undefined!1144) (MissingVacant!1144 (index!6749 (_ BitVec 32))) )
))
(declare-fun lt!127291 () SeekEntryResult!1144)

(get-info :version)

(assert (=> b!254006 (= c!42841 ((_ is MissingVacant!1144) lt!127291))))

(declare-fun e!164660 () Bool)

(declare-fun e!164649 () Bool)

(assert (=> b!254006 (= e!164660 e!164649)))

(declare-fun b!254007 () Bool)

(declare-fun res!124350 () Bool)

(declare-fun e!164661 () Bool)

(assert (=> b!254007 (=> res!124350 e!164661)))

(declare-datatypes ((V!8363 0))(
  ( (V!8364 (val!3313 Int)) )
))
(declare-datatypes ((ValueCell!2925 0))(
  ( (ValueCellFull!2925 (v!5387 V!8363)) (EmptyCell!2925) )
))
(declare-datatypes ((array!12405 0))(
  ( (array!12406 (arr!5878 (Array (_ BitVec 32) ValueCell!2925)) (size!6225 (_ BitVec 32))) )
))
(declare-datatypes ((array!12407 0))(
  ( (array!12408 (arr!5879 (Array (_ BitVec 32) (_ BitVec 64))) (size!6226 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3750 0))(
  ( (LongMapFixedSize!3751 (defaultEntry!4688 Int) (mask!10930 (_ BitVec 32)) (extraKeys!4425 (_ BitVec 32)) (zeroValue!4529 V!8363) (minValue!4529 V!8363) (_size!1924 (_ BitVec 32)) (_keys!6842 array!12407) (_values!4671 array!12405) (_vacant!1924 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3750)

(assert (=> b!254007 (= res!124350 (or (not (= (size!6225 (_values!4671 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10930 thiss!1504)))) (not (= (size!6226 (_keys!6842 thiss!1504)) (size!6225 (_values!4671 thiss!1504)))) (bvslt (mask!10930 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4425 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4425 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!254008 () Bool)

(declare-datatypes ((Unit!7859 0))(
  ( (Unit!7860) )
))
(declare-fun e!164662 () Unit!7859)

(declare-fun Unit!7861 () Unit!7859)

(assert (=> b!254008 (= e!164662 Unit!7861)))

(declare-fun lt!127293 () Unit!7859)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!412 (array!12407 array!12405 (_ BitVec 32) (_ BitVec 32) V!8363 V!8363 (_ BitVec 64) Int) Unit!7859)

(assert (=> b!254008 (= lt!127293 (lemmaInListMapThenSeekEntryOrOpenFindsIt!412 (_keys!6842 thiss!1504) (_values!4671 thiss!1504) (mask!10930 thiss!1504) (extraKeys!4425 thiss!1504) (zeroValue!4529 thiss!1504) (minValue!4529 thiss!1504) key!932 (defaultEntry!4688 thiss!1504)))))

(assert (=> b!254008 false))

(declare-fun lt!127295 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun b!254009 () Bool)

(assert (=> b!254009 (= e!164661 (or (and (not (= (select (arr!5879 (_keys!6842 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5879 (_keys!6842 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000))) (not lt!127295)))))

(declare-fun b!254010 () Bool)

(declare-fun res!124349 () Bool)

(assert (=> b!254010 (=> res!124349 e!164661)))

(declare-datatypes ((List!3757 0))(
  ( (Nil!3754) (Cons!3753 (h!4415 (_ BitVec 64)) (t!8804 List!3757)) )
))
(declare-fun arrayNoDuplicates!0 (array!12407 (_ BitVec 32) List!3757) Bool)

(assert (=> b!254010 (= res!124349 (not (arrayNoDuplicates!0 (_keys!6842 thiss!1504) #b00000000000000000000000000000000 Nil!3754)))))

(declare-fun res!124357 () Bool)

(declare-fun e!164653 () Bool)

(assert (=> start!24274 (=> (not res!124357) (not e!164653))))

(declare-fun valid!1466 (LongMapFixedSize!3750) Bool)

(assert (=> start!24274 (= res!124357 (valid!1466 thiss!1504))))

(assert (=> start!24274 e!164653))

(declare-fun e!164658 () Bool)

(assert (=> start!24274 e!164658))

(assert (=> start!24274 true))

(declare-fun b!254011 () Bool)

(declare-fun lt!127300 () Unit!7859)

(assert (=> b!254011 (= e!164662 lt!127300)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!416 (array!12407 array!12405 (_ BitVec 32) (_ BitVec 32) V!8363 V!8363 (_ BitVec 64) Int) Unit!7859)

(assert (=> b!254011 (= lt!127300 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!416 (_keys!6842 thiss!1504) (_values!4671 thiss!1504) (mask!10930 thiss!1504) (extraKeys!4425 thiss!1504) (zeroValue!4529 thiss!1504) (minValue!4529 thiss!1504) key!932 (defaultEntry!4688 thiss!1504)))))

(declare-fun c!42840 () Bool)

(assert (=> b!254011 (= c!42840 ((_ is MissingZero!1144) lt!127291))))

(assert (=> b!254011 e!164660))

(declare-fun b!254012 () Bool)

(assert (=> b!254012 (= e!164649 ((_ is Undefined!1144) lt!127291))))

(declare-fun b!254013 () Bool)

(declare-fun e!164657 () Bool)

(assert (=> b!254013 (= e!164649 e!164657)))

(declare-fun res!124359 () Bool)

(declare-fun call!23970 () Bool)

(assert (=> b!254013 (= res!124359 call!23970)))

(assert (=> b!254013 (=> (not res!124359) (not e!164657))))

(declare-fun b!254014 () Bool)

(declare-fun e!164655 () Bool)

(declare-fun tp_is_empty!6537 () Bool)

(assert (=> b!254014 (= e!164655 tp_is_empty!6537)))

(declare-fun b!254015 () Bool)

(declare-fun call!23971 () Bool)

(assert (=> b!254015 (= e!164657 (not call!23971))))

(declare-fun mapIsEmpty!11121 () Bool)

(declare-fun mapRes!11121 () Bool)

(assert (=> mapIsEmpty!11121 mapRes!11121))

(declare-fun b!254016 () Bool)

(declare-fun res!124347 () Bool)

(declare-fun e!164650 () Bool)

(assert (=> b!254016 (=> (not res!124347) (not e!164650))))

(assert (=> b!254016 (= res!124347 call!23970)))

(assert (=> b!254016 (= e!164660 e!164650)))

(declare-fun b!254017 () Bool)

(assert (=> b!254017 (= e!164650 (not call!23971))))

(declare-fun b!254018 () Bool)

(declare-fun e!164648 () Bool)

(assert (=> b!254018 (= e!164648 (and e!164655 mapRes!11121))))

(declare-fun condMapEmpty!11121 () Bool)

(declare-fun mapDefault!11121 () ValueCell!2925)

(assert (=> b!254018 (= condMapEmpty!11121 (= (arr!5878 (_values!4671 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2925)) mapDefault!11121)))))

(declare-fun b!254019 () Bool)

(declare-fun e!164651 () Unit!7859)

(declare-fun Unit!7862 () Unit!7859)

(assert (=> b!254019 (= e!164651 Unit!7862)))

(declare-fun b!254020 () Bool)

(declare-fun res!124356 () Bool)

(assert (=> b!254020 (= res!124356 (= (select (arr!5879 (_keys!6842 thiss!1504)) (index!6749 lt!127291)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254020 (=> (not res!124356) (not e!164657))))

(declare-fun b!254021 () Bool)

(declare-fun e!164654 () Bool)

(assert (=> b!254021 (= e!164654 (not e!164661))))

(declare-fun res!124348 () Bool)

(assert (=> b!254021 (=> res!124348 e!164661)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254021 (= res!124348 (not (validMask!0 (mask!10930 thiss!1504))))))

(declare-fun lt!127298 () array!12407)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12407 (_ BitVec 32)) Bool)

(assert (=> b!254021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127298 (mask!10930 thiss!1504))))

(declare-fun lt!127292 () Unit!7859)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12407 (_ BitVec 32) (_ BitVec 32)) Unit!7859)

(assert (=> b!254021 (= lt!127292 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6842 thiss!1504) index!297 (mask!10930 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12407 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254021 (= (arrayCountValidKeys!0 lt!127298 #b00000000000000000000000000000000 (size!6226 (_keys!6842 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6842 thiss!1504) #b00000000000000000000000000000000 (size!6226 (_keys!6842 thiss!1504)))))))

(declare-fun lt!127296 () Unit!7859)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12407 (_ BitVec 32) (_ BitVec 64)) Unit!7859)

(assert (=> b!254021 (= lt!127296 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6842 thiss!1504) index!297 key!932))))

(assert (=> b!254021 (arrayNoDuplicates!0 lt!127298 #b00000000000000000000000000000000 Nil!3754)))

(assert (=> b!254021 (= lt!127298 (array!12408 (store (arr!5879 (_keys!6842 thiss!1504)) index!297 key!932) (size!6226 (_keys!6842 thiss!1504))))))

(declare-fun lt!127301 () Unit!7859)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12407 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3757) Unit!7859)

(assert (=> b!254021 (= lt!127301 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6842 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3754))))

(declare-fun lt!127294 () Unit!7859)

(assert (=> b!254021 (= lt!127294 e!164651)))

(declare-fun c!42842 () Bool)

(assert (=> b!254021 (= c!42842 lt!127295)))

(declare-fun arrayContainsKey!0 (array!12407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254021 (= lt!127295 (arrayContainsKey!0 (_keys!6842 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254022 () Bool)

(declare-fun res!124358 () Bool)

(assert (=> b!254022 (=> res!124358 e!164661)))

(assert (=> b!254022 (= res!124358 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6842 thiss!1504) (mask!10930 thiss!1504))))))

(declare-fun b!254023 () Bool)

(declare-fun res!124354 () Bool)

(assert (=> b!254023 (=> res!124354 e!164661)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!254023 (= res!124354 (not (validKeyInArray!0 key!932)))))

(declare-fun bm!23967 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23967 (= call!23970 (inRange!0 (ite c!42840 (index!6746 lt!127291) (index!6749 lt!127291)) (mask!10930 thiss!1504)))))

(declare-fun array_inv!3887 (array!12407) Bool)

(declare-fun array_inv!3888 (array!12405) Bool)

(assert (=> b!254024 (= e!164658 (and tp!23312 tp_is_empty!6537 (array_inv!3887 (_keys!6842 thiss!1504)) (array_inv!3888 (_values!4671 thiss!1504)) e!164648))))

(declare-fun b!254025 () Bool)

(declare-fun Unit!7863 () Unit!7859)

(assert (=> b!254025 (= e!164651 Unit!7863)))

(declare-fun lt!127297 () Unit!7859)

(declare-fun lemmaArrayContainsKeyThenInListMap!218 (array!12407 array!12405 (_ BitVec 32) (_ BitVec 32) V!8363 V!8363 (_ BitVec 64) (_ BitVec 32) Int) Unit!7859)

(assert (=> b!254025 (= lt!127297 (lemmaArrayContainsKeyThenInListMap!218 (_keys!6842 thiss!1504) (_values!4671 thiss!1504) (mask!10930 thiss!1504) (extraKeys!4425 thiss!1504) (zeroValue!4529 thiss!1504) (minValue!4529 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4688 thiss!1504)))))

(assert (=> b!254025 false))

(declare-fun b!254026 () Bool)

(declare-fun e!164659 () Bool)

(assert (=> b!254026 (= e!164659 tp_is_empty!6537)))

(declare-fun b!254027 () Bool)

(declare-fun res!124353 () Bool)

(assert (=> b!254027 (=> (not res!124353) (not e!164653))))

(assert (=> b!254027 (= res!124353 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254028 () Bool)

(declare-fun e!164652 () Bool)

(assert (=> b!254028 (= e!164652 e!164654)))

(declare-fun res!124351 () Bool)

(assert (=> b!254028 (=> (not res!124351) (not e!164654))))

(assert (=> b!254028 (= res!124351 (inRange!0 index!297 (mask!10930 thiss!1504)))))

(declare-fun lt!127299 () Unit!7859)

(assert (=> b!254028 (= lt!127299 e!164662)))

(declare-fun c!42839 () Bool)

(declare-datatypes ((tuple2!4876 0))(
  ( (tuple2!4877 (_1!2449 (_ BitVec 64)) (_2!2449 V!8363)) )
))
(declare-datatypes ((List!3758 0))(
  ( (Nil!3755) (Cons!3754 (h!4416 tuple2!4876) (t!8805 List!3758)) )
))
(declare-datatypes ((ListLongMap!3789 0))(
  ( (ListLongMap!3790 (toList!1910 List!3758)) )
))
(declare-fun contains!1840 (ListLongMap!3789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1438 (array!12407 array!12405 (_ BitVec 32) (_ BitVec 32) V!8363 V!8363 (_ BitVec 32) Int) ListLongMap!3789)

(assert (=> b!254028 (= c!42839 (contains!1840 (getCurrentListMap!1438 (_keys!6842 thiss!1504) (_values!4671 thiss!1504) (mask!10930 thiss!1504) (extraKeys!4425 thiss!1504) (zeroValue!4529 thiss!1504) (minValue!4529 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4688 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!11121 () Bool)

(declare-fun tp!23313 () Bool)

(assert (=> mapNonEmpty!11121 (= mapRes!11121 (and tp!23313 e!164659))))

(declare-fun mapKey!11121 () (_ BitVec 32))

(declare-fun mapRest!11121 () (Array (_ BitVec 32) ValueCell!2925))

(declare-fun mapValue!11121 () ValueCell!2925)

(assert (=> mapNonEmpty!11121 (= (arr!5878 (_values!4671 thiss!1504)) (store mapRest!11121 mapKey!11121 mapValue!11121))))

(declare-fun b!254029 () Bool)

(declare-fun res!124355 () Bool)

(assert (=> b!254029 (=> (not res!124355) (not e!164650))))

(assert (=> b!254029 (= res!124355 (= (select (arr!5879 (_keys!6842 thiss!1504)) (index!6746 lt!127291)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254030 () Bool)

(assert (=> b!254030 (= e!164653 e!164652)))

(declare-fun res!124352 () Bool)

(assert (=> b!254030 (=> (not res!124352) (not e!164652))))

(assert (=> b!254030 (= res!124352 (or (= lt!127291 (MissingZero!1144 index!297)) (= lt!127291 (MissingVacant!1144 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12407 (_ BitVec 32)) SeekEntryResult!1144)

(assert (=> b!254030 (= lt!127291 (seekEntryOrOpen!0 key!932 (_keys!6842 thiss!1504) (mask!10930 thiss!1504)))))

(declare-fun bm!23968 () Bool)

(assert (=> bm!23968 (= call!23971 (arrayContainsKey!0 (_keys!6842 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254031 () Bool)

(declare-fun res!124346 () Bool)

(assert (=> b!254031 (=> res!124346 e!164661)))

(assert (=> b!254031 (= res!124346 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6226 (_keys!6842 thiss!1504)))))))

(assert (= (and start!24274 res!124357) b!254027))

(assert (= (and b!254027 res!124353) b!254030))

(assert (= (and b!254030 res!124352) b!254028))

(assert (= (and b!254028 c!42839) b!254008))

(assert (= (and b!254028 (not c!42839)) b!254011))

(assert (= (and b!254011 c!42840) b!254016))

(assert (= (and b!254011 (not c!42840)) b!254006))

(assert (= (and b!254016 res!124347) b!254029))

(assert (= (and b!254029 res!124355) b!254017))

(assert (= (and b!254006 c!42841) b!254013))

(assert (= (and b!254006 (not c!42841)) b!254012))

(assert (= (and b!254013 res!124359) b!254020))

(assert (= (and b!254020 res!124356) b!254015))

(assert (= (or b!254016 b!254013) bm!23967))

(assert (= (or b!254017 b!254015) bm!23968))

(assert (= (and b!254028 res!124351) b!254021))

(assert (= (and b!254021 c!42842) b!254025))

(assert (= (and b!254021 (not c!42842)) b!254019))

(assert (= (and b!254021 (not res!124348)) b!254007))

(assert (= (and b!254007 (not res!124350)) b!254022))

(assert (= (and b!254022 (not res!124358)) b!254010))

(assert (= (and b!254010 (not res!124349)) b!254031))

(assert (= (and b!254031 (not res!124346)) b!254023))

(assert (= (and b!254023 (not res!124354)) b!254009))

(assert (= (and b!254018 condMapEmpty!11121) mapIsEmpty!11121))

(assert (= (and b!254018 (not condMapEmpty!11121)) mapNonEmpty!11121))

(assert (= (and mapNonEmpty!11121 ((_ is ValueCellFull!2925) mapValue!11121)) b!254026))

(assert (= (and b!254018 ((_ is ValueCellFull!2925) mapDefault!11121)) b!254014))

(assert (= b!254024 b!254018))

(assert (= start!24274 b!254024))

(declare-fun m!269681 () Bool)

(assert (=> b!254008 m!269681))

(declare-fun m!269683 () Bool)

(assert (=> b!254023 m!269683))

(declare-fun m!269685 () Bool)

(assert (=> b!254028 m!269685))

(declare-fun m!269687 () Bool)

(assert (=> b!254028 m!269687))

(assert (=> b!254028 m!269687))

(declare-fun m!269689 () Bool)

(assert (=> b!254028 m!269689))

(declare-fun m!269691 () Bool)

(assert (=> b!254024 m!269691))

(declare-fun m!269693 () Bool)

(assert (=> b!254024 m!269693))

(declare-fun m!269695 () Bool)

(assert (=> bm!23967 m!269695))

(declare-fun m!269697 () Bool)

(assert (=> b!254010 m!269697))

(declare-fun m!269699 () Bool)

(assert (=> b!254025 m!269699))

(declare-fun m!269701 () Bool)

(assert (=> b!254009 m!269701))

(declare-fun m!269703 () Bool)

(assert (=> b!254021 m!269703))

(declare-fun m!269705 () Bool)

(assert (=> b!254021 m!269705))

(declare-fun m!269707 () Bool)

(assert (=> b!254021 m!269707))

(declare-fun m!269709 () Bool)

(assert (=> b!254021 m!269709))

(declare-fun m!269711 () Bool)

(assert (=> b!254021 m!269711))

(declare-fun m!269713 () Bool)

(assert (=> b!254021 m!269713))

(declare-fun m!269715 () Bool)

(assert (=> b!254021 m!269715))

(declare-fun m!269717 () Bool)

(assert (=> b!254021 m!269717))

(declare-fun m!269719 () Bool)

(assert (=> b!254021 m!269719))

(declare-fun m!269721 () Bool)

(assert (=> b!254021 m!269721))

(declare-fun m!269723 () Bool)

(assert (=> start!24274 m!269723))

(declare-fun m!269725 () Bool)

(assert (=> b!254030 m!269725))

(declare-fun m!269727 () Bool)

(assert (=> b!254011 m!269727))

(declare-fun m!269729 () Bool)

(assert (=> b!254029 m!269729))

(declare-fun m!269731 () Bool)

(assert (=> b!254020 m!269731))

(assert (=> bm!23968 m!269705))

(declare-fun m!269733 () Bool)

(assert (=> b!254022 m!269733))

(declare-fun m!269735 () Bool)

(assert (=> mapNonEmpty!11121 m!269735))

(check-sat (not bm!23968) tp_is_empty!6537 (not start!24274) (not mapNonEmpty!11121) (not b!254008) (not b!254021) (not b!254023) (not b!254010) (not b!254030) (not b_next!6675) (not b!254024) (not b!254025) b_and!13717 (not bm!23967) (not b!254022) (not b!254028) (not b!254011))
(check-sat b_and!13717 (not b_next!6675))
