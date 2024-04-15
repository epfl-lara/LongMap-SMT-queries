; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22022 () Bool)

(assert start!22022)

(declare-fun b!226706 () Bool)

(declare-fun b_free!6085 () Bool)

(declare-fun b_next!6085 () Bool)

(assert (=> b!226706 (= b_free!6085 (not b_next!6085))))

(declare-fun tp!21396 () Bool)

(declare-fun b_and!12957 () Bool)

(assert (=> b!226706 (= tp!21396 b_and!12957)))

(declare-fun b!226701 () Bool)

(declare-fun res!111584 () Bool)

(declare-fun e!147064 () Bool)

(assert (=> b!226701 (=> (not res!111584) (not e!147064))))

(declare-datatypes ((V!7577 0))(
  ( (V!7578 (val!3018 Int)) )
))
(declare-datatypes ((ValueCell!2630 0))(
  ( (ValueCellFull!2630 (v!5032 V!7577)) (EmptyCell!2630) )
))
(declare-datatypes ((array!11129 0))(
  ( (array!11130 (arr!5283 (Array (_ BitVec 32) ValueCell!2630)) (size!5617 (_ BitVec 32))) )
))
(declare-datatypes ((array!11131 0))(
  ( (array!11132 (arr!5284 (Array (_ BitVec 32) (_ BitVec 64))) (size!5618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3160 0))(
  ( (LongMapFixedSize!3161 (defaultEntry!4239 Int) (mask!10094 (_ BitVec 32)) (extraKeys!3976 (_ BitVec 32)) (zeroValue!4080 V!7577) (minValue!4080 V!7577) (_size!1629 (_ BitVec 32)) (_keys!6292 array!11131) (_values!4222 array!11129) (_vacant!1629 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3160)

(declare-datatypes ((SeekEntryResult!886 0))(
  ( (MissingZero!886 (index!5714 (_ BitVec 32))) (Found!886 (index!5715 (_ BitVec 32))) (Intermediate!886 (undefined!1698 Bool) (index!5716 (_ BitVec 32)) (x!23249 (_ BitVec 32))) (Undefined!886) (MissingVacant!886 (index!5717 (_ BitVec 32))) )
))
(declare-fun lt!113987 () SeekEntryResult!886)

(assert (=> b!226701 (= res!111584 (= (select (arr!5284 (_keys!6292 thiss!1504)) (index!5714 lt!113987)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226702 () Bool)

(declare-fun res!111589 () Bool)

(declare-fun e!147078 () Bool)

(assert (=> b!226702 (=> res!111589 e!147078)))

(assert (=> b!226702 (= res!111589 (or (not (= (size!5617 (_values!4222 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10094 thiss!1504)))) (not (= (size!5618 (_keys!6292 thiss!1504)) (size!5617 (_values!4222 thiss!1504)))) (bvslt (mask!10094 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3976 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3976 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun bm!21062 () Bool)

(declare-fun call!21066 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21062 (= call!21066 (arrayContainsKey!0 (_keys!6292 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226703 () Bool)

(declare-fun c!37580 () Bool)

(get-info :version)

(assert (=> b!226703 (= c!37580 ((_ is MissingVacant!886) lt!113987))))

(declare-fun e!147071 () Bool)

(declare-fun e!147077 () Bool)

(assert (=> b!226703 (= e!147071 e!147077)))

(declare-fun b!226704 () Bool)

(declare-fun e!147075 () Bool)

(declare-fun tp_is_empty!5947 () Bool)

(assert (=> b!226704 (= e!147075 tp_is_empty!5947)))

(declare-fun e!147065 () Bool)

(declare-fun e!147076 () Bool)

(declare-fun array_inv!3487 (array!11131) Bool)

(declare-fun array_inv!3488 (array!11129) Bool)

(assert (=> b!226706 (= e!147076 (and tp!21396 tp_is_empty!5947 (array_inv!3487 (_keys!6292 thiss!1504)) (array_inv!3488 (_values!4222 thiss!1504)) e!147065))))

(declare-fun c!37582 () Bool)

(declare-fun call!21065 () Bool)

(declare-fun bm!21063 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21063 (= call!21065 (inRange!0 (ite c!37582 (index!5714 lt!113987) (index!5717 lt!113987)) (mask!10094 thiss!1504)))))

(declare-fun b!226707 () Bool)

(declare-fun res!111590 () Bool)

(declare-fun e!147070 () Bool)

(assert (=> b!226707 (=> (not res!111590) (not e!147070))))

(assert (=> b!226707 (= res!111590 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226708 () Bool)

(declare-fun e!147072 () Bool)

(assert (=> b!226708 (= e!147072 (not call!21066))))

(declare-fun b!226709 () Bool)

(declare-fun res!111585 () Bool)

(assert (=> b!226709 (=> (not res!111585) (not e!147064))))

(assert (=> b!226709 (= res!111585 call!21065)))

(assert (=> b!226709 (= e!147071 e!147064)))

(declare-fun b!226710 () Bool)

(assert (=> b!226710 (= e!147077 e!147072)))

(declare-fun res!111583 () Bool)

(assert (=> b!226710 (= res!111583 call!21065)))

(assert (=> b!226710 (=> (not res!111583) (not e!147072))))

(declare-fun b!226711 () Bool)

(declare-datatypes ((Unit!6822 0))(
  ( (Unit!6823) )
))
(declare-fun e!147069 () Unit!6822)

(declare-fun lt!113994 () Unit!6822)

(assert (=> b!226711 (= e!147069 lt!113994)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!253 (array!11131 array!11129 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 64) Int) Unit!6822)

(assert (=> b!226711 (= lt!113994 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!253 (_keys!6292 thiss!1504) (_values!4222 thiss!1504) (mask!10094 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) key!932 (defaultEntry!4239 thiss!1504)))))

(assert (=> b!226711 (= c!37582 ((_ is MissingZero!886) lt!113987))))

(assert (=> b!226711 e!147071))

(declare-fun b!226712 () Bool)

(declare-fun mapRes!10090 () Bool)

(assert (=> b!226712 (= e!147065 (and e!147075 mapRes!10090))))

(declare-fun condMapEmpty!10090 () Bool)

(declare-fun mapDefault!10090 () ValueCell!2630)

(assert (=> b!226712 (= condMapEmpty!10090 (= (arr!5283 (_values!4222 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2630)) mapDefault!10090)))))

(declare-fun b!226705 () Bool)

(declare-fun res!111593 () Bool)

(assert (=> b!226705 (= res!111593 (= (select (arr!5284 (_keys!6292 thiss!1504)) (index!5717 lt!113987)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226705 (=> (not res!111593) (not e!147072))))

(declare-fun res!111588 () Bool)

(assert (=> start!22022 (=> (not res!111588) (not e!147070))))

(declare-fun valid!1281 (LongMapFixedSize!3160) Bool)

(assert (=> start!22022 (= res!111588 (valid!1281 thiss!1504))))

(assert (=> start!22022 e!147070))

(assert (=> start!22022 e!147076))

(assert (=> start!22022 true))

(declare-fun b!226713 () Bool)

(declare-fun e!147067 () Bool)

(assert (=> b!226713 (= e!147067 (not e!147078))))

(declare-fun res!111586 () Bool)

(assert (=> b!226713 (=> res!111586 e!147078)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226713 (= res!111586 (not (validMask!0 (mask!10094 thiss!1504))))))

(declare-fun lt!113986 () array!11131)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11131 (_ BitVec 32)) Bool)

(assert (=> b!226713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!113986 (mask!10094 thiss!1504))))

(declare-fun lt!113988 () Unit!6822)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11131 (_ BitVec 32) (_ BitVec 32)) Unit!6822)

(assert (=> b!226713 (= lt!113988 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6292 thiss!1504) index!297 (mask!10094 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11131 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226713 (= (arrayCountValidKeys!0 lt!113986 #b00000000000000000000000000000000 (size!5618 (_keys!6292 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6292 thiss!1504) #b00000000000000000000000000000000 (size!5618 (_keys!6292 thiss!1504)))))))

(declare-fun lt!113995 () Unit!6822)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11131 (_ BitVec 32) (_ BitVec 64)) Unit!6822)

(assert (=> b!226713 (= lt!113995 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6292 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3368 0))(
  ( (Nil!3365) (Cons!3364 (h!4012 (_ BitVec 64)) (t!8318 List!3368)) )
))
(declare-fun arrayNoDuplicates!0 (array!11131 (_ BitVec 32) List!3368) Bool)

(assert (=> b!226713 (arrayNoDuplicates!0 lt!113986 #b00000000000000000000000000000000 Nil!3365)))

(assert (=> b!226713 (= lt!113986 (array!11132 (store (arr!5284 (_keys!6292 thiss!1504)) index!297 key!932) (size!5618 (_keys!6292 thiss!1504))))))

(declare-fun lt!113989 () Unit!6822)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11131 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3368) Unit!6822)

(assert (=> b!226713 (= lt!113989 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6292 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3365))))

(declare-fun lt!113992 () Unit!6822)

(declare-fun e!147073 () Unit!6822)

(assert (=> b!226713 (= lt!113992 e!147073)))

(declare-fun c!37581 () Bool)

(assert (=> b!226713 (= c!37581 (arrayContainsKey!0 (_keys!6292 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226714 () Bool)

(assert (=> b!226714 (= e!147077 ((_ is Undefined!886) lt!113987))))

(declare-fun b!226715 () Bool)

(declare-fun Unit!6824 () Unit!6822)

(assert (=> b!226715 (= e!147073 Unit!6824)))

(declare-fun b!226716 () Bool)

(assert (=> b!226716 (= e!147064 (not call!21066))))

(declare-fun b!226717 () Bool)

(declare-fun e!147068 () Bool)

(assert (=> b!226717 (= e!147068 e!147067)))

(declare-fun res!111587 () Bool)

(assert (=> b!226717 (=> (not res!111587) (not e!147067))))

(assert (=> b!226717 (= res!111587 (inRange!0 index!297 (mask!10094 thiss!1504)))))

(declare-fun lt!113985 () Unit!6822)

(assert (=> b!226717 (= lt!113985 e!147069)))

(declare-fun c!37579 () Bool)

(declare-datatypes ((tuple2!4438 0))(
  ( (tuple2!4439 (_1!2230 (_ BitVec 64)) (_2!2230 V!7577)) )
))
(declare-datatypes ((List!3369 0))(
  ( (Nil!3366) (Cons!3365 (h!4013 tuple2!4438) (t!8319 List!3369)) )
))
(declare-datatypes ((ListLongMap!3341 0))(
  ( (ListLongMap!3342 (toList!1686 List!3369)) )
))
(declare-fun contains!1561 (ListLongMap!3341 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1195 (array!11131 array!11129 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 32) Int) ListLongMap!3341)

(assert (=> b!226717 (= c!37579 (contains!1561 (getCurrentListMap!1195 (_keys!6292 thiss!1504) (_values!4222 thiss!1504) (mask!10094 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4239 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10090 () Bool)

(assert (=> mapIsEmpty!10090 mapRes!10090))

(declare-fun b!226718 () Bool)

(declare-fun Unit!6825 () Unit!6822)

(assert (=> b!226718 (= e!147073 Unit!6825)))

(declare-fun lt!113991 () Unit!6822)

(declare-fun lemmaArrayContainsKeyThenInListMap!96 (array!11131 array!11129 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 64) (_ BitVec 32) Int) Unit!6822)

(assert (=> b!226718 (= lt!113991 (lemmaArrayContainsKeyThenInListMap!96 (_keys!6292 thiss!1504) (_values!4222 thiss!1504) (mask!10094 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4239 thiss!1504)))))

(assert (=> b!226718 false))

(declare-fun b!226719 () Bool)

(declare-fun res!111592 () Bool)

(assert (=> b!226719 (=> res!111592 e!147078)))

(assert (=> b!226719 (= res!111592 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6292 thiss!1504) (mask!10094 thiss!1504))))))

(declare-fun mapNonEmpty!10090 () Bool)

(declare-fun tp!21397 () Bool)

(declare-fun e!147074 () Bool)

(assert (=> mapNonEmpty!10090 (= mapRes!10090 (and tp!21397 e!147074))))

(declare-fun mapValue!10090 () ValueCell!2630)

(declare-fun mapKey!10090 () (_ BitVec 32))

(declare-fun mapRest!10090 () (Array (_ BitVec 32) ValueCell!2630))

(assert (=> mapNonEmpty!10090 (= (arr!5283 (_values!4222 thiss!1504)) (store mapRest!10090 mapKey!10090 mapValue!10090))))

(declare-fun b!226720 () Bool)

(assert (=> b!226720 (= e!147078 true)))

(declare-fun lt!113990 () Bool)

(assert (=> b!226720 (= lt!113990 (arrayNoDuplicates!0 (_keys!6292 thiss!1504) #b00000000000000000000000000000000 Nil!3365))))

(declare-fun b!226721 () Bool)

(assert (=> b!226721 (= e!147074 tp_is_empty!5947)))

(declare-fun b!226722 () Bool)

(declare-fun Unit!6826 () Unit!6822)

(assert (=> b!226722 (= e!147069 Unit!6826)))

(declare-fun lt!113993 () Unit!6822)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!256 (array!11131 array!11129 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 64) Int) Unit!6822)

(assert (=> b!226722 (= lt!113993 (lemmaInListMapThenSeekEntryOrOpenFindsIt!256 (_keys!6292 thiss!1504) (_values!4222 thiss!1504) (mask!10094 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) key!932 (defaultEntry!4239 thiss!1504)))))

(assert (=> b!226722 false))

(declare-fun b!226723 () Bool)

(assert (=> b!226723 (= e!147070 e!147068)))

(declare-fun res!111591 () Bool)

(assert (=> b!226723 (=> (not res!111591) (not e!147068))))

(assert (=> b!226723 (= res!111591 (or (= lt!113987 (MissingZero!886 index!297)) (= lt!113987 (MissingVacant!886 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11131 (_ BitVec 32)) SeekEntryResult!886)

(assert (=> b!226723 (= lt!113987 (seekEntryOrOpen!0 key!932 (_keys!6292 thiss!1504) (mask!10094 thiss!1504)))))

(assert (= (and start!22022 res!111588) b!226707))

(assert (= (and b!226707 res!111590) b!226723))

(assert (= (and b!226723 res!111591) b!226717))

(assert (= (and b!226717 c!37579) b!226722))

(assert (= (and b!226717 (not c!37579)) b!226711))

(assert (= (and b!226711 c!37582) b!226709))

(assert (= (and b!226711 (not c!37582)) b!226703))

(assert (= (and b!226709 res!111585) b!226701))

(assert (= (and b!226701 res!111584) b!226716))

(assert (= (and b!226703 c!37580) b!226710))

(assert (= (and b!226703 (not c!37580)) b!226714))

(assert (= (and b!226710 res!111583) b!226705))

(assert (= (and b!226705 res!111593) b!226708))

(assert (= (or b!226709 b!226710) bm!21063))

(assert (= (or b!226716 b!226708) bm!21062))

(assert (= (and b!226717 res!111587) b!226713))

(assert (= (and b!226713 c!37581) b!226718))

(assert (= (and b!226713 (not c!37581)) b!226715))

(assert (= (and b!226713 (not res!111586)) b!226702))

(assert (= (and b!226702 (not res!111589)) b!226719))

(assert (= (and b!226719 (not res!111592)) b!226720))

(assert (= (and b!226712 condMapEmpty!10090) mapIsEmpty!10090))

(assert (= (and b!226712 (not condMapEmpty!10090)) mapNonEmpty!10090))

(assert (= (and mapNonEmpty!10090 ((_ is ValueCellFull!2630) mapValue!10090)) b!226721))

(assert (= (and b!226712 ((_ is ValueCellFull!2630) mapDefault!10090)) b!226704))

(assert (= b!226706 b!226712))

(assert (= start!22022 b!226706))

(declare-fun m!248383 () Bool)

(assert (=> b!226713 m!248383))

(declare-fun m!248385 () Bool)

(assert (=> b!226713 m!248385))

(declare-fun m!248387 () Bool)

(assert (=> b!226713 m!248387))

(declare-fun m!248389 () Bool)

(assert (=> b!226713 m!248389))

(declare-fun m!248391 () Bool)

(assert (=> b!226713 m!248391))

(declare-fun m!248393 () Bool)

(assert (=> b!226713 m!248393))

(declare-fun m!248395 () Bool)

(assert (=> b!226713 m!248395))

(declare-fun m!248397 () Bool)

(assert (=> b!226713 m!248397))

(declare-fun m!248399 () Bool)

(assert (=> b!226713 m!248399))

(declare-fun m!248401 () Bool)

(assert (=> b!226713 m!248401))

(declare-fun m!248403 () Bool)

(assert (=> b!226720 m!248403))

(declare-fun m!248405 () Bool)

(assert (=> b!226711 m!248405))

(declare-fun m!248407 () Bool)

(assert (=> b!226717 m!248407))

(declare-fun m!248409 () Bool)

(assert (=> b!226717 m!248409))

(assert (=> b!226717 m!248409))

(declare-fun m!248411 () Bool)

(assert (=> b!226717 m!248411))

(declare-fun m!248413 () Bool)

(assert (=> bm!21063 m!248413))

(declare-fun m!248415 () Bool)

(assert (=> b!226723 m!248415))

(declare-fun m!248417 () Bool)

(assert (=> b!226706 m!248417))

(declare-fun m!248419 () Bool)

(assert (=> b!226706 m!248419))

(declare-fun m!248421 () Bool)

(assert (=> b!226718 m!248421))

(declare-fun m!248423 () Bool)

(assert (=> b!226701 m!248423))

(declare-fun m!248425 () Bool)

(assert (=> b!226705 m!248425))

(declare-fun m!248427 () Bool)

(assert (=> b!226719 m!248427))

(declare-fun m!248429 () Bool)

(assert (=> mapNonEmpty!10090 m!248429))

(declare-fun m!248431 () Bool)

(assert (=> start!22022 m!248431))

(assert (=> bm!21062 m!248399))

(declare-fun m!248433 () Bool)

(assert (=> b!226722 m!248433))

(check-sat (not bm!21063) tp_is_empty!5947 (not b_next!6085) (not b!226722) (not b!226718) (not mapNonEmpty!10090) (not bm!21062) (not b!226711) (not b!226713) b_and!12957 (not b!226719) (not b!226706) (not b!226717) (not start!22022) (not b!226720) (not b!226723))
(check-sat b_and!12957 (not b_next!6085))
