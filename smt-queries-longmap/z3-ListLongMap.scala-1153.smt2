; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24268 () Bool)

(assert start!24268)

(declare-fun b!253773 () Bool)

(declare-fun b_free!6669 () Bool)

(declare-fun b_next!6669 () Bool)

(assert (=> b!253773 (= b_free!6669 (not b_next!6669))))

(declare-fun tp!23295 () Bool)

(declare-fun b_and!13711 () Bool)

(assert (=> b!253773 (= tp!23295 b_and!13711)))

(declare-fun b!253772 () Bool)

(declare-fun e!164519 () Bool)

(declare-fun tp_is_empty!6531 () Bool)

(assert (=> b!253772 (= e!164519 tp_is_empty!6531)))

(declare-fun e!164524 () Bool)

(declare-fun e!164527 () Bool)

(declare-datatypes ((V!8355 0))(
  ( (V!8356 (val!3310 Int)) )
))
(declare-datatypes ((ValueCell!2922 0))(
  ( (ValueCellFull!2922 (v!5384 V!8355)) (EmptyCell!2922) )
))
(declare-datatypes ((array!12393 0))(
  ( (array!12394 (arr!5872 (Array (_ BitVec 32) ValueCell!2922)) (size!6219 (_ BitVec 32))) )
))
(declare-datatypes ((array!12395 0))(
  ( (array!12396 (arr!5873 (Array (_ BitVec 32) (_ BitVec 64))) (size!6220 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3744 0))(
  ( (LongMapFixedSize!3745 (defaultEntry!4685 Int) (mask!10925 (_ BitVec 32)) (extraKeys!4422 (_ BitVec 32)) (zeroValue!4526 V!8355) (minValue!4526 V!8355) (_size!1921 (_ BitVec 32)) (_keys!6839 array!12395) (_values!4668 array!12393) (_vacant!1921 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3744)

(declare-fun array_inv!3883 (array!12395) Bool)

(declare-fun array_inv!3884 (array!12393) Bool)

(assert (=> b!253773 (= e!164524 (and tp!23295 tp_is_empty!6531 (array_inv!3883 (_keys!6839 thiss!1504)) (array_inv!3884 (_values!4668 thiss!1504)) e!164527))))

(declare-fun b!253774 () Bool)

(declare-datatypes ((Unit!7848 0))(
  ( (Unit!7849) )
))
(declare-fun e!164525 () Unit!7848)

(declare-fun Unit!7850 () Unit!7848)

(assert (=> b!253774 (= e!164525 Unit!7850)))

(declare-fun b!253775 () Bool)

(declare-fun e!164514 () Unit!7848)

(declare-fun lt!127201 () Unit!7848)

(assert (=> b!253775 (= e!164514 lt!127201)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!415 (array!12395 array!12393 (_ BitVec 32) (_ BitVec 32) V!8355 V!8355 (_ BitVec 64) Int) Unit!7848)

(assert (=> b!253775 (= lt!127201 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!415 (_keys!6839 thiss!1504) (_values!4668 thiss!1504) (mask!10925 thiss!1504) (extraKeys!4422 thiss!1504) (zeroValue!4526 thiss!1504) (minValue!4526 thiss!1504) key!932 (defaultEntry!4685 thiss!1504)))))

(declare-fun c!42803 () Bool)

(declare-datatypes ((SeekEntryResult!1141 0))(
  ( (MissingZero!1141 (index!6734 (_ BitVec 32))) (Found!1141 (index!6735 (_ BitVec 32))) (Intermediate!1141 (undefined!1953 Bool) (index!6736 (_ BitVec 32)) (x!24833 (_ BitVec 32))) (Undefined!1141) (MissingVacant!1141 (index!6737 (_ BitVec 32))) )
))
(declare-fun lt!127200 () SeekEntryResult!1141)

(get-info :version)

(assert (=> b!253775 (= c!42803 ((_ is MissingZero!1141) lt!127200))))

(declare-fun e!164517 () Bool)

(assert (=> b!253775 e!164517))

(declare-fun b!253776 () Bool)

(declare-fun res!124231 () Bool)

(declare-fun e!164516 () Bool)

(assert (=> b!253776 (=> (not res!124231) (not e!164516))))

(assert (=> b!253776 (= res!124231 (= (select (arr!5873 (_keys!6839 thiss!1504)) (index!6734 lt!127200)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253777 () Bool)

(declare-fun res!124224 () Bool)

(declare-fun e!164520 () Bool)

(assert (=> b!253777 (=> res!124224 e!164520)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!253777 (= res!124224 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6220 (_keys!6839 thiss!1504)))))))

(declare-fun b!253778 () Bool)

(declare-fun Unit!7851 () Unit!7848)

(assert (=> b!253778 (= e!164514 Unit!7851)))

(declare-fun lt!127202 () Unit!7848)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!410 (array!12395 array!12393 (_ BitVec 32) (_ BitVec 32) V!8355 V!8355 (_ BitVec 64) Int) Unit!7848)

(assert (=> b!253778 (= lt!127202 (lemmaInListMapThenSeekEntryOrOpenFindsIt!410 (_keys!6839 thiss!1504) (_values!4668 thiss!1504) (mask!10925 thiss!1504) (extraKeys!4422 thiss!1504) (zeroValue!4526 thiss!1504) (minValue!4526 thiss!1504) key!932 (defaultEntry!4685 thiss!1504)))))

(assert (=> b!253778 false))

(declare-fun b!253779 () Bool)

(declare-fun e!164522 () Bool)

(assert (=> b!253779 (= e!164522 tp_is_empty!6531)))

(declare-fun b!253780 () Bool)

(declare-fun res!124232 () Bool)

(assert (=> b!253780 (=> res!124232 e!164520)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12395 (_ BitVec 32)) Bool)

(assert (=> b!253780 (= res!124232 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6839 thiss!1504) (mask!10925 thiss!1504))))))

(declare-fun b!253781 () Bool)

(declare-fun Unit!7852 () Unit!7848)

(assert (=> b!253781 (= e!164525 Unit!7852)))

(declare-fun lt!127205 () Unit!7848)

(declare-fun lemmaArrayContainsKeyThenInListMap!216 (array!12395 array!12393 (_ BitVec 32) (_ BitVec 32) V!8355 V!8355 (_ BitVec 64) (_ BitVec 32) Int) Unit!7848)

(assert (=> b!253781 (= lt!127205 (lemmaArrayContainsKeyThenInListMap!216 (_keys!6839 thiss!1504) (_values!4668 thiss!1504) (mask!10925 thiss!1504) (extraKeys!4422 thiss!1504) (zeroValue!4526 thiss!1504) (minValue!4526 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4685 thiss!1504)))))

(assert (=> b!253781 false))

(declare-fun mapNonEmpty!11112 () Bool)

(declare-fun mapRes!11112 () Bool)

(declare-fun tp!23294 () Bool)

(assert (=> mapNonEmpty!11112 (= mapRes!11112 (and tp!23294 e!164519))))

(declare-fun mapRest!11112 () (Array (_ BitVec 32) ValueCell!2922))

(declare-fun mapValue!11112 () ValueCell!2922)

(declare-fun mapKey!11112 () (_ BitVec 32))

(assert (=> mapNonEmpty!11112 (= (arr!5872 (_values!4668 thiss!1504)) (store mapRest!11112 mapKey!11112 mapValue!11112))))

(declare-fun b!253782 () Bool)

(declare-fun res!124228 () Bool)

(assert (=> b!253782 (=> res!124228 e!164520)))

(assert (=> b!253782 (= res!124228 (or (not (= (size!6219 (_values!4668 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10925 thiss!1504)))) (not (= (size!6220 (_keys!6839 thiss!1504)) (size!6219 (_values!4668 thiss!1504)))) (bvslt (mask!10925 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4422 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4422 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!253783 () Bool)

(declare-fun e!164513 () Bool)

(assert (=> b!253783 (= e!164513 ((_ is Undefined!1141) lt!127200))))

(declare-fun bm!23949 () Bool)

(declare-fun call!23953 () Bool)

(declare-fun arrayContainsKey!0 (array!12395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23949 (= call!23953 (arrayContainsKey!0 (_keys!6839 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253784 () Bool)

(assert (=> b!253784 (= e!164516 (not call!23953))))

(declare-fun b!253785 () Bool)

(declare-fun e!164518 () Bool)

(assert (=> b!253785 (= e!164513 e!164518)))

(declare-fun res!124225 () Bool)

(declare-fun call!23952 () Bool)

(assert (=> b!253785 (= res!124225 call!23952)))

(assert (=> b!253785 (=> (not res!124225) (not e!164518))))

(declare-fun b!253786 () Bool)

(declare-fun c!42806 () Bool)

(assert (=> b!253786 (= c!42806 ((_ is MissingVacant!1141) lt!127200))))

(assert (=> b!253786 (= e!164517 e!164513)))

(declare-fun b!253787 () Bool)

(assert (=> b!253787 (= e!164518 (not call!23953))))

(declare-fun b!253788 () Bool)

(declare-fun e!164515 () Bool)

(declare-fun e!164526 () Bool)

(assert (=> b!253788 (= e!164515 e!164526)))

(declare-fun res!124221 () Bool)

(assert (=> b!253788 (=> (not res!124221) (not e!164526))))

(assert (=> b!253788 (= res!124221 (or (= lt!127200 (MissingZero!1141 index!297)) (= lt!127200 (MissingVacant!1141 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12395 (_ BitVec 32)) SeekEntryResult!1141)

(assert (=> b!253788 (= lt!127200 (seekEntryOrOpen!0 key!932 (_keys!6839 thiss!1504) (mask!10925 thiss!1504)))))

(declare-fun b!253789 () Bool)

(declare-fun res!124223 () Bool)

(assert (=> b!253789 (= res!124223 (= (select (arr!5873 (_keys!6839 thiss!1504)) (index!6737 lt!127200)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253789 (=> (not res!124223) (not e!164518))))

(declare-fun b!253790 () Bool)

(assert (=> b!253790 (= e!164527 (and e!164522 mapRes!11112))))

(declare-fun condMapEmpty!11112 () Bool)

(declare-fun mapDefault!11112 () ValueCell!2922)

(assert (=> b!253790 (= condMapEmpty!11112 (= (arr!5872 (_values!4668 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2922)) mapDefault!11112)))))

(declare-fun b!253791 () Bool)

(declare-fun res!124229 () Bool)

(assert (=> b!253791 (=> res!124229 e!164520)))

(declare-datatypes ((List!3753 0))(
  ( (Nil!3750) (Cons!3749 (h!4411 (_ BitVec 64)) (t!8800 List!3753)) )
))
(declare-fun arrayNoDuplicates!0 (array!12395 (_ BitVec 32) List!3753) Bool)

(assert (=> b!253791 (= res!124229 (not (arrayNoDuplicates!0 (_keys!6839 thiss!1504) #b00000000000000000000000000000000 Nil!3750)))))

(declare-fun mapIsEmpty!11112 () Bool)

(assert (=> mapIsEmpty!11112 mapRes!11112))

(declare-fun bm!23950 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23950 (= call!23952 (inRange!0 (ite c!42803 (index!6734 lt!127200) (index!6737 lt!127200)) (mask!10925 thiss!1504)))))

(declare-fun b!253792 () Bool)

(declare-fun res!124220 () Bool)

(assert (=> b!253792 (=> res!124220 e!164520)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253792 (= res!124220 (not (validKeyInArray!0 key!932)))))

(declare-fun res!124227 () Bool)

(assert (=> start!24268 (=> (not res!124227) (not e!164515))))

(declare-fun valid!1465 (LongMapFixedSize!3744) Bool)

(assert (=> start!24268 (= res!124227 (valid!1465 thiss!1504))))

(assert (=> start!24268 e!164515))

(assert (=> start!24268 e!164524))

(assert (=> start!24268 true))

(declare-fun b!253793 () Bool)

(assert (=> b!253793 (= e!164520 (or (= (select (arr!5873 (_keys!6839 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!5873 (_keys!6839 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!253794 () Bool)

(declare-fun res!124233 () Bool)

(assert (=> b!253794 (=> (not res!124233) (not e!164516))))

(assert (=> b!253794 (= res!124233 call!23952)))

(assert (=> b!253794 (= e!164517 e!164516)))

(declare-fun b!253795 () Bool)

(declare-fun res!124230 () Bool)

(assert (=> b!253795 (=> (not res!124230) (not e!164515))))

(assert (=> b!253795 (= res!124230 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!253796 () Bool)

(declare-fun e!164521 () Bool)

(assert (=> b!253796 (= e!164521 (not e!164520))))

(declare-fun res!124226 () Bool)

(assert (=> b!253796 (=> res!124226 e!164520)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!253796 (= res!124226 (not (validMask!0 (mask!10925 thiss!1504))))))

(declare-fun lt!127203 () array!12395)

(assert (=> b!253796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127203 (mask!10925 thiss!1504))))

(declare-fun lt!127196 () Unit!7848)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12395 (_ BitVec 32) (_ BitVec 32)) Unit!7848)

(assert (=> b!253796 (= lt!127196 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6839 thiss!1504) index!297 (mask!10925 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12395 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!253796 (= (arrayCountValidKeys!0 lt!127203 #b00000000000000000000000000000000 (size!6220 (_keys!6839 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6839 thiss!1504) #b00000000000000000000000000000000 (size!6220 (_keys!6839 thiss!1504)))))))

(declare-fun lt!127198 () Unit!7848)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12395 (_ BitVec 32) (_ BitVec 64)) Unit!7848)

(assert (=> b!253796 (= lt!127198 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6839 thiss!1504) index!297 key!932))))

(assert (=> b!253796 (arrayNoDuplicates!0 lt!127203 #b00000000000000000000000000000000 Nil!3750)))

(assert (=> b!253796 (= lt!127203 (array!12396 (store (arr!5873 (_keys!6839 thiss!1504)) index!297 key!932) (size!6220 (_keys!6839 thiss!1504))))))

(declare-fun lt!127199 () Unit!7848)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3753) Unit!7848)

(assert (=> b!253796 (= lt!127199 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6839 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3750))))

(declare-fun lt!127197 () Unit!7848)

(assert (=> b!253796 (= lt!127197 e!164525)))

(declare-fun c!42804 () Bool)

(assert (=> b!253796 (= c!42804 (arrayContainsKey!0 (_keys!6839 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253797 () Bool)

(assert (=> b!253797 (= e!164526 e!164521)))

(declare-fun res!124222 () Bool)

(assert (=> b!253797 (=> (not res!124222) (not e!164521))))

(assert (=> b!253797 (= res!124222 (inRange!0 index!297 (mask!10925 thiss!1504)))))

(declare-fun lt!127204 () Unit!7848)

(assert (=> b!253797 (= lt!127204 e!164514)))

(declare-fun c!42805 () Bool)

(declare-datatypes ((tuple2!4872 0))(
  ( (tuple2!4873 (_1!2447 (_ BitVec 64)) (_2!2447 V!8355)) )
))
(declare-datatypes ((List!3754 0))(
  ( (Nil!3751) (Cons!3750 (h!4412 tuple2!4872) (t!8801 List!3754)) )
))
(declare-datatypes ((ListLongMap!3785 0))(
  ( (ListLongMap!3786 (toList!1908 List!3754)) )
))
(declare-fun contains!1838 (ListLongMap!3785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1436 (array!12395 array!12393 (_ BitVec 32) (_ BitVec 32) V!8355 V!8355 (_ BitVec 32) Int) ListLongMap!3785)

(assert (=> b!253797 (= c!42805 (contains!1838 (getCurrentListMap!1436 (_keys!6839 thiss!1504) (_values!4668 thiss!1504) (mask!10925 thiss!1504) (extraKeys!4422 thiss!1504) (zeroValue!4526 thiss!1504) (minValue!4526 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4685 thiss!1504)) key!932))))

(assert (= (and start!24268 res!124227) b!253795))

(assert (= (and b!253795 res!124230) b!253788))

(assert (= (and b!253788 res!124221) b!253797))

(assert (= (and b!253797 c!42805) b!253778))

(assert (= (and b!253797 (not c!42805)) b!253775))

(assert (= (and b!253775 c!42803) b!253794))

(assert (= (and b!253775 (not c!42803)) b!253786))

(assert (= (and b!253794 res!124233) b!253776))

(assert (= (and b!253776 res!124231) b!253784))

(assert (= (and b!253786 c!42806) b!253785))

(assert (= (and b!253786 (not c!42806)) b!253783))

(assert (= (and b!253785 res!124225) b!253789))

(assert (= (and b!253789 res!124223) b!253787))

(assert (= (or b!253794 b!253785) bm!23950))

(assert (= (or b!253784 b!253787) bm!23949))

(assert (= (and b!253797 res!124222) b!253796))

(assert (= (and b!253796 c!42804) b!253781))

(assert (= (and b!253796 (not c!42804)) b!253774))

(assert (= (and b!253796 (not res!124226)) b!253782))

(assert (= (and b!253782 (not res!124228)) b!253780))

(assert (= (and b!253780 (not res!124232)) b!253791))

(assert (= (and b!253791 (not res!124229)) b!253777))

(assert (= (and b!253777 (not res!124224)) b!253792))

(assert (= (and b!253792 (not res!124220)) b!253793))

(assert (= (and b!253790 condMapEmpty!11112) mapIsEmpty!11112))

(assert (= (and b!253790 (not condMapEmpty!11112)) mapNonEmpty!11112))

(assert (= (and mapNonEmpty!11112 ((_ is ValueCellFull!2922) mapValue!11112)) b!253772))

(assert (= (and b!253790 ((_ is ValueCellFull!2922) mapDefault!11112)) b!253779))

(assert (= b!253773 b!253790))

(assert (= start!24268 b!253773))

(declare-fun m!269513 () Bool)

(assert (=> b!253788 m!269513))

(declare-fun m!269515 () Bool)

(assert (=> b!253775 m!269515))

(declare-fun m!269517 () Bool)

(assert (=> b!253780 m!269517))

(declare-fun m!269519 () Bool)

(assert (=> mapNonEmpty!11112 m!269519))

(declare-fun m!269521 () Bool)

(assert (=> b!253778 m!269521))

(declare-fun m!269523 () Bool)

(assert (=> b!253781 m!269523))

(declare-fun m!269525 () Bool)

(assert (=> b!253791 m!269525))

(declare-fun m!269527 () Bool)

(assert (=> b!253796 m!269527))

(declare-fun m!269529 () Bool)

(assert (=> b!253796 m!269529))

(declare-fun m!269531 () Bool)

(assert (=> b!253796 m!269531))

(declare-fun m!269533 () Bool)

(assert (=> b!253796 m!269533))

(declare-fun m!269535 () Bool)

(assert (=> b!253796 m!269535))

(declare-fun m!269537 () Bool)

(assert (=> b!253796 m!269537))

(declare-fun m!269539 () Bool)

(assert (=> b!253796 m!269539))

(declare-fun m!269541 () Bool)

(assert (=> b!253796 m!269541))

(declare-fun m!269543 () Bool)

(assert (=> b!253796 m!269543))

(declare-fun m!269545 () Bool)

(assert (=> b!253796 m!269545))

(declare-fun m!269547 () Bool)

(assert (=> b!253793 m!269547))

(declare-fun m!269549 () Bool)

(assert (=> start!24268 m!269549))

(declare-fun m!269551 () Bool)

(assert (=> b!253797 m!269551))

(declare-fun m!269553 () Bool)

(assert (=> b!253797 m!269553))

(assert (=> b!253797 m!269553))

(declare-fun m!269555 () Bool)

(assert (=> b!253797 m!269555))

(declare-fun m!269557 () Bool)

(assert (=> b!253792 m!269557))

(declare-fun m!269559 () Bool)

(assert (=> bm!23950 m!269559))

(declare-fun m!269561 () Bool)

(assert (=> b!253773 m!269561))

(declare-fun m!269563 () Bool)

(assert (=> b!253773 m!269563))

(declare-fun m!269565 () Bool)

(assert (=> b!253776 m!269565))

(assert (=> bm!23949 m!269529))

(declare-fun m!269567 () Bool)

(assert (=> b!253789 m!269567))

(check-sat (not mapNonEmpty!11112) (not b!253773) (not b_next!6669) (not b!253792) tp_is_empty!6531 (not b!253781) (not b!253796) (not bm!23950) (not bm!23949) (not b!253788) (not b!253780) (not b!253778) (not b!253791) b_and!13711 (not b!253775) (not b!253797) (not start!24268))
(check-sat b_and!13711 (not b_next!6669))
