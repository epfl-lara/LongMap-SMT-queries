; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21992 () Bool)

(assert start!21992)

(declare-fun b!225795 () Bool)

(declare-fun b_free!6055 () Bool)

(declare-fun b_next!6055 () Bool)

(assert (=> b!225795 (= b_free!6055 (not b_next!6055))))

(declare-fun tp!21306 () Bool)

(declare-fun b_and!12967 () Bool)

(assert (=> b!225795 (= tp!21306 b_and!12967)))

(declare-fun b!225774 () Bool)

(declare-fun res!111123 () Bool)

(declare-fun e!146518 () Bool)

(assert (=> b!225774 (=> res!111123 e!146518)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225774 (= res!111123 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225775 () Bool)

(declare-fun e!146517 () Bool)

(declare-fun tp_is_empty!5917 () Bool)

(assert (=> b!225775 (= e!146517 tp_is_empty!5917)))

(declare-fun b!225776 () Bool)

(declare-fun e!146523 () Bool)

(assert (=> b!225776 (= e!146523 (not e!146518))))

(declare-fun res!111125 () Bool)

(assert (=> b!225776 (=> res!111125 e!146518)))

(declare-datatypes ((V!7537 0))(
  ( (V!7538 (val!3003 Int)) )
))
(declare-datatypes ((ValueCell!2615 0))(
  ( (ValueCellFull!2615 (v!5024 V!7537)) (EmptyCell!2615) )
))
(declare-datatypes ((array!11075 0))(
  ( (array!11076 (arr!5257 (Array (_ BitVec 32) ValueCell!2615)) (size!5590 (_ BitVec 32))) )
))
(declare-datatypes ((array!11077 0))(
  ( (array!11078 (arr!5258 (Array (_ BitVec 32) (_ BitVec 64))) (size!5591 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3130 0))(
  ( (LongMapFixedSize!3131 (defaultEntry!4224 Int) (mask!10070 (_ BitVec 32)) (extraKeys!3961 (_ BitVec 32)) (zeroValue!4065 V!7537) (minValue!4065 V!7537) (_size!1614 (_ BitVec 32)) (_keys!6278 array!11077) (_values!4207 array!11075) (_vacant!1614 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3130)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225776 (= res!111125 (not (validMask!0 (mask!10070 thiss!1504))))))

(declare-fun lt!113736 () array!11077)

(declare-fun arrayCountValidKeys!0 (array!11077 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225776 (= (arrayCountValidKeys!0 lt!113736 #b00000000000000000000000000000000 (size!5591 (_keys!6278 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6278 thiss!1504) #b00000000000000000000000000000000 (size!5591 (_keys!6278 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!6784 0))(
  ( (Unit!6785) )
))
(declare-fun lt!113739 () Unit!6784)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11077 (_ BitVec 32) (_ BitVec 64)) Unit!6784)

(assert (=> b!225776 (= lt!113739 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6278 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3271 0))(
  ( (Nil!3268) (Cons!3267 (h!3915 (_ BitVec 64)) (t!8222 List!3271)) )
))
(declare-fun arrayNoDuplicates!0 (array!11077 (_ BitVec 32) List!3271) Bool)

(assert (=> b!225776 (arrayNoDuplicates!0 lt!113736 #b00000000000000000000000000000000 Nil!3268)))

(assert (=> b!225776 (= lt!113736 (array!11078 (store (arr!5258 (_keys!6278 thiss!1504)) index!297 key!932) (size!5591 (_keys!6278 thiss!1504))))))

(declare-fun lt!113737 () Unit!6784)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11077 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3271) Unit!6784)

(assert (=> b!225776 (= lt!113737 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6278 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3268))))

(declare-fun lt!113730 () Unit!6784)

(declare-fun e!146522 () Unit!6784)

(assert (=> b!225776 (= lt!113730 e!146522)))

(declare-fun c!37438 () Bool)

(declare-fun lt!113732 () Bool)

(assert (=> b!225776 (= c!37438 lt!113732)))

(declare-fun arrayContainsKey!0 (array!11077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225776 (= lt!113732 (arrayContainsKey!0 (_keys!6278 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225777 () Bool)

(declare-fun res!111121 () Bool)

(declare-datatypes ((SeekEntryResult!845 0))(
  ( (MissingZero!845 (index!5550 (_ BitVec 32))) (Found!845 (index!5551 (_ BitVec 32))) (Intermediate!845 (undefined!1657 Bool) (index!5552 (_ BitVec 32)) (x!23169 (_ BitVec 32))) (Undefined!845) (MissingVacant!845 (index!5553 (_ BitVec 32))) )
))
(declare-fun lt!113735 () SeekEntryResult!845)

(assert (=> b!225777 (= res!111121 (= (select (arr!5258 (_keys!6278 thiss!1504)) (index!5553 lt!113735)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146514 () Bool)

(assert (=> b!225777 (=> (not res!111121) (not e!146514))))

(declare-fun bm!20984 () Bool)

(declare-fun call!20987 () Bool)

(assert (=> bm!20984 (= call!20987 (arrayContainsKey!0 (_keys!6278 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225778 () Bool)

(declare-fun res!111130 () Bool)

(assert (=> b!225778 (=> res!111130 e!146518)))

(assert (=> b!225778 (= res!111130 lt!113732)))

(declare-fun res!111124 () Bool)

(declare-fun e!146528 () Bool)

(assert (=> start!21992 (=> (not res!111124) (not e!146528))))

(declare-fun valid!1264 (LongMapFixedSize!3130) Bool)

(assert (=> start!21992 (= res!111124 (valid!1264 thiss!1504))))

(assert (=> start!21992 e!146528))

(declare-fun e!146516 () Bool)

(assert (=> start!21992 e!146516))

(assert (=> start!21992 true))

(declare-fun mapNonEmpty!10045 () Bool)

(declare-fun mapRes!10045 () Bool)

(declare-fun tp!21307 () Bool)

(assert (=> mapNonEmpty!10045 (= mapRes!10045 (and tp!21307 e!146517))))

(declare-fun mapKey!10045 () (_ BitVec 32))

(declare-fun mapValue!10045 () ValueCell!2615)

(declare-fun mapRest!10045 () (Array (_ BitVec 32) ValueCell!2615))

(assert (=> mapNonEmpty!10045 (= (arr!5257 (_values!4207 thiss!1504)) (store mapRest!10045 mapKey!10045 mapValue!10045))))

(declare-fun mapIsEmpty!10045 () Bool)

(assert (=> mapIsEmpty!10045 mapRes!10045))

(declare-fun bm!20985 () Bool)

(declare-fun c!37441 () Bool)

(declare-fun call!20988 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20985 (= call!20988 (inRange!0 (ite c!37441 (index!5550 lt!113735) (index!5553 lt!113735)) (mask!10070 thiss!1504)))))

(declare-fun b!225779 () Bool)

(declare-fun e!146525 () Bool)

(assert (=> b!225779 (= e!146525 tp_is_empty!5917)))

(declare-fun b!225780 () Bool)

(declare-fun e!146519 () Bool)

(assert (=> b!225780 (= e!146519 (and e!146525 mapRes!10045))))

(declare-fun condMapEmpty!10045 () Bool)

(declare-fun mapDefault!10045 () ValueCell!2615)

(assert (=> b!225780 (= condMapEmpty!10045 (= (arr!5257 (_values!4207 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2615)) mapDefault!10045)))))

(declare-fun b!225781 () Bool)

(assert (=> b!225781 (= e!146514 (not call!20987))))

(declare-fun b!225782 () Bool)

(declare-fun e!146515 () Bool)

(assert (=> b!225782 (= e!146528 e!146515)))

(declare-fun res!111128 () Bool)

(assert (=> b!225782 (=> (not res!111128) (not e!146515))))

(assert (=> b!225782 (= res!111128 (or (= lt!113735 (MissingZero!845 index!297)) (= lt!113735 (MissingVacant!845 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11077 (_ BitVec 32)) SeekEntryResult!845)

(assert (=> b!225782 (= lt!113735 (seekEntryOrOpen!0 key!932 (_keys!6278 thiss!1504) (mask!10070 thiss!1504)))))

(declare-fun b!225783 () Bool)

(declare-fun e!146526 () Bool)

(assert (=> b!225783 (= e!146526 e!146514)))

(declare-fun res!111118 () Bool)

(assert (=> b!225783 (= res!111118 call!20988)))

(assert (=> b!225783 (=> (not res!111118) (not e!146514))))

(declare-fun b!225784 () Bool)

(declare-fun Unit!6786 () Unit!6784)

(assert (=> b!225784 (= e!146522 Unit!6786)))

(declare-fun b!225785 () Bool)

(declare-fun e!146527 () Unit!6784)

(declare-fun Unit!6787 () Unit!6784)

(assert (=> b!225785 (= e!146527 Unit!6787)))

(declare-fun lt!113731 () Unit!6784)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!250 (array!11077 array!11075 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 64) Int) Unit!6784)

(assert (=> b!225785 (= lt!113731 (lemmaInListMapThenSeekEntryOrOpenFindsIt!250 (_keys!6278 thiss!1504) (_values!4207 thiss!1504) (mask!10070 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) key!932 (defaultEntry!4224 thiss!1504)))))

(assert (=> b!225785 false))

(declare-fun b!225786 () Bool)

(assert (=> b!225786 (= e!146518 true)))

(declare-fun lt!113733 () Bool)

(assert (=> b!225786 (= lt!113733 (arrayNoDuplicates!0 (_keys!6278 thiss!1504) #b00000000000000000000000000000000 Nil!3268))))

(declare-fun b!225787 () Bool)

(declare-fun res!111126 () Bool)

(declare-fun e!146521 () Bool)

(assert (=> b!225787 (=> (not res!111126) (not e!146521))))

(assert (=> b!225787 (= res!111126 (= (select (arr!5258 (_keys!6278 thiss!1504)) (index!5550 lt!113735)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225788 () Bool)

(assert (=> b!225788 (= e!146515 e!146523)))

(declare-fun res!111120 () Bool)

(assert (=> b!225788 (=> (not res!111120) (not e!146523))))

(assert (=> b!225788 (= res!111120 (inRange!0 index!297 (mask!10070 thiss!1504)))))

(declare-fun lt!113738 () Unit!6784)

(assert (=> b!225788 (= lt!113738 e!146527)))

(declare-fun c!37439 () Bool)

(declare-datatypes ((tuple2!4362 0))(
  ( (tuple2!4363 (_1!2192 (_ BitVec 64)) (_2!2192 V!7537)) )
))
(declare-datatypes ((List!3272 0))(
  ( (Nil!3269) (Cons!3268 (h!3916 tuple2!4362) (t!8223 List!3272)) )
))
(declare-datatypes ((ListLongMap!3277 0))(
  ( (ListLongMap!3278 (toList!1654 List!3272)) )
))
(declare-fun contains!1543 (ListLongMap!3277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1186 (array!11077 array!11075 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 32) Int) ListLongMap!3277)

(assert (=> b!225788 (= c!37439 (contains!1543 (getCurrentListMap!1186 (_keys!6278 thiss!1504) (_values!4207 thiss!1504) (mask!10070 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4224 thiss!1504)) key!932))))

(declare-fun b!225789 () Bool)

(declare-fun res!111119 () Bool)

(assert (=> b!225789 (=> (not res!111119) (not e!146528))))

(assert (=> b!225789 (= res!111119 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225790 () Bool)

(declare-fun c!37440 () Bool)

(get-info :version)

(assert (=> b!225790 (= c!37440 ((_ is MissingVacant!845) lt!113735))))

(declare-fun e!146520 () Bool)

(assert (=> b!225790 (= e!146520 e!146526)))

(declare-fun b!225791 () Bool)

(assert (=> b!225791 (= e!146521 (not call!20987))))

(declare-fun b!225792 () Bool)

(declare-fun res!111122 () Bool)

(assert (=> b!225792 (=> res!111122 e!146518)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11077 (_ BitVec 32)) Bool)

(assert (=> b!225792 (= res!111122 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6278 thiss!1504) (mask!10070 thiss!1504))))))

(declare-fun b!225793 () Bool)

(assert (=> b!225793 (= e!146526 ((_ is Undefined!845) lt!113735))))

(declare-fun b!225794 () Bool)

(declare-fun lt!113734 () Unit!6784)

(assert (=> b!225794 (= e!146527 lt!113734)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!241 (array!11077 array!11075 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 64) Int) Unit!6784)

(assert (=> b!225794 (= lt!113734 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!241 (_keys!6278 thiss!1504) (_values!4207 thiss!1504) (mask!10070 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) key!932 (defaultEntry!4224 thiss!1504)))))

(assert (=> b!225794 (= c!37441 ((_ is MissingZero!845) lt!113735))))

(assert (=> b!225794 e!146520))

(declare-fun array_inv!3455 (array!11077) Bool)

(declare-fun array_inv!3456 (array!11075) Bool)

(assert (=> b!225795 (= e!146516 (and tp!21306 tp_is_empty!5917 (array_inv!3455 (_keys!6278 thiss!1504)) (array_inv!3456 (_values!4207 thiss!1504)) e!146519))))

(declare-fun b!225796 () Bool)

(declare-fun res!111129 () Bool)

(assert (=> b!225796 (=> res!111129 e!146518)))

(assert (=> b!225796 (= res!111129 (or (not (= (size!5591 (_keys!6278 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10070 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5591 (_keys!6278 thiss!1504)))))))

(declare-fun b!225797 () Bool)

(declare-fun Unit!6788 () Unit!6784)

(assert (=> b!225797 (= e!146522 Unit!6788)))

(declare-fun lt!113740 () Unit!6784)

(declare-fun lemmaArrayContainsKeyThenInListMap!87 (array!11077 array!11075 (_ BitVec 32) (_ BitVec 32) V!7537 V!7537 (_ BitVec 64) (_ BitVec 32) Int) Unit!6784)

(assert (=> b!225797 (= lt!113740 (lemmaArrayContainsKeyThenInListMap!87 (_keys!6278 thiss!1504) (_values!4207 thiss!1504) (mask!10070 thiss!1504) (extraKeys!3961 thiss!1504) (zeroValue!4065 thiss!1504) (minValue!4065 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4224 thiss!1504)))))

(assert (=> b!225797 false))

(declare-fun b!225798 () Bool)

(declare-fun res!111127 () Bool)

(assert (=> b!225798 (=> (not res!111127) (not e!146521))))

(assert (=> b!225798 (= res!111127 call!20988)))

(assert (=> b!225798 (= e!146520 e!146521)))

(assert (= (and start!21992 res!111124) b!225789))

(assert (= (and b!225789 res!111119) b!225782))

(assert (= (and b!225782 res!111128) b!225788))

(assert (= (and b!225788 c!37439) b!225785))

(assert (= (and b!225788 (not c!37439)) b!225794))

(assert (= (and b!225794 c!37441) b!225798))

(assert (= (and b!225794 (not c!37441)) b!225790))

(assert (= (and b!225798 res!111127) b!225787))

(assert (= (and b!225787 res!111126) b!225791))

(assert (= (and b!225790 c!37440) b!225783))

(assert (= (and b!225790 (not c!37440)) b!225793))

(assert (= (and b!225783 res!111118) b!225777))

(assert (= (and b!225777 res!111121) b!225781))

(assert (= (or b!225798 b!225783) bm!20985))

(assert (= (or b!225791 b!225781) bm!20984))

(assert (= (and b!225788 res!111120) b!225776))

(assert (= (and b!225776 c!37438) b!225797))

(assert (= (and b!225776 (not c!37438)) b!225784))

(assert (= (and b!225776 (not res!111125)) b!225796))

(assert (= (and b!225796 (not res!111129)) b!225774))

(assert (= (and b!225774 (not res!111123)) b!225778))

(assert (= (and b!225778 (not res!111130)) b!225792))

(assert (= (and b!225792 (not res!111122)) b!225786))

(assert (= (and b!225780 condMapEmpty!10045) mapIsEmpty!10045))

(assert (= (and b!225780 (not condMapEmpty!10045)) mapNonEmpty!10045))

(assert (= (and mapNonEmpty!10045 ((_ is ValueCellFull!2615) mapValue!10045)) b!225775))

(assert (= (and b!225780 ((_ is ValueCellFull!2615) mapDefault!10045)) b!225779))

(assert (= b!225795 b!225780))

(assert (= start!21992 b!225795))

(declare-fun m!248431 () Bool)

(assert (=> b!225776 m!248431))

(declare-fun m!248433 () Bool)

(assert (=> b!225776 m!248433))

(declare-fun m!248435 () Bool)

(assert (=> b!225776 m!248435))

(declare-fun m!248437 () Bool)

(assert (=> b!225776 m!248437))

(declare-fun m!248439 () Bool)

(assert (=> b!225776 m!248439))

(declare-fun m!248441 () Bool)

(assert (=> b!225776 m!248441))

(declare-fun m!248443 () Bool)

(assert (=> b!225776 m!248443))

(declare-fun m!248445 () Bool)

(assert (=> b!225776 m!248445))

(declare-fun m!248447 () Bool)

(assert (=> b!225786 m!248447))

(declare-fun m!248449 () Bool)

(assert (=> b!225777 m!248449))

(declare-fun m!248451 () Bool)

(assert (=> b!225787 m!248451))

(declare-fun m!248453 () Bool)

(assert (=> bm!20985 m!248453))

(declare-fun m!248455 () Bool)

(assert (=> b!225797 m!248455))

(declare-fun m!248457 () Bool)

(assert (=> b!225788 m!248457))

(declare-fun m!248459 () Bool)

(assert (=> b!225788 m!248459))

(assert (=> b!225788 m!248459))

(declare-fun m!248461 () Bool)

(assert (=> b!225788 m!248461))

(declare-fun m!248463 () Bool)

(assert (=> mapNonEmpty!10045 m!248463))

(declare-fun m!248465 () Bool)

(assert (=> b!225795 m!248465))

(declare-fun m!248467 () Bool)

(assert (=> b!225795 m!248467))

(declare-fun m!248469 () Bool)

(assert (=> b!225774 m!248469))

(declare-fun m!248471 () Bool)

(assert (=> start!21992 m!248471))

(declare-fun m!248473 () Bool)

(assert (=> b!225792 m!248473))

(declare-fun m!248475 () Bool)

(assert (=> b!225794 m!248475))

(assert (=> bm!20984 m!248433))

(declare-fun m!248477 () Bool)

(assert (=> b!225782 m!248477))

(declare-fun m!248479 () Bool)

(assert (=> b!225785 m!248479))

(check-sat (not b!225785) (not b!225794) (not bm!20984) (not b!225774) (not bm!20985) (not b!225792) (not b!225776) (not b!225788) (not start!21992) (not b!225786) (not b!225797) tp_is_empty!5917 b_and!12967 (not b!225782) (not b!225795) (not mapNonEmpty!10045) (not b_next!6055))
(check-sat b_and!12967 (not b_next!6055))
