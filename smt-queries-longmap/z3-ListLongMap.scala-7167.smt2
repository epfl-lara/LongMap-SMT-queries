; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91718 () Bool)

(assert start!91718)

(declare-fun b!1043558 () Bool)

(declare-fun b_free!21055 () Bool)

(declare-fun b_next!21055 () Bool)

(assert (=> b!1043558 (= b_free!21055 (not b_next!21055))))

(declare-fun tp!74388 () Bool)

(declare-fun b_and!33597 () Bool)

(assert (=> b!1043558 (= tp!74388 b_and!33597)))

(declare-fun b!1043556 () Bool)

(declare-fun e!591201 () Bool)

(declare-fun e!591204 () Bool)

(assert (=> b!1043556 (= e!591201 e!591204)))

(declare-fun res!695000 () Bool)

(assert (=> b!1043556 (=> (not res!695000) (not e!591204))))

(declare-datatypes ((SeekEntryResult!9770 0))(
  ( (MissingZero!9770 (index!41451 (_ BitVec 32))) (Found!9770 (index!41452 (_ BitVec 32))) (Intermediate!9770 (undefined!10582 Bool) (index!41453 (_ BitVec 32)) (x!93028 (_ BitVec 32))) (Undefined!9770) (MissingVacant!9770 (index!41454 (_ BitVec 32))) )
))
(declare-fun lt!459887 () SeekEntryResult!9770)

(get-info :version)

(assert (=> b!1043556 (= res!695000 ((_ is Found!9770) lt!459887))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37907 0))(
  ( (V!37908 (val!12438 Int)) )
))
(declare-datatypes ((ValueCell!11684 0))(
  ( (ValueCellFull!11684 (v!15025 V!37907)) (EmptyCell!11684) )
))
(declare-datatypes ((array!65751 0))(
  ( (array!65752 (arr!31627 (Array (_ BitVec 32) (_ BitVec 64))) (size!32163 (_ BitVec 32))) )
))
(declare-datatypes ((array!65753 0))(
  ( (array!65754 (arr!31628 (Array (_ BitVec 32) ValueCell!11684)) (size!32164 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5962 0))(
  ( (LongMapFixedSize!5963 (defaultEntry!6363 Int) (mask!30480 (_ BitVec 32)) (extraKeys!6091 (_ BitVec 32)) (zeroValue!6197 V!37907) (minValue!6197 V!37907) (_size!3036 (_ BitVec 32)) (_keys!11649 array!65751) (_values!6386 array!65753) (_vacant!3036 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5962)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65751 (_ BitVec 32)) SeekEntryResult!9770)

(assert (=> b!1043556 (= lt!459887 (seekEntry!0 key!909 (_keys!11649 thiss!1427) (mask!30480 thiss!1427)))))

(declare-fun mapIsEmpty!38768 () Bool)

(declare-fun mapRes!38768 () Bool)

(assert (=> mapIsEmpty!38768 mapRes!38768))

(declare-fun b!1043557 () Bool)

(declare-fun e!591199 () Bool)

(assert (=> b!1043557 (= e!591204 (not e!591199))))

(declare-fun res!695001 () Bool)

(assert (=> b!1043557 (=> res!695001 e!591199)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043557 (= res!695001 (not (validMask!0 (mask!30480 thiss!1427))))))

(declare-fun lt!459891 () array!65751)

(declare-fun arrayContainsKey!0 (array!65751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043557 (not (arrayContainsKey!0 lt!459891 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34053 0))(
  ( (Unit!34054) )
))
(declare-fun lt!459892 () Unit!34053)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65751 (_ BitVec 32) (_ BitVec 64)) Unit!34053)

(assert (=> b!1043557 (= lt!459892 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11649 thiss!1427) (index!41452 lt!459887) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65751 (_ BitVec 32)) Bool)

(assert (=> b!1043557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459891 (mask!30480 thiss!1427))))

(declare-fun lt!459889 () Unit!34053)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65751 (_ BitVec 32) (_ BitVec 32)) Unit!34053)

(assert (=> b!1043557 (= lt!459889 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11649 thiss!1427) (index!41452 lt!459887) (mask!30480 thiss!1427)))))

(declare-datatypes ((List!21964 0))(
  ( (Nil!21961) (Cons!21960 (h!23177 (_ BitVec 64)) (t!31170 List!21964)) )
))
(declare-fun arrayNoDuplicates!0 (array!65751 (_ BitVec 32) List!21964) Bool)

(assert (=> b!1043557 (arrayNoDuplicates!0 lt!459891 #b00000000000000000000000000000000 Nil!21961)))

(declare-fun lt!459888 () Unit!34053)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65751 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21964) Unit!34053)

(assert (=> b!1043557 (= lt!459888 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11649 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41452 lt!459887) #b00000000000000000000000000000000 Nil!21961))))

(declare-fun arrayCountValidKeys!0 (array!65751 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043557 (= (arrayCountValidKeys!0 lt!459891 #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11649 thiss!1427) #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043557 (= lt!459891 (array!65752 (store (arr!31627 (_keys!11649 thiss!1427)) (index!41452 lt!459887) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11649 thiss!1427))))))

(declare-fun lt!459890 () Unit!34053)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65751 (_ BitVec 32) (_ BitVec 64)) Unit!34053)

(assert (=> b!1043557 (= lt!459890 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11649 thiss!1427) (index!41452 lt!459887) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun tp_is_empty!24775 () Bool)

(declare-fun e!591202 () Bool)

(declare-fun e!591203 () Bool)

(declare-fun array_inv!24449 (array!65751) Bool)

(declare-fun array_inv!24450 (array!65753) Bool)

(assert (=> b!1043558 (= e!591203 (and tp!74388 tp_is_empty!24775 (array_inv!24449 (_keys!11649 thiss!1427)) (array_inv!24450 (_values!6386 thiss!1427)) e!591202))))

(declare-fun b!1043559 () Bool)

(declare-fun res!695003 () Bool)

(assert (=> b!1043559 (=> res!695003 e!591199)))

(assert (=> b!1043559 (= res!695003 (or (not (= (size!32164 (_values!6386 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30480 thiss!1427)))) (not (= (size!32163 (_keys!11649 thiss!1427)) (size!32164 (_values!6386 thiss!1427)))) (bvslt (mask!30480 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6091 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6091 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1043560 () Bool)

(declare-fun e!591200 () Bool)

(assert (=> b!1043560 (= e!591200 tp_is_empty!24775)))

(declare-fun mapNonEmpty!38768 () Bool)

(declare-fun tp!74387 () Bool)

(assert (=> mapNonEmpty!38768 (= mapRes!38768 (and tp!74387 e!591200))))

(declare-fun mapRest!38768 () (Array (_ BitVec 32) ValueCell!11684))

(declare-fun mapValue!38768 () ValueCell!11684)

(declare-fun mapKey!38768 () (_ BitVec 32))

(assert (=> mapNonEmpty!38768 (= (arr!31628 (_values!6386 thiss!1427)) (store mapRest!38768 mapKey!38768 mapValue!38768))))

(declare-fun res!695002 () Bool)

(assert (=> start!91718 (=> (not res!695002) (not e!591201))))

(declare-fun valid!2245 (LongMapFixedSize!5962) Bool)

(assert (=> start!91718 (= res!695002 (valid!2245 thiss!1427))))

(assert (=> start!91718 e!591201))

(assert (=> start!91718 e!591203))

(assert (=> start!91718 true))

(declare-fun b!1043561 () Bool)

(declare-fun e!591198 () Bool)

(assert (=> b!1043561 (= e!591198 tp_is_empty!24775)))

(declare-fun b!1043562 () Bool)

(declare-fun res!694999 () Bool)

(assert (=> b!1043562 (=> (not res!694999) (not e!591201))))

(assert (=> b!1043562 (= res!694999 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043563 () Bool)

(assert (=> b!1043563 (= e!591202 (and e!591198 mapRes!38768))))

(declare-fun condMapEmpty!38768 () Bool)

(declare-fun mapDefault!38768 () ValueCell!11684)

(assert (=> b!1043563 (= condMapEmpty!38768 (= (arr!31628 (_values!6386 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11684)) mapDefault!38768)))))

(declare-fun b!1043564 () Bool)

(assert (=> b!1043564 (= e!591199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11649 thiss!1427) (mask!30480 thiss!1427)))))

(assert (= (and start!91718 res!695002) b!1043562))

(assert (= (and b!1043562 res!694999) b!1043556))

(assert (= (and b!1043556 res!695000) b!1043557))

(assert (= (and b!1043557 (not res!695001)) b!1043559))

(assert (= (and b!1043559 (not res!695003)) b!1043564))

(assert (= (and b!1043563 condMapEmpty!38768) mapIsEmpty!38768))

(assert (= (and b!1043563 (not condMapEmpty!38768)) mapNonEmpty!38768))

(assert (= (and mapNonEmpty!38768 ((_ is ValueCellFull!11684) mapValue!38768)) b!1043560))

(assert (= (and b!1043563 ((_ is ValueCellFull!11684) mapDefault!38768)) b!1043561))

(assert (= b!1043558 b!1043563))

(assert (= start!91718 b!1043558))

(declare-fun m!963229 () Bool)

(assert (=> start!91718 m!963229))

(declare-fun m!963231 () Bool)

(assert (=> b!1043564 m!963231))

(declare-fun m!963233 () Bool)

(assert (=> b!1043558 m!963233))

(declare-fun m!963235 () Bool)

(assert (=> b!1043558 m!963235))

(declare-fun m!963237 () Bool)

(assert (=> b!1043557 m!963237))

(declare-fun m!963239 () Bool)

(assert (=> b!1043557 m!963239))

(declare-fun m!963241 () Bool)

(assert (=> b!1043557 m!963241))

(declare-fun m!963243 () Bool)

(assert (=> b!1043557 m!963243))

(declare-fun m!963245 () Bool)

(assert (=> b!1043557 m!963245))

(declare-fun m!963247 () Bool)

(assert (=> b!1043557 m!963247))

(declare-fun m!963249 () Bool)

(assert (=> b!1043557 m!963249))

(declare-fun m!963251 () Bool)

(assert (=> b!1043557 m!963251))

(declare-fun m!963253 () Bool)

(assert (=> b!1043557 m!963253))

(declare-fun m!963255 () Bool)

(assert (=> b!1043557 m!963255))

(declare-fun m!963257 () Bool)

(assert (=> b!1043557 m!963257))

(declare-fun m!963259 () Bool)

(assert (=> mapNonEmpty!38768 m!963259))

(declare-fun m!963261 () Bool)

(assert (=> b!1043556 m!963261))

(check-sat tp_is_empty!24775 b_and!33597 (not b!1043556) (not b_next!21055) (not b!1043557) (not mapNonEmpty!38768) (not start!91718) (not b!1043564) (not b!1043558))
(check-sat b_and!33597 (not b_next!21055))
(get-model)

(declare-fun d!126547 () Bool)

(declare-fun res!695040 () Bool)

(declare-fun e!591256 () Bool)

(assert (=> d!126547 (=> (not res!695040) (not e!591256))))

(declare-fun simpleValid!441 (LongMapFixedSize!5962) Bool)

(assert (=> d!126547 (= res!695040 (simpleValid!441 thiss!1427))))

(assert (=> d!126547 (= (valid!2245 thiss!1427) e!591256)))

(declare-fun b!1043625 () Bool)

(declare-fun res!695041 () Bool)

(assert (=> b!1043625 (=> (not res!695041) (not e!591256))))

(assert (=> b!1043625 (= res!695041 (= (arrayCountValidKeys!0 (_keys!11649 thiss!1427) #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) (_size!3036 thiss!1427)))))

(declare-fun b!1043626 () Bool)

(declare-fun res!695042 () Bool)

(assert (=> b!1043626 (=> (not res!695042) (not e!591256))))

(assert (=> b!1043626 (= res!695042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11649 thiss!1427) (mask!30480 thiss!1427)))))

(declare-fun b!1043627 () Bool)

(assert (=> b!1043627 (= e!591256 (arrayNoDuplicates!0 (_keys!11649 thiss!1427) #b00000000000000000000000000000000 Nil!21961))))

(assert (= (and d!126547 res!695040) b!1043625))

(assert (= (and b!1043625 res!695041) b!1043626))

(assert (= (and b!1043626 res!695042) b!1043627))

(declare-fun m!963331 () Bool)

(assert (=> d!126547 m!963331))

(assert (=> b!1043625 m!963251))

(assert (=> b!1043626 m!963231))

(declare-fun m!963333 () Bool)

(assert (=> b!1043627 m!963333))

(assert (=> start!91718 d!126547))

(declare-fun b!1043640 () Bool)

(declare-fun c!106225 () Bool)

(declare-fun lt!459940 () (_ BitVec 64))

(assert (=> b!1043640 (= c!106225 (= lt!459940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591264 () SeekEntryResult!9770)

(declare-fun e!591265 () SeekEntryResult!9770)

(assert (=> b!1043640 (= e!591264 e!591265)))

(declare-fun b!1043641 () Bool)

(declare-fun lt!459938 () SeekEntryResult!9770)

(assert (=> b!1043641 (= e!591264 (Found!9770 (index!41453 lt!459938)))))

(declare-fun b!1043642 () Bool)

(assert (=> b!1043642 (= e!591265 (MissingZero!9770 (index!41453 lt!459938)))))

(declare-fun b!1043643 () Bool)

(declare-fun e!591263 () SeekEntryResult!9770)

(assert (=> b!1043643 (= e!591263 e!591264)))

(assert (=> b!1043643 (= lt!459940 (select (arr!31627 (_keys!11649 thiss!1427)) (index!41453 lt!459938)))))

(declare-fun c!106226 () Bool)

(assert (=> b!1043643 (= c!106226 (= lt!459940 key!909))))

(declare-fun d!126549 () Bool)

(declare-fun lt!459937 () SeekEntryResult!9770)

(assert (=> d!126549 (and (or ((_ is MissingVacant!9770) lt!459937) (not ((_ is Found!9770) lt!459937)) (and (bvsge (index!41452 lt!459937) #b00000000000000000000000000000000) (bvslt (index!41452 lt!459937) (size!32163 (_keys!11649 thiss!1427))))) (not ((_ is MissingVacant!9770) lt!459937)) (or (not ((_ is Found!9770) lt!459937)) (= (select (arr!31627 (_keys!11649 thiss!1427)) (index!41452 lt!459937)) key!909)))))

(assert (=> d!126549 (= lt!459937 e!591263)))

(declare-fun c!106227 () Bool)

(assert (=> d!126549 (= c!106227 (and ((_ is Intermediate!9770) lt!459938) (undefined!10582 lt!459938)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65751 (_ BitVec 32)) SeekEntryResult!9770)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126549 (= lt!459938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30480 thiss!1427)) key!909 (_keys!11649 thiss!1427) (mask!30480 thiss!1427)))))

(assert (=> d!126549 (validMask!0 (mask!30480 thiss!1427))))

(assert (=> d!126549 (= (seekEntry!0 key!909 (_keys!11649 thiss!1427) (mask!30480 thiss!1427)) lt!459937)))

(declare-fun b!1043644 () Bool)

(declare-fun lt!459939 () SeekEntryResult!9770)

(assert (=> b!1043644 (= e!591265 (ite ((_ is MissingVacant!9770) lt!459939) (MissingZero!9770 (index!41454 lt!459939)) lt!459939))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65751 (_ BitVec 32)) SeekEntryResult!9770)

(assert (=> b!1043644 (= lt!459939 (seekKeyOrZeroReturnVacant!0 (x!93028 lt!459938) (index!41453 lt!459938) (index!41453 lt!459938) key!909 (_keys!11649 thiss!1427) (mask!30480 thiss!1427)))))

(declare-fun b!1043645 () Bool)

(assert (=> b!1043645 (= e!591263 Undefined!9770)))

(assert (= (and d!126549 c!106227) b!1043645))

(assert (= (and d!126549 (not c!106227)) b!1043643))

(assert (= (and b!1043643 c!106226) b!1043641))

(assert (= (and b!1043643 (not c!106226)) b!1043640))

(assert (= (and b!1043640 c!106225) b!1043642))

(assert (= (and b!1043640 (not c!106225)) b!1043644))

(declare-fun m!963335 () Bool)

(assert (=> b!1043643 m!963335))

(declare-fun m!963337 () Bool)

(assert (=> d!126549 m!963337))

(declare-fun m!963339 () Bool)

(assert (=> d!126549 m!963339))

(assert (=> d!126549 m!963339))

(declare-fun m!963341 () Bool)

(assert (=> d!126549 m!963341))

(assert (=> d!126549 m!963239))

(declare-fun m!963343 () Bool)

(assert (=> b!1043644 m!963343))

(assert (=> b!1043556 d!126549))

(declare-fun b!1043654 () Bool)

(declare-fun e!591271 () (_ BitVec 32))

(declare-fun e!591270 () (_ BitVec 32))

(assert (=> b!1043654 (= e!591271 e!591270)))

(declare-fun c!106233 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043654 (= c!106233 (validKeyInArray!0 (select (arr!31627 lt!459891) #b00000000000000000000000000000000)))))

(declare-fun b!1043655 () Bool)

(declare-fun call!44233 () (_ BitVec 32))

(assert (=> b!1043655 (= e!591270 (bvadd #b00000000000000000000000000000001 call!44233))))

(declare-fun b!1043656 () Bool)

(assert (=> b!1043656 (= e!591270 call!44233)))

(declare-fun bm!44230 () Bool)

(assert (=> bm!44230 (= call!44233 (arrayCountValidKeys!0 lt!459891 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32163 (_keys!11649 thiss!1427))))))

(declare-fun b!1043657 () Bool)

(assert (=> b!1043657 (= e!591271 #b00000000000000000000000000000000)))

(declare-fun d!126551 () Bool)

(declare-fun lt!459943 () (_ BitVec 32))

(assert (=> d!126551 (and (bvsge lt!459943 #b00000000000000000000000000000000) (bvsle lt!459943 (bvsub (size!32163 lt!459891) #b00000000000000000000000000000000)))))

(assert (=> d!126551 (= lt!459943 e!591271)))

(declare-fun c!106232 () Bool)

(assert (=> d!126551 (= c!106232 (bvsge #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))))))

(assert (=> d!126551 (and (bvsle #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32163 (_keys!11649 thiss!1427)) (size!32163 lt!459891)))))

(assert (=> d!126551 (= (arrayCountValidKeys!0 lt!459891 #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) lt!459943)))

(assert (= (and d!126551 c!106232) b!1043657))

(assert (= (and d!126551 (not c!106232)) b!1043654))

(assert (= (and b!1043654 c!106233) b!1043655))

(assert (= (and b!1043654 (not c!106233)) b!1043656))

(assert (= (or b!1043655 b!1043656) bm!44230))

(declare-fun m!963345 () Bool)

(assert (=> b!1043654 m!963345))

(assert (=> b!1043654 m!963345))

(declare-fun m!963347 () Bool)

(assert (=> b!1043654 m!963347))

(declare-fun m!963349 () Bool)

(assert (=> bm!44230 m!963349))

(assert (=> b!1043557 d!126551))

(declare-fun bm!44233 () Bool)

(declare-fun call!44236 () Bool)

(declare-fun c!106236 () Bool)

(assert (=> bm!44233 (= call!44236 (arrayNoDuplicates!0 lt!459891 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106236 (Cons!21960 (select (arr!31627 lt!459891) #b00000000000000000000000000000000) Nil!21961) Nil!21961)))))

(declare-fun d!126553 () Bool)

(declare-fun res!695051 () Bool)

(declare-fun e!591281 () Bool)

(assert (=> d!126553 (=> res!695051 e!591281)))

(assert (=> d!126553 (= res!695051 (bvsge #b00000000000000000000000000000000 (size!32163 lt!459891)))))

(assert (=> d!126553 (= (arrayNoDuplicates!0 lt!459891 #b00000000000000000000000000000000 Nil!21961) e!591281)))

(declare-fun b!1043668 () Bool)

(declare-fun e!591282 () Bool)

(assert (=> b!1043668 (= e!591282 call!44236)))

(declare-fun b!1043669 () Bool)

(assert (=> b!1043669 (= e!591282 call!44236)))

(declare-fun b!1043670 () Bool)

(declare-fun e!591280 () Bool)

(declare-fun contains!6083 (List!21964 (_ BitVec 64)) Bool)

(assert (=> b!1043670 (= e!591280 (contains!6083 Nil!21961 (select (arr!31627 lt!459891) #b00000000000000000000000000000000)))))

(declare-fun b!1043671 () Bool)

(declare-fun e!591283 () Bool)

(assert (=> b!1043671 (= e!591283 e!591282)))

(assert (=> b!1043671 (= c!106236 (validKeyInArray!0 (select (arr!31627 lt!459891) #b00000000000000000000000000000000)))))

(declare-fun b!1043672 () Bool)

(assert (=> b!1043672 (= e!591281 e!591283)))

(declare-fun res!695049 () Bool)

(assert (=> b!1043672 (=> (not res!695049) (not e!591283))))

(assert (=> b!1043672 (= res!695049 (not e!591280))))

(declare-fun res!695050 () Bool)

(assert (=> b!1043672 (=> (not res!695050) (not e!591280))))

(assert (=> b!1043672 (= res!695050 (validKeyInArray!0 (select (arr!31627 lt!459891) #b00000000000000000000000000000000)))))

(assert (= (and d!126553 (not res!695051)) b!1043672))

(assert (= (and b!1043672 res!695050) b!1043670))

(assert (= (and b!1043672 res!695049) b!1043671))

(assert (= (and b!1043671 c!106236) b!1043669))

(assert (= (and b!1043671 (not c!106236)) b!1043668))

(assert (= (or b!1043669 b!1043668) bm!44233))

(assert (=> bm!44233 m!963345))

(declare-fun m!963351 () Bool)

(assert (=> bm!44233 m!963351))

(assert (=> b!1043670 m!963345))

(assert (=> b!1043670 m!963345))

(declare-fun m!963353 () Bool)

(assert (=> b!1043670 m!963353))

(assert (=> b!1043671 m!963345))

(assert (=> b!1043671 m!963345))

(assert (=> b!1043671 m!963347))

(assert (=> b!1043672 m!963345))

(assert (=> b!1043672 m!963345))

(assert (=> b!1043672 m!963347))

(assert (=> b!1043557 d!126553))

(declare-fun b!1043681 () Bool)

(declare-fun e!591290 () Bool)

(declare-fun e!591291 () Bool)

(assert (=> b!1043681 (= e!591290 e!591291)))

(declare-fun c!106239 () Bool)

(assert (=> b!1043681 (= c!106239 (validKeyInArray!0 (select (arr!31627 lt!459891) #b00000000000000000000000000000000)))))

(declare-fun b!1043682 () Bool)

(declare-fun call!44239 () Bool)

(assert (=> b!1043682 (= e!591291 call!44239)))

(declare-fun b!1043683 () Bool)

(declare-fun e!591292 () Bool)

(assert (=> b!1043683 (= e!591292 call!44239)))

(declare-fun d!126555 () Bool)

(declare-fun res!695057 () Bool)

(assert (=> d!126555 (=> res!695057 e!591290)))

(assert (=> d!126555 (= res!695057 (bvsge #b00000000000000000000000000000000 (size!32163 lt!459891)))))

(assert (=> d!126555 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459891 (mask!30480 thiss!1427)) e!591290)))

(declare-fun b!1043684 () Bool)

(assert (=> b!1043684 (= e!591291 e!591292)))

(declare-fun lt!459951 () (_ BitVec 64))

(assert (=> b!1043684 (= lt!459951 (select (arr!31627 lt!459891) #b00000000000000000000000000000000))))

(declare-fun lt!459950 () Unit!34053)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65751 (_ BitVec 64) (_ BitVec 32)) Unit!34053)

(assert (=> b!1043684 (= lt!459950 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459891 lt!459951 #b00000000000000000000000000000000))))

(assert (=> b!1043684 (arrayContainsKey!0 lt!459891 lt!459951 #b00000000000000000000000000000000)))

(declare-fun lt!459952 () Unit!34053)

(assert (=> b!1043684 (= lt!459952 lt!459950)))

(declare-fun res!695056 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65751 (_ BitVec 32)) SeekEntryResult!9770)

(assert (=> b!1043684 (= res!695056 (= (seekEntryOrOpen!0 (select (arr!31627 lt!459891) #b00000000000000000000000000000000) lt!459891 (mask!30480 thiss!1427)) (Found!9770 #b00000000000000000000000000000000)))))

(assert (=> b!1043684 (=> (not res!695056) (not e!591292))))

(declare-fun bm!44236 () Bool)

(assert (=> bm!44236 (= call!44239 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459891 (mask!30480 thiss!1427)))))

(assert (= (and d!126555 (not res!695057)) b!1043681))

(assert (= (and b!1043681 c!106239) b!1043684))

(assert (= (and b!1043681 (not c!106239)) b!1043682))

(assert (= (and b!1043684 res!695056) b!1043683))

(assert (= (or b!1043683 b!1043682) bm!44236))

(assert (=> b!1043681 m!963345))

(assert (=> b!1043681 m!963345))

(assert (=> b!1043681 m!963347))

(assert (=> b!1043684 m!963345))

(declare-fun m!963355 () Bool)

(assert (=> b!1043684 m!963355))

(declare-fun m!963357 () Bool)

(assert (=> b!1043684 m!963357))

(assert (=> b!1043684 m!963345))

(declare-fun m!963359 () Bool)

(assert (=> b!1043684 m!963359))

(declare-fun m!963361 () Bool)

(assert (=> bm!44236 m!963361))

(assert (=> b!1043557 d!126555))

(declare-fun d!126557 () Bool)

(declare-fun e!591295 () Bool)

(assert (=> d!126557 e!591295))

(declare-fun res!695060 () Bool)

(assert (=> d!126557 (=> (not res!695060) (not e!591295))))

(assert (=> d!126557 (= res!695060 (and (bvsge (index!41452 lt!459887) #b00000000000000000000000000000000) (bvslt (index!41452 lt!459887) (size!32163 (_keys!11649 thiss!1427)))))))

(declare-fun lt!459955 () Unit!34053)

(declare-fun choose!53 (array!65751 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21964) Unit!34053)

(assert (=> d!126557 (= lt!459955 (choose!53 (_keys!11649 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41452 lt!459887) #b00000000000000000000000000000000 Nil!21961))))

(assert (=> d!126557 (bvslt (size!32163 (_keys!11649 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126557 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11649 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41452 lt!459887) #b00000000000000000000000000000000 Nil!21961) lt!459955)))

(declare-fun b!1043687 () Bool)

(assert (=> b!1043687 (= e!591295 (arrayNoDuplicates!0 (array!65752 (store (arr!31627 (_keys!11649 thiss!1427)) (index!41452 lt!459887) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11649 thiss!1427))) #b00000000000000000000000000000000 Nil!21961))))

(assert (= (and d!126557 res!695060) b!1043687))

(declare-fun m!963363 () Bool)

(assert (=> d!126557 m!963363))

(assert (=> b!1043687 m!963249))

(declare-fun m!963365 () Bool)

(assert (=> b!1043687 m!963365))

(assert (=> b!1043557 d!126557))

(declare-fun d!126559 () Bool)

(assert (=> d!126559 (= (validMask!0 (mask!30480 thiss!1427)) (and (or (= (mask!30480 thiss!1427) #b00000000000000000000000000000111) (= (mask!30480 thiss!1427) #b00000000000000000000000000001111) (= (mask!30480 thiss!1427) #b00000000000000000000000000011111) (= (mask!30480 thiss!1427) #b00000000000000000000000000111111) (= (mask!30480 thiss!1427) #b00000000000000000000000001111111) (= (mask!30480 thiss!1427) #b00000000000000000000000011111111) (= (mask!30480 thiss!1427) #b00000000000000000000000111111111) (= (mask!30480 thiss!1427) #b00000000000000000000001111111111) (= (mask!30480 thiss!1427) #b00000000000000000000011111111111) (= (mask!30480 thiss!1427) #b00000000000000000000111111111111) (= (mask!30480 thiss!1427) #b00000000000000000001111111111111) (= (mask!30480 thiss!1427) #b00000000000000000011111111111111) (= (mask!30480 thiss!1427) #b00000000000000000111111111111111) (= (mask!30480 thiss!1427) #b00000000000000001111111111111111) (= (mask!30480 thiss!1427) #b00000000000000011111111111111111) (= (mask!30480 thiss!1427) #b00000000000000111111111111111111) (= (mask!30480 thiss!1427) #b00000000000001111111111111111111) (= (mask!30480 thiss!1427) #b00000000000011111111111111111111) (= (mask!30480 thiss!1427) #b00000000000111111111111111111111) (= (mask!30480 thiss!1427) #b00000000001111111111111111111111) (= (mask!30480 thiss!1427) #b00000000011111111111111111111111) (= (mask!30480 thiss!1427) #b00000000111111111111111111111111) (= (mask!30480 thiss!1427) #b00000001111111111111111111111111) (= (mask!30480 thiss!1427) #b00000011111111111111111111111111) (= (mask!30480 thiss!1427) #b00000111111111111111111111111111) (= (mask!30480 thiss!1427) #b00001111111111111111111111111111) (= (mask!30480 thiss!1427) #b00011111111111111111111111111111) (= (mask!30480 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30480 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1043557 d!126559))

(declare-fun d!126561 () Bool)

(declare-fun e!591298 () Bool)

(assert (=> d!126561 e!591298))

(declare-fun res!695063 () Bool)

(assert (=> d!126561 (=> (not res!695063) (not e!591298))))

(assert (=> d!126561 (= res!695063 (bvslt (index!41452 lt!459887) (size!32163 (_keys!11649 thiss!1427))))))

(declare-fun lt!459958 () Unit!34053)

(declare-fun choose!121 (array!65751 (_ BitVec 32) (_ BitVec 64)) Unit!34053)

(assert (=> d!126561 (= lt!459958 (choose!121 (_keys!11649 thiss!1427) (index!41452 lt!459887) key!909))))

(assert (=> d!126561 (bvsge (index!41452 lt!459887) #b00000000000000000000000000000000)))

(assert (=> d!126561 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11649 thiss!1427) (index!41452 lt!459887) key!909) lt!459958)))

(declare-fun b!1043690 () Bool)

(assert (=> b!1043690 (= e!591298 (not (arrayContainsKey!0 (array!65752 (store (arr!31627 (_keys!11649 thiss!1427)) (index!41452 lt!459887) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11649 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126561 res!695063) b!1043690))

(declare-fun m!963367 () Bool)

(assert (=> d!126561 m!963367))

(assert (=> b!1043690 m!963249))

(declare-fun m!963369 () Bool)

(assert (=> b!1043690 m!963369))

(assert (=> b!1043557 d!126561))

(declare-fun d!126563 () Bool)

(declare-fun res!695068 () Bool)

(declare-fun e!591303 () Bool)

(assert (=> d!126563 (=> res!695068 e!591303)))

(assert (=> d!126563 (= res!695068 (= (select (arr!31627 lt!459891) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126563 (= (arrayContainsKey!0 lt!459891 key!909 #b00000000000000000000000000000000) e!591303)))

(declare-fun b!1043695 () Bool)

(declare-fun e!591304 () Bool)

(assert (=> b!1043695 (= e!591303 e!591304)))

(declare-fun res!695069 () Bool)

(assert (=> b!1043695 (=> (not res!695069) (not e!591304))))

(assert (=> b!1043695 (= res!695069 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32163 lt!459891)))))

(declare-fun b!1043696 () Bool)

(assert (=> b!1043696 (= e!591304 (arrayContainsKey!0 lt!459891 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126563 (not res!695068)) b!1043695))

(assert (= (and b!1043695 res!695069) b!1043696))

(assert (=> d!126563 m!963345))

(declare-fun m!963371 () Bool)

(assert (=> b!1043696 m!963371))

(assert (=> b!1043557 d!126563))

(declare-fun b!1043697 () Bool)

(declare-fun e!591306 () (_ BitVec 32))

(declare-fun e!591305 () (_ BitVec 32))

(assert (=> b!1043697 (= e!591306 e!591305)))

(declare-fun c!106241 () Bool)

(assert (=> b!1043697 (= c!106241 (validKeyInArray!0 (select (arr!31627 (_keys!11649 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043698 () Bool)

(declare-fun call!44240 () (_ BitVec 32))

(assert (=> b!1043698 (= e!591305 (bvadd #b00000000000000000000000000000001 call!44240))))

(declare-fun b!1043699 () Bool)

(assert (=> b!1043699 (= e!591305 call!44240)))

(declare-fun bm!44237 () Bool)

(assert (=> bm!44237 (= call!44240 (arrayCountValidKeys!0 (_keys!11649 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32163 (_keys!11649 thiss!1427))))))

(declare-fun b!1043700 () Bool)

(assert (=> b!1043700 (= e!591306 #b00000000000000000000000000000000)))

(declare-fun d!126565 () Bool)

(declare-fun lt!459959 () (_ BitVec 32))

(assert (=> d!126565 (and (bvsge lt!459959 #b00000000000000000000000000000000) (bvsle lt!459959 (bvsub (size!32163 (_keys!11649 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126565 (= lt!459959 e!591306)))

(declare-fun c!106240 () Bool)

(assert (=> d!126565 (= c!106240 (bvsge #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))))))

(assert (=> d!126565 (and (bvsle #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32163 (_keys!11649 thiss!1427)) (size!32163 (_keys!11649 thiss!1427))))))

(assert (=> d!126565 (= (arrayCountValidKeys!0 (_keys!11649 thiss!1427) #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) lt!459959)))

(assert (= (and d!126565 c!106240) b!1043700))

(assert (= (and d!126565 (not c!106240)) b!1043697))

(assert (= (and b!1043697 c!106241) b!1043698))

(assert (= (and b!1043697 (not c!106241)) b!1043699))

(assert (= (or b!1043698 b!1043699) bm!44237))

(declare-fun m!963373 () Bool)

(assert (=> b!1043697 m!963373))

(assert (=> b!1043697 m!963373))

(declare-fun m!963375 () Bool)

(assert (=> b!1043697 m!963375))

(declare-fun m!963377 () Bool)

(assert (=> bm!44237 m!963377))

(assert (=> b!1043557 d!126565))

(declare-fun b!1043709 () Bool)

(declare-fun res!695080 () Bool)

(declare-fun e!591312 () Bool)

(assert (=> b!1043709 (=> (not res!695080) (not e!591312))))

(assert (=> b!1043709 (= res!695080 (validKeyInArray!0 (select (arr!31627 (_keys!11649 thiss!1427)) (index!41452 lt!459887))))))

(declare-fun b!1043710 () Bool)

(declare-fun res!695079 () Bool)

(assert (=> b!1043710 (=> (not res!695079) (not e!591312))))

(assert (=> b!1043710 (= res!695079 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1043712 () Bool)

(declare-fun e!591311 () Bool)

(assert (=> b!1043712 (= e!591311 (= (arrayCountValidKeys!0 (array!65752 (store (arr!31627 (_keys!11649 thiss!1427)) (index!41452 lt!459887) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11649 thiss!1427))) #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11649 thiss!1427) #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126567 () Bool)

(assert (=> d!126567 e!591311))

(declare-fun res!695078 () Bool)

(assert (=> d!126567 (=> (not res!695078) (not e!591311))))

(assert (=> d!126567 (= res!695078 (and (bvsge (index!41452 lt!459887) #b00000000000000000000000000000000) (bvslt (index!41452 lt!459887) (size!32163 (_keys!11649 thiss!1427)))))))

(declare-fun lt!459962 () Unit!34053)

(declare-fun choose!82 (array!65751 (_ BitVec 32) (_ BitVec 64)) Unit!34053)

(assert (=> d!126567 (= lt!459962 (choose!82 (_keys!11649 thiss!1427) (index!41452 lt!459887) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126567 e!591312))

(declare-fun res!695081 () Bool)

(assert (=> d!126567 (=> (not res!695081) (not e!591312))))

(assert (=> d!126567 (= res!695081 (and (bvsge (index!41452 lt!459887) #b00000000000000000000000000000000) (bvslt (index!41452 lt!459887) (size!32163 (_keys!11649 thiss!1427)))))))

(assert (=> d!126567 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11649 thiss!1427) (index!41452 lt!459887) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459962)))

(declare-fun b!1043711 () Bool)

(assert (=> b!1043711 (= e!591312 (bvslt (size!32163 (_keys!11649 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!126567 res!695081) b!1043709))

(assert (= (and b!1043709 res!695080) b!1043710))

(assert (= (and b!1043710 res!695079) b!1043711))

(assert (= (and d!126567 res!695078) b!1043712))

(declare-fun m!963379 () Bool)

(assert (=> b!1043709 m!963379))

(assert (=> b!1043709 m!963379))

(declare-fun m!963381 () Bool)

(assert (=> b!1043709 m!963381))

(declare-fun m!963383 () Bool)

(assert (=> b!1043710 m!963383))

(assert (=> b!1043712 m!963249))

(declare-fun m!963385 () Bool)

(assert (=> b!1043712 m!963385))

(assert (=> b!1043712 m!963251))

(declare-fun m!963387 () Bool)

(assert (=> d!126567 m!963387))

(assert (=> b!1043557 d!126567))

(declare-fun d!126569 () Bool)

(declare-fun e!591315 () Bool)

(assert (=> d!126569 e!591315))

(declare-fun res!695084 () Bool)

(assert (=> d!126569 (=> (not res!695084) (not e!591315))))

(assert (=> d!126569 (= res!695084 (and (bvsge (index!41452 lt!459887) #b00000000000000000000000000000000) (bvslt (index!41452 lt!459887) (size!32163 (_keys!11649 thiss!1427)))))))

(declare-fun lt!459965 () Unit!34053)

(declare-fun choose!25 (array!65751 (_ BitVec 32) (_ BitVec 32)) Unit!34053)

(assert (=> d!126569 (= lt!459965 (choose!25 (_keys!11649 thiss!1427) (index!41452 lt!459887) (mask!30480 thiss!1427)))))

(assert (=> d!126569 (validMask!0 (mask!30480 thiss!1427))))

(assert (=> d!126569 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11649 thiss!1427) (index!41452 lt!459887) (mask!30480 thiss!1427)) lt!459965)))

(declare-fun b!1043715 () Bool)

(assert (=> b!1043715 (= e!591315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65752 (store (arr!31627 (_keys!11649 thiss!1427)) (index!41452 lt!459887) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11649 thiss!1427))) (mask!30480 thiss!1427)))))

(assert (= (and d!126569 res!695084) b!1043715))

(declare-fun m!963389 () Bool)

(assert (=> d!126569 m!963389))

(assert (=> d!126569 m!963239))

(assert (=> b!1043715 m!963249))

(declare-fun m!963391 () Bool)

(assert (=> b!1043715 m!963391))

(assert (=> b!1043557 d!126569))

(declare-fun d!126571 () Bool)

(assert (=> d!126571 (= (array_inv!24449 (_keys!11649 thiss!1427)) (bvsge (size!32163 (_keys!11649 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043558 d!126571))

(declare-fun d!126573 () Bool)

(assert (=> d!126573 (= (array_inv!24450 (_values!6386 thiss!1427)) (bvsge (size!32164 (_values!6386 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043558 d!126573))

(declare-fun b!1043716 () Bool)

(declare-fun e!591316 () Bool)

(declare-fun e!591317 () Bool)

(assert (=> b!1043716 (= e!591316 e!591317)))

(declare-fun c!106242 () Bool)

(assert (=> b!1043716 (= c!106242 (validKeyInArray!0 (select (arr!31627 (_keys!11649 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043717 () Bool)

(declare-fun call!44241 () Bool)

(assert (=> b!1043717 (= e!591317 call!44241)))

(declare-fun b!1043718 () Bool)

(declare-fun e!591318 () Bool)

(assert (=> b!1043718 (= e!591318 call!44241)))

(declare-fun d!126575 () Bool)

(declare-fun res!695086 () Bool)

(assert (=> d!126575 (=> res!695086 e!591316)))

(assert (=> d!126575 (= res!695086 (bvsge #b00000000000000000000000000000000 (size!32163 (_keys!11649 thiss!1427))))))

(assert (=> d!126575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11649 thiss!1427) (mask!30480 thiss!1427)) e!591316)))

(declare-fun b!1043719 () Bool)

(assert (=> b!1043719 (= e!591317 e!591318)))

(declare-fun lt!459967 () (_ BitVec 64))

(assert (=> b!1043719 (= lt!459967 (select (arr!31627 (_keys!11649 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459966 () Unit!34053)

(assert (=> b!1043719 (= lt!459966 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11649 thiss!1427) lt!459967 #b00000000000000000000000000000000))))

(assert (=> b!1043719 (arrayContainsKey!0 (_keys!11649 thiss!1427) lt!459967 #b00000000000000000000000000000000)))

(declare-fun lt!459968 () Unit!34053)

(assert (=> b!1043719 (= lt!459968 lt!459966)))

(declare-fun res!695085 () Bool)

(assert (=> b!1043719 (= res!695085 (= (seekEntryOrOpen!0 (select (arr!31627 (_keys!11649 thiss!1427)) #b00000000000000000000000000000000) (_keys!11649 thiss!1427) (mask!30480 thiss!1427)) (Found!9770 #b00000000000000000000000000000000)))))

(assert (=> b!1043719 (=> (not res!695085) (not e!591318))))

(declare-fun bm!44238 () Bool)

(assert (=> bm!44238 (= call!44241 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11649 thiss!1427) (mask!30480 thiss!1427)))))

(assert (= (and d!126575 (not res!695086)) b!1043716))

(assert (= (and b!1043716 c!106242) b!1043719))

(assert (= (and b!1043716 (not c!106242)) b!1043717))

(assert (= (and b!1043719 res!695085) b!1043718))

(assert (= (or b!1043718 b!1043717) bm!44238))

(assert (=> b!1043716 m!963373))

(assert (=> b!1043716 m!963373))

(assert (=> b!1043716 m!963375))

(assert (=> b!1043719 m!963373))

(declare-fun m!963393 () Bool)

(assert (=> b!1043719 m!963393))

(declare-fun m!963395 () Bool)

(assert (=> b!1043719 m!963395))

(assert (=> b!1043719 m!963373))

(declare-fun m!963397 () Bool)

(assert (=> b!1043719 m!963397))

(declare-fun m!963399 () Bool)

(assert (=> bm!44238 m!963399))

(assert (=> b!1043564 d!126575))

(declare-fun mapNonEmpty!38777 () Bool)

(declare-fun mapRes!38777 () Bool)

(declare-fun tp!74403 () Bool)

(declare-fun e!591323 () Bool)

(assert (=> mapNonEmpty!38777 (= mapRes!38777 (and tp!74403 e!591323))))

(declare-fun mapValue!38777 () ValueCell!11684)

(declare-fun mapKey!38777 () (_ BitVec 32))

(declare-fun mapRest!38777 () (Array (_ BitVec 32) ValueCell!11684))

(assert (=> mapNonEmpty!38777 (= mapRest!38768 (store mapRest!38777 mapKey!38777 mapValue!38777))))

(declare-fun b!1043727 () Bool)

(declare-fun e!591324 () Bool)

(assert (=> b!1043727 (= e!591324 tp_is_empty!24775)))

(declare-fun b!1043726 () Bool)

(assert (=> b!1043726 (= e!591323 tp_is_empty!24775)))

(declare-fun mapIsEmpty!38777 () Bool)

(assert (=> mapIsEmpty!38777 mapRes!38777))

(declare-fun condMapEmpty!38777 () Bool)

(declare-fun mapDefault!38777 () ValueCell!11684)

(assert (=> mapNonEmpty!38768 (= condMapEmpty!38777 (= mapRest!38768 ((as const (Array (_ BitVec 32) ValueCell!11684)) mapDefault!38777)))))

(assert (=> mapNonEmpty!38768 (= tp!74387 (and e!591324 mapRes!38777))))

(assert (= (and mapNonEmpty!38768 condMapEmpty!38777) mapIsEmpty!38777))

(assert (= (and mapNonEmpty!38768 (not condMapEmpty!38777)) mapNonEmpty!38777))

(assert (= (and mapNonEmpty!38777 ((_ is ValueCellFull!11684) mapValue!38777)) b!1043726))

(assert (= (and mapNonEmpty!38768 ((_ is ValueCellFull!11684) mapDefault!38777)) b!1043727))

(declare-fun m!963401 () Bool)

(assert (=> mapNonEmpty!38777 m!963401))

(check-sat tp_is_empty!24775 (not d!126549) (not b!1043681) (not b!1043627) (not d!126547) (not b!1043709) (not b!1043712) (not mapNonEmpty!38777) (not b!1043626) (not b!1043672) (not bm!44238) (not d!126569) (not b!1043671) (not b!1043719) (not b!1043696) (not b!1043710) (not bm!44230) b_and!33597 (not b!1043654) (not bm!44233) (not bm!44236) (not d!126561) (not bm!44237) (not b!1043715) (not b!1043687) (not b!1043625) (not d!126567) (not b!1043716) (not b!1043684) (not b!1043690) (not b!1043697) (not b!1043670) (not b_next!21055) (not b!1043644) (not d!126557))
(check-sat b_and!33597 (not b_next!21055))
