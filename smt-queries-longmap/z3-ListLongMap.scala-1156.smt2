; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24286 () Bool)

(assert start!24286)

(declare-fun b!254432 () Bool)

(declare-fun b_free!6687 () Bool)

(declare-fun b_next!6687 () Bool)

(assert (=> b!254432 (= b_free!6687 (not b_next!6687))))

(declare-fun tp!23348 () Bool)

(declare-fun b_and!13729 () Bool)

(assert (=> b!254432 (= tp!23348 b_and!13729)))

(declare-fun e!164929 () Bool)

(declare-fun tp_is_empty!6549 () Bool)

(declare-fun e!164924 () Bool)

(declare-datatypes ((V!8379 0))(
  ( (V!8380 (val!3319 Int)) )
))
(declare-datatypes ((ValueCell!2931 0))(
  ( (ValueCellFull!2931 (v!5393 V!8379)) (EmptyCell!2931) )
))
(declare-datatypes ((array!12429 0))(
  ( (array!12430 (arr!5890 (Array (_ BitVec 32) ValueCell!2931)) (size!6237 (_ BitVec 32))) )
))
(declare-datatypes ((array!12431 0))(
  ( (array!12432 (arr!5891 (Array (_ BitVec 32) (_ BitVec 64))) (size!6238 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3762 0))(
  ( (LongMapFixedSize!3763 (defaultEntry!4694 Int) (mask!10940 (_ BitVec 32)) (extraKeys!4431 (_ BitVec 32)) (zeroValue!4535 V!8379) (minValue!4535 V!8379) (_size!1930 (_ BitVec 32)) (_keys!6848 array!12431) (_values!4677 array!12429) (_vacant!1930 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3762)

(declare-fun array_inv!3895 (array!12431) Bool)

(declare-fun array_inv!3896 (array!12429) Bool)

(assert (=> b!254432 (= e!164924 (and tp!23348 tp_is_empty!6549 (array_inv!3895 (_keys!6848 thiss!1504)) (array_inv!3896 (_values!4677 thiss!1504)) e!164929))))

(declare-fun b!254433 () Bool)

(declare-datatypes ((Unit!7883 0))(
  ( (Unit!7884) )
))
(declare-fun e!164923 () Unit!7883)

(declare-fun Unit!7885 () Unit!7883)

(assert (=> b!254433 (= e!164923 Unit!7885)))

(declare-fun lt!127494 () Unit!7883)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!417 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8379 V!8379 (_ BitVec 64) Int) Unit!7883)

(assert (=> b!254433 (= lt!127494 (lemmaInListMapThenSeekEntryOrOpenFindsIt!417 (_keys!6848 thiss!1504) (_values!4677 thiss!1504) (mask!10940 thiss!1504) (extraKeys!4431 thiss!1504) (zeroValue!4535 thiss!1504) (minValue!4535 thiss!1504) key!932 (defaultEntry!4694 thiss!1504)))))

(assert (=> b!254433 false))

(declare-fun b!254434 () Bool)

(declare-fun e!164925 () Bool)

(assert (=> b!254434 (= e!164925 true)))

(declare-fun lt!127490 () Bool)

(declare-datatypes ((List!3768 0))(
  ( (Nil!3765) (Cons!3764 (h!4426 (_ BitVec 64)) (t!8815 List!3768)) )
))
(declare-fun arrayNoDuplicates!0 (array!12431 (_ BitVec 32) List!3768) Bool)

(assert (=> b!254434 (= lt!127490 (arrayNoDuplicates!0 (_keys!6848 thiss!1504) #b00000000000000000000000000000000 Nil!3765))))

(declare-fun res!124556 () Bool)

(declare-fun e!164919 () Bool)

(assert (=> start!24286 (=> (not res!124556) (not e!164919))))

(declare-fun valid!1471 (LongMapFixedSize!3762) Bool)

(assert (=> start!24286 (= res!124556 (valid!1471 thiss!1504))))

(assert (=> start!24286 e!164919))

(assert (=> start!24286 e!164924))

(assert (=> start!24286 true))

(declare-fun b!254435 () Bool)

(declare-fun e!164920 () Bool)

(declare-fun call!24007 () Bool)

(assert (=> b!254435 (= e!164920 (not call!24007))))

(declare-fun b!254436 () Bool)

(declare-fun res!124559 () Bool)

(assert (=> b!254436 (=> res!124559 e!164925)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12431 (_ BitVec 32)) Bool)

(assert (=> b!254436 (= res!124559 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6848 thiss!1504) (mask!10940 thiss!1504))))))

(declare-fun b!254437 () Bool)

(declare-fun res!124562 () Bool)

(assert (=> b!254437 (=> (not res!124562) (not e!164920))))

(declare-fun call!24006 () Bool)

(assert (=> b!254437 (= res!124562 call!24006)))

(declare-fun e!164928 () Bool)

(assert (=> b!254437 (= e!164928 e!164920)))

(declare-fun b!254438 () Bool)

(declare-fun res!124566 () Bool)

(assert (=> b!254438 (=> res!124566 e!164925)))

(assert (=> b!254438 (= res!124566 (or (not (= (size!6237 (_values!4677 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10940 thiss!1504)))) (not (= (size!6238 (_keys!6848 thiss!1504)) (size!6237 (_values!4677 thiss!1504)))) (bvslt (mask!10940 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4431 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4431 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!254439 () Bool)

(declare-fun e!164918 () Bool)

(assert (=> b!254439 (= e!164918 (not call!24007))))

(declare-fun b!254440 () Bool)

(declare-fun e!164926 () Unit!7883)

(declare-fun Unit!7886 () Unit!7883)

(assert (=> b!254440 (= e!164926 Unit!7886)))

(declare-fun mapIsEmpty!11139 () Bool)

(declare-fun mapRes!11139 () Bool)

(assert (=> mapIsEmpty!11139 mapRes!11139))

(declare-fun mapNonEmpty!11139 () Bool)

(declare-fun tp!23349 () Bool)

(declare-fun e!164930 () Bool)

(assert (=> mapNonEmpty!11139 (= mapRes!11139 (and tp!23349 e!164930))))

(declare-fun mapRest!11139 () (Array (_ BitVec 32) ValueCell!2931))

(declare-fun mapValue!11139 () ValueCell!2931)

(declare-fun mapKey!11139 () (_ BitVec 32))

(assert (=> mapNonEmpty!11139 (= (arr!5890 (_values!4677 thiss!1504)) (store mapRest!11139 mapKey!11139 mapValue!11139))))

(declare-fun c!42914 () Bool)

(declare-fun bm!24003 () Bool)

(declare-datatypes ((SeekEntryResult!1149 0))(
  ( (MissingZero!1149 (index!6766 (_ BitVec 32))) (Found!1149 (index!6767 (_ BitVec 32))) (Intermediate!1149 (undefined!1961 Bool) (index!6768 (_ BitVec 32)) (x!24865 (_ BitVec 32))) (Undefined!1149) (MissingVacant!1149 (index!6769 (_ BitVec 32))) )
))
(declare-fun lt!127495 () SeekEntryResult!1149)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24003 (= call!24006 (inRange!0 (ite c!42914 (index!6766 lt!127495) (index!6769 lt!127495)) (mask!10940 thiss!1504)))))

(declare-fun b!254441 () Bool)

(declare-fun Unit!7887 () Unit!7883)

(assert (=> b!254441 (= e!164926 Unit!7887)))

(declare-fun lt!127491 () Unit!7883)

(declare-fun lemmaArrayContainsKeyThenInListMap!223 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8379 V!8379 (_ BitVec 64) (_ BitVec 32) Int) Unit!7883)

(assert (=> b!254441 (= lt!127491 (lemmaArrayContainsKeyThenInListMap!223 (_keys!6848 thiss!1504) (_values!4677 thiss!1504) (mask!10940 thiss!1504) (extraKeys!4431 thiss!1504) (zeroValue!4535 thiss!1504) (minValue!4535 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4694 thiss!1504)))))

(assert (=> b!254441 false))

(declare-fun b!254442 () Bool)

(declare-fun lt!127492 () Unit!7883)

(assert (=> b!254442 (= e!164923 lt!127492)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!420 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8379 V!8379 (_ BitVec 64) Int) Unit!7883)

(assert (=> b!254442 (= lt!127492 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!420 (_keys!6848 thiss!1504) (_values!4677 thiss!1504) (mask!10940 thiss!1504) (extraKeys!4431 thiss!1504) (zeroValue!4535 thiss!1504) (minValue!4535 thiss!1504) key!932 (defaultEntry!4694 thiss!1504)))))

(get-info :version)

(assert (=> b!254442 (= c!42914 ((_ is MissingZero!1149) lt!127495))))

(assert (=> b!254442 e!164928))

(declare-fun b!254443 () Bool)

(declare-fun e!164932 () Bool)

(assert (=> b!254443 (= e!164929 (and e!164932 mapRes!11139))))

(declare-fun condMapEmpty!11139 () Bool)

(declare-fun mapDefault!11139 () ValueCell!2931)

(assert (=> b!254443 (= condMapEmpty!11139 (= (arr!5890 (_values!4677 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2931)) mapDefault!11139)))))

(declare-fun b!254444 () Bool)

(declare-fun res!124565 () Bool)

(assert (=> b!254444 (= res!124565 (= (select (arr!5891 (_keys!6848 thiss!1504)) (index!6769 lt!127495)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254444 (=> (not res!124565) (not e!164918))))

(declare-fun b!254445 () Bool)

(declare-fun e!164922 () Bool)

(assert (=> b!254445 (= e!164919 e!164922)))

(declare-fun res!124561 () Bool)

(assert (=> b!254445 (=> (not res!124561) (not e!164922))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!254445 (= res!124561 (or (= lt!127495 (MissingZero!1149 index!297)) (= lt!127495 (MissingVacant!1149 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12431 (_ BitVec 32)) SeekEntryResult!1149)

(assert (=> b!254445 (= lt!127495 (seekEntryOrOpen!0 key!932 (_keys!6848 thiss!1504) (mask!10940 thiss!1504)))))

(declare-fun b!254446 () Bool)

(declare-fun e!164931 () Bool)

(assert (=> b!254446 (= e!164931 e!164918)))

(declare-fun res!124563 () Bool)

(assert (=> b!254446 (= res!124563 call!24006)))

(assert (=> b!254446 (=> (not res!124563) (not e!164918))))

(declare-fun b!254447 () Bool)

(declare-fun e!164921 () Bool)

(assert (=> b!254447 (= e!164922 e!164921)))

(declare-fun res!124558 () Bool)

(assert (=> b!254447 (=> (not res!124558) (not e!164921))))

(assert (=> b!254447 (= res!124558 (inRange!0 index!297 (mask!10940 thiss!1504)))))

(declare-fun lt!127498 () Unit!7883)

(assert (=> b!254447 (= lt!127498 e!164923)))

(declare-fun c!42913 () Bool)

(declare-datatypes ((tuple2!4886 0))(
  ( (tuple2!4887 (_1!2454 (_ BitVec 64)) (_2!2454 V!8379)) )
))
(declare-datatypes ((List!3769 0))(
  ( (Nil!3766) (Cons!3765 (h!4427 tuple2!4886) (t!8816 List!3769)) )
))
(declare-datatypes ((ListLongMap!3799 0))(
  ( (ListLongMap!3800 (toList!1915 List!3769)) )
))
(declare-fun contains!1845 (ListLongMap!3799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1443 (array!12431 array!12429 (_ BitVec 32) (_ BitVec 32) V!8379 V!8379 (_ BitVec 32) Int) ListLongMap!3799)

(assert (=> b!254447 (= c!42913 (contains!1845 (getCurrentListMap!1443 (_keys!6848 thiss!1504) (_values!4677 thiss!1504) (mask!10940 thiss!1504) (extraKeys!4431 thiss!1504) (zeroValue!4535 thiss!1504) (minValue!4535 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4694 thiss!1504)) key!932))))

(declare-fun b!254448 () Bool)

(declare-fun c!42912 () Bool)

(assert (=> b!254448 (= c!42912 ((_ is MissingVacant!1149) lt!127495))))

(assert (=> b!254448 (= e!164928 e!164931)))

(declare-fun b!254449 () Bool)

(declare-fun res!124557 () Bool)

(assert (=> b!254449 (=> (not res!124557) (not e!164919))))

(assert (=> b!254449 (= res!124557 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!24004 () Bool)

(declare-fun arrayContainsKey!0 (array!12431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24004 (= call!24007 (arrayContainsKey!0 (_keys!6848 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254450 () Bool)

(assert (=> b!254450 (= e!164921 (not e!164925))))

(declare-fun res!124564 () Bool)

(assert (=> b!254450 (=> res!124564 e!164925)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254450 (= res!124564 (not (validMask!0 (mask!10940 thiss!1504))))))

(declare-fun lt!127489 () array!12431)

(assert (=> b!254450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127489 (mask!10940 thiss!1504))))

(declare-fun lt!127499 () Unit!7883)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12431 (_ BitVec 32) (_ BitVec 32)) Unit!7883)

(assert (=> b!254450 (= lt!127499 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6848 thiss!1504) index!297 (mask!10940 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254450 (= (arrayCountValidKeys!0 lt!127489 #b00000000000000000000000000000000 (size!6238 (_keys!6848 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6848 thiss!1504) #b00000000000000000000000000000000 (size!6238 (_keys!6848 thiss!1504)))))))

(declare-fun lt!127497 () Unit!7883)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12431 (_ BitVec 32) (_ BitVec 64)) Unit!7883)

(assert (=> b!254450 (= lt!127497 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6848 thiss!1504) index!297 key!932))))

(assert (=> b!254450 (arrayNoDuplicates!0 lt!127489 #b00000000000000000000000000000000 Nil!3765)))

(assert (=> b!254450 (= lt!127489 (array!12432 (store (arr!5891 (_keys!6848 thiss!1504)) index!297 key!932) (size!6238 (_keys!6848 thiss!1504))))))

(declare-fun lt!127493 () Unit!7883)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12431 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3768) Unit!7883)

(assert (=> b!254450 (= lt!127493 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6848 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3765))))

(declare-fun lt!127496 () Unit!7883)

(assert (=> b!254450 (= lt!127496 e!164926)))

(declare-fun c!42911 () Bool)

(assert (=> b!254450 (= c!42911 (arrayContainsKey!0 (_keys!6848 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254451 () Bool)

(assert (=> b!254451 (= e!164932 tp_is_empty!6549)))

(declare-fun b!254452 () Bool)

(assert (=> b!254452 (= e!164930 tp_is_empty!6549)))

(declare-fun b!254453 () Bool)

(declare-fun res!124560 () Bool)

(assert (=> b!254453 (=> (not res!124560) (not e!164920))))

(assert (=> b!254453 (= res!124560 (= (select (arr!5891 (_keys!6848 thiss!1504)) (index!6766 lt!127495)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254454 () Bool)

(assert (=> b!254454 (= e!164931 ((_ is Undefined!1149) lt!127495))))

(assert (= (and start!24286 res!124556) b!254449))

(assert (= (and b!254449 res!124557) b!254445))

(assert (= (and b!254445 res!124561) b!254447))

(assert (= (and b!254447 c!42913) b!254433))

(assert (= (and b!254447 (not c!42913)) b!254442))

(assert (= (and b!254442 c!42914) b!254437))

(assert (= (and b!254442 (not c!42914)) b!254448))

(assert (= (and b!254437 res!124562) b!254453))

(assert (= (and b!254453 res!124560) b!254435))

(assert (= (and b!254448 c!42912) b!254446))

(assert (= (and b!254448 (not c!42912)) b!254454))

(assert (= (and b!254446 res!124563) b!254444))

(assert (= (and b!254444 res!124565) b!254439))

(assert (= (or b!254437 b!254446) bm!24003))

(assert (= (or b!254435 b!254439) bm!24004))

(assert (= (and b!254447 res!124558) b!254450))

(assert (= (and b!254450 c!42911) b!254441))

(assert (= (and b!254450 (not c!42911)) b!254440))

(assert (= (and b!254450 (not res!124564)) b!254438))

(assert (= (and b!254438 (not res!124566)) b!254436))

(assert (= (and b!254436 (not res!124559)) b!254434))

(assert (= (and b!254443 condMapEmpty!11139) mapIsEmpty!11139))

(assert (= (and b!254443 (not condMapEmpty!11139)) mapNonEmpty!11139))

(assert (= (and mapNonEmpty!11139 ((_ is ValueCellFull!2931) mapValue!11139)) b!254452))

(assert (= (and b!254443 ((_ is ValueCellFull!2931) mapDefault!11139)) b!254451))

(assert (= b!254432 b!254443))

(assert (= start!24286 b!254432))

(declare-fun m!270001 () Bool)

(assert (=> b!254450 m!270001))

(declare-fun m!270003 () Bool)

(assert (=> b!254450 m!270003))

(declare-fun m!270005 () Bool)

(assert (=> b!254450 m!270005))

(declare-fun m!270007 () Bool)

(assert (=> b!254450 m!270007))

(declare-fun m!270009 () Bool)

(assert (=> b!254450 m!270009))

(declare-fun m!270011 () Bool)

(assert (=> b!254450 m!270011))

(declare-fun m!270013 () Bool)

(assert (=> b!254450 m!270013))

(declare-fun m!270015 () Bool)

(assert (=> b!254450 m!270015))

(declare-fun m!270017 () Bool)

(assert (=> b!254450 m!270017))

(declare-fun m!270019 () Bool)

(assert (=> b!254450 m!270019))

(declare-fun m!270021 () Bool)

(assert (=> b!254432 m!270021))

(declare-fun m!270023 () Bool)

(assert (=> b!254432 m!270023))

(declare-fun m!270025 () Bool)

(assert (=> b!254453 m!270025))

(declare-fun m!270027 () Bool)

(assert (=> b!254434 m!270027))

(declare-fun m!270029 () Bool)

(assert (=> b!254447 m!270029))

(declare-fun m!270031 () Bool)

(assert (=> b!254447 m!270031))

(assert (=> b!254447 m!270031))

(declare-fun m!270033 () Bool)

(assert (=> b!254447 m!270033))

(declare-fun m!270035 () Bool)

(assert (=> b!254441 m!270035))

(declare-fun m!270037 () Bool)

(assert (=> b!254433 m!270037))

(declare-fun m!270039 () Bool)

(assert (=> mapNonEmpty!11139 m!270039))

(declare-fun m!270041 () Bool)

(assert (=> bm!24003 m!270041))

(declare-fun m!270043 () Bool)

(assert (=> b!254436 m!270043))

(assert (=> bm!24004 m!270001))

(declare-fun m!270045 () Bool)

(assert (=> b!254445 m!270045))

(declare-fun m!270047 () Bool)

(assert (=> start!24286 m!270047))

(declare-fun m!270049 () Bool)

(assert (=> b!254444 m!270049))

(declare-fun m!270051 () Bool)

(assert (=> b!254442 m!270051))

(check-sat (not b_next!6687) (not b!254436) (not b!254445) tp_is_empty!6549 (not b!254450) (not b!254442) (not bm!24003) (not b!254432) (not b!254433) (not mapNonEmpty!11139) (not b!254447) (not b!254434) b_and!13729 (not b!254441) (not start!24286) (not bm!24004))
(check-sat b_and!13729 (not b_next!6687))
