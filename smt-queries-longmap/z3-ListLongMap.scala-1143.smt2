; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23664 () Bool)

(assert start!23664)

(declare-fun b!248713 () Bool)

(declare-fun b_free!6607 () Bool)

(declare-fun b_next!6607 () Bool)

(assert (=> b!248713 (= b_free!6607 (not b_next!6607))))

(declare-fun tp!23075 () Bool)

(declare-fun b_and!13627 () Bool)

(assert (=> b!248713 (= tp!23075 b_and!13627)))

(declare-fun res!121880 () Bool)

(declare-fun e!161300 () Bool)

(assert (=> start!23664 (=> (not res!121880) (not e!161300))))

(declare-datatypes ((V!8273 0))(
  ( (V!8274 (val!3279 Int)) )
))
(declare-datatypes ((ValueCell!2891 0))(
  ( (ValueCellFull!2891 (v!5340 V!8273)) (EmptyCell!2891) )
))
(declare-datatypes ((array!12247 0))(
  ( (array!12248 (arr!5809 (Array (_ BitVec 32) ValueCell!2891)) (size!6152 (_ BitVec 32))) )
))
(declare-datatypes ((array!12249 0))(
  ( (array!12250 (arr!5810 (Array (_ BitVec 32) (_ BitVec 64))) (size!6153 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3682 0))(
  ( (LongMapFixedSize!3683 (defaultEntry!4598 Int) (mask!10752 (_ BitVec 32)) (extraKeys!4335 (_ BitVec 32)) (zeroValue!4439 V!8273) (minValue!4439 V!8273) (_size!1890 (_ BitVec 32)) (_keys!6724 array!12249) (_values!4581 array!12247) (_vacant!1890 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3682)

(declare-fun valid!1450 (LongMapFixedSize!3682) Bool)

(assert (=> start!23664 (= res!121880 (valid!1450 thiss!1504))))

(assert (=> start!23664 e!161300))

(declare-fun e!161299 () Bool)

(assert (=> start!23664 e!161299))

(assert (=> start!23664 true))

(declare-fun b!248699 () Bool)

(declare-fun res!121877 () Bool)

(declare-fun e!161311 () Bool)

(assert (=> b!248699 (=> (not res!121877) (not e!161311))))

(declare-fun call!23305 () Bool)

(assert (=> b!248699 (= res!121877 call!23305)))

(declare-fun e!161304 () Bool)

(assert (=> b!248699 (= e!161304 e!161311)))

(declare-fun b!248700 () Bool)

(declare-fun res!121881 () Bool)

(declare-datatypes ((SeekEntryResult!1078 0))(
  ( (MissingZero!1078 (index!6482 (_ BitVec 32))) (Found!1078 (index!6483 (_ BitVec 32))) (Intermediate!1078 (undefined!1890 Bool) (index!6484 (_ BitVec 32)) (x!24558 (_ BitVec 32))) (Undefined!1078) (MissingVacant!1078 (index!6485 (_ BitVec 32))) )
))
(declare-fun lt!124573 () SeekEntryResult!1078)

(assert (=> b!248700 (= res!121881 (= (select (arr!5810 (_keys!6724 thiss!1504)) (index!6485 lt!124573)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161308 () Bool)

(assert (=> b!248700 (=> (not res!121881) (not e!161308))))

(declare-fun b!248701 () Bool)

(declare-fun call!23306 () Bool)

(assert (=> b!248701 (= e!161311 (not call!23306))))

(declare-fun b!248702 () Bool)

(declare-fun res!121876 () Bool)

(assert (=> b!248702 (=> (not res!121876) (not e!161300))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!248702 (= res!121876 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!248703 () Bool)

(declare-fun e!161306 () Bool)

(declare-fun tp_is_empty!6469 () Bool)

(assert (=> b!248703 (= e!161306 tp_is_empty!6469)))

(declare-fun mapIsEmpty!10985 () Bool)

(declare-fun mapRes!10985 () Bool)

(assert (=> mapIsEmpty!10985 mapRes!10985))

(declare-fun b!248704 () Bool)

(declare-fun c!41684 () Bool)

(get-info :version)

(assert (=> b!248704 (= c!41684 ((_ is MissingVacant!1078) lt!124573))))

(declare-fun e!161312 () Bool)

(assert (=> b!248704 (= e!161304 e!161312)))

(declare-fun b!248705 () Bool)

(declare-fun e!161301 () Bool)

(assert (=> b!248705 (= e!161301 tp_is_empty!6469)))

(declare-fun b!248706 () Bool)

(assert (=> b!248706 (= e!161312 ((_ is Undefined!1078) lt!124573))))

(declare-fun c!41683 () Bool)

(declare-fun bm!23302 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23302 (= call!23305 (inRange!0 (ite c!41683 (index!6482 lt!124573) (index!6485 lt!124573)) (mask!10752 thiss!1504)))))

(declare-fun mapNonEmpty!10985 () Bool)

(declare-fun tp!23074 () Bool)

(assert (=> mapNonEmpty!10985 (= mapRes!10985 (and tp!23074 e!161306))))

(declare-fun mapValue!10985 () ValueCell!2891)

(declare-fun mapRest!10985 () (Array (_ BitVec 32) ValueCell!2891))

(declare-fun mapKey!10985 () (_ BitVec 32))

(assert (=> mapNonEmpty!10985 (= (arr!5809 (_values!4581 thiss!1504)) (store mapRest!10985 mapKey!10985 mapValue!10985))))

(declare-fun b!248707 () Bool)

(declare-datatypes ((Unit!7672 0))(
  ( (Unit!7673) )
))
(declare-fun e!161305 () Unit!7672)

(declare-fun Unit!7674 () Unit!7672)

(assert (=> b!248707 (= e!161305 Unit!7674)))

(declare-fun b!248708 () Bool)

(assert (=> b!248708 (= e!161312 e!161308)))

(declare-fun res!121879 () Bool)

(assert (=> b!248708 (= res!121879 call!23305)))

(assert (=> b!248708 (=> (not res!121879) (not e!161308))))

(declare-fun b!248709 () Bool)

(assert (=> b!248709 (= e!161308 (not call!23306))))

(declare-fun b!248710 () Bool)

(declare-fun e!161303 () Bool)

(declare-fun e!161310 () Bool)

(assert (=> b!248710 (= e!161303 e!161310)))

(declare-fun res!121878 () Bool)

(assert (=> b!248710 (=> (not res!121878) (not e!161310))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!248710 (= res!121878 (inRange!0 index!297 (mask!10752 thiss!1504)))))

(declare-fun lt!124577 () Unit!7672)

(declare-fun e!161307 () Unit!7672)

(assert (=> b!248710 (= lt!124577 e!161307)))

(declare-fun c!41682 () Bool)

(declare-datatypes ((tuple2!4752 0))(
  ( (tuple2!4753 (_1!2387 (_ BitVec 64)) (_2!2387 V!8273)) )
))
(declare-datatypes ((List!3629 0))(
  ( (Nil!3626) (Cons!3625 (h!4283 tuple2!4752) (t!8648 List!3629)) )
))
(declare-datatypes ((ListLongMap!3667 0))(
  ( (ListLongMap!3668 (toList!1849 List!3629)) )
))
(declare-fun contains!1781 (ListLongMap!3667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1381 (array!12249 array!12247 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 32) Int) ListLongMap!3667)

(assert (=> b!248710 (= c!41682 (contains!1781 (getCurrentListMap!1381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) key!932))))

(declare-fun bm!23303 () Bool)

(declare-fun arrayContainsKey!0 (array!12249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23303 (= call!23306 (arrayContainsKey!0 (_keys!6724 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248711 () Bool)

(declare-fun res!121875 () Bool)

(assert (=> b!248711 (=> (not res!121875) (not e!161311))))

(assert (=> b!248711 (= res!121875 (= (select (arr!5810 (_keys!6724 thiss!1504)) (index!6482 lt!124573)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248712 () Bool)

(declare-fun Unit!7675 () Unit!7672)

(assert (=> b!248712 (= e!161305 Unit!7675)))

(declare-fun lt!124576 () Unit!7672)

(declare-fun lemmaArrayContainsKeyThenInListMap!206 (array!12249 array!12247 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) (_ BitVec 32) Int) Unit!7672)

(assert (=> b!248712 (= lt!124576 (lemmaArrayContainsKeyThenInListMap!206 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248712 false))

(declare-fun e!161302 () Bool)

(declare-fun array_inv!3817 (array!12249) Bool)

(declare-fun array_inv!3818 (array!12247) Bool)

(assert (=> b!248713 (= e!161299 (and tp!23075 tp_is_empty!6469 (array_inv!3817 (_keys!6724 thiss!1504)) (array_inv!3818 (_values!4581 thiss!1504)) e!161302))))

(declare-fun b!248714 () Bool)

(declare-fun Unit!7676 () Unit!7672)

(assert (=> b!248714 (= e!161307 Unit!7676)))

(declare-fun lt!124575 () Unit!7672)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!385 (array!12249 array!12247 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7672)

(assert (=> b!248714 (= lt!124575 (lemmaInListMapThenSeekEntryOrOpenFindsIt!385 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248714 false))

(declare-fun b!248715 () Bool)

(assert (=> b!248715 (= e!161302 (and e!161301 mapRes!10985))))

(declare-fun condMapEmpty!10985 () Bool)

(declare-fun mapDefault!10985 () ValueCell!2891)

(assert (=> b!248715 (= condMapEmpty!10985 (= (arr!5809 (_values!4581 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2891)) mapDefault!10985)))))

(declare-fun b!248716 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!248716 (= e!161310 (not (validMask!0 (mask!10752 thiss!1504))))))

(declare-fun lt!124582 () array!12249)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12249 (_ BitVec 32)) Bool)

(assert (=> b!248716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124582 (mask!10752 thiss!1504))))

(declare-fun lt!124579 () Unit!7672)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12249 (_ BitVec 32) (_ BitVec 32)) Unit!7672)

(assert (=> b!248716 (= lt!124579 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6724 thiss!1504) index!297 (mask!10752 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12249 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!248716 (= (arrayCountValidKeys!0 lt!124582 #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6724 thiss!1504) #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504)))))))

(declare-fun lt!124580 () Unit!7672)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12249 (_ BitVec 32) (_ BitVec 64)) Unit!7672)

(assert (=> b!248716 (= lt!124580 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6724 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3630 0))(
  ( (Nil!3627) (Cons!3626 (h!4284 (_ BitVec 64)) (t!8649 List!3630)) )
))
(declare-fun arrayNoDuplicates!0 (array!12249 (_ BitVec 32) List!3630) Bool)

(assert (=> b!248716 (arrayNoDuplicates!0 lt!124582 #b00000000000000000000000000000000 Nil!3627)))

(assert (=> b!248716 (= lt!124582 (array!12250 (store (arr!5810 (_keys!6724 thiss!1504)) index!297 key!932) (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun lt!124578 () Unit!7672)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12249 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3630) Unit!7672)

(assert (=> b!248716 (= lt!124578 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6724 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3627))))

(declare-fun lt!124574 () Unit!7672)

(assert (=> b!248716 (= lt!124574 e!161305)))

(declare-fun c!41681 () Bool)

(assert (=> b!248716 (= c!41681 (arrayContainsKey!0 (_keys!6724 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248717 () Bool)

(assert (=> b!248717 (= e!161300 e!161303)))

(declare-fun res!121882 () Bool)

(assert (=> b!248717 (=> (not res!121882) (not e!161303))))

(assert (=> b!248717 (= res!121882 (or (= lt!124573 (MissingZero!1078 index!297)) (= lt!124573 (MissingVacant!1078 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12249 (_ BitVec 32)) SeekEntryResult!1078)

(assert (=> b!248717 (= lt!124573 (seekEntryOrOpen!0 key!932 (_keys!6724 thiss!1504) (mask!10752 thiss!1504)))))

(declare-fun b!248718 () Bool)

(declare-fun lt!124581 () Unit!7672)

(assert (=> b!248718 (= e!161307 lt!124581)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (array!12249 array!12247 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7672)

(assert (=> b!248718 (= lt!124581 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248718 (= c!41683 ((_ is MissingZero!1078) lt!124573))))

(assert (=> b!248718 e!161304))

(assert (= (and start!23664 res!121880) b!248702))

(assert (= (and b!248702 res!121876) b!248717))

(assert (= (and b!248717 res!121882) b!248710))

(assert (= (and b!248710 c!41682) b!248714))

(assert (= (and b!248710 (not c!41682)) b!248718))

(assert (= (and b!248718 c!41683) b!248699))

(assert (= (and b!248718 (not c!41683)) b!248704))

(assert (= (and b!248699 res!121877) b!248711))

(assert (= (and b!248711 res!121875) b!248701))

(assert (= (and b!248704 c!41684) b!248708))

(assert (= (and b!248704 (not c!41684)) b!248706))

(assert (= (and b!248708 res!121879) b!248700))

(assert (= (and b!248700 res!121881) b!248709))

(assert (= (or b!248699 b!248708) bm!23302))

(assert (= (or b!248701 b!248709) bm!23303))

(assert (= (and b!248710 res!121878) b!248716))

(assert (= (and b!248716 c!41681) b!248712))

(assert (= (and b!248716 (not c!41681)) b!248707))

(assert (= (and b!248715 condMapEmpty!10985) mapIsEmpty!10985))

(assert (= (and b!248715 (not condMapEmpty!10985)) mapNonEmpty!10985))

(assert (= (and mapNonEmpty!10985 ((_ is ValueCellFull!2891) mapValue!10985)) b!248703))

(assert (= (and b!248715 ((_ is ValueCellFull!2891) mapDefault!10985)) b!248705))

(assert (= b!248713 b!248715))

(assert (= start!23664 b!248713))

(declare-fun m!265507 () Bool)

(assert (=> b!248716 m!265507))

(declare-fun m!265509 () Bool)

(assert (=> b!248716 m!265509))

(declare-fun m!265511 () Bool)

(assert (=> b!248716 m!265511))

(declare-fun m!265513 () Bool)

(assert (=> b!248716 m!265513))

(declare-fun m!265515 () Bool)

(assert (=> b!248716 m!265515))

(declare-fun m!265517 () Bool)

(assert (=> b!248716 m!265517))

(declare-fun m!265519 () Bool)

(assert (=> b!248716 m!265519))

(declare-fun m!265521 () Bool)

(assert (=> b!248716 m!265521))

(declare-fun m!265523 () Bool)

(assert (=> b!248716 m!265523))

(declare-fun m!265525 () Bool)

(assert (=> b!248716 m!265525))

(declare-fun m!265527 () Bool)

(assert (=> b!248710 m!265527))

(declare-fun m!265529 () Bool)

(assert (=> b!248710 m!265529))

(assert (=> b!248710 m!265529))

(declare-fun m!265531 () Bool)

(assert (=> b!248710 m!265531))

(assert (=> bm!23303 m!265509))

(declare-fun m!265533 () Bool)

(assert (=> b!248714 m!265533))

(declare-fun m!265535 () Bool)

(assert (=> b!248713 m!265535))

(declare-fun m!265537 () Bool)

(assert (=> b!248713 m!265537))

(declare-fun m!265539 () Bool)

(assert (=> b!248711 m!265539))

(declare-fun m!265541 () Bool)

(assert (=> b!248718 m!265541))

(declare-fun m!265543 () Bool)

(assert (=> mapNonEmpty!10985 m!265543))

(declare-fun m!265545 () Bool)

(assert (=> b!248700 m!265545))

(declare-fun m!265547 () Bool)

(assert (=> b!248717 m!265547))

(declare-fun m!265549 () Bool)

(assert (=> bm!23302 m!265549))

(declare-fun m!265551 () Bool)

(assert (=> start!23664 m!265551))

(declare-fun m!265553 () Bool)

(assert (=> b!248712 m!265553))

(check-sat (not b!248718) (not bm!23303) (not b!248713) (not b!248714) (not mapNonEmpty!10985) (not b!248710) (not b!248716) (not bm!23302) tp_is_empty!6469 (not start!23664) (not b_next!6607) (not b!248717) (not b!248712) b_and!13627)
(check-sat b_and!13627 (not b_next!6607))
(get-model)

(declare-fun d!60643 () Bool)

(declare-fun lt!124645 () (_ BitVec 32))

(assert (=> d!60643 (and (bvsge lt!124645 #b00000000000000000000000000000000) (bvsle lt!124645 (bvsub (size!6153 lt!124582) #b00000000000000000000000000000000)))))

(declare-fun e!161402 () (_ BitVec 32))

(assert (=> d!60643 (= lt!124645 e!161402)))

(declare-fun c!41714 () Bool)

(assert (=> d!60643 (= c!41714 (bvsge #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))))))

(assert (=> d!60643 (and (bvsle #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6153 (_keys!6724 thiss!1504)) (size!6153 lt!124582)))))

(assert (=> d!60643 (= (arrayCountValidKeys!0 lt!124582 #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) lt!124645)))

(declare-fun b!248847 () Bool)

(declare-fun e!161401 () (_ BitVec 32))

(declare-fun call!23321 () (_ BitVec 32))

(assert (=> b!248847 (= e!161401 (bvadd #b00000000000000000000000000000001 call!23321))))

(declare-fun bm!23318 () Bool)

(assert (=> bm!23318 (= call!23321 (arrayCountValidKeys!0 lt!124582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun b!248848 () Bool)

(assert (=> b!248848 (= e!161402 e!161401)))

(declare-fun c!41713 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!248848 (= c!41713 (validKeyInArray!0 (select (arr!5810 lt!124582) #b00000000000000000000000000000000)))))

(declare-fun b!248849 () Bool)

(assert (=> b!248849 (= e!161402 #b00000000000000000000000000000000)))

(declare-fun b!248850 () Bool)

(assert (=> b!248850 (= e!161401 call!23321)))

(assert (= (and d!60643 c!41714) b!248849))

(assert (= (and d!60643 (not c!41714)) b!248848))

(assert (= (and b!248848 c!41713) b!248847))

(assert (= (and b!248848 (not c!41713)) b!248850))

(assert (= (or b!248847 b!248850) bm!23318))

(declare-fun m!265651 () Bool)

(assert (=> bm!23318 m!265651))

(declare-fun m!265653 () Bool)

(assert (=> b!248848 m!265653))

(assert (=> b!248848 m!265653))

(declare-fun m!265655 () Bool)

(assert (=> b!248848 m!265655))

(assert (=> b!248716 d!60643))

(declare-fun b!248861 () Bool)

(declare-fun e!161408 () Bool)

(assert (=> b!248861 (= e!161408 (bvslt (size!6153 (_keys!6724 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun e!161407 () Bool)

(declare-fun b!248862 () Bool)

(assert (=> b!248862 (= e!161407 (= (arrayCountValidKeys!0 (array!12250 (store (arr!5810 (_keys!6724 thiss!1504)) index!297 key!932) (size!6153 (_keys!6724 thiss!1504))) #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6724 thiss!1504) #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!248859 () Bool)

(declare-fun res!121939 () Bool)

(assert (=> b!248859 (=> (not res!121939) (not e!161408))))

(assert (=> b!248859 (= res!121939 (not (validKeyInArray!0 (select (arr!5810 (_keys!6724 thiss!1504)) index!297))))))

(declare-fun d!60645 () Bool)

(assert (=> d!60645 e!161407))

(declare-fun res!121942 () Bool)

(assert (=> d!60645 (=> (not res!121942) (not e!161407))))

(assert (=> d!60645 (= res!121942 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6153 (_keys!6724 thiss!1504)))))))

(declare-fun lt!124648 () Unit!7672)

(declare-fun choose!1 (array!12249 (_ BitVec 32) (_ BitVec 64)) Unit!7672)

(assert (=> d!60645 (= lt!124648 (choose!1 (_keys!6724 thiss!1504) index!297 key!932))))

(assert (=> d!60645 e!161408))

(declare-fun res!121941 () Bool)

(assert (=> d!60645 (=> (not res!121941) (not e!161408))))

(assert (=> d!60645 (= res!121941 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6153 (_keys!6724 thiss!1504)))))))

(assert (=> d!60645 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6724 thiss!1504) index!297 key!932) lt!124648)))

(declare-fun b!248860 () Bool)

(declare-fun res!121940 () Bool)

(assert (=> b!248860 (=> (not res!121940) (not e!161408))))

(assert (=> b!248860 (= res!121940 (validKeyInArray!0 key!932))))

(assert (= (and d!60645 res!121941) b!248859))

(assert (= (and b!248859 res!121939) b!248860))

(assert (= (and b!248860 res!121940) b!248861))

(assert (= (and d!60645 res!121942) b!248862))

(assert (=> b!248862 m!265517))

(declare-fun m!265657 () Bool)

(assert (=> b!248862 m!265657))

(assert (=> b!248862 m!265519))

(declare-fun m!265659 () Bool)

(assert (=> b!248859 m!265659))

(assert (=> b!248859 m!265659))

(declare-fun m!265661 () Bool)

(assert (=> b!248859 m!265661))

(declare-fun m!265663 () Bool)

(assert (=> d!60645 m!265663))

(declare-fun m!265665 () Bool)

(assert (=> b!248860 m!265665))

(assert (=> b!248716 d!60645))

(declare-fun d!60647 () Bool)

(declare-fun lt!124649 () (_ BitVec 32))

(assert (=> d!60647 (and (bvsge lt!124649 #b00000000000000000000000000000000) (bvsle lt!124649 (bvsub (size!6153 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!161410 () (_ BitVec 32))

(assert (=> d!60647 (= lt!124649 e!161410)))

(declare-fun c!41716 () Bool)

(assert (=> d!60647 (= c!41716 (bvsge #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))))))

(assert (=> d!60647 (and (bvsle #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6153 (_keys!6724 thiss!1504)) (size!6153 (_keys!6724 thiss!1504))))))

(assert (=> d!60647 (= (arrayCountValidKeys!0 (_keys!6724 thiss!1504) #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) lt!124649)))

(declare-fun b!248863 () Bool)

(declare-fun e!161409 () (_ BitVec 32))

(declare-fun call!23322 () (_ BitVec 32))

(assert (=> b!248863 (= e!161409 (bvadd #b00000000000000000000000000000001 call!23322))))

(declare-fun bm!23319 () Bool)

(assert (=> bm!23319 (= call!23322 (arrayCountValidKeys!0 (_keys!6724 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun b!248864 () Bool)

(assert (=> b!248864 (= e!161410 e!161409)))

(declare-fun c!41715 () Bool)

(assert (=> b!248864 (= c!41715 (validKeyInArray!0 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248865 () Bool)

(assert (=> b!248865 (= e!161410 #b00000000000000000000000000000000)))

(declare-fun b!248866 () Bool)

(assert (=> b!248866 (= e!161409 call!23322)))

(assert (= (and d!60647 c!41716) b!248865))

(assert (= (and d!60647 (not c!41716)) b!248864))

(assert (= (and b!248864 c!41715) b!248863))

(assert (= (and b!248864 (not c!41715)) b!248866))

(assert (= (or b!248863 b!248866) bm!23319))

(declare-fun m!265667 () Bool)

(assert (=> bm!23319 m!265667))

(declare-fun m!265669 () Bool)

(assert (=> b!248864 m!265669))

(assert (=> b!248864 m!265669))

(declare-fun m!265671 () Bool)

(assert (=> b!248864 m!265671))

(assert (=> b!248716 d!60647))

(declare-fun d!60649 () Bool)

(assert (=> d!60649 (= (validMask!0 (mask!10752 thiss!1504)) (and (or (= (mask!10752 thiss!1504) #b00000000000000000000000000000111) (= (mask!10752 thiss!1504) #b00000000000000000000000000001111) (= (mask!10752 thiss!1504) #b00000000000000000000000000011111) (= (mask!10752 thiss!1504) #b00000000000000000000000000111111) (= (mask!10752 thiss!1504) #b00000000000000000000000001111111) (= (mask!10752 thiss!1504) #b00000000000000000000000011111111) (= (mask!10752 thiss!1504) #b00000000000000000000000111111111) (= (mask!10752 thiss!1504) #b00000000000000000000001111111111) (= (mask!10752 thiss!1504) #b00000000000000000000011111111111) (= (mask!10752 thiss!1504) #b00000000000000000000111111111111) (= (mask!10752 thiss!1504) #b00000000000000000001111111111111) (= (mask!10752 thiss!1504) #b00000000000000000011111111111111) (= (mask!10752 thiss!1504) #b00000000000000000111111111111111) (= (mask!10752 thiss!1504) #b00000000000000001111111111111111) (= (mask!10752 thiss!1504) #b00000000000000011111111111111111) (= (mask!10752 thiss!1504) #b00000000000000111111111111111111) (= (mask!10752 thiss!1504) #b00000000000001111111111111111111) (= (mask!10752 thiss!1504) #b00000000000011111111111111111111) (= (mask!10752 thiss!1504) #b00000000000111111111111111111111) (= (mask!10752 thiss!1504) #b00000000001111111111111111111111) (= (mask!10752 thiss!1504) #b00000000011111111111111111111111) (= (mask!10752 thiss!1504) #b00000000111111111111111111111111) (= (mask!10752 thiss!1504) #b00000001111111111111111111111111) (= (mask!10752 thiss!1504) #b00000011111111111111111111111111) (= (mask!10752 thiss!1504) #b00000111111111111111111111111111) (= (mask!10752 thiss!1504) #b00001111111111111111111111111111) (= (mask!10752 thiss!1504) #b00011111111111111111111111111111) (= (mask!10752 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10752 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!248716 d!60649))

(declare-fun b!248875 () Bool)

(declare-fun e!161418 () Bool)

(declare-fun call!23325 () Bool)

(assert (=> b!248875 (= e!161418 call!23325)))

(declare-fun b!248876 () Bool)

(declare-fun e!161417 () Bool)

(assert (=> b!248876 (= e!161418 e!161417)))

(declare-fun lt!124656 () (_ BitVec 64))

(assert (=> b!248876 (= lt!124656 (select (arr!5810 lt!124582) #b00000000000000000000000000000000))))

(declare-fun lt!124657 () Unit!7672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12249 (_ BitVec 64) (_ BitVec 32)) Unit!7672)

(assert (=> b!248876 (= lt!124657 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124582 lt!124656 #b00000000000000000000000000000000))))

(assert (=> b!248876 (arrayContainsKey!0 lt!124582 lt!124656 #b00000000000000000000000000000000)))

(declare-fun lt!124658 () Unit!7672)

(assert (=> b!248876 (= lt!124658 lt!124657)))

(declare-fun res!121948 () Bool)

(assert (=> b!248876 (= res!121948 (= (seekEntryOrOpen!0 (select (arr!5810 lt!124582) #b00000000000000000000000000000000) lt!124582 (mask!10752 thiss!1504)) (Found!1078 #b00000000000000000000000000000000)))))

(assert (=> b!248876 (=> (not res!121948) (not e!161417))))

(declare-fun b!248877 () Bool)

(declare-fun e!161419 () Bool)

(assert (=> b!248877 (= e!161419 e!161418)))

(declare-fun c!41719 () Bool)

(assert (=> b!248877 (= c!41719 (validKeyInArray!0 (select (arr!5810 lt!124582) #b00000000000000000000000000000000)))))

(declare-fun d!60651 () Bool)

(declare-fun res!121947 () Bool)

(assert (=> d!60651 (=> res!121947 e!161419)))

(assert (=> d!60651 (= res!121947 (bvsge #b00000000000000000000000000000000 (size!6153 lt!124582)))))

(assert (=> d!60651 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124582 (mask!10752 thiss!1504)) e!161419)))

(declare-fun bm!23322 () Bool)

(assert (=> bm!23322 (= call!23325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124582 (mask!10752 thiss!1504)))))

(declare-fun b!248878 () Bool)

(assert (=> b!248878 (= e!161417 call!23325)))

(assert (= (and d!60651 (not res!121947)) b!248877))

(assert (= (and b!248877 c!41719) b!248876))

(assert (= (and b!248877 (not c!41719)) b!248875))

(assert (= (and b!248876 res!121948) b!248878))

(assert (= (or b!248878 b!248875) bm!23322))

(assert (=> b!248876 m!265653))

(declare-fun m!265673 () Bool)

(assert (=> b!248876 m!265673))

(declare-fun m!265675 () Bool)

(assert (=> b!248876 m!265675))

(assert (=> b!248876 m!265653))

(declare-fun m!265677 () Bool)

(assert (=> b!248876 m!265677))

(assert (=> b!248877 m!265653))

(assert (=> b!248877 m!265653))

(assert (=> b!248877 m!265655))

(declare-fun m!265679 () Bool)

(assert (=> bm!23322 m!265679))

(assert (=> b!248716 d!60651))

(declare-fun d!60653 () Bool)

(declare-fun res!121953 () Bool)

(declare-fun e!161424 () Bool)

(assert (=> d!60653 (=> res!121953 e!161424)))

(assert (=> d!60653 (= res!121953 (= (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60653 (= (arrayContainsKey!0 (_keys!6724 thiss!1504) key!932 #b00000000000000000000000000000000) e!161424)))

(declare-fun b!248883 () Bool)

(declare-fun e!161425 () Bool)

(assert (=> b!248883 (= e!161424 e!161425)))

(declare-fun res!121954 () Bool)

(assert (=> b!248883 (=> (not res!121954) (not e!161425))))

(assert (=> b!248883 (= res!121954 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun b!248884 () Bool)

(assert (=> b!248884 (= e!161425 (arrayContainsKey!0 (_keys!6724 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60653 (not res!121953)) b!248883))

(assert (= (and b!248883 res!121954) b!248884))

(assert (=> d!60653 m!265669))

(declare-fun m!265681 () Bool)

(assert (=> b!248884 m!265681))

(assert (=> b!248716 d!60653))

(declare-fun d!60655 () Bool)

(declare-fun e!161428 () Bool)

(assert (=> d!60655 e!161428))

(declare-fun res!121957 () Bool)

(assert (=> d!60655 (=> (not res!121957) (not e!161428))))

(assert (=> d!60655 (= res!121957 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6153 (_keys!6724 thiss!1504)))))))

(declare-fun lt!124661 () Unit!7672)

(declare-fun choose!102 ((_ BitVec 64) array!12249 (_ BitVec 32) (_ BitVec 32)) Unit!7672)

(assert (=> d!60655 (= lt!124661 (choose!102 key!932 (_keys!6724 thiss!1504) index!297 (mask!10752 thiss!1504)))))

(assert (=> d!60655 (validMask!0 (mask!10752 thiss!1504))))

(assert (=> d!60655 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6724 thiss!1504) index!297 (mask!10752 thiss!1504)) lt!124661)))

(declare-fun b!248887 () Bool)

(assert (=> b!248887 (= e!161428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12250 (store (arr!5810 (_keys!6724 thiss!1504)) index!297 key!932) (size!6153 (_keys!6724 thiss!1504))) (mask!10752 thiss!1504)))))

(assert (= (and d!60655 res!121957) b!248887))

(declare-fun m!265683 () Bool)

(assert (=> d!60655 m!265683))

(assert (=> d!60655 m!265507))

(assert (=> b!248887 m!265517))

(declare-fun m!265685 () Bool)

(assert (=> b!248887 m!265685))

(assert (=> b!248716 d!60655))

(declare-fun b!248898 () Bool)

(declare-fun e!161439 () Bool)

(declare-fun e!161437 () Bool)

(assert (=> b!248898 (= e!161439 e!161437)))

(declare-fun c!41722 () Bool)

(assert (=> b!248898 (= c!41722 (validKeyInArray!0 (select (arr!5810 lt!124582) #b00000000000000000000000000000000)))))

(declare-fun d!60657 () Bool)

(declare-fun res!121966 () Bool)

(declare-fun e!161440 () Bool)

(assert (=> d!60657 (=> res!121966 e!161440)))

(assert (=> d!60657 (= res!121966 (bvsge #b00000000000000000000000000000000 (size!6153 lt!124582)))))

(assert (=> d!60657 (= (arrayNoDuplicates!0 lt!124582 #b00000000000000000000000000000000 Nil!3627) e!161440)))

(declare-fun bm!23325 () Bool)

(declare-fun call!23328 () Bool)

(assert (=> bm!23325 (= call!23328 (arrayNoDuplicates!0 lt!124582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41722 (Cons!3626 (select (arr!5810 lt!124582) #b00000000000000000000000000000000) Nil!3627) Nil!3627)))))

(declare-fun b!248899 () Bool)

(assert (=> b!248899 (= e!161437 call!23328)))

(declare-fun b!248900 () Bool)

(assert (=> b!248900 (= e!161437 call!23328)))

(declare-fun b!248901 () Bool)

(declare-fun e!161438 () Bool)

(declare-fun contains!1783 (List!3630 (_ BitVec 64)) Bool)

(assert (=> b!248901 (= e!161438 (contains!1783 Nil!3627 (select (arr!5810 lt!124582) #b00000000000000000000000000000000)))))

(declare-fun b!248902 () Bool)

(assert (=> b!248902 (= e!161440 e!161439)))

(declare-fun res!121965 () Bool)

(assert (=> b!248902 (=> (not res!121965) (not e!161439))))

(assert (=> b!248902 (= res!121965 (not e!161438))))

(declare-fun res!121964 () Bool)

(assert (=> b!248902 (=> (not res!121964) (not e!161438))))

(assert (=> b!248902 (= res!121964 (validKeyInArray!0 (select (arr!5810 lt!124582) #b00000000000000000000000000000000)))))

(assert (= (and d!60657 (not res!121966)) b!248902))

(assert (= (and b!248902 res!121964) b!248901))

(assert (= (and b!248902 res!121965) b!248898))

(assert (= (and b!248898 c!41722) b!248899))

(assert (= (and b!248898 (not c!41722)) b!248900))

(assert (= (or b!248899 b!248900) bm!23325))

(assert (=> b!248898 m!265653))

(assert (=> b!248898 m!265653))

(assert (=> b!248898 m!265655))

(assert (=> bm!23325 m!265653))

(declare-fun m!265687 () Bool)

(assert (=> bm!23325 m!265687))

(assert (=> b!248901 m!265653))

(assert (=> b!248901 m!265653))

(declare-fun m!265689 () Bool)

(assert (=> b!248901 m!265689))

(assert (=> b!248902 m!265653))

(assert (=> b!248902 m!265653))

(assert (=> b!248902 m!265655))

(assert (=> b!248716 d!60657))

(declare-fun d!60659 () Bool)

(declare-fun e!161443 () Bool)

(assert (=> d!60659 e!161443))

(declare-fun res!121969 () Bool)

(assert (=> d!60659 (=> (not res!121969) (not e!161443))))

(assert (=> d!60659 (= res!121969 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6153 (_keys!6724 thiss!1504)))))))

(declare-fun lt!124664 () Unit!7672)

(declare-fun choose!41 (array!12249 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3630) Unit!7672)

(assert (=> d!60659 (= lt!124664 (choose!41 (_keys!6724 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3627))))

(assert (=> d!60659 (bvslt (size!6153 (_keys!6724 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60659 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6724 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3627) lt!124664)))

(declare-fun b!248905 () Bool)

(assert (=> b!248905 (= e!161443 (arrayNoDuplicates!0 (array!12250 (store (arr!5810 (_keys!6724 thiss!1504)) index!297 key!932) (size!6153 (_keys!6724 thiss!1504))) #b00000000000000000000000000000000 Nil!3627))))

(assert (= (and d!60659 res!121969) b!248905))

(declare-fun m!265691 () Bool)

(assert (=> d!60659 m!265691))

(assert (=> b!248905 m!265517))

(declare-fun m!265693 () Bool)

(assert (=> b!248905 m!265693))

(assert (=> b!248716 d!60659))

(declare-fun b!248918 () Bool)

(declare-fun c!41729 () Bool)

(declare-fun lt!124673 () (_ BitVec 64))

(assert (=> b!248918 (= c!41729 (= lt!124673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161451 () SeekEntryResult!1078)

(declare-fun e!161452 () SeekEntryResult!1078)

(assert (=> b!248918 (= e!161451 e!161452)))

(declare-fun b!248919 () Bool)

(declare-fun lt!124672 () SeekEntryResult!1078)

(assert (=> b!248919 (= e!161452 (MissingZero!1078 (index!6484 lt!124672)))))

(declare-fun b!248920 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12249 (_ BitVec 32)) SeekEntryResult!1078)

(assert (=> b!248920 (= e!161452 (seekKeyOrZeroReturnVacant!0 (x!24558 lt!124672) (index!6484 lt!124672) (index!6484 lt!124672) key!932 (_keys!6724 thiss!1504) (mask!10752 thiss!1504)))))

(declare-fun b!248921 () Bool)

(declare-fun e!161450 () SeekEntryResult!1078)

(assert (=> b!248921 (= e!161450 Undefined!1078)))

(declare-fun b!248922 () Bool)

(assert (=> b!248922 (= e!161450 e!161451)))

(assert (=> b!248922 (= lt!124673 (select (arr!5810 (_keys!6724 thiss!1504)) (index!6484 lt!124672)))))

(declare-fun c!41730 () Bool)

(assert (=> b!248922 (= c!41730 (= lt!124673 key!932))))

(declare-fun b!248923 () Bool)

(assert (=> b!248923 (= e!161451 (Found!1078 (index!6484 lt!124672)))))

(declare-fun d!60661 () Bool)

(declare-fun lt!124671 () SeekEntryResult!1078)

(assert (=> d!60661 (and (or ((_ is Undefined!1078) lt!124671) (not ((_ is Found!1078) lt!124671)) (and (bvsge (index!6483 lt!124671) #b00000000000000000000000000000000) (bvslt (index!6483 lt!124671) (size!6153 (_keys!6724 thiss!1504))))) (or ((_ is Undefined!1078) lt!124671) ((_ is Found!1078) lt!124671) (not ((_ is MissingZero!1078) lt!124671)) (and (bvsge (index!6482 lt!124671) #b00000000000000000000000000000000) (bvslt (index!6482 lt!124671) (size!6153 (_keys!6724 thiss!1504))))) (or ((_ is Undefined!1078) lt!124671) ((_ is Found!1078) lt!124671) ((_ is MissingZero!1078) lt!124671) (not ((_ is MissingVacant!1078) lt!124671)) (and (bvsge (index!6485 lt!124671) #b00000000000000000000000000000000) (bvslt (index!6485 lt!124671) (size!6153 (_keys!6724 thiss!1504))))) (or ((_ is Undefined!1078) lt!124671) (ite ((_ is Found!1078) lt!124671) (= (select (arr!5810 (_keys!6724 thiss!1504)) (index!6483 lt!124671)) key!932) (ite ((_ is MissingZero!1078) lt!124671) (= (select (arr!5810 (_keys!6724 thiss!1504)) (index!6482 lt!124671)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1078) lt!124671) (= (select (arr!5810 (_keys!6724 thiss!1504)) (index!6485 lt!124671)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60661 (= lt!124671 e!161450)))

(declare-fun c!41731 () Bool)

(assert (=> d!60661 (= c!41731 (and ((_ is Intermediate!1078) lt!124672) (undefined!1890 lt!124672)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12249 (_ BitVec 32)) SeekEntryResult!1078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60661 (= lt!124672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10752 thiss!1504)) key!932 (_keys!6724 thiss!1504) (mask!10752 thiss!1504)))))

(assert (=> d!60661 (validMask!0 (mask!10752 thiss!1504))))

(assert (=> d!60661 (= (seekEntryOrOpen!0 key!932 (_keys!6724 thiss!1504) (mask!10752 thiss!1504)) lt!124671)))

(assert (= (and d!60661 c!41731) b!248921))

(assert (= (and d!60661 (not c!41731)) b!248922))

(assert (= (and b!248922 c!41730) b!248923))

(assert (= (and b!248922 (not c!41730)) b!248918))

(assert (= (and b!248918 c!41729) b!248919))

(assert (= (and b!248918 (not c!41729)) b!248920))

(declare-fun m!265695 () Bool)

(assert (=> b!248920 m!265695))

(declare-fun m!265697 () Bool)

(assert (=> b!248922 m!265697))

(declare-fun m!265699 () Bool)

(assert (=> d!60661 m!265699))

(declare-fun m!265701 () Bool)

(assert (=> d!60661 m!265701))

(assert (=> d!60661 m!265507))

(declare-fun m!265703 () Bool)

(assert (=> d!60661 m!265703))

(declare-fun m!265705 () Bool)

(assert (=> d!60661 m!265705))

(declare-fun m!265707 () Bool)

(assert (=> d!60661 m!265707))

(assert (=> d!60661 m!265705))

(assert (=> b!248717 d!60661))

(declare-fun d!60663 () Bool)

(assert (=> d!60663 (contains!1781 (getCurrentListMap!1381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) key!932)))

(declare-fun lt!124676 () Unit!7672)

(declare-fun choose!1177 (array!12249 array!12247 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) (_ BitVec 32) Int) Unit!7672)

(assert (=> d!60663 (= lt!124676 (choose!1177 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(assert (=> d!60663 (validMask!0 (mask!10752 thiss!1504))))

(assert (=> d!60663 (= (lemmaArrayContainsKeyThenInListMap!206 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) lt!124676)))

(declare-fun bs!8958 () Bool)

(assert (= bs!8958 d!60663))

(assert (=> bs!8958 m!265529))

(assert (=> bs!8958 m!265529))

(assert (=> bs!8958 m!265531))

(declare-fun m!265709 () Bool)

(assert (=> bs!8958 m!265709))

(assert (=> bs!8958 m!265507))

(assert (=> b!248712 d!60663))

(declare-fun b!248940 () Bool)

(declare-fun e!161461 () Bool)

(declare-fun e!161464 () Bool)

(assert (=> b!248940 (= e!161461 e!161464)))

(declare-fun res!121980 () Bool)

(declare-fun call!23333 () Bool)

(assert (=> b!248940 (= res!121980 call!23333)))

(assert (=> b!248940 (=> (not res!121980) (not e!161464))))

(declare-fun b!248941 () Bool)

(declare-fun res!121979 () Bool)

(declare-fun e!161462 () Bool)

(assert (=> b!248941 (=> (not res!121979) (not e!161462))))

(declare-fun lt!124681 () SeekEntryResult!1078)

(assert (=> b!248941 (= res!121979 (= (select (arr!5810 (_keys!6724 thiss!1504)) (index!6485 lt!124681)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248941 (and (bvsge (index!6485 lt!124681) #b00000000000000000000000000000000) (bvslt (index!6485 lt!124681) (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun b!248942 () Bool)

(declare-fun res!121981 () Bool)

(assert (=> b!248942 (=> (not res!121981) (not e!161462))))

(assert (=> b!248942 (= res!121981 call!23333)))

(declare-fun e!161463 () Bool)

(assert (=> b!248942 (= e!161463 e!161462)))

(declare-fun b!248943 () Bool)

(assert (=> b!248943 (= e!161463 ((_ is Undefined!1078) lt!124681))))

(declare-fun c!41736 () Bool)

(declare-fun bm!23330 () Bool)

(assert (=> bm!23330 (= call!23333 (inRange!0 (ite c!41736 (index!6482 lt!124681) (index!6485 lt!124681)) (mask!10752 thiss!1504)))))

(declare-fun b!248945 () Bool)

(declare-fun call!23334 () Bool)

(assert (=> b!248945 (= e!161464 (not call!23334))))

(declare-fun bm!23331 () Bool)

(assert (=> bm!23331 (= call!23334 (arrayContainsKey!0 (_keys!6724 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248946 () Bool)

(assert (=> b!248946 (= e!161461 e!161463)))

(declare-fun c!41737 () Bool)

(assert (=> b!248946 (= c!41737 ((_ is MissingVacant!1078) lt!124681))))

(declare-fun b!248947 () Bool)

(assert (=> b!248947 (= e!161462 (not call!23334))))

(declare-fun d!60665 () Bool)

(assert (=> d!60665 e!161461))

(assert (=> d!60665 (= c!41736 ((_ is MissingZero!1078) lt!124681))))

(assert (=> d!60665 (= lt!124681 (seekEntryOrOpen!0 key!932 (_keys!6724 thiss!1504) (mask!10752 thiss!1504)))))

(declare-fun lt!124682 () Unit!7672)

(declare-fun choose!1178 (array!12249 array!12247 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7672)

(assert (=> d!60665 (= lt!124682 (choose!1178 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> d!60665 (validMask!0 (mask!10752 thiss!1504))))

(assert (=> d!60665 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)) lt!124682)))

(declare-fun b!248944 () Bool)

(assert (=> b!248944 (and (bvsge (index!6482 lt!124681) #b00000000000000000000000000000000) (bvslt (index!6482 lt!124681) (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun res!121978 () Bool)

(assert (=> b!248944 (= res!121978 (= (select (arr!5810 (_keys!6724 thiss!1504)) (index!6482 lt!124681)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248944 (=> (not res!121978) (not e!161464))))

(assert (= (and d!60665 c!41736) b!248940))

(assert (= (and d!60665 (not c!41736)) b!248946))

(assert (= (and b!248940 res!121980) b!248944))

(assert (= (and b!248944 res!121978) b!248945))

(assert (= (and b!248946 c!41737) b!248942))

(assert (= (and b!248946 (not c!41737)) b!248943))

(assert (= (and b!248942 res!121981) b!248941))

(assert (= (and b!248941 res!121979) b!248947))

(assert (= (or b!248940 b!248942) bm!23330))

(assert (= (or b!248945 b!248947) bm!23331))

(assert (=> bm!23331 m!265509))

(assert (=> d!60665 m!265547))

(declare-fun m!265711 () Bool)

(assert (=> d!60665 m!265711))

(assert (=> d!60665 m!265507))

(declare-fun m!265713 () Bool)

(assert (=> bm!23330 m!265713))

(declare-fun m!265715 () Bool)

(assert (=> b!248944 m!265715))

(declare-fun m!265717 () Bool)

(assert (=> b!248941 m!265717))

(assert (=> b!248718 d!60665))

(declare-fun d!60667 () Bool)

(assert (=> d!60667 (= (array_inv!3817 (_keys!6724 thiss!1504)) (bvsge (size!6153 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248713 d!60667))

(declare-fun d!60669 () Bool)

(assert (=> d!60669 (= (array_inv!3818 (_values!4581 thiss!1504)) (bvsge (size!6152 (_values!4581 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248713 d!60669))

(declare-fun d!60671 () Bool)

(declare-fun e!161467 () Bool)

(assert (=> d!60671 e!161467))

(declare-fun res!121987 () Bool)

(assert (=> d!60671 (=> (not res!121987) (not e!161467))))

(declare-fun lt!124688 () SeekEntryResult!1078)

(assert (=> d!60671 (= res!121987 ((_ is Found!1078) lt!124688))))

(assert (=> d!60671 (= lt!124688 (seekEntryOrOpen!0 key!932 (_keys!6724 thiss!1504) (mask!10752 thiss!1504)))))

(declare-fun lt!124687 () Unit!7672)

(declare-fun choose!1179 (array!12249 array!12247 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7672)

(assert (=> d!60671 (= lt!124687 (choose!1179 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> d!60671 (validMask!0 (mask!10752 thiss!1504))))

(assert (=> d!60671 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!385 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)) lt!124687)))

(declare-fun b!248952 () Bool)

(declare-fun res!121986 () Bool)

(assert (=> b!248952 (=> (not res!121986) (not e!161467))))

(assert (=> b!248952 (= res!121986 (inRange!0 (index!6483 lt!124688) (mask!10752 thiss!1504)))))

(declare-fun b!248953 () Bool)

(assert (=> b!248953 (= e!161467 (= (select (arr!5810 (_keys!6724 thiss!1504)) (index!6483 lt!124688)) key!932))))

(assert (=> b!248953 (and (bvsge (index!6483 lt!124688) #b00000000000000000000000000000000) (bvslt (index!6483 lt!124688) (size!6153 (_keys!6724 thiss!1504))))))

(assert (= (and d!60671 res!121987) b!248952))

(assert (= (and b!248952 res!121986) b!248953))

(assert (=> d!60671 m!265547))

(declare-fun m!265719 () Bool)

(assert (=> d!60671 m!265719))

(assert (=> d!60671 m!265507))

(declare-fun m!265721 () Bool)

(assert (=> b!248952 m!265721))

(declare-fun m!265723 () Bool)

(assert (=> b!248953 m!265723))

(assert (=> b!248714 d!60671))

(declare-fun d!60673 () Bool)

(declare-fun res!121994 () Bool)

(declare-fun e!161470 () Bool)

(assert (=> d!60673 (=> (not res!121994) (not e!161470))))

(declare-fun simpleValid!260 (LongMapFixedSize!3682) Bool)

(assert (=> d!60673 (= res!121994 (simpleValid!260 thiss!1504))))

(assert (=> d!60673 (= (valid!1450 thiss!1504) e!161470)))

(declare-fun b!248960 () Bool)

(declare-fun res!121995 () Bool)

(assert (=> b!248960 (=> (not res!121995) (not e!161470))))

(assert (=> b!248960 (= res!121995 (= (arrayCountValidKeys!0 (_keys!6724 thiss!1504) #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) (_size!1890 thiss!1504)))))

(declare-fun b!248961 () Bool)

(declare-fun res!121996 () Bool)

(assert (=> b!248961 (=> (not res!121996) (not e!161470))))

(assert (=> b!248961 (= res!121996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6724 thiss!1504) (mask!10752 thiss!1504)))))

(declare-fun b!248962 () Bool)

(assert (=> b!248962 (= e!161470 (arrayNoDuplicates!0 (_keys!6724 thiss!1504) #b00000000000000000000000000000000 Nil!3627))))

(assert (= (and d!60673 res!121994) b!248960))

(assert (= (and b!248960 res!121995) b!248961))

(assert (= (and b!248961 res!121996) b!248962))

(declare-fun m!265725 () Bool)

(assert (=> d!60673 m!265725))

(assert (=> b!248960 m!265519))

(declare-fun m!265727 () Bool)

(assert (=> b!248961 m!265727))

(declare-fun m!265729 () Bool)

(assert (=> b!248962 m!265729))

(assert (=> start!23664 d!60673))

(declare-fun d!60675 () Bool)

(assert (=> d!60675 (= (inRange!0 index!297 (mask!10752 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10752 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!248710 d!60675))

(declare-fun d!60677 () Bool)

(declare-fun e!161476 () Bool)

(assert (=> d!60677 e!161476))

(declare-fun res!121999 () Bool)

(assert (=> d!60677 (=> res!121999 e!161476)))

(declare-fun lt!124698 () Bool)

(assert (=> d!60677 (= res!121999 (not lt!124698))))

(declare-fun lt!124697 () Bool)

(assert (=> d!60677 (= lt!124698 lt!124697)))

(declare-fun lt!124699 () Unit!7672)

(declare-fun e!161475 () Unit!7672)

(assert (=> d!60677 (= lt!124699 e!161475)))

(declare-fun c!41740 () Bool)

(assert (=> d!60677 (= c!41740 lt!124697)))

(declare-fun containsKey!287 (List!3629 (_ BitVec 64)) Bool)

(assert (=> d!60677 (= lt!124697 (containsKey!287 (toList!1849 (getCurrentListMap!1381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504))) key!932))))

(assert (=> d!60677 (= (contains!1781 (getCurrentListMap!1381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) key!932) lt!124698)))

(declare-fun b!248969 () Bool)

(declare-fun lt!124700 () Unit!7672)

(assert (=> b!248969 (= e!161475 lt!124700)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!235 (List!3629 (_ BitVec 64)) Unit!7672)

(assert (=> b!248969 (= lt!124700 (lemmaContainsKeyImpliesGetValueByKeyDefined!235 (toList!1849 (getCurrentListMap!1381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504))) key!932))))

(declare-datatypes ((Option!302 0))(
  ( (Some!301 (v!5343 V!8273)) (None!300) )
))
(declare-fun isDefined!236 (Option!302) Bool)

(declare-fun getValueByKey!296 (List!3629 (_ BitVec 64)) Option!302)

(assert (=> b!248969 (isDefined!236 (getValueByKey!296 (toList!1849 (getCurrentListMap!1381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504))) key!932))))

(declare-fun b!248970 () Bool)

(declare-fun Unit!7681 () Unit!7672)

(assert (=> b!248970 (= e!161475 Unit!7681)))

(declare-fun b!248971 () Bool)

(assert (=> b!248971 (= e!161476 (isDefined!236 (getValueByKey!296 (toList!1849 (getCurrentListMap!1381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504))) key!932)))))

(assert (= (and d!60677 c!41740) b!248969))

(assert (= (and d!60677 (not c!41740)) b!248970))

(assert (= (and d!60677 (not res!121999)) b!248971))

(declare-fun m!265731 () Bool)

(assert (=> d!60677 m!265731))

(declare-fun m!265733 () Bool)

(assert (=> b!248969 m!265733))

(declare-fun m!265735 () Bool)

(assert (=> b!248969 m!265735))

(assert (=> b!248969 m!265735))

(declare-fun m!265737 () Bool)

(assert (=> b!248969 m!265737))

(assert (=> b!248971 m!265735))

(assert (=> b!248971 m!265735))

(assert (=> b!248971 m!265737))

(assert (=> b!248710 d!60677))

(declare-fun b!249014 () Bool)

(declare-fun c!41758 () Bool)

(assert (=> b!249014 (= c!41758 (and (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!161514 () ListLongMap!3667)

(declare-fun e!161510 () ListLongMap!3667)

(assert (=> b!249014 (= e!161514 e!161510)))

(declare-fun bm!23346 () Bool)

(declare-fun call!23355 () Bool)

(declare-fun lt!124753 () ListLongMap!3667)

(assert (=> bm!23346 (= call!23355 (contains!1781 lt!124753 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249015 () Bool)

(declare-fun e!161505 () Bool)

(declare-fun e!161506 () Bool)

(assert (=> b!249015 (= e!161505 e!161506)))

(declare-fun c!41754 () Bool)

(assert (=> b!249015 (= c!41754 (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23347 () Bool)

(declare-fun call!23351 () ListLongMap!3667)

(declare-fun getCurrentListMapNoExtraKeys!553 (array!12249 array!12247 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 32) Int) ListLongMap!3667)

(assert (=> bm!23347 (= call!23351 (getCurrentListMapNoExtraKeys!553 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun bm!23348 () Bool)

(declare-fun call!23353 () ListLongMap!3667)

(declare-fun call!23352 () ListLongMap!3667)

(assert (=> bm!23348 (= call!23353 call!23352)))

(declare-fun b!249016 () Bool)

(declare-fun e!161512 () ListLongMap!3667)

(declare-fun +!664 (ListLongMap!3667 tuple2!4752) ListLongMap!3667)

(assert (=> b!249016 (= e!161512 (+!664 call!23352 (tuple2!4753 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4439 thiss!1504))))))

(declare-fun bm!23349 () Bool)

(declare-fun call!23354 () ListLongMap!3667)

(assert (=> bm!23349 (= call!23354 call!23351)))

(declare-fun b!249017 () Bool)

(declare-fun e!161503 () Bool)

(declare-fun e!161511 () Bool)

(assert (=> b!249017 (= e!161503 e!161511)))

(declare-fun res!122018 () Bool)

(assert (=> b!249017 (=> (not res!122018) (not e!161511))))

(assert (=> b!249017 (= res!122018 (contains!1781 lt!124753 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun b!249018 () Bool)

(declare-fun e!161504 () Bool)

(declare-fun apply!237 (ListLongMap!3667 (_ BitVec 64)) V!8273)

(assert (=> b!249018 (= e!161504 (= (apply!237 lt!124753 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4439 thiss!1504)))))

(declare-fun bm!23350 () Bool)

(declare-fun call!23349 () Bool)

(assert (=> bm!23350 (= call!23349 (contains!1781 lt!124753 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249019 () Bool)

(declare-fun get!2988 (ValueCell!2891 V!8273) V!8273)

(declare-fun dynLambda!580 (Int (_ BitVec 64)) V!8273)

(assert (=> b!249019 (= e!161511 (= (apply!237 lt!124753 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000)) (get!2988 (select (arr!5809 (_values!4581 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!580 (defaultEntry!4598 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6152 (_values!4581 thiss!1504))))))

(assert (=> b!249019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun b!249020 () Bool)

(declare-fun e!161509 () Unit!7672)

(declare-fun Unit!7682 () Unit!7672)

(assert (=> b!249020 (= e!161509 Unit!7682)))

(declare-fun b!249021 () Bool)

(declare-fun e!161508 () Bool)

(assert (=> b!249021 (= e!161506 e!161508)))

(declare-fun res!122024 () Bool)

(assert (=> b!249021 (= res!122024 call!23349)))

(assert (=> b!249021 (=> (not res!122024) (not e!161508))))

(declare-fun bm!23351 () Bool)

(declare-fun call!23350 () ListLongMap!3667)

(assert (=> bm!23351 (= call!23350 call!23354)))

(declare-fun b!249022 () Bool)

(assert (=> b!249022 (= e!161512 e!161514)))

(declare-fun c!41753 () Bool)

(assert (=> b!249022 (= c!41753 (and (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!249023 () Bool)

(declare-fun res!122021 () Bool)

(assert (=> b!249023 (=> (not res!122021) (not e!161505))))

(assert (=> b!249023 (= res!122021 e!161503)))

(declare-fun res!122020 () Bool)

(assert (=> b!249023 (=> res!122020 e!161503)))

(declare-fun e!161515 () Bool)

(assert (=> b!249023 (= res!122020 (not e!161515))))

(declare-fun res!122025 () Bool)

(assert (=> b!249023 (=> (not res!122025) (not e!161515))))

(assert (=> b!249023 (= res!122025 (bvslt #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))))))

(declare-fun b!249024 () Bool)

(declare-fun e!161507 () Bool)

(assert (=> b!249024 (= e!161507 (not call!23355))))

(declare-fun b!249026 () Bool)

(declare-fun lt!124751 () Unit!7672)

(assert (=> b!249026 (= e!161509 lt!124751)))

(declare-fun lt!124747 () ListLongMap!3667)

(assert (=> b!249026 (= lt!124747 (getCurrentListMapNoExtraKeys!553 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun lt!124762 () (_ BitVec 64))

(assert (=> b!249026 (= lt!124762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124752 () (_ BitVec 64))

(assert (=> b!249026 (= lt!124752 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124755 () Unit!7672)

(declare-fun addStillContains!213 (ListLongMap!3667 (_ BitVec 64) V!8273 (_ BitVec 64)) Unit!7672)

(assert (=> b!249026 (= lt!124755 (addStillContains!213 lt!124747 lt!124762 (zeroValue!4439 thiss!1504) lt!124752))))

(assert (=> b!249026 (contains!1781 (+!664 lt!124747 (tuple2!4753 lt!124762 (zeroValue!4439 thiss!1504))) lt!124752)))

(declare-fun lt!124765 () Unit!7672)

(assert (=> b!249026 (= lt!124765 lt!124755)))

(declare-fun lt!124758 () ListLongMap!3667)

(assert (=> b!249026 (= lt!124758 (getCurrentListMapNoExtraKeys!553 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun lt!124748 () (_ BitVec 64))

(assert (=> b!249026 (= lt!124748 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124746 () (_ BitVec 64))

(assert (=> b!249026 (= lt!124746 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124749 () Unit!7672)

(declare-fun addApplyDifferent!213 (ListLongMap!3667 (_ BitVec 64) V!8273 (_ BitVec 64)) Unit!7672)

(assert (=> b!249026 (= lt!124749 (addApplyDifferent!213 lt!124758 lt!124748 (minValue!4439 thiss!1504) lt!124746))))

(assert (=> b!249026 (= (apply!237 (+!664 lt!124758 (tuple2!4753 lt!124748 (minValue!4439 thiss!1504))) lt!124746) (apply!237 lt!124758 lt!124746))))

(declare-fun lt!124764 () Unit!7672)

(assert (=> b!249026 (= lt!124764 lt!124749)))

(declare-fun lt!124759 () ListLongMap!3667)

(assert (=> b!249026 (= lt!124759 (getCurrentListMapNoExtraKeys!553 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun lt!124760 () (_ BitVec 64))

(assert (=> b!249026 (= lt!124760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124750 () (_ BitVec 64))

(assert (=> b!249026 (= lt!124750 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124757 () Unit!7672)

(assert (=> b!249026 (= lt!124757 (addApplyDifferent!213 lt!124759 lt!124760 (zeroValue!4439 thiss!1504) lt!124750))))

(assert (=> b!249026 (= (apply!237 (+!664 lt!124759 (tuple2!4753 lt!124760 (zeroValue!4439 thiss!1504))) lt!124750) (apply!237 lt!124759 lt!124750))))

(declare-fun lt!124754 () Unit!7672)

(assert (=> b!249026 (= lt!124754 lt!124757)))

(declare-fun lt!124766 () ListLongMap!3667)

(assert (=> b!249026 (= lt!124766 (getCurrentListMapNoExtraKeys!553 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(declare-fun lt!124761 () (_ BitVec 64))

(assert (=> b!249026 (= lt!124761 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124763 () (_ BitVec 64))

(assert (=> b!249026 (= lt!124763 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249026 (= lt!124751 (addApplyDifferent!213 lt!124766 lt!124761 (minValue!4439 thiss!1504) lt!124763))))

(assert (=> b!249026 (= (apply!237 (+!664 lt!124766 (tuple2!4753 lt!124761 (minValue!4439 thiss!1504))) lt!124763) (apply!237 lt!124766 lt!124763))))

(declare-fun b!249027 () Bool)

(assert (=> b!249027 (= e!161507 e!161504)))

(declare-fun res!122026 () Bool)

(assert (=> b!249027 (= res!122026 call!23355)))

(assert (=> b!249027 (=> (not res!122026) (not e!161504))))

(declare-fun b!249028 () Bool)

(assert (=> b!249028 (= e!161515 (validKeyInArray!0 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249029 () Bool)

(assert (=> b!249029 (= e!161510 call!23350)))

(declare-fun b!249030 () Bool)

(assert (=> b!249030 (= e!161510 call!23353)))

(declare-fun b!249031 () Bool)

(assert (=> b!249031 (= e!161506 (not call!23349))))

(declare-fun b!249032 () Bool)

(declare-fun e!161513 () Bool)

(assert (=> b!249032 (= e!161513 (validKeyInArray!0 (select (arr!5810 (_keys!6724 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23352 () Bool)

(declare-fun c!41755 () Bool)

(assert (=> bm!23352 (= call!23352 (+!664 (ite c!41755 call!23351 (ite c!41753 call!23354 call!23350)) (ite (or c!41755 c!41753) (tuple2!4753 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4439 thiss!1504)) (tuple2!4753 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4439 thiss!1504)))))))

(declare-fun b!249033 () Bool)

(assert (=> b!249033 (= e!161514 call!23353)))

(declare-fun b!249034 () Bool)

(declare-fun res!122023 () Bool)

(assert (=> b!249034 (=> (not res!122023) (not e!161505))))

(assert (=> b!249034 (= res!122023 e!161507)))

(declare-fun c!41756 () Bool)

(assert (=> b!249034 (= c!41756 (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!249025 () Bool)

(assert (=> b!249025 (= e!161508 (= (apply!237 lt!124753 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4439 thiss!1504)))))

(declare-fun d!60679 () Bool)

(assert (=> d!60679 e!161505))

(declare-fun res!122022 () Bool)

(assert (=> d!60679 (=> (not res!122022) (not e!161505))))

(assert (=> d!60679 (= res!122022 (or (bvsge #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))))))))

(declare-fun lt!124756 () ListLongMap!3667)

(assert (=> d!60679 (= lt!124753 lt!124756)))

(declare-fun lt!124745 () Unit!7672)

(assert (=> d!60679 (= lt!124745 e!161509)))

(declare-fun c!41757 () Bool)

(assert (=> d!60679 (= c!41757 e!161513)))

(declare-fun res!122019 () Bool)

(assert (=> d!60679 (=> (not res!122019) (not e!161513))))

(assert (=> d!60679 (= res!122019 (bvslt #b00000000000000000000000000000000 (size!6153 (_keys!6724 thiss!1504))))))

(assert (=> d!60679 (= lt!124756 e!161512)))

(assert (=> d!60679 (= c!41755 (and (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4335 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60679 (validMask!0 (mask!10752 thiss!1504))))

(assert (=> d!60679 (= (getCurrentListMap!1381 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) lt!124753)))

(assert (= (and d!60679 c!41755) b!249016))

(assert (= (and d!60679 (not c!41755)) b!249022))

(assert (= (and b!249022 c!41753) b!249033))

(assert (= (and b!249022 (not c!41753)) b!249014))

(assert (= (and b!249014 c!41758) b!249030))

(assert (= (and b!249014 (not c!41758)) b!249029))

(assert (= (or b!249030 b!249029) bm!23351))

(assert (= (or b!249033 bm!23351) bm!23349))

(assert (= (or b!249033 b!249030) bm!23348))

(assert (= (or b!249016 bm!23349) bm!23347))

(assert (= (or b!249016 bm!23348) bm!23352))

(assert (= (and d!60679 res!122019) b!249032))

(assert (= (and d!60679 c!41757) b!249026))

(assert (= (and d!60679 (not c!41757)) b!249020))

(assert (= (and d!60679 res!122022) b!249023))

(assert (= (and b!249023 res!122025) b!249028))

(assert (= (and b!249023 (not res!122020)) b!249017))

(assert (= (and b!249017 res!122018) b!249019))

(assert (= (and b!249023 res!122021) b!249034))

(assert (= (and b!249034 c!41756) b!249027))

(assert (= (and b!249034 (not c!41756)) b!249024))

(assert (= (and b!249027 res!122026) b!249018))

(assert (= (or b!249027 b!249024) bm!23346))

(assert (= (and b!249034 res!122023) b!249015))

(assert (= (and b!249015 c!41754) b!249021))

(assert (= (and b!249015 (not c!41754)) b!249031))

(assert (= (and b!249021 res!122024) b!249025))

(assert (= (or b!249021 b!249031) bm!23350))

(declare-fun b_lambda!8081 () Bool)

(assert (=> (not b_lambda!8081) (not b!249019)))

(declare-fun t!8653 () Bool)

(declare-fun tb!2979 () Bool)

(assert (=> (and b!248713 (= (defaultEntry!4598 thiss!1504) (defaultEntry!4598 thiss!1504)) t!8653) tb!2979))

(declare-fun result!5275 () Bool)

(assert (=> tb!2979 (= result!5275 tp_is_empty!6469)))

(assert (=> b!249019 t!8653))

(declare-fun b_and!13633 () Bool)

(assert (= b_and!13627 (and (=> t!8653 result!5275) b_and!13633)))

(declare-fun m!265739 () Bool)

(assert (=> bm!23350 m!265739))

(declare-fun m!265741 () Bool)

(assert (=> b!249019 m!265741))

(declare-fun m!265743 () Bool)

(assert (=> b!249019 m!265743))

(assert (=> b!249019 m!265741))

(declare-fun m!265745 () Bool)

(assert (=> b!249019 m!265745))

(assert (=> b!249019 m!265743))

(assert (=> b!249019 m!265669))

(assert (=> b!249019 m!265669))

(declare-fun m!265747 () Bool)

(assert (=> b!249019 m!265747))

(assert (=> b!249032 m!265669))

(assert (=> b!249032 m!265669))

(assert (=> b!249032 m!265671))

(assert (=> d!60679 m!265507))

(declare-fun m!265749 () Bool)

(assert (=> b!249016 m!265749))

(declare-fun m!265751 () Bool)

(assert (=> bm!23346 m!265751))

(assert (=> b!249028 m!265669))

(assert (=> b!249028 m!265669))

(assert (=> b!249028 m!265671))

(declare-fun m!265753 () Bool)

(assert (=> bm!23352 m!265753))

(declare-fun m!265755 () Bool)

(assert (=> b!249018 m!265755))

(declare-fun m!265757 () Bool)

(assert (=> bm!23347 m!265757))

(declare-fun m!265759 () Bool)

(assert (=> b!249025 m!265759))

(assert (=> b!249017 m!265669))

(assert (=> b!249017 m!265669))

(declare-fun m!265761 () Bool)

(assert (=> b!249017 m!265761))

(declare-fun m!265763 () Bool)

(assert (=> b!249026 m!265763))

(declare-fun m!265765 () Bool)

(assert (=> b!249026 m!265765))

(declare-fun m!265767 () Bool)

(assert (=> b!249026 m!265767))

(declare-fun m!265769 () Bool)

(assert (=> b!249026 m!265769))

(declare-fun m!265771 () Bool)

(assert (=> b!249026 m!265771))

(assert (=> b!249026 m!265757))

(declare-fun m!265773 () Bool)

(assert (=> b!249026 m!265773))

(declare-fun m!265775 () Bool)

(assert (=> b!249026 m!265775))

(declare-fun m!265777 () Bool)

(assert (=> b!249026 m!265777))

(declare-fun m!265779 () Bool)

(assert (=> b!249026 m!265779))

(declare-fun m!265781 () Bool)

(assert (=> b!249026 m!265781))

(assert (=> b!249026 m!265767))

(declare-fun m!265783 () Bool)

(assert (=> b!249026 m!265783))

(assert (=> b!249026 m!265779))

(declare-fun m!265785 () Bool)

(assert (=> b!249026 m!265785))

(declare-fun m!265787 () Bool)

(assert (=> b!249026 m!265787))

(assert (=> b!249026 m!265669))

(assert (=> b!249026 m!265775))

(assert (=> b!249026 m!265785))

(declare-fun m!265789 () Bool)

(assert (=> b!249026 m!265789))

(declare-fun m!265791 () Bool)

(assert (=> b!249026 m!265791))

(assert (=> b!248710 d!60679))

(declare-fun d!60681 () Bool)

(assert (=> d!60681 (= (inRange!0 (ite c!41683 (index!6482 lt!124573) (index!6485 lt!124573)) (mask!10752 thiss!1504)) (and (bvsge (ite c!41683 (index!6482 lt!124573) (index!6485 lt!124573)) #b00000000000000000000000000000000) (bvslt (ite c!41683 (index!6482 lt!124573) (index!6485 lt!124573)) (bvadd (mask!10752 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23302 d!60681))

(assert (=> bm!23303 d!60653))

(declare-fun b!249044 () Bool)

(declare-fun e!161520 () Bool)

(assert (=> b!249044 (= e!161520 tp_is_empty!6469)))

(declare-fun b!249043 () Bool)

(declare-fun e!161521 () Bool)

(assert (=> b!249043 (= e!161521 tp_is_empty!6469)))

(declare-fun mapIsEmpty!10994 () Bool)

(declare-fun mapRes!10994 () Bool)

(assert (=> mapIsEmpty!10994 mapRes!10994))

(declare-fun condMapEmpty!10994 () Bool)

(declare-fun mapDefault!10994 () ValueCell!2891)

(assert (=> mapNonEmpty!10985 (= condMapEmpty!10994 (= mapRest!10985 ((as const (Array (_ BitVec 32) ValueCell!2891)) mapDefault!10994)))))

(assert (=> mapNonEmpty!10985 (= tp!23074 (and e!161520 mapRes!10994))))

(declare-fun mapNonEmpty!10994 () Bool)

(declare-fun tp!23090 () Bool)

(assert (=> mapNonEmpty!10994 (= mapRes!10994 (and tp!23090 e!161521))))

(declare-fun mapKey!10994 () (_ BitVec 32))

(declare-fun mapRest!10994 () (Array (_ BitVec 32) ValueCell!2891))

(declare-fun mapValue!10994 () ValueCell!2891)

(assert (=> mapNonEmpty!10994 (= mapRest!10985 (store mapRest!10994 mapKey!10994 mapValue!10994))))

(assert (= (and mapNonEmpty!10985 condMapEmpty!10994) mapIsEmpty!10994))

(assert (= (and mapNonEmpty!10985 (not condMapEmpty!10994)) mapNonEmpty!10994))

(assert (= (and mapNonEmpty!10994 ((_ is ValueCellFull!2891) mapValue!10994)) b!249043))

(assert (= (and mapNonEmpty!10985 ((_ is ValueCellFull!2891) mapDefault!10994)) b!249044))

(declare-fun m!265793 () Bool)

(assert (=> mapNonEmpty!10994 m!265793))

(declare-fun b_lambda!8083 () Bool)

(assert (= b_lambda!8081 (or (and b!248713 b_free!6607) b_lambda!8083)))

(check-sat (not b!248862) (not bm!23318) (not d!60679) (not b!249018) (not d!60665) (not b!248961) (not d!60659) (not bm!23352) (not d!60671) (not b!248848) (not mapNonEmpty!10994) (not b!249026) (not b!248905) (not d!60677) (not b!248860) (not b!248962) (not d!60645) (not b_lambda!8083) (not bm!23331) (not bm!23347) (not b!249025) (not bm!23322) (not b!248902) (not b!248887) (not b!248859) (not b!248971) (not b!249032) (not bm!23330) (not b!249017) (not d!60655) (not b!249019) (not b!248901) b_and!13633 (not d!60663) (not b!248952) tp_is_empty!6469 (not bm!23346) (not b!248864) (not bm!23350) (not b!249028) (not bm!23319) (not d!60661) (not b!248876) (not b_next!6607) (not b!248920) (not b!248969) (not b!249016) (not b!248877) (not d!60673) (not b!248960) (not bm!23325) (not b!248898) (not b!248884))
(check-sat b_and!13633 (not b_next!6607))
