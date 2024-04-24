; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24288 () Bool)

(assert start!24288)

(declare-fun b!254431 () Bool)

(declare-fun b_free!6685 () Bool)

(declare-fun b_next!6685 () Bool)

(assert (=> b!254431 (= b_free!6685 (not b_next!6685))))

(declare-fun tp!23342 () Bool)

(declare-fun b_and!13741 () Bool)

(assert (=> b!254431 (= tp!23342 b_and!13741)))

(declare-fun b!254410 () Bool)

(declare-fun c!42915 () Bool)

(declare-datatypes ((SeekEntryResult!1114 0))(
  ( (MissingZero!1114 (index!6626 (_ BitVec 32))) (Found!1114 (index!6627 (_ BitVec 32))) (Intermediate!1114 (undefined!1926 Bool) (index!6628 (_ BitVec 32)) (x!24830 (_ BitVec 32))) (Undefined!1114) (MissingVacant!1114 (index!6629 (_ BitVec 32))) )
))
(declare-fun lt!127517 () SeekEntryResult!1114)

(get-info :version)

(assert (=> b!254410 (= c!42915 ((_ is MissingVacant!1114) lt!127517))))

(declare-fun e!164908 () Bool)

(declare-fun e!164901 () Bool)

(assert (=> b!254410 (= e!164908 e!164901)))

(declare-fun bm!23985 () Bool)

(declare-datatypes ((V!8377 0))(
  ( (V!8378 (val!3318 Int)) )
))
(declare-datatypes ((ValueCell!2930 0))(
  ( (ValueCellFull!2930 (v!5393 V!8377)) (EmptyCell!2930) )
))
(declare-datatypes ((array!12423 0))(
  ( (array!12424 (arr!5887 (Array (_ BitVec 32) ValueCell!2930)) (size!6234 (_ BitVec 32))) )
))
(declare-datatypes ((array!12425 0))(
  ( (array!12426 (arr!5888 (Array (_ BitVec 32) (_ BitVec 64))) (size!6235 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3760 0))(
  ( (LongMapFixedSize!3761 (defaultEntry!4693 Int) (mask!10939 (_ BitVec 32)) (extraKeys!4430 (_ BitVec 32)) (zeroValue!4534 V!8377) (minValue!4534 V!8377) (_size!1929 (_ BitVec 32)) (_keys!6847 array!12425) (_values!4676 array!12423) (_vacant!1929 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3760)

(declare-fun c!42913 () Bool)

(declare-fun call!23988 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23985 (= call!23988 (inRange!0 (ite c!42913 (index!6626 lt!127517) (index!6629 lt!127517)) (mask!10939 thiss!1504)))))

(declare-fun mapIsEmpty!11136 () Bool)

(declare-fun mapRes!11136 () Bool)

(assert (=> mapIsEmpty!11136 mapRes!11136))

(declare-fun mapNonEmpty!11136 () Bool)

(declare-fun tp!23343 () Bool)

(declare-fun e!164911 () Bool)

(assert (=> mapNonEmpty!11136 (= mapRes!11136 (and tp!23343 e!164911))))

(declare-fun mapRest!11136 () (Array (_ BitVec 32) ValueCell!2930))

(declare-fun mapKey!11136 () (_ BitVec 32))

(declare-fun mapValue!11136 () ValueCell!2930)

(assert (=> mapNonEmpty!11136 (= (arr!5887 (_values!4676 thiss!1504)) (store mapRest!11136 mapKey!11136 mapValue!11136))))

(declare-fun b!254411 () Bool)

(declare-fun e!164898 () Bool)

(declare-fun e!164899 () Bool)

(assert (=> b!254411 (= e!164898 (not e!164899))))

(declare-fun res!124550 () Bool)

(assert (=> b!254411 (=> res!124550 e!164899)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254411 (= res!124550 (not (validMask!0 (mask!10939 thiss!1504))))))

(declare-fun lt!127525 () array!12425)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12425 (_ BitVec 32)) Bool)

(assert (=> b!254411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127525 (mask!10939 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7856 0))(
  ( (Unit!7857) )
))
(declare-fun lt!127518 () Unit!7856)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12425 (_ BitVec 32) (_ BitVec 32)) Unit!7856)

(assert (=> b!254411 (= lt!127518 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6847 thiss!1504) index!297 (mask!10939 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12425 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254411 (= (arrayCountValidKeys!0 lt!127525 #b00000000000000000000000000000000 (size!6235 (_keys!6847 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6847 thiss!1504) #b00000000000000000000000000000000 (size!6235 (_keys!6847 thiss!1504)))))))

(declare-fun lt!127521 () Unit!7856)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12425 (_ BitVec 32) (_ BitVec 64)) Unit!7856)

(assert (=> b!254411 (= lt!127521 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6847 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3680 0))(
  ( (Nil!3677) (Cons!3676 (h!4338 (_ BitVec 64)) (t!8719 List!3680)) )
))
(declare-fun arrayNoDuplicates!0 (array!12425 (_ BitVec 32) List!3680) Bool)

(assert (=> b!254411 (arrayNoDuplicates!0 lt!127525 #b00000000000000000000000000000000 Nil!3677)))

(assert (=> b!254411 (= lt!127525 (array!12426 (store (arr!5888 (_keys!6847 thiss!1504)) index!297 key!932) (size!6235 (_keys!6847 thiss!1504))))))

(declare-fun lt!127515 () Unit!7856)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3680) Unit!7856)

(assert (=> b!254411 (= lt!127515 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6847 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3677))))

(declare-fun lt!127519 () Unit!7856)

(declare-fun e!164904 () Unit!7856)

(assert (=> b!254411 (= lt!127519 e!164904)))

(declare-fun c!42914 () Bool)

(declare-fun arrayContainsKey!0 (array!12425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254411 (= c!42914 (arrayContainsKey!0 (_keys!6847 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254412 () Bool)

(declare-fun e!164910 () Bool)

(assert (=> b!254412 (= e!164901 e!164910)))

(declare-fun res!124554 () Bool)

(assert (=> b!254412 (= res!124554 call!23988)))

(assert (=> b!254412 (=> (not res!124554) (not e!164910))))

(declare-fun b!254413 () Bool)

(declare-fun res!124553 () Bool)

(declare-fun e!164897 () Bool)

(assert (=> b!254413 (=> (not res!124553) (not e!164897))))

(assert (=> b!254413 (= res!124553 call!23988)))

(assert (=> b!254413 (= e!164908 e!164897)))

(declare-fun b!254414 () Bool)

(declare-fun Unit!7858 () Unit!7856)

(assert (=> b!254414 (= e!164904 Unit!7858)))

(declare-fun b!254415 () Bool)

(declare-fun e!164907 () Bool)

(assert (=> b!254415 (= e!164907 e!164898)))

(declare-fun res!124552 () Bool)

(assert (=> b!254415 (=> (not res!124552) (not e!164898))))

(assert (=> b!254415 (= res!124552 (inRange!0 index!297 (mask!10939 thiss!1504)))))

(declare-fun lt!127516 () Unit!7856)

(declare-fun e!164906 () Unit!7856)

(assert (=> b!254415 (= lt!127516 e!164906)))

(declare-fun c!42912 () Bool)

(declare-datatypes ((tuple2!4800 0))(
  ( (tuple2!4801 (_1!2411 (_ BitVec 64)) (_2!2411 V!8377)) )
))
(declare-datatypes ((List!3681 0))(
  ( (Nil!3678) (Cons!3677 (h!4339 tuple2!4800) (t!8720 List!3681)) )
))
(declare-datatypes ((ListLongMap!3715 0))(
  ( (ListLongMap!3716 (toList!1873 List!3681)) )
))
(declare-fun contains!1819 (ListLongMap!3715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1405 (array!12425 array!12423 (_ BitVec 32) (_ BitVec 32) V!8377 V!8377 (_ BitVec 32) Int) ListLongMap!3715)

(assert (=> b!254415 (= c!42912 (contains!1819 (getCurrentListMap!1405 (_keys!6847 thiss!1504) (_values!4676 thiss!1504) (mask!10939 thiss!1504) (extraKeys!4430 thiss!1504) (zeroValue!4534 thiss!1504) (minValue!4534 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4693 thiss!1504)) key!932))))

(declare-fun b!254416 () Bool)

(declare-fun res!124546 () Bool)

(assert (=> b!254416 (=> res!124546 e!164899)))

(assert (=> b!254416 (= res!124546 (or (not (= (size!6234 (_values!4676 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10939 thiss!1504)))) (not (= (size!6235 (_keys!6847 thiss!1504)) (size!6234 (_values!4676 thiss!1504)))) (bvslt (mask!10939 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4430 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4430 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!254417 () Bool)

(declare-fun Unit!7859 () Unit!7856)

(assert (=> b!254417 (= e!164906 Unit!7859)))

(declare-fun lt!127524 () Unit!7856)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!412 (array!12425 array!12423 (_ BitVec 32) (_ BitVec 32) V!8377 V!8377 (_ BitVec 64) Int) Unit!7856)

(assert (=> b!254417 (= lt!127524 (lemmaInListMapThenSeekEntryOrOpenFindsIt!412 (_keys!6847 thiss!1504) (_values!4676 thiss!1504) (mask!10939 thiss!1504) (extraKeys!4430 thiss!1504) (zeroValue!4534 thiss!1504) (minValue!4534 thiss!1504) key!932 (defaultEntry!4693 thiss!1504)))))

(assert (=> b!254417 false))

(declare-fun b!254418 () Bool)

(assert (=> b!254418 (= e!164901 ((_ is Undefined!1114) lt!127517))))

(declare-fun b!254419 () Bool)

(declare-fun lt!127522 () Unit!7856)

(assert (=> b!254419 (= e!164906 lt!127522)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!406 (array!12425 array!12423 (_ BitVec 32) (_ BitVec 32) V!8377 V!8377 (_ BitVec 64) Int) Unit!7856)

(assert (=> b!254419 (= lt!127522 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!406 (_keys!6847 thiss!1504) (_values!4676 thiss!1504) (mask!10939 thiss!1504) (extraKeys!4430 thiss!1504) (zeroValue!4534 thiss!1504) (minValue!4534 thiss!1504) key!932 (defaultEntry!4693 thiss!1504)))))

(assert (=> b!254419 (= c!42913 ((_ is MissingZero!1114) lt!127517))))

(assert (=> b!254419 e!164908))

(declare-fun b!254420 () Bool)

(assert (=> b!254420 (= e!164899 true)))

(declare-fun lt!127520 () Bool)

(assert (=> b!254420 (= lt!127520 (arrayNoDuplicates!0 (_keys!6847 thiss!1504) #b00000000000000000000000000000000 Nil!3677))))

(declare-fun b!254421 () Bool)

(declare-fun res!124548 () Bool)

(declare-fun e!164903 () Bool)

(assert (=> b!254421 (=> (not res!124548) (not e!164903))))

(assert (=> b!254421 (= res!124548 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!124549 () Bool)

(assert (=> start!24288 (=> (not res!124549) (not e!164903))))

(declare-fun valid!1477 (LongMapFixedSize!3760) Bool)

(assert (=> start!24288 (= res!124549 (valid!1477 thiss!1504))))

(assert (=> start!24288 e!164903))

(declare-fun e!164902 () Bool)

(assert (=> start!24288 e!164902))

(assert (=> start!24288 true))

(declare-fun b!254422 () Bool)

(declare-fun Unit!7860 () Unit!7856)

(assert (=> b!254422 (= e!164904 Unit!7860)))

(declare-fun lt!127523 () Unit!7856)

(declare-fun lemmaArrayContainsKeyThenInListMap!230 (array!12425 array!12423 (_ BitVec 32) (_ BitVec 32) V!8377 V!8377 (_ BitVec 64) (_ BitVec 32) Int) Unit!7856)

(assert (=> b!254422 (= lt!127523 (lemmaArrayContainsKeyThenInListMap!230 (_keys!6847 thiss!1504) (_values!4676 thiss!1504) (mask!10939 thiss!1504) (extraKeys!4430 thiss!1504) (zeroValue!4534 thiss!1504) (minValue!4534 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4693 thiss!1504)))))

(assert (=> b!254422 false))

(declare-fun b!254423 () Bool)

(declare-fun res!124545 () Bool)

(assert (=> b!254423 (=> (not res!124545) (not e!164897))))

(assert (=> b!254423 (= res!124545 (= (select (arr!5888 (_keys!6847 thiss!1504)) (index!6626 lt!127517)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254424 () Bool)

(declare-fun call!23989 () Bool)

(assert (=> b!254424 (= e!164910 (not call!23989))))

(declare-fun b!254425 () Bool)

(assert (=> b!254425 (= e!164903 e!164907)))

(declare-fun res!124547 () Bool)

(assert (=> b!254425 (=> (not res!124547) (not e!164907))))

(assert (=> b!254425 (= res!124547 (or (= lt!127517 (MissingZero!1114 index!297)) (= lt!127517 (MissingVacant!1114 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12425 (_ BitVec 32)) SeekEntryResult!1114)

(assert (=> b!254425 (= lt!127517 (seekEntryOrOpen!0 key!932 (_keys!6847 thiss!1504) (mask!10939 thiss!1504)))))

(declare-fun b!254426 () Bool)

(declare-fun res!124551 () Bool)

(assert (=> b!254426 (= res!124551 (= (select (arr!5888 (_keys!6847 thiss!1504)) (index!6629 lt!127517)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254426 (=> (not res!124551) (not e!164910))))

(declare-fun b!254427 () Bool)

(declare-fun tp_is_empty!6547 () Bool)

(assert (=> b!254427 (= e!164911 tp_is_empty!6547)))

(declare-fun b!254428 () Bool)

(declare-fun e!164909 () Bool)

(assert (=> b!254428 (= e!164909 tp_is_empty!6547)))

(declare-fun bm!23986 () Bool)

(assert (=> bm!23986 (= call!23989 (arrayContainsKey!0 (_keys!6847 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254429 () Bool)

(assert (=> b!254429 (= e!164897 (not call!23989))))

(declare-fun b!254430 () Bool)

(declare-fun res!124544 () Bool)

(assert (=> b!254430 (=> res!124544 e!164899)))

(assert (=> b!254430 (= res!124544 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6847 thiss!1504) (mask!10939 thiss!1504))))))

(declare-fun e!164900 () Bool)

(declare-fun array_inv!3875 (array!12425) Bool)

(declare-fun array_inv!3876 (array!12423) Bool)

(assert (=> b!254431 (= e!164902 (and tp!23342 tp_is_empty!6547 (array_inv!3875 (_keys!6847 thiss!1504)) (array_inv!3876 (_values!4676 thiss!1504)) e!164900))))

(declare-fun b!254432 () Bool)

(assert (=> b!254432 (= e!164900 (and e!164909 mapRes!11136))))

(declare-fun condMapEmpty!11136 () Bool)

(declare-fun mapDefault!11136 () ValueCell!2930)

(assert (=> b!254432 (= condMapEmpty!11136 (= (arr!5887 (_values!4676 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2930)) mapDefault!11136)))))

(assert (= (and start!24288 res!124549) b!254421))

(assert (= (and b!254421 res!124548) b!254425))

(assert (= (and b!254425 res!124547) b!254415))

(assert (= (and b!254415 c!42912) b!254417))

(assert (= (and b!254415 (not c!42912)) b!254419))

(assert (= (and b!254419 c!42913) b!254413))

(assert (= (and b!254419 (not c!42913)) b!254410))

(assert (= (and b!254413 res!124553) b!254423))

(assert (= (and b!254423 res!124545) b!254429))

(assert (= (and b!254410 c!42915) b!254412))

(assert (= (and b!254410 (not c!42915)) b!254418))

(assert (= (and b!254412 res!124554) b!254426))

(assert (= (and b!254426 res!124551) b!254424))

(assert (= (or b!254413 b!254412) bm!23985))

(assert (= (or b!254429 b!254424) bm!23986))

(assert (= (and b!254415 res!124552) b!254411))

(assert (= (and b!254411 c!42914) b!254422))

(assert (= (and b!254411 (not c!42914)) b!254414))

(assert (= (and b!254411 (not res!124550)) b!254416))

(assert (= (and b!254416 (not res!124546)) b!254430))

(assert (= (and b!254430 (not res!124544)) b!254420))

(assert (= (and b!254432 condMapEmpty!11136) mapIsEmpty!11136))

(assert (= (and b!254432 (not condMapEmpty!11136)) mapNonEmpty!11136))

(assert (= (and mapNonEmpty!11136 ((_ is ValueCellFull!2930) mapValue!11136)) b!254427))

(assert (= (and b!254432 ((_ is ValueCellFull!2930) mapDefault!11136)) b!254428))

(assert (= b!254431 b!254432))

(assert (= start!24288 b!254431))

(declare-fun m!270131 () Bool)

(assert (=> b!254430 m!270131))

(declare-fun m!270133 () Bool)

(assert (=> bm!23986 m!270133))

(declare-fun m!270135 () Bool)

(assert (=> b!254419 m!270135))

(declare-fun m!270137 () Bool)

(assert (=> mapNonEmpty!11136 m!270137))

(declare-fun m!270139 () Bool)

(assert (=> b!254425 m!270139))

(declare-fun m!270141 () Bool)

(assert (=> bm!23985 m!270141))

(declare-fun m!270143 () Bool)

(assert (=> b!254420 m!270143))

(declare-fun m!270145 () Bool)

(assert (=> b!254426 m!270145))

(declare-fun m!270147 () Bool)

(assert (=> b!254411 m!270147))

(assert (=> b!254411 m!270133))

(declare-fun m!270149 () Bool)

(assert (=> b!254411 m!270149))

(declare-fun m!270151 () Bool)

(assert (=> b!254411 m!270151))

(declare-fun m!270153 () Bool)

(assert (=> b!254411 m!270153))

(declare-fun m!270155 () Bool)

(assert (=> b!254411 m!270155))

(declare-fun m!270157 () Bool)

(assert (=> b!254411 m!270157))

(declare-fun m!270159 () Bool)

(assert (=> b!254411 m!270159))

(declare-fun m!270161 () Bool)

(assert (=> b!254411 m!270161))

(declare-fun m!270163 () Bool)

(assert (=> b!254411 m!270163))

(declare-fun m!270165 () Bool)

(assert (=> b!254417 m!270165))

(declare-fun m!270167 () Bool)

(assert (=> b!254431 m!270167))

(declare-fun m!270169 () Bool)

(assert (=> b!254431 m!270169))

(declare-fun m!270171 () Bool)

(assert (=> b!254423 m!270171))

(declare-fun m!270173 () Bool)

(assert (=> b!254422 m!270173))

(declare-fun m!270175 () Bool)

(assert (=> b!254415 m!270175))

(declare-fun m!270177 () Bool)

(assert (=> b!254415 m!270177))

(assert (=> b!254415 m!270177))

(declare-fun m!270179 () Bool)

(assert (=> b!254415 m!270179))

(declare-fun m!270181 () Bool)

(assert (=> start!24288 m!270181))

(check-sat (not b!254417) (not bm!23986) (not b!254430) (not b!254419) (not bm!23985) (not b!254431) (not b!254425) (not b!254411) (not b!254422) (not mapNonEmpty!11136) (not b_next!6685) (not start!24288) tp_is_empty!6547 (not b!254420) (not b!254415) b_and!13741)
(check-sat b_and!13741 (not b_next!6685))
