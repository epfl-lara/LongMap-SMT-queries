; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89572 () Bool)

(assert start!89572)

(declare-fun b!1027502 () Bool)

(declare-fun b_free!20571 () Bool)

(declare-fun b_next!20571 () Bool)

(assert (=> b!1027502 (= b_free!20571 (not b_next!20571))))

(declare-fun tp!72758 () Bool)

(declare-fun b_and!32819 () Bool)

(assert (=> b!1027502 (= tp!72758 b_and!32819)))

(declare-fun mapNonEmpty!37865 () Bool)

(declare-fun mapRes!37865 () Bool)

(declare-fun tp!72759 () Bool)

(declare-fun e!579901 () Bool)

(assert (=> mapNonEmpty!37865 (= mapRes!37865 (and tp!72759 e!579901))))

(declare-datatypes ((V!37261 0))(
  ( (V!37262 (val!12196 Int)) )
))
(declare-datatypes ((ValueCell!11442 0))(
  ( (ValueCellFull!11442 (v!14765 V!37261)) (EmptyCell!11442) )
))
(declare-fun mapRest!37865 () (Array (_ BitVec 32) ValueCell!11442))

(declare-fun mapKey!37865 () (_ BitVec 32))

(declare-fun mapValue!37865 () ValueCell!11442)

(declare-datatypes ((array!64632 0))(
  ( (array!64633 (arr!31125 (Array (_ BitVec 32) (_ BitVec 64))) (size!31638 (_ BitVec 32))) )
))
(declare-datatypes ((array!64634 0))(
  ( (array!64635 (arr!31126 (Array (_ BitVec 32) ValueCell!11442)) (size!31639 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5478 0))(
  ( (LongMapFixedSize!5479 (defaultEntry!6091 Int) (mask!29809 (_ BitVec 32)) (extraKeys!5823 (_ BitVec 32)) (zeroValue!5927 V!37261) (minValue!5927 V!37261) (_size!2794 (_ BitVec 32)) (_keys!11238 array!64632) (_values!6114 array!64634) (_vacant!2794 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5478)

(assert (=> mapNonEmpty!37865 (= (arr!31126 (_values!6114 thiss!1427)) (store mapRest!37865 mapKey!37865 mapValue!37865))))

(declare-fun res!687733 () Bool)

(declare-fun e!579903 () Bool)

(assert (=> start!89572 (=> (not res!687733) (not e!579903))))

(declare-fun valid!2074 (LongMapFixedSize!5478) Bool)

(assert (=> start!89572 (= res!687733 (valid!2074 thiss!1427))))

(assert (=> start!89572 e!579903))

(declare-fun e!579898 () Bool)

(assert (=> start!89572 e!579898))

(assert (=> start!89572 true))

(declare-fun b!1027498 () Bool)

(declare-fun tp_is_empty!24291 () Bool)

(assert (=> b!1027498 (= e!579901 tp_is_empty!24291)))

(declare-fun b!1027499 () Bool)

(declare-fun e!579900 () Bool)

(assert (=> b!1027499 (= e!579900 tp_is_empty!24291)))

(declare-fun lt!452318 () array!64632)

(declare-fun e!579899 () Bool)

(declare-fun b!1027500 () Bool)

(declare-fun lt!452313 () array!64634)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(declare-datatypes ((Unit!33489 0))(
  ( (Unit!33490) )
))
(declare-datatypes ((tuple2!15530 0))(
  ( (tuple2!15531 (_1!7776 Unit!33489) (_2!7776 LongMapFixedSize!5478)) )
))
(declare-fun Unit!33491 () Unit!33489)

(declare-fun Unit!33492 () Unit!33489)

(assert (=> b!1027500 (= e!579899 (not (validMask!0 (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33491 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33492 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15532 0))(
  ( (tuple2!15533 (_1!7777 (_ BitVec 64)) (_2!7777 V!37261)) )
))
(declare-datatypes ((List!21809 0))(
  ( (Nil!21806) (Cons!21805 (h!23003 tuple2!15532) (t!30875 List!21809)) )
))
(declare-datatypes ((ListLongMap!13669 0))(
  ( (ListLongMap!13670 (toList!6850 List!21809)) )
))
(declare-fun -!477 (ListLongMap!13669 (_ BitVec 64)) ListLongMap!13669)

(declare-fun getCurrentListMap!3898 (array!64632 array!64634 (_ BitVec 32) (_ BitVec 32) V!37261 V!37261 (_ BitVec 32) Int) ListLongMap!13669)

(assert (=> b!1027500 (= (-!477 (getCurrentListMap!3898 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)) key!909) (getCurrentListMap!3898 lt!452318 lt!452313 (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9674 0))(
  ( (MissingZero!9674 (index!41067 (_ BitVec 32))) (Found!9674 (index!41068 (_ BitVec 32))) (Intermediate!9674 (undefined!10486 Bool) (index!41069 (_ BitVec 32)) (x!91436 (_ BitVec 32))) (Undefined!9674) (MissingVacant!9674 (index!41070 (_ BitVec 32))) )
))
(declare-fun lt!452319 () SeekEntryResult!9674)

(declare-fun dynLambda!1947 (Int (_ BitVec 64)) V!37261)

(assert (=> b!1027500 (= lt!452313 (array!64635 (store (arr!31126 (_values!6114 thiss!1427)) (index!41068 lt!452319) (ValueCellFull!11442 (dynLambda!1947 (defaultEntry!6091 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31639 (_values!6114 thiss!1427))))))

(declare-fun lt!452314 () Unit!33489)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!3 (array!64632 array!64634 (_ BitVec 32) (_ BitVec 32) V!37261 V!37261 (_ BitVec 32) (_ BitVec 64) Int) Unit!33489)

(assert (=> b!1027500 (= lt!452314 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!3 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (index!41068 lt!452319) key!909 (defaultEntry!6091 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027500 (not (arrayContainsKey!0 lt!452318 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452316 () Unit!33489)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64632 (_ BitVec 32) (_ BitVec 64)) Unit!33489)

(assert (=> b!1027500 (= lt!452316 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11238 thiss!1427) (index!41068 lt!452319) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64632 (_ BitVec 32)) Bool)

(assert (=> b!1027500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452318 (mask!29809 thiss!1427))))

(declare-fun lt!452315 () Unit!33489)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64632 (_ BitVec 32) (_ BitVec 32)) Unit!33489)

(assert (=> b!1027500 (= lt!452315 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11238 thiss!1427) (index!41068 lt!452319) (mask!29809 thiss!1427)))))

(declare-datatypes ((List!21810 0))(
  ( (Nil!21807) (Cons!21806 (h!23004 (_ BitVec 64)) (t!30876 List!21810)) )
))
(declare-fun arrayNoDuplicates!0 (array!64632 (_ BitVec 32) List!21810) Bool)

(assert (=> b!1027500 (arrayNoDuplicates!0 lt!452318 #b00000000000000000000000000000000 Nil!21807)))

(declare-fun lt!452312 () Unit!33489)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21810) Unit!33489)

(assert (=> b!1027500 (= lt!452312 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11238 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41068 lt!452319) #b00000000000000000000000000000000 Nil!21807))))

(declare-fun arrayCountValidKeys!0 (array!64632 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027500 (= (arrayCountValidKeys!0 lt!452318 #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11238 thiss!1427) #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027500 (= lt!452318 (array!64633 (store (arr!31125 (_keys!11238 thiss!1427)) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31638 (_keys!11238 thiss!1427))))))

(declare-fun lt!452317 () Unit!33489)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64632 (_ BitVec 32) (_ BitVec 64)) Unit!33489)

(assert (=> b!1027500 (= lt!452317 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11238 thiss!1427) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027501 () Bool)

(declare-fun res!687732 () Bool)

(assert (=> b!1027501 (=> (not res!687732) (not e!579903))))

(assert (=> b!1027501 (= res!687732 (not (= key!909 (bvneg key!909))))))

(declare-fun e!579902 () Bool)

(declare-fun array_inv!24095 (array!64632) Bool)

(declare-fun array_inv!24096 (array!64634) Bool)

(assert (=> b!1027502 (= e!579898 (and tp!72758 tp_is_empty!24291 (array_inv!24095 (_keys!11238 thiss!1427)) (array_inv!24096 (_values!6114 thiss!1427)) e!579902))))

(declare-fun b!1027503 () Bool)

(assert (=> b!1027503 (= e!579902 (and e!579900 mapRes!37865))))

(declare-fun condMapEmpty!37865 () Bool)

(declare-fun mapDefault!37865 () ValueCell!11442)

(assert (=> b!1027503 (= condMapEmpty!37865 (= (arr!31126 (_values!6114 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11442)) mapDefault!37865)))))

(declare-fun b!1027504 () Bool)

(assert (=> b!1027504 (= e!579903 e!579899)))

(declare-fun res!687734 () Bool)

(assert (=> b!1027504 (=> (not res!687734) (not e!579899))))

(get-info :version)

(assert (=> b!1027504 (= res!687734 ((_ is Found!9674) lt!452319))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64632 (_ BitVec 32)) SeekEntryResult!9674)

(assert (=> b!1027504 (= lt!452319 (seekEntry!0 key!909 (_keys!11238 thiss!1427) (mask!29809 thiss!1427)))))

(declare-fun mapIsEmpty!37865 () Bool)

(assert (=> mapIsEmpty!37865 mapRes!37865))

(assert (= (and start!89572 res!687733) b!1027501))

(assert (= (and b!1027501 res!687732) b!1027504))

(assert (= (and b!1027504 res!687734) b!1027500))

(assert (= (and b!1027503 condMapEmpty!37865) mapIsEmpty!37865))

(assert (= (and b!1027503 (not condMapEmpty!37865)) mapNonEmpty!37865))

(assert (= (and mapNonEmpty!37865 ((_ is ValueCellFull!11442) mapValue!37865)) b!1027498))

(assert (= (and b!1027503 ((_ is ValueCellFull!11442) mapDefault!37865)) b!1027499))

(assert (= b!1027502 b!1027503))

(assert (= start!89572 b!1027502))

(declare-fun b_lambda!15721 () Bool)

(assert (=> (not b_lambda!15721) (not b!1027500)))

(declare-fun t!30874 () Bool)

(declare-fun tb!6889 () Bool)

(assert (=> (and b!1027502 (= (defaultEntry!6091 thiss!1427) (defaultEntry!6091 thiss!1427)) t!30874) tb!6889))

(declare-fun result!14093 () Bool)

(assert (=> tb!6889 (= result!14093 tp_is_empty!24291)))

(assert (=> b!1027500 t!30874))

(declare-fun b_and!32821 () Bool)

(assert (= b_and!32819 (and (=> t!30874 result!14093) b_and!32821)))

(declare-fun m!945999 () Bool)

(assert (=> b!1027502 m!945999))

(declare-fun m!946001 () Bool)

(assert (=> b!1027502 m!946001))

(declare-fun m!946003 () Bool)

(assert (=> mapNonEmpty!37865 m!946003))

(declare-fun m!946005 () Bool)

(assert (=> b!1027500 m!946005))

(declare-fun m!946007 () Bool)

(assert (=> b!1027500 m!946007))

(declare-fun m!946009 () Bool)

(assert (=> b!1027500 m!946009))

(declare-fun m!946011 () Bool)

(assert (=> b!1027500 m!946011))

(declare-fun m!946013 () Bool)

(assert (=> b!1027500 m!946013))

(declare-fun m!946015 () Bool)

(assert (=> b!1027500 m!946015))

(declare-fun m!946017 () Bool)

(assert (=> b!1027500 m!946017))

(declare-fun m!946019 () Bool)

(assert (=> b!1027500 m!946019))

(declare-fun m!946021 () Bool)

(assert (=> b!1027500 m!946021))

(assert (=> b!1027500 m!946019))

(declare-fun m!946023 () Bool)

(assert (=> b!1027500 m!946023))

(declare-fun m!946025 () Bool)

(assert (=> b!1027500 m!946025))

(declare-fun m!946027 () Bool)

(assert (=> b!1027500 m!946027))

(declare-fun m!946029 () Bool)

(assert (=> b!1027500 m!946029))

(declare-fun m!946031 () Bool)

(assert (=> b!1027500 m!946031))

(declare-fun m!946033 () Bool)

(assert (=> b!1027500 m!946033))

(declare-fun m!946035 () Bool)

(assert (=> b!1027500 m!946035))

(declare-fun m!946037 () Bool)

(assert (=> b!1027500 m!946037))

(declare-fun m!946039 () Bool)

(assert (=> start!89572 m!946039))

(declare-fun m!946041 () Bool)

(assert (=> b!1027504 m!946041))

(check-sat (not b!1027504) (not start!89572) (not b!1027500) (not b_lambda!15721) tp_is_empty!24291 (not b_next!20571) (not mapNonEmpty!37865) (not b!1027502) b_and!32821)
(check-sat b_and!32821 (not b_next!20571))
(get-model)

(declare-fun b_lambda!15725 () Bool)

(assert (= b_lambda!15721 (or (and b!1027502 b_free!20571) b_lambda!15725)))

(check-sat (not b!1027504) (not start!89572) (not b_lambda!15725) (not b!1027500) tp_is_empty!24291 (not b_next!20571) (not mapNonEmpty!37865) (not b!1027502) b_and!32821)
(check-sat b_and!32821 (not b_next!20571))
(get-model)

(declare-fun b!1027542 () Bool)

(declare-fun e!579932 () SeekEntryResult!9674)

(assert (=> b!1027542 (= e!579932 Undefined!9674)))

(declare-fun b!1027543 () Bool)

(declare-fun e!579933 () SeekEntryResult!9674)

(declare-fun lt!452353 () SeekEntryResult!9674)

(assert (=> b!1027543 (= e!579933 (Found!9674 (index!41069 lt!452353)))))

(declare-fun b!1027544 () Bool)

(declare-fun e!579934 () SeekEntryResult!9674)

(declare-fun lt!452355 () SeekEntryResult!9674)

(assert (=> b!1027544 (= e!579934 (ite ((_ is MissingVacant!9674) lt!452355) (MissingZero!9674 (index!41070 lt!452355)) lt!452355))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64632 (_ BitVec 32)) SeekEntryResult!9674)

(assert (=> b!1027544 (= lt!452355 (seekKeyOrZeroReturnVacant!0 (x!91436 lt!452353) (index!41069 lt!452353) (index!41069 lt!452353) key!909 (_keys!11238 thiss!1427) (mask!29809 thiss!1427)))))

(declare-fun d!122707 () Bool)

(declare-fun lt!452352 () SeekEntryResult!9674)

(assert (=> d!122707 (and (or ((_ is MissingVacant!9674) lt!452352) (not ((_ is Found!9674) lt!452352)) (and (bvsge (index!41068 lt!452352) #b00000000000000000000000000000000) (bvslt (index!41068 lt!452352) (size!31638 (_keys!11238 thiss!1427))))) (not ((_ is MissingVacant!9674) lt!452352)) (or (not ((_ is Found!9674) lt!452352)) (= (select (arr!31125 (_keys!11238 thiss!1427)) (index!41068 lt!452352)) key!909)))))

(assert (=> d!122707 (= lt!452352 e!579932)))

(declare-fun c!103577 () Bool)

(assert (=> d!122707 (= c!103577 (and ((_ is Intermediate!9674) lt!452353) (undefined!10486 lt!452353)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64632 (_ BitVec 32)) SeekEntryResult!9674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!122707 (= lt!452353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29809 thiss!1427)) key!909 (_keys!11238 thiss!1427) (mask!29809 thiss!1427)))))

(assert (=> d!122707 (validMask!0 (mask!29809 thiss!1427))))

(assert (=> d!122707 (= (seekEntry!0 key!909 (_keys!11238 thiss!1427) (mask!29809 thiss!1427)) lt!452352)))

(declare-fun b!1027545 () Bool)

(assert (=> b!1027545 (= e!579934 (MissingZero!9674 (index!41069 lt!452353)))))

(declare-fun b!1027546 () Bool)

(declare-fun c!103578 () Bool)

(declare-fun lt!452354 () (_ BitVec 64))

(assert (=> b!1027546 (= c!103578 (= lt!452354 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027546 (= e!579933 e!579934)))

(declare-fun b!1027547 () Bool)

(assert (=> b!1027547 (= e!579932 e!579933)))

(assert (=> b!1027547 (= lt!452354 (select (arr!31125 (_keys!11238 thiss!1427)) (index!41069 lt!452353)))))

(declare-fun c!103579 () Bool)

(assert (=> b!1027547 (= c!103579 (= lt!452354 key!909))))

(assert (= (and d!122707 c!103577) b!1027542))

(assert (= (and d!122707 (not c!103577)) b!1027547))

(assert (= (and b!1027547 c!103579) b!1027543))

(assert (= (and b!1027547 (not c!103579)) b!1027546))

(assert (= (and b!1027546 c!103578) b!1027545))

(assert (= (and b!1027546 (not c!103578)) b!1027544))

(declare-fun m!946087 () Bool)

(assert (=> b!1027544 m!946087))

(declare-fun m!946089 () Bool)

(assert (=> d!122707 m!946089))

(declare-fun m!946091 () Bool)

(assert (=> d!122707 m!946091))

(assert (=> d!122707 m!946091))

(declare-fun m!946093 () Bool)

(assert (=> d!122707 m!946093))

(declare-fun m!946095 () Bool)

(assert (=> d!122707 m!946095))

(declare-fun m!946097 () Bool)

(assert (=> b!1027547 m!946097))

(assert (=> b!1027504 d!122707))

(declare-fun d!122709 () Bool)

(declare-fun res!687750 () Bool)

(declare-fun e!579937 () Bool)

(assert (=> d!122709 (=> (not res!687750) (not e!579937))))

(declare-fun simpleValid!390 (LongMapFixedSize!5478) Bool)

(assert (=> d!122709 (= res!687750 (simpleValid!390 thiss!1427))))

(assert (=> d!122709 (= (valid!2074 thiss!1427) e!579937)))

(declare-fun b!1027554 () Bool)

(declare-fun res!687751 () Bool)

(assert (=> b!1027554 (=> (not res!687751) (not e!579937))))

(assert (=> b!1027554 (= res!687751 (= (arrayCountValidKeys!0 (_keys!11238 thiss!1427) #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) (_size!2794 thiss!1427)))))

(declare-fun b!1027555 () Bool)

(declare-fun res!687752 () Bool)

(assert (=> b!1027555 (=> (not res!687752) (not e!579937))))

(assert (=> b!1027555 (= res!687752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11238 thiss!1427) (mask!29809 thiss!1427)))))

(declare-fun b!1027556 () Bool)

(assert (=> b!1027556 (= e!579937 (arrayNoDuplicates!0 (_keys!11238 thiss!1427) #b00000000000000000000000000000000 Nil!21807))))

(assert (= (and d!122709 res!687750) b!1027554))

(assert (= (and b!1027554 res!687751) b!1027555))

(assert (= (and b!1027555 res!687752) b!1027556))

(declare-fun m!946099 () Bool)

(assert (=> d!122709 m!946099))

(assert (=> b!1027554 m!946033))

(declare-fun m!946101 () Bool)

(assert (=> b!1027555 m!946101))

(declare-fun m!946103 () Bool)

(assert (=> b!1027556 m!946103))

(assert (=> start!89572 d!122709))

(declare-fun d!122711 () Bool)

(declare-fun e!579940 () Bool)

(assert (=> d!122711 e!579940))

(declare-fun res!687755 () Bool)

(assert (=> d!122711 (=> (not res!687755) (not e!579940))))

(assert (=> d!122711 (= res!687755 (and (bvsge (index!41068 lt!452319) #b00000000000000000000000000000000) (bvslt (index!41068 lt!452319) (size!31638 (_keys!11238 thiss!1427)))))))

(declare-fun lt!452358 () Unit!33489)

(declare-fun choose!1681 (array!64632 array!64634 (_ BitVec 32) (_ BitVec 32) V!37261 V!37261 (_ BitVec 32) (_ BitVec 64) Int) Unit!33489)

(assert (=> d!122711 (= lt!452358 (choose!1681 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (index!41068 lt!452319) key!909 (defaultEntry!6091 thiss!1427)))))

(assert (=> d!122711 (validMask!0 (mask!29809 thiss!1427))))

(assert (=> d!122711 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!3 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (index!41068 lt!452319) key!909 (defaultEntry!6091 thiss!1427)) lt!452358)))

(declare-fun b!1027559 () Bool)

(assert (=> b!1027559 (= e!579940 (= (-!477 (getCurrentListMap!3898 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)) key!909) (getCurrentListMap!3898 (array!64633 (store (arr!31125 (_keys!11238 thiss!1427)) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31638 (_keys!11238 thiss!1427))) (array!64635 (store (arr!31126 (_values!6114 thiss!1427)) (index!41068 lt!452319) (ValueCellFull!11442 (dynLambda!1947 (defaultEntry!6091 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31639 (_values!6114 thiss!1427))) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427))))))

(assert (=> b!1027559 (bvslt (index!41068 lt!452319) (size!31639 (_values!6114 thiss!1427)))))

(assert (= (and d!122711 res!687755) b!1027559))

(declare-fun b_lambda!15727 () Bool)

(assert (=> (not b_lambda!15727) (not b!1027559)))

(assert (=> b!1027559 t!30874))

(declare-fun b_and!32827 () Bool)

(assert (= b_and!32821 (and (=> t!30874 result!14093) b_and!32827)))

(declare-fun m!946105 () Bool)

(assert (=> d!122711 m!946105))

(assert (=> d!122711 m!946095))

(assert (=> b!1027559 m!946037))

(assert (=> b!1027559 m!946019))

(assert (=> b!1027559 m!946021))

(declare-fun m!946107 () Bool)

(assert (=> b!1027559 m!946107))

(assert (=> b!1027559 m!946025))

(assert (=> b!1027559 m!946035))

(assert (=> b!1027559 m!946019))

(assert (=> b!1027500 d!122711))

(declare-fun d!122713 () Bool)

(declare-fun Unit!33493 () Unit!33489)

(declare-fun Unit!33494 () Unit!33489)

(declare-fun Unit!33495 () Unit!33489)

(declare-fun Unit!33496 () Unit!33489)

(declare-fun Unit!33497 () Unit!33489)

(declare-fun Unit!33498 () Unit!33489)

(declare-fun Unit!33499 () Unit!33489)

(declare-fun Unit!33500 () Unit!33489)

(declare-fun Unit!33501 () Unit!33489)

(declare-fun Unit!33502 () Unit!33489)

(declare-fun Unit!33503 () Unit!33489)

(declare-fun Unit!33504 () Unit!33489)

(declare-fun Unit!33505 () Unit!33489)

(declare-fun Unit!33506 () Unit!33489)

(declare-fun Unit!33507 () Unit!33489)

(declare-fun Unit!33508 () Unit!33489)

(declare-fun Unit!33509 () Unit!33489)

(declare-fun Unit!33510 () Unit!33489)

(declare-fun Unit!33511 () Unit!33489)

(declare-fun Unit!33512 () Unit!33489)

(declare-fun Unit!33513 () Unit!33489)

(declare-fun Unit!33514 () Unit!33489)

(declare-fun Unit!33515 () Unit!33489)

(declare-fun Unit!33516 () Unit!33489)

(declare-fun Unit!33517 () Unit!33489)

(declare-fun Unit!33518 () Unit!33489)

(declare-fun Unit!33519 () Unit!33489)

(declare-fun Unit!33520 () Unit!33489)

(declare-fun Unit!33521 () Unit!33489)

(declare-fun Unit!33522 () Unit!33489)

(declare-fun Unit!33523 () Unit!33489)

(declare-fun Unit!33524 () Unit!33489)

(declare-fun Unit!33525 () Unit!33489)

(declare-fun Unit!33526 () Unit!33489)

(declare-fun Unit!33527 () Unit!33489)

(declare-fun Unit!33528 () Unit!33489)

(declare-fun Unit!33529 () Unit!33489)

(declare-fun Unit!33530 () Unit!33489)

(declare-fun Unit!33531 () Unit!33489)

(declare-fun Unit!33532 () Unit!33489)

(declare-fun Unit!33533 () Unit!33489)

(declare-fun Unit!33534 () Unit!33489)

(declare-fun Unit!33535 () Unit!33489)

(declare-fun Unit!33536 () Unit!33489)

(declare-fun Unit!33537 () Unit!33489)

(declare-fun Unit!33538 () Unit!33489)

(declare-fun Unit!33539 () Unit!33489)

(declare-fun Unit!33540 () Unit!33489)

(declare-fun Unit!33541 () Unit!33489)

(declare-fun Unit!33542 () Unit!33489)

(declare-fun Unit!33543 () Unit!33489)

(declare-fun Unit!33544 () Unit!33489)

(declare-fun Unit!33545 () Unit!33489)

(declare-fun Unit!33546 () Unit!33489)

(declare-fun Unit!33547 () Unit!33489)

(declare-fun Unit!33548 () Unit!33489)

(declare-fun Unit!33549 () Unit!33489)

(declare-fun Unit!33550 () Unit!33489)

(declare-fun Unit!33551 () Unit!33489)

(declare-fun Unit!33552 () Unit!33489)

(assert (=> d!122713 (= (validMask!0 (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33493 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33494 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427))))))) (and (or (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33495 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33496 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000000000000111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33497 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33498 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000000000001111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33499 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33500 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000000000011111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33501 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33502 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000000000111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33503 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33504 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000000001111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33505 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33506 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000000011111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33507 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33508 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000000111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33509 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33510 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000001111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33511 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33512 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000011111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33513 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33514 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000000111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33515 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33516 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000001111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33517 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33518 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000011111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33519 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33520 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000000111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33521 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33522 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000001111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33523 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33524 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000011111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33525 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33526 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000000111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33527 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33528 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000001111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33529 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33530 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000011111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33531 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33532 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000000111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33533 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33534 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000001111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33535 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33536 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000011111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33537 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33538 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000000111111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33539 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33540 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000001111111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33541 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33542 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000011111111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33543 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33544 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00000111111111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33545 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33546 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00001111111111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33547 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33548 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00011111111111111111111111111111) (= (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33549 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33550 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00111111111111111111111111111111)) (bvsle (mask!29809 (_2!7776 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15531 Unit!33551 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (bvadd #b00000000000000000000000000000001 (_vacant!2794 thiss!1427)))) (tuple2!15531 Unit!33552 (LongMapFixedSize!5479 (defaultEntry!6091 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) (bvsub (_size!2794 thiss!1427) #b00000000000000000000000000000001) lt!452318 lt!452313 (_vacant!2794 thiss!1427)))))) #b00111111111111111111111111111111)))))

(assert (=> b!1027500 d!122713))

(declare-fun d!122715 () Bool)

(declare-fun e!579943 () Bool)

(assert (=> d!122715 e!579943))

(declare-fun res!687758 () Bool)

(assert (=> d!122715 (=> (not res!687758) (not e!579943))))

(assert (=> d!122715 (= res!687758 (bvslt (index!41068 lt!452319) (size!31638 (_keys!11238 thiss!1427))))))

(declare-fun lt!452361 () Unit!33489)

(declare-fun choose!121 (array!64632 (_ BitVec 32) (_ BitVec 64)) Unit!33489)

(assert (=> d!122715 (= lt!452361 (choose!121 (_keys!11238 thiss!1427) (index!41068 lt!452319) key!909))))

(assert (=> d!122715 (bvsge (index!41068 lt!452319) #b00000000000000000000000000000000)))

(assert (=> d!122715 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11238 thiss!1427) (index!41068 lt!452319) key!909) lt!452361)))

(declare-fun b!1027562 () Bool)

(assert (=> b!1027562 (= e!579943 (not (arrayContainsKey!0 (array!64633 (store (arr!31125 (_keys!11238 thiss!1427)) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31638 (_keys!11238 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!122715 res!687758) b!1027562))

(declare-fun m!946109 () Bool)

(assert (=> d!122715 m!946109))

(assert (=> b!1027562 m!946025))

(declare-fun m!946111 () Bool)

(assert (=> b!1027562 m!946111))

(assert (=> b!1027500 d!122715))

(declare-fun b!1027571 () Bool)

(declare-fun e!579952 () Bool)

(declare-fun e!579951 () Bool)

(assert (=> b!1027571 (= e!579952 e!579951)))

(declare-fun c!103582 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1027571 (= c!103582 (validKeyInArray!0 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)))))

(declare-fun bm!43242 () Bool)

(declare-fun call!43245 () Bool)

(assert (=> bm!43242 (= call!43245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452318 (mask!29809 thiss!1427)))))

(declare-fun b!1027572 () Bool)

(declare-fun e!579950 () Bool)

(assert (=> b!1027572 (= e!579951 e!579950)))

(declare-fun lt!452370 () (_ BitVec 64))

(assert (=> b!1027572 (= lt!452370 (select (arr!31125 lt!452318) #b00000000000000000000000000000000))))

(declare-fun lt!452369 () Unit!33489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64632 (_ BitVec 64) (_ BitVec 32)) Unit!33489)

(assert (=> b!1027572 (= lt!452369 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452318 lt!452370 #b00000000000000000000000000000000))))

(assert (=> b!1027572 (arrayContainsKey!0 lt!452318 lt!452370 #b00000000000000000000000000000000)))

(declare-fun lt!452368 () Unit!33489)

(assert (=> b!1027572 (= lt!452368 lt!452369)))

(declare-fun res!687764 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64632 (_ BitVec 32)) SeekEntryResult!9674)

(assert (=> b!1027572 (= res!687764 (= (seekEntryOrOpen!0 (select (arr!31125 lt!452318) #b00000000000000000000000000000000) lt!452318 (mask!29809 thiss!1427)) (Found!9674 #b00000000000000000000000000000000)))))

(assert (=> b!1027572 (=> (not res!687764) (not e!579950))))

(declare-fun d!122717 () Bool)

(declare-fun res!687763 () Bool)

(assert (=> d!122717 (=> res!687763 e!579952)))

(assert (=> d!122717 (= res!687763 (bvsge #b00000000000000000000000000000000 (size!31638 lt!452318)))))

(assert (=> d!122717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452318 (mask!29809 thiss!1427)) e!579952)))

(declare-fun b!1027573 () Bool)

(assert (=> b!1027573 (= e!579951 call!43245)))

(declare-fun b!1027574 () Bool)

(assert (=> b!1027574 (= e!579950 call!43245)))

(assert (= (and d!122717 (not res!687763)) b!1027571))

(assert (= (and b!1027571 c!103582) b!1027572))

(assert (= (and b!1027571 (not c!103582)) b!1027573))

(assert (= (and b!1027572 res!687764) b!1027574))

(assert (= (or b!1027574 b!1027573) bm!43242))

(declare-fun m!946113 () Bool)

(assert (=> b!1027571 m!946113))

(assert (=> b!1027571 m!946113))

(declare-fun m!946115 () Bool)

(assert (=> b!1027571 m!946115))

(declare-fun m!946117 () Bool)

(assert (=> bm!43242 m!946117))

(assert (=> b!1027572 m!946113))

(declare-fun m!946119 () Bool)

(assert (=> b!1027572 m!946119))

(declare-fun m!946121 () Bool)

(assert (=> b!1027572 m!946121))

(assert (=> b!1027572 m!946113))

(declare-fun m!946123 () Bool)

(assert (=> b!1027572 m!946123))

(assert (=> b!1027500 d!122717))

(declare-fun bm!43257 () Bool)

(declare-fun call!43263 () ListLongMap!13669)

(declare-fun call!43264 () ListLongMap!13669)

(assert (=> bm!43257 (= call!43263 call!43264)))

(declare-fun bm!43258 () Bool)

(declare-fun call!43265 () Bool)

(declare-fun lt!452435 () ListLongMap!13669)

(declare-fun contains!5962 (ListLongMap!13669 (_ BitVec 64)) Bool)

(assert (=> bm!43258 (= call!43265 (contains!5962 lt!452435 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027617 () Bool)

(declare-fun e!579986 () ListLongMap!13669)

(declare-fun call!43260 () ListLongMap!13669)

(declare-fun +!3097 (ListLongMap!13669 tuple2!15532) ListLongMap!13669)

(assert (=> b!1027617 (= e!579986 (+!3097 call!43260 (tuple2!15533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5927 thiss!1427))))))

(declare-fun b!1027618 () Bool)

(declare-fun e!579985 () Bool)

(declare-fun call!43261 () Bool)

(assert (=> b!1027618 (= e!579985 (not call!43261))))

(declare-fun b!1027619 () Bool)

(declare-fun res!687783 () Bool)

(declare-fun e!579980 () Bool)

(assert (=> b!1027619 (=> (not res!687783) (not e!579980))))

(assert (=> b!1027619 (= res!687783 e!579985)))

(declare-fun c!103600 () Bool)

(assert (=> b!1027619 (= c!103600 (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43259 () Bool)

(declare-fun call!43266 () ListLongMap!13669)

(assert (=> bm!43259 (= call!43266 call!43260)))

(declare-fun b!1027620 () Bool)

(declare-fun e!579983 () Bool)

(declare-fun apply!899 (ListLongMap!13669 (_ BitVec 64)) V!37261)

(assert (=> b!1027620 (= e!579983 (= (apply!899 lt!452435 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5927 thiss!1427)))))

(declare-fun b!1027621 () Bool)

(declare-fun c!103597 () Bool)

(assert (=> b!1027621 (= c!103597 (and (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!579984 () ListLongMap!13669)

(declare-fun e!579981 () ListLongMap!13669)

(assert (=> b!1027621 (= e!579984 e!579981)))

(declare-fun b!1027622 () Bool)

(declare-fun e!579989 () Bool)

(assert (=> b!1027622 (= e!579980 e!579989)))

(declare-fun c!103595 () Bool)

(assert (=> b!1027622 (= c!103595 (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027623 () Bool)

(declare-fun e!579990 () Bool)

(assert (=> b!1027623 (= e!579990 (validKeyInArray!0 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43260 () Bool)

(assert (=> bm!43260 (= call!43261 (contains!5962 lt!452435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027624 () Bool)

(declare-fun e!579988 () Bool)

(assert (=> b!1027624 (= e!579988 (= (apply!899 lt!452435 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5927 thiss!1427)))))

(declare-fun d!122719 () Bool)

(assert (=> d!122719 e!579980))

(declare-fun res!687787 () Bool)

(assert (=> d!122719 (=> (not res!687787) (not e!579980))))

(assert (=> d!122719 (= res!687787 (or (bvsge #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))))))))

(declare-fun lt!452427 () ListLongMap!13669)

(assert (=> d!122719 (= lt!452435 lt!452427)))

(declare-fun lt!452426 () Unit!33489)

(declare-fun e!579979 () Unit!33489)

(assert (=> d!122719 (= lt!452426 e!579979)))

(declare-fun c!103598 () Bool)

(declare-fun e!579987 () Bool)

(assert (=> d!122719 (= c!103598 e!579987)))

(declare-fun res!687791 () Bool)

(assert (=> d!122719 (=> (not res!687791) (not e!579987))))

(assert (=> d!122719 (= res!687791 (bvslt #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))))))

(assert (=> d!122719 (= lt!452427 e!579986)))

(declare-fun c!103596 () Bool)

(assert (=> d!122719 (= c!103596 (and (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122719 (validMask!0 (mask!29809 thiss!1427))))

(assert (=> d!122719 (= (getCurrentListMap!3898 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)) lt!452435)))

(declare-fun b!1027625 () Bool)

(assert (=> b!1027625 (= e!579985 e!579983)))

(declare-fun res!687785 () Bool)

(assert (=> b!1027625 (= res!687785 call!43261)))

(assert (=> b!1027625 (=> (not res!687785) (not e!579983))))

(declare-fun c!103599 () Bool)

(declare-fun bm!43261 () Bool)

(declare-fun call!43262 () ListLongMap!13669)

(assert (=> bm!43261 (= call!43260 (+!3097 (ite c!103596 call!43264 (ite c!103599 call!43263 call!43262)) (ite (or c!103596 c!103599) (tuple2!15533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5927 thiss!1427)) (tuple2!15533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5927 thiss!1427)))))))

(declare-fun b!1027626 () Bool)

(assert (=> b!1027626 (= e!579984 call!43266)))

(declare-fun bm!43262 () Bool)

(assert (=> bm!43262 (= call!43262 call!43263)))

(declare-fun b!1027627 () Bool)

(declare-fun e!579991 () Bool)

(declare-fun get!16338 (ValueCell!11442 V!37261) V!37261)

(assert (=> b!1027627 (= e!579991 (= (apply!899 lt!452435 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000)) (get!16338 (select (arr!31126 (_values!6114 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1947 (defaultEntry!6091 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027627 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31639 (_values!6114 thiss!1427))))))

(assert (=> b!1027627 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))))))

(declare-fun b!1027628 () Bool)

(assert (=> b!1027628 (= e!579987 (validKeyInArray!0 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1027629 () Bool)

(declare-fun res!687790 () Bool)

(assert (=> b!1027629 (=> (not res!687790) (not e!579980))))

(declare-fun e!579982 () Bool)

(assert (=> b!1027629 (= res!687790 e!579982)))

(declare-fun res!687789 () Bool)

(assert (=> b!1027629 (=> res!687789 e!579982)))

(assert (=> b!1027629 (= res!687789 (not e!579990))))

(declare-fun res!687788 () Bool)

(assert (=> b!1027629 (=> (not res!687788) (not e!579990))))

(assert (=> b!1027629 (= res!687788 (bvslt #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))))))

(declare-fun b!1027630 () Bool)

(assert (=> b!1027630 (= e!579982 e!579991)))

(declare-fun res!687786 () Bool)

(assert (=> b!1027630 (=> (not res!687786) (not e!579991))))

(assert (=> b!1027630 (= res!687786 (contains!5962 lt!452435 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1027630 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))))))

(declare-fun b!1027631 () Bool)

(declare-fun Unit!33553 () Unit!33489)

(assert (=> b!1027631 (= e!579979 Unit!33553)))

(declare-fun b!1027632 () Bool)

(assert (=> b!1027632 (= e!579981 call!43262)))

(declare-fun bm!43263 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3513 (array!64632 array!64634 (_ BitVec 32) (_ BitVec 32) V!37261 V!37261 (_ BitVec 32) Int) ListLongMap!13669)

(assert (=> bm!43263 (= call!43264 (getCurrentListMapNoExtraKeys!3513 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun b!1027633 () Bool)

(assert (=> b!1027633 (= e!579989 (not call!43265))))

(declare-fun b!1027634 () Bool)

(assert (=> b!1027634 (= e!579986 e!579984)))

(assert (=> b!1027634 (= c!103599 (and (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027635 () Bool)

(assert (=> b!1027635 (= e!579981 call!43266)))

(declare-fun b!1027636 () Bool)

(declare-fun lt!452420 () Unit!33489)

(assert (=> b!1027636 (= e!579979 lt!452420)))

(declare-fun lt!452415 () ListLongMap!13669)

(assert (=> b!1027636 (= lt!452415 (getCurrentListMapNoExtraKeys!3513 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun lt!452424 () (_ BitVec 64))

(assert (=> b!1027636 (= lt!452424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452432 () (_ BitVec 64))

(assert (=> b!1027636 (= lt!452432 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452436 () Unit!33489)

(declare-fun addStillContains!618 (ListLongMap!13669 (_ BitVec 64) V!37261 (_ BitVec 64)) Unit!33489)

(assert (=> b!1027636 (= lt!452436 (addStillContains!618 lt!452415 lt!452424 (zeroValue!5927 thiss!1427) lt!452432))))

(assert (=> b!1027636 (contains!5962 (+!3097 lt!452415 (tuple2!15533 lt!452424 (zeroValue!5927 thiss!1427))) lt!452432)))

(declare-fun lt!452417 () Unit!33489)

(assert (=> b!1027636 (= lt!452417 lt!452436)))

(declare-fun lt!452419 () ListLongMap!13669)

(assert (=> b!1027636 (= lt!452419 (getCurrentListMapNoExtraKeys!3513 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun lt!452418 () (_ BitVec 64))

(assert (=> b!1027636 (= lt!452418 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452422 () (_ BitVec 64))

(assert (=> b!1027636 (= lt!452422 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452430 () Unit!33489)

(declare-fun addApplyDifferent!478 (ListLongMap!13669 (_ BitVec 64) V!37261 (_ BitVec 64)) Unit!33489)

(assert (=> b!1027636 (= lt!452430 (addApplyDifferent!478 lt!452419 lt!452418 (minValue!5927 thiss!1427) lt!452422))))

(assert (=> b!1027636 (= (apply!899 (+!3097 lt!452419 (tuple2!15533 lt!452418 (minValue!5927 thiss!1427))) lt!452422) (apply!899 lt!452419 lt!452422))))

(declare-fun lt!452433 () Unit!33489)

(assert (=> b!1027636 (= lt!452433 lt!452430)))

(declare-fun lt!452428 () ListLongMap!13669)

(assert (=> b!1027636 (= lt!452428 (getCurrentListMapNoExtraKeys!3513 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun lt!452416 () (_ BitVec 64))

(assert (=> b!1027636 (= lt!452416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452421 () (_ BitVec 64))

(assert (=> b!1027636 (= lt!452421 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452431 () Unit!33489)

(assert (=> b!1027636 (= lt!452431 (addApplyDifferent!478 lt!452428 lt!452416 (zeroValue!5927 thiss!1427) lt!452421))))

(assert (=> b!1027636 (= (apply!899 (+!3097 lt!452428 (tuple2!15533 lt!452416 (zeroValue!5927 thiss!1427))) lt!452421) (apply!899 lt!452428 lt!452421))))

(declare-fun lt!452423 () Unit!33489)

(assert (=> b!1027636 (= lt!452423 lt!452431)))

(declare-fun lt!452434 () ListLongMap!13669)

(assert (=> b!1027636 (= lt!452434 (getCurrentListMapNoExtraKeys!3513 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun lt!452429 () (_ BitVec 64))

(assert (=> b!1027636 (= lt!452429 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452425 () (_ BitVec 64))

(assert (=> b!1027636 (= lt!452425 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027636 (= lt!452420 (addApplyDifferent!478 lt!452434 lt!452429 (minValue!5927 thiss!1427) lt!452425))))

(assert (=> b!1027636 (= (apply!899 (+!3097 lt!452434 (tuple2!15533 lt!452429 (minValue!5927 thiss!1427))) lt!452425) (apply!899 lt!452434 lt!452425))))

(declare-fun b!1027637 () Bool)

(assert (=> b!1027637 (= e!579989 e!579988)))

(declare-fun res!687784 () Bool)

(assert (=> b!1027637 (= res!687784 call!43265)))

(assert (=> b!1027637 (=> (not res!687784) (not e!579988))))

(assert (= (and d!122719 c!103596) b!1027617))

(assert (= (and d!122719 (not c!103596)) b!1027634))

(assert (= (and b!1027634 c!103599) b!1027626))

(assert (= (and b!1027634 (not c!103599)) b!1027621))

(assert (= (and b!1027621 c!103597) b!1027635))

(assert (= (and b!1027621 (not c!103597)) b!1027632))

(assert (= (or b!1027635 b!1027632) bm!43262))

(assert (= (or b!1027626 bm!43262) bm!43257))

(assert (= (or b!1027626 b!1027635) bm!43259))

(assert (= (or b!1027617 bm!43257) bm!43263))

(assert (= (or b!1027617 bm!43259) bm!43261))

(assert (= (and d!122719 res!687791) b!1027628))

(assert (= (and d!122719 c!103598) b!1027636))

(assert (= (and d!122719 (not c!103598)) b!1027631))

(assert (= (and d!122719 res!687787) b!1027629))

(assert (= (and b!1027629 res!687788) b!1027623))

(assert (= (and b!1027629 (not res!687789)) b!1027630))

(assert (= (and b!1027630 res!687786) b!1027627))

(assert (= (and b!1027629 res!687790) b!1027619))

(assert (= (and b!1027619 c!103600) b!1027625))

(assert (= (and b!1027619 (not c!103600)) b!1027618))

(assert (= (and b!1027625 res!687785) b!1027620))

(assert (= (or b!1027625 b!1027618) bm!43260))

(assert (= (and b!1027619 res!687783) b!1027622))

(assert (= (and b!1027622 c!103595) b!1027637))

(assert (= (and b!1027622 (not c!103595)) b!1027633))

(assert (= (and b!1027637 res!687784) b!1027624))

(assert (= (or b!1027637 b!1027633) bm!43258))

(declare-fun b_lambda!15729 () Bool)

(assert (=> (not b_lambda!15729) (not b!1027627)))

(assert (=> b!1027627 t!30874))

(declare-fun b_and!32829 () Bool)

(assert (= b_and!32827 (and (=> t!30874 result!14093) b_and!32829)))

(declare-fun m!946125 () Bool)

(assert (=> b!1027636 m!946125))

(declare-fun m!946127 () Bool)

(assert (=> b!1027636 m!946127))

(declare-fun m!946129 () Bool)

(assert (=> b!1027636 m!946129))

(declare-fun m!946131 () Bool)

(assert (=> b!1027636 m!946131))

(declare-fun m!946133 () Bool)

(assert (=> b!1027636 m!946133))

(assert (=> b!1027636 m!946125))

(declare-fun m!946135 () Bool)

(assert (=> b!1027636 m!946135))

(declare-fun m!946137 () Bool)

(assert (=> b!1027636 m!946137))

(declare-fun m!946139 () Bool)

(assert (=> b!1027636 m!946139))

(assert (=> b!1027636 m!946139))

(declare-fun m!946141 () Bool)

(assert (=> b!1027636 m!946141))

(declare-fun m!946143 () Bool)

(assert (=> b!1027636 m!946143))

(declare-fun m!946145 () Bool)

(assert (=> b!1027636 m!946145))

(declare-fun m!946147 () Bool)

(assert (=> b!1027636 m!946147))

(assert (=> b!1027636 m!946127))

(declare-fun m!946149 () Bool)

(assert (=> b!1027636 m!946149))

(declare-fun m!946151 () Bool)

(assert (=> b!1027636 m!946151))

(declare-fun m!946153 () Bool)

(assert (=> b!1027636 m!946153))

(declare-fun m!946155 () Bool)

(assert (=> b!1027636 m!946155))

(assert (=> b!1027636 m!946153))

(declare-fun m!946157 () Bool)

(assert (=> b!1027636 m!946157))

(assert (=> b!1027628 m!946137))

(assert (=> b!1027628 m!946137))

(declare-fun m!946159 () Bool)

(assert (=> b!1027628 m!946159))

(assert (=> b!1027630 m!946137))

(assert (=> b!1027630 m!946137))

(declare-fun m!946161 () Bool)

(assert (=> b!1027630 m!946161))

(declare-fun m!946163 () Bool)

(assert (=> b!1027617 m!946163))

(declare-fun m!946165 () Bool)

(assert (=> b!1027624 m!946165))

(declare-fun m!946167 () Bool)

(assert (=> bm!43258 m!946167))

(declare-fun m!946169 () Bool)

(assert (=> b!1027620 m!946169))

(assert (=> bm!43263 m!946147))

(assert (=> d!122719 m!946095))

(declare-fun m!946171 () Bool)

(assert (=> bm!43260 m!946171))

(assert (=> b!1027623 m!946137))

(assert (=> b!1027623 m!946137))

(assert (=> b!1027623 m!946159))

(assert (=> b!1027627 m!946037))

(assert (=> b!1027627 m!946137))

(declare-fun m!946173 () Bool)

(assert (=> b!1027627 m!946173))

(declare-fun m!946175 () Bool)

(assert (=> b!1027627 m!946175))

(assert (=> b!1027627 m!946037))

(declare-fun m!946177 () Bool)

(assert (=> b!1027627 m!946177))

(assert (=> b!1027627 m!946175))

(assert (=> b!1027627 m!946137))

(declare-fun m!946179 () Bool)

(assert (=> bm!43261 m!946179))

(assert (=> b!1027500 d!122719))

(declare-fun d!122721 () Bool)

(declare-fun lt!452439 () ListLongMap!13669)

(assert (=> d!122721 (not (contains!5962 lt!452439 key!909))))

(declare-fun removeStrictlySorted!49 (List!21809 (_ BitVec 64)) List!21809)

(assert (=> d!122721 (= lt!452439 (ListLongMap!13670 (removeStrictlySorted!49 (toList!6850 (getCurrentListMap!3898 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427))) key!909)))))

(assert (=> d!122721 (= (-!477 (getCurrentListMap!3898 (_keys!11238 thiss!1427) (_values!6114 thiss!1427) (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)) key!909) lt!452439)))

(declare-fun bs!29990 () Bool)

(assert (= bs!29990 d!122721))

(declare-fun m!946181 () Bool)

(assert (=> bs!29990 m!946181))

(declare-fun m!946183 () Bool)

(assert (=> bs!29990 m!946183))

(assert (=> b!1027500 d!122721))

(declare-fun d!122723 () Bool)

(declare-fun res!687796 () Bool)

(declare-fun e!579996 () Bool)

(assert (=> d!122723 (=> res!687796 e!579996)))

(assert (=> d!122723 (= res!687796 (= (select (arr!31125 lt!452318) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122723 (= (arrayContainsKey!0 lt!452318 key!909 #b00000000000000000000000000000000) e!579996)))

(declare-fun b!1027642 () Bool)

(declare-fun e!579997 () Bool)

(assert (=> b!1027642 (= e!579996 e!579997)))

(declare-fun res!687797 () Bool)

(assert (=> b!1027642 (=> (not res!687797) (not e!579997))))

(assert (=> b!1027642 (= res!687797 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31638 lt!452318)))))

(declare-fun b!1027643 () Bool)

(assert (=> b!1027643 (= e!579997 (arrayContainsKey!0 lt!452318 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122723 (not res!687796)) b!1027642))

(assert (= (and b!1027642 res!687797) b!1027643))

(assert (=> d!122723 m!946113))

(declare-fun m!946185 () Bool)

(assert (=> b!1027643 m!946185))

(assert (=> b!1027500 d!122723))

(declare-fun b!1027655 () Bool)

(declare-fun e!580003 () Bool)

(assert (=> b!1027655 (= e!580003 (= (arrayCountValidKeys!0 (array!64633 (store (arr!31125 (_keys!11238 thiss!1427)) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31638 (_keys!11238 thiss!1427))) #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11238 thiss!1427) #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1027653 () Bool)

(declare-fun res!687809 () Bool)

(declare-fun e!580002 () Bool)

(assert (=> b!1027653 (=> (not res!687809) (not e!580002))))

(assert (=> b!1027653 (= res!687809 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1027654 () Bool)

(assert (=> b!1027654 (= e!580002 (bvslt (size!31638 (_keys!11238 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1027652 () Bool)

(declare-fun res!687806 () Bool)

(assert (=> b!1027652 (=> (not res!687806) (not e!580002))))

(assert (=> b!1027652 (= res!687806 (validKeyInArray!0 (select (arr!31125 (_keys!11238 thiss!1427)) (index!41068 lt!452319))))))

(declare-fun d!122725 () Bool)

(assert (=> d!122725 e!580003))

(declare-fun res!687807 () Bool)

(assert (=> d!122725 (=> (not res!687807) (not e!580003))))

(assert (=> d!122725 (= res!687807 (and (bvsge (index!41068 lt!452319) #b00000000000000000000000000000000) (bvslt (index!41068 lt!452319) (size!31638 (_keys!11238 thiss!1427)))))))

(declare-fun lt!452442 () Unit!33489)

(declare-fun choose!82 (array!64632 (_ BitVec 32) (_ BitVec 64)) Unit!33489)

(assert (=> d!122725 (= lt!452442 (choose!82 (_keys!11238 thiss!1427) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122725 e!580002))

(declare-fun res!687808 () Bool)

(assert (=> d!122725 (=> (not res!687808) (not e!580002))))

(assert (=> d!122725 (= res!687808 (and (bvsge (index!41068 lt!452319) #b00000000000000000000000000000000) (bvslt (index!41068 lt!452319) (size!31638 (_keys!11238 thiss!1427)))))))

(assert (=> d!122725 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11238 thiss!1427) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000) lt!452442)))

(assert (= (and d!122725 res!687808) b!1027652))

(assert (= (and b!1027652 res!687806) b!1027653))

(assert (= (and b!1027653 res!687809) b!1027654))

(assert (= (and d!122725 res!687807) b!1027655))

(assert (=> b!1027655 m!946025))

(declare-fun m!946187 () Bool)

(assert (=> b!1027655 m!946187))

(assert (=> b!1027655 m!946033))

(declare-fun m!946189 () Bool)

(assert (=> b!1027653 m!946189))

(declare-fun m!946191 () Bool)

(assert (=> b!1027652 m!946191))

(assert (=> b!1027652 m!946191))

(declare-fun m!946193 () Bool)

(assert (=> b!1027652 m!946193))

(declare-fun m!946195 () Bool)

(assert (=> d!122725 m!946195))

(assert (=> b!1027500 d!122725))

(declare-fun d!122727 () Bool)

(declare-fun e!580006 () Bool)

(assert (=> d!122727 e!580006))

(declare-fun res!687812 () Bool)

(assert (=> d!122727 (=> (not res!687812) (not e!580006))))

(assert (=> d!122727 (= res!687812 (and (bvsge (index!41068 lt!452319) #b00000000000000000000000000000000) (bvslt (index!41068 lt!452319) (size!31638 (_keys!11238 thiss!1427)))))))

(declare-fun lt!452445 () Unit!33489)

(declare-fun choose!25 (array!64632 (_ BitVec 32) (_ BitVec 32)) Unit!33489)

(assert (=> d!122727 (= lt!452445 (choose!25 (_keys!11238 thiss!1427) (index!41068 lt!452319) (mask!29809 thiss!1427)))))

(assert (=> d!122727 (validMask!0 (mask!29809 thiss!1427))))

(assert (=> d!122727 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11238 thiss!1427) (index!41068 lt!452319) (mask!29809 thiss!1427)) lt!452445)))

(declare-fun b!1027658 () Bool)

(assert (=> b!1027658 (= e!580006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64633 (store (arr!31125 (_keys!11238 thiss!1427)) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31638 (_keys!11238 thiss!1427))) (mask!29809 thiss!1427)))))

(assert (= (and d!122727 res!687812) b!1027658))

(declare-fun m!946197 () Bool)

(assert (=> d!122727 m!946197))

(assert (=> d!122727 m!946095))

(assert (=> b!1027658 m!946025))

(declare-fun m!946199 () Bool)

(assert (=> b!1027658 m!946199))

(assert (=> b!1027500 d!122727))

(declare-fun b!1027667 () Bool)

(declare-fun e!580012 () (_ BitVec 32))

(assert (=> b!1027667 (= e!580012 #b00000000000000000000000000000000)))

(declare-fun d!122729 () Bool)

(declare-fun lt!452448 () (_ BitVec 32))

(assert (=> d!122729 (and (bvsge lt!452448 #b00000000000000000000000000000000) (bvsle lt!452448 (bvsub (size!31638 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122729 (= lt!452448 e!580012)))

(declare-fun c!103605 () Bool)

(assert (=> d!122729 (= c!103605 (bvsge #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))))))

(assert (=> d!122729 (and (bvsle #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31638 (_keys!11238 thiss!1427)) (size!31638 (_keys!11238 thiss!1427))))))

(assert (=> d!122729 (= (arrayCountValidKeys!0 (_keys!11238 thiss!1427) #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) lt!452448)))

(declare-fun bm!43266 () Bool)

(declare-fun call!43269 () (_ BitVec 32))

(assert (=> bm!43266 (= call!43269 (arrayCountValidKeys!0 (_keys!11238 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31638 (_keys!11238 thiss!1427))))))

(declare-fun b!1027668 () Bool)

(declare-fun e!580011 () (_ BitVec 32))

(assert (=> b!1027668 (= e!580012 e!580011)))

(declare-fun c!103606 () Bool)

(assert (=> b!1027668 (= c!103606 (validKeyInArray!0 (select (arr!31125 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1027669 () Bool)

(assert (=> b!1027669 (= e!580011 (bvadd #b00000000000000000000000000000001 call!43269))))

(declare-fun b!1027670 () Bool)

(assert (=> b!1027670 (= e!580011 call!43269)))

(assert (= (and d!122729 c!103605) b!1027667))

(assert (= (and d!122729 (not c!103605)) b!1027668))

(assert (= (and b!1027668 c!103606) b!1027669))

(assert (= (and b!1027668 (not c!103606)) b!1027670))

(assert (= (or b!1027669 b!1027670) bm!43266))

(declare-fun m!946201 () Bool)

(assert (=> bm!43266 m!946201))

(assert (=> b!1027668 m!946137))

(assert (=> b!1027668 m!946137))

(assert (=> b!1027668 m!946159))

(assert (=> b!1027500 d!122729))

(declare-fun b!1027671 () Bool)

(declare-fun e!580014 () (_ BitVec 32))

(assert (=> b!1027671 (= e!580014 #b00000000000000000000000000000000)))

(declare-fun d!122731 () Bool)

(declare-fun lt!452449 () (_ BitVec 32))

(assert (=> d!122731 (and (bvsge lt!452449 #b00000000000000000000000000000000) (bvsle lt!452449 (bvsub (size!31638 lt!452318) #b00000000000000000000000000000000)))))

(assert (=> d!122731 (= lt!452449 e!580014)))

(declare-fun c!103607 () Bool)

(assert (=> d!122731 (= c!103607 (bvsge #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))))))

(assert (=> d!122731 (and (bvsle #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31638 (_keys!11238 thiss!1427)) (size!31638 lt!452318)))))

(assert (=> d!122731 (= (arrayCountValidKeys!0 lt!452318 #b00000000000000000000000000000000 (size!31638 (_keys!11238 thiss!1427))) lt!452449)))

(declare-fun bm!43267 () Bool)

(declare-fun call!43270 () (_ BitVec 32))

(assert (=> bm!43267 (= call!43270 (arrayCountValidKeys!0 lt!452318 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31638 (_keys!11238 thiss!1427))))))

(declare-fun b!1027672 () Bool)

(declare-fun e!580013 () (_ BitVec 32))

(assert (=> b!1027672 (= e!580014 e!580013)))

(declare-fun c!103608 () Bool)

(assert (=> b!1027672 (= c!103608 (validKeyInArray!0 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)))))

(declare-fun b!1027673 () Bool)

(assert (=> b!1027673 (= e!580013 (bvadd #b00000000000000000000000000000001 call!43270))))

(declare-fun b!1027674 () Bool)

(assert (=> b!1027674 (= e!580013 call!43270)))

(assert (= (and d!122731 c!103607) b!1027671))

(assert (= (and d!122731 (not c!103607)) b!1027672))

(assert (= (and b!1027672 c!103608) b!1027673))

(assert (= (and b!1027672 (not c!103608)) b!1027674))

(assert (= (or b!1027673 b!1027674) bm!43267))

(declare-fun m!946203 () Bool)

(assert (=> bm!43267 m!946203))

(assert (=> b!1027672 m!946113))

(assert (=> b!1027672 m!946113))

(assert (=> b!1027672 m!946115))

(assert (=> b!1027500 d!122731))

(declare-fun d!122733 () Bool)

(declare-fun e!580017 () Bool)

(assert (=> d!122733 e!580017))

(declare-fun res!687815 () Bool)

(assert (=> d!122733 (=> (not res!687815) (not e!580017))))

(assert (=> d!122733 (= res!687815 (and (bvsge (index!41068 lt!452319) #b00000000000000000000000000000000) (bvslt (index!41068 lt!452319) (size!31638 (_keys!11238 thiss!1427)))))))

(declare-fun lt!452452 () Unit!33489)

(declare-fun choose!53 (array!64632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21810) Unit!33489)

(assert (=> d!122733 (= lt!452452 (choose!53 (_keys!11238 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41068 lt!452319) #b00000000000000000000000000000000 Nil!21807))))

(assert (=> d!122733 (bvslt (size!31638 (_keys!11238 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!122733 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11238 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41068 lt!452319) #b00000000000000000000000000000000 Nil!21807) lt!452452)))

(declare-fun b!1027677 () Bool)

(assert (=> b!1027677 (= e!580017 (arrayNoDuplicates!0 (array!64633 (store (arr!31125 (_keys!11238 thiss!1427)) (index!41068 lt!452319) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31638 (_keys!11238 thiss!1427))) #b00000000000000000000000000000000 Nil!21807))))

(assert (= (and d!122733 res!687815) b!1027677))

(declare-fun m!946205 () Bool)

(assert (=> d!122733 m!946205))

(assert (=> b!1027677 m!946025))

(declare-fun m!946207 () Bool)

(assert (=> b!1027677 m!946207))

(assert (=> b!1027500 d!122733))

(declare-fun bm!43268 () Bool)

(declare-fun call!43274 () ListLongMap!13669)

(declare-fun call!43275 () ListLongMap!13669)

(assert (=> bm!43268 (= call!43274 call!43275)))

(declare-fun bm!43269 () Bool)

(declare-fun call!43276 () Bool)

(declare-fun lt!452473 () ListLongMap!13669)

(assert (=> bm!43269 (= call!43276 (contains!5962 lt!452473 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027678 () Bool)

(declare-fun e!580025 () ListLongMap!13669)

(declare-fun call!43271 () ListLongMap!13669)

(assert (=> b!1027678 (= e!580025 (+!3097 call!43271 (tuple2!15533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5927 thiss!1427))))))

(declare-fun b!1027679 () Bool)

(declare-fun e!580024 () Bool)

(declare-fun call!43272 () Bool)

(assert (=> b!1027679 (= e!580024 (not call!43272))))

(declare-fun b!1027680 () Bool)

(declare-fun res!687816 () Bool)

(declare-fun e!580019 () Bool)

(assert (=> b!1027680 (=> (not res!687816) (not e!580019))))

(assert (=> b!1027680 (= res!687816 e!580024)))

(declare-fun c!103614 () Bool)

(assert (=> b!1027680 (= c!103614 (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43270 () Bool)

(declare-fun call!43277 () ListLongMap!13669)

(assert (=> bm!43270 (= call!43277 call!43271)))

(declare-fun b!1027681 () Bool)

(declare-fun e!580022 () Bool)

(assert (=> b!1027681 (= e!580022 (= (apply!899 lt!452473 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5927 thiss!1427)))))

(declare-fun b!1027682 () Bool)

(declare-fun c!103611 () Bool)

(assert (=> b!1027682 (= c!103611 (and (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!580023 () ListLongMap!13669)

(declare-fun e!580020 () ListLongMap!13669)

(assert (=> b!1027682 (= e!580023 e!580020)))

(declare-fun b!1027683 () Bool)

(declare-fun e!580028 () Bool)

(assert (=> b!1027683 (= e!580019 e!580028)))

(declare-fun c!103609 () Bool)

(assert (=> b!1027683 (= c!103609 (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027684 () Bool)

(declare-fun e!580029 () Bool)

(assert (=> b!1027684 (= e!580029 (validKeyInArray!0 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)))))

(declare-fun bm!43271 () Bool)

(assert (=> bm!43271 (= call!43272 (contains!5962 lt!452473 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027685 () Bool)

(declare-fun e!580027 () Bool)

(assert (=> b!1027685 (= e!580027 (= (apply!899 lt!452473 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5927 thiss!1427)))))

(declare-fun d!122735 () Bool)

(assert (=> d!122735 e!580019))

(declare-fun res!687820 () Bool)

(assert (=> d!122735 (=> (not res!687820) (not e!580019))))

(assert (=> d!122735 (= res!687820 (or (bvsge #b00000000000000000000000000000000 (size!31638 lt!452318)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31638 lt!452318)))))))

(declare-fun lt!452465 () ListLongMap!13669)

(assert (=> d!122735 (= lt!452473 lt!452465)))

(declare-fun lt!452464 () Unit!33489)

(declare-fun e!580018 () Unit!33489)

(assert (=> d!122735 (= lt!452464 e!580018)))

(declare-fun c!103612 () Bool)

(declare-fun e!580026 () Bool)

(assert (=> d!122735 (= c!103612 e!580026)))

(declare-fun res!687824 () Bool)

(assert (=> d!122735 (=> (not res!687824) (not e!580026))))

(assert (=> d!122735 (= res!687824 (bvslt #b00000000000000000000000000000000 (size!31638 lt!452318)))))

(assert (=> d!122735 (= lt!452465 e!580025)))

(declare-fun c!103610 () Bool)

(assert (=> d!122735 (= c!103610 (and (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122735 (validMask!0 (mask!29809 thiss!1427))))

(assert (=> d!122735 (= (getCurrentListMap!3898 lt!452318 lt!452313 (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)) lt!452473)))

(declare-fun b!1027686 () Bool)

(assert (=> b!1027686 (= e!580024 e!580022)))

(declare-fun res!687818 () Bool)

(assert (=> b!1027686 (= res!687818 call!43272)))

(assert (=> b!1027686 (=> (not res!687818) (not e!580022))))

(declare-fun c!103613 () Bool)

(declare-fun call!43273 () ListLongMap!13669)

(declare-fun bm!43272 () Bool)

(assert (=> bm!43272 (= call!43271 (+!3097 (ite c!103610 call!43275 (ite c!103613 call!43274 call!43273)) (ite (or c!103610 c!103613) (tuple2!15533 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5927 thiss!1427)) (tuple2!15533 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5927 thiss!1427)))))))

(declare-fun b!1027687 () Bool)

(assert (=> b!1027687 (= e!580023 call!43277)))

(declare-fun bm!43273 () Bool)

(assert (=> bm!43273 (= call!43273 call!43274)))

(declare-fun e!580030 () Bool)

(declare-fun b!1027688 () Bool)

(assert (=> b!1027688 (= e!580030 (= (apply!899 lt!452473 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)) (get!16338 (select (arr!31126 lt!452313) #b00000000000000000000000000000000) (dynLambda!1947 (defaultEntry!6091 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027688 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31639 lt!452313)))))

(assert (=> b!1027688 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31638 lt!452318)))))

(declare-fun b!1027689 () Bool)

(assert (=> b!1027689 (= e!580026 (validKeyInArray!0 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)))))

(declare-fun b!1027690 () Bool)

(declare-fun res!687823 () Bool)

(assert (=> b!1027690 (=> (not res!687823) (not e!580019))))

(declare-fun e!580021 () Bool)

(assert (=> b!1027690 (= res!687823 e!580021)))

(declare-fun res!687822 () Bool)

(assert (=> b!1027690 (=> res!687822 e!580021)))

(assert (=> b!1027690 (= res!687822 (not e!580029))))

(declare-fun res!687821 () Bool)

(assert (=> b!1027690 (=> (not res!687821) (not e!580029))))

(assert (=> b!1027690 (= res!687821 (bvslt #b00000000000000000000000000000000 (size!31638 lt!452318)))))

(declare-fun b!1027691 () Bool)

(assert (=> b!1027691 (= e!580021 e!580030)))

(declare-fun res!687819 () Bool)

(assert (=> b!1027691 (=> (not res!687819) (not e!580030))))

(assert (=> b!1027691 (= res!687819 (contains!5962 lt!452473 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)))))

(assert (=> b!1027691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31638 lt!452318)))))

(declare-fun b!1027692 () Bool)

(declare-fun Unit!33554 () Unit!33489)

(assert (=> b!1027692 (= e!580018 Unit!33554)))

(declare-fun b!1027693 () Bool)

(assert (=> b!1027693 (= e!580020 call!43273)))

(declare-fun bm!43274 () Bool)

(assert (=> bm!43274 (= call!43275 (getCurrentListMapNoExtraKeys!3513 lt!452318 lt!452313 (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun b!1027694 () Bool)

(assert (=> b!1027694 (= e!580028 (not call!43276))))

(declare-fun b!1027695 () Bool)

(assert (=> b!1027695 (= e!580025 e!580023)))

(assert (=> b!1027695 (= c!103613 (and (not (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5823 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027696 () Bool)

(assert (=> b!1027696 (= e!580020 call!43277)))

(declare-fun b!1027697 () Bool)

(declare-fun lt!452458 () Unit!33489)

(assert (=> b!1027697 (= e!580018 lt!452458)))

(declare-fun lt!452453 () ListLongMap!13669)

(assert (=> b!1027697 (= lt!452453 (getCurrentListMapNoExtraKeys!3513 lt!452318 lt!452313 (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun lt!452462 () (_ BitVec 64))

(assert (=> b!1027697 (= lt!452462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452470 () (_ BitVec 64))

(assert (=> b!1027697 (= lt!452470 (select (arr!31125 lt!452318) #b00000000000000000000000000000000))))

(declare-fun lt!452474 () Unit!33489)

(assert (=> b!1027697 (= lt!452474 (addStillContains!618 lt!452453 lt!452462 (zeroValue!5927 thiss!1427) lt!452470))))

(assert (=> b!1027697 (contains!5962 (+!3097 lt!452453 (tuple2!15533 lt!452462 (zeroValue!5927 thiss!1427))) lt!452470)))

(declare-fun lt!452455 () Unit!33489)

(assert (=> b!1027697 (= lt!452455 lt!452474)))

(declare-fun lt!452457 () ListLongMap!13669)

(assert (=> b!1027697 (= lt!452457 (getCurrentListMapNoExtraKeys!3513 lt!452318 lt!452313 (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun lt!452456 () (_ BitVec 64))

(assert (=> b!1027697 (= lt!452456 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452460 () (_ BitVec 64))

(assert (=> b!1027697 (= lt!452460 (select (arr!31125 lt!452318) #b00000000000000000000000000000000))))

(declare-fun lt!452468 () Unit!33489)

(assert (=> b!1027697 (= lt!452468 (addApplyDifferent!478 lt!452457 lt!452456 (minValue!5927 thiss!1427) lt!452460))))

(assert (=> b!1027697 (= (apply!899 (+!3097 lt!452457 (tuple2!15533 lt!452456 (minValue!5927 thiss!1427))) lt!452460) (apply!899 lt!452457 lt!452460))))

(declare-fun lt!452471 () Unit!33489)

(assert (=> b!1027697 (= lt!452471 lt!452468)))

(declare-fun lt!452466 () ListLongMap!13669)

(assert (=> b!1027697 (= lt!452466 (getCurrentListMapNoExtraKeys!3513 lt!452318 lt!452313 (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun lt!452454 () (_ BitVec 64))

(assert (=> b!1027697 (= lt!452454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452459 () (_ BitVec 64))

(assert (=> b!1027697 (= lt!452459 (select (arr!31125 lt!452318) #b00000000000000000000000000000000))))

(declare-fun lt!452469 () Unit!33489)

(assert (=> b!1027697 (= lt!452469 (addApplyDifferent!478 lt!452466 lt!452454 (zeroValue!5927 thiss!1427) lt!452459))))

(assert (=> b!1027697 (= (apply!899 (+!3097 lt!452466 (tuple2!15533 lt!452454 (zeroValue!5927 thiss!1427))) lt!452459) (apply!899 lt!452466 lt!452459))))

(declare-fun lt!452461 () Unit!33489)

(assert (=> b!1027697 (= lt!452461 lt!452469)))

(declare-fun lt!452472 () ListLongMap!13669)

(assert (=> b!1027697 (= lt!452472 (getCurrentListMapNoExtraKeys!3513 lt!452318 lt!452313 (mask!29809 thiss!1427) (extraKeys!5823 thiss!1427) (zeroValue!5927 thiss!1427) (minValue!5927 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6091 thiss!1427)))))

(declare-fun lt!452467 () (_ BitVec 64))

(assert (=> b!1027697 (= lt!452467 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452463 () (_ BitVec 64))

(assert (=> b!1027697 (= lt!452463 (select (arr!31125 lt!452318) #b00000000000000000000000000000000))))

(assert (=> b!1027697 (= lt!452458 (addApplyDifferent!478 lt!452472 lt!452467 (minValue!5927 thiss!1427) lt!452463))))

(assert (=> b!1027697 (= (apply!899 (+!3097 lt!452472 (tuple2!15533 lt!452467 (minValue!5927 thiss!1427))) lt!452463) (apply!899 lt!452472 lt!452463))))

(declare-fun b!1027698 () Bool)

(assert (=> b!1027698 (= e!580028 e!580027)))

(declare-fun res!687817 () Bool)

(assert (=> b!1027698 (= res!687817 call!43276)))

(assert (=> b!1027698 (=> (not res!687817) (not e!580027))))

(assert (= (and d!122735 c!103610) b!1027678))

(assert (= (and d!122735 (not c!103610)) b!1027695))

(assert (= (and b!1027695 c!103613) b!1027687))

(assert (= (and b!1027695 (not c!103613)) b!1027682))

(assert (= (and b!1027682 c!103611) b!1027696))

(assert (= (and b!1027682 (not c!103611)) b!1027693))

(assert (= (or b!1027696 b!1027693) bm!43273))

(assert (= (or b!1027687 bm!43273) bm!43268))

(assert (= (or b!1027687 b!1027696) bm!43270))

(assert (= (or b!1027678 bm!43268) bm!43274))

(assert (= (or b!1027678 bm!43270) bm!43272))

(assert (= (and d!122735 res!687824) b!1027689))

(assert (= (and d!122735 c!103612) b!1027697))

(assert (= (and d!122735 (not c!103612)) b!1027692))

(assert (= (and d!122735 res!687820) b!1027690))

(assert (= (and b!1027690 res!687821) b!1027684))

(assert (= (and b!1027690 (not res!687822)) b!1027691))

(assert (= (and b!1027691 res!687819) b!1027688))

(assert (= (and b!1027690 res!687823) b!1027680))

(assert (= (and b!1027680 c!103614) b!1027686))

(assert (= (and b!1027680 (not c!103614)) b!1027679))

(assert (= (and b!1027686 res!687818) b!1027681))

(assert (= (or b!1027686 b!1027679) bm!43271))

(assert (= (and b!1027680 res!687816) b!1027683))

(assert (= (and b!1027683 c!103609) b!1027698))

(assert (= (and b!1027683 (not c!103609)) b!1027694))

(assert (= (and b!1027698 res!687817) b!1027685))

(assert (= (or b!1027698 b!1027694) bm!43269))

(declare-fun b_lambda!15731 () Bool)

(assert (=> (not b_lambda!15731) (not b!1027688)))

(assert (=> b!1027688 t!30874))

(declare-fun b_and!32831 () Bool)

(assert (= b_and!32829 (and (=> t!30874 result!14093) b_and!32831)))

(declare-fun m!946209 () Bool)

(assert (=> b!1027697 m!946209))

(declare-fun m!946211 () Bool)

(assert (=> b!1027697 m!946211))

(declare-fun m!946213 () Bool)

(assert (=> b!1027697 m!946213))

(declare-fun m!946215 () Bool)

(assert (=> b!1027697 m!946215))

(declare-fun m!946217 () Bool)

(assert (=> b!1027697 m!946217))

(assert (=> b!1027697 m!946209))

(declare-fun m!946219 () Bool)

(assert (=> b!1027697 m!946219))

(assert (=> b!1027697 m!946113))

(declare-fun m!946221 () Bool)

(assert (=> b!1027697 m!946221))

(assert (=> b!1027697 m!946221))

(declare-fun m!946223 () Bool)

(assert (=> b!1027697 m!946223))

(declare-fun m!946225 () Bool)

(assert (=> b!1027697 m!946225))

(declare-fun m!946227 () Bool)

(assert (=> b!1027697 m!946227))

(declare-fun m!946229 () Bool)

(assert (=> b!1027697 m!946229))

(assert (=> b!1027697 m!946211))

(declare-fun m!946231 () Bool)

(assert (=> b!1027697 m!946231))

(declare-fun m!946233 () Bool)

(assert (=> b!1027697 m!946233))

(declare-fun m!946235 () Bool)

(assert (=> b!1027697 m!946235))

(declare-fun m!946237 () Bool)

(assert (=> b!1027697 m!946237))

(assert (=> b!1027697 m!946235))

(declare-fun m!946239 () Bool)

(assert (=> b!1027697 m!946239))

(assert (=> b!1027689 m!946113))

(assert (=> b!1027689 m!946113))

(assert (=> b!1027689 m!946115))

(assert (=> b!1027691 m!946113))

(assert (=> b!1027691 m!946113))

(declare-fun m!946241 () Bool)

(assert (=> b!1027691 m!946241))

(declare-fun m!946243 () Bool)

(assert (=> b!1027678 m!946243))

(declare-fun m!946245 () Bool)

(assert (=> b!1027685 m!946245))

(declare-fun m!946247 () Bool)

(assert (=> bm!43269 m!946247))

(declare-fun m!946249 () Bool)

(assert (=> b!1027681 m!946249))

(assert (=> bm!43274 m!946229))

(assert (=> d!122735 m!946095))

(declare-fun m!946251 () Bool)

(assert (=> bm!43271 m!946251))

(assert (=> b!1027684 m!946113))

(assert (=> b!1027684 m!946113))

(assert (=> b!1027684 m!946115))

(assert (=> b!1027688 m!946037))

(assert (=> b!1027688 m!946113))

(declare-fun m!946253 () Bool)

(assert (=> b!1027688 m!946253))

(declare-fun m!946255 () Bool)

(assert (=> b!1027688 m!946255))

(assert (=> b!1027688 m!946037))

(declare-fun m!946257 () Bool)

(assert (=> b!1027688 m!946257))

(assert (=> b!1027688 m!946255))

(assert (=> b!1027688 m!946113))

(declare-fun m!946259 () Bool)

(assert (=> bm!43272 m!946259))

(assert (=> b!1027500 d!122735))

(declare-fun b!1027709 () Bool)

(declare-fun e!580040 () Bool)

(declare-fun call!43280 () Bool)

(assert (=> b!1027709 (= e!580040 call!43280)))

(declare-fun b!1027710 () Bool)

(declare-fun e!580039 () Bool)

(declare-fun contains!5963 (List!21810 (_ BitVec 64)) Bool)

(assert (=> b!1027710 (= e!580039 (contains!5963 Nil!21807 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)))))

(declare-fun b!1027711 () Bool)

(declare-fun e!580042 () Bool)

(assert (=> b!1027711 (= e!580042 e!580040)))

(declare-fun c!103617 () Bool)

(assert (=> b!1027711 (= c!103617 (validKeyInArray!0 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)))))

(declare-fun bm!43277 () Bool)

(assert (=> bm!43277 (= call!43280 (arrayNoDuplicates!0 lt!452318 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103617 (Cons!21806 (select (arr!31125 lt!452318) #b00000000000000000000000000000000) Nil!21807) Nil!21807)))))

(declare-fun b!1027712 () Bool)

(declare-fun e!580041 () Bool)

(assert (=> b!1027712 (= e!580041 e!580042)))

(declare-fun res!687833 () Bool)

(assert (=> b!1027712 (=> (not res!687833) (not e!580042))))

(assert (=> b!1027712 (= res!687833 (not e!580039))))

(declare-fun res!687832 () Bool)

(assert (=> b!1027712 (=> (not res!687832) (not e!580039))))

(assert (=> b!1027712 (= res!687832 (validKeyInArray!0 (select (arr!31125 lt!452318) #b00000000000000000000000000000000)))))

(declare-fun b!1027713 () Bool)

(assert (=> b!1027713 (= e!580040 call!43280)))

(declare-fun d!122737 () Bool)

(declare-fun res!687831 () Bool)

(assert (=> d!122737 (=> res!687831 e!580041)))

(assert (=> d!122737 (= res!687831 (bvsge #b00000000000000000000000000000000 (size!31638 lt!452318)))))

(assert (=> d!122737 (= (arrayNoDuplicates!0 lt!452318 #b00000000000000000000000000000000 Nil!21807) e!580041)))

(assert (= (and d!122737 (not res!687831)) b!1027712))

(assert (= (and b!1027712 res!687832) b!1027710))

(assert (= (and b!1027712 res!687833) b!1027711))

(assert (= (and b!1027711 c!103617) b!1027709))

(assert (= (and b!1027711 (not c!103617)) b!1027713))

(assert (= (or b!1027709 b!1027713) bm!43277))

(assert (=> b!1027710 m!946113))

(assert (=> b!1027710 m!946113))

(declare-fun m!946261 () Bool)

(assert (=> b!1027710 m!946261))

(assert (=> b!1027711 m!946113))

(assert (=> b!1027711 m!946113))

(assert (=> b!1027711 m!946115))

(assert (=> bm!43277 m!946113))

(declare-fun m!946263 () Bool)

(assert (=> bm!43277 m!946263))

(assert (=> b!1027712 m!946113))

(assert (=> b!1027712 m!946113))

(assert (=> b!1027712 m!946115))

(assert (=> b!1027500 d!122737))

(declare-fun d!122739 () Bool)

(assert (=> d!122739 (= (array_inv!24095 (_keys!11238 thiss!1427)) (bvsge (size!31638 (_keys!11238 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027502 d!122739))

(declare-fun d!122741 () Bool)

(assert (=> d!122741 (= (array_inv!24096 (_values!6114 thiss!1427)) (bvsge (size!31639 (_values!6114 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027502 d!122741))

(declare-fun b!1027720 () Bool)

(declare-fun e!580048 () Bool)

(assert (=> b!1027720 (= e!580048 tp_is_empty!24291)))

(declare-fun mapNonEmpty!37871 () Bool)

(declare-fun mapRes!37871 () Bool)

(declare-fun tp!72768 () Bool)

(assert (=> mapNonEmpty!37871 (= mapRes!37871 (and tp!72768 e!580048))))

(declare-fun mapValue!37871 () ValueCell!11442)

(declare-fun mapKey!37871 () (_ BitVec 32))

(declare-fun mapRest!37871 () (Array (_ BitVec 32) ValueCell!11442))

(assert (=> mapNonEmpty!37871 (= mapRest!37865 (store mapRest!37871 mapKey!37871 mapValue!37871))))

(declare-fun b!1027721 () Bool)

(declare-fun e!580047 () Bool)

(assert (=> b!1027721 (= e!580047 tp_is_empty!24291)))

(declare-fun mapIsEmpty!37871 () Bool)

(assert (=> mapIsEmpty!37871 mapRes!37871))

(declare-fun condMapEmpty!37871 () Bool)

(declare-fun mapDefault!37871 () ValueCell!11442)

(assert (=> mapNonEmpty!37865 (= condMapEmpty!37871 (= mapRest!37865 ((as const (Array (_ BitVec 32) ValueCell!11442)) mapDefault!37871)))))

(assert (=> mapNonEmpty!37865 (= tp!72759 (and e!580047 mapRes!37871))))

(assert (= (and mapNonEmpty!37865 condMapEmpty!37871) mapIsEmpty!37871))

(assert (= (and mapNonEmpty!37865 (not condMapEmpty!37871)) mapNonEmpty!37871))

(assert (= (and mapNonEmpty!37871 ((_ is ValueCellFull!11442) mapValue!37871)) b!1027720))

(assert (= (and mapNonEmpty!37865 ((_ is ValueCellFull!11442) mapDefault!37871)) b!1027721))

(declare-fun m!946265 () Bool)

(assert (=> mapNonEmpty!37871 m!946265))

(declare-fun b_lambda!15733 () Bool)

(assert (= b_lambda!15731 (or (and b!1027502 b_free!20571) b_lambda!15733)))

(declare-fun b_lambda!15735 () Bool)

(assert (= b_lambda!15727 (or (and b!1027502 b_free!20571) b_lambda!15735)))

(declare-fun b_lambda!15737 () Bool)

(assert (= b_lambda!15729 (or (and b!1027502 b_free!20571) b_lambda!15737)))

(check-sat (not b!1027678) (not d!122711) (not b!1027655) (not d!122709) (not b!1027623) (not bm!43260) (not b!1027712) (not b!1027697) (not bm!43266) (not b_lambda!15737) (not b!1027544) (not mapNonEmpty!37871) (not b!1027624) (not b!1027653) (not b!1027628) (not b!1027627) (not b!1027643) (not d!122707) (not d!122725) (not bm!43258) (not bm!43267) (not d!122735) (not b!1027668) (not b!1027620) (not d!122733) (not bm!43271) (not b!1027689) (not b!1027685) (not b!1027710) (not d!122719) b_and!32831 (not b!1027630) (not bm!43261) (not b!1027691) (not bm!43272) (not b_lambda!15725) (not bm!43263) (not b!1027677) (not d!122715) (not bm!43269) (not d!122721) (not b!1027571) (not b!1027554) (not b!1027684) (not b!1027556) (not b!1027559) (not b!1027658) (not b!1027555) (not b!1027681) (not b_lambda!15733) (not b!1027688) (not bm!43274) (not b!1027711) (not bm!43277) (not bm!43242) tp_is_empty!24291 (not b!1027636) (not b_next!20571) (not d!122727) (not b!1027562) (not b_lambda!15735) (not b!1027617) (not b!1027572) (not b!1027672) (not b!1027652))
(check-sat b_and!32831 (not b_next!20571))
