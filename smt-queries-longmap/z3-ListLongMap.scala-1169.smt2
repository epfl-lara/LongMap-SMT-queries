; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25022 () Bool)

(assert start!25022)

(declare-fun b!260670 () Bool)

(declare-fun b_free!6763 () Bool)

(declare-fun b_next!6763 () Bool)

(assert (=> b!260670 (= b_free!6763 (not b_next!6763))))

(declare-fun tp!23616 () Bool)

(declare-fun b_and!13857 () Bool)

(assert (=> b!260670 (= tp!23616 b_and!13857)))

(declare-fun b!260654 () Bool)

(declare-fun res!127363 () Bool)

(declare-fun e!168908 () Bool)

(assert (=> b!260654 (=> (not res!127363) (not e!168908))))

(declare-fun call!24856 () Bool)

(assert (=> b!260654 (= res!127363 call!24856)))

(declare-fun e!168906 () Bool)

(assert (=> b!260654 (= e!168906 e!168908)))

(declare-fun b!260655 () Bool)

(declare-fun e!168904 () Bool)

(declare-fun e!168909 () Bool)

(assert (=> b!260655 (= e!168904 e!168909)))

(declare-fun res!127367 () Bool)

(assert (=> b!260655 (= res!127367 call!24856)))

(assert (=> b!260655 (=> (not res!127367) (not e!168909))))

(declare-fun b!260656 () Bool)

(declare-fun call!24855 () Bool)

(assert (=> b!260656 (= e!168909 (not call!24855))))

(declare-fun res!127365 () Bool)

(declare-fun e!168917 () Bool)

(assert (=> start!25022 (=> (not res!127365) (not e!168917))))

(declare-datatypes ((V!8481 0))(
  ( (V!8482 (val!3357 Int)) )
))
(declare-datatypes ((ValueCell!2969 0))(
  ( (ValueCellFull!2969 (v!5470 V!8481)) (EmptyCell!2969) )
))
(declare-datatypes ((array!12597 0))(
  ( (array!12598 (arr!5961 (Array (_ BitVec 32) ValueCell!2969)) (size!6312 (_ BitVec 32))) )
))
(declare-datatypes ((array!12599 0))(
  ( (array!12600 (arr!5962 (Array (_ BitVec 32) (_ BitVec 64))) (size!6313 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3838 0))(
  ( (LongMapFixedSize!3839 (defaultEntry!4807 Int) (mask!11143 (_ BitVec 32)) (extraKeys!4544 (_ BitVec 32)) (zeroValue!4648 V!8481) (minValue!4648 V!8481) (_size!1968 (_ BitVec 32)) (_keys!6990 array!12599) (_values!4790 array!12597) (_vacant!1968 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3838)

(declare-fun valid!1503 (LongMapFixedSize!3838) Bool)

(assert (=> start!25022 (= res!127365 (valid!1503 thiss!1504))))

(assert (=> start!25022 e!168917))

(declare-fun e!168911 () Bool)

(assert (=> start!25022 e!168911))

(assert (=> start!25022 true))

(declare-fun tp_is_empty!6625 () Bool)

(assert (=> start!25022 tp_is_empty!6625))

(declare-fun mapNonEmpty!11292 () Bool)

(declare-fun mapRes!11292 () Bool)

(declare-fun tp!23615 () Bool)

(declare-fun e!168907 () Bool)

(assert (=> mapNonEmpty!11292 (= mapRes!11292 (and tp!23615 e!168907))))

(declare-fun mapRest!11292 () (Array (_ BitVec 32) ValueCell!2969))

(declare-fun mapKey!11292 () (_ BitVec 32))

(declare-fun mapValue!11292 () ValueCell!2969)

(assert (=> mapNonEmpty!11292 (= (arr!5961 (_values!4790 thiss!1504)) (store mapRest!11292 mapKey!11292 mapValue!11292))))

(declare-fun b!260657 () Bool)

(declare-datatypes ((Unit!8064 0))(
  ( (Unit!8065) )
))
(declare-fun e!168913 () Unit!8064)

(declare-fun Unit!8066 () Unit!8064)

(assert (=> b!260657 (= e!168913 Unit!8066)))

(declare-fun b!260658 () Bool)

(declare-fun e!168916 () Bool)

(assert (=> b!260658 (= e!168916 (or (not (= (size!6312 (_values!4790 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11143 thiss!1504)))) (not (= (size!6313 (_keys!6990 thiss!1504)) (size!6312 (_values!4790 thiss!1504)))) (bvslt (mask!11143 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4544 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4544 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!260659 () Bool)

(declare-fun e!168914 () Bool)

(assert (=> b!260659 (= e!168917 e!168914)))

(declare-fun res!127361 () Bool)

(assert (=> b!260659 (=> (not res!127361) (not e!168914))))

(declare-datatypes ((SeekEntryResult!1180 0))(
  ( (MissingZero!1180 (index!6890 (_ BitVec 32))) (Found!1180 (index!6891 (_ BitVec 32))) (Intermediate!1180 (undefined!1992 Bool) (index!6892 (_ BitVec 32)) (x!25143 (_ BitVec 32))) (Undefined!1180) (MissingVacant!1180 (index!6893 (_ BitVec 32))) )
))
(declare-fun lt!131416 () SeekEntryResult!1180)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!260659 (= res!127361 (or (= lt!131416 (MissingZero!1180 index!297)) (= lt!131416 (MissingVacant!1180 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12599 (_ BitVec 32)) SeekEntryResult!1180)

(assert (=> b!260659 (= lt!131416 (seekEntryOrOpen!0 key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(declare-fun b!260660 () Bool)

(declare-fun e!168905 () Unit!8064)

(declare-fun Unit!8067 () Unit!8064)

(assert (=> b!260660 (= e!168905 Unit!8067)))

(declare-fun lt!131408 () Unit!8064)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!440 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) Int) Unit!8064)

(assert (=> b!260660 (= lt!131408 (lemmaInListMapThenSeekEntryOrOpenFindsIt!440 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)))))

(assert (=> b!260660 false))

(declare-fun b!260661 () Bool)

(declare-fun res!127364 () Bool)

(assert (=> b!260661 (=> (not res!127364) (not e!168908))))

(assert (=> b!260661 (= res!127364 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6890 lt!131416)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260662 () Bool)

(declare-fun Unit!8068 () Unit!8064)

(assert (=> b!260662 (= e!168913 Unit!8068)))

(declare-fun lt!131404 () Unit!8064)

(declare-fun lemmaArrayContainsKeyThenInListMap!252 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) (_ BitVec 32) Int) Unit!8064)

(assert (=> b!260662 (= lt!131404 (lemmaArrayContainsKeyThenInListMap!252 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(assert (=> b!260662 false))

(declare-fun b!260663 () Bool)

(assert (=> b!260663 (= e!168907 tp_is_empty!6625)))

(declare-fun b!260664 () Bool)

(declare-fun res!127359 () Bool)

(assert (=> b!260664 (=> (not res!127359) (not e!168917))))

(assert (=> b!260664 (= res!127359 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260665 () Bool)

(declare-fun e!168915 () Bool)

(assert (=> b!260665 (= e!168915 tp_is_empty!6625)))

(declare-fun bm!24852 () Bool)

(declare-fun arrayContainsKey!0 (array!12599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24852 (= call!24855 (arrayContainsKey!0 (_keys!6990 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260666 () Bool)

(get-info :version)

(assert (=> b!260666 (= e!168904 ((_ is Undefined!1180) lt!131416))))

(declare-fun b!260667 () Bool)

(declare-fun e!168918 () Bool)

(assert (=> b!260667 (= e!168918 (and e!168915 mapRes!11292))))

(declare-fun condMapEmpty!11292 () Bool)

(declare-fun mapDefault!11292 () ValueCell!2969)

(assert (=> b!260667 (= condMapEmpty!11292 (= (arr!5961 (_values!4790 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2969)) mapDefault!11292)))))

(declare-fun b!260668 () Bool)

(declare-fun e!168910 () Bool)

(assert (=> b!260668 (= e!168914 e!168910)))

(declare-fun res!127366 () Bool)

(assert (=> b!260668 (=> (not res!127366) (not e!168910))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260668 (= res!127366 (inRange!0 index!297 (mask!11143 thiss!1504)))))

(declare-fun lt!131415 () Unit!8064)

(assert (=> b!260668 (= lt!131415 e!168905)))

(declare-fun c!44328 () Bool)

(declare-datatypes ((tuple2!4900 0))(
  ( (tuple2!4901 (_1!2461 (_ BitVec 64)) (_2!2461 V!8481)) )
))
(declare-datatypes ((List!3798 0))(
  ( (Nil!3795) (Cons!3794 (h!4459 tuple2!4900) (t!8860 List!3798)) )
))
(declare-datatypes ((ListLongMap!3803 0))(
  ( (ListLongMap!3804 (toList!1917 List!3798)) )
))
(declare-fun lt!131403 () ListLongMap!3803)

(declare-fun contains!1875 (ListLongMap!3803 (_ BitVec 64)) Bool)

(assert (=> b!260668 (= c!44328 (contains!1875 lt!131403 key!932))))

(declare-fun getCurrentListMap!1426 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 32) Int) ListLongMap!3803)

(assert (=> b!260668 (= lt!131403 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun b!260669 () Bool)

(assert (=> b!260669 (= e!168910 (not e!168916))))

(declare-fun res!127362 () Bool)

(assert (=> b!260669 (=> res!127362 e!168916)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!260669 (= res!127362 (not (validMask!0 (mask!11143 thiss!1504))))))

(declare-fun lt!131407 () array!12599)

(declare-fun arrayCountValidKeys!0 (array!12599 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260669 (= (arrayCountValidKeys!0 lt!131407 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!131411 () Unit!8064)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12599 (_ BitVec 32)) Unit!8064)

(assert (=> b!260669 (= lt!131411 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131407 index!297))))

(assert (=> b!260669 (arrayContainsKey!0 lt!131407 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131413 () Unit!8064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12599 (_ BitVec 64) (_ BitVec 32)) Unit!8064)

(assert (=> b!260669 (= lt!131413 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131407 key!932 index!297))))

(declare-fun v!346 () V!8481)

(declare-fun +!704 (ListLongMap!3803 tuple2!4900) ListLongMap!3803)

(assert (=> b!260669 (= (+!704 lt!131403 (tuple2!4901 key!932 v!346)) (getCurrentListMap!1426 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131412 () Unit!8064)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!115 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 32) (_ BitVec 64) V!8481 Int) Unit!8064)

(assert (=> b!260669 (= lt!131412 (lemmaAddValidKeyToArrayThenAddPairToListMap!115 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) index!297 key!932 v!346 (defaultEntry!4807 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12599 (_ BitVec 32)) Bool)

(assert (=> b!260669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131407 (mask!11143 thiss!1504))))

(declare-fun lt!131406 () Unit!8064)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12599 (_ BitVec 32) (_ BitVec 32)) Unit!8064)

(assert (=> b!260669 (= lt!131406 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6990 thiss!1504) index!297 (mask!11143 thiss!1504)))))

(assert (=> b!260669 (= (arrayCountValidKeys!0 lt!131407 #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6990 thiss!1504) #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504)))))))

(declare-fun lt!131405 () Unit!8064)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12599 (_ BitVec 32) (_ BitVec 64)) Unit!8064)

(assert (=> b!260669 (= lt!131405 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6990 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3799 0))(
  ( (Nil!3796) (Cons!3795 (h!4460 (_ BitVec 64)) (t!8861 List!3799)) )
))
(declare-fun arrayNoDuplicates!0 (array!12599 (_ BitVec 32) List!3799) Bool)

(assert (=> b!260669 (arrayNoDuplicates!0 lt!131407 #b00000000000000000000000000000000 Nil!3796)))

(assert (=> b!260669 (= lt!131407 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun lt!131414 () Unit!8064)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12599 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3799) Unit!8064)

(assert (=> b!260669 (= lt!131414 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6990 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3796))))

(declare-fun lt!131409 () Unit!8064)

(assert (=> b!260669 (= lt!131409 e!168913)))

(declare-fun c!44330 () Bool)

(assert (=> b!260669 (= c!44330 (arrayContainsKey!0 (_keys!6990 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3945 (array!12599) Bool)

(declare-fun array_inv!3946 (array!12597) Bool)

(assert (=> b!260670 (= e!168911 (and tp!23616 tp_is_empty!6625 (array_inv!3945 (_keys!6990 thiss!1504)) (array_inv!3946 (_values!4790 thiss!1504)) e!168918))))

(declare-fun b!260671 () Bool)

(assert (=> b!260671 (= e!168908 (not call!24855))))

(declare-fun b!260672 () Bool)

(declare-fun lt!131410 () Unit!8064)

(assert (=> b!260672 (= e!168905 lt!131410)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!441 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) Int) Unit!8064)

(assert (=> b!260672 (= lt!131410 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!441 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)))))

(declare-fun c!44331 () Bool)

(assert (=> b!260672 (= c!44331 ((_ is MissingZero!1180) lt!131416))))

(assert (=> b!260672 e!168906))

(declare-fun b!260673 () Bool)

(declare-fun c!44329 () Bool)

(assert (=> b!260673 (= c!44329 ((_ is MissingVacant!1180) lt!131416))))

(assert (=> b!260673 (= e!168906 e!168904)))

(declare-fun mapIsEmpty!11292 () Bool)

(assert (=> mapIsEmpty!11292 mapRes!11292))

(declare-fun bm!24853 () Bool)

(assert (=> bm!24853 (= call!24856 (inRange!0 (ite c!44331 (index!6890 lt!131416) (index!6893 lt!131416)) (mask!11143 thiss!1504)))))

(declare-fun b!260674 () Bool)

(declare-fun res!127360 () Bool)

(assert (=> b!260674 (= res!127360 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6893 lt!131416)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260674 (=> (not res!127360) (not e!168909))))

(assert (= (and start!25022 res!127365) b!260664))

(assert (= (and b!260664 res!127359) b!260659))

(assert (= (and b!260659 res!127361) b!260668))

(assert (= (and b!260668 c!44328) b!260660))

(assert (= (and b!260668 (not c!44328)) b!260672))

(assert (= (and b!260672 c!44331) b!260654))

(assert (= (and b!260672 (not c!44331)) b!260673))

(assert (= (and b!260654 res!127363) b!260661))

(assert (= (and b!260661 res!127364) b!260671))

(assert (= (and b!260673 c!44329) b!260655))

(assert (= (and b!260673 (not c!44329)) b!260666))

(assert (= (and b!260655 res!127367) b!260674))

(assert (= (and b!260674 res!127360) b!260656))

(assert (= (or b!260654 b!260655) bm!24853))

(assert (= (or b!260671 b!260656) bm!24852))

(assert (= (and b!260668 res!127366) b!260669))

(assert (= (and b!260669 c!44330) b!260662))

(assert (= (and b!260669 (not c!44330)) b!260657))

(assert (= (and b!260669 (not res!127362)) b!260658))

(assert (= (and b!260667 condMapEmpty!11292) mapIsEmpty!11292))

(assert (= (and b!260667 (not condMapEmpty!11292)) mapNonEmpty!11292))

(assert (= (and mapNonEmpty!11292 ((_ is ValueCellFull!2969) mapValue!11292)) b!260663))

(assert (= (and b!260667 ((_ is ValueCellFull!2969) mapDefault!11292)) b!260665))

(assert (= b!260670 b!260667))

(assert (= start!25022 b!260670))

(declare-fun m!276067 () Bool)

(assert (=> b!260659 m!276067))

(declare-fun m!276069 () Bool)

(assert (=> b!260662 m!276069))

(declare-fun m!276071 () Bool)

(assert (=> bm!24852 m!276071))

(declare-fun m!276073 () Bool)

(assert (=> b!260661 m!276073))

(declare-fun m!276075 () Bool)

(assert (=> b!260674 m!276075))

(declare-fun m!276077 () Bool)

(assert (=> mapNonEmpty!11292 m!276077))

(declare-fun m!276079 () Bool)

(assert (=> bm!24853 m!276079))

(declare-fun m!276081 () Bool)

(assert (=> b!260672 m!276081))

(declare-fun m!276083 () Bool)

(assert (=> start!25022 m!276083))

(declare-fun m!276085 () Bool)

(assert (=> b!260670 m!276085))

(declare-fun m!276087 () Bool)

(assert (=> b!260670 m!276087))

(declare-fun m!276089 () Bool)

(assert (=> b!260669 m!276089))

(declare-fun m!276091 () Bool)

(assert (=> b!260669 m!276091))

(declare-fun m!276093 () Bool)

(assert (=> b!260669 m!276093))

(declare-fun m!276095 () Bool)

(assert (=> b!260669 m!276095))

(declare-fun m!276097 () Bool)

(assert (=> b!260669 m!276097))

(declare-fun m!276099 () Bool)

(assert (=> b!260669 m!276099))

(declare-fun m!276101 () Bool)

(assert (=> b!260669 m!276101))

(declare-fun m!276103 () Bool)

(assert (=> b!260669 m!276103))

(declare-fun m!276105 () Bool)

(assert (=> b!260669 m!276105))

(declare-fun m!276107 () Bool)

(assert (=> b!260669 m!276107))

(declare-fun m!276109 () Bool)

(assert (=> b!260669 m!276109))

(declare-fun m!276111 () Bool)

(assert (=> b!260669 m!276111))

(declare-fun m!276113 () Bool)

(assert (=> b!260669 m!276113))

(declare-fun m!276115 () Bool)

(assert (=> b!260669 m!276115))

(assert (=> b!260669 m!276071))

(declare-fun m!276117 () Bool)

(assert (=> b!260669 m!276117))

(declare-fun m!276119 () Bool)

(assert (=> b!260669 m!276119))

(declare-fun m!276121 () Bool)

(assert (=> b!260669 m!276121))

(declare-fun m!276123 () Bool)

(assert (=> b!260660 m!276123))

(declare-fun m!276125 () Bool)

(assert (=> b!260668 m!276125))

(declare-fun m!276127 () Bool)

(assert (=> b!260668 m!276127))

(declare-fun m!276129 () Bool)

(assert (=> b!260668 m!276129))

(check-sat (not bm!24853) (not start!25022) (not bm!24852) (not b!260672) (not b!260670) tp_is_empty!6625 (not mapNonEmpty!11292) (not b!260662) (not b_next!6763) (not b!260659) b_and!13857 (not b!260660) (not b!260668) (not b!260669))
(check-sat b_and!13857 (not b_next!6763))
(get-model)

(declare-fun d!62555 () Bool)

(assert (=> d!62555 (= (inRange!0 (ite c!44331 (index!6890 lt!131416) (index!6893 lt!131416)) (mask!11143 thiss!1504)) (and (bvsge (ite c!44331 (index!6890 lt!131416) (index!6893 lt!131416)) #b00000000000000000000000000000000) (bvslt (ite c!44331 (index!6890 lt!131416) (index!6893 lt!131416)) (bvadd (mask!11143 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24853 d!62555))

(declare-fun d!62557 () Bool)

(declare-fun e!169011 () Bool)

(assert (=> d!62557 e!169011))

(declare-fun res!127427 () Bool)

(assert (=> d!62557 (=> (not res!127427) (not e!169011))))

(declare-fun lt!131505 () SeekEntryResult!1180)

(assert (=> d!62557 (= res!127427 ((_ is Found!1180) lt!131505))))

(assert (=> d!62557 (= lt!131505 (seekEntryOrOpen!0 key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(declare-fun lt!131506 () Unit!8064)

(declare-fun choose!1279 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) Int) Unit!8064)

(assert (=> d!62557 (= lt!131506 (choose!1279 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62557 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62557 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!440 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)) lt!131506)))

(declare-fun b!260805 () Bool)

(declare-fun res!127426 () Bool)

(assert (=> b!260805 (=> (not res!127426) (not e!169011))))

(assert (=> b!260805 (= res!127426 (inRange!0 (index!6891 lt!131505) (mask!11143 thiss!1504)))))

(declare-fun b!260806 () Bool)

(assert (=> b!260806 (= e!169011 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6891 lt!131505)) key!932))))

(assert (=> b!260806 (and (bvsge (index!6891 lt!131505) #b00000000000000000000000000000000) (bvslt (index!6891 lt!131505) (size!6313 (_keys!6990 thiss!1504))))))

(assert (= (and d!62557 res!127427) b!260805))

(assert (= (and b!260805 res!127426) b!260806))

(assert (=> d!62557 m!276067))

(declare-fun m!276259 () Bool)

(assert (=> d!62557 m!276259))

(assert (=> d!62557 m!276089))

(declare-fun m!276261 () Bool)

(assert (=> b!260805 m!276261))

(declare-fun m!276263 () Bool)

(assert (=> b!260806 m!276263))

(assert (=> b!260660 d!62557))

(declare-fun d!62559 () Bool)

(assert (=> d!62559 (= (array_inv!3945 (_keys!6990 thiss!1504)) (bvsge (size!6313 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260670 d!62559))

(declare-fun d!62561 () Bool)

(assert (=> d!62561 (= (array_inv!3946 (_values!4790 thiss!1504)) (bvsge (size!6312 (_values!4790 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260670 d!62561))

(declare-fun d!62563 () Bool)

(declare-fun res!127432 () Bool)

(declare-fun e!169016 () Bool)

(assert (=> d!62563 (=> res!127432 e!169016)))

(assert (=> d!62563 (= res!127432 (= (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62563 (= (arrayContainsKey!0 (_keys!6990 thiss!1504) key!932 #b00000000000000000000000000000000) e!169016)))

(declare-fun b!260811 () Bool)

(declare-fun e!169017 () Bool)

(assert (=> b!260811 (= e!169016 e!169017)))

(declare-fun res!127433 () Bool)

(assert (=> b!260811 (=> (not res!127433) (not e!169017))))

(assert (=> b!260811 (= res!127433 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun b!260812 () Bool)

(assert (=> b!260812 (= e!169017 (arrayContainsKey!0 (_keys!6990 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62563 (not res!127432)) b!260811))

(assert (= (and b!260811 res!127433) b!260812))

(declare-fun m!276265 () Bool)

(assert (=> d!62563 m!276265))

(declare-fun m!276267 () Bool)

(assert (=> b!260812 m!276267))

(assert (=> bm!24852 d!62563))

(declare-fun d!62565 () Bool)

(assert (=> d!62565 (contains!1875 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) key!932)))

(declare-fun lt!131509 () Unit!8064)

(declare-fun choose!1280 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) (_ BitVec 32) Int) Unit!8064)

(assert (=> d!62565 (= lt!131509 (choose!1280 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62565 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62565 (= (lemmaArrayContainsKeyThenInListMap!252 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131509)))

(declare-fun bs!9172 () Bool)

(assert (= bs!9172 d!62565))

(assert (=> bs!9172 m!276129))

(assert (=> bs!9172 m!276129))

(declare-fun m!276269 () Bool)

(assert (=> bs!9172 m!276269))

(declare-fun m!276271 () Bool)

(assert (=> bs!9172 m!276271))

(assert (=> bs!9172 m!276089))

(assert (=> b!260662 d!62565))

(declare-fun call!24874 () Bool)

(declare-fun c!44360 () Bool)

(declare-fun bm!24870 () Bool)

(declare-fun lt!131515 () SeekEntryResult!1180)

(assert (=> bm!24870 (= call!24874 (inRange!0 (ite c!44360 (index!6890 lt!131515) (index!6893 lt!131515)) (mask!11143 thiss!1504)))))

(declare-fun b!260829 () Bool)

(declare-fun res!127443 () Bool)

(declare-fun e!169027 () Bool)

(assert (=> b!260829 (=> (not res!127443) (not e!169027))))

(assert (=> b!260829 (= res!127443 call!24874)))

(declare-fun e!169028 () Bool)

(assert (=> b!260829 (= e!169028 e!169027)))

(declare-fun b!260830 () Bool)

(declare-fun e!169029 () Bool)

(declare-fun call!24873 () Bool)

(assert (=> b!260830 (= e!169029 (not call!24873))))

(declare-fun b!260831 () Bool)

(declare-fun e!169026 () Bool)

(assert (=> b!260831 (= e!169026 e!169029)))

(declare-fun res!127444 () Bool)

(assert (=> b!260831 (= res!127444 call!24874)))

(assert (=> b!260831 (=> (not res!127444) (not e!169029))))

(declare-fun b!260832 () Bool)

(assert (=> b!260832 (and (bvsge (index!6890 lt!131515) #b00000000000000000000000000000000) (bvslt (index!6890 lt!131515) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun res!127445 () Bool)

(assert (=> b!260832 (= res!127445 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6890 lt!131515)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260832 (=> (not res!127445) (not e!169029))))

(declare-fun d!62567 () Bool)

(assert (=> d!62567 e!169026))

(assert (=> d!62567 (= c!44360 ((_ is MissingZero!1180) lt!131515))))

(assert (=> d!62567 (= lt!131515 (seekEntryOrOpen!0 key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(declare-fun lt!131514 () Unit!8064)

(declare-fun choose!1281 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) Int) Unit!8064)

(assert (=> d!62567 (= lt!131514 (choose!1281 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62567 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62567 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!441 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)) lt!131514)))

(declare-fun b!260833 () Bool)

(assert (=> b!260833 (= e!169027 (not call!24873))))

(declare-fun bm!24871 () Bool)

(assert (=> bm!24871 (= call!24873 (arrayContainsKey!0 (_keys!6990 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260834 () Bool)

(assert (=> b!260834 (= e!169026 e!169028)))

(declare-fun c!44361 () Bool)

(assert (=> b!260834 (= c!44361 ((_ is MissingVacant!1180) lt!131515))))

(declare-fun b!260835 () Bool)

(assert (=> b!260835 (= e!169028 ((_ is Undefined!1180) lt!131515))))

(declare-fun b!260836 () Bool)

(declare-fun res!127442 () Bool)

(assert (=> b!260836 (=> (not res!127442) (not e!169027))))

(assert (=> b!260836 (= res!127442 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6893 lt!131515)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260836 (and (bvsge (index!6893 lt!131515) #b00000000000000000000000000000000) (bvslt (index!6893 lt!131515) (size!6313 (_keys!6990 thiss!1504))))))

(assert (= (and d!62567 c!44360) b!260831))

(assert (= (and d!62567 (not c!44360)) b!260834))

(assert (= (and b!260831 res!127444) b!260832))

(assert (= (and b!260832 res!127445) b!260830))

(assert (= (and b!260834 c!44361) b!260829))

(assert (= (and b!260834 (not c!44361)) b!260835))

(assert (= (and b!260829 res!127443) b!260836))

(assert (= (and b!260836 res!127442) b!260833))

(assert (= (or b!260831 b!260829) bm!24870))

(assert (= (or b!260830 b!260833) bm!24871))

(assert (=> d!62567 m!276067))

(declare-fun m!276273 () Bool)

(assert (=> d!62567 m!276273))

(assert (=> d!62567 m!276089))

(declare-fun m!276275 () Bool)

(assert (=> bm!24870 m!276275))

(assert (=> bm!24871 m!276071))

(declare-fun m!276277 () Bool)

(assert (=> b!260836 m!276277))

(declare-fun m!276279 () Bool)

(assert (=> b!260832 m!276279))

(assert (=> b!260672 d!62567))

(declare-fun d!62569 () Bool)

(declare-fun res!127452 () Bool)

(declare-fun e!169032 () Bool)

(assert (=> d!62569 (=> (not res!127452) (not e!169032))))

(declare-fun simpleValid!282 (LongMapFixedSize!3838) Bool)

(assert (=> d!62569 (= res!127452 (simpleValid!282 thiss!1504))))

(assert (=> d!62569 (= (valid!1503 thiss!1504) e!169032)))

(declare-fun b!260843 () Bool)

(declare-fun res!127453 () Bool)

(assert (=> b!260843 (=> (not res!127453) (not e!169032))))

(assert (=> b!260843 (= res!127453 (= (arrayCountValidKeys!0 (_keys!6990 thiss!1504) #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) (_size!1968 thiss!1504)))))

(declare-fun b!260844 () Bool)

(declare-fun res!127454 () Bool)

(assert (=> b!260844 (=> (not res!127454) (not e!169032))))

(assert (=> b!260844 (= res!127454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(declare-fun b!260845 () Bool)

(assert (=> b!260845 (= e!169032 (arrayNoDuplicates!0 (_keys!6990 thiss!1504) #b00000000000000000000000000000000 Nil!3796))))

(assert (= (and d!62569 res!127452) b!260843))

(assert (= (and b!260843 res!127453) b!260844))

(assert (= (and b!260844 res!127454) b!260845))

(declare-fun m!276281 () Bool)

(assert (=> d!62569 m!276281))

(assert (=> b!260843 m!276109))

(declare-fun m!276283 () Bool)

(assert (=> b!260844 m!276283))

(declare-fun m!276285 () Bool)

(assert (=> b!260845 m!276285))

(assert (=> start!25022 d!62569))

(declare-fun d!62571 () Bool)

(assert (=> d!62571 (= (inRange!0 index!297 (mask!11143 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11143 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260668 d!62571))

(declare-fun d!62573 () Bool)

(declare-fun e!169038 () Bool)

(assert (=> d!62573 e!169038))

(declare-fun res!127457 () Bool)

(assert (=> d!62573 (=> res!127457 e!169038)))

(declare-fun lt!131526 () Bool)

(assert (=> d!62573 (= res!127457 (not lt!131526))))

(declare-fun lt!131525 () Bool)

(assert (=> d!62573 (= lt!131526 lt!131525)))

(declare-fun lt!131527 () Unit!8064)

(declare-fun e!169037 () Unit!8064)

(assert (=> d!62573 (= lt!131527 e!169037)))

(declare-fun c!44364 () Bool)

(assert (=> d!62573 (= c!44364 lt!131525)))

(declare-fun containsKey!307 (List!3798 (_ BitVec 64)) Bool)

(assert (=> d!62573 (= lt!131525 (containsKey!307 (toList!1917 lt!131403) key!932))))

(assert (=> d!62573 (= (contains!1875 lt!131403 key!932) lt!131526)))

(declare-fun b!260852 () Bool)

(declare-fun lt!131524 () Unit!8064)

(assert (=> b!260852 (= e!169037 lt!131524)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!256 (List!3798 (_ BitVec 64)) Unit!8064)

(assert (=> b!260852 (= lt!131524 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131403) key!932))))

(declare-datatypes ((Option!321 0))(
  ( (Some!320 (v!5475 V!8481)) (None!319) )
))
(declare-fun isDefined!257 (Option!321) Bool)

(declare-fun getValueByKey!315 (List!3798 (_ BitVec 64)) Option!321)

(assert (=> b!260852 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131403) key!932))))

(declare-fun b!260853 () Bool)

(declare-fun Unit!8073 () Unit!8064)

(assert (=> b!260853 (= e!169037 Unit!8073)))

(declare-fun b!260854 () Bool)

(assert (=> b!260854 (= e!169038 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131403) key!932)))))

(assert (= (and d!62573 c!44364) b!260852))

(assert (= (and d!62573 (not c!44364)) b!260853))

(assert (= (and d!62573 (not res!127457)) b!260854))

(declare-fun m!276287 () Bool)

(assert (=> d!62573 m!276287))

(declare-fun m!276289 () Bool)

(assert (=> b!260852 m!276289))

(declare-fun m!276291 () Bool)

(assert (=> b!260852 m!276291))

(assert (=> b!260852 m!276291))

(declare-fun m!276293 () Bool)

(assert (=> b!260852 m!276293))

(assert (=> b!260854 m!276291))

(assert (=> b!260854 m!276291))

(assert (=> b!260854 m!276293))

(assert (=> b!260668 d!62573))

(declare-fun b!260897 () Bool)

(declare-fun e!169068 () ListLongMap!3803)

(declare-fun call!24895 () ListLongMap!3803)

(assert (=> b!260897 (= e!169068 (+!704 call!24895 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(declare-fun b!260898 () Bool)

(declare-fun e!169065 () Unit!8064)

(declare-fun Unit!8074 () Unit!8064)

(assert (=> b!260898 (= e!169065 Unit!8074)))

(declare-fun b!260899 () Bool)

(declare-fun e!169077 () Bool)

(declare-fun lt!131582 () ListLongMap!3803)

(declare-fun apply!259 (ListLongMap!3803 (_ BitVec 64)) V!8481)

(assert (=> b!260899 (= e!169077 (= (apply!259 lt!131582 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4648 thiss!1504)))))

(declare-fun b!260900 () Bool)

(declare-fun e!169076 () ListLongMap!3803)

(declare-fun call!24889 () ListLongMap!3803)

(assert (=> b!260900 (= e!169076 call!24889)))

(declare-fun b!260901 () Bool)

(declare-fun e!169072 () Bool)

(declare-fun e!169069 () Bool)

(assert (=> b!260901 (= e!169072 e!169069)))

(declare-fun c!44378 () Bool)

(assert (=> b!260901 (= c!44378 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24886 () Bool)

(declare-fun call!24890 () Bool)

(assert (=> bm!24886 (= call!24890 (contains!1875 lt!131582 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260902 () Bool)

(declare-fun c!44382 () Bool)

(assert (=> b!260902 (= c!44382 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169067 () ListLongMap!3803)

(assert (=> b!260902 (= e!169067 e!169076)))

(declare-fun b!260903 () Bool)

(assert (=> b!260903 (= e!169068 e!169067)))

(declare-fun c!44377 () Bool)

(assert (=> b!260903 (= c!44377 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260904 () Bool)

(declare-fun e!169066 () Bool)

(assert (=> b!260904 (= e!169066 (= (apply!259 lt!131582 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4648 thiss!1504)))))

(declare-fun b!260905 () Bool)

(declare-fun call!24894 () ListLongMap!3803)

(assert (=> b!260905 (= e!169067 call!24894)))

(declare-fun b!260906 () Bool)

(declare-fun e!169070 () Bool)

(assert (=> b!260906 (= e!169070 e!169066)))

(declare-fun res!127480 () Bool)

(declare-fun call!24891 () Bool)

(assert (=> b!260906 (= res!127480 call!24891)))

(assert (=> b!260906 (=> (not res!127480) (not e!169066))))

(declare-fun b!260907 () Bool)

(declare-fun res!127483 () Bool)

(assert (=> b!260907 (=> (not res!127483) (not e!169072))))

(assert (=> b!260907 (= res!127483 e!169070)))

(declare-fun c!44379 () Bool)

(assert (=> b!260907 (= c!44379 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!62575 () Bool)

(assert (=> d!62575 e!169072))

(declare-fun res!127482 () Bool)

(assert (=> d!62575 (=> (not res!127482) (not e!169072))))

(assert (=> d!62575 (= res!127482 (or (bvsge #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))))

(declare-fun lt!131584 () ListLongMap!3803)

(assert (=> d!62575 (= lt!131582 lt!131584)))

(declare-fun lt!131587 () Unit!8064)

(assert (=> d!62575 (= lt!131587 e!169065)))

(declare-fun c!44381 () Bool)

(declare-fun e!169075 () Bool)

(assert (=> d!62575 (= c!44381 e!169075)))

(declare-fun res!127476 () Bool)

(assert (=> d!62575 (=> (not res!127476) (not e!169075))))

(assert (=> d!62575 (= res!127476 (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62575 (= lt!131584 e!169068)))

(declare-fun c!44380 () Bool)

(assert (=> d!62575 (= c!44380 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62575 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62575 (= (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131582)))

(declare-fun b!260908 () Bool)

(assert (=> b!260908 (= e!169076 call!24894)))

(declare-fun b!260909 () Bool)

(assert (=> b!260909 (= e!169069 e!169077)))

(declare-fun res!127477 () Bool)

(assert (=> b!260909 (= res!127477 call!24890)))

(assert (=> b!260909 (=> (not res!127477) (not e!169077))))

(declare-fun b!260910 () Bool)

(assert (=> b!260910 (= e!169069 (not call!24890))))

(declare-fun b!260911 () Bool)

(declare-fun e!169071 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!260911 (= e!169071 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260912 () Bool)

(declare-fun res!127481 () Bool)

(assert (=> b!260912 (=> (not res!127481) (not e!169072))))

(declare-fun e!169073 () Bool)

(assert (=> b!260912 (= res!127481 e!169073)))

(declare-fun res!127479 () Bool)

(assert (=> b!260912 (=> res!127479 e!169073)))

(assert (=> b!260912 (= res!127479 (not e!169071))))

(declare-fun res!127478 () Bool)

(assert (=> b!260912 (=> (not res!127478) (not e!169071))))

(assert (=> b!260912 (= res!127478 (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun bm!24887 () Bool)

(declare-fun call!24892 () ListLongMap!3803)

(declare-fun call!24893 () ListLongMap!3803)

(assert (=> bm!24887 (= call!24892 call!24893)))

(declare-fun b!260913 () Bool)

(assert (=> b!260913 (= e!169075 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24888 () Bool)

(assert (=> bm!24888 (= call!24895 (+!704 (ite c!44380 call!24893 (ite c!44377 call!24892 call!24889)) (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun bm!24889 () Bool)

(assert (=> bm!24889 (= call!24894 call!24895)))

(declare-fun b!260914 () Bool)

(assert (=> b!260914 (= e!169070 (not call!24891))))

(declare-fun b!260915 () Bool)

(declare-fun e!169074 () Bool)

(declare-fun get!3071 (ValueCell!2969 V!8481) V!8481)

(declare-fun dynLambda!593 (Int (_ BitVec 64)) V!8481)

(assert (=> b!260915 (= e!169074 (= (apply!259 lt!131582 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)) (get!3071 (select (arr!5961 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260915 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (_values!4790 thiss!1504))))))

(assert (=> b!260915 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun bm!24890 () Bool)

(assert (=> bm!24890 (= call!24889 call!24892)))

(declare-fun bm!24891 () Bool)

(assert (=> bm!24891 (= call!24891 (contains!1875 lt!131582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24892 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!575 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 32) Int) ListLongMap!3803)

(assert (=> bm!24892 (= call!24893 (getCurrentListMapNoExtraKeys!575 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun b!260916 () Bool)

(declare-fun lt!131586 () Unit!8064)

(assert (=> b!260916 (= e!169065 lt!131586)))

(declare-fun lt!131590 () ListLongMap!3803)

(assert (=> b!260916 (= lt!131590 (getCurrentListMapNoExtraKeys!575 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131577 () (_ BitVec 64))

(assert (=> b!260916 (= lt!131577 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131573 () (_ BitVec 64))

(assert (=> b!260916 (= lt!131573 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131581 () Unit!8064)

(declare-fun addStillContains!235 (ListLongMap!3803 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8064)

(assert (=> b!260916 (= lt!131581 (addStillContains!235 lt!131590 lt!131577 (zeroValue!4648 thiss!1504) lt!131573))))

(assert (=> b!260916 (contains!1875 (+!704 lt!131590 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504))) lt!131573)))

(declare-fun lt!131585 () Unit!8064)

(assert (=> b!260916 (= lt!131585 lt!131581)))

(declare-fun lt!131579 () ListLongMap!3803)

(assert (=> b!260916 (= lt!131579 (getCurrentListMapNoExtraKeys!575 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131572 () (_ BitVec 64))

(assert (=> b!260916 (= lt!131572 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131588 () (_ BitVec 64))

(assert (=> b!260916 (= lt!131588 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131576 () Unit!8064)

(declare-fun addApplyDifferent!235 (ListLongMap!3803 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8064)

(assert (=> b!260916 (= lt!131576 (addApplyDifferent!235 lt!131579 lt!131572 (minValue!4648 thiss!1504) lt!131588))))

(assert (=> b!260916 (= (apply!259 (+!704 lt!131579 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504))) lt!131588) (apply!259 lt!131579 lt!131588))))

(declare-fun lt!131591 () Unit!8064)

(assert (=> b!260916 (= lt!131591 lt!131576)))

(declare-fun lt!131592 () ListLongMap!3803)

(assert (=> b!260916 (= lt!131592 (getCurrentListMapNoExtraKeys!575 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131580 () (_ BitVec 64))

(assert (=> b!260916 (= lt!131580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131574 () (_ BitVec 64))

(assert (=> b!260916 (= lt!131574 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131583 () Unit!8064)

(assert (=> b!260916 (= lt!131583 (addApplyDifferent!235 lt!131592 lt!131580 (zeroValue!4648 thiss!1504) lt!131574))))

(assert (=> b!260916 (= (apply!259 (+!704 lt!131592 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504))) lt!131574) (apply!259 lt!131592 lt!131574))))

(declare-fun lt!131589 () Unit!8064)

(assert (=> b!260916 (= lt!131589 lt!131583)))

(declare-fun lt!131575 () ListLongMap!3803)

(assert (=> b!260916 (= lt!131575 (getCurrentListMapNoExtraKeys!575 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131578 () (_ BitVec 64))

(assert (=> b!260916 (= lt!131578 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131593 () (_ BitVec 64))

(assert (=> b!260916 (= lt!131593 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260916 (= lt!131586 (addApplyDifferent!235 lt!131575 lt!131578 (minValue!4648 thiss!1504) lt!131593))))

(assert (=> b!260916 (= (apply!259 (+!704 lt!131575 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504))) lt!131593) (apply!259 lt!131575 lt!131593))))

(declare-fun b!260917 () Bool)

(assert (=> b!260917 (= e!169073 e!169074)))

(declare-fun res!127484 () Bool)

(assert (=> b!260917 (=> (not res!127484) (not e!169074))))

(assert (=> b!260917 (= res!127484 (contains!1875 lt!131582 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260917 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (= (and d!62575 c!44380) b!260897))

(assert (= (and d!62575 (not c!44380)) b!260903))

(assert (= (and b!260903 c!44377) b!260905))

(assert (= (and b!260903 (not c!44377)) b!260902))

(assert (= (and b!260902 c!44382) b!260908))

(assert (= (and b!260902 (not c!44382)) b!260900))

(assert (= (or b!260908 b!260900) bm!24890))

(assert (= (or b!260905 bm!24890) bm!24887))

(assert (= (or b!260905 b!260908) bm!24889))

(assert (= (or b!260897 bm!24887) bm!24892))

(assert (= (or b!260897 bm!24889) bm!24888))

(assert (= (and d!62575 res!127476) b!260913))

(assert (= (and d!62575 c!44381) b!260916))

(assert (= (and d!62575 (not c!44381)) b!260898))

(assert (= (and d!62575 res!127482) b!260912))

(assert (= (and b!260912 res!127478) b!260911))

(assert (= (and b!260912 (not res!127479)) b!260917))

(assert (= (and b!260917 res!127484) b!260915))

(assert (= (and b!260912 res!127481) b!260907))

(assert (= (and b!260907 c!44379) b!260906))

(assert (= (and b!260907 (not c!44379)) b!260914))

(assert (= (and b!260906 res!127480) b!260904))

(assert (= (or b!260906 b!260914) bm!24891))

(assert (= (and b!260907 res!127483) b!260901))

(assert (= (and b!260901 c!44378) b!260909))

(assert (= (and b!260901 (not c!44378)) b!260910))

(assert (= (and b!260909 res!127477) b!260899))

(assert (= (or b!260909 b!260910) bm!24886))

(declare-fun b_lambda!8269 () Bool)

(assert (=> (not b_lambda!8269) (not b!260915)))

(declare-fun t!8865 () Bool)

(declare-fun tb!3023 () Bool)

(assert (=> (and b!260670 (= (defaultEntry!4807 thiss!1504) (defaultEntry!4807 thiss!1504)) t!8865) tb!3023))

(declare-fun result!5407 () Bool)

(assert (=> tb!3023 (= result!5407 tp_is_empty!6625)))

(assert (=> b!260915 t!8865))

(declare-fun b_and!13863 () Bool)

(assert (= b_and!13857 (and (=> t!8865 result!5407) b_and!13863)))

(declare-fun m!276295 () Bool)

(assert (=> b!260916 m!276295))

(declare-fun m!276297 () Bool)

(assert (=> b!260916 m!276297))

(declare-fun m!276299 () Bool)

(assert (=> b!260916 m!276299))

(declare-fun m!276301 () Bool)

(assert (=> b!260916 m!276301))

(declare-fun m!276303 () Bool)

(assert (=> b!260916 m!276303))

(declare-fun m!276305 () Bool)

(assert (=> b!260916 m!276305))

(declare-fun m!276307 () Bool)

(assert (=> b!260916 m!276307))

(declare-fun m!276309 () Bool)

(assert (=> b!260916 m!276309))

(declare-fun m!276311 () Bool)

(assert (=> b!260916 m!276311))

(assert (=> b!260916 m!276309))

(declare-fun m!276313 () Bool)

(assert (=> b!260916 m!276313))

(assert (=> b!260916 m!276297))

(assert (=> b!260916 m!276265))

(declare-fun m!276315 () Bool)

(assert (=> b!260916 m!276315))

(declare-fun m!276317 () Bool)

(assert (=> b!260916 m!276317))

(declare-fun m!276319 () Bool)

(assert (=> b!260916 m!276319))

(declare-fun m!276321 () Bool)

(assert (=> b!260916 m!276321))

(assert (=> b!260916 m!276319))

(declare-fun m!276323 () Bool)

(assert (=> b!260916 m!276323))

(declare-fun m!276325 () Bool)

(assert (=> b!260916 m!276325))

(assert (=> b!260916 m!276303))

(declare-fun m!276327 () Bool)

(assert (=> b!260897 m!276327))

(assert (=> d!62575 m!276089))

(assert (=> b!260917 m!276265))

(assert (=> b!260917 m!276265))

(declare-fun m!276329 () Bool)

(assert (=> b!260917 m!276329))

(assert (=> b!260913 m!276265))

(assert (=> b!260913 m!276265))

(declare-fun m!276331 () Bool)

(assert (=> b!260913 m!276331))

(declare-fun m!276333 () Bool)

(assert (=> bm!24888 m!276333))

(assert (=> bm!24892 m!276307))

(declare-fun m!276335 () Bool)

(assert (=> b!260899 m!276335))

(assert (=> b!260911 m!276265))

(assert (=> b!260911 m!276265))

(assert (=> b!260911 m!276331))

(declare-fun m!276337 () Bool)

(assert (=> bm!24886 m!276337))

(declare-fun m!276339 () Bool)

(assert (=> b!260915 m!276339))

(declare-fun m!276341 () Bool)

(assert (=> b!260915 m!276341))

(declare-fun m!276343 () Bool)

(assert (=> b!260915 m!276343))

(assert (=> b!260915 m!276341))

(assert (=> b!260915 m!276339))

(assert (=> b!260915 m!276265))

(assert (=> b!260915 m!276265))

(declare-fun m!276345 () Bool)

(assert (=> b!260915 m!276345))

(declare-fun m!276347 () Bool)

(assert (=> bm!24891 m!276347))

(declare-fun m!276349 () Bool)

(assert (=> b!260904 m!276349))

(assert (=> b!260668 d!62575))

(declare-fun b!260932 () Bool)

(declare-fun e!169084 () SeekEntryResult!1180)

(declare-fun e!169086 () SeekEntryResult!1180)

(assert (=> b!260932 (= e!169084 e!169086)))

(declare-fun lt!131601 () (_ BitVec 64))

(declare-fun lt!131600 () SeekEntryResult!1180)

(assert (=> b!260932 (= lt!131601 (select (arr!5962 (_keys!6990 thiss!1504)) (index!6892 lt!131600)))))

(declare-fun c!44390 () Bool)

(assert (=> b!260932 (= c!44390 (= lt!131601 key!932))))

(declare-fun e!169085 () SeekEntryResult!1180)

(declare-fun b!260934 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12599 (_ BitVec 32)) SeekEntryResult!1180)

(assert (=> b!260934 (= e!169085 (seekKeyOrZeroReturnVacant!0 (x!25143 lt!131600) (index!6892 lt!131600) (index!6892 lt!131600) key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(declare-fun b!260935 () Bool)

(assert (=> b!260935 (= e!169085 (MissingZero!1180 (index!6892 lt!131600)))))

(declare-fun b!260936 () Bool)

(assert (=> b!260936 (= e!169086 (Found!1180 (index!6892 lt!131600)))))

(declare-fun b!260937 () Bool)

(declare-fun c!44391 () Bool)

(assert (=> b!260937 (= c!44391 (= lt!131601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260937 (= e!169086 e!169085)))

(declare-fun d!62577 () Bool)

(declare-fun lt!131602 () SeekEntryResult!1180)

(assert (=> d!62577 (and (or ((_ is Undefined!1180) lt!131602) (not ((_ is Found!1180) lt!131602)) (and (bvsge (index!6891 lt!131602) #b00000000000000000000000000000000) (bvslt (index!6891 lt!131602) (size!6313 (_keys!6990 thiss!1504))))) (or ((_ is Undefined!1180) lt!131602) ((_ is Found!1180) lt!131602) (not ((_ is MissingZero!1180) lt!131602)) (and (bvsge (index!6890 lt!131602) #b00000000000000000000000000000000) (bvslt (index!6890 lt!131602) (size!6313 (_keys!6990 thiss!1504))))) (or ((_ is Undefined!1180) lt!131602) ((_ is Found!1180) lt!131602) ((_ is MissingZero!1180) lt!131602) (not ((_ is MissingVacant!1180) lt!131602)) (and (bvsge (index!6893 lt!131602) #b00000000000000000000000000000000) (bvslt (index!6893 lt!131602) (size!6313 (_keys!6990 thiss!1504))))) (or ((_ is Undefined!1180) lt!131602) (ite ((_ is Found!1180) lt!131602) (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6891 lt!131602)) key!932) (ite ((_ is MissingZero!1180) lt!131602) (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6890 lt!131602)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1180) lt!131602) (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6893 lt!131602)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62577 (= lt!131602 e!169084)))

(declare-fun c!44389 () Bool)

(assert (=> d!62577 (= c!44389 (and ((_ is Intermediate!1180) lt!131600) (undefined!1992 lt!131600)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12599 (_ BitVec 32)) SeekEntryResult!1180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62577 (= lt!131600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11143 thiss!1504)) key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(assert (=> d!62577 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62577 (= (seekEntryOrOpen!0 key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)) lt!131602)))

(declare-fun b!260933 () Bool)

(assert (=> b!260933 (= e!169084 Undefined!1180)))

(assert (= (and d!62577 c!44389) b!260933))

(assert (= (and d!62577 (not c!44389)) b!260932))

(assert (= (and b!260932 c!44390) b!260936))

(assert (= (and b!260932 (not c!44390)) b!260937))

(assert (= (and b!260937 c!44391) b!260935))

(assert (= (and b!260937 (not c!44391)) b!260934))

(declare-fun m!276351 () Bool)

(assert (=> b!260932 m!276351))

(declare-fun m!276353 () Bool)

(assert (=> b!260934 m!276353))

(assert (=> d!62577 m!276089))

(declare-fun m!276355 () Bool)

(assert (=> d!62577 m!276355))

(declare-fun m!276357 () Bool)

(assert (=> d!62577 m!276357))

(declare-fun m!276359 () Bool)

(assert (=> d!62577 m!276359))

(declare-fun m!276361 () Bool)

(assert (=> d!62577 m!276361))

(assert (=> d!62577 m!276357))

(declare-fun m!276363 () Bool)

(assert (=> d!62577 m!276363))

(assert (=> b!260659 d!62577))

(declare-fun d!62579 () Bool)

(declare-fun res!127485 () Bool)

(declare-fun e!169087 () Bool)

(assert (=> d!62579 (=> res!127485 e!169087)))

(assert (=> d!62579 (= res!127485 (= (select (arr!5962 lt!131407) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62579 (= (arrayContainsKey!0 lt!131407 key!932 #b00000000000000000000000000000000) e!169087)))

(declare-fun b!260938 () Bool)

(declare-fun e!169088 () Bool)

(assert (=> b!260938 (= e!169087 e!169088)))

(declare-fun res!127486 () Bool)

(assert (=> b!260938 (=> (not res!127486) (not e!169088))))

(assert (=> b!260938 (= res!127486 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 lt!131407)))))

(declare-fun b!260939 () Bool)

(assert (=> b!260939 (= e!169088 (arrayContainsKey!0 lt!131407 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62579 (not res!127485)) b!260938))

(assert (= (and b!260938 res!127486) b!260939))

(declare-fun m!276365 () Bool)

(assert (=> d!62579 m!276365))

(declare-fun m!276367 () Bool)

(assert (=> b!260939 m!276367))

(assert (=> b!260669 d!62579))

(declare-fun d!62581 () Bool)

(assert (=> d!62581 (= (arrayCountValidKeys!0 lt!131407 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!131605 () Unit!8064)

(declare-fun choose!2 (array!12599 (_ BitVec 32)) Unit!8064)

(assert (=> d!62581 (= lt!131605 (choose!2 lt!131407 index!297))))

(declare-fun e!169091 () Bool)

(assert (=> d!62581 e!169091))

(declare-fun res!127491 () Bool)

(assert (=> d!62581 (=> (not res!127491) (not e!169091))))

(assert (=> d!62581 (= res!127491 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6313 lt!131407))))))

(assert (=> d!62581 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131407 index!297) lt!131605)))

(declare-fun b!260944 () Bool)

(declare-fun res!127492 () Bool)

(assert (=> b!260944 (=> (not res!127492) (not e!169091))))

(assert (=> b!260944 (= res!127492 (validKeyInArray!0 (select (arr!5962 lt!131407) index!297)))))

(declare-fun b!260945 () Bool)

(assert (=> b!260945 (= e!169091 (bvslt (size!6313 lt!131407) #b01111111111111111111111111111111))))

(assert (= (and d!62581 res!127491) b!260944))

(assert (= (and b!260944 res!127492) b!260945))

(declare-fun m!276369 () Bool)

(assert (=> d!62581 m!276369))

(declare-fun m!276371 () Bool)

(assert (=> d!62581 m!276371))

(declare-fun m!276373 () Bool)

(assert (=> b!260944 m!276373))

(assert (=> b!260944 m!276373))

(declare-fun m!276375 () Bool)

(assert (=> b!260944 m!276375))

(assert (=> b!260669 d!62581))

(declare-fun d!62583 () Bool)

(declare-fun e!169094 () Bool)

(assert (=> d!62583 e!169094))

(declare-fun res!127495 () Bool)

(assert (=> d!62583 (=> (not res!127495) (not e!169094))))

(assert (=> d!62583 (= res!127495 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6313 (_keys!6990 thiss!1504)))))))

(declare-fun lt!131608 () Unit!8064)

(declare-fun choose!41 (array!12599 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3799) Unit!8064)

(assert (=> d!62583 (= lt!131608 (choose!41 (_keys!6990 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3796))))

(assert (=> d!62583 (bvslt (size!6313 (_keys!6990 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62583 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6990 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3796) lt!131608)))

(declare-fun b!260948 () Bool)

(assert (=> b!260948 (= e!169094 (arrayNoDuplicates!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) #b00000000000000000000000000000000 Nil!3796))))

(assert (= (and d!62583 res!127495) b!260948))

(declare-fun m!276377 () Bool)

(assert (=> d!62583 m!276377))

(assert (=> b!260948 m!276107))

(declare-fun m!276379 () Bool)

(assert (=> b!260948 m!276379))

(assert (=> b!260669 d!62583))

(declare-fun d!62585 () Bool)

(assert (=> d!62585 (arrayContainsKey!0 lt!131407 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131611 () Unit!8064)

(declare-fun choose!13 (array!12599 (_ BitVec 64) (_ BitVec 32)) Unit!8064)

(assert (=> d!62585 (= lt!131611 (choose!13 lt!131407 key!932 index!297))))

(assert (=> d!62585 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62585 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131407 key!932 index!297) lt!131611)))

(declare-fun bs!9173 () Bool)

(assert (= bs!9173 d!62585))

(assert (=> bs!9173 m!276119))

(declare-fun m!276381 () Bool)

(assert (=> bs!9173 m!276381))

(assert (=> b!260669 d!62585))

(declare-fun d!62587 () Bool)

(declare-fun e!169097 () Bool)

(assert (=> d!62587 e!169097))

(declare-fun res!127500 () Bool)

(assert (=> d!62587 (=> (not res!127500) (not e!169097))))

(declare-fun lt!131622 () ListLongMap!3803)

(assert (=> d!62587 (= res!127500 (contains!1875 lt!131622 (_1!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun lt!131621 () List!3798)

(assert (=> d!62587 (= lt!131622 (ListLongMap!3804 lt!131621))))

(declare-fun lt!131623 () Unit!8064)

(declare-fun lt!131620 () Unit!8064)

(assert (=> d!62587 (= lt!131623 lt!131620)))

(assert (=> d!62587 (= (getValueByKey!315 lt!131621 (_1!2461 (tuple2!4901 key!932 v!346))) (Some!320 (_2!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!174 (List!3798 (_ BitVec 64) V!8481) Unit!8064)

(assert (=> d!62587 (= lt!131620 (lemmaContainsTupThenGetReturnValue!174 lt!131621 (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun insertStrictlySorted!177 (List!3798 (_ BitVec 64) V!8481) List!3798)

(assert (=> d!62587 (= lt!131621 (insertStrictlySorted!177 (toList!1917 lt!131403) (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))))))

(assert (=> d!62587 (= (+!704 lt!131403 (tuple2!4901 key!932 v!346)) lt!131622)))

(declare-fun b!260953 () Bool)

(declare-fun res!127501 () Bool)

(assert (=> b!260953 (=> (not res!127501) (not e!169097))))

(assert (=> b!260953 (= res!127501 (= (getValueByKey!315 (toList!1917 lt!131622) (_1!2461 (tuple2!4901 key!932 v!346))) (Some!320 (_2!2461 (tuple2!4901 key!932 v!346)))))))

(declare-fun b!260954 () Bool)

(declare-fun contains!1876 (List!3798 tuple2!4900) Bool)

(assert (=> b!260954 (= e!169097 (contains!1876 (toList!1917 lt!131622) (tuple2!4901 key!932 v!346)))))

(assert (= (and d!62587 res!127500) b!260953))

(assert (= (and b!260953 res!127501) b!260954))

(declare-fun m!276383 () Bool)

(assert (=> d!62587 m!276383))

(declare-fun m!276385 () Bool)

(assert (=> d!62587 m!276385))

(declare-fun m!276387 () Bool)

(assert (=> d!62587 m!276387))

(declare-fun m!276389 () Bool)

(assert (=> d!62587 m!276389))

(declare-fun m!276391 () Bool)

(assert (=> b!260953 m!276391))

(declare-fun m!276393 () Bool)

(assert (=> b!260954 m!276393))

(assert (=> b!260669 d!62587))

(declare-fun b!260966 () Bool)

(declare-fun e!169102 () Bool)

(assert (=> b!260966 (= e!169102 (= (arrayCountValidKeys!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6990 thiss!1504) #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!260964 () Bool)

(declare-fun res!127511 () Bool)

(declare-fun e!169103 () Bool)

(assert (=> b!260964 (=> (not res!127511) (not e!169103))))

(assert (=> b!260964 (= res!127511 (validKeyInArray!0 key!932))))

(declare-fun b!260965 () Bool)

(assert (=> b!260965 (= e!169103 (bvslt (size!6313 (_keys!6990 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!62589 () Bool)

(assert (=> d!62589 e!169102))

(declare-fun res!127510 () Bool)

(assert (=> d!62589 (=> (not res!127510) (not e!169102))))

(assert (=> d!62589 (= res!127510 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6313 (_keys!6990 thiss!1504)))))))

(declare-fun lt!131626 () Unit!8064)

(declare-fun choose!1 (array!12599 (_ BitVec 32) (_ BitVec 64)) Unit!8064)

(assert (=> d!62589 (= lt!131626 (choose!1 (_keys!6990 thiss!1504) index!297 key!932))))

(assert (=> d!62589 e!169103))

(declare-fun res!127512 () Bool)

(assert (=> d!62589 (=> (not res!127512) (not e!169103))))

(assert (=> d!62589 (= res!127512 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6313 (_keys!6990 thiss!1504)))))))

(assert (=> d!62589 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6990 thiss!1504) index!297 key!932) lt!131626)))

(declare-fun b!260963 () Bool)

(declare-fun res!127513 () Bool)

(assert (=> b!260963 (=> (not res!127513) (not e!169103))))

(assert (=> b!260963 (= res!127513 (not (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) index!297))))))

(assert (= (and d!62589 res!127512) b!260963))

(assert (= (and b!260963 res!127513) b!260964))

(assert (= (and b!260964 res!127511) b!260965))

(assert (= (and d!62589 res!127510) b!260966))

(assert (=> b!260966 m!276107))

(declare-fun m!276395 () Bool)

(assert (=> b!260966 m!276395))

(assert (=> b!260966 m!276109))

(declare-fun m!276397 () Bool)

(assert (=> b!260964 m!276397))

(declare-fun m!276399 () Bool)

(assert (=> d!62589 m!276399))

(declare-fun m!276401 () Bool)

(assert (=> b!260963 m!276401))

(assert (=> b!260963 m!276401))

(declare-fun m!276403 () Bool)

(assert (=> b!260963 m!276403))

(assert (=> b!260669 d!62589))

(assert (=> b!260669 d!62563))

(declare-fun d!62591 () Bool)

(declare-fun e!169106 () Bool)

(assert (=> d!62591 e!169106))

(declare-fun res!127516 () Bool)

(assert (=> d!62591 (=> (not res!127516) (not e!169106))))

(assert (=> d!62591 (= res!127516 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6313 (_keys!6990 thiss!1504)))))))

(declare-fun lt!131629 () Unit!8064)

(declare-fun choose!102 ((_ BitVec 64) array!12599 (_ BitVec 32) (_ BitVec 32)) Unit!8064)

(assert (=> d!62591 (= lt!131629 (choose!102 key!932 (_keys!6990 thiss!1504) index!297 (mask!11143 thiss!1504)))))

(assert (=> d!62591 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62591 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6990 thiss!1504) index!297 (mask!11143 thiss!1504)) lt!131629)))

(declare-fun b!260969 () Bool)

(assert (=> b!260969 (= e!169106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (mask!11143 thiss!1504)))))

(assert (= (and d!62591 res!127516) b!260969))

(declare-fun m!276405 () Bool)

(assert (=> d!62591 m!276405))

(assert (=> d!62591 m!276089))

(assert (=> b!260969 m!276107))

(declare-fun m!276407 () Bool)

(assert (=> b!260969 m!276407))

(assert (=> b!260669 d!62591))

(declare-fun b!260978 () Bool)

(declare-fun e!169111 () (_ BitVec 32))

(declare-fun call!24898 () (_ BitVec 32))

(assert (=> b!260978 (= e!169111 call!24898)))

(declare-fun bm!24895 () Bool)

(assert (=> bm!24895 (= call!24898 (arrayCountValidKeys!0 (_keys!6990 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun d!62593 () Bool)

(declare-fun lt!131632 () (_ BitVec 32))

(assert (=> d!62593 (and (bvsge lt!131632 #b00000000000000000000000000000000) (bvsle lt!131632 (bvsub (size!6313 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!169112 () (_ BitVec 32))

(assert (=> d!62593 (= lt!131632 e!169112)))

(declare-fun c!44396 () Bool)

(assert (=> d!62593 (= c!44396 (bvsge #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62593 (and (bvsle #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6313 (_keys!6990 thiss!1504)) (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62593 (= (arrayCountValidKeys!0 (_keys!6990 thiss!1504) #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) lt!131632)))

(declare-fun b!260979 () Bool)

(assert (=> b!260979 (= e!169112 #b00000000000000000000000000000000)))

(declare-fun b!260980 () Bool)

(assert (=> b!260980 (= e!169111 (bvadd #b00000000000000000000000000000001 call!24898))))

(declare-fun b!260981 () Bool)

(assert (=> b!260981 (= e!169112 e!169111)))

(declare-fun c!44397 () Bool)

(assert (=> b!260981 (= c!44397 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62593 c!44396) b!260979))

(assert (= (and d!62593 (not c!44396)) b!260981))

(assert (= (and b!260981 c!44397) b!260980))

(assert (= (and b!260981 (not c!44397)) b!260978))

(assert (= (or b!260980 b!260978) bm!24895))

(declare-fun m!276409 () Bool)

(assert (=> bm!24895 m!276409))

(assert (=> b!260981 m!276265))

(assert (=> b!260981 m!276265))

(assert (=> b!260981 m!276331))

(assert (=> b!260669 d!62593))

(declare-fun b!260992 () Bool)

(declare-fun e!169124 () Bool)

(declare-fun call!24901 () Bool)

(assert (=> b!260992 (= e!169124 call!24901)))

(declare-fun bm!24898 () Bool)

(declare-fun c!44400 () Bool)

(assert (=> bm!24898 (= call!24901 (arrayNoDuplicates!0 lt!131407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44400 (Cons!3795 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) Nil!3796) Nil!3796)))))

(declare-fun b!260993 () Bool)

(assert (=> b!260993 (= e!169124 call!24901)))

(declare-fun b!260994 () Bool)

(declare-fun e!169123 () Bool)

(declare-fun e!169121 () Bool)

(assert (=> b!260994 (= e!169123 e!169121)))

(declare-fun res!127525 () Bool)

(assert (=> b!260994 (=> (not res!127525) (not e!169121))))

(declare-fun e!169122 () Bool)

(assert (=> b!260994 (= res!127525 (not e!169122))))

(declare-fun res!127524 () Bool)

(assert (=> b!260994 (=> (not res!127524) (not e!169122))))

(assert (=> b!260994 (= res!127524 (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun b!260995 () Bool)

(assert (=> b!260995 (= e!169121 e!169124)))

(assert (=> b!260995 (= c!44400 (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun d!62595 () Bool)

(declare-fun res!127523 () Bool)

(assert (=> d!62595 (=> res!127523 e!169123)))

(assert (=> d!62595 (= res!127523 (bvsge #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(assert (=> d!62595 (= (arrayNoDuplicates!0 lt!131407 #b00000000000000000000000000000000 Nil!3796) e!169123)))

(declare-fun b!260996 () Bool)

(declare-fun contains!1877 (List!3799 (_ BitVec 64)) Bool)

(assert (=> b!260996 (= e!169122 (contains!1877 Nil!3796 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(assert (= (and d!62595 (not res!127523)) b!260994))

(assert (= (and b!260994 res!127524) b!260996))

(assert (= (and b!260994 res!127525) b!260995))

(assert (= (and b!260995 c!44400) b!260992))

(assert (= (and b!260995 (not c!44400)) b!260993))

(assert (= (or b!260992 b!260993) bm!24898))

(assert (=> bm!24898 m!276365))

(declare-fun m!276411 () Bool)

(assert (=> bm!24898 m!276411))

(assert (=> b!260994 m!276365))

(assert (=> b!260994 m!276365))

(declare-fun m!276413 () Bool)

(assert (=> b!260994 m!276413))

(assert (=> b!260995 m!276365))

(assert (=> b!260995 m!276365))

(assert (=> b!260995 m!276413))

(assert (=> b!260996 m!276365))

(assert (=> b!260996 m!276365))

(declare-fun m!276415 () Bool)

(assert (=> b!260996 m!276415))

(assert (=> b!260669 d!62595))

(declare-fun d!62597 () Bool)

(declare-fun e!169127 () Bool)

(assert (=> d!62597 e!169127))

(declare-fun res!127528 () Bool)

(assert (=> d!62597 (=> (not res!127528) (not e!169127))))

(assert (=> d!62597 (= res!127528 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6313 (_keys!6990 thiss!1504))) (bvslt index!297 (size!6312 (_values!4790 thiss!1504)))))))

(declare-fun lt!131635 () Unit!8064)

(declare-fun choose!1282 (array!12599 array!12597 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 32) (_ BitVec 64) V!8481 Int) Unit!8064)

(assert (=> d!62597 (= lt!131635 (choose!1282 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) index!297 key!932 v!346 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62597 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62597 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!115 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) index!297 key!932 v!346 (defaultEntry!4807 thiss!1504)) lt!131635)))

(declare-fun b!260999 () Bool)

(assert (=> b!260999 (= e!169127 (= (+!704 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) (tuple2!4901 key!932 v!346)) (getCurrentListMap!1426 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))))))

(assert (= (and d!62597 res!127528) b!260999))

(declare-fun m!276417 () Bool)

(assert (=> d!62597 m!276417))

(assert (=> d!62597 m!276089))

(declare-fun m!276419 () Bool)

(assert (=> b!260999 m!276419))

(assert (=> b!260999 m!276129))

(declare-fun m!276421 () Bool)

(assert (=> b!260999 m!276421))

(assert (=> b!260999 m!276097))

(assert (=> b!260999 m!276129))

(assert (=> b!260999 m!276107))

(assert (=> b!260669 d!62597))

(declare-fun b!261000 () Bool)

(declare-fun e!169128 () (_ BitVec 32))

(declare-fun call!24902 () (_ BitVec 32))

(assert (=> b!261000 (= e!169128 call!24902)))

(declare-fun bm!24899 () Bool)

(assert (=> bm!24899 (= call!24902 (arrayCountValidKeys!0 lt!131407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun d!62599 () Bool)

(declare-fun lt!131636 () (_ BitVec 32))

(assert (=> d!62599 (and (bvsge lt!131636 #b00000000000000000000000000000000) (bvsle lt!131636 (bvsub (size!6313 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun e!169129 () (_ BitVec 32))

(assert (=> d!62599 (= lt!131636 e!169129)))

(declare-fun c!44401 () Bool)

(assert (=> d!62599 (= c!44401 (bvsge #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62599 (and (bvsle #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6313 (_keys!6990 thiss!1504)) (size!6313 lt!131407)))))

(assert (=> d!62599 (= (arrayCountValidKeys!0 lt!131407 #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) lt!131636)))

(declare-fun b!261001 () Bool)

(assert (=> b!261001 (= e!169129 #b00000000000000000000000000000000)))

(declare-fun b!261002 () Bool)

(assert (=> b!261002 (= e!169128 (bvadd #b00000000000000000000000000000001 call!24902))))

(declare-fun b!261003 () Bool)

(assert (=> b!261003 (= e!169129 e!169128)))

(declare-fun c!44402 () Bool)

(assert (=> b!261003 (= c!44402 (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(assert (= (and d!62599 c!44401) b!261001))

(assert (= (and d!62599 (not c!44401)) b!261003))

(assert (= (and b!261003 c!44402) b!261002))

(assert (= (and b!261003 (not c!44402)) b!261000))

(assert (= (or b!261002 b!261000) bm!24899))

(declare-fun m!276423 () Bool)

(assert (=> bm!24899 m!276423))

(assert (=> b!261003 m!276365))

(assert (=> b!261003 m!276365))

(assert (=> b!261003 m!276413))

(assert (=> b!260669 d!62599))

(declare-fun d!62601 () Bool)

(declare-fun res!127533 () Bool)

(declare-fun e!169138 () Bool)

(assert (=> d!62601 (=> res!127533 e!169138)))

(assert (=> d!62601 (= res!127533 (bvsge #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(assert (=> d!62601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131407 (mask!11143 thiss!1504)) e!169138)))

(declare-fun bm!24902 () Bool)

(declare-fun call!24905 () Bool)

(assert (=> bm!24902 (= call!24905 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131407 (mask!11143 thiss!1504)))))

(declare-fun b!261012 () Bool)

(declare-fun e!169136 () Bool)

(assert (=> b!261012 (= e!169136 call!24905)))

(declare-fun b!261013 () Bool)

(declare-fun e!169137 () Bool)

(assert (=> b!261013 (= e!169137 e!169136)))

(declare-fun lt!131643 () (_ BitVec 64))

(assert (=> b!261013 (= lt!131643 (select (arr!5962 lt!131407) #b00000000000000000000000000000000))))

(declare-fun lt!131644 () Unit!8064)

(assert (=> b!261013 (= lt!131644 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131407 lt!131643 #b00000000000000000000000000000000))))

(assert (=> b!261013 (arrayContainsKey!0 lt!131407 lt!131643 #b00000000000000000000000000000000)))

(declare-fun lt!131645 () Unit!8064)

(assert (=> b!261013 (= lt!131645 lt!131644)))

(declare-fun res!127534 () Bool)

(assert (=> b!261013 (= res!127534 (= (seekEntryOrOpen!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) lt!131407 (mask!11143 thiss!1504)) (Found!1180 #b00000000000000000000000000000000)))))

(assert (=> b!261013 (=> (not res!127534) (not e!169136))))

(declare-fun b!261014 () Bool)

(assert (=> b!261014 (= e!169138 e!169137)))

(declare-fun c!44405 () Bool)

(assert (=> b!261014 (= c!44405 (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun b!261015 () Bool)

(assert (=> b!261015 (= e!169137 call!24905)))

(assert (= (and d!62601 (not res!127533)) b!261014))

(assert (= (and b!261014 c!44405) b!261013))

(assert (= (and b!261014 (not c!44405)) b!261015))

(assert (= (and b!261013 res!127534) b!261012))

(assert (= (or b!261012 b!261015) bm!24902))

(declare-fun m!276425 () Bool)

(assert (=> bm!24902 m!276425))

(assert (=> b!261013 m!276365))

(declare-fun m!276427 () Bool)

(assert (=> b!261013 m!276427))

(declare-fun m!276429 () Bool)

(assert (=> b!261013 m!276429))

(assert (=> b!261013 m!276365))

(declare-fun m!276431 () Bool)

(assert (=> b!261013 m!276431))

(assert (=> b!261014 m!276365))

(assert (=> b!261014 m!276365))

(assert (=> b!261014 m!276413))

(assert (=> b!260669 d!62601))

(declare-fun d!62603 () Bool)

(assert (=> d!62603 (= (validMask!0 (mask!11143 thiss!1504)) (and (or (= (mask!11143 thiss!1504) #b00000000000000000000000000000111) (= (mask!11143 thiss!1504) #b00000000000000000000000000001111) (= (mask!11143 thiss!1504) #b00000000000000000000000000011111) (= (mask!11143 thiss!1504) #b00000000000000000000000000111111) (= (mask!11143 thiss!1504) #b00000000000000000000000001111111) (= (mask!11143 thiss!1504) #b00000000000000000000000011111111) (= (mask!11143 thiss!1504) #b00000000000000000000000111111111) (= (mask!11143 thiss!1504) #b00000000000000000000001111111111) (= (mask!11143 thiss!1504) #b00000000000000000000011111111111) (= (mask!11143 thiss!1504) #b00000000000000000000111111111111) (= (mask!11143 thiss!1504) #b00000000000000000001111111111111) (= (mask!11143 thiss!1504) #b00000000000000000011111111111111) (= (mask!11143 thiss!1504) #b00000000000000000111111111111111) (= (mask!11143 thiss!1504) #b00000000000000001111111111111111) (= (mask!11143 thiss!1504) #b00000000000000011111111111111111) (= (mask!11143 thiss!1504) #b00000000000000111111111111111111) (= (mask!11143 thiss!1504) #b00000000000001111111111111111111) (= (mask!11143 thiss!1504) #b00000000000011111111111111111111) (= (mask!11143 thiss!1504) #b00000000000111111111111111111111) (= (mask!11143 thiss!1504) #b00000000001111111111111111111111) (= (mask!11143 thiss!1504) #b00000000011111111111111111111111) (= (mask!11143 thiss!1504) #b00000000111111111111111111111111) (= (mask!11143 thiss!1504) #b00000001111111111111111111111111) (= (mask!11143 thiss!1504) #b00000011111111111111111111111111) (= (mask!11143 thiss!1504) #b00000111111111111111111111111111) (= (mask!11143 thiss!1504) #b00001111111111111111111111111111) (= (mask!11143 thiss!1504) #b00011111111111111111111111111111) (= (mask!11143 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11143 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!260669 d!62603))

(declare-fun b!261016 () Bool)

(declare-fun e!169142 () ListLongMap!3803)

(declare-fun call!24912 () ListLongMap!3803)

(assert (=> b!261016 (= e!169142 (+!704 call!24912 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(declare-fun b!261017 () Bool)

(declare-fun e!169139 () Unit!8064)

(declare-fun Unit!8075 () Unit!8064)

(assert (=> b!261017 (= e!169139 Unit!8075)))

(declare-fun b!261018 () Bool)

(declare-fun e!169151 () Bool)

(declare-fun lt!131656 () ListLongMap!3803)

(assert (=> b!261018 (= e!169151 (= (apply!259 lt!131656 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4648 thiss!1504)))))

(declare-fun b!261019 () Bool)

(declare-fun e!169150 () ListLongMap!3803)

(declare-fun call!24906 () ListLongMap!3803)

(assert (=> b!261019 (= e!169150 call!24906)))

(declare-fun b!261020 () Bool)

(declare-fun e!169146 () Bool)

(declare-fun e!169143 () Bool)

(assert (=> b!261020 (= e!169146 e!169143)))

(declare-fun c!44407 () Bool)

(assert (=> b!261020 (= c!44407 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24903 () Bool)

(declare-fun call!24907 () Bool)

(assert (=> bm!24903 (= call!24907 (contains!1875 lt!131656 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261021 () Bool)

(declare-fun c!44411 () Bool)

(assert (=> b!261021 (= c!44411 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169141 () ListLongMap!3803)

(assert (=> b!261021 (= e!169141 e!169150)))

(declare-fun b!261022 () Bool)

(assert (=> b!261022 (= e!169142 e!169141)))

(declare-fun c!44406 () Bool)

(assert (=> b!261022 (= c!44406 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261023 () Bool)

(declare-fun e!169140 () Bool)

(assert (=> b!261023 (= e!169140 (= (apply!259 lt!131656 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4648 thiss!1504)))))

(declare-fun b!261024 () Bool)

(declare-fun call!24911 () ListLongMap!3803)

(assert (=> b!261024 (= e!169141 call!24911)))

(declare-fun b!261025 () Bool)

(declare-fun e!169144 () Bool)

(assert (=> b!261025 (= e!169144 e!169140)))

(declare-fun res!127539 () Bool)

(declare-fun call!24908 () Bool)

(assert (=> b!261025 (= res!127539 call!24908)))

(assert (=> b!261025 (=> (not res!127539) (not e!169140))))

(declare-fun b!261026 () Bool)

(declare-fun res!127542 () Bool)

(assert (=> b!261026 (=> (not res!127542) (not e!169146))))

(assert (=> b!261026 (= res!127542 e!169144)))

(declare-fun c!44408 () Bool)

(assert (=> b!261026 (= c!44408 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!62605 () Bool)

(assert (=> d!62605 e!169146))

(declare-fun res!127541 () Bool)

(assert (=> d!62605 (=> (not res!127541) (not e!169146))))

(assert (=> d!62605 (= res!127541 (or (bvsge #b00000000000000000000000000000000 (size!6313 lt!131407)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))))

(declare-fun lt!131658 () ListLongMap!3803)

(assert (=> d!62605 (= lt!131656 lt!131658)))

(declare-fun lt!131661 () Unit!8064)

(assert (=> d!62605 (= lt!131661 e!169139)))

(declare-fun c!44410 () Bool)

(declare-fun e!169149 () Bool)

(assert (=> d!62605 (= c!44410 e!169149)))

(declare-fun res!127535 () Bool)

(assert (=> d!62605 (=> (not res!127535) (not e!169149))))

(assert (=> d!62605 (= res!127535 (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(assert (=> d!62605 (= lt!131658 e!169142)))

(declare-fun c!44409 () Bool)

(assert (=> d!62605 (= c!44409 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62605 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62605 (= (getCurrentListMap!1426 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131656)))

(declare-fun b!261027 () Bool)

(assert (=> b!261027 (= e!169150 call!24911)))

(declare-fun b!261028 () Bool)

(assert (=> b!261028 (= e!169143 e!169151)))

(declare-fun res!127536 () Bool)

(assert (=> b!261028 (= res!127536 call!24907)))

(assert (=> b!261028 (=> (not res!127536) (not e!169151))))

(declare-fun b!261029 () Bool)

(assert (=> b!261029 (= e!169143 (not call!24907))))

(declare-fun b!261030 () Bool)

(declare-fun e!169145 () Bool)

(assert (=> b!261030 (= e!169145 (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun b!261031 () Bool)

(declare-fun res!127540 () Bool)

(assert (=> b!261031 (=> (not res!127540) (not e!169146))))

(declare-fun e!169147 () Bool)

(assert (=> b!261031 (= res!127540 e!169147)))

(declare-fun res!127538 () Bool)

(assert (=> b!261031 (=> res!127538 e!169147)))

(assert (=> b!261031 (= res!127538 (not e!169145))))

(declare-fun res!127537 () Bool)

(assert (=> b!261031 (=> (not res!127537) (not e!169145))))

(assert (=> b!261031 (= res!127537 (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(declare-fun bm!24904 () Bool)

(declare-fun call!24909 () ListLongMap!3803)

(declare-fun call!24910 () ListLongMap!3803)

(assert (=> bm!24904 (= call!24909 call!24910)))

(declare-fun b!261032 () Bool)

(assert (=> b!261032 (= e!169149 (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun bm!24905 () Bool)

(assert (=> bm!24905 (= call!24912 (+!704 (ite c!44409 call!24910 (ite c!44406 call!24909 call!24906)) (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun bm!24906 () Bool)

(assert (=> bm!24906 (= call!24911 call!24912)))

(declare-fun b!261033 () Bool)

(assert (=> b!261033 (= e!169144 (not call!24908))))

(declare-fun b!261034 () Bool)

(declare-fun e!169148 () Bool)

(assert (=> b!261034 (= e!169148 (= (apply!259 lt!131656 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)) (get!3071 (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261034 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))))))))

(assert (=> b!261034 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(declare-fun bm!24907 () Bool)

(assert (=> bm!24907 (= call!24906 call!24909)))

(declare-fun bm!24908 () Bool)

(assert (=> bm!24908 (= call!24908 (contains!1875 lt!131656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24909 () Bool)

(assert (=> bm!24909 (= call!24910 (getCurrentListMapNoExtraKeys!575 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun b!261035 () Bool)

(declare-fun lt!131660 () Unit!8064)

(assert (=> b!261035 (= e!169139 lt!131660)))

(declare-fun lt!131664 () ListLongMap!3803)

(assert (=> b!261035 (= lt!131664 (getCurrentListMapNoExtraKeys!575 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131651 () (_ BitVec 64))

(assert (=> b!261035 (= lt!131651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131647 () (_ BitVec 64))

(assert (=> b!261035 (= lt!131647 (select (arr!5962 lt!131407) #b00000000000000000000000000000000))))

(declare-fun lt!131655 () Unit!8064)

(assert (=> b!261035 (= lt!131655 (addStillContains!235 lt!131664 lt!131651 (zeroValue!4648 thiss!1504) lt!131647))))

(assert (=> b!261035 (contains!1875 (+!704 lt!131664 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504))) lt!131647)))

(declare-fun lt!131659 () Unit!8064)

(assert (=> b!261035 (= lt!131659 lt!131655)))

(declare-fun lt!131653 () ListLongMap!3803)

(assert (=> b!261035 (= lt!131653 (getCurrentListMapNoExtraKeys!575 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131646 () (_ BitVec 64))

(assert (=> b!261035 (= lt!131646 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131662 () (_ BitVec 64))

(assert (=> b!261035 (= lt!131662 (select (arr!5962 lt!131407) #b00000000000000000000000000000000))))

(declare-fun lt!131650 () Unit!8064)

(assert (=> b!261035 (= lt!131650 (addApplyDifferent!235 lt!131653 lt!131646 (minValue!4648 thiss!1504) lt!131662))))

(assert (=> b!261035 (= (apply!259 (+!704 lt!131653 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504))) lt!131662) (apply!259 lt!131653 lt!131662))))

(declare-fun lt!131665 () Unit!8064)

(assert (=> b!261035 (= lt!131665 lt!131650)))

(declare-fun lt!131666 () ListLongMap!3803)

(assert (=> b!261035 (= lt!131666 (getCurrentListMapNoExtraKeys!575 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131654 () (_ BitVec 64))

(assert (=> b!261035 (= lt!131654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131648 () (_ BitVec 64))

(assert (=> b!261035 (= lt!131648 (select (arr!5962 lt!131407) #b00000000000000000000000000000000))))

(declare-fun lt!131657 () Unit!8064)

(assert (=> b!261035 (= lt!131657 (addApplyDifferent!235 lt!131666 lt!131654 (zeroValue!4648 thiss!1504) lt!131648))))

(assert (=> b!261035 (= (apply!259 (+!704 lt!131666 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504))) lt!131648) (apply!259 lt!131666 lt!131648))))

(declare-fun lt!131663 () Unit!8064)

(assert (=> b!261035 (= lt!131663 lt!131657)))

(declare-fun lt!131649 () ListLongMap!3803)

(assert (=> b!261035 (= lt!131649 (getCurrentListMapNoExtraKeys!575 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131652 () (_ BitVec 64))

(assert (=> b!261035 (= lt!131652 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131667 () (_ BitVec 64))

(assert (=> b!261035 (= lt!131667 (select (arr!5962 lt!131407) #b00000000000000000000000000000000))))

(assert (=> b!261035 (= lt!131660 (addApplyDifferent!235 lt!131649 lt!131652 (minValue!4648 thiss!1504) lt!131667))))

(assert (=> b!261035 (= (apply!259 (+!704 lt!131649 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504))) lt!131667) (apply!259 lt!131649 lt!131667))))

(declare-fun b!261036 () Bool)

(assert (=> b!261036 (= e!169147 e!169148)))

(declare-fun res!127543 () Bool)

(assert (=> b!261036 (=> (not res!127543) (not e!169148))))

(assert (=> b!261036 (= res!127543 (contains!1875 lt!131656 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(assert (=> b!261036 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(assert (= (and d!62605 c!44409) b!261016))

(assert (= (and d!62605 (not c!44409)) b!261022))

(assert (= (and b!261022 c!44406) b!261024))

(assert (= (and b!261022 (not c!44406)) b!261021))

(assert (= (and b!261021 c!44411) b!261027))

(assert (= (and b!261021 (not c!44411)) b!261019))

(assert (= (or b!261027 b!261019) bm!24907))

(assert (= (or b!261024 bm!24907) bm!24904))

(assert (= (or b!261024 b!261027) bm!24906))

(assert (= (or b!261016 bm!24904) bm!24909))

(assert (= (or b!261016 bm!24906) bm!24905))

(assert (= (and d!62605 res!127535) b!261032))

(assert (= (and d!62605 c!44410) b!261035))

(assert (= (and d!62605 (not c!44410)) b!261017))

(assert (= (and d!62605 res!127541) b!261031))

(assert (= (and b!261031 res!127537) b!261030))

(assert (= (and b!261031 (not res!127538)) b!261036))

(assert (= (and b!261036 res!127543) b!261034))

(assert (= (and b!261031 res!127540) b!261026))

(assert (= (and b!261026 c!44408) b!261025))

(assert (= (and b!261026 (not c!44408)) b!261033))

(assert (= (and b!261025 res!127539) b!261023))

(assert (= (or b!261025 b!261033) bm!24908))

(assert (= (and b!261026 res!127542) b!261020))

(assert (= (and b!261020 c!44407) b!261028))

(assert (= (and b!261020 (not c!44407)) b!261029))

(assert (= (and b!261028 res!127536) b!261018))

(assert (= (or b!261028 b!261029) bm!24903))

(declare-fun b_lambda!8271 () Bool)

(assert (=> (not b_lambda!8271) (not b!261034)))

(assert (=> b!261034 t!8865))

(declare-fun b_and!13865 () Bool)

(assert (= b_and!13863 (and (=> t!8865 result!5407) b_and!13865)))

(declare-fun m!276433 () Bool)

(assert (=> b!261035 m!276433))

(declare-fun m!276435 () Bool)

(assert (=> b!261035 m!276435))

(declare-fun m!276437 () Bool)

(assert (=> b!261035 m!276437))

(declare-fun m!276439 () Bool)

(assert (=> b!261035 m!276439))

(declare-fun m!276441 () Bool)

(assert (=> b!261035 m!276441))

(declare-fun m!276443 () Bool)

(assert (=> b!261035 m!276443))

(declare-fun m!276445 () Bool)

(assert (=> b!261035 m!276445))

(declare-fun m!276447 () Bool)

(assert (=> b!261035 m!276447))

(declare-fun m!276449 () Bool)

(assert (=> b!261035 m!276449))

(assert (=> b!261035 m!276447))

(declare-fun m!276451 () Bool)

(assert (=> b!261035 m!276451))

(assert (=> b!261035 m!276435))

(assert (=> b!261035 m!276365))

(declare-fun m!276453 () Bool)

(assert (=> b!261035 m!276453))

(declare-fun m!276455 () Bool)

(assert (=> b!261035 m!276455))

(declare-fun m!276457 () Bool)

(assert (=> b!261035 m!276457))

(declare-fun m!276459 () Bool)

(assert (=> b!261035 m!276459))

(assert (=> b!261035 m!276457))

(declare-fun m!276461 () Bool)

(assert (=> b!261035 m!276461))

(declare-fun m!276463 () Bool)

(assert (=> b!261035 m!276463))

(assert (=> b!261035 m!276441))

(declare-fun m!276465 () Bool)

(assert (=> b!261016 m!276465))

(assert (=> d!62605 m!276089))

(assert (=> b!261036 m!276365))

(assert (=> b!261036 m!276365))

(declare-fun m!276467 () Bool)

(assert (=> b!261036 m!276467))

(assert (=> b!261032 m!276365))

(assert (=> b!261032 m!276365))

(assert (=> b!261032 m!276413))

(declare-fun m!276469 () Bool)

(assert (=> bm!24905 m!276469))

(assert (=> bm!24909 m!276445))

(declare-fun m!276471 () Bool)

(assert (=> b!261018 m!276471))

(assert (=> b!261030 m!276365))

(assert (=> b!261030 m!276365))

(assert (=> b!261030 m!276413))

(declare-fun m!276473 () Bool)

(assert (=> bm!24903 m!276473))

(declare-fun m!276475 () Bool)

(assert (=> b!261034 m!276475))

(assert (=> b!261034 m!276341))

(declare-fun m!276477 () Bool)

(assert (=> b!261034 m!276477))

(assert (=> b!261034 m!276341))

(assert (=> b!261034 m!276475))

(assert (=> b!261034 m!276365))

(assert (=> b!261034 m!276365))

(declare-fun m!276479 () Bool)

(assert (=> b!261034 m!276479))

(declare-fun m!276481 () Bool)

(assert (=> bm!24908 m!276481))

(declare-fun m!276483 () Bool)

(assert (=> b!261023 m!276483))

(assert (=> b!260669 d!62605))

(declare-fun b!261037 () Bool)

(declare-fun e!169152 () (_ BitVec 32))

(declare-fun call!24913 () (_ BitVec 32))

(assert (=> b!261037 (= e!169152 call!24913)))

(declare-fun bm!24910 () Bool)

(assert (=> bm!24910 (= call!24913 (arrayCountValidKeys!0 lt!131407 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!62607 () Bool)

(declare-fun lt!131668 () (_ BitVec 32))

(assert (=> d!62607 (and (bvsge lt!131668 #b00000000000000000000000000000000) (bvsle lt!131668 (bvsub (size!6313 lt!131407) index!297)))))

(declare-fun e!169153 () (_ BitVec 32))

(assert (=> d!62607 (= lt!131668 e!169153)))

(declare-fun c!44412 () Bool)

(assert (=> d!62607 (= c!44412 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62607 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6313 lt!131407)))))

(assert (=> d!62607 (= (arrayCountValidKeys!0 lt!131407 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!131668)))

(declare-fun b!261038 () Bool)

(assert (=> b!261038 (= e!169153 #b00000000000000000000000000000000)))

(declare-fun b!261039 () Bool)

(assert (=> b!261039 (= e!169152 (bvadd #b00000000000000000000000000000001 call!24913))))

(declare-fun b!261040 () Bool)

(assert (=> b!261040 (= e!169153 e!169152)))

(declare-fun c!44413 () Bool)

(assert (=> b!261040 (= c!44413 (validKeyInArray!0 (select (arr!5962 lt!131407) index!297)))))

(assert (= (and d!62607 c!44412) b!261038))

(assert (= (and d!62607 (not c!44412)) b!261040))

(assert (= (and b!261040 c!44413) b!261039))

(assert (= (and b!261040 (not c!44413)) b!261037))

(assert (= (or b!261039 b!261037) bm!24910))

(declare-fun m!276485 () Bool)

(assert (=> bm!24910 m!276485))

(assert (=> b!261040 m!276373))

(assert (=> b!261040 m!276373))

(assert (=> b!261040 m!276375))

(assert (=> b!260669 d!62607))

(declare-fun mapIsEmpty!11301 () Bool)

(declare-fun mapRes!11301 () Bool)

(assert (=> mapIsEmpty!11301 mapRes!11301))

(declare-fun b!261047 () Bool)

(declare-fun e!169158 () Bool)

(assert (=> b!261047 (= e!169158 tp_is_empty!6625)))

(declare-fun mapNonEmpty!11301 () Bool)

(declare-fun tp!23631 () Bool)

(assert (=> mapNonEmpty!11301 (= mapRes!11301 (and tp!23631 e!169158))))

(declare-fun mapRest!11301 () (Array (_ BitVec 32) ValueCell!2969))

(declare-fun mapValue!11301 () ValueCell!2969)

(declare-fun mapKey!11301 () (_ BitVec 32))

(assert (=> mapNonEmpty!11301 (= mapRest!11292 (store mapRest!11301 mapKey!11301 mapValue!11301))))

(declare-fun b!261048 () Bool)

(declare-fun e!169159 () Bool)

(assert (=> b!261048 (= e!169159 tp_is_empty!6625)))

(declare-fun condMapEmpty!11301 () Bool)

(declare-fun mapDefault!11301 () ValueCell!2969)

(assert (=> mapNonEmpty!11292 (= condMapEmpty!11301 (= mapRest!11292 ((as const (Array (_ BitVec 32) ValueCell!2969)) mapDefault!11301)))))

(assert (=> mapNonEmpty!11292 (= tp!23615 (and e!169159 mapRes!11301))))

(assert (= (and mapNonEmpty!11292 condMapEmpty!11301) mapIsEmpty!11301))

(assert (= (and mapNonEmpty!11292 (not condMapEmpty!11301)) mapNonEmpty!11301))

(assert (= (and mapNonEmpty!11301 ((_ is ValueCellFull!2969) mapValue!11301)) b!261047))

(assert (= (and mapNonEmpty!11292 ((_ is ValueCellFull!2969) mapDefault!11301)) b!261048))

(declare-fun m!276487 () Bool)

(assert (=> mapNonEmpty!11301 m!276487))

(declare-fun b_lambda!8273 () Bool)

(assert (= b_lambda!8269 (or (and b!260670 b_free!6763) b_lambda!8273)))

(declare-fun b_lambda!8275 () Bool)

(assert (= b_lambda!8271 (or (and b!260670 b_free!6763) b_lambda!8275)))

(check-sat (not bm!24892) (not b!260948) (not d!62583) (not b!260845) (not b!260852) tp_is_empty!6625 (not b_next!6763) (not b!261030) (not d!62573) (not b!261013) (not d!62577) (not bm!24888) (not b!260994) (not b!260904) (not b!260999) (not d!62589) (not bm!24902) (not b!261036) (not b!260897) (not bm!24908) (not d!62575) (not bm!24871) (not b!260939) (not bm!24886) (not b!260944) (not b!260844) (not b!260995) (not b!260954) (not b!261023) (not bm!24898) b_and!13865 (not b!261018) (not b!260969) (not b!260964) (not d!62581) (not b!260805) (not d!62585) (not b!261035) (not mapNonEmpty!11301) (not b!260854) (not b!260812) (not b!260899) (not b!261016) (not d!62597) (not bm!24905) (not b!261034) (not d!62587) (not d!62591) (not bm!24903) (not b!260934) (not bm!24909) (not b_lambda!8275) (not d!62567) (not b!260916) (not b!260917) (not d!62557) (not b!260953) (not b!260843) (not b!261014) (not b!260911) (not b!261003) (not bm!24895) (not b!260966) (not b!260913) (not bm!24891) (not b!260915) (not d!62569) (not b!260996) (not d!62565) (not b!260981) (not b!261040) (not b_lambda!8273) (not bm!24870) (not bm!24910) (not bm!24899) (not d!62605) (not b!260963) (not b!261032))
(check-sat b_and!13865 (not b_next!6763))
(get-model)

(declare-fun d!62609 () Bool)

(declare-fun get!3072 (Option!321) V!8481)

(assert (=> d!62609 (= (apply!259 lt!131656 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3072 (getValueByKey!315 (toList!1917 lt!131656) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9174 () Bool)

(assert (= bs!9174 d!62609))

(declare-fun m!276489 () Bool)

(assert (=> bs!9174 m!276489))

(assert (=> bs!9174 m!276489))

(declare-fun m!276491 () Bool)

(assert (=> bs!9174 m!276491))

(assert (=> b!261023 d!62609))

(assert (=> bm!24871 d!62563))

(declare-fun d!62611 () Bool)

(declare-fun isEmpty!542 (Option!321) Bool)

(assert (=> d!62611 (= (isDefined!257 (getValueByKey!315 (toList!1917 lt!131403) key!932)) (not (isEmpty!542 (getValueByKey!315 (toList!1917 lt!131403) key!932))))))

(declare-fun bs!9175 () Bool)

(assert (= bs!9175 d!62611))

(assert (=> bs!9175 m!276291))

(declare-fun m!276493 () Bool)

(assert (=> bs!9175 m!276493))

(assert (=> b!260854 d!62611))

(declare-fun d!62613 () Bool)

(declare-fun c!44418 () Bool)

(assert (=> d!62613 (= c!44418 (and ((_ is Cons!3794) (toList!1917 lt!131403)) (= (_1!2461 (h!4459 (toList!1917 lt!131403))) key!932)))))

(declare-fun e!169164 () Option!321)

(assert (=> d!62613 (= (getValueByKey!315 (toList!1917 lt!131403) key!932) e!169164)))

(declare-fun b!261060 () Bool)

(declare-fun e!169165 () Option!321)

(assert (=> b!261060 (= e!169165 None!319)))

(declare-fun b!261058 () Bool)

(assert (=> b!261058 (= e!169164 e!169165)))

(declare-fun c!44419 () Bool)

(assert (=> b!261058 (= c!44419 (and ((_ is Cons!3794) (toList!1917 lt!131403)) (not (= (_1!2461 (h!4459 (toList!1917 lt!131403))) key!932))))))

(declare-fun b!261059 () Bool)

(assert (=> b!261059 (= e!169165 (getValueByKey!315 (t!8860 (toList!1917 lt!131403)) key!932))))

(declare-fun b!261057 () Bool)

(assert (=> b!261057 (= e!169164 (Some!320 (_2!2461 (h!4459 (toList!1917 lt!131403)))))))

(assert (= (and d!62613 c!44418) b!261057))

(assert (= (and d!62613 (not c!44418)) b!261058))

(assert (= (and b!261058 c!44419) b!261059))

(assert (= (and b!261058 (not c!44419)) b!261060))

(declare-fun m!276495 () Bool)

(assert (=> b!261059 m!276495))

(assert (=> b!260854 d!62613))

(declare-fun d!62615 () Bool)

(declare-fun e!169167 () Bool)

(assert (=> d!62615 e!169167))

(declare-fun res!127544 () Bool)

(assert (=> d!62615 (=> res!127544 e!169167)))

(declare-fun lt!131671 () Bool)

(assert (=> d!62615 (= res!127544 (not lt!131671))))

(declare-fun lt!131670 () Bool)

(assert (=> d!62615 (= lt!131671 lt!131670)))

(declare-fun lt!131672 () Unit!8064)

(declare-fun e!169166 () Unit!8064)

(assert (=> d!62615 (= lt!131672 e!169166)))

(declare-fun c!44420 () Bool)

(assert (=> d!62615 (= c!44420 lt!131670)))

(assert (=> d!62615 (= lt!131670 (containsKey!307 (toList!1917 lt!131656) (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(assert (=> d!62615 (= (contains!1875 lt!131656 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)) lt!131671)))

(declare-fun b!261061 () Bool)

(declare-fun lt!131669 () Unit!8064)

(assert (=> b!261061 (= e!169166 lt!131669)))

(assert (=> b!261061 (= lt!131669 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131656) (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(assert (=> b!261061 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131656) (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun b!261062 () Bool)

(declare-fun Unit!8076 () Unit!8064)

(assert (=> b!261062 (= e!169166 Unit!8076)))

(declare-fun b!261063 () Bool)

(assert (=> b!261063 (= e!169167 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131656) (select (arr!5962 lt!131407) #b00000000000000000000000000000000))))))

(assert (= (and d!62615 c!44420) b!261061))

(assert (= (and d!62615 (not c!44420)) b!261062))

(assert (= (and d!62615 (not res!127544)) b!261063))

(assert (=> d!62615 m!276365))

(declare-fun m!276497 () Bool)

(assert (=> d!62615 m!276497))

(assert (=> b!261061 m!276365))

(declare-fun m!276499 () Bool)

(assert (=> b!261061 m!276499))

(assert (=> b!261061 m!276365))

(declare-fun m!276501 () Bool)

(assert (=> b!261061 m!276501))

(assert (=> b!261061 m!276501))

(declare-fun m!276503 () Bool)

(assert (=> b!261061 m!276503))

(assert (=> b!261063 m!276365))

(assert (=> b!261063 m!276501))

(assert (=> b!261063 m!276501))

(assert (=> b!261063 m!276503))

(assert (=> b!261036 d!62615))

(declare-fun d!62617 () Bool)

(assert (=> d!62617 (= (apply!259 lt!131582 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3072 (getValueByKey!315 (toList!1917 lt!131582) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9176 () Bool)

(assert (= bs!9176 d!62617))

(declare-fun m!276505 () Bool)

(assert (=> bs!9176 m!276505))

(assert (=> bs!9176 m!276505))

(declare-fun m!276507 () Bool)

(assert (=> bs!9176 m!276507))

(assert (=> b!260904 d!62617))

(declare-fun d!62619 () Bool)

(assert (=> d!62619 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131403) key!932))))

(declare-fun lt!131675 () Unit!8064)

(declare-fun choose!1283 (List!3798 (_ BitVec 64)) Unit!8064)

(assert (=> d!62619 (= lt!131675 (choose!1283 (toList!1917 lt!131403) key!932))))

(declare-fun e!169170 () Bool)

(assert (=> d!62619 e!169170))

(declare-fun res!127547 () Bool)

(assert (=> d!62619 (=> (not res!127547) (not e!169170))))

(declare-fun isStrictlySorted!371 (List!3798) Bool)

(assert (=> d!62619 (= res!127547 (isStrictlySorted!371 (toList!1917 lt!131403)))))

(assert (=> d!62619 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131403) key!932) lt!131675)))

(declare-fun b!261066 () Bool)

(assert (=> b!261066 (= e!169170 (containsKey!307 (toList!1917 lt!131403) key!932))))

(assert (= (and d!62619 res!127547) b!261066))

(assert (=> d!62619 m!276291))

(assert (=> d!62619 m!276291))

(assert (=> d!62619 m!276293))

(declare-fun m!276509 () Bool)

(assert (=> d!62619 m!276509))

(declare-fun m!276511 () Bool)

(assert (=> d!62619 m!276511))

(assert (=> b!261066 m!276287))

(assert (=> b!260852 d!62619))

(assert (=> b!260852 d!62611))

(assert (=> b!260852 d!62613))

(declare-fun b!261092 () Bool)

(declare-fun e!169190 () Bool)

(declare-fun e!169187 () Bool)

(assert (=> b!261092 (= e!169190 e!169187)))

(assert (=> b!261092 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(declare-fun res!127558 () Bool)

(declare-fun lt!131694 () ListLongMap!3803)

(assert (=> b!261092 (= res!127558 (contains!1875 lt!131694 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(assert (=> b!261092 (=> (not res!127558) (not e!169187))))

(declare-fun b!261093 () Bool)

(declare-fun e!169188 () ListLongMap!3803)

(declare-fun call!24916 () ListLongMap!3803)

(assert (=> b!261093 (= e!169188 call!24916)))

(declare-fun b!261094 () Bool)

(declare-fun e!169191 () ListLongMap!3803)

(assert (=> b!261094 (= e!169191 e!169188)))

(declare-fun c!44429 () Bool)

(assert (=> b!261094 (= c!44429 (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun b!261095 () Bool)

(declare-fun res!127557 () Bool)

(declare-fun e!169189 () Bool)

(assert (=> b!261095 (=> (not res!127557) (not e!169189))))

(assert (=> b!261095 (= res!127557 (not (contains!1875 lt!131694 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!169186 () Bool)

(declare-fun b!261096 () Bool)

(assert (=> b!261096 (= e!169186 (= lt!131694 (getCurrentListMapNoExtraKeys!575 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4807 thiss!1504))))))

(declare-fun b!261097 () Bool)

(assert (=> b!261097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(assert (=> b!261097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))))))))

(assert (=> b!261097 (= e!169187 (= (apply!259 lt!131694 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)) (get!3071 (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261098 () Bool)

(assert (=> b!261098 (= e!169190 e!169186)))

(declare-fun c!44431 () Bool)

(assert (=> b!261098 (= c!44431 (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(declare-fun b!261099 () Bool)

(declare-fun lt!131696 () Unit!8064)

(declare-fun lt!131692 () Unit!8064)

(assert (=> b!261099 (= lt!131696 lt!131692)))

(declare-fun lt!131693 () ListLongMap!3803)

(declare-fun lt!131690 () (_ BitVec 64))

(declare-fun lt!131695 () V!8481)

(declare-fun lt!131691 () (_ BitVec 64))

(assert (=> b!261099 (not (contains!1875 (+!704 lt!131693 (tuple2!4901 lt!131690 lt!131695)) lt!131691))))

(declare-fun addStillNotContains!129 (ListLongMap!3803 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8064)

(assert (=> b!261099 (= lt!131692 (addStillNotContains!129 lt!131693 lt!131690 lt!131695 lt!131691))))

(assert (=> b!261099 (= lt!131691 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!261099 (= lt!131695 (get!3071 (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261099 (= lt!131690 (select (arr!5962 lt!131407) #b00000000000000000000000000000000))))

(assert (=> b!261099 (= lt!131693 call!24916)))

(assert (=> b!261099 (= e!169188 (+!704 call!24916 (tuple2!4901 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) (get!3071 (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!62621 () Bool)

(assert (=> d!62621 e!169189))

(declare-fun res!127559 () Bool)

(assert (=> d!62621 (=> (not res!127559) (not e!169189))))

(assert (=> d!62621 (= res!127559 (not (contains!1875 lt!131694 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62621 (= lt!131694 e!169191)))

(declare-fun c!44432 () Bool)

(assert (=> d!62621 (= c!44432 (bvsge #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(assert (=> d!62621 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62621 (= (getCurrentListMapNoExtraKeys!575 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131694)))

(declare-fun b!261091 () Bool)

(declare-fun e!169185 () Bool)

(assert (=> b!261091 (= e!169185 (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(assert (=> b!261091 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!261100 () Bool)

(declare-fun isEmpty!543 (ListLongMap!3803) Bool)

(assert (=> b!261100 (= e!169186 (isEmpty!543 lt!131694))))

(declare-fun b!261101 () Bool)

(assert (=> b!261101 (= e!169189 e!169190)))

(declare-fun c!44430 () Bool)

(assert (=> b!261101 (= c!44430 e!169185)))

(declare-fun res!127556 () Bool)

(assert (=> b!261101 (=> (not res!127556) (not e!169185))))

(assert (=> b!261101 (= res!127556 (bvslt #b00000000000000000000000000000000 (size!6313 lt!131407)))))

(declare-fun b!261102 () Bool)

(assert (=> b!261102 (= e!169191 (ListLongMap!3804 Nil!3795))))

(declare-fun bm!24913 () Bool)

(assert (=> bm!24913 (= call!24916 (getCurrentListMapNoExtraKeys!575 lt!131407 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4807 thiss!1504)))))

(assert (= (and d!62621 c!44432) b!261102))

(assert (= (and d!62621 (not c!44432)) b!261094))

(assert (= (and b!261094 c!44429) b!261099))

(assert (= (and b!261094 (not c!44429)) b!261093))

(assert (= (or b!261099 b!261093) bm!24913))

(assert (= (and d!62621 res!127559) b!261095))

(assert (= (and b!261095 res!127557) b!261101))

(assert (= (and b!261101 res!127556) b!261091))

(assert (= (and b!261101 c!44430) b!261092))

(assert (= (and b!261101 (not c!44430)) b!261098))

(assert (= (and b!261092 res!127558) b!261097))

(assert (= (and b!261098 c!44431) b!261096))

(assert (= (and b!261098 (not c!44431)) b!261100))

(declare-fun b_lambda!8277 () Bool)

(assert (=> (not b_lambda!8277) (not b!261097)))

(assert (=> b!261097 t!8865))

(declare-fun b_and!13867 () Bool)

(assert (= b_and!13865 (and (=> t!8865 result!5407) b_and!13867)))

(declare-fun b_lambda!8279 () Bool)

(assert (=> (not b_lambda!8279) (not b!261099)))

(assert (=> b!261099 t!8865))

(declare-fun b_and!13869 () Bool)

(assert (= b_and!13867 (and (=> t!8865 result!5407) b_and!13869)))

(declare-fun m!276513 () Bool)

(assert (=> bm!24913 m!276513))

(assert (=> b!261096 m!276513))

(assert (=> b!261094 m!276365))

(assert (=> b!261094 m!276365))

(assert (=> b!261094 m!276413))

(assert (=> b!261092 m!276365))

(assert (=> b!261092 m!276365))

(declare-fun m!276515 () Bool)

(assert (=> b!261092 m!276515))

(declare-fun m!276517 () Bool)

(assert (=> b!261099 m!276517))

(declare-fun m!276519 () Bool)

(assert (=> b!261099 m!276519))

(assert (=> b!261099 m!276341))

(assert (=> b!261099 m!276475))

(assert (=> b!261099 m!276341))

(assert (=> b!261099 m!276477))

(assert (=> b!261099 m!276475))

(declare-fun m!276521 () Bool)

(assert (=> b!261099 m!276521))

(assert (=> b!261099 m!276521))

(declare-fun m!276523 () Bool)

(assert (=> b!261099 m!276523))

(assert (=> b!261099 m!276365))

(assert (=> b!261091 m!276365))

(assert (=> b!261091 m!276365))

(assert (=> b!261091 m!276413))

(declare-fun m!276525 () Bool)

(assert (=> b!261100 m!276525))

(assert (=> b!261097 m!276475))

(assert (=> b!261097 m!276341))

(assert (=> b!261097 m!276365))

(declare-fun m!276527 () Bool)

(assert (=> b!261097 m!276527))

(assert (=> b!261097 m!276475))

(assert (=> b!261097 m!276341))

(assert (=> b!261097 m!276477))

(assert (=> b!261097 m!276365))

(declare-fun m!276529 () Bool)

(assert (=> b!261095 m!276529))

(declare-fun m!276531 () Bool)

(assert (=> d!62621 m!276531))

(assert (=> d!62621 m!276089))

(assert (=> bm!24909 d!62621))

(declare-fun lt!131699 () Bool)

(declare-fun d!62623 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!174 (List!3798) (InoxSet tuple2!4900))

(assert (=> d!62623 (= lt!131699 (select (content!174 (toList!1917 lt!131622)) (tuple2!4901 key!932 v!346)))))

(declare-fun e!169197 () Bool)

(assert (=> d!62623 (= lt!131699 e!169197)))

(declare-fun res!127564 () Bool)

(assert (=> d!62623 (=> (not res!127564) (not e!169197))))

(assert (=> d!62623 (= res!127564 ((_ is Cons!3794) (toList!1917 lt!131622)))))

(assert (=> d!62623 (= (contains!1876 (toList!1917 lt!131622) (tuple2!4901 key!932 v!346)) lt!131699)))

(declare-fun b!261107 () Bool)

(declare-fun e!169196 () Bool)

(assert (=> b!261107 (= e!169197 e!169196)))

(declare-fun res!127565 () Bool)

(assert (=> b!261107 (=> res!127565 e!169196)))

(assert (=> b!261107 (= res!127565 (= (h!4459 (toList!1917 lt!131622)) (tuple2!4901 key!932 v!346)))))

(declare-fun b!261108 () Bool)

(assert (=> b!261108 (= e!169196 (contains!1876 (t!8860 (toList!1917 lt!131622)) (tuple2!4901 key!932 v!346)))))

(assert (= (and d!62623 res!127564) b!261107))

(assert (= (and b!261107 (not res!127565)) b!261108))

(declare-fun m!276533 () Bool)

(assert (=> d!62623 m!276533))

(declare-fun m!276535 () Bool)

(assert (=> d!62623 m!276535))

(declare-fun m!276537 () Bool)

(assert (=> b!261108 m!276537))

(assert (=> b!260954 d!62623))

(declare-fun d!62625 () Bool)

(declare-fun e!169199 () Bool)

(assert (=> d!62625 e!169199))

(declare-fun res!127566 () Bool)

(assert (=> d!62625 (=> res!127566 e!169199)))

(declare-fun lt!131702 () Bool)

(assert (=> d!62625 (= res!127566 (not lt!131702))))

(declare-fun lt!131701 () Bool)

(assert (=> d!62625 (= lt!131702 lt!131701)))

(declare-fun lt!131703 () Unit!8064)

(declare-fun e!169198 () Unit!8064)

(assert (=> d!62625 (= lt!131703 e!169198)))

(declare-fun c!44433 () Bool)

(assert (=> d!62625 (= c!44433 lt!131701)))

(assert (=> d!62625 (= lt!131701 (containsKey!307 (toList!1917 lt!131582) (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62625 (= (contains!1875 lt!131582 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)) lt!131702)))

(declare-fun b!261109 () Bool)

(declare-fun lt!131700 () Unit!8064)

(assert (=> b!261109 (= e!169198 lt!131700)))

(assert (=> b!261109 (= lt!131700 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131582) (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261109 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131582) (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261110 () Bool)

(declare-fun Unit!8077 () Unit!8064)

(assert (=> b!261110 (= e!169198 Unit!8077)))

(declare-fun b!261111 () Bool)

(assert (=> b!261111 (= e!169199 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131582) (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62625 c!44433) b!261109))

(assert (= (and d!62625 (not c!44433)) b!261110))

(assert (= (and d!62625 (not res!127566)) b!261111))

(assert (=> d!62625 m!276265))

(declare-fun m!276539 () Bool)

(assert (=> d!62625 m!276539))

(assert (=> b!261109 m!276265))

(declare-fun m!276541 () Bool)

(assert (=> b!261109 m!276541))

(assert (=> b!261109 m!276265))

(declare-fun m!276543 () Bool)

(assert (=> b!261109 m!276543))

(assert (=> b!261109 m!276543))

(declare-fun m!276545 () Bool)

(assert (=> b!261109 m!276545))

(assert (=> b!261111 m!276265))

(assert (=> b!261111 m!276543))

(assert (=> b!261111 m!276543))

(assert (=> b!261111 m!276545))

(assert (=> b!260917 d!62625))

(declare-fun d!62627 () Bool)

(declare-fun res!127567 () Bool)

(declare-fun e!169200 () Bool)

(assert (=> d!62627 (=> res!127567 e!169200)))

(assert (=> d!62627 (= res!127567 (= (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62627 (= (arrayContainsKey!0 lt!131407 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!169200)))

(declare-fun b!261112 () Bool)

(declare-fun e!169201 () Bool)

(assert (=> b!261112 (= e!169200 e!169201)))

(declare-fun res!127568 () Bool)

(assert (=> b!261112 (=> (not res!127568) (not e!169201))))

(assert (=> b!261112 (= res!127568 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6313 lt!131407)))))

(declare-fun b!261113 () Bool)

(assert (=> b!261113 (= e!169201 (arrayContainsKey!0 lt!131407 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62627 (not res!127567)) b!261112))

(assert (= (and b!261112 res!127568) b!261113))

(declare-fun m!276547 () Bool)

(assert (=> d!62627 m!276547))

(declare-fun m!276549 () Bool)

(assert (=> b!261113 m!276549))

(assert (=> b!260939 d!62627))

(assert (=> d!62585 d!62579))

(declare-fun d!62629 () Bool)

(assert (=> d!62629 (arrayContainsKey!0 lt!131407 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62629 true))

(declare-fun _$60!384 () Unit!8064)

(assert (=> d!62629 (= (choose!13 lt!131407 key!932 index!297) _$60!384)))

(declare-fun bs!9177 () Bool)

(assert (= bs!9177 d!62629))

(assert (=> bs!9177 m!276119))

(assert (=> d!62585 d!62629))

(declare-fun d!62631 () Bool)

(assert (=> d!62631 (= (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260981 d!62631))

(declare-fun b!261115 () Bool)

(declare-fun e!169207 () Bool)

(declare-fun e!169204 () Bool)

(assert (=> b!261115 (= e!169207 e!169204)))

(assert (=> b!261115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun res!127571 () Bool)

(declare-fun lt!131708 () ListLongMap!3803)

(assert (=> b!261115 (= res!127571 (contains!1875 lt!131708 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261115 (=> (not res!127571) (not e!169204))))

(declare-fun b!261116 () Bool)

(declare-fun e!169205 () ListLongMap!3803)

(declare-fun call!24917 () ListLongMap!3803)

(assert (=> b!261116 (= e!169205 call!24917)))

(declare-fun b!261117 () Bool)

(declare-fun e!169208 () ListLongMap!3803)

(assert (=> b!261117 (= e!169208 e!169205)))

(declare-fun c!44434 () Bool)

(assert (=> b!261117 (= c!44434 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261118 () Bool)

(declare-fun res!127570 () Bool)

(declare-fun e!169206 () Bool)

(assert (=> b!261118 (=> (not res!127570) (not e!169206))))

(assert (=> b!261118 (= res!127570 (not (contains!1875 lt!131708 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261119 () Bool)

(declare-fun e!169203 () Bool)

(assert (=> b!261119 (= e!169203 (= lt!131708 (getCurrentListMapNoExtraKeys!575 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4807 thiss!1504))))))

(declare-fun b!261120 () Bool)

(assert (=> b!261120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> b!261120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (_values!4790 thiss!1504))))))

(assert (=> b!261120 (= e!169204 (= (apply!259 lt!131708 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)) (get!3071 (select (arr!5961 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261121 () Bool)

(assert (=> b!261121 (= e!169207 e!169203)))

(declare-fun c!44436 () Bool)

(assert (=> b!261121 (= c!44436 (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun b!261122 () Bool)

(declare-fun lt!131710 () Unit!8064)

(declare-fun lt!131706 () Unit!8064)

(assert (=> b!261122 (= lt!131710 lt!131706)))

(declare-fun lt!131709 () V!8481)

(declare-fun lt!131707 () ListLongMap!3803)

(declare-fun lt!131705 () (_ BitVec 64))

(declare-fun lt!131704 () (_ BitVec 64))

(assert (=> b!261122 (not (contains!1875 (+!704 lt!131707 (tuple2!4901 lt!131704 lt!131709)) lt!131705))))

(assert (=> b!261122 (= lt!131706 (addStillNotContains!129 lt!131707 lt!131704 lt!131709 lt!131705))))

(assert (=> b!261122 (= lt!131705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!261122 (= lt!131709 (get!3071 (select (arr!5961 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261122 (= lt!131704 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!261122 (= lt!131707 call!24917)))

(assert (=> b!261122 (= e!169205 (+!704 call!24917 (tuple2!4901 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000) (get!3071 (select (arr!5961 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!62633 () Bool)

(assert (=> d!62633 e!169206))

(declare-fun res!127572 () Bool)

(assert (=> d!62633 (=> (not res!127572) (not e!169206))))

(assert (=> d!62633 (= res!127572 (not (contains!1875 lt!131708 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62633 (= lt!131708 e!169208)))

(declare-fun c!44437 () Bool)

(assert (=> d!62633 (= c!44437 (bvsge #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62633 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62633 (= (getCurrentListMapNoExtraKeys!575 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131708)))

(declare-fun b!261114 () Bool)

(declare-fun e!169202 () Bool)

(assert (=> b!261114 (= e!169202 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261114 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!261123 () Bool)

(assert (=> b!261123 (= e!169203 (isEmpty!543 lt!131708))))

(declare-fun b!261124 () Bool)

(assert (=> b!261124 (= e!169206 e!169207)))

(declare-fun c!44435 () Bool)

(assert (=> b!261124 (= c!44435 e!169202)))

(declare-fun res!127569 () Bool)

(assert (=> b!261124 (=> (not res!127569) (not e!169202))))

(assert (=> b!261124 (= res!127569 (bvslt #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun b!261125 () Bool)

(assert (=> b!261125 (= e!169208 (ListLongMap!3804 Nil!3795))))

(declare-fun bm!24914 () Bool)

(assert (=> bm!24914 (= call!24917 (getCurrentListMapNoExtraKeys!575 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4807 thiss!1504)))))

(assert (= (and d!62633 c!44437) b!261125))

(assert (= (and d!62633 (not c!44437)) b!261117))

(assert (= (and b!261117 c!44434) b!261122))

(assert (= (and b!261117 (not c!44434)) b!261116))

(assert (= (or b!261122 b!261116) bm!24914))

(assert (= (and d!62633 res!127572) b!261118))

(assert (= (and b!261118 res!127570) b!261124))

(assert (= (and b!261124 res!127569) b!261114))

(assert (= (and b!261124 c!44435) b!261115))

(assert (= (and b!261124 (not c!44435)) b!261121))

(assert (= (and b!261115 res!127571) b!261120))

(assert (= (and b!261121 c!44436) b!261119))

(assert (= (and b!261121 (not c!44436)) b!261123))

(declare-fun b_lambda!8281 () Bool)

(assert (=> (not b_lambda!8281) (not b!261120)))

(assert (=> b!261120 t!8865))

(declare-fun b_and!13871 () Bool)

(assert (= b_and!13869 (and (=> t!8865 result!5407) b_and!13871)))

(declare-fun b_lambda!8283 () Bool)

(assert (=> (not b_lambda!8283) (not b!261122)))

(assert (=> b!261122 t!8865))

(declare-fun b_and!13873 () Bool)

(assert (= b_and!13871 (and (=> t!8865 result!5407) b_and!13873)))

(declare-fun m!276551 () Bool)

(assert (=> bm!24914 m!276551))

(assert (=> b!261119 m!276551))

(assert (=> b!261117 m!276265))

(assert (=> b!261117 m!276265))

(assert (=> b!261117 m!276331))

(assert (=> b!261115 m!276265))

(assert (=> b!261115 m!276265))

(declare-fun m!276553 () Bool)

(assert (=> b!261115 m!276553))

(declare-fun m!276555 () Bool)

(assert (=> b!261122 m!276555))

(declare-fun m!276557 () Bool)

(assert (=> b!261122 m!276557))

(assert (=> b!261122 m!276341))

(assert (=> b!261122 m!276339))

(assert (=> b!261122 m!276341))

(assert (=> b!261122 m!276343))

(assert (=> b!261122 m!276339))

(declare-fun m!276559 () Bool)

(assert (=> b!261122 m!276559))

(assert (=> b!261122 m!276559))

(declare-fun m!276561 () Bool)

(assert (=> b!261122 m!276561))

(assert (=> b!261122 m!276265))

(assert (=> b!261114 m!276265))

(assert (=> b!261114 m!276265))

(assert (=> b!261114 m!276331))

(declare-fun m!276563 () Bool)

(assert (=> b!261123 m!276563))

(assert (=> b!261120 m!276339))

(assert (=> b!261120 m!276341))

(assert (=> b!261120 m!276265))

(declare-fun m!276565 () Bool)

(assert (=> b!261120 m!276565))

(assert (=> b!261120 m!276339))

(assert (=> b!261120 m!276341))

(assert (=> b!261120 m!276343))

(assert (=> b!261120 m!276265))

(declare-fun m!276567 () Bool)

(assert (=> b!261118 m!276567))

(declare-fun m!276569 () Bool)

(assert (=> d!62633 m!276569))

(assert (=> d!62633 m!276089))

(assert (=> bm!24892 d!62633))

(declare-fun d!62635 () Bool)

(assert (=> d!62635 (= (apply!259 lt!131656 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3072 (getValueByKey!315 (toList!1917 lt!131656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9178 () Bool)

(assert (= bs!9178 d!62635))

(declare-fun m!276571 () Bool)

(assert (=> bs!9178 m!276571))

(assert (=> bs!9178 m!276571))

(declare-fun m!276573 () Bool)

(assert (=> bs!9178 m!276573))

(assert (=> b!261018 d!62635))

(declare-fun d!62637 () Bool)

(assert (=> d!62637 (= (inRange!0 (ite c!44360 (index!6890 lt!131515) (index!6893 lt!131515)) (mask!11143 thiss!1504)) (and (bvsge (ite c!44360 (index!6890 lt!131515) (index!6893 lt!131515)) #b00000000000000000000000000000000) (bvslt (ite c!44360 (index!6890 lt!131515) (index!6893 lt!131515)) (bvadd (mask!11143 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24870 d!62637))

(declare-fun d!62639 () Bool)

(declare-fun res!127573 () Bool)

(declare-fun e!169211 () Bool)

(assert (=> d!62639 (=> res!127573 e!169211)))

(assert (=> d!62639 (= res!127573 (bvsge #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)) e!169211)))

(declare-fun bm!24915 () Bool)

(declare-fun call!24918 () Bool)

(assert (=> bm!24915 (= call!24918 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(declare-fun b!261126 () Bool)

(declare-fun e!169209 () Bool)

(assert (=> b!261126 (= e!169209 call!24918)))

(declare-fun b!261127 () Bool)

(declare-fun e!169210 () Bool)

(assert (=> b!261127 (= e!169210 e!169209)))

(declare-fun lt!131711 () (_ BitVec 64))

(assert (=> b!261127 (= lt!131711 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131712 () Unit!8064)

(assert (=> b!261127 (= lt!131712 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6990 thiss!1504) lt!131711 #b00000000000000000000000000000000))))

(assert (=> b!261127 (arrayContainsKey!0 (_keys!6990 thiss!1504) lt!131711 #b00000000000000000000000000000000)))

(declare-fun lt!131713 () Unit!8064)

(assert (=> b!261127 (= lt!131713 lt!131712)))

(declare-fun res!127574 () Bool)

(assert (=> b!261127 (= res!127574 (= (seekEntryOrOpen!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000) (_keys!6990 thiss!1504) (mask!11143 thiss!1504)) (Found!1180 #b00000000000000000000000000000000)))))

(assert (=> b!261127 (=> (not res!127574) (not e!169209))))

(declare-fun b!261128 () Bool)

(assert (=> b!261128 (= e!169211 e!169210)))

(declare-fun c!44438 () Bool)

(assert (=> b!261128 (= c!44438 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261129 () Bool)

(assert (=> b!261129 (= e!169210 call!24918)))

(assert (= (and d!62639 (not res!127573)) b!261128))

(assert (= (and b!261128 c!44438) b!261127))

(assert (= (and b!261128 (not c!44438)) b!261129))

(assert (= (and b!261127 res!127574) b!261126))

(assert (= (or b!261126 b!261129) bm!24915))

(declare-fun m!276575 () Bool)

(assert (=> bm!24915 m!276575))

(assert (=> b!261127 m!276265))

(declare-fun m!276577 () Bool)

(assert (=> b!261127 m!276577))

(declare-fun m!276579 () Bool)

(assert (=> b!261127 m!276579))

(assert (=> b!261127 m!276265))

(declare-fun m!276581 () Bool)

(assert (=> b!261127 m!276581))

(assert (=> b!261128 m!276265))

(assert (=> b!261128 m!276265))

(assert (=> b!261128 m!276331))

(assert (=> b!260844 d!62639))

(declare-fun d!62641 () Bool)

(declare-fun res!127575 () Bool)

(declare-fun e!169214 () Bool)

(assert (=> d!62641 (=> res!127575 e!169214)))

(assert (=> d!62641 (= res!127575 (bvsge #b00000000000000000000000000000000 (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))))

(assert (=> d!62641 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (mask!11143 thiss!1504)) e!169214)))

(declare-fun bm!24916 () Bool)

(declare-fun call!24919 () Bool)

(assert (=> bm!24916 (= call!24919 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (mask!11143 thiss!1504)))))

(declare-fun b!261130 () Bool)

(declare-fun e!169212 () Bool)

(assert (=> b!261130 (= e!169212 call!24919)))

(declare-fun b!261131 () Bool)

(declare-fun e!169213 () Bool)

(assert (=> b!261131 (= e!169213 e!169212)))

(declare-fun lt!131714 () (_ BitVec 64))

(assert (=> b!261131 (= lt!131714 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131715 () Unit!8064)

(assert (=> b!261131 (= lt!131715 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) lt!131714 #b00000000000000000000000000000000))))

(assert (=> b!261131 (arrayContainsKey!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) lt!131714 #b00000000000000000000000000000000)))

(declare-fun lt!131716 () Unit!8064)

(assert (=> b!261131 (= lt!131716 lt!131715)))

(declare-fun res!127576 () Bool)

(assert (=> b!261131 (= res!127576 (= (seekEntryOrOpen!0 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000) (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (mask!11143 thiss!1504)) (Found!1180 #b00000000000000000000000000000000)))))

(assert (=> b!261131 (=> (not res!127576) (not e!169212))))

(declare-fun b!261132 () Bool)

(assert (=> b!261132 (= e!169214 e!169213)))

(declare-fun c!44439 () Bool)

(assert (=> b!261132 (= c!44439 (validKeyInArray!0 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261133 () Bool)

(assert (=> b!261133 (= e!169213 call!24919)))

(assert (= (and d!62641 (not res!127575)) b!261132))

(assert (= (and b!261132 c!44439) b!261131))

(assert (= (and b!261132 (not c!44439)) b!261133))

(assert (= (and b!261131 res!127576) b!261130))

(assert (= (or b!261130 b!261133) bm!24916))

(declare-fun m!276583 () Bool)

(assert (=> bm!24916 m!276583))

(declare-fun m!276585 () Bool)

(assert (=> b!261131 m!276585))

(declare-fun m!276587 () Bool)

(assert (=> b!261131 m!276587))

(declare-fun m!276589 () Bool)

(assert (=> b!261131 m!276589))

(assert (=> b!261131 m!276585))

(declare-fun m!276591 () Bool)

(assert (=> b!261131 m!276591))

(assert (=> b!261132 m!276585))

(assert (=> b!261132 m!276585))

(declare-fun m!276593 () Bool)

(assert (=> b!261132 m!276593))

(assert (=> b!260969 d!62641))

(assert (=> d!62557 d!62577))

(declare-fun d!62643 () Bool)

(declare-fun e!169217 () Bool)

(assert (=> d!62643 e!169217))

(declare-fun res!127581 () Bool)

(assert (=> d!62643 (=> (not res!127581) (not e!169217))))

(declare-fun lt!131719 () SeekEntryResult!1180)

(assert (=> d!62643 (= res!127581 ((_ is Found!1180) lt!131719))))

(assert (=> d!62643 (= lt!131719 (seekEntryOrOpen!0 key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(assert (=> d!62643 true))

(declare-fun _$33!183 () Unit!8064)

(assert (=> d!62643 (= (choose!1279 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)) _$33!183)))

(declare-fun b!261138 () Bool)

(declare-fun res!127582 () Bool)

(assert (=> b!261138 (=> (not res!127582) (not e!169217))))

(assert (=> b!261138 (= res!127582 (inRange!0 (index!6891 lt!131719) (mask!11143 thiss!1504)))))

(declare-fun b!261139 () Bool)

(assert (=> b!261139 (= e!169217 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6891 lt!131719)) key!932))))

(assert (= (and d!62643 res!127581) b!261138))

(assert (= (and b!261138 res!127582) b!261139))

(assert (=> d!62643 m!276067))

(declare-fun m!276595 () Bool)

(assert (=> b!261138 m!276595))

(declare-fun m!276597 () Bool)

(assert (=> b!261139 m!276597))

(assert (=> d!62557 d!62643))

(assert (=> d!62557 d!62603))

(declare-fun b!261152 () Bool)

(declare-fun e!169224 () SeekEntryResult!1180)

(assert (=> b!261152 (= e!169224 (MissingVacant!1180 (index!6892 lt!131600)))))

(declare-fun b!261153 () Bool)

(declare-fun c!44448 () Bool)

(declare-fun lt!131724 () (_ BitVec 64))

(assert (=> b!261153 (= c!44448 (= lt!131724 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169225 () SeekEntryResult!1180)

(assert (=> b!261153 (= e!169225 e!169224)))

(declare-fun b!261155 () Bool)

(declare-fun e!169226 () SeekEntryResult!1180)

(assert (=> b!261155 (= e!169226 Undefined!1180)))

(declare-fun b!261156 () Bool)

(assert (=> b!261156 (= e!169225 (Found!1180 (index!6892 lt!131600)))))

(declare-fun b!261157 () Bool)

(assert (=> b!261157 (= e!169226 e!169225)))

(declare-fun c!44447 () Bool)

(assert (=> b!261157 (= c!44447 (= lt!131724 key!932))))

(declare-fun d!62645 () Bool)

(declare-fun lt!131725 () SeekEntryResult!1180)

(assert (=> d!62645 (and (or ((_ is Undefined!1180) lt!131725) (not ((_ is Found!1180) lt!131725)) (and (bvsge (index!6891 lt!131725) #b00000000000000000000000000000000) (bvslt (index!6891 lt!131725) (size!6313 (_keys!6990 thiss!1504))))) (or ((_ is Undefined!1180) lt!131725) ((_ is Found!1180) lt!131725) (not ((_ is MissingVacant!1180) lt!131725)) (not (= (index!6893 lt!131725) (index!6892 lt!131600))) (and (bvsge (index!6893 lt!131725) #b00000000000000000000000000000000) (bvslt (index!6893 lt!131725) (size!6313 (_keys!6990 thiss!1504))))) (or ((_ is Undefined!1180) lt!131725) (ite ((_ is Found!1180) lt!131725) (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6891 lt!131725)) key!932) (and ((_ is MissingVacant!1180) lt!131725) (= (index!6893 lt!131725) (index!6892 lt!131600)) (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6893 lt!131725)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!62645 (= lt!131725 e!169226)))

(declare-fun c!44446 () Bool)

(assert (=> d!62645 (= c!44446 (bvsge (x!25143 lt!131600) #b01111111111111111111111111111110))))

(assert (=> d!62645 (= lt!131724 (select (arr!5962 (_keys!6990 thiss!1504)) (index!6892 lt!131600)))))

(assert (=> d!62645 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62645 (= (seekKeyOrZeroReturnVacant!0 (x!25143 lt!131600) (index!6892 lt!131600) (index!6892 lt!131600) key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)) lt!131725)))

(declare-fun b!261154 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261154 (= e!169224 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25143 lt!131600) #b00000000000000000000000000000001) (nextIndex!0 (index!6892 lt!131600) (x!25143 lt!131600) (mask!11143 thiss!1504)) (index!6892 lt!131600) key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(assert (= (and d!62645 c!44446) b!261155))

(assert (= (and d!62645 (not c!44446)) b!261157))

(assert (= (and b!261157 c!44447) b!261156))

(assert (= (and b!261157 (not c!44447)) b!261153))

(assert (= (and b!261153 c!44448) b!261152))

(assert (= (and b!261153 (not c!44448)) b!261154))

(declare-fun m!276599 () Bool)

(assert (=> d!62645 m!276599))

(declare-fun m!276601 () Bool)

(assert (=> d!62645 m!276601))

(assert (=> d!62645 m!276351))

(assert (=> d!62645 m!276089))

(declare-fun m!276603 () Bool)

(assert (=> b!261154 m!276603))

(assert (=> b!261154 m!276603))

(declare-fun m!276605 () Bool)

(assert (=> b!261154 m!276605))

(assert (=> b!260934 d!62645))

(declare-fun d!62647 () Bool)

(declare-fun e!169227 () Bool)

(assert (=> d!62647 e!169227))

(declare-fun res!127583 () Bool)

(assert (=> d!62647 (=> (not res!127583) (not e!169227))))

(declare-fun lt!131728 () ListLongMap!3803)

(assert (=> d!62647 (= res!127583 (contains!1875 lt!131728 (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131727 () List!3798)

(assert (=> d!62647 (= lt!131728 (ListLongMap!3804 lt!131727))))

(declare-fun lt!131729 () Unit!8064)

(declare-fun lt!131726 () Unit!8064)

(assert (=> d!62647 (= lt!131729 lt!131726)))

(assert (=> d!62647 (= (getValueByKey!315 lt!131727 (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62647 (= lt!131726 (lemmaContainsTupThenGetReturnValue!174 lt!131727 (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62647 (= lt!131727 (insertStrictlySorted!177 (toList!1917 call!24912) (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62647 (= (+!704 call!24912 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) lt!131728)))

(declare-fun b!261158 () Bool)

(declare-fun res!127584 () Bool)

(assert (=> b!261158 (=> (not res!127584) (not e!169227))))

(assert (=> b!261158 (= res!127584 (= (getValueByKey!315 (toList!1917 lt!131728) (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(declare-fun b!261159 () Bool)

(assert (=> b!261159 (= e!169227 (contains!1876 (toList!1917 lt!131728) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(assert (= (and d!62647 res!127583) b!261158))

(assert (= (and b!261158 res!127584) b!261159))

(declare-fun m!276607 () Bool)

(assert (=> d!62647 m!276607))

(declare-fun m!276609 () Bool)

(assert (=> d!62647 m!276609))

(declare-fun m!276611 () Bool)

(assert (=> d!62647 m!276611))

(declare-fun m!276613 () Bool)

(assert (=> d!62647 m!276613))

(declare-fun m!276615 () Bool)

(assert (=> b!261158 m!276615))

(declare-fun m!276617 () Bool)

(assert (=> b!261159 m!276617))

(assert (=> b!261016 d!62647))

(declare-fun d!62649 () Bool)

(assert (=> d!62649 (= (apply!259 lt!131582 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3072 (getValueByKey!315 (toList!1917 lt!131582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9179 () Bool)

(assert (= bs!9179 d!62649))

(declare-fun m!276619 () Bool)

(assert (=> bs!9179 m!276619))

(assert (=> bs!9179 m!276619))

(declare-fun m!276621 () Bool)

(assert (=> bs!9179 m!276621))

(assert (=> b!260899 d!62649))

(declare-fun b!261170 () Bool)

(declare-fun res!127595 () Bool)

(declare-fun e!169230 () Bool)

(assert (=> b!261170 (=> (not res!127595) (not e!169230))))

(declare-fun size!6318 (LongMapFixedSize!3838) (_ BitVec 32))

(assert (=> b!261170 (= res!127595 (= (size!6318 thiss!1504) (bvadd (_size!1968 thiss!1504) (bvsdiv (bvadd (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!261169 () Bool)

(declare-fun res!127593 () Bool)

(assert (=> b!261169 (=> (not res!127593) (not e!169230))))

(assert (=> b!261169 (= res!127593 (bvsge (size!6318 thiss!1504) (_size!1968 thiss!1504)))))

(declare-fun b!261171 () Bool)

(assert (=> b!261171 (= e!169230 (and (bvsge (extraKeys!4544 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4544 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1968 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!62651 () Bool)

(declare-fun res!127594 () Bool)

(assert (=> d!62651 (=> (not res!127594) (not e!169230))))

(assert (=> d!62651 (= res!127594 (validMask!0 (mask!11143 thiss!1504)))))

(assert (=> d!62651 (= (simpleValid!282 thiss!1504) e!169230)))

(declare-fun b!261168 () Bool)

(declare-fun res!127596 () Bool)

(assert (=> b!261168 (=> (not res!127596) (not e!169230))))

(assert (=> b!261168 (= res!127596 (and (= (size!6312 (_values!4790 thiss!1504)) (bvadd (mask!11143 thiss!1504) #b00000000000000000000000000000001)) (= (size!6313 (_keys!6990 thiss!1504)) (size!6312 (_values!4790 thiss!1504))) (bvsge (_size!1968 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1968 thiss!1504) (bvadd (mask!11143 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!62651 res!127594) b!261168))

(assert (= (and b!261168 res!127596) b!261169))

(assert (= (and b!261169 res!127593) b!261170))

(assert (= (and b!261170 res!127595) b!261171))

(declare-fun m!276623 () Bool)

(assert (=> b!261170 m!276623))

(assert (=> b!261169 m!276623))

(assert (=> d!62651 m!276089))

(assert (=> d!62569 d!62651))

(declare-fun d!62653 () Bool)

(assert (=> d!62653 (arrayNoDuplicates!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) #b00000000000000000000000000000000 Nil!3796)))

(assert (=> d!62653 true))

(declare-fun _$65!95 () Unit!8064)

(assert (=> d!62653 (= (choose!41 (_keys!6990 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3796) _$65!95)))

(declare-fun bs!9180 () Bool)

(assert (= bs!9180 d!62653))

(assert (=> bs!9180 m!276107))

(assert (=> bs!9180 m!276379))

(assert (=> d!62583 d!62653))

(declare-fun d!62655 () Bool)

(assert (=> d!62655 (= (arrayCountValidKeys!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6990 thiss!1504) #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62655 true))

(declare-fun _$84!45 () Unit!8064)

(assert (=> d!62655 (= (choose!1 (_keys!6990 thiss!1504) index!297 key!932) _$84!45)))

(declare-fun bs!9181 () Bool)

(assert (= bs!9181 d!62655))

(assert (=> bs!9181 m!276107))

(assert (=> bs!9181 m!276395))

(assert (=> bs!9181 m!276109))

(assert (=> d!62589 d!62655))

(declare-fun d!62657 () Bool)

(assert (=> d!62657 (= (validKeyInArray!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)) (and (not (= (select (arr!5962 lt!131407) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5962 lt!131407) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261032 d!62657))

(assert (=> d!62575 d!62603))

(assert (=> b!260913 d!62631))

(declare-fun d!62659 () Bool)

(declare-fun lt!131732 () Bool)

(declare-fun content!175 (List!3799) (InoxSet (_ BitVec 64)))

(assert (=> d!62659 (= lt!131732 (select (content!175 Nil!3796) (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun e!169236 () Bool)

(assert (=> d!62659 (= lt!131732 e!169236)))

(declare-fun res!127601 () Bool)

(assert (=> d!62659 (=> (not res!127601) (not e!169236))))

(assert (=> d!62659 (= res!127601 ((_ is Cons!3795) Nil!3796))))

(assert (=> d!62659 (= (contains!1877 Nil!3796 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)) lt!131732)))

(declare-fun b!261176 () Bool)

(declare-fun e!169235 () Bool)

(assert (=> b!261176 (= e!169236 e!169235)))

(declare-fun res!127602 () Bool)

(assert (=> b!261176 (=> res!127602 e!169235)))

(assert (=> b!261176 (= res!127602 (= (h!4460 Nil!3796) (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun b!261177 () Bool)

(assert (=> b!261177 (= e!169235 (contains!1877 (t!8861 Nil!3796) (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(assert (= (and d!62659 res!127601) b!261176))

(assert (= (and b!261176 (not res!127602)) b!261177))

(declare-fun m!276625 () Bool)

(assert (=> d!62659 m!276625))

(assert (=> d!62659 m!276365))

(declare-fun m!276627 () Bool)

(assert (=> d!62659 m!276627))

(assert (=> b!261177 m!276365))

(declare-fun m!276629 () Bool)

(assert (=> b!261177 m!276629))

(assert (=> b!260996 d!62659))

(declare-fun b!261178 () Bool)

(declare-fun e!169237 () (_ BitVec 32))

(declare-fun call!24920 () (_ BitVec 32))

(assert (=> b!261178 (= e!169237 call!24920)))

(declare-fun bm!24917 () Bool)

(assert (=> bm!24917 (= call!24920 (arrayCountValidKeys!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun d!62661 () Bool)

(declare-fun lt!131733 () (_ BitVec 32))

(assert (=> d!62661 (and (bvsge lt!131733 #b00000000000000000000000000000000) (bvsle lt!131733 (bvsub (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!169238 () (_ BitVec 32))

(assert (=> d!62661 (= lt!131733 e!169238)))

(declare-fun c!44449 () Bool)

(assert (=> d!62661 (= c!44449 (bvsge #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62661 (and (bvsle #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6313 (_keys!6990 thiss!1504)) (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))))

(assert (=> d!62661 (= (arrayCountValidKeys!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))) lt!131733)))

(declare-fun b!261179 () Bool)

(assert (=> b!261179 (= e!169238 #b00000000000000000000000000000000)))

(declare-fun b!261180 () Bool)

(assert (=> b!261180 (= e!169237 (bvadd #b00000000000000000000000000000001 call!24920))))

(declare-fun b!261181 () Bool)

(assert (=> b!261181 (= e!169238 e!169237)))

(declare-fun c!44450 () Bool)

(assert (=> b!261181 (= c!44450 (validKeyInArray!0 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!62661 c!44449) b!261179))

(assert (= (and d!62661 (not c!44449)) b!261181))

(assert (= (and b!261181 c!44450) b!261180))

(assert (= (and b!261181 (not c!44450)) b!261178))

(assert (= (or b!261180 b!261178) bm!24917))

(declare-fun m!276631 () Bool)

(assert (=> bm!24917 m!276631))

(assert (=> b!261181 m!276585))

(assert (=> b!261181 m!276585))

(assert (=> b!261181 m!276593))

(assert (=> b!260966 d!62661))

(assert (=> b!260966 d!62593))

(assert (=> b!260994 d!62657))

(declare-fun d!62663 () Bool)

(assert (=> d!62663 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260964 d!62663))

(assert (=> b!261014 d!62657))

(declare-fun d!62665 () Bool)

(assert (=> d!62665 (= (validKeyInArray!0 (select (arr!5962 lt!131407) index!297)) (and (not (= (select (arr!5962 lt!131407) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5962 lt!131407) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261040 d!62665))

(declare-fun b!261182 () Bool)

(declare-fun e!169242 () Bool)

(declare-fun call!24921 () Bool)

(assert (=> b!261182 (= e!169242 call!24921)))

(declare-fun bm!24918 () Bool)

(declare-fun c!44451 () Bool)

(assert (=> bm!24918 (= call!24921 (arrayNoDuplicates!0 lt!131407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44451 (Cons!3795 (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44400 (Cons!3795 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) Nil!3796) Nil!3796)) (ite c!44400 (Cons!3795 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) Nil!3796) Nil!3796))))))

(declare-fun b!261183 () Bool)

(assert (=> b!261183 (= e!169242 call!24921)))

(declare-fun b!261184 () Bool)

(declare-fun e!169241 () Bool)

(declare-fun e!169239 () Bool)

(assert (=> b!261184 (= e!169241 e!169239)))

(declare-fun res!127605 () Bool)

(assert (=> b!261184 (=> (not res!127605) (not e!169239))))

(declare-fun e!169240 () Bool)

(assert (=> b!261184 (= res!127605 (not e!169240))))

(declare-fun res!127604 () Bool)

(assert (=> b!261184 (=> (not res!127604) (not e!169240))))

(assert (=> b!261184 (= res!127604 (validKeyInArray!0 (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261185 () Bool)

(assert (=> b!261185 (= e!169239 e!169242)))

(assert (=> b!261185 (= c!44451 (validKeyInArray!0 (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62667 () Bool)

(declare-fun res!127603 () Bool)

(assert (=> d!62667 (=> res!127603 e!169241)))

(assert (=> d!62667 (= res!127603 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 lt!131407)))))

(assert (=> d!62667 (= (arrayNoDuplicates!0 lt!131407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44400 (Cons!3795 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) Nil!3796) Nil!3796)) e!169241)))

(declare-fun b!261186 () Bool)

(assert (=> b!261186 (= e!169240 (contains!1877 (ite c!44400 (Cons!3795 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) Nil!3796) Nil!3796) (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62667 (not res!127603)) b!261184))

(assert (= (and b!261184 res!127604) b!261186))

(assert (= (and b!261184 res!127605) b!261185))

(assert (= (and b!261185 c!44451) b!261182))

(assert (= (and b!261185 (not c!44451)) b!261183))

(assert (= (or b!261182 b!261183) bm!24918))

(assert (=> bm!24918 m!276547))

(declare-fun m!276633 () Bool)

(assert (=> bm!24918 m!276633))

(assert (=> b!261184 m!276547))

(assert (=> b!261184 m!276547))

(declare-fun m!276635 () Bool)

(assert (=> b!261184 m!276635))

(assert (=> b!261185 m!276547))

(assert (=> b!261185 m!276547))

(assert (=> b!261185 m!276635))

(assert (=> b!261186 m!276547))

(assert (=> b!261186 m!276547))

(declare-fun m!276637 () Bool)

(assert (=> b!261186 m!276637))

(assert (=> bm!24898 d!62667))

(assert (=> b!260944 d!62665))

(declare-fun b!261187 () Bool)

(declare-fun e!169243 () (_ BitVec 32))

(declare-fun call!24922 () (_ BitVec 32))

(assert (=> b!261187 (= e!169243 call!24922)))

(declare-fun bm!24919 () Bool)

(assert (=> bm!24919 (= call!24922 (arrayCountValidKeys!0 lt!131407 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun d!62669 () Bool)

(declare-fun lt!131734 () (_ BitVec 32))

(assert (=> d!62669 (and (bvsge lt!131734 #b00000000000000000000000000000000) (bvsle lt!131734 (bvsub (size!6313 lt!131407) index!297)))))

(declare-fun e!169244 () (_ BitVec 32))

(assert (=> d!62669 (= lt!131734 e!169244)))

(declare-fun c!44452 () Bool)

(assert (=> d!62669 (= c!44452 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62669 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6313 lt!131407)))))

(assert (=> d!62669 (= (arrayCountValidKeys!0 lt!131407 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!131734)))

(declare-fun b!261188 () Bool)

(assert (=> b!261188 (= e!169244 #b00000000000000000000000000000000)))

(declare-fun b!261189 () Bool)

(assert (=> b!261189 (= e!169243 (bvadd #b00000000000000000000000000000001 call!24922))))

(declare-fun b!261190 () Bool)

(assert (=> b!261190 (= e!169244 e!169243)))

(declare-fun c!44453 () Bool)

(assert (=> b!261190 (= c!44453 (validKeyInArray!0 (select (arr!5962 lt!131407) index!297)))))

(assert (= (and d!62669 c!44452) b!261188))

(assert (= (and d!62669 (not c!44452)) b!261190))

(assert (= (and b!261190 c!44453) b!261189))

(assert (= (and b!261190 (not c!44453)) b!261187))

(assert (= (or b!261189 b!261187) bm!24919))

(declare-fun m!276639 () Bool)

(assert (=> bm!24919 m!276639))

(assert (=> b!261190 m!276373))

(assert (=> b!261190 m!276373))

(assert (=> b!261190 m!276375))

(assert (=> d!62581 d!62669))

(declare-fun d!62671 () Bool)

(assert (=> d!62671 (= (arrayCountValidKeys!0 lt!131407 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62671 true))

(declare-fun _$85!30 () Unit!8064)

(assert (=> d!62671 (= (choose!2 lt!131407 index!297) _$85!30)))

(declare-fun bs!9182 () Bool)

(assert (= bs!9182 d!62671))

(assert (=> bs!9182 m!276369))

(assert (=> d!62581 d!62671))

(declare-fun d!62673 () Bool)

(assert (=> d!62673 (= (inRange!0 (index!6891 lt!131505) (mask!11143 thiss!1504)) (and (bvsge (index!6891 lt!131505) #b00000000000000000000000000000000) (bvslt (index!6891 lt!131505) (bvadd (mask!11143 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260805 d!62673))

(declare-fun d!62675 () Bool)

(declare-fun res!127606 () Bool)

(declare-fun e!169247 () Bool)

(assert (=> d!62675 (=> res!127606 e!169247)))

(assert (=> d!62675 (= res!127606 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 lt!131407)))))

(assert (=> d!62675 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131407 (mask!11143 thiss!1504)) e!169247)))

(declare-fun bm!24920 () Bool)

(declare-fun call!24923 () Bool)

(assert (=> bm!24920 (= call!24923 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!131407 (mask!11143 thiss!1504)))))

(declare-fun b!261191 () Bool)

(declare-fun e!169245 () Bool)

(assert (=> b!261191 (= e!169245 call!24923)))

(declare-fun b!261192 () Bool)

(declare-fun e!169246 () Bool)

(assert (=> b!261192 (= e!169246 e!169245)))

(declare-fun lt!131735 () (_ BitVec 64))

(assert (=> b!261192 (= lt!131735 (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!131736 () Unit!8064)

(assert (=> b!261192 (= lt!131736 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131407 lt!131735 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!261192 (arrayContainsKey!0 lt!131407 lt!131735 #b00000000000000000000000000000000)))

(declare-fun lt!131737 () Unit!8064)

(assert (=> b!261192 (= lt!131737 lt!131736)))

(declare-fun res!127607 () Bool)

(assert (=> b!261192 (= res!127607 (= (seekEntryOrOpen!0 (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!131407 (mask!11143 thiss!1504)) (Found!1180 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!261192 (=> (not res!127607) (not e!169245))))

(declare-fun b!261193 () Bool)

(assert (=> b!261193 (= e!169247 e!169246)))

(declare-fun c!44454 () Bool)

(assert (=> b!261193 (= c!44454 (validKeyInArray!0 (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261194 () Bool)

(assert (=> b!261194 (= e!169246 call!24923)))

(assert (= (and d!62675 (not res!127606)) b!261193))

(assert (= (and b!261193 c!44454) b!261192))

(assert (= (and b!261193 (not c!44454)) b!261194))

(assert (= (and b!261192 res!127607) b!261191))

(assert (= (or b!261191 b!261194) bm!24920))

(declare-fun m!276641 () Bool)

(assert (=> bm!24920 m!276641))

(assert (=> b!261192 m!276547))

(declare-fun m!276643 () Bool)

(assert (=> b!261192 m!276643))

(declare-fun m!276645 () Bool)

(assert (=> b!261192 m!276645))

(assert (=> b!261192 m!276547))

(declare-fun m!276647 () Bool)

(assert (=> b!261192 m!276647))

(assert (=> b!261193 m!276547))

(assert (=> b!261193 m!276547))

(assert (=> b!261193 m!276635))

(assert (=> bm!24902 d!62675))

(declare-fun d!62677 () Bool)

(declare-fun res!127608 () Bool)

(declare-fun e!169248 () Bool)

(assert (=> d!62677 (=> res!127608 e!169248)))

(assert (=> d!62677 (= res!127608 (= (select (arr!5962 (_keys!6990 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62677 (= (arrayContainsKey!0 (_keys!6990 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!169248)))

(declare-fun b!261195 () Bool)

(declare-fun e!169249 () Bool)

(assert (=> b!261195 (= e!169248 e!169249)))

(declare-fun res!127609 () Bool)

(assert (=> b!261195 (=> (not res!127609) (not e!169249))))

(assert (=> b!261195 (= res!127609 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun b!261196 () Bool)

(assert (=> b!261196 (= e!169249 (arrayContainsKey!0 (_keys!6990 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62677 (not res!127608)) b!261195))

(assert (= (and b!261195 res!127609) b!261196))

(declare-fun m!276649 () Bool)

(assert (=> d!62677 m!276649))

(declare-fun m!276651 () Bool)

(assert (=> b!261196 m!276651))

(assert (=> b!260812 d!62677))

(declare-fun b!261197 () Bool)

(declare-fun e!169250 () (_ BitVec 32))

(declare-fun call!24924 () (_ BitVec 32))

(assert (=> b!261197 (= e!169250 call!24924)))

(declare-fun bm!24921 () Bool)

(assert (=> bm!24921 (= call!24924 (arrayCountValidKeys!0 lt!131407 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!62679 () Bool)

(declare-fun lt!131738 () (_ BitVec 32))

(assert (=> d!62679 (and (bvsge lt!131738 #b00000000000000000000000000000000) (bvsle lt!131738 (bvsub (size!6313 lt!131407) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun e!169251 () (_ BitVec 32))

(assert (=> d!62679 (= lt!131738 e!169251)))

(declare-fun c!44455 () Bool)

(assert (=> d!62679 (= c!44455 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62679 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6313 lt!131407)))))

(assert (=> d!62679 (= (arrayCountValidKeys!0 lt!131407 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!131738)))

(declare-fun b!261198 () Bool)

(assert (=> b!261198 (= e!169251 #b00000000000000000000000000000000)))

(declare-fun b!261199 () Bool)

(assert (=> b!261199 (= e!169250 (bvadd #b00000000000000000000000000000001 call!24924))))

(declare-fun b!261200 () Bool)

(assert (=> b!261200 (= e!169251 e!169250)))

(declare-fun c!44456 () Bool)

(assert (=> b!261200 (= c!44456 (validKeyInArray!0 (select (arr!5962 lt!131407) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (= (and d!62679 c!44455) b!261198))

(assert (= (and d!62679 (not c!44455)) b!261200))

(assert (= (and b!261200 c!44456) b!261199))

(assert (= (and b!261200 (not c!44456)) b!261197))

(assert (= (or b!261199 b!261197) bm!24921))

(declare-fun m!276653 () Bool)

(assert (=> bm!24921 m!276653))

(declare-fun m!276655 () Bool)

(assert (=> b!261200 m!276655))

(assert (=> b!261200 m!276655))

(declare-fun m!276657 () Bool)

(assert (=> b!261200 m!276657))

(assert (=> bm!24910 d!62679))

(assert (=> d!62605 d!62603))

(declare-fun d!62681 () Bool)

(declare-fun e!169253 () Bool)

(assert (=> d!62681 e!169253))

(declare-fun res!127610 () Bool)

(assert (=> d!62681 (=> res!127610 e!169253)))

(declare-fun lt!131741 () Bool)

(assert (=> d!62681 (= res!127610 (not lt!131741))))

(declare-fun lt!131740 () Bool)

(assert (=> d!62681 (= lt!131741 lt!131740)))

(declare-fun lt!131742 () Unit!8064)

(declare-fun e!169252 () Unit!8064)

(assert (=> d!62681 (= lt!131742 e!169252)))

(declare-fun c!44457 () Bool)

(assert (=> d!62681 (= c!44457 lt!131740)))

(assert (=> d!62681 (= lt!131740 (containsKey!307 (toList!1917 lt!131656) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62681 (= (contains!1875 lt!131656 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131741)))

(declare-fun b!261201 () Bool)

(declare-fun lt!131739 () Unit!8064)

(assert (=> b!261201 (= e!169252 lt!131739)))

(assert (=> b!261201 (= lt!131739 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131656) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261201 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131656) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261202 () Bool)

(declare-fun Unit!8078 () Unit!8064)

(assert (=> b!261202 (= e!169252 Unit!8078)))

(declare-fun b!261203 () Bool)

(assert (=> b!261203 (= e!169253 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62681 c!44457) b!261201))

(assert (= (and d!62681 (not c!44457)) b!261202))

(assert (= (and d!62681 (not res!127610)) b!261203))

(declare-fun m!276659 () Bool)

(assert (=> d!62681 m!276659))

(declare-fun m!276661 () Bool)

(assert (=> b!261201 m!276661))

(assert (=> b!261201 m!276571))

(assert (=> b!261201 m!276571))

(declare-fun m!276663 () Bool)

(assert (=> b!261201 m!276663))

(assert (=> b!261203 m!276571))

(assert (=> b!261203 m!276571))

(assert (=> b!261203 m!276663))

(assert (=> bm!24903 d!62681))

(declare-fun d!62683 () Bool)

(declare-fun e!169254 () Bool)

(assert (=> d!62683 e!169254))

(declare-fun res!127611 () Bool)

(assert (=> d!62683 (=> (not res!127611) (not e!169254))))

(declare-fun lt!131745 () ListLongMap!3803)

(assert (=> d!62683 (= res!127611 (contains!1875 lt!131745 (_1!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504)))))))

(declare-fun lt!131744 () List!3798)

(assert (=> d!62683 (= lt!131745 (ListLongMap!3804 lt!131744))))

(declare-fun lt!131746 () Unit!8064)

(declare-fun lt!131743 () Unit!8064)

(assert (=> d!62683 (= lt!131746 lt!131743)))

(assert (=> d!62683 (= (getValueByKey!315 lt!131744 (_1!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62683 (= lt!131743 (lemmaContainsTupThenGetReturnValue!174 lt!131744 (_1!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62683 (= lt!131744 (insertStrictlySorted!177 (toList!1917 lt!131666) (_1!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62683 (= (+!704 lt!131666 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504))) lt!131745)))

(declare-fun b!261204 () Bool)

(declare-fun res!127612 () Bool)

(assert (=> b!261204 (=> (not res!127612) (not e!169254))))

(assert (=> b!261204 (= res!127612 (= (getValueByKey!315 (toList!1917 lt!131745) (_1!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504))))))))

(declare-fun b!261205 () Bool)

(assert (=> b!261205 (= e!169254 (contains!1876 (toList!1917 lt!131745) (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504))))))

(assert (= (and d!62683 res!127611) b!261204))

(assert (= (and b!261204 res!127612) b!261205))

(declare-fun m!276665 () Bool)

(assert (=> d!62683 m!276665))

(declare-fun m!276667 () Bool)

(assert (=> d!62683 m!276667))

(declare-fun m!276669 () Bool)

(assert (=> d!62683 m!276669))

(declare-fun m!276671 () Bool)

(assert (=> d!62683 m!276671))

(declare-fun m!276673 () Bool)

(assert (=> b!261204 m!276673))

(declare-fun m!276675 () Bool)

(assert (=> b!261205 m!276675))

(assert (=> b!261035 d!62683))

(declare-fun d!62685 () Bool)

(assert (=> d!62685 (contains!1875 (+!704 lt!131664 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504))) lt!131647)))

(declare-fun lt!131749 () Unit!8064)

(declare-fun choose!1284 (ListLongMap!3803 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8064)

(assert (=> d!62685 (= lt!131749 (choose!1284 lt!131664 lt!131651 (zeroValue!4648 thiss!1504) lt!131647))))

(assert (=> d!62685 (contains!1875 lt!131664 lt!131647)))

(assert (=> d!62685 (= (addStillContains!235 lt!131664 lt!131651 (zeroValue!4648 thiss!1504) lt!131647) lt!131749)))

(declare-fun bs!9183 () Bool)

(assert (= bs!9183 d!62685))

(assert (=> bs!9183 m!276447))

(assert (=> bs!9183 m!276447))

(assert (=> bs!9183 m!276449))

(declare-fun m!276677 () Bool)

(assert (=> bs!9183 m!276677))

(declare-fun m!276679 () Bool)

(assert (=> bs!9183 m!276679))

(assert (=> b!261035 d!62685))

(assert (=> b!261035 d!62621))

(declare-fun d!62687 () Bool)

(assert (=> d!62687 (= (apply!259 (+!704 lt!131666 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504))) lt!131648) (get!3072 (getValueByKey!315 (toList!1917 (+!704 lt!131666 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504)))) lt!131648)))))

(declare-fun bs!9184 () Bool)

(assert (= bs!9184 d!62687))

(declare-fun m!276681 () Bool)

(assert (=> bs!9184 m!276681))

(assert (=> bs!9184 m!276681))

(declare-fun m!276683 () Bool)

(assert (=> bs!9184 m!276683))

(assert (=> b!261035 d!62687))

(declare-fun d!62689 () Bool)

(assert (=> d!62689 (= (apply!259 (+!704 lt!131653 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504))) lt!131662) (apply!259 lt!131653 lt!131662))))

(declare-fun lt!131752 () Unit!8064)

(declare-fun choose!1285 (ListLongMap!3803 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8064)

(assert (=> d!62689 (= lt!131752 (choose!1285 lt!131653 lt!131646 (minValue!4648 thiss!1504) lt!131662))))

(declare-fun e!169257 () Bool)

(assert (=> d!62689 e!169257))

(declare-fun res!127615 () Bool)

(assert (=> d!62689 (=> (not res!127615) (not e!169257))))

(assert (=> d!62689 (= res!127615 (contains!1875 lt!131653 lt!131662))))

(assert (=> d!62689 (= (addApplyDifferent!235 lt!131653 lt!131646 (minValue!4648 thiss!1504) lt!131662) lt!131752)))

(declare-fun b!261210 () Bool)

(assert (=> b!261210 (= e!169257 (not (= lt!131662 lt!131646)))))

(assert (= (and d!62689 res!127615) b!261210))

(assert (=> d!62689 m!276451))

(declare-fun m!276685 () Bool)

(assert (=> d!62689 m!276685))

(assert (=> d!62689 m!276457))

(assert (=> d!62689 m!276461))

(declare-fun m!276687 () Bool)

(assert (=> d!62689 m!276687))

(assert (=> d!62689 m!276457))

(assert (=> b!261035 d!62689))

(declare-fun d!62691 () Bool)

(assert (=> d!62691 (= (apply!259 (+!704 lt!131666 (tuple2!4901 lt!131654 (zeroValue!4648 thiss!1504))) lt!131648) (apply!259 lt!131666 lt!131648))))

(declare-fun lt!131753 () Unit!8064)

(assert (=> d!62691 (= lt!131753 (choose!1285 lt!131666 lt!131654 (zeroValue!4648 thiss!1504) lt!131648))))

(declare-fun e!169258 () Bool)

(assert (=> d!62691 e!169258))

(declare-fun res!127616 () Bool)

(assert (=> d!62691 (=> (not res!127616) (not e!169258))))

(assert (=> d!62691 (= res!127616 (contains!1875 lt!131666 lt!131648))))

(assert (=> d!62691 (= (addApplyDifferent!235 lt!131666 lt!131654 (zeroValue!4648 thiss!1504) lt!131648) lt!131753)))

(declare-fun b!261211 () Bool)

(assert (=> b!261211 (= e!169258 (not (= lt!131648 lt!131654)))))

(assert (= (and d!62691 res!127616) b!261211))

(assert (=> d!62691 m!276463))

(declare-fun m!276689 () Bool)

(assert (=> d!62691 m!276689))

(assert (=> d!62691 m!276441))

(assert (=> d!62691 m!276443))

(declare-fun m!276691 () Bool)

(assert (=> d!62691 m!276691))

(assert (=> d!62691 m!276441))

(assert (=> b!261035 d!62691))

(declare-fun d!62693 () Bool)

(assert (=> d!62693 (= (apply!259 (+!704 lt!131653 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504))) lt!131662) (get!3072 (getValueByKey!315 (toList!1917 (+!704 lt!131653 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504)))) lt!131662)))))

(declare-fun bs!9185 () Bool)

(assert (= bs!9185 d!62693))

(declare-fun m!276693 () Bool)

(assert (=> bs!9185 m!276693))

(assert (=> bs!9185 m!276693))

(declare-fun m!276695 () Bool)

(assert (=> bs!9185 m!276695))

(assert (=> b!261035 d!62693))

(declare-fun d!62695 () Bool)

(declare-fun e!169259 () Bool)

(assert (=> d!62695 e!169259))

(declare-fun res!127617 () Bool)

(assert (=> d!62695 (=> (not res!127617) (not e!169259))))

(declare-fun lt!131756 () ListLongMap!3803)

(assert (=> d!62695 (= res!127617 (contains!1875 lt!131756 (_1!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131755 () List!3798)

(assert (=> d!62695 (= lt!131756 (ListLongMap!3804 lt!131755))))

(declare-fun lt!131757 () Unit!8064)

(declare-fun lt!131754 () Unit!8064)

(assert (=> d!62695 (= lt!131757 lt!131754)))

(assert (=> d!62695 (= (getValueByKey!315 lt!131755 (_1!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504)))))))

(assert (=> d!62695 (= lt!131754 (lemmaContainsTupThenGetReturnValue!174 lt!131755 (_1!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504)))))))

(assert (=> d!62695 (= lt!131755 (insertStrictlySorted!177 (toList!1917 lt!131653) (_1!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504)))))))

(assert (=> d!62695 (= (+!704 lt!131653 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504))) lt!131756)))

(declare-fun b!261212 () Bool)

(declare-fun res!127618 () Bool)

(assert (=> b!261212 (=> (not res!127618) (not e!169259))))

(assert (=> b!261212 (= res!127618 (= (getValueByKey!315 (toList!1917 lt!131756) (_1!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131646 (minValue!4648 thiss!1504))))))))

(declare-fun b!261213 () Bool)

(assert (=> b!261213 (= e!169259 (contains!1876 (toList!1917 lt!131756) (tuple2!4901 lt!131646 (minValue!4648 thiss!1504))))))

(assert (= (and d!62695 res!127617) b!261212))

(assert (= (and b!261212 res!127618) b!261213))

(declare-fun m!276697 () Bool)

(assert (=> d!62695 m!276697))

(declare-fun m!276699 () Bool)

(assert (=> d!62695 m!276699))

(declare-fun m!276701 () Bool)

(assert (=> d!62695 m!276701))

(declare-fun m!276703 () Bool)

(assert (=> d!62695 m!276703))

(declare-fun m!276705 () Bool)

(assert (=> b!261212 m!276705))

(declare-fun m!276707 () Bool)

(assert (=> b!261213 m!276707))

(assert (=> b!261035 d!62695))

(declare-fun d!62697 () Bool)

(declare-fun e!169260 () Bool)

(assert (=> d!62697 e!169260))

(declare-fun res!127619 () Bool)

(assert (=> d!62697 (=> (not res!127619) (not e!169260))))

(declare-fun lt!131760 () ListLongMap!3803)

(assert (=> d!62697 (= res!127619 (contains!1875 lt!131760 (_1!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131759 () List!3798)

(assert (=> d!62697 (= lt!131760 (ListLongMap!3804 lt!131759))))

(declare-fun lt!131761 () Unit!8064)

(declare-fun lt!131758 () Unit!8064)

(assert (=> d!62697 (= lt!131761 lt!131758)))

(assert (=> d!62697 (= (getValueByKey!315 lt!131759 (_1!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504)))))))

(assert (=> d!62697 (= lt!131758 (lemmaContainsTupThenGetReturnValue!174 lt!131759 (_1!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504)))))))

(assert (=> d!62697 (= lt!131759 (insertStrictlySorted!177 (toList!1917 lt!131649) (_1!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504)))))))

(assert (=> d!62697 (= (+!704 lt!131649 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504))) lt!131760)))

(declare-fun b!261214 () Bool)

(declare-fun res!127620 () Bool)

(assert (=> b!261214 (=> (not res!127620) (not e!169260))))

(assert (=> b!261214 (= res!127620 (= (getValueByKey!315 (toList!1917 lt!131760) (_1!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504))))))))

(declare-fun b!261215 () Bool)

(assert (=> b!261215 (= e!169260 (contains!1876 (toList!1917 lt!131760) (tuple2!4901 lt!131652 (minValue!4648 thiss!1504))))))

(assert (= (and d!62697 res!127619) b!261214))

(assert (= (and b!261214 res!127620) b!261215))

(declare-fun m!276709 () Bool)

(assert (=> d!62697 m!276709))

(declare-fun m!276711 () Bool)

(assert (=> d!62697 m!276711))

(declare-fun m!276713 () Bool)

(assert (=> d!62697 m!276713))

(declare-fun m!276715 () Bool)

(assert (=> d!62697 m!276715))

(declare-fun m!276717 () Bool)

(assert (=> b!261214 m!276717))

(declare-fun m!276719 () Bool)

(assert (=> b!261215 m!276719))

(assert (=> b!261035 d!62697))

(declare-fun d!62699 () Bool)

(assert (=> d!62699 (= (apply!259 (+!704 lt!131649 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504))) lt!131667) (get!3072 (getValueByKey!315 (toList!1917 (+!704 lt!131649 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504)))) lt!131667)))))

(declare-fun bs!9186 () Bool)

(assert (= bs!9186 d!62699))

(declare-fun m!276721 () Bool)

(assert (=> bs!9186 m!276721))

(assert (=> bs!9186 m!276721))

(declare-fun m!276723 () Bool)

(assert (=> bs!9186 m!276723))

(assert (=> b!261035 d!62699))

(declare-fun d!62701 () Bool)

(assert (=> d!62701 (= (apply!259 lt!131653 lt!131662) (get!3072 (getValueByKey!315 (toList!1917 lt!131653) lt!131662)))))

(declare-fun bs!9187 () Bool)

(assert (= bs!9187 d!62701))

(declare-fun m!276725 () Bool)

(assert (=> bs!9187 m!276725))

(assert (=> bs!9187 m!276725))

(declare-fun m!276727 () Bool)

(assert (=> bs!9187 m!276727))

(assert (=> b!261035 d!62701))

(declare-fun d!62703 () Bool)

(assert (=> d!62703 (= (apply!259 (+!704 lt!131649 (tuple2!4901 lt!131652 (minValue!4648 thiss!1504))) lt!131667) (apply!259 lt!131649 lt!131667))))

(declare-fun lt!131762 () Unit!8064)

(assert (=> d!62703 (= lt!131762 (choose!1285 lt!131649 lt!131652 (minValue!4648 thiss!1504) lt!131667))))

(declare-fun e!169261 () Bool)

(assert (=> d!62703 e!169261))

(declare-fun res!127621 () Bool)

(assert (=> d!62703 (=> (not res!127621) (not e!169261))))

(assert (=> d!62703 (= res!127621 (contains!1875 lt!131649 lt!131667))))

(assert (=> d!62703 (= (addApplyDifferent!235 lt!131649 lt!131652 (minValue!4648 thiss!1504) lt!131667) lt!131762)))

(declare-fun b!261216 () Bool)

(assert (=> b!261216 (= e!169261 (not (= lt!131667 lt!131652)))))

(assert (= (and d!62703 res!127621) b!261216))

(assert (=> d!62703 m!276433))

(declare-fun m!276729 () Bool)

(assert (=> d!62703 m!276729))

(assert (=> d!62703 m!276435))

(assert (=> d!62703 m!276437))

(declare-fun m!276731 () Bool)

(assert (=> d!62703 m!276731))

(assert (=> d!62703 m!276435))

(assert (=> b!261035 d!62703))

(declare-fun d!62705 () Bool)

(assert (=> d!62705 (= (apply!259 lt!131649 lt!131667) (get!3072 (getValueByKey!315 (toList!1917 lt!131649) lt!131667)))))

(declare-fun bs!9188 () Bool)

(assert (= bs!9188 d!62705))

(declare-fun m!276733 () Bool)

(assert (=> bs!9188 m!276733))

(assert (=> bs!9188 m!276733))

(declare-fun m!276735 () Bool)

(assert (=> bs!9188 m!276735))

(assert (=> b!261035 d!62705))

(declare-fun d!62707 () Bool)

(declare-fun e!169263 () Bool)

(assert (=> d!62707 e!169263))

(declare-fun res!127622 () Bool)

(assert (=> d!62707 (=> res!127622 e!169263)))

(declare-fun lt!131765 () Bool)

(assert (=> d!62707 (= res!127622 (not lt!131765))))

(declare-fun lt!131764 () Bool)

(assert (=> d!62707 (= lt!131765 lt!131764)))

(declare-fun lt!131766 () Unit!8064)

(declare-fun e!169262 () Unit!8064)

(assert (=> d!62707 (= lt!131766 e!169262)))

(declare-fun c!44458 () Bool)

(assert (=> d!62707 (= c!44458 lt!131764)))

(assert (=> d!62707 (= lt!131764 (containsKey!307 (toList!1917 (+!704 lt!131664 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))) lt!131647))))

(assert (=> d!62707 (= (contains!1875 (+!704 lt!131664 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504))) lt!131647) lt!131765)))

(declare-fun b!261217 () Bool)

(declare-fun lt!131763 () Unit!8064)

(assert (=> b!261217 (= e!169262 lt!131763)))

(assert (=> b!261217 (= lt!131763 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 (+!704 lt!131664 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))) lt!131647))))

(assert (=> b!261217 (isDefined!257 (getValueByKey!315 (toList!1917 (+!704 lt!131664 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))) lt!131647))))

(declare-fun b!261218 () Bool)

(declare-fun Unit!8079 () Unit!8064)

(assert (=> b!261218 (= e!169262 Unit!8079)))

(declare-fun b!261219 () Bool)

(assert (=> b!261219 (= e!169263 (isDefined!257 (getValueByKey!315 (toList!1917 (+!704 lt!131664 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))) lt!131647)))))

(assert (= (and d!62707 c!44458) b!261217))

(assert (= (and d!62707 (not c!44458)) b!261218))

(assert (= (and d!62707 (not res!127622)) b!261219))

(declare-fun m!276737 () Bool)

(assert (=> d!62707 m!276737))

(declare-fun m!276739 () Bool)

(assert (=> b!261217 m!276739))

(declare-fun m!276741 () Bool)

(assert (=> b!261217 m!276741))

(assert (=> b!261217 m!276741))

(declare-fun m!276743 () Bool)

(assert (=> b!261217 m!276743))

(assert (=> b!261219 m!276741))

(assert (=> b!261219 m!276741))

(assert (=> b!261219 m!276743))

(assert (=> b!261035 d!62707))

(declare-fun d!62709 () Bool)

(assert (=> d!62709 (= (apply!259 lt!131666 lt!131648) (get!3072 (getValueByKey!315 (toList!1917 lt!131666) lt!131648)))))

(declare-fun bs!9189 () Bool)

(assert (= bs!9189 d!62709))

(declare-fun m!276745 () Bool)

(assert (=> bs!9189 m!276745))

(assert (=> bs!9189 m!276745))

(declare-fun m!276747 () Bool)

(assert (=> bs!9189 m!276747))

(assert (=> b!261035 d!62709))

(declare-fun d!62711 () Bool)

(declare-fun e!169264 () Bool)

(assert (=> d!62711 e!169264))

(declare-fun res!127623 () Bool)

(assert (=> d!62711 (=> (not res!127623) (not e!169264))))

(declare-fun lt!131769 () ListLongMap!3803)

(assert (=> d!62711 (= res!127623 (contains!1875 lt!131769 (_1!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))))))

(declare-fun lt!131768 () List!3798)

(assert (=> d!62711 (= lt!131769 (ListLongMap!3804 lt!131768))))

(declare-fun lt!131770 () Unit!8064)

(declare-fun lt!131767 () Unit!8064)

(assert (=> d!62711 (= lt!131770 lt!131767)))

(assert (=> d!62711 (= (getValueByKey!315 lt!131768 (_1!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62711 (= lt!131767 (lemmaContainsTupThenGetReturnValue!174 lt!131768 (_1!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62711 (= lt!131768 (insertStrictlySorted!177 (toList!1917 lt!131664) (_1!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62711 (= (+!704 lt!131664 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504))) lt!131769)))

(declare-fun b!261220 () Bool)

(declare-fun res!127624 () Bool)

(assert (=> b!261220 (=> (not res!127624) (not e!169264))))

(assert (=> b!261220 (= res!127624 (= (getValueByKey!315 (toList!1917 lt!131769) (_1!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504))))))))

(declare-fun b!261221 () Bool)

(assert (=> b!261221 (= e!169264 (contains!1876 (toList!1917 lt!131769) (tuple2!4901 lt!131651 (zeroValue!4648 thiss!1504))))))

(assert (= (and d!62711 res!127623) b!261220))

(assert (= (and b!261220 res!127624) b!261221))

(declare-fun m!276749 () Bool)

(assert (=> d!62711 m!276749))

(declare-fun m!276751 () Bool)

(assert (=> d!62711 m!276751))

(declare-fun m!276753 () Bool)

(assert (=> d!62711 m!276753))

(declare-fun m!276755 () Bool)

(assert (=> d!62711 m!276755))

(declare-fun m!276757 () Bool)

(assert (=> b!261220 m!276757))

(declare-fun m!276759 () Bool)

(assert (=> b!261221 m!276759))

(assert (=> b!261035 d!62711))

(declare-fun d!62713 () Bool)

(assert (=> d!62713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (mask!11143 thiss!1504))))

(assert (=> d!62713 true))

(declare-fun _$56!42 () Unit!8064)

(assert (=> d!62713 (= (choose!102 key!932 (_keys!6990 thiss!1504) index!297 (mask!11143 thiss!1504)) _$56!42)))

(declare-fun bs!9190 () Bool)

(assert (= bs!9190 d!62713))

(assert (=> bs!9190 m!276107))

(assert (=> bs!9190 m!276407))

(assert (=> d!62591 d!62713))

(assert (=> d!62591 d!62603))

(declare-fun d!62715 () Bool)

(declare-fun e!169266 () Bool)

(assert (=> d!62715 e!169266))

(declare-fun res!127625 () Bool)

(assert (=> d!62715 (=> res!127625 e!169266)))

(declare-fun lt!131773 () Bool)

(assert (=> d!62715 (= res!127625 (not lt!131773))))

(declare-fun lt!131772 () Bool)

(assert (=> d!62715 (= lt!131773 lt!131772)))

(declare-fun lt!131774 () Unit!8064)

(declare-fun e!169265 () Unit!8064)

(assert (=> d!62715 (= lt!131774 e!169265)))

(declare-fun c!44459 () Bool)

(assert (=> d!62715 (= c!44459 lt!131772)))

(assert (=> d!62715 (= lt!131772 (containsKey!307 (toList!1917 lt!131582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62715 (= (contains!1875 lt!131582 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131773)))

(declare-fun b!261222 () Bool)

(declare-fun lt!131771 () Unit!8064)

(assert (=> b!261222 (= e!169265 lt!131771)))

(assert (=> b!261222 (= lt!131771 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261222 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131582) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261223 () Bool)

(declare-fun Unit!8080 () Unit!8064)

(assert (=> b!261223 (= e!169265 Unit!8080)))

(declare-fun b!261224 () Bool)

(assert (=> b!261224 (= e!169266 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62715 c!44459) b!261222))

(assert (= (and d!62715 (not c!44459)) b!261223))

(assert (= (and d!62715 (not res!127625)) b!261224))

(declare-fun m!276761 () Bool)

(assert (=> d!62715 m!276761))

(declare-fun m!276763 () Bool)

(assert (=> b!261222 m!276763))

(assert (=> b!261222 m!276619))

(assert (=> b!261222 m!276619))

(declare-fun m!276765 () Bool)

(assert (=> b!261222 m!276765))

(assert (=> b!261224 m!276619))

(assert (=> b!261224 m!276619))

(assert (=> b!261224 m!276765))

(assert (=> bm!24886 d!62715))

(declare-fun d!62717 () Bool)

(declare-fun e!169267 () Bool)

(assert (=> d!62717 e!169267))

(declare-fun res!127626 () Bool)

(assert (=> d!62717 (=> (not res!127626) (not e!169267))))

(declare-fun lt!131777 () ListLongMap!3803)

(assert (=> d!62717 (= res!127626 (contains!1875 lt!131777 (_1!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun lt!131776 () List!3798)

(assert (=> d!62717 (= lt!131777 (ListLongMap!3804 lt!131776))))

(declare-fun lt!131778 () Unit!8064)

(declare-fun lt!131775 () Unit!8064)

(assert (=> d!62717 (= lt!131778 lt!131775)))

(assert (=> d!62717 (= (getValueByKey!315 lt!131776 (_1!2461 (tuple2!4901 key!932 v!346))) (Some!320 (_2!2461 (tuple2!4901 key!932 v!346))))))

(assert (=> d!62717 (= lt!131775 (lemmaContainsTupThenGetReturnValue!174 lt!131776 (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))))))

(assert (=> d!62717 (= lt!131776 (insertStrictlySorted!177 (toList!1917 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))))))

(assert (=> d!62717 (= (+!704 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) (tuple2!4901 key!932 v!346)) lt!131777)))

(declare-fun b!261225 () Bool)

(declare-fun res!127627 () Bool)

(assert (=> b!261225 (=> (not res!127627) (not e!169267))))

(assert (=> b!261225 (= res!127627 (= (getValueByKey!315 (toList!1917 lt!131777) (_1!2461 (tuple2!4901 key!932 v!346))) (Some!320 (_2!2461 (tuple2!4901 key!932 v!346)))))))

(declare-fun b!261226 () Bool)

(assert (=> b!261226 (= e!169267 (contains!1876 (toList!1917 lt!131777) (tuple2!4901 key!932 v!346)))))

(assert (= (and d!62717 res!127626) b!261225))

(assert (= (and b!261225 res!127627) b!261226))

(declare-fun m!276767 () Bool)

(assert (=> d!62717 m!276767))

(declare-fun m!276769 () Bool)

(assert (=> d!62717 m!276769))

(declare-fun m!276771 () Bool)

(assert (=> d!62717 m!276771))

(declare-fun m!276773 () Bool)

(assert (=> d!62717 m!276773))

(declare-fun m!276775 () Bool)

(assert (=> b!261225 m!276775))

(declare-fun m!276777 () Bool)

(assert (=> b!261226 m!276777))

(assert (=> b!260999 d!62717))

(assert (=> b!260999 d!62575))

(declare-fun b!261227 () Bool)

(declare-fun e!169271 () ListLongMap!3803)

(declare-fun call!24931 () ListLongMap!3803)

(assert (=> b!261227 (= e!169271 (+!704 call!24931 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(declare-fun b!261228 () Bool)

(declare-fun e!169268 () Unit!8064)

(declare-fun Unit!8081 () Unit!8064)

(assert (=> b!261228 (= e!169268 Unit!8081)))

(declare-fun b!261229 () Bool)

(declare-fun e!169280 () Bool)

(declare-fun lt!131789 () ListLongMap!3803)

(assert (=> b!261229 (= e!169280 (= (apply!259 lt!131789 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4648 thiss!1504)))))

(declare-fun b!261230 () Bool)

(declare-fun e!169279 () ListLongMap!3803)

(declare-fun call!24925 () ListLongMap!3803)

(assert (=> b!261230 (= e!169279 call!24925)))

(declare-fun b!261231 () Bool)

(declare-fun e!169275 () Bool)

(declare-fun e!169272 () Bool)

(assert (=> b!261231 (= e!169275 e!169272)))

(declare-fun c!44461 () Bool)

(assert (=> b!261231 (= c!44461 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24922 () Bool)

(declare-fun call!24926 () Bool)

(assert (=> bm!24922 (= call!24926 (contains!1875 lt!131789 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261232 () Bool)

(declare-fun c!44465 () Bool)

(assert (=> b!261232 (= c!44465 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169270 () ListLongMap!3803)

(assert (=> b!261232 (= e!169270 e!169279)))

(declare-fun b!261233 () Bool)

(assert (=> b!261233 (= e!169271 e!169270)))

(declare-fun c!44460 () Bool)

(assert (=> b!261233 (= c!44460 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261234 () Bool)

(declare-fun e!169269 () Bool)

(assert (=> b!261234 (= e!169269 (= (apply!259 lt!131789 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4648 thiss!1504)))))

(declare-fun b!261235 () Bool)

(declare-fun call!24930 () ListLongMap!3803)

(assert (=> b!261235 (= e!169270 call!24930)))

(declare-fun b!261236 () Bool)

(declare-fun e!169273 () Bool)

(assert (=> b!261236 (= e!169273 e!169269)))

(declare-fun res!127632 () Bool)

(declare-fun call!24927 () Bool)

(assert (=> b!261236 (= res!127632 call!24927)))

(assert (=> b!261236 (=> (not res!127632) (not e!169269))))

(declare-fun b!261237 () Bool)

(declare-fun res!127635 () Bool)

(assert (=> b!261237 (=> (not res!127635) (not e!169275))))

(assert (=> b!261237 (= res!127635 e!169273)))

(declare-fun c!44462 () Bool)

(assert (=> b!261237 (= c!44462 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!62719 () Bool)

(assert (=> d!62719 e!169275))

(declare-fun res!127634 () Bool)

(assert (=> d!62719 (=> (not res!127634) (not e!169275))))

(assert (=> d!62719 (= res!127634 (or (bvsge #b00000000000000000000000000000000 (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))))))

(declare-fun lt!131791 () ListLongMap!3803)

(assert (=> d!62719 (= lt!131789 lt!131791)))

(declare-fun lt!131794 () Unit!8064)

(assert (=> d!62719 (= lt!131794 e!169268)))

(declare-fun c!44464 () Bool)

(declare-fun e!169278 () Bool)

(assert (=> d!62719 (= c!44464 e!169278)))

(declare-fun res!127628 () Bool)

(assert (=> d!62719 (=> (not res!127628) (not e!169278))))

(assert (=> d!62719 (= res!127628 (bvslt #b00000000000000000000000000000000 (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))))

(assert (=> d!62719 (= lt!131791 e!169271)))

(declare-fun c!44463 () Bool)

(assert (=> d!62719 (= c!44463 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62719 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62719 (= (getCurrentListMap!1426 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131789)))

(declare-fun b!261238 () Bool)

(assert (=> b!261238 (= e!169279 call!24930)))

(declare-fun b!261239 () Bool)

(assert (=> b!261239 (= e!169272 e!169280)))

(declare-fun res!127629 () Bool)

(assert (=> b!261239 (= res!127629 call!24926)))

(assert (=> b!261239 (=> (not res!127629) (not e!169280))))

(declare-fun b!261240 () Bool)

(assert (=> b!261240 (= e!169272 (not call!24926))))

(declare-fun e!169274 () Bool)

(declare-fun b!261241 () Bool)

(assert (=> b!261241 (= e!169274 (validKeyInArray!0 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261242 () Bool)

(declare-fun res!127633 () Bool)

(assert (=> b!261242 (=> (not res!127633) (not e!169275))))

(declare-fun e!169276 () Bool)

(assert (=> b!261242 (= res!127633 e!169276)))

(declare-fun res!127631 () Bool)

(assert (=> b!261242 (=> res!127631 e!169276)))

(assert (=> b!261242 (= res!127631 (not e!169274))))

(declare-fun res!127630 () Bool)

(assert (=> b!261242 (=> (not res!127630) (not e!169274))))

(assert (=> b!261242 (= res!127630 (bvslt #b00000000000000000000000000000000 (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))))

(declare-fun bm!24923 () Bool)

(declare-fun call!24928 () ListLongMap!3803)

(declare-fun call!24929 () ListLongMap!3803)

(assert (=> bm!24923 (= call!24928 call!24929)))

(declare-fun b!261243 () Bool)

(assert (=> b!261243 (= e!169278 (validKeyInArray!0 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24924 () Bool)

(assert (=> bm!24924 (= call!24931 (+!704 (ite c!44463 call!24929 (ite c!44460 call!24928 call!24925)) (ite (or c!44463 c!44460) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun bm!24925 () Bool)

(assert (=> bm!24925 (= call!24930 call!24931)))

(declare-fun b!261244 () Bool)

(assert (=> b!261244 (= e!169273 (not call!24927))))

(declare-fun e!169277 () Bool)

(declare-fun b!261245 () Bool)

(assert (=> b!261245 (= e!169277 (= (apply!259 lt!131789 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)) (get!3071 (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261245 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))))))))

(assert (=> b!261245 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))))

(declare-fun bm!24926 () Bool)

(assert (=> bm!24926 (= call!24925 call!24928)))

(declare-fun bm!24927 () Bool)

(assert (=> bm!24927 (= call!24927 (contains!1875 lt!131789 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24928 () Bool)

(assert (=> bm!24928 (= call!24929 (getCurrentListMapNoExtraKeys!575 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun b!261246 () Bool)

(declare-fun lt!131793 () Unit!8064)

(assert (=> b!261246 (= e!169268 lt!131793)))

(declare-fun lt!131797 () ListLongMap!3803)

(assert (=> b!261246 (= lt!131797 (getCurrentListMapNoExtraKeys!575 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131784 () (_ BitVec 64))

(assert (=> b!261246 (= lt!131784 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131780 () (_ BitVec 64))

(assert (=> b!261246 (= lt!131780 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131788 () Unit!8064)

(assert (=> b!261246 (= lt!131788 (addStillContains!235 lt!131797 lt!131784 (zeroValue!4648 thiss!1504) lt!131780))))

(assert (=> b!261246 (contains!1875 (+!704 lt!131797 (tuple2!4901 lt!131784 (zeroValue!4648 thiss!1504))) lt!131780)))

(declare-fun lt!131792 () Unit!8064)

(assert (=> b!261246 (= lt!131792 lt!131788)))

(declare-fun lt!131786 () ListLongMap!3803)

(assert (=> b!261246 (= lt!131786 (getCurrentListMapNoExtraKeys!575 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131779 () (_ BitVec 64))

(assert (=> b!261246 (= lt!131779 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131795 () (_ BitVec 64))

(assert (=> b!261246 (= lt!131795 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131783 () Unit!8064)

(assert (=> b!261246 (= lt!131783 (addApplyDifferent!235 lt!131786 lt!131779 (minValue!4648 thiss!1504) lt!131795))))

(assert (=> b!261246 (= (apply!259 (+!704 lt!131786 (tuple2!4901 lt!131779 (minValue!4648 thiss!1504))) lt!131795) (apply!259 lt!131786 lt!131795))))

(declare-fun lt!131798 () Unit!8064)

(assert (=> b!261246 (= lt!131798 lt!131783)))

(declare-fun lt!131799 () ListLongMap!3803)

(assert (=> b!261246 (= lt!131799 (getCurrentListMapNoExtraKeys!575 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131787 () (_ BitVec 64))

(assert (=> b!261246 (= lt!131787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131781 () (_ BitVec 64))

(assert (=> b!261246 (= lt!131781 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131790 () Unit!8064)

(assert (=> b!261246 (= lt!131790 (addApplyDifferent!235 lt!131799 lt!131787 (zeroValue!4648 thiss!1504) lt!131781))))

(assert (=> b!261246 (= (apply!259 (+!704 lt!131799 (tuple2!4901 lt!131787 (zeroValue!4648 thiss!1504))) lt!131781) (apply!259 lt!131799 lt!131781))))

(declare-fun lt!131796 () Unit!8064)

(assert (=> b!261246 (= lt!131796 lt!131790)))

(declare-fun lt!131782 () ListLongMap!3803)

(assert (=> b!261246 (= lt!131782 (getCurrentListMapNoExtraKeys!575 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131785 () (_ BitVec 64))

(assert (=> b!261246 (= lt!131785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131800 () (_ BitVec 64))

(assert (=> b!261246 (= lt!131800 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!261246 (= lt!131793 (addApplyDifferent!235 lt!131782 lt!131785 (minValue!4648 thiss!1504) lt!131800))))

(assert (=> b!261246 (= (apply!259 (+!704 lt!131782 (tuple2!4901 lt!131785 (minValue!4648 thiss!1504))) lt!131800) (apply!259 lt!131782 lt!131800))))

(declare-fun b!261247 () Bool)

(assert (=> b!261247 (= e!169276 e!169277)))

(declare-fun res!127636 () Bool)

(assert (=> b!261247 (=> (not res!127636) (not e!169277))))

(assert (=> b!261247 (= res!127636 (contains!1875 lt!131789 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!261247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))))

(assert (= (and d!62719 c!44463) b!261227))

(assert (= (and d!62719 (not c!44463)) b!261233))

(assert (= (and b!261233 c!44460) b!261235))

(assert (= (and b!261233 (not c!44460)) b!261232))

(assert (= (and b!261232 c!44465) b!261238))

(assert (= (and b!261232 (not c!44465)) b!261230))

(assert (= (or b!261238 b!261230) bm!24926))

(assert (= (or b!261235 bm!24926) bm!24923))

(assert (= (or b!261235 b!261238) bm!24925))

(assert (= (or b!261227 bm!24923) bm!24928))

(assert (= (or b!261227 bm!24925) bm!24924))

(assert (= (and d!62719 res!127628) b!261243))

(assert (= (and d!62719 c!44464) b!261246))

(assert (= (and d!62719 (not c!44464)) b!261228))

(assert (= (and d!62719 res!127634) b!261242))

(assert (= (and b!261242 res!127630) b!261241))

(assert (= (and b!261242 (not res!127631)) b!261247))

(assert (= (and b!261247 res!127636) b!261245))

(assert (= (and b!261242 res!127633) b!261237))

(assert (= (and b!261237 c!44462) b!261236))

(assert (= (and b!261237 (not c!44462)) b!261244))

(assert (= (and b!261236 res!127632) b!261234))

(assert (= (or b!261236 b!261244) bm!24927))

(assert (= (and b!261237 res!127635) b!261231))

(assert (= (and b!261231 c!44461) b!261239))

(assert (= (and b!261231 (not c!44461)) b!261240))

(assert (= (and b!261239 res!127629) b!261229))

(assert (= (or b!261239 b!261240) bm!24922))

(declare-fun b_lambda!8285 () Bool)

(assert (=> (not b_lambda!8285) (not b!261245)))

(assert (=> b!261245 t!8865))

(declare-fun b_and!13875 () Bool)

(assert (= b_and!13873 (and (=> t!8865 result!5407) b_and!13875)))

(declare-fun m!276779 () Bool)

(assert (=> b!261246 m!276779))

(declare-fun m!276781 () Bool)

(assert (=> b!261246 m!276781))

(declare-fun m!276783 () Bool)

(assert (=> b!261246 m!276783))

(declare-fun m!276785 () Bool)

(assert (=> b!261246 m!276785))

(declare-fun m!276787 () Bool)

(assert (=> b!261246 m!276787))

(declare-fun m!276789 () Bool)

(assert (=> b!261246 m!276789))

(declare-fun m!276791 () Bool)

(assert (=> b!261246 m!276791))

(declare-fun m!276793 () Bool)

(assert (=> b!261246 m!276793))

(declare-fun m!276795 () Bool)

(assert (=> b!261246 m!276795))

(assert (=> b!261246 m!276793))

(declare-fun m!276797 () Bool)

(assert (=> b!261246 m!276797))

(assert (=> b!261246 m!276781))

(assert (=> b!261246 m!276585))

(declare-fun m!276799 () Bool)

(assert (=> b!261246 m!276799))

(declare-fun m!276801 () Bool)

(assert (=> b!261246 m!276801))

(declare-fun m!276803 () Bool)

(assert (=> b!261246 m!276803))

(declare-fun m!276805 () Bool)

(assert (=> b!261246 m!276805))

(assert (=> b!261246 m!276803))

(declare-fun m!276807 () Bool)

(assert (=> b!261246 m!276807))

(declare-fun m!276809 () Bool)

(assert (=> b!261246 m!276809))

(assert (=> b!261246 m!276787))

(declare-fun m!276811 () Bool)

(assert (=> b!261227 m!276811))

(assert (=> d!62719 m!276089))

(assert (=> b!261247 m!276585))

(assert (=> b!261247 m!276585))

(declare-fun m!276813 () Bool)

(assert (=> b!261247 m!276813))

(assert (=> b!261243 m!276585))

(assert (=> b!261243 m!276585))

(assert (=> b!261243 m!276593))

(declare-fun m!276815 () Bool)

(assert (=> bm!24924 m!276815))

(assert (=> bm!24928 m!276791))

(declare-fun m!276817 () Bool)

(assert (=> b!261229 m!276817))

(assert (=> b!261241 m!276585))

(assert (=> b!261241 m!276585))

(assert (=> b!261241 m!276593))

(declare-fun m!276819 () Bool)

(assert (=> bm!24922 m!276819))

(assert (=> b!261245 m!276475))

(assert (=> b!261245 m!276341))

(assert (=> b!261245 m!276477))

(assert (=> b!261245 m!276341))

(assert (=> b!261245 m!276475))

(assert (=> b!261245 m!276585))

(assert (=> b!261245 m!276585))

(declare-fun m!276821 () Bool)

(assert (=> b!261245 m!276821))

(declare-fun m!276823 () Bool)

(assert (=> bm!24927 m!276823))

(declare-fun m!276825 () Bool)

(assert (=> b!261234 m!276825))

(assert (=> b!260999 d!62719))

(declare-fun d!62721 () Bool)

(declare-fun e!169282 () Bool)

(assert (=> d!62721 e!169282))

(declare-fun res!127637 () Bool)

(assert (=> d!62721 (=> res!127637 e!169282)))

(declare-fun lt!131803 () Bool)

(assert (=> d!62721 (= res!127637 (not lt!131803))))

(declare-fun lt!131802 () Bool)

(assert (=> d!62721 (= lt!131803 lt!131802)))

(declare-fun lt!131804 () Unit!8064)

(declare-fun e!169281 () Unit!8064)

(assert (=> d!62721 (= lt!131804 e!169281)))

(declare-fun c!44466 () Bool)

(assert (=> d!62721 (= c!44466 lt!131802)))

(assert (=> d!62721 (= lt!131802 (containsKey!307 (toList!1917 lt!131656) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62721 (= (contains!1875 lt!131656 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131803)))

(declare-fun b!261248 () Bool)

(declare-fun lt!131801 () Unit!8064)

(assert (=> b!261248 (= e!169281 lt!131801)))

(assert (=> b!261248 (= lt!131801 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131656) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261248 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131656) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261249 () Bool)

(declare-fun Unit!8082 () Unit!8064)

(assert (=> b!261249 (= e!169281 Unit!8082)))

(declare-fun b!261250 () Bool)

(assert (=> b!261250 (= e!169282 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131656) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62721 c!44466) b!261248))

(assert (= (and d!62721 (not c!44466)) b!261249))

(assert (= (and d!62721 (not res!127637)) b!261250))

(declare-fun m!276827 () Bool)

(assert (=> d!62721 m!276827))

(declare-fun m!276829 () Bool)

(assert (=> b!261248 m!276829))

(assert (=> b!261248 m!276489))

(assert (=> b!261248 m!276489))

(declare-fun m!276831 () Bool)

(assert (=> b!261248 m!276831))

(assert (=> b!261250 m!276489))

(assert (=> b!261250 m!276489))

(assert (=> b!261250 m!276831))

(assert (=> bm!24908 d!62721))

(declare-fun d!62723 () Bool)

(declare-fun c!44467 () Bool)

(assert (=> d!62723 (= c!44467 (and ((_ is Cons!3794) (toList!1917 lt!131622)) (= (_1!2461 (h!4459 (toList!1917 lt!131622))) (_1!2461 (tuple2!4901 key!932 v!346)))))))

(declare-fun e!169283 () Option!321)

(assert (=> d!62723 (= (getValueByKey!315 (toList!1917 lt!131622) (_1!2461 (tuple2!4901 key!932 v!346))) e!169283)))

(declare-fun b!261254 () Bool)

(declare-fun e!169284 () Option!321)

(assert (=> b!261254 (= e!169284 None!319)))

(declare-fun b!261252 () Bool)

(assert (=> b!261252 (= e!169283 e!169284)))

(declare-fun c!44468 () Bool)

(assert (=> b!261252 (= c!44468 (and ((_ is Cons!3794) (toList!1917 lt!131622)) (not (= (_1!2461 (h!4459 (toList!1917 lt!131622))) (_1!2461 (tuple2!4901 key!932 v!346))))))))

(declare-fun b!261253 () Bool)

(assert (=> b!261253 (= e!169284 (getValueByKey!315 (t!8860 (toList!1917 lt!131622)) (_1!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun b!261251 () Bool)

(assert (=> b!261251 (= e!169283 (Some!320 (_2!2461 (h!4459 (toList!1917 lt!131622)))))))

(assert (= (and d!62723 c!44467) b!261251))

(assert (= (and d!62723 (not c!44467)) b!261252))

(assert (= (and b!261252 c!44468) b!261253))

(assert (= (and b!261252 (not c!44468)) b!261254))

(declare-fun m!276833 () Bool)

(assert (=> b!261253 m!276833))

(assert (=> b!260953 d!62723))

(declare-fun d!62725 () Bool)

(assert (=> d!62725 (= (apply!259 (+!704 lt!131575 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504))) lt!131593) (get!3072 (getValueByKey!315 (toList!1917 (+!704 lt!131575 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504)))) lt!131593)))))

(declare-fun bs!9191 () Bool)

(assert (= bs!9191 d!62725))

(declare-fun m!276835 () Bool)

(assert (=> bs!9191 m!276835))

(assert (=> bs!9191 m!276835))

(declare-fun m!276837 () Bool)

(assert (=> bs!9191 m!276837))

(assert (=> b!260916 d!62725))

(declare-fun d!62727 () Bool)

(assert (=> d!62727 (= (apply!259 lt!131575 lt!131593) (get!3072 (getValueByKey!315 (toList!1917 lt!131575) lt!131593)))))

(declare-fun bs!9192 () Bool)

(assert (= bs!9192 d!62727))

(declare-fun m!276839 () Bool)

(assert (=> bs!9192 m!276839))

(assert (=> bs!9192 m!276839))

(declare-fun m!276841 () Bool)

(assert (=> bs!9192 m!276841))

(assert (=> b!260916 d!62727))

(declare-fun d!62729 () Bool)

(assert (=> d!62729 (= (apply!259 lt!131592 lt!131574) (get!3072 (getValueByKey!315 (toList!1917 lt!131592) lt!131574)))))

(declare-fun bs!9193 () Bool)

(assert (= bs!9193 d!62729))

(declare-fun m!276843 () Bool)

(assert (=> bs!9193 m!276843))

(assert (=> bs!9193 m!276843))

(declare-fun m!276845 () Bool)

(assert (=> bs!9193 m!276845))

(assert (=> b!260916 d!62729))

(assert (=> b!260916 d!62633))

(declare-fun d!62731 () Bool)

(declare-fun e!169285 () Bool)

(assert (=> d!62731 e!169285))

(declare-fun res!127638 () Bool)

(assert (=> d!62731 (=> (not res!127638) (not e!169285))))

(declare-fun lt!131807 () ListLongMap!3803)

(assert (=> d!62731 (= res!127638 (contains!1875 lt!131807 (_1!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131806 () List!3798)

(assert (=> d!62731 (= lt!131807 (ListLongMap!3804 lt!131806))))

(declare-fun lt!131808 () Unit!8064)

(declare-fun lt!131805 () Unit!8064)

(assert (=> d!62731 (= lt!131808 lt!131805)))

(assert (=> d!62731 (= (getValueByKey!315 lt!131806 (_1!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504)))))))

(assert (=> d!62731 (= lt!131805 (lemmaContainsTupThenGetReturnValue!174 lt!131806 (_1!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504)))))))

(assert (=> d!62731 (= lt!131806 (insertStrictlySorted!177 (toList!1917 lt!131575) (_1!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504)))))))

(assert (=> d!62731 (= (+!704 lt!131575 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504))) lt!131807)))

(declare-fun b!261255 () Bool)

(declare-fun res!127639 () Bool)

(assert (=> b!261255 (=> (not res!127639) (not e!169285))))

(assert (=> b!261255 (= res!127639 (= (getValueByKey!315 (toList!1917 lt!131807) (_1!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504))))))))

(declare-fun b!261256 () Bool)

(assert (=> b!261256 (= e!169285 (contains!1876 (toList!1917 lt!131807) (tuple2!4901 lt!131578 (minValue!4648 thiss!1504))))))

(assert (= (and d!62731 res!127638) b!261255))

(assert (= (and b!261255 res!127639) b!261256))

(declare-fun m!276847 () Bool)

(assert (=> d!62731 m!276847))

(declare-fun m!276849 () Bool)

(assert (=> d!62731 m!276849))

(declare-fun m!276851 () Bool)

(assert (=> d!62731 m!276851))

(declare-fun m!276853 () Bool)

(assert (=> d!62731 m!276853))

(declare-fun m!276855 () Bool)

(assert (=> b!261255 m!276855))

(declare-fun m!276857 () Bool)

(assert (=> b!261256 m!276857))

(assert (=> b!260916 d!62731))

(declare-fun d!62733 () Bool)

(declare-fun e!169286 () Bool)

(assert (=> d!62733 e!169286))

(declare-fun res!127640 () Bool)

(assert (=> d!62733 (=> (not res!127640) (not e!169286))))

(declare-fun lt!131811 () ListLongMap!3803)

(assert (=> d!62733 (= res!127640 (contains!1875 lt!131811 (_1!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504)))))))

(declare-fun lt!131810 () List!3798)

(assert (=> d!62733 (= lt!131811 (ListLongMap!3804 lt!131810))))

(declare-fun lt!131812 () Unit!8064)

(declare-fun lt!131809 () Unit!8064)

(assert (=> d!62733 (= lt!131812 lt!131809)))

(assert (=> d!62733 (= (getValueByKey!315 lt!131810 (_1!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62733 (= lt!131809 (lemmaContainsTupThenGetReturnValue!174 lt!131810 (_1!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62733 (= lt!131810 (insertStrictlySorted!177 (toList!1917 lt!131592) (_1!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62733 (= (+!704 lt!131592 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504))) lt!131811)))

(declare-fun b!261257 () Bool)

(declare-fun res!127641 () Bool)

(assert (=> b!261257 (=> (not res!127641) (not e!169286))))

(assert (=> b!261257 (= res!127641 (= (getValueByKey!315 (toList!1917 lt!131811) (_1!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504))))))))

(declare-fun b!261258 () Bool)

(assert (=> b!261258 (= e!169286 (contains!1876 (toList!1917 lt!131811) (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504))))))

(assert (= (and d!62733 res!127640) b!261257))

(assert (= (and b!261257 res!127641) b!261258))

(declare-fun m!276859 () Bool)

(assert (=> d!62733 m!276859))

(declare-fun m!276861 () Bool)

(assert (=> d!62733 m!276861))

(declare-fun m!276863 () Bool)

(assert (=> d!62733 m!276863))

(declare-fun m!276865 () Bool)

(assert (=> d!62733 m!276865))

(declare-fun m!276867 () Bool)

(assert (=> b!261257 m!276867))

(declare-fun m!276869 () Bool)

(assert (=> b!261258 m!276869))

(assert (=> b!260916 d!62733))

(declare-fun d!62735 () Bool)

(assert (=> d!62735 (= (apply!259 (+!704 lt!131575 (tuple2!4901 lt!131578 (minValue!4648 thiss!1504))) lt!131593) (apply!259 lt!131575 lt!131593))))

(declare-fun lt!131813 () Unit!8064)

(assert (=> d!62735 (= lt!131813 (choose!1285 lt!131575 lt!131578 (minValue!4648 thiss!1504) lt!131593))))

(declare-fun e!169287 () Bool)

(assert (=> d!62735 e!169287))

(declare-fun res!127642 () Bool)

(assert (=> d!62735 (=> (not res!127642) (not e!169287))))

(assert (=> d!62735 (= res!127642 (contains!1875 lt!131575 lt!131593))))

(assert (=> d!62735 (= (addApplyDifferent!235 lt!131575 lt!131578 (minValue!4648 thiss!1504) lt!131593) lt!131813)))

(declare-fun b!261259 () Bool)

(assert (=> b!261259 (= e!169287 (not (= lt!131593 lt!131578)))))

(assert (= (and d!62735 res!127642) b!261259))

(assert (=> d!62735 m!276295))

(declare-fun m!276871 () Bool)

(assert (=> d!62735 m!276871))

(assert (=> d!62735 m!276297))

(assert (=> d!62735 m!276299))

(declare-fun m!276873 () Bool)

(assert (=> d!62735 m!276873))

(assert (=> d!62735 m!276297))

(assert (=> b!260916 d!62735))

(declare-fun d!62737 () Bool)

(assert (=> d!62737 (contains!1875 (+!704 lt!131590 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504))) lt!131573)))

(declare-fun lt!131814 () Unit!8064)

(assert (=> d!62737 (= lt!131814 (choose!1284 lt!131590 lt!131577 (zeroValue!4648 thiss!1504) lt!131573))))

(assert (=> d!62737 (contains!1875 lt!131590 lt!131573)))

(assert (=> d!62737 (= (addStillContains!235 lt!131590 lt!131577 (zeroValue!4648 thiss!1504) lt!131573) lt!131814)))

(declare-fun bs!9194 () Bool)

(assert (= bs!9194 d!62737))

(assert (=> bs!9194 m!276309))

(assert (=> bs!9194 m!276309))

(assert (=> bs!9194 m!276311))

(declare-fun m!276875 () Bool)

(assert (=> bs!9194 m!276875))

(declare-fun m!276877 () Bool)

(assert (=> bs!9194 m!276877))

(assert (=> b!260916 d!62737))

(declare-fun d!62739 () Bool)

(assert (=> d!62739 (= (apply!259 (+!704 lt!131592 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504))) lt!131574) (apply!259 lt!131592 lt!131574))))

(declare-fun lt!131815 () Unit!8064)

(assert (=> d!62739 (= lt!131815 (choose!1285 lt!131592 lt!131580 (zeroValue!4648 thiss!1504) lt!131574))))

(declare-fun e!169288 () Bool)

(assert (=> d!62739 e!169288))

(declare-fun res!127643 () Bool)

(assert (=> d!62739 (=> (not res!127643) (not e!169288))))

(assert (=> d!62739 (= res!127643 (contains!1875 lt!131592 lt!131574))))

(assert (=> d!62739 (= (addApplyDifferent!235 lt!131592 lt!131580 (zeroValue!4648 thiss!1504) lt!131574) lt!131815)))

(declare-fun b!261260 () Bool)

(assert (=> b!261260 (= e!169288 (not (= lt!131574 lt!131580)))))

(assert (= (and d!62739 res!127643) b!261260))

(assert (=> d!62739 m!276325))

(declare-fun m!276879 () Bool)

(assert (=> d!62739 m!276879))

(assert (=> d!62739 m!276303))

(assert (=> d!62739 m!276305))

(declare-fun m!276881 () Bool)

(assert (=> d!62739 m!276881))

(assert (=> d!62739 m!276303))

(assert (=> b!260916 d!62739))

(declare-fun d!62741 () Bool)

(assert (=> d!62741 (= (apply!259 (+!704 lt!131579 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504))) lt!131588) (apply!259 lt!131579 lt!131588))))

(declare-fun lt!131816 () Unit!8064)

(assert (=> d!62741 (= lt!131816 (choose!1285 lt!131579 lt!131572 (minValue!4648 thiss!1504) lt!131588))))

(declare-fun e!169289 () Bool)

(assert (=> d!62741 e!169289))

(declare-fun res!127644 () Bool)

(assert (=> d!62741 (=> (not res!127644) (not e!169289))))

(assert (=> d!62741 (= res!127644 (contains!1875 lt!131579 lt!131588))))

(assert (=> d!62741 (= (addApplyDifferent!235 lt!131579 lt!131572 (minValue!4648 thiss!1504) lt!131588) lt!131816)))

(declare-fun b!261261 () Bool)

(assert (=> b!261261 (= e!169289 (not (= lt!131588 lt!131572)))))

(assert (= (and d!62741 res!127644) b!261261))

(assert (=> d!62741 m!276313))

(declare-fun m!276883 () Bool)

(assert (=> d!62741 m!276883))

(assert (=> d!62741 m!276319))

(assert (=> d!62741 m!276323))

(declare-fun m!276885 () Bool)

(assert (=> d!62741 m!276885))

(assert (=> d!62741 m!276319))

(assert (=> b!260916 d!62741))

(declare-fun d!62743 () Bool)

(assert (=> d!62743 (= (apply!259 (+!704 lt!131579 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504))) lt!131588) (get!3072 (getValueByKey!315 (toList!1917 (+!704 lt!131579 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504)))) lt!131588)))))

(declare-fun bs!9195 () Bool)

(assert (= bs!9195 d!62743))

(declare-fun m!276887 () Bool)

(assert (=> bs!9195 m!276887))

(assert (=> bs!9195 m!276887))

(declare-fun m!276889 () Bool)

(assert (=> bs!9195 m!276889))

(assert (=> b!260916 d!62743))

(declare-fun d!62745 () Bool)

(assert (=> d!62745 (= (apply!259 lt!131579 lt!131588) (get!3072 (getValueByKey!315 (toList!1917 lt!131579) lt!131588)))))

(declare-fun bs!9196 () Bool)

(assert (= bs!9196 d!62745))

(declare-fun m!276891 () Bool)

(assert (=> bs!9196 m!276891))

(assert (=> bs!9196 m!276891))

(declare-fun m!276893 () Bool)

(assert (=> bs!9196 m!276893))

(assert (=> b!260916 d!62745))

(declare-fun d!62747 () Bool)

(declare-fun e!169290 () Bool)

(assert (=> d!62747 e!169290))

(declare-fun res!127645 () Bool)

(assert (=> d!62747 (=> (not res!127645) (not e!169290))))

(declare-fun lt!131819 () ListLongMap!3803)

(assert (=> d!62747 (= res!127645 (contains!1875 lt!131819 (_1!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131818 () List!3798)

(assert (=> d!62747 (= lt!131819 (ListLongMap!3804 lt!131818))))

(declare-fun lt!131820 () Unit!8064)

(declare-fun lt!131817 () Unit!8064)

(assert (=> d!62747 (= lt!131820 lt!131817)))

(assert (=> d!62747 (= (getValueByKey!315 lt!131818 (_1!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504)))))))

(assert (=> d!62747 (= lt!131817 (lemmaContainsTupThenGetReturnValue!174 lt!131818 (_1!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504)))))))

(assert (=> d!62747 (= lt!131818 (insertStrictlySorted!177 (toList!1917 lt!131579) (_1!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504)))))))

(assert (=> d!62747 (= (+!704 lt!131579 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504))) lt!131819)))

(declare-fun b!261262 () Bool)

(declare-fun res!127646 () Bool)

(assert (=> b!261262 (=> (not res!127646) (not e!169290))))

(assert (=> b!261262 (= res!127646 (= (getValueByKey!315 (toList!1917 lt!131819) (_1!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131572 (minValue!4648 thiss!1504))))))))

(declare-fun b!261263 () Bool)

(assert (=> b!261263 (= e!169290 (contains!1876 (toList!1917 lt!131819) (tuple2!4901 lt!131572 (minValue!4648 thiss!1504))))))

(assert (= (and d!62747 res!127645) b!261262))

(assert (= (and b!261262 res!127646) b!261263))

(declare-fun m!276895 () Bool)

(assert (=> d!62747 m!276895))

(declare-fun m!276897 () Bool)

(assert (=> d!62747 m!276897))

(declare-fun m!276899 () Bool)

(assert (=> d!62747 m!276899))

(declare-fun m!276901 () Bool)

(assert (=> d!62747 m!276901))

(declare-fun m!276903 () Bool)

(assert (=> b!261262 m!276903))

(declare-fun m!276905 () Bool)

(assert (=> b!261263 m!276905))

(assert (=> b!260916 d!62747))

(declare-fun d!62749 () Bool)

(assert (=> d!62749 (= (apply!259 (+!704 lt!131592 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504))) lt!131574) (get!3072 (getValueByKey!315 (toList!1917 (+!704 lt!131592 (tuple2!4901 lt!131580 (zeroValue!4648 thiss!1504)))) lt!131574)))))

(declare-fun bs!9197 () Bool)

(assert (= bs!9197 d!62749))

(declare-fun m!276907 () Bool)

(assert (=> bs!9197 m!276907))

(assert (=> bs!9197 m!276907))

(declare-fun m!276909 () Bool)

(assert (=> bs!9197 m!276909))

(assert (=> b!260916 d!62749))

(declare-fun d!62751 () Bool)

(declare-fun e!169291 () Bool)

(assert (=> d!62751 e!169291))

(declare-fun res!127647 () Bool)

(assert (=> d!62751 (=> (not res!127647) (not e!169291))))

(declare-fun lt!131823 () ListLongMap!3803)

(assert (=> d!62751 (= res!127647 (contains!1875 lt!131823 (_1!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))))))

(declare-fun lt!131822 () List!3798)

(assert (=> d!62751 (= lt!131823 (ListLongMap!3804 lt!131822))))

(declare-fun lt!131824 () Unit!8064)

(declare-fun lt!131821 () Unit!8064)

(assert (=> d!62751 (= lt!131824 lt!131821)))

(assert (=> d!62751 (= (getValueByKey!315 lt!131822 (_1!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62751 (= lt!131821 (lemmaContainsTupThenGetReturnValue!174 lt!131822 (_1!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62751 (= lt!131822 (insertStrictlySorted!177 (toList!1917 lt!131590) (_1!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62751 (= (+!704 lt!131590 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504))) lt!131823)))

(declare-fun b!261264 () Bool)

(declare-fun res!127648 () Bool)

(assert (=> b!261264 (=> (not res!127648) (not e!169291))))

(assert (=> b!261264 (= res!127648 (= (getValueByKey!315 (toList!1917 lt!131823) (_1!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504))))))))

(declare-fun b!261265 () Bool)

(assert (=> b!261265 (= e!169291 (contains!1876 (toList!1917 lt!131823) (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504))))))

(assert (= (and d!62751 res!127647) b!261264))

(assert (= (and b!261264 res!127648) b!261265))

(declare-fun m!276911 () Bool)

(assert (=> d!62751 m!276911))

(declare-fun m!276913 () Bool)

(assert (=> d!62751 m!276913))

(declare-fun m!276915 () Bool)

(assert (=> d!62751 m!276915))

(declare-fun m!276917 () Bool)

(assert (=> d!62751 m!276917))

(declare-fun m!276919 () Bool)

(assert (=> b!261264 m!276919))

(declare-fun m!276921 () Bool)

(assert (=> b!261265 m!276921))

(assert (=> b!260916 d!62751))

(declare-fun d!62753 () Bool)

(declare-fun e!169293 () Bool)

(assert (=> d!62753 e!169293))

(declare-fun res!127649 () Bool)

(assert (=> d!62753 (=> res!127649 e!169293)))

(declare-fun lt!131827 () Bool)

(assert (=> d!62753 (= res!127649 (not lt!131827))))

(declare-fun lt!131826 () Bool)

(assert (=> d!62753 (= lt!131827 lt!131826)))

(declare-fun lt!131828 () Unit!8064)

(declare-fun e!169292 () Unit!8064)

(assert (=> d!62753 (= lt!131828 e!169292)))

(declare-fun c!44469 () Bool)

(assert (=> d!62753 (= c!44469 lt!131826)))

(assert (=> d!62753 (= lt!131826 (containsKey!307 (toList!1917 (+!704 lt!131590 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))) lt!131573))))

(assert (=> d!62753 (= (contains!1875 (+!704 lt!131590 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504))) lt!131573) lt!131827)))

(declare-fun b!261266 () Bool)

(declare-fun lt!131825 () Unit!8064)

(assert (=> b!261266 (= e!169292 lt!131825)))

(assert (=> b!261266 (= lt!131825 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 (+!704 lt!131590 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))) lt!131573))))

(assert (=> b!261266 (isDefined!257 (getValueByKey!315 (toList!1917 (+!704 lt!131590 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))) lt!131573))))

(declare-fun b!261267 () Bool)

(declare-fun Unit!8083 () Unit!8064)

(assert (=> b!261267 (= e!169292 Unit!8083)))

(declare-fun b!261268 () Bool)

(assert (=> b!261268 (= e!169293 (isDefined!257 (getValueByKey!315 (toList!1917 (+!704 lt!131590 (tuple2!4901 lt!131577 (zeroValue!4648 thiss!1504)))) lt!131573)))))

(assert (= (and d!62753 c!44469) b!261266))

(assert (= (and d!62753 (not c!44469)) b!261267))

(assert (= (and d!62753 (not res!127649)) b!261268))

(declare-fun m!276923 () Bool)

(assert (=> d!62753 m!276923))

(declare-fun m!276925 () Bool)

(assert (=> b!261266 m!276925))

(declare-fun m!276927 () Bool)

(assert (=> b!261266 m!276927))

(assert (=> b!261266 m!276927))

(declare-fun m!276929 () Bool)

(assert (=> b!261266 m!276929))

(assert (=> b!261268 m!276927))

(assert (=> b!261268 m!276927))

(assert (=> b!261268 m!276929))

(assert (=> b!260916 d!62753))

(declare-fun b!261269 () Bool)

(declare-fun e!169297 () Bool)

(declare-fun call!24932 () Bool)

(assert (=> b!261269 (= e!169297 call!24932)))

(declare-fun bm!24929 () Bool)

(declare-fun c!44470 () Bool)

(assert (=> bm!24929 (= call!24932 (arrayNoDuplicates!0 (_keys!6990 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44470 (Cons!3795 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000) Nil!3796) Nil!3796)))))

(declare-fun b!261270 () Bool)

(assert (=> b!261270 (= e!169297 call!24932)))

(declare-fun b!261271 () Bool)

(declare-fun e!169296 () Bool)

(declare-fun e!169294 () Bool)

(assert (=> b!261271 (= e!169296 e!169294)))

(declare-fun res!127652 () Bool)

(assert (=> b!261271 (=> (not res!127652) (not e!169294))))

(declare-fun e!169295 () Bool)

(assert (=> b!261271 (= res!127652 (not e!169295))))

(declare-fun res!127651 () Bool)

(assert (=> b!261271 (=> (not res!127651) (not e!169295))))

(assert (=> b!261271 (= res!127651 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261272 () Bool)

(assert (=> b!261272 (= e!169294 e!169297)))

(assert (=> b!261272 (= c!44470 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62755 () Bool)

(declare-fun res!127650 () Bool)

(assert (=> d!62755 (=> res!127650 e!169296)))

(assert (=> d!62755 (= res!127650 (bvsge #b00000000000000000000000000000000 (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62755 (= (arrayNoDuplicates!0 (_keys!6990 thiss!1504) #b00000000000000000000000000000000 Nil!3796) e!169296)))

(declare-fun b!261273 () Bool)

(assert (=> b!261273 (= e!169295 (contains!1877 Nil!3796 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62755 (not res!127650)) b!261271))

(assert (= (and b!261271 res!127651) b!261273))

(assert (= (and b!261271 res!127652) b!261272))

(assert (= (and b!261272 c!44470) b!261269))

(assert (= (and b!261272 (not c!44470)) b!261270))

(assert (= (or b!261269 b!261270) bm!24929))

(assert (=> bm!24929 m!276265))

(declare-fun m!276931 () Bool)

(assert (=> bm!24929 m!276931))

(assert (=> b!261271 m!276265))

(assert (=> b!261271 m!276265))

(assert (=> b!261271 m!276331))

(assert (=> b!261272 m!276265))

(assert (=> b!261272 m!276265))

(assert (=> b!261272 m!276331))

(assert (=> b!261273 m!276265))

(assert (=> b!261273 m!276265))

(declare-fun m!276933 () Bool)

(assert (=> b!261273 m!276933))

(assert (=> b!260845 d!62755))

(assert (=> b!261003 d!62657))

(declare-fun d!62757 () Bool)

(assert (=> d!62757 (= (apply!259 lt!131656 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)) (get!3072 (getValueByKey!315 (toList!1917 lt!131656) (select (arr!5962 lt!131407) #b00000000000000000000000000000000))))))

(declare-fun bs!9198 () Bool)

(assert (= bs!9198 d!62757))

(assert (=> bs!9198 m!276365))

(assert (=> bs!9198 m!276501))

(assert (=> bs!9198 m!276501))

(declare-fun m!276935 () Bool)

(assert (=> bs!9198 m!276935))

(assert (=> b!261034 d!62757))

(declare-fun c!44473 () Bool)

(declare-fun d!62759 () Bool)

(assert (=> d!62759 (= c!44473 ((_ is ValueCellFull!2969) (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!169300 () V!8481)

(assert (=> d!62759 (= (get!3071 (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!169300)))

(declare-fun b!261278 () Bool)

(declare-fun get!3073 (ValueCell!2969 V!8481) V!8481)

(assert (=> b!261278 (= e!169300 (get!3073 (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261279 () Bool)

(declare-fun get!3074 (ValueCell!2969 V!8481) V!8481)

(assert (=> b!261279 (= e!169300 (get!3074 (select (arr!5961 (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62759 c!44473) b!261278))

(assert (= (and d!62759 (not c!44473)) b!261279))

(assert (=> b!261278 m!276475))

(assert (=> b!261278 m!276341))

(declare-fun m!276937 () Bool)

(assert (=> b!261278 m!276937))

(assert (=> b!261279 m!276475))

(assert (=> b!261279 m!276341))

(declare-fun m!276939 () Bool)

(assert (=> b!261279 m!276939))

(assert (=> b!261034 d!62759))

(declare-fun d!62761 () Bool)

(declare-fun e!169302 () Bool)

(assert (=> d!62761 e!169302))

(declare-fun res!127653 () Bool)

(assert (=> d!62761 (=> res!127653 e!169302)))

(declare-fun lt!131831 () Bool)

(assert (=> d!62761 (= res!127653 (not lt!131831))))

(declare-fun lt!131830 () Bool)

(assert (=> d!62761 (= lt!131831 lt!131830)))

(declare-fun lt!131832 () Unit!8064)

(declare-fun e!169301 () Unit!8064)

(assert (=> d!62761 (= lt!131832 e!169301)))

(declare-fun c!44474 () Bool)

(assert (=> d!62761 (= c!44474 lt!131830)))

(assert (=> d!62761 (= lt!131830 (containsKey!307 (toList!1917 lt!131582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62761 (= (contains!1875 lt!131582 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131831)))

(declare-fun b!261280 () Bool)

(declare-fun lt!131829 () Unit!8064)

(assert (=> b!261280 (= e!169301 lt!131829)))

(assert (=> b!261280 (= lt!131829 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261280 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131582) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261281 () Bool)

(declare-fun Unit!8084 () Unit!8064)

(assert (=> b!261281 (= e!169301 Unit!8084)))

(declare-fun b!261282 () Bool)

(assert (=> b!261282 (= e!169302 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131582) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62761 c!44474) b!261280))

(assert (= (and d!62761 (not c!44474)) b!261281))

(assert (= (and d!62761 (not res!127653)) b!261282))

(declare-fun m!276941 () Bool)

(assert (=> d!62761 m!276941))

(declare-fun m!276943 () Bool)

(assert (=> b!261280 m!276943))

(assert (=> b!261280 m!276505))

(assert (=> b!261280 m!276505))

(declare-fun m!276945 () Bool)

(assert (=> b!261280 m!276945))

(assert (=> b!261282 m!276505))

(assert (=> b!261282 m!276505))

(assert (=> b!261282 m!276945))

(assert (=> bm!24891 d!62761))

(declare-fun d!62763 () Bool)

(assert (=> d!62763 (= (+!704 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) (tuple2!4901 key!932 v!346)) (getCurrentListMap!1426 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (array!12598 (store (arr!5961 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6312 (_values!4790 thiss!1504))) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62763 true))

(declare-fun _$3!64 () Unit!8064)

(assert (=> d!62763 (= (choose!1282 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) index!297 key!932 v!346 (defaultEntry!4807 thiss!1504)) _$3!64)))

(declare-fun bs!9199 () Bool)

(assert (= bs!9199 d!62763))

(assert (=> bs!9199 m!276097))

(assert (=> bs!9199 m!276129))

(assert (=> bs!9199 m!276421))

(assert (=> bs!9199 m!276107))

(assert (=> bs!9199 m!276419))

(assert (=> bs!9199 m!276129))

(assert (=> d!62597 d!62763))

(assert (=> d!62597 d!62603))

(assert (=> b!260843 d!62593))

(declare-fun b!261283 () Bool)

(declare-fun e!169303 () (_ BitVec 32))

(declare-fun call!24933 () (_ BitVec 32))

(assert (=> b!261283 (= e!169303 call!24933)))

(declare-fun bm!24930 () Bool)

(assert (=> bm!24930 (= call!24933 (arrayCountValidKeys!0 (_keys!6990 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun d!62765 () Bool)

(declare-fun lt!131833 () (_ BitVec 32))

(assert (=> d!62765 (and (bvsge lt!131833 #b00000000000000000000000000000000) (bvsle lt!131833 (bvsub (size!6313 (_keys!6990 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!169304 () (_ BitVec 32))

(assert (=> d!62765 (= lt!131833 e!169304)))

(declare-fun c!44475 () Bool)

(assert (=> d!62765 (= c!44475 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62765 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6313 (_keys!6990 thiss!1504)) (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62765 (= (arrayCountValidKeys!0 (_keys!6990 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))) lt!131833)))

(declare-fun b!261284 () Bool)

(assert (=> b!261284 (= e!169304 #b00000000000000000000000000000000)))

(declare-fun b!261285 () Bool)

(assert (=> b!261285 (= e!169303 (bvadd #b00000000000000000000000000000001 call!24933))))

(declare-fun b!261286 () Bool)

(assert (=> b!261286 (= e!169304 e!169303)))

(declare-fun c!44476 () Bool)

(assert (=> b!261286 (= c!44476 (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62765 c!44475) b!261284))

(assert (= (and d!62765 (not c!44475)) b!261286))

(assert (= (and b!261286 c!44476) b!261285))

(assert (= (and b!261286 (not c!44476)) b!261283))

(assert (= (or b!261285 b!261283) bm!24930))

(declare-fun m!276947 () Bool)

(assert (=> bm!24930 m!276947))

(assert (=> b!261286 m!276649))

(assert (=> b!261286 m!276649))

(declare-fun m!276949 () Bool)

(assert (=> b!261286 m!276949))

(assert (=> bm!24895 d!62765))

(declare-fun d!62767 () Bool)

(assert (=> d!62767 (= (apply!259 lt!131582 (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000)) (get!3072 (getValueByKey!315 (toList!1917 lt!131582) (select (arr!5962 (_keys!6990 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9200 () Bool)

(assert (= bs!9200 d!62767))

(assert (=> bs!9200 m!276265))

(assert (=> bs!9200 m!276543))

(assert (=> bs!9200 m!276543))

(declare-fun m!276951 () Bool)

(assert (=> bs!9200 m!276951))

(assert (=> b!260915 d!62767))

(declare-fun d!62769 () Bool)

(declare-fun c!44477 () Bool)

(assert (=> d!62769 (= c!44477 ((_ is ValueCellFull!2969) (select (arr!5961 (_values!4790 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!169305 () V!8481)

(assert (=> d!62769 (= (get!3071 (select (arr!5961 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!169305)))

(declare-fun b!261287 () Bool)

(assert (=> b!261287 (= e!169305 (get!3073 (select (arr!5961 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261288 () Bool)

(assert (=> b!261288 (= e!169305 (get!3074 (select (arr!5961 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62769 c!44477) b!261287))

(assert (= (and d!62769 (not c!44477)) b!261288))

(assert (=> b!261287 m!276339))

(assert (=> b!261287 m!276341))

(declare-fun m!276953 () Bool)

(assert (=> b!261287 m!276953))

(assert (=> b!261288 m!276339))

(assert (=> b!261288 m!276341))

(declare-fun m!276955 () Bool)

(assert (=> b!261288 m!276955))

(assert (=> b!260915 d!62769))

(declare-fun d!62771 () Bool)

(declare-fun e!169306 () Bool)

(assert (=> d!62771 e!169306))

(declare-fun res!127654 () Bool)

(assert (=> d!62771 (=> (not res!127654) (not e!169306))))

(declare-fun lt!131836 () ListLongMap!3803)

(assert (=> d!62771 (= res!127654 (contains!1875 lt!131836 (_1!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(declare-fun lt!131835 () List!3798)

(assert (=> d!62771 (= lt!131836 (ListLongMap!3804 lt!131835))))

(declare-fun lt!131837 () Unit!8064)

(declare-fun lt!131834 () Unit!8064)

(assert (=> d!62771 (= lt!131837 lt!131834)))

(assert (=> d!62771 (= (getValueByKey!315 lt!131835 (_1!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))) (Some!320 (_2!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62771 (= lt!131834 (lemmaContainsTupThenGetReturnValue!174 lt!131835 (_1!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (_2!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62771 (= lt!131835 (insertStrictlySorted!177 (toList!1917 (ite c!44409 call!24910 (ite c!44406 call!24909 call!24906))) (_1!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (_2!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62771 (= (+!704 (ite c!44409 call!24910 (ite c!44406 call!24909 call!24906)) (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) lt!131836)))

(declare-fun b!261289 () Bool)

(declare-fun res!127655 () Bool)

(assert (=> b!261289 (=> (not res!127655) (not e!169306))))

(assert (=> b!261289 (= res!127655 (= (getValueByKey!315 (toList!1917 lt!131836) (_1!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))) (Some!320 (_2!2461 (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))))

(declare-fun b!261290 () Bool)

(assert (=> b!261290 (= e!169306 (contains!1876 (toList!1917 lt!131836) (ite (or c!44409 c!44406) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (= (and d!62771 res!127654) b!261289))

(assert (= (and b!261289 res!127655) b!261290))

(declare-fun m!276957 () Bool)

(assert (=> d!62771 m!276957))

(declare-fun m!276959 () Bool)

(assert (=> d!62771 m!276959))

(declare-fun m!276961 () Bool)

(assert (=> d!62771 m!276961))

(declare-fun m!276963 () Bool)

(assert (=> d!62771 m!276963))

(declare-fun m!276965 () Bool)

(assert (=> b!261289 m!276965))

(declare-fun m!276967 () Bool)

(assert (=> b!261290 m!276967))

(assert (=> bm!24905 d!62771))

(declare-fun b!261291 () Bool)

(declare-fun e!169307 () (_ BitVec 32))

(declare-fun call!24934 () (_ BitVec 32))

(assert (=> b!261291 (= e!169307 call!24934)))

(declare-fun bm!24931 () Bool)

(assert (=> bm!24931 (= call!24934 (arrayCountValidKeys!0 lt!131407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun d!62773 () Bool)

(declare-fun lt!131838 () (_ BitVec 32))

(assert (=> d!62773 (and (bvsge lt!131838 #b00000000000000000000000000000000) (bvsle lt!131838 (bvsub (size!6313 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!169308 () (_ BitVec 32))

(assert (=> d!62773 (= lt!131838 e!169308)))

(declare-fun c!44478 () Bool)

(assert (=> d!62773 (= c!44478 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> d!62773 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6313 (_keys!6990 thiss!1504)) (size!6313 lt!131407)))))

(assert (=> d!62773 (= (arrayCountValidKeys!0 lt!131407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 (_keys!6990 thiss!1504))) lt!131838)))

(declare-fun b!261292 () Bool)

(assert (=> b!261292 (= e!169308 #b00000000000000000000000000000000)))

(declare-fun b!261293 () Bool)

(assert (=> b!261293 (= e!169307 (bvadd #b00000000000000000000000000000001 call!24934))))

(declare-fun b!261294 () Bool)

(assert (=> b!261294 (= e!169308 e!169307)))

(declare-fun c!44479 () Bool)

(assert (=> b!261294 (= c!44479 (validKeyInArray!0 (select (arr!5962 lt!131407) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62773 c!44478) b!261292))

(assert (= (and d!62773 (not c!44478)) b!261294))

(assert (= (and b!261294 c!44479) b!261293))

(assert (= (and b!261294 (not c!44479)) b!261291))

(assert (= (or b!261293 b!261291) bm!24931))

(declare-fun m!276969 () Bool)

(assert (=> bm!24931 m!276969))

(assert (=> b!261294 m!276547))

(assert (=> b!261294 m!276547))

(assert (=> b!261294 m!276635))

(assert (=> bm!24899 d!62773))

(declare-fun d!62775 () Bool)

(declare-fun e!169309 () Bool)

(assert (=> d!62775 e!169309))

(declare-fun res!127656 () Bool)

(assert (=> d!62775 (=> (not res!127656) (not e!169309))))

(declare-fun lt!131841 () ListLongMap!3803)

(assert (=> d!62775 (= res!127656 (contains!1875 lt!131841 (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131840 () List!3798)

(assert (=> d!62775 (= lt!131841 (ListLongMap!3804 lt!131840))))

(declare-fun lt!131842 () Unit!8064)

(declare-fun lt!131839 () Unit!8064)

(assert (=> d!62775 (= lt!131842 lt!131839)))

(assert (=> d!62775 (= (getValueByKey!315 lt!131840 (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62775 (= lt!131839 (lemmaContainsTupThenGetReturnValue!174 lt!131840 (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62775 (= lt!131840 (insertStrictlySorted!177 (toList!1917 call!24895) (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) (_2!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62775 (= (+!704 call!24895 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) lt!131841)))

(declare-fun b!261295 () Bool)

(declare-fun res!127657 () Bool)

(assert (=> b!261295 (=> (not res!127657) (not e!169309))))

(assert (=> b!261295 (= res!127657 (= (getValueByKey!315 (toList!1917 lt!131841) (_1!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (Some!320 (_2!2461 (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(declare-fun b!261296 () Bool)

(assert (=> b!261296 (= e!169309 (contains!1876 (toList!1917 lt!131841) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(assert (= (and d!62775 res!127656) b!261295))

(assert (= (and b!261295 res!127657) b!261296))

(declare-fun m!276971 () Bool)

(assert (=> d!62775 m!276971))

(declare-fun m!276973 () Bool)

(assert (=> d!62775 m!276973))

(declare-fun m!276975 () Bool)

(assert (=> d!62775 m!276975))

(declare-fun m!276977 () Bool)

(assert (=> d!62775 m!276977))

(declare-fun m!276979 () Bool)

(assert (=> b!261295 m!276979))

(declare-fun m!276981 () Bool)

(assert (=> b!261296 m!276981))

(assert (=> b!260897 d!62775))

(declare-fun b!261297 () Bool)

(declare-fun e!169313 () Bool)

(declare-fun call!24935 () Bool)

(assert (=> b!261297 (= e!169313 call!24935)))

(declare-fun c!44480 () Bool)

(declare-fun bm!24932 () Bool)

(assert (=> bm!24932 (= call!24935 (arrayNoDuplicates!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44480 (Cons!3795 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000) Nil!3796) Nil!3796)))))

(declare-fun b!261298 () Bool)

(assert (=> b!261298 (= e!169313 call!24935)))

(declare-fun b!261299 () Bool)

(declare-fun e!169312 () Bool)

(declare-fun e!169310 () Bool)

(assert (=> b!261299 (= e!169312 e!169310)))

(declare-fun res!127660 () Bool)

(assert (=> b!261299 (=> (not res!127660) (not e!169310))))

(declare-fun e!169311 () Bool)

(assert (=> b!261299 (= res!127660 (not e!169311))))

(declare-fun res!127659 () Bool)

(assert (=> b!261299 (=> (not res!127659) (not e!169311))))

(assert (=> b!261299 (= res!127659 (validKeyInArray!0 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261300 () Bool)

(assert (=> b!261300 (= e!169310 e!169313)))

(assert (=> b!261300 (= c!44480 (validKeyInArray!0 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62777 () Bool)

(declare-fun res!127658 () Bool)

(assert (=> d!62777 (=> res!127658 e!169312)))

(assert (=> d!62777 (= res!127658 (bvsge #b00000000000000000000000000000000 (size!6313 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))))))))

(assert (=> d!62777 (= (arrayNoDuplicates!0 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504))) #b00000000000000000000000000000000 Nil!3796) e!169312)))

(declare-fun b!261301 () Bool)

(assert (=> b!261301 (= e!169311 (contains!1877 Nil!3796 (select (arr!5962 (array!12600 (store (arr!5962 (_keys!6990 thiss!1504)) index!297 key!932) (size!6313 (_keys!6990 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!62777 (not res!127658)) b!261299))

(assert (= (and b!261299 res!127659) b!261301))

(assert (= (and b!261299 res!127660) b!261300))

(assert (= (and b!261300 c!44480) b!261297))

(assert (= (and b!261300 (not c!44480)) b!261298))

(assert (= (or b!261297 b!261298) bm!24932))

(assert (=> bm!24932 m!276585))

(declare-fun m!276983 () Bool)

(assert (=> bm!24932 m!276983))

(assert (=> b!261299 m!276585))

(assert (=> b!261299 m!276585))

(assert (=> b!261299 m!276593))

(assert (=> b!261300 m!276585))

(assert (=> b!261300 m!276585))

(assert (=> b!261300 m!276593))

(assert (=> b!261301 m!276585))

(assert (=> b!261301 m!276585))

(declare-fun m!276985 () Bool)

(assert (=> b!261301 m!276985))

(assert (=> b!260948 d!62777))

(declare-fun d!62779 () Bool)

(declare-fun e!169314 () Bool)

(assert (=> d!62779 e!169314))

(declare-fun res!127661 () Bool)

(assert (=> d!62779 (=> (not res!127661) (not e!169314))))

(declare-fun lt!131845 () ListLongMap!3803)

(assert (=> d!62779 (= res!127661 (contains!1875 lt!131845 (_1!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(declare-fun lt!131844 () List!3798)

(assert (=> d!62779 (= lt!131845 (ListLongMap!3804 lt!131844))))

(declare-fun lt!131846 () Unit!8064)

(declare-fun lt!131843 () Unit!8064)

(assert (=> d!62779 (= lt!131846 lt!131843)))

(assert (=> d!62779 (= (getValueByKey!315 lt!131844 (_1!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))) (Some!320 (_2!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62779 (= lt!131843 (lemmaContainsTupThenGetReturnValue!174 lt!131844 (_1!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (_2!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62779 (= lt!131844 (insertStrictlySorted!177 (toList!1917 (ite c!44380 call!24893 (ite c!44377 call!24892 call!24889))) (_1!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (_2!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62779 (= (+!704 (ite c!44380 call!24893 (ite c!44377 call!24892 call!24889)) (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) lt!131845)))

(declare-fun b!261302 () Bool)

(declare-fun res!127662 () Bool)

(assert (=> b!261302 (=> (not res!127662) (not e!169314))))

(assert (=> b!261302 (= res!127662 (= (getValueByKey!315 (toList!1917 lt!131845) (_1!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))) (Some!320 (_2!2461 (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))))

(declare-fun b!261303 () Bool)

(assert (=> b!261303 (= e!169314 (contains!1876 (toList!1917 lt!131845) (ite (or c!44380 c!44377) (tuple2!4901 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4901 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (= (and d!62779 res!127661) b!261302))

(assert (= (and b!261302 res!127662) b!261303))

(declare-fun m!276987 () Bool)

(assert (=> d!62779 m!276987))

(declare-fun m!276989 () Bool)

(assert (=> d!62779 m!276989))

(declare-fun m!276991 () Bool)

(assert (=> d!62779 m!276991))

(declare-fun m!276993 () Bool)

(assert (=> d!62779 m!276993))

(declare-fun m!276995 () Bool)

(assert (=> b!261302 m!276995))

(declare-fun m!276997 () Bool)

(assert (=> b!261303 m!276997))

(assert (=> bm!24888 d!62779))

(assert (=> b!261030 d!62657))

(declare-fun d!62781 () Bool)

(declare-fun e!169316 () Bool)

(assert (=> d!62781 e!169316))

(declare-fun res!127663 () Bool)

(assert (=> d!62781 (=> res!127663 e!169316)))

(declare-fun lt!131849 () Bool)

(assert (=> d!62781 (= res!127663 (not lt!131849))))

(declare-fun lt!131848 () Bool)

(assert (=> d!62781 (= lt!131849 lt!131848)))

(declare-fun lt!131850 () Unit!8064)

(declare-fun e!169315 () Unit!8064)

(assert (=> d!62781 (= lt!131850 e!169315)))

(declare-fun c!44481 () Bool)

(assert (=> d!62781 (= c!44481 lt!131848)))

(assert (=> d!62781 (= lt!131848 (containsKey!307 (toList!1917 lt!131622) (_1!2461 (tuple2!4901 key!932 v!346))))))

(assert (=> d!62781 (= (contains!1875 lt!131622 (_1!2461 (tuple2!4901 key!932 v!346))) lt!131849)))

(declare-fun b!261304 () Bool)

(declare-fun lt!131847 () Unit!8064)

(assert (=> b!261304 (= e!169315 lt!131847)))

(assert (=> b!261304 (= lt!131847 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 lt!131622) (_1!2461 (tuple2!4901 key!932 v!346))))))

(assert (=> b!261304 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131622) (_1!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun b!261305 () Bool)

(declare-fun Unit!8085 () Unit!8064)

(assert (=> b!261305 (= e!169315 Unit!8085)))

(declare-fun b!261306 () Bool)

(assert (=> b!261306 (= e!169316 (isDefined!257 (getValueByKey!315 (toList!1917 lt!131622) (_1!2461 (tuple2!4901 key!932 v!346)))))))

(assert (= (and d!62781 c!44481) b!261304))

(assert (= (and d!62781 (not c!44481)) b!261305))

(assert (= (and d!62781 (not res!127663)) b!261306))

(declare-fun m!276999 () Bool)

(assert (=> d!62781 m!276999))

(declare-fun m!277001 () Bool)

(assert (=> b!261304 m!277001))

(assert (=> b!261304 m!276391))

(assert (=> b!261304 m!276391))

(declare-fun m!277003 () Bool)

(assert (=> b!261304 m!277003))

(assert (=> b!261306 m!276391))

(assert (=> b!261306 m!276391))

(assert (=> b!261306 m!277003))

(assert (=> d!62587 d!62781))

(declare-fun c!44482 () Bool)

(declare-fun d!62783 () Bool)

(assert (=> d!62783 (= c!44482 (and ((_ is Cons!3794) lt!131621) (= (_1!2461 (h!4459 lt!131621)) (_1!2461 (tuple2!4901 key!932 v!346)))))))

(declare-fun e!169317 () Option!321)

(assert (=> d!62783 (= (getValueByKey!315 lt!131621 (_1!2461 (tuple2!4901 key!932 v!346))) e!169317)))

(declare-fun b!261310 () Bool)

(declare-fun e!169318 () Option!321)

(assert (=> b!261310 (= e!169318 None!319)))

(declare-fun b!261308 () Bool)

(assert (=> b!261308 (= e!169317 e!169318)))

(declare-fun c!44483 () Bool)

(assert (=> b!261308 (= c!44483 (and ((_ is Cons!3794) lt!131621) (not (= (_1!2461 (h!4459 lt!131621)) (_1!2461 (tuple2!4901 key!932 v!346))))))))

(declare-fun b!261309 () Bool)

(assert (=> b!261309 (= e!169318 (getValueByKey!315 (t!8860 lt!131621) (_1!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun b!261307 () Bool)

(assert (=> b!261307 (= e!169317 (Some!320 (_2!2461 (h!4459 lt!131621))))))

(assert (= (and d!62783 c!44482) b!261307))

(assert (= (and d!62783 (not c!44482)) b!261308))

(assert (= (and b!261308 c!44483) b!261309))

(assert (= (and b!261308 (not c!44483)) b!261310))

(declare-fun m!277005 () Bool)

(assert (=> b!261309 m!277005))

(assert (=> d!62587 d!62783))

(declare-fun d!62785 () Bool)

(assert (=> d!62785 (= (getValueByKey!315 lt!131621 (_1!2461 (tuple2!4901 key!932 v!346))) (Some!320 (_2!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun lt!131853 () Unit!8064)

(declare-fun choose!1286 (List!3798 (_ BitVec 64) V!8481) Unit!8064)

(assert (=> d!62785 (= lt!131853 (choose!1286 lt!131621 (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun e!169321 () Bool)

(assert (=> d!62785 e!169321))

(declare-fun res!127668 () Bool)

(assert (=> d!62785 (=> (not res!127668) (not e!169321))))

(assert (=> d!62785 (= res!127668 (isStrictlySorted!371 lt!131621))))

(assert (=> d!62785 (= (lemmaContainsTupThenGetReturnValue!174 lt!131621 (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))) lt!131853)))

(declare-fun b!261315 () Bool)

(declare-fun res!127669 () Bool)

(assert (=> b!261315 (=> (not res!127669) (not e!169321))))

(assert (=> b!261315 (= res!127669 (containsKey!307 lt!131621 (_1!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun b!261316 () Bool)

(assert (=> b!261316 (= e!169321 (contains!1876 lt!131621 (tuple2!4901 (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346)))))))

(assert (= (and d!62785 res!127668) b!261315))

(assert (= (and b!261315 res!127669) b!261316))

(assert (=> d!62785 m!276385))

(declare-fun m!277007 () Bool)

(assert (=> d!62785 m!277007))

(declare-fun m!277009 () Bool)

(assert (=> d!62785 m!277009))

(declare-fun m!277011 () Bool)

(assert (=> b!261315 m!277011))

(declare-fun m!277013 () Bool)

(assert (=> b!261316 m!277013))

(assert (=> d!62587 d!62785))

(declare-fun lt!131856 () List!3798)

(declare-fun e!169332 () Bool)

(declare-fun b!261337 () Bool)

(assert (=> b!261337 (= e!169332 (contains!1876 lt!131856 (tuple2!4901 (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346)))))))

(declare-fun d!62787 () Bool)

(assert (=> d!62787 e!169332))

(declare-fun res!127675 () Bool)

(assert (=> d!62787 (=> (not res!127675) (not e!169332))))

(assert (=> d!62787 (= res!127675 (isStrictlySorted!371 lt!131856))))

(declare-fun e!169335 () List!3798)

(assert (=> d!62787 (= lt!131856 e!169335)))

(declare-fun c!44494 () Bool)

(assert (=> d!62787 (= c!44494 (and ((_ is Cons!3794) (toList!1917 lt!131403)) (bvslt (_1!2461 (h!4459 (toList!1917 lt!131403))) (_1!2461 (tuple2!4901 key!932 v!346)))))))

(assert (=> d!62787 (isStrictlySorted!371 (toList!1917 lt!131403))))

(assert (=> d!62787 (= (insertStrictlySorted!177 (toList!1917 lt!131403) (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))) lt!131856)))

(declare-fun b!261338 () Bool)

(declare-fun c!44492 () Bool)

(assert (=> b!261338 (= c!44492 (and ((_ is Cons!3794) (toList!1917 lt!131403)) (bvsgt (_1!2461 (h!4459 (toList!1917 lt!131403))) (_1!2461 (tuple2!4901 key!932 v!346)))))))

(declare-fun e!169334 () List!3798)

(declare-fun e!169333 () List!3798)

(assert (=> b!261338 (= e!169334 e!169333)))

(declare-fun b!261339 () Bool)

(declare-fun res!127674 () Bool)

(assert (=> b!261339 (=> (not res!127674) (not e!169332))))

(assert (=> b!261339 (= res!127674 (containsKey!307 lt!131856 (_1!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun b!261340 () Bool)

(declare-fun call!24943 () List!3798)

(assert (=> b!261340 (= e!169333 call!24943)))

(declare-fun b!261341 () Bool)

(declare-fun c!44495 () Bool)

(declare-fun e!169336 () List!3798)

(assert (=> b!261341 (= e!169336 (ite c!44495 (t!8860 (toList!1917 lt!131403)) (ite c!44492 (Cons!3794 (h!4459 (toList!1917 lt!131403)) (t!8860 (toList!1917 lt!131403))) Nil!3795)))))

(declare-fun call!24942 () List!3798)

(declare-fun bm!24939 () Bool)

(declare-fun $colon$colon!106 (List!3798 tuple2!4900) List!3798)

(assert (=> bm!24939 (= call!24942 ($colon$colon!106 e!169336 (ite c!44494 (h!4459 (toList!1917 lt!131403)) (tuple2!4901 (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))))))))

(declare-fun c!44493 () Bool)

(assert (=> bm!24939 (= c!44493 c!44494)))

(declare-fun b!261342 () Bool)

(assert (=> b!261342 (= e!169336 (insertStrictlySorted!177 (t!8860 (toList!1917 lt!131403)) (_1!2461 (tuple2!4901 key!932 v!346)) (_2!2461 (tuple2!4901 key!932 v!346))))))

(declare-fun b!261343 () Bool)

(assert (=> b!261343 (= e!169333 call!24943)))

(declare-fun b!261344 () Bool)

(assert (=> b!261344 (= e!169335 call!24942)))

(declare-fun b!261345 () Bool)

(assert (=> b!261345 (= e!169335 e!169334)))

(assert (=> b!261345 (= c!44495 (and ((_ is Cons!3794) (toList!1917 lt!131403)) (= (_1!2461 (h!4459 (toList!1917 lt!131403))) (_1!2461 (tuple2!4901 key!932 v!346)))))))

(declare-fun b!261346 () Bool)

(declare-fun call!24944 () List!3798)

(assert (=> b!261346 (= e!169334 call!24944)))

(declare-fun bm!24940 () Bool)

(assert (=> bm!24940 (= call!24943 call!24944)))

(declare-fun bm!24941 () Bool)

(assert (=> bm!24941 (= call!24944 call!24942)))

(assert (= (and d!62787 c!44494) b!261344))

(assert (= (and d!62787 (not c!44494)) b!261345))

(assert (= (and b!261345 c!44495) b!261346))

(assert (= (and b!261345 (not c!44495)) b!261338))

(assert (= (and b!261338 c!44492) b!261340))

(assert (= (and b!261338 (not c!44492)) b!261343))

(assert (= (or b!261340 b!261343) bm!24940))

(assert (= (or b!261346 bm!24940) bm!24941))

(assert (= (or b!261344 bm!24941) bm!24939))

(assert (= (and bm!24939 c!44493) b!261342))

(assert (= (and bm!24939 (not c!44493)) b!261341))

(assert (= (and d!62787 res!127675) b!261339))

(assert (= (and b!261339 res!127674) b!261337))

(declare-fun m!277015 () Bool)

(assert (=> d!62787 m!277015))

(assert (=> d!62787 m!276511))

(declare-fun m!277017 () Bool)

(assert (=> bm!24939 m!277017))

(declare-fun m!277019 () Bool)

(assert (=> b!261339 m!277019))

(declare-fun m!277021 () Bool)

(assert (=> b!261342 m!277021))

(declare-fun m!277023 () Bool)

(assert (=> b!261337 m!277023))

(assert (=> d!62587 d!62787))

(declare-fun d!62789 () Bool)

(declare-fun e!169338 () Bool)

(assert (=> d!62789 e!169338))

(declare-fun res!127676 () Bool)

(assert (=> d!62789 (=> res!127676 e!169338)))

(declare-fun lt!131859 () Bool)

(assert (=> d!62789 (= res!127676 (not lt!131859))))

(declare-fun lt!131858 () Bool)

(assert (=> d!62789 (= lt!131859 lt!131858)))

(declare-fun lt!131860 () Unit!8064)

(declare-fun e!169337 () Unit!8064)

(assert (=> d!62789 (= lt!131860 e!169337)))

(declare-fun c!44496 () Bool)

(assert (=> d!62789 (= c!44496 lt!131858)))

(assert (=> d!62789 (= lt!131858 (containsKey!307 (toList!1917 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) key!932))))

(assert (=> d!62789 (= (contains!1875 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) key!932) lt!131859)))

(declare-fun b!261347 () Bool)

(declare-fun lt!131857 () Unit!8064)

(assert (=> b!261347 (= e!169337 lt!131857)))

(assert (=> b!261347 (= lt!131857 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1917 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) key!932))))

(assert (=> b!261347 (isDefined!257 (getValueByKey!315 (toList!1917 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) key!932))))

(declare-fun b!261348 () Bool)

(declare-fun Unit!8086 () Unit!8064)

(assert (=> b!261348 (= e!169337 Unit!8086)))

(declare-fun b!261349 () Bool)

(assert (=> b!261349 (= e!169338 (isDefined!257 (getValueByKey!315 (toList!1917 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) key!932)))))

(assert (= (and d!62789 c!44496) b!261347))

(assert (= (and d!62789 (not c!44496)) b!261348))

(assert (= (and d!62789 (not res!127676)) b!261349))

(declare-fun m!277025 () Bool)

(assert (=> d!62789 m!277025))

(declare-fun m!277027 () Bool)

(assert (=> b!261347 m!277027))

(declare-fun m!277029 () Bool)

(assert (=> b!261347 m!277029))

(assert (=> b!261347 m!277029))

(declare-fun m!277031 () Bool)

(assert (=> b!261347 m!277031))

(assert (=> b!261349 m!277029))

(assert (=> b!261349 m!277029))

(assert (=> b!261349 m!277031))

(assert (=> d!62565 d!62789))

(assert (=> d!62565 d!62575))

(declare-fun d!62791 () Bool)

(assert (=> d!62791 (contains!1875 (getCurrentListMap!1426 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) key!932)))

(assert (=> d!62791 true))

(declare-fun _$17!92 () Unit!8064)

(assert (=> d!62791 (= (choose!1280 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) _$17!92)))

(declare-fun bs!9201 () Bool)

(assert (= bs!9201 d!62791))

(assert (=> bs!9201 m!276129))

(assert (=> bs!9201 m!276129))

(assert (=> bs!9201 m!276269))

(assert (=> d!62565 d!62791))

(assert (=> d!62565 d!62603))

(declare-fun b!261368 () Bool)

(declare-fun e!169351 () SeekEntryResult!1180)

(assert (=> b!261368 (= e!169351 (Intermediate!1180 false (toIndex!0 key!932 (mask!11143 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!261369 () Bool)

(assert (=> b!261369 (= e!169351 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11143 thiss!1504)) #b00000000000000000000000000000000 (mask!11143 thiss!1504)) key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(declare-fun b!261370 () Bool)

(declare-fun lt!131865 () SeekEntryResult!1180)

(assert (=> b!261370 (and (bvsge (index!6892 lt!131865) #b00000000000000000000000000000000) (bvslt (index!6892 lt!131865) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun res!127683 () Bool)

(assert (=> b!261370 (= res!127683 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6892 lt!131865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169353 () Bool)

(assert (=> b!261370 (=> res!127683 e!169353)))

(declare-fun b!261371 () Bool)

(assert (=> b!261371 (and (bvsge (index!6892 lt!131865) #b00000000000000000000000000000000) (bvslt (index!6892 lt!131865) (size!6313 (_keys!6990 thiss!1504))))))

(declare-fun res!127685 () Bool)

(assert (=> b!261371 (= res!127685 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6892 lt!131865)) key!932))))

(assert (=> b!261371 (=> res!127685 e!169353)))

(declare-fun e!169349 () Bool)

(assert (=> b!261371 (= e!169349 e!169353)))

(declare-fun b!261372 () Bool)

(declare-fun e!169350 () SeekEntryResult!1180)

(assert (=> b!261372 (= e!169350 e!169351)))

(declare-fun c!44505 () Bool)

(declare-fun lt!131866 () (_ BitVec 64))

(assert (=> b!261372 (= c!44505 (or (= lt!131866 key!932) (= (bvadd lt!131866 lt!131866) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!62793 () Bool)

(declare-fun e!169352 () Bool)

(assert (=> d!62793 e!169352))

(declare-fun c!44503 () Bool)

(assert (=> d!62793 (= c!44503 (and ((_ is Intermediate!1180) lt!131865) (undefined!1992 lt!131865)))))

(assert (=> d!62793 (= lt!131865 e!169350)))

(declare-fun c!44504 () Bool)

(assert (=> d!62793 (= c!44504 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!62793 (= lt!131866 (select (arr!5962 (_keys!6990 thiss!1504)) (toIndex!0 key!932 (mask!11143 thiss!1504))))))

(assert (=> d!62793 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11143 thiss!1504)) key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)) lt!131865)))

(declare-fun b!261373 () Bool)

(assert (=> b!261373 (= e!169352 e!169349)))

(declare-fun res!127684 () Bool)

(assert (=> b!261373 (= res!127684 (and ((_ is Intermediate!1180) lt!131865) (not (undefined!1992 lt!131865)) (bvslt (x!25143 lt!131865) #b01111111111111111111111111111110) (bvsge (x!25143 lt!131865) #b00000000000000000000000000000000) (bvsge (x!25143 lt!131865) #b00000000000000000000000000000000)))))

(assert (=> b!261373 (=> (not res!127684) (not e!169349))))

(declare-fun b!261374 () Bool)

(assert (=> b!261374 (= e!169350 (Intermediate!1180 true (toIndex!0 key!932 (mask!11143 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!261375 () Bool)

(assert (=> b!261375 (= e!169352 (bvsge (x!25143 lt!131865) #b01111111111111111111111111111110))))

(declare-fun b!261376 () Bool)

(assert (=> b!261376 (and (bvsge (index!6892 lt!131865) #b00000000000000000000000000000000) (bvslt (index!6892 lt!131865) (size!6313 (_keys!6990 thiss!1504))))))

(assert (=> b!261376 (= e!169353 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6892 lt!131865)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!62793 c!44504) b!261374))

(assert (= (and d!62793 (not c!44504)) b!261372))

(assert (= (and b!261372 c!44505) b!261368))

(assert (= (and b!261372 (not c!44505)) b!261369))

(assert (= (and d!62793 c!44503) b!261375))

(assert (= (and d!62793 (not c!44503)) b!261373))

(assert (= (and b!261373 res!127684) b!261371))

(assert (= (and b!261371 (not res!127685)) b!261370))

(assert (= (and b!261370 (not res!127683)) b!261376))

(assert (=> b!261369 m!276357))

(declare-fun m!277033 () Bool)

(assert (=> b!261369 m!277033))

(assert (=> b!261369 m!277033))

(declare-fun m!277035 () Bool)

(assert (=> b!261369 m!277035))

(assert (=> d!62793 m!276357))

(declare-fun m!277037 () Bool)

(assert (=> d!62793 m!277037))

(assert (=> d!62793 m!276089))

(declare-fun m!277039 () Bool)

(assert (=> b!261376 m!277039))

(assert (=> b!261370 m!277039))

(assert (=> b!261371 m!277039))

(assert (=> d!62577 d!62793))

(declare-fun d!62795 () Bool)

(declare-fun lt!131872 () (_ BitVec 32))

(declare-fun lt!131871 () (_ BitVec 32))

(assert (=> d!62795 (= lt!131872 (bvmul (bvxor lt!131871 (bvlshr lt!131871 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62795 (= lt!131871 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62795 (and (bvsge (mask!11143 thiss!1504) #b00000000000000000000000000000000) (let ((res!127686 (let ((h!4463 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25162 (bvmul (bvxor h!4463 (bvlshr h!4463 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25162 (bvlshr x!25162 #b00000000000000000000000000001101)) (mask!11143 thiss!1504)))))) (and (bvslt res!127686 (bvadd (mask!11143 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!127686 #b00000000000000000000000000000000))))))

(assert (=> d!62795 (= (toIndex!0 key!932 (mask!11143 thiss!1504)) (bvand (bvxor lt!131872 (bvlshr lt!131872 #b00000000000000000000000000001101)) (mask!11143 thiss!1504)))))

(assert (=> d!62577 d!62795))

(assert (=> d!62577 d!62603))

(assert (=> d!62567 d!62577))

(declare-fun bm!24946 () Bool)

(declare-fun call!24949 () Bool)

(assert (=> bm!24946 (= call!24949 (arrayContainsKey!0 (_keys!6990 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261393 () Bool)

(declare-fun e!169363 () Bool)

(assert (=> b!261393 (= e!169363 (not call!24949))))

(declare-fun b!261394 () Bool)

(declare-fun e!169362 () Bool)

(declare-fun lt!131875 () SeekEntryResult!1180)

(assert (=> b!261394 (= e!169362 ((_ is Undefined!1180) lt!131875))))

(declare-fun b!261395 () Bool)

(declare-fun e!169365 () Bool)

(declare-fun e!169364 () Bool)

(assert (=> b!261395 (= e!169365 e!169364)))

(declare-fun res!127695 () Bool)

(declare-fun call!24950 () Bool)

(assert (=> b!261395 (= res!127695 call!24950)))

(assert (=> b!261395 (=> (not res!127695) (not e!169364))))

(declare-fun b!261396 () Bool)

(declare-fun res!127698 () Bool)

(assert (=> b!261396 (= res!127698 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6890 lt!131875)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261396 (=> (not res!127698) (not e!169364))))

(declare-fun b!261397 () Bool)

(assert (=> b!261397 (= e!169364 (not call!24949))))

(declare-fun d!62797 () Bool)

(assert (=> d!62797 e!169365))

(declare-fun c!44510 () Bool)

(assert (=> d!62797 (= c!44510 ((_ is MissingZero!1180) lt!131875))))

(assert (=> d!62797 (= lt!131875 (seekEntryOrOpen!0 key!932 (_keys!6990 thiss!1504) (mask!11143 thiss!1504)))))

(assert (=> d!62797 true))

(declare-fun _$34!1128 () Unit!8064)

(assert (=> d!62797 (= (choose!1281 (_keys!6990 thiss!1504) (_values!4790 thiss!1504) (mask!11143 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)) _$34!1128)))

(declare-fun b!261398 () Bool)

(declare-fun res!127696 () Bool)

(assert (=> b!261398 (=> (not res!127696) (not e!169363))))

(assert (=> b!261398 (= res!127696 (= (select (arr!5962 (_keys!6990 thiss!1504)) (index!6893 lt!131875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261399 () Bool)

(assert (=> b!261399 (= e!169365 e!169362)))

(declare-fun c!44511 () Bool)

(assert (=> b!261399 (= c!44511 ((_ is MissingVacant!1180) lt!131875))))

(declare-fun bm!24947 () Bool)

(assert (=> bm!24947 (= call!24950 (inRange!0 (ite c!44510 (index!6890 lt!131875) (index!6893 lt!131875)) (mask!11143 thiss!1504)))))

(declare-fun b!261400 () Bool)

(declare-fun res!127697 () Bool)

(assert (=> b!261400 (=> (not res!127697) (not e!169363))))

(assert (=> b!261400 (= res!127697 call!24950)))

(assert (=> b!261400 (= e!169362 e!169363)))

(assert (= (and d!62797 c!44510) b!261395))

(assert (= (and d!62797 (not c!44510)) b!261399))

(assert (= (and b!261395 res!127695) b!261396))

(assert (= (and b!261396 res!127698) b!261397))

(assert (= (and b!261399 c!44511) b!261400))

(assert (= (and b!261399 (not c!44511)) b!261394))

(assert (= (and b!261400 res!127697) b!261398))

(assert (= (and b!261398 res!127696) b!261393))

(assert (= (or b!261395 b!261400) bm!24947))

(assert (= (or b!261397 b!261393) bm!24946))

(assert (=> bm!24946 m!276071))

(assert (=> d!62797 m!276067))

(declare-fun m!277041 () Bool)

(assert (=> b!261398 m!277041))

(declare-fun m!277043 () Bool)

(assert (=> b!261396 m!277043))

(declare-fun m!277045 () Bool)

(assert (=> bm!24947 m!277045))

(assert (=> d!62567 d!62797))

(assert (=> d!62567 d!62603))

(assert (=> b!260911 d!62631))

(declare-fun d!62799 () Bool)

(declare-fun res!127703 () Bool)

(declare-fun e!169370 () Bool)

(assert (=> d!62799 (=> res!127703 e!169370)))

(assert (=> d!62799 (= res!127703 (and ((_ is Cons!3794) (toList!1917 lt!131403)) (= (_1!2461 (h!4459 (toList!1917 lt!131403))) key!932)))))

(assert (=> d!62799 (= (containsKey!307 (toList!1917 lt!131403) key!932) e!169370)))

(declare-fun b!261405 () Bool)

(declare-fun e!169371 () Bool)

(assert (=> b!261405 (= e!169370 e!169371)))

(declare-fun res!127704 () Bool)

(assert (=> b!261405 (=> (not res!127704) (not e!169371))))

(assert (=> b!261405 (= res!127704 (and (or (not ((_ is Cons!3794) (toList!1917 lt!131403))) (bvsle (_1!2461 (h!4459 (toList!1917 lt!131403))) key!932)) ((_ is Cons!3794) (toList!1917 lt!131403)) (bvslt (_1!2461 (h!4459 (toList!1917 lt!131403))) key!932)))))

(declare-fun b!261406 () Bool)

(assert (=> b!261406 (= e!169371 (containsKey!307 (t!8860 (toList!1917 lt!131403)) key!932))))

(assert (= (and d!62799 (not res!127703)) b!261405))

(assert (= (and b!261405 res!127704) b!261406))

(declare-fun m!277047 () Bool)

(assert (=> b!261406 m!277047))

(assert (=> d!62573 d!62799))

(assert (=> b!260995 d!62657))

(declare-fun d!62801 () Bool)

(assert (=> d!62801 (arrayContainsKey!0 lt!131407 lt!131643 #b00000000000000000000000000000000)))

(declare-fun lt!131876 () Unit!8064)

(assert (=> d!62801 (= lt!131876 (choose!13 lt!131407 lt!131643 #b00000000000000000000000000000000))))

(assert (=> d!62801 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62801 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131407 lt!131643 #b00000000000000000000000000000000) lt!131876)))

(declare-fun bs!9202 () Bool)

(assert (= bs!9202 d!62801))

(assert (=> bs!9202 m!276429))

(declare-fun m!277049 () Bool)

(assert (=> bs!9202 m!277049))

(assert (=> b!261013 d!62801))

(declare-fun d!62803 () Bool)

(declare-fun res!127705 () Bool)

(declare-fun e!169372 () Bool)

(assert (=> d!62803 (=> res!127705 e!169372)))

(assert (=> d!62803 (= res!127705 (= (select (arr!5962 lt!131407) #b00000000000000000000000000000000) lt!131643))))

(assert (=> d!62803 (= (arrayContainsKey!0 lt!131407 lt!131643 #b00000000000000000000000000000000) e!169372)))

(declare-fun b!261407 () Bool)

(declare-fun e!169373 () Bool)

(assert (=> b!261407 (= e!169372 e!169373)))

(declare-fun res!127706 () Bool)

(assert (=> b!261407 (=> (not res!127706) (not e!169373))))

(assert (=> b!261407 (= res!127706 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6313 lt!131407)))))

(declare-fun b!261408 () Bool)

(assert (=> b!261408 (= e!169373 (arrayContainsKey!0 lt!131407 lt!131643 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62803 (not res!127705)) b!261407))

(assert (= (and b!261407 res!127706) b!261408))

(assert (=> d!62803 m!276365))

(declare-fun m!277051 () Bool)

(assert (=> b!261408 m!277051))

(assert (=> b!261013 d!62803))

(declare-fun b!261409 () Bool)

(declare-fun e!169374 () SeekEntryResult!1180)

(declare-fun e!169376 () SeekEntryResult!1180)

(assert (=> b!261409 (= e!169374 e!169376)))

(declare-fun lt!131878 () (_ BitVec 64))

(declare-fun lt!131877 () SeekEntryResult!1180)

(assert (=> b!261409 (= lt!131878 (select (arr!5962 lt!131407) (index!6892 lt!131877)))))

(declare-fun c!44513 () Bool)

(assert (=> b!261409 (= c!44513 (= lt!131878 (select (arr!5962 lt!131407) #b00000000000000000000000000000000)))))

(declare-fun b!261411 () Bool)

(declare-fun e!169375 () SeekEntryResult!1180)

(assert (=> b!261411 (= e!169375 (seekKeyOrZeroReturnVacant!0 (x!25143 lt!131877) (index!6892 lt!131877) (index!6892 lt!131877) (select (arr!5962 lt!131407) #b00000000000000000000000000000000) lt!131407 (mask!11143 thiss!1504)))))

(declare-fun b!261412 () Bool)

(assert (=> b!261412 (= e!169375 (MissingZero!1180 (index!6892 lt!131877)))))

(declare-fun b!261413 () Bool)

(assert (=> b!261413 (= e!169376 (Found!1180 (index!6892 lt!131877)))))

(declare-fun b!261414 () Bool)

(declare-fun c!44514 () Bool)

(assert (=> b!261414 (= c!44514 (= lt!131878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261414 (= e!169376 e!169375)))

(declare-fun d!62805 () Bool)

(declare-fun lt!131879 () SeekEntryResult!1180)

(assert (=> d!62805 (and (or ((_ is Undefined!1180) lt!131879) (not ((_ is Found!1180) lt!131879)) (and (bvsge (index!6891 lt!131879) #b00000000000000000000000000000000) (bvslt (index!6891 lt!131879) (size!6313 lt!131407)))) (or ((_ is Undefined!1180) lt!131879) ((_ is Found!1180) lt!131879) (not ((_ is MissingZero!1180) lt!131879)) (and (bvsge (index!6890 lt!131879) #b00000000000000000000000000000000) (bvslt (index!6890 lt!131879) (size!6313 lt!131407)))) (or ((_ is Undefined!1180) lt!131879) ((_ is Found!1180) lt!131879) ((_ is MissingZero!1180) lt!131879) (not ((_ is MissingVacant!1180) lt!131879)) (and (bvsge (index!6893 lt!131879) #b00000000000000000000000000000000) (bvslt (index!6893 lt!131879) (size!6313 lt!131407)))) (or ((_ is Undefined!1180) lt!131879) (ite ((_ is Found!1180) lt!131879) (= (select (arr!5962 lt!131407) (index!6891 lt!131879)) (select (arr!5962 lt!131407) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1180) lt!131879) (= (select (arr!5962 lt!131407) (index!6890 lt!131879)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1180) lt!131879) (= (select (arr!5962 lt!131407) (index!6893 lt!131879)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62805 (= lt!131879 e!169374)))

(declare-fun c!44512 () Bool)

(assert (=> d!62805 (= c!44512 (and ((_ is Intermediate!1180) lt!131877) (undefined!1992 lt!131877)))))

(assert (=> d!62805 (= lt!131877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) (mask!11143 thiss!1504)) (select (arr!5962 lt!131407) #b00000000000000000000000000000000) lt!131407 (mask!11143 thiss!1504)))))

(assert (=> d!62805 (validMask!0 (mask!11143 thiss!1504))))

(assert (=> d!62805 (= (seekEntryOrOpen!0 (select (arr!5962 lt!131407) #b00000000000000000000000000000000) lt!131407 (mask!11143 thiss!1504)) lt!131879)))

(declare-fun b!261410 () Bool)

(assert (=> b!261410 (= e!169374 Undefined!1180)))

(assert (= (and d!62805 c!44512) b!261410))

(assert (= (and d!62805 (not c!44512)) b!261409))

(assert (= (and b!261409 c!44513) b!261413))

(assert (= (and b!261409 (not c!44513)) b!261414))

(assert (= (and b!261414 c!44514) b!261412))

(assert (= (and b!261414 (not c!44514)) b!261411))

(declare-fun m!277053 () Bool)

(assert (=> b!261409 m!277053))

(assert (=> b!261411 m!276365))

(declare-fun m!277055 () Bool)

(assert (=> b!261411 m!277055))

(assert (=> d!62805 m!276089))

(declare-fun m!277057 () Bool)

(assert (=> d!62805 m!277057))

(declare-fun m!277059 () Bool)

(assert (=> d!62805 m!277059))

(assert (=> d!62805 m!276365))

(declare-fun m!277061 () Bool)

(assert (=> d!62805 m!277061))

(declare-fun m!277063 () Bool)

(assert (=> d!62805 m!277063))

(assert (=> d!62805 m!276365))

(assert (=> d!62805 m!277059))

(declare-fun m!277065 () Bool)

(assert (=> d!62805 m!277065))

(assert (=> b!261013 d!62805))

(declare-fun d!62807 () Bool)

(assert (=> d!62807 (= (validKeyInArray!0 (select (arr!5962 (_keys!6990 thiss!1504)) index!297)) (and (not (= (select (arr!5962 (_keys!6990 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5962 (_keys!6990 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260963 d!62807))

(declare-fun mapIsEmpty!11302 () Bool)

(declare-fun mapRes!11302 () Bool)

(assert (=> mapIsEmpty!11302 mapRes!11302))

(declare-fun b!261415 () Bool)

(declare-fun e!169377 () Bool)

(assert (=> b!261415 (= e!169377 tp_is_empty!6625)))

(declare-fun mapNonEmpty!11302 () Bool)

(declare-fun tp!23632 () Bool)

(assert (=> mapNonEmpty!11302 (= mapRes!11302 (and tp!23632 e!169377))))

(declare-fun mapKey!11302 () (_ BitVec 32))

(declare-fun mapRest!11302 () (Array (_ BitVec 32) ValueCell!2969))

(declare-fun mapValue!11302 () ValueCell!2969)

(assert (=> mapNonEmpty!11302 (= mapRest!11301 (store mapRest!11302 mapKey!11302 mapValue!11302))))

(declare-fun b!261416 () Bool)

(declare-fun e!169378 () Bool)

(assert (=> b!261416 (= e!169378 tp_is_empty!6625)))

(declare-fun condMapEmpty!11302 () Bool)

(declare-fun mapDefault!11302 () ValueCell!2969)

(assert (=> mapNonEmpty!11301 (= condMapEmpty!11302 (= mapRest!11301 ((as const (Array (_ BitVec 32) ValueCell!2969)) mapDefault!11302)))))

(assert (=> mapNonEmpty!11301 (= tp!23631 (and e!169378 mapRes!11302))))

(assert (= (and mapNonEmpty!11301 condMapEmpty!11302) mapIsEmpty!11302))

(assert (= (and mapNonEmpty!11301 (not condMapEmpty!11302)) mapNonEmpty!11302))

(assert (= (and mapNonEmpty!11302 ((_ is ValueCellFull!2969) mapValue!11302)) b!261415))

(assert (= (and mapNonEmpty!11301 ((_ is ValueCellFull!2969) mapDefault!11302)) b!261416))

(declare-fun m!277067 () Bool)

(assert (=> mapNonEmpty!11302 m!277067))

(declare-fun b_lambda!8287 () Bool)

(assert (= b_lambda!8279 (or (and b!260670 b_free!6763) b_lambda!8287)))

(declare-fun b_lambda!8289 () Bool)

(assert (= b_lambda!8281 (or (and b!260670 b_free!6763) b_lambda!8289)))

(declare-fun b_lambda!8291 () Bool)

(assert (= b_lambda!8285 (or (and b!260670 b_free!6763) b_lambda!8291)))

(declare-fun b_lambda!8293 () Bool)

(assert (= b_lambda!8277 (or (and b!260670 b_free!6763) b_lambda!8293)))

(declare-fun b_lambda!8295 () Bool)

(assert (= b_lambda!8283 (or (and b!260670 b_free!6763) b_lambda!8295)))

(check-sat (not b!261243) (not d!62635) (not bm!24927) (not b!261204) (not b!261117) (not b!261091) (not d!62659) (not b!261287) (not d!62785) (not b!261132) (not b!261304) (not b!261278) (not bm!24947) (not d!62671) (not b!261266) (not b!261246) (not b!261154) (not b!261158) (not d!62753) (not b!261258) (not b!261190) (not b!261120) (not b!261303) (not bm!24921) (not b!261192) (not bm!24913) (not d!62621) (not d!62757) (not b!261128) (not d!62715) (not b!261290) (not b!261185) (not b!261273) (not d!62731) (not d!62771) (not b!261215) (not d!62725) (not b!261369) (not b!261097) (not b!261295) (not b!261411) (not mapNonEmpty!11302) (not d!62695) (not d!62701) (not b!261122) (not d!62615) (not b_lambda!8287) (not d!62797) (not d!62647) (not d!62705) (not b!261250) (not b!261289) (not d!62703) (not d!62655) (not d!62711) (not d!62693) (not bm!24928) (not d!62707) (not bm!24915) (not b!261280) (not b!261220) (not d!62779) (not b!261193) (not b!261316) (not b!261299) (not b!261265) (not d!62787) (not d!62721) (not b!261224) (not b!261108) (not b!261115) (not bm!24914) (not d!62733) (not d!62651) (not bm!24930) (not b!261245) (not d!62743) (not b!261294) (not b!261063) (not b!261201) (not b!261200) (not d!62751) (not d!62709) (not d!62689) (not b!261408) (not d!62745) (not d!62699) (not b!261262) (not b!261349) (not b!261099) (not d!62749) (not b!261131) (not b!261342) (not b!261296) (not d!62681) (not d!62633) (not d!62775) (not b!261170) (not d!62737) (not b!261169) tp_is_empty!6625 (not b!261092) (not b!261309) (not d!62747) (not b!261111) (not b!261205) (not b_next!6763) (not bm!24932) (not b!261263) b_and!13875 (not b_lambda!8295) (not d!62649) (not b!261222) (not bm!24922) (not b!261241) (not b!261159) (not d!62619) (not d!62801) (not b!261255) (not b!261061) (not b_lambda!8291) (not b!261227) (not d!62761) (not b!261271) (not b!261248) (not b!261302) (not b!261100) (not b!261214) (not d!62741) (not b!261114) (not b!261203) (not b!261347) (not b_lambda!8275) (not d!62793) (not bm!24939) (not b!261221) (not b!261186) (not b!261288) (not b!261181) (not b!261184) (not b!261177) (not bm!24920) (not d!62719) (not b!261234) (not b!261096) (not d!62623) (not b!261212) (not bm!24919) (not b!261113) (not b!261268) (not d!62629) (not d!62789) (not d!62697) (not d!62611) (not b!261272) (not d!62609) (not d!62713) (not b!261059) (not d!62685) (not bm!24929) (not d!62791) (not b!261286) (not b!261279) (not d!62763) (not d!62727) (not b!261337) (not bm!24918) (not b!261219) (not d!62625) (not d!62805) (not d!62739) (not b!261213) (not b!261301) (not d!62767) (not bm!24946) (not b!261118) (not b!261196) (not b!261225) (not b!261306) (not d!62683) (not d!62617) (not d!62717) (not bm!24916) (not bm!24924) (not b!261095) (not bm!24931) (not b_lambda!8289) (not d!62691) (not b!261229) (not d!62735) (not b!261264) (not b!261300) (not b!261339) (not d!62653) (not b!261226) (not b_lambda!8293) (not b!261406) (not b!261256) (not b!261315) (not d!62645) (not b!261217) (not b!261119) (not b!261066) (not bm!24917) (not b!261109) (not d!62643) (not b!261247) (not d!62729) (not b!261123) (not b_lambda!8273) (not b!261257) (not b!261127) (not d!62687) (not d!62781) (not b!261138) (not b!261094) (not b!261253) (not b!261282))
(check-sat b_and!13875 (not b_next!6763))
