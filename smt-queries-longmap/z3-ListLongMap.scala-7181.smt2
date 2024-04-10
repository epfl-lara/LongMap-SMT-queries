; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91934 () Bool)

(assert start!91934)

(declare-fun b!1045573 () Bool)

(declare-fun b_free!21141 () Bool)

(declare-fun b_next!21141 () Bool)

(assert (=> b!1045573 (= b_free!21141 (not b_next!21141))))

(declare-fun tp!74681 () Bool)

(declare-fun b_and!33769 () Bool)

(assert (=> b!1045573 (= tp!74681 b_and!33769)))

(declare-fun b!1045568 () Bool)

(declare-fun e!592702 () Bool)

(declare-fun e!592701 () Bool)

(assert (=> b!1045568 (= e!592702 (not e!592701))))

(declare-fun res!696165 () Bool)

(assert (=> b!1045568 (=> res!696165 e!592701)))

(declare-datatypes ((V!38021 0))(
  ( (V!38022 (val!12481 Int)) )
))
(declare-datatypes ((ValueCell!11727 0))(
  ( (ValueCellFull!11727 (v!15077 V!38021)) (EmptyCell!11727) )
))
(declare-datatypes ((Unit!34153 0))(
  ( (Unit!34154) )
))
(declare-datatypes ((array!65898 0))(
  ( (array!65899 (arr!31695 (Array (_ BitVec 32) (_ BitVec 64))) (size!32230 (_ BitVec 32))) )
))
(declare-datatypes ((array!65900 0))(
  ( (array!65901 (arr!31696 (Array (_ BitVec 32) ValueCell!11727)) (size!32231 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6048 0))(
  ( (LongMapFixedSize!6049 (defaultEntry!6420 Int) (mask!30551 (_ BitVec 32)) (extraKeys!6148 (_ BitVec 32)) (zeroValue!6254 V!38021) (minValue!6254 V!38021) (_size!3079 (_ BitVec 32)) (_keys!11692 array!65898) (_values!6443 array!65900) (_vacant!3079 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15794 0))(
  ( (tuple2!15795 (_1!7908 Unit!34153) (_2!7908 LongMapFixedSize!6048)) )
))
(declare-fun lt!461625 () tuple2!15794)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15796 0))(
  ( (tuple2!15797 (_1!7909 (_ BitVec 64)) (_2!7909 V!38021)) )
))
(declare-datatypes ((List!22020 0))(
  ( (Nil!22017) (Cons!22016 (h!23224 tuple2!15796) (t!31290 List!22020)) )
))
(declare-datatypes ((ListLongMap!13795 0))(
  ( (ListLongMap!13796 (toList!6913 List!22020)) )
))
(declare-fun contains!6082 (ListLongMap!13795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3961 (array!65898 array!65900 (_ BitVec 32) (_ BitVec 32) V!38021 V!38021 (_ BitVec 32) Int) ListLongMap!13795)

(assert (=> b!1045568 (= res!696165 (not (contains!6082 (getCurrentListMap!3961 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625))) key!909)))))

(declare-fun lt!461619 () array!65898)

(declare-fun thiss!1427 () LongMapFixedSize!6048)

(declare-fun lt!461620 () array!65900)

(declare-fun Unit!34155 () Unit!34153)

(declare-fun Unit!34156 () Unit!34153)

(assert (=> b!1045568 (= lt!461625 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3079 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15795 Unit!34155 (LongMapFixedSize!6049 (defaultEntry!6420 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) (bvsub (_size!3079 thiss!1427) #b00000000000000000000000000000001) lt!461619 lt!461620 (bvadd #b00000000000000000000000000000001 (_vacant!3079 thiss!1427)))) (tuple2!15795 Unit!34156 (LongMapFixedSize!6049 (defaultEntry!6420 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) (bvsub (_size!3079 thiss!1427) #b00000000000000000000000000000001) lt!461619 lt!461620 (_vacant!3079 thiss!1427)))))))

(declare-fun -!540 (ListLongMap!13795 (_ BitVec 64)) ListLongMap!13795)

(assert (=> b!1045568 (= (-!540 (getCurrentListMap!3961 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)) key!909) (getCurrentListMap!3961 lt!461619 lt!461620 (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9849 0))(
  ( (MissingZero!9849 (index!41767 (_ BitVec 32))) (Found!9849 (index!41768 (_ BitVec 32))) (Intermediate!9849 (undefined!10661 Bool) (index!41769 (_ BitVec 32)) (x!93393 (_ BitVec 32))) (Undefined!9849) (MissingVacant!9849 (index!41770 (_ BitVec 32))) )
))
(declare-fun lt!461626 () SeekEntryResult!9849)

(declare-fun dynLambda!2010 (Int (_ BitVec 64)) V!38021)

(assert (=> b!1045568 (= lt!461620 (array!65901 (store (arr!31696 (_values!6443 thiss!1427)) (index!41768 lt!461626) (ValueCellFull!11727 (dynLambda!2010 (defaultEntry!6420 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32231 (_values!6443 thiss!1427))))))

(declare-fun lt!461621 () Unit!34153)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!61 (array!65898 array!65900 (_ BitVec 32) (_ BitVec 32) V!38021 V!38021 (_ BitVec 32) (_ BitVec 64) Int) Unit!34153)

(assert (=> b!1045568 (= lt!461621 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!61 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) (index!41768 lt!461626) key!909 (defaultEntry!6420 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045568 (not (arrayContainsKey!0 lt!461619 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461627 () Unit!34153)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65898 (_ BitVec 32) (_ BitVec 64)) Unit!34153)

(assert (=> b!1045568 (= lt!461627 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11692 thiss!1427) (index!41768 lt!461626) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65898 (_ BitVec 32)) Bool)

(assert (=> b!1045568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461619 (mask!30551 thiss!1427))))

(declare-fun lt!461624 () Unit!34153)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65898 (_ BitVec 32) (_ BitVec 32)) Unit!34153)

(assert (=> b!1045568 (= lt!461624 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11692 thiss!1427) (index!41768 lt!461626) (mask!30551 thiss!1427)))))

(declare-datatypes ((List!22021 0))(
  ( (Nil!22018) (Cons!22017 (h!23225 (_ BitVec 64)) (t!31291 List!22021)) )
))
(declare-fun arrayNoDuplicates!0 (array!65898 (_ BitVec 32) List!22021) Bool)

(assert (=> b!1045568 (arrayNoDuplicates!0 lt!461619 #b00000000000000000000000000000000 Nil!22018)))

(declare-fun lt!461622 () Unit!34153)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65898 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22021) Unit!34153)

(assert (=> b!1045568 (= lt!461622 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11692 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41768 lt!461626) #b00000000000000000000000000000000 Nil!22018))))

(declare-fun arrayCountValidKeys!0 (array!65898 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045568 (= (arrayCountValidKeys!0 lt!461619 #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11692 thiss!1427) #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045568 (= lt!461619 (array!65899 (store (arr!31695 (_keys!11692 thiss!1427)) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32230 (_keys!11692 thiss!1427))))))

(declare-fun lt!461623 () Unit!34153)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65898 (_ BitVec 32) (_ BitVec 64)) Unit!34153)

(assert (=> b!1045568 (= lt!461623 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11692 thiss!1427) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045569 () Bool)

(declare-fun e!592699 () Bool)

(assert (=> b!1045569 (= e!592699 e!592702)))

(declare-fun res!696167 () Bool)

(assert (=> b!1045569 (=> (not res!696167) (not e!592702))))

(get-info :version)

(assert (=> b!1045569 (= res!696167 ((_ is Found!9849) lt!461626))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65898 (_ BitVec 32)) SeekEntryResult!9849)

(assert (=> b!1045569 (= lt!461626 (seekEntry!0 key!909 (_keys!11692 thiss!1427) (mask!30551 thiss!1427)))))

(declare-fun b!1045570 () Bool)

(declare-fun e!592698 () Bool)

(declare-fun e!592697 () Bool)

(declare-fun mapRes!38933 () Bool)

(assert (=> b!1045570 (= e!592698 (and e!592697 mapRes!38933))))

(declare-fun condMapEmpty!38933 () Bool)

(declare-fun mapDefault!38933 () ValueCell!11727)

(assert (=> b!1045570 (= condMapEmpty!38933 (= (arr!31696 (_values!6443 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11727)) mapDefault!38933)))))

(declare-fun b!1045571 () Bool)

(assert (=> b!1045571 (= e!592701 (or (not (= (size!32231 (_values!6443 (_2!7908 lt!461625))) (bvadd #b00000000000000000000000000000001 (mask!30551 (_2!7908 lt!461625))))) (not (= (size!32230 (_keys!11692 (_2!7908 lt!461625))) (size!32231 (_values!6443 (_2!7908 lt!461625))))) (bvslt (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000000000000000) (bvslt (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000000) (bvsle (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!38933 () Bool)

(declare-fun tp!74682 () Bool)

(declare-fun e!592700 () Bool)

(assert (=> mapNonEmpty!38933 (= mapRes!38933 (and tp!74682 e!592700))))

(declare-fun mapRest!38933 () (Array (_ BitVec 32) ValueCell!11727))

(declare-fun mapValue!38933 () ValueCell!11727)

(declare-fun mapKey!38933 () (_ BitVec 32))

(assert (=> mapNonEmpty!38933 (= (arr!31696 (_values!6443 thiss!1427)) (store mapRest!38933 mapKey!38933 mapValue!38933))))

(declare-fun b!1045572 () Bool)

(declare-fun tp_is_empty!24861 () Bool)

(assert (=> b!1045572 (= e!592697 tp_is_empty!24861)))

(declare-fun e!592696 () Bool)

(declare-fun array_inv!24483 (array!65898) Bool)

(declare-fun array_inv!24484 (array!65900) Bool)

(assert (=> b!1045573 (= e!592696 (and tp!74681 tp_is_empty!24861 (array_inv!24483 (_keys!11692 thiss!1427)) (array_inv!24484 (_values!6443 thiss!1427)) e!592698))))

(declare-fun b!1045574 () Bool)

(assert (=> b!1045574 (= e!592700 tp_is_empty!24861)))

(declare-fun b!1045575 () Bool)

(declare-fun res!696164 () Bool)

(assert (=> b!1045575 (=> res!696164 e!592701)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045575 (= res!696164 (not (validMask!0 (mask!30551 (_2!7908 lt!461625)))))))

(declare-fun res!696166 () Bool)

(assert (=> start!91934 (=> (not res!696166) (not e!592699))))

(declare-fun valid!2269 (LongMapFixedSize!6048) Bool)

(assert (=> start!91934 (= res!696166 (valid!2269 thiss!1427))))

(assert (=> start!91934 e!592699))

(assert (=> start!91934 e!592696))

(assert (=> start!91934 true))

(declare-fun mapIsEmpty!38933 () Bool)

(assert (=> mapIsEmpty!38933 mapRes!38933))

(declare-fun b!1045576 () Bool)

(declare-fun res!696168 () Bool)

(assert (=> b!1045576 (=> (not res!696168) (not e!592699))))

(assert (=> b!1045576 (= res!696168 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91934 res!696166) b!1045576))

(assert (= (and b!1045576 res!696168) b!1045569))

(assert (= (and b!1045569 res!696167) b!1045568))

(assert (= (and b!1045568 (not res!696165)) b!1045575))

(assert (= (and b!1045575 (not res!696164)) b!1045571))

(assert (= (and b!1045570 condMapEmpty!38933) mapIsEmpty!38933))

(assert (= (and b!1045570 (not condMapEmpty!38933)) mapNonEmpty!38933))

(assert (= (and mapNonEmpty!38933 ((_ is ValueCellFull!11727) mapValue!38933)) b!1045574))

(assert (= (and b!1045570 ((_ is ValueCellFull!11727) mapDefault!38933)) b!1045572))

(assert (= b!1045573 b!1045570))

(assert (= start!91934 b!1045573))

(declare-fun b_lambda!16309 () Bool)

(assert (=> (not b_lambda!16309) (not b!1045568)))

(declare-fun t!31289 () Bool)

(declare-fun tb!7091 () Bool)

(assert (=> (and b!1045573 (= (defaultEntry!6420 thiss!1427) (defaultEntry!6420 thiss!1427)) t!31289) tb!7091))

(declare-fun result!14607 () Bool)

(assert (=> tb!7091 (= result!14607 tp_is_empty!24861)))

(assert (=> b!1045568 t!31289))

(declare-fun b_and!33771 () Bool)

(assert (= b_and!33769 (and (=> t!31289 result!14607) b_and!33771)))

(declare-fun m!965309 () Bool)

(assert (=> start!91934 m!965309))

(declare-fun m!965311 () Bool)

(assert (=> b!1045569 m!965311))

(declare-fun m!965313 () Bool)

(assert (=> b!1045575 m!965313))

(declare-fun m!965315 () Bool)

(assert (=> b!1045573 m!965315))

(declare-fun m!965317 () Bool)

(assert (=> b!1045573 m!965317))

(declare-fun m!965319 () Bool)

(assert (=> b!1045568 m!965319))

(declare-fun m!965321 () Bool)

(assert (=> b!1045568 m!965321))

(declare-fun m!965323 () Bool)

(assert (=> b!1045568 m!965323))

(declare-fun m!965325 () Bool)

(assert (=> b!1045568 m!965325))

(declare-fun m!965327 () Bool)

(assert (=> b!1045568 m!965327))

(declare-fun m!965329 () Bool)

(assert (=> b!1045568 m!965329))

(declare-fun m!965331 () Bool)

(assert (=> b!1045568 m!965331))

(declare-fun m!965333 () Bool)

(assert (=> b!1045568 m!965333))

(declare-fun m!965335 () Bool)

(assert (=> b!1045568 m!965335))

(declare-fun m!965337 () Bool)

(assert (=> b!1045568 m!965337))

(declare-fun m!965339 () Bool)

(assert (=> b!1045568 m!965339))

(declare-fun m!965341 () Bool)

(assert (=> b!1045568 m!965341))

(declare-fun m!965343 () Bool)

(assert (=> b!1045568 m!965343))

(declare-fun m!965345 () Bool)

(assert (=> b!1045568 m!965345))

(declare-fun m!965347 () Bool)

(assert (=> b!1045568 m!965347))

(declare-fun m!965349 () Bool)

(assert (=> b!1045568 m!965349))

(assert (=> b!1045568 m!965343))

(assert (=> b!1045568 m!965335))

(declare-fun m!965351 () Bool)

(assert (=> b!1045568 m!965351))

(declare-fun m!965353 () Bool)

(assert (=> b!1045568 m!965353))

(declare-fun m!965355 () Bool)

(assert (=> mapNonEmpty!38933 m!965355))

(check-sat b_and!33771 (not mapNonEmpty!38933) (not b!1045569) (not b!1045573) (not b!1045568) (not b_next!21141) tp_is_empty!24861 (not start!91934) (not b_lambda!16309) (not b!1045575))
(check-sat b_and!33771 (not b_next!21141))
(get-model)

(declare-fun b_lambda!16313 () Bool)

(assert (= b_lambda!16309 (or (and b!1045573 b_free!21141) b_lambda!16313)))

(check-sat b_and!33771 (not mapNonEmpty!38933) (not b!1045569) (not b!1045573) (not b!1045568) (not b_lambda!16313) (not b!1045575) (not b_next!21141) tp_is_empty!24861 (not start!91934))
(check-sat b_and!33771 (not b_next!21141))
(get-model)

(declare-fun d!126543 () Bool)

(declare-fun res!696190 () Bool)

(declare-fun e!592730 () Bool)

(assert (=> d!126543 (=> (not res!696190) (not e!592730))))

(declare-fun simpleValid!453 (LongMapFixedSize!6048) Bool)

(assert (=> d!126543 (= res!696190 (simpleValid!453 thiss!1427))))

(assert (=> d!126543 (= (valid!2269 thiss!1427) e!592730)))

(declare-fun b!1045614 () Bool)

(declare-fun res!696191 () Bool)

(assert (=> b!1045614 (=> (not res!696191) (not e!592730))))

(assert (=> b!1045614 (= res!696191 (= (arrayCountValidKeys!0 (_keys!11692 thiss!1427) #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) (_size!3079 thiss!1427)))))

(declare-fun b!1045615 () Bool)

(declare-fun res!696192 () Bool)

(assert (=> b!1045615 (=> (not res!696192) (not e!592730))))

(assert (=> b!1045615 (= res!696192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11692 thiss!1427) (mask!30551 thiss!1427)))))

(declare-fun b!1045616 () Bool)

(assert (=> b!1045616 (= e!592730 (arrayNoDuplicates!0 (_keys!11692 thiss!1427) #b00000000000000000000000000000000 Nil!22018))))

(assert (= (and d!126543 res!696190) b!1045614))

(assert (= (and b!1045614 res!696191) b!1045615))

(assert (= (and b!1045615 res!696192) b!1045616))

(declare-fun m!965405 () Bool)

(assert (=> d!126543 m!965405))

(assert (=> b!1045614 m!965331))

(declare-fun m!965407 () Bool)

(assert (=> b!1045615 m!965407))

(declare-fun m!965409 () Bool)

(assert (=> b!1045616 m!965409))

(assert (=> start!91934 d!126543))

(declare-fun b!1045629 () Bool)

(declare-fun c!106314 () Bool)

(declare-fun lt!461663 () (_ BitVec 64))

(assert (=> b!1045629 (= c!106314 (= lt!461663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592739 () SeekEntryResult!9849)

(declare-fun e!592738 () SeekEntryResult!9849)

(assert (=> b!1045629 (= e!592739 e!592738)))

(declare-fun b!1045631 () Bool)

(declare-fun e!592737 () SeekEntryResult!9849)

(assert (=> b!1045631 (= e!592737 e!592739)))

(declare-fun lt!461666 () SeekEntryResult!9849)

(assert (=> b!1045631 (= lt!461663 (select (arr!31695 (_keys!11692 thiss!1427)) (index!41769 lt!461666)))))

(declare-fun c!106315 () Bool)

(assert (=> b!1045631 (= c!106315 (= lt!461663 key!909))))

(declare-fun b!1045632 () Bool)

(assert (=> b!1045632 (= e!592737 Undefined!9849)))

(declare-fun b!1045633 () Bool)

(assert (=> b!1045633 (= e!592739 (Found!9849 (index!41769 lt!461666)))))

(declare-fun b!1045634 () Bool)

(assert (=> b!1045634 (= e!592738 (MissingZero!9849 (index!41769 lt!461666)))))

(declare-fun d!126545 () Bool)

(declare-fun lt!461664 () SeekEntryResult!9849)

(assert (=> d!126545 (and (or ((_ is MissingVacant!9849) lt!461664) (not ((_ is Found!9849) lt!461664)) (and (bvsge (index!41768 lt!461664) #b00000000000000000000000000000000) (bvslt (index!41768 lt!461664) (size!32230 (_keys!11692 thiss!1427))))) (not ((_ is MissingVacant!9849) lt!461664)) (or (not ((_ is Found!9849) lt!461664)) (= (select (arr!31695 (_keys!11692 thiss!1427)) (index!41768 lt!461664)) key!909)))))

(assert (=> d!126545 (= lt!461664 e!592737)))

(declare-fun c!106313 () Bool)

(assert (=> d!126545 (= c!106313 (and ((_ is Intermediate!9849) lt!461666) (undefined!10661 lt!461666)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65898 (_ BitVec 32)) SeekEntryResult!9849)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126545 (= lt!461666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30551 thiss!1427)) key!909 (_keys!11692 thiss!1427) (mask!30551 thiss!1427)))))

(assert (=> d!126545 (validMask!0 (mask!30551 thiss!1427))))

(assert (=> d!126545 (= (seekEntry!0 key!909 (_keys!11692 thiss!1427) (mask!30551 thiss!1427)) lt!461664)))

(declare-fun b!1045630 () Bool)

(declare-fun lt!461665 () SeekEntryResult!9849)

(assert (=> b!1045630 (= e!592738 (ite ((_ is MissingVacant!9849) lt!461665) (MissingZero!9849 (index!41770 lt!461665)) lt!461665))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65898 (_ BitVec 32)) SeekEntryResult!9849)

(assert (=> b!1045630 (= lt!461665 (seekKeyOrZeroReturnVacant!0 (x!93393 lt!461666) (index!41769 lt!461666) (index!41769 lt!461666) key!909 (_keys!11692 thiss!1427) (mask!30551 thiss!1427)))))

(assert (= (and d!126545 c!106313) b!1045632))

(assert (= (and d!126545 (not c!106313)) b!1045631))

(assert (= (and b!1045631 c!106315) b!1045633))

(assert (= (and b!1045631 (not c!106315)) b!1045629))

(assert (= (and b!1045629 c!106314) b!1045634))

(assert (= (and b!1045629 (not c!106314)) b!1045630))

(declare-fun m!965411 () Bool)

(assert (=> b!1045631 m!965411))

(declare-fun m!965413 () Bool)

(assert (=> d!126545 m!965413))

(declare-fun m!965415 () Bool)

(assert (=> d!126545 m!965415))

(assert (=> d!126545 m!965415))

(declare-fun m!965417 () Bool)

(assert (=> d!126545 m!965417))

(declare-fun m!965419 () Bool)

(assert (=> d!126545 m!965419))

(declare-fun m!965421 () Bool)

(assert (=> b!1045630 m!965421))

(assert (=> b!1045569 d!126545))

(declare-fun d!126547 () Bool)

(assert (=> d!126547 (= (validMask!0 (mask!30551 (_2!7908 lt!461625))) (and (or (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000000000000111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000000000001111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000000000011111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000000000111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000000001111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000000011111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000000111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000001111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000011111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000000111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000001111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000011111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000000111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000001111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000011111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000000111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000001111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000011111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000000111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000001111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000011111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000000111111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000001111111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000011111111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00000111111111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00001111111111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00011111111111111111111111111111) (= (mask!30551 (_2!7908 lt!461625)) #b00111111111111111111111111111111)) (bvsle (mask!30551 (_2!7908 lt!461625)) #b00111111111111111111111111111111)))))

(assert (=> b!1045575 d!126547))

(declare-fun d!126549 () Bool)

(assert (=> d!126549 (= (array_inv!24483 (_keys!11692 thiss!1427)) (bvsge (size!32230 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045573 d!126549))

(declare-fun d!126551 () Bool)

(assert (=> d!126551 (= (array_inv!24484 (_values!6443 thiss!1427)) (bvsge (size!32231 (_values!6443 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045573 d!126551))

(declare-fun b!1045644 () Bool)

(declare-fun res!696202 () Bool)

(declare-fun e!592745 () Bool)

(assert (=> b!1045644 (=> (not res!696202) (not e!592745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1045644 (= res!696202 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1045645 () Bool)

(assert (=> b!1045645 (= e!592745 (bvslt (size!32230 (_keys!11692 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1045643 () Bool)

(declare-fun res!696201 () Bool)

(assert (=> b!1045643 (=> (not res!696201) (not e!592745))))

(assert (=> b!1045643 (= res!696201 (validKeyInArray!0 (select (arr!31695 (_keys!11692 thiss!1427)) (index!41768 lt!461626))))))

(declare-fun b!1045646 () Bool)

(declare-fun e!592744 () Bool)

(assert (=> b!1045646 (= e!592744 (= (arrayCountValidKeys!0 (array!65899 (store (arr!31695 (_keys!11692 thiss!1427)) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32230 (_keys!11692 thiss!1427))) #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11692 thiss!1427) #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126553 () Bool)

(assert (=> d!126553 e!592744))

(declare-fun res!696204 () Bool)

(assert (=> d!126553 (=> (not res!696204) (not e!592744))))

(assert (=> d!126553 (= res!696204 (and (bvsge (index!41768 lt!461626) #b00000000000000000000000000000000) (bvslt (index!41768 lt!461626) (size!32230 (_keys!11692 thiss!1427)))))))

(declare-fun lt!461669 () Unit!34153)

(declare-fun choose!82 (array!65898 (_ BitVec 32) (_ BitVec 64)) Unit!34153)

(assert (=> d!126553 (= lt!461669 (choose!82 (_keys!11692 thiss!1427) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126553 e!592745))

(declare-fun res!696203 () Bool)

(assert (=> d!126553 (=> (not res!696203) (not e!592745))))

(assert (=> d!126553 (= res!696203 (and (bvsge (index!41768 lt!461626) #b00000000000000000000000000000000) (bvslt (index!41768 lt!461626) (size!32230 (_keys!11692 thiss!1427)))))))

(assert (=> d!126553 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11692 thiss!1427) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461669)))

(assert (= (and d!126553 res!696203) b!1045643))

(assert (= (and b!1045643 res!696201) b!1045644))

(assert (= (and b!1045644 res!696202) b!1045645))

(assert (= (and d!126553 res!696204) b!1045646))

(declare-fun m!965423 () Bool)

(assert (=> b!1045644 m!965423))

(declare-fun m!965425 () Bool)

(assert (=> b!1045643 m!965425))

(assert (=> b!1045643 m!965425))

(declare-fun m!965427 () Bool)

(assert (=> b!1045643 m!965427))

(assert (=> b!1045646 m!965351))

(declare-fun m!965429 () Bool)

(assert (=> b!1045646 m!965429))

(assert (=> b!1045646 m!965331))

(declare-fun m!965431 () Bool)

(assert (=> d!126553 m!965431))

(assert (=> b!1045568 d!126553))

(declare-fun d!126555 () Bool)

(declare-fun e!592748 () Bool)

(assert (=> d!126555 e!592748))

(declare-fun res!696207 () Bool)

(assert (=> d!126555 (=> (not res!696207) (not e!592748))))

(assert (=> d!126555 (= res!696207 (bvslt (index!41768 lt!461626) (size!32230 (_keys!11692 thiss!1427))))))

(declare-fun lt!461672 () Unit!34153)

(declare-fun choose!121 (array!65898 (_ BitVec 32) (_ BitVec 64)) Unit!34153)

(assert (=> d!126555 (= lt!461672 (choose!121 (_keys!11692 thiss!1427) (index!41768 lt!461626) key!909))))

(assert (=> d!126555 (bvsge (index!41768 lt!461626) #b00000000000000000000000000000000)))

(assert (=> d!126555 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11692 thiss!1427) (index!41768 lt!461626) key!909) lt!461672)))

(declare-fun b!1045649 () Bool)

(assert (=> b!1045649 (= e!592748 (not (arrayContainsKey!0 (array!65899 (store (arr!31695 (_keys!11692 thiss!1427)) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32230 (_keys!11692 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126555 res!696207) b!1045649))

(declare-fun m!965433 () Bool)

(assert (=> d!126555 m!965433))

(assert (=> b!1045649 m!965351))

(declare-fun m!965435 () Bool)

(assert (=> b!1045649 m!965435))

(assert (=> b!1045568 d!126555))

(declare-fun b!1045660 () Bool)

(declare-fun e!592760 () Bool)

(declare-fun e!592758 () Bool)

(assert (=> b!1045660 (= e!592760 e!592758)))

(declare-fun res!696216 () Bool)

(assert (=> b!1045660 (=> (not res!696216) (not e!592758))))

(declare-fun e!592759 () Bool)

(assert (=> b!1045660 (= res!696216 (not e!592759))))

(declare-fun res!696215 () Bool)

(assert (=> b!1045660 (=> (not res!696215) (not e!592759))))

(assert (=> b!1045660 (= res!696215 (validKeyInArray!0 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)))))

(declare-fun b!1045661 () Bool)

(declare-fun e!592757 () Bool)

(declare-fun call!44526 () Bool)

(assert (=> b!1045661 (= e!592757 call!44526)))

(declare-fun bm!44523 () Bool)

(declare-fun c!106318 () Bool)

(assert (=> bm!44523 (= call!44526 (arrayNoDuplicates!0 lt!461619 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106318 (Cons!22017 (select (arr!31695 lt!461619) #b00000000000000000000000000000000) Nil!22018) Nil!22018)))))

(declare-fun b!1045662 () Bool)

(assert (=> b!1045662 (= e!592757 call!44526)))

(declare-fun b!1045664 () Bool)

(assert (=> b!1045664 (= e!592758 e!592757)))

(assert (=> b!1045664 (= c!106318 (validKeyInArray!0 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)))))

(declare-fun b!1045663 () Bool)

(declare-fun contains!6083 (List!22021 (_ BitVec 64)) Bool)

(assert (=> b!1045663 (= e!592759 (contains!6083 Nil!22018 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)))))

(declare-fun d!126557 () Bool)

(declare-fun res!696214 () Bool)

(assert (=> d!126557 (=> res!696214 e!592760)))

(assert (=> d!126557 (= res!696214 (bvsge #b00000000000000000000000000000000 (size!32230 lt!461619)))))

(assert (=> d!126557 (= (arrayNoDuplicates!0 lt!461619 #b00000000000000000000000000000000 Nil!22018) e!592760)))

(assert (= (and d!126557 (not res!696214)) b!1045660))

(assert (= (and b!1045660 res!696215) b!1045663))

(assert (= (and b!1045660 res!696216) b!1045664))

(assert (= (and b!1045664 c!106318) b!1045662))

(assert (= (and b!1045664 (not c!106318)) b!1045661))

(assert (= (or b!1045662 b!1045661) bm!44523))

(declare-fun m!965437 () Bool)

(assert (=> b!1045660 m!965437))

(assert (=> b!1045660 m!965437))

(declare-fun m!965439 () Bool)

(assert (=> b!1045660 m!965439))

(assert (=> bm!44523 m!965437))

(declare-fun m!965441 () Bool)

(assert (=> bm!44523 m!965441))

(assert (=> b!1045664 m!965437))

(assert (=> b!1045664 m!965437))

(assert (=> b!1045664 m!965439))

(assert (=> b!1045663 m!965437))

(assert (=> b!1045663 m!965437))

(declare-fun m!965443 () Bool)

(assert (=> b!1045663 m!965443))

(assert (=> b!1045568 d!126557))

(declare-fun bm!44538 () Bool)

(declare-fun call!44541 () Bool)

(declare-fun lt!461721 () ListLongMap!13795)

(assert (=> bm!44538 (= call!44541 (contains!6082 lt!461721 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045707 () Bool)

(declare-fun e!592791 () Bool)

(assert (=> b!1045707 (= e!592791 (not call!44541))))

(declare-fun bm!44539 () Bool)

(declare-fun call!44546 () ListLongMap!13795)

(declare-fun call!44544 () ListLongMap!13795)

(assert (=> bm!44539 (= call!44546 call!44544)))

(declare-fun b!1045708 () Bool)

(declare-fun e!592797 () Bool)

(declare-fun apply!915 (ListLongMap!13795 (_ BitVec 64)) V!38021)

(assert (=> b!1045708 (= e!592797 (= (apply!915 lt!461721 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6254 (_2!7908 lt!461625))))))

(declare-fun b!1045709 () Bool)

(declare-fun e!592788 () Bool)

(declare-fun get!16562 (ValueCell!11727 V!38021) V!38021)

(assert (=> b!1045709 (= e!592788 (= (apply!915 lt!461721 (select (arr!31695 (_keys!11692 (_2!7908 lt!461625))) #b00000000000000000000000000000000)) (get!16562 (select (arr!31696 (_values!6443 (_2!7908 lt!461625))) #b00000000000000000000000000000000) (dynLambda!2010 (defaultEntry!6420 (_2!7908 lt!461625)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32231 (_values!6443 (_2!7908 lt!461625)))))))

(assert (=> b!1045709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 (_2!7908 lt!461625)))))))

(declare-fun bm!44540 () Bool)

(declare-fun call!44542 () Bool)

(assert (=> bm!44540 (= call!44542 (contains!6082 lt!461721 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045710 () Bool)

(declare-fun c!106332 () Bool)

(assert (=> b!1045710 (= c!106332 (and (not (= (bvand (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592795 () ListLongMap!13795)

(declare-fun e!592799 () ListLongMap!13795)

(assert (=> b!1045710 (= e!592795 e!592799)))

(declare-fun b!1045711 () Bool)

(declare-fun e!592790 () ListLongMap!13795)

(assert (=> b!1045711 (= e!592790 e!592795)))

(declare-fun c!106336 () Bool)

(assert (=> b!1045711 (= c!106336 (and (not (= (bvand (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!44543 () ListLongMap!13795)

(declare-fun call!44545 () ListLongMap!13795)

(declare-fun call!44547 () ListLongMap!13795)

(declare-fun c!106335 () Bool)

(declare-fun bm!44541 () Bool)

(declare-fun +!3113 (ListLongMap!13795 tuple2!15796) ListLongMap!13795)

(assert (=> bm!44541 (= call!44544 (+!3113 (ite c!106335 call!44547 (ite c!106336 call!44543 call!44545)) (ite (or c!106335 c!106336) (tuple2!15797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6254 (_2!7908 lt!461625))) (tuple2!15797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6254 (_2!7908 lt!461625))))))))

(declare-fun b!1045712 () Bool)

(assert (=> b!1045712 (= e!592791 e!592797)))

(declare-fun res!696236 () Bool)

(assert (=> b!1045712 (= res!696236 call!44541)))

(assert (=> b!1045712 (=> (not res!696236) (not e!592797))))

(declare-fun b!1045713 () Bool)

(declare-fun e!592796 () Bool)

(assert (=> b!1045713 (= e!592796 (validKeyInArray!0 (select (arr!31695 (_keys!11692 (_2!7908 lt!461625))) #b00000000000000000000000000000000)))))

(declare-fun b!1045714 () Bool)

(declare-fun e!592787 () Bool)

(assert (=> b!1045714 (= e!592787 (= (apply!915 lt!461721 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6254 (_2!7908 lt!461625))))))

(declare-fun b!1045715 () Bool)

(declare-fun res!696237 () Bool)

(declare-fun e!592792 () Bool)

(assert (=> b!1045715 (=> (not res!696237) (not e!592792))))

(assert (=> b!1045715 (= res!696237 e!592791)))

(declare-fun c!106331 () Bool)

(assert (=> b!1045715 (= c!106331 (not (= (bvand (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045716 () Bool)

(declare-fun res!696239 () Bool)

(assert (=> b!1045716 (=> (not res!696239) (not e!592792))))

(declare-fun e!592789 () Bool)

(assert (=> b!1045716 (= res!696239 e!592789)))

(declare-fun res!696243 () Bool)

(assert (=> b!1045716 (=> res!696243 e!592789)))

(declare-fun e!592794 () Bool)

(assert (=> b!1045716 (= res!696243 (not e!592794))))

(declare-fun res!696238 () Bool)

(assert (=> b!1045716 (=> (not res!696238) (not e!592794))))

(assert (=> b!1045716 (= res!696238 (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 (_2!7908 lt!461625)))))))

(declare-fun bm!44543 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3529 (array!65898 array!65900 (_ BitVec 32) (_ BitVec 32) V!38021 V!38021 (_ BitVec 32) Int) ListLongMap!13795)

(assert (=> bm!44543 (= call!44547 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625))))))

(declare-fun b!1045717 () Bool)

(declare-fun e!592798 () Bool)

(assert (=> b!1045717 (= e!592798 e!592787)))

(declare-fun res!696235 () Bool)

(assert (=> b!1045717 (= res!696235 call!44542)))

(assert (=> b!1045717 (=> (not res!696235) (not e!592787))))

(declare-fun b!1045718 () Bool)

(assert (=> b!1045718 (= e!592794 (validKeyInArray!0 (select (arr!31695 (_keys!11692 (_2!7908 lt!461625))) #b00000000000000000000000000000000)))))

(declare-fun b!1045719 () Bool)

(assert (=> b!1045719 (= e!592789 e!592788)))

(declare-fun res!696242 () Bool)

(assert (=> b!1045719 (=> (not res!696242) (not e!592788))))

(assert (=> b!1045719 (= res!696242 (contains!6082 lt!461721 (select (arr!31695 (_keys!11692 (_2!7908 lt!461625))) #b00000000000000000000000000000000)))))

(assert (=> b!1045719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 (_2!7908 lt!461625)))))))

(declare-fun b!1045720 () Bool)

(declare-fun e!592793 () Unit!34153)

(declare-fun Unit!34159 () Unit!34153)

(assert (=> b!1045720 (= e!592793 Unit!34159)))

(declare-fun b!1045721 () Bool)

(assert (=> b!1045721 (= e!592795 call!44546)))

(declare-fun bm!44544 () Bool)

(assert (=> bm!44544 (= call!44543 call!44547)))

(declare-fun b!1045722 () Bool)

(assert (=> b!1045722 (= e!592790 (+!3113 call!44544 (tuple2!15797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6254 (_2!7908 lt!461625)))))))

(declare-fun b!1045723 () Bool)

(assert (=> b!1045723 (= e!592798 (not call!44542))))

(declare-fun b!1045724 () Bool)

(declare-fun lt!461720 () Unit!34153)

(assert (=> b!1045724 (= e!592793 lt!461720)))

(declare-fun lt!461732 () ListLongMap!13795)

(assert (=> b!1045724 (= lt!461732 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625))))))

(declare-fun lt!461724 () (_ BitVec 64))

(assert (=> b!1045724 (= lt!461724 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461734 () (_ BitVec 64))

(assert (=> b!1045724 (= lt!461734 (select (arr!31695 (_keys!11692 (_2!7908 lt!461625))) #b00000000000000000000000000000000))))

(declare-fun lt!461736 () Unit!34153)

(declare-fun addStillContains!634 (ListLongMap!13795 (_ BitVec 64) V!38021 (_ BitVec 64)) Unit!34153)

(assert (=> b!1045724 (= lt!461736 (addStillContains!634 lt!461732 lt!461724 (zeroValue!6254 (_2!7908 lt!461625)) lt!461734))))

(assert (=> b!1045724 (contains!6082 (+!3113 lt!461732 (tuple2!15797 lt!461724 (zeroValue!6254 (_2!7908 lt!461625)))) lt!461734)))

(declare-fun lt!461731 () Unit!34153)

(assert (=> b!1045724 (= lt!461731 lt!461736)))

(declare-fun lt!461738 () ListLongMap!13795)

(assert (=> b!1045724 (= lt!461738 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625))))))

(declare-fun lt!461737 () (_ BitVec 64))

(assert (=> b!1045724 (= lt!461737 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461719 () (_ BitVec 64))

(assert (=> b!1045724 (= lt!461719 (select (arr!31695 (_keys!11692 (_2!7908 lt!461625))) #b00000000000000000000000000000000))))

(declare-fun lt!461718 () Unit!34153)

(declare-fun addApplyDifferent!494 (ListLongMap!13795 (_ BitVec 64) V!38021 (_ BitVec 64)) Unit!34153)

(assert (=> b!1045724 (= lt!461718 (addApplyDifferent!494 lt!461738 lt!461737 (minValue!6254 (_2!7908 lt!461625)) lt!461719))))

(assert (=> b!1045724 (= (apply!915 (+!3113 lt!461738 (tuple2!15797 lt!461737 (minValue!6254 (_2!7908 lt!461625)))) lt!461719) (apply!915 lt!461738 lt!461719))))

(declare-fun lt!461729 () Unit!34153)

(assert (=> b!1045724 (= lt!461729 lt!461718)))

(declare-fun lt!461726 () ListLongMap!13795)

(assert (=> b!1045724 (= lt!461726 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625))))))

(declare-fun lt!461728 () (_ BitVec 64))

(assert (=> b!1045724 (= lt!461728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461725 () (_ BitVec 64))

(assert (=> b!1045724 (= lt!461725 (select (arr!31695 (_keys!11692 (_2!7908 lt!461625))) #b00000000000000000000000000000000))))

(declare-fun lt!461730 () Unit!34153)

(assert (=> b!1045724 (= lt!461730 (addApplyDifferent!494 lt!461726 lt!461728 (zeroValue!6254 (_2!7908 lt!461625)) lt!461725))))

(assert (=> b!1045724 (= (apply!915 (+!3113 lt!461726 (tuple2!15797 lt!461728 (zeroValue!6254 (_2!7908 lt!461625)))) lt!461725) (apply!915 lt!461726 lt!461725))))

(declare-fun lt!461723 () Unit!34153)

(assert (=> b!1045724 (= lt!461723 lt!461730)))

(declare-fun lt!461722 () ListLongMap!13795)

(assert (=> b!1045724 (= lt!461722 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625))))))

(declare-fun lt!461727 () (_ BitVec 64))

(assert (=> b!1045724 (= lt!461727 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461717 () (_ BitVec 64))

(assert (=> b!1045724 (= lt!461717 (select (arr!31695 (_keys!11692 (_2!7908 lt!461625))) #b00000000000000000000000000000000))))

(assert (=> b!1045724 (= lt!461720 (addApplyDifferent!494 lt!461722 lt!461727 (minValue!6254 (_2!7908 lt!461625)) lt!461717))))

(assert (=> b!1045724 (= (apply!915 (+!3113 lt!461722 (tuple2!15797 lt!461727 (minValue!6254 (_2!7908 lt!461625)))) lt!461717) (apply!915 lt!461722 lt!461717))))

(declare-fun b!1045725 () Bool)

(assert (=> b!1045725 (= e!592799 call!44545)))

(declare-fun bm!44542 () Bool)

(assert (=> bm!44542 (= call!44545 call!44543)))

(declare-fun d!126559 () Bool)

(assert (=> d!126559 e!592792))

(declare-fun res!696241 () Bool)

(assert (=> d!126559 (=> (not res!696241) (not e!592792))))

(assert (=> d!126559 (= res!696241 (or (bvsge #b00000000000000000000000000000000 (size!32230 (_keys!11692 (_2!7908 lt!461625)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 (_2!7908 lt!461625)))))))))

(declare-fun lt!461733 () ListLongMap!13795)

(assert (=> d!126559 (= lt!461721 lt!461733)))

(declare-fun lt!461735 () Unit!34153)

(assert (=> d!126559 (= lt!461735 e!592793)))

(declare-fun c!106333 () Bool)

(assert (=> d!126559 (= c!106333 e!592796)))

(declare-fun res!696240 () Bool)

(assert (=> d!126559 (=> (not res!696240) (not e!592796))))

(assert (=> d!126559 (= res!696240 (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 (_2!7908 lt!461625)))))))

(assert (=> d!126559 (= lt!461733 e!592790)))

(assert (=> d!126559 (= c!106335 (and (not (= (bvand (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126559 (validMask!0 (mask!30551 (_2!7908 lt!461625)))))

(assert (=> d!126559 (= (getCurrentListMap!3961 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625))) lt!461721)))

(declare-fun b!1045726 () Bool)

(assert (=> b!1045726 (= e!592799 call!44546)))

(declare-fun b!1045727 () Bool)

(assert (=> b!1045727 (= e!592792 e!592798)))

(declare-fun c!106334 () Bool)

(assert (=> b!1045727 (= c!106334 (not (= (bvand (extraKeys!6148 (_2!7908 lt!461625)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!126559 c!106335) b!1045722))

(assert (= (and d!126559 (not c!106335)) b!1045711))

(assert (= (and b!1045711 c!106336) b!1045721))

(assert (= (and b!1045711 (not c!106336)) b!1045710))

(assert (= (and b!1045710 c!106332) b!1045726))

(assert (= (and b!1045710 (not c!106332)) b!1045725))

(assert (= (or b!1045726 b!1045725) bm!44542))

(assert (= (or b!1045721 bm!44542) bm!44544))

(assert (= (or b!1045721 b!1045726) bm!44539))

(assert (= (or b!1045722 bm!44544) bm!44543))

(assert (= (or b!1045722 bm!44539) bm!44541))

(assert (= (and d!126559 res!696240) b!1045713))

(assert (= (and d!126559 c!106333) b!1045724))

(assert (= (and d!126559 (not c!106333)) b!1045720))

(assert (= (and d!126559 res!696241) b!1045716))

(assert (= (and b!1045716 res!696238) b!1045718))

(assert (= (and b!1045716 (not res!696243)) b!1045719))

(assert (= (and b!1045719 res!696242) b!1045709))

(assert (= (and b!1045716 res!696239) b!1045715))

(assert (= (and b!1045715 c!106331) b!1045712))

(assert (= (and b!1045715 (not c!106331)) b!1045707))

(assert (= (and b!1045712 res!696236) b!1045708))

(assert (= (or b!1045712 b!1045707) bm!44538))

(assert (= (and b!1045715 res!696237) b!1045727))

(assert (= (and b!1045727 c!106334) b!1045717))

(assert (= (and b!1045727 (not c!106334)) b!1045723))

(assert (= (and b!1045717 res!696235) b!1045714))

(assert (= (or b!1045717 b!1045723) bm!44540))

(declare-fun b_lambda!16315 () Bool)

(assert (=> (not b_lambda!16315) (not b!1045709)))

(declare-fun t!31295 () Bool)

(declare-fun tb!7095 () Bool)

(assert (=> (and b!1045573 (= (defaultEntry!6420 thiss!1427) (defaultEntry!6420 (_2!7908 lt!461625))) t!31295) tb!7095))

(declare-fun result!14615 () Bool)

(assert (=> tb!7095 (= result!14615 tp_is_empty!24861)))

(assert (=> b!1045709 t!31295))

(declare-fun b_and!33777 () Bool)

(assert (= b_and!33771 (and (=> t!31295 result!14615) b_and!33777)))

(declare-fun m!965445 () Bool)

(assert (=> b!1045714 m!965445))

(declare-fun m!965447 () Bool)

(assert (=> b!1045713 m!965447))

(assert (=> b!1045713 m!965447))

(declare-fun m!965449 () Bool)

(assert (=> b!1045713 m!965449))

(declare-fun m!965451 () Bool)

(assert (=> bm!44541 m!965451))

(declare-fun m!965453 () Bool)

(assert (=> b!1045708 m!965453))

(declare-fun m!965455 () Bool)

(assert (=> b!1045724 m!965455))

(declare-fun m!965457 () Bool)

(assert (=> b!1045724 m!965457))

(declare-fun m!965459 () Bool)

(assert (=> b!1045724 m!965459))

(declare-fun m!965461 () Bool)

(assert (=> b!1045724 m!965461))

(assert (=> b!1045724 m!965447))

(declare-fun m!965463 () Bool)

(assert (=> b!1045724 m!965463))

(assert (=> b!1045724 m!965455))

(declare-fun m!965465 () Bool)

(assert (=> b!1045724 m!965465))

(declare-fun m!965467 () Bool)

(assert (=> b!1045724 m!965467))

(declare-fun m!965469 () Bool)

(assert (=> b!1045724 m!965469))

(declare-fun m!965471 () Bool)

(assert (=> b!1045724 m!965471))

(declare-fun m!965473 () Bool)

(assert (=> b!1045724 m!965473))

(declare-fun m!965475 () Bool)

(assert (=> b!1045724 m!965475))

(declare-fun m!965477 () Bool)

(assert (=> b!1045724 m!965477))

(assert (=> b!1045724 m!965463))

(declare-fun m!965479 () Bool)

(assert (=> b!1045724 m!965479))

(assert (=> b!1045724 m!965459))

(declare-fun m!965481 () Bool)

(assert (=> b!1045724 m!965481))

(declare-fun m!965483 () Bool)

(assert (=> b!1045724 m!965483))

(assert (=> b!1045724 m!965481))

(declare-fun m!965485 () Bool)

(assert (=> b!1045724 m!965485))

(assert (=> bm!44543 m!965469))

(declare-fun m!965487 () Bool)

(assert (=> b!1045709 m!965487))

(assert (=> b!1045709 m!965447))

(declare-fun m!965489 () Bool)

(assert (=> b!1045709 m!965489))

(assert (=> b!1045709 m!965447))

(declare-fun m!965491 () Bool)

(assert (=> b!1045709 m!965491))

(assert (=> b!1045709 m!965489))

(assert (=> b!1045709 m!965487))

(declare-fun m!965493 () Bool)

(assert (=> b!1045709 m!965493))

(assert (=> b!1045718 m!965447))

(assert (=> b!1045718 m!965447))

(assert (=> b!1045718 m!965449))

(declare-fun m!965495 () Bool)

(assert (=> b!1045722 m!965495))

(declare-fun m!965497 () Bool)

(assert (=> bm!44540 m!965497))

(assert (=> b!1045719 m!965447))

(assert (=> b!1045719 m!965447))

(declare-fun m!965499 () Bool)

(assert (=> b!1045719 m!965499))

(declare-fun m!965501 () Bool)

(assert (=> bm!44538 m!965501))

(assert (=> d!126559 m!965313))

(assert (=> b!1045568 d!126559))

(declare-fun d!126561 () Bool)

(declare-fun lt!461741 () ListLongMap!13795)

(assert (=> d!126561 (not (contains!6082 lt!461741 key!909))))

(declare-fun removeStrictlySorted!65 (List!22020 (_ BitVec 64)) List!22020)

(assert (=> d!126561 (= lt!461741 (ListLongMap!13796 (removeStrictlySorted!65 (toList!6913 (getCurrentListMap!3961 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427))) key!909)))))

(assert (=> d!126561 (= (-!540 (getCurrentListMap!3961 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)) key!909) lt!461741)))

(declare-fun bs!30531 () Bool)

(assert (= bs!30531 d!126561))

(declare-fun m!965503 () Bool)

(assert (=> bs!30531 m!965503))

(declare-fun m!965505 () Bool)

(assert (=> bs!30531 m!965505))

(assert (=> b!1045568 d!126561))

(declare-fun d!126563 () Bool)

(declare-fun e!592802 () Bool)

(assert (=> d!126563 e!592802))

(declare-fun res!696246 () Bool)

(assert (=> d!126563 (=> (not res!696246) (not e!592802))))

(assert (=> d!126563 (= res!696246 (and (bvsge (index!41768 lt!461626) #b00000000000000000000000000000000) (bvslt (index!41768 lt!461626) (size!32230 (_keys!11692 thiss!1427)))))))

(declare-fun lt!461744 () Unit!34153)

(declare-fun choose!53 (array!65898 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22021) Unit!34153)

(assert (=> d!126563 (= lt!461744 (choose!53 (_keys!11692 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41768 lt!461626) #b00000000000000000000000000000000 Nil!22018))))

(assert (=> d!126563 (bvslt (size!32230 (_keys!11692 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126563 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11692 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41768 lt!461626) #b00000000000000000000000000000000 Nil!22018) lt!461744)))

(declare-fun b!1045730 () Bool)

(assert (=> b!1045730 (= e!592802 (arrayNoDuplicates!0 (array!65899 (store (arr!31695 (_keys!11692 thiss!1427)) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32230 (_keys!11692 thiss!1427))) #b00000000000000000000000000000000 Nil!22018))))

(assert (= (and d!126563 res!696246) b!1045730))

(declare-fun m!965507 () Bool)

(assert (=> d!126563 m!965507))

(assert (=> b!1045730 m!965351))

(declare-fun m!965509 () Bool)

(assert (=> b!1045730 m!965509))

(assert (=> b!1045568 d!126563))

(declare-fun bm!44545 () Bool)

(declare-fun call!44548 () Bool)

(declare-fun lt!461749 () ListLongMap!13795)

(assert (=> bm!44545 (= call!44548 (contains!6082 lt!461749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045731 () Bool)

(declare-fun e!592807 () Bool)

(assert (=> b!1045731 (= e!592807 (not call!44548))))

(declare-fun bm!44546 () Bool)

(declare-fun call!44553 () ListLongMap!13795)

(declare-fun call!44551 () ListLongMap!13795)

(assert (=> bm!44546 (= call!44553 call!44551)))

(declare-fun b!1045732 () Bool)

(declare-fun e!592813 () Bool)

(assert (=> b!1045732 (= e!592813 (= (apply!915 lt!461749 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6254 thiss!1427)))))

(declare-fun e!592804 () Bool)

(declare-fun b!1045733 () Bool)

(assert (=> b!1045733 (= e!592804 (= (apply!915 lt!461749 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)) (get!16562 (select (arr!31696 lt!461620) #b00000000000000000000000000000000) (dynLambda!2010 (defaultEntry!6420 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32231 lt!461620)))))

(assert (=> b!1045733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 lt!461619)))))

(declare-fun bm!44547 () Bool)

(declare-fun call!44549 () Bool)

(assert (=> bm!44547 (= call!44549 (contains!6082 lt!461749 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045734 () Bool)

(declare-fun c!106338 () Bool)

(assert (=> b!1045734 (= c!106338 (and (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592811 () ListLongMap!13795)

(declare-fun e!592815 () ListLongMap!13795)

(assert (=> b!1045734 (= e!592811 e!592815)))

(declare-fun b!1045735 () Bool)

(declare-fun e!592806 () ListLongMap!13795)

(assert (=> b!1045735 (= e!592806 e!592811)))

(declare-fun c!106342 () Bool)

(assert (=> b!1045735 (= c!106342 (and (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44548 () Bool)

(declare-fun call!44550 () ListLongMap!13795)

(declare-fun call!44552 () ListLongMap!13795)

(declare-fun c!106341 () Bool)

(declare-fun call!44554 () ListLongMap!13795)

(assert (=> bm!44548 (= call!44551 (+!3113 (ite c!106341 call!44554 (ite c!106342 call!44550 call!44552)) (ite (or c!106341 c!106342) (tuple2!15797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6254 thiss!1427)) (tuple2!15797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6254 thiss!1427)))))))

(declare-fun b!1045736 () Bool)

(assert (=> b!1045736 (= e!592807 e!592813)))

(declare-fun res!696248 () Bool)

(assert (=> b!1045736 (= res!696248 call!44548)))

(assert (=> b!1045736 (=> (not res!696248) (not e!592813))))

(declare-fun b!1045737 () Bool)

(declare-fun e!592812 () Bool)

(assert (=> b!1045737 (= e!592812 (validKeyInArray!0 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)))))

(declare-fun b!1045738 () Bool)

(declare-fun e!592803 () Bool)

(assert (=> b!1045738 (= e!592803 (= (apply!915 lt!461749 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6254 thiss!1427)))))

(declare-fun b!1045739 () Bool)

(declare-fun res!696249 () Bool)

(declare-fun e!592808 () Bool)

(assert (=> b!1045739 (=> (not res!696249) (not e!592808))))

(assert (=> b!1045739 (= res!696249 e!592807)))

(declare-fun c!106337 () Bool)

(assert (=> b!1045739 (= c!106337 (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045740 () Bool)

(declare-fun res!696251 () Bool)

(assert (=> b!1045740 (=> (not res!696251) (not e!592808))))

(declare-fun e!592805 () Bool)

(assert (=> b!1045740 (= res!696251 e!592805)))

(declare-fun res!696255 () Bool)

(assert (=> b!1045740 (=> res!696255 e!592805)))

(declare-fun e!592810 () Bool)

(assert (=> b!1045740 (= res!696255 (not e!592810))))

(declare-fun res!696250 () Bool)

(assert (=> b!1045740 (=> (not res!696250) (not e!592810))))

(assert (=> b!1045740 (= res!696250 (bvslt #b00000000000000000000000000000000 (size!32230 lt!461619)))))

(declare-fun bm!44550 () Bool)

(assert (=> bm!44550 (= call!44554 (getCurrentListMapNoExtraKeys!3529 lt!461619 lt!461620 (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun b!1045741 () Bool)

(declare-fun e!592814 () Bool)

(assert (=> b!1045741 (= e!592814 e!592803)))

(declare-fun res!696247 () Bool)

(assert (=> b!1045741 (= res!696247 call!44549)))

(assert (=> b!1045741 (=> (not res!696247) (not e!592803))))

(declare-fun b!1045742 () Bool)

(assert (=> b!1045742 (= e!592810 (validKeyInArray!0 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)))))

(declare-fun b!1045743 () Bool)

(assert (=> b!1045743 (= e!592805 e!592804)))

(declare-fun res!696254 () Bool)

(assert (=> b!1045743 (=> (not res!696254) (not e!592804))))

(assert (=> b!1045743 (= res!696254 (contains!6082 lt!461749 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)))))

(assert (=> b!1045743 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 lt!461619)))))

(declare-fun b!1045744 () Bool)

(declare-fun e!592809 () Unit!34153)

(declare-fun Unit!34160 () Unit!34153)

(assert (=> b!1045744 (= e!592809 Unit!34160)))

(declare-fun b!1045745 () Bool)

(assert (=> b!1045745 (= e!592811 call!44553)))

(declare-fun bm!44551 () Bool)

(assert (=> bm!44551 (= call!44550 call!44554)))

(declare-fun b!1045746 () Bool)

(assert (=> b!1045746 (= e!592806 (+!3113 call!44551 (tuple2!15797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6254 thiss!1427))))))

(declare-fun b!1045747 () Bool)

(assert (=> b!1045747 (= e!592814 (not call!44549))))

(declare-fun b!1045748 () Bool)

(declare-fun lt!461748 () Unit!34153)

(assert (=> b!1045748 (= e!592809 lt!461748)))

(declare-fun lt!461760 () ListLongMap!13795)

(assert (=> b!1045748 (= lt!461760 (getCurrentListMapNoExtraKeys!3529 lt!461619 lt!461620 (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun lt!461752 () (_ BitVec 64))

(assert (=> b!1045748 (= lt!461752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461762 () (_ BitVec 64))

(assert (=> b!1045748 (= lt!461762 (select (arr!31695 lt!461619) #b00000000000000000000000000000000))))

(declare-fun lt!461764 () Unit!34153)

(assert (=> b!1045748 (= lt!461764 (addStillContains!634 lt!461760 lt!461752 (zeroValue!6254 thiss!1427) lt!461762))))

(assert (=> b!1045748 (contains!6082 (+!3113 lt!461760 (tuple2!15797 lt!461752 (zeroValue!6254 thiss!1427))) lt!461762)))

(declare-fun lt!461759 () Unit!34153)

(assert (=> b!1045748 (= lt!461759 lt!461764)))

(declare-fun lt!461766 () ListLongMap!13795)

(assert (=> b!1045748 (= lt!461766 (getCurrentListMapNoExtraKeys!3529 lt!461619 lt!461620 (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun lt!461765 () (_ BitVec 64))

(assert (=> b!1045748 (= lt!461765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461747 () (_ BitVec 64))

(assert (=> b!1045748 (= lt!461747 (select (arr!31695 lt!461619) #b00000000000000000000000000000000))))

(declare-fun lt!461746 () Unit!34153)

(assert (=> b!1045748 (= lt!461746 (addApplyDifferent!494 lt!461766 lt!461765 (minValue!6254 thiss!1427) lt!461747))))

(assert (=> b!1045748 (= (apply!915 (+!3113 lt!461766 (tuple2!15797 lt!461765 (minValue!6254 thiss!1427))) lt!461747) (apply!915 lt!461766 lt!461747))))

(declare-fun lt!461757 () Unit!34153)

(assert (=> b!1045748 (= lt!461757 lt!461746)))

(declare-fun lt!461754 () ListLongMap!13795)

(assert (=> b!1045748 (= lt!461754 (getCurrentListMapNoExtraKeys!3529 lt!461619 lt!461620 (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun lt!461756 () (_ BitVec 64))

(assert (=> b!1045748 (= lt!461756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461753 () (_ BitVec 64))

(assert (=> b!1045748 (= lt!461753 (select (arr!31695 lt!461619) #b00000000000000000000000000000000))))

(declare-fun lt!461758 () Unit!34153)

(assert (=> b!1045748 (= lt!461758 (addApplyDifferent!494 lt!461754 lt!461756 (zeroValue!6254 thiss!1427) lt!461753))))

(assert (=> b!1045748 (= (apply!915 (+!3113 lt!461754 (tuple2!15797 lt!461756 (zeroValue!6254 thiss!1427))) lt!461753) (apply!915 lt!461754 lt!461753))))

(declare-fun lt!461751 () Unit!34153)

(assert (=> b!1045748 (= lt!461751 lt!461758)))

(declare-fun lt!461750 () ListLongMap!13795)

(assert (=> b!1045748 (= lt!461750 (getCurrentListMapNoExtraKeys!3529 lt!461619 lt!461620 (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun lt!461755 () (_ BitVec 64))

(assert (=> b!1045748 (= lt!461755 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461745 () (_ BitVec 64))

(assert (=> b!1045748 (= lt!461745 (select (arr!31695 lt!461619) #b00000000000000000000000000000000))))

(assert (=> b!1045748 (= lt!461748 (addApplyDifferent!494 lt!461750 lt!461755 (minValue!6254 thiss!1427) lt!461745))))

(assert (=> b!1045748 (= (apply!915 (+!3113 lt!461750 (tuple2!15797 lt!461755 (minValue!6254 thiss!1427))) lt!461745) (apply!915 lt!461750 lt!461745))))

(declare-fun b!1045749 () Bool)

(assert (=> b!1045749 (= e!592815 call!44552)))

(declare-fun bm!44549 () Bool)

(assert (=> bm!44549 (= call!44552 call!44550)))

(declare-fun d!126565 () Bool)

(assert (=> d!126565 e!592808))

(declare-fun res!696253 () Bool)

(assert (=> d!126565 (=> (not res!696253) (not e!592808))))

(assert (=> d!126565 (= res!696253 (or (bvsge #b00000000000000000000000000000000 (size!32230 lt!461619)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 lt!461619)))))))

(declare-fun lt!461761 () ListLongMap!13795)

(assert (=> d!126565 (= lt!461749 lt!461761)))

(declare-fun lt!461763 () Unit!34153)

(assert (=> d!126565 (= lt!461763 e!592809)))

(declare-fun c!106339 () Bool)

(assert (=> d!126565 (= c!106339 e!592812)))

(declare-fun res!696252 () Bool)

(assert (=> d!126565 (=> (not res!696252) (not e!592812))))

(assert (=> d!126565 (= res!696252 (bvslt #b00000000000000000000000000000000 (size!32230 lt!461619)))))

(assert (=> d!126565 (= lt!461761 e!592806)))

(assert (=> d!126565 (= c!106341 (and (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126565 (validMask!0 (mask!30551 thiss!1427))))

(assert (=> d!126565 (= (getCurrentListMap!3961 lt!461619 lt!461620 (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)) lt!461749)))

(declare-fun b!1045750 () Bool)

(assert (=> b!1045750 (= e!592815 call!44553)))

(declare-fun b!1045751 () Bool)

(assert (=> b!1045751 (= e!592808 e!592814)))

(declare-fun c!106340 () Bool)

(assert (=> b!1045751 (= c!106340 (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!126565 c!106341) b!1045746))

(assert (= (and d!126565 (not c!106341)) b!1045735))

(assert (= (and b!1045735 c!106342) b!1045745))

(assert (= (and b!1045735 (not c!106342)) b!1045734))

(assert (= (and b!1045734 c!106338) b!1045750))

(assert (= (and b!1045734 (not c!106338)) b!1045749))

(assert (= (or b!1045750 b!1045749) bm!44549))

(assert (= (or b!1045745 bm!44549) bm!44551))

(assert (= (or b!1045745 b!1045750) bm!44546))

(assert (= (or b!1045746 bm!44551) bm!44550))

(assert (= (or b!1045746 bm!44546) bm!44548))

(assert (= (and d!126565 res!696252) b!1045737))

(assert (= (and d!126565 c!106339) b!1045748))

(assert (= (and d!126565 (not c!106339)) b!1045744))

(assert (= (and d!126565 res!696253) b!1045740))

(assert (= (and b!1045740 res!696250) b!1045742))

(assert (= (and b!1045740 (not res!696255)) b!1045743))

(assert (= (and b!1045743 res!696254) b!1045733))

(assert (= (and b!1045740 res!696251) b!1045739))

(assert (= (and b!1045739 c!106337) b!1045736))

(assert (= (and b!1045739 (not c!106337)) b!1045731))

(assert (= (and b!1045736 res!696248) b!1045732))

(assert (= (or b!1045736 b!1045731) bm!44545))

(assert (= (and b!1045739 res!696249) b!1045751))

(assert (= (and b!1045751 c!106340) b!1045741))

(assert (= (and b!1045751 (not c!106340)) b!1045747))

(assert (= (and b!1045741 res!696247) b!1045738))

(assert (= (or b!1045741 b!1045747) bm!44547))

(declare-fun b_lambda!16317 () Bool)

(assert (=> (not b_lambda!16317) (not b!1045733)))

(assert (=> b!1045733 t!31289))

(declare-fun b_and!33779 () Bool)

(assert (= b_and!33777 (and (=> t!31289 result!14607) b_and!33779)))

(declare-fun m!965511 () Bool)

(assert (=> b!1045738 m!965511))

(assert (=> b!1045737 m!965437))

(assert (=> b!1045737 m!965437))

(assert (=> b!1045737 m!965439))

(declare-fun m!965513 () Bool)

(assert (=> bm!44548 m!965513))

(declare-fun m!965515 () Bool)

(assert (=> b!1045732 m!965515))

(declare-fun m!965517 () Bool)

(assert (=> b!1045748 m!965517))

(declare-fun m!965519 () Bool)

(assert (=> b!1045748 m!965519))

(declare-fun m!965521 () Bool)

(assert (=> b!1045748 m!965521))

(declare-fun m!965523 () Bool)

(assert (=> b!1045748 m!965523))

(assert (=> b!1045748 m!965437))

(declare-fun m!965525 () Bool)

(assert (=> b!1045748 m!965525))

(assert (=> b!1045748 m!965517))

(declare-fun m!965527 () Bool)

(assert (=> b!1045748 m!965527))

(declare-fun m!965529 () Bool)

(assert (=> b!1045748 m!965529))

(declare-fun m!965531 () Bool)

(assert (=> b!1045748 m!965531))

(declare-fun m!965533 () Bool)

(assert (=> b!1045748 m!965533))

(declare-fun m!965535 () Bool)

(assert (=> b!1045748 m!965535))

(declare-fun m!965537 () Bool)

(assert (=> b!1045748 m!965537))

(declare-fun m!965539 () Bool)

(assert (=> b!1045748 m!965539))

(assert (=> b!1045748 m!965525))

(declare-fun m!965541 () Bool)

(assert (=> b!1045748 m!965541))

(assert (=> b!1045748 m!965521))

(declare-fun m!965543 () Bool)

(assert (=> b!1045748 m!965543))

(declare-fun m!965545 () Bool)

(assert (=> b!1045748 m!965545))

(assert (=> b!1045748 m!965543))

(declare-fun m!965547 () Bool)

(assert (=> b!1045748 m!965547))

(assert (=> bm!44550 m!965531))

(assert (=> b!1045733 m!965353))

(assert (=> b!1045733 m!965437))

(declare-fun m!965549 () Bool)

(assert (=> b!1045733 m!965549))

(assert (=> b!1045733 m!965437))

(declare-fun m!965551 () Bool)

(assert (=> b!1045733 m!965551))

(assert (=> b!1045733 m!965549))

(assert (=> b!1045733 m!965353))

(declare-fun m!965553 () Bool)

(assert (=> b!1045733 m!965553))

(assert (=> b!1045742 m!965437))

(assert (=> b!1045742 m!965437))

(assert (=> b!1045742 m!965439))

(declare-fun m!965555 () Bool)

(assert (=> b!1045746 m!965555))

(declare-fun m!965557 () Bool)

(assert (=> bm!44547 m!965557))

(assert (=> b!1045743 m!965437))

(assert (=> b!1045743 m!965437))

(declare-fun m!965559 () Bool)

(assert (=> b!1045743 m!965559))

(declare-fun m!965561 () Bool)

(assert (=> bm!44545 m!965561))

(assert (=> d!126565 m!965419))

(assert (=> b!1045568 d!126565))

(declare-fun d!126567 () Bool)

(declare-fun e!592821 () Bool)

(assert (=> d!126567 e!592821))

(declare-fun res!696258 () Bool)

(assert (=> d!126567 (=> res!696258 e!592821)))

(declare-fun lt!461778 () Bool)

(assert (=> d!126567 (= res!696258 (not lt!461778))))

(declare-fun lt!461777 () Bool)

(assert (=> d!126567 (= lt!461778 lt!461777)))

(declare-fun lt!461775 () Unit!34153)

(declare-fun e!592820 () Unit!34153)

(assert (=> d!126567 (= lt!461775 e!592820)))

(declare-fun c!106345 () Bool)

(assert (=> d!126567 (= c!106345 lt!461777)))

(declare-fun containsKey!570 (List!22020 (_ BitVec 64)) Bool)

(assert (=> d!126567 (= lt!461777 (containsKey!570 (toList!6913 (getCurrentListMap!3961 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625)))) key!909))))

(assert (=> d!126567 (= (contains!6082 (getCurrentListMap!3961 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625))) key!909) lt!461778)))

(declare-fun b!1045758 () Bool)

(declare-fun lt!461776 () Unit!34153)

(assert (=> b!1045758 (= e!592820 lt!461776)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!403 (List!22020 (_ BitVec 64)) Unit!34153)

(assert (=> b!1045758 (= lt!461776 (lemmaContainsKeyImpliesGetValueByKeyDefined!403 (toList!6913 (getCurrentListMap!3961 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625)))) key!909))))

(declare-datatypes ((Option!646 0))(
  ( (Some!645 (v!15079 V!38021)) (None!644) )
))
(declare-fun isDefined!442 (Option!646) Bool)

(declare-fun getValueByKey!595 (List!22020 (_ BitVec 64)) Option!646)

(assert (=> b!1045758 (isDefined!442 (getValueByKey!595 (toList!6913 (getCurrentListMap!3961 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625)))) key!909))))

(declare-fun b!1045759 () Bool)

(declare-fun Unit!34161 () Unit!34153)

(assert (=> b!1045759 (= e!592820 Unit!34161)))

(declare-fun b!1045760 () Bool)

(assert (=> b!1045760 (= e!592821 (isDefined!442 (getValueByKey!595 (toList!6913 (getCurrentListMap!3961 (_keys!11692 (_2!7908 lt!461625)) (_values!6443 (_2!7908 lt!461625)) (mask!30551 (_2!7908 lt!461625)) (extraKeys!6148 (_2!7908 lt!461625)) (zeroValue!6254 (_2!7908 lt!461625)) (minValue!6254 (_2!7908 lt!461625)) #b00000000000000000000000000000000 (defaultEntry!6420 (_2!7908 lt!461625)))) key!909)))))

(assert (= (and d!126567 c!106345) b!1045758))

(assert (= (and d!126567 (not c!106345)) b!1045759))

(assert (= (and d!126567 (not res!696258)) b!1045760))

(declare-fun m!965563 () Bool)

(assert (=> d!126567 m!965563))

(declare-fun m!965565 () Bool)

(assert (=> b!1045758 m!965565))

(declare-fun m!965567 () Bool)

(assert (=> b!1045758 m!965567))

(assert (=> b!1045758 m!965567))

(declare-fun m!965569 () Bool)

(assert (=> b!1045758 m!965569))

(assert (=> b!1045760 m!965567))

(assert (=> b!1045760 m!965567))

(assert (=> b!1045760 m!965569))

(assert (=> b!1045568 d!126567))

(declare-fun d!126569 () Bool)

(declare-fun res!696264 () Bool)

(declare-fun e!592829 () Bool)

(assert (=> d!126569 (=> res!696264 e!592829)))

(assert (=> d!126569 (= res!696264 (bvsge #b00000000000000000000000000000000 (size!32230 lt!461619)))))

(assert (=> d!126569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461619 (mask!30551 thiss!1427)) e!592829)))

(declare-fun b!1045769 () Bool)

(declare-fun e!592830 () Bool)

(declare-fun e!592828 () Bool)

(assert (=> b!1045769 (= e!592830 e!592828)))

(declare-fun lt!461785 () (_ BitVec 64))

(assert (=> b!1045769 (= lt!461785 (select (arr!31695 lt!461619) #b00000000000000000000000000000000))))

(declare-fun lt!461787 () Unit!34153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65898 (_ BitVec 64) (_ BitVec 32)) Unit!34153)

(assert (=> b!1045769 (= lt!461787 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461619 lt!461785 #b00000000000000000000000000000000))))

(assert (=> b!1045769 (arrayContainsKey!0 lt!461619 lt!461785 #b00000000000000000000000000000000)))

(declare-fun lt!461786 () Unit!34153)

(assert (=> b!1045769 (= lt!461786 lt!461787)))

(declare-fun res!696263 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65898 (_ BitVec 32)) SeekEntryResult!9849)

(assert (=> b!1045769 (= res!696263 (= (seekEntryOrOpen!0 (select (arr!31695 lt!461619) #b00000000000000000000000000000000) lt!461619 (mask!30551 thiss!1427)) (Found!9849 #b00000000000000000000000000000000)))))

(assert (=> b!1045769 (=> (not res!696263) (not e!592828))))

(declare-fun b!1045770 () Bool)

(assert (=> b!1045770 (= e!592829 e!592830)))

(declare-fun c!106348 () Bool)

(assert (=> b!1045770 (= c!106348 (validKeyInArray!0 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)))))

(declare-fun b!1045771 () Bool)

(declare-fun call!44557 () Bool)

(assert (=> b!1045771 (= e!592828 call!44557)))

(declare-fun bm!44554 () Bool)

(assert (=> bm!44554 (= call!44557 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461619 (mask!30551 thiss!1427)))))

(declare-fun b!1045772 () Bool)

(assert (=> b!1045772 (= e!592830 call!44557)))

(assert (= (and d!126569 (not res!696264)) b!1045770))

(assert (= (and b!1045770 c!106348) b!1045769))

(assert (= (and b!1045770 (not c!106348)) b!1045772))

(assert (= (and b!1045769 res!696263) b!1045771))

(assert (= (or b!1045771 b!1045772) bm!44554))

(assert (=> b!1045769 m!965437))

(declare-fun m!965571 () Bool)

(assert (=> b!1045769 m!965571))

(declare-fun m!965573 () Bool)

(assert (=> b!1045769 m!965573))

(assert (=> b!1045769 m!965437))

(declare-fun m!965575 () Bool)

(assert (=> b!1045769 m!965575))

(assert (=> b!1045770 m!965437))

(assert (=> b!1045770 m!965437))

(assert (=> b!1045770 m!965439))

(declare-fun m!965577 () Bool)

(assert (=> bm!44554 m!965577))

(assert (=> b!1045568 d!126569))

(declare-fun d!126571 () Bool)

(declare-fun res!696269 () Bool)

(declare-fun e!592835 () Bool)

(assert (=> d!126571 (=> res!696269 e!592835)))

(assert (=> d!126571 (= res!696269 (= (select (arr!31695 lt!461619) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126571 (= (arrayContainsKey!0 lt!461619 key!909 #b00000000000000000000000000000000) e!592835)))

(declare-fun b!1045777 () Bool)

(declare-fun e!592836 () Bool)

(assert (=> b!1045777 (= e!592835 e!592836)))

(declare-fun res!696270 () Bool)

(assert (=> b!1045777 (=> (not res!696270) (not e!592836))))

(assert (=> b!1045777 (= res!696270 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32230 lt!461619)))))

(declare-fun b!1045778 () Bool)

(assert (=> b!1045778 (= e!592836 (arrayContainsKey!0 lt!461619 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126571 (not res!696269)) b!1045777))

(assert (= (and b!1045777 res!696270) b!1045778))

(assert (=> d!126571 m!965437))

(declare-fun m!965579 () Bool)

(assert (=> b!1045778 m!965579))

(assert (=> b!1045568 d!126571))

(declare-fun b!1045787 () Bool)

(declare-fun e!592841 () (_ BitVec 32))

(declare-fun e!592842 () (_ BitVec 32))

(assert (=> b!1045787 (= e!592841 e!592842)))

(declare-fun c!106353 () Bool)

(assert (=> b!1045787 (= c!106353 (validKeyInArray!0 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126573 () Bool)

(declare-fun lt!461790 () (_ BitVec 32))

(assert (=> d!126573 (and (bvsge lt!461790 #b00000000000000000000000000000000) (bvsle lt!461790 (bvsub (size!32230 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126573 (= lt!461790 e!592841)))

(declare-fun c!106354 () Bool)

(assert (=> d!126573 (= c!106354 (bvsge #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))))))

(assert (=> d!126573 (and (bvsle #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32230 (_keys!11692 thiss!1427)) (size!32230 (_keys!11692 thiss!1427))))))

(assert (=> d!126573 (= (arrayCountValidKeys!0 (_keys!11692 thiss!1427) #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) lt!461790)))

(declare-fun b!1045788 () Bool)

(declare-fun call!44560 () (_ BitVec 32))

(assert (=> b!1045788 (= e!592842 call!44560)))

(declare-fun b!1045789 () Bool)

(assert (=> b!1045789 (= e!592842 (bvadd #b00000000000000000000000000000001 call!44560))))

(declare-fun bm!44557 () Bool)

(assert (=> bm!44557 (= call!44560 (arrayCountValidKeys!0 (_keys!11692 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32230 (_keys!11692 thiss!1427))))))

(declare-fun b!1045790 () Bool)

(assert (=> b!1045790 (= e!592841 #b00000000000000000000000000000000)))

(assert (= (and d!126573 c!106354) b!1045790))

(assert (= (and d!126573 (not c!106354)) b!1045787))

(assert (= (and b!1045787 c!106353) b!1045789))

(assert (= (and b!1045787 (not c!106353)) b!1045788))

(assert (= (or b!1045789 b!1045788) bm!44557))

(declare-fun m!965581 () Bool)

(assert (=> b!1045787 m!965581))

(assert (=> b!1045787 m!965581))

(declare-fun m!965583 () Bool)

(assert (=> b!1045787 m!965583))

(declare-fun m!965585 () Bool)

(assert (=> bm!44557 m!965585))

(assert (=> b!1045568 d!126573))

(declare-fun d!126575 () Bool)

(declare-fun e!592845 () Bool)

(assert (=> d!126575 e!592845))

(declare-fun res!696273 () Bool)

(assert (=> d!126575 (=> (not res!696273) (not e!592845))))

(assert (=> d!126575 (= res!696273 (and (bvsge (index!41768 lt!461626) #b00000000000000000000000000000000) (bvslt (index!41768 lt!461626) (size!32230 (_keys!11692 thiss!1427)))))))

(declare-fun lt!461793 () Unit!34153)

(declare-fun choose!25 (array!65898 (_ BitVec 32) (_ BitVec 32)) Unit!34153)

(assert (=> d!126575 (= lt!461793 (choose!25 (_keys!11692 thiss!1427) (index!41768 lt!461626) (mask!30551 thiss!1427)))))

(assert (=> d!126575 (validMask!0 (mask!30551 thiss!1427))))

(assert (=> d!126575 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11692 thiss!1427) (index!41768 lt!461626) (mask!30551 thiss!1427)) lt!461793)))

(declare-fun b!1045793 () Bool)

(assert (=> b!1045793 (= e!592845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65899 (store (arr!31695 (_keys!11692 thiss!1427)) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32230 (_keys!11692 thiss!1427))) (mask!30551 thiss!1427)))))

(assert (= (and d!126575 res!696273) b!1045793))

(declare-fun m!965587 () Bool)

(assert (=> d!126575 m!965587))

(assert (=> d!126575 m!965419))

(assert (=> b!1045793 m!965351))

(declare-fun m!965589 () Bool)

(assert (=> b!1045793 m!965589))

(assert (=> b!1045568 d!126575))

(declare-fun b!1045794 () Bool)

(declare-fun e!592846 () (_ BitVec 32))

(declare-fun e!592847 () (_ BitVec 32))

(assert (=> b!1045794 (= e!592846 e!592847)))

(declare-fun c!106355 () Bool)

(assert (=> b!1045794 (= c!106355 (validKeyInArray!0 (select (arr!31695 lt!461619) #b00000000000000000000000000000000)))))

(declare-fun d!126577 () Bool)

(declare-fun lt!461794 () (_ BitVec 32))

(assert (=> d!126577 (and (bvsge lt!461794 #b00000000000000000000000000000000) (bvsle lt!461794 (bvsub (size!32230 lt!461619) #b00000000000000000000000000000000)))))

(assert (=> d!126577 (= lt!461794 e!592846)))

(declare-fun c!106356 () Bool)

(assert (=> d!126577 (= c!106356 (bvsge #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))))))

(assert (=> d!126577 (and (bvsle #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32230 (_keys!11692 thiss!1427)) (size!32230 lt!461619)))))

(assert (=> d!126577 (= (arrayCountValidKeys!0 lt!461619 #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) lt!461794)))

(declare-fun b!1045795 () Bool)

(declare-fun call!44561 () (_ BitVec 32))

(assert (=> b!1045795 (= e!592847 call!44561)))

(declare-fun b!1045796 () Bool)

(assert (=> b!1045796 (= e!592847 (bvadd #b00000000000000000000000000000001 call!44561))))

(declare-fun bm!44558 () Bool)

(assert (=> bm!44558 (= call!44561 (arrayCountValidKeys!0 lt!461619 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32230 (_keys!11692 thiss!1427))))))

(declare-fun b!1045797 () Bool)

(assert (=> b!1045797 (= e!592846 #b00000000000000000000000000000000)))

(assert (= (and d!126577 c!106356) b!1045797))

(assert (= (and d!126577 (not c!106356)) b!1045794))

(assert (= (and b!1045794 c!106355) b!1045796))

(assert (= (and b!1045794 (not c!106355)) b!1045795))

(assert (= (or b!1045796 b!1045795) bm!44558))

(assert (=> b!1045794 m!965437))

(assert (=> b!1045794 m!965437))

(assert (=> b!1045794 m!965439))

(declare-fun m!965591 () Bool)

(assert (=> bm!44558 m!965591))

(assert (=> b!1045568 d!126577))

(declare-fun d!126579 () Bool)

(declare-fun e!592850 () Bool)

(assert (=> d!126579 e!592850))

(declare-fun res!696276 () Bool)

(assert (=> d!126579 (=> (not res!696276) (not e!592850))))

(assert (=> d!126579 (= res!696276 (and (bvsge (index!41768 lt!461626) #b00000000000000000000000000000000) (bvslt (index!41768 lt!461626) (size!32230 (_keys!11692 thiss!1427)))))))

(declare-fun lt!461797 () Unit!34153)

(declare-fun choose!1715 (array!65898 array!65900 (_ BitVec 32) (_ BitVec 32) V!38021 V!38021 (_ BitVec 32) (_ BitVec 64) Int) Unit!34153)

(assert (=> d!126579 (= lt!461797 (choose!1715 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) (index!41768 lt!461626) key!909 (defaultEntry!6420 thiss!1427)))))

(assert (=> d!126579 (validMask!0 (mask!30551 thiss!1427))))

(assert (=> d!126579 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!61 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) (index!41768 lt!461626) key!909 (defaultEntry!6420 thiss!1427)) lt!461797)))

(declare-fun b!1045800 () Bool)

(assert (=> b!1045800 (= e!592850 (= (-!540 (getCurrentListMap!3961 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)) key!909) (getCurrentListMap!3961 (array!65899 (store (arr!31695 (_keys!11692 thiss!1427)) (index!41768 lt!461626) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32230 (_keys!11692 thiss!1427))) (array!65901 (store (arr!31696 (_values!6443 thiss!1427)) (index!41768 lt!461626) (ValueCellFull!11727 (dynLambda!2010 (defaultEntry!6420 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32231 (_values!6443 thiss!1427))) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427))))))

(assert (=> b!1045800 (bvslt (index!41768 lt!461626) (size!32231 (_values!6443 thiss!1427)))))

(assert (= (and d!126579 res!696276) b!1045800))

(declare-fun b_lambda!16319 () Bool)

(assert (=> (not b_lambda!16319) (not b!1045800)))

(assert (=> b!1045800 t!31289))

(declare-fun b_and!33781 () Bool)

(assert (= b_and!33779 (and (=> t!31289 result!14607) b_and!33781)))

(declare-fun m!965593 () Bool)

(assert (=> d!126579 m!965593))

(assert (=> d!126579 m!965419))

(assert (=> b!1045800 m!965351))

(assert (=> b!1045800 m!965353))

(declare-fun m!965595 () Bool)

(assert (=> b!1045800 m!965595))

(assert (=> b!1045800 m!965335))

(assert (=> b!1045800 m!965325))

(assert (=> b!1045800 m!965335))

(assert (=> b!1045800 m!965337))

(assert (=> b!1045568 d!126579))

(declare-fun bm!44559 () Bool)

(declare-fun call!44562 () Bool)

(declare-fun lt!461802 () ListLongMap!13795)

(assert (=> bm!44559 (= call!44562 (contains!6082 lt!461802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045801 () Bool)

(declare-fun e!592855 () Bool)

(assert (=> b!1045801 (= e!592855 (not call!44562))))

(declare-fun bm!44560 () Bool)

(declare-fun call!44567 () ListLongMap!13795)

(declare-fun call!44565 () ListLongMap!13795)

(assert (=> bm!44560 (= call!44567 call!44565)))

(declare-fun b!1045802 () Bool)

(declare-fun e!592861 () Bool)

(assert (=> b!1045802 (= e!592861 (= (apply!915 lt!461802 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6254 thiss!1427)))))

(declare-fun b!1045803 () Bool)

(declare-fun e!592852 () Bool)

(assert (=> b!1045803 (= e!592852 (= (apply!915 lt!461802 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000)) (get!16562 (select (arr!31696 (_values!6443 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2010 (defaultEntry!6420 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32231 (_values!6443 thiss!1427))))))

(assert (=> b!1045803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))))))

(declare-fun bm!44561 () Bool)

(declare-fun call!44563 () Bool)

(assert (=> bm!44561 (= call!44563 (contains!6082 lt!461802 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045804 () Bool)

(declare-fun c!106358 () Bool)

(assert (=> b!1045804 (= c!106358 (and (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592859 () ListLongMap!13795)

(declare-fun e!592863 () ListLongMap!13795)

(assert (=> b!1045804 (= e!592859 e!592863)))

(declare-fun b!1045805 () Bool)

(declare-fun e!592854 () ListLongMap!13795)

(assert (=> b!1045805 (= e!592854 e!592859)))

(declare-fun c!106362 () Bool)

(assert (=> b!1045805 (= c!106362 (and (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!106361 () Bool)

(declare-fun call!44566 () ListLongMap!13795)

(declare-fun call!44564 () ListLongMap!13795)

(declare-fun bm!44562 () Bool)

(declare-fun call!44568 () ListLongMap!13795)

(assert (=> bm!44562 (= call!44565 (+!3113 (ite c!106361 call!44568 (ite c!106362 call!44564 call!44566)) (ite (or c!106361 c!106362) (tuple2!15797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6254 thiss!1427)) (tuple2!15797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6254 thiss!1427)))))))

(declare-fun b!1045806 () Bool)

(assert (=> b!1045806 (= e!592855 e!592861)))

(declare-fun res!696278 () Bool)

(assert (=> b!1045806 (= res!696278 call!44562)))

(assert (=> b!1045806 (=> (not res!696278) (not e!592861))))

(declare-fun b!1045807 () Bool)

(declare-fun e!592860 () Bool)

(assert (=> b!1045807 (= e!592860 (validKeyInArray!0 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045808 () Bool)

(declare-fun e!592851 () Bool)

(assert (=> b!1045808 (= e!592851 (= (apply!915 lt!461802 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6254 thiss!1427)))))

(declare-fun b!1045809 () Bool)

(declare-fun res!696279 () Bool)

(declare-fun e!592856 () Bool)

(assert (=> b!1045809 (=> (not res!696279) (not e!592856))))

(assert (=> b!1045809 (= res!696279 e!592855)))

(declare-fun c!106357 () Bool)

(assert (=> b!1045809 (= c!106357 (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045810 () Bool)

(declare-fun res!696281 () Bool)

(assert (=> b!1045810 (=> (not res!696281) (not e!592856))))

(declare-fun e!592853 () Bool)

(assert (=> b!1045810 (= res!696281 e!592853)))

(declare-fun res!696285 () Bool)

(assert (=> b!1045810 (=> res!696285 e!592853)))

(declare-fun e!592858 () Bool)

(assert (=> b!1045810 (= res!696285 (not e!592858))))

(declare-fun res!696280 () Bool)

(assert (=> b!1045810 (=> (not res!696280) (not e!592858))))

(assert (=> b!1045810 (= res!696280 (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))))))

(declare-fun bm!44564 () Bool)

(assert (=> bm!44564 (= call!44568 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun b!1045811 () Bool)

(declare-fun e!592862 () Bool)

(assert (=> b!1045811 (= e!592862 e!592851)))

(declare-fun res!696277 () Bool)

(assert (=> b!1045811 (= res!696277 call!44563)))

(assert (=> b!1045811 (=> (not res!696277) (not e!592851))))

(declare-fun b!1045812 () Bool)

(assert (=> b!1045812 (= e!592858 (validKeyInArray!0 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045813 () Bool)

(assert (=> b!1045813 (= e!592853 e!592852)))

(declare-fun res!696284 () Bool)

(assert (=> b!1045813 (=> (not res!696284) (not e!592852))))

(assert (=> b!1045813 (= res!696284 (contains!6082 lt!461802 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))))))

(declare-fun b!1045814 () Bool)

(declare-fun e!592857 () Unit!34153)

(declare-fun Unit!34162 () Unit!34153)

(assert (=> b!1045814 (= e!592857 Unit!34162)))

(declare-fun b!1045815 () Bool)

(assert (=> b!1045815 (= e!592859 call!44567)))

(declare-fun bm!44565 () Bool)

(assert (=> bm!44565 (= call!44564 call!44568)))

(declare-fun b!1045816 () Bool)

(assert (=> b!1045816 (= e!592854 (+!3113 call!44565 (tuple2!15797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6254 thiss!1427))))))

(declare-fun b!1045817 () Bool)

(assert (=> b!1045817 (= e!592862 (not call!44563))))

(declare-fun b!1045818 () Bool)

(declare-fun lt!461801 () Unit!34153)

(assert (=> b!1045818 (= e!592857 lt!461801)))

(declare-fun lt!461813 () ListLongMap!13795)

(assert (=> b!1045818 (= lt!461813 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun lt!461805 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461815 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461815 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461817 () Unit!34153)

(assert (=> b!1045818 (= lt!461817 (addStillContains!634 lt!461813 lt!461805 (zeroValue!6254 thiss!1427) lt!461815))))

(assert (=> b!1045818 (contains!6082 (+!3113 lt!461813 (tuple2!15797 lt!461805 (zeroValue!6254 thiss!1427))) lt!461815)))

(declare-fun lt!461812 () Unit!34153)

(assert (=> b!1045818 (= lt!461812 lt!461817)))

(declare-fun lt!461819 () ListLongMap!13795)

(assert (=> b!1045818 (= lt!461819 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun lt!461818 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461818 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461800 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461800 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461799 () Unit!34153)

(assert (=> b!1045818 (= lt!461799 (addApplyDifferent!494 lt!461819 lt!461818 (minValue!6254 thiss!1427) lt!461800))))

(assert (=> b!1045818 (= (apply!915 (+!3113 lt!461819 (tuple2!15797 lt!461818 (minValue!6254 thiss!1427))) lt!461800) (apply!915 lt!461819 lt!461800))))

(declare-fun lt!461810 () Unit!34153)

(assert (=> b!1045818 (= lt!461810 lt!461799)))

(declare-fun lt!461807 () ListLongMap!13795)

(assert (=> b!1045818 (= lt!461807 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun lt!461809 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461806 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461806 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461811 () Unit!34153)

(assert (=> b!1045818 (= lt!461811 (addApplyDifferent!494 lt!461807 lt!461809 (zeroValue!6254 thiss!1427) lt!461806))))

(assert (=> b!1045818 (= (apply!915 (+!3113 lt!461807 (tuple2!15797 lt!461809 (zeroValue!6254 thiss!1427))) lt!461806) (apply!915 lt!461807 lt!461806))))

(declare-fun lt!461804 () Unit!34153)

(assert (=> b!1045818 (= lt!461804 lt!461811)))

(declare-fun lt!461803 () ListLongMap!13795)

(assert (=> b!1045818 (= lt!461803 (getCurrentListMapNoExtraKeys!3529 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)))))

(declare-fun lt!461808 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461798 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461798 (select (arr!31695 (_keys!11692 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045818 (= lt!461801 (addApplyDifferent!494 lt!461803 lt!461808 (minValue!6254 thiss!1427) lt!461798))))

(assert (=> b!1045818 (= (apply!915 (+!3113 lt!461803 (tuple2!15797 lt!461808 (minValue!6254 thiss!1427))) lt!461798) (apply!915 lt!461803 lt!461798))))

(declare-fun b!1045819 () Bool)

(assert (=> b!1045819 (= e!592863 call!44566)))

(declare-fun bm!44563 () Bool)

(assert (=> bm!44563 (= call!44566 call!44564)))

(declare-fun d!126581 () Bool)

(assert (=> d!126581 e!592856))

(declare-fun res!696283 () Bool)

(assert (=> d!126581 (=> (not res!696283) (not e!592856))))

(assert (=> d!126581 (= res!696283 (or (bvsge #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))))))))

(declare-fun lt!461814 () ListLongMap!13795)

(assert (=> d!126581 (= lt!461802 lt!461814)))

(declare-fun lt!461816 () Unit!34153)

(assert (=> d!126581 (= lt!461816 e!592857)))

(declare-fun c!106359 () Bool)

(assert (=> d!126581 (= c!106359 e!592860)))

(declare-fun res!696282 () Bool)

(assert (=> d!126581 (=> (not res!696282) (not e!592860))))

(assert (=> d!126581 (= res!696282 (bvslt #b00000000000000000000000000000000 (size!32230 (_keys!11692 thiss!1427))))))

(assert (=> d!126581 (= lt!461814 e!592854)))

(assert (=> d!126581 (= c!106361 (and (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126581 (validMask!0 (mask!30551 thiss!1427))))

(assert (=> d!126581 (= (getCurrentListMap!3961 (_keys!11692 thiss!1427) (_values!6443 thiss!1427) (mask!30551 thiss!1427) (extraKeys!6148 thiss!1427) (zeroValue!6254 thiss!1427) (minValue!6254 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6420 thiss!1427)) lt!461802)))

(declare-fun b!1045820 () Bool)

(assert (=> b!1045820 (= e!592863 call!44567)))

(declare-fun b!1045821 () Bool)

(assert (=> b!1045821 (= e!592856 e!592862)))

(declare-fun c!106360 () Bool)

(assert (=> b!1045821 (= c!106360 (not (= (bvand (extraKeys!6148 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!126581 c!106361) b!1045816))

(assert (= (and d!126581 (not c!106361)) b!1045805))

(assert (= (and b!1045805 c!106362) b!1045815))

(assert (= (and b!1045805 (not c!106362)) b!1045804))

(assert (= (and b!1045804 c!106358) b!1045820))

(assert (= (and b!1045804 (not c!106358)) b!1045819))

(assert (= (or b!1045820 b!1045819) bm!44563))

(assert (= (or b!1045815 bm!44563) bm!44565))

(assert (= (or b!1045815 b!1045820) bm!44560))

(assert (= (or b!1045816 bm!44565) bm!44564))

(assert (= (or b!1045816 bm!44560) bm!44562))

(assert (= (and d!126581 res!696282) b!1045807))

(assert (= (and d!126581 c!106359) b!1045818))

(assert (= (and d!126581 (not c!106359)) b!1045814))

(assert (= (and d!126581 res!696283) b!1045810))

(assert (= (and b!1045810 res!696280) b!1045812))

(assert (= (and b!1045810 (not res!696285)) b!1045813))

(assert (= (and b!1045813 res!696284) b!1045803))

(assert (= (and b!1045810 res!696281) b!1045809))

(assert (= (and b!1045809 c!106357) b!1045806))

(assert (= (and b!1045809 (not c!106357)) b!1045801))

(assert (= (and b!1045806 res!696278) b!1045802))

(assert (= (or b!1045806 b!1045801) bm!44559))

(assert (= (and b!1045809 res!696279) b!1045821))

(assert (= (and b!1045821 c!106360) b!1045811))

(assert (= (and b!1045821 (not c!106360)) b!1045817))

(assert (= (and b!1045811 res!696277) b!1045808))

(assert (= (or b!1045811 b!1045817) bm!44561))

(declare-fun b_lambda!16321 () Bool)

(assert (=> (not b_lambda!16321) (not b!1045803)))

(assert (=> b!1045803 t!31289))

(declare-fun b_and!33783 () Bool)

(assert (= b_and!33781 (and (=> t!31289 result!14607) b_and!33783)))

(declare-fun m!965597 () Bool)

(assert (=> b!1045808 m!965597))

(assert (=> b!1045807 m!965581))

(assert (=> b!1045807 m!965581))

(assert (=> b!1045807 m!965583))

(declare-fun m!965599 () Bool)

(assert (=> bm!44562 m!965599))

(declare-fun m!965601 () Bool)

(assert (=> b!1045802 m!965601))

(declare-fun m!965603 () Bool)

(assert (=> b!1045818 m!965603))

(declare-fun m!965605 () Bool)

(assert (=> b!1045818 m!965605))

(declare-fun m!965607 () Bool)

(assert (=> b!1045818 m!965607))

(declare-fun m!965609 () Bool)

(assert (=> b!1045818 m!965609))

(assert (=> b!1045818 m!965581))

(declare-fun m!965611 () Bool)

(assert (=> b!1045818 m!965611))

(assert (=> b!1045818 m!965603))

(declare-fun m!965613 () Bool)

(assert (=> b!1045818 m!965613))

(declare-fun m!965615 () Bool)

(assert (=> b!1045818 m!965615))

(declare-fun m!965617 () Bool)

(assert (=> b!1045818 m!965617))

(declare-fun m!965619 () Bool)

(assert (=> b!1045818 m!965619))

(declare-fun m!965621 () Bool)

(assert (=> b!1045818 m!965621))

(declare-fun m!965623 () Bool)

(assert (=> b!1045818 m!965623))

(declare-fun m!965625 () Bool)

(assert (=> b!1045818 m!965625))

(assert (=> b!1045818 m!965611))

(declare-fun m!965627 () Bool)

(assert (=> b!1045818 m!965627))

(assert (=> b!1045818 m!965607))

(declare-fun m!965629 () Bool)

(assert (=> b!1045818 m!965629))

(declare-fun m!965631 () Bool)

(assert (=> b!1045818 m!965631))

(assert (=> b!1045818 m!965629))

(declare-fun m!965633 () Bool)

(assert (=> b!1045818 m!965633))

(assert (=> bm!44564 m!965617))

(assert (=> b!1045803 m!965353))

(assert (=> b!1045803 m!965581))

(declare-fun m!965635 () Bool)

(assert (=> b!1045803 m!965635))

(assert (=> b!1045803 m!965581))

(declare-fun m!965637 () Bool)

(assert (=> b!1045803 m!965637))

(assert (=> b!1045803 m!965635))

(assert (=> b!1045803 m!965353))

(declare-fun m!965639 () Bool)

(assert (=> b!1045803 m!965639))

(assert (=> b!1045812 m!965581))

(assert (=> b!1045812 m!965581))

(assert (=> b!1045812 m!965583))

(declare-fun m!965641 () Bool)

(assert (=> b!1045816 m!965641))

(declare-fun m!965643 () Bool)

(assert (=> bm!44561 m!965643))

(assert (=> b!1045813 m!965581))

(assert (=> b!1045813 m!965581))

(declare-fun m!965645 () Bool)

(assert (=> b!1045813 m!965645))

(declare-fun m!965647 () Bool)

(assert (=> bm!44559 m!965647))

(assert (=> d!126581 m!965419))

(assert (=> b!1045568 d!126581))

(declare-fun mapIsEmpty!38939 () Bool)

(declare-fun mapRes!38939 () Bool)

(assert (=> mapIsEmpty!38939 mapRes!38939))

(declare-fun condMapEmpty!38939 () Bool)

(declare-fun mapDefault!38939 () ValueCell!11727)

(assert (=> mapNonEmpty!38933 (= condMapEmpty!38939 (= mapRest!38933 ((as const (Array (_ BitVec 32) ValueCell!11727)) mapDefault!38939)))))

(declare-fun e!592869 () Bool)

(assert (=> mapNonEmpty!38933 (= tp!74682 (and e!592869 mapRes!38939))))

(declare-fun b!1045829 () Bool)

(assert (=> b!1045829 (= e!592869 tp_is_empty!24861)))

(declare-fun b!1045828 () Bool)

(declare-fun e!592868 () Bool)

(assert (=> b!1045828 (= e!592868 tp_is_empty!24861)))

(declare-fun mapNonEmpty!38939 () Bool)

(declare-fun tp!74691 () Bool)

(assert (=> mapNonEmpty!38939 (= mapRes!38939 (and tp!74691 e!592868))))

(declare-fun mapKey!38939 () (_ BitVec 32))

(declare-fun mapRest!38939 () (Array (_ BitVec 32) ValueCell!11727))

(declare-fun mapValue!38939 () ValueCell!11727)

(assert (=> mapNonEmpty!38939 (= mapRest!38933 (store mapRest!38939 mapKey!38939 mapValue!38939))))

(assert (= (and mapNonEmpty!38933 condMapEmpty!38939) mapIsEmpty!38939))

(assert (= (and mapNonEmpty!38933 (not condMapEmpty!38939)) mapNonEmpty!38939))

(assert (= (and mapNonEmpty!38939 ((_ is ValueCellFull!11727) mapValue!38939)) b!1045828))

(assert (= (and mapNonEmpty!38933 ((_ is ValueCellFull!11727) mapDefault!38939)) b!1045829))

(declare-fun m!965649 () Bool)

(assert (=> mapNonEmpty!38939 m!965649))

(declare-fun b_lambda!16323 () Bool)

(assert (= b_lambda!16319 (or (and b!1045573 b_free!21141) b_lambda!16323)))

(declare-fun b_lambda!16325 () Bool)

(assert (= b_lambda!16317 (or (and b!1045573 b_free!21141) b_lambda!16325)))

(declare-fun b_lambda!16327 () Bool)

(assert (= b_lambda!16321 (or (and b!1045573 b_free!21141) b_lambda!16327)))

(check-sat (not b_lambda!16315) (not b!1045807) (not b!1045615) (not d!126565) (not b!1045770) (not b!1045630) (not b!1045660) (not bm!44550) (not bm!44541) (not d!126567) (not b!1045719) (not d!126563) (not bm!44564) (not b!1045758) (not b!1045812) (not b!1045616) (not bm!44543) (not b!1045643) (not b!1045718) (not b!1045748) (not b_lambda!16325) (not b!1045800) (not b!1045794) (not b!1045730) (not bm!44547) tp_is_empty!24861 (not d!126545) (not b_lambda!16327) (not b!1045722) (not b!1045769) (not b!1045813) (not b!1045808) (not d!126575) (not d!126581) (not b!1045714) (not b!1045803) (not b!1045742) (not bm!44559) (not b!1045746) (not b!1045646) (not b!1045644) (not b!1045778) (not b!1045614) (not bm!44554) (not bm!44523) (not d!126561) (not d!126579) (not bm!44562) (not d!126559) (not b!1045738) (not b!1045816) (not mapNonEmpty!38939) (not bm!44557) (not b_lambda!16313) (not b!1045818) (not b!1045733) (not d!126543) (not b!1045663) (not b!1045713) (not b_lambda!16323) (not b!1045724) (not b!1045793) (not b!1045664) (not b!1045649) (not bm!44545) (not bm!44561) (not bm!44540) (not b!1045787) (not b!1045737) (not b!1045708) (not bm!44558) (not b!1045802) (not b!1045760) (not b!1045709) (not b_next!21141) (not b!1045732) (not d!126555) (not bm!44548) (not b!1045743) (not d!126553) b_and!33783 (not bm!44538))
(check-sat b_and!33783 (not b_next!21141))
